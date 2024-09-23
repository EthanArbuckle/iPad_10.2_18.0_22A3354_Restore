@implementation HomeDragLocalContext

- (HomeDragLocalContext)initWithItemSnapshot:(id)a3 dragAndDropMapItem:(id)a4
{
  id v7;
  id v8;
  HomeDragLocalContext *v9;
  HomeDragLocalContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HomeDragLocalContext;
  v9 = -[HomeDragLocalContext init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemSnapshot, a3);
    objc_storeStrong((id *)&v10->_dragAndDropMapItem, a4);
  }

  return v10;
}

- (MKMapItem)draggedMapItem
{
  return -[DragAndDropMapItem draggedMapItem](self->_dragAndDropMapItem, "draggedMapItem");
}

- (MapsUIDiffableDataSourceItemSnapshotting)itemSnapshot
{
  return self->_itemSnapshot;
}

- (DragAndDropMapItem)dragAndDropMapItem
{
  return self->_dragAndDropMapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragAndDropMapItem, 0);
  objc_storeStrong((id *)&self->_itemSnapshot, 0);
}

@end
