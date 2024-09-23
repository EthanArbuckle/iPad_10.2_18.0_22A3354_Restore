@implementation PXComposeRecipientValidationManager

- (PXComposeRecipientValidationManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientValidationManager.m"), 95, CFSTR("%s is not available as initializer"), "-[PXComposeRecipientValidationManager init]");

  abort();
}

- (PXComposeRecipientValidationManager)initWithDataSource:(id)a3
{
  id v6;
  PXComposeRecipientValidationManager *v7;
  PXComposeRecipientValidationManager *v8;
  uint64_t v9;
  NSMutableDictionary *composeRecipientsToQuery;
  uint64_t v11;
  NSMutableDictionary *queryAddressesToComposeRecipientQuery;
  PXIDSAddressQueryController *v13;
  PXIDSAddressQueryController *addressQueryController;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  objc_super v20;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientValidationManager.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSource"));

  }
  v20.receiver = self;
  v20.super_class = (Class)PXComposeRecipientValidationManager;
  v7 = -[PXComposeRecipientValidationManager init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_dataSource, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    composeRecipientsToQuery = v8->_composeRecipientsToQuery;
    v8->_composeRecipientsToQuery = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    queryAddressesToComposeRecipientQuery = v8->_queryAddressesToComposeRecipientQuery;
    v8->_queryAddressesToComposeRecipientQuery = (NSMutableDictionary *)v11;

    v13 = objc_alloc_init(PXIDSAddressQueryController);
    addressQueryController = v8->_addressQueryController;
    v8->_addressQueryController = v13;

    v15 = (void *)MEMORY[0x1E0CB36B8];
    -[PXComposeRecipientDataSource composeRecipients](v8->_dataSource, "composeRecipients");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "indexSetWithIndexesInRange:", 0, objc_msgSend(v16, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXComposeRecipientValidationManager _requestValidationForComposeRecipientsAtIndexes:](v8, "_requestValidationForComposeRecipientsAtIndexes:", v17);
  }

  return v8;
}

- (void)setDataSource:(id)a3 changeDetails:(id)a4
{
  PXComposeRecipientDataSource *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  PXComposeRecipientDataSource *v12;

  v7 = (PXComposeRecipientDataSource *)a3;
  if (self->_dataSource != v7)
  {
    v12 = v7;
    objc_storeStrong((id *)&self->_dataSource, a3);
    v8 = a4;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertedIndexes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "changedIndexes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count"))
      objc_msgSend(v9, "addIndexes:", v10);
    if (objc_msgSend(v11, "count"))
      objc_msgSend(v9, "addIndexes:", v11);
    -[PXComposeRecipientValidationManager _requestValidationForComposeRecipientsAtIndexes:](self, "_requestValidationForComposeRecipientsAtIndexes:", v9);

    v7 = v12;
  }

}

- (void)_requestValidationForComposeRecipientsAtIndexes:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  PXIDSAddressQueryController *addressQueryController;
  _QWORD v14[4];
  id v15;
  id location;
  _QWORD v17[4];
  id v18;
  PXComposeRecipientValidationManager *v19;
  id v20;
  SEL v21;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientValidationManager dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "composeRecipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __87__PXComposeRecipientValidationManager__requestValidationForComposeRecipientsAtIndexes___block_invoke;
  v17[3] = &unk_1E513B3C8;
  v11 = v9;
  v21 = a2;
  v18 = v11;
  v19 = self;
  v12 = v6;
  v20 = v12;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v17);
  if (objc_msgSend(v12, "count"))
  {
    objc_initWeak(&location, self);
    addressQueryController = self->_addressQueryController;
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __87__PXComposeRecipientValidationManager__requestValidationForComposeRecipientsAtIndexes___block_invoke_2;
    v14[3] = &unk_1E5127EF0;
    objc_copyWeak(&v15, &location);
    -[PXIDSAddressQueryController performBatchQueryForAddresses:resultHandler:](addressQueryController, "performBatchQueryForAddresses:resultHandler:", v12, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

- (int64_t)validationTypeForComposeRecipient:(id)a3
{
  id v5;
  void *v6;
  int64_t v7;
  void *v9;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientValidationManager.m"), 186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("composeRecipient"));

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_composeRecipientsToQuery, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientValidationManager.m"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

  }
  v7 = objc_msgSend(v6, "validationType");

  return v7;
}

- (void)_handleAddressQueryResults:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  SEL v17;

  v6 = a3;
  -[PXComposeRecipientValidationManager dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "composeRecipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__PXComposeRecipientValidationManager__handleAddressQueryResults_error___block_invoke;
  v14[3] = &unk_1E5127F18;
  v17 = a2;
  v14[4] = self;
  v15 = v9;
  v13 = v10;
  v16 = v13;
  v11 = v9;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v14);

  if (objc_msgSend(v13, "count"))
  {
    -[PXComposeRecipientValidationManager delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "composeRecipientValidationManager:didUpdateValidationWithChangedIndexes:", self, v13);

  }
}

- (PXComposeRecipientDataSource)dataSource
{
  return self->_dataSource;
}

- (PXComposeRecipientValidationManagerDelegate)delegate
{
  return (PXComposeRecipientValidationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_addressQueryController, 0);
  objc_storeStrong((id *)&self->_queryAddressesToComposeRecipientQuery, 0);
  objc_storeStrong((id *)&self->_composeRecipientsToQuery, 0);
}

void __72__PXComposeRecipientValidationManager__handleAddressQueryResults_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a2;
  v6 = objc_msgSend(a3, "BOOLValue");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v5);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PXComposeRecipientValidationManager.m"), 201, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

    v7 = 0;
  }
  v8 = objc_msgSend(v7, "validationType");
  if (v6)
    v9 = 1;
  else
    v9 = 2;
  if (v8 == v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PXComposeRecipientValidationManager.m"), 205, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("previousType != newType"));

  }
  objc_msgSend(v15, "setValidationType:", v9);
  v10 = *(void **)(a1 + 40);
  objc_msgSend(v15, "composeRecipient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "indexOfObject:", v11);

  objc_msgSend(*(id *)(a1 + 48), "addIndex:", v12);
}

void __87__PXComposeRecipientValidationManager__requestValidationForComposeRecipientsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  PXComposeRecipientValidationQuery *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "recipient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suggestedTransport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    goto LABEL_15;
  objc_msgSend(v4, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "addressKind");
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("PXComposeRecipientValidationManager.m"), 147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("address"));

  }
  switch(v7)
  {
    case 1:
      v10 = MEMORY[0x1A85CBC14](v6);
      goto LABEL_10;
    case 2:
      v10 = IDSCopyIDForPhoneNumber();
LABEL_10:
      v9 = (void *)v10;
      if (v10)
        goto LABEL_11;
      break;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("PXComposeRecipientValidationManager.m"), 160, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("PXComposeRecipientValidationManager.m"), 164, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("addressToQuery"));

  v9 = 0;
LABEL_11:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKeyedSubscript:", v11, v15);
  }
  else
  {
    v12 = -[PXComposeRecipientValidationQuery initWithComposeRecipient:address:addressKind:]([PXComposeRecipientValidationQuery alloc], "initWithComposeRecipient:address:addressKind:", v15, v6, v7);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKeyedSubscript:", v12, v15);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setObject:forKeyedSubscript:", v12, v9);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);

  }
LABEL_15:

}

void __87__PXComposeRecipientValidationManager__requestValidationForComposeRecipientsAtIndexes___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleAddressQueryResults:error:", v6, v5);

}

+ (PXComposeRecipientValidationManager)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXComposeRecipientValidationManager.m"), 99, CFSTR("%s is not available as initializer"), "+[PXComposeRecipientValidationManager new]");

  abort();
}

@end
