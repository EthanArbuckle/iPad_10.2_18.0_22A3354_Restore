@implementation APPBTargetingCriteria

- (void)clearCriteriaValues
{
  -[NSMutableArray removeAllObjects](self->_criteriaValues, "removeAllObjects");
}

- (void)addCriteriaValues:(id)a3
{
  id v4;
  NSMutableArray *criteriaValues;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  criteriaValues = self->_criteriaValues;
  v8 = v4;
  if (!criteriaValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_criteriaValues;
    self->_criteriaValues = v6;

    v4 = v8;
    criteriaValues = self->_criteriaValues;
  }
  -[NSMutableArray addObject:](criteriaValues, "addObject:", v4);

}

- (unint64_t)criteriaValuesCount
{
  return (unint64_t)-[NSMutableArray count](self->_criteriaValues, "count");
}

- (id)criteriaValuesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_criteriaValues, "objectAtIndex:", a3);
}

+ (Class)criteriaValuesType
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
  v8.super_class = (Class)APPBTargetingCriteria;
  v3 = -[APPBTargetingCriteria description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBTargetingCriteria dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *criteriaIdentifier;
  NSMutableArray *criteriaValues;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  criteriaIdentifier = self->_criteriaIdentifier;
  if (criteriaIdentifier)
    objc_msgSend(v3, "setObject:forKey:", criteriaIdentifier, CFSTR("criteriaIdentifier"));
  criteriaValues = self->_criteriaValues;
  if (criteriaValues)
    objc_msgSend(v4, "setObject:forKey:", criteriaValues, CFSTR("criteriaValues"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBTargetingCriteriaReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *criteriaIdentifier;
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
  criteriaIdentifier = self->_criteriaIdentifier;
  if (!criteriaIdentifier)
    sub_10017BC1C();
  v6 = v4;
  PBDataWriterWriteStringField(v4, criteriaIdentifier, 1);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_criteriaValues;
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
        PBDataWriterWriteStringField(v6, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), 2);
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
  objc_msgSend(v8, "setCriteriaIdentifier:", self->_criteriaIdentifier);
  if (-[APPBTargetingCriteria criteriaValuesCount](self, "criteriaValuesCount"))
  {
    objc_msgSend(v8, "clearCriteriaValues");
    v4 = -[APPBTargetingCriteria criteriaValuesCount](self, "criteriaValuesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[APPBTargetingCriteria criteriaValuesAtIndex:](self, "criteriaValuesAtIndex:", i));
        objc_msgSend(v8, "addCriteriaValues:", v7);

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
  v6 = -[NSString copyWithZone:](self->_criteriaIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_criteriaValues;
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
        objc_msgSend(v5, "addCriteriaValues:", v13);

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
  NSString *criteriaIdentifier;
  NSMutableArray *criteriaValues;
  unsigned __int8 v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((criteriaIdentifier = self->_criteriaIdentifier, !((unint64_t)criteriaIdentifier | v4[1]))
     || -[NSString isEqual:](criteriaIdentifier, "isEqual:")))
  {
    criteriaValues = self->_criteriaValues;
    if ((unint64_t)criteriaValues | v4[2])
      v7 = -[NSMutableArray isEqual:](criteriaValues, "isEqual:");
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

  v3 = -[NSString hash](self->_criteriaIdentifier, "hash");
  return (unint64_t)-[NSMutableArray hash](self->_criteriaValues, "hash") ^ v3;
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
    -[APPBTargetingCriteria setCriteriaIdentifier:](self, "setCriteriaIdentifier:");
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
        -[APPBTargetingCriteria addCriteriaValues:](self, "addCriteriaValues:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSString)criteriaIdentifier
{
  return self->_criteriaIdentifier;
}

- (void)setCriteriaIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_criteriaIdentifier, a3);
}

- (NSMutableArray)criteriaValues
{
  return self->_criteriaValues;
}

- (void)setCriteriaValues:(id)a3
{
  objc_storeStrong((id *)&self->_criteriaValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criteriaValues, 0);
  objc_storeStrong((id *)&self->_criteriaIdentifier, 0);
}

@end
