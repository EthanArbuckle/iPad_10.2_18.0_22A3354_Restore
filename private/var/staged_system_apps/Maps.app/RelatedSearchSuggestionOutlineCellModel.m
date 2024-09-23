@implementation RelatedSearchSuggestionOutlineCellModel

- (RelatedSearchSuggestionOutlineCellModel)initWithRelatedSuggestion:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  RelatedSearchSuggestionOutlineCellModel *v9;
  RelatedSearchSuggestionOutlineCellModel *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RelatedSearchSuggestionOutlineCellModel;
  v9 = -[RelatedSearchSuggestionOutlineCellModel init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_suggestion, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (unint64_t)hash
{
  return (unint64_t)-[RelatedSearchSuggestion hash](self->_suggestion, "hash");
}

- (BOOL)isEqual:(id)a3
{
  RelatedSearchSuggestionOutlineCellModel *v4;
  RelatedSearchSuggestionOutlineCellModel *v5;
  uint64_t v6;
  RelatedSearchSuggestionOutlineCellModel *v7;
  RelatedSearchSuggestion *v8;
  RelatedSearchSuggestion *v9;
  id v10;
  id WeakRetained;
  unsigned __int8 v12;

  v4 = (RelatedSearchSuggestionOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = (RelatedSearchSuggestion *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionOutlineCellModel suggestion](v7, "suggestion"));
    v9 = v8;
    if (v8 == self->_suggestion || -[RelatedSearchSuggestion isEqual:](v8, "isEqual:"))
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionOutlineCellModel delegate](v7, "delegate"));
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (v10 == WeakRetained)
        v12 = 1;
      else
        v12 = objc_msgSend(v10, "isEqual:", WeakRetained);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  return (NSString *)CFSTR("RelatedSearchSuggestion");
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return (UICollectionViewCellRegistration *)+[RelatedSearchSuggestionOutlineCellRegistration sharedRegistration](RelatedSearchSuggestionOutlineCellRegistration, "sharedRegistration");
}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return !-[RelatedSearchSuggestionOutlineCellModel isEqual:](self, "isEqual:", a3);
}

- (RelatedSearchSuggestion)suggestion
{
  return self->_suggestion;
}

- (RelatedSearchSuggestionOutlineCellDelegate)delegate
{
  return (RelatedSearchSuggestionOutlineCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end
