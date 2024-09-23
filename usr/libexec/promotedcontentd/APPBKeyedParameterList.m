@implementation APPBKeyedParameterList

+ (id)options
{
  if (qword_100269980 != -1)
    dispatch_once(&qword_100269980, &stru_100215408);
  return (id)qword_100269978;
}

- (void)clearParameterLists
{
  -[NSMutableArray removeAllObjects](self->_parameterLists, "removeAllObjects");
}

- (void)addParameterList:(id)a3
{
  id v4;
  NSMutableArray *parameterLists;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  parameterLists = self->_parameterLists;
  v8 = v4;
  if (!parameterLists)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_parameterLists;
    self->_parameterLists = v6;

    v4 = v8;
    parameterLists = self->_parameterLists;
  }
  -[NSMutableArray addObject:](parameterLists, "addObject:", v4);

}

- (unint64_t)parameterListsCount
{
  return (unint64_t)-[NSMutableArray count](self->_parameterLists, "count");
}

- (id)parameterListAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_parameterLists, "objectAtIndex:", a3);
}

+ (Class)parameterListType
{
  return (Class)objc_opt_class(APPBParameter, a2);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBKeyedParameterList;
  v3 = -[APPBKeyedParameterList description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBKeyedParameterList dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *key;
  id v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  if (-[NSMutableArray count](self->_parameterLists, "count"))
  {
    v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_parameterLists, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = self->_parameterLists;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation", (_QWORD)v14));
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("parameterList"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBKeyedParameterListReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *key;
  void *v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  key = self->_key;
  if (!key)
    sub_10017BCE4();
  v6 = v4;
  PBDataWriterWriteStringField(v4, key, 1);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_parameterLists;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage(v6, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), 2);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "setKey:", self->_key);
  if (-[APPBKeyedParameterList parameterListsCount](self, "parameterListsCount"))
  {
    objc_msgSend(v8, "clearParameterLists");
    v4 = -[APPBKeyedParameterList parameterListsCount](self, "parameterListsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[APPBKeyedParameterList parameterListAtIndex:](self, "parameterListAtIndex:", i));
        objc_msgSend(v8, "addParameterList:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_parameterLists;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend(v5, "addParameterList:", v13);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *key;
  NSMutableArray *parameterLists;
  unsigned __int8 v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((key = self->_key, !((unint64_t)key | v4[1])) || -[NSString isEqual:](key, "isEqual:")))
  {
    parameterLists = self->_parameterLists;
    if ((unint64_t)parameterLists | v4[2])
      v7 = -[NSMutableArray isEqual:](parameterLists, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_key, "hash");
  return (unint64_t)-[NSMutableArray hash](self->_parameterLists, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  if (*((_QWORD *)v4 + 1))
    -[APPBKeyedParameterList setKey:](self, "setKey:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[APPBKeyedParameterList addParameterList:](self, "addParameterList:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSMutableArray)parameterLists
{
  return self->_parameterLists;
}

- (void)setParameterLists:(id)a3
{
  objc_storeStrong((id *)&self->_parameterLists, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterLists, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
