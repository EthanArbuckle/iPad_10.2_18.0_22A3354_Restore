@implementation SBHLibraryCategoryStackView

- (SBHLibraryCategoryStackView)initWithFrame:(CGRect)a3
{
  SBHLibraryCategoryStackView *v3;
  uint64_t v4;
  NSMutableArray *podBackgroundViews;
  uint64_t v6;
  NSMutableArray *iconImageViews;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  SBHLibraryIndicatorIconSettings *iconSettings;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  objc_super v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)SBHLibraryCategoryStackView;
  v3 = -[SBHLibraryCategoryStackView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    podBackgroundViews = v3->_podBackgroundViews;
    v3->_podBackgroundViews = (NSMutableArray *)v4;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
    v6 = objc_claimAutoreleasedReturnValue();
    iconImageViews = v3->_iconImageViews;
    v3->_iconImageViews = (NSMutableArray *)v6;

    for (i = 0; i != 4; ++i)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", 0);
      objc_msgSend(v9, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAllowsEdgeAntialiasing:", 1);

      -[NSMutableArray setObject:atIndexedSubscript:](v3->_iconImageViews, "setObject:atIndexedSubscript:", v9, i);
    }
    v3->_numberOfCategories = 1;
    objc_storeStrong((id *)&v3->_backdropGroupNamespace, (id)*MEMORY[0x1E0CD2960]);
    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "iconAnimationSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "libraryIndicatorIconSettings");
    v13 = objc_claimAutoreleasedReturnValue();
    iconSettings = v3->_iconSettings;
    v3->_iconSettings = (SBHLibraryIndicatorIconSettings *)v13;

    -[SBHLibraryCategoryStackView _appendConfiguredPodBackgroundView](v3, "_appendConfiguredPodBackgroundView");
    objc_opt_self();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)-[SBHLibraryCategoryStackView registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v16, sel__userInterfaceStyleDidChange);

    objc_opt_self();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)-[SBHLibraryCategoryStackView registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v19, sel__iconAppearanceDidChange);

  }
  return v3;
}

- (id)matchingCategoryStackView
{
  id v3;
  id *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc((Class)objc_opt_class());
  -[SBHLibraryCategoryStackView bounds](self, "bounds");
  v4 = (id *)objc_msgSend(v3, "initWithFrame:");
  objc_msgSend(v4, "setNumberOfCategories:", -[SBHLibraryCategoryStackView numberOfCategories](self, "numberOfCategories"));
  -[SBHLibraryCategoryStackView iconImageInfo](self, "iconImageInfo");
  objc_msgSend(v4, "setIconImageInfo:");
  objc_storeStrong(v4 + 55, self->_iconImageCache);
  -[SBHLibraryCategoryStackView innerIcons](self, "innerIcons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInnerIcons:", v5);

  -[SBHLibraryCategoryStackView backdropGroupName](self, "backdropGroupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackdropGroupName:", v6);

  -[SBHLibraryCategoryStackView backdropGroupNamespace](self, "backdropGroupNamespace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackdropGroupNamespace:", v7);

  objc_msgSend(v4, "setInnerIconImageInfoFrozen:", -[SBHLibraryCategoryStackView isInnerIconImageInfoFrozen](self, "isInnerIconImageInfoFrozen"));
  return v4;
}

- (void)setNumberOfCategories:(unint64_t)a3
{
  if (self->_numberOfCategories != a3)
  {
    self->_numberOfCategories = a3;
    -[SBHLibraryCategoryStackView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SBIconImageInfo *p_iconImageInfo;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if (!SBIconImageInfoEqualToIconImageInfo(self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius, v3, v4, v5, v6))
  {
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    -[SBHLibraryCategoryStackView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setEditing:(BOOL)a3
{
  NSMutableArray *iconImageViews;
  _QWORD v4[4];
  BOOL v5;

  if (self->_editing != a3)
  {
    self->_editing = a3;
    iconImageViews = self->_iconImageViews;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __42__SBHLibraryCategoryStackView_setEditing___block_invoke;
    v4[3] = &__block_descriptor_33_e28_v32__0__UIImageView_8Q16_B24l;
    v5 = a3;
    -[NSMutableArray enumerateObjectsUsingBlock:](iconImageViews, "enumerateObjectsUsingBlock:", v4);
  }
}

void __42__SBHLibraryCategoryStackView_setEditing___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 32))
  {
    +[SBIconView _jitterXTranslationAnimationWithAmount:](SBIconView, "_jitterXTranslationAnimationWithAmount:", 0.25);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBIconView _jitterYTranslationAnimationWithAmount:](SBIconView, "_jitterYTranslationAnimationWithAmount:", 0.25);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    BSDegreesToRadians();
    +[SBIconView _jitterRotationAnimationWithAmount:](SBIconView, "_jitterRotationAnimationWithAmount:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAnimation:forKey:", v3, CFSTR("SBHIconImageJitterXTranslation"));
    objc_msgSend(v6, "addAnimation:forKey:", v4, CFSTR("SBHIconImageJitterYTranslation"));
    objc_msgSend(v6, "addAnimation:forKey:", v5, CFSTR("SBHIconImageJitterRotation"));

  }
  else
  {
    objc_msgSend(v6, "removeAnimationForKey:", CFSTR("SBHIconImageJitterXTranslation"));
    objc_msgSend(v6, "removeAnimationForKey:", CFSTR("SBHIconImageJitterYTranslation"));
    objc_msgSend(v6, "removeAnimationForKey:", CFSTR("SBHIconImageJitterRotation"));
  }

}

- (void)setHighlighted:(BOOL)a3
{
  NSMutableArray *podBackgroundViews;
  _QWORD v4[5];
  BOOL v5;

  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    podBackgroundViews = self->_podBackgroundViews;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __46__SBHLibraryCategoryStackView_setHighlighted___block_invoke;
    v4[3] = &unk_1E8D88038;
    v4[4] = self;
    v5 = a3;
    -[NSMutableArray enumerateObjectsUsingBlock:](podBackgroundViews, "enumerateObjectsUsingBlock:", v4);
  }
}

void __46__SBHLibraryCategoryStackView_setHighlighted___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  __int128 v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGFloat v14;

  v5 = a2;
  v14 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "_scalingAnimationSettingsForStackedViewAtIndex:scale:", a3, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v13, 0, sizeof(v13));
  if (*(_BYTE *)(a1 + 40))
  {
    CGAffineTransformMakeScale(&v13, v14, v14);
  }
  else
  {
    v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v13.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v13.c = v7;
    *(_OWORD *)&v13.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  v10[1] = 3221225472;
  v12 = v13;
  v8 = (void *)MEMORY[0x1E0DC3F10];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __46__SBHLibraryCategoryStackView_setHighlighted___block_invoke_2;
  v10[3] = &unk_1E8D88798;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "sb_animateWithSettings:mode:animations:completion:", v6, 3, v10, 0);

}

uint64_t __46__SBHLibraryCategoryStackView_setHighlighted___block_invoke_2(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "setTransform:", v4);
}

- (void)setOverlapping:(BOOL)a3
{
  NSMutableArray *podBackgroundViews;
  _QWORD v4[4];
  BOOL v5;

  if (self->_overlapping != a3)
  {
    self->_overlapping = a3;
    podBackgroundViews = self->_podBackgroundViews;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __46__SBHLibraryCategoryStackView_setOverlapping___block_invoke;
    v4[3] = &__block_descriptor_33_e23_v32__0__UIView_8Q16_B24l;
    v5 = a3;
    -[NSMutableArray enumerateObjectsUsingBlock:](podBackgroundViews, "enumerateObjectsUsingBlock:", v4);
  }
}

void __46__SBHLibraryCategoryStackView_setOverlapping___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  id v5;
  void *v6;
  void *v7;
  CGAffineTransform v8;
  CGAffineTransform v9;

  v3 = a2;
  memset(&v9, 0, sizeof(v9));
  if (*(_BYTE *)(a1 + 32))
  {
    CGAffineTransformMakeScale(&v9, 1.13, 1.13);
  }
  else
  {
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v9.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v9.c = v4;
    *(_OWORD *)&v9.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  v5 = v3;
  objc_msgSend(v5, "materialView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  objc_msgSend(v6, "setTransform:", &v8);

  objc_msgSend(v5, "tintingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  objc_msgSend(v7, "setTransform:", &v8);

}

- (void)setInnerIcons:(id)a3
{
  -[SBHLibraryCategoryStackView setInnerIcons:animated:](self, "setInnerIcons:animated:", a3, 0);
}

- (void)setInnerIcons:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a4;
  v6 = (void *)MEMORY[0x1E0CB36B8];
  v7 = a3;
  v8 = objc_msgSend(v7, "count");
  if (v8 >= 4)
    v9 = 4;
  else
    v9 = v8;
  objc_msgSend(v6, "indexSetWithIndexesInRange:", 0, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectsAtIndexes:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((BSEqualArrays() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_innerIcons, v10);
    -[SBHLibraryCategoryStackView _updateIconImageViewsAnimated:](self, "_updateIconImageViewsAnimated:", v4);
  }

}

- (void)setBackdropGroupName:(id)a3
{
  NSMutableArray *podBackgroundViews;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_backdropGroupName, a3);
    podBackgroundViews = self->_podBackgroundViews;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__SBHLibraryCategoryStackView_setBackdropGroupName___block_invoke;
    v7[3] = &unk_1E8D887E0;
    v8 = v6;
    -[NSMutableArray enumerateObjectsUsingBlock:](podBackgroundViews, "enumerateObjectsUsingBlock:", v7);

  }
}

void __52__SBHLibraryCategoryStackView_setBackdropGroupName___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "materialView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGroupName:", *(_QWORD *)(a1 + 32));

}

- (void)setBackdropGroupNamespace:(id)a3
{
  NSMutableArray *podBackgroundViews;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_backdropGroupNamespace, a3);
    podBackgroundViews = self->_podBackgroundViews;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__SBHLibraryCategoryStackView_setBackdropGroupNamespace___block_invoke;
    v7[3] = &unk_1E8D887E0;
    v8 = v6;
    -[NSMutableArray enumerateObjectsUsingBlock:](podBackgroundViews, "enumerateObjectsUsingBlock:", v7);

  }
}

void __57__SBHLibraryCategoryStackView_setBackdropGroupNamespace___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(a2, "materialView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_opt_class();
  v8 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v8;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "setGroupNamespace:", *(_QWORD *)(a1 + 32));
}

- (CGRect)visibleContentFrame
{
  NSMutableArray *v2;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;
  CGRect v25;
  CGRect v26;
  CGRect result;
  CGRect v28;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = self->_podBackgroundViews;
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10), "frame");
        v28.origin.x = v11;
        v28.origin.y = v12;
        v28.size.width = v13;
        v28.size.height = v14;
        v25.origin.x = x;
        v25.origin.y = y;
        v25.size.width = width;
        v25.size.height = height;
        v26 = CGRectUnion(v25, v28);
        x = v26.origin.x;
        y = v26.origin.y;
        width = v26.size.width;
        height = v26.size.height;
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)frameForStackedViewAtIndex:(unint64_t)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  id *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect result;

  -[SBHLibraryCategoryStackView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SBHLibraryCategoryStackView traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayScale");

  v13 = (id *)MEMORY[0x1E0DC4730];
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") != 1)
  {
    v18.origin.x = v5;
    v18.origin.y = v7;
    v18.size.width = v9;
    v18.size.height = v11;
    CGRectGetMinX(v18);
  }
  objc_msgSend(*v13, "userInterfaceLayoutDirection");
  UIRectIntegralWithScale();
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (double)alphaForStackedViewAtIndex:(unint64_t)a3
{
  double result;

  result = 0.0;
  if (self->_numberOfCategories > a3)
    return 1.0;
  return result;
}

- (id)backgroundViewForIndex:(unint64_t)a3 compatibleWithTraitCollection:(id)a4
{
  uint64_t v6;
  _SBHLibraryCategoryStackViewBackgroundView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _SBHLibraryCategoryStackViewBackgroundView *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  double v31;
  id v32;
  double v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
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
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a4, "userInterfaceStyle");
  v7 = [_SBHLibraryCategoryStackViewBackgroundView alloc];
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v12 = -[_SBHLibraryCategoryStackViewBackgroundView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], v9, v10, v11);
  -[_SBHLibraryCategoryStackViewBackgroundView layer](v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAllowsGroupBlending:", 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v8, v9, v10, v11);
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAutoresizingMask:", 18);
  v16 = (double)a3;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "colorWithAlphaComponent:", (double)a3 * -0.075 + 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v18);

  objc_msgSend(v15, "setAllowsGroupBlending:", 0);
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v55 = 0u;
  CAColorMatrixMakeSaturation();
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v50 = 0u;
  CAColorMatrixMakeColorSourceOver();
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v45 = 0u;
  CAColorMatrixMakeContrast();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v35 = 0u;
  v36 = 0u;
  CAColorMatrixConcat();
  CAColorMatrixConcat();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F08], 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", &v35);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setValue:forKey:", v20, *MEMORY[0x1E0CD2D20]);

  v60[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFilters:", v21);

  if (self->_numberOfCategories - 2 >= a3)
  {
    objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAutoresizingMask:", 18);
    -[SBHLibraryCategoryStackView backdropGroupName](self, "backdropGroupName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setGroupName:", v23);

    objc_msgSend(v22, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAllowsGroupBlending:", 0);
    v25 = objc_opt_class();
    v26 = v24;
    if (v25)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v27 = v26;
      else
        v27 = 0;
    }
    else
    {
      v27 = 0;
    }
    v28 = v27;

    -[SBHLibraryCategoryStackView backdropGroupNamespace](self, "backdropGroupNamespace");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setGroupNamespace:", v29);

    -[_SBHLibraryCategoryStackViewBackgroundView addSubview:](v12, "addSubview:", v22);
    -[_SBHLibraryCategoryStackViewBackgroundView setMaterialView:](v12, "setMaterialView:", v22);
    if (v6 != 2)
    {
      v30 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
      v31 = -(v16 + -3.0);
      if (v30 != 1)
        v31 = v16 + -3.0;
      objc_msgSend(v13, "setShadowOffset:", v31, 0.0);
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v13, "setShadowColor:", objc_msgSend(v32, "CGColor"));

      objc_msgSend(v13, "setShadowRadius:", 3.0);
      LODWORD(v33) = 1022739087;
      objc_msgSend(v13, "setShadowOpacity:", v33);
      objc_msgSend(v13, "setShadowPathIsBounds:", 1);
    }

  }
  -[_SBHLibraryCategoryStackViewBackgroundView addSubview:](v12, "addSubview:", v14);
  -[_SBHLibraryCategoryStackViewBackgroundView setTintingView:](v12, "setTintingView:", v14);

  return v12;
}

- (void)layoutSubviews
{
  unint64_t numberOfCategories;
  double v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double continuousCornerRadius;
  double v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  SBHIconImageCache *v35;
  objc_class *v36;
  void *v37;
  SBHIconImageCache *v38;
  SBHIconImageCache *iconImageCache;
  NSMutableArray *iconImageViews;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[11];
  objc_super v45;
  CGRect v46;

  v45.receiver = self;
  v45.super_class = (Class)SBHLibraryCategoryStackView;
  -[SBHLibraryCategoryStackView layoutSubviews](&v45, sel_layoutSubviews);
  numberOfCategories = self->_numberOfCategories;
  if (numberOfCategories != -[NSMutableArray count](self->_podBackgroundViews, "count"))
    -[SBHLibraryCategoryStackView _reconfigurePodBackgroundViews](self, "_reconfigurePodBackgroundViews");
  -[SBHLibraryCategoryStackView bounds](self, "bounds");
  v42 = v6;
  v43 = v5;
  v7 = v4;
  v9 = v8;
  if (numberOfCategories)
  {
    v10 = 0;
    continuousCornerRadius = self->_iconImageInfo.continuousCornerRadius;
    if (v4 >= 1.0)
      v12 = v4;
    else
      v12 = 1.0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_podBackgroundViews, "objectAtIndex:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHLibraryCategoryStackView frameForStackedViewAtIndex:](self, "frameForStackedViewAtIndex:", v10);
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      BSRectWithSize();
      objc_msgSend(v13, "setBounds:");
      UIRectGetCenter();
      objc_msgSend(v13, "setCenter:");
      v46.origin.x = v15;
      v46.origin.y = v17;
      v46.size.width = v19;
      v46.size.height = v21;
      objc_msgSend(v13, "_setContinuousCornerRadius:", continuousCornerRadius * (CGRectGetWidth(v46) / v12));
      -[SBHLibraryCategoryStackView alphaForStackedViewAtIndex:](self, "alphaForStackedViewAtIndex:", v10);
      objc_msgSend(v13, "setAlpha:");

      ++v10;
    }
    while (numberOfCategories != v10);
  }
  -[SBHLibraryCategoryStackView _innerIconImageInfo](self, "_innerIconImageInfo");
  v26 = v25;
  v27 = v22;
  if (v25 != *MEMORY[0x1E0C9D820] || v22 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v29 = v23;
    v30 = v24;
    -[SBHIconImageCache iconImageInfo](self->_iconImageCache, "iconImageInfo");
    if (!SBIconImageInfoEqualToIconImageInfo(v26, v27, v29, v30, v31, v32, v33, v34)
      && !-[SBHLibraryCategoryStackView isInnerIconImageInfoFrozen](self, "isInnerIconImageInfoFrozen"))
    {
      v35 = [SBHIconImageCache alloc];
      v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[SBHIconImageCache initWithName:iconImageInfo:](v35, "initWithName:iconImageInfo:", v37, v26, v27, v29, v30);
      iconImageCache = self->_iconImageCache;
      self->_iconImageCache = v38;

      -[SBHIconImageCache addObserver:](self->_iconImageCache, "addObserver:", self);
      -[SBHLibraryCategoryStackView _updateIconImageViewsAnimated:](self, "_updateIconImageViewsAnimated:", 0);
    }
    -[SBHLibraryCategoryStackView _innerIconEdgeSpacingFraction](self, "_innerIconEdgeSpacingFraction");
    UIRoundToScale();
    iconImageViews = self->_iconImageViews;
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __45__SBHLibraryCategoryStackView_layoutSubviews__block_invoke;
    v44[3] = &__block_descriptor_88_e28_v32__0__UIImageView_8Q16_B24l;
    v44[4] = v41;
    v44[5] = v43;
    v44[6] = v42;
    *(double *)&v44[7] = v7;
    v44[8] = v9;
    *(double *)&v44[9] = v26;
    *(double *)&v44[10] = v27;
    -[NSMutableArray enumerateObjectsUsingBlock:](iconImageViews, "enumerateObjectsUsingBlock:", v44);
  }
}

void __45__SBHLibraryCategoryStackView_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v5;
  id v6;

  v6 = a2;
  if ((a3 & 1) == (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") != 1))
    v5 = CGRectGetMaxX(*(CGRect *)(a1 + 40)) - *(double *)(a1 + 32) - *(double *)(a1 + 72);
  else
    v5 = *(double *)(a1 + 32);
  if (a3 > 1)
    CGRectGetMaxY(*(CGRect *)(a1 + 40));
  objc_msgSend(v6, "setFrame:", v5);

}

- (void)iconImageCache:(id)a3 didUpdateImageForIcon:(id)a4 imageAppearance:(id)a5
{
  NSUInteger v6;

  v6 = -[NSArray indexOfObject:](self->_innerIcons, "indexOfObject:", a4);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    -[SBHLibraryCategoryStackView _updateIconImageViewAtIndex:animated:](self, "_updateIconImageViewAtIndex:animated:", v6, 1);
}

- (void)_reconfigurePodBackgroundViews
{
  unint64_t numberOfCategories;
  NSMutableArray *i;

  numberOfCategories = self->_numberOfCategories;
  for (i = self->_podBackgroundViews;
        -[NSMutableArray count](i, "count") > numberOfCategories;
        i = self->_podBackgroundViews)
  {
    -[SBHLibraryCategoryStackView _removeLastPodBackgroundView](self, "_removeLastPodBackgroundView");
  }
  if (-[NSMutableArray count](self->_podBackgroundViews, "count"))
    -[SBHLibraryCategoryStackView _removeLastPodBackgroundView](self, "_removeLastPodBackgroundView");
  while (-[NSMutableArray count](self->_podBackgroundViews, "count") < numberOfCategories)
    -[SBHLibraryCategoryStackView _appendConfiguredPodBackgroundView](self, "_appendConfiguredPodBackgroundView");
}

- (void)_appendConfiguredPodBackgroundView
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableArray count](self->_podBackgroundViews, "count");
  -[SBHLibraryCategoryStackView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryCategoryStackView backgroundViewForIndex:compatibleWithTraitCollection:](self, "backgroundViewForIndex:compatibleWithTraitCollection:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAutoresizingMask:", 18);
  -[SBHLibraryCategoryStackView addSubview:](self, "addSubview:", v5);
  -[SBHLibraryCategoryStackView sendSubviewToBack:](self, "sendSubviewToBack:", v5);
  -[NSMutableArray addObject:](self->_podBackgroundViews, "addObject:", v5);
  if (-[NSMutableArray count](self->_podBackgroundViews, "count") == 1)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_iconImageViews;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "addSubview:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)_removeLastPodBackgroundView
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray lastObject](self->_podBackgroundViews, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeLastObject](self->_podBackgroundViews, "removeLastObject");
  objc_msgSend(v3, "removeFromSuperview");
  if (!-[NSMutableArray count](self->_podBackgroundViews, "count"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = self->_iconImageViews;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          -[SBHLibraryCategoryStackView addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)_resetAllPodBackgroundViews
{
  NSMutableArray *i;

  for (i = self->_podBackgroundViews; -[NSMutableArray count](i, "count"); i = self->_podBackgroundViews)
    -[SBHLibraryCategoryStackView _removeLastPodBackgroundView](self, "_removeLastPodBackgroundView");
  -[SBHLibraryCategoryStackView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_userInterfaceStyleDidChange
{
  -[SBHLibraryCategoryStackView _resetAllPodBackgroundViews](self, "_resetAllPodBackgroundViews");
  -[SBHLibraryCategoryStackView _updateIconImageViewsAnimated:](self, "_updateIconImageViewsAnimated:", 1);
}

- (void)_iconAppearanceDidChange
{
  -[SBHLibraryCategoryStackView _updateIconImageViewsAnimated:](self, "_updateIconImageViewsAnimated:", 1);
}

- (double)_innerIconEdgeSpacingFraction
{
  return 0.133333333;
}

- (double)_innerIconInterSpacingFraction
{
  return 0.0666666667;
}

- (SBIconImageInfo)_innerIconImageInfo
{
  double v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  BOOL v9;
  double scale;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  SBIconImageInfo *result;

  -[SBHLibraryCategoryStackView bounds](self, "bounds");
  v6 = *MEMORY[0x1E0C9D820];
  v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v8 = self->_iconImageInfo.size.width == *MEMORY[0x1E0C9D820] && self->_iconImageInfo.size.height == v7;
  if (v8 || (v4 == v6 ? (v9 = v5 == v7) : (v9 = 0), v9))
  {
    v17 = 0.0;
    v16 = 0.0;
  }
  else
  {
    scale = self->_iconImageInfo.scale;
    -[SBHLibraryCategoryStackView _innerIconEdgeSpacingFraction](self, "_innerIconEdgeSpacingFraction");
    -[SBHLibraryCategoryStackView _innerIconInterSpacingFraction](self, "_innerIconInterSpacingFraction");
    UIRoundToScale();
    v12 = v11;
    UIRoundToScale();
    v14 = v13;
    UICeilToScale();
    v16 = v15;
    v6 = v12;
    v7 = v14;
    v17 = scale;
  }
  SBIconImageInfoMake(v6, v7, v17, v16);
  return result;
}

- (void)_updateIconImageViewsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;

  v3 = a3;
  if (-[NSMutableArray count](self->_iconImageViews, "count"))
  {
    v5 = 0;
    do
      -[SBHLibraryCategoryStackView _updateIconImageViewAtIndex:animated:](self, "_updateIconImageViewAtIndex:animated:", v5++, v3);
    while (v5 < -[NSMutableArray count](self->_iconImageViews, "count"));
  }
}

- (void)_updateIconImageViewAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  void (**v22)(_QWORD);
  _QWORD aBlock[4];
  id v24;
  id v25;
  SBHLibraryCategoryStackView *v26;
  id v27;

  v4 = a4;
  -[NSMutableArray objectAtIndex:](self->_iconImageViews, "objectAtIndex:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_innerIcons, "count") <= a3)
  {
    v8 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_innerIcons, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SBHLibraryCategoryStackView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__SBHLibraryCategoryStackView__updateIconImageViewAtIndex_animated___block_invoke;
  aBlock[3] = &unk_1E8D86330;
  v11 = v7;
  v24 = v11;
  v12 = v8;
  v25 = v12;
  v26 = self;
  v13 = v9;
  v27 = v13;
  v14 = (void (**)(_QWORD))_Block_copy(aBlock);
  v15 = v14;
  if (v4)
  {
    v16 = (void *)MEMORY[0x1E0DC3F10];
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __68__SBHLibraryCategoryStackView__updateIconImageViewAtIndex_animated___block_invoke_2;
    v21[3] = &unk_1E8D859C0;
    v22 = v14;
    objc_msgSend(v16, "transitionWithView:duration:options:animations:completion:", v11, 5242880, v21, 0, 0.25);

  }
  else
  {
    v14[2](v14);
  }
  objc_msgSend(v12, "nodeIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBHLibraryCategoryStackView-innerIcon-%lu:"), a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v12)
  {
    objc_msgSend(v18, "stringByAppendingString:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessibilityIdentifier:", v20);

  }
  else
  {
    objc_msgSend(v11, "setAccessibilityIdentifier:", 0);
  }

}

void __68__SBHLibraryCategoryStackView__updateIconImageViewAtIndex_animated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 440), "imageForIcon:compatibleWithTraitCollection:options:", v1, *(_QWORD *)(a1 + 56), 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setImage:", v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setImage:");
  }
}

uint64_t __68__SBHLibraryCategoryStackView__updateIconImageViewAtIndex_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_scalingAnimationSettingsForStackedViewAtIndex:(unint64_t)a3 scale:(double *)a4
{
  SBHLibraryIndicatorIconSettings *v6;
  SBHLibraryIndicatorIconSettings *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v6 = self->_iconSettings;
  v7 = v6;
  if (a3 == 1)
  {
    -[SBHLibraryIndicatorIconSettings pod2Scale](v6, "pod2Scale");
    v9 = v11;
    -[SBHLibraryIndicatorIconSettings pod2AnimationSettings](v7, "pod2AnimationSettings");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    if (a3 >= 3)
      NSLog(CFSTR("No indicator icon settings available for category stack view at index: %lu"), a3);
    -[SBHLibraryIndicatorIconSettings pod3Scale](v7, "pod3Scale");
    v9 = v12;
    -[SBHLibraryIndicatorIconSettings pod3AnimationSettings](v7, "pod3AnimationSettings");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBHLibraryIndicatorIconSettings pod1Scale](v6, "pod1Scale");
    v9 = v8;
    -[SBHLibraryIndicatorIconSettings pod1AnimationSettings](v7, "pod1AnimationSettings");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v10;
  if (a4)
    *(_QWORD *)a4 = v9;

  return v13;
}

- (NSString)description
{
  return (NSString *)-[SBHLibraryCategoryStackView descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHLibraryCategoryStackView succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHLibraryCategoryStackView descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBHLibraryCategoryStackView *v11;

  v4 = a3;
  -[SBHLibraryCategoryStackView succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__SBHLibraryCategoryStackView_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8D84EF0;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __69__SBHLibraryCategoryStackView_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "numberOfCategories"), CFSTR("numberOfCategories"));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "innerIcons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v4, CFSTR("innerIcons"), 0);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "backdropGroupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v6, CFSTR("backdropGroupName"));

  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "backdropGroupNamespace");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:withName:", v8, CFSTR("backdropGroupNamespace"));

}

- (unint64_t)numberOfCategories
{
  return self->_numberOfCategories;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (BOOL)isOverlapping
{
  return self->_overlapping;
}

- (NSArray)innerIcons
{
  return self->_innerIcons;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (NSString)backdropGroupNamespace
{
  return self->_backdropGroupNamespace;
}

- (BOOL)isInnerIconImageInfoFrozen
{
  return self->_innerIconImageInfoFrozen;
}

- (void)setInnerIconImageInfoFrozen:(BOOL)a3
{
  self->_innerIconImageInfoFrozen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropGroupNamespace, 0);
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
  objc_storeStrong((id *)&self->_innerIcons, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_iconSettings, 0);
  objc_storeStrong((id *)&self->_iconImageViews, 0);
  objc_storeStrong((id *)&self->_podBackgroundViews, 0);
}

@end
