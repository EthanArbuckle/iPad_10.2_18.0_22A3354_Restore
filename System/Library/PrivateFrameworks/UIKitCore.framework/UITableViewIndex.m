@implementation UITableViewIndex

- (int64_t)_coreIdiom
{
  return self->_idiom;
}

- (int64_t)_idiom
{
  void *v3;
  void *v4;
  int64_t v5;

  if (self->_idiom != -1)
    return self->_idiom;
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_userInterfaceIdiom");

  return v5;
}

- (void)_setIdiom:(int64_t)a3
{
  UITableViewIndexVisualStyle *v4;
  UITableViewIndexVisualStyle *visualStyle;

  self->_idiom = a3;
  objc_msgSend((id)objc_opt_class(), "visualStyleForTableViewIndex:", self);
  v4 = (UITableViewIndexVisualStyle *)objc_claimAutoreleasedReturnValue();
  visualStyle = self->_visualStyle;
  self->_visualStyle = v4;

  if (self->_titles)
    -[UITableViewIndex _cacheAndMeasureTitles](self, "_cacheAndMeasureTitles");
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
}

- (double)_minLineSpacingForIdiom:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;

  -[UITableViewIndex visualStyle](self, "visualStyle", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minLineSpacing");
  v5 = v4;

  return v5;
}

- (id)_displayTitles
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  unint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  float v25;
  float i;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  int v33;

  v3 = (id)-[NSArray mutableCopy](self->_titles, "mutableCopy");
  if (objc_msgSend(v3, "count"))
  {
    -[UITableViewIndex _effectiveBounds](self, "_effectiveBounds");
    v5 = v4;
    v6 = (double)(uint64_t)floor(v4 / (double)(unint64_t)objc_msgSend(v3, "count"));
    -[UITableViewIndex _minLineSpacingForIdiom:](self, "_minLineSpacingForIdiom:", -[UITableViewIndex _idiom](self, "_idiom"));
    if (v7 <= v6)
    {
      v22 = v3;
      goto LABEL_20;
    }
    objc_msgSend(v3, "indexesOfObjectsPassingTest:", &__block_literal_global_534);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectsAtIndexes:", v8);

    v9 = -[UITableViewIndex maximumNumberOfTitlesWithoutTruncationForHeight:](self, "maximumNumberOfTitlesWithoutTruncationForHeight:", v5);
    objc_msgSend(v3, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("{search}"));

    objc_msgSend(v3, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v12, "isEqualToString:", CFSTR("{search}"));

    objc_msgSend(v3, "objectAtIndex:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("#"));

    objc_msgSend(v3, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("#"));

    v33 = (int)v10;
    v17 = (v14 | v16) + (unint64_t)(v11 | v10);
    v18 = v9 - v17 + ((v9 - v17) & 1);
    if (v18 - 1 >= 0)
      v19 = v18 - 1;
    else
      v19 = v9 - v17 + ((v9 - v17) & 1);
    v20 = objc_msgSend(v3, "count");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v11)
      objc_msgSend(v21, "addObject:", CFSTR("{search}"));
    if (v14)
      objc_msgSend(v22, "addObject:", CFSTR("#"));
    v23 = v11 | v14;
    v24 = v20 + ~v17;
    v25 = (float)v24;
    for (i = (float)v23; i < v25; i = (float)(v25 / (float)((v19 >> 1) & ~(v19 >> 63))) + i)
    {
      objc_msgSend(v3, "objectAtIndex:", llroundf(i));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v27);

      objc_msgSend(v22, "addObject:", CFSTR("•"));
    }
    objc_msgSend(v3, "objectAtIndex:", v24 + v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v22, "containsObject:", v28) & 1) != 0)
    {
      objc_msgSend(v22, "lastObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isEqual:", CFSTR("•"));

      if (!v30)
      {
        if (!v33)
          goto LABEL_15;
LABEL_25:
        objc_msgSend(v22, "addObject:", CFSTR("{search}"));
        if (!v16)
          goto LABEL_17;
        goto LABEL_16;
      }
      objc_msgSend(v22, "removeLastObject");
      if (v33)
        goto LABEL_25;
    }
    else
    {
      objc_msgSend(v22, "addObject:", v28);
      if (v33)
        goto LABEL_25;
    }
LABEL_15:
    if (!v16)
    {
LABEL_17:

LABEL_20:
      v3 = v22;
      v31 = v3;
      goto LABEL_21;
    }
LABEL_16:
    objc_msgSend(v22, "addObject:", CFSTR("#"));
    goto LABEL_17;
  }
  v31 = (void *)MEMORY[0x1E0C9AA60];
LABEL_21:

  return v31;
}

uint64_t __34__UITableViewIndex__displayTitles__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", CFSTR("•"));
}

- (void)_cacheAndMeasureTitles
{
  UITableViewIndex *v2;
  NSArray *entries;
  double v4;
  double v5;
  char v6;
  double v7;
  double v8;
  unint64_t v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  _UITableViewIndexEntry *v22;
  __CFString *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  const __CFString *v30;
  UITableViewIndex *v31;
  void *v32;
  const __CFAttributedString *v33;
  CTLineRef v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[2];
  _QWORD v47[2];
  _BYTE v48[128];
  uint64_t v49;
  CGRect BoundsWithOptions;
  CGRect v51;

  v2 = self;
  v49 = *MEMORY[0x1E0C80C00];
  entries = self->_entries;
  if (entries)
  {
    self->_entries = 0;

  }
  -[UITableViewIndex _minLineSpacingForIdiom:](v2, "_minLineSpacingForIdiom:", -[UITableViewIndex _idiom](v2, "_idiom", 576));
  v5 = v4;
  v6 = -[UITableViewIndex drawingInsetsMask](v2, "drawingInsetsMask");
  -[UITableViewIndex _effectiveBounds](v2, "_effectiveBounds");
  v8 = v7;
  if (v5 <= (double)(uint64_t)floor(v7 / (double)-[NSArray count](v2->_titles, "count")))
  {
    if ((v6 & 1) != 0)
      goto LABEL_10;
    -[UITableViewIndex drawingInsets](v2, "drawingInsets");
    if (v5 >= (double)(uint64_t)floor((v8 - v10) / (double)-[NSArray count](v2->_titles, "count")))
      goto LABEL_10;
    v9 = -[UITableViewIndex drawingInsetsMask](v2, "drawingInsetsMask") | 1;
    goto LABEL_9;
  }
  if ((v6 & 1) != 0)
  {
    v9 = -[UITableViewIndex drawingInsetsMask](v2, "drawingInsetsMask") & 0xFFFFFFFFFFFFFFFELL;
LABEL_9:
    -[UITableViewIndex setDrawingInsetsMask:](v2, "setDrawingInsetsMask:", v9);
  }
LABEL_10:
  -[UITableViewIndex _displayTitles](v2, "_displayTitles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (!v14)
    goto LABEL_29;
  v15 = v14;
  v16 = *(_QWORD *)v43;
  v17 = CFSTR("{search}");
  v40 = *(_QWORD *)off_1E1678D90;
  v18 = *MEMORY[0x1E0C9D538];
  v19 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v38 = *MEMORY[0x1E0C9AE50];
  v39 = *MEMORY[0x1E0CA8558];
  v41 = v13;
  do
  {
    v20 = 0;
    do
    {
      if (*(_QWORD *)v43 != v16)
        objc_enumerationMutation(v13);
      v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v20);
      v22 = objc_alloc_init(_UITableViewIndexEntry);
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("#")))
      {
        v23 = CFSTR("UISectionListPoundSign");
        goto LABEL_19;
      }
      if (objc_msgSend(v21, "isEqualToString:", v17))
      {
        v23 = CFSTR("UITableViewIndexSearchGlyph");
LABEL_19:
        _UIImageWithName(v23);
        v24 = objc_claimAutoreleasedReturnValue();
LABEL_20:
        v25 = (void *)v24;
        -[_UITableViewIndexEntry setImage:](v22, "setImage:", v24);

        -[_UITableViewIndexEntry image](v22, "image");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "size");
        -[_UITableViewIndexEntry setBounds:](v22, "setBounds:", v18, v19, v27, v28);

        -[_UITableViewIndexEntry bounds](v22, "bounds");
        -[_UITableViewIndexEntry setTypeBounds:](v22, "setTypeBounds:");
        goto LABEL_21;
      }
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("•")))
      {
        -[UITableViewIndex _dotImage](v2, "_dotImage");
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("{appclip}")))
      {
        +[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("appclip"));
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      v46[0] = v40;
      -[UITableViewIndex font](v2, "font");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v46[1] = v39;
      v47[0] = v29;
      v47[1] = v38;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
      v30 = v17;
      v31 = v2;
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = (const __CFAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v21, v32);
      v34 = CTLineCreateWithAttributedString(v33);
      -[_UITableViewIndexEntry setLine:](v22, "setLine:", v34);

      BoundsWithOptions = CTLineGetBoundsWithOptions(v34, 0x10uLL);
      -[_UITableViewIndexEntry setBounds:](v22, "setBounds:", BoundsWithOptions.origin.x, BoundsWithOptions.origin.y, BoundsWithOptions.size.width, BoundsWithOptions.size.height);
      v51 = CTLineGetBoundsWithOptions(v34, 8uLL);
      -[_UITableViewIndexEntry setTypeBounds:](v22, "setTypeBounds:", v51.origin.x, v51.origin.y, v51.size.width, v51.size.height);

      v13 = v41;
      v2 = v31;
      v17 = v30;
LABEL_21:
      objc_msgSend(v12, "addObject:", v22);

      ++v20;
    }
    while (v15 != v20);
    v35 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    v15 = v35;
  }
  while (v35);
LABEL_29:

  v36 = *(Class *)((char *)&v2->super.super.super.super.isa + v37);
  *(Class *)((char *)&v2->super.super.super.super.isa + v37) = (Class)v12;

}

+ (void)makeTableViewIndex:(id *)a3 containerView:(id *)a4 forTraits:(id)a5
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a5;
  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UITableViewIndex.m"), 268, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index != nil"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UITableViewIndex.m"), 269, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view != nil"));

LABEL_3:
  v9 = objc_alloc((Class)a1);
  v10 = (void *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v11 = +[UITableViewIndex visualStyleForIdiom:]((uint64_t)a1, objc_msgSend(v17, "userInterfaceIdiom"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "containerViewForTableViewIndex:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_retainAutorelease(v10);
  v14 = v13;
  *a3 = v13;
  if (v12)
    v13 = v12;
  *a4 = objc_retainAutorelease(v13);

}

+ (id)visualStyleForIdiom:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_self();
  +[UITableViewIndex idiomToVisualStyleClassMap]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "objectForKey:", v4);

  if (!v5)
    v5 = (void *)objc_opt_class();
  return v5;
}

- (UITableViewIndex)initWithFrame:(CGRect)a3
{
  UITableViewIndex *v3;
  UITableViewIndex *v4;
  uint64_t v5;
  UITableViewIndexVisualStyle *visualStyle;
  CGSize v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;
  _QWORD v15[2];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)UITableViewIndex;
  v3 = -[UIControl initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_idiom = -1;
    objc_msgSend((id)objc_opt_class(), "visualStyleForTableViewIndex:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
    visualStyle = v4->_visualStyle;
    v4->_visualStyle = (UITableViewIndexVisualStyle *)v5;

    -[UIView setOpaque:](v4, "setOpaque:", 0);
    -[UIControl setRequiresDisplayOnTracking:](v4, "setRequiresDisplayOnTracking:", 1);
    -[UIView setNeedsDisplayOnBoundsChange:](v4, "setNeedsDisplayOnBoundsChange:", 1);
    -[UIView setDeliversTouchesForGesturesToSuperview:](v4, "setDeliversTouchesForGesturesToSuperview:", 0);
    -[UIView setExclusiveTouch:](v4, "setExclusiveTouch:", 1);
    v4->_selectedSection = 0x7FFFFFFFFFFFFFFFLL;
    v7 = (CGSize)*MEMORY[0x1E0C9D820];
    v4->_cachedSize = (CGSize)*MEMORY[0x1E0C9D820];
    v4->_cachedSizeToFit = v7;
    v4->_drawingInsetsMask = 15;
    v16[0] = 0x1E1A99498;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[UIView _registerForTraitTokenChanges:withTarget:action:](v4, "_registerForTraitTokenChanges:withTarget:action:", v8, v4, sel__setupAXHUDGestureIfNecessary);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v4, sel__largeContentViewerEnabledStatusDidChange_, CFSTR("UILargeContentViewerInteractionEnabledStatusDidChangeNotification"), 0);

    v15[0] = 0x1E1A99540;
    v15[1] = 0x1E1A995A0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[UIView _registerForTraitTokenChanges:withTarget:action:](v4, "_registerForTraitTokenChanges:withTarget:action:", v11, v4, sel__legibilityWeightOrPreferredContentSizeTraitsDidChange);

  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  CGSize *p_cachedSize;
  double v7;
  double v8;
  BOOL v9;
  BOOL v10;
  NSArray *v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v38 = *MEMORY[0x1E0C80C00];
  p_cachedSize = &self->_cachedSize;
  v7 = self->_cachedSize.width;
  v8 = self->_cachedSize.height;
  v9 = v7 == *MEMORY[0x1E0C9D820] && v8 == *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v9 || (self->_cachedSizeToFit.width == width ? (v10 = self->_cachedSizeToFit.height == height) : (v10 = 0), !v10))
  {
    -[UITableViewIndex _cacheAndMeasureTitles](self, "_cacheAndMeasureTitles");
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v11 = self->_entries;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    v13 = 0.0;
    v14 = 0.0;
    if (v12)
    {
      v15 = v12;
      v16 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(v11);
          v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v18, "bounds", (_QWORD)v33);
          v20 = v19;
          -[UITableViewIndex visualStyle](self, "visualStyle");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "lineSpacing");
          v23 = v22;

          objc_msgSend(v18, "bounds");
          if (v24 > v14)
          {
            objc_msgSend(v18, "bounds");
            v14 = v25;
          }
          v13 = v13 + v20 + v23 + v23;
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v15);
    }

    v26 = fmax((height - v13) * 0.5, 0.0);
    self->_bottomPadding = v26;
    self->_topPadding = v26;
    UICeilToViewScale(self);
    v28 = v27;
    -[UITableViewIndex visualStyle](self, "visualStyle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "indexWidth");
    v31 = fmax(v28, v30);

    if (v31 > width)
      v32 = width;
    else
      v32 = v31;
    p_cachedSize->width = v32;
    p_cachedSize->height = height;
    self->_cachedSizeToFit.width = width;
    self->_cachedSizeToFit.height = height;
    v7 = p_cachedSize->width;
    v8 = p_cachedSize->height;
  }
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setTitles:(id)a3
{
  NSArray *v4;
  NSArray *titles;
  CGSize v6;

  if (self->_titles != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    titles = self->_titles;
    self->_titles = v4;

    v6 = (CGSize)*MEMORY[0x1E0C9D820];
    self->_cachedSize = (CGSize)*MEMORY[0x1E0C9D820];
    self->_cachedSizeToFit = v6;
    -[UITableViewIndex _cacheAndMeasureTitles](self, "_cacheAndMeasureTitles");
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)UITableViewIndex;
  -[UIView frame](&v16, sel_frame);
  v18.origin.x = v8;
  v18.origin.y = v9;
  v11 = v10;
  v13 = v12;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v18.size.width = v11;
  v18.size.height = v13;
  if (!CGRectEqualToRect(v17, v18))
  {
    v15.receiver = self;
    v15.super_class = (Class)UITableViewIndex;
    -[UIView setFrame:](&v15, sel_setFrame_, x, y, width, height);
    if (width != v11 || height != v13)
      -[UITableViewIndex _cacheAndMeasureTitles](self, "_cacheAndMeasureTitles");
  }
}

- (void)setDrawingInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_drawingInsets.left
    || a3.top != self->_drawingInsets.top
    || a3.right != self->_drawingInsets.right
    || a3.bottom != self->_drawingInsets.bottom)
  {
    self->_drawingInsets = a3;
    -[UITableViewIndex _cacheAndMeasureTitles](self, "_cacheAndMeasureTitles");
  }
}

- (CGRect)_effectiveBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[UITableViewIndex drawingInsets](self, "drawingInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[UITableViewIndex drawingInsetsMask](self, "drawingInsetsMask");
  if ((v11 & 1) == 0)
    v4 = 0.0;
  if ((~v11 & 2) != 0)
    v6 = 0.0;
  if ((~v11 & 4) != 0)
    v8 = 0.0;
  if ((~v11 & 8) != 0)
    v10 = 0.0;
  -[UIView bounds](self, "bounds");
  v13 = v12 + v6;
  v15 = v14 + v4;
  v17 = v16 - (v6 + v10);
  v19 = v18 - (v4 + v8);
  result.size.height = v19;
  result.size.width = v17;
  result.origin.y = v15;
  result.origin.x = v13;
  return result;
}

- (NSArray)titles
{
  return self->_titles;
}

- (void)setFont:(id)a3
{
  UIFont *v4;
  void *v5;
  UIFont *font;

  v4 = (UIFont *)a3;
  -[UITableViewIndex visualStyle](self, "visualStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  font = self->_font;
  if (font != v4)
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
}

- (UIFont)font
{
  void *v2;
  void *v3;

  -[UITableViewIndex visualStyle](self, "visualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (NSString)selectedSectionTitle
{
  if (self->_selectedSection == 0x7FFFFFFFFFFFFFFFLL)
    return (NSString *)0;
  -[NSArray objectAtIndex:](self->_titles, "objectAtIndex:");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)maximumNumberOfTitlesWithoutTruncationForHeight:(double)a3
{
  double v4;

  -[UITableViewIndex _minLineSpacingForIdiom:](self, "_minLineSpacingForIdiom:", -[UITableViewIndex _idiom](self, "_idiom"));
  return vcvtmd_u64_f64(a3 / v4);
}

- (CGRect)_visibleBoundsForRect:(CGRect)a3 stride:(double *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v10;
  double v11;
  double v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t i;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  CGRect v36;
  CGRect v37;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v35 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_entries, "count"))
  {
    -[UITableViewIndex visualStyle](self, "visualStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lineSpacing");
    v12 = v11;

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v13 = self->_entries;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v31;
      v17 = 0.0;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "typeBounds", (_QWORD)v30);
          UIRoundToViewScale(self);
          v17 = v17 + v19;
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v15);
    }
    else
    {
      v17 = 0.0;
    }

    v22 = v17 + v12 * (double)(-[NSArray count](self->_entries, "count") - 1);
    -[NSArray objectAtIndexedSubscript:](self->_entries, "objectAtIndexedSubscript:", -[NSArray count](self->_entries, "count") - 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "typeBounds");
    v21 = v22 - v24;
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    CGRectGetMinY(v36);
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    CGRectGetHeight(v37);
    UIRoundToViewScale(self);
    v20 = v25;
    if (a4)
      *a4 = v12;

  }
  else
  {
    x = *MEMORY[0x1E0C9D648];
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v26 = x;
  v27 = v20;
  v28 = width;
  v29 = v21;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("contents")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITableViewIndex;
    v5 = -[UIView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (void)_legibilityWeightOrPreferredContentSizeTraitsDidChange
{
  void *v3;
  char v4;
  void *v5;

  -[UITableViewIndex visualStyle](self, "visualStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[UITableViewIndex visualStyle](self, "visualStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "legibilityWeightOrPreferredContentSizeUpdated");

  }
  -[UITableViewIndex _cacheAndMeasureTitles](self, "_cacheAndMeasureTitles");
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  char v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _QWORD *ContextStack;
  CGContext *v19;
  UIColor *indexTrackingBackgroundColor;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  NSUInteger v31;
  void *v32;
  char v33;
  void *v34;
  char v35;
  uint64_t v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  CGFloat v58;
  CGFloat v59;
  double v60;
  const __CTLine *v61;
  void *v62;
  void *v63;
  char v64;
  void *v65;
  CGFloat *p_b;
  double v67;
  double v68;
  id v69;
  CGAffineTransform v70;
  double v71[2];
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UITableViewIndex visualStyle](self, "visualStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[UITableViewIndex visualStyle](self, "visualStyle");
    v69 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "drawRect:", x, y, width, height);

    return;
  }
  -[UITableViewIndex _effectiveBounds](self, "_effectiveBounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v19 = 0;
  else
    v19 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  if (-[UIControl isTracking](self, "isTracking")
    && (indexTrackingBackgroundColor = self->_indexTrackingBackgroundColor) != 0
    || (indexTrackingBackgroundColor = self->_indexBackgroundColor) != 0)
  {
    -[UIColor set](indexTrackingBackgroundColor, "set");
  }
  else
  {
    -[UIView traitCollection](self, "traitCollection");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v63, "userInterfaceIdiom") == 3)
    {

      goto LABEL_11;
    }
    v64 = dyld_program_sdk_at_least();

    if ((v64 & 1) != 0)
      goto LABEL_11;
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.9);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "set");

  }
  v72.origin.x = v11;
  v72.origin.y = v13;
  v72.size.width = v15;
  v72.size.height = v17;
  CGContextFillRect(v19, v72);
LABEL_11:
  v71[0] = 0.0;
  -[UITableViewIndex _visibleBoundsForRect:stride:](self, "_visibleBoundsForRect:stride:", v71, v11, v13, v15, v17);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[UITableViewIndex indexColor](self, "indexColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
    -[UITableViewIndex indexColor](self, "indexColor");
  else
    -[UIView _inheritedInteractionTintColor](self, "_inheritedInteractionTintColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "set");
  v31 = -[NSArray count](self->_entries, "count");
  -[UITableViewIndex visualStyle](self, "visualStyle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_opt_respondsToSelector();

  -[UITableViewIndex visualStyle](self, "visualStyle");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_opt_respondsToSelector();

  if (v31)
  {
    v36 = 0;
    p_b = &v70.b;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_entries, "objectAtIndexedSubscript:", v36, p_b);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "bounds");
      v39 = v38;
      v41 = v40;
      v43 = v42;
      v45 = v44;
      if ((v33 & 1) != 0)
      {
        -[UITableViewIndex visualStyle](self, "visualStyle");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "willDrawEntryAtIndex:indexBounds:entryBounds:context:originalColor:", v36, v19, v30, v22, v24, v26, v28, v39, v41, v43, v45);

      }
      objc_msgSend(v37, "image");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        objc_msgSend(v37, "image");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "imageWithTintColor:renderingMode:", v30, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        v73.origin.x = v22;
        v73.origin.y = v24;
        v73.size.width = v26;
        v73.size.height = v28;
        CGRectGetMinX(v73);
        v67 = v41;
        v50 = v39;
        v74.origin.x = v22;
        v74.origin.y = v24;
        v74.size.width = v26;
        v74.size.height = v28;
        CGRectGetWidth(v74);
        UIRoundToViewScale(self);
        v52 = v51;
        v75.origin.x = v22;
        v75.origin.y = v24;
        v75.size.width = v26;
        v75.size.height = v28;
        CGRectGetMinY(v75);
        UIRoundToViewScale(self);
        v54 = v53;
        v55 = v52;
        v39 = v50;
        v41 = v67;
        objc_msgSend(v49, "drawAtPoint:blendMode:alpha:", 0, v55, v54, 1.0);

        v28 = v45;
      }
      else
      {
        objc_msgSend(v37, "line");
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        if (v56)
        {
          CGContextSaveGState(v19);
          v76.origin.x = v22;
          v76.origin.y = v24;
          v76.size.width = v26;
          v76.size.height = v28;
          CGRectGetMinX(v76);
          v68 = v39;
          v77.origin.x = v22;
          v77.origin.y = v24;
          v77.size.width = v26;
          v77.size.height = v28;
          CGRectGetWidth(v77);
          UIRoundToViewScale(self);
          v58 = v57;
          v78.origin.x = v22;
          v78.origin.y = v24;
          v78.size.width = v26;
          v78.size.height = v28;
          CGRectGetMinY(v78);
          objc_msgSend(v37, "typeBounds");
          UIRoundToViewScale(self);
          v60 = v59;
          *p_b = 0.0;
          p_b[1] = 0.0;
          v70.a = 1.0;
          v70.d = -1.0;
          v70.tx = v58;
          v70.ty = v59;
          v39 = v68;
          CGContextSetTextMatrix(v19, &v70);
          objc_msgSend(v37, "line");
          v61 = (const __CTLine *)objc_claimAutoreleasedReturnValue();
          CTLineDraw(v61, v19);

          CGContextRestoreGState(v19);
          v28 = v60 - v24;
        }
      }
      if ((v35 & 1) != 0)
      {
        -[UITableViewIndex visualStyle](self, "visualStyle");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "didDrawEntryAtIndex:indexBounds:entryBounds:context:originalColor:", v36, v19, v30, v22, v24, v26, v28, v39, v41, v43, v45);

      }
      v24 = v24 + v28 + v71[0];

      ++v36;
    }
    while (v31 != v36);
  }

}

- (BOOL)_updateSectionForTouch:(id)a3 withEvent:(id)a4
{
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int64_t v18;
  double MinY;
  _BOOL4 v20;
  int64_t v21;
  CGFloat MaxY;
  _BOOL4 v23;
  void *v25;
  char v26;
  void *v27;
  CGRect v28;
  CGRect v29;

  v5 = a3;
  -[UITableViewIndex _effectiveBounds](self, "_effectiveBounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "locationInView:", self);
  v15 = v14;
  v17 = v16;

  v18 = -[UITableViewIndex _indexForEntryAtPoint:](self, "_indexForEntryAtPoint:", v15, v17);
  v28.origin.x = v7;
  v28.origin.y = v9;
  v28.size.width = v11;
  v28.size.height = v13;
  MinY = CGRectGetMinY(v28);
  if (v17 >= MinY)
  {
    v29.origin.x = v7;
    v29.origin.y = v9;
    v29.size.width = v11;
    v29.size.height = v13;
    MaxY = CGRectGetMaxY(v29);
    v21 = 0x7FFFFFFFFFFFFFFFLL;
    if (v17 > MaxY)
    {
      v20 = 1;
    }
    else
    {
      v21 = v18;
      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
    v21 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v21 == self->_selectedSection)
  {
    v23 = v17 < MinY;
    if (self->_pastTop == v23 && self->_pastBottom == v20)
      return 0;
  }
  else
  {
    LOBYTE(v23) = v17 < MinY;
  }
  self->_selectedSection = v21;
  self->_pastTop = v23;
  self->_pastBottom = v20;
  -[UITableViewIndex visualStyle](self, "visualStyle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_opt_respondsToSelector();

  if ((v26 & 1) != 0)
  {
    -[UITableViewIndex visualStyle](self, "visualStyle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "selectedSectionDidChange:", self->_selectedSection);

  }
  return 1;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[UITableViewIndex visualStyle](self, "visualStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[UITableViewIndex visualStyle](self, "visualStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trackingDidBegin");

  }
  -[UITableViewIndex _updateSectionForTouch:withEvent:](self, "_updateSectionForTouch:withEvent:", v6, v7);
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");

  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;

  v6 = a4;
  if (-[UITableViewIndex _updateSectionForTouch:withEvent:](self, "_updateSectionForTouch:withEvent:", a3, v6))
    -[UIControl _sendActionsForEvents:withEvent:](self, "_sendActionsForEvents:withEvent:", 4096, v6);

  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  objc_super v11;

  v6 = a4;
  v7 = a3;
  -[UITableViewIndex visualStyle](self, "visualStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[UITableViewIndex visualStyle](self, "visualStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trackingDidEnd");

  }
  -[UITableViewIndex _updateSectionForTouch:withEvent:](self, "_updateSectionForTouch:withEvent:", v7, v6);
  self->_selectedSection = 0x7FFFFFFFFFFFFFFFLL;
  self->_pastTop = 0;
  self->_pastBottom = 0;
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  v11.receiver = self;
  v11.super_class = (Class)UITableViewIndex;
  -[UIControl endTrackingWithTouch:withEvent:](&v11, sel_endTrackingWithTouch_withEvent_, v7, v6);

}

- (void)cancelTrackingWithEvent:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[UITableViewIndex visualStyle](self, "visualStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[UITableViewIndex visualStyle](self, "visualStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trackingDidEnd");

  }
  self->_selectedSection = 0x7FFFFFFFFFFFFFFFLL;
  self->_pastTop = 0;
  self->_pastBottom = 0;
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  v8.receiver = self;
  v8.super_class = (Class)UITableViewIndex;
  -[UIControl cancelTrackingWithEvent:](&v8, sel_cancelTrackingWithEvent_, v4);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UITableViewIndex;
  v6 = a4;
  v7 = a3;
  -[UIControl touchesBegan:withEvent:](&v8, sel_touchesBegan_withEvent_, v7, v6);
  -[UITableViewIndex _handleTouches:withEvent:](self, "_handleTouches:withEvent:", v7, v6, v8.receiver, v8.super_class);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UITableViewIndex;
  v6 = a4;
  v7 = a3;
  -[UIControl touchesMoved:withEvent:](&v8, sel_touchesMoved_withEvent_, v7, v6);
  -[UITableViewIndex _handleTouches:withEvent:](self, "_handleTouches:withEvent:", v7, v6, v8.receiver, v8.super_class);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UITableViewIndex;
  v6 = a4;
  -[UIControl touchesEnded:withEvent:](&v7, sel_touchesEnded_withEvent_, a3, v6);
  -[UITableViewIndex _handleTouches:withEvent:](self, "_handleTouches:withEvent:", 0, v6, v7.receiver, v7.super_class);

}

- (void)_handleTouches:(id)a3 withEvent:(id)a4
{
  id v5;
  int64_t v6;
  void *v7;
  id v8;

  v5 = a4;
  objc_msgSend(v5, "_firstTouchForView:", self);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationInView:", self);
  v6 = -[UITableViewIndex _indexForEntryAtPoint:](self, "_indexForEntryAtPoint:");
  -[UITableViewIndex visualStyle](self, "visualStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleTouch:withEvent:touchedEntryIndex:", v8, v5, v6);

}

- (UIColor)indexColor
{
  return self->_indexColor;
}

- (void)setIndexColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_indexColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_indexColor, a3);
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v6;
  }

}

- (UIColor)indexTrackingBackgroundColor
{
  return self->_indexTrackingBackgroundColor;
}

- (void)setIndexTrackingBackgroundColor:(id)a3
{
  UIColor *v5;
  _BOOL4 v6;
  UIColor *v7;

  v5 = (UIColor *)a3;
  if (self->_indexTrackingBackgroundColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_indexTrackingBackgroundColor, a3);
    v6 = -[UIControl isTracking](self, "isTracking");
    v5 = v7;
    if (v6)
    {
      -[UIView setNeedsDisplay](self, "setNeedsDisplay");
      v5 = v7;
    }
  }

}

- (UIColor)indexBackgroundColor
{
  return self->_indexBackgroundColor;
}

- (void)setIndexBackgroundColor:(id)a3
{
  UIColor *v5;
  BOOL v6;
  UIColor *v7;

  v5 = (UIColor *)a3;
  if (self->_indexBackgroundColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_indexBackgroundColor, a3);
    v6 = -[UIControl isTracking](self, "isTracking");
    v5 = v7;
    if (!v6)
    {
      -[UIView setNeedsDisplay](self, "setNeedsDisplay");
      v5 = v7;
    }
  }

}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITableViewIndex;
  -[UIView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
}

- (id)_dotImage
{
  void *v3;
  uint64_t v4;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 3)
    -[UITableViewIndex _externalDotImage](self, "_externalDotImage");
  else
    _UIImageWithName(CFSTR("UITableViewIndexDot"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_externalDotImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__UITableViewIndex__externalDotImage__block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  if (_MergedGlobals_15_4 != -1)
    dispatch_once(&_MergedGlobals_15_4, block);
  return (id)qword_1ECD7C678;
}

void __37__UITableViewIndex__externalDotImage__block_invoke(uint64_t a1)
{
  double v1;
  _QWORD *ContextStack;
  CGContext *v3;
  uint64_t v4;
  void *v5;
  CGRect v6;

  objc_msgSend(*(id *)(a1 + 32), "_currentScreenScale");
  _UIGraphicsBeginImageContextWithOptions(0, 0, 4.0, 4.0, v1);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v3 = 0;
  else
    v3 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  v6.origin.x = 0.0;
  v6.origin.y = 0.0;
  v6.size.width = 4.0;
  v6.size.height = 4.0;
  CGContextFillEllipseInRect(v3, v6);
  _UIGraphicsGetImageFromCurrentImageContext(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ECD7C678;
  qword_1ECD7C678 = v4;

  UIGraphicsEndImageContext();
}

- (BOOL)canBecomeFocused
{
  void *v3;
  BOOL v4;
  objc_super v6;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom") == 3)
  {
    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UITableViewIndex;
    v4 = -[UIControl canBecomeFocused](&v6, sel_canBecomeFocused);
  }

  return v4;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITableViewIndex;
  -[UIView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[UITableViewIndex _setupAXHUDGestureIfNecessary](self, "_setupAXHUDGestureIfNecessary");
}

- (void)_setupAXHUDGestureIfNecessary
{
  void *v3;
  int v4;
  UIAccessibilityHUDGestureManager *v5;
  UIAccessibilityHUDGestureManager *axHUDGestureManager;

  if (!self->_axHUDGestureManager && dyld_program_sdk_at_least())
  {
    -[UIView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_isLargeContentViewerEnabled");

    if (v4)
    {
      v5 = -[UIAccessibilityHUDGestureManager initWithView:delegate:]([UIAccessibilityHUDGestureManager alloc], "initWithView:delegate:", self, self);
      axHUDGestureManager = self->_axHUDGestureManager;
      self->_axHUDGestureManager = v5;

    }
  }
}

- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4
{
  int64_t v5;
  UIAccessibilityHUDItem *v6;
  int64_t v7;
  UIAccessibilityHUDItem *v8;
  void *v9;

  v5 = -[UITableViewIndex _indexForEntryAtPoint:](self, "_indexForEntryAtPoint:", a3, a4.x, a4.y);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    v7 = v5;
    v8 = [UIAccessibilityHUDItem alloc];
    -[NSArray objectAtIndex:](self->_titles, "objectAtIndex:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:](v8, "initWithTitle:image:imageInsets:", v9, 0, 0.0, 0.0, 0.0, 0.0);

  }
  return v6;
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 canCancelGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)_accessibilityHUDGestureManagerCancelsTouchesInView:(id)a3
{
  return 0;
}

- (int64_t)_indexForEntryAtPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double width;
  double height;
  NSUInteger v9;
  uint64_t v10;
  double v11;
  double v12;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  y = a3.y;
  -[UITableViewIndex _effectiveBounds](self, "_effectiveBounds", a3.x);
  x = v14.origin.x;
  v6 = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  if (y < CGRectGetMinY(v14))
    return 0x7FFFFFFFFFFFFFFFLL;
  v15.origin.x = x;
  v15.origin.y = v6;
  v15.size.width = width;
  v15.size.height = height;
  if (y > CGRectGetMaxY(v15))
    return 0x7FFFFFFFFFFFFFFFLL;
  v9 = -[NSArray count](self->_titles, "count");
  if (!v9)
    return 0x7FFFFFFFFFFFFFFFLL;
  v10 = v9;
  -[UITableViewIndex _visibleBoundsForRect:stride:](self, "_visibleBoundsForRect:stride:", 0, x, v6, width, height);
  v11 = v16.origin.y;
  v12 = CGRectGetHeight(v16);
  if (v10 - 1 >= ((uint64_t)((y - v11) / (v12 / (double)v10)) & ~((uint64_t)((y - v11) / (v12 / (double)v10)) >> 63)))
    return (uint64_t)((y - v11) / (v12 / (double)v10)) & ~((uint64_t)((y - v11) / (v12 / (double)v10)) >> 63);
  else
    return v10 - 1;
}

+ (id)idiomToVisualStyleClassMap
{
  objc_opt_self();
  if (qword_1ECD7C680 != -1)
    dispatch_once(&qword_1ECD7C680, &__block_literal_global_125_2);
  return (id)qword_1ECD7C688;
}

void __46__UITableViewIndex_idiomToVisualStyleClassMap__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[7];
  _QWORD v4[8];

  v4[7] = *MEMORY[0x1E0C80C00];
  v3[0] = &unk_1E1A9A518;
  v4[0] = objc_opt_class();
  v3[1] = &unk_1E1A9A530;
  v4[1] = objc_opt_class();
  v3[2] = &unk_1E1A9A548;
  v4[2] = objc_opt_class();
  v3[3] = &unk_1E1A9A560;
  v4[3] = objc_opt_class();
  v3[4] = &unk_1E1A9A578;
  v4[4] = objc_opt_class();
  v3[5] = &unk_1E1A9A590;
  v4[5] = objc_opt_class();
  v3[6] = &unk_1E1A9A5A8;
  v4[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 7);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "mutableCopy");
  v2 = (void *)qword_1ECD7C688;
  qword_1ECD7C688 = v1;

}

+ (void)registerVisualStyle:(Class)a3 forIdiom:(int64_t)a4
{
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EE05C0A0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UITableViewIndex.m"), 891, CFSTR("visualStyle of type %@ does not conform to UITableViewIndexVisualStyle."), v10);

  }
  +[UITableViewIndex idiomToVisualStyleClassMap]();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", a3, v8);

}

+ (id)visualStyleForTableViewIndex:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "_coreIdiom");
  if (v5 == -1)
  {
    objc_msgSend(v4, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "userInterfaceIdiom");

  }
  v7 = (void *)objc_msgSend(objc_alloc((Class)+[UITableViewIndex visualStyleForIdiom:]((uint64_t)a1, v5)), "initWithTableViewIndex:", v4);

  return v7;
}

- (int64_t)selectedSection
{
  return self->_selectedSection;
}

- (BOOL)pastTop
{
  return self->_pastTop;
}

- (BOOL)pastBottom
{
  return self->_pastBottom;
}

- (unint64_t)drawingInsetsMask
{
  return self->_drawingInsetsMask;
}

- (void)setDrawingInsetsMask:(unint64_t)a3
{
  self->_drawingInsetsMask = a3;
}

- (UIEdgeInsets)drawingInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_drawingInsets.top;
  left = self->_drawingInsets.left;
  bottom = self->_drawingInsets.bottom;
  right = self->_drawingInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UITableViewIndexVisualStyle)visualStyle
{
  return self->_visualStyle;
}

- (void)setVisualStyle:(id)a3
{
  objc_storeStrong((id *)&self->_visualStyle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_axHUDGestureManager, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_indexTrackingBackgroundColor, 0);
  objc_storeStrong((id *)&self->_indexBackgroundColor, 0);
  objc_storeStrong((id *)&self->_indexColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_titles, 0);
}

@end
