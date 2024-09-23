@implementation VFXBtShapeWrapper

- (VFXBtShapeWrapper)initWithShape:(btCollisionShape *)a3
{
  VFXBtShapeWrapper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VFXBtShapeWrapper;
  result = -[VFXBtShapeWrapper init](&v5, sel_init);
  if (result)
    result->_collisionShape = a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  sub_1B190F464((uint64_t)self->_collisionShape);
  v3.receiver = self;
  v3.super_class = (Class)VFXBtShapeWrapper;
  -[VFXBtShapeWrapper dealloc](&v3, sel_dealloc);
}

- (btCollisionShape)btShape
{
  return self->_collisionShape;
}

@end
