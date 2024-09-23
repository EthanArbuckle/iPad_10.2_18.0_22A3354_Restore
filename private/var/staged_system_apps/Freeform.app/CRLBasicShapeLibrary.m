@implementation CRLBasicShapeLibrary

+ (id)sharedLibrary
{
  if (qword_101414E50 != -1)
    dispatch_once(&qword_101414E50, &stru_1012387A0);
  return (id)qword_101414E48;
}

- (CRLBasicShapeLibrary)initWithLocale:(id)a3
{
  id v5;
  CRLBasicShapeLibrary *v6;
  CRLBasicShapeLibrary *v7;
  CRLShapeSearchIndex *v8;
  CRLShapeSearchIndex *searchIndex;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLBasicShapeLibrary;
  v6 = -[CRLBasicShapeLibrary init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    *(_WORD *)&v6->_showConnectionLinesInLibrary = 257;
    objc_storeStrong((id *)&v6->_locale, a3);
    v8 = -[CRLShapeSearchIndex initWithLocale:]([CRLShapeSearchIndex alloc], "initWithLocale:", v5);
    searchIndex = v7->_searchIndex;
    v7->_searchIndex = v8;

    -[CRLBasicShapeLibrary p_updateSearchIndex:](v7, "p_updateSearchIndex:", v7->_searchIndex);
  }

  return v7;
}

- (NSString)name
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Basic"), 0, 0));

  return (NSString *)v3;
}

- (unint64_t)numberOfBasicShapes
{
  if (!self->_showLinesInLibrary)
    return 12;
  if (self->_showConnectionLinesInLibrary)
    return 15;
  return 14;
}

- (id)basicShapeAtIndex:(unint64_t)a3
{
  return -[CRLBasicShapeLibraryShape initWithShapeType:position:]([CRLBasicShapeLibraryShape alloc], "initWithShapeType:position:", -[CRLBasicShapeLibrary p_shapeTypeAtIndex:](self, "p_shapeTypeAtIndex:"), a3);
}

- (id)resultsForSearchTerm:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBasicShapeLibrary p_searchIndex](self, "p_searchIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resultsForSearchTerm:", v4));

  return v6;
}

- (id)shapeFromSearchResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBasicShapeLibrary basicShapeAtIndex:](self, "basicShapeAtIndex:", objc_msgSend(v5, "unsignedIntegerValue")));

  if (!v6)
  {
    v7 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012387C0);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFAFEC((uint64_t)v4, v7, v8);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012387E0);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBasicShapeLibrary shapeFromSearchResult:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBasicShapeLibrary.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 83, 0, "Basic shape from result is nil: %@", v4);

  }
  return v6;
}

- (id)p_baseName
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:localization:", CFSTR("Basic"), 0, 0, CFSTR("en")));

  v4 = v3;
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101238800);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFB098();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101238820);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBasicShapeLibrary p_baseName]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBasicShapeLibrary.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 95, 0, "invalid nil value for '%{public}s'", "englishString");

    v4 = CFSTR("Basic");
  }
  v8 = v4;

  return v8;
}

- (int64_t)p_shapeTypeAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  if (a3 >= 0x15)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101238840);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFB138();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101238860);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBasicShapeLibrary p_shapeTypeAtIndex:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBasicShapeLibrary.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 101, 0, "Index for shape type is %lu, but must be less than kCRLShapeTypeCustom (%ld)", a3, 21);

  }
  v8 = a3;
  if (a3 <= 2)
    v8 = qword_100EEC920[a3];
  if (!self->_showLinesInLibrary)
    return a3 + 3;
  if (!self->_showConnectionLinesInLibrary && a3 > 1)
    return a3 + 1;
  else
    return v8;
}

- (void)setShowConnectionLinesInLibrary:(BOOL)a3
{
  CRLShapeSearchIndex *v4;
  CRLShapeSearchIndex *searchIndex;

  self->_showConnectionLinesInLibrary = a3;
  v4 = -[CRLShapeSearchIndex initWithLocale:]([CRLShapeSearchIndex alloc], "initWithLocale:", self->_locale);
  searchIndex = self->_searchIndex;
  self->_searchIndex = v4;

  -[CRLBasicShapeLibrary p_updateSearchIndex:](self, "p_updateSearchIndex:", self->_searchIndex);
}

- (BOOL)showConnectionLinesInLibrary
{
  return self->_showConnectionLinesInLibrary;
}

- (void)setShowLinesInLibrary:(BOOL)a3
{
  CRLShapeSearchIndex *v4;
  CRLShapeSearchIndex *searchIndex;

  self->_showLinesInLibrary = a3;
  v4 = -[CRLShapeSearchIndex initWithLocale:]([CRLShapeSearchIndex alloc], "initWithLocale:", self->_locale);
  searchIndex = self->_searchIndex;
  self->_searchIndex = v4;

  -[CRLBasicShapeLibrary p_updateSearchIndex:](self, "p_updateSearchIndex:", self->_searchIndex);
}

- (BOOL)showLinesInLibrary
{
  return self->_showLinesInLibrary;
}

- (void)p_updateSearchIndex:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  uint64_t v29;
  void *v30;
  unsigned int v31;
  unint64_t v32;
  CRLBasicShapeLibrary *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];

  v4 = a3;
  v5 = -[CRLBasicShapeLibrary numberOfBasicShapes](self, "numberOfBasicShapes");
  v33 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBasicShapeLibrary locale](self, "locale"));
  v31 = +[CRLShapeLibraryHelper shouldAddBaseShapeNameAndKeywordsForLocale:](CRLShapeLibraryHelper, "shouldAddBaseShapeNameAndKeywordsForLocale:", v6);

  v32 = v5;
  if (v5)
  {
    v7 = 0;
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBasicShapeLibrary basicShapeAtIndex:](v33, "basicShapeAtIndex:", v7));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
      objc_msgSend(v4, "addSearchResultWithIdentifier:forKeyword:priority:", v9, v10, 3);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBasicShapeLibrary name](v33, "name"));
      objc_msgSend(v4, "addSearchResultWithIdentifier:forKeyword:priority:", v11, v12, 2);

      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keywords"));
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v39 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
            objc_msgSend(v4, "addSearchResultWithIdentifier:forKeyword:priority:", v19, v18, 2);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        }
        while (v15);
      }

      if (v31)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "baseName"));
        objc_msgSend(v4, "addSearchResultWithIdentifier:forKeyword:priority:", v20, v21, 1);

        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBasicShapeLibrary p_baseName](v33, "p_baseName"));
        objc_msgSend(v4, "addSearchResultWithIdentifier:forKeyword:priority:", v22, v23, 0);

        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "baseKeywords"));
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v35;
          do
          {
            for (j = 0; j != v26; j = (char *)j + 1)
            {
              if (*(_QWORD *)v35 != v27)
                objc_enumerationMutation(v24);
              v29 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)j);
              v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
              objc_msgSend(v4, "addSearchResultWithIdentifier:forKeyword:priority:", v30, v29, 0);

            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          }
          while (v26);
        }

      }
      ++v7;
    }
    while (v7 != v32);
  }

}

- (CRLLocale)locale
{
  return self->_locale;
}

- (CRLShapeSearchIndex)p_searchIndex
{
  return self->_searchIndex;
}

- (void)setP_searchIndex:(id)a3
{
  objc_storeStrong((id *)&self->_searchIndex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchIndex, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
