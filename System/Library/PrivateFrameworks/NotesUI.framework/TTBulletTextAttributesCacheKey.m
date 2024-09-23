@implementation TTBulletTextAttributesCacheKey

- (void)setHashValue:(unint64_t)a3
{
  self->_hashValue = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[TTBulletTextAttributesCacheKey hash](self, "hash");
    v6 = v5 == objc_msgSend(v4, "hash");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (TTBulletTextAttributesCacheKey)initWithTextFont:(id)a3 paragraphStyle:(id)a4 zoomFactor:(double)a5
{
  id v8;
  id v9;
  TTBulletTextAttributesCacheKey *v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TTBulletTextAttributesCacheKey;
  v10 = -[TTBulletTextAttributesCacheKey init](&v15, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "hash");
    v12 = objc_msgSend(v9, "hash");
    v13 = a5 * 100.0;
    -[TTBulletTextAttributesCacheKey setHashValue:](v10, "setHashValue:", v11 ^ v12 ^ vcvtps_u32_f32(v13));
  }

  return v10;
}

- (unint64_t)hashValue
{
  return self->_hashValue;
}

@end
