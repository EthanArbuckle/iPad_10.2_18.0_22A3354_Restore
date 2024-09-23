@implementation PXGRegionMaskEffect

- (PXGRegionMaskEffect)initWithEntityManager:(id)a3
{
  PXGRegionMaskEffect *v3;
  PXGUniform *v4;
  PXGUniform *valuesUniform;
  PXGShader *v6;
  void *v7;
  uint64_t v8;
  PXGShader *shader;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)PXGRegionMaskEffect;
  v3 = -[PXGEffect initWithEntityManager:](&v11, sel_initWithEntityManager_, a3);
  if (v3)
  {
    v4 = -[PXGUniform initWithName:type:]([PXGUniform alloc], "initWithName:type:", CFSTR("values"), 3);
    valuesUniform = v3->_valuesUniform;
    v3->_valuesUniform = v4;

    v6 = [PXGShader alloc];
    v12[0] = v3->_valuesUniform;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXGShader initWithOpcodes:source:uniforms:components:](v6, "initWithOpcodes:source:uniforms:components:", 0, 1, 0, v7, 0);
    shader = v3->_shader;
    v3->_shader = (PXGShader *)v8;

    -[PXGRegionMaskEffect setRegion:](v3, "setRegion:", 0);
    -[PXGRegionMaskEffect setAlpha:](v3, "setAlpha:", 1.0);
  }
  return v3;
}

- (void)setRegion:(id)a3
{
  PXRegion *v4;
  PXRegion *v5;
  PXRegion *v6;
  char v7;
  PXRegion *obj;

  v4 = (PXRegion *)a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE72BA0], "identityRegion");
    v4 = (PXRegion *)objc_claimAutoreleasedReturnValue();
  }
  obj = v4;
  v5 = self->_region;
  if (v5 == obj)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXRegion isEqual:](v5, "isEqual:");

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_region, obj);
      -[PXGRegionMaskEffect _updateValues](self, "_updateValues");
    }
  }

}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
  -[PXGRegionMaskEffect _updateValues](self, "_updateValues");
}

- (void)_updateValues
{
  double v4;
  double v5;
  double v6;
  float64x2_t v7;
  float64_t v8;
  float64x2_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  float64_t v15;
  float64_t v16;
  float64_t v17;
  PXRegion *v18;

  v18 = self->_region;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGRegionMaskEffect.m"), 47, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("_region"), v12);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXRegion px_descriptionForAssertionMessage](v18, "px_descriptionForAssertionMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGRegionMaskEffect.m"), 47, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("_region"), v12, v14);

    goto LABEL_6;
  }
LABEL_3:
  -[PXRegion a](v18, "a");
  v17 = v4;
  -[PXRegion b](v18, "b");
  v16 = v5;
  -[PXRegion c](v18, "c");
  v15 = v6;
  -[PXGRegionMaskEffect alpha](self, "alpha");
  v7.f64[0] = v15;
  v7.f64[1] = v8;
  v9.f64[0] = v17;
  v9.f64[1] = v16;
  -[PXGUniform setFloat4Value:](self->_valuesUniform, "setFloat4Value:", *(double *)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v9), v7).i64);

}

- (id)shader
{
  return self->_shader;
}

- (PXRegion)region
{
  return self->_region;
}

- (double)alpha
{
  return self->_alpha;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_valuesUniform, 0);
  objc_storeStrong((id *)&self->_shader, 0);
}

@end
