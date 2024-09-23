@implementation SUReflectionView

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUReflectionView;
  -[SUReflectionView dealloc](&v3, sel_dealloc);
}

- (void)setImage:(id)a3
{
  UIImage *image;

  image = self->_image;
  if (image != a3)
  {

    self->_image = (UIImage *)a3;
  }
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGContext *CurrentContext;
  CGColorSpace *DeviceRGB;
  void *v14;
  CGContext *v15;
  CGImage *Image;
  UIImage *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  CGRect v24;

  v23 = *MEMORY[0x24BDAC8D0];
  -[UIImage size](self->_image, "size", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SUReflectionView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextTranslateCTM(CurrentContext, 0.0, v11);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  if (!drawRect____ReflectionGradient)
  {
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0x3FC999999999999AuLL;
    v22 = xmmword_21B558120;
    drawRect____ReflectionGradient = objc_msgSend(objc_alloc(MEMORY[0x24BDF6A90]), "initVerticalWithValues:", &v18);
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", vcvtd_n_u64_f64(v11, 2uLL));
  v15 = CGBitmapContextCreate((void *)objc_msgSend(v14, "mutableBytes"), 1uLL, (unint64_t)v11, 8uLL, 4uLL, DeviceRGB, 1u);
  if (v15)
  {
    objc_msgSend((id)drawRect____ReflectionGradient, "fillRect:inContext:", v15, 0.0, 0.0, 1.0, v11);
    Image = CGBitmapContextCreateImage(v15);
    v24.origin.x = v5;
    v24.origin.y = v7;
    v24.size.width = v9;
    v24.size.height = v11;
    CGContextClipToMask(CurrentContext, v24, Image);
  }
  else
  {
    Image = 0;
  }
  v17 = self->_image;
  -[SUReflectionView bounds](self, "bounds", v18, v19, v20, v21, v22);
  -[UIImage drawInRect:blendMode:alpha:](v17, "drawInRect:blendMode:alpha:", 0);
  CGContextRestoreGState(CurrentContext);
  if (Image)
    CGImageRelease(Image);
  if (DeviceRGB)
    CGColorSpaceRelease(DeviceRGB);

  if (v15)
    CGContextRelease(v15);
}

@end
