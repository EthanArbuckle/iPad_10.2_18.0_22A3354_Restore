@implementation BCReadingStatisticsSync

- (id)mutableCopy
{
  return -[BCMutableReadingStatisticsSync initWithCloudData:]([BCMutableReadingStatisticsSync alloc], "initWithCloudData:", self);
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;

  v6 = a4;
  v7 = BUProtocolCast(&OBJC_PROTOCOL___BCReadingStatisticsSync, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    -[BCReadingStatisticsSync _configureFromReadingStatistics:withMergers:](self, "_configureFromReadingStatistics:withMergers:", v8, v6);
  }
  else
  {
    v9 = BCCloudKitLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1B5FD8();

  }
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  uint64_t v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a4;
  v6 = a3;
  v7 = BUProtocolCast(&OBJC_PROTOCOL___BCReadingStatisticsSync, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v18.receiver = self;
  v18.super_class = (Class)BCReadingStatisticsSync;
  LOBYTE(v4) = -[BCReadingStatisticsSync isEqualExceptForDate:ignoringEmptySalt:](&v18, "isEqualExceptForDate:ignoringEmptySalt:", v6, v4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSync assetID](self, "assetID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetID"));
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSync assetVersion](self, "assetVersion"));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetVersion"));
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSync readingStatisticsBook](self, "readingStatisticsBook"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "readingStatisticsBook"));
  LOBYTE(v13) = objc_msgSend(v15, "isEqual:", v16);

  return v4 & v11 & v14 & v13;
}

- (void)_configureFromReadingStatistics:(id)a3 withMergers:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BCReadingStatisticsSync;
  -[BCReadingStatisticsSync configureFromCloudData:withMergers:](&v12, "configureFromCloudData:withMergers:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "readingStatisticsBook"));
  -[BCReadingStatisticsSync _mergeInAssetID:assetVersion:serializedData:](self, "_mergeInAssetID:assetVersion:serializedData:", v7, v8, v9);

  v10 = BCCloudKitLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_1B6004(self, v6, v11);

}

- (void)_mergeInAssetID:(id)a3 assetVersion:(id)a4 serializedData:(id)a5
{
  id v8;
  id v9;
  id v10;
  BCReadingStatisticsProtoBook *v11;
  id v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  NSObject *v16;
  BCReadingStatisticsProtoBook *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  BCReadingStatisticsProtoBook *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *i;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  char v37;
  uint64_t v38;
  void *j;
  void *v40;
  void *v41;
  uint64_t v42;
  BCReadingStatisticsProtoTOCEntry *v43;
  double v44;
  double v45;
  double v46;
  id v47;
  NSObject *v48;
  double v49;
  id v50;
  NSObject *v51;
  double v52;
  id v53;
  NSObject *v54;
  id v55;
  NSObject *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  void *k;
  uint64_t v71;
  id v72;
  id v73;
  NSObject *v74;
  void *v75;
  id v76;
  unsigned int v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  BCReadingStatisticsProtoBook *v83;
  id v84;
  BCReadingStatisticsSync *v85;
  BCReadingStatisticsProtoBook *v86;
  id v87;
  id v88;
  BCReadingStatisticsProtoBook *v89;
  void *v90;
  NSObject *v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint8_t v105[4];
  id v106;
  uint8_t buf[4];
  void *v108;
  __int16 v109;
  double v110;
  _BYTE v111[128];
  _BYTE v112[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(BCReadingStatisticsProtoBook);
  v90 = v10;
  v12 = objc_msgSend(objc_alloc((Class)PBDataReader), "initWithData:", v10);
  if (!BCReadingStatisticsProtoBookReadFrom((char *)v11, (uint64_t)v12))
  {
    v53 = BCCloudKitLog();
    v54 = objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      sub_1B6200(self);
    goto LABEL_60;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSync assetID](self, "assetID"));
  v14 = objc_msgSend(v13, "isEqualToString:", v8);

  if ((v14 & 1) == 0)
  {
    v15 = BCCloudKitLog();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1B6158(self, (uint64_t)v8, v16);

    -[BCReadingStatisticsSync setAssetID:](self, "setAssetID:", v8);
  }
  v17 = objc_alloc_init(BCReadingStatisticsProtoBook);
  -[BCReadingStatisticsProtoBook setAssetID:](v17, "setAssetID:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[BCReadingStatisticsSyncManager sharedInstance](BCReadingStatisticsSyncManager, "sharedInstance"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_appVersion"));
  -[BCReadingStatisticsProtoBook setAppVersion:](v17, "setAppVersion:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSync readingStatisticsBook](self, "readingStatisticsBook"));
  v21 = objc_msgSend(v20, "length");

  if (!v21)
  {
LABEL_59:
    -[BCReadingStatisticsSync setAssetVersion:](self, "setAssetVersion:", v9);
    v80 = objc_alloc_init((Class)PBDataWriter);
    -[BCReadingStatisticsProtoBook writeTo:](v17, "writeTo:", v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "immutableData"));
    -[BCReadingStatisticsSync setReadingStatisticsBook:](self, "setReadingStatisticsBook:", v81);

    v54 = v17;
    goto LABEL_60;
  }
  v22 = objc_alloc((Class)PBDataReader);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSync readingStatisticsBook](self, "readingStatisticsBook"));
  v24 = objc_msgSend(v22, "initWithData:", v23);

  if (!BCReadingStatisticsProtoBookReadFrom((char *)v17, (uint64_t)v24))
  {
    v55 = BCCloudKitLog();
    v56 = objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      sub_1B60E0(self);

    goto LABEL_59;
  }
  v84 = v12;
  v87 = v9;
  v88 = v8;

  v83 = v17;
  v25 = v17;
  v89 = v11;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v91 = v25;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsProtoBook tocEntrys](v25, "tocEntrys"));
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v102;
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(_QWORD *)v102 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * (_QWORD)i);
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "href"));
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v32, v33);

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
    }
    while (v29);
  }
  v85 = self;
  v86 = v11;

  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsProtoBook tocEntrys](v89, "tocEntrys"));
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v97, v111, 16);
  if (!v35)
  {
    v37 = 0;
    goto LABEL_38;
  }
  v36 = v35;
  v37 = 0;
  v38 = *(_QWORD *)v98;
  do
  {
    for (j = 0; j != v36; j = (char *)j + 1)
    {
      if (*(_QWORD *)v98 != v38)
        objc_enumerationMutation(v34);
      v40 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)j);
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "href"));
      v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v41));
      if (v42)
      {
        v43 = (BCReadingStatisticsProtoTOCEntry *)v42;
        objc_msgSend(v40, "readProportion");
        v45 = v44;
        -[BCReadingStatisticsProtoTOCEntry readProportion](v43, "readProportion");
        if (v45 <= v46)
          goto LABEL_29;
        v47 = BCReadingStatisticsLog();
        v48 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v40, "readProportion");
          *(_DWORD *)buf = 138412546;
          v108 = v41;
          v109 = 2048;
          v110 = v49 * 100.0;
          _os_log_impl(&dword_0, v48, OS_LOG_TYPE_INFO, "Reading statistics updated: %@ now %.0lf%% read", buf, 0x16u);
        }

        objc_msgSend(v40, "readProportion");
        -[BCReadingStatisticsProtoTOCEntry setReadProportion:](v43, "setReadProportion:");
        objc_msgSend(v40, "timestamp");
        -[BCReadingStatisticsProtoTOCEntry setTimestamp:](v43, "setTimestamp:");
      }
      else
      {
        v43 = objc_alloc_init(BCReadingStatisticsProtoTOCEntry);
        objc_msgSend(v40, "copyTo:", v43);
        -[NSObject addTocEntry:](v91, "addTocEntry:", v43);
        v50 = BCReadingStatisticsLog();
        v51 = objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v40, "readProportion");
          *(_DWORD *)buf = 138412546;
          v108 = v41;
          v109 = 2048;
          v110 = v52 * 100.0;
          _os_log_impl(&dword_0, v51, OS_LOG_TYPE_INFO, "Reading statistics updated: %@ now %.0lf%% read", buf, 0x16u);
        }

      }
      v37 = 1;
LABEL_29:

    }
    v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v97, v111, 16);
  }
  while (v36);
LABEL_38:

  v57 = (void *)objc_claimAutoreleasedReturnValue(+[BCCFISet cfiSet](BCMutableCFISet, "cfiSet"));
  v58 = objc_claimAutoreleasedReturnValue(-[NSObject readCFIs](v91, "readCFIs"));
  v59 = (void *)v58;
  if (v58)
    v60 = (void *)v58;
  else
    v60 = &__NSArray0__struct;
  v61 = v60;

  v62 = objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsProtoBook readCFIs](v89, "readCFIs"));
  v63 = (void *)v62;
  if (v62)
    v64 = (void *)v62;
  else
    v64 = &__NSArray0__struct;
  v82 = v61;
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "arrayByAddingObjectsFromArray:", v64));

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v66 = v65;
  v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v93, buf, 16);
  if (v67)
  {
    v68 = v67;
    v69 = *(_QWORD *)v94;
    do
    {
      for (k = 0; k != v68; k = (char *)k + 1)
      {
        if (*(_QWORD *)v94 != v69)
          objc_enumerationMutation(v66);
        v71 = *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)k);
        v92 = 0;
        objc_msgSend(v57, "addCFIString:error:", v71, &v92);
        v72 = v92;
        if (v72)
        {
          v73 = BCReadingStatisticsLog();
          v74 = objc_claimAutoreleasedReturnValue(v73);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v105 = 138543362;
            v106 = v72;
            _os_log_error_impl(&dword_0, v74, OS_LOG_TYPE_ERROR, "Error merging read CFIs: %{public}@", v105, 0xCu);
          }

        }
      }
      v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v93, buf, 16);
    }
    while (v68);
  }

  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "allCFIStrings"));
  v76 = objc_msgSend(v75, "mutableCopy");
  v54 = v91;
  -[NSObject setReadCFIs:](v91, "setReadCFIs:", v76);

  if ((v37 & 1) != 0)
  {
    v77 = 1;
    v9 = v87;
    v8 = v88;
    v11 = v86;
    v78 = v82;
  }
  else
  {
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject readCFIs](v91, "readCFIs"));
    v78 = v82;
    v77 = objc_msgSend(v82, "isEqual:", v79) ^ 1;

    v9 = v87;
    v8 = v88;
    v11 = v86;
  }

  v12 = v84;
  self = v85;
  v17 = v83;
  if (v77)
    goto LABEL_59;
LABEL_60:

}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  id v20;
  objc_super v21;

  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BCReadingStatisticsSync;
  -[BCReadingStatisticsSync resolveConflictsFromRecord:withResolvers:](&v21, "resolveConflictsFromRecord:withResolvers:", v6, a4);
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[BCCloudData localIdentifierFromRecord:](BCCloudData, "localIdentifierFromRecord:", v6));
    v8 = objc_opt_class(CKAsset);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("assetStatistics")));
    v10 = BUDynamicCast(v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fileURL"));

    if (v12)
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v12));
    else
      v13 = 0;
    if (-[NSObject length](v7, "length") && objc_msgSend(v13, "length"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("assetVersion")));
      -[BCReadingStatisticsSync _mergeInAssetID:assetVersion:serializedData:](self, "_mergeInAssetID:assetVersion:serializedData:", v7, v15, v13);

      v16 = -[BCReadingStatisticsSync hasChanges](self, "hasChanges");
      v17 = BCReadingStatisticsLog();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
      if (v16)
      {
        if (v19)
          sub_1B6368(self, v6, v18);
      }
      else if (v19)
      {
        sub_1B6430(self, v6, v18);
      }
    }
    else
    {
      v20 = BCReadingStatisticsLog();
      v18 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_1B62F0(self);
    }

  }
  else
  {
    v14 = BCCloudKitLog();
    v7 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1B6278(self);
  }

}

- (id)recordType
{
  return CFSTR("assetReadingStatistics");
}

+ (id)propertyIDKey
{
  return CFSTR("assetID");
}

- (id)zoneName
{
  return kBCCloudKitZoneReadingStatistics;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSync assetID](self, "assetID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSync assetVersion](self, "assetVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCReadingStatisticsSync readingStatisticsBook](self, "readingStatisticsBook"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("assetID: %@, assetVersion: %@, statistics: %@"), v3, v4, v5));

  return (NSString *)v6;
}

@end
