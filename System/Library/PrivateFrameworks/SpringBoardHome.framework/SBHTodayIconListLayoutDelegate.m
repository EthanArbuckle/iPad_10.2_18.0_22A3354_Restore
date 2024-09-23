@implementation SBHTodayIconListLayoutDelegate

- (SBHTodayIconListLayoutDelegate)initWithIconListView:(id)a3
{
  id v4;
  SBHTodayIconListLayoutDelegate *v5;
  SBHTodayIconListLayoutDelegate *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *catchupProperties;
  NSMutableDictionary *v15;
  NSMutableDictionary *catchupTimers;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBHTodayIconListLayoutDelegate;
  v5 = -[SBHTodayIconListLayoutDelegate init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_iconListView, v4);
    objc_msgSend(v4, "layout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iconImageInfoForGridSizeClass:", CFSTR("SBHIconGridSizeClassDefault"));
    v9 = v8;
    objc_msgSend(v7, "iconImageInfoForGridSizeClass:", CFSTR("SBHIconGridSizeClassSmall"));
    v11 = v10;
    v6->_collapseHeight = v9;
    objc_msgSend(v4, "iconSpacing");
    v6->_distanceToApex = (v9 + v12) * 0.5;
    v6->_revealProgressMaxTranslation = v11;
    *(_WORD *)&v6->_carouselLayout = 256;
    v6->_visuallyRevealed = 1;
    *(_OWORD *)&v6->_revealProgress = xmmword_1D0193DC0;
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    catchupProperties = v6->_catchupProperties;
    v6->_catchupProperties = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    catchupTimers = v6->_catchupTimers;
    v6->_catchupTimers = v15;

  }
  return v6;
}

- (SBTodayIconListLayoutAttributes)layoutAttributesForIconCoordinate:(SEL)a3 metrics:(SBIconCoordinate)a4 adjustedForRevealProgress:(id)a5
{
  _BOOL8 v6;
  int64_t row;
  int64_t column;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  NSMutableDictionary *catchupProperties;
  void *v57;
  void *v58;
  double v59;
  double revealProgress;
  SBTodayIconListLayoutAttributes *result;
  double v62;
  double v63;
  double v64;
  id v65;

  v6 = a6;
  row = a4.row;
  column = a4.column;
  v65 = a5;
  -[SBHTodayIconListLayoutDelegate iconListView](self, "iconListView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iconAtCoordinate:metrics:", column, row, v65);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "gridSizeClass");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = CFSTR("SBHIconGridSizeClassDefault");
  }
  v15 = v14;
  objc_msgSend(v11, "layout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  SBHIconListLayoutIconImageInfoForGridSizeClass(v16, v15);
  v18 = v17;

  -[SBHTodayIconListLayoutDelegate _iconListView:originYForIconCoordinate:metrics:adjustedForRevealProgress:](self, "_iconListView:originYForIconCoordinate:metrics:adjustedForRevealProgress:", v11, column, row, v65, v6);
  v20 = v19;
  SBRectWithSize();
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v29 = 1.0;
  if (!-[SBHTodayIconListLayoutDelegate isCarouselLayout](self, "isCarouselLayout"))
  {
    v37 = 1.0;
    if (!v6)
      goto LABEL_43;
    goto LABEL_38;
  }
  v63 = v22;
  v64 = v26;
  v62 = v24;
  -[SBHTodayIconListLayoutDelegate containerView](self, "containerView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0.0;
  objc_msgSend(v30, "convertPoint:toView:", v11, 0.0, self->_carouselInsets.top);
  v33 = v32;
  objc_msgSend(v30, "bounds");
  objc_msgSend(v30, "convertPoint:toView:", v11, 0.0, v34 - self->_carouselInsets.bottom);
  v36 = v35;
  if (v20 >= v33)
  {
    if (v20 + v18 > v35)
      v31 = v20 + v18 - v35;
  }
  else
  {
    v31 = v20 - v33;
  }
  if ((BSFloatIsZero() & 1) != 0)
    goto LABEL_12;
  -[SBHTodayIconListLayoutDelegate collapseHeight](self, "collapseHeight");
  v39 = v38;
  -[SBHTodayIconListLayoutDelegate distanceToApex](self, "distanceToApex");
  v41 = fabs(v31);
  if (v28 - v41 >= v39)
    v28 = v28 - v41;
  else
    v28 = v39;
  if (v41 < v18 - v39)
  {
    if (v31 < 0.0)
    {
      v37 = 1.0;
      v20 = v33;
      goto LABEL_13;
    }
    v53 = v36 - v20;
    if (v36 - v20 < v39)
      v53 = v39;
    v20 = v36 - v53;
LABEL_12:
    v37 = 1.0;
LABEL_13:
    v24 = v62;
    v22 = v63;
    goto LABEL_35;
  }
  v42 = fmin(fmax((v41 - (v18 - v39)) / v40, -2.0), 2.0);
  v43 = v40;
  -[SBHTodayIconListLayoutDelegate scrollView](self, "scrollView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "_verticalVelocity");
  v46 = v45;

  v47 = 3.0;
  v48 = (fabs(v46) + -1.0) * 12.0 * 0.5 + 3.0;
  if (v48 >= 3.0)
    v47 = v48;
  v49 = v43 * (1.0 - (1.0 - v42) * (1.0 - v42)) / v47;
  v50 = v33 - v49;
  v51 = v36 - v39 + v49;
  if (v31 >= 0.0)
    v20 = v51;
  else
    v20 = v50;
  v52 = 1.0 - (1.0 - (v42 + -1.0)) * (1.0 - (v42 + -1.0)) + 1.0;
  if (v42 < 1.0)
    v52 = v42 * v42;
  v37 = 0.0;
  v24 = v62;
  v22 = v63;
  if (v52 <= 2.0)
  {
    if (v52 >= 1.0)
      v37 = 0.8 - (v52 + -1.0) * 0.8;
    else
      v37 = v52 * -0.2 + 1.0;
  }
  v29 = v52 * -0.04 * 0.5 + 1.0;
LABEL_35:
  if (objc_msgSend(v11, "alignsIconsOnPixelBoundaries"))
  {
    objc_msgSend(v11, "layout");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "iconImageInfo");

    BSFloatRoundForScale();
    v20 = v55;
  }
  v26 = v64;

  if (v6)
  {
LABEL_38:
    if (!self->_visuallyRevealed)
    {
      catchupProperties = self->_catchupProperties;
      objc_msgSend(v13, "uniqueIdentifier");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](catchupProperties, "objectForKey:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      if (v58)
      {
        objc_msgSend(v58, "presentationValue");
        revealProgress = 1.0 - (v59 + v59);
      }
      else
      {
        revealProgress = self->_revealProgress;
      }
      v37 = v37 * revealProgress;

    }
  }
LABEL_43:
  retstr->var0.origin.x = v22;
  retstr->var0.origin.y = v24;
  retstr->var0.size.width = v26;
  retstr->var0.size.height = v28;
  retstr->var1 = v20;
  retstr->var2 = v37;
  retstr->var3 = v29;

  return result;
}

- (CGRect)unadjustedBoundsForIconCoordinate:(SBIconCoordinate)a3
{
  int64_t row;
  int64_t column;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  row = a3.row;
  column = a3.column;
  -[SBHTodayIconListLayoutDelegate iconListView](self, "iconListView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHTodayIconListLayoutDelegate layoutAttributesForIconCoordinate:metrics:adjustedForRevealProgress:](self, "layoutAttributesForIconCoordinate:metrics:adjustedForRevealProgress:", column, row, v7, 0);

  v8 = v12;
  v9 = v13;
  v10 = v14;
  v11 = v15;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (double)unadjustedOriginYForIconCoordinate:(SBIconCoordinate)a3
{
  int64_t row;
  int64_t column;
  void *v6;
  void *v7;
  double v8;
  double v9;

  row = a3.row;
  column = a3.column;
  -[SBHTodayIconListLayoutDelegate iconListView](self, "iconListView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHTodayIconListLayoutDelegate _iconListView:originYForIconCoordinate:metrics:adjustedForRevealProgress:](self, "_iconListView:originYForIconCoordinate:metrics:adjustedForRevealProgress:", v6, column, row, v7, 0);
  v9 = v8;

  return v9;
}

- (void)setAdditionalLayoutInsets:(UIEdgeInsets)a3
{
  id v6;

  if (self->_additionalLayoutInsets.left != a3.left
    || self->_additionalLayoutInsets.top != a3.top
    || self->_additionalLayoutInsets.right != a3.right
    || self->_additionalLayoutInsets.bottom != a3.bottom)
  {
    self->_additionalLayoutInsets = a3;
    -[SBHTodayIconListLayoutDelegate iconListView](self, "iconListView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateIntrinsicContentSize");

  }
}

- (void)setRevealed:(BOOL)a3
{
  id v3;

  if (self->_revealed != a3)
  {
    self->_revealed = a3;
    -[SBHTodayIconListLayoutDelegate iconListView](self, "iconListView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIconsNeedLayout");

  }
}

- (void)setRevealProgress:(double)a3
{
  id v3;

  if (self->_revealProgress != a3)
  {
    self->_revealProgress = a3;
    -[SBHTodayIconListLayoutDelegate iconListView](self, "iconListView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIconsNeedLayout");

  }
}

- (void)setDismissProgress:(double)a3
{
  id v3;

  if (self->_dismissProgress != a3)
  {
    self->_dismissProgress = a3;
    -[SBHTodayIconListLayoutDelegate iconListView](self, "iconListView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIconsNeedLayout");

  }
}

- (void)setVisuallyRevealed:(BOOL)a3
{
  -[SBHTodayIconListLayoutDelegate setVisuallyRevealed:animated:](self, "setVisuallyRevealed:animated:", a3, 0);
}

- (void)setVisuallyRevealed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  double v21;
  _QWORD v22[4];
  id v23;
  SBHTodayIconListLayoutDelegate *v24;
  double v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (self->_visuallyRevealed != a3)
  {
    v4 = a4;
    self->_visuallyRevealed = a3;
    -[SBHTodayIconListLayoutDelegate iconListView](self, "iconListView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIconsNeedLayout");
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[NSMutableDictionary allValues](self->_catchupTimers, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v34;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v34 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v11++), "invalidate");
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v9);
    }

    -[NSMutableDictionary removeAllObjects](self->_catchupTimers, "removeAllObjects");
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[NSMutableDictionary allValues](self->_catchupProperties, "allValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v30;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v16++), "invalidate");
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v14);
    }

    -[NSMutableDictionary removeAllObjects](self->_catchupProperties, "removeAllObjects");
    if (v4)
    {
      v17 = MEMORY[0x1E0C809B0];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __63__SBHTodayIconListLayoutDelegate_setVisuallyRevealed_animated___block_invoke;
      v28[3] = &unk_1E8D87340;
      v28[4] = self;
      objc_msgSend(v6, "enumerateIconViewsUsingBlock:", v28);
      v18 = (void *)MEMORY[0x1E0DC3F10];
      -[NSMutableDictionary allValues](self->_catchupProperties, "allValues");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v17;
      v26[1] = 3221225472;
      v26[2] = __63__SBHTodayIconListLayoutDelegate_setVisuallyRevealed_animated___block_invoke_2;
      v26[3] = &unk_1E8D84C50;
      v20 = v6;
      v27 = v20;
      objc_msgSend(v18, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v19, v26);

      if (self->_visuallyRevealed)
        v21 = 0.0;
      else
        v21 = 1.0;
      v22[0] = v17;
      v22[1] = 3221225472;
      v22[2] = __63__SBHTodayIconListLayoutDelegate_setVisuallyRevealed_animated___block_invoke_3;
      v22[3] = &unk_1E8D8C320;
      v23 = v20;
      v24 = self;
      v25 = v21;
      objc_msgSend(v23, "enumerateIconViewsUsingBlock:", v22);

    }
  }
}

void __63__SBHTodayIconListLayoutDelegate_setVisuallyRevealed_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  id v7;

  objc_msgSend(a2, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc_init(MEMORY[0x1E0DC3F30]);
  v5 = v4;
  v6 = 1.0;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 10))
    v6 = 0.0;
  objc_msgSend(v4, "setValue:", v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKey:", v5, v7);

}

uint64_t __63__SBHTodayIconListLayoutDelegate_setVisuallyRevealed_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIconsNeedLayout");
}

void __63__SBHTodayIconListLayoutDelegate_setVisuallyRevealed_animated___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  long double v9;
  long double v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;

  objc_msgSend(a2, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "coordinateForIconAtIndex:", a3);
  v8 = v7 - 1;
  if (v7 < 1)
    v8 = v7;
  v9 = (double)(unint64_t)(v8 >> 1);
  v10 = pow(0.9, v9);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = v10 * 0.05 * v9;
  if (*(_BYTE *)(v11 + 10))
    v13 = v12;
  else
    v13 = 0.0;
  v14 = (void *)MEMORY[0x1E0C99E88];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __63__SBHTodayIconListLayoutDelegate_setVisuallyRevealed_animated___block_invoke_4;
  v18[3] = &unk_1E8D8C2F8;
  v18[4] = v11;
  v19 = v6;
  v20 = *(_QWORD *)(a1 + 48);
  v15 = v6;
  objc_msgSend(v14, "timerWithTimeInterval:repeats:block:", 0, v18, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "setObject:forKey:", v16, v15);
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addTimer:forMode:", v16, *MEMORY[0x1E0C99860]);

}

void __63__SBHTodayIconListLayoutDelegate_setVisuallyRevealed_animated___block_invoke_4(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;

  v3 = a1[5];
  v4 = *(void **)(a1[4] + 56);
  v5 = a2;
  objc_msgSend(v4, "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__SBHTodayIconListLayoutDelegate_setVisuallyRevealed_animated___block_invoke_5;
  v16[3] = &unk_1E8D84C78;
  v17 = v6;
  v18 = a1[6];
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __63__SBHTodayIconListLayoutDelegate_setVisuallyRevealed_animated___block_invoke_6;
  v12[3] = &unk_1E8D8C2D0;
  v9 = a1[4];
  v10 = (void *)a1[5];
  v13 = v17;
  v14 = v9;
  v15 = v10;
  v11 = v17;
  objc_msgSend(v7, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v16, v12, 145.0, 24.0);
  objc_msgSend(v5, "invalidate");

  objc_msgSend(*(id *)(a1[4] + 64), "removeObjectForKey:", a1[5]);
}

void *__63__SBHTodayIconListLayoutDelegate_setVisuallyRevealed_animated___block_invoke_5(uint64_t a1)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)objc_msgSend(result, "setValue:", *(double *)(a1 + 40));
  return result;
}

void __63__SBHTodayIconListLayoutDelegate_setVisuallyRevealed_animated___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "objectForKey:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "removeObjectForKey:", *(_QWORD *)(a1 + 48));
}

- (CGPoint)iconListView:(id)a3 originForIconCoordinate:(SBIconCoordinate)a4 metrics:(id)a5 proposedOrigin:(CGPoint)a6
{
  double y;
  CGFloat x;
  int64_t row;
  int64_t column;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;

  y = a6.y;
  x = a6.x;
  row = a4.row;
  column = a4.column;
  v12 = a3;
  v13 = a5;
  if (-[SBHTodayIconListLayoutDelegate isCarouselLayout](self, "isCarouselLayout"))
  {
    -[SBHTodayIconListLayoutDelegate layoutAttributesForIconCoordinate:metrics:adjustedForRevealProgress:](self, "layoutAttributesForIconCoordinate:metrics:adjustedForRevealProgress:", column, row, v13, 1, 0, 0, 0);
    objc_msgSend(v12, "iconAtCoordinate:metrics:", column, row, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "gridSizeClass");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "iconImageInfoForGridSizeClass:", v16);
    v18 = v17;

    y = 0.0 * 0.5 + 0.0 - v18 * 0.5;
  }

  v19 = x;
  v20 = y;
  result.y = v20;
  result.x = v19;
  return result;
}

- (CGPoint)iconListView:(id)a3 centerForIconCoordinate:(SBIconCoordinate)a4 metrics:(id)a5 proposedCenter:(CGPoint)a6
{
  CGFloat x;
  double v7;
  double v8;
  CGPoint result;

  x = a6.x;
  -[SBHTodayIconListLayoutDelegate layoutAttributesForIconCoordinate:metrics:adjustedForRevealProgress:](self, "layoutAttributesForIconCoordinate:metrics:adjustedForRevealProgress:", a4.column, a4.row, a5, 1, 0, 0, 0);
  v7 = 0.0 * 0.5 + 0.0;
  v8 = x;
  result.y = v7;
  result.x = v8;
  return result;
}

- (unint64_t)iconListView:(id)a3 rowAtPoint:(CGPoint)a4 metrics:(id)a5 proposedRow:(unint64_t)a6
{
  double y;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  unint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  y = a4.y;
  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend(a5, "listModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "iconSpacing");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v11, "icons");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v13)
  {
    v14 = v13;
    v30 = a6;
    v31 = v11;
    v15 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v18 = objc_msgSend(v10, "coordinateForIcon:", v17, v30);
        v20 = v19;
        if (!SBIconCoordinateIsNotFound(v18, v19))
        {
          -[SBHTodayIconListLayoutDelegate unadjustedOriginYForIconCoordinate:](self, "unadjustedOriginYForIconCoordinate:", v18, v20);
          v22 = v21;
          objc_msgSend(v17, "gridSizeClass");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v10, "iconGridSizeForClass:", v23);

          objc_msgSend(v10, "layout");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "gridSizeClass");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          SBHIconListLayoutIconImageInfoForGridSizeClass(v25, v26);
          v28 = v27;

          if (BSFloatGreaterThanOrEqualToFloat())
          {
            if (BSFloatLessThanOrEqualToFloat())
            {
              a6 = v20 + (unint64_t)((y - v22) / (v28 / (double)HIWORD(v24))) - 1;
              goto LABEL_13;
            }
          }
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v14)
        continue;
      break;
    }
    a6 = v30;
LABEL_13:
    v11 = v31;
  }

  return a6;
}

- (CGSize)iconListView:(id)a3 sizeThatFits:(CGSize)a4 metrics:(id)a5 proposedSize:(CGSize)a6
{
  CGFloat width;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  CGSize result;

  width = a6.width;
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "icons");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "iconInsets");
  v14 = v13;
  v16 = v15;

  if (v12)
  {
    v17 = objc_msgSend(v9, "coordinateForIcon:", v12);
    -[SBHTodayIconListLayoutDelegate unadjustedOriginYForIconCoordinate:](self, "unadjustedOriginYForIconCoordinate:", v17, v18);
    v20 = v19;
    objc_msgSend(v9, "layout");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "gridSizeClass");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "iconImageInfoForGridSizeClass:", v22);
    v24 = v23;

  }
  else
  {
    v20 = v14 + self->_additionalLayoutInsets.top;
    v24 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v25 = self->_additionalLayoutInsets.bottom + v16 + v20 + v24;

  v26 = width;
  v27 = v25;
  result.height = v27;
  result.width = v26;
  return result;
}

- (void)iconListView:(id)a3 willLayoutIconView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CGFloat sx;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "layoutMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "icon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "coordinateForIcon:", v9);
  v12 = v11;

  sx = 0.0;
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  -[SBHTodayIconListLayoutDelegate layoutAttributesForIconCoordinate:metrics:adjustedForRevealProgress:](self, "layoutAttributesForIconCoordinate:metrics:adjustedForRevealProgress:", v10, v12, v8, 1);
  if ((objc_msgSend(v7, "allIconElementsButLabelHidden") & 1) == 0)
    objc_msgSend(v7, "setIconImageAndAccessoryAlpha:", *((double *)&v27 + 1));
  objc_msgSend(v7, "setIconImageSizeMatchesBoundsSize:", 1);
  objc_msgSend(v7, "setBounds:", v25, v26);
  objc_msgSend(v7, "setUserInteractionEnabled:", BSFloatGreaterThanFloat());
  memset(&v24, 0, sizeof(v24));
  CGAffineTransformMakeScale(&v24, sx, sx);
  objc_msgSend(v7, "center");
  v14 = v13;
  objc_msgSend(v6, "bounds");
  v22 = v24;
  CGAffineTransformTranslate(&v23, &v22, (1.0 - sx) * (v15 * 0.5 - v14), 0.0);
  v24 = v23;
  objc_msgSend(v7, "setTransform:", &v23);
  objc_msgSend(v7, "customIconImageViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBHTodayIconListLayoutDelegate containerView](self, "containerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    UIRectGetCenter();
    objc_msgSend(v7, "convertPoint:toView:", v17);
    v19 = v18;
    objc_msgSend(v17, "bounds");
    objc_msgSend(v16, "setImageViewAlignment:", v19 < self->_carouselInsets.top + v20 + (v21 - (self->_carouselInsets.top + self->_carouselInsets.bottom)) * 0.5);

  }
  objc_msgSend(v7, "layoutIfNeeded");

}

- (void)iconListViewDidLayoutIcons:(id)a3
{
  id v4;

  v4 = a3;
  if (-[SBHTodayIconListLayoutDelegate isCarouselLayout](self, "isCarouselLayout"))
  {
    -[SBHTodayIconListLayoutDelegate _reorderSubviewsForCarouselLayoutInListView:](self, "_reorderSubviewsForCarouselLayoutInListView:", v4);
    -[SBHTodayIconListLayoutDelegate _layoutFocusGuideViewsInListView:](self, "_layoutFocusGuideViewsInListView:", v4);
  }

}

- (void)_reorderSubviewsForCarouselLayoutInListView:(id)a3
{
  id v4;
  void *v5;
  double top;
  double left;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void (**v34)(void *, void *);
  void *v35;
  unint64_t v36;
  void *v37;
  unsigned int v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  unint64_t v43;
  _QWORD aBlock[4];
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;

  v4 = a3;
  if (-[SBHTodayIconListLayoutDelegate isCarouselLayout](self, "isCarouselLayout"))
  {
    v68 = 0;
    v69 = &v68;
    v70 = 0x3032000000;
    v71 = __Block_byref_object_copy__17;
    v72 = __Block_byref_object_dispose__17;
    v73 = 0;
    v62 = 0;
    v63 = &v62;
    v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__17;
    v66 = __Block_byref_object_dispose__17;
    v67 = 0;
    v56 = 0;
    v57 = &v56;
    v58 = 0x3032000000;
    v59 = __Block_byref_object_copy__17;
    v60 = __Block_byref_object_dispose__17;
    v61 = 0;
    -[SBHTodayIconListLayoutDelegate containerView](self, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    top = self->_carouselInsets.top;
    left = self->_carouselInsets.left;
    v9 = v8 + left;
    v11 = v10 + top;
    v13 = v12 - (left + self->_carouselInsets.right);
    v15 = v14 - (top + self->_carouselInsets.bottom);
    v16 = MEMORY[0x1E0C809B0];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __78__SBHTodayIconListLayoutDelegate__reorderSubviewsForCarouselLayoutInListView___block_invoke;
    v47[3] = &unk_1E8D8C348;
    v17 = v5;
    v52 = v9;
    v53 = v11;
    v54 = v13;
    v55 = v15;
    v48 = v17;
    v49 = &v68;
    v50 = &v62;
    v51 = &v56;
    objc_msgSend(v4, "enumerateIconViewsUsingBlock:", v47);
    v18 = (void *)v69[5];
    if (!v18)
    {
      v18 = (void *)v63[5];
      if (!v18)
        v18 = (void *)v57[5];
    }
    v19 = v18;
    objc_msgSend(v19, "icon");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v4, "layoutMetrics");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "listModel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "gridCellInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "indexForIcon:", v20);
      if (v24 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v25 = objc_msgSend(v23, "gridCellIndexForIconIndex:", v24);
        if (v25 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v23, "coordinateForGridCellIndex:", v25);
          if (v26 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v22, "iconsInGridRow:gridCellInfo:", v26 - 1, v23);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v21;
            objc_msgSend(v27, "firstObject");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v22, "indexForIcon:", v28);

            v42 = v27;
            objc_msgSend(v27, "lastObject");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v22, "indexForIcon:", v30);

            v41 = objc_msgSend(v22, "gridCellIndexForIconIndex:gridCellInfo:", v29, v23);
            v32 = (unint64_t)v42;
            v33 = objc_msgSend(v22, "gridCellIndexForIconIndex:gridCellInfo:", v31, v23);
            v43 = objc_msgSend(v22, "maxNumberOfIcons");
            v38 = objc_msgSend(v22, "gridSize");
            aBlock[0] = v16;
            aBlock[1] = 3221225472;
            aBlock[2] = __78__SBHTodayIconListLayoutDelegate__reorderSubviewsForCarouselLayoutInListView___block_invoke_2;
            aBlock[3] = &unk_1E8D8C370;
            v39 = v42;
            v45 = v39;
            v46 = v4;
            v34 = (void (**)(void *, void *))_Block_copy(aBlock);
            if (v41)
            {
              v32 = v41 - 1;
              do
              {
                objc_msgSend(v22, "iconAtGridCellIndex:gridCellInfo:", v32, v23);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v34[2](v34, v35);

                --v32;
              }
              while (v32 != -1);
            }
            v36 = v33 + 1;
            if (v33 + 1 < v43)
            {
              while (1)
              {
                objc_msgSend(v22, "iconAtGridCellIndex:gridCellInfo:", v36, v23);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v37)
                {
                  v32 = v32 & 0xFFFFFFFF00000000 | v38;
                  if (SBIconCoordinateMakeWithGridCellIndex(v36, v32) == 1)
                    break;
                }
                v34[2](v34, v37);

                if (++v36 >= v43)
                  goto LABEL_18;
              }

            }
LABEL_18:

            v21 = v40;
          }
        }
      }

    }
    _Block_object_dispose(&v56, 8);

    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v68, 8);

  }
}

void __78__SBHTodayIconListLayoutDelegate__reorderSubviewsForCarouselLayoutInListView___block_invoke(uint64_t a1, void *a2)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinY;
  double MaxY;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  id *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v17 = a2;
  objc_msgSend(v17, "bounds");
  objc_msgSend(v17, "convertRect:toView:", *(_QWORD *)(a1 + 32));
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  MinY = CGRectGetMinY(v18);
  if (MinY >= CGRectGetMinY(*(CGRect *)(a1 + 64)))
  {
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    MaxY = CGRectGetMaxY(v19);
    if (MaxY <= CGRectGetMaxY(*(CGRect *)(a1 + 64)))
    {
      objc_msgSend(v17, "effectiveIconImageAlpha");
      if ((BSFloatIsZero() & 1) == 0)
      {
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v16 = *(_QWORD *)(v15 + 40);
        v14 = (id *)(v15 + 40);
        if (v16)
          goto LABEL_13;
        goto LABEL_12;
      }
    }
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_QWORD *)(v10 + 40))
    goto LABEL_11;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v11 = CGRectGetMinY(v20);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "frame");
  if (v11 < CGRectGetMinY(v21))
  {
    v12 = *(_QWORD *)(a1 + 48);
    goto LABEL_10;
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (!*(_QWORD *)(v10 + 40))
  {
LABEL_11:
    v14 = (id *)(v10 + 40);
LABEL_12:
    objc_storeStrong(v14, a2);
    goto LABEL_13;
  }
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v13 = CGRectGetMaxY(v22);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "frame");
  if (v13 <= CGRectGetMaxY(v23))
    goto LABEL_13;
  v12 = *(_QWORD *)(a1 + 56);
LABEL_10:
  v10 = *(_QWORD *)(v12 + 8);
  if (!*(_QWORD *)(v10 + 40))
    goto LABEL_11;
LABEL_13:

}

void __78__SBHTodayIconListLayoutDelegate__reorderSubviewsForCarouselLayoutInListView___block_invoke_2(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6);
  v4 = v6;
  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "displayedIconViewForIcon:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(*(id *)(a1 + 40), "sendSubviewToBack:", v5);

    v4 = v6;
  }

}

- (void)_layoutFocusGuideViewsInListView:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  SBHTodayIconListLayoutDelegate *v18;
  BOOL v19;

  v4 = a3;
  v5 = -[SBHTodayIconListLayoutDelegate isCarouselLayout](self, "isCarouselLayout");
  objc_msgSend(v4, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gridCellInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__SBHTodayIconListLayoutDelegate__layoutFocusGuideViewsInListView___block_invoke;
  v13[3] = &unk_1E8D8C398;
  v14 = v7;
  v15 = v6;
  v16 = v4;
  v17 = v8;
  v19 = v5;
  v18 = self;
  v9 = v8;
  v10 = v4;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v10, "enumerateIconViewsUsingBlock:", v13);

}

void __67__SBHTodayIconListLayoutDelegate__layoutFocusGuideViewsInListView___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;

  v20 = a2;
  if (objc_msgSend(v20, "wantsFocusProxyView"))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "coordinateForGridCellIndex:", objc_msgSend(*(id *)(a1 + 32), "gridCellIndexForIconIndex:", a3));
    v7 = v6;
    objc_msgSend(v20, "focusProxyView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 40);
    objc_msgSend(v20, "icon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "gridSizeClass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconImageInfoForGridSizeClass:", v11);
    v13 = v12;
    v15 = v14;

    objc_msgSend(*(id *)(a1 + 48), "originForIconAtCoordinate:metrics:", v5, v7, *(_QWORD *)(a1 + 56));
    v18 = v17;
    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(*(id *)(a1 + 64), "_iconListView:originYForIconCoordinate:metrics:adjustedForRevealProgress:", *(_QWORD *)(a1 + 48), v5, v7, *(_QWORD *)(a1 + 56), 0);
      v16 = v19;
    }
    objc_msgSend(v8, "setFrame:", v18, v16, v13, v15);
    objc_msgSend(*(id *)(a1 + 48), "sendSubviewToBack:", v8);

  }
}

- (double)_iconListView:(id)a3 originYForIconCoordinate:(SBIconCoordinate)a4 metrics:(id)a5 adjustedForRevealProgress:(BOOL)a6
{
  int64_t row;
  int64_t column;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  double v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  NSMutableDictionary *catchupProperties;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  int64_t v43;
  int64_t v44;
  SBHTodayIconListLayoutDelegate *v45;
  id v47;
  void *v48;

  row = a4.row;
  column = a4.column;
  v10 = a3;
  v11 = a5;
  objc_msgSend(v11, "gridCellInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "columns");
  objc_msgSend(v11, "iconSpacing");
  v15 = v14;
  objc_msgSend(v11, "iconInsets");
  v17 = v16;
  v43 = column;
  v44 = row;
  v18 = column - 1;
  v19 = column - 1 + v13 * (row - 1);
  v20 = objc_msgSend(v12, "iconIndexForGridCellIndex:", v19);
  v48 = v10;
  objc_msgSend(v10, "layout");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v11;
  objc_msgSend(v11, "listModel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = self;
  v23 = v17 + self->_additionalLayoutInsets.top;
  if (v18 < v19)
  {
    v24 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v25 = objc_msgSend(v12, "iconIndexForGridCellIndex:", v18);
      v26 = v25;
      if (v25 == v24 || v25 >= v20)
      {
        if (v25 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v21, "iconImageInfoForGridSizeClass:", CFSTR("SBHIconGridSizeClassDefault"));
          v23 = v23 + v15 + v31;
        }
      }
      else
      {
        objc_msgSend(v22, "iconAtIndex:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "gridSizeClass");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "iconImageInfoForGridSizeClass:", v28);
        v30 = v29;

        v23 = v23 + v15 + v30;
        v24 = v26;
      }
      v18 += v13;
    }
    while (v18 < v19);
  }
  if (a6)
  {
    v33 = v47;
    v32 = v48;
    objc_msgSend(v48, "iconAtCoordinate:metrics:", v43, v44, v47);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    catchupProperties = v45->_catchupProperties;
    objc_msgSend(v34, "uniqueIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](catchupProperties, "objectForKey:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBHTodayIconListLayoutDelegate revealProgressMaxTranslation](v45, "revealProgressMaxTranslation");
    v39 = v38;
    if (v37)
    {
      objc_msgSend(v37, "presentationValue");
      v23 = v23 + v39 * v40;
    }
    else
    {
      v41 = -0.0;
      if (!v45->_visuallyRevealed)
        v41 = v39;
      v23 = v23 + v41;
    }

  }
  else
  {
    v33 = v47;
    v32 = v48;
  }

  return v23;
}

- (SBIconListView)iconListView
{
  return (SBIconListView *)objc_loadWeakRetained((id *)&self->_iconListView);
}

- (UIView)containerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_containerView);
}

- (void)setContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_containerView, a3);
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (void)setScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_scrollView, a3);
}

- (BOOL)isCarouselLayout
{
  return self->_carouselLayout;
}

- (void)setCarouselLayout:(BOOL)a3
{
  self->_carouselLayout = a3;
}

- (UIEdgeInsets)carouselInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_carouselInsets.top;
  left = self->_carouselInsets.left;
  bottom = self->_carouselInsets.bottom;
  right = self->_carouselInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setCarouselInsets:(UIEdgeInsets)a3
{
  self->_carouselInsets = a3;
}

- (UIEdgeInsets)additionalLayoutInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_additionalLayoutInsets.top;
  left = self->_additionalLayoutInsets.left;
  bottom = self->_additionalLayoutInsets.bottom;
  right = self->_additionalLayoutInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)isRevealed
{
  return self->_revealed;
}

- (double)revealProgress
{
  return self->_revealProgress;
}

- (double)dismissProgress
{
  return self->_dismissProgress;
}

- (BOOL)isVisuallyRevealed
{
  return self->_visuallyRevealed;
}

- (NSMutableDictionary)catchupProperties
{
  return self->_catchupProperties;
}

- (void)setCatchupProperties:(id)a3
{
  objc_storeStrong((id *)&self->_catchupProperties, a3);
}

- (NSMutableDictionary)catchupTimers
{
  return self->_catchupTimers;
}

- (void)setCatchupTimers:(id)a3
{
  objc_storeStrong((id *)&self->_catchupTimers, a3);
}

- (double)collapseHeight
{
  return self->_collapseHeight;
}

- (double)distanceToApex
{
  return self->_distanceToApex;
}

- (double)revealProgressMaxTranslation
{
  return self->_revealProgressMaxTranslation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catchupTimers, 0);
  objc_storeStrong((id *)&self->_catchupProperties, 0);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_destroyWeak((id *)&self->_containerView);
  objc_destroyWeak((id *)&self->_iconListView);
}

@end
