@implementation VTUIEnrollmentBaseView

- (VTUIEnrollmentBaseView)initWithFrame:(CGRect)a3
{
  VTUIEnrollmentBaseView *v3;
  VTUIEnrollmentBaseView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VTUIEnrollmentBaseView;
  v3 = -[VTUIEnrollmentBaseView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[VTUIEnrollmentBaseView _setupUI](v3, "_setupUI");
  return v4;
}

- (void)_setupUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *readableLeftAnchorConstraint;
  void *v16;
  void *v17;
  NSLayoutConstraint *v18;
  NSLayoutConstraint *readableRightAnchorConstraint;
  UIScrollView *v20;
  UIScrollView *scrollView;
  UIView *v22;
  UIView *scrollContainerView;
  char isKindOfClass;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  UILabel *v30;
  UILabel *titleLabel;
  void *v32;
  UILabel *v33;
  UILabel *subtitleLabel;
  void *v35;
  UILabel *v36;
  UILabel *instructionLabel;
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
  double v79;
  void *v80;
  void *v81;
  UITextView *v82;
  _UIBackdropView *v83;
  _UIBackdropView *backdropView;
  UITextView *v85;
  UITextView *privacyTextView;
  UITextView *v87;
  UITextView *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  UITextView *v98;
  void *v99;
  void *v100;
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
  uint64_t v119;
  VTUIEnrollmentBaseView *v120;
  void *v121;
  _QWORD *v122;
  uint64_t v123;
  VTUIEnrollmentBaseView *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  uint64_t v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  uint64_t v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  UITextView *v178;
  UITextView *v179;
  void *v180;
  void *v181;
  _QWORD v182[3];
  _QWORD v183[3];
  _QWORD v184[6];
  _QWORD v185[4];
  _QWORD v186[4];
  _QWORD v187[3];
  _QWORD v188[3];
  _QWORD v189[4];
  _QWORD v190[11];

  v190[9] = *MEMORY[0x24BDAC8D0];
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "interfaceOrientation") - 3;

  if (v8 > 1)
    objc_msgSend(v3, "horizontalPaddingPortrait");
  else
    objc_msgSend(v3, "horizontalPaddingLandscape");
  v10 = v9;
  -[VTUIEnrollmentBaseView readableContentGuide](self, "readableContentGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leftAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollmentBaseView leftAnchor](self, "leftAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, v10);
  v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  readableLeftAnchorConstraint = self->_readableLeftAnchorConstraint;
  self->_readableLeftAnchorConstraint = v14;

  v181 = v11;
  objc_msgSend(v11, "rightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollmentBaseView rightAnchor](self, "rightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, -v10);
  v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  readableRightAnchorConstraint = self->_readableRightAnchorConstraint;
  self->_readableRightAnchorConstraint = v18;

  -[NSLayoutConstraint setActive:](self->_readableLeftAnchorConstraint, "setActive:", 1);
  -[NSLayoutConstraint setActive:](self->_readableRightAnchorConstraint, "setActive:", 1);
  v20 = (UIScrollView *)objc_alloc_init(MEMORY[0x24BEBD918]);
  scrollView = self->_scrollView;
  self->_scrollView = v20;

  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIScrollView setAutoresizesSubviews:](self->_scrollView, "setAutoresizesSubviews:", 0);
  -[VTUIEnrollmentBaseView addSubview:](self, "addSubview:", self->_scrollView);
  v22 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
  scrollContainerView = self->_scrollContainerView;
  self->_scrollContainerView = v22;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setClipsToBounds:](self->_scrollContainerView, "setClipsToBounds:", 1);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_scrollContainerView);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v25 = (void *)MEMORY[0x24BEBD640];
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("waveform"));
    v26 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("OrbImage"), v27, 0);
    v26 = objc_claimAutoreleasedReturnValue();

  }
  v175 = (void *)v26;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v26);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTintColor:", v29);

  }
  objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v174 = v28;
  objc_storeStrong((id *)&self->_orbImage, v28);
  -[UIView addSubview:](self->_scrollContainerView, "addSubview:", self->_orbImage);
  v30 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v30;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  objc_msgSend(v3, "instructionLabelFont");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v32);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[UIView addSubview:](self->_scrollContainerView, "addSubview:", self->_titleLabel);
  v33 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v33;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1);
  objc_msgSend(v3, "subtitleFont");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v35);

  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
  -[UIView addSubview:](self->_scrollContainerView, "addSubview:", self->_subtitleLabel);
  v36 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  instructionLabel = self->_instructionLabel;
  self->_instructionLabel = v36;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_instructionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTextAlignment:](self->_instructionLabel, "setTextAlignment:", 1);
  objc_msgSend(v3, "subtitleFont");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_instructionLabel, "setFont:", v38);

  -[UILabel setNumberOfLines:](self->_instructionLabel, "setNumberOfLines:", 0);
  -[UIView addSubview:](self->_scrollContainerView, "addSubview:", self->_instructionLabel);
  v133 = (void *)MEMORY[0x24BDD1628];
  -[UIScrollView topAnchor](self->_scrollView, "topAnchor");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollmentBaseView topAnchor](self, "topAnchor");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "constraintEqualToAnchor:", v153);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v190[0] = v149;
  -[UIScrollView leftAnchor](self->_scrollView, "leftAnchor");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollmentBaseView leftAnchor](self, "leftAnchor");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "constraintEqualToAnchor:", v143);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v190[1] = v141;
  -[UIScrollView rightAnchor](self->_scrollView, "rightAnchor");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollmentBaseView rightAnchor](self, "rightAnchor");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "constraintEqualToAnchor:", v137);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v190[2] = v136;
  -[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollmentBaseView bottomAnchor](self, "bottomAnchor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "constraintEqualToAnchor:", v134);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v190[3] = v132;
  -[UIView topAnchor](self->_scrollContainerView, "topAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView topAnchor](self->_scrollView, "topAnchor");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "constraintEqualToAnchor:", v130);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v190[4] = v129;
  -[UIView leftAnchor](self->_scrollContainerView, "leftAnchor");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView leftAnchor](self->_scrollView, "leftAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "constraintEqualToAnchor:", v127);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v190[5] = v126;
  -[UIView rightAnchor](self->_scrollContainerView, "rightAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView rightAnchor](self->_scrollView, "rightAnchor");
  v180 = v3;
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "constraintEqualToAnchor:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v190[6] = v40;
  -[UIView widthAnchor](self->_scrollContainerView, "widthAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView widthAnchor](self->_scrollView, "widthAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v190[7] = v43;
  -[UIView bottomAnchor](self->_scrollContainerView, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v190[8] = v46;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v190, 9);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "activateConstraints:", v47);

  v147 = (void *)MEMORY[0x24BDD1628];
  -[UIImageView topAnchor](self->_orbImage, "topAnchor");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_scrollContainerView, "topAnchor");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIEnrollmentBaseView imageOffsetFromTop](self, "imageOffsetFromTop");
  objc_msgSend(v160, "constraintEqualToAnchor:constant:", v154);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v189[0] = v150;
  -[UIImageView centerXAnchor](self->_orbImage, "centerXAnchor");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_scrollContainerView, "centerXAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v189[1] = v49;
  -[UIImageView widthAnchor](self->_orbImage, "widthAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "orbImageLength");
  objc_msgSend(v50, "constraintEqualToConstant:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v189[2] = v51;
  -[UIImageView heightAnchor](self->_orbImage, "heightAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "orbImageLength");
  objc_msgSend(v52, "constraintEqualToConstant:");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v189[3] = v53;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v189, 4);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "activateConstraints:", v54);

  v155 = (void *)MEMORY[0x24BDD1628];
  -[UILabel topAnchor](self->_titleLabel, "topAnchor");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView bottomAnchor](self->_orbImage, "bottomAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "titleOffsetFromOrbImage");
  objc_msgSend(v161, "constraintEqualToAnchor:constant:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v188[0] = v56;
  -[UILabel widthAnchor](self->_titleLabel, "widthAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "widthAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v188[1] = v59;
  -[UILabel centerXAnchor](self->_titleLabel, "centerXAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_scrollContainerView, "centerXAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v188[2] = v62;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v188, 3);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "activateConstraints:", v63);

  v162 = (void *)MEMORY[0x24BDD1628];
  -[UILabel topAnchor](self->_subtitleLabel, "topAnchor");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "subtitle1BaselineOffset");
  objc_msgSend(v166, "constraintEqualToAnchor:constant:", v176);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v187[0] = v64;
  -[UILabel widthAnchor](self->_subtitleLabel, "widthAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "widthAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v187[1] = v67;
  -[UILabel centerXAnchor](self->_subtitleLabel, "centerXAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_scrollContainerView, "centerXAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v187[2] = v70;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v187, 3);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "activateConstraints:", v71);

  v156 = (void *)MEMORY[0x24BDD1628];
  -[UILabel topAnchor](self->_instructionLabel, "topAnchor");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_subtitleLabel, "bottomAnchor");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "subtitle2BaselineOffset");
  objc_msgSend(v177, "constraintEqualToAnchor:constant:", v170);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v186[0] = v167;
  -[UILabel widthAnchor](self->_instructionLabel, "widthAnchor");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "widthAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "constraintEqualToAnchor:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v186[1] = v73;
  -[UILabel centerXAnchor](self->_instructionLabel, "centerXAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_scrollContainerView, "centerXAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:", v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v186[2] = v76;
  -[UILabel bottomAnchor](self->_instructionLabel, "bottomAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_scrollContainerView, "bottomAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "subtitle2BaselineOffset");
  objc_msgSend(v77, "constraintEqualToAnchor:constant:", v78, -v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v186[3] = v80;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v186, 4);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "activateConstraints:", v81);

  -[VTUIEnrollmentBaseView footerView](self, "footerView");
  v82 = (UITextView *)objc_claimAutoreleasedReturnValue();
  if (-[VTUIEnrollmentBaseView showPrivacyTextView](self, "showPrivacyTextView") || v82)
  {
    v83 = (_UIBackdropView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB78]), "initWithPrivateStyle:", -[VTUIEnrollmentBaseView _backdropStyle](self, "_backdropStyle"));
    backdropView = self->_backdropView;
    self->_backdropView = v83;

    -[_UIBackdropView setTranslatesAutoresizingMaskIntoConstraints:](self->_backdropView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[VTUIEnrollmentBaseView addSubview:](self, "addSubview:", self->_backdropView);
    if (-[VTUIEnrollmentBaseView showPrivacyTextView](self, "showPrivacyTextView"))
    {
      -[VTUIEnrollmentBaseView _createPrivacyTextView](self, "_createPrivacyTextView");
      v85 = (UITextView *)objc_claimAutoreleasedReturnValue();
      privacyTextView = self->_privacyTextView;
      self->_privacyTextView = v85;

      -[VTUIEnrollmentBaseView addSubview:](self, "addSubview:", self->_privacyTextView);
    }
    if (v82)
    {
      -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v82, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[VTUIEnrollmentBaseView addSubview:](self, "addSubview:", v82);
    }
    v87 = self->_privacyTextView;
    if (!v87)
      v87 = v82;
    v88 = v87;
    v151 = (void *)MEMORY[0x24BDD1628];
    v178 = v88;
    -[UITextView topAnchor](v88, "topAnchor");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropView topAnchor](self->_backdropView, "topAnchor");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v168, 1.0);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    v185[0] = v164;
    -[_UIBackdropView leftAnchor](self->_backdropView, "leftAnchor");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIEnrollmentBaseView leftAnchor](self, "leftAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "constraintEqualToAnchor:", v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v185[1] = v90;
    -[_UIBackdropView rightAnchor](self->_backdropView, "rightAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIEnrollmentBaseView rightAnchor](self, "rightAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "constraintEqualToAnchor:", v92);
    v179 = v82;
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v185[2] = v93;
    -[_UIBackdropView bottomAnchor](self->_backdropView, "bottomAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTUIEnrollmentBaseView bottomAnchor](self, "bottomAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "constraintEqualToAnchor:", v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v185[3] = v96;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v185, 4);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "activateConstraints:", v97);

    v82 = v179;
    v98 = self->_privacyTextView;
    v99 = (void *)MEMORY[0x24BDD1628];
    if (v98 && v179)
    {
      -[UITextView leftAnchor](v98, "leftAnchor");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "leftAnchor");
      v145 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "constraintEqualToAnchor:", v145);
      v165 = objc_claimAutoreleasedReturnValue();
      v184[0] = v165;
      -[UITextView rightAnchor](self->_privacyTextView, "rightAnchor");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "rightAnchor");
      v158 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "constraintEqualToAnchor:", v158);
      v140 = objc_claimAutoreleasedReturnValue();
      v184[1] = v140;
      -[UITextView bottomAnchor](self->_privacyTextView, "bottomAnchor");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView topAnchor](v179, "topAnchor");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "constraintEqualToAnchor:");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      v184[2] = v172;
      -[UITextView leftAnchor](v179, "leftAnchor");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "leftAnchor");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v169 = v100;
      objc_msgSend(v100, "constraintEqualToAnchor:", v101);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      v184[3] = v138;
      -[UITextView rightAnchor](v179, "rightAnchor");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "rightAnchor");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "constraintEqualToAnchor:", v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v184[4] = v104;
      -[UITextView bottomAnchor](v179, "bottomAnchor");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      -[VTUIEnrollmentBaseView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "bottomAnchor");
      v107 = v99;
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "constraintEqualToAnchor:", v108);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v184[5] = v109;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v184, 6);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = v107;
      v112 = (void *)v140;
      objc_msgSend(v111, "activateConstraints:", v110);

      v113 = (void *)v145;
      v114 = v152;

      v115 = v142;
      v82 = v179;

      v116 = v148;
      v117 = (void *)v165;

      v118 = (void *)v158;
    }
    else
    {
      if (v98)
      {
        -[UITextView leftAnchor](v98, "leftAnchor");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v181, "leftAnchor");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "constraintEqualToAnchor:", v113);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v183[0] = v117;
        -[UITextView rightAnchor](self->_privacyTextView, "rightAnchor");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v181, "rightAnchor");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "constraintEqualToAnchor:", v118);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v183[1] = v112;
        -[UITextView bottomAnchor](self->_privacyTextView, "bottomAnchor");
        v119 = objc_claimAutoreleasedReturnValue();
        v120 = self;
        v115 = (void *)v119;
        -[VTUIEnrollmentBaseView safeAreaLayoutGuide](v120, "safeAreaLayoutGuide");
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v173, "bottomAnchor");
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "constraintEqualToAnchor:");
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        v183[2] = v169;
        v121 = (void *)MEMORY[0x24BDBCE30];
        v122 = v183;
      }
      else
      {
        -[UITextView leftAnchor](v179, "leftAnchor");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v181, "leftAnchor");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "constraintEqualToAnchor:", v113);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v182[0] = v117;
        -[UITextView rightAnchor](v179, "rightAnchor");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v181, "rightAnchor");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "constraintEqualToAnchor:", v118);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v182[1] = v112;
        -[UITextView bottomAnchor](v179, "bottomAnchor");
        v123 = objc_claimAutoreleasedReturnValue();
        v124 = self;
        v115 = (void *)v123;
        -[VTUIEnrollmentBaseView safeAreaLayoutGuide](v124, "safeAreaLayoutGuide");
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v173, "bottomAnchor");
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "constraintEqualToAnchor:");
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        v182[2] = v169;
        v121 = (void *)MEMORY[0x24BDBCE30];
        v122 = v182;
      }
      objc_msgSend(v121, "arrayWithObjects:count:", v122, 3);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "activateConstraints:", v101);
    }

  }
}

- (id)_createPrivacyTextView
{
  void *v3;
  id v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BEBDA88]);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "setTextContainerInset:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
  objc_msgSend(v4, "textContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLineFragmentPadding:", 0.0);

  objc_msgSend(v4, "setDelegate:", self);
  if (objc_msgSend(v3, "isGreenTeaCapableDevice"))
    v6 = CFSTR("TEXT_FOOTER_CONS_REGULATORY_DISCLOSURE");
  else
    v6 = CFSTR("TEXT_FOOTER_CONS");
  objc_msgSend(v3, "VTUIDeviceSpecificString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "VTUIDeviceSpecificString:", CFSTR("BUTTON_CONS_ABOUT_SIRI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB490], "defaultParagraphStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "setAlignment:", 1);
  v11 = objc_alloc(MEMORY[0x24BDD1688]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *MEMORY[0x24BEBB3A8];
  v26[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithString:attributes:", v12, v13);

  if (objc_msgSend(v8, "length"))
  {
    v15 = objc_msgSend(v7, "length") + 1;
    v16 = objc_msgSend(v8, "length");
    v17 = *MEMORY[0x24BEBB368];
    objc_msgSend(v3, "footerTextColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAttribute:value:range:", v17, v18, 0, v15);

    objc_msgSend(v3, "buttonTextColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAttribute:value:range:", v17, v19, v15, v16);

    v20 = *MEMORY[0x24BEBB388];
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", &stru_24F340078);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAttribute:value:range:", v20, v21, v15, v16);

    objc_msgSend(v3, "footerLabelFont");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFont:", v22);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v23);

    objc_msgSend(v4, "setAttributedText:", v14);
    objc_msgSend(v4, "setEditable:", 0);
    objc_msgSend(v4, "setScrollEnabled:", 0);
    objc_msgSend(v4, "setDataDetectorTypes:", 2);
    objc_msgSend(v4, "_setInteractiveTextSelectionDisabled:", 1);
  }

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VTUIEnrollmentBaseView;
  -[VTUIEnrollmentBaseView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[_UIBackdropView transitionToPrivateStyle:](self->_backdropView, "transitionToPrivateStyle:", -[VTUIEnrollmentBaseView _backdropStyle](self, "_backdropStyle"));
}

- (int64_t)_backdropStyle
{
  void *v2;
  uint64_t v3;

  -[VTUIEnrollmentBaseView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  if (v3 == 2)
    return 2030;
  else
    return 2020;
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (void)setSubtitle:(id)a3
{
  -[UILabel setText:](self->_subtitleLabel, "setText:", a3);
}

- (void)setInstructionText:(id)a3
{
  -[UILabel setText:](self->_instructionLabel, "setText:", a3);
}

- (void)setContentView:(id)a3
{
  UIView *v4;
  UILabel *instructionLabel;
  void *v6;
  UIView *contentView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UIView *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x24BDAC8D0];
  v4 = (UIView *)a3;
  -[UIView removeFromSuperview](self->_contentView, "removeFromSuperview");
  -[UILabel removeFromSuperview](self->_instructionLabel, "removeFromSuperview");
  instructionLabel = self->_instructionLabel;
  self->_instructionLabel = 0;

  -[VTUIEnrollmentBaseView readableContentGuide](self, "readableContentGuide");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  contentView = self->_contentView;
  self->_contentView = v4;
  v21 = v4;

  -[UIView addSubview:](self->_scrollContainerView, "addSubview:", self->_contentView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v18 = (void *)MEMORY[0x24BDD1628];
  -[UIView topAnchor](self->_contentView, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_subtitleLabel, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subtitle2BaselineOffset");
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v20;
  -[UIView widthAnchor](self->_contentView, "widthAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "widthAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v9;
  -[UIView centerXAnchor](self->_contentView, "centerXAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerXAnchor](self->_scrollContainerView, "centerXAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v12;
  -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_scrollContainerView, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subtitle2BaselineOffset");
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v17);

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VTUIEnrollmentBaseView;
  -[VTUIEnrollmentBaseView updateConstraints](&v11, sel_updateConstraints);
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "interfaceOrientation") - 3;

  if (v8 > 1)
    objc_msgSend(v3, "horizontalPaddingPortrait");
  else
    objc_msgSend(v3, "horizontalPaddingLandscape");
  v10 = v9;
  -[NSLayoutConstraint setConstant:](self->_readableLeftAnchorConstraint, "setConstant:");
  -[NSLayoutConstraint setConstant:](self->_readableRightAnchorConstraint, "setConstant:", -v10);

}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VTUIEnrollmentBaseView;
  -[VTUIEnrollmentBaseView safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[VTUIEnrollmentBaseView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)layoutSubviews
{
  _UIBackdropView *backdropView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VTUIEnrollmentBaseView;
  -[VTUIEnrollmentBaseView layoutSubviews](&v4, sel_layoutSubviews);
  backdropView = self->_backdropView;
  if (backdropView)
  {
    -[_UIBackdropView frame](backdropView, "frame");
    -[VTUIEnrollmentBaseView layoutMargins](self, "layoutMargins");
    -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:");
    -[UIScrollView verticalScrollIndicatorInsets](self->_scrollView, "verticalScrollIndicatorInsets");
    -[UIScrollView setScrollIndicatorInsets:](self->_scrollView, "setScrollIndicatorInsets:");
  }
}

- (void)fadeInSubviews
{
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[5];

  -[UILabel setAlpha:](self->_titleLabel, "setAlpha:", 0.0);
  -[UILabel setAlpha:](self->_subtitleLabel, "setAlpha:", 0.0);
  -[UILabel setAlpha:](self->_instructionLabel, "setAlpha:", 0.0);
  v3 = MEMORY[0x24BDAC760];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__VTUIEnrollmentBaseView_fadeInSubviews__block_invoke;
  v6[3] = &unk_24F33DA28;
  v6[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 0, v6, 0, 0.400000006, 0.0);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __40__VTUIEnrollmentBaseView_fadeInSubviews__block_invoke_2;
  v5[3] = &unk_24F33DA28;
  v5[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 0, v5, 0, 0.400000006, 0.300000012);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __40__VTUIEnrollmentBaseView_fadeInSubviews__block_invoke_3;
  v4[3] = &unk_24F33DA28;
  v4[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 0, v4, 0, 0.400000006, 0.600000024);
}

uint64_t __40__VTUIEnrollmentBaseView_fadeInSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 1.0);
}

uint64_t __40__VTUIEnrollmentBaseView_fadeInSubviews__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 1.0);
}

uint64_t __40__VTUIEnrollmentBaseView_fadeInSubviews__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 1.0);
}

- (id)backdropView
{
  return self->_backdropView;
}

- (BOOL)showPrivacyTextView
{
  return 0;
}

- (id)footerView
{
  return 0;
}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
  -[UIScrollView setShowsVerticalScrollIndicator:](self->_scrollView, "setShowsVerticalScrollIndicator:", a3);
}

- (double)imageOffsetFromTop
{
  void *v2;
  double v3;
  double v4;

  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orbImageOffsetFromTopEnrollment");
  v4 = v3;

  return v4;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_enrollmentDelegate);
  objc_msgSend(WeakRetained, "aboutTapped:", self);

  return 0;
}

- (VTUIEnrollmentDelegate)enrollmentDelegate
{
  return (VTUIEnrollmentDelegate *)objc_loadWeakRetained((id *)&self->_enrollmentDelegate);
}

- (void)setEnrollmentDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_enrollmentDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_enrollmentDelegate);
  objc_storeStrong((id *)&self->_readableRightAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_readableLeftAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_privacyTextView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_instructionLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_scrollContainerView, 0);
  objc_storeStrong((id *)&self->_orbImage, 0);
}

@end
