@implementation CRLiOSFreehandDrawingItemsSearchTarget

- (CRLiOSFreehandDrawingItemsSearchTarget)initWithDrawing:(id)a3 interactiveCanvasController:(id)a4
{
  id v6;
  id v7;
  CRLiOSFreehandDrawingItemsSearchTarget *v8;
  PKDrawing *v9;
  PKDrawing *drawingCopy;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLiOSFreehandDrawingItemsSearchTarget;
  v8 = -[CRLiOSFreehandDrawingItemsSearchTarget init](&v12, "init");
  if (v8)
  {
    v9 = (PKDrawing *)objc_msgSend(v6, "copy");
    drawingCopy = v8->_drawingCopy;
    v8->_drawingCopy = v9;

    objc_storeWeak((id *)&v8->_icc, v7);
  }

  return v8;
}

- (void)layoutSearchForString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  dispatch_queue_global_t global_queue;
  NSObject *v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  unint64_t v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v10)
  {
    global_queue = dispatch_get_global_queue(33, 0);
    v15 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003C80B8;
    block[3] = &unk_101259288;
    block[4] = self;
    v20 = a4;
    v17 = v10;
    v18 = v11;
    v19 = v13;
    dispatch_async(v15, block);

  }
  else if (v12)
  {
    (*((void (**)(id))v12 + 2))(v12);
  }

}

- (NSArray)childSearchTargets
{
  return (NSArray *)&__NSArray0__struct;
}

- (PKDrawing)drawingCopy
{
  return self->_drawingCopy;
}

- (void)setDrawingCopy:(id)a3
{
  objc_storeStrong((id *)&self->_drawingCopy, a3);
}

- (CRLInteractiveCanvasController)icc
{
  return (CRLInteractiveCanvasController *)objc_loadWeakRetained((id *)&self->_icc);
}

- (void)setIcc:(id)a3
{
  objc_storeWeak((id *)&self->_icc, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_icc);
  objc_storeStrong((id *)&self->_drawingCopy, 0);
}

@end
