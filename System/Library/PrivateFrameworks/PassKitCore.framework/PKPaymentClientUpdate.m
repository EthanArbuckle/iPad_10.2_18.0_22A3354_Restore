@implementation PKPaymentClientUpdate

+ (id)paymentUpdateResponseWithProtobuf:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  PKShippingMethods *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  PKShippingMethods *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  PKPaymentClientUpdate *v33;
  uint64_t v34;
  void *v35;
  PKPaymentClientUpdate *v36;
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
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(v3, "paymentSummaryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v43;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v43 != v8)
          objc_enumerationMutation(v5);
        +[PKPaymentSummaryItem itemWithProtobuf:](PKPaymentSummaryItem, "itemWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v3, "hasAvailableShippingMethods"))
  {
    objc_msgSend(v3, "availableShippingMethods");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKShippingMethods shippingMethodsWithProtobuf:](PKShippingMethods, "shippingMethodsWithProtobuf:", v11);
    v12 = (PKShippingMethods *)objc_claimAutoreleasedReturnValue();
LABEL_19:
    v21 = v12;

    goto LABEL_20;
  }
  objc_msgSend(v3, "shippingMethods");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v3, "shippingMethods");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v39;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v39 != v18)
            objc_enumerationMutation(v15);
          +[PKShippingMethod shippingMethodWithProtobuf:](PKShippingMethod, "shippingMethodWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v19));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v17);
    }

    v12 = -[PKShippingMethods initWithLegacyShippingMethods:]([PKShippingMethods alloc], "initWithLegacyShippingMethods:", v11);
    goto LABEL_19;
  }
  v21 = 0;
LABEL_20:
  objc_msgSend(v3, "multiTokenContexts");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "pk_arrayByApplyingBlock:", &__block_literal_global_145_0);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  v25 = (void *)MEMORY[0x1E0C9AA60];
  if (v23)
    v25 = (void *)v23;
  v26 = v25;

  if (objc_msgSend(v3, "hasRecurringPaymentRequest"))
  {
    objc_msgSend(v3, "recurringPaymentRequest");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKRecurringPaymentRequest recurringPaymentRequestWithProtobuf:](PKRecurringPaymentRequest, "recurringPaymentRequestWithProtobuf:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = 0;
  }
  if (objc_msgSend(v3, "hasAutomaticReloadPaymentRequest"))
  {
    objc_msgSend(v3, "automaticReloadPaymentRequest");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKAutomaticReloadPaymentRequest automaticReloadPaymentRequestWithProtobuf:](PKAutomaticReloadPaymentRequest, "automaticReloadPaymentRequestWithProtobuf:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v30 = 0;
  }
  objc_msgSend(v3, "deferredPaymentRequest");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v3, "deferredPaymentRequest");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKDeferredPaymentRequest deferredPaymentRequestWithProtobuf:](PKDeferredPaymentRequest, "deferredPaymentRequestWithProtobuf:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v33 = [PKPaymentClientUpdate alloc];
  v34 = objc_msgSend(v3, "status");
  objc_msgSend(v3, "selectedAID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[PKPaymentClientUpdate initWithPaymentSummaryItems:shippingMethods:multiTokenContexts:recurringPaymentRequest:automaticReloadPaymentRequest:deferredPaymentRequest:status:selectedAID:selectedPaymentMethodType:](v33, "initWithPaymentSummaryItems:shippingMethods:multiTokenContexts:recurringPaymentRequest:automaticReloadPaymentRequest:deferredPaymentRequest:status:selectedAID:selectedPaymentMethodType:", v4, v21, v26, v28, v30, v31, v34, v35, objc_msgSend(v3, "selectedPaymentType"));

  return v36;
}

PKPaymentTokenContext *__69__PKPaymentClientUpdate_Protobuf__paymentUpdateResponseWithProtobuf___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PKPaymentTokenContext contextWithProtobuf:](PKPaymentTokenContext, "contextWithProtobuf:", a2);
}

- (id)protobuf
{
  PKProtobufPaymentClientUpdate *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(PKProtobufPaymentClientUpdate);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[PKPaymentClientUpdate multiTokenContexts](self, "multiTokenContexts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v40;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v40 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v8), "protobuf");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKProtobufPaymentClientUpdate addMultiTokenContexts:](v3, "addMultiTokenContexts:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v6);
  }

  -[PKPaymentClientUpdate recurringPaymentRequest](self, "recurringPaymentRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "protobuf");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentClientUpdate setRecurringPaymentRequest:](v3, "setRecurringPaymentRequest:", v11);

  -[PKPaymentClientUpdate automaticReloadPaymentRequest](self, "automaticReloadPaymentRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "protobuf");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentClientUpdate setAutomaticReloadPaymentRequest:](v3, "setAutomaticReloadPaymentRequest:", v13);

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[PKPaymentClientUpdate paymentSummaryItems](self, "paymentSummaryItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v36;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v18), "summaryItemProtobuf");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKProtobufPaymentClientUpdate addPaymentSummaryItems:](v3, "addPaymentSummaryItems:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v16);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[PKPaymentClientUpdate shippingMethods](self, "shippingMethods", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "legacyShippingMethods");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v32;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v25), "shippingMethodProtobuf");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKProtobufPaymentClientUpdate addShippingMethods:](v3, "addShippingMethods:", v26);

        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v23);
  }

  -[PKPaymentClientUpdate shippingMethods](self, "shippingMethods");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "protobuf");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentClientUpdate setAvailableShippingMethods:](v3, "setAvailableShippingMethods:", v28);

  -[PKProtobufPaymentClientUpdate setStatus:](v3, "setStatus:", -[PKPaymentClientUpdate status](self, "status"));
  -[PKPaymentClientUpdate selectedAID](self, "selectedAID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentClientUpdate setSelectedAID:](v3, "setSelectedAID:", v29);

  -[PKProtobufPaymentClientUpdate setSelectedPaymentType:](v3, "setSelectedPaymentType:", -[PKPaymentClientUpdate selectedPaymentMethodType](self, "selectedPaymentMethodType"));
  return v3;
}

- (PKPaymentClientUpdate)initWithPaymentSummaryItems:(id)a3 shippingMethods:(id)a4 multiTokenContexts:(id)a5 recurringPaymentRequest:(id)a6 automaticReloadPaymentRequest:(id)a7 deferredPaymentRequest:(id)a8 status:(int64_t)a9 selectedAID:(id)a10 selectedPaymentMethodType:(unint64_t)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  PKPaymentClientUpdate *v22;
  uint64_t v23;
  NSArray *paymentSummaryItems;
  uint64_t v25;
  PKShippingMethods *shippingMethods;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSString *selectedAID;
  id v36;
  id v37;
  objc_super v38;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v37 = a7;
  v36 = a8;
  v21 = a10;
  v38.receiver = self;
  v38.super_class = (Class)PKPaymentClientUpdate;
  v22 = -[PKPaymentClientUpdate init](&v38, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v17, "copy");
    paymentSummaryItems = v22->_paymentSummaryItems;
    v22->_paymentSummaryItems = (NSArray *)v23;

    v25 = objc_msgSend(v18, "copy");
    shippingMethods = v22->_shippingMethods;
    v22->_shippingMethods = (PKShippingMethods *)v25;

    v27 = objc_msgSend(v19, "copy");
    v28 = v18;
    v29 = v20;
    v30 = v17;
    v31 = (void *)v27;
    if (v27)
      v32 = (void *)v27;
    else
      v32 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v22->_multiTokenContexts, v32);

    v17 = v30;
    v20 = v29;
    v18 = v28;
    objc_storeStrong((id *)&v22->_recurringPaymentRequest, a6);
    objc_storeStrong((id *)&v22->_automaticReloadPaymentRequest, a7);
    objc_storeStrong((id *)&v22->_deferredPaymentRequest, a8);
    v22->_status = a9;
    v33 = objc_msgSend(v21, "copy");
    selectedAID = v22->_selectedAID;
    v22->_selectedAID = (NSString *)v33;

    v22->_selectedPaymentMethodType = a11;
  }

  return v22;
}

- (PKPaymentClientUpdate)initWithCoder:(id)a3
{
  id v4;
  PKPaymentClientUpdate *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *paymentSummaryItems;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  PKRecurringPaymentRequest *recurringPaymentRequest;
  uint64_t v19;
  PKAutomaticReloadPaymentRequest *automaticReloadPaymentRequest;
  uint64_t v21;
  PKDeferredPaymentRequest *deferredPaymentRequest;
  uint64_t v23;
  NSString *selectedAID;
  uint64_t v25;
  PKShippingMethods *shippingMethods;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  PKShippingMethods *v31;
  PKShippingMethods *v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKPaymentClientUpdate;
  v5 = -[PKPaymentClientUpdate init](&v34, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("paymentSummaryItems"));
    v9 = objc_claimAutoreleasedReturnValue();
    paymentSummaryItems = v5->_paymentSummaryItems;
    v5->_paymentSummaryItems = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("multiTokenContexts"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (void *)v14;
    else
      v16 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v5->_multiTokenContexts, v16);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recurringPaymentRequest"));
    v17 = objc_claimAutoreleasedReturnValue();
    recurringPaymentRequest = v5->_recurringPaymentRequest;
    v5->_recurringPaymentRequest = (PKRecurringPaymentRequest *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("automaticReloadPaymentRequest"));
    v19 = objc_claimAutoreleasedReturnValue();
    automaticReloadPaymentRequest = v5->_automaticReloadPaymentRequest;
    v5->_automaticReloadPaymentRequest = (PKAutomaticReloadPaymentRequest *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deferredPaymentRequest"));
    v21 = objc_claimAutoreleasedReturnValue();
    deferredPaymentRequest = v5->_deferredPaymentRequest;
    v5->_deferredPaymentRequest = (PKDeferredPaymentRequest *)v21;

    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedAID"));
    v23 = objc_claimAutoreleasedReturnValue();
    selectedAID = v5->_selectedAID;
    v5->_selectedAID = (NSString *)v23;

    v5->_selectedPaymentMethodType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("selectedPaymentMethodType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("availableShippingMethods"));
    v25 = objc_claimAutoreleasedReturnValue();
    shippingMethods = v5->_shippingMethods;
    v5->_shippingMethods = (PKShippingMethods *)v25;

    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("shippingMethods"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5->_shippingMethods && v30)
    {
      v31 = -[PKShippingMethods initWithLegacyShippingMethods:]([PKShippingMethods alloc], "initWithLegacyShippingMethods:", v30);
      v32 = v5->_shippingMethods;
      v5->_shippingMethods = v31;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *paymentSummaryItems;
  void *v5;
  id v6;

  paymentSummaryItems = self->_paymentSummaryItems;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", paymentSummaryItems, CFSTR("paymentSummaryItems"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_multiTokenContexts, CFSTR("multiTokenContexts"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_recurringPaymentRequest, CFSTR("recurringPaymentRequest"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_automaticReloadPaymentRequest, CFSTR("automaticReloadPaymentRequest"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_deferredPaymentRequest, CFSTR("deferredPaymentRequest"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_selectedAID, CFSTR("selectedAID"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_selectedPaymentMethodType, CFSTR("selectedPaymentMethodType"));
  -[PKShippingMethods legacyShippingMethods](self->_shippingMethods, "legacyShippingMethods");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("shippingMethods"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_shippingMethods, CFSTR("availableShippingMethods"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)paymentSummaryItems
{
  return self->_paymentSummaryItems;
}

- (PKShippingMethods)shippingMethods
{
  return self->_shippingMethods;
}

- (NSArray)multiTokenContexts
{
  return self->_multiTokenContexts;
}

- (PKRecurringPaymentRequest)recurringPaymentRequest
{
  return self->_recurringPaymentRequest;
}

- (PKAutomaticReloadPaymentRequest)automaticReloadPaymentRequest
{
  return self->_automaticReloadPaymentRequest;
}

- (PKDeferredPaymentRequest)deferredPaymentRequest
{
  return self->_deferredPaymentRequest;
}

- (int64_t)status
{
  return self->_status;
}

- (NSString)selectedAID
{
  return self->_selectedAID;
}

- (unint64_t)selectedPaymentMethodType
{
  return self->_selectedPaymentMethodType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAID, 0);
  objc_storeStrong((id *)&self->_deferredPaymentRequest, 0);
  objc_storeStrong((id *)&self->_automaticReloadPaymentRequest, 0);
  objc_storeStrong((id *)&self->_recurringPaymentRequest, 0);
  objc_storeStrong((id *)&self->_multiTokenContexts, 0);
  objc_storeStrong((id *)&self->_shippingMethods, 0);
  objc_storeStrong((id *)&self->_paymentSummaryItems, 0);
}

@end
