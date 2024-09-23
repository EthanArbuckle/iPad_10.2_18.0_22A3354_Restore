@implementation APAttributionCapData

- (void)loadCapData:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  _QWORD v23[7];

  v4 = a3;
  v23[0] = CFSTR("ADCapDataKeychainKey");
  v23[1] = CFSTR("ADLandingCapDataKeychainKey");
  v23[2] = CFSTR("ADIris1CapDataKeychainKey");
  v23[3] = CFSTR("ADIris2CapDataKeychainKey");
  v23[4] = CFSTR("ADIris3CapDataKeychainKey");
  v23[5] = CFSTR("ADFloraCapDataKeychainKey");
  v23[6] = CFSTR("ADMetisCapDataKeychainKey");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 7));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (!v6)
  {

LABEL_11:
    v13 = APLogForCategory(4);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));
      *(_DWORD *)buf = 138543362;
      v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "No Cap data found for adamID %{public}@", buf, 0xCu);

    }
    goto LABEL_14;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v17;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v17 != v9)
        objc_enumerationMutation(v5);
      v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
      v12 = objc_autoreleasePoolPush();
      v8 |= -[APAttributionCapData capDataFromKeyChain:adamID:](self, "capDataFromKeyChain:adamID:", v11, v4, (_QWORD)v16);
      objc_autoreleasePoolPop(v12);
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  }
  while (v7);

  if ((v8 & 1) == 0)
    goto LABEL_11;
LABEL_14:

}

- (BOOL)_loadAllDataFromKeychainForKey:(id)a3 clickCountData:(id *)a4 downloadData:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  BOOL v16;
  uint64_t v17;
  NSObject *v18;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;

  v8 = a3;
  v9 = objc_autoreleasePoolPush();
  v24 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[APKeychainServices objectForPropertyListKey:error:](APKeychainServices, "objectForPropertyListKey:error:", v8, &v24));
  v11 = v24;
  if (v10 && objc_msgSend(v10, "length"))
  {
    v23 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v10, 0, 0, &v23));
    v13 = v23;

    objc_autoreleasePoolPop(v9);
    if (v13)
    {
      v14 = APLogForCategory(4);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v26 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error restoring cap data %{public}@", buf, 0xCu);
      }

      v16 = 0;
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("ADToroIDKey")));
      v16 = v20 != 0;
      if (v20)
      {
        if (a4)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("ADToroClickTypeKey")));
          *a4 = (id)objc_claimAutoreleasedReturnValue(-[APAttributionCapData restoreCapDataArrayFromPlist:](self, "restoreCapDataArrayFromPlist:", v21));

        }
        if (a5)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("ADDownloadTypeKey")));
          *a5 = (id)objc_claimAutoreleasedReturnValue(-[APAttributionCapData restoreCapDataArrayFromPlist:](self, "restoreCapDataArrayFromPlist:", v22));

        }
      }
      else
      {
        APSimulateCrashNoKillProcess(5, CFSTR("Unable to restore Toro ID for ADCapData. Please file a radar..."));
      }

    }
  }
  else
  {
    v17 = APLogForCategory(4);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "No data to restore. Initializing an empty Cap Data object.", buf, 2u);
    }

    objc_autoreleasePoolPop(v9);
    v16 = 0;
    v12 = v11;
  }

  return v16;
}

- (BOOL)capDataFromKeyChain:(id)a3 adamID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  id v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  uint64_t v39;
  NSObject *v40;
  _BOOL4 v41;
  const char *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *i;
  void *v53;
  void *v54;
  void *v55;
  unsigned int v56;
  id v57;
  uint64_t v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  uint64_t v70;
  NSObject *v71;
  _BOOL4 v72;
  const char *v73;
  void *v74;
  uint64_t v75;
  void *v77;
  unint64_t v78;
  APAttributionCapData *v79;
  void *v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  id v90;
  id v91;
  uint8_t v92[128];
  uint8_t buf[4];
  void *v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  void *v98;
  _BYTE v99[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_autoreleasePoolPush();
  v90 = 0;
  v91 = 0;
  v9 = -[APAttributionCapData _loadAllDataFromKeychainForKey:clickCountData:downloadData:](self, "_loadAllDataFromKeychainForKey:clickCountData:downloadData:", v6, &v91, &v90);
  v10 = (unint64_t)v91;
  v81 = v90;
  objc_autoreleasePoolPop(v8);
  if (!v9)
  {
    v26 = 0;
    v25 = (unint64_t)v81;
    goto LABEL_61;
  }
  v11 = APLogForCategory(4);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
    *(_DWORD *)buf = 138543362;
    v94 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Attempting to attach click information for Adam ID: %{public}@", buf, 0xCu);

  }
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v10, "reverseObjectEnumerator"));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
  v78 = v10;
  if (v15)
  {
    v16 = v15;
    v79 = self;
    v17 = v6;
    v18 = *(_QWORD *)v87;
LABEL_6:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v87 != v18)
        objc_enumerationMutation(v14);
      v20 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
      v23 = objc_msgSend(v21, "isEqualToString:", v22);

      if (v23)
        break;
      if (v16 == (id)++v19)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
        if (v16)
          goto LABEL_6;
        v24 = 0;
        v6 = v17;
        self = v79;
        v25 = (unint64_t)v81;
        goto LABEL_30;
      }
    }
    v27 = APLogForCategory(4);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    v6 = v17;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dictionaryRepresentation"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "jsonString"));
      *(_DWORD *)buf = 138543874;
      v94 = v17;
      v95 = 2114;
      v96 = v29;
      v97 = 2114;
      v98 = v31;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Found a click cap object from %{public}@ for Adam ID %{public}@: %{public}@", buf, 0x20u);

    }
    v24 = v20;

    self = v79;
    if (!v24)
    {
      v25 = (unint64_t)v81;
      goto LABEL_31;
    }
    objc_msgSend(v24, "timestamp");
    v33 = v32;
    -[APAttributionCapData searchAdClickTimestamp](v79, "searchAdClickTimestamp");
    v25 = (unint64_t)v81;
    if (v33 <= v34)
      goto LABEL_31;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "dictionaryRepresentation"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "jsonString"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" click cap data with data from %@:\n%@"), v6, v36));

    -[APAttributionCapData searchAdClickTimestamp](v79, "searchAdClickTimestamp");
    v38 = v37;
    v39 = APLogForCategory(4);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    v41 = os_log_type_enabled(v40, OS_LOG_TYPE_INFO);
    if (v38 == 0.0)
    {
      if (v41)
      {
        *(_DWORD *)buf = 138543362;
        v94 = v14;
        v42 = "Adding %{public}@";
LABEL_25:
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, v42, buf, 0xCu);
      }
    }
    else if (v41)
    {
      *(_DWORD *)buf = 138543362;
      v94 = v14;
      v42 = "Replacing %{public}@";
      goto LABEL_25;
    }

    objc_msgSend(v24, "timestamp");
    -[APAttributionCapData setSearchAdClickTimestamp:](v79, "setSearchAdClickTimestamp:");
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "adMetadata"));
    -[APAttributionCapData setAdMetadata:](v79, "setAdMetadata:", v43);

    -[APAttributionCapData _clearCapDownloadDataProperties](v79, "_clearCapDownloadDataProperties");
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("ADCapDataKeychainKey")))
      v44 = 1;
    else
      v44 = 2;
    -[APAttributionCapData setClickOrigin:](v79, "setClickOrigin:", v44);
    goto LABEL_30;
  }
  v24 = 0;
  v25 = (unint64_t)v81;
LABEL_30:

LABEL_31:
  v45 = APLogForCategory(4);
  v46 = objc_claimAutoreleasedReturnValue(v45);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
    *(_DWORD *)buf = 138543362;
    v94 = v47;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Attempting to attach download information for Adam ID: %{public}@", buf, 0xCu);

  }
  v80 = v24;

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v25, "reverseObjectEnumerator"));
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
  if (!v49)
  {
    v57 = 0;
    v10 = v78;
    goto LABEL_59;
  }
  v50 = v49;
  v77 = v6;
  v51 = *(_QWORD *)v83;
  while (2)
  {
    for (i = 0; i != v50; i = (char *)i + 1)
    {
      if (*(_QWORD *)v83 != v51)
        objc_enumerationMutation(v48);
      v53 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)i);
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "identifier"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
      v56 = objc_msgSend(v54, "isEqualToString:", v55);

      if (v56)
      {
        v58 = APLogForCategory(4);
        v59 = objc_claimAutoreleasedReturnValue(v58);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "dictionaryRepresentation"));
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "jsonString"));
          *(_DWORD *)buf = 138543618;
          v94 = v60;
          v95 = 2114;
          v96 = v62;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "Found a download object for Adam ID %{public}@: %{public}@", buf, 0x16u);

        }
        v57 = v53;

        v6 = v77;
        v10 = v78;
        if (!v57
          || (objc_msgSend(v57, "timestamp"),
              v64 = v63,
              -[APAttributionCapData downloadClickTimestamp](self, "downloadClickTimestamp"),
              v64 <= v65))
        {
          v25 = (unint64_t)v81;
          goto LABEL_60;
        }
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "dictionaryRepresentation"));
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "jsonString"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" download cap data with data from %@:\n%@"), v77, v67));

        -[APAttributionCapData downloadClickTimestamp](self, "downloadClickTimestamp");
        v69 = v68;
        v70 = APLogForCategory(4);
        v71 = objc_claimAutoreleasedReturnValue(v70);
        v72 = os_log_type_enabled(v71, OS_LOG_TYPE_INFO);
        if (v69 == 0.0)
        {
          if (v72)
          {
            *(_DWORD *)buf = 138543362;
            v94 = v48;
            v73 = "Adding %{public}@";
LABEL_53:
            _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, v73, buf, 0xCu);
          }
        }
        else if (v72)
        {
          *(_DWORD *)buf = 138543362;
          v94 = v48;
          v73 = "Replacing %{public}@";
          goto LABEL_53;
        }

        -[APAttributionCapData setAttributionDownloadType:](self, "setAttributionDownloadType:", objc_msgSend(v57, "downloadType"));
        objc_msgSend(v57, "timestamp");
        -[APAttributionCapData setDownloadClickTimestamp:](self, "setDownloadClickTimestamp:");
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "adMetadata"));
        -[APAttributionCapData setAdMetadata:](self, "setAdMetadata:", v74);

        if (objc_msgSend(v77, "isEqualToString:", CFSTR("ADCapDataKeychainKey")))
          v75 = 1;
        else
          v75 = 2;
        -[APAttributionCapData setClickOrigin:](self, "setClickOrigin:", v75);
        goto LABEL_58;
      }
    }
    v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
    if (v50)
      continue;
    break;
  }
  v57 = 0;
  v6 = v77;
  v10 = v78;
LABEL_58:
  v25 = (unint64_t)v81;
LABEL_59:

LABEL_60:
  v26 = (v10 | v25) != 0;

LABEL_61:
  return v26;
}

- (void)_clearCapDownloadDataProperties
{
  -[APAttributionCapData setDownloadClickTimestamp:](self, "setDownloadClickTimestamp:", 0.0);
  -[APAttributionCapData setAttributionDownloadType:](self, "setAttributionDownloadType:", 0);
}

- (id)restoreCapDataArrayFromPlist:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  ADFrequencyCap *v11;
  ADFrequencyCap *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  if (v3)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
          v11 = [ADFrequencyCap alloc];
          v12 = -[ADFrequencyCap initWithDictionary:](v11, "initWithDictionary:", v10, (_QWORD)v14);
          objc_msgSend(v4, "addObject:", v12);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  return v4;
}

- (double)searchAdClickTimestamp
{
  return self->_searchAdClickTimestamp;
}

- (void)setSearchAdClickTimestamp:(double)a3
{
  self->_searchAdClickTimestamp = a3;
}

- (double)downloadClickTimestamp
{
  return self->_downloadClickTimestamp;
}

- (void)setDownloadClickTimestamp:(double)a3
{
  self->_downloadClickTimestamp = a3;
}

- (NSString)adMetadata
{
  return self->_adMetadata;
}

- (void)setAdMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_adMetadata, a3);
}

- (int64_t)attributionDownloadType
{
  return self->_attributionDownloadType;
}

- (void)setAttributionDownloadType:(int64_t)a3
{
  self->_attributionDownloadType = a3;
}

- (int64_t)clickOrigin
{
  return self->_clickOrigin;
}

- (void)setClickOrigin:(int64_t)a3
{
  self->_clickOrigin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adMetadata, 0);
}

@end
