@implementation PKPaymentSetupFieldsModel

- (PKPaymentSetupFieldsModel)init
{
  PKPaymentSetupFieldsModel *v2;
  NSMutableArray *v3;
  NSMutableArray *paymentSetupFields;
  NSDictionary *v5;
  NSDictionary *footerFields;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupFieldsModel;
  v2 = -[PKPaymentSetupFieldsModel init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    paymentSetupFields = v2->_paymentSetupFields;
    v2->_paymentSetupFields = v3;

    v5 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    footerFields = v2->_footerFields;
    v2->_footerFields = v5;

  }
  return v2;
}

- (PKPaymentSetupFieldsModel)initWithPaymentSetupFields:(id)a3
{
  return -[PKPaymentSetupFieldsModel initWithPaymentSetupFields:footerFields:](self, "initWithPaymentSetupFields:footerFields:", a3, 0);
}

- (PKPaymentSetupFieldsModel)initWithPaymentSetupFields:(id)a3 footerFields:(id)a4
{
  id v6;
  id v7;
  PKPaymentSetupFieldsModel *v8;
  PKPaymentSetupFieldsModel *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[PKPaymentSetupFieldsModel init](self, "init");
  v9 = v8;
  if (v8)
    -[PKPaymentSetupFieldsModel replaceAllPaymentSetupFields:footerFields:](v8, "replaceAllPaymentSetupFields:footerFields:", v6, v7);

  return v9;
}

+ (id)defaultPaymentSetupProvisioningFields
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (PKShowFakePaymentSetupFields())
  {
    objc_msgSend(a1, "fakePaymentSetupProvisioningFields");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPaymentSetupField paymentSetupFieldWithIdentifier:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:", CFSTR("cardholderName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    +[PKPaymentSetupField paymentSetupFieldWithIdentifier:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:", CFSTR("primaryAccountNumber"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)fakePaymentSetupProvisioningFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:", CFSTR("cardholderName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:", CFSTR("primaryAccountNumber"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:", CFSTR("cardExpiration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v5);

  +[PKPaymentSetupField paymentSetupFieldWithIdentifier:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:", CFSTR("cardSecurityCode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v6);

  +[PKPaymentSetupField sampleCustomPaymentSetupFields](PKPaymentSetupField, "sampleCustomPaymentSetupFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v7);

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)replaceAllPaymentSetupFields:(id)a3
{
  -[PKPaymentSetupFieldsModel replaceAllPaymentSetupFields:footerFields:](self, "replaceAllPaymentSetupFields:footerFields:", a3, 0);
}

- (void)replaceAllPaymentSetupFields:(id)a3 footerFields:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  PKPaymentSetupFieldFooter *v14;
  PKPaymentSetupFieldFooter *footerField;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_footerFields, a4);
  -[PKPaymentSetupFieldsModel resetAllPaymentSetupFieldValues](self, "resetAllPaymentSetupFieldValues");
  -[NSMutableArray removeAllObjects](self->_paymentSetupFields, "removeAllObjects");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "isFieldTypeFooter", (_QWORD)v16))
        {
          objc_msgSend(v13, "footerFieldObject");
          v14 = (PKPaymentSetupFieldFooter *)objc_claimAutoreleasedReturnValue();
          footerField = self->_footerField;
          self->_footerField = v14;

        }
        else
        {
          -[NSMutableArray addObject:](self->_paymentSetupFields, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  -[PKPaymentSetupFieldsModel prefillDefaultValues](self, "prefillDefaultValues");
}

- (void)replaceAllPaymentSetupFieldsPreservingCurrentValues:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self, "paymentSetupFieldWithIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = objc_msgSend(v9, "fieldType");
          if (v12 == objc_msgSend(v11, "fieldType"))
          {
            objc_msgSend(v11, "currentValue");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              objc_msgSend(v11, "currentValue");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setCurrentValue:", v14);

              objc_msgSend(v9, "setSource:", objc_msgSend(v11, "source"));
              objc_msgSend(v11, "originalCameraCaptureValue");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setOriginalCameraCaptureValue:", v15);

              if (objc_msgSend(v9, "isFieldTypeText"))
              {
                objc_msgSend(v11, "displayFormat");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v16, "length");

                if (v17)
                {
                  objc_msgSend(v9, "textFieldObject");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "displayFormat");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "updateDisplayFormat:", v19);

                }
              }
            }
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }
  -[PKPaymentSetupFieldsModel replaceAllPaymentSetupFields:](self, "replaceAllPaymentSetupFields:", v4);

}

- (void)updateWithPaymentSetupFields:(id)a3
{
  -[PKPaymentSetupFieldsModel updateWithPaymentSetupFields:footerFields:](self, "updateWithPaymentSetupFields:footerFields:", a3, 0);
}

- (void)updateWithPaymentSetupFields:(id)a3 footerFields:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PKPaymentSetupFieldFooter *v17;
  PKPaymentSetupFieldFooter *footerField;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_footerFields, a4);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "identifier", (_QWORD)v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self, "paymentSetupFieldWithIdentifier:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v13, "rawConfigurationDictionary");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "updateWithConfiguration:", v16);

        }
        else if (objc_msgSend(v13, "isFieldTypeFooter"))
        {
          objc_msgSend(v13, "footerFieldObject");
          v17 = (PKPaymentSetupFieldFooter *)objc_claimAutoreleasedReturnValue();
          footerField = self->_footerField;
          self->_footerField = v17;

        }
        else
        {
          -[NSMutableArray addObject:](self->_paymentSetupFields, "addObject:", v13);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  -[PKPaymentSetupFieldsModel prefillDefaultValues](self, "prefillDefaultValues");
}

- (id)secondaryEntryFieldsModelWithPaymentSetupFields:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  PKPaymentSetupFieldsModel *v27;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self, "paymentSetupFieldWithIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "copy");

        if (v14)
        {
          objc_msgSend(v11, "rawConfigurationDictionary");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "updateWithConfiguration:", v15);

          objc_msgSend(v14, "setHidden:", objc_msgSend(v14, "isHidden") ^ 1);
          v16 = v5;
          v17 = v14;
        }
        else
        {
          v16 = v5;
          v17 = v11;
        }
        objc_msgSend(v16, "addObject:", v17);
        objc_msgSend(v6, "addObject:", v12);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v8);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[PKPaymentSetupFieldsModel paymentSetupFields](self, "paymentSetupFields");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v31 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        objc_msgSend(v23, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v6, "containsObject:", v24);

        if ((v25 & 1) == 0)
        {
          v26 = (void *)objc_msgSend(v23, "copy");
          objc_msgSend(v26, "setHidden:", 1);
          objc_msgSend(v5, "addObject:", v26);

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v20);
  }

  v27 = -[PKPaymentSetupFieldsModel initWithPaymentSetupFields:]([PKPaymentSetupFieldsModel alloc], "initWithPaymentSetupFields:", v5);
  -[PKPaymentSetupFieldsModel prefillDefaultValues](v27, "prefillDefaultValues");

  return v27;
}

- (void)unhideFieldsWithEnteredValues
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_paymentSetupFields;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "isHidden", (_QWORD)v9))
        {
          objc_msgSend(v7, "currentValue");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
            objc_msgSend(v7, "setHidden:", 0);
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)lockFields
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_paymentSetupFields;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setReadonly:", 1, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)paymentSetupFields
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_paymentSetupFields);
}

- (id)visiblePaymentSetupFields
{
  return (id)-[NSMutableArray pk_objectsPassingTest:](self->_paymentSetupFields, "pk_objectsPassingTest:", &__block_literal_global_43);
}

uint64_t __54__PKPaymentSetupFieldsModel_visiblePaymentSetupFields__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "isHidden") ^ 1;
  else
    v3 = 0;

  return v3;
}

- (id)paymentSetupFieldIdentifiers
{
  return (id)-[NSMutableArray valueForKey:](self->_paymentSetupFields, "valueForKey:", CFSTR("identifier"));
}

- (id)visibleSetupFieldIdentifiers
{
  return (id)-[NSMutableArray pk_arrayBySafelyApplyingBlock:](self->_paymentSetupFields, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_16);
}

id __57__PKPaymentSetupFieldsModel_visibleSetupFieldIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
    if ((objc_msgSend(v3, "isHidden") & 1) != 0)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(v3, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)readonlySetupFieldIdentifiers
{
  return (id)-[NSMutableArray pk_arrayBySafelyApplyingBlock:](self->_paymentSetupFields, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_18_0);
}

id __58__PKPaymentSetupFieldsModel_readonlySetupFieldIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
    if (objc_msgSend(v3, "isReadonly"))
    {
      objc_msgSend(v3, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)paymentSetupFieldAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_paymentSetupFields, "objectAtIndex:", a3);
}

- (unint64_t)numberOfPaymentSetupFields
{
  return -[NSMutableArray count](self->_paymentSetupFields, "count");
}

- (id)paymentSetupFieldWithIdentifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  PKPaymentSetupFieldFooter *v13;
  PKPaymentSetupFieldFooter *footerField;
  void *v15;
  int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_paymentSetupFields;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
      objc_msgSend(v10, "identifier", (_QWORD)v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v4);

      if ((v12 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v13 = v10;

    if (v13)
      goto LABEL_15;
  }
  else
  {
LABEL_9:

  }
  footerField = self->_footerField;
  if (footerField
    && (-[PKPaymentSetupField identifier](footerField, "identifier"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "isEqualToString:", v4),
        v15,
        v16))
  {
    v13 = self->_footerField;
  }
  else
  {
    v13 = 0;
  }
LABEL_15:

  return v13;
}

- (id)incompletePaymentSetupFields
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_paymentSetupFields;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "submissionStringMeetsAllRequirements", (_QWORD)v12) & 1) == 0)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)hasIncompletePaymentSetupFields
{
  void *v2;
  BOOL v3;

  -[PKPaymentSetupFieldsModel incompletePaymentSetupFields](self, "incompletePaymentSetupFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)submissionValuesForDestination:(id)a3
{
  id v4;
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = self->_paymentSetupFields;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v18 = 0;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[PKPaymentSetupFieldsModel _addField:result:destination:requiresSecureSubmission:](self, "_addField:result:destination:requiresSecureSubmission:", v13, v5, v4, 0);
        if (objc_msgSend(v13, "supportsAddressAutofill"))
        {
          v14 = objc_msgSend(v13, "source");
          switch(v14)
          {
            case 4:
              v9 = 1;
              break;
            case 3:
              v18 = 1;
              break;
            case 2:
              v10 = 1;
              break;
          }
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);

    if (((v18 | v10 & v9) & 1) != 0)
    {
      v15 = 3;
    }
    else if (v10 & 1 | (((v10 ^ 1 | v9) & 1) == 0))
    {
      if (((v10 ^ 1 | v9) & 1) != 0)
        goto LABEL_19;
      v15 = 2;
    }
    else
    {
      if ((v9 & 1) == 0)
        goto LABEL_19;
      v15 = 4;
    }
    PKPaymentSetupFieldSourceToString(v15);
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("addressSource"));
  }

LABEL_19:
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)footerFieldForIdentifier:(id)a3
{
  return -[NSDictionary objectForKey:](self->_footerFields, "objectForKey:", a3);
}

- (id)footerPaymentSetupField
{
  return self->_footerField;
}

- (BOOL)hasFooterPaymentSetupField
{
  void *v2;
  BOOL v3;

  -[PKPaymentSetupFieldsModel footerPaymentSetupField](self, "footerPaymentSetupField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)secureSubmissionValuesForDestination:(id)a3
{
  id v4;
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_paymentSetupFields;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[PKPaymentSetupFieldsModel _addField:result:destination:requiresSecureSubmission:](self, "_addField:result:destination:requiresSecureSubmission:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++), v5, v4, 1, (_QWORD)v13);
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_addField:(id)a3 result:(id)a4 destination:(id)a5 requiresSecureSubmission:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;

  v6 = a6;
  v30 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v30, "requiresSecureSubmission");
  v12 = objc_msgSend(v30, "submissionStringMeetsAllRequirements");
  v13 = v30;
  if (v12)
  {
    objc_msgSend(v30, "submissionDestination");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", v10);

    v13 = v30;
    if (v15)
    {
      if (((v11 ^ v6) & 1) == 0)
      {
        objc_msgSend(v30, "submissionKey");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "submissionString");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (v16 && v17)
          objc_msgSend(v9, "setObject:forKey:", v17, v16);

        v13 = v30;
      }
    }
  }
  objc_msgSend(v13, "pickerFieldObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "pickerType") == 2)
  {
    objc_msgSend(v19, "currentValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "nextLevelPicker");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      do
      {
        v22 = objc_msgSend(v21, "requiresSecureSubmission");
        if (objc_msgSend(v21, "submissionStringMeetsAllRequirements"))
        {
          objc_msgSend(v21, "submissionDestination");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", v10);

          if (v24)
          {
            if (((v22 ^ v6) & 1) == 0)
            {
              objc_msgSend(v21, "submissionKey");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "submissionString");
              v26 = objc_claimAutoreleasedReturnValue();
              v27 = (void *)v26;
              if (v25 && v26)
                objc_msgSend(v9, "setObject:forKey:", v26, v25);

            }
          }
        }
        objc_msgSend(v21, "currentValue");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "nextLevelPicker");
        v29 = objc_claimAutoreleasedReturnValue();

        v21 = (void *)v29;
      }
      while (v29);
    }
  }

}

- (void)resetAllPaymentSetupFieldValues
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_paymentSetupFields;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(v7, "setCurrentValue:", 0, (_QWORD)v8);
        objc_msgSend(v7, "setSource:", 0);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)prefillDefaultValues
{
  uint64_t v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  BOOL v37;
  char v38;
  int v39;
  id v40;
  id v41;
  void *v42;
  BOOL v43;
  char v44;
  int v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  BOOL v50;
  char v51;
  int v52;
  id v53;
  id v54;
  void *v55;
  BOOL v56;
  char v57;
  id v58;
  id v59;
  void *v60;
  char v61;
  id v62;
  id v63;
  void *v64;
  char v65;
  id v66;
  id v67;
  void *v68;
  char v69;
  id v70;
  id v71;
  void *v72;
  char v73;
  id v74;
  id v75;
  char v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  NSObject *v84;
  void *v85;
  void *v86;
  const char *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  int v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  int v98;
  void *v99;
  int v100;
  uint64_t v101;
  void *v102;
  void *v103;
  int v104;
  void *v105;
  int v106;
  int v107;
  void *v108;
  int v109;
  void *v110;
  int v111;
  void *v112;
  int v113;
  void *v114;
  int v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t j;
  void *v128;
  void *v129;
  PKPaymentSetupFieldPickerItem *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  NSObject *v135;
  NSObject *v136;
  int v137;
  int v138;
  uint64_t *v139;
  void *v140;
  void *v141;
  void *v142;
  uint64_t *v143;
  void *v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  int v155;
  void *v156;
  void *v157;
  void *v158;
  int v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  id v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  uint64_t v173;
  NSObject *v174;
  const char *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  id v186;
  void *v187;
  void *v188;
  id v189;
  id v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  uint64_t v198;
  void *v199;
  void *v200;
  id v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t k;
  void *v206;
  void *v207;
  PKPaymentSetupFieldPickerItem *v208;
  void *v209;
  void *v210;
  void *v211;
  uint64_t v212;
  NSObject *v213;
  const char *v214;
  void *v215;
  void *v216;
  _BOOL4 v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  NSObject *v223;
  NSObject *v224;
  uint64_t v225;
  uint64_t v226;
  void *v227;
  uint64_t v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  id v233;
  id v234;
  void *v235;
  int v236;
  NSObject *v237;
  id v238;
  id v239;
  void *v240;
  int v241;
  id v242;
  id v243;
  void *v244;
  int v245;
  NSObject *v246;
  NSObject *v247;
  int v248;
  NSObject *v249;
  NSObject *v250;
  int v251;
  NSObject *v252;
  NSObject *v253;
  int v254;
  NSObject *v255;
  NSObject *v256;
  char v257;
  uint64_t v258;
  NSObject *v259;
  NSObject *v260;
  NSObject *v261;
  const char *v262;
  NSObject *v263;
  void *v264;
  void *v265;
  NSObject *v266;
  void *v267;
  void *v268;
  NSObject *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  id v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  int v287;
  void *v288;
  id v289;
  void *v290;
  char v291;
  void *v292;
  void *v293;
  void *v294;
  id v295;
  void *v296;
  char v297;
  void *v298;
  void *v299;
  void *v300;
  NSObject *v301;
  id v302;
  id v303;
  char v304;
  NSObject *v305;
  id v306;
  NSObject *v307;
  void *v308;
  id obj;
  id obja;
  NSMutableArray *v311;
  void *v312;
  void *v313;
  uint64_t v314;
  void *v315;
  uint64_t v316;
  uint64_t v317;
  void *v318;
  NSObject *v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  __int128 v331;
  _QWORD v332[4];
  id v333;
  uint8_t buf[16];
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  _BYTE v343[128];
  _BYTE v344[128];
  _BYTE v345[128];
  _BYTE v346[128];
  _QWORD v347[7];
  _BYTE v348[128];
  uint64_t v349;

  v349 = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableArray count](self->_paymentSetupFields, "count");
  if (!v3)
    return;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v3);
  v339 = 0u;
  v340 = 0u;
  v341 = 0u;
  v342 = 0u;
  v5 = self->_paymentSetupFields;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v339, v348, 16);
  if (!v6)
    goto LABEL_338;
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v340;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v340 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v339 + 1) + 8 * i);
      if ((objc_msgSend(v11, "isFieldTypeFooter") & 1) == 0)
      {
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v11, v12);

        if (v8)
        {
          v8 = 1;
          continue;
        }
        if (objc_msgSend(v11, "isFieldTypeDate"))
        {
          objc_msgSend(v11, "dateFieldObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "defaultDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
        if (objc_msgSend(v11, "isFieldTypePicker"))
        {
          objc_msgSend(v11, "pickerFieldObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "defaultPickerItem");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
          v15 = v14;

        }
        else
        {
          objc_msgSend(v11, "defaultValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v13;
        }

        v8 = v15 == 0;
        continue;
      }
    }
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v339, v348, 16);
  }
  while (v7);

  if (!v8)
    goto LABEL_339;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0C966D0];
  v347[0] = v16;
  v347[1] = v17;
  v18 = *MEMORY[0x1E0C967F0];
  v347[2] = *MEMORY[0x1E0C966C0];
  v347[3] = v18;
  v19 = *MEMORY[0x1E0C96670];
  v347[4] = *MEMORY[0x1E0C967C0];
  v347[5] = v19;
  v347[6] = *MEMORY[0x1E0C966A8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v347, 7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  PKMeContactWithKeysToFetch(v20);
  v285 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", CFSTR("firstName"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("lastName"));
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("email"));
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  v276 = v21;
  objc_msgSend(v21, "defaultValue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    goto LABEL_21;
  objc_msgSend(v282, "defaultValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    if (v21 && objc_msgSend(v21, "populateFromMeCard"))
    {
      objc_msgSend(v285, "givenName");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "stringByApplyingTransform:reverse:", *MEMORY[0x1E0C99880], 0);
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "setDefaultValue:", v79);
      objc_msgSend(v21, "currentValue");
      v80 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v80)
        objc_msgSend(v21, "setCurrentValue:", v79);

    }
    if (v282 && objc_msgSend(v282, "populateFromMeCard"))
    {
      objc_msgSend(v285, "familyName");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "stringByApplyingTransform:reverse:", *MEMORY[0x1E0C99880], 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v282, "setDefaultValue:", v22);
      objc_msgSend(v282, "currentValue");
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v82)
        objc_msgSend(v282, "setCurrentValue:", v22);
LABEL_21:

    }
  }
  v308 = v4;
  if (v286)
  {
    objc_msgSend(v286, "defaultValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      goto LABEL_156;
    if (objc_msgSend(v286, "populateFromMeCard"))
    {
      objc_msgSend(v285, "emailAddresses");
      v335 = 0u;
      v336 = 0u;
      v337 = 0u;
      v338 = 0u;
      v25 = (id)objc_claimAutoreleasedReturnValue();
      v302 = v25;
      v317 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v335, v346, 16);
      if (!v317)
      {
        v280 = 0;
        v295 = 0;
        v289 = 0;
        v306 = 0;
        v26 = 0;
        goto LABEL_135;
      }
      v280 = 0;
      v295 = 0;
      v289 = 0;
      v306 = 0;
      v26 = 0;
      v314 = *(_QWORD *)v336;
      v27 = (void *)*MEMORY[0x1E0C96FF0];
      v28 = (void *)*MEMORY[0x1E0C96FF8];
      v300 = (void *)*MEMORY[0x1E0C97000];
      v283 = (void *)*MEMORY[0x1E0C97060];
      v311 = v5;
      v312 = (void *)*MEMORY[0x1E0C96FF0];
      v293 = (void *)*MEMORY[0x1E0C97070];
      while (1)
      {
        v29 = 0;
        do
        {
          v30 = v28;
          if (*(_QWORD *)v336 != v314)
            objc_enumerationMutation(v25);
          v31 = *(void **)(*((_QWORD *)&v335 + 1) + 8 * v29);
          objc_msgSend(v31, "label");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "value");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v32;
          v35 = v27;
          v36 = v35;
          if (v34 == v35)
          {

            v28 = v30;
LABEL_42:
            if (objc_msgSend(v26, "length"))
            {
              v5 = v311;
              v27 = v312;
              goto LABEL_98;
            }
            v46 = v26;
            v26 = v33;
            v27 = v312;
LABEL_90:
            v5 = v311;

            goto LABEL_98;
          }
          if (v27)
            v37 = v34 == 0;
          else
            v37 = 1;
          v38 = !v37;
          v28 = v30;
          if (v37)
          {

          }
          else
          {
            v39 = objc_msgSend(v34, "isEqualToString:", v35);

            if (v39)
              goto LABEL_42;
          }
          obj = v26;
          v40 = v34;
          v41 = v30;
          v42 = v41;
          if (v40 == v41)
          {

LABEL_57:
            v46 = v306;
            if (!objc_msgSend(v306, "length"))
            {
              v306 = v33;
              goto LABEL_88;
            }
            goto LABEL_95;
          }
          if (v30)
            v43 = v34 == 0;
          else
            v43 = 1;
          v44 = !v43;
          v304 = v44;
          if (v43)
          {

          }
          else
          {
            v45 = objc_msgSend(v40, "isEqualToString:", v41);

            if (v45)
              goto LABEL_57;
          }
          v47 = v40;
          v48 = v300;
          v49 = v48;
          if (v47 == v48)
          {

LABEL_71:
            v46 = v295;
            if (!objc_msgSend(v295, "length"))
            {
              v295 = v33;
              goto LABEL_87;
            }
            goto LABEL_94;
          }
          if (v300)
            v50 = v34 == 0;
          else
            v50 = 1;
          v51 = !v50;
          v297 = v51;
          if (v50)
          {

          }
          else
          {
            v52 = objc_msgSend(v47, "isEqualToString:", v48);

            if (v52)
              goto LABEL_71;
          }
          v53 = v47;
          v54 = v293;
          v55 = v54;
          if (v53 == v54)
          {

LABEL_85:
            v46 = v289;
            if (!objc_msgSend(v289, "length"))
            {
              v289 = v33;
LABEL_87:
              v25 = v302;
LABEL_88:
              v26 = obj;
              v27 = v312;
LABEL_89:
              v28 = v30;
              goto LABEL_90;
            }
LABEL_94:
            v25 = v302;
LABEL_95:
            v26 = obj;
            v27 = v312;
LABEL_96:
            v28 = v30;
            goto LABEL_97;
          }
          if (v293)
            v56 = v34 == 0;
          else
            v56 = 1;
          v57 = !v56;
          v291 = v57;
          if (v56)
          {

          }
          else
          {
            v287 = objc_msgSend(v53, "isEqualToString:", v54);

            if (v287)
              goto LABEL_85;
          }
          v58 = v53;
          v59 = v36;
          v60 = v59;
          if ((v38 & 1) != 0)
          {
            v61 = objc_msgSend(v58, "isEqualToString:", v59);

            if ((v61 & 1) != 0)
              goto LABEL_94;
          }
          else
          {

          }
          v62 = v58;
          v63 = v42;
          v64 = v63;
          v27 = v312;
          if ((v304 & 1) != 0)
          {
            v65 = objc_msgSend(v62, "isEqualToString:", v63);

            if ((v65 & 1) != 0)
            {
              v25 = v302;
              v26 = obj;
              goto LABEL_96;
            }
          }
          else
          {

          }
          v66 = v62;
          v67 = v49;
          v68 = v67;
          if ((v297 & 1) != 0)
          {
            v69 = objc_msgSend(v66, "isEqualToString:", v67);

            v26 = obj;
            if ((v69 & 1) != 0)
              goto LABEL_117;
          }
          else
          {

            v26 = obj;
          }
          v70 = v66;
          v71 = v55;
          v72 = v71;
          if ((v291 & 1) != 0)
          {
            v73 = objc_msgSend(v70, "isEqualToString:", v71);

            if ((v73 & 1) != 0)
              goto LABEL_117;
          }
          else
          {

          }
          v74 = v70;
          v75 = v283;
          v46 = v75;
          if (v74 == v75)
          {

            v25 = v302;
            goto LABEL_89;
          }
          if (v283 && v34)
          {
            v76 = objc_msgSend(v74, "isEqualToString:", v75);

            if ((v76 & 1) != 0)
            {
LABEL_117:
              v25 = v302;
              goto LABEL_96;
            }
          }
          else
          {

          }
          v46 = v280;
          v28 = v30;
          if (!objc_msgSend(v280, "length"))
          {
            v280 = v33;
            v25 = v302;
            goto LABEL_90;
          }
          v25 = v302;
LABEL_97:
          v5 = v311;
LABEL_98:

          ++v29;
        }
        while (v317 != v29);
        v77 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v335, v346, 16);
        v317 = v77;
        if (!v77)
        {
LABEL_135:

          if (!objc_msgSend(v26, "length"))
          {
            v4 = v308;
            v85 = v289;
            if (objc_msgSend(v306, "length"))
            {
              v83 = v306;
              PKLogFacilityTypeGetObject(6uLL);
              v84 = objc_claimAutoreleasedReturnValue();
              v86 = v295;
              if (!os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
                goto LABEL_152;
              *(_WORD *)buf = 0;
              v87 = "Using me card home email prefill";
            }
            else
            {
              v86 = v295;
              if (objc_msgSend(v295, "length"))
              {
                v83 = v295;
                PKLogFacilityTypeGetObject(6uLL);
                v84 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_152;
                *(_WORD *)buf = 0;
                v87 = "Using me card other email prefill";
              }
              else if (objc_msgSend(v280, "length"))
              {
                v83 = v280;
                PKLogFacilityTypeGetObject(6uLL);
                v84 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_152;
                *(_WORD *)buf = 0;
                v87 = "Using me card other custom prefill";
              }
              else
              {
                if (!objc_msgSend(v289, "length"))
                {
                  v83 = 0;
                  goto LABEL_153;
                }
                v83 = v289;
                PKLogFacilityTypeGetObject(6uLL);
                v84 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_152;
                *(_WORD *)buf = 0;
                v87 = "Using me card other work prefill";
              }
            }
            _os_log_impl(&dword_18FC92000, v84, OS_LOG_TYPE_DEFAULT, v87, buf, 2u);
            goto LABEL_152;
          }
          v83 = v26;
          PKLogFacilityTypeGetObject(6uLL);
          v84 = objc_claimAutoreleasedReturnValue();
          v4 = v308;
          v85 = v289;
          if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18FC92000, v84, OS_LOG_TYPE_DEFAULT, "Using me card iCloud email prefill", buf, 2u);
          }
          v86 = v295;
LABEL_152:

LABEL_153:
          objc_msgSend(v286, "setDefaultValue:", v83);
          objc_msgSend(v286, "currentValue");
          v88 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v88)
            objc_msgSend(v286, "setCurrentValue:", v83);

          v24 = v302;
LABEL_156:

          break;
        }
      }
    }
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("cardholderName"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = v89;
  if (v89)
  {
    objc_msgSend(v89, "defaultValue");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    if (v91)
      goto LABEL_164;
    if (objc_msgSend(v90, "populateFromMeCard"))
    {
      objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v285, 0);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      PKCurrentRegion();
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = objc_msgSend(v92, "isEqual:", CFSTR("JP"));

      if (v93 && (objc_msgSend(v91, "canBeConvertedToEncoding:", 5) & 1) == 0)
      {

        v91 = 0;
      }
      objc_msgSend(v90, "setDefaultValue:", v91);
LABEL_164:

    }
  }
  PKHomeAddressFromContact(v285);
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("street1"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("street2"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("addressLine1"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("addressLine2"));
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("city"));
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("postalCode"));
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("subLocality"));
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("administrativeArea"));
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("state"));
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("countryCode"));
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "defaultValue");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v278 = v94;
  if (v97)
    v98 = 0;
  else
    v98 = objc_msgSend(v94, "populateFromMeCard");

  objc_msgSend(v95, "defaultValue");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  if (v99)
    v100 = 0;
  else
    v100 = objc_msgSend(v95, "populateFromMeCard");

  objc_msgSend(v96, "defaultValue");
  v101 = objc_claimAutoreleasedReturnValue();
  v102 = v96;
  v103 = (void *)v101;
  v288 = v102;
  if (v101)
    v104 = 0;
  else
    v104 = objc_msgSend(v102, "populateFromMeCard");
  v277 = v95;

  objc_msgSend(v294, "defaultValue");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  if (v105)
    v106 = 0;
  else
    v106 = objc_msgSend(v294, "populateFromMeCard");
  v274 = v90;

  if ((v98 & v100 & 1) != 0)
    v107 = 1;
  else
    v107 = v104 & v106;
  objc_msgSend(v296, "defaultValue");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  if (v108)
    v109 = 0;
  else
    v109 = objc_msgSend(v296, "populateFromMeCard");

  objc_msgSend(v292, "defaultValue");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  if (v110)
    v111 = 0;
  else
    v111 = objc_msgSend(v292, "populateFromMeCard");

  objc_msgSend(v290, "defaultValue");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  if (v112)
    v113 = 0;
  else
    v113 = objc_msgSend(v290, "populateFromMeCard");

  objc_msgSend(v298, "defaultValue");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  if (v114)
    v115 = 0;
  else
    v115 = objc_msgSend(v298, "populateFromMeCard");

  objc_msgSend(v299, "defaultValue");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  if (v116)
  {
LABEL_193:

    v117 = v288;
  }
  else
  {
    v137 = objc_msgSend(v299, "populateFromMeCard");
    v138 = v107 & v109 & v111;
    v117 = v288;
    if (v138 == 1 && v137)
    {
      v139 = (uint64_t *)MEMORY[0x1E0C99880];
      if (v278 || v277 || v288 || v294)
      {
        objc_msgSend(v281, "street");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "componentsSeparatedByString:", CFSTR("\n"));
        v141 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v141, "firstObject");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        v143 = v139;
        v144 = v142;
        v145 = *v143;
        objc_msgSend(v142, "stringByApplyingTransform:reverse:", *v143, 0);
        v146 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v278, "setDefaultValue:", v146);
        objc_msgSend(v278, "currentValue");
        v147 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v147)
          objc_msgSend(v278, "setCurrentValue:", v146);
        objc_msgSend(v288, "setDefaultValue:", v146);
        objc_msgSend(v288, "currentValue");
        v148 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v148)
          objc_msgSend(v288, "setCurrentValue:", v146);
        if ((unint64_t)objc_msgSend(v141, "count") >= 2)
        {
          objc_msgSend(v141, "objectAtIndex:", 1);
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v149, "stringByApplyingTransform:reverse:", v145, 0);
          v150 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v277, "setDefaultValue:", v150);
          objc_msgSend(v277, "currentValue");
          v151 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v151)
            objc_msgSend(v277, "setCurrentValue:", v150);
          objc_msgSend(v294, "setDefaultValue:", v150);
          objc_msgSend(v294, "currentValue");
          v152 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v152)
            objc_msgSend(v294, "setCurrentValue:", v150);

        }
        v117 = v288;
        v139 = (uint64_t *)MEMORY[0x1E0C99880];
      }
      if (v292)
      {
        objc_msgSend(v281, "postalCode");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v292, "setDefaultValue:", v153);
        objc_msgSend(v292, "currentValue");
        v154 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v154)
          objc_msgSend(v292, "setCurrentValue:", v153);

        v117 = v288;
      }
      if (v290)
        v155 = v113;
      else
        v155 = 0;
      if (v155 == 1)
      {
        objc_msgSend(v281, "subLocality");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "stringByApplyingTransform:reverse:", *v139, 0);
        v157 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v290, "setDefaultValue:", v157);
        objc_msgSend(v290, "currentValue");
        v158 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v158)
          objc_msgSend(v290, "setDefaultValue:", v157);

      }
      if (v298)
        v159 = v115;
      else
        v159 = 0;
      if (v159 == 1)
      {
        objc_msgSend(v281, "subAdministrativeArea");
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v160, "stringByApplyingTransform:reverse:", *v139, 0);
        v161 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v298, "setDefaultValue:", v161);
        objc_msgSend(v298, "currentValue");
        v162 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v162)
          objc_msgSend(v298, "setCurrentValue:", v161);

      }
      if (v299)
      {
        objc_msgSend(v281, "state");
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v163, "stringByApplyingTransform:reverse:", *v139, 0);
        v164 = (void *)objc_claimAutoreleasedReturnValue();

        if (v164)
        {
          if (objc_msgSend(v299, "isFieldTypePicker"))
          {
            v165 = v299;
            objc_msgSend(v165, "pickerItems");
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            v332[0] = MEMORY[0x1E0C809B0];
            v332[1] = 3221225472;
            v332[2] = __49__PKPaymentSetupFieldsModel_prefillDefaultValues__block_invoke;
            v332[3] = &unk_1E2AC1610;
            v333 = v164;
            objc_msgSend(v166, "pk_firstObjectPassingTest:", v332);
            v167 = (void *)objc_claimAutoreleasedReturnValue();

            if (v167)
            {
              objc_msgSend(v165, "currentValue");
              v168 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v168)
                objc_msgSend(v165, "setCurrentValue:", v167);
            }

            v117 = v288;
          }
          else
          {
            objc_msgSend(v299, "setDefaultValue:", v164);
            objc_msgSend(v299, "currentValue");
            v177 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v177)
              objc_msgSend(v299, "setCurrentValue:", v164);
          }
        }

      }
      if (v296)
      {
        objc_msgSend(v281, "city");
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v178, "stringByApplyingTransform:reverse:", *v139, 0);
        v116 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v296, "setDefaultValue:", v116);
        objc_msgSend(v296, "currentValue");
        v179 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v179)
          objc_msgSend(v296, "setCurrentValue:", v116);
        goto LABEL_193;
      }
    }
  }
  v118 = v279;
  if (!v279 || objc_msgSend(v279, "fieldType") != 5)
    goto LABEL_289;
  objc_msgSend(v279, "pickerItems");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = objc_msgSend(v119, "count");

  if (!v120)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "ISOCountryCodes");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v121, "count"))
    {
      v122 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v121, "count"));
      v328 = 0u;
      v329 = 0u;
      v330 = 0u;
      v331 = 0u;
      v123 = v121;
      v124 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v328, v345, 16);
      if (v124)
      {
        v125 = v124;
        v126 = *(_QWORD *)v329;
        do
        {
          for (j = 0; j != v125; ++j)
          {
            if (*(_QWORD *)v329 != v126)
              objc_enumerationMutation(v123);
            v128 = *(void **)(*((_QWORD *)&v328 + 1) + 8 * j);
            PKLocalizedStringForCountryCode(v5, v128);
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v129, "length"))
            {
              v130 = -[PKPaymentSetupFieldPickerItem initWithName:value:]([PKPaymentSetupFieldPickerItem alloc], "initWithName:value:", v129, v128);
              objc_msgSend(v122, "safelyAddObject:", v130);

            }
          }
          v125 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v328, v345, 16);
        }
        while (v125);
      }

      objc_msgSend(v122, "sortUsingComparator:", &__block_literal_global_29);
      v131 = (void *)objc_msgSend(v122, "copy");
      objc_msgSend(v279, "setPickerItems:", v131);

      v118 = v279;
      v4 = v308;
      v117 = v288;
    }

  }
  objc_msgSend(v118, "defaultValue");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "currentValue");
  v133 = (void *)objc_claimAutoreleasedReturnValue();

  if (v133)
    goto LABEL_288;
  if (v132)
  {
    objc_msgSend(v118, "pickerItems");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPaymentSetupFieldPicker pickerItemMatchingValue:pickerItems:](PKPaymentSetupFieldPicker, "pickerItemMatchingValue:pickerItems:", v132, v134);
    v135 = objc_claimAutoreleasedReturnValue();

    if (v135)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v136 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v136, OS_LOG_TYPE_DEFAULT, "Using server given default value for country code field", buf, 2u);
      }

    }
    v118 = v279;
  }
  else
  {
    v135 = 0;
  }
  if (!objc_msgSend(v118, "populateFromMeCard"))
    goto LABEL_283;
  objc_msgSend(v281, "ISOCountryCode");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "uppercaseString");
  v170 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray regionCode](v5, "regionCode");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  if (v135
    || !v170
    || (objc_msgSend(v279, "pickerItems"),
        v172 = (void *)objc_claimAutoreleasedReturnValue(),
        +[PKPaymentSetupFieldPicker pickerItemMatchingValue:pickerItems:](PKPaymentSetupFieldPicker, "pickerItemMatchingValue:pickerItems:", v170, v172), v173 = objc_claimAutoreleasedReturnValue(), v172, !v173))
  {
    if (v135 || !v171)
    {
      if (v135)
        goto LABEL_282;
    }
    else
    {
      objc_msgSend(v279, "pickerItems");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPaymentSetupFieldPicker pickerItemMatchingValue:pickerItems:](PKPaymentSetupFieldPicker, "pickerItemMatchingValue:pickerItems:", v171, v176);
      v173 = objc_claimAutoreleasedReturnValue();

      if (v173)
      {
        PKLogFacilityTypeGetObject(6uLL);
        v174 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v174, OS_LOG_TYPE_DEFAULT))
          goto LABEL_281;
        *(_WORD *)buf = 0;
        v175 = "Using device region as default countryCode value";
        goto LABEL_280;
      }
    }
    objc_msgSend(v279, "pickerItems");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPaymentSetupFieldPicker pickerItemMatchingValue:pickerItems:](PKPaymentSetupFieldPicker, "pickerItemMatchingValue:pickerItems:", CFSTR("US"), v180);
    v173 = objc_claimAutoreleasedReturnValue();

    if (!v173)
    {
      v135 = 0;
      goto LABEL_282;
    }
    PKLogFacilityTypeGetObject(6uLL);
    v174 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v174, OS_LOG_TYPE_DEFAULT))
      goto LABEL_281;
    *(_WORD *)buf = 0;
    v175 = "No device region using US as default";
LABEL_280:
    _os_log_impl(&dword_18FC92000, v174, OS_LOG_TYPE_DEFAULT, v175, buf, 2u);
    goto LABEL_281;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v174 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v174, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v175 = "Using users meCard region as default countryCode value";
    goto LABEL_280;
  }
LABEL_281:

  v135 = v173;
LABEL_282:

  v118 = v279;
LABEL_283:
  if (v135)
  {
    objc_msgSend(v118, "setCurrentValue:", v135);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v135 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v135, OS_LOG_TYPE_DEFAULT, "Could not find a currentValue for the countryCode picker", buf, 2u);
    }
  }

  v117 = v288;
LABEL_288:

LABEL_289:
  objc_msgSend(v4, "objectForKey:", CFSTR("dateOfBirth"));
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = v181;
  v183 = v277;
  if (v181)
  {
    objc_msgSend(v181, "defaultDate");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    if (v184)
      goto LABEL_300;
    if (objc_msgSend(v182, "populateFromMeCard"))
    {
      v185 = v182;
      objc_msgSend(v285, "birthday");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      v186 = objc_alloc(MEMORY[0x1E0C99D48]);
      v187 = (void *)objc_msgSend(v186, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
      if (v184
        && objc_msgSend(v184, "year") != 0x7FFFFFFFFFFFFFFFLL
        && (objc_msgSend(v187, "dateFromComponents:", v184), (v188 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v189 = v188;

        objc_msgSend(v185, "setCurrentValue:", v189);
      }
      else
      {
        v190 = objc_alloc_init(MEMORY[0x1E0C99D78]);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v190, "setYear:", objc_msgSend(v187, "component:fromDate:", 4, v191));

        objc_msgSend(v190, "setMonth:", 1);
        objc_msgSend(v190, "setDay:", 1);
        objc_msgSend(v187, "dateFromComponents:", v190);
        v189 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v185, "currentValue");
      v192 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v192)
        objc_msgSend(v185, "setDefaultDate:", v189);

      v117 = v288;
      v118 = v279;
      v182 = v185;
LABEL_300:

    }
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("citizenship"));
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v275 = v193;
  if (v193)
  {
    v194 = v193;
    objc_msgSend(v193, "defaultValue");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    if (v195)
      goto LABEL_333;
    if (objc_msgSend(v194, "populateFromMeCard"))
    {
      objc_msgSend(v194, "defaultValue");
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray regionCode](v5, "regionCode");
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v194, "pickerItems");
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      v198 = objc_msgSend(v197, "count");

      if (!v198)
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "ISOCountryCodes");
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v199, "count"))
        {
          v318 = v196;
          v267 = v182;
          v200 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v199, "count"));
          v324 = 0u;
          v325 = 0u;
          v326 = 0u;
          v327 = 0u;
          v315 = v199;
          v201 = v199;
          v202 = objc_msgSend(v201, "countByEnumeratingWithState:objects:count:", &v324, v344, 16);
          if (v202)
          {
            v203 = v202;
            v204 = *(_QWORD *)v325;
            do
            {
              for (k = 0; k != v203; ++k)
              {
                if (*(_QWORD *)v325 != v204)
                  objc_enumerationMutation(v201);
                v206 = *(void **)(*((_QWORD *)&v324 + 1) + 8 * k);
                PKLocalizedStringForCountryCode(v5, v206);
                v207 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v207, "length"))
                {
                  v208 = -[PKPaymentSetupFieldPickerItem initWithName:value:]([PKPaymentSetupFieldPickerItem alloc], "initWithName:value:", v207, v206);
                  objc_msgSend(v200, "safelyAddObject:", v208);

                }
              }
              v203 = objc_msgSend(v201, "countByEnumeratingWithState:objects:count:", &v324, v344, 16);
            }
            while (v203);
          }

          objc_msgSend(v200, "sortUsingComparator:", &__block_literal_global_37);
          v209 = (void *)objc_msgSend(v200, "copy");
          v194 = v275;
          objc_msgSend(v275, "setPickerItems:", v209);

          v4 = v308;
          v183 = v277;
          v199 = v315;
          v196 = v318;
        }

      }
      objc_msgSend(v194, "currentValue", v267);
      v210 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v210)
      {
        if (!v195
          || (objc_msgSend(v194, "pickerItems"),
              v211 = (void *)objc_claimAutoreleasedReturnValue(),
              +[PKPaymentSetupFieldPicker pickerItemMatchingValue:pickerItems:](PKPaymentSetupFieldPicker, "pickerItemMatchingValue:pickerItems:", v195, v211), v212 = objc_claimAutoreleasedReturnValue(), v211, !v212))
        {
          if (v196
            && (objc_msgSend(v194, "pickerItems"),
                v215 = (void *)objc_claimAutoreleasedReturnValue(),
                +[PKPaymentSetupFieldPicker pickerItemMatchingValue:pickerItems:](PKPaymentSetupFieldPicker, "pickerItemMatchingValue:pickerItems:", v196, v215), v212 = objc_claimAutoreleasedReturnValue(), v215, v212))
          {
            PKLogFacilityTypeGetObject(6uLL);
            v213 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v213, OS_LOG_TYPE_DEFAULT))
              goto LABEL_330;
            *(_WORD *)buf = 0;
            v214 = "Using user region code as default citizenship value";
          }
          else
          {
            objc_msgSend(v194, "pickerItems");
            v216 = (void *)objc_claimAutoreleasedReturnValue();
            +[PKPaymentSetupFieldPicker pickerItemMatchingValue:pickerItems:](PKPaymentSetupFieldPicker, "pickerItemMatchingValue:pickerItems:", CFSTR("US"), v216);
            v212 = objc_claimAutoreleasedReturnValue();

            PKLogFacilityTypeGetObject(6uLL);
            v213 = objc_claimAutoreleasedReturnValue();
            v217 = os_log_type_enabled(v213, OS_LOG_TYPE_DEFAULT);
            if (!v212)
            {
              if (v217)
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18FC92000, v213, OS_LOG_TYPE_DEFAULT, "Could not find a currentValue for the citizenship picker", buf, 2u);
              }
              goto LABEL_331;
            }
            if (!v217)
              goto LABEL_330;
            *(_WORD *)buf = 0;
            v214 = "No user region code, using US as default for citizenship";
          }
LABEL_329:
          _os_log_impl(&dword_18FC92000, v213, OS_LOG_TYPE_DEFAULT, v214, buf, 2u);
          goto LABEL_330;
        }
        PKLogFacilityTypeGetObject(6uLL);
        v213 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v213, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v214 = "Using server given default value for citizenship field";
          goto LABEL_329;
        }
LABEL_330:

        objc_msgSend(v194, "setCurrentValue:", v212);
        v213 = v212;
LABEL_331:

      }
      v117 = v288;
      v118 = v279;
LABEL_333:

    }
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("phoneNumber"));
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  v219 = v218;
  v220 = v282;
  v221 = v278;
  if (v218)
  {
    v272 = v218;
    objc_msgSend(v218, "defaultValue");
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    if (v222)
      goto LABEL_336;
    v219 = v272;
    if (objc_msgSend(v272, "populateFromMeCard"))
    {
      if (PKIsPhone())
      {
        PKDevicePhoneNumber();
        v223 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v223 = 0;
      }
      v269 = v223;
      v268 = v182;
      if (-[NSObject length](v223, "length"))
      {
        PKLogFacilityTypeGetObject(6uLL);
        v224 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v224, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v224, OS_LOG_TYPE_DEFAULT, "Using device number prefill", buf, 2u);
        }
        goto LABEL_429;
      }
      v322 = 0u;
      v323 = 0u;
      v320 = 0u;
      v321 = 0u;
      objc_msgSend(v285, "phoneNumbers");
      obja = (id)objc_claimAutoreleasedReturnValue();
      v225 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v320, v343, 16);
      if (!v225)
      {
        v319 = 0;
        v305 = 0;
        v307 = 0;
        v301 = 0;
        goto LABEL_410;
      }
      v226 = v225;
      v305 = 0;
      v307 = 0;
      v301 = 0;
      v316 = *(_QWORD *)v321;
      v319 = 0;
      v227 = (void *)*MEMORY[0x1E0C97058];
      v313 = (void *)*MEMORY[0x1E0C97028];
      v303 = (id)*MEMORY[0x1E0C97020];
      v284 = (void *)*MEMORY[0x1E0C97010];
      v273 = (void *)*MEMORY[0x1E0C97050];
      v271 = (void *)*MEMORY[0x1E0C97030];
      v270 = (void *)*MEMORY[0x1E0C97038];
      while (1)
      {
        v228 = 0;
        do
        {
          if (*(_QWORD *)v321 != v316)
            objc_enumerationMutation(obja);
          v229 = *(void **)(*((_QWORD *)&v320 + 1) + 8 * v228);
          objc_msgSend(v229, "label", v268);
          v230 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v229, "value");
          v231 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v231, "stringValue");
          v232 = (void *)objc_claimAutoreleasedReturnValue();

          v233 = v230;
          v234 = v227;
          v235 = v234;
          if (v233 == v234)
          {

LABEL_359:
            v237 = v319;
            v319 = v232;
            goto LABEL_403;
          }
          if (v227 && v233)
          {
            v236 = objc_msgSend(v233, "isEqualToString:", v234);

            if (v236)
              goto LABEL_359;
          }
          else
          {

          }
          v238 = v233;
          v239 = v313;
          v240 = v239;
          if (v238 == v239)
          {

LABEL_367:
            v237 = v307;
            v307 = v232;
            goto LABEL_403;
          }
          if (v313 && v233)
          {
            v241 = objc_msgSend(v238, "isEqualToString:", v239);

            if (v241)
              goto LABEL_367;
          }
          else
          {

          }
          v242 = v238;
          v243 = v303;
          v244 = v243;
          if (v242 == v243)
          {

LABEL_375:
            v237 = v305;
            v305 = v232;
            goto LABEL_403;
          }
          if (v303 && v233)
          {
            v245 = objc_msgSend(v242, "isEqualToString:", v243);

            if (v245)
              goto LABEL_375;
          }
          else
          {

          }
          v246 = v242;
          v247 = v284;
          v237 = v247;
          if (v246 == v247)
          {

          }
          else
          {
            if (!v284 || !v233)
            {
LABEL_400:

LABEL_401:
              v237 = v301;
              if (-[NSObject length](v301, "length"))
                goto LABEL_404;
              v301 = v232;
LABEL_403:

              goto LABEL_404;
            }
            v248 = -[NSObject isEqualToString:](v246, "isEqualToString:", v247);

            if (!v248)
              goto LABEL_401;
          }
          v249 = v246;
          v250 = v273;
          v237 = v250;
          if (v249 == v250)
          {

          }
          else
          {
            if (!v273 || !v233)
              goto LABEL_400;
            v251 = -[NSObject isEqualToString:](v249, "isEqualToString:", v250);

            if (!v251)
              goto LABEL_401;
          }
          v252 = v249;
          v253 = v271;
          v237 = v253;
          if (v252 == v253)
          {

          }
          else
          {
            if (!v271 || !v233)
              goto LABEL_400;
            v254 = -[NSObject isEqualToString:](v252, "isEqualToString:", v253);

            if (!v254)
              goto LABEL_401;
          }
          v255 = v252;
          v256 = v270;
          v237 = v256;
          if (v255 == v256)
          {

            goto LABEL_403;
          }
          if (!v270 || !v233)
            goto LABEL_400;
          v257 = -[NSObject isEqualToString:](v255, "isEqualToString:", v256);

          if ((v257 & 1) == 0)
            goto LABEL_401;
LABEL_404:

          ++v228;
          v4 = v308;
        }
        while (v226 != v228);
        v258 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v320, v343, 16);
        v226 = v258;
        if (!v258)
        {
LABEL_410:

          if (!-[NSObject length](v319, "length"))
          {
            v261 = v307;
            v183 = v277;
            v221 = v278;
            v117 = v288;
            if (-[NSObject length](v307, "length"))
            {
              v259 = v307;

              PKLogFacilityTypeGetObject(6uLL);
              v260 = objc_claimAutoreleasedReturnValue();
              v224 = v319;
              if (!os_log_type_enabled(v260, OS_LOG_TYPE_DEFAULT))
                goto LABEL_427;
              *(_WORD *)buf = 0;
              v262 = "Using me card mobile number prefill";
            }
            else
            {
              v263 = v305;
              v224 = v319;
              if (-[NSObject length](v305, "length"))
              {
                v259 = v305;

                PKLogFacilityTypeGetObject(6uLL);
                v260 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v260, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_427;
                *(_WORD *)buf = 0;
                v262 = "Using me card main number prefill";
              }
              else
              {
                if (!-[NSObject length](v301, "length"))
                  goto LABEL_428;
                v259 = v301;

                PKLogFacilityTypeGetObject(6uLL);
                v260 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v260, OS_LOG_TYPE_DEFAULT))
                  goto LABEL_427;
                *(_WORD *)buf = 0;
                v262 = "Using me card other number prefill";
              }
            }
            _os_log_impl(&dword_18FC92000, v260, OS_LOG_TYPE_DEFAULT, v262, buf, 2u);
            goto LABEL_427;
          }
          v259 = v319;

          PKLogFacilityTypeGetObject(6uLL);
          v260 = objc_claimAutoreleasedReturnValue();
          v183 = v277;
          v221 = v278;
          v117 = v288;
          if (os_log_type_enabled(v260, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18FC92000, v260, OS_LOG_TYPE_DEFAULT, "Using me card iPhone number prefill", buf, 2u);
          }
          v224 = v319;
LABEL_427:

          v269 = v259;
          v263 = v305;
          v261 = v307;
LABEL_428:

          v118 = v279;
LABEL_429:
          v264 = v221;

          if (-[NSObject length](v269, "length"))
          {
            objc_msgSend(v272, "setDefaultValue:", v269);
            objc_msgSend(v272, "currentValue");
            v265 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v265)
              objc_msgSend(v272, "setCurrentValue:", v269);
            v220 = v282;
            v221 = v264;
            v182 = v268;
            v222 = v269;
          }
          else
          {
            PKLogFacilityTypeGetObject(6uLL);
            v266 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v266, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18FC92000, v266, OS_LOG_TYPE_DEFAULT, "No prefilled phone number could be found", buf, 2u);
            }

            v220 = v282;
            v221 = v264;
            v182 = v268;
            v222 = v269;
          }
LABEL_336:

          v219 = v272;
          break;
        }
      }
    }
  }

LABEL_338:
LABEL_339:

}

BOOL __49__PKPaymentSetupFieldsModel_prefillDefaultValues__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v3 = a2;
  objc_msgSend(v3, "localizedDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = v4;
  v7 = v5;
  if (v6 == v7)
  {
    v10 = 1;
    v11 = v6;
LABEL_14:

    goto LABEL_15;
  }
  v8 = v7;
  if (!v6 || !v7)
  {

    goto LABEL_8;
  }
  v9 = objc_msgSend(v6, "caseInsensitiveCompare:", v7);

  if (v9)
  {
LABEL_8:
    objc_msgSend(v3, "submissionValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 32);
    v11 = v12;
    v14 = v13;
    v15 = v14;
    if (v11 == v14)
    {
      v10 = 1;
    }
    else
    {
      v10 = 0;
      if (v11 && v14)
        v10 = objc_msgSend(v11, "caseInsensitiveCompare:", v14) == 0;
    }

    goto LABEL_14;
  }
  v10 = 1;
LABEL_15:

  return v10;
}

uint64_t __49__PKPaymentSetupFieldsModel_prefillDefaultValues__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "localizedDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

uint64_t __49__PKPaymentSetupFieldsModel_prefillDefaultValues__block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "localizedDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (void)prefillDefaultValuesWithPostalAddress:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;

  v31 = a3;
  -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self, "paymentSetupFieldWithIdentifier:", CFSTR("street1"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self, "paymentSetupFieldWithIdentifier:", CFSTR("street2"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self, "paymentSetupFieldWithIdentifier:", CFSTR("addressLine1"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self, "paymentSetupFieldWithIdentifier:", CFSTR("addressLine2"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v8 = 0;
  else
    v8 = v5 == 0;
  v10 = v8 && v6 == 0 && v7 == 0;
  v30 = v5;
  if (v10)
  {
    v14 = *MEMORY[0x1E0C99880];
  }
  else
  {
    objc_msgSend(v31, "street");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("\n"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0C99880];
    objc_msgSend(v13, "stringByApplyingTransform:reverse:", *MEMORY[0x1E0C99880], 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    __67__PKPaymentSetupFieldsModel_prefillDefaultValuesWithPostalAddress___block_invoke(v4, v15);
    __67__PKPaymentSetupFieldsModel_prefillDefaultValuesWithPostalAddress___block_invoke(v6, v15);
    if ((unint64_t)objc_msgSend(v12, "count") < 2)
    {
      v17 = 0;
    }
    else
    {
      objc_msgSend(v12, "objectAtIndex:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByApplyingTransform:reverse:", v14, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    __67__PKPaymentSetupFieldsModel_prefillDefaultValuesWithPostalAddress___block_invoke(v5, v17);
    __67__PKPaymentSetupFieldsModel_prefillDefaultValuesWithPostalAddress___block_invoke(v7, v17);

  }
  -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self, "paymentSetupFieldWithIdentifier:", CFSTR("postalCode"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "postalCode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  __67__PKPaymentSetupFieldsModel_prefillDefaultValuesWithPostalAddress___block_invoke(v18, v19);
  -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self, "paymentSetupFieldWithIdentifier:", CFSTR("city"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "city");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringByApplyingTransform:reverse:", v14, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  __67__PKPaymentSetupFieldsModel_prefillDefaultValuesWithPostalAddress___block_invoke(v20, v22);
  -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self, "paymentSetupFieldWithIdentifier:", CFSTR("state"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v31, "state");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByApplyingTransform:reverse:", v14, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      if (objc_msgSend(v23, "isFieldTypePicker"))
      {
        v29 = v4;
        v28 = v23;
        objc_msgSend(v28, "pickerItems");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __67__PKPaymentSetupFieldsModel_prefillDefaultValuesWithPostalAddress___block_invoke_2;
        v32[3] = &unk_1E2AC1610;
        v33 = v25;
        objc_msgSend(v26, "pk_firstObjectPassingTest:", v32);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          objc_msgSend(v28, "setCurrentValue:", v27);
          objc_msgSend(v28, "setSource:", 2);
        }

        v4 = v29;
      }
      else
      {
        __67__PKPaymentSetupFieldsModel_prefillDefaultValuesWithPostalAddress___block_invoke(v23, v25);
      }
    }

  }
}

void __67__PKPaymentSetupFieldsModel_prefillDefaultValuesWithPostalAddress___block_invoke(void *a1, void *a2)
{
  id v3;
  id v4;

  if (a1)
  {
    v3 = a2;
    v4 = a1;
    objc_msgSend(v4, "setDefaultValue:", v3);
    objc_msgSend(v4, "setCurrentValue:", v3);

    objc_msgSend(v4, "setSource:", 2);
  }
}

BOOL __67__PKPaymentSetupFieldsModel_prefillDefaultValuesWithPostalAddress___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v3 = a2;
  objc_msgSend(v3, "localizedDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = v4;
  v7 = v5;
  if (v6 == v7)
  {
    v10 = 1;
    v11 = v6;
LABEL_14:

    goto LABEL_15;
  }
  v8 = v7;
  if (!v6 || !v7)
  {

    goto LABEL_8;
  }
  v9 = objc_msgSend(v6, "caseInsensitiveCompare:", v7);

  if (v9)
  {
LABEL_8:
    objc_msgSend(v3, "submissionValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 32);
    v11 = v12;
    v14 = v13;
    v15 = v14;
    if (v11 == v14)
    {
      v10 = 1;
    }
    else
    {
      v10 = 0;
      if (v11 && v14)
        v10 = objc_msgSend(v11, "caseInsensitiveCompare:", v14) == 0;
    }

    goto LABEL_14;
  }
  v10 = 1;
LABEL_15:

  return v10;
}

- (void)prefillValuesWithPaymentCredential:(id)a3
{
  id v4;
  void *v5;
  PKPaymentSetupFieldBuiltInCardOnFilePrimaryAccountNumber *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  unint64_t v35;
  void *v36;
  PKPaymentSetupFieldText *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSString *v43;
  void *v44;
  void *v45;
  NSDecimalNumber *v46;
  NSDecimalNumber *v47;
  NSString *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  PKPaymentSetupFieldBuiltInBalance *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  void *v72;
  void *v73;
  NSDecimalNumber *v74;
  PKPaymentSetupFieldText *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  const __CFString *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  NSDecimalNumber *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  _QWORD v99[2];

  v99[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isSafariCredential"))
  {
    -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self, "paymentSetupFieldWithIdentifier:", CFSTR("primaryAccountNumber"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[NSMutableArray removeObject:](self->_paymentSetupFields, "removeObject:", v5);
      v6 = -[PKPaymentSetupField initWithIdentifier:]([PKPaymentSetupFieldBuiltInCardOnFilePrimaryAccountNumber alloc], "initWithIdentifier:", CFSTR("cardOnFilePrimaryAccountNumber"));
      -[NSMutableArray insertObject:atIndex:](self->_paymentSetupFields, "insertObject:atIndex:", v6, 0);

    }
    objc_msgSend(v4, "safariCredential");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self, "paymentSetupFieldWithIdentifier:", CFSTR("cardholderName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v7, "cardholderName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCurrentValue:", v10);

    }
    -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self, "paymentSetupFieldWithIdentifier:", CFSTR("cardSecurityCode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(v7, "securityCode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCurrentValue:", v13);

    }
  }
  -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self, "paymentSetupFieldWithIdentifier:", CFSTR("cardOnFilePrimaryAccountNumber"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "setReadonly:", 1);
    PKSanitizedPrimaryAccountRepresentationForPaymentCredential(v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCurrentValue:", v16);

    v17 = objc_msgSend(v4, "credentialType");
    if (objc_msgSend(v4, "isLocalPassCredential"))
    {
      if (v17 == 123)
      {
        v18 = CFSTR("ACCOUNT_ON_IPHONE");
LABEL_18:
        PKLocalizedAquamanString(&v18->isa, 0);
        v20 = objc_claimAutoreleasedReturnValue();
LABEL_21:
        v21 = (void *)v20;
        objc_msgSend(v15, "setLocalizedDisplayName:", v20);

        goto LABEL_22;
      }
      v19 = CFSTR("CARD_ON_IPHONE");
    }
    else if (objc_msgSend(v4, "isSafariCredential"))
    {
      v19 = CFSTR("CARD_NUMBER");
    }
    else
    {
      if (v17 == 123)
      {
        v18 = CFSTR("ACCOUNT_ON_FILE");
        goto LABEL_18;
      }
      v19 = CFSTR("CARD_ON_FILE");
    }
    PKLocalizedPaymentString(&v19->isa, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
LABEL_22:
  -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self, "paymentSetupFieldWithIdentifier:", CFSTR("cardExpiration"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v4, "expiration");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)v23;
      objc_msgSend(v22, "currentValue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        if (qword_1ECF22340 != -1)
          dispatch_once(&qword_1ECF22340, &__block_literal_global_52);
        v26 = (void *)_MergedGlobals_207;
        objc_msgSend(v4, "expiration");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "dateFromString:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
          objc_msgSend(v22, "setCurrentValue:", v28);

      }
    }
  }
  objc_msgSend(v4, "accountCredential");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "account");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "creditDetails");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isAccountCredential") && v31)
  {
    objc_msgSend(v31, "currencyCode");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v30, "feature");
    objc_msgSend(v31, "accountSummary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v30, "accessLevel");
    if (v35 >= 2)
    {
      if (v35 != 2)
      {
LABEL_55:

        goto LABEL_56;
      }
      v94 = v22;
      v95 = v15;
      v91 = v32;
      v36 = v34;
      v37 = -[PKPaymentSetupFieldText initWithIdentifier:type:]([PKPaymentSetupFieldText alloc], "initWithIdentifier:type:", CFSTR("spendActivity"), 1);
      -[PKPaymentSetupField textFieldObject](v37, "textFieldObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "components:fromDate:", 8, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "month");

      PKGregorianMonthSpecificLocalizedStringKeyForKey(CFSTR("SPENDING_LABEL"), v42);
      v43 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKLocalizedMadisonString(v43, 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setLocalizedDisplayName:", v44);

      PKCurrentUserAltDSID();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = v36;
      objc_msgSend(v36, "accountUserActivityForAccountUserAltDSID:", v45);
      v46 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

      v89 = v46;
      -[NSDecimalNumber totalSpending](v46, "totalSpending");
      v47 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "currencyCode");
      v48 = (NSString *)objc_claimAutoreleasedReturnValue();
      v49 = v48;
      if (v47 && v48)
      {
        PKCurrencyAmountCreate(v47, v48, 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = -[NSDecimalNumber compare:](v47, "compare:", v51);

        if (v52 == -1)
        {
          objc_msgSend(v50, "negativeValue");
          v85 = (void *)objc_claimAutoreleasedReturnValue();

          v50 = v85;
          objc_msgSend(v85, "formattedStringValue");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v53);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setCurrentValue:", v86);

        }
        else
        {
          objc_msgSend(v50, "formattedStringValue");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setCurrentValue:", v53);
        }

      }
      objc_msgSend(v38, "setReadonly:", 1);
      v97 = v38;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentSetupFieldsModel updateWithPaymentSetupFields:](self, "updateWithPaymentSetupFields:", v87);

      v32 = v91;
      v22 = v94;
      v74 = v89;
    }
    else
    {
      v95 = v15;
      v96 = v34;
      if ((objc_msgSend(v34, "requiresDebtCollectionNotices") & 1) != 0)
      {
        v93 = 0;
      }
      else
      {
        v92 = v32;
        v54 = v22;
        v55 = -[PKPaymentSetupFieldBuiltInBalance initWithIdentifier:type:]([PKPaymentSetupFieldBuiltInBalance alloc], "initWithIdentifier:type:", CFSTR("balance"), 1);
        -[PKPaymentSetupField textFieldObject](v55, "textFieldObject");
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        v90 = v33;
        PKLocalizedFeatureString(CFSTR("ACCOUNT_DASHBOARD_SUMMARY_CARD_BALANCE"), v33, 0, v57, v58, v59, v60, v61, v88);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = v56;
        objc_msgSend(v56, "setLocalizedDisplayName:", v62);

        objc_msgSend(v30, "creditDetails");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "cardBalance");
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v64, "amount");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v65, "compare:", v66);

        if (v67 == -1)
        {
          objc_msgSend(v64, "negativeValue");
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v71, "formattedStringValue");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = (uint64_t)v69;
          PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "setCurrentValue:", v72);

          v64 = v71;
        }
        else
        {
          objc_msgSend(v64, "formattedStringValue");
          v68 = objc_claimAutoreleasedReturnValue();
          v69 = (void *)v68;
          if (v68)
            v70 = (const __CFString *)v68;
          else
            v70 = &stru_1E2ADF4C0;
          objc_msgSend(v93, "setCurrentValue:", v70);
        }

        v99[0] = v93;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 1);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentSetupFieldsModel updateWithPaymentSetupFields:](self, "updateWithPaymentSetupFields:", v73);

        v22 = v54;
        v33 = v90;
        v32 = v92;
        v34 = v96;
      }
      objc_msgSend(v34, "creditLimit");
      v74 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      v75 = -[PKPaymentSetupFieldText initWithIdentifier:type:]([PKPaymentSetupFieldText alloc], "initWithIdentifier:type:", CFSTR("limit"), 1);
      -[PKPaymentSetupField textFieldObject](v75, "textFieldObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      PKLocalizedFeatureString(CFSTR("ACCOUNT_SERVICE_CREDIT_DETAILS_CREDIT_LIMIT"), v33, 0, v76, v77, v78, v79, v80, v88);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setLocalizedDisplayName:", v81);

      PKCurrencyAmountCreate(v74, (NSString *)v32, 0);
      v47 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      -[NSDecimalNumber formattedStringValue](v47, "formattedStringValue");
      v82 = objc_claimAutoreleasedReturnValue();
      v83 = (void *)v82;
      if (v82)
        v84 = (const __CFString *)v82;
      else
        v84 = &stru_1E2ADF4C0;
      objc_msgSend(v38, "setCurrentValue:", v84);

      objc_msgSend(v38, "setReadonly:", 1);
      v98 = v38;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v98, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentSetupFieldsModel updateWithPaymentSetupFields:](self, "updateWithPaymentSetupFields:", v49);
    }

    v15 = v95;
    v34 = v96;
    goto LABEL_55;
  }
LABEL_56:

}

uint64_t __64__PKPaymentSetupFieldsModel_prefillValuesWithPaymentCredential___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_207;
  _MergedGlobals_207 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_207;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  return objc_msgSend((id)_MergedGlobals_207, "setDateFormat:", CFSTR("MM/yy"));
}

- (id)setupFieldAnalytics
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_paymentSetupFields;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "identifier", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", CFSTR("true"), v11);

        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return v12;
}

- (id)odiAttributes
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = self->_paymentSetupFields;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "odiAttribute", (_QWORD)v18);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          objc_msgSend(v9, "submissionString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v9, "submissionString");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "odiAttribute");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKey:", v13, v14);

          }
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
  {
    v15 = objc_alloc_init(MEMORY[0x1E0D17580]);
    v16 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(v15, "setAttributes:", v16);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)requirementsMetForFieldWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  char v21;
  BOOL v22;
  NSObject *v23;
  void *v25;
  id v26;
  PKPaymentSetupFieldsModel *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self, "paymentSetupFieldWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v5, "requirements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v7)
  {
    v8 = v7;
    v25 = v5;
    v26 = v4;
    v9 = *(_QWORD *)v30;
    v27 = self;
    v28 = v6;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v11, "type", v25) == 1)
        {
          objc_msgSend(v11, "fieldIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self, "paymentSetupFieldWithIdentifier:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13 && objc_msgSend(v13, "isFieldTypePicker"))
          {
            objc_msgSend(v14, "pickerFieldObject");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "currentValue");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "submissionValue");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "value");
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = (void *)v18;
            v20 = !v17 || v18 == 0;
            v21 = v20 ? v17 == (void *)v18 : objc_msgSend(v17, "isEqual:", v18);

            self = v27;
            v6 = v28;
            if ((v21 & 1) == 0)
            {
              PKLogFacilityTypeGetObject(6uLL);
              v23 = objc_claimAutoreleasedReturnValue();
              v4 = v26;
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v34 = v26;
                v35 = 2112;
                v36 = v12;
                _os_log_impl(&dword_18FC92000, v23, OS_LOG_TYPE_DEFAULT, "Requirement not met for %@, based on %@", buf, 0x16u);
              }

              v22 = 0;
              goto LABEL_23;
            }
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v8)
        continue;
      break;
    }
    v22 = 1;
    v4 = v26;
LABEL_23:
    v5 = v25;
  }
  else
  {
    v22 = 1;
  }

  return v22;
}

- (BOOL)requirementsMetForVisibleFields
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PKPaymentSetupFieldsModel visiblePaymentSetupFields](self, "visiblePaymentSetupFields", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v7, "submissionStringMeetsAllRequirements") & 1) == 0
          && (objc_msgSend(v7, "isOptional") & 1) == 0
          && !objc_msgSend(v7, "isReadonly"))
        {
          v8 = 0;
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_13:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerFields, 0);
  objc_storeStrong((id *)&self->_footerField, 0);
  objc_storeStrong((id *)&self->_paymentSetupFields, 0);
}

@end
