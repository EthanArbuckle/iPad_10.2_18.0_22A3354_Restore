@implementation IPABestFitImageHeightPolicy

- (IPABestFitImageHeightPolicy)initWithHeight:(double)a3
{
  IPABestFitImageHeightPolicy *result;
  IPABestFitImageHeightPolicy *v5;
  SEL v6;
  objc_super v7;

  if (a3 <= 0.0)
  {
    v5 = (IPABestFitImageHeightPolicy *)_PFAssertFailHandler();
    return (IPABestFitImageHeightPolicy *)-[IPABestFitImageHeightPolicy isBestFitPolicy](v5, v6);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)IPABestFitImageHeightPolicy;
    result = -[IPABestFitImageHeightPolicy init](&v7, sel_init);
    if (result)
      result->_fitHeight = a3;
  }
  return result;
}

- (BOOL)isBestFitPolicy
{
  return 1;
}

- (CGSize)transformSize:(CGSize)result
{
  double fitHeight;
  double v4;
  IPABestFitImageHeightPolicy *v5;
  SEL v6;
  CGSize v7;

  if (result.width < 0.0 || result.height < 0.0)
  {
    NSStringFromSize(result);
    objc_claimAutoreleasedReturnValue();
    v5 = (IPABestFitImageHeightPolicy *)_PFAssertFailHandler();
    result.width = -[IPABestFitImageHeightPolicy transformScaleForSize:](v5, v6, v7);
  }
  else
  {
    fitHeight = self->_fitHeight;
    if (result.height <= fitHeight)
      fitHeight = result.height;
    else
      result.width = result.width * (fitHeight / result.height);
    v4 = fitHeight;
  }
  result.height = v4;
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
  -[IPABestFitImageHeightPolicy transformSize:](self, "transformSize:");
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
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> height=%f"), objc_opt_class(), self, *(_QWORD *)&self->_fitHeight);
}

- (IPABestFitImageHeightPolicy)initWithCoder:(id)a3
{
  id v3;
  IPABestFitImageHeightPolicy *v4;
  double v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IPABestFitImageHeightPolicy;
  v3 = a3;
  v4 = -[IPAImageSizePolicy initWithCoder:](&v8, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("fit height"), v8.receiver, v8.super_class);
  v6 = v5;

  v4->_fitHeight = v6;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IPABestFitImageHeightPolicy;
  v4 = a3;
  -[IPAImageSizePolicy encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("fit height"), self->_fitHeight, v5.receiver, v5.super_class);

}

- (BOOL)isEqual:(id)a3
{
  return self->_fitHeight == *((double *)a3 + 1);
}

- (unint64_t)hash
{
  return (unint64_t)self->_fitHeight;
}

@end
