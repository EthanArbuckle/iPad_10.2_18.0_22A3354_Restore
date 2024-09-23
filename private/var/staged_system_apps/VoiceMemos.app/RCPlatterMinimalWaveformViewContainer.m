@implementation RCPlatterMinimalWaveformViewContainer

- (RCPlatterMinimalWaveformViewContainer)initWithFrame:(CGRect)a3 minimalWaveformView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  RCPlatterMinimalWaveformViewContainer *v11;
  RCPlatterMinimalWaveformViewContainer *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RCPlatterMinimalWaveformViewContainer;
  v11 = -[RCPlatterMinimalWaveformViewContainer initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_minimalPlatterWaveformView, a4);
    -[RCPlatterMinimalWaveformViewContainer _setupMinimalPlatterWaveformView:](v12, "_setupMinimalPlatterWaveformView:", v12->_minimalPlatterWaveformView);
  }

  return v12;
}

- (void)setMinimalPlatterWaveformView:(id)a3
{
  RCPlatterMinimalWaveformView *v4;
  void *v5;
  RCPlatterMinimalWaveformView *minimalPlatterWaveformView;
  RCPlatterMinimalWaveformView *v7;

  v4 = (RCPlatterMinimalWaveformView *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterMinimalWaveformView superview](self->_minimalPlatterWaveformView, "superview"));

  if (v5)
    -[RCPlatterMinimalWaveformView removeFromSuperview](self->_minimalPlatterWaveformView, "removeFromSuperview");
  minimalPlatterWaveformView = self->_minimalPlatterWaveformView;
  self->_minimalPlatterWaveformView = v4;
  v7 = v4;

  -[RCPlatterMinimalWaveformViewContainer _setupMinimalPlatterWaveformView:](self, "_setupMinimalPlatterWaveformView:", v7);
}

- (void)_setupMinimalPlatterWaveformView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[RCPlatterMinimalWaveformViewContainer addSubview:](self, "addSubview:", v4);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "heightAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterMinimalWaveformViewContainer heightAnchor](self, "heightAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
  objc_msgSend(v7, "setActive:", 1);

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerXAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterMinimalWaveformViewContainer centerXAnchor](self, "centerXAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v8));
  objc_msgSend(v9, "setActive:", 1);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AX_JINDO_WAVEFORM"), &stru_1001B2BC0, 0));

  return v3;
}

- (RCPlatterMinimalWaveformView)minimalPlatterWaveformView
{
  return self->_minimalPlatterWaveformView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimalPlatterWaveformView, 0);
}

@end
