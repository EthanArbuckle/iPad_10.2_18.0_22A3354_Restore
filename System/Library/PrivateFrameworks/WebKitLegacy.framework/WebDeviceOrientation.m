@implementation WebDeviceOrientation

- (WebDeviceOrientation)initWithCoreDeviceOrientation:(void *)a3
{
  WebDeviceOrientation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WebDeviceOrientation;
  v4 = -[WebDeviceOrientation init](&v6, sel_init);
  if (v4)
    v4->m_internal = -[WebDeviceOrientationInternal initWithCoreDeviceOrientation:]([WebDeviceOrientationInternal alloc], "initWithCoreDeviceOrientation:", a3);
  return v4;
}

- (WebDeviceOrientation)initWithCanProvideAlpha:(BOOL)a3 alpha:(double)a4 canProvideBeta:(BOOL)a5 beta:(double)a6 canProvideGamma:(BOOL)a7 gamma:(double)a8
{
  WebDeviceOrientation *v8;
  WebDeviceOrientationInternal *v9;
  void *v10;
  WTF *v11;
  WTF *v13;
  WTF *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WebDeviceOrientation;
  v8 = -[WebDeviceOrientation init](&v15, sel_init);
  if (v8)
  {
    v9 = [WebDeviceOrientationInternal alloc];
    WebCore::DeviceOrientationData::create();
    v14 = v13;
    v8->m_internal = -[WebDeviceOrientationInternal initWithCoreDeviceOrientation:](v9, "initWithCoreDeviceOrientation:", &v14, 0, 0);
    v11 = v14;
    v14 = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 1)
        WTF::fastFree(v11, v10);
      else
        --*(_DWORD *)v11;
    }
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebDeviceOrientation;
  -[WebDeviceOrientation dealloc](&v3, sel_dealloc);
}

@end
