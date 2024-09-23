@implementation PXGSpriteInfoSerializable

- (PXGSpriteInfoSerializable)initWithSerializableObject:(id)a3
{
  id v4;
  PXGSpriteInfoSerializable *v5;
  _BYTE v7[40];
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXGSpriteInfoSerializable;
  v5 = -[PXGSpriteInfoSerializable init](&v8, sel_init);
  if (v5)
  {
    PXGDeserializeSpriteInfo(v4, (uint64_t)v7);
    -[PXGSpriteInfoSerializable setSpriteInfo:](v5, "setSpriteInfo:", v7);
  }

  return v5;
}

- (id)createSerializableObject
{
  unsigned __int8 v3[40];

  -[PXGSpriteInfoSerializable spriteInfo](self, "spriteInfo");
  PXGSerializeSpriteInfo(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- ($786F7D2F4E5B3A0CBB66DF574B7D98CF)spriteInfo
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var3;
  *(_OWORD *)&retstr->var4 = v3;
  retstr[1].var3 = *(_QWORD *)&self[1].var4;
  return self;
}

- (void)setSpriteInfo:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var4;
  *(_QWORD *)&self[2]._spriteInfo.presentationType = a3[1].var3;
  *(_OWORD *)&self[1]._spriteInfo.presentationType = v4;
  *(_OWORD *)&self->_spriteInfo.presentationType = v3;
}

@end
