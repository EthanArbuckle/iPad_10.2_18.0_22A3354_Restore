@implementation OBPrivacyLinkButton

- (OBPrivacyLinkButton)initWithCaption:(id)a3 buttonText:(id)a4 image:(id)a5 imageSize:(CGSize)a6 useLargeIcon:(BOOL)a7 displayLanguage:(id)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  OBPrivacyLinkButton *v18;
  OBPrivacyLinkButton *v19;
  double v20;
  double v21;
  void *v22;
  UIView *v23;
  UIView *containerView;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  double v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t j;
  void *v64;
  UITextView *v65;
  UITextView *textView;
  UITextView *v67;
  void *v68;
  UITextView *v69;
  void *v70;
  void *v71;
  UITextView *v72;
  void *v73;
  id v74;
  uint64_t v75;
  UILabel *buttonLabel;
  void *v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  OBTintInheritingImageView *v88;
  void *v89;
  uint64_t v90;
  UIImageView *iconView;
  void *v92;
  id v93;
  void *v94;
  UIImageView *v95;
  UIImageView *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  double v101;
  double v102;
  void *v103;
  double v104;
  void *v105;
  void *v106;
  void *v107;
  double v108;
  double v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  double v118;
  void *v119;
  double v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  double v128;
  void *v129;
  uint64_t v130;
  double v131;
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
  double v142;
  void *v143;
  void *v144;
  void *v145;
  UILabel *v146;
  void *v147;
  _QWORD *v148;
  uint64_t v149;
  void *v150;
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
  id v203;
  id v204;
  id v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  UIImageView *v211;
  _BOOL4 v212;
  id v213;
  void *v214;
  void *v215;
  void *v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  objc_super v225;
  _QWORD v226[2];
  _QWORD v227[3];
  _QWORD v228[6];
  _QWORD v229[8];
  _QWORD v230[5];
  _QWORD v231[2];
  _QWORD v232[2];
  _BYTE v233[128];
  _QWORD v234[2];
  _BYTE v235[128];
  _QWORD v236[4];
  _QWORD v237[8];

  v9 = a7;
  v237[6] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v225.receiver = self;
  v225.super_class = (Class)OBPrivacyLinkButton;
  v18 = -[OBPrivacyLinkButton init](&v225, sel_init);
  v19 = v18;
  if (v18)
  {
    if (v9)
      v20 = 24.0;
    else
      v20 = 15.0;
    if (v9)
      v21 = 16.0;
    else
      v21 = 6.0;
    -[OBPrivacyLinkButton setIsAccessibilityElement:](v18, "setIsAccessibilityElement:", 0);
    v19->_largeIcon = v9;
    objc_storeStrong((id *)&v19->_captionText, a3);
    if (v14)
    {
      objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = v15;
    }
    v212 = v9;
    v203 = v17;
    v204 = v15;
    v213 = v16;
    objc_storeStrong((id *)&v19->_buttonText, v22);
    v205 = v14;
    if (v14)

    objc_storeStrong((id *)&v19->_displayLanguage, a8);
    v23 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    containerView = v19->_containerView;
    v19->_containerView = v23;

    -[UIView setIsAccessibilityElement:](v19->_containerView, "setIsAccessibilityElement:", 0);
    -[UIView setUserInteractionEnabled:](v19->_containerView, "setUserInteractionEnabled:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v19->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[OBPrivacyLinkButton addSubview:](v19, "addSubview:", v19->_containerView);
    v187 = (void *)MEMORY[0x1E0CB3718];
    -[UIView centerXAnchor](v19->_containerView, "centerXAnchor");
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyLinkButton centerXAnchor](v19, "centerXAnchor");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v215, "constraintEqualToAnchor:", v214);
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    v237[0] = v208;
    -[UIView centerYAnchor](v19->_containerView, "centerYAnchor");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyLinkButton centerYAnchor](v19, "centerYAnchor");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v206, "constraintEqualToAnchor:", v199);
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    v237[1] = v195;
    -[UIView bottomAnchor](v19->_containerView, "bottomAnchor");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyLinkButton bottomAnchor](v19, "bottomAnchor");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "constraintLessThanOrEqualToAnchor:", v183);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    v237[2] = v179;
    -[UIView topAnchor](v19->_containerView, "topAnchor");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyLinkButton topAnchor](v19, "topAnchor");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "constraintGreaterThanOrEqualToAnchor:", v171);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v237[3] = v25;
    -[UIView leftAnchor](v19->_containerView, "leftAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyLinkButton leftAnchor](v19, "leftAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintGreaterThanOrEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v237[4] = v28;
    -[UIView rightAnchor](v19->_containerView, "rightAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyLinkButton rightAnchor](v19, "rightAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintLessThanOrEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v237[5] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v237, 6);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "activateConstraints:", v32);

    LODWORD(v33) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](v19->_containerView, "setContentHuggingPriority:forAxis:", 0, v33);
    LODWORD(v34) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](v19->_containerView, "setContentHuggingPriority:forAxis:", 1, v34);
    -[UIView bottomAnchor](v19->_containerView, "bottomAnchor");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyLinkButton bottomAnchor](v19, "bottomAnchor");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v216, "constraintEqualToAnchor:", v209);
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    v236[0] = v207;
    -[UIView topAnchor](v19->_containerView, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyLinkButton topAnchor](v19, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v236[1] = v37;
    -[UIView leftAnchor](v19->_containerView, "leftAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyLinkButton leftAnchor](v19, "leftAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v236[2] = v40;
    -[UIView rightAnchor](v19->_containerView, "rightAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyLinkButton rightAnchor](v19, "rightAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v236[3] = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v236, 4);
    v200 = (void *)objc_claimAutoreleasedReturnValue();

    v223 = 0u;
    v224 = 0u;
    v221 = 0u;
    v222 = 0u;
    v44 = v200;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v221, v235, 16);
    if (v45)
    {
      v47 = v45;
      v48 = *(_QWORD *)v222;
      do
      {
        for (i = 0; i != v47; ++i)
        {
          if (*(_QWORD *)v222 != v48)
            objc_enumerationMutation(v44);
          v50 = *(void **)(*((_QWORD *)&v221 + 1) + 8 * i);
          LODWORD(v46) = 1144750080;
          objc_msgSend(v50, "setPriority:", v46);
          objc_msgSend(v50, "setActive:", 1);
        }
        v47 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v221, v235, 16);
      }
      while (v47);
    }

    -[UIView topAnchor](v19->_containerView, "topAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyLinkButton topAnchor](v19, "topAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v234[0] = v53;
    -[UIView bottomAnchor](v19->_containerView, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyLinkButton bottomAnchor](v19, "bottomAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v234[1] = v56;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v234, 2);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    v219 = 0u;
    v220 = 0u;
    v217 = 0u;
    v218 = 0u;
    v58 = v57;
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v217, v233, 16);
    if (v59)
    {
      v61 = v59;
      v62 = *(_QWORD *)v218;
      do
      {
        for (j = 0; j != v61; ++j)
        {
          if (*(_QWORD *)v218 != v62)
            objc_enumerationMutation(v58);
          v64 = *(void **)(*((_QWORD *)&v217 + 1) + 8 * j);
          LODWORD(v60) = 1144750080;
          objc_msgSend(v64, "setPriority:", v60);
          objc_msgSend(v64, "setActive:", 1);
        }
        v61 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v217, v233, 16);
      }
      while (v61);
    }

    v65 = (UITextView *)objc_alloc_init(MEMORY[0x1E0DC3E50]);
    textView = v19->_textView;
    v19->_textView = v65;

    v67 = v19->_textView;
    -[OBPrivacyLinkButton labelText](v19, "labelText");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setAttributedText:](v67, "setAttributedText:", v68);

    v69 = v19->_textView;
    -[OBPrivacyLinkButton _font](v19, "_font");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v69, "setFont:", v70);

    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v19->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextView setTextAlignment:](v19->_textView, "setTextAlignment:", 1);
    -[UITextView setTextContainerInset:](v19->_textView, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[UITextView textContainer](v19->_textView, "textContainer");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setLineFragmentPadding:", 0.0);

    -[UITextView setEditable:](v19->_textView, "setEditable:", 0);
    -[UITextView setSelectable:](v19->_textView, "setSelectable:", 0);
    -[UITextView setScrollEnabled:](v19->_textView, "setScrollEnabled:", 0);
    -[UITextView setUserInteractionEnabled:](v19->_textView, "setUserInteractionEnabled:", 0);
    v72 = v19->_textView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v72, "setBackgroundColor:", v73);

    -[UIView addSubview:](v19->_containerView, "addSubview:", v19->_textView);
    if (-[OBPrivacyLinkButton _isButtonAboveCaptionText](v19, "_isButtonAboveCaptionText"))
    {
      v74 = objc_alloc(MEMORY[0x1E0DC3990]);
      v75 = objc_msgSend(v74, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      buttonLabel = v19->_buttonLabel;
      v19->_buttonLabel = (UILabel *)v75;

      -[OBPrivacyLinkButton _font](v19, "_font");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v19->_buttonLabel, "setFont:", v77);

      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v19->_buttonLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UILabel setUserInteractionEnabled:](v19->_buttonLabel, "setUserInteractionEnabled:", 0);
      -[UILabel setLineBreakMode:](v19->_buttonLabel, "setLineBreakMode:", 0);
      -[UILabel setText:](v19->_buttonLabel, "setText:", v19->_buttonText);
      -[UILabel setNumberOfLines:](v19->_buttonLabel, "setNumberOfLines:", 0);
      LODWORD(v78) = 1148846080;
      -[UILabel setContentCompressionResistancePriority:forAxis:](v19->_buttonLabel, "setContentCompressionResistancePriority:forAxis:", 0, v78);
      LODWORD(v79) = 1148846080;
      -[UILabel setContentCompressionResistancePriority:forAxis:](v19->_buttonLabel, "setContentCompressionResistancePriority:forAxis:", 1, v79);
    }
    -[OBPrivacyLinkButton tintColor](v19, "tintColor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyLinkButton _updateButtonColorWithColor:](v19, "_updateButtonColorWithColor:", v80);

    v210 = (void *)MEMORY[0x1E0CB3718];
    -[UITextView bottomAnchor](v19->_textView, "bottomAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v19->_containerView, "bottomAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v232[0] = v83;
    -[UITextView trailingAnchor](v19->_textView, "trailingAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v19->_containerView, "trailingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintLessThanOrEqualToAnchor:", v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v232[1] = v86;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v232, 2);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v210, "activateConstraints:", v87);

    v88 = [OBTintInheritingImageView alloc];
    -[OBPrivacyLinkButton tintColor](v19, "tintColor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = -[OBTintInheritingImageView initWithImage:highlightedImage:tintColor:](v88, "initWithImage:highlightedImage:tintColor:", v213, 0, v89);
    iconView = v19->_iconView;
    v19->_iconView = (UIImageView *)v90;

    -[UIImageView setContentMode:](v19->_iconView, "setContentMode:", 1);
    -[OBPrivacyLinkButton _iconTintColor](v19, "_iconTintColor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v19->_iconView, "setTintColor:", v92);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v19->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (v19->_buttonLabel)
    {
      v93 = objc_alloc(MEMORY[0x1E0DC3CA8]);
      v231[0] = v19->_iconView;
      v231[1] = v19->_buttonLabel;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v231, 2);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = (UIImageView *)objc_msgSend(v93, "initWithArrangedSubviews:", v94);

      -[UIImageView setAxis:](v95, "setAxis:", 0);
      -[UIImageView setSpacing:](v95, "setSpacing:", v21);
      -[UIImageView setAlignment:](v95, "setAlignment:", 3);
      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v95, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v211 = v95;
    }
    else
    {
      v211 = 0;
      v95 = v19->_iconView;
    }
    -[UIView addSubview:](v19->_containerView, "addSubview:", v95);
    v96 = v19->_iconView;
    if (v213)
    {
      -[UIImageView heightAnchor](v96, "heightAnchor");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "constraintEqualToConstant:", v20);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "setActive:", 1);

      -[UIImageView widthAnchor](v19->_iconView, "widthAnchor");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView image](v19->_iconView, "image");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "size");
      v102 = v20 * v101;
      -[UIImageView image](v19->_iconView, "image");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "size");
      objc_msgSend(v99, "constraintEqualToConstant:", v102 / v104);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "setActive:", 1);

    }
    else
    {
      -[UIImageView widthAnchor](v96, "widthAnchor");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "constraintEqualToConstant:", 0.0);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "setActive:", 1);

      -[UIImageView heightAnchor](v19->_iconView, "heightAnchor");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "constraintEqualToConstant:", 0.0);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "setActive:", 1);
    }

    LODWORD(v108) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v19->_iconView, "setContentHuggingPriority:forAxis:", 1, v108);
    LODWORD(v109) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v19->_iconView, "setContentHuggingPriority:forAxis:", 0, v109);
    if (v212)
    {
      v176 = (void *)MEMORY[0x1E0CB3718];
      -[UIImageView topAnchor](v19->_iconView, "topAnchor");
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](v19->_containerView, "topAnchor");
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v201, "constraintEqualToAnchor:", v196);
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      v230[0] = v192;
      -[UIImageView centerXAnchor](v19->_iconView, "centerXAnchor");
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView centerXAnchor](v19->_containerView, "centerXAnchor");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v188, "constraintEqualToAnchor:", v184);
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      v230[1] = v180;
      -[UIImageView bottomAnchor](v19->_iconView, "bottomAnchor");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView topAnchor](v19->_textView, "topAnchor");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v172, "constraintLessThanOrEqualToAnchor:", v168);
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      v230[2] = v166;
      -[UITextView leadingAnchor](v19->_textView, "leadingAnchor");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](v19->_containerView, "leadingAnchor");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v163, "constraintGreaterThanOrEqualToAnchor:", v110);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v230[3] = v111;
      -[UITextView centerXAnchor](v19->_textView, "centerXAnchor");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView centerXAnchor](v19->_iconView, "centerXAnchor");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "constraintEqualToAnchor:", v113);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v230[4] = v114;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v230, 5);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v176, "activateConstraints:", v115);

      -[UIImageView bottomAnchor](v19->_iconView, "bottomAnchor");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView firstBaselineAnchor](v19->_textView, "firstBaselineAnchor");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v213;
      v118 = -16.0;
      if (!v213)
        v118 = 0.0;
      objc_msgSend(v116, "constraintEqualToAnchor:constant:", v117, v118);
      v119 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v120) = 1144750080;
      objc_msgSend(v119, "setPriority:", v120);
      objc_msgSend(v119, "setActive:", 1);

    }
    else
    {
      v202 = (void *)MEMORY[0x1E0CB3718];
      if (v19->_buttonLabel)
      {
        -[UIImageView topAnchor](v211, "topAnchor");
        v197 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView topAnchor](v19->_containerView, "topAnchor");
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v197, "constraintEqualToAnchor:", v193);
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        v229[0] = v189;
        -[UIImageView leadingAnchor](v211, "leadingAnchor");
        v185 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView leadingAnchor](v19->_containerView, "leadingAnchor");
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v185, "constraintGreaterThanOrEqualToAnchor:", v181);
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        v229[1] = v177;
        -[UIImageView trailingAnchor](v211, "trailingAnchor");
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView trailingAnchor](v19->_containerView, "trailingAnchor");
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v173, "constraintLessThanOrEqualToAnchor:", v169);
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        v229[2] = v167;
        -[UIImageView centerXAnchor](v211, "centerXAnchor");
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView centerXAnchor](v19->_containerView, "centerXAnchor");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v164, "constraintEqualToAnchor:", v161);
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        v229[3] = v159;
        -[UIImageView bottomAnchor](v211, "bottomAnchor");
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextView topAnchor](v19->_textView, "topAnchor");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v157, "constraintEqualToAnchor:", v156);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        v229[4] = v155;
        -[UITextView bottomAnchor](v19->_textView, "bottomAnchor");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView bottomAnchor](v19->_containerView, "bottomAnchor");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "constraintEqualToAnchor:", v153);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        v229[5] = v152;
        -[UITextView leadingAnchor](v19->_textView, "leadingAnchor");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView leadingAnchor](v19->_containerView, "leadingAnchor");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "constraintEqualToAnchor:", v122);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v229[6] = v123;
        -[UITextView trailingAnchor](v19->_textView, "trailingAnchor");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView trailingAnchor](v19->_containerView, "trailingAnchor");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "constraintEqualToAnchor:", v125);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v229[7] = v126;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v229, 8);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v202, "activateConstraints:", v127);

      }
      else
      {
        -[UIImageView leadingAnchor](v19->_iconView, "leadingAnchor");
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView leadingAnchor](v19->_containerView, "leadingAnchor");
        v194 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v198, "constraintEqualToAnchor:", v194);
        v190 = (void *)objc_claimAutoreleasedReturnValue();
        v228[0] = v190;
        -[UIImageView trailingAnchor](v19->_iconView, "trailingAnchor");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        v186 = v129;
        -[UITextView leadingAnchor](v19->_textView, "leadingAnchor");
        v130 = objc_claimAutoreleasedReturnValue();
        v182 = (void *)v130;
        v131 = -6.0;
        if (!v213)
          v131 = 0.0;
        objc_msgSend(v129, "constraintEqualToAnchor:constant:", v130, v131);
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        v228[1] = v178;
        -[UIImageView centerYAnchor](v19->_iconView, "centerYAnchor");
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextView centerYAnchor](v19->_textView, "centerYAnchor");
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v174, "constraintEqualToAnchor:", v170);
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        v228[2] = v165;
        -[UITextView centerYAnchor](v19->_textView, "centerYAnchor");
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView centerYAnchor](v19->_containerView, "centerYAnchor");
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v162, "constraintEqualToAnchor:", v160);
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        v228[3] = v158;
        -[UITextView topAnchor](v19->_textView, "topAnchor");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView topAnchor](v19->_containerView, "topAnchor");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "constraintGreaterThanOrEqualToAnchor:", v133);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        v228[4] = v134;
        -[UITextView bottomAnchor](v19->_textView, "bottomAnchor");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView bottomAnchor](v19->_containerView, "bottomAnchor");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "constraintLessThanOrEqualToAnchor:", v136);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        v228[5] = v137;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v228, 6);
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v202, "activateConstraints:", v138);

        if (!-[NSString length](v19->_captionText, "length"))
        {
          -[UITextView trailingAnchor](v19->_textView, "trailingAnchor");
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView trailingAnchor](v19->_containerView, "trailingAnchor");
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v139, "constraintEqualToAnchor:", v140);
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v141, "setActive:", 1);

          LODWORD(v142) = 1148846080;
          -[UITextView setContentHuggingPriority:forAxis:](v19->_textView, "setContentHuggingPriority:forAxis:", 0, v142);
        }
      }
      LODWORD(v128) = 1148846080;
      -[UITextView setContentHuggingPriority:forAxis:](v19->_textView, "setContentHuggingPriority:forAxis:", 1, v128);
      v16 = v213;
    }
    v17 = v203;
    if (!v16)
    {
      -[UITextView centerXAnchor](v19->_textView, "centerXAnchor");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView centerXAnchor](v19->_containerView, "centerXAnchor");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "constraintEqualToAnchor:", v144);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "setActive:", 1);

    }
    v146 = v19->_buttonLabel;
    if (v146)
    {
      v227[0] = v19->_iconView;
      v227[1] = v146;
      v227[2] = v19->_textView;
      v147 = (void *)MEMORY[0x1E0C99D20];
      v148 = v227;
      v149 = 3;
    }
    else
    {
      v226[0] = v19->_iconView;
      v226[1] = v19->_textView;
      v147 = (void *)MEMORY[0x1E0C99D20];
      v148 = v226;
      v149 = 2;
    }
    objc_msgSend(v147, "arrayWithObjects:count:", v148, v149);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyLinkButton setAccessibilityElements:](v19, "setAccessibilityElements:", v150);

    v15 = v204;
    v14 = v205;
  }

  return v19;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  NSString *captionText;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  NSString *v19;
  NSString *buttonText;
  UITextView *textView;
  void *v22;
  UITextView *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  objc_super v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)OBPrivacyLinkButton;
  -[OBPrivacyLinkButton layoutSubviews](&v33, sel_layoutSubviews);
  if (self->_buttonLabel
    && -[NSString length](self->_captionText, "length")
    && -[NSString length](self->_buttonText, "length")
    && -[NSString containsString:](self->_buttonText, "containsString:", CFSTR(" ")))
  {
    v34 = *MEMORY[0x1E0DC1138];
    -[OBPrivacyLinkButton _font](self, "_font");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[UITextView text](self->_textView, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView frame](self->_textView, "frame");
    objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 1, v4, 0, v6, 1.79769313e308);
    v8 = v7;

    captionText = self->_captionText;
    -[UITextView frame](self->_textView, "frame");
    -[NSString boundingRectWithSize:options:attributes:context:](captionText, "boundingRectWithSize:options:attributes:context:", 1, v4, 0, v10, 1.79769313e308);
    v12 = v11;
    -[OBPrivacyLinkButton _font](self, "_font");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lineHeight");
    v15 = v8 / v14;

    -[OBPrivacyLinkButton _font](self, "_font");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lineHeight");
    v18 = v12 / v17;

    if (round(v15 - v18) >= 2.0)
    {
      -[NSString stringByReplacingOccurrencesOfString:withString:](self->_buttonText, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      buttonText = self->_buttonText;
      self->_buttonText = v19;

      textView = self->_textView;
      -[OBPrivacyLinkButton labelText](self, "labelText");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView setAttributedText:](textView, "setAttributedText:", v22);

      v23 = self->_textView;
      -[OBPrivacyLinkButton _font](self, "_font");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView setFont:](v23, "setFont:", v24);

      -[OBPrivacyLinkButton tintColor](self, "tintColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBPrivacyLinkButton _updateButtonColorWithColor:](self, "_updateButtonColorWithColor:", v25);

      -[OBPrivacyLinkButton setNeedsLayout](self, "setNeedsLayout");
    }

  }
  -[OBPrivacyLinkButton contentSize](self, "contentSize");
  v27 = v26;
  v29 = v28;
  -[OBPrivacyLinkButton intrinsicContentSize](self, "intrinsicContentSize");
  if (v27 != v31 || v29 != v30)
  {
    -[OBPrivacyLinkButton intrinsicContentSize](self, "intrinsicContentSize");
    -[OBPrivacyLinkButton setContentSize:](self, "setContentSize:");
    -[OBPrivacyLinkButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OBPrivacyLinkButton;
  -[OBPrivacyLinkButton tintColorDidChange](&v6, sel_tintColorDidChange);
  -[OBPrivacyLinkButton tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[OBPrivacyLinkButton tintColor](self, "tintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyLinkButton _updateButtonColorWithColor:](self, "_updateButtonColorWithColor:", v4);

  }
  -[OBPrivacyLinkButton _iconTintColor](self, "_iconTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_iconView, "setTintColor:", v5);

}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[OBPrivacyLinkButton textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPrivacyLinkButton frame](self, "frame");
  v5 = v4;
  LODWORD(v4) = 1112014848;
  LODWORD(v6) = 1132068864;
  objc_msgSend(v3, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v5, 0.0, v4, v6);
  v8 = v7;

  if (-[OBPrivacyLinkButton largeIcon](self, "largeIcon")
    && (-[UIImageView image](self->_iconView, "image"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    -[OBPrivacyLinkButton frame](self, "frame");
    v11 = v10;
    v8 = v8 + 16.0 + 24.0;
  }
  else
  {
    -[OBPrivacyLinkButton frame](self, "frame");
    v11 = v12;
  }
  v13 = v8;
  result.height = v13;
  result.width = v11;
  return result;
}

- (void)_updateButtonColorWithColor:(id)a3
{
  id v4;
  void *buttonLabel;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v4 = a3;
  buttonLabel = self->_buttonLabel;
  v15 = v4;
  if (buttonLabel || (buttonLabel = self->_textView, !self->_captionText))
  {
    objc_msgSend(buttonLabel, "setTextColor:", v4);
  }
  else
  {
    objc_msgSend(buttonLabel, "attributedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    v8 = *MEMORY[0x1E0DC1140];
    v9 = -[OBPrivacyLinkButton _rangeForButtonText](self, "_rangeForButtonText");
    objc_msgSend(v7, "addAttribute:value:range:", v8, v15, v9, v10);
    v11 = -[OBPrivacyLinkButton underlineLinks](self, "underlineLinks");
    v12 = *MEMORY[0x1E0DC1248];
    v14 = -[OBPrivacyLinkButton _rangeForButtonText](self, "_rangeForButtonText");
    if (v11)
      objc_msgSend(v7, "addAttribute:value:range:", v12, &unk_1E37BC670, v14, v13);
    else
      objc_msgSend(v7, "removeAttribute:range:", v12, v14, v13);
    -[UITextView setAttributedText:](self->_textView, "setAttributedText:", v7);

  }
}

- (id)titleForState:(unint64_t)a3
{
  return -[UITextView text](self->_textView, "text", a3);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)OBPrivacyLinkButton;
  -[OBPrivacyLinkButton setEnabled:](&v6, sel_setEnabled_);
  if (v3)
  {
    -[OBPrivacyLinkButton setTintColor:](self, "setTintColor:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyLinkButton setTintColor:](self, "setTintColor:", v5);

  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  _QWORD v7[6];
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OBPrivacyLinkButton;
  if (-[OBPrivacyLinkButton isHighlighted](&v9, sel_isHighlighted) != a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)OBPrivacyLinkButton;
    -[OBPrivacyLinkButton setHighlighted:](&v8, sel_setHighlighted_, v3);
    v5 = 0.25;
    if (v3)
      v5 = 0.0;
    v6 = 0.3;
    if (!v3)
      v6 = 1.0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__OBPrivacyLinkButton_setHighlighted___block_invoke;
    v7[3] = &unk_1E37AAAF8;
    v7[4] = self;
    *(double *)&v7[5] = v6;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v7, v5);
  }
}

uint64_t __38__OBPrivacyLinkButton_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (id)viewForLastBaselineLayout
{
  return self->_textView;
}

- (_NSRange)_rangeForButtonText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  if (self->_buttonText)
  {
    -[UITextView attributedText](self->_textView, "attributedText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0CB3498];
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("%@"));
    objc_msgSend(v4, "localizedAttributedStringWithFormat:", v5, self->_buttonText);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v3, "length");
    v8 = v7 - objc_msgSend(v6, "length");
    v9 = objc_msgSend(v6, "length");

  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  v10 = v8;
  v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

- (id)_font
{
  void *v3;
  void *v4;
  id *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  -[OBPrivacyLinkButton iconView](self, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

    v5 = (id *)MEMORY[0x1E0DC4AA0];
  }
  else
  {
    -[OBPrivacyLinkButton captionText](self, "captionText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (id *)MEMORY[0x1E0DC4A88];
    if (v6)
      v5 = (id *)MEMORY[0x1E0DC4AA0];
  }
  v7 = (void *)MEMORY[0x1E0DC1350];
  v8 = *v5;
  -[OBPrivacyLinkButton traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredFontForTextStyle:compatibleWithTraitCollection:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)labelText
{
  id v3;
  NSString *captionText;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSString *buttonText;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (self->_captionText)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3498]);
    captionText = self->_captionText;
    v20 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v3, "initWithString:attributes:", captionText, v6);

  }
  else
  {
    v7 = 0;
  }
  if (self->_buttonText && !-[OBPrivacyLinkButton _isButtonAboveCaptionText](self, "_isButtonAboveCaptionText"))
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyLinkButton displayLanguage](self, "displayLanguage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[OBUtilities localizedString:forTable:inBundle:forLanguage:](OBUtilities, "localizedString:forTable:inBundle:forLanguage:", CFSTR("BUTTON_CAPTION_BUTTON_TITLE_FORMAT_STRING"), CFSTR("Localizable"), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v8, "initWithString:", v11);

    v13 = objc_alloc(MEMORY[0x1E0CB3498]);
    buttonText = self->_buttonText;
    -[OBPrivacyLinkButton buttonAttributes](self, "buttonAttributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v13, "initWithString:attributes:", buttonText, v15);

    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3498], "localizedAttributedStringWithFormat:", v12, v7, v16);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = v16;
    }
    v18 = v17;

    v7 = v18;
  }
  return v7;
}

- (id)buttonAttributes
{
  void *v2;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (UIAccessibilityButtonShapesEnabled())
  {
    v4 = *MEMORY[0x1E0DC1248];
    v5[0] = &unk_1E37BC670;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)traitCollectionDidChange:(id)a3
{
  UITextView *textView;
  void *v5;
  UILabel *buttonLabel;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OBPrivacyLinkButton;
  -[OBPrivacyLinkButton traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, a3);
  textView = self->_textView;
  -[OBPrivacyLinkButton _font](self, "_font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](textView, "setFont:", v5);

  buttonLabel = self->_buttonLabel;
  -[OBPrivacyLinkButton _font](self, "_font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](buttonLabel, "setFont:", v7);

}

- (BOOL)_isButtonAboveCaptionText
{
  void *v3;
  NSUInteger v4;

  -[UIImageView image](self->_iconView, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[NSString length](self->_captionText, "length");
  if (v4)
    LOBYTE(v4) = !self->_largeIcon && v3 != 0;
  return v4;
}

- (void)setUnderlineLinks:(BOOL)a3
{
  id v4;

  self->_underlineLinks = a3;
  -[OBPrivacyLinkButton tintColor](self, "tintColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[OBPrivacyLinkButton _updateButtonColorWithColor:](self, "_updateButtonColorWithColor:", v4);

}

- (UIImageView)iconView
{
  return (UIImageView *)objc_getProperty(self, a2, 760, 1);
}

- (UITextView)textView
{
  return (UITextView *)objc_getProperty(self, a2, 768, 1);
}

- (UILabel)buttonLabel
{
  return (UILabel *)objc_getProperty(self, a2, 776, 1);
}

- (UIView)containerView
{
  return (UIView *)objc_getProperty(self, a2, 784, 1);
}

- (NSString)captionText
{
  return (NSString *)objc_getProperty(self, a2, 792, 1);
}

- (NSString)buttonText
{
  return (NSString *)objc_getProperty(self, a2, 800, 1);
}

- (BOOL)largeIcon
{
  return self->_largeIcon;
}

- (void)setLargeIcon:(BOOL)a3
{
  self->_largeIcon = a3;
}

- (BOOL)underlineLinks
{
  return self->_underlineLinks;
}

- (CGSize)contentSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_contentSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_contentSize, &v3, 16, 1, 0);
}

- (NSString)displayLanguage
{
  return self->_displayLanguage;
}

- (void)setDisplayLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_displayLanguage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLanguage, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_captionText, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_buttonLabel, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
