@implementation TKTonePickerTableView

- (void)performBlockEnsuringContentOffsetRemainsUnchanged:(id)a3
{
  void (**v4)(_QWORD);
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = (void (**)(_QWORD))a3;
  -[TKTonePickerTableView contentOffset](self, "contentOffset");
  v6 = v5;
  v8 = v7;
  v4[2](v4);

  -[TKTonePickerTableView contentOffset](self, "contentOffset");
  if (!TKPointEqualToPoint(v6, v8, v9, v10))
    -[TKTonePickerTableView setContentOffset:](self, "setContentOffset:", v6, v8);
}

- (void)layoutMarginsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TKTonePickerTableView;
  -[TKTonePickerTableView layoutMarginsDidChange](&v4, sel_layoutMarginsDidChange);
  -[TKTonePickerTableView layoutMarginsObserver](self, "layoutMarginsObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "layoutMarginsDidChangeInTonePickerTableView:", self);

}

- (void)_handleSeparatorColorDidChange
{
  id v3;

  -[TKTonePickerTableView separatorObserver](self, "separatorObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "separatorColorDidChangeInTonePickerTableView:", self);

}

- (void)setSeparatorColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TKTonePickerTableView;
  -[TKTonePickerTableView setSeparatorColor:](&v4, sel_setSeparatorColor_, a3);
  -[TKTonePickerTableView _handleSeparatorColorDidChange](self, "_handleSeparatorColorDidChange");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TKTonePickerTableView;
  -[TKTonePickerTableView layoutSubviews](&v3, sel_layoutSubviews);
  -[TKTonePickerTableView _handleSeparatorColorDidChange](self, "_handleSeparatorColorDidChange");
}

- (TKTonePickerTableViewLayoutMarginsObserver)layoutMarginsObserver
{
  return (TKTonePickerTableViewLayoutMarginsObserver *)objc_loadWeakRetained((id *)&self->_layoutMarginsObserver);
}

- (void)setLayoutMarginsObserver:(id)a3
{
  objc_storeWeak((id *)&self->_layoutMarginsObserver, a3);
}

- (TKTonePickerTableViewSeparatorObserver)separatorObserver
{
  return (TKTonePickerTableViewSeparatorObserver *)objc_loadWeakRetained((id *)&self->_separatorObserver);
}

- (void)setSeparatorObserver:(id)a3
{
  objc_storeWeak((id *)&self->_separatorObserver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_separatorObserver);
  objc_destroyWeak((id *)&self->_layoutMarginsObserver);
}

@end
