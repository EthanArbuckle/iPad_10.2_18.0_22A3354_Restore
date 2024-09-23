@implementation HUDLine

- (HUDLine)init
{
  HUDLine *v2;
  HUDLine *v3;
  CALayer *keyLayer;
  CALayer *valueLayer;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUDLine;
  v2 = -[HUDLine init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_updatesComplete = 0;
    keyLayer = v2->_keyLayer;
    v2->_keyLayer = 0;

    valueLayer = v3->_valueLayer;
    v3->_valueLayer = 0;

    v3->_preferredKeyLayerWidth = 0.0;
    v3->_preferredValueLayerWidth = 0.0;
  }
  return v3;
}

- (void)nilifyCALayers
{
  CALayer *keyLayer;
  CALayer *valueLayer;

  keyLayer = self->_keyLayer;
  self->_keyLayer = 0;

  valueLayer = self->_valueLayer;
  self->_valueLayer = 0;

}

- (void)setPreferredKeyLayerWidth:(double)a3
{
  double v5;

  -[HUDLine preferredKeyLayerWidth](self, "preferredKeyLayerWidth");
  if (v5 != a3)
  {
    self->_preferredKeyLayerWidth = a3;
    -[HUDLine setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPreferredValueLayerWidth:(double)a3
{
  double v5;

  -[HUDLine preferredValueLayerWidth](self, "preferredValueLayerWidth");
  if (v5 != a3)
  {
    self->_preferredValueLayerWidth = a3;
    -[HUDLine setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSublayers
{
  double preferredKeyLayerWidth;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double preferredValueLayerWidth;
  double v12;
  double v13;
  void *v14;
  objc_super v15;
  CGRect v16;

  v15.receiver = self;
  v15.super_class = (Class)HUDLine;
  -[HUDLine layoutSublayers](&v15, "layoutSublayers");
  preferredKeyLayerWidth = self->_preferredKeyLayerWidth;
  -[HUDLine bounds](self, "bounds");
  v4 = CGRectGetWidth(v16) - self->_preferredValueLayerWidth - self->_spacing;
  if (preferredKeyLayerWidth >= v4)
    preferredKeyLayerWidth = v4;
  -[CALayer preferredFrameSize](self->_keyLayer, "preferredFrameSize");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HUDLine keyLayer](self, "keyLayer"));
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, preferredKeyLayerWidth, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HUDLine valueLayer](self, "valueLayer"));
  if (v8)
  {
    -[CALayer frame](self->_keyLayer, "frame");
    v10 = self->_spacing + v9;
    preferredValueLayerWidth = self->_preferredValueLayerWidth;
    -[CALayer preferredFrameSize](self->_valueLayer, "preferredFrameSize");
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HUDLine valueLayer](self, "valueLayer"));
    objc_msgSend(v14, "setFrame:", v10, 0.0, preferredValueLayerWidth, v13);

  }
}

- (void)setFontSize:(double)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = sub_100024FF4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[HUDLine setFontSize:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s from HUDLine called. The derived classes's method should be called instead.", (uint8_t *)&v5, 0xCu);
  }

}

- (BOOL)updatesComplete
{
  return self->_updatesComplete;
}

- (void)setUpdatesComplete:(BOOL)a3
{
  self->_updatesComplete = a3;
}

- (CALayer)keyLayer
{
  return self->_keyLayer;
}

- (void)setKeyLayer:(id)a3
{
  objc_storeStrong((id *)&self->_keyLayer, a3);
}

- (CALayer)valueLayer
{
  return self->_valueLayer;
}

- (void)setValueLayer:(id)a3
{
  objc_storeStrong((id *)&self->_valueLayer, a3);
}

- (double)preferredKeyLayerWidth
{
  return self->_preferredKeyLayerWidth;
}

- (double)preferredValueLayerWidth
{
  return self->_preferredValueLayerWidth;
}

- (HUDLineDelegate)lineDelegate
{
  return (HUDLineDelegate *)objc_loadWeakRetained((id *)&self->_lineDelegate);
}

- (void)setLineDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_lineDelegate, a3);
}

- (double)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(double)a3
{
  self->_spacing = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lineDelegate);
  objc_storeStrong((id *)&self->_valueLayer, 0);
  objc_storeStrong((id *)&self->_keyLayer, 0);
}

- (double)contentScaleForTexts
{
  double result;
  void *v1;
  double v2;
  double v3;

  result = *(double *)&qword_100060460;
  if (*(double *)&qword_100060460 <= 0.0)
  {
    if (qword_100060410 != -1)
      dispatch_once(&qword_100060410, &stru_10004E928);
    if (byte_100060418)
    {
      v1 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](CADisplay, "mainDisplay"));
      objc_msgSend(v1, "bounds");
      v2 = 1.0;
      if (v3 > 1920.0)
        v2 = 2.0;
      qword_100060460 = *(_QWORD *)&v2;

      return *(double *)&qword_100060460;
    }
    else
    {
      result = MGGetFloat32Answer(CFSTR("SNfDJgQFV2Xj7+WnozcJPw"), -1.0);
      qword_100060460 = *(_QWORD *)&result;
    }
  }
  return result;
}

@end
