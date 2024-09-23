@implementation BMMultiStreamVectorClockConverter

- (BMMultiStreamVectorClockConverter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BMMultiStreamVectorClockConverter;
  return -[BMMultiStreamVectorClockConverter init](&v3, "init");
}

+ (id)_reinitializeSiteIdentifier:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modifier"));

  if (!v4)
  {
    v5 = __biome_log_for_category(11);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      sub_1000414E0((uint64_t)v3, v6);

  }
  v7 = objc_alloc((Class)CKDistributedSiteIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modifier"));
  v10 = objc_msgSend(v7, "initWithIdentifier:modifier:", v8, v9);

  return v10;
}

+ (id)timestampVectorToTimeStampClockVector:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)objc_opt_new(CKDistributedTimestampClockVector);
  v16 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamps"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "siteIdentifierObject"));
        v13 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndex:", objc_msgSend(v11, "clockValue"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_reinitializeSiteIdentifier:", v12));
        objc_msgSend(v5, "addClockValuesInIndexSet:forSiteIdentifier:", v13, v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)timestampClockVectorToTimeStampVector:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  int *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[4];
  int v25;
  _BYTE v26[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allSiteIdentifiers"));
  v6 = objc_opt_new(NSMutableArray);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    v18 = &v25;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(obj);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_reinitializeSiteIdentifier:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v10), v18));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clockValuesForSiteIdentifier:", v11));
        if ((unint64_t)objc_msgSend(v12, "count") >= 2)
        {
          v13 = __biome_log_for_category(11);
          v14 = objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
            sub_100041554(v24, v12, v18, v14);

        }
        v15 = objc_msgSend(objc_alloc((Class)CKDistributedTimestamp), "initWithSiteIdentifierObject:clockValue:", v11, objc_msgSend(v12, "lastIndex"));
        -[NSMutableArray addObject:](v6, "addObject:", v15);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v8);
  }

  v16 = objc_msgSend(objc_alloc((Class)CKDistributedTimestampVector), "initWithTimestamps:", v6);
  return v16;
}

+ (id)multiStreamTimestampClockVectorToVectorClock:(id)a3
{
  id v3;
  BMMultiStreamVectorClock *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v4 = objc_alloc_init(BMMultiStreamVectorClock);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v8);
        v10 = objc_autoreleasePoolPush();
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timestampClockVectorForStreamIdentifier:", v9));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[BMMultiStreamVectorClockConverter timestampClockVectorToTimeStampVector:](BMMultiStreamVectorClockConverter, "timestampClockVectorToTimeStampVector:", v11));
        -[BMMultiStreamVectorClock setVectorClockTo:forStreamIdentifier:](v4, "setVectorClockTo:forStreamIdentifier:", v12, v9);

        objc_autoreleasePoolPop(v10);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v4;
}

+ (id)multiStreamVectorClockToTimestampVectorClock:(id)a3
{
  id v3;
  BMMultiStreamTimestampClockVector *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v4 = objc_alloc_init(BMMultiStreamTimestampClockVector);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v8);
        v10 = objc_autoreleasePoolPush();
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "vectorClockForStreamIdentifier:", v9));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[BMMultiStreamVectorClockConverter timestampVectorToTimeStampClockVector:](BMMultiStreamVectorClockConverter, "timestampVectorToTimeStampClockVector:", v11));
        -[BMMultiStreamTimestampClockVector setVectorClockTo:forStreamIdentifier:](v4, "setVectorClockTo:forStreamIdentifier:", v12, v9);

        objc_autoreleasePoolPop(v10);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v4;
}

+ (id)rangeTimestampClockVectorFromIndexClockVector:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  char *v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)objc_opt_new(CKDistributedTimestampClockVector);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allSiteIdentifiers"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_reinitializeSiteIdentifier:", v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clockValuesForSiteIdentifier:", v11));
        if (objc_msgSend(v12, "count") == (id)1)
        {
          v13 = (char *)objc_msgSend(v12, "firstIndex");
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v13 + 1, 0x7FFFFFFFFFFFFFFDLL - (_QWORD)v13));
          objc_msgSend(v5, "addClockValuesInIndexSet:forSiteIdentifier:", v14, v10);

        }
        else
        {
          objc_msgSend(v5, "addClockValuesInIndexSet:forSiteIdentifier:", v12, v11);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v5;
}

+ (id)multiStreamRangeClockVectorFromIndexClockVectors:(id)a3
{
  id v4;
  BMMultiStreamTimestampClockVector *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = objc_alloc_init(BMMultiStreamTimestampClockVector);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9);
        v11 = objc_autoreleasePoolPush();
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestampClockVectorForStreamIdentifier:", v10));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "rangeTimestampClockVectorFromIndexClockVector:", v12));
        -[BMMultiStreamTimestampClockVector setVectorClockTo:forStreamIdentifier:](v5, "setVectorClockTo:forStreamIdentifier:", v13, v10);

        objc_autoreleasePoolPop(v11);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v5;
}

@end
