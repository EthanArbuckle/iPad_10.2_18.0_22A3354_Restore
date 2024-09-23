@implementation PXGTextLegibilityEffect

- (PXGTextLegibilityEffect)initWithEntityManager:(id)a3
{
  PXGTextLegibilityEffect *v4;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  PXGUniform *v10;
  PXGUniform *values;
  PXGShader *v12;
  void *v13;
  uint64_t v14;
  PXGShader *shader;
  void *v16;
  double v17;
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)PXGTextLegibilityEffect;
  v4 = -[PXGEffect initWithEntityManager:](&v18, sel_initWithEntityManager_, a3);
  if (v4)
  {
    +[PXTungstenSettings sharedInstance](PXTungstenSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "textLegibilityDimmingType");

    if (v7 >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v4, CFSTR("PXGTextLegibilityEffect.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("opcode != PXGFragmentColorOpcodeNil"));

      v8 = 0;
    }
    else
    {
      v8 = (v7 << 32) + 0x300000000;
    }
    v10 = -[PXGUniform initWithName:type:]([PXGUniform alloc], "initWithName:type:", CFSTR("values"), 1);
    values = v4->_values;
    v4->_values = v10;

    v12 = [PXGShader alloc];
    v19[0] = v4->_values;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PXGShader initWithOpcodes:source:uniforms:components:](v12, "initWithOpcodes:source:uniforms:components:", v8, 0, 0, v13, 0);
    shader = v4->_shader;
    v4->_shader = (PXGShader *)v14;

    v4->_alpha = 1.0;
    +[PXTungstenSettings sharedInstance](PXTungstenSettings, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "textLegibilityDimmingStrength");
    v4->_strength = v17;

    -[PXGTextLegibilityEffect _updateValues](v4, "_updateValues");
  }
  return v4;
}

- (void)setAlpha:(double)a3
{
  if (self->_alpha != a3)
  {
    self->_alpha = a3;
    -[PXGTextLegibilityEffect _updateValues](self, "_updateValues");
  }
}

- (void)setStrength:(double)a3
{
  if (self->_strength != a3)
  {
    self->_strength = a3;
    -[PXGTextLegibilityEffect _updateValues](self, "_updateValues");
  }
}

- (void)_updateValues
{
  double v3;
  float64x2_t v4;
  float64_t v5;
  float64_t v6;

  -[PXGTextLegibilityEffect strength](self, "strength");
  v6 = v3;
  -[PXGTextLegibilityEffect alpha](self, "alpha");
  v4.f64[0] = v6;
  v4.f64[1] = v5;
  -[PXGUniform setFloat2Value:](self->_values, "setFloat2Value:", COERCE_DOUBLE(vcvt_f32_f64(v4)));
}

- (id)shader
{
  return self->_shader;
}

- (double)alpha
{
  return self->_alpha;
}

- (double)strength
{
  return self->_strength;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_shader, 0);
}

@end
