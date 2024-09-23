@implementation DebugLocationAnnotationView

- (void)_updateFillColor
{
  double v3;
  double v4;
  double v5;
  id v6;

  switch(-[DebugLocationAnnotation locationType](self->_debugLocationAnnotation, "locationType"))
  {
    case 0u:
      v3 = 0.200000003;
      v4 = 1.0;
      goto LABEL_5;
    case 1u:
      v3 = 0.200000003;
      v4 = 1.0;
      goto LABEL_7;
    case 2u:
      v3 = 0.400000006;
      v4 = 0.0;
LABEL_5:
      v5 = 0.0;
      goto LABEL_8;
    case 3u:
      v3 = 0.200000003;
      v4 = 0.0;
LABEL_7:
      v5 = 1.0;
LABEL_8:
      v6 = (id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v4, 0.0, v5, v3));
      -[UIView setBackgroundColor:](self->_circleView, "setBackgroundColor:", v6);

      break;
    default:
      return;
  }
}

- (void)_updateCourse
{
  double v3;
  double v4;
  double v5;
  void *v6;
  CATransform3D v7;
  CATransform3D v8;

  -[DebugLocationAnnotation course](self->_debugLocationAnnotation, "course");
  v4 = v3;
  -[DebugLocationAnnotationView _mapRotationRadians](self, "_mapRotationRadians");
  CATransform3DMakeRotation(&v8, -(v5 - v4 * 0.0174532925), 0.0, 0.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_courseImageView, "layer"));
  v7 = v8;
  objc_msgSend(v6, "setTransform:", &v7);

}

- (void)_updateAccuracy
{
  void *v3;
  double v4;
  double v5;
  double MidX;
  double MidY;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  CGRect v13;
  CGRect v14;

  if (-[DebugLocationAnnotation locationType](self->_debugLocationAnnotation, "locationType"))
  {
    -[UIView removeFromSuperview](self->_outerCircleView, "removeFromSuperview");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DebugLocationAnnotation location](self->_debugLocationAnnotation, "location"));
    objc_msgSend(v3, "horizontalAccuracy");
    -[DebugLocationAnnotationView _pointsForDistance:](self, "_pointsForDistance:");
    v5 = v4;

    -[DebugLocationAnnotationView bounds](self, "bounds");
    MidX = CGRectGetMidX(v13);
    -[DebugLocationAnnotationView bounds](self, "bounds");
    MidY = CGRectGetMidY(v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_outerCircleView, "layer"));
    objc_msgSend(v8, "setPosition:", MidX, MidY);

    -[UIView setBounds:](self->_outerCircleView, "setBounds:", 0.0, 0.0, v5 + v5, v5 + v5);
    -[UIView bounds](self->_outerCircleView, "bounds");
    v10 = v9 * 0.5;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_outerCircleView, "layer"));
    objc_msgSend(v11, "setCornerRadius:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_outerCircleView, "superview"));
    if (!v12)
      -[DebugLocationAnnotationView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_outerCircleView, self->_circleView);
  }
}

- (DebugLocationAnnotationView)initWithAnnotation:(id)a3 debugLocationAnnotation:(id)a4 reuseIdentifier:(id)a5
{
  id v9;
  DebugLocationAnnotationView *v10;
  DebugLocationAnnotationView *v11;
  id v12;
  id v13;
  double v14;
  UIView *v15;
  UIView *circleView;
  double MidX;
  double MidY;
  void *v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  void *v24;
  UIImageView *v25;
  UIImageView *courseImageView;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  UIView *v35;
  UIView *outerCircleView;
  void *v37;
  id v38;
  id v39;
  void *v40;
  DebugLocationAnnotationView *v41;
  objc_super v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v9 = a4;
  v43.receiver = self;
  v43.super_class = (Class)DebugLocationAnnotationView;
  v10 = -[DebugLocationAnnotationView initWithAnnotation:reuseIdentifier:](&v43, "initWithAnnotation:reuseIdentifier:", a3, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_debugLocationAnnotation, a4);
    v12 = objc_msgSend(v9, "navType");
    v13 = objc_alloc((Class)UIView);
    if (v12)
      v14 = 50.0;
    else
      v14 = 18.0;
    v15 = (UIView *)objc_msgSend(v13, "initWithFrame:", 0.0, 0.0, v14, v14);
    circleView = v11->_circleView;
    v11->_circleView = v15;

    -[DebugLocationAnnotationView bounds](v11, "bounds");
    MidX = CGRectGetMidX(v44);
    -[DebugLocationAnnotationView bounds](v11, "bounds");
    MidY = CGRectGetMidY(v45);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v11->_circleView, "layer"));
    objc_msgSend(v19, "setPosition:", MidX, MidY);

    -[UIView bounds](v11->_circleView, "bounds");
    v21 = v20 * 0.5;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v11->_circleView, "layer"));
    objc_msgSend(v22, "setCornerRadius:", v21);

    -[DebugLocationAnnotationView addSubview:](v11, "addSubview:", v11->_circleView);
    -[DebugLocationAnnotationView _updateFillColor](v11, "_updateFillColor");
    if (objc_msgSend(v9, "navType") == (id)1 || objc_msgSend(v9, "navType") == (id)2)
    {
      v23 = objc_alloc((Class)UIImageView);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("MN-CourseArrow.png")));
      v25 = (UIImageView *)objc_msgSend(v23, "initWithImage:", v24);
      courseImageView = v11->_courseImageView;
      v11->_courseImageView = v25;

      -[UIImageView sizeToFit](v11->_courseImageView, "sizeToFit");
      -[UIView bounds](v11->_circleView, "bounds");
      v27 = CGRectGetMidX(v46);
      -[UIImageView bounds](v11->_courseImageView, "bounds");
      v29 = v27 - v28 * 0.5;
      -[UIView bounds](v11->_circleView, "bounds");
      v30 = CGRectGetMidY(v47);
      -[UIImageView bounds](v11->_courseImageView, "bounds");
      v32 = v30 - v31 * 0.5;
      -[UIImageView bounds](v11->_courseImageView, "bounds");
      v34 = v33;
      -[UIImageView bounds](v11->_courseImageView, "bounds");
      -[UIImageView setFrame:](v11->_courseImageView, "setFrame:", v29, v32, v34);
      -[UIView addSubview:](v11->_circleView, "addSubview:", v11->_courseImageView);
    }
    v35 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    outerCircleView = v11->_outerCircleView;
    v11->_outerCircleView = v35;

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v11->_outerCircleView, "layer"));
    objc_msgSend(v37, "setBorderWidth:", 3.0);

    v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.0, 0.200000003)));
    v39 = objc_msgSend(v38, "CGColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v11->_outerCircleView, "layer"));
    objc_msgSend(v40, "setBorderColor:", v39);

    -[DebugLocationAnnotationView _updateAccuracy](v11, "_updateAccuracy");
    v41 = v11;
  }

  return v11;
}

- (void)setDebugLocationAnnotation:(id)a3
{
  objc_storeStrong((id *)&self->_debugLocationAnnotation, a3);
  -[DebugLocationAnnotationView _updateFillColor](self, "_updateFillColor");
  -[DebugLocationAnnotationView _updateCourse](self, "_updateCourse");
  -[DebugLocationAnnotationView _updateAccuracy](self, "_updateAccuracy");
}

- (void)_setMapPitchRadians:(double)a3
{
  void *v5;
  void *v6;
  CATransform3D v7;
  CATransform3D v8;
  CATransform3D v9;
  CATransform3D v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DebugLocationAnnotationView;
  -[DebugLocationAnnotationView _setMapPitchRadians:](&v11, "_setMapPitchRadians:");
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  CATransform3DMakeRotation(&v10, a3, 1.0, 0.0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_circleView, "layer"));
  v9 = v10;
  objc_msgSend(v5, "setTransform:", &v9);

  CATransform3DMakeRotation(&v8, a3, 1.0, 0.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_outerCircleView, "layer"));
  v7 = v8;
  objc_msgSend(v6, "setTransform:", &v7);

  +[CATransaction commit](CATransaction, "commit");
}

- (void)_setMapRotationRadians:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DebugLocationAnnotationView;
  -[DebugLocationAnnotationView _setMapRotationRadians:](&v4, "_setMapRotationRadians:", a3);
  -[DebugLocationAnnotationView _updateCourse](self, "_updateCourse");
}

- (DebugLocationAnnotation)debugLocationAnnotation
{
  return self->_debugLocationAnnotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_courseImageView, 0);
  objc_storeStrong((id *)&self->_outerCircleView, 0);
  objc_storeStrong((id *)&self->_circleView, 0);
  objc_storeStrong((id *)&self->_debugLocationAnnotation, 0);
}

@end
