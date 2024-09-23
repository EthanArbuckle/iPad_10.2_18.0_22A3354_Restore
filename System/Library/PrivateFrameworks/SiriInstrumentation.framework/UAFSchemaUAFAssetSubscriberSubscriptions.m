@implementation UAFSchemaUAFAssetSubscriberSubscriptions

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UAFSchemaUAFAssetSubscriberSubscriptions;
  v4 = a3;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v9, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAFSchemaUAFAssetSubscriberSubscriptions subscriptions](self, "subscriptions", v9.receiver, v9.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UAFSchemaUAFAssetSubscriberSubscriptions setSubscriptions:](self, "setSubscriptions:", v7);
  return v5;
}

- (BOOL)hasSubscriberName
{
  return self->_subscriberName != 0;
}

- (void)deleteSubscriberName
{
  -[UAFSchemaUAFAssetSubscriberSubscriptions setSubscriberName:](self, "setSubscriberName:", 0);
}

- (void)clearSubscriptions
{
  -[NSArray removeAllObjects](self->_subscriptions, "removeAllObjects");
}

- (void)addSubscriptions:(id)a3
{
  id v4;
  NSArray *subscriptions;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  subscriptions = self->_subscriptions;
  v8 = v4;
  if (!subscriptions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_subscriptions;
    self->_subscriptions = v6;

    v4 = v8;
    subscriptions = self->_subscriptions;
  }
  -[NSArray addObject:](subscriptions, "addObject:", v4);

}

- (unint64_t)subscriptionsCount
{
  return -[NSArray count](self->_subscriptions, "count");
}

- (id)subscriptionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_subscriptions, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return UAFSchemaUAFAssetSubscriberSubscriptionsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UAFSchemaUAFAssetSubscriberSubscriptions subscriberName](self, "subscriberName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_subscriptions;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[UAFSchemaUAFAssetSubscriberSubscriptions subscriberName](self, "subscriberName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriberName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[UAFSchemaUAFAssetSubscriberSubscriptions subscriberName](self, "subscriberName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[UAFSchemaUAFAssetSubscriberSubscriptions subscriberName](self, "subscriberName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subscriberName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[UAFSchemaUAFAssetSubscriberSubscriptions subscriptions](self, "subscriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[UAFSchemaUAFAssetSubscriberSubscriptions subscriptions](self, "subscriptions");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[UAFSchemaUAFAssetSubscriberSubscriptions subscriptions](self, "subscriptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subscriptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_subscriberName, "hash");
  return -[NSArray hash](self->_subscriptions, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_subscriberName)
  {
    -[UAFSchemaUAFAssetSubscriberSubscriptions subscriberName](self, "subscriberName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("subscriberName"));

  }
  if (-[NSArray count](self->_subscriptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = self->_subscriptions;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v6, "addObject:", v12);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v13);

          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("subscriptions"));
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v15);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[UAFSchemaUAFAssetSubscriberSubscriptions dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (UAFSchemaUAFAssetSubscriberSubscriptions)initWithJSON:(id)a3
{
  void *v4;
  UAFSchemaUAFAssetSubscriberSubscriptions *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[UAFSchemaUAFAssetSubscriberSubscriptions initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (UAFSchemaUAFAssetSubscriberSubscriptions)initWithDictionary:(id)a3
{
  id v4;
  UAFSchemaUAFAssetSubscriberSubscriptions *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  UAFSchemaUAFAssetSetSubscription *v15;
  UAFSchemaUAFAssetSubscriberSubscriptions *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)UAFSchemaUAFAssetSubscriberSubscriptions;
  v5 = -[UAFSchemaUAFAssetSubscriberSubscriptions init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subscriberName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[UAFSchemaUAFAssetSubscriberSubscriptions setSubscriberName:](v5, "setSubscriberName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subscriptions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v6;
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v20;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = -[UAFSchemaUAFAssetSetSubscription initWithDictionary:]([UAFSchemaUAFAssetSetSubscription alloc], "initWithDictionary:", v14);
              -[UAFSchemaUAFAssetSubscriberSubscriptions addSubscriptions:](v5, "addSubscriptions:", v15);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v11);
      }

      v6 = v18;
    }
    v16 = v5;

  }
  return v5;
}

- (NSString)subscriberName
{
  return self->_subscriberName;
}

- (void)setSubscriberName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHasSubscriberName:(BOOL)a3
{
  self->_hasSubscriberName = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_subscriberName, 0);
}

@end
