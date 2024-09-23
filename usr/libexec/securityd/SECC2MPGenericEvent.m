@implementation SECC2MPGenericEvent

- (int)type
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;

  if (a3 > 200)
  {
    if (a3 == 201)
      return CFSTR("cloudkit_client");
    if (a3 == 301)
      return CFSTR("server");
    goto LABEL_10;
  }
  if (!a3)
    return CFSTR("none");
  if (a3 != 101)
  {
LABEL_10:
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
    return v3;
  }
  v3 = CFSTR("cloudkit");
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("none")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("cloudkit")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("cloudkit_client")) & 1) != 0)
  {
    v4 = 201;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("server")))
  {
    v4 = 301;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setTimestampStart:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestampStart = a3;
}

- (void)setHasTimestampStart:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestampStart
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTimestampEnd:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestampEnd = a3;
}

- (void)setHasTimestampEnd:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestampEnd
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearMetrics
{
  -[NSMutableArray removeAllObjects](self->_metrics, "removeAllObjects");
}

- (void)addMetric:(id)a3
{
  id v4;
  NSMutableArray *metrics;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  metrics = self->_metrics;
  v8 = v4;
  if (!metrics)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_metrics;
    self->_metrics = v6;

    v4 = v8;
    metrics = self->_metrics;
  }
  -[NSMutableArray addObject:](metrics, "addObject:", v4);

}

- (unint64_t)metricsCount
{
  return (unint64_t)-[NSMutableArray count](self->_metrics, "count");
}

- (id)metricAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_metrics, "objectAtIndex:", a3);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SECC2MPGenericEvent;
  v3 = -[SECC2MPGenericEvent description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPGenericEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int type;
  __CFString *v5;
  NSString *name;
  char has;
  void *v8;
  void *v9;
  id v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    type = self->_type;
    if (type > 200)
    {
      if (type == 201)
      {
        v5 = CFSTR("cloudkit_client");
        goto LABEL_12;
      }
      if (type == 301)
      {
        v5 = CFSTR("server");
        goto LABEL_12;
      }
    }
    else
    {
      if (!type)
      {
        v5 = CFSTR("none");
        goto LABEL_12;
      }
      if (type == 101)
      {
        v5 = CFSTR("cloudkit");
LABEL_12:
        objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

        goto LABEL_13;
      }
    }
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type));
    goto LABEL_12;
  }
LABEL_13:
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestampStart));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("timestamp_start"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestampEnd));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("timestamp_end"));

  }
  if (-[NSMutableArray count](self->_metrics, "count"))
  {
    v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_metrics, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = self->_metrics;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("metric"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000B2D70((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSString *name;
  char has;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field(v4, self->_type, 1);
  name = self->_name;
  if (name)
    PBDataWriterWriteStringField(v5, name, 101);
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field(v5, self->_timestampStart, 201);
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint64Field(v5, self->_timestampEnd, 202);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_metrics;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), 301);
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  _DWORD *v10;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[10] = self->_type;
    *((_BYTE *)v4 + 44) |= 4u;
  }
  v10 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_timestampStart;
    *((_BYTE *)v4 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_timestampEnd;
    *((_BYTE *)v4 + 44) |= 1u;
  }
  if (-[SECC2MPGenericEvent metricsCount](self, "metricsCount"))
  {
    objc_msgSend(v10, "clearMetrics");
    v6 = -[SECC2MPGenericEvent metricsCount](self, "metricsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPGenericEvent metricAtIndex:](self, "metricAtIndex:", i));
        objc_msgSend(v10, "addMetric:", v9);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  char has;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5[10] = self->_type;
    *((_BYTE *)v5 + 44) |= 4u;
  }
  v7 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v8 = (void *)v6[4];
  v6[4] = v7;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v6[2] = self->_timestampStart;
    *((_BYTE *)v6 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v6[1] = self->_timestampEnd;
    *((_BYTE *)v6 + 44) |= 1u;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_metrics;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend(v6, "addMetric:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *name;
  NSMutableArray *metrics;
  unsigned __int8 v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_22;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 44);
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_type != *((_DWORD *)v4 + 10))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_22;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
    {
LABEL_22:
      v9 = 0;
      goto LABEL_23;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 44);
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_timestampStart != *((_QWORD *)v4 + 2))
      goto LABEL_22;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_22;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_timestampEnd != *((_QWORD *)v4 + 1))
      goto LABEL_22;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_22;
  }
  metrics = self->_metrics;
  if ((unint64_t)metrics | *((_QWORD *)v4 + 3))
    v9 = -[NSMutableArray isEqual:](metrics, "isEqual:");
  else
    v9 = 1;
LABEL_23:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_name, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761u * self->_timestampStart;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_8:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ (unint64_t)-[NSMutableArray hash](self->_metrics, "hash");
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_6:
  v6 = 2654435761u * self->_timestampEnd;
  return v4 ^ v3 ^ v5 ^ v6 ^ (unint64_t)-[NSMutableArray hash](self->_metrics, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  char v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v5 = v4;
  if ((v4[11] & 4) != 0)
  {
    self->_type = v4[10];
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 4))
    -[SECC2MPGenericEvent setName:](self, "setName:");
  v6 = *((_BYTE *)v5 + 44);
  if ((v6 & 2) != 0)
  {
    self->_timestampStart = *((_QWORD *)v5 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v5 + 44);
  }
  if ((v6 & 1) != 0)
  {
    self->_timestampEnd = *((_QWORD *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v5 + 3);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[SECC2MPGenericEvent addMetric:](self, "addMetric:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unint64_t)timestampStart
{
  return self->_timestampStart;
}

- (unint64_t)timestampEnd
{
  return self->_timestampEnd;
}

- (NSMutableArray)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

+ (Class)metricType
{
  return (Class)objc_opt_class(SECC2MPGenericEventMetric);
}

@end
