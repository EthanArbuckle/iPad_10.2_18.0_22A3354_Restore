@implementation MFMailboxFilterPickerSwitchCell

- (MFMailboxFilterPickerSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  MFMailboxFilterPickerSwitchCell *v7;
  UISwitch *v8;
  UISwitch *selectionSwitch;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MFMailboxFilterPickerSwitchCell;
  v7 = -[MFMailboxFilterPickerCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, v6);
  if (v7)
  {
    v8 = (UISwitch *)objc_alloc_init((Class)UISwitch);
    selectionSwitch = v7->_selectionSwitch;
    v7->_selectionSwitch = v8;

    -[UISwitch addTarget:action:forControlEvents:](v7->_selectionSwitch, "addTarget:action:forControlEvents:", v7, "_handleSwitchValueChange", 4096);
    -[MFMailboxFilterPickerSwitchCell setAccessoryView:](v7, "setAccessoryView:", v7->_selectionSwitch);
  }

  return v7;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFMailboxFilterPickerSwitchCell;
  -[MFMailboxFilterPickerSwitchCell setSelected:animated:](&v7, "setSelected:animated:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerSwitchCell selectionSwitch](self, "selectionSwitch"));
  objc_msgSend(v6, "setOn:", v4);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMailboxFilterPickerSwitchCell;
  -[MFMailboxFilterPickerSwitchCell prepareForReuse](&v3, "prepareForReuse");
  -[MFMailboxFilterPickerSwitchCell setDelegate:](self, "setDelegate:", 0);
}

- (void)_handleSwitchValueChange
{
  void *v3;
  id v4;
  id v5;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerSwitchCell selectionSwitch](self, "selectionSwitch"));
  -[MFMailboxFilterPickerSwitchCell setSelected:](self, "setSelected:", objc_msgSend(v4, "isOn"));

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerSwitchCell delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v5, "mailboxFilterPickerSwitchCell:valueDidChange:") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailboxFilterPickerSwitchCell selectionSwitch](self, "selectionSwitch"));
    objc_msgSend(v5, "mailboxFilterPickerSwitchCell:valueDidChange:", self, objc_msgSend(v3, "isOn"));

  }
}

- (MFMailboxFilterPickerSwitchCellDelegate)delegate
{
  return (MFMailboxFilterPickerSwitchCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UISwitch)selectionSwitch
{
  return self->_selectionSwitch;
}

- (void)setSelectionSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_selectionSwitch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionSwitch, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
