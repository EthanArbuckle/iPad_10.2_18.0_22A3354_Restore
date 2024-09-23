@implementation ICPasswordChangeView

- (void)layoutSubviews
{
  objc_super v3;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v3.receiver = self;
  v3.super_class = (Class)ICPasswordChangeView;
  -[ICPasswordChangeView layoutSubviews](&v3, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)updateConstraints
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v3 = ICAccessibilityAccessibilityLargerTextSizesEnabled();
  v4 = (void *)MEMORY[0x1E0CB3718];
  -[ICPasswordChangeView parentViewController](self, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "defaultConstraints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v7);

    v8 = (void *)MEMORY[0x1E0CB3718];
    -[ICPasswordChangeView parentViewController](self, "parentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "alternateConstraintsForAXLargerTextSizes");
  }
  else
  {
    objc_msgSend(v5, "alternateConstraintsForAXLargerTextSizes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v10);

    v8 = (void *)MEMORY[0x1E0CB3718];
    -[ICPasswordChangeView parentViewController](self, "parentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "defaultConstraints");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activateConstraints:", v11);

  v12.receiver = self;
  v12.super_class = (Class)ICPasswordChangeView;
  -[ICPasswordChangeView updateConstraints](&v12, sel_updateConstraints);
}

- (ICPasswordChangeViewController)parentViewController
{
  return (ICPasswordChangeViewController *)objc_loadWeakRetained((id *)&self->_parentViewController);
}

- (void)setParentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentViewController);
}

@end
