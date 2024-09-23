@implementation PXSuggestionsDataSource

- (PXSuggestionsDataSource)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSuggestionsDataSource.m"), 14, CFSTR("%s is not available as initializer"), "-[PXSuggestionsDataSource init]");

  abort();
}

- (PXSuggestionsDataSource)initWithSuggestionsFetchResult:(id)a3
{
  id v5;
  PXSuggestionsDataSource *v6;
  PXSuggestionsDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSuggestionsDataSource;
  v6 = -[PXSuggestionsDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_suggestions, a3);

  return v7;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSuggestionsDataSource.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section == 0"));

  }
  return -[PXDisplaySuggestionFetchResult count](self->_suggestions, "count");
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t item;
  void *v10;
  void *v11;

  item = a3->item;
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98
    || item == 0x7FFFFFFFFFFFFFFFLL
    || a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSuggestionsDataSource.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsItem(indexPath)"));

    item = a3->item;
  }
  if (item >= -[PXDisplaySuggestionFetchResult count](self->_suggestions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSuggestionsDataSource.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.item < _suggestions.count"));

  }
  return (id)-[PXDisplaySuggestionFetchResult objectAtIndex:](self->_suggestions, "objectAtIndex:", a3->item);
}

- (PXDisplaySuggestionFetchResult)suggestions
{
  return self->_suggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end
