@implementation VSStorefrontFilter

- (VSStorefrontFilter)init
{
  VSStorefrontFilter *v2;
  VSStorefrontFilter *v3;
  NSArray *storefronts;
  NSString *searchQuery;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VSStorefrontFilter;
  v2 = -[VSStorefrontFilter init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    storefronts = v2->_storefronts;
    v2->_storefronts = (NSArray *)MEMORY[0x24BDBD1A8];

    searchQuery = v3->_searchQuery;
    v3->_searchQuery = (NSString *)&stru_24FE1B848;

  }
  return v3;
}

+ (id)keyPathsForValuesAffectingFilteredStorefronts
{
  if (keyPathsForValuesAffectingFilteredStorefronts___vs_lazy_init_predicate != -1)
    dispatch_once(&keyPathsForValuesAffectingFilteredStorefronts___vs_lazy_init_predicate, &__block_literal_global_3);
  return (id)keyPathsForValuesAffectingFilteredStorefronts___vs_lazy_init_variable;
}

void __67__VSStorefrontFilter_keyPathsForValuesAffectingFilteredStorefronts__block_invoke()
{
  uint64_t v0;
  void *v1;

  __67__VSStorefrontFilter_keyPathsForValuesAffectingFilteredStorefronts__block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathsForValuesAffectingFilteredStorefronts___vs_lazy_init_variable;
  keyPathsForValuesAffectingFilteredStorefronts___vs_lazy_init_variable = v0;

}

id __67__VSStorefrontFilter_keyPathsForValuesAffectingFilteredStorefronts__block_invoke_2()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v0, "addObject:", CFSTR("searchQuery"));
  objc_msgSend(v0, "addObject:", CFSTR("storefronts"));
  v1 = (void *)objc_msgSend(v0, "copy");

  return v1;
}

- (void)setStorefronts:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSArray *v13;
  NSArray *storefronts;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD17C0];
  v5 = a3;
  objc_msgSend(v4, "sortDescriptorWithKey:ascending:", CFSTR("displayName"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  v10 = objc_msgSend(v9, "indexOfObjectPassingTest:", &__block_literal_global_13);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v10;
    objc_msgSend(v9, "objectAtIndex:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectAtIndex:", v11);
    objc_msgSend(v9, "addObject:", v12);

  }
  v13 = (NSArray *)objc_msgSend(v9, "copy");
  storefronts = self->_storefronts;
  self->_storefronts = v13;

}

uint64_t __37__VSStorefrontFilter_setStorefronts___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "identitifer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("__"));

  if ((_DWORD)v6)
    *a4 = 1;
  return v6;
}

- (NSArray)filteredStorefronts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[VSStorefrontFilter storefronts](self, "storefronts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSStorefrontFilter searchQuery](self, "searchQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1548], "expressionForKeyPath:", CFSTR("displayName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1548], "expressionForConstantValue:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14B8], "predicateWithLeftExpression:rightExpression:modifier:type:options:", v5, v6, 0, 99, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "filteredArrayUsingPredicate:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v8;
  }

  return (NSArray *)v3;
}

- (NSArray)storefronts
{
  return self->_storefronts;
}

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (void)setSearchQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_storefronts, 0);
}

@end
