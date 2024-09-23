@implementation MZKeyValueStoreNode

+ (id)serverRevisionNewerThanClientKeys
{
  if (qword_1005673A8 != -1)
    dispatch_once(&qword_1005673A8, &stru_1004A92F0);
  return (id)qword_1005673A0;
}

+ (void)setServerRevisionNewerThanClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = a1;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serverRevisionNewerThanClientKeys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  objc_msgSend(v5, "setObject:forKey:", v6, v7);

  objc_sync_exit(v4);
}

+ (BOOL)isServerRevisionNewerThanClient:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = a1;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serverRevisionNewerThanClientKeys"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));
  v8 = v7 != 0;

  objc_sync_exit(v5);
  return v8;
}

+ (id)keyValueStoreDataCurrentRevision
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)qword_1005673B0;
  if (!qword_1005673B0)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", 2);
    v4 = (void *)qword_1005673B0;
    qword_1005673B0 = (uint64_t)v3;

    v2 = (void *)qword_1005673B0;
  }
  return v2;
}

+ (id)keyValueStoreDataFirstRevision
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)qword_1005673B8;
  if (!qword_1005673B8)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", 1);
    v4 = (void *)qword_1005673B8;
    qword_1005673B8 = (uint64_t)v3;

    v2 = (void *)qword_1005673B8;
  }
  return v2;
}

+ (id)keyWithPrefix:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  void *v9;
  uint64_t v11;

  v6 = a3;
  v7 = a4;
  if (v7)
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v6, v7);
  else
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v6, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (objc_msgSend((id)objc_opt_class(a1), "isServerRevisionNewerThanClient:", v9))
  {

    v9 = 0;
  }

  return v9;
}

+ (id)keysWithPrefix:(id)a3 assetIDs:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v8 = objc_alloc_init((Class)NSMutableArray);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v13);
          v15 = (void *)objc_opt_class(a1);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "keyWithPrefix:assetID:", v6, v14, (_QWORD)v18));
          if (v16)
            objc_msgSend(v8, "addObject:", v16);

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)assetIDForKey:(id)a3 withPrefix:(id)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringFromIndex:", objc_msgSend(a4, "length")));

  return v6;
}

- (MZKeyValueStoreNode)init
{
  MZKeyValueStoreNode *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MZKeyValueStoreNode;
  result = -[MZKeyValueStoreNode init](&v3, "init");
  if (result)
    result->_wrapperRevision = 1;
  return result;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode key](self, "key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode version](self, "version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode value](self, "value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> {_key:%@; _version:%@; _value:[%d bytes]}"),
                   v3,
                   self,
                   v4,
                   v5,
                   objc_msgSend(v6, "length")));

  return v7;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode value](self, "value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v3, 0, 0, 0));

  v5 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0
    || (v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"))) == 0)
  {
    v7 = objc_alloc((Class)NSString);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode value](self, "value"));
    v6 = objc_msgSend(v7, "initWithData:encoding:", v8, 4);

    if (!v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode value](self, "value"));
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hexString"));

    }
  }
  v10 = objc_opt_class(self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode key](self, "key"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode version](self, "version"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> {_key:%@; _version:%@; _value: %@}"),
                    v10,
                    self,
                    v11,
                    v12,
                    v6));

  return v13;
}

- (BOOL)hasData
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode value](self, "value"));
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)objectValueMatchingClass:(Class)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode objectValue](self, "objectValue"));
  if ((objc_opt_isKindOfClass(v4, a3) & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (NSString)stringValue
{
  uint64_t v3;

  v3 = objc_opt_class(NSString, a2);
  return (NSString *)-[MZKeyValueStoreNode objectValueMatchingClass:](self, "objectValueMatchingClass:", v3);
}

- (void)setStringValue:(id)a3
{
  -[MZKeyValueStoreNode setObjectValue:](self, "setObjectValue:", a3);
}

- (NSNumber)numberValue
{
  uint64_t v3;

  v3 = objc_opt_class(NSNumber, a2);
  return (NSNumber *)-[MZKeyValueStoreNode objectValueMatchingClass:](self, "objectValueMatchingClass:", v3);
}

- (void)setNumberValue:(id)a3
{
  -[MZKeyValueStoreNode setObjectValue:](self, "setObjectValue:", a3);
}

- (NSDate)dateValue
{
  uint64_t v3;

  v3 = objc_opt_class(NSDate, a2);
  return (NSDate *)-[MZKeyValueStoreNode objectValueMatchingClass:](self, "objectValueMatchingClass:", v3);
}

- (void)setDateValue:(id)a3
{
  -[MZKeyValueStoreNode setObjectValue:](self, "setObjectValue:", a3);
}

- (NSData)dataValue
{
  uint64_t v3;

  v3 = objc_opt_class(NSData, a2);
  return (NSData *)-[MZKeyValueStoreNode objectValueMatchingClass:](self, "objectValueMatchingClass:", v3);
}

- (void)setDataValue:(id)a3
{
  -[MZKeyValueStoreNode setObjectValue:](self, "setObjectValue:", a3);
}

- (NSArray)arrayValue
{
  uint64_t v3;

  v3 = objc_opt_class(NSArray, a2);
  return (NSArray *)-[MZKeyValueStoreNode objectValueMatchingClass:](self, "objectValueMatchingClass:", v3);
}

- (void)setArrayValue:(id)a3
{
  -[MZKeyValueStoreNode setObjectValue:](self, "setObjectValue:", a3);
}

- (NSDictionary)dictionaryValue
{
  uint64_t v3;

  v3 = objc_opt_class(NSDictionary, a2);
  return (NSDictionary *)-[MZKeyValueStoreNode objectValueMatchingClass:](self, "objectValueMatchingClass:", v3);
}

- (void)setDictionaryValue:(id)a3
{
  -[MZKeyValueStoreNode setObjectValue:](self, "setObjectValue:", a3);
}

- (id)objectValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode value](self, "value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v3, 0, 0, 0));

  v5 = objc_opt_class(NSDictionary);
  v6 = 0;
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v7 = v4;
    v8 = objc_msgSend((id)objc_opt_class(self), "keyValueStoreDataCurrentRevision");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", off_100551078));
    v11 = objc_msgSend(v10, "intValue");
    if (v11 <= (int)objc_msgSend(v9, "intValue"))
    {
      if (v10)
      {
        v14 = objc_opt_class(NSNumber);
        if ((objc_opt_isKindOfClass(v10, v14) & 1) != 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
          v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v15));

        }
        else
        {
          v16 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v10, v16) & 1) == 0)
            goto LABEL_9;
          v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v10));
        }
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      v12 = (void *)objc_opt_class(self);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode key](self, "key"));
      objc_msgSend(v12, "setServerRevisionNewerThanClient:", v13);

    }
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
LABEL_11:

  return v6;
}

- (void)setObjectValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "keyValueStoreDataCurrentRevision");
  v13 = (id)objc_claimAutoreleasedReturnValue(v5);
  if (-[MZKeyValueStoreNode wrapperRevision](self, "wrapperRevision"))
  {
    v6 = v13;
  }
  else
  {
    v7 = objc_msgSend((id)objc_opt_class(self), "keyValueStoreDataFirstRevision");
    v8 = objc_claimAutoreleasedReturnValue(v7);

    v6 = (void *)v8;
  }
  v9 = off_100551078;
  v14 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v14, v9, v4, v10, 0));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v11, 200, 0, 0));
  -[MZKeyValueStoreNode setValue:](self, "setValue:", v12);

}

- (MZKeyValueStoreTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSData)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (BOOL)mismatch
{
  return self->_mismatch;
}

- (void)setMismatch:(BOOL)a3
{
  self->_mismatch = a3;
}

- (int)wrapperRevision
{
  return self->_wrapperRevision;
}

- (void)setWrapperRevision:(int)a3
{
  self->_wrapperRevision = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
