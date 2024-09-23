@implementation APPBAdBatchRequest

- (APPBAdSpecification)specification
{
  return self->_specification;
}

- (void)setSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_specification, a3);
}

- (void)setRequestProperties:(id)a3
{
  objc_storeStrong((id *)&self->_requestProperties, a3);
}

- (void)setRequesters:(id)a3
{
  objc_storeStrong((id *)&self->_requesters, a3);
}

- (NSMutableArray)requesters
{
  return self->_requesters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_specification, 0);
  objc_storeStrong((id *)&self->_resourceCacheEntries, 0);
  objc_storeStrong((id *)&self->_requesters, 0);
  objc_storeStrong((id *)&self->_requestProperties, 0);
  objc_storeStrong((id *)&self->_cachedAds, 0);
}

+ (id)options
{
  if (qword_1002699D0 != -1)
    dispatch_once(&qword_1002699D0, &stru_100215548);
  return (id)qword_1002699C8;
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  APPBRequestProperties *requestProperties;
  APPBAdSpecification *specification;
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
  NSMutableArray *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  NSMutableArray *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];

  v4 = a3;
  v5 = v4;
  requestProperties = self->_requestProperties;
  if (requestProperties)
    PBDataWriterWriteSubmessage(v4, requestProperties, 1);
  specification = self->_specification;
  if (specification)
    PBDataWriterWriteSubmessage(v5, specification, 2);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v8 = self->_resourceCacheEntries;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v41;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v12), 5);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v10);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v13 = self->_cachedAds;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v37;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(v13);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v17), 7);
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v15);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v18 = self->_tags;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v33;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(v18);
        PBDataWriterWriteStringField(v5, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v22), 8);
        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
    }
    while (v20);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v23 = self->_requesters;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v29;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v29 != v26)
          objc_enumerationMutation(v23);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v27), 20);
        v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
    }
    while (v25);
  }

}

- (id)dictionaryRepresentation
{
  void *v3;
  APPBRequestProperties *requestProperties;
  void *v5;
  APPBAdSpecification *specification;
  void *v7;
  id v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  NSMutableArray *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  NSMutableArray *tags;
  id v23;
  NSMutableArray *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *k;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  requestProperties = self->_requestProperties;
  if (requestProperties)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBRequestProperties dictionaryRepresentation](requestProperties, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("requestProperties"));

  }
  specification = self->_specification;
  if (specification)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdSpecification dictionaryRepresentation](specification, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("specification"));

  }
  if (-[NSMutableArray count](self->_resourceCacheEntries, "count"))
  {
    v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_resourceCacheEntries, "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v9 = self->_resourceCacheEntries;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("resourceCacheEntries"));
  }
  if (-[NSMutableArray count](self->_cachedAds, "count"))
  {
    v15 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_cachedAds, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v16 = self->_cachedAds;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(_QWORD *)v36 != v19)
            objc_enumerationMutation(v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j), "dictionaryRepresentation"));
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("cachedAds"));
  }
  tags = self->_tags;
  if (tags)
    objc_msgSend(v3, "setObject:forKey:", tags, CFSTR("tags"));
  if (-[NSMutableArray count](self->_requesters, "count"))
  {
    v23 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_requesters, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v24 = self->_requesters;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v32;
      do
      {
        for (k = 0; k != v26; k = (char *)k + 1)
        {
          if (*(_QWORD *)v32 != v27)
            objc_enumerationMutation(v24);
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)k), "dictionaryRepresentation", (_QWORD)v31));
          objc_msgSend(v23, "addObject:", v29);

        }
        v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      }
      while (v26);
    }

    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("requesters"));
  }
  return v3;
}

- (BOOL)hasRequestProperties
{
  return self->_requestProperties != 0;
}

- (BOOL)hasSpecification
{
  return self->_specification != 0;
}

- (void)clearResourceCacheEntries
{
  -[NSMutableArray removeAllObjects](self->_resourceCacheEntries, "removeAllObjects");
}

- (void)addResourceCacheEntries:(id)a3
{
  id v4;
  NSMutableArray *resourceCacheEntries;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  resourceCacheEntries = self->_resourceCacheEntries;
  v8 = v4;
  if (!resourceCacheEntries)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_resourceCacheEntries;
    self->_resourceCacheEntries = v6;

    v4 = v8;
    resourceCacheEntries = self->_resourceCacheEntries;
  }
  -[NSMutableArray addObject:](resourceCacheEntries, "addObject:", v4);

}

- (unint64_t)resourceCacheEntriesCount
{
  return (unint64_t)-[NSMutableArray count](self->_resourceCacheEntries, "count");
}

- (id)resourceCacheEntriesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_resourceCacheEntries, "objectAtIndex:", a3);
}

+ (Class)resourceCacheEntriesType
{
  return (Class)objc_opt_class(APPBResourceCacheEntry, a2);
}

- (void)clearCachedAds
{
  -[NSMutableArray removeAllObjects](self->_cachedAds, "removeAllObjects");
}

- (void)addCachedAds:(id)a3
{
  id v4;
  NSMutableArray *cachedAds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  cachedAds = self->_cachedAds;
  v8 = v4;
  if (!cachedAds)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_cachedAds;
    self->_cachedAds = v6;

    v4 = v8;
    cachedAds = self->_cachedAds;
  }
  -[NSMutableArray addObject:](cachedAds, "addObject:", v4);

}

- (unint64_t)cachedAdsCount
{
  return (unint64_t)-[NSMutableArray count](self->_cachedAds, "count");
}

- (id)cachedAdsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_cachedAds, "objectAtIndex:", a3);
}

+ (Class)cachedAdsType
{
  return (Class)objc_opt_class(APPBCachedAd, a2);
}

- (void)clearTags
{
  -[NSMutableArray removeAllObjects](self->_tags, "removeAllObjects");
}

- (void)addTags:(id)a3
{
  id v4;
  NSMutableArray *tags;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  tags = self->_tags;
  v8 = v4;
  if (!tags)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_tags;
    self->_tags = v6;

    v4 = v8;
    tags = self->_tags;
  }
  -[NSMutableArray addObject:](tags, "addObject:", v4);

}

- (unint64_t)tagsCount
{
  return (unint64_t)-[NSMutableArray count](self->_tags, "count");
}

- (id)tagsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_tags, "objectAtIndex:", a3);
}

+ (Class)tagsType
{
  return (Class)objc_opt_class(NSString, a2);
}

- (void)clearRequesters
{
  -[NSMutableArray removeAllObjects](self->_requesters, "removeAllObjects");
}

- (void)addRequesters:(id)a3
{
  id v4;
  NSMutableArray *requesters;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  requesters = self->_requesters;
  v8 = v4;
  if (!requesters)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_requesters;
    self->_requesters = v6;

    v4 = v8;
    requesters = self->_requesters;
  }
  -[NSMutableArray addObject:](requesters, "addObject:", v4);

}

- (unint64_t)requestersCount
{
  return (unint64_t)-[NSMutableArray count](self->_requesters, "count");
}

- (id)requestersAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_requesters, "objectAtIndex:", a3);
}

+ (Class)requestersType
{
  return (Class)objc_opt_class(APPBAdRequester, a2);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBAdBatchRequest;
  v3 = -[APPBAdBatchRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdBatchRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAdBatchRequestReadFrom((id *)self, (uint64_t)a3);
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
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  id v20;

  v20 = a3;
  if (self->_requestProperties)
    objc_msgSend(v20, "setRequestProperties:");
  if (self->_specification)
    objc_msgSend(v20, "setSpecification:");
  if (-[APPBAdBatchRequest resourceCacheEntriesCount](self, "resourceCacheEntriesCount"))
  {
    objc_msgSend(v20, "clearResourceCacheEntries");
    v4 = -[APPBAdBatchRequest resourceCacheEntriesCount](self, "resourceCacheEntriesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdBatchRequest resourceCacheEntriesAtIndex:](self, "resourceCacheEntriesAtIndex:", i));
        objc_msgSend(v20, "addResourceCacheEntries:", v7);

      }
    }
  }
  if (-[APPBAdBatchRequest cachedAdsCount](self, "cachedAdsCount"))
  {
    objc_msgSend(v20, "clearCachedAds");
    v8 = -[APPBAdBatchRequest cachedAdsCount](self, "cachedAdsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdBatchRequest cachedAdsAtIndex:](self, "cachedAdsAtIndex:", j));
        objc_msgSend(v20, "addCachedAds:", v11);

      }
    }
  }
  if (-[APPBAdBatchRequest tagsCount](self, "tagsCount"))
  {
    objc_msgSend(v20, "clearTags");
    v12 = -[APPBAdBatchRequest tagsCount](self, "tagsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdBatchRequest tagsAtIndex:](self, "tagsAtIndex:", k));
        objc_msgSend(v20, "addTags:", v15);

      }
    }
  }
  if (-[APPBAdBatchRequest requestersCount](self, "requestersCount"))
  {
    objc_msgSend(v20, "clearRequesters");
    v16 = -[APPBAdBatchRequest requestersCount](self, "requestersCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdBatchRequest requestersAtIndex:](self, "requestersAtIndex:", m));
        objc_msgSend(v20, "addRequesters:", v19);

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
  NSMutableArray *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSMutableArray *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
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
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[APPBRequestProperties copyWithZone:](self->_requestProperties, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[APPBAdSpecification copyWithZone:](self->_specification, "copyWithZone:", a3);
  v9 = (void *)v5[5];
  v5[5] = v8;

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v10 = self->_resourceCacheEntries;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v48;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v48 != v13)
          objc_enumerationMutation(v10);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v14), "copyWithZone:", a3);
        objc_msgSend(v5, "addResourceCacheEntries:", v15);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v12);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v16 = self->_cachedAds;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v44;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v44 != v19)
          objc_enumerationMutation(v16);
        v21 = objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v20), "copyWithZone:", a3);
        objc_msgSend(v5, "addCachedAds:", v21);

        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v18);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v22 = self->_tags;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v40;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v40 != v25)
          objc_enumerationMutation(v22);
        v27 = objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v26), "copyWithZone:", a3);
        objc_msgSend(v5, "addTags:", v27);

        v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    }
    while (v24);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v28 = self->_requesters;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v36;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v36 != v31)
          objc_enumerationMutation(v28);
        v33 = objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v32), "copyWithZone:", a3, (_QWORD)v35);
        objc_msgSend(v5, "addRequesters:", v33);

        v32 = (char *)v32 + 1;
      }
      while (v30 != v32);
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
    }
    while (v30);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  APPBRequestProperties *requestProperties;
  APPBAdSpecification *specification;
  NSMutableArray *resourceCacheEntries;
  NSMutableArray *cachedAds;
  NSMutableArray *tags;
  NSMutableArray *requesters;
  unsigned __int8 v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((requestProperties = self->_requestProperties, !((unint64_t)requestProperties | v4[2]))
     || -[APPBRequestProperties isEqual:](requestProperties, "isEqual:"))
    && ((specification = self->_specification, !((unint64_t)specification | v4[5]))
     || -[APPBAdSpecification isEqual:](specification, "isEqual:"))
    && ((resourceCacheEntries = self->_resourceCacheEntries, !((unint64_t)resourceCacheEntries | v4[4]))
     || -[NSMutableArray isEqual:](resourceCacheEntries, "isEqual:"))
    && ((cachedAds = self->_cachedAds, !((unint64_t)cachedAds | v4[1]))
     || -[NSMutableArray isEqual:](cachedAds, "isEqual:"))
    && ((tags = self->_tags, !((unint64_t)tags | v4[6]))
     || -[NSMutableArray isEqual:](tags, "isEqual:")))
  {
    requesters = self->_requesters;
    if ((unint64_t)requesters | v4[3])
      v11 = -[NSMutableArray isEqual:](requesters, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[APPBRequestProperties hash](self->_requestProperties, "hash");
  v4 = -[APPBAdSpecification hash](self->_specification, "hash") ^ v3;
  v5 = (unint64_t)-[NSMutableArray hash](self->_resourceCacheEntries, "hash");
  v6 = v4 ^ v5 ^ (unint64_t)-[NSMutableArray hash](self->_cachedAds, "hash");
  v7 = (unint64_t)-[NSMutableArray hash](self->_tags, "hash");
  return v6 ^ v7 ^ (unint64_t)-[NSMutableArray hash](self->_requesters, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  APPBRequestProperties *requestProperties;
  uint64_t v6;
  APPBAdSpecification *specification;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *k;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *m;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
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
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];

  v4 = a3;
  requestProperties = self->_requestProperties;
  v6 = *((_QWORD *)v4 + 2);
  if (requestProperties)
  {
    if (v6)
      -[APPBRequestProperties mergeFrom:](requestProperties, "mergeFrom:");
  }
  else if (v6)
  {
    -[APPBAdBatchRequest setRequestProperties:](self, "setRequestProperties:");
  }
  specification = self->_specification;
  v8 = *((_QWORD *)v4 + 5);
  if (specification)
  {
    if (v8)
      -[APPBAdSpecification mergeFrom:](specification, "mergeFrom:");
  }
  else if (v8)
  {
    -[APPBAdBatchRequest setSpecification:](self, "setSpecification:");
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v9 = *((id *)v4 + 4);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(v9);
        -[APPBAdBatchRequest addResourceCacheEntries:](self, "addResourceCacheEntries:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v11);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v14 = *((id *)v4 + 1);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v38 != v17)
          objc_enumerationMutation(v14);
        -[APPBAdBatchRequest addCachedAds:](self, "addCachedAds:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v16);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v19 = *((id *)v4 + 6);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v21; k = (char *)k + 1)
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v19);
        -[APPBAdBatchRequest addTags:](self, "addTags:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)k));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    }
    while (v21);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v24 = *((id *)v4 + 3);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v30;
    do
    {
      for (m = 0; m != v26; m = (char *)m + 1)
      {
        if (*(_QWORD *)v30 != v27)
          objc_enumerationMutation(v24);
        -[APPBAdBatchRequest addRequesters:](self, "addRequesters:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)m), (_QWORD)v29);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
    }
    while (v26);
  }

}

- (APPBRequestProperties)requestProperties
{
  return self->_requestProperties;
}

- (NSMutableArray)resourceCacheEntries
{
  return self->_resourceCacheEntries;
}

- (void)setResourceCacheEntries:(id)a3
{
  objc_storeStrong((id *)&self->_resourceCacheEntries, a3);
}

- (NSMutableArray)cachedAds
{
  return self->_cachedAds;
}

- (void)setCachedAds:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAds, a3);
}

- (NSMutableArray)tags
{
  return self->_tags;
}

- (void)setTags:(id)a3
{
  objc_storeStrong((id *)&self->_tags, a3);
}

@end
