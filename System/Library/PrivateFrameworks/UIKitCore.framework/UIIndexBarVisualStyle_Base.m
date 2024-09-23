@implementation UIIndexBarVisualStyle_Base

- (UIIndexBarView)indexBarView
{
  return (UIIndexBarView *)objc_loadWeakRetained((id *)&self->_indexBarView);
}

+ (id)containerViewForIndexBar:(id)a3
{
  return 0;
}

- (UIIndexBarVisualStyle_Base)initWithView:(id)a3
{
  id v3;
  UIIndexBarVisualStyle_Base *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIIndexBarVisualStyle_Base;
  v3 = a3;
  v4 = -[UIIndexBarVisualStyle_Base init](&v6, sel_init);
  -[UIIndexBarVisualStyle_Base setIndexBarView:](v4, "setIndexBarView:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (void)setIndexBarView:(id)a3
{
  objc_storeWeak((id *)&self->_indexBarView, a3);
}

- (BOOL)canBecomeFocused
{
  void *v2;
  char v3;

  -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_defaultCanBecomeFocused");

  return v3;
}

- (BOOL)overlay
{
  return 0;
}

- (double)minLineHeight
{
  return 0.0;
}

- (id)displayEntryFromEntry:(id)a3
{
  id v3;
  UIIndexBarDisplayEntry *v4;

  v3 = a3;
  v4 = objc_alloc_init(UIIndexBarDisplayEntry);
  -[UIIndexBarDisplayEntry setEntry:](v4, "setEntry:", v3);

  return v4;
}

- (CGRect)_visibleBoundsForRect:(CGRect)a3 stride:(double *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (int64_t)_indexForEntryAtPoint:(CGPoint)a3
{
  double y;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double Height;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  y = a3.y;
  -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView", a3.x);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectiveBounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v22.origin.x = v7;
  v22.origin.y = v9;
  v22.size.width = v11;
  v22.size.height = v13;
  if (y < CGRectGetMinY(v22))
    return 0x7FFFFFFFFFFFFFFFLL;
  v23.origin.x = v7;
  v23.origin.y = v9;
  v23.size.width = v11;
  v23.size.height = v13;
  if (y > CGRectGetMaxY(v23))
    return 0x7FFFFFFFFFFFFFFFLL;
  -[UIIndexBarVisualStyle_Base indexBarView](self, "indexBarView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "entries");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "count");
  if (v17)
  {
    v18 = v17;
    -[UIIndexBarVisualStyle_Base _visibleBoundsForRect:stride:](self, "_visibleBoundsForRect:stride:", 0, v7, v9, v11, v13);
    v19 = v24.origin.y;
    Height = CGRectGetHeight(v24);
    if (v18 - 1 >= ((uint64_t)((y - v19) / (Height / (double)v18)) & ~((uint64_t)((y - v19) / (Height / (double)v18)) >> 63)))
      v14 = (uint64_t)((y - v19) / (Height / (double)v18)) & ~((uint64_t)((y - v19) / (Height / (double)v18)) >> 63);
    else
      v14 = v18 - 1;
  }
  else
  {
    v14 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_indexBarView);
}

@end
