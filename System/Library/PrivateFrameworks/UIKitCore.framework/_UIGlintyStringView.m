@implementation _UIGlintyStringView

- (_UIGlintyStringView)initWithText:(id)a3 andFont:(id)a4
{
  id v7;
  id v8;
  _UIGlintyStringView *v9;
  _UIGlintyStringView *v10;
  NSMutableSet *v11;
  NSMutableSet *blurHiddenRequesters;
  void *v13;
  uint64_t v14;
  _UIVibrantSettings *vibrantSettings;
  void *v16;
  _UIGlintyStringView *v17;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_UIGlintyStringView;
  v9 = -[UIView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_text, a3);
    objc_storeStrong((id *)&v10->_font, a4);
    v10->_needsTextUpdate = 1;
    v10->_animationRepeats = 1;
    -[_UIGlintyStringView setAnimating:](v10, "setAnimating:", 0);
    v10->_blurAlpha = 1.0;
    v10->_allowsLuminanceAdjustments = 1;
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    blurHiddenRequesters = v10->_blurHiddenRequesters;
    v10->_blurHiddenRequesters = v11;

    +[_UILegibilitySettings sharedInstanceForStyle:](_UILegibilitySettings, "sharedInstanceForStyle:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIVibrantSettings vibrantSettingsWithReferenceColor:referenceContrast:legibilitySettings:](_UIVibrantSettings, "vibrantSettingsWithReferenceColor:referenceContrast:legibilitySettings:", 0, v13, 0.0);
    v14 = objc_claimAutoreleasedReturnValue();
    vibrantSettings = v10->_vibrantSettings;
    v10->_vibrantSettings = (_UIVibrantSettings *)v14;

    -[_UIGlintyStringView setChevronStyle:](v10, "setChevronStyle:", 0);
    -[UIView setOpaque:](v10, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](v10, "setUserInteractionEnabled:", 1);
    -[_UIGlintyStringView updateText](v10, "updateText");
    -[UIView layer](v10, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAllowsGroupBlending:", 0);

    v17 = v10;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIGlintyStringView stopAnimating](self, "stopAnimating");
  v3.receiver = self;
  v3.super_class = (Class)_UIGlintyStringView;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    text = self->_text;
    self->_text = v4;

    -[_UIGlintyStringView setNeedsTextUpdate:](self, "setNeedsTextUpdate:", 1);
  }

}

- (void)setFont:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIFont isEqual:](self->_font, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_font, a3);
    -[_UIGlintyStringView setNeedsTextUpdate:](self, "setNeedsTextUpdate:", 1);
  }

}

- (void)setTextLanguage:(id)a3
{
  NSString *v4;
  NSString *textLanguage;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_textLanguage, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    textLanguage = self->_textLanguage;
    self->_textLanguage = v4;

    -[_UIGlintyStringView setNeedsTextUpdate:](self, "setNeedsTextUpdate:", 1);
  }

}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  if (self->_adjustsFontSizeToFitWidth != a3)
  {
    self->_adjustsFontSizeToFitWidth = a3;
    -[_UIGlintyStringView setNeedsTextUpdate:](self, "setNeedsTextUpdate:", 1);
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_legibilitySettings) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[_UIGlintyStringView setNeedsTextUpdate:](self, "setNeedsTextUpdate:", 1);
  }

}

- (void)setVibrantSettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_vibrantSettings) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_vibrantSettings, a3);
    -[_UIGlintyStringView setNeedsTextUpdate:](self, "setNeedsTextUpdate:", 1);
  }

}

- (void)setBackgroundView:(id)a3
{
  UIView *v4;
  UIView *backgroundView;
  UIView *v6;
  UIView *v7;
  UIView *v8;
  UIView *v9;

  v4 = (UIView *)a3;
  backgroundView = self->_backgroundView;
  if (backgroundView != v4)
  {
    v9 = v4;
    v6 = v4;
    v7 = self->_backgroundView;
    self->_backgroundView = v6;
    v8 = backgroundView;

    -[UIView removeFromSuperview](v8, "removeFromSuperview");
    -[_UIGlintyStringView setNeedsTextUpdate:](self, "setNeedsTextUpdate:", 1);
    v4 = v9;
  }

}

- (void)setBackgroundColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "_isSimilarToColor:withinPercentage:", self->_backgroundColor, 0.01) & 1) == 0
    && !-[_UIGlintyStringView hasCustomBackgroundColor](self, "hasCustomBackgroundColor"))
  {
    objc_storeStrong((id *)&self->_backgroundColor, a3);
    -[_UIGlintyStringView setNeedsTextUpdate:](self, "setNeedsTextUpdate:", 1);
  }

}

- (void)hideEffects
{
  id v2;

  -[_UIGlintyStringView effectView](self, "effectView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

}

- (void)showEffects
{
  id v2;

  -[_UIGlintyStringView effectView](self, "effectView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

}

- (void)hideBlur
{
  -[_UIGlintyStringView setBlurAlpha:](self, "setBlurAlpha:", 0.0);
}

- (void)showBlur
{
  -[_UIGlintyStringView setBlurAlpha:](self, "setBlurAlpha:", 1.0);
}

- (void)setBlurAlpha:(double)a3
{
  void *v5;
  uint64_t v6;
  id v7;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_graphicsQuality");

  if (-[NSMutableSet count](self->_blurHiddenRequesters, "count"))
    goto LABEL_5;
  if (v6 == 10)
    a3 = a3 * 0.2;
  if (!-[_UIGlintyStringView showing](self, "showing"))
LABEL_5:
    a3 = 0.0;
  self->_blurAlpha = a3;
  -[_UIGlintyStringView blurView](self, "blurView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", a3);

}

- (void)setBlurHidden:(BOOL)a3 forRequester:(id)a4
{
  NSMutableSet *blurHiddenRequesters;

  blurHiddenRequesters = self->_blurHiddenRequesters;
  if (a3)
    -[NSMutableSet addObject:](blurHiddenRequesters, "addObject:", a4);
  else
    -[NSMutableSet removeObject:](blurHiddenRequesters, "removeObject:", a4);
  -[_UIGlintyStringView updateBlurForHiddenRequesters](self, "updateBlurForHiddenRequesters");
}

- (void)updateBlurForHiddenRequesters
{
  _BOOL8 v3;
  id v4;

  if (!-[_UIGlintyStringView fading](self, "fading"))
  {
    v3 = -[NSMutableSet count](self->_blurHiddenRequesters, "count") != 0;
    -[_UIGlintyStringView blurView](self, "blurView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", v3);

  }
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)startAnimating
{
  if (!self->_animating)
  {
    -[_UIGlintyStringView setAnimating:](self, "setAnimating:", 1);
    -[_UIGlintyStringView addGlintyAnimations](self, "addGlintyAnimations");
    -[_UIGlintyStringViewDelegate glintyAnimationDidStart](self->_delegate, "glintyAnimationDidStart");
    -[_UIGlintyStringView show](self, "show");
  }
}

- (void)stopAnimating
{
  if (self->_animating)
  {
    -[_UIGlintyStringView setAnimating:](self, "setAnimating:", 0);
    -[_UIGlintyStringView hide](self, "hide");
    -[_UIGlintyStringView removeGlintyAnimations](self, "removeGlintyAnimations");
    -[_UIGlintyStringViewDelegate glintyAnimationDidStop](self->_delegate, "glintyAnimationDidStop");
  }
}

- (void)hide
{
  -[_UIGlintyStringView hideEffects](self, "hideEffects");
  -[_UIGlintyStringView hideBlur](self, "hideBlur");
  -[_UIGlintyStringView setShowing:](self, "setShowing:", 0);
  if (!-[_UIGlintyStringView fading](self, "fading"))
    -[_UIGlintyStringView stopAnimating](self, "stopAnimating");
}

- (void)show
{
  -[_UIGlintyStringView startAnimating](self, "startAnimating");
  -[_UIGlintyStringView setShowing:](self, "setShowing:", 1);
  -[_UIGlintyStringView showEffects](self, "showEffects");
  -[_UIGlintyStringView showBlur](self, "showBlur");
  -[_UIGlintyStringView updateBlurForHiddenRequesters](self, "updateBlurForHiddenRequesters");
}

- (void)fadeOut
{
  -[_UIGlintyStringView fadeOutWithDuration:](self, "fadeOutWithDuration:", 1.0);
}

- (void)fadeOutWithDuration:(double)a3
{
  _QWORD v5[5];
  _QWORD v6[5];

  -[_UIGlintyStringView setFading:](self, "setFading:", 1);
  v5[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43___UIGlintyStringView_fadeOutWithDuration___block_invoke;
  v6[3] = &unk_1E16B1B28;
  v6[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43___UIGlintyStringView_fadeOutWithDuration___block_invoke_2;
  v5[3] = &unk_1E16B3FD8;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v6, v5, a3, 0.0);
}

- (void)fadeIn
{
  -[_UIGlintyStringView fadeInWithDuration:](self, "fadeInWithDuration:", 1.0);
}

- (void)fadeInWithDuration:(double)a3
{
  _QWORD v5[5];
  _QWORD v6[5];

  -[_UIGlintyStringView setFading:](self, "setFading:", 1);
  v5[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42___UIGlintyStringView_fadeInWithDuration___block_invoke;
  v6[3] = &unk_1E16B1B28;
  v6[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42___UIGlintyStringView_fadeInWithDuration___block_invoke_2;
  v5[3] = &unk_1E16B3FD8;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v6, v5, a3, 0.0);
}

- (void)setChevronStyle:(int64_t)a3
{
  id v4;

  if (self->_chevronStyle != a3)
  {
    self->_chevronStyle = a3;
    -[_UIGlintyStringView _chevronImageForStyle:](self, "_chevronImageForStyle:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIGlintyStringView setChevron:](self, "setChevron:", v4);

  }
}

- (id)_chevronImageForStyle:(int64_t)a3
{
  __CFString *v3;
  void *v4;
  void *v5;

  if (a3)
  {
    if (a3 == 2)
      v3 = CFSTR("UIGlintyStringViewBandChevron");
    else
      v3 = CFSTR("UIGlintyStringViewChevron");
    _UIImageWithName(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageFlippedForRightToLeftLayoutDirection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setChevron:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_chevron != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_chevron, a3);
    -[_UIGlintyStringView setNeedsTextUpdate:](self, "setNeedsTextUpdate:", 1);
    v5 = v6;
  }

}

- (void)setHighlight:(BOOL)a3
{
  if (self->_highlight != a3)
  {
    self->_highlight = a3;
    -[_UIGlintyStringView setNeedsTextUpdate:](self, "setNeedsTextUpdate:", 1);
  }
}

- (double)_chevronPadding
{
  double result;

  result = 11.0;
  if (self->_chevronStyle == 2)
    return 20.0;
  return result;
}

- (void)setHorizontalPadding:(double)a3
{
  if (self->_horizontalPadding != a3)
  {
    self->_horizontalPadding = a3;
    -[_UIGlintyStringView setNeedsTextUpdate:](self, "setNeedsTextUpdate:", 1);
  }
}

- (void)_updateLabelWithFrame:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UILabel *v8;

  v8 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UILabel setTextAlignment:](v8, "setTextAlignment:", 1);
  +[UIColor clearColor](UIColor, "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v4);

  -[UILabel setText:](v8, "setText:", self->_text);
  +[UIColor whiteColor](UIColor, "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v8, "setTextColor:", v5);

  -[UILabel setFont:](v8, "setFont:", self->_font);
  -[UILabel setAdjustsFontSizeToFitWidth:](v8, "setAdjustsFontSizeToFitWidth:", self->_adjustsFontSizeToFitWidth);
  -[UILabel setMinimumScaleFactor:](v8, "setMinimumScaleFactor:", 0.6);
  if (self->_textLanguage)
  {
    -[UILabel _defaultAttributes](v8, "_defaultAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "setObject:forKey:", self->_textLanguage, CFSTR("NSLanguage"));
    -[UILabel _setDefaultAttributes:](v8, "_setDefaultAttributes:", v7);

  }
  -[_UIGlintyStringView setLabel:](self, "setLabel:", v8);

}

- (void)updateText
{
  -[UIView bounds](self, "bounds");
  -[_UIGlintyStringView updateTextWithBounds:](self, "updateTextWithBounds:");
}

- (void)updateTextWithBounds:(CGRect)a3
{
  double height;
  CGFloat width;
  double y;
  double x;
  void *v8;
  int v9;
  double horizontalPadding;
  UIFont *font;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
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
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  CGRect *p_chevronFrame;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  double v64;
  UIFont *v65;
  void *v66;
  CGFloat v67;
  _BOOL4 v68;
  void *v69;
  double v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  _BOOL4 v75;
  _BOOL4 v76;
  UIView *v77;
  UIView *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  UIImageView *v83;
  void *v84;
  void *v85;
  _BOOL4 v86;
  uint64_t v87;
  BOOL v88;
  NSString *text;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  UIView *v95;
  void *v96;
  void *v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  uint64_t v104;
  UIImageView *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  _UIGlintyGradientView *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  UIImageView *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  _BOOL4 v121;
  double v122;
  double v123;
  UIView *v124;
  UIView *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  uint64_t *v131;
  UIImageView *v132;
  CGFloat v133;
  CGFloat v134;
  CGFloat v135;
  CGFloat v136;
  UIImageView *v137;
  UIImageView *v138;
  double v139;
  UIImageView *v140;
  void *v141;
  uint64_t v142;
  UIView *v143;
  void *v144;
  double v145;
  double v146;
  void *v147;
  UIView *v148;
  UIView *v149;
  void *v150;
  void *v151;
  double v152;
  double v153;
  double v154;
  CGFloat v155;
  double v156;
  CGFloat v157;
  void *v158;
  double v159;
  _QWORD *ContextStack;
  CGContext *v161;
  uint64_t *v162;
  CGFloat MinX;
  CGFloat MinY;
  void *v165;
  void *v166;
  CGFloat v167;
  CGFloat v168;
  void *v169;
  void *v170;
  UIImageView *v171;
  UIImageView *v172;
  uint64_t v173;
  void *v174;
  UIView *v175;
  CGFloat v176;
  CGFloat v177;
  uint64_t v178;
  void *v179;
  CGFloat v180;
  UIImageView *v181;
  _UIGlintyGradientView *v182;
  CGFloat v183;
  void *v184;
  CGFloat v185;
  _BOOL4 v186;
  double v187;
  UIImageView *v188;
  double v189;
  void *v190;
  CGFloat v191;
  void *v192;
  double v193;
  UIFont *v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double rect;
  _BOOL4 recta;
  UIView *rectb;
  CGAffineTransform v202;
  CGAffineTransform v203;
  double v204;
  double v205;
  double v206;
  double v207;
  void *v208;
  uint64_t v209;
  _QWORD v210[3];
  CGRect v211;
  CGRect v212;
  CGRect v213;
  CGRect v214;
  CGRect v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;
  CGRect v224;
  CGRect v225;
  CGRect v226;
  CGRect v227;
  CGRect v228;
  CGRect v229;
  CGRect v230;
  CGRect v231;
  CGRect v232;
  CGRect v233;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v210[1] = *MEMORY[0x1E0C80C00];
  -[UIView subviews](self, "subviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  v211.origin.x = x;
  v211.origin.y = y;
  v211.size.width = width;
  v211.size.height = height;
  if (!CGRectEqualToRect(v211, *MEMORY[0x1E0C9D648]))
  {
    v9 = *((_DWORD *)&self->super._viewFlags + 4);
    horizontalPadding = self->_horizontalPadding;
    font = self->_font;
    v209 = *(_QWORD *)off_1E1678D90;
    v210[0] = font;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v210, &v209, 1);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString sizeWithAttributes:](self->_text, "sizeWithAttributes:");
    v13 = v12;
    v197 = v14;
    -[_UIGlintyStringView _chevronWidthWithPadding](self, "_chevronWidthWithPadding");
    if (v15 >= horizontalPadding)
      v16 = v15;
    else
      v16 = horizontalPadding;
    v212.origin.x = x;
    v212.origin.y = y;
    rect = width;
    v212.size.width = width;
    v212.size.height = height;
    v17 = CGRectGetWidth(v212) - horizontalPadding - horizontalPadding;
    if (v13 + v16 >= v17)
      v18 = v17;
    else
      v18 = v13 + v16;
    if (v18 < v13 + v16 && self->_chevronStyle == 2)
    {
      horizontalPadding = self->_horizontalPadding * 0.5;
      -[_UIGlintyStringView _chevronWidthWithPaddingCompression:](self, "_chevronWidthWithPaddingCompression:", 0.5);
      if (v19 >= horizontalPadding)
        v16 = v19;
      else
        v16 = horizontalPadding;
      v213.origin.x = x;
      v213.origin.y = y;
      v213.size.width = rect;
      v213.size.height = height;
      v20 = CGRectGetWidth(v213) - horizontalPadding - horizontalPadding;
      if (v13 + v16 >= v20)
        v18 = v20;
      else
        v18 = v13 + v16;
    }
    v195 = v13;
    v214.origin.x = x;
    v214.origin.y = y;
    v214.size.width = rect;
    v214.size.height = height;
    v21 = CGRectGetHeight(v214);
    -[_UIGlintyStringView _chevronHeightWithMaxOffset](self, "_chevronHeightWithMaxOffset");
    if (v22 < v197)
      v22 = v197;
    if (v21 < v22)
      v22 = v21;
    v23 = UIRectCenteredIntegralRectScale(0.0, 0.0, ceil(v18), ceil(v22), x, y, rect, height, 0.0);
    v27 = v24;
    v183 = v25;
    v28 = v23 - ceil(v16 * 0.35);
    if (v28 >= horizontalPadding)
      v29 = v28;
    else
      v29 = horizontalPadding;
    v185 = v24;
    v187 = y;
    v180 = v26;
    v30 = x;
    if ((v9 & 0x80000) != 0)
    {
      v215.origin.x = x;
      v215.origin.y = y;
      v32 = v25;
      v215.size.width = rect;
      v33 = v26;
      v215.size.height = height;
      v34 = v27;
      v29 = CGRectGetMaxX(v215) - v29 - v18;
      v216.origin.x = v29;
      v216.origin.y = v34;
      v216.size.width = v32;
      v216.size.height = v33;
      v31 = CGRectGetMaxX(v216) - v16 - v195;
    }
    else
    {
      v31 = v16 + v29;
    }
    v35 = ceil(v18 - v16);
    v36 = ceil(v197);
    v189 = height;
    if (self->_chevronStyle == 2)
    {
      v37 = v30;
      v38 = v187;
      v39 = UIRectCenteredIntegralRectScale(v31, 0.0, v35, v36, v30, v187, rect, height, 0.0);
      v41 = v40;
      v43 = v42;
      v45 = v44;
      v46 = self->_horizontalPadding;
      if (v39 - v16 >= v46)
        v29 = v39 - v16;
      else
        v29 = self->_horizontalPadding;
      v47 = v16 + v46;
      if (v39 >= v47)
        v48 = v39;
      else
        v48 = v47;
    }
    else
    {
      v37 = v30;
      v38 = v187;
      v48 = UIRectCenteredYInRectScale(v31, 0.0, v35, v36, v30, v187, rect, height, 0.0);
      v41 = v49;
      v43 = v50;
      v45 = v51;
    }
    v206 = 0.0;
    v207 = 0.0;
    v204 = 0.0;
    v205 = 0.0;
    v193 = v45;
    v196 = v48;
    v52 = v43;
    v198 = v41;
    if (CTFontGetLanguageAwareOutsets())
    {
      v53 = ceil(v206);
      v54 = ceil(v207);
      v196 = v48 - v54;
      v198 = v41 - v53;
      v52 = v43 - (-ceil(v205) - v54);
      v193 = v45 - (-ceil(v204) - v53);
    }
    v176 = v43;
    v177 = v41;
    v191 = v45;
    -[_UIGlintyStringView _updateLabelWithFrame:](self, "_updateLabelWithFrame:", v48, v41, v43, v45);
    -[UIImage size](self->_chevron, "size");
    v56 = v55;
    v58 = v57;
    if ((v9 & 0x80000) != 0)
    {
      v217.origin.x = v29;
      v217.size.width = v183;
      v217.origin.y = v185;
      v217.size.height = v180;
      v29 = CGRectGetMaxX(v217) - v56;
    }
    v59 = v52;
    p_chevronFrame = &self->_chevronFrame;
    self->_chevronFrame.origin.x = v29;
    self->_chevronFrame.origin.y = 0.0;
    self->_chevronFrame.size.width = v56;
    self->_chevronFrame.size.height = v58;
    self->_chevronFrame.origin.x = UIRectCenteredYInRectScale(v29, 0.0, v56, v58, v37, v38, rect, v189, 0.0);
    self->_chevronFrame.origin.y = v61;
    self->_chevronFrame.size.width = v62;
    self->_chevronFrame.size.height = v63;
    -[_UIGlintyStringView _chevronVerticalOffset](self, "_chevronVerticalOffset");
    self->_chevronFrame.origin.y = v64 + self->_chevronFrame.origin.y;
    v65 = self->_font;
    if (-[_UIGlintyStringView allowsLuminanceAdjustments](self, "allowsLuminanceAdjustments"))
    {
      -[_UIGlintyStringView backgroundView](self, "backgroundView");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v193;
      if (v66)
      {
        v68 = 0;
      }
      else
      {
        -[_UIGlintyStringView backgroundColor](self, "backgroundColor");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "_luminance");
        v68 = v70 > 0.85;

      }
    }
    else
    {
      v68 = 0;
      v67 = v193;
    }
    -[_UIGlintyStringView vibrantSettings](self, "vibrantSettings");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "referenceColor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v72, "_luminance");
    v74 = v73;
    v75 = -[_UIGlintyStringView allowsLuminanceAdjustments](self, "allowsLuminanceAdjustments");
    v190 = v72;
    if (v72)
      v76 = v75;
    else
      v76 = 0;
    if (v74 >= 0.22)
      v76 = 0;
    recta = v76;
    v77 = [UIView alloc];
    -[UIView bounds](self, "bounds");
    v78 = -[UIView initWithFrame:](v77, "initWithFrame:");
    -[UIView layer](v78, "layer");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setAllowsGroupOpacity:", 0);

    -[UIView layer](v78, "layer");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setAllowsGroupBlending:", 0);

    -[UIView setOpaque:](v78, "setOpaque:", 0);
    v81 = *MEMORY[0x1E0CD2E08];
    -[UIView layer](v78, "layer");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setCompositingFilter:", v81);

    -[_UIGlintyStringView setEffectView:](self, "setEffectView:", v78);
    v83 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", p_chevronFrame->origin.x, self->_chevronFrame.origin.y, self->_chevronFrame.size.width, self->_chevronFrame.size.height);
    -[_UIGlintyStringView chevron](self, "chevron");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v83, "setImage:", v84);

    v188 = v83;
    if (!v68)
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = v68;
      v87 = objc_msgSend(v85, "_graphicsQuality");

      v88 = v87 == 100;
      v68 = v86;
      if (v88)
      {
        text = self->_text;
        -[UIView bounds](self, "bounds");
        -[_UIGlintyStringView shapeViewForCharactersInString:withFont:centeredInFrame:](self, "shapeViewForCharactersInString:withFont:centeredInFrame:", text, v65);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        memset(&v203, 0, sizeof(v203));
        CGAffineTransformMakeScale(&v203, 1.0, -1.0);
        +[UIColor blackColor](UIColor, "blackColor");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "setBackgroundColor:", v91);

        v202 = v203;
        objc_msgSend(v90, "setTransform:", &v202);
        objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "setValue:forKey:", &unk_1E1A9AF98, CFSTR("inputRadius"));
        objc_msgSend(v92, "setValue:forKey:", CFSTR("low"), CFSTR("inputQuality"));
        objc_msgSend(v92, "setName:", CFSTR("gaussianBlur"));
        v208 = v92;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v208, 1);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "layer");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "setFilters:", v93);

        -[UIView addSubview:](v78, "addSubview:", v90);
        if (recta)
          objc_msgSend(v90, "setAlpha:", 0.3);

        v68 = v86;
      }
    }
    v194 = v65;
    v232.origin.x = p_chevronFrame->origin.x;
    v232.origin.y = self->_chevronFrame.origin.y;
    v232.size.width = self->_chevronFrame.size.width;
    v232.size.height = self->_chevronFrame.size.height;
    v218.origin.x = v196;
    v218.origin.y = v198;
    v218.size.width = v52;
    v218.size.height = v67;
    v219 = CGRectUnion(v218, v232);
    v95 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v219.origin.x, v219.origin.y, v219.size.width, v219.size.height);
    -[UIView layer](v95, "layer");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "setAllowsGroupOpacity:", 0);

    -[UIView layer](v95, "layer");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "setAllowsGroupBlending:", 0);

    -[UIView setOpaque:](v95, "setOpaque:", 0);
    -[UIView setClipsToBounds:](v95, "setClipsToBounds:", 1);
    -[UIView addSubview:](v78, "addSubview:", v95);
    v186 = v68;
    if (v68)
      -[UIView setAlpha:](v95, "setAlpha:", 0.2);
    -[UIView bounds](self, "bounds");
    v221.size.height = CGRectGetHeight(v220);
    v221.size.width = 640.0;
    v221.origin.x = 0.0;
    v221.origin.y = 0.0;
    v222 = CGRectInset(v221, -3.0, -3.0);
    v98 = v222.origin.x;
    v99 = v222.size.width;
    v100 = v222.size.height;
    -[UIView bounds](self, "bounds");
    v103 = round(v102 + (v101 - v100) * 0.5);
    _UIImageWithName(CFSTR("UIGlintyStringViewShimmerMask"));
    v104 = objc_claimAutoreleasedReturnValue();
    v105 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v98, v103, v99, v100);
    -[UIView layer](v105, "layer");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "setContentsScale:", 1.25);

    -[UIView layer](v105, "layer");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "setAnchorPoint:", 0.5, 0.47);

    v184 = (void *)v104;
    -[UIImageView setImage:](v105, "setImage:", v104);
    -[UIView layer](v105, "layer");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "setAllowsGroupOpacity:", 0);

    -[UIView layer](v105, "layer");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "setAllowsGroupBlending:", 0);

    -[UIView layer](v105, "layer");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setCompositingFilter:", v81);

    -[UIView setAlpha:](v105, "setAlpha:", 0.9);
    -[UIView addSubview:](v95, "addSubview:", v105);
    v181 = v105;
    -[_UIGlintyStringView setShimmerImageView:](self, "setShimmerImageView:", v105);
    v111 = -[_UIGlintyGradientView initWithFrame:]([_UIGlintyGradientView alloc], "initWithFrame:", v98, v103, v99, v100);
    -[UIView layer](v111, "layer");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "setAnchorPoint:", 0.5, 0.47);

    v113 = *MEMORY[0x1E0CD2BD0];
    -[UIView layer](v111, "layer");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "setCompositingFilter:", v113);

    -[UIView setAlpha:](v111, "setAlpha:", 0.35);
    v182 = v111;
    -[UIView addSubview:](v95, "addSubview:", v111);
    _UIImageWithName(CFSTR("UIGlintyStringViewReflectionMask"));
    v115 = objc_claimAutoreleasedReturnValue();
    v116 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v98, v103, v99, v100);
    -[UIView layer](v116, "layer");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setContentsScale:", 1.25);

    -[UIView layer](v116, "layer");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "setAnchorPoint:", 0.5, 0.47);

    v179 = (void *)v115;
    -[UIImageView setImage:](v116, "setImage:", v115);
    v119 = *MEMORY[0x1E0CD2E58];
    -[UIView layer](v116, "layer");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v178 = v119;
    objc_msgSend(v120, "setCompositingFilter:", v119);

    -[UIView setAlpha:](v116, "setAlpha:", 0.75);
    -[UIView addSubview:](v95, "addSubview:", v116);
    -[_UIGlintyStringView setReflectionImageView:](self, "setReflectionImageView:", v116);
    if (-[_UIGlintyStringView animating](self, "animating"))
      -[_UIGlintyStringView addGlintyAnimations](self, "addGlintyAnimations");
    v121 = -[_UIGlintyStringView usesBackgroundDimming](self, "usesBackgroundDimming");
    v122 = 0.39;
    if (recta)
      v122 = 0.56;
    if (v121)
      v123 = 0.25;
    else
      v123 = v122;
    v124 = [UIView alloc];
    -[UIView bounds](self, "bounds");
    v125 = -[UIView initWithFrame:](v124, "initWithFrame:");
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v123, 1.0);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v125, "setBackgroundColor:", v126);

    v127 = *MEMORY[0x1E0CD2EB0];
    -[UIView layer](v125, "layer");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "setCompositingFilter:", v127);

    -[UIView layer](v125, "layer");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "setAllowsGroupOpacity:", 0);

    -[UIView layer](v125, "layer");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "setAllowsGroupBlending:", 0);

    rectb = v125;
    -[UIView addSubview:](v78, "addSubview:", v125);
    v131 = (uint64_t *)MEMORY[0x1E0CD2C48];
    v132 = v188;
    if (self->_backgroundView)
    {
      v233.origin.x = p_chevronFrame->origin.x;
      v233.origin.y = self->_chevronFrame.origin.y;
      v233.size.width = self->_chevronFrame.size.width;
      v233.size.height = self->_chevronFrame.size.height;
      v223.origin.x = v196;
      v223.origin.y = v198;
      v223.size.width = v59;
      v223.size.height = v67;
      v224 = CGRectUnion(v223, v233);
      v225 = CGRectInset(v224, -77.0, -111.0);
      v133 = v225.origin.x;
      v134 = v225.origin.y;
      v135 = v225.size.width;
      v136 = v225.size.height;
      v137 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v225.origin.x, v225.origin.y, v225.size.width, v225.size.height);
      -[UIView addSubview:](self, "addSubview:", v137);
      -[UIView bounds](v137, "bounds");
      -[UIView setFrame:](self->_backgroundView, "setFrame:");
      -[UIView addSubview:](v137, "addSubview:", self->_backgroundView);
      v138 = [UIImageView alloc];
      v226.origin.x = v133;
      v226.origin.y = v134;
      v226.size.width = v135;
      v226.size.height = v136;
      v139 = CGRectGetWidth(v226);
      v227.origin.x = v133;
      v227.origin.y = v134;
      v227.size.width = v135;
      v227.size.height = v136;
      v140 = -[UIImageView initWithFrame:](v138, "initWithFrame:", 0.0, 0.0, v139, CGRectGetHeight(v227));
      _UIImageWithName(CFSTR("UIGlintyStringViewBlurBlob"));
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](v140, "setImage:", v141);

      -[UIView addSubview:](v137, "addSubview:", v140);
      v142 = *MEMORY[0x1E0CD2C48];
      -[UIView layer](v140, "layer");
      v143 = v78;
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "setCompositingFilter:", v142);

      v78 = v143;
      v132 = v188;
      -[_UIGlintyStringView setBlurView:](self, "setBlurView:", v137);
      -[_UIGlintyStringView updateBlurForHiddenRequesters](self, "updateBlurForHiddenRequesters");
      -[_UIGlintyStringView blurAlpha](self, "blurAlpha");
      v146 = v145;
      -[_UIGlintyStringView blurView](self, "blurView");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "setAlpha:", v146);

      v131 = (uint64_t *)MEMORY[0x1E0CD2C48];
    }
    if (v186)
    {
      v148 = [UIView alloc];
      -[UIView bounds](self, "bounds");
      v149 = -[UIView initWithFrame:](v148, "initWithFrame:");
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.2, 0.3);
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v149, "setBackgroundColor:", v150);

      -[UIView layer](v149, "layer");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "setCompositingFilter:", v178);

      -[UIView addSubview:](v78, "addSubview:", v149);
    }
    -[UIView bounds](self, "bounds");
    if (v153 > 0.0 && v152 > 0.0)
    {
      -[UIView bounds](self, "bounds");
      v155 = v154;
      v157 = v156;
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "scale");
      _UIGraphicsBeginImageContextWithOptions(0, 0, v155, v157, v159);

      ContextStack = GetContextStack(0);
      v175 = v78;
      if (*(int *)ContextStack < 1)
        v161 = 0;
      else
        v161 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
      v162 = v131;
      CGContextSaveGState(v161);
      v228.origin.x = v48;
      v228.origin.y = v177;
      v228.size.width = v176;
      v228.size.height = v191;
      MinX = CGRectGetMinX(v228);
      v229.origin.x = v48;
      v229.origin.y = v177;
      v229.size.width = v176;
      v229.size.height = v191;
      MinY = CGRectGetMinY(v229);
      CGContextTranslateCTM(v161, MinX, MinY);
      -[_UIGlintyStringView label](self, "label");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "layer");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "renderInContext:", v161);

      CGContextRestoreGState(v161);
      CGContextSaveGState(v161);
      v230.origin.x = p_chevronFrame->origin.x;
      v230.origin.y = self->_chevronFrame.origin.y;
      v230.size.width = self->_chevronFrame.size.width;
      v230.size.height = self->_chevronFrame.size.height;
      v167 = CGRectGetMinX(v230);
      v231.origin.x = p_chevronFrame->origin.x;
      v231.origin.y = self->_chevronFrame.origin.y;
      v231.size.width = self->_chevronFrame.size.width;
      v231.size.height = self->_chevronFrame.size.height;
      v168 = CGRectGetMinY(v231);
      CGContextTranslateCTM(v161, v167, v168);
      -[UIView layer](v132, "layer");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v169, "renderInContext:", v161);

      CGContextRestoreGState(v161);
      _UIGraphicsGetImageFromCurrentImageContext(0);
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();
      v171 = [UIImageView alloc];
      -[UIView bounds](self, "bounds");
      v172 = -[UIImageView initWithFrame:](v171, "initWithFrame:");
      v173 = *v162;
      -[UIView layer](v172, "layer");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v174, "setCompositingFilter:", v173);

      -[UIImageView setImage:](v172, "setImage:", v170);
      v78 = v175;
      -[UIView addSubview:](v175, "addSubview:", v172);

    }
    -[UIView addSubview:](self, "addSubview:", v78);
    -[_UIGlintyStringView setNeedsTextUpdate:](self, "setNeedsTextUpdate:", 0);
    if (!-[_UIGlintyStringView showing](self, "showing"))
      -[_UIGlintyStringView hide](self, "hide");

  }
}

- (void)removeGlintyAnimations
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_UIGlintyStringView shimmerImageView](self, "shimmerImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimations");

  -[_UIGlintyStringView reflectionImageView](self, "reflectionImageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllAnimations");

}

- (void)addGlintyAnimations
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_UIGlintyStringView shimmerImageView](self, "shimmerImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIGlintyStringView addShimmerAnimationToLayer:](self, "addShimmerAnimationToLayer:", v4);

  -[_UIGlintyStringView reflectionImageView](self, "reflectionImageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIGlintyStringView addReflectionAnimationToLayer:](self, "addReflectionAnimationToLayer:", v5);

}

- (void)addShimmerAnimationToLayer:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0)
    v3 = &unk_1E1A953C0;
  else
    v3 = &unk_1E1A953A8;
  v4 = (void *)MEMORY[0x1E0CD27D0];
  v5 = *MEMORY[0x1E0CD3058];
  v6 = a3;
  objc_msgSend(v4, "functionWithName:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position.x"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDuration:", 2.0);
  objc_msgSend(v8, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v8, "setRemovedOnCompletion:", 0);
  LODWORD(v9) = 2139095040;
  objc_msgSend(v8, "setRepeatCount:", v9);
  objc_msgSend(v8, "setKeyTimes:", &unk_1E1A953D8);
  objc_msgSend(v8, "setValues:", v3);
  v11[0] = v7;
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimingFunctions:", v10);

  objc_msgSend(v6, "addAnimation:forKey:", v8, CFSTR("shimmerAnimation"));
}

- (void)addReflectionAnimationToLayer:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0)
    v3 = &unk_1E1A95408;
  else
    v3 = &unk_1E1A953F0;
  v4 = (void *)MEMORY[0x1E0CD27D0];
  v5 = *MEMORY[0x1E0CD3058];
  v6 = a3;
  objc_msgSend(v4, "functionWithName:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position.x"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDuration:", 2.0);
  objc_msgSend(v8, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v8, "setRemovedOnCompletion:", 0);
  LODWORD(v9) = 2139095040;
  objc_msgSend(v8, "setRepeatCount:", v9);
  objc_msgSend(v8, "setKeyTimes:", &unk_1E1A95420);
  objc_msgSend(v8, "setValues:", v3);
  v11[0] = v7;
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimingFunctions:", v10);

  objc_msgSend(v6, "addAnimation:forKey:", v8, CFSTR("reflectionAnimation"));
}

- (id)shapeViewForCharactersInString:(id)a3 withFont:(id)a4 centeredInFrame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  const __CTFont *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  const UniChar *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  CGGlyph *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  CGSize *v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  CGRect *v27;
  CFIndex v28;
  CGPath *Mutable;
  unint64_t v30;
  double v31;
  const CGPath *PathForGlyph;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat MinX;
  CGFloat v39;
  CGFloat MinY;
  const CGPath *v41;
  void *v42;
  _UIGlintyShapeView *v43;
  _UIGlintyShapeView *v44;
  void *v45;
  void *v46;
  uint64_t v48;
  double v49;
  CGAffineTransform m;
  uint64_t v51;
  CGRect PathBoundingBox;
  CGRect v53;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v51 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (const __CTFont *)a4;
  v12 = objc_msgSend(v10, "length");
  *(_QWORD *)&v13 = MEMORY[0x1E0C80A78](v12).n128_u64[0];
  v15 = (const UniChar *)((char *)&v48 - v14);
  v16 = objc_msgSend(v10, "length", v13);
  *(_QWORD *)&v17 = MEMORY[0x1E0C80A78](v16).n128_u64[0];
  v19 = (CGGlyph *)((char *)&v48 - v18);
  v20 = objc_msgSend(v10, "length", v17);
  *(_QWORD *)&v21 = MEMORY[0x1E0C80A78](v20).n128_u64[0];
  v23 = (CGSize *)(&v48 - 2 * v22);
  v24 = objc_msgSend(v10, "length", v21);
  *(_QWORD *)&v25 = MEMORY[0x1E0C80A78](v24).n128_u64[0];
  v27 = (CGRect *)(&v48 - 4 * v26);
  objc_msgSend(v10, "getCharacters:range:", v15, 0, objc_msgSend(v10, "length", v25));
  CTFontGetGlyphsForCharacters(v11, v15, v19, objc_msgSend(v10, "length"));
  v28 = objc_msgSend(v10, "length", CTFontGetAdvancesForGlyphs(v11, kCTFontOrientationDefault, v19, v23, objc_msgSend(v10, "length")));
  CTFontGetBoundingRectsForGlyphs(v11, kCTFontOrientationDefault, v19, v27, v28);
  Mutable = CGPathCreateMutable();
  if (objc_msgSend(v10, "length"))
  {
    v30 = 0;
    v31 = 0.0;
    do
    {
      PathForGlyph = CTFontCreatePathForGlyph(v11, v19[v30], 0);
      memset(&m, 0, sizeof(m));
      CGAffineTransformMakeTranslation(&m, v31, 0.0);
      CGPathAddPath(Mutable, &m, PathForGlyph);
      CGPathRelease(PathForGlyph);
      v33 = v23->width;
      ++v23;
      v31 = v31 + v33;
      ++v30;
    }
    while (v30 < objc_msgSend(v10, "length"));
  }
  PathBoundingBox = CGPathGetPathBoundingBox(Mutable);
  v34 = PathBoundingBox.size.width;
  v35 = PathBoundingBox.size.height;
  v36 = round(x + (width - PathBoundingBox.size.width) * 0.5);
  v37 = round(y + (height - PathBoundingBox.size.height) * 0.5);
  memset(&m, 0, sizeof(m));
  PathBoundingBox.origin.x = v36;
  PathBoundingBox.origin.y = v37;
  MinX = CGRectGetMinX(PathBoundingBox);
  v49 = height;
  v39 = MinX;
  v53.origin.x = v36;
  v53.origin.y = v37;
  v53.size.width = v34;
  v53.size.height = v35;
  MinY = CGRectGetMinY(v53);
  CGAffineTransformMakeTranslation(&m, v39, MinY);
  v41 = CGPathCreateMutableCopyByTransformingPath(Mutable, &m);
  +[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  CGPathRelease(Mutable);
  CGPathRelease(v41);
  v43 = [_UIGlintyShapeView alloc];
  v44 = -[_UIGlintyShapeView initWithFrame:](v43, "initWithFrame:", x, y, width, v49);
  -[_UIGlintyShapeView setPath:](v44, "setPath:", v42);
  -[_UIGlintyShapeView setFillColor:](v44, "setFillColor:", 0);
  +[UIColor whiteColor](UIColor, "whiteColor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIGlintyShapeView setStrokeColor:](v44, "setStrokeColor:", v45);

  -[_UIGlintyShapeView shapeLayer](v44, "shapeLayer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setLineWidth:", 1.5);
  objc_msgSend(v46, "setMiterLimit:", 5.0);
  objc_msgSend(v46, "setLineCap:", CFSTR("round"));
  objc_msgSend(v46, "setLineJoin:", CFSTR("round"));
  objc_msgSend(v46, "setLineDashPattern:", &unk_1E1A95438);
  objc_msgSend(v46, "setShouldRasterize:", 1);

  return v44;
}

- (id)_highlightCompositingFilter
{
  if (-[_UIVibrantSettings style](self->_vibrantSettings, "style") == 1)
    return (id)*MEMORY[0x1E0CD2BD0];
  else
    return 0;
}

- (id)_highlightColor
{
  return -[_UIVibrantSettings highlightColor](self->_vibrantSettings, "highlightColor");
}

- (void)_updateHighlight
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIView *highlightView;
  UIView *v8;
  UIView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[UIView frame](self->_label, "frame");
  highlightView = self->_highlightView;
  if (self->_highlight)
  {
    if (!highlightView)
    {
      v8 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v3, v4, v5, v6);
      -[_UIGlintyStringView setHighlightView:](self, "setHighlightView:", v8);

      v9 = self->_highlightView;
      -[_UIGlintyStringView _highlightColor](self, "_highlightColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);

      -[UIView layer](self->_highlightView, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAllowsGroupBlending:", 0);

      -[UIView layer](self->_highlightView, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIGlintyStringView _highlightCompositingFilter](self, "_highlightCompositingFilter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setCompositingFilter:", v13);

      -[UIView addSubview:](self, "addSubview:", self->_highlightView);
    }
  }
  else
  {
    -[UIView removeFromSuperview](highlightView, "removeFromSuperview");
    -[_UIGlintyStringView setHighlightView:](self, "setHighlightView:", 0);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (-[_UIGlintyStringView needsTextUpdate](self, "needsTextUpdate"))
  {
    -[_UIGlintyStringView updateTextWithBounds:](self, "updateTextWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, height);
    -[_UIGlintyStringView setNeedsTextUpdate:](self, "setNeedsTextUpdate:", 1);
  }
  -[_UIGlintyStringView _chevronWidthWithPadding](self, "_chevronWidthWithPadding");
  v7 = v6;
  -[_UIGlintyStringView _labelSizeThatFits:](self, "_labelSizeThatFits:", width - v6, height);
  v9 = v8;
  v11 = v7 + v10;
  -[_UIGlintyStringView _chevronHeightWithMaxOffset](self, "_chevronHeightWithMaxOffset");
  if (v12 >= v9)
    v13 = v12;
  else
    v13 = v9;
  v14 = ceil(v11);
  v15 = ceil(v13);
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)_labelSizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  CGSize result;

  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[UILabel font](self->_label, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (CTFontGetLanguageAwareOutsets())
  {
    v5 = v5 - (-ceil(0.0) - ceil(0.0));
    v7 = v7 - (-ceil(0.0) - ceil(0.0));
  }

  v9 = v5;
  v10 = v7;
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)_chevronWidthWithPadding
{
  UIImage *chevron;
  double v4;
  double v5;
  double v6;

  chevron = self->_chevron;
  if (!chevron)
    return 0.0;
  -[UIImage size](chevron, "size");
  v5 = v4;
  -[_UIGlintyStringView _chevronPadding](self, "_chevronPadding");
  return v5 + v6;
}

- (double)_chevronWidthWithPaddingCompression:(double)a3
{
  UIImage *chevron;
  double v6;
  double v7;
  double v8;

  chevron = self->_chevron;
  if (!chevron)
    return 0.0;
  -[UIImage size](chevron, "size");
  v7 = v6;
  -[_UIGlintyStringView _chevronPadding](self, "_chevronPadding");
  return v7 + v8 * a3;
}

- (double)_chevronHeightWithMaxOffset
{
  UIImage *chevron;
  double v3;

  chevron = self->_chevron;
  if (!chevron)
    return 0.0;
  -[UIImage size](chevron, "size");
  return v3 + 3.5;
}

- (double)_chevronVerticalOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  -[UIFont xHeight](self->_font, "xHeight");
  v4 = v3;
  -[UILabel _actualScaleFactor](self->_label, "_actualScaleFactor");
  v6 = v4 + v4 * v5 * -0.95;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  return floor(v6 * v9) / v9;
}

- (CGRect)labelFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIView frame](self->_label, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)chevronFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_chevronFrame.origin.x;
  y = self->_chevronFrame.origin.y;
  width = self->_chevronFrame.size.width;
  height = self->_chevronFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)baselineOffsetFromBottom
{
  double v3;
  double v4;
  double result;

  -[UIView bounds](self, "bounds");
  -[_UIGlintyStringView baselineOffsetFromBottomWithSize:](self, "baselineOffsetFromBottomWithSize:", v3, v4);
  return result;
}

- (double)baselineOffsetFromBottomWithSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;

  height = a3.height;
  width = a3.width;
  if (-[_UIGlintyStringView needsTextUpdate](self, "needsTextUpdate"))
  {
    -[_UIGlintyStringView updateTextWithBounds:](self, "updateTextWithBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, height);
    -[_UIGlintyStringView setNeedsTextUpdate:](self, "setNeedsTextUpdate:", 1);
  }
  -[UIView frame](self->_label, "frame");
  v8 = height - v6 - v7;
  -[UILabel _baselineOffsetFromBottom](self->_label, "_baselineOffsetFromBottom");
  return v9 + v8;
}

- (void)layoutSubviews
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIGlintyStringView;
  -[UIView layoutSubviews](&v4, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  if (-[_UIGlintyStringView showing](self, "showing"))
  {
    -[_UIGlintyStringView updateText](self, "updateText");
  }
  else
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __37___UIGlintyStringView_layoutSubviews__block_invoke;
    v3[3] = &unk_1E16B1B28;
    v3[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);
  }
}

- (void)didMoveToWindow
{
  void *v3;

  if (-[_UIGlintyStringView isAnimating](self, "isAnimating"))
  {
    -[UIView window](self, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      -[_UIGlintyStringView stopAnimating](self, "stopAnimating");
  }
}

- (_UIGlintyStringViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (_UIGlintyStringViewDelegate *)a3;
}

- (NSString)text
{
  return self->_text;
}

- (UIFont)font
{
  return self->_font;
}

- (NSString)textLanguage
{
  return self->_textLanguage;
}

- (void)setChevronFrame:(CGRect)a3
{
  self->_chevronFrame = a3;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (_UIVibrantSettings)vibrantSettings
{
  return self->_vibrantSettings;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)chevronBackgroundColor
{
  return self->_chevronBackgroundColor;
}

- (void)setChevronBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_chevronBackgroundColor, a3);
}

- (BOOL)animationRepeats
{
  return self->_animationRepeats;
}

- (void)setAnimationRepeats:(BOOL)a3
{
  self->_animationRepeats = a3;
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return self->_adjustsFontSizeToFitWidth;
}

- (BOOL)hasCustomBackgroundColor
{
  return self->_hasCustomBackgroundColor;
}

- (void)setHasCustomBackgroundColor:(BOOL)a3
{
  self->_hasCustomBackgroundColor = a3;
}

- (int64_t)chevronStyle
{
  return self->_chevronStyle;
}

- (double)horizontalPadding
{
  return self->_horizontalPadding;
}

- (BOOL)highlight
{
  return self->_highlight;
}

- (BOOL)allowsLuminanceAdjustments
{
  return self->_allowsLuminanceAdjustments;
}

- (void)setAllowsLuminanceAdjustments:(BOOL)a3
{
  self->_allowsLuminanceAdjustments = a3;
}

- (BOOL)usesBackgroundDimming
{
  return self->_usesBackgroundDimming;
}

- (void)setUsesBackgroundDimming:(BOOL)a3
{
  self->_usesBackgroundDimming = a3;
}

- (BOOL)needsTextUpdate
{
  return self->_needsTextUpdate;
}

- (void)setNeedsTextUpdate:(BOOL)a3
{
  self->_needsTextUpdate = a3;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (CGSize)labelSize
{
  double width;
  double height;
  CGSize result;

  width = self->_labelSize.width;
  height = self->_labelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLabelSize:(CGSize)a3
{
  self->_labelSize = a3;
}

- (UIView)spotlightView
{
  return self->_spotlightView;
}

- (void)setSpotlightView:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightView, a3);
}

- (int)textIndex
{
  return self->_textIndex;
}

- (void)setTextIndex:(int)a3
{
  self->_textIndex = a3;
}

- (UIImage)chevron
{
  return self->_chevron;
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightView, a3);
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (BOOL)fading
{
  return self->_fading;
}

- (void)setFading:(BOOL)a3
{
  self->_fading = a3;
}

- (BOOL)showing
{
  return self->_showing;
}

- (void)setShowing:(BOOL)a3
{
  self->_showing = a3;
}

- (UIView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_effectView, a3);
}

- (UIView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
}

- (UIView)shimmerImageView
{
  return self->_shimmerImageView;
}

- (void)setShimmerImageView:(id)a3
{
  objc_storeStrong((id *)&self->_shimmerImageView, a3);
}

- (UIView)reflectionImageView
{
  return self->_reflectionImageView;
}

- (void)setReflectionImageView:(id)a3
{
  objc_storeStrong((id *)&self->_reflectionImageView, a3);
}

- (double)blurAlpha
{
  return self->_blurAlpha;
}

- (NSMutableSet)blurHiddenRequesters
{
  return self->_blurHiddenRequesters;
}

- (void)setBlurHiddenRequesters:(id)a3
{
  objc_storeStrong((id *)&self->_blurHiddenRequesters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurHiddenRequesters, 0);
  objc_storeStrong((id *)&self->_reflectionImageView, 0);
  objc_storeStrong((id *)&self->_shimmerImageView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_chevron, 0);
  objc_storeStrong((id *)&self->_spotlightView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_chevronBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_vibrantSettings, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_textLanguage, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
