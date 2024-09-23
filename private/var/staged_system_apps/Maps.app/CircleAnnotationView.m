@implementation CircleAnnotationView

- (CircleAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  CircleAnnotationView *v4;
  uint64_t v5;
  CALayer *circleLayer;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CircleAnnotationView *v15;
  objc_super v17;
  _QWORD v18[5];
  _QWORD v19[5];

  v17.receiver = self;
  v17.super_class = (Class)CircleAnnotationView;
  v4 = -[CircleAnnotationView initWithAnnotation:reuseIdentifier:](&v17, "initWithAnnotation:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    circleLayer = v4->_circleLayer;
    v4->_circleLayer = (CALayer *)v5;

    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
    -[CALayer setBackgroundColor:](v4->_circleLayer, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));

    v18[0] = CFSTR("bounds");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v19[0] = v8;
    v18[1] = CFSTR("position");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v19[1] = v9;
    v18[2] = CFSTR("cornerRadius");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v19[2] = v10;
    v18[3] = CFSTR("transform");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v19[3] = v11;
    v18[4] = CFSTR("hidden");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v19[4] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 5));
    -[CALayer setActions:](v4->_circleLayer, "setActions:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CircleAnnotationView layer](v4, "layer"));
    objc_msgSend(v14, "addSublayer:", v4->_circleLayer);

    v15 = v4;
  }

  return v4;
}

- (void)setRadius:(double)a3
{
  double MidX;
  double v6;
  CGRect v7;
  CGRect v8;

  self->_radius = a3;
  -[CircleAnnotationView bounds](self, "bounds");
  MidX = CGRectGetMidX(v7);
  -[CircleAnnotationView bounds](self, "bounds");
  -[CALayer setPosition:](self->_circleLayer, "setPosition:", MidX, CGRectGetMidY(v8));
  -[CALayer setBounds:](self->_circleLayer, "setBounds:", 0.0, 0.0, a3 + a3, a3 + a3);
  -[CALayer bounds](self->_circleLayer, "bounds");
  -[CALayer setCornerRadius:](self->_circleLayer, "setCornerRadius:", v6 * 0.5);
}

- (void)setColorRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  id v7;

  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", a3, a4, a5, a6)));
  -[CALayer setBackgroundColor:](self->_circleLayer, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));

}

- (void)_setMapPitchRadians:(double)a3
{
  CALayer *circleLayer;
  CATransform3D v6;
  CATransform3D v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CircleAnnotationView;
  -[CircleAnnotationView _setMapPitchRadians:](&v8, "_setMapPitchRadians:");
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  CATransform3DMakeRotation(&v7, a3, 1.0, 0.0, 0.0);
  circleLayer = self->_circleLayer;
  v6 = v7;
  -[CALayer setTransform:](circleLayer, "setTransform:", &v6);
  +[CATransaction commit](CATransaction, "commit");
}

- (double)radius
{
  return self->_radius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleLayer, 0);
}

@end
