@implementation _TVRUIUpNextViewControllerCell

- (_TVRUIUpNextViewControllerCell)initWithFrame:(CGRect)a3
{
  _TVRUIUpNextViewControllerCell *v3;
  _TVRUIUpNextViewControllerCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVRUIUpNextViewControllerCell;
  v3 = -[_TVRUIUpNextViewControllerCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_TVRUIUpNextViewControllerCell _configureHierarchy](v3, "_configureHierarchy");
    -[_TVRUIUpNextViewControllerCell setShowsSeparator:](v4, "setShowsSeparator:", 1);
  }
  return v4;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_TVRUIUpNextViewControllerCell;
  -[_TVRUIUpNextViewControllerCell prepareForReuse](&v8, sel_prepareForReuse);
  -[_TVRUIUpNextViewControllerCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

  -[_TVRUIUpNextViewControllerCell titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", 0);

  -[_TVRUIUpNextViewControllerCell secondaryLabel](self, "secondaryLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", 0);

  -[_TVRUIUpNextViewControllerCell setShowsSeparator:](self, "setShowsSeparator:", 1);
  -[_TVRUIUpNextViewControllerCell _updateLayoutConstraintsForCurrentSizeCategory](self, "_updateLayoutConstraintsForCurrentSizeCategory");
  -[_TVRUIUpNextViewControllerCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");

  -[_TVRUIUpNextViewControllerCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

}

- (void)setShowsSeparator:(BOOL)a3
{
  self->_showsSeparator = a3;
  -[_TVRUIUpNextViewControllerCell _updateSeparatorVisibility](self, "_updateSeparatorVisibility");
}

- (void)setUpNextInfo:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_upNextInfo, a3);
  v5 = a3;
  -[_TVRUIUpNextViewControllerCell _updateForUpNextInfo:](self, "_updateForUpNextInfo:", v5);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)_TVRUIUpNextViewControllerCell;
  -[_TVRUIUpNextViewControllerCell layoutSubviews](&v23, sel_layoutSubviews);
  -[_TVRUIUpNextViewControllerCell gradientView](self, "gradientView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[_TVRUIUpNextViewControllerCell gradientLayer](self, "gradientLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[_TVRUIUpNextViewControllerCell imageView](self, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[_TVRUIUpNextViewControllerCell attributionMaskImageView](self, "attributionMaskImageView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

}

+ (void)setIsStackedLayout:(BOOL)a3
{
  __tvrui_upNextViewControllerCellIsStackedLayout = a3;
}

+ (BOOL)isStackedLayout
{
  return __tvrui_upNextViewControllerCellIsStackedLayout;
}

- (void)_configureHierarchy
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIImageView *v8;
  UIImageView *v9;
  UILabel *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  UIView *v15;
  CAGradientLayer *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  UIProgressView *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  double v31;
  UILabel *v32;
  UILabel *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  void *v45;
  double v46;
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
  uint64_t v71;
  uint64_t v72;
  void *v73;
  UILabel *v74;
  void *v75;
  UIProgressView *v76;
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
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  UIImageView *imageView;
  UIImageView *attributionMaskImageView;
  UILabel *titleLabel;
  UILabel *v113;
  UILabel *secondaryLabel;
  UILabel *v115;
  UIView *separatorView;
  UIView *v117;
  UIButton *actionButton;
  UIButton *v119;
  UIProgressView *playbackProgressView;
  UIProgressView *v121;
  UIView *gradientView;
  UIView *v123;
  CAGradientLayer *gradientLayer;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
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
  void *v158;
  void *v159;
  void *v160;
  void *v161;
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
  UIProgressView *v216;
  CAGradientLayer *v217;
  UIImageView *v218;
  UILabel *v219;
  UIImageView *v220;
  UILabel *v221;
  UIImageView *v222;
  UIImageView *v223;
  UIView *v224;
  UIView *v225;
  UIButton *v226;
  _TVRUIUpNextViewControllerCell *v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  _QWORD v232[35];
  _QWORD v233[31];
  _QWORD v234[4];
  _BYTE v235[128];
  _QWORD v236[4];

  v236[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BEBD668]);
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], v5, v6, v7);
  v9 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithFrame:", v4, v5, v6, v7);
  v10 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v4, v5, v6, v7);
  v219 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v4, v5, v6, v7);
  v225 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v4, v5, v6, v7);
  -[_TVRUIUpNextViewControllerCell _actionButton](self, "_actionButton");
  v226 = (UIButton *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 1148846080;
  -[UIButton setContentHuggingPriority:forAxis:](v226, "setContentHuggingPriority:forAxis:", 0, v11);
  v12 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("CornerBlurAttributionMask"), v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](v9, "setImage:", v14);

  -[UIImageView setMaskView:](v8, "setMaskView:", v9);
  v218 = v9;
  -[UIImageView addSubview:](v8, "addSubview:", v9);
  v15 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDE56B8], "layer");
  v16 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "colorWithAlphaComponent:", 0.0);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v236[0] = objc_msgSend(v18, "CGColor");
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "colorWithAlphaComponent:", 0.8);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v236[1] = objc_msgSend(v20, "CGColor");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v236, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAGradientLayer setColors:](v16, "setColors:", v21);

  -[CAGradientLayer setStartPoint:](v16, "setStartPoint:", 0.5, 0.0);
  -[CAGradientLayer setEndPoint:](v16, "setEndPoint:", 0.5, 1.0);
  -[UIView layer](v15, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v217 = v16;
  objc_msgSend(v22, "insertSublayer:atIndex:", v16, 0);

  v224 = v15;
  -[UIImageView addSubview:](v8, "addSubview:", v15);
  v23 = (UIProgressView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD8A0]), "initWithProgressViewStyle:", 0);
  -[UIProgressView setTranslatesAutoresizingMaskIntoConstraints:](v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIProgressView setProgressTintColor:](v23, "setProgressTintColor:", v24);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.847058824, 0.847058824, 0.847058824, 0.4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIProgressView setTrackTintColor:](v23, "setTrackTintColor:", v25);

  LODWORD(v26) = 0.5;
  -[UIProgressView setProgress:](v23, "setProgress:", v26);
  v216 = v23;
  -[UIImageView addSubview:](v8, "addSubview:", v23);
  v227 = self;
  -[_TVRUIUpNextViewControllerCell contentView](self, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v27, "addSubview:", v28);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v10, "setFont:", v29);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v10, "setTextColor:", v30);

  -[UILabel setNumberOfLines:](v10, "setNumberOfLines:", 2);
  -[UILabel setAdjustsFontForContentSizeCategory:](v10, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](v10, "setAdjustsFontSizeToFitWidth:", 1);
  LODWORD(v31) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](v10, "setContentHuggingPriority:forAxis:", 1, v31);
  v221 = v10;
  v32 = v10;
  v33 = v219;
  objc_msgSend(v28, "addSubview:", v32);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1E0]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v219, "setFont:", v34);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v219, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v219, "setTextColor:", v35);

  -[UILabel setNumberOfLines:](v219, "setNumberOfLines:", 2);
  -[UILabel setAdjustsFontForContentSizeCategory:](v219, "setAdjustsFontForContentSizeCategory:", 1);
  LODWORD(v36) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](v219, "setContentHuggingPriority:forAxis:", 1, v36);
  objc_msgSend(v28, "addSubview:", v219);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.25, 1.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v225, "setBackgroundColor:", v37);

  -[UIImageView _setContinuousCornerRadius:](v8, "_setContinuousCornerRadius:", 8.0);
  -[UIImageView setClipsToBounds:](v8, "setClipsToBounds:", 1);
  -[UIImageView setContentMode:](v8, "setContentMode:", 2);
  v230 = 0u;
  v231 = 0u;
  v228 = 0u;
  v229 = 0u;
  v222 = v8;
  v234[0] = v8;
  v234[1] = v28;
  v234[2] = v226;
  v234[3] = v225;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v234, 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v228, v235, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v229;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v229 != v41)
          objc_enumerationMutation(v38);
        v43 = *(void **)(*((_QWORD *)&v228 + 1) + 8 * i);
        objc_msgSend(v43, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v27, "addSubview:", v43);
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v228, v235, 16);
    }
    while (v40);
  }

  objc_msgSend(v27, "heightAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToConstant:", 0.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v46) = 1132068864;
  objc_msgSend(v45, "setPriority:", v46);
  v166 = v45;
  v152 = v28;
  if (objc_msgSend((id)objc_opt_class(), "isStackedLayout"))
  {
    -[UIImageView topAnchor](v8, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "topAnchor");
    v174 = v47;
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", 8.0);
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    v233[0] = v215;
    -[UIImageView leadingAnchor](v8, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "leadingAnchor");
    v214 = v48;
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", 20.0);
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    v233[1] = v212;
    -[UIImageView widthAnchor](v8, "widthAnchor");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v211, "constraintEqualToConstant:", 117.0);
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    v233[2] = v210;
    -[UIImageView heightAnchor](v8, "heightAnchor");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v209, "constraintEqualToConstant:", 66.0);
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    v233[3] = v208;
    objc_msgSend(v28, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v8, "bottomAnchor");
    v207 = v49;
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", 2.0);
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    v233[4] = v205;
    objc_msgSend(v28, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "leadingAnchor");
    v204 = v50;
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:constant:", 20.0);
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    v233[5] = v202;
    objc_msgSend(v28, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v201 = v51;
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:constant:", -20.0);
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    v233[6] = v199;
    objc_msgSend(v28, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bottomAnchor");
    v198 = v52;
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    v233[7] = v196;
    -[UILabel topAnchor](v221, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "topAnchor");
    v195 = v53;
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    v233[8] = v193;
    -[UILabel leadingAnchor](v221, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leadingAnchor");
    v192 = v54;
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    v233[9] = v190;
    -[UILabel trailingAnchor](v221, "trailingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    v189 = v55;
    objc_msgSend(v55, "constraintEqualToAnchor:");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    v233[10] = v187;
    -[UILabel topAnchor](v219, "topAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v221, "bottomAnchor");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    v186 = v56;
    objc_msgSend(v56, "constraintEqualToAnchor:constant:", 2.0);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    v233[11] = v184;
    -[UILabel leadingAnchor](v219, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leadingAnchor");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    v183 = v57;
    objc_msgSend(v57, "constraintEqualToAnchor:");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v233[12] = v181;
    -[UILabel trailingAnchor](v219, "trailingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    v180 = v58;
    objc_msgSend(v58, "constraintEqualToAnchor:");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    v233[13] = v178;
    -[UILabel bottomAnchor](v219, "bottomAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bottomAnchor");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = v59;
    objc_msgSend(v59, "constraintEqualToAnchor:");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    v233[14] = v175;
    -[UIButton centerYAnchor](v226, "centerYAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView centerYAnchor](v8, "centerYAnchor");
    v173 = v60;
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v149);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    v233[15] = v172;
    -[UIButton trailingAnchor](v226, "trailingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v170 = v61;
    objc_msgSend(v61, "constraintEqualToAnchor:constant:", -20.0);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v233[16] = v168;
    -[UIButton widthAnchor](v226, "widthAnchor");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "constraintEqualToConstant:", 44.0);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v233[17] = v165;
    -[UIButton heightAnchor](v226, "heightAnchor");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "constraintEqualToConstant:", 44.0);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    v233[18] = v163;
    -[UIView leadingAnchor](v225, "leadingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v221, "leadingAnchor");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v162 = v62;
    objc_msgSend(v62, "constraintEqualToAnchor:");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    v233[19] = v160;
    -[UIView heightAnchor](v225, "heightAnchor");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "constraintEqualToConstant:", 0.5);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v233[20] = v158;
    -[UIView trailingAnchor](v225, "trailingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v157 = v63;
    objc_msgSend(v63, "constraintEqualToAnchor:");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    v233[21] = v155;
    -[UIView bottomAnchor](v225, "bottomAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bottomAnchor");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = v64;
    objc_msgSend(v64, "constraintEqualToAnchor:constant:", -0.5);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v233[22] = v151;
    -[UIView leadingAnchor](v224, "leadingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView leadingAnchor](v8, "leadingAnchor");
    v150 = v65;
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v233[23] = v147;
    -[UIView trailingAnchor](v224, "trailingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v8, "trailingAnchor");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = v66;
    objc_msgSend(v66, "constraintEqualToAnchor:");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v233[24] = v144;
    -[UIView bottomAnchor](v224, "bottomAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v8, "bottomAnchor");
    v68 = v67;
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v233[25] = v142;
    -[UIView heightAnchor](v224, "heightAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView heightAnchor](v8, "heightAnchor");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:multiplier:", 0.3);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v233[26] = v140;
    -[UIProgressView leadingAnchor](v23, "leadingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView leadingAnchor](v8, "leadingAnchor");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:constant:", 8.0);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v233[27] = v138;
    -[UIProgressView trailingAnchor](v23, "trailingAnchor");
    v71 = objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v8, "trailingAnchor");
    v72 = objc_claimAutoreleasedReturnValue();
    v137 = (void *)v71;
    v73 = (void *)v71;
    v74 = v221;
    v75 = (void *)v72;
    objc_msgSend(v73, "constraintEqualToAnchor:constant:", v72, -8.0);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v233[28] = v136;
    -[UIProgressView bottomAnchor](v216, "bottomAnchor");
    v76 = v216;
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v222, "bottomAnchor");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:constant:", -8.0);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v233[29] = v134;
    -[UIProgressView heightAnchor](v216, "heightAnchor");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "constraintEqualToConstant:", 2.0);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v233[30] = v132;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v233, 31);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVRUIUpNextViewControllerCell setStackedLayoutConstraints:](v227, "setStackedLayoutConstraints:");
  }
  else
  {
    -[UIImageView leadingAnchor](v8, "leadingAnchor");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "leadingAnchor");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "constraintEqualToAnchor:constant:", v171, 20.0);
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    v232[0] = v215;
    -[UIImageView centerYAnchor](v8, "centerYAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "centerYAnchor");
    v214 = v78;
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:");
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    v232[1] = v212;
    -[UIImageView widthAnchor](v8, "widthAnchor");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v211, "constraintEqualToConstant:", 117.0);
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    v232[2] = v210;
    -[UIImageView heightAnchor](v8, "heightAnchor");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v209, "constraintEqualToConstant:", 66.0);
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    v232[3] = v208;
    objc_msgSend(v28, "leadingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v8, "trailingAnchor");
    v207 = v79;
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintEqualToAnchor:constant:", 12.0);
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    v232[4] = v205;
    objc_msgSend(v28, "centerYAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "centerYAnchor");
    v204 = v80;
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    v232[5] = v202;
    objc_msgSend(v28, "trailingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton leadingAnchor](v226, "leadingAnchor");
    v201 = v81;
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:constant:", -5.0);
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    v232[6] = v199;
    v232[7] = v45;
    objc_msgSend(v27, "heightAnchor");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v198, "constraintGreaterThanOrEqualToConstant:", 88.0);
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    v232[8] = v197;
    objc_msgSend(v27, "heightAnchor");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "constraintLessThanOrEqualToConstant:", 350.0);
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    v232[9] = v195;
    objc_msgSend(v27, "heightAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView heightAnchor](v8, "heightAnchor");
    v194 = v82;
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintGreaterThanOrEqualToAnchor:constant:", 16.0);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    v232[10] = v192;
    objc_msgSend(v27, "heightAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "heightAnchor");
    v191 = v83;
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintGreaterThanOrEqualToAnchor:");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    v232[11] = v189;
    -[UILabel topAnchor](v221, "topAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "topAnchor");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    v188 = v84;
    objc_msgSend(v84, "constraintEqualToAnchor:");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    v232[12] = v186;
    -[UILabel leadingAnchor](v221, "leadingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leadingAnchor");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    v185 = v85;
    objc_msgSend(v85, "constraintEqualToAnchor:");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    v232[13] = v183;
    -[UILabel trailingAnchor](v221, "trailingAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = v86;
    objc_msgSend(v86, "constraintEqualToAnchor:");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    v232[14] = v180;
    -[UILabel topAnchor](v219, "topAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v221, "bottomAnchor");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = v87;
    objc_msgSend(v87, "constraintEqualToAnchor:constant:", 2.0);
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    v232[15] = v177;
    -[UILabel leadingAnchor](v219, "leadingAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leadingAnchor");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    v176 = v88;
    objc_msgSend(v88, "constraintEqualToAnchor:");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    v232[16] = v173;
    -[UILabel trailingAnchor](v219, "trailingAnchor");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "constraintEqualToAnchor:");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    v232[17] = v170;
    -[UILabel bottomAnchor](v219, "bottomAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bottomAnchor");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = v89;
    objc_msgSend(v89, "constraintEqualToAnchor:");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    v232[18] = v167;
    -[UIButton centerYAnchor](v226, "centerYAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "centerYAnchor");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    v165 = v90;
    objc_msgSend(v90, "constraintEqualToAnchor:constant:", 0.0);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    v232[19] = v163;
    -[UIButton trailingAnchor](v226, "trailingAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v162 = v91;
    objc_msgSend(v91, "constraintEqualToAnchor:constant:", -20.0);
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    v232[20] = v160;
    -[UIButton widthAnchor](v226, "widthAnchor");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "constraintEqualToConstant:", 44.0);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v232[21] = v158;
    -[UIButton heightAnchor](v226, "heightAnchor");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "constraintEqualToConstant:", 44.0);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v232[22] = v156;
    -[UIView leadingAnchor](v225, "leadingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v221, "leadingAnchor");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = v92;
    objc_msgSend(v92, "constraintEqualToAnchor:");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v232[23] = v153;
    -[UIView heightAnchor](v225, "heightAnchor");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "constraintEqualToConstant:", 0.5);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v232[24] = v150;
    -[UIView trailingAnchor](v225, "trailingAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = v93;
    objc_msgSend(v93, "constraintEqualToAnchor:");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v232[25] = v146;
    -[UIView bottomAnchor](v225, "bottomAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bottomAnchor");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v145 = v94;
    objc_msgSend(v94, "constraintEqualToAnchor:constant:", -0.5);
    v130 = objc_claimAutoreleasedReturnValue();
    v232[26] = v130;
    -[UIView leadingAnchor](v224, "leadingAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView leadingAnchor](v8, "leadingAnchor");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = v95;
    objc_msgSend(v95, "constraintEqualToAnchor:");
    v129 = objc_claimAutoreleasedReturnValue();
    v232[27] = v129;
    -[UIView trailingAnchor](v224, "trailingAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v8, "trailingAnchor");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = v96;
    objc_msgSend(v96, "constraintEqualToAnchor:");
    v128 = objc_claimAutoreleasedReturnValue();
    v232[28] = v128;
    -[UIView bottomAnchor](v224, "bottomAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v8, "bottomAnchor");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = v97;
    objc_msgSend(v97, "constraintEqualToAnchor:");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v232[29] = v137;
    -[UIView heightAnchor](v224, "heightAnchor");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView heightAnchor](v8, "heightAnchor");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "constraintEqualToAnchor:multiplier:", 0.3);
    v98 = objc_claimAutoreleasedReturnValue();
    v232[30] = v98;
    -[UIProgressView leadingAnchor](v216, "leadingAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView leadingAnchor](v8, "leadingAnchor");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = v99;
    objc_msgSend(v99, "constraintEqualToAnchor:constant:", 8.0);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v232[31] = v133;
    -[UIProgressView trailingAnchor](v216, "trailingAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v8, "trailingAnchor");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = v100;
    objc_msgSend(v100, "constraintEqualToAnchor:constant:", -8.0);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v232[32] = v101;
    -[UIProgressView bottomAnchor](v216, "bottomAnchor");
    v76 = v216;
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v222, "bottomAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "constraintEqualToAnchor:constant:", v103, -8.0);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v232[33] = v104;
    -[UIProgressView heightAnchor](v216, "heightAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "constraintEqualToConstant:", 2.0);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v232[34] = v106;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v232, 35);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVRUIUpNextViewControllerCell setStandardLayoutConstraints:](v227, "setStandardLayoutConstraints:", v107);

    v74 = v221;
    v68 = (void *)v130;

    v77 = (void *)v98;
    v69 = (void *)v129;

    v33 = v219;
    v75 = v127;
    v70 = (void *)v128;
  }

  v108 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.25, 1.0);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setBackgroundColor:", v109);

  -[_TVRUIUpNextViewControllerCell setSelectedBackgroundView:](v227, "setSelectedBackgroundView:", v108);
  imageView = v227->_imageView;
  v227->_imageView = v222;
  v223 = v222;

  attributionMaskImageView = v227->_attributionMaskImageView;
  v227->_attributionMaskImageView = v218;
  v220 = v218;

  titleLabel = v227->_titleLabel;
  v227->_titleLabel = v74;
  v113 = v74;

  secondaryLabel = v227->_secondaryLabel;
  v227->_secondaryLabel = v33;
  v115 = v33;

  separatorView = v227->_separatorView;
  v227->_separatorView = v225;
  v117 = v225;

  actionButton = v227->_actionButton;
  v227->_actionButton = v226;
  v119 = v226;

  playbackProgressView = v227->_playbackProgressView;
  v227->_playbackProgressView = v76;
  v121 = v76;

  gradientView = v227->_gradientView;
  v227->_gradientView = v224;
  v123 = v224;

  gradientLayer = v227->_gradientLayer;
  v227->_gradientLayer = v217;

  -[_TVRUIUpNextViewControllerCell setOverrideUserInterfaceStyle:](v227, "setOverrideUserInterfaceStyle:", 2);
  -[_TVRUIUpNextViewControllerCell _updateLayoutConstraintsForCurrentSizeCategory](v227, "_updateLayoutConstraintsForCurrentSizeCategory");
  -[_TVRUIUpNextViewControllerCell contentView](v227, "contentView");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "setNeedsLayout");

  -[_TVRUIUpNextViewControllerCell contentView](v227, "contentView");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "layoutIfNeeded");

}

- (void)_updateLayoutConstraintsForCurrentSizeCategory
{
  -[_TVRUIUpNextViewControllerCell _updateLayoutConstraintsForStackedLayout:](self, "_updateLayoutConstraintsForStackedLayout:", objc_msgSend((id)objc_opt_class(), "isStackedLayout"));
}

- (void)_updateLayoutConstraintsForStackedLayout:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDD1628];
  if (a3)
  {
    -[_TVRUIUpNextViewControllerCell stackedLayoutConstraints](self, "stackedLayoutConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activateConstraints:", v5);

    v6 = (void *)MEMORY[0x24BDD1628];
    -[_TVRUIUpNextViewControllerCell standardLayoutConstraints](self, "standardLayoutConstraints");
  }
  else
  {
    -[_TVRUIUpNextViewControllerCell standardLayoutConstraints](self, "standardLayoutConstraints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activateConstraints:", v7);

    v6 = (void *)MEMORY[0x24BDD1628];
    -[_TVRUIUpNextViewControllerCell stackedLayoutConstraints](self, "stackedLayoutConstraints");
  }
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deactivateConstraints:");

}

- (void)_updateSeparatorVisibility
{
  uint64_t v3;
  id v4;

  v3 = -[_TVRUIUpNextViewControllerCell showsSeparator](self, "showsSeparator") ^ 1;
  -[_TVRUIUpNextViewControllerCell separatorView](self, "separatorView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (id)_actionButton
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

  v3 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:variant:", *MEMORY[0x24BEBE1D8], 1024);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationWithFont:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BEBD388];
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("ellipsis"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", &stru_24DE30718, v7, 0, &__block_literal_global_6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD438], "plainButtonConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithConfiguration:primaryAction:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTintColor:", v11);

  objc_msgSend(v10, "setOverrideUserInterfaceStyle:", 2);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_actionButtonTapped_);
  objc_msgSend(v10, "addGestureRecognizer:", v12);
  -[_TVRUIUpNextViewControllerCell _actionButtonMenu](self, "_actionButtonMenu");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMenu:", v13);
  objc_msgSend(v10, "setShowsMenuAsPrimaryAction:", 1);

  return v10;
}

- (void)actionButtonTapped:(id)a3
{
  id v3;

  -[_TVRUIUpNextViewControllerCell actionButton](self, "actionButton", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendActionsForControlEvents:", 0x2000);

}

- (id)_actionButtonMenu
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
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  void (**v46)(_QWORD, _QWORD, _QWORD);
  void *v47;
  id v48;
  void *v49;
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
  _QWORD v61[5];
  id v62;
  _QWORD aBlock[5];
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[4];
  id v85;
  _QWORD v86[4];
  id v87;
  _QWORD v88[4];
  id v89;
  id location;
  _QWORD v91[4];

  v91[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("arrow.up.right.square"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("square.and.arrow.up"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x24BEBD388];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TVRUIGotoEpisode"), &stru_24DE30718, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = MEMORY[0x24BDAC760];
  v88[1] = 3221225472;
  v88[2] = __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke;
  v88[3] = &unk_24DE2C440;
  objc_copyWeak(&v89, &location);
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v5, v60, 0, v88);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BEBD388];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TVRUIGotoShow"), &stru_24DE30718, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = MEMORY[0x24BDAC760];
  v86[1] = 3221225472;
  v86[2] = __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_2;
  v86[3] = &unk_24DE2C440;
  objc_copyWeak(&v87, &location);
  objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v8, v60, 0, v86);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BEBD388];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("TVRUIGotoMovie"), &stru_24DE30718, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = MEMORY[0x24BDAC760];
  v84[1] = 3221225472;
  v84[2] = __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_3;
  v84[3] = &unk_24DE2C440;
  objc_copyWeak(&v85, &location);
  objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v11, v60, 0, v84);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BEBD388];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("TVRUIGotoSportingEvent"), &stru_24DE30718, CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = MEMORY[0x24BDAC760];
  v82[1] = 3221225472;
  v82[2] = __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_4;
  v82[3] = &unk_24DE2C440;
  objc_copyWeak(&v83, &location);
  objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v14, v60, 0, v82);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BEBD388];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("TVRUIShareEpisode"), &stru_24DE30718, CFSTR("Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = MEMORY[0x24BDAC760];
  v80[1] = 3221225472;
  v80[2] = __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_5;
  v80[3] = &unk_24DE2C440;
  objc_copyWeak(&v81, &location);
  objc_msgSend(v15, "actionWithTitle:image:identifier:handler:", v17, v59, 0, v80);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BEBD388];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("TVRUIShareShow"), &stru_24DE30718, CFSTR("Localizable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = MEMORY[0x24BDAC760];
  v78[1] = 3221225472;
  v78[2] = __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_6;
  v78[3] = &unk_24DE2C440;
  objc_copyWeak(&v79, &location);
  objc_msgSend(v18, "actionWithTitle:image:identifier:handler:", v20, v59, 0, v78);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x24BEBD388];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("TVRUIShareMovie"), &stru_24DE30718, CFSTR("Localizable"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = MEMORY[0x24BDAC760];
  v76[1] = 3221225472;
  v76[2] = __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_7;
  v76[3] = &unk_24DE2C440;
  objc_copyWeak(&v77, &location);
  objc_msgSend(v21, "actionWithTitle:image:identifier:handler:", v23, v59, 0, v76);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x24BEBD388];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("TVRUIShareSportingEvent"), &stru_24DE30718, CFSTR("Localizable"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = MEMORY[0x24BDAC760];
  v74[1] = 3221225472;
  v74[2] = __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_8;
  v74[3] = &unk_24DE2C440;
  objc_copyWeak(&v75, &location);
  objc_msgSend(v24, "actionWithTitle:image:identifier:handler:", v26, v59, 0, v74);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x24BEBD388];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("RemoveFromUpNext"), &stru_24DE30718, CFSTR("Localizable"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("minus.circle"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = MEMORY[0x24BDAC760];
  v72[1] = 3221225472;
  v72[2] = __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_9;
  v72[3] = &unk_24DE2C440;
  objc_copyWeak(&v73, &location);
  objc_msgSend(v27, "actionWithTitle:image:identifier:handler:", v29, v30, 0, v72);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = (void *)MEMORY[0x24BEBD388];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("MarkAsWatched"), &stru_24DE30718, CFSTR("Localizable"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("rectangle.badge.checkmark"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = MEMORY[0x24BDAC760];
  v70[1] = 3221225472;
  v70[2] = __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_10;
  v70[3] = &unk_24DE2C440;
  objc_copyWeak(&v71, &location);
  objc_msgSend(v32, "actionWithTitle:image:identifier:handler:", v34, v35, 0, v70);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)MEMORY[0x24BEBD748];
  v91[0] = v31;
  v91[1] = v36;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v91, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "menuWithTitle:image:identifier:options:children:", &stru_24DE30718, 0, 0, 1, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVRUIUpNextViewControllerCell upNextInfo](self, "upNextInfo");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "mediaInfo");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "kind");

  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy_;
  v68 = __Block_byref_object_dispose_;
  v69 = (id)MEMORY[0x24BDBD1A8];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_359;
  aBlock[3] = &unk_24DE2CA48;
  aBlock[4] = &v64;
  v43 = _Block_copy(aBlock);
  v61[0] = MEMORY[0x24BDAC760];
  v61[1] = 3221225472;
  v61[2] = __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_2_361;
  v61[3] = &unk_24DE2CA70;
  v61[4] = self;
  v44 = v43;
  v62 = v44;
  v45 = _Block_copy(v61);
  v46 = (void (**)(_QWORD, _QWORD, _QWORD))v45;
  switch(v42)
  {
    case 1:
      (*((void (**)(void *, uint64_t, void *))v45 + 2))(v45, 3, v58);
      ((void (**)(_QWORD, uint64_t, void *))v46)[2](v46, 2, v57);
      ((void (**)(_QWORD, uint64_t, void *))v46)[2](v46, 3, v54);
      ((void (**)(_QWORD, uint64_t, void *))v46)[2](v46, 2, v53);
      break;
    case 5:
      (*((void (**)(void *, uint64_t, void *))v45 + 2))(v45, 1, v55);
      ((void (**)(_QWORD, uint64_t, void *))v46)[2](v46, 1, v51);
      break;
    case 2:
      (*((void (**)(void *, uint64_t, void *))v45 + 2))(v45, 1, v56);
      ((void (**)(_QWORD, uint64_t, void *))v46)[2](v46, 1, v52);
      break;
    default:
      (*((void (**)(id, void *))v44 + 2))(v44, v31);
      v47 = v36;
      goto LABEL_9;
  }
  v47 = v39;
LABEL_9:
  (*((void (**)(id, void *))v44 + 2))(v44, v47);
  v48 = (id)v65[5];

  _Block_object_dispose(&v64, 8);
  objc_msgSend(MEMORY[0x24BEBD748], "menuWithChildren:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v71);
  objc_destroyWeak(&v73);

  objc_destroyWeak(&v75);
  objc_destroyWeak(&v77);

  objc_destroyWeak(&v79);
  objc_destroyWeak(&v81);

  objc_destroyWeak(&v83);
  objc_destroyWeak(&v85);

  objc_destroyWeak(&v87);
  objc_destroyWeak(&v89);
  objc_destroyWeak(&location);

  return v49;
}

- (void)_updateForUpNextInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _BYTE location[12];
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "mediaInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVRUIUpNextViewControllerCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  -[_TVRUIUpNextViewControllerCell _secondaryTextForUpNextInfo:](self, "_secondaryTextForUpNextInfo:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVRUIUpNextViewControllerCell secondaryLabel](self, "secondaryLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  LODWORD(v8) = objc_msgSend(v4, "tvruiupnextvc_hasPercentComplete");
  -[_TVRUIUpNextViewControllerCell playbackProgressView](self, "playbackProgressView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v8 ^ 1);

  if ((_DWORD)v8)
  {
    objc_msgSend(v4, "tvruiupnextvc_percentComplete");
    v12 = v11;
    -[_TVRUIUpNextViewControllerCell playbackProgressView](self, "playbackProgressView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v14 = v12;
    objc_msgSend(v13, "setProgress:", v14);

  }
  v15 = objc_msgSend(v4, "artworkNeedsCornerBlur");
  -[_TVRUIUpNextViewControllerCell attributionMaskImageView](self, "attributionMaskImageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", v15 ^ 1u);

  -[_TVRUIUpNextViewControllerCell _actionButtonMenu](self, "_actionButtonMenu");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVRUIUpNextViewControllerCell actionButton](self, "actionButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setMenu:", v17);

  objc_msgSend(v5, "imageURLTemplate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "length"))
  {
    objc_initWeak((id *)location, self);
    -[_TVRUIUpNextViewControllerCell delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __55___TVRUIUpNextViewControllerCell__updateForUpNextInfo___block_invoke;
    v24[3] = &unk_24DE2CA98;
    objc_copyWeak(&v25, (id *)location);
    objc_msgSend(v20, "requestImageForInfo:completion:", v4, v24);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)location);
  }
  else
  {
    _TVRUINowPlayingLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 134218242;
      *(_QWORD *)&location[4] = self;
      v27 = 2112;
      v28 = v22;
      _os_log_impl(&dword_21B042000, v21, OS_LOG_TYPE_INFO, "UpNext cell %p for %@ has no imageURLTemplare, blanking image...", location, 0x16u);

    }
    -[_TVRUIUpNextViewControllerCell imageView](self, "imageView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setImage:", 0);

  }
}

- (id)_secondaryTextForUpNextInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  float v17;
  float v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "mediaInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __62___TVRUIUpNextViewControllerCell__secondaryTextForUpNextInfo___block_invoke((uint64_t)v6, &stru_24DE30718, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "kind") == 1)
    {
      objc_msgSend(v5, "seasonNumber");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        objc_msgSend(v5, "episodeNumber");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "seasonNumber");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "episodeNumber");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", CFSTR(" S%@, E%@"), v12, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          __62___TVRUIUpNextViewControllerCell__secondaryTextForUpNextInfo___block_invoke((uint64_t)v14, v7, v14);
          v15 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v15;
        }
      }
    }
    objc_msgSend(v4, "timeRemaining");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatValue");
    v18 = v17;

    if (v18 > 0.0)
    {
      +[TVRUIDateUtilities localizedPlaybackTimeForInterval:](TVRUIDateUtilities, "localizedPlaybackTimeForInterval:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length");
      if (v20)
      {
        __62___TVRUIUpNextViewControllerCell__secondaryTextForUpNextInfo___block_invoke(v20, v7, v19);
        v21 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v21;
      }

    }
    objc_msgSend(v4, "service");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length");
    if (v23)
    {
      __62___TVRUIUpNextViewControllerCell__secondaryTextForUpNextInfo___block_invoke(v23, v7, v22);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v4, "isAppleOriginal"))
      {
LABEL_16:

        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("AppleTVOriginal"), &stru_24DE30718, CFSTR("Localizable"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      __62___TVRUIUpNextViewControllerCell__secondaryTextForUpNextInfo___block_invoke((uint64_t)v26, v7, v26);
      v24 = objc_claimAutoreleasedReturnValue();

      v7 = v25;
    }

    v7 = (void *)v24;
    goto LABEL_16;
  }
  v7 = 0;
LABEL_17:

  return v7;
}

- (BOOL)hasURLForProductPageKind:(int64_t)a3
{
  void *v3;
  BOOL v4;

  -[_TVRUIUpNextViewControllerCell urlForProductPageKind:](self, "urlForProductPageKind:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)openProductPageForKind:(int64_t)a3
{
  void *v4;
  void *v5;

  -[_TVRUIUpNextViewControllerCell urlForProductPageKind:](self, "urlForProductPageKind:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[_TVRUIUpNextViewControllerCell openURL:](self, "openURL:", v4);
    v4 = v5;
  }

}

- (id)urlForProductPageKind:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  -[_TVRUIUpNextViewControllerCell upNextInfo](self, "upNextInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shareURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVRUIUpNextViewControllerCell upNextInfo](self, "upNextInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6)
  {
    objc_msgSend(v7, "mediaInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (a3 == 1 || a3 == 3)
      {
        objc_msgSend(v10, "productURL");
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      if (a3 == 2)
      {
        objc_msgSend(v10, "showURL");
        v11 = objc_claimAutoreleasedReturnValue();
LABEL_16:
        v12 = (void *)v11;
        goto LABEL_17;
      }
    }
    v12 = 0;
LABEL_17:
    v8 = v10;
    goto LABEL_18;
  }
  if (a3 == 1 || a3 == 3)
  {
    objc_msgSend(v7, "shareURL");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 != 2)
    {
      v12 = 0;
      goto LABEL_18;
    }
    objc_msgSend(v7, "shareShowURL");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v9;
LABEL_18:

  return v12;
}

- (void)openURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_TVRUIUpNextViewControllerCell delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openURL:", v4);

}

- (BOOL)showsSeparator
{
  return self->_showsSeparator;
}

- (TVRCUpNextInfo)upNextInfo
{
  return self->_upNextInfo;
}

- (_TVRUIUpNextViewControllerActionDelegate)delegate
{
  return (_TVRUIUpNextViewControllerActionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIImageView)attributionMaskImageView
{
  return self->_attributionMaskImageView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (UIProgressView)playbackProgressView
{
  return self->_playbackProgressView;
}

- (UIView)gradientView
{
  return self->_gradientView;
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (NSArray)standardLayoutConstraints
{
  return self->_standardLayoutConstraints;
}

- (void)setStandardLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_standardLayoutConstraints, a3);
}

- (NSArray)stackedLayoutConstraints
{
  return self->_stackedLayoutConstraints;
}

- (void)setStackedLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_stackedLayoutConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackedLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_standardLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_playbackProgressView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_attributionMaskImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_upNextInfo, 0);
}

@end
