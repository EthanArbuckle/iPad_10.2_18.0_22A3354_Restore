@implementation UIInterfaceOrientationFromCATransform3D

CGFloat ___UIInterfaceOrientationFromCATransform3D_block_invoke()
{
  CATransform3D v1;

  CATransform3DMakeRotation(&v1, 0.0, 0.0, 0.0, 1.0);
  *(CATransform3D *)byte_1ECD826D8 = v1;
  CATransform3DMakeRotation(&v1, -1.57079633, 0.0, 0.0, 1.0);
  *(CATransform3D *)byte_1ECD827D8 = v1;
  CATransform3DMakeRotation(&v1, 1.57079633, 0.0, 0.0, 1.0);
  *(CATransform3D *)byte_1ECD82858 = v1;
  CATransform3DMakeRotation(&v1, 3.14159265, 0.0, 0.0, 1.0);
  *(CATransform3D *)byte_1ECD82758 = v1;
  return v1.m21;
}

@end
