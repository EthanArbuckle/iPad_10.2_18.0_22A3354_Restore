@implementation _UIInterfaceActionCustomViewRepresentationView

- (_UIInterfaceActionCustomViewRepresentationView)initWithAction:(id)a3
{
  _UIInterfaceActionCustomViewRepresentationView *v3;
  _UIInterfaceActionCustomViewRepresentationView *v4;
  void *v5;
  uint64_t v6;
  UIView *actionContentView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIInterfaceActionCustomViewRepresentationView;
  v3 = -[UIInterfaceActionRepresentationView initWithAction:](&v9, sel_initWithAction_, a3);
  v4 = v3;
  if (v3)
  {
    -[UIInterfaceActionRepresentationView action](v3, "action");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "customContentView");
    v6 = objc_claimAutoreleasedReturnValue();
    actionContentView = v4->_actionContentView;
    v4->_actionContentView = (UIView *)v6;

  }
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_UIInterfaceActionCustomViewRepresentationView;
  -[UIInterfaceActionRepresentationView description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInterfaceActionRepresentationView action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ action = %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)focusItemDeferralMode
{
  objc_super v3;

  if (self->_actionContentView)
    return -[UIView focusItemDeferralMode](self->_actionContentView, "focusItemDeferralMode");
  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionCustomViewRepresentationView;
  return -[UIView focusItemDeferralMode](&v3, sel_focusItemDeferralMode);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[UIInterfaceActionRepresentationView isHighlighted](self, "isHighlighted") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIInterfaceActionCustomViewRepresentationView;
    -[UIInterfaceActionRepresentationView setHighlighted:](&v5, sel_setHighlighted_, v3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIView setHighlighted:](self->_actionContentView, "setHighlighted:", v3);
  }
}

- (id)_fittingContentSizingView
{
  return self->_actionContentView;
}

- (BOOL)hasLayoutHeightConstraintsIdenticalToRepresentationView:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    -[_UIInterfaceActionCustomViewRepresentationView _actionContentView](self, "_actionContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIInterfaceActionCustomViewRepresentationView _actionContentView](self, "_actionContentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = objc_msgSend(v7, "hasLayoutHeightConstraintsIdenticalToInterfaceActionCustomView:", v8);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)updateContentsInsertedIntoHierarchy
{
  if (-[UIInterfaceActionRepresentationView _contentsInsertedIntoViewHierarchy](self, "_contentsInsertedIntoViewHierarchy"))
  {
    -[_UIInterfaceActionCustomViewRepresentationView _insertLoadedContentsIntoHierarchy](self, "_insertLoadedContentsIntoHierarchy");
  }
  else
  {
    -[_UIInterfaceActionCustomViewRepresentationView _removeLoadedContentsFromViewHierarcy](self, "_removeLoadedContentsFromViewHierarcy");
  }
}

- (id)_actionContentView
{
  return self->_actionContentView;
}

- (void)_insertLoadedContentsIntoHierarchy
{
  _UIInterfaceActionCustomViewRepresentationView *v3;

  -[UIView superview](self->_actionContentView, "superview");
  v3 = (_UIInterfaceActionCustomViewRepresentationView *)objc_claimAutoreleasedReturnValue();

  if (v3 != self)
  {
    -[UIView addSubview:](self, "addSubview:", self->_actionContentView);
    -[UIInterfaceActionRepresentationView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)_removeLoadedContentsFromViewHierarcy
{
  -[UIView removeFromSuperview](self->_actionContentView, "removeFromSuperview");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionContentView, 0);
}

@end
