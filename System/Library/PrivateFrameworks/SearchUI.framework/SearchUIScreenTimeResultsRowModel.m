@implementation SearchUIScreenTimeResultsRowModel

- (SearchUIScreenTimeResultsRowModel)initWithSection:(id)a3 result:(id)a4 itemIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  SearchUIScreenTimeResultsRowModel *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "results");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)SearchUIScreenTimeResultsRowModel;
  v12 = -[SearchUIRowModel initWithResults:itemIdentifier:](&v27, sel_initWithResults_itemIdentifier_, v11, v10);

  if (v12)
  {
    -[SearchUIScreenTimeResultsRowModel setOverrideIdentifyingResult:](v12, "setOverrideIdentifyingResult:", v9);
    -[SearchUIScreenTimeResultsRowModel identifyingResult](v12, "identifyingResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sectionBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[SearchUIScreenTimeResultsRowModel identifyingResult](v12, "identifyingResult");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "applicationBundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isEqualToString:", v17) & 1) != 0)
    {
      +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 15);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = v16;
    }
    v19 = v18;

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v19, 1, 0);
    objc_msgSend(v20, "localizedName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0CB3940];
    +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("BLOCKED_APP"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v21;
    if (!v21)
    {
      objc_msgSend(v8, "title");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "stringWithValidatedFormat:validFormatSpecifiers:error:", v23, CFSTR("%@"), 0, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIScreenTimeResultsRowModel setTitle:](v12, "setTitle:", v25);

    if (!v21)
  }

  return v12;
}

- (id)identifyingResult
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[SearchUIScreenTimeResultsRowModel overrideIdentifyingResult](self, "overrideIdentifyingResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SearchUIScreenTimeResultsRowModel;
    -[SearchUIRowModel identifyingResult](&v8, sel_identifyingResult);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (Class)cellViewClass
{
  return (Class)objc_opt_class();
}

- (Class)collectionViewCellClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isTappable
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchUIScreenTimeResultsRowModel;
  v4 = -[SearchUIRowModel copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[SearchUIScreenTimeResultsRowModel title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (SFSearchResult)overrideIdentifyingResult
{
  return self->_overrideIdentifyingResult;
}

- (void)setOverrideIdentifyingResult:(id)a3
{
  objc_storeStrong((id *)&self->_overrideIdentifyingResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideIdentifyingResult, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
