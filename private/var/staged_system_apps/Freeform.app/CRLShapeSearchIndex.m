@implementation CRLShapeSearchIndex

- (CRLShapeSearchIndex)initWithLocale:(id)a3
{
  id v5;
  CRLShapeSearchIndex *v6;
  uint64_t v7;
  NSDictionary *searchIndex;
  uint64_t v9;
  NSCharacterSet *whitespaceCharacterSet;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLShapeSearchIndex;
  v6 = -[CRLShapeSearchIndex init](&v12, "init");
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
    searchIndex = v6->_searchIndex;
    v6->_searchIndex = (NSDictionary *)v7;

    objc_storeStrong((id *)&v6->_locale, a3);
    v9 = objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
    whitespaceCharacterSet = v6->_whitespaceCharacterSet;
    v6->_whitespaceCharacterSet = (NSCharacterSet *)v9;

  }
  return v6;
}

- (id)resultsForSearchTerm:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchIndex p_whitespaceCharacterSet](self, "p_whitespaceCharacterSet"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crl_stringWithNormalizedHyphensAndQuotationMarks"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchIndex p_locale](self, "p_locale"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "locale"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByFoldingWithOptions:locale:", 128, v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchIndex p_resultsForSearchTermBasedOnAnchoredSearch:shouldPerformDiacriticInsensitiveSearch:](self, "p_resultsForSearchTermBasedOnAnchoredSearch:shouldPerformDiacriticInsensitiveSearch:", v8, objc_msgSend(v8, "isEqualToString:", v11)));
  }
  else
  {
    v12 = &__NSArray0__struct;
  }
  return v12;
}

- (void)addSearchResultWithIdentifier:(id)a3 forKeyword:(id)a4 priority:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[3];
  _QWORD v23[3];
  void *v24;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
    {
      v23[0] = v8;
      v22[0] = CFSTR("CRLShapeSearchIndexIdentifierKey");
      v22[1] = CFSTR("CRLShapeSearchIndexKeywords");
      v21 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
      v23[1] = v11;
      v22[2] = CFSTR("CRLShapeSearchIndexPriorities");
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
      v20 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
      v23[2] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 3));
      v24 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
      -[CRLShapeSearchIndex addSearchResults:](self, "addSearchResults:", v15);

LABEL_22:
      goto LABEL_23;
    }
LABEL_13:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237B10);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFA364();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101237B30);
    v19 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8358(v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchIndex addSearchResultWithIdentifier:forKeyword:priority:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchIndex.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 116, 0, "Invalid parameter not satisfying: %{public}s", "keyword != nil");
    goto LABEL_22;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101237AD0);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DFA400();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101237AF0);
  v16 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE8358(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchIndex addSearchResultWithIdentifier:forKeyword:priority:]"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchIndex.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 115, 0, "Invalid parameter not satisfying: %{public}s", "identifier != nil");

  if (!v10)
    goto LABEL_13;
LABEL_23:

}

- (void)addSearchResults:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  CFArrayRef (__cdecl **v8)(CTFontDescriptorRef, CFSetRef);
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  unsigned int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  unsigned int v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  NSObject *v40;
  char *v41;
  NSObject *v42;
  char *v43;
  NSObject *v44;
  char *v45;
  id obj;
  uint64_t v47;
  id v48;
  _QWORD v49[5];
  id v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  unsigned int v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  int v64;
  __int16 v65;
  const char *v66;
  _BYTE v67[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchIndex p_searchIndex](self, "p_searchIndex"));
  v48 = objc_msgSend(v5, "mutableCopy");

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
  if (v6)
  {
    v7 = v6;
    v47 = *(_QWORD *)v54;
    v8 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v54 != v47)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CRLShapeSearchIndexIdentifierKey")));
        if (!v12)
        {
          v13 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101237B50);
          v14 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            v58 = v13;
            v59 = 2082;
            v60 = "-[CRLShapeSearchIndex addSearchResults:]";
            v61 = 2082;
            v62 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchIndex.m";
            v63 = 1024;
            v64 = 134;
            v65 = 2082;
            v66 = "identifier != nil";
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Invalid parameter not satisfying: %{public}s", buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101237B70);
          v15 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v40 = v15;
            v41 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v58 = v13;
            v59 = 2114;
            v60 = v41;
            _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchIndex addSearchResults:]"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchIndex.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 134, 0, "Invalid parameter not satisfying: %{public}s", "identifier != nil");

        }
        v18 = (objc_class *)objc_opt_class(v8[372], v11);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CRLShapeSearchIndexKeywords")));
        v20 = sub_1002223BC(v18, v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

        if (!v21)
        {
          v23 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101237B90);
          v24 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            v58 = v23;
            v59 = 2082;
            v60 = "-[CRLShapeSearchIndex addSearchResults:]";
            v61 = 2082;
            v62 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchIndex.m";
            v63 = 1024;
            v64 = 136;
            v65 = 2082;
            v66 = "keywords != nil";
            _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Invalid parameter not satisfying: %{public}s", buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101237BB0);
          v25 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v42 = v25;
            v43 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v58 = v23;
            v59 = 2114;
            v60 = v43;
            _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchIndex addSearchResults:]"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchIndex.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 136, 0, "Invalid parameter not satisfying: %{public}s", "keywords != nil");

          v8 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
        }
        v28 = objc_opt_class(v8[372], v22);
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CRLShapeSearchIndexPriorities")));
        v30 = sub_100221D0C(v28, v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

        if (v31)
        {
          v32 = objc_msgSend(v31, "count");
          if (v32 != objc_msgSend(v21, "count"))
          {
            v33 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101237BD0);
            v34 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              v58 = v33;
              v59 = 2082;
              v60 = "-[CRLShapeSearchIndex addSearchResults:]";
              v61 = 2082;
              v62 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchIndex.m";
              v63 = 1024;
              v64 = 138;
              v65 = 2082;
              v66 = "priorities == nil || priorities.count == keywords.count";
              _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Invalid parameter not satisfying: %{public}s", buf, 0x2Cu);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101237BF0);
            v35 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v44 = v35;
              v45 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v58 = v33;
              v59 = 2114;
              v60 = v45;
              _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchIndex addSearchResults:]"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchIndex.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v36, v37, 138, 0, "Invalid parameter not satisfying: %{public}s", "priorities == nil || priorities.count == keywords.count");

          }
        }
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_1000FA4E0;
        v49[3] = &unk_101237C40;
        v49[4] = self;
        v50 = v48;
        v51 = v31;
        v52 = v12;
        v38 = v12;
        v39 = v31;
        objc_msgSend(v21, "enumerateObjectsUsingBlock:", v49);

        v9 = (char *)v9 + 1;
        v8 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
    }
    while (v7);
  }

  -[CRLShapeSearchIndex setP_searchIndex:](self, "setP_searchIndex:", v48);
}

- (void)removeSearchResultWithIdentifier:(id)a3 forKeyword:(id)a4
{
  id v5;
  _QWORD v6[4];
  CRLShapeSearchIndex *v7;
  id v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000FA794;
  v6[3] = &unk_101237C68;
  v7 = self;
  v8 = a3;
  v5 = v8;
  -[CRLShapeSearchIndex p_tokenizeKeywordIfNeeded:yieldingKeyword:](v7, "p_tokenizeKeywordIfNeeded:yieldingKeyword:", a4, v6);

}

- (id)p_keywords
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchIndex p_searchIndex](self, "p_searchIndex"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allKeys"));

  return v3;
}

- (id)p_resultsForKeyword:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchIndex p_searchIndex](self, "p_searchIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  v7 = objc_msgSend(v6, "copy");
  return v7;
}

- (void)p_tokenizeKeywordIfNeeded:(id)a3 yieldingKeyword:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *k;
  void *v31;
  void *v32;
  void *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (qword_101414DF8 != -1)
    dispatch_once(&qword_101414DF8, &stru_101237C88);
  v8 = objc_alloc_init((Class)NSMutableArray);
  v9 = objc_msgSend(v6, "length");
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1000FABFC;
  v47[3] = &unk_101237CB0;
  v10 = v8;
  v48 = v10;
  objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 3, v47);
  v32 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchIndex p_permuteStrings:](self, "p_permuteStrings:", v10));
  v12 = objc_msgSend(v11, "mutableCopy");

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchIndex p_whitespaceCharacterSet](self, "p_whitespaceCharacterSet"));
  v33 = v6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v13));

  obj = v14;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
        if ((unint64_t)objc_msgSend(v19, "length") >= 2)
        {
          objc_msgSend(v12, "addObject:", v19);
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "componentsSeparatedByCharactersInSet:", qword_101414E00));
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v40;
            do
            {
              for (j = 0; j != v22; j = (char *)j + 1)
              {
                if (*(_QWORD *)v40 != v23)
                  objc_enumerationMutation(v20);
                v25 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)j);
                if ((unint64_t)objc_msgSend(v25, "length") >= 2)
                  objc_msgSend(v12, "addObject:", v25);
              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
            }
            while (v22);
          }

        }
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v16);
  }

  objc_msgSend(v12, "addObject:", v33);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v26 = v12;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v28; k = (char *)k + 1)
      {
        if (*(_QWORD *)v36 != v29)
          objc_enumerationMutation(v26);
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)k), "crl_stringWithNormalizedHyphensAndQuotationMarks"));
        v7[2](v7, v31);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
    }
    while (v28);
  }

}

- (id)p_permuteStrings:(id)a3
{
  id v3;
  id v4;
  unint64_t v5;
  void *v6;
  id v7;
  unint64_t v8;
  void *v9;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v3, "count"));
  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v5));
      v7 = objc_msgSend(v6, "mutableCopy");

      v8 = ++v5;
      if (v5 < (unint64_t)objc_msgSend(v3, "count"))
      {
        do
        {
          objc_msgSend(v7, "appendString:", CFSTR(" "));
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", v8));
          objc_msgSend(v7, "appendString:", v9);

          ++v8;
        }
        while (v8 < (unint64_t)objc_msgSend(v3, "count"));
      }
      objc_msgSend(v4, "addObject:", v7);

    }
    while (v5 < (unint64_t)objc_msgSend(v3, "count"));
  }

  return v4;
}

- (void)p_removeSearchResultWithIdentifier:(id)a3 forTokenizedKeyword:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t, _BYTE *);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchIndex p_searchIndex](self, "p_searchIndex"));
  v9 = objc_msgSend(v8, "mutableCopy");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchIndex p_resultsForKeyword:](self, "p_resultsForKeyword:", v7));
  v11 = objc_msgSend(v10, "mutableCopy");

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0x7FFFFFFFFFFFFFFFLL;
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_1000FAE9C;
  v16 = &unk_101237CD8;
  v12 = v6;
  v17 = v12;
  v18 = &v19;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v13);
  if (v20[3] != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v11, "removeObjectAtIndex:", v13, v14, v15, v16);
  if (objc_msgSend(v11, "count", v13, v14, v15, v16))
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v7);
  else
    objc_msgSend(v9, "removeObjectForKey:", v7);
  -[CRLShapeSearchIndex setP_searchIndex:](self, "setP_searchIndex:", v9);

  _Block_object_dispose(&v19, 8);
}

- (id)p_resultsForSearchTermBasedOnAnchoredSearch:(id)a3 shouldPerformDiacriticInsensitiveSearch:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchIndex p_predicateWithSearchTerm:shouldPerformDiacriticInsensitiveSearch:](self, "p_predicateWithSearchTerm:shouldPerformDiacriticInsensitiveSearch:", v6, v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchIndex p_sortedFilteredKeywordsForSearchTerm:usingPredicate:](self, "p_sortedFilteredKeywordsForSearchTerm:usingPredicate:", v6, v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchIndex p_resultsDictionaryForSearchTerm:withFilteredKeywords:shouldPerformDiacriticInsensitiveSearch:](self, "p_resultsDictionaryForSearchTerm:withFilteredKeywords:shouldPerformDiacriticInsensitiveSearch:", v6, v8, v4));
  v10 = objc_alloc_init((Class)NSMutableArray);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sortedArrayUsingSelector:", "compare:"));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v17), (_QWORD)v20));
        objc_msgSend(v10, "addObject:", v18);

        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  return v10;
}

- (_NSRange)p_rangeOfSearchTerm:(id)a3 inString:(id)a4 shouldPerformDiacriticInsensitiveSearch:(BOOL)a5
{
  id v5;
  NSUInteger v6;
  _NSRange result;

  if (a5)
    v5 = _objc_msgSend(a4, "localizedStandardRangeOfString:", a3);
  else
    v5 = objc_msgSend(a4, "rangeOfString:options:", a3, 9);
  result.length = v6;
  result.location = (NSUInteger)v5;
  return result;
}

- (id)p_predicateWithSearchTerm:(id)a3 shouldPerformDiacriticInsensitiveSearch:(BOOL)a4
{
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000FB174;
  v8[3] = &unk_101237D00;
  v8[4] = self;
  v9 = a3;
  v10 = a4;
  v5 = v9;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v8));

  return v6;
}

- (id)p_sortedFilteredKeywordsForSearchTerm:(id)a3 usingPredicate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchIndex p_keywords](self, "p_keywords"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingComparator:", &stru_101237D40));
  return v8;
}

- (id)p_resultsDictionaryForSearchTerm:(id)a3 withFilteredKeywords:(id)a4 shouldPerformDiacriticInsensitiveSearch:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id obj;
  _QWORD v18[4];
  id v19;
  CRLShapeSearchIndex *v20;
  id v21;
  BOOL v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(obj);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchIndex p_resultsForKeyword:](self, "p_resultsForKeyword:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v14)));
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1000FB3C8;
        v18[3] = &unk_101237D68;
        v19 = v10;
        v20 = self;
        v21 = v8;
        v22 = a5;
        objc_msgSend(v15, "enumerateObjectsUsingBlock:", v18);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

  return v10;
}

- (CRLLocale)p_locale
{
  return self->_locale;
}

- (void)setP_locale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (NSDictionary)p_searchIndex
{
  return self->_searchIndex;
}

- (void)setP_searchIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSCharacterSet)p_whitespaceCharacterSet
{
  return self->_whitespaceCharacterSet;
}

- (void)setP_whitespaceCharacterSet:(id)a3
{
  objc_storeStrong((id *)&self->_whitespaceCharacterSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whitespaceCharacterSet, 0);
  objc_storeStrong((id *)&self->_searchIndex, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
