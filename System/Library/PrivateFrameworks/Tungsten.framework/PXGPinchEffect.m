@implementation PXGPinchEffect

- (PXGPinchEffect)initWithEntityManager:(id)a3
{
  PXGPinchEffect *v3;
  PXGPinchEffect *v4;
  PXGUniform *v5;
  PXGUniform *normalizedCenter;
  PXGUniform *v7;
  PXGUniform *scale;
  PXGShader *v9;
  void *v10;
  uint64_t v11;
  PXGShader *shader;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)PXGPinchEffect;
  v3 = -[PXGEffect initWithEntityManager:](&v14, sel_initWithEntityManager_, a3);
  v4 = v3;
  if (v3)
  {
    -[PXGPinchEffect setNormalizedCenter:](v3, "setNormalizedCenter:", 0.5, 0.5);
    v5 = -[PXGUniform initWithName:type:]([PXGUniform alloc], "initWithName:type:", CFSTR("normalizedCenter"), 1);
    normalizedCenter = v4->_normalizedCenter;
    v4->_normalizedCenter = v5;

    v7 = -[PXGUniform initWithName:type:]([PXGUniform alloc], "initWithName:type:", CFSTR("scale"), 0);
    scale = v4->_scale;
    v4->_scale = v7;

    v9 = [PXGShader alloc];
    v15[0] = v4->_normalizedCenter;
    v15[1] = v4->_scale;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PXGShader initWithOpcodes:source:uniforms:components:](v9, "initWithOpcodes:source:uniforms:components:", 2, 0, 0, v10, 0);
    shader = v4->_shader;
    v4->_shader = (PXGShader *)v11;

    -[PXGShader setSampler:](v4->_shader, "setSampler:", 1);
    -[PXGPinchEffect setScale:](v4, "setScale:", 1.0);
  }
  return v4;
}

- (CGPoint)normalizedCenter
{
  float32x2_t v2;
  float64x2_t v3;
  double v4;
  CGPoint result;

  -[PXGUniform float2Value](self->_normalizedCenter, "float2Value");
  v3 = vcvtq_f64_f32(v2);
  v4 = v3.f64[1];
  result.x = v3.f64[0];
  result.y = v4;
  return result;
}

- (void)setNormalizedCenter:(CGPoint)a3
{
  CGFloat y;

  y = a3.y;
  -[PXGUniform setFloat2Value:](self->_normalizedCenter, "setFloat2Value:", COERCE_DOUBLE(vcvt_f32_f64((float64x2_t)a3)));
}

- (double)scale
{
  float v2;

  -[PXGUniform floatValue](self->_scale, "floatValue");
  return v2;
}

- (void)setScale:(double)a3
{
  *(float *)&a3 = a3;
  -[PXGUniform setFloatValue:](self->_scale, "setFloatValue:", a3);
}

- (id)shader
{
  return self->_shader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scale, 0);
  objc_storeStrong((id *)&self->_normalizedCenter, 0);
  objc_storeStrong((id *)&self->_shader, 0);
}

@end
