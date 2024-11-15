@implementation OpenCVWrapperContours

- (OpenCVWrapperContours)initWithContours:(void *)a3 originalImageSize:(const MatSize *)a4
{
  OpenCVWrapperContours *v6;
  OpenCVWrapperContours *v7;
  uint64_t *p_contours;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OpenCVWrapperContours;
  v6 = -[OpenCVWrapperContours init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    p_contours = (uint64_t *)&v6->_contours;
    if (&v7->_contours != a3)
      sub_10000A554(p_contours, *(uint64_t ***)a3, *((uint64_t ***)a3 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3));
    v7->_originalImageSize = (Size_<int>)vrev64_s32(*(int32x2_t *)a4->p);
  }
  return v7;
}

- (unint64_t)getContourCount
{
  return 0xAAAAAAAAAAAAAAABLL * (((char *)self->_contours.__end_ - (char *)self->_contours.__begin_) >> 3);
}

- (unint64_t)getPointCountAtContourIndex:(unint64_t)a3
{
  return (uint64_t)(*((_QWORD *)self->_contours.__begin_ + 3 * a3 + 1) - *((_QWORD *)self->_contours.__begin_ + 3 * a3)) >> 3;
}

- (CGPoint)getPointAtContourIndex:(unint64_t)a3 pointIndex:(unint64_t)a4
{
  int *v4;
  double v5;
  double v6;
  CGPoint result;

  v4 = (int *)(*((_QWORD *)self->_contours.__begin_ + 3 * a3) + 8 * a4);
  v5 = (double)*v4;
  v6 = (double)v4[1];
  result.y = v6;
  result.x = v5;
  return result;
}

- (void)contours
{
  return &self->_contours;
}

- (void)originalImageSize
{
  return &self->_originalImageSize;
}

- (void).cxx_destruct
{
  vector<std::vector<cv::Point_<int>>, std::allocator<std::vector<cv::Point_<int>>>> *p_contours;

  p_contours = &self->_contours;
  sub_100008E68((void ***)&p_contours);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
