@implementation PXGSpriteTextureInfoSerializable

- (PXGSpriteTextureInfoSerializable)initWithSerializableObject:(id)a3
{
  id v4;
  PXGSpriteTextureInfoSerializable *v5;
  _BYTE v7[64];
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXGSpriteTextureInfoSerializable;
  v5 = -[PXGSpriteTextureInfoSerializable init](&v8, sel_init);
  if (v5)
  {
    PXGDeserializeSpriteTextureInfo(v4, (uint64_t)v7);
    -[PXGSpriteTextureInfoSerializable setSpriteTextureInfo:](v5, "setSpriteTextureInfo:", v7);
  }

  return v5;
}

- (id)createSerializableObject
{
  uint64_t v3;

  -[PXGSpriteTextureInfoSerializable spriteTextureInfo](self, "spriteTextureInfo");
  PXGSerializeSpriteTextureInfo((uint64_t)&v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- ($3BA783FF50B239963188BE194EBFFEBA)spriteTextureInfo
{
  PXGSpriteTextureInfoSerializable *v2;
  PXGSpriteTextureInfoSerializable v3;
  PXGSpriteTextureInfoSerializable v4;
  PXGSpriteTextureInfoSerializable v5;

  v3 = self[2];
  *v2 = self[1];
  v2[1] = v3;
  v4 = self[3];
  v5 = self[4];
  v2[2] = v4;
  v2[3] = v5;
  return ($3BA783FF50B239963188BE194EBFFEBA)v4.super.isa;
}

- (void)setSpriteTextureInfo:(id)a3
{
  PXGSpriteTextureInfoSerializable *v3;
  PXGSpriteTextureInfoSerializable v4;
  PXGSpriteTextureInfoSerializable v5;
  PXGSpriteTextureInfoSerializable v6;

  v4 = *v3;
  v5 = v3[1];
  v6 = v3[3];
  self[3] = v3[2];
  self[4] = v6;
  self[1] = v4;
  self[2] = v5;
}

@end
