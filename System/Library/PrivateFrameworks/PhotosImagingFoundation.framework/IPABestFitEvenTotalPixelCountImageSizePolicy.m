@implementation IPABestFitEvenTotalPixelCountImageSizePolicy

- (IPABestFitEvenTotalPixelCountImageSizePolicy)initWithTotalPixelCount:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IPABestFitEvenTotalPixelCountImageSizePolicy;
  return -[IPABestFitTotalPixelCountImageSizePolicy initWithTotalPixelCount:](&v4, sel_initWithTotalPixelCount_, a3 / 4);
}

- (CGSize)transformSize:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGSize result;

  v7.receiver = self;
  v7.super_class = (Class)IPABestFitEvenTotalPixelCountImageSizePolicy;
  -[IPABestFitTotalPixelCountImageSizePolicy transformSize:](&v7, sel_transformSize_, a3.width, a3.height);
  v4 = v3 + v3;
  v6 = v5 + v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (double)transformScaleForSize:(CGSize)a3
{
  double v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IPABestFitEvenTotalPixelCountImageSizePolicy;
  -[IPABestFitTotalPixelCountImageSizePolicy transformScaleForSize:](&v5, sel_transformScaleForSize_, a3.width, a3.height);
  return v3 + v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> even pixels totalPixelCount=%ld"), objc_opt_class(), self, 4 * self->super._totalPixelCount);
}

@end
