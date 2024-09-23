@implementation CRLShapeLibraryCollection

- (CRLShapeLibraryCollection)initWithShapeLibrary:(id)a3 categoryIndex:(unint64_t)a4
{
  id v7;
  CRLShapeLibraryCollection *v8;
  void *v9;
  id v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v18;
  void *v19;
  id v20;
  objc_super v21;
  uint8_t buf[4];
  unsigned int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  id v33;

  v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRLShapeLibraryCollection;
  v8 = -[CRLShapeLibraryCollection init](&v21, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "categories"));
    v10 = objc_msgSend(v9, "count");

    if ((unint64_t)v10 <= a4)
    {
      v11 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101237790);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        v18 = v12;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "categories"));
        v20 = objc_msgSend(v19, "count");
        *(_DWORD *)buf = 67110402;
        v23 = v11;
        v24 = 2082;
        v25 = "-[CRLShapeLibraryCollection initWithShapeLibrary:categoryIndex:]";
        v26 = 2082;
        v27 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibraryCollection.m";
        v28 = 1024;
        v29 = 33;
        v30 = 2048;
        v31 = a4;
        v32 = 2048;
        v33 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Tried to initialize CRLShapeLibraryCollection with a category index (%lu) beyond the bounds of the shape library's categories (%lu).", buf, 0x36u);

      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012377B0);
      v13 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibraryCollection initWithShapeLibrary:categoryIndex:]"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibraryCollection.m"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "categories"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 33, 0, "Tried to initialize CRLShapeLibraryCollection with a category index (%lu) beyond the bounds of the shape library's categories (%lu).", a4, objc_msgSend(v16, "count"));

    }
    v8->_categoryIndex = a4;
    objc_storeStrong((id *)&v8->_shapeLibrary, a3);
  }

  return v8;
}

- (NSString)name
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibraryCollection p_category](self, "p_category"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "name"));

  return (NSString *)v3;
}

- (unint64_t)numberOfShapes
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibraryCollection p_category](self, "p_category"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "shapeIDs"));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

- (id)shapeAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v16;
  uint8_t buf[4];
  unsigned int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;

  if (-[CRLShapeLibraryCollection numberOfShapes](self, "numberOfShapes") <= a3)
  {
    if (-[CRLShapeLibraryCollection numberOfShapes](self, "numberOfShapes"))
    {
      v10 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012377D0);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        v16 = v11;
        *(_DWORD *)buf = 67110402;
        v18 = v10;
        v19 = 2082;
        v20 = "-[CRLShapeLibraryCollection shapeAtIndex:]";
        v21 = 2082;
        v22 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibraryCollection.m";
        v23 = 1024;
        v24 = 56;
        v25 = 2048;
        v26 = a3;
        v27 = 2048;
        v28 = -[CRLShapeLibraryCollection p_categoryIndex](self, "p_categoryIndex");
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Tried to retrieve a shape at an index (%lu) beyond the size of the number of shapes in this category: %lu", buf, 0x36u);

      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012377F0);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibraryCollection shapeAtIndex:]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibraryCollection.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 56, 0, "Tried to retrieve a shape at an index (%lu) beyond the size of the number of shapes in this category: %lu", a3, -[CRLShapeLibraryCollection p_categoryIndex](self, "p_categoryIndex"));

    }
    v9 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibraryCollection p_category](self, "p_category"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shapeIDs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a3));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibraryCollection p_shapeLibrary](self, "p_shapeLibrary"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shapeWithID:", v7));

  }
  return v9;
}

- (id)shapeWithIdentifier:(id)a3
{
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101237810);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DFA108(v3, v4);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101237830);
  v5 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE87A4(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibraryCollection shapeWithIdentifier:]"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibraryCollection.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 62, 0, "-[CRLShapeLibraryCollection shapeWithIdentifier:] should not be called because CRLShapeLibraryCollection has no editable shapes");

  return 0;
}

- (id)p_category
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLibraryCollection p_shapeLibrary](self, "p_shapeLibrary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "categories"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", -[CRLShapeLibraryCollection p_categoryIndex](self, "p_categoryIndex")));

  return v5;
}

- (unint64_t)p_categoryIndex
{
  return self->_categoryIndex;
}

- (void)setP_categoryIndex:(unint64_t)a3
{
  self->_categoryIndex = a3;
}

- (CRLShapeLibrary)p_shapeLibrary
{
  return self->_shapeLibrary;
}

- (void)setP_shapeLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_shapeLibrary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeLibrary, 0);
}

@end
