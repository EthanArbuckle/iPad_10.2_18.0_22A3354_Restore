@implementation MapsPieProgressView

+ (Class)layerClass
{
  return (Class)objc_opt_class(MapsPieProgressLayer);
}

- (MapsPieProgressView)initWithFrame:(CGRect)a3
{
  MapsPieProgressView *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MapsPieProgressView;
  v3 = -[MapsPieProgressView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MapsPieProgressView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPieProgressView layer](v3, "layer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v6, "scale");
    objc_msgSend(v5, "setContentsScale:");

  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MapsPieProgressView;
  -[MapsPieProgressView layoutSubviews](&v2, "layoutSubviews");
}

- (void)setProgressColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MapsPieProgressView layer](self, "layer"));
  objc_msgSend(v5, "setProgressColor:", v4);

}

- (UIColor)progressColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPieProgressView layer](self, "layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "progressColor"));

  return (UIColor *)v3;
}

- (void)setProgressLineWidth:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MapsPieProgressView layer](self, "layer"));
  objc_msgSend(v4, "setBorderLineWidth:", a3);

}

- (double)progressLineWidth
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPieProgressView layer](self, "layer"));
  objc_msgSend(v2, "borderLineWidth");
  v4 = v3;

  return v4;
}

- (double)progress
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPieProgressView layer](self, "layer"));
  objc_msgSend(v2, "progress");
  v4 = v3;

  return v4;
}

- (void)setProgress:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MapsPieProgressView layer](self, "layer"));
  objc_msgSend(v4, "setProgress:", a3);

}

- (void)setProgress:(double)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[MapsPieProgressView setProgress:animated:forced:completion:](self, "setProgress:animated:forced:completion:", a4, 0, a5, a3);
}

- (void)setProgress:(double)a3 animated:(BOOL)a4 forced:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  Block_layout *v10;
  Block_layout *v11;
  void *v12;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  id *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  Block_layout *v32;

  v6 = a5;
  v7 = a4;
  v10 = (Block_layout *)a6;
  if (v10)
    v11 = v10;
  else
    v11 = &stru_1011DC3A8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPieProgressView layer](self, "layer"));
  objc_msgSend(v12, "progress");
  v14 = v13;

  if (v14 == a3 && !v6)
    goto LABEL_13;
  if (!v7)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPieProgressView layer](self, "layer"));
    objc_msgSend(v20, "removeAnimationForKey:", CFSTR("MapsPieProgressViewAnimationKey"));

    -[MapsPieProgressView setProgress:](self, "setProgress:", a3);
LABEL_13:
    v11->invoke(v11);
    goto LABEL_21;
  }
  -[MapsPieProgressView progressPresentationValue](self, "progressPresentationValue");
  v17 = v16;
  v18 = vabdd_f64(a3, v16);
  v19 = 1.0;
  if (v18 <= 0.9)
  {
    if (v18 <= 0.5)
    {
      v19 = 0.25;
      if (v18 > 0.2)
        v19 = 0.4;
    }
    else
    {
      v19 = 0.7;
    }
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPieProgressView layer](self, "layer"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "animationKeys"));
  v23 = objc_msgSend(v22, "containsObject:", CFSTR("MapsPieProgressViewAnimationKey"));

  v24 = (id *)&kCAMediaTimingFunctionEaseInEaseOut;
  if (v23)
    v24 = (id *)&kCAMediaTimingFunctionEaseOut;
  v25 = *v24;
  if (v17 < a3)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("progress")));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", v25));
    objc_msgSend(v26, "setTimingFunction:", v27);

    objc_msgSend(v26, "setDuration:", v19);
    objc_msgSend(v26, "setFillMode:", kCAFillModeBackwards);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v17));
    objc_msgSend(v26, "setFromValue:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    objc_msgSend(v26, "setToValue:", v29);

    +[CATransaction begin](CATransaction, "begin");
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10092F4C4;
    v31[3] = &unk_1011ADA00;
    v32 = v11;
    +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPieProgressView layer](self, "layer"));
    objc_msgSend(v30, "addAnimation:forKey:", v26, CFSTR("MapsPieProgressViewAnimationKey"));

    +[CATransaction commit](CATransaction, "commit");
  }
  -[MapsPieProgressView setProgress:](self, "setProgress:", a3);

LABEL_21:
}

- (void)animateProgressCompletedWithCompletion:(id)a3
{
  Block_layout *v4;
  double v5;
  void (**v6)(void);

  v4 = (Block_layout *)a3;
  if (!v4)
    v4 = &stru_1011DC3C8;
  v6 = (void (**)(void))v4;
  -[MapsPieProgressView progressPresentationValue](self, "progressPresentationValue");
  if (v5 == 1.0)
    v6[2]();
  else
    -[MapsPieProgressView setProgress:animated:forced:completion:](self, "setProgress:animated:forced:completion:", 1, 1, v6, 1.0);

}

- (double)progressPresentationValue
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsPieProgressView layer](self, "layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentationLayer"));
  objc_msgSend(v3, "progress");
  v5 = v4;

  return v5;
}

- (double)borderLineWidth
{
  return self->_borderLineWidth;
}

- (void)setBorderLineWidth:(double)a3
{
  self->_borderLineWidth = a3;
}

@end
