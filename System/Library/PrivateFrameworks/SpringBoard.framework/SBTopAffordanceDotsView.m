@implementation SBTopAffordanceDotsView

- (SBTopAffordanceDotsView)initWithFrame:(CGRect)a3 delegate:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  SBTopAffordanceDotsView *v10;
  SBTopAffordanceDotsView *v11;
  void *v12;
  UIView *v13;
  UIView *hitTestBlocker;
  UIView *v15;
  void *v16;
  void *v17;
  void *v18;
  SBTopAffordanceDotView *v19;
  SBTopAffordanceDotView *leadingDotView;
  SBTopAffordanceDotView *v21;
  SBTopAffordanceDotView *centerDotView;
  SBTopAffordanceDotView *v23;
  SBTopAffordanceDotView *trailingDotView;
  void *v25;
  uint64_t v26;
  NSLayoutConstraint *hitTestBlockerWidthConstraint;
  void *v28;
  uint64_t v29;
  NSLayoutConstraint *hitTestBlockerHeightConstraint;
  void *v31;
  void *v32;
  uint64_t v33;
  NSLayoutConstraint *hitTestBlockerLeftConstraint;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  UIPointerInteraction *pointerInteraction;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  objc_super v65;
  _QWORD v66[14];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v66[12] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v65.receiver = self;
  v65.super_class = (Class)SBTopAffordanceDotsView;
  v10 = -[SBTopAffordanceDotsView initWithFrame:](&v65, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[SBTopAffordanceDotsView setAccessibilityTraits:](v10, "setAccessibilityTraits:", *MEMORY[0x1E0CEB110]);
    -[SBTopAffordanceDotsView setIsAccessibilityElement:](v11, "setIsAccessibilityElement:", 1);
    -[SBTopAffordanceDotsView setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBTopAffordanceDotsView setUserInteractionEnabled:](v11, "setUserInteractionEnabled:", 1);
    -[SBTopAffordanceDotsView layer](v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", 7.0);

    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    hitTestBlocker = v11->_hitTestBlocker;
    v11->_hitTestBlocker = v13;

    v15 = v11->_hitTestBlocker;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v64 = v9;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[UIView layer](v11->_hitTestBlocker, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHitTestsAsOpaque:", 1);

    -[UIView layer](v11->_hitTestBlocker, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAllowsHitTesting:", 1);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v11->_hitTestBlocker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v19 = objc_alloc_init(SBTopAffordanceDotView);
    leadingDotView = v11->_leadingDotView;
    v11->_leadingDotView = v19;

    v21 = objc_alloc_init(SBTopAffordanceDotView);
    centerDotView = v11->_centerDotView;
    v11->_centerDotView = v21;

    v23 = objc_alloc_init(SBTopAffordanceDotView);
    trailingDotView = v11->_trailingDotView;
    v11->_trailingDotView = v23;

    -[SBTopAffordanceDotsView addSubview:](v11, "addSubview:", v11->_hitTestBlocker);
    -[SBTopAffordanceDotsView addSubview:](v11, "addSubview:", v11->_leadingDotView);
    -[SBTopAffordanceDotsView addSubview:](v11, "addSubview:", v11->_centerDotView);
    -[SBTopAffordanceDotsView addSubview:](v11, "addSubview:", v11->_trailingDotView);
    -[UIView widthAnchor](v11->_hitTestBlocker, "widthAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToConstant:", 0.0);
    v26 = objc_claimAutoreleasedReturnValue();
    hitTestBlockerWidthConstraint = v11->_hitTestBlockerWidthConstraint;
    v11->_hitTestBlockerWidthConstraint = (NSLayoutConstraint *)v26;

    -[UIView heightAnchor](v11->_hitTestBlocker, "heightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToConstant:", 0.0);
    v29 = objc_claimAutoreleasedReturnValue();
    hitTestBlockerHeightConstraint = v11->_hitTestBlockerHeightConstraint;
    v11->_hitTestBlockerHeightConstraint = (NSLayoutConstraint *)v29;

    -[UIView leftAnchor](v11->_hitTestBlocker, "leftAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTopAffordanceDotsView leftAnchor](v11, "leftAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, 0.0);
    v33 = objc_claimAutoreleasedReturnValue();
    hitTestBlockerLeftConstraint = v11->_hitTestBlockerLeftConstraint;
    v11->_hitTestBlockerLeftConstraint = (NSLayoutConstraint *)v33;

    -[SBTopAffordanceDotsView widthAnchor](v11, "widthAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToConstant:", 32.0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v62;
    -[SBTopAffordanceDotsView heightAnchor](v11, "heightAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToConstant:", 14.0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v60;
    -[SBTopAffordanceDotView trailingAnchor](v11->_leadingDotView, "trailingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTopAffordanceDotView leadingAnchor](v11->_centerDotView, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:constant:", v58, -3.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v66[2] = v57;
    -[SBTopAffordanceDotView leadingAnchor](v11->_trailingDotView, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTopAffordanceDotView trailingAnchor](v11->_centerDotView, "trailingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:constant:", v55, 3.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v66[3] = v54;
    -[SBTopAffordanceDotView centerYAnchor](v11->_leadingDotView, "centerYAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTopAffordanceDotView centerYAnchor](v11->_centerDotView, "centerYAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v52);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v66[4] = v51;
    -[SBTopAffordanceDotView centerXAnchor](v11->_centerDotView, "centerXAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTopAffordanceDotsView centerXAnchor](v11, "centerXAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v49);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v66[5] = v48;
    -[SBTopAffordanceDotView centerYAnchor](v11->_centerDotView, "centerYAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTopAffordanceDotsView centerYAnchor](v11, "centerYAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v66[6] = v36;
    -[SBTopAffordanceDotView centerYAnchor](v11->_trailingDotView, "centerYAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTopAffordanceDotView centerYAnchor](v11->_centerDotView, "centerYAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v66[7] = v39;
    -[UIView topAnchor](v11->_hitTestBlocker, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTopAffordanceDotsView topAnchor](v11, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v66[8] = v42;
    v66[9] = v11->_hitTestBlockerWidthConstraint;
    v66[10] = v11->_hitTestBlockerHeightConstraint;
    v66[11] = v11->_hitTestBlockerLeftConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 12);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTopAffordanceDotsView addConstraints:](v11, "addConstraints:", v43);

    v9 = v64;
    v44 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA860]), "initWithDelegate:", v11);
    pointerInteraction = v11->_pointerInteraction;
    v11->_pointerInteraction = (UIPointerInteraction *)v44;

    -[SBTopAffordanceDotsView addInteraction:](v11, "addInteraction:", v11->_pointerInteraction);
    objc_storeWeak((id *)&v11->_delegate, v64);
  }

  return v11;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SBTopAffordanceDotsView _dotViews](self, "_dotViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setHighlighted:", v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[SBTopAffordanceDotsView _updateBackgroundColor](self, "_updateBackgroundColor");
  -[UIPointerInteraction invalidate](self->_pointerInteraction, "invalidate");
}

- (BOOL)isHighlighted
{
  void *v2;
  void *v3;
  char v4;

  -[SBTopAffordanceDotsView _dotViews](self, "_dotViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHighlighted");

  return v4;
}

- (void)setPointerInteractionEnabled:(BOOL)a3
{
  -[UIPointerInteraction setEnabled:](self->_pointerInteraction, "setEnabled:", a3);
}

- (BOOL)isPointerInteractionEnabled
{
  return -[UIPointerInteraction isEnabled](self->_pointerInteraction, "isEnabled");
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGPoint v22;
  CGRect v23;

  y = a3.y;
  x = a3.x;
  -[SBTopAffordanceDotsView bounds](self, "bounds", a4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[SBTopAffordanceDotsView hitTestEdgeInsets](self, "hitTestEdgeInsets");
  v16 = v10 + v15;
  v19 = v12 - (v17 + v18);
  v23.size.height = v14 - (v15 + v20);
  v23.origin.x = v8 + v17;
  v23.origin.y = v16;
  v23.size.width = v19;
  v22.x = x;
  v22.y = y;
  return CGRectContainsPoint(v23, v22);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;

  v6 = (void *)MEMORY[0x1E0CEA870];
  v7 = a5;
  -[SBTopAffordanceDotsView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "regionWithRect:identifier:", v16, v9, v11, v13, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double x;
  double y;
  double width;
  double height;
  CGFloat v13;
  void *v14;
  CGRect v16;

  v5 = objc_alloc_init(MEMORY[0x1E0CEA8B8]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:parameters:", self, v5);
  if (-[SBTopAffordanceDotsView isHighlighted](self, "isHighlighted"))
  {
    objc_msgSend(MEMORY[0x1E0CEA868], "effectWithPreview:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }
  else
  {
    -[SBTopAffordanceDotsView frame](self, "frame");
    x = v16.origin.x;
    y = v16.origin.y;
    width = v16.size.width;
    height = v16.size.height;
    v13 = CGRectGetHeight(v16) * 0.5;
    objc_msgSend(MEMORY[0x1E0CEA850], "effectWithPreview:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA878], "shapeWithRoundedRect:cornerRadius:", x, y, width, height, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CEA880], "styleWithEffect:shape:", v7, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)setHitTestEdgeInsets:(UIEdgeInsets)a3
{
  NSLayoutConstraint *hitTestBlockerWidthConstraint;
  double v5;
  double v6;
  double v7;
  NSLayoutConstraint *hitTestBlockerHeightConstraint;
  double v9;
  NSLayoutConstraint *hitTestBlockerLeftConstraint;
  double v11;

  self->_hitTestEdgeInsets = a3;
  hitTestBlockerWidthConstraint = self->_hitTestBlockerWidthConstraint;
  -[SBTopAffordanceDotsView hitTestEdgeInsets](self, "hitTestEdgeInsets");
  v6 = 32.0 - v5;
  -[SBTopAffordanceDotsView hitTestEdgeInsets](self, "hitTestEdgeInsets");
  -[NSLayoutConstraint setConstant:](hitTestBlockerWidthConstraint, "setConstant:", v6 - v7);
  hitTestBlockerHeightConstraint = self->_hitTestBlockerHeightConstraint;
  -[SBTopAffordanceDotsView hitTestEdgeInsets](self, "hitTestEdgeInsets");
  -[NSLayoutConstraint setConstant:](hitTestBlockerHeightConstraint, "setConstant:", 14.0 - v9);
  hitTestBlockerLeftConstraint = self->_hitTestBlockerLeftConstraint;
  -[SBTopAffordanceDotsView hitTestEdgeInsets](self, "hitTestEdgeInsets");
  -[NSLayoutConstraint setConstant:](hitTestBlockerLeftConstraint, "setConstant:", v11);
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBTopAffordanceDotsView;
  -[SBTopAffordanceDotsView _contextMenuInteraction:styleForMenuWithConfiguration:](&v8, sel__contextMenuInteraction_styleForMenuWithConfiguration_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTopAffordanceDotsView superview](self, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContainerView:", v6);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setPreferredAttachmentEdge:", 4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setPrefersStackedHierarchy:", 1);
  return v5;
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  double MidX;
  double v4;
  CGPoint result;
  CGRect v6;

  -[SBTopAffordanceDotsView bounds](self, "bounds", a3);
  MidX = CGRectGetMidX(v6);
  v4 = 3.0;
  result.y = v4;
  result.x = MidX;
  return result;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id WeakRetained;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBTopAffordanceDotsView;
  -[SBTopAffordanceDotsView contextMenuInteraction:willDisplayMenuForConfiguration:animator:](&v7, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_, a3, a4, a5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "topAffordanceDotsViewWillPresentMenu:", self);

}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id WeakRetained;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBTopAffordanceDotsView;
  -[SBTopAffordanceDotsView contextMenuInteraction:willEndForConfiguration:animator:](&v7, sel_contextMenuInteraction_willEndForConfiguration_animator_, a3, a4, a5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "topAffordanceDotsViewWillDismissMenu:", self);

}

- (void)_updateBackgroundColor
{
  void *v3;
  double v4;
  double v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (-[SBTopAffordanceDotsView isHighlighted](self, "isHighlighted"))
  {
    -[SBTopAffordanceDotsView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "userInterfaceStyle") == 2)
    {
      v4 = 0.16;
      v5 = 1.0;
    }
    else
    {
      v4 = 0.1;
      v5 = 0.0;
    }
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", v5, v4);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v7;
  }
  else
  {
    v6 = v8;
  }
  v9 = v6;
  -[SBTopAffordanceDotsView setBackgroundColor:](self, "setBackgroundColor:", v6);

}

- (id)_dotViews
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SBTopAffordanceDotsView subviews](self, "subviews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (UIEdgeInsets)hitTestEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_hitTestEdgeInsets.top;
  left = self->_hitTestEdgeInsets.left;
  bottom = self->_hitTestEdgeInsets.bottom;
  right = self->_hitTestEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (SBTopAffordanceDotsViewDelegate)delegate
{
  return (SBTopAffordanceDotsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_hitTestBlockerLeftConstraint, 0);
  objc_storeStrong((id *)&self->_hitTestBlockerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_hitTestBlockerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_trailingSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_hitTestBlocker, 0);
  objc_storeStrong((id *)&self->_trailingDotView, 0);
  objc_storeStrong((id *)&self->_centerDotView, 0);
  objc_storeStrong((id *)&self->_leadingDotView, 0);
}

@end
