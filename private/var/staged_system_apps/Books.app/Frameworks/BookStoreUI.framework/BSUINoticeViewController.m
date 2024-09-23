@implementation BSUINoticeViewController

+ (BSUIAddToWTRDelegate)addToWTRDelegate
{
  return (BSUIAddToWTRDelegate *)objc_loadWeakRetained(&qword_32C088);
}

+ (void)setAddToWTRDelegate:(id)a3
{
  objc_storeWeak(&qword_32C088, a3);
}

- (BSUINoticeViewController)initWithTitle:(id)a3 message:(id)a4 image:(id)a5
{
  return -[BSUINoticeViewController initWithTitle:message:image:confirmString:](self, "initWithTitle:message:image:confirmString:", a3, a4, a5, 0);
}

- (BSUINoticeViewController)initWithTitle:(id)a3 message:(id)a4 image:(id)a5 confirmString:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BSUINoticeViewController *v14;
  BSUINoticeViewController *v15;
  NSString *v16;
  NSString *noticeTitle;
  NSString *v18;
  NSString *message;
  NSString *v20;
  NSString *confirmString;
  uint64_t v22;
  BSUINoticeViewLayout *noticeViewLayout;
  void *v24;
  id v25;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)BSUINoticeViewController;
  v14 = -[BSUINoticeViewController init](&v27, "init");
  v15 = v14;
  if (v14)
  {
    -[BSUINoticeViewController setModalPresentationStyle:](v14, "setModalPresentationStyle:", 6);
    v16 = (NSString *)objc_msgSend(v10, "copy");
    noticeTitle = v15->_noticeTitle;
    v15->_noticeTitle = v16;

    v18 = (NSString *)objc_msgSend(v11, "copy");
    message = v15->_message;
    v15->_message = v18;

    v20 = (NSString *)objc_msgSend(v13, "copy");
    confirmString = v15->_confirmString;
    v15->_confirmString = v20;

    objc_storeStrong((id *)&v15->_iconImage, a5);
    v15->_iconImageAlwaysTemplate = 1;
    v22 = objc_claimAutoreleasedReturnValue(+[BSUINoticeViewLayout layoutWithAction:](BSUINoticeViewLayout, "layoutWithAction:", objc_msgSend(v13, "length") != 0));
    noticeViewLayout = v15->_noticeViewLayout;
    v15->_noticeViewLayout = (BSUINoticeViewLayout *)v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v25 = -[BSUINoticeViewController registerForTraitChanges:withAction:](v15, "registerForTraitChanges:withAction:", v24, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v15;
}

- (BSUINoticeViewController)initWithTitle:(id)a3 message:(id)a4 imageURLString:(id)a5
{
  id v8;
  id v9;
  id v10;
  BSUINoticeViewController *v11;
  BSUINoticeViewController *v12;
  NSString *v13;
  NSString *noticeTitle;
  NSString *v15;
  NSString *message;
  NSString *v17;
  NSString *imageURL;
  uint64_t v19;
  BSUINoticeViewLayout *noticeViewLayout;
  void *v21;
  id v22;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)BSUINoticeViewController;
  v11 = -[BSUINoticeViewController init](&v24, "init");
  v12 = v11;
  if (v11)
  {
    -[BSUINoticeViewController setModalPresentationStyle:](v11, "setModalPresentationStyle:", 6);
    v13 = (NSString *)objc_msgSend(v8, "copy");
    noticeTitle = v12->_noticeTitle;
    v12->_noticeTitle = v13;

    v15 = (NSString *)objc_msgSend(v9, "copy");
    message = v12->_message;
    v12->_message = v15;

    v17 = (NSString *)objc_msgSend(v10, "copy");
    imageURL = v12->_imageURL;
    v12->_imageURL = v17;

    v12->_iconImageAlwaysTemplate = 1;
    v19 = objc_claimAutoreleasedReturnValue(+[BSUINoticeViewLayout layoutWithAction:](BSUINoticeViewLayout, "layoutWithAction:", 0));
    noticeViewLayout = v12->_noticeViewLayout;
    v12->_noticeViewLayout = (BSUINoticeViewLayout *)v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v22 = -[BSUINoticeViewController registerForTraitChanges:withAction:](v12, "registerForTraitChanges:withAction:", v21, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v12;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BSUINoticeViewController;
  -[BSUINoticeViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v4, "viewDidMoveToWindow:shouldAppearOrDisappear:", a3, a4);
}

- (void)viewDidLoad
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  UIAccessibilityTraits v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  UIAccessibilityTraits v32;
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
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)BSUINoticeViewController;
  -[BSUINoticeViewController viewDidLoad](&v52, "viewDidLoad");
  v3 = -[BSUINoticeViewController shouldDismissAutomatically](self, "shouldDismissAutomatically");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController view](self, "view"));
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setAccessibilityElementsHidden:", 1);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController view](self, "view"));
    objc_msgSend(v6, "setAccessibilityElements:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController presentationController](self, "presentationController"));
    objc_msgSend(v7, "_setContainerIgnoresDirectTouchEvents:", 1);

    v8 = (id)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController view](self, "view"));
    objc_msgSend(v8, "setUserInteractionEnabled:", 0);
  }
  else
  {
    objc_msgSend(v4, "setAccessibilityViewIsModal:", 1);

    v8 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleTapGesture:");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController noticeView](self, "noticeView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentView"));
    objc_msgSend(v10, "addGestureRecognizer:", v8);

  }
  v11 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[BSUINoticeViewController setIconImageView:](self, "setIconImageView:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController iconImageView](self, "iconImageView"));
  objc_msgSend(v12, "setContentMode:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController iconImageView](self, "iconImageView"));
  objc_msgSend(v13, "setAlpha:", 0.64);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController iconImage](self, "iconImage"));
  if (v14)
  {
    v15 = -[BSUINoticeViewController iconImageAlwaysTemplate](self, "iconImageAlwaysTemplate");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController iconImage](self, "iconImage"));
    v17 = v16;
    v18 = v16;
    if (v15)
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "imageWithRenderingMode:", 2));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController iconImageView](self, "iconImageView"));
    objc_msgSend(v19, "setImage:", v18);

    if ((v15 & 1) != 0)
  }
  else
  {
    -[BSUINoticeViewController downloadIcon](self, "downloadIcon");
  }
  v20 = objc_alloc_init((Class)UILabel);
  -[BSUINoticeViewController setTitleLabel:](self, "setTitleLabel:", v20);

  v21 = UIAccessibilityTraitHeader | UIAccessibilityTraitStaticText;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v22, "setAccessibilityTraits:", v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v23, "setTextAlignment:", 1);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v24, "setNumberOfLines:", 2);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v25, "setLineBreakMode:", 4);

  v26 = objc_alloc_init((Class)UILabel);
  -[BSUINoticeViewController setMessageLabel:](self, "setMessageLabel:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController messageLabel](self, "messageLabel"));
  objc_msgSend(v27, "setTextAlignment:", 1);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController messageLabel](self, "messageLabel"));
  objc_msgSend(v28, "setNumberOfLines:", 0);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController messageLabel](self, "messageLabel"));
  objc_msgSend(v29, "setLineBreakMode:", 4);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController confirmString](self, "confirmString"));
  if (v30)
  {
    v31 = objc_alloc_init((Class)UILabel);
    -[BSUINoticeViewController setConfirmLabel:](self, "setConfirmLabel:", v31);

    v32 = UIAccessibilityTraitButton;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController confirmLabel](self, "confirmLabel"));
    objc_msgSend(v33, "setAccessibilityTraits:", v32);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController confirmLabel](self, "confirmLabel"));
    objc_msgSend(v34, "setTextAlignment:", 1);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController confirmLabel](self, "confirmLabel"));
    objc_msgSend(v35, "setNumberOfLines:", 1);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController confirmLabel](self, "confirmLabel"));
    objc_msgSend(v36, "setLineBreakMode:", 4);

  }
  -[BSUINoticeViewController _updateTitleMessageAndConfirmLabels](self, "_updateTitleMessageAndConfirmLabels");
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController noticeView](self, "noticeView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "contentView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController iconImageView](self, "iconImageView"));
  objc_msgSend(v38, "addSubview:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController noticeView](self, "noticeView"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "contentView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v41, "addSubview:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController noticeView](self, "noticeView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "contentView"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController messageLabel](self, "messageLabel"));
  objc_msgSend(v44, "addSubview:", v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController confirmLabel](self, "confirmLabel"));
  if (v46)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController noticeView](self, "noticeView"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "contentView"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController confirmLabel](self, "confirmLabel"));
    objc_msgSend(v48, "addSubview:", v49);

  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController view](self, "view"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController noticeView](self, "noticeView"));
  objc_msgSend(v50, "addSubview:", v51);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  double v90;
  double v91;
  void *v92;
  double v93;
  double v94;
  void *v95;
  double v96;
  double v97;
  void *v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  void *v107;
  double v108;
  double v109;
  void *v110;
  void *v111;
  double v112;
  double v113;
  double v114;
  double v115;
  void *v116;
  double MinX;
  void *v118;
  double MinY;
  void *v120;
  void *v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  void *v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  void *v139;
  uint64_t v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  void *v149;
  double v150;
  objc_super v151;
  NSAttributedStringKey v152;
  void *v153;
  NSAttributedStringKey v154;
  void *v155;
  CGRect v156;
  CGRect v157;

  v151.receiver = self;
  v151.super_class = (Class)BSUINoticeViewController;
  -[BSUINoticeViewController viewDidLayoutSubviews](&v151, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController noticeViewLayout](self, "noticeViewLayout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController titleLabel](self, "titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v154 = NSFontAttributeName;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController titleLabel](self, "titleLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "font"));
  v155 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v155, &v154, 1));
  objc_msgSend(v5, "sizeWithAttributes:", v8);
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController messageLabel](self, "messageLabel"));
  objc_msgSend(v3, "defaultSize");
  v13 = v12;
  objc_msgSend(v3, "horizontalMargin");
  v15 = -[BSUINoticeViewController _lineCountForLabel:constrainedToWidth:](self, "_lineCountForLabel:constrainedToWidth:", v11, v13 + v14 * -2.0);

  if (v15 >= 5)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController messageLabel](self, "messageLabel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "text"));
    v152 = NSFontAttributeName;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController messageLabel](self, "messageLabel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "font"));
    v153 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v153, &v152, 1));
    objc_msgSend(v17, "sizeWithAttributes:", v20);
    v22 = v21;

    if (v10 < v22)
      v10 = v22;
  }
  objc_msgSend(v3, "defaultSize");
  v24 = v23;
  objc_msgSend(v3, "horizontalMargin");
  v26 = v10 + v25 * 2.0;
  if (v24 >= v26)
    v27 = v24;
  else
    v27 = v26;
  objc_msgSend(v3, "maxWidth");
  if (v27 >= v28)
    v27 = v28;
  objc_msgSend(v3, "maxHeight");
  v30 = v29;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController noticeView](self, "noticeView"));
  objc_msgSend(v31, "setFrame:", 0.0, 0.0, v27, v30);

  objc_msgSend(v3, "maxHeight");
  v33 = v32;
  objc_msgSend(v3, "topContentInset");
  v35 = v33 - v34;
  objc_msgSend(v3, "bottomContentInset");
  v37 = v35 - v36;
  objc_msgSend(v3, "imageSize");
  v39 = v38;
  objc_msgSend(v3, "imageSize");
  v41 = v40;
  objc_msgSend(v3, "topContentInset");
  v43 = v42 + 0.0;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController iconImageView](self, "iconImageView"));
  objc_msgSend(v44, "setFrame:", (v27 - v39) * 0.5, v43, v39, v41);

  v45 = v41 + v43;
  v46 = v37 - v41;
  objc_msgSend(v3, "titleTopMargin");
  v48 = v45 + v47;
  objc_msgSend(v3, "titleTopMargin");
  v150 = v46 - v49;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v3, "horizontalMargin");
  v52 = v27 + v51 * -2.0;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v53, "bounds");
  objc_msgSend(v50, "sizeThatFits:", v52, v54);
  v56 = v55;

  objc_msgSend(v3, "horizontalMargin");
  v58 = v57;
  objc_msgSend(v3, "horizontalMargin");
  v60 = v27 + v59 * -2.0;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v61, "setFrame:", v58, v48 - v56 * 0.5, v60, v56 + v56 * 0.5 * 2.0);

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v62, "center");
  v64 = v63;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v65, "setCenter:", v27 * 0.5, v64);

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v66, "_lastLineBaseline");
  v68 = v48 + ceil(v67 - v56 * 0.5);

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v69, "_lastLineBaseline");
  v71 = v150 - ceil(v70 - v56 * 0.5);

  objc_msgSend(v3, "messageTopMargin");
  v73 = v68 + v72;
  objc_msgSend(v3, "messageTopMargin");
  v75 = v71 - v74;
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController messageLabel](self, "messageLabel"));
  objc_msgSend(v3, "horizontalMargin");
  objc_msgSend(v76, "sizeThatFits:", v27 + v77 * -2.0, v75);
  v79 = v78;

  objc_msgSend(v3, "horizontalMargin");
  v81 = v80;
  objc_msgSend(v3, "horizontalMargin");
  v83 = v27 + v82 * -2.0;
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController messageLabel](self, "messageLabel"));
  objc_msgSend(v84, "setFrame:", v81, v73, v83, v79);

  v85 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController messageLabel](self, "messageLabel"));
  objc_msgSend(v85, "center");
  v87 = v86;
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController messageLabel](self, "messageLabel"));
  objc_msgSend(v88, "setCenter:", v27 * 0.5, v87);

  v89 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController messageLabel](self, "messageLabel"));
  objc_msgSend(v89, "_lastLineBaseline");
  v91 = v73 + ceil(v90);

  v92 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController confirmLabel](self, "confirmLabel"));
  if (v92)
  {
    objc_msgSend(v3, "confirmLabelTopMargin");
    v94 = v91 + v93;
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController confirmLabel](self, "confirmLabel"));
    objc_msgSend(v3, "horizontalMargin");
    v97 = v27 + v96 * -2.0;
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController confirmLabel](self, "confirmLabel"));
    objc_msgSend(v98, "bounds");
    objc_msgSend(v95, "sizeThatFits:", v97, v99);
    v101 = v100;

    if (v101 < 32.0)
      v101 = 32.0;
    objc_msgSend(v3, "horizontalMargin");
    v103 = v102;
    objc_msgSend(v3, "horizontalMargin");
    v105 = v27 + v104 * -2.0;
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController confirmLabel](self, "confirmLabel"));
    objc_msgSend(v106, "setFrame:", v103, v94, v105, v101);

    v107 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController confirmLabel](self, "confirmLabel"));
    objc_msgSend(v107, "center");
    v109 = v108;
    v110 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController confirmLabel](self, "confirmLabel"));
    objc_msgSend(v110, "setCenter:", v27 * 0.5, v109);

    v111 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController confirmLabel](self, "confirmLabel"));
    objc_msgSend(v111, "_lastLineBaseline");
    v91 = v94 + ceil(v112);

  }
  objc_msgSend(v3, "bottomContentInset");
  v114 = v91 + v113;
  objc_msgSend(v3, "maxHeight");
  if (v114 >= v115)
    v114 = v115;
  v116 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController noticeView](self, "noticeView"));
  objc_msgSend(v116, "frame");
  MinX = CGRectGetMinX(v156);
  v118 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController noticeView](self, "noticeView"));
  objc_msgSend(v118, "frame");
  MinY = CGRectGetMinY(v157);
  v120 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController noticeView](self, "noticeView"));
  objc_msgSend(v120, "setFrame:", MinX, MinY, v27, v114);

  v121 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController noticeView](self, "noticeView"));
  objc_msgSend(v121, "frame");
  v123 = v122;
  v125 = v124;
  v127 = v126;
  v129 = v128;
  v130 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController view](self, "view"));
  objc_msgSend(v130, "bounds");
  v132 = v131;
  v134 = v133;
  v136 = v135;
  v138 = v137;
  v139 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController traitCollection](self, "traitCollection"));
  objc_msgSend(v139, "displayScale");
  +[BSUIGeometryUtils centeredCGRectFromRect:centerHorizontally:centerVertically:bounds:scale:](BSUIGeometryUtils, "centeredCGRectFromRect:centerHorizontally:centerVertically:bounds:scale:", 1, 1, v123, v125, v127, v129, v132, v134, v136, v138, v140);
  v142 = v141;
  v144 = v143;
  v146 = v145;
  v148 = v147;
  v149 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController noticeView](self, "noticeView"));
  objc_msgSend(v149, "setFrame:", v142, v144, v146, v148);

}

- (BOOL)shouldDismissAutomatically
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController confirmString](self, "confirmString"));
  v3 = v2 == 0;

  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BSUINoticeViewController;
  -[BSUINoticeViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  if (-[BSUINoticeViewController shouldDismissAutomatically](self, "shouldDismissAutomatically"))
    -[BSUINoticeViewController _announceTheNoticeToAVoiceOverUser](self, "_announceTheNoticeToAVoiceOverUser");
}

- (void)_announceTheNoticeToAVoiceOverUser
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;

  v13 = objc_opt_new(NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController noticeTitle](self, "noticeTitle"));
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController noticeTitle](self, "noticeTitle"));
    -[NSMutableArray addObject:](v13, "addObject:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController message](self, "message"));
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController message](self, "message"));
    -[NSMutableArray addObject:](v13, "addObject:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController confirmString](self, "confirmString"));
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController confirmString](self, "confirmString"));
    -[NSMutableArray addObject:](v13, "addObject:", v11);

  }
  if (-[NSMutableArray count](v13, "count"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v13, "componentsJoinedByString:", CFSTR(", ")));
    UIAccessibilitySpeakAndDoNotBeInterrupted();

  }
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BSUINoticeViewController;
  -[BSUINoticeViewController viewWillLayoutSubviews](&v3, "viewWillLayoutSubviews");
  -[BSUINoticeViewController updateUI](self, "updateUI");
}

- (void)_updateTitleMessageAndConfirmLabels
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v3 = objc_alloc((Class)NSAttributedString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController noticeTitle](self, "noticeTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BSUINoticeViewController noticeViewTitleFontAttributes](BSUINoticeViewController, "noticeViewTitleFontAttributes"));
  v6 = objc_msgSend(v3, "initWithString:attributes:", v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "setAttributedText:", v6);

  v8 = objc_alloc((Class)NSAttributedString);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController message](self, "message"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BSUINoticeViewController noticeViewMessageFontAttributes](BSUINoticeViewController, "noticeViewMessageFontAttributes"));
  v11 = objc_msgSend(v8, "initWithString:attributes:", v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController messageLabel](self, "messageLabel"));
  objc_msgSend(v12, "setAttributedText:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController confirmString](self, "confirmString"));
  if (v13)
  {
    v14 = objc_alloc((Class)NSAttributedString);
    v18 = (id)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController confirmString](self, "confirmString"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[BSUINoticeViewController noticeViewConfirmLabelFontAttributes](BSUINoticeViewController, "noticeViewConfirmLabelFontAttributes"));
    v16 = objc_msgSend(v14, "initWithString:attributes:", v18, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController confirmLabel](self, "confirmLabel"));
    objc_msgSend(v17, "setAttributedText:", v16);

  }
}

- (void)updateUI
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController iconImageView](self, "iconImageView"));
  objc_msgSend(v4, "setTintColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v5, "bc_userInterfaceStyleDark"))
    v6 = 3;
  else
    v6 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController noticeView](self, "noticeView"));
  objc_msgSend(v8, "setEffect:", v7);

  -[BSUINoticeViewController _updateTitleMessageAndConfirmLabels](self, "_updateTitleMessageAndConfirmLabels");
}

- (UIVisualEffectView)noticeView
{
  UIVisualEffectView *noticeView;
  UIVisualEffectView *v4;
  UIVisualEffectView *v5;
  void *v6;

  noticeView = self->_noticeView;
  if (!noticeView)
  {
    v4 = (UIVisualEffectView *)objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_noticeView;
    self->_noticeView = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 0));
    -[UIVisualEffectView setEffect:](self->_noticeView, "setEffect:", v6);

    -[UIVisualEffectView setClipsToBounds:](self->_noticeView, "setClipsToBounds:", 1);
    -[UIVisualEffectView _setContinuousCornerRadius:](self->_noticeView, "_setContinuousCornerRadius:", 12.0);
    noticeView = self->_noticeView;
  }
  return noticeView;
}

- (void)downloadIcon
{
  dispatch_queue_global_t global_queue;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  global_queue = dispatch_get_global_queue(2, 0);
  v3 = objc_claimAutoreleasedReturnValue(global_queue);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_342AC;
  v4[3] = &unk_2E48C8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

+ (id)_presentedViewControllers
{
  if (qword_32C098 != -1)
    dispatch_once(&qword_32C098, &stru_2E5490);
  return (id)qword_32C090;
}

+ (void)presentViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_presentedViewControllers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "shouldDismissAutomatically"))
          objc_msgSend(v10, "hide:", 1);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  sub_34668((uint64_t)a1, v4, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v11, "addSubview:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_presentedViewControllers"));
  objc_msgSend(v24, "addObject:", v4);

}

+ (id)_presentingViewControllerForModalWithOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = sub_34740((uint64_t)a1, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIViewController jsa_topMostViewControllerForWindow:](UIViewController, "jsa_topMostViewControllerForWindow:", v4));

  return v5;
}

+ (void)dismissViewController:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_presentedViewControllers"));
  v5 = objc_msgSend(v4, "containsObject:", v9);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
    objc_msgSend(v6, "removeFromSuperview");

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_presentedViewControllers"));
    objc_msgSend(v7, "removeObject:", v9);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "completion"));
  objc_msgSend(v9, "setCompletion:", 0);
  if (v8)
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

}

- (void)show:(BOOL)a3
{
  -[BSUINoticeViewController show:options:](self, "show:options:", a3, 0);
}

- (void)_runWithOptions:(id)a3 completion:(id)a4
{
  id v6;

  v6 = a3;
  -[BSUINoticeViewController setCompletion:](self, "setCompletion:", a4);
  -[BSUINoticeViewController show:options:](self, "show:options:", 1, v6);

}

- (void)show:(BOOL)a3 options:(id)a4
{
  id v4;
  _QWORD *v5;
  _QWORD v6[4];
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_349C8;
  v8[3] = &unk_2E4208;
  v8[4] = self;
  v10 = a3;
  v4 = a4;
  v9 = v4;
  v5 = objc_retainBlock(v8);
  if (v5)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v5[2])(v5);
    }
    else
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_349D8;
      v6[3] = &unk_2E3F88;
      v7 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

    }
  }

}

- (void)_show:(BOOL)a3 options:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  CGAffineTransform v15;
  CGAffineTransform v16;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController view](self, "view"));
  objc_msgSend(v7, "setAlpha:", 0.0);

  CGAffineTransformMakeScale(&v16, 0.88, 0.88);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUINoticeViewController view](self, "view"));
  v15 = v16;
  objc_msgSend(v8, "setTransform:", &v15);

  v9 = sub_34740((uint64_t)BSUINoticeViewController, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  -[BSUINoticeViewController setWindow:](self, "setWindow:", v10);
  +[BSUINoticeViewController presentViewController:](BSUINoticeViewController, "presentViewController:", self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_34B78;
  v14[3] = &unk_2E4608;
  v14[4] = self;
  v11 = objc_retainBlock(v14);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_34BF4;
  v13[3] = &unk_2E54B8;
  v13[4] = self;
  v12 = objc_retainBlock(v13);
  if (v4)
  {
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 131074, v11, v12, 0.2, 0.0);
  }
  else
  {
    ((void (*)(_QWORD *))v11[2])(v11);
    ((void (*)(_QWORD *, uint64_t))v12[2])(v12, 1);
  }

}

- (void)hide:(BOOL)a3
{
  _QWORD *v3;
  _QWORD block[4];
  _QWORD *v5;
  _QWORD v6[5];
  BOOL v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_34D38;
  v6[3] = &unk_2E54E0;
  v6[4] = self;
  v7 = a3;
  v3 = objc_retainBlock(v6);
  if (v3)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v3[2])(v3);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_34D4C;
      block[3] = &unk_2E3F88;
      v5 = v3;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

}

- (void)_hide:(BOOL)a3 withDelay:(double)a4
{
  _BOOL4 v5;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v5 = a3;
  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_34E5C;
  v10[3] = &unk_2E4608;
  v10[4] = self;
  v7 = objc_retainBlock(v10);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_34EDC;
  v9[3] = &unk_2E54B8;
  v9[4] = self;
  v8 = objc_retainBlock(v9);
  if (v5)
  {
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 131074, v7, v8, 0.2, a4);
  }
  else
  {
    ((void (*)(_QWORD *))v7[2])(v7);
    ((void (*)(_QWORD *, uint64_t))v8[2])(v8, 1);
  }

}

- (void)handleTapGesture:(id)a3
{
  -[BSUINoticeViewController hide:](self, "hide:", 1);
}

+ (void)presentNoticeWithTitle:(id)a3 message:(id)a4 symbolImageName:(id)a5 options:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_34FDC;
  v15[3] = &unk_2E5508;
  v16 = a5;
  v17 = v9;
  v18 = v10;
  v19 = a6;
  v11 = v19;
  v12 = v10;
  v13 = v9;
  v14 = v16;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);

}

+ (void)presentNoticeWithTitle:(id)a3 message:(id)a4 imageURLString:(id)a5 options:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_35168;
  v13[3] = &unk_2E5508;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v9 = v17;
  v10 = v16;
  v11 = v15;
  v12 = v14;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

}

+ (void)js_presentNoticeForAddingAssets:(id)a3 toCollectionNamed:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = BSUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Want to Read"), &stru_2F6710, CFSTR("BookStoreUILocalizable")));

  if (objc_msgSend(v9, "isEqualToString:", v14))
    v13 = kBKCollectionDefaultIDWantToRead;
  else
    v13 = 0;
  objc_msgSend(a1, "presentNoticeForAddingAssets:collectionTitle:collectionID:sourceViewController:options:", v10, v9, v13, 0, v8);

}

+ (id)_noticeMessageForAddingAssets:(id)a3 toCollectionNamed:(id)a4 isAddingToWantToRead:(BOOL)a5 useNonSpecificDeterminerInMessage:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  char *v16;
  void *v17;
  char *v18;
  id v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  char *v23;
  id v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  char *v29;
  id v30;
  void *v31;
  void *v32;
  char *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  const __CFString *v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  uint64_t v64;
  id v65;
  id v66;
  void *v67;
  char *v68;
  unsigned __int8 v69;
  id v70;
  void *v71;
  id v73;
  _QWORD v74[4];
  id v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  char v80;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = BSUIBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("\\U2026"), &stru_2F6710, CFSTR("BookStoreUILocalizable")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByTruncatingToLength:options:truncationString:", 50, 3, v14));

  v16 = (char *)objc_msgSend(v10, "count");
  if (!v7)
  {
    if (v16 == (_BYTE *)&dword_0 + 1)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allValues"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lastObject"));

      v23 = (char *)objc_msgSend(v27, "integerValue");
      if (v23 == (_BYTE *)&dword_4 + 2)
      {
        v50 = BSUIBundle();
        v20 = (void *)objc_claimAutoreleasedReturnValue(v50);
        if (v6)
          v25 = CFSTR("The audiobook was added to %@.");
        else
          v25 = CFSTR("This audiobook was added to %@.");
      }
      else if (v23 == (_BYTE *)&dword_0 + 3)
      {
        v24 = BSUIBundle();
        v20 = (void *)objc_claimAutoreleasedReturnValue(v24);
        if (v6)
          v25 = CFSTR("The PDF was added to %@.");
        else
          v25 = CFSTR("This PDF was added to %@.");
      }
      else
      {
        v51 = BSUIBundle();
        v20 = (void *)objc_claimAutoreleasedReturnValue(v51);
        if (v6)
          v25 = CFSTR("The book was added to %@.");
        else
          v25 = CFSTR("This book was added to %@.");
      }
    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allValues"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v31));

      if (objc_msgSend(v27, "count") == (char *)&dword_0 + 1)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "anyObject"));
        v33 = (char *)objc_msgSend(v32, "integerValue");

        if (v33 == (_BYTE *)&dword_4 + 2)
        {
          v65 = BSUIBundle();
          v20 = (void *)objc_claimAutoreleasedReturnValue(v65);
          if (v6)
            v25 = CFSTR("The audiobooks were added to %@.");
          else
            v25 = CFSTR("These audiobooks were added to %@.");
        }
        else if (v33 == (_BYTE *)&dword_0 + 3)
        {
          v34 = BSUIBundle();
          v20 = (void *)objc_claimAutoreleasedReturnValue(v34);
          if (v6)
            v25 = CFSTR("The PDFs were added to %@.");
          else
            v25 = CFSTR("These PDFs were added to %@.");
        }
        else
        {
          v66 = BSUIBundle();
          v20 = (void *)objc_claimAutoreleasedReturnValue(v66);
          if (v6)
            v25 = CFSTR("The books were added to %@.");
          else
            v25 = CFSTR("These books were added to %@.");
        }
      }
      else
      {
        v36 = BSUIBundle();
        v20 = (void *)objc_claimAutoreleasedReturnValue(v36);
        if (v6)
          v25 = CFSTR("The items were added to %@.");
        else
          v25 = CFSTR("These items were added to %@.");
      }
    }
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", v25, &stru_2F6710, CFSTR("BookStoreUILocalizable")));
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v71, v15));

    goto LABEL_71;
  }
  if (v16 == (_BYTE *)&dword_0 + 1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allValues"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastObject"));

    v18 = (char *)objc_msgSend(v27, "integerValue");
    if (v18 == (_BYTE *)&dword_4 + 2)
    {
      v37 = BSUIBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue(v37);
      if (v6)
        v21 = CFSTR("The audiobook was added to your Want to Read list in Home.");
      else
        v21 = CFSTR("This audiobook was added to your Want to Read list in Home.");
      goto LABEL_67;
    }
    if (v18 == (_BYTE *)&dword_0 + 3)
    {
      v19 = BSUIBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      if (v6)
        v21 = CFSTR("The PDF was added to your Want to Read collection and can be viewed in Home.");
      else
        v21 = CFSTR("This PDF was added to your Want to Read collection and can be viewed in Home.");
      goto LABEL_67;
    }
    v38 = objc_opt_class(BSUILibraryItemStateCenter);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[BSUITemplate manager](BSUITemplate, "manager"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "dynamicRegistry"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "stateProviderForKind:", CFSTR("libraryItem")));
    v42 = BUDynamicCast(v38, v41);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v42);

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "provider"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allKeys"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "lastObject"));

    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "itemStateWithIdentifier:", v45));
    if (objc_msgSend(v46, "library") == &dword_4 || objc_msgSend(v46, "library") == (char *)&dword_0 + 2)
    {
      objc_msgSend(v46, "isSample");
    }
    else
    {
      v68 = (char *)objc_msgSend(v46, "library");
      v69 = objc_msgSend(v46, "isSample");
      if (v68 != (_BYTE *)&dword_4 + 1
        && (v69 & 1) == 0
        && objc_msgSend(a1, "allowsAutoDownloadOfSamplesToWantToRead"))
      {
        v70 = BSUIBundle();
        v48 = (void *)objc_claimAutoreleasedReturnValue(v70);
        if (v6)
          v49 = CFSTR("The book was added to your Want to Read list in Home, and a sample was downloaded.");
        else
          v49 = CFSTR("This book was added to your Want to Read list in Home, and a sample was downloaded.");
        goto LABEL_58;
      }
    }
    v47 = BSUIBundle();
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    if (v6)
      v49 = CFSTR("The book was added to your Want to Read list in Home.");
    else
      v49 = CFSTR("This book was added to your Want to Read list in Home.");
LABEL_58:
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "localizedStringForKey:value:table:", v49, &stru_2F6710, CFSTR("BookStoreUILocalizable")));

LABEL_71:
    goto LABEL_72;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allValues"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v26));

  if (objc_msgSend(v27, "count") != (char *)&dword_0 + 1)
  {
    v35 = BSUIBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue(v35);
    if (v6)
      v21 = CFSTR("The items were added to your Want to Read collection and can be viewed in Home.");
    else
      v21 = CFSTR("These items were added to your Want to Read collection and can be viewed in Home.");
    goto LABEL_67;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "anyObject"));
  v29 = (char *)objc_msgSend(v28, "integerValue");

  if (v29 == (_BYTE *)&dword_4 + 2)
  {
    v52 = BSUIBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue(v52);
    if (v6)
      v21 = CFSTR("The audiobooks were added to your Want to Read list in Home.");
    else
      v21 = CFSTR("These audiobooks were added to your Want to Read list in Home.");
    goto LABEL_67;
  }
  if (v29 == (_BYTE *)&dword_0 + 3)
  {
    v30 = BSUIBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue(v30);
    if (v6)
      v21 = CFSTR("The PDFs were added to your Want to Read collection and can be viewed in Home.");
    else
      v21 = CFSTR("These PDFs were added to your Want to Read collection and can be viewed in Home.");
LABEL_67:
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", v21, &stru_2F6710, CFSTR("BookStoreUILocalizable")));
    goto LABEL_71;
  }
  v77 = 0;
  v78 = &v77;
  v79 = 0x2020000000;
  v80 = 0;
  if (objc_msgSend(a1, "allowsAutoDownloadOfSamplesToWantToRead"))
  {
    v53 = objc_opt_class(BSUILibraryItemStateCenter);
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[BSUITemplate manager](BSUITemplate, "manager"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "dynamicRegistry"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "stateProviderForKind:", CFSTR("libraryItem")));
    v57 = BUDynamicCast(v53, v56);
    v58 = (void *)objc_claimAutoreleasedReturnValue(v57);

    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "provider"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allKeys"));
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_35A98;
    v74[3] = &unk_2E5530;
    v61 = v59;
    v75 = v61;
    v76 = &v77;
    objc_msgSend(v60, "enumerateObjectsUsingBlock:", v74);

  }
  if (*((_BYTE *)v78 + 24))
  {
    v62 = BSUIBundle();
    v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
    if (v6)
      v64 = objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "localizedStringForKey:value:table:", CFSTR("The books were added to your Want to Read list in Home, and samples were downloaded."), &stru_2F6710, CFSTR("BookStoreUILocalizable")));
    else
      v64 = objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "localizedStringForKey:value:table:", CFSTR("These books were added to your Want to Read list in Home, and samples were downloaded."), &stru_2F6710, CFSTR("BookStoreUILocalizable")));
  }
  else
  {
    v73 = BSUIBundle();
    v63 = (void *)objc_claimAutoreleasedReturnValue(v73);
    if (v6)
      v64 = objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "localizedStringForKey:value:table:", CFSTR("The books were added to your Want to Read list in Home."), &stru_2F6710, CFSTR("BookStoreUILocalizable")));
    else
      v64 = objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "localizedStringForKey:value:table:", CFSTR("These books were added to your Want to Read list in Home."), &stru_2F6710, CFSTR("BookStoreUILocalizable")));
  }
  v67 = (void *)v64;

  _Block_object_dispose(&v77, 8);
LABEL_72:

  return v67;
}

+ (UIImage)noticeViewAddedImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("text.badge.checkmark")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 192.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "imageWithConfiguration:", v3));

  return (UIImage *)v4;
}

+ (void)presentNoticeForRemovingBooks:(id)a3 fromCollectionNamed:(id)a4 options:(id)a5 useNonSpecificDeterminerInMessage:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  BOOL v23;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  v12 = BSUIBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("\\U2026"), &stru_2F6710, CFSTR("BookStoreUILocalizable")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByTruncatingToLength:options:truncationString:", 50, 3, v14));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_35CF0;
  v19[3] = &unk_2E5558;
  v23 = a6;
  v20 = v9;
  v21 = v15;
  v22 = v10;
  v16 = v10;
  v17 = v15;
  v18 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v19);

}

+ (void)presentNoticeForBookLoved:(BOOL)a3 options:(id)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  BOOL v23;

  v4 = a3;
  v5 = a4;
  v6 = BSUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Suggest More"), &stru_2F6710, CFSTR("BookStoreUILocalizable")));

    v10 = BSUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    v13 = CFSTR("Books will suggest more like this.");
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Suggest Less"), &stru_2F6710, CFSTR("BookStoreUILocalizable")));

    v14 = BSUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v12 = v11;
    v13 = CFSTR("Books will suggest less like this.");
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_2F6710, CFSTR("BookStoreUILocalizable")));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_361F8;
  v19[3] = &unk_2E5558;
  v23 = v4;
  v20 = v9;
  v21 = v15;
  v22 = v5;
  v16 = v5;
  v17 = v15;
  v18 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v19);

}

+ (void)presentNoticeForMigratingBooksCollection:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_36350;
  v7[3] = &unk_2E40C8;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

}

+ (void)presentNoticeForNoSampleAvailable:(BOOL)a3 options:(id)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;

  v4 = a3;
  v5 = a4;
  v6 = BSUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("No Sample"), &stru_2F6710, CFSTR("BookStoreUILocalizable")));

  v9 = BSUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v4)
    v12 = CFSTR("There’s no sample available for this audiobook.");
  else
    v12 = CFSTR("There’s no sample available for this book.");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_2F6710, CFSTR("BookStoreUILocalizable")));

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_36624;
  block[3] = &unk_2E4230;
  v18 = v8;
  v19 = v13;
  v20 = v5;
  v14 = v5;
  v15 = v13;
  v16 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

+ (double)noticeTotalDuration
{
  return 1.7;
}

- (int64_t)_lineCountForLabel:(id)a3 constrainedToWidth:(double)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSAttributedStringKey v13;
  void *v14;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));

  if (v6)
  {
    v7 = objc_alloc_init((Class)NSStringDrawingContext);
    objc_msgSend(v7, "setWantsNumberOfLineFragments:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
    v13 = NSFontAttributeName;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "font"));
    v14 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    objc_msgSend(v8, "boundingRectWithSize:options:attributes:context:", 33, v10, v7, a4, 1.79769313e308);

    v11 = objc_msgSend(v7, "numberOfLineFragments");
  }
  else
  {
    v11 = 0;
  }

  return (int64_t)v11;
}

+ (BOOL)allowsAutoDownloadOfSamplesToWantToRead
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = objc_opt_class(NSNumber);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BCRCDataContainer defaultContainer](BCRCDataContainer, "defaultContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKeyPath:", BRCBooksDefaultsKeyReadingNowWtrSimpleModeEnabled));
  v6 = BUDynamicCast(v2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  LOBYTE(v3) = objc_msgSend(v7, "BOOLValue") ^ 1;
  return (char)v3;
}

- (NSString)noticeTitle
{
  return self->_noticeTitle;
}

- (void)setNoticeTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)confirmString
{
  return self->_confirmString;
}

- (void)setConfirmString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_messageLabel, a3);
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
  objc_storeStrong((id *)&self->_iconImage, a3);
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (BOOL)iconImageAlwaysTemplate
{
  return self->_iconImageAlwaysTemplate;
}

- (void)setIconImageAlwaysTemplate:(BOOL)a3
{
  self->_iconImageAlwaysTemplate = a3;
}

- (UILabel)confirmLabel
{
  return self->_confirmLabel;
}

- (void)setConfirmLabel:(id)a3
{
  objc_storeStrong((id *)&self->_confirmLabel, a3);
}

- (void)setNoticeView:(id)a3
{
  objc_storeStrong((id *)&self->_noticeView, a3);
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (BSUINoticeViewLayout)noticeViewLayout
{
  return self->_noticeViewLayout;
}

- (void)setNoticeViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_noticeViewLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noticeViewLayout, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_noticeView, 0);
  objc_storeStrong((id *)&self->_confirmLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_confirmString, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_noticeTitle, 0);
}

+ (NSDictionary)noticeViewTitleFontAttributes
{
  void *v2;
  void *v3;
  Class isa;
  id v6;

  v2 = sub_1786A4();
  v6 = objc_msgSend((id)objc_opt_self(UIColor), "bc_booksKeyColor");
  v3 = TextAttributesBuilder.build()();
  swift_bridgeObjectRelease(v2);

  type metadata accessor for Key(0);
  sub_D16C8();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSDictionary *)isa;
}

+ (NSDictionary)noticeViewMessageFontAttributes
{
  return (NSDictionary *)sub_D1524((uint64_t)a1, (uint64_t)a2, (uint64_t *)&UIFontWeightMedium);
}

+ (NSDictionary)noticeViewConfirmLabelFontAttributes
{
  return (NSDictionary *)sub_D1524((uint64_t)a1, (uint64_t)a2, (uint64_t *)&UIFontWeightSemibold);
}

+ (void)presentNoticeForAddingAssets:(id)a3 collectionTitle:(id)a4 collectionID:(id)a5 sourceViewController:(id)a6 options:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t ObjCClassMetadata;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v13 = sub_5C154(&qword_329740);
  __chkstk_darwin(v13);
  v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_5C194(0, &qword_31F450, NSNumber_ptr);
  v17 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, v16, &protocol witness table for String);
  v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v19 = v18;
  if (!a5)
  {
    v20 = 0;
    if (!a7)
      goto LABEL_4;
    goto LABEL_3;
  }
  v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  a5 = v21;
  if (a7)
LABEL_3:
    a7 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a7, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
LABEL_4:
  ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  v23 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v15, 1, 1, v23);
  type metadata accessor for MainActor(0);
  swift_bridgeObjectRetain(a7);
  v24 = a6;
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRetain(v19);
  swift_bridgeObjectRetain(a5);
  v26 = static MainActor.shared.getter(v25);
  v27 = (_QWORD *)swift_allocObject(&unk_2F58B0, 96, 7);
  v27[2] = v26;
  v27[3] = &protocol witness table for MainActor;
  v27[4] = ObjCClassMetadata;
  v27[5] = v17;
  v27[6] = v30;
  v27[7] = v19;
  v27[8] = v20;
  v27[9] = a5;
  v27[10] = a7;
  v27[11] = a6;
  v28 = sub_1D979C((uint64_t)v15, (uint64_t)&unk_32B8B0, (uint64_t)v27);

  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease(a5);
  swift_bridgeObjectRelease(a7);
  swift_release(v28);
}

@end
