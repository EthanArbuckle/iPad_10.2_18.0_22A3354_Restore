@implementation CRLBasicShapeLibraryCollection

- (CRLBasicShapeLibraryCollection)initWithBasicShapeLibrary:(id)a3
{
  id v5;
  CRLBasicShapeLibraryCollection *v6;
  CRLBasicShapeLibraryCollection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLBasicShapeLibraryCollection;
  v6 = -[CRLBasicShapeLibraryCollection init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_basicShapeLibrary, a3);

  return v7;
}

- (NSString)name
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBasicShapeLibraryCollection p_basicShapeLibrary](self, "p_basicShapeLibrary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "name"));

  return (NSString *)v3;
}

- (unint64_t)numberOfShapes
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBasicShapeLibraryCollection p_basicShapeLibrary](self, "p_basicShapeLibrary"));
  v3 = objc_msgSend(v2, "numberOfBasicShapes");

  return (unint64_t)v3;
}

- (id)shapeAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBasicShapeLibraryCollection p_basicShapeLibrary](self, "p_basicShapeLibrary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "basicShapeAtIndex:", a3));

  return v5;
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
    dispatch_once(&qword_10147E370, &stru_1012405E8);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E05B4C(v3, v4);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101240608);
  v5 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE81F0(v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBasicShapeLibraryCollection shapeWithIdentifier:]"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBasicShapeLibraryCollection.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 50, 0, "-[CRLBasicShapeLibraryCollection shapeWithIdentifier:] should not be called because CRLBasicShapeLibraryCollection has no editable shapes");

  return 0;
}

- (void)setShowConnectionLinesInLibrary:(BOOL)a3
{
  -[CRLBasicShapeLibrary setShowConnectionLinesInLibrary:](self->_basicShapeLibrary, "setShowConnectionLinesInLibrary:", a3);
}

- (BOOL)showConnectionLinesInLibrary
{
  return -[CRLBasicShapeLibrary showConnectionLinesInLibrary](self->_basicShapeLibrary, "showConnectionLinesInLibrary");
}

- (void)setShowLinesInLibrary:(BOOL)a3
{
  -[CRLBasicShapeLibrary setShowLinesInLibrary:](self->_basicShapeLibrary, "setShowLinesInLibrary:", a3);
}

- (BOOL)showLinesInLibrary
{
  return -[CRLBasicShapeLibrary showLinesInLibrary](self->_basicShapeLibrary, "showLinesInLibrary");
}

- (CRLBasicShapeLibrary)p_basicShapeLibrary
{
  return self->_basicShapeLibrary;
}

- (void)setP_basicShapeLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_basicShapeLibrary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basicShapeLibrary, 0);
}

@end
