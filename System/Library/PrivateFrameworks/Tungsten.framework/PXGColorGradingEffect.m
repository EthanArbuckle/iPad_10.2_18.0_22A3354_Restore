@implementation PXGColorGradingEffect

- (PXGColorGradingEffect)initWithEntityManager:(id)a3
{
  PXGColorGradingEffect *v3;
  PXGUniform *v4;
  PXGUniform *cubeUniform;
  PXGUniform *v6;
  PXGUniform *valuesUniform;
  PXGUniform *v8;
  PXGUniform *grayUniform;
  PXGShader *v10;
  void *v11;
  uint64_t v12;
  PXGShader *shader;
  double v14;
  objc_super v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)PXGColorGradingEffect;
  v3 = -[PXGEffect initWithEntityManager:](&v16, sel_initWithEntityManager_, a3);
  if (v3)
  {
    v4 = -[PXGUniform initWithName:type:]([PXGUniform alloc], "initWithName:type:", CFSTR("cube"), 5);
    cubeUniform = v3->_cubeUniform;
    v3->_cubeUniform = v4;

    v6 = -[PXGUniform initWithName:type:]([PXGUniform alloc], "initWithName:type:", CFSTR("coords"), 3);
    valuesUniform = v3->_valuesUniform;
    v3->_valuesUniform = v6;

    v8 = -[PXGUniform initWithName:type:]([PXGUniform alloc], "initWithName:type:", CFSTR("gray"), 3);
    grayUniform = v3->_grayUniform;
    v3->_grayUniform = v8;

    v10 = [PXGShader alloc];
    v17[0] = v3->_cubeUniform;
    v17[1] = v3->_valuesUniform;
    v17[2] = v3->_grayUniform;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PXGShader initWithOpcodes:source:uniforms:components:](v10, "initWithOpcodes:source:uniforms:components:", 0x100000000, 0, 0, v11, 0);
    shader = v3->_shader;
    v3->_shader = (PXGShader *)v12;

    -[PXGColorGradingEffect setColorLookupCube:](v3, "setColorLookupCube:", 0);
    LODWORD(v14) = 1.0;
    -[PXGColorGradingEffect setIntensity:](v3, "setIntensity:", v14);
  }
  return v3;
}

- (void)setColorLookupCube:(id)a3
{
  PXGColorLookupCube *v5;
  PXGColorLookupCube *v6;
  PXGColorLookupCube *v7;
  int v8;
  void *v9;
  PXGColorLookupCube *v10;
  double v11;
  unint64_t v12;
  int32x2_t v13;
  uint64_t v14;
  float32x2_t v15;
  _QWORD v16[4];
  PXGColorLookupCube *v17;

  v5 = (PXGColorLookupCube *)a3;
  v6 = self->_colorLookupCube;
  if (v6 == v5)
  {

LABEL_5:
    -[PXGUniform textureProvider](self->_cubeUniform, "textureProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_13;
    goto LABEL_6;
  }
  v7 = v6;
  v8 = -[PXGColorLookupCube isEqual:](v5, "isEqual:", v6);

  if (v8)
    goto LABEL_5;
LABEL_6:
  objc_storeStrong((id *)&self->_colorLookupCube, a3);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __44__PXGColorGradingEffect_setColorLookupCube___block_invoke;
  v16[3] = &unk_251A6E458;
  v10 = v5;
  v17 = v10;
  -[PXGUniform setTextureProvider:](self->_cubeUniform, "setTextureProvider:", v16);
  if (v10)
    -[PXGColorLookupCube center](v10, "center");
  else
    v11 = 0.0;
  -[PXGUniform setFloat4Value:](self->_grayUniform, "setFloat4Value:", v11);
  v12 = -[PXGColorLookupCube edgeSize](v10, "edgeSize");
  if (v12 <= 1)
    v14 = 1;
  else
    v14 = v12;
  *(float *)v13.i32 = (float)v14;
  v15.i32[0] = 1056964608;
  v15.f32[1] = (float)v14 + -1.0;
  -[PXGUniform setFloat4Value:](self->_valuesUniform, "setFloat4Value:", COERCE_DOUBLE(vdiv_f32(v15, (float32x2_t)vdup_lane_s32(v13, 0))));

LABEL_13:
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  BOOL v10;
  int v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "colorLookupCube");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PXGColorGradingEffect colorLookupCube](self, "colorLookupCube");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {

    }
    else
    {
      v8 = v7;
      v9 = objc_msgSend(v6, "isEqual:", v7);

      if ((v9 & 1) == 0)
        goto LABEL_9;
    }
    v11 = objc_msgSend(v5, "effectId");
    if (v11 == -[PXGEffect effectId](self, "effectId"))
    {
      objc_msgSend(v5, "entityManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGEffect entityManager](self, "entityManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v12 == v13;

LABEL_10:
      goto LABEL_11;
    }
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXGColorGradingEffect;
  v3 = -[PXGColorGradingEffect hash](&v7, sel_hash);
  -[PXGColorGradingEffect colorLookupCube](self, "colorLookupCube");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)shader
{
  return self->_shader;
}

- (PXGColorLookupCube)colorLookupCube
{
  return self->_colorLookupCube;
}

- (float)intensity
{
  return self->_intensity;
}

- (void)setIntensity:(float)a3
{
  self->_intensity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorLookupCube, 0);
  objc_storeStrong((id *)&self->_grayUniform, 0);
  objc_storeStrong((id *)&self->_valuesUniform, 0);
  objc_storeStrong((id *)&self->_cubeUniform, 0);
  objc_storeStrong((id *)&self->_shader, 0);
}

id __44__PXGColorGradingEffect_setColorLookupCube___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  +[PXGColorGradingTexturesStore colorGradingTextureStoreForContext:](PXGColorGradingTexturesStore, "colorGradingTextureStoreForContext:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorGradingTextureWithColorLookupCube:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
