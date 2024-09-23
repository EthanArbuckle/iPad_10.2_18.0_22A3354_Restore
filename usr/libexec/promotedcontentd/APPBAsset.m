@implementation APPBAsset

- (BOOL)hasName
{
  return self->_name != 0;
}

- (int)location
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_location;
  else
    return 7500;
}

- (void)setLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_location = a3;
}

- (void)setHasLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLocation
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)locationAsString:(int)a3
{
  if ((a3 - 7500) >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_1002145C0 + a3 - 7500);
}

- (int)StringAsLocation:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Left")) & 1) != 0)
  {
    v4 = 7500;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Center")) & 1) != 0)
  {
    v4 = 7501;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Right")))
  {
    v4 = 7502;
  }
  else
  {
    v4 = 7500;
  }

  return v4;
}

- (void)clearAssetInfos
{
  -[NSMutableArray removeAllObjects](self->_assetInfos, "removeAllObjects");
}

- (void)addAssetInfo:(id)a3
{
  id v4;
  NSMutableArray *assetInfos;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  assetInfos = self->_assetInfos;
  v8 = v4;
  if (!assetInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_assetInfos;
    self->_assetInfos = v6;

    v4 = v8;
    assetInfos = self->_assetInfos;
  }
  -[NSMutableArray addObject:](assetInfos, "addObject:", v4);

}

- (unint64_t)assetInfosCount
{
  return (unint64_t)-[NSMutableArray count](self->_assetInfos, "count");
}

- (id)assetInfoAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_assetInfos, "objectAtIndex:", a3);
}

+ (Class)assetInfoType
{
  return (Class)objc_opt_class(APPBAssetInfo, a2);
}

- (void)setAdamId:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_adamId = a3;
}

- (void)setHasAdamId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAdamId
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasTreatment
{
  return self->_treatment != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBAsset;
  v3 = -[APPBAsset description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAsset dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  int v6;
  void *v7;
  id v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  NSString *treatment;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6 = self->_location - 7500;
    if (v6 >= 3)
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_location));
    else
      v7 = *(&off_1002145C0 + v6);
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("location"));

  }
  if (-[NSMutableArray count](self->_assetInfos, "count"))
  {
    v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_assetInfos, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = self->_assetInfos;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("assetInfo"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_adamId));
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("adamId"));

  }
  treatment = self->_treatment;
  if (treatment)
    objc_msgSend(v4, "setObject:forKey:", treatment, CFSTR("treatment"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAssetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSString *name;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSString *treatment;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = v4;
  name = self->_name;
  if (name)
    PBDataWriterWriteStringField(v4, name, 1);
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field(v5, self->_location, 2);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_assetInfos;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11), 3);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field(v5, self->_adamId, 4);
  treatment = self->_treatment;
  if (treatment)
    PBDataWriterWriteStringField(v5, treatment, 5);

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_location;
    *((_BYTE *)v4 + 48) |= 2u;
  }
  if (-[APPBAsset assetInfosCount](self, "assetInfosCount"))
  {
    objc_msgSend(v10, "clearAssetInfos");
    v5 = -[APPBAsset assetInfosCount](self, "assetInfosCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAsset assetInfoAtIndex:](self, "assetInfoAtIndex:", i));
        objc_msgSend(v10, "addAssetInfo:", v8);

      }
    }
  }
  v9 = v10;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v10 + 1) = self->_adamId;
    *((_BYTE *)v10 + 48) |= 1u;
  }
  if (self->_treatment)
  {
    objc_msgSend(v10, "setTreatment:");
    v9 = v10;
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
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_location;
    *((_BYTE *)v5 + 48) |= 2u;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_assetInfos;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v12), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend(v5, "addAssetInfo:", v13);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = self->_adamId;
    *((_BYTE *)v5 + 48) |= 1u;
  }
  v14 = -[NSString copyWithZone:](self->_treatment, "copyWithZone:", a3, (_QWORD)v17);
  v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  char has;
  NSMutableArray *assetInfos;
  NSString *treatment;
  unsigned __int8 v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_19;
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_19;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_location != *((_DWORD *)v4 + 6))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_19;
  }
  assetInfos = self->_assetInfos;
  if ((unint64_t)assetInfos | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](assetInfos, "isEqual:"))
    {
LABEL_19:
      v9 = 0;
      goto LABEL_20;
    }
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_adamId != *((_QWORD *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_19;
  }
  treatment = self->_treatment;
  if ((unint64_t)treatment | *((_QWORD *)v4 + 5))
    v9 = -[NSString isEqual:](treatment, "isEqual:");
  else
    v9 = 1;
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_name, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_location;
  else
    v4 = 0;
  v5 = (unint64_t)-[NSMutableArray hash](self->_assetInfos, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761u * self->_adamId;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_treatment, "hash");
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
  if (*((_QWORD *)v4 + 4))
    -[APPBAsset setName:](self, "setName:");
  if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    self->_location = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
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
        -[APPBAsset addAssetInfo:](self, "addAssetInfo:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_adamId = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 5))
    -[APPBAsset setTreatment:](self, "setTreatment:");

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSMutableArray)assetInfos
{
  return self->_assetInfos;
}

- (void)setAssetInfos:(id)a3
{
  objc_storeStrong((id *)&self->_assetInfos, a3);
}

- (unint64_t)adamId
{
  return self->_adamId;
}

- (NSString)treatment
{
  return self->_treatment;
}

- (void)setTreatment:(id)a3
{
  objc_storeStrong((id *)&self->_treatment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatment, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_assetInfos, 0);
}

@end
