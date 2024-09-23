@implementation CRLShapeCollectionDataSource

- (CRLShapeCollectionDataSource)initWithShapeLibrary:(id)a3 basicShapeLibrary:(id)a4
{
  id v7;
  CRLShapeCollectionDataSource *v8;
  CRLShapeCollectionDataSource *v9;

  v7 = a3;
  v8 = -[CRLShapeCollectionDataSource initWithBasicShapeLibrary:](self, "initWithBasicShapeLibrary:", a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_shapeLibrary, a3);

  return v9;
}

- (CRLShapeCollectionDataSource)initWithBasicShapeLibrary:(id)a3
{
  id v4;
  CRLShapeCollectionDataSource *v5;
  CRLBasicShapeLibraryCollection *v6;
  CRLBasicShapeLibraryCollection *basicShapeLibraryCollection;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLShapeCollectionDataSource;
  v5 = -[CRLShapeCollectionDataSource init](&v9, "init");
  if (v5)
  {
    v6 = -[CRLBasicShapeLibraryCollection initWithBasicShapeLibrary:]([CRLBasicShapeLibraryCollection alloc], "initWithBasicShapeLibrary:", v4);
    basicShapeLibraryCollection = v5->_basicShapeLibraryCollection;
    v5->_basicShapeLibraryCollection = v6;

  }
  return v5;
}

- (NSArray)categoryNames
{
  unint64_t v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;

  v3 = -[CRLShapeCollectionDataSource p_numberOfCategories](self, "p_numberOfCategories");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v3));
  if (v3)
  {
    for (i = 0; i != v3; ++i)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeCollectionDataSource p_shapeCollectionAtIndex:](self, "p_shapeCollectionAtIndex:", i));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));

      objc_msgSend(v4, "addObject:", v7);
    }
  }
  return (NSArray *)v4;
}

- (BOOL)hasUserDefinedShapesInCategoryAtIndex:(unint64_t)a3
{
  _BOOL4 v5;

  v5 = -[CRLShapeCollectionDataSource p_hasUserDefinedShapes](self, "p_hasUserDefinedShapes");
  if (v5)
    LOBYTE(v5) = -[CRLShapeCollectionDataSource indexOfUserDefinedLibraryCategory](self, "indexOfUserDefinedLibraryCategory") == a3;
  return v5;
}

- (unint64_t)numberOfShapesInCategoryAtIndex:(unint64_t)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeCollectionDataSource p_shapeCollectionAtIndex:](self, "p_shapeCollectionAtIndex:", a3));
  v4 = objc_msgSend(v3, "numberOfShapes");

  return (unint64_t)v4;
}

- (id)shapeAtIndex:(unint64_t)a3 categoryIndex:(unint64_t)a4
{
  return -[CRLShapeCollectionDataSource p_shapeAtIndex:categoryIndex:](self, "p_shapeAtIndex:categoryIndex:", a3, a4);
}

- (id)shapeWithIdentifier:(id)a3 categoryIndex:(unint64_t)a4
{
  return -[CRLShapeCollectionDataSource p_shapeWithIdentifier:categoryIndex:](self, "p_shapeWithIdentifier:categoryIndex:", a3, a4);
}

- (void)setShowConnectionLinesInLibrary:(BOOL)a3
{
  -[CRLBasicShapeLibraryCollection setShowConnectionLinesInLibrary:](self->_basicShapeLibraryCollection, "setShowConnectionLinesInLibrary:", a3);
}

- (BOOL)showConnectionLinesInLibrary
{
  return -[CRLBasicShapeLibraryCollection showConnectionLinesInLibrary](self->_basicShapeLibraryCollection, "showConnectionLinesInLibrary");
}

- (void)setShowLinesInLibrary:(BOOL)a3
{
  -[CRLBasicShapeLibraryCollection setShowLinesInLibrary:](self->_basicShapeLibraryCollection, "setShowLinesInLibrary:", a3);
}

- (BOOL)showLinesInLibrary
{
  return -[CRLBasicShapeLibraryCollection showLinesInLibrary](self->_basicShapeLibraryCollection, "showLinesInLibrary");
}

+ (unint64_t)p_firstIndexOfShapeLibraryCategories
{
  return 1;
}

- (unint64_t)p_numberOfNonUserDefinedCategories
{
  void *v2;
  void *v3;
  char *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeCollectionDataSource p_shapeLibrary](self, "p_shapeLibrary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "categories"));
  v4 = (char *)objc_msgSend(v3, "count") + 1;

  return (unint64_t)v4;
}

- (unint64_t)p_numberOfCategories
{
  unint64_t v3;
  void *v4;

  v3 = -[CRLShapeCollectionDataSource p_hasUserDefinedShapes](self, "p_hasUserDefinedShapes");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeCollectionDataSource p_shapeLibrary](self, "p_shapeLibrary"));
  if (v4)
    v3 += -[CRLShapeCollectionDataSource p_numberOfNonUserDefinedCategories](self, "p_numberOfNonUserDefinedCategories");

  return v3;
}

- (id)p_shapeCollectionAtIndex:(unint64_t)a3
{
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  CRLShapeLibraryCollection *v9;
  unint64_t v10;
  CRLShapeLibraryCollection *v11;
  void *v12;

  if (a3)
  {
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101250F10);
      v5 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1F870(v4, v5);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101250F30);
      v6 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE81F0(v6, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeCollectionDataSource p_shapeCollectionAtIndex:]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeCollectionDataSource.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 122, 0, "Attempting to find a shape collection at an invalid index (NSNotFound).");

      goto LABEL_15;
    }
    if (!self->_shapeLibrary)
    {
LABEL_15:
      v9 = 0;
      return v9;
    }
    v10 = a3
        - +[CRLShapeCollectionDataSource p_firstIndexOfShapeLibraryCategories](CRLShapeCollectionDataSource, "p_firstIndexOfShapeLibraryCategories");
    v11 = [CRLShapeLibraryCollection alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeCollectionDataSource p_shapeLibrary](self, "p_shapeLibrary"));
    v9 = -[CRLShapeLibraryCollection initWithShapeLibrary:categoryIndex:](v11, "initWithShapeLibrary:categoryIndex:", v12, v10);

  }
  else
  {
    v9 = (CRLShapeLibraryCollection *)objc_claimAutoreleasedReturnValue(-[CRLShapeCollectionDataSource p_basicShapeLibraryCollection](self, "p_basicShapeLibraryCollection"));
  }
  return v9;
}

- (id)p_shapeAtIndex:(unint64_t)a3 categoryIndex:(unint64_t)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeCollectionDataSource p_shapeCollectionAtIndex:](self, "p_shapeCollectionAtIndex:", a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shapeAtIndex:", a3));

  return v6;
}

- (id)p_shapeWithIdentifier:(id)a3 categoryIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeCollectionDataSource p_shapeCollectionAtIndex:](self, "p_shapeCollectionAtIndex:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "shapeWithIdentifier:", v6));

  return v8;
}

- (BOOL)p_hasUserDefinedShapes
{
  return 0;
}

- (CRLBasicShapeLibraryCollection)p_basicShapeLibraryCollection
{
  return self->_basicShapeLibraryCollection;
}

- (void)setP_basicShapeLibraryCollection:(id)a3
{
  objc_storeStrong((id *)&self->_basicShapeLibraryCollection, a3);
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
  objc_storeStrong((id *)&self->_basicShapeLibraryCollection, 0);
}

@end
