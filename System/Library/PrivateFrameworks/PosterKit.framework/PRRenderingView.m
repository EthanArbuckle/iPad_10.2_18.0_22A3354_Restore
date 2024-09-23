@implementation PRRenderingView

- (PRRenderingView)initWithOwner:(id)a3 scene:(id)a4 level:(int64_t)a5 extensionUserInteractionEnabled:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  PRRenderingView *v12;
  PRRenderingView *v13;
  PRPosterWindow *v14;
  PRPosterWindow *window;
  void *v16;
  void *v17;
  PRPosterRootViewController *v18;
  void *v19;
  objc_super v21;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  BSDispatchQueueAssertMain();
  v21.receiver = self;
  v21.super_class = (Class)PRRenderingView;
  v12 = -[PRRenderingView init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_owner, v10);
    v14 = -[PRPosterWindow initWithWindowScene:]([PRPosterWindow alloc], "initWithWindowScene:", v11);
    window = v13->_window;
    v13->_window = v14;

    v13->_level = a5;
    -[PRRenderingView layer](v13, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRRenderingView - %ld"), a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setName:", v17);

    v18 = objc_alloc_init(PRPosterRootViewController);
    -[PRPosterRootViewController setView:](v18, "setView:", v13);
    -[PRPosterWindow setRootViewController:](v13->_window, "setRootViewController:", v18);
    -[PRPosterWindow setUserInteractionEnabled:](v13->_window, "setUserInteractionEnabled:", v6);
    -[PRPosterWindow setWindowLevel:](v13->_window, "setWindowLevel:", (double)a5);
    -[PRPosterWindow layer](v13->_window, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAllowsHitTesting:", v6);

    -[PRPosterWindow setHidden:](v13->_window, "setHidden:", 0);
  }

  return v13;
}

- (void)setLevel:(int64_t)a3
{
  if (self->_level != a3)
  {
    self->_level = a3;
    -[PRPosterWindow setWindowLevel:](self->_window, "setWindowLevel:", (double)a3);
  }
}

- (void)setAlphaInverted:(BOOL)a3
{
  _BOOL4 v3;
  PRPosterWindow *v5;
  id v6;
  UIView *v7;
  void *v8;
  UIView *invertedBackgroundCutoutView;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  UIView *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  PRPosterWindow *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_alphaInverted != a3)
  {
    v3 = a3;
    self->_alphaInverted = a3;
    v5 = self->_window;
    if (v3)
    {
      v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
      -[PRPosterWindow bounds](v5, "bounds");
      v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
      -[UIView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
      objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkOrangeColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

      -[PRPosterWindow insertSubview:atIndex:](v5, "insertSubview:atIndex:", v7, 0);
      invertedBackgroundCutoutView = self->_invertedBackgroundCutoutView;
      self->_invertedBackgroundCutoutView = v7;
    }
    else
    {
      -[UIView removeFromSuperview](self->_invertedBackgroundCutoutView, "removeFromSuperview");
      invertedBackgroundCutoutView = self->_invertedBackgroundCutoutView;
      self->_invertedBackgroundCutoutView = 0;
    }

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v21 = v5;
    -[PRPosterWindow subviews](v5, "subviews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      v14 = *MEMORY[0x1E0CD2C50];
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v16 = *(UIView **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v17 = v3 && v16 != self->_invertedBackgroundCutoutView;
          -[UIView layer](v16, "layer");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v17)
            v20 = v14;
          else
            v20 = 0;
          objc_msgSend(v18, "setCompositingFilter:", v20);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v12);
    }

  }
}

- (void)setExtensionUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_extensionUserInteractionEnabled != a3)
  {
    v3 = a3;
    self->_extensionUserInteractionEnabled = a3;
    -[PRPosterWindow setUserInteractionEnabled:](self->_window, "setUserInteractionEnabled:");
    -[PRPosterWindow layer](self->_window, "layer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsHitTesting:", v3);

  }
}

- (BOOL)isEmpty
{
  void *v3;
  BOOL v4;
  void *v5;

  -[PRRenderingView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[PRRenderingView backgroundColor](self, "backgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == 0;

  }
  return v4;
}

- (void)invalidate
{
  void *v3;
  id WeakRetained;
  PRPosterWindow *window;

  -[PRPosterWindow setHidden:](self->_window, "setHidden:", 1);
  -[PRRenderingView removeFromSuperview](self, "removeFromSuperview");
  -[PRPosterWindow rootViewController](self->_window, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setView:", 0);

  -[PRPosterWindow setRootViewController:](self->_window, "setRootViewController:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  objc_msgSend(WeakRetained, "invalidateView:", self);

  window = self->_window;
  self->_window = 0;

  objc_storeWeak((id *)&self->_owner, 0);
}

- (int64_t)level
{
  return self->_level;
}

- (double)parallaxFactor
{
  return self->_parallaxFactor;
}

- (void)setParallaxFactor:(double)a3
{
  self->_parallaxFactor = a3;
}

- (BOOL)isAlphaInverted
{
  return self->_alphaInverted;
}

- (BOOL)isExtensionUserInteractionEnabled
{
  return self->_extensionUserInteractionEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invertedBackgroundCutoutView, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_destroyWeak((id *)&self->_owner);
}

@end
