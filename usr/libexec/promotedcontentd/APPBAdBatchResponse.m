@implementation APPBAdBatchResponse

- (NSMutableArray)ads
{
  return self->_ads;
}

- (BOOL)hasError
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (NSString)batchId
{
  return self->_batchId;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAdBatchResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  void *v3;
  int error;
  __CFString *v5;
  NSString *batchId;
  double v7;
  id v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  $2B0CFA9689D2F4B68112900ADD264E21 has;
  void *v16;
  void *v17;
  NSMutableArray *adsToEvicts;
  NSMutableArray *uRLsToEvicts;
  id v20;
  NSMutableArray *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  id v27;
  NSMutableArray *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *k;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  NSString *configVersion;
  APPBAdSpecification *specification;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    error = self->_error;
    if (error == 1)
    {
      v5 = CFSTR("NO_QUALIFIED");
    }
    else if (error == 2)
    {
      v5 = CFSTR("CONFIGURATION_ERROR");
    }
    else
    {
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_error));
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("error"));

  }
  batchId = self->_batchId;
  if (batchId)
    objc_msgSend(v3, "setObject:forKey:", batchId, CFSTR("batchId"));
  if (-[NSMutableArray count](self->_ads, "count"))
  {
    v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_ads, "count"));
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v9 = self->_ads;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v53 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("ad"));
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_supplyMetrics));
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("supplyMetrics"));

  *(_BYTE *)&has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_21:
    *(float *)&v7 = self->_locationGridSpacing;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7));
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("locationGridSpacing"));

    *(_BYTE *)&has = self->_has;
  }
LABEL_22:
  if ((*(_BYTE *)&has & 8) == 0)
  {
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_errorDetails));
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("errorDetails"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_24:
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_minimumIntervalBeforeNextRequest));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("minimumIntervalBeforeNextRequest"));

  }
LABEL_25:
  adsToEvicts = self->_adsToEvicts;
  if (adsToEvicts)
    objc_msgSend(v3, "setObject:forKey:", adsToEvicts, CFSTR("adsToEvict"));
  uRLsToEvicts = self->_uRLsToEvicts;
  if (uRLsToEvicts)
    objc_msgSend(v3, "setObject:forKey:", uRLsToEvicts, CFSTR("URLsToEvict"));
  if (-[NSMutableArray count](self->_adUpdates, "count"))
  {
    v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_adUpdates, "count"));
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v21 = self->_adUpdates;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(_QWORD *)v49 != v24)
            objc_enumerationMutation(v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)j), "dictionaryRepresentation"));
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      }
      while (v23);
    }

    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("adUpdates"));
  }
  if (-[NSMutableArray count](self->_tagTransformations, "count"))
  {
    v27 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_tagTransformations, "count"));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v28 = self->_tagTransformations;
    v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v45;
      do
      {
        for (k = 0; k != v30; k = (char *)k + 1)
        {
          if (*(_QWORD *)v45 != v31)
            objc_enumerationMutation(v28);
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)k), "dictionaryRepresentation"));
          objc_msgSend(v27, "addObject:", v33);

        }
        v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
      }
      while (v30);
    }

    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("tagTransformations"));
  }
  v34 = (char)self->_has;
  if ((v34 & 2) != 0)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_prefetchInterval));
    objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("prefetchInterval"));

    v34 = (char)self->_has;
  }
  if ((v34 & 0x20) != 0)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_prefetchThreshold));
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("prefetchThreshold"));

  }
  configVersion = self->_configVersion;
  if (configVersion)
    objc_msgSend(v3, "setObject:forKey:", configVersion, CFSTR("configVersion"));
  specification = self->_specification;
  if (specification)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdSpecification dictionaryRepresentation](specification, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("specification"));

  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_clearCache));
    objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("clearCache"));

  }
  return v3;
}

- (void)addAd:(id)a3
{
  id v4;
  NSMutableArray *ads;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  ads = self->_ads;
  v8 = v4;
  if (!ads)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_ads;
    self->_ads = v6;

    v4 = v8;
    ads = self->_ads;
  }
  -[NSMutableArray addObject:](ads, "addObject:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uRLsToEvicts, 0);
  objc_storeStrong((id *)&self->_tagTransformations, 0);
  objc_storeStrong((id *)&self->_specification, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
  objc_storeStrong((id *)&self->_batchId, 0);
  objc_storeStrong((id *)&self->_adsToEvicts, 0);
  objc_storeStrong((id *)&self->_ads, 0);
  objc_storeStrong((id *)&self->_adUpdates, 0);
}

- (int)error
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_error;
  else
    return 1;
}

- (void)setError:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_error = a3;
}

- (void)setHasError:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (id)errorAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("NO_QUALIFIED");
  if (a3 == 2)
    v3 = CFSTR("CONFIGURATION_ERROR");
  else
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsError:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_QUALIFIED")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("CONFIGURATION_ERROR")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (BOOL)hasBatchId
{
  return self->_batchId != 0;
}

- (void)clearAds
{
  -[NSMutableArray removeAllObjects](self->_ads, "removeAllObjects");
}

- (unint64_t)adsCount
{
  return (unint64_t)-[NSMutableArray count](self->_ads, "count");
}

- (id)adAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_ads, "objectAtIndex:", a3);
}

+ (Class)adType
{
  return (Class)objc_opt_class(APPBAdData, a2);
}

- (void)setSupplyMetrics:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_supplyMetrics = a3;
}

- (void)setHasSupplyMetrics:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasSupplyMetrics
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setLocationGridSpacing:(float)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_locationGridSpacing = a3;
}

- (void)setHasLocationGridSpacing:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLocationGridSpacing
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setErrorDetails:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_errorDetails = a3;
}

- (void)setHasErrorDetails:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasErrorDetails
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setMinimumIntervalBeforeNextRequest:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_minimumIntervalBeforeNextRequest = a3;
}

- (void)setHasMinimumIntervalBeforeNextRequest:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMinimumIntervalBeforeNextRequest
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearAdsToEvicts
{
  -[NSMutableArray removeAllObjects](self->_adsToEvicts, "removeAllObjects");
}

- (void)addAdsToEvict:(id)a3
{
  id v4;
  NSMutableArray *adsToEvicts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  adsToEvicts = self->_adsToEvicts;
  v8 = v4;
  if (!adsToEvicts)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_adsToEvicts;
    self->_adsToEvicts = v6;

    v4 = v8;
    adsToEvicts = self->_adsToEvicts;
  }
  -[NSMutableArray addObject:](adsToEvicts, "addObject:", v4);

}

- (unint64_t)adsToEvictsCount
{
  return (unint64_t)-[NSMutableArray count](self->_adsToEvicts, "count");
}

- (id)adsToEvictAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_adsToEvicts, "objectAtIndex:", a3);
}

+ (Class)adsToEvictType
{
  return (Class)objc_opt_class(NSString, a2);
}

- (void)clearURLsToEvicts
{
  -[NSMutableArray removeAllObjects](self->_uRLsToEvicts, "removeAllObjects");
}

- (void)addURLsToEvict:(id)a3
{
  id v4;
  NSMutableArray *uRLsToEvicts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  uRLsToEvicts = self->_uRLsToEvicts;
  v8 = v4;
  if (!uRLsToEvicts)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_uRLsToEvicts;
    self->_uRLsToEvicts = v6;

    v4 = v8;
    uRLsToEvicts = self->_uRLsToEvicts;
  }
  -[NSMutableArray addObject:](uRLsToEvicts, "addObject:", v4);

}

- (unint64_t)uRLsToEvictsCount
{
  return (unint64_t)-[NSMutableArray count](self->_uRLsToEvicts, "count");
}

- (id)uRLsToEvictAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_uRLsToEvicts, "objectAtIndex:", a3);
}

+ (Class)uRLsToEvictType
{
  return (Class)objc_opt_class(NSString, a2);
}

- (void)clearAdUpdates
{
  -[NSMutableArray removeAllObjects](self->_adUpdates, "removeAllObjects");
}

- (void)addAdUpdates:(id)a3
{
  id v4;
  NSMutableArray *adUpdates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  adUpdates = self->_adUpdates;
  v8 = v4;
  if (!adUpdates)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_adUpdates;
    self->_adUpdates = v6;

    v4 = v8;
    adUpdates = self->_adUpdates;
  }
  -[NSMutableArray addObject:](adUpdates, "addObject:", v4);

}

- (unint64_t)adUpdatesCount
{
  return (unint64_t)-[NSMutableArray count](self->_adUpdates, "count");
}

- (id)adUpdatesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_adUpdates, "objectAtIndex:", a3);
}

+ (Class)adUpdatesType
{
  return (Class)objc_opt_class(APPBAdDataUpdate, a2);
}

- (void)clearTagTransformations
{
  -[NSMutableArray removeAllObjects](self->_tagTransformations, "removeAllObjects");
}

- (void)addTagTransformations:(id)a3
{
  id v4;
  NSMutableArray *tagTransformations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  tagTransformations = self->_tagTransformations;
  v8 = v4;
  if (!tagTransformations)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_tagTransformations;
    self->_tagTransformations = v6;

    v4 = v8;
    tagTransformations = self->_tagTransformations;
  }
  -[NSMutableArray addObject:](tagTransformations, "addObject:", v4);

}

- (unint64_t)tagTransformationsCount
{
  return (unint64_t)-[NSMutableArray count](self->_tagTransformations, "count");
}

- (id)tagTransformationsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_tagTransformations, "objectAtIndex:", a3);
}

+ (Class)tagTransformationsType
{
  return (Class)objc_opt_class(APPBTagTransformation, a2);
}

- (void)setPrefetchInterval:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_prefetchInterval = a3;
}

- (void)setHasPrefetchInterval:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPrefetchInterval
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setPrefetchThreshold:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_prefetchThreshold = a3;
}

- (void)setHasPrefetchThreshold:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPrefetchThreshold
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasConfigVersion
{
  return self->_configVersion != 0;
}

- (BOOL)hasSpecification
{
  return self->_specification != 0;
}

- (void)setClearCache:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_clearCache = a3;
}

- (void)setHasClearCache:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasClearCache
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBAdBatchResponse;
  v3 = -[APPBAdBatchResponse description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdBatchResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSString *batchId;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  $2B0CFA9689D2F4B68112900ADD264E21 has;
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  NSMutableArray *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *k;
  NSMutableArray *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *m;
  NSMutableArray *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *n;
  char v33;
  NSString *configVersion;
  APPBAdSpecification *specification;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field(v4, self->_error, 1);
  batchId = self->_batchId;
  if (batchId)
    PBDataWriterWriteStringField(v5, batchId, 2);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v7 = self->_ads;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v53 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i), 3);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v9);
  }

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  PBDataWriterWriteBOOLField(v5, self->_supplyMetrics, 4);
  *(_BYTE *)&has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_14:
    PBDataWriterWriteFloatField(v5, 5, self->_locationGridSpacing);
    *(_BYTE *)&has = self->_has;
  }
LABEL_15:
  if ((*(_BYTE *)&has & 8) == 0)
  {
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  PBDataWriterWriteFixed32Field(v5, self->_errorDetails, 6);
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_17:
    PBDataWriterWriteDoubleField(v5, 8, self->_minimumIntervalBeforeNextRequest);
LABEL_18:
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v13 = self->_adsToEvicts;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(_QWORD *)v49 != v16)
          objc_enumerationMutation(v13);
        PBDataWriterWriteStringField(v5, *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)j), 9);
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
    }
    while (v15);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v18 = self->_uRLsToEvicts;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v45;
    do
    {
      for (k = 0; k != v20; k = (char *)k + 1)
      {
        if (*(_QWORD *)v45 != v21)
          objc_enumerationMutation(v18);
        PBDataWriterWriteStringField(v5, *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)k), 10);
      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
    }
    while (v20);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v23 = self->_adUpdates;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v41;
    do
    {
      for (m = 0; m != v25; m = (char *)m + 1)
      {
        if (*(_QWORD *)v41 != v26)
          objc_enumerationMutation(v23);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)m), 11);
      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
    }
    while (v25);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v28 = self->_tagTransformations;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v36, v56, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v37;
    do
    {
      for (n = 0; n != v30; n = (char *)n + 1)
      {
        if (*(_QWORD *)v37 != v31)
          objc_enumerationMutation(v28);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)n), 12);
      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v36, v56, 16);
    }
    while (v30);
  }

  v33 = (char)self->_has;
  if ((v33 & 2) != 0)
  {
    PBDataWriterWriteDoubleField(v5, 13, self->_prefetchInterval);
    v33 = (char)self->_has;
  }
  if ((v33 & 0x20) != 0)
    PBDataWriterWriteInt32Field(v5, self->_prefetchThreshold, 14);
  configVersion = self->_configVersion;
  if (configVersion)
    PBDataWriterWriteStringField(v5, configVersion, 15);
  specification = self->_specification;
  if (specification)
    PBDataWriterWriteSubmessage(v5, specification, 100);
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    PBDataWriterWriteBOOLField(v5, self->_clearCache, 200);

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  $2B0CFA9689D2F4B68112900ADD264E21 has;
  _DWORD *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t j;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t k;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t m;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t n;
  void *v26;
  char v27;
  _BYTE *v28;
  id v29;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[16] = self->_error;
    *((_BYTE *)v4 + 108) |= 4u;
  }
  v29 = v4;
  if (self->_batchId)
    objc_msgSend(v4, "setBatchId:");
  if (-[APPBAdBatchResponse adsCount](self, "adsCount"))
  {
    objc_msgSend(v29, "clearAds");
    v5 = -[APPBAdBatchResponse adsCount](self, "adsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdBatchResponse adAtIndex:](self, "adAtIndex:", i));
        objc_msgSend(v29, "addAd:", v8);

      }
    }
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    v10 = v29;
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  v10 = v29;
  *((_BYTE *)v29 + 105) = self->_supplyMetrics;
  *((_BYTE *)v29 + 108) |= 0x80u;
  *(_BYTE *)&has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_11:
    v10[18] = LODWORD(self->_locationGridSpacing);
    *((_BYTE *)v10 + 108) |= 0x10u;
    *(_BYTE *)&has = self->_has;
  }
LABEL_12:
  if ((*(_BYTE *)&has & 8) != 0)
  {
    v10[17] = self->_errorDetails;
    *((_BYTE *)v10 + 108) |= 8u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
LABEL_14:
    *((_QWORD *)v10 + 1) = *(_QWORD *)&self->_minimumIntervalBeforeNextRequest;
    *((_BYTE *)v10 + 108) |= 1u;
  }
LABEL_15:
  if (-[APPBAdBatchResponse adsToEvictsCount](self, "adsToEvictsCount"))
  {
    objc_msgSend(v29, "clearAdsToEvicts");
    v11 = -[APPBAdBatchResponse adsToEvictsCount](self, "adsToEvictsCount");
    if (v11)
    {
      v12 = v11;
      for (j = 0; j != v12; ++j)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdBatchResponse adsToEvictAtIndex:](self, "adsToEvictAtIndex:", j));
        objc_msgSend(v29, "addAdsToEvict:", v14);

      }
    }
  }
  if (-[APPBAdBatchResponse uRLsToEvictsCount](self, "uRLsToEvictsCount"))
  {
    objc_msgSend(v29, "clearURLsToEvicts");
    v15 = -[APPBAdBatchResponse uRLsToEvictsCount](self, "uRLsToEvictsCount");
    if (v15)
    {
      v16 = v15;
      for (k = 0; k != v16; ++k)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdBatchResponse uRLsToEvictAtIndex:](self, "uRLsToEvictAtIndex:", k));
        objc_msgSend(v29, "addURLsToEvict:", v18);

      }
    }
  }
  if (-[APPBAdBatchResponse adUpdatesCount](self, "adUpdatesCount"))
  {
    objc_msgSend(v29, "clearAdUpdates");
    v19 = -[APPBAdBatchResponse adUpdatesCount](self, "adUpdatesCount");
    if (v19)
    {
      v20 = v19;
      for (m = 0; m != v20; ++m)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdBatchResponse adUpdatesAtIndex:](self, "adUpdatesAtIndex:", m));
        objc_msgSend(v29, "addAdUpdates:", v22);

      }
    }
  }
  if (-[APPBAdBatchResponse tagTransformationsCount](self, "tagTransformationsCount"))
  {
    objc_msgSend(v29, "clearTagTransformations");
    v23 = -[APPBAdBatchResponse tagTransformationsCount](self, "tagTransformationsCount");
    if (v23)
    {
      v24 = v23;
      for (n = 0; n != v24; ++n)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdBatchResponse tagTransformationsAtIndex:](self, "tagTransformationsAtIndex:", n));
        objc_msgSend(v29, "addTagTransformations:", v26);

      }
    }
  }
  v27 = (char)self->_has;
  v28 = v29;
  if ((v27 & 2) != 0)
  {
    *((_QWORD *)v29 + 2) = *(_QWORD *)&self->_prefetchInterval;
    *((_BYTE *)v29 + 108) |= 2u;
    v27 = (char)self->_has;
  }
  if ((v27 & 0x20) != 0)
  {
    *((_DWORD *)v29 + 19) = self->_prefetchThreshold;
    *((_BYTE *)v29 + 108) |= 0x20u;
  }
  if (self->_configVersion)
  {
    objc_msgSend(v29, "setConfigVersion:");
    v28 = v29;
  }
  if (self->_specification)
  {
    objc_msgSend(v29, "setSpecification:");
    v28 = v29;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    v28[104] = self->_clearCache;
    v28[108] |= 0x40u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  id v14;
  $2B0CFA9689D2F4B68112900ADD264E21 has;
  NSMutableArray *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  id v21;
  NSMutableArray *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *k;
  id v27;
  NSMutableArray *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *m;
  id v33;
  NSMutableArray *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *n;
  id v39;
  char v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5[16] = self->_error;
    *((_BYTE *)v5 + 108) |= 4u;
  }
  v7 = -[NSString copyWithZone:](self->_batchId, "copyWithZone:", a3);
  v8 = (void *)v6[6];
  v6[6] = v7;

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v9 = self->_ads;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v63 != v12)
          objc_enumerationMutation(v9);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3);
        objc_msgSend(v6, "addAd:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    }
    while (v11);
  }

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  *((_BYTE *)v6 + 105) = self->_supplyMetrics;
  *((_BYTE *)v6 + 108) |= 0x80u;
  *(_BYTE *)&has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_12:
    *((_DWORD *)v6 + 18) = LODWORD(self->_locationGridSpacing);
    *((_BYTE *)v6 + 108) |= 0x10u;
    *(_BYTE *)&has = self->_has;
  }
LABEL_13:
  if ((*(_BYTE *)&has & 8) == 0)
  {
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  *((_DWORD *)v6 + 17) = self->_errorDetails;
  *((_BYTE *)v6 + 108) |= 8u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_15:
    v6[1] = *(_QWORD *)&self->_minimumIntervalBeforeNextRequest;
    *((_BYTE *)v6 + 108) |= 1u;
  }
LABEL_16:
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v16 = self->_adsToEvicts;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v59;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v59 != v19)
          objc_enumerationMutation(v16);
        v21 = objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)j), "copyWithZone:", a3);
        objc_msgSend(v6, "addAdsToEvict:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
    }
    while (v18);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v22 = self->_uRLsToEvicts;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v55;
    do
    {
      for (k = 0; k != v24; k = (char *)k + 1)
      {
        if (*(_QWORD *)v55 != v25)
          objc_enumerationMutation(v22);
        v27 = objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)k), "copyWithZone:", a3);
        objc_msgSend(v6, "addURLsToEvict:", v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
    }
    while (v24);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v28 = self->_adUpdates;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v51;
    do
    {
      for (m = 0; m != v30; m = (char *)m + 1)
      {
        if (*(_QWORD *)v51 != v31)
          objc_enumerationMutation(v28);
        v33 = objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)m), "copyWithZone:", a3);
        objc_msgSend(v6, "addAdUpdates:", v33);

      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
    }
    while (v30);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v34 = self->_tagTransformations;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v46, v66, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v47;
    do
    {
      for (n = 0; n != v36; n = (char *)n + 1)
      {
        if (*(_QWORD *)v47 != v37)
          objc_enumerationMutation(v34);
        v39 = objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)n), "copyWithZone:", a3, (_QWORD)v46);
        objc_msgSend(v6, "addTagTransformations:", v39);

      }
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v46, v66, 16);
    }
    while (v36);
  }

  v40 = (char)self->_has;
  if ((v40 & 2) != 0)
  {
    v6[2] = *(_QWORD *)&self->_prefetchInterval;
    *((_BYTE *)v6 + 108) |= 2u;
    v40 = (char)self->_has;
  }
  if ((v40 & 0x20) != 0)
  {
    *((_DWORD *)v6 + 19) = self->_prefetchThreshold;
    *((_BYTE *)v6 + 108) |= 0x20u;
  }
  v41 = -[NSString copyWithZone:](self->_configVersion, "copyWithZone:", a3, (_QWORD)v46);
  v42 = (void *)v6[7];
  v6[7] = v41;

  v43 = -[APPBAdSpecification copyWithZone:](self->_specification, "copyWithZone:", a3);
  v44 = (void *)v6[10];
  v6[10] = v43;

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *((_BYTE *)v6 + 104) = self->_clearCache;
    *((_BYTE *)v6 + 108) |= 0x40u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *batchId;
  NSMutableArray *ads;
  $2B0CFA9689D2F4B68112900ADD264E21 has;
  NSMutableArray *adsToEvicts;
  NSMutableArray *uRLsToEvicts;
  NSMutableArray *adUpdates;
  NSMutableArray *tagTransformations;
  NSString *configVersion;
  APPBAdSpecification *specification;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_59;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 4) == 0 || self->_error != *((_DWORD *)v4 + 16))
      goto LABEL_59;
  }
  else if ((*((_BYTE *)v4 + 108) & 4) != 0)
  {
    goto LABEL_59;
  }
  batchId = self->_batchId;
  if ((unint64_t)batchId | *((_QWORD *)v4 + 6) && !-[NSString isEqual:](batchId, "isEqual:"))
    goto LABEL_59;
  ads = self->_ads;
  if ((unint64_t)ads | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](ads, "isEqual:"))
      goto LABEL_59;
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 0x80) == 0)
      goto LABEL_59;
    if (self->_supplyMetrics)
    {
      if (!*((_BYTE *)v4 + 105))
        goto LABEL_59;
    }
    else if (*((_BYTE *)v4 + 105))
    {
      goto LABEL_59;
    }
  }
  else if ((*((_BYTE *)v4 + 108) & 0x80) != 0)
  {
    goto LABEL_59;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 0x10) == 0 || self->_locationGridSpacing != *((float *)v4 + 18))
      goto LABEL_59;
  }
  else if ((*((_BYTE *)v4 + 108) & 0x10) != 0)
  {
    goto LABEL_59;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 8) == 0 || self->_errorDetails != *((_DWORD *)v4 + 17))
      goto LABEL_59;
  }
  else if ((*((_BYTE *)v4 + 108) & 8) != 0)
  {
    goto LABEL_59;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 1) == 0 || self->_minimumIntervalBeforeNextRequest != *((double *)v4 + 1))
      goto LABEL_59;
  }
  else if ((*((_BYTE *)v4 + 108) & 1) != 0)
  {
    goto LABEL_59;
  }
  adsToEvicts = self->_adsToEvicts;
  if ((unint64_t)adsToEvicts | *((_QWORD *)v4 + 5)
    && !-[NSMutableArray isEqual:](adsToEvicts, "isEqual:"))
  {
    goto LABEL_59;
  }
  uRLsToEvicts = self->_uRLsToEvicts;
  if ((unint64_t)uRLsToEvicts | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](uRLsToEvicts, "isEqual:"))
      goto LABEL_59;
  }
  adUpdates = self->_adUpdates;
  if ((unint64_t)adUpdates | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](adUpdates, "isEqual:"))
      goto LABEL_59;
  }
  tagTransformations = self->_tagTransformations;
  if ((unint64_t)tagTransformations | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](tagTransformations, "isEqual:"))
      goto LABEL_59;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 2) == 0 || self->_prefetchInterval != *((double *)v4 + 2))
      goto LABEL_59;
  }
  else if ((*((_BYTE *)v4 + 108) & 2) != 0)
  {
    goto LABEL_59;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 0x20) == 0 || self->_prefetchThreshold != *((_DWORD *)v4 + 19))
      goto LABEL_59;
  }
  else if ((*((_BYTE *)v4 + 108) & 0x20) != 0)
  {
    goto LABEL_59;
  }
  configVersion = self->_configVersion;
  if ((unint64_t)configVersion | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](configVersion, "isEqual:"))
  {
    goto LABEL_59;
  }
  specification = self->_specification;
  if ((unint64_t)specification | *((_QWORD *)v4 + 10))
  {
    if (!-[APPBAdSpecification isEqual:](specification, "isEqual:"))
      goto LABEL_59;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 0x40) != 0)
    {
      if (self->_clearCache)
      {
        if (!*((_BYTE *)v4 + 104))
          goto LABEL_59;
      }
      else if (*((_BYTE *)v4 + 104))
      {
        goto LABEL_59;
      }
      v14 = 1;
      goto LABEL_60;
    }
LABEL_59:
    v14 = 0;
    goto LABEL_60;
  }
  v14 = (*((_BYTE *)v4 + 108) & 0x40) == 0;
LABEL_60:

  return v14;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  float locationGridSpacing;
  float v6;
  float v7;
  float v8;
  unint64_t v9;
  double minimumIntervalBeforeNextRequest;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  double prefetchInterval;
  double v20;
  long double v21;
  double v22;
  uint64_t v23;
  NSUInteger v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  NSUInteger v33;
  uint64_t v34;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v34 = 2654435761 * self->_error;
  else
    v34 = 0;
  v33 = -[NSString hash](self->_batchId, "hash");
  v32 = (unint64_t)-[NSMutableArray hash](self->_ads, "hash");
  has = (char)self->_has;
  if (has < 0)
  {
    v31 = 2654435761 * self->_supplyMetrics;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_6;
  }
  else
  {
    v31 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
    {
LABEL_6:
      v4 = 0;
      goto LABEL_14;
    }
  }
  locationGridSpacing = self->_locationGridSpacing;
  v6 = -locationGridSpacing;
  if (locationGridSpacing >= 0.0)
    v6 = self->_locationGridSpacing;
  v7 = floorf(v6 + 0.5);
  v8 = (float)(v6 - v7) * 1.8447e19;
  v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v4 += (unint64_t)v8;
  }
  else
  {
    v4 -= (unint64_t)fabsf(v8);
  }
LABEL_14:
  if ((has & 8) != 0)
    v29 = 2654435761 * self->_errorDetails;
  else
    v29 = 0;
  v30 = v4;
  if ((has & 1) != 0)
  {
    minimumIntervalBeforeNextRequest = self->_minimumIntervalBeforeNextRequest;
    v11 = -minimumIntervalBeforeNextRequest;
    if (minimumIntervalBeforeNextRequest >= 0.0)
      v11 = self->_minimumIntervalBeforeNextRequest;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v28 = (unint64_t)-[NSMutableArray hash](self->_adsToEvicts, "hash");
  v14 = (unint64_t)-[NSMutableArray hash](self->_uRLsToEvicts, "hash");
  v15 = (unint64_t)-[NSMutableArray hash](self->_adUpdates, "hash");
  v16 = (unint64_t)-[NSMutableArray hash](self->_tagTransformations, "hash");
  v17 = (char)self->_has;
  if ((v17 & 2) != 0)
  {
    prefetchInterval = self->_prefetchInterval;
    v20 = -prefetchInterval;
    if (prefetchInterval >= 0.0)
      v20 = self->_prefetchInterval;
    v21 = floor(v20 + 0.5);
    v22 = (v20 - v21) * 1.84467441e19;
    v18 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0)
        v18 += (unint64_t)v22;
    }
    else
    {
      v18 -= (unint64_t)fabs(v22);
    }
  }
  else
  {
    v18 = 0;
  }
  if ((v17 & 0x20) != 0)
    v23 = 2654435761 * self->_prefetchThreshold;
  else
    v23 = 0;
  v24 = -[NSString hash](self->_configVersion, "hash");
  v25 = -[APPBAdSpecification hash](self->_specification, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v26 = 2654435761 * self->_clearCache;
  else
    v26 = 0;
  return v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v29 ^ v9 ^ v28 ^ v14 ^ v15 ^ v16 ^ v18 ^ v23 ^ v24 ^ v25 ^ v26;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  char *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  int v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *k;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *m;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *n;
  char v32;
  APPBAdSpecification *specification;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];

  v4 = (char *)a3;
  v5 = v4;
  if ((v4[108] & 4) != 0)
  {
    self->_error = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 6))
    -[APPBAdBatchResponse setBatchId:](self, "setBatchId:");
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v6 = *((id *)v5 + 4);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v52 != v9)
          objc_enumerationMutation(v6);
        -[APPBAdBatchResponse addAd:](self, "addAd:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v8);
  }

  v11 = v5[108];
  if ((v11 & 0x80000000) == 0)
  {
    if ((v11 & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  self->_supplyMetrics = v5[105];
  *(_BYTE *)&self->_has |= 0x80u;
  LOBYTE(v11) = v5[108];
  if ((v11 & 0x10) != 0)
  {
LABEL_14:
    self->_locationGridSpacing = *((float *)v5 + 18);
    *(_BYTE *)&self->_has |= 0x10u;
    LOBYTE(v11) = v5[108];
  }
LABEL_15:
  if ((v11 & 8) == 0)
  {
    if ((v11 & 1) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  self->_errorDetails = *((_DWORD *)v5 + 17);
  *(_BYTE *)&self->_has |= 8u;
  if ((v5[108] & 1) != 0)
  {
LABEL_17:
    self->_minimumIntervalBeforeNextRequest = *((double *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_18:
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v12 = *((id *)v5 + 5);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v48 != v15)
          objc_enumerationMutation(v12);
        -[APPBAdBatchResponse addAdsToEvict:](self, "addAdsToEvict:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
    }
    while (v14);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v17 = *((id *)v5 + 12);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v44;
    do
    {
      for (k = 0; k != v19; k = (char *)k + 1)
      {
        if (*(_QWORD *)v44 != v20)
          objc_enumerationMutation(v17);
        -[APPBAdBatchResponse addURLsToEvict:](self, "addURLsToEvict:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)k));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
    }
    while (v19);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v22 = *((id *)v5 + 3);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v56, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v40;
    do
    {
      for (m = 0; m != v24; m = (char *)m + 1)
      {
        if (*(_QWORD *)v40 != v25)
          objc_enumerationMutation(v22);
        -[APPBAdBatchResponse addAdUpdates:](self, "addAdUpdates:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)m));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v56, 16);
    }
    while (v24);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v27 = *((id *)v5 + 11);
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v55, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v36;
    do
    {
      for (n = 0; n != v29; n = (char *)n + 1)
      {
        if (*(_QWORD *)v36 != v30)
          objc_enumerationMutation(v27);
        -[APPBAdBatchResponse addTagTransformations:](self, "addTagTransformations:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)n), (_QWORD)v35);
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v55, 16);
    }
    while (v29);
  }

  v32 = v5[108];
  if ((v32 & 2) != 0)
  {
    self->_prefetchInterval = *((double *)v5 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v32 = v5[108];
  }
  if ((v32 & 0x20) != 0)
  {
    self->_prefetchThreshold = *((_DWORD *)v5 + 19);
    *(_BYTE *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v5 + 7))
    -[APPBAdBatchResponse setConfigVersion:](self, "setConfigVersion:");
  specification = self->_specification;
  v34 = *((_QWORD *)v5 + 10);
  if (specification)
  {
    if (v34)
      -[APPBAdSpecification mergeFrom:](specification, "mergeFrom:");
  }
  else if (v34)
  {
    -[APPBAdBatchResponse setSpecification:](self, "setSpecification:");
  }
  if ((v5[108] & 0x40) != 0)
  {
    self->_clearCache = v5[104];
    *(_BYTE *)&self->_has |= 0x40u;
  }

}

- (void)setBatchId:(id)a3
{
  objc_storeStrong((id *)&self->_batchId, a3);
}

- (void)setAds:(id)a3
{
  objc_storeStrong((id *)&self->_ads, a3);
}

- (BOOL)supplyMetrics
{
  return self->_supplyMetrics;
}

- (float)locationGridSpacing
{
  return self->_locationGridSpacing;
}

- (unsigned)errorDetails
{
  return self->_errorDetails;
}

- (double)minimumIntervalBeforeNextRequest
{
  return self->_minimumIntervalBeforeNextRequest;
}

- (NSMutableArray)adsToEvicts
{
  return self->_adsToEvicts;
}

- (void)setAdsToEvicts:(id)a3
{
  objc_storeStrong((id *)&self->_adsToEvicts, a3);
}

- (NSMutableArray)uRLsToEvicts
{
  return self->_uRLsToEvicts;
}

- (void)setURLsToEvicts:(id)a3
{
  objc_storeStrong((id *)&self->_uRLsToEvicts, a3);
}

- (NSMutableArray)adUpdates
{
  return self->_adUpdates;
}

- (void)setAdUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_adUpdates, a3);
}

- (NSMutableArray)tagTransformations
{
  return self->_tagTransformations;
}

- (void)setTagTransformations:(id)a3
{
  objc_storeStrong((id *)&self->_tagTransformations, a3);
}

- (double)prefetchInterval
{
  return self->_prefetchInterval;
}

- (int)prefetchThreshold
{
  return self->_prefetchThreshold;
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (void)setConfigVersion:(id)a3
{
  objc_storeStrong((id *)&self->_configVersion, a3);
}

- (APPBAdSpecification)specification
{
  return self->_specification;
}

- (void)setSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_specification, a3);
}

- (BOOL)clearCache
{
  return self->_clearCache;
}

@end
