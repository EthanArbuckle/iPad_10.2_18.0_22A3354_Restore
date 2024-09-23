@implementation CHASActivitySetupLevelView

- (CHASActivitySetupLevelView)initWithFrame:(CGRect)a3
{
  CHASActivitySetupLevelView *v3;
  id v4;
  uint64_t v5;
  NSBundle *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSBundle *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSBundle *v14;
  void *v15;
  void *v16;
  void *v17;
  UISegmentedControl *v18;
  UISegmentedControl *segmentedControl;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  objc_super v26;
  NSAttributedStringKey v27;
  void *v28;
  _QWORD v29[3];

  v26.receiver = self;
  v26.super_class = (Class)CHASActivitySetupLevelView;
  v3 = -[CHASActivitySetupLevelView initWithFrame:](&v26, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc((Class)UISegmentedControl);
    v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v3, v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ACTIVITY_LEVEL_LIGHTLY"), &stru_1007AE1D0, CFSTR("ActivitySetup")));
    v29[0] = v8;
    v10 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v3, v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ACTIVITY_LEVEL_MODERATELY"), &stru_1007AE1D0, CFSTR("ActivitySetup")));
    v29[1] = v12;
    v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v3, v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ACTIVITY_LEVEL_HIGHLY"), &stru_1007AE1D0, CFSTR("ActivitySetup")));
    v29[2] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 3));
    v18 = (UISegmentedControl *)objc_msgSend(v4, "initWithItems:", v17);
    segmentedControl = v3->_segmentedControl;
    v3->_segmentedControl = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fu_sausageFontOfSize:](UIFont, "fu_sausageFontOfSize:", 17.0));
    v27 = NSFontAttributeName;
    v28 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
    -[UISegmentedControl setTitleTextAttributes:forState:](v3->_segmentedControl, "setTitleTextAttributes:forState:", v21, 0);
    v22 = BPSSetupBackgroundColor(-[UISegmentedControl setTitleTextAttributes:forState:](v3->_segmentedControl, "setTitleTextAttributes:forState:", v21, 4));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[UISegmentedControl setBackgroundColor:](v3->_segmentedControl, "setBackgroundColor:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
    -[UISegmentedControl setTintColor:](v3->_segmentedControl, "setTintColor:", v24);

    -[UISegmentedControl setSelectedSegmentIndex:](v3->_segmentedControl, "setSelectedSegmentIndex:", 0);
    -[CHASActivitySetupLevelView addSubview:](v3, "addSubview:", v3->_segmentedControl);

  }
  return v3;
}

- (void)layoutSubviews
{
  UISegmentedControl *segmentedControl;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  UISegmentedControl *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double y;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  objc_super v32;
  NSAttributedStringKey v33;
  void *v34;

  v32.receiver = self;
  v32.super_class = (Class)CHASActivitySetupLevelView;
  -[CHASActivitySetupLevelView layoutSubviews](&v32, "layoutSubviews");
  segmentedControl = self->_segmentedControl;
  -[CHASActivitySetupLevelView bounds](self, "bounds");
  -[UISegmentedControl sizeThatFits:](segmentedControl, "sizeThatFits:", v4, v5);
  v7 = v6;
  v9 = v8;
  -[CHASActivitySetupLevelView bounds](self, "bounds");
  if (v7 > v10)
  {
    v11 = 17.0;
    do
    {
      v11 = v11 + -1.0;
      if (v11 >= 10.0)
      {
        v33 = NSFontAttributeName;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v11));
        v34 = v13;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));

        -[UISegmentedControl setTitleTextAttributes:forState:](self->_segmentedControl, "setTitleTextAttributes:forState:", v14, 0);
        -[UISegmentedControl setTitleTextAttributes:forState:](self->_segmentedControl, "setTitleTextAttributes:forState:", v14, 4);
        v15 = self->_segmentedControl;
        -[CHASActivitySetupLevelView bounds](self, "bounds");
        -[UISegmentedControl sizeThatFits:](v15, "sizeThatFits:", v16, v17);
        v7 = v18;
        v9 = v19;

      }
      else
      {
        -[CHASActivitySetupLevelView bounds](self, "bounds");
        v7 = v12;
      }
      -[CHASActivitySetupLevelView bounds](self, "bounds");
    }
    while (v7 > v20);
  }
  y = CGPointZero.y;
  v22 = -[CHASActivitySetupLevelView bounds](self, "bounds");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v31 = FIUIDeviceScale(v22);
  UIRectCenteredXInRectScale(CGPointZero.x, y, v7, v9, v24, v26, v28, v30, v31);
  -[UISegmentedControl setFrame:](self->_segmentedControl, "setFrame:");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  -[UISegmentedControl frame](self->_segmentedControl, "frame");
  v3 = v2;
  v4 = UIViewNoIntrinsicMetric;
  result.height = v3;
  result.width = v4;
  return result;
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_segmentedControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedControl, 0);
}

@end
