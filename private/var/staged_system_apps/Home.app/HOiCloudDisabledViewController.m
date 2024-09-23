@implementation HOiCloudDisabledViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UIImageView *v5;
  UIImageView *imageView;
  void *v7;
  UILabel *v8;
  UILabel *titleLabel;
  void *v10;
  UILabel *v11;
  UILabel *bodyLabel;
  void *v13;
  UIView *v14;
  UIView *containerView;
  HUColoredButton *v16;
  HUColoredButton *preferencesButton;
  HUColoredButton *v18;
  __CFString *v19;
  void *v20;
  HUColoredButton *v21;
  void *v22;
  HUColoredButton *v23;
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
  NSMutableArray *v35;
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
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
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
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  double v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  objc_super v124;

  v124.receiver = self;
  v124.super_class = (Class)HOiCloudDisabledViewController;
  -[HOiCloudDisabledViewController viewDidLoad](&v124, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  imageView = self->_imageView;
  self->_imageView = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("app-icon-mac")));
  -[UIImageView setImage:](self->_imageView, "setImage:", v7);

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v8;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 20.0));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v10);

  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  v11 = (UILabel *)objc_alloc_init((Class)UILabel);
  bodyLabel = self->_bodyLabel;
  self->_bodyLabel = v11;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_bodyLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_bodyLabel, "setFont:", v13);

  -[UILabel setTextAlignment:](self->_bodyLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_bodyLabel, "setNumberOfLines:", 0);
  v14 = (UIView *)objc_alloc_init((Class)UIView);
  containerView = self->_containerView;
  self->_containerView = v14;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = (HUColoredButton *)objc_msgSend(objc_alloc((Class)HUColoredButton), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  preferencesButton = self->_preferencesButton;
  self->_preferencesButton = v16;

  -[HUColoredButton setTranslatesAutoresizingMaskIntoConstraints:](self->_preferencesButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v18 = self->_preferencesButton;
  v19 = sub_10000C8A0(CFSTR("HODataSycningNoAccountActionTitle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  -[HUColoredButton setTitle:forState:](v18, "setTitle:forState:", v20, 0);

  -[HUColoredButton addTarget:action:forControlEvents:](self->_preferencesButton, "addTarget:action:forControlEvents:", self, "preferencesButtonTapped", 64);
  v21 = self->_preferencesButton;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
  -[HUColoredButton setTintColor:](v21, "setTintColor:", v22);

  v23 = self->_preferencesButton;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
  -[HUColoredButton setBackgroundColor:](v23, "setBackgroundColor:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController view](self, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController containerView](self, "containerView"));
  objc_msgSend(v25, "addSubview:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController containerView](self, "containerView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController imageView](self, "imageView"));
  objc_msgSend(v27, "addSubview:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController containerView](self, "containerView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v29, "addSubview:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController containerView](self, "containerView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController bodyLabel](self, "bodyLabel"));
  objc_msgSend(v31, "addSubview:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController containerView](self, "containerView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController preferencesButton](self, "preferencesButton"));
  objc_msgSend(v33, "addSubview:", v34);

  v35 = objc_opt_new(NSMutableArray);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController containerView](self, "containerView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "centerYAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController view](self, "view"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "centerYAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v39));
  -[NSMutableArray addObject:](v35, "addObject:", v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController containerView](self, "containerView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "widthAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController view](self, "view"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "widthAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v44));
  -[NSMutableArray addObject:](v35, "addObject:", v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController containerView](self, "containerView"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "leadingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController view](self, "view"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "leadingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v49));
  -[NSMutableArray addObject:](v35, "addObject:", v50);

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController containerView](self, "containerView"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "trailingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController view](self, "view"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "trailingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v54));
  -[NSMutableArray addObject:](v35, "addObject:", v55);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController imageView](self, "imageView"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "topAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController containerView](self, "containerView"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "topAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v59));
  -[NSMutableArray addObject:](v35, "addObject:", v60);

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController imageView](self, "imageView"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "widthAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToConstant:", 256.0));
  -[NSMutableArray addObject:](v35, "addObject:", v63);

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController imageView](self, "imageView"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "heightAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToConstant:", 256.0));
  -[NSMutableArray addObject:](v35, "addObject:", v66);

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController imageView](self, "imageView"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "centerXAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController containerView](self, "containerView"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "centerXAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:", v70));
  -[NSMutableArray addObject:](v35, "addObject:", v71);

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController titleLabel](self, "titleLabel"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "leadingAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController containerView](self, "containerView"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "leadingAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v75));
  -[NSMutableArray addObject:](v35, "addObject:", v76);

  v77 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController titleLabel](self, "titleLabel"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "trailingAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController containerView](self, "containerView"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "trailingAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:", v80));
  -[NSMutableArray addObject:](v35, "addObject:", v81);

  v82 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController titleLabel](self, "titleLabel"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "topAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController imageView](self, "imageView"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "bottomAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:constant:", v85, 10.0));
  -[NSMutableArray addObject:](v35, "addObject:", v86);

  v87 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController bodyLabel](self, "bodyLabel"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "topAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController titleLabel](self, "titleLabel"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "bottomAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v90, 1.0));
  -[NSMutableArray addObject:](v35, "addObject:", v91);

  v92 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController bodyLabel](self, "bodyLabel"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "centerXAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController containerView](self, "containerView"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "centerXAnchor"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:", v95));
  -[NSMutableArray addObject:](v35, "addObject:", v96);

  v97 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController bodyLabel](self, "bodyLabel"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "widthAnchor"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController view](self, "view"));
  objc_msgSend(v99, "frame");
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintEqualToConstant:", v100));
  -[HOiCloudDisabledViewController setBodyWidthConstraint:](self, "setBodyWidthConstraint:", v101);

  v102 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController bodyWidthConstraint](self, "bodyWidthConstraint"));
  -[NSMutableArray addObject:](v35, "addObject:", v102);

  v103 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController preferencesButton](self, "preferencesButton"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "centerXAnchor"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController containerView](self, "containerView"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "centerXAnchor"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToAnchor:", v106));
  -[NSMutableArray addObject:](v35, "addObject:", v107);

  v108 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController preferencesButton](self, "preferencesButton"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "topAnchor"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController bodyLabel](self, "bodyLabel"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "bottomAnchor"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToAnchor:constant:", v111, 40.0));
  -[NSMutableArray addObject:](v35, "addObject:", v112);

  v113 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController preferencesButton](self, "preferencesButton"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "bottomAnchor"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController containerView](self, "containerView"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "bottomAnchor"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "constraintEqualToAnchor:", v116));
  -[NSMutableArray addObject:](v35, "addObject:", v117);

  v118 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController preferencesButton](self, "preferencesButton"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "heightAnchor"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "constraintEqualToConstant:", 50.0));
  -[NSMutableArray addObject:](v35, "addObject:", v120);

  v121 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController preferencesButton](self, "preferencesButton"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "widthAnchor"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "constraintEqualToConstant:", 250.0));
  -[NSMutableArray addObject:](v35, "addObject:", v123);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v35);
  -[HOiCloudDisabledViewController updateLabels](self, "updateLabels");

}

- (id)hu_preloadContent
{
  return +[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult");
}

- (void)setDataSyncState:(unint64_t)a3
{
  self->_dataSyncState = a3;
  -[HOiCloudDisabledViewController updateLabels](self, "updateLabels");
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
  -[HOiCloudDisabledViewController updateLabels](self, "updateLabels");
}

- (void)updateLabels
{
  uint64_t v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  id v22;

  v3 = objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController titleLabel](self, "titleLabel"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController bodyLabel](self, "bodyLabel"));

    if (v5)
    {
      if ((-[HOiCloudDisabledViewController status](self, "status") & 0x20) != 0)
      {
        v16 = sub_10000C8A0(CFSTR("HODataSyncingNoAccountAlertTitle"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController titleLabel](self, "titleLabel"));
        objc_msgSend(v18, "setText:", v17);

        v19 = sub_10000C8A0(CFSTR("HODataSyncingNoAccountAlertBody"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController bodyLabel](self, "bodyLabel"));
        objc_msgSend(v21, "setText:", v20);

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController bodyWidthConstraint](self, "bodyWidthConstraint"));
        objc_msgSend(v12, "setConstant:", 380.0);
      }
      else
      {
        if ((id)-[HOiCloudDisabledViewController dataSyncState](self, "dataSyncState") != (id)3)
        {
LABEL_9:
          v22 = (id)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController view](self, "view"));
          objc_msgSend(v22, "layoutIfNeeded");

          return;
        }
        v6 = sub_10000C8A0(CFSTR("HODataSyncingTurnedOffAlertTitle"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController titleLabel](self, "titleLabel"));
        objc_msgSend(v8, "setText:", v7);

        v9 = sub_10000C8A0(CFSTR("HODataSyncingTurnedOffAlertBody"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController bodyLabel](self, "bodyLabel"));
        objc_msgSend(v11, "setText:", v10);

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController view](self, "view"));
        objc_msgSend(v12, "frame");
        v14 = v13;
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[HOiCloudDisabledViewController bodyWidthConstraint](self, "bodyWidthConstraint"));
        objc_msgSend(v15, "setConstant:", v14);

      }
      goto LABEL_9;
    }
  }
}

- (void)preferencesButtonTapped
{
  uint64_t v4;
  NSObject *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  HOiCloudDisabledViewController *v11;
  __int16 v12;
  void *v13;

  v4 = HFLogForCategory(68);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v10 = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v10, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL hf_openiCloudPreferencesURL](NSURL, "hf_openiCloudPreferencesURL"));
  objc_msgSend(v8, "openURL:withCompletionHandler:", v9, 0);

}

- (unint64_t)dataSyncState
{
  return self->_dataSyncState;
}

- (unint64_t)status
{
  return self->_status;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bodyLabel, a3);
}

- (HUColoredButton)preferencesButton
{
  return self->_preferencesButton;
}

- (void)setPreferencesButton:(id)a3
{
  objc_storeStrong((id *)&self->_preferencesButton, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (NSLayoutConstraint)bodyWidthConstraint
{
  return self->_bodyWidthConstraint;
}

- (void)setBodyWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bodyWidthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyWidthConstraint, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_preferencesButton, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
