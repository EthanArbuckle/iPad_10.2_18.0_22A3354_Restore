@implementation PersistentHistory

- (void)clearItems
{
  -[NSMutableArray removeAllObjects](self->_items, "removeAllObjects");
}

- (void)addItems:(id)a3
{
  id v4;
  NSMutableArray *items;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  items = self->_items;
  v8 = v4;
  if (!items)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_items;
    self->_items = v6;

    v4 = v8;
    items = self->_items;
  }
  -[NSMutableArray addObject:](items, "addObject:", v4);

}

- (unint64_t)itemsCount
{
  return (unint64_t)-[NSMutableArray count](self->_items, "count");
}

- (id)itemsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", a3);
}

+ (Class)itemsType
{
  return (Class)objc_opt_class(PersistentHistoryItem);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PersistentHistory;
  v3 = -[PersistentHistory description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PersistentHistory dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (-[NSMutableArray count](self->_items, "count"))
  {
    v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_items, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = self->_items;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "dictionaryRepresentation", (_QWORD)v12));
          objc_msgSend(v4, "addObject:", v10);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("items"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  int v11;
  PersistentHistoryItem *v13;
  int v14;
  _QWORD v16[2];

  while (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      break;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v8 == -1 || v8 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
        break;
      v9 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0)
        goto LABEL_11;
      v5 += 7;
      if (v6++ >= 9)
      {
        v7 = 0;
        v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      v7 = 0;
LABEL_13:
    if (v11 || (v7 & 7) == 4)
      break;
    if ((v7 >> 3) == 10)
    {
      v13 = objc_alloc_init(PersistentHistoryItem);
      -[PersistentHistory addItems:](self, "addItems:", v13);
      v16[0] = 0;
      v16[1] = 0;
      if (!PBReaderPlaceMark(a3, v16) || !sub_100A64ACC((id *)v13, (uint64_t)a3))
      {

        LOBYTE(v14) = 0;
        return v14;
      }
      PBReaderRecallMark(a3, v16);

    }
    else
    {
      v14 = PBReaderSkipValueWithTag(a3);
      if (!v14)
        return v14;
    }
  }
  LOBYTE(v14) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v14;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_items;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage(v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), 10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
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
  if (-[PersistentHistory itemsCount](self, "itemsCount"))
  {
    objc_msgSend(v8, "clearItems");
    v4 = -[PersistentHistory itemsCount](self, "itemsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[PersistentHistory itemsAtIndex:](self, "itemsAtIndex:", i));
        objc_msgSend(v8, "addItems:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  NSMutableArray *v6;
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
  v6 = self->_items;
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
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "copyWithZone:", a3, (_QWORD)v13);
        objc_msgSend(v5, "addItems:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *items;
  unsigned __int8 v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
  {
    items = self->_items;
    if ((unint64_t)items | v4[1])
      v6 = -[NSMutableArray isEqual:](items, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSMutableArray hash](self->_items, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *((id *)a3 + 1);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[PersistentHistory addItems:](self, "addItems:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
