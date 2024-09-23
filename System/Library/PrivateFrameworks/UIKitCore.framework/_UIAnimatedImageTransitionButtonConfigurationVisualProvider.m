@implementation _UIAnimatedImageTransitionButtonConfigurationVisualProvider

- (void)willMoveToWindow:(id)a3
{
  self->_inViewHierarchy = a3 != 0;
}

- (id)imageEffectContainerView
{
  void *v3;
  UIView *contentAnimationContainerView;
  UIView *v5;
  UIView *v6;
  UIView *v7;
  UIView *v8;

  -[UIButtonConfigurationVisualProvider button](self, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  contentAnimationContainerView = self->_contentAnimationContainerView;
  if (!contentAnimationContainerView)
  {
    v5 = [UIView alloc];
    objc_msgSend(v3, "bounds");
    v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
    v7 = self->_contentAnimationContainerView;
    self->_contentAnimationContainerView = v6;

    -[UIView setAutoresizingMask:](self->_contentAnimationContainerView, "setAutoresizingMask:", 18);
    -[UIView setUserInteractionEnabled:](self->_contentAnimationContainerView, "setUserInteractionEnabled:", 0);
    objc_msgSend(v3, "addSubview:", self->_contentAnimationContainerView);
    contentAnimationContainerView = self->_contentAnimationContainerView;
  }
  v8 = contentAnimationContainerView;

  return v8;
}

- (id)_transitioningImageViewForConfiguration:(id)a3
{
  id v4;
  NSMutableDictionary *imageViewsByConfiguration;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  UIImageView *v8;
  void *v9;
  void *v10;
  void *v11;
  UIImageView *v12;
  UIImageView *imageView;
  UIImageView *v14;
  UIImageView *v15;
  void *v16;
  UIImageView *v17;
  UIImageView *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  UIImageView *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;

  v4 = a3;
  imageViewsByConfiguration = self->_imageViewsByConfiguration;
  if (!imageViewsByConfiguration)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = self->_imageViewsByConfiguration;
    self->_imageViewsByConfiguration = v6;

    imageViewsByConfiguration = self->_imageViewsByConfiguration;
  }
  -[NSMutableDictionary objectForKey:](imageViewsByConfiguration, "objectForKey:", v4);
  v8 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = objc_alloc_init(UIImageView);
    -[UIImageView setContentMode:](v8, "setContentMode:", -[UIView contentMode](self->super._imageView, "contentMode"));
    objc_msgSend(v4, "_resolvedImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_resolvedSymbolConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v8, "setPreferredSymbolConfiguration:", v10);

    objc_msgSend(v4, "_resolvedImageColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](v8, "setTintColor:", v11);

    -[UIImageView setImage:](v8, "setImage:", v9);
    -[NSMutableDictionary setObject:forKey:](self->_imageViewsByConfiguration, "setObject:forKey:", v8, v4);

  }
  v12 = self->super._imageView;
  objc_storeStrong((id *)&self->super._imageView, v8);
  v50 = 0;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[UIButtonConfigurationVisualProvider _layoutBounds](self, "_layoutBounds");
  -[UIButtonConfigurationVisualProvider _layoutDataInBounds:forConfiguration:](self, "_layoutDataInBounds:forConfiguration:", v4);
  imageView = self->super._imageView;
  self->super._imageView = v12;
  v14 = v12;

  v21 = 3221225472;
  v34 = v47;
  v35 = v48;
  v36 = v49;
  v30 = v43;
  v31 = v44;
  v32 = v45;
  v33 = v46;
  v26 = v39;
  v27 = v40;
  v28 = v41;
  v29 = v42;
  v20 = MEMORY[0x1E0C809B0];
  v22 = __103___UIAnimatedImageTransitionButtonConfigurationVisualProvider__transitioningImageViewForConfiguration___block_invoke;
  v23 = &unk_1E16E6130;
  v37 = v50;
  v25 = v38;
  v15 = v8;
  v24 = v15;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &v20);
  -[_UIAnimatedImageTransitionButtonConfigurationVisualProvider imageEffectContainerView](self, "imageEffectContainerView", v20, v21, v22, v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v15);

  v17 = v24;
  v18 = v15;

  return v18;
}

- (void)_updateImageViewWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _UIButtonConfigurationShim *v11;
  _UIButtonConfigurationShim *fromConfiguration;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, int);
  void *v16;
  id v17;
  _UIAnimatedImageTransitionButtonConfigurationVisualProvider *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  objc_super v24;

  v4 = a3;
  v5 = v4;
  if (self->_inViewHierarchy && self->_fromConfiguration && (objc_msgSend(v4, "isEqual:") & 1) == 0)
  {
    -[_UIAnimatedImageTransitionButtonConfigurationVisualProvider _transitioningImageViewForConfiguration:](self, "_transitioningImageViewForConfiguration:", self->_fromConfiguration);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAnimatedImageTransitionButtonConfigurationVisualProvider _transitioningImageViewForConfiguration:](self, "_transitioningImageViewForConfiguration:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 1;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
  }
  v24.receiver = self;
  v24.super_class = (Class)_UIAnimatedImageTransitionButtonConfigurationVisualProvider;
  -[UIButtonConfigurationVisualProvider _updateImageViewWithConfiguration:](&v24, sel__updateImageViewWithConfiguration_, v5);
  if (v6)
  {
    -[UIImageView setHidden:](self->super._imageView, "setHidden:", 1);
    CGAffineTransformMakeScale(&v23, 0.3, 0.3);
    v22 = v23;
    objc_msgSend(v7, "setTransform:", &v22);
    objc_msgSend(v7, "setAlpha:", 0.0);
    +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __97___UIAnimatedImageTransitionButtonConfigurationVisualProvider__updateImageViewWithConfiguration___block_invoke;
    v19[3] = &unk_1E16B1B50;
    v20 = v7;
    v21 = v8;
    v13 = v10;
    v14 = 3221225472;
    v15 = __97___UIAnimatedImageTransitionButtonConfigurationVisualProvider__updateImageViewWithConfiguration___block_invoke_2;
    v16 = &unk_1E16B25B0;
    v17 = v20;
    v18 = self;
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v9, 0, v19, &v13);

  }
  v11 = (_UIButtonConfigurationShim *)objc_msgSend(v5, "copy", v13, v14, v15, v16);
  fromConfiguration = self->_fromConfiguration;
  self->_fromConfiguration = v11;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewsByConfiguration, 0);
  objc_storeStrong((id *)&self->_contentAnimationContainerView, 0);
  objc_storeStrong((id *)&self->_fromConfiguration, 0);
}

@end
