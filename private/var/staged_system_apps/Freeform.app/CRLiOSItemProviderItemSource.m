@implementation CRLiOSItemProviderItemSource

- (CRLiOSItemProviderItemSource)initWithItemProviders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CRLiOSItemProviderItemSource *v8;
  NSArray *v9;
  NSArray *itemProviders;
  void *v11;
  NSArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  NSOrderedSet *v18;
  NSOrderedSet *supportedUTIs;
  CRLOnce *v20;
  CRLOnce *oncePreferredImportableDataType;
  CRLOnce *v22;
  CRLOnce *onceHasImportableImages;
  CRLOnce *v24;
  CRLOnce *onceHasImportableDrawables;
  CRLOnce *v26;
  CRLOnce *onceHasImportableText;
  CRLOnce *v28;
  CRLOnce *onceHasImportableRichText;
  CRLOnce *v30;
  CRLOnce *onceHasNativeTypes;
  CRLOnce *v32;
  CRLOnce *onceSourceMetadata;
  dispatch_queue_t v34;
  OS_dispatch_queue *lockingQueueForClassDictionary;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];

  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101245AB8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0E740();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101245AD8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSItemProviderItemSource initWithItemProviders:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSItemProviderItemSource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 50, 0, "Should create item source with at least one item provider!");

  }
  v41.receiver = self;
  v41.super_class = (Class)CRLiOSItemProviderItemSource;
  v8 = -[CRLiOSItemProviderItemSource init](&v41, "init");
  if (v8)
  {
    v9 = (NSArray *)objc_msgSend(v4, "copy");
    itemProviders = v8->_itemProviders;
    v8->_itemProviders = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](NSMutableOrderedSet, "orderedSet"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v12 = v8->_itemProviders;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i), "registeredTypeIdentifiers", (_QWORD)v37));
          objc_msgSend(v11, "addObjectsFromArray:", v17);

        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v14);
    }

    v18 = (NSOrderedSet *)objc_msgSend(v11, "copy");
    supportedUTIs = v8->_supportedUTIs;
    v8->_supportedUTIs = v18;

    v20 = objc_alloc_init(CRLOnce);
    oncePreferredImportableDataType = v8->_oncePreferredImportableDataType;
    v8->_oncePreferredImportableDataType = v20;

    v22 = objc_alloc_init(CRLOnce);
    onceHasImportableImages = v8->_onceHasImportableImages;
    v8->_onceHasImportableImages = v22;

    v24 = objc_alloc_init(CRLOnce);
    onceHasImportableDrawables = v8->_onceHasImportableDrawables;
    v8->_onceHasImportableDrawables = v24;

    v26 = objc_alloc_init(CRLOnce);
    onceHasImportableText = v8->_onceHasImportableText;
    v8->_onceHasImportableText = v26;

    v28 = objc_alloc_init(CRLOnce);
    onceHasImportableRichText = v8->_onceHasImportableRichText;
    v8->_onceHasImportableRichText = v28;

    v30 = objc_alloc_init(CRLOnce);
    onceHasNativeTypes = v8->_onceHasNativeTypes;
    v8->_onceHasNativeTypes = v30;

    v32 = objc_alloc_init(CRLOnce);
    onceSourceMetadata = v8->_onceSourceMetadata;
    v8->_onceSourceMetadata = v32;

    v34 = dispatch_queue_create("com.apple.freeform.itemProviderItemSourceClassDictionary", 0);
    lockingQueueForClassDictionary = v8->_lockingQueueForClassDictionary;
    v8->_lockingQueueForClassDictionary = (OS_dispatch_queue *)v34;

  }
  return v8;
}

- (CRLiOSItemProviderItemSource)init
{
  unsigned int v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  unsigned int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  v2 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101245AF8);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLiOSItemProviderItemSource init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSItemProviderItemSource.m";
    v17 = 1024;
    v18 = 72;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101245B18);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v12 = v2;
    v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSItemProviderItemSource init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSItemProviderItemSource.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 72, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLiOSItemProviderItemSource init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (Class)contentDescriptionTranslatorClass
{
  return (Class)objc_opt_class(CRLContentDescriptionTranslator, a2);
}

- (BOOL)p_containsAnyUTIFromList:(id)a3
{
  id v4;
  NSOrderedSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_supportedUTIs;
  v6 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "crl_conformsToAnyUTI:", v4, (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (id)p_progressWithChildren:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init((Class)NSProgress);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          v8 += (uint64_t)objc_msgSend(v11, "totalUnitCount", (_QWORD)v13);
          objc_msgSend(v4, "addChild:withPendingUnitCount:", v11, objc_msgSend(v11, "totalUnitCount"));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
    }

    objc_msgSend(v4, "setTotalUnitCount:", v8);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)p_unrecognizedTypeErrorForItemProvider:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("The data is not a recognized type."), 0, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestedName"));
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("The data “%@” couldn’t be inserted."), 0, 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestedName"));
    v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10));

    v5 = (void *)v11;
  }
  v15[0] = NSLocalizedDescriptionKey;
  v15[1] = CFSTR("CRLBoardItemImporterErrorMediaTypeKey");
  v16[0] = v5;
  v16[1] = &off_1012CC370;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.freeform.CRLErrorDomainInfoImporter"), 103, v12));

  return v13;
}

- (unint64_t)itemCount
{
  return -[NSArray count](self->_itemProviders, "count");
}

- (BOOL)canLoadItemsOfClass:(Class)a3
{
  NSObject *lockingQueueForClassDictionary;
  char v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &OBJC_PROTOCOL___NSItemProviderReading))
  {
    lockingQueueForClassDictionary = self->_lockingQueueForClassDictionary;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10021C1EC;
    block[3] = &unk_101245B40;
    block[4] = self;
    block[5] = &v9;
    block[6] = a3;
    dispatch_sync(lockingQueueForClassDictionary, block);
  }
  v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (unint64_t)preferredImportableDataTypeDetectingImportableURLsInText:(BOOL)a3 skipFileURLs:(BOOL)a4
{
  CRLOnce *oncePreferredImportableDataType;
  _QWORD v7[5];

  oncePreferredImportableDataType = self->_oncePreferredImportableDataType;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10021C414;
  v7[3] = &unk_10122D110;
  v7[4] = self;
  -[CRLOnce performBlockOnce:](oncePreferredImportableDataType, "performBlockOnce:", v7, a4);
  return self->_preferredImportableDataType;
}

- (unint64_t)preferredImportableDataTypeDetectingImportableURLsInText:(BOOL)a3
{
  return -[CRLiOSItemProviderItemSource preferredImportableDataTypeDetectingImportableURLsInText:skipFileURLs:](self, "preferredImportableDataTypeDetectingImportableURLsInText:skipFileURLs:", a3, 0);
}

- (BOOL)hasImportableImages
{
  CRLOnce *onceHasImportableImages;
  _QWORD v5[5];

  onceHasImportableImages = self->_onceHasImportableImages;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10021C610;
  v5[3] = &unk_10122D110;
  v5[4] = self;
  -[CRLOnce performBlockOnce:](onceHasImportableImages, "performBlockOnce:", v5);
  return self->_hasImportableImages;
}

- (id)loadImportedImagesForAssetOwner:(id)a3 compatibilityAlertPresenter:(id)a4 withHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  Class v30;
  NSString *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  dispatch_queue_global_t global_queue;
  NSObject *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  id v44;
  void *v45;
  CRLiOSItemProviderItemSource *v46;
  NSArray *obj;
  void *v48;
  NSObject *group;
  id v50;
  id v51;
  uint64_t v52;
  void *v53;
  _QWORD block[4];
  id v55;
  id v56;
  id v57;
  _QWORD v58[5];
  id v59;
  id v60;
  id v61;
  id v62;
  NSObject *v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  _BYTE v74[30];
  _QWORD v75[2];
  _BYTE v76[128];
  _BYTE v77[128];

  v51 = a3;
  v50 = a4;
  v44 = a5;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSArray count](self->_itemProviders, "count")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLIngestionTypes supportedImageTypes](CRLIngestionTypes, "supportedImageTypes"));
  group = dispatch_group_create();
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v46 = self;
  obj = self->_itemProviders;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v52 = *(_QWORD *)v70;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v70 != v52)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)v12);
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "registeredTypeIdentifiers"));
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v66;
          while (2)
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(_QWORD *)v66 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v19, "crl_conformsToAnyUTI:", v8))
              {
                dispatch_group_enter(group);
                v58[0] = _NSConcreteStackBlock;
                v58[1] = 3221225472;
                v58[2] = sub_10021CD8C;
                v58[3] = &unk_101245C58;
                v58[4] = v19;
                v59 = v51;
                v60 = v50;
                v61 = v48;
                v64 = v11;
                v62 = v53;
                v63 = group;
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "loadDataRepresentationForTypeIdentifier:completionHandler:", v19, v58));
                if (v22)
                {
                  objc_msgSend(v45, "addObject:", v22);
                }
                else
                {
                  v23 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                  if (qword_10147E370 != -1)
                    dispatch_once(&qword_10147E370, &stru_101245C78);
                  v24 = off_1013D9070;
                  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67110146;
                    *(_DWORD *)v74 = v23;
                    *(_WORD *)&v74[4] = 2082;
                    *(_QWORD *)&v74[6] = "-[CRLiOSItemProviderItemSource loadImportedImagesForAssetOwner:compatibilityAle"
                                         "rtPresenter:withHandler:]";
                    *(_WORD *)&v74[14] = 2082;
                    *(_QWORD *)&v74[16] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSItemProviderItemSource.m";
                    *(_WORD *)&v74[24] = 1024;
                    *(_DWORD *)&v74[26] = 230;
                    LOWORD(v75[0]) = 2112;
                    *(_QWORD *)((char *)v75 + 2) = v19;
                    _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d No progress provided for UTI %@", buf, 0x2Cu);
                  }
                  if (qword_10147E370 != -1)
                    dispatch_once(&qword_10147E370, &stru_101245C98);
                  v25 = off_1013D9070;
                  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                  {
                    v35 = v25;
                    v36 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)v74 = v23;
                    *(_WORD *)&v74[4] = 2114;
                    *(_QWORD *)&v74[6] = v36;
                    _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

                  }
                  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSItemProviderItemSource loadImportedImagesForAssetOwner:compatibilityAlertPresenter:withHandler:]"));
                  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSItemProviderItemSource.m"));
                  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 230, 0, "No progress provided for UTI %@", v19);

                }
                goto LABEL_31;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
            if (v16)
              continue;
            break;
          }
        }

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSItemProviderItemSource p_unrecognizedTypeErrorForItemProvider:](v46, "p_unrecognizedTypeErrorForItemProvider:", v13));
        if (qword_10147E368 != -1)
          dispatch_once(&qword_10147E368, &stru_101245CB8);
        v20 = off_1013D9068;
        if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
        {
          v28 = v20;
          objc_opt_class(v14, v29);
          v31 = NSStringFromClass(v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "domain"));
          v34 = objc_msgSend(v14, "code");
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)v74 = v32;
          *(_WORD *)&v74[8] = 2114;
          *(_QWORD *)&v74[10] = v33;
          *(_WORD *)&v74[18] = 2048;
          *(_QWORD *)&v74[20] = v34;
          *(_WORD *)&v74[28] = 2112;
          v75[0] = v14;
          _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Error loading image data. Error: errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x2Au);

        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
        objc_msgSend(v53, "setObject:forKey:", v14, v21);

LABEL_31:
        ++v11;
        v12 = (char *)v12 + 1;
      }
      while (v12 != v10);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    }
    while (v10);
  }

  global_queue = dispatch_get_global_queue(0, 0);
  v38 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021D4A0;
  block[3] = &unk_101234DA0;
  v55 = v48;
  v56 = v53;
  v57 = v44;
  v39 = v44;
  v40 = v53;
  v41 = v48;
  dispatch_group_notify(group, v38, block);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSItemProviderItemSource p_progressWithChildren:](v46, "p_progressWithChildren:", v45));
  return v42;
}

- (BOOL)hasImportableBoardItemsDetectingImportableURLsInText:(BOOL)a3 skipFileURLs:(BOOL)a4
{
  CRLOnce *onceHasImportableDrawables;
  _QWORD v7[5];

  onceHasImportableDrawables = self->_onceHasImportableDrawables;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10021D758;
  v7[3] = &unk_10122D110;
  v7[4] = self;
  -[CRLOnce performBlockOnce:](onceHasImportableDrawables, "performBlockOnce:", v7, a4);
  return self->_hasImportableDrawables;
}

- (BOOL)hasImportableBoardItemsDetectingImportableURLsInText:(BOOL)a3
{
  return -[CRLiOSItemProviderItemSource hasImportableBoardItemsDetectingImportableURLsInText:skipFileURLs:](self, "hasImportableBoardItemsDetectingImportableURLsInText:skipFileURLs:", a3, 0);
}

- (BOOL)hasImportableText
{
  CRLOnce *onceHasImportableText;
  _QWORD v5[5];

  onceHasImportableText = self->_onceHasImportableText;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10021D8C8;
  v5[3] = &unk_10122D110;
  v5[4] = self;
  -[CRLOnce performBlockOnce:](onceHasImportableText, "performBlockOnce:", v5);
  return self->_hasImportableText;
}

- (BOOL)hasImportableRichText
{
  CRLOnce *onceHasImportableRichText;
  _QWORD v5[5];

  onceHasImportableRichText = self->_onceHasImportableRichText;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10021DA40;
  v5[3] = &unk_10122D110;
  v5[4] = self;
  -[CRLOnce performBlockOnce:](onceHasImportableRichText, "performBlockOnce:", v5);
  return self->_hasImportableRichText;
}

- (id)loadImportedRichTextStringWithHandler:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  uint64_t v22;
  id v23;
  NSArray *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];

  v4 = a3;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v5 = self->_itemProviders;
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v23)
  {
    v6 = *(_QWORD *)v35;
    v24 = v5;
    v25 = v4;
    v22 = *(_QWORD *)v35;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v35 != v6)
          objc_enumerationMutation(v5);
        v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v7);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "registeredTypeIdentifiers"));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v31;
          while (2)
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(_QWORD *)v31 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
              v15 = (void *)objc_claimAutoreleasedReturnValue(+[CRLIngestionTypes supportedRichTextTypes](CRLIngestionTypes, "supportedRichTextTypes"));
              v16 = objc_msgSend(v14, "crl_conformsToAnyUTI:", v15);

              if (v16)
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeRTFD, "identifier"));
                v19 = objc_msgSend(v14, "isEqualToString:", v18);

                if (v19)
                {
                  v28[0] = _NSConcreteStackBlock;
                  v28[1] = 3221225472;
                  v28[2] = sub_10021DD68;
                  v28[3] = &unk_101245D40;
                  v4 = v25;
                  v29 = v25;
                  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "loadFileRepresentationForTypeIdentifier:completionHandler:", v14, v28));
                  v20 = v29;
                }
                else
                {
                  v26[0] = _NSConcreteStackBlock;
                  v26[1] = 3221225472;
                  v26[2] = sub_10021E0DC;
                  v26[3] = &unk_101245DC8;
                  v26[4] = v14;
                  v4 = v25;
                  v27 = v25;
                  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "loadDataRepresentationForTypeIdentifier:completionHandler:", v14, v26));
                  v20 = v27;
                }

                v5 = v24;
                goto LABEL_22;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            if (v11)
              continue;
            break;
          }
        }

        v7 = (char *)v7 + 1;
        v5 = v24;
        v4 = v25;
        v6 = v22;
      }
      while (v7 != v23);
      v17 = 0;
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v23);
  }
  else
  {
    v17 = 0;
  }
LABEL_22:

  return v17;
}

- (id)loadImportedTextStringWithHandler:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSArray *obj;
  id v18;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v18 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = self->_itemProviders;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "registeredTypeIdentifiers"));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v22;
LABEL_8:
          v13 = 0;
          while (1)
          {
            if (*(_QWORD *)v22 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13);
            if (+[CRLIngestionTypes isValidPlainTextUTI:](CRLIngestionTypes, "isValidPlainTextUTI:", v14))
              break;
            if (v11 == (id)++v13)
            {
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
              if (v11)
                goto LABEL_8;
              goto LABEL_14;
            }
          }
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_10021E5F8;
          v19[3] = &unk_101245DC8;
          v19[4] = v14;
          v20 = v18;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "loadDataRepresentationForTypeIdentifier:completionHandler:", v14, v19));

          if (v15)
            goto LABEL_19;
        }
        else
        {
LABEL_14:

        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v5);
  }
  v15 = 0;
LABEL_19:

  return v15;
}

- (id)p_sourceMetadata
{
  CRLOnce *onceSourceMetadata;
  _QWORD v5[5];

  onceSourceMetadata = self->_onceSourceMetadata;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10021E9AC;
  v5[3] = &unk_10122D110;
  v5[4] = self;
  -[CRLOnce performBlockOnce:](onceSourceMetadata, "performBlockOnce:", v5);
  return self->_sourceMetadata;
}

- (BOOL)hasNativeTypes
{
  CRLOnce *onceHasNativeTypes;
  _QWORD v5[5];

  onceHasNativeTypes = self->_onceHasNativeTypes;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10021EC30;
  v5[3] = &unk_10122D110;
  v5[4] = self;
  -[CRLOnce performBlockOnce:](onceHasNativeTypes, "performBlockOnce:", v5);
  return self->_hasNativeTypes;
}

- (BOOL)hasNativeBoardItems
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSItemProviderItemSource p_sourceMetadata](self, "p_sourceMetadata"));
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("com.apple.freeform.pasteboardState.hasNativeBoardItems"));

  return v3;
}

- (BOOL)canProduceBoardItems
{
  if (-[CRLiOSItemProviderItemSource hasNativeBoardItems](self, "hasNativeBoardItems")
    || -[CRLiOSItemProviderItemSource hasNativeTextStorages](self, "hasNativeTextStorages")
    || -[CRLiOSItemProviderItemSource hasImportableRichText](self, "hasImportableRichText")
    || -[CRLiOSItemProviderItemSource hasImportableText](self, "hasImportableText"))
  {
    return 1;
  }
  else
  {
    return -[CRLiOSItemProviderItemSource hasImportableBoardItemsDetectingImportableURLsInText:](self, "hasImportableBoardItemsDetectingImportableURLsInText:", 1);
  }
}

- (BOOL)hasSingleNativeImageBoardItem
{
  return -[CRLiOSItemProviderItemSource hasTeamDataType:](self, "hasTeamDataType:", CFSTR("com.apple.freeform.pasteboardState.hasSingleNativeImageBoardItem"));
}

- (BOOL)hasSingleNativeMovieBoardItem
{
  return -[CRLiOSItemProviderItemSource hasTeamDataType:](self, "hasTeamDataType:", CFSTR("com.apple.freeform.pasteboardState.hasSingleNativeMovieBoardItem"));
}

- (BOOL)hasOnlyNativeFreehandDrawingBoardItems
{
  return -[CRLiOSItemProviderItemSource hasTeamDataType:](self, "hasTeamDataType:", CFSTR("com.apple.freeform.pasteboardState.hasOnlyFreehandDrawingBoardItems"));
}

- (BOOL)hasNativeFreehandDrawingBoardItems
{
  return -[CRLiOSItemProviderItemSource hasTeamDataType:](self, "hasTeamDataType:", CFSTR("com.apple.freeform.pasteboardState.hasFreehandDrawingBoardItems"));
}

- (BOOL)hasOnlyNativeTextBoxItems
{
  return -[CRLiOSItemProviderItemSource hasTeamDataType:](self, "hasTeamDataType:", CFSTR("com.apple.freeform.pasteboardState.hasOnlyNativeTextBoxItems"));
}

- (BOOL)hasNativeTextStorages
{
  return -[CRLiOSItemProviderItemSource hasTeamDataType:](self, "hasTeamDataType:", CFSTR("com.apple.freeform.pasteboardState.hasTextStoragesAttachmentsNotAllowed"));
}

- (BOOL)hasNativeText
{
  return -[CRLiOSItemProviderItemSource hasTeamDataType:](self, "hasTeamDataType:", CFSTR("com.apple.freeform.pasteboardState.hasNativeText"));
}

- (BOOL)hasNativeBoardItemsContainingText
{
  return -[CRLiOSItemProviderItemSource hasTeamDataType:](self, "hasTeamDataType:", CFSTR("com.apple.freeform.pasteboardState.hasNativeBoardItemsContainingText"));
}

- (BOOL)p_shouldKeepHighlights
{
  return 1;
}

- (id)loadProvidersForNativeBoardItemsWithBoardItemFactory:(id)a3 loadHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _TtC8Freeform44CRLPasteboardObjectItemProviderReadAssistant *v11;
  void *v12;
  void *v13;
  void *v14;
  _TtC8Freeform44CRLPasteboardObjectItemProviderReadAssistant *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, void *);
  void *v27;
  CRLiOSItemProviderItemSource *v28;
  id v29;
  id v30;

  v6 = a3;
  v7 = a4;
  if ((id)-[NSArray count](self->_itemProviders, "count") != (id)1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101245E88);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0EF28();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101245EA8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSItemProviderItemSource loadProvidersForNativeBoardItemsWithBoardItemFactory:loadHandler:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSItemProviderItemSource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 519, 0, "Unexpected number of item providers!");

  }
  v11 = [_TtC8Freeform44CRLPasteboardObjectItemProviderReadAssistant alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "store"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "store"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "crdtContext"));
  v15 = -[CRLPasteboardObjectItemProviderReadAssistant initWithStore:context:](v11, "initWithStore:context:", v12, v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_itemProviders, "firstObject"));
  v24 = _NSConcreteStackBlock;
  v25 = 3221225472;
  v26 = sub_10021F1EC;
  v27 = &unk_101245F30;
  v28 = self;
  v17 = v6;
  v29 = v17;
  v18 = v7;
  v30 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardObjectItemProviderReadAssistant readPasteboardObjectFrom:completion:](v15, "readPasteboardObjectFrom:completion:", v16, &v24));

  if (!v19)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101245F50);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0EE98();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101245F70);
    v20 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSItemProviderItemSource loadProvidersForNativeBoardItemsWithBoardItemFactory:loadHandler:]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSItemProviderItemSource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 546, 0, "invalid nil value for '%{public}s'", "progress", v24, v25, v26, v27, v28, v29);

  }
  return v19;
}

- (id)loadProvidersForImportedBoardItemsUsingBoardItemFactory:(id)a3 maximumStringLength:(unint64_t)a4 WithLoadHandler:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  char v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  unsigned int v27;
  void *v28;
  unsigned int v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  unsigned __int8 v40;
  unsigned int v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  unsigned int v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  int v56;
  void *v57;
  void *v58;
  uint64_t v59;
  Class v60;
  NSString *v61;
  id v62;
  id v63;
  id v64;
  dispatch_queue_global_t global_queue;
  NSObject *v66;
  id v67;
  void *v68;
  id v70;
  NSArray *obj;
  uint64_t v72;
  id v73;
  NSObject *v74;
  void *v75;
  id v76;
  uint64_t v77;
  _QWORD *v78;
  id v79;
  char v80;
  _QWORD *v82;
  dispatch_group_t group;
  id v84;
  CRLiOSItemProviderItemSource *v85;
  void *v86;
  uint64_t v87;
  _QWORD block[4];
  id v89;
  _QWORD *v90;
  _QWORD v91[4];
  NSObject *v92;
  CRLiOSItemProviderItemSource *v93;
  uint64_t *v94;
  uint64_t *v95;
  _QWORD v96[5];
  id v97;
  NSObject *v98;
  uint64_t *v99;
  _QWORD *v100;
  _QWORD v101[4];
  NSObject *v102;
  _QWORD *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[4];
  dispatch_group_t v109;
  void *v110;
  id v111;
  uint64_t *v112;
  _QWORD *v113;
  _QWORD v114[4];
  NSObject *v115;
  void *v116;
  id v117;
  CRLiOSItemProviderItemSource *v118;
  id v119;
  uint64_t *v120;
  _QWORD *v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  char v126;
  uint64_t v127;
  uint64_t *v128;
  uint64_t v129;
  char v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  _QWORD v135[5];
  id v136;
  uint8_t buf[4];
  _BYTE v138[30];
  _QWORD v139[2];
  _BYTE v140[128];
  _BYTE v141[128];

  v73 = a3;
  v70 = a5;
  v85 = self;
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSArray count](self->_itemProviders, "count")));
  v74 = dispatch_group_create();
  v135[0] = 0;
  v135[1] = v135;
  v135[2] = 0x3032000000;
  v135[3] = sub_1002203A8;
  v135[4] = sub_1002203B8;
  v136 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  obj = self->_itemProviders;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v131, v141, 16);
  if (v7)
  {
    v72 = *(_QWORD *)v132;
    do
    {
      v8 = 0;
      v76 = v7;
      do
      {
        if (*(_QWORD *)v132 != v72)
          objc_enumerationMutation(obj);
        v77 = v8;
        v9 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * v8);
        v127 = 0;
        v128 = &v127;
        v129 = 0x2020000000;
        v130 = 0;
        v123 = 0;
        v124 = &v123;
        v125 = 0x2020000000;
        v126 = 0;
        v114[0] = _NSConcreteStackBlock;
        v114[1] = 3221225472;
        v114[2] = sub_1002203C0;
        v114[3] = &unk_1012460A0;
        v120 = &v127;
        v10 = v74;
        v115 = v10;
        v86 = v9;
        v116 = v9;
        v121 = v135;
        v122 = a4;
        v84 = v73;
        v117 = v84;
        v118 = v85;
        v11 = v75;
        v119 = v11;
        v82 = objc_retainBlock(v114);
        v108[0] = _NSConcreteStackBlock;
        v108[1] = 3221225472;
        v108[2] = sub_100220C60;
        v108[3] = &unk_1012461D0;
        v112 = &v127;
        group = v10;
        v109 = group;
        v110 = v9;
        v113 = v135;
        v79 = v11;
        v111 = v79;
        v78 = objc_retainBlock(v108);
        v106 = 0u;
        v107 = 0u;
        v104 = 0u;
        v105 = 0u;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "registeredTypeIdentifiers"));
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v104, v140, 16);
        if (!v13)
        {
LABEL_57:

          v56 = *((unsigned __int8 *)v128 + 24);
          goto LABEL_58;
        }
        v14 = 0;
        v80 = 0;
        v87 = *(_QWORD *)v105;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v105 != v87)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * (_QWORD)v15);
            v17 = sub_1000306D4();
            v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
            v20 = objc_msgSend(v16, "isEqualToString:", v19);

            v14 |= v20;
            if (+[CRLIngestionTypes isValidPlainTextUTI:](CRLIngestionTypes, "isValidPlainTextUTI:", v16))
            {
              if (objc_msgSend(v16, "isEqualToString:", CFSTR("public.file-url")))
              {
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "registeredTypeIdentifiers"));
                v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v21));

                v23 = (void *)objc_claimAutoreleasedReturnValue(+[CRLIngestionTypes highEfficiencyImageTypes](CRLIngestionTypes, "highEfficiencyImageTypes"));
                v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v23));
                v25 = objc_msgSend(v22, "intersectsSet:", v24);

                if ((v25 & 1) != 0)
                  goto LABEL_39;
              }
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeURL, "identifier"));
              v27 = objc_msgSend(v16, "isEqualToString:", v26);

              if (v27)
              {
                v80 = 1;
                if ((v14 & 1) != 0)
                  goto LABEL_55;
                v14 = 0;
              }
              else
              {
                ((void (*)(_QWORD *, void *))v82[2])(v82, v16);
              }
            }
            else
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(+[CRLIngestionTypes supportedRichTextTypes](CRLIngestionTypes, "supportedRichTextTypes"));
              v29 = objc_msgSend(v16, "crl_conformsToAnyUTI:", v28);

              if (v29)
              {
                *((_BYTE *)v128 + 24) = 1;
                dispatch_group_enter(group);
                v101[0] = _NSConcreteStackBlock;
                v101[1] = 3221225472;
                v101[2] = sub_10022138C;
                v101[3] = &unk_1012461F8;
                v103 = v135;
                v102 = group;
                v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSItemProviderItemSource richTextBoardItemProvidersFor:factory:uti:maximumCharacterLimit:completion:](v85, "richTextBoardItemProvidersFor:factory:uti:maximumCharacterLimit:completion:", v86, v84, v16, a4, v101));
                if (v30)
                {
                  objc_msgSend(v79, "addObject:", v30);
                }
                else
                {
                  v41 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                  if (qword_10147E370 != -1)
                    dispatch_once(&qword_10147E370, &stru_101246218);
                  v42 = off_1013D9070;
                  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67110146;
                    *(_DWORD *)v138 = v41;
                    *(_WORD *)&v138[4] = 2082;
                    *(_QWORD *)&v138[6] = "-[CRLiOSItemProviderItemSource loadProvidersForImportedBoardItemsUsingBoardIte"
                                          "mFactory:maximumStringLength:WithLoadHandler:]";
                    *(_WORD *)&v138[14] = 2082;
                    *(_QWORD *)&v138[16] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSItemProviderItemSource.m";
                    *(_WORD *)&v138[24] = 1024;
                    *(_DWORD *)&v138[26] = 683;
                    LOWORD(v139[0]) = 2112;
                    *(_QWORD *)((char *)v139 + 2) = v16;
                    _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d No progress provided for UTI %@", buf, 0x2Cu);
                  }
                  if (qword_10147E370 != -1)
                    dispatch_once(&qword_10147E370, &stru_101246238);
                  v43 = off_1013D9070;
                  if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR))
                  {
                    v53 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)v138 = v41;
                    *(_WORD *)&v138[4] = 2114;
                    *(_QWORD *)&v138[6] = v53;
                    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v43, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

                  }
                  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSItemProviderItemSource loadProvidersForImportedBoardItemsUsingBoardItemFactory:maximumStringLength:WithLoadHandler:]"));
                  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSItemProviderItemSource.m"));
                  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v44, v45, 683, 0, "No progress provided for UTI %@", v16);

                }
              }
              else
              {
                v31 = sub_10003221C();
                v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "identifier"));
                v34 = objc_msgSend(v16, "isEqualToString:", v33);

                if ((v34 & 1) != 0)
                {
                  v14 = 1;
                }
                else if (+[CRLInfoImporterBoardItemProvider canInitWithType:](CRLInfoImporterBoardItemProvider, "canInitWithType:", v16))
                {
                  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeVCard, "identifier"));
                  if ((objc_msgSend(v16, "isEqualToString:", v35) & 1) != 0)
                  {
                    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "registeredTypeIdentifiers"));
                    v37 = sub_10003221C();
                    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
                    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "identifier"));
                    v40 = objc_msgSend(v36, "containsObject:", v39);

                    if ((v40 & 1) != 0)
                      goto LABEL_39;
                  }
                  else
                  {

                  }
                  *((_BYTE *)v128 + 24) = 1;
                  dispatch_group_enter(group);
                  v96[0] = _NSConcreteStackBlock;
                  v96[1] = 3221225472;
                  v96[2] = sub_100221420;
                  v96[3] = &unk_101246280;
                  v99 = &v123;
                  v96[4] = v16;
                  v97 = v84;
                  v100 = v135;
                  v46 = group;
                  v98 = v46;
                  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "loadFileRepresentationForTypeIdentifier:completionHandler:", v16, v96));
                  v91[0] = _NSConcreteStackBlock;
                  v91[1] = 3221225472;
                  v91[2] = sub_100221544;
                  v91[3] = &unk_1012462A8;
                  v94 = &v127;
                  v95 = &v123;
                  v92 = v46;
                  v93 = v85;
                  objc_msgSend(v47, "setCancellationHandler:", v91);
                  if (v47)
                  {
                    objc_msgSend(v79, "addObject:", v47);
                  }
                  else
                  {
                    v48 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                    if (qword_10147E370 != -1)
                      dispatch_once(&qword_10147E370, &stru_1012462C8);
                    v49 = off_1013D9070;
                    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 67110146;
                      *(_DWORD *)v138 = v48;
                      *(_WORD *)&v138[4] = 2082;
                      *(_QWORD *)&v138[6] = "-[CRLiOSItemProviderItemSource loadProvidersForImportedBoardItemsUsingBoardI"
                                            "temFactory:maximumStringLength:WithLoadHandler:]";
                      *(_WORD *)&v138[14] = 2082;
                      *(_QWORD *)&v138[16] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSItemProv"
                                             "iderItemSource.m";
                      *(_WORD *)&v138[24] = 1024;
                      *(_DWORD *)&v138[26] = 720;
                      LOWORD(v139[0]) = 2112;
                      *(_QWORD *)((char *)v139 + 2) = v16;
                      _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d No progress provided for UTI %@", buf, 0x2Cu);
                    }
                    if (qword_10147E370 != -1)
                      dispatch_once(&qword_10147E370, &stru_1012462E8);
                    v50 = off_1013D9070;
                    if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_ERROR))
                    {
                      v54 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                      *(_DWORD *)buf = 67109378;
                      *(_DWORD *)v138 = v48;
                      *(_WORD *)&v138[4] = 2114;
                      *(_QWORD *)&v138[6] = v54;
                      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v50, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

                    }
                    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSItemProviderItemSource loadProvidersForImportedBoardItemsUsingBoardItemFactory:maximumStringLength:WithLoadHandler:]"));
                    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSItemProviderItemSource.m"));
                    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v51, v52, 720, 0, "No progress provided for UTI %@", v16);

                  }
                }
              }
            }
            if (*((_BYTE *)v128 + 24) || *((_BYTE *)v124 + 24))
              goto LABEL_55;
LABEL_39:
            v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          v55 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v104, v140, 16);
          v13 = v55;
        }
        while (v55);
LABEL_55:

        v56 = *((unsigned __int8 *)v128 + 24);
        if (((*((_BYTE *)v128 + 24) == 0) & v80) == 1)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeURL, "identifier"));
          ((void (*)(_QWORD *, void *))v78[2])(v78, v12);
          goto LABEL_57;
        }
LABEL_58:
        if (!v56 && !*((_BYTE *)v124 + 24))
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSItemProviderItemSource p_unrecognizedTypeErrorForItemProvider:](v85, "p_unrecognizedTypeErrorForItemProvider:", v86));
          if (qword_10147E368 != -1)
            dispatch_once(&qword_10147E368, &stru_101246308);
          v58 = off_1013D9068;
          if (os_log_type_enabled((os_log_t)v58, OS_LOG_TYPE_ERROR))
          {
            objc_opt_class(v57, v59);
            v61 = NSStringFromClass(v60);
            v62 = (id)objc_claimAutoreleasedReturnValue(v61);
            v63 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "domain"));
            v64 = objc_msgSend(v57, "code");
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)v138 = v62;
            *(_WORD *)&v138[8] = 2114;
            *(_QWORD *)&v138[10] = v63;
            *(_WORD *)&v138[18] = 2048;
            *(_QWORD *)&v138[20] = v64;
            *(_WORD *)&v138[28] = 2112;
            v139[0] = v57;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v58, OS_LOG_TYPE_ERROR, "Error loading importable data. Error: errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x2Au);

          }
        }

        _Block_object_dispose(&v123, 8);
        _Block_object_dispose(&v127, 8);
        v8 = v77 + 1;
      }
      while ((id)(v77 + 1) != v76);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v131, v141, 16);
    }
    while (v7);
  }

  global_queue = dispatch_get_global_queue(0, 0);
  v66 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100221660;
  block[3] = &unk_101239550;
  v67 = v70;
  v89 = v67;
  v90 = v135;
  dispatch_group_notify(v74, v66, block);

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSItemProviderItemSource p_progressWithChildren:](v85, "p_progressWithChildren:", v75));
  _Block_object_dispose(v135, 8);

  return v68;
}

- (id)loadProvidersForImportedBoardItemsUsingBoardItemFactory:(id)a3 WithLoadHandler:(id)a4
{
  return -[CRLiOSItemProviderItemSource loadProvidersForImportedBoardItemsUsingBoardItemFactory:maximumStringLength:WithLoadHandler:](self, "loadProvidersForImportedBoardItemsUsingBoardItemFactory:maximumStringLength:WithLoadHandler:", a3, 25600, a4);
}

- (id)loadTextStorageUsingBoardItemFactory:(id)a3 forTargetContext:(id)a4 targetStorage:(id)a5 loadHandler:(id)a6
{
  id v9;
  id v10;
  NSArray *itemProviders;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _TtC8Freeform44CRLPasteboardObjectItemProviderReadAssistant *v17;
  void *v18;
  void *v19;
  void *v20;
  _TtC8Freeform44CRLPasteboardObjectItemProviderReadAssistant *v21;
  id v22;
  id v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  id v28;

  v9 = a3;
  v10 = a6;
  itemProviders = self->_itemProviders;
  v12 = a4;
  if ((id)-[NSArray count](itemProviders, "count") != (id)1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101246328);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0F688();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101246348);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSItemProviderItemSource loadTextStorageUsingBoardItemFactory:forTargetContext:targetStorage:loadHandler:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSItemProviderItemSource.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 752, 0, "Unexpected number of item providers!");

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_itemProviders, "firstObject"));
  v17 = [_TtC8Freeform44CRLPasteboardObjectItemProviderReadAssistant alloc];
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sourceStore"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sourceStore"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "crdtContext"));
  v21 = -[CRLPasteboardObjectItemProviderReadAssistant initWithStore:context:](v17, "initWithStore:context:", v18, v20);

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100221994;
  v26[3] = &unk_101246390;
  v27 = v9;
  v28 = v10;
  v22 = v10;
  v23 = v9;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardObjectItemProviderReadAssistant readPasteboardObjectFrom:completion:](v21, "readPasteboardObjectFrom:completion:", v16, v26));

  return v24;
}

- (BOOL)hasTeamDataType:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSItemProviderItemSource p_sourceMetadata](self, "p_sourceMetadata", 0));
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_opt_class(NSString, v6);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0
          && (objc_msgSend(v10, "isEqualToString:", v4) & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v7;
}

- (id)cancellationHandler
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setCancellationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancellationHandler, 0);
  objc_storeStrong((id *)&self->_classCanBeLoadedCache, 0);
  objc_storeStrong((id *)&self->_lockingQueueForClassDictionary, 0);
  objc_storeStrong((id *)&self->_sourceMetadata, 0);
  objc_storeStrong((id *)&self->_onceSourceMetadata, 0);
  objc_storeStrong((id *)&self->_onceHasNativeTypes, 0);
  objc_storeStrong((id *)&self->_onceHasImportableRichText, 0);
  objc_storeStrong((id *)&self->_onceHasImportableText, 0);
  objc_storeStrong((id *)&self->_onceHasImportableDrawables, 0);
  objc_storeStrong((id *)&self->_onceHasImportableImages, 0);
  objc_storeStrong((id *)&self->_oncePreferredImportableDataType, 0);
  objc_storeStrong((id *)&self->_supportedUTIs, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

- (NSString)defaultTextFileName
{
  void *v3;
  CRLiOSItemProviderItemSource *v4;
  id v5;
  NSString v6;
  NSString v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;

  v3 = (void *)objc_opt_self(NSBundle);
  v4 = self;
  v5 = objc_msgSend(v3, "mainBundle");
  v6 = String._bridgeToObjectiveC()();
  v7 = String._bridgeToObjectiveC()();
  v8 = objc_msgSend(v5, "localizedStringForKey:value:table:", v6, v7, 0);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v10 = v9;

  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  return (NSString *)v11;
}

- (id)richTextBoardItemProvidersFor:(id)a3 factory:(id)a4 uti:(id)a5 maximumCharacterLimit:(int64_t)a6 completion:(id)a7
{
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  CRLiOSItemProviderItemSource *v18;
  void *v19;

  v12 = _Block_copy(a7);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v15 = v14;
  _Block_copy(v12);
  v16 = a3;
  v17 = a4;
  v18 = self;
  v19 = (void *)sub_100578DB8((uint64_t)v16, (uint64_t)v17, v13, v15, a6, (uint64_t)v18, (void (**)(_QWORD, _QWORD))v12);
  _Block_release(v12);
  _Block_release(v12);

  swift_bridgeObjectRelease(v15);
  return v19;
}

@end
