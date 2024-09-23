@implementation CRLRealTimeSyncDecorator

+ (BOOL)shouldShowForICC:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "editingCoordinator"));
  if ((objc_msgSend(v3, "isInRealTimeSyncSession") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "realTimeSessionNeedsAccountUpgrade");

  return v4;
}

- (CRLRealTimeSyncDecorator)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLRealTimeSyncDecorator *v5;
  CRLRealTimeSyncDecorator *v6;
  uint64_t v7;
  CRLCanvasRenderable *renderable;
  id WeakRetained;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLRealTimeSyncDecorator;
  v5 = -[CRLRealTimeSyncDecorator init](&v12, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_icc, v4);
    v7 = objc_claimAutoreleasedReturnValue(+[CRLNoDefaultImplicitActionRenderable renderable](CRLNoDefaultImplicitActionRenderable, "renderable"));
    renderable = v6->_renderable;
    v6->_renderable = (CRLCanvasRenderable *)v7;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_icc);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "editingCoordinator"));
    v6->_style = -[CRLRealTimeSyncDecorator p_styleForEditingCoordinator:](v6, "p_styleForEditingCoordinator:", v10);

    v6->_shouldDisplayContent = 0;
    -[CRLRealTimeSyncDecorator p_updateRenderable](v6, "p_updateRenderable");
  }

  return v6;
}

- (int64_t)p_styleForEditingCoordinator:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "realTimeSessionUsesEncryption") & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "realTimeSessionNeedsAccountUpgrade"))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)p_imageForStyle:(int64_t)a3
{
  const __CFString *v3;

  switch(a3)
  {
    case 2:
      v3 = CFSTR("exclamationmark.icloud");
LABEL_7:
      self = (CRLRealTimeSyncDecorator *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithSystemImageNamed:pointSize:](CRLImage, "imageWithSystemImageNamed:pointSize:", v3, 12.0));
      return self;
    case 1:
      v3 = CFSTR("lock.icloud");
      goto LABEL_7;
    case 0:
      self = (CRLRealTimeSyncDecorator *)objc_claimAutoreleasedReturnValue(+[CRLImage imageNamed:](CRLImage, "imageNamed:", CFSTR("AppIcon")));
      break;
  }
  return self;
}

- (void)p_updateLayerContentIfNeeded
{
  id WeakRetained;
  void *v4;
  int64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "editingCoordinator"));
  v5 = -[CRLRealTimeSyncDecorator p_styleForEditingCoordinator:](self, "p_styleForEditingCoordinator:", v4);

  if (self->_style != v5)
  {
    self->_style = v5;
    -[CRLRealTimeSyncDecorator p_updateRenderable](self, "p_updateRenderable");
  }
}

- (void)p_updateRenderable
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLRealTimeSyncDecorator p_imageForStyle:](self, "p_imageForStyle:", self->_style));
  objc_msgSend(v3, "size");
  -[CRLCanvasRenderable setFrame:](self->_renderable, "setFrame:", sub_10005FDDC());
  -[CRLCanvasRenderable setContents:](self->_renderable, "setContents:", objc_msgSend(v3, "CGImage"));

}

- (NSArray)decoratorOverlayRenderables
{
  void *v3;
  CRLCanvasRenderable *renderable;

  if (self->_shouldDisplayContent)
  {
    -[CRLRealTimeSyncDecorator p_updateLayerContentIfNeeded](self, "p_updateLayerContentIfNeeded");
    -[CRLRealTimeSyncDecorator p_updateLayerFrame](self, "p_updateLayerFrame");
    renderable = self->_renderable;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &renderable, 1));
  }
  else
  {
    v3 = &__NSArray0__struct;
  }
  return (NSArray *)v3;
}

- (void)p_updateLayerFrame
{
  id WeakRetained;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double MaxX;
  double MinY;
  double v14;
  id v15;
  Swift::String v16;
  Freeform::SyncEvent::FetchedRecordZoneChanges::Deletion v17;
  CGRect v18;
  CGRect v19;

  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  objc_msgSend(WeakRetained, "visibleBoundsRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  MaxX = CGRectGetMaxX(v18);
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  MinY = CGRectGetMinY(v19);
  -[CRLCanvasRenderable frame](self->_renderable, "frame");
  sub_1000603B8(MaxX, MinY, v14 + 5.0);
  v15 = -[CRLCanvasRenderable frame](self->_renderable, "frame");
  v17 = SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v15, v16);
  -[CRLCanvasRenderable setFrame:](self->_renderable, "setFrame:", v17.recordType._object);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderable, 0);
  objc_destroyWeak((id *)&self->_icc);
}

@end
