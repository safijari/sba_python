#include <pybind11/pybind11.h>
#include <pybind11/stl.h>
#include <vector>

#include "sparse_bundle_adjustment/spa2d.h"

typedef sba::SysSPA2d SPA2d;
typedef sba::Node2d Node2d;
typedef std::vector<Node2d, Eigen::aligned_allocator<Node2d> > NodeVector;


namespace py = pybind11;

PYBIND11_MODULE(sba_cpp, m) {
  py::class_<SPA2d>(m, "SPA2d")
      .def(py::init<>())
      .def("compute", &SPA2d::doSPA)
      .def("add_node",
           [](SPA2d &a, double x, double y, double yaw, int id) {
             Eigen::Vector3d vector(x, y, yaw);
             a.addNode(vector, id);
           })
    .def("add_constraint", [](SPA2d &a, int source_id, int target_id, double xdiff, double ydiff, double yawdiff, vector<vector<double>> inverse_covariance) {
                             Eigen::Matrix<double,3,3> m;
                             m(0,0) = inverse_covariance[0][0];
                             m(0,1) = m(1,0) = inverse_covariance[0][1];
                             m(0,2) = m(2,0) = inverse_covariance[0][2];
                             m(1,1) = inverse_covariance[1][1];
                             m(1,2) = m(2,1) = inverse_covariance[1][2];
                             m(2,2) = inverse_covariance[2][2];

                             Eigen::Vector3d mean(xdiff, ydiff, yawdiff);

                             a.addConstraint(source_id, target_id, mean, m);
                           })
    .def_property_readonly("nodes", &SPA2d::getNodes)
    ;

  py::class_<Node2d>(m, "Node2d")
    .def_property_readonly("x", [](Node2d &a) { return a.trans[0]; })
    .def_property_readonly("y", [](Node2d &a) { return a.trans[1]; })
    .def_property_readonly("yaw", [](Node2d &a) { return a.arot; })
    ;

#ifdef VERSION_INFO
  m.attr("__version__") = VERSION_INFO;
#else
  m.attr("__version__") = "dev";
#endif
}
