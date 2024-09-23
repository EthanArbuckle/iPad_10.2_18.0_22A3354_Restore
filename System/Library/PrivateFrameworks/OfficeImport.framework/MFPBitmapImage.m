@implementation MFPBitmapImage

- (MFPBitmapImage)initWithBitmapData:(id)a3
{
  id v5;
  MFPBitmapImage *v6;
  MFPBitmapImage *v7;
  OITSUImage *v8;
  OITSUImage *mPhoneBitmapImage;
  CGFloat v10;
  CGFloat v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MFPBitmapImage;
  v6 = -[MFPBitmapImage init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mBitmapData, a3);
    v8 = -[OITSUImage initWithData:]([OITSUImage alloc], "initWithData:", v5);
    mPhoneBitmapImage = v7->mPhoneBitmapImage;
    v7->mPhoneBitmapImage = v8;

    v7->mPixelSize.width = (double)CGImageGetWidth(-[OITSUImage CGImage](v7->mPhoneBitmapImage, "CGImage"));
    v7->mPixelSize.height = (double)CGImageGetHeight(-[OITSUImage CGImage](v7->mPhoneBitmapImage, "CGImage"));
    -[OITSUImage size](v7->mPhoneBitmapImage, "size");
    v7->mPointSize.width = v10;
    v7->mPointSize.height = v11;
  }

  return v7;
}

- (void)drawInRect:(CGRect)a3 fromRect:(CGRect)a4 unit:(int)a5 effect:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  float v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  +[MFPGraphics unitsPerInch:](MFPGraphics, "unitsPerInch:", *(_QWORD *)&a5, a6);
  if ((float)(v15 / 72.0) == 0.0)
  {
    v20 = self->mPointSize.width / self->mPixelSize.width;
    v16 = NSScaleRect2(x, y, width, height, v20);
  }
  else
  {
    v16 = NSScaleRect(x, y, width, height, v15 / 72.0);
  }
  -[OITSUImage drawInRect:fromRect:isFlipped:](self->mPhoneBitmapImage, "drawInRect:fromRect:isFlipped:", 1, v13, v12, v11, v10, v16, v17, v18, v19);
}

- (id)phoneImage
{
  return self->mPhoneBitmapImage;
}

- (CGSize)pixelSize
{
  double width;
  double height;
  CGSize result;

  width = self->mPixelSize.width;
  height = self->mPixelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)pointSize
{
  double width;
  double height;
  CGSize result;

  width = self->mPointSize.width;
  height = self->mPointSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPhoneBitmapImage, 0);
  objc_storeStrong((id *)&self->mBitmapData, 0);
}

@end
