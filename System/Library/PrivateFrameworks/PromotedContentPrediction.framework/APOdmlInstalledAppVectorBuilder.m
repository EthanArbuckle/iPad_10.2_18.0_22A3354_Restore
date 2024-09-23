@implementation APOdmlInstalledAppVectorBuilder

- (APOdmlInstalledAppVectorBuilder)initWithVersion:(id)a3 lookbackPeriod:(id)a4 maxQueryElements:(id)a5 task:(id)a6 exponentialDecayConstant:(id)a7 weightByDuration:(id)a8 isCounterfactual:(BOOL)a9
{
  const char *v9;
  uint64_t v10;
  APOdmlInstalledAppVectorBuilder *v11;
  uint64_t v12;
  NSMutableDictionary *bundleIDtoAppInfo;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)APOdmlInstalledAppVectorBuilder;
  v11 = -[APOdmlVectorBuilder initWithVersion:lookbackPeriod:maxQueryElements:task:exponentialDecayConstant:weightByDuration:isCounterfactual:](&v16, sel_initWithVersion_lookbackPeriod_maxQueryElements_task_exponentialDecayConstant_weightByDuration_isCounterfactual_, a3, a4, a5, a6, a7, a8, a9);
  if (v11)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v9, v10);
    v12 = objc_claimAutoreleasedReturnValue();
    bundleIDtoAppInfo = v11->_bundleIDtoAppInfo;
    v11->_bundleIDtoAppInfo = (NSMutableDictionary *)v12;

  }
  return v11;
}

- (id)eventsBetween:(id)a3 and:(id)a4
{
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  APOdmlAppInfo *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  void *context;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v44 = a4;
  objc_msgSend_set(MEMORY[0x1E0C99E20], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1BCC9B1A4]();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend__installedStoreAppEnumerator(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v46, v50, 16);
  if (v13)
  {
    v16 = v13;
    v17 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v47 != v17)
          objc_enumerationMutation(v11);
        v19 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend_bundleIdentifier(v19, v14, v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend_iTunesMetadata(v19, v14, v15);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend_storeItemIdentifier(v21, v22, v23);

          v25 = [APOdmlAppInfo alloc];
          objc_msgSend_bundleIdentifier(v19, v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)objc_msgSend_initWithBundleID_adamID_(v25, v29, (uint64_t)v28, v24);

          objc_msgSend_addObject_(v8, v31, (uint64_t)v30);
          objc_msgSend_bundleIDtoAppInfo(self, v32, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_bundleIdentifier(v19, v35, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v34, v38, (uint64_t)v30, v37);

        }
      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v46, v50, 16);
    }
    while (v16);
  }

  objc_autoreleasePoolPop(context);
  objc_msgSend_allObjects(v8, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (void)buildBundleIDtoAdamIDCache:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v24, v28, 16);
  if (v6)
  {
    v9 = v6;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend_bundleID(v12, v7, v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_adamIDtoBundleID(self, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0CB37E8];
        v20 = objc_msgSend_adamID(v12, v18, v19);
        objc_msgSend_numberWithUnsignedLongLong_(v17, v21, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v16, v23, (uint64_t)v13, v22);

      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v24, v28, 16);
    }
    while (v9);
  }

}

- (double)weightForEvents:(id)a3
{
  return 1.0;
}

- (id)retrieveFilteredEvents:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  const char *v23;
  char isEqualToString;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_bundleIDtoAppInfo(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v30 = v9;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)&v30, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend_events(self, v10, v11, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v26, v32, 16);
    if (v15)
    {
      v18 = v15;
      v19 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v13);
          v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend_bundleID(v21, v16, v17);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v22, v23, (uint64_t)v4);

          if ((isEqualToString & 1) != 0)
          {
            v31 = v21;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v16, (uint64_t)&v31, 1);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }
        }
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v26, v32, 16);
        if (v18)
          continue;
        break;
      }
    }

    v12 = 0;
  }
LABEL_13:

  return v12;
}

- (id)_installedStoreAppEnumerator
{
  void *v2;
  const char *v3;

  objc_msgSend_enumeratorWithOptions_(MEMORY[0x1E0CA5870], a2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFilter_(v2, v3, (uint64_t)&unk_1E6A29220);
  return v2;
}

- (id)eventName
{
  return CFSTR("InstalledAppEvent");
}

- (NSMutableDictionary)bundleIDtoAppInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBundleIDtoAppInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDtoAppInfo, 0);
}

@end
