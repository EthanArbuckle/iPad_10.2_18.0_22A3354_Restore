@implementation PXGColorTintEffect

- (PXGColorTintEffect)initWithEntityManager:(id)a3
{
  PXGColorTintEffect *v3;
  PXGUniform *v4;
  PXGUniform *tintColorUniform;
  PXGShader *v6;
  void *v7;
  uint64_t v8;
  PXGShader *shader;
  void *v10;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)PXGColorTintEffect;
  v3 = -[PXGEffect initWithEntityManager:](&v12, sel_initWithEntityManager_, a3);
  if (v3)
  {
    v4 = -[PXGUniform initWithName:type:]([PXGUniform alloc], "initWithName:type:", CFSTR("tintColor"), 3);
    tintColorUniform = v3->_tintColorUniform;
    v3->_tintColorUniform = v4;

    v6 = [PXGShader alloc];
    v13[0] = v3->_tintColorUniform;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXGShader initWithOpcodes:source:uniforms:components:](v6, "initWithOpcodes:source:uniforms:components:", 0x200000000, 0, 0, v7, 0);
    shader = v3->_shader;
    v3->_shader = (PXGShader *)v8;

    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGColorTintEffect setTintColor:](v3, "setTintColor:", v10);

  }
  return v3;
}

- (void)setTintColor:(id)a3
{
  PXGUniform *v5;
  PXGUniform *v6;
  PXGUniform *v7;
  char v8;
  float64x2_t v9;
  float64x2_t v10;
  float64_t v11;
  float64_t v12;
  float64_t v13;
  float64_t v14;

  v5 = (PXGUniform *)a3;
  v6 = self->_tintColorUniform;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[PXGUniform isEqual:](v6, "isEqual:", v5);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_tintColor, a3);
      v13 = 0.0;
      v14 = 0.0;
      v11 = 0.0;
      v12 = 0.0;
      -[PXGUniform getRed:green:blue:alpha:](v5, "getRed:green:blue:alpha:", &v14, &v13, &v12, &v11);
      v9.f64[0] = v14;
      v10.f64[0] = v12;
      v9.f64[1] = v13;
      v10.f64[1] = v11;
      -[PXGUniform setFloat4Value:](self->_tintColorUniform, "setFloat4Value:", *(double *)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v9), v10).i64);
    }
  }

}

- (id)shader
{
  return self->_shader;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_tintColorUniform, 0);
  objc_storeStrong((id *)&self->_shader, 0);
}

@end
