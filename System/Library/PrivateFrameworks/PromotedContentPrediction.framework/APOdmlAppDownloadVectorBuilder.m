@implementation APOdmlAppDownloadVectorBuilder

- (id)eventsBetween:(id)a3 and:(id)a4
{
  id v5;
  id v6;
  APOdmlBiomeSQLQuery *v7;
  const char *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(APOdmlBiomeSQLQuery);
  objc_msgSend_query_startDate_endDate_(v7, v8, (uint64_t)CFSTR("App.Install"), v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)weightForEvents:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  double v24;
  double v25;
  const char *v26;
  uint64_t v27;
  double v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_date(MEMORY[0x1E0C99D68], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = v4;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v30, v34, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v31;
    v14 = 0.0;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v8);
        objc_msgSend_objectForKey_(*(void **)(*((_QWORD *)&v30 + 1) + 8 * i), v11, (uint64_t)CFSTR("absoluteTimestamp"), (_QWORD)v30);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend_doubleValue(v16, v18, v19);
        objc_msgSend_dateWithTimeIntervalSince1970_(v17, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timeIntervalSinceDate_(v7, v23, (uint64_t)v22);
        v25 = v24;

        objc_msgSend_exponentialDecayConstant(self, v26, v27);
        v14 = v14 + exp(v25 / -86400.0 * v28);

      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v30, v34, 16);
    }
    while (v12);
  }
  else
  {
    v14 = 0.0;
  }

  return v14;
}

- (id)eventName
{
  return CFSTR("AppDownloadEvent");
}

@end
