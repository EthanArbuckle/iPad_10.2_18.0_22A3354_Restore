@implementation BCCacheManager

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if ((id)objc_opt_class(BCCacheManager) == a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = CFSTR("BCCacheManagerNextDiskPruneDate");
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v6 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
    objc_msgSend(v2, "registerDefaults:", v4);

  }
}

+ (BCCacheManager)defaultCacheManager
{
  return (BCCacheManager *)(id)qword_30DB60;
}

+ (void)setDefaultCacheManager:(id)a3
{
  objc_storeStrong((id *)&qword_30DB60, a3);
}

+ (id)_oldCacheDirectoryPath
{
  NSArray *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("BCCoverCache-1")));

  return v5;
}

+ (id)_cacheDirectoryPath
{
  NSArray *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("BCCoverCache-1")));

  return v5;
}

+ (void)clearOldCacheFiles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication applicationCacheDirectory](UIApplication, "applicationCacheDirectory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("BCCoverCache")));
  objc_msgSend(v3, "removeItemAtPath:error:", v4, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("BKCoverCache")));
  objc_msgSend(v5, "removeItemAtPath:error:", v6, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("BKMappedImageCache")));
  objc_msgSend(v7, "removeItemAtPath:error:", v8, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_oldCacheDirectoryPath"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  objc_msgSend(v10, "removeItemAtPath:error:", v9, 0);

}

+ (void)clearCacheFiles
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_cacheDirectoryPath"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  objc_msgSend(v2, "removeItemAtPath:error:", v4, 0);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 0, 0, 0);

}

+ (id)loadCacheMetaData
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_cacheDirectoryPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("BCCoverCache-Version")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v3));
  return v4;
}

+ (void)writeCacheMetaData:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_cacheDirectoryPath"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("BCCoverCache-Version")));

  objc_msgSend(v4, "writeToFile:atomically:", v6, 0);
}

+ (void)migrateCacheAt:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  const __CFString *v9;
  _UNKNOWN **v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("BCCoverCache-Version")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Version")));
  v7 = objc_msgSend(v6, "unsignedIntValue");

  if (v7 != 8)
  {
    objc_msgSend(a1, "clearCacheFiles");
    objc_msgSend(a1, "clearOldCacheFiles");
    v9 = CFSTR("Version");
    v10 = &off_2A9578;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));

    objc_msgSend(v8, "writeToFile:atomically:", v4, 0);
    v5 = v8;
  }

}

+ (id)defaultClassDefinitionsWithProtocolHandler:(id)a3 stackDecomposer:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_opt_class(BICCacheLevel), kLevelClass);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_opt_class(BICImageSetStore), kL1StorgageClass);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_opt_class(BICImageSetStorePersistance), kL2StorgageClass);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_opt_class(BICImageSetStorePersistance), kL3StorgageClass);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_opt_class(BICImageSetStorePersistance), kL4StorgageClass);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_opt_class(BICImageSetPersistence), kPersistingClass);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_opt_class(BICMemoryDataStore), kL1DataStoringClass);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_opt_class(BICDiskDataStore), kL2DataStoringClass);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_opt_class(BICURLDataStore), kL3DataStoringClass);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_opt_class(BICProductProfileDataStore), kL4DataStoringClass);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_opt_class(BCStackManager), kStackManagerClass);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_opt_class(BCStackRenderer), kStackRendererClass);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_opt_class(BCCacheImageTransformer), kTransformerClass);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_opt_class(BCCacheTransformController), kTransformControllerClass);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_opt_class(BCCacheProductProfiles), kProfileFetchingClass);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, kURLProtocolHandlerInstance);

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, kSeriesStackDecomposingInstance);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_opt_class(BICCoreDataPersistentStoring), kPersistentStoreClass);
  return v7;
}

+ (id)operationsFromInterestInDescribedImages:(id)a3 comparator:(id)a4 imageRequest:(id)a5 vendedImageInterest:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *i;
  void *v23;
  id v24;
  unint64_t v25;
  id v26;
  void *v27;
  void *v28;
  unsigned int v29;
  _BOOL4 v30;
  BOOL v31;
  id v32;
  id v33;
  NSObject *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  const char *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned int v45;
  unsigned int v46;
  _BOOL4 v47;
  unsigned int v48;
  id v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  id v53;
  void *v54;
  uint64_t v55;
  id v56;
  _BOOL4 v57;
  id v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  NSObject *v68;
  void *v69;
  void *v70;
  unsigned __int8 v71;
  void *v72;
  unint64_t v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t buf[4];
  id v80;
  __int16 v81;
  id v82;
  _BYTE v83[128];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", CFSTR("identifier")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "describedImageRequested"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
  v66 = v15;
  v18 = objc_msgSend(v15, "containsObject:", v17);

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "describedImageRequested"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "describedImageShown"));
    if ((objc_msgSend(v12, "needsNewVersion") & 1) != 0
      || !objc_msgSend(v10, "isMatching:withCandidateImage:includeQuality:", v19, v72, 0)
      || objc_msgSend(v72, "quality") <= 0x65)
    {
      v71 = objc_msgSend(v11, "persistanceOptions");
      v75 = 0u;
      v76 = 0u;
      v77 = 0u;
      v78 = 0u;
      v20 = v9;
      v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
      if (!v21)
        goto LABEL_44;
      v64 = v9;
      v65 = v13;
      v70 = 0;
      v73 = -1;
      v74 = *(_QWORD *)v76;
      v69 = v19;
      v67 = v10;
      v68 = v20;
      while (2)
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v76 != v74)
            objc_enumerationMutation(v20);
          v23 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)i);
          +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", BICCacheStatsOperationInterestCheck[0], v11);
          v24 = objc_msgSend(v10, "differenceFromRequest:toCandidateImage:", v19, v23);
          if (v24 != (id)-1)
          {
            v25 = (unint64_t)v24;
            v26 = v11;
            if ((v71 & 2) != 0)
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "filePath"));
            else
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "image"));
            v28 = v27;

            v29 = objc_msgSend(v10, "isMatching:withCandidateImage:includeQuality:", v23, v72, 0);
            v30 = 0;
            if (objc_msgSend(v72, "isLowQuality"))
              v30 = objc_msgSend(v23, "quality") > 0x65;
            if (v25)
              v31 = 1;
            else
              v31 = v28 == 0;
            if (!v31
              && (objc_msgSend(v23, "isGeneric") & 1) == 0
              && (objc_msgSend(v12, "needsNewVersion") | v30 | v29 ^ 1) == 1)
            {
              v11 = v26;
              +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", BICCacheStatsOperationImageDelivered[0], v26);
              if (objc_msgSend(v72, "isLowQuality") && objc_msgSend(v23, "quality") >= 0x66)
              {
                v36 = BCImageCacheLog();
                v37 = objc_claimAutoreleasedReturnValue(v36);
                v9 = v64;
                v38 = v65;
                if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v80 = v23;
                  v81 = 2112;
                  v82 = v26;
                  v39 = "BCCacheManager: Performing quality upgrade on exact interest for image=%@ for request=%@";
                  goto LABEL_40;
                }
              }
              else
              {
                v40 = BCImageCacheLog();
                v37 = objc_claimAutoreleasedReturnValue(v40);
                v9 = v64;
                v38 = v65;
                if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v80 = v23;
                  v81 = 2112;
                  v82 = v26;
                  v39 = "BCCacheManager: Found exact interest for image=%@ for request=%@";
LABEL_40:
                  _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, v39, buf, 0x16u);
                }
              }
              v10 = v67;

              v41 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheOperation operationWithKind:vendedImageInterest:subject:request:](BCCacheOperation, "operationWithKind:vendedImageInterest:subject:request:", 1, v12, v23, v26));
              objc_msgSend(v38, "addObject:", v41);

              v42 = v23;
              v13 = v38;
              v19 = v69;
              if (objc_msgSend(v42, "isLowQuality"))
              {
                v43 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheOperation operationWithKind:vendedImageInterest:request:](BCCacheOperation, "operationWithKind:vendedImageInterest:request:", 2, v12, v11));
                objc_msgSend(v38, "addObject:", v43);

              }
              objc_msgSend(v12, "setNeedsNewVersion:", 0);

              v21 = 0;
              v20 = v68;
LABEL_44:

              goto LABEL_45;
            }
            v11 = v26;
            if (v25 < v73)
            {
              v32 = v23;

              v73 = v25;
              v70 = v32;
            }
            v10 = v67;
            v20 = v68;
            v19 = v69;
          }
        }
        v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
        if (v21)
          continue;
        break;
      }

      if (!v70)
      {
        v21 = 0;
        v9 = v64;
        v13 = v65;
        goto LABEL_45;
      }
      v33 = BCImageCacheLog();
      v34 = objc_claimAutoreleasedReturnValue(v33);
      v13 = v65;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v80 = v70;
        v81 = 2112;
        v82 = v19;
        _os_log_impl(&dword_0, v34, OS_LOG_TYPE_INFO, "BCCacheManager: Found inexact match for of image=%@ for request=%@", buf, 0x16u);
      }

      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "image"));
      if (!v73 && (v71 & 2) != 0)
      {
        v20 = objc_claimAutoreleasedReturnValue(+[BCCacheOperation operationWithKind:subject:request:](BCCacheOperation, "operationWithKind:subject:request:", 5, v11, v11));
        objc_msgSend(v65, "addObject:", v20);
        v9 = v64;
LABEL_33:
        v21 = v70;
        goto LABEL_44;
      }
      if (v35)
      {
        v21 = v70;
        v9 = v64;
        if (objc_msgSend(v10, "isMatching:withGenericImage:", v19, v70))
        {
          if (objc_msgSend(v72, "isGenericSeriesStack"))
            v45 = objc_msgSend(v70, "isSeriesStackWithGenerics");
          else
            v45 = 0;
          if (v72 && objc_msgSend(v72, "quality") != 1)
          {
            if (objc_msgSend(v72, "quality") == 2)
            {
              if (((objc_msgSend(v12, "needsNewVersion") | v45) & 1) == 0)
                goto LABEL_88;
            }
            else if (!v45)
            {
              goto LABEL_88;
            }
          }
          +[BICCacheStats incrementCounter:](BICCacheStats, "incrementCounter:", kBICCacheStatsCounterGenericsDelivered[0]);
          +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", BICCacheStatsOperationGenericImageDelivered[0], v11);
          v58 = BCImageCacheLog();
          v59 = objc_claimAutoreleasedReturnValue(v58);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            v60 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bu_prettyDescription](v20, "bu_prettyDescription"));
            *(_DWORD *)buf = 138412290;
            v80 = v60;
            _os_log_impl(&dword_0, v59, OS_LOG_TYPE_INFO, "BCCacheManager: Found generic interest for images=%@", buf, 0xCu);

          }
          if ((objc_msgSend(v11, "requestOptions") & 8) != 0
            || (v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "primaryRequest")),
                v61,
                v61))
          {
            objc_msgSend(v70, "setRequestOptions:", objc_msgSend(v70, "requestOptions") | 8);
          }
          v62 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheOperation operationWithKind:vendedImageInterest:subject:request:](BCCacheOperation, "operationWithKind:vendedImageInterest:subject:request:", 1, v12, v70, v11));
          objc_msgSend(v65, "addObject:", v62);

          if ((objc_msgSend(v11, "requestOptions") & 8) == 0)
          {
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "primaryRequest"));

            if (!v63)
            {
              v20 = objc_claimAutoreleasedReturnValue(+[BCCacheOperation operationWithKind:vendedImageInterest:request:](BCCacheOperation, "operationWithKind:vendedImageInterest:request:", 3, v12, v11));
              objc_msgSend(v65, "addObject:", v20);
              goto LABEL_33;
            }
          }
LABEL_88:
          v21 = v70;
          goto LABEL_45;
        }
        if ((objc_msgSend(v11, "requestOptions") & 0x10) == 0
          || (v48 = objc_msgSend(v19, "processingOptions"),
              v31 = v48 == objc_msgSend(v70, "processingOptions"),
              v21 = v70,
              !v31))
        {
          if (!objc_msgSend(v10, "isTransformableMatch:withCandidateImage:", v19, v21))
          {
            v56 = BCImageCacheLog();
            v20 = objc_claimAutoreleasedReturnValue(v56);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v80 = v21;
              v81 = 2112;
              v82 = v11;
              _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "BCCacheManager: Not transformable image=%@ for request=%@", buf, 0x16u);
            }
            goto LABEL_44;
          }
          v53 = v21;
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "image"));

          if (v54)
          {
            +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", BICCacheStatsOperationBestMatchNeedsTransform[0], v11);
            v55 = objc_claimAutoreleasedReturnValue(+[BCCacheOperation operationWithKind:subject:result:request:](BCCacheOperation, "operationWithKind:subject:result:request:", 0, v53, v19, v11));
            objc_msgSend(v65, "addObject:", v55);
            v21 = v53;
            v20 = v55;
            goto LABEL_44;
          }
          v21 = v53;
LABEL_45:

          goto LABEL_46;
        }
        +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", BICCacheStatsOperationImageDelivered[0], v11);
        v49 = BCImageCacheLog();
        v50 = objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject bu_prettyDescription](v20, "bu_prettyDescription"));
          *(_DWORD *)buf = 138412290;
          v80 = v51;
          _os_log_impl(&dword_0, v50, OS_LOG_TYPE_INFO, "BCCacheManager: Found best match interest for images=%@", buf, 0xCu);

        }
        v21 = v70;
        v52 = objc_claimAutoreleasedReturnValue(+[BCCacheOperation operationWithKind:vendedImageInterest:subject:request:](BCCacheOperation, "operationWithKind:vendedImageInterest:subject:request:", 1, v12, v70, v11));
      }
      else
      {
        v46 = objc_msgSend(v72, "quality");
        v9 = v64;
        if (v46 != 1)
        {
          v47 = objc_msgSend(v70, "quality") > v46 || objc_msgSend(v70, "quality") == 0;
          v57 = objc_msgSend(v72, "isGenericSeriesStack")
             && (objc_msgSend(v70, "processingOptions") >> 5) & 1;
          if (!v47 && !v57)
            goto LABEL_88;
        }
        +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", BICCacheStatsOperationBestMatchNeedsFetch[0], v11);
        v21 = v70;
        objc_msgSend(v70, "setPriority:", objc_msgSend(v19, "priority"));
        v52 = objc_claimAutoreleasedReturnValue(+[BCCacheOperation operationWithKind:subject:request:](BCCacheOperation, "operationWithKind:subject:request:", 4, v70, v11));
      }
      v20 = v52;
      objc_msgSend(v65, "addObject:", v52);
      goto LABEL_44;
    }
LABEL_46:

  }
  return v13;
}

- (BCCacheManager)initWithClassDefinitions:(id)a3 highPriorityGeneralQueue:(id)a4 lowPriorityGeneralQueue:(id)a5 highPriorityTargetQueue:(id)a6 backgroundTargetQueue:(id)a7 delegate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  BCCacheManager *v18;
  BCCacheManager *v19;
  uint64_t v20;
  NSPointerArray *vendedImageInterests;
  uint64_t v22;
  NSMutableArray *outstandingRequests;
  uint64_t v24;
  NSMutableArray *cgInterests;
  uint64_t v26;
  NSMutableArray *genericRequestsInProcess;
  uint64_t v28;
  NSMutableDictionary *blankImages;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  uint64_t v35;
  NSMutableSet *versionBumpedIdentifiers;
  uint64_t v37;
  NSMutableSet *adamIDsToPreload;
  id v39;
  id *v40;
  id v41;
  id v42;
  id v43;
  id *v44;
  id v45;
  id v46;
  id v47;
  id *v48;
  id v49;
  id v50;
  dispatch_queue_attr_t v51;
  NSObject *v52;
  dispatch_queue_attr_t v53;
  NSObject *v54;
  dispatch_queue_t v55;
  id v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  id v60;
  void *v61;
  dispatch_time_t v62;
  NSObject *v63;
  BCCacheManager *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  BCCacheManager *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  BICDescribedImageComparator *v75;
  BICDescribedImageComparator *comparator;
  void *v77;
  void *v78;
  BICMemoryPersistentStoring *v79;
  BICImageSetPersisting *v80;
  BICImageSetPersisting *imageSetPersistence;
  void *v82;
  void *v83;
  id v84;
  NSObject *v85;
  id v86;
  BICImageSetPersisting *v87;
  BICImageSetPersisting *v88;
  BCCacheProductProfileFetching *v89;
  BCCacheProductProfileFetching *profileFetcher;
  uint64_t v91;
  BCURLSchemeHandling *protocolHandler;
  id v93;
  void *v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  void *v100;
  id v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  BICLevelCaching *v106;
  BICLevelCaching *level4;
  BICLevelCaching *v108;
  BICLevelCaching *level3;
  BICLevelCaching *v110;
  BICLevelCaching *level2;
  BICLevelCaching *v112;
  BICLevelCaching *level1;
  uint64_t v114;
  BCSeriesStackDecomposing *seriesDecomposer;
  id v116;
  void *v117;
  BCStackManaging *v118;
  BCStackManaging *stackManager;
  id v120;
  void *v121;
  void *v122;
  BCCacheTransforming *v123;
  BCCacheTransforming *transformController;
  BCCacheManager *v125;
  uint64_t v126;
  NSDictionary *cacheMetaData;
  void *v129;
  BCCacheManager *v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  void *v138;
  id v139;
  id v140;
  id v141;
  void *v142;
  id v143;
  void *v144;
  id v145;
  id v146;
  id v147;
  id v148;
  _QWORD block[4];
  BCCacheManager *v150;
  _QWORD v151[4];
  id *v152;
  _QWORD v153[4];
  id *v154;
  _QWORD v155[4];
  id *v156;
  objc_super v157;
  uint8_t buf[4];
  BCCacheManager *v159;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v148 = a6;
  v147 = a7;
  v17 = a8;
  v157.receiver = self;
  v157.super_class = (Class)BCCacheManager;
  v18 = -[BCCacheManager init](&v157, "init");
  if (v18)
  {
    v19 = v18;
    v131 = v16;
    v132 = v15;
    v18->_accessLock._os_unfair_lock_opaque = 0;
    v20 = objc_claimAutoreleasedReturnValue(+[NSPointerArray weakObjectsPointerArray](NSPointerArray, "weakObjectsPointerArray"));
    vendedImageInterests = v19->_vendedImageInterests;
    v19->_vendedImageInterests = (NSPointerArray *)v20;

    v22 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    outstandingRequests = v19->_outstandingRequests;
    v19->_outstandingRequests = (NSMutableArray *)v22;

    v24 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    cgInterests = v19->_cgInterests;
    v19->_cgInterests = (NSMutableArray *)v24;

    v26 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    genericRequestsInProcess = v19->_genericRequestsInProcess;
    v19->_genericRequestsInProcess = (NSMutableArray *)v26;

    v28 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    blankImages = v19->_blankImages;
    v19->_blankImages = (NSMutableDictionary *)v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v19->_debugLayout = objc_msgSend(v30, "BOOLForKey:", CFSTR("BKLibraryImageCacheDebugLayout"));

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v19->_forceStats = objc_msgSend(v31, "BOOLForKey:", CFSTR("BKLibraryImageCacheGatherStats"));

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v32, "doubleForKey:", CFSTR("BCCacheManagerNextDiskPruneDate"));
    v19->_nextDiskPruneDate = v33;

    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v19->_nextRamPruneDate = v34 + 2.0;
    v35 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    versionBumpedIdentifiers = v19->_versionBumpedIdentifiers;
    v19->_versionBumpedIdentifiers = (NSMutableSet *)v35;

    v37 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    adamIDsToPreload = v19->_adamIDsToPreload;
    v19->_adamIDsToPreload = (NSMutableSet *)v37;

    v39 = objc_alloc((Class)BUCoalescingCallBlock);
    v155[0] = _NSConcreteStackBlock;
    v155[1] = 3221225472;
    v146 = v17;
    v155[2] = sub_7E658;
    v155[3] = &unk_28B728;
    v40 = v19;
    v156 = v40;
    v41 = objc_msgSend(v39, "initWithNotifyBlock:blockDescription:", v155, CFSTR("CoverCacheVersionBump"));
    v42 = v40[11];
    v40[11] = v41;

    objc_msgSend(v40[11], "setCoalescingDelay:", 3.0);
    objc_msgSend(v40[11], "setMaximumDelay:", 3.0);
    v43 = objc_alloc((Class)BUCoalescingCallBlock);
    v153[0] = _NSConcreteStackBlock;
    v153[1] = 3221225472;
    v153[2] = sub_7E810;
    v153[3] = &unk_28B728;
    v44 = v40;
    v154 = v44;
    v45 = objc_msgSend(v43, "initWithNotifyBlock:blockDescription:", v153, CFSTR("CoverCachePruning"));
    v46 = v44[12];
    v44[12] = v45;

    objc_msgSend(v44[12], "setCoalescingDelay:", 2.0);
    objc_msgSend(v44[12], "setMaximumDelay:", 2.0);
    v47 = objc_alloc((Class)BUCoalescingCallBlock);
    v151[0] = _NSConcreteStackBlock;
    v151[1] = 3221225472;
    v151[2] = sub_7E86C;
    v151[3] = &unk_28B728;
    v48 = v44;
    v152 = v48;
    v49 = objc_msgSend(v47, "initWithNotifyBlock:blockDescription:", v151, CFSTR("CoverCachePreloading"));
    v50 = v48[13];
    v48[13] = v49;

    objc_msgSend(v48[13], "setCoalescingDelay:", 15.0);
    objc_storeStrong(v48 + 3, a4);
    objc_storeStrong(v48 + 4, a5);
    objc_storeStrong(v48 + 5, a6);
    objc_storeStrong(v48 + 6, a7);
    v51 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v52 = objc_claimAutoreleasedReturnValue(v51);
    v53 = dispatch_queue_attr_make_with_qos_class(v52, QOS_CLASS_USER_INITIATED, 0);
    v54 = objc_claimAutoreleasedReturnValue(v53);
    v55 = dispatch_queue_create("CoverCacheGenerics", v54);
    v56 = v48[2];
    v48[2] = v55;

    objc_storeWeak(v48 + 9, v17);
    v57 = objc_claimAutoreleasedReturnValue(+[BICWorkQueue workQueueWithHighPriorityTargetQueue:backgroundTargetQueue:numConcurrentWorkItems:](BICWorkQueue, "workQueueWithHighPriorityTargetQueue:backgroundTargetQueue:numConcurrentWorkItems:", v48[4], v48[4], 1));
    v58 = v48[7];
    v48[7] = (id)v57;

    objc_msgSend(v48[7], "setIdentifier:", CFSTR("CoverCacheLowPriority"));
    objc_msgSend(v48[7], "setManualCompletion:", 1);
    v59 = objc_claimAutoreleasedReturnValue(+[BICWorkQueue workQueueWithHighPriorityTargetQueue:backgroundTargetQueue:numConcurrentWorkItems:](BICWorkQueue, "workQueueWithHighPriorityTargetQueue:backgroundTargetQueue:numConcurrentWorkItems:", v48[2], v48[4], 1));
    v60 = v48[8];
    v48[8] = (id)v59;

    objc_msgSend(v48[8], "setIdentifier:", CFSTR("CoverCacheGenerics"));
    objc_msgSend(v48[8], "setManualCompletion:", 1);
    +[BICCacheStats prepare](BICCacheStats, "prepare");
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
    objc_msgSend(v61, "addObserver:", v48);

    v62 = dispatch_time(0, 60000000000);
    v63 = v48[4];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_7E8C8;
    block[3] = &unk_28B960;
    v64 = v48;
    v150 = v64;
    dispatch_after(v62, v63, block);
    v65 = objc_msgSend(v14, "objectForKeyedSubscript:", kPersistingClass);
    v143 = objc_msgSend(v14, "objectForKeyedSubscript:", kL1DataStoringClass);
    v66 = objc_msgSend(v14, "objectForKeyedSubscript:", kL2DataStoringClass);
    v141 = objc_msgSend(v14, "objectForKeyedSubscript:", kL3DataStoringClass);
    v67 = objc_msgSend(v14, "objectForKeyedSubscript:", kL4DataStoringClass);
    v140 = objc_msgSend(v14, "objectForKeyedSubscript:", kL1StorgageClass);
    v139 = objc_msgSend(v14, "objectForKeyedSubscript:", kL2StorgageClass);
    v137 = objc_msgSend(v14, "objectForKeyedSubscript:", kL3StorgageClass);
    v136 = objc_msgSend(v14, "objectForKeyedSubscript:", kL4StorgageClass);
    v135 = objc_msgSend(v14, "objectForKeyedSubscript:", kLevelClass);
    v145 = objc_msgSend(v14, "objectForKeyedSubscript:", kStackRendererClass);
    v134 = objc_msgSend(v14, "objectForKeyedSubscript:", kStackManagerClass);
    v133 = objc_msgSend(v14, "objectForKeyedSubscript:", kTransformerClass);
    v68 = objc_msgSend(v14, "objectForKeyedSubscript:", kTransformControllerClass);
    v69 = objc_msgSend(v14, "objectForKeyedSubscript:", kProfileFetchingClass);
    v70 = objc_msgSend(v14, "objectForKeyedSubscript:", kPersistentStoreClass);
    v71 = 0;
    if (!v70
      || !v65
      || !v143
      || !v66
      || !v141
      || !v67
      || !v140
      || !v139
      || !v137
      || !v136
      || !v135
      || !v145
      || !v134
      || !v133
      || !v68
      || !v69)
    {
LABEL_103:

      v16 = v131;
      v15 = v132;
      goto LABEL_104;
    }
    v72 = v70;
    v129 = v68;
    v73 = objc_claimAutoreleasedReturnValue(+[BCCacheManager _cacheDirectoryPath](BCCacheManager, "_cacheDirectoryPath"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v130 = (BCCacheManager *)v73;
    objc_msgSend(v74, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v73, 1, 0, 0);

    v75 = objc_alloc_init(BICDescribedImageComparator);
    comparator = v64->_comparator;
    v64->_comparator = v75;

    v77 = v67;
    v78 = v66;
    if (objc_msgSend(v65, "conformsToProtocol:", &OBJC_PROTOCOL___BICImageSetPersisting))
    {
      if (v64->_useRamBasedDB)
      {
        v79 = -[BICMemoryPersistentStoring initWithURL:]([BICMemoryPersistentStoring alloc], "initWithURL:", 0);
        v80 = (BICImageSetPersisting *)objc_msgSend(objc_msgSend(v65, "alloc"), "initWithPersistentStore:comparator:", v79, v64->_comparator);
        imageSetPersistence = v64->_imageSetPersistence;
        v64->_imageSetPersistence = v80;
      }
      else
      {
        if (v64->_clearCacheOnLaunch)
        {
          v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          objc_msgSend(v82, "removeItemAtPath:error:", v130, 0);

          v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          objc_msgSend(v83, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v130, 0, 0, 0);

        }
        +[BCCacheManager migrateCacheAt:](BCCacheManager, "migrateCacheAt:", v130);
        v84 = BCImageCacheLog();
        v85 = objc_claimAutoreleasedReturnValue(v84);
        if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v159 = v130;
          _os_log_impl(&dword_0, v85, OS_LOG_TYPE_INFO, "BCCacheManager: Cache is at path=%@", buf, 0xCu);
        }

        v79 = (BICMemoryPersistentStoring *)objc_claimAutoreleasedReturnValue(-[BCCacheManager stringByAppendingPathComponent:](v130, "stringByAppendingPathComponent:", CFSTR("imagesets.sqlite")));
        imageSetPersistence = (BICImageSetPersisting *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v79));
        v86 = objc_msgSend(objc_msgSend(v72, "alloc"), "initWithURL:", imageSetPersistence);
        v87 = (BICImageSetPersisting *)objc_msgSend(objc_msgSend(v65, "alloc"), "initWithPersistentStore:comparator:", v86, v64->_comparator);
        v88 = v64->_imageSetPersistence;
        v64->_imageSetPersistence = v87;

      }
      -[BICImageSetPersisting setDelegate:](v64->_imageSetPersistence, "setDelegate:", v64);
    }
    if (objc_msgSend(v69, "conformsToProtocol:", &OBJC_PROTOCOL___BCCacheProductProfileFetching))
    {
      v89 = (BCCacheProductProfileFetching *)objc_msgSend(objc_msgSend(v69, "alloc"), "init");
      profileFetcher = v64->_profileFetcher;
      v64->_profileFetcher = v89;

    }
    v91 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", kURLProtocolHandlerInstance));
    protocolHandler = v64->_protocolHandler;
    v64->_protocolHandler = (BCURLSchemeHandling *)v91;

    if (objc_msgSend(v143, "conformsToProtocol:", &OBJC_PROTOCOL___BICDataStoring))
    {
      v93 = objc_msgSend(objc_msgSend(v143, "alloc"), "initWithCachePath:", v130);
      objc_msgSend(v93, "setIdentifier:", CFSTR("L1"));
      objc_msgSend(v93, "setDelegate:", v64);
      if (v64->_clearCacheOnLaunch)
        objc_msgSend(v93, "_clean:", &stru_28F130);
    }
    else
    {
      v93 = 0;
    }
    v94 = v137;
    if (objc_msgSend(v78, "conformsToProtocol:", &OBJC_PROTOCOL___BICDataStoring))
    {
      v95 = objc_msgSend(objc_msgSend(v78, "alloc"), "initWithCachePath:", v130);
      objc_msgSend(v95, "setIdentifier:", CFSTR("L2"));
      objc_msgSend(v95, "setDelegate:", v64);
      if (v64->_clearCacheOnLaunch)
        objc_msgSend(v95, "_clean:", &stru_28F150);
    }
    else
    {
      v95 = 0;
    }
    if (objc_msgSend(v141, "conformsToProtocol:", &OBJC_PROTOCOL___BICDataStoring))
    {
      v96 = objc_msgSend(objc_msgSend(v141, "alloc"), "initWithCachePath:", v130);
      objc_msgSend(v96, "setIdentifier:", CFSTR("L3"));
      objc_msgSend(v96, "setDelegate:", v64);
      if (v64->_clearCacheOnLaunch)
        objc_msgSend(v96, "_clean:", &stru_28F170);
    }
    else
    {
      v96 = 0;
    }
    if (objc_msgSend(v77, "conformsToProtocol:", &OBJC_PROTOCOL___BICDataStoring))
    {
      v97 = objc_msgSend(objc_msgSend(v77, "alloc"), "initWithCachePath:", v130);
      objc_msgSend(v97, "setIdentifier:", CFSTR("L4"));
      objc_msgSend(v97, "setDelegate:", v64);
      if (v64->_clearCacheOnLaunch)
        objc_msgSend(v97, "_clean:", &stru_28F190);
    }
    else
    {
      v97 = 0;
    }
    v138 = v93;
    if (objc_msgSend(v140, "conformsToProtocol:", &OBJC_PROTOCOL___BICImageSetStoring_Persistence))
    {
      v98 = objc_msgSend(objc_msgSend(v140, "alloc"), "initWithLevelID:imageSetPersistence:comparator:dataStore:", 0, v64->_imageSetPersistence, v64->_comparator, v93);
    }
    else
    {
      if (!objc_msgSend(v140, "conformsToProtocol:", &OBJC_PROTOCOL___BICImageSetStoring))
      {
        v144 = 0;
LABEL_52:
        if (objc_msgSend(v139, "conformsToProtocol:", &OBJC_PROTOCOL___BICImageSetStoring_Persistence))
        {
          v99 = objc_msgSend(objc_msgSend(v139, "alloc"), "initWithLevelID:imageSetPersistence:comparator:dataStore:", 1, v64->_imageSetPersistence, v64->_comparator, v95);
        }
        else
        {
          if (!objc_msgSend(v139, "conformsToProtocol:", &OBJC_PROTOCOL___BICImageSetStoring))
          {
            v100 = 0;
LABEL_58:
            if (objc_msgSend(v94, "conformsToProtocol:", &OBJC_PROTOCOL___BICImageSetStoring_Persistence))
            {
              v101 = objc_msgSend(objc_msgSend(v94, "alloc"), "initWithLevelID:imageSetPersistence:comparator:dataStore:", 2, v64->_imageSetPersistence, v64->_comparator, v96);
            }
            else
            {
              if (!objc_msgSend(v94, "conformsToProtocol:", &OBJC_PROTOCOL___BICImageSetStoring))
              {
                v102 = 0;
LABEL_64:
                v142 = v96;
                if (objc_msgSend(v136, "conformsToProtocol:", &OBJC_PROTOCOL___BICImageSetStoring_Persistence))
                {
                  v103 = objc_msgSend(objc_msgSend(v136, "alloc"), "initWithLevelID:imageSetPersistence:comparator:dataStore:", 3, v64->_imageSetPersistence, v64->_comparator, v97);
                  v104 = v135;
                }
                else
                {
                  v104 = v135;
                  if (!objc_msgSend(v136, "conformsToProtocol:", &OBJC_PROTOCOL___BICImageSetStoring))
                  {
                    v105 = v95;
                    v103 = 0;
                    goto LABEL_70;
                  }
                  v103 = objc_msgSend(objc_msgSend(v136, "alloc"), "initWithLevelID:comparator:dataStore:", 0, v64->_comparator, v97);
                }
                v105 = v95;
                objc_msgSend(v103, "setIdentifier:", CFSTR("L4"));
LABEL_70:
                if (objc_msgSend(v104, "conformsToProtocol:", &OBJC_PROTOCOL___BICLevelCaching))
                {
                  v106 = (BICLevelCaching *)objc_msgSend(objc_msgSend(v104, "alloc"), "initWithLevelID:highPriorityTargetQueue:backgroundTargetQueue:imageSetStore:comparator:nextCacheLevel:", 3, v148, v147, v103, v64->_comparator, 0);
                  level4 = v64->_level4;
                  v64->_level4 = v106;

                  v108 = (BICLevelCaching *)objc_msgSend(objc_msgSend(v104, "alloc"), "initWithLevelID:highPriorityTargetQueue:backgroundTargetQueue:imageSetStore:comparator:nextCacheLevel:", 2, v148, v147, v102, v64->_comparator, v64->_level4);
                  level3 = v64->_level3;
                  v64->_level3 = v108;

                  v110 = (BICLevelCaching *)objc_msgSend(objc_msgSend(v104, "alloc"), "initWithLevelID:highPriorityTargetQueue:backgroundTargetQueue:imageSetStore:comparator:nextCacheLevel:", 1, v148, v147, v100, v64->_comparator, v64->_level3);
                  level2 = v64->_level2;
                  v64->_level2 = v110;

                  v112 = (BICLevelCaching *)objc_msgSend(objc_msgSend(v104, "alloc"), "initWithLevelID:highPriorityTargetQueue:backgroundTargetQueue:imageSetStore:comparator:nextCacheLevel:", 0, v148, v147, v144, v64->_comparator, v64->_level2);
                  level1 = v64->_level1;
                  v64->_level1 = v112;

                }
                v114 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", kSeriesStackDecomposingInstance));
                seriesDecomposer = v64->_seriesDecomposer;
                v64->_seriesDecomposer = (BCSeriesStackDecomposing *)v114;

                if (objc_msgSend(v145, "conformsToProtocol:", &OBJC_PROTOCOL___BCStackRendering))
                {
                  v116 = objc_msgSend(objc_msgSend(v145, "alloc"), "init");
                  objc_msgSend(v116, "setImageRepository:", v64);
                  v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", kSeriesStackDecomposingInstance));
                  objc_msgSend(v116, "setSeriesDecomposer:", v117);

                }
                else
                {
                  v116 = 0;
                }
                if (objc_msgSend(v134, "conformsToProtocol:", &OBJC_PROTOCOL___BCStackManaging))
                {
                  v118 = (BCStackManaging *)objc_msgSend(objc_msgSend(v134, "alloc"), "initWithHighPriorityTargetQueue:backgroundTargetQueue:renderer:", v148, v147, v116);
                  stackManager = v64->_stackManager;
                  v64->_stackManager = v118;

                  -[BCStackManaging setDelegate:](v64->_stackManager, "setDelegate:", v64);
                }
                if (objc_msgSend(v133, "conformsToProtocol:", &OBJC_PROTOCOL___BCCacheImageTransforming))
                {
                  v120 = objc_msgSend(objc_msgSend(v133, "alloc"), "init");
                  v121 = v133;
                  v122 = v120;
                }
                else
                {
                  v121 = v133;
                  v122 = 0;
                }
                if (objc_msgSend(v121, "conformsToProtocol:", &OBJC_PROTOCOL___BCCacheImageTransforming))
                {
                  v123 = (BCCacheTransforming *)objc_msgSend(objc_msgSend(v129, "alloc"), "initWithHighPriorityTargetQueue:backgroundTargetQueue:transformer:", v148, v147, v122);
                  transformController = v64->_transformController;
                  v64->_transformController = v123;

                  -[BCCacheTransforming setDelegate:](v64->_transformController, "setDelegate:", v64);
                }
                if (v64->_imageSetPersistence
                  && v138
                  && v105
                  && v142
                  && v97
                  && v144
                  && v100
                  && v102
                  && v103
                  && v64->_level1
                  && v64->_level2
                  && v64->_level3
                  && v64->_level4
                  && v116
                  && v64->_stackManager
                  && v122
                  && v64->_transformController
                  && v64->_profileFetcher)
                {
                  v125 = (BCCacheManager *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
                  -[BCCacheManager addObserver:selector:name:object:](v125, "addObserver:selector:name:object:", v64, "_memoryWarning:", UIApplicationDidReceiveMemoryWarningNotification, 0);
                }
                else
                {
                  v125 = v64;
                  v64 = 0;
                }

                v71 = v64;
                v17 = v146;
                v64 = v130;
                goto LABEL_103;
              }
              v101 = objc_msgSend(objc_msgSend(v94, "alloc"), "initWithLevelID:comparator:dataStore:", 0, v64->_comparator, v96);
            }
            v102 = v101;
            objc_msgSend(v101, "setIdentifier:", CFSTR("L3"));
            goto LABEL_64;
          }
          v99 = objc_msgSend(objc_msgSend(v139, "alloc"), "initWithLevelID:comparator:dataStore:", 0, v64->_comparator, v95);
        }
        v100 = v99;
        objc_msgSend(v99, "setIdentifier:", CFSTR("L2"));
        goto LABEL_58;
      }
      v98 = objc_msgSend(objc_msgSend(v140, "alloc"), "initWithLevelID:comparator:dataStore:", 0, v64->_comparator, v93);
    }
    v144 = v98;
    objc_msgSend(v98, "setIdentifier:", CFSTR("L1"));
    goto LABEL_52;
  }
  v71 = 0;
LABEL_104:
  v126 = objc_claimAutoreleasedReturnValue(+[BCCacheManager loadCacheMetaData](BCCacheManager, "loadCacheMetaData"));
  cacheMetaData = v71->_cacheMetaData;
  v71->_cacheMetaData = (NSDictionary *)v126;

  return v71;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BCCacheManager;
  -[BCCacheManager dealloc](&v4, "dealloc");
}

- (void)_memoryWarning:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];

  v4 = BCImageCacheLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1B561C();

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager level1](self, "level1"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_7E9FC;
  v7[3] = &unk_28F1F8;
  v7[4] = self;
  objc_msgSend(v6, "gatherPrunableItemsForMedium:withCompletion:", 0, v7);

}

- (void)_checkRestrictedContentSettings
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  unsigned int v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
  v4 = objc_msgSend(v3, "isExplicitContentAllowed");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager cacheMetaData](self, "cacheMetaData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BCCacheAllowRestrictedContent")));
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v4 != v7)
    -[BCCacheManager explicitContentRestrictedChanged](self, "explicitContentRestrictedChanged");
}

- (void)_preloadCache
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (!+[BKReachability isOffline](BKReachability, "isOffline"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BICDescribedImage describedImageWithIdentifier:size:processingOptions:](BICDescribedImage, "describedImageWithIdentifier:size:processingOptions:", CFSTR("prioritizer"), 0, CGSizeZero.width, CGSizeZero.height));
    objc_msgSend(v3, "setPriority:", 2);
    objc_initWeak(&location, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager lowPriorityWorkQueue](self, "lowPriorityWorkQueue"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_7EC18;
    v5[3] = &unk_28F220;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "addWorkItemWithPriority:description:block:", v3, CFSTR("CacheManager preload"), v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);

  }
}

- (void)_preloadAdamIDs:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;

  v4 = a3;
  v5 = BCImageCacheLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count")));
    *(_DWORD *)buf = 138412290;
    v14 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "BCCacheManager: Preloading %@ asset IDs", buf, 0xCu);

  }
  if (objc_msgSend(v4, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BICDescribedImage describedImageWithIdentifier:size:processingOptions:](BICDescribedImage, "describedImageWithIdentifier:size:processingOptions:", CFSTR("prioritizer"), 0, CGSizeZero.width, CGSizeZero.height));
    objc_msgSend(v8, "setPriority:", 2);
    objc_initWeak((id *)buf, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager lowPriorityWorkQueue](self, "lowPriorityWorkQueue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_7EF44;
    v10[3] = &unk_28F290;
    objc_copyWeak(&v12, (id *)buf);
    v11 = v4;
    objc_msgSend(v9, "addWorkItemWithPriority:description:block:", v8, CFSTR("CacheManager preload adamIDs"), v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);

  }
}

- (void)_preloadOneBatch
{
  _QWORD *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[2];
  void (*v13)(uint64_t);
  void *v14;
  BCCacheManager *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  id location;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;

  objc_initWeak(&location, self);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_7E790;
  v26 = sub_7E7A0;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v13 = sub_7F4AC;
  v14 = &unk_28F2B8;
  v15 = self;
  v16 = &v22;
  v17 = &v18;
  v3 = v12;
  os_unfair_lock_lock(&self->_accessLock);
  v13((uint64_t)v3);
  os_unfair_lock_unlock(&self->_accessLock);

  if (objc_msgSend((id)v23[5], "count"))
  {
    v4 = BCImageCacheLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)v23[5], "count")));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v19[3]));
      *(_DWORD *)buf = 138412546;
      v30 = v6;
      v31 = 2112;
      v32 = v7;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "BCCacheManager: Preloading one batch of %@ asset IDs, remaining=%@", buf, 0x16u);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BICDescribedImage describedImageWithIdentifier:size:processingOptions:](BICDescribedImage, "describedImageWithIdentifier:size:processingOptions:", CFSTR("prioritizer"), 0, CGSizeZero.width, CGSizeZero.height));
    objc_msgSend(v8, "setPriority:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager lowPriorityWorkQueue](self, "lowPriorityWorkQueue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_7F5A0;
    v10[3] = &unk_28F2E0;
    objc_copyWeak(&v11, &location);
    v10[4] = &v22;
    objc_msgSend(v9, "addWorkItemWithPriority:description:block:", v8, CFSTR("CacheManager preload one batch"), v10);

    objc_destroyWeak(&v11);
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  objc_destroyWeak(&location);
}

- (void)_preloadBatch:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = BCImageCacheLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v16 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "BCCacheManager: Pre-loading a batch of %lu identifiers", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager profileFetcher](self, "profileFetcher"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_7F830;
  v12[3] = &unk_28F388;
  objc_copyWeak(&v14, (id *)buf);
  v12[4] = self;
  v11 = v7;
  v13 = v11;
  objc_msgSend(v10, "batchFetchCoverURLsFor:completion:", v6, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

- (void)addDescribedImages:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[BCCacheManager workHighPriorityTarget](self, "workHighPriorityTarget"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_7FE04;
    v6[3] = &unk_28B808;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

- (void)_addDescribedImages:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void **v13;
  uint64_t v14;
  id (*v15)(uint64_t);
  void *v16;
  BCCacheManager *v17;
  id v18;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = (char *)objc_msgSend(v4, "count");
  if ((unint64_t)v6 >= 0x65)
  {
    v7 = v6;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subarrayWithRange:", 0, 100));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subarrayWithRange:", 100, v7 - 100));

    v10 = objc_claimAutoreleasedReturnValue(-[BCCacheManager workHighPriorityTarget](self, "workHighPriorityTarget"));
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_7FF4C;
    v16 = &unk_28B808;
    v17 = self;
    v18 = v9;
    v11 = v9;
    dispatch_async(v10, &v13);

    v4 = (id)v8;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0, v13, v14, v15, v16, v17));
  if (!objc_msgSend(v12, "priority"))
    objc_msgSend(v12, "setPriority:", 3);
  -[BCCacheManager _pushDescribedImages:forRequest:](self, "_pushDescribedImages:forRequest:", v4, v12);

  objc_autoreleasePoolPop(v5);
}

- (void)removeDescribedImages:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  BCCacheManager *v8;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[BCCacheManager workHighPriorityTarget](self, "workHighPriorityTarget"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_7FFF4;
    v6[3] = &unk_28B808;
    v7 = v4;
    v8 = self;
    dispatch_async(v5, v6);

  }
}

- (void)addProductProfileIDs:(id)a3 priority:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  BCCacheManager *v11;
  unint64_t v12;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[BCCacheManager workHighPriorityTarget](self, "workHighPriorityTarget"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8011C;
  block[3] = &unk_28C9C8;
  v11 = self;
  v12 = a4;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)addURLs:(id)a3 priority:(unint64_t)a4 quality:(unsigned __int16)a5 expiresAfter:(int64_t)a6
{
  id v10;
  NSObject *v11;
  id v12;
  _QWORD block[4];
  id v14;
  BCCacheManager *v15;
  int64_t v16;
  unint64_t v17;
  unsigned __int16 v18;

  v10 = a3;
  v11 = objc_claimAutoreleasedReturnValue(-[BCCacheManager workHighPriorityTarget](self, "workHighPriorityTarget"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_80378;
  block[3] = &unk_28F3D0;
  v16 = a6;
  v17 = a4;
  v18 = a5;
  v14 = v10;
  v15 = self;
  v12 = v10;
  dispatch_async(v11, block);

}

- (void)addURLTemplate:(id)a3 forIdentifier:(id)a4
{
  id v5;

  if (a3)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[BCCacheManager _extractImagesFromTemplate:identifier:initialSize:](self, "_extractImagesFromTemplate:identifier:initialSize:", a3, a4, 2048.0, 2048.0));
    if (objc_msgSend(v5, "count"))
      -[BCCacheManager _addDescribedImages:](self, "_addDescribedImages:", v5);

  }
}

- (void)removeURLs:(id)a3 priority:(unint64_t)a4 quality:(unsigned __int16)a5
{
  uint64_t v5;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  double height;
  void *i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *context;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = a5;
  v7 = a3;
  context = objc_autoreleasePoolPush();
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    height = CGSizeZero.height;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[BICDescribedImage describedImageWithIdentifier:size:processingOptions:](BICDescribedImage, "describedImageWithIdentifier:size:processingOptions:", v14, 0, CGSizeZero.width, height));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v14));
        objc_msgSend(v15, "setUrlString:", v16);

        objc_msgSend(v15, "setQuality:", v5);
        objc_msgSend(v15, "setPriority:", a4);
        objc_msgSend(v8, "addObject:", v15);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v8, "count"))
    -[BCCacheManager removeDescribedImages:](self, "removeDescribedImages:", v8);

  objc_autoreleasePoolPop(context);
}

- (void)addFilePaths:(id)a3 priority:(unint64_t)a4 quality:(unsigned __int16)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  BCCacheManager *v13;
  unint64_t v14;
  unsigned __int16 v15;

  v8 = a3;
  v9 = objc_claimAutoreleasedReturnValue(-[BCCacheManager workHighPriorityTarget](self, "workHighPriorityTarget"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_80864;
  v11[3] = &unk_28F3F8;
  v13 = self;
  v14 = a4;
  v15 = a5;
  v12 = v8;
  v10 = v8;
  dispatch_async(v9, v11);

}

- (void)addCGImage:(CGImage *)a3 withIdentifier:(id)a4 priority:(unint64_t)a5 quality:(unsigned __int16)a6
{
  id v10;
  NSObject *v11;
  id v12;
  _QWORD block[4];
  id v14;
  BCCacheManager *v15;
  CGImage *v16;
  unint64_t v17;
  unsigned __int16 v18;

  v10 = a4;
  CGImageRetain(a3);
  v11 = objc_claimAutoreleasedReturnValue(-[BCCacheManager workHighPriorityTarget](self, "workHighPriorityTarget"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_80AE0;
  block[3] = &unk_28F3D0;
  v16 = a3;
  v17 = a5;
  v18 = a6;
  v14 = v10;
  v15 = self;
  v12 = v10;
  dispatch_async(v11, block);

}

- (void)cleanCache
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[BCCacheManager workHighPriorityTarget](self, "workHighPriorityTarget"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_80C64;
  block[3] = &unk_28B960;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)fetchLayerForAssetID:(id)a3 size:(CGSize)a4 options:(unsigned __int16)a5
{
  uint64_t v5;
  id v7;
  int v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v14;
  CGSize v15;

  v5 = a5;
  v15 = a4;
  v7 = a3;
  v14 = 0;
  v8 = ClampImageSize((uint64_t)&v15, 0, &v14);
  v9 = v14;
  if (v8)
  {
    v10 = BCImageCacheLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1B5648((uint64_t)v7, (uint64_t)v9, v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager _fetchLayerForIdentifier:size:options:](self, "_fetchLayerForIdentifier:size:options:", v7, v5, v15.width, v15.height));

  return v12;
}

- (id)_fetchLayerForIdentifier:(id)a3 size:(CGSize)a4 options:(unsigned __int16)a5
{
  uint64_t v5;
  double width;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  v5 = a5;
  width = a4.width;
  v8 = a3;
  v9 = objc_autoreleasePoolPush();
  v10 = CGSizeScaleToScreen(width);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BICDescribedImage describedImageWithIdentifier:size:processingOptions:](BICDescribedImage, "describedImageWithIdentifier:size:processingOptions:", v8, v5, round(v10), round(v11)));
  objc_msgSend(v12, "setPriority:", 5);
  objc_msgSend(v12, "setUnknownAspectRatio:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager _fetchLayerForImage:](self, "_fetchLayerForImage:", v12));

  objc_autoreleasePoolPop(v9);
  return v13;
}

- (id)_fetchLayerForImage:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v9;
  id v10;

  v4 = a3;
  v5 = BCImageCacheLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "BCCacheManager: Fetching a layer for request=%@", (uint8_t *)&v9, 0xCu);
  }

  +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", BICCacheStatsOperationVendLayer[0], v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager _blankLayerForDescribedImage:](self, "_blankLayerForDescribedImage:", v4));
  -[BCCacheManager _fetchImage:forRequest:forInterest:](self, "_fetchImage:forRequest:forInterest:", v4, v4, v7);
  -[BCCacheManager _fetchGenericForDescription:forRequest:](self, "_fetchGenericForDescription:forRequest:", v4, v4);

  return v7;
}

- (void)fetchDescribedImageFileURLForImage:(id)a3 completion:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_80FB0;
  v7[3] = &unk_28F440;
  v8 = a4;
  v6 = v8;
  -[BCCacheManager fetchCGImageFor:forRequest:completion:](self, "fetchCGImageFor:forRequest:completion:", a3, a3, v7);

}

- (void)_fetchImage:(id)a3 forRequest:(id)a4 forInterest:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
    -[BCCacheManager _addInterest:](self, "_addInterest:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager level1](self, "level1"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageMatchingDescription:forRequest:", v8, v9));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "image"));
  if (v13)
  {
    v14 = BCImageCacheLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "BCCacheManager: Exact match from RAM of image=%@", buf, 0xCu);
    }

    v18 = v12;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    -[BCCacheManager _checkInterestForDescribedImages:forRequest:](self, "_checkInterestForDescribedImages:forRequest:", v16, v9);

  }
  else
  {
    +[BICCacheStats incrementCounter:](BICCacheStats, "incrementCounter:", kBICCacheStatsCounterL1Miss[0]);
    -[BCCacheManager _fetchImagesMatchingDescription:forRequest:](self, "_fetchImagesMatchingDescription:forRequest:", v8, v9);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager coalescingPreloading](self, "coalescingPreloading"));
  objc_msgSend(v17, "signalWithCompletion:", &stru_28F460);

}

- (void)_addInterest:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  BCCacheManager *v9;
  id v10;

  p_accessLock = &self->_accessLock;
  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_81290;
  v8 = &unk_28B808;
  v9 = self;
  v10 = a3;
  v4 = v10;
  os_unfair_lock_lock(p_accessLock);
  sub_81290((uint64_t)&v5);
  os_unfair_lock_unlock(p_accessLock);
  +[BICCacheStats incrementCounter:](BICCacheStats, "incrementCounter:", kBICCacheStatsCounterLayersVended[0], v5, v6);

}

- (void)_fetchBestImagesForDescription:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager level1](self, "level1"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_81394;
  v11[3] = &unk_28F488;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "getSortedBestMatchesOf:forRequest:completion:", v10, v9, v11);

}

- (void)_fetchPrimaryImage:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BCCacheManager *v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", BICCacheStatsOperationBeginGenericUpgradeAttempt[0], v7);
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager level1](self, "level1"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_81594;
  v10[3] = &unk_28F500;
  objc_copyWeak(&v13, &location);
  v9 = v7;
  v11 = v9;
  v12 = self;
  objc_msgSend(v8, "getPrimaryImageForRequest:completion:", v9, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)_checkStack:(id)a3 forInterestIn:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  BCCacheManager *v20;
  id v21;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class(BCCacheVendedLayer);
  v9 = BUDynamicCast(v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "describedImageShown"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "describedImageRequested"));
    v13 = objc_claimAutoreleasedReturnValue(-[BCCacheManager workHighPriorityTarget](self, "workHighPriorityTarget"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_81AAC;
    block[3] = &unk_28F550;
    v17 = v12;
    v18 = v11;
    v19 = v6;
    v20 = self;
    v21 = v10;
    v14 = v11;
    v15 = v12;
    dispatch_async(v13, block);

  }
}

- (void)_performGenericUpgradeOfStackForRequest:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BCCacheManager *v12;
  uint8_t buf[4];
  id v14;

  v4 = a3;
  v5 = BCImageCacheLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "BCCacheManager: Attempting to upgrade a generic series stack request=%@", buf, 0xCu);
  }

  +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", BICCacheStatsOperationBeginGenericStackUpgradeAttempt[0], v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager seriesDecomposer](self, "seriesDecomposer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_821CC;
  v10[3] = &unk_28F268;
  v11 = v4;
  v12 = self;
  v9 = v4;
  objc_msgSend(v7, "assetIDsAndOptionsForBooksInSeries:completion:", v8, v10);

}

- (void)_checkForGenericUpgradeForInterest:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  BCCacheManager *v16;

  v4 = a3;
  v5 = objc_opt_class(BCCacheVendedLayer);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "describedImageShown"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "describedImageRequested"));
    v10 = objc_claimAutoreleasedReturnValue(-[BCCacheManager workHighPriorityTarget](self, "workHighPriorityTarget"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_824A8;
    block[3] = &unk_28C5F0;
    v14 = v9;
    v15 = v8;
    v16 = self;
    v11 = v8;
    v12 = v9;
    dispatch_async(v10, block);

  }
}

- (void)_checkForQualityUpgradeForInterest:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BCCacheManager *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "describedImageShown"));
  v6 = objc_msgSend(v5, "isLowQuality");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "describedImageRequested"));
    v8 = objc_claimAutoreleasedReturnValue(-[BCCacheManager workHighPriorityTarget](self, "workHighPriorityTarget"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_826A0;
    v10[3] = &unk_28B808;
    v11 = v7;
    v12 = self;
    v9 = v7;
    dispatch_async(v8, v10);

  }
}

- (void)_fetchImagesMatchingBestDescriptions:(id)a3 forOriginalDescription:(id)a4 forRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  BCCacheManager *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id location;
  void *v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count") && objc_msgSend(v10, "priority") != (char *)&dword_0 + 1)
  {
    objc_initWeak(&location, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager level1](self, "level1"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageMatchingDescription:forRequest:", v11, v10));

    if (v13)
    {
      v23 = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
      -[BCCacheManager _checkInterestForDescribedImages:forRequest:](self, "_checkInterestForDescribedImages:forRequest:", v14, v10);

    }
    else
    {
      +[BICCacheStats incrementCounter:](BICCacheStats, "incrementCounter:", kBICCacheStatsCounterL1Miss[0]);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_82A08;
      v15[3] = &unk_28F578;
      objc_copyWeak(&v21, &location);
      v16 = v10;
      v17 = self;
      v18 = v9;
      v19 = v11;
      v20 = v8;
      -[BCCacheManager _fetchImagesMatchingDescription:withTimeout:forRequest:completion:](self, "_fetchImagesMatchingDescription:withTimeout:forRequest:completion:", v19, 30, v16, v15);

      objc_destroyWeak(&v21);
    }

    objc_destroyWeak(&location);
  }
  else if ((objc_msgSend(v10, "isAlternateGeneric") & 1) == 0)
  {
    -[BCCacheManager _makeGenericForDescription:forRequest:](self, "_makeGenericForDescription:forRequest:", v9, v10);
  }

}

- (int64_t)_maxCostForMedium:(signed __int16)a3
{
  int64_t v3;

  v3 = 0x7FFFFFFFLL;
  if (a3 == 1)
    v3 = 1048576000;
  if (a3)
    return v3;
  else
    return 52428800;
}

- (void)_pruneIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;

  -[BCCacheManager nextRamPruneDate](self, "nextRamPruneDate");
  v4 = v3;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  if (v4 <= v5)
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    -[BCCacheManager setNextRamPruneDate:](self, "setNextRamPruneDate:", v6 + 2.0);
    -[BCCacheManager _pruneMediumIfNeeded:](self, "_pruneMediumIfNeeded:", 0);
  }
  -[BCCacheManager nextDiskPruneDate](self, "nextDiskPruneDate");
  v8 = v7;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  if (v8 <= v9)
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    -[BCCacheManager setNextDiskPruneDate:](self, "setNextDiskPruneDate:", v10 + 604800.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    -[BCCacheManager nextDiskPruneDate](self, "nextDiskPruneDate");
    objc_msgSend(v11, "setDouble:forKey:", CFSTR("BCCacheManagerNextDiskPruneDate"));

    -[BCCacheManager _pruneMediumIfNeeded:](self, "_pruneMediumIfNeeded:", 1);
  }
}

- (void)_pruneMediumIfNeeded:(signed __int16)a3
{
  NSObject *v5;
  _QWORD v6[5];
  signed __int16 v7;

  v5 = objc_claimAutoreleasedReturnValue(-[BCCacheManager lowPriorityTarget](self, "lowPriorityTarget"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_82EFC;
  v6[3] = &unk_28F610;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)pruneItemsWithIdentifier:(id)a3 forMedium:(signed __int16)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  signed __int16 v11;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[BCCacheManager lowPriorityTarget](self, "lowPriorityTarget"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8339C;
  block[3] = &unk_28F688;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)_pushDescribedImages:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  char v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  char v25;
  id location;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_initWeak(&location, self);
    if (objc_msgSend(v6, "count") == (char *)&dword_0 + 1)
    {
      v8 = BCImageCacheLog();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
        *(_DWORD *)buf = 138412290;
        v28 = v10;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "BCCacheManager: Adding 1 image to cache: %@", buf, 0xCu);

      }
    }
    else
    {
      v11 = BCImageCacheLog();
      v9 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count")));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
        *(_DWORD *)buf = 138412546;
        v28 = v12;
        v29 = 2112;
        v30 = v13;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "BCCacheManager: Adding %@ images to cache, e.g. %@", buf, 0x16u);

      }
    }

    if (objc_msgSend(v6, "count") != (char *)&dword_0 + 1
      || (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0)),
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "image")),
          v16 = v15 == 0,
          v15,
          v14,
          v16))
    {
      v17 = 0;
    }
    else
    {
      -[BCCacheManager _checkInterestForDescribedImages:forRequest:](self, "_checkInterestForDescribedImages:forRequest:", v6, v7);
      v17 = 1;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager level1](self, "level1"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_8396C;
    v21[3] = &unk_28F6B0;
    v25 = v17;
    objc_copyWeak(&v24, &location);
    v19 = v6;
    v22 = v19;
    v23 = v7;
    objc_msgSend(v18, "addDescribedImages:forRequest:completion:", v19, v23, v21);

    +[BICCacheStats addToCounter:amount:](BICCacheStats, "addToCounter:amount:", kBICCacheStatsCounterImagesPushed[0], objc_msgSend(v19, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager coalescingPruning](self, "coalescingPruning"));
    objc_msgSend(v20, "signalWithCompletion:", &stru_28F6D0);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

}

- (void)_fetchImagesMatchingDescription:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BCCacheManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[BCCacheManager workHighPriorityTarget](self, "workHighPriorityTarget"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_83A80;
  block[3] = &unk_28C5F0;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)_fetchImagesMatchingDescription:(id)a3 withTimeout:(int64_t)a4 forRequest:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  dispatch_time_t v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  _QWORD *v25;
  _QWORD block[5];
  id v27;
  _QWORD *v28;
  id v29;
  id location;
  _QWORD v31[3];
  char v32;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32 = 0;
  objc_initWeak(&location, v10);
  v13 = dispatch_time(0, 1000000000 * a4);
  v14 = objc_claimAutoreleasedReturnValue(-[BCCacheManager workHighPriorityTarget](self, "workHighPriorityTarget"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_83F38;
  block[3] = &unk_28F720;
  block[4] = self;
  v28 = v31;
  objc_copyWeak(&v29, &location);
  v15 = v12;
  v27 = v15;
  dispatch_after(v13, v14, block);

  if ((objc_msgSend(v11, "requestOptions") & 0x10) != 0)
  {
    v16 = objc_msgSend(v10, "copy");
    objc_msgSend(v16, "setRequestOptions:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager level1](self, "level1"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_84088;
    v23[3] = &unk_28F770;
    v23[4] = self;
    v25 = v31;
    v24 = v15;
    objc_msgSend(v17, "fetchImagesMatchingDescription:forRequest:completion:", v16, v11, v23);

  }
  +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", BICCacheStatsOperationAsyncFetchExactAttempt[0], v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager level1](self, "level1"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_84150;
  v20[3] = &unk_28F770;
  v20[4] = self;
  v22 = v31;
  v19 = v15;
  v21 = v19;
  objc_msgSend(v18, "fetchImagesMatchingDescription:forRequest:completion:", v10, v11, v20);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
  _Block_object_dispose(v31, 8);

}

- (void)_fetchImagesMatchingDescriptionWithoutPushing:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[BCCacheManager workHighPriorityTarget](self, "workHighPriorityTarget"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_842D4;
  block[3] = &unk_28C5F0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (BOOL)_isGenericNeededForDescription:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double height;
  double v16;
  double v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  double v24;
  double v25;
  _BOOL4 v26;
  BOOL v27;
  char v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[2];
  void (*v35)(uint64_t);
  void *v36;
  BCCacheManager *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _BYTE v45[128];

  v6 = a3;
  v7 = a4;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = sub_7E790;
  v43 = sub_7E7A0;
  v44 = 0;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v35 = sub_84708;
  v36 = &unk_28B700;
  v37 = self;
  v38 = &v39;
  v8 = v34;
  os_unfair_lock_lock(&self->_accessLock);
  v35((uint64_t)v8);
  os_unfair_lock_unlock(&self->_accessLock);

  if (objc_msgSend(v7, "seriesStack") && (objc_msgSend(v6, "seriesStack") & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v29 = 1;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v29 = 0;
  }
  objc_msgSend(v6, "imageSize");
  v11 = v10;
  v13 = v12;
  height = CGSizeZero.height;
  if (CGSizeZero.width == v10 && height == v13)
  {
    objc_msgSend(v7, "imageSize", CGSizeZero.width, height);
    v11 = v16;
    v13 = v17;
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v18 = (id)v40[5];
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v45, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v18);
        v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
        if (objc_msgSend(v23, "isEqualToString:", v9))
        {
          objc_msgSend(v22, "imageSize");
          v26 = v13 == v25 && v11 == v24;

          if (v26)
          {

            v27 = 0;
            goto LABEL_28;
          }
        }
        else
        {

        }
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v45, 16);
    }
    while (v19);
  }

  if ((v29 & 1) != 0)
    v27 = 1;
  else
    v27 = -[BCCacheManager _isVendedInterestBlankOrOldForRequest:](self, "_isVendedInterestBlankOrOldForRequest:", v7);
LABEL_28:

  _Block_object_dispose(&v39, 8);
  return v27;
}

- (BOOL)_isVendedInterestBlankOrOldForRequest:(id)a3
{
  id v4;
  os_unfair_lock_s *p_accessLock;
  _QWORD *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  int v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  void (*v31)(uint64_t);
  void *v32;
  BCCacheManager *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _BYTE v41[128];

  v4 = a3;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_7E790;
  v39 = sub_7E7A0;
  v40 = 0;
  p_accessLock = &self->_accessLock;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v31 = sub_84A28;
  v32 = &unk_28E468;
  v33 = self;
  v34 = &v35;
  v6 = v30;
  os_unfair_lock_lock(p_accessLock);
  v31((uint64_t)v6);
  os_unfair_lock_unlock(p_accessLock);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = (id)v36[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v41, 16);
  if (!v8)
    goto LABEL_23;
  v9 = *(_QWORD *)v27;
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v27 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "describedImageRequested", (_QWORD)v26));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
      v15 = objc_msgSend(v13, "isEqualToString:", v14);

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "describedImageShown"));
        if (objc_msgSend(v16, "quality") == 3 || objc_msgSend(v11, "needsNewVersion"))
        {
          v17 = (objc_msgSend(v16, "processingOptions") >> 9) & 1;
          if (!v16)
            goto LABEL_16;
        }
        else
        {
          v17 = 0;
          if (!v16)
            goto LABEL_16;
        }
        if (objc_msgSend(v16, "quality") == 1)
          v18 = 1;
        else
          v18 = v17;
        if (v18 != 1)
        {
LABEL_18:

          goto LABEL_19;
        }
LABEL_16:
        objc_msgSend(v4, "imageSize");
        v20 = v19;
        v22 = v21;
        objc_msgSend(v12, "imageSize");
        if (v20 == v24 && v22 == v23)
        {

          LOBYTE(v8) = 1;
          goto LABEL_23;
        }
        goto LABEL_18;
      }
LABEL_19:

    }
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v41, 16);
    if (v8)
      continue;
    break;
  }
LABEL_23:

  _Block_object_dispose(&v35, 8);
  return (char)v8;
}

- (void)_fetchGenericForDescription:(id)a3 forRequest:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = objc_msgSend(v5, "copy");
  objc_msgSend(v6, "setProcessingOptions:", objc_msgSend(v6, "processingOptions") | 0x200);
  objc_msgSend(v6, "setRequestOptions:", objc_msgSend(v6, "requestOptions") | 8);
  objc_msgSend(v5, "setAlternateRequest:", v6);

  -[BCCacheManager _fetchImagesMatchingDescription:forRequest:](self, "_fetchImagesMatchingDescription:forRequest:", v6, v6);
}

- (void)_makeGenericForDescription:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double height;
  double v19;
  double v20;
  id v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27[3];
  _QWORD v28[4];
  id v29;
  id v30;
  BCCacheManager *v31;
  uint8_t buf[4];
  id v33;

  v6 = a3;
  v7 = a4;
  v8 = BCImageCacheLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v6;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "BCCacheManager: Asked to make generic for image=%@", buf, 0xCu);
  }

  if (-[BCCacheManager _isGenericNeededForDescription:forRequest:](self, "_isGenericNeededForDescription:forRequest:", v6, v7))
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_84E94;
    v28[3] = &unk_28C5F0;
    v10 = v7;
    v29 = v10;
    v11 = v6;
    v30 = v11;
    v31 = self;
    os_unfair_lock_lock(&self->_accessLock);
    sub_84E94((id *)v28);
    os_unfair_lock_unlock(&self->_accessLock);
    v12 = BCImageCacheLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v11;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "BCCacheManager: Making generic for image=%@", buf, 0xCu);
    }

    +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", BICCacheStatsOperationMakingGenericQueueStart[0], v10);
    objc_msgSend(v11, "imageSize");
    v16 = v15;
    v17 = v14;
    height = CGSizeZero.height;
    if (CGSizeZero.width == v15 && height == v14)
    {
      objc_msgSend(v10, "imageSize");
      v16 = v19;
      v17 = v20;
    }
    if (CGSizeZero.width == v16 && height == v17)
    {
      v21 = BCImageCacheLog();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "BCCacheManager: _makeGenericForDescription: invalid image size", buf, 2u);
      }

    }
    else
    {
      objc_initWeak((id *)buf, self);
      kdebug_trace(725353748, 0, 0, 0, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager highPriorityWorkQueue](self, "highPriorityWorkQueue"));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_84F00;
      v24[3] = &unk_28F820;
      objc_copyWeak(v27, (id *)buf);
      v25 = v10;
      v26 = v11;
      v27[1] = *(id *)&v16;
      v27[2] = *(id *)&v17;
      objc_msgSend(v23, "addWorkItemWithPriority:description:block:", v25, CFSTR("CacheManager make generic"), v24);

      objc_destroyWeak(v27);
      objc_destroyWeak((id *)buf);
    }

  }
  else
  {
    +[BICCacheStats incrementCounter:](BICCacheStats, "incrementCounter:", kBICCacheStatsCounterGenericsNotCreated[0]);
  }

}

- (void)explicitContentRestrictedChanged
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  uint8_t buf[16];

  v3 = BCImageCacheLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "BCCacheManager: Explicit content restrictions changed", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager delegate](self, "delegate"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_85BF8;
  v12[3] = &unk_28F848;
  v12[4] = self;
  objc_msgSend(v5, "cacheManager:explicitIdentifiersWithCompletion:", self, v12);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
  v7 = objc_msgSend(v6, "isExplicitContentAllowed");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager cacheMetaData](self, "cacheMetaData"));
  v9 = objc_msgSend(v8, "mutableCopy");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("BCCacheAllowRestrictedContent"));

  +[BCCacheManager writeCacheMetaData:](BCCacheManager, "writeCacheMetaData:", v9);
  v11 = objc_msgSend(v9, "copy");
  -[BCCacheManager setCacheMetaData:](self, "setCacheMetaData:", v11);

}

- (void)incrementVersionForIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  BCCacheManager *v10;
  id v11;

  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_85CB8;
  v9 = &unk_28B808;
  v10 = self;
  v11 = a3;
  v4 = v11;
  os_unfair_lock_lock(&v10->_accessLock);
  sub_85CB8((uint64_t)&v6);
  os_unfair_lock_unlock(&self->_accessLock);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager coalescingVersionBump](self, "coalescingVersionBump", v6, v7));
  objc_msgSend(v5, "signalWithCompletion:", &stru_28F868);

}

- (void)incrementVersionForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  BCCacheManager *v10;
  id v11;

  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_85DB0;
  v9 = &unk_28B808;
  v10 = self;
  v11 = a3;
  v4 = v11;
  os_unfair_lock_lock(&v10->_accessLock);
  sub_85DB0((uint64_t)&v6);
  os_unfair_lock_unlock(&self->_accessLock);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager coalescingVersionBump](self, "coalescingVersionBump", v6, v7));
  objc_msgSend(v5, "signalWithCompletion:", &stru_28F888);

}

- (void)_incrementVersionForIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BCCacheManager *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BCCacheManager workHighPriorityTarget](self, "workHighPriorityTarget"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_85E8C;
  v7[3] = &unk_28B808;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_updateVendedImageInterest:(id)a3 withDescribedImage:(id)a4 forRequest:(id)a5
{
  void *v7;
  id v8;

  v8 = a5;
  objc_msgSend(a3, "setDescribedImage:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "alternateRequest"));
  objc_msgSend(v7, "setPriority:", 1);

  +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", BICCacheStatsOperationCancelled[0], v8);
}

- (void)_checkInterestForDescribedImages:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BCCacheManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[BCCacheManager workHighPriorityTarget](self, "workHighPriorityTarget"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_860D4;
  block[3] = &unk_28C5F0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_performOperation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  switch(objc_msgSend(v7, "operationKind"))
  {
    case 0u:
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subject"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "result"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "request"));
      -[BCCacheManager _transformSourceDescribedImage:into:forRequest:](self, "_transformSourceDescribedImage:into:forRequest:", v4, v5, v6);
      goto LABEL_4;
    case 1u:
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vendedImageInterest"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subject"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "request"));
      -[BCCacheManager _updateVendedImageInterest:withDescribedImage:forRequest:](self, "_updateVendedImageInterest:withDescribedImage:forRequest:", v4, v5, v6);
LABEL_4:

      goto LABEL_9;
    case 2u:
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vendedImageInterest"));
      -[BCCacheManager _checkForQualityUpgradeForInterest:](self, "_checkForQualityUpgradeForInterest:", v4);
      goto LABEL_10;
    case 3u:
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "vendedImageInterest"));
      -[BCCacheManager _checkForGenericUpgradeForInterest:](self, "_checkForGenericUpgradeForInterest:", v4);
      goto LABEL_10;
    case 4u:
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subject"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "request"));
      -[BCCacheManager _fetchImagesMatchingDescription:forRequest:](self, "_fetchImagesMatchingDescription:forRequest:", v4, v5);
      goto LABEL_9;
    case 5u:
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subject"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "request"));
      -[BCCacheManager _fetchImagesMatchingDescriptionWithoutPushing:forRequest:](self, "_fetchImagesMatchingDescriptionWithoutPushing:forRequest:", v4, v5);
LABEL_9:

LABEL_10:
      break;
    default:
      break;
  }

}

- (id)_findInterestForIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_accessLock;
  _QWORD *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[2];
  void (*v22)(uint64_t);
  void *v23;
  BCCacheManager *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _BYTE v32[128];

  v4 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_7E790;
  v30 = sub_7E7A0;
  v31 = 0;
  p_accessLock = &self->_accessLock;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v22 = sub_86B70;
  v23 = &unk_28E468;
  v24 = self;
  v25 = &v26;
  v6 = v21;
  os_unfair_lock_lock(p_accessLock);
  v22((uint64_t)v6);
  os_unfair_lock_unlock(p_accessLock);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (id)v27[5];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v32, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "describedImageRequested", (_QWORD)v17));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
        v15 = objc_msgSend(v14, "isEqualToString:", v4);

        if (v15)
          objc_msgSend(v7, "addObject:", v12);
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v32, 16);
    }
    while (v9);
  }

  _Block_object_dispose(&v26, 8);
  return v7;
}

- (void)_transformSourceDescribedImage:(id)a3 into:(id)a4 forRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[BCCacheManager transformController](self, "transformController"));
  objc_msgSend(v11, "transformSource:to:forRequest:", v10, v9, v8);

}

- (id)_blankLayerForDescribedImage:(id)a3
{
  id v4;
  BCCacheVendedLayer *v5;
  void *v6;

  v4 = a3;
  v5 = -[BCCacheVendedLayer initWithDebugLayout:]([BCCacheVendedLayer alloc], "initWithDebugLayout:", -[BCCacheManager debugLayout](self, "debugLayout"));
  -[BCCacheVendedLayer setDescribedImageRequested:](v5, "setDescribedImageRequested:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager _blankCoverForDescribedImage:](self, "_blankCoverForDescribedImage:", v4));

  -[BCCacheVendedLayer setDescribedImage:](v5, "setDescribedImage:", v6);
  return v5;
}

- (id)_blankCoverForDescribedImage:(id)a3
{
  id v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int16 v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  __int16 v13;
  const __CFString *v14;
  const __CFString *v15;
  __int16 v16;
  os_unfair_lock_s *p_accessLock;
  id v18;
  _QWORD *v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  CGColorSpace *DeviceRGB;
  double v27;
  double v28;
  _BOOL4 v29;
  double v30;
  double v31;
  CGContext *v32;
  double v33;
  double v34;
  double v35;
  id v36;
  id v37;
  double v38;
  id v39;
  CGImage *Image;
  NSObject *v41;
  void *v42;
  _QWORD *v43;
  id v44;
  id v45;
  _QWORD v46[2];
  void (*v47)(uint64_t);
  void *v48;
  BCCacheManager *v49;
  id v50;
  uint64_t *v51;
  _QWORD v52[2];
  void (*v53)(uint64_t);
  void *v54;
  BCCacheManager *v55;
  id v56;
  uint64_t *v57;
  uint64_t v58;
  id *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;

  v4 = a3;
  v5 = objc_msgSend(v4, "processingOptions");
  v6 = objc_msgSend(v4, "processingOptions");
  v7 = (unsigned __int16)objc_msgSend(v4, "processingOptions");
  v8 = objc_msgSend(v4, "processingOptions");
  objc_msgSend(v4, "imageSize");
  v10 = v9;
  objc_msgSend(v4, "imageSize");
  v12 = CFSTR("Night");
  v13 = v5 & 0x40;
  if ((v5 & 0x40) == 0)
    v12 = CFSTR("Day");
  v14 = CFSTR("audiobookStack");
  if ((v7 & 0x800) == 0)
    v14 = CFSTR("stack");
  v15 = CFSTR("audio");
  if ((v8 & 8) == 0)
    v15 = CFSTR("book");
  v16 = v6 & 0x20;
  if ((v6 & 0x20) == 0)
    v14 = v15;
  v58 = 0;
  v59 = (id *)&v58;
  v60 = 0x3032000000;
  v61 = sub_7E790;
  v62 = sub_7E7A0;
  v63 = 0;
  p_accessLock = &self->_accessLock;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v53 = sub_872CC;
  v54 = &unk_28B7E0;
  v57 = &v58;
  v55 = self;
  v18 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.0f x %.0f %@ %@"), v10, v11, v12, v14));
  v56 = v18;
  v19 = v52;
  os_unfair_lock_lock(&self->_accessLock);
  v53((uint64_t)v19);
  os_unfair_lock_unlock(&self->_accessLock);

  v20 = v59[5];
  if (v20)
  {
    v21 = objc_msgSend(v20, "copy");
    v22 = v59[5];
    v59[5] = v21;

    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    objc_msgSend(v59[5], "setIdentifier:", v23);
  }
  else
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    if (!DeviceRGB)
      goto LABEL_12;
    objc_msgSend(v4, "imageSize");
    v28 = v27;
    v29 = (v7 & 0x800) == 0 || v16 == 0;
    v30 = v27;
    if ((v8 & 8) == 0)
    {
      v30 = v27;
      if (v29)
      {
        objc_msgSend(v4, "imageSize");
        v30 = v31;
      }
    }
    v32 = CGBitmapContextCreate(0, (unint64_t)v28, (unint64_t)v30, 8uLL, vcvtd_n_u64_f64(v28, 2uLL), DeviceRGB, 1u);
    CGColorSpaceRelease(DeviceRGB);
    if (v32)
    {
      v33 = 0.0;
      v34 = v28;
      v35 = v30;
      if (v16)
      {
        v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 243.0 / dbl_26A370[v13 == 0], 243.0 / dbl_26A370[v13 == 0], 248.0 / dbl_26A370[v13 == 0], 1.0)));
        CGContextSetFillColorWithColor(v32, (CGColorRef)objc_msgSend(v36, "CGColor"));

        CGContextSaveGState(v32);
        v34 = v28 * 0.85;
        v35 = v30 * 0.85;
        v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, v30 - v30 * 0.85, v28 * 0.85, v30 * 0.85, 3.0)));
        CGContextAddPath(v32, (CGPathRef)objc_msgSend(v37, "CGPath"));
        CGContextFillPath(v32);
        CGContextRestoreGState(v32);
        v33 = v28 - v28 * 0.85;

      }
      v38 = 255.0;
      if (v13)
        v38 = 512.0;
      v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 243.0 / v38, 243.0 / v38, 248.0 / v38, 1.0)));
      CGContextSetFillColorWithColor(v32, (CGColorRef)objc_msgSend(v39, "CGColor"));

      CGContextSaveGState(v32);
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v33, 0.0, v34, v35, 3.0)));
      CGContextAddPath(v32, (CGPathRef)-[NSObject CGPath](v23, "CGPath"));
      CGContextFillPath(v32);
      CGContextRestoreGState(v32);
      Image = CGBitmapContextCreateImage(v32);
      CGContextRelease(v32);
      if (Image)
      {
        v41 = objc_msgSend(v4, "copy");
        -[NSObject setProcessingOptions:](v41, "setProcessingOptions:", (unsigned __int16)(v16 | v13));
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[BICImage imageWithCGImage:](BICImage, "imageWithCGImage:", Image));
        -[NSObject setImage:](v41, "setImage:", v42);

        -[NSObject setQuality:](v41, "setQuality:", 1);
        CGImageRelease(Image);
        objc_storeStrong(v59 + 5, v41);
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v47 = sub_87324;
        v48 = &unk_28C430;
        v49 = self;
        v50 = v18;
        v51 = &v58;
        v43 = v46;
        os_unfair_lock_lock(p_accessLock);
        v47((uint64_t)v43);
        os_unfair_lock_unlock(p_accessLock);

      }
      else
      {
        v45 = BCImageCacheLog();
        v41 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          sub_1B58E4();
      }

    }
    else
    {
      v44 = BCImageCacheLog();
      v23 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_1B5878();
    }
  }

LABEL_12:
  +[BICCacheStats logDescribedImage:withComment:](BICCacheStats, "logDescribedImage:withComment:", v59[5], CFSTR("BlankCover"));
  v24 = v59[5];

  _Block_object_dispose(&v58, 8);
  return v24;
}

- (void)fetchCoverURLsFor:(id)a3 immediately:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[BCCacheManager profileFetcher](self, "profileFetcher"));
  objc_msgSend(v10, "fetchCoverURLsFor:immediately:completion:", v9, v5, v8);

}

+ (id)processURLTemplate:(id)a3 forSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  if (objc_msgSend(v6, "containsString:", CFSTR("{w}"))
    && objc_msgSend(v6, "containsString:", CFSTR("{h}")))
  {
    v7 = objc_msgSend(v6, "mutableCopy");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", llround(width)));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
    objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{w}"), v9, 2, 0, objc_msgSend(v7, "length"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", llround(height)));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
    objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{h}"), v11, 2, 0, objc_msgSend(v7, "length"));

    objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{c}"), &stru_296430, 2, 0, objc_msgSend(v7, "length"));
    objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{f}"), CFSTR("jpg"), 2, 0, objc_msgSend(v7, "length"));

    v6 = v7;
  }
  return v6;
}

- (id)_extractImagesFromTemplate:(id)a3 identifier:(id)a4 initialSize:(CGSize)a5
{
  double height;
  double width;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v13;
  void *v14;
  void *v15;

  height = a5.height;
  width = a5.width;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = 4;
  do
  {
    if (width <= 4096.0 && height <= 4096.0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[BICDescribedImage describedImageWithIdentifier:size:processingOptions:](BICDescribedImage, "describedImageWithIdentifier:size:processingOptions:", v9, 0, width, height));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager processURLTemplate:forSize:](BCCacheManager, "processURLTemplate:forSize:", v8, width, height));
      objc_msgSend(v13, "setUrlString:", v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 86400.0));
      objc_msgSend(v13, "setExpiry:", v15);

      objc_msgSend(v13, "setQuality:", 203);
      objc_msgSend(v10, "addObject:", v13);

    }
    width = floor(width * 0.5);
    height = floor(height * 0.5);
    --v11;
  }
  while (v11);

  return v10;
}

- (id)describedImagesFromProductProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double height;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));

  if (v6)
  {
    v7 = (double)(unint64_t)objc_msgSend(v4, "width");
    v8 = (double)(unint64_t)objc_msgSend(v4, "height");
    height = CGSizeZero.height;
    if (CGSizeZero.width == v7 && height == v8)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url", CGSizeZero.width, height));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("x")));
      if (objc_msgSend(v12, "count") == (char *)&dword_0 + 2)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 0));
        v18 = objc_msgSend(v17, "integerValue");

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 1));
        v20 = objc_msgSend(v19, "integerValue");

        v16 = (double)(uint64_t)v18;
        if ((uint64_t)v18 > 0 && (uint64_t)v20 > 0)
        {
          v8 = (double)(uint64_t)v20;
          v7 = (double)(uint64_t)v18;
        }
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier", v16));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[BICDescribedImage describedImageWithIdentifier:size:processingOptions:](BICDescribedImage, "describedImageWithIdentifier:size:processingOptions:", v21, 0, v7, v8));

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
      objc_msgSend(v14, "setUrlString:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 86400.0));
      objc_msgSend(v14, "setExpiry:", v23);

      objc_msgSend(v14, "setQuality:", 203);
      objc_msgSend(v5, "addObject:", v14);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url", CGSizeZero.width, height));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
      v13 = objc_claimAutoreleasedReturnValue(-[BCCacheManager _extractImagesFromTemplate:identifier:initialSize:](self, "_extractImagesFromTemplate:identifier:initialSize:", v11, v12, v7, v8));
      v14 = v5;
      v5 = (void *)v13;
    }

  }
  return v5;
}

- (void)fetchCoverForURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BCCacheManager protocolHandler](self, "protocolHandler"));
  objc_msgSend(v8, "fetchCoverForURL:completion:", v7, v6);

}

- (BOOL)canFetchCoverForURL:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager protocolHandler](self, "protocolHandler"));
  v6 = objc_msgSend(v5, "canFetchCoverForURL:", v4);

  return v6;
}

- (void)transformResultSrc:(id)a3 result:(id)a4 forRequest:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

  -[BCCacheManager _pushDescribedImages:forRequest:](self, "_pushDescribedImages:forRequest:", v9, v7, v10);
}

- (void)stackRenderingResultSrc:(id)a3 result:(id)a4 forRequest:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  if (a4)
  {
    v10 = a4;
    v7 = a5;
    v8 = a4;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

    -[BCCacheManager _pushDescribedImages:forRequest:](self, "_pushDescribedImages:forRequest:", v9, v7, v10);
  }
}

- (void)fetchCGImageFor:(id)a3 forRequest:(id)a4 completion:(id)a5
{
  -[BCCacheManager fetchCGImageFor:forRequest:timeOut:waitForNonGeneric:completion:](self, "fetchCGImageFor:forRequest:timeOut:waitForNonGeneric:completion:", a3, a4, 0, a5, 0.0);
}

- (void)fetchCGImageFor:(id)a3 forRequest:(id)a4 timeOut:(double)a5 waitForNonGeneric:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  BCCacheCallbackInterest *v17;
  BOOL v18;
  id v19;
  id v20;
  dispatch_time_t v21;
  NSObject *v22;
  _QWORD v23[4];
  BCCacheCallbackInterest *v24;
  BCCacheManager *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  BCCacheManager *v29;
  id v30;
  _BYTE *v31;
  id v32;
  id v33;
  BOOL v34;
  id from;
  id location;
  _QWORD v37[5];
  BCCacheCallbackInterest *v38;
  _BYTE buf[24];
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = BCImageCacheLog();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "BCCacheManager: Fetching image=%@ for request=%@", buf, 0x16u);
  }

  +[BICCacheStats incrementCounter:](BICCacheStats, "incrementCounter:", kBICCacheStatsCounterCGImagesVended[0]);
  objc_msgSend(v12, "setUnknownAspectRatio:", 1);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_87EC0;
  v37[3] = &unk_28B808;
  v37[4] = self;
  v17 = objc_alloc_init(BCCacheCallbackInterest);
  v38 = v17;
  os_unfair_lock_lock(&self->_accessLock);
  sub_87EC0((uint64_t)v37);
  os_unfair_lock_unlock(&self->_accessLock);
  -[BCCacheCallbackInterest setDescribedImageRequested:](v17, "setDescribedImageRequested:", v12);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v17);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v40 = sub_7E790;
  v41 = sub_7E7A0;
  v42 = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_87F00;
  v27[3] = &unk_28F8F0;
  objc_copyWeak(&v32, &location);
  objc_copyWeak(&v33, &from);
  v18 = !a6;
  v19 = v13;
  v34 = v18;
  v31 = buf;
  v28 = v19;
  v29 = self;
  v20 = v14;
  v30 = v20;
  -[BCCacheCallbackInterest setHandler:](v17, "setHandler:", v27);
  -[BCCacheManager _fetchImage:forRequest:forInterest:](self, "_fetchImage:forRequest:forInterest:", v12, v19, v17);
  if (a5 > 0.0)
  {
    v21 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
    v22 = objc_claimAutoreleasedReturnValue(-[BCCacheManager workHighPriorityTarget](self, "workHighPriorityTarget"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_88434;
    v23[3] = &unk_28C5F0;
    v24 = v17;
    v25 = self;
    v26 = v19;
    dispatch_after(v21, v22, v23);

  }
  objc_destroyWeak(&v33);
  objc_destroyWeak(&v32);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (void)imageSetPersisting:(id)a3 newVersionForImageSetIdentifierss:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BCCacheManager *v12;
  uint8_t buf[4];
  id v14;

  v5 = a4;
  v6 = BCImageCacheLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "BCCacheManager: New version for assetID=%@", buf, 0xCu);
  }

  v8 = objc_claimAutoreleasedReturnValue(-[BCCacheManager workHighPriorityTarget](self, "workHighPriorityTarget"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_885A8;
  v10[3] = &unk_28B808;
  v11 = v5;
  v12 = self;
  v9 = v5;
  dispatch_async(v8, v10);

}

- (void)_refetchInterestsForNewVersion:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager _findInterestForIdentifier:](self, "_findInterestForIdentifier:", a3));
  if (objc_msgSend(v4, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "describedImageRequested"));
          +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", BICCacheStatsOperationNeedNewVersion[0], v11);
          objc_msgSend(v10, "setNeedsNewVersion:", 1);
          -[BCCacheManager _fetchImagesMatchingDescription:forRequest:](self, "_fetchImagesMatchingDescription:forRequest:", v11, v11);
          v12 = BCImageCacheLog();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v19 = v11;
            _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "BCCacheManager: Refetching New version for request=%@", buf, 0xCu);
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v7);
    }

  }
}

- (id)metadataForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheManager imageSetPersistence](self, "imageSetPersistence"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metadataForIdentifier:", v4));

  return v6;
}

- (void)fetchMetadataForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BCCacheManager imageSetPersistence](self, "imageSetPersistence"));
  objc_msgSend(v8, "fetchMetadataForIdentifier:completion:", v7, v6);

}

- (void)imageColorForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BCCacheManager imageSetPersistence](self, "imageSetPersistence"));
  objc_msgSend(v8, "imageColorForIdentifier:completion:", v7, v6);

}

- (void)setImageColor:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BCCacheManager imageSetPersistence](self, "imageSetPersistence"));
  objc_msgSend(v8, "setImageColor:forIdentifier:", v7, v6);

}

- (void)restrictionsForExplicitContentAllowedChanged:(BOOL)a3
{
  -[BCCacheManager explicitContentRestrictedChanged](self, "explicitContentRestrictedChanged", a3);
}

- (OS_dispatch_queue)workGenericsTarget
{
  return self->_workGenericsTarget;
}

- (void)setWorkGenericsTarget:(id)a3
{
  objc_storeStrong((id *)&self->_workGenericsTarget, a3);
}

- (OS_dispatch_queue)workHighPriorityTarget
{
  return self->_workHighPriorityTarget;
}

- (void)setWorkHighPriorityTarget:(id)a3
{
  objc_storeStrong((id *)&self->_workHighPriorityTarget, a3);
}

- (OS_dispatch_queue)workLowPriorityTarget
{
  return self->_workLowPriorityTarget;
}

- (void)setWorkLowPriorityTarget:(id)a3
{
  objc_storeStrong((id *)&self->_workLowPriorityTarget, a3);
}

- (OS_dispatch_queue)highPriorityTarget
{
  return self->_highPriorityTarget;
}

- (void)setHighPriorityTarget:(id)a3
{
  objc_storeStrong((id *)&self->_highPriorityTarget, a3);
}

- (OS_dispatch_queue)lowPriorityTarget
{
  return self->_lowPriorityTarget;
}

- (void)setLowPriorityTarget:(id)a3
{
  objc_storeStrong((id *)&self->_lowPriorityTarget, a3);
}

- (BICWorkQueue)lowPriorityWorkQueue
{
  return self->_lowPriorityWorkQueue;
}

- (void)setLowPriorityWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_lowPriorityWorkQueue, a3);
}

- (BICWorkQueue)highPriorityWorkQueue
{
  return self->_highPriorityWorkQueue;
}

- (void)setHighPriorityWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_highPriorityWorkQueue, a3);
}

- (BCCacheManagingDelegate)delegate
{
  return (BCCacheManagingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BCSeriesStackDecomposing)seriesDecomposer
{
  return self->_seriesDecomposer;
}

- (void)setSeriesDecomposer:(id)a3
{
  objc_storeStrong((id *)&self->_seriesDecomposer, a3);
}

- (BUCoalescingCallBlock)coalescingVersionBump
{
  return self->_coalescingVersionBump;
}

- (void)setCoalescingVersionBump:(id)a3
{
  objc_storeStrong((id *)&self->_coalescingVersionBump, a3);
}

- (BUCoalescingCallBlock)coalescingPruning
{
  return self->_coalescingPruning;
}

- (void)setCoalescingPruning:(id)a3
{
  objc_storeStrong((id *)&self->_coalescingPruning, a3);
}

- (BUCoalescingCallBlock)coalescingPreloading
{
  return self->_coalescingPreloading;
}

- (void)setCoalescingPreloading:(id)a3
{
  objc_storeStrong((id *)&self->_coalescingPreloading, a3);
}

- (BICLevelCaching)level2
{
  return self->_level2;
}

- (void)setLevel2:(id)a3
{
  objc_storeStrong((id *)&self->_level2, a3);
}

- (BICLevelCaching)level3
{
  return self->_level3;
}

- (void)setLevel3:(id)a3
{
  objc_storeStrong((id *)&self->_level3, a3);
}

- (BICLevelCaching)level4
{
  return self->_level4;
}

- (void)setLevel4:(id)a3
{
  objc_storeStrong((id *)&self->_level4, a3);
}

- (NSDictionary)cacheMetaData
{
  return self->_cacheMetaData;
}

- (void)setCacheMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_cacheMetaData, a3);
}

- (double)nextDiskPruneDate
{
  return self->_nextDiskPruneDate;
}

- (void)setNextDiskPruneDate:(double)a3
{
  self->_nextDiskPruneDate = a3;
}

- (double)nextRamPruneDate
{
  return self->_nextRamPruneDate;
}

- (void)setNextRamPruneDate:(double)a3
{
  self->_nextRamPruneDate = a3;
}

- (BOOL)debugLayout
{
  return self->_debugLayout;
}

- (void)setDebugLayout:(BOOL)a3
{
  self->_debugLayout = a3;
}

- (BOOL)clearCacheOnLaunch
{
  return self->_clearCacheOnLaunch;
}

- (void)setClearCacheOnLaunch:(BOOL)a3
{
  self->_clearCacheOnLaunch = a3;
}

- (BOOL)useRamBasedDB
{
  return self->_useRamBasedDB;
}

- (void)setUseRamBasedDB:(BOOL)a3
{
  self->_useRamBasedDB = a3;
}

- (BOOL)forceStats
{
  return self->_forceStats;
}

- (void)setForceStats:(BOOL)a3
{
  self->_forceStats = a3;
}

- (NSMutableArray)genericRequestsInProcess
{
  return self->_genericRequestsInProcess;
}

- (void)setGenericRequestsInProcess:(id)a3
{
  objc_storeStrong((id *)&self->_genericRequestsInProcess, a3);
}

- (NSMutableArray)cgInterests
{
  return self->_cgInterests;
}

- (void)setCgInterests:(id)a3
{
  objc_storeStrong((id *)&self->_cgInterests, a3);
}

- (NSMutableDictionary)blankImages
{
  return self->_blankImages;
}

- (void)setBlankImages:(id)a3
{
  objc_storeStrong((id *)&self->_blankImages, a3);
}

- (NSMutableSet)versionBumpedIdentifiers
{
  return self->_versionBumpedIdentifiers;
}

- (void)setVersionBumpedIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_versionBumpedIdentifiers, a3);
}

- (NSMutableSet)adamIDsToPreload
{
  return self->_adamIDsToPreload;
}

- (void)setAdamIDsToPreload:(id)a3
{
  objc_storeStrong((id *)&self->_adamIDsToPreload, a3);
}

- (BICLevelCaching)level1
{
  return self->_level1;
}

- (void)setLevel1:(id)a3
{
  objc_storeStrong((id *)&self->_level1, a3);
}

- (BCCacheTransforming)transformController
{
  return self->_transformController;
}

- (void)setTransformController:(id)a3
{
  objc_storeStrong((id *)&self->_transformController, a3);
}

- (BCStackManaging)stackManager
{
  return self->_stackManager;
}

- (void)setStackManager:(id)a3
{
  objc_storeStrong((id *)&self->_stackManager, a3);
}

- (BICImageSetPersisting)imageSetPersistence
{
  return self->_imageSetPersistence;
}

- (void)setImageSetPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_imageSetPersistence, a3);
}

- (BCCacheProductProfileFetching)profileFetcher
{
  return self->_profileFetcher;
}

- (void)setProfileFetcher:(id)a3
{
  objc_storeStrong((id *)&self->_profileFetcher, a3);
}

- (BCURLSchemeHandling)protocolHandler
{
  return self->_protocolHandler;
}

- (void)setProtocolHandler:(id)a3
{
  objc_storeStrong((id *)&self->_protocolHandler, a3);
}

- (NSPointerArray)vendedImageInterests
{
  return self->_vendedImageInterests;
}

- (void)setVendedImageInterests:(id)a3
{
  objc_storeStrong((id *)&self->_vendedImageInterests, a3);
}

- (NSMutableArray)outstandingRequests
{
  return self->_outstandingRequests;
}

- (void)setOutstandingRequests:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingRequests, a3);
}

- (BICDescribedImageComparator)comparator
{
  return self->_comparator;
}

- (void)setComparator:(id)a3
{
  objc_storeStrong((id *)&self->_comparator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comparator, 0);
  objc_storeStrong((id *)&self->_outstandingRequests, 0);
  objc_storeStrong((id *)&self->_vendedImageInterests, 0);
  objc_storeStrong((id *)&self->_protocolHandler, 0);
  objc_storeStrong((id *)&self->_profileFetcher, 0);
  objc_storeStrong((id *)&self->_imageSetPersistence, 0);
  objc_storeStrong((id *)&self->_stackManager, 0);
  objc_storeStrong((id *)&self->_transformController, 0);
  objc_storeStrong((id *)&self->_level1, 0);
  objc_storeStrong((id *)&self->_adamIDsToPreload, 0);
  objc_storeStrong((id *)&self->_versionBumpedIdentifiers, 0);
  objc_storeStrong((id *)&self->_blankImages, 0);
  objc_storeStrong((id *)&self->_cgInterests, 0);
  objc_storeStrong((id *)&self->_genericRequestsInProcess, 0);
  objc_storeStrong((id *)&self->_cacheMetaData, 0);
  objc_storeStrong((id *)&self->_level4, 0);
  objc_storeStrong((id *)&self->_level3, 0);
  objc_storeStrong((id *)&self->_level2, 0);
  objc_storeStrong((id *)&self->_coalescingPreloading, 0);
  objc_storeStrong((id *)&self->_coalescingPruning, 0);
  objc_storeStrong((id *)&self->_coalescingVersionBump, 0);
  objc_storeStrong((id *)&self->_seriesDecomposer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_highPriorityWorkQueue, 0);
  objc_storeStrong((id *)&self->_lowPriorityWorkQueue, 0);
  objc_storeStrong((id *)&self->_lowPriorityTarget, 0);
  objc_storeStrong((id *)&self->_highPriorityTarget, 0);
  objc_storeStrong((id *)&self->_workLowPriorityTarget, 0);
  objc_storeStrong((id *)&self->_workHighPriorityTarget, 0);
  objc_storeStrong((id *)&self->_workGenericsTarget, 0);
}

@end
