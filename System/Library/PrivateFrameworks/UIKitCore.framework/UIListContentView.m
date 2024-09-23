@implementation UIListContentView

- (double)_preferredMaxLayoutWidth
{
  double result;

  result = 0.0;
  if ((*(_QWORD *)&self->super._viewFlags & 0x4000000000000) == 0)
    return self->_preferredMaxLayoutWidth;
  return result;
}

uint64_t __43__UIListContentView_initWithConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setConfiguration:", *(_QWORD *)(a1 + 40));
}

void __86__UIListContentView__intrinsicSizeForLabel_inAvailableSpace_outRequiresMultipleLines___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  void *v5;
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "setNumberOfLines:", *(_QWORD *)(a1 + 48));
  if (*(_BYTE *)(a1 + 88)
    || (objc_msgSend(*(id *)(a1 + 40), "_isInLayoutSubviews") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 40), "layer"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "needsLayout"),
        v5,
        (v6 & 1) == 0))
  {
    objc_msgSend(*(id *)(a1 + 40), "bounds");
    if (v3 != *MEMORY[0x1E0C9D820] || v2 != *(double *)(MEMORY[0x1E0C9D820] + 8))
      objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  }
}

uint64_t __86__UIListContentView__intrinsicSizeForLabel_inAvailableSpace_outRequiresMultipleLines___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 40) == 1)
    objc_msgSend(*(id *)(a1 + 32), "setNumberOfLines:", 2);
  return objc_msgSend(*(id *)(a1 + 32), "setBounds:", 0.0, 0.0, *(double *)(a1 + 48), 99999.0);
}

- (UILayoutGuide)textLayoutGuide
{
  void *v3;
  UILayoutGuide *v4;
  UILayoutGuide *textLayoutGuide;
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
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  if (!self->_textLayoutGuide)
  {
    -[UIListContentView _textLabel]((id *)&self->super.super.super.isa);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = objc_alloc_init(UILayoutGuide);
      textLayoutGuide = self->_textLayoutGuide;
      self->_textLayoutGuide = v4;

      -[UIView addLayoutGuide:](self, "addLayoutGuide:", self->_textLayoutGuide);
      -[UILayoutGuide setIdentifier:](self->_textLayoutGuide, "setIdentifier:", CFSTR("UIListContentViewTextLayoutGuide"));
      -[UILayoutGuide _setLockedToOwningView:](self->_textLayoutGuide, "_setLockedToOwningView:", 1);
      -[UILayoutGuide leadingAnchor](self->_textLayoutGuide, "leadingAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIListContentView _textLabel]((id *)&self->super.super.super.isa);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "leadingAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "constraintEqualToAnchor:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setIdentifier:", CFSTR("UIListContentView-leading-textLayoutGuide-constraint"));
      -[UILayoutGuide trailingAnchor](self->_textLayoutGuide, "trailingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIListContentView _textLabel]((id *)&self->super.super.super.isa);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "trailingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "setIdentifier:", CFSTR("UIListContentView-trailing-textLayoutGuide-constraint"));
      -[UILayoutGuide topAnchor](self->_textLayoutGuide, "topAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIListContentView _textLabel]((id *)&self->super.super.super.isa);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "topAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "setIdentifier:", CFSTR("UIListContentView-top-textLayoutGuide-constraint"));
      -[UILayoutGuide bottomAnchor](self->_textLayoutGuide, "bottomAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIListContentView _textLabel]((id *)&self->super.super.super.isa);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bottomAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "setIdentifier:", CFSTR("UIListContentView-bottom-textLayoutGuide-constraint"));
      v24[0] = v9;
      v24[1] = v13;
      v24[2] = v17;
      v24[3] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide _setSystemConstraints:](self->_textLayoutGuide, "_setSystemConstraints:", v22);
      objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v22);

    }
  }
  return self->_textLayoutGuide;
}

- (void)_setPrimaryTextFrameDidChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (UIListContentConfiguration)configuration
{
  UIListContentConfiguration *animatingToConfiguration;

  animatingToConfiguration = self->_animatingToConfiguration;
  if (!animatingToConfiguration)
    animatingToConfiguration = self->_configuration;
  return (UIListContentConfiguration *)(id)-[UIListContentConfiguration copy](animatingToConfiguration, "copy");
}

- (UIListContentView)initWithConfiguration:(UIListContentConfiguration *)configuration
{
  UIListContentConfiguration *v5;
  UIListContentView *v6;
  UIListContentView *v7;
  void *v9;
  _QWORD v10[4];
  UIListContentView *v11;
  UIListContentConfiguration *v12;
  objc_super v13;

  v5 = configuration;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIListContentConfiguration.m"), 1364, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)UIListContentView;
  v6 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __43__UIListContentView_initWithConfiguration___block_invoke;
    v10[3] = &unk_1E16B1B50;
    v11 = v6;
    v12 = v5;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10);

  }
  return v7;
}

- (BOOL)supportsConfiguration:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)setConfiguration:(UIListContentConfiguration *)configuration
{
  UIListContentConfiguration *v5;
  UIListContentConfiguration *animatingToConfiguration;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v5 = configuration;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIListContentConfiguration.m"), 1428, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

  }
  animatingToConfiguration = self->_animatingToConfiguration;
  if (!-[UIListContentConfiguration _isEqualToConfigurationQuick:]((uint64_t)self->_configuration, v5)
    || animatingToConfiguration
    && (-[UIListContentConfiguration _isEqualToConfigurationQuick:]((uint64_t)self->_animatingToConfiguration, v5) & 1) == 0)
  {
    v7 = (void *)-[UIListContentConfiguration copy](v5, "copy");
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      objc_storeStrong((id *)&self->_animatingToConfiguration, v7);
      if (!animatingToConfiguration)
      {
        objc_storeStrong((id *)&self->_animatingFromConfiguration, self->_configuration);
        objc_initWeak(&location, self);
        v8 = MEMORY[0x1E0C809B0];
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __38__UIListContentView_setConfiguration___block_invoke;
        v15[3] = &unk_1E16B42F8;
        objc_copyWeak(&v16, &location);
        v13[0] = v8;
        v13[1] = 3221225472;
        v13[2] = __38__UIListContentView_setConfiguration___block_invoke_2;
        v13[3] = &unk_1E16B3F40;
        objc_copyWeak(&v14, &location);
        +[_UIContentViewAnimationStateUpdatingLayer layerForView:withUpdateHandler:completionHandler:](_UIContentViewAnimationStateUpdatingLayer, "layerForView:withUpdateHandler:completionHandler:", self, v15, v13);
        v11[0] = v8;
        v11[1] = 3221225472;
        v11[2] = __38__UIListContentView_setConfiguration___block_invoke_3;
        v11[3] = &unk_1E16B51A0;
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v12 = v9;
        +[UIView _addCompletionWithPosition:](UIView, "_addCompletionWithPosition:", v11);

        objc_destroyWeak(&v14);
        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      if (animatingToConfiguration)
      {
        objc_storeStrong((id *)&self->_animatingFromConfiguration, v7);
        objc_storeStrong((id *)&self->_animatingToConfiguration, v7);
      }
      -[UIListContentView _applyConfiguration:]((id *)&self->super.super.super.isa, v7);
    }

  }
}

- (void)_prepareForFirstIntrinsicContentSizeCalculation
{
  objc_super v2;

  self->_preferredMaxLayoutWidth = 1.79769313e308;
  v2.receiver = self;
  v2.super_class = (Class)UIListContentView;
  -[UIView _prepareForFirstIntrinsicContentSizeCalculation](&v2, sel__prepareForFirstIntrinsicContentSizeCalculation);
}

- (double)_multilineContextWidth
{
  return -1.0;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9 = 1.79769313e308;
  if (a3.width <= 0.0)
    a3.width = 1.79769313e308;
  if (height > 0.0)
    v9 = height;
  -[UIListContentView _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, v9);
  if (a4 >= 1000.0)
    v10 = width;
  if (a5 >= 1000.0)
    v11 = height;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height;
  double width;
  UIListContentConfiguration *animatingToConfiguration;
  UIListContentConfiguration *configuration;
  UIListContentConfiguration *v8;
  double preferredMaxLayoutWidth;
  double v10;
  double v11;
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
  UIListContentConfiguration *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  double v36;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (self
    && (animatingToConfiguration = self->_animatingToConfiguration) != 0
    && (configuration = self->_configuration, configuration != animatingToConfiguration))
  {
    v8 = configuration;
    -[UIListContentView _applyConfiguration:]((id *)&self->super.super.super.isa, self->_animatingToConfiguration);
  }
  else
  {
    v8 = 0;
  }
  if (width >= self->_preferredMaxLayoutWidth)
    preferredMaxLayoutWidth = self->_preferredMaxLayoutWidth;
  else
    preferredMaxLayoutWidth = width;
  -[UIView directionalLayoutMargins](self, "directionalLayoutMargins");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v36 = 0.0;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[UIListContentView _computeLayoutInfoForAvailableSpace:]((uint64_t)&v30, (id *)&self->super.super.super.isa, preferredMaxLayoutWidth - v12 - v16, height - v10 - v14);
  v18 = v17 + v13 + *((double *)&v35 + 1);
  v19 = v15 + v11 + v36;
  if ((_QWORD)v30 != 2)
  {
    v20 = v18 + *((double *)&v31 + 1);
    if (*((double *)&v31 + 1) > 0.0 && v18 > 0.0)
    {
      -[UIListContentConfiguration imageToTextPadding](self->_configuration, "imageToTextPadding", *((double *)&v31 + 1));
      v20 = v20 + v21;
    }
    if (v15 + v11 + *(double *)&v32 >= v19)
      v19 = v15 + v11 + *(double *)&v32;
    v18 = v20;
  }
  v22 = self->_configuration;
  -[UIView traitCollection](self, "traitCollection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIListContentConfiguration _minimumHeightForTraitCollection:](v22, "_minimumHeightForTraitCollection:", v23);
  v25 = v24;

  if (v8)
    -[UIListContentView _applyConfiguration:]((id *)&self->super.super.super.isa, v8);
  if (preferredMaxLayoutWidth >= v18)
    v26 = v18;
  else
    v26 = preferredMaxLayoutWidth;
  if (v25 >= v19)
    v27 = v25;
  else
    v27 = v19;
  if (height >= v27)
    height = v27;

  v28 = v26;
  v29 = height;
  result.height = v29;
  result.width = v28;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinY;
  void *v46;
  void *v47;
  int v48;
  double v49;
  double v50;
  double v51;
  double v52;
  BOOL v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  double MaxY;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double LineOfLabel;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  void *v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  CGFloat v123;
  CGFloat v124;
  CGFloat v125;
  CGFloat v126;
  double v127;
  double v128;
  double v129;
  CGFloat v130;
  CGFloat v131;
  double v132;
  double v133;
  CGFloat rect1;
  CGFloat v135;
  CGFloat v136;
  double v137;
  CGFloat v138;
  CGFloat v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  CGFloat v147;
  uint64_t v148;
  double v149;
  _OWORD v150[2];
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  double v155;
  objc_super v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;

  v156.receiver = self;
  v156.super_class = (Class)UIListContentView;
  -[UIView layoutSubviews](&v156, sel_layoutSubviews);
  -[UIListContentView _primaryTextLayoutFrame](self, "_primaryTextLayoutFrame");
  v4 = v3;
  v135 = v6;
  v136 = v5;
  rect1 = v7;
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  v9 = v8;
  -[UIView bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[UIView directionalLayoutMargins](self, "directionalLayoutMargins");
  v19 = v18;
  v138 = v17;
  v139 = v15;
  v137 = v20;
  v22 = v17 - v20 - v21;
  v155 = 0.0;
  v153 = 0u;
  v154 = 0u;
  v128 = v23;
  v151 = 0u;
  v152 = 0u;
  memset(v150, 0, sizeof(v150));
  -[UIListContentView _computeLayoutInfoForAvailableSpace:]((uint64_t)v150, (id *)&self->super.super.super.isa, v15 - v18 - v23, v22);
  -[UIListContentView _imageView]((id *)&self->super.super.super.isa);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *(_QWORD *)&v150[0];
  v130 = v13;
  v131 = v11;
  if (!v24 || *(_QWORD *)&v150[0] == 2)
  {
    v40 = 2;
    v142 = v15;
    v143 = v17;
    v140 = v11;
    v141 = v13;
    v28 = v137;
  }
  else
  {
    v26 = *((double *)&v151 + 1);
    v144 = v11;
    v145 = v13;
    v146 = v15;
    v147 = v138;
    v148 = 2;
    v149 = v19 + *((double *)&v151 + 1);
    v27 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v144, 0.0, 0.0, *((double *)v150 + 1));
    v28 = v137;
    v32 = UIRectCenteredYInRectScale(v27, v29, v30, v31, 0.0, v137, 0.0, v22, v9);
    v140 = UIRectIntegralWithScale(v32, v33, v34, v35, v9);
    v141 = v36;
    v142 = v37;
    v143 = v38;
    -[UIListContentView _setFrame:forView:isOldFrameInvalid:]((uint64_t)self, v24, *(_BYTE *)&self->_contentViewFlags & 1, v140, v36, v37, v38);
    -[UIListContentConfiguration imageToTextPadding](self->_configuration, "imageToTextPadding");
    v19 = v26 + v39;
    v40 = 8;
  }
  v157.origin.x = UIRectCenteredYInRectScale(0.0, 0.0, *((double *)&v154 + 1), v155, 0.0, v28, 0.0, v22, v9);
  x = v157.origin.x;
  y = v157.origin.y;
  width = v157.size.width;
  height = v157.size.height;
  MinY = CGRectGetMinY(v157);
  -[UIListContentView _textLabel]((id *)&self->super.super.super.isa);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIListContentView _secondaryTextLabel]((id *)&self->super.super.super.isa);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v46)
    goto LABEL_23;
  v48 = v152;
  v133 = v4;
  if (!(_BYTE)v152)
  {
    objc_msgSend(v46, "_firstBaselineOffsetFromTop");
    v49 = v19;
    v51 = v50;
    objc_msgSend(v47, "_firstBaselineOffsetFromTop");
    v53 = v51 < v52;
    v19 = v49;
    if (v53)
    {
      objc_msgSend(v47, "_firstBaselineOffsetFromTop");
      v55 = v54;
      objc_msgSend(v46, "_firstBaselineOffsetFromTop");
      v57 = v55 - v56;
      v19 = v49;
      MinY = MinY + v57;
    }
  }
  v144 = v140;
  v145 = v141;
  v146 = v142;
  v147 = v143;
  v148 = v40;
  v127 = v19;
  v149 = v19;
  v58 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v144, 0.0, MinY, *((double *)&v152 + 1));
  v132 = v9;
  v62 = UIRectIntegralWithScale(v58, v59, v60, v61, v9);
  v64 = v63;
  v66 = v65;
  v68 = v67;
  -[UIListContentView _setFrame:forView:isOldFrameInvalid:]((uint64_t)self, v46, (*(_BYTE *)&self->_contentViewFlags >> 1) & 1, v62, v63, v65, v67);
  if (v48)
  {
    v158.origin.x = v62;
    v158.origin.y = v64;
    v158.size.width = v66;
    v158.size.height = v68;
    MaxY = CGRectGetMaxY(v158);
    -[UIListContentConfiguration textToSecondaryTextVerticalPadding](self->_configuration, "textToSecondaryTextVerticalPadding");
    MinY = MaxY + v70;
    v9 = v132;
    v4 = v133;
    v19 = v127;
    if (!v25)
      goto LABEL_23;
LABEL_16:
    v129 = MinY;
    v77 = v19;
    objc_msgSend(v24, "frame");
    v79 = v78;
    v81 = v80;
    v83 = v82;
    v85 = v84;
    LineOfLabel = _UIContentViewRectForVerticalCenteringWithFirstLineOfLabel(v46);
    v90 = v86;
    v91 = v87;
    if (v25 == 2)
    {
      v92 = v88;
      -[UIView bringSubviewToFront:](self, "bringSubviewToFront:", v24);
      v144 = v140;
      v145 = v141;
      v146 = v142;
      v147 = v143;
      v148 = v40;
      v19 = v77;
      v149 = v77;
      v93 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v144, 0.0, 0.0, *((double *)v150 + 1));
      v9 = v132;
      v98 = UIRectCenteredYInRectScale(v93, v94, v95, v96, LineOfLabel, v90, v91, v92, v132);
      v100 = v99;
      v102 = v101;
    }
    else
    {
      v103 = v79;
      v9 = v132;
      v98 = UIRectCenteredYInRectScale(v103, v81, v83, v85, LineOfLabel, v86, v87, v88, v132);
      v105 = v104;
      v100 = v106;
      v102 = v107;
      v160.origin.y = v130;
      v160.origin.x = v131;
      v160.size.height = v138;
      v160.size.width = v139;
      v108 = v137 * 0.5 + CGRectGetMinY(v160);
      if (v105 >= v108)
        v97 = v105;
      else
        v97 = v108;
      v19 = v77;
    }
    v109 = UIRectIntegralWithScale(v98, v97, v100, v102, v9);
    -[UIListContentView _setFrame:forView:isOldFrameInvalid:]((uint64_t)self, v24, *(_BYTE *)&self->_contentViewFlags & 1, v109, v110, v111, v112);
    v4 = v133;
    MinY = v129;
    goto LABEL_23;
  }
  v159.origin.x = x;
  v159.origin.y = y;
  v159.size.width = width;
  v159.size.height = height;
  MinY = CGRectGetMinY(v159);
  objc_msgSend(v46, "_firstBaselineOffsetFromTop");
  v72 = v71;
  objc_msgSend(v47, "_firstBaselineOffsetFromTop");
  if (v72 > v73)
  {
    objc_msgSend(v46, "_firstBaselineOffsetFromTop");
    v75 = v74;
    objc_msgSend(v47, "_firstBaselineOffsetFromTop");
    MinY = MinY + v75 - v76;
  }
  v40 = 8;
  v19 = -v128 - *((double *)&v153 + 1);
  v142 = v139;
  v143 = v138;
  v140 = v131;
  v141 = v130;
  v9 = v132;
  v4 = v133;
  if (v25)
    goto LABEL_16;
LABEL_23:
  if (v24)
  {
    -[UIListContentConfiguration imageProperties](self->_configuration, "imageProperties");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "cornerRadius");
    _UIApplyCornerRadiusToView(v24, v114);

  }
  if (v47)
  {
    v144 = v140;
    v145 = v141;
    v146 = v142;
    v147 = v143;
    v148 = v40;
    v149 = v19;
    v115 = -[UIView _applyDirectionalRelativePosition:toRect:]((uint64_t)self, &v144, 0.0, MinY, *((double *)&v153 + 1));
    v119 = UIRectIntegralWithScale(v115, v116, v117, v118, v9);
    -[UIListContentView _setFrame:forView:isOldFrameInvalid:]((uint64_t)self, v47, (*(_BYTE *)&self->_contentViewFlags >> 2) & 1, v119, v120, v121, v122);
  }
  else if (!self)
  {
    goto LABEL_31;
  }
  *(_BYTE *)&self->_contentViewFlags &= ~1u;
  *(_BYTE *)&self->_contentViewFlags &= ~2u;
  *(_BYTE *)&self->_contentViewFlags &= ~4u;
  if (self->_primaryTextFrameDidChangeHandler)
  {
    -[UIListContentView _primaryTextLayoutFrame](self, "_primaryTextLayoutFrame");
    v162.origin.x = v123;
    v162.origin.y = v124;
    v162.size.width = v125;
    v162.size.height = v126;
    v161.origin.x = v4;
    v161.size.width = v135;
    v161.origin.y = v136;
    v161.size.height = rect1;
    if (!CGRectEqualToRect(v161, v162))
      (*((void (**)(void))self->_primaryTextFrameDidChangeHandler + 2))();
  }
LABEL_31:

}

- (CGRect)_primaryTextLayoutFrame
{
  void *v2;
  void *v3;
  double v4;
  double v5;
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
  CGRect result;

  -[UIListContentView _textLabel]((id *)&self->super.super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D628];
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)_setFrame:(int)a3 forView:(double)a4 isOldFrameInvalid:(double)a5
{
  id v13;
  void *v14;
  _BOOL4 v15;
  id v16;
  _QWORD v17[4];
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v13 = a2;
  v14 = v13;
  if (a1)
  {
    v16 = v13;
    if (a3
      && (v15 = +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"), v14 = v16, v15))
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __57__UIListContentView__setFrame_forView_isOldFrameInvalid___block_invoke;
      v17[3] = &unk_1E16B20D8;
      v18 = v16;
      v19 = a4;
      v20 = a5;
      v21 = a6;
      v22 = a7;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v17);

    }
    else
    {
      objc_msgSend(v14, "setFrame:", a4, a5, a6, a7, v16);
    }
    v14 = v16;
  }

}

- (void)_applyConfiguration:(id *)a1
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  _QWORD *v8;
  id *v9;
  _UIListContentImageView *v10;
  _UIListContentImageView *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;

  v4 = a2;
  if (a1)
  {
    v27 = v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", sel__applyConfiguration_, a1, CFSTR("UIListContentConfiguration.m"), 1480, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

    }
    objc_storeStrong(a1 + 56, a2);
    v5 = objc_msgSend(v27, "axesPreservingSuperviewLayoutMargins");
    if ((v5 & 2) != 0)
      v6 = (v5 << 63 >> 63) & 0xA | 5;
    else
      v6 = (v5 << 63 >> 63) & 0xA;
    objc_msgSend(a1, "setEdgesPreservingSuperviewLayoutMargins:", v6);
    objc_msgSend(v27, "directionalLayoutMargins");
    objc_msgSend(a1, "setDirectionalLayoutMargins:");
    objc_msgSend(v27, "alpha");
    objc_msgSend(a1, "setAlpha:");
    v7 = a1 + 57;
    objc_msgSend(v27, "imageProperties");
    v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v9 = a1;
    v10 = (_UIListContentImageView *)*v7;
    v11 = v10;
    if (v8 && v8[2])
    {
      if (v10)
      {
        if (-[UIView isHidden](v10, "isHidden"))
        {
          -[UIImageView setHidden:](v11, "setHidden:", 0);
          v12 = 2;
        }
        else
        {
          v12 = 0;
        }
      }
      else
      {
        v11 = objc_alloc_init(_UIListContentImageView);
        objc_storeStrong(v7, v11);
        objc_msgSend(v9, "addSubview:", v11);
        v12 = 1;
      }
      -[UIListContentImageProperties _applyToImageView:]((uint64_t)v8, v11);
    }
    else if (v10 && !-[UIView isHidden](v10, "isHidden"))
    {
      -[UIImageView setHidden:](v11, "setHidden:", 1);
      v12 = 2;
    }
    else
    {
      v12 = 0;
    }

    objc_msgSend(v27, "textProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = _UIUpdateLabelUsingTextConfiguration(v9, v9 + 58, v13);

    objc_msgSend(v27, "secondaryTextProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = _UIUpdateLabelUsingTextConfiguration(v9, v9 + 59, v15);

    if (v12)
    {
      -[UIListContentView _imageView](v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        *((_BYTE *)v9 + 440) |= 1u;
      v18 = v9[63];
      if (v18)
      {
        objc_msgSend(v18, "_setLockedToOwningView:", 0);
        objc_msgSend(v9, "removeLayoutGuide:", v9[63]);
        v19 = v9[63];
        v9[63] = 0;

      }
      if (v12 == 1)
        -[UIListContentView _registerForTextLegibilityTraitChangesOnLabelOrImageView:]((uint64_t)v9, v9[57]);
    }
    if (v14)
    {
      -[UIListContentView _textLabel](v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        *((_BYTE *)v9 + 440) |= 2u;
      v21 = v9[61];
      if (v21)
      {
        objc_msgSend(v21, "_setLockedToOwningView:", 0);
        objc_msgSend(v9, "removeLayoutGuide:", v9[61]);
        v22 = v9[61];
        v9[61] = 0;

      }
      if (v14 == 1)
        -[UIListContentView _registerForTextLegibilityTraitChangesOnLabelOrImageView:]((uint64_t)v9, v9[58]);
    }
    if (v16)
    {
      -[UIListContentView _secondaryTextLabel](v9);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        *((_BYTE *)v9 + 440) |= 4u;
      v24 = v9[62];
      if (v24)
      {
        objc_msgSend(v24, "_setLockedToOwningView:", 0);
        objc_msgSend(v9, "removeLayoutGuide:", v9[62]);
        v25 = v9[62];
        v9[62] = 0;

      }
      if (v16 == 1)
        -[UIListContentView _registerForTextLegibilityTraitChangesOnLabelOrImageView:]((uint64_t)v9, v9[59]);
    }
    v9[54] = (id)0x7FEFFFFFFFFFFFFFLL;
    objc_msgSend(v9, "invalidateIntrinsicContentSize");
    objc_msgSend(v9, "setNeedsLayout");
    v4 = v27;
  }

}

- (void)_computeLayoutInfoForAvailableSpace:(double)a3
{
  double *v7;
  float64x2_t v8;
  void *v9;
  void *v10;
  int *v11;
  void *v12;
  float64_t v13;
  float64_t v14;
  uint64_t v15;
  void *v16;
  char ShouldUseAccessibilityTextWrappingLayout;
  int v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  _BOOL4 v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  unsigned __int16 *v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  _OWORD *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  _BOOL4 v57;
  double v58;
  double v59;
  _OWORD *v60;
  void *v61;
  double v62;
  double v63;
  BOOL v64;
  double v65;
  double v66;
  BOOL v67;
  char v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  uint64_t v75;
  double v76;
  double v77;
  double v78;
  double v79;
  uint64_t v80;
  double v81;
  float64x2_t v82;
  double v83;
  double v84;
  BOOL v86;
  float64x2_t v87;

  if (a2)
  {
    v7 = (double *)(a1 + 8);
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_QWORD *)(a1 + 48) = 0;
    v8 = *(float64x2_t *)MEMORY[0x1E0C9D820];
    *(_OWORD *)(a1 + 8) = *MEMORY[0x1E0C9D820];
    *(float64x2_t *)(a1 + 24) = v8;
    *(float64x2_t *)(a1 + 56) = v8;
    *(float64x2_t *)(a1 + 72) = v8;
    v82 = v8;
    *(float64x2_t *)(a1 + 88) = v8;
    objc_msgSend(a2, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIListContentView _imageView](a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = &OBJC_IVAR___UIPhysicalKeyboardEvent__originalEscapeKeyTranslationMap;
    objc_msgSend(a2[56], "imageProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "maximumSize");
    v87.f64[0] = v13;
    v87.f64[1] = v14;

    v15 = 0;
    if (_UIContentViewShouldUseAccessibilityLargeTextLayout(v9))
    {
      objc_msgSend(a2[56], "textProperties");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ShouldUseAccessibilityTextWrappingLayout = _UIContentViewShouldUseAccessibilityTextWrappingLayout(v16, v10, &v87);

      if ((ShouldUseAccessibilityTextWrappingLayout & 1) != 0)
      {
        v15 = 2;
        *(_QWORD *)a1 = 2;
        if (!v10)
        {
          v84 = *v7;
          goto LABEL_26;
        }
        v18 = 1;
        goto LABEL_9;
      }
      v15 = 1;
      *(_QWORD *)a1 = 1;
    }
    if (!v10)
      goto LABEL_24;
    v18 = 0;
LABEL_9:
    objc_msgSend(v10, "_intrinsicSizeWithinSize:", a3, a4);
    v81 = v19;
    v83 = v20;
    objc_msgSend(v10, "image");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a2[56], "imageProperties");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "reservedLayoutSize");
    v24 = _UIContentViewImageViewLayoutHeight(v21, v9, v83, v23, v87.f64[1]);
    *(double *)(a1 + 32) = v24;

    objc_msgSend(a2, "directionalLayoutMargins");
    v27 = v25 + v26;
    v28.f64[0] = a3;
    if (v24 >= v83)
      v27 = -0.0;
    v28.f64[1] = a4 + v27;
    v29.f64[0] = v81;
    v29.f64[1] = v83;
    v30 = vmaxnmq_f64(v82, vminnmq_f64(v29, (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(v87), vbslq_s8((int8x16_t)vcgtq_f64(v87, v28), (int8x16_t)v28, (int8x16_t)v87), (int8x16_t)v28)));
    v31 = v81 != v30.f64[0];
    if (v83 != v30.f64[1])
      v31 = 1;
    if (v81 > 0.0 && v31 && v83 > 0.0)
    {
      v30.f64[0] = v30.f64[0] / v81;
      v32 = v30.f64[1] / v83;
      if (v30.f64[0] < v30.f64[1] / v83)
        v32 = v30.f64[0];
      v30 = vmulq_n_f64(v29, v32);
    }
    *(float64x2_t *)v7 = v30;
    v84 = v30.f64[0];
    if (v18)
    {
      *(_QWORD *)(a1 + 40) = 0;
LABEL_26:
      objc_msgSend(a2[56], "imageToTextPadding");
      v41 = v84 + v42;
      v15 = 2;
LABEL_27:
      v43 = (_OWORD *)(a1 + 56);
      -[UIListContentView _textLabel](a2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a2[56], "textProperties");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      _UIContentViewUpdateLabelAttributesForAccessibilityLayout(v44, v45, v15, v41);

      -[UIListContentView _secondaryTextLabel](a2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a2[56], "secondaryTextProperties");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      _UIContentViewUpdateLabelAttributesForAccessibilityLayout(v46, v47, v15, 0.0);

      if (v44)
      {
        v48 = v10;
        *(_BYTE *)(a1 + 48) = 1;
        v49 = objc_msgSend(a2[56], "prefersSideBySideTextAndSecondaryText");
        if (v15 || !v49)
        {
          v50 = v9;
          v58 = -[UIListContentView _intrinsicSizeForLabel:inAvailableSpace:outRequiresMultipleLines:]((uint64_t)a2, v44, 0, a3, a4);
          v52 = *MEMORY[0x1E0C9D820];
          v53 = *(double *)(MEMORY[0x1E0C9D820] + 8);
          v54 = fmax(*MEMORY[0x1E0C9D820], fmin(v58, a3));
          v56 = fmax(v53, fmin(v59, a4));
          v57 = 1;
        }
        else
        {
          v50 = v9;
          v86 = 0;
          v51 = -[UIListContentView _intrinsicSizeForLabel:inAvailableSpace:outRequiresMultipleLines:]((uint64_t)a2, v44, &v86, a3, a4);
          v52 = *MEMORY[0x1E0C9D820];
          v53 = *(double *)(MEMORY[0x1E0C9D820] + 8);
          v54 = fmax(*MEMORY[0x1E0C9D820], fmin(v51, a3));
          v56 = fmax(v53, fmin(v55, a4));
          v57 = v86;
          *(_BYTE *)(a1 + 48) = v86;
        }
        v60 = (_OWORD *)(a1 + 88);
        *(double *)(a1 + 56) = v54;
        *(double *)(a1 + 64) = v56;
        objc_msgSend(a2[56], "textProperties");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v61, "alignment"))
        {

          if (v46 && !v57)
          {
            *v60 = *v43;
            v9 = v50;
            v10 = v48;
            v11 = &OBJC_IVAR___UIPhysicalKeyboardEvent__originalEscapeKeyTranslationMap;
            goto LABEL_44;
          }
          if (v54 < a3)
            v54 = a3;
          *(double *)v43 = v54;
        }
        else
        {

        }
        *v60 = *v43;
        v9 = v50;
        v10 = v48;
        v11 = &OBJC_IVAR___UIPhysicalKeyboardEvent__originalEscapeKeyTranslationMap;
        if (v46)
        {
          if (v57)
            goto LABEL_59;
          goto LABEL_44;
        }
      }
      else if (v46)
      {
        v54 = *(double *)v43;
LABEL_44:
        objc_msgSend(*(id *)((char *)a2 + v11[668]), "textToSecondaryTextHorizontalPadding");
        v63 = a3 - v54 - v62;
        if (v63 >= 0.0)
        {
          v86 = 0;
          v65 = -[UIListContentView _intrinsicSizeForLabel:inAvailableSpace:outRequiresMultipleLines:]((uint64_t)a2, v46, &v86, v63, a4);
          v52 = *MEMORY[0x1E0C9D820];
          v53 = *(double *)(MEMORY[0x1E0C9D820] + 8);
          *(double *)(a1 + 72) = fmax(*MEMORY[0x1E0C9D820], fmin(v65, v63));
          *(double *)(a1 + 80) = fmax(v53, fmin(v66, a4));
          v56 = *(double *)(a1 + 64);
          if (v54 == v52 && v56 == v53)
          {
            *(_BYTE *)(a1 + 48) = 0;
          }
          else
          {
            v67 = v65 <= v63 && !v86;
            v68 = !v67;
            *(_BYTE *)(a1 + 48) = v68;
            if (!v67)
              goto LABEL_59;
          }
LABEL_66:
          objc_msgSend(*(id *)((char *)a2 + v11[668]), "textToSecondaryTextHorizontalPadding");
          v79 = *(double *)(a1 + 88) + v78 + *(double *)(a1 + 72);
          if (*(double *)(a1 + 96) >= *(double *)(a1 + 80))
            v80 = *(_QWORD *)(a1 + 96);
          else
            v80 = *(_QWORD *)(a1 + 80);
          *(double *)(a1 + 88) = v79;
          *(_QWORD *)(a1 + 96) = v80;
          goto LABEL_70;
        }
        v56 = *(double *)(a1 + 64);
        v52 = *MEMORY[0x1E0C9D820];
        v53 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        v64 = v54 != *MEMORY[0x1E0C9D820];
        if (v56 != v53)
          v64 = 1;
        *(_BYTE *)(a1 + 48) = v64;
        if (!v64)
          goto LABEL_66;
LABEL_59:
        objc_msgSend(*(id *)((char *)a2 + v11[668]), "textToSecondaryTextVerticalPadding");
        v70 = a4 - v56 - v69;
        v71 = fmax(v52, fmin(-[UIListContentView _intrinsicSizeForLabel:inAvailableSpace:outRequiresMultipleLines:]((uint64_t)a2, v46, 0, a3, v70), a3));
        v73 = fmax(v53, fmin(v72, v70));
        *(double *)(a1 + 72) = v71;
        *(double *)(a1 + 80) = v73;
        objc_msgSend(*(id *)((char *)a2 + v11[668]), "secondaryTextProperties");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend(v74, "alignment");

        if (v75)
        {
          if (v71 < a3)
            v71 = a3;
          *(double *)(a1 + 72) = v71;
        }
        v76 = *(double *)(a1 + 88);
        if (v76 < v71)
          v76 = v71;
        *(double *)(a1 + 88) = v76;
        objc_msgSend(*(id *)((char *)a2 + v11[668]), "textToSecondaryTextVerticalPadding");
        *(double *)(a1 + 96) = *(double *)(a1 + 96) + v73 + v77;
      }
LABEL_70:

      return;
    }
    objc_msgSend(v10, "image");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a2[56], "imageProperties");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "reservedLayoutSize");
    v36 = (unsigned __int16 *)a2[56];
    if (v36)
      v37 = HIBYTE(v36[4]) & 1;
    else
      v37 = 0;
    v38 = _UIContentViewImageViewHorizontalCenteringOffset(v33, v9, v37, v84, v35);
    *(double *)(a1 + 40) = v38;

    v39 = v84 + v38 + v38;
    *(double *)(a1 + 24) = v39;
    objc_msgSend(a2[56], "imageToTextPadding");
    a3 = a3 - (v39 + v40);
LABEL_24:
    v41 = 0.0;
    goto LABEL_27;
  }
  *(_QWORD *)(a1 + 96) = 0;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
}

- (id)_secondaryTextLabel
{
  id *v1;
  id v2;

  if (a1)
  {
    v1 = a1;
    if ((objc_msgSend(a1[59], "isHidden") & 1) != 0)
      v2 = 0;
    else
      v2 = v1[59];
    a1 = (id *)v2;
  }
  return a1;
}

- (id)_imageView
{
  id *v1;
  id v2;

  if (a1)
  {
    v1 = a1;
    if ((objc_msgSend(a1[57], "isHidden") & 1) != 0)
      v2 = 0;
    else
      v2 = v1[57];
    a1 = (id *)v2;
  }
  return a1;
}

- (BOOL)_needsDoubleUpdateConstraintsPass
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;

  if ((*(_QWORD *)&self->super._viewFlags & 0x20000000000000) == 0)
    return 0;
  -[UIListContentView _textLabel]((id *)&self->super.super.super.isa);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[UIListContentView _secondaryTextLabel]((id *)&self->super.super.super.isa);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = -[UIListContentConfiguration prefersSideBySideTextAndSecondaryText](self->_configuration, "prefersSideBySideTextAndSecondaryText");

      if (v8)
        return 1;
    }
    else
    {

    }
  }
  -[UIListContentView _textLabel]((id *)&self->super.super.super.isa);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9
    || (v10 = (void *)v9,
        -[UIListContentView _textLabel]((id *)&self->super.super.super.isa),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "numberOfLines"),
        v11,
        v10,
        v12 == 1))
  {
    -[UIListContentView _secondaryTextLabel]((id *)&self->super.super.super.isa);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
      return 0;
    v14 = (void *)v13;
    -[UIListContentView _secondaryTextLabel]((id *)&self->super.super.super.isa);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "numberOfLines");

    if (v16 == 1)
      return 0;
  }
  return 1;
}

- (id)_textLabel
{
  id *v1;
  id v2;

  if (a1)
  {
    v1 = a1;
    if ((objc_msgSend(a1[58], "isHidden") & 1) != 0)
      v2 = 0;
    else
      v2 = v1[58];
    a1 = (id *)v2;
  }
  return a1;
}

- (double)_intrinsicSizeForLabel:(BOOL *)a3 inAvailableSpace:(double)a4 outRequiresMultipleLines:(double)a5
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  double v20;
  double v21;
  BOOL v22;
  id v23;
  double v24;
  double v25;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  _QWORD v37[4];
  id v38;
  uint64_t v39;
  double v40;
  double v41;

  v9 = a2;
  v10 = objc_msgSend(v9, "numberOfLines");
  objc_msgSend(v9, "bounds");
  if (a3)
  {
    v15 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __86__UIListContentView__intrinsicSizeForLabel_inAvailableSpace_outRequiresMultipleLines___block_invoke;
    v37[3] = &unk_1E16B1E18;
    v39 = v10;
    v16 = v11;
    v17 = v12;
    v18 = v13;
    v27 = v14;
    v19 = v9;
    v38 = v19;
    v40 = a4;
    v41 = a5;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v37);

    objc_msgSend(v19, "_intrinsicSizeWithinSize:", a4, a5);
    v21 = v20;
    *a3 = objc_msgSend(v19, "_measuredNumberOfLines") > 1;
    v22 = +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled");
    v28[0] = v15;
    v28[1] = 3221225472;
    v28[2] = __86__UIListContentView__intrinsicSizeForLabel_inAvailableSpace_outRequiresMultipleLines___block_invoke_2;
    v28[3] = &unk_1E16C10D0;
    v23 = v19;
    v30 = a1;
    v31 = v10;
    v36 = v22;
    v29 = v23;
    v32 = v16;
    v33 = v17;
    v34 = v18;
    v35 = v27;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v28);
    if (v10 == 1)
    {
      objc_msgSend(v23, "_intrinsicSizeWithinSize:", a4, a5);
      v21 = v24;
    }

  }
  else
  {
    objc_msgSend(v9, "_intrinsicSizeWithinSize:", a4, a5);
    v21 = v25;
  }

  return v21;
}

- (void)_layoutMarginsDidChangeFromOldMargins:(UIEdgeInsets)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIListContentView;
  -[UIView _layoutMarginsDidChangeFromOldMargins:](&v4, sel__layoutMarginsDidChangeFromOldMargins_, a3.top, a3.left, a3.bottom, a3.right);
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  self->_preferredMaxLayoutWidth = v8;
  v9.receiver = self;
  v9.super_class = (Class)UIListContentView;
  -[UIView _prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:](&v9, sel__prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds_, x, y, width, height);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLayoutGuide, 0);
  objc_storeStrong((id *)&self->_secondaryTextLayoutGuide, 0);
  objc_storeStrong((id *)&self->_textLayoutGuide, 0);
  objc_storeStrong(&self->_primaryTextFrameDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_secondaryTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_animatingToConfiguration, 0);
  objc_storeStrong((id *)&self->_animatingFromConfiguration, 0);
}

- (UIListContentView)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  void *v5;
  UIListContentView *v6;
  UIListContentView *v7;
  _QWORD v9[4];
  UIListContentView *v10;
  id v11;
  objc_super v12;

  v4 = coder;
  -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {

    goto LABEL_5;
  }
  v12.receiver = self;
  v12.super_class = (Class)UIListContentView;
  v6 = -[UIView initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (!v6)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__UIListContentView_initWithCoder___block_invoke;
  v9[3] = &unk_1E16B1B50;
  v7 = v6;
  v10 = v7;
  v11 = v5;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v9);

LABEL_6:
  return v7;
}

uint64_t __35__UIListContentView_initWithCoder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setConfiguration:", *(_QWORD *)(a1 + 40));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIListContentView;
  v4 = a3;
  -[UIView encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_configuration, CFSTR("configuration"), v5.receiver, v5.super_class);

}

- (id)_encodableSubviews
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *configuration;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIListContentView;
  -[UIView description](&v12, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
    configuration = self->_configuration;
    if (configuration)
    {
      -[UIListContentConfiguration _descriptionPropertiesForFullDescription:]((uint64_t)configuration, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "componentsJoinedByString:", CFSTR("; "));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v9, configuration, v10);
      configuration = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "appendFormat:", CFSTR("; configuration = %@>"), configuration);

  }
  return (NSString *)v4;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIListContentView;
  return -[UIView _shouldAnimatePropertyWithKey:](&v4, sel__shouldAnimatePropertyWithKey_, a3);
}

void __38__UIListContentView_setConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  uint64_t v4;
  id v5;
  char *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = 2;
    if (!a2)
      v4 = 1;
    v5 = *(id *)((char *)WeakRetained + OBJC_IVAR___UIListContentView__configuration[v4]);
    if (WeakRetained[56] != v5)
    {
      v6 = (char *)WeakRetained;
      -[UIListContentView _applyConfiguration:](WeakRetained, v5);
      WeakRetained = (id *)v6;
    }
  }

}

void __38__UIListContentView_setConfiguration___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)WeakRetained[53];
    WeakRetained[53] = 0;

    v2 = (void *)WeakRetained[52];
    WeakRetained[52] = 0;

  }
}

uint64_t __38__UIListContentView_setConfiguration___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animationCompletedWithPosition:");
}

- (void)_registerForTextLegibilityTraitChangesOnLabelOrImageView:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v6[0] = 0x1E1A995A0;
  v6[1] = 0x1E1A99540;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "_registerForTraitTokenChanges:withTarget:action:", v4, a1, sel__textLegibilityOrContentSizeTraitsChanged);

}

- (void)_textLegibilityOrContentSizeTraitsChanged
{
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  if (a3.width <= 0.0)
    a3.width = 1.79769313e308;
  if (a3.height <= 0.0)
    a3.height = 1.79769313e308;
  -[UIListContentView _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

uint64_t __57__UIListContentView__setFrame_forView_isOldFrameInvalid___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (UILayoutGuide)secondaryTextLayoutGuide
{
  void *v3;
  UILayoutGuide *v4;
  UILayoutGuide *secondaryTextLayoutGuide;
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
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  if (!self->_secondaryTextLayoutGuide)
  {
    -[UIListContentView _secondaryTextLabel]((id *)&self->super.super.super.isa);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = objc_alloc_init(UILayoutGuide);
      secondaryTextLayoutGuide = self->_secondaryTextLayoutGuide;
      self->_secondaryTextLayoutGuide = v4;

      -[UIView addLayoutGuide:](self, "addLayoutGuide:", self->_secondaryTextLayoutGuide);
      -[UILayoutGuide setIdentifier:](self->_secondaryTextLayoutGuide, "setIdentifier:", CFSTR("UIListContentViewSecondaryTextLayoutGuide"));
      -[UILayoutGuide _setLockedToOwningView:](self->_secondaryTextLayoutGuide, "_setLockedToOwningView:", 1);
      -[UILayoutGuide leadingAnchor](self->_secondaryTextLayoutGuide, "leadingAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIListContentView _secondaryTextLabel]((id *)&self->super.super.super.isa);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "leadingAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "constraintEqualToAnchor:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setIdentifier:", CFSTR("UIListContentView-leading-secondaryTextLayoutGuide-constraint"));
      -[UILayoutGuide trailingAnchor](self->_secondaryTextLayoutGuide, "trailingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIListContentView _secondaryTextLabel]((id *)&self->super.super.super.isa);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "trailingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "setIdentifier:", CFSTR("UIListContentView-trailing-secondaryTextLayoutGuide-constraint"));
      -[UILayoutGuide topAnchor](self->_secondaryTextLayoutGuide, "topAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIListContentView _secondaryTextLabel]((id *)&self->super.super.super.isa);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "topAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "setIdentifier:", CFSTR("UIListContentView-top-secondaryTextLayoutGuide-constraint"));
      -[UILayoutGuide bottomAnchor](self->_secondaryTextLayoutGuide, "bottomAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIListContentView _secondaryTextLabel]((id *)&self->super.super.super.isa);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bottomAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "setIdentifier:", CFSTR("UIListContentView-bottom-secondaryTextLayoutGuide-constraint"));
      v24[0] = v9;
      v24[1] = v13;
      v24[2] = v17;
      v24[3] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide _setSystemConstraints:](self->_secondaryTextLayoutGuide, "_setSystemConstraints:", v22);
      objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v22);

    }
  }
  return self->_secondaryTextLayoutGuide;
}

- (UILayoutGuide)imageLayoutGuide
{
  void *v3;
  UILayoutGuide *v4;
  UILayoutGuide *imageLayoutGuide;
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
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  if (!self->_imageLayoutGuide)
  {
    -[UIListContentView _imageView]((id *)&self->super.super.super.isa);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = objc_alloc_init(UILayoutGuide);
      imageLayoutGuide = self->_imageLayoutGuide;
      self->_imageLayoutGuide = v4;

      -[UIView addLayoutGuide:](self, "addLayoutGuide:", self->_imageLayoutGuide);
      -[UILayoutGuide setIdentifier:](self->_imageLayoutGuide, "setIdentifier:", CFSTR("UIListContentViewImageLayoutGuide"));
      -[UILayoutGuide _setLockedToOwningView:](self->_imageLayoutGuide, "_setLockedToOwningView:", 1);
      -[UILayoutGuide leadingAnchor](self->_imageLayoutGuide, "leadingAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIListContentView _imageView]((id *)&self->super.super.super.isa);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "leadingAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "constraintEqualToAnchor:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setIdentifier:", CFSTR("UIListContentView-leading-imageLayoutGuide-constraint"));
      -[UILayoutGuide trailingAnchor](self->_imageLayoutGuide, "trailingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIListContentView _imageView]((id *)&self->super.super.super.isa);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "trailingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setIdentifier:", CFSTR("UIListContentView-trailing-imageLayoutGuide-constraint"));
      -[UILayoutGuide topAnchor](self->_imageLayoutGuide, "topAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIListContentView _imageView]((id *)&self->super.super.super.isa);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "topAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setIdentifier:", CFSTR("UIListContentView-top-imageLayoutGuide-constraint"));
      -[UILayoutGuide bottomAnchor](self->_imageLayoutGuide, "bottomAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIListContentView _imageView]((id *)&self->super.super.super.isa);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bottomAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setIdentifier:", CFSTR("UIListContentView-bottom-imageLayoutGuide-constraint"));
      v24[0] = v9;
      v24[1] = v13;
      v24[2] = v17;
      v24[3] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide _setSystemConstraints:](self->_imageLayoutGuide, "_setSystemConstraints:", v22);
      objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v22);

    }
  }
  return self->_imageLayoutGuide;
}

- (NSLayoutRect)_primaryTextLayoutRect
{
  void *v2;
  void *v3;

  -[UIListContentView _textLabel]((id *)&self->super.super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_layoutRect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSLayoutRect *)v3;
}

- (id)_primaryTextFrameDidChangeHandler
{
  return self->_primaryTextFrameDidChangeHandler;
}

@end
