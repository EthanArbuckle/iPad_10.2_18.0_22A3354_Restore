@implementation PeoplePredictionDataMLSEVirtualFeatureStore

- (void)setFeatureVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_featureVersion = a3;
}

- (void)setHasFeatureVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFeatureVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearFeatureVectors
{
  -[NSMutableArray removeAllObjects](self->_featureVectors, "removeAllObjects");
}

- (void)addFeatureVector:(id)a3
{
  id v4;
  NSMutableArray *featureVectors;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  featureVectors = self->_featureVectors;
  v8 = v4;
  if (!featureVectors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_featureVectors;
    self->_featureVectors = v6;

    v4 = v8;
    featureVectors = self->_featureVectors;
  }
  -[NSMutableArray addObject:](featureVectors, "addObject:", v4);

}

- (unint64_t)featureVectorsCount
{
  return -[NSMutableArray count](self->_featureVectors, "count");
}

- (id)featureVectorAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_featureVectors, "objectAtIndex:", a3);
}

+ (Class)featureVectorType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDeviceIdentifier
{
  return self->_deviceIdentifier != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)PeoplePredictionDataMLSEVirtualFeatureStore;
  -[PeoplePredictionDataMLSEVirtualFeatureStore description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PeoplePredictionDataMLSEVirtualFeatureStore dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSString *deviceIdentifier;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_featureVersion);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("featureVersion"));

  }
  if (-[NSMutableArray count](self->_featureVectors, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_featureVectors, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = self->_featureVectors;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("featureVector"));
  }
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
    objc_msgSend(v3, "setObject:forKey:", deviceIdentifier, CFSTR("deviceIdentifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PeoplePredictionDataMLSEVirtualFeatureStoreReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_featureVectors;
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_deviceIdentifier)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_featureVersion;
    *((_BYTE *)v4 + 28) |= 1u;
  }
  v9 = v4;
  if (-[PeoplePredictionDataMLSEVirtualFeatureStore featureVectorsCount](self, "featureVectorsCount"))
  {
    objc_msgSend(v9, "clearFeatureVectors");
    v5 = -[PeoplePredictionDataMLSEVirtualFeatureStore featureVectorsCount](self, "featureVectorsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[PeoplePredictionDataMLSEVirtualFeatureStore featureVectorAtIndex:](self, "featureVectorAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addFeatureVector:", v8);

      }
    }
  }
  if (self->_deviceIdentifier)
    objc_msgSend(v9, "setDeviceIdentifier:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_featureVersion;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_featureVectors;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "copyWithZone:", a3, (_QWORD)v16);
        objc_msgSend(v6, "addFeatureVector:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v13 = -[NSString copyWithZone:](self->_deviceIdentifier, "copyWithZone:", a3);
  v14 = (void *)v6[1];
  v6[1] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *featureVectors;
  NSString *deviceIdentifier;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_featureVersion != *((_DWORD *)v4 + 6))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  featureVectors = self->_featureVectors;
  if ((unint64_t)featureVectors | *((_QWORD *)v4 + 2)
    && !-[NSMutableArray isEqual:](featureVectors, "isEqual:"))
  {
    goto LABEL_11;
  }
  deviceIdentifier = self->_deviceIdentifier;
  if ((unint64_t)deviceIdentifier | *((_QWORD *)v4 + 1))
    v7 = -[NSString isEqual:](deviceIdentifier, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_featureVersion;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_featureVectors, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_deviceIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_featureVersion = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 2);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[PeoplePredictionDataMLSEVirtualFeatureStore addFeatureVector:](self, "addFeatureVector:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (v5[1])
    -[PeoplePredictionDataMLSEVirtualFeatureStore setDeviceIdentifier:](self, "setDeviceIdentifier:");

}

- (unsigned)featureVersion
{
  return self->_featureVersion;
}

- (NSMutableArray)featureVectors
{
  return self->_featureVectors;
}

- (void)setFeatureVectors:(id)a3
{
  objc_storeStrong((id *)&self->_featureVectors, a3);
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureVectors, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
