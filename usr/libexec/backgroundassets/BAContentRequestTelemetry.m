@implementation BAContentRequestTelemetry

- (BAContentRequestTelemetry)initWithContentRequest:(int64_t)a3 applicationIdentifier:(id)a4 installSource:(int64_t)a5 downloads:(id)a6
{
  id v11;
  id v12;
  BAContentRequestTelemetry *v13;
  BAContentRequestTelemetry *v14;
  uint64_t v15;
  NSMutableArray *fileSizes;
  uint64_t v17;
  NSMutableDictionary *uniqueErrorCounts;
  uint64_t v19;
  NSMutableSet *remainingDownloadUniqueIdentifiers;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  NSMutableSet *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];

  v11 = a4;
  v12 = a6;
  v33.receiver = self;
  v33.super_class = (Class)BAContentRequestTelemetry;
  v13 = -[BAContentRequestTelemetry init](&v33, "init");
  v14 = v13;
  if (v13)
  {
    v13->_contentRequest = a3;
    v13->_installSource = a5;
    objc_storeStrong((id *)&v13->_applicationIdentifier, a4);
    v14->_invalid = 0;
    v15 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    fileSizes = v14->_fileSizes;
    v14->_fileSizes = (NSMutableArray *)v15;

    v17 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    uniqueErrorCounts = v14->_uniqueErrorCounts;
    v14->_uniqueErrorCounts = (NSMutableDictionary *)v17;

    v19 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v12, "count")));
    remainingDownloadUniqueIdentifiers = v14->_remainingDownloadUniqueIdentifiers;
    v14->_remainingDownloadUniqueIdentifiers = (NSMutableSet *)v19;

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v21 = v12;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v30;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v30 != v24)
            objc_enumerationMutation(v21);
          v26 = v14->_remainingDownloadUniqueIdentifiers;
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v25), "uniqueIdentifier", (_QWORD)v29));
          -[NSMutableSet addObject:](v26, "addObject:", v27);

          v25 = (char *)v25 + 1;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v23);
    }

  }
  return v14;
}

- (void)recordDownloadCompletion:(id)a3 error:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _UNKNOWN **v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  int v24;
  NSObject *v25;

  v6 = a3;
  v7 = (unint64_t)a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BAContentRequestTelemetry remainingDownloadUniqueIdentifiers](self, "remainingDownloadUniqueIdentifiers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueIdentifier"));
  v10 = objc_msgSend(v8, "containsObject:", v9);

  if ((v10 & 1) == 0)
  {
    v20 = sub_1000128F4();
    v14 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueIdentifier"));
    v24 = 138543362;
    v25 = v21;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "BAContentRequestTelemetry informed about unknown download with identifier %{public}@", (uint8_t *)&v24, 0xCu);
LABEL_11:

    goto LABEL_12;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BAContentRequestTelemetry remainingDownloadUniqueIdentifiers](self, "remainingDownloadUniqueIdentifiers"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueIdentifier"));
  objc_msgSend(v11, "removeObject:", v12);

  os_unfair_lock_lock((os_unfair_lock_t)objc_msgSend(v6, "downloadLock"));
  v13 = objc_msgSend(v6, "necessity");
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "downloadedFileSize"));
  os_unfair_lock_unlock((os_unfair_lock_t)objc_msgSend(v6, "downloadLock"));
  if (self->_invalid || !(v7 | v14))
  {
    self->_invalid = 1;
    v22 = sub_1000128F4();
    v21 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_100034F78((uint64_t)v6, v21);
    goto LABEL_11;
  }
  if (v7)
  {
    ++self->_failureCount;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v7, "domain"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v15, objc_msgSend((id)v7, "code"), 0));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BAContentRequestTelemetry uniqueErrorCounts](self, "uniqueErrorCounts"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", v16));

    if (v18)
    {
      v19 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v18, "intValue") + 1));

    }
    else
    {
      v19 = &off_10005BED8;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BAContentRequestTelemetry uniqueErrorCounts](self, "uniqueErrorCounts"));
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v19, v16);

  }
  else
  {
    ++self->_successCount;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BAContentRequestTelemetry fileSizes](self, "fileSizes"));
    objc_msgSend(v16, "addObject:", v14);
  }

  if (v13 == (id)1)
    ++self->_essentialAssetsCount;
  else
    ++self->_optionalAssetsCount;
LABEL_12:

}

- (BOOL)allDownloadsCompleted
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BAContentRequestTelemetry remainingDownloadUniqueIdentifiers](self, "remainingDownloadUniqueIdentifiers"));
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (id)eventName
{
  return CFSTR("com.apple.BackgroundAssets.ContentRequestV2");
}

- (id)payload
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  NSString *applicationIdentifier;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[11];
  _QWORD v26[11];

  if (self->_invalid)
    return &__NSDictionary0__struct;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAContentRequestTelemetry eventPayload](self, "eventPayload"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAContentRequestTelemetry _formatMostFrequentError](self, "_formatMostFrequentError"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BAContentRequestTelemetry fileSizes](self, "fileSizes"));
    objc_msgSend(v6, "sortUsingSelector:", "compare:");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAContentRequestTelemetry fileSizes](self, "fileSizes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BAContentRequestTelemetry _median:](self, "_median:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BAContentRequestTelemetry fileSizes](self, "fileSizes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BAContentRequestTelemetry _average:](self, "_average:", v9));

    v11 = sub_10000C400(self->_installSource);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v25[0] = CFSTR("AssetCount");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (self->_optionalAssetsCount + self->_essentialAssetsCount)));
    v26[0] = v23;
    v25[1] = CFSTR("SuccessCount");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_successCount));
    v26[1] = v22;
    v25[2] = CFSTR("FailureCount");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_failureCount));
    v26[2] = v21;
    v25[3] = CFSTR("EssentialAssetsCount");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_essentialAssetsCount));
    v26[3] = v20;
    v25[4] = CFSTR("OptionalAssetsCount");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_optionalAssetsCount));
    v26[4] = v12;
    v25[5] = CFSTR("MedFileSize");
    v13 = v8;
    if (!v8)
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v26[5] = v13;
    v25[6] = CFSTR("AvgFileSize");
    v14 = v10;
    if (!v10)
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v26[6] = v14;
    v25[7] = CFSTR("Type");
    v15 = sub_10002A220(self->_contentRequest);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v26[7] = v16;
    v25[8] = CFSTR("MostFrequentError");
    v17 = v5;
    if (!v5)
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    applicationIdentifier = self->_applicationIdentifier;
    v26[8] = v17;
    v26[9] = applicationIdentifier;
    v25[9] = CFSTR("BundleIdentifier");
    v25[10] = CFSTR("InstallSource");
    v26[10] = v24;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 11));
    -[BAContentRequestTelemetry setEventPayload:](self, "setEventPayload:", v19);

    if (!v5)
    if (!v10)

    if (!v8)
  }
  return (id)objc_claimAutoreleasedReturnValue(-[BAContentRequestTelemetry eventPayload](self, "eventPayload"));
}

- (id)formatError:(id)a3 withCount:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
  v7 = objc_msgSend(v5, "code");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@:%ld:%lu]"), v6, v7, a4));
  return v8;
}

- (id)description
{
  uint64_t successCount;
  uint64_t failureCount;
  uint64_t essentialAssetsCount;
  uint64_t optionalAssetsCount;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  failureCount = self->_failureCount;
  successCount = self->_successCount;
  essentialAssetsCount = self->_essentialAssetsCount;
  optionalAssetsCount = self->_optionalAssetsCount;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BAContentRequestTelemetry fileSizes](self, "fileSizes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", CFSTR(",")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BAContentRequestTelemetry uniqueErrorCounts](self, "uniqueErrorCounts"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Successes=%d, failures=%d, essentials=%d, optionals=%d, sizes=%@, errors=%@"), successCount, failureCount, essentialAssetsCount, optionalAssetsCount, v8, v9));

  return v10;
}

- (id)_median:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = (unint64_t)objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = v4 >> 1;
    if ((v4 & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", v5));
      v10 = objc_msgSend(v12, "unsignedLongLongValue");

    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", v5 - 1));
      v7 = objc_msgSend(v6, "unsignedLongLongValue");

      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", v5));
      v9 = objc_msgSend(v8, "unsignedLongLongValue");

      v10 = (id)(((unint64_t)v7 + (unint64_t)v9) >> 1);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_average:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v4);
          v7 += (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "unsignedLongLongValue", (_QWORD)v12);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7 / (unint64_t)objc_msgSend(v4, "count")));
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_formatMostFrequentError
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BAContentRequestTelemetry uniqueErrorCounts](self, "uniqueErrorCounts"));
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[BAContentRequestTelemetry uniqueErrorCounts](self, "uniqueErrorCounts"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BAContentRequestTelemetry uniqueErrorCounts](self, "uniqueErrorCounts"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v11));
        v14 = objc_msgSend(v13, "unsignedLongLongValue");

        if (v14 > v8)
        {
          v15 = v11;

          v7 = v15;
          v8 = v14;
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BAContentRequestTelemetry formatError:withCount:](self, "formatError:withCount:", v7, v8));
  return v17;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_applicationIdentifier, a3);
}

- (NSMutableArray)fileSizes
{
  return self->_fileSizes;
}

- (void)setFileSizes:(id)a3
{
  objc_storeStrong((id *)&self->_fileSizes, a3);
}

- (NSMutableDictionary)uniqueErrorCounts
{
  return self->_uniqueErrorCounts;
}

- (void)setUniqueErrorCounts:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueErrorCounts, a3);
}

- (NSMutableSet)remainingDownloadUniqueIdentifiers
{
  return self->_remainingDownloadUniqueIdentifiers;
}

- (void)setRemainingDownloadUniqueIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_remainingDownloadUniqueIdentifiers, a3);
}

- (NSDictionary)eventPayload
{
  return self->_eventPayload;
}

- (void)setEventPayload:(id)a3
{
  objc_storeStrong((id *)&self->_eventPayload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPayload, 0);
  objc_storeStrong((id *)&self->_remainingDownloadUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_uniqueErrorCounts, 0);
  objc_storeStrong((id *)&self->_fileSizes, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
