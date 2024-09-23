@implementation SBSystemActionBannerTransitionAnimator

+ (id)settings
{
  if (settings_onceToken != -1)
    dispatch_once(&settings_onceToken, &__block_literal_global_0);
  return (id)settings_settings;
}

void __50__SBSystemActionBannerTransitionAnimator_settings__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[SBBannerTransitionDomain rootSettings](SBBannerTransitionDomain, "rootSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)settings_settings;
  settings_settings = v0;

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
  objc_msgSend(v10, "customBannerTransitionStyleSystemAction");
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
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CGAffineTransform v27;

  v4 = a3;
  if (-[BNBannerTransitionAnimator isPresenting](self, "isPresenting"))
  {
    objc_msgSend(v4, "transitionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v10 = *MEMORY[0x1E0C9D538];
    v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);

    if (v7 == v10 && v9 == v11)
    {
      objc_msgSend(v4, "finalContentFrame");
      v14 = v13;
      objc_msgSend(v4, "finalFrame");
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21 - v14;
      objc_msgSend(v4, "transitionView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setFrame:", v16, v22, v18, v20);

      objc_msgSend(v4, "transitionView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setAlpha:", 0.0);

      objc_msgSend(v4, "transitionView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      CGAffineTransformMakeScale(&v27, 0.6, 0.6);
      objc_msgSend(v25, "setTransform:", &v27);

      -[UIViewFloatAnimatableProperty setValue:](self->_blurProgressProperty, "setValue:", 1.0);
    }
  }
  objc_msgSend(v4, "transitionView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClipsToBounds:", 0);

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
  void *v26;
  CGAffineTransform v27;
  _OWORD v28[3];

  v4 = a3;
  objc_msgSend(v4, "transitionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BNBannerTransitionAnimator isPresenting](self, "isPresenting"))
  {
    objc_msgSend(v5, "setAlpha:", 1.0);
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v28[0] = *MEMORY[0x1E0C9BAA8];
    v28[1] = v6;
    v28[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v5, "setTransform:", v28);
    objc_msgSend(v4, "finalFrame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    objc_msgSend(v5, "setFrame:", v8, v10, v12, v14);
    objc_msgSend(v5, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forKeyPath:", &unk_1E91CF5C8, CFSTR("filters.gaussianBlur.inputRadius"));

    -[UIViewFloatAnimatableProperty setValue:](self->_blurProgressProperty, "setValue:", 0.0);
  }
  else
  {
    objc_msgSend(v4, "initialContentFrame");
    v17 = v16;
    objc_msgSend(v4, "initialFrame");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    objc_msgSend(v5, "setFrame:", v19, v21 - v17, v23, v25);
    objc_msgSend(v5, "setAlpha:", 0.0);
    CGAffineTransformMakeScale(&v27, 0.6, 0.6);
    objc_msgSend(v5, "setTransform:", &v27);
    objc_msgSend(v5, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setValue:forKeyPath:", &unk_1E91CF5D8, CFSTR("filters.gaussianBlur.inputRadius"));

  }
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
