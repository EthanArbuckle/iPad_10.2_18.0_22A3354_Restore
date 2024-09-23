@implementation VGRotationTranslation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unsigned __int8 *anon_10;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDBCE50];
  anon_10 = self->_anon_10;
  v6 = a3;
  objc_msgSend(v4, "dataWithBytes:length:", anon_10, 16);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", self->_translation, 16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("rotation"));
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("translation"));

}

- (VGRotationTranslation)initWithCoder:(id)a3
{
  id v4;
  VGRotationTranslation *v5;
  void *v6;
  void *v7;
  VGRotationTranslation *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VGRotationTranslation;
  v5 = -[VGRotationTranslation init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rotation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("translation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getBytes:length:", v5->_anon_10, 16);
    objc_msgSend(v7, "getBytes:length:", v5->_translation, 16);
    v8 = v5;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float32x4_t *v5;
  float32x4_t v6;
  unsigned int v7;
  float32x4_t v8;
  uint32x4_t v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (float32x4_t *)v4;
    -[VGRotationTranslation rotation](self, "rotation");
    if ((vminvq_u32((uint32x4_t)vceqq_f32(v6, v5[1])) & 0x80000000) != 0)
    {
      -[VGRotationTranslation translation](self, "translation");
      v9 = (uint32x4_t)vceqq_f32(v8, v5[2]);
      v9.i32[3] = v9.i32[2];
      v7 = vminvq_u32(v9) >> 31;
    }
    else
    {
      LOBYTE(v7) = 0;
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (__n128)rotation
{
  return a1[1];
}

- (__n128)setRotation:(__n128 *)result
{
  result[1] = a2;
  return result;
}

- (__n128)translation
{
  return a1[2];
}

- (void)setTranslation:(VGRotationTranslation *)self
{
  __int128 v2;

  *(_OWORD *)self->_translation = v2;
}

@end
