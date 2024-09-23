@implementation BCCacheVendedLayer

- (BCCacheVendedLayer)initWithDebugLayout:(BOOL)a3
{
  _BOOL4 v3;
  BCCacheVendedLayer *v4;
  CALayer *v5;
  double y;
  CGColorSpace *DeviceRGB;
  CAShapeLayer *v8;
  CAShapeLayer *v9;
  CGColor *v10;
  CATextLayer *v11;
  id v12;
  CATextLayer *descriptionLayer;
  CATextLayer *v14;
  objc_super v16;
  CGFloat components[2];
  __int128 v18;
  _OWORD v19[2];
  _OWORD v20[2];

  v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BCCacheVendedLayer;
  v4 = -[BCCacheVendedLayer init](&v16, "init");
  if (v4)
  {
    v5 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    -[BCCacheVendedLayer addSublayer:](v4, "addSublayer:", v5);
    v4->_imageLayer = v5;
    y = CGPointZero.y;
    -[CALayer setAnchorPoint:](v5, "setAnchorPoint:", CGPointZero.x, y);
    -[BCCacheVendedLayer setMasksToBounds:](v4, "setMasksToBounds:", 0);
    if (v3)
    {
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v20[0] = xmmword_26ADB8;
      v20[1] = *(_OWORD *)algn_26ADC8;
      v19[0] = xmmword_26ADD8;
      v19[1] = *(_OWORD *)algn_26ADE8;
      *(_OWORD *)components = xmmword_26ADF8;
      v18 = unk_26AE08;
      -[BCCacheVendedLayer setBorderWidth:](v4, "setBorderWidth:", 0.5);
      sub_157198(v4, DeviceRGB, (const CGFloat *)v19);
      -[CALayer setBorderWidth:](v4->_imageLayer, "setBorderWidth:", 0.5);
      sub_157198(v4->_imageLayer, DeviceRGB, (const CGFloat *)v20);
      v8 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
      -[CAShapeLayer setAnchorPoint:](v8, "setAnchorPoint:", CGPointZero.x, y);
      -[CALayer addSublayer:](v4->_imageLayer, "addSublayer:", v8);
      v4->_stackLayer = v8;
      -[CAShapeLayer setFillColor:](v8, "setFillColor:", 0);
      -[CAShapeLayer setLineWidth:](v4->_stackLayer, "setLineWidth:", 0.5);
      v9 = v4->_stackLayer;
      v10 = CGColorCreate(DeviceRGB, components);
      -[CAShapeLayer setStrokeColor:](v9, "setStrokeColor:", v10);

      CGColorRelease(v10);
      -[CAShapeLayer setZPosition:](v4->_stackLayer, "setZPosition:", 100.0);
      v11 = (CATextLayer *)objc_claimAutoreleasedReturnValue(+[CATextLayer layer](CATextLayer, "layer"));
      -[CATextLayer setAnchorPoint:](v11, "setAnchorPoint:", 0.0, 0.0);
      -[CATextLayer setFontSize:](v11, "setFontSize:", 12.0);
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor")));
      -[CATextLayer setForegroundColor:](v11, "setForegroundColor:", objc_msgSend(v12, "CGColor"));

      -[CATextLayer setBounds:](v11, "setBounds:", 0.0, 0.0, 250.0, 20.0);
      -[CALayer addSublayer:](v4->_imageLayer, "addSublayer:", v11);
      descriptionLayer = v4->_descriptionLayer;
      v4->_descriptionLayer = v11;
      v14 = v11;

      -[CATextLayer setZPosition:](v4->_descriptionLayer, "setZPosition:", 200.0);
      CFRelease(DeviceRGB);

    }
  }
  return v4;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  BICDescribedImage *describedImageRequested;
  objc_super v6;
  uint8_t buf[4];
  BICDescribedImage *v8;

  -[BICDescribedImage setPriority:](self->_describedImageRequested, "setPriority:", 1);
  +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", BICCacheStatsOperationCancelled[0], self->_describedImageRequested);
  v3 = BCImageCacheLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    describedImageRequested = self->_describedImageRequested;
    *(_DWORD *)buf = 138412290;
    v8 = describedImageRequested;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "BCCacheVendedLayer: Lowering priority of %@", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)BCCacheVendedLayer;
  -[BCCacheVendedLayer dealloc](&v6, "dealloc");
}

- (void)setDescribedImage:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  -[BCCacheVendedLayer setDescribedImageShown:](self, "setDescribedImageShown:", v4);
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    -[BCCacheVendedLayer _setDescribedImage:](self, "_setDescribedImage:", v4);
  }
  else
  {
    objc_initWeak(&location, self);
    v5 = objc_msgSend(v4, "copy");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1573EC;
    block[3] = &unk_28BD80;
    objc_copyWeak(&v9, &location);
    v8 = v5;
    v6 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

- (void)_setDescribedImage:(id)a3
{
  void *v4;
  CGImage *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  CGRect v28;
  CGRect v29;

  v27 = a3;
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "image"));
  v5 = (CGImage *)objc_msgSend(v4, "CGImage");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheVendedLayer imageLayer](self, "imageLayer"));
  objc_msgSend(v6, "setContents:", v5);

  v7 = mainScreenScaleFactor();
  v8 = (double)CGImageGetWidth(v5) / v7;
  v9 = (double)CGImageGetHeight(v5) / v7;
  objc_msgSend(v27, "nonShadowArea");
  v29.origin.x = CGRectZero.origin.x;
  v29.origin.y = CGRectZero.origin.y;
  v29.size.width = CGRectZero.size.width;
  v29.size.height = CGRectZero.size.height;
  v10 = 0.0;
  v11 = v9;
  v12 = v8;
  v13 = 0.0;
  if (!CGRectEqualToRect(v28, v29))
  {
    objc_msgSend(v27, "nonShadowArea");
    v13 = v14;
    v10 = v15;
    v12 = v16;
    v11 = v17;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheVendedLayer imageLayer](self, "imageLayer"));
  objc_msgSend(v18, "setBounds:", 0.0, 0.0, v8, v9);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheVendedLayer imageLayer](self, "imageLayer"));
  objc_msgSend(v19, "setPosition:", -v13, -v10);

  -[BCCacheVendedLayer setBounds:](self, "setBounds:", CGPointZero.x, CGPointZero.y, v12, v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheVendedLayer stackLayer](self, "stackLayer"));

  if (v20)
  {
    v21 = objc_msgSend(v27, "stackOutline");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheVendedLayer stackLayer](self, "stackLayer"));
    objc_msgSend(v22, "setPath:", v21);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheVendedLayer descriptionLayer](self, "descriptionLayer"));

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheVendedLayer descriptionLayer](self, "descriptionLayer"));
    objc_msgSend(v25, "setString:", v24);

  }
  +[CATransaction commit](CATransaction, "commit");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheVendedLayer vendedLayerDelegate](self, "vendedLayerDelegate"));
  objc_msgSend(v26, "vendedLayerDidUpdate:", self);

}

- (BOOL)needsNewVersion
{
  return self->needsNewVersion;
}

- (void)setNeedsNewVersion:(BOOL)a3
{
  self->needsNewVersion = a3;
}

- (BCCacheVendedLayerDelegate)vendedLayerDelegate
{
  return self->_vendedLayerDelegate;
}

- (void)setVendedLayerDelegate:(id)a3
{
  self->_vendedLayerDelegate = (BCCacheVendedLayerDelegate *)a3;
}

- (BICDescribedImage)describedImageRequested
{
  return self->_describedImageRequested;
}

- (void)setDescribedImageRequested:(id)a3
{
  objc_storeStrong((id *)&self->_describedImageRequested, a3);
}

- (BICDescribedImage)describedImageShown
{
  return (BICDescribedImage *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDescribedImageShown:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSSet)stackIDs
{
  return self->_stackIDs;
}

- (void)setStackIDs:(id)a3
{
  objc_storeStrong((id *)&self->_stackIDs, a3);
}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (void)setImageLayer:(id)a3
{
  self->_imageLayer = (CALayer *)a3;
}

- (CAShapeLayer)stackLayer
{
  return self->_stackLayer;
}

- (void)setStackLayer:(id)a3
{
  self->_stackLayer = (CAShapeLayer *)a3;
}

- (CATextLayer)descriptionLayer
{
  return self->_descriptionLayer;
}

- (void)setDescriptionLayer:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLayer, 0);
  objc_storeStrong((id *)&self->_stackIDs, 0);
  objc_storeStrong((id *)&self->_describedImageShown, 0);
  objc_storeStrong((id *)&self->_describedImageRequested, 0);
}

@end
