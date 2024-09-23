@implementation PXGSpriteGeometrySerializable

- (PXGSpriteGeometrySerializable)initWithSerializableObject:(id)a3
{
  id v4;
  PXGSpriteGeometrySerializable *v5;
  _BYTE v7[32];
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXGSpriteGeometrySerializable;
  v5 = -[PXGSpriteGeometrySerializable init](&v8, sel_init);
  if (v5)
  {
    PXGDeserializeSpriteGeometry(v4, (uint64_t)v7);
    -[PXGSpriteGeometrySerializable setSpriteGeometry:](v5, "setSpriteGeometry:", v7);
  }

  return v5;
}

- (id)createSerializableObject
{
  uint64_t v3;

  -[PXGSpriteGeometrySerializable spriteGeometry](self, "spriteGeometry");
  PXGSerializeSpriteGeometry((uint64_t)&v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- ($16EC8B44B1C22DB88FC318D5A7EDDAB2)spriteGeometry
{
  _OWORD *v2;
  __int128 v3;
  __int128 v4;
  $16EC8B44B1C22DB88FC318D5A7EDDAB2 result;

  v3 = *(_OWORD *)&self->_spriteGeometry.center.x;
  v4 = *(_OWORD *)&self->_spriteGeometry.center.z;
  *v2 = v3;
  v2[1] = v4;
  result.var0.var1 = *(double *)&v4;
  result.var0.var0 = *(double *)&v3;
  return result;
}

- (void)setSpriteGeometry:(id)a3
{
  __int128 *v3;
  __int128 v4;

  v4 = *v3;
  *(_OWORD *)&self->_spriteGeometry.center.z = v3[1];
  *(_OWORD *)&self->_spriteGeometry.center.x = v4;
}

@end
