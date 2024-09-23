@implementation _UISystemBackgroundView

- (_UIBackgroundConfigurationInternal)configuration
{
  return (_UIBackgroundConfigurationInternal *)(id)-[_UIBackgroundConfigurationInternal copyWithZone:](self->_configuration, "copyWithZone:", 0);
}

- (void)setConfiguration:(id)a3
{
  id v5;
  _UIBackgroundConfigurationInternal *v6;
  _UIBackgroundConfigurationInternal *v7;
  _UIBackgroundConfigurationInternal *configuration;
  __objc2_class **v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void (**v16)(void *, uint64_t, _QWORD);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  UIVisualEffectView *v25;
  void *v26;
  void *v27;
  UIVisualEffectView *visualEffectView;
  void *v29;
  void *v30;
  id v31;
  UIVisualEffectView *v32;
  void (**v33)(void *, uint64_t, _QWORD);
  int v34;
  int v35;
  int v36;
  int v37;
  UIView *v38;
  void *v39;
  UIView *colorView;
  void *v41;
  id v42;
  UIView *v43;
  void (**v44)(void *, uint64_t, _QWORD);
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  int v50;
  int v51;
  int v52;
  __objc2_class *v53;
  _UIBackgroundConfigurationInternal *v54;
  _UISystemBackgroundStrokeView *v55;
  _UISystemBackgroundStrokeView *strokeView;
  _UISystemBackgroundStrokeView *v57;
  void (**v58)(void *, uint64_t, _QWORD);
  void *v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  UIView *v69;
  UIView *shadowView;
  UIView *v71;
  void (**v72)(void *, uint64_t, _QWORD);
  UIImageView *v73;
  UIImageView *imageView;
  UIImageView *v75;
  void (**v76)(void *, uint64_t, _QWORD);
  void *v77;
  void *v78;
  void *v79;
  _UIBackgroundConfigurationInternal *v80;
  _QWORD v81[5];
  _UIBackgroundConfigurationInternal *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  _UISystemBackgroundView *v87;
  id v88;
  uint64_t aBlock;
  uint64_t v90;
  void *v91;
  void *v92;
  _UISystemBackgroundView *v93;
  _UISystemBackgroundView *v94;
  id v95;
  id v96;
  id v97;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemBackgroundView.m"), 223, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration != nil"));

  }
  if ((-[_UIBackgroundConfigurationInternal _isEqualToInternalConfigurationQuick:](self->_configuration, "_isEqualToInternalConfigurationQuick:", v5) & 1) == 0)
  {
    v6 = self->_configuration;
    v7 = (_UIBackgroundConfigurationInternal *)objc_msgSend(v5, "copyWithZone:", 0);
    configuration = self->_configuration;
    self->_configuration = v7;

    v9 = off_1E167B000;
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      v81[0] = MEMORY[0x1E0C809B0];
      v81[1] = 3221225472;
      v81[2] = __44___UISystemBackgroundView_setConfiguration___block_invoke;
      v81[3] = &unk_1E16B5568;
      v81[4] = self;
      v82 = v6;
      +[UIView _addCompletionWithPosition:](UIView, "_addCompletionWithPosition:", v81);

    }
    -[_UIBackgroundConfigurationInternal customView](v6, "customView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "customView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    v13 = v11;
    v14 = v13;
    if (v12 != v13)
    {
      v15 = MEMORY[0x1E0C809B0];
      if (v13)
      {
        v83 = MEMORY[0x1E0C809B0];
        v84 = 3221225472;
        v85 = __66___UISystemBackgroundView__transitionFromCustomView_toCustomView___block_invoke;
        v86 = &unk_1E16B1B50;
        v87 = self;
        v88 = v13;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &v83);

      }
      objc_msgSend(v14, "setAlpha:", 1.0);
      objc_msgSend(v12, "setAlpha:", 0.0);
      aBlock = v15;
      v90 = 3221225472;
      v91 = __66___UISystemBackgroundView__transitionFromCustomView_toCustomView___block_invoke_2;
      v92 = &unk_1E16B7A10;
      v93 = (_UISystemBackgroundView *)v12;
      v94 = self;
      v95 = v14;
      v16 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(&aBlock);
      v9 = off_1E167B000;
      if (!+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled")|| !+[UIView _addCompletionWithPosition:](UIView, "_addCompletionWithPosition:", v16))
      {
        v16[2](v16, 1, 0);
      }

    }
    -[_UIBackgroundConfigurationInternal visualEffect](v6, "visualEffect");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visualEffect");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackgroundConfigurationInternal __visualEffectGroupName](v6, "__visualEffectGroupName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "__visualEffectGroupName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v6;
    -[_UIBackgroundConfigurationInternal __visualEffectblurClippingMode](v6, "__visualEffectblurClippingMode");
    objc_msgSend(v5, "__visualEffectblurClippingMode");
    v21 = v17;
    v22 = v18;
    v23 = v19;
    v24 = v20;
    if (!v21 && v22)
    {
      v83 = MEMORY[0x1E0C809B0];
      v84 = 3221225472;
      v85 = __136___UISystemBackgroundView__transitionFromVisualEffect_toVisualEffect_oldGroupName_newGroupName_oldblurClippingMode_newblurClippingMode___block_invoke;
      v86 = &unk_1E16B1B28;
      v87 = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &v83);
    }
    -[UIVisualEffectView setEffect:](self->_visualEffectView, "setEffect:", v22);
    -[UIVisualEffectView _setGroupName:](self->_visualEffectView, "_setGroupName:", v24);
    v78 = v22;
    v79 = v21;
    if (v21 && !v22)
    {
      v25 = self->_visualEffectView;
      -[UIVisualEffectView contentView](v25, "contentView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "backgroundColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      visualEffectView = self->_visualEffectView;
      self->_visualEffectView = 0;

      -[UIVisualEffectView setEffect:](v25, "setEffect:", 0);
      +[UIColor clearColor](UIColor, "clearColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView contentView](v25, "contentView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setBackgroundColor:", v29);

      v21 = v79;
      aBlock = MEMORY[0x1E0C809B0];
      v90 = 3221225472;
      v91 = __136___UISystemBackgroundView__transitionFromVisualEffect_toVisualEffect_oldGroupName_newGroupName_oldblurClippingMode_newblurClippingMode___block_invoke_2;
      v92 = &unk_1E16B7A38;
      v93 = self;
      v94 = (_UISystemBackgroundView *)v25;
      v95 = v79;
      v96 = v23;
      v31 = v27;
      v97 = v31;
      v32 = v25;
      v33 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(&aBlock);
      if (!+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled")|| !+[UIView _addCompletionWithPosition:](UIView, "_addCompletionWithPosition:", v33))
      {
        v33[2](v33, 1, 0);
      }

      v9 = off_1E167B000;
    }

    v34 = -[_UIBackgroundConfigurationInternal _hasBackgroundColor](v80, "_hasBackgroundColor");
    if (v21)
      v35 = 0;
    else
      v35 = v34;
    v36 = objc_msgSend(v5, "_hasBackgroundColor");
    if (v22)
      v37 = 0;
    else
      v37 = v36;
    if ((v35 & 1) == 0 && v37)
    {
      v83 = MEMORY[0x1E0C809B0];
      v84 = 3221225472;
      v85 = __70___UISystemBackgroundView__transitionFromHadColorView_toHasColorView___block_invoke;
      v86 = &unk_1E16B1B28;
      v87 = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &v83);
    }
    -[_UISystemBackgroundView _updateBackgroundColor]((uint64_t)self);
    if (((v37 | v35 ^ 1) & 1) == 0)
    {
      v38 = self->_colorView;
      -[UIView backgroundColor](v38, "backgroundColor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      colorView = self->_colorView;
      self->_colorView = 0;

      +[UIColor clearColor](UIColor, "clearColor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v38, "setBackgroundColor:", v41);

      aBlock = MEMORY[0x1E0C809B0];
      v90 = 3221225472;
      v91 = __70___UISystemBackgroundView__transitionFromHadColorView_toHasColorView___block_invoke_2;
      v92 = &unk_1E16B7A10;
      v93 = self;
      v94 = (_UISystemBackgroundView *)v38;
      v42 = v39;
      v95 = v42;
      v43 = v38;
      v44 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(&aBlock);
      if (!+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled")|| !+[UIView _addCompletionWithPosition:](UIView, "_addCompletionWithPosition:", v44))
      {
        v44[2](v44, 1, 0);
      }

      v9 = off_1E167B000;
    }
    -[_UIBackgroundConfigurationInternal image](v80, "image");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "image");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v45;
    v48 = v46;
    v49 = v48;
    if (v47 || !v48)
    {
      if (!v48)
      {
        if (v47)
        {
          v73 = self->_imageView;
          imageView = self->_imageView;
          self->_imageView = 0;

          -[UIView setAlpha:](v73, "setAlpha:", 0.0);
          aBlock = MEMORY[0x1E0C809B0];
          v90 = 3221225472;
          v91 = __56___UISystemBackgroundView__transitionFromImage_toImage___block_invoke_2;
          v92 = &unk_1E16B5568;
          v93 = self;
          v94 = (_UISystemBackgroundView *)v73;
          v75 = v73;
          v76 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(&aBlock);
          if (!+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled")|| !+[UIView _addCompletionWithPosition:](UIView, "_addCompletionWithPosition:", v76))
          {
            v76[2](v76, 1, 0);
          }

          v9 = off_1E167B000;
        }
        goto LABEL_41;
      }
    }
    else
    {
      aBlock = MEMORY[0x1E0C809B0];
      v90 = 3221225472;
      v91 = __56___UISystemBackgroundView__transitionFromImage_toImage___block_invoke;
      v92 = &unk_1E16B1B50;
      v93 = self;
      v94 = (_UISystemBackgroundView *)v48;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &aBlock);

    }
    -[UIImageView setImage:](self->_imageView, "setImage:", v49);
    -[UIImageView setContentMode:](self->_imageView, "setContentMode:", -[_UIBackgroundConfigurationInternal imageContentMode](self->_configuration, "imageContentMode"));
    -[UIView setAlpha:](self->_imageView, "setAlpha:", 1.0);
LABEL_41:

    v50 = -[_UIBackgroundConfigurationInternal _hasStroke](v80, "_hasStroke");
    v51 = objc_msgSend(v5, "_hasStroke");
    v52 = v51;
    if ((v50 & 1) == 0 && v51)
    {
      v53 = v9[372];
      v83 = MEMORY[0x1E0C809B0];
      v84 = 3221225472;
      v85 = __64___UISystemBackgroundView__transitionFromHadStroke_toHasStroke___block_invoke;
      v86 = &unk_1E16B1B28;
      v87 = self;
      -[__objc2_class performWithoutAnimation:](v53, "performWithoutAnimation:", &v83);
    }
    v54 = v80;
    -[_UIBackgroundConfigurationInternal strokeWidth](self->_configuration, "strokeWidth");
    -[_UISystemBackgroundStrokeView setStrokeWidth:](self->_strokeView, "setStrokeWidth:");
    -[_UISystemBackgroundView _updateStrokeColor]((uint64_t)self);
    if (((v52 | v50 ^ 1) & 1) == 0)
    {
      v55 = self->_strokeView;
      strokeView = self->_strokeView;
      self->_strokeView = 0;

      aBlock = MEMORY[0x1E0C809B0];
      v90 = 3221225472;
      v91 = __64___UISystemBackgroundView__transitionFromHadStroke_toHasStroke___block_invoke_2;
      v92 = &unk_1E16B5568;
      v93 = self;
      v94 = (_UISystemBackgroundView *)v55;
      v57 = v55;
      v58 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(&aBlock);
      if (!-[__objc2_class _isInAnimationBlockWithAnimationsEnabled](v9[372], "_isInAnimationBlockWithAnimationsEnabled")|| (-[__objc2_class _addCompletionWithPosition:](v9[372], "_addCompletionWithPosition:", v58) & 1) == 0)
      {
        v58[2](v58, 1, 0);
      }

    }
    -[_UIBackgroundConfigurationInternal _shadowProperties](v80, "_shadowProperties");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_shadowProperties");
    v60 = (id)objc_claimAutoreleasedReturnValue();
    v61 = v59;
    v62 = objc_msgSend(v61, "_backgroundConfigurationShadowType");
    v63 = objc_msgSend(v60, "_backgroundConfigurationShadowType");
    if (v62 == 3)
      v64 = 0;
    else
      v64 = v61;
    if (v63 == 3)
      v65 = 0;
    else
      v65 = v60;
    v66 = v64;
    v67 = v65;
    v68 = v67;
    if (!v66 && v67)
    {
      v83 = MEMORY[0x1E0C809B0];
      v84 = 3221225472;
      v85 = __93___UISystemBackgroundView__transitionViewBasedShadowFromShadowProperties_toShadowProperties___block_invoke;
      v86 = &unk_1E16B1B28;
      v87 = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &v83);
    }
    -[UIView setAlpha:](self->_shadowView, "setAlpha:", 1.0);
    -[_UISystemBackgroundView _updateShadowViewProperties]((uint64_t)self);
    if (v66 && !v68)
    {
      v69 = self->_shadowView;
      -[UIView setAlpha:](v69, "setAlpha:", 0.0);
      shadowView = self->_shadowView;
      self->_shadowView = 0;

      aBlock = MEMORY[0x1E0C809B0];
      v90 = 3221225472;
      v91 = __93___UISystemBackgroundView__transitionViewBasedShadowFromShadowProperties_toShadowProperties___block_invoke_2;
      v92 = &unk_1E16B5568;
      v93 = self;
      v94 = (_UISystemBackgroundView *)v69;
      v71 = v69;
      v72 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(&aBlock);
      if (!+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled")|| !+[UIView _addCompletionWithPosition:](UIView, "_addCompletionWithPosition:", v72))
      {
        v72[2](v72, 1, 0);
      }

      v54 = v80;
    }

    -[_UISystemBackgroundView _updateCornerMaskingForType:]((uint64_t)self, 6);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      -[UIView layoutIfNeeded](self, "layoutIfNeeded");
    }

  }
}

- (void)_updateCornerMaskingForType:(uint64_t)a1
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  uint64_t v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v13;
  double v14;
  double v15;
  double v17;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t m;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t n;
  void *v62;
  double v63;
  uint64_t v64;
  _BOOL4 v65;
  _BOOL4 v66;
  _BOOL4 v67;
  _BOOL4 v68;
  _BOOL4 v69;
  _BOOL4 v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;

  v97 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  if (a2 == 6)
  {
    v70 = 1;
    v3 = 1;
    v4 = 1;
    v5 = 1;
    v6 = 1;
    v7 = 1;
  }
  else
  {
    v7 = a2 == 4;
    v6 = a2 == 1;
    v5 = a2 == 0;
    v4 = a2 == 2;
    v3 = a2 == 3;
    v70 = a2 == 5;
  }
  v8 = objc_msgSend(*(id *)(a1 + 480), "__maskedCorners");
  v71 = objc_msgSend(*(id *)(a1 + 480), "_strokeLocation");
  objc_msgSend((id)a1, "bounds");
  x = v98.origin.x;
  y = v98.origin.y;
  width = v98.size.width;
  height = v98.size.height;
  v13 = CGRectGetWidth(v98);
  v99.origin.x = x;
  v99.origin.y = y;
  v99.size.width = width;
  v99.size.height = height;
  v14 = CGRectGetHeight(v99);
  if (v13 >= v14)
    v15 = v14;
  else
    v15 = v13;
  if ((~(_BYTE)v8 & 3) == 0 || (v8 & 0xC) == 12)
  {
    v100.origin.x = x;
    v100.origin.y = y;
    v100.size.width = width;
    v100.size.height = height;
    v17 = CGRectGetWidth(v100) * 0.5;
    if (v15 >= v17)
      v15 = v17;
  }
  if ((~(_DWORD)v8 & 5) == 0 || (v8 & 0xA) == 10)
  {
    v101.origin.x = x;
    v101.origin.y = y;
    v101.size.width = width;
    v101.size.height = height;
    v19 = CGRectGetHeight(v101) * 0.5;
    if (v15 >= v19)
      v15 = v19;
  }
  objc_msgSend(*(id *)(a1 + 480), "cornerRadius");
  if (v20 <= v15)
    v21 = v20;
  else
    v21 = v15;
  if (v8 != 15)
    goto LABEL_28;
  if (vabdd_f64(v21, v15) > 0.1)
    goto LABEL_28;
  v102.origin.x = x;
  v102.origin.y = y;
  v102.size.width = width;
  v102.size.height = height;
  v22 = CGRectGetWidth(v102);
  v103.origin.x = x;
  v103.origin.y = y;
  v103.size.width = width;
  v103.size.height = height;
  if (vabdd_f64(v22, CGRectGetHeight(v103)) <= 0.1)
  {
    v23 = 0;
    if (!v7)
      goto LABEL_44;
  }
  else
  {
LABEL_28:
    v23 = 1;
    if (!v7)
      goto LABEL_44;
  }
  if (v21 > 0.0 || (*(_BYTE *)(a1 + 472) & 2) != 0)
  {
    v65 = v6;
    v66 = v3;
    v67 = v4;
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    -[_UISystemBackgroundView _internalSubviewsOfType:]((unsigned __int8 *)a1, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v88, v96, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v89;
      v28 = (uint64_t *)MEMORY[0x1E0CD2A68];
      if (!(_DWORD)v23)
        v28 = (uint64_t *)MEMORY[0x1E0CD2A60];
      v29 = *v28;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v89 != v27)
            objc_enumerationMutation(v24);
          v31 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
          *(_BYTE *)(a1 + 472) |= 2u;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v31, "_setCornerRadius:continuous:maskedCorners:", v23, v8, v21);
          }
          else
          {
            objc_msgSend(v31, "layer");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setMasksToBounds:", 1);
            objc_msgSend(v32, "setMaskedCorners:", v8);
            objc_msgSend(v32, "setCornerCurve:", v29);
            objc_msgSend(v32, "setCornerRadius:", v21);

          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v88, v96, 16);
      }
      while (v26);
    }

    v4 = v67;
    v6 = v65;
    v3 = v66;
  }
LABEL_44:
  if (!v6)
  {
    if (!v4)
      goto LABEL_46;
LABEL_61:
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    -[_UISystemBackgroundView _internalSubviewsOfType:]((unsigned __int8 *)a1, 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v81;
      do
      {
        for (j = 0; j != v46; ++j)
        {
          if (*(_QWORD *)v81 != v47)
            objc_enumerationMutation(v44);
          objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * j), "_setCornerRadius:continuous:maskedCorners:", v23, v8, v21);
        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v80, v94, 16);
      }
      while (v46);
    }

    if (!v3)
      goto LABEL_79;
    goto LABEL_69;
  }
  v68 = v4;
  v69 = v5;
  v33 = v3;
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  -[_UISystemBackgroundView _internalSubviewsOfType:]((unsigned __int8 *)a1, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v85;
    v38 = (uint64_t *)MEMORY[0x1E0CD2A60];
    if ((_DWORD)v23)
      v38 = (uint64_t *)MEMORY[0x1E0CD2A68];
    v39 = *v38;
    do
    {
      for (k = 0; k != v36; ++k)
      {
        if (*(_QWORD *)v85 != v37)
          objc_enumerationMutation(v34);
        objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * k), "layer");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v41;
        if (v21 <= 0.0)
          v43 = objc_msgSend(v41, "masksToBounds");
        else
          v43 = 1;
        objc_msgSend(v42, "setMasksToBounds:", v43);
        objc_msgSend(v42, "setMaskedCorners:", v8);
        objc_msgSend(v42, "setCornerCurve:", v39);
        objc_msgSend(v42, "setCornerRadius:", v21);

      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
    }
    while (v36);
  }

  v3 = v33;
  v5 = v69;
  if (v68)
    goto LABEL_61;
LABEL_46:
  if (v3)
  {
LABEL_69:
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    -[_UISystemBackgroundView _internalSubviewsOfType:]((unsigned __int8 *)a1, 3);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v76, v93, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v77;
      v53 = (uint64_t *)MEMORY[0x1E0CD2A60];
      if ((_DWORD)v23)
        v53 = (uint64_t *)MEMORY[0x1E0CD2A68];
      v54 = *v53;
      do
      {
        for (m = 0; m != v51; ++m)
        {
          if (*(_QWORD *)v77 != v52)
            objc_enumerationMutation(v49);
          objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * m), "layer");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setMasksToBounds:", 1);
          objc_msgSend(v56, "setMaskedCorners:", v8);
          objc_msgSend(v56, "setCornerCurve:", v54);
          objc_msgSend(v56, "setCornerRadius:", v21);

        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v76, v93, 16);
      }
      while (v51);
    }

  }
LABEL_79:
  if (v70)
  {
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    -[_UISystemBackgroundView _internalSubviewsOfType:]((unsigned __int8 *)a1, 5);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v72, v92, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v73;
      do
      {
        for (n = 0; n != v59; ++n)
        {
          if (*(_QWORD *)v73 != v60)
            objc_enumerationMutation(v57);
          v62 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * n);
          objc_msgSend(*(id *)(a1 + 480), "strokeOutset");
          objc_msgSend(v62, "setStrokeCornerRadius:", fmax(v21 + v63, 0.0));
          v64 = v8;
          switch(v71)
          {
            case 0:
              break;
            case 1:
              v64 = 0;
              break;
            case 2:
              v64 = 3;
              break;
            case 3:
              v64 = 12;
              break;
            default:
              v64 = 15;
              break;
          }
          objc_msgSend(v62, "setMaskedCorners:", v64);
          objc_msgSend(v62, "setUseContinuousCurve:", v23);
        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v72, v92, 16);
      }
      while (v59);
    }

  }
  *(double *)(a1 + 456) = v21;
  *(_BYTE *)(a1 + 472) = *(_BYTE *)(a1 + 472) & 0xFE | v23;
  if (v5)
    -[_UISystemBackgroundView _updateShadowViewProperties](a1);
}

- (id)_internalSubviewsOfType:(unsigned __int8 *)a1
{
  unsigned __int8 *v3;
  unsigned __int8 *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a1 + 464;
  if (a2 <= 0)
  {
    v6 = 0;
    v7 = *v3;
  }
  else
  {
    v5 = &v3[a2];
    v6 = *(v5 - 1);
    v7 = *v5;
    if (v6 > v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "subviews");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel__internalSubviewsOfType_, a1, CFSTR("_UISystemBackgroundView.m"), 133, CFSTR("Subview insertion indices are invalid (type=%ld, start=%ld, end=%ld). View: %@; Subviews: %@"),
        a2,
        v6,
        v7,
        a1,
        v9);

    }
  }
  if (v7 == v6)
    return MEMORY[0x1E0C9AA60];
  objc_msgSend(a1, "subviews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count") < v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v11, "count");
    objc_msgSend(a1, "subviews");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel__internalSubviewsOfType_, a1, CFSTR("_UISystemBackgroundView.m"), 139, CFSTR("Subview insertion index %ld exceeds subviews count %ld: View: %@; Subviews: %@"),
      v7,
      v16,
      a1,
      v17);

  }
  if (v7 - v6 == 1)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7 - v6);
    if (v7 > v6)
    {
      do
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v14);

        ++v6;
      }
      while (v7 != v6);
    }
  }

  return v13;
}

- (void)_removeInternalSubview:(uint64_t)a3 ofType:
{
  id v5;
  _BYTE *v6;
  char v7;
  uint64_t v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a2;
  if (a1)
  {
    v12 = v5;
    v6 = (id)objc_msgSend(v5, "superview");
    v5 = v12;
    if (v6)
    {
      if (v6 != a1)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel__removeInternalSubview_ofType_, a1, CFSTR("_UISystemBackgroundView.m"), 184, CFSTR("Attempted to remove an internal subview whose superview is not self. View: %@; Superview: %@"),
          v12,
          v6);

      }
      v7 = a1[472];
      a1[472] = v7 | 4;
      objc_msgSend(v12, "removeFromSuperview");
      v5 = v12;
      a1[472] = a1[472] & 0xFB | v7 & 4;
      v8 = a3;
      do
      {
        v9 = a1[v8 + 464];
        if (!v9)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__removeInternalSubview_ofType_, a1, CFSTR("_UISystemBackgroundView.m"), 192, CFSTR("Subviews are out-of-sync with insertion indices: insertion index for type %ld is invalid after adjusting due to remove of internal subview with type %ld. Subview: %@"), v8, a3, v12);

          v5 = v12;
          v9 = a1[v8 + 464];
        }
        a1[v8++ + 464] = v9 - 1;
      }
      while (v8 != 6);
    }
  }

}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)_UISystemBackgroundView;
  -[UIView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  -[UIView frame](self, "frame");
  if (v9 != v13 || v11 != v12)
    -[_UISystemBackgroundView _updateCornerMaskingForType:]((uint64_t)self, 6);
}

- (CGRect)frameInContainerView:(id)a3
{
  id v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
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
  double v44;
  double v45;
  double v46;
  void *v47;
  CGRect result;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemBackgroundView.m"), 818, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containerView != nil"));

  }
  v6 = objc_msgSend(v5, "_shouldReverseLayoutDirection");
  -[_UIBackgroundConfigurationInternal backgroundInsets](self->_configuration, "backgroundInsets");
  v10 = v9;
  v12 = v11;
  if (v6)
    v13 = v8;
  else
    v13 = v7;
  if (v6)
    v14 = v7;
  else
    v14 = v8;
  v15 = -[_UIBackgroundConfigurationInternal edgesAddingLayoutMarginsToBackgroundInsets](self->_configuration, "edgesAddingLayoutMarginsToBackgroundInsets");
  if (v15)
  {
    v16 = v15;
    v17 = 2;
    if (v6)
      v18 = 8;
    else
      v18 = 2;
    if (!v6)
      v17 = 8;
    v19 = v18 & (v15 << 62 >> 63) | v17 & (v15 << 60 >> 63);
    objc_msgSend(v5, "layoutMargins");
    if ((v16 & 1) == 0)
      v20 = -0.0;
    v10 = v10 + v20;
    if ((v19 & 2) != 0)
      v24 = v21;
    else
      v24 = -0.0;
    v13 = v13 + v24;
    if ((v16 & 4) != 0)
      v25 = v22;
    else
      v25 = -0.0;
    v12 = v12 + v25;
    if (v19 >= 8)
      v26 = v23;
    else
      v26 = -0.0;
    v14 = v14 + v26;
  }
  objc_msgSend(v5, "bounds");
  v28 = v13 + v27;
  v30 = v10 + v29;
  v32 = v31 - (v14 + v13);
  v34 = v33 - (v12 + v10);
  objc_msgSend(v5, "_currentScreenScale");
  v36 = UIRectIntegralWithScale(v28, v30, v32, v34, v35);
  v38 = v37;
  v40 = v39;
  v42 = v41;

  v43 = v36;
  v44 = v38;
  v45 = v40;
  v46 = v42;
  result.size.height = v46;
  result.size.width = v45;
  result.origin.y = v44;
  result.origin.x = v43;
  return result;
}

- (_UISystemBackgroundView)initWithConfiguration:(id)a3
{
  id v4;
  _UISystemBackgroundView *v5;
  _UISystemBackgroundView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISystemBackgroundView;
  v5 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
    -[_UISystemBackgroundView setConfiguration:](v5, "setConfiguration:", v4);

  return v6;
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UISystemBackgroundView;
  -[UIView tintColorDidChange](&v5, sel_tintColorDidChange);
  -[_UIBackgroundConfigurationInternal backgroundColor](self->_configuration, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[_UISystemBackgroundView _updateBackgroundColor]((uint64_t)self);
  -[_UIBackgroundConfigurationInternal strokeColor](self->_configuration, "strokeColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[_UISystemBackgroundView _updateStrokeColor]((uint64_t)self);
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UISystemBackgroundView;
  -[UIView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[_UISystemBackgroundView _updateBackgroundColor]((uint64_t)self);
  -[_UISystemBackgroundView _updateStrokeColor]((uint64_t)self);
  -[_UISystemBackgroundView _updateShadowViewProperties]((uint64_t)self);
}

- (void)_updateStrokeColor
{
  void *v2;
  void *v3;
  id v4;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 440))
    {
      v2 = *(void **)(a1 + 480);
      objc_msgSend((id)a1, "tintColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "resolvedStrokeColorForTintColor:", v3);
      v4 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 440), "setStrokeColor:", v4);
    }
  }
}

- (void)_updateBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (a1)
  {
    v2 = *(void **)(a1 + 480);
    objc_msgSend((id)a1, "tintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "resolvedBackgroundColorForTintColor:", v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v4 = *(void **)(a1 + 424);
    if (v4)
    {
      objc_msgSend(v4, "contentView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBackgroundColor:", v6);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 416), "setBackgroundColor:", v6);
    }

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UISystemBackgroundView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[_UISystemBackgroundView _layoutCustomView]((unsigned __int8 *)self);
  -[_UISystemBackgroundView _layoutColorView]((unsigned __int8 *)self);
  -[_UISystemBackgroundView _layoutVisualEffectView]((unsigned __int8 *)self);
  -[_UISystemBackgroundView _layoutImageView]((unsigned __int8 *)self);
  -[_UISystemBackgroundView _layoutStrokeView]((id *)&self->super.super.super.isa);
  -[_UISystemBackgroundView _layoutShadowView]((unsigned __int8 *)self);
}

- (void)_layoutColorView
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    -[_UISystemBackgroundView _internalSubviewsOfType:](a1, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          objc_msgSend(a1, "bounds", (_QWORD)v8);
          objc_msgSend(v7, "setFrame:");
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)_layoutCustomView
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    -[_UISystemBackgroundView _internalSubviewsOfType:](a1, 4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          objc_msgSend(a1, "bounds", (_QWORD)v8);
          objc_msgSend(v7, "setFrame:");
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)_layoutVisualEffectView
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    -[_UISystemBackgroundView _internalSubviewsOfType:](a1, 2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          objc_msgSend(a1, "bounds", (_QWORD)v8);
          objc_msgSend(v7, "setFrame:");
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)_layoutStrokeView
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1[60], "strokeOutset");
    v3 = v2;
    objc_msgSend(a1, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[_UISystemBackgroundView _internalSubviewsOfType:]((unsigned __int8 *)a1, 5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = -v3 - v3;
      v16 = v11 - v15;
      v17 = v9 - v15;
      v18 = v7 - v3;
      v19 = v5 - v3;
      v20 = *(_QWORD *)v23;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v21++), "setFrame:", v19, v18, v17, v16, (_QWORD)v22);
        }
        while (v14 != v21);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v14);
    }

  }
}

- (void)_layoutShadowView
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    -[_UISystemBackgroundView _internalSubviewsOfType:](a1, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          objc_msgSend(a1, "bounds", (_QWORD)v8);
          objc_msgSend(v7, "setFrame:");
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

    -[_UISystemBackgroundView _updateShadowViewProperties]((uint64_t)a1);
  }
}

- (void)_layoutImageView
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    -[_UISystemBackgroundView _internalSubviewsOfType:](a1, 3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          objc_msgSend(a1, "bounds", (_QWORD)v8);
          objc_msgSend(v7, "setFrame:");
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

  }
}

- (void)_addInternalSubview:(unsigned __int8 *)a3 ofType:
{
  id v5;
  void *v6;
  unsigned __int8 *v7;
  unint64_t v8;
  NSObject *v9;
  objc_class *v10;
  int has_internal_diagnostics;
  char isKindOfClass;
  uint64_t v13;
  char v14;
  int v15;
  void *v16;
  void *v17;
  NSObject *v18;
  unsigned __int8 *v19;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint8_t buf[4];
  unsigned __int8 *v24;
  __int16 v25;
  unsigned __int8 *v26;
  __int16 v27;
  unsigned __int8 *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!a1 || !v5)
    goto LABEL_17;
  v7 = (unsigned __int8 *)v5;
  switch((unint64_t)a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      v10 = (objc_class *)objc_opt_class();
      break;
    default:
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134218242;
          v24 = a3;
          v25 = 2112;
          v26 = v7;
          _os_log_fault_impl(&dword_185066000, v22, OS_LOG_TYPE_FAULT, "Unhandled _UISystemBackgroundSubviewType %ld for internal subview: %@", buf, 0x16u);
        }

      }
      else
      {
        v8 = _MergedGlobals_12;
        if (!_MergedGlobals_12)
        {
          v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v8, (unint64_t *)&_MergedGlobals_12);
        }
        v9 = *(NSObject **)(v8 + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          v24 = a3;
          v25 = 2112;
          v26 = v7;
          _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Unhandled _UISystemBackgroundSubviewType %ld for internal subview: %@", buf, 0x16u);
        }
      }
      v10 = 0;
      break;
  }
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  isKindOfClass = objc_opt_isKindOfClass();
  if (!has_internal_diagnostics)
  {
    if ((isKindOfClass & 1) != 0)
      goto LABEL_13;
    v20 = qword_1EDDAC890;
    if (!qword_1EDDAC890)
    {
      v20 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v20, (unint64_t *)&qword_1EDDAC890);
    }
    v21 = *(NSObject **)(v20 + 8);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v18 = v21;
    NSStringFromClass(v10);
    v19 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v24 = v19;
    v25 = 2048;
    v26 = a3;
    v27 = 2112;
    v28 = v7;
    _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "_UISystemBackgroundView internal subview is not of expected class '%@' for _UISystemBackgroundSubviewType %ld! Subview: %@", buf, 0x20u);
    goto LABEL_25;
  }
  if ((isKindOfClass & 1) != 0)
    goto LABEL_13;
  __UIFaultDebugAssertLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    NSStringFromClass(v10);
    v19 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v24 = v19;
    v25 = 2048;
    v26 = a3;
    v27 = 2112;
    v28 = v7;
    _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "_UISystemBackgroundView internal subview is not of expected class '%@' for _UISystemBackgroundSubviewType %ld! Subview: %@", buf, 0x20u);
LABEL_25:

  }
LABEL_13:

  v13 = a3[(_QWORD)(a1 + 464)];
  v14 = a1[472];
  a1[472] = v14 | 4;
  objc_msgSend(a1, "insertSubview:atIndex:", v7, v13);
  a1[472] = a1[472] & 0xFB | v14 & 4;
  do
  {
    v15 = a3[(_QWORD)(a1 + 464)];
    if (v15 == 255)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "subviews");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel__addInternalSubview_ofType_, a1, CFSTR("_UISystemBackgroundView.m"), 171, CFSTR("Subview insertion index for type %ld is too large, there should never be this many internal subviews. Subviews: %@"), a3, v17);

      LOBYTE(v15) = a3[(_QWORD)(a1 + 464)];
    }
    (a3++)[(_QWORD)(a1 + 464)] = v15 + 1;
  }
  while (a3 != (unsigned __int8 *)6);
LABEL_17:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_strokeView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_colorView, 0);
}

- (_UISystemBackgroundView)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _UISystemBackgroundView *v6;
  _UISystemBackgroundView *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configurationAPI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configuration")),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9.receiver = self;
    v9.super_class = (Class)_UISystemBackgroundView;
    v6 = -[UIView initWithCoder:](&v9, sel_initWithCoder_, v4);
    v7 = v6;
    if (v6)
      -[_UISystemBackgroundView setConfiguration:](v6, "setConfiguration:", v5);
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  const __CFString *v6;
  void *v7;
  _UIBackgroundConfigurationInternal *configuration;
  void *v9;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UISystemBackgroundView;
  -[UIView encodeWithCoder:](&v10, sel_encodeWithCoder_, v5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = CFSTR("configurationAPI");
    v7 = v5;
    configuration = self->_configuration;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemBackgroundView.m"), 88, CFSTR("Cannot encode configuration of unknown class: %@"), self->_configuration);

      goto LABEL_7;
    }
    configuration = self->_configuration;
    v6 = CFSTR("configuration");
    v7 = v5;
  }
  objc_msgSend(v7, "encodeObject:forKey:", configuration, v6);
LABEL_7:

}

- (id)_encodableSubviews
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)didAddSubview:(id)a3
{
  id v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  _UISystemBackgroundView *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UISystemBackgroundView;
  -[UIView didAddSubview:](&v9, sel_didAddSubview_, v5);
  if (dyld_program_sdk_at_least())
  {
    if ((*(_BYTE *)&self->_systemBackgroundViewFlags & 4) == 0
      && (*(_QWORD *)&self->super._viewFlags & 0x1000) == 0
      && (objc_msgSend(v5, "_isInternalDebugView") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemBackgroundView.m"), 200, CFSTR("A subview was unexpectedly added to the background view that renders a UIBackgroundConfiguration. Manually adding subviews to the background view is not allowed. Any view set to the customView property of the UIBackgroundConfiguration will be automatically added to the view hierarchy when necessary. Subview added: %@; Background view: %@"),
        v5,
        self);

    }
  }
  else if ((*(_BYTE *)&self->_systemBackgroundViewFlags & 4) == 0
         && (*(_QWORD *)&self->super._viewFlags & 0x1000) == 0
         && (objc_msgSend(v5, "_isInternalDebugView") & 1) == 0)
  {
    v7 = didAddSubview____s_category;
    if (!didAddSubview____s_category)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&didAddSubview____s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = self;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "A subview was unexpectedly added to the background view that renders a UIBackgroundConfiguration. Manually adding subviews to the background view is not allowed. Any view set to the customView property of the UIBackgroundConfiguration will be automatically added to the view hierarchy when necessary. Subview added: %@; Background view: %@",
        buf,
        0x16u);
    }
  }

}

- (void)willRemoveSubview:(id)a3
{
  id v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  _UISystemBackgroundView *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UISystemBackgroundView;
  -[UIView willRemoveSubview:](&v9, sel_willRemoveSubview_, v5);
  if (dyld_program_sdk_at_least())
  {
    if ((*(_BYTE *)&self->_systemBackgroundViewFlags & 4) == 0
      && (*(_QWORD *)&self->super._viewFlags & 0x1000) == 0
      && (objc_msgSend(v5, "_isInternalDebugView") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemBackgroundView.m"), 206, CFSTR("A subview was unexpectedly removed from the background view that renders a UIBackgroundConfiguration. Any view set to the customView property of the UIBackgroundConfiguration will be automatically removed from the view hierarchy when necessary; never call removeFromSuperview on the customView yourself. Also ensure that the customView of each UIBackgroundConfiguration that gets applied to a different view is unique; setting the same UIView instance to the customView of configurations applied to different views is not allowed. Subview removed: %@; Background view: %@"),
        v5,
        self);

    }
  }
  else if ((*(_BYTE *)&self->_systemBackgroundViewFlags & 4) == 0
         && (*(_QWORD *)&self->super._viewFlags & 0x1000) == 0
         && (objc_msgSend(v5, "_isInternalDebugView") & 1) == 0)
  {
    v7 = willRemoveSubview____s_category;
    if (!willRemoveSubview____s_category)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&willRemoveSubview____s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = self;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "A subview was unexpectedly removed from the background view that renders a UIBackgroundConfiguration. Any view set to the customView property of the UIBackgroundConfiguration will be automatically removed from the view hierarchy when necessary; never call removeFromSuperview on the customView yourself. Also ensure that the customView "
        "of each UIBackgroundConfiguration that gets applied to a different view is unique; setting the same UIView insta"
        "nce to the customView of configurations applied to different views is not allowed. Subview removed: %@; Background view: %@",
        buf,
        0x16u);
    }
  }

}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UISystemBackgroundView;
  -[UIView description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
    objc_msgSend(v4, "appendFormat:", CFSTR("; configuration = %@>"), self->_configuration);
  }
  return v4;
}

- (void)_updateShadowViewProperties
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  double v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  id v10;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 448), "layer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v10 = v2;
      objc_msgSend(*(id *)(a1 + 480), "_shadowProperties");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      if (!v3 || objc_msgSend(v3, "_backgroundConfigurationShadowType") != 3)
      {
        objc_msgSend(v4, "color");
        v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v10, "setShadowColor:", objc_msgSend(v5, "CGColor"));

        objc_msgSend(v4, "opacity");
        *(float *)&v6 = v6;
        objc_msgSend(v10, "setShadowOpacity:", v6);
        objc_msgSend(v4, "offset");
        objc_msgSend(v10, "setShadowOffset:");
        objc_msgSend(v4, "radius");
        objc_msgSend(v10, "setShadowRadius:");
        objc_msgSend(v4, "path");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          objc_msgSend(v10, "setCornerRadius:", 0.0);
          objc_msgSend(v10, "setMaskedCorners:", 0);
          objc_msgSend(v10, "setShadowPathIsBounds:", 0);
          objc_msgSend(v10, "setPunchoutShadow:", 0);
          objc_msgSend(v10, "setShadowPath:", objc_msgSend(objc_retainAutorelease(v7), "CGPath"));
        }
        else
        {
          objc_msgSend(v10, "setCornerRadius:", *(double *)(a1 + 456));
          if ((*(_BYTE *)(a1 + 472) & 1) != 0)
            v8 = (_QWORD *)MEMORY[0x1E0CD2A68];
          else
            v8 = (_QWORD *)MEMORY[0x1E0CD2A60];
          objc_msgSend(v10, "setCornerCurve:", *v8);
          if (*(double *)(a1 + 456) <= 0.0)
            v9 = 0;
          else
            v9 = objc_msgSend(*(id *)(a1 + 480), "__maskedCorners");
          objc_msgSend(v10, "setMaskedCorners:", v9);
          objc_msgSend(v10, "setShadowPathIsBounds:", 1);
          objc_msgSend(v10, "setPunchoutShadow:", 1);
        }

      }
      v2 = v10;
    }

  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)_UISystemBackgroundView;
  -[UIView setBounds:](&v15, sel_setBounds_, x, y, width, height);
  -[UIView bounds](self, "bounds");
  if (v9 != v13 || v11 != v12)
    -[_UISystemBackgroundView _updateCornerMaskingForType:]((uint64_t)self, 6);
}

- (UIEdgeInsets)effectiveInsetsInContainerView:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double MinY;
  double MinX;
  double MaxY;
  double v24;
  double MaxX;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  UIEdgeInsets result;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[_UISystemBackgroundView frameInContainerView:](self, "frameInContainerView:", v4);
  v14 = v13;
  v16 = v15;
  v30 = v15;
  v18 = v17;
  v20 = v19;

  v34.origin.x = v14;
  v31 = v14;
  v34.origin.y = v16;
  v34.size.width = v18;
  v34.size.height = v20;
  MinY = CGRectGetMinY(v34);
  v35.origin.x = v6;
  v35.origin.y = v8;
  v35.size.width = v10;
  v35.size.height = v12;
  v33 = MinY - CGRectGetMinY(v35);
  v36.origin.x = v14;
  v36.origin.y = v30;
  v36.size.width = v18;
  v36.size.height = v20;
  MinX = CGRectGetMinX(v36);
  v37.origin.x = v6;
  v37.origin.y = v8;
  v37.size.width = v10;
  v37.size.height = v12;
  v32 = MinX - CGRectGetMinX(v37);
  v38.origin.x = v6;
  v38.origin.y = v8;
  v38.size.width = v10;
  v38.size.height = v12;
  MaxY = CGRectGetMaxY(v38);
  v39.origin.x = v31;
  v39.origin.y = v30;
  v39.size.width = v18;
  v39.size.height = v20;
  v24 = MaxY - CGRectGetMaxY(v39);
  v40.origin.x = v6;
  v40.origin.y = v8;
  v40.size.width = v10;
  v40.size.height = v12;
  MaxX = CGRectGetMaxX(v40);
  v41.origin.x = v31;
  v41.origin.y = v30;
  v41.size.width = v18;
  v41.size.height = v20;
  v26 = MaxX - CGRectGetMaxX(v41);
  v28 = v32;
  v27 = v33;
  v29 = v24;
  result.right = v26;
  result.bottom = v29;
  result.left = v28;
  result.top = v27;
  return result;
}

- (id)currentBackgroundColor
{
  _UIBackgroundConfigurationInternal *configuration;
  void *v3;
  void *v4;

  configuration = self->_configuration;
  -[UIView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBackgroundConfigurationInternal resolvedBackgroundColorForTintColor:](configuration, "resolvedBackgroundColorForTintColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)shapeInContainerView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double currentlyAppliedCornerRadius;
  char systemBackgroundViewFlags;
  char v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  int v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  void *v37;
  CGAffineTransform v39;
  CGRect v40;
  CGRect v41;

  v4 = a3;
  -[UIView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  currentlyAppliedCornerRadius = self->_currentlyAppliedCornerRadius;
  systemBackgroundViewFlags = (char)self->_systemBackgroundViewFlags;
  if (currentlyAppliedCornerRadius <= 0.0)
    v15 = 0;
  else
    v15 = -[_UIBackgroundConfigurationInternal __maskedCorners](self->_configuration, "__maskedCorners");
  if ((objc_msgSend(v4, "clipsToBounds") & 1) != 0
    && (objc_msgSend(v4, "layer"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v16, "cornerRadius"),
        v18 = v17,
        v16,
        v18 > 0.0))
  {
    objc_msgSend(v4, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cornerRadius");
    v21 = v20;

    if (currentlyAppliedCornerRadius < v21)
      currentlyAppliedCornerRadius = v21;
    if ((systemBackgroundViewFlags & 1) != 0)
    {
      v24 = 1;
    }
    else
    {
      objc_msgSend(v4, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "cornerCurve");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0CD2A68]);

    }
    objc_msgSend(v4, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v15 |= objc_msgSend(v25, "maskedCorners");

  }
  else
  {
    v24 = systemBackgroundViewFlags & 1;
  }
  -[_UISystemBackgroundView effectiveInsetsInContainerView:](self, "effectiveInsetsInContainerView:", v4);
  v27 = v26;
  v29 = v28;
  if (-[_UIBackgroundConfigurationInternal _hasStroke](self->_configuration, "_hasStroke"))
  {
    -[_UIBackgroundConfigurationInternal strokeOutset](self->_configuration, "strokeOutset");
    v31 = v30;
    v32 = objc_msgSend(v4, "clipsToBounds");
    v33 = 0.0;
    v34 = fmax(v31, 0.0);
    if ((v32 & (v31 > 0.0)) == 0)
      v33 = v31;
    if (v32)
      v34 = -0.0;
    currentlyAppliedCornerRadius = currentlyAppliedCornerRadius + v34;
    v6 = v6 - v33;
    v8 = v8 - v33;
    v35 = -v33 - v33;
    v10 = v10 - v35;
    v12 = v12 - v35;
  }
  CGAffineTransformMakeTranslation(&v39, v29, v27);
  v40.origin.x = v6;
  v40.origin.y = v8;
  v40.size.width = v10;
  v40.size.height = v12;
  v41 = CGRectApplyAffineTransform(v40, &v39);
  if (v24)
    v36 = 2;
  else
    v36 = 1;
  +[UIShape fixedRectShapeWithRect:cornerRadius:cornerCurve:maskedCorners:](UIShape, "fixedRectShapeWithRect:cornerRadius:cornerCurve:maskedCorners:", v36, v15 & 0xF, v41.origin.x, v41.origin.y, v41.size.width, v41.size.height, currentlyAppliedCornerRadius);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (id)_visiblePathInContainerView:(int)a3 nullableBehavior:
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  uint64_t v16;
  int v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  int v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  uint64_t v42;
  CGAffineTransform v44;
  CGRect v45;
  CGRect v46;

  v5 = a2;
  if (!a1)
    goto LABEL_36;
  objc_msgSend((id)a1, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = *(double *)(a1 + 456);
  v15 = *(_BYTE *)(a1 + 472) & 1;
  if (v14 <= 0.0)
    v16 = 0;
  else
    v16 = objc_msgSend(*(id *)(a1 + 480), "__maskedCorners");
  v17 = objc_msgSend(v5, "clipsToBounds");
  if (v17 && a3)
  {
    objc_msgSend(v5, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "cornerRadius");
    v20 = v19;

    if (v20 <= 0.0)
      goto LABEL_18;
LABEL_10:
    if (v16)
      v21 = v14;
    else
      v21 = 0.0;
    objc_msgSend(v5, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "cornerRadius");
    v24 = v23;

    if (v24 >= v21)
    {
      objc_msgSend(v5, "layer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "cornerRadius");
      v14 = v26;

      if (v15)
      {
        v15 = 1;
      }
      else
      {
        objc_msgSend(v5, "layer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "cornerCurve");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v28, "isEqualToString:", *MEMORY[0x1E0CD2A68]);

      }
      objc_msgSend(v5, "layer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v29, "maskedCorners");

    }
    goto LABEL_18;
  }
  if (v17)
    goto LABEL_10;
LABEL_18:
  if (objc_msgSend(*(id *)(a1 + 480), "_hasStroke"))
  {
    objc_msgSend(*(id *)(a1 + 480), "strokeOutset");
    v31 = v30;
    v32 = objc_msgSend(v5, "clipsToBounds");
    v33 = 0.0;
    v34 = fmax(v31, 0.0);
    if ((v32 & (v31 > 0.0)) == 0)
      v33 = v31;
    if (v32)
      v34 = -0.0;
    v14 = v14 + v34;
    v7 = v7 - v33;
    v9 = v9 - v33;
    v35 = -v33 - v33;
    v11 = v11 - v35;
    v13 = v13 - v35;
  }
  objc_msgSend((id)a1, "effectiveInsetsInContainerView:", v5);
  v40 = v36;
  v41 = v37;
  if (a3
    && !v16
    && v37 == 0.0
    && v36 == 0.0
    && v39 == 0.0
    && v38 == 0.0
    && !objc_msgSend(*(id *)(a1 + 480), "_hasStroke"))
  {
    a1 = 0;
  }
  else
  {
    CGAffineTransformMakeTranslation(&v44, v41, v40);
    v45.origin.x = v7;
    v45.origin.y = v9;
    v45.size.width = v11;
    v45.size.height = v13;
    v46 = CGRectApplyAffineTransform(v45, &v44);
    if (v16 && v14 > 0.0)
    {
      +[UIBezierPath _roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:](UIBezierPath, "_roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:", v16 & 0xF, 16, v15 == 0, v46.origin.x, v46.origin.y, v46.size.width, v46.size.height, v14);
      v42 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v46.origin.x, v46.origin.y, v46.size.width, v46.size.height);
      v42 = objc_claimAutoreleasedReturnValue();
    }
    a1 = v42;
  }
LABEL_36:

  return (id)a1;
}

- (id)currentVisiblePathInContainerView:(id)a3
{
  return -[_UISystemBackgroundView _visiblePathInContainerView:nullableBehavior:]((uint64_t)self, a3, 1);
}

- (id)outlinePathInContainerView:(id)a3
{
  return -[_UISystemBackgroundView _visiblePathInContainerView:nullableBehavior:]((uint64_t)self, a3, 0);
}

- (BOOL)_isEligibleForFocusInteraction
{
  return 0;
}

+ (BOOL)_supportsInvalidatingFocusCache
{
  return 1;
}

- (id)focusItemsInRect:(CGRect)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
