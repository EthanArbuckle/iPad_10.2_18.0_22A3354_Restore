@implementation TSKToolbarShadowLayer

- (void)drawInContext:(CGContext *)a3
{
  CGColorSpace *DeviceRGB;
  CGGradient *v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  objc_super v11;
  _QWORD v12[3];
  CGPoint v13;
  CGRect v14;
  CGRect v15;

  v12[2] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)TSKToolbarShadowLayer;
  -[TSKToolbarShadowLayer drawInContext:](&v11, sel_drawInContext_);
  CGContextSaveGState(a3);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v12[0] = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.100000001), "CGColor");
  v12[1] = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor"), "CGColor");
  v6 = CGGradientCreateWithColors(DeviceRGB, (CFArrayRef)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2), 0);
  -[TSKToolbarShadowLayer bounds](self, "bounds");
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  CGContextClipToRect(a3, v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v13.y = CGRectGetHeight(v15);
  v13.x = 0.0;
  CGContextDrawLinearGradient(a3, v6, *MEMORY[0x24BDBEFB0], v13, 0);
  CGGradientRelease(v6);
  CGColorSpaceRelease(DeviceRGB);
  CGContextRestoreGState(a3);
}

@end
