@implementation _UIDocumentUnavailableTitlePageView

- (_UIDocumentUnavailableTitlePageView)initWithFrame:(CGRect)a3
{
  _UIDocumentUnavailableTitlePageView *v3;
  _UIDocumentUnavailableTitlePageView *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  UIContentUnavailableView *v10;
  void *v11;
  UIContentUnavailableView *v12;
  UIContentUnavailableView *contentUnavailableView;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_UIDocumentUnavailableTitlePageView;
  v3 = -[_UIDocumentUnavailablePageView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = 1036831949;
    objc_msgSend(v5, "setShadowOpacity:", v6);

    -[UIView layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShadowRadius:", 40.0);

    -[UIView layer](v4, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShadowOffset:", 0.0, 8.0);

    +[UIColor tertiarySystemBackgroundColor](UIColor, "tertiarySystemBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v9);

    v10 = [UIContentUnavailableView alloc];
    +[UIContentUnavailableConfiguration emptyConfiguration](UIContentUnavailableConfiguration, "emptyConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[UIContentUnavailableView initWithConfiguration:](v10, "initWithConfiguration:", v11);

    -[UIView bounds](v4, "bounds");
    -[UIView setFrame:](v12, "setFrame:");
    -[UIView setAutoresizingMask:](v12, "setAutoresizingMask:", 18);
    -[UIContentUnavailableView setScrollEnabled:](v12, "setScrollEnabled:", 1);
    -[UIView addSubview:](v4, "addSubview:", v12);
    contentUnavailableView = v4->_contentUnavailableView;
    v4->_contentUnavailableView = v12;

  }
  return v4;
}

- (void)setTitle:(id *)a1
{
  id v4;
  id v5;
  char v6;
  id v7;
  id v8;

  if (a1)
  {
    v4 = a1[54];
    v5 = a2;
    if (v4 == v5)
    {
      v8 = v5;

      return;
    }
    if (v5 && v4)
    {
      v7 = v5;
      v6 = objc_msgSend(v4, "isEqual:", v5);

      if ((v6 & 1) != 0)
        return;
    }
    else
    {

    }
    objc_storeStrong(a1 + 54, a2);
    objc_msgSend(a1, "setNeedsLayout");
  }
}

- (void)setPrimaryAction:(id *)a1
{
  id v4;
  id v5;
  char v6;
  id v7;
  id v8;

  if (a1)
  {
    v4 = a1[55];
    v5 = a2;
    if (v4 == v5)
    {
      v8 = v5;

      return;
    }
    if (v5 && v4)
    {
      v7 = v5;
      v6 = objc_msgSend(v4, "isEqual:", v5);

      if ((v6 & 1) != 0)
        return;
    }
    else
    {

    }
    objc_storeStrong(a1 + 55, a2);
    objc_msgSend(a1, "setNeedsLayout");
  }
}

- (void)setSecondaryAction:(id *)a1
{
  id v4;
  id v5;
  char v6;
  id v7;
  id v8;

  if (a1)
  {
    v4 = a1[56];
    v5 = a2;
    if (v4 == v5)
    {
      v8 = v5;

      return;
    }
    if (v5 && v4)
    {
      v7 = v5;
      v6 = objc_msgSend(v4, "isEqual:", v5);

      if ((v6 & 1) != 0)
        return;
    }
    else
    {

    }
    objc_storeStrong(a1 + 56, a2);
    objc_msgSend(a1, "setNeedsLayout");
  }
}

- (void)setSecondaryMenu:(id *)a1
{
  id v4;
  id v5;
  char v6;
  id v7;
  id v8;

  if (a1)
  {
    v4 = a1[57];
    v5 = a2;
    if (v4 == v5)
    {
      v8 = v5;

      return;
    }
    if (v5 && v4)
    {
      v7 = v5;
      v6 = objc_msgSend(v4, "isEqual:", v5);

      if ((v6 & 1) != 0)
        return;
    }
    else
    {

    }
    objc_storeStrong(a1 + 57, a2);
    objc_msgSend(a1, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _BOOL4 actionsEnabled;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  UIAction *primaryAction;
  void *v15;
  UIAction *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UIAction *v21;
  UIMenu *secondaryMenu;
  _BOOL8 v23;
  _BOOL4 hasSecondaryProgress;
  UIAction *v25;
  void *v26;
  UIAction *v27;
  void *v28;
  UIMenu *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)_UIDocumentUnavailableTitlePageView;
  -[UIView layoutSubviews](&v33, sel_layoutSubviews);
  if (self)
  {
    +[UIContentUnavailableConfiguration emptyConfiguration](UIContentUnavailableConfiguration, "emptyConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "horizontalSizeClass");

    -[UIView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "verticalSizeClass");

    actionsEnabled = self->_actionsEnabled;
    if (v7 != 1)
    {
      objc_msgSend(v3, "setText:", self->_title);
      objc_msgSend(v3, "textProperties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setNumberOfLines:", 1);

      objc_msgSend(v3, "textProperties");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAdjustsFontSizeToFitWidth:", 1);

      objc_msgSend(v3, "setTextToButtonPadding:", 36.0);
      v11 = 96.0;
      if (v5 == 1)
        v11 = 64.0;
      objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", v11, *(double *)off_1E167DC68);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "textProperties");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFont:", v12);

    }
    primaryAction = self->_primaryAction;
    if (primaryAction)
    {
      __77___UIDocumentUnavailableTitlePageView__updateContentUnavailableConfiguration__block_invoke(primaryAction, 0, 1, self->_hasPrimaryProgress);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setButton:", v15);

      v16 = self->_primaryAction;
      objc_msgSend(v3, "buttonProperties");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setPrimaryAction:", v16);

      objc_msgSend(v3, "buttonProperties");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setMinimumSize:", 240.0, 0.0);

      objc_msgSend(v3, "buttonProperties");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setRole:", 1);

      objc_msgSend(v3, "buttonProperties");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setEnabled:", actionsEnabled);

    }
    v21 = self->_secondaryAction;
    if (v21)
    {

      secondaryMenu = self->_secondaryMenu;
    }
    else
    {
      secondaryMenu = self->_secondaryMenu;
      if (!secondaryMenu)
      {
LABEL_12:
        objc_msgSend(v3, "setButtonToSecondaryButtonPadding:", 20.0);
        objc_msgSend(v3, "setDirectionalLayoutMargins:", 20.0, 20.0, self->_bottomInset + 20.0, 20.0);
        -[UIContentUnavailableView setConfiguration:](self->_contentUnavailableView, "setConfiguration:", v3);

        return;
      }
    }
    v23 = actionsEnabled;
    hasSecondaryProgress = self->_hasSecondaryProgress;
    v25 = self->_secondaryAction;
    __77___UIDocumentUnavailableTitlePageView__updateContentUnavailableConfiguration__block_invoke(v25, (uint64_t)secondaryMenu, 0, hasSecondaryProgress);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSecondaryButton:", v26);

    v27 = self->_secondaryAction;
    objc_msgSend(v3, "secondaryButtonProperties");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setPrimaryAction:", v27);

    v29 = self->_secondaryMenu;
    objc_msgSend(v3, "secondaryButtonProperties");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setMenu:", v29);

    objc_msgSend(v3, "secondaryButtonProperties");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setMinimumSize:", 240.0, 0.0);

    objc_msgSend(v3, "secondaryButtonProperties");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setEnabled:", v23);

    goto LABEL_12;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryMenu, 0);
  objc_storeStrong((id *)&self->_secondaryAction, 0);
  objc_storeStrong((id *)&self->_primaryAction, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_contentUnavailableView, 0);
}

@end
