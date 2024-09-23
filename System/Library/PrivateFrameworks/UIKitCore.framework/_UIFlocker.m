@implementation _UIFlocker

- (_UIFlocker)initWithContainerView:(id)a3
{
  id v4;
  _UIFlocker *v5;
  _UIFlocker *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIFlocker;
  v5 = -[_UIFlocker init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_UIFlocker setContainerView:](v5, "setContainerView:", v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFlocker setGhostPortals:](v6, "setGhostPortals:", v7);

  }
  return v6;
}

- (void)setBadgeValue:(unint64_t)a3
{
  uint64_t v4;
  unint64_t badgeValue;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  CGAffineTransform v17;
  CGAffineTransform v18;

  if (self->_badgeValue != a3)
  {
    self->_badgeValue = a3;
    -[_UIFlocker badge](self, "badge");
    v4 = objc_claimAutoreleasedReturnValue();
    badgeValue = self->_badgeValue;
    if (badgeValue >= 2 && v4 == 0)
    {
      v8 = (void *)objc_opt_new();
      -[_UIFlocker setBadge:](self, "setBadge:", v8);

      objc_msgSend(0, "setAlpha:", 0.0);
      -[_UIFlocker badge](self, "badge");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setShadowPathIsBounds:", 1);

      badgeValue = self->_badgeValue;
    }
    else
    {
      v7 = (void *)v4;
    }
    objc_msgSend(v7, "setItemCount:", badgeValue);
    objc_msgSend(v7, "layoutIfNeeded");
    objc_msgSend(v7, "intrinsicContentSize");
    objc_msgSend(v7, "setBounds:", 0.0, 0.0, v10, v11);
    objc_msgSend(v7, "anchorPointForAlignment");
    v13 = v12;
    v15 = v14;
    objc_msgSend(v7, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAnchorPoint:", v13, v15);

    if (!-[_UIFlocker isFlocked](self, "isFlocked"))
    {
      CGAffineTransformMakeScale(&v18, 0.0, 0.0);
      v17 = v18;
      objc_msgSend(v7, "setTransform:", &v17);
    }

  }
}

- (void)install
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  -[_UIFlocker _primaryPlatterView](self, "_primaryPlatterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCollapsedShadowStyle:", 0);
  objc_msgSend(v3, "setExpandedShadowStyle:", 1);
  objc_msgSend(v3, "setNeedsLayout");
  objc_msgSend(v3, "layoutIfNeeded");
  objc_msgSend(v3, "collapsedPreview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFlocker _installGhostPortalForPreview:](self, "_installGhostPortalForPreview:", v4);

  -[_UIFlocker secondaryPlatterViews](self, "secondaryPlatterViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __21___UIFlocker_install__block_invoke;
  v9[3] = &unk_1E16C2D00;
  v9[4] = self;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v5, "enumerateObjectsWithOptions:usingBlock:", 2, v9);

  objc_msgSend(v8, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFlocker badge](self, "badge");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertSubview:aboveSubview:", v7, v8);

}

- (void)flock
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  _QWORD v6[7];

  v3 = -[_UIFlocker itemCount](self, "itemCount");
  if (v3 >= 2)
  {
    v4 = v3;
    if (!-[_UIFlocker isFlocked](self, "isFlocked"))
    {
      -[_UIFlocker setIsFlocked:](self, "setIsFlocked:", 1);
      +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, dbl_18667AA90[(-[_UIFlocker settings](self, "settings") & 2) == 0]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __19___UIFlocker_flock__block_invoke;
      v6[3] = &unk_1E16B4E70;
      v6[4] = self;
      v6[5] = fmax(fmin(1.0 - (double)v4 / 5.0 + (double)v4 / 5.0 * 0.6, 1.0), 0.6);
      v6[6] = v4;
      +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v5, 0, v6, 0);

    }
  }
}

- (void)unflockToDrag:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  id v9;
  void (**v10)(void *, void *, uint64_t);
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void (**v19)(_QWORD);
  id v20;
  id v21;
  void (**v22)(_QWORD);
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  void (**v31)(_QWORD);
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _UIFlocker *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  _QWORD aBlock[5];
  id v44;
  BOOL v45;
  _BYTE v46[128];
  uint64_t v47;

  v4 = a4;
  v5 = a3;
  v47 = *MEMORY[0x1E0C80C00];
  if (-[_UIFlocker isFlocked](self, "isFlocked"))
  {
    -[_UIFlocker setIsFlocked:](self, "setIsFlocked:", 0);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __37___UIFlocker_unflockToDrag_animated___block_invoke;
    aBlock[3] = &unk_1E16C2D28;
    aBlock[4] = self;
    v45 = v5;
    v9 = v7;
    v44 = v9;
    v10 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
    if (v5)
    {
      v42[0] = v8;
      v42[1] = 3221225472;
      v42[2] = __37___UIFlocker_unflockToDrag_animated___block_invoke_2;
      v42[3] = &unk_1E16B1B28;
      v42[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v42);
    }
    else
    {
      -[_UIFlocker primaryPlatterPreview](self, "primaryPlatterPreview");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v11, 1);

    }
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    -[_UIFlocker secondaryPlatterViews](self, "secondaryPlatterViews");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v39 != v15)
            objc_enumerationMutation(v12);
          v10[2](v10, *(void **)(*((_QWORD *)&v38 + 1) + 8 * i), 0);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v14);
    }

    +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setInertialTargetSmoothing:", 0.0);
    v35[0] = v8;
    v35[1] = 3221225472;
    v35[2] = __37___UIFlocker_unflockToDrag_animated___block_invoke_3;
    v35[3] = &unk_1E16B1B50;
    v18 = v9;
    v36 = v18;
    v37 = self;
    v19 = (void (**)(_QWORD))_Block_copy(v35);
    -[_UIFlocker ghostPortals](self, "ghostPortals");
    v32[0] = v8;
    v32[1] = 3221225472;
    v32[2] = __37___UIFlocker_unflockToDrag_animated___block_invoke_4;
    v32[3] = &unk_1E16B1B50;
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v33 = v20;
    v21 = v18;
    v34 = v21;
    v22 = (void (**)(_QWORD))_Block_copy(v32);
    if (v4)
    {
      -[_UIFlocker groupCompletion](self, "groupCompletion");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
        v25 = v23;
      else
        v25 = (id)objc_opt_new();
      v26 = v25;

      objc_msgSend(v26, "addCompletion:", v22);
      v30[0] = v8;
      v30[1] = 3221225472;
      v30[2] = __37___UIFlocker_unflockToDrag_animated___block_invoke_5;
      v30[3] = &unk_1E16B1BF8;
      v31 = v19;
      v28[0] = v8;
      v28[1] = 3221225472;
      v28[2] = __37___UIFlocker_unflockToDrag_animated___block_invoke_6;
      v28[3] = &unk_1E16B2588;
      v29 = v26;
      v27 = v26;
      +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v17, 0, v30, v28);

    }
    else
    {
      v19[2](v19);
      v22[2](v22);
    }

  }
}

- (void)unflock
{
  -[_UIFlocker unflockToDrag:animated:](self, "unflockToDrag:animated:", 0, 1);
}

- (CGPoint)badgeLocationInView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  v4 = a3;
  -[_UIFlocker badge](self, "badge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFlocker badge](self, "badge");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "center");
  objc_msgSend(v6, "convertPoint:toView:", v4);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)updateFlockLocation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[_UIFlocker secondaryPlatterViews](self, "secondaryPlatterViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        -[_UIFlocker primaryPlatterPreview](self, "primaryPlatterPreview");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "center");
        v12 = v11;
        v14 = v13;
        objc_msgSend(v8, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setCenter:", v12, v14);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  -[_UIFlocker _badgeCenter](self, "_badgeCenter");
  v17 = v16;
  v19 = v18;
  -[_UIFlocker badge](self, "badge");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCenter:", v17, v19);

}

- (CGPoint)_badgeCenter
{
  void *v3;
  double MaxX;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;
  CGRect v14;

  -[_UIFlocker _primaryPlatterView](self, "_primaryPlatterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  MaxX = CGRectGetMaxX(v14);
  -[_UIFlocker badge](self, "badge");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertPoint:toView:", v6, MaxX, 0.0);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[_UIFlocker containerView](self, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFlocker _primaryPlatterView](self, "_primaryPlatterView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:toView:", v9, x, y);
  v11 = v10;
  v13 = v12;

  -[_UIFlocker _primaryPlatterView](self, "_primaryPlatterView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hitTest:withEvent:", v7, v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_primaryPlatterView
{
  void *v2;
  void *v3;

  -[_UIFlocker primaryPlatterPreview](self, "primaryPlatterPreview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_installGhostPortalForPreview:(id)a3
{
  _UIPortalView *v4;
  void *v5;
  _UIPortalView *v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  id v21;

  v21 = a3;
  if (objc_msgSend(v21, "_sourceViewIsInViewHierarchy"))
  {
    v4 = [_UIPortalView alloc];
    objc_msgSend(v21, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_UIPortalView initWithSourceView:](v4, "initWithSourceView:", v5);

    -[_UIPortalView setHidesSourceView:](v6, "setHidesSourceView:", 1);
    -[UIView setAlpha:](v6, "setAlpha:", 0.0);
    -[_UIPortalView setMatchesPosition:](v6, "setMatchesPosition:", 1);
    -[_UIPortalView setMatchesTransform:](v6, "setMatchesTransform:", 1);
    -[_UIPortalView setName:](v6, "setName:", CFSTR("_UIFlocker.flockGhost"));
    -[_UIPortalView _setGeometryFrozen:](v6, "_setGeometryFrozen:", 1);
    -[UIView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
    objc_msgSend(v21, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "flipsHorizontalAxis");
    -[UIView layer](v6, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFlipsHorizontalAxis:", v9);

    -[_UIFlocker ghostPortals](self, "ghostPortals");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v6);

    objc_msgSend(v21, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setGhostPortal:", v6);

    objc_msgSend(v21, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "target");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "container");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "target");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "container");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v14 == v16)
    {
      objc_msgSend(v21, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "insertSubview:aboveSubview:", v6, v20);

    }
    else
    {
      objc_msgSend(v18, "addSubview:", v6);
    }

  }
}

- (unint64_t)itemCount
{
  return self->_itemCount;
}

- (void)setItemCount:(unint64_t)a3
{
  self->_itemCount = a3;
}

- (unint64_t)badgeValue
{
  return self->_badgeValue;
}

- (unint64_t)settings
{
  return self->_settings;
}

- (void)setSettings:(unint64_t)a3
{
  self->_settings = a3;
}

- (UITargetedPreview)primaryPlatterPreview
{
  return self->_primaryPlatterPreview;
}

- (void)setPrimaryPlatterPreview:(id)a3
{
  objc_storeStrong((id *)&self->_primaryPlatterPreview, a3);
}

- (NSArray)secondaryPlatterViews
{
  return self->_secondaryPlatterViews;
}

- (void)setSecondaryPlatterViews:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryPlatterViews, a3);
}

- (id)unflockPreviewProvider
{
  return self->_unflockPreviewProvider;
}

- (void)setUnflockPreviewProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (_UIGroupCompletion)groupCompletion
{
  return self->_groupCompletion;
}

- (void)setGroupCompletion:(id)a3
{
  objc_storeStrong((id *)&self->_groupCompletion, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (_UIDragBadge)badge
{
  return self->_badge;
}

- (void)setBadge:(id)a3
{
  objc_storeStrong((id *)&self->_badge, a3);
}

- (NSMutableArray)ghostPortals
{
  return self->_ghostPortals;
}

- (void)setGhostPortals:(id)a3
{
  objc_storeStrong((id *)&self->_ghostPortals, a3);
}

- (BOOL)isFlocked
{
  return self->_isFlocked;
}

- (void)setIsFlocked:(BOOL)a3
{
  self->_isFlocked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ghostPortals, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_groupCompletion, 0);
  objc_storeStrong(&self->_unflockPreviewProvider, 0);
  objc_storeStrong((id *)&self->_secondaryPlatterViews, 0);
  objc_storeStrong((id *)&self->_primaryPlatterPreview, 0);
}

@end
