@implementation WebEventRegion

- (WebEventRegion)initWithPoints:(CGPoint)a3 :(CGPoint)a4 :(CGPoint)a5 :(CGPoint)a6
{
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  WebEventRegion *result;
  objc_super v15;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  v10 = a4.y;
  v11 = a4.x;
  v12 = a3.y;
  v13 = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)WebEventRegion;
  result = -[WebEventRegion init](&v15, sel_init);
  if (result)
  {
    result->p1.x = v13;
    result->p1.y = v12;
    result->p2.x = v11;
    result->p2.y = v10;
    result->p3.x = v9;
    result->p3.y = v8;
    result->p4.x = x;
    result->p4.y = y;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("p1:{%g, %g} p2:{%g, %g} p3:{%g, %g} p4:{%g, %g}"), *(_QWORD *)&self->p1.x, *(_QWORD *)&self->p1.y, *(_QWORD *)&self->p2.x, *(_QWORD *)&self->p2.y, *(_QWORD *)&self->p3.x, *(_QWORD *)&self->p3.y, *(_QWORD *)&self->p4.x, *(_QWORD *)&self->p4.y);
}

- (BOOL)hitTest:(CGPoint)a3
{
  double y;
  double x;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  BOOL result;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  __int128 v41;

  y = a3.y;
  x = a3.x;
  if (self)
  {
    -[WebEventRegion quad](self, "quad");
    v6 = *((float *)&v41 + 1);
    v5 = *(float *)&v41;
    v7 = v38;
    v8 = v37;
    v9 = v40;
    v10 = v39;
  }
  else
  {
    v41 = 0u;
    v9 = 0.0;
    v10 = 0.0;
    v7 = 0.0;
    v6 = 0.0;
    v8 = 0.0;
    v5 = 0.0;
  }
  v11 = x;
  v12 = y;
  v13 = v5 - v8;
  v14 = v6 - v7;
  v15 = v10 - v8;
  v16 = v9 - v7;
  v17 = v11 - v8;
  v18 = v12 - v7;
  v19 = (float)(v14 * v14) + (float)(v13 * v13);
  v20 = (float)(v14 * (float)(v9 - v7)) + (float)(v13 * v15);
  v21 = (float)(v14 * v18) + (float)(v13 * v17);
  v22 = (float)(v16 * v16) + (float)(v15 * v15);
  v23 = (float)(v18 * v16) + (float)(v15 * v17);
  v24 = 1.0 / (float)((float)(v19 * v22) - (float)(v20 * v20));
  v25 = (float)((float)(v22 * v21) - (float)(v20 * v23)) * v24;
  if (v25 >= 0.0)
  {
    v26 = (float)((float)(v19 * v23) - (float)(v20 * v21)) * v24;
    if (v26 >= 0.0 && (float)(v25 + v26) <= 1.0)
      return 1;
  }
  result = 0;
  v29 = *((float *)&v41 + 2) - v8;
  v30 = *((float *)&v41 + 3) - v7;
  v31 = (float)(v30 * v30) + (float)(v29 * v29);
  v32 = (float)(v14 * v30) + (float)(v29 * v13);
  v33 = (float)(v18 * v30) + (float)(v29 * v17);
  v34 = 1.0 / (float)((float)(v31 * v19) - (float)(v32 * v32));
  v35 = (float)((float)(v19 * v33) - (float)(v32 * v21)) * v34;
  if (v35 >= 0.0)
  {
    v36 = (float)((float)(v31 * v21) - (float)(v32 * v33)) * v34;
    if (v36 >= 0.0)
      return (float)(v35 + v36) <= 1.0;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (self->p1.x != *((double *)a3 + 1) || self->p1.y != *((double *)a3 + 2))
    return 0;
  if (self->p2.x != *((double *)a3 + 3) || self->p2.y != *((double *)a3 + 4))
    return 0;
  if (self->p3.x != *((double *)a3 + 5) || self->p3.y != *((double *)a3 + 6))
    return 0;
  if (self->p4.y == *((double *)a3 + 8))
    return self->p4.x == *((double *)a3 + 7);
  return 0;
}

- (FloatQuad)quad
{
  float32x4_t v3;

  v3 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self[1].var1.m_x), *(float64x2_t *)&self[1].var3.m_x);
  *(float32x4_t *)&retstr->var0.m_x = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->var1.m_x), *(float64x2_t *)&self->var3.m_x);
  *(float32x4_t *)&retstr->var2.m_x = v3;
  return self;
}

- (CGPoint)p1
{
  double x;
  double y;
  CGPoint result;

  x = self->p1.x;
  y = self->p1.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)p2
{
  double x;
  double y;
  CGPoint result;

  x = self->p2.x;
  y = self->p2.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)p3
{
  double x;
  double y;
  CGPoint result;

  x = self->p3.x;
  y = self->p3.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)p4
{
  double x;
  double y;
  CGPoint result;

  x = self->p4.x;
  y = self->p4.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
