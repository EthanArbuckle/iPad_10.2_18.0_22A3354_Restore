@implementation TPSTipCollectionViewCell

- (void)dealloc
{
  objc_super v3;

  -[TPSTipCollectionViewCell cancelFootnoteParsingOperation](self, "cancelFootnoteParsingOperation");
  v3.receiver = self;
  v3.super_class = (Class)TPSTipCollectionViewCell;
  -[TPSBaseTipCollectionViewCell dealloc](&v3, "dealloc");
}

- (TPSTipCollectionViewCell)initWithFrame:(CGRect)a3
{
  TPSTipCollectionViewCell *v3;
  TPSTipCollectionViewCell *v4;
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
  id v20;
  void *v21;
  id v22;
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
  double v47;
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
  UILabel *v61;
  UILabel *eyebrowLabel;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  NSLayoutConstraint *eyebrowLabelTopAnchorConstraint;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  NSLayoutConstraint *titleLabelToEyebrowLabelTopAnchor;
  void *v81;
  void *v82;
  uint64_t v83;
  NSLayoutConstraint *titleLabelTopAnchorConstraint;
  void *v85;
  void *v86;
  uint64_t v87;
  NSLayoutConstraint *titleLabelLeadingConstraint;
  void *v89;
  void *v90;
  uint64_t v91;
  NSLayoutConstraint *titleLabelTrailingConstraint;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  NSLayoutConstraint *contentLabelBottomConstraint;
  double v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  NSLayoutConstraint *textViewBottomConstraint;
  double v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  id v137;
  objc_super v138;
  _QWORD v139[4];
  _QWORD v140[4];

  v138.receiver = self;
  v138.super_class = (Class)TPSTipCollectionViewCell;
  v3 = -[TPSBaseTipCollectionViewCell initWithFrame:](&v138, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell heroAssetView](v3, "heroAssetView"));
    v137 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v4, "replayVideo");
    objc_msgSend(v5, "addGestureRecognizer:", v137);
    objc_msgSend(v5, "setRespectLoadingStatus:", 1);
    -[TPSBaseTipCollectionViewCell updateFonts](v4, "updateFonts");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipCollectionViewCell contentView](v4, "contentView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentScrollView](v4, "contentScrollView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v9));
    objc_msgSend(v10, "setActive:", 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "widthAnchor"));
    v136 = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widthAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
    objc_msgSend(v13, "setActive:", 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerXAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerXAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));

    v135 = v16;
    objc_msgSend(v16, "setActive:", 1);
    -[TPSBaseTipCollectionViewCell setAssetViewLayoutGuideCenterXConstraint:](v4, "setAssetViewLayoutGuideCenterXConstraint:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "heightAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToConstant:", 0.0));
    -[TPSBaseTipCollectionViewCell setAssetViewHeightConstraint:](v4, "setAssetViewHeightConstraint:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell assetViewHeightConstraint](v4, "assetViewHeightConstraint"));
    objc_msgSend(v19, "setActive:", 1);

    v20 = objc_alloc((Class)UIImageView);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("ReplayGradient")));
    v22 = objc_msgSend(v20, "initWithImage:", v21);

    v23 = v22;
    objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v22, "setHidden:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentScrollView](v4, "contentScrollView"));
    objc_msgSend(v24, "addSubview:", v23);

    v25 = v23;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "widthAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell heroAssetView](v4, "heroAssetView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "widthAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v28));
    objc_msgSend(v29, "setActive:", 1);

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "heightAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToConstant:", 100.0));
    objc_msgSend(v31, "setActive:", 1);

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "centerXAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell heroAssetView](v4, "heroAssetView"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "centerXAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v34));
    objc_msgSend(v35, "setActive:", 1);

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell heroAssetView](v4, "heroAssetView"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bottomAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v38, -100.0));
    objc_msgSend(v39, "setActive:", 1);

    v134 = v25;
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell heroAssetView](v4, "heroAssetView"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "bottomAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v42));
    objc_msgSend(v43, "setActive:", 1);

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    objc_msgSend(v44, "setupReplayButtonConfiguration");
    objc_msgSend(v44, "addTarget:action:forControlEvents:", v4, "replayButtonTapped", 64);
    objc_msgSend(v44, "setPreferredBehavioralStyle:", 0);
    objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "layer"));
    objc_msgSend(v45, "setShadowRadius:", 30.0);

    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "layer"));
    LODWORD(v47) = 1050253722;
    objc_msgSend(v46, "setShadowOpacity:", v47);

    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "layer"));
    objc_msgSend(v48, "setShadowPathIsBounds:", 1);

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentScrollView](v4, "contentScrollView"));
    objc_msgSend(v49, "addSubview:", v44);

    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "centerXAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell heroAssetView](v4, "heroAssetView"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "centerXAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v52));
    objc_msgSend(v53, "setActive:", 1);

    v131 = v44;
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "bottomAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell heroAssetView](v4, "heroAssetView"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "bottomAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:constant:", v56, -14.0));
    objc_msgSend(v57, "setActive:", 1);

    objc_msgSend(v5, "setReplayButton:", v44);
    objc_msgSend(v5, "setReplayGradientView:", v25);
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentScrollView](v4, "contentScrollView"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "frameLayoutGuide"));

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell titleLabel](v4, "titleLabel"));
    v61 = (UILabel *)objc_alloc_init((Class)UILabel);
    eyebrowLabel = v4->_eyebrowLabel;
    v4->_eyebrowLabel = v61;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_eyebrowLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setOpaque:](v4->_eyebrowLabel, "setOpaque:", 1);
    -[UILabel setTextAlignment:](v4->_eyebrowLabel, "setTextAlignment:", 4);
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v4->_eyebrowLabel, "setBackgroundColor:", v63);

    -[UILabel setNumberOfLines:](v4->_eyebrowLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v4->_eyebrowLabel, "setLineBreakMode:", 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAppearance footnoteFont](TPSAppearance, "footnoteFont"));
    -[UILabel setFont:](v4->_eyebrowLabel, "setFont:", v64);

    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_eyebrowLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAppearance secondaryLabelColor](TPSAppearance, "secondaryLabelColor"));
    -[UILabel setTextColor:](v4->_eyebrowLabel, "setTextColor:", v65);

    -[UILabel setHidden:](v4->_eyebrowLabel, "setHidden:", 1);
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentScrollView](v4, "contentScrollView"));
    objc_msgSend(v66, "addSubview:", v4->_eyebrowLabel);

    v67 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_eyebrowLabel, "topAnchor"));
    v133 = v5;
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
    v69 = objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:constant:", v68, 17.0));
    eyebrowLabelTopAnchorConstraint = v4->_eyebrowLabelTopAnchorConstraint;
    v4->_eyebrowLabelTopAnchorConstraint = (NSLayoutConstraint *)v69;

    -[NSLayoutConstraint setActive:](v4->_eyebrowLabelTopAnchorConstraint, "setActive:", 1);
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_eyebrowLabel, "leadingAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "leadingAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v72));
    objc_msgSend(v73, "setActive:", 1);

    v74 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_eyebrowLabel, "trailingAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "trailingAnchor"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v75));
    objc_msgSend(v76, "setActive:", 1);

    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "topAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v4->_eyebrowLabel, "bottomAnchor"));
    v79 = objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:constant:", v78, 4.0));
    titleLabelToEyebrowLabelTopAnchor = v4->_titleLabelToEyebrowLabelTopAnchor;
    v4->_titleLabelToEyebrowLabelTopAnchor = (NSLayoutConstraint *)v79;

    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "topAnchor"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
    v83 = objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:constant:", v82, 21.0));
    titleLabelTopAnchorConstraint = v4->_titleLabelTopAnchorConstraint;
    v4->_titleLabelTopAnchorConstraint = (NSLayoutConstraint *)v83;

    -[NSLayoutConstraint setActive:](v4->_titleLabelTopAnchorConstraint, "setActive:", 1);
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "leadingAnchor"));
    v132 = v59;
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "leadingAnchor"));
    v87 = objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:", v86));
    titleLabelLeadingConstraint = v4->_titleLabelLeadingConstraint;
    v4->_titleLabelLeadingConstraint = (NSLayoutConstraint *)v87;

    -[NSLayoutConstraint setActive:](v4->_titleLabelLeadingConstraint, "setActive:", 1);
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "trailingAnchor"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "trailingAnchor"));
    v91 = objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "constraintEqualToAnchor:", v90));
    titleLabelTrailingConstraint = v4->_titleLabelTrailingConstraint;
    v4->_titleLabelTrailingConstraint = (NSLayoutConstraint *)v91;

    -[NSLayoutConstraint setActive:](v4->_titleLabelTrailingConstraint, "setActive:", 1);
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentLabel](v4, "contentLabel"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "leadingAnchor"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "leadingAnchor"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:", v95));

    v96 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentLabel](v4, "contentLabel"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "trailingAnchor"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "trailingAnchor"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "constraintEqualToAnchor:", v98));

    v100 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentLabel](v4, "contentLabel"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "topAnchor"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "bottomAnchor"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "constraintEqualToAnchor:constant:", v102, 9.0));

    v103 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentLabel](v4, "contentLabel"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "bottomAnchor"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentScrollView](v4, "contentScrollView"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "bottomAnchor"));
    v107 = objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToAnchor:", v106));
    contentLabelBottomConstraint = v4->_contentLabelBottomConstraint;
    v4->_contentLabelBottomConstraint = (NSLayoutConstraint *)v107;

    LODWORD(v109) = 1147224064;
    -[NSLayoutConstraint setPriority:](v4->_contentLabelBottomConstraint, "setPriority:", v109);
    v140[0] = v129;
    v140[1] = v130;
    v140[2] = v99;
    v140[3] = v4->_contentLabelBottomConstraint;
    v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v140, 4));
    -[TPSBaseTipCollectionViewCell setContentLabelConstraints:](v4, "setContentLabelConstraints:", v110);

    v111 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentTextView](v4, "contentTextView"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "topAnchor"));
    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "bottomAnchor"));
    v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "constraintEqualToAnchor:constant:", v113, 9.0));

    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "bottomAnchor"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentScrollView](v4, "contentScrollView"));
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "bottomAnchor"));
    v118 = objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "constraintEqualToAnchor:", v117));
    textViewBottomConstraint = v4->_textViewBottomConstraint;
    v4->_textViewBottomConstraint = (NSLayoutConstraint *)v118;

    LODWORD(v120) = 1144750080;
    -[NSLayoutConstraint setPriority:](v4->_textViewBottomConstraint, "setPriority:", v120);
    v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "leadingAnchor"));
    v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "leadingAnchor"));
    v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "constraintEqualToAnchor:", v122));

    v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "trailingAnchor"));
    v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "trailingAnchor"));
    v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "constraintEqualToAnchor:", v125));

    v139[0] = v114;
    v139[1] = v123;
    v139[2] = v126;
    v139[3] = v4->_textViewBottomConstraint;
    v127 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v139, 4));
    -[TPSBaseTipCollectionViewCell setContentTextViewConstraints:](v4, "setContentTextViewConstraints:", v127);

    -[TPSTipCollectionViewCell setNeedsTextView:](v4, "setNeedsTextView:", 0);
  }
  return v4;
}

- (void)createFootnoteTextView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  TPSTipContentTextView *v15;
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
  double v32;
  void *v33;
  TPSTipContentTextView *v34;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipCollectionViewCell footnoteTextView](self, "footnoteTextView"));

  if (!v3)
  {
    v34 = objc_alloc_init(TPSTipContentTextView);
    -[TPSTipContentTextView setTranslatesAutoresizingMaskIntoConstraints:](v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TPSTipContentTextView setScrollEnabled:](v34, "setScrollEnabled:", 0);
    -[TPSTipContentTextView _setInteractiveTextSelectionDisabled:](v34, "_setInteractiveTextSelectionDisabled:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[TPSTipContentTextView setBackgroundColor:](v34, "setBackgroundColor:", v4);

    -[TPSTipContentTextView setEditable:](v34, "setEditable:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAppearance footnoteFont](TPSAppearance, "footnoteFont"));
    -[TPSTipContentTextView setFont:](v34, "setFont:", v5);

    -[TPSTipContentTextView setDataDetectorTypes:](v34, "setDataDetectorTypes:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipContentTextView textContainer](v34, "textContainer"));
    objc_msgSend(v6, "setHeightTracksTextView:", 1);

    -[TPSTipContentTextView setDelegate:](v34, "setDelegate:", self);
    -[TPSTipContentTextView setOpaque:](v34, "setOpaque:", 1);
    -[TPSTipContentTextView setTextContainerInset:](v34, "setTextContainerInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipContentTextView textContainer](v34, "textContainer"));
    objc_msgSend(v7, "setLineFragmentPadding:", 0.0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentScrollView](self, "contentScrollView"));
    objc_msgSend(v8, "addSubview:", v34);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actions"));
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      -[TPSBaseTipCollectionViewCell updateActionButton](self, "updateActionButton");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell actionButton](self, "actionButton"));
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentLabel](self, "contentLabel"));
      if ((objc_msgSend(v13, "isHidden") & 1) != 0)
        v14 = objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentTextView](self, "contentTextView"));
      else
        v14 = objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentLabel](self, "contentLabel"));
      v12 = (void *)v14;

    }
    v15 = v34;
    if (v12)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipContentTextView topAnchor](v34, "topAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 15.0));
      objc_msgSend(v18, "setActive:", 1);

      v15 = v34;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipContentTextView leadingAnchor](v15, "leadingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell titleLabel](self, "titleLabel"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));
    objc_msgSend(v22, "setActive:", 1);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipContentTextView trailingAnchor](v34, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell titleLabel](self, "titleLabel"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v25));
    objc_msgSend(v26, "setActive:", 1);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipContentTextView bottomAnchor](v34, "bottomAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell contentScrollView](self, "contentScrollView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bottomAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v29));
    -[TPSTipCollectionViewCell setFootnoteBottomConstraint:](self, "setFootnoteBottomConstraint:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipCollectionViewCell footnoteBottomConstraint](self, "footnoteBottomConstraint"));
    LODWORD(v32) = 1144750080;
    objc_msgSend(v31, "setPriority:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipCollectionViewCell footnoteBottomConstraint](self, "footnoteBottomConstraint"));
    objc_msgSend(v33, "setActive:", 1);

    -[TPSTipCollectionViewCell setFootnoteTextView:](self, "setFootnoteTextView:", v34);
    -[TPSTipCollectionViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

  }
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipCollectionViewCell footnoteTextView](self, "footnoteTextView"));
  objc_msgSend(v5, "setAttributedText:", 0);

  v8.receiver = self;
  v8.super_class = (Class)TPSTipCollectionViewCell;
  -[TPSBaseTipCollectionViewCell contentSizeCategoryDidChange:](&v8, "contentSizeCategoryDidChange:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell heroAssetView](self, "heroAssetView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "replayButton"));
  objc_msgSend(v7, "setupReplayButtonConfiguration");

}

- (void)cancelFootnoteParsingOperation
{
  NSBlockOperation *footnoteContentTextOperation;
  NSString *footnoteContentTextOperationID;

  -[NSBlockOperation cancel](self->_footnoteContentTextOperation, "cancel");
  footnoteContentTextOperation = self->_footnoteContentTextOperation;
  self->_footnoteContentTextOperation = 0;

  footnoteContentTextOperationID = self->_footnoteContentTextOperationID;
  self->_footnoteContentTextOperationID = 0;

}

- (void)removeFootnoteContentParser
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipCollectionViewCell footnoteContentParser](self, "footnoteContentParser"));
  objc_msgSend(v3, "setDelegate:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipCollectionViewCell footnoteContentParser](self, "footnoteContentParser"));
  objc_msgSend(v4, "cancelAssetFetches");

  -[TPSTipCollectionViewCell setFootnoteContentParser:](self, "setFootnoteContentParser:", 0);
}

- (void)updateContentLabel
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
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
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSBlockOperation *footnoteContentTextOperation;
  id v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id location;
  objc_super v39;
  _QWORD v40[2];
  _QWORD v41[2];

  v39.receiver = self;
  v39.super_class = (Class)TPSTipCollectionViewCell;
  -[TPSBaseTipCollectionViewCell updateContentLabel](&v39, "updateContentLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell uniqueIdentifierForCurrentTip](self, "uniqueIdentifierForCurrentTip"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", CFSTR("-footNote")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipCollectionViewCell footnoteContentTextOperationID](self, "footnoteContentTextOperationID"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipCollectionViewCell footnoteTextView](self, "footnoteTextView"));
    objc_msgSend(v7, "setAttributedText:", 0);

    -[TPSTipCollectionViewCell cancelFootnoteParsingOperation](self, "cancelFootnoteParsingOperation");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "footnoteContent"));

    if (v9)
    {
      -[TPSTipCollectionViewCell createFootnoteTextView](self, "createFootnoteTextView");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell appController](self, "appController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "footNoteAttributedStringForIdentifier:", v12));

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipCollectionViewCell footnoteTextView](self, "footnoteTextView"));
        objc_msgSend(v14, "setAttributedText:", v13);

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipCollectionViewCell footnoteTextView](self, "footnoteTextView"));
        objc_msgSend(v15, "setTipID:", v4);

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipCollectionViewCell footnoteTextView](self, "footnoteTextView"));
        objc_msgSend(v16, "setHidden:", 0);

      }
      else
      {
        v17 = objc_alloc_init((Class)NSBlockOperation);
        -[TPSTipCollectionViewCell setFootnoteContentTextOperation:](self, "setFootnoteContentTextOperation:", v17);

        -[TPSTipCollectionViewCell setFootnoteContentTextOperationID:](self, "setFootnoteContentTextOperationID:", v4);
        objc_initWeak(&location, self);
        v40[0] = NSFontAttributeName;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAppearance footnoteFont](TPSAppearance, "footnoteFont"));
        v41[0] = v18;
        v40[1] = NSForegroundColorAttributeName;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
        v41[1] = v19;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 2));

        -[TPSTipCollectionViewCell removeFootnoteContentParser](self, "removeFootnoteContentParser");
        v21 = objc_alloc_init((Class)TPSConstellationContentParser);
        -[TPSTipCollectionViewCell setFootnoteContentParser:](self, "setFootnoteContentParser:", v21);

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipCollectionViewCell traitCollection](self, "traitCollection"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipCollectionViewCell footnoteContentParser](self, "footnoteContentParser"));
        objc_msgSend(v23, "setTraitCollection:", v22);

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipCollectionViewCell footnoteContentParser](self, "footnoteContentParser"));
        objc_msgSend(v24, "setDelegate:", self);

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
        v26 = objc_msgSend(v25, "copy");

        footnoteContentTextOperation = self->_footnoteContentTextOperation;
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_1000295FC;
        v32[3] = &unk_1000A2B68;
        objc_copyWeak(&v37, &location);
        v28 = v26;
        v33 = v28;
        v34 = v9;
        v29 = v20;
        v35 = v29;
        v36 = v4;
        -[NSBlockOperation addExecutionBlock:](footnoteContentTextOperation, "addExecutionBlock:", v32);
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[TPSBaseTipCollectionViewCell attributedStringOperationQueue](TPSBaseTipCollectionViewCell, "attributedStringOperationQueue"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipCollectionViewCell footnoteContentTextOperation](self, "footnoteContentTextOperation"));
        objc_msgSend(v30, "addOperation:", v31);

        objc_destroyWeak(&v37);
        objc_destroyWeak(&location);
      }

    }
    -[TPSTipCollectionViewCell setupSharedTipMessaging](self, "setupSharedTipMessaging");

  }
}

- (void)prepareForReuse
{
  objc_super v3;

  -[TPSTipCollectionViewCell prepareSharedTipForReuse](self, "prepareSharedTipForReuse");
  v3.receiver = self;
  v3.super_class = (Class)TPSTipCollectionViewCell;
  -[TPSBaseTipCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
}

- (BOOL)setTip:(id)a3 withCellAppearance:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "size");
  v9 = v8;
  v11 = v10;
  -[TPSBaseTipCollectionViewCell cacheCellSize](self, "cacheCellSize");
  v13 = v12;
  v15 = v14;
  v25.receiver = self;
  v25.super_class = (Class)TPSTipCollectionViewCell;
  v16 = -[TPSBaseTipCollectionViewCell setTip:withCellAppearance:](&v25, "setTip:withCellAppearance:", v6, v7);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
  v18 = objc_msgSend(v17, "hasVideo");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell heroAssetView](self, "heroAssetView"));
  objc_msgSend(v19, "setUserInteractionEnabled:", v18);

  if (v16 || v9 != v13 || v11 != v15)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipCollectionViewCell footnoteTextView](self, "footnoteTextView"));
    objc_msgSend(v20, "setHidden:", 1);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "eyebrowText"));
    if (!v21)
    {
      if (objc_msgSend(v6, "isSiriSuggestion"))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("SIRI_SUGGESTION"), &stru_1000A5680, 0));

      }
      else
      {
        v21 = 0;
      }
    }
    v23 = v21 == 0;
    -[TPSTipCollectionViewCell setNeedsTextView:](self, "setNeedsTextView:", objc_msgSend(v6, "containsLinks"));
    -[UILabel setText:](self->_eyebrowLabel, "setText:", v21);
    -[UILabel setHidden:](self->_eyebrowLabel, "setHidden:", v23);
    -[NSLayoutConstraint setActive:](self->_eyebrowLabelTopAnchorConstraint, "setActive:", v21 != 0);
    -[NSLayoutConstraint setActive:](self->_titleLabelToEyebrowLabelTopAnchor, "setActive:", v21 != 0);
    -[NSLayoutConstraint setActive:](self->_titleLabelTopAnchorConstraint, "setActive:", v23);
    -[TPSTipCollectionViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

  }
  return v16;
}

- (void)cancelReplayButtonTimer
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell heroAssetView](self, "heroAssetView"));
  objc_msgSend(v2, "cancelReplayButtonTimer");

}

- (void)setNeedsTextView:(BOOL)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSTipCollectionViewCell;
  -[TPSBaseTipCollectionViewCell setNeedsTextView:](&v7, "setNeedsTextView:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "footnoteContent"));
  if (v5)
  {

  }
  else
  {
    v6 = -[TPSBaseTipCollectionViewCell isSharedVariant](self, "isSharedVariant");

    if ((v6 & 1) == 0)
      return;
  }
  -[NSLayoutConstraint setActive:](self->_contentLabelBottomConstraint, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->_textViewBottomConstraint, "setActive:", 0);
}

- (void)updateConstraints
{
  double v3;
  double v4;
  void *v5;
  double v6;
  objc_super v7;

  -[TPSBaseTipCollectionViewCell bottomPadding](self, "bottomPadding");
  v4 = v3;
  -[NSLayoutConstraint setConstant:](self->_contentLabelBottomConstraint, "setConstant:");
  -[NSLayoutConstraint setConstant:](self->_textViewBottomConstraint, "setConstant:", v4);
  -[NSLayoutConstraint setConstant:](self->_footnoteBottomConstraint, "setConstant:", v4);
  -[NSLayoutConstraint setConstant:](self->_sharedTextViewBottomConstraint, "setConstant:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell cellAppearance](self, "cellAppearance"));
  objc_msgSend(v5, "contentSidePadding");
  -[NSLayoutConstraint setConstant:](self->_titleLabelLeadingConstraint, "setConstant:");
  objc_msgSend(v5, "contentSidePadding");
  -[NSLayoutConstraint setConstant:](self->_titleLabelTrailingConstraint, "setConstant:", -v6);
  v7.receiver = self;
  v7.super_class = (Class)TPSTipCollectionViewCell;
  -[TPSBaseTipCollectionViewCell updateConstraints](&v7, "updateConstraints");

}

- (void)constellationContentParserAttributedStringUpdated:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipCollectionViewCell footnoteContentParser](self, "footnoteContentParser"));
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell tip](self, "tip"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    v10 = objc_msgSend(v7, "isEqualToString:", v9);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSBaseTipCollectionViewCell appController](self, "appController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributedString"));
      objc_msgSend(v11, "updateFootnoteAttributedString:forIdentifier:", v12, v7);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipCollectionViewCell footnoteTextView](self, "footnoteTextView"));
      objc_msgSend(v13, "setTipID:", 0);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipCollectionViewCell footnoteTextView](self, "footnoteTextView"));
      objc_msgSend(v14, "setAttributedText:", 0);

      -[TPSTipCollectionViewCell updateContentLabel](self, "updateContentLabel");
    }

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)TPSTipCollectionViewCell;
    -[TPSBaseTipCollectionViewCell constellationContentParserAttributedStringUpdated:](&v15, "constellationContentParserAttributedStringUpdated:", v4);
  }

}

- (id)constellationContentParserBoldFont:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  id v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipCollectionViewCell footnoteContentParser](self, "footnoteContentParser"));
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[TPSAppearance footnoteBoldTextFont](TPSAppearance, "footnoteBoldTextFont"));
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)TPSTipCollectionViewCell;
    v8 = -[TPSBaseTipCollectionViewCell constellationContentParserBoldFont:](&v11, "constellationContentParserBoldFont:", v4);
    v7 = objc_claimAutoreleasedReturnValue(v8);
  }
  v9 = (void *)v7;

  return v9;
}

- (id)constellationContentParserItalicFont:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  id v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipCollectionViewCell footnoteContentParser](self, "footnoteContentParser"));
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[TPSAppearance footnoteItalicTextFont](TPSAppearance, "footnoteItalicTextFont"));
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)TPSTipCollectionViewCell;
    v8 = -[TPSBaseTipCollectionViewCell constellationContentParserItalicFont:](&v11, "constellationContentParserItalicFont:", v4);
    v7 = objc_claimAutoreleasedReturnValue(v8);
  }
  v9 = (void *)v7;

  return v9;
}

- (NSLayoutConstraint)contentLabelBottomConstraint
{
  return self->_contentLabelBottomConstraint;
}

- (void)setContentLabelBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentLabelBottomConstraint, a3);
}

- (NSLayoutConstraint)textViewBottomConstraint
{
  return self->_textViewBottomConstraint;
}

- (void)setTextViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textViewBottomConstraint, a3);
}

- (NSLayoutConstraint)footnoteBottomConstraint
{
  return self->_footnoteBottomConstraint;
}

- (void)setFootnoteBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_footnoteBottomConstraint, a3);
}

- (NSLayoutConstraint)sharedTextViewBottomConstraint
{
  return self->_sharedTextViewBottomConstraint;
}

- (void)setSharedTextViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_sharedTextViewBottomConstraint, a3);
}

- (TPSTipContentTextView)footnoteTextView
{
  return self->_footnoteTextView;
}

- (void)setFootnoteTextView:(id)a3
{
  objc_storeStrong((id *)&self->_footnoteTextView, a3);
}

- (UIView)sharedTipAvailabilityView
{
  return self->_sharedTipAvailabilityView;
}

- (void)setSharedTipAvailabilityView:(id)a3
{
  objc_storeStrong((id *)&self->_sharedTipAvailabilityView, a3);
}

- (UILabel)eyebrowLabel
{
  return self->_eyebrowLabel;
}

- (void)setEyebrowLabel:(id)a3
{
  objc_storeStrong((id *)&self->_eyebrowLabel, a3);
}

- (NSBlockOperation)footnoteContentTextOperation
{
  return self->_footnoteContentTextOperation;
}

- (void)setFootnoteContentTextOperation:(id)a3
{
  objc_storeStrong((id *)&self->_footnoteContentTextOperation, a3);
}

- (NSString)footnoteContentTextOperationID
{
  return self->_footnoteContentTextOperationID;
}

- (void)setFootnoteContentTextOperationID:(id)a3
{
  objc_storeStrong((id *)&self->_footnoteContentTextOperationID, a3);
}

- (TPSConstellationContentParser)footnoteContentParser
{
  return self->_footnoteContentParser;
}

- (void)setFootnoteContentParser:(id)a3
{
  objc_storeStrong((id *)&self->_footnoteContentParser, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footnoteContentParser, 0);
  objc_storeStrong((id *)&self->_footnoteContentTextOperationID, 0);
  objc_storeStrong((id *)&self->_footnoteContentTextOperation, 0);
  objc_storeStrong((id *)&self->_eyebrowLabel, 0);
  objc_storeStrong((id *)&self->_sharedTipAvailabilityView, 0);
  objc_storeStrong((id *)&self->_footnoteTextView, 0);
  objc_storeStrong((id *)&self->_sharedTextViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_footnoteBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelToEyebrowLabelTopAnchor, 0);
  objc_storeStrong((id *)&self->_eyebrowLabelTopAnchorConstraint, 0);
}

- (void)setupSharedTipMessaging
{
  TPSTipCollectionViewCell *v2;

  v2 = self;
  sub_100047B94();

}

- (void)prepareSharedTipForReuse
{
  TPSTipCollectionViewCell *v2;

  v2 = self;
  sub_100048564();

}

- (id)availabilityTextView
{
  TPSTipCollectionViewCell *v2;
  id v3;

  v2 = self;
  v3 = sub_100048648();

  return v3;
}

- (void)deactivateBottomConstraints
{
  TPSTipCollectionViewCell *v2;

  v2 = self;
  sub_10004931C();

}

@end
