@implementation IPABestFitTotalPixelCountImageSizePolicy

- (IPABestFitTotalPixelCountImageSizePolicy)initWithTotalPixelCount:(int64_t)a3
{
  IPABestFitTotalPixelCountImageSizePolicy *result;
  IPABestFitTotalPixelCountImageSizePolicy *v5;
  SEL v6;
  objc_super v7;

  if (a3 <= 0)
  {
    v5 = (IPABestFitTotalPixelCountImageSizePolicy *)_PFAssertFailHandler();
    return (IPABestFitTotalPixelCountImageSizePolicy *)-[IPABestFitTotalPixelCountImageSizePolicy isBestFitPolicy](v5, v6);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)IPABestFitTotalPixelCountImageSizePolicy;
    result = -[IPABestFitTotalPixelCountImageSizePolicy init](&v7, sel_init);
    if (result)
      result->_totalPixelCount = a3;
  }
  return result;
}

- (BOOL)isBestFitPolicy
{
  return 1;
}

- (CGSize)_transformSize:(CGSize)result scale:(double *)a4
{
  double totalPixelCount;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  double v11;

  if (result.width == 0.0 || result.height == 0.0)
    return result;
  totalPixelCount = (double)self->_totalPixelCount;
  v5 = floor(sqrt(totalPixelCount / (result.width / result.height)));
  v6 = ceil(result.width / result.height * v5);
  v7 = floor(sqrt(result.width / result.height * totalPixelCount));
  v8 = ceil(v7 / (result.width / result.height));
  if (v5 * v6 >= v7 * v8)
  {
    if (v5 * v6 <= totalPixelCount)
      goto LABEL_5;
LABEL_7:
    v5 = v8;
    v6 = v7;
    v9 = v7 / result.width;
    goto LABEL_8;
  }
  if (v7 * v8 <= totalPixelCount)
    goto LABEL_7;
LABEL_5:
  v9 = v5 / result.height;
LABEL_8:
  v10 = v6 > result.width;
  if (v5 > result.height)
    v10 = 1;
  if (!v10)
  {
    result.height = v5;
    result.width = v6;
  }
  if (a4)
  {
    v11 = 1.0;
    if (!v10)
      v11 = v9;
    *a4 = v11;
  }
  return result;
}

- (CGSize)transformSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[IPABestFitTotalPixelCountImageSizePolicy _transformSize:scale:](self, "_transformSize:scale:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)transformScaleForSize:(CGSize)a3
{
  double v4;

  v4 = 0.0;
  -[IPABestFitTotalPixelCountImageSizePolicy _transformSize:scale:](self, "_transformSize:scale:", &v4, a3.width, a3.height);
  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> totalPixelCount=%ld"), objc_opt_class(), self, self->_totalPixelCount);
}

- (IPABestFitTotalPixelCountImageSizePolicy)initWithCoder:(id)a3
{
  id v3;
  IPABestFitTotalPixelCountImageSizePolicy *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IPABestFitTotalPixelCountImageSizePolicy;
  v3 = a3;
  v4 = -[IPAImageSizePolicy initWithCoder:](&v7, sel_initWithCoder_, v3);
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("one side"), v7.receiver, v7.super_class);

  v4->_totalPixelCount = v5;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IPABestFitTotalPixelCountImageSizePolicy;
  v4 = a3;
  -[IPAImageSizePolicy encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_totalPixelCount, CFSTR("one side"), v5.receiver, v5.super_class);

}

- (BOOL)isEqual:(id)a3
{
  return self->_totalPixelCount == *((_QWORD *)a3 + 1);
}

- (unint64_t)hash
{
  return self->_totalPixelCount;
}

@end
