@implementation CRLShapeSearchResultsCollection

- (CRLShapeSearchResultsCollection)initWithShapeLibrary:(id)a3 basicShapeLibrary:(id)a4 searchTerm:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  CRLShapeSearchResultsCollection *v18;
  CRLShapeSearchResultsCollection *v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "locale"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "locale"));
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if ((v14 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257290);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E29C30();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012572B0);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchResultsCollection initWithShapeLibrary:basicShapeLibrary:searchTerm:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchResultsCollection.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 58, 0, "The shape library and basic shape library must be in the same locale.");

  }
  v18 = -[CRLShapeSearchResultsCollection initWithBasicShapeLibrary:searchTerm:](self, "initWithBasicShapeLibrary:searchTerm:", v10, v11);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_shapeLibrary, a3);
    -[CRLShapeSearchResultsCollection setSearchTerm:completionHandler:](v19, "setSearchTerm:completionHandler:", v11, 0);
  }

  return v19;
}

- (CRLShapeSearchResultsCollection)initWithBasicShapeLibrary:(id)a3 searchTerm:(id)a4
{
  id v7;
  id v8;
  CRLShapeSearchResultsCollection *v9;
  NSString *v10;
  NSString *searchTerm;
  uint64_t v12;
  CRLLocale *locale;
  uint64_t v14;
  NSMapTable *shapeToDisplayNameMap;
  uint64_t v16;
  CRLShapeCollectionShape *allShapes;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CRLShapeSearchResultsCollection;
  v9 = -[CRLShapeSearchResultsCollection init](&v19, "init");
  if (v9)
  {
    v10 = (NSString *)objc_msgSend(v8, "copy");
    searchTerm = v9->_searchTerm;
    v9->_searchTerm = v10;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "locale"));
    locale = v9->_locale;
    v9->_locale = (CRLLocale *)v12;

    objc_storeStrong((id *)&v9->_basicShapeLibrary, a3);
    v14 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    shapeToDisplayNameMap = v9->_shapeToDisplayNameMap;
    v9->_shapeToDisplayNameMap = (NSMapTable *)v14;

    v16 = objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    allShapes = v9->_allShapes;
    v9->_allShapes = (CRLShapeCollectionShape *)v16;

    -[CRLShapeSearchResultsCollection setSearchTerm:completionHandler:](v9, "setSearchTerm:completionHandler:", v8, 0);
  }

  return v9;
}

- (void)setSearchTerm:(id)a3 completionHandler:(id)a4
{
  -[CRLShapeSearchResultsCollection setSearchTerm:forceUpdate:completionHandler:](self, "setSearchTerm:forceUpdate:completionHandler:", a3, 0, a4);
}

- (void)setSearchTerm:(id)a3 forceUpdate:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  void (**v8)(id, _BOOL8);
  uint64_t v9;
  unsigned int v10;
  _BOOL8 v11;
  NSString *v12;
  NSString *searchTerm;
  unint64_t v14;

  v6 = a4;
  v14 = (unint64_t)a3;
  v8 = (void (**)(id, _BOOL8))a5;
  v9 = objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResultsCollection searchTerm](self, "searchTerm"));
  if (v14 | v9)
    v10 = objc_msgSend((id)v14, "isEqual:", v9);
  else
    v10 = 1;

  if (!v10 || v6)
  {
    v11 = -[CRLShapeSearchResultsCollection p_updateSearchResultsForSearchTerm:](self, "p_updateSearchResultsForSearchTerm:", v14);
    v12 = (NSString *)objc_msgSend((id)v14, "copy");
    searchTerm = self->_searchTerm;
    self->_searchTerm = v12;

    if (v8)
      goto LABEL_9;
  }
  else if (v8)
  {
    v11 = 0;
LABEL_9:
    v8[2](v8, v11);
  }

}

- (void)resetSearchResults
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResultsCollection searchTerm](self, "searchTerm"));
  -[CRLShapeSearchResultsCollection p_updateSearchResultsForSearchTerm:](self, "p_updateSearchResultsForSearchTerm:", v3);

}

- (BOOL)hasExactMatches
{
  return -[CRLShapeSearchResultsCollection exactMatchCount](self, "exactMatchCount") != 0;
}

- (unint64_t)exactMatchCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResultsCollection p_exactMatches](self, "p_exactMatches"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (unint64_t)numberOfSections
{
  return 1;
}

- (unint64_t)numberOfShapesInSection:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v8;
  void *v9;
  void *v10;

  if (-[CRLShapeSearchResultsCollection numberOfSections](self, "numberOfSections") <= a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012572D0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E29CB0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012572F0);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchResultsCollection numberOfShapesInSection:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchResultsCollection.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 118, 0, "Tried to retrieve the number of shapes in a section (%lu) beyond the size of the number of sections in the search results", a3);

    return 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResultsCollection p_allShapes](self, "p_allShapes"));
    v6 = objc_msgSend(v5, "count");

    return (unint64_t)v6;
  }
}

- (id)shapeAtIndexPath:(id)a3
{
  id v4;
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  unsigned int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  id v29;

  v4 = a3;
  v5 = objc_msgSend(v4, "indexAtPosition:", 0);
  v6 = objc_msgSend(v4, "indexAtPosition:", 1);

  v7 = -[CRLShapeSearchResultsCollection numberOfShapesInSection:](self, "numberOfShapesInSection:", v5);
  if (v5 >= (id)-[CRLShapeSearchResultsCollection numberOfSections](self, "numberOfSections")
    || (unint64_t)v6 >= v7)
  {
    if (v7)
    {
      v10 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101257310);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67110658;
        v17 = v10;
        v18 = 2082;
        v19 = "-[CRLShapeSearchResultsCollection shapeAtIndexPath:]";
        v20 = 2082;
        v21 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchResultsCollection.m";
        v22 = 1024;
        v23 = 132;
        v24 = 2048;
        v25 = v6;
        v26 = 2048;
        v27 = v7;
        v28 = 2048;
        v29 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Tried to retrieve a shape at an index (%lu) beyond the size of the number of shapes in the search results: %lu, in section: %lu", buf, 0x40u);
      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101257330);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchResultsCollection shapeAtIndexPath:]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchResultsCollection.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 132, 0, "Tried to retrieve a shape at an index (%lu) beyond the size of the number of shapes in the search results: %lu, in section: %lu", v6, v7, v5);

    }
    v9 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResultsCollection p_allShapes](self, "p_allShapes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v6));

  }
  return v9;
}

- (id)indexPathOfShape:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResultsCollection p_allShapes](self, "p_allShapes"));
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v8[0] = 0;
  v8[1] = v6;
  return (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndexes:length:](NSIndexPath, "indexPathWithIndexes:length:", v8, 2));
}

- (id)displayNameForShape:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResultsCollection p_shapeToDisplayNameMap](self, "p_shapeToDisplayNameMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (NSString)name
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Search"), 0, 0));

  return (NSString *)v3;
}

- (unint64_t)numberOfShapes
{
  void *v3;
  char *v4;
  void *v5;
  char *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResultsCollection p_exactMatches](self, "p_exactMatches"));
  v4 = (char *)objc_msgSend(v3, "count");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResultsCollection p_partialMatches](self, "p_partialMatches"));
  v6 = &v4[(_QWORD)objc_msgSend(v5, "count")];

  return (unint64_t)v6;
}

- (id)shapeAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v13;
  uint8_t buf[4];
  unsigned int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  unint64_t v25;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResultsCollection p_allShapes](self, "p_allShapes"));
  if ((unint64_t)objc_msgSend(v5, "count") <= a3)
  {
    if (-[CRLShapeSearchResultsCollection numberOfShapes](self, "numberOfShapes"))
    {
      v7 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101257350);
      v8 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        v13 = v8;
        *(_DWORD *)buf = 67110402;
        v15 = v7;
        v16 = 2082;
        v17 = "-[CRLShapeSearchResultsCollection shapeAtIndex:]";
        v18 = 2082;
        v19 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchResultsCollection.m";
        v20 = 1024;
        v21 = 168;
        v22 = 2048;
        v23 = a3;
        v24 = 2048;
        v25 = -[CRLShapeSearchResultsCollection numberOfShapes](self, "numberOfShapes");
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Tried to retrieve a shape at an index (%lu) beyond the size of the number of shapes in the search results: %lu", buf, 0x36u);

      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101257370);
      v9 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchResultsCollection shapeAtIndex:]"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchResultsCollection.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 168, 0, "Tried to retrieve a shape at an index (%lu) beyond the size of the number of shapes in the search results: %lu", a3, -[CRLShapeSearchResultsCollection numberOfShapes](self, "numberOfShapes"));

    }
    v6 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a3));
  }

  return v6;
}

- (id)shapeWithIdentifier:(id)a3
{
  return 0;
}

- (BOOL)p_updateSearchResultsForSearchTerm:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  CRLShapeCollectionShape *v52;
  CRLShapeCollectionShape *allShapes;
  void *v54;
  void *v55;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t obj;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResultsCollection p_basicShapeLibrary](self, "p_basicShapeLibrary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "resultsForSearchTerm:", v4));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResultsCollection p_basicShapeLibrary](self, "p_basicShapeLibrary"));
  v59 = v4;
  obj = v5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResultsCollection p_separateExactAndPartialMatchesFromResults:searchTerm:withProvider:shapeToDisplayNameDict:](self, "p_separateExactAndPartialMatchesFromResults:searchTerm:withProvider:shapeToDisplayNameDict:", v11, v4, v12, v5));

  if (objc_msgSend(v13, "count") != (id)4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257390);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E29E54();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012573B0);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchResultsCollection p_updateSearchResultsForSearchTerm:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchResultsCollection.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 191, 0, "separatedBasicResults must only contain 4 elements.");

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v17));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 1));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v19));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 2));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v21));

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 3));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v23));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResultsCollection p_shapeLibrary](self, "p_shapeLibrary"));
  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResultsCollection p_shapeLibrary](self, "p_shapeLibrary"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "resultsForSearchTerm:", v59));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResultsCollection p_shapeLibrary](self, "p_shapeLibrary"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResultsCollection p_separateExactAndPartialMatchesFromResults:searchTerm:withProvider:shapeToDisplayNameDict:](self, "p_separateExactAndPartialMatchesFromResults:searchTerm:withProvider:shapeToDisplayNameDict:", v27, v59, v28, obj));

    if (objc_msgSend(v29, "count") != (id)4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012573D0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E29DD4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012573F0);
      v30 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchResultsCollection p_updateSearchResultsForSearchTerm:]"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchResultsCollection.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v32, 199, 0, "separatedShapeLibraryResults must only contain 4 elements.");

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", 0));
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "arrayByAddingObjectsFromArray:", v33));

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", 1));
    v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "arrayByAddingObjectsFromArray:", v35));

    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", 2));
    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "arrayByAddingObjectsFromArray:", v37));

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", 3));
    v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v39));

    v24 = (void *)v40;
    v22 = (void *)v38;
    v20 = (void *)v36;
    v18 = (void *)v34;
  }
  v58 = v18;
  v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "arrayByAddingObjectsFromArray:", v20));
  v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "arrayByAddingObjectsFromArray:", v24));
  v43 = objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResultsCollection p_exactMatches](self, "p_exactMatches"));
  if (v41 | v43 && !objc_msgSend((id)v41, "isEqual:", v43))
  {
    HIDWORD(v57) = 1;
  }
  else
  {
    v44 = objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResultsCollection p_partialMatches](self, "p_partialMatches"));
    if (v42 | v44 && !objc_msgSend((id)v42, "isEqual:", v44))
    {
      HIDWORD(v57) = 1;
    }
    else
    {
      v45 = objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResultsCollection p_shapeToDisplayNameMap](self, "p_shapeToDisplayNameMap"));
      if (obj | v45)
        HIDWORD(v57) = objc_msgSend((id)obj, "isEqual:", v45) ^ 1;
      else
        HIDWORD(v57) = 0;

    }
  }

  objc_storeStrong((id *)&self->_shapeToDisplayNameMap, (id)obj);
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResultsCollection p_comparatorForSortingMatches](self, "p_comparatorForSortingMatches"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v41, "sortedArrayUsingComparator:", v46));

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResultsCollection p_comparatorForSortingMatches](self, "p_comparatorForSortingMatches"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v42, "sortedArrayUsingComparator:", v48));

  objc_storeStrong((id *)&self->_exactMatches, v47);
  objc_storeStrong((id *)&self->_partialMatches, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "arrayByAddingObjectsFromArray:", v49));
  v51 = v50;
  if (v50)
  {
    v52 = v50;
    allShapes = self->_allShapes;
    self->_allShapes = v52;
  }
  else
  {
    LODWORD(v57) = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257410);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E29D54();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257430);
    v54 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v54);
    allShapes = (CRLShapeCollectionShape *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchResultsCollection p_updateSearchResultsForSearchTerm:]", v57));
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchResultsCollection.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", allShapes, v55, 228, 0, "allShapes cannot be nil.");

  }
  return BYTE4(v57);
}

- (id)p_separateExactAndPartialMatchesFromResults:(id)a3 searchTerm:(id)a4 withProvider:(id)a5 shapeToDisplayNameDict:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  _BYTE v33[128];

  v8 = a3;
  v9 = a5;
  v10 = a6;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shapeFromSearchResult:", v17));
        if (v18)
        {
          if (objc_msgSend(v17, "priority") && objc_msgSend(v17, "priority") != (id)1)
            v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "matchingKeyword"));
          else
            v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
          v20 = (void *)v19;
          objc_msgSend(v10, "setObject:forKey:", v19, v18);

          LODWORD(v20) = objc_msgSend(v17, "isExactMatch");
          v21 = objc_msgSend(v17, "priority");
          if ((_DWORD)v20)
          {
            v22 = v27;
            if (v21 != (id)3)
            {
              if (objc_msgSend(v17, "priority") == (id)1)
                v22 = v27;
              else
                v22 = v26;
            }
          }
          else
          {
            v22 = v11;
            if (v21 != (id)3)
            {
              if (objc_msgSend(v17, "priority") == (id)1)
                v22 = v11;
              else
                v22 = v25;
            }
          }
          objc_msgSend(v22, "addObject:", v18);
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v14);
  }

  v32[0] = v27;
  v32[1] = v26;
  v32[2] = v11;
  v32[3] = v25;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 4));

  return v23;
}

- (id)p_shapesByMappingSearchResults:(id)a3 withProvider:(id)a4 shapeToDisplayNameDict:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  CRLShapeSearchResultsCollection *v14;
  id v15;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100396024;
  v12[3] = &unk_101257458;
  v13 = a4;
  v14 = self;
  v15 = a5;
  v8 = v15;
  v9 = v13;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "crl_arrayByMappingObjectsUsingBlock:", v12));

  return v10;
}

- (id)p_comparatorForSortingMatches
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100396224;
  v3[3] = &unk_101257480;
  v3[4] = self;
  return objc_retainBlock(v3);
}

- (int64_t)p_sequentialShapePosition:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *i;
  void *v17;
  id v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  void *v24;
  unsigned int v25;
  BOOL v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v32;
  id v33;
  id obj;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  char *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];

  v4 = a3;
  objc_opt_class(CRLShapeLibraryShape, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResultsCollection p_shapeLibrary](self, "p_shapeLibrary"));

    if (!v9)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      v10 = v8;
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012574A0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E29ED4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012574C0);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchResultsCollection p_sequentialShapePosition:]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchResultsCollection.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 316, 0, "invalid nil value for '%{public}s'", "self.p_shapeLibrary");

      v8 = v10;
    }
    v33 = v4;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResultsCollection p_shapeLibrary](self, "p_shapeLibrary"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "categories"));

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v32 = v8;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "categoryIDs"));
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v37)
    {
      v38 = 0;
      v35 = *(_QWORD *)v46;
      v15 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (i = 0; i != v37; i = (char *)i + 1)
        {
          if (*(_QWORD *)v46 != v35)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v18 = v36;
          v19 = (char *)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          if (v19)
          {
            v20 = v19;
            v39 = i;
            v21 = 0;
            v22 = *(_QWORD *)v42;
            do
            {
              v23 = 0;
              v40 = &v20[(_QWORD)v21];
              do
              {
                if (*(_QWORD *)v42 != v22)
                  objc_enumerationMutation(v18);
                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1)
                                                                                   + 8 * (_QWORD)v23), "categoryID"));
                v25 = objc_msgSend(v17, "isEqual:", v24);

                if (v25)
                  v26 = &v23[(_QWORD)v21] >= (char *)v15;
                else
                  v26 = 1;
                if (!v26)
                {
                  v27 = v17;

                  v15 = (unint64_t)&v23[(_QWORD)v21];
                  v38 = v27;
                  goto LABEL_29;
                }
                ++v23;
              }
              while (v20 != v23);
              v20 = (char *)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
              v21 = v40;
            }
            while (v20);
LABEL_29:
            i = v39;
          }

        }
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v37);
    }
    else
    {
      v38 = 0;
      v15 = 0x7FFFFFFFFFFFFFFFLL;
    }

    v29 = (v15 << 16) + 0x10000;
    v8 = v32;
    v4 = v33;
    v28 = v38;
  }
  else
  {
    v28 = 0;
    v29 = 0;
  }
  v30 = objc_msgSend(v4, "positionInCategoryWithID:", v28);

  return (int64_t)v30 + v29;
}

- (int64_t)p_comparePositionOfShape:(id)a3 withOtherShape:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  uint64_t v24;
  id v25;
  unint64_t v26;
  int64_t v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v6 = a3;
  v7 = a4;
  objc_opt_class(v6, v8);
  v10 = v9;
  *(_QWORD *)&v13 = objc_opt_class(v7, v11).n128_u64[0];
  if (v10 != v14)
    goto LABEL_17;
  *(_QWORD *)&v15 = objc_opt_class(CRLShapeLibraryShape, v12).n128_u64[0];
  if (v10 == v16)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "categoryIDs", 0));
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    v18 = 0x7FFFFFFFFFFFFFFFLL;
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          v25 = objc_msgSend(v7, "positionInCategoryWithID:", v24);
          if (v25 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v26 = (unint64_t)v25;
            v17 = (unint64_t)objc_msgSend(v6, "positionInCategoryWithID:", v24);
            v18 = v26;
            goto LABEL_15;
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v21)
          continue;
        break;
      }
      v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:

  }
  else
  {
    v17 = (unint64_t)objc_msgSend(v6, "positionInCategoryWithID:", 0, v15);
    v18 = (unint64_t)objc_msgSend(v7, "positionInCategoryWithID:", 0);
  }
  if (v17 == v18)
  {
LABEL_17:
    v17 = -[CRLShapeSearchResultsCollection p_sequentialShapePosition:](self, "p_sequentialShapePosition:", v6, v13);
    v18 = -[CRLShapeSearchResultsCollection p_sequentialShapePosition:](self, "p_sequentialShapePosition:", v7);
  }
  if (v17 >= v18)
  {
    if (v17 > v18)
    {
      v27 = 1;
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012574E0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E29F78();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101257500);
      v28 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeSearchResultsCollection p_comparePositionOfShape:withOtherShape:]"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeSearchResultsCollection.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, v30, 376, 0, "Comparison of shape position must return either ascending or descending.");

      v27 = 0;
    }
  }
  else
  {
    v27 = -1;
  }

  return v27;
}

- (BOOL)p_hasPartialMatches
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeSearchResultsCollection p_partialMatches](self, "p_partialMatches"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void)setSearchTerm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CRLBasicShapeLibrary)p_basicShapeLibrary
{
  return self->_basicShapeLibrary;
}

- (void)setP_basicShapeLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_basicShapeLibrary, a3);
}

- (CRLShapeLibrary)p_shapeLibrary
{
  return self->_shapeLibrary;
}

- (void)setP_shapeLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_shapeLibrary, a3);
}

- (CRLShapeCollectionShape)p_exactMatches
{
  return self->_exactMatches;
}

- (void)setP_exactMatches:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CRLShapeCollectionShape)p_partialMatches
{
  return self->_partialMatches;
}

- (void)setP_partialMatches:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (CRLShapeCollectionShape)p_allShapes
{
  return self->_allShapes;
}

- (void)setP_allShapes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (CRLLocale)p_locale
{
  return self->_locale;
}

- (void)setP_locale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (NSMapTable)p_shapeToDisplayNameMap
{
  return self->_shapeToDisplayNameMap;
}

- (void)setP_shapeToDisplayNameMap:(id)a3
{
  objc_storeStrong((id *)&self->_shapeToDisplayNameMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeToDisplayNameMap, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_allShapes, 0);
  objc_storeStrong((id *)&self->_partialMatches, 0);
  objc_storeStrong((id *)&self->_exactMatches, 0);
  objc_storeStrong((id *)&self->_shapeLibrary, 0);
  objc_storeStrong((id *)&self->_basicShapeLibrary, 0);
  objc_storeStrong((id *)&self->_searchTerm, 0);
}

@end
