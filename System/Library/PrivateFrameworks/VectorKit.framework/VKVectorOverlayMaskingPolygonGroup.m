@implementation VKVectorOverlayMaskingPolygonGroup

- (VKVectorOverlayMaskingPolygonGroup)initWithPolygons:(id)a3
{
  id v5;
  VKVectorOverlayMaskingPolygonGroup *v6;
  VKVectorOverlayMaskingPolygonGroup *v7;
  VKVectorOverlayMaskingPolygonGroup *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VKVectorOverlayMaskingPolygonGroup;
  v6 = -[VKVectorOverlayData init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_polygons, a3);
    v7->_fillMode = 0;
    v7->_style = 0;
    v8 = v7;
  }

  return v7;
}

- (int64_t)fillMode
{
  return self->_fillMode;
}

- (void)setFillMode:(int64_t)a3
{
  self->_fillMode = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSArray)polygons
{
  return self->_polygons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_polygons, 0);
}

@end
