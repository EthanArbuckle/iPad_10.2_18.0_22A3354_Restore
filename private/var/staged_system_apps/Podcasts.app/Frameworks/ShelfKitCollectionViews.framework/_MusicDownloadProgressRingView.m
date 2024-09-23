@implementation _MusicDownloadProgressRingView

- (_MusicDownloadProgressRingView)initWithFrame:(CGRect)a3
{
  _MusicDownloadProgressRingView *v3;
  _MusicDownloadProgressRingView *v4;
  void *v5;
  id v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_MusicDownloadProgressRingView;
  v3 = -[_MusicDownloadProgressRingView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_MusicDownloadProgressRingView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_MusicDownloadProgressRingView layer](v4, "layer"));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
    objc_msgSend(v5, "setFillColor:", objc_msgSend(v6, "CGColor"));

    objc_msgSend(v5, "setStrokeStart:", 0.0);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[_MusicDownloadProgressRingView tintColor](v4, "tintColor")));
    objc_msgSend(v5, "setStrokeColor:", objc_msgSend(v7, "CGColor"));

    objc_msgSend(v5, "setLineCap:", CFSTR("round"));
    -[_MusicDownloadProgressRingView _updateShapePath](v4, "_updateShapePath");

  }
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class(CAShapeLayer, a2);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MusicDownloadProgressRingView;
  -[_MusicDownloadProgressRingView layoutSubviews](&v3, "layoutSubviews");
  -[_MusicDownloadProgressRingView _updateShapePath](self, "_updateShapePath");
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MusicDownloadProgressRingView;
  -[_MusicDownloadProgressRingView tintColorDidChange](&v6, "tintColorDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_MusicDownloadProgressRingView tintColor](self, "tintColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_MusicDownloadProgressRingView layer](self, "layer"));
  v5 = objc_retainAutorelease(v3);
  objc_msgSend(v4, "setStrokeColor:", objc_msgSend(v5, "CGColor"));

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_MusicDownloadProgressRingView;
  if (-[_MusicDownloadProgressRingView _shouldAnimatePropertyWithKey:](&v7, "_shouldAnimatePropertyWithKey:", v4))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("strokeEnd"));

  return v5;
}

- (void)setProgress:(double)a3
{
  id v4;

  self->_progress = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[_MusicDownloadProgressRingView layer](self, "layer"));
  objc_msgSend(v4, "setStrokeEnd:", self->_progress);

}

- (void)_updateShapePath
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double SafeScaleForValue;
  double v13;
  CGFloat v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v19;
  double MidX;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  id v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  -[_MusicDownloadProgressRingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_MusicDownloadProgressRingView traitCollection](self, "traitCollection"));
  SafeScaleForValue = MTMPUFloatGetSafeScaleForValue(objc_msgSend(v11, "displayScale"));

  v26 = (id)objc_claimAutoreleasedReturnValue(-[_MusicDownloadProgressRingView layer](self, "layer"));
  objc_msgSend(v26, "lineWidth");
  v14 = v13 * 0.5;
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  v28 = CGRectInset(v27, v14, v14);
  x = v28.origin.x;
  y = v28.origin.y;
  width = v28.size.width;
  height = v28.size.height;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  MidX = CGRectGetMidX(v29);
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  objc_msgSend(v19, "moveToPoint:", MidX, CGRectGetMinY(v30));
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  v21 = CGRectGetWidth(v31);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v22 = CGRectGetHeight(v32);
  if (v21 < v22)
    v22 = v21;
  v23 = v22 * 0.5;
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  v24 = CGRectGetMidX(v33);
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  objc_msgSend(v19, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v24, CGRectGetMidY(v34), v23, -1.57079633, 4.71238898);
  v25 = objc_retainAutorelease(v19);
  objc_msgSend(v26, "setPath:", objc_msgSend(v25, "CGPath"));
  objc_msgSend(v26, "setLineWidth:", 1.0 / SafeScaleForValue + 2.0);

}

- (double)progress
{
  return self->_progress;
}

@end
