@implementation PXGSpriteEntitySerializable

- (PXGSpriteEntitySerializable)initWithSerializableObject:(id)a3
{
  id v4;
  PXGSpriteEntitySerializable *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PXGSpriteEntitySerializable;
  v5 = -[PXGSpriteEntitySerializable init](&v7, sel_init);
  if (v5)
    -[PXGSpriteEntitySerializable setSpriteEntity:](v5, "setSpriteEntity:", PXGDeserializeSpriteEntity(v4));

  return v5;
}

- (id)createSerializableObject
{
  return PXGSerializeSpriteEntity(-[PXGSpriteEntitySerializable spriteEntity](self, "spriteEntity"));
}

- ($738B17BD11CC339B30296C0EA03CEC2B)spriteEntity
{
  return ($738B17BD11CC339B30296C0EA03CEC2B)self->_spriteEntity.id;
}

- (void)setSpriteEntity:(id)a3
{
  self->_spriteEntity.id = a3.var0;
}

@end
