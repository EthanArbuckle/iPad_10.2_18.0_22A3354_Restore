@implementation RenderCommandEncoder

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5
{
  objc_super v8;

  if (a5)
  {
    v8.receiver = self;
    v8.super_class = (Class)swift_getObjectType();
    -[RGCachedRenderCommandEncoder drawPrimitives:vertexStart:vertexCount:](&v8, sel_drawPrimitives_vertexStart_vertexCount_, a3, a4, a5);
  }
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6
{
  objc_class *ObjectType;
  objc_super v12;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a5)
  {
    if (a6 == 1)
    {
      v12.receiver = self;
      v12.super_class = ObjectType;
      -[RGCachedRenderCommandEncoder drawPrimitives:vertexStart:vertexCount:](&v12, sel_drawPrimitives_vertexStart_vertexCount_, a3, a4, a5);
    }
    else
    {
      v13.receiver = self;
      v13.super_class = ObjectType;
      -[RGCachedRenderCommandEncoder drawPrimitives:vertexStart:vertexCount:instanceCount:](&v13, sel_drawPrimitives_vertexStart_vertexCount_instanceCount_, a3, a4, a5, a6);
    }
  }
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  objc_class *ObjectType;
  objc_super v14;
  objc_super v15;
  objc_super v16;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a5)
  {
    if (a6 != 1 || a7)
    {
      if (a7)
      {
        v15.receiver = self;
        v15.super_class = ObjectType;
        -[RGCachedRenderCommandEncoder drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:](&v15, sel_drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_, a3, a4, a5, a6, a7);
      }
      else
      {
        v16.receiver = self;
        v16.super_class = ObjectType;
        -[RGCachedRenderCommandEncoder drawPrimitives:vertexStart:vertexCount:instanceCount:](&v16, sel_drawPrimitives_vertexStart_vertexCount_instanceCount_, a3, a4, a5, a6);
      }
    }
    else
    {
      v14.receiver = self;
      v14.super_class = ObjectType;
      -[RGCachedRenderCommandEncoder drawPrimitives:vertexStart:vertexCount:](&v14, sel_drawPrimitives_vertexStart_vertexCount_, a3, a4, a5);
    }
  }
}

- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  -[RGCachedRenderCommandEncoder drawPrimitives:indirectBuffer:indirectBufferOffset:](&v8, sel_drawPrimitives_indirectBuffer_indirectBufferOffset_, a3, a4, a5);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7
{
  objc_super v12;

  if (a4)
  {
    v12.receiver = self;
    v12.super_class = (Class)swift_getObjectType();
    -[RGCachedRenderCommandEncoder drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:](&v12, sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_, a3, a4, a5, a6, a7);
  }
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8
{
  objc_class *ObjectType;
  objc_super v16;
  objc_super v17;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    if (a8 == 1)
    {
      v16.receiver = self;
      v16.super_class = ObjectType;
      -[RGCachedRenderCommandEncoder drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:](&v16, sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_, a3, a4, a5, a6, a7);
    }
    else
    {
      v17.receiver = self;
      v17.super_class = ObjectType;
      -[RGCachedRenderCommandEncoder drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:](&v17, sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_, a3, a4, a5, a6, a7, a8);
    }
  }
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  _TtC3VFX20RenderCommandEncoder *v17;

  swift_unknownObjectRetain();
  v17 = self;
  sub_1B20C0348(a3, a4, a5, (uint64_t)a6, a7, a8, a9, a10);
  swift_unknownObjectRelease();

}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8
{
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  -[RGCachedRenderCommandEncoder drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:indirectBufferOffset:](&v14, sel_drawIndexedPrimitives_indexType_indexBuffer_indexBufferOffset_indirectBuffer_indirectBufferOffset_, a3, a4, a5, a6, a7, a8);
}

- (_TtC3VFX20RenderCommandEncoder)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[RGCachedRenderCommandEncoder init](&v3, sel_init);
}

- (_TtC3VFX20RenderCommandEncoder)initWithEncoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[RGCachedRenderCommandEncoder initWithEncoder:](&v5, sel_initWithEncoder_, a3);
}

@end
