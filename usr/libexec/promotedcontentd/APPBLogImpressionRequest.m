@implementation APPBLogImpressionRequest

+ (id)options
{
  if (qword_100269940 != -1)
    dispatch_once(&qword_100269940, &stru_1002152A8);
  return (id)qword_100269938;
}

- (BOOL)hasMetaData
{
  return self->_metaData != 0;
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

+ (Class)metricType
{
  return (Class)objc_opt_class(APPBAssetMetric, a2);
}

- (void)setScreenSaverActive:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_screenSaverActive = a3;
}

- (void)setHasScreenSaverActive:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasScreenSaverActive
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasMediaContentHash
{
  return self->_mediaContentHash != 0;
}

- (void)setPlaybackTime:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_playbackTime = a3;
}

- (void)setHasPlaybackTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPlaybackTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setInsufficientPlaybackTime:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_insufficientPlaybackTime = a3;
}

- (void)setHasInsufficientPlaybackTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasInsufficientPlaybackTime
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setVisuallyEngaged:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_visuallyEngaged = a3;
}

- (void)setHasVisuallyEngaged:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasVisuallyEngaged
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_type;
  else
    return 1;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_1002152C8 + a3 - 1);
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("contentRequest")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("viewable")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("viewable50Percent")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasContextString
{
  return self->_contextString != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBLogImpressionRequest;
  v3 = -[APPBLogImpressionRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogImpressionRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  APPBLogMetaData *metaData;
  void *v5;
  double v6;
  id v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  NSData *mediaContentHash;
  char has;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  NSString *contextString;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  metaData = self->_metaData;
  if (metaData)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogMetaData dictionaryRepresentation](metaData, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("metaData"));

  }
  if (-[NSMutableArray count](self->_metrics, "count"))
  {
    v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_metrics, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = self->_metrics;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("metric"));
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_screenSaverActive));
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("screenSaverActive"));

  }
  mediaContentHash = self->_mediaContentHash;
  if (mediaContentHash)
    objc_msgSend(v3, "setObject:forKey:", mediaContentHash, CFSTR("mediaContentHash"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(float *)&v6 = self->_playbackTime;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("playbackTime"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_18:
      if ((has & 0x10) == 0)
        goto LABEL_19;
LABEL_23:
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_visuallyEngaged));
      objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("visuallyEngaged"));

      if ((*(_BYTE *)&self->_has & 2) == 0)
        goto LABEL_28;
LABEL_24:
      v20 = self->_type - 1;
      if (v20 >= 3)
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type));
      else
        v21 = *(&off_1002152C8 + v20);
      objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("type"));

      goto LABEL_28;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_18;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_insufficientPlaybackTime));
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("insufficientPlaybackTime"));

  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_23;
LABEL_19:
  if ((has & 2) != 0)
    goto LABEL_24;
LABEL_28:
  contextString = self->_contextString;
  if (contextString)
    objc_msgSend(v3, "setObject:forKey:", contextString, CFSTR("contextString"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBLogImpressionRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  APPBLogMetaData *metaData;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  NSData *mediaContentHash;
  char has;
  NSString *contextString;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = v4;
  metaData = self->_metaData;
  if (metaData)
    PBDataWriterWriteSubmessage(v4, metaData, 1);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_metrics;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), 2);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteBOOLField(v5, self->_screenSaverActive, 3);
  mediaContentHash = self->_mediaContentHash;
  if (mediaContentHash)
    PBDataWriterWriteDataField(v5, mediaContentHash, 4);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField(v5, 5, self->_playbackTime);
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_16:
      if ((has & 0x10) == 0)
        goto LABEL_17;
      goto LABEL_24;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteBOOLField(v5, self->_insufficientPlaybackTime, 6);
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_17:
    if ((has & 2) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_24:
  PBDataWriterWriteBOOLField(v5, self->_visuallyEngaged, 7);
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_18:
    PBDataWriterWriteInt32Field(v5, self->_type, 8);
LABEL_19:
  contextString = self->_contextString;
  if (contextString)
    PBDataWriterWriteStringField(v5, contextString, 9);

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  _BYTE *v8;
  char has;
  _BYTE *v10;

  v10 = a3;
  if (self->_metaData)
    objc_msgSend(v10, "setMetaData:");
  if (-[APPBLogImpressionRequest metricsCount](self, "metricsCount"))
  {
    objc_msgSend(v10, "clearMetrics");
    v4 = -[APPBLogImpressionRequest metricsCount](self, "metricsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogImpressionRequest metricAtIndex:](self, "metricAtIndex:", i));
        objc_msgSend(v10, "addMetric:", v7);

      }
    }
  }
  v8 = v10;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v10[49] = self->_screenSaverActive;
    v10[52] |= 8u;
  }
  if (self->_mediaContentHash)
  {
    objc_msgSend(v10, "setMediaContentHash:");
    v8 = v10;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v8 + 10) = LODWORD(self->_playbackTime);
    v8[52] |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_13:
      if ((has & 0x10) == 0)
        goto LABEL_14;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_13;
  }
  v8[48] = self->_insufficientPlaybackTime;
  v8[52] |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_14:
    if ((has & 2) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_21:
  v8[50] = self->_visuallyEngaged;
  v8[52] |= 0x10u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_15:
    *((_DWORD *)v8 + 11) = self->_type;
    v8[52] |= 2u;
  }
LABEL_16:
  if (self->_contextString)
  {
    objc_msgSend(v10, "setContextString:");
    v8 = v10;
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
  void *i;
  id v13;
  id v14;
  void *v15;
  char has;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[APPBLogMetaData copyWithZone:](self->_metaData, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = self->_metrics;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend(v5, "addMetric:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_BYTE *)v5 + 49) = self->_screenSaverActive;
    *((_BYTE *)v5 + 52) |= 8u;
  }
  v14 = -[NSData copyWithZone:](self->_mediaContentHash, "copyWithZone:", a3, (_QWORD)v20);
  v15 = (void *)v5[2];
  v5[2] = v14;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v5 + 10) = LODWORD(self->_playbackTime);
    *((_BYTE *)v5 + 52) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_12:
      if ((has & 0x10) == 0)
        goto LABEL_13;
LABEL_18:
      *((_BYTE *)v5 + 50) = self->_visuallyEngaged;
      *((_BYTE *)v5 + 52) |= 0x10u;
      if ((*(_BYTE *)&self->_has & 2) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_12;
  }
  *((_BYTE *)v5 + 48) = self->_insufficientPlaybackTime;
  *((_BYTE *)v5 + 52) |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_18;
LABEL_13:
  if ((has & 2) != 0)
  {
LABEL_14:
    *((_DWORD *)v5 + 11) = self->_type;
    *((_BYTE *)v5 + 52) |= 2u;
  }
LABEL_15:
  v17 = -[NSString copyWithZone:](self->_contextString, "copyWithZone:", a3);
  v18 = (void *)v5[1];
  v5[1] = v17;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  APPBLogMetaData *metaData;
  NSMutableArray *metrics;
  char has;
  NSData *mediaContentHash;
  NSString *contextString;
  unsigned __int8 v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_45;
  metaData = self->_metaData;
  if ((unint64_t)metaData | *((_QWORD *)v4 + 3))
  {
    if (!-[APPBLogMetaData isEqual:](metaData, "isEqual:"))
      goto LABEL_45;
  }
  metrics = self->_metrics;
  if ((unint64_t)metrics | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](metrics, "isEqual:"))
      goto LABEL_45;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 8) == 0)
      goto LABEL_45;
    if (self->_screenSaverActive)
    {
      if (!*((_BYTE *)v4 + 49))
        goto LABEL_45;
    }
    else if (*((_BYTE *)v4 + 49))
    {
      goto LABEL_45;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 8) != 0)
  {
    goto LABEL_45;
  }
  mediaContentHash = self->_mediaContentHash;
  if ((unint64_t)mediaContentHash | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](mediaContentHash, "isEqual:"))
      goto LABEL_45;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_playbackTime != *((float *)v4 + 10))
      goto LABEL_45;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_45;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0)
      goto LABEL_45;
    if (self->_insufficientPlaybackTime)
    {
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_45;
    }
    else if (*((_BYTE *)v4 + 48))
    {
      goto LABEL_45;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_45;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 0x10) != 0)
    {
      if (self->_visuallyEngaged)
      {
        if (!*((_BYTE *)v4 + 50))
          goto LABEL_45;
        goto LABEL_38;
      }
      if (!*((_BYTE *)v4 + 50))
        goto LABEL_38;
    }
LABEL_45:
    v10 = 0;
    goto LABEL_46;
  }
  if ((*((_BYTE *)v4 + 52) & 0x10) != 0)
    goto LABEL_45;
LABEL_38:
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_type != *((_DWORD *)v4 + 11))
      goto LABEL_45;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_45;
  }
  contextString = self->_contextString;
  if ((unint64_t)contextString | *((_QWORD *)v4 + 1))
    v10 = -[NSString isEqual:](contextString, "isEqual:");
  else
    v10 = 1;
LABEL_46:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char has;
  unint64_t v8;
  float playbackTime;
  float v10;
  float v11;
  float v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = -[APPBLogMetaData hash](self->_metaData, "hash");
  v4 = (unint64_t)-[NSMutableArray hash](self->_metrics, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v5 = 2654435761 * self->_screenSaverActive;
  else
    v5 = 0;
  v6 = (unint64_t)-[NSData hash](self->_mediaContentHash, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    playbackTime = self->_playbackTime;
    v10 = -playbackTime;
    if (playbackTime >= 0.0)
      v10 = self->_playbackTime;
    v11 = floorf(v10 + 0.5);
    v12 = (float)(v10 - v11) * 1.8447e19;
    v8 = 2654435761u * (unint64_t)fmodf(v11, 1.8447e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0)
        v8 += (unint64_t)v12;
    }
    else
    {
      v8 -= (unint64_t)fabsf(v12);
    }
  }
  else
  {
    v8 = 0;
  }
  if ((has & 4) == 0)
  {
    v13 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_14;
LABEL_17:
    v14 = 0;
    if ((has & 2) != 0)
      goto LABEL_15;
LABEL_18:
    v15 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v13 ^ v14 ^ v15 ^ -[NSString hash](self->_contextString, "hash");
  }
  v13 = 2654435761 * self->_insufficientPlaybackTime;
  if ((has & 0x10) == 0)
    goto LABEL_17;
LABEL_14:
  v14 = 2654435761 * self->_visuallyEngaged;
  if ((has & 2) == 0)
    goto LABEL_18;
LABEL_15:
  v15 = 2654435761 * self->_type;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v13 ^ v14 ^ v15 ^ -[NSString hash](self->_contextString, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  APPBLogMetaData *metaData;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  metaData = self->_metaData;
  v6 = *((_QWORD *)v4 + 3);
  if (metaData)
  {
    if (v6)
      -[APPBLogMetaData mergeFrom:](metaData, "mergeFrom:");
  }
  else if (v6)
  {
    -[APPBLogImpressionRequest setMetaData:](self, "setMetaData:");
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = *((id *)v4 + 4);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        -[APPBLogImpressionRequest addMetric:](self, "addMetric:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), (_QWORD)v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  if ((*((_BYTE *)v4 + 52) & 8) != 0)
  {
    self->_screenSaverActive = *((_BYTE *)v4 + 49);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 2))
    -[APPBLogImpressionRequest setMediaContentHash:](self, "setMediaContentHash:");
  v12 = *((_BYTE *)v4 + 52);
  if ((v12 & 1) != 0)
  {
    self->_playbackTime = *((float *)v4 + 10);
    *(_BYTE *)&self->_has |= 1u;
    v12 = *((_BYTE *)v4 + 52);
    if ((v12 & 4) == 0)
    {
LABEL_19:
      if ((v12 & 0x10) == 0)
        goto LABEL_20;
      goto LABEL_27;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 4) == 0)
  {
    goto LABEL_19;
  }
  self->_insufficientPlaybackTime = *((_BYTE *)v4 + 48);
  *(_BYTE *)&self->_has |= 4u;
  v12 = *((_BYTE *)v4 + 52);
  if ((v12 & 0x10) == 0)
  {
LABEL_20:
    if ((v12 & 2) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_27:
  self->_visuallyEngaged = *((_BYTE *)v4 + 50);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
LABEL_21:
    self->_type = *((_DWORD *)v4 + 11);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_22:
  if (*((_QWORD *)v4 + 1))
    -[APPBLogImpressionRequest setContextString:](self, "setContextString:");

}

- (APPBLogMetaData)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_metaData, a3);
}

- (NSMutableArray)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (BOOL)screenSaverActive
{
  return self->_screenSaverActive;
}

- (NSData)mediaContentHash
{
  return self->_mediaContentHash;
}

- (void)setMediaContentHash:(id)a3
{
  objc_storeStrong((id *)&self->_mediaContentHash, a3);
}

- (float)playbackTime
{
  return self->_playbackTime;
}

- (BOOL)insufficientPlaybackTime
{
  return self->_insufficientPlaybackTime;
}

- (BOOL)visuallyEngaged
{
  return self->_visuallyEngaged;
}

- (NSString)contextString
{
  return self->_contextString;
}

- (void)setContextString:(id)a3
{
  objc_storeStrong((id *)&self->_contextString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_mediaContentHash, 0);
  objc_storeStrong((id *)&self->_contextString, 0);
}

@end
