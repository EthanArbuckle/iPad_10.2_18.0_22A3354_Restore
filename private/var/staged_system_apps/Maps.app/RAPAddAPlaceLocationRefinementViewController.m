@implementation RAPAddAPlaceLocationRefinementViewController

- (RAPAddAPlaceLocationRefinementViewController)initWithCamera:(id)a3 showCrosshair:(BOOL)a4 textFieldTitle:(id)a5 textFieldPlaceholder:(id)a6 textFieldText:(id)a7 textFieldEditBlock:(id)a8
{
  _BOOL4 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  RAPAddAPlaceLocationRefinementViewController *v19;
  NSString *v20;
  NSString *textFieldTitle;
  NSString *v22;
  NSString *textFieldText;
  NSString *v24;
  NSString *textFieldPlaceholder;
  id v26;
  id textFieldEditBlock;
  objc_super v29;

  v11 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if (v11)
    v18 = 0;
  else
    v18 = 4;
  v29.receiver = self;
  v29.super_class = (Class)RAPAddAPlaceLocationRefinementViewController;
  v19 = -[LocationRefinementViewController initWithCamera:crosshairType:](&v29, "initWithCamera:crosshairType:", a3, v18);
  if (v19)
  {
    v20 = (NSString *)objc_msgSend(v14, "copy");
    textFieldTitle = v19->_textFieldTitle;
    v19->_textFieldTitle = v20;

    v22 = (NSString *)objc_msgSend(v16, "copy");
    textFieldText = v19->_textFieldText;
    v19->_textFieldText = v22;

    v24 = (NSString *)objc_msgSend(v15, "copy");
    textFieldPlaceholder = v19->_textFieldPlaceholder;
    v19->_textFieldPlaceholder = v24;

    v26 = objc_retainBlock(v17);
    textFieldEditBlock = v19->_textFieldEditBlock;
    v19->_textFieldEditBlock = v26;

  }
  return v19;
}

- (void)viewDidLoad
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  objc_super v53;
  _QWORD v54[8];

  v53.receiver = self;
  v53.super_class = (Class)RAPAddAPlaceLocationRefinementViewController;
  -[RAPLocationRefinementViewController viewDidLoad](&v53, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
  objc_msgSend(v3, "setMapType:", 2);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController view](self, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapViewConstraints](self, "mapViewConstraints"));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textFieldContainerView](self, "textFieldContainerView"));
  objc_msgSend(v7, "addSubview:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textFieldContainerView](self, "textFieldContainerView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
  -[RAPAddAPlaceLocationRefinementViewController setTextFieldContainerViewBottomConstraint:](self, "setTextFieldContainerViewBottomConstraint:", v13);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "topAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController view](self, "view"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "topAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
  v54[0] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "leadingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController view](self, "view"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v44));
  v54[1] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "trailingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController view](self, "view"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "trailingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v39));
  v54[2] = v38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textFieldContainerView](self, "textFieldContainerView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "topAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[LocationRefinementViewController mapView](self, "mapView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "bottomAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
  v54[3] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textFieldContainerView](self, "textFieldContainerView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController view](self, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "safeAreaLayoutGuide"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v28));
  v54[4] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textFieldContainerView](self, "textFieldContainerView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "safeAreaLayoutGuide"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v16));
  v54[5] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textFieldContainerView](self, "textFieldContainerView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "heightAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToConstant:", 46.0));
  v54[6] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textFieldContainerViewBottomConstraint](self, "textFieldContainerViewBottomConstraint"));
  v54[7] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v54, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v23, "addObserver:selector:name:object:", self, "keyboardWillChangeFrame:", UIKeyboardWillChangeFrameNotification, 0);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v24, "addObserver:selector:name:object:", self, "keyboardDidChangeFrameNotification:", UIKeyboardDidChangeFrameNotification, 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RAPAddAPlaceLocationRefinementViewController;
  -[LocationRefinementViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textField](self, "textField"));
  objc_msgSend(v4, "becomeFirstResponder");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RAPAddAPlaceLocationRefinementViewController;
  -[LocationRefinementViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textField](self, "textField"));
  objc_msgSend(v4, "resignFirstResponder");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)RAPAddAPlaceLocationRefinementViewController;
  -[RAPAddAPlaceLocationRefinementViewController dealloc](&v4, "dealloc");
}

- (id)backgroundColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.952941179, 0.952941179, 0.952941179, 1.0);
}

- (UIView)textFieldContainerView
{
  UIView *textFieldContainerView;
  UIView *v4;
  UIView *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  RAPVerticalBar *v12;
  RAPVerticalBar *v13;
  id v14;
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
  double v26;
  UIView *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  NSDictionary *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  RAPVerticalBar *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  _QWORD v61[6];
  _QWORD v62[4];
  _QWORD v63[4];

  textFieldContainerView = self->_textFieldContainerView;
  if (!textFieldContainerView)
  {
    v4 = (UIView *)objc_alloc_init((Class)UIView);
    v5 = self->_textFieldContainerView;
    self->_textFieldContainerView = v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_textFieldContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController backgroundColor](self, "backgroundColor"));
    -[UIView setBackgroundColor:](self->_textFieldContainerView, "setBackgroundColor:", v6);

    v7 = objc_alloc_init((Class)UILabel);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textFieldTitle](self, "textFieldTitle"));
    objc_msgSend(v7, "setText:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
    objc_msgSend(v7, "setTextColor:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
    objc_msgSend(v7, "setFont:", v10);

    LODWORD(v11) = 1144750080;
    objc_msgSend(v7, "setContentHuggingPriority:forAxis:", 0, v11);
    -[UIView addSubview:](self->_textFieldContainerView, "addSubview:", v7);
    v12 = objc_alloc_init(RAPVerticalBar);
    -[RAPVerticalBar setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = v12;
    -[UIView addSubview:](self->_textFieldContainerView, "addSubview:", v12);
    v14 = objc_alloc_init((Class)UITextField);
    -[RAPAddAPlaceLocationRefinementViewController setTextField:](self, "setTextField:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textField](self, "textField"));
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textFieldPlaceholder](self, "textFieldPlaceholder"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textField](self, "textField"));
    objc_msgSend(v17, "setPlaceholder:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textFieldText](self, "textFieldText"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textField](self, "textField"));
    objc_msgSend(v19, "setText:", v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textField](self, "textField"));
    objc_msgSend(v20, "setAutocorrectionType:", 1);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textField](self, "textField"));
    objc_msgSend(v21, "setKeyboardType:", 13);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textField](self, "textField"));
    objc_msgSend(v23, "setFont:", v22);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textField](self, "textField"));
    objc_msgSend(v24, "addTarget:action:forControlEvents:", self, "textDidChange:", 0x20000);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textField](self, "textField"));
    LODWORD(v26) = 1144750080;
    objc_msgSend(v25, "setContentCompressionResistancePriority:forAxis:", 0, v26);

    v27 = self->_textFieldContainerView;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textField](self, "textField"));
    -[UIView addSubview:](v27, "addSubview:", v28);

    v60 = objc_alloc_init((Class)NSMutableArray);
    v62[0] = CFSTR("kBarThickness");
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v29, "scale");
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0 / v30));
    v63[0] = v31;
    v63[1] = &off_101274B88;
    v62[1] = CFSTR("kTitleLabelLeading");
    v62[2] = CFSTR("kTitleLabelVerticalBarPadding");
    v62[3] = CFSTR("kVerticalBarTextFieldPadding");
    v63[2] = &off_101274B98;
    v63[3] = &off_101274BA8;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v63, v62, 4));
    v33 = _NSDictionaryOfVariableBindings(CFSTR("titleLabel, verticalBar, _textField"), v7, v13, self->_textField, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(kTitleLabelLeading)-[titleLabel]-(kTitleLabelVerticalBarPadding)-[verticalBar(kBarThickness)]-(kVerticalBarTextFieldPadding)-[_textField]-|"), 0, v32, v34));
    objc_msgSend(v60, "addObjectsFromArray:", v35);

    v59 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textField](self, "textField"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "topAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_textFieldContainerView, "topAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v57));
    v61[0] = v56;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textField](self, "textField"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "bottomAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_textFieldContainerView, "bottomAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v52));
    v61[1] = v51;
    v54 = v13;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[RAPVerticalBar topAnchor](v13, "topAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_textFieldContainerView, "topAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
    v61[2] = v47;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[RAPVerticalBar bottomAnchor](v13, "bottomAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_textFieldContainerView, "bottomAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
    v61[3] = v36;
    v50 = v7;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_textFieldContainerView, "topAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v38));
    v61[4] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_textFieldContainerView, "bottomAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v41));
    v61[5] = v42;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v61, 6));
    objc_msgSend(v60, "addObjectsFromArray:", v43);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v60);
    textFieldContainerView = self->_textFieldContainerView;
  }
  return textFieldContainerView;
}

- (void)textDidChange:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textFieldEditBlock](self, "textFieldEditBlock", a3));

  if (v4)
  {
    v6 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textFieldEditBlock](self, "textFieldEditBlock"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController editedValue](self, "editedValue"));
    v6[2](v6, v5);

  }
}

- (NSString)editedValue
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textField](self, "textField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setTextFieldPlaceholder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *textFieldPlaceholder;
  id v7;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  textFieldPlaceholder = self->_textFieldPlaceholder;
  self->_textFieldPlaceholder = v5;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textField](self, "textField"));
  objc_msgSend(v7, "setPlaceholder:", v4);

}

- (void)mapViewDidStartUserInteraction:(id)a3
{
  void *v4;
  char *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice", a3));
  v5 = (char *)objc_msgSend(v4, "orientation") - 3;

  if ((unint64_t)v5 <= 1)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textField](self, "textField"));
    objc_msgSend(v6, "resignFirstResponder");

  }
}

- (void)keyboardWillChangeFrame:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController navigationController](self, "navigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));
  objc_msgSend(v7, "frame");
  -[RAPAddAPlaceLocationRefinementViewController setPreviousNavigationControllerFrame:](self, "setPreviousNavigationControllerFrame:");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", UIKeyboardFrameEndUserInfoKey));
  objc_msgSend(v9, "CGRectValue");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = (id)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController view](self, "view"));
  objc_msgSend(v18, "convertRect:fromView:", 0, v11, v13, v15, v17);
  -[RAPAddAPlaceLocationRefinementViewController adjustTextFieldContainerPositionWithKeyboardFrame:](self, "adjustTextFieldContainerPositionWithKeyboardFrame:");

}

- (void)keyboardDidChangeFrameNotification:(id)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  BOOL v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  CGRect v32;
  CGRect v33;

  v31 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textField](self, "textField"));
  if (!objc_msgSend(v4, "isFirstResponder"))
    goto LABEL_4;
  -[RAPAddAPlaceLocationRefinementViewController previousNavigationControllerFrame](self, "previousNavigationControllerFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController navigationController](self, "navigationController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "superview"));
  objc_msgSend(v15, "frame");
  v33.origin.x = v16;
  v33.origin.y = v17;
  v33.size.width = v18;
  v33.size.height = v19;
  v32.origin.x = v6;
  v32.origin.y = v8;
  v32.size.width = v10;
  v32.size.height = v12;
  v20 = CGRectEqualToRect(v32, v33);

  if (!v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "userInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", UIKeyboardFrameEndUserInfoKey));
    objc_msgSend(v22, "CGRectValue");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController view](self, "view"));
    objc_msgSend(v4, "convertRect:fromView:", 0, v24, v26, v28, v30);
    -[RAPAddAPlaceLocationRefinementViewController adjustTextFieldContainerPositionWithKeyboardFrame:](self, "adjustTextFieldContainerPositionWithKeyboardFrame:");
LABEL_4:

  }
}

- (void)adjustTextFieldContainerPositionWithKeyboardFrame:(CGRect)a3
{
  double MinY;
  void *v5;
  double v6;
  id v7;
  CGRect v8;

  MinY = CGRectGetMinY(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  v6 = MinY - CGRectGetMaxY(v8);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[RAPAddAPlaceLocationRefinementViewController textFieldContainerViewBottomConstraint](self, "textFieldContainerViewBottomConstraint"));
  objc_msgSend(v7, "setConstant:", fmin(v6, 0.0));

}

- (NSString)textFieldPlaceholder
{
  return self->_textFieldPlaceholder;
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
  objc_storeStrong((id *)&self->_textField, a3);
}

- (NSLayoutConstraint)textFieldContainerViewBottomConstraint
{
  return self->_textFieldContainerViewBottomConstraint;
}

- (void)setTextFieldContainerViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textFieldContainerViewBottomConstraint, a3);
}

- (void)setTextFieldContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_textFieldContainerView, a3);
}

- (id)textFieldEditBlock
{
  return self->_textFieldEditBlock;
}

- (void)setTextFieldEditBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)textFieldTitle
{
  return self->_textFieldTitle;
}

- (void)setTextFieldTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)textFieldText
{
  return self->_textFieldText;
}

- (void)setTextFieldText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (CGRect)previousNavigationControllerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_previousNavigationControllerFrame.origin.x;
  y = self->_previousNavigationControllerFrame.origin.y;
  width = self->_previousNavigationControllerFrame.size.width;
  height = self->_previousNavigationControllerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPreviousNavigationControllerFrame:(CGRect)a3
{
  self->_previousNavigationControllerFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFieldText, 0);
  objc_storeStrong((id *)&self->_textFieldTitle, 0);
  objc_storeStrong(&self->_textFieldEditBlock, 0);
  objc_storeStrong((id *)&self->_textFieldContainerView, 0);
  objc_storeStrong((id *)&self->_textFieldContainerViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_textFieldPlaceholder, 0);
}

@end
