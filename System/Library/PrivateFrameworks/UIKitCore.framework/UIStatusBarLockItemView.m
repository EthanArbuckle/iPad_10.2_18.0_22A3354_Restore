@implementation UIStatusBarLockItemView

+ (double)lockSlideAnimationDuration
{
  return 0.91;
}

- (void)_beginAnimation
{
  ++self->_animationCount;
}

- (void)_endAnimation
{
  int has_internal_diagnostics;
  int animationCount;
  void (**v5)(_QWORD);
  id animationCompletionBlock;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  --self->_animationCount;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  animationCount = self->_animationCount;
  if (has_internal_diagnostics)
  {
    if ((animationCount & 0x80000000) == 0)
      goto LABEL_3;
    __UIFaultDebugAssertLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "Animation count is overreleased.", buf, 2u);
    }

  }
  else
  {
    if ((animationCount & 0x80000000) == 0)
      goto LABEL_3;
    v8 = _endAnimation___s_category;
    if (!_endAnimation___s_category)
    {
      v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&_endAnimation___s_category);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Animation count is overreleased.", v10, 2u);
    }
  }
  animationCount = self->_animationCount;
LABEL_3:
  if (!animationCount)
  {
    v5 = (void (**)(_QWORD))_Block_copy(self->_animationCompletionBlock);
    animationCompletionBlock = self->_animationCompletionBlock;
    self->_animationCompletionBlock = 0;

    if (v5)
      v5[2](v5);

  }
}

- (BOOL)_isAnimating
{
  return self->_animationCount > 0;
}

- (double)updateContentsAndWidth
{
  _UIStatusBarLockItemPadlockView *v3;
  _UIStatusBarLockItemPadlockView *v4;
  _UIStatusBarLockItemPadlockView *padlockView;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double Height;
  double widthNeededDuringAnimation;
  double result;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  if (!self->_padlockView)
  {
    v3 = [_UIStatusBarLockItemPadlockView alloc];
    v4 = -[_UIStatusBarLockItemPadlockView initWithFrame:owner:](v3, "initWithFrame:owner:", self, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    padlockView = self->_padlockView;
    self->_padlockView = v4;

    -[UIView sizeToFit](self->_padlockView, "sizeToFit");
    -[UIView frame](self->_padlockView, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[UIView frame](self, "frame");
    Height = CGRectGetHeight(v17);
    v18.origin.x = v7;
    v18.origin.y = v9;
    v18.size.width = v11;
    v18.size.height = v13;
    -[UIView setFrame:](self->_padlockView, "setFrame:", v7, (Height - CGRectGetHeight(v18)) * 0.5 + -1.0, v11, v13);
    -[UIView addSubview:](self, "addSubview:", self->_padlockView);
  }
  if (-[UIStatusBarLockItemView _isAnimating](self, "_isAnimating"))
  {
    widthNeededDuringAnimation = self->_widthNeededDuringAnimation;
  }
  else
  {
    -[UIView frame](self->_padlockView, "frame");
    widthNeededDuringAnimation = CGRectGetWidth(v19);
  }
  -[UIStatusBarItemView adjustFrameToNewSize:](self, "adjustFrameToNewSize:", widthNeededDuringAnimation);
  return result;
}

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v4;
  _UIStatusBarLockItemPadlockView *padlockView;
  id v7;
  objc_super v9;

  v4 = *(_QWORD *)&a4;
  padlockView = self->_padlockView;
  v7 = a3;
  -[_UIStatusBarLockItemPadlockView reset](padlockView, "reset");
  v9.receiver = self;
  v9.super_class = (Class)UIStatusBarLockItemView;
  LOBYTE(v4) = -[UIStatusBarItemView updateForNewData:actions:](&v9, sel_updateForNewData_actions_, v7, v4);

  return v4;
}

- (void)setVisible:(BOOL)a3 frame:(CGRect)a4 duration:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v10;
  int v12;
  _QWORD v14[9];
  objc_super v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  v12 = -[UIStatusBarItemView isVisible](self, "isVisible") ^ a3;
  if (a5 > 0.0 && v12 == 0)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__UIStatusBarLockItemView_setVisible_frame_duration___block_invoke;
    v14[3] = &unk_1E16B20D8;
    v14[4] = self;
    *(double *)&v14[5] = x;
    *(double *)&v14[6] = y;
    *(double *)&v14[7] = width;
    *(double *)&v14[8] = height;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v14);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)UIStatusBarLockItemView;
    -[UIStatusBarItemView setVisible:frame:duration:](&v15, sel_setVisible_frame_duration_, v10, x, y, width, height, a5);
  }
}

void __53__UIStatusBarLockItemView_setVisible_frame_duration___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  double v17;
  int v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "position");
  v4 = v3;
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "position");
  v9 = v8;
  v11 = v10;

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
  v32 = (id)objc_claimAutoreleasedReturnValue();
  setDefaultLockAnimationParameters(v32);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v4, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFromValue:", v12);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setToValue:", v13);

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAnimation:forKey:", v32, CFSTR("lock slide"));

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 512));
  v16 = WeakRetained;
  if (WeakRetained)
  {
    v17 = v9 - v4;
    v18 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 504);
    objc_msgSend(WeakRetained, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "position");
    v21 = v20;
    v23 = v22;

    v24 = -0.0;
    if (!v18)
      v24 = v17;
    v25 = v24 + v21;
    v26 = 0.0;
    if (v18)
      v26 = v17;
    v27 = v21 - v26;
    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    setDefaultLockAnimationParameters(v28);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v27, v23);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFromValue:", v29);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v25, v23);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setToValue:", v30);

    objc_msgSend(v16, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addAnimation:forKey:", v28, CFSTR("alongside lock slide"));

    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 512), 0);
  }

}

- (void)animateUnlockForegroundView:(id)a3 timeItemSnapshot:(id)a4 completionBlock:(id)a5
{
  id v8;
  unint64_t v9;
  int has_internal_diagnostics;
  _UIStatusBarLockItemPadlockView *padlockView;
  UIView *textClippingView;
  _UIExpandingGlyphsView *v13;
  _UIExpandingGlyphsView *textView;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  UIView *v24;
  UIView *v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double MinX;
  double v42;
  double Width;
  void *v44;
  double v45;
  double v46;
  double v47;
  double MidX;
  void *v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  double v59;
  double MaxX;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  id v69;
  void *v70;
  id animationCompletionBlock;
  _UIStatusBarLockItemPadlockView *v72;
  UIView *timeItemSnapshot;
  double timeItemSnapshotCenterOffsetFromForegroundViewCenter;
  double v75;
  double MinY;
  double v77;
  double Height;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  double v89;
  void *v90;
  void *v91;
  double padlockViewCenterOffsetFromForegroundViewCenter;
  double v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double widthNeededForFinalState;
  double v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  double v110;
  double v111;
  CGFloat v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  double v125;
  void *v126;
  void *v127;
  double v128;
  void *v129;
  void *v130;
  void *v131;
  double v132;
  CGFloat v133;
  double v134;
  double v135;
  double v136;
  CGFloat v137;
  double v138;
  double v139;
  double v140;
  double v141;
  void *v142;
  double v143;
  double v144;
  double v145;
  double v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  double v154;
  void *v155;
  void *v156;
  double v157;
  void *v158;
  void *v159;
  void *v160;
  _UIExpandingGlyphsView *v161;
  NSObject *v162;
  NSObject *v163;
  unint64_t v164;
  NSObject *v165;
  CGFloat v166;
  id v167;
  CGFloat v168;
  CGFloat v169;
  double rect;
  CGFloat recta;
  id v172;
  _QWORD v173[9];
  _QWORD v174[5];
  _QWORD aBlock[4];
  id v176;
  id v177;
  id v178;
  id location[2];
  _QWORD v180[2];
  _QWORD v181[4];
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;
  CGRect v193;
  CGRect v194;
  CGRect v195;
  CGRect v196;
  CGRect v197;
  CGRect v198;
  CGRect v199;
  CGRect v200;
  CGRect v201;
  CGRect v202;
  CGRect v203;
  CGRect v204;
  CGRect v205;
  CGRect v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;
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

  v181[2] = *MEMORY[0x1E0C80C00];
  v172 = a3;
  v167 = a4;
  v8 = a5;
  if (-[UIStatusBarLockItemView _isAnimating](self, "_isAnimating"))
  {
    if (v8)
      dispatch_async(MEMORY[0x1E0C80D38], v8);
  }
  else
  {
    v9 = _MergedGlobals_5_11;
    if (!_MergedGlobals_5_11)
    {
      v9 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&_MergedGlobals_5_11);
    }
    if ((*(_BYTE *)v9 & 1) != 0)
    {
      v162 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_185066000, v162, OS_LOG_TYPE_ERROR, "Starting unlock animation", (uint8_t *)location, 2u);
      }
    }
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    padlockView = self->_padlockView;
    if (has_internal_diagnostics)
    {
      if (!padlockView)
      {
        __UIFaultDebugAssertLog();
        v163 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v163, OS_LOG_TYPE_FAULT))
        {
          LOWORD(location[0]) = 0;
          _os_log_fault_impl(&dword_185066000, v163, OS_LOG_TYPE_FAULT, "padlockView must have been created before unlock is called", (uint8_t *)location, 2u);
        }

      }
    }
    else if (!padlockView)
    {
      v164 = qword_1ECD7ABA0;
      if (!qword_1ECD7ABA0)
      {
        v164 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v164, (unint64_t *)&qword_1ECD7ABA0);
      }
      v165 = *(NSObject **)(v164 + 8);
      if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_185066000, v165, OS_LOG_TYPE_ERROR, "padlockView must have been created before unlock is called", (uint8_t *)location, 2u);
      }
    }
    textClippingView = self->_textClippingView;
    if (!textClippingView)
    {
      v13 = objc_alloc_init(_UIExpandingGlyphsView);
      textView = self->_textView;
      self->_textView = v13;

      -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "textFontForStyle:", 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "textColorForStyle:", 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_alloc(MEMORY[0x1E0CB3498]);
      _UILocalizedStringInSystemLanguage(CFSTR("UIStatusBar: Unlocked"), CFSTR("Unlocked"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)off_1E1678D98;
      v180[0] = *(_QWORD *)off_1E1678D90;
      v180[1] = v21;
      v181[0] = v16;
      v181[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v181, v180, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v19, "initWithString:attributes:", v20, v22);

      -[_UIExpandingGlyphsView setAttributedString:](self->_textView, "setAttributedString:", v23);
      -[UIView sizeToFit](self->_textView, "sizeToFit");
      v24 = objc_alloc_init(UIView);
      v25 = self->_textClippingView;
      self->_textClippingView = v24;

      -[UIView setClipsToBounds:](self->_textClippingView, "setClipsToBounds:", 1);
      -[UIView frame](self->_textView, "frame");
      rect = v26;
      v28 = v27;
      v30 = v29;
      v32 = v31;
      -[UIView frame](self->_textClippingView, "frame");
      v34 = v33;
      v36 = v35;
      v38 = v37;
      v40 = v39;
      if (-[UIStatusBarItemView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      {
        v182.origin.x = v34;
        v182.origin.y = v36;
        v182.size.width = v38;
        v182.size.height = v40;
        MinX = CGRectGetMinX(v182);
      }
      else
      {
        v183.origin.x = v34;
        v183.origin.y = v36;
        v183.size.width = v38;
        v183.size.height = v40;
        v42 = CGRectGetMinX(v183);
        v184.origin.x = v34;
        v184.origin.y = v36;
        v184.size.width = v38;
        v184.size.height = v40;
        Width = CGRectGetWidth(v184);
        v185.origin.x = v28;
        v185.origin.y = v30;
        v185.size.width = rect;
        v185.size.height = v32;
        MinX = v42 + Width - CGRectGetWidth(v185);
      }
      -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "baselineOffsetForStyle:", 3);
      v46 = v45;

      -[_UIExpandingGlyphsView baselineOffset](self->_textView, "baselineOffset");
      -[UIView setFrame:](self->_textView, "setFrame:", MinX, v46 - v47, rect, v32);
      -[UIView addSubview:](self->_textClippingView, "addSubview:", self->_textView);

      textClippingView = self->_textClippingView;
    }
    -[UIView addSubview:](self, "addSubview:", textClippingView);
    objc_msgSend(v172, "bounds");
    MidX = CGRectGetMidX(v186);
    -[UIView superview](self->_padlockView, "superview");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView frame](self->_padlockView, "frame");
    objc_msgSend(v49, "convertRect:toCoordinateSpace:", v172);
    v51 = v50;
    v53 = v52;
    v55 = v54;
    v57 = v56;

    v187.origin.x = v51;
    v187.origin.y = v53;
    v187.size.width = v55;
    v187.size.height = v57;
    v58 = MidX + 2.0;
    self->_padlockViewCenterOffsetFromForegroundViewCenter = CGRectGetMidX(v187) - (MidX + 2.0);
    v188.origin.x = v51;
    v188.origin.y = v53;
    v188.size.width = v55;
    v188.size.height = v57;
    v59 = CGRectGetMinX(v188);
    v189.origin.x = v51;
    v189.origin.y = v53;
    v189.size.width = v55;
    v189.size.height = v57;
    MaxX = CGRectGetMaxX(v189);
    v61 = vabdd_f64(v59, v58);
    v62 = vabdd_f64(MaxX, v58);
    if (v61 >= v62)
      v63 = v61;
    else
      v63 = v62;
    -[UIView frame](self->_padlockView, "frame");
    v64 = CGRectGetWidth(v190);
    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "standardPadding");
    v67 = v66;
    -[UIView frame](self->_textView, "frame");
    self->_widthNeededForFinalState = v64 + v67 + CGRectGetWidth(v191);

    v68 = self->_widthNeededForFinalState * 0.5;
    if (v63 >= v68)
      v68 = v63;
    self->_widthNeededDuringAnimation = v68 + v68;
    if (v167)
    {
      objc_msgSend(v167, "frame");
      self->_timeItemSnapshotCenterOffsetFromForegroundViewCenter = vabdd_f64(CGRectGetMidX(v192), v58);
      objc_storeStrong((id *)&self->_timeItemSnapshot, a4);
      -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v167, 0);
    }
    -[UIStatusBarLockItemView _beginAnimation](self, "_beginAnimation");
    -[UIStatusBarLockItemView updateContentsAndWidth](self, "updateContentsAndWidth");
    objc_msgSend(v172, "reflowItemViewsForgettingEitherSideItemHistory");
    objc_initWeak(location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__UIStatusBarLockItemView_animateUnlockForegroundView_timeItemSnapshot_completionBlock___block_invoke;
    aBlock[3] = &unk_1E16D7338;
    objc_copyWeak(&v178, location);
    v69 = v172;
    v176 = v69;
    v177 = v8;
    v70 = _Block_copy(aBlock);
    animationCompletionBlock = self->_animationCompletionBlock;
    self->_animationCompletionBlock = v70;

    -[UIStatusBarLockItemView _beginAnimation](self, "_beginAnimation");
    v72 = self->_padlockView;
    v174[0] = MEMORY[0x1E0C809B0];
    v174[1] = 3221225472;
    v174[2] = __88__UIStatusBarLockItemView_animateUnlockForegroundView_timeItemSnapshot_completionBlock___block_invoke_2;
    v174[3] = &unk_1E16B1B28;
    v174[4] = self;
    -[_UIStatusBarLockItemPadlockView animateUnlockCompletionBlock:](v72, "animateUnlockCompletionBlock:", v174);
    timeItemSnapshot = self->_timeItemSnapshot;
    if (timeItemSnapshot)
    {
      timeItemSnapshotCenterOffsetFromForegroundViewCenter = self->_timeItemSnapshotCenterOffsetFromForegroundViewCenter;
      -[UIView frame](timeItemSnapshot, "frame");
      v75 = CGRectGetWidth(v193);
      -[UIView frame](self->_timeItemSnapshot, "frame");
      MinY = CGRectGetMinY(v194);
      -[UIView frame](self->_timeItemSnapshot, "frame");
      v77 = CGRectGetWidth(v195);
      -[UIView frame](self->_timeItemSnapshot, "frame");
      Height = CGRectGetHeight(v196);
      -[UIView superview](self->_timeItemSnapshot, "superview");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "convertRect:fromCoordinateSpace:", v69, v58 + timeItemSnapshotCenterOffsetFromForegroundViewCenter + v75 * -0.5, MinY, v77, Height);
      v81 = v80;
      v83 = v82;
      v85 = v84;
      v87 = v86;

      -[UIView setFrame:](self->_timeItemSnapshot, "setFrame:", v81, v83, v85, v87);
      -[UIStatusBarLockItemView _beginAnimation](self, "_beginAnimation");
      -[UIView setAlpha:](self->_timeItemSnapshot, "setAlpha:", 0.0);
      objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("opacity"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      setDefaultLockAnimationParameters(v88);
      objc_msgSend(v88, "setFromValue:", &unk_1E1A95DD0);
      objc_msgSend(v88, "setToValue:", &unk_1E1A95DE0);
      LODWORD(v89) = 3.0;
      objc_msgSend(v88, "setSpeed:", v89);
      +[_UIViewWeakCAAnimationDelegate weakAnimationDelegate:](_UIViewWeakCAAnimationDelegate, "weakAnimationDelegate:", self);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "setDelegate:", v90);

      -[UIView layer](self->_timeItemSnapshot, "layer");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "addAnimation:forKey:", v88, CFSTR("fade"));

    }
    padlockViewCenterOffsetFromForegroundViewCenter = self->_padlockViewCenterOffsetFromForegroundViewCenter;
    -[UIView frame](self->_padlockView, "frame");
    v93 = CGRectGetWidth(v197);
    -[UIView frame](self->_padlockView, "frame");
    v94 = CGRectGetMinY(v198);
    -[UIView frame](self->_padlockView, "frame");
    v95 = CGRectGetWidth(v199);
    -[UIView frame](self->_padlockView, "frame");
    v96 = CGRectGetHeight(v200);
    -[UIView superview](self->_padlockView, "superview");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "convertRect:fromCoordinateSpace:", v69, v58 + padlockViewCenterOffsetFromForegroundViewCenter + v93 * -0.5, v94, v95, v96);
    v166 = v98;
    v169 = v100;
    recta = v99;
    v168 = v101;

    if (-[UIStatusBarItemView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      -[UIView bounds](self, "bounds");
      v102 = CGRectGetMidX(v201);
      widthNeededForFinalState = self->_widthNeededForFinalState;
      v202.origin.x = v166;
      v202.size.width = v169;
      v202.origin.y = recta;
      v202.size.height = v168;
      v104 = v102 + widthNeededForFinalState * 0.5 - CGRectGetWidth(v202);
    }
    else
    {
      -[UIView bounds](self, "bounds");
      v104 = CGRectGetMidX(v203) + self->_widthNeededForFinalState * -0.5;
    }
    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    setDefaultLockAnimationParameters(v105);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", centerOfRect(v166, recta, v169, v168));
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "setFromValue:", v106);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", centerOfRect(v104, recta, v169, v168));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "setToValue:", v107);

    +[_UIViewWeakCAAnimationDelegate weakAnimationDelegate:](_UIViewWeakCAAnimationDelegate, "weakAnimationDelegate:", self);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "setDelegate:", v108);

    -[UIStatusBarLockItemView _beginAnimation](self, "_beginAnimation");
    -[UIView layer](self->_padlockView, "layer");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "addAnimation:forKey:", v105, CFSTR("padlock translation"));

    -[UIView setFrame:](self->_padlockView, "setFrame:", v104, recta, v169, v168);
    -[UIView bounds](self, "bounds");
    v110 = CGRectGetHeight(v204);
    if (-[UIStatusBarItemView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      v205.origin.x = v166;
      v205.size.width = v169;
      v205.origin.y = recta;
      v205.size.height = v168;
      v111 = CGRectGetMinX(v205);
    }
    else
    {
      v206.origin.x = v166;
      v206.size.width = v169;
      v206.origin.y = recta;
      v206.size.height = v168;
      v111 = CGRectGetMaxX(v206);
    }
    v112 = v111;
    if (-[UIStatusBarItemView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      -[UIView bounds](self, "bounds");
      v113 = CGRectGetMidX(v207);
      v114 = self->_widthNeededForFinalState;
      v208.origin.x = v104;
      v208.size.width = v169;
      v208.origin.y = recta;
      v208.size.height = v168;
      v115 = CGRectGetWidth(v208);
      v116 = 0.0;
    }
    else
    {
      v209.origin.x = v104;
      v209.size.width = v169;
      v209.origin.y = recta;
      v209.size.height = v168;
      v116 = CGRectGetMaxX(v209);
      -[UIView bounds](self, "bounds");
      v113 = CGRectGetMidX(v210);
      v114 = self->_widthNeededForFinalState;
      v211.origin.y = 0.0;
      v211.size.width = 0.0;
      v211.origin.x = v116;
      v211.size.height = v110;
      v115 = CGRectGetMinX(v211);
    }
    v117 = v113 + v114 * 0.5 - v115;
    -[UIView setFrame:](self->_textClippingView, "setFrame:", v116, 0.0, v117, v110);
    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    setDefaultLockAnimationParameters(v118);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", centerOfRect(v112, 0.0, 0.0, v110));
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "setFromValue:", v119);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", centerOfRect(v116, 0.0, v117, v110));
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "setToValue:", v120);

    +[_UIViewWeakCAAnimationDelegate weakAnimationDelegate:](_UIViewWeakCAAnimationDelegate, "weakAnimationDelegate:", self);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "setDelegate:", v121);

    -[UIStatusBarLockItemView _beginAnimation](self, "_beginAnimation");
    -[UIView layer](self->_textClippingView, "layer");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "addAnimation:forKey:", v118, CFSTR("text clipping translation"));

    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("bounds"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    setDefaultLockAnimationParameters(v123);
    v124 = (void *)MEMORY[0x1E0CB3B18];
    v212.origin.y = 0.0;
    v212.size.width = 0.0;
    v212.origin.x = v112;
    v212.size.height = v110;
    v125 = CGRectGetWidth(v212);
    v213.origin.y = 0.0;
    v213.size.width = 0.0;
    v213.origin.x = v112;
    v213.size.height = v110;
    objc_msgSend(v124, "valueWithCGRect:", 0.0, 0.0, v125, CGRectGetHeight(v213));
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "setFromValue:", v126);

    v127 = (void *)MEMORY[0x1E0CB3B18];
    v214.origin.y = 0.0;
    v214.origin.x = v116;
    v214.size.width = v117;
    v214.size.height = v110;
    v128 = CGRectGetWidth(v214);
    v215.origin.y = 0.0;
    v215.origin.x = v116;
    v215.size.width = v117;
    v215.size.height = v110;
    objc_msgSend(v127, "valueWithCGRect:", 0.0, 0.0, v128, CGRectGetHeight(v215));
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "setToValue:", v129);

    +[_UIViewWeakCAAnimationDelegate weakAnimationDelegate:](_UIViewWeakCAAnimationDelegate, "weakAnimationDelegate:", self);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "setDelegate:", v130);

    -[UIStatusBarLockItemView _beginAnimation](self, "_beginAnimation");
    -[UIView layer](self->_textClippingView, "layer");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "addAnimation:forKey:", v123, CFSTR("text clipping bounds"));

    -[UIView frame](self->_textView, "frame");
    v133 = v132;
    v135 = v134;
    v137 = v136;
    v139 = v138;
    v140 = 0.0;
    if (!-[UIStatusBarItemView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      v216.origin.x = v133;
      v216.origin.y = v135;
      v216.size.width = v137;
      v216.size.height = v139;
      v140 = -CGRectGetWidth(v216);
    }
    if (-[UIStatusBarItemView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      v217.origin.y = 0.0;
      v217.origin.x = v116;
      v217.size.width = v117;
      v217.size.height = v110;
      v141 = CGRectGetWidth(v217);
      -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "standardPadding");
      v144 = v141 - v143;
      v145 = v140;
    }
    else
    {
      -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "standardPadding");
      v145 = v146;
      v144 = v137;
    }

    -[UIView setFrame:](self->_textView, "setFrame:", v145, v135, v144, v139);
    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    setDefaultLockAnimationParameters(v147);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", centerOfRect(v140, v135, v137, v139));
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "setFromValue:", v148);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", centerOfRect(v145, v135, v144, v139));
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "setToValue:", v149);

    +[_UIViewWeakCAAnimationDelegate weakAnimationDelegate:](_UIViewWeakCAAnimationDelegate, "weakAnimationDelegate:", self);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "setDelegate:", v150);

    -[UIStatusBarLockItemView _beginAnimation](self, "_beginAnimation");
    -[UIView layer](self->_textView, "layer");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "addAnimation:forKey:", v147, CFSTR("text translation"));

    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("bounds"));
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    setDefaultLockAnimationParameters(v152);
    v153 = (void *)MEMORY[0x1E0CB3B18];
    v218.origin.x = v140;
    v218.origin.y = v135;
    v218.size.width = v137;
    v218.size.height = v139;
    v154 = CGRectGetWidth(v218);
    v219.origin.x = v140;
    v219.origin.y = v135;
    v219.size.width = v137;
    v219.size.height = v139;
    objc_msgSend(v153, "valueWithCGRect:", 0.0, 0.0, v154, CGRectGetHeight(v219));
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "setFromValue:", v155);

    v156 = (void *)MEMORY[0x1E0CB3B18];
    v220.origin.x = v145;
    v220.origin.y = v135;
    v220.size.width = v144;
    v220.size.height = v139;
    v157 = CGRectGetWidth(v220);
    v221.origin.x = v145;
    v221.origin.y = v135;
    v221.size.width = v144;
    v221.size.height = v139;
    objc_msgSend(v156, "valueWithCGRect:", 0.0, 0.0, v157, CGRectGetHeight(v221));
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "setToValue:", v158);

    +[_UIViewWeakCAAnimationDelegate weakAnimationDelegate:](_UIViewWeakCAAnimationDelegate, "weakAnimationDelegate:", self);
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "setDelegate:", v159);

    -[UIStatusBarLockItemView _beginAnimation](self, "_beginAnimation");
    -[UIView layer](self->_textView, "layer");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "addAnimation:forKey:", v152, CFSTR("text bounds"));

    -[UIStatusBarLockItemView _beginAnimation](self, "_beginAnimation");
    -[_UIExpandingGlyphsView setExpandsFromLeftToRight:](self->_textView, "setExpandsFromLeftToRight:", -[UIStatusBarItemView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"));
    v161 = self->_textView;
    v173[0] = MEMORY[0x1E0C809B0];
    v173[1] = 3221225472;
    v173[2] = __88__UIStatusBarLockItemView_animateUnlockForegroundView_timeItemSnapshot_completionBlock___block_invoke_3;
    v173[3] = &unk_1E16B20D8;
    v173[4] = self;
    *(CGFloat *)&v173[5] = v166;
    *(CGFloat *)&v173[6] = recta;
    *(CGFloat *)&v173[7] = v169;
    *(CGFloat *)&v173[8] = v168;
    -[_UIExpandingGlyphsView animateCompletionBlock:](v161, "animateCompletionBlock:", v173);
    -[UIStatusBarLockItemView _endAnimation](self, "_endAnimation");

    objc_destroyWeak(&v178);
    objc_destroyWeak(location);
  }

}

void __88__UIStatusBarLockItemView_animateUnlockForegroundView_timeItemSnapshot_completionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  v14 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "padlockView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;

    objc_msgSend(v14, "padlockView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFrame:", 0.0, v6, v8, v10);

    objc_msgSend(v14, "timeItemSnapshot");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeFromSuperview");

    objc_msgSend(v14, "setTimeItemSnapshot:", 0);
    objc_msgSend(v14, "updateContentsAndWidth");
    objc_msgSend(*(id *)(a1 + 32), "reflowItemViewsForgettingEitherSideItemHistory");
    v3 = v14;
  }
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v3);
    v3 = v14;
  }

}

uint64_t __88__UIStatusBarLockItemView_animateUnlockForegroundView_timeItemSnapshot_completionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endAnimation");
}

uint64_t __88__UIStatusBarLockItemView_animateUnlockForegroundView_timeItemSnapshot_completionBlock___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "removeFromSuperview");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "_endAnimation");
}

- (void)jiggleCompletionBlock:(id)a3
{
  id v4;
  int has_internal_diagnostics;
  _UIStatusBarLockItemPadlockView *padlockView;
  void *v7;
  id animationCompletionBlock;
  _UIStatusBarLockItemPadlockView *v9;
  NSObject *v10;
  unint64_t v11;
  NSObject *v12;
  _QWORD v13[5];
  uint8_t buf[16];

  v4 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  padlockView = self->_padlockView;
  if (has_internal_diagnostics)
  {
    if (!padlockView)
    {
      __UIFaultDebugAssertLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "padlockView must have been created before jiggle is called", buf, 2u);
      }

    }
  }
  else if (!padlockView)
  {
    v11 = jiggleCompletionBlock____s_category_145;
    if (!jiggleCompletionBlock____s_category_145)
    {
      v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&jiggleCompletionBlock____s_category_145);
    }
    v12 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "padlockView must have been created before jiggle is called", buf, 2u);
    }
  }
  if (-[UIStatusBarLockItemView _isAnimating](self, "_isAnimating"))
  {
    if (v4)
      dispatch_async(MEMORY[0x1E0C80D38], v4);
  }
  else
  {
    v7 = _Block_copy(v4);
    animationCompletionBlock = self->_animationCompletionBlock;
    self->_animationCompletionBlock = v7;

    -[UIStatusBarLockItemView _beginAnimation](self, "_beginAnimation");
    v9 = self->_padlockView;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __49__UIStatusBarLockItemView_jiggleCompletionBlock___block_invoke;
    v13[3] = &unk_1E16B1B28;
    v13[4] = self;
    -[_UIStatusBarLockItemPadlockView jiggleCompletionBlock:](v9, "jiggleCompletionBlock:", v13);
  }

}

uint64_t __49__UIStatusBarLockItemView_jiggleCompletionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endAnimation");
}

- (id)accessibilityHUDRepresentation
{
  UIAccessibilityHUDItem *v2;
  void *v3;
  UIAccessibilityHUDItem *v4;

  v2 = [UIAccessibilityHUDItem alloc];
  +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("LockScreen_Lock"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:scaleImage:](v2, "initWithTitle:image:imageInsets:scaleImage:", 0, v3, 1, 0.0, 0.0, 0.0, 0.0);

  return v4;
}

- (UIView)viewToAnimateAlongside
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_viewToAnimateAlongside);
}

- (void)setViewToAnimateAlongside:(id)a3
{
  objc_storeWeak((id *)&self->_viewToAnimateAlongside, a3);
}

- (BOOL)alongsideViewIsBecomingVisible
{
  return self->_alongsideViewIsBecomingVisible;
}

- (void)setAlongsideViewIsBecomingVisible:(BOOL)a3
{
  self->_alongsideViewIsBecomingVisible = a3;
}

- (_UIStatusBarLockItemPadlockView)padlockView
{
  return self->_padlockView;
}

- (void)setPadlockView:(id)a3
{
  objc_storeStrong((id *)&self->_padlockView, a3);
}

- (UIView)textClippingView
{
  return self->_textClippingView;
}

- (void)setTextClippingView:(id)a3
{
  objc_storeStrong((id *)&self->_textClippingView, a3);
}

- (_UIExpandingGlyphsView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (double)padlockViewCenterOffsetFromForegroundViewCenter
{
  return self->_padlockViewCenterOffsetFromForegroundViewCenter;
}

- (void)setPadlockViewCenterOffsetFromForegroundViewCenter:(double)a3
{
  self->_padlockViewCenterOffsetFromForegroundViewCenter = a3;
}

- (UIView)timeItemSnapshot
{
  return self->_timeItemSnapshot;
}

- (void)setTimeItemSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_timeItemSnapshot, a3);
}

- (double)timeItemSnapshotCenterOffsetFromForegroundViewCenter
{
  return self->_timeItemSnapshotCenterOffsetFromForegroundViewCenter;
}

- (void)setTimeItemSnapshotCenterOffsetFromForegroundViewCenter:(double)a3
{
  self->_timeItemSnapshotCenterOffsetFromForegroundViewCenter = a3;
}

- (double)widthNeededDuringAnimation
{
  return self->_widthNeededDuringAnimation;
}

- (void)setWidthNeededDuringAnimation:(double)a3
{
  self->_widthNeededDuringAnimation = a3;
}

- (double)widthNeededForFinalState
{
  return self->_widthNeededForFinalState;
}

- (void)setWidthNeededForFinalState:(double)a3
{
  self->_widthNeededForFinalState = a3;
}

- (int)animationCount
{
  return self->_animationCount;
}

- (void)setAnimationCount:(int)a3
{
  self->_animationCount = a3;
}

- (id)animationCompletionBlock
{
  return self->_animationCompletionBlock;
}

- (void)setAnimationCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 584);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationCompletionBlock, 0);
  objc_storeStrong((id *)&self->_timeItemSnapshot, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_textClippingView, 0);
  objc_storeStrong((id *)&self->_padlockView, 0);
  objc_destroyWeak((id *)&self->_viewToAnimateAlongside);
}

@end
