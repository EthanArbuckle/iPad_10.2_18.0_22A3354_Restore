@implementation OpenCVWrapperCorners

- (OpenCVWrapperCorners)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OpenCVWrapperCorners;
  return -[OpenCVWrapperCorners init](&v3, "init");
}

- (OpenCVWrapperCorners)initWithCorners:(void *)a3
{
  OpenCVWrapperCorners *v4;
  OpenCVWrapperCorners *v5;
  char *p_corners;

  v4 = -[OpenCVWrapperCorners init](self, "init");
  v5 = v4;
  if (v4)
  {
    p_corners = (char *)&v4->_corners;
    if (&v5->_corners != a3)
      sub_10000AA50(p_corners, *(char **)a3, *((_QWORD *)a3 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3));
  }
  return v5;
}

- (unint64_t)getCornerCount
{
  return 0xAAAAAAAAAAAAAAABLL * ((self->_corners.__end_ - self->_corners.__begin_) >> 3);
}

- ($9E75A3F66B6E0EE08D18ACA558C00CC3)getCornerAtIndex:(SEL)a3
{
  *retstr = *($9E75A3F66B6E0EE08D18ACA558C00CC3 *)(*(_QWORD *)&self->var0.y + 24 * a4);
  return self;
}

- (void)corners
{
  return &self->_corners;
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  begin = self->_corners.__begin_;
  if (begin)
  {
    self->_corners.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
