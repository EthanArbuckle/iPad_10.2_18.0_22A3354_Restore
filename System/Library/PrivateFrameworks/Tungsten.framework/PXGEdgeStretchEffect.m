@implementation PXGEdgeStretchEffect

- (PXGEdgeStretchEffect)initWithEntityManager:(id)a3
{
  PXGEdgeStretchEffect *v3;
  PXGUniform *v4;
  PXGUniform *sampleRect;
  PXGShader *v6;
  void *v7;
  uint64_t v8;
  PXGShader *shader;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)PXGEdgeStretchEffect;
  v3 = -[PXGEffect initWithEntityManager:](&v11, sel_initWithEntityManager_, a3);
  if (v3)
  {
    v4 = -[PXGUniform initWithName:type:]([PXGUniform alloc], "initWithName:type:", CFSTR("sampleRect"), 3);
    sampleRect = v3->_sampleRect;
    v3->_sampleRect = v4;

    v6 = [PXGShader alloc];
    v12[0] = v3->_sampleRect;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXGShader initWithOpcodes:source:uniforms:components:](v6, "initWithOpcodes:source:uniforms:components:", 1, 0, 0, v7, 0);
    shader = v3->_shader;
    v3->_shader = (PXGShader *)v8;

    -[PXGShader setSampler:](v3->_shader, "setSampler:", 1);
  }
  return v3;
}

- (CGRect)sampleRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[PXGUniform float4Value](self->_sampleRect, "float4Value");
  PXRectWithEdges();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setSampleRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat MinX;
  float64x2_t v9;
  float64x2_t v10;
  CGFloat MaxY;
  CGFloat MaxX;
  CGFloat MinY;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  MinY = CGRectGetMinY(a3);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  MaxX = CGRectGetMaxX(v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  MaxY = CGRectGetMaxY(v15);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MinX = CGRectGetMinX(v16);
  v9.f64[0] = MaxY;
  v9.f64[1] = MinX;
  v10.f64[0] = MinY;
  v10.f64[1] = MaxX;
  -[PXGUniform setFloat4Value:](self->_sampleRect, "setFloat4Value:", *(double *)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v10), v9).i64);
}

- (id)shader
{
  return self->_shader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleRect, 0);
  objc_storeStrong((id *)&self->_shader, 0);
}

@end
