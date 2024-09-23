@implementation BezierCurve

- (BezierCurve)initWithDictionary:(id)a3
{
  id v4;
  BezierCurve *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  int v35;
  void *v36;
  int v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)BezierCurve;
  v5 = -[BezierCurve init](&v43, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("p0"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("p1"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("p2"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("p3"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    *(_DWORD *)v5->_p0 = v11;

    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    *(_DWORD *)&v5->_p0[4] = v13;

    objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    *(_DWORD *)&v5->_p0[8] = v15;

    objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatValue");
    *(_DWORD *)&v5->_p0[12] = v17;

    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    *(_DWORD *)v5->_p1 = v19;

    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "floatValue");
    *(_DWORD *)&v5->_p1[4] = v21;

    objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "floatValue");
    *(_DWORD *)&v5->_p1[8] = v23;

    objc_msgSend(v7, "objectAtIndexedSubscript:", 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "floatValue");
    *(_DWORD *)&v5->_p1[12] = v25;

    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "floatValue");
    *(_DWORD *)v5->_p2 = v27;

    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "floatValue");
    *(_DWORD *)&v5->_p2[4] = v29;

    objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "floatValue");
    *(_DWORD *)&v5->_p2[8] = v31;

    objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "floatValue");
    *(_DWORD *)&v5->_p2[12] = v33;

    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "floatValue");
    *(_DWORD *)v5->_p3 = v35;

    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "floatValue");
    *(_DWORD *)&v5->_p3[4] = v37;

    objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "floatValue");
    *(_DWORD *)&v5->_p3[8] = v39;

    objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "floatValue");
    *(_DWORD *)&v5->_p3[12] = v41;

  }
  return v5;
}

- (double)pointAt:(float32x4_t *)a1
{
  double result;

  __asm { FMOV            V3.4S, #3.0 }
  *(_QWORD *)&result = vaddq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_n_f32(a1[4], a2), a2), a2), vaddq_f32(vaddq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_n_f32(a1[1], 1.0 - a2), 1.0 - a2), 1.0 - a2), vmulq_n_f32(vmulq_n_f32(vmulq_n_f32(vmulq_f32(a1[2], _Q3), a2), 1.0 - a2), 1.0 - a2)), vmulq_n_f32(vmulq_n_f32(vmulq_n_f32(vmulq_f32(a1[3], _Q3), a2), a2), 1.0 - a2))).u64[0];
  return result;
}

- (double)derivativeAt:(float32x4_t *)a1
{
  double result;

  __asm
  {
    FMOV            V2.4S, #3.0
    FMOV            V6.4S, #6.0
  }
  *(_QWORD *)&result = vaddq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_f32(a1[4], _Q2), a2), a2), vsubq_f32(vaddq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_f32(a1[3], _Q6), 1.0 - a2), a2), vsubq_f32(vsubq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_f32(a1[2], _Q2), 1.0 - a2), 1.0 - a2), vmulq_n_f32(vmulq_n_f32(vmulq_f32(a1[1], _Q2), 1.0 - a2), 1.0 - a2)), vmulq_n_f32(vmulq_n_f32(vmulq_f32(a1[2], _Q6), 1.0 - a2), a2))), vmulq_n_f32(vmulq_n_f32(vmulq_f32(a1[3], _Q2), a2), a2))).u64[0];
  return result;
}

- (void)scaleBy:(BezierCurve *)self
{
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;

  v3 = vmulq_f32(*(float32x4_t *)self->_p1, v2);
  *(float32x4_t *)self->_p0 = vmulq_f32(*(float32x4_t *)self->_p0, v2);
  *(float32x4_t *)self->_p1 = v3;
  v4 = vmulq_f32(*(float32x4_t *)self->_p2, v2);
  v5 = vmulq_f32(*(float32x4_t *)self->_p3, v2);
  *(float32x4_t *)self->_p2 = v4;
  *(float32x4_t *)self->_p3 = v5;
}

- (double)p0
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 16), 16, 1, 0);
  return *(double *)&v2;
}

- (void)setP0:(BezierCurve *)self
{
  __int128 v2;
  __int128 v3;

  v3 = v2;
  objc_copyStruct(self->_p0, &v3, 16, 1, 0);
}

- (double)p1
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 32), 16, 1, 0);
  return *(double *)&v2;
}

- (void)setP1:(BezierCurve *)self
{
  __int128 v2;
  __int128 v3;

  v3 = v2;
  objc_copyStruct(self->_p1, &v3, 16, 1, 0);
}

- (double)p2
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 48), 16, 1, 0);
  return *(double *)&v2;
}

- (void)setP2:(BezierCurve *)self
{
  __int128 v2;
  __int128 v3;

  v3 = v2;
  objc_copyStruct(self->_p2, &v3, 16, 1, 0);
}

- (double)p3
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 64), 16, 1, 0);
  return *(double *)&v2;
}

- (void)setP3:(BezierCurve *)self
{
  __int128 v2;
  __int128 v3;

  v3 = v2;
  objc_copyStruct(self->_p3, &v3, 16, 1, 0);
}

@end
