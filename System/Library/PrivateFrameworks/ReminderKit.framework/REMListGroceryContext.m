@implementation REMListGroceryContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_list, 0);
}

- (BOOL)shouldCategorizeGroceryItems
{
  void *v2;
  char v3;

  -[REMListGroceryContext list](self, "list");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldCategorizeGroceryItems");

  return v3;
}

- (REMList)list
{
  return self->_list;
}

- (REMListGroceryContext)initWithList:(id)a3
{
  id v5;
  REMListGroceryContext *v6;
  REMListGroceryContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListGroceryContext;
  v6 = -[REMListGroceryContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_list, a3);

  return v7;
}

- (BOOL)shouldSuggestConversionToGroceryList
{
  void *v2;
  char v3;

  -[REMListGroceryContext list](self, "list");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldSuggestConversionToGroceryList");

  return v3;
}

- (NSString)groceryLocaleID
{
  void *v2;
  void *v3;

  -[REMListGroceryContext list](self, "list");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groceryLocaleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setList:(id)a3
{
  objc_storeStrong((id *)&self->_list, a3);
}

@end
