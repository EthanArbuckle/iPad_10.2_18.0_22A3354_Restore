@implementation MapsScreenshotService

- (MapsScreenshotService)initWithDelegate:(id)a3 windowScene:(id)a4
{
  id v6;
  id v7;
  MapsScreenshotService *v8;
  MapsScreenshotService *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MapsScreenshotService;
  v8 = -[MapsScreenshotService init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "screenshotService"));
    objc_msgSend(v10, "setDelegate:", v9);

  }
  return v9;
}

- (void)screenshotService:(id)a3 generatePDFRepresentationWithCompletion:(id)a4
{
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  unsigned __int8 v18;
  WatermarkView *v19;
  id v20;
  WatermarkView *v21;
  void *v22;
  id v23;
  void (**v24)(id, id, id, double, double, double, double);
  _QWORD v25[4];
  id v26;
  MapsScreenshotService *v27;
  WatermarkView *v28;
  double v29;
  double v30;
  double v31;
  double v32;

  v24 = (void (**)(id, id, id, double, double, double, double))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "viewsToRenderMapsScreenshotService:", self));

  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_msgSend(v6, "count");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    objc_msgSend(v8, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
    v18 = objc_msgSend(v17, "isInternalInstall");

    if ((v18 & 1) != 0)
      v19 = -[WatermarkView initWithFrame:]([WatermarkView alloc], "initWithFrame:", v10, v12, v14, v16);
    else
      v19 = 0;
    v20 = objc_msgSend(objc_alloc((Class)UIGraphicsPDFRenderer), "initWithBounds:", v10, v12, v14, v16);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100529C78;
    v25[3] = &unk_1011BA510;
    v26 = v6;
    v27 = self;
    v28 = v19;
    v29 = v10;
    v30 = v12;
    v31 = v14;
    v32 = v16;
    v21 = v19;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "PDFDataWithActions:", v25));
    v23 = objc_msgSend(v22, "copy");
    v24[2](v24, v23, v7, v10, v12, v14, v16);

  }
  else
  {
    v24[2](v24, 0, 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  }

}

- (id)_generateUIImageFromView:(id)a3 withWatermark:(id)a4 size:(CGSize)a5
{
  double height;
  double width;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void **v19;
  uint64_t v20;
  id (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  double v25;
  double v26;

  height = a5.height;
  width = a5.width;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewWithTag:", MKLookAroundTTRButtonTag));
  v11 = objc_msgSend(v10, "isHidden");
  objc_msgSend(v10, "setHidden:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewWithTag:", MKLookAroundCompassTag));
  v13 = objc_msgSend(v12, "isHidden");
  objc_msgSend(v12, "setHidden:", 1);
  v14 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", width, height);
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_100529F28;
  v22 = &unk_1011BA538;
  v25 = width;
  v26 = height;
  v23 = v8;
  v24 = v9;
  v15 = v9;
  v16 = v8;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageWithActions:", &v19));
  objc_msgSend(v10, "setHidden:", v11, v19, v20, v21, v22);
  objc_msgSend(v12, "setHidden:", v13);

  return v17;
}

- (MapsScreenshotServiceDelegate)delegate
{
  return (MapsScreenshotServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
