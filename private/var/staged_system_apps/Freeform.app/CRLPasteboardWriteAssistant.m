@implementation CRLPasteboardWriteAssistant

- (CRLPasteboardWriteAssistant)initWithContext:(id)a3
{
  id v5;
  CRLPasteboardWriteAssistant *v6;
  CRLPasteboardWriteAssistant *v7;
  _TtC8Freeform19CRLPasteboardObject *v8;
  void *v9;
  _TtC8Freeform19CRLPasteboardObject *v10;
  _TtC8Freeform19CRLPasteboardObject *pasteboardObject;
  NSMutableSet *v12;
  NSMutableSet *pasteboardStateTypes;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRLPasteboardWriteAssistant;
  v6 = -[CRLPasteboardWriteAssistant init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceContext, a3);
    v8 = [_TtC8Freeform19CRLPasteboardObject alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceContext"));
    v10 = -[CRLPasteboardObject initWithContext:](v8, "initWithContext:", v9);
    pasteboardObject = v7->_pasteboardObject;
    v7->_pasteboardObject = v10;

    v12 = objc_opt_new(NSMutableSet);
    pasteboardStateTypes = v7->_pasteboardStateTypes;
    v7->_pasteboardStateTypes = v12;

  }
  return v7;
}

- (void)setDataProvider:(id)a3 forTypes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *dataProviderMap;
  NSMutableOrderedSet *v13;
  NSMutableOrderedSet *dataProviderTypes;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v6 = a3;
  v7 = a4;
  if (self->_shouldRefuseAdditionalDataProviders)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241960);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E07A70();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241980);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardWriteAssistant setDataProvider:forTypes:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardWriteAssistant.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 64, 0, "Mapping data providers to types is not allowed after pasteboard writing has started");

  }
  if (!self->_dataProviderMap)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    dataProviderMap = self->_dataProviderMap;
    self->_dataProviderMap = v11;

  }
  if (!self->_dataProviderTypes)
  {
    v13 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    dataProviderTypes = self->_dataProviderTypes;
    self->_dataProviderTypes = v13;

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v7;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v15);
        v19 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dataProviderMap, "setObject:forKeyedSubscript:", v6, v19, (_QWORD)v20);
        -[NSMutableOrderedSet addObject:](self->_dataProviderTypes, "addObject:", v19);
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v16);
  }

}

- (_TtC8Freeform19CRLPasteboardObject)pasteboardObject
{
  void *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;

  if (self->_didAttemptToSerializeNativeData && self->_serializeNativeDataSuccess)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012419A0);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    {
      v4 = NSStringFromSelector("promisedPasteboardObject");
      objc_claimAutoreleasedReturnValue(v4);
      sub_100E07AF0();
    }

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012419C0);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardWriteAssistant pasteboardObject]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardWriteAssistant.mm"));
    v8 = NSStringFromSelector("promisedPasteboardObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 81, 0, "Pasteboard object has already been serialized. Call %{public}@ instead.", v9);

  }
  return self->_pasteboardObject;
}

- (void)setContentDescription:(id)a3
{
  NSDictionary *v5;
  void *v6;
  NSDictionary *v7;

  v5 = (NSDictionary *)a3;
  if (self->_contentDescription != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_contentDescription, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardWriteAssistant delegate](self, "delegate"));
    objc_msgSend(v6, "distillPasteboardContentDescription:intoPasteboardStateTypes:", v7, self->_pasteboardStateTypes);

    v5 = v7;
  }

}

- (id)crlPasteboardWithPasteboard:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(+[CRLPasteboard pasteboardWithPasteboard:](CRLPasteboard, "pasteboardWithPasteboard:", a3));
}

- (void)serializeNativeDataForPasteboard:(id)a3
{
  id v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  _TtC8Freeform33CRLPasteboardObjectWriteAssistant *v14;
  void *v15;
  void *v16;
  _TtC8Freeform33CRLPasteboardObjectWriteAssistant *v17;
  dispatch_semaphore_t v18;
  _TtC8Freeform19CRLPasteboardObject *pasteboardObject;
  NSObject *v20;
  _QWORD v21[6];
  NSObject *v22;

  v5 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012419E0);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      v7 = NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue(v7);
      sub_100E07B5C();
    }

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241A00);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardWriteAssistant serializeNativeDataForPasteboard:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardWriteAssistant.mm"));
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 101, 0, "%{public}@ needs to be invoked on the main thread for its implicit read lock", v12);

  }
  if (!self->_didWriteNativeDataToPasteboard)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardWriteAssistant crlPasteboardWithPasteboard:](self, "crlPasteboardWithPasteboard:", v5));
    v14 = [_TtC8Freeform33CRLPasteboardObjectWriteAssistant alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardSourceContext sourceStore](self->_sourceContext, "sourceStore"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardSourceContext sourceContext](self->_sourceContext, "sourceContext"));
    v17 = -[CRLPasteboardObjectWriteAssistant initWithPasteboard:store:context:](v14, "initWithPasteboard:store:context:", v13, v15, v16);

    v18 = dispatch_semaphore_create(0);
    pasteboardObject = self->_pasteboardObject;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001BEB1C;
    v21[3] = &unk_101241A48;
    v21[4] = self;
    v21[5] = v13;
    v20 = v18;
    v22 = v20;
    -[CRLPasteboardObjectWriteAssistant writePasteboardObject:completionHandler:](v17, "writePasteboardObject:completionHandler:", pasteboardObject, v21);
    dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
    self->_didWriteNativeDataToPasteboard = 1;

  }
}

- (void)loadData
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableOrderedSet *v6;
  id v7;
  uint64_t v8;
  void *i;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (!self->_didAttemptToSerializeNativeData
    && !-[CRLPasteboardWriteAssistant excludeNativeData](self, "excludeNativeData"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241A68);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E07BC8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101241A88);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardWriteAssistant loadData]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardWriteAssistant.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 138, 0, "No attempt was made to serialize native data");

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_dataProviderTypes;
  v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = -[CRLPasteboard dataForPasteboardType:](self->_nativeDataPasteboard, "dataForPasteboardType:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), (_QWORD)v11);
      }
      v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (BOOL)skipMetadataObjectSerialization
{
  return 0;
}

- (_TtC8Freeform19CRLPasteboardObject)promisedPasteboardObject
{
  return self->_pasteboardObject;
}

- (id)writableTypesForPasteboard:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSMutableOrderedSet *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  self->_shouldRefuseAdditionalDataProviders = 1;
  self->_shouldRefuseAdditionalPasteboardStateTypes = 1;
  -[CRLPasteboardWriteAssistant serializeNativeDataForPasteboard:](self, "serializeNativeDataForPasteboard:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSetWithCapacity:](NSMutableOrderedSet, "orderedSetWithCapacity:", (char *)-[NSMutableOrderedSet count](self->_dataProviderTypes, "count") + 3));
  if (!-[CRLPasteboardWriteAssistant excludeNativeData](self, "excludeNativeData"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardNativeDataProvider promisedDataTypes](self->_nativeDataProvider, "promisedDataTypes"));
    if (v5)
      objc_msgSend(v4, "addObjectsFromArray:", v5);
    if (self->_contentDescription)
      objc_msgSend(v4, "addObject:", CFSTR("com.apple.freeform.CRLDescription"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_pasteboardStateTypes, "allObjects"));
    objc_msgSend(v4, "addObjectsFromArray:", v6);

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_dataProviderTypes;
  v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), (_QWORD)v13);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "array"));
  return v11;
}

- (id)pasteboardPropertyListForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSDictionary *contentDescription;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  Class v23;
  NSString *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_dataProviderMap, "objectForKeyedSubscript:", v4));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pasteboardPromise:propertyListForType:", self, v4));
    objc_opt_class(NSData, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) == 0)
    {
LABEL_18:

      goto LABEL_19;
    }
    v10 = v7;
    v11 = v4;
    if ((unint64_t)objc_msgSend(v10, "length") > 0x1200000)
    {
      v12 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101241B08);
      v13 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E07CC8((uint64_t)v11, v12, v13);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101241B28);
      v14 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void CRLPasteboardAssertNSData(CRLPasteboard *__strong, NSData *__strong, NSString *__strong)"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboard_Internal.h"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 13, 0, "Data for %{public}@ is too large for the pasteboard. It may be silently dropped.", v11);

    }
    v7 = v10;
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.freeform.CRLDescription")))
  {
    contentDescription = self->_contentDescription;
    v28 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", contentDescription, 200, 0, &v28));
    v10 = v28;
    if (v7)
      goto LABEL_17;
    if (qword_10147E368 != -1)
      dispatch_once(&qword_10147E368, &stru_101241AA8);
    v11 = off_1013D9068;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      objc_opt_class(v10, v22);
      v24 = NSStringFromClass(v23);
      v25 = (id)objc_claimAutoreleasedReturnValue(v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
      v27 = objc_msgSend(v10, "code");
      *(_DWORD *)buf = 138544130;
      v30 = v25;
      v31 = 2114;
      v32 = v26;
      v33 = 2048;
      v34 = v27;
      v35 = 2112;
      v36 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_ERROR, "Failed to serialize content description - Error: errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x2Au);

    }
LABEL_14:

LABEL_17:
    goto LABEL_18;
  }
  if ((-[NSMutableSet containsObject:](self->_pasteboardStateTypes, "containsObject:", v4) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    if (!self->_didAttemptToSerializeNativeData
      && !-[CRLPasteboardWriteAssistant excludeNativeData](self, "excludeNativeData"))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101241AC8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E07C48();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101241AE8);
      v19 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardWriteAssistant pasteboardPropertyListForType:]"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardWriteAssistant.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 233, 0, "No attempt was made to serialize native data");

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardNativeDataProvider fulfillPromisesForPasteboardType:](self->_nativeDataProvider, "fulfillPromisesForPasteboardType:", v4));
  }
LABEL_19:

  return v7;
}

- (CRLPasteboardWriteAssistantDelegate)delegate
{
  return (CRLPasteboardWriteAssistantDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)excludeNativeData
{
  return self->_excludeNativeData;
}

- (void)setExcludeNativeData:(BOOL)a3
{
  self->_excludeNativeData = a3;
}

- (NSDictionary)contentDescription
{
  return self->_contentDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentDescription, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pasteboardStateTypes, 0);
  objc_storeStrong((id *)&self->_nativeDataProvider, 0);
  objc_storeStrong((id *)&self->_nativeDataPasteboard, 0);
  objc_storeStrong((id *)&self->_dataProviderTypes, 0);
  objc_storeStrong((id *)&self->_dataProviderMap, 0);
  objc_storeStrong((id *)&self->_pasteboardObject, 0);
  objc_storeStrong((id *)&self->_sourceContext, 0);
}

@end
