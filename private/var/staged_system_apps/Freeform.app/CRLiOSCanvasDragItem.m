@implementation CRLiOSCanvasDragItem

- (CRLiOSCanvasDragItem)initWithItemProvider:(id)a3 previewGeneratingBlock:(id)a4
{
  id v7;
  id v8;
  CRLiOSCanvasDragItem *v9;
  CRLiOSCanvasDragItem *v10;
  id v11;
  id previewGeneratingBlock;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRLiOSCanvasDragItem;
  v9 = -[CRLiOSCanvasDragItem init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemProvider, a3);
    v11 = objc_msgSend(v8, "copy");
    previewGeneratingBlock = v10->_previewGeneratingBlock;
    v10->_previewGeneratingBlock = v11;

  }
  return v10;
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (id)previewGeneratingBlock
{
  return self->_previewGeneratingBlock;
}

- (id)sourceObject
{
  return objc_loadWeakRetained(&self->sourceObject);
}

- (void)setSourceObject:(id)a3
{
  objc_storeWeak(&self->sourceObject, a3);
}

- (BOOL)allowsMoveOperation
{
  return self->allowsMoveOperation;
}

- (void)setAllowsMoveOperation:(BOOL)a3
{
  self->allowsMoveOperation = a3;
}

- (BOOL)prefersFullSizePreviews
{
  return self->prefersFullSizePreviews;
}

- (void)setPrefersFullSizePreviews:(BOOL)a3
{
  self->prefersFullSizePreviews = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->sourceObject);
  objc_storeStrong(&self->_previewGeneratingBlock, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
}

@end
