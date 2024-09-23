@implementation ICQUIInlineTipRow

- (ICQUIInlineTipRow)init
{
  ICQUIInlineTipRow *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICQUIInlineTipRow;
  result = -[RUIElement init](&v3, sel_init);
  if (result)
    result->_tableCellLock._os_unfair_lock_opaque = 0;
  return result;
}

- (id)tableCell
{
  os_unfair_lock_s *p_tableCellLock;
  UITableViewCell *tableCell;
  UITableViewCell *v5;
  UITableViewCell *v7;
  void *v8;
  UITableViewCell *v9;
  void *v10;
  UITableViewCell *v11;
  UITableViewCell *v12;
  UITableViewCell *v13;
  objc_super v14;

  p_tableCellLock = &self->_tableCellLock;
  os_unfair_lock_lock(&self->_tableCellLock);
  tableCell = self->_tableCell;
  if (tableCell)
  {
    v5 = tableCell;
    os_unfair_lock_unlock(p_tableCellLock);
    return v5;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICQUIInlineTipRow;
    -[RUITableViewRow tableCell](&v14, sel_tableCell);
    v7 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)MEMORY[0x24BE75590];
      v9 = v7;
      objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, -1, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setIdentifier:", CFSTR("TIP_HOST_CELL_MS"));
      objc_msgSend(v10, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
      objc_msgSend(v10, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
      objc_msgSend(v10, "setProperty:forKey:", v9, *MEMORY[0x24BE75D18]);
      objc_msgSend(v10, "setObject:forKeyedSubscript:", self->_tipView, CFSTR("ICQUITipView"));
      -[UITableViewCell setSpecifier:](v9, "setSpecifier:", v10);
      -[UITableViewCell refreshCellContentsWithSpecifier:](v9, "refreshCellContentsWithSpecifier:", v10);

    }
    v11 = self->_tableCell;
    self->_tableCell = v7;
    v12 = v7;

    os_unfair_lock_unlock(p_tableCellLock);
    v13 = self->_tableCell;

    return v13;
  }
}

- (float)rowHeightWithMax:(float)a3 peggedHeight:(float)a4 tableView:(id)a5 indexPath:(id)a6
{
  double v6;

  -[UITableViewCell intrinsicContentSize](self->_tableCell, "intrinsicContentSize", a5, a6);
  return v6;
}

- (UIView)tipView
{
  return self->_tipView;
}

- (void)setTipView:(id)a3
{
  objc_storeStrong((id *)&self->_tipView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipView, 0);
  objc_storeStrong((id *)&self->_tableCell, 0);
}

@end
