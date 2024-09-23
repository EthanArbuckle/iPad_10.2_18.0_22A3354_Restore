@implementation PKTransactionSpotlightDebugDetailsViewController

- (PKTransactionSpotlightDebugDetailsViewController)initWithTransaction:(id)a3
{
  id v5;
  PKTransactionSpotlightDebugDetailsViewController *v6;
  PKTransactionSpotlightDebugDetailsViewController *v7;
  PKSearchService *v8;
  PKSearchService *searchService;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKTransactionSpotlightDebugDetailsViewController;
  v6 = -[PKTransactionSpotlightDebugDetailsViewController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transaction, a3);
    v8 = (PKSearchService *)objc_alloc_init(MEMORY[0x1E0D67610]);
    searchService = v7->_searchService;
    v7->_searchService = v8;

    v7->_inBridge = PKBridgeUsesDarkAppearance();
    -[PKTransactionSpotlightDebugDetailsViewController loadItemWithCompletion:](v7, "loadItemWithCompletion:", 0);
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKTransactionSpotlightDebugDetailsViewController;
  -[PKTransactionSpotlightDebugDetailsViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PKTransactionSpotlightDebugDetailsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentTransactionTitleValueLabelCellReuseIdentifier"));

}

- (id)_cellWithTitleText:(id)a3 valueText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  -[PKTransactionSpotlightDebugDetailsViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", CFSTR("PKPaymentTransactionTitleValueLabelCellReuseIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setSelectionStyle:", 0);
  objc_msgSend(v9, "keyLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNumberOfLines:", 0);
  objc_msgSend(v10, "setText:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v11);

  if (self->_inBridge)
  {
    PKBridgeTextColor();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v12);

  }
  objc_msgSend(v9, "valueLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v6);

  return v9;
}

- (void)loadItemWithCompletion:(id)a3
{
  id v4;
  PKSearchService *searchService;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  searchService = self->_searchService;
  -[PKPaymentTransaction identifier](self->_transaction, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__PKTransactionSpotlightDebugDetailsViewController_loadItemWithCompletion___block_invoke;
  v8[3] = &unk_1E3E73DB0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[PKSearchService indexedTransactionWithIdentifier:completion:](searchService, "indexedTransactionWithIdentifier:completion:", v6, v8);

}

void __75__PKTransactionSpotlightDebugDetailsViewController_loadItemWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__PKTransactionSpotlightDebugDetailsViewController_loadItemWithCompletion___block_invoke_2;
  v10[3] = &unk_1E3E622D8;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

uint64_t __75__PKTransactionSpotlightDebugDetailsViewController_loadItemWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  NSString *v21;
  SEL v22;
  uint64_t v23;
  void (*v24)(void *, SEL);
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t result;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1032) = 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1080), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1040), *(id *)(a1 + 48));
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1048);
  *(_QWORD *)(v3 + 1048) = v2;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 1064);
  *(_QWORD *)(v6 + 1064) = v5;

  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 1056);
  *(_QWORD *)(v9 + 1056) = v8;

  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 1072);
  *(_QWORD *)(v12 + 1072) = v11;

  v14 = *(void **)(a1 + 40);
  if (v14)
  {
    objc_msgSend(v14, "attributeSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    PKCoreSpotlightTransactionKeys();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v43 != v19)
            objc_enumerationMutation(v16);
          v21 = *(NSString **)(*((_QWORD *)&v42 + 1) + 8 * i);
          v22 = NSSelectorFromString(v21);
          v23 = objc_msgSend(v15, "methodForSelector:", v22);
          if (v22)
          {
            v24 = (void (*)(void *, SEL))v23;
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v24(v15, v22);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (v25)
              {
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "addObject:", v21);
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "setObject:forKey:", v25, v21);
              }

            }
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v18);
    }

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    PKCoreSpotlightTransactionCustomKeys();
    obj = (id)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v39;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v39 != v28)
            objc_enumerationMutation(obj);
          v30 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", v30, 1, 1, 0, 0);
          objc_msgSend(v15, "valueForCustomKey:", v31);
          v32 = objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            v33 = (void *)v32;
            v34 = v31;
          }
          else
          {
            v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", v30, 1, 1, 0, 1);

            objc_msgSend(v15, "valueForCustomKey:", v34);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v33)
              goto LABEL_23;
          }
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "addObject:", v30);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "setObject:forKey:", v33, v30);

LABEL_23:
        }
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v27);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "reloadData");

  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4)
    return CFSTR("Custom Attributes");
  else
    return CFSTR("Attributes");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  NSMutableArray **p_customAttributes;

  v6 = a3;
  if (self->_loading)
    goto LABEL_2;
  if (a4)
  {
    p_customAttributes = &self->_customAttributes;
LABEL_6:
    v7 = -[NSMutableArray count](*p_customAttributes, "count");
    goto LABEL_7;
  }
  p_customAttributes = &self->_attributes;
  if (-[NSMutableArray count](*p_customAttributes, "count"))
    goto LABEL_6;
LABEL_2:
  v7 = 1;
LABEL_7:

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  NSError *error;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  if (self->_loading)
  {
    v8 = CFSTR("Loading");
LABEL_3:
    -[PKTransactionSpotlightDebugDetailsViewController _cellWithTitleText:valueText:](self, "_cellWithTitleText:valueText:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  error = self->_error;
  if (error)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[NSError description](error, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Error: %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransactionSpotlightDebugDetailsViewController _cellWithTitleText:valueText:](self, "_cellWithTitleText:valueText:", v13, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  if (!self->_item)
  {
    v8 = CFSTR("No item in Spotlight");
    goto LABEL_3;
  }
  if (objc_msgSend(v7, "section"))
  {
    -[NSMutableArray objectAtIndex:](self->_customAttributes, "objectAtIndex:", objc_msgSend(v7, "row"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Passbook_"), &stru_1E3E7D690);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_customAttributesPerKey, "objectForKey:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransactionSpotlightDebugDetailsViewController _cellWithTitleText:valueText:](self, "_cellWithTitleText:valueText:", v15, v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_attributes, "objectAtIndex:", objc_msgSend(v7, "row"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_attributesPerKey, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransactionSpotlightDebugDetailsViewController _cellWithTitleText:valueText:](self, "_cellWithTitleText:valueText:", v14, v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_12:
  return v9;
}

- (void)spotlightObjectDescriptionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD);
  void *v8;
  _QWORD v9[4];
  void (**v10)(_QWORD);
  _QWORD aBlock[5];
  id v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __93__PKTransactionSpotlightDebugDetailsViewController_spotlightObjectDescriptionWithCompletion___block_invoke;
    aBlock[3] = &unk_1E3E61850;
    aBlock[4] = self;
    v12 = v4;
    v7 = (void (**)(_QWORD))_Block_copy(aBlock);
    v8 = v7;
    if (self->_loading || !self->_item)
    {
      v9[0] = v6;
      v9[1] = 3221225472;
      v9[2] = __93__PKTransactionSpotlightDebugDetailsViewController_spotlightObjectDescriptionWithCompletion___block_invoke_2;
      v9[3] = &unk_1E3E61590;
      v10 = v7;
      -[PKTransactionSpotlightDebugDetailsViewController loadItemWithCompletion:](self, "loadItemWithCompletion:", v9);

    }
    else
    {
      v7[2](v7);
    }

  }
}

void __93__PKTransactionSpotlightDebugDetailsViewController_spotlightObjectDescriptionWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingFormat:", CFSTR("\n%@"), v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __93__PKTransactionSpotlightDebugDetailsViewController_spotlightObjectDescriptionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_customAttributesPerKey, 0);
  objc_storeStrong((id *)&self->_customAttributes, 0);
  objc_storeStrong((id *)&self->_attributesPerKey, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_searchService, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
