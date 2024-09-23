@implementation TUAutocompleteResultPartitioner

- (TUAutocompleteResultPartitioner)init
{
  TUAutocompleteResultPartitioner *v2;
  NSMutableArray *v3;
  NSMutableArray *normalResultsArray;
  NSMutableArray *v5;
  NSMutableArray *foundInMailResultsArray;
  NSMutableArray *v7;
  NSMutableArray *foundOnServersResultsArray;
  TUAutocompleteResultPartitioner *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TUAutocompleteResultPartitioner;
  v2 = -[TUAutocompleteResultPartitioner init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    normalResultsArray = v2->_normalResultsArray;
    v2->_normalResultsArray = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    foundInMailResultsArray = v2->_foundInMailResultsArray;
    v2->_foundInMailResultsArray = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    foundOnServersResultsArray = v2->_foundOnServersResultsArray;
    v2->_foundOnServersResultsArray = v7;

    v9 = v2;
  }

  return v2;
}

- (void)addResult:(id)a3
{
  TUProxyAutocompleteResult *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[TUProxyAutocompleteResult initWithAutocompleteResult:]([TUProxyAutocompleteResult alloc], "initWithAutocompleteResult:", v7);
  if (objc_msgSend((id)objc_opt_class(), "sourceTypeIsFoundInMail:", objc_msgSend(v7, "sourceType")))
  {
    -[TUAutocompleteResultPartitioner foundInMailResultsArray](self, "foundInMailResultsArray");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend((id)objc_opt_class(), "sourceTypeIsFoundOnServers:", objc_msgSend(v7, "sourceType")))
      -[TUAutocompleteResultPartitioner foundOnServersResultsArray](self, "foundOnServersResultsArray");
    else
      -[TUAutocompleteResultPartitioner normalResultsArray](self, "normalResultsArray");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  objc_msgSend(v5, "addObject:", v4);

}

+ (BOOL)sourceTypeIsFoundInMail:(unint64_t)a3
{
  return (a3 & 7) == 4;
}

+ (BOOL)sourceTypeIsFoundOnServers:(unint64_t)a3
{
  return a3 == 8;
}

- (TUSearchController)searchController
{
  return (TUSearchController *)objc_loadWeakRetained((id *)&self->_searchController);
}

- (void)setSearchController:(id)a3
{
  objc_storeWeak((id *)&self->_searchController, a3);
}

- (NSMutableArray)normalResultsArray
{
  return self->_normalResultsArray;
}

- (void)setNormalResultsArray:(id)a3
{
  objc_storeStrong((id *)&self->_normalResultsArray, a3);
}

- (NSMutableArray)foundInMailResultsArray
{
  return self->_foundInMailResultsArray;
}

- (void)setFoundInMailResultsArray:(id)a3
{
  objc_storeStrong((id *)&self->_foundInMailResultsArray, a3);
}

- (NSMutableArray)foundOnServersResultsArray
{
  return self->_foundOnServersResultsArray;
}

- (void)setFoundOnServersResultsArray:(id)a3
{
  objc_storeStrong((id *)&self->_foundOnServersResultsArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foundOnServersResultsArray, 0);
  objc_storeStrong((id *)&self->_foundInMailResultsArray, 0);
  objc_storeStrong((id *)&self->_normalResultsArray, 0);
  objc_destroyWeak((id *)&self->_searchController);
}

- (id)searchResults
{
  TUSearchResults *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  TUResultGroup *v7;
  void *v8;
  void *v9;
  void *v10;
  TUResultGroup *v11;
  void *v12;
  uint64_t v13;
  TUResultGroup *v14;
  void *v15;
  void *v16;
  void *v17;
  TUResultGroup *v18;

  v3 = objc_alloc_init(TUSearchResults);
  -[TUAutocompleteResultPartitioner searchController](self, "searchController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUSearchResults setSearchController:](v3, "setSearchController:", v4);

  -[TUAutocompleteResultPartitioner normalResultsArray](self, "normalResultsArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = [TUResultGroup alloc];
    TUBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CONTACTS"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUAutocompleteResultPartitioner normalResultsArray](self, "normalResultsArray");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TUResultGroup initWithTitle:results:](v7, "initWithTitle:results:", v9, v10);
    -[TUSearchResults addResultGroup:](v3, "addResultGroup:", v11);

  }
  -[TUAutocompleteResultPartitioner foundInMailResultsArray](self, "foundInMailResultsArray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v14 = [TUResultGroup alloc];
    TUBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("FOUND_IN_APPS"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUAutocompleteResultPartitioner foundInMailResultsArray](self, "foundInMailResultsArray");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[TUResultGroup initWithTitle:results:](v14, "initWithTitle:results:", v16, v17);
    -[TUSearchResults addResultGroup:](v3, "addResultGroup:", v18);

  }
  return v3;
}

@end
