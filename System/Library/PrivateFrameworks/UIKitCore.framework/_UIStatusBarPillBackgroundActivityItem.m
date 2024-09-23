@implementation _UIStatusBarPillBackgroundActivityItem

+ (_UIStatusBarIdentifier)pillCombinedDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)objc_msgSend(a1, "displayItemIdentifierFromString:", CFSTR("pillCombinedDisplayIdentifier"));
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
    v8.super_class = (Class)&OBJC_METACLASS____UIStatusBarPillBackgroundActivityItem;
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
    v8.super_class = (Class)&OBJC_METACLASS____UIStatusBarPillBackgroundActivityItem;
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
  v48.super_class = (Class)_UIStatusBarPillBackgroundActivityItem;
  -[_UIStatusBarBackgroundActivityItem createDisplayItemForIdentifier:](&v48, sel_createDisplayItemForIdentifier_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "pillCombinedDisplayIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    -[_UIStatusBarPillBackgroundActivityItem pillSize](self, "pillSize");
    v8 = v7;
    v10 = v9;
    objc_msgSend(v4, "setActionInsets:", -10.0, -10.0, -10.0, -10.0);
    +[_UIStatusBarStyleAttributes overriddenStyleAttributes](_UIStatusBarStyleAttributes, "overriddenStyleAttributes");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor whiteColor](UIColor, "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setImageTintColor:", v11);

    objc_msgSend(v4, "setOverriddenStyleAttributes:", v47);
    -[_UIStatusBarPillBackgroundActivityItem combinedView](self, "combinedView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UIStatusBarPillBackgroundActivityItem iconsView](self, "iconsView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UIStatusBarBackgroundActivityItem imageView](self, "imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v13, "addSubview:", v14);
    -[_UIStatusBarBackgroundActivityItem secondaryIconView](self, "secondaryIconView");
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

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v28);
  }
  return v4;
}

- (id)_textLabelForActivityType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 == 33)
  {
    v5 = CFSTR("Siri");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = self;
    v7.super_class = (Class)_UIStatusBarPillBackgroundActivityItem;
    -[_UIStatusBarBackgroundActivityItem _textLabelForActivityType:](&v7, sel__textLabelForActivityType_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
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
    -[_UIStatusBarPillBackgroundActivityItem combinedView](self, "combinedView");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIStatusBarPillBackgroundActivityItem;
    -[_UIStatusBarBackgroundActivityItem _backgroundActivityViewForIdentifier:](&v9, sel__backgroundActivityViewForIdentifier_, v4);
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
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_super v17;

  v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_UIStatusBarPillBackgroundActivityItem;
  v7 = a3;
  -[_UIStatusBarBackgroundActivityItem applyUpdate:toDisplayItem:](&v17, sel_applyUpdate_toDisplayItem_, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data", v17.receiver, v17.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backgroundActivityEntry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v7, "dataChanged");
  if ((_DWORD)v9)
  {
    v11 = objc_msgSend(v10, "type");
    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "pillCombinedDisplayIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 == v13)
    {
      +[_UIStatusBarActivityAction actionForBackgroundActivityType:](_UIStatusBarActivityAction, "actionForBackgroundActivityType:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAction:", v14);

    }
    if (-[_UIStatusBarPillBackgroundActivityItem _shouldBounceWhenTransitioningFromType:toType:](self, "_shouldBounceWhenTransitioningFromType:toType:", -[_UIStatusBarBackgroundActivityItem previousType](self, "previousType"), v11))
    {
      +[_UIStatusBarAnimationFactory pulseAnimationWithDuration:scale:](_UIStatusBarAnimationFactory, "pulseAnimationWithDuration:scale:", 0.333, 1.333);
      v15 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v15;
    }
  }

  return v8;
}

- (id)_backgroundColorForActivityType:(int64_t)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  if (a3 == 33)
  {
    +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("BackgroundTask_siri-pill"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor colorWithPatternImage:](UIColor, "colorWithPatternImage:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIStatusBarPillBackgroundActivityItem;
    -[_UIStatusBarBackgroundActivityItem _backgroundColorForActivityType:](&v6, sel__backgroundColorForActivityType_);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)_shouldBounceWhenTransitioningFromType:(int64_t)a3 toType:(int64_t)a4
{
  return a3 == 27 && a4 == 28;
}

+ (BOOL)shouldKeepIconVisibleForActivityType:(int64_t)a3
{
  return ((unint64_t)a3 < 0x20) & (0x9800013F >> a3);
}

- (_UIStatusBarPillView)combinedView
{
  _UIStatusBarPillView *combinedView;

  combinedView = self->_combinedView;
  if (!combinedView)
  {
    -[_UIStatusBarPillBackgroundActivityItem _create_combinedView](self, "_create_combinedView");
    combinedView = self->_combinedView;
  }
  return combinedView;
}

- (void)_create_combinedView
{
  _UIStatusBarPillView *v3;
  _UIStatusBarPillView *v4;
  _UIStatusBarPillView *combinedView;

  v3 = [_UIStatusBarPillView alloc];
  v4 = -[_UIStatusBarPillView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  combinedView = self->_combinedView;
  self->_combinedView = v4;

}

- (_UIStatusBarDisplayableContainerView)iconsView
{
  _UIStatusBarDisplayableContainerView *iconsView;

  iconsView = self->_iconsView;
  if (!iconsView)
  {
    -[_UIStatusBarPillBackgroundActivityItem _create_iconsView](self, "_create_iconsView");
    iconsView = self->_iconsView;
  }
  return iconsView;
}

- (void)_create_iconsView
{
  _UIStatusBarDisplayableContainerView *v3;
  _UIStatusBarDisplayableContainerView *v4;
  _UIStatusBarDisplayableContainerView *iconsView;

  v3 = [_UIStatusBarDisplayableContainerView alloc];
  v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
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
    -[_UIStatusBarPillBackgroundActivityItem combinedView](self, "combinedView");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIStatusBarPillBackgroundActivityItem;
    -[_UIStatusBarBackgroundActivityItem viewForIdentifier:](&v9, sel_viewForIdentifier_, v4);
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
  v8.super_class = (Class)_UIStatusBarPillBackgroundActivityItem;
  if (-[_UIStatusBarIndicatorItem shouldUpdateIndicatorForIdentifier:](&v8, sel_shouldUpdateIndicatorForIdentifier_, v4))
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
