@implementation CRLDrawingItemNeedingPKStrokeUpdate

- (CRLDrawingItemNeedingPKStrokeUpdate)initWith:(id)a3 shapeItems:(id)a4
{
  id v6;
  id v7;
  CRLDrawingItemNeedingPKStrokeUpdate *v8;
  CRLDrawingItemNeedingPKStrokeUpdate *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CRLDrawingItemNeedingPKStrokeUpdate;
  v8 = -[CRLDrawingItemNeedingPKStrokeUpdate init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[CRLDrawingItemNeedingPKStrokeUpdate setId:](v8, "setId:", v6);
    -[CRLDrawingItemNeedingPKStrokeUpdate setShapeItems:](v9, "setShapeItems:", v7);
  }

  return v9;
}

- (NSUUID)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
  objc_storeStrong((id *)&self->_id, a3);
}

- (NSArray)shapeItems
{
  return self->_shapeItems;
}

- (void)setShapeItems:(id)a3
{
  objc_storeStrong((id *)&self->_shapeItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeItems, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

@end
