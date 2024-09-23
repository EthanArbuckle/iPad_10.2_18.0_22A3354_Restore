@implementation CRLPasteboardUIPasteboard

- (CRLPasteboardUIPasteboard)initWithGeneralPasteboard
{
  return -[CRLPasteboardUIPasteboard initWithPasteboardName:create:](self, "initWithPasteboardName:create:", UIPasteboardNameGeneral, 1);
}

- (CRLPasteboardUIPasteboard)initWithPasteboardName:(id)a3 create:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  CRLPasteboardUIPasteboard *v7;
  uint64_t v8;
  UIPasteboard *pasteboard;
  NSObject *v10;
  objc_super v12;

  v4 = a4;
  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLPasteboardUIPasteboard;
  v7 = -[CRLPasteboard initWithPasteboardName:create:](&v12, "initWithPasteboardName:create:", v6, v4);
  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[UIPasteboard pasteboardWithName:create:](UIPasteboard, "pasteboardWithName:create:", v6, v4));
    pasteboard = v7->super._pasteboard;
    v7->super._pasteboard = (UIPasteboard *)v8;

    if (!v7->super._pasteboard)
    {
      if (v4)
      {
        if (qword_10147E368 != -1)
          dispatch_once(&qword_10147E368, &stru_10122DD10);
        v10 = off_1013D9068;
        if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
          sub_100DE99A8((uint64_t)v6, v10);
      }

      v7 = 0;
    }
  }

  return v7;
}

- (CRLPasteboardUIPasteboard)initWithUniquePasteboardName
{
  CRLPasteboardUIPasteboard *v2;
  uint64_t v3;
  UIPasteboard *pasteboard;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLPasteboardUIPasteboard;
  v2 = -[CRLPasteboard initWithUniquePasteboardName](&v6, "initWithUniquePasteboardName");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[UIPasteboard pasteboardWithUniqueName](UIPasteboard, "pasteboardWithUniqueName"));
    pasteboard = v2->super._pasteboard;
    v2->super._pasteboard = (UIPasteboard *)v3;

  }
  return v2;
}

- (CRLPasteboardUIPasteboard)initWithNativePasteboard:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  CRLPasteboardUIPasteboard *v9;
  CRLPasteboardUIPasteboard *v10;
  objc_super v12;

  v4 = a3;
  v6 = objc_opt_class(UIPasteboard, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    v12.receiver = self;
    v12.super_class = (Class)CRLPasteboardUIPasteboard;
    v9 = -[CRLPasteboard initWithNativePasteboard:](&v12, "initWithNativePasteboard:", v4);
    v10 = v9;
    if (v9)
      objc_storeStrong((id *)&v9->super._pasteboard, v8);
  }
  else
  {

    v10 = 0;
  }

  return v10;
}

- (void)addPasteboardItemForObject:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v9 = a4;
  v10 = a3;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));

  -[CRLPasteboardUIPasteboard addPasteboardItem:](self, "addPasteboardItem:", v8);
}

- (void)addPasteboardItem:(id)a3
{
  -[CRLPasteboardUIPasteboard addPasteboardItem:atIndex:](self, "addPasteboardItem:atIndex:", a3, self->_pasteboardItemCount);
}

- (void)addPasteboardItem:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  char v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  char v18;
  UIPasteboard *pasteboard;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];

  v6 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v9 = v7;
    v10 = 0;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v14 = objc_opt_class(NSString, v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v13));
        v16 = sub_100221D0C(v14, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

        if (v17 && !objc_msgSend(v17, "length"))
        {
          v18 = 0;
        }
        else
        {
          -[CRLPasteboardUIPasteboard addPasteboardItemIndex:forType:](self, "addPasteboardItemIndex:forType:", a4, v13);
          v18 = 1;
        }
        v10 |= v18;

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
    if ((v10 & 1) != 0)
    {
      pasteboard = self->super._pasteboard;
      v25 = v6;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
      -[UIPasteboard addItems:](pasteboard, "addItems:", v20);

      ++self->_pasteboardItemCount;
    }
  }

}

- (void)addPasteboardItemIndex:(unint64_t)a3 forType:(id)a4
{
  id v6;
  NSMutableDictionary *pasteboardItemIndexCache;
  void *v8;
  void *v9;
  id v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;

  v6 = a4;
  pasteboardItemIndexCache = self->_pasteboardItemIndexCache;
  v14 = v6;
  if (pasteboardItemIndexCache)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](pasteboardItemIndexCache, "objectForKeyedSubscript:", v6));
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "addIndex:", a3);
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSetWithIndex:](NSMutableIndexSet, "indexSetWithIndex:", a3));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pasteboardItemIndexCache, "setObject:forKeyedSubscript:", v13, v14);

    }
  }
  else
  {
    v10 = objc_alloc((Class)NSMutableDictionary);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSetWithIndex:](NSMutableIndexSet, "indexSetWithIndex:", a3));
    v11 = (NSMutableDictionary *)objc_msgSend(v10, "initWithObjectsAndKeys:", v9, v14, 0);
    v12 = self->_pasteboardItemIndexCache;
    self->_pasteboardItemIndexCache = v11;

  }
}

- (void)invalidatePasteboardCacheIfNeeded
{
  int64_t v3;
  int64_t v4;

  v3 = -[CRLPasteboard changeCount](self, "changeCount");
  if (self->_cachedChangeCount != v3)
  {
    v4 = v3;
    -[CRLPasteboardUIPasteboard invalidatePasteboardCache](self, "invalidatePasteboardCache");
    self->_cachedChangeCount = v4;
  }
}

- (void)invalidatePasteboardCache
{
  NSMutableDictionary *pasteboardItemIndexCache;
  NSArray *cachedPasteboardTypes;

  self->_pasteboardItemCount = 0;
  pasteboardItemIndexCache = self->_pasteboardItemIndexCache;
  self->_pasteboardItemIndexCache = 0;

  cachedPasteboardTypes = self->_cachedPasteboardTypes;
  self->_cachedPasteboardTypes = 0;

}

- (void)reloadPasteboardItemIndexCacheIfNeeded
{
  unint64_t *p_pasteboardItemCount;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;
  char *i;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  -[CRLPasteboardUIPasteboard invalidatePasteboardCacheIfNeeded](self, "invalidatePasteboardCacheIfNeeded");
  if (!self->_pasteboardItemIndexCache)
  {
    p_pasteboardItemCount = &self->_pasteboardItemCount;
    if (self->_pasteboardItemCount)
    {
      v4 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122DD30);
      v5 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE9A1C(&self->_pasteboardItemCount, v4, v5);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122DD50);
      v6 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE8358(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardUIPasteboard reloadPasteboardItemIndexCacheIfNeeded]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboard.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 849, 0, "Expected pasteboard item count should be zero, was %tu.", *p_pasteboardItemCount);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIPasteboard pasteboardTypesForItemSet:](self->super._pasteboard, "pasteboardTypesForItemSet:", 0));
    v10 = (char *)objc_msgSend(v9, "count");
    if (v10)
    {
      for (i = 0; i != v10; ++i)
      {
        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", i));
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v18;
          do
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(_QWORD *)v18 != v15)
                objc_enumerationMutation(v12);
              -[CRLPasteboardUIPasteboard addPasteboardItemIndex:forType:](self, "addPasteboardItemIndex:forType:", i, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)j));
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          }
          while (v14);
        }

      }
    }
    *p_pasteboardItemCount = (unint64_t)v10;
    -[CRLPasteboardUIPasteboard updateCachedChangeCount](self, "updateCachedChangeCount");

  }
}

- (void)updateCachedChangeCount
{
  self->_cachedChangeCount = -[CRLPasteboard changeCount](self, "changeCount");
}

- (id)propertyListForValue:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  v5 = objc_opt_class(NSString, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0
    || (v7 = objc_opt_class(NSURL, v6), (objc_opt_isKindOfClass(v3, v7) & 1) != 0))
  {
    v8 = v3;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v3, 0, 0, 0));
    if (v9)
      goto LABEL_5;
    v12 = objc_opt_class(NSData, v11);
    if ((objc_opt_isKindOfClass(v3, v12) & 1) == 0)
    {
      v9 = 0;
      goto LABEL_5;
    }
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", objc_msgSend(objc_retainAutorelease(v3), "bytes")));
  }
  v9 = v8;
LABEL_5:

  return v9;
}

- (id)URLs
{
  return -[UIPasteboard URLs](self->super._pasteboard, "URLs");
}

- (id)string
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = objc_opt_class(NSString, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeUTF8PlainText, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardUIPasteboard valueForPasteboardType:](self, "valueForPasteboardType:", v4));
  v6 = sub_100221D0C(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (void)setString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRLPasteboardUIPasteboard clearContents](self, "clearContents");
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeUTF8PlainText, "identifier"));
  -[CRLPasteboardUIPasteboard addPasteboardItemForObject:type:](self, "addPasteboardItemForObject:type:", v4, v5);

}

- (id)strings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  CFArrayRef (__cdecl **v11)(CTFontDescriptorRef, CFSetRef);
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char isKindOfClass;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  unsigned int v27;
  void *v28;
  CFArrayRef (__cdecl **v29)(CTFontDescriptorRef, CFSetRef);
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  objc_class *v34;
  NSString *v35;
  void *v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  objc_class *v40;
  NSString *v41;
  void *v42;
  NSObject *v43;
  char *v44;
  void *v46;
  CRLPasteboardUIPasteboard *v47;
  id obj;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  unsigned int v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  void *v63;
  _BYTE v64[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeText, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardUIPasteboard valuesForPasteboardType:inItemSet:](self, "valuesForPasteboardType:inItemSet:", v3, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v4));

  if (!objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeURL, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardUIPasteboard valuesForPasteboardType:inItemSet:](self, "valuesForPasteboardType:inItemSet:", v6, 0));
    objc_msgSend(v5, "addObjectsFromArray:", v7);

  }
  v8 = objc_msgSend(v5, "count");
  if (!v8)
  {
    v49 = 0;
    goto LABEL_29;
  }
  v49 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v8));
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v46 = v5;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
  if (!v9)
    goto LABEL_27;
  v10 = v9;
  v11 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
  v12 = *(_QWORD *)v51;
  v47 = self;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v51 != v12)
        objc_enumerationMutation(obj);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardUIPasteboard propertyListForValue:](self, "propertyListForValue:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v13)));
      v16 = objc_opt_class(v11[449], v15);
      if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0)
      {
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absoluteString"));
      }
      else
      {
        v19 = objc_opt_class(NSArray, v17);
        isKindOfClass = objc_opt_isKindOfClass(v14, v19);
        v22 = objc_opt_class(NSString, v21);
        v23 = v22;
        if ((isKindOfClass & 1) != 0)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
          v25 = sub_100221D0C(v23, v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

          if (v26)
            goto LABEL_24;
          goto LABEL_13;
        }
        v37 = sub_100221D0C(v22, v14);
        v18 = objc_claimAutoreleasedReturnValue(v37);
      }
      v26 = (void *)v18;
      if (v18)
      {
LABEL_24:
        objc_msgSend(v49, "addObject:", v26);
        goto LABEL_25;
      }
LABEL_13:
      v27 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122DD70);
      v28 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        v38 = v28;
        v40 = (objc_class *)objc_opt_class(v14, v39);
        v41 = NSStringFromClass(v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        *(_DWORD *)buf = 67110146;
        v55 = v27;
        v56 = 2082;
        v57 = "-[CRLPasteboardUIPasteboard strings]";
        v58 = 2082;
        v59 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboard.m";
        v60 = 1024;
        v61 = 938;
        v62 = 2114;
        v63 = v42;
        _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Failed to convert value from %{public}@ to NSString", buf, 0x2Cu);

      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122DD90);
      v29 = v11;
      v30 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        v43 = v30;
        v44 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        *(_DWORD *)buf = 67109378;
        v55 = v27;
        v56 = 2114;
        v57 = v44;
        _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardUIPasteboard strings]"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboard.m"));
      v34 = (objc_class *)objc_opt_class(v14, v33);
      v35 = NSStringFromClass(v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v32, 938, 0, "Failed to convert value from %{public}@ to NSString", v36);

      v11 = v29;
      self = v47;
LABEL_25:

      v13 = (char *)v13 + 1;
    }
    while (v10 != v13);
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
  }
  while (v10);
LABEL_27:

  v5 = v46;
LABEL_29:

  return v49;
}

- (id)richTextStrings
{
  UIPasteboard *pasteboard;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  UIPasteboard *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  UIPasteboard *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *j;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  NSAttributedStringDocumentAttributeKey v45;
  NSAttributedStringDocumentType v46;
  _BYTE v47[128];
  void *v48;
  NSAttributedStringDocumentAttributeKey v49;
  NSAttributedStringDocumentType v50;
  _BYTE v51[128];
  void *v52;

  pasteboard = self->super._pasteboard;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeFlatRTFD, "identifier"));
  v52 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v52, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIPasteboard itemSetWithPasteboardTypes:](pasteboard, "itemSetWithPasteboardTypes:", v5));

  v7 = objc_msgSend(v6, "count");
  v8 = self->super._pasteboard;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeFlatRTFD, "identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIPasteboard valuesForPasteboardType:inItemSet:](v8, "valuesForPasteboardType:inItemSet:", v9, v6));

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v42 != v15)
            objc_enumerationMutation(v11);
          v17 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
          v18 = objc_alloc((Class)NSAttributedString);
          v49 = NSDocumentTypeDocumentAttribute;
          v50 = NSRTFDTextDocumentType;
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1));
          v20 = objc_msgSend(v18, "initWithData:options:documentAttributes:error:", v17, v19, 0, 0);

          if (objc_msgSend(v20, "length"))
          {
            if (v14)
              objc_msgSend(v14, "addObject:", v20);
            else
              v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v20));
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      }
      while (v13);
      v21 = v11;
    }
    else
    {
      v14 = 0;
      v21 = v11;
    }
LABEL_31:

    goto LABEL_32;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeRTF, "identifier"));
  v48 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v48, 1));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIPasteboard itemSetWithPasteboardTypes:](v8, "itemSetWithPasteboardTypes:", v23));

  if (objc_msgSend(v21, "count"))
  {
    v24 = self->super._pasteboard;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeRTF, "identifier"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIPasteboard valuesForPasteboardType:inItemSet:](v24, "valuesForPasteboardType:inItemSet:", v25, v21));

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v26;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (v27)
    {
      v28 = v27;
      v14 = 0;
      v29 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v28; j = (char *)j + 1)
        {
          if (*(_QWORD *)v38 != v29)
            objc_enumerationMutation(obj);
          v31 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j);
          v32 = objc_alloc((Class)NSAttributedString);
          v45 = NSDocumentTypeDocumentAttribute;
          v46 = NSRTFTextDocumentType;
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1));
          v34 = objc_msgSend(v32, "initWithData:options:documentAttributes:error:", v31, v33, 0, 0);

          if (objc_msgSend(v34, "length"))
          {
            if (v14)
              objc_msgSend(v14, "addObject:", v34);
            else
              v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v34));
          }

        }
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      }
      while (v28);
    }
    else
    {
      v14 = 0;
    }
    v11 = obj;

    goto LABEL_31;
  }
  v14 = 0;
LABEL_32:

  return v14;
}

- (id)pasteboardTypes
{
  NSArray *cachedPasteboardTypes;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  NSArray *v16;
  NSArray *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  -[CRLPasteboardUIPasteboard invalidatePasteboardCacheIfNeeded](self, "invalidatePasteboardCacheIfNeeded");
  cachedPasteboardTypes = self->_cachedPasteboardTypes;
  if (!cachedPasteboardTypes)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](NSMutableOrderedSet, "orderedSet"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIPasteboard pasteboardTypesForItemSet:](self->super._pasteboard, "pasteboardTypesForItemSet:", 0));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v20;
            do
            {
              for (j = 0; j != v13; j = (char *)j + 1)
              {
                if (*(_QWORD *)v20 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j));
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v13);
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v7);
    }
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "array"));
    v17 = self->_cachedPasteboardTypes;
    self->_cachedPasteboardTypes = v16;

    cachedPasteboardTypes = self->_cachedPasteboardTypes;
  }
  return cachedPasteboardTypes;
}

- (id)dataForPasteboardType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  -[CRLPasteboardUIPasteboard reloadPasteboardItemIndexCacheIfNeeded](self, "reloadPasteboardItemIndexCacheIfNeeded");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pasteboardItemIndexCache, "objectForKeyedSubscript:", v4));
  v6 = v5;
  if (v5)
  {
    if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      v7 = objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", objc_msgSend(v6, "firstIndex")));

      v6 = (void *)v7;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardUIPasteboard dataForPasteboardType:inItemSet:](self, "dataForPasteboardType:inItemSet:", v4, v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

    if (v9)
    {
      v11 = objc_opt_class(NSData, v10);
      if ((objc_opt_isKindOfClass(v9, v11) & 1) == 0)
      {
        v12 = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v9, 200, 0, 0));

        v9 = (void *)v12;
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)stringForPasteboardType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[CRLPasteboardUIPasteboard reloadPasteboardItemIndexCacheIfNeeded](self, "reloadPasteboardItemIndexCacheIfNeeded");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pasteboardItemIndexCache, "objectForKeyedSubscript:", v4));
  v6 = v5;
  if (v5)
  {
    if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      v7 = objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", objc_msgSend(v6, "firstIndex")));

      v6 = (void *)v7;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardUIPasteboard stringsForPasteboardType:inItemSet:](self, "stringsForPasteboardType:inItemSet:", v4, v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)valueForPasteboardType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[CRLPasteboardUIPasteboard reloadPasteboardItemIndexCacheIfNeeded](self, "reloadPasteboardItemIndexCacheIfNeeded");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pasteboardItemIndexCache, "objectForKeyedSubscript:", v4));
  v6 = v5;
  if (!v5)
    goto LABEL_6;
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", objc_msgSend(v6, "firstIndex")));

    v6 = (void *)v7;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardUIPasteboard valuesForPasteboardType:inItemSet:](self, "valuesForPasteboardType:inItemSet:", v4, v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardUIPasteboard propertyListForValue:](self, "propertyListForValue:", v9));

  }
  else
  {
LABEL_6:
    v10 = 0;
  }

  return v10;
}

- (int64_t)numberOfItems
{
  return -[UIPasteboard numberOfItems](self->super._pasteboard, "numberOfItems");
}

- (id)pasteboardTypesForItemSet:(id)a3
{
  return -[UIPasteboard pasteboardTypesForItemSet:](self->super._pasteboard, "pasteboardTypesForItemSet:", a3);
}

- (BOOL)canLoadItemsOfClass:(Class)a3
{
  UIPasteboard *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (!-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &OBJC_PROTOCOL___NSItemProviderReading))return 0;
  v5 = self->super._pasteboard;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIPasteboard itemProviders](v5, "itemProviders", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "canLoadObjectOfClass:", a3) & 1) != 0)
        {
          v11 = 1;
          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (void)addItems:(id)a3 isSmartCopy:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  char *i;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *j;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t *v41;
  unsigned int v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  void *k;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  CRLPasteboardUIPasteboard *v56;
  id v57;
  id v58;
  unint64_t v59;
  unsigned int v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  unsigned int v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  _BOOL4 v77;
  void *v78;
  void *v79;
  id obj;
  void *context;
  uint64_t v82;
  id v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD v94[4];
  id v95;
  CRLPasteboardUIPasteboard *v96;
  uint64_t *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  unint64_t pasteboardItemCount;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _BYTE v111[128];
  uint8_t v112[128];
  uint8_t buf[4];
  _BYTE v114[24];
  __int16 v115;
  int v116;
  __int16 v117;
  id v118;

  v77 = a4;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  obj = a3;
  v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v112, 16);
  if (v83)
  {
    v82 = *(_QWORD *)v107;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v107 != v82)
        {
          v11 = v10;
          objc_enumerationMutation(obj);
          v10 = v11;
        }
        v84 = v10;
        v12 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v10);
        v13 = sub_100221DDC(v12, 1, v4, v5, v6, v7, v8, v9, (uint64_t)&OBJC_PROTOCOL___CRLPasteboardWriting);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v85 = v14;
        if (v14)
        {
          v89 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "writableTypesForPasteboard:", self->super._pasteboard));
          v16 = (char *)objc_msgSend(v89, "count");
          if (v16)
          {
            v102 = 0;
            v103 = &v102;
            v104 = 0x2020000000;
            pasteboardItemCount = self->_pasteboardItemCount;
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
            v18 = objc_autoreleasePoolPush();
            v19 = 0;
            v20 = 0;
            for (i = 0; i != v16; ++i)
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectAtIndexedSubscript:", i));
              if ((objc_msgSend(v22, "hasPrefix:", CFSTR("com.apple.freeform.CRLNativeData")) & 1) != 0
                || (objc_msgSend(v22, "hasPrefix:", CFSTR("com.apple.freeform.CRLNativeMetadata")) & 1) != 0
                || (objc_msgSend(v22, "hasPrefix:", CFSTR("com.apple.freeform.CRLAsset.")) & 1) != 0
                || objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.freeform.CRLDescription")))
              {
                objc_msgSend(v17, "addIndex:", i);
              }
              else
              {
                v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "pasteboardPropertyListForType:", v22));
                if (v86
                  || objc_msgSend(v22, "crl_isPasteboardStateType")
                  && (v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"))) != 0)
                {
                  v24 = objc_opt_class(NSData, v23);
                  if ((objc_opt_isKindOfClass(v86, v24) & 1) != 0
                    || (v26 = objc_opt_class(NSString, v25), (objc_opt_isKindOfClass(v86, v26) & 1) != 0))
                  {
                    v20 += (unint64_t)objc_msgSend(v86, "length");
                  }
                  else
                  {
                    v29 = objc_opt_class(NSArray, v27);
                    if ((objc_opt_isKindOfClass(v86, v29) & 1) != 0)
                    {
                      v100 = 0u;
                      v101 = 0u;
                      v98 = 0u;
                      v99 = 0u;
                      v30 = v86;
                      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v98, v111, 16);
                      v78 = v19;
                      v79 = v18;
                      if (v32)
                      {
                        v33 = *(_QWORD *)v99;
                        do
                        {
                          for (j = 0; j != v32; j = (char *)j + 1)
                          {
                            if (*(_QWORD *)v99 != v33)
                              objc_enumerationMutation(v30);
                            v35 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)j);
                            v36 = objc_opt_class(NSData, v31);
                            if ((objc_opt_isKindOfClass(v35, v36) & 1) == 0)
                            {
                              v38 = objc_opt_class(NSString, v37);
                              if ((objc_opt_isKindOfClass(v35, v38) & 1) == 0)
                                continue;
                            }
                            v20 += (unint64_t)objc_msgSend(v35, "length");
                          }
                          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v98, v111, 16);
                        }
                        while (v32);
                      }

                      v19 = v78;
                      v18 = v79;
                    }
                  }
                  if (v20 <= -[CRLPasteboardUIPasteboard pasteboardItemMaxSize](self, "pasteboardItemMaxSize"))
                  {
                    if (v19)
                      objc_msgSend(v19, "setObject:forKey:", v86, v22);
                    else
                      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", v86, v22));
                  }
                  else
                  {
                    if (qword_10147E368 != -1)
                      dispatch_once(&qword_10147E368, &stru_10122DDB0);
                    v28 = off_1013D9068;
                    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
                    {
                      v39 = -[CRLPasteboardUIPasteboard pasteboardItemMaxSize](self, "pasteboardItemMaxSize");
                      *(_DWORD *)buf = 134218242;
                      *(_QWORD *)v114 = v39;
                      *(_WORD *)&v114[8] = 2114;
                      *(_QWORD *)&v114[10] = v22;
                      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v28, OS_LOG_TYPE_ERROR, "The total size for public data on the pasteboard has reached the allowed limit of %zu bytes per pasteboard item. %{public}@ will not be added to the pasteboard.", buf, 0x16u);
                    }

                  }
                }
                else
                {

                }
              }

            }
            if (objc_msgSend(v19, "count"))
            {
              v40 = self->_pasteboardItemCount;
              v41 = v103;
              v103[3] = v40;
              if (v40)
              {
                v42 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_10122DDD0);
                v43 = off_1013D9070;
                if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109890;
                  *(_DWORD *)v114 = v42;
                  *(_WORD *)&v114[4] = 2082;
                  *(_QWORD *)&v114[6] = "-[CRLPasteboardUIPasteboard addItems:isSmartCopy:]";
                  *(_WORD *)&v114[14] = 2082;
                  *(_QWORD *)&v114[16] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboard.m";
                  v115 = 1024;
                  v116 = 1161;
                  _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Public data types need to belong to the first pasteboard item. Otherwise, it is not guaranteed to be retrievable by other pasteboard clients.", buf, 0x22u);
                }
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_10122DDF0);
                v44 = off_1013D9070;
                if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_ERROR))
                {
                  v73 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v114 = v42;
                  *(_WORD *)&v114[4] = 2114;
                  *(_QWORD *)&v114[6] = v73;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v44, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

                }
                v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardUIPasteboard addItems:isSmartCopy:]"));
                v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboard.m"));
                +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v45, v46, 1161, 0, "Public data types need to belong to the first pasteboard item. Otherwise, it is not guaranteed to be retrievable by other pasteboard clients.");

                v41 = v103;
                v47 = v103[3];
              }
              else
              {
                v47 = 0;
              }
              v41[3] = v47 + 1;
              -[CRLPasteboardUIPasteboard addPasteboardItem:atIndex:](self, "addPasteboardItem:atIndex:", v19);
            }

            objc_autoreleasePoolPop(v18);
            if (objc_msgSend(v17, "count"))
            {
              v94[0] = _NSConcreteStackBlock;
              v94[1] = 3221225472;
              v94[2] = sub_10002F484;
              v94[3] = &unk_10122DE18;
              v72 = v85;
              v97 = &v102;
              v95 = v72;
              v96 = self;
              objc_msgSend(v89, "enumerateObjectsAtIndexes:options:usingBlock:", v17, 0, v94);

            }
            _Block_object_dispose(&v102, 8);
          }
        }
        else
        {
          v48 = objc_opt_class(NSDictionary, v15);
          v49 = sub_100221D0C(v48, v12);
          v89 = (id)objc_claimAutoreleasedReturnValue(v49);
          if (v89)
          {
            context = objc_autoreleasePoolPush();
            v92 = 0u;
            v93 = 0u;
            v90 = 0u;
            v91 = 0u;
            v89 = v89;
            v50 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
            if (v50)
            {
              v87 = *(_QWORD *)v91;
              do
              {
                for (k = 0; k != v50; k = (char *)k + 1)
                {
                  if (*(_QWORD *)v91 != v87)
                    objc_enumerationMutation(v89);
                  v52 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)k);
                  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "objectForKeyedSubscript:", v52));
                  v55 = objc_opt_class(NSData, v54);
                  if ((objc_opt_isKindOfClass(v53, v55) & 1) != 0)
                  {
                    v56 = self;
                    v57 = v53;
                    v58 = v52;
                    if (self)
                      v59 = -[CRLPasteboardUIPasteboard pasteboardItemMaxSize](v56, "pasteboardItemMaxSize");
                    else
                      v59 = 18874368;
                    if ((unint64_t)objc_msgSend(v57, "length") > v59)
                    {
                      v60 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                      if (qword_10147E370 != -1)
                        dispatch_once(&qword_10147E370, &stru_10122DEB8);
                      v61 = off_1013D9070;
                      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 67110146;
                        *(_DWORD *)v114 = v60;
                        *(_WORD *)&v114[4] = 2082;
                        *(_QWORD *)&v114[6] = "void CRLPasteboardAssertNSData(CRLPasteboard *__strong, NSData *__strong, "
                                              "NSString *__strong)";
                        *(_WORD *)&v114[14] = 2082;
                        *(_QWORD *)&v114[16] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboard_Internal.h";
                        v115 = 1024;
                        v116 = 13;
                        v117 = 2114;
                        v118 = v58;
                        _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Data for %{public}@ is too large for the pasteboard. It may be silently dropped.", buf, 0x2Cu);
                      }
                      if (qword_10147E370 != -1)
                        dispatch_once(&qword_10147E370, &stru_10122DED8);
                      v62 = off_1013D9070;
                      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                      {
                        v65 = v62;
                        v66 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                        *(_DWORD *)buf = 67109378;
                        *(_DWORD *)v114 = v60;
                        *(_WORD *)&v114[4] = 2114;
                        *(_QWORD *)&v114[6] = v66;
                        _os_log_error_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

                      }
                      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void CRLPasteboardAssertNSData(CRLPasteboard *__strong, NSData *__strong, NSString *__strong)"));
                      v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboard_Internal.h"));
                      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v63, v64, 13, 0, "Data for %{public}@ is too large for the pasteboard. It may be silently dropped.", v58);

                    }
                  }
                  -[CRLPasteboardUIPasteboard addPasteboardItemForObject:type:](self, "addPasteboardItemForObject:type:", v53, v52);

                }
                v50 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
              }
              while (v50);
            }

            objc_autoreleasePoolPop(context);
          }
          else
          {
            v67 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10122DE38);
            v68 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)v114 = v67;
              *(_WORD *)&v114[4] = 2082;
              *(_QWORD *)&v114[6] = "-[CRLPasteboardUIPasteboard addItems:isSmartCopy:]";
              *(_WORD *)&v114[14] = 2082;
              *(_QWORD *)&v114[16] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboard.m";
              v115 = 1024;
              v116 = 1198;
              _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Expected item to conform to CRLPasteboardWriting protocol, or be an instance of NSDictionary", buf, 0x22u);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10122DE58);
            v69 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v74 = v69;
              v75 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v114 = v67;
              *(_WORD *)&v114[4] = 2114;
              *(_QWORD *)&v114[6] = v75;
              _os_log_error_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardUIPasteboard addItems:isSmartCopy:]"));
            v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboard.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v70, v71, 1198, 0, "Expected item to conform to CRLPasteboardWriting protocol, or be an instance of NSDictionary");

          }
        }

        v10 = v84 + 1;
      }
      while ((id)(v84 + 1) != v83);
      v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v112, 16);
    }
    while (v83);
  }

  if (v77)
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("NeXT smart paste pasteboard type"), "dataUsingEncoding:", 4));
    -[CRLPasteboardUIPasteboard addPasteboardItemForObject:type:](self, "addPasteboardItemForObject:type:", v76, CFSTR("NeXT smart paste pasteboard type"));

  }
}

- (id)dataForPasteboardType:(id)a3 inItemSet:(id)a4
{
  return -[UIPasteboard dataForPasteboardType:inItemSet:](self->super._pasteboard, "dataForPasteboardType:inItemSet:", a3, a4);
}

- (id)stringsForPasteboardType:(id)a3 inItemSet:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  CFArrayRef (__cdecl **v10)(CTFontDescriptorRef, CFSetRef);
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  char isKindOfClass;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  unsigned int v24;
  void *v25;
  CFArrayRef (__cdecl **v26)(CTFontDescriptorRef, CFSetRef);
  void *v27;
  void *v28;
  uint64_t v29;
  objc_class *v30;
  NSString *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  objc_class *v35;
  NSString *v36;
  void *v37;
  NSObject *v38;
  char *v39;
  void *v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  unsigned int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardUIPasteboard valuesForPasteboardType:inItemSet:](self, "valuesForPasteboardType:inItemSet:", a3, a4));
  v6 = objc_msgSend(v5, "count");
  if (!v6)
  {
    v43 = 0;
    goto LABEL_31;
  }
  v43 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v6));
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v41 = v5;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
  if (!v8)
    goto LABEL_29;
  v9 = v8;
  v10 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
  v11 = *(_QWORD *)v45;
  v42 = v7;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v45 != v11)
        objc_enumerationMutation(v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardUIPasteboard propertyListForValue:](self, "propertyListForValue:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v12)));
      if (v14)
      {
        v15 = objc_opt_class(v10[449], v13);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        {
          v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path"));
          if (!v17)
            goto LABEL_17;
LABEL_16:
          objc_msgSend(v43, "addObject:", v17);
        }
        else
        {
          v18 = objc_opt_class(NSArray, v16);
          isKindOfClass = objc_opt_isKindOfClass(v14, v18);
          v21 = objc_opt_class(NSString, v20);
          if ((isKindOfClass & 1) == 0)
          {
            if ((objc_opt_isKindOfClass(v14, v21) & 1) == 0)
              goto LABEL_17;
            v17 = v14;
            goto LABEL_16;
          }
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
          v23 = sub_100221D0C(v21, v22);
          v17 = (id)objc_claimAutoreleasedReturnValue(v23);

          if (v17)
            goto LABEL_16;
LABEL_17:
          v24 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10122DE78);
          v25 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v33 = v25;
            v35 = (objc_class *)objc_opt_class(v14, v34);
            v36 = NSStringFromClass(v35);
            v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
            *(_DWORD *)buf = 67110146;
            v49 = v24;
            v50 = 2082;
            v51 = "-[CRLPasteboardUIPasteboard stringsForPasteboardType:inItemSet:]";
            v52 = 2082;
            v53 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboard.m";
            v54 = 1024;
            v55 = 1248;
            v56 = 2114;
            v57 = v37;
            _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Failed to convert value from %{public}@ to NSString", buf, 0x2Cu);

          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10122DE98);
          v26 = v10;
          v27 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v38 = v27;
            v39 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v49 = v24;
            v50 = 2114;
            v51 = v39;
            _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v17 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardUIPasteboard stringsForPasteboardType:inItemSet:]"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboard.m"));
          v30 = (objc_class *)objc_opt_class(v14, v29);
          v31 = NSStringFromClass(v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v28, 1248, 0, "Failed to convert value from %{public}@ to NSString", v32);

          v10 = v26;
          v7 = v42;
        }

      }
      v12 = (char *)v12 + 1;
    }
    while (v9 != v12);
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
  }
  while (v9);
LABEL_29:

  v5 = v41;
LABEL_31:

  return v43;
}

- (id)valuesForPasteboardType:(id)a3 inItemSet:(id)a4
{
  return -[UIPasteboard valuesForPasteboardType:inItemSet:](self->super._pasteboard, "valuesForPasteboardType:inItemSet:", a3, a4);
}

- (int64_t)clearContents
{
  int64_t v3;

  -[CRLPasteboardUIPasteboard invalidatePasteboardCache](self, "invalidatePasteboardCache");
  v3 = -[CRLPasteboard changeCount](self, "changeCount");
  -[UIPasteboard setItems:](self->super._pasteboard, "setItems:", &__NSArray0__struct);
  -[CRLPasteboardUIPasteboard updateCachedChangeCount](self, "updateCachedChangeCount");
  return v3;
}

- (unint64_t)pasteboardItemMaxSize
{
  void *v3;
  unsigned int v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboard name](self, "name"));
  v4 = objc_msgSend(v3, "isEqualToString:", UIPasteboardNameGeneral);

  if (!v4)
    return 0x1000000;
  v6.receiver = self;
  v6.super_class = (Class)CRLPasteboardUIPasteboard;
  return -[CRLPasteboard pasteboardItemMaxSize](&v6, "pasteboardItemMaxSize");
}

- (void)invalidate
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLPasteboard name](self, "name"));
  +[UIPasteboard removePasteboardWithName:](UIPasteboard, "removePasteboardWithName:", v2);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pasteboardItemIndexCache, 0);
  objc_storeStrong((id *)&self->_cachedPasteboardTypes, 0);
}

@end
