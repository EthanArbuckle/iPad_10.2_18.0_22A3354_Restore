@implementation _UITextOption

- (_UITextOption)initWithTitle:(id)a3 type:(int64_t)a4
{
  return -[_UITextOption initWithTitle:type:optionalTintColor:](self, "initWithTitle:type:optionalTintColor:", a3, a4, 0);
}

- (_UITextOption)initWithTitle:(id)a3 type:(int64_t)a4 optionalTintColor:(id)a5
{
  id v9;
  UIColor *v10;
  _UITextOption *v11;
  _UITextOption *v12;
  objc_super v14;

  v9 = a3;
  v10 = (UIColor *)a5;
  v14.receiver = self;
  v14.super_class = (Class)_UITextOption;
  v11 = -[UIView init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_textChoice, a3);
    v12->_type = a4;
    v12->_state = 0;
    v12->_optionalTintColor = v10;
    -[_UITextOption updateContentView](v12, "updateContentView");
  }

  return v12;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _UITextOption *v8;
  _UITextOption *v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[UIView pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    v8 = self;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_UITextOption;
    -[UIView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
    v8 = (_UITextOption *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (void)showSeparator:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[_UITextOption lineView](self, "lineView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", !v3);

}

- (id)viewForLastBaselineLayout
{
  _UITextOption *v2;
  int *v3;

  v2 = self;
  if (-[_UITextOption type](self, "type") == 2
    || -[_UITextOption type](v2, "type") == 3
    || -[_UITextOption type](v2, "type") == 4)
  {
    v3 = &OBJC_IVAR____UITextOption__contentsLabel;
LABEL_5:
    v2 = *(_UITextOption **)((char *)&v2->super.super.super.isa + *v3);
    return v2;
  }
  if (!-[_UITextOption type](v2, "type")
    || -[_UITextOption type](v2, "type") == 1
    || -[_UITextOption type](v2, "type") == 5)
  {
    v3 = &OBJC_IVAR____UITextOption__symbolImageView;
    goto LABEL_5;
  }
  return v2;
}

- (double)leadingSpace
{
  double v3;
  double v4;

  -[_UITextOption currentEdgeInsets](self, "currentEdgeInsets");
  if (v3 <= 0.0)
    -[_UITextOption contentInsetsForType:dividerWidth:](self, "contentInsetsForType:dividerWidth:", -[_UITextOption type](self, "type"), 1.0);
  else
    -[_UITextOption currentEdgeInsets](self, "currentEdgeInsets");
  return v4;
}

- (NSDirectionalEdgeInsets)contentInsetsForType:(int64_t)a3 dividerWidth:(double)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSDirectionalEdgeInsets result;

  v5 = 8.0;
  v6 = 3.0;
  v7 = 0.0;
  v8 = 3.0;
  switch(a3)
  {
    case 2:
    case 7:
      v5 = 14.0;
      v7 = a4 + 14.0;
      v8 = 5.0;
      goto LABEL_4;
    case 3:
      break;
    case 4:
      v7 = a4 + 26.0;
      v8 = 5.0;
      v5 = 14.0;
LABEL_4:
      v6 = 6.0;
      break;
    default:
      a4 = 23.0;
      v7 = 0.0;
      v9 = 38.0;
      if (a3 != 5)
        v9 = 0.0;
      if ((unint64_t)a3 >= 2)
        v5 = v9;
      else
        v5 = 23.0;
      v6 = 0.0;
      v8 = 0.0;
      break;
  }
  -[UIView traitCollection](self, "traitCollection", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredContentSizeCategory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextOption insetMultiplierForContentSizeCategory:](self, "insetMultiplierForContentSizeCategory:", v11);
  v13 = v12;

  v14 = fmax(v13, 1.0);
  v15 = v7 * v14;
  v16 = v5 * v14;
  v17 = v8;
  v18 = v6;
  result.trailing = v15;
  result.bottom = v18;
  result.leading = v16;
  result.top = v17;
  return result;
}

- (double)insetMultiplierForContentSizeCategory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  float v6;
  double v7;

  v3 = a3;
  if (qword_1ECD7B778 != -1)
    dispatch_once(&qword_1ECD7B778, &__block_literal_global_222);
  objc_msgSend((id)_MergedGlobals_23_2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "floatValue");
    v7 = v6;
  }
  else
  {
    v7 = 1.0;
  }

  return v7;
}

- (id)createSelectionVibrancyView
{
  UIView *v2;
  void *v3;
  void *v4;
  UIVisualEffectView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(UIView);
  +[UIColor blackColor](UIColor, "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v2, "setBackgroundColor:", v3);

  +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIVibrancyEffect effectForBlurEffect:style:](UIVibrancyEffect, "effectForBlurEffect:style:", v4, 6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", v22);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIVisualEffectView contentView](v5, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v2);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = (void *)MEMORY[0x1E0D156E0];
  -[UIView leadingAnchor](v2, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](v5, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  -[UIView trailingAnchor](v2, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](v5, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v7;
  -[UIView topAnchor](v2, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](v5, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v10;
  -[UIView bottomAnchor](v2, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](v5, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateConstraints:", v14);

  return v5;
}

- (void)updateContentView
{
  UIVisualEffectView *v3;
  UIVisualEffectView *selectionVibrancyView;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t *v14;
  UIView *v15;
  UIView *v16;
  UIView *secureCandidateLabel;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
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
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  UIVisualEffectView *v57;
  UIVisualEffectView *contentsLabelEffectView;
  UILabel *v59;
  UILabel *contentsLabel;
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
  double v77;
  int64_t v78;
  void *v79;
  int v80;
  void *v81;
  void *v82;
  uint64_t v83;
  _BOOL8 v84;
  uint64_t v85;
  UILabel *v86;
  void *v87;
  UILabel *v88;
  void *v89;
  UIView *v90;
  UIView *lineView;
  void *v92;
  void *v93;
  UIVisualEffectView *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  _UIDirectionalLightConfiguration *v102;
  void *v103;
  _UIDirectionalLightConfiguration *v104;
  void *v105;
  _UIIntelligenceContentLightEffect *v106;
  int64_t v107;
  UIImageView *v108;
  UIImageView *v109;
  void *v110;
  UIImageView *v111;
  UIImageView *v112;
  UILayoutGuide *v113;
  UILayoutGuide *accessorySymbolSpacingGuide;
  int64_t v115;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  _QWORD *v128;
  UIImageView *v129;
  UILayoutGuide *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  UIImageView *v135;
  void *v136;
  int64_t v137;
  UIImageView *v138;
  uint64_t v139;
  void *v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  UIImageView *symbolImageView;
  UIImageView *v149;
  void *v150;
  UIImageView *v151;
  UIImageView *v152;
  UILayoutGuide *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  UIImageView *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
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
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  _QWORD v239[7];
  _QWORD v240[6];
  _QWORD v241[6];
  _QWORD v242[8];
  _QWORD v243[8];
  _QWORD v244[4];
  _QWORD v245[6];

  v245[4] = *MEMORY[0x1E0C80C00];
  if (!self->_selectionVibrancyView)
  {
    -[_UITextOption createSelectionVibrancyView](self, "createSelectionVibrancyView");
    v3 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue();
    selectionVibrancyView = self->_selectionVibrancyView;
    self->_selectionVibrancyView = v3;

    -[UIView addSubview:](self, "addSubview:", self->_selectionVibrancyView);
    if (-[_UITextOption type](self, "type") == 1 || (v5 = 0.0, !-[_UITextOption type](self, "type")))
      v5 = 4.0;
    v204 = (void *)MEMORY[0x1E0D156E0];
    -[UIView leadingAnchor](self->_selectionVibrancyView, "leadingAnchor");
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self, "leadingAnchor");
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v234, "constraintEqualToAnchor:", v228);
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    v245[0] = v222;
    -[UIView trailingAnchor](self->_selectionVibrancyView, "trailingAnchor");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self, "trailingAnchor");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v216, "constraintEqualToAnchor:constant:", v210, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v245[1] = v6;
    -[UIView topAnchor](self->_selectionVibrancyView, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v245[2] = v9;
    -[UIView bottomAnchor](self->_selectionVibrancyView, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v245[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v245, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v204, "activateConstraints:", v13);

    -[UIView setHidden:](self->_selectionVibrancyView, "setHidden:", -[_UITextOption selectionVisibilityForState:](self, "selectionVisibilityForState:", self->_state) ^ 1);
  }
  -[UIView setHidden:](self->_contentsLabel, "setHidden:", 1);
  -[UIImageView setHidden:](self->_symbolImageView, "setHidden:", 1);
  -[UIView setHidden:](self->_secureCandidateLabel, "setHidden:", 1);
  v14 = &qword_186677000;
  if (-[_UITextOption type](self, "type") == 6)
  {
    if (!self->_secureCandidateLabel)
    {
      v15 = [UIView alloc];
      v16 = -[UIView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      secureCandidateLabel = self->_secureCandidateLabel;
      self->_secureCandidateLabel = v16;

      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scale");
      v20 = v19;
      -[UIView layer](self->_secureCandidateLabel, "layer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setContentsScale:", v20);

      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "scale");
      v24 = v23;
      -[UIView layer](self->_secureCandidateLabel, "layer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setRasterizationScale:", v24);

      v26 = *MEMORY[0x1E0CD2F78];
      -[UIView layer](self->_secureCandidateLabel, "layer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setContentsGravity:", v26);

      -[UIView setUserInteractionEnabled:](self->_secureCandidateLabel, "setUserInteractionEnabled:", 0);
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_secureCandidateLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView addSubview:](self, "addSubview:", self->_secureCandidateLabel);
      v205 = (void *)MEMORY[0x1E0D156E0];
      -[UIView topAnchor](self->_secureCandidateLabel, "topAnchor");
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self, "topAnchor");
      v229 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v235, "constraintEqualToAnchor:", v229);
      v223 = (void *)objc_claimAutoreleasedReturnValue();
      v244[0] = v223;
      -[UIView leadingAnchor](self->_secureCandidateLabel, "leadingAnchor");
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self, "leadingAnchor");
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v217, "constraintEqualToAnchor:", v211);
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      v244[1] = v199;
      -[UIView bottomAnchor](self, "bottomAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_secureCandidateLabel, "bottomAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v244[2] = v30;
      -[UIView trailingAnchor](self, "trailingAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_secureCandidateLabel, "trailingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v244[3] = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v244, 4);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "activateConstraints:", v34);

      v14 = &qword_186677000;
    }
    objc_msgSend(MEMORY[0x1E0CD2720], "objectForSlot:", -[_UITextOption slotID](self, "slotID"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](self->_secureCandidateLabel, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setContents:", v35);

    -[UIView setHidden:](self->_secureCandidateLabel, "setHidden:", 0);
    v37 = 0.0;
    v38 = 0.0;
    v39 = 0.0;
    v40 = 0.0;
    goto LABEL_52;
  }
  if (-[_UITextOption type](self, "type") != 2
    && -[_UITextOption type](self, "type") != 3
    && -[_UITextOption type](self, "type") != 4
    && -[_UITextOption type](self, "type") != 7)
  {
    if (-[_UITextOption type](self, "type") != 1)
    {
      if (-[_UITextOption type](self, "type"))
      {
        v37 = 0.0;
        v38 = 0.0;
        v39 = 0.0;
        v40 = 0.0;
        if (-[_UITextOption type](self, "type") != 5)
          goto LABEL_52;
      }
    }
    -[_UITextOption contentInsetsForType:dividerWidth:](self, "contentInsetsForType:dividerWidth:", -[_UITextOption type](self, "type"), 0.0);
    v40 = v144;
    v39 = v145;
    v38 = v146;
    v37 = v147;
    symbolImageView = self->_symbolImageView;
    if (!symbolImageView)
    {
      v149 = [UIImageView alloc];
      -[_UITextOption buttonImage](self, "buttonImage");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      v151 = -[UIImageView initWithImage:](v149, "initWithImage:", v150);
      v152 = self->_symbolImageView;
      self->_symbolImageView = v151;

      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_symbolImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView addSubview:](self, "addSubview:", self->_symbolImageView);
      v153 = objc_alloc_init(UILayoutGuide);
      -[UIView addLayoutGuide:](self, "addLayoutGuide:", v153);
      v190 = (void *)MEMORY[0x1E0D156E0];
      -[UILayoutGuide topAnchor](v153, "topAnchor");
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self, "topAnchor");
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v238, "constraintEqualToAnchor:", v233);
      v227 = (void *)objc_claimAutoreleasedReturnValue();
      v239[0] = v227;
      -[UILayoutGuide leadingAnchor](v153, "leadingAnchor");
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self, "leadingAnchor");
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v221, "constraintEqualToAnchor:", v215);
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      v239[1] = v209;
      -[UIView bottomAnchor](self, "bottomAnchor");
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide bottomAnchor](v153, "bottomAnchor");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "constraintEqualToAnchor:", v198);
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      v239[2] = v194;
      -[UIView trailingAnchor](self, "trailingAnchor");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide trailingAnchor](v153, "trailingAnchor");
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "constraintEqualToAnchor:constant:", v182, v37);
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      v239[3] = v179;
      -[UILayoutGuide widthAnchor](v153, "widthAnchor");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v176, "constraintEqualToConstant:", v39);
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      v239[4] = v173;
      -[UIView centerYAnchor](self->_symbolImageView, "centerYAnchor");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide centerYAnchor](v153, "centerYAnchor");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "constraintEqualToAnchor:", v155);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v239[5] = v156;
      -[UIView centerXAnchor](self->_symbolImageView, "centerXAnchor");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide centerXAnchor](v153, "centerXAnchor");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v157, "constraintEqualToAnchor:", v158);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      v239[6] = v159;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v239, 7);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "activateConstraints:", v160);

      v14 = &qword_186677000;
      symbolImageView = self->_symbolImageView;
    }
    -[UIImageView setHidden:](symbolImageView, "setHidden:", 0);
    v161 = self->_symbolImageView;
    -[_UITextOption buttonImage](self, "buttonImage");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v161, "setImage:", v162);

    -[_UITextOption optionalTintColor](self, "optionalTintColor");
    v163 = (void *)objc_claimAutoreleasedReturnValue();

    v138 = self->_symbolImageView;
    if (v163)
    {
      -[_UITextOption optionalTintColor](self, "optionalTintColor");
      v139 = objc_claimAutoreleasedReturnValue();
      goto LABEL_51;
    }
    goto LABEL_49;
  }
  -[_UITextOption contentInsetsForType:dividerWidth:](self, "contentInsetsForType:dividerWidth:", -[_UITextOption type](self, "type"), 1.0);
  v40 = v41;
  v39 = v42;
  v38 = v43;
  v37 = v44;
  if (self->_contentsLabel)
  {
    -[_UITextOption insetConstraints](self, "insetConstraints");
    v45 = objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      v46 = (void *)v45;
      -[_UITextOption insetConstraints](self, "insetConstraints");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "count");

      if (v48 == 8)
      {
        -[_UITextOption insetConstraints](self, "insetConstraints");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectAtIndexedSubscript:", 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setConstant:", v40);

        -[_UITextOption insetConstraints](self, "insetConstraints");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "objectAtIndexedSubscript:", 1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setConstant:", v39);

        -[_UITextOption insetConstraints](self, "insetConstraints");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "objectAtIndexedSubscript:", 2);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setConstant:", v38);

        -[_UITextOption insetConstraints](self, "insetConstraints");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "objectAtIndexedSubscript:", 3);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setConstant:", v37);

      }
    }
  }
  else
  {
    if (!self->_contentsLabelEffectView)
    {
      v57 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", 0);
      contentsLabelEffectView = self->_contentsLabelEffectView;
      self->_contentsLabelEffectView = v57;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentsLabelEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView addSubview:](self, "addSubview:", self->_contentsLabelEffectView);
    }
    v59 = objc_alloc_init(UILabel);
    contentsLabel = self->_contentsLabel;
    self->_contentsLabel = v59;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentsLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](self->_contentsLabel, "setTextAlignment:", 1);
    -[UIVisualEffectView contentView](self->_contentsLabelEffectView, "contentView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addSubview:", self->_contentsLabel);

    -[_UITextOption insetConstraints](self, "insetConstraints");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
    {
      v63 = (void *)MEMORY[0x1E0D156E0];
      -[_UITextOption insetConstraints](self, "insetConstraints");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "deactivateConstraints:", v64);

    }
    -[UIView topAnchor](self->_contentsLabelEffectView, "topAnchor");
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self, "topAnchor");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v230, "constraintEqualToAnchor:constant:", v224, v40);
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    v243[0] = v218;
    -[UIView leadingAnchor](self->_contentsLabelEffectView, "leadingAnchor");
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self, "leadingAnchor");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v212, "constraintEqualToAnchor:constant:", v206, v39);
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    v243[1] = v200;
    -[UIView bottomAnchor](self, "bottomAnchor");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_contentsLabelEffectView, "bottomAnchor");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v195, "constraintEqualToAnchor:constant:", v191, v38);
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    v243[2] = v187;
    -[UIView trailingAnchor](self, "trailingAnchor");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_contentsLabelEffectView, "trailingAnchor");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "constraintEqualToAnchor:constant:", v180, v37);
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    v243[3] = v177;
    -[UIView topAnchor](self->_contentsLabel, "topAnchor");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_contentsLabelEffectView, "topAnchor");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "constraintEqualToAnchor:", v171);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v243[4] = v169;
    -[UIView leadingAnchor](self->_contentsLabel, "leadingAnchor");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_contentsLabelEffectView, "leadingAnchor");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "constraintEqualToAnchor:", v165);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v243[5] = v65;
    -[UIView bottomAnchor](self->_contentsLabelEffectView, "bottomAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_contentsLabel, "bottomAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v243[6] = v68;
    -[UIView trailingAnchor](self->_contentsLabelEffectView, "trailingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_contentsLabel, "trailingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v243[7] = v71;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v243, 8);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextOption setInsetConstraints:](self, "setInsetConstraints:", v72);

    -[UIView widthAnchor](self->_contentsLabel, "widthAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintGreaterThanOrEqualToConstant:", 16.0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextOption setMinimumLabelWidth:](self, "setMinimumLabelWidth:", v74);

    v75 = (void *)MEMORY[0x1E0D156E0];
    -[_UITextOption insetConstraints](self, "insetConstraints");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "activateConstraints:", v76);

    v14 = &qword_186677000;
    LODWORD(v77) = 1144750080;
    -[UIView setContentHuggingPriority:forAxis:](self->_contentsLabel, "setContentHuggingPriority:forAxis:", 0, v77);
  }
  -[UIView setHidden:](self->_contentsLabel, "setHidden:", 0);
  v78 = -[_UITextOption type](self, "type");
  -[_UITextOption minimumLabelWidth](self, "minimumLabelWidth");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v79, "isActive");

  if (v78 == 2)
  {
    if ((v80 & 1) != 0)
      goto LABEL_29;
    -[_UITextOption minimumLabelWidth](self, "minimumLabelWidth");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v81;
    v83 = 1;
  }
  else
  {
    if (!v80)
      goto LABEL_29;
    -[_UITextOption minimumLabelWidth](self, "minimumLabelWidth");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v81;
    v83 = 0;
  }
  objc_msgSend(v81, "setActive:", v83);

LABEL_29:
  v84 = -[NSString containsString:](self->_textChoice, "containsString:", CFSTR("\n"));
  if (v84)
    v85 = 2;
  else
    v85 = 1;
  -[UILabel _setMultilineLabelRequiresCarefulMeasurement:](self->_contentsLabel, "_setMultilineLabelRequiresCarefulMeasurement:", v84);
  -[UILabel setNumberOfLines:](self->_contentsLabel, "setNumberOfLines:", v85);
  -[UILabel setText:](self->_contentsLabel, "setText:", self->_textChoice);
  v86 = self->_contentsLabel;
  -[_UITextOption fontForLabel](self, "fontForLabel");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v86, "setFont:", v87);

  v88 = self->_contentsLabel;
  -[_UITextOption textColor](self, "textColor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v88, "setTextColor:", v89);

  if (!self->_lineView)
  {
    v90 = objc_alloc_init(UIView);
    lineView = self->_lineView;
    self->_lineView = v90;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_lineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[UIColor separatorColor](UIColor, "separatorColor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_lineView, "setBackgroundColor:", v92);

    +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 9);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIVibrancyEffect effectForBlurEffect:style:](UIVibrancyEffect, "effectForBlurEffect:style:", v93, 7);
    v236 = (void *)objc_claimAutoreleasedReturnValue();

    v94 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", v236);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v94, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](self, "addSubview:", v94);
    -[UIVisualEffectView contentView](v94, "contentView");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "addSubview:", self->_lineView);

    v184 = (void *)MEMORY[0x1E0D156E0];
    -[UIView trailingAnchor](self, "trailingAnchor");
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v94, "trailingAnchor");
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v231, "constraintEqualToAnchor:", v225);
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    v242[0] = v219;
    -[UIView topAnchor](v94, "topAnchor");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self, "topAnchor");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "constraintEqualToAnchor:", v207);
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    v242[1] = v201;
    -[UIView bottomAnchor](v94, "bottomAnchor");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self, "bottomAnchor");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "constraintEqualToAnchor:", v192);
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    v242[2] = v188;
    -[UIView widthAnchor](v94, "widthAnchor");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v181, "constraintEqualToConstant:", 1.0);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    v242[3] = v178;
    -[UIView trailingAnchor](v94, "trailingAnchor");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_lineView, "trailingAnchor");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "constraintEqualToAnchor:", v172);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    v242[4] = v170;
    -[UIView topAnchor](self->_lineView, "topAnchor");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v94, "topAnchor");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "constraintEqualToAnchor:", v166);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    v242[5] = v164;
    -[UIView bottomAnchor](self->_lineView, "bottomAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v94, "bottomAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "constraintEqualToAnchor:", v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v242[6] = v98;
    -[UIView widthAnchor](self->_lineView, "widthAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "constraintEqualToConstant:", 1.0);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v242[7] = v100;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v242, 8);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "activateConstraints:", v101);

    v14 = &qword_186677000;
  }
  if (-[_UITextOption type](self, "type") == 7)
  {
    v102 = [_UIDirectionalLightConfiguration alloc];
    +[_UIColorPalette intelligenceAmbientPalette](_UIColorPalette, "intelligenceAmbientPalette");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = -[_UIDirectionalLightConfiguration initWithColorPalette:](v102, "initWithColorPalette:", v103);

    -[_UIDirectionalLightConfiguration setDirection:](v104, "setDirection:", 2);
    -[_UIDirectionalLightConfiguration setDuration:](v104, "setDuration:", 3.0);
    +[_UIIntelligenceLightSourceDescriptor directionalLightWithConfiguration:](_UIIntelligenceLightSourceDescriptor, "directionalLightWithConfiguration:", v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = -[_UIIntelligenceContentLightEffect initWithLightSource:]([_UIIntelligenceContentLightEffect alloc], "initWithLightSource:", v105);
    -[UIVisualEffectView setEffect:](self->_contentsLabelEffectView, "setEffect:", v106);

  }
  else
  {
    -[UIVisualEffectView setEffect:](self->_contentsLabelEffectView, "setEffect:", 0);
  }
  v107 = -[_UITextOption type](self, "type");
  v108 = self->_symbolImageView;
  if (v107 == 4)
  {
    if (!v108)
    {
      v109 = [UIImageView alloc];
      -[_UITextOption buttonImage](self, "buttonImage");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = -[UIImageView initWithImage:](v109, "initWithImage:", v110);
      v112 = self->_symbolImageView;
      self->_symbolImageView = v111;

      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_symbolImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView addSubview:](self, "addSubview:", self->_symbolImageView);
      if (self->_accessorySymbolSpacingGuide)
        -[UIView removeLayoutGuide:](self, "removeLayoutGuide:");
      v113 = objc_alloc_init(UILayoutGuide);
      accessorySymbolSpacingGuide = self->_accessorySymbolSpacingGuide;
      self->_accessorySymbolSpacingGuide = v113;

      -[UIView addLayoutGuide:](self, "addLayoutGuide:", self->_accessorySymbolSpacingGuide);
      v115 = -[_UITextOption type](self, "type");
      v208 = (void *)MEMORY[0x1E0D156E0];
      -[UILayoutGuide topAnchor](self->_accessorySymbolSpacingGuide, "topAnchor");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self, "topAnchor");
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      v237 = v116;
      objc_msgSend(v116, "constraintEqualToAnchor:constant:", v232, v40);
      v117 = objc_claimAutoreleasedReturnValue();
      v226 = (void *)v117;
      if (v115 == 4)
      {
        v241[0] = v117;
        -[UIView bottomAnchor](self, "bottomAnchor");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILayoutGuide bottomAnchor](self->_accessorySymbolSpacingGuide, "bottomAnchor");
        v214 = (void *)objc_claimAutoreleasedReturnValue();
        v220 = v118;
        objc_msgSend(v118, "constraintEqualToAnchor:constant:", v214, v38);
        v202 = (void *)objc_claimAutoreleasedReturnValue();
        v241[1] = v202;
        -[UILayoutGuide trailingAnchor](self->_accessorySymbolSpacingGuide, "trailingAnchor");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView leadingAnchor](self->_lineView, "leadingAnchor");
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        v197 = v119;
        objc_msgSend(v119, "constraintEqualToAnchor:", v193);
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        v241[2] = v189;
        -[UIView centerXAnchor](self->_symbolImageView, "centerXAnchor");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILayoutGuide centerXAnchor](self->_accessorySymbolSpacingGuide, "centerXAnchor");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        v185 = v120;
        objc_msgSend(v120, "constraintEqualToAnchor:constant:", v121, -2.0);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        v241[3] = v122;
        -[UIView centerYAnchor](self->_symbolImageView, "centerYAnchor");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILayoutGuide centerYAnchor](self->_accessorySymbolSpacingGuide, "centerYAnchor");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "constraintEqualToAnchor:", v124);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v241[4] = v125;
        -[UILayoutGuide widthAnchor](self->_accessorySymbolSpacingGuide, "widthAnchor");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "constraintEqualToConstant:", v37);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        v241[5] = v127;
        v128 = v241;
      }
      else
      {
        v240[0] = v117;
        -[UIView bottomAnchor](self, "bottomAnchor");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILayoutGuide bottomAnchor](self->_accessorySymbolSpacingGuide, "bottomAnchor");
        v214 = (void *)objc_claimAutoreleasedReturnValue();
        v220 = v131;
        objc_msgSend(v131, "constraintEqualToAnchor:constant:", v214, v38);
        v202 = (void *)objc_claimAutoreleasedReturnValue();
        v240[1] = v202;
        -[UILayoutGuide leadingAnchor](self->_accessorySymbolSpacingGuide, "leadingAnchor");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView leadingAnchor](self, "leadingAnchor");
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        v197 = v132;
        objc_msgSend(v132, "constraintEqualToAnchor:", v193);
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        v240[2] = v189;
        -[UIView centerXAnchor](self->_symbolImageView, "centerXAnchor");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILayoutGuide centerXAnchor](self->_accessorySymbolSpacingGuide, "centerXAnchor");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        v185 = v133;
        objc_msgSend(v133, "constraintEqualToAnchor:constant:", v121, 0.0);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        v240[3] = v122;
        -[UIView centerYAnchor](self->_symbolImageView, "centerYAnchor");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILayoutGuide centerYAnchor](self->_accessorySymbolSpacingGuide, "centerYAnchor");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "constraintEqualToAnchor:constant:", v124, -2.0);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v240[4] = v125;
        -[UILayoutGuide widthAnchor](self->_accessorySymbolSpacingGuide, "widthAnchor");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "constraintEqualToConstant:", v39);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        v240[5] = v127;
        v128 = v240;
      }
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v128, 6);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v208, "activateConstraints:", v134);

      v108 = self->_symbolImageView;
      v14 = &qword_186677000;
    }
    -[UIImageView setHidden:](v108, "setHidden:", 0);
    v135 = self->_symbolImageView;
    -[_UITextOption buttonImage](self, "buttonImage");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v135, "setImage:", v136);

    -[UIImageView setContentMode:](self->_symbolImageView, "setContentMode:", 1);
    v137 = -[_UITextOption type](self, "type");
    v138 = self->_symbolImageView;
    if (v137 != 4)
    {
      +[UIColor labelColor](UIColor, "labelColor");
      v139 = objc_claimAutoreleasedReturnValue();
      goto LABEL_51;
    }
LABEL_49:
    +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
    v139 = objc_claimAutoreleasedReturnValue();
LABEL_51:
    v140 = (void *)v139;
    -[UIView setTintColor:](v138, "setTintColor:", v139);

    LODWORD(v141) = *((_DWORD *)v14 + 998);
    -[UIView setContentHuggingPriority:forAxis:](self->_symbolImageView, "setContentHuggingPriority:forAxis:", 0, v141);
    goto LABEL_52;
  }
  if (v108)
  {
    -[UIView removeFromSuperview](v108, "removeFromSuperview");
    v129 = self->_symbolImageView;
    self->_symbolImageView = 0;

    if (self->_accessorySymbolSpacingGuide)
    {
      -[UIView removeLayoutGuide:](self, "removeLayoutGuide:");
      v130 = self->_accessorySymbolSpacingGuide;
      self->_accessorySymbolSpacingGuide = 0;

    }
  }
LABEL_52:
  -[_UITextOption setCurrentEdgeInsets:](self, "setCurrentEdgeInsets:", v40, v39, v38, v37);
  -[_UITextOption setHorizontalPadding:](self, "setHorizontalPadding:", v37 + v39);
  LODWORD(v142) = *((_DWORD *)v14 + 998);
  -[UIView setContentHuggingPriority:forAxis:](self, "setContentHuggingPriority:forAxis:", 0, v142);
  LODWORD(v143) = 1148829696;
  -[UIView setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 0, v143);
}

- (void)updateText:(id)a3 type:(int64_t)a4
{
  UIImageView *symbolImageView;
  UIImageView *v8;
  UILayoutGuide *accessorySymbolSpacingGuide;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  objc_storeStrong((id *)&self->_textChoice, a3);
  if (self->_type == a4)
  {
    -[_UITextOption updateContentView](self, "updateContentView");
  }
  else
  {
    self->_type = a4;
    symbolImageView = self->_symbolImageView;
    if (symbolImageView)
    {
      -[UIView removeFromSuperview](symbolImageView, "removeFromSuperview");
      v8 = self->_symbolImageView;
      self->_symbolImageView = 0;

      if (self->_accessorySymbolSpacingGuide)
      {
        -[UIView removeLayoutGuide:](self, "removeLayoutGuide:");
        accessorySymbolSpacingGuide = self->_accessorySymbolSpacingGuide;
        self->_accessorySymbolSpacingGuide = 0;

      }
    }
    -[_UITextOption updateContentView](self, "updateContentView");
    if ((((unint64_t)a4 < 8) & (0xDCu >> a4)) != 0)
    {
      v10 = (a4 & 0xFFFFFFFFFFFFFFFBLL) == 2 || a4 == 7;
      v11 = 0.0;
      if (v10)
        v11 = 1.0;
      -[_UITextOption contentInsetsForType:dividerWidth:](self, "contentInsetsForType:dividerWidth:", a4, v11);
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      -[_UITextOption insetConstraints](self, "insetConstraints");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (v21 == 8)
      {
        -[_UITextOption insetConstraints](self, "insetConstraints");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setConstant:", v13);

        -[_UITextOption insetConstraints](self, "insetConstraints");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndexedSubscript:", 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setConstant:", v15);

        -[_UITextOption insetConstraints](self, "insetConstraints");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndexedSubscript:", 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setConstant:", v17);

        -[_UITextOption insetConstraints](self, "insetConstraints");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectAtIndexedSubscript:", 3);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setConstant:", v19);

      }
    }
  }
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (id)textToUse
{
  __CFString *v3;

  if (-[_UITextOption type](self, "type") == 6
    || -[_UITextOption type](self, "type") == 2
    || -[_UITextOption type](self, "type") == 3
    || -[_UITextOption type](self, "type") == 4
    || -[_UITextOption type](self, "type") == 7)
  {
    v3 = self->_textChoice;
  }
  else if (-[_UITextOption type](self, "type") == 1)
  {
    v3 = CFSTR("autocorrection.revert");
  }
  else if (-[_UITextOption type](self, "type"))
  {
    v3 = 0;
  }
  else
  {
    v3 = CFSTR("autocorrection.cancel");
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  if (-[_UITextOption type](self, "type") == 6)
  {
    -[_UITextOption secureCandidateSize](self, "secureCandidateSize");
    v4 = v3;
    v6 = v5;
  }
  else if (-[_UITextOption type](self, "type") == 2
         || -[_UITextOption type](self, "type") == 3
         || -[_UITextOption type](self, "type") == 4
         || -[_UITextOption type](self, "type") == 7)
  {
    -[UILabel intrinsicContentSize](self->_contentsLabel, "intrinsicContentSize");
    v4 = v7;
    v6 = v8;
    if (-[_UITextOption type](self, "type") == 2)
    {
      v9 = 32.0;
    }
    else
    {
      v10 = -[_UITextOption type](self, "type");
      v9 = 32.0;
      if (v10 != 4)
        v9 = 27.0;
    }
    if (v6 < v9)
      v6 = v9;
  }
  else
  {
    v6 = 27.0;
    v4 = -1.0;
  }
  -[_UITextOption horizontalPadding](self, "horizontalPadding");
  v12 = v4 + v11;
  v13 = v6;
  result.height = v13;
  result.width = v12;
  return result;
}

- (id)fontForLabel
{
  void *v2;
  void *v3;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleCallout"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)textColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

+ (double)baseSymbolSize
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  if (qword_1ECD7B788 != -1)
    dispatch_once(&qword_1ECD7B788, &__block_literal_global_414);
  objc_msgSend((id)UIApp, "preferredContentSizeCategory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECD7B780, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4 + 22.0;

  return v5;
}

- (id)buttonImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSComparisonResult v9;
  void *v10;
  void *v11;

  if (-[_UITextOption type](self, "type") == 5)
  {
    objc_msgSend((id)objc_opt_class(), "baseSymbolSize");
    +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 6, -1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextOption imageName](self, "imageName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v4, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithRenderingMode:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 7, -1, 10.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredContentSizeCategory");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = UIContentSizeCategoryCompareToCategory(v8, CFSTR("UICTContentSizeCategoryL"));

    if (v9 == NSOrderedDescending)
    {
      +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleEmphasizedCaption2"), -1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      +[UIImageSymbolConfiguration configurationWithWeight:](UIImageSymbolConfiguration, "configurationWithWeight:", 7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "configurationByApplyingConfiguration:", v11);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[_UITextOption imageName](self, "imageName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v4, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)imageName
{
  unint64_t v3;
  __CFString *v4;

  v3 = -[_UITextOption type](self, "type");
  if (v3 < 2 || v3 == 5)
  {
    v4 = self->_textChoice;
  }
  else if (v3 == 4)
  {
    v4 = CFSTR("arrow.uturn.backward");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)selectionVisibilityForState:(unint64_t)a3
{
  return a3 == 4;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
  -[UIView setHidden:](self->_selectionVibrancyView, "setHidden:", -[_UITextOption selectionVisibilityForState:](self, "selectionVisibilityForState:") ^ 1);
}

- (unint64_t)state
{
  return self->_state;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)originalText
{
  return self->_originalText;
}

- (void)setOriginalText:(id)a3
{
  self->_originalText = (NSString *)a3;
}

- (UIColor)optionalTintColor
{
  return self->_optionalTintColor;
}

- (void)setOptionalTintColor:(id)a3
{
  self->_optionalTintColor = (UIColor *)a3;
}

- (unsigned)slotID
{
  return self->_slotID;
}

- (void)setSlotID:(unsigned int)a3
{
  self->_slotID = a3;
}

- (TIKeyboardCandidate)sourceCandidate
{
  return self->_sourceCandidate;
}

- (void)setSourceCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_sourceCandidate, a3);
}

- (CGSize)secureCandidateSize
{
  double width;
  double height;
  CGSize result;

  width = self->_secureCandidateSize.width;
  height = self->_secureCandidateSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSecureCandidateSize:(CGSize)a3
{
  self->_secureCandidateSize = a3;
}

- (NSString)textChoice
{
  return self->_textChoice;
}

- (void)setTextChoice:(id)a3
{
  objc_storeStrong((id *)&self->_textChoice, a3);
}

- (UILabel)contentsLabel
{
  return self->_contentsLabel;
}

- (void)setContentsLabel:(id)a3
{
  objc_storeStrong((id *)&self->_contentsLabel, a3);
}

- (UIImageView)symbolImageView
{
  return self->_symbolImageView;
}

- (void)setSymbolImageView:(id)a3
{
  objc_storeStrong((id *)&self->_symbolImageView, a3);
}

- (UIView)lineView
{
  return self->_lineView;
}

- (void)setLineView:(id)a3
{
  objc_storeStrong((id *)&self->_lineView, a3);
}

- (UIView)secureCandidateLabel
{
  return self->_secureCandidateLabel;
}

- (void)setSecureCandidateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secureCandidateLabel, a3);
}

- (UIVisualEffectView)selectionVibrancyView
{
  return self->_selectionVibrancyView;
}

- (void)setSelectionVibrancyView:(id)a3
{
  objc_storeStrong((id *)&self->_selectionVibrancyView, a3);
}

- (UIVisualEffectView)contentsLabelEffectView
{
  return self->_contentsLabelEffectView;
}

- (void)setContentsLabelEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_contentsLabelEffectView, a3);
}

- (double)horizontalPadding
{
  return self->_horizontalPadding;
}

- (void)setHorizontalPadding:(double)a3
{
  self->_horizontalPadding = a3;
}

- (NSArray)insetConstraints
{
  return self->_insetConstraints;
}

- (void)setInsetConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_insetConstraints, a3);
}

- (NSLayoutConstraint)minimumLabelWidth
{
  return self->_minimumLabelWidth;
}

- (void)setMinimumLabelWidth:(id)a3
{
  objc_storeStrong((id *)&self->_minimumLabelWidth, a3);
}

- (UILayoutGuide)accessorySymbolSpacingGuide
{
  return self->_accessorySymbolSpacingGuide;
}

- (void)setAccessorySymbolSpacingGuide:(id)a3
{
  objc_storeStrong((id *)&self->_accessorySymbolSpacingGuide, a3);
}

- (NSDirectionalEdgeInsets)currentEdgeInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_currentEdgeInsets.top;
  leading = self->_currentEdgeInsets.leading;
  bottom = self->_currentEdgeInsets.bottom;
  trailing = self->_currentEdgeInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setCurrentEdgeInsets:(NSDirectionalEdgeInsets)a3
{
  self->_currentEdgeInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorySymbolSpacingGuide, 0);
  objc_storeStrong((id *)&self->_minimumLabelWidth, 0);
  objc_storeStrong((id *)&self->_insetConstraints, 0);
  objc_storeStrong((id *)&self->_contentsLabelEffectView, 0);
  objc_storeStrong((id *)&self->_selectionVibrancyView, 0);
  objc_storeStrong((id *)&self->_secureCandidateLabel, 0);
  objc_storeStrong((id *)&self->_lineView, 0);
  objc_storeStrong((id *)&self->_symbolImageView, 0);
  objc_storeStrong((id *)&self->_contentsLabel, 0);
  objc_storeStrong((id *)&self->_textChoice, 0);
  objc_storeStrong((id *)&self->_sourceCandidate, 0);
}

@end
