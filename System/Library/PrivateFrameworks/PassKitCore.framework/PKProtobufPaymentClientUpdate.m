@implementation PKProtobufPaymentClientUpdate

- (BOOL)hasRemotePaymentRequestIdentifier
{
  return self->_remotePaymentRequestIdentifier != 0;
}

- (void)setStatus:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearPaymentSummaryItems
{
  -[NSMutableArray removeAllObjects](self->_paymentSummaryItems, "removeAllObjects");
}

- (void)addPaymentSummaryItems:(id)a3
{
  id v4;
  NSMutableArray *paymentSummaryItems;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  paymentSummaryItems = self->_paymentSummaryItems;
  v8 = v4;
  if (!paymentSummaryItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_paymentSummaryItems;
    self->_paymentSummaryItems = v6;

    v4 = v8;
    paymentSummaryItems = self->_paymentSummaryItems;
  }
  -[NSMutableArray addObject:](paymentSummaryItems, "addObject:", v4);

}

- (unint64_t)paymentSummaryItemsCount
{
  return -[NSMutableArray count](self->_paymentSummaryItems, "count");
}

- (id)paymentSummaryItemsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_paymentSummaryItems, "objectAtIndex:", a3);
}

+ (Class)paymentSummaryItemsType
{
  return (Class)objc_opt_class();
}

- (void)clearShippingMethods
{
  -[NSMutableArray removeAllObjects](self->_shippingMethods, "removeAllObjects");
}

- (void)addShippingMethods:(id)a3
{
  id v4;
  NSMutableArray *shippingMethods;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  shippingMethods = self->_shippingMethods;
  v8 = v4;
  if (!shippingMethods)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_shippingMethods;
    self->_shippingMethods = v6;

    v4 = v8;
    shippingMethods = self->_shippingMethods;
  }
  -[NSMutableArray addObject:](shippingMethods, "addObject:", v4);

}

- (unint64_t)shippingMethodsCount
{
  return -[NSMutableArray count](self->_shippingMethods, "count");
}

- (id)shippingMethodsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_shippingMethods, "objectAtIndex:", a3);
}

+ (Class)shippingMethodsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSelectedAID
{
  return self->_selectedAID != 0;
}

- (BOOL)hasAvailableShippingMethods
{
  return self->_availableShippingMethods != 0;
}

- (void)setSelectedPaymentType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_selectedPaymentType = a3;
}

- (void)setHasSelectedPaymentType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSelectedPaymentType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearMultiTokenContexts
{
  -[NSMutableArray removeAllObjects](self->_multiTokenContexts, "removeAllObjects");
}

- (void)addMultiTokenContexts:(id)a3
{
  id v4;
  NSMutableArray *multiTokenContexts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  multiTokenContexts = self->_multiTokenContexts;
  v8 = v4;
  if (!multiTokenContexts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_multiTokenContexts;
    self->_multiTokenContexts = v6;

    v4 = v8;
    multiTokenContexts = self->_multiTokenContexts;
  }
  -[NSMutableArray addObject:](multiTokenContexts, "addObject:", v4);

}

- (unint64_t)multiTokenContextsCount
{
  return -[NSMutableArray count](self->_multiTokenContexts, "count");
}

- (id)multiTokenContextsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_multiTokenContexts, "objectAtIndex:", a3);
}

+ (Class)multiTokenContextsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasRecurringPaymentRequest
{
  return self->_recurringPaymentRequest != 0;
}

- (BOOL)hasAutomaticReloadPaymentRequest
{
  return self->_automaticReloadPaymentRequest != 0;
}

- (BOOL)hasDeferredPaymentRequest
{
  return self->_deferredPaymentRequest != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufPaymentClientUpdate;
  -[PKProtobufPaymentClientUpdate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentClientUpdate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *remotePaymentRequestIdentifier;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  NSString *selectedAID;
  PKProtobufShippingMethods *availableShippingMethods;
  void *v23;
  void *v24;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  PKProtobufRecurringPaymentRequest *recurringPaymentRequest;
  void *v33;
  PKProtobufAutomaticReloadPaymentRequest *automaticReloadPaymentRequest;
  void *v35;
  PKProtobufDeferredPaymentRequest *deferredPaymentRequest;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  remotePaymentRequestIdentifier = self->_remotePaymentRequestIdentifier;
  if (remotePaymentRequestIdentifier)
    objc_msgSend(v3, "setObject:forKey:", remotePaymentRequestIdentifier, CFSTR("remotePaymentRequestIdentifier"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_status);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("status"));

  }
  if (-[NSMutableArray count](self->_paymentSummaryItems, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_paymentSummaryItems, "count"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v8 = self->_paymentSummaryItems;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v48 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "dictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("paymentSummaryItems"));
  }
  if (-[NSMutableArray count](self->_shippingMethods, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_shippingMethods, "count"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v15 = self->_shippingMethods;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v44 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * j), "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      }
      while (v17);
    }

    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("shippingMethods"));
  }
  selectedAID = self->_selectedAID;
  if (selectedAID)
    objc_msgSend(v4, "setObject:forKey:", selectedAID, CFSTR("selectedAID"));
  availableShippingMethods = self->_availableShippingMethods;
  if (availableShippingMethods)
  {
    -[PKProtobufShippingMethods dictionaryRepresentation](availableShippingMethods, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("availableShippingMethods"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_selectedPaymentType);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("selectedPaymentType"));

  }
  if (-[NSMutableArray count](self->_multiTokenContexts, "count"))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_multiTokenContexts, "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v26 = self->_multiTokenContexts;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v40;
      do
      {
        for (k = 0; k != v28; ++k)
        {
          if (*(_QWORD *)v40 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * k), "dictionaryRepresentation", (_QWORD)v39);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v31);

        }
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
      }
      while (v28);
    }

    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("multiTokenContexts"));
  }
  recurringPaymentRequest = self->_recurringPaymentRequest;
  if (recurringPaymentRequest)
  {
    -[PKProtobufRecurringPaymentRequest dictionaryRepresentation](recurringPaymentRequest, "dictionaryRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("recurringPaymentRequest"));

  }
  automaticReloadPaymentRequest = self->_automaticReloadPaymentRequest;
  if (automaticReloadPaymentRequest)
  {
    -[PKProtobufAutomaticReloadPaymentRequest dictionaryRepresentation](automaticReloadPaymentRequest, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("automaticReloadPaymentRequest"));

  }
  deferredPaymentRequest = self->_deferredPaymentRequest;
  if (deferredPaymentRequest)
  {
    -[PKProtobufDeferredPaymentRequest dictionaryRepresentation](deferredPaymentRequest, "dictionaryRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("deferredPaymentRequest"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentClientUpdateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_remotePaymentRequestIdentifier)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_paymentSummaryItems;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_shippingMethods;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  if (self->_selectedAID)
    PBDataWriterWriteStringField();
  if (self->_availableShippingMethods)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = self->_multiTokenContexts;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

  if (self->_recurringPaymentRequest)
    PBDataWriterWriteSubmessage();
  if (self->_automaticReloadPaymentRequest)
    PBDataWriterWriteSubmessage();
  if (self->_deferredPaymentRequest)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  v18 = v4;
  if (self->_remotePaymentRequestIdentifier)
  {
    objc_msgSend(v4, "setRemotePaymentRequestIdentifier:");
    v4 = v18;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_status;
    *((_BYTE *)v4 + 92) |= 2u;
  }
  if (-[PKProtobufPaymentClientUpdate paymentSummaryItemsCount](self, "paymentSummaryItemsCount"))
  {
    objc_msgSend(v18, "clearPaymentSummaryItems");
    v5 = -[PKProtobufPaymentClientUpdate paymentSummaryItemsCount](self, "paymentSummaryItemsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[PKProtobufPaymentClientUpdate paymentSummaryItemsAtIndex:](self, "paymentSummaryItemsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addPaymentSummaryItems:", v8);

      }
    }
  }
  if (-[PKProtobufPaymentClientUpdate shippingMethodsCount](self, "shippingMethodsCount"))
  {
    objc_msgSend(v18, "clearShippingMethods");
    v9 = -[PKProtobufPaymentClientUpdate shippingMethodsCount](self, "shippingMethodsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[PKProtobufPaymentClientUpdate shippingMethodsAtIndex:](self, "shippingMethodsAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addShippingMethods:", v12);

      }
    }
  }
  if (self->_selectedAID)
    objc_msgSend(v18, "setSelectedAID:");
  if (self->_availableShippingMethods)
    objc_msgSend(v18, "setAvailableShippingMethods:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v18 + 18) = self->_selectedPaymentType;
    *((_BYTE *)v18 + 92) |= 1u;
  }
  if (-[PKProtobufPaymentClientUpdate multiTokenContextsCount](self, "multiTokenContextsCount"))
  {
    objc_msgSend(v18, "clearMultiTokenContexts");
    v13 = -[PKProtobufPaymentClientUpdate multiTokenContextsCount](self, "multiTokenContextsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[PKProtobufPaymentClientUpdate multiTokenContextsAtIndex:](self, "multiTokenContextsAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addMultiTokenContexts:", v16);

      }
    }
  }
  if (self->_recurringPaymentRequest)
    objc_msgSend(v18, "setRecurringPaymentRequest:");
  v17 = v18;
  if (self->_automaticReloadPaymentRequest)
  {
    objc_msgSend(v18, "setAutomaticReloadPaymentRequest:");
    v17 = v18;
  }
  if (self->_deferredPaymentRequest)
  {
    objc_msgSend(v18, "setDeferredPaymentRequest:");
    v17 = v18;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_remotePaymentRequestIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_status;
    *(_BYTE *)(v5 + 92) |= 2u;
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v8 = self->_paymentSummaryItems;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v46 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPaymentSummaryItems:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v10);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v14 = self->_shippingMethods;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v42 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addShippingMethods:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v16);
  }

  v20 = -[NSString copyWithZone:](self->_selectedAID, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v20;

  v22 = -[PKProtobufShippingMethods copyWithZone:](self->_availableShippingMethods, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v22;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_selectedPaymentType;
    *(_BYTE *)(v5 + 92) |= 1u;
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v24 = self->_multiTokenContexts;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v38;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v38 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v37);
        objc_msgSend((id)v5, "addMultiTokenContexts:", v29);

      }
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v26);
  }

  v30 = -[PKProtobufRecurringPaymentRequest copyWithZone:](self->_recurringPaymentRequest, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v30;

  v32 = -[PKProtobufAutomaticReloadPaymentRequest copyWithZone:](self->_automaticReloadPaymentRequest, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v32;

  v34 = -[PKProtobufDeferredPaymentRequest copyWithZone:](self->_deferredPaymentRequest, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v34;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *remotePaymentRequestIdentifier;
  NSMutableArray *paymentSummaryItems;
  NSMutableArray *shippingMethods;
  NSString *selectedAID;
  PKProtobufShippingMethods *availableShippingMethods;
  NSMutableArray *multiTokenContexts;
  PKProtobufRecurringPaymentRequest *recurringPaymentRequest;
  PKProtobufAutomaticReloadPaymentRequest *automaticReloadPaymentRequest;
  PKProtobufDeferredPaymentRequest *deferredPaymentRequest;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  remotePaymentRequestIdentifier = self->_remotePaymentRequestIdentifier;
  if ((unint64_t)remotePaymentRequestIdentifier | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](remotePaymentRequestIdentifier, "isEqual:"))
      goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 2) == 0 || self->_status != *((_DWORD *)v4 + 22))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 92) & 2) != 0)
  {
LABEL_30:
    v14 = 0;
    goto LABEL_31;
  }
  paymentSummaryItems = self->_paymentSummaryItems;
  if ((unint64_t)paymentSummaryItems | *((_QWORD *)v4 + 5)
    && !-[NSMutableArray isEqual:](paymentSummaryItems, "isEqual:"))
  {
    goto LABEL_30;
  }
  shippingMethods = self->_shippingMethods;
  if ((unint64_t)shippingMethods | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](shippingMethods, "isEqual:"))
      goto LABEL_30;
  }
  selectedAID = self->_selectedAID;
  if ((unint64_t)selectedAID | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](selectedAID, "isEqual:"))
      goto LABEL_30;
  }
  availableShippingMethods = self->_availableShippingMethods;
  if ((unint64_t)availableShippingMethods | *((_QWORD *)v4 + 2))
  {
    if (!-[PKProtobufShippingMethods isEqual:](availableShippingMethods, "isEqual:"))
      goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 1) == 0 || self->_selectedPaymentType != *((_DWORD *)v4 + 18))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 92) & 1) != 0)
  {
    goto LABEL_30;
  }
  multiTokenContexts = self->_multiTokenContexts;
  if ((unint64_t)multiTokenContexts | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](multiTokenContexts, "isEqual:"))
  {
    goto LABEL_30;
  }
  recurringPaymentRequest = self->_recurringPaymentRequest;
  if ((unint64_t)recurringPaymentRequest | *((_QWORD *)v4 + 6))
  {
    if (!-[PKProtobufRecurringPaymentRequest isEqual:](recurringPaymentRequest, "isEqual:"))
      goto LABEL_30;
  }
  automaticReloadPaymentRequest = self->_automaticReloadPaymentRequest;
  if ((unint64_t)automaticReloadPaymentRequest | *((_QWORD *)v4 + 1))
  {
    if (!-[PKProtobufAutomaticReloadPaymentRequest isEqual:](automaticReloadPaymentRequest, "isEqual:"))
      goto LABEL_30;
  }
  deferredPaymentRequest = self->_deferredPaymentRequest;
  if ((unint64_t)deferredPaymentRequest | *((_QWORD *)v4 + 3))
    v14 = -[PKProtobufDeferredPaymentRequest isEqual:](deferredPaymentRequest, "isEqual:");
  else
    v14 = 1;
LABEL_31:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  unint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = -[NSString hash](self->_remotePaymentRequestIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_status;
  else
    v4 = 0;
  v5 = -[NSMutableArray hash](self->_paymentSummaryItems, "hash");
  v6 = -[NSMutableArray hash](self->_shippingMethods, "hash");
  v7 = -[NSString hash](self->_selectedAID, "hash");
  v8 = -[PKProtobufShippingMethods hash](self->_availableShippingMethods, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v9 = 2654435761 * self->_selectedPaymentType;
  else
    v9 = 0;
  v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  v11 = -[NSMutableArray hash](self->_multiTokenContexts, "hash");
  v12 = v11 ^ -[PKProtobufRecurringPaymentRequest hash](self->_recurringPaymentRequest, "hash");
  v13 = v12 ^ -[PKProtobufAutomaticReloadPaymentRequest hash](self->_automaticReloadPaymentRequest, "hash");
  return v10 ^ v13 ^ -[PKProtobufDeferredPaymentRequest hash](self->_deferredPaymentRequest, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  PKProtobufShippingMethods *availableShippingMethods;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  PKProtobufRecurringPaymentRequest *recurringPaymentRequest;
  uint64_t v23;
  PKProtobufAutomaticReloadPaymentRequest *automaticReloadPaymentRequest;
  uint64_t v25;
  PKProtobufDeferredPaymentRequest *deferredPaymentRequest;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 7))
    -[PKProtobufPaymentClientUpdate setRemotePaymentRequestIdentifier:](self, "setRemotePaymentRequestIdentifier:");
  if ((*((_BYTE *)v4 + 92) & 2) != 0)
  {
    self->_status = *((_DWORD *)v4 + 22);
    *(_BYTE *)&self->_has |= 2u;
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v5 = *((id *)v4 + 5);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(v5);
        -[PKProtobufPaymentClientUpdate addPaymentSummaryItems:](self, "addPaymentSummaryItems:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v7);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = *((id *)v4 + 10);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v10);
        -[PKProtobufPaymentClientUpdate addShippingMethods:](self, "addShippingMethods:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v12);
  }

  if (*((_QWORD *)v4 + 8))
    -[PKProtobufPaymentClientUpdate setSelectedAID:](self, "setSelectedAID:");
  availableShippingMethods = self->_availableShippingMethods;
  v16 = *((_QWORD *)v4 + 2);
  if (availableShippingMethods)
  {
    if (v16)
      -[PKProtobufShippingMethods mergeFrom:](availableShippingMethods, "mergeFrom:");
  }
  else if (v16)
  {
    -[PKProtobufPaymentClientUpdate setAvailableShippingMethods:](self, "setAvailableShippingMethods:");
  }
  if ((*((_BYTE *)v4 + 92) & 1) != 0)
  {
    self->_selectedPaymentType = *((_DWORD *)v4 + 18);
    *(_BYTE *)&self->_has |= 1u;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v17 = *((id *)v4 + 4);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v29;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v17);
        -[PKProtobufPaymentClientUpdate addMultiTokenContexts:](self, "addMultiTokenContexts:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * k), (_QWORD)v28);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v19);
  }

  recurringPaymentRequest = self->_recurringPaymentRequest;
  v23 = *((_QWORD *)v4 + 6);
  if (recurringPaymentRequest)
  {
    if (v23)
      -[PKProtobufRecurringPaymentRequest mergeFrom:](recurringPaymentRequest, "mergeFrom:");
  }
  else if (v23)
  {
    -[PKProtobufPaymentClientUpdate setRecurringPaymentRequest:](self, "setRecurringPaymentRequest:");
  }
  automaticReloadPaymentRequest = self->_automaticReloadPaymentRequest;
  v25 = *((_QWORD *)v4 + 1);
  if (automaticReloadPaymentRequest)
  {
    if (v25)
      -[PKProtobufAutomaticReloadPaymentRequest mergeFrom:](automaticReloadPaymentRequest, "mergeFrom:");
  }
  else if (v25)
  {
    -[PKProtobufPaymentClientUpdate setAutomaticReloadPaymentRequest:](self, "setAutomaticReloadPaymentRequest:");
  }
  deferredPaymentRequest = self->_deferredPaymentRequest;
  v27 = *((_QWORD *)v4 + 3);
  if (deferredPaymentRequest)
  {
    if (v27)
      -[PKProtobufDeferredPaymentRequest mergeFrom:](deferredPaymentRequest, "mergeFrom:");
  }
  else if (v27)
  {
    -[PKProtobufPaymentClientUpdate setDeferredPaymentRequest:](self, "setDeferredPaymentRequest:");
  }

}

- (NSString)remotePaymentRequestIdentifier
{
  return self->_remotePaymentRequestIdentifier;
}

- (void)setRemotePaymentRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_remotePaymentRequestIdentifier, a3);
}

- (unsigned)status
{
  return self->_status;
}

- (NSMutableArray)paymentSummaryItems
{
  return self->_paymentSummaryItems;
}

- (void)setPaymentSummaryItems:(id)a3
{
  objc_storeStrong((id *)&self->_paymentSummaryItems, a3);
}

- (NSMutableArray)shippingMethods
{
  return self->_shippingMethods;
}

- (void)setShippingMethods:(id)a3
{
  objc_storeStrong((id *)&self->_shippingMethods, a3);
}

- (NSString)selectedAID
{
  return self->_selectedAID;
}

- (void)setSelectedAID:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAID, a3);
}

- (PKProtobufShippingMethods)availableShippingMethods
{
  return self->_availableShippingMethods;
}

- (void)setAvailableShippingMethods:(id)a3
{
  objc_storeStrong((id *)&self->_availableShippingMethods, a3);
}

- (unsigned)selectedPaymentType
{
  return self->_selectedPaymentType;
}

- (NSMutableArray)multiTokenContexts
{
  return self->_multiTokenContexts;
}

- (void)setMultiTokenContexts:(id)a3
{
  objc_storeStrong((id *)&self->_multiTokenContexts, a3);
}

- (PKProtobufRecurringPaymentRequest)recurringPaymentRequest
{
  return self->_recurringPaymentRequest;
}

- (void)setRecurringPaymentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_recurringPaymentRequest, a3);
}

- (PKProtobufAutomaticReloadPaymentRequest)automaticReloadPaymentRequest
{
  return self->_automaticReloadPaymentRequest;
}

- (void)setAutomaticReloadPaymentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_automaticReloadPaymentRequest, a3);
}

- (PKProtobufDeferredPaymentRequest)deferredPaymentRequest
{
  return self->_deferredPaymentRequest;
}

- (void)setDeferredPaymentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_deferredPaymentRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shippingMethods, 0);
  objc_storeStrong((id *)&self->_selectedAID, 0);
  objc_storeStrong((id *)&self->_remotePaymentRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_recurringPaymentRequest, 0);
  objc_storeStrong((id *)&self->_paymentSummaryItems, 0);
  objc_storeStrong((id *)&self->_multiTokenContexts, 0);
  objc_storeStrong((id *)&self->_deferredPaymentRequest, 0);
  objc_storeStrong((id *)&self->_availableShippingMethods, 0);
  objc_storeStrong((id *)&self->_automaticReloadPaymentRequest, 0);
}

@end
