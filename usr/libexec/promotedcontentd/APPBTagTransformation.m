@implementation APPBTagTransformation

+ (id)options
{
  if (qword_100269820 != -1)
    dispatch_once(&qword_100269820, &stru_100214AB8);
  return (id)qword_100269818;
}

- (void)clearRequiredTags
{
  -[NSMutableArray removeAllObjects](self->_requiredTags, "removeAllObjects");
}

- (void)addRequiredTags:(id)a3
{
  id v4;
  NSMutableArray *requiredTags;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  requiredTags = self->_requiredTags;
  v8 = v4;
  if (!requiredTags)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_requiredTags;
    self->_requiredTags = v6;

    v4 = v8;
    requiredTags = self->_requiredTags;
  }
  -[NSMutableArray addObject:](requiredTags, "addObject:", v4);

}

- (unint64_t)requiredTagsCount
{
  return (unint64_t)-[NSMutableArray count](self->_requiredTags, "count");
}

- (id)requiredTagsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_requiredTags, "objectAtIndex:", a3);
}

+ (Class)requiredTagsType
{
  return (Class)objc_opt_class(NSString, a2);
}

- (void)clearResultTags
{
  -[NSMutableArray removeAllObjects](self->_resultTags, "removeAllObjects");
}

- (void)addResultTags:(id)a3
{
  id v4;
  NSMutableArray *resultTags;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  resultTags = self->_resultTags;
  v8 = v4;
  if (!resultTags)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_resultTags;
    self->_resultTags = v6;

    v4 = v8;
    resultTags = self->_resultTags;
  }
  -[NSMutableArray addObject:](resultTags, "addObject:", v4);

}

- (unint64_t)resultTagsCount
{
  return (unint64_t)-[NSMutableArray count](self->_resultTags, "count");
}

- (id)resultTagsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_resultTags, "objectAtIndex:", a3);
}

+ (Class)resultTagsType
{
  return (Class)objc_opt_class(NSString, a2);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBTagTransformation;
  v3 = -[APPBTagTransformation description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBTagTransformation dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *requiredTags;
  NSMutableArray *resultTags;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  requiredTags = self->_requiredTags;
  if (requiredTags)
    objc_msgSend(v3, "setObject:forKey:", requiredTags, CFSTR("requiredTags"));
  resultTags = self->_resultTags;
  if (resultTags)
    objc_msgSend(v4, "setObject:forKey:", resultTags, CFSTR("resultTags"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBTagTransformationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];

  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_requiredTags;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField(v4, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v9), 1);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_resultTags;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField(v4, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), 2);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  id v12;

  v12 = a3;
  if (-[APPBTagTransformation requiredTagsCount](self, "requiredTagsCount"))
  {
    objc_msgSend(v12, "clearRequiredTags");
    v4 = -[APPBTagTransformation requiredTagsCount](self, "requiredTagsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[APPBTagTransformation requiredTagsAtIndex:](self, "requiredTagsAtIndex:", i));
        objc_msgSend(v12, "addRequiredTags:", v7);

      }
    }
  }
  if (-[APPBTagTransformation resultTagsCount](self, "resultTagsCount"))
  {
    objc_msgSend(v12, "clearResultTags");
    v8 = -[APPBTagTransformation resultTagsCount](self, "resultTagsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[APPBTagTransformation resultTagsAtIndex:](self, "resultTagsAtIndex:", j));
        objc_msgSend(v12, "addResultTags:", v11);

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
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = self->_requiredTags;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v10), "copyWithZone:", a3);
        objc_msgSend(v5, "addRequiredTags:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_resultTags;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v16), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend(v5, "addResultTags:", v17);

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *requiredTags;
  NSMutableArray *resultTags;
  unsigned __int8 v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((requiredTags = self->_requiredTags, !((unint64_t)requiredTags | v4[1]))
     || -[NSMutableArray isEqual:](requiredTags, "isEqual:")))
  {
    resultTags = self->_resultTags;
    if ((unint64_t)resultTags | v4[2])
      v7 = -[NSMutableArray isEqual:](resultTags, "isEqual:");
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
  unint64_t v3;

  v3 = (unint64_t)-[NSMutableArray hash](self->_requiredTags, "hash");
  return (unint64_t)-[NSMutableArray hash](self->_resultTags, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];

  v4 = (id *)a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v4[1];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[APPBTagTransformation addRequiredTags:](self, "addRequiredTags:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v4[2];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[APPBTagTransformation addResultTags:](self, "addResultTags:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), (_QWORD)v15);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (NSMutableArray)requiredTags
{
  return self->_requiredTags;
}

- (void)setRequiredTags:(id)a3
{
  objc_storeStrong((id *)&self->_requiredTags, a3);
}

- (NSMutableArray)resultTags
{
  return self->_resultTags;
}

- (void)setResultTags:(id)a3
{
  objc_storeStrong((id *)&self->_resultTags, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultTags, 0);
  objc_storeStrong((id *)&self->_requiredTags, 0);
}

@end
