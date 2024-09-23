@implementation TeachableMomentContaineeViewController

- (TeachableMomentContaineeViewController)initWithTeachableMomentConfiguration:(id)a3
{
  id v5;
  TeachableMomentContaineeViewController *v6;
  TeachableMomentContaineeViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TeachableMomentContaineeViewController;
  v6 = -[TeachableMomentContaineeViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v7, "cardPresentationController"));
    objc_msgSend(v8, "setHideGrabber:", 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v7, "cardPresentationController"));
    objc_msgSend(v9, "setAllowsSwipeToDismiss:", 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v7, "cardPresentationController"));
    objc_msgSend(v10, "setPresentedModally:", 1);

  }
  return v7;
}

- (void)viewDidLoad
{
  UILabel *v3;
  UILabel *titleLabel;
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
  UIView *v16;
  UIView *animationContainer;
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
  UIView *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  UIButton *v39;
  UIButton *buttomButton;
  void *v41;
  void *v42;
  UIButton *v43;
  void *v44;
  UIButton *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  CardButton *v58;
  void *v59;
  CardButton *v60;
  CardButton *closeButton;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  _QWORD v94[4];
  id v95;
  id location;
  objc_super v97;
  _QWORD v98[2];
  _QWORD v99[5];
  _QWORD v100[4];
  _QWORD v101[3];

  v97.receiver = self;
  v97.super_class = (Class)TeachableMomentContaineeViewController;
  -[ContaineeViewController viewDidLoad](&v97, "viewDidLoad");
  v3 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TeachableMomentConfiguration title](self->_configuration, "title"));
  -[UILabel setText:](self->_titleLabel, "setText:", v6);

  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", self->_titleLabel, &stru_1011E79D8);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TeachableMomentContaineeViewController view](self, "view"));
  objc_msgSend(v7, "addSubview:", self->_titleLabel);

  v87 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[TeachableMomentContaineeViewController view](self, "view"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "leadingAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:constant:", v84, 32.0));
  v101[0] = v81;
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TeachableMomentContaineeViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:constant:", v9, -56.0));
  v101[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TeachableMomentContaineeViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, 60.0));
  v101[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v101, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

  v16 = (UIView *)objc_alloc_init((Class)UIView);
  animationContainer = self->_animationContainer;
  self->_animationContainer = v16;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_animationContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TeachableMomentContaineeViewController view](self, "view"));
  objc_msgSend(v18, "addSubview:", self->_animationContainer);

  v88 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_animationContainer, "leadingAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[TeachableMomentContaineeViewController view](self, "view"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "leadingAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToAnchor:", v85));
  v100[0] = v82;
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_animationContainer, "trailingAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[TeachableMomentContaineeViewController view](self, "view"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:", v74));
  v100[1] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_animationContainer, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
  v100[2] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_animationContainer, "heightAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_animationContainer, "widthAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:multiplier:constant:", v24, 0.64533335, 0.0));
  v100[3] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v100, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TeachableMomentConfiguration illustrationViewController](self->_configuration, "illustrationViewController"));
  -[TeachableMomentContaineeViewController addChildViewController:](self, "addChildViewController:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TeachableMomentConfiguration illustrationViewController](self->_configuration, "illustrationViewController"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "view"));
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v30 = self->_animationContainer;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[TeachableMomentConfiguration illustrationViewController](self->_configuration, "illustrationViewController"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "view"));
  -[UIView addSubview:](v30, "addSubview:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[TeachableMomentConfiguration illustrationViewController](self->_configuration, "illustrationViewController"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "view"));
  LODWORD(v35) = 1148846080;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "_maps_constraintsEqualToEdgesOfView:priority:", self->_animationContainer, v35));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "allConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v37);

  objc_initWeak(&location, self);
  v94[0] = _NSConcreteStackBlock;
  v94[1] = 3221225472;
  v94[2] = sub_1009B3E58;
  v94[3] = &unk_1011AF8A0;
  objc_copyWeak(&v95, &location);
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v94));
  v39 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:primaryAction:](UIButton, "buttonWithType:primaryAction:", 1, v38));
  buttomButton = self->_buttomButton;
  self->_buttomButton = v39;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_buttomButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_buttomButton, "layer"));
  objc_msgSend(v41, "setCornerRadius:", 10.0);

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  -[UIButton setBackgroundColor:](self->_buttomButton, "setBackgroundColor:", v42);

  v43 = self->_buttomButton;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[TeachableMomentConfiguration buttonTitle](self->_configuration, "buttonTitle"));
  -[UIButton setTitle:forState:](v43, "setTitle:forState:", v44, 0);

  v45 = self->_buttomButton;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  -[UIButton setTitleColor:forState:](v45, "setTitleColor:forState:", v46, 0);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_buttomButton, "titleLabel"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v47, &stru_1011E7BB8);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[TeachableMomentContaineeViewController view](self, "view"));
  objc_msgSend(v48, "addSubview:", self->_buttomButton);

  v92 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_buttomButton, "leadingAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[TeachableMomentContaineeViewController view](self, "view"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "leadingAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintEqualToAnchor:constant:", v89, 20.0));
  v99[0] = v86;
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_buttomButton, "trailingAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[TeachableMomentContaineeViewController view](self, "view"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "trailingAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToAnchor:constant:", v77, -20.0));
  v99[1] = v75;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_buttomButton, "topAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_animationContainer, "bottomAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v72));
  v99[2] = v49;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_buttomButton, "heightAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToConstant:", 52.0));
  v99[3] = v51;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_buttomButton, "bottomAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[TeachableMomentContaineeViewController view](self, "view"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "safeAreaLayoutGuide"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "bottomAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v55));
  v99[4] = v56;
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v99, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v57);

  v58 = [CardButton alloc];
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[CardButtonConfiguration close](CardButtonConfiguration, "close"));
  v60 = -[CardButton initWithConfiguration:](v58, "initWithConfiguration:", v59);
  closeButton = self->_closeButton;
  self->_closeButton = v60;

  -[CardButton setTranslatesAutoresizingMaskIntoConstraints:](self->_closeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CardButton addTarget:action:forControlEvents:](self->_closeButton, "addTarget:action:forControlEvents:", self, "_closeButtonAction:", 64);
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[TeachableMomentContaineeViewController view](self, "view"));
  objc_msgSend(v62, "addSubview:", self->_closeButton);

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton trailingAnchor](self->_closeButton, "trailingAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[TeachableMomentContaineeViewController view](self, "view"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "trailingAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:constant:", v65, 0.0));
  v98[0] = v66;
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton topAnchor](self->_closeButton, "topAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[TeachableMomentContaineeViewController view](self, "view"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "topAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:constant:", v69, 0.0));
  v98[1] = v70;
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v98, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v71);

  objc_destroyWeak(&v95);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TeachableMomentContaineeViewController;
  -[TeachableMomentContaineeViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[TeachableMomentContaineeViewController _setHasShownTeachableMomentFlag](self, "_setHasShownTeachableMomentFlag");
}

+ (BOOL)hasShownTeachableMoment
{
  return 0;
}

- (void)_setHasShownTeachableMomentFlag
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TeachableMomentConfiguration userDefaultSaveKey](self->_configuration, "userDefaultSaveKey"));
  objc_msgSend(v4, "setBool:forKey:", 1, v3);

}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  if (a3 == 6 || a3 == 3)
    -[ContaineeViewController handleDismissAction:](self, "handleDismissAction:", 0);
}

- (double)heightForLayout:(unint64_t)a3
{
  double v3;
  double height;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;

  v3 = -1.0;
  if (a3 == 5)
  {
    height = UILayoutFittingCompressedSize.height;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TeachableMomentContaineeViewController view](self, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TeachableMomentContaineeViewController view](self, "view"));
    objc_msgSend(v7, "frame");
    v9 = v8;
    LODWORD(v8) = 1148846080;
    LODWORD(v10) = 1112014848;
    objc_msgSend(v6, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v9, height, v8, v10);
    v3 = v11;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TeachableMomentContaineeViewController view](self, "view"));
    objc_msgSend(v12, "safeAreaInsets");
    v14 = v13;

    if (v14 == 0.0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v15, "bottomSafeOffset");
      v3 = v3 + v16;

    }
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_buttomButton, 0);
  objc_storeStrong((id *)&self->_animationContainer, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
