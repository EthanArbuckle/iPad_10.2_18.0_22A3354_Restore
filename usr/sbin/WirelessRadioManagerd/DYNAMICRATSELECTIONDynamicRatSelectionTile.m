@implementation DYNAMICRATSELECTIONDynamicRatSelectionTile

- (void)dealloc
{
  objc_super v3;

  if (self)
    objc_setProperty_nonatomic(self, a2, 0, 8);
  v3.receiver = self;
  v3.super_class = (Class)DYNAMICRATSELECTIONDynamicRatSelectionTile;
  -[DYNAMICRATSELECTIONDynamicRatSelectionTile dealloc](&v3, "dealloc");
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYNAMICRATSELECTIONDynamicRatSelectionTile;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[DYNAMICRATSELECTIONDynamicRatSelectionTile description](&v3, "description"), -[DYNAMICRATSELECTIONDynamicRatSelectionTile dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  id v4;
  NSMutableArray *dratsTiles;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  if (-[NSMutableArray count](self->_dratsTiles, "count"))
  {
    v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_dratsTiles, "count"));
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    dratsTiles = self->_dratsTiles;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dratsTiles, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(dratsTiles);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "dictionaryRepresentation"));
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dratsTiles, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("drats_tiles"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10001F4A0(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *dratsTiles;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  dratsTiles = self->_dratsTiles;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dratsTiles, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(dratsTiles);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), 1);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dratsTiles, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  NSMutableArray *dratsTiles;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  dratsTiles = self->_dratsTiles;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dratsTiles, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
          objc_enumerationMutation(dratsTiles);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "copyWithZone:", a3);
        sub_10001F228(v5, (uint64_t)v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dratsTiles, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSMutableArray *dratsTiles;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self));
  if (v5)
  {
    dratsTiles = self->_dratsTiles;
    if ((unint64_t)dratsTiles | *((_QWORD *)a3 + 1))
      LOBYTE(v5) = -[NSMutableArray isEqual:](dratsTiles, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSMutableArray hash](self->_dratsTiles, "hash");
}

@end
