@implementation _PXBrowserSummarySelectedItemsSnapshot

- (_PXBrowserSummarySelectedItemsSnapshot)init
{
  return -[_PXBrowserSummarySelectedItemsSnapshot initWithBrowserSelectionSnapshot:](self, "initWithBrowserSelectionSnapshot:", 0);
}

- (_PXBrowserSummarySelectedItemsSnapshot)initWithBrowserSelectionSnapshot:(id)a3
{
  id v5;
  _PXBrowserSummarySelectedItemsSnapshot *v6;
  _PXBrowserSummarySelectedItemsSnapshot *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXBrowserSummarySelectedItemsSnapshot;
  v6 = -[_PXBrowserSummarySelectedItemsSnapshot init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_browserSelectionSnapshot, a3);

  return v7;
}

- (int64_t)count
{
  void *v2;
  int64_t v3;

  -[_PXBrowserSummarySelectedItemsSnapshot browserSelectionSnapshot](self, "browserSelectionSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "assetCount");

  return v3;
}

- (id)itemReferenceAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[_PXBrowserSummarySelectedItemsSnapshot browserSelectionSnapshot](self, "browserSelectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetReferenceAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)containsItemReference:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[_PXBrowserSummarySelectedItemsSnapshot browserSelectionSnapshot](self, "browserSelectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfAssetReference:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "assetReferenceAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)itemForItemReference:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[_PXBrowserSummarySelectedItemsSnapshot browserSelectionSnapshot](self, "browserSelectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfAssetReference:", v4);

  objc_msgSend(v5, "displayAssetAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (PXBrowserSelectionSnapshot)browserSelectionSnapshot
{
  return self->_browserSelectionSnapshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserSelectionSnapshot, 0);
}

@end
