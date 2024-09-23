@implementation _UIContentUnavailableWrapperView

- (UIEdgeInsets)_concreteDefaultLayoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIContentConfiguration)configuration
{
  return (UIContentConfiguration *)-[_UIContentViewInternal configuration](self->_viewForConfiguration, "configuration");
}

- (void)reconfigureContentScrollView
{
  void *v4;
  UIScrollView *v5;
  char isKindOfClass;
  id v7;
  UIScrollView *v8;
  char v9;
  id v10;
  UIScrollView *v11;
  UIScrollView *v12;
  int v13;
  UIScrollView *v14;
  UIScrollView *v15;
  UIScrollView *v16;
  void *v17;
  id v18;
  _QWORD v19[7];
  char v20;

  if (!self->_isConfiguringContentScrollView)
  {
    self->_isConfiguringContentScrollView = 1;
    -[_UIContentUnavailableWrapperView contentView](self, "contentView");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIContentUnavailableWrapperView viewController](self, "viewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = self->_contentScrollView;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      v7 = v18;
      objc_msgSend(v7, "_scrollView");
      v8 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIContentUnavailableWrapperView.m"), 225, CFSTR("Expected UIContentUnavailableView to return a scroll view for its _UIContentUnavailableWrapperView"));

      }
      v9 = objc_msgSend(v7, "shouldReparentScrollViewPanGestureRecognizer");

    }
    else
    {
      -[_UIContentUnavailableWrapperView _contentScrollViewForView:](self, "_contentScrollViewForView:", v18);
      v8 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __64___UIContentUnavailableWrapperView_reconfigureContentScrollView__block_invoke;
    v19[3] = &unk_1E16B7298;
    v19[4] = self;
    v10 = v4;
    v19[5] = v10;
    v11 = v5;
    v12 = v11;
    v19[6] = v11;
    v20 = isKindOfClass & 1;
    if (v11 != v8)
      __64___UIContentUnavailableWrapperView_reconfigureContentScrollView__block_invoke_2(v11, v11);
    v13 = __64___UIContentUnavailableWrapperView_reconfigureContentScrollView__block_invoke((uint64_t)v19, v8, 1);
    if ((v13 & __64___UIContentUnavailableWrapperView_reconfigureContentScrollView__block_invoke((uint64_t)v19, v8, 4)) != 0)v14 = 0;
    else
      v14 = v8;
    objc_msgSend(v10, "_setInternalContentScrollView:", v14);
    objc_storeStrong((id *)&self->_contentScrollView, v8);
    if (v8)
    {
      if ((v9 & 1) != 0)
      {
        objc_msgSend(v10, "view");
        v15 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = v8;
      }
      v16 = v15;
      __64___UIContentUnavailableWrapperView_reconfigureContentScrollView__block_invoke_2(v8, v15);

    }
    self->_isConfiguringContentScrollView = 0;

  }
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setConfiguration:(id)a3
{
  id v5;

  if (-[_UIContentUnavailableWrapperView _canApplyConfigurationToExistingContentView:](self, "_canApplyConfigurationToExistingContentView:"))
  {
    -[_UIContentViewInternal setConfiguration:](self->_viewForConfiguration, "setConfiguration:", a3);
    -[_UIContentUnavailableWrapperView reconfigureContentScrollView](self, "reconfigureContentScrollView");
  }
  else if (a3)
  {
    objc_msgSend(a3, "makeContentView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIContentUnavailableWrapperView _replaceContentViewWithViewForConfiguration:](self, "_replaceContentViewWithViewForConfiguration:", v5);

  }
  else
  {
    -[_UIContentUnavailableWrapperView _replaceContentViewWithViewForConfiguration:](self, "_replaceContentViewWithViewForConfiguration:", 0);
  }
}

- (void)_updateBackgroundViewHandlersForPreviousContentView:(id)a3 newContentView:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a3, "_setContainerBackgroundViewDidChangeHandler:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __103___UIContentUnavailableWrapperView__updateBackgroundViewHandlersForPreviousContentView_newContentView___block_invoke;
    v10 = &unk_1E16B3F40;
    objc_copyWeak(&v11, &location);
    objc_msgSend(a4, "_setContainerBackgroundViewDidChangeHandler:", &v7);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  -[_UIContentUnavailableWrapperView _updateBackgroundView](self, "_updateBackgroundView", v7, v8, v9, v10);
}

- (void)_updateBackgroundView
{
  UIView **p_backgroundView;
  UIView *v4;
  UIView *v5;
  void *v6;
  uint64_t v7;
  id v8;
  UIView *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(id *, uint64_t, uint64_t);
  void *v13;
  id v14;
  UIView *v15;
  id v16;
  id location;
  _QWORD v18[4];
  id v19;
  _UIContentUnavailableWrapperView *v20;

  p_backgroundView = &self->_backgroundView;
  v4 = self->_backgroundView;
  v5 = self->_contentView;
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIView _containerBackgroundView](v5, "_containerBackgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  objc_storeStrong((id *)p_backgroundView, v6);
  if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
  {
    v7 = MEMORY[0x1E0C809B0];
    if (v6)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __57___UIContentUnavailableWrapperView__updateBackgroundView__block_invoke;
      v18[3] = &unk_1E16B1B50;
      v19 = v6;
      v20 = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v18);

    }
    objc_initWeak(&location, self);
    v10 = v7;
    v11 = 3221225472;
    v12 = __57___UIContentUnavailableWrapperView__updateBackgroundView__block_invoke_2;
    v13 = &unk_1E16B7270;
    objc_copyWeak(&v16, &location);
    v8 = v6;
    v14 = v8;
    v9 = v4;
    v15 = v9;
    +[UIView _addCompletionWithPosition:](UIView, "_addCompletionWithPosition:", &v10);
    -[UIView setAlpha:](v9, "setAlpha:", 0.0, v10, v11, v12, v13);
    objc_msgSend(v8, "setAlpha:", 1.0);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    -[UIView removeFromSuperview](v4, "removeFromSuperview");
    if (v6)
    {
      -[UIView bounds](self, "bounds");
      objc_msgSend(v6, "setFrame:");
      objc_msgSend(v6, "setAutoresizingMask:", 18);
      -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v6, 0);
    }
  }

}

- (BOOL)_canApplyConfigurationToExistingContentView:(id)a3
{
  uint64_t v5;
  _QWORD *v6;
  BOOL v7;
  _UIContentViewInternal *viewForConfiguration;
  id v9;
  _UIContentViewInternal *v10;
  int v11;
  _QWORD *v12;
  void *v13;
  id v14;
  void *v15;
  objc_class *v16;
  id v17;
  objc_class *v18;
  void *v19;
  char v20;

  -[_UIContentViewInternal configuration](self->_viewForConfiguration, "configuration");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (_QWORD *)v5;
  v7 = 0;
  if (!a3 || !v5)
    goto LABEL_21;
  viewForConfiguration = self->_viewForConfiguration;
  v9 = a3;
  v10 = viewForConfiguration;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    -[_UIContentViewInternal configuration](v10, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v13;
    if (v14)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v14, "_wrappedConfigurationIdentifier");
      }
      else
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

    v17 = v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v17, "_wrappedConfigurationIdentifier");
    }
    else
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v15, "isEqualToString:", v19);
    if ((v20 & 1) != 0)
      goto LABEL_5;
LABEL_20:
    v7 = 0;
    goto LABEL_21;
  }
  v11 = -[_UIContentViewInternal supportsConfiguration:](v10, "supportsConfiguration:", v9);

  if (!v11)
    goto LABEL_20;
LABEL_5:
  if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled")&& (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)&& (objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v9;
    v7 = v6[7] == v12[7];

  }
  else
  {
    v7 = 1;
  }
LABEL_21:

  return v7;
}

- (_UIContentUnavailableWrapperView)initWithViewController:(id)a3
{
  _UIContentUnavailableWrapperView *v4;
  _UIContentUnavailableWrapperView *v5;
  uint64_t v6;
  NSMutableDictionary *parentScrollViews;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIContentUnavailableWrapperView;
  v4 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_viewController, a3);
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    parentScrollViews = v5->_parentScrollViews;
    v5->_parentScrollViews = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (id)_contentScrollViewForView:(id)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;
  CGRect v32;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a3)
    goto LABEL_15;
  objc_msgSend(a3, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIView bounds](self, "bounds");
  v32.origin.x = v13;
  v32.origin.y = v14;
  v32.size.width = v15;
  v32.size.height = v16;
  v31.origin.x = v6;
  v31.origin.y = v8;
  v31.size.width = v10;
  v31.size.height = v12;
  if (!CGRectEqualToRect(v31, v32) || !objc_msgSend(a3, "_canHostViewControllerContentScrollView"))
  {
LABEL_15:
    v17 = 0;
    return v17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(a3, "subviews", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v26;
      while (2)
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v26 != v21)
            objc_enumerationMutation(v18);
          -[_UIContentUnavailableWrapperView _contentScrollViewForView:](self, "_contentScrollViewForView:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v22));
          v23 = objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            v17 = (id)v23;

            return v17;
          }
          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v20)
          continue;
        break;
      }
    }

    goto LABEL_15;
  }
  v17 = a3;
  return v17;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_contentScrollView, 0);
  objc_storeStrong((id *)&self->_parentScrollViews, 0);
  objc_storeStrong((id *)&self->_viewForConfiguration, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)_replaceContentViewWithViewForConfiguration:(id)a3
{
  id v6;
  void *v7;
  void *v8;
  _UIContentViewInternal *v9;
  UIView *v10;
  id WeakRetained;
  _BOOL4 v12;
  BOOL v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  UIView *v17;
  _UIContentViewInternal *v18;
  id v19;
  id location;
  _QWORD v21[4];
  id v22;
  _UIContentUnavailableWrapperView *v23;

  if (a3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(a3, "_wrappedContentView");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a3, "configuration");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIContentUnavailableWrapperView.m"), 67, CFSTR("Configuration returned a nil content view: %@"), v8);

        v6 = 0;
      }
    }
    else
    {
      v6 = a3;
    }
    if ((objc_msgSend(v6, "translatesAutoresizingMaskIntoConstraints") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIContentUnavailableWrapperView.m"), 68, CFSTR("The content view returned from the content unavailable configuration must have translatesAutoresizingMaskIntoConstraints enabled: %@"), v6);

    }
    -[UIView bounds](self, "bounds");
    objc_msgSend(v6, "setFrame:");
    objc_msgSend(v6, "setAutoresizingMask:", 18);
    -[UIView addSubview:](self, "addSubview:", v6);
  }
  else
  {
    v6 = 0;
  }
  v9 = self->_viewForConfiguration;
  v10 = self->_contentView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_viewForConfiguration, a3);
  objc_storeStrong((id *)&self->_contentView, v6);
  v12 = +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled");
  v13 = v12;
  if (v6 && v12)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __80___UIContentUnavailableWrapperView__replaceContentViewWithViewForConfiguration___block_invoke;
    v21[3] = &unk_1E16B1B50;
    v14 = v6;
    v22 = v14;
    v23 = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v21);
    objc_msgSend(v14, "setAlpha:", 1.0);

  }
  if (v13)
  {
    -[UIView setAlpha:](v10, "setAlpha:", 0.0);
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __80___UIContentUnavailableWrapperView__replaceContentViewWithViewForConfiguration___block_invoke_2;
    v16[3] = &unk_1E16B7248;
    v17 = v10;
    objc_copyWeak(&v19, &location);
    v18 = v9;
    +[UIView _addCompletionWithPosition:](UIView, "_addCompletionWithPosition:", v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    -[UIView removeFromSuperview](v10, "removeFromSuperview");
  }
  -[_UIContentUnavailableWrapperView _updateBackgroundViewHandlersForPreviousContentView:newContentView:](self, "_updateBackgroundViewHandlersForPreviousContentView:newContentView:", v10, v6);
  -[_UIContentUnavailableWrapperView reconfigureContentScrollView](self, "reconfigureContentScrollView");

}

@end
