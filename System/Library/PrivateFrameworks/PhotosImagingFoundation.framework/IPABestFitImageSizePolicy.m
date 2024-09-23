@implementation IPABestFitImageSizePolicy

- (IPABestFitImageSizePolicy)initWithFitSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  IPABestFitImageSizePolicy *result;
  IPABestFitImageSizePolicy *v6;
  SEL v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  if (a3.height <= 0.0 || a3.width <= 0.0)
  {
    NSStringFromSize(a3);
    objc_claimAutoreleasedReturnValue();
    v6 = (IPABestFitImageSizePolicy *)_PFAssertFailHandler();
    return (IPABestFitImageSizePolicy *)-[IPABestFitImageSizePolicy isBestFitPolicy](v6, v7);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)IPABestFitImageSizePolicy;
    result = -[IPABestFitImageSizePolicy init](&v8, sel_init);
    if (result)
    {
      result->_fitSize.width = width;
      result->_fitSize.height = height;
    }
  }
  return result;
}

- (BOOL)isBestFitPolicy
{
  return 1;
}

- (CGSize)transformSize:(CGSize)result
{
  double width;
  double height;
  double v5;
  double v6;
  double v7;
  IPABestFitImageSizePolicy *v8;
  SEL v9;
  CGSize v10;

  if (result.width < 0.0 || result.height < 0.0)
  {
    NSStringFromSize(result);
    objc_claimAutoreleasedReturnValue();
    v8 = (IPABestFitImageSizePolicy *)_PFAssertFailHandler();
    result.width = -[IPABestFitImageSizePolicy transformScaleForSize:](v8, v9, v10);
    return result;
  }
  if (result.width != 0.0 || result.height != 0.0)
  {
    width = self->_fitSize.width;
    if (result.width <= width)
    {
      height = self->_fitSize.height;
      if (result.height <= height)
        return result;
    }
    else
    {
      height = self->_fitSize.height;
    }
    v5 = result.width / result.height;
    if (result.height == 0.0)
      v6 = 0.0;
    else
      v6 = v5;
    v7 = width / height;
    if (height == 0.0)
      v7 = 0.0;
    if (v6 <= 0.0 || v7 <= 0.0)
    {
      return *(CGSize *)*(_QWORD *)&MEMORY[0x1E0C9D820];
    }
    else if (v6 <= 1.0)
    {
      result.width = v6 * height;
      result.height = height;
    }
    else
    {
      result.width = self->_fitSize.width;
      result.height = width / v6;
    }
  }
  return result;
}

- (double)transformScaleForSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  double result;
  double v9;
  double v10;
  double v11;

  height = a3.height;
  width = a3.width;
  -[IPABestFitImageSizePolicy transformSize:](self, "transformSize:");
  v7 = v6;
  result = v6 / width;
  if (result >= v5 / height)
    result = v5 / height;
  v9 = ceil(v7);
  v10 = ceil(v5);
  while (1)
  {
    v11 = ceil(height * result);
    if (ceil(width * result) <= v9 && v11 <= v10)
      break;
    result = result * 0.999999;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  NSStringFromSize(self->_fitSize);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> size=%@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (IPABestFitImageSizePolicy)initWithCoder:(id)a3
{
  id v3;
  IPABestFitImageSizePolicy *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IPABestFitImageSizePolicy;
  v3 = a3;
  v4 = -[IPAImageSizePolicy initWithCoder:](&v10, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeSizeForKey:", CFSTR("fit size"), v10.receiver, v10.super_class);
  v6 = v5;
  v8 = v7;

  v4->_fitSize.width = v6;
  v4->_fitSize.height = v8;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IPABestFitImageSizePolicy;
  v4 = a3;
  -[IPAImageSizePolicy encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeSize:forKey:", CFSTR("fit size"), self->_fitSize.width, self->_fitSize.height, v5.receiver, v5.super_class);

}

- (BOOL)isEqual:(id)a3
{
  return self->_fitSize.height == *((double *)a3 + 2) && self->_fitSize.width == *((double *)a3 + 1);
}

- (unint64_t)hash
{
  return (16 * (unint64_t)self->_fitSize.width) ^ ((unint64_t)self->_fitSize.width >> 28) ^ (unint64_t)self->_fitSize.height;
}

@end
