@implementation SBBannerPoofTransitionAnimator

+ (id)settings
{
  if (settings_onceToken_1 != -1)
    dispatch_once(&settings_onceToken_1, &__block_literal_global_74);
  return (id)settings_settings_0;
}

void __42__SBBannerPoofTransitionAnimator_settings__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[SBBannerTransitionDomain rootSettings](SBBannerTransitionDomain, "rootSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)settings_settings_0;
  settings_settings_0 = v0;

}

+ (void)performAnimationsForTransition:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0CEABB0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(a1, "settings");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "customBannerTransitionStylePoof");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sb_animateWithSettings:mode:animations:completion:", v9, 3, v8, v7);

}

- (id)settings
{
  return (id)objc_msgSend((id)objc_opt_class(), "settings");
}

- (void)prepareForTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 IsEmpty;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  CGAffineTransform v28;
  CGRect v29;

  v4 = a3;
  objc_msgSend(v4, "transitionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BNBannerTransitionAnimator isPresenting](self, "isPresenting"))
  {
    -[SBBannerPoofTransitionAnimator settings](self, "settings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "poofInitialBlurRadius");
    -[SBBannerPoofTransitionAnimator _addGaussianBlurToViewIfNeeded:inputRadius:](self, "_addGaussianBlurToViewIfNeeded:inputRadius:", v5);

  }
  else
  {
    -[SBBannerPoofTransitionAnimator _addGaussianBlurToViewIfNeeded:inputRadius:](self, "_addGaussianBlurToViewIfNeeded:inputRadius:", v5, 0.0);
  }

  if (-[BNBannerTransitionAnimator isPresenting](self, "isPresenting"))
  {
    objc_msgSend(v4, "transitionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    IsEmpty = CGRectIsEmpty(v29);

    if (IsEmpty)
    {
      -[SBBannerPoofTransitionAnimator settings](self, "settings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "poofInitialScale");
      v11 = v10;

      objc_msgSend(v4, "finalFrame");
      v13 = v12;
      objc_msgSend(v4, "finalContentFrame");
      UIRectGetCenter();
      v15 = v14;
      objc_msgSend(v4, "transitionView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "finalFrame");
      objc_msgSend(v16, "setFrame:");

      objc_msgSend(v4, "transitionView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAlpha:", 0.0);

      objc_msgSend(v4, "transitionView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      CGAffineTransformMakeScale(&v28, v11, v11);
      objc_msgSend(v18, "setTransform:", &v28);

      -[UIViewFloatAnimatableProperty setValue:](self->_blurProgressProperty, "setValue:", 1.0);
      objc_msgSend(v4, "transitionView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "frame");
      v21 = v20;
      v23 = v22;
      v25 = v24;

      objc_msgSend(v4, "transitionView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setFrame:", v21, v13 + v15 * (1.0 - v11), v23, v25);

    }
  }
  objc_msgSend(v4, "transitionView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setClipsToBounds:", 0);

}

- (void)performActionsForTransition:(id)a3
{
  id v4;
  void *v5;
  __int128 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CGAffineTransform v31;
  _OWORD v32[3];

  v4 = a3;
  objc_msgSend(v4, "transitionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BNBannerTransitionAnimator isPresenting](self, "isPresenting"))
  {
    objc_msgSend(v5, "setAlpha:", 1.0);
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v32[0] = *MEMORY[0x1E0C9BAA8];
    v32[1] = v6;
    v32[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v5, "setTransform:", v32);
    objc_msgSend(v4, "finalFrame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    objc_msgSend(v5, "setFrame:", v8, v10, v12, v14);
    objc_msgSend(v5, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forKeyPath:", &unk_1E91CF678, CFSTR("filters.gaussianBlur.inputRadius"));

    -[UIViewFloatAnimatableProperty setValue:](self->_blurProgressProperty, "setValue:", 0.0);
  }
  else
  {
    -[SBBannerPoofTransitionAnimator settings](self, "settings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "poofDismissedScale");
    v18 = v17;

    objc_msgSend(v4, "initialFrame");
    objc_msgSend(v4, "initialContentFrame");
    UIRectGetCenter();
    objc_msgSend(v4, "initialFrame");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    objc_msgSend(v5, "setFrame:", v20, v22, v24, v26);
    objc_msgSend(v5, "setAlpha:", 0.0);
    CGAffineTransformMakeScale(&v31, v18, v18);
    objc_msgSend(v5, "setTransform:", &v31);
    objc_msgSend(v5, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0CB37E8];
    -[SBBannerPoofTransitionAnimator settings](self, "settings");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "poofDismissedBlurRadius");
    objc_msgSend(v28, "numberWithDouble:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setValue:forKeyPath:", v30, CFSTR("filters.gaussianBlur.inputRadius"));

    objc_msgSend(v5, "frame");
    objc_msgSend(v5, "setFrame:");
  }

}

- (BOOL)_viewHasGaussianBlurFilter:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a3, "layer", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = *MEMORY[0x1E0CD2C88];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v8);

        if ((v11 & 1) != 0)
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (void)_addGaussianBlurToViewIfNeeded:(id)a3 inputRadius:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIViewFloatAnimatableProperty *v15;
  UIViewFloatAnimatableProperty *blurProgressProperty;
  UIViewFloatAnimatableProperty **p_blurProgressProperty;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id from;
  id location;
  UIViewFloatAnimatableProperty *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!-[SBBannerPoofTransitionAnimator _viewHasGaussianBlurFilter:](self, "_viewHasGaussianBlurFilter:", v6))
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setName:", CFSTR("gaussianBlur"));
    objc_msgSend(v7, "setValue:forKey:", CFSTR("default"), CFSTR("inputQuality"));
    objc_msgSend(v7, "setValue:forKey:", CFSTR("default"), CFSTR("inputIntermediateBitDepth"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v8, CFSTR("inputRadius"));

    v9 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v7, "setValue:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("inputNormalizeEdges"));
    objc_msgSend(v7, "setValue:forKey:", v9, CFSTR("inputHardEdges"));
    objc_msgSend(v6, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "filters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v12, "addObject:", v7);
    objc_msgSend(v6, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFilters:", v14);

  }
  if (-[BNBannerTransitionAnimator isPresenting](self, "isPresenting"))
  {
    if (!self->_blurProgressProperty)
    {
      v15 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
      blurProgressProperty = self->_blurProgressProperty;
      self->_blurProgressProperty = v15;

    }
    objc_initWeak(&location, self);
    p_blurProgressProperty = &self->_blurProgressProperty;
    objc_initWeak(&from, *p_blurProgressProperty);
    v18 = (void *)MEMORY[0x1E0CEABB0];
    v26 = *p_blurProgressProperty;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __77__SBBannerPoofTransitionAnimator__addGaussianBlurToViewIfNeeded_inputRadius___block_invoke;
    v20[3] = &unk_1E8EA6EF8;
    objc_copyWeak(&v22, &from);
    objc_copyWeak(&v23, &location);
    v21 = v6;
    objc_msgSend(v18, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v19, v20);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

}

void __77__SBBannerPoofTransitionAnimator__addGaussianBlurToViewIfNeeded_inputRadius___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  int v5;
  id v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "isInvalidated");
    objc_msgSend(v7, "presentationValue");
    v5 = BSFloatLessThanOrEqualToFloat();
    v3 = v7;
    if (v5)
    {
      if ((v4 & 1) == 0)
      {
        v6 = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(v6, "_removeBlurFilterFromView:", *(_QWORD *)(a1 + 32));

        objc_msgSend(v7, "invalidate");
        v3 = v7;
      }
    }
  }

}

- (void)_removeBlurFilterFromView:(id)a3
{
  id v3;

  objc_msgSend(a3, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilters:", 0);

}

- (UIViewFloatAnimatableProperty)blurProgressProperty
{
  return self->_blurProgressProperty;
}

- (void)setBlurProgressProperty:(id)a3
{
  objc_storeStrong((id *)&self->_blurProgressProperty, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurProgressProperty, 0);
}

@end
