@implementation UIIndexBarView

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  if ((*(_WORD *)&self->_visualStyleImplements & 0x40) != 0)
  {
    -[UIIndexBarView visualStyle](self, "visualStyle");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "layoutSubviews");

  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)UIIndexBarView;
    -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  }
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIIndexBarView;
  -[UIView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[UIIndexBarView _setupAXHUDGestureIfNecessary](self, "_setupAXHUDGestureIfNecessary");
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

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((*(_WORD *)&self->_visualStyleImplements & 0x80) != 0)
  {
    -[UIIndexBarView visualStyle](self, "visualStyle");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "drawRect:", x, y, width, height);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIIndexBarView;
    -[UIView drawRect:](&v8, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
}

uint64_t __39__UIIndexBarView__updateDisplayEntries__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIIndexBarView;
  -[UIView tintColorDidChange](&v4, sel_tintColorDidChange);
  if (!self->_indexColor && (*(_WORD *)&self->_visualStyleImplements & 0x2000) != 0)
  {
    -[UIIndexBarView visualStyle](self, "visualStyle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "indexColorUpdated");

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
  void *v15;
  objc_super v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)UIIndexBarView;
  -[UIView frame](&v17, sel_frame);
  v19.origin.x = v8;
  v19.origin.y = v9;
  v11 = v10;
  v13 = v12;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v19.size.width = v11;
  v19.size.height = v13;
  if (!CGRectEqualToRect(v18, v19))
  {
    v16.receiver = self;
    v16.super_class = (Class)UIIndexBarView;
    -[UIView setFrame:](&v16, sel_setFrame_, x, y, width, height);
    if (width != v11 || height != v13)
    {
      if ((*(_WORD *)&self->_visualStyleImplements & 4) != 0)
      {
        -[UIIndexBarView visualStyle](self, "visualStyle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "sizeUpdated");

      }
      -[UIIndexBarView _updateDisplayEntries](self, "_updateDisplayEntries");
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIIndexBarView visualStyle](self, "visualStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

void __39__UIIndexBarView__updateDisplayEntries__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "visualStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayEntryFromEntry:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setEntryIndex:", a3);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(v8, "setDisplayEntryIndex:");
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

}

- (BOOL)_canDrawContent
{
  return (*(_WORD *)&self->_visualStyleImplements >> 7) & 1;
}

- (UIIndexBarVisualStyle)visualStyle
{
  return self->_visualStyle;
}

- (void)_updateDisplayEntries
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  char v7;
  double v8;
  double v9;
  unint64_t v10;
  double v11;
  double v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  NSUInteger v16;
  void *v17;
  NSArray *v18;
  id v19;
  void *v20;
  NSArray *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  double v28;
  double v29;
  char v30;
  unint64_t v31;
  void *v32;
  NSArray *entries;
  _QWORD v34[5];
  _QWORD v35[6];
  _QWORD v36[5];
  _QWORD v37[4];
  id v38;
  uint64_t *v39;
  _QWORD v40[4];
  id v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSUInteger v48;
  _QWORD v49[2];
  void (*v50)(uint64_t, void *, uint64_t);
  void *v51;
  UIIndexBarView *v52;
  id v53;
  _QWORD *v54;
  _QWORD v55[5];
  CGRect v56;

  if (-[NSArray count](self->_entries, "count")
    && (-[UIIndexBarView effectiveBounds](self, "effectiveBounds"), !CGRectIsEmpty(v56)))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIIndexBarView visualStyle](self, "visualStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "minLineHeight");
    v6 = v5;

    v7 = -[UIIndexBarView drawingInsetsMask](self, "drawingInsetsMask");
    -[UIIndexBarView effectiveBounds](self, "effectiveBounds");
    v9 = v8;
    v10 = vcvtmd_s64_f64(v8 / v6);
    if (-[NSArray count](self->_entries, "count") <= v10)
    {
      if ((v7 & 1) == 0)
      {
        -[UIIndexBarView drawingInsets](self, "drawingInsets");
        v13 = vcvtmd_s64_f64((v9 - v12) / v6);
        if (-[NSArray count](self->_entries, "count") <= v13)
        {
          -[UIIndexBarView setDrawingInsetsMask:](self, "setDrawingInsetsMask:", -[UIIndexBarView drawingInsetsMask](self, "drawingInsetsMask") | 1);
          v10 = v13;
        }
      }
    }
    else if ((v7 & 1) != 0)
    {
      -[UIIndexBarView setDrawingInsetsMask:](self, "setDrawingInsetsMask:", -[UIIndexBarView drawingInsetsMask](self, "drawingInsetsMask") & 0xFFFFFFFFFFFFFFFELL);
      -[UIIndexBarView drawingInsets](self, "drawingInsets");
      v10 = vcvtmd_s64_f64((v9 + v11) / v6);
    }
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x2020000000;
    v55[3] = 0;
    v14 = MEMORY[0x1E0C809B0];
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v50 = __39__UIIndexBarView__updateDisplayEntries__block_invoke;
    v51 = &unk_1E16EA8B8;
    v52 = self;
    v54 = v55;
    v15 = v3;
    v53 = v15;
    if (v10 >= -[NSArray count](self->_entries, "count"))
    {
      entries = self->_entries;
      v34[0] = v14;
      v34[1] = 3221225472;
      v34[2] = __39__UIIndexBarView__updateDisplayEntries__block_invoke_6;
      v34[3] = &__block_descriptor_40_e32_v32__0__UIIndexBarEntry_8Q16_B24lu32l8;
      v34[4] = v49;
      -[NSArray enumerateObjectsUsingBlock:](entries, "enumerateObjectsUsingBlock:", v34);
    }
    else
    {
      v43 = 0;
      v44 = &v43;
      v45 = 0x3010000000;
      v47 = 0;
      v48 = 0;
      v46 = &unk_18685B0AF;
      v16 = -[NSArray count](self->_entries, "count");
      v47 = 0;
      v48 = v16;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = self->_entries;
      v40[0] = v14;
      v40[1] = 3221225472;
      v40[2] = __39__UIIndexBarView__updateDisplayEntries__block_invoke_2;
      v40[3] = &unk_1E16EA8E0;
      v19 = v17;
      v41 = v19;
      v42 = &v43;
      -[NSArray enumerateObjectsUsingBlock:](v18, "enumerateObjectsUsingBlock:", v40);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = self->_entries;
      v37[0] = v14;
      v37[1] = 3221225472;
      v37[2] = __39__UIIndexBarView__updateDisplayEntries__block_invoke_3;
      v37[3] = &unk_1E16EA8E0;
      v22 = v20;
      v38 = v22;
      v39 = &v43;
      -[NSArray enumerateObjectsWithOptions:usingBlock:](v21, "enumerateObjectsWithOptions:usingBlock:", 2, v37);
      v36[0] = v14;
      v36[1] = 3221225472;
      v36[2] = __39__UIIndexBarView__updateDisplayEntries__block_invoke_4;
      v36[3] = &__block_descriptor_40_e32_v32__0__UIIndexBarEntry_8Q16_B24lu32l8;
      v36[4] = v49;
      objc_msgSend(v19, "enumerateObjectsUsingBlock:", v36);
      v23 = objc_msgSend(v19, "count");
      v24 = objc_msgSend(v22, "count");
      v25 = v10 - v23 - v24 + ((v10 - v23 - v24) & 1) - 1;
      if (v25 > 0)
      {
        v27 = v44[4];
        v26 = v44[5];
        v28 = (double)v27;
        if ((double)v27 < (double)(v27 + v26))
        {
          v29 = (double)v26 / (double)v25;
          v30 = 1;
          do
          {
            v31 = vcvtmd_s64_f64(v28);
            if ((v30 & 1) != 0)
              +[UIIndexBarEntry entryForDotInView:](UIIndexBarEntry, "entryForDotInView:", self);
            else
              -[NSArray objectAtIndexedSubscript:](self->_entries, "objectAtIndexedSubscript:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v50((uint64_t)v49, v32, v31);

            v30 ^= 1u;
            v28 = v29 + v28;
          }
          while (v28 < (double)(unint64_t)(v44[5] + v44[4]));
        }
      }
      v35[0] = v14;
      v35[1] = 3221225472;
      v35[2] = __39__UIIndexBarView__updateDisplayEntries__block_invoke_5;
      v35[3] = &unk_1E16EA928;
      v35[4] = self;
      v35[5] = v49;
      objc_msgSend(v22, "enumerateObjectsUsingBlock:", v35);

      _Block_object_dispose(&v43, 8);
    }
    -[UIIndexBarView setDisplayEntries:](self, "setDisplayEntries:", v15);

    _Block_object_dispose(v55, 8);
  }
  else
  {
    -[UIIndexBarView setDisplayEntries:](self, "setDisplayEntries:", MEMORY[0x1E0C9AA60]);
  }
}

- (void)setDisplayEntries:(id)a3
{
  NSArray *v5;
  void *v6;
  NSArray *v7;

  v5 = (NSArray *)a3;
  if (self->_displayEntries != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_displayEntries, a3);
    v5 = v7;
    self->_cachedDisplayHighlightedIndex = -1.0;
    if ((*(_WORD *)&self->_visualStyleImplements & 2) != 0)
    {
      -[UIIndexBarView visualStyle](self, "visualStyle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "displayEntriesUpdated");

      v5 = v7;
    }
  }

}

- (NSArray)displayEntries
{
  return self->_displayEntries;
}

- (CGRect)effectiveBounds
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

  -[UIIndexBarView drawingInsets](self, "drawingInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[UIIndexBarView drawingInsetsMask](self, "drawingInsetsMask");
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

- (UIColor)indexColor
{
  UIColor *indexColor;

  indexColor = self->_indexColor;
  if (indexColor)
    return indexColor;
  -[UIView _inheritedInteractionTintColor](self, "_inheritedInteractionTintColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)backgroundColor
{
  _BOOL4 v3;
  uint64_t v4;

  v3 = -[UIControl isTracking](self, "isTracking");
  v4 = 12;
  if (v3)
    v4 = 11;
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR___UIIndexBarView__drawingInsetsMask[v4]));
}

- (void)setEntries:(id)a3
{
  NSArray *v5;
  void *v6;
  NSArray *v7;

  v5 = (NSArray *)a3;
  if (self->_entries != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_entries, a3);
    self->_cachedDisplayHighlightedIndex = -1.0;
    if ((*(_WORD *)&self->_visualStyleImplements & 1) != 0)
    {
      -[UIIndexBarView visualStyle](self, "visualStyle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "entriesUpdated");

    }
    -[UIIndexBarView _updateDisplayEntries](self, "_updateDisplayEntries");
    v5 = v7;
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
    -[UIIndexBarView _updateDisplayEntries](self, "_updateDisplayEntries");
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

+ (void)makeIndexBarView:(id *)a3 containerView:(id *)a4 forTraits:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a5;
  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIIndexBarView.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index != nil"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIIndexBarView.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view != nil"));

LABEL_3:
  v9 = objc_alloc_init((Class)a1);
  v10 = +[UIIndexBarView _visualStyleForIdiom:]((uint64_t)a1, objc_msgSend(v16, "userInterfaceIdiom"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "containerViewForIndexBar:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = objc_retainAutorelease(v9);
  v13 = v12;
  *a3 = v12;
  if (v11)
    v12 = v11;
  *a4 = objc_retainAutorelease(v12);

}

+ (id)_visualStyleForIdiom:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_self();
  v3 = (void *)__IdiomsToVisualStyles;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "objectForKey:", v4);

  if (!v5)
    v5 = (void *)objc_opt_class();
  return v5;
}

- (UIIndexBarView)initWithFrame:(CGRect)a3
{
  UIIndexBarView *v3;
  void *v4;
  void *v5;
  void *v6;
  UISelectionFeedbackGenerator *v7;
  UISelectionFeedbackGenerator *selectionFeedbackGenerator;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v15;
  _QWORD v16[2];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)UIIndexBarView;
  v3 = -[UIControl initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend((id)objc_opt_class(), "visualStyleForIndexBarView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIIndexBarView setVisualStyle:](v3, "setVisualStyle:", v4);

  v3->_drawingInsetsMask = 15;
  if (!v3->_selectionFeedbackGenerator)
  {
    +[_UISelectionFeedbackGeneratorConfiguration strongConfiguration](_UISelectionFeedbackGeneratorConfiguration, "strongConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tweakedConfigurationForClass:usage:", objc_opt_class(), CFSTR("indexRetarget"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[UIFeedbackGenerator initWithConfiguration:view:]([UISelectionFeedbackGenerator alloc], "initWithConfiguration:view:", v6, v3);
    selectionFeedbackGenerator = v3->_selectionFeedbackGenerator;
    v3->_selectionFeedbackGenerator = v7;

  }
  v17[0] = 0x1E1A99498;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[UIView _registerForTraitTokenChanges:withTarget:action:](v3, "_registerForTraitTokenChanges:withTarget:action:", v9, v3, sel__setupAXHUDGestureIfNecessary);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", v3, sel__largeContentViewerEnabledStatusDidChange_, CFSTR("UILargeContentViewerInteractionEnabledStatusDidChangeNotification"), 0);

  v16[0] = 0x1E1A99540;
  v16[1] = 0x1E1A995A0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[UIView _registerForTraitTokenChanges:withTarget:action:](v3, "_registerForTraitTokenChanges:withTarget:action:", v12, v3, sel__legibilityWeightOrPreferredContentSizeTraitsDidChange);

  return v3;
}

- (void)setVisualStyle:(id)a3
{
  id v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;
  char v19;
  __int16 v20;

  objc_storeStrong((id *)&self->_visualStyle, a3);
  v5 = a3;
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xFFFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 2;
  else
    v6 = 0;
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xFFFD | v6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = 4;
  else
    v7 = 0;
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xFFFB | v7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = 8;
  else
    v8 = 0;
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xFFF7 | v8;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = 16;
  else
    v9 = 0;
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xFFEF | v9;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = 32;
  else
    v10 = 0;
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xFFDF | v10;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = 64;
  else
    v11 = 0;
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xFFBF | v11;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = 128;
  else
    v12 = 0;
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xFF7F | v12;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v13 = 256;
  else
    v13 = 0;
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xFEFF | v13;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v14 = 512;
  else
    v14 = 0;
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xFDFF | v14;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v15 = 1024;
  else
    v15 = 0;
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xFBFF | v15;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v16 = 2048;
  else
    v16 = 0;
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xF7FF | v16;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v17 = 4096;
  else
    v17 = 0;
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xEFFF | v17;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v18 = 0x2000;
  else
    v18 = 0;
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xDFFF | v18;
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
    v20 = 0x4000;
  else
    v20 = 0;
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xBFFF | v20;
}

+ (id)visualStyleForIndexBarView:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)+[UIIndexBarView _visualStyleForIdiom:]((uint64_t)a1, objc_msgSend(v5, "userInterfaceIdiom"));

  v7 = (void *)objc_msgSend([v6 alloc], "initWithView:", v4);
  return v7;
}

- (void)setBackgroundColor:(id)a3
{
  UIColor *v5;
  BOOL v6;
  UIColor *v7;

  v5 = (UIColor *)a3;
  if (self->_nonTrackingBackgroundColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_nonTrackingBackgroundColor, a3);
    v6 = -[UIControl isTracking](self, "isTracking");
    v5 = v7;
    if (!v6)
    {
      -[UIIndexBarView _updateBackgroundColor](self, "_updateBackgroundColor");
      v5 = v7;
    }
  }

}

- (void)_updateBackgroundColor
{
  objc_super v3;
  objc_super v4;

  if (-[UIControl isTracking](self, "isTracking"))
    -[UIView setBackgroundColor:](&v4, sel_setBackgroundColor_, self->_trackingBackgroundColor, v3.receiver, v3.super_class, self, UIIndexBarView);
  else
    -[UIView setBackgroundColor:](&v3, sel_setBackgroundColor_, self->_nonTrackingBackgroundColor, self, UIIndexBarView, v4.receiver, v4.super_class);
}

- (void)setHighlightedIndex:(double)a3
{
  id v3;

  if (self->_highlightedIndex != a3)
  {
    self->_highlightedIndex = a3;
    self->_cachedDisplayHighlightedIndex = -1.0;
    if ((*(_BYTE *)&self->_visualStyleImplements & 8) != 0)
    {
      -[UIIndexBarView visualStyle](self, "visualStyle");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "highlightedIndexUpdated");

    }
  }
}

- (void)setDeflection:(double)a3
{
  id v3;

  if (self->_deflection != a3)
  {
    self->_deflection = a3;
    if ((*(_WORD *)&self->_visualStyleImplements & 0x10) != 0)
    {
      -[UIIndexBarView visualStyle](self, "visualStyle");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "deflectionUpdated");

    }
  }
}

- (void)resetDeflection:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  self->_deflection = 0.0;
  if ((*(_WORD *)&self->_visualStyleImplements & 0x20) != 0)
  {
    v3 = a3;
    -[UIIndexBarView visualStyle](self, "visualStyle");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deflectionReset:", v3);

  }
}

- (BOOL)canBecomeFocused
{
  void *v2;
  char v3;

  -[UIIndexBarView visualStyle](self, "visualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canBecomeFocused");

  return v3;
}

- (BOOL)_defaultCanBecomeFocused
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIIndexBarView;
  return -[UIControl canBecomeFocused](&v3, sel_canBecomeFocused);
}

- (void)_legibilityWeightOrPreferredContentSizeTraitsDidChange
{
  void *v3;

  if ((*(_WORD *)&self->_visualStyleImplements & 0x4000) != 0)
  {
    -[UIIndexBarView visualStyle](self, "visualStyle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "legibilityWeightOrPreferredContentSizeUpdated");

  }
  -[UIIndexBarView _updateDisplayEntries](self, "_updateDisplayEntries");
}

void __39__UIIndexBarView__updateDisplayEntries__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
  --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if ((objc_msgSend(v6, "hasPoundTitle") & 1) == 0 && (!objc_msgSend(v6, "type") || objc_msgSend(v6, "type") == 1))
    *a4 = 1;

}

void __39__UIIndexBarView__updateDisplayEntries__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if ((objc_msgSend(v6, "hasPoundTitle") & 1) == 0 && (!objc_msgSend(v6, "type") || objc_msgSend(v6, "type") == 1))
    *a4 = 1;

}

uint64_t __39__UIIndexBarView__updateDisplayEntries__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __39__UIIndexBarView__updateDisplayEntries__block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 480);
  v6 = a2;
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v6, objc_msgSend(v5, "count") + ~a3);

}

- (double)displayHighlightedIndex
{
  double cachedDisplayHighlightedIndex;
  void *v4;
  uint64_t v5;
  double highlightedIndex;
  BOOL v7;
  int64_t v9;
  double v10;
  NSUInteger v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  CGRect v23;

  cachedDisplayHighlightedIndex = -1.0;
  if (!-[NSArray count](self->_displayEntries, "count"))
    return cachedDisplayHighlightedIndex;
  -[UIIndexBarView effectiveBounds](self, "effectiveBounds");
  if (CGRectIsEmpty(v23))
    return cachedDisplayHighlightedIndex;
  cachedDisplayHighlightedIndex = self->_cachedDisplayHighlightedIndex;
  if (cachedDisplayHighlightedIndex != -1.0)
    return cachedDisplayHighlightedIndex;
  -[UIIndexBarView entries](self, "entries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5 == -[NSArray count](self->_displayEntries, "count")
    || ((highlightedIndex = self->_highlightedIndex, highlightedIndex != -1.0)
      ? (v7 = highlightedIndex == -2.0)
      : (v7 = 1),
        v7))
  {

    return self->_highlightedIndex;
  }

  if (highlightedIndex == -3.0)
    return self->_highlightedIndex;
  v9 = -[NSArray count](self->_displayEntries, "count") - 1;
  v10 = self->_highlightedIndex;
  v11 = -[NSArray count](self->_entries, "count");
  if (v9 < 2)
  {
    v12 = 0;
  }
  else
  {
    v12 = 0;
    v13 = llround(v10 * (double)v9 / (double)(v11 - 1));
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_displayEntries, "objectAtIndexedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "entryIndex");

      v16 = self->_highlightedIndex;
      if (v16 <= (double)v15)
      {
        if (v16 < (double)v15)
        {
          v17 = v13 - 1;
          v9 = v13;
          v13 = v12;
        }
        else
        {
          v9 = v13;
          v17 = v13;
        }
      }
      else
      {
        v17 = v13 + 1;
      }
      v12 = v13;
      v18 = v9 - v13;
      v13 = v17;
    }
    while (v18 > 1);
  }
  if (v12 == v9)
  {
    cachedDisplayHighlightedIndex = (double)v9;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_displayEntries, "objectAtIndexedSubscript:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "entryIndex");

    -[NSArray objectAtIndexedSubscript:](self->_displayEntries, "objectAtIndexedSubscript:", v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "entryIndex");

    cachedDisplayHighlightedIndex = (self->_highlightedIndex - (double)v20) / (double)(v22 - v20) + (double)v12;
  }
  self->_cachedDisplayHighlightedIndex = cachedDisplayHighlightedIndex;
  return cachedDisplayHighlightedIndex;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  __int16 visualStyleImplements;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  BOOL v17;

  v6 = a3;
  v7 = a4;
  -[UIView window](self, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", v8);
  self->_trackingStartLocationInWindow.x = v9;
  self->_trackingStartLocationInWindow.y = v10;

  visualStyleImplements = (__int16)self->_visualStyleImplements;
  if ((visualStyleImplements & 0x100) != 0)
  {
    -[UIIndexBarView visualStyle](self, "visualStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trackingDidBegin");

    visualStyleImplements = (__int16)self->_visualStyleImplements;
  }
  if ((visualStyleImplements & 0x800) != 0 && -[NSArray count](self->_entries, "count"))
  {
    -[UIIndexBarView visualStyle](self, "visualStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateSectionForTouch:withEvent:", v6, v7);

    -[UIIndexBarView visualStyle](self, "visualStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[UIIndexBarView visualStyle](self, "visualStyle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setExpanded:", 1);

    }
    -[UIIndexBarView _updateBackgroundColor](self, "_updateBackgroundColor");
    -[UIIndexBarView _userInteractionStarted](self, "_userInteractionStarted");
    v17 = 1;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  $7470359F659C9B5BA7D170B769D567F5 visualStyleImplements;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  int v16;

  v6 = a3;
  v7 = a4;
  visualStyleImplements = self->_visualStyleImplements;
  if ((*(_WORD *)&visualStyleImplements & 0x800) != 0)
  {
    if ((*(_WORD *)&visualStyleImplements & 0x200) == 0
      || (-[UIView window](self, "window"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "locationInView:", v9),
          v11 = v10,
          v13 = v12,
          v9,
          -[UIIndexBarVisualStyle trackingChangeHysteresis](self->_visualStyle, "trackingChangeHysteresis"),
          fabs(sqrt((self->_trackingStartLocationInWindow.x - v11) * (self->_trackingStartLocationInWindow.x - v11)+ (self->_trackingStartLocationInWindow.y - v13) * (self->_trackingStartLocationInWindow.y - v13))) > v14))
    {
      -[UIIndexBarView visualStyle](self, "visualStyle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "updateSectionForTouch:withEvent:", v6, v7);

      if (v16)
        -[UIControl _sendActionsForEvents:withEvent:](self, "_sendActionsForEvents:withEvent:", 4096, v7);
    }
  }

  return (*(unsigned int *)&visualStyleImplements >> 11) & 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  __int16 visualStyleImplements;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  visualStyleImplements = (__int16)self->_visualStyleImplements;
  if ((visualStyleImplements & 0x400) != 0)
  {
    -[UIIndexBarView visualStyle](self, "visualStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trackingDidEnd");

    visualStyleImplements = (__int16)self->_visualStyleImplements;
  }
  if ((visualStyleImplements & 0x800) != 0)
  {
    if ((visualStyleImplements & 0x200) == 0
      || (-[UIView window](self, "window"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "locationInView:", v10),
          v12 = v11,
          v14 = v13,
          v10,
          -[UIIndexBarVisualStyle trackingChangeHysteresis](self->_visualStyle, "trackingChangeHysteresis"),
          fabs(sqrt((self->_trackingStartLocationInWindow.x - v12) * (self->_trackingStartLocationInWindow.x - v12)+ (self->_trackingStartLocationInWindow.y - v14) * (self->_trackingStartLocationInWindow.y - v14))) > v15))
    {
      -[UIIndexBarView visualStyle](self, "visualStyle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "updateSectionForTouch:withEvent:", v6, v7);

    }
    -[UIIndexBarView visualStyle](self, "visualStyle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      -[UIIndexBarView visualStyle](self, "visualStyle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setExpanded:", 0);

    }
    -[UIIndexBarView _updateBackgroundColor](self, "_updateBackgroundColor");
  }
  v20.receiver = self;
  v20.super_class = (Class)UIIndexBarView;
  -[UIControl endTrackingWithTouch:withEvent:](&v20, sel_endTrackingWithTouch_withEvent_, v6, v7);
  -[UIIndexBarView _userInteractionStopped](self, "_userInteractionStopped");

}

- (void)cancelTrackingWithEvent:(id)a3
{
  id v4;
  __int16 visualStyleImplements;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  visualStyleImplements = (__int16)self->_visualStyleImplements;
  if ((visualStyleImplements & 0x400) != 0)
  {
    -[UIIndexBarView visualStyle](self, "visualStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trackingDidEnd");

    visualStyleImplements = (__int16)self->_visualStyleImplements;
  }
  if ((visualStyleImplements & 0x800) != 0)
  {
    -[UIIndexBarView visualStyle](self, "visualStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateSectionForTouch:withEvent:", 0, v4);

    -[UIIndexBarView _updateBackgroundColor](self, "_updateBackgroundColor");
  }
  v8.receiver = self;
  v8.super_class = (Class)UIIndexBarView;
  -[UIControl cancelTrackingWithEvent:](&v8, sel_cancelTrackingWithEvent_, v4);
  -[UIIndexBarView _userInteractionStopped](self, "_userInteractionStopped");

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIIndexBarView;
  v6 = a4;
  v7 = a3;
  -[UIControl touchesBegan:withEvent:](&v8, sel_touchesBegan_withEvent_, v7, v6);
  -[UIIndexBarView _handleTouches:withEvent:](self, "_handleTouches:withEvent:", v7, v6, v8.receiver, v8.super_class);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIIndexBarView;
  v6 = a4;
  v7 = a3;
  -[UIControl touchesMoved:withEvent:](&v8, sel_touchesMoved_withEvent_, v7, v6);
  -[UIIndexBarView _handleTouches:withEvent:](self, "_handleTouches:withEvent:", v7, v6, v8.receiver, v8.super_class);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIIndexBarView;
  v6 = a4;
  -[UIControl touchesEnded:withEvent:](&v7, sel_touchesEnded_withEvent_, a3, v6);
  -[UIIndexBarView _handleTouches:withEvent:](self, "_handleTouches:withEvent:", 0, v6, v7.receiver, v7.super_class);

}

- (void)_handleTouches:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v6 = a4;
  v7 = v6;
  if (a3)
  {
    objc_msgSend(v6, "_firstTouchForView:", self);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "locationInView:", self);
    v9 = v8;
    v11 = v10;
    -[UIIndexBarView visualStyle](self, "visualStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[UIIndexBarView visualStyle](self, "visualStyle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "_indexForEntryAtPoint:", v9, v11);

    }
    else
    {
      v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    -[UIIndexBarView visualStyle](self, "visualStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleTouch:withEvent:touchedEntryIndex:", v17, v7, v15);

    v7 = v16;
  }
  else
  {
    -[UIIndexBarView visualStyle](self, "visualStyle");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleTouch:withEvent:touchedEntryIndex:", 0, v7, 0x7FFFFFFFFFFFFFFFLL);
  }

}

+ (void)registerVisualStyle:(Class)a3 forIdiom:(int64_t)a4
{
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (!__IdiomsToVisualStyles)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)__IdiomsToVisualStyles;
    __IdiomsToVisualStyles = v8;

  }
  if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EE061E60) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIIndexBarView.m"), 601, CFSTR("visualStyle of type %@ does not conform to UIIndexBarVisualStyle."), v12);

  }
  v10 = (void *)__IdiomsToVisualStyles;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", a3, v13);

}

- (void)setHighlightStyle:(int64_t)a3
{
  id v3;

  if (self->_highlightStyle != a3)
  {
    self->_highlightStyle = a3;
    if ((*(_WORD *)&self->_visualStyleImplements & 0x1000) != 0)
    {
      -[UIIndexBarView visualStyle](self, "visualStyle");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "highlightStyleUpdated");

    }
  }
}

- (void)setIndexColor:(id)a3
{
  UIColor *v5;
  void *v6;
  UIColor *v7;

  v5 = (UIColor *)a3;
  if (self->_indexColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_indexColor, a3);
    v5 = v7;
    if ((*(_WORD *)&self->_visualStyleImplements & 0x2000) != 0)
    {
      -[UIIndexBarView visualStyle](self, "visualStyle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "indexColorUpdated");

      v5 = v7;
    }
  }

}

- (void)setTrackingBackgroundColor:(id)a3
{
  UIColor *v5;
  _BOOL4 v6;
  UIColor *v7;

  v5 = (UIColor *)a3;
  if (self->_trackingBackgroundColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_trackingBackgroundColor, a3);
    v6 = -[UIControl isTracking](self, "isTracking");
    v5 = v7;
    if (v6)
    {
      -[UIIndexBarView _updateBackgroundColor](self, "_updateBackgroundColor");
      v5 = v7;
    }
  }

}

- (void)_userInteractionStarted
{
  void *v3;
  char v4;
  void *v5;

  -[UIIndexBarView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[UIIndexBarView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInteractionStartedWithIndexBarView:", self);

  }
  -[UISelectionFeedbackGenerator userInteractionStarted](self->_selectionFeedbackGenerator, "userInteractionStarted");
}

- (void)_userInteractionStopped
{
  void *v3;
  char v4;
  void *v5;

  -[UIIndexBarView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[UIIndexBarView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInteractionStoppedWithIndexBarView:", self);

  }
  -[UISelectionFeedbackGenerator userInteractionEnded](self->_selectionFeedbackGenerator, "userInteractionEnded");
}

- (BOOL)_didSelectEntry:(id)a3 atIndex:(int64_t)a4 location:(CGPoint)a5
{
  double y;
  double x;
  _BOOL4 v8;

  y = a5.y;
  x = a5.x;
  v8 = -[UIIndexBarView _selectEntry:atIndex:](self, "_selectEntry:atIndex:", a3, a4);
  if (v8)
    -[UISelectionFeedbackGenerator selectionChangedAtLocation:](self->_selectionFeedbackGenerator, "selectionChangedAtLocation:", x, y);
  return v8;
}

- (BOOL)_selectEntry:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  char v10;

  v6 = a3;
  -[UIIndexBarView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[UIIndexBarView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "indexBarView:didSelectEntry:atIndex:", self, v6, a4);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  UIAccessibilityHUDItem *v14;
  void *v15;
  void *v16;
  UIAccessibilityHUDItem *v17;

  y = a4.y;
  x = a4.x;
  -[UIIndexBarView visualStyle](self, "visualStyle", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0)
    return 0;
  -[UIIndexBarView visualStyle](self, "visualStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_accessibility_indexForEntryAtPoint:", x, y);

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[UIIndexBarView entries](self, "entries");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndex:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [UIAccessibilityHUDItem alloc];
  objc_msgSend(v13, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "image");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:](v14, "initWithTitle:image:imageInsets:", v15, v16, 0.0, 0.0, 0.0, 0.0);

  return v17;
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

- (NSArray)entries
{
  return self->_entries;
}

- (UIIndexBarViewDelegate)delegate
{
  return (UIIndexBarViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)drawingInsetsMask
{
  return self->_drawingInsetsMask;
}

- (void)setDrawingInsetsMask:(unint64_t)a3
{
  self->_drawingInsetsMask = a3;
}

- (UIColor)trackingBackgroundColor
{
  return self->_trackingBackgroundColor;
}

- (int64_t)highlightStyle
{
  return self->_highlightStyle;
}

- (double)highlightedIndex
{
  return self->_highlightedIndex;
}

- (double)deflection
{
  return self->_deflection;
}

- (double)cachedDisplayHighlightedIndex
{
  return self->_cachedDisplayHighlightedIndex;
}

- (void)setCachedDisplayHighlightedIndex:(double)a3
{
  self->_cachedDisplayHighlightedIndex = a3;
}

- (UIColor)nonTrackingBackgroundColor
{
  return self->_nonTrackingBackgroundColor;
}

- (void)setNonTrackingBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (CGPoint)trackingStartLocationInWindow
{
  double x;
  double y;
  CGPoint result;

  x = self->_trackingStartLocationInWindow.x;
  y = self->_trackingStartLocationInWindow.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTrackingStartLocationInWindow:(CGPoint)a3
{
  self->_trackingStartLocationInWindow = a3;
}

- (UISelectionFeedbackGenerator)selectionFeedbackGenerator
{
  return self->_selectionFeedbackGenerator;
}

- (void)setSelectionFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, a3);
}

- (UIAccessibilityHUDGestureManager)axHUDGestureManager
{
  return self->_axHUDGestureManager;
}

- (void)setAxHUDGestureManager:(id)a3
{
  objc_storeStrong((id *)&self->_axHUDGestureManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axHUDGestureManager, 0);
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_nonTrackingBackgroundColor, 0);
  objc_storeStrong((id *)&self->_displayEntries, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_trackingBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_indexColor, 0);
}

@end
