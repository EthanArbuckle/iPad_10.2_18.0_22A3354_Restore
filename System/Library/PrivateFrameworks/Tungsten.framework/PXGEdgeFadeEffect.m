@implementation PXGEdgeFadeEffect

- (PXGEdgeFadeEffect)initWithEntityManager:(id)a3
{
  PXGEdgeFadeEffect *v3;
  PXGUniform *v4;
  PXGUniform *directionUniform;
  PXGShader *v6;
  void *v7;
  uint64_t v8;
  PXGShader *shader;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)PXGEdgeFadeEffect;
  v3 = -[PXGEffect initWithEntityManager:](&v11, sel_initWithEntityManager_, a3);
  if (v3)
  {
    v4 = -[PXGUniform initWithName:type:]([PXGUniform alloc], "initWithName:type:", CFSTR("directionUniform"), 0);
    directionUniform = v3->_directionUniform;
    v3->_directionUniform = v4;

    v6 = [PXGShader alloc];
    v12[0] = v3->_directionUniform;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXGShader initWithOpcodes:source:uniforms:components:](v6, "initWithOpcodes:source:uniforms:components:", 0, 2, 0, v7, 0);
    shader = v3->_shader;
    v3->_shader = (PXGShader *)v8;

    -[PXGEdgeFadeEffect setDirection:](v3, "setDirection:", 0);
  }
  return v3;
}

- (int64_t)direction
{
  float v2;

  -[PXGUniform floatValue](self->_directionUniform, "floatValue");
  return (uint64_t)v2;
}

- (void)setDirection:(int64_t)a3
{
  double v3;

  *(float *)&v3 = (float)a3;
  -[PXGUniform setFloatValue:](self->_directionUniform, "setFloatValue:", v3);
}

- (id)shader
{
  return self->_shader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionUniform, 0);
  objc_storeStrong((id *)&self->_shader, 0);
}

@end
