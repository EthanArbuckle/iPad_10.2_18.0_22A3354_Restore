@implementation PXGTextureConverterOptionsSerializable

- (PXGTextureConverterOptionsSerializable)initWithSerializableObject:(id)a3
{
  id v4;
  PXGTextureConverterOptionsSerializable *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PXGTextureConverterOptionsSerializable;
  v5 = -[PXGTextureConverterOptionsSerializable init](&v7, sel_init);
  if (v5)
    -[PXGTextureConverterOptionsSerializable setTextureConverterOptions:](v5, "setTextureConverterOptions:", PXGDeserializeTextureConverterOptions(v4));

  return v5;
}

- (id)createSerializableObject
{
  return PXGSerializeTextureConverterOptions(-[PXGTextureConverterOptionsSerializable textureConverterOptions](self, "textureConverterOptions"));
}

- ($8814E4F230000EB768D7E307C62B5F7C)textureConverterOptions
{
  return ($8814E4F230000EB768D7E307C62B5F7C)self->_textureConverterOptions;
}

- (void)setTextureConverterOptions:(id)a3
{
  self->_textureConverterOptions = ($FA15997C902EC2271369254F9448C610)a3;
}

@end
