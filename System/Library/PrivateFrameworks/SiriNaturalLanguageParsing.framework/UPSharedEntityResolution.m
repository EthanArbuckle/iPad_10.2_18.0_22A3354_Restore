@implementation UPSharedEntityResolution

- (UPSharedEntityResolution)initWithMatchingSpans:(id)a3
{
  id v4;
  NSObject *v5;
  UPSharedEntityResolution *v6;
  uint64_t v7;
  NSDictionary *dataDetectorDateTimeSpansByTokenRange;
  objc_super v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SNLPOSLoggerForCategory(3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v12 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1C2196000, v5, OS_LOG_TYPE_DEBUG, "Initializing UPSharedEntityResolution with %lu matching spans", buf, 0xCu);
  }

  v10.receiver = self;
  v10.super_class = (Class)UPSharedEntityResolution;
  v6 = -[UPSharedEntityResolution init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "buildDataDetectorDateTimeSpansByTokenRange:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    dataDetectorDateTimeSpansByTokenRange = v6->__dataDetectorDateTimeSpansByTokenRange;
    v6->__dataDetectorDateTimeSpansByTokenRange = (NSDictionary *)v7;

  }
  return v6;
}

- (id)resolveSharedEntityForTokenRange:(_NSRange)a3 valueType:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  int v15;
  NSUInteger v16;
  __int16 v17;
  NSUInteger v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  length = a3.length;
  location = a3.location;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  SNLPOSLoggerForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v15 = 134218498;
    v16 = location;
    v17 = 2048;
    v18 = length;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1C2196000, v8, OS_LOG_TYPE_DEBUG, "Resolving shared entities for token range (%lu, %lu) with value type: %@", (uint8_t *)&v15, 0x20u);
  }

  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("date")) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", location, length);
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->__dataDetectorDateTimeSpansByTokenRange, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SNLPOSLoggerForCategory(3);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      if (v12)
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1C2196000, v11, OS_LOG_TYPE_DEBUG, "Found a corresponding matching span: returning the shared entity graph", (uint8_t *)&v15, 2u);
      }

      objc_msgSend(v10, "sharedEntityGraph");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v12)
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1C2196000, v11, OS_LOG_TYPE_DEBUG, "Returning nil since there is no corresponding matching span", (uint8_t *)&v15, 2u);
      }

      v13 = 0;
    }

  }
  else
  {
    SNLPOSLoggerForCategory(3);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1C2196000, v9, OS_LOG_TYPE_DEBUG, "Returning nil since we cannot handle non-date value types", (uint8_t *)&v15, 2u);
    }
    v13 = 0;
  }

  return v13;
}

- (NSDictionary)_dataDetectorDateTimeSpansByTokenRange
{
  return self->__dataDetectorDateTimeSpansByTokenRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__dataDetectorDateTimeSpansByTokenRange, 0);
}

+ (id)buildDataDetectorDateTimeSpansByTokenRange:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  id v17;
  __CFString *v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v38;
    v8 = "Processing matching span with category: %@";
    v9 = CFSTR("DATE_TIME");
    do
    {
      v10 = 0;
      v35 = v6;
      do
      {
        if (*(_QWORD *)v38 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v10);
        SNLPOSLoggerForCategory(3);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v11, "category");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v42 = (uint64_t)v13;
          _os_log_impl(&dword_1C2196000, v12, OS_LOG_TYPE_DEBUG, v8, buf, 0xCu);

        }
        if (objc_msgSend(v11, "type") != 2)
        {
          SNLPOSLoggerForCategory(3);
          v23 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            goto LABEL_23;
          *(_WORD *)buf = 0;
          v29 = v23;
          v30 = "Skipping non-DataDetected span";
LABEL_18:
          _os_log_impl(&dword_1C2196000, v29, OS_LOG_TYPE_DEBUG, v30, buf, 2u);
          goto LABEL_23;
        }
        objc_msgSend(v11, "category");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[__CFString isEqualToString:](v9, "isEqualToString:", v14);

        if ((v15 & 1) == 0)
        {
          SNLPOSLoggerForCategory(3);
          v23 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            goto LABEL_23;
          *(_WORD *)buf = 0;
          v29 = v23;
          v30 = "Skipping non-datetime span";
          goto LABEL_18;
        }
        v16 = v7;
        v17 = v4;
        v18 = v9;
        v19 = v8;
        v20 = (void *)MEMORY[0x1E0CB3B18];
        v21 = objc_msgSend(v11, "range");
        objc_msgSend(v20, "valueWithRange:", v21, v22);
        v23 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        SNLPOSLoggerForCategory(3);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v24)
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v27 = objc_msgSend(v11, "range");
            objc_msgSend(v11, "range");
            *(_DWORD *)buf = 134218240;
            v42 = v27;
            v43 = 2048;
            v44 = v28;
            _os_log_impl(&dword_1C2196000, v26, OS_LOG_TYPE_DEFAULT, "Discarding duplicate matching date time span for range (%lu, %lu)", buf, 0x16u);
          }

        }
        else
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            v31 = objc_msgSend(v11, "range");
            objc_msgSend(v11, "range");
            *(_DWORD *)buf = 134218240;
            v42 = v31;
            v43 = 2048;
            v44 = v32;
            _os_log_impl(&dword_1C2196000, v26, OS_LOG_TYPE_DEBUG, "Adding DD datetime span with token range (%lu, %lu)", buf, 0x16u);
          }

          objc_msgSend(v36, "setObject:forKeyedSubscript:", v11, v23);
        }
        v8 = v19;
        v9 = v18;
        v4 = v17;
        v7 = v16;
        v6 = v35;
LABEL_23:

        ++v10;
      }
      while (v6 != v10);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v36);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

@end
