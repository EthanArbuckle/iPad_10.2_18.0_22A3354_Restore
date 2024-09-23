@implementation CardButton

- (CardButton)initWithConfiguration:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  CardButton *v19;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  v6 = objc_msgSend(v4, "blurred");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tintColor"));
  objc_msgSend(v4, "insets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "systemImageName"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "toolTip"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hoverBackgroundColor"));

  v19 = -[CardButton initWithType:blurred:tintColor:insets:systemImageName:toolTip:hoverBackgroundColor:](self, "initWithType:blurred:tintColor:insets:systemImageName:toolTip:hoverBackgroundColor:", v5, v6, v7, v16, v17, v18, v9, v11, v13, v15);
  return v19;
}

- (CardButton)initWithType:(unint64_t)a3 blurred:(BOOL)a4 tintColor:(id)a5 insets:(UIEdgeInsets)a6 systemImageName:(id)a7 toolTip:(id)a8 hoverBackgroundColor:(id)a9
{
  double right;
  double bottom;
  double left;
  double top;
  uint64_t v15;
  id v18;
  __CFString *v19;
  double y;
  double width;
  double height;
  CardButton *v23;
  CardButton *v24;
  _UNKNOWN **v25;
  void *v26;
  id v27;
  uint64_t v28;
  UIButton *v29;
  __CFString *v30;
  __CFString *v31;
  uint64_t v32;
  UIButton *v33;
  __CFString *v34;
  void *v35;
  id v36;
  uint64_t v37;
  UIButton *actionButton;
  const __CFString *v39;
  void *v40;
  void *v41;
  UIButton *v42;
  void *v43;
  uint64_t v44;
  UIButton *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  MapsAddButton *v51;
  void *v52;
  MapsAddButton *v53;
  UIButton *v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  UIButton *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  UIButton *v68;
  uint64_t v69;
  UIButton *v70;
  const __CFString *v71;
  void *v72;
  void *v73;
  UIButton *v74;
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
  id v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  double v90;
  void *v91;
  void *v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  void *v100;
  void *v101;
  uint64_t v102;
  NSLayoutConstraint *bottomMarginConstraint;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  id v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  unint64_t v119;
  void *v120;
  void *v121;
  uint64_t v123;
  void *v124;
  id v125;
  id v126;
  void *v127;
  void *v128;
  void *v129;
  double v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  __CFString *v136;
  void *v137;
  void *v138;
  void *v139;
  char v140;
  void *v141;
  unint64_t v142;
  id v143;
  __CFString *v144;
  id v145;
  objc_super v146;
  _QWORD v147[4];
  _QWORD v148[4];
  _QWORD v149[2];
  _QWORD v150[2];
  CGRect v151;

  right = a6.right;
  bottom = a6.bottom;
  left = a6.left;
  top = a6.top;
  LODWORD(v15) = a4;
  v18 = a5;
  v19 = (__CFString *)a7;
  v146.receiver = self;
  v146.super_class = (Class)CardButton;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v143 = a8;
  v23 = -[CardButton initWithFrame:](&v146, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v24 = v23;
  v25 = MKPlaceCollectionsLogicController_ptr;
  v144 = v19;
  v145 = v18;
  if (v23)
  {
    v23->_type = a3;
    v140 = v15;
    v142 = a3;
    switch(a3)
    {
      case 0uLL:
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton traitCollection](v23, "traitCollection"));
        v36 = objc_msgSend(v35, "userInterfaceIdiom");

        if (v36 == (id)5)
        {
          v37 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
          actionButton = v24->_actionButton;
          v24->_actionButton = (UIButton *)v37;

          if (v19)
            v39 = v19;
          else
            v39 = CFSTR("xmark.circle.fill");
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v39));
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "imageWithRenderingMode:", 2));

          -[UIButton setImage:forState:](v24->_actionButton, "setImage:forState:", v41, 0);
          v42 = v24->_actionButton;
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 4, 14.0));
          -[UIButton setPreferredSymbolConfiguration:forImageInState:](v42, "setPreferredSymbolConfiguration:forImageInState:", v43, 0);

          if (v18)
          {
            -[UIButton setTintColor:](v24->_actionButton, "setTintColor:", v18);
          }
          else
          {
            v124 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
            -[UIButton setTintColor:](v24->_actionButton, "setTintColor:", v124);

          }
          v125 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
          v126 = objc_msgSend(v125, "CGColor");
          v127 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v24->_actionButton, "layer"));
          objc_msgSend(v127, "setShadowColor:", v126);

          v128 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v24->_actionButton, "layer"));
          objc_msgSend(v128, "setShadowOffset:", 0.0, 0.0);

          v129 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v24->_actionButton, "layer"));
          LODWORD(v130) = 0.25;
          objc_msgSend(v129, "setShadowOpacity:", v130);

        }
        else
        {
          if (!(_DWORD)v15)
          {
            v123 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 7));
            v68 = v24->_actionButton;
            v24->_actionButton = (UIButton *)v123;
            goto LABEL_33;
          }
          v69 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
          v70 = v24->_actionButton;
          v24->_actionButton = (UIButton *)v69;

          if (v19)
            v71 = v19;
          else
            v71 = CFSTR("xmark");
          v72 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 7, 15.0));
          v73 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v71, v72));

          v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "imageWithRenderingMode:", 2));
          -[UIButton setImage:forState:](v24->_actionButton, "setImage:forState:", v137, 0);
          v74 = v24->_actionButton;
          v75 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
          -[UIButton setTintColor:](v74, "setTintColor:", v75);

          v76 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](v24->_actionButton, "heightAnchor"));
          v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToConstant:", 20.0));
          v150[0] = v77;
          v78 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](v24->_actionButton, "widthAnchor"));
          v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToConstant:", 20.0));
          v150[1] = v79;
          v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v150, 2));
          +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v80);

          v25 = MKPlaceCollectionsLogicController_ptr;
          top = 24.0;
          left = 24.0;
          bottom = 24.0;
          right = 24.0;
        }
        break;
      case 1uLL:
      case 2uLL:
      case 4uLL:
        if (v19)
        {
          v31 = v19;
        }
        else if (a3 - 1 > 3)
        {
          v31 = 0;
        }
        else
        {
          v31 = off_1011DC568[a3 - 1];
        }
        v57 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
        v58 = v24->_actionButton;
        v24->_actionButton = (UIButton *)v57;

        v59 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 15.0));
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v31, v59));

        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "imageWithRenderingMode:", 2));
        -[UIButton setImage:forState:](v24->_actionButton, "setImage:forState:", v61, 0);
        v136 = v31;
        if (v18)
        {
          -[UIButton setTintColor:](v24->_actionButton, "setTintColor:", v18);
        }
        else
        {
          v62 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
          -[UIButton setTintColor:](v24->_actionButton, "setTintColor:", v62);

        }
        -[UIButton setAdjustsImageWhenHighlighted:](v24->_actionButton, "setAdjustsImageWhenHighlighted:", 0);
        -[UIButton setContextMenuInteractionEnabled:](v24->_actionButton, "setContextMenuInteractionEnabled:", 1);
        -[UIButton setShowsMenuAsPrimaryAction:](v24->_actionButton, "setShowsMenuAsPrimaryAction:", 1);
        v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](v24->_actionButton, "heightAnchor"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToConstant:", 24.0));
        v149[0] = v64;
        v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](v24->_actionButton, "widthAnchor"));
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToConstant:", 24.0));
        v149[1] = v66;
        v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v149, 2));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v67);

        v25 = MKPlaceCollectionsLogicController_ptr;
        v68 = (UIButton *)v136;
LABEL_33:

        break;
      case 3uLL:
        v44 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 7));
        v45 = v24->_actionButton;
        v24->_actionButton = (UIButton *)v44;

        if (v19)
          v46 = v19;
        else
          v46 = CFSTR("square.and.arrow.up");
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 15.0));
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v46, v47));

        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "imageWithRenderingMode:", 2));
        -[UIButton setImage:forState:](v24->_actionButton, "setImage:forState:", v49, 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
        -[UIButton setTintColor:](v24->_actionButton, "setTintColor:", v50);

        goto LABEL_23;
      case 7uLL:
        v51 = [MapsAddButton alloc];
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("[RouteCreation] Route Library Create"), CFSTR("localized string not found"), 0));
        v53 = -[MapsAddButton initWithTitle:](v51, "initWithTitle:", v52);
        v54 = v24->_actionButton;
        v24->_actionButton = &v53->super;

LABEL_23:
        break;
      case 8uLL:
      case 9uLL:
      case 0xAuLL:
      case 0xBuLL:
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton traitCollection](v23, "traitCollection"));
        v27 = objc_msgSend(v26, "userInterfaceIdiom");

        if (v27 == (id)5)
        {
          v28 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
          v29 = v24->_actionButton;
          v24->_actionButton = (UIButton *)v28;

          if (v19)
          {
            v30 = v19;
          }
          else
          {
            v55 = v24->_type - 8;
            if (v55 > 3)
              v30 = 0;
            else
              v30 = *(&off_1011DC588 + v55);
          }
          v81 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 4, 14.0));
          v82 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v30, v81));
          v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "imageWithRenderingMode:", 2));

          -[UIButton setImage:forState:](v24->_actionButton, "setImage:forState:", v83, 0);
          if (v18)
          {
            -[UIButton setTintColor:](v24->_actionButton, "setTintColor:", v18);
          }
          else
          {
            v84 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
            -[UIButton setTintColor:](v24->_actionButton, "setTintColor:", v84);

          }
          v85 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
          v86 = objc_msgSend(v85, "CGColor");
          v87 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v24->_actionButton, "layer"));
          objc_msgSend(v87, "setShadowColor:", v86);

          v88 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v24->_actionButton, "layer"));
          objc_msgSend(v88, "setShadowOffset:", 0.0, 0.0);

          v89 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v24->_actionButton, "layer"));
          LODWORD(v90) = 0.25;
          objc_msgSend(v89, "setShadowOpacity:", v90);

          v25 = MKPlaceCollectionsLogicController_ptr;
        }
        else
        {
          v32 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 7));
          v33 = v24->_actionButton;
          v24->_actionButton = (UIButton *)v32;

          if (v19)
          {
            v34 = v19;
          }
          else
          {
            v56 = v24->_type - 8;
            if (v56 > 3)
              v34 = 0;
            else
              v34 = *(&off_1011DC5A8 + v56);
          }
          v91 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 7, 2, 15.0));
          v92 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v34, v91));
          v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "imageWithRenderingMode:", 2));

          -[UIButton setImage:forState:](v24->_actionButton, "setImage:forState:", v93, 0);
        }
        break;
      default:
        break;
    }
    -[UIButton setPointerInteractionEnabled:](v24->_actionButton, "setPointerInteractionEnabled:", 1);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v24->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v94) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v24->_actionButton, "setContentCompressionResistancePriority:forAxis:", 0, v94);
    LODWORD(v95) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v24->_actionButton, "setContentHuggingPriority:forAxis:", 0, v95);
    LODWORD(v96) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v24->_actionButton, "setContentCompressionResistancePriority:forAxis:", 1, v96);
    LODWORD(v97) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v24->_actionButton, "setContentHuggingPriority:forAxis:", 1, v97);
    v98 = -bottom;
    v99 = -right;
    if (sub_1002A8AA0(v24) != 5)
      -[UIButton _setTouchInsets:](v24->_actionButton, "_setTouchInsets:", -top, -left, v98, v99);
    -[CardButton addSubview:](v24, "addSubview:", v24->_actionButton);
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](v24->_actionButton, "bottomAnchor"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton bottomAnchor](v24, "bottomAnchor"));
    v102 = objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintEqualToAnchor:constant:", v101, v98));
    bottomMarginConstraint = v24->_bottomMarginConstraint;
    v24->_bottomMarginConstraint = (NSLayoutConstraint *)v102;

    v132 = v25[348];
    v138 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](v24->_actionButton, "topAnchor"));
    v134 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton topAnchor](v24, "topAnchor"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "constraintEqualToAnchor:constant:", v134, top));
    v148[0] = v104;
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](v24->_actionButton, "leadingAnchor"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton leadingAnchor](v24, "leadingAnchor"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintEqualToAnchor:constant:", v106, left));
    v148[1] = v107;
    v108 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](v24->_actionButton, "trailingAnchor"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton trailingAnchor](v24, "trailingAnchor"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "constraintEqualToAnchor:constant:", v109, v99));
    v148[2] = v110;
    v148[3] = v24->_bottomMarginConstraint;
    v15 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v148, 4));
    objc_msgSend(v132, "activateConstraints:", v15);

    -[UIButton sizeToFit](v24->_actionButton, "sizeToFit");
    -[UIButton bounds](v24->_actionButton, "bounds");
    -[UIButton _setCornerRadius:](v24->_actionButton, "_setCornerRadius:", CGRectGetWidth(v151) * 0.5);
    v19 = v144;
    v18 = v145;
    a3 = v142;
    LOBYTE(v15) = v140;
  }
  if ((v15 & 1) != 0)
  {
    v111 = objc_alloc((Class)UIVisualEffectView);
    v112 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 16));
    v113 = objc_msgSend(v111, "initWithEffect:", v112);

    objc_msgSend(v113, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v113, "_setCornerRadius:", 14.0);
    -[CardButton insertSubview:belowSubview:](v24, "insertSubview:belowSubview:", v113, v24->_actionButton);
    v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "centerXAnchor"));
    v139 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerXAnchor](v24->_actionButton, "centerXAnchor"));
    v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "constraintEqualToAnchor:", v139));
    v147[0] = v135;
    v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "centerYAnchor"));
    v131 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](v24->_actionButton, "centerYAnchor"));
    v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "constraintEqualToAnchor:", v131));
    v147[1] = v114;
    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "heightAnchor"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "constraintEqualToConstant:", 28.0));
    v147[2] = v116;
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "widthAnchor"));
    v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "constraintEqualToConstant:", 28.0));
    v147[3] = v118;
    v119 = a3;
    v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v147, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v120);

    a3 = v119;
    v18 = v145;

    v19 = v144;
  }
  -[UIButton setAccessibilityIdentifier:](v24->_actionButton, "setAccessibilityIdentifier:", CFSTR("CardButtonActionButton"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(-[CardButton _cardButtonTypeAsString:](v24, "_cardButtonTypeAsString:", a3));
  -[CardButton setAccessibilityIdentifier:](v24, "setAccessibilityIdentifier:", v121);

  -[UIButton setToolTip:](v24->_actionButton, "setToolTip:", v143);
  return v24;
}

- (UIView)viewForVisualAlignment
{
  return (UIView *)self->_actionButton;
}

- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
  -[UIButton addTarget:action:forControlEvents:](self->_actionButton, "addTarget:action:forControlEvents:", a3, a4, a5);
}

- (UIMenu)menu
{
  return -[UIButton menu](self->_actionButton, "menu");
}

- (void)setMenu:(id)a3
{
  -[UIButton setMenu:](self->_actionButton, "setMenu:", a3);
}

- (double)bottomMargin
{
  double result;

  -[NSLayoutConstraint constant](self->_bottomMarginConstraint, "constant");
  return result;
}

- (void)setBottomMargin:(double)a3
{
  -[NSLayoutConstraint setConstant:](self->_bottomMarginConstraint, "setConstant:", -a3);
  if (sub_1002A8AA0(self) != 5)
  {
    -[UIButton _touchInsets](self->_actionButton, "_touchInsets");
    -[UIButton _setTouchInsets:](self->_actionButton, "_setTouchInsets:");
  }
}

- (id)_cardButtonTypeAsString:(unint64_t)a3
{
  if (a3 - 1 > 0xA)
    return CFSTR("CardButtonTypeClose");
  else
    return *(&off_1011DC5C8 + a3 - 1);
}

- (UIButton)underlyingButton
{
  return self->_actionButton;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomMarginConstraint, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
}

@end
