@implementation PLPillContentWrapperView

- (PLPillContentWrapperView)initWithFrame:(CGRect)a3
{
  PLPillContentWrapperView *v3;
  PLPillContentWrapperView *v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLPillContentWrapperView;
  v3 = -[PLPillContentWrapperView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    objc_storeStrong((id *)&v3->_preferredContentSizeCategory, (id)*MEMORY[0x1E0CEB440]);
    -[PLPillContentWrapperView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v5) = 1132068864;
    -[PLPillContentWrapperView setContentCompressionResistancePriority:forAxis:](v4, "setContentCompressionResistancePriority:forAxis:", 0, v5);
  }
  return v4;
}

- (void)setTopConstraintBreakable:(BOOL)a3
{
  if (self->_topConstraintBreakable != a3)
  {
    self->_topConstraintBreakable = a3;
    -[PLPillContentWrapperView _updateConstraintsPriority](self, "_updateConstraintsPriority");
  }
}

- (void)setContentItem:(id)a3
{
  -[PLPillContentWrapperView setContentItem:transitionCoordinator:](self, "setContentItem:transitionCoordinator:", a3, 0);
}

- (void)setContentItem:(id)a3 transitionCoordinator:(id)a4
{
  id v7;
  void *v8;
  NSString *v9;
  NSString *preferredContentSizeCategory;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if ((objc_msgSend(v12, "isEqual:", self->_contentItem) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contentItem, a3);
    if (self->_adjustsFontForContentSizeCategory)
    {
      -[PLPillContentWrapperView traitCollection](self, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "preferredContentSizeCategory");
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      preferredContentSizeCategory = self->_preferredContentSizeCategory;
      self->_preferredContentSizeCategory = v9;

    }
    UIViewForPLPillContentItem(v12, self->_preferredContentSizeCategory);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPillContentWrapperView _setContentView:transitionCoordinator:](self, "_setContentView:transitionCoordinator:", v11, v7);

  }
}

- (void)beginAppearanceTransition:(BOOL)a3
{
  int64_t appearState;
  BOOL v5;
  int64_t v6;
  id v7;

  appearState = self->_appearState;
  if (!a3)
  {
    if ((unint64_t)(appearState - 1) > 1)
      return;
    v6 = 3;
    goto LABEL_10;
  }
  if (appearState)
    v5 = appearState == 3;
  else
    v5 = 1;
  if (v5)
  {
    v6 = 1;
LABEL_10:
    self->_appearState = v6;
    if (!-[PLPillContentItem isSolo](self->_contentItem, "isSolo") && self->_appearState == 3)
    {
      -[PLPillContentWrapperView _contentLabel](self, "_contentLabel");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMarqueeRunning:", 0);
      objc_msgSend(v7, "_setMarqueeUpdatable:", 0);

    }
  }
}

- (void)endAppearanceTransition:(BOOL)a3
{
  int64_t appearState;
  int64_t v5;
  id v6;

  appearState = self->_appearState;
  if (a3)
  {
    if (appearState != 1)
      return;
    v5 = 2;
  }
  else
  {
    if (appearState != 3)
      return;
    v5 = 0;
  }
  self->_appearState = v5;
  if (!-[PLPillContentItem isSolo](self->_contentItem, "isSolo") && self->_appearState == 2)
  {
    -[PLPillContentWrapperView _contentLabel](self, "_contentLabel");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMarqueeRunning:", 1);

  }
}

- (void)updateWithContentItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  UIView *contentView;
  uint64_t v16;
  UIView *v17;
  UIView *v18;
  UIView *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  UIView *v24;
  id v25;
  uint64_t *v26;
  _QWORD *v27;
  _QWORD v28[6];
  _QWORD v29[5];
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_contentView)
  {
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PLPillContentWrapperView _contentLabel](self, "_contentLabel");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          -[UIView arrangedSubviews](self->_contentView, "arrangedSubviews");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          if (v7)
          {
            v9 = *(_QWORD *)v36;
            while (2)
            {
              for (i = 0; i != v7; i = (char *)i + 1)
              {
                if (*(_QWORD *)v36 != v9)
                  objc_enumerationMutation(v8);
                v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  v7 = v11;
                  goto LABEL_16;
                }
              }
              v7 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
              if (v7)
                continue;
              break;
            }
          }
LABEL_16:

        }
        else
        {
          v7 = 0;
        }
      }
      objc_msgSend(v7, "_setMarqueeUpdatable:", 1);
      objc_msgSend(v5, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setText:", v12);

    }
    objc_msgSend(v5, "accessoryView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 == 0;

    if (!v14)
    {
      v31 = 0;
      v32 = &v31;
      v33 = 0x2020000000;
      v34 = 0x7FFFFFFFFFFFFFFFLL;
      v29[0] = 0;
      v29[1] = v29;
      v29[2] = 0x3032000000;
      v29[3] = __Block_byref_object_copy_;
      v29[4] = __Block_byref_object_dispose_;
      v30 = 0;
      contentView = self->_contentView;
      v16 = objc_opt_class();
      v17 = contentView;
      if (v16)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v18 = v17;
        else
          v18 = 0;
      }
      else
      {
        v18 = 0;
      }
      v19 = v18;

      if (v19)
      {
        -[UIView arrangedSubviews](v19, "arrangedSubviews");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = MEMORY[0x1E0C809B0];
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __50__PLPillContentWrapperView_updateWithContentItem___block_invoke;
        v28[3] = &unk_1E91D3478;
        v28[4] = &v31;
        v28[5] = v29;
        objc_msgSend(v20, "enumerateObjectsUsingBlock:", v28);

        if (v32[3] != 0x7FFFFFFFFFFFFFFFLL)
        {
          v22 = (void *)MEMORY[0x1E0CEABB0];
          v23[0] = v21;
          v23[1] = 3221225472;
          v23[2] = __50__PLPillContentWrapperView_updateWithContentItem___block_invoke_2;
          v23[3] = &unk_1E91D34A0;
          v24 = v19;
          v25 = v5;
          v26 = &v31;
          v27 = v29;
          objc_msgSend(v22, "performWithoutAnimation:", v23);

        }
      }

      _Block_object_dispose(v29, 8);
      _Block_object_dispose(&v31, 8);
    }
  }

}

void __50__PLPillContentWrapperView_updateWithContentItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

uint64_t __50__PLPillContentWrapperView_updateWithContentItem___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "accessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertArrangedSubview:atIndex:", v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

  return objc_msgSend(*(id *)(a1 + 32), "removeArrangedSubview:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  -[UIView intrinsicContentSize](self->_contentView, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  -[PLPillContentWrapperView _contentLabel](self, "_contentLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "font");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "capHeight");
    v11 = v10;
    objc_msgSend(v9, "descender");
    v13 = v11 - v12;
    objc_msgSend(v9, "_scaledValueForValue:", 2.0);
    v6 = ceil(v13 + v14);

  }
  v15 = v4;
  v16 = v6;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIView sizeThatFits:](self->_contentView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  void *v2;
  BOOL v3;

  if (!self->_adjustsFontForContentSizeCategory)
    return 0;
  -[PLPillContentWrapperView _contentLabel](self, "_contentLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  -[PLPillContentWrapperView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_adjustsFontForContentSizeCategory && (BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_preferredContentSizeCategory, v4);
    -[PLPillContentWrapperView _contentLabel](self, "_contentLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      PLConfigureUILabelWithPLPillContentItemStyle(v6, -[PLPillContentItem style](self->_contentItem, "style"), -[PLPillContentItem isSolo](self->_contentItem, "isSolo") ^ 1, self->_preferredContentSizeCategory);
    -[PLPillContentWrapperView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[PLPillContentWrapperView setNeedsLayout](self, "setNeedsLayout");

    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateConstraintsPriority
{
  if (self->_topConstraintBreakable)
    -[PLPillContentWrapperView _makeTopConstraintBreakable](self, "_makeTopConstraintBreakable");
  else
    -[PLPillContentWrapperView _makeBottomConstraintBreakable](self, "_makeBottomConstraintBreakable");
}

- (void)_makeTopConstraintBreakable
{
  double v2;
  double v4;

  LODWORD(v2) = 1132068864;
  -[NSLayoutConstraint setPriority:](self->_topConstraint, "setPriority:", v2);
  LODWORD(v4) = 1148846080;
  -[NSLayoutConstraint setPriority:](self->_bottomConstraint, "setPriority:", v4);
}

- (void)_makeBottomConstraintBreakable
{
  double v2;
  double v4;

  LODWORD(v2) = 1132068864;
  -[NSLayoutConstraint setPriority:](self->_bottomConstraint, "setPriority:", v2);
  LODWORD(v4) = 1148846080;
  -[NSLayoutConstraint setPriority:](self->_topConstraint, "setPriority:", v4);
}

- (void)_setContentView:(id)a3 transitionCoordinator:(id)a4
{
  UIView *v7;
  id v8;
  UIView *contentView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSLayoutConstraint *v21;
  double v22;
  void *v23;
  void *v24;
  NSLayoutConstraint *v25;
  NSLayoutConstraint *topConstraint;
  NSLayoutConstraint *v27;
  void *v28;
  void *v29;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *bottomConstraint;
  uint64_t v32;
  UIView *v33;
  UIView *v34;
  _QWORD v35[4];
  UIView *v36;
  _QWORD v37[4];
  UIView *v38;
  PLPillContentWrapperView *v39;
  _QWORD v40[6];

  v7 = (UIView *)a3;
  v8 = a4;
  contentView = self->_contentView;
  if (contentView != v7)
  {
    v34 = contentView;
    objc_storeStrong((id *)&self->_contentView, a3);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PLPillContentWrapperView addSubview:](self, "addSubview:", v7);
    -[PLPillContentWrapperView leftAnchor](self, "leftAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](v7, "leftAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLPillContentWrapperView rightAnchor](self, "rightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView rightAnchor](v7, "rightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v16) = 1144750080;
    -[PLPillContentWrapperView setContentHuggingPriority:forAxis:](self, "setContentHuggingPriority:forAxis:", 1, v16);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v12, v15, 0);
    -[PLPillContentWrapperView _contentLabel](self, "_contentLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[PLPillContentWrapperView centerYAnchor](self, "centerYAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView centerYAnchor](v7, "centerYAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v20);
      v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

      LODWORD(v22) = 1148846080;
      -[NSLayoutConstraint setPriority:](v21, "setPriority:", v22);
    }
    else
    {
      -[PLPillContentWrapperView topAnchor](self, "topAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](v7, "topAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v24);
      v25 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

      topConstraint = self->_topConstraint;
      self->_topConstraint = v25;
      v27 = v25;

      -[PLPillContentWrapperView bottomAnchor](self, "bottomAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](v7, "bottomAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v29);
      v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

      bottomConstraint = self->_bottomConstraint;
      self->_bottomConstraint = v30;
      v21 = v30;

      objc_msgSend(v17, "addObject:", v27);
    }
    objc_msgSend(v17, "addObject:", v21);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v17);
    -[PLPillContentWrapperView _updateConstraintsPriority](self, "_updateConstraintsPriority");
    -[PLPillContentWrapperView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    if (v8)
    {
      v32 = MEMORY[0x1E0C809B0];
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __66__PLPillContentWrapperView__setContentView_transitionCoordinator___block_invoke;
      v40[3] = &unk_1E91D3160;
      v40[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v40);
      v37[0] = v32;
      v37[1] = 3221225472;
      v37[2] = __66__PLPillContentWrapperView__setContentView_transitionCoordinator___block_invoke_2;
      v37[3] = &unk_1E91D34C8;
      v33 = v34;
      v38 = v34;
      v39 = self;
      v35[0] = v32;
      v35[1] = 3221225472;
      v35[2] = __66__PLPillContentWrapperView__setContentView_transitionCoordinator___block_invoke_3;
      v35[3] = &unk_1E91D3250;
      v36 = v38;
      objc_msgSend(v8, "animateAlongsideTransition:completion:", v37, v35);

    }
    else
    {
      v33 = v34;
      -[UIView removeFromSuperview](v34, "removeFromSuperview");
      -[UIView pl_performCrossFadeIfNecessary](self, "pl_performCrossFadeIfNecessary");
    }

  }
}

uint64_t __66__PLPillContentWrapperView__setContentView_transitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 0.0);
}

uint64_t __66__PLPillContentWrapperView__setContentView_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 416), "setAlpha:", 1.0);
}

uint64_t __66__PLPillContentWrapperView__setContentView_transitionCoordinator___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (id)_contentLabel
{
  UIView *contentView;
  uint64_t v3;
  UIView *v4;
  UIView *v5;
  UIView *v6;

  contentView = self->_contentView;
  v3 = objc_opt_class();
  v4 = contentView;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (BOOL)isTopConstraintBreakable
{
  return self->_topConstraintBreakable;
}

- (PLPillContentItem)contentItem
{
  return self->_contentItem;
}

- (int64_t)appearState
{
  return self->_appearState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItem, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
