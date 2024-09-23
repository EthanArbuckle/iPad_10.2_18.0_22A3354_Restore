@implementation APPBLogAggregateMetricsRequest

+ (id)options
{
  if (qword_100269810 != -1)
    dispatch_once(&qword_100269810, &stru_100214A98);
  return (id)qword_100269808;
}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (BOOL)hasOperatingSystemDescription
{
  return self->_operatingSystemDescription != 0;
}

- (void)clearDistributionMetrics
{
  -[NSMutableArray removeAllObjects](self->_distributionMetrics, "removeAllObjects");
}

- (void)addDistributionMetrics:(id)a3
{
  id v4;
  NSMutableArray *distributionMetrics;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  distributionMetrics = self->_distributionMetrics;
  v8 = v4;
  if (!distributionMetrics)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_distributionMetrics;
    self->_distributionMetrics = v6;

    v4 = v8;
    distributionMetrics = self->_distributionMetrics;
  }
  -[NSMutableArray addObject:](distributionMetrics, "addObject:", v4);

}

- (unint64_t)distributionMetricsCount
{
  return (unint64_t)-[NSMutableArray count](self->_distributionMetrics, "count");
}

- (id)distributionMetricsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_distributionMetrics, "objectAtIndex:", a3);
}

+ (Class)distributionMetricsType
{
  return (Class)objc_opt_class(APPBAggregateDistributionMetric, a2);
}

- (void)clearScalarMetrics
{
  -[NSMutableArray removeAllObjects](self->_scalarMetrics, "removeAllObjects");
}

- (void)addScalarMetrics:(id)a3
{
  id v4;
  NSMutableArray *scalarMetrics;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  scalarMetrics = self->_scalarMetrics;
  v8 = v4;
  if (!scalarMetrics)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_scalarMetrics;
    self->_scalarMetrics = v6;

    v4 = v8;
    scalarMetrics = self->_scalarMetrics;
  }
  -[NSMutableArray addObject:](scalarMetrics, "addObject:", v4);

}

- (unint64_t)scalarMetricsCount
{
  return (unint64_t)-[NSMutableArray count](self->_scalarMetrics, "count");
}

- (id)scalarMetricsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_scalarMetrics, "objectAtIndex:", a3);
}

+ (Class)scalarMetricsType
{
  return (Class)objc_opt_class(APPBAggregateScalarMetric, a2);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBLogAggregateMetricsRequest;
  v3 = -[APPBLogAggregateMetricsRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogAggregateMetricsRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *deviceModel;
  NSString *operatingSystemDescription;
  id v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  NSMutableArray *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  deviceModel = self->_deviceModel;
  if (deviceModel)
    objc_msgSend(v3, "setObject:forKey:", deviceModel, CFSTR("deviceModel"));
  operatingSystemDescription = self->_operatingSystemDescription;
  if (operatingSystemDescription)
    objc_msgSend(v4, "setObject:forKey:", operatingSystemDescription, CFSTR("operatingSystemDescription"));
  if (-[NSMutableArray count](self->_distributionMetrics, "count"))
  {
    v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_distributionMetrics, "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = self->_distributionMetrics;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("distributionMetrics"));
  }
  if (-[NSMutableArray count](self->_scalarMetrics, "count"))
  {
    v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_scalarMetrics, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = self->_scalarMetrics;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j), "dictionaryRepresentation", (_QWORD)v22));
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v17);
    }

    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("scalarMetrics"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBLogAggregateMetricsRequestReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSString *deviceModel;
  NSString *operatingSystemDescription;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  v4 = a3;
  v5 = v4;
  deviceModel = self->_deviceModel;
  if (deviceModel)
    PBDataWriterWriteStringField(v4, deviceModel, 1);
  operatingSystemDescription = self->_operatingSystemDescription;
  if (operatingSystemDescription)
    PBDataWriterWriteStringField(v5, operatingSystemDescription, 2);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = self->_distributionMetrics;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v12), 100);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v10);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = self->_scalarMetrics;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v17), 101);
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
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
  if (self->_deviceModel)
    objc_msgSend(v12, "setDeviceModel:");
  if (self->_operatingSystemDescription)
    objc_msgSend(v12, "setOperatingSystemDescription:");
  if (-[APPBLogAggregateMetricsRequest distributionMetricsCount](self, "distributionMetricsCount"))
  {
    objc_msgSend(v12, "clearDistributionMetrics");
    v4 = -[APPBLogAggregateMetricsRequest distributionMetricsCount](self, "distributionMetricsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogAggregateMetricsRequest distributionMetricsAtIndex:](self, "distributionMetricsAtIndex:", i));
        objc_msgSend(v12, "addDistributionMetrics:", v7);

      }
    }
  }
  if (-[APPBLogAggregateMetricsRequest scalarMetricsCount](self, "scalarMetricsCount"))
  {
    objc_msgSend(v12, "clearScalarMetrics");
    v8 = -[APPBLogAggregateMetricsRequest scalarMetricsCount](self, "scalarMetricsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogAggregateMetricsRequest scalarMetricsAtIndex:](self, "scalarMetricsAtIndex:", j));
        objc_msgSend(v12, "addScalarMetrics:", v11);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSMutableArray *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_deviceModel, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_operatingSystemDescription, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = self->_distributionMetrics;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v14), "copyWithZone:", a3);
        objc_msgSend(v5, "addDistributionMetrics:", v15);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v12);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = self->_scalarMetrics;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v20), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend(v5, "addScalarMetrics:", v21);

        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *deviceModel;
  NSString *operatingSystemDescription;
  NSMutableArray *distributionMetrics;
  NSMutableArray *scalarMetrics;
  unsigned __int8 v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((deviceModel = self->_deviceModel, !((unint64_t)deviceModel | v4[1]))
     || -[NSString isEqual:](deviceModel, "isEqual:"))
    && ((operatingSystemDescription = self->_operatingSystemDescription,
         !((unint64_t)operatingSystemDescription | v4[3]))
     || -[NSString isEqual:](operatingSystemDescription, "isEqual:"))
    && ((distributionMetrics = self->_distributionMetrics, !((unint64_t)distributionMetrics | v4[2]))
     || -[NSMutableArray isEqual:](distributionMetrics, "isEqual:")))
  {
    scalarMetrics = self->_scalarMetrics;
    if ((unint64_t)scalarMetrics | v4[4])
      v9 = -[NSMutableArray isEqual:](scalarMetrics, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_deviceModel, "hash");
  v4 = -[NSString hash](self->_operatingSystemDescription, "hash") ^ v3;
  v5 = (unint64_t)-[NSMutableArray hash](self->_distributionMetrics, "hash");
  return v4 ^ v5 ^ (unint64_t)-[NSMutableArray hash](self->_scalarMetrics, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
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
  if (*((_QWORD *)v4 + 1))
    -[APPBLogAggregateMetricsRequest setDeviceModel:](self, "setDeviceModel:");
  if (*((_QWORD *)v4 + 3))
    -[APPBLogAggregateMetricsRequest setOperatingSystemDescription:](self, "setOperatingSystemDescription:");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = *((id *)v4 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[APPBLogAggregateMetricsRequest addDistributionMetrics:](self, "addDistributionMetrics:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *((id *)v4 + 4);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[APPBLogAggregateMetricsRequest addScalarMetrics:](self, "addScalarMetrics:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)j), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModel, a3);
}

- (NSString)operatingSystemDescription
{
  return self->_operatingSystemDescription;
}

- (void)setOperatingSystemDescription:(id)a3
{
  objc_storeStrong((id *)&self->_operatingSystemDescription, a3);
}

- (NSMutableArray)distributionMetrics
{
  return self->_distributionMetrics;
}

- (void)setDistributionMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_distributionMetrics, a3);
}

- (NSMutableArray)scalarMetrics
{
  return self->_scalarMetrics;
}

- (void)setScalarMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_scalarMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scalarMetrics, 0);
  objc_storeStrong((id *)&self->_operatingSystemDescription, 0);
  objc_storeStrong((id *)&self->_distributionMetrics, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
}

@end
