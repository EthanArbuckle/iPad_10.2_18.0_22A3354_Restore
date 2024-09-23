@implementation TUIPredictionViewStackView

- (id)visibleCells
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TUIPredictionViewStackView arrangedSubviews](self, "arrangedSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", &__block_literal_global_5377);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUIPredictionViewStackView arrangedSubviews](self, "arrangedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)allVisibleCells
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[TUIPredictionViewStackView arrangedSubviews](self, "arrangedSubviews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "allVisibleCells");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v10);

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v3, "addObject:", v9);
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)arrangedSubviews
{
  void *v2;
  void *v3;

  -[TUIPredictionViewStackView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (TUIPredictionViewStackContentView)contentView
{
  return self->_contentView;
}

- (int64_t)_layoutTypeForSubview:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "layoutType");
  else
    v4 = 0;

  return v4;
}

- (id)subStackViews
{
  void *v3;
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
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[TUIPredictionViewStackView arrangedSubviews](self, "arrangedSubviews", 0);
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

- (void)setContentMargin:(UIEdgeInsets)a3
{
  self->_contentMargin = a3;
}

uint64_t __42__TUIPredictionViewStackView_visibleCells__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (TUIPredictionViewStackView)initWithFrame:(CGRect)a3
{
  TUIPredictionViewStackView *v3;
  TUIPredictionViewStackContentView *v4;
  TUIPredictionViewStackContentView *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUIPredictionViewStackView;
  v3 = -[TUIPredictionViewStackView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [TUIPredictionViewStackContentView alloc];
    v5 = -[TUIPredictionViewStackContentView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[TUIPredictionViewStackView setContentView:](v3, "setContentView:", v5);

    -[TUIPredictionViewStackView contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIPredictionViewStackView addSubview:](v3, "addSubview:", v6);

  }
  return v3;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

void __44__TUIPredictionViewStackView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id v11;
  CGRect v12;

  v11 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "setPredictionPosition:", a3);
  v5 = objc_msgSend(*(id *)(a1 + 32), "_layoutTypeForSubview:", v11);
  if (v5 == 1)
  {
    objc_msgSend(v11, "intrinsicContentSize");
    v6 = v9;
    v10 = v8;
    if (v9 == *MEMORY[0x1E0DC55F0])
      v6 = *(double *)(a1 + 48);
    v7 = v11;
    if (v8 != *MEMORY[0x1E0DC55F0])
      goto LABEL_10;
    goto LABEL_9;
  }
  if (!v5)
  {
    v6 = *(double *)(a1 + 48);
    v7 = v11;
LABEL_9:
    v10 = *(double *)(a1 + 80);
LABEL_10:
    objc_msgSend(v7, "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 0.0, v6, v10);
  }
  objc_msgSend(v11, "frame");
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CGRectGetWidth(v12)
                                                               + *(double *)(a1 + 88)
                                                               + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                           + 24);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t i;
  void *v36;
  int64_t v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  int64_t v43;
  _QWORD v44[12];
  _QWORD v45[4];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  -[TUIPredictionViewStackView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TUIPredictionViewStackView contentMargin](self, "contentMargin");
  v12 = v4 + v11;
  v14 = v6 + v13;
  v16 = v8 - (v11 + v15);
  v18 = v10 - (v13 + v17);
  -[TUIPredictionViewStackView contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  -[TUIPredictionViewStackView contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[TUIPredictionViewStackView arrangedSubviews](self, "arrangedSubviews");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v30)
  {
    v31 = v30;
    v32 = 0;
    v33 = *(_QWORD *)v47;
    v34 = v26;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v47 != v33)
          objc_enumerationMutation(v29);
        v36 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        v37 = -[TUIPredictionViewStackView _layoutTypeForSubview:](self, "_layoutTypeForSubview:", v36);
        if (v37 == 1)
        {
          objc_msgSend(v36, "intrinsicContentSize");
          v34 = v34 - v38;
        }
        else if (!v37)
        {
          ++v32;
        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v31);
  }
  else
  {
    v32 = 0;
    v34 = v26;
  }

  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v45[3] = 0;
  if (-[TUIPredictionViewStackView cellsHaveBackgroundColor](self, "cellsHaveBackgroundColor"))
    v39 = 16.0;
  else
    v39 = 0.0;
  -[TUIPredictionViewStackView arrangedSubviews](self, "arrangedSubviews");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = round(v34 - (double)(unint64_t)(objc_msgSend(v40, "count") - 1) * v39) / (double)v32;

  -[TUIPredictionViewStackView arrangedSubviews](self, "arrangedSubviews");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[TUIPredictionViewStackView layoutDirection](self, "layoutDirection");
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __44__TUIPredictionViewStackView_layoutSubviews__block_invoke;
  v44[3] = &unk_1E24FB9C8;
  v44[4] = self;
  v44[5] = v45;
  *(double *)&v44[6] = v41;
  v44[7] = v22;
  v44[8] = v24;
  *(double *)&v44[9] = v26;
  v44[10] = v28;
  *(double *)&v44[11] = v39;
  objc_msgSend(v42, "enumerateObjectsWithOptions:usingBlock:", 2 * (v43 == 1), v44);

  _Block_object_dispose(v45, 8);
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (UIEdgeInsets)contentMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentMargin.top;
  left = self->_contentMargin.left;
  bottom = self->_contentMargin.bottom;
  right = self->_contentMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)addArrangedSubview:(id)a3 beforeLastSubview:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  v4 = a4;
  v13 = a3;
  -[TUIPredictionViewStackView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  -[TUIPredictionViewStackView contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v4 || !v8)
  {
    objc_msgSend(v9, "addSubview:", v13);
    goto LABEL_6;
  }
  objc_msgSend(v9, "subviews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v13);

  if ((v12 & 1) == 0)
  {
    -[TUIPredictionViewStackView contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertSubview:atIndex:", v13, v8 - 1);
LABEL_6:

  }
  -[TUIPredictionViewStackView setNeedsLayout](self, "setNeedsLayout");

}

- (BOOL)cellsHaveBackgroundColor
{
  return self->_cellsHaveBackgroundColor;
}

- (void)setCellsHaveBackgroundColor:(BOOL)a3
{
  self->_cellsHaveBackgroundColor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
