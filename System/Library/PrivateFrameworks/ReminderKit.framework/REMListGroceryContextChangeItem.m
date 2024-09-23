@implementation REMListGroceryContextChangeItem

- (REMListGroceryContextChangeItem)initWithListChangeItem:(id)a3
{
  id v5;
  REMListGroceryContextChangeItem *v6;
  REMListGroceryContextChangeItem *v7;
  objc_super v9;

  v5 = a3;
  if (!v5)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "listChangeItem");
  v9.receiver = self;
  v9.super_class = (Class)REMListGroceryContextChangeItem;
  v6 = -[REMListGroceryContextChangeItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_listChangeItem, a3);

  return v7;
}

- (BOOL)shouldCategorizeGroceryItems
{
  void *v2;
  char v3;

  -[REMListGroceryContextChangeItem listChangeItem](self, "listChangeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldCategorizeGroceryItems");

  return v3;
}

- (void)setShouldCategorizeGroceryItems:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[REMListGroceryContextChangeItem listChangeItem](self, "listChangeItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldCategorizeGroceryItems:", v3);

}

- (BOOL)shouldSuggestConversionToGroceryList
{
  void *v2;
  char v3;

  -[REMListGroceryContextChangeItem listChangeItem](self, "listChangeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldSuggestConversionToGroceryList");

  return v3;
}

- (NSString)groceryLocaleID
{
  void *v2;
  void *v3;

  -[REMListGroceryContextChangeItem listChangeItem](self, "listChangeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groceryLocaleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setGroceryLocaleID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMListGroceryContextChangeItem listChangeItem](self, "listChangeItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGroceryLocaleID:", v4);

}

- (NSArray)unsavedReminderIDsToCategorizeAsGroceryItems
{
  void *v2;
  void *v3;

  -[REMListGroceryContextChangeItem listChangeItem](self, "listChangeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unsavedReminderIDsToCategorizeAsGroceryItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)categorizeGroceryItemsWithReminderIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[REMListGroceryContextChangeItem listChangeItem](self, "listChangeItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unsavedReminderIDsToCategorizeAsGroceryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMListGroceryContextChangeItem listChangeItem](self, "listChangeItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  if (v6)
  {
    objc_msgSend(v7, "unsavedReminderIDsToCategorizeAsGroceryItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[REMListGroceryContextChangeItem listChangeItem](self, "listChangeItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUnsavedReminderIDsToCategorizeAsGroceryItems:", v9);

    v4 = v8;
  }
  else
  {
    objc_msgSend(v7, "setUnsavedReminderIDsToCategorizeAsGroceryItems:", v4);
  }

}

- (REMListChangeItem)listChangeItem
{
  return self->_listChangeItem;
}

- (void)setListChangeItem:(id)a3
{
  objc_storeStrong((id *)&self->_listChangeItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listChangeItem, 0);
}

@end
