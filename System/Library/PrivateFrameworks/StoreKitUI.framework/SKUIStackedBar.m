@implementation SKUIStackedBar

- (SKUIStackedBar)initWithFrame:(CGRect)a3
{
  SKUIStackedBar *v3;
  uint64_t v4;
  _UIBackdropView *backdropView;
  UIView *v6;
  UIView *wrapperView;
  UIView *v8;
  UIView *maskView;
  void *v10;
  void *v11;
  UIView *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SKUIStackedBar;
  v3 = -[SKUIStackedBar initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithPrivateStyle:", 2010);
    backdropView = v3->_backdropView;
    v3->_backdropView = (_UIBackdropView *)v4;

    -[SKUIStackedBar addSubview:](v3, "addSubview:", v3->_backdropView);
    v3->_lastItemExpanded = 1;
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    wrapperView = v3->_wrapperView;
    v3->_wrapperView = v6;

    -[UIView setClipsToBounds:](v3->_wrapperView, "setClipsToBounds:", 1);
    -[SKUIStackedBar addSubview:](v3, "addSubview:", v3->_wrapperView);
    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    maskView = v3->_maskView;
    v3->_maskView = v8;

    -[UIView layer](v3->_maskView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C50]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCompositingFilter:", v11);

    v12 = v3->_maskView;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    -[UIView addSubview:](v3->_wrapperView, "addSubview:", v3->_maskView);
  }
  return v3;
}

- (void)setItems:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_items != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_items, a3);
    -[SKUIStackedBar _reload](self, "_reload");
    v5 = v6;
  }

}

- (void)setLastItemExpanded:(BOOL)a3
{
  -[SKUIStackedBar setLastItemExpanded:animated:](self, "setLastItemExpanded:animated:", a3, 0);
}

- (void)setLastItemExpanded:(BOOL)a3 animated:(BOOL)a4
{
  _QWORD v6[5];
  _QWORD v7[5];
  BOOL v8;

  if (self->_lastItemExpanded != a3)
  {
    if (a4)
    {
      -[SKUIStackedBar layoutIfNeeded](self, "layoutIfNeeded");
      v6[4] = self;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __47__SKUIStackedBar_setLastItemExpanded_animated___block_invoke;
      v7[3] = &unk_1E73A40F8;
      v7[4] = self;
      v8 = a3;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __47__SKUIStackedBar_setLastItemExpanded_animated___block_invoke_2;
      v6[3] = &unk_1E73A0108;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v7, v6, 0.2);
    }
    else
    {
      self->_lastItemExpanded = a3;
      -[SKUIStackedBar _reload](self, "_reload");
    }
  }
}

uint64_t __47__SKUIStackedBar_setLastItemExpanded_animated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 448) = *(_BYTE *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_reload");
  objc_msgSend(*(id *)(a1 + 32), "frame");
  v3 = v2;
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "sizeThatFits:", v6, v7);
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", v3, v5, v8, v9);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __47__SKUIStackedBar_setLastItemExpanded_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reload");
}

- (void)setOffset:(double)a3
{
  double v4;
  double offset;

  if (!self->_splitViewStyle && self->_offset != a3)
  {
    self->_offset = a3;
    -[SKUIStackedBar sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    offset = self->_offset;
    if (offset < self->_newOffset && offset > -v4)
      self->_newOffset = offset;
    -[SKUIStackedBar frame](self, "frame");
    -[SKUIStackedBar setFrame:](self, "setFrame:");
    -[SKUIStackedBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  _UIBackdropView *backdropView;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *maskView;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  void *v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  objc_super v22;
  CGRect v23;
  CGRect v24;

  v22.receiver = self;
  v22.super_class = (Class)SKUIStackedBar;
  -[SKUIStackedBar layoutSubviews](&v22, sel_layoutSubviews);
  backdropView = self->_backdropView;
  -[SKUIStackedBar bounds](self, "bounds");
  -[_UIBackdropView setFrame:](backdropView, "setFrame:");
  -[SKUIStackedBar bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  -[SKUIStackedBar sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[UIView setFrame:](self->_wrapperView, "setFrame:", v5, v9 - v10, v7, v10);
  -[SKUIStackedBar bounds](self, "bounds");
  maskView = self->_maskView;
  -[UIView convertRect:fromView:](self->_wrapperView, "convertRect:fromView:", self);
  -[UIView setFrame:](maskView, "setFrame:");
  -[UIView frame](self->_wrapperView, "frame");
  -[UIView setHidden:](self->_maskView, "setHidden:", v12 >= 0.0);
  -[UIView bounds](self->_wrapperView, "bounds");
  v14 = v13;
  if (-[NSArray count](self->_cells, "count"))
  {
    v15 = 0;
    do
    {
      -[NSArray objectAtIndex:](self->_cells, "objectAtIndex:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIStackedBar bounds](self, "bounds");
      objc_msgSend(v16, "sizeThatFits:", CGRectGetWidth(v23), 0.0);
      v19 = v17;
      v20 = v18;
      if (v15)
      {
        v21 = 0.0;
      }
      else
      {
        v21 = 0.0;
        if (!self->_hidesStatusBar)
        {
          if (self->_splitViewStyle)
          {
            v21 = 0.0;
          }
          else
          {
            v20 = v18 + 20.0;
            v21 = 20.0;
          }
        }
      }
      objc_msgSend(v16, "setFrame:", 0.0, v14, v17, v20);
      objc_msgSend(v16, "setTitleEdgeInsets:", v21, 50.0, 0.0, 50.0);
      v24.origin.x = 0.0;
      v24.origin.y = v14;
      v24.size.width = v19;
      v24.size.height = v20;
      v14 = v14 + CGRectGetHeight(v24);

      ++v15;
    }
    while (v15 < -[NSArray count](self->_cells, "count"));
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  uint64_t v5;
  double v6;
  double v7;
  CGSize result;

  width = a3.width;
  v5 = -[NSArray count](self->_items, "count", a3.width, a3.height);
  if (!v5)
  {
    v6 = 44.0;
    goto LABEL_10;
  }
  if (v5 != 1)
  {
    if (self->_lastItemExpanded)
    {
LABEL_8:
      v6 = (double)(v5 - 1) * 25.0 + 44.0;
      goto LABEL_10;
    }
LABEL_9:
    v6 = (double)v5 * 25.0;
    goto LABEL_10;
  }
  if (!self->_lastItemExpanded)
    goto LABEL_9;
  v6 = 0.0;
  if (!self->_zeroHeightWhenFirstChildExpanded)
    goto LABEL_8;
LABEL_10:
  if (!self->_hidesStatusBar && !self->_splitViewStyle)
    v6 = v6 + 20.0;
  v7 = width;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[SKUIStackedBar frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[SKUIStackedBar sizeThatFits:](self, "sizeThatFits:", v7, v8);
  -[SKUIStackedBar setFrame:](self, "setFrame:", v4, v6, v9, v10);
}

- (void)animateToFullSizeIfNecessary
{
  double v3;
  double v4;
  double v5;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double offset;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[6];
  _QWORD v25[17];

  if (!self->_splitViewStyle)
  {
    -[SKUIStackedBar frame](self, "frame");
    v4 = v3;
    -[SKUIStackedBar sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    if (v4 > 64.0 && v4 < v5)
    {
      v7 = v5;
      -[SKUIStackedBar frame](self, "frame");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      -[SKUIStackedBar bounds](self, "bounds");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      -[SKUIStackedBar bounds](self, "bounds");
      offset = self->_offset;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __46__SKUIStackedBar_animateToFullSizeIfNecessary__block_invoke;
      v25[3] = &unk_1E73A4120;
      v25[4] = self;
      v25[5] = v9;
      v25[6] = v11;
      v25[7] = v13;
      *(double *)&v25[8] = v7;
      v25[9] = v15;
      v25[10] = v17;
      v25[11] = v19;
      *(double *)&v25[12] = v7;
      v25[13] = v21;
      v25[14] = v22;
      v25[15] = v23;
      v25[16] = 0x4034000000000000;
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __46__SKUIStackedBar_animateToFullSizeIfNecessary__block_invoke_2;
      v24[3] = &unk_1E73A4148;
      v24[4] = self;
      *(double *)&v24[5] = offset;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v25, v24, 0.3);
    }
  }
}

uint64_t __46__SKUIStackedBar_animateToFullSizeIfNecessary__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setFrame:", *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
}

double __46__SKUIStackedBar_animateToFullSizeIfNecessary__block_invoke_2(uint64_t a1, int a2)
{
  double *v3;
  double result;
  uint64_t v5;

  if (a2)
  {
    v3 = *(double **)(a1 + 32);
    result = v3[57];
    if (result == *(double *)(a1 + 40))
    {
      objc_msgSend(v3, "setNeedsLayout");
      v5 = *(_QWORD *)(a1 + 32);
      result = *(double *)(v5 + 456);
      *(double *)(v5 + 480) = result;
    }
  }
  return result;
}

- (void)_buttonAction:(id)a3
{
  -[SKUIStackedBar _selectItemAtIndex:](self, "_selectItemAtIndex:", -[NSArray indexOfObject:](self->_cells, "indexOfObject:", a3));
}

- (void)_backAction:(id)a3
{
  -[SKUIStackedBar _selectItemAtIndex:](self, "_selectItemAtIndex:", -[NSArray count](self->_items, "count", a3) - 2);
}

- (void)_resetNewOffset
{
  self->_newOffset = self->_offset;
}

- (void)_reload
{
  NSArray *v3;
  unint64_t v4;
  void *v5;
  SKUIStackedBarCell *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  NSArray *cells;
  NSArray *v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_cells);
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_items, "count"))
  {
    v4 = 0;
    do
    {
      -[NSArray objectAtIndex:](self->_items, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4 >= -[NSArray count](v3, "count"))
      {
        v6 = objc_alloc_init(SKUIStackedBarCell);
        -[SKUIStackedBarCell addTarget:action:forControlEvents:](v6, "addTarget:action:forControlEvents:", self, sel__buttonAction_, 64);
        -[UIView addSubview:](self->_wrapperView, "addSubview:", v6);
        -[NSArray addObject:](v3, "addObject:", v6);
      }
      else
      {
        -[NSArray objectAtIndex:](v3, "objectAtIndex:", v4);
        v6 = (SKUIStackedBarCell *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v5, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIStackedBarCell setTitle:forState:](v6, "setTitle:forState:", v7, 0);

      v8 = !self->_alwaysShowsBackButton && -[NSArray count](self->_items, "count") < 2
        || -[SKUIStackedBar splitViewStyle](self, "splitViewStyle");
      -[SKUIStackedBarCell backButton](v6, "backButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidden:", v8);

      -[SKUIStackedBarCell backButton](v6, "backButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel__backAction_, 64);

      v11 = self->_lastItemExpanded && v4 == -[NSArray count](self->_items, "count") - 1;
      -[SKUIStackedBarCell setExpanded:](v6, "setExpanded:", v11);

      ++v4;
    }
    while (v4 < -[NSArray count](self->_items, "count"));
  }
  cells = self->_cells;
  self->_cells = v3;
  v13 = v3;

  -[UIView bringSubviewToFront:](self->_wrapperView, "bringSubviewToFront:", self->_maskView);
  -[SKUIStackedBar setNeedsLayout](self, "setNeedsLayout");
}

- (void)_selectItemAtIndex:(int64_t)a3
{
  id v5;

  -[SKUIStackedBar delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "stackedBar:didSelectItemAtIndex:", self, a3);

}

- (SKUIStackedBarDelegate)delegate
{
  return (SKUIStackedBarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)alwaysShowsBackButton
{
  return self->_alwaysShowsBackButton;
}

- (void)setAlwaysShowsBackButton:(BOOL)a3
{
  self->_alwaysShowsBackButton = a3;
}

- (NSArray)items
{
  return self->_items;
}

- (BOOL)lastItemExpanded
{
  return self->_lastItemExpanded;
}

- (BOOL)hidesStatusBar
{
  return self->_hidesStatusBar;
}

- (void)setHidesStatusBar:(BOOL)a3
{
  self->_hidesStatusBar = a3;
}

- (BOOL)splitViewStyle
{
  return self->_splitViewStyle;
}

- (void)setSplitViewStyle:(BOOL)a3
{
  self->_splitViewStyle = a3;
}

- (BOOL)zeroHeightWhenFirstChildExpanded
{
  return self->_zeroHeightWhenFirstChildExpanded;
}

- (void)setZeroHeightWhenFirstChildExpanded:(BOOL)a3
{
  self->_zeroHeightWhenFirstChildExpanded = a3;
}

- (double)offset
{
  return self->_offset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_wrapperView, 0);
  objc_storeStrong((id *)&self->_cells, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
