@implementation PKApplyActionContentActionItemRow

- (PKApplyActionContentActionItemRow)initWithApplyActionContentActionItem:(id)a3 selectionHandler:(id)a4
{
  id v7;
  id v8;
  PKApplyActionContentActionItemRow *v9;
  PKApplyActionContentActionItemRow *v10;
  uint64_t v11;
  id selectionHandler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKApplyActionContentActionItemRow;
  v9 = -[PKApplyActionContentActionItemRow init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionItem, a3);
    v11 = objc_msgSend(v8, "copy");
    selectionHandler = v10->_selectionHandler;
    v10->_selectionHandler = (id)v11;

  }
  return v10;
}

- (NSCopying)identifier
{
  id v3;
  objc_class *v4;
  void *v5;
  PKApplyActionContentActionItem *actionItem;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  actionItem = self->_actionItem;
  if (actionItem)
  {
    -[PKApplyActionContentActionItem identifier](actionItem, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v7);

  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return (NSCopying *)v8;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  id v4;

  v4 = a3;
  -[PKApplyActionContentActionItemRow cellClass](self, "cellClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setActionItem:", self->_actionItem);

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKApplyActionContentActionItemRow *v5;
  uint64_t v6;
  PKApplyActionContentActionItem *actionItem;
  uint64_t v8;
  id selectionHandler;

  v5 = +[PKApplyActionContentActionItemRow allocWithZone:](PKApplyActionContentActionItemRow, "allocWithZone:");
  v6 = -[PKApplyActionContentActionItem copyWithZone:](self->_actionItem, "copyWithZone:", a3);
  actionItem = v5->_actionItem;
  v5->_actionItem = (PKApplyActionContentActionItem *)v6;

  v8 = objc_msgSend(self->_selectionHandler, "copyWithZone:", a3);
  selectionHandler = v5->_selectionHandler;
  v5->_selectionHandler = (id)v8;

  return v5;
}

- (void)handleCellSelection
{
  void (**selectionHandler)(void);

  selectionHandler = (void (**)(void))self->_selectionHandler;
  if (selectionHandler)
    selectionHandler[2]();
}

- (BOOL)shouldHighlightItem
{
  return self->_selectionHandler != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_actionItem, 0);
}

@end
