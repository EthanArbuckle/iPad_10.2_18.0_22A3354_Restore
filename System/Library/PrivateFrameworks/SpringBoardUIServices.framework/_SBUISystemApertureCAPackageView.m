@implementation _SBUISystemApertureCAPackageView

- (double)intrinsicPackageSize
{
  if (a1)
    return *(double *)(a1 + 488);
  else
    return 0.0;
}

- (uint64_t)setIntrinsicPackageSize:(double)a3
{
  if (result)
  {
    *(double *)(result + 488) = a2;
    *(double *)(result + 496) = a3;
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGSize result;

  if (self)
  {
    width = self->_intrinsicPackageSize.width;
    height = self->_intrinsicPackageSize.height;
  }
  else
  {
    height = 0.0;
    width = 0.0;
  }
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v10.receiver = self;
    v10.super_class = (Class)_SBUISystemApertureCAPackageView;
    -[BSUICAPackageView sizeThatFits:](&v10, sel_sizeThatFits_, a3.width, a3.height, height);
    width = v6;
    height = v7;
  }
  v8 = width;
  v9 = height;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double width;
  double height;
  objc_super v5;
  CGSize result;

  if (self)
  {
    width = self->_intrinsicPackageSize.width;
    height = self->_intrinsicPackageSize.height;
  }
  else
  {
    height = 0.0;
    width = 0.0;
  }
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v5.receiver = self;
    v5.super_class = (Class)_SBUISystemApertureCAPackageView;
    -[_SBUISystemApertureCAPackageView intrinsicContentSize](&v5, sel_intrinsicContentSize);
  }
  result.height = height;
  result.width = width;
  return result;
}

@end
