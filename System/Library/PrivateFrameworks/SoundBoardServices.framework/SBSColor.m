@implementation SBSColor

- (NSData)data
{
  return (NSData *)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
}

- (SBSColor)initWithData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  SBSColor *v7;
  uint64_t v9;

  v4 = (void *)MEMORY[0x24BDD1620];
  v5 = a3;
  v9 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (SBSColor)initWithRed:(float)a3 green:(float)a4 blue:(float)a5
{
  SBSColor *result;
  float v12;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBSColor;
  result = -[SBSColor init](&v15, sel_init);
  if (result)
  {
    __asm { FMOV            V1.2S, #1.0 }
    *(int8x8_t *)&result->_redComponent = vbic_s8(vbsl_s8((int8x8_t)vcgt_f32((float32x2_t)__PAIR64__(LODWORD(a4), LODWORD(a3)), _D1), (int8x8_t)_D1, (int8x8_t)__PAIR64__(LODWORD(a4), LODWORD(a3))), (int8x8_t)vcltz_f32((float32x2_t)__PAIR64__(LODWORD(a4), LODWORD(a3))));
    v12 = 1.0;
    if (a5 <= 1.0)
      v12 = a5;
    if (a5 < 0.0)
      v12 = 0.0;
    result->_blueComponent = v12;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  float redComponent;
  double v5;
  double v6;
  double v7;
  id v8;

  redComponent = self->_redComponent;
  v8 = a3;
  *(float *)&v5 = redComponent;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("redComponent"), v5);
  *(float *)&v6 = self->_greenComponent;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("greenComponent"), v6);
  *(float *)&v7 = self->_blueComponent;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("blueComponent"), v7);

}

- (SBSColor)initWithCoder:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  SBSColor *v11;
  double v12;
  double v13;
  double v14;
  SBSColor *v15;

  v4 = a3;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("redComponent"));
  v6 = v5;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("greenComponent"));
  v8 = v7;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("blueComponent"));
  v10 = v9;

  v11 = [SBSColor alloc];
  LODWORD(v12) = v6;
  LODWORD(v13) = v8;
  LODWORD(v14) = v10;
  v15 = -[SBSColor initWithRed:green:blue:](v11, "initWithRed:green:blue:", v12, v13, v14);

  return v15;
}

- (float)redComponent
{
  return self->_redComponent;
}

- (float)greenComponent
{
  return self->_greenComponent;
}

- (float)blueComponent
{
  return self->_blueComponent;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
