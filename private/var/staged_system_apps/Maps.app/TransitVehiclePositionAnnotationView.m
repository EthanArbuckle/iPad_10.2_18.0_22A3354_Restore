@implementation TransitVehiclePositionAnnotationView

+ (double)baseDiameter
{
  return 28.0;
}

+ (double)innerDiameter
{
  double v2;

  objc_msgSend(a1, "baseDiameter");
  return v2 + -6.0;
}

+ (double)imageDiameter
{
  return 14.0;
}

- (TransitVehiclePositionAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  TransitVehiclePositionAnnotationView *v4;
  TransitVehiclePositionAnnotationView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TransitVehiclePositionAnnotationView;
  v4 = -[TransitVehiclePositionAnnotationView initWithAnnotation:reuseIdentifier:](&v7, "initWithAnnotation:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[TransitVehiclePositionAnnotationView setCanShowCallout:](v4, "setCanShowCallout:", 0);
    -[TransitVehiclePositionAnnotationView setClipsToBounds:](v5, "setClipsToBounds:", 0);
    -[TransitVehiclePositionAnnotationView setShouldInnerPulse:](v5, "setShouldInnerPulse:", 0);
    -[TransitVehiclePositionAnnotationView setHeadingIndicatorStyle:](v5, "setHeadingIndicatorStyle:", 1);
    -[TransitVehiclePositionAnnotationView _updateFromAnnotation](v5, "_updateFromAnnotation");
  }
  return v5;
}

- (TransitVehiclePositionAnnotation)transitVehiclePositionAnnotation
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitVehiclePositionAnnotationView annotation](self, "annotation"));
  v4 = objc_opt_class(TransitVehiclePositionAnnotation);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitVehiclePositionAnnotationView annotation](self, "annotation"));
  else
    v6 = 0;
  return (TransitVehiclePositionAnnotation *)v6;
}

- (void)didMoveToWindow
{
  void *v3;
  _MKUILabel *lastUpdatedLabel;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TransitVehiclePositionAnnotationView;
  -[TransitVehiclePositionAnnotationView didMoveToWindow](&v5, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitVehiclePositionAnnotationView window](self, "window"));

  if (v3)
  {
    -[TransitVehiclePositionAnnotationView updateTheme](self, "updateTheme");
  }
  else
  {
    -[NSTimer invalidate](self->_labelUpdateTimer, "invalidate");
    -[_MKUILabel removeFromSuperview](self->_lastUpdatedLabel, "removeFromSuperview");
    lastUpdatedLabel = self->_lastUpdatedLabel;
    self->_lastUpdatedLabel = 0;

  }
}

- (void)setAnnotation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitVehiclePositionAnnotationView transitVehiclePositionAnnotation](self, "transitVehiclePositionAnnotation"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitVehiclePositionAnnotationView transitVehiclePositionAnnotation](self, "transitVehiclePositionAnnotation"));
    objc_msgSend(v6, "removeObserver:forKeyPath:", self, CFSTR("vehiclePosition"));

  }
  v9.receiver = self;
  v9.super_class = (Class)TransitVehiclePositionAnnotationView;
  -[TransitVehiclePositionAnnotationView setAnnotation:](&v9, "setAnnotation:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitVehiclePositionAnnotationView transitVehiclePositionAnnotation](self, "transitVehiclePositionAnnotation"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitVehiclePositionAnnotationView transitVehiclePositionAnnotation](self, "transitVehiclePositionAnnotation"));
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, CFSTR("vehiclePosition"), 1, 0);

  }
  -[TransitVehiclePositionAnnotationView _updateFromAnnotation](self, "_updateFromAnnotation");

}

- (void)_updateFromAnnotation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitVehiclePositionAnnotationView transitVehicleAnnotation](self, "transitVehicleAnnotation"));
  -[TransitVehiclePositionAnnotationView setAllowsAccuracyRing:](self, "setAllowsAccuracyRing:", objc_msgSend(v3, "allowsAccuracyRing"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitVehiclePositionAnnotationView transitVehicleAnnotation](self, "transitVehicleAnnotation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "color"));
  -[TransitVehiclePositionAnnotationView setTintColor:](self, "setTintColor:", v5);

  -[TransitVehiclePositionAnnotationView _updateHeading](self, "_updateHeading");
  -[TransitVehiclePositionAnnotationView _updateLastUpdatedLabel](self, "_updateLastUpdatedLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitVehiclePositionAnnotationView traitCollection](self, "traitCollection"));
  objc_msgSend(v6, "displayScale");
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitVehiclePositionAnnotationView transitVehicleAnnotation](self, "transitVehicleAnnotation"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageWithScale:nightMode:", -[TransitVehiclePositionAnnotationView _mapkit_isDarkModeEnabled](self, "_mapkit_isDarkModeEnabled"), v8));

  -[TransitVehiclePositionAnnotationView setGlyphImage:](self, "setGlyphImage:", v10);
}

- (void)_updateLastUpdatedLabel
{
  NSTimer *labelUpdateTimer;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _MKUILabel *v8;
  _MKUILabel *lastUpdatedLabel;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  _QWORD v29[2];

  -[NSTimer invalidate](self->_labelUpdateTimer, "invalidate");
  labelUpdateTimer = self->_labelUpdateTimer;
  self->_labelUpdateTimer = 0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitVehiclePositionAnnotationView transitVehiclePositionAnnotation](self, "transitVehiclePositionAnnotation"));
  if ((objc_msgSend(v4, "allowsTimestampLabel") & 1) == 0)
  {

    goto LABEL_9;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitVehiclePositionAnnotationView transitVehiclePositionAnnotation](self, "transitVehiclePositionAnnotation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "vehiclePosition"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timestamp"));

  if (!v7)
  {
LABEL_9:
    -[_MKUILabel setHidden:](self->_lastUpdatedLabel, "setHidden:", 1);
    return;
  }
  if (!self->_lastUpdatedLabel)
  {
    v8 = (_MKUILabel *)objc_msgSend(objc_alloc((Class)_MKUILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    lastUpdatedLabel = self->_lastUpdatedLabel;
    self->_lastUpdatedLabel = v8;

    -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_lastUpdatedLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 11.0, UIFontWeightSemibold));
    -[_MKUILabel setFont:](self->_lastUpdatedLabel, "setFont:", v10);

    -[TransitVehiclePositionAnnotationView addSubview:](self, "addSubview:", self->_lastUpdatedLabel);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel topAnchor](self->_lastUpdatedLabel, "topAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitVehiclePositionAnnotationView centerYAnchor](self, "centerYAnchor"));
    objc_msgSend((id)objc_opt_class(self), "baseDiameter");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, v13 * 0.5 + 2.0));
    v29[0] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_MKUILabel centerXAnchor](self->_lastUpdatedLabel, "centerXAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitVehiclePositionAnnotationView centerXAnchor](self, "centerXAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
    v29[1] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitVehiclePositionAnnotationView transitVehiclePositionAnnotation](self, "transitVehiclePositionAnnotation"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "vehiclePosition"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "timestamp"));

  if (v21)
  {
    objc_msgSend(v21, "timeIntervalSinceNow");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", round(v22 / 10.0) * 10.0));

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateComponentsFormatter _mapkit_descriptionForTimeSinceDate:referenceDate:smallestUnit:](NSDateComponentsFormatter, "_mapkit_descriptionForTimeSinceDate:referenceDate:smallestUnit:", v23, v24, 128));

    if (v25)
    {
      v26 = objc_alloc((Class)NSAttributedString);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[TransitVehiclePositionAnnotationView _lastUpdatedTextAttributes](self, "_lastUpdatedTextAttributes"));
      v28 = objc_msgSend(v26, "initWithString:attributes:", v25, v27);
      -[_MKUILabel setAttributedText:](self->_lastUpdatedLabel, "setAttributedText:", v28);

    }
    else
    {
      -[_MKUILabel setAttributedText:](self->_lastUpdatedLabel, "setAttributedText:", 0);
    }
    -[TransitVehiclePositionAnnotationView _scheduleLastUpdatedLabelUpdate](self, "_scheduleLastUpdatedLabelUpdate");
    -[_MKUILabel setHidden:](self->_lastUpdatedLabel, "setHidden:", 0);

  }
  else
  {
    -[_MKUILabel setAttributedText:](self->_lastUpdatedLabel, "setAttributedText:", 0);
    -[_MKUILabel setHidden:](self->_lastUpdatedLabel, "setHidden:", 1);
  }
}

- (id)_lastUpdatedTextAttributes
{
  void *v2;
  void *v3;
  NSAttributedStringKey v5;
  void *v6;

  v5 = NSForegroundColorAttributeName;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));

  return v3;
}

- (void)_scheduleLastUpdatedLabelUpdate
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSTimer *v10;
  NSTimer *labelUpdateTimer;
  _QWORD v12[4];
  id v13;
  id location;

  if ((-[_MKUILabel isHidden](self->_lastUpdatedLabel, "isHidden") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitVehiclePositionAnnotationView transitVehiclePositionAnnotation](self, "transitVehiclePositionAnnotation"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "vehiclePosition"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));

    objc_msgSend(v5, "timeIntervalSinceNow");
    v7 = fabs(v6);
    v8 = 60.0;
    if (v7 < 60.0)
      v8 = 10.0;
    v9 = -(v7 - ceil(v7 / v8) * v8);
    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10095FE5C;
    v12[3] = &unk_1011ADF20;
    objc_copyWeak(&v13, &location);
    v10 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v12, v9));
    labelUpdateTimer = self->_labelUpdateTimer;
    self->_labelUpdateTimer = v10;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  objc_super v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[TransitVehiclePositionAnnotationView annotation](self, "annotation"));

  if (v13 == v11)
  {
    -[TransitVehiclePositionAnnotationView _updateHeading](self, "_updateHeading");
    -[TransitVehiclePositionAnnotationView _updateLastUpdatedLabel](self, "_updateLastUpdatedLabel");
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)TransitVehiclePositionAnnotationView;
    -[TransitVehiclePositionAnnotationView observeValueForKeyPath:ofObject:change:context:](&v14, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)_updateHeading
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitVehiclePositionAnnotationView transitVehiclePositionAnnotation](self, "transitVehiclePositionAnnotation"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "vehiclePosition"));

  v4 = v7;
  if (v7)
  {
    objc_msgSend(v7, "heading");
    v6 = v5;
    -[TransitVehiclePositionAnnotationView setHeading:](self, "setHeading:");
    -[TransitVehiclePositionAnnotationView setShouldDisplayHeading:](self, "setShouldDisplayHeading:", v6 >= 0.0);
    v4 = v7;
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransitVehiclePositionAnnotationView;
  -[TransitVehiclePositionAnnotationView traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v5);
  if (v5
    && (v6 = objc_msgSend(v5, "userInterfaceStyle"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitVehiclePositionAnnotationView traitCollection](self, "traitCollection")),
        v6 == objc_msgSend(v3, "userInterfaceStyle")))
  {

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitVehiclePositionAnnotationView traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "userInterfaceStyle");

    if (v5)
    if (v8)
      -[TransitVehiclePositionAnnotationView updateTheme](self, "updateTheme");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelUpdateTimer, 0);
  objc_storeStrong((id *)&self->_lastUpdatedLabel, 0);
}

@end
