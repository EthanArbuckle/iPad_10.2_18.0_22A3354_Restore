@implementation PXFeedHitTestResult

- (PXFeedHitTestResult)initWithSpriteIndex:(unsigned int)a3 layout:(id)a4
{
  return -[PXFeedHitTestResult initWithSpriteIndex:layout:identifier:](self, "initWithSpriteIndex:layout:identifier:", *(_QWORD *)&a3, a4, 0);
}

- (PXFeedHitTestResult)initWithSpriteIndex:(unsigned int)a3 layout:(id)a4 identifier:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  PXFeedHitTestResult *v11;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "spriteReferenceForSpriteIndex:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PXGHitTestResult initWithSpriteReference:layout:identifier:userData:](self, "initWithSpriteReference:layout:identifier:userData:", v10, v9, v8, 0);

  return v11;
}

- (id)primaryAction:(id)a3
{
  void *v4;
  id primaryAction;

  v4 = (void *)objc_msgSend(a3, "copy");
  primaryAction = self->_primaryAction;
  self->_primaryAction = v4;

  return self;
}

- (id)touchAction:(id)a3
{
  void *v4;
  id touchAction;

  v4 = (void *)objc_msgSend(a3, "copy");
  touchAction = self->_touchAction;
  self->_touchAction = v4;

  return self;
}

- (id)hoverAction:(id)a3
{
  void *v4;
  id hoverAction;

  v4 = (void *)objc_msgSend(a3, "copy");
  hoverAction = self->_hoverAction;
  self->_hoverAction = v4;

  return self;
}

- (id)presentMenuAction:(id)a3
{
  void *v4;
  id presentMenuAction;

  v4 = (void *)objc_msgSend(a3, "copy");
  presentMenuAction = self->_presentMenuAction;
  self->_presentMenuAction = v4;

  return self;
}

- (id)objectReference:(id)a3
{
  PXSectionedObjectReference *v4;
  PXSectionedObjectReference *objectReference;

  v4 = (PXSectionedObjectReference *)objc_msgSend(a3, "copy");
  objectReference = self->_objectReference;
  self->_objectReference = v4;

  return self;
}

- (id)primaryAction
{
  return self->_primaryAction;
}

- (id)touchAction
{
  return self->_touchAction;
}

- (id)hoverAction
{
  return self->_hoverAction;
}

- (id)presentMenuAction
{
  return self->_presentMenuAction;
}

- (PXSectionedObjectReference)objectReference
{
  return self->_objectReference;
}

- (PXSimpleIndexPath)dataSourceIndexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].item;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[3].dataSourceIdentifier;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (void)setDataSourceIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->item;
  *(_OWORD *)&self->_dataSourceIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
  *(_OWORD *)&self->_dataSourceIndexPath.item = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectReference, 0);
  objc_storeStrong(&self->_presentMenuAction, 0);
  objc_storeStrong(&self->_hoverAction, 0);
  objc_storeStrong(&self->_touchAction, 0);
  objc_storeStrong(&self->_primaryAction, 0);
}

@end
