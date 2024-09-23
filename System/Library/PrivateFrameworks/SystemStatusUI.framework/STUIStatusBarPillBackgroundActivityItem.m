@implementation STUIStatusBarPillBackgroundActivityItem

+ (STUIStatusBarIdentifier)pillCombinedDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("pillCombinedDisplayIdentifier"));
}

+ (BOOL)_identifierContainsItemImage:(id)a3
{
  id v4;
  id v5;
  unsigned __int8 v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(a1, "pillCombinedDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___STUIStatusBarPillBackgroundActivityItem;
    v6 = objc_msgSendSuper2(&v8, sel__identifierContainsItemImage_, v4);
  }

  return v6;
}

+ (BOOL)_identifierContainsSecondaryItemImage:(id)a3
{
  id v4;
  id v5;
  unsigned __int8 v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(a1, "pillCombinedDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___STUIStatusBarPillBackgroundActivityItem;
    v6 = objc_msgSendSuper2(&v8, sel__identifierContainsItemImage_, v4);
  }

  return v6;
}

- (id)createDisplayItemForIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
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
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_super v48;
  _QWORD v49[11];

  v49[9] = *MEMORY[0x1E0C80C00];
  v48.receiver = self;
  v48.super_class = (Class)STUIStatusBarPillBackgroundActivityItem;
  -[STUIStatusBarBackgroundActivityItem createDisplayItemForIdentifier:](&v48, sel_createDisplayItemForIdentifier_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "pillCombinedDisplayIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    -[STUIStatusBarPillBackgroundActivityItem pillSize](self, "pillSize");
    v8 = v7;
    v10 = v9;
    objc_msgSend(v4, "setActionInsets:", -10.0, -10.0, -10.0, -10.0);
    +[STUIStatusBarStyleAttributes overriddenStyleAttributes](STUIStatusBarStyleAttributes, "overriddenStyleAttributes");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setImageTintColor:", v11);

    objc_msgSend(v4, "setOverriddenStyleAttributes:", v47);
    -[STUIStatusBarPillBackgroundActivityItem combinedView](self, "combinedView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[STUIStatusBarPillBackgroundActivityItem iconsView](self, "iconsView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[STUIStatusBarBackgroundActivityItem imageView](self, "imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v13, "addSubview:", v14);
    -[STUIStatusBarBackgroundActivityItem secondaryIconView](self, "secondaryIconView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v13, "addSubview:", v15);
    objc_msgSend(v12, "addSubview:", v13);
    objc_msgSend(v14, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v45);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v14;
    v49[0] = v43;
    objc_msgSend(v14, "centerYAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "centerYAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v40;
    objc_msgSend(v15, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2] = v36;
    v39 = v15;
    objc_msgSend(v15, "centerYAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "centerYAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v49[3] = v32;
    objc_msgSend(v15, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v49[4] = v29;
    objc_msgSend(v13, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v12;
    objc_msgSend(v12, "centerXAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v49[5] = v17;
    objc_msgSend(v13, "centerYAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "centerYAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v49[6] = v20;
    v33 = v12;
    objc_msgSend(v12, "widthAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToConstant:", v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v49[7] = v22;
    objc_msgSend(v16, "heightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToConstant:", v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v49[8] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v28);
  }
  return v4;
}

- (id)_backgroundActivityViewForIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "pillCombinedDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[STUIStatusBarPillBackgroundActivityItem combinedView](self, "combinedView");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)STUIStatusBarPillBackgroundActivityItem;
    -[STUIStatusBarBackgroundActivityItem _backgroundActivityViewForIdentifier:](&v9, sel__backgroundActivityViewForIdentifier_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  objc_super v19;

  v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)STUIStatusBarPillBackgroundActivityItem;
  v7 = a3;
  -[STUIStatusBarBackgroundActivityItem applyUpdate:toDisplayItem:](&v19, sel_applyUpdate_toDisplayItem_, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data", v19.receiver, v19.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backgroundActivityEntry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v7, "dataChanged");
  if ((_DWORD)v9)
  {
    objc_msgSend(v10, "backgroundActivityIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "pillCombinedDisplayIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 == v13)
    {
      +[STUIStatusBarActivityAction actionForBackgroundActivityWithIdentifier:](STUIStatusBarActivityAction, "actionForBackgroundActivityWithIdentifier:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAction:", v14);

    }
    -[STUIStatusBarBackgroundActivityItem previousBackgroundActivityIdentifier](self, "previousBackgroundActivityIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[STUIStatusBarPillBackgroundActivityItem _shouldBounceWhenTransitioningActivityWithIdentifier:toActivityWithIdentifier:](self, "_shouldBounceWhenTransitioningActivityWithIdentifier:toActivityWithIdentifier:", v15, v11);

    if (v16)
    {
      +[STUIStatusBarAnimationFactory pulseAnimationWithDuration:scale:](STUIStatusBarAnimationFactory, "pulseAnimationWithDuration:scale:", 0.333, 1.333);
      v17 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v17;
    }

  }
  return v8;
}

- (BOOL)_shouldBounceWhenTransitioningActivityWithIdentifier:(id)a3 toActivityWithIdentifier:(id)a4
{
  return (id)*MEMORY[0x1E0DB0AE8] == a3 && *MEMORY[0x1E0DB0AE0] == (_QWORD)a4;
}

+ (BOOL)shouldKeepIconVisibleForActivityWithIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0DB0890];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visualDescriptorForBackgroundActivityWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "prefersToKeepContentVisible");
  return (char)v5;
}

- (STUIStatusBarPillView)combinedView
{
  STUIStatusBarPillView *combinedView;

  combinedView = self->_combinedView;
  if (!combinedView)
  {
    -[STUIStatusBarPillBackgroundActivityItem _create_combinedView](self, "_create_combinedView");
    combinedView = self->_combinedView;
  }
  return combinedView;
}

- (void)_create_combinedView
{
  STUIStatusBarPillView *v3;
  STUIStatusBarPillView *v4;
  STUIStatusBarPillView *combinedView;

  v3 = [STUIStatusBarPillView alloc];
  v4 = -[STUIStatusBarPillView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  combinedView = self->_combinedView;
  self->_combinedView = v4;

}

- (STUIStatusBarDisplayableContainerView)iconsView
{
  STUIStatusBarDisplayableContainerView *iconsView;

  iconsView = self->_iconsView;
  if (!iconsView)
  {
    -[STUIStatusBarPillBackgroundActivityItem _create_iconsView](self, "_create_iconsView");
    iconsView = self->_iconsView;
  }
  return iconsView;
}

- (void)_create_iconsView
{
  STUIStatusBarDisplayableContainerView *v3;
  STUIStatusBarDisplayableContainerView *v4;
  STUIStatusBarDisplayableContainerView *iconsView;

  v3 = [STUIStatusBarDisplayableContainerView alloc];
  v4 = -[STUIStatusBarDisplayableContainerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  iconsView = self->_iconsView;
  self->_iconsView = v4;

}

- (id)viewForIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "pillCombinedDisplayIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[STUIStatusBarPillBackgroundActivityItem combinedView](self, "combinedView");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)STUIStatusBarPillBackgroundActivityItem;
    -[STUIStatusBarBackgroundActivityItem viewForIdentifier:](&v9, sel_viewForIdentifier_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (BOOL)shouldUpdateIndicatorForIdentifier:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBarPillBackgroundActivityItem;
  if (-[STUIStatusBarIndicatorItem shouldUpdateIndicatorForIdentifier:](&v8, sel_shouldUpdateIndicatorForIdentifier_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "pillCombinedDisplayIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v6 == v4;

  }
  return v5;
}

- (CGSize)pillSize
{
  double width;
  double height;
  CGSize result;

  width = self->_pillSize.width;
  height = self->_pillSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPillSize:(CGSize)a3
{
  self->_pillSize = a3;
}

- (void)setCombinedView:(id)a3
{
  objc_storeStrong((id *)&self->_combinedView, a3);
}

- (void)setIconsView:(id)a3
{
  objc_storeStrong((id *)&self->_iconsView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconsView, 0);
  objc_storeStrong((id *)&self->_combinedView, 0);
}

@end
