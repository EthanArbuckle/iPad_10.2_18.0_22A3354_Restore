@implementation CRLFreehandDrawingTransformInfo

- (CRLFreehandDrawingTransformInfo)initWithParentInfo:(id)a3
{
  id v4;
  CRLFreehandDrawingTransformInfo *v5;
  CRLFreehandDrawingTransformInfo *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLFreehandDrawingTransformInfo;
  v5 = -[CRLFreehandDrawingTransformInfo init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_parentInfo, v4);

  return v6;
}

- (NSSet)representedShapeInfos
{
  return self->_representedShapeInfos;
}

- (void)setRepresentedShapeInfos:(id)a3 currentlyLaidOutOnLayoutController:(id)a4
{
  id v7;
  id v8;
  CRLCanvasInfoGeometry *v9;
  CRLCanvasInfoGeometry *geometry;
  id v11;

  objc_storeStrong((id *)&self->_representedShapeInfos, a3);
  v7 = a3;
  v8 = a4;
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
  v9 = (CRLCanvasInfoGeometry *)objc_claimAutoreleasedReturnValue(+[CRLGroupItem groupGeometryFromChildrenInfos:currentlyLaidOutWithLayoutController:](_TtC8Freeform12CRLGroupItem, "groupGeometryFromChildrenInfos:currentlyLaidOutWithLayoutController:", v11, v8));

  geometry = self->_geometry;
  self->_geometry = v9;

}

- (CRLCanvasElementInfo)parentInfo
{
  return (CRLCanvasElementInfo *)objc_loadWeakRetained((id *)&self->_parentInfo);
}

- (void)setParentInfo:(id)a3
{
  objc_storeWeak((id *)&self->_parentInfo, a3);
}

- (void)clearBackPointerToParentInfoIfNeeded:(id)a3
{
  CRLCanvasElementInfo **p_parentInfo;
  id v4;
  id WeakRetained;

  p_parentInfo = &self->_parentInfo;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_parentInfo);

  if (WeakRetained == v4)
    objc_storeWeak((id *)p_parentInfo, 0);
}

- (BOOL)isSelectable
{
  return 0;
}

- (BOOL)isSupported
{
  return 1;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(CRLFreehandDrawingTransformLayout, a2);
}

- (Class)repClass
{
  return (Class)objc_opt_class(CRLFreehandDrawingTransformRep, a2);
}

- (Class)editorClass
{
  int v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123F2C8);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E03EC4(v2, v3);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123F2E8);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE81F0(v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTransformInfo editorClass]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTransformInfo.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 74, 0, "We don't expect this to be called");

  return 0;
}

- (CRLCanvasInfoGeometry)geometry
{
  return self->_geometry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_representedShapeInfos, 0);
  objc_destroyWeak((id *)&self->_parentInfo);
}

@end
