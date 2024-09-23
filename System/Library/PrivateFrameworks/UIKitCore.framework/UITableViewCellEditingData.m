@implementation UITableViewCellEditingData

- (UITableViewCellEditingData)initWithTableViewCell:(id)a3 editingStyle:(int64_t)a4
{
  id v6;
  UITableViewCellEditingData *v7;
  UITableViewCellEditingData *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UITableViewCellEditingData;
  v7 = -[UITableViewCellEditingData init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_cell, v6);
    v8->_editingStyle = a4;
  }

  return v8;
}

- (id)editControl:(BOOL)a3
{
  UITableViewCellEditControl *editControl;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  UITableViewCellEditControl *v9;
  UITableViewCellEditControl *v10;

  editControl = self->_editControl;
  if (editControl)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = (LODWORD(self->_editingStyle) - 1);
    if (v6 < 3)
      v7 = v6 + 1;
    else
      v7 = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
    v9 = (UITableViewCellEditControl *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTableViewCell:editingStyle:", WeakRetained, v7);
    v10 = self->_editControl;
    self->_editControl = v9;

    -[UITableViewCellEditControl setSelected:](self->_editControl, "setSelected:", objc_msgSend(WeakRetained, "isSelected"));
    -[UIView setHidden:](self->_editControl, "setHidden:", objc_msgSend(WeakRetained, "_accessoryViewsHidden"));
    -[UIControl addTarget:action:forControlEvents:](self->_editControl, "addTarget:action:forControlEvents:", WeakRetained, sel_editControlWasClicked_, 0x2000);
    if ((objc_msgSend(WeakRetained, "_usesModernAccessoriesLayout") & 1) == 0)
    {
      objc_msgSend(WeakRetained, "addSubview:", self->_editControl);
      *(_BYTE *)&self->_flags |= 1u;
    }

    editControl = self->_editControl;
  }
  return editControl;
}

- (BOOL)wantsMaskingWhileAnimatingDisabled
{
  return -[UITableViewCellEditControl wantsMaskingWhileAnimatingDisabled](self->_editControl, "wantsMaskingWhileAnimatingDisabled")|| -[UITableViewCellReorderControl wantsMaskingWhileAnimatingDisabled](self->_reorderControl, "wantsMaskingWhileAnimatingDisabled");
}

- (void)dealloc
{
  char flags;
  objc_super v4;

  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    -[UIView removeFromSuperview](self->_reorderControl, "removeFromSuperview");
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  -[UIView removeFromSuperview](self->_editControl, "removeFromSuperview");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 4) != 0)
LABEL_4:
    -[UIView removeFromSuperview](self->_reorderSeparatorView, "removeFromSuperview");
LABEL_5:
  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellEditingData;
  -[UITableViewCellEditingData dealloc](&v4, sel_dealloc);
}

- (id)reorderControl:(BOOL)a3
{
  UITableViewCellReorderControl *reorderControl;
  BOOL v5;
  id WeakRetained;
  UITableViewCellReorderControl *v7;
  UITableViewCellReorderControl *v8;

  reorderControl = self->_reorderControl;
  if (reorderControl)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
    v7 = (UITableViewCellReorderControl *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTableViewCell:", WeakRetained);
    v8 = self->_reorderControl;
    self->_reorderControl = v7;

    if ((objc_msgSend(WeakRetained, "_usesModernAccessoriesLayout") & 1) == 0)
    {
      objc_msgSend(WeakRetained, "addSubview:", self->_reorderControl);
      *(_BYTE *)&self->_flags |= 2u;
    }

    reorderControl = self->_reorderControl;
  }
  return reorderControl;
}

- (id)reorderSeparatorView:(BOOL)a3
{
  UIView *reorderSeparatorView;
  BOOL v5;
  _UITableViewCellVerticalSeparator *v6;
  UIView *v7;
  id WeakRetained;
  void *v9;

  reorderSeparatorView = self->_reorderSeparatorView;
  if (reorderSeparatorView)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = objc_alloc_init(_UITableViewCellVerticalSeparator);
    v7 = self->_reorderSeparatorView;
    self->_reorderSeparatorView = &v6->super;

    -[UIView setAutoresizingMask:](self->_reorderSeparatorView, "setAutoresizingMask:", 17);
    WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
    if (objc_msgSend(WeakRetained, "tableViewStyle"))
      +[UIColor tableSeparatorDarkColor](UIColor, "tableSeparatorDarkColor");
    else
      +[UIColor tableSeparatorLightColor](UIColor, "tableSeparatorLightColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_reorderSeparatorView, "setBackgroundColor:", v9);

    if ((objc_msgSend(WeakRetained, "_usesModernAccessoriesLayout") & 1) == 0)
    {
      objc_msgSend(WeakRetained, "addSubview:", self->_reorderSeparatorView);
      *(_BYTE *)&self->_flags |= 4u;
    }

    reorderSeparatorView = self->_reorderSeparatorView;
  }
  return reorderSeparatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reorderSeparatorView, 0);
  objc_storeStrong((id *)&self->_reorderControl, 0);
  objc_storeStrong((id *)&self->_editControl, 0);
  objc_destroyWeak((id *)&self->_cell);
}

@end
