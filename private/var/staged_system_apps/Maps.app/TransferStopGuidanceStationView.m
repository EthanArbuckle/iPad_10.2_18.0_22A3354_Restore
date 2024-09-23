@implementation TransferStopGuidanceStationView

- (TransferStopGuidanceStationView)initWithFrame:(CGRect)a3
{
  double height;
  TransferStopGuidanceStationView *v4;
  TransferStopGuidanceStationView *v5;
  CAShapeLayer *v6;
  CAShapeLayer *highlightLayer;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  UIImageView *v14;
  UIImageView *stationIcon;
  objc_super v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  height = CGSizeZero.height;
  if (a3.size.width == CGSizeZero.width && a3.size.height == height)
  {
    a3.size.width = 22.0;
    a3.size.height = 22.0;
  }
  v17.receiver = self;
  v17.super_class = (Class)TransferStopGuidanceStationView;
  v4 = -[TransferStopGuidanceStationView initWithFrame:](&v17, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 22.0, CGSizeZero.width, height);
  v5 = v4;
  if (v4)
  {
    v4->_shouldShowHighlight = 0;
    v6 = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
    highlightLayer = v5->_highlightLayer;
    v5->_highlightLayer = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransferStopGuidanceStationView layer](v5, "layer"));
    objc_msgSend(v8, "bounds");
    -[CAShapeLayer setFrame:](v5->_highlightLayer, "setFrame:");

    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0431372561, 0.490196079, 0.984313726, 0.800000012)));
    -[CAShapeLayer setStrokeColor:](v5->_highlightLayer, "setStrokeColor:", objc_msgSend(v9, "CGColor"));

    -[CAShapeLayer setFillColor:](v5->_highlightLayer, "setFillColor:", -[CAShapeLayer strokeColor](v5->_highlightLayer, "strokeColor"));
    -[CAShapeLayer setLineWidth:](v5->_highlightLayer, "setLineWidth:", 2.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransferStopGuidanceStationView layer](v5, "layer"));
    objc_msgSend(v10, "bounds");
    v19 = CGRectInset(v18, 1.0, 1.0);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height)));
    -[CAShapeLayer setPath:](v5->_highlightLayer, "setPath:", objc_msgSend(v11, "CGPath"));

    -[CAShapeLayer setHidden:](v5->_highlightLayer, "setHidden:", !v5->_shouldShowHighlight);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransferStopGuidanceStationView layer](v5, "layer"));
    objc_msgSend(v12, "addSublayer:", v5->_highlightLayer);

    v13 = objc_alloc((Class)UIImageView);
    -[TransferStopGuidanceStationView bounds](v5, "bounds");
    v21 = CGRectInset(v20, 2.0, 2.0);
    v14 = (UIImageView *)objc_msgSend(v13, "initWithFrame:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    stationIcon = v5->_stationIcon;
    v5->_stationIcon = v14;

    -[TransferStopGuidanceStationView addSubview:](v5, "addSubview:", v5->_stationIcon);
  }
  return v5;
}

+ (double)necessaryTopOffset
{
  return 13.0;
}

- (void)setShouldShowHighlight:(BOOL)a3
{
  if (self->_shouldShowHighlight != a3)
  {
    self->_shouldShowHighlight = a3;
    -[CAShapeLayer setHidden:](self->_highlightLayer, "setHidden:", !a3);
  }
}

- (UIImageView)stationIcon
{
  return self->_stationIcon;
}

- (BOOL)shouldShowHighlight
{
  return self->_shouldShowHighlight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightLayer, 0);
  objc_storeStrong((id *)&self->_stationIcon, 0);
}

@end
