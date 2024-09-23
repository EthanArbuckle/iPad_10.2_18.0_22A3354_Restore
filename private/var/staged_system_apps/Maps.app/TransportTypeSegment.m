@implementation TransportTypeSegment

- (TransportTypeSegment)initWithTransportType:(int64_t)a3
{
  double y;
  double width;
  double height;
  TransportTypeSegment *v7;
  TransportTypeSegment *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIImageView *v18;
  UIImageView *iconView;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  TransportTypeSegment *v24;
  TransportTypeSegment *v25;
  void **v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  TransportTypeSegment *v31;
  int64_t v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)TransportTypeSegment;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = -[TransportTypeSegment initWithFrame:](&v33, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v8 = v7;
  if (v7)
  {
    -[TransportTypeSegment setClipsToBounds:](v7, "setClipsToBounds:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[TransportTypeSegment setBackgroundColor:](v8, "setBackgroundColor:", v9);

    -[TransportTypeSegment setExclusiveTouch:](v8, "setExclusiveTouch:", 1);
    -[TransportTypeSegment setShowsLargeContentViewer:](v8, "setShowsLargeContentViewer:", 1);
    switch(a3)
    {
      case 1:
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v11 = v10;
        v12 = CFSTR("Drive [Transport Type Picker, Accessibility]");
        goto LABEL_9;
      case 2:
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v11 = v10;
        v12 = CFSTR("Walk [Transport Type Picker, Accessibility]");
        goto LABEL_9;
      case 3:
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v11 = v10;
        v12 = CFSTR("Transit [Transport Type Picker, Accessibility]");
        goto LABEL_9;
      case 4:
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v11 = v10;
        v12 = CFSTR("Ride [Transport Type Picker, Accessibility]");
        goto LABEL_9;
      case 5:
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v11 = v10;
        v12 = CFSTR("Cycle [Transport Type Picker, Accessibility]");
LABEL_9:
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v12, CFSTR("localized string not found"), 0));

        break;
      default:
        v13 = 0;
        break;
    }
    -[TransportTypeSegment setLargeContentTitle:](v8, "setLargeContentTitle:", v13);

    LODWORD(v14) = 1144750080;
    -[TransportTypeSegment setContentHuggingPriority:forAxis:](v8, "setContentHuggingPriority:forAxis:", 1, v14);
    LODWORD(v15) = 1144750080;
    -[TransportTypeSegment setContentHuggingPriority:forAxis:](v8, "setContentHuggingPriority:forAxis:", 0, v15);
    LODWORD(v16) = 1148846080;
    -[TransportTypeSegment setContentCompressionResistancePriority:forAxis:](v8, "setContentCompressionResistancePriority:forAxis:", 1, v16);
    LODWORD(v17) = 1148846080;
    -[TransportTypeSegment setContentCompressionResistancePriority:forAxis:](v8, "setContentCompressionResistancePriority:forAxis:", 0, v17);
    v8->_transportType = a3;
    v18 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    iconView = v8->_iconView;
    v8->_iconView = v18;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v8->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v8->_iconView, "setContentMode:", 1);
    -[TransportTypeSegment addSubview:](v8, "addSubview:", v8->_iconView);
    switch(a3)
    {
      case 1:
        -[TransportTypeSegment setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", CFSTR("DriveButton"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v21 = v20;
        v22 = CFSTR("Drive [Transport Type Picker, Accessibility]");
        goto LABEL_17;
      case 2:
        -[TransportTypeSegment setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", CFSTR("WalkButton"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v21 = v20;
        v22 = CFSTR("Walk [Transport Type Picker, Accessibility]");
        goto LABEL_17;
      case 3:
        -[TransportTypeSegment setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", CFSTR("TransitButton"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v21 = v20;
        v22 = CFSTR("Transit [Transport Type Picker, Accessibility]");
        goto LABEL_17;
      case 4:
        -[TransportTypeSegment setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", CFSTR("RideshareButton"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v21 = v20;
        v22 = CFSTR("Ride [Transport Type Picker, Accessibility]");
        goto LABEL_17;
      case 5:
        -[TransportTypeSegment setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", CFSTR("CyclingButton"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v21 = v20;
        v22 = CFSTR("Cycle [Transport Type Picker, Accessibility]");
LABEL_17:
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", v22, CFSTR("localized string not found"), 0));

        break;
      default:
        -[TransportTypeSegment setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", 0);
        v23 = 0;
        break;
    }
    -[TransportTypeSegment setAccessibilityLabel:](v8, "setAccessibilityLabel:", v23);

    -[TransportTypeSegment _setupConstraints](v8, "_setupConstraints");
    v27 = _NSConcreteStackBlock;
    v28 = 3221225472;
    v29 = sub_1009D67F4;
    v30 = &unk_1011AD518;
    v32 = a3;
    v24 = v8;
    v31 = v24;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v27);
    -[TransportTypeSegment _updateViews](v24, "_updateViews", v27, v28, v29, v30);
    v25 = v24;

  }
  return v8;
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[6];

  v28 = objc_alloc_init((Class)NSMutableArray);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypeSegment iconView](self, "iconView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "centerXAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypeSegment centerXAnchor](self, "centerXAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v29[0] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypeSegment iconView](self, "iconView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "centerYAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypeSegment centerYAnchor](self, "centerYAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v29[1] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypeSegment iconView](self, "iconView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypeSegment topAnchor](self, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintGreaterThanOrEqualToAnchor:constant:", v17, 3.0));
  v29[2] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypeSegment iconView](self, "iconView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypeSegment leadingAnchor](self, "leadingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:constant:", v13, 6.0));
  v29[3] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypeSegment bottomAnchor](self, "bottomAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypeSegment iconView](self, "iconView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintGreaterThanOrEqualToAnchor:constant:", v6, 3.0));
  v29[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypeSegment trailingAnchor](self, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypeSegment iconView](self, "iconView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintGreaterThanOrEqualToAnchor:constant:", v10, 6.0));
  v29[5] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 6));
  objc_msgSend(v28, "addObjectsFromArray:", v12);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TransportTypeSegment;
  -[TransportTypeSegment didMoveToWindow](&v4, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypeSegment window](self, "window"));

  if (v3)
    -[TransportTypeSegment _updateViews](self, "_updateViews");
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (-[TransportTypeSegment isSelected](self, "isSelected") != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)TransportTypeSegment;
    -[TransportTypeSegment setSelected:](&v6, "setSelected:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypeSegment window](self, "window"));

    if (v5)
      -[TransportTypeSegment _updateViews](self, "_updateViews");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  objc_super v7;

  v3 = a3;
  if (-[TransportTypeSegment isHighlighted](self, "isHighlighted") != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)TransportTypeSegment;
    -[TransportTypeSegment setHighlighted:](&v7, "setHighlighted:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypeSegment window](self, "window"));

    if (v5)
    {
      v6 = 0.200000003;
      if (!v3)
        v6 = 1.0;
      -[TransportTypeSegment setAlpha:](self, "setAlpha:", v6);
    }
  }
}

- (void)_updateViews
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double height;
  id v18;

  -[TransportTypeSegment _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", 8.0);
  if (-[TransportTypeSegment isSelected](self, "isSelected"))
  {
    v18 = (id)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("TransportTypePicker-SelectedIcon")));
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("TransportTypePicker-SelectedSegment")));
  }
  else
  {
    v18 = (id)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
  }
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypeSegment iconView](self, "iconView"));
  objc_msgSend(v5, "setTintColor:", v18);

  -[TransportTypeSegment setBackgroundColor:](self, "setBackgroundColor:", v4);
  if (-[TransportTypeSegment isSelected](self, "isSelected") && sub_1002A8AA0(self) != 5)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypeSegment layer](self, "layer"));
    objc_msgSend(v15, "setShadowColor:", 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypeSegment layer](self, "layer"));
    objc_msgSend(v16, "setShadowRadius:", 0.0);

    height = CGSizeZero.height;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypeSegment layer](self, "layer"));
    objc_msgSend(v13, "setShadowOffset:", CGSizeZero.width, height);
  }
  else
  {
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
    v7 = objc_msgSend(v6, "CGColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypeSegment layer](self, "layer"));
    objc_msgSend(v8, "setShadowColor:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypeSegment layer](self, "layer"));
    objc_msgSend(v9, "setShadowRadius:", 4.0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypeSegment layer](self, "layer"));
    objc_msgSend(v10, "setShadowOffset:", 0.0, 1.0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypeSegment layer](self, "layer"));
    objc_msgSend(v11, "setShadowPathIsBounds:", 1);

    if (-[TransportTypeSegment isSelected](self, "isSelected"))
      v12 = 0.1;
    else
      v12 = 0.0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransportTypeSegment layer](self, "layer"));
    *(float *)&v14 = v12;
    objc_msgSend(v13, "setShadowOpacity:", v14);
  }

}

- (int64_t)transportType
{
  return self->_transportType;
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_aspectRatioConstraint, 0);
}

@end
