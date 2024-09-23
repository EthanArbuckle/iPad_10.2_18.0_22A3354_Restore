uint64_t RB::Stroke::Flattener<RB::Stroke::Particle>::flush_lineto(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = result;
  if (!a2)
  {
    if (!*(_BYTE *)(result + 49))
      return result;
    v3 = *(unsigned __int8 *)(result + 53);
    goto LABEL_7;
  }
  result = RB::Stroke::Flattener<RB::Stroke::Particle>::flush_empty_line(result);
  if ((result & 1) == 0 && *(_BYTE *)(v2 + 49))
  {
    v3 = 1;
LABEL_7:
    result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, double))(**(_QWORD **)(v2 + 8) + 16))(*(_QWORD *)(v2 + 8), v2 + 64, v3, *(double *)(v2 + 56));
    *(_BYTE *)(v2 + 49) = 0;
    *(_BYTE *)(v2 + 52) = 1;
  }
  return result;
}

uint64_t RB::Stroke::Flattener<RB::Stroke::Particle>::flush_empty_line(uint64_t a1)
{
  uint64_t v2;

  if (!*(_BYTE *)(a1 + 50) || !*(_BYTE *)(a1 + 51))
    return 0;
  (*(void (**)(_QWORD, _QWORD, double))(**(_QWORD **)(a1 + 8) + 32))(*(_QWORD *)(a1 + 8), 0, COERCE_DOUBLE(1065353216));
  v2 = 1;
  (*(void (**)(_QWORD, uint64_t, uint64_t, double))(**(_QWORD **)(a1 + 8) + 16))(*(_QWORD *)(a1 + 8), a1 + 136, 1, *(double *)(a1 + 120));
  (*(void (**)(_QWORD, uint64_t, double))(**(_QWORD **)(a1 + 8) + 32))(*(_QWORD *)(a1 + 8), 1, COERCE_DOUBLE(1065353216));
  *(_BYTE *)(a1 + 104) = 0;
  *(_WORD *)(a1 + 51) = 256;
  return v2;
}

uint64_t RB::Stroke::Flattener<RB::Stroke::Particle>::flush_lineto(uint64_t result, int a2, float32x2_t a3)
{
  uint64_t v3;
  uint64_t v4;
  float32x2_t v5;
  int32x2_t v6;
  float32x2_t v7;
  float32x2_t v8;
  int32x2_t v9;
  float32x2_t v10;
  float32x2_t v11;
  float v12;

  v3 = result;
  if (!a2)
  {
    if (!*(_BYTE *)(result + 49))
      return result;
    v4 = *(unsigned __int8 *)(result + 53);
    if (!*(_BYTE *)(result + 53))
    {
      if (*(_BYTE *)(result + 104) && *(_DWORD *)(result + 108) == 1)
      {
        v5 = *(float32x2_t *)(result + 112);
        v6 = (int32x2_t)vmul_f32(v5, v5);
        v6.i32[0] = vadd_f32((float32x2_t)v6, (float32x2_t)vdup_lane_s32(v6, 1)).u32[0];
        v7 = vrsqrte_f32((float32x2_t)v6.u32[0]);
        v8 = vmul_f32(vrsqrts_f32((float32x2_t)v6.u32[0], vmul_f32(v7, v7)), v7);
        v9 = (int32x2_t)vmul_f32(a3, a3);
        v9.i32[0] = vadd_f32((float32x2_t)v9, (float32x2_t)vdup_lane_s32(v9, 1)).u32[0];
        v10 = vrsqrte_f32((float32x2_t)v9.u32[0]);
        v11 = vmul_f32(vrsqrts_f32((float32x2_t)v9.u32[0], vmul_f32(v10, v10)), v10);
        v12 = vaddv_f32(vmul_n_f32(vmul_f32(v5, a3), vmul_f32(vmul_f32(vmul_f32(v8, vrsqrts_f32((float32x2_t)v9.u32[0], vmul_f32(v11, v11))), v11), vrsqrts_f32((float32x2_t)v6.u32[0], vmul_f32(v8, v8))).f32[0]));
        if (v12 > 0.99)
          v4 = 1;
        else
          v4 = 2 * ((float)((float)(v12 + 1.0) * *(float *)(result + 36)) < 2.0);
      }
      else
      {
        v4 = 0;
      }
    }
    goto LABEL_13;
  }
  result = RB::Stroke::Flattener<RB::Stroke::Particle>::flush_empty_line(result);
  if ((result & 1) == 0 && *(_BYTE *)(v3 + 49))
  {
    v4 = 1;
LABEL_13:
    result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, double))(**(_QWORD **)(v3 + 8) + 16))(*(_QWORD *)(v3 + 8), v3 + 64, v4, *(double *)(v3 + 56));
    *(_BYTE *)(v3 + 49) = 0;
    *(_BYTE *)(v3 + 52) = 1;
  }
  return result;
}

float RB::Path::ClipStroke::ClipStroke(uint64_t a1, uint64_t a2, int a3, char a4, uint64_t a5, uint64_t a6, float result)
{
  float v7;

  *(_QWORD *)a1 = off_24C223D60;
  *(_QWORD *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = a3;
  *(float *)(a1 + 20) = result;
  *(_BYTE *)(a1 + 24) = a4;
  *(_QWORD *)(a1 + 32) = a5;
  *(_QWORD *)(a1 + 40) = a6;
  *(_QWORD *)(a1 + 344) = 0;
  *(_QWORD *)(a1 + 352) = 0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 360) = 32;
  if ((a3 & 2) == 0)
  {
    if ((a3 & 1) == 0)
      return result;
LABEL_7:
    result = 1.0 - result;
    *(float *)(a1 + 20) = result;
    return result;
  }
  v7 = fmaxf(result, 0.0);
  if ((a3 & 4) == 0)
    result = v7;
  result = fminf(result, 1.0);
  *(float *)(a1 + 20) = result;
  if ((a3 & 1) != 0)
    goto LABEL_7;
  return result;
}

_QWORD *RB::Path::ClipStroke::DistanceMap::append(_QWORD *this, double a2, double a3, double a4)
{
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  double v11;
  double v12;
  unint64_t v13;
  _QWORD *v14;
  double *v15;

  v7 = this;
  v8 = this[13];
  if (v8
    && (this[12] ? (v9 = (_QWORD *)this[12]) : (v9 = this),
        (v10 = 3 * (v8 - 1), v11 = *(double *)&v9[v10], v12 = *(double *)&v9[v10 + 2], fabs(v11 - a2 + v12) < 1.0)
     && fabs(v12 - a3 + *(double *)&v9[3 * v8 - 2]) < 1.0))
  {
    *(double *)&v9[v10 + 2] = a4 + a2 - v11;
  }
  else
  {
    v13 = v8 + 1;
    if (this[14] < (unint64_t)(v8 + 1))
    {
      this = RB::vector<RB::CustomShader::Value,4ul,unsigned long>::reserve_slow(this, v13);
      v8 = v7[13];
      v13 = v8 + 1;
    }
    v14 = (_QWORD *)v7[12];
    if (!v14)
      v14 = v7;
    v15 = (double *)&v14[3 * v8];
    *v15 = a2;
    v15[1] = a3;
    v15[2] = a4;
    v7[13] = v13;
  }
  return this;
}

double RB::Path::ClipStroke::DistanceMap::operator()(uint64_t a1, double a2)
{
  double *v2;
  unint64_t v3;
  double *v4;
  unint64_t v5;
  double *v6;
  double v7;
  double *v8;
  double v9;

  v2 = *(double **)(a1 + 96);
  v3 = *(_QWORD *)(a1 + 104);
  if (!v2)
    v2 = (double *)a1;
  if (!v3)
    return INFINITY;
  v4 = &v2[3 * v3];
  do
  {
    v5 = v3 >> 1;
    v6 = &v2[3 * (v3 >> 1)];
    v7 = *v6 + 0.0001 + v6[2];
    v8 = v6 + 3;
    v3 += ~(v3 >> 1);
    if (v7 < a2)
      v2 = v8;
    else
      v3 = v5;
  }
  while (v3);
  if (v2 != v4 && (v9 = a2 - *v2, v9 >= -0.0001))
    return v2[1] + v9;
  else
    return INFINITY;
}

uint64_t RB::Path::ClipStroke::Subpath::replay(uint64_t result, uint64_t a2, int a3, float64x2_t *a4)
{
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  double *v10;
  int v11;
  __n128 v12;
  __n128 v13;
  float64x2_t v14;
  __n128 v15;
  __n128 v16;
  float64x2_t v17;
  __n128 v18;
  __n128 v19;
  uint64_t v20;

  if (*(_QWORD *)(result + 288))
  {
    v7 = result;
    v8 = *(__n128 *)result;
    if (a4)
      v8 = (__n128)vmlaq_laneq_f64(vmlaq_n_f64(a4[2], *a4, *(double *)result), a4[1], (float64x2_t)v8, 1);
    v9 = 24;
    if (a3)
      v9 = 16;
    result = (*(uint64_t (**)(uint64_t, __n128))(*(_QWORD *)a2 + v9))(a2, v8);
    if (*(uint64_t *)(v7 + 288) >= 1)
    {
      if (*(_QWORD *)(v7 + 280))
        v10 = *(double **)(v7 + 280);
      else
        v10 = (double *)(v7 + 24);
      do
      {
        v11 = (int)*v10;
        switch(v11)
        {
          case 4:
            v16 = *(__n128 *)(v10 + 2);
            if (a4)
            {
              v17 = a4[1];
              v18 = (__n128)vmlaq_n_f64(vmlaq_n_f64(a4[2], *a4, v10[4]), v17, v10[5]);
              v19 = (__n128)vmlaq_n_f64(vmlaq_n_f64(a4[2], *a4, v10[6]), v17, v10[7]);
              v16 = (__n128)vmlaq_laneq_f64(vmlaq_n_f64(a4[2], *a4, v10[2]), v17, (float64x2_t)v16, 1);
            }
            else
            {
              v18 = *(__n128 *)(v10 + 4);
              v19 = *(__n128 *)(v10 + 6);
            }
            result = (*(uint64_t (**)(uint64_t, __n128, __n128, __n128))(*(_QWORD *)a2 + 40))(a2, v16, v18, v19);
            v10 += 8;
            break;
          case 3:
            v13 = *(__n128 *)(v10 + 2);
            if (a4)
            {
              v14 = a4[1];
              v15 = (__n128)vmlaq_n_f64(vmlaq_n_f64(a4[2], *a4, v10[4]), v14, v10[5]);
              v13 = (__n128)vmlaq_laneq_f64(vmlaq_n_f64(a4[2], *a4, v10[2]), v14, (float64x2_t)v13, 1);
            }
            else
            {
              v15 = *(__n128 *)(v10 + 4);
            }
            result = (*(uint64_t (**)(uint64_t, __n128, __n128))(*(_QWORD *)a2 + 32))(a2, v13, v15);
            v10 += 6;
            break;
          case 2:
            v12 = *(__n128 *)(v10 + 2);
            if (a4)
              v12 = (__n128)vmlaq_laneq_f64(vmlaq_n_f64(a4[2], *a4, v10[2]), a4[1], (float64x2_t)v12, 1);
            result = (*(uint64_t (**)(uint64_t, __n128))(*(_QWORD *)a2 + 24))(a2, v12);
            v10 += 4;
            break;
        }
        v20 = *(_QWORD *)(v7 + 280);
        if (!v20)
          v20 = v7 + 24;
      }
      while ((unint64_t)v10 < v20 + 8 * *(_QWORD *)(v7 + 288));
    }
    if (a3)
      return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 8))(a2);
  }
  return result;
}

double RB::Path::ClipStroke::Subpath::close(RB::Path::ClipStroke::Subpath *this, __n128 a2)
{
  uint64_t v2;
  char *v3;
  char *v4;
  double v5;

  v2 = *((_QWORD *)this + 36);
  if (v2)
  {
    v3 = (char *)this + 24;
    if (*((_QWORD *)this + 35))
      v3 = (char *)*((_QWORD *)this + 35);
    v4 = &v3[8 * v2];
    a2.n128_u64[0] = *(_QWORD *)this;
    if (*(double *)this != *((double *)v4 - 2))
    {
      v5 = *((double *)this + 1);
LABEL_7:
      a2.n128_f64[1] = v5;
      a2.n128_f64[0] = RB::Path::ClipStroke::Subpath::add_lineto((uint64_t)this, a2, INFINITY);
      return a2.n128_f64[0];
    }
    v5 = *((double *)this + 1);
    if (v5 != *((double *)v4 - 1))
      goto LABEL_7;
  }
  return a2.n128_f64[0];
}

double RB::Path::ClipStroke::Subpath::add_lineto(uint64_t a1, __n128 a2, double a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  __n128 *v9;
  double *v10;
  double *n128_f64;
  double v12;
  double v13;
  double result;
  __n128 v15;

  v5 = a1 + 24;
  v6 = *(_QWORD *)(a1 + 288);
  v7 = v6 + 4;
  if (v6 <= 0xFFFFFFFFFFFFFFFBLL && *(_QWORD *)(a1 + 296) < v7)
  {
    v15 = a2;
    RB::vector<RB::DisplayList::Item const*,32ul,unsigned long>::reserve_slow((void *)(a1 + 24), v6 + 4);
    a2 = v15;
  }
  *(_QWORD *)(a1 + 288) = v7;
  v8 = *(_QWORD *)(a1 + 280);
  if (!v8)
    v8 = v5;
  v9 = (__n128 *)(v8 + 8 * v6);
  v10 = (double *)(a1 + 8);
  n128_f64 = v9[-1].n128_f64;
  if (v6)
    v10 = &v9[-1].n128_f64[1];
  else
    n128_f64 = (double *)a1;
  v12 = *v10;
  v13 = *n128_f64;
  v9->n128_u64[0] = 0x4000000000000000;
  if ((*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
    a3 = sqrt((a2.n128_f64[1] - v12) * (a2.n128_f64[1] - v12) + (a2.n128_f64[0] - v13) * (a2.n128_f64[0] - v13));
  v9->n128_f64[1] = a3;
  v9[1] = a2;
  result = *(double *)(a1 + 16) + a3;
  *(double *)(a1 + 16) = result;
  return result;
}

void RB::Path::ClipStroke::Subpath::append_range(__n128 *this, const RB::Path::ClipStroke::Subpath *a2, double a3, double a4, RB::Path::ClipStroke::DistanceMap *a5)
{
  char *v10;
  char *v11;
  double v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  double v20;
  double v21;
  __int128 v22;
  double v23;
  double v24;
  char *v25;
  float64x2_t v26;
  uint64_t v27;
  uint64_t v28;
  Point v29[4];
  Point v30[4];
  Point v31[4];
  Point v32[4];

  *(_OWORD *)&v32[0].v = *(_OWORD *)a2;
  if (*((uint64_t *)a2 + 36) >= 1)
  {
    v10 = (char *)a2 + 24;
    if (*((_QWORD *)a2 + 35))
      v11 = (char *)*((_QWORD *)a2 + 35);
    else
      v11 = (char *)a2 + 24;
    v12 = 0.0;
    do
    {
      v13 = (int)*(double *)v11;
      switch(v13)
      {
        case 4:
          v22 = *((_OWORD *)v11 + 1);
          *(_OWORD *)&v30[0].v = *((_OWORD *)v11 + 2);
          *(_OWORD *)&v31[0].v = v22;
          *(_OWORD *)&v29[0].v = *((_OWORD *)v11 + 3);
          CG::Cubic::Cubic((CG::Cubic *)&v26, v32, v31, v30, v29);
          v23 = *((double *)v11 + 1);
          v17 = v23 + v12;
          v24 = a4;
          if (a4 <= a3)
          {
            RB::Path::ClipStroke::Subpath::add<CG::Cubic>(this, &v26, a5, v12, *((double *)v11 + 1), v12, a4);
            v24 = v23 + v12;
          }
          RB::Path::ClipStroke::Subpath::add<CG::Cubic>(this, &v26, a5, v12, v23, a3, v24);
          *(_OWORD *)&v32[0].v = *(_OWORD *)&v29[0].v;
          v11 += 64;
          break;
        case 3:
          v19 = *((_OWORD *)v11 + 1);
          *(_OWORD *)&v30[0].v = *((_OWORD *)v11 + 2);
          *(_OWORD *)&v31[0].v = v19;
          CG::Quadratic::Quadratic((CG::Quadratic *)&v26, v32, v31, v30);
          v20 = *((double *)v11 + 1);
          v17 = v20 + v12;
          v21 = a4;
          if (a4 <= a3)
          {
            RB::Path::ClipStroke::Subpath::add<CG::Quadratic>(this, (CG::Quadratic *)&v26, a5, v12, *((double *)v11 + 1), v12, a4);
            v21 = v20 + v12;
          }
          RB::Path::ClipStroke::Subpath::add<CG::Quadratic>(this, (CG::Quadratic *)&v26, a5, v12, v20, a3, v21);
          *(_OWORD *)&v32[0].v = *(_OWORD *)&v30[0].v;
          v11 += 48;
          break;
        case 2:
          v14 = *((_QWORD *)v11 + 2);
          v15 = *((_QWORD *)v11 + 3);
          v26 = *(float64x2_t *)&v32[0].v;
          v27 = v14;
          v28 = v15;
          v16 = *((double *)v11 + 1);
          v17 = v16 + v12;
          v18 = a4;
          if (a4 <= a3)
          {
            RB::Path::ClipStroke::Subpath::add<CG::LineSegment>((RB::Path::ClipStroke::Subpath *)this, &v26, a5, v12, *((double *)v11 + 1), v12, a4);
            v18 = v16 + v12;
          }
          RB::Path::ClipStroke::Subpath::add<CG::LineSegment>((RB::Path::ClipStroke::Subpath *)this, &v26, a5, v12, v16, a3, v18);
          *(_QWORD *)&v32[0].v = v14;
          *(_QWORD *)&v32[2].v = v15;
          v11 += 32;
          break;
        default:
          v17 = v12;
          break;
      }
      v25 = (char *)*((_QWORD *)a2 + 35);
      if (!v25)
        v25 = v10;
      v12 = v17;
    }
    while (v11 < &v25[8 * *((_QWORD *)a2 + 36)]);
  }
}

void RB::Path::ClipStroke::Subpath::append_logical_range(__n128 *this, const RB::Path::ClipStroke::Subpath *a2, double a3, double a4, RB::Path::ClipStroke::DistanceMap *a5)
{
  if (a3 > a4)
  {
    RB::Path::ClipStroke::Subpath::append_range(this, a2, a3, *((double *)a2 + 2), a5);
    a3 = 0.0;
  }
  RB::Path::ClipStroke::Subpath::append_range(this, a2, a3, a4, a5);
}

double RB::Path::ClipStroke::Subpath::add_quadto(__n128 *a1, __n128 a2, __n128 a3, double a4)
{
  uint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  __n128 *v10;
  __n128 v11;
  uint64_t *v12;
  double v13;
  double result;
  __n128 v15;
  __n128 v16;
  Point v17[4];
  Point v18[4];
  _BYTE v19[80];
  Point v20[4];

  v6 = &a1[1].n128_i64[1];
  v7 = a1[18].n128_u64[0];
  v8 = v7 + 6;
  v15 = a2;
  v16 = a3;
  if (v7 >= 0xFFFFFFFFFFFFFFFALL)
  {
    a1[18].n128_u64[0] = v8;
    v12 = (uint64_t *)a1[17].n128_u64[1];
    if (!v12)
      v12 = &a1[1].n128_i64[1];
    v10 = (__n128 *)&v12[v7];
  }
  else
  {
    if (a1[18].n128_u64[1] < v8)
    {
      RB::vector<RB::DisplayList::Item const*,32ul,unsigned long>::reserve_slow(&a1[1].n128_i8[8], v7 + 6);
      a2 = v15;
      a3 = v16;
    }
    a1[18].n128_u64[0] = v8;
    v9 = (uint64_t *)a1[17].n128_u64[1];
    if (!v9)
      v9 = v6;
    v10 = (__n128 *)&v9[v7];
    if (!v7)
    {
      v11 = *a1;
      goto LABEL_12;
    }
  }
  v11 = v10[-1];
LABEL_12:
  *(__n128 *)&v20[0].v = v11;
  *(__n128 *)&v17[0].v = a3;
  *(__n128 *)&v18[0].v = a2;
  CG::Quadratic::Quadratic((CG::Quadratic *)v19, v20, v18, v17);
  v10->n128_u64[0] = 0x4008000000000000;
  if ((*(_QWORD *)&a4 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    CG::Quadratic::length((CG::Quadratic *)v19, 0);
    a4 = v13;
  }
  v10->n128_f64[1] = a4;
  v10[1] = v15;
  v10[2] = v16;
  result = a1[1].n128_f64[0] + a4;
  a1[1].n128_f64[0] = result;
  return result;
}

double RB::Path::ClipStroke::Subpath::add_cubeto(__n128 *a1, __n128 a2, __n128 a3, __n128 a4, double a5)
{
  uint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  __n128 *v11;
  __n128 v12;
  uint64_t *v13;
  double result;
  __n128 v15;
  __n128 v16;
  __n128 v17;
  Point v18[4];
  Point v19[4];
  Point v20[4];
  _BYTE v21[112];
  Point v22[4];

  v7 = &a1[1].n128_i64[1];
  v8 = a1[18].n128_u64[0];
  v9 = v8 + 8;
  v16 = a3;
  v17 = a4;
  v15 = a2;
  if (v8 >= 0xFFFFFFFFFFFFFFF8)
  {
    a1[18].n128_u64[0] = v9;
    v13 = (uint64_t *)a1[17].n128_u64[1];
    if (!v13)
      v13 = &a1[1].n128_i64[1];
    v11 = (__n128 *)&v13[v8];
  }
  else
  {
    if (a1[18].n128_u64[1] < v9)
    {
      RB::vector<RB::DisplayList::Item const*,32ul,unsigned long>::reserve_slow(&a1[1].n128_i8[8], v8 + 8);
      a2 = v15;
      a3 = v16;
      a4 = v17;
    }
    a1[18].n128_u64[0] = v9;
    v10 = (uint64_t *)a1[17].n128_u64[1];
    if (!v10)
      v10 = v7;
    v11 = (__n128 *)&v10[v8];
    if (!v8)
    {
      v12 = *a1;
      goto LABEL_12;
    }
  }
  v12 = v11[-1];
LABEL_12:
  *(__n128 *)&v22[0].v = v12;
  *(__n128 *)&v19[0].v = a3;
  *(__n128 *)&v20[0].v = a2;
  *(__n128 *)&v18[0].v = a4;
  CG::Cubic::Cubic((CG::Cubic *)v21, v22, v20, v19, v18);
  v11->n128_u64[0] = 0x4010000000000000;
  if ((*(_QWORD *)&a5 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
    a5 = CG::Cubic::length((CG::Cubic *)v21, 0.5);
  v11->n128_f64[1] = a5;
  v11[1] = v15;
  v11[2] = v16;
  v11[3] = v17;
  result = a1[1].n128_f64[0] + a5;
  a1[1].n128_f64[0] = result;
  return result;
}

double RB::Path::ClipStroke::Subpath::add(RB::Path::ClipStroke::Subpath *this, float64x2_t *a2, double a3)
{
  __n128 v5;
  float64x2_t v6;
  uint64_t v8;
  char *v9;
  char *v10;
  double v11;

  v5 = *(__n128 *)a2;
  v6 = vsubq_f64(a2[1], *a2);
  if (vaddvq_f64(vmulq_f64(v6, v6)) <= 0.00000001)
    return *((double *)this + 2);
  v8 = *((_QWORD *)this + 36);
  if (v8)
  {
    v9 = (char *)this + 24;
    if (*((_QWORD *)this + 35))
      v9 = (char *)*((_QWORD *)this + 35);
    v10 = &v9[8 * v8];
    if (v5.n128_f64[0] != *((double *)v10 - 2) || v5.n128_f64[1] != *((double *)v10 - 1))
      RB::Path::ClipStroke::Subpath::add_lineto((uint64_t)this, v5, INFINITY);
  }
  else
  {
    *(__n128 *)this = v5;
    *((_QWORD *)this + 2) = 0;
    *((_QWORD *)this + 36) = 0;
  }
  v11 = *((double *)this + 2);
  RB::Path::ClipStroke::Subpath::add_lineto((uint64_t)this, (__n128)a2[1], a3);
  return v11;
}

double RB::Path::ClipStroke::Subpath::add(__n128 *this, const CG::Quadratic *a2, double a3)
{
  __n128 v6;
  float64x2_t v7;
  float64x2_t v8;
  unint64_t v9;
  __int8 *v10;
  char *v11;
  double v12;

  v6 = *(__n128 *)a2;
  v7 = *((float64x2_t *)a2 + 1);
  v8 = vsubq_f64(v7, *(float64x2_t *)a2);
  if (vaddvq_f64(vmulq_f64(v8, v8)) <= 0.00000001
    && (*((double *)a2 + 4) - v7.f64[0]) * (*((double *)a2 + 4) - v7.f64[0])
     + (*((double *)a2 + 5) - v7.f64[1]) * (*((double *)a2 + 5) - v7.f64[1]) <= 0.00000001)
  {
    return this[1].n128_f64[0];
  }
  v9 = this[18].n128_u64[0];
  if (v9)
  {
    v10 = &this[1].n128_i8[8];
    if (this[17].n128_u64[1])
      v10 = (__int8 *)this[17].n128_u64[1];
    v11 = &v10[8 * v9];
    if (v6.n128_f64[0] != *((double *)v11 - 2) || v6.n128_f64[1] != *((double *)v11 - 1))
      RB::Path::ClipStroke::Subpath::add_lineto((uint64_t)this, v6, INFINITY);
  }
  else
  {
    *this = v6;
    this[1].n128_u64[0] = 0;
    this[18].n128_u64[0] = 0;
  }
  v12 = this[1].n128_f64[0];
  RB::Path::ClipStroke::Subpath::add_quadto(this, *((__n128 *)a2 + 1), *((__n128 *)a2 + 2), a3);
  return v12;
}

double RB::Path::ClipStroke::Subpath::add(__n128 *this, const CG::Cubic *a2, double a3)
{
  __n128 v6;
  float64x2_t v7;
  float64x2_t v8;
  double v9;
  double v10;
  unint64_t v11;
  __int8 *v12;
  char *v13;
  double v14;

  v6 = *(__n128 *)a2;
  v7 = *((float64x2_t *)a2 + 1);
  v8 = vsubq_f64(v7, *(float64x2_t *)a2);
  if (vaddvq_f64(vmulq_f64(v8, v8)) <= 0.00000001)
  {
    v9 = *((double *)a2 + 4);
    v10 = *((double *)a2 + 5);
    if ((v9 - v7.f64[0]) * (v9 - v7.f64[0]) + (v10 - v7.f64[1]) * (v10 - v7.f64[1]) <= 0.00000001
      && (*((double *)a2 + 6) - v9) * (*((double *)a2 + 6) - v9)
       + (*((double *)a2 + 7) - v10) * (*((double *)a2 + 7) - v10) <= 0.00000001)
    {
      return this[1].n128_f64[0];
    }
  }
  v11 = this[18].n128_u64[0];
  if (v11)
  {
    v12 = &this[1].n128_i8[8];
    if (this[17].n128_u64[1])
      v12 = (__int8 *)this[17].n128_u64[1];
    v13 = &v12[8 * v11];
    if (v6.n128_f64[0] != *((double *)v13 - 2) || v6.n128_f64[1] != *((double *)v13 - 1))
      RB::Path::ClipStroke::Subpath::add_lineto((uint64_t)this, v6, INFINITY);
  }
  else
  {
    *this = v6;
    this[1].n128_u64[0] = 0;
    this[18].n128_u64[0] = 0;
  }
  v14 = this[1].n128_f64[0];
  RB::Path::ClipStroke::Subpath::add_cubeto(this, *((__n128 *)a2 + 1), *((__n128 *)a2 + 2), *((__n128 *)a2 + 3), a3);
  return v14;
}

BOOL RB::Path::ClipStroke::value_clipped(RB::Path::ClipStroke *this, float a2)
{
  if ((*((_DWORD *)this + 4) & 1) != 0)
  {
    if (a2 < 1.0 || (*((_DWORD *)this + 4) & 4) == 0)
      return fmaxf(*((float *)this + 5), 0.0) >= a2;
  }
  else if (a2 > 0.0 || (*((_DWORD *)this + 4) & 4) == 0)
  {
    return fminf(*((float *)this + 5), 1.0) <= a2;
  }
  return 0;
}

void RB::Path::ClipStroke::moveto(RB::Path::ClipStroke *this, uint64_t a2, __n128 a3)
{
  __n128 v4;

  if (*((float *)this + 5) == (float)((*((_DWORD *)this + 4) & 1) == 0))
  {
    (*(void (**)(_QWORD))(**((_QWORD **)this + 1) + 16))(*((_QWORD *)this + 1));
  }
  else
  {
    if (*((_QWORD *)this + 44))
    {
      v4 = a3;
      RB::Path::ClipStroke::closepath(this, a2);
      a3 = v4;
    }
    *((__n128 *)this + 4) = a3;
    *((_QWORD *)this + 10) = 0;
    *((_QWORD *)this + 44) = 0;
  }
}

void RB::Path::ClipStroke::closepath(RB::Path::ClipStroke *this, uint64_t a2)
{
  uint64_t v3;
  __int128 *v4;
  char *v5;
  char *v6;
  __n128 v7;
  double v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  float v13;
  float v14;
  int v15;
  uint64_t v16;
  float *v17;
  int v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  float *v23;
  float v24;
  int v25;
  float *v26;
  float v27;
  float v28;
  float v29;
  float *v30;
  uint64_t v31;
  float v32;
  BOOL v33;
  __n128 *v35;
  float v36;
  double v37;
  float v38;
  unint64_t v39;
  unint64_t v40;
  float *v41;
  uint64_t v42;
  float *v43;
  double v44;
  float v45;
  double v46;
  double v47;
  double v48;
  double v49;
  BOOL v50;
  float v51;
  float v52;
  double v53;
  double v54;
  float *v55;
  float *v56;
  float *v57;
  char v58;
  int v59;
  float *v60;
  float v61;
  float *v62;
  double v63;
  double v64;
  double v65;
  float v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  __n128 v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  float *v76;
  unsigned int v77;
  float v78;
  unsigned int v79;
  double v80;
  double v81;
  int v82;
  double v83;
  float v84;
  unint64_t v86;
  char *v87;
  int v88;
  _QWORD *v89;
  uint64_t v90;
  _QWORD *v91;
  int64x2_t v92;
  _QWORD *v93;
  _QWORD *v94;
  _QWORD *v95;
  __int128 v96;
  __int128 *v97;
  __int128 v98;
  __int128 *v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  float64x2_t v106;
  __n128 v107;
  unsigned int v108;
  float v109;
  int v110;
  unsigned int v111;
  double v112;
  double v113;
  double v114;
  float v115;
  float v116;
  float v118;
  unint64_t v119;
  float *v120;
  unint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  float v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  float64x2_t v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  float v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  float64x2_t v143;
  float *v144;
  void *v145;
  __n128 v146[18];
  uint64_t v147;
  uint64_t v148;
  int64x2_t v149;
  __int128 *v150;
  __int128 *v151;
  _QWORD *v152;
  _QWORD *v153;
  _QWORD *v154;
  uint64_t v155;
  unint64_t v156;
  const RB::Path::ClipStroke::Subpath *v157;
  __n128 *v158;
  float *v159;
  int v160;
  double v161;
  float v162;
  double v163;
  double v164;
  double v165;
  __n128 *v166;
  __n128 *v167;
  _QWORD *v168;
  uint64_t v169;
  double v170;
  _QWORD v171[2];
  __int128 v172;
  uint64_t v173;
  __int128 v174;
  uint64_t v175;
  float v176;
  int64x2_t v177;
  _QWORD v178[3];
  int64x2_t v179;
  _QWORD v180[3];
  BOOL v181;
  char v182;
  double v183;
  _QWORD *v184;
  uint64_t v185;
  uint64_t v186;
  float *v187;
  unint64_t v188;
  unint64_t v189;
  _QWORD *v190;
  uint64_t v191;
  uint64_t v192;
  _BYTE v193[96];
  void *v194;
  uint64_t v195;
  uint64_t v196;
  __n128 v197;
  double v198;
  _QWORD *v199;
  uint64_t v200;
  double v201;
  uint64_t v202;
  uint64_t v203;
  __int128 v204;
  uint64_t v205;
  __int128 v206;
  uint64_t v207;
  float v208;
  int64x2_t v209;
  uint64_t v210;
  uint64_t v211;
  int64x2_t v212;
  uint64_t v213;
  uint64_t v214;
  BOOL v215;
  char v216;
  void *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;

  v220 = *MEMORY[0x24BDAC8D0];
  if (*((float *)this + 5) == (float)((*((_DWORD *)this + 4) & 1) == 0))
  {
    (*(void (**)(_QWORD))(**((_QWORD **)this + 1) + 8))(*((_QWORD *)this + 1));
    return;
  }
  v3 = *((_QWORD *)this + 44);
  if (!v3)
  {
    ++*((_QWORD *)this + 7);
    return;
  }
  v4 = (__int128 *)((char *)this + 64);
  v5 = (char *)this + 88;
  if (*((_QWORD *)this + 43))
    v5 = (char *)*((_QWORD *)this + 43);
  v6 = &v5[8 * v3];
  v7.n128_u64[0] = *((_QWORD *)this + 8);
  if (v7.n128_f64[0] == *((double *)v6 - 2))
  {
    v8 = *((double *)this + 9);
    if (v8 == *((double *)v6 - 1))
      goto LABEL_10;
  }
  else
  {
    v8 = *((double *)this + 9);
  }
  v7.n128_f64[1] = v8;
  RB::Path::ClipStroke::Subpath::add_lineto((uint64_t)this + 64, v7, INFINITY);
LABEL_10:
  v9 = 0;
  v10 = *((_QWORD *)this + 6);
  v11 = *((_QWORD *)this + 4);
  while (1)
  {
    v12 = v10 + v9;
    if (v12 >= *((_QWORD *)this + 5))
      break;
    v13 = floorf(*(float *)(v11 + 16 * v12 + 8));
    v14 = (float)*((unint64_t *)this + 7);
    if (v13 >= v14)
    {
      v15 = v9;
    }
    else
    {
      ++v10;
      v15 = 0;
    }
    v9 = v15 + 1;
    if (v13 > v14)
    {
      v16 = v15;
      v9 = v15;
      v12 = v10 + v15;
      goto LABEL_19;
    }
  }
  v16 = v9;
LABEL_19:
  v17 = (float *)(v11 + 16 * v10);
  *((_QWORD *)this + 6) = v12;
  if ((*((_BYTE *)this + 16) & 1) != 0)
    v18 = 1;
  else
    v18 = -1;
  if (v9)
  {
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = (float)v18;
    v23 = v17 + 1;
    v24 = INFINITY;
    do
    {
      v25 = *((_DWORD *)v23 - 1);
      if ((v25 & 2) != 0 && (float)(*v23 * v22) < v24)
      {
        v24 = *v23 * v22;
        v20 = v21;
      }
      v23 += 4;
      v19 |= v25;
      ++v21;
    }
    while (v16 != v21);
  }
  else
  {
    v20 = 0;
    v19 = 0;
    v24 = INFINITY;
  }
  if ((LODWORD(v24) & 0x7FFFFFFFu) >= 0x7F800000)
  {
    *(double *)&v35 = 0.0;
  }
  else
  {
    v26 = &v17[4 * v20];
    v28 = v26[2];
    v27 = v26[3];
    if (v27 >= v28)
      v29 = v26[2];
    else
      v29 = v26[3];
    if (v28 < v27)
      v28 = v26[3];
    if (v9)
    {
      v30 = (float *)(v11 + 16 * v10 + 12);
      v31 = v16;
      do
      {
        if (v20)
        {
          v32 = *(v30 - 1);
          v33 = v29 > v32 || v28 <= v32;
          if (!v33)
            break;
          if (v29 <= *v30 && v28 > *v30)
            break;
        }
        --v20;
        v30 += 4;
        --v31;
      }
      while (v31);
    }
    v36 = MEMORY[0x24BDAC7A8](this, a2).n128_f32[0];
    *(double *)&v35 = COERCE_DOUBLE(v146);
    memset(v146, 0, sizeof(v146));
    v147 = 0;
    v148 = 32;
    RB::Path::ClipStroke::Subpath::append_logical_range(v146, (RB::Path::ClipStroke *)((char *)this + 64), (v36 - floor(v36)) * v37, (v38 - floor(v38)) * v37, 0);
  }
  v190 = 0;
  v191 = 0;
  v192 = 0;
  if ((v19 & 1) != 0)
  {
    v158 = v35;
    v217 = 0;
    v198 = 0.0;
    v197 = 0uLL;
    v218 = 0;
    v219 = 32;
    v195 = 0;
    v194 = 0;
    v196 = 4;
    v187 = 0;
    v188 = 0;
    v189 = 0;
    v184 = 0;
    v185 = 0;
    v186 = 0;
    if (v16)
    {
      v39 = 0;
      v159 = 0;
      v155 = 0;
      v156 = 0;
      v153 = v178;
      v154 = v171;
      v151 = &v172;
      v152 = v180;
      v150 = &v174;
      v149 = vdupq_n_s64(0x7FF0000000000000uLL);
      v40 = v16;
      do
      {
        v41 = &v17[4 * v39];
        if ((*(_BYTE *)v41 & 1) != 0
          && !RB::Path::ClipStroke::value_clipped(this, *(v41 - 3))
          && RB::Path::ClipStroke::value_clipped(this, v41[5]))
        {
          v42 = 0;
          v43 = &v17[4 * v39];
          v44 = INFINITY;
          v45 = v43[3] - v43[2];
          v46 = 0.0;
          if (v45 >= -0.5)
            v47 = 0.0;
          else
            v47 = 1.0;
          v33 = v45 <= 0.5;
          v48 = v45;
          if (!v33)
            v47 = -1.0;
          v49 = v47 + v48;
          v50 = v49 < 0.0;
          if (v49 >= 0.0)
            v51 = v43[3];
          else
            v51 = v43[2];
          if (v50)
            v52 = v43[3];
          else
            v52 = v43[2];
          v53 = INFINITY;
          v54 = 0.0;
          do
          {
            if (v39 != v42)
            {
              v55 = &v17[4 * v42];
              v56 = v55 + 2;
              v57 = v55 + 3;
              v58 = 1;
              do
              {
                v59 = v58 & 1;
                v58 = 0;
                if (v59)
                  v60 = v56;
                else
                  v60 = v57;
                v61 = *v60;
                if (v59)
                  v62 = v57;
                else
                  v62 = v56;
                if ((float)(v52 - v61) >= -0.5)
                  v63 = 0.0;
                else
                  v63 = 1.0;
                if ((float)(v52 - v61) <= 0.5)
                  v64 = v63;
                else
                  v64 = -1.0;
                v65 = v64 + (float)(v52 - v61);
                v66 = v61 - v51;
                v67 = v66;
                if (v66 >= -0.5)
                  v68 = 0.0;
                else
                  v68 = 1.0;
                if (v66 <= 0.5)
                  v69 = v68;
                else
                  v69 = -1.0;
                v70 = v69 + v67;
                if (v65 >= 0.0 && v65 < v53)
                {
                  v54 = *v62;
                  v53 = v65;
                }
                if (v70 >= 0.0 && v70 < v44)
                {
                  v46 = *v62;
                  v44 = v70;
                }
              }
              while (v59);
            }
            ++v42;
          }
          while (v42 != v40);
          if ((*(_QWORD *)&v53 & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000
            && (*(_QWORD *)&v44 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
          {
            v71 = *((double *)this + 10);
            v218 = 0;
            v198 = 0.0;
            v197 = 0uLL;
            v195 = 0;
            v164 = v71;
            v157 = (const RB::Path::ClipStroke::Subpath *)v4;
            RB::Path::ClipStroke::Subpath::append_range(&v197, (const RB::Path::ClipStroke::Subpath *)v4, v71 * (v54 - floor(v54)), v71 * (v51 - floor(v51)), (RB::Path::ClipStroke::DistanceMap *)v193);
            RB::Path::ClipStroke::Subpath::close((RB::Path::ClipStroke::Subpath *)&v197, v72);
            v73 = 0;
            v74 = 0;
            v188 = 0;
            v75 = (char *)(v17 + 2);
            v76 = v17 + 2;
            v163 = 1.0 / v198;
            do
            {
              v77 = *((_DWORD *)v76 - 2);
              *(float *)&v161 = *(v76 - 1);
              v78 = *v76;
              v162 = v76[1];
              if (v39 == v74)
                v79 = v77 & 0xFFFFFFFE;
              else
                v79 = v77;
              v80 = v164;
              v81 = RB::Path::ClipStroke::DistanceMap::operator()((uint64_t)v193, (v78 - floor(v78)) * v164);
              *(float *)&v81 = v81 * v163;
              v160 = LODWORD(v81);
              v82 = LODWORD(v81);
              v83 = RB::Path::ClipStroke::DistanceMap::operator()((uint64_t)v193, (v162 - floor(v162)) * v80);
              v84 = v83 * v163;
              if ((v82 & 0x7FFFFFFFu) <= 0x7F7FFFFF && COERCE_UNSIGNED_INT(fabs(v83 * v163)) <= 0x7F7FFFFF)
              {
                v86 = v73 + 1;
                if (v189 < v73 + 1)
                {
                  RB::vector<RB::Fill::Gradient::Stop,0ul,unsigned long>::reserve_slow((uint64_t)&v187, v86);
                  v73 = v188;
                  v86 = v188 + 1;
                }
                v87 = (char *)&v187[4 * v73];
                *(_DWORD *)v87 = v79;
                v88 = v160;
                *((_DWORD *)v87 + 1) = LODWORD(v161);
                *((_DWORD *)v87 + 2) = v88;
                *((float *)v87 + 3) = v84;
                v188 = v86;
                v73 = v86;
              }
              ++v74;
              v76 += 4;
            }
            while (v40 != v74);
            v183 = 0.0;
            if (RB::Path::ClipStroke::make_keyframes((uint64_t)this, (uint64_t)v187, v73, (uint64_t)&v197, (uint64_t *)&v184, &v183))
            {
              v89 = v184;
              v90 = v185;
              v165 = *(double *)&this;
              v166 = &v197;
              v167 = v158;
              v168 = v184;
              v169 = v185;
              v170 = v183;
              v91 = v154;
              *v154 = 0;
              v91[1] = 0;
              v92 = v149;
              v177 = v149;
              v93 = v153;
              *v153 = 0;
              v93[1] = 0;
              v179 = v92;
              v94 = v152;
              *v152 = 0;
              v94[1] = 0;
              v182 = 0;
              v95 = &v89[3 * v90];
              v96 = *(_OWORD *)(v95 - 3);
              v97 = v151;
              *((_QWORD *)v151 + 2) = *(v95 - 1);
              *v97 = v96;
              *(double *)&v172 = *(double *)&v172 - v198;
              *(double *)&v96 = *(double *)&v172;
              v98 = *(_OWORD *)v89;
              v99 = v150;
              *((_QWORD *)v150 + 2) = v89[2];
              *v99 = v98;
              v171[0] = 1;
              *(float *)&v96 = *(double *)&v96 / (*(double *)&v174 - *(double *)&v96);
              v176 = *((float *)&v172 + 2)
                   + (float)((float)(*((float *)&v172 + 2) - *((float *)&v174 + 2)) * *(float *)&v96);
              v181 = RB::Path::ClipStroke::value_clipped(this, v176);
              RB::Path::ClipStroke::Clipper::run((RB::Path::ClipStroke::Clipper *)&v165, v100, v101, v102, v103, v104, v105, v106);
            }
            else
            {
              RB::Path::ClipStroke::Subpath::replay((uint64_t)&v197, *((_QWORD *)this + 1), 1, 0);
            }
            v218 = 0;
            v198 = 0.0;
            v197 = 0uLL;
            v195 = 0;
            RB::Path::ClipStroke::Subpath::append_range(&v197, v157, v164 * (v52 - floor(v52)), v164 * (v46 - floor(v46)), (RB::Path::ClipStroke::DistanceMap *)v193);
            RB::Path::ClipStroke::Subpath::close((RB::Path::ClipStroke::Subpath *)&v197, v107);
            v16 = 0;
            v188 = 0;
            v161 = 1.0 / v198;
            do
            {
              v108 = *((_DWORD *)v75 - 2);
              v109 = *(float *)v75;
              v110 = *((_DWORD *)v75 + 1);
              v162 = *((float *)v75 - 1);
              LODWORD(v163) = v110;
              if (v39)
                v111 = v108;
              else
                v111 = v108 & 0xFFFFFFFE;
              v112 = v164;
              v113 = RB::Path::ClipStroke::DistanceMap::operator()((uint64_t)v193, (v109 - floor(v109)) * v164);
              v114 = v161;
              v115 = v113 * v161;
              v116 = RB::Path::ClipStroke::DistanceMap::operator()((uint64_t)v193, (*(float *)&v163 - floor(*(float *)&v163)) * v112)* v114;
              if ((LODWORD(v115) & 0x7FFFFFFFu) <= 0x7F7FFFFF && (LODWORD(v116) & 0x7FFFFFFFu) <= 0x7F7FFFFF)
              {
                v118 = v162;
                v119 = v16 + 1;
                if (v189 < v16 + 1)
                {
                  RB::vector<RB::Fill::Gradient::Stop,0ul,unsigned long>::reserve_slow((uint64_t)&v187, v119);
                  v16 = v188;
                  v119 = v188 + 1;
                }
                v120 = &v187[4 * v16];
                *(_DWORD *)v120 = v111;
                v120[1] = v118;
                v120[2] = v115;
                v120[3] = v116;
                v188 = v119;
                v16 = v119;
              }
              --v39;
              v75 += 16;
              --v40;
            }
            while (v40);
            v17 = v187;
            v121 = v189;
            v187 = v159;
            v188 = v155;
            v4 = (__int128 *)v157;
            v189 = v156;
            std::swap[abi:nn180100]<RB::Path::ClipStroke::Subpath>((__int128 *)v157, (__int128 *)&v197);
            v39 = 0;
            v40 = v16;
            v155 = v16;
            v156 = v121;
            v159 = v17;
          }
        }
        ++v39;
      }
      while (v39 < v40);
    }
    else
    {
      v159 = 0;
    }
    v183 = 0.0;
    if (RB::Path::ClipStroke::make_keyframes((uint64_t)this, (uint64_t)v17, v16, (uint64_t)v4, (uint64_t *)&v184, &v183))
    {
      v165 = *(double *)&this;
      v166 = (__n128 *)v4;
      v35 = v158;
      v167 = v158;
      v168 = v184;
      v169 = v185;
      v170 = v183;
      v171[1] = 0;
      v177 = vdupq_n_s64(0x7FF0000000000000uLL);
      v178[0] = 0;
      v178[1] = 0;
      v179 = v177;
      v180[0] = 0;
      v180[1] = 0;
      v182 = 0;
      v133 = (char *)&v184[3 * v185];
      v134 = *((_QWORD *)v133 - 1);
      v172 = *(_OWORD *)(v133 - 24);
      v173 = v134;
      *(double *)&v172 = *(double *)&v172 - *((double *)this + 10);
      v135 = v184[2];
      v174 = *(_OWORD *)v184;
      v175 = v135;
      v171[0] = 1;
      v136 = *(double *)&v172 / (*(double *)&v174 - *(double *)&v172);
      v176 = *((float *)&v172 + 2) + (float)((float)(*((float *)&v172 + 2) - *((float *)&v174 + 2)) * v136);
      v181 = RB::Path::ClipStroke::value_clipped(this, v176);
      RB::Path::ClipStroke::Clipper::run((RB::Path::ClipStroke::Clipper *)&v165, v137, v138, v139, v140, v141, v142, v143);
    }
    else
    {
      RB::Path::ClipStroke::Subpath::replay((uint64_t)v4, *((_QWORD *)this + 1), 1, 0);
      v35 = v158;
    }
    v144 = v159;
    if (v184)
      free(v184);
    if (v144)
      free(v144);
    if (v187)
      free(v187);
    if (v194)
      free(v194);
    if (v217)
      free(v217);
  }
  else
  {
    v165 = 0.0;
    if (RB::Path::ClipStroke::make_keyframes((uint64_t)this, (uint64_t)v17, v16, (uint64_t)this + 64, (uint64_t *)&v190, &v165))
    {
      v197.n128_u64[0] = (unint64_t)this;
      v197.n128_u64[1] = (unint64_t)this + 64;
      v198 = *(double *)&v35;
      v199 = v190;
      v200 = v191;
      v201 = v165;
      v209 = vdupq_n_s64(0x7FF0000000000000uLL);
      v203 = 0;
      v210 = 0;
      v212 = v209;
      v214 = 0;
      v211 = 0;
      v213 = 0;
      v216 = 0;
      v122 = (char *)&v190[3 * v191];
      v123 = *((_QWORD *)v122 - 1);
      v204 = *(_OWORD *)(v122 - 24);
      v205 = v123;
      *(double *)&v204 = *(double *)&v204 - *((double *)this + 10);
      v124 = v190[2];
      v206 = *(_OWORD *)v190;
      v207 = v124;
      v202 = 1;
      v125 = *(double *)&v204 / (*(double *)&v206 - *(double *)&v204);
      v208 = *((float *)&v204 + 2) + (float)((float)(*((float *)&v204 + 2) - *((float *)&v206 + 2)) * v125);
      v215 = RB::Path::ClipStroke::value_clipped(this, v208);
      RB::Path::ClipStroke::Clipper::run((RB::Path::ClipStroke::Clipper *)&v197, v126, v127, v128, v129, v130, v131, v132);
    }
    else
    {
      RB::Path::ClipStroke::Subpath::replay((uint64_t)this + 64, *((_QWORD *)this + 1), 1, 0);
    }
  }
  *((_QWORD *)this + 44) = 0;
  *((_QWORD *)v4 + 1) = 0;
  *((_QWORD *)v4 + 2) = 0;
  *(_QWORD *)v4 = 0;
  ++*((_QWORD *)this + 7);
  if (v190)
    free(v190);
  if (*(double *)&v35 != 0.0)
  {
    v145 = (void *)v35[17].n128_u64[1];
    if (v145)
      free(v145);
  }
}

double RB::Path::ClipStroke::lineto(uint64_t a1, __n128 a2)
{
  double result;

  if (*(float *)(a1 + 20) != (float)((*(_DWORD *)(a1 + 16) & 1) == 0))
    return RB::Path::ClipStroke::Subpath::add_lineto(a1 + 64, a2, INFINITY);
  (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 24))(*(_QWORD *)(a1 + 8));
  return result;
}

double RB::Path::ClipStroke::quadto(uint64_t a1, __n128 a2, __n128 a3)
{
  double result;

  if (*(float *)(a1 + 20) != (float)((*(_DWORD *)(a1 + 16) & 1) == 0))
    return RB::Path::ClipStroke::Subpath::add_quadto((__n128 *)(a1 + 64), a2, a3, INFINITY);
  (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 32))(*(_QWORD *)(a1 + 8));
  return result;
}

double RB::Path::ClipStroke::cubeto(uint64_t a1, __n128 a2, __n128 a3, __n128 a4)
{
  double result;

  if (*(float *)(a1 + 20) != (float)((*(_DWORD *)(a1 + 16) & 1) == 0))
    return RB::Path::ClipStroke::Subpath::add_cubeto((__n128 *)(a1 + 64), a2, a3, a4, INFINITY);
  (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 40))(*(_QWORD *)(a1 + 8));
  return result;
}

BOOL RB::Path::ClipStroke::make_keyframes(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, double *a6)
{
  unint64_t v7;
  unint64_t v13;
  uint64_t v14;
  float *v15;
  float v16;
  float v17;
  int v18;
  float v19;
  double v20;
  int v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  double v27;
  int v28;
  int v29;
  unint64_t v30;
  unint64_t v31;
  float v32;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  float v37;
  float *v38;
  double v39;
  float v40;
  uint64_t i;
  float v42;
  double v43;
  float v44;
  float32x2_t v45;
  float32x2_t v46;
  unint64_t v47;
  float *v48;
  float v49;
  float v50;
  float v51;
  float v53;
  float v54;

  v7 = 2 * a3;
  if (!(2 * a3))
    return 0;
  a5[1] = 0;
  if (a5[2] < v7)
    RB::vector<std::pair<char const*,std::shared_ptr<RB::XML::Value::Base>>,0ul,unsigned long>::reserve_slow((uint64_t)a5, v7);
  v13 = a5[1];
  if (a3)
  {
    v14 = 0;
    v15 = (float *)(a2 + 8);
    v16 = -INFINITY;
    v17 = INFINITY;
    do
    {
      v18 = *((_DWORD *)v15 - 1);
      v19 = *v15;
      v20 = *(double *)(a4 + 16);
      v21 = *((_DWORD *)v15 - 2);
      v22 = v13 + 1;
      v23 = a5[2];
      if (v23 < v13 + 1)
      {
        RB::vector<std::pair<char const*,std::shared_ptr<RB::XML::Value::Base>>,0ul,unsigned long>::reserve_slow((uint64_t)a5, v22);
        v13 = a5[1];
        v23 = a5[2];
        v22 = v13 + 1;
      }
      v24 = *a5;
      v25 = *a5 + 24 * v13;
      *(double *)v25 = v20 * (float)(v19 - floorf(v19));
      *(_DWORD *)(v25 + 8) = v18;
      *(_DWORD *)(v25 + 12) = v14;
      *(_DWORD *)(v25 + 16) = v21;
      a5[1] = v22;
      v26 = v15[1];
      v27 = *(double *)(a4 + 16);
      v28 = *((_DWORD *)v15 - 1);
      v29 = *((_DWORD *)v15 - 2);
      v30 = v13 + 2;
      if (v23 < v30)
      {
        RB::vector<std::pair<char const*,std::shared_ptr<RB::XML::Value::Base>>,0ul,unsigned long>::reserve_slow((uint64_t)a5, v30);
        v24 = *a5;
        v22 = a5[1];
      }
      v31 = v24 + 24 * v22;
      *(double *)v31 = v27 * (float)(v26 - floorf(v26));
      *(_DWORD *)(v31 + 8) = v28;
      *(_DWORD *)(v31 + 12) = v14;
      *(_DWORD *)(v31 + 16) = v29;
      v13 = v22 + 1;
      a5[1] = v22 + 1;
      v32 = *(v15 - 1);
      if (v32 < v17)
        v17 = *(v15 - 1);
      if (v16 < v32)
        v16 = *(v15 - 1);
      ++v14;
      v15 += 4;
    }
    while (a3 != v14);
  }
  else
  {
    v24 = *a5;
    v17 = INFINITY;
    v16 = -INFINITY;
  }
  v34 = 126 - 2 * __clz(v13);
  if (v13)
    v35 = v34;
  else
    v35 = 0;
  std::__introsort<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*,false>(v24, v24 + 24 * v13, v35, 1);
  v36 = a5[1];
  if (v36 <= 1)
  {
    *a6 = 0.0;
  }
  else
  {
    v37 = *(float *)(*a5 + 8);
    v38 = (float *)(*a5 + 32);
    v39 = 0.0;
    v40 = 0.0;
    for (i = 1; i != v36; ++i)
    {
      v42 = *v38;
      if (vabds_f32(v37, *v38) >= 0.0001)
      {
        v39 = *((double *)v38 - 1) + v39 - *((double *)v38 - 4);
        v40 = vabds_f32(v42, v37) + v40;
      }
      v38 += 6;
      v37 = v42;
    }
    v43 = 0.0;
    if (v40 > 0.0)
    {
      v44 = v40;
      v45 = vrecpe_f32((float32x2_t)LODWORD(v40));
      v46 = vmul_f32(vrecps_f32((float32x2_t)LODWORD(v44), v45), v45);
      v43 = v39 * vmul_f32(v46, vrecps_f32((float32x2_t)LODWORD(v44), v46)).f32[0];
    }
    *a6 = v43;
    v47 = v36 - 2;
    if (v36 != 2)
    {
      v48 = (float *)(*a5 + 32);
      v49 = *v48;
      v50 = *(float *)(*a5 + 8);
      do
      {
        v51 = v50;
        v50 = v49;
        v49 = v48[6];
        if (v50 > v17 && v50 < v16)
        {
          if (v50 >= v51)
            v53 = v51;
          else
            v53 = v50;
          if (v49 < v53)
            v53 = v48[6];
          if (v51 < v50)
            v51 = v50;
          v54 = *(float *)(a1 + 20);
          if (v51 < v49)
            v51 = v48[6];
          if (v53 > v54 || v51 < v54)
            *v48 = INFINITY;
        }
        v48 += 6;
        --v47;
      }
      while (v47);
    }
  }
  return v36 != 0;
}

void RB::Path::ClipStroke::Clipper::run(RB::Path::ClipStroke::Clipper *this, double a2, double a3, double a4, double a5, double a6, double a7, float64x2_t a8)
{
  double v9;
  double v10;
  float v11;
  uint64_t v12;
  float64x2_t v13;
  unint64_t v14;
  int v15;
  float64_t v16;
  float64_t v17;
  double v18;
  __int128 v19;
  __int128 v20;
  double v21;
  double v22;
  uint64_t v23;
  BOOL v24;
  float64x2_t *v25;
  __n128 v26[7];
  Point v27[4];
  float64x2_t v28[5];
  Point v29[4];
  Point v30[4];
  Point v31[4];
  float64x2_t v32;
  __n128 v33;
  __n128 v34;
  __n128 v35;
  __n128 v36;
  __n128 v37;
  __n128 v38;

  v9 = *((double *)this + 11);
  v10 = *((double *)this + 8);
  if (v9 > v10)
  {
    v11 = *(float *)(*(_QWORD *)this + 20);
    if ((*(_DWORD *)(*(_QWORD *)this + 16) & 1) != 0)
    {
      LODWORD(a3) = 1.0;
      if (v11 <= 1.0)
        goto LABEL_8;
    }
    else if (v11 >= 0.0)
    {
      goto LABEL_8;
    }
    if ((*(_DWORD *)(*(_QWORD *)this + 16) & 6) == 4
      && (RB::Path::ClipStroke::Clipper::emit_undershoot(this) & 1) != 0)
    {
      return;
    }
  }
LABEL_8:
  v12 = *((_QWORD *)this + 1);
  v13 = *(float64x2_t *)v12;
  *(_OWORD *)&v31[0].v = *(_OWORD *)v12;
  if (*(uint64_t *)(v12 + 288) >= 1)
  {
    if (*(_QWORD *)(v12 + 280))
      v14 = *(_QWORD *)(v12 + 280);
    else
      v14 = v12 + 24;
    do
    {
      v13.f64[0] = *(float64_t *)v14;
      v15 = (int)*(double *)v14;
      switch(v15)
      {
        case 4:
          v19 = *(_OWORD *)(v14 + 16);
          *(_OWORD *)&v29[0].v = *(_OWORD *)(v14 + 32);
          *(_OWORD *)&v30[0].v = v19;
          *(_OWORD *)&v27[0].v = *(_OWORD *)(v14 + 48);
          CG::Cubic::Cubic((CG::Cubic *)v26, v31, v30, v29, v27);
          if (v9 > v10)
          {
            v21 = *(double *)(v14 + 8);
            v36 = v26[4];
            v37 = v26[5];
            v38 = v26[6];
            v32 = (float64x2_t)v26[0];
            v33 = v26[1];
            v34 = v26[2];
            v35 = v26[3];
            RB::Path::ClipStroke::Clipper::split_segment<CG::Cubic>((uint64_t)this, (CG::Cubic *)&v32, v21);
          }
          else
          {
            RB::Path::ClipStroke::Clipper::emit_segment<CG::Cubic>((uint64_t)this, v26);
          }
          v13 = *(float64x2_t *)&v27[0].v;
          *(_OWORD *)&v31[0].v = *(_OWORD *)&v27[0].v;
          v14 += 64;
          break;
        case 3:
          v20 = *(_OWORD *)(v14 + 16);
          *(_OWORD *)&v29[0].v = *(_OWORD *)(v14 + 32);
          *(_OWORD *)&v30[0].v = v20;
          CG::Quadratic::Quadratic((CG::Quadratic *)v28, v31, v30, v29);
          if (v9 > v10)
          {
            v22 = *(double *)(v14 + 8);
            v34 = (__n128)v28[2];
            v35 = (__n128)v28[3];
            v36 = (__n128)v28[4];
            v32 = v28[0];
            v33 = (__n128)v28[1];
            RB::Path::ClipStroke::Clipper::split_segment<CG::Quadratic>((uint64_t)this, (CG::Quadratic *)&v32, v22);
          }
          else
          {
            RB::Path::ClipStroke::Clipper::emit_segment<CG::Quadratic>((__n128 *)this, v28);
          }
          v13 = *(float64x2_t *)&v29[0].v;
          *(_OWORD *)&v31[0].v = *(_OWORD *)&v29[0].v;
          v14 += 48;
          break;
        case 2:
          v17 = *(double *)(v14 + 16);
          v16 = *(double *)(v14 + 24);
          v18 = *(double *)(v14 + 8);
          v32 = *(float64x2_t *)&v31[0].v;
          v33.n128_f64[0] = v17;
          v33.n128_f64[1] = v16;
          if (v9 > v10)
            RB::Path::ClipStroke::Clipper::split_segment<CG::LineSegment>((uint64_t)this, *(float64_t *)&v31[0].v, *(float64_t *)&v31[2].v, v17, v16, v18);
          else
            RB::Path::ClipStroke::Clipper::emit_segment<CG::LineSegment>(this, &v32);
          *(float64_t *)&v31[0].v = v17;
          *(float64_t *)&v31[2].v = v16;
          v14 += 32;
          break;
      }
      v23 = *(_QWORD *)(v12 + 280);
      if (!v23)
        v23 = v12 + 24;
    }
    while (v14 < v23 + 8 * *(_QWORD *)(v12 + 288));
  }
  if (*((_BYTE *)this + 205))
  {
    if (*((_BYTE *)this + 204))
    {
      *((_BYTE *)this + 204) = 1;
    }
    else
    {
      v24 = RB::Path::ClipStroke::value_clipped(*(RB::Path::ClipStroke **)this, *((float *)this + 50));
      *((_BYTE *)this + 204) = v24;
      if (!v24)
      {
LABEL_37:
        (*(void (**)(_QWORD, float64x2_t *, float64x2_t))(**(_QWORD **)(*(_QWORD *)this + 8) + 8))(*(_QWORD *)(*(_QWORD *)this + 8), v25, v13);
        return;
      }
    }
    v25 = (float64x2_t *)((char *)this + 160);
    if ((*((_QWORD *)this + 20) & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
      && (*((_QWORD *)this + 21) & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
    {
      *((_DWORD *)this + 28) = *((_DWORD *)this + 50);
      v13 = RB::Path::ClipStroke::Clipper::emit_cap((uint64_t *)this, v25, (float64x2_t *)this + 11, *((float64_t *)this + 24), a3, a4, a5, a6, a7, a8);
    }
    goto LABEL_37;
  }
}

void std::swap[abi:nn180100]<RB::Path::ClipStroke::Subpath>(__int128 *a1, __int128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12[16];
  _BYTE v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v10 = *a1;
  v4 = *((_QWORD *)a1 + 2);
  v5 = (uint64_t)a1 + 24;
  *(_OWORD *)v13 = *(__int128 *)((char *)a1 + 280);
  *((_QWORD *)a1 + 35) = 0;
  v11 = v4;
  *(_QWORD *)&v13[16] = *((_QWORD *)a1 + 37);
  a1[18] = xmmword_209BD9B20;
  RB::vector<double,32ul,unsigned long>::swap_inline(v12, (__int128 *)((char *)a1 + 24));
  *a1 = *a2;
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 36) = 0;
  v6 = *(_QWORD *)(v5 + 256);
  *(_QWORD *)(v5 + 256) = *((_QWORD *)a2 + 35);
  *((_QWORD *)a2 + 35) = v6;
  *((_QWORD *)a1 + 36) = *((_QWORD *)a2 + 36);
  *((_QWORD *)a2 + 36) = 0;
  v7 = *((_QWORD *)a1 + 37);
  *((_QWORD *)a1 + 37) = *((_QWORD *)a2 + 37);
  *((_QWORD *)a2 + 37) = v7;
  RB::vector<double,32ul,unsigned long>::swap_inline((__int128 *)v5, (__int128 *)((char *)a2 + 24));
  *a2 = v10;
  *((_QWORD *)a2 + 2) = v11;
  v8 = *((_QWORD *)a2 + 35);
  *((_QWORD *)a2 + 35) = *(_QWORD *)v13;
  *(_QWORD *)v13 = v8;
  v9 = *((_QWORD *)a2 + 37);
  a2[18] = *(_OWORD *)&v13[8];
  *(_QWORD *)&v13[8] = 0;
  *(_QWORD *)&v13[16] = v9;
  RB::vector<double,32ul,unsigned long>::swap_inline((__int128 *)((char *)a2 + 24), v12);
  if (*(_QWORD *)v13)
    free(*(void **)v13);
}

double RB::Path::ClipStroke::Clipper::advance_keyframes(RB::Path::ClipStroke::Clipper *this, __n128 a2)
{
  _OWORD *v2;
  double v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  int v15;

  v2 = (_OWORD *)((char *)this + 88);
  v3 = *((double *)this + 11);
  if (v3 <= a2.n128_f64[0])
  {
    v4 = *((_QWORD *)this + 4);
    v5 = *((_QWORD *)this + 6);
    if (v4 <= v5)
      v4 = *((_QWORD *)this + 6);
    v6 = 24 * v5;
    do
    {
      if (v4 == v5)
        break;
      v7 = *((_QWORD *)this + 3) + v6;
      v8 = *(double *)v7;
      v9 = *(_DWORD *)(v7 + 8);
      v14 = *(_QWORD *)(v7 + 12);
      v15 = *(_DWORD *)(v7 + 20);
      if (*(double *)v7 < v3)
        break;
      *((_QWORD *)this + 6) = ++v5;
      if ((v9 & 0x7FFFFFFFu) <= 0x7F7FFFFF)
      {
        *((_OWORD *)this + 4) = *v2;
        *((_QWORD *)this + 10) = *((_QWORD *)this + 13);
        *((double *)this + 11) = v8;
        *((_DWORD *)this + 24) = v9;
        *(_QWORD *)((char *)this + 100) = v14;
        *((_DWORD *)this + 27) = v15;
        v3 = v8;
      }
      v6 += 24;
    }
    while (v3 <= a2.n128_f64[0]);
  }
  if (v3 <= a2.n128_f64[0])
  {
    v10 = *((_QWORD *)this + 6);
    if (v10 == *((_QWORD *)this + 4))
    {
      a2 = *(__n128 *)v2;
      *((_OWORD *)this + 4) = *v2;
      *((_QWORD *)this + 10) = *((_QWORD *)this + 13);
      if (v10)
      {
        v11 = *((_QWORD *)this + 3);
        v12 = *(_QWORD *)(v11 + 16);
        *v2 = *(_OWORD *)v11;
        *((_QWORD *)this + 13) = v12;
        a2.n128_f64[0] = *((double *)this + 11) + *(double *)(*((_QWORD *)this + 1) + 16);
        *((_QWORD *)this + 11) = a2.n128_u64[0];
        *((_QWORD *)this + 6) = v10 + 1;
      }
    }
  }
  return a2.n128_f64[0];
}

float64x2_t RB::Path::ClipStroke::Clipper::emit_cap(uint64_t *a1, float64x2_t *a2, float64x2_t *a3, float64_t a4, double a5, double a6, double a7, double a8, double a9, float64x2_t a10)
{
  uint64_t v13;
  int v14;
  __n128 v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  int8x16_t v24;
  int8x16_t v25;
  float64x2_t v26;
  __n128 v27;
  __n128 v28;
  float v29;
  float v30;
  float64x2_t result;
  float v32;
  float64x2_t v33;
  float64x2_t v34;
  int8x16_t v35;
  int64x2_t v36;
  uint64_t v37;
  uint64_t v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  int64x2_t v42;
  int64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  float64x2_t v47;
  float64x2_t v48;
  int64x2_t v49;
  int64x2_t v50;
  float64x2_t v51;
  uint64_t v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t v56;
  int8x16_t v57;
  float64x2_t v58;
  float64x2_t v59;
  float64x2_t v60;
  float64x2_t v61;
  uint64_t v62;
  __n128 v63;
  float64x2_t v64;
  int8x16_t v65;
  unint64_t v66;
  unint64_t v67;
  float64x2_t v68;
  float64x2_t v69;
  float64x2_t v70;
  float64x2_t v71;
  float64x2_t v72;
  float64x2_t v73;
  float64x2_t v74;
  __n128 v75;
  __n128 v76;
  __n128 v77;
  float64x2_t v78;
  __n128 v79;
  CGAffineTransform v80;
  CGAffineTransform v81;

  a10.f64[0] = a4;
  if (!*((_BYTE *)a1 + 205))
  {
    *((float64x2_t *)a1 + 10) = *a2;
    result = *a3;
    *((float64x2_t *)a1 + 11) = *a3;
    a1[24] = *(_QWORD *)&a10.f64[0];
    LODWORD(result.f64[0]) = *((_DWORD *)a1 + 28);
    *((_DWORD *)a1 + 50) = LODWORD(result.f64[0]);
    return result;
  }
  v13 = *a1;
  v14 = *(_DWORD *)(*a1 + 16);
  v15 = *(__n128 *)a2;
  v79 = (__n128)a10;
  if ((v14 & 8) != 0)
  {
    (*(void (**)(_QWORD, __n128))(**(_QWORD **)(v13 + 8) + 24))(*(_QWORD *)(v13 + 8), v15);
    *(float64x2_t *)(a1 + 15) = *a2;
    *(float64x2_t *)(a1 + 17) = vnegq_f64(*a3);
    result = (float64x2_t)v79;
    a1[19] = v79.n128_u64[0];
    return result;
  }
  v16 = *(float64x2_t *)(a1 + 15);
  v17 = vmulq_n_f64(*(float64x2_t *)(a1 + 17), 1.0 / sqrt(vaddvq_f64(vmulq_f64(*(float64x2_t *)(a1 + 17), *(float64x2_t *)(a1 + 17)))));
  v18 = vmulq_f64(*a3, *a3);
  v19 = vmulq_n_f64(*a3, 1.0 / sqrt(vaddvq_f64(v18)));
  *(_QWORD *)&v18.f64[0] = a1[19];
  v20 = (float64x2_t)vbslq_s8((int8x16_t)vdupq_lane_s64(vcgtq_f64(v18, a10).i64[0], 0), (int8x16_t)v17, (int8x16_t)v19);
  v21 = vmulq_f64(v20, vsubq_f64((float64x2_t)v15, v16));
  v22 = (float64x2_t)vdupq_laneq_s64((int64x2_t)v21, 1);
  v23 = vaddq_f64(v21, v22);
  v22.f64[0] = 0.0;
  v24 = (int8x16_t)vdupq_lane_s64(vcgtq_f64(v23, v22).i64[0], 0);
  v25 = (int8x16_t)vmulq_n_f64(v20, v23.f64[0]);
  v26 = (float64x2_t)vbslq_s8(v24, v25, (int8x16_t)vdupq_n_s64(0x8000000000000000));
  v27 = (__n128)vsubq_f64((float64x2_t)v15, (float64x2_t)vbicq_s8(v25, v24));
  v28 = (__n128)vaddq_f64(v16, v26);
  if ((v14 & 2) == 0)
  {
    v29 = *((float *)a1 + 28);
    if ((v14 & 1) != 0)
    {
      if (v29 <= 0.0)
      {
        v30 = *(float *)(v13 + 20);
LABEL_11:
        v32 = v29 - v30;
        if (v32 > 0.0)
        {
          v33 = vaddq_f64(v19, v17);
          v34 = vmulq_n_f64(v33, *((double *)a1 + 5) * v32 / sqrt(vaddvq_f64(vmulq_f64(v33, v33))));
          v28 = (__n128)vaddq_f64(v34, (float64x2_t)v28);
          v27 = (__n128)vaddq_f64(v34, (float64x2_t)v27);
        }
      }
    }
    else if (v29 >= 1.0)
    {
      v30 = *((float *)a1 + 28);
      v29 = *(float *)(v13 + 20);
      goto LABEL_11;
    }
  }
  v35 = (int8x16_t)vceqq_f64((float64x2_t)v28, v16);
  v36 = vdupq_laneq_s64((int64x2_t)vmvnq_s8(v35), 1);
  v78 = (float64x2_t)v27;
  if ((vornq_s8((int8x16_t)v36, v35).u64[0] & 0x8000000000000000) != 0)
  {
    v73 = v20;
    v75 = v28;
    (*(void (**)(_QWORD, __n128))(**(_QWORD **)(v13 + 8) + 24))(*(_QWORD *)(v13 + 8), v28);
    v20 = v73;
    v28 = v75;
    v27 = (__n128)v78;
  }
  v37 = a1[2];
  if (v37)
  {
    v38 = v37 + 24;
    if (*(_QWORD *)(v37 + 280))
      v38 = *(_QWORD *)(v37 + 280);
    v39 = *(float64x2_t *)v37;
    v40 = vsubq_f64(*(float64x2_t *)(v38 + 8 * *(_QWORD *)(v37 + 288) - 16), *(float64x2_t *)v37);
    v41 = vsubq_f64((float64x2_t)v27, (float64x2_t)v28);
    v42 = (int64x2_t)vmulq_f64(v40, v40);
    v43 = (int64x2_t)vmulq_f64(v41, v41);
    v44 = vsqrtq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v43, v42), (float64x2_t)vzip2q_s64(v43, v42)));
    v45 = (float64x2_t)vdupq_laneq_s64((int64x2_t)v44, 1);
    v46 = vdivq_f64(v40, v45);
    v47 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v44.f64[0], 0);
    v48 = vdivq_f64(v41, v47);
    v44.f64[0] = vdivq_f64(v44, v45).f64[0];
    v49 = (int64x2_t)vmulq_f64(v46, v48);
    v47.f64[0] = -v46.f64[1];
    v50 = (int64x2_t)vmulq_f64((float64x2_t)vzip1q_s64((int64x2_t)v47, (int64x2_t)v46), v48);
    v51 = vaddq_f64((float64x2_t)vzip1q_s64(v49, v50), (float64x2_t)vzip2q_s64(v49, v50));
    *(float64x2_t *)&v81.a = vmulq_n_f64(v51, v44.f64[0]);
    v81.c = vmuld_lane_f64(-v44.f64[0], v51, 1);
    v81.d = v81.a;
    *(__n128 *)&v81.tx = v28;
    *(_OWORD *)&v80.c = *(_OWORD *)&v81.c;
    *(__n128 *)&v80.tx = v28;
    *(_OWORD *)&v80.a = *(_OWORD *)&v81.a;
    CGAffineTransformTranslate(&v81, &v80, -v39.f64[0], -v39.f64[1]);
    RB::Path::ClipStroke::Subpath::replay(v37, *(_QWORD *)(*a1 + 8), 0, (float64x2_t *)&v81);
  }
  else
  {
    v52 = *a1;
    v53 = vsubq_f64((float64x2_t)v27, (float64x2_t)v28);
    *(double *)v36.i64 = -v53.f64[1];
    v54 = vmulq_f64((float64x2_t)vzip1q_s64(v36, (int64x2_t)v53), v20);
    v55 = (float64x2_t)vdupq_laneq_s64((int64x2_t)v54, 1);
    v56 = vaddq_f64(v54, v55);
    v55.f64[0] = 0.0;
    v57 = (int8x16_t)vdupq_lane_s64(vcgtq_f64(v55, v56).i64[0], 0);
    v55.f64[0] = -v20.f64[1];
    v58 = (float64x2_t)vzip1q_s64((int64x2_t)v55, (int64x2_t)v20);
    v53.f64[0] = sqrt(vaddvq_f64(vmulq_f64(v53, v53))) * 0.5;
    v59 = vmulq_n_f64((float64x2_t)vbslq_s8(v57, (int8x16_t)vnegq_f64(v58), (int8x16_t)v58), v53.f64[0]);
    v60 = vsubq_f64((float64x2_t)v28, v59);
    v61 = vmulq_n_f64(v20, v53.f64[0]);
    v74 = v59;
    v76 = (__n128)v60;
    switch(*(_BYTE *)(*a1 + 24))
    {
      case 0:
        v64 = (float64x2_t)vdupq_n_s64(0x3FE1AC51114F0EAFuLL);
        v71 = vmulq_f64(v61, v64);
        v68 = vaddq_f64(v60, v61);
        v69 = vmulq_f64(v59, v64);
        (*(void (**)(_QWORD, __n128, __n128))(**(_QWORD **)(v52 + 8) + 40))(*(_QWORD *)(v52 + 8), (__n128)vaddq_f64(v71, (float64x2_t)v28), (__n128)vaddq_f64(v68, v69));
        (*(void (**)(_QWORD, __n128, __n128))(**(_QWORD **)(*a1 + 8) + 40))(*(_QWORD *)(*a1 + 8), (__n128)vsubq_f64(v68, v69), (__n128)vaddq_f64(vsubq_f64((float64x2_t)v76, v74), v71));
        break;
      case 1:
        v72 = v61;
        (*(void (**)(_QWORD, __n128))(**(_QWORD **)(v52 + 8) + 24))(*(_QWORD *)(v52 + 8), (__n128)vaddq_f64(v61, (float64x2_t)v28));
        v62 = *(_QWORD *)(*a1 + 8);
        v77 = (__n128)vsubq_f64((float64x2_t)v76, v74);
        v63 = (__n128)vaddq_f64((float64x2_t)v77, v72);
        goto LABEL_24;
      case 3:
      case 5:
        (*(void (**)(_QWORD, __n128))(**(_QWORD **)(v52 + 8) + 24))(*(_QWORD *)(v52 + 8), (__n128)vaddq_f64(v60, v61));
        (*(void (**)(__n128))(**(_QWORD **)(*a1 + 8) + 24))((__n128)vsubq_f64((float64x2_t)v76, v74));
        break;
      case 4:
      case 6:
        v70 = v61;
        (*(void (**)(_QWORD, __n128))(**(_QWORD **)(v52 + 8) + 24))(*(_QWORD *)(v52 + 8), (__n128)vaddq_f64(v61, (float64x2_t)v28));
        (*(void (**)(_QWORD, __n128))(**(_QWORD **)(*a1 + 8) + 24))(*(_QWORD *)(*a1 + 8), v76);
        v62 = *(_QWORD *)(*a1 + 8);
        v77 = (__n128)vsubq_f64((float64x2_t)v76, v74);
        v63 = (__n128)vaddq_f64((float64x2_t)v77, v70);
LABEL_24:
        (*(void (**)(uint64_t, __n128))(*(_QWORD *)v62 + 24))(v62, v63);
        (*(void (**)(__n128))(**(_QWORD **)(*a1 + 8) + 24))(v77);
        break;
      default:
        (*(void (**)(__n128))(**(_QWORD **)(v52 + 8) + 24))(v27);
        break;
    }
  }
  v65 = (int8x16_t)vceqq_f64(v78, *a2);
  v66 = vornq_s8((int8x16_t)vdupq_laneq_s64((int64x2_t)vmvnq_s8(v65), 1), v65).u64[0];
  v67 = v79.n128_u64[0];
  if ((v66 & 0x8000000000000000) != 0)
  {
    (*(void (**)(_QWORD, __n128, __n128))(**(_QWORD **)(*a1 + 8) + 24))(*(_QWORD *)(*a1 + 8), *(__n128 *)a2, v79);
    v67 = v79.n128_u64[0];
  }
  *(float64x2_t *)(a1 + 15) = *a2;
  result = vnegq_f64(*a3);
  *(float64x2_t *)(a1 + 17) = result;
  a1[19] = v67;
  return result;
}

uint64_t RB::Path::ClipStroke::Clipper::emit_undershoot(RB::Path::ClipStroke::Clipper *this)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  float v5;
  uint64_t v6;
  double v7;
  float v8;
  double *v9;
  double v11;
  double v13;
  void *v14;
  _BYTE *v15;
  double *v16;
  double v17;
  double v18;
  int v19;
  double v20;
  double v21;
  __int128 v22;
  uint64_t v23;
  double *v24;
  __int128 v25;
  uint64_t v26;
  double *v27;
  _BYTE *v28;
  uint64_t v29;
  float v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  float64x2_t v48;
  float64x2_t v49;
  uint64_t v50;
  uint64_t v51;
  float64x2_t v52;
  Point v53[4];
  float64x2_t v54[5];
  Point v55[4];
  Point v56[4];
  Point v57[4];
  float64x2_t v58;
  uint64_t v59;
  _BYTE v60[256];
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v2 = *((_QWORD *)this + 4);
  if (v2)
  {
    v3 = *((_QWORD *)this + 3);
    v4 = 0.0;
    v5 = INFINITY;
    v6 = *((_QWORD *)this + 4);
    v7 = 0.0;
    do
    {
      v8 = *(float *)(v3 + 8);
      if (v8 >= v5)
      {
        if (v8 == v5)
          v7 = *(double *)v3;
      }
      else
      {
        v4 = *(double *)v3;
        v7 = INFINITY;
        v5 = *(float *)(v3 + 8);
      }
      v3 += 24;
      --v6;
    }
    while (v6);
    v9 = (double *)(*((_QWORD *)this + 3) + 8);
    while (1)
    {
      if ((*(_DWORD *)v9 & 0x7FFFFFFFu) <= 0x7F7FFFFF && *(float *)v9 != v5)
      {
        v11 = *(v9 - 1);
        if (v11 >= v4 && v11 < v7)
          break;
      }
      v9 += 3;
      if (!--v2)
      {
        v13 = v7;
        v7 = v4;
        goto LABEL_21;
      }
    }
    v13 = v4;
  }
  else
  {
    v13 = 0.0;
    v5 = INFINITY;
    v7 = 0.0;
  }
LABEL_21:
  v61 = 0;
  v59 = 0;
  v58 = 0uLL;
  v62 = 0;
  v63 = 32;
  RB::Path::ClipStroke::Subpath::append_logical_range((__n128 *)&v58, *((const RB::Path::ClipStroke::Subpath **)this + 1), v7, v13, 0);
  v48 = v58;
  v14 = v61;
  if (v61)
    v15 = v61;
  else
    v15 = v60;
  v16 = (double *)&v15[8 * v62];
  v18 = *(v16 - 2);
  v17 = *(v16 - 1);
  v46 = 0.0;
  v47 = 0.0;
  *(float64x2_t *)&v57[0].v = v58;
  if (v62 > 0)
  {
    v45 = 0.0;
    v44 = 0.0;
    do
    {
      v19 = (int)*(double *)v15;
      switch(v19)
      {
        case 4:
          v25 = *((_OWORD *)v15 + 1);
          *(_OWORD *)&v55[0].v = *((_OWORD *)v15 + 2);
          *(_OWORD *)&v56[0].v = v25;
          *(_OWORD *)&v53[0].v = *((_OWORD *)v15 + 3);
          CG::Cubic::Cubic((CG::Cubic *)&v49, v57, v56, v55, v53);
          if (v45 == 0.0 && v47 == 0.0)
          {
            v45 = CG::Cubic::derivative((CG::Cubic *)&v49, 0.0);
            v27 = &v47;
          }
          else
          {
            v44 = CG::Cubic::derivative((CG::Cubic *)&v49, 1.0);
            v27 = &v46;
          }
          *(_QWORD *)v27 = v26;
          *(_OWORD *)&v57[0].v = *(_OWORD *)&v53[0].v;
          v15 += 64;
          break;
        case 3:
          v22 = *((_OWORD *)v15 + 1);
          *(_OWORD *)&v55[0].v = *((_OWORD *)v15 + 2);
          *(_OWORD *)&v56[0].v = v22;
          CG::Quadratic::Quadratic((CG::Quadratic *)v54, v57, v56, v55);
          if (v45 == 0.0 && v47 == 0.0)
          {
            v45 = CG::Quadratic::derivative(v54, 0.0);
            v24 = &v47;
          }
          else
          {
            v44 = CG::Quadratic::derivative(v54, 1.0);
            v24 = &v46;
          }
          *(_QWORD *)v24 = v23;
          *(_OWORD *)&v57[0].v = *(_OWORD *)&v55[0].v;
          v15 += 48;
          break;
        case 2:
          v20 = *((double *)v15 + 2);
          v21 = *((double *)v15 + 3);
          if (v45 == 0.0 && v47 == 0.0)
          {
            v47 = v21 - *(double *)&v57[2].v;
            v45 = v20 - *(double *)&v57[0].v;
          }
          else
          {
            v46 = v21 - *(double *)&v57[2].v;
            v44 = v20 - *(double *)&v57[0].v;
          }
          *(double *)&v57[0].v = v20;
          *(double *)&v57[2].v = v21;
          v15 += 32;
          break;
      }
      v14 = v61;
      if (v61)
        v28 = v61;
      else
        v28 = v60;
    }
    while (v15 < &v28[8 * v62]);
    if ((v45 != 0.0 || v47 != 0.0) && (v44 != 0.0 || v46 != 0.0))
    {
      v29 = *(_QWORD *)this;
      v30 = v5 - *(float *)(*(_QWORD *)this + 20);
      if ((*(_BYTE *)(*(_QWORD *)this + 16) & 1) != 0)
        v30 = -v30;
      if (v30 > 0.0)
      {
        v32.f64[0] = v44;
        v31.f64[0] = v45;
        v31.f64[1] = v47;
        v42 = v46;
        v43 = v47;
        v32.f64[1] = v46;
        v33 = vmlaq_n_f64(vnegq_f64(vmulq_n_f64(v32, 1.0 / sqrt(vaddvq_f64(vmulq_f64(v32, v32))))), v31, 1.0 / sqrt(vaddvq_f64(vmulq_f64(v31, v31))));
        v41 = vmulq_n_f64(v33, *((double *)this + 5) * v30 / sqrt(vaddvq_f64(vmulq_f64(v33, v33))));
        v48 = vaddq_f64(v41, v48);
        (*(void (**)(_QWORD))(**(_QWORD **)(v29 + 8) + 16))(*(_QWORD *)(v29 + 8));
        v34 = 1;
        *((_BYTE *)this + 205) = 1;
        v49 = (float64x2_t)0x3FF0000000000000uLL;
        v50 = 0;
        v51 = 0x3FF0000000000000;
        v52 = v41;
        RB::Path::ClipStroke::Subpath::replay((uint64_t)&v58, *(_QWORD *)(*(_QWORD *)this + 8), 0, &v49);
        *((double *)this + 15) = v41.f64[0] + v18;
        *((double *)this + 16) = v41.f64[1] + v17;
        *((double *)this + 17) = v44;
        *((double *)this + 18) = v42;
        *((_QWORD *)this + 19) = 0;
        *((float *)this + 28) = v5;
        v54[0].f64[0] = -v45;
        v54[0].f64[1] = -v43;
        v39 = RB::Path::ClipStroke::Clipper::emit_cap((uint64_t *)this, &v48, v54, 0.0, -v43, v44, v35, v36, v37, v38);
        (*(void (**)(_QWORD, __n128))(**(_QWORD **)(*(_QWORD *)this + 8) + 8))(*(_QWORD *)(*(_QWORD *)this + 8), (__n128)v39);
        *((_BYTE *)this + 205) = 0;
        v14 = v61;
        if (!v61)
          return v34;
        goto LABEL_58;
      }
    }
  }
  v34 = 0;
  if (v14)
LABEL_58:
    free(v14);
  return v34;
}

__int128 *RB::vector<double,32ul,unsigned long>::swap_inline(__int128 *result, __int128 *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;

  v2 = *((_QWORD *)a2 + 32);
  v3 = *((_QWORD *)result + 32);
  if (v2)
    v4 = v3 == 0;
  else
    v4 = 1;
  if (v4)
  {
    v29 = a2[12];
    v30 = a2[13];
    v31 = a2[14];
    v32 = a2[15];
    v25 = a2[8];
    v26 = a2[9];
    v27 = a2[10];
    v28 = a2[11];
    v21 = a2[4];
    v22 = a2[5];
    v23 = a2[6];
    v24 = a2[7];
    v17 = *a2;
    v18 = a2[1];
    v19 = a2[2];
    v20 = a2[3];
    v5 = *result;
    v6 = result[1];
    v7 = result[3];
    a2[2] = result[2];
    a2[3] = v7;
    *a2 = v5;
    a2[1] = v6;
    v8 = result[4];
    v9 = result[5];
    v10 = result[7];
    a2[6] = result[6];
    a2[7] = v10;
    a2[4] = v8;
    a2[5] = v9;
    v11 = result[8];
    v12 = result[9];
    v13 = result[11];
    a2[10] = result[10];
    a2[11] = v13;
    a2[8] = v11;
    a2[9] = v12;
    v14 = result[12];
    v15 = result[13];
    v16 = result[15];
    a2[14] = result[14];
    a2[15] = v16;
    a2[12] = v14;
    a2[13] = v15;
    result[12] = v29;
    result[13] = v30;
    result[14] = v31;
    result[15] = v32;
    result[8] = v25;
    result[9] = v26;
    result[10] = v27;
    result[11] = v28;
    result[4] = v21;
    result[5] = v22;
    result[6] = v23;
    result[7] = v24;
    *result = v17;
    result[1] = v18;
    result[2] = v19;
    result[3] = v20;
    if (v3)
    {
      if (v2)
        return result;
    }
    else
    {
      *((_QWORD *)result + 32) = 0;
      if (v2)
        return result;
    }
    *((_QWORD *)a2 + 32) = 0;
  }
  return result;
}

void std::__introsort<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*,false>(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  __int128 *v14;
  __int128 *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  unint64_t v20;
  unint64_t v21;
  double v22;
  double v23;
  unint64_t v24;
  __int128 v25;
  double v26;
  double v27;
  __int128 v28;
  BOOL v29;
  double v30;
  unint64_t v31;
  unint64_t v32;
  double v33;
  __int128 v34;
  double v35;
  double v36;
  __int128 v37;
  unint64_t v38;
  double v39;
  __int128 v40;
  __int128 *v41;
  __int128 *v42;
  __int128 *v43;
  unint64_t v44;
  double v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  unint64_t v53;
  BOOL v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  double v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int64_t v63;
  int64_t v64;
  int64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  double v69;
  unint64_t v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;
  int64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  int64_t v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  double v85;
  unint64_t v86;
  __int128 v87;
  uint64_t v89;
  double v90;
  unint64_t v91;
  double v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;

__int128 *std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>(__int128 *result, __int128 *a2, __int128 *a3)
{
  double v3;
  double v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v3 = *(double *)a2;
  v4 = *(double *)a3;
  if (*(double *)a2 >= *(double *)result)
  {
    if (v4 < v3)
    {
      v8 = *((_QWORD *)a2 + 2);
      v9 = *a2;
      v10 = *((_QWORD *)a3 + 2);
      *a2 = *a3;
      *((_QWORD *)a2 + 2) = v10;
      *a3 = v9;
      *((_QWORD *)a3 + 2) = v8;
      if (*(double *)a2 < *(double *)result)
      {
        v11 = *((_QWORD *)result + 2);
        v12 = *result;
        v13 = *((_QWORD *)a2 + 2);
        *result = *a2;
        *((_QWORD *)result + 2) = v13;
        *a2 = v12;
        *((_QWORD *)a2 + 2) = v11;
      }
    }
  }
  else
  {
    if (v4 >= v3)
    {
      v14 = *((_QWORD *)result + 2);
      v15 = *result;
      v16 = *((_QWORD *)a2 + 2);
      *result = *a2;
      *((_QWORD *)result + 2) = v16;
      *a2 = v15;
      *((_QWORD *)a2 + 2) = v14;
      if (*(double *)a3 >= *(double *)a2)
        return result;
      v5 = *((_QWORD *)a2 + 2);
      v6 = *a2;
      v17 = *((_QWORD *)a3 + 2);
      *a2 = *a3;
      *((_QWORD *)a2 + 2) = v17;
    }
    else
    {
      v5 = *((_QWORD *)result + 2);
      v6 = *result;
      v7 = *((_QWORD *)a3 + 2);
      *result = *a3;
      *((_QWORD *)result + 2) = v7;
    }
    *a3 = v6;
    *((_QWORD *)a3 + 2) = v5;
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  _BOOL8 result;
  __int128 *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 *v18;
  __int128 *v19;
  __int128 *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;

  v4 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 3);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v6 = (__int128 *)(a2 - 24);
      if (*(double *)(a2 - 24) < *(double *)a1)
      {
        v7 = *(_QWORD *)(a1 + 16);
        v8 = *(_OWORD *)a1;
        v9 = *(_QWORD *)(a2 - 8);
        *(_OWORD *)a1 = *v6;
        *(_QWORD *)(a1 + 16) = v9;
        *v6 = v8;
        *(_QWORD *)(a2 - 8) = v7;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>((__int128 *)a1, (__int128 *)(a1 + 24), (__int128 *)(a2 - 24));
      return 1;
    case 4uLL:
      std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>(a1, a1 + 24, a1 + 48, (unint64_t *)(a2 - 24));
      return 1;
    case 5uLL:
      v18 = (__int128 *)(a1 + 24);
      v19 = (__int128 *)(a1 + 48);
      v20 = (__int128 *)(a1 + 72);
      std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>(a1, a1 + 24, a1 + 48, (unint64_t *)(a1 + 72));
      v22 = *(double *)(a2 - 24);
      v21 = a2 - 24;
      if (v22 < *(double *)(a1 + 72))
      {
        v23 = *(_QWORD *)(a1 + 88);
        v24 = *v20;
        v25 = *(_QWORD *)(v21 + 16);
        *v20 = *(_OWORD *)v21;
        *(_QWORD *)(a1 + 88) = v25;
        *(_OWORD *)v21 = v24;
        *(_QWORD *)(v21 + 16) = v23;
        if (*(double *)v20 < *(double *)v19)
        {
          v26 = *(_QWORD *)(a1 + 64);
          v27 = *v19;
          *v19 = *v20;
          *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 88);
          *v20 = v27;
          *(_QWORD *)(a1 + 88) = v26;
          if (*(double *)v19 < *(double *)v18)
          {
            v28 = *(_QWORD *)(a1 + 40);
            v29 = *v18;
            *v18 = *v19;
            *(_QWORD *)(a1 + 40) = *(_QWORD *)(a1 + 64);
            *v19 = v29;
            *(_QWORD *)(a1 + 64) = v28;
            if (*(double *)(a1 + 24) < *(double *)a1)
            {
              v30 = *(_QWORD *)(a1 + 16);
              v31 = *(_OWORD *)a1;
              *(_OWORD *)a1 = *v18;
              *(_QWORD *)(a1 + 16) = *(_QWORD *)(a1 + 40);
              *v18 = v31;
              *(_QWORD *)(a1 + 40) = v30;
            }
          }
        }
      }
      return 1;
    default:
      v10 = (double *)(a1 + 48);
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>((__int128 *)a1, (__int128 *)(a1 + 24), (__int128 *)(a1 + 48));
      v11 = a1 + 72;
      if (a1 + 72 == a2)
        return 1;
      v12 = 0;
      v13 = 0;
      break;
  }
  while (1)
  {
    v14 = *(double *)v11;
    if (*(double *)v11 < *v10)
    {
      v32 = *(_OWORD *)(v11 + 8);
      v15 = v12;
      while (1)
      {
        v16 = a1 + v15;
        *(_OWORD *)(v16 + 72) = *(_OWORD *)(a1 + v15 + 48);
        *(_QWORD *)(v16 + 88) = *(_QWORD *)(a1 + v15 + 64);
        if (v15 == -48)
          break;
        v15 -= 24;
        if (v14 >= *(double *)(v16 + 24))
        {
          v17 = a1 + v15 + 72;
          goto LABEL_12;
        }
      }
      v17 = a1;
LABEL_12:
      *(double *)v17 = v14;
      *(_OWORD *)(v17 + 8) = v32;
      if (++v13 == 8)
        return v11 + 24 == a2;
    }
    v10 = (double *)v11;
    v12 += 24;
    v11 += 24;
    if (v11 == a2)
      return 1;
  }
}

__n128 std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  __n128 result;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::Path::ClipStroke::make_keyframes(std::span<RB::Path::ClipStroke::Keyframe const,18446744073709551615ul>,RB::Path::ClipStroke::Subpath const&,RB::vector<RB::Path::ClipStroke::SingleKeyframe,0ul,unsigned long> &,double &)::$_0 &,RB::Path::ClipStroke::SingleKeyframe*>((__int128 *)a1, (__int128 *)a2, (__int128 *)a3);
  result.n128_u64[0] = *a4;
  if (*(double *)a4 < *(double *)a3)
  {
    v9 = *(_QWORD *)(a3 + 16);
    result = *(__n128 *)a3;
    v10 = a4[2];
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(_QWORD *)(a3 + 16) = v10;
    *(__n128 *)a4 = result;
    a4[2] = v9;
    result.n128_u64[0] = *(_QWORD *)a3;
    if (*(double *)a3 < *(double *)a2)
    {
      v11 = *(_QWORD *)(a2 + 16);
      result = *(__n128 *)a2;
      v12 = *(_QWORD *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(_QWORD *)(a2 + 16) = v12;
      *(__n128 *)a3 = result;
      *(_QWORD *)(a3 + 16) = v11;
      result.n128_u64[0] = *(_QWORD *)a2;
      if (*(double *)a2 < *(double *)a1)
      {
        v13 = *(_QWORD *)(a1 + 16);
        result = *(__n128 *)a1;
        v14 = *(_QWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_QWORD *)(a1 + 16) = v14;
        *(__n128 *)a2 = result;
        *(_QWORD *)(a2 + 16) = v13;
      }
    }
  }
  return result;
}

void RB::Path::ClipStroke::Subpath::add<CG::LineSegment>(RB::Path::ClipStroke::Subpath *this, float64x2_t *a2, _QWORD *a3, double a4, double a5, double a6, double a7)
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v15;
  double v16;
  double v17;
  double v18;
  float64x2_t v19;
  _OWORD v20[4];
  float64x2_t v21;
  float64x2_t v22;

  v8 = a5 + a4;
  if (a6 < a4)
    a6 = a4;
  if (a6 <= v8)
    v9 = a6;
  else
    v9 = v8;
  if (a7 >= a4)
    v10 = a7;
  else
    v10 = a4;
  if (v10 > v8)
    v10 = v8;
  v11 = v10 - v9;
  if (v10 - v9 >= 0.0001)
  {
    v15 = v10 - a4;
    v16 = 0.0;
    if (v9 - a4 >= 0.0001)
      v16 = CG::LineSegment::index(a2, v9 - a4);
    v17 = 1.0;
    if (v15 <= a5 + -0.0001)
      v17 = CG::LineSegment::index(a2, v15);
    if (v16 <= 0.0001 && v17 >= 0.9999)
    {
      v18 = RB::Path::ClipStroke::Subpath::add(this, a2, a5);
      v11 = a5;
      if (!a3)
        return;
LABEL_26:
      RB::Path::ClipStroke::DistanceMap::append(a3, v9, v18, v11);
      return;
    }
    v19 = a2[1];
    v21 = *a2;
    v22 = v19;
    if (v16 <= 0.0001)
    {
      if (v17 >= 0.9999)
        goto LABEL_25;
    }
    else
    {
      CG::LineSegment::split(&v21, v16, (uint64_t)v20);
      v21 = (float64x2_t)v20[2];
      v22 = (float64x2_t)v20[3];
      if (v17 >= 0.9999)
        goto LABEL_25;
      v17 = (v17 - v16) / (1.0 - v16);
    }
    CG::LineSegment::split(&v21, v17, (uint64_t)v20);
    v21 = (float64x2_t)v20[0];
    v22 = (float64x2_t)v20[1];
LABEL_25:
    v18 = RB::Path::ClipStroke::Subpath::add(this, &v21, INFINITY);
    if (!a3)
      return;
    goto LABEL_26;
  }
}

void RB::Path::ClipStroke::Subpath::add<CG::Quadratic>(__n128 *this, CG::Quadratic *a2, _QWORD *a3, double a4, double a5, double a6, double a7)
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[10];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  v8 = a5 + a4;
  if (a6 < a4)
    a6 = a4;
  if (a6 <= v8)
    v9 = a6;
  else
    v9 = v8;
  if (a7 >= a4)
    v10 = a7;
  else
    v10 = a4;
  if (v10 > v8)
    v10 = v8;
  v11 = v10 - v9;
  if (v10 - v9 >= 0.0001)
  {
    v15 = v10 - a4;
    v16 = 0.0;
    if (v9 - a4 >= 0.0001)
    {
      CG::Quadratic::index(a2, v9 - a4);
      v16 = v17;
    }
    v18 = 1.0;
    if (v15 <= a5 + -0.0001)
    {
      CG::Quadratic::index(a2, v15);
      v18 = v19;
    }
    if (v16 <= 0.0001 && v18 >= 0.9999)
    {
      v20 = RB::Path::ClipStroke::Subpath::add(this, a2, a5);
      v11 = a5;
      if (!a3)
        return;
LABEL_26:
      RB::Path::ClipStroke::DistanceMap::append(a3, v9, v20, v11);
      return;
    }
    v21 = *((_OWORD *)a2 + 3);
    v26 = *((_OWORD *)a2 + 2);
    v27 = v21;
    v28 = *((_OWORD *)a2 + 4);
    v22 = *((_OWORD *)a2 + 1);
    v24 = *(_OWORD *)a2;
    v25 = v22;
    if (v16 <= 0.0001)
    {
      if (v18 >= 0.9999)
        goto LABEL_25;
    }
    else
    {
      CG::Quadratic::split((CG::Quadratic *)&v24, v16, (uint64_t)v23);
      v26 = v23[7];
      v27 = v23[8];
      v28 = v23[9];
      v24 = v23[5];
      v25 = v23[6];
      if (v18 >= 0.9999)
        goto LABEL_25;
      v18 = (v18 - v16) / (1.0 - v16);
    }
    CG::Quadratic::split((CG::Quadratic *)&v24, v18, (uint64_t)v23);
    v26 = v23[2];
    v27 = v23[3];
    v28 = v23[4];
    v24 = v23[0];
    v25 = v23[1];
LABEL_25:
    v20 = RB::Path::ClipStroke::Subpath::add(this, (const CG::Quadratic *)&v24, INFINITY);
    if (!a3)
      return;
    goto LABEL_26;
  }
}

void RB::Path::ClipStroke::Subpath::add<CG::Cubic>(__n128 *this, float64x2_t *a2, _QWORD *a3, double a4, double a5, double a6, double a7)
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v15;
  double v16;
  double v17;
  double v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22[14];
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;

  v8 = a5 + a4;
  if (a6 < a4)
    a6 = a4;
  if (a6 <= v8)
    v9 = a6;
  else
    v9 = v8;
  if (a7 >= a4)
    v10 = a7;
  else
    v10 = a4;
  if (v10 <= v8)
    v8 = v10;
  v11 = v8 - v9;
  if (v8 - v9 >= 0.0001)
  {
    v15 = v8 - a4;
    v16 = 0.0;
    if (v9 - a4 >= 0.0001)
      v16 = CG::Cubic::index((CG::Cubic *)a2, v9 - a4, 0.5);
    v17 = 1.0;
    if (v15 <= a5 + -0.0001)
      v17 = CG::Cubic::index((CG::Cubic *)a2, v15, 0.5);
    if (v16 <= 0.0001 && v17 >= 0.9999)
    {
      v18 = RB::Path::ClipStroke::Subpath::add(this, (const CG::Cubic *)a2, a5);
      v11 = a5;
      if (!a3)
        return;
LABEL_26:
      RB::Path::ClipStroke::DistanceMap::append(a3, v9, v18, v11);
      return;
    }
    v19 = a2[5];
    v27 = a2[4];
    v28 = v19;
    v29 = a2[6];
    v20 = a2[1];
    v23 = *a2;
    v24 = v20;
    v21 = a2[3];
    v25 = a2[2];
    v26 = v21;
    if (v16 <= 0.0001)
    {
      if (v17 >= 0.9999)
        goto LABEL_25;
    }
    else
    {
      CG::Cubic::split(&v23, v16, v22);
      v27 = v22[11];
      v28 = v22[12];
      v29 = v22[13];
      v23 = v22[7];
      v24 = v22[8];
      v25 = v22[9];
      v26 = v22[10];
      if (v17 >= 0.9999)
        goto LABEL_25;
      v17 = (v17 - v16) / (1.0 - v16);
    }
    CG::Cubic::split(&v23, v17, v22);
    v27 = v22[4];
    v28 = v22[5];
    v29 = v22[6];
    v23 = v22[0];
    v24 = v22[1];
    v25 = v22[2];
    v26 = v22[3];
LABEL_25:
    v18 = RB::Path::ClipStroke::Subpath::add(this, (const CG::Cubic *)&v23, INFINITY);
    if (!a3)
      return;
    goto LABEL_26;
  }
}

void RB::Path::ClipStroke::Clipper::split_segment<CG::LineSegment>(uint64_t a1, float64_t a2, float64_t a3, float64_t a4, float64_t a5, double a6)
{
  double v6;
  double v8;
  double v9;
  double v10;
  __n128 v11;
  float64x2_t v12;
  double v13;
  float v14;
  float64x2_t v15[4];
  float64x2_t v16;
  float64x2_t v17;

  v6 = a6;
  v16.f64[0] = a2;
  v16.f64[1] = a3;
  v17.f64[0] = a4;
  v17.f64[1] = a5;
  v8 = *(double *)(a1 + 56);
  v9 = v8 + a6;
  v10 = *(double *)(a1 + 88);
  if (v10 < v8 + a6)
  {
    do
    {
      v11.n128_f64[0] = CG::LineSegment::index(&v16, v10 - v8);
      if (v11.n128_f64[0] <= 0.0001)
      {
        v11.n128_u64[0] = *(_QWORD *)(a1 + 88);
      }
      else
      {
        CG::LineSegment::split(&v16, v11.n128_f64[0], (uint64_t)v15);
        v12 = vsubq_f64(v15[1], v15[0]);
        v13 = sqrt(vaddvq_f64(vmulq_f64(v12, v12)));
        RB::Path::ClipStroke::Clipper::clip_segment<CG::LineSegment>(a1, v15, v13, *(float *)(a1 + 96));
        v11.n128_u64[0] = *(_QWORD *)(a1 + 88);
        v16 = v15[2];
        v17 = v15[3];
        v6 = v6 - v13;
        v8 = v11.n128_f64[0];
      }
      RB::Path::ClipStroke::Clipper::advance_keyframes((RB::Path::ClipStroke::Clipper *)a1, v11);
      v10 = *(double *)(a1 + 88);
    }
    while (v10 < v9);
  }
  v14 = (v9 - *(double *)(a1 + 64)) / (v10 - *(double *)(a1 + 64));
  RB::Path::ClipStroke::Clipper::clip_segment<CG::LineSegment>(a1, &v16, v6, *(float *)(a1 + 72) + (float)((float)(*(float *)(a1 + 96) - *(float *)(a1 + 72)) * v14));
  *(double *)(a1 + 56) = v9;
}

_BYTE *RB::Path::ClipStroke::Clipper::emit_segment<CG::LineSegment>(_BYTE *result, float64x2_t *a2)
{
  float64x2_t v2;
  _BYTE *v4;
  double v5;
  double v6;

  v2 = vsubq_f64(a2[1], *a2);
  if (vaddvq_f64(vmulq_f64(v2, v2)) > 0.00000001)
  {
    v4 = result;
    if (!result[205])
    {
      *((float64x2_t *)result + 10) = *a2;
      *((float64x2_t *)result + 11) = vsubq_f64(*a2, a2[1]);
      (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)result + 8) + 16))(*(_QWORD *)(*(_QWORD *)result
                                                                                                 + 8));
      v4[205] = 1;
    }
    result = (_BYTE *)(*(uint64_t (**)(_QWORD, __n128))(**(_QWORD **)(*(_QWORD *)v4 + 8) + 24))(*(_QWORD *)(*(_QWORD *)v4 + 8), (__n128)a2[1]);
    *(float64x2_t *)(v4 + 120) = a2[1];
    *(float64x2_t *)(v4 + 136) = vsubq_f64(a2[1], *a2);
    if ((v4[104] & 1) != 0)
    {
      v6 = INFINITY;
    }
    else
    {
      v5 = *(double *)(*((_QWORD *)v4 + 1) + 16);
      v6 = vabdd_f64(*((double *)v4 + 11), *((double *)v4 + 8));
      if (v5 - v6 < v6)
        v6 = v5 - v6;
    }
    *((double *)v4 + 19) = v6;
  }
  return result;
}

void RB::Path::ClipStroke::Clipper::clip_segment<CG::LineSegment>(uint64_t a1, float64x2_t *a2, double a3, float a4)
{
  int v8;
  RB::Path::ClipStroke *v9;
  int v10;
  char v11;
  float v12;
  float v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float64x2_t v20;
  float64x2_t *v21;
  double v22;
  double v23;
  float64x2_t v24;
  _BYTE v25[32];
  float64x2_t v26[2];

  v8 = *(unsigned __int8 *)(a1 + 204);
  v9 = *(RB::Path::ClipStroke **)a1;
  v10 = RB::Path::ClipStroke::value_clipped(*(RB::Path::ClipStroke **)a1, a4);
  if (v8 != v10)
  {
    v11 = v10;
    v12 = *(float *)(a1 + 112);
    if (v12 == a4)
    {
      v14 = 0.0;
    }
    else
    {
      v13 = *((float *)v9 + 5);
      if (v13 < 0.0)
        v13 = 0.0;
      if (v13 > 1.0)
        v13 = 1.0;
      v14 = (float)((float)(v13 - v12) / (float)(a4 - v12));
    }
    v15 = CG::LineSegment::index(a2, v14 * a3);
    if (v15 <= 0.9999)
    {
      CG::LineSegment::split(a2, v15, (uint64_t)v25);
      if (v8)
      {
        v21 = v26;
        v22 = v26[0].f64[0];
        v24 = vsubq_f64(v26[0], v26[1]);
        if ((*(_BYTE *)(a1 + 104) & 1) != 0)
        {
          v23 = INFINITY;
        }
        else
        {
          v16 = *(double *)(*(_QWORD *)(a1 + 8) + 16);
          v23 = vabdd_f64(*(double *)(a1 + 88), *(double *)(a1 + 64));
          v22 = v16 - v23;
          if (v16 - v23 < v23)
            v23 = v16 - v23;
        }
        RB::Path::ClipStroke::Clipper::emit_cap((uint64_t *)a1, v26, &v24, v23, v22, v16, v17, v18, v19, v20);
      }
      else
      {
        if (v15 <= 0.0001)
        {
LABEL_22:
          *(_BYTE *)(a1 + 204) = v11;
          goto LABEL_23;
        }
        v21 = (float64x2_t *)v25;
      }
      RB::Path::ClipStroke::Clipper::emit_segment<CG::LineSegment>((_BYTE *)a1, v21);
      goto LABEL_22;
    }
  }
  if (!v8)
    RB::Path::ClipStroke::Clipper::emit_segment<CG::LineSegment>((_BYTE *)a1, a2);
LABEL_23:
  *(float *)(a1 + 112) = a4;
}

void RB::Path::ClipStroke::Clipper::split_segment<CG::Quadratic>(uint64_t a1, CG::Quadratic *this, double a3)
{
  double v3;
  double v6;
  double v7;
  double i;
  __n128 v9;
  double v10;
  double v11;
  __int128 v12;
  float v13;
  _OWORD v14[10];

  v3 = a3;
  v6 = *(double *)(a1 + 56);
  v7 = v6 + a3;
  for (i = *(double *)(a1 + 88); i < v7; i = *(double *)(a1 + 88))
  {
    CG::Quadratic::index(this, i - v6);
    if (v9.n128_f64[0] > 0.0001)
    {
      CG::Quadratic::split(this, v9.n128_f64[0], (uint64_t)v14);
      CG::Quadratic::length((CG::Quadratic *)v14, 0);
      v11 = v10;
      RB::Path::ClipStroke::Clipper::clip_segment<CG::Quadratic>(a1, (CG::Quadratic *)v14, v10, *(float *)(a1 + 96));
      v6 = *(double *)(a1 + 88);
      v12 = v14[8];
      *((_OWORD *)this + 2) = v14[7];
      *((_OWORD *)this + 3) = v12;
      *((_OWORD *)this + 4) = v14[9];
      v9 = (__n128)v14[6];
      v3 = v3 - v11;
      *(_OWORD *)this = v14[5];
      *((__n128 *)this + 1) = v9;
    }
    v9.n128_u64[0] = *(_QWORD *)(a1 + 88);
    RB::Path::ClipStroke::Clipper::advance_keyframes((RB::Path::ClipStroke::Clipper *)a1, v9);
  }
  v13 = (v7 - *(double *)(a1 + 64)) / (i - *(double *)(a1 + 64));
  RB::Path::ClipStroke::Clipper::clip_segment<CG::Quadratic>(a1, this, v3, *(float *)(a1 + 72) + (float)((float)(*(float *)(a1 + 96) - *(float *)(a1 + 72)) * v13));
  *(double *)(a1 + 56) = v7;
}

void RB::Path::ClipStroke::Clipper::emit_segment<CG::Quadratic>(__n128 *a1, float64x2_t *this)
{
  double v4;
  double v5;
  unint64_t v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double v10;
  double v11;

  v4 = this[1].f64[0];
  v5 = this[1].f64[1];
  if ((v4 - this->f64[0]) * (v4 - this->f64[0]) + (v5 - this->f64[1]) * (v5 - this->f64[1]) > 0.00000001
    || (this[2].f64[0] - v4) * (this[2].f64[0] - v4) + (this[2].f64[1] - v5) * (this[2].f64[1] - v5) > 0.00000001)
  {
    if (!a1[12].n128_u8[13])
    {
      a1[10].n128_f64[0] = CG::Quadratic::start_point((CG::Quadratic *)this);
      a1[10].n128_u64[1] = v6;
      a1[11].n128_f64[0] = -CG::Quadratic::derivative(this, 0.0);
      a1[11].n128_f64[1] = -v7;
      (*(void (**)(_QWORD, __n128))(**(_QWORD **)(a1->n128_u64[0] + 8) + 16))(*(_QWORD *)(a1->n128_u64[0] + 8), a1[10]);
      a1[12].n128_u8[13] = 1;
    }
    (*(void (**)(_QWORD, __n128, __n128))(**(_QWORD **)(a1->n128_u64[0] + 8) + 32))(*(_QWORD *)(a1->n128_u64[0] + 8), (__n128)this[1], (__n128)this[2]);
    a1[7].n128_f64[1] = CG::Quadratic::end_point((CG::Quadratic *)this);
    a1[8].n128_u64[0] = v8;
    a1[8].n128_f64[1] = CG::Quadratic::derivative(this, 1.0);
    a1[9].n128_u64[0] = v9;
    if ((a1[6].n128_u8[8] & 1) != 0)
    {
      v11 = INFINITY;
    }
    else
    {
      v10 = *(double *)(a1->n128_u64[1] + 16);
      v11 = vabdd_f64(a1[5].n128_f64[1], a1[4].n128_f64[0]);
      if (v10 - v11 < v11)
        v11 = v10 - v11;
    }
    a1[9].n128_f64[1] = v11;
  }
}

void RB::Path::ClipStroke::Clipper::clip_segment<CG::Quadratic>(uint64_t a1, CG::Quadratic *a2, double a3, float a4)
{
  int v8;
  RB::Path::ClipStroke *v9;
  int v10;
  char v11;
  float v12;
  float v13;
  double v14;
  double v15;
  double v16;
  float64x2_t *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float64x2_t v23;
  double v24;
  double v25;
  double v26;
  float64x2_t v27;
  _BYTE v28[80];
  float64x2_t v29[5];

  v8 = *(unsigned __int8 *)(a1 + 204);
  v9 = *(RB::Path::ClipStroke **)a1;
  v10 = RB::Path::ClipStroke::value_clipped(*(RB::Path::ClipStroke **)a1, a4);
  if (v8 != v10)
  {
    v11 = v10;
    v12 = *(float *)(a1 + 112);
    if (v12 == a4)
    {
      v14 = 0.0;
    }
    else
    {
      v13 = *((float *)v9 + 5);
      if (v13 < 0.0)
        v13 = 0.0;
      if (v13 > 1.0)
        v13 = 1.0;
      v14 = (float)((float)(v13 - v12) / (float)(a4 - v12));
    }
    CG::Quadratic::index(a2, v14 * a3);
    v16 = v15;
    if (v15 <= 0.9999)
    {
      CG::Quadratic::split(a2, v15, (uint64_t)v28);
      if (v8)
      {
        v17 = v29;
        v18 = CG::Quadratic::derivative(v29, 0.0);
        v25 = -v24;
        v27.f64[0] = -v18;
        v27.f64[1] = v25;
        if ((*(_BYTE *)(a1 + 104) & 1) != 0)
        {
          v26 = INFINITY;
        }
        else
        {
          v19 = *(double *)(*(_QWORD *)(a1 + 8) + 16);
          v26 = vabdd_f64(*(double *)(a1 + 88), *(double *)(a1 + 64));
          v25 = v19 - v26;
          if (v19 - v26 < v26)
            v26 = v19 - v26;
        }
        RB::Path::ClipStroke::Clipper::emit_cap((uint64_t *)a1, v29, &v27, v26, v25, v19, v20, v21, v22, v23);
      }
      else
      {
        if (v16 <= 0.0001)
        {
LABEL_22:
          *(_BYTE *)(a1 + 204) = v11;
          goto LABEL_23;
        }
        v17 = (float64x2_t *)v28;
      }
      RB::Path::ClipStroke::Clipper::emit_segment<CG::Quadratic>((__n128 *)a1, v17);
      goto LABEL_22;
    }
  }
  if (!v8)
    RB::Path::ClipStroke::Clipper::emit_segment<CG::Quadratic>((__n128 *)a1, (float64x2_t *)a2);
LABEL_23:
  *(float *)(a1 + 112) = a4;
}

void RB::Path::ClipStroke::Clipper::split_segment<CG::Cubic>(uint64_t a1, CG::Cubic *this, double a3)
{
  double v3;
  double v6;
  double v7;
  double i;
  __n128 v9;
  double v10;
  float64x2_t v11;
  float64x2_t v12;
  float v13;
  float64x2_t v14[14];

  v3 = a3;
  v6 = *(double *)(a1 + 56);
  v7 = v6 + a3;
  for (i = *(double *)(a1 + 88); i < v7; i = *(double *)(a1 + 88))
  {
    v9.n128_f64[0] = CG::Cubic::index(this, i - v6, 0.5);
    if (v9.n128_f64[0] > 0.0001)
    {
      CG::Cubic::split((float64x2_t *)this, v9.n128_f64[0], v14);
      v10 = CG::Cubic::length((CG::Cubic *)v14, 0.5);
      RB::Path::ClipStroke::Clipper::clip_segment<CG::Cubic>(a1, (CG::Cubic *)v14, v10, *(float *)(a1 + 96));
      v6 = *(double *)(a1 + 88);
      v11 = v14[12];
      *((float64x2_t *)this + 4) = v14[11];
      *((float64x2_t *)this + 5) = v11;
      *((float64x2_t *)this + 6) = v14[13];
      v12 = v14[8];
      *(float64x2_t *)this = v14[7];
      *((float64x2_t *)this + 1) = v12;
      v3 = v3 - v10;
      v9 = (__n128)v14[10];
      *((float64x2_t *)this + 2) = v14[9];
      *((__n128 *)this + 3) = v9;
    }
    v9.n128_u64[0] = *(_QWORD *)(a1 + 88);
    RB::Path::ClipStroke::Clipper::advance_keyframes((RB::Path::ClipStroke::Clipper *)a1, v9);
  }
  v13 = (v7 - *(double *)(a1 + 64)) / (i - *(double *)(a1 + 64));
  RB::Path::ClipStroke::Clipper::clip_segment<CG::Cubic>(a1, this, v3, *(float *)(a1 + 72) + (float)((float)(*(float *)(a1 + 96) - *(float *)(a1 + 72)) * v13));
  *(double *)(a1 + 56) = v7;
}

void RB::Path::ClipStroke::Clipper::emit_segment<CG::Cubic>(uint64_t a1, __n128 *this)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;

  v4 = this[1].n128_f64[0];
  v5 = this[1].n128_f64[1];
  v6 = this->n128_f64[1];
  if ((v4 - this->n128_f64[0]) * (v4 - this->n128_f64[0]) + (v5 - v6) * (v5 - v6) > 0.00000001
    || (v7 = this[2].n128_f64[0], v8 = this[2].n128_f64[1], (v7 - v4) * (v7 - v4) + (v8 - v5) * (v8 - v5) > 0.00000001)
    || (this[3].n128_f64[0] - v7) * (this[3].n128_f64[0] - v7) + (this[3].n128_f64[1] - v8) * (this[3].n128_f64[1] - v8) > 0.00000001)
  {
    if (!*(_BYTE *)(a1 + 205))
    {
      *(_QWORD *)(a1 + 160) = this->n128_u64[0];
      *(double *)(a1 + 168) = v6;
      *(double *)(a1 + 176) = -CG::Cubic::derivative((CG::Cubic *)this, 0.0);
      *(double *)(a1 + 184) = -v9;
      (*(void (**)(_QWORD, __n128))(**(_QWORD **)(*(_QWORD *)a1 + 8) + 16))(*(_QWORD *)(*(_QWORD *)a1 + 8), *(__n128 *)(a1 + 160));
      *(_BYTE *)(a1 + 205) = 1;
    }
    (*(void (**)(_QWORD, __n128, __n128, __n128))(**(_QWORD **)(*(_QWORD *)a1 + 8) + 40))(*(_QWORD *)(*(_QWORD *)a1 + 8), this[1], this[2], this[3]);
    *(__n128 *)(a1 + 120) = this[3];
    *(double *)(a1 + 136) = CG::Cubic::derivative((CG::Cubic *)this, 1.0);
    *(_QWORD *)(a1 + 144) = v10;
    if ((*(_BYTE *)(a1 + 104) & 1) != 0)
    {
      v12 = INFINITY;
    }
    else
    {
      v11 = *(double *)(*(_QWORD *)(a1 + 8) + 16);
      v12 = vabdd_f64(*(double *)(a1 + 88), *(double *)(a1 + 64));
      if (v11 - v12 < v12)
        v12 = v11 - v12;
    }
    *(double *)(a1 + 152) = v12;
  }
}

void RB::Path::ClipStroke::Clipper::clip_segment<CG::Cubic>(uint64_t a1, CG::Cubic *a2, double a3, float a4)
{
  int v8;
  RB::Path::ClipStroke *v9;
  int v10;
  char v11;
  float v12;
  float v13;
  double v14;
  double v15;
  float64x2_t *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float64x2_t v22;
  double v23;
  double v24;
  double v25;
  float64x2_t v26;
  float64x2_t v27[7];
  float64x2_t v28[7];

  v8 = *(unsigned __int8 *)(a1 + 204);
  v9 = *(RB::Path::ClipStroke **)a1;
  v10 = RB::Path::ClipStroke::value_clipped(*(RB::Path::ClipStroke **)a1, a4);
  if (v8 != v10)
  {
    v11 = v10;
    v12 = *(float *)(a1 + 112);
    if (v12 == a4)
    {
      v14 = 0.0;
    }
    else
    {
      v13 = *((float *)v9 + 5);
      if (v13 < 0.0)
        v13 = 0.0;
      if (v13 > 1.0)
        v13 = 1.0;
      v14 = (float)((float)(v13 - v12) / (float)(a4 - v12));
    }
    v15 = CG::Cubic::index(a2, v14 * a3, 0.5);
    if (v15 <= 0.9999)
    {
      CG::Cubic::split((float64x2_t *)a2, v15, v27);
      if (v8)
      {
        v16 = v28;
        v17 = CG::Cubic::derivative((CG::Cubic *)v28, 0.0);
        v24 = -v23;
        v26.f64[0] = -v17;
        v26.f64[1] = v24;
        if ((*(_BYTE *)(a1 + 104) & 1) != 0)
        {
          v25 = INFINITY;
        }
        else
        {
          v18 = *(double *)(*(_QWORD *)(a1 + 8) + 16);
          v25 = vabdd_f64(*(double *)(a1 + 88), *(double *)(a1 + 64));
          v24 = v18 - v25;
          if (v18 - v25 < v25)
            v25 = v18 - v25;
        }
        RB::Path::ClipStroke::Clipper::emit_cap((uint64_t *)a1, v28, &v26, v25, v24, v18, v19, v20, v21, v22);
      }
      else
      {
        if (v15 <= 0.0001)
        {
LABEL_22:
          *(_BYTE *)(a1 + 204) = v11;
          goto LABEL_23;
        }
        v16 = v27;
      }
      RB::Path::ClipStroke::Clipper::emit_segment<CG::Cubic>(a1, (__n128 *)v16);
      goto LABEL_22;
    }
  }
  if (!v8)
    RB::Path::ClipStroke::Clipper::emit_segment<CG::Cubic>(a1, (__n128 *)a2);
LABEL_23:
  *(float *)(a1 + 112) = a4;
}

float RB::Symbol::Keyframes::eval(RB::Symbol::Keyframes *this, float a2, const RB::Symbol::KeyframeStorage *a3, double a4)
{
  unint64_t v4;
  const RB::Symbol::KeyframeStorage *v5;
  unsigned int v6;
  float v8;
  unsigned int v9;
  float v10;

  v4 = *((_QWORD *)this + 1);
  if ((v4 & 1) != 0)
  {
    v5 = (const RB::Symbol::KeyframeStorage *)*((_QWORD *)a3 + 96);
    if (!v5)
      v5 = a3;
    v4 = (unint64_t)v5 + 12 * (v4 >> 1);
  }
  LODWORD(a4) = *(_DWORD *)(v4 + 4);
  if (*(float *)&a4 < 0.0)
  {
    v6 = 0;
    return *(float *)(v4 + 12 * v6 + 8);
  }
  v8 = a2 - *((float *)this + 1);
  if (v8 >= *(float *)&a4)
  {
    v9 = 1;
    while (1)
    {
      v6 = v9;
      v10 = *(float *)(v4 + 12 * v9 + 4);
      if (v10 < 0.0)
        break;
      v8 = fmaxf(v8 - *(float *)&a4, 0.0);
      ++v9;
      *(float *)&a4 = v10;
      if (v8 < v10)
        return *(float *)(v4 + 12 * v6 + 8)
             + (float)((float)(*(float *)(v4 + 12 * v9 + 8) - *(float *)(v4 + 12 * v6 + 8))
                     * RB::Symbol::Keyframes::Value::interpolant((RB::Symbol::Keyframes::Value *)(v4 + 12 * v6), v8, *(float32x2_t *)&a4));
    }
    return *(float *)(v4 + 12 * v6 + 8);
  }
  v6 = 0;
  v9 = 1;
  return *(float *)(v4 + 12 * v6 + 8)
       + (float)((float)(*(float *)(v4 + 12 * v9 + 8) - *(float *)(v4 + 12 * v6 + 8))
               * RB::Symbol::Keyframes::Value::interpolant((RB::Symbol::Keyframes::Value *)(v4 + 12 * v6), v8, *(float32x2_t *)&a4));
}

float RB::Symbol::Keyframes::Value::interpolant(RB::Symbol::Keyframes::Value *this, float a2, float32x2_t a3)
{
  float32x2_t v3;
  float32x2_t v4;
  float result;
  int v6;
  float v7;
  BOOL v8;

  a3.i32[0] = *((_DWORD *)this + 1);
  v3 = vrecpe_f32(a3);
  v4 = vmul_f32(vrecps_f32(a3, v3), v3);
  result = a2 * vmul_f32(v4, vrecps_f32(a3, v4)).f32[0];
  if (result < 0.0)
    result = 0.0;
  if (result > 1.0)
    result = 1.0;
  v6 = *(_DWORD *)this;
  if (*(_DWORD *)this <= 0x27u)
  {
    v8 = v7 == 0.0 && v6 == 0;
    if (!v8 || ((0xFFFFEFCAFFuLL >> v6) & 1) == 0)
    {
      if (v7 == 0.33
        && ((0xFFFFEFCAFFuLL >> v6) & 1) != 0
        && ((0x1957D041DAuLL >> v6) & 1) != 0
        && ((0xFF7FF6E5FFuLL >> v6) & 1) != 0)
      {
        return (float)(result * result) * (float)((float)(result * -2.0) + 3.0);
      }
      else
      {
      }
    }
  }
  return result;
}

void RB::Symbol::Keyframes::print(int *a1, std::string *this, int a3, uint64_t a4)
{
  int v4;
  BOOL v5;
  uint64_t v9;
  const char *v10;
  float v11;
  unsigned int v12;
  int v13;
  const char *v14;
  unsigned int v15;
  unint64_t v16;
  uint64_t v17;
  float *v18;
  int v19;
  float v20;

  v4 = (*a1 >> 4) & 7;
  if (v4)
    v5 = v4 == a3;
  else
    v5 = 1;
  if (v5)
  {
    v9 = *a1 & 0xFLL;
    if ((_DWORD)v9 == 15)
      v10 = "unknown-property";
    else
      v10 = RB::Symbol::Keyframes::print(RB::SexpString &,RB::Symbol::Keyframes::Symbol,RB::Symbol::KeyframeStorage const*)const::property_names[v9];
    RB::SexpString::push(this, v10);
    v11 = *((float *)a1 + 1);
    if (v11 != 0.0)
      RB::SexpString::printf(this, 0, "(begin %.4f)", v11);
    v12 = *a1;
    v13 = (*a1 >> 4) & 7;
    if (v13)
    {
      v14 = "to";
      if (v13 == 1)
        v14 = "from";
      RB::SexpString::printf(this, 0, "(symbol %s)", v14);
      v12 = *a1;
    }
    if (((v12 >> 10) & 0x7FF) != 0x7FF)
    {
      RB::SexpString::printf(this, 0, "(timing-group %u)", (v12 >> 10) & 0x7FF);
      v12 = *a1;
    }
    v15 = v12 >> 21;
    if (v15 != 2047)
      RB::SexpString::printf(this, 0, "(value-index %u)", v15);
    v16 = *((_QWORD *)a1 + 1);
    if ((v16 & 1) != 0)
    {
      if (!a4)
      {
LABEL_30:
        RB::SexpString::pop(this);
        return;
      }
      v17 = *(_QWORD *)(a4 + 768);
      if (!v17)
        v17 = a4;
      v16 = v17 + 12 * (v16 >> 1);
    }
    if (v16)
    {
      v18 = (float *)(v16 + 4);
      do
      {
        RB::SexpString::push(this, "value");
        RB::SexpString::printf(this, 0, "(value %.2f)", v18[1]);
        if (*v18 >= 0.0)
        {
          RB::SexpString::printf(this, 0, "(duration %.4f)", *v18);
          v19 = *((_DWORD *)v18 - 1);
          if ((v19 - 1) <= 0x26)
        }
        RB::SexpString::pop(this);
        v20 = *v18;
        v18 += 3;
      }
      while (v20 >= 0.0);
    }
    goto LABEL_30;
  }
}

uint64_t RB::Symbol::KeyframeStorage::clear(uint64_t this)
{
  *(_DWORD *)(this + 776) = 0;
  *(_DWORD *)(this + 1816) = 0;
  *(_BYTE *)(this + 1824) = 0;
  return this;
}

_DWORD *RB::Symbol::KeyframeStorage::push_value(_DWORD *__dst, int a2, float a3, float a4)
{
  _DWORD *v7;
  int v8;
  unsigned int v9;
  _DWORD *v10;
  float *v11;
  float v12;

  v7 = __dst;
  v8 = __dst[194];
  v9 = v8 + 1;
  if (__dst[195] < (v8 + 1))
  {
    __dst = RB::vector<RB::Symbol::Keyframes::Value,64ul,unsigned int>::reserve_slow(__dst, v9);
    v8 = v7[194];
    v9 = v8 + 1;
  }
  v10 = (_DWORD *)*((_QWORD *)v7 + 96);
  if (!v10)
    v10 = v7;
  v11 = (float *)&v10[3 * v8];
  *(_DWORD *)v11 = a2;
  v12 = 0.0;
  if (a4 >= 0.0)
    v12 = a4;
  v11[1] = v12;
  v11[2] = a3;
  v7[194] = v9;
  return __dst;
}

_DWORD *RB::Symbol::KeyframeStorage::push_value(_DWORD *this, float a2)
{
  _DWORD *v3;
  int v4;
  unsigned int v5;
  _DWORD *v6;
  float *v7;

  v3 = this;
  v4 = this[194];
  v5 = v4 + 1;
  if (this[195] < (v4 + 1))
  {
    this = RB::vector<RB::Symbol::Keyframes::Value,64ul,unsigned int>::reserve_slow(this, v5);
    v4 = v3[194];
    v5 = v4 + 1;
  }
  v6 = (_DWORD *)*((_QWORD *)v3 + 96);
  if (!v6)
    v6 = v3;
  v7 = (float *)&v6[3 * v4];
  *(_QWORD *)v7 = 0xBF80000000000000;
  v7[2] = a2;
  v3[194] = v5;
  return this;
}

__n128 RB::Symbol::KeyframeStorage::push_keyframes(RB::Symbol::KeyframeStorage *this, __n128 *a2)
{
  char *v4;
  int v5;
  char *v6;
  __n128 result;

  v4 = (char *)this + 784;
  v5 = *((_DWORD *)this + 454);
  if (*((_DWORD *)this + 455) < (v5 + 1))
  {
    RB::vector<RB::Symbol::Keyframes,64ul,unsigned int>::reserve_slow((char *)this + 784, v5 + 1);
    v5 = *((_DWORD *)this + 454);
  }
  v6 = (char *)*((_QWORD *)this + 226);
  if (!v6)
    v6 = v4;
  result = *a2;
  *(__n128 *)&v6[16 * v5] = *a2;
  ++*((_DWORD *)this + 454);
  return result;
}

uint64_t RB::Symbol::KeyframeStorage::commit(RB::Symbol::KeyframeStorage *this)
{
  int v2;
  char *v3;
  char *v4;

  if (!*((_BYTE *)this + 1824))
  {
    v2 = *((_DWORD *)this + 454);
    if (*((_DWORD *)this + 455) < (v2 + 1))
    {
      RB::vector<RB::Symbol::Keyframes,64ul,unsigned int>::reserve_slow((char *)this + 784, v2 + 1);
      v2 = *((_DWORD *)this + 454);
    }
    v3 = (char *)*((_QWORD *)this + 226);
    if (!v3)
      v3 = (char *)this + 784;
    v4 = &v3[16 * v2];
    *(_QWORD *)v4 = 4294966272;
    *((_QWORD *)v4 + 1) = 0;
    ++*((_DWORD *)this + 454);
    *((_BYTE *)this + 1824) = 1;
  }
  if (*((_QWORD *)this + 226))
    return *((_QWORD *)this + 226);
  else
    return (uint64_t)this + 784;
}

char **RB::vector<RB::SharedSurface::AsyncUpdate,0ul,unsigned int>::~vector(char **a1)
{
  char *v2;
  unint64_t v3;
  id *v4;
  unsigned int *v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  v2 = *a1;
  if (*((_DWORD *)a1 + 2))
  {
    v3 = 0;
    do
    {
      v4 = (id *)&v2[144 * v3];

      RB::SharedSubsurface::~SharedSubsurface(v4 + 1);
      v5 = (unsigned int *)*v4;
      if (*v4)
      {
        v6 = v5 + 2;
        do
        {
          v7 = __ldxr(v6);
          v8 = v7 - 1;
        }
        while (__stlxr(v8, v6));
        if (!v8)
        {
          __dmb(9u);
          (*(void (**)(unsigned int *))(*(_QWORD *)v5 + 8))(v5);
        }
      }
      ++v3;
    }
    while (v3 < *((unsigned int *)a1 + 2));
    v2 = *a1;
  }
  if (v2)
    free(v2);
  return a1;
}

uint64_t RB::vector<RB::SharedSurface::Copy,0ul,unsigned int>::~vector(uint64_t a1)
{
  _QWORD *v2;
  unint64_t v3;
  unsigned int *v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;

  v2 = *(_QWORD **)a1;
  if (*(_DWORD *)(a1 + 8))
  {
    v3 = 0;
    do
    {
      v4 = (unsigned int *)v2[6 * v3];
      if (v4)
      {
        v5 = v4 + 2;
        do
        {
          v6 = __ldxr(v5);
          v7 = v6 - 1;
        }
        while (__stlxr(v7, v5));
        if (!v7)
        {
          __dmb(9u);
          (*(void (**)(unsigned int *))(*(_QWORD *)v4 + 8))(v4);
        }
      }
      ++v3;
    }
    while (v3 < *(unsigned int *)(a1 + 8));
    v2 = *(_QWORD **)a1;
  }
  if (v2)
    free(v2);
  return a1;
}

uint64_t RB::vector<RB::SharedSurface::Update,0ul,unsigned int>::~vector(uint64_t a1)
{
  void **v2;
  unint64_t v3;
  void *v4;

  v2 = *(void ***)a1;
  if (*(_DWORD *)(a1 + 8))
  {
    v3 = 0;
    do
    {
      v4 = *v2;
      v2 += 8;

      ++v3;
    }
    while (v3 < *(unsigned int *)(a1 + 8));
    v2 = *(void ***)a1;
  }
  if (v2)
    free(v2);
  return a1;
}

char **RB::vector<RB::SharedSurface::Remove,0ul,unsigned int>::~vector(char **a1)
{
  char *v2;
  unint64_t v3;
  id *v4;
  unsigned int *v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  v2 = *a1;
  if (*((_DWORD *)a1 + 2))
  {
    v3 = 0;
    do
    {
      v4 = (id *)&v2[56 * v3];

      v5 = (unsigned int *)*v4;
      if (*v4)
      {
        v6 = v5 + 2;
        do
        {
          v7 = __ldxr(v6);
          v8 = v7 - 1;
        }
        while (__stlxr(v8, v6));
        if (!v8)
        {
          __dmb(9u);
          (*(void (**)(unsigned int *))(*(_QWORD *)v5 + 8))(v5);
        }
      }
      ++v3;
    }
    while (v3 < *((unsigned int *)a1 + 2));
    v2 = *a1;
  }
  if (v2)
    free(v2);
  return a1;
}

uint64_t RB::vector<RB::SharedSurface::Allocation,0ul,unsigned int>::~vector(uint64_t a1)
{
  _QWORD *v2;
  unint64_t v3;
  unsigned int *v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;

  v2 = *(_QWORD **)a1;
  if (*(_DWORD *)(a1 + 8))
  {
    v3 = 0;
    do
    {
      v4 = (unsigned int *)v2[4 * v3];
      if (v4)
      {
        v5 = v4 + 2;
        do
        {
          v6 = __ldxr(v5);
          v7 = v6 - 1;
        }
        while (__stlxr(v7, v5));
        if (!v7)
        {
          __dmb(9u);
          (*(void (**)(unsigned int *))(*(_QWORD *)v4 + 8))(v4);
        }
      }
      ++v3;
    }
    while (v3 < *(unsigned int *)(a1 + 8));
    v2 = *(_QWORD **)a1;
  }
  if (v2)
    free(v2);
  return a1;
}

void RB::BinAllocator::~BinAllocator(RB::BinAllocator *this)
{
  void **v2;
  unint64_t v3;
  unint64_t v4;
  void **v5;

  v2 = (void **)*((_QWORD *)this + 2);
  v3 = *((unsigned int *)this + 6);
  if ((_DWORD)v3)
  {
    v4 = 0;
    v5 = v2 + 2;
    do
    {
      if (*v5)
      {
        free(*v5);
        v3 = *((unsigned int *)this + 6);
      }
      ++v4;
      v5 += 4;
    }
    while (v4 < v3);
    v2 = (void **)*((_QWORD *)this + 2);
  }
  if (v2)
    free(v2);
}

void RB::SharedSurface::~SharedSurface(RB::Surface **this)
{
  os_unfair_lock_s *v2;
  RB::Surface *v3;
  unint64_t v4;
  id *v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  RB::Surface *v10;
  unint64_t v11;
  unsigned int *v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  void **v16;
  unint64_t v17;
  void *v18;
  RB::Surface *v19;
  unint64_t v20;
  id *v21;
  unsigned int *v22;
  unsigned int *v23;
  unsigned int v24;
  unsigned int v25;
  RB::Surface *v26;
  unint64_t v27;
  unsigned int *v28;
  unsigned int *v29;
  unsigned int v30;
  unsigned int v31;
  void **v32;
  unint64_t v33;
  unint64_t v34;
  void **v35;

  *this = (RB::Surface *)off_24C228D08;
  v2 = (os_unfair_lock_s *)RB::SurfacePool::shared((RB::SurfacePool *)this);
  RB::SurfacePool::dealloc(v2, this[3], 0);
  v3 = this[19];
  if (*((_DWORD *)this + 40))
  {
    v4 = 0;
    do
    {
      v5 = (id *)((char *)v3 + 144 * v4);

      RB::SharedSubsurface::~SharedSubsurface(v5 + 1);
      v6 = (unsigned int *)*v5;
      if (*v5)
      {
        v7 = v6 + 2;
        do
        {
          v8 = __ldxr(v7);
          v9 = v8 - 1;
        }
        while (__stlxr(v9, v7));
        if (!v9)
        {
          __dmb(9u);
          (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 8))(v6);
        }
      }
      ++v4;
    }
    while (v4 < *((unsigned int *)this + 40));
    v3 = this[19];
  }
  if (v3)
    free(v3);
  v10 = this[17];
  if (*((_DWORD *)this + 36))
  {
    v11 = 0;
    do
    {
      v12 = (unsigned int *)*((_QWORD *)v10 + 6 * v11);
      if (v12)
      {
        v13 = v12 + 2;
        do
        {
          v14 = __ldxr(v13);
          v15 = v14 - 1;
        }
        while (__stlxr(v15, v13));
        if (!v15)
        {
          __dmb(9u);
          (*(void (**)(unsigned int *))(*(_QWORD *)v12 + 8))(v12);
        }
      }
      ++v11;
    }
    while (v11 < *((unsigned int *)this + 36));
    v10 = this[17];
  }
  if (v10)
    free(v10);
  v16 = (void **)this[15];
  if (*((_DWORD *)this + 32))
  {
    v17 = 0;
    do
    {
      v18 = *v16;
      v16 += 8;

      ++v17;
    }
    while (v17 < *((unsigned int *)this + 32));
    v16 = (void **)this[15];
  }
  if (v16)
    free(v16);
  v19 = this[11];
  if (*((_DWORD *)this + 24))
  {
    v20 = 0;
    do
    {
      v21 = (id *)((char *)v19 + 56 * v20);

      v22 = (unsigned int *)*v21;
      if (*v21)
      {
        v23 = v22 + 2;
        do
        {
          v24 = __ldxr(v23);
          v25 = v24 - 1;
        }
        while (__stlxr(v25, v23));
        if (!v25)
        {
          __dmb(9u);
          (*(void (**)(unsigned int *))(*(_QWORD *)v22 + 8))(v22);
        }
      }
      ++v20;
    }
    while (v20 < *((unsigned int *)this + 24));
    v19 = this[11];
  }
  if (v19)
    free(v19);
  v26 = this[9];
  if (*((_DWORD *)this + 20))
  {
    v27 = 0;
    do
    {
      v28 = (unsigned int *)*((_QWORD *)v26 + 4 * v27);
      if (v28)
      {
        v29 = v28 + 2;
        do
        {
          v30 = __ldxr(v29);
          v31 = v30 - 1;
        }
        while (__stlxr(v31, v29));
        if (!v31)
        {
          __dmb(9u);
          (*(void (**)(unsigned int *))(*(_QWORD *)v28 + 8))(v28);
        }
      }
      ++v27;
    }
    while (v27 < *((unsigned int *)this + 20));
    v26 = this[9];
  }
  if (v26)
    free(v26);
  v32 = (void **)this[6];
  v33 = *((unsigned int *)this + 14);
  if ((_DWORD)v33)
  {
    v34 = 0;
    v35 = v32 + 2;
    do
    {
      if (*v35)
      {
        free(*v35);
        v33 = *((unsigned int *)this + 14);
      }
      ++v34;
      v35 += 4;
    }
    while (v34 < v33);
    v32 = (void **)this[6];
  }
  if (v32)
    free(v32);
}

{
  RB::SharedSurface::~SharedSurface(this);
  JUMPOUT(0x20BD16544);
}

void sub_209BB4E2C(_Unwind_Exception *a1)
{
  char **v1;

  RB::vector<RB::SharedSurface::AsyncUpdate,0ul,unsigned int>::~vector(v1 + 19);
  RB::vector<RB::SharedSurface::Copy,0ul,unsigned int>::~vector((uint64_t)(v1 + 17));
  RB::vector<RB::SharedSurface::Update,0ul,unsigned int>::~vector((uint64_t)(v1 + 15));
  RB::vector<RB::SharedSurface::Remove,0ul,unsigned int>::~vector(v1 + 11);
  RB::vector<RB::SharedSurface::Allocation,0ul,unsigned int>::~vector((uint64_t)(v1 + 9));
  RB::BinAllocator::~BinAllocator((RB::BinAllocator *)(v1 + 4));
  _Unwind_Resume(a1);
}

void RB::SharedSurfaceGroup::cancel_async_updates(os_unfair_lock_s *this, RB::SharedSurfaceClient *a2)
{
  os_unfair_lock_s *v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int *v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  RB::SharedSubsurface *v24;
  uint64_t v25;
  id *v26;
  unint64_t v27;
  os_unfair_lock_s *v28;
  os_unfair_lock_s *v29;
  os_unfair_lock_s *v30;
  _BYTE __dst[224];
  void *v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v32 = 0;
  v33 = 0x400000000;
  v29 = this + 4;
  os_unfair_lock_lock(this + 4);
  v28 = this;
  v4 = *(os_unfair_lock_s **)&this[8]._os_unfair_lock_opaque;
  v30 = this + 6;
  if (v4 != &this[6])
  {
    v5 = (unsigned int *)((char *)a2 + 32);
    do
    {
      v6 = *(_QWORD *)&v4[4]._os_unfair_lock_opaque;
      os_unfair_lock_lock((os_unfair_lock_t)(v6 + 112));
      v7 = *(unsigned int *)(v6 + 160);
      if ((_DWORD)v7)
      {
        do
        {
          v8 = *(_QWORD *)(v6 + 152);
          v9 = (v7 - 1);
          if (*(RB::SharedSurfaceClient **)(v8 + 144 * v9) == a2)
          {
            do
              v10 = __ldxr(v5);
            while (__stxr(v10 - 1, v5));
            v11 = v33;
            if (HIDWORD(v33) < (v33 + 1))
            {
              RB::vector<RB::SharedSubsurface,4ul,unsigned int>::reserve_slow(__dst, v33 + 1);
              v11 = v33;
            }
            v12 = v8 + 144 * v9;
            v13 = v32;
            if (!v32)
              v13 = __dst;
            v14 = &v13[56 * v11];
            *(_QWORD *)v14 = *(_QWORD *)(v12 + 8);
            v15 = v8 + 144 * v9;
            *((_QWORD *)v14 + 1) = *(_QWORD *)(v15 + 16);
            *((_QWORD *)v14 + 2) = *(_QWORD *)(v15 + 24);
            *((_QWORD *)v14 + 3) = 0;
            *((_DWORD *)v14 + 12) = *(_DWORD *)(v15 + 56);
            v14[52] = *(_BYTE *)(v15 + 60);
            *(_QWORD *)(v12 + 8) = 0;
            LODWORD(v33) = v33 + 1;
            v16 = *(_QWORD *)(v6 + 152) + 144 * v9;

            RB::SharedSubsurface::~SharedSubsurface((id *)(v16 + 8));
            v17 = *(unsigned int **)v16;
            if (*(_QWORD *)v16)
            {
              v18 = v17 + 2;
              do
              {
                v19 = __ldxr(v18);
                v20 = v19 - 1;
              }
              while (__stlxr(v20, v18));
              if (!v20)
              {
                __dmb(9u);
                (*(void (**)(unsigned int *))(*(_QWORD *)v17 + 8))(v17);
              }
            }
            v21 = *(unsigned int *)(v6 + 160);
            v22 = (v21 - 1);
            *(_DWORD *)(v6 + 160) = v22;
            if (v7 != v21)
              memmove((void *)v16, (const void *)(v16 + 144), 144 * (v22 - v9));
          }
          --v7;
        }
        while (v9);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 112));
      v4 = *(os_unfair_lock_s **)&v4[2]._os_unfair_lock_opaque;
    }
    while (v4 != v30);
  }
  os_unfair_lock_unlock(v29);
  v23 = v32;
  if (v32)
    v24 = (RB::SharedSubsurface *)v32;
  else
    v24 = (RB::SharedSubsurface *)__dst;
  if ((_DWORD)v33)
  {
    v25 = 56 * v33;
    do
    {
      RB::SharedSurfaceGroup::remove_subsurface(v28, v24, 0);
      v24 = (RB::SharedSubsurface *)((char *)v24 + 56);
      v25 -= 56;
    }
    while (v25);
    v23 = v32;
    v26 = (id *)(v32 ? v32 : __dst);
    if ((_DWORD)v33)
    {
      v27 = 0;
      do
      {
        RB::SharedSubsurface::~SharedSubsurface(v26);
        ++v27;
        v26 += 7;
      }
      while (v27 < v33);
      v23 = v32;
    }
  }
  if (v23)
    free(v23);
}

void sub_209BB5138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t a10, uint64_t a11, os_unfair_lock_t lock, char a13)
{
  os_unfair_lock_unlock(lock);
  os_unfair_lock_unlock(a10);
  RB::vector<RB::SharedSubsurface,4ul,unsigned int>::~vector((uint64_t)&a13);
  _Unwind_Resume(a1);
}

void RB::SharedSurface::AsyncUpdate::~AsyncUpdate(id *this)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;

  RB::SharedSubsurface::~SharedSubsurface(this + 1);
  v2 = (unsigned int *)*this;
  if (*this)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      __dmb(9u);
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 8))(v2);
    }
  }
}

void ___ZN2RB18SharedSurfaceGroup14add_subsurfaceERNS_19SharedSurfaceClientE14MTLPixelFormatNS_10ColorSpaceEjDv2_ifPU33objcproto22_RBDisplayListContents11objc_objectjDv4_fU13block_pointerFvRNS_16SharedSubsurfaceEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *global_queue;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  global_queue = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZN2RB18SharedSurfaceGroup14add_subsurfaceERNS_19SharedSurfaceClientE14MTLPixelFormatNS_10ColorSpaceEjDv2_ifPU33objcproto22_RBDisplayListContents11objc_objectjDv4_fU13block_pointerFvRNS_16SharedSubsurfaceEE_block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v1;
  dispatch_async(global_queue, block);
}

void ___ZN2RB18SharedSurfaceGroup14add_subsurfaceERNS_19SharedSurfaceClientE14MTLPixelFormatNS_10ColorSpaceEjDv2_ifPU33objcproto22_RBDisplayListContents11objc_objectjDv4_fU13block_pointerFvRNS_16SharedSubsurfaceEE_block_invoke_2(uint64_t a1)
{
  RB::SharedSurfaceGroup::render_async(*(os_unfair_lock_s **)(a1 + 32));
}

void RB::SharedSurfaceGroup::render_async(os_unfair_lock_s *this)
{
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;
  BOOL v5;
  os_unfair_lock_s *v6;
  uint64_t v7;
  unsigned int v8;
  _DWORD *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  unint64_t v17;
  __int128 v18;
  __int128 v19;
  id v20;
  uint64_t v21;
  _BYTE *v22;
  _BYTE *v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int *v29;
  unsigned int *v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  int v34;
  _BYTE *v35;
  _BYTE *v36;
  void *v37;
  _BYTE *v38;
  unint64_t v39;
  id *v40;
  os_unfair_lock_s *v41;
  os_unfair_lock_s *v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  char v49;
  _BYTE __dst[257];
  __int128 v51;
  unint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v51 = 0u;
  v52 = 8;
  v2 = this + 4;
  os_unfair_lock_lock(this + 4);
  v3 = this + 6;
  v4 = *(os_unfair_lock_s **)&this[8]._os_unfair_lock_opaque;
  if (v4 == &this[6])
  {
    BYTE1(this[15]._os_unfair_lock_opaque) = 0;
    os_unfair_lock_unlock(v2);
  }
  else
  {
    v41 = this;
    v42 = v2;
    v5 = 0;
    do
    {
      v6 = (os_unfair_lock_s *)(*(_QWORD *)&v4[4]._os_unfair_lock_opaque + 112);
      os_unfair_lock_lock(v6);
      v7 = *(_QWORD *)&v4[4]._os_unfair_lock_opaque;
      v10 = *(_DWORD *)(v7 + 160);
      v9 = (_DWORD *)(v7 + 160);
      v8 = v10;
      if (v10)
      {
        v11 = *((_QWORD *)v9 - 1);
        v12 = v11 + 144 * v8;
        do
        {
          v13 = (unsigned int *)(*(_QWORD *)v11 + 32);
          do
            v14 = __ldxr(v13);
          while (__stxr(v14 - 1, v13));
          v15 = *(_QWORD *)&v4[4]._os_unfair_lock_opaque;
          v16 = *(_DWORD *)(v15 + 128);
          if (*(_DWORD *)(v15 + 132) < v16 + 1)
          {
            RB::vector<RB::SharedSurface::Update,0ul,unsigned int>::reserve_slow(v15 + 120, v16 + 1);
            v16 = *(_DWORD *)(v15 + 128);
          }
          v17 = *(_QWORD *)(v15 + 120) + ((unint64_t)v16 << 6);
          *(_QWORD *)v17 = *(_QWORD *)(v11 + 80);
          *(_QWORD *)(v11 + 80) = 0;
          v18 = *(_OWORD *)(v11 + 88);
          v19 = *(_OWORD *)(v11 + 104);
          *(_OWORD *)(v17 + 40) = *(_OWORD *)(v11 + 120);
          *(_OWORD *)(v17 + 24) = v19;
          *(_OWORD *)(v17 + 8) = v18;
          ++*(_DWORD *)(v15 + 128);
          v20 = *(id *)(v11 + 64);
          *(_QWORD *)(v11 + 64) = 0;
          v43 = v20;
          v44 = *(id *)(v11 + 8);
          *(_QWORD *)&v19 = *(_QWORD *)(v11 + 24);
          v45 = *(_QWORD *)(v11 + 16);
          v46 = v19;
          v47 = 0;
          v48 = *(_DWORD *)(v11 + 56);
          v49 = *(_BYTE *)(v11 + 60);
          *(_QWORD *)(v11 + 8) = 0;
          v21 = *((_QWORD *)&v51 + 1);
          if (v52 < *((_QWORD *)&v51 + 1) + 1)
          {
            RB::vector<RB::SharedSurfaceGroup::render_async(void)::Completion,8ul,unsigned long>::reserve_slow(__dst, *((_QWORD *)&v51 + 1) + 1);
            v21 = *((_QWORD *)&v51 + 1);
            v20 = v43;
          }
          v22 = (_BYTE *)v51;
          if (!(_QWORD)v51)
            v22 = __dst;
          v23 = &v22[64 * v21];
          *(_QWORD *)v23 = v20;
          *((_QWORD *)v23 + 1) = v44;
          *((_QWORD *)v23 + 2) = v45;
          *((_QWORD *)v23 + 3) = v46;
          *((_QWORD *)v23 + 4) = 0;
          *((_DWORD *)v23 + 14) = v48;
          v23[60] = v49;
          v44 = 0;
          ++*((_QWORD *)&v51 + 1);
          RB::SharedSubsurface::~SharedSubsurface(&v44);

          v11 += 144;
        }
        while (v11 != v12);
        v24 = *(_QWORD *)&v4[4]._os_unfair_lock_opaque;
        v26 = *(_DWORD *)(v24 + 160);
        v9 = (_DWORD *)(v24 + 160);
        v25 = v26;
        if (v26)
        {
          v27 = *((_QWORD *)v9 - 1);
          v28 = v27 + 144 * v25;
          do
          {

            RB::SharedSubsurface::~SharedSubsurface((id *)(v27 + 8));
            v29 = *(unsigned int **)v27;
            if (*(_QWORD *)v27)
            {
              v30 = v29 + 2;
              do
              {
                v31 = __ldxr(v30);
                v32 = v31 - 1;
              }
              while (__stlxr(v32, v30));
              if (!v32)
              {
                __dmb(9u);
                (*(void (**)(unsigned int *))(*(_QWORD *)v29 + 8))(v29);
              }
            }
            v27 += 144;
          }
          while (v27 != v28);
        }
      }
      *v9 = 0;
      v5 = v5 || (v33 = *(_QWORD *)&v4[4]._os_unfair_lock_opaque, *(_DWORD *)(v33 + 128)) || *(_BYTE *)(v33 + 172) != 0;
      os_unfair_lock_unlock(v6);
      v4 = *(os_unfair_lock_s **)&v4[2]._os_unfair_lock_opaque;
    }
    while (v4 != v3);
    BYTE1(v41[15]._os_unfair_lock_opaque) = 0;
    os_unfair_lock_unlock(v42);
    if (v5)
      RB::SharedSurfaceGroup::render_updates((RB::SharedSurfaceGroup *)v41);
  }
  if (!*((_QWORD *)&v51 + 1))
    goto LABEL_47;
  v34 = pthread_main_np();
  if (!v34)
    objc_msgSend(MEMORY[0x24BDE57D8], "activateBackground:", 1);
  if ((_QWORD)v51)
    v35 = (_BYTE *)v51;
  else
    v35 = __dst;
  if (*((_QWORD *)&v51 + 1))
  {
    v36 = &v35[64 * *((_QWORD *)&v51 + 1)];
    do
    {
      (*(void (**)(void))(*(_QWORD *)v35 + 16))();
      v35 += 64;
    }
    while (v35 != v36);
  }
  if (!v34)
    objc_msgSend(MEMORY[0x24BDE57D8], "flush");
  v37 = (void *)v51;
  v38 = __dst;
  if ((_QWORD)v51)
    v38 = (_BYTE *)v51;
  if (*((_QWORD *)&v51 + 1))
  {
    v39 = 0;
    v40 = (id *)(v38 + 8);
    do
    {
      RB::SharedSubsurface::~SharedSubsurface(v40);

      ++v39;
      v40 += 8;
    }
    while (v39 < *((_QWORD *)&v51 + 1));
LABEL_47:
    v37 = (void *)v51;
  }
  if (v37)
    free(v37);
}

void sub_209BB55F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_unfair_lock_t lock, id a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  id *v20;
  os_unfair_lock_s *v21;

  RB::SharedSubsurface::~SharedSubsurface(v20);

  os_unfair_lock_unlock(v21);
  os_unfair_lock_unlock(lock);
  RB::vector<RB::SharedSurfaceGroup::render_async(void)::Completion,8ul,unsigned long>::~vector(&a20);
  _Unwind_Resume(a1);
}

void RB::SharedSurface::Remove::~Remove(id *this)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;

  v2 = (unsigned int *)*this;
  if (*this)
  {
    v3 = v2 + 2;
    do
    {
      v4 = __ldxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      __dmb(9u);
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 8))(v2);
    }
  }
}

void RB::SharedSurfaceGroup::move_subsurface(os_unfair_lock_s *this, RB::SharedSurface *a2, uint64_t a3, RB::SharedSubsurface *a4)
{
  os_unfair_lock_s *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v7 = this + 4;
  os_unfair_lock_lock(this + 4);
  v8 = *((unsigned int *)a2 + 20);
  if (!(_DWORD)v8)
    goto LABEL_11;
  v9 = (_BYTE *)(*((_QWORD *)a2 + 9) + 29);
  v10 = 32 * v8;
  while (*(_DWORD *)(v9 - 5) != (_DWORD)a3)
  {
    v9 += 32;
    v10 -= 32;
    if (!v10)
      goto LABEL_11;
  }
  v11 = *(void **)(*(_QWORD *)(v9 - 29) + 16);
  if (!objc_msgSend(v11, "_willMoveSubsurface:", a3))
  {
    *v9 = 0;
    goto LABEL_11;
  }
  if (!v11)
  {
LABEL_11:
    os_unfair_lock_unlock(v7);
    v12 = 0;
    goto LABEL_12;
  }

  v12 = v11;
  os_unfair_lock_unlock(v7);
  if (v12)
    objc_msgSend(v12, "_moveSubsurface:", a4);
LABEL_12:

}

void sub_209BB576C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

char *RB::vector<RB::SharedSurfaceGroup::render_async(void)::Completion,8ul,unsigned long>::~vector(char *a1)
{
  char *v2;
  char *v3;
  unint64_t v4;
  id *v5;

  v2 = (char *)*((_QWORD *)a1 + 64);
  if (v2)
    v3 = v2;
  else
    v3 = a1;
  if (*((_QWORD *)a1 + 65))
  {
    v4 = 0;
    v5 = (id *)(v3 + 8);
    do
    {
      RB::SharedSubsurface::~SharedSubsurface(v5);

      ++v4;
      v5 += 8;
    }
    while (v4 < *((_QWORD *)a1 + 65));
    v2 = (char *)*((_QWORD *)a1 + 64);
  }
  if (v2)
    free(v2);
  return a1;
}

intptr_t RB::SharedSurfaceGroup::finish_async(RB::SharedSurfaceGroup *this)
{
  RB::SharedSurfaceGroup::render_async((os_unfair_lock_s *)this);
  return RB::Drawable::finish(*((_QWORD *)this + 1));
}

uint64_t RB::vector<RB::SharedSubsurface,4ul,unsigned int>::~vector(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;

  v1 = a1;
  v2 = *(void **)(a1 + 224);
  if (v2)
    a1 = *(_QWORD *)(a1 + 224);
  if (*(_DWORD *)(v1 + 232))
  {
    v3 = 0;
    do
    {
      RB::SharedSubsurface::~SharedSubsurface((id *)a1);
      ++v3;
      a1 = v4 + 56;
    }
    while (v3 < *(unsigned int *)(v1 + 232));
    v2 = *(void **)(v1 + 224);
  }
  if (v2)
    free(v2);
  return v1;
}

void RB::SharedSurfaceGroup::relocate_surface(RB::SharedSurfaceGroup *this, RB::SharedSurface *a2, int a3)
{
  uint64_t *v5;
  unsigned int v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint32x2_t v13;
  int32x2_t v14;
  uint32x2_t v15;
  int32x2_t v16;
  int32x2_t *v17;
  int32x2_t *v18;
  int32x2_t v19;
  uint32x2_t v20;
  os_unfair_lock_s *v21;
  RB::Surface *v22;
  int32x2_t *v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  void **v27;
  uint64_t v28;
  NSObject *global_queue;
  void **v30;
  void **v31;
  void *v32;
  unsigned int *v33;
  unsigned int v34;
  double v35;
  _QWORD v36[4];
  _BYTE v37[32];
  void **v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v38 = 0;
  v39 = 0;
  v40 = 4;
  if (!*((_DWORD *)a2 + 20))
    return;
  v5 = (uint64_t *)this;
  v6 = 0;
  v7 = (char *)this + 24;
  do
  {
    v8 = *((_QWORD *)a2 + 9);
    if (*(_BYTE *)(v8 + 32 * v6 + 29))
    {
LABEL_16:
      ++v6;
      continue;
    }
    v36[0] = v5;
    v36[1] = v37;
    v36[2] = v8 + 32 * v6;
    v36[3] = a2;
    v9 = v5[4];
    if ((char *)v9 == v7)
    {
LABEL_13:
      if (!a3)
        goto LABEL_16;
      v14 = *(int32x2_t *)((char *)a2 + 32);
      v15 = (uint32x2_t)vcgt_s32(v14, (int32x2_t)0x10000000100);
      if ((vpmin_u32(v15, v15).u32[0] & 0x80000000) == 0)
        goto LABEL_16;
      v16 = vshr_n_s32(v14, 1uLL);
      v17 = (int32x2_t *)(v8 + 32 * v6);
      v19 = v17[2];
      v18 = v17 + 2;
      v20 = (uint32x2_t)vcge_s32(v16, v19);
      if ((vpmin_u32(v20, v20).u32[0] & 0x80000000) == 0)
        goto LABEL_16;
      v21 = (os_unfair_lock_s *)RB::SurfacePool::shared(this);
      this = (RB::SharedSurfaceGroup *)RB::SurfacePool::alloc(v21, *v5, *(_QWORD *)(*((_QWORD *)a2 + 3) + 32), *(unsigned __int8 *)(*((_QWORD *)a2 + 3) + 44), *(_DWORD *)(*((_QWORD *)a2 + 3) + 40), 0, *(double *)&v16, 0);
      v22 = this;
      if (!this)
        goto LABEL_16;
      v23 = (int32x2_t *)operator new();
      RB::SharedSurface::SharedSurface((RB::SharedSurface *)v23, (RB::SharedSurfaceGroup *)v5, v22, *((float *)a2 + 16));
      v24 = operator new(0x18uLL);
      v25 = (_QWORD *)v5[4];
      *v24 = v7;
      v24[1] = v25;
      v24[2] = v23;
      *v25 = v24;
      v26 = v5[5] + 1;
      v5[4] = (uint64_t)v24;
      v5[5] = v26;
      v35 = 0.0;
      if (RB::BinAllocator::alloc(v23 + 4, &v35, *v18))
        ++v23[13].i32[0];
      RB::SharedSurfaceGroup::relocate_surface(RB::SharedSurface *,BOOL)::$_0::operator()((uint64_t)v36, v24[2], v35);
    }
    else
    {
      while (1)
      {
        v35 = 0.0;
        v10 = *(_QWORD *)(v9 + 16);
        if ((RB::SharedSurface *)v10 != a2)
        {
          v11 = *(_QWORD *)(v10 + 24);
          v12 = *((_QWORD *)a2 + 3);
          if (*(_QWORD *)(v11 + 32) == *(_QWORD *)(v12 + 32)
            && *(_DWORD *)(v11 + 40) == *(_DWORD *)(v12 + 40)
            && *(unsigned __int8 *)(v11 + 44) == *(unsigned __int8 *)(v12 + 44)
            && *(float *)(v10 + 64) == *((float *)a2 + 16))
          {
            this = (RB::SharedSurfaceGroup *)(v10 + 32);
            v13 = (uint32x2_t)vcgt_s32(*(int32x2_t *)((char *)a2 + 32), *(int32x2_t *)(v10 + 32));
            if ((vpmax_u32(v13, v13).u32[0] & 0x80000000) != 0)
            {
              this = (RB::SharedSurfaceGroup *)RB::BinAllocator::alloc((int32x2_t *)this, &v35, *(int32x2_t *)(v8 + 32 * v6 + 16));
              if ((_DWORD)this)
                break;
            }
          }
        }
        v9 = *(_QWORD *)(v9 + 8);
        if ((char *)v9 == v7)
          goto LABEL_13;
      }
      ++*(_DWORD *)(v10 + 104);
      RB::SharedSurfaceGroup::relocate_surface(RB::SharedSurface *,BOOL)::$_0::operator()((uint64_t)v36, *(_QWORD *)(v9 + 16), v35);
    }
  }
  while (v6 < *((_DWORD *)a2 + 20));
  v27 = v38;
  v28 = v39;
  if (v39)
  {
    global_queue = dispatch_get_global_queue(2, 0);
    if (v27)
      v30 = v27;
    else
      v30 = (void **)v37;
    v31 = &v30[v28];
    do
    {
      v32 = *v30;
      v33 = (unsigned int *)((char *)*v30 + 8);
      do
        v34 = __ldxr(v33);
      while (__stxr(v34 + 1, v33));
      dispatch_async_f(global_queue, v32, (dispatch_function_t)RB::SharedSurfaceGroup::relocate_surface(RB::SharedSurface *,BOOL)::$_1::__invoke);
      ++v30;
    }
    while (v30 != v31);
    v27 = v38;
  }
  if (v27)
    free(v27);
}

void sub_209BB5B84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  if (a19)
    free(a19);
  _Unwind_Resume(exception_object);
}

char **RB::vector<std::pair<RB::SharedSurface *,RB::vector<RB::SharedSurface::Remove,0ul,unsigned int>>,0ul,unsigned int>::~vector(char **a1)
{
  char *v2;
  unint64_t v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  unint64_t v8;
  id *v9;
  unsigned int *v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;

  v2 = *a1;
  if (*((_DWORD *)a1 + 2))
  {
    v3 = 0;
    do
    {
      v4 = &v2[24 * v3];
      v7 = (char *)*((_QWORD *)v4 + 1);
      v6 = v4 + 8;
      v5 = v7;
      if (*((_DWORD *)v6 + 2))
      {
        v8 = 0;
        do
        {
          v9 = (id *)&v5[56 * v8];

          v10 = (unsigned int *)*v9;
          if (*v9)
          {
            v11 = v10 + 2;
            do
            {
              v12 = __ldxr(v11);
              v13 = v12 - 1;
            }
            while (__stlxr(v13, v11));
            if (!v13)
            {
              __dmb(9u);
              (*(void (**)(unsigned int *))(*(_QWORD *)v10 + 8))(v10);
            }
          }
          ++v8;
        }
        while (v8 < *((unsigned int *)v6 + 2));
        v5 = *(char **)v6;
      }
      if (v5)
        free(v5);
      ++v3;
    }
    while (v3 < *((unsigned int *)a1 + 2));
    v2 = *a1;
  }
  if (v2)
    free(v2);
  return a1;
}

void RB::SharedSurfaceGroup::relocate_surface(RB::SharedSurface *,BOOL)::$_0::operator()(uint64_t a1, uint64_t a2, double a3)
{
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  _QWORD *v9;
  uint64_t v10;
  size_t v11;
  _QWORD *v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int *v22;
  unsigned int v23;
  uint64_t *v24;
  uint64_t v25;
  unsigned int *v26;
  unsigned int v27;
  uint64_t v28;
  char v29;
  unsigned int v30;
  uint64_t v31;

  v6 = (unsigned int *)(*(_QWORD *)a1 + 56);
  do
  {
    v7 = __ldxr(v6);
    v8 = v7 + 1;
  }
  while (__stxr(v7 + 1, v6));
  os_unfair_lock_lock((os_unfair_lock_t)(a2 + 112));
  if (!*(_DWORD *)(a2 + 128) && !*(_DWORD *)(a2 + 144))
  {
    v9 = *(_QWORD **)(a1 + 8);
    v10 = v9[5];
    v11 = v10 + 1;
    if (v9[6] < (unint64_t)(v10 + 1))
    {
      RB::vector<RB::DisplayList::Clip *,4ul,unsigned long>::reserve_slow(*(void **)(a1 + 8), v11);
      v10 = v9[5];
      v11 = v10 + 1;
    }
    v12 = (_QWORD *)v9[4];
    if (!v12)
      v12 = v9;
    v12[v10] = a2;
    v9[5] = v11;
  }
  v13 = *(_QWORD *)(a1 + 24);
  if (v13)
  {
    v14 = (unsigned int *)(v13 + 8);
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
  }
  v16 = *(_QWORD *)(a1 + 16);
  v17 = *(_DWORD *)(v16 + 24);
  v19 = *(_QWORD *)(v16 + 8);
  v18 = *(_QWORD *)(v16 + 16);
  v20 = *(_DWORD *)(a2 + 144);
  if (*(_DWORD *)(a2 + 148) < v20 + 1)
  {
    RB::vector<RB::DisplayList::LayerTask::ClipInfo,0ul,unsigned int>::reserve_slow(a2 + 136, v20 + 1);
    v20 = *(_DWORD *)(a2 + 144);
  }
  v21 = *(_QWORD *)(a2 + 136) + 48 * v20;
  *(_QWORD *)v21 = v13;
  *(_DWORD *)(v21 + 8) = v17;
  *(_DWORD *)(v21 + 12) = v8;
  *(_QWORD *)(v21 + 16) = v19;
  *(double *)(v21 + 24) = a3;
  *(_QWORD *)(v21 + 32) = v18;
  *(_BYTE *)(v21 + 40) = 0;
  ++*(_DWORD *)(a2 + 144);
  v22 = (unsigned int *)(**(_QWORD **)(a1 + 16) + 24);
  do
    v23 = __ldxr(v22);
  while (__stxr(v23 + 1, v22));
  v24 = *(uint64_t **)(a1 + 16);
  v25 = *v24;
  if (*v24)
  {
    v26 = (unsigned int *)(v25 + 8);
    do
      v27 = __ldxr(v26);
    while (__stxr(v27 + 1, v26));
    v24 = *(uint64_t **)(a1 + 16);
  }
  v28 = v24[2];
  v29 = *((_BYTE *)v24 + 28);
  v30 = *(_DWORD *)(a2 + 80);
  if (*(_DWORD *)(a2 + 84) < v30 + 1)
  {
    RB::vector<RB::BinAllocator::Shelf,0ul,unsigned int>::reserve_slow(a2 + 72, v30 + 1);
    v30 = *(_DWORD *)(a2 + 80);
  }
  v31 = *(_QWORD *)(a2 + 72) + 32 * v30;
  *(_QWORD *)v31 = v25;
  *(double *)(v31 + 8) = a3;
  *(_QWORD *)(v31 + 16) = v28;
  *(_DWORD *)(v31 + 24) = v8;
  *(_BYTE *)(v31 + 28) = v29;
  *(_BYTE *)(v31 + 29) = 0;
  ++*(_DWORD *)(a2 + 80);
  *(_BYTE *)(*(_QWORD *)(a1 + 16) + 29) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(a2 + 112));
}

void sub_209BB5E8C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t RB::Refcount<RB::SharedSurface,std::atomic<unsigned int>>::release(uint64_t result)
{
  unsigned int *v1;
  unsigned int v2;
  unsigned int v3;

  v1 = (unsigned int *)(result + 8);
  do
  {
    v2 = __ldxr(v1);
    v3 = v2 - 1;
  }
  while (__stlxr(v3, v1));
  if (!v3)
  {
    __dmb(9u);
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  }
  return result;
}

uint64_t RB::Refcount<RB::SharedSurface,std::atomic<unsigned int>>::finalize(uint64_t result)
{
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 24))(result);
  return result;
}

uint64_t RB::SharedSurfaceGroup::render_updates_device(void)::$_1::__invoke(uint64_t a1)
{
  unsigned int v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char **v8;
  id v10[6];
  int v11;
  char v12;

  v2 = *(_DWORD *)(a1 + 8);
  if (v2)
  {
    v3 = *(char **)a1;
    v4 = *(_QWORD *)a1 + 40 * v2;
    do
    {
      v5 = *((unsigned int *)v3 + 8);
      if ((_DWORD)v5)
      {
        v6 = 48 * v5;
        v7 = *((_QWORD *)v3 + 3) + 24;
        do
        {
          v10[3] = 0;
          v10[0] = *(id *)v3;
          v10[1] = *(id *)v7;
          v10[2] = *(id *)(v7 + 8);
          v11 = *(_DWORD *)(v7 - 12);
          v12 = *(_BYTE *)(v7 + 16);
          RB::SharedSurfaceGroup::move_subsurface(*((os_unfair_lock_s **)v10[0] + 2), *(RB::SharedSurface **)(v7 - 24), *(unsigned int *)(v7 - 16), (RB::SharedSubsurface *)v10);
          v7 += 48;
          RB::SharedSubsurface::~SharedSubsurface(v10);
          v6 -= 48;
        }
        while (v6);
      }
      v3 += 40;
    }
    while (v3 != (char *)v4);
  }
  v8 = RB::vector<RB::SharedSurfaceGroup::render_updates_device(void)::SurfaceData,0ul,unsigned int>::~vector((char **)a1);
  return MEMORY[0x20BD16544](v8, 0x1020C40EDED9539);
}

void sub_209BB601C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  RB::SharedSubsurface::~SharedSubsurface((id *)va);
  _Unwind_Resume(a1);
}

void std::__introsort<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*,false>(uint64_t *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v6;
  uint64_t *ii;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unsigned int v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  unsigned int *v37;
  __int128 v38;
  void *v39;
  unsigned int *v40;
  unsigned int v41;
  unsigned int v42;
  _BOOL4 v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t *m;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v53;
  _QWORD *v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t n;
  unint64_t v58;
  unint64_t v59;
  _QWORD *v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  unsigned int *v66;
  __int128 v67;
  void *v68;
  unsigned int *v69;
  unsigned int v70;
  unsigned int v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t *v74;
  BOOL v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t *v79;
  unint64_t v80;
  unint64_t v81;
  unsigned int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t i;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t *v91;
  unsigned int *v92;
  __int128 v93;
  void *v94;
  unsigned int *v95;
  unsigned int v96;
  unsigned int v97;
  int64_t v98;
  int64_t v99;
  int64_t v100;
  uint64_t v101;
  uint64_t *v102;
  unint64_t v103;
  unint64_t v104;
  uint64_t *v105;
  unint64_t v106;
  _QWORD *v107;
  unint64_t v108;
  unint64_t v109;
  BOOL v110;
  unsigned int v111;
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  __int128 v115;
  uint64_t v116;
  __int128 v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  unint64_t v123;
  unint64_t v124;
  unint64_t v125;
  unsigned int *v126;
  __int128 v127;
  void *v128;
  unsigned int *v129;
  unsigned int v130;
  unsigned int v131;
  int64_t v132;
  uint64_t v133;
  uint64_t v134;
  int v135;
  uint64_t v136;
  uint64_t v137;
  int v138;
  uint64_t *v139;
  uint64_t *v140;
  uint64_t v141;
  uint64_t v142;
  int64_t v143;
  unint64_t v144;
  unint64_t v145;
  uint64_t v146;
  __int128 v147;
  uint64_t v148;
  __int128 *v149;
  uint64_t v150;
  unsigned int *v151;
  __int128 v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  unint64_t v156;
  unint64_t v157;
  void *v158;
  unsigned int v159;
  uint64_t v160;
  uint64_t v161;
  __int128 v162;
  uint64_t v163;
  uint64_t *v164;
  __int128 v165;
  void **v166;
  uint64_t v167;
  uint64_t v168;
  int v169;
  unint64_t v170;
  __int128 v171;
  unsigned int *v172;
  __int128 v173;
  void *v174;
  unsigned int *v175;
  unsigned int v176;
  unsigned int v177;
  unsigned int *v178;
  unsigned int v179;
  unsigned int v180;
  uint64_t *j;
  uint64_t *v183;
  unint64_t v184;
  unint64_t v185;
  unsigned int v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t *k;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  unint64_t v193;
  unsigned int *v194;
  __int128 v195;
  void *v196;
  unsigned int *v197;
  unsigned int v198;
  unsigned int v199;
  int v200;
  uint64_t *v201;
  uint64_t *v202;
  unint64_t v203;
  __int128 v204;
  int v205;
  __int128 v206;
  int v207;
  uint64_t v208;

  v6 = a2;
  ii = a1;
  v208 = *MEMORY[0x24BDAC8D0];
  v201 = (uint64_t *)a2;
  v202 = a1;
  while (2)
  {
    v8 = v6 - (_QWORD)ii;
    v9 = 0x6DB6DB6DB6DB6DB7 * ((v6 - (uint64_t)ii) >> 3);
    switch(v9)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        v201 = (uint64_t *)(v6 - 56);
        v72 = *(_QWORD *)(v6 - 24);
        v73 = ii[4];
        if (v72 < v73 || v72 == v73 && *(_DWORD *)(v6 - 8) > *((_DWORD *)ii + 12))
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(&v202, (uint64_t *)&v201);
        return;
      case 3uLL:
        v201 = (uint64_t *)(v6 - 56);
        std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*>((uint64_t)ii, (uint64_t)(ii + 7), v6 - 56);
        return;
      case 4uLL:
        v201 = (uint64_t *)(v6 - 56);
        std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*>((uint64_t)ii, (uint64_t)(ii + 7), (uint64_t)(ii + 14), v6 - 56);
        return;
      case 5uLL:
        v201 = (uint64_t *)(v6 - 56);
        std::__sort5_maybe_branchless[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*,0>((uint64_t)ii, (uint64_t)(ii + 7), (uint64_t)(ii + 14), (uint64_t)(ii + 21), v6 - 56);
        return;
      default:
        if (v8 <= 1343)
        {
          v74 = ii + 7;
          v76 = ii == (uint64_t *)v6 || v74 == (uint64_t *)v6;
          if ((a4 & 1) != 0)
          {
            if (v76)
              return;
            v77 = 0;
            v78 = ii;
            while (1)
            {
              v79 = v78;
              v78 = v74;
              v80 = v79[11];
              v81 = v79[4];
              if (v80 < v81)
                break;
              if (v80 == v81)
              {
                v82 = *((_DWORD *)v79 + 26);
                if (v82 > *((_DWORD *)v79 + 12))
                  goto LABEL_133;
              }
LABEL_149:
              v74 = v78 + 7;
              v77 += 56;
              if (v78 + 7 == (uint64_t *)v6)
                return;
            }
            v82 = *((_DWORD *)v79 + 26);
LABEL_133:
            v83 = *v78;
            *v78 = 0;
            v206 = *((_OWORD *)v79 + 4);
            v207 = *((_DWORD *)v79 + 20);
            v79[11] = 0;
            v84 = v79[12];
            for (i = v77; ; i -= 56)
            {
              v86 = (char *)ii + i;
              v87 = *(uint64_t *)((char *)ii + i + 56);
              *((_QWORD *)v86 + 7) = *(uint64_t *)((char *)ii + i);
              *(_QWORD *)v86 = v87;
              *((_OWORD *)v86 + 4) = *(_OWORD *)((char *)ii + i + 8);
              *((_DWORD *)v86 + 20) = *(_DWORD *)((char *)ii + i + 24);
              v88 = *(uint64_t *)((char *)ii + i + 88);
              *((_QWORD *)v86 + 11) = *(uint64_t *)((char *)ii + i + 32);
              *((_QWORD *)v86 + 4) = v88;
              v89 = *(uint64_t *)((char *)ii + i + 96);
              *((_QWORD *)v86 + 12) = *(uint64_t *)((char *)ii + i + 40);
              *((_QWORD *)v86 + 5) = v89;
              LODWORD(v88) = *(_DWORD *)((char *)ii + i + 104);
              *((_DWORD *)v86 + 26) = *(_DWORD *)((char *)ii + i + 48);
              *((_DWORD *)v86 + 12) = v88;
              if (!i)
              {
                v91 = ii;
                goto LABEL_144;
              }
              v90 = *((_QWORD *)v86 - 3);
              if (v80 >= v90 && (v80 != v90 || v82 <= *(_DWORD *)((char *)ii + i - 8)))
                break;
            }
            v91 = (uint64_t *)((char *)ii + i);
LABEL_144:
            v92 = (unsigned int *)*v91;
            *v91 = v83;
            v93 = v206;
            *((_DWORD *)v86 + 6) = v207;
            *(_OWORD *)(v86 + 8) = v93;
            v94 = (void *)v91[4];
            v91[4] = v80;
            v91[5] = v84;
            *((_DWORD *)v91 + 12) = v82;

            if (v92)
            {
              v95 = v92 + 2;
              do
              {
                v96 = __ldxr(v95);
                v97 = v96 - 1;
              }
              while (__stlxr(v97, v95));
              if (!v97)
              {
                __dmb(9u);
                (*(void (**)(unsigned int *))(*(_QWORD *)v92 + 8))(v92);
              }
            }
            goto LABEL_149;
          }
          if (v76)
            return;
          for (j = ii + 5; ; j += 7)
          {
            v183 = ii;
            ii = v74;
            v184 = v183[11];
            v185 = v183[4];
            if (v184 < v185)
              break;
            if (v184 == v185)
            {
              v186 = *((_DWORD *)v183 + 26);
              if (v186 > *((_DWORD *)v183 + 12))
                goto LABEL_221;
            }
LABEL_233:
            v74 = ii + 7;
            if (ii + 7 == (uint64_t *)v6)
              return;
          }
          v186 = *((_DWORD *)v183 + 26);
LABEL_221:
          v187 = *ii;
          *ii = 0;
          v206 = *((_OWORD *)v183 + 4);
          v207 = *((_DWORD *)v183 + 20);
          v183[11] = 0;
          v188 = v183[12];
          for (k = j; ; k -= 7)
          {
            v190 = k[2];
            k[2] = *(k - 5);
            *(k - 5) = v190;
            *(_OWORD *)(k + 3) = *((_OWORD *)k - 2);
            *((_DWORD *)k + 10) = *((_DWORD *)k - 4);
            v191 = k[6];
            k[6] = *(k - 1);
            *(k - 1) = v191;
            v192 = k[7];
            k[7] = *k;
            *k = v192;
            LODWORD(v191) = *((_DWORD *)k + 16);
            *((_DWORD *)k + 16) = *((_DWORD *)k + 2);
            *((_DWORD *)k + 2) = v191;
            v193 = *(k - 8);
            if (v184 >= v193 && (v184 != v193 || v186 <= *((_DWORD *)k - 12)))
              break;
          }
          v194 = (unsigned int *)*(k - 5);
          *(k - 5) = v187;
          v195 = v206;
          *((_DWORD *)k - 4) = v207;
          *((_OWORD *)k - 2) = v195;
          v196 = (void *)*(k - 1);
          *(k - 1) = v184;
          *k = v188;
          *((_DWORD *)k + 2) = v186;

          if (v194)
          {
            v197 = v194 + 2;
            do
            {
              v198 = __ldxr(v197);
              v199 = v198 - 1;
            }
            while (__stlxr(v199, v197));
            if (!v199)
            {
              __dmb(9u);
              (*(void (**)(unsigned int *))(*(_QWORD *)v194 + 8))(v194);
            }
          }
          goto LABEL_233;
        }
        if (!a3)
        {
          if (ii == (uint64_t *)v6)
            return;
          v98 = (v9 - 2) >> 1;
          v99 = v98;
          while (1)
          {
            v100 = v99;
            if (v98 < v99)
              goto LABEL_179;
            v101 = (2 * v99) | 1;
            v102 = &ii[7 * v101];
            if (2 * v100 + 2 < (uint64_t)v9)
            {
              v103 = ii[7 * v101 + 4];
              v104 = v102[11];
              if (v103 < v104 || v103 == v104 && LODWORD(ii[7 * v101 + 6]) > *((_DWORD *)v102 + 26))
              {
                v102 += 7;
                v101 = 2 * v100 + 2;
              }
            }
            v105 = &ii[7 * v100];
            v108 = v105[4];
            v107 = v105 + 4;
            v106 = v108;
            v109 = v102[4];
            v110 = v109 == v108;
            if (v109 < v108)
              goto LABEL_179;
            if (!v110)
              break;
            v111 = ii[7 * v100 + 6];
            if (*((_DWORD *)v102 + 12) <= v111)
              goto LABEL_163;
LABEL_179:
            v99 = v100 - 1;
            if (!v100)
            {
              v132 = (v6 - (uint64_t)ii) / 0x38uLL;
              while (1)
              {
                v133 = 0;
                v134 = *ii;
                *ii = 0;
                v135 = *((_DWORD *)ii + 6);
                v204 = *(_OWORD *)(ii + 1);
                v205 = v135;
                v136 = ii[4];
                ii[4] = 0;
                v137 = ii[5];
                v138 = *((_DWORD *)ii + 12);
                v139 = ii;
                do
                {
                  v140 = v139;
                  v141 = v133 + 1;
                  v139 += 7 * v133 + 7;
                  v142 = 2 * v133;
                  v133 = (2 * v133) | 1;
                  v143 = v142 + 2;
                  if (v143 < v132)
                  {
                    v144 = v140[7 * v141 + 4];
                    v145 = v139[11];
                    if (v144 < v145 || v144 == v145 && LODWORD(v140[7 * v141 + 6]) > *((_DWORD *)v139 + 26))
                    {
                      v139 += 7;
                      v133 = v143;
                    }
                  }
                  v146 = *v140;
                  *v140 = *v139;
                  *v139 = v146;
                  v147 = *(_OWORD *)(v139 + 1);
                  *((_DWORD *)v140 + 6) = *((_DWORD *)v139 + 6);
                  *(_OWORD *)(v140 + 1) = v147;
                  v148 = v140[4];
                  v140[4] = v139[4];
                  v139[4] = v148;
                  *(_QWORD *)&v147 = v140[5];
                  v140[5] = v139[5];
                  v139[5] = v147;
                  LODWORD(v148) = *((_DWORD *)v140 + 12);
                  *((_DWORD *)v140 + 12) = *((_DWORD *)v139 + 12);
                  *((_DWORD *)v139 + 12) = v148;
                }
                while (v133 <= (uint64_t)((unint64_t)(v132 - 2) >> 1));
                v149 = (__int128 *)(v139 + 1);
                v150 = v6 - 56;
                v151 = (unsigned int *)*v139;
                if (v139 == (uint64_t *)(v6 - 56))
                {
                  *v139 = v134;
                  v171 = v204;
                  *((_DWORD *)v139 + 6) = v205;
                  *v149 = v171;
                  v154 = (void *)v139[4];
                  v139[4] = v136;
                  v139[5] = v137;
                  *((_DWORD *)v139 + 12) = v138;
                }
                else
                {
                  *v139 = *(_QWORD *)(v6 - 56);
                  *(_QWORD *)(v6 - 56) = v151;
                  v152 = *(_OWORD *)(v6 - 48);
                  *((_DWORD *)v139 + 6) = *(_DWORD *)(v6 - 32);
                  *v149 = v152;
                  v153 = v139[4];
                  v139[4] = *(_QWORD *)(v6 - 24);
                  *(_QWORD *)(v6 - 24) = v153;
                  v139[5] = *(_QWORD *)(v6 - 16);
                  *((_DWORD *)v139 + 12) = *(_DWORD *)(v6 - 8);
                  v151 = *(unsigned int **)(v6 - 56);
                  *(_QWORD *)(v6 - 56) = v134;
                  *(_OWORD *)(v6 - 48) = v204;
                  *(_DWORD *)(v6 - 32) = v205;
                  v154 = *(void **)(v6 - 24);
                  *(_QWORD *)(v6 - 24) = v136;
                  *(_QWORD *)(v6 - 16) = v137;
                  *(_DWORD *)(v6 - 8) = v138;
                  v155 = (char *)v139 - (char *)ii + 56;
                  if (v155 >= 57)
                  {
                    v156 = (v155 / 0x38uLL - 2) >> 1;
                    v157 = ii[7 * v156 + 4];
                    v158 = (void *)v139[4];
                    if (v157 < (unint64_t)v158)
                    {
                      v159 = *((_DWORD *)v139 + 12);
LABEL_192:
                      v160 = 0;
                      v161 = *v139;
                      *v139 = 0;
                      v162 = *v149;
                      v207 = *((_DWORD *)v139 + 6);
                      v206 = v162;
                      v139[4] = 0;
                      v163 = v139[5];
                      while (1)
                      {
                        v164 = v139;
                        v139 = &ii[7 * v156];
                        *v164 = *v139;
                        *v139 = v160;
                        v165 = *(_OWORD *)(v139 + 1);
                        *((_DWORD *)v164 + 6) = *((_DWORD *)v139 + 6);
                        *(_OWORD *)(v164 + 1) = v165;
                        v166 = (void **)(v139 + 4);
                        v167 = v164[4];
                        v164[4] = v139[4];
                        v139[4] = v167;
                        v168 = v164[5];
                        v164[5] = v139[5];
                        v139[5] = v168;
                        v169 = *((_DWORD *)v164 + 12);
                        *((_DWORD *)v164 + 12) = *((_DWORD *)v139 + 12);
                        *((_DWORD *)v139 + 12) = v169;
                        if (!v156)
                          break;
                        v156 = (v156 - 1) >> 1;
                        v170 = ii[7 * v156 + 4];
                        if (v170 >= (unint64_t)v158
                          && ((void *)v170 != v158 || LODWORD(ii[7 * v156 + 6]) <= v159))
                        {
                          break;
                        }
                        v160 = *v139;
                      }
                      v172 = (unsigned int *)*v139;
                      *v139 = v161;
                      v173 = v206;
                      *((_DWORD *)v139 + 6) = v207;
                      *(_OWORD *)(v139 + 1) = v173;
                      v174 = *v166;
                      *v166 = v158;
                      v139[5] = v163;
                      *((_DWORD *)v139 + 12) = v159;

                      if (v172)
                      {
                        v175 = v172 + 2;
                        do
                        {
                          v176 = __ldxr(v175);
                          v177 = v176 - 1;
                        }
                        while (__stlxr(v177, v175));
                        if (!v177)
                        {
                          __dmb(9u);
                          (*(void (**)(unsigned int *))(*(_QWORD *)v172 + 8))(v172);
                        }
                      }
                      goto LABEL_206;
                    }
                    if ((void *)v157 == v158)
                    {
                      v159 = *((_DWORD *)v139 + 12);
                      if (LODWORD(ii[7 * v156 + 6]) > v159)
                        goto LABEL_192;
                    }
                  }
                }
LABEL_206:

                if (v151)
                {
                  v178 = v151 + 2;
                  do
                  {
                    v179 = __ldxr(v178);
                    v180 = v179 - 1;
                  }
                  while (__stlxr(v180, v178));
                  if (!v180)
                  {
                    __dmb(9u);
                    (*(void (**)(unsigned int *))(*(_QWORD *)v151 + 8))(v151);
                  }
                }
                v6 = v150;
                if (v132-- <= 2)
                  return;
              }
            }
          }
          v111 = ii[7 * v100 + 6];
LABEL_163:
          v112 = 0;
          v113 = &ii[7 * v100];
          v114 = *v113;
          *v113 = 0;
          v115 = *(_OWORD *)(v113 + 1);
          v207 = *((_DWORD *)v113 + 6);
          v206 = v115;
          *v107 = 0;
          v116 = v113[5];
          while (1)
          {
            *v113 = *v102;
            *v102 = v112;
            v117 = *(_OWORD *)(v102 + 1);
            *((_DWORD *)v113 + 6) = *((_DWORD *)v102 + 6);
            *(_OWORD *)(v113 + 1) = v117;
            v118 = v113[4];
            v113[4] = v102[4];
            v102[4] = v118;
            *(_QWORD *)&v117 = v113[5];
            v113[5] = v102[5];
            v102[5] = v117;
            LODWORD(v118) = *((_DWORD *)v113 + 12);
            *((_DWORD *)v113 + 12) = *((_DWORD *)v102 + 12);
            *((_DWORD *)v102 + 12) = v118;
            if (v98 < v101)
              break;
            v119 = 2 * v101;
            v120 = (2 * v101) | 1;
            v121 = &ii[7 * v120];
            v122 = v119 + 2;
            if (v122 < (uint64_t)v9)
            {
              v123 = ii[7 * v120 + 4];
              v124 = v121[11];
              if (v123 < v124 || v123 == v124 && LODWORD(ii[7 * v120 + 6]) > *((_DWORD *)v121 + 26))
              {
                v121 += 7;
                v120 = v122;
              }
            }
            v125 = v121[4];
            if (v125 < v106 || v125 == v106 && *((_DWORD *)v121 + 12) > v111)
              break;
            v112 = *v102;
            v113 = v102;
            v102 = v121;
            v101 = v120;
          }
          v126 = (unsigned int *)*v102;
          *v102 = v114;
          v127 = v206;
          *((_DWORD *)v102 + 6) = v207;
          *(_OWORD *)(v102 + 1) = v127;
          v128 = (void *)v102[4];
          v102[4] = v106;
          v102[5] = v116;
          *((_DWORD *)v102 + 12) = v111;

          if (v126)
          {
            v129 = v126 + 2;
            do
            {
              v130 = __ldxr(v129);
              v131 = v130 - 1;
            }
            while (__stlxr(v131, v129));
            if (!v131)
            {
              __dmb(9u);
              (*(void (**)(unsigned int *))(*(_QWORD *)v126 + 8))(v126);
            }
          }
          goto LABEL_179;
        }
        v10 = v9 >> 1;
        v11 = v6 - 56;
        if ((unint64_t)v8 < 0x1C01)
        {
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*>((uint64_t)&ii[7 * (v9 >> 1)], (uint64_t)ii, v11);
        }
        else
        {
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*>((uint64_t)ii, (uint64_t)&ii[7 * (v9 >> 1)], v11);
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*>((uint64_t)(v202 + 7), (uint64_t)&v202[7 * v10 - 7], (uint64_t)(v201 - 14));
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*>((uint64_t)(v202 + 14), (uint64_t)&v202[7 * v10 + 7], (uint64_t)(v201 - 21));
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*>((uint64_t)&v202[7 * v10 - 7], (uint64_t)&v202[7 * v10], (uint64_t)&v202[7 * v10 + 7]);
          *(_QWORD *)&v206 = &v202[7 * v10];
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(&v202, (uint64_t *)&v206);
        }
        --a3;
        v12 = v202;
        if ((a4 & 1) != 0)
        {
          v13 = v202[4];
          goto LABEL_12;
        }
        v13 = *(v202 - 3);
        v14 = v202[4];
        if (v13 < v14)
        {
          v13 = v202[4];
          goto LABEL_12;
        }
        if (v13 != v14)
        {
          v26 = *((_DWORD *)v202 + 12);
LABEL_59:
          v44 = (unint64_t)v201;
          v203 = (unint64_t)v201;
          v45 = *v202;
          *v202 = 0;
          v206 = *(_OWORD *)(v12 + 1);
          v207 = *((_DWORD *)v12 + 6);
          v12[4] = 0;
          v46 = *(_QWORD *)(v44 - 24);
          if (v14 < v46 || v14 == v46 && v26 > *(_DWORD *)(v44 - 8))
          {
            v47 = v12[11];
            if (v14 >= v47)
            {
              v54 = v12 + 18;
              do
              {
                if (v14 == v47 && v26 > *((_DWORD *)v54 - 10))
                  break;
                v55 = *v54;
                v54 += 7;
                v47 = v55;
              }
              while (v14 >= v55);
              m = v54 - 11;
            }
            else
            {
              m = v12 + 7;
            }
          }
          else
          {
            for (m = v12 + 7; (unint64_t)m < v44; m += 7)
            {
              v49 = m[4];
              if (v14 < v49 || v14 == v49 && v26 > *((_DWORD *)m + 12))
                break;
            }
          }
          v56 = v12[5];
          *(_QWORD *)&v204 = m;
          if ((unint64_t)m >= v44)
            goto LABEL_93;
          for (n = v44 - 80; v14 < v46 || v14 == v46 && v26 > *(_DWORD *)(n + 72); n -= 56)
          {
            v58 = *(_QWORD *)n;
            v46 = v58;
          }
          v44 = n + 24;
          while (1)
          {
            v203 = v44;
LABEL_93:
            if ((unint64_t)m >= v44)
              break;
            std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>((uint64_t **)&v204, (uint64_t *)&v203);
            v59 = *(_QWORD *)(v204 + 88);
            if (v14 >= v59)
            {
              v60 = (_QWORD *)(v204 + 144);
              do
              {
                if (v14 == v59 && v26 > *((_DWORD *)v60 - 10))
                  break;
                v61 = *v60;
                v60 += 7;
                v59 = v61;
              }
              while (v14 >= v61);
              m = v60 - 11;
            }
            else
            {
              m = (uint64_t *)(v204 + 56);
            }
            *(_QWORD *)&v204 = m;
            v44 = v203;
            do
            {
              do
              {
                v44 -= 56;
                v62 = *(_QWORD *)(v44 + 32);
              }
              while (v14 < v62);
            }
            while (v14 == v62 && v26 > *(_DWORD *)(v44 + 48));
          }
          if (m - 7 != v12)
          {
            v63 = *v12;
            *v12 = *(m - 7);
            *(m - 7) = v63;
            v64 = *((_OWORD *)m - 3);
            *((_DWORD *)v12 + 6) = *((_DWORD *)m - 8);
            *(_OWORD *)(v12 + 1) = v64;
            v65 = v12[4];
            v12[4] = *(m - 3);
            *(m - 3) = v65;
            *(_QWORD *)&v64 = v12[5];
            v12[5] = *(m - 2);
            *(m - 2) = v64;
            LODWORD(v65) = *((_DWORD *)v12 + 12);
            *((_DWORD *)v12 + 12) = *((_DWORD *)m - 2);
            *((_DWORD *)m - 2) = v65;
          }
          v66 = (unsigned int *)*(m - 7);
          *(m - 7) = v45;
          v67 = v206;
          *((_DWORD *)m - 8) = v207;
          *((_OWORD *)m - 3) = v67;
          v68 = (void *)*(m - 3);
          *(m - 3) = v14;
          *(m - 2) = v56;
          *((_DWORD *)m - 2) = v26;
          ii = (uint64_t *)v204;

          if (v66)
          {
            v69 = v66 + 2;
            do
            {
              v70 = __ldxr(v69);
              v71 = v70 - 1;
            }
            while (__stlxr(v71, v69));
            if (!v71)
            {
              __dmb(9u);
              (*(void (**)(unsigned int *))(*(_QWORD *)v66 + 8))(v66);
            }
          }
          goto LABEL_113;
        }
        v26 = *((_DWORD *)v202 + 12);
        if (*((_DWORD *)v202 - 2) <= v26)
          goto LABEL_59;
LABEL_12:
        v200 = a4;
        v15 = a3;
        v16 = 0;
        v17 = (unint64_t)v201;
        v18 = *v202;
        *v202 = 0;
        v206 = *(_OWORD *)(v12 + 1);
        v207 = *((_DWORD *)v12 + 6);
        v12[4] = 0;
        v19 = v12[5];
        v20 = *((_DWORD *)v12 + 12);
        while (1)
        {
          v21 = v12[v16 + 11];
          if (v21 >= v13 && (v21 != v13 || LODWORD(v12[v16 + 13]) <= v20))
            break;
          v16 += 7;
        }
        v22 = (unint64_t)&v12[v16 + 7];
        *(_QWORD *)&v204 = v22;
        if (v16 * 8)
        {
          v23 = *(_QWORD *)(v17 - 24);
          if (v23 >= v13)
          {
            v27 = v17 - 80;
            do
            {
              if (v23 == v13 && *(_DWORD *)(v27 + 72) > v20)
                break;
              v28 = *(_QWORD *)v27;
              v27 -= 56;
              v23 = v28;
            }
            while (v28 >= v13);
            v17 = v27 + 24;
          }
          else
          {
            v17 -= 56;
          }
        }
        else if (v22 < v17)
        {
          v24 = v17 - 56;
          v25 = *(_QWORD *)(v17 - 24);
          if (v25 >= v13)
          {
            v50 = v17 - 80;
            do
            {
              v51 = v50 + 24;
              if (v25 == v13)
              {
                if (*(_DWORD *)(v50 + 72) > v20 || v22 >= v51)
                  goto LABEL_22;
              }
              else if (v22 >= v51)
              {
                break;
              }
              v24 -= 56;
              v53 = *(_QWORD *)v50;
              v50 -= 56;
              v25 = v53;
            }
            while (v53 >= v13);
            v17 = v50 + 24;
          }
          else
          {
LABEL_22:
            v17 = v24;
          }
        }
        v203 = v17;
        ii = (uint64_t *)v22;
        if (v22 < v17)
        {
          do
          {
            std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>((uint64_t **)&v204, (uint64_t *)&v203);
            for (ii = (uint64_t *)(v204 + 56); ; ii += 7)
            {
              v29 = ii[4];
              if (v29 >= v13 && (v29 != v13 || *((_DWORD *)ii + 12) <= v20))
                break;
            }
            *(_QWORD *)&v204 = ii;
            v30 = *(_QWORD *)(v203 - 24);
            if (v30 >= v13)
            {
              v32 = v203 - 80;
              do
              {
                if (v30 == v13 && *(_DWORD *)(v32 + 72) > v20)
                  break;
                v33 = *(_QWORD *)v32;
                v32 -= 56;
                v30 = v33;
              }
              while (v33 >= v13);
              v31 = v32 + 24;
            }
            else
            {
              v31 = v203 - 56;
            }
            v203 = v31;
          }
          while ((unint64_t)ii < v31);
        }
        if (ii - 7 != v12)
        {
          v34 = *v12;
          *v12 = *(ii - 7);
          *(ii - 7) = v34;
          v35 = *((_OWORD *)ii - 3);
          *((_DWORD *)v12 + 6) = *((_DWORD *)ii - 8);
          *(_OWORD *)(v12 + 1) = v35;
          v36 = v12[4];
          v12[4] = *(ii - 3);
          *(ii - 3) = v36;
          *(_QWORD *)&v35 = v12[5];
          v12[5] = *(ii - 2);
          *(ii - 2) = v35;
          LODWORD(v36) = *((_DWORD *)v12 + 12);
          *((_DWORD *)v12 + 12) = *((_DWORD *)ii - 2);
          *((_DWORD *)ii - 2) = v36;
        }
        v37 = (unsigned int *)*(ii - 7);
        *(ii - 7) = v18;
        v38 = v206;
        *((_DWORD *)ii - 8) = v207;
        *((_OWORD *)ii - 3) = v38;
        v39 = (void *)*(ii - 3);
        *(ii - 3) = v13;
        *(ii - 2) = v19;
        *((_DWORD *)ii - 2) = v20;

        a3 = v15;
        a4 = v200;
        if (v37)
        {
          v40 = v37 + 2;
          do
          {
            v41 = __ldxr(v40);
            v42 = v41 - 1;
          }
          while (__stlxr(v42, v40));
          if (!v42)
          {
            __dmb(9u);
            (*(void (**)(unsigned int *))(*(_QWORD *)v37 + 8))(v37);
          }
        }
        if (v22 < v17)
        {
LABEL_52:
          std::__introsort<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*,false>(v202, ii - 7, a3, v200 & 1);
LABEL_113:
          a4 = 0;
LABEL_114:
          v202 = ii;
          goto LABEL_115;
        }
        v43 = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*>((uint64_t)v202, (uint64_t)(ii - 7));
        if (!std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*>((uint64_t)ii, (uint64_t)v201))
        {
          if (v43)
            goto LABEL_114;
          goto LABEL_52;
        }
        if (!v43)
        {
          v201 = ii - 7;
          ii = v202;
LABEL_115:
          v6 = (uint64_t)v201;
          continue;
        }
        return;
    }
  }
}

void sub_209BB6FC4(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  if (v2)
    RB::SharedSurfaceGroup::schedule_updates(v2);
  _Unwind_Resume(a1);
}

void std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  __int128 v8;
  uint64_t v9;
  unsigned int *v10;
  void *v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int v14;
  __int128 v15;
  int v16;

  v2 = *a1;
  v3 = *a2;
  v4 = **a1;
  *v2 = 0;
  v15 = *(_OWORD *)(v2 + 1);
  v16 = *((_DWORD *)v2 + 6);
  v5 = v2[4];
  v2[4] = 0;
  v6 = v2[5];
  v7 = *((_DWORD *)v2 + 12);
  *v2 = *(_QWORD *)v3;
  *(_QWORD *)v3 = 0;
  v8 = *(_OWORD *)(v3 + 8);
  *((_DWORD *)v2 + 6) = *(_DWORD *)(v3 + 24);
  *(_OWORD *)(v2 + 1) = v8;
  v9 = v2[4];
  v2[4] = *(_QWORD *)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v9;
  v2[5] = *(_QWORD *)(v3 + 40);
  *((_DWORD *)v2 + 12) = *(_DWORD *)(v3 + 48);
  v10 = *(unsigned int **)v3;
  *(_QWORD *)v3 = v4;
  *(_OWORD *)(v3 + 8) = v15;
  *(_DWORD *)(v3 + 24) = v16;
  v11 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v5;
  *(_QWORD *)(v3 + 40) = v6;
  *(_DWORD *)(v3 + 48) = v7;

  if (v10)
  {
    v12 = v10 + 2;
    do
    {
      v13 = __ldxr(v12);
      v14 = v13 - 1;
    }
    while (__stlxr(v14, v12));
    if (!v14)
    {
      __dmb(9u);
      (*(void (**)(unsigned int *))(*(_QWORD *)v10 + 8))(v10);
    }
  }
}

void std::__sort5_maybe_branchless[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*,0>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;

  v21 = (uint64_t *)a2;
  v22 = (uint64_t *)a1;
  v19 = (uint64_t *)a4;
  v20 = (uint64_t *)a3;
  v18 = a5;
  std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*>(a1, a2, a3, a4);
  v10 = *(_QWORD *)(a5 + 32);
  v11 = *(_QWORD *)(a4 + 32);
  if (v10 < v11 || v10 == v11 && *(_DWORD *)(a5 + 48) > *(_DWORD *)(a4 + 48))
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(&v19, &v18);
    v12 = v19[4];
    v13 = *(_QWORD *)(a3 + 32);
    if (v12 < v13 || v12 == v13 && *((_DWORD *)v19 + 12) > *(_DWORD *)(a3 + 48))
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(&v20, (uint64_t *)&v19);
      v14 = v20[4];
      v15 = *(_QWORD *)(a2 + 32);
      if (v14 < v15 || v14 == v15 && *((_DWORD *)v20 + 12) > *(_DWORD *)(a2 + 48))
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(&v21, (uint64_t *)&v20);
        v16 = v21[4];
        v17 = *(_QWORD *)(a1 + 32);
        if (v16 < v17 || v16 == v17 && *((_DWORD *)v21 + 12) > *(_DWORD *)(a1 + 48))
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(&v22, (uint64_t *)&v21);
      }
    }
  }
}

void std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t **v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;

  v15 = (uint64_t *)a1;
  v13 = a3;
  v14 = (uint64_t *)a2;
  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(_QWORD *)(a1 + 32);
  if (v3 < v4 || v3 == v4 && *(_DWORD *)(a2 + 48) > *(_DWORD *)(a1 + 48))
  {
    v5 = *(_QWORD *)(a3 + 32);
    if (v5 < v3 || v5 == v3 && *(_DWORD *)(a3 + 48) > *(_DWORD *)(a2 + 48))
    {
      v6 = &v15;
    }
    else
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(&v15, (uint64_t *)&v14);
      v11 = *(_QWORD *)(v13 + 32);
      v12 = v14[4];
      if (v11 >= v12 && (v11 != v12 || *(_DWORD *)(v13 + 48) <= *((_DWORD *)v14 + 12)))
        return;
      v6 = &v14;
    }
    v10 = &v13;
LABEL_14:
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(v6, v10);
    return;
  }
  v7 = *(_QWORD *)(a3 + 32);
  if (v7 < v3 || v7 == v3 && *(_DWORD *)(a3 + 48) > *(_DWORD *)(a2 + 48))
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(&v14, &v13);
    v8 = v14[4];
    v9 = v15[4];
    if (v8 < v9 || v8 == v9 && *((_DWORD *)v14 + 12) > *((_DWORD *)v15 + 12))
    {
      v6 = &v15;
      v10 = (uint64_t *)&v14;
      goto LABEL_14;
    }
  }
}

BOOL std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*>(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _BOOL8 result;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  void *v23;
  unsigned int *v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t *v28;
  __int128 v29;
  int v30;
  uint64_t v31;

  v2 = a2;
  v31 = *MEMORY[0x24BDAC8D0];
  v27 = a2;
  v28 = (uint64_t *)a1;
  v4 = 0x6DB6DB6DB6DB6DB7 * ((a2 - a1) >> 3);
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v27 = a2 - 56;
      v6 = *(_QWORD *)(a2 - 24);
      v7 = *(_QWORD *)(a1 + 32);
      if (v6 < v7 || v6 == v7 && *(_DWORD *)(a2 - 8) > *(_DWORD *)(a1 + 48))
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(&v28, &v27);
        return 1;
      }
      return result;
    case 3:
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*>(a1, a1 + 56, a2 - 56);
      return 1;
    case 4:
      std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*>(a1, a1 + 56, a1 + 112, a2 - 56);
      return 1;
    case 5:
      std::__sort5_maybe_branchless[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*,0>(a1, a1 + 56, a1 + 112, a1 + 168, a2 - 56);
      return 1;
    default:
      v8 = a1 + 112;
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*>(a1, a1 + 56, a1 + 112);
      v9 = a1 + 168;
      if (v9 == v2)
        return 1;
      v10 = 0;
      break;
  }
  while (1)
  {
    v11 = *(_QWORD *)(v9 + 32);
    v12 = *(_QWORD *)(v8 + 32);
    if (v11 >= v12)
    {
      if (v11 != v12)
        goto LABEL_23;
      v13 = *(_DWORD *)(v9 + 48);
      if (v13 <= *(_DWORD *)(v8 + 48))
        goto LABEL_23;
    }
    else
    {
      v13 = *(_DWORD *)(v9 + 48);
    }
    v14 = 0;
    v15 = *(_QWORD *)v9;
    *(_QWORD *)v9 = 0;
    v29 = *(_OWORD *)(v9 + 8);
    v30 = *(_DWORD *)(v9 + 24);
    *(_QWORD *)(v9 + 32) = 0;
    v16 = *(_QWORD *)(v9 + 40);
    while (1)
    {
      *(_QWORD *)(v8 + 56) = *(_QWORD *)v8;
      *(_QWORD *)v8 = v14;
      *(_OWORD *)(v8 + 64) = *(_OWORD *)(v8 + 8);
      *(_DWORD *)(v8 + 80) = *(_DWORD *)(v8 + 24);
      v17 = *(_QWORD *)(v8 + 88);
      *(_QWORD *)(v8 + 88) = *(_QWORD *)(v8 + 32);
      *(_QWORD *)(v8 + 32) = v17;
      v18 = *(_QWORD *)(v8 + 96);
      *(_QWORD *)(v8 + 96) = *(_QWORD *)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v18;
      LODWORD(v17) = *(_DWORD *)(v8 + 104);
      *(_DWORD *)(v8 + 104) = *(_DWORD *)(v8 + 48);
      *(_DWORD *)(v8 + 48) = v17;
      if ((uint64_t *)v8 == v28)
        break;
      v19 = *(_QWORD *)(v8 - 24);
      if (v11 >= v19 && (v11 != v19 || v13 <= *(_DWORD *)(v8 - 8)))
        break;
      v20 = *(_QWORD *)v8;
      v8 -= 56;
      v14 = v20;
    }
    v21 = *(_QWORD *)v8;
    *(_QWORD *)v8 = v15;
    v22 = v29;
    *(_DWORD *)(v8 + 24) = v30;
    *(_OWORD *)(v8 + 8) = v22;
    v23 = *(void **)(v8 + 32);
    *(_QWORD *)(v8 + 32) = v11;
    *(_QWORD *)(v8 + 40) = v16;
    *(_DWORD *)(v8 + 48) = v13;

    if (v21)
    {
      v24 = (unsigned int *)(v21 + 8);
      do
      {
        v25 = __ldxr(v24);
        v26 = v25 - 1;
      }
      while (__stlxr(v26, v24));
      if (!v26)
      {
        __dmb(9u);
        (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
      }
    }
    if (++v10 == 8)
      return v9 + 56 == v27;
    v2 = v27;
LABEL_23:
    v8 = v9;
    v9 += 56;
    if (v9 == v2)
      return 1;
  }
}

void std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;

  v16 = (uint64_t *)a2;
  v17 = (uint64_t *)a1;
  v14 = a4;
  v15 = (uint64_t *)a3;
  std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,RB::SharedSurface::update_removes(RB::vector<RB::SharedSurface::Remove,0ul,unsigned int> &)::$_0 &,RB::SharedSurface::Remove*>(a1, a2, a3);
  v8 = *(_QWORD *)(a4 + 32);
  v9 = *(_QWORD *)(a3 + 32);
  if (v8 < v9 || v8 == v9 && *(_DWORD *)(a4 + 48) > *(_DWORD *)(a3 + 48))
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(&v15, &v14);
    v10 = v15[4];
    v11 = *(_QWORD *)(a2 + 32);
    if (v10 < v11 || v10 == v11 && *((_DWORD *)v15 + 12) > *(_DWORD *)(a2 + 48))
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(&v16, (uint64_t *)&v15);
      v12 = v16[4];
      v13 = *(_QWORD *)(a1 + 32);
      if (v12 < v13 || v12 == v13 && *((_DWORD *)v16 + 12) > *(_DWORD *)(a1 + 48))
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:nn180100]<RB::SharedSurface::Remove *&,RB::SharedSurface::Remove *&>(&v17, (uint64_t *)&v16);
    }
  }
}

void RB::SharedSurfaceGroup::collect_removed_locked(void)::$_0::__invoke(_QWORD *context)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  unint64_t v11;
  id *v12;
  unsigned int *v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int v16;

  v2 = *((unsigned int *)context + 4);
  if ((_DWORD)v2)
  {
    v3 = 24 * v2;
    v4 = context[1] + 8;
    do
    {
      RB::SharedSurface::update_removes(v4);
      v4 += 24;
      v3 -= 24;
    }
    while (v3);
  }
  dispatch_sync_f(*(dispatch_queue_t *)(*(_QWORD *)*context + 32), context, (dispatch_function_t)RB::SharedSurfaceGroup::collect_removed_locked(void)::$_0::operator() const(void *)::{lambda(void *)#1}::__invoke);
  v5 = (char *)context[1];
  if (*((_DWORD *)context + 4))
  {
    v6 = 0;
    do
    {
      v7 = &v5[24 * v6];
      v10 = (char *)*((_QWORD *)v7 + 1);
      v9 = v7 + 8;
      v8 = v10;
      if (*((_DWORD *)v9 + 2))
      {
        v11 = 0;
        do
        {
          v12 = (id *)&v8[56 * v11];

          v13 = (unsigned int *)*v12;
          if (*v12)
          {
            v14 = v13 + 2;
            do
            {
              v15 = __ldxr(v14);
              v16 = v15 - 1;
            }
            while (__stlxr(v16, v14));
            if (!v16)
            {
              __dmb(9u);
              (*(void (**)(unsigned int *))(*(_QWORD *)v13 + 8))(v13);
            }
          }
          ++v11;
        }
        while (v11 < *((unsigned int *)v9 + 2));
        v8 = *(char **)v9;
      }
      if (v8)
        free(v8);
      ++v6;
    }
    while (v6 < *((unsigned int *)context + 4));
    v5 = (char *)context[1];
  }
  if (v5)
    free(v5);
  JUMPOUT(0x20BD16544);
}

void RB::SharedSurfaceGroup::collect_removed_locked(void)::$_0::operator() const(void *)::{lambda(void *)#1}::__invoke(uint64_t a1)
{
  RB::SharedSurfaceGroup::commit_removed(*(_QWORD *)a1, (uint64_t **)(a1 + 8));
}

void RB::SharedSurfaceGroup::relocate_surface(RB::SharedSurface *,BOOL)::$_1::__invoke(RB::SharedSurfaceGroup **a1)
{
  unsigned int *v2;
  unsigned int v3;
  unsigned int v4;

  RB::SharedSurfaceGroup::render_updates(a1[2]);
  v2 = (unsigned int *)(a1 + 1);
  do
  {
    v3 = __ldxr(v2);
    v4 = v3 - 1;
  }
  while (__stlxr(v4, v2));
  if (!v4)
  {
    __dmb(9u);
    (*((void (**)(RB::SharedSurfaceGroup **))*a1 + 1))(a1);
  }
}

void sub_209BB78DC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;

  v3 = (unsigned int *)(v1 + 8);
  do
  {
    v4 = __ldxr(v3);
    v5 = v4 - 1;
  }
  while (__stlxr(v5, v3));
  if (!v5)
    RB::CustomShader::Library::intern_function(v1);
  _Unwind_Resume(exception_object);
}

void *RB::vector<RB::SharedSurface::AsyncUpdate,0ul,unsigned int>::reserve_slow(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  void *result;

  if (*(_DWORD *)(a1 + 12) + (*(_DWORD *)(a1 + 12) >> 1) <= a2)
    v3 = a2;
  else
    v3 = *(_DWORD *)(a1 + 12) + (*(_DWORD *)(a1 + 12) >> 1);
  result = RB::details::realloc_vector<unsigned int,144ul>(*(void **)a1, (_DWORD *)(a1 + 12), v3);
  *(_QWORD *)a1 = result;
  return result;
}

void *RB::details::realloc_vector<unsigned int,144ul>(void *a1, _DWORD *a2, unsigned int a3)
{
  void *v4;
  size_t v5;
  unint64_t v6;
  void *v7;
  const char *v8;

  v4 = a1;
  if (a3)
  {
    v5 = malloc_good_size(144 * a3);
    v6 = v5 / 0x90;
    if (*a2 != (v5 / 0x90))
    {
      v7 = malloc_type_realloc(v4, v5, 0x2F8905C9uLL);
      if (!v7)
        RB::precondition_failure((RB *)"allocation failure", v8);
      v4 = v7;
      *a2 = v6;
    }
  }
  else
  {
    *a2 = 0;
    free(a1);
    return 0;
  }
  return v4;
}

void *RB::vector<RB::SharedSurfaceGroup::render_async(void)::Completion,8ul,unsigned long>::reserve_slow(void *__dst, size_t a2)
{
  size_t v3;
  void *result;

  if (*((_QWORD *)__dst + 66) + (*((_QWORD *)__dst + 66) >> 1) <= a2)
    v3 = a2;
  else
    v3 = *((_QWORD *)__dst + 66) + (*((_QWORD *)__dst + 66) >> 1);
  result = RB::details::realloc_vector<unsigned long,64ul>(*((void **)__dst + 64), __dst, 8uLL, (size_t *)__dst + 66, v3);
  *((_QWORD *)__dst + 64) = result;
  return result;
}

void *RB::details::realloc_vector<unsigned long,64ul>(void *__src, void *__dst, size_t a3, size_t *a4, size_t a5)
{
  void *v7;
  size_t v8;
  size_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v7 = __src;
  if (a5 <= a3)
  {
    if (__src)
    {
      v9 = a3;
      memcpy(__dst, __src, a5 << 6);
      free(v7);
      v12 = 0;
LABEL_8:
      *a4 = v9;
      return v12;
    }
  }
  else
  {
    v8 = malloc_good_size(a5 << 6);
    v9 = v8 >> 6;
    if (v8 >> 6 != *a4)
    {
      v10 = malloc_type_realloc(v7, v8, 0x66ED1BA4uLL);
      if (!v10)
        RB::precondition_failure((RB *)"allocation failure", v11);
      v12 = v10;
      if (!v7)
        memcpy(v10, __dst, *a4 << 6);
      goto LABEL_8;
    }
  }
  return v7;
}

void *RB::vector<RB::SharedSubsurface,4ul,unsigned int>::reserve_slow(void *__dst, unsigned int a2)
{
  unsigned int v3;
  void *result;

  if (*((_DWORD *)__dst + 59) + (*((_DWORD *)__dst + 59) >> 1) <= a2)
    v3 = a2;
  else
    v3 = *((_DWORD *)__dst + 59) + (*((_DWORD *)__dst + 59) >> 1);
  result = RB::details::realloc_vector<unsigned int,56ul>(*((void **)__dst + 28), __dst, 4u, (_DWORD *)__dst + 59, v3);
  *((_QWORD *)__dst + 28) = result;
  return result;
}

void OUTLINED_FUNCTION_1_2(unsigned int *a1@<X8>)
{
  __ldxr(a1);
}

double RB::Fill::Color::convert_color(RB::Shader::Tables *a1, int a2, uint16x4_t a3)
{
  float16x4_t v3;
  char v4;
  char v5;
  uint16x4_t v6;
  int8x16_t v7;
  int8x16_t v8;
  int8x16_t v9;
  __int16 *v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  uint16x4_t v14;
  uint64_t v15;
  int8x16_t v16;
  int8x16_t v17;
  int8x16_t v18;
  __int16 *v19;
  __int16 v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v3 = (float16x4_t)a3;
  if ((_DWORD)a1 == a2)
    return *(double *)&v3;
  v4 = a2;
  v5 = (char)a1;
  if ((a1 & 1) != 0)
  {
    v6 = vshr_n_u16(a3, 3uLL);
    v21 = v6.i16[0];
    v23 = *(_QWORD *)&v6 & 0xFFF0FFF0FFF0FFFLL;
    a1 = (RB::Shader::Tables *)RB::Shader::Tables::shared(a1);
    v7.i64[0] = WORD1(v23);
    v7.i64[1] = WORD2(v23);
    v8.i64[0] = 0xFFFFLL;
    v8.i64[1] = 0xFFFFLL;
    v9 = vandq_s8(v7, v8);
    v10 = (__int16 *)((char *)a1 + 2 * v9.i64[0] + 0x2000);
    v9.i16[0] = *((_WORD *)a1 + (v21 & 0xFFF) + 4096);
    v9.i16[1] = *v10;
    v9.i16[2] = *((_WORD *)a1 + v9.i64[1] + 4096);
    v3 = (float16x4_t)vorr_s8(*(int8x8_t *)v9.i8, vand_s8((int8x8_t)v3, (int8x8_t)0x8000800080008000));
  }
  if ((v5 & 0xFE) == 0 && (v4 & 0xFE) == 2)
  {
    v11 = vcvtq_f32_f16(v3);
    v12 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)xmmword_209BDA1F0, *(float32x2_t *)v11.f32, 1), (float32x4_t)xmmword_209BDA1E0, v11.f32[0]);
    v13 = (float32x4_t)xmmword_209BDA200;
LABEL_10:
    v3 = vcvt_f16_f32(vmlaq_laneq_f32(v12, v13, v11, 2));
    goto LABEL_11;
  }
  if ((v5 & 0xFE) == 2 && (v4 & 0xFE) == 0)
  {
    v11 = vcvtq_f32_f16(v3);
    v12 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)xmmword_209BDA1C0, *(float32x2_t *)v11.f32, 1), (float32x4_t)xmmword_209BDA1B0, v11.f32[0]);
    v13 = (float32x4_t)xmmword_209BDA1D0;
    goto LABEL_10;
  }
LABEL_11:
  if ((v4 & 1) != 0)
  {
    v14 = vshr_n_u16((uint16x4_t)v3, 3uLL);
    v22 = v14.i16[0];
    v24 = *(_QWORD *)&v14 & 0xFFF0FFF0FFF0FFFLL;
    v15 = RB::Shader::Tables::shared(a1);
    v16.i64[0] = WORD1(v24);
    v16.i64[1] = WORD2(v24);
    v17.i64[0] = 0xFFFFLL;
    v17.i64[1] = 0xFFFFLL;
    v18 = vandq_s8(v16, v17);
    v19 = (__int16 *)(v15 + 2 * v18.i64[0]);
    v18.i16[0] = *(_WORD *)(v15 + 2 * (v22 & 0xFFF));
    v18.i16[1] = *v19;
    v18.i16[2] = *(_WORD *)(v15 + 2 * v18.i64[1]);
    v3 = (float16x4_t)vorr_s8(*(int8x8_t *)v18.i8, vand_s8((int8x8_t)v3, (int8x8_t)0x8000800080008000));
  }
  return *(double *)&v3;
}

__int16 RB::Fill::Color::convert_from_oklab@<H0>(RB::Fill::Color *this@<X0>)
{
  __int16 result;

  _H0 = *(_WORD *)this;
  __asm { FCVT            S0, H0 }
  _S1 = _S0 * _S0;
  __asm
  {
    FCVT            H1, S1
    FCVT            S1, H1
  }
  _S0 = _S1 * _S0;
  __asm { FCVT            H0, S0 }
  LOWORD(_S1) = *((_WORD *)this + 1);
  __asm { FCVT            S1, H1 }
  _S2 = _S1 * _S1;
  __asm
  {
    FCVT            H2, S2
    FCVT            S2, H2
  }
  _S1 = _S2 * _S1;
  __asm { FCVT            H1, S1 }
  LOWORD(_S2) = *((_WORD *)this + 2);
  __asm { FCVT            S2, H2 }
  _S3 = _S2 * _S2;
  __asm
  {
    FCVT            H3, S3
    FCVT            S3, H3
  }
  _S2 = _S3 * _S2;
  __asm
  {
    FCVT            H2, S2
    FCVT            S0, H0
  }
  _S3 = _S0 * 4.0781;
  __asm
  {
    FCVT            H3, S3
    FCVT            S1, H1
  }
  _S4 = _S1 * -3.3086;
  __asm
  {
    FCVT            H4, S4
    FCVT            S3, H3
    FCVT            S4, H4
  }
  _S3 = _S4 + _S3;
  __asm
  {
    FCVT            H3, S3
    FCVT            S2, H2
  }
  _S4 = _S2 * 0.23096;
  __asm
  {
    FCVT            H4, S4
    FCVT            S3, H3
    FCVT            S4, H4
  }
  _S3 = _S3 + _S4;
  __asm { FCVT            H3, S3 }
  *(_WORD *)this = LOWORD(_S3);
  _S3 = _S0 * -1.2686;
  __asm { FCVT            H3, S3 }
  _S4 = _S1 * 2.6094;
  __asm
  {
    FCVT            H4, S4
    FCVT            S3, H3
    FCVT            S4, H4
  }
  _S3 = _S4 + _S3;
  __asm { FCVT            H3, S3 }
  _S4 = _S2 * -0.34131;
  __asm
  {
    FCVT            H4, S4
    FCVT            S3, H3
    FCVT            S4, H4
  }
  _S3 = _S3 + _S4;
  __asm { FCVT            H3, S3 }
  *((_WORD *)this + 1) = LOWORD(_S3);
  _S0 = _S0 * -0.0041962;
  __asm { FCVT            H0, S0 }
  _S1 = _S1 * -0.70361;
  __asm
  {
    FCVT            H1, S1
    FCVT            S0, H0
    FCVT            S1, H1
  }
  _S0 = _S1 + _S0;
  __asm { FCVT            H0, S0 }
  _S1 = _S2 * 1.708;
  __asm
  {
    FCVT            H1, S1
    FCVT            S0, H0
    FCVT            S1, H1
  }
  _S0 = _S0 + _S1;
  __asm { FCVT            H0, S0 }
  *((_WORD *)this + 2) = result;
  return result;
}

__n64 RB::Fill::Color::prepare(uint64_t a1, int a2, int a3, uint16x4_t a4, int8x8_t a5)
{
  float16x4_t v6;
  const __int16 *v7;
  float16x4_t v8;
  float32x4_t v9;
  __n64 result;
  unint64_t v11;
  int16x4_t v12;

  if (*(_BYTE *)(a1 + 9) && *(unsigned __int8 *)(a1 + 8) != a2)
  {
    v11 = RB::Fill::Color::converted((__int16 *)a1, a2, a4);
    result.n64_u32[0] = v11;
    result.n64_u16[2] = WORD2(v11);
    if (a3)
    {
      result.n64_u16[3] = unk_209BDA274;
      v12.i32[0] = HIWORD(v11);
      v9 = vmulq_f32(vcvtq_f32_f16((float16x4_t)vdup_lane_s16(v12, 0)), vcvtq_f32_f16((float16x4_t)result.n64_u64[0]));
      goto LABEL_5;
    }
    result.n64_u16[3] = HIWORD(v11);
  }
  else
  {
    if (a3)
    {
      v6.i16[3] = 15360;
      v6.i16[0] = *(_WORD *)a1;
      *(__int32 *)((char *)v6.i32 + 2) = *(_DWORD *)(a1 + 2);
      v7 = (const __int16 *)(a1 + 6);
      v8 = (float16x4_t)vld1_dup_s16(v7);
      v9 = vmulq_f32(vcvtq_f32_f16(v8), vcvtq_f32_f16(v6));
LABEL_5:
      result.n64_u64[0] = (unint64_t)vcvt_f16_f32(v9);
      return result;
    }
    a5.i16[0] = *(_WORD *)a1;
    a4.i32[0] = *(_DWORD *)(a1 + 2);
    result.n64_u64[0] = (unint64_t)vext_s8(vext_s8(a5, a5, 2uLL), (int8x8_t)a4, 6uLL);
    result.n64_u16[3] = *(_WORD *)(a1 + 6);
  }
  return result;
}

unint64_t RB::Fill::Color::converted(__int16 *a1, int a2, uint16x4_t a3)
{
  unsigned __int16 v3;
  uint64_t v4;
  unsigned int v5;
  double v6;

  a3.i16[0] = *a1;
  a3.i16[2] = a1[1];
  v3 = a1[2];
  v4 = (unsigned __int16)a1[3];
  v5 = (unsigned __int16)a1[4];
  if (v5 >= 0x100 && a2 != v5)
  {
    a3.i16[1] = a1[1];
    a3.i16[2] = a1[2];
    v6 = RB::Fill::Color::convert_color((RB::Shader::Tables *)a1[4], a2, a3);
    v3 = WORD2(v6);
    a3 = (uint16x4_t)vmovl_u16(*(uint16x4_t *)&v6).u64[0];
  }
  return (v4 << 48) | ((unint64_t)v3 << 32) | ((unint64_t)a3.u16[2] << 16) | a3.u16[0];
}

unsigned __int16 RB::Fill::Color::append_color_matrix@<H0>(__int16 *a1@<X0>, float16x4_t *a2@<X1>, int a3@<W2>, __int16 a4@<W3>, uint16x4_t a5@<D0>)
{
  float v23;
  float32x2_t v24;
  unsigned __int16 result;

  if ((a4 & 0xFF00) != 0)
    RB::Fill::Color::convert((uint64_t)a1, a4, a5);
  if (!a3)
    return RB::operator*=((uint64_t)a1, a2).u16[0];
  _H0 = *a1;
  _H1 = a1[3];
  __asm
  {
    FCVT            S0, H0
    FCVT            S1, H1
  }
  _S0 = _S1 * _S0;
  __asm { FCVT            H0, S0 }
  *a1 = LOWORD(_S0);
  LOWORD(_S0) = a1[1];
  __asm { FCVT            S0, H0 }
  _S0 = _S0 * _S1;
  __asm { FCVT            H0, S0 }
  a1[1] = LOWORD(_S0);
  LOWORD(_S0) = a1[2];
  __asm { FCVT            S0, H0 }
  _S0 = _S0 * _S1;
  __asm { FCVT            H0, S0 }
  a1[2] = LOWORD(_S0);
  RB::operator*=((uint64_t)a1, a2);
  _H0 = a1[3];
  __asm { FCVT            S0, H0 }
  if (_S0 == 0.0)
  {
    _H0 = 0;
  }
  else
  {
    v23 = _S0;
    v24 = vrecpe_f32((float32x2_t)LODWORD(_S0));
    _D0 = vmul_f32(vrecps_f32((float32x2_t)LODWORD(v23), v24), v24);
    _D0.i32[0] = vmul_f32(_D0, vrecps_f32((float32x2_t)LODWORD(v23), _D0)).u32[0];
    __asm { FCVT            H0, S0 }
  }
  _H1 = *a1;
  __asm
  {
    FCVT            S1, H1
    FCVT            S0, H0
  }
  _S1 = _S1 * _S0;
  __asm { FCVT            H1, S1 }
  *a1 = LOWORD(_S1);
  LOWORD(_S1) = a1[1];
  __asm { FCVT            S1, H1 }
  _S1 = _S1 * _S0;
  __asm { FCVT            H1, S1 }
  a1[1] = LOWORD(_S1);
  LOWORD(_S1) = a1[2];
  __asm { FCVT            S1, H1 }
  _S0 = _S1 * _S0;
  __asm { FCVT            H0, S0 }
  a1[2] = result;
  return result;
}

uint64_t RB::Fill::Color::can_mix(RB::Fill::Color *this, const RB::Fill::Color *a2)
{
  float32x4_t v23;

  if (*((_BYTE *)this + 9))
    _ZF = *((_BYTE *)a2 + 9) == 0;
  else
    _ZF = 1;
  if (_ZF || *((unsigned __int8 *)this + 8) == *((unsigned __int8 *)a2 + 8))
  {
    _D1.i16[0] = *(_WORD *)this;
    _D0.i16[0] = *(_WORD *)a2;
    __asm
    {
      FCVT            S2, H0
      FCVT            S3, H1
    }
    if (_S3 == _S2)
    {
      _H2 = *((_WORD *)this + 1);
      _H3 = *((_WORD *)a2 + 1);
      __asm
      {
        FCVT            S3, H3
        FCVT            S2, H2
      }
      if (_S2 == _S3)
      {
        _H2 = *((_WORD *)this + 2);
        _H3 = *((_WORD *)a2 + 2);
        __asm
        {
          FCVT            S3, H3
          FCVT            S2, H2
        }
        if (_S2 == _S3)
        {
          _H2 = *((_WORD *)this + 3);
          _H3 = *((_WORD *)a2 + 3);
          __asm
          {
            FCVT            S3, H3
            FCVT            S2, H2
          }
          if (_S2 == _S3)
            return 4;
        }
      }
    }
  }
  else
  {
    _D1.i16[0] = *(_WORD *)this;
    _D0.i16[0] = *(_WORD *)a2;
  }
  _D1.i16[1] = *((_WORD *)this + 1);
  _D1.i32[1] = *((_DWORD *)this + 1);
  v23.i64[0] = 0xC7000000C7000000;
  v23.i64[1] = 0xC7000000C7000000;
  _D0.i16[1] = *((_WORD *)a2 + 1);
  _D0.i32[1] = *((_DWORD *)a2 + 1);
  return (vminvq_u32((uint32x4_t)vmvnq_s8(veorq_s8((int8x16_t)vceqq_f32(vcvtq_f32_f16(_D1), v23), (int8x16_t)vceqq_f32(vcvtq_f32_f16(_D0), v23)))) >> 30) & 2;
}

void RB::Fill::Color::mix(float16x4_t *a1, float16x4_t *a2, int a3, int8x16_t _Q0, int8x16_t _Q1, double a6, double a7, double a8, int8x16_t a9)
{
  int v12;
  float16x4_t v38;
  float16x4_t v39;
  float16x4_t v41;
  float16x4_t v42;
  float16x4_t v44;
  float32x4_t v51;
  int8x8_t v52;
  int v53;
  unsigned __int16 v54;
  uint64_t v55;
  unsigned int v56;
  double v57;
  unint64_t v58;
  unsigned __int16 v59;
  uint64_t v60;
  unsigned int v61;
  double v62;
  unint64_t v63;
  int8x16_t v64;
  int8x16_t v65;
  double v66;
  double v67;
  double v68;
  int8x16_t v69;
  float16x4_t v74;
  float16x4_t v75;
  float16x4_t v76;
  float16x4_t v77;
  float16x4_t v80;
  float16x4_t v87;
  int8x8_t v88;
  float16x4_t v106;
  float16x4_t v107;
  float16x4_t v109;
  float16x4_t v110;
  float16x4_t v113;
  float16x4_t v114;
  float16x4_t v116;
  float16x4_t v122;
  int8x8_t v123;
  int v124;
  float16x4_t v125;
  float32x4_t v126;
  unint64_t v127;
  __int16 v128;
  unint64_t v129;
  __int16 v130;
  unint64_t v131;
  unsigned __int16 v132;

  _D17 = _Q0.i64[0];
  if (!a1[1].i8[1] || !a2[1].i8[1])
  {
    _H1 = a1->i16[3];
    _H7 = a2->i16[3];
    __asm
    {
      FCVT            S2, H7
      FCVT            S3, H1
    }
    v38 = *a1;
    v39 = *a1;
    v39.i16[3] = _H1;
    *(float16x4_t *)_Q6.f32 = *a2;
    v41 = *a2;
    v41.i16[3] = _H7;
    if (_S3 != _S2)
    {
      v42 = *a1;
      v42.i16[3] = 15360;
      v39 = vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16((float16x4_t)vdup_lane_s16((int16x4_t)v39, 3)), vcvtq_f32_f16(v42)));
      _Q6.i16[3] = 15360;
      _Q6 = vcvtq_f32_f16(*(float16x4_t *)_Q6.f32);
      v41 = vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16((float16x4_t)vdup_lane_s16((int16x4_t)v41, 3)), _Q6));
    }
    __asm { FCVT            H6, S17 }
    _Q3 = vcvtq_f32_f16(v39);
    v44 = vcvt_f16_f32(vmulq_f32(_Q3, vcvtq_f32_f16((float16x4_t)vdup_lane_s16(*(int16x4_t *)_Q6.f32, 0))));
    _Q3.i32[0] = HIDWORD(_D17);
    __asm { FCVT            H3, S3 }
    _Q4 = vcvtq_f32_f16(v41);
    _D2 = (int8x8_t)vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(v44), vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(_Q4, vcvtq_f32_f16((float16x4_t)vdup_lane_s16(*(int16x4_t *)_Q3.f32, 0)))))));
    _D3 = (int16x4_t)_D2;
    if (!_ZF)
    {
      _H3 = _D2.i16[3];
      __asm { FCVT            S4, H3 }
      _ZF = _Q4.f32[0] == 0.0 || _Q4.f32[0] == 1.0;
      _D3 = (int16x4_t)_D2;
      if (!_ZF)
      {
        *(float *)_D3.i32 = 1.0 / _Q4.f32[0];
        __asm
        {
          FCVT            H3, S3
          FCVT            S4, H2
          FCVT            S5, H3
        }
        _Q4.f32[0] = _S5 * _Q4.f32[0];
        __asm { FCVT            H4, S4 }
        _D3 = (int16x4_t)vext_s8(vext_s8(*(int8x8_t *)_Q4.f32, *(int8x8_t *)_Q4.f32, 2uLL), (int8x8_t)vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16((float16x4_t)vdup_lane_s16(_D3, 0)), vcvtq_f32_f16((float16x4_t)vext_s8(_D2, (int8x8_t)v38, 2uLL)))), 6uLL);
      }
    }
    v38.i16[3] = a1->i16[3];
    v51.i64[0] = 0xC7000000C7000000;
    v51.i64[1] = 0xC7000000C7000000;
    _D3.i16[3] = _D2.i16[3];
    v52 = vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(vcvtq_f32_f16(v38), v51))), (int8x8_t)_D3, (int8x8_t)v38);
    goto LABEL_54;
  }
  v12 = a2[1].u8[0];
  if (a1[1].u8[0] != v12)
    goto LABEL_57;
  _H0 = a1->i16[0];
  _H1 = a2->i16[0];
  __asm
  {
    FCVT            S1, H1
    FCVT            S0, H0
  }
  if (*(float *)_Q0.i32 != *(float *)_Q1.i32)
    goto LABEL_57;
  _H0 = a1->i16[1];
  _H1 = a2->i16[1];
  __asm
  {
    FCVT            S1, H1
    FCVT            S0, H0
  }
  if (*(float *)_Q0.i32 != *(float *)_Q1.i32)
    goto LABEL_57;
  _H0 = a1->i16[2];
  _H1 = a2->i16[2];
  __asm
  {
    FCVT            S1, H1
    FCVT            S0, H0
  }
  if (*(float *)_Q0.i32 != *(float *)_Q1.i32)
  {
LABEL_57:
    v53 = 0;
    switch(a3)
    {
      case 0:
        v53 = 0;
        break;
      case 1:
        v53 = 0;
        v12 |= 1u;
        break;
      case 2:
        goto LABEL_23;
      case 3:
        v53 = 1;
LABEL_23:
        v12 &= 0xFEu;
        break;
      default:
        v53 = 0;
        v12 = 0;
        break;
    }
    _Q0.i16[0] = a1->i16[0];
    _Q0.i16[2] = a1->i16[1];
    v54 = a1->u16[2];
    v55 = a1->u16[3];
    v56 = a1[1].u16[0];
    v127 = _D17;
    if (v56 >= 0x100)
    {
      if (v12 == v56)
        goto LABEL_28;
      _Q0.i16[1] = a1->i16[1];
      _Q0.i16[2] = a1->i16[2];
      v57 = RB::Fill::Color::convert_color((RB::Shader::Tables *)a1[1].i16[0], v12, *(uint16x4_t *)_Q0.i8);
      _D17 = v127;
      v54 = WORD2(v57);
      _Q0 = (int8x16_t)vmovl_u16(*(uint16x4_t *)&v57);
    }
    LOWORD(v56) = v12 | 0x100;
LABEL_28:
    v58 = _Q0.u16[0] | ((unint64_t)_Q0.u16[2] << 16) | (v55 << 48) | ((unint64_t)v54 << 32);
    v131 = v58;
    v132 = v56;
    _Q0.i16[0] = a2->i16[0];
    _Q0.i16[2] = a2->i16[1];
    v59 = a2->u16[2];
    v60 = a2->u16[3];
    v61 = a2[1].u16[0];
    if (v61 >= 0x100)
    {
      if (v12 == v61)
        goto LABEL_32;
      _Q0.i16[1] = a2->i16[1];
      _Q0.i16[2] = a2->i16[2];
      v62 = RB::Fill::Color::convert_color((RB::Shader::Tables *)a2[1].i16[0], v12, *(uint16x4_t *)_Q0.i8);
      _D17 = v127;
      v59 = WORD2(v62);
      _Q0 = (int8x16_t)vmovl_u16(*(uint16x4_t *)&v62);
    }
    LOWORD(v61) = v12 | 0x100;
LABEL_32:
    v63 = _Q0.u16[0] | ((unint64_t)_Q0.u16[2] << 16) | (v60 << 48) | ((unint64_t)v59 << 32);
    v129 = v63;
    v130 = v61;
    if (v53)
    {
      v64.i64[0] = RB::Fill::Color::convert_to_oklab((RB::Fill::Color *)&v131, _Q0, _Q1, a6, a7, a8, a9);
      _D0 = (int16x4_t)RB::Fill::Color::convert_to_oklab((RB::Fill::Color *)&v129, v64, v65, v66, v67, v68, v69);
      _H2 = HIWORD(v131);
      _H6 = HIWORD(v129);
      __asm
      {
        FCVT            S0, H6
        FCVT            S1, H2
      }
      v74 = (float16x4_t)v131;
      v75 = (float16x4_t)v131;
      v75.i16[3] = HIWORD(v131);
      v76 = (float16x4_t)v129;
      v77 = (float16x4_t)v129;
      v77.i16[3] = HIWORD(v129);
      if (_S1 != *(float *)_D0.i32)
      {
        v74.i16[3] = 15360;
        v75 = vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16((float16x4_t)vdup_lane_s16((int16x4_t)v75, 3)), vcvtq_f32_f16(v74)));
        v76.i16[3] = 15360;
        v77 = vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16((float16x4_t)vdup_lane_s16((int16x4_t)v77, 3)), vcvtq_f32_f16(v76)));
      }
      _S4 = v127;
      __asm { FCVT            H0, S4 }
      _Q1 = vcvtq_f32_f16(v75);
      v80 = vcvt_f16_f32(vmulq_f32(_Q1, vcvtq_f32_f16((float16x4_t)vdup_lane_s16(_D0, 0))));
      _Q1.i32[0] = HIDWORD(v127);
      __asm { FCVT            H1, S1 }
      _Q1 = vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(v77), vcvtq_f32_f16((float16x4_t)vdup_lane_s16(*(int16x4_t *)_Q1.f32, 0)))));
      _Q0 = vaddq_f32(vcvtq_f32_f16(v80), _Q1);
      _D6 = vcvt_f16_f32(_Q0);
      if (!_ZF)
      {
        _H0 = _D6.i16[3];
        __asm { FCVT            S0, H0 }
        if (_Q0.f32[0] != 0.0 && _Q0.f32[0] != 1.0)
        {
          _Q0.f32[0] = 1.0 / _Q0.f32[0];
          __asm
          {
            FCVT            H0, S0
            FCVT            S1, H6
            FCVT            S2, H0
          }
          _Q1.f32[0] = _S2 * _Q1.f32[0];
          __asm { FCVT            H1, S1 }
          v87 = (float16x4_t)vdup_lane_s16(*(int16x4_t *)_Q0.f32, 0);
          v88 = vext_s8(vext_s8(*(int8x8_t *)_Q1.f32, *(int8x8_t *)_Q1.f32, 2uLL), (int8x8_t)vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(v87), vcvtq_f32_f16((float16x4_t)vext_s8((int8x8_t)_D6, (int8x8_t)v87, 2uLL)))), 6uLL);
          v88.i16[3] = _D6.i16[3];
          _D6 = (float16x4_t)v88;
        }
      }
      _Q0 = vcvtq_f32_f16(_D6);
      *(float16x4_t *)_Q0.f32 = vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(_Q0, _Q0))), _Q0));
      __asm { FCVT            S1, H0 }
      _S1 = _S1 * 4.0781;
      __asm { FCVT            H1, S1 }
      _H3 = _Q0.i16[2];
      _H4 = _Q0.i16[1];
      __asm { FCVT            S4, H4 }
      _S5 = _S4 * -3.3086;
      __asm
      {
        FCVT            H5, S5
        FCVT            S1, H1
        FCVT            S5, H5
      }
      _S1 = _S5 + _S1;
      __asm
      {
        FCVT            H1, S1
        FCVT            S3, H3
      }
      _S5 = _S3 * 0.23096;
      __asm
      {
        FCVT            H5, S5
        FCVT            S1, H1
        FCVT            S5, H5
      }
      _S1 = _S1 + _S5;
      __asm { FCVT            H1, S1 }
      _S4 = _S4 * 2.6094;
      __asm { FCVT            H4, S4 }
      _S3 = _S3 * -0.34131;
      __asm { FCVT            H3, S3 }
      v106 = vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16((float16x4_t)vext_s8(*(int8x8_t *)_Q0.f32, *(int8x8_t *)_Q0.f32, 2uLL)), (float32x4_t)xmmword_209BDA210));
      v107 = (float16x4_t)vdup_lane_s16((int16x4_t)v106, 0);
      v107.i16[0] = LOWORD(_S4);
      v106.i16[0] = LOWORD(_S3);
      _Q0.i64[0] = vmovl_u16((uint16x4_t)vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(v107), vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16((float16x4_t)vdup_lane_s16(*(int16x4_t *)_Q0.f32, 0)), (float32x4_t)xmmword_209BDA220)))))), vcvtq_f32_f16(v106)))).u64[0];
      LOBYTE(v56) = v132;
      _D6.i16[0] = LOWORD(_S1);
      *(__int32 *)((char *)_D6.i32 + 2) = vuzp1_s16(*(int16x4_t *)_Q0.f32, *(int16x4_t *)_Q0.f32).u32[0];
      if (v132 < 0x100u)
        goto LABEL_53;
    }
    else
    {
      _H0 = v55;
      v109 = (float16x4_t)v58;
      v110 = (float16x4_t)v63;
      _H6 = v60;
      __asm
      {
        FCVT            S1, H0
        FCVT            S2, H6
      }
      v113 = (float16x4_t)v58;
      v113.i16[3] = v55;
      v114 = (float16x4_t)v63;
      v114.i16[3] = v60;
      if (*(float *)_Q1.i32 != _S2)
      {
        v109.i16[3] = 15360;
        v113 = vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16((float16x4_t)vdup_lane_s16((int16x4_t)v113, 3)), vcvtq_f32_f16(v109)));
        v110.i16[3] = 15360;
        v114 = vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16((float16x4_t)vdup_lane_s16((int16x4_t)v114, 3)), vcvtq_f32_f16(v110)));
      }
      __asm { FCVT            H1, S17 }
      _Q2 = vcvtq_f32_f16(v113);
      v116 = vcvt_f16_f32(vmulq_f32(_Q2, vcvtq_f32_f16((float16x4_t)vdup_lane_s16(*(int16x4_t *)_Q1.i8, 0))));
      _Q2.i32[0] = HIDWORD(_D17);
      __asm { FCVT            H2, S2 }
      _Q1 = vcvtq_f32_f16(v116);
      _Q0 = vaddq_f32(_Q1, vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(v114), vcvtq_f32_f16((float16x4_t)vdup_lane_s16(*(int16x4_t *)_Q2.f32, 0))))));
      _D6 = vcvt_f16_f32(_Q0);
      if (!_ZF)
      {
        _H0 = _D6.i16[3];
        __asm { FCVT            S0, H0 }
        if (_Q0.f32[0] != 0.0 && _Q0.f32[0] != 1.0)
        {
          _Q0.f32[0] = 1.0 / _Q0.f32[0];
          __asm
          {
            FCVT            H0, S0
            FCVT            S1, H6
            FCVT            S2, H0
          }
          _Q1.f32[0] = _S2 * _Q1.f32[0];
          __asm { FCVT            H1, S1 }
          v122 = (float16x4_t)vdup_lane_s16(*(int16x4_t *)_Q0.f32, 0);
          v123 = vext_s8(vext_s8(*(int8x8_t *)_Q1.f32, *(int8x8_t *)_Q1.f32, 2uLL), (int8x8_t)vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(v122), vcvtq_f32_f16((float16x4_t)vext_s8((int8x8_t)_D6, (int8x8_t)v122, 2uLL)))), 6uLL);
          v123.i16[3] = _D6.i16[3];
          _D6 = (float16x4_t)v123;
        }
      }
    }
    v124 = a1[1].u8[0];
    if (v124 != v56)
    {
      v128 = _D6.i16[3];
      *(double *)&v125 = RB::Fill::Color::convert_color((RB::Shader::Tables *)v56, v124, (uint16x4_t)_D6);
      v125.i16[3] = v128;
      _D6 = v125;
    }
LABEL_53:
    v126.i64[0] = 0xC7000000C7000000;
    v126.i64[1] = 0xC7000000C7000000;
    v52 = vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(vcvtq_f32_f16(*a1), v126))), (int8x8_t)_D6, (int8x8_t)*a1);
LABEL_54:
    *a1 = (float16x4_t)v52;
    return;
  }
  _H0 = a1->i16[3];
  __asm { FCVT            S0, H0 }
  if (_S0 != -32768.0)
  {
    __asm
    {
      FCVT            H1, S17
      FCVT            S1, H1
    }
    _S0 = _S0 * _S1;
    __asm { FCVT            H0, S0 }
    LOWORD(_S1) = a2->i16[3];
    _S2 = HIDWORD(_D17);
    __asm
    {
      FCVT            H2, S2
      FCVT            S2, H2
      FCVT            S1, H1
    }
    _S1 = _S1 * _S2;
    __asm
    {
      FCVT            H1, S1
      FCVT            S0, H0
      FCVT            S1, H1
    }
    _S0 = _S1 + _S0;
    __asm { FCVT            H0, S0 }
    a1->i16[3] = LOWORD(_S0);
  }
}

void RB::Fill::Color::fill(__int16 *a1, uint64_t a2, double _D0)
{
  CGContext *v20;
  CGRect ClipBoundingBox;

  if (*(_BYTE *)(a2 + 121))
    _ZF = *((_BYTE *)a1 + 9) == 0;
  else
    _ZF = 1;
  if (!_ZF && *(unsigned __int8 *)(a2 + 120) != *((unsigned __int8 *)a1 + 8))
    goto LABEL_10;
  _H0 = *(_WORD *)(a2 + 112);
  _H1 = *a1;
  __asm
  {
    FCVT            S1, H1
    FCVT            S0, H0
  }
  if (*(float *)&_D0 != _S1)
    goto LABEL_10;
  _H0 = *(_WORD *)(a2 + 114);
  _H1 = a1[1];
  __asm
  {
    FCVT            S1, H1
    FCVT            S0, H0
  }
  if (*(float *)&_D0 != _S1)
    goto LABEL_10;
  _H0 = *(_WORD *)(a2 + 116);
  _H1 = a1[2];
  __asm
  {
    FCVT            S1, H1
    FCVT            S0, H0
  }
  if (*(float *)&_D0 != _S1)
    goto LABEL_10;
  _H0 = *(_WORD *)(a2 + 118);
  _H1 = a1[3];
  __asm
  {
    FCVT            S1, H1
    FCVT            S0, H0
  }
  if (*(float *)&_D0 != _S1)
LABEL_10:
    RB::CGContext::set_fill_color_slow((RB::CGContext *)a2, (const RB::Fill::Color *)a1, *(uint16x4_t *)&_D0);
  v20 = *(CGContext **)a2;
  ClipBoundingBox = CGContextGetClipBoundingBox(v20);
  CGContextFillRect(v20, ClipBoundingBox);
}

uint64_t RB::Fill::Color::matches(RB::Fill::Color *this, const RB::DisplayList::Predicate *a2, uint16x4_t a3)
{
  return RB::DisplayList::Predicate::matches_color(a2, this, a3);
}

void RB::Fill::Color::apply_transform(float16x4_t *this, const RB::DisplayList::Transform *a2, RB::Heap *a3, uint32x4_t a4)
{
  RB::DisplayList::Transform::apply_to_color(a2, this, a4);
}

_QWORD *RB::Fill::Color::encode(RB::Fill::Color *this, RB::Encoder *a2)
{
  _QWORD *result;
  int v5;

  RB::ProtobufEncoder::color_field(a2, 1, *(double *)this);
  result = (_QWORD *)rb_color_space(*((_WORD *)this + 4));
  if ((_DWORD)result != 1)
  {
    v5 = (int)result;
    RB::ProtobufEncoder::encode_varint(a2, 0x10uLL);
    return RB::ProtobufEncoder::encode_varint(a2, v5);
  }
  return result;
}

unint64_t RB::Fill::Color::decode(uint64_t a1, RB::ProtobufDecoder *this)
{
  unint64_t result;
  unint64_t v5;
  unsigned int v6;

  *(_WORD *)(a1 + 8) = 257;
  result = RB::ProtobufDecoder::next_field(this);
  if (result)
  {
    v5 = result;
    do
    {
      if ((v5 >> 3) == 2)
      {
        v6 = RB::ProtobufDecoder::uint_field(this, v5);
        *(_WORD *)(a1 + 8) = rb_color_space(v6);
      }
      else if ((v5 >> 3) == 1)
      {
        *(double *)a1 = RB::ProtobufDecoder::color_field((unint64_t *)this, v5);
      }
      else
      {
        RB::ProtobufDecoder::skip_field(this, v5);
      }
      result = RB::ProtobufDecoder::next_field(this);
      v5 = result;
    }
    while (result);
  }
  return result;
}

_QWORD *RB::Fill::Color::attributes(float16x4_t *this, RB::XML::Element *a2)
{
  _BYTE v4[32];

  RB::XML::Value::Color::Color((RB::XML::Value::Color *)v4, this);
  return RB::XML::Element::set<RB::XML::Value::Color>(a2, (uint64_t)"color", (uint64_t)v4);
}

void RB::Fill::Color::print(RB::Fill::Color *this, std::string *a2)
{
  RB::SexpString::push(a2, "color");
  _H0 = *(_WORD *)this;
  __asm { FCVT            D0, H0 }
  _H1 = *((_WORD *)this + 1);
  __asm { FCVT            D1, H1 }
  _H2 = *((_WORD *)this + 2);
  __asm { FCVT            D2, H2 }
  _H3 = *((_WORD *)this + 3);
  __asm { FCVT            D3, H3 }
  RB::SexpString::printf(a2, 0, "[%g %g %g %g]", _D0, _D1, _D2, _D3);
  RB::SexpString::pop(a2);
}

uint64_t RB::Path::Dilator::Dilator(uint64_t result, uint64_t a2, __n128 a3)
{
  *(_QWORD *)result = off_24C222C80;
  *(_QWORD *)(result + 8) = a2;
  *(__n128 *)(result + 16) = a3;
  *(_OWORD *)(result + 32) = 0u;
  *(_OWORD *)(result + 48) = 0u;
  *(_QWORD *)(result + 64) = 0;
  *(_BYTE *)(result + 72) = 1;
  return result;
}

uint64_t RB::Path::Dilator::closepath(uint64_t this)
{
  uint64_t v1;
  __n128 v2;
  int8x16_t v3;

  if (!*(_BYTE *)(this + 72))
  {
    v1 = this;
    v2 = *(__n128 *)(this + 48);
    v3 = (int8x16_t)vceqq_f64((float64x2_t)v2, *(float64x2_t *)(this + 32));
    if ((vornq_s8((int8x16_t)vdupq_laneq_s64((int64x2_t)vmvnq_s8(v3), 1), v3).u64[0] & 0x8000000000000000) != 0)
      v2 = RB::Path::Dilator::lineto(this, (float64x2_t)v2);
    this = (*(uint64_t (**)(_QWORD, __n128))(**(_QWORD **)(v1 + 8) + 8))(*(_QWORD *)(v1 + 8), v2);
    *(_BYTE *)(v1 + 72) = 1;
  }
  return this;
}

__n128 RB::Path::Dilator::lineto(uint64_t a1, float64x2_t a2)
{
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  BOOL v6;
  double v7;
  float64x2_t v8;
  __n128 v9;
  uint64_t v10;
  __n128 result;
  float64x2_t v12;

  v3 = *(float64x2_t *)(a1 + 32);
  v4 = vsubq_f64(a2, v3);
  if (v4.f64[1] >= 0.0)
  {
    v5.f64[0] = 0.0;
    if (v4.f64[1] > 0.0)
      v5.f64[0] = *(float64_t *)(a1 + 16);
  }
  else
  {
    v5.f64[0] = -*(double *)(a1 + 16);
  }
  v6 = v4.f64[0] <= 0.0;
  if (v4.f64[0] >= 0.0)
  {
    v7 = 0.0;
    if (!v6)
      v7 = -*(double *)(a1 + 24);
  }
  else
  {
    v7 = *(double *)(a1 + 24);
  }
  v5.f64[1] = v7;
  v8 = *(float64x2_t *)(a1 + 16);
  v8.f64[0] = *(float64_t *)(a1 + 64);
  v12 = vaddq_f64(v8, v5);
  v9 = (__n128)vaddq_f64(v12, v3);
  v10 = **(_QWORD **)(a1 + 8);
  if (*(_BYTE *)(a1 + 72))
  {
    (*(void (**)(__n128))(v10 + 16))(v9);
    *(_BYTE *)(a1 + 72) = 0;
  }
  else
  {
    (*(void (**)(__n128))(v10 + 24))(v9);
  }
  (*(void (**)(_QWORD, __n128))(**(_QWORD **)(a1 + 8) + 24))(*(_QWORD *)(a1 + 8), (__n128)vaddq_f64(v12, a2));
  result = (__n128)a2;
  *(float64x2_t *)(a1 + 32) = a2;
  return result;
}

__n128 *RB::Path::Dilator::moveto(__n128 *this, __n128 a2)
{
  __n128 *v2;
  __n128 v3;

  v2 = this;
  if (!this[4].n128_u8[8])
  {
    v3 = a2;
    this = (__n128 *)RB::Path::Dilator::closepath((uint64_t)this);
    a2 = v3;
  }
  v2[2] = a2;
  v2[3] = a2;
  return this;
}

__n128 RB::Path::Dilator::quadto_monotonic_xy(uint64_t a1, float64x2_t a2, float64x2_t a3)
{
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  BOOL v7;
  double v8;
  float64x2_t v9;
  __n128 v10;
  uint64_t v11;
  __n128 result;
  float64x2_t v13;

  v4 = *(float64x2_t *)(a1 + 32);
  v5 = vsubq_f64(a3, v4);
  if (v5.f64[1] >= 0.0)
  {
    v6.f64[0] = 0.0;
    if (v5.f64[1] > 0.0)
      v6.f64[0] = *(float64_t *)(a1 + 16);
  }
  else
  {
    v6.f64[0] = -*(double *)(a1 + 16);
  }
  v7 = v5.f64[0] <= 0.0;
  if (v5.f64[0] >= 0.0)
  {
    v8 = 0.0;
    if (!v7)
      v8 = -*(double *)(a1 + 24);
  }
  else
  {
    v8 = *(double *)(a1 + 24);
  }
  v6.f64[1] = v8;
  v9 = *(float64x2_t *)(a1 + 16);
  v9.f64[0] = *(float64_t *)(a1 + 64);
  v13 = vaddq_f64(v9, v6);
  v10 = (__n128)vaddq_f64(v13, v4);
  v11 = **(_QWORD **)(a1 + 8);
  if (*(_BYTE *)(a1 + 72))
  {
    (*(void (**)(__n128))(v11 + 16))(v10);
    *(_BYTE *)(a1 + 72) = 0;
  }
  else
  {
    (*(void (**)(__n128))(v11 + 24))(v10);
  }
  (*(void (**)(_QWORD, __n128, __n128))(**(_QWORD **)(a1 + 8) + 32))(*(_QWORD *)(a1 + 8), (__n128)vaddq_f64(v13, a2), (__n128)vaddq_f64(v13, a3));
  result = (__n128)a3;
  *(float64x2_t *)(a1 + 32) = a3;
  return result;
}

double RB::Path::Dilator::quadto_monotonic_x(uint64_t a1, float64x2_t a2, float64x2_t a3)
{
  float64x2_t v3;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  double result;
  float64x2_t v11;
  float64x2_t v12;

  v3 = a3;
  v6 = *(float64x2_t *)(a1 + 32);
  v7 = vsubq_f64(v6, a3);
  if (v7.f64[1] != 0.0)
  {
    v8 = vdivq_f64(vsubq_f64(v6, a2), v7);
    if (v8.f64[1] >= 0.0001 && v8.f64[1] <= 0.9999)
    {
      v9 = vmlaq_laneq_f64(v6, vsubq_f64(a2, v6), v8, 1);
      v11 = vmlaq_laneq_f64(a2, vsubq_f64(v3, a2), v8, 1);
      v12 = v3;
      RB::Path::Dilator::quadto_monotonic_xy(a1, v9, vmlaq_laneq_f64(v9, vsubq_f64(v11, v9), v8, 1));
      a2 = v11;
      v3 = v12;
    }
  }
  *(_QWORD *)&result = RB::Path::Dilator::quadto_monotonic_xy(a1, a2, v3).n128_u64[0];
  return result;
}

double RB::Path::Dilator::quadto(uint64_t a1, float64x2_t a2, float64x2_t a3)
{
  float64x2_t v5;
  float64x2_t v6;
  double v7;
  float64x2_t v8;
  float64x2_t v10;
  float64x2_t v11;

  v5 = *(float64x2_t *)(a1 + 32);
  v6 = vsubq_f64(v5, a3);
  if (v6.f64[0] != 0.0)
  {
    v7 = vdivq_f64(vsubq_f64(v5, a2), v6).f64[0];
    if (v7 >= 0.0001 && v7 <= 0.9999)
    {
      v8 = vmlaq_n_f64(v5, vsubq_f64(a2, v5), v7);
      v10 = vmlaq_n_f64(a2, vsubq_f64(a3, a2), v7);
      v11 = a3;
      RB::Path::Dilator::quadto_monotonic_x(a1, v8, vmlaq_n_f64(v8, vsubq_f64(v10, v8), v7));
      a2 = v10;
      a3 = v11;
    }
  }
  return RB::Path::Dilator::quadto_monotonic_x(a1, a2, a3);
}

__n128 RB::Path::Dilator::cubeto_monotonic_xy(uint64_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  BOOL v8;
  double v9;
  float64x2_t v10;
  __n128 v11;
  uint64_t v12;
  __n128 result;
  float64x2_t v14;

  v5 = *(float64x2_t *)(a1 + 32);
  v6 = vsubq_f64(a4, v5);
  if (v6.f64[1] >= 0.0)
  {
    v7.f64[0] = 0.0;
    if (v6.f64[1] > 0.0)
      v7.f64[0] = *(float64_t *)(a1 + 16);
  }
  else
  {
    v7.f64[0] = -*(double *)(a1 + 16);
  }
  v8 = v6.f64[0] <= 0.0;
  if (v6.f64[0] >= 0.0)
  {
    v9 = 0.0;
    if (!v8)
      v9 = -*(double *)(a1 + 24);
  }
  else
  {
    v9 = *(double *)(a1 + 24);
  }
  v7.f64[1] = v9;
  v10 = *(float64x2_t *)(a1 + 16);
  v10.f64[0] = *(float64_t *)(a1 + 64);
  v14 = vaddq_f64(v10, v7);
  v11 = (__n128)vaddq_f64(v14, v5);
  v12 = **(_QWORD **)(a1 + 8);
  if (*(_BYTE *)(a1 + 72))
  {
    (*(void (**)(__n128))(v12 + 16))(v11);
    *(_BYTE *)(a1 + 72) = 0;
  }
  else
  {
    (*(void (**)(__n128))(v12 + 24))(v11);
  }
  (*(void (**)(_QWORD, __n128, __n128, __n128))(**(_QWORD **)(a1 + 8) + 40))(*(_QWORD *)(a1 + 8), (__n128)vaddq_f64(v14, a2), (__n128)vaddq_f64(v14, a3), (__n128)vaddq_f64(v14, a4));
  result = (__n128)a4;
  *(float64x2_t *)(a1 + 32) = a4;
  return result;
}

double RB::Path::Dilator::cubeto_monotonic_x(uint64_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  float64x2_t v4;
  float64x2_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  double result;
  double v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  double v30;
  float64x2_t v32;
  float64x2_t v33;

  v4 = a3;
  v7 = *(float64x2_t *)(a1 + 32);
  v8 = *(double *)(a1 + 40);
  a3.f64[0] = COERCE_DOUBLE(*(_QWORD *)&vsubq_f64(a4, v7).f64[1]) + (a2.f64[1] - a3.f64[1]) * 3.0;
  v9 = a3.f64[1] - (a2.f64[1] + a2.f64[1]) + v8 + a3.f64[1] - (a2.f64[1] + a2.f64[1]) + v8;
  v10 = a2.f64[1] - v8;
  v11 = a3.f64[0] * (-4.0 * (a2.f64[1] - v8)) + v9 * v9;
  if (v11 < 0.0)
    goto LABEL_25;
  v12 = sqrt(v11);
  if (v9 < 0.0)
    v12 = -v12;
  v13 = v12 + v9;
  v14 = v13 * -0.5;
  v15 = v13 * -0.5 / a3.f64[0];
  if (a3.f64[0] == 0.0)
    v15 = -1.0;
  v16 = v10 * -2.0 / v13;
  if (v14 == 0.0)
    v16 = -1.0;
  v17 = v16 >= v15 ? v15 : v16;
  v18 = v15 >= v16 ? v15 : v16;
  v19 = v17 >= 0.0001 ? v17 : v18;
  if (v19 < 0.0001 || v19 > 0.9999)
  {
LABEL_25:
    *(_QWORD *)&result = RB::Path::Dilator::cubeto_monotonic_xy(a1, a2, v4, a4).n128_u64[0];
  }
  else
  {
    if (v17 >= 0.0001)
      v20 = v18;
    else
      v20 = 2.0;
    v21 = vmlaq_n_f64(v7, vsubq_f64(a2, v7), v19);
    v22 = vmlaq_n_f64(a2, vsubq_f64(v4, a2), v19);
    v23 = vmlaq_n_f64(v21, vsubq_f64(v22, v21), v19);
    v33 = vmlaq_n_f64(v4, vsubq_f64(a4, v4), v19);
    v32 = vmlaq_n_f64(v22, vsubq_f64(v33, v22), v19);
    v29 = vmlaq_n_f64(v23, vsubq_f64(v32, v23), v19);
    v30 = v19;
    RB::Path::Dilator::cubeto_monotonic_xy(a1, v21, v23, v29);
    if (1.0 - v20 >= 0.0001)
    {
      v25 = (v20 - v30) / (1.0 - v30);
      v26 = vmlaq_n_f64(v29, vsubq_f64(v32, v29), v25);
      v27 = vmlaq_n_f64(v32, vsubq_f64(v33, v32), v25);
      v28 = vmlaq_n_f64(v26, vsubq_f64(v27, v26), v25);
      v33 = vmlaq_n_f64(v33, vsubq_f64(a4, v33), v25);
      v32 = vmlaq_n_f64(v27, vsubq_f64(v33, v27), v25);
      RB::Path::Dilator::cubeto_monotonic_xy(a1, v26, v28, vmlaq_n_f64(v28, vsubq_f64(v32, v28), v25));
    }
    *(_QWORD *)&result = RB::Path::Dilator::cubeto_monotonic_xy(a1, v32, v33, a4).n128_u64[0];
  }
  return result;
}

double RB::Path::Dilator::cubeto(uint64_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  float64x2_t v7;
  double v8;
  double v9;
  float64x2_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  double v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  double v29;
  float64x2_t v31;
  float64x2_t v32;

  v7 = *(float64x2_t *)(a1 + 32);
  v8 = vmlad_n_f64(vsubq_f64(a4, v7).f64[0], 3.0, vsubq_f64(a2, a3).f64[0]);
  v9 = a3.f64[0] - (a2.f64[0] + a2.f64[0]) + v7.f64[0] + a3.f64[0] - (a2.f64[0] + a2.f64[0]) + v7.f64[0];
  v10 = vsubq_f64(a2, v7);
  v11 = v8 * (-4.0 * v10.f64[0]) + v9 * v9;
  if (v11 < 0.0)
    return RB::Path::Dilator::cubeto_monotonic_x(a1, a2, a3, a4);
  v12 = sqrt(v11);
  if (v9 < 0.0)
    v12 = -v12;
  v13 = v12 + v9;
  v14 = v13 * -0.5;
  v15 = v13 * -0.5 / v8;
  if (v8 == 0.0)
    v15 = -1.0;
  v16 = v10.f64[0] * -2.0 / v13;
  if (v14 == 0.0)
    v16 = -1.0;
  if (v16 >= v15)
    v17 = v15;
  else
    v17 = v16;
  if (v15 >= v16)
    v16 = v15;
  v18 = v17 >= 0.0001 ? v17 : v16;
  if (v18 < 0.0001 || v18 > 0.9999)
    return RB::Path::Dilator::cubeto_monotonic_x(a1, a2, a3, a4);
  if (v17 >= 0.0001)
    v19 = v16;
  else
    v19 = 2.0;
  v20 = vmlaq_n_f64(v7, v10, v18);
  v21 = vmlaq_n_f64(a2, vsubq_f64(a3, a2), v18);
  v22 = vmlaq_n_f64(v20, vsubq_f64(v21, v20), v18);
  v32 = vmlaq_n_f64(a3, vsubq_f64(a4, a3), v18);
  v31 = vmlaq_n_f64(v21, vsubq_f64(v32, v21), v18);
  v28 = vmlaq_n_f64(v22, vsubq_f64(v31, v22), v18);
  v29 = v18;
  RB::Path::Dilator::cubeto_monotonic_x(a1, v20, v22, v28);
  if (1.0 - v19 >= 0.0001)
  {
    v24 = (v19 - v29) / (1.0 - v29);
    v25 = vmlaq_n_f64(v28, vsubq_f64(v31, v28), v24);
    v26 = vmlaq_n_f64(v31, vsubq_f64(v32, v31), v24);
    v27 = vmlaq_n_f64(v25, vsubq_f64(v26, v25), v24);
    v32 = vmlaq_n_f64(v32, vsubq_f64(a4, v32), v24);
    v31 = vmlaq_n_f64(v26, vsubq_f64(v32, v26), v24);
    RB::Path::Dilator::cubeto_monotonic_x(a1, v25, v27, vmlaq_n_f64(v27, vsubq_f64(v31, v27), v24));
  }
  return RB::Path::Dilator::cubeto_monotonic_x(a1, v31, v32, a4);
}

void RB::CustomEffect::transform_border(float32x2_t *a1, float64x2_t *a2)
{
  float32x2_t v2;
  uint32x2_t v3;
  float64x2_t v5;
  float64x2_t v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  float v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  int32x4_t v17;
  float32x2_t v18;
  float64x2_t v19[2];
  uint64_t v20;
  uint64_t v21;

  v2 = *a1;
  v3 = (uint32x2_t)vceqz_f32(*a1);
  if ((vpmin_u32(v3, v3).u32[0] & 0x80000000) == 0)
  {
    v5 = *a2;
    v6 = a2[1];
    v7 = a2[1].f64[1];
    v8 = a2->f64[1];
    if (a2->f64[0] == v7 && v8 == 0.0 && v6.f64[0] == 0.0
      || v7 == 0.0 && (v5.f64[0] == 0.0 ? (v9 = v8 == v6.f64[0]) : (v9 = 0), v9))
    {
      v10 = fabs(v5.f64[0]);
      v11 = fabs(v8);
      if (v8 == 0.0)
        v12 = v10;
      else
        v12 = v11;
      v13 = v12;
      v14 = vmul_n_f32(v2, v13);
    }
    else
    {
      v19[0] = *a2;
      v19[1] = v6;
      v20 = 0;
      v21 = 0;
      v15 = RB::operator*(v19, vneg_f32(v2), vadd_f32(v2, v2));
      *(int32x2_t *)v17.i8 = vcltz_f32(v16);
      v18 = (float32x2_t)vbsl_s8((int8x8_t)*(_OWORD *)&vcltzq_s32(v17), (int8x8_t)vadd_f32(v16, v15), (int8x8_t)v15);
      v14 = vmaxnm_f32(vneg_f32(v18), vadd_f32(v18, vabs_f32(v16)));
    }
    *a1 = v14;
  }
}

RB::CustomEffect *RB::CustomEffect::CustomEffect(RB::DisplayList::Layer **this, RB::DisplayList::Layer **a2, RB::DisplayList::Contents *a3)
{
  RB::CustomShader::Closure *v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  RB::DisplayList::Layer *v10;
  int32x2_t v12[38];

  v12[37] = *(int32x2_t *)MEMORY[0x24BDAC8D0];
  v6 = RB::CustomShader::Closure::Closure((RB::CustomShader::Closure *)this, (const RB::CustomShader::Closure *)a2);
  *((_QWORD *)v6 + 16) = 0;
  *((_QWORD *)v6 + 17) = a2[17];
  *((_QWORD *)v6 + 18) = a2[18];
  v7 = *((_OWORD *)a2 + 10);
  v8 = *((_OWORD *)a2 + 12);
  *((_OWORD *)v6 + 11) = *((_OWORD *)a2 + 11);
  *((_OWORD *)v6 + 12) = v8;
  *((_OWORD *)v6 + 10) = v7;
  *((_OWORD *)v6 + 13) = *((_OWORD *)a2 + 13);
  *((_DWORD *)v6 + 56) = *((_DWORD *)a2 + 56);
  if (a2[16])
  {
    RB::DisplayList::Builder::Builder(v12, a3);
    v9 = RB::DisplayList::Layer::copy(a2[16], (RB::DisplayList::Builder *)v12, 0);
    v10 = this[16];
    this[16] = (RB::DisplayList::Layer *)v9;
    if (v10)
      RB::DisplayList::Layer::~Layer(v10);
    RB::DisplayList::Builder::~Builder((RB::DisplayList::Builder *)v12);
  }
  return (RB::CustomEffect *)this;
}

void sub_209BB953C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  RB::CustomShader::Closure *v9;
  RB::DisplayList::Layer *v11;

  RB::DisplayList::Builder::~Builder((RB::DisplayList::Builder *)&a9);
  v11 = (RB::DisplayList::Layer *)*((_QWORD *)v9 + 16);
  *((_QWORD *)v9 + 16) = 0;
  if (v11)
    RB::DisplayList::Layer::~Layer(v11);
  RB::CustomShader::Closure::~Closure(v9);
  _Unwind_Resume(a1);
}

void RB::CustomShader::Closure::~Closure(RB::CustomShader::Closure *this)
{
  const void **v2;
  const void **v3;
  const void **v4;
  unint64_t v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;

  v2 = (const void **)((char *)this + 8);
  v3 = (const void **)*((_QWORD *)this + 13);
  if (v3)
    v4 = v3;
  else
    v4 = v2;
  if (*((_QWORD *)this + 14))
  {
    v5 = 0;
    do
    {
      RB::CustomShader::Value::reset_data(v4);
      ++v5;
      v4 += 3;
    }
    while (v5 < *((_QWORD *)this + 14));
    v3 = (const void **)*((_QWORD *)this + 13);
  }
  if (v3)
    free(v3);
  v6 = *(unsigned int **)this;
  if (*(_QWORD *)this)
  {
    v7 = v6 + 2;
    do
    {
      v8 = __ldxr(v7);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, v7));
    if (!v9)
    {
      __dmb(9u);
      (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 8))(v6);
    }
  }
}

void RB::CustomEffect::apply_transform(RB::CustomEffect *this, float64x2_t *a2)
{
  float64x2_t *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v4 = a2 + 68;
  *(double *)&v5 = RB::operator*((float64x2_t *)this + 10, a2 + 68);
  *((_OWORD *)this + 10) = v5;
  *((_OWORD *)this + 11) = v6;
  *((_OWORD *)this + 12) = v7;
  RB::CustomEffect::transform_border((float32x2_t *)this + 17, v4);
  if (*((_QWORD *)this + 16))
  {
    RB::CustomEffect::transform_border((float32x2_t *)this + 18, v4);
    RB::DisplayList::Layer::apply_transform(*((RB::DisplayList::Layer **)this + 16), (const RB::DisplayList::CachedTransform *)a2);
  }
}

float32x2_t RB::CustomEffect::roi(RB::CustomEffect *this, float32x2_t *a2, double a3, double a4, double a5, int32x4_t a6)
{
  uint64_t v6;
  float32x2_t v7;
  int8x8_t v8;
  int8x8_t v9;
  float32x2_t result;

  v6 = *((_QWORD *)this + 17) & 0x7FFFFFFF7FFFFFFFLL;
  v7 = a2[1];
  v8 = (int8x8_t)vmla_f32(v7, (float32x2_t)0x4000000040000000, (float32x2_t)v6);
  *(int32x2_t *)a6.i8 = vcgt_f32((float32x2_t)vdup_n_s32(0x7F7FFFFFu), v7);
  v9 = (int8x8_t)vcltzq_s32(a6).u64[0];
  result = (float32x2_t)vbsl_s8(v9, (int8x8_t)vsub_f32(*a2, (float32x2_t)v6), (int8x8_t)*a2);
  *a2 = result;
  a2[1] = (float32x2_t)vbsl_s8(v9, v8, (int8x8_t)v7);
  return result;
}

RB::DisplayList::Layer *RB::CustomEffect::dod(RB::CustomEffect *this, float32x2_t *a2, double a3, double a4, double a5, int32x4_t a6)
{
  uint64_t v7;
  float32x2_t v8;
  int8x8_t v9;
  RB::DisplayList::Layer *result;
  float32x2_t v12;
  uint64_t v13;
  float32x2_t v14;
  int32x4_t v15;
  int32x4_t v16;

  v7 = *((_QWORD *)this + 17) & 0x7FFFFFFF7FFFFFFFLL;
  v8 = a2[1];
  *(int32x2_t *)a6.i8 = vcgt_f32((float32x2_t)vdup_n_s32(0x7F7FFFFFu), v8);
  v9 = (int8x8_t)vcltzq_s32(a6).u64[0];
  *a2 = (float32x2_t)vbsl_s8(v9, (int8x8_t)vsub_f32(*a2, (float32x2_t)v7), (int8x8_t)*a2);
  a2[1] = (float32x2_t)vbsl_s8(v9, (int8x8_t)vmla_f32(v8, (float32x2_t)0x4000000040000000, (float32x2_t)v7), (int8x8_t)v8);
  result = (RB::DisplayList::Layer *)*((_QWORD *)this + 16);
  if (result)
  {
    if ((*((_BYTE *)this + 224) & 0x10) == 0)
    {
      v12 = RB::DisplayList::Layer::bounds(result);
      v13 = *((_QWORD *)this + 18) & 0x7FFFFFFF7FFFFFFFLL;
      *(int32x2_t *)v15.i8 = vcgt_f32((float32x2_t)vdup_n_s32(0x7F7FFFFFu), v14);
      v15.i64[0] = vcltzq_s32(v15).u64[0];
      *(float32x2_t *)v16.i8 = vmla_f32(v14, (float32x2_t)0x4000000040000000, (float32x2_t)v13);
      return (RB::DisplayList::Layer *)RB::Rect::Union(a2, (float32x2_t)vbsl_s8(*(int8x8_t *)v15.i8, (int8x8_t)vsub_f32(v12, (float32x2_t)v13), (int8x8_t)v12), (float32x2_t)vbsl_s8(*(int8x8_t *)v15.i8, *(int8x8_t *)v16.i8, (int8x8_t)v14), *(double *)&v13, *(double *)v15.i64, 2.00000048, v16);
    }
  }
  return result;
}

RB::RenderTask *RB::CustomEffect::add_tasks(uint64_t a1, MTLPixelFormat a2, __n128 *a3, double a4, double a5)
{
  RB::RenderTask *result;
  double v9;
  uint32x2_t v10;
  int32x2_t v11;
  MTLPixelFormat v12;
  int v13;
  RB::RenderTask *v14;
  double v15;
  double v16;

  v15 = a4;
  v16 = a5;
  result = *(RB::RenderTask **)(a1 + 128);
  if (result)
  {
    v9 = *(double *)(a1 + 144);
    v10 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(*(float32x2_t *)&v9));
    v11 = (int32x2_t)vpmax_u32(v10, v10);
    if (v11.i32[0] < 0)
    {
      *(float *)&a4 = -ceilf(fabsf(*((float *)&v9 + 1)));
      RB::Bounds::inset((int32x2_t *)&v15, (int)(float)-ceilf(fabsf(*(float *)&v9)), (int)*(float *)&a4, a4, a5, v9, v11);
      result = *(RB::RenderTask **)(a1 + 128);
      a4 = v15;
      a5 = v16;
    }
    RB::DisplayList::Layer::make_task((uint64_t)result, a2, a3, 2u, 0, 0, (uint64_t *)&v14, a4, a5, v9, v11);
    result = v14;
    if (v14)
    {
      *(_QWORD *)(a2 + 72) += RB::RenderTask::bytes(v14, v12);
      RB::DisplayList::LayerTask::add_task(*(_QWORD *)(a2 + 32), *(_QWORD *)(a1 + 128), 0, (uint64_t *)&v14);
      result = v14;
      if (v14)
      {
        v13 = *((_DWORD *)v14 + 2) - 1;
        *((_DWORD *)v14 + 2) = v13;
        if (!v13)
          return (RB::RenderTask *)(*(uint64_t (**)(RB::RenderTask *))(*(_QWORD *)result + 8))(result);
      }
    }
  }
  return result;
}

void sub_209BB986C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10)
{
  if (a10)
    RB::RenderFrame::alloc_buffer_region(a10);
  _Unwind_Resume(exception_object);
}

uint64_t RB::CustomEffect::splits_parent(float32x2_t *this, int32x2_t *a2, const RB::BoundsAccumulator *a3)
{
  uint64_t result;
  float32x2_t v7;
  float32x2_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int32x2_t v13;
  uint32x2_t v14;
  float32x2_t v15;
  uint32x2_t v16;
  int32x2_t v17[2];

  result = (uint64_t)this[16];
  if (result)
  {
    if ((*(_BYTE *)(result + 60) & 1) != 0)
    {
      if (!a3)
        return 1;
      v7 = RB::DisplayList::Layer::bounds((RB::DisplayList::Layer *)result);
      RB::Bounds::Bounds(v17, v7, v8);
      RB::Bounds::intersect(v17, *a2, a2[1]);
      v14 = (uint32x2_t)vcgtz_s32(v17[1]);
      v15 = (float32x2_t)vpmin_u32(v14, v14);
      if (v15.i32[0] < 0)
      {
        v15 = this[18];
        v16 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(v15));
        v9 = COERCE_DOUBLE(vpmax_u32(v16, v16));
        if ((LODWORD(v9) & 0x80000000) != 0)
        {
          *(float *)&v9 = -ceilf(fabsf(v15.f32[0]));
          v15.f32[0] = -ceilf(fabsf(v15.f32[1]));
          RB::Bounds::inset(v17, (int)*(float *)&v9, (int)v15.f32[0], *(double *)&v15, v9, v10, *(int32x2_t *)&v11);
        }
      }
      result = RB::BoundsAccumulator::intersects(a3, v17, *(double *)&v15, v9, v10, v11, v12, v13);
      if ((_DWORD)result)
        return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t RB::CustomEffect::prepare(uint64_t a1, uint64_t **a2)
{
  uint64_t result;

  RB::CustomShader::Closure::prepare(a1, a2);
  result = *(_QWORD *)(a1 + 128);
  if (result)
    return RB::DisplayList::Layer::prepare(result, (uint64_t)a2);
  return result;
}

int32x2_t *RB::CustomEffect::render(uint64_t a1, uint64_t a2, uint64_t **a3, float32x4_t *a4, uint64_t a5, int32x2_t a6, float a7, uint64_t a8, float64x2_t *a9, float32x2_t *a10, unsigned __int8 a11, __int16 a12, char a13)
{
  int32x2_t *result;
  unsigned int v22;
  uint64_t v23;
  float64_t v24;
  float64_t v25;
  int32x2_t *v26;
  int8x16_t v27;
  _BOOL4 v28;
  float64x2_t *v29;
  float64x2_t v30;
  int8x16_t *v31;
  float64x2_t v32;
  float64x2_t *v33;
  float64x2_t v34;
  int8x16_t v35;
  int8x16_t v36;
  int8x16_t v37;
  unint64_t v38;
  int8x16_t v39;
  int32x4_t v40;
  float32x2_t v41;
  int8x16_t v42;
  int8x8_t v43;
  int8x8_t v44;
  float32x4_t v45;
  uint64_t v46;
  int32x2_t v47;
  double v48;
  int32x4_t v49;
  unint64_t v50;
  int32x2_t *task;
  int32x2_t *v52;
  int32x2_t v53;
  int32x2_t *v54;
  int32x2_t v55;
  uint32x2_t v56;
  int32x2_t v57;
  float32x2_t v58;
  float32x2_t v59;
  float32x2_t v60;
  float32x2_t v61;
  float64x2_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __n128 v66;
  int32x4_t v67;
  int8x16_t v68;
  int8x16_t v69;
  float32x2_t v70;
  int8x8_t v71;
  int8x8_t v72;
  float32x2_t v73;
  float32x2_t v74;
  int8x8_t v75;
  float32x2_t v81;
  float32x2_t v82;
  float32x2_t v83;
  float32x2_t v84;
  float32x2_t v85;
  int32x2_t v86;
  uint32x2_t v87;
  int8x8_t v88;
  int8x8_t v89;
  int8x8_t v90;
  uint64_t *v91;
  int64x2_t v92;
  float64x2_t v95;
  float64x2_t v96;
  float64x2_t v97;
  unsigned int v98;
  unsigned __int32 v99;
  _BOOL4 v100;
  __int32 v101;
  __int32 v102;
  int8x16_t v103;
  int8x16_t v104;
  int8x16_t v105;
  float32x2_t v107;
  int32x2_t v108[2];
  _OWORD v109[3];
  float64x2_t v110[3];
  float32x2_t v111;
  float32x2_t v112;
  RB::Texture *v113;
  RB::Buffer *v114;
  int64x2_t v115;
  float32x4_t v116;
  float64x2_t v117[2];
  int8x16_t v118;
  float64x2_t v119;
  float64x2_t v120;
  float64x2_t v121;
  RB::Buffer *v122;
  int64x2_t v123;
  int8x16_t v124;
  __int128 v125;
  int8x16_t v126;

  result = *(int32x2_t **)a1;
  if (result)
  {
    _S8 = a7;
    if ((*(_DWORD *)(a1 + 224) & 3) == 2)
    {
      v22 = 3;
    }
    else if ((*(_DWORD *)(a1 + 224) & 3) != 0)
    {
      v22 = 0;
    }
    else if (*(_QWORD *)(a1 + 128))
    {
      v22 = 4;
    }
    else
    {
      v22 = 2;
    }
    v23 = **a3;
    *(_QWORD *)&v24 = a1 + 8;
    v25 = *(double *)(a1 + 112);
    if (*(_QWORD *)(a1 + 104))
      v24 = *(double *)(a1 + 104);
    *(float64_t *)v124.i64 = v24;
    *(float64_t *)&v124.i64[1] = v25;
    result = (int32x2_t *)RB::CustomShader::Function::function((uint64_t)result, v23, v22, &v124);
    if (result)
    {
      v26 = result;
      RB::RenderFrame::add_function(**a3, (Function *)result);
      result = (int32x2_t *)RB::RenderFrame::alloc_buffer_region((RB::RenderFrame *)**a3, (RB::Device *)(v26[10].u32[0] + 56), 4uLL, 0, &v122);
      if (v122)
      {
        v27 = *(int8x16_t *)(a1 + 176);
        v124 = *(int8x16_t *)(a1 + 160);
        v125 = (__int128)v27;
        v126 = *(int8x16_t *)(a1 + 192);
        v28 = RB::AffineTransform::invert((RB::AffineTransform *)&v124);
        v29 = v28 ? (float64x2_t *)&v124 : (float64x2_t *)(a1 + 160);
        v30 = *v29;
        v31 = v28 ? (int8x16_t *)&v125 : (int8x16_t *)(a1 + 176);
        v32 = *(float64x2_t *)v31;
        v33 = v28 ? (float64x2_t *)&v126 : (float64x2_t *)(a1 + 192);
        v34 = vmlaq_n_f64(vmlaq_n_f64(*v33, v30, (double)-a6.i32[0]), v32, (double)-a6.i32[1]);
        v119 = v30;
        v120 = v32;
        v121 = v34;
        *(double *)v35.i64 = RB::operator*(a9, &v119);
        v103 = v36;
        v104 = v35;
        v105 = v37;
        v124 = v35;
        v125 = (__int128)v36;
        v126 = v37;
        v38 = RB::AffineTransform::invert((RB::AffineTransform *)&v124) ? -1 : 0;
        v39 = (int8x16_t)vdupq_n_s64(v38);
        v40 = (int32x4_t)vbslq_s8(v39, (int8x16_t)v125, v103);
        v117[0] = (float64x2_t)vbslq_s8(v39, v124, v104);
        v117[1] = (float64x2_t)v40;
        v116 = *a4;
        v41 = vabs_f32(*(float32x2_t *)(a1 + 136));
        *(int32x2_t *)v40.i8 = vcgt_f32((float32x2_t)vdup_n_s32(0x7F7FFFFFu), *(float32x2_t *)&v116.u32[2]);
        v42 = (int8x16_t)vcltzq_s32(v40);
        v43 = (int8x8_t)vmvnq_s8(v42).u64[0];
        v44 = (int8x8_t)vmla_f32(*(float32x2_t *)&v116.u32[2], (float32x2_t)0x4000000040000000, v41);
        *(int8x8_t *)v45.f32 = vorr_s8(vand_s8((int8x8_t)vsub_f32(*(float32x2_t *)v116.f32, v41), *(int8x8_t *)v42.i8), vand_s8(*(int8x8_t *)v116.f32, v43));
        *(int8x8_t *)&v45.u32[2] = vorr_s8(vand_s8(v44, *(int8x8_t *)v42.i8), vand_s8(*(int8x8_t *)&v116.u32[2], v43));
        v118 = vbslq_s8(v39, v126, v105);
        v116 = v45;
        v46 = *((_QWORD *)v122 + 7) + v123.i64[0];
        v114 = 0;
        v115 = 0uLL;
        v113 = 0;
        result = (int32x2_t *)RB::CustomShader::Closure::marshal_args((_QWORD *)a1, (uint64_t)a3, (uint64_t)v26, (_OWORD *)(a1 + 208), v46 + 56, (uint64_t)&v114, (uint64_t *)&v113, *(double *)v118.i64, v45);
        if ((_DWORD)result)
        {
          result = (int32x2_t *)RB::CustomShader::Closure::marshal_layer_arg(a1, (uint64_t)a3, v46 + 56, v26[10].i32[1], v117, a10);
          if ((_DWORD)result)
          {
            v50 = *(_QWORD *)(a1 + 128);
            if (!v50)
            {
              v54 = 0;
LABEL_43:
              v47.i32[0] = 0;
              v86 = (int32x2_t)a3[21];
              v87 = (uint32x2_t)vceq_s32(v86, (int32x2_t)0x8000000080000000);
              v88 = (int8x8_t)vdup_lane_s32(vcgt_s32(v47, (int32x2_t)vpmin_u32(v87, v87)), 0);
              v89 = (int8x8_t)vcvt_f32_s32(v86);
              v90 = (int8x8_t)vdup_n_s32(0x7F7FFFFFu);
              RB::Rect::intersect((float32x2_t *)&v116, (float32x2_t)vbsl_s8(v88, (int8x8_t)0x100000001000000, (int8x8_t)vcvt_f32_s32((int32x2_t)a3[20])), (float32x2_t)vbsl_s8(v88, v90, v89), *(double *)&v90, *(double *)&v88, v48, v49);
              RB::Coverage::set_plane((float32x2_t *)v46, (float32x2_t *)a3, *(float32x2_t *)v116.f32, *(double *)&v116.i64[1]);
              v91 = a3[13];
              v92.i64[0] = (int)v91;
              v92.i64[1] = SHIDWORD(v91);
              __asm { FMOV            V1.2D, #0.5 }
              _Q0 = vmulq_f64(vcvtq_f64_s64(v92), _Q1);
              v95 = vmulq_n_f64(v119, _Q0.f64[0]);
              v96 = vmulq_n_f64(v120, -_Q0.f64[1]);
              v97 = vmlaq_laneq_f64(vaddq_f64(v95, v121), v120, _Q0, 1);
              *(float32x2_t *)(v46 + 28) = vcvt_f32_f64(v95);
              *(float32x2_t *)(v46 + 36) = vcvt_f32_f64(v96);
              *(float32x2_t *)(v46 + 44) = vcvt_f32_f64(v97);
              __asm { FCVT            H0, S8 }
              *(_WORD *)(v46 + 52) = LOWORD(_Q0.f64[0]);
              *((_DWORD *)a3 + 46) = RB::RenderFrame::buffer_id((RB::RenderFrame *)**a3, v122);
              *(uint64_t **)((char *)a3 + 188) = (uint64_t *)vmovn_s64(v123);
              *((_DWORD *)a3 + 55) = RB::RenderFrame::buffer_id((RB::RenderFrame *)**a3, v114);
              a3[28] = (uint64_t *)vmovn_s64(v115);
              if (v113)
                *((_DWORD *)a3 + 58) = RB::RenderFrame::texture_id((RB::RenderFrame *)**a3, (uint64_t)v113);
              v98 = *(_DWORD *)(a1 + 224);
              v99 = v26[12].u32[1];
              v100 = *((_DWORD *)a3 + 34) == 2;
              v102 = v26->i32[0];
              v101 = v26->i32[1];
              if (!a5)
                a5 = RB::Device::clear_texture(*(RB::Device **)**a3);
              if (!v54)
                v54 = (int32x2_t *)RB::Device::clear_texture(*(RB::Device **)**a3);
              *((_DWORD *)a3 + 60) = RB::RenderFrame::texture_id((RB::RenderFrame *)**a3, a5);
              *((_BYTE *)a3 + 244) = 2;
              *((_DWORD *)a3 + 62) = RB::RenderFrame::texture_id((RB::RenderFrame *)**a3, (uint64_t)v54);
              *((_BYTE *)a3 + 252) = 2;
              RB::Bounds::Bounds(v108, *(float32x2_t *)v116.f32, *(float32x2_t *)&v116.u32[2]);
              result = RB::RenderPass::draw_indexed_primitives((int32x2_t *)a3, (const char *)((((a13 & 0x3F) << 6) | (((v99 >> 30) & 2 | (v98 >> 2) & 1) << 12)) ^ 0x2025 | ((unint64_t)(a11 | (2 * v100) | (v102 << 6) | (8 * v101)) << 32)), 4, *(_QWORD *)**a3 + 80, 0, 1uLL, v108[0], v108[1]);
              *((_DWORD *)a3 + 62) = 0;
              *((_BYTE *)a3 + 252) = 0;
              *((_DWORD *)a3 + 60) = 0;
              *((_BYTE *)a3 + 244) = 0;
              *(uint64_t **)((char *)a3 + 220) = 0;
              *(uint64_t **)((char *)a3 + 228) = 0;
              *((_BYTE *)a3 + 236) = 0;
              return result;
            }
            result = *(int32x2_t **)(a2 + 32);
            if (result)
            {
              v124 = (int8x16_t)xmmword_209BD5290;
              v125 = xmmword_209BD52A0;
              v126 = 0uLL;
              v111 = 0;
              v112 = 0;
              task = (int32x2_t *)RB::DisplayList::LayerTask::find_task((RB::DisplayList::LayerTask *)result, v50, 0);
              if (!task)
                goto LABEL_34;
              v52 = task;
              v53 = task[11];
              if (v53)
              {
                v54 = *(int32x2_t **)(*(_QWORD *)&v53 + 16);
                v55 = task[15];
                v56 = (uint32x2_t)vceq_s32(v55, (int32x2_t)0x8000000080000000);
                if ((vpmin_u32(v56, v56).u32[0] & 0x80000000) != 0)
                {
                  v59 = (float32x2_t)vdup_n_s32(0x7F7FFFFFu);
                  v58 = (float32x2_t)0x100000001000000;
                  v60 = (float32x2_t)0x100000001000000;
                }
                else
                {
                  v57 = task[14];
                  v58 = vcvt_f32_s32(vadd_s32(v57, a6));
                  v59 = vcvt_f32_s32(v55);
                  v60 = vcvt_f32_s32(vsub_s32(vadd_s32(task[8], v57), task[13]));
                }
                v111 = v60;
                v112 = v59;
                v107 = vcvt_f32_s32(v54[8]);
                v61 = vdiv_f32(vmul_f32(v59, v107), v59);
                v62.f64[0] = 0.0;
                v62.f64[1] = v61.f32[1];
                v110[0] = (float64x2_t)COERCE_UNSIGNED_INT64(v61.f32[0]);
                v110[1] = v62;
                v110[2] = vcvtq_f64_f32(vsub_f32(v58, vdiv_f32(vmul_f32(v60, v59), v59)));
                *(double *)&v63 = RB::operator*(v110, &v119);
                v109[0] = v63;
                v109[1] = v64;
                v109[2] = v65;
                v66 = RB::AffineTransform::inverse((RB::AffineTransform *)v109);
                v124 = (int8x16_t)v66;
                v125 = (__int128)v68;
                v126 = v69;
                if ((*(_BYTE *)(a1 + 224) & 0x10) == 0)
                {
                  v70 = vabs_f32(*(float32x2_t *)(a1 + 144));
                  v66.n128_u64[0] = (unint64_t)vcgt_f32((float32x2_t)vdup_n_s32(0x7F7FFFFFu), v59);
                  v71 = (int8x8_t)vcltzq_s32((int32x4_t)v66).u64[0];
                  v72 = (int8x8_t)vmla_f32(v59, (float32x2_t)0x4000000040000000, v70);
                  RB::Rect::Union((float32x2_t *)&v116, (float32x2_t)vbsl_s8(v71, (int8x8_t)vsub_f32(v58, v70), (int8x8_t)v58), (float32x2_t)vbsl_s8(v71, v72, (int8x8_t)v59), 2.00000048, *(double *)&v71, *(double *)&v72, v67);
                }
                if ((v52[16].i8[0] & 1) != 0)
                {
                  v66.n128_u64[0] = (unint64_t)vcgt_f32((float32x2_t)vdup_n_s32(0x7F7FFFFFu), v112);
                  v75 = (int8x8_t)vcltzq_s32((int32x4_t)v66).u64[0];
                  v73 = (float32x2_t)vbsl_s8(v75, (int8x8_t)vadd_f32(v111, (float32x2_t)0xBF000000BF000000), (int8x8_t)v111);
                  __asm { FMOV            V2.2S, #1.0 }
                  v74 = (float32x2_t)vbsl_s8(v75, (int8x8_t)vadd_f32(v112, _D2), (int8x8_t)v112);
                }
                else
                {
                  v66.n128_u32[0] = 0.5;
                  RB::Rect::inset(&v111, (float32x2_t)v66.n128_u64[0], 0.5);
                  v73 = v111;
                  v74 = v112;
                }
                v81 = vrecpe_f32((float32x2_t)v107.u32[0]);
                v82 = vmul_f32(vrecps_f32((float32x2_t)v107.u32[0], v81), v81);
                v83 = vrecpe_f32((float32x2_t)v107.u32[1]);
                v84 = vmul_f32(vrecps_f32((float32x2_t)v107.u32[1], v83), v83);
                v85 = (float32x2_t)vzip1_s32((int32x2_t)vmul_f32(v82, vrecps_f32((float32x2_t)v107.u32[0], v82)), (int32x2_t)vmul_f32(v84, vrecps_f32((float32x2_t)v107.u32[1], v84)));
                v111 = vmul_f32(v85, v73);
                v112 = vmul_f32(v74, v85);
              }
              else
              {
LABEL_34:
                v54 = 0;
              }
              result = (int32x2_t *)RB::CustomShader::Closure::marshal_layer_arg(a1, (uint64_t)a3, v46 + 56, v26[11].i32[0], (float64x2_t *)&v124, &v111);
              if ((_DWORD)result)
                goto LABEL_43;
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_209BBA064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  *(_DWORD *)(a20 + 240) = 0;
  *(_BYTE *)(a20 + 244) = 0;
  _Unwind_Resume(a1);
}

uint64_t *RB::CustomEffect::prepare_encode(uint64_t **this, RB::Encoder *a2)
{
  uint64_t *result;

  RB::CustomShader::Closure::prepare_encode((RB::CustomShader::Closure *)this, a2);
  result = this[16];
  if (result)
    return RB::DisplayList::Layer::prepare_encode(result, a2);
  return result;
}

_QWORD *RB::CustomEffect::encode(RB::CustomEffect *this, RB::Encoder *a2)
{
  _QWORD *result;
  int64x2_t v5;
  int v6;
  uint32x2_t v7;
  _QWORD **v8;

  RB::ProtobufEncoder::encode_varint(a2, 0xAuLL);
  RB::ProtobufEncoder::begin_length_delimited(a2);
  RB::CustomShader::Closure::encode((RB::CustomShader::Function **)this, a2);
  RB::ProtobufEncoder::end_length_delimited(a2);
  result = RB::ProtobufEncoder::float2_field(a2, 2, *((double *)this + 17));
  v5 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(*((float64x2_t *)this + 11), (float64x2_t)xmmword_209BD52A0), (int8x16_t)vceqq_f64(*((float64x2_t *)this + 10), (float64x2_t)xmmword_209BD5290)), (int8x16_t)vceqzq_f64(*((float64x2_t *)this + 12)));
  if ((vandq_s8((int8x16_t)vdupq_laneq_s64(v5, 1), (int8x16_t)v5).u64[0] & 0x8000000000000000) == 0)
  {
    RB::ProtobufEncoder::encode_varint(a2, 0x1AuLL);
    RB::ProtobufEncoder::begin_length_delimited(a2);
    RB::AffineTransform::encode((double *)this + 20, a2);
    result = RB::ProtobufEncoder::end_length_delimited(a2);
  }
  v6 = *((_DWORD *)this + 56);
  if ((v6 & 3) == 2)
  {
    RB::ProtobufEncoder::encode_varint(a2, 0x20uLL);
    result = RB::ProtobufEncoder::encode_varint(a2, 1uLL);
    v6 = *((_DWORD *)this + 56);
  }
  if ((v6 & 4) != 0)
  {
    RB::ProtobufEncoder::encode_varint(a2, 0x28uLL);
    result = RB::ProtobufEncoder::encode_varint(a2, 1uLL);
  }
  v7 = (uint32x2_t)vcgtz_f32(*(float32x2_t *)((char *)this + 216));
  if ((vpmin_u32(v7, v7).u32[0] & 0x80000000) != 0)
    result = RB::ProtobufEncoder::float4_field(a2, 6, *((float32x4_t *)this + 13));
  if ((*((_BYTE *)this + 224) & 8) != 0)
  {
    RB::ProtobufEncoder::encode_varint(a2, 0x38uLL);
    result = RB::ProtobufEncoder::encode_varint(a2, 1uLL);
  }
  v8 = (_QWORD **)*((_QWORD *)this + 16);
  if (v8)
  {
    RB::ProtobufEncoder::encode_varint(a2, 0x42uLL);
    RB::ProtobufEncoder::begin_length_delimited(a2);
    RB::DisplayList::Layer::encode(v8, a2);
    RB::ProtobufEncoder::end_length_delimited(a2);
    return RB::ProtobufEncoder::float2_field(a2, 9, *((double *)this + 18));
  }
  return result;
}

unint64_t RB::CustomEffect::decode(RB::DisplayList::Layer **this, size_t **a2)
{
  unint64_t result;
  __n128 v5;
  unint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  RB::DisplayList::Layer *v10;
  RB::DisplayList::Layer *v11;
  uint64_t v12;

  result = RB::ProtobufDecoder::next_field((RB::ProtobufDecoder *)a2);
  if (result)
  {
    v6 = result;
    do
    {
      switch((v6 >> 3))
      {
        case 1u:
          if ((v6 & 7) != 2)
            goto LABEL_29;
          RB::ProtobufDecoder::begin_message((RB::ProtobufDecoder *)a2);
          RB::CustomShader::Closure::decode((RB::CustomShader::Closure *)this, (RB::Decoder *)a2);
          goto LABEL_25;
        case 2u:
          this[17] = (RB::DisplayList::Layer *)RB::ProtobufDecoder::float2_field((RB::ProtobufDecoder *)a2, v6, v5).n128_u64[0];
          break;
        case 3u:
          if ((v6 & 7) != 2)
            goto LABEL_29;
          RB::ProtobufDecoder::begin_message((RB::ProtobufDecoder *)a2);
          RB::AffineTransform::decode((RB::AffineTransform *)(this + 20), (RB::ProtobufDecoder *)a2);
          goto LABEL_25;
        case 4u:
          *((_DWORD *)this + 56) &= 0xFFFFFFFC;
          if (!RB::ProtobufDecoder::BOOL_field((RB::ProtobufDecoder *)a2, v6))
            break;
          v7 = *((_DWORD *)this + 56) | 2;
          goto LABEL_20;
        case 5u:
          if (RB::ProtobufDecoder::BOOL_field((RB::ProtobufDecoder *)a2, v6))
            v8 = 4;
          else
            v8 = 0;
          goto LABEL_19;
        case 6u:
          *((__n128 *)this + 13) = RB::ProtobufDecoder::float4_field((RB::ProtobufDecoder *)a2, v6);
          break;
        case 7u:
          if (RB::ProtobufDecoder::BOOL_field((RB::ProtobufDecoder *)a2, v6))
            v8 = 8;
          else
            v8 = 0;
LABEL_19:
          v7 = *((_DWORD *)this + 56) | v8;
LABEL_20:
          *((_DWORD *)this + 56) = v7;
          break;
        case 8u:
          v12 = 0;
          v9 = RB::Heap::emplace<RB::DisplayList::Layer,unsigned int,int>(a2[8], (int *)&v12 + 1, (int *)&v12);
          v10 = this[16];
          this[16] = (RB::DisplayList::Layer *)v9;
          if (v10)
            RB::DisplayList::Layer::~Layer(v10);
          if ((v6 & 7) == 2)
          {
            v11 = this[16];
            RB::ProtobufDecoder::begin_message((RB::ProtobufDecoder *)a2);
            RB::DisplayList::Layer::decode(v11, (RB::Decoder *)a2);
LABEL_25:
            RB::ProtobufDecoder::end_message((uint64_t)a2);
          }
          else
          {
LABEL_29:
            *((_BYTE *)a2 + 56) = 1;
            *a2 = a2[1];
          }
          break;
        case 9u:
          this[18] = (RB::DisplayList::Layer *)RB::ProtobufDecoder::float2_field((RB::ProtobufDecoder *)a2, v6, v5).n128_u64[0];
          break;
        default:
          RB::ProtobufDecoder::skip_field((RB::ProtobufDecoder *)a2, v6);
          break;
      }
      result = RB::ProtobufDecoder::next_field((RB::ProtobufDecoder *)a2);
      v6 = result;
    }
    while (result);
  }
  return result;
}

void RB::CustomEffect::print(RB::CustomEffect *this, std::string *a2)
{
  const char *v4;
  int v5;
  float32x2_t v6;
  uint32x2_t v7;
  RB::DisplayList::Layer *v8;

  RB::SexpString::push(a2, "custom-filter");
  if ((*((_DWORD *)this + 56) & 3) == 2)
    v4 = "warp";
  else
    v4 = "layer";
  RB::SexpString::printf(a2, 0, "#:type %s", v4);
  if (*(_QWORD *)this)
    RB::SexpString::printf(a2, 0, "#:shader %s", (const char *)objc_msgSend(*(id *)(*(_QWORD *)this + 24), "UTF8String"));
  v5 = *((_DWORD *)this + 56);
  if ((v5 & 4) != 0)
  {
    RB::SexpString::printf(a2, 0, "#:dither");
    v5 = *((_DWORD *)this + 56);
  }
  if ((v5 & 8) != 0)
    RB::SexpString::printf(a2, 0, "#:alpha-only");
  v6 = *(float32x2_t *)((char *)this + 216);
  v7 = (uint32x2_t)vcgtz_f32(v6);
  if ((vpmin_u32(v7, v7).u32[0] & 0x80000000) != 0)
    RB::SexpString::printf(a2, 0, "(bounds %g %g %g %g)", COERCE_FLOAT(*((_QWORD *)this + 26)), COERCE_FLOAT(HIDWORD(*((_QWORD *)this + 26))), v6.f32[0], v6.f32[1]);
  v8 = (RB::DisplayList::Layer *)*((_QWORD *)this + 16);
  if (v8)
    RB::DisplayList::Layer::print(v8, a2);
  RB::SexpString::pop(a2);
}

std::string *RB::XML::Value::Bool::to_string(uint64_t a1, std::string *this)
{
  if (*(_BYTE *)(a1 + 8))
    return std::string::append(this, "true", 4uLL);
  else
    return std::string::append(this, "false", 5uLL);
}

std::string *RB::XML::Value::Int::to_string(uint64_t a1, std::string *a2)
{
  size_t v3;
  char __s[128];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  snprintf_l(__s, 0x80uLL, 0, "%ld", *(_QWORD *)(a1 + 8));
  v3 = strlen(__s);
  return std::string::append(a2, __s, v3);
}

std::string *RB::XML::Value::Float::to_string(uint64_t a1, std::string *a2, char a3)
{
  double v4;
  double v5;
  size_t v6;
  char __s[128];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = *(double *)(a1 + 8);
  v5 = round(v4 * 32.0) * 0.03125;
  if ((a3 & 2) != 0)
    v4 = v5;
  snprintf_l(__s, 0x80uLL, 0, "%g", v4);
  v6 = strlen(__s);
  return std::string::append(a2, __s, v6);
}

std::string *RB::XML::Value::ConstantString::to_string(uint64_t a1, std::string *a2)
{
  const char *v3;
  size_t v4;

  v3 = *(const char **)(a1 + 8);
  v4 = strlen(v3);
  return std::string::append(a2, v3, v4);
}

std::string *RB::XML::Value::StateID::to_string(uint64_t a1, std::string *a2)
{
  size_t v3;
  char __s[128];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  snprintf_l(__s, 0x80uLL, 0, "#%ld", *(_QWORD *)(a1 + 8));
  v3 = strlen(__s);
  return std::string::append(a2, __s, v3);
}

std::string *RB::XML::Value::Angle::to_string(uint64_t a1, std::string *a2, char a3)
{
  double v4;
  double v5;
  double v6;
  size_t v7;
  char __s[128];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *(double *)(a1 + 8);
  v5 = v4 * 57.2957795;
  v6 = round(v4 * 1833.46494) * 0.03125;
  if ((a3 & 2) == 0)
    v6 = v5;
  snprintf_l(__s, 0x80uLL, 0, "%g deg", v6);
  v7 = strlen(__s);
  return std::string::append(a2, __s, v7);
}

std::string *RB::XML::Value::Vec2::to_string(uint64_t a1, std::string *a2, char a3)
{
  double v4;
  double v5;
  double v6;
  size_t v7;
  char __s[128];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *(double *)(a1 + 8);
  v5 = round(v4 * 32.0) * 0.03125;
  if ((a3 & 2) != 0)
    v4 = v5;
  v6 = round(*(double *)(a1 + 16) * 32.0) * 0.03125;
  if ((a3 & 2) == 0)
    v6 = *(double *)(a1 + 16);
  snprintf_l(__s, 0x80uLL, 0, "%g %g", v4, v6);
  v7 = strlen(__s);
  return std::string::append(a2, __s, v7);
}

std::string *RB::XML::Value::Vec3::to_string(double *a1, std::string *a2, char a3)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  size_t v9;
  char __s[192];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a1[1];
  v5 = a1[2];
  v6 = round(v4 * 32.0) * 0.03125;
  if ((a3 & 2) != 0)
    v4 = v6;
  v7 = round(v5 * 32.0) * 0.03125;
  if ((a3 & 2) != 0)
    v5 = v7;
  v8 = round(a1[3] * 32.0) * 0.03125;
  if ((a3 & 2) == 0)
    v8 = a1[3];
  snprintf_l(__s, 0xC0uLL, 0, "%g %g %g", v4, v5, v8);
  v9 = strlen(__s);
  return std::string::append(a2, __s, v9);
}

std::string *RB::XML::Value::Vec4::to_string(double *a1, std::string *a2, char a3)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  size_t v11;
  char __s[256];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a1[1];
  v5 = a1[2];
  v6 = round(v4 * 32.0) * 0.03125;
  if ((a3 & 2) != 0)
    v4 = v6;
  v7 = round(v5 * 32.0) * 0.03125;
  if ((a3 & 2) != 0)
    v5 = v7;
  v8 = a1[3];
  v9 = round(v8 * 32.0) * 0.03125;
  if ((a3 & 2) != 0)
    v8 = v9;
  v10 = round(a1[4] * 32.0) * 0.03125;
  if ((a3 & 2) == 0)
    v10 = a1[4];
  snprintf_l(__s, 0x100uLL, 0, "%g %g %g %g", v4, v5, v8, v10);
  v11 = strlen(__s);
  return std::string::append(a2, __s, v11);
}

std::string *RB::XML::Value::AffineMatrix::to_string(double *a1, std::string *a2, char a3)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  size_t v15;
  char __s[256];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a1[1];
  v5 = a1[2];
  v6 = round(v4 * 32.0) * 0.03125;
  if ((a3 & 2) != 0)
    v4 = v6;
  v7 = round(v5 * 32.0) * 0.03125;
  if ((a3 & 2) != 0)
    v5 = v7;
  v8 = a1[3];
  v9 = a1[4];
  v10 = round(v8 * 32.0) * 0.03125;
  if ((a3 & 2) != 0)
    v8 = v10;
  v11 = round(v9 * 32.0) * 0.03125;
  if ((a3 & 2) != 0)
    v9 = v11;
  v12 = a1[5];
  v13 = round(v12 * 32.0) * 0.03125;
  if ((a3 & 2) != 0)
    v12 = v13;
  v14 = round(a1[6] * 32.0) * 0.03125;
  if ((a3 & 2) == 0)
    v14 = a1[6];
  snprintf_l(__s, 0x100uLL, 0, "%g %g %g %g %g %g", v4, v5, v8, v9, v12, v14);
  v15 = strlen(__s);
  return std::string::append(a2, __s, v15);
}

std::string *RB::XML::Value::Transform::to_string(uint64_t a1, std::string *a2)
{
  double v3;
  long double v4;
  double v5;
  size_t v6;
  char __s[256];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *(double *)(a1 + 8);
  if (v3 == 1.0 && *(double *)(a1 + 16) == 0.0 && *(double *)(a1 + 24) == 0.0 && *(double *)(a1 + 32) == 1.0)
  {
    snprintf_l(__s, 0x100uLL, 0, "translate(%g, %g)");
    goto LABEL_17;
  }
  if (*(double *)(a1 + 40) != 0.0 || *(double *)(a1 + 48) != 0.0)
  {
LABEL_16:
    snprintf_l(__s, 0x100uLL, 0, "matrix(%g, %g; %g, %g; %g, %g)");
    goto LABEL_17;
  }
  v4 = *(double *)(a1 + 16);
  if (v4 != 0.0 || *(double *)(a1 + 24) != 0.0)
  {
    if (v3 == *(double *)(a1 + 32) && v4 == -*(double *)(a1 + 24))
    {
      v5 = acos(*(long double *)(a1 + 8));
      if (vabdd_f64(asin(v4), v5) < 0.0001)
      {
        snprintf_l(__s, 0x100uLL, 0, "rotate(%g)");
        goto LABEL_17;
      }
    }
    goto LABEL_16;
  }
  if (v3 == *(double *)(a1 + 32))
    snprintf_l(__s, 0x100uLL, 0, "scale(%g)");
  else
    snprintf_l(__s, 0x100uLL, 0, "scale(%g, %g)");
LABEL_17:
  v6 = strlen(__s);
  return std::string::append(a2, __s, v6);
}

std::string *RB::XML::Value::BlendMode::to_string(std::string *result, std::string *a2)
{
  uint64_t v3;
  char **v4;
  unsigned int v5;
  const std::string::value_type *v6;
  size_t v7;

  v3 = LODWORD(result->__r_.__value_.__r.__words[1]);
  if (v3 > 0x1B)
  {
    v5 = v3 - 1000;
    if (v5 > 9)
      return result;
    v4 = &RB::XML::Value::BlendMode::to_string(std::string &,unsigned int)const::custom_names[v5];
  }
  else
  {
    v4 = &RB::XML::Value::BlendMode::to_string(std::string &,unsigned int)const::cg_names[v3];
  }
  v6 = *v4;
  v7 = strlen(*v4);
  return std::string::append(a2, v6, v7);
}

std::string *RB::XML::Value::AlphaBlendMode::to_string(std::string *result, std::string *a2)
{
  uint64_t v2;
  const char *v4;
  size_t v5;

  v2 = LODWORD(result->__r_.__value_.__r.__words[1]);
  if (v2 <= 3)
  {
    v4 = off_24C22BFA8[v2];
    v5 = strlen(v4);
    return std::string::append(a2, v4, v5);
  }
  return result;
}

std::string *RB::XML::Value::ClipMode::to_string(std::string *result, std::string *a2)
{
  uint64_t v2;
  const char *v4;
  size_t v5;

  v2 = LODWORD(result->__r_.__value_.__r.__words[1]);
  if (v2 <= 1)
  {
    v4 = off_24C22BFC8[v2];
    v5 = strlen(v4);
    return std::string::append(a2, v4, v5);
  }
  return result;
}

std::string *RB::XML::Value::InterpolationMode::to_string(std::string *result, std::string *a2)
{
  uint64_t v2;
  const char *v4;
  size_t v5;

  v2 = LODWORD(result->__r_.__value_.__r.__words[1]);
  if (v2 <= 0xC)
  {
    v4 = off_24C22BFD8[v2];
    v5 = strlen(v4);
    return std::string::append(a2, v4, v5);
  }
  return result;
}

std::string *RB::XML::Value::LineCap::to_string(std::string *result, std::string *a2)
{
  unint64_t v2;
  const char *v4;
  size_t v5;

  v2 = result->__r_.__value_.__s.__data_[8];
  if (v2 <= 6)
  {
    v4 = off_24C22C040[v2];
    v5 = strlen(v4);
    return std::string::append(a2, v4, v5);
  }
  return result;
}

std::string *RB::XML::Value::LineJoin::to_string(std::string *result, std::string *a2)
{
  unint64_t v2;
  const char *v4;
  size_t v5;

  v2 = result->__r_.__value_.__s.__data_[8];
  if (v2 <= 2)
  {
    v4 = off_24C22C078[v2];
    v5 = strlen(v4);
    return std::string::append(a2, v4, v5);
  }
  return result;
}

RB::XML::Value::Color *RB::XML::Value::Color::Color(RB::XML::Value::Color *this, float16x4_t *a2)
{
  *(_QWORD *)this = &off_24C229150;
  *(float32x4_t *)((char *)this + 8) = vcvtq_f32_f16(*a2);
  *((_DWORD *)this + 6) = rb_color_space(a2[1].i16[0]);
  return this;
}

std::string *RB::XML::Value::Color::to_string(uint64_t a1, std::string *a2, int a3)
{
  int v4;
  _BOOL4 v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  size_t v12;
  float v14;
  float v15;
  char __s[256];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = *(_DWORD *)(a1 + 24);
  if (v4)
    v5 = v4 == 2;
  else
    v5 = a3 < 0;
  v7 = *(float *)(a1 + 8);
  v6 = *(float *)(a1 + 12);
  v8 = *(float *)(a1 + 20);
  if (v5)
  {
    v9 = -v7;
    if (v7 > 0.0)
      v9 = *(float *)(a1 + 8);
    v14 = *(float *)(a1 + 12);
    v15 = *(float *)(a1 + 16);
    if (v9 > 0.0031308)
    {
      powf(v9, 0.41667);
      v6 = v14;
    }
    v10 = -v6;
    if (v6 > 0.0)
      v10 = v6;
    if (v10 > 0.0031308)
      powf(v10, 0.41667);
    v11 = -v15;
    if (v15 > 0.0)
      v11 = v15;
    if (v11 > 0.0031308)
      powf(v11, 0.41667);
  }
  if (v8 == 1.0)
    snprintf_l(__s, 0x100uLL, 0, "rgb(%g, %g, %g)");
  else
    snprintf_l(__s, 0x100uLL, 0, "rgba(%g, %g, %g, %g)");
  v12 = strlen(__s);
  return std::string::append(a2, __s, v12);
}

std::string *RB::XML::Value::ColorSpace::to_string(std::string *result, std::string *a2)
{
  uint64_t v2;
  const char *v4;
  size_t v5;

  v2 = LODWORD(result->__r_.__value_.__r.__words[1]);
  if (v2 <= 4)
  {
    v4 = off_24C22C090[v2];
    v5 = strlen(v4);
    return std::string::append(a2, v4, v5);
  }
  return result;
}

std::string *RB::XML::Value::ColorMatrix::to_string(uint64_t a1, std::string *a2, char a3, int32x4_t a4, double a5, double a6, int32x4_t a7)
{
  uint64_t v8;
  float32x4_t v9;
  float32x4_t v10;
  size_t v11;
  char __s[1280];
  float v14[20];
  uint64_t v15;

  v8 = 0;
  v15 = *MEMORY[0x24BDAC8D0];
  v9.i64[0] = 0x4200000042000000;
  v9.i64[1] = 0x4200000042000000;
  v10.i64[0] = 0x3D0000003D000000;
  v10.i64[1] = 0x3D0000003D000000;
  do
  {
    a7.i32[0] = 0;
    a4.i32[0] = a3 & 2;
    a7 = (int32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_s32(a4, a7), 0), *(int8x16_t *)(a1 + 8 + v8 * 4), (int8x16_t)vmulq_f32(vrndaq_f32(vmulq_f32(*(float32x4_t *)(a1 + 8 + v8 * 4), v9)), v10));
    *(int32x4_t *)&v14[v8] = a7;
    v8 += 4;
  }
  while (v8 != 20);
  snprintf_l(__s, 0x500uLL, 0, "%g %g %g %g; %g %g %g %g; %g %g %g %g; %g %g %g %g; %g %g %g %g",
    v14[0],
    v14[1],
    v14[2],
    v14[3],
    v14[4],
    v14[5],
    v14[6],
    v14[7],
    v14[8],
    v14[9],
    v14[10],
    v14[11],
    v14[12],
    v14[13],
    v14[14],
    v14[15],
    v14[16],
    v14[17],
    v14[18],
    v14[19]);
  v11 = strlen(__s);
  return std::string::append(a2, __s, v11);
}

std::string *RB::XML::Value::ColorArray::to_string(std::string *result, std::string *this, int a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  void (**v9)(RB::XML::Value::Color *__hidden);
  float32x4_t v10;
  int v11;

  if (result->__r_.__value_.__r.__words[2])
  {
    v5 = (uint64_t)result;
    v6 = 0;
    do
    {
      v7 = *(_QWORD *)(v5 + 8);
      v8 = *(_DWORD *)(v5 + 32);
      v9 = &off_24C229150;
      v10 = vcvtq_f32_f16(*(float16x4_t *)(v7 + 8 * v6));
      v11 = v8;
      if (v6)
        std::string::push_back(this, 32);
      result = RB::XML::Value::Color::to_string((uint64_t)&v9, this, a3);
      ++v6;
    }
    while (v6 < *(_QWORD *)(v5 + 16));
  }
  return result;
}

uint64_t RB::XML::Value::Path::to_string(uint64_t a1, uint64_t a2, int a3)
{
  return RBPathXMLDescription(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), a2, a3);
}

std::string *RB::XML::Value::Image::to_string(uint64_t a1, std::string *a2)
{
  int v4;
  const char *v5;
  size_t v6;
  void *v8;
  const char *v9;
  size_t v10;
  _QWORD v11[3];
  char v12;
  char __s[64];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = *(_DWORD *)(a1 + 8);
  if (!v4)
  {
    v8 = (void *)RBXMLRecorderExportCGImage(*(CGImage **)(a1 + 16));
    if (v8)
    {
      v9 = (const char *)objc_msgSend(v8, "UTF8String");
      v10 = strlen(v9);
      return std::string::append(a2, v9, v10);
    }
    v4 = *(_DWORD *)(a1 + 8);
  }
  RB::ImageDescription::ImageDescription((RB::ImageDescription *)v11, v4, *(const void **)(a1 + 16));
  if (v12)
    v5 = ", 1";
  else
    v5 = "";
  snprintf_l(__s, 0x40uLL, 0, "placeholder(%llu, %llu, %llu%s)", v11[0], v11[1], v11[2], v5);
  v6 = strlen(__s);
  return std::string::append(a2, __s, v6);
}

void RB::XML::Value::Font::to_string(uint64_t a1, std::string *a2)
{
  CFStringRef v3;
  __CFString *v4;
  const char *v5;
  size_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  size_t v11;

  v3 = CGFontCopyPostScriptName(*(CGFontRef *)(a1 + 8));
  if (v3)
  {
    v4 = (__CFString *)v3;
    std::string::append(a2, "name(", 5uLL);
    v5 = (const char *)-[__CFString UTF8String](v4, "UTF8String");
    v6 = strlen(v5);
    std::string::append(a2, v5, v6);
    std::string::append(a2, ")", 1uLL);
    CFRelease(v4);
  }
  else
  {
    v7 = CGFontCopyURL();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = (void *)MEMORY[0x20BD168EC]();
      v10 = (const char *)objc_msgSend((id)objc_msgSend(v8, "path"), "UTF8String");
      v11 = strlen(v10);
      std::string::append(a2, v10, v11);
      objc_autoreleasePoolPop(v9);
      CFRelease(v8);
    }
  }
}

void sub_209BBB7BC(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

std::string *RB::XML::Value::IntArray::to_string(std::string *result, std::string *this)
{
  uint64_t v3;
  unint64_t v4;
  size_t v5;
  char __s[64];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (result->__r_.__value_.__r.__words[2])
  {
    v3 = (uint64_t)result;
    v4 = 0;
    do
    {
      if (v4)
        std::string::push_back(this, 32);
      snprintf_l(__s, 0x40uLL, 0, "%ld", *(_QWORD *)(*(_QWORD *)(v3 + 8) + 8 * v4));
      v5 = strlen(__s);
      result = std::string::append(this, __s, v5);
      ++v4;
    }
    while (v4 < *(_QWORD *)(v3 + 16));
  }
  return result;
}

std::string *RB::XML::Value::FloatArray::to_string(std::string *result, std::string *this, char a3)
{
  uint64_t v5;
  unint64_t v6;
  double v7;
  double v8;
  size_t v9;
  char __s[64];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (result->__r_.__value_.__r.__words[2])
  {
    v5 = (uint64_t)result;
    v6 = 0;
    do
    {
      if (v6)
        std::string::push_back(this, 32);
      v7 = *(double *)(*(_QWORD *)(v5 + 8) + 8 * v6);
      v8 = round(v7 * 32.0) * 0.03125;
      if ((a3 & 2) != 0)
        v7 = v8;
      snprintf_l(__s, 0x40uLL, 0, "%g", v7);
      v9 = strlen(__s);
      result = std::string::append(this, __s, v9);
      ++v6;
    }
    while (v6 < *(_QWORD *)(v5 + 16));
  }
  return result;
}

void RB::XML::Value::GlyphArray::to_string(uint64_t a1, std::string *this)
{
  unint64_t v4;
  __CFString *v5;
  const char *v6;
  size_t v7;
  size_t v8;
  char __s[64];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 48))
  {
    v4 = 0;
    do
    {
      if (v4)
        std::string::push_back(this, 32);
      v5 = (__CFString *)CGFontCopyGlyphNameForGlyph(*(CGFontRef *)(a1 + 32), *(_WORD *)(*(_QWORD *)(a1 + 40) + 2 * v4));
      if (v5)
      {
        std::string::push_back(this, 92);
        v6 = (const char *)-[__CFString UTF8String](v5, "UTF8String");
        v7 = strlen(v6);
        std::string::append(this, v6, v7);
        CFRelease(v5);
      }
      else
      {
        snprintf_l(__s, 0x40uLL, 0, "%d", *(unsigned __int16 *)(*(_QWORD *)(a1 + 40) + 2 * v4));
        v8 = strlen(__s);
        std::string::append(this, __s, v8);
      }
      ++v4;
    }
    while (v4 < *(_QWORD *)(a1 + 48));
  }
}

void sub_209BBBAB8(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t RB::XML::Value::Stroke::to_string(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 8), "applyFunction:info:", RB::XML::Value::Stroke::to_string(std::string &,unsigned int)const::$_0::__invoke, a2);
}

std::string *RB::XML::Value::StrokeType::to_string(std::string *result, std::string *this)
{
  int v2;

  v2 = result->__r_.__value_.__r.__words[1];
  if (v2 == 1)
    return std::string::append(this, "particles", 9uLL);
  if (!v2)
    return std::string::append(this, "lines", 5uLL);
  return result;
}

RB::XML::Value::Gradient *RB::XML::Value::Gradient::Gradient(RB::XML::Value::Gradient *this, const RB::Fill::Gradient *a2)
{
  char *v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *((_QWORD *)this + 1) = 0;
  v4 = (char *)this + 8;
  *(_QWORD *)this = &off_24C229290;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_DWORD *)this + 8) = *((_DWORD *)a2 + 12);
  v5 = *(_QWORD *)a2;
  if (v5)
  {
    RB::vector<RB::Fill::Gradient::Stop,0ul,unsigned long>::reserve_slow((uint64_t)this + 8, v5);
    if (*(_QWORD *)a2)
    {
      v7 = 0;
      v8 = 0;
      v9 = *((_QWORD *)this + 2);
      do
      {
        v10 = *((_QWORD *)a2 + 1);
        if (*((_QWORD *)this + 3) < (unint64_t)(v9 + 1))
        {
          RB::vector<RB::Fill::Gradient::Stop,0ul,unsigned long>::reserve_slow((uint64_t)v4, v9 + 1);
          v9 = *((_QWORD *)this + 2);
        }
        *(_OWORD *)(*((_QWORD *)this + 1) + 16 * v9) = *(_OWORD *)(v10 + v7);
        v9 = *((_QWORD *)this + 2) + 1;
        *((_QWORD *)this + 2) = v9;
        ++v8;
        v7 += 16;
      }
      while (v8 < *(_QWORD *)a2);
    }
  }
  return this;
}

void sub_209BBBBFC(_Unwind_Exception *exception_object)
{
  void **v1;

  if (*v1)
    free(*v1);
  _Unwind_Resume(exception_object);
}

std::string *RB::XML::Value::Gradient::to_string(std::string *result, std::string *this, int a3)
{
  uint64_t v5;
  int v6;
  const std::string::value_type *v7;
  std::string *v8;
  std::string::size_type v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  float v13;
  float v14;
  size_t v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  uint64_t v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  double v29;
  float v30;
  double v31;
  float v32;
  double v33;
  float v34;
  float v35;
  float v36;
  size_t v37;
  void (**v38)(RB::XML::Value::Color *__hidden);
  float32x4_t v39;
  int v40;
  char __s[128];
  uint64_t v42;

  v5 = (uint64_t)result;
  v42 = *MEMORY[0x24BDAC8D0];
  v6 = result[1].__r_.__value_.__r.__words[1] & 0xC0;
  if (v6 == 192)
  {
    v7 = "[perceptual] ";
LABEL_7:
    v8 = this;
    v9 = 13;
    goto LABEL_8;
  }
  if (v6 == 128)
  {
    v7 = "[non-linear] ";
    goto LABEL_7;
  }
  if (v6 != 64)
    goto LABEL_9;
  v7 = "[linear] ";
  v8 = this;
  v9 = 9;
LABEL_8:
  result = std::string::append(v8, v7, v9);
LABEL_9:
  v10 = *(_QWORD *)(v5 + 16);
  if (v10)
  {
    v11 = 0;
    for (i = 24; ; i += 16)
    {
      if (v11)
        std::string::push_back(this, 32);
      if ((*(_BYTE *)(v5 + 34) & 1) != 0)
      {
        v13 = *(float *)(*(_QWORD *)(v5 + 8) + i - 16);
        v14 = roundf(v13 * 32.0) * 0.03125;
        if ((a3 & 2) != 0)
          v13 = v14;
        snprintf_l(__s, 0x80uLL, 0, "%g: ", v13);
        v15 = strlen(__s);
        std::string::append(this, __s, v15);
      }
      v16 = *(_QWORD *)(v5 + 8) + i;
      v38 = &off_24C229150;
      v39 = vcvtq_f32_f16(*(float16x4_t *)(v16 - 24));
      v40 = rb_color_space(0);
      result = RB::XML::Value::Color::to_string((uint64_t)&v38, this, a3);
      if ((unint64_t)++v11 >= *(_QWORD *)(v5 + 16))
        goto LABEL_33;
      v21 = *(_DWORD *)(v5 + 32);
      if ((v21 & 0x100) != 0)
        break;
      if ((v21 & 0x200) != 0)
      {
        v22 = *(_QWORD *)(v5 + 8) + i;
        LOBYTE(v17) = *(_BYTE *)(v22 - 12);
        v23 = (float)v17;
        v24 = v23 * 0.0039216;
        LOBYTE(v18) = *(_BYTE *)(v22 - 11);
        v25 = (float)v18;
        LOBYTE(v19) = *(_BYTE *)(v22 - 10);
        v26 = (float)v19;
        LOBYTE(v20) = *(_BYTE *)(v22 - 9);
        v27 = (float)v20;
        v28 = roundf(v23 * 0.12549) * 0.03125;
        if ((a3 & 2) == 0)
          v28 = v24;
        v29 = v28;
        v30 = roundf(v25 * 0.12549) * 0.03125;
        if ((a3 & 2) == 0)
          v30 = v25 * 0.0039216;
        v31 = v30;
        v32 = roundf(v26 * 0.12549) * 0.03125;
        if ((a3 & 2) == 0)
          v32 = v26 * 0.0039216;
        v33 = v32;
        v34 = roundf(v27 * 0.12549) * 0.03125;
        if ((a3 & 2) == 0)
          v34 = v27 * 0.0039216;
        snprintf_l(__s, 0x80uLL, 0, " cubic-bezier(%g, %g, %g, %g)", v29, v31, v33, v34);
LABEL_32:
        v37 = strlen(__s);
        result = std::string::append(this, __s, v37);
      }
LABEL_33:
      if (v10 == v11)
        return result;
    }
    v35 = *(float *)(*(_QWORD *)(v5 + 8) + i - 16)
        + (float)((float)(*(float *)(*(_QWORD *)(v5 + 8) + i) - *(float *)(*(_QWORD *)(v5 + 8) + i - 16))
                * *(float *)(*(_QWORD *)(v5 + 8) + i - 12));
    v36 = roundf(v35 * 32.0) * 0.03125;
    if ((a3 & 2) != 0)
      v35 = v36;
    snprintf_l(__s, 0x80uLL, 0, " midpoint(%g)", v35);
    goto LABEL_32;
  }
  return result;
}

void RB::XML::Value::Shader::to_string(uint64_t a1, std::string *a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  size_t v7;
  uint64_t v8;
  unsigned int *v9;
  char v10;
  uint64_t v11;
  CFDataRef *v12;
  CFDataRef *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  size_t v17;
  CFDataRef *v18;
  CFDataRef *v19;
  unint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int32 v23;
  const void *v24;
  unsigned int *v25;
  char __s[8];
  float32x4_t v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = -[RBShape shapeData](*(_QWORD *)(a1 + 8));
  if (*(_QWORD *)v4)
  {
    v5 = v4;
    v6 = (const char *)objc_msgSend(*(id *)(*(_QWORD *)v4 + 24), "UTF8String");
    v7 = strlen(v6);
    std::string::append(a2, v6, v7);
    std::string::push_back(a2, 40);
    v8 = *(_QWORD *)(v5 + 112);
    if (*(_QWORD *)(v5 + 104))
      v9 = *(unsigned int **)(v5 + 104);
    else
      v9 = (unsigned int *)(v5 + 8);
    if (v8)
    {
      v25 = &v9[6 * v8];
      v10 = 1;
      do
      {
        if ((v10 & 1) == 0)
          std::string::append(a2, ", ", 2uLL);
        if ((*((_BYTE *)v9 + 7) & 1) != 0)
        {
          std::string::push_back(a2, 42);
          if ((*((_BYTE *)v9 + 7) & 2) != 0)
            std::string::push_back(a2, 35);
        }
        if (*v9)
        {
          v11 = *((unsigned __int8 *)v9 + 4);
          switch(*((_BYTE *)v9 + 4))
          {
            case 1:
              goto LABEL_18;
            case 2:
              v11 = 2;
              goto LABEL_18;
            case 3:
            case 4:
              if ((_DWORD)v11 == 3)
                v11 = 3;
              else
                v11 = 4;
LABEL_18:
              v12 = RB::CustomShader::Value::data_ptr((RB::CustomShader::Value *)v9);
              if (*v9)
              {
                v13 = v12;
                v14 = 0;
                v15 = 0;
                do
                {
                  if (v15)
                    std::string::append(a2, "; ", 2uLL);
                  v16 = 0;
                  do
                  {
                    if (v16)
                      std::string::push_back(a2, 32);
                    snprintf_l(__s, 0x40uLL, 0, "%g", *((float *)v13 + v14 + v16));
                    v17 = strlen(__s);
                    std::string::append(a2, __s, v17);
                    ++v16;
                  }
                  while (v11 != v16);
                  ++v15;
                  v14 += v16;
                }
                while (v15 < *v9);
              }
              break;
            case 5:
              v18 = RB::CustomShader::Value::data_ptr((RB::CustomShader::Value *)v9);
              if (*v9)
              {
                v19 = v18;
                v20 = 0;
                do
                {
                  if (v20)
                    std::string::push_back(a2, 32);
                  v21 = *(_WORD *)((char *)v9 + 5);
                  *(_QWORD *)__s = &off_24C229150;
                  v28 = vcvtq_f32_f16(vcvt_f16_f32(*(float32x4_t *)&v19[2 * v20]));
                  v29 = rb_color_space(v21);
                  RB::XML::Value::Color::to_string((uint64_t)__s, a2, a3);
                  ++v20;
                }
                while (v20 < *v9);
              }
              break;
            case 6:
              std::string::append(a2, "bounds()", 8uLL);
              break;
            case 7:
              std::string::append(a2, "image", 5uLL);
              goto LABEL_37;
            case 8:
              std::string::append(a2, "mipmapped-image", 0xFuLL);
LABEL_37:
              std::string::push_back(a2, 40);
              v22 = RB::CustomShader::Value::image((RB::CustomShader::Value *)v9);
              if (v22)
              {
                v23 = *(_DWORD *)(v22 + 8);
                v24 = *(const void **)v22;
                *(_QWORD *)__s = &off_24C2291A0;
                v28.i32[0] = v23;
                if (v24)
                  CFRetain(v24);
                v28.i64[1] = (uint64_t)v24;
                RB::XML::Value::Image::to_string((uint64_t)__s, a2);
                if (v24)
                  CFRelease(v24);
              }
              std::string::push_back(a2, 41);
              break;
            default:
              break;
          }
        }
        v10 = 0;
        v9 += 6;
      }
      while (v9 != v25);
    }
    std::string::push_back(a2, 41);
  }
}

void sub_209BBC264(_Unwind_Exception *exception_object)
{
  const void *v1;

  if (v1)
    CFRelease(v1);
  _Unwind_Resume(exception_object);
}

void RB::XML::Value::Image::~Image(RB::XML::Value::Image *this)
{
  const void *v1;

  *(_QWORD *)this = &off_24C2291A0;
  v1 = (const void *)*((_QWORD *)this + 2);
  if (v1)
    CFRelease(v1);
}

{
  const void *v1;

  *(_QWORD *)this = &off_24C2291A0;
  v1 = (const void *)*((_QWORD *)this + 2);
  if (v1)
    CFRelease(v1);
  JUMPOUT(0x20BD16544);
}

std::string *RB::XML::Value::UUID::to_string(uint64_t a1, std::string *this, char a3)
{
  size_t v4;
  _BYTE v6[37];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if ((a3 & 1) != 0)
    return std::string::append(this, "redacted", 8uLL);
  memset(v6, 0, sizeof(v6));
  uuid_unparse((const unsigned __int8 *)(a1 + 8), v6);
  v4 = strlen(v6);
  return std::string::append(this, v6, v4);
}

std::string *RB::XML::Value::TransitionEffectType::to_string(std::string *result, std::string *a2)
{
  unint64_t v2;
  const char *v4;
  size_t v5;

  v2 = result->__r_.__value_.__s.__data_[8];
  if (v2 <= 0x14)
  {
    v4 = off_24C22C0B8[v2];
    v5 = strlen(v4);
    return std::string::append(a2, v4, v5);
  }
  return result;
}

std::string *RB::XML::Value::TransitionMethod::to_string(std::string *result, std::string *a2)
{
  unint64_t v2;
  const char *v4;
  size_t v5;

  v2 = result->__r_.__value_.__s.__data_[8];
  if (v2 <= 8)
  {
    v4 = off_24C22C160[v2];
    v5 = strlen(v4);
    return std::string::append(a2, v4, v5);
  }
  return result;
}

void RB::XML::Value::Bool::~Bool(RB::XML::Value::Bool *this)
{
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::Int::~Int(RB::XML::Value::Int *this)
{
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::Float::~Float(RB::XML::Value::Float *this)
{
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::ConstantString::~ConstantString(RB::XML::Value::ConstantString *this)
{
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::StateID::~StateID(RB::XML::Value::StateID *this)
{
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::Angle::~Angle(RB::XML::Value::Angle *this)
{
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::Vec2::~Vec2(RB::XML::Value::Vec2 *this)
{
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::Vec3::~Vec3(RB::XML::Value::Vec3 *this)
{
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::Vec4::~Vec4(RB::XML::Value::Vec4 *this)
{
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::AffineMatrix::~AffineMatrix(RB::XML::Value::AffineMatrix *this)
{
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::Transform::~Transform(RB::XML::Value::Transform *this)
{
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::BlendMode::~BlendMode(RB::XML::Value::BlendMode *this)
{
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::AlphaBlendMode::~AlphaBlendMode(RB::XML::Value::AlphaBlendMode *this)
{
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::ClipMode::~ClipMode(RB::XML::Value::ClipMode *this)
{
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::InterpolationMode::~InterpolationMode(RB::XML::Value::InterpolationMode *this)
{
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::LineCap::~LineCap(RB::XML::Value::LineCap *this)
{
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::LineJoin::~LineJoin(RB::XML::Value::LineJoin *this)
{
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::Color::~Color(RB::XML::Value::Color *this)
{
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::ColorSpace::~ColorSpace(RB::XML::Value::ColorSpace *this)
{
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::ColorMatrix::~ColorMatrix(RB::XML::Value::ColorMatrix *this)
{
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::ColorArray::~ColorArray(RB::XML::Value::ColorArray *this)
{
  void *v1;

  *(_QWORD *)this = &off_24C223CE0;
  v1 = (void *)*((_QWORD *)this + 1);
  if (v1)
    free(v1);
}

{
  void *v1;

  *(_QWORD *)this = &off_24C223CE0;
  v1 = (void *)*((_QWORD *)this + 1);
  if (v1)
    free(v1);
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::Path::~Path(RB::XML::Value::Path *this)
{
  *(_QWORD *)this = &off_24C229060;
  RBPathRelease(*((_QWORD *)this + 1), *((_QWORD *)this + 2));
}

{
  *(_QWORD *)this = &off_24C229060;
  RBPathRelease(*((_QWORD *)this + 1), *((_QWORD *)this + 2));
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::Font::~Font(RB::XML::Value::Font *this)
{
  const void *v1;

  *(_QWORD *)this = &off_24C229038;
  v1 = (const void *)*((_QWORD *)this + 1);
  if (v1)
    CFRelease(v1);
}

{
  const void *v1;

  *(_QWORD *)this = &off_24C229038;
  v1 = (const void *)*((_QWORD *)this + 1);
  if (v1)
    CFRelease(v1);
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::IntArray::~IntArray(RB::XML::Value::IntArray *this)
{
  void *v1;

  *(_QWORD *)this = &off_24C2292B8;
  v1 = (void *)*((_QWORD *)this + 1);
  if (v1)
    free(v1);
}

{
  void *v1;

  *(_QWORD *)this = &off_24C2292B8;
  v1 = (void *)*((_QWORD *)this + 1);
  if (v1)
    free(v1);
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::Stroke::~Stroke(id *this)
{
  *this = &off_24C2291F0;

}

{
  *this = &off_24C2291F0;

  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::StrokeType::~StrokeType(RB::XML::Value::StrokeType *this)
{
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::Shader::~Shader(id *this)
{
  *this = &off_24C2291C8;

}

{
  *this = &off_24C2291C8;

  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::UUID::~UUID(RB::XML::Value::UUID *this)
{
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::TransitionEffectType::~TransitionEffectType(RB::XML::Value::TransitionEffectType *this)
{
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::TransitionMethod::~TransitionMethod(RB::XML::Value::TransitionMethod *this)
{
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::FloatArray::~FloatArray(RB::XML::Value::FloatArray *this)
{
  void *v1;

  *(_QWORD *)this = &off_24C228E58;
  v1 = (void *)*((_QWORD *)this + 1);
  if (v1)
    free(v1);
}

{
  void *v1;

  *(_QWORD *)this = &off_24C228E58;
  v1 = (void *)*((_QWORD *)this + 1);
  if (v1)
    free(v1);
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::Gradient::~Gradient(RB::XML::Value::Gradient *this)
{
  void *v1;

  *(_QWORD *)this = &off_24C229290;
  v1 = (void *)*((_QWORD *)this + 1);
  if (v1)
    free(v1);
}

{
  void *v1;

  *(_QWORD *)this = &off_24C229290;
  v1 = (void *)*((_QWORD *)this + 1);
  if (v1)
    free(v1);
  JUMPOUT(0x20BD16544);
}

void RB::XML::Value::Stroke::to_string(std::string &,unsigned int)const::$_0::__invoke(uint64_t a1, uint64_t a2, uint64_t a3, std::string *this)
{
  uint64_t v8;
  std::string::value_type v9;
  uint64_t v10;
  uint64_t i;
  size_t v12;
  char __s[64];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v8 = 0;
    while ((SHIBYTE(this->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      if (*((_BYTE *)&this->__r_.__value_.__s + 23))
        goto LABEL_5;
LABEL_6:
      v9 = 109;
      v10 = 2;
      switch(*(_BYTE *)(a2 + v8))
      {
        case 0:
          goto LABEL_25;
        case 1:
          v9 = 108;
          v10 = 2;
          goto LABEL_25;
        case 2:
          v9 = 113;
          v10 = 4;
          goto LABEL_25;
        case 3:
          v9 = 99;
          v10 = 6;
          goto LABEL_25;
        case 4:
          v10 = 0;
          v9 = 104;
          break;
        case 5:
          v9 = 119;
          goto LABEL_24;
        case 6:
          v9 = 100;
          goto LABEL_24;
        case 7:
          v9 = 120;
          goto LABEL_24;
        case 8:
          v9 = 115;
          goto LABEL_24;
        case 9:
          v9 = 83;
          goto LABEL_24;
        case 0xA:
          v9 = 114;
          goto LABEL_24;
        case 0xB:
          v9 = 82;
          goto LABEL_24;
        case 0xC:
          v9 = 111;
          goto LABEL_24;
        case 0xD:
          v9 = 79;
          goto LABEL_24;
        case 0xE:
          v9 = 97;
          goto LABEL_24;
        case 0xF:
          v9 = 65;
LABEL_24:
          v10 = 1;
LABEL_25:
          for (i = 0; i != v10; ++i)
          {
            if (i)
              std::string::push_back(this, 32);
            snprintf_l(__s, 0x40uLL, 0, "%g", *(float *)(a3 + 4 * i));
            v12 = strlen(__s);
            std::string::append(this, __s, v12);
          }
          break;
        default:
          v10 = 0;
          v9 = 0;
          break;
      }
      std::string::push_back(this, 32);
      std::string::push_back(this, v9);
      a3 += 4 * v10;
      if (++v8 == a1)
        return;
    }
    if (!this->__r_.__value_.__l.__size_)
      goto LABEL_6;
LABEL_5:
    std::string::push_back(this, 32);
    goto LABEL_6;
  }
}

uint64_t RB::RenderState::custom_shader_id(RB::RenderState *this)
{
  unsigned int v1;
  BOOL v2;
  uint64_t v3;

  v1 = *(_DWORD *)this & 0x3F;
  v2 = v1 > 0x25;
  v3 = (1 << v1) & 0x2040400100;
  if (v2 || v3 == 0)
    return 0;
  else
    return *((_DWORD *)this + 1) >> 3;
}

uint64_t RB::RenderState::render_mask(unsigned int *a1, int a2, int a3)
{
  unsigned int *v3;
  __int16 v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  __int16 v9;
  int v10;
  unsigned int v11;
  int v12;
  __int16 v13;
  __int16 v14;
  unsigned int v15;
  unsigned int v16;
  BOOL v17;
  int v18;
  char v20;
  int v21;
  char v22;

  v3 = a1;
  v5 = HIBYTE(v4);
  v6 = *v3;
  v7 = v3[1];
  if ((v7 & 2) != 0)
    v8 = 4;
  else
    v8 = 2;
  switch(v6 & 0x3F)
  {
    case 0u:
    case 1u:
      LOBYTE(a1) = v4 | 0x3F;
      v5 = ((unsigned __int16)(v4 & 0xC000) >> 8) | 0x3F;
      return a1 | (v5 << 8);
    case 2u:
    case 3u:
    case 0x21u:
      v5 = v8 | ((unsigned __int16)(v4 & 0xFF00) >> 8);
      goto LABEL_25;
    case 4u:
    case 0xAu:
      v5 = ((unsigned __int16)(v4 & 0xFF00) >> 8) | 0x10;
      goto LABEL_25;
    case 5u:
    case 6u:
    case 7u:
    case 8u:
      v11 = *v3;
      v12 = v11 & 0xF000;
      LOBYTE(v13) = v8 | v4;
      if ((v11 & 0x30000) == 0x10000)
      if ((v11 & 0x100000) != 0)
      else
        LOBYTE(v14) = v13;
      if (v12 == 4096)
      else
        LOBYTE(a1) = v14;
      goto LABEL_18;
    case 9u:
    case 0xEu:
    case 0xFu:
    case 0x10u:
    case 0x18u:
    case 0x19u:
    case 0x1Bu:
      v5 = ((unsigned __int16)(v4 & 0xFF00) >> 8) | 8;
LABEL_25:
      break;
    case 0xBu:
    case 0xCu:
    case 0xDu:
      v15 = v4 & 0xFF00;
      if ((v7 & 1) != 0)
        LOBYTE(a1) = v4 | v8 | 0x10;
      else
      goto LABEL_35;
    case 0x11u:
      LOBYTE(a1) = v4 | 8;
      v5 = ((unsigned __int16)(v4 & 0xFF00) >> 8) | 0x18;
      break;
    case 0x12u:
    case 0x13u:
    case 0x14u:
    case 0x15u:
    case 0x16u:
      LOBYTE(v9) = v4 | v8 | 0x10;
      if ((v7 & 1) == 0)
      LOBYTE(a1) = v9 | 8;
      v10 = v8 | ((unsigned __int16)(v4 & 0xFF00) >> 8);
      goto LABEL_9;
    case 0x1Au:
      v10 = (unsigned __int16)(v4 & 0xFF00) >> 8;
      LOBYTE(a1) = v4 | 8;
LABEL_9:
      v5 = v10 | 8;
      break;
    case 0x1Du:
    case 0x1Eu:
      v15 = v4 & 0xFF00;
      LOBYTE(a1) = (16 * (v7 & 1)) | v8 | v4;
      goto LABEL_35;
    case 0x1Fu:
      v15 = v4 & 0xFF00;
      if ((v6 & 0x3C00000) == 0x1000000)
        LOBYTE(a1) = v4 | v8 | 0x10;
      else
      goto LABEL_35;
    case 0x20u:
      LOBYTE(a1) = v8 | v4;
      break;
    case 0x22u:
      v15 = v4 & 0xFF00;
      LOBYTE(a1) = v8 | v4;
      goto LABEL_35;
    case 0x23u:
      v5 = v8 | ((unsigned __int16)(v4 & 0xFF00) >> 8);
      v20 = (16 * (v7 & 1)) | v4;
      v21 = (v6 >> 22) & 3;
      v22 = v20 | 4;
      if (v21 == 1)
        v20 |= 2u;
      if (v21 == 2)
        LOBYTE(a1) = v22;
      else
        LOBYTE(a1) = v20;
      break;
    case 0x24u:
    case 0x25u:
    case 0x26u:
LABEL_18:
      v15 = v4 & 0xFF00;
      if ((v7 & 1) != 0)
        LOBYTE(a1) = a1 | v8 | 0x10;
LABEL_35:
      v5 = v8 | (v15 >> 8);
      break;
    default:
      break;
  }
  v16 = (v6 >> 6) & 0x3F;
  if (v16 - 19 < 4)
  {
    v17 = (v5 & v8) == 0;
    v18 = v5 & ~v8 | 0x10;
    if (!v17)
      v5 = v18;
    goto LABEL_39;
  }
  if (v16 != 23)
  {
LABEL_39:
    if (v16 > 0x17 || ((1 << v16) & 0xA80003) == 0)
      LOBYTE(a1) = v5 & 0xFE | a1;
    return a1 | (v5 << 8);
  }
  if ((v5 & (v8 | 0x10)) != 0)
    v5 = v5 & (v8 ^ 0xFFFFFFE7) | 8;
  return a1 | (v5 << 8);
}

BOOL RB::RenderState::set_color_conversion(int *a1, int a2, int a3, _DWORD *a4)
{
  int v4;
  int v5;

  *a4 = 1065353216;
  if (a2 == a3)
  {
    v5 = 0;
    v4 = 0;
  }
  else
  {
    v4 = ((a3 & 0xFE) != a3) | (4 * ((a2 & 0xFE) != a2));
    if ((a2 & 0xFE) != 0 || (a3 & 0xFE) != 2)
    {
      if ((a3 & 0xFE) == 0 && (a2 & 0xFE) == 2)
        v5 = 0x8000;
      else
        v5 = 0;
    }
    else
    {
      v5 = 0x10000;
    }
  }
  *a1 = v5 | *a1 & 0xFFF | (v4 << 22);
  return a2 != a3;
}

unsigned int *RB::RenderState::simplify_plus_lighter(unsigned int *this, unint64_t a2)
{
  unsigned int v2;
  unsigned int *v4;

  v2 = *this;
  if ((*this & 0x3F) <= 0x25 && ((1 << (*this & 0x3F)) & 0x38007C39E0) != 0)
  {
    v4 = this;
    this = RB::pixel_format_traits(a2, (MTLPixelFormat)a2);
    if ((((unint64_t)*((unsigned __int16 *)this + 2) << 32) & 0xA00000000) == 0)
      *v4 = v2 & 0xFFFFF03F | 0x2C0;
  }
  return this;
}

unint64_t RB::may_discard_dest(unsigned int a1)
{
  return (a1 > 0x2F) | (0x7FFFFFAEFE47uLL >> a1) & 1;
}

RB::FormattedRenderState::ID *RB::FormattedRenderState::ID::ID(RB::FormattedRenderState::ID *this, const char *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v3, 0);
  if (objc_msgSend(v4, "length") == 12)
  {
    v5 = objc_msgSend(v4, "bytes");
    v6 = *(_QWORD *)v5;
    *((_DWORD *)this + 2) = *(_DWORD *)(v5 + 8);
    *(_QWORD *)this = v6;
  }
  else
  {
    *((_DWORD *)this + 2) = 0;
    *(_QWORD *)this = 0;
  }

  return this;
}

void sub_209BBD11C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t RB::blend_into_zero(unsigned int a1)
{
  uint64_t result;

  result = 1;
  if (a1 <= 0x30)
  {
    if (((1 << a1) & 0x5FFFFF04FE55) != 0)
    {
      return 2;
    }
    else if (a1 == 17)
    {
      return 17;
    }
    else if (((1 << a1) & 0x1000000F80000) != 0)
    {
      abort();
    }
  }
  return result;
}

void RB::SurfacePool::erase_queue(uint64_t a1, CFTypeRef *a2)
{
  double v4;
  uint64_t v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  if (*a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)a1);
    v4 = CACurrentMediaTime();
    v5 = *(_QWORD *)(a1 + 80);
    v6 = v5 + 1;
    if (*(_QWORD *)(a1 + 88) < (unint64_t)(v5 + 1))
    {
      v5 = *(_QWORD *)(a1 + 80);
      v6 = v5 + 1;
    }
    v7 = *(_QWORD *)(a1 + 72);
    if (!v7)
      v7 = a1 + 40;
    v8 = v7 + 16 * v5;
    *(_QWORD *)v8 = *a2;
    *a2 = 0;
    *(double *)(v8 + 8) = v4 + 0.1;
    *(_QWORD *)(a1 + 80) = v6;
    v9 = *(unsigned __int8 *)(a1 + 128);
    if (!*(_BYTE *)(a1 + 128))
      *(_BYTE *)(a1 + 128) = 1;
    RB::SurfacePool::remove_watched_queue_locked((RB::SurfacePool *)a1, 0, 0);
    os_unfair_lock_unlock((os_unfair_lock_t)a1);
    if (*a2)
      CFRelease(*a2);
    *a2 = 0;
    if (!v9)
      dispatch_async_f(*(dispatch_queue_t *)(a1 + 8), (void *)a1, (dispatch_function_t)RB::SurfacePool::AsyncCollection::~AsyncCollection()::$_0::__invoke);
  }
}

void sub_209BBD2B4(_Unwind_Exception *exception_object)
{
  dispatch_queue_t *v1;
  int v2;

  if (v2)
    dispatch_async_f(v1[1], v1, (dispatch_function_t)RB::SurfacePool::AsyncCollection::~AsyncCollection()::$_0::__invoke);
  _Unwind_Resume(exception_object);
}

_QWORD *RB::vector<RB::cf_ptr<_CAImageQueue *>,8ul,unsigned long>::~vector(_QWORD *a1)
{
  _QWORD *v2;
  unint64_t v3;
  _QWORD *v4;
  unint64_t i;
  const void *v6;

  v2 = (_QWORD *)a1[8];
  v3 = a1[9];
  if (v2)
    v4 = v2;
  else
    v4 = a1;
  if (v3)
  {
    for (i = 0; i < v3; ++i)
    {
      v6 = (const void *)v4[i];
      if (v6)
      {
        CFRelease(v6);
        v3 = a1[9];
      }
    }
    v2 = (_QWORD *)a1[8];
  }
  if (v2)
    free(v2);
  return a1;
}

void RB::SurfacePool::watch_queue(os_unfair_lock_s *this, CALayer *a2, CALayer *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CALayer **v9;
  unint64_t v10;
  CALayer **v11;

  os_unfair_lock_lock(this);
  v6 = *(_QWORD *)&this[24]._os_unfair_lock_opaque;
  v7 = *(_QWORD *)&this[26]._os_unfair_lock_opaque;
  if (v7)
  {
    v8 = 16 * v7;
    v9 = (CALayer **)(v6 + 8);
    while (*(v9 - 1) != a2 || *v9 != a3)
    {
      v9 += 2;
      v8 -= 16;
      if (!v8)
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    v10 = v7 + 1;
    if (*(_QWORD *)&this[28]._os_unfair_lock_opaque < (unint64_t)(v7 + 1))
    {
      RB::vector<RB::Fill::Gradient::Stop,0ul,unsigned long>::reserve_slow((uint64_t)&this[24], v10);
      v6 = *(_QWORD *)&this[24]._os_unfair_lock_opaque;
      v7 = *(_QWORD *)&this[26]._os_unfair_lock_opaque;
      v10 = v7 + 1;
    }
    v11 = (CALayer **)(v6 + 16 * v7);
    *v11 = a2;
    v11[1] = a3;
    *(_QWORD *)&this[26]._os_unfair_lock_opaque = v10;
  }
  os_unfair_lock_unlock(this);
}

void sub_209BBD3F4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void RB::SurfacePool::unwatch_queues(os_unfair_lock_s *this, CALayer *a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  os_unfair_lock_lock(this);
  v4 = *(_QWORD *)&this[26]._os_unfair_lock_opaque;
  if (v4)
  {
    v5 = 0;
    do
    {
      v6 = *(_QWORD *)&this[24]._os_unfair_lock_opaque;
      if (*(CALayer **)(v6 + 16 * v5 + 8) == a2)
      {
        v7 = v6 + 16 * v4;
        v8 = *(_QWORD *)(v6 + 16 * v5);
        *(_OWORD *)(v6 + 16 * v5) = *(_OWORD *)(v7 - 16);
        *(_QWORD *)(v7 - 16) = v8;
        *(_QWORD *)(v7 - 8) = a2;
        v4 = *(_QWORD *)&this[26]._os_unfair_lock_opaque - 1;
        *(_QWORD *)&this[26]._os_unfair_lock_opaque = v4;
      }
      else
      {
        ++v5;
      }
    }
    while (v5 < v4);
  }
  os_unfair_lock_unlock(this);
}

void RB::Surface::~Surface(RB::Surface *this)
{
  void *v2;
  const void *v3;

  *(_QWORD *)this = off_24C2298A0;
  RB::Surface::destroy_queue_ids((uint64_t)this);
  v2 = (void *)*((_QWORD *)this + 12);
  if (v2)
    free(v2);

  v3 = (const void *)*((_QWORD *)this + 6);
  if (v3)
    CFRelease(v3);
}

{
  RB::Surface::~Surface(this);
  JUMPOUT(0x20BD16544);
}

void sub_209BBD4D4(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 + 96);
  if (v3)
    free(v3);
  RB::Surface::~Surface(v1);
  _Unwind_Resume(a1);
}

uint64_t RB::Refcount<RB::Surface,std::atomic<unsigned int>>::release(uint64_t result)
{
  unsigned int *v1;
  unsigned int v2;
  unsigned int v3;

  v1 = (unsigned int *)(result + 8);
  do
  {
    v2 = __ldxr(v1);
    v3 = v2 - 1;
  }
  while (__stlxr(v3, v1));
  if (!v3)
  {
    __dmb(9u);
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  }
  return result;
}

uint64_t RB::Refcount<RB::Surface,std::atomic<unsigned int>>::finalize(uint64_t result)
{
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 24))(result);
  return result;
}

void RB::SurfacePool::remove_watched_queue_locked(_CAImageQueue *,BOOL)::$_0::__invoke(void *a1)
{
  objc_msgSend(a1, "setNeedsDisplay");

}

void sub_209BBD580(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void RB::SurfacePool::AsyncCollection::~AsyncCollection()::$_0::__invoke(os_unfair_lock_s *this)
{
  LOBYTE(this[32]._os_unfair_lock_opaque) = 0;
  RB::SurfacePool::collect(this);
}

void OUTLINED_FUNCTION_0_1(CFTypeRef cf)
{
  CFRelease(cf);
}

RB::DisplayList::EditAdaptor *RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::EditAdaptor *this, RB::Transition ***a2, const RB::DisplayList::Item *a3, const RB::DisplayList::Item *a4)
{
  uint64_t *v8;
  _QWORD *v9;
  char v10;
  __n128 v11;
  __n128 *v12;
  unint64_t v13;
  __n128 *v14;
  __n128 *v15;
  uint64_t v16;
  uint64_t v17;
  __n128 v18;
  __n128 *v19;
  unint64_t v20;
  __n128 *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  _DWORD *v34;
  unsigned int v35;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  uint64_t *v40;
  unsigned int v41;
  uint64_t v42;
  int v43;
  uint64_t i;
  uint64_t v45[3];
  char v46;
  unsigned int v47;

  *((_OWORD *)this + 1) = 0u;
  v8 = (uint64_t *)((char *)this + 16);
  *((_QWORD *)this + 12) = 0;
  *(_OWORD *)this = 0u;
  *((_QWORD *)this + 13) = 0x800000000;
  *((_QWORD *)this + 22) = 0;
  *((_QWORD *)this + 23) = 0x800000000;
  *((_OWORD *)this + 12) = 0u;
  v9 = (_QWORD *)((char *)this + 192);
  *((_OWORD *)this + 13) = 0u;
  *((_BYTE *)this + 224) = 0;
  *(_QWORD *)((char *)this + 228) = 0x80000000;
  v10 = RB::Transition::properties(**a2);
  v47 = 0;
  v45[0] = (uint64_t)this;
  v45[1] = (uint64_t)&v47;
  v45[2] = (uint64_t)a2;
  v46 = v10;
  if (RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_1::operator()(v45, (uint64_t)this, (uint64_t)this + 32, (uint64_t)a3)&& RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_1::operator()(v45, (uint64_t)v8, (uint64_t)this + 112, (uint64_t)a4))
  {
    if (*((_BYTE *)this + 232))
    {
      *((_BYTE *)this + 232) = 1;
LABEL_7:
      v12 = *(__n128 **)this;
      v13 = *((unsigned int *)this + 2);
      v14 = (__n128 *)(*(_QWORD *)this + 24 * v13);
      if (v13 < 0x81)
      {
        v15 = 0;
        v17 = 0;
      }
      else
      {
        v15 = (__n128 *)std::get_temporary_buffer[abi:nn180100]<RB::DisplayList::EditAdaptor::Element>(*((unsigned int *)this + 2));
        v17 = v16;
      }
      v18 = std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>(v12, v14, v13, v15, v17, v11);
      if (v15)
        operator delete(v15);
      v19 = (__n128 *)*((_QWORD *)this + 2);
      v20 = *((unsigned int *)this + 6);
      if (v20 < 0x81)
      {
        v21 = 0;
        v23 = 0;
      }
      else
      {
        v21 = (__n128 *)std::get_temporary_buffer[abi:nn180100]<RB::DisplayList::EditAdaptor::Element>(*((unsigned int *)this + 6));
        v23 = v22;
      }
      std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>(v19, (__n128 *)((char *)v19 + 24 * v20), v20, v21, v23, v18);
      if (v21)
        operator delete(v21);
      v24 = 0;
      v39 = 0;
      v37 = 0;
      v25 = 0;
      for (i = 0; ; v24 = HIDWORD(i))
      {
        v26 = i;
        v38 = *((_DWORD *)this + 6);
        if (v24 >= *((unsigned int *)this + 2))
        {
          if (i >= v38)
          {
            *((_BYTE *)this + 235) = v25 > 1;
            goto LABEL_30;
          }
        }
        else
        {
          v27 = *(_QWORD *)this + 24 * v24;
          if (i >= v38)
            goto LABEL_24;
          if (RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()(v27, *v8 + 24 * i))
          {
            v27 = *(_QWORD *)this + 24 * v24;
            goto LABEL_24;
          }
        }
        v27 = *v8 + 24 * v26;
LABEL_24:
        v28 = *(_DWORD *)(*(_QWORD *)v27 + 40);
        v42 = *(_QWORD *)(*(_QWORD *)v27 + 32);
        v43 = v28;
        v40 = &v42;
        v41 = v25;
        v29 = RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_0::operator()<RB::vector<RB::DisplayList::EditAdaptor::Element,0ul,unsigned int>,unsigned int>(&v40, (uint64_t *)this, (unsigned int *)&i + 1);
        v30 = RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_0::operator()<RB::vector<RB::DisplayList::EditAdaptor::Element,0ul,unsigned int>,unsigned int>(&v40, v8, (unsigned int *)&i);
        if (v37 <= v29)
          v37 = v29;
        if (v39 <= v30)
          v39 = v30;
        ++v25;
      }
    }
    v11.n128_u64[0] = (unint64_t)vcnt_s8((int8x8_t)v47);
    v11.n128_u16[0] = vaddlv_u8((uint8x8_t)v11.n128_u64[0]);
    *((_BYTE *)this + 232) = v11.n128_u32[0] > 1;
    if (v11.n128_u32[0] > 1)
      goto LABEL_7;
    v37 = *((_DWORD *)this + 2);
    v38 = *((_DWORD *)this + 6);
    *((_BYTE *)this + 235) = 0;
    v39 = v38;
LABEL_30:
    v31 = v37 * v39 + 7;
    if (v31 <= 0x800007)
    {
      v32 = v31 >> 3;
      if (v37 != 1 && v38)
      {
        v33 = 24 * v38;
        v34 = (_DWORD *)(*v8 + 16);
        do
        {
          *v34 *= v37;
          v34 += 6;
          v33 -= 24;
        }
        while (v33);
      }
      v35 = *((_DWORD *)this + 50);
      if (v35 < v32)
      {
        if (*((_DWORD *)this + 51) < v32)
        {
          RB::vector<RB::Animation::TermOrArg,0ul,unsigned int>::reserve_slow((uint64_t)v9, v32);
          v35 = *((_DWORD *)this + 50);
        }
        if (v35 < v32)
          bzero((void *)(*v9 + 4 * v35), 4 * (v32 + ~v35) + 4);
      }
      *((_DWORD *)this + 50) = v32;
      *((_BYTE *)this + 234) = 1;
    }
  }
  return this;
}

void sub_209BBD900(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void *v5;
  void *v6;

  if (*v3)
    free(*v3);
  v5 = *(void **)(v1 + 176);
  if (v5)
    free(v5);
  v6 = *(void **)(v1 + 96);
  if (v6)
    free(v6);
  if (*v2)
    free(*v2);
  if (*(_QWORD *)v1)
    free(*(void **)v1);
  _Unwind_Resume(exception_object);
}

BOOL RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_1::operator()(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  RB::DisplayList::Interpolator::Layer *v15;
  uint64_t *v16;
  const RB::Transition *v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  unsigned int v24;
  int v25;
  unsigned int v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  __int16 v48;

  v7 = *a1;
  v33 = a4;
  v34 = 0;
  v37 = 1;
  v38 = 1;
  v39 = 0;
  v40 = 1;
  v41 = 1;
  v42 = 0;
  v43 = 0;
  v44 = 0;
  v45 = 0;
  v46 = 0;
  v47 = 0;
  v48 = 256;
  if (a4)
    v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a4 + 40))(a4);
  else
    v8 = 0;
  v36 = v8 != -1;
  if (v8 == -1)
    v9 = 1;
  else
    v9 = v8;
  v35 = v9;
  v10 = 0;
  if (v9 && !(*(_DWORD *)(a2 + 8) >> 13))
  {
    v11 = 0;
    do
    {
      v12 = v33;
      if (*(_BYTE *)(v7 + 232) || *(_DWORD *)(v33 + 40))
        LOBYTE(v13) = 1;
      else
        v13 = (*(unsigned __int16 *)(v33 + 46) >> 11) & 1;
      *(_BYTE *)(v7 + 232) = v13;
      v14 = *(_QWORD *)(v12 + 32);
      if (v14)
      {
        if (v14 != v11)
        {
          v15 = (RB::DisplayList::Interpolator::Layer *)a1[2];
          v16 = RB::DisplayList::Metadata::transition(*(uint64_t **)(v12 + 32));
          v17 = RB::DisplayList::Interpolator::Layer::item_transition(v15, (const RB::Transition *)v16);
          v18 = *(unsigned __int8 *)(v7 + 224);
          v19 = *((unsigned __int8 *)v17 + 12);
          if (v18 <= v19)
            LOBYTE(v18) = *((_BYTE *)v17 + 12);
          *(_BYTE *)(v7 + 224) = v18;
          *(_DWORD *)a1[1] |= 1 << v19;
          v20 = *((_DWORD *)v17 + 4);
          if (*(_DWORD *)(v7 + 228) > v20)
            v20 = *(_DWORD *)(v7 + 228);
          *(_DWORD *)(v7 + 228) = v20;
          *(_BYTE *)(v7 + 233) |= RB::Transition::properties(v17);
          v12 = v33;
          v11 = v14;
        }
      }
      else
      {
        *(_DWORD *)a1[1] |= 1u;
        *(_BYTE *)(v7 + 233) |= *((_BYTE *)a1 + 24);
      }
      v21 = v34;
      if (v36)
        v22 = HIDWORD(v34);
      else
        v22 = -1;
      v23 = *(_DWORD *)(a2 + 8);
      v24 = v23 + 1;
      if (*(_DWORD *)(a2 + 12) < (v23 + 1))
      {
        RB::vector<std::pair<std::pair<unsigned long,unsigned long>,RB::DisplayList::LayerTask *>,0ul,unsigned int>::reserve_slow(a2, v24);
        v26 = *(_DWORD *)(a2 + 8);
        v25 = v34;
        v24 = v26 + 1;
      }
      else
      {
        v25 = v34;
        v26 = *(_DWORD *)(a2 + 8);
      }
      v27 = *(_QWORD *)a2 + 24 * v26;
      *(_QWORD *)v27 = v12;
      *(_DWORD *)(v27 + 8) = v21;
      *(_DWORD *)(v27 + 12) = v22;
      *(_DWORD *)(v27 + 16) = v23;
      *(_DWORD *)(v27 + 20) = 0;
      *(_DWORD *)(a2 + 8) = v24;
      v28 = *(_DWORD *)(a3 + 72);
      if (v25 != v28 - 1)
      {
        v29 = v33;
        v30 = v28 + 1;
        if (*(_DWORD *)(a3 + 76) < v28 + 1)
        {
          RB::vector<RB::objc_ptr<void({block_pointer})(NSError *)>,8ul,unsigned int>::reserve_slow((void *)a3, v30);
          v28 = *(_DWORD *)(a3 + 72);
          v30 = v28 + 1;
        }
        v31 = *(_QWORD *)(a3 + 64);
        if (!v31)
          v31 = a3;
        *(_QWORD *)(v31 + 8 * v28) = v29;
        *(_DWORD *)(a3 + 72) = v30;
      }
      RB::DisplayList::AtomizedItems::advance(&v33, 1);
      v10 = HIDWORD(v34);
      v9 = v35;
    }
    while (HIDWORD(v34) < v35 && !(*(_DWORD *)(a2 + 8) >> 13) && v34 <= 0x1FFFFFFE);
  }
  return v10 == v9;
}

BOOL RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t *v5;
  unint64_t *v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  unsigned int v10;
  unsigned int v11;
  BOOL v12;
  uint64_t *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t *v17;
  unsigned int v18;

  v4 = *(uint64_t **)(*(_QWORD *)a1 + 32);
  v5 = *(uint64_t **)(*(_QWORD *)a2 + 32);
  if (v4 == v5)
    goto LABEL_12;
  if (!v4)
  {
    v6 = 0;
    if (v5)
      goto LABEL_4;
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v6 = (unint64_t *)RB::DisplayList::Metadata::identity_ns(*(uint64_t **)(*(_QWORD *)a1 + 32));
  if (!v5)
    goto LABEL_6;
LABEL_4:
  v7 = (unint64_t *)RB::DisplayList::Metadata::identity_ns(v5);
LABEL_7:
  if (v6 == v7)
    goto LABEL_12;
  if (!v6 || !v7)
  {
    v12 = v6 >= v7;
    return !v12;
  }
  v8 = bswap64(*v6);
  v9 = bswap64(*v7);
  if (v8 == v9)
  {
    v8 = bswap64(v6[1]);
    v9 = bswap64(v7[1]);
    if (v8 == v9)
    {
LABEL_12:
      v10 = *(_DWORD *)(*(_QWORD *)a1 + 40);
      v11 = *(_DWORD *)(*(_QWORD *)a2 + 40);
      v12 = v10 >= v11;
      if (v10 == v11)
      {
        v13 = RB::DisplayList::Metadata::transition(v4);
        v14 = v13 ? *((unsigned __int8 *)v13 + 12) : 0;
        v17 = RB::DisplayList::Metadata::transition(v5);
        v18 = v17 ? *((unsigned __int8 *)v17 + 12) : 0;
        v12 = v14 >= v18;
        if (v14 == v18)
          return (*(_WORD *)(*(_QWORD *)a1 + 46) & 0x800) != 0 && (*(_WORD *)(*(_QWORD *)a2 + 46) & 0x800) == 0;
      }
      return !v12;
    }
  }
  if (v8 < v9)
    v15 = -1;
  else
    v15 = 1;
  return v15 >> 31;
}

uint64_t RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_0::operator()<RB::vector<RB::DisplayList::EditAdaptor::Element,0ul,unsigned int>,unsigned int>(_DWORD *a1, uint64_t *a2, unsigned int *a3)
{
  unsigned int v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t **v9;
  uint64_t v10;
  int v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v16;
  int v17;
  uint64_t *v18;
  int v19;
  int v20;
  uint64_t v21;

  v3 = *a3;
  if (*a3 < *((_DWORD *)a2 + 2))
  {
    v7 = 0;
    while (1)
    {
      v8 = *a2;
      v9 = *(uint64_t ***)a1;
      v10 = *(_QWORD *)(*a2 + 24 * v3);
      v11 = *(_DWORD *)(v10 + 40);
      if (v11 != *(_DWORD *)(*(_QWORD *)a1 + 8))
        return v7;
      v12 = *(uint64_t **)(v10 + 32);
      if (v11)
      {
        v13 = *v9;
        if (v12 != *v9)
          break;
      }
      v16 = RB::DisplayList::Metadata::transition(v12);
      if (v16)
        v17 = *((unsigned __int8 *)v16 + 12);
      else
        v17 = 0;
      v18 = RB::DisplayList::Metadata::transition(*v9);
      if (v18)
        v19 = *((unsigned __int8 *)v18 + 12);
      else
        v19 = 0;
      if (v17 != v19)
        return v7;
LABEL_24:
      v20 = a1[2];
      v21 = v8 + 24 * v3;
      *(_DWORD *)(v21 + 16) = v7;
      *(_DWORD *)(v21 + 20) = v20;
      v3 = *a3 + 1;
      *a3 = v3;
      v7 = (v7 + 1);
      if (v3 >= *((_DWORD *)a2 + 2))
        return v7;
    }
    if (v12)
    {
      v14 = RB::DisplayList::Metadata::identity_ns(v12);
      v13 = *v9;
      if (!*v9)
      {
LABEL_9:
        if (v14 != v13)
        {
          if (!v14 || !v13)
            return v7;
          if (*v14 != *v13 || v14[1] != v13[1])
            return v7;
        }
        goto LABEL_24;
      }
    }
    else
    {
      v14 = 0;
      if (!v13)
        goto LABEL_9;
    }
    v13 = RB::DisplayList::Metadata::identity_ns(v13);
    goto LABEL_9;
  }
  return 0;
}

uint64_t RB::DisplayList::EditAdaptor::make_matrix_value(uint64_t a1, _QWORD *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t result;
  __int128 v11;
  __int128 v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v7 = *a3;
  v8 = *a4;
  if (*a3)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    result = 1;
  }
  else
  {
    v11 = *(_OWORD *)(a3 + 1);
    v12 = *(_OWORD *)(a4 + 1);
    v16 = 0x1000000000;
    *((_QWORD *)&v11 + 1) = v12;
    v17 = v11;
    v18 = 0x100000000;
    v19 = 0;
    (*(void (**)(uint64_t, _QWORD, uint64_t *))(*(_QWORD *)v7 + 208))(v7, *a2, &v16);
    v13 = v16 & 0xF;
    if (((0x303u >> v13) & 1) != 0)
      v14 = 1;
    else
      v14 = v16 & 0xF;
    if (v13 >= 0xA)
      result = v16 & 0xF;
    else
      result = v14;
  }
  v15 = *((_DWORD *)a3 + 4) + *((_DWORD *)a4 + 4);
  *(_DWORD *)(*(_QWORD *)(a1 + 192) + 4 * (v15 >> 3)) = *(_DWORD *)(*(_QWORD *)(a1 + 192) + 4 * (v15 >> 3)) & ~(15 << (4 * (v15 & 7))) | ((_DWORD)result << (4 * (v15 & 7)));
  return result;
}

void RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::EditAdaptor *this, uint64_t **a2)
{
  RB::DisplayList::EditAdaptor *v3;
  __n128 *v4;
  int v5;
  __n128 *v6;
  char *v7;
  int v8;
  unsigned int v9;
  int v10;
  __n128 *v11;
  char *v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  __n128 v16;
  int v17;
  BOOL v18;
  int v19;
  unsigned int v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  int32x4_t v25;
  double v26;
  double v27;
  double v28;
  int32x4_t v29;
  int v30;
  int v31;
  __n128 *v32;
  int v33;
  unsigned int v34;
  unsigned int v35;
  __n128 *v36;
  uint64_t v37;
  int v38;
  unsigned int v39;
  unsigned int v40;
  uint64_t v41;
  BOOL v42;
  uint64_t v43;
  BOOL v44;
  char *v45;
  int *v46;
  uint64_t v47;
  size_t v48;
  size_t v49;
  _BYTE *v50;
  _DWORD *v51;
  uint64_t v52;
  unsigned int v53;
  char v55;
  __n128 *v56;
  __n128 *v57;
  unsigned int *v58;
  unsigned int *v59;
  unint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  int v65;
  int v66;
  _DWORD *v67;
  int v68;
  unsigned int v69;
  int v70;
  uint64_t v71;
  int v72;
  int v75;
  int v76;
  BOOL v77;
  BOOL v78;
  BOOL v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  __int128 *v83;
  unint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  __n128 *v88;
  RB::DisplayList::EditAdaptor *v89;
  unsigned int v90;
  char v91;
  _QWORD *v92;
  int v93;
  __n128 v94;
  int v95;
  __n128 v96;
  RB::DisplayList::Interpolator::Layer *v97;
  int v98;
  unsigned __int8 *v99;
  unsigned int *v100;
  char *v101;
  char v102;
  unsigned int v103;
  unsigned __int8 v104;
  __n128 v105;
  __n128 v106;
  unsigned int v107;
  unsigned int v108;
  _BYTE __dst[64];
  _BYTE *v110;
  size_t v111;
  unint64_t v112;
  uint64_t v113;

  v113 = *MEMORY[0x24BDAC8D0];
  if (!*((_BYTE *)this + 234))
    return;
  v3 = this;
  v4 = (__n128 *)(a2 + 25);
  v5 = *((_DWORD *)a2 + 60);
  if (*((_DWORD *)a2 + 61) < (v5 + 1))
  {
    RB::vector<RB::Rect,2ul,unsigned int>::reserve_slow(v4, v5 + 1);
    v5 = *((_DWORD *)a2 + 60);
  }
  v6 = (__n128 *)a2[29];
  if (!v6)
    v6 = v4;
  v7 = (char *)&v6[v5];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v8 = *((_DWORD *)a2 + 60);
  v9 = *((_DWORD *)a2 + 61);
  v10 = v8 + 1;
  *((_DWORD *)a2 + 60) = v8 + 1;
  if (v9 < v8 + 2)
  {
    RB::vector<RB::Rect,2ul,unsigned int>::reserve_slow(v4, v8 + 2);
    v10 = *((_DWORD *)a2 + 60);
  }
  v11 = (__n128 *)a2[29];
  if (!v11)
    v11 = v4;
  v12 = (char *)&v11[v10];
  *(_QWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = 0;
  ++*((_DWORD *)a2 + 60);
  if (!*((_BYTE *)v3 + 235) && (*((_BYTE *)v3 + 233) & 8) == 0)
  {
    v13 = **a2;
    v14 = *((unsigned __int8 *)v3 + 224);
    if (!*((_BYTE *)v3 + 224))
      v14 = *(unsigned __int8 *)(v13 + 12);
    v15 = *((_DWORD *)v3 + 57);
    if (v15 == 0x80000000)
      v15 = *(_DWORD *)(v13 + 16);
    if (!RB::DisplayList::EditAdaptor::finalize_group((uint64_t)v3, (RB::DisplayList::Interpolator::Layer *)a2, v14, v15, 0, *(unsigned int ***)v3, *((_DWORD *)v3 + 2), *((unsigned int ***)v3 + 2), *((_DWORD *)v3 + 6))&& !*((_BYTE *)a2 + 251)&& !((_DWORD)a2[24] & 0x200 | *((_BYTE *)v3 + 233) & 8))
    {
      RB::DisplayList::Interpolator::Layer::failed((uint64_t)a2);
      return;
    }
    goto LABEL_125;
  }
  v108 = 0;
  v107 = 0;
  v110 = 0;
  v111 = 0;
  v112 = 8;
  v106 = 0uLL;
  v105 = 0uLL;
  v17 = *((_DWORD *)v3 + 6);
  v18 = v17 != 0;
  if (*((_DWORD *)v3 + 2) | v17)
  {
    v19 = 0;
    v20 = 0;
    v92 = (_QWORD *)((char *)v3 + 16);
    v91 = 1;
    v88 = v4;
    v89 = v3;
    do
    {
      if (v18)
        LODWORD(v21) = *(_DWORD *)(*v92 + 24 * v20 + 8);
      else
        LODWORD(v21) = 0;
      v104 = 0;
      v103 = 0x80000000;
      v102 = 0;
      v97 = (RB::DisplayList::Interpolator::Layer *)a2;
      v98 = v19;
      v99 = &v104;
      v100 = &v103;
      v101 = &v102;
      RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_0::operator()<RB::vector<RB::DisplayList::EditAdaptor::Element,0ul,unsigned int>,unsigned int>((uint64_t)&v97, (uint64_t)v3, &v108, (uint64_t)&v95);
      RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_0::operator()<RB::vector<RB::DisplayList::EditAdaptor::Element,0ul,unsigned int>,unsigned int>((uint64_t)&v97, (uint64_t)v92, &v107, (uint64_t)&v93);
      RB::Rect::Union((float32x2_t *)&v106, (float32x2_t)v96.n128_u64[0], *(float32x2_t *)&v96.n128_i8[8], v22, v23, v24, v25);
      RB::Rect::Union((float32x2_t *)&v105, (float32x2_t)v94.n128_u64[0], *(float32x2_t *)&v94.n128_i8[8], v26, v27, v28, v29);
      if (v102)
      {
        if (v95)
        {
          v30 = *((_DWORD *)a2 + 60);
          v31 = v30;
          if (*((_DWORD *)a2 + 61) < (v30 + 1))
          {
            RB::vector<RB::Rect,2ul,unsigned int>::reserve_slow(v4, v30 + 1);
            v31 = *((_DWORD *)a2 + 60);
          }
          v32 = (__n128 *)a2[29];
          if (!v32)
            v32 = v4;
          v32[v31] = v96;
          ++*((_DWORD *)a2 + 60);
        }
        else
        {
          v30 = 0;
        }
        v34 = v93;
        if (v93)
        {
          v33 = *((_DWORD *)a2 + 60);
          v35 = v33;
          if (*((_DWORD *)a2 + 61) < (v33 + 1))
          {
            RB::vector<RB::Rect,2ul,unsigned int>::reserve_slow(v4, v33 + 1);
            v35 = *((_DWORD *)a2 + 60);
          }
          v36 = (__n128 *)a2[29];
          if (!v36)
            v36 = v4;
          v36[v35] = v94;
          ++*((_DWORD *)a2 + 60);
        }
        else
        {
          v33 = 1;
        }
      }
      else
      {
        v30 = 0;
        v33 = 1;
        v34 = v93;
      }
      if (v34)
        v21 = v21;
      else
        v21 = 0xFFFFFFFLL;
      v37 = **a2;
      v38 = v104;
      if (!v104)
      {
        v38 = *(unsigned __int8 *)(v37 + 12);
        v104 = *(_BYTE *)(v37 + 12);
      }
      v39 = v103;
      if (v103 == 0x80000000)
      {
        v39 = *(_DWORD *)(v37 + 16);
        v103 = v39;
      }
      v40 = v108;
      v20 = v107;
      if (v95 | v34)
      {
        v41 = *((unsigned int *)a2 + 46);
        v90 = v108;
        v42 = RB::DisplayList::EditAdaptor::finalize_group((uint64_t)v3, (RB::DisplayList::Interpolator::Layer *)a2, v38, v39, (const RB::DisplayList::Item *)v21, (unsigned int **)(*(_QWORD *)v3 + 24 * (v108 - v95)), v95, (unsigned int **)(*((_QWORD *)v3 + 2) + 24 * (v107 - v34)), v34);
        v43 = *((unsigned int *)a2 + 46);
        v44 = v33 == 1 && v30 == 0;
        if (!v44 && v41 < v43)
        {
          v45 = (char *)a2[22];
          if (!v45)
            v45 = (char *)(a2 + 2);
          v46 = (int *)&v45[40 * v41 + 28];
          v47 = v43 - v41;
          do
          {
            *(v46 - 1) = v30;
            *v46 = v33;
            v46 += 10;
            --v47;
          }
          while (v47);
        }
        if ((_DWORD)v21 == 0xFFFFFFF && v41 < v43)
        {
          v48 = v111;
          v49 = v111 + 1;
          if (v112 < v111 + 1)
          {
            RB::vector<RBDevice *,8ul,unsigned long>::reserve_slow(__dst, v49);
            v48 = v111;
            v49 = v111 + 1;
          }
          v50 = v110;
          if (!v110)
            v50 = __dst;
          v51 = &v50[8 * v48];
          *v51 = v41;
          v51[1] = v43;
          v111 = v49;
        }
        v91 &= !v42;
        v3 = v89;
        v52 = *((unsigned int *)v89 + 50);
        if ((_DWORD)v52)
          bzero(*((void **)v89 + 24), 4 * v52);
        v4 = v88;
        v40 = v90;
      }
      ++v19;
      v53 = *((_DWORD *)v3 + 6);
      v18 = v20 < v53;
    }
    while (v40 < *((_DWORD *)v3 + 2) || v20 < v53);
  }
  else
  {
    v91 = 1;
  }
  if ((v91 & 1) == 0 || *((_BYTE *)a2 + 251) || (_DWORD)a2[24] & 0x200 | *((_BYTE *)v3 + 233) & 8)
  {
    v56 = (__n128 *)a2[29];
    if (!v56)
      v56 = v4;
    *v56 = v106;
    v57 = (__n128 *)a2[29];
    if (!v57)
      v57 = v4;
    v16 = v105;
    v57[1] = v105;
    v58 = (unsigned int *)v110;
    if (!v110)
      v58 = (unsigned int *)__dst;
    if (v111)
    {
      v59 = &v58[2 * v111];
      do
      {
        v60 = *v58;
        v61 = (char *)a2[22];
        if (!v61)
          v61 = (char *)(a2 + 2);
        v62 = *((unsigned int *)a2 + 46);
        if ((_DWORD)v62)
        {
          v63 = &v61[40 * v60];
          v64 = 40 * v62;
          v65 = *((_DWORD *)v63 + 2);
          v66 = *((_DWORD *)v63 + 3);
          v67 = v61 + 12;
          v68 = 0x7FFFFFFF;
          v69 = 536870910;
          v70 = 0x7FFFFFFF;
          do
          {
            v71 = *(_QWORD *)(v67 - 3);
            v72 = v71 & 0xF;
            if ((~(_DWORD)v71 & 0xFFFFFFF0) != 0 && v72 != 1 && v72 != 8)
            {
              v75 = *(v67 - 1) - v65;
              v76 = *v67 - v66;
              v77 = v75 >= 1 && v75 < v70;
              if (v77 || (!v75 ? (v78 = v76 < 1) : (v78 = 1), !v78 ? (v79 = v76 < v68) : (v79 = 0), v79))
              {
                v69 = v71 >> 4;
                v70 = *(v67 - 1) - v65;
                v68 = *v67 - v66;
              }
            }
            v67 += 10;
            v64 -= 40;
          }
          while (v64);
        }
        else
        {
          v69 = 536870910;
        }
        if (v60 < v58[1])
        {
          v80 = 16 * v69;
          v81 = 40 * v60;
          do
          {
            v82 = (char *)a2[22];
            if (!v82)
              v82 = (char *)(a2 + 2);
            *(_QWORD *)&v82[v81] = *(_QWORD *)&v82[v81] & 0xFFFFFFFF0000000FLL | v80;
            ++v60;
            v81 += 40;
          }
          while (v60 < v58[1]);
        }
        v58 += 2;
      }
      while (v58 != v59);
    }
    v55 = 1;
  }
  else
  {
    RB::DisplayList::Interpolator::Layer::failed((uint64_t)a2);
    v55 = 0;
  }
  if (v110)
    free(v110);
  if ((v55 & 1) != 0)
  {
LABEL_125:
    if (a2[22])
      v83 = (__int128 *)a2[22];
    else
      v83 = (__int128 *)(a2 + 2);
    v84 = *((unsigned int *)a2 + 46);
    if (v84 < 0x81)
    {
      v85 = 0;
      v87 = 0;
    }
    else
    {
      v85 = (uint64_t *)std::get_temporary_buffer[abi:nn180100]<RB::DisplayList::Interpolator::Op>(v84);
      v87 = v86;
    }
    std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>(v83, (__int128 *)((char *)v83 + 40 * v84), v84, v85, v87, v16);
    if (v85)
      operator delete(v85);
  }
}

void sub_209BBE65C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 - 120);
  if (v3)
    free(v3);
  _Unwind_Resume(exception_object);
}

BOOL RB::DisplayList::EditAdaptor::finalize_group(uint64_t a1, RB::DisplayList::Interpolator::Layer *a2, int a3, unsigned int a4, const RB::DisplayList::Item *a5, unsigned int **a6, unsigned int a7, unsigned int **a8, unsigned int a9)
{
  unsigned int v9;
  unsigned int **v10;
  unsigned int v14;
  int v15;
  int v16;
  char *v17;
  char *v18;
  unsigned int *v19;
  int v20;
  char *v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int **v31;
  unsigned int v32;
  int matrix_value;
  int v34;
  int v35;
  unsigned int v36;
  int v37;
  int v38;
  unsigned int *v39;
  unsigned int *v40;
  _DWORD *v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int *v45;
  unsigned int v46;
  unsigned int *v47;
  unsigned int v48;
  int v49;
  int v50;
  unsigned int *v51;
  unsigned int *v52;
  _DWORD *v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  unsigned int *v58;
  unsigned int *v59;
  char *v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  unsigned int **v64;
  uint64_t v65;
  unsigned int v66;
  int v67;
  uint64_t v68;
  size_t v69;
  _DWORD *v70;
  _DWORD *v71;
  int v72;
  unint64_t v73;
  char v74;
  uint64_t v75;
  unsigned int **v76;
  unsigned int v77;
  int v78;
  unsigned int v79;
  _BOOL4 v80;
  int v81;
  char *v82;
  char *v83;
  unsigned int v84;
  unint64_t v85;
  uint64_t v86;
  unsigned int v87;
  unsigned int v88;
  int v89;
  unsigned int v90;
  uint64_t v91;
  _DWORD *v92;
  int v93;
  _DWORD *v94;
  unsigned int v95;
  unsigned int v96;
  int v97;
  unsigned int *v98;
  unsigned int *v99;
  _DWORD *v100;
  int v101;
  unsigned int v102;
  unsigned int v103;
  unsigned int *v104;
  unsigned int v105;
  unsigned int *v106;
  unsigned int v107;
  int v108;
  unsigned int *v109;
  unsigned int *v110;
  _DWORD *v111;
  int v112;
  unsigned int v113;
  unsigned int v114;
  unsigned int *v115;
  unsigned int *v116;
  int v117;
  int v118;
  unsigned int *v119;
  unsigned int *v120;
  _DWORD *v121;
  unsigned int v122;
  unsigned int v123;
  unsigned int v124;
  unsigned int *v125;
  unsigned int v126;
  unsigned int *v127;
  int v128;
  int v129;
  unsigned int v130;
  unsigned int v131;
  BOOL v132;
  unsigned int *v133;
  unsigned int v134;
  unsigned int **v135;
  uint64_t v136;
  unsigned int **v137;
  unsigned int **v138;
  unsigned int **v139;
  unsigned int v140;
  uint64_t v141;
  unsigned int **v142;
  unsigned int **v143;
  unsigned int **v144;
  uint64_t v145;
  __int128 v146;
  unsigned int **v147;
  unsigned int **v148;
  unsigned int **v149;
  uint64_t v150;
  __int128 v151;
  uint64_t v152;
  unsigned int v153;
  unsigned int v154;
  unsigned int **v155;
  unsigned int **v156;
  unint64_t v157;
  __int128 v158;
  unsigned int **v159;
  uint64_t v160;
  uint64_t v161;
  _BOOL4 v162;
  uint64_t v163;
  int v164;
  char *v165;
  char *v166;
  uint64_t v167;
  int v168;
  int v169;
  _BOOL4 v170;
  uint64_t v171;
  uint64_t v172;
  char *v173;
  float v174;
  float v175;
  uint64_t *v176;
  uint64_t *v177;
  uint64_t *v178;
  uint64_t *v179;
  int v180;
  BOOL v181;
  uint64_t v182;
  char v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  float v187;
  unsigned int **v188;
  const RB::Transition *v189;
  const RB::DisplayList::Item *v190;
  uint64_t animation;
  int v192;
  RB::Animation *v193;
  int v194;
  char *v195;
  unsigned int **v196;
  char *v197;
  char *v198;
  unsigned int *v199;
  int v200;
  char *v201;
  BOOL v202;
  unsigned int v203;
  unsigned int v204;
  char v205;
  char v206;
  BOOL v208;
  char *v209;
  EffectOrArg *v210;
  int v211;
  unsigned int arg_low;
  unsigned __int16 v213;
  unsigned __int16 v214;
  double v215;
  float32x2_t v216;
  char *v217;
  float v218;
  float v219;
  float v220;
  unsigned int v221;
  int v222;
  int v223;
  uint64_t v224;
  char v225;
  uint64_t *v226;
  unsigned int v227;
  uint64_t *v228;
  unsigned int v229;
  unsigned int v230;
  unsigned int v231;
  int v232;
  unsigned int *v233;
  unsigned int *v234;
  float v235;
  BOOL v236;
  int v237;
  int v238;
  BOOL v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  int v245;
  const RB::DisplayList::Interpolator::Layer *v246;
  unsigned int **v247;
  const RB::Transition *v248;
  char v249;
  const RB::DisplayList::Item *v250;
  uint64_t v251;
  RB::DisplayList::Interpolator::Layer *v252;
  int v253;
  BOOL v254;
  unsigned int **v255;
  char *v256;
  uint64_t *v257;
  unsigned int *v258;
  unsigned int v259;
  char *v260;
  char *v261;
  unsigned int v262;
  unsigned int v263;
  char v264;
  char v265;
  BOOL v267;
  char *v268;
  EffectOrArg *v269;
  int v270;
  unsigned int v271;
  unsigned __int16 v272;
  unsigned __int16 v273;
  double v274;
  float32x2_t v275;
  char *v276;
  float v277;
  float v278;
  float v279;
  unsigned int v280;
  int v281;
  int v282;
  uint64_t v283;
  char v284;
  uint64_t *v285;
  unsigned int v286;
  uint64_t *v287;
  unsigned int v288;
  unsigned int v289;
  unsigned int v290;
  int v291;
  _DWORD *v292;
  int *v293;
  uint64_t v294;
  float v295;
  BOOL v296;
  unsigned int v297;
  RB::Animation *v298;
  char *v299;
  int v300;
  int v301;
  BOOL v302;
  unsigned int v303;
  float v304;
  unsigned int v305;
  char *v306;
  char *v307;
  char *v308;
  _BOOL4 v309;
  unsigned int v310;
  char *v311;
  char *v312;
  unsigned int v313;
  char *v314;
  char *v315;
  char *v316;
  int v317;
  int v318;
  int v319;
  int v320;
  unint64_t v321;
  uint64_t v322;
  uint64_t v323;
  char *v324;
  RB::DisplayList::Interpolator::Layer *v325;
  float *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  unsigned int *v330;
  unsigned int v331;
  char *v332;
  float v333;
  float v334;
  float v335;
  unsigned int v336;
  float32x2_t v337;
  float32x2_t v338;
  float v339;
  float32x2_t v340;
  float32x2_t v341;
  float v342;
  float v343;
  BOOL v345;
  float *v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  _DWORD *v350;
  int v351;
  char *v352;
  float v353;
  float v354;
  float v355;
  unsigned int v356;
  float32x2_t v357;
  float32x2_t v358;
  float v359;
  float32x2_t v360;
  float32x2_t v361;
  float v362;
  float v363;
  BOOL v365;
  unsigned int **v367;
  unsigned int **v368;
  unsigned int v369;
  __int128 v370;
  unsigned int **v371;
  _BOOL4 v372;
  _BOOL4 v373;
  RB::Animation *v374;
  unint64_t v375;
  char *v376;
  unsigned int v377;
  uint64_t v378;
  int v379;
  uint64_t v380;
  unsigned int *v381;
  uint64_t v382;
  uint64_t v383;
  int v384;
  char *v385;
  unsigned int **v386;
  unsigned int v387;
  uint64_t v388;
  unsigned int *v389;
  uint64_t v390;
  uint64_t v391;
  unsigned int v392;
  unsigned int v393;
  RB::DisplayList::AtomizedItems *v394;
  RB::DisplayList::AtomizedItems *v395;
  char *v396;
  int v398;
  BOOL v399;
  RB::DisplayList::Interpolator::Layer *v401;
  unint64_t v402;
  unsigned int *v403;
  _BOOL4 v404;
  void *v405;
  uint64_t *v406;
  unsigned int *v407;
  int *v408;
  int v409;
  uint64_t v410;
  uint64_t v411[2];
  unsigned int **v412;
  unsigned int **v413;
  unsigned int v414;
  _DWORD *v415;
  char *v416;
  uint64_t v417;
  RB::DisplayList::Interpolator::Layer *v418;
  unsigned int ***v419;
  unsigned int ***v420;
  int *v421;
  void **v422;
  uint64_t *v423;
  void *v424;
  uint64_t v425;
  void *v426;
  uint64_t v427;
  _DWORD __dst[32];
  void *v429;
  uint64_t v430;
  __int128 v431;
  unint64_t v432;
  uint64_t v433;

  v9 = a7;
  v10 = a6;
  LODWORD(v386) = a9;
  v433 = *MEMORY[0x24BDAC8D0];
  v412 = a8;
  v413 = a6;
  v378 = (16 * (_DWORD)a5);
  if (a7)
  {
    do
    {
      v14 = *((unsigned __int16 *)*v10 + 23);
      v15 = (v14 >> 11) & 1;
      if ((v14 & 0x800) == 0)
        break;
      v16 = *((_DWORD *)a2 + 46);
      if (*((_DWORD *)a2 + 47) < (v16 + 1))
      {
        RB::vector<RB::DisplayList::Interpolator::Op,4ul,unsigned int>::reserve_slow((char *)a2 + 16, v16 + 1);
        v16 = *((_DWORD *)a2 + 46);
      }
      v17 = (char *)*((_QWORD *)a2 + 22);
      if (!v17)
        v17 = (char *)a2 + 16;
      v18 = &v17[40 * v16];
      v19 = v10[1];
      *(_QWORD *)v18 = 0x1000000000;
      *((_QWORD *)v18 + 1) = v19;
      *((_OWORD *)v18 + 1) = xmmword_209BDA4F0;
      *((_QWORD *)v18 + 4) = 0;
      v20 = *((_DWORD *)a2 + 46);
      *((_DWORD *)a2 + 46) = v20 + 1;
      v21 = (char *)*((_QWORD *)a2 + 22);
      if (!v21)
        v21 = (char *)a2 + 16;
      *(_QWORD *)&v21[40 * v20] = *(_QWORD *)&v21[40 * v20] & 0xFFFFFFFF0000000FLL | v378;
      *((_DWORD *)a2 + 48) |= 1u;
      RB::DisplayList::Interpolator::Layer::merge_tail((uint64_t)a2);
      v10 = v413 + 3;
      v413 += 3;
      --v9;
    }
    while (v9);
    v22 = a4;
  }
  else
  {
    v22 = a4;
    LOBYTE(v15) = 1;
  }
  v396 = (char *)a2 + 16;
  v391 = *((unsigned int *)a2 + 46);
  v411[0] = a1;
  v411[1] = (uint64_t)a2;
  v401 = a2;
  if (a3 == 1 && v22)
  {
    LOBYTE(v409) = 1;
    if (a9)
    {
      v23 = v9;
      if (v9)
      {
        while (1)
        {
          __dst[0] = 0;
          LODWORD(v405) = 0;
          v410 = 0;
          v414 = a5;
          v415 = __dst;
          v416 = (char *)&v410 + 4;
          v417 = a1;
          v418 = a2;
          v419 = &v413;
          v420 = &v412;
          v421 = &v409;
          v422 = &v405;
          v423 = &v410;
          v24 = v23;
          LOBYTE(v409) = 0;
          if (!RB::lcs_diff<RB::DisplayList::EditAdaptor::Element,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int)::$_0,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int)::$_1>(v23, v413, v386, v412, (unsigned int *)(2 * v22), v411, &v414))
          {
            v60 = (char *)a2 + 16;
            v61 = a1;
            goto LABEL_103;
          }
          v25 = __dst[0];
          if (__dst[0] < v24)
          {
            v26 = HIDWORD(v410);
            do
            {
              RB::DisplayList::EditAdaptor::mix_elements(a1, (uint64_t)a2, a5, (uint64_t)&v413[3 * v25], (uint64_t)&v412[3 * v26]);
              v25 = __dst[0] + 1;
              __dst[0] = v25;
              v26 = ++HIDWORD(v410);
            }
            while (v25 < v24);
          }
          LODWORD(v386) = v410;
          if (!(_BYTE)v409 || !(_DWORD)v410)
            break;
          v23 = v405;
          if (!(_DWORD)v405)
            goto LABEL_102;
        }
        v23 = v405;
      }
    }
    else
    {
      v23 = v9;
    }
LABEL_102:
    v60 = (char *)a2 + 16;
    v61 = a1;
    v24 = v23;
    if (v23 + v386 > a4)
    {
LABEL_103:
      v82 = (char *)*((_QWORD *)a2 + 22);
      if (!v82)
        v82 = v60;
      v83 = &v82[40 * v391];
      v84 = *((_DWORD *)a2 + 46);
      v85 = 0xCCCCCCCCCCCCCCCDLL * ((40 * v84 - 40 * v391) >> 3);
      v86 = v84 - v85;
      *((_DWORD *)a2 + 46) = v86;
      if ((_DWORD)v391 != (_DWORD)v86)
        memmove(v83, &v83[40 * v85], 40 * (v86 - v391));
    }
    goto LABEL_210;
  }
  v410 = 0;
  v426 = 0;
  v427 = 0x8000000000;
  v409 = 0;
  v405 = (char *)&v410 + 4;
  v406 = &v410;
  v407 = &v414;
  v408 = &v409;
  v27 = 1;
  v28 = 1;
  switch(a3)
  {
    case 2:
      v392 = v9;
      v402 = v9;
      if (v9 >= (unint64_t)a9)
        v29 = a9;
      else
        v29 = v9;
      if (v29)
      {
        v30 = 0;
        v31 = v412;
        do
        {
          v32 = *((_DWORD *)v10 + 4) + *((_DWORD *)v31 + 4);
          matrix_value = (*(_DWORD *)(*(_QWORD *)(a1 + 192) + 4 * (v32 >> 3)) >> (4 * (v32 & 7))) & 0xF;
          if (!matrix_value)
            matrix_value = RB::DisplayList::EditAdaptor::make_matrix_value(a1, a2, (uint64_t *)v10, (uint64_t *)v31);
          if (matrix_value == 1)
          {
            v34 = HIDWORD(v410);
            v35 = v30 - HIDWORD(v410);
            if ((_DWORD)v30 == HIDWORD(v410))
            {
              v36 = v410;
              v37 = v30;
            }
            else
            {
              v38 = v427;
              if ((_DWORD)v427
                && (v426 ? (v39 = (unsigned int *)v426) : (v39 = &v414),
                    v40 = &v39[3 * (v427 - 1)],
                    v43 = v40[2],
                    v41 = v40 + 2,
                    v42 = v43,
                    __PAIR64__(v43 + v39[3 * (v427 - 1)], v39[3 * (v427 - 1) + 1] + v43) == v410))
              {
                *v41 = v30 + v42 - HIDWORD(v410);
              }
              else
              {
                v44 = v427 + 1;
                if (HIDWORD(v427) < (v427 + 1))
                {
                  RB::vector<RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::Mixed,128ul,unsigned int>::reserve_slow(&v414, v44);
                  v38 = v427;
                  v44 = v427 + 1;
                }
                v45 = (unsigned int *)v426;
                if (!v426)
                  v45 = &v414;
                v46 = v410;
                v47 = &v45[3 * v38];
                *v47 = HIDWORD(v410);
                v47[1] = v46;
                v47[2] = v30 - v34;
                LODWORD(v427) = v44;
              }
              v37 = HIDWORD(v410) + v35;
              v36 = v30 + v410 - v34;
              v409 = v30 + v409 - v34;
              LODWORD(v410) = v36;
            }
            v48 = v37 + 1;
            HIDWORD(v410) = v48;
            if ((_DWORD)v30 == v36)
            {
              v49 = v30;
            }
            else
            {
              v50 = v427;
              if ((_DWORD)v427
                && (v426 ? (v51 = (unsigned int *)v426) : (v51 = &v414),
                    (v52 = &v51[3 * (v427 - 1)],
                     v55 = v52[2],
                     v53 = v52 + 2,
                     v54 = v55,
                     v55 + v51[3 * (v427 - 1)] == v48)
                 && v51[3 * (v427 - 1) + 1] + v54 == v36))
              {
                *v53 = v30 + v54 - v36;
              }
              else
              {
                v56 = v427 + 1;
                if (HIDWORD(v427) < (v427 + 1))
                {
                  RB::vector<RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::Mixed,128ul,unsigned int>::reserve_slow(&v414, v56);
                  v50 = v427;
                  v56 = v427 + 1;
                  v57 = v410;
                  v48 = HIDWORD(v410);
                }
                else
                {
                  v57 = v36;
                }
                v58 = (unsigned int *)v426;
                if (!v426)
                  v58 = &v414;
                v59 = &v58[3 * v50];
                *v59 = v48;
                v59[1] = v57;
                v59[2] = v30 - v36;
                LODWORD(v427) = v56;
              }
              HIDWORD(v410) = v30 + HIDWORD(v410) - v36;
              v49 = v410 + v30 - v36;
              v409 = v30 + v409 - v36;
            }
            LODWORD(v410) = v49 + 1;
          }
          ++v30;
          v31 += 3;
          v10 += 3;
        }
        while (v29 != v30);
      }
      v79 = a9;
      v9 = v392;
      v80 = v392 > a9;
      if (v402 > a9)
        v79 = v402;
      v81 = v79 - v29;
      v22 = a4;
      goto LABEL_167;
    case 3:
      v62 = v9;
      v431 = 0u;
      v432 = 128;
      if (a9 && v9)
      {
        v63 = 0;
        v64 = &v412[3 * a9 - 3];
        v65 = (uint64_t)&v10[3 * v9 - 3];
        do
        {
          v66 = *(_DWORD *)(v65 + 16) + *((_DWORD *)v64 + 4);
          v67 = (*(_DWORD *)(*(_QWORD *)(a1 + 192) + 4 * (v66 >> 3)) >> (4 * (v66 & 7))) & 0xF;
          if (!v67)
            v67 = RB::DisplayList::EditAdaptor::make_matrix_value(a1, a2, (uint64_t *)v65, (uint64_t *)v64);
          if (v67 == 1)
          {
            v68 = *((_QWORD *)&v431 + 1);
            v69 = *((_QWORD *)&v431 + 1) + 1;
            if (v432 < *((_QWORD *)&v431 + 1) + 1)
            {
              RB::vector<double,128ul,unsigned long>::reserve_slow(__dst, v69);
              v68 = *((_QWORD *)&v431 + 1);
              v69 = *((_QWORD *)&v431 + 1) + 1;
            }
            v70 = (_DWORD *)v431;
            if (!(_QWORD)v431)
              v70 = __dst;
            v71 = &v70[2 * v68];
            *v71 = v9 - 1 + v63;
            v71[1] = a9 - 1 + v63;
            *((_QWORD *)&v431 + 1) = v69;
          }
          v72 = v63 - 1;
          if ((unint64_t)a9 + v63 < 2)
            break;
          v73 = v9 + v63;
          v64 -= 3;
          v65 -= 24;
          --v63;
        }
        while (v73 > 1);
        v87 = a9;
        v88 = a9 + v72;
        v62 = v9 + v72;
      }
      else
      {
        v87 = a9;
        v88 = a9;
      }
      if (v9 <= v87)
        v89 = v88;
      else
        v89 = v62;
      RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::$_2::operator()(&v405, v9 > v87, 0, v89);
      if (*((_QWORD *)&v431 + 1))
      {
        v90 = HIDWORD(v410);
        v91 = *((_QWORD *)&v431 + 1) - 1;
        do
        {
          v92 = (_DWORD *)v431;
          if (!(_QWORD)v431)
            v92 = __dst;
          v94 = &v92[2 * v91];
          v93 = v94[1];
          v95 = *v94 - v90;
          if (*v94 == v90)
          {
            v96 = v410;
          }
          else
          {
            v97 = v427;
            if ((_DWORD)v427
              && (v426 ? (v98 = (unsigned int *)v426) : (v98 = &v414),
                  (v99 = &v98[3 * (v427 - 1)],
                   v102 = v99[2],
                   v100 = v99 + 2,
                   v101 = v102,
                   v102 + v98[3 * (v427 - 1)] == v90)
               && v98[3 * (v427 - 1) + 1] + v101 == (_DWORD)v410))
            {
              *v100 = v101 + v95;
            }
            else
            {
              v103 = v427 + 1;
              if (HIDWORD(v427) < (v427 + 1))
              {
                RB::vector<RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::Mixed,128ul,unsigned int>::reserve_slow(&v414, v103);
                v97 = v427;
                v103 = v427 + 1;
                v90 = HIDWORD(v410);
              }
              v104 = (unsigned int *)v426;
              if (!v426)
                v104 = &v414;
              v105 = v410;
              v106 = &v104[3 * v97];
              *v106 = v90;
              v106[1] = v105;
              v106[2] = v95;
              LODWORD(v427) = v103;
            }
            v90 = HIDWORD(v410) + v95;
            v96 = v410 + v95;
            v409 += v95;
            LODWORD(v410) = v410 + v95;
          }
          HIDWORD(v410) = ++v90;
          v107 = v93 - v96;
          if (v93 != v96)
          {
            v108 = v427;
            if ((_DWORD)v427
              && (v426 ? (v109 = (unsigned int *)v426) : (v109 = &v414),
                  (v110 = &v109[3 * (v427 - 1)],
                   v113 = v110[2],
                   v111 = v110 + 2,
                   v112 = v113,
                   v113 + v109[3 * (v427 - 1)] == v90)
               && v109[3 * (v427 - 1) + 1] + v112 == v96))
            {
              *v111 = v112 + v107;
            }
            else
            {
              v114 = v427 + 1;
              if (HIDWORD(v427) < (v427 + 1))
              {
                RB::vector<RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::Mixed,128ul,unsigned int>::reserve_slow(&v414, v114);
                v108 = v427;
                v114 = v427 + 1;
                v96 = v410;
                v90 = HIDWORD(v410);
              }
              v115 = (unsigned int *)v426;
              if (!v426)
                v115 = &v414;
              v116 = &v115[3 * v108];
              *v116 = v90;
              v116[1] = v96;
              v116[2] = v107;
              LODWORD(v427) = v114;
            }
            v90 = HIDWORD(v410) + v107;
            HIDWORD(v410) += v107;
            v93 = v410 + v107;
            v409 += v107;
          }
          LODWORD(v410) = v93 + 1;
          --v91;
        }
        while (v91 != -1);
      }
      if ((_QWORD)v431)
        free((void *)v431);
      v74 = 0;
      v22 = a4;
      goto LABEL_169;
    case 4:
      goto LABEL_84;
    case 5:
      v28 = 0;
      goto LABEL_84;
    case 6:
      v27 = 0;
LABEL_84:
      RB::prefix_suffix_diff<RB::DisplayList::EditAdaptor::Element,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int)::$_0,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int)::$_2>(v9, (uint64_t)v10, a9, (uint64_t)v412, (uint64_t)v411, &v405, v27, v28);
      goto LABEL_168;
    case 7:
      if (v9 != a9)
        goto LABEL_107;
      v74 = a9;
      if (!a9)
        goto LABEL_169;
      v75 = v9;
      v76 = v412;
      break;
    default:
      if ((v15 & 1) == 0)
        HIDWORD(v410) = v9;
      if (a9)
        LODWORD(v410) = a9;
      v74 = 1;
      goto LABEL_169;
  }
  while (1)
  {
    v77 = *((_DWORD *)v10 + 4) + *((_DWORD *)v76 + 4);
    v78 = (*(_DWORD *)(*(_QWORD *)(a1 + 192) + 4 * (v77 >> 3)) >> (4 * (v77 & 7))) & 0xF;
    if (!v78)
      v78 = RB::DisplayList::EditAdaptor::make_matrix_value(a1, a2, (uint64_t *)v10, (uint64_t *)v76);
    if (v78 == 1)
      break;
    v74 = 0;
    v76 += 3;
    v10 += 3;
    if (!--v75)
      goto LABEL_169;
  }
LABEL_107:
  if ((v15 & 1) != 0)
  {
    v80 = 0;
    LODWORD(v29) = 0;
  }
  else
  {
    v117 = HIDWORD(v410);
    if (HIDWORD(v410))
    {
      v118 = v427;
      if ((_DWORD)v427
        && (v426 ? (v119 = (unsigned int *)v426) : (v119 = &v414),
            v120 = &v119[3 * (v427 - 1)],
            v123 = v120[2],
            v121 = v120 + 2,
            v122 = v123,
            __PAIR64__(v123 + v119[3 * (v427 - 1)], v119[3 * (v427 - 1) + 1] + v123) == v410))
      {
        *v121 = v122 - HIDWORD(v410);
      }
      else
      {
        v124 = v427 + 1;
        if (HIDWORD(v427) < (v427 + 1))
        {
          RB::vector<RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::Mixed,128ul,unsigned int>::reserve_slow(&v414, v124);
          v118 = v427;
          v124 = v427 + 1;
        }
        v125 = (unsigned int *)v426;
        if (!v426)
          v125 = &v414;
        v126 = v410;
        v127 = &v125[3 * v118];
        *v127 = HIDWORD(v410);
        v127[1] = v126;
        v127[2] = -v117;
        LODWORD(v427) = v124;
      }
      v128 = HIDWORD(v410) - v117;
      LODWORD(v410) = v410 - v117;
      v409 -= v117;
    }
    else
    {
      v128 = 0;
    }
    v80 = 0;
    LODWORD(v29) = 0;
    HIDWORD(v410) = v128 + v9;
  }
  v81 = a9;
LABEL_167:
  RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::$_2::operator()(&v405, v80, v29, v81);
LABEL_168:
  v74 = 0;
LABEL_169:
  v24 = HIDWORD(v410);
  v129 = v409 + v9 - HIDWORD(v410);
  v409 = v129;
  if (v22 == -1 || (v74 & 1) != 0)
  {
    v61 = a1;
    if ((v74 & 1) == 0)
      goto LABEL_175;
LABEL_201:
    v24 = v9;
    goto LABEL_208;
  }
  v130 = v9 - v129;
  v131 = a9 - v129;
  v132 = v130 > v22 || v131 > v22;
  v61 = a1;
  if (v132)
    goto LABEL_201;
LABEL_175:
  if (v426)
    v133 = (unsigned int *)v426;
  else
    v133 = &v414;
  if ((_DWORD)v427)
  {
    v393 = v9;
    v134 = 0;
    v135 = 0;
    LODWORD(v136) = 0;
    v137 = 0;
    v403 = &v133[3 * v427];
    do
    {
      v138 = (unsigned int **)*v133;
      v139 = (unsigned int **)v133[1];
      v140 = *v133;
      v141 = v133[2];
      v142 = v138;
      if (v134 != (_DWORD)v135)
      {
        if (v134 >= v138)
        {
          v142 = v135;
        }
        else
        {
          v143 = v413;
          v144 = &v413[3 * v134];
          v145 = (uint64_t)v138 - v134;
          do
          {
            v142 = (unsigned int **)((_DWORD)v135 + 1);
            v146 = *(_OWORD *)v144;
            v135 = &v143[3 * v135];
            v135[2] = v144[2];
            *(_OWORD *)v135 = v146;
            v144 += 3;
            LODWORD(v135) = (_DWORD)v142;
            --v145;
          }
          while (v145);
        }
      }
      v147 = v139;
      if ((_DWORD)v136 != (_DWORD)v137)
      {
        if (v136 >= v139)
        {
          v147 = v137;
        }
        else
        {
          v148 = v412;
          v149 = &v412[3 * v136];
          v150 = (uint64_t)v139 - v136;
          do
          {
            v147 = (unsigned int **)((_DWORD)v137 + 1);
            v151 = *(_OWORD *)v149;
            v137 = &v148[3 * v137];
            v137[2] = v149[2];
            *(_OWORD *)v137 = v151;
            v149 += 3;
            LODWORD(v137) = (_DWORD)v147;
            --v150;
          }
          while (v150);
        }
      }
      v386 = v147;
      v152 = v141;
      v153 = v139;
      if ((_DWORD)v141)
      {
        do
        {
          RB::DisplayList::EditAdaptor::mix_elements(a1, (uint64_t)v401, a5, (uint64_t)&v413[3 * v140++], (uint64_t)&v412[3 * v153++]);
          --v152;
        }
        while (v152);
      }
      v134 = v141 + (_DWORD)v138;
      v136 = (v141 + (_DWORD)v139);
      v133 += 3;
      v135 = v142;
      v137 = v386;
      a2 = v401;
      v61 = a1;
    }
    while (v133 != v403);
    v154 = HIDWORD(v410);
    v24 = HIDWORD(v410);
    v9 = v393;
    if (v134 != (_DWORD)v142)
    {
      if (v134 >= HIDWORD(v410))
      {
        v24 = v142;
      }
      else
      {
        v155 = v413;
        v156 = &v413[3 * v134];
        v157 = HIDWORD(v410) - (unint64_t)v134;
        do
        {
          v24 = (_DWORD)v142 + 1;
          v158 = *(_OWORD *)v156;
          v159 = &v155[3 * v142];
          v159[2] = v156[2];
          *(_OWORD *)v159 = v158;
          v156 += 3;
          LODWORD(v142) = (_DWORD)v142 + 1;
          --v157;
        }
        while (v157);
      }
    }
    v160 = v410;
    if ((_DWORD)v136 != (_DWORD)v386)
    {
      if (v136 < v410)
      {
        v367 = v412;
        v368 = &v412[3 * v136];
        v369 = v386;
        do
        {
          ++v136;
          v370 = *(_OWORD *)v368;
          v371 = &v367[3 * v369++];
          v371[2] = v368[2];
          *(_OWORD *)v371 = v370;
          v368 += 3;
        }
        while (v160 != v136);
        LODWORD(v386) = v369;
      }
      goto LABEL_206;
    }
  }
  else
  {
    LODWORD(v160) = v410;
    v154 = HIDWORD(v410);
  }
  LODWORD(v386) = v160;
LABEL_206:
  while (v154 < v9)
  {
    RB::DisplayList::EditAdaptor::mix_elements(v61, (uint64_t)a2, a5, (uint64_t)&v413[3 * v154], (uint64_t)&v412[3 * v160]);
    v154 = HIDWORD(v410) + 1;
    LODWORD(v160) = v410 + 1;
    LODWORD(v410) = v410 + 1;
    HIDWORD(v410) = v154;
  }
LABEL_208:
  v60 = v396;
  v161 = v391;
  if (v426)
  {
    free(v426);
LABEL_210:
    v161 = v391;
  }
  v388 = *((unsigned int *)a2 + 46);
  if ((_DWORD)v388 == (_DWORD)v161)
  {
    v161 = v391;
    v162 = (*(_BYTE *)(v61 + 233) & 4) == 0;
  }
  else
  {
    v162 = 0;
  }
  if (v388 <= v161)
  {
    v170 = 0;
  }
  else
  {
    v163 = v161;
    v164 = 0;
    v165 = (char *)*((_QWORD *)a2 + 22);
    if (!v165)
      v165 = v60;
    v166 = &v165[40 * v163];
    v167 = v388 - v163;
    do
    {
      v168 = *(_DWORD *)v166;
      v166 += 40;
      v164 |= 1 << (v168 & 0xF);
      --v167;
    }
    while (v167);
    v169 = v164 & 0x44;
    v170 = v169 != 0;
    if (v169)
    {
      v171 = 40 * v391;
      v172 = v388 - v391;
      do
      {
        v173 = (char *)*((_QWORD *)a2 + 22);
        if (!v173)
          v173 = v60;
        *(_QWORD *)&v173[v171] |= 0x200000000uLL;
        v171 += 40;
        --v172;
      }
      while (v172);
      v170 = 1;
    }
  }
  v372 = v170;
  if ((*(_BYTE *)(v61 + 233) & 0x10) != 0)
  {
    v174 = 0.0;
    v175 = 0.0;
    if (v24)
    {
      v176 = (uint64_t *)*((_QWORD *)*v413 + 4);
      if (v176)
      {
        v177 = RB::DisplayList::Metadata::numeric_value(v176);
        if (v177)
          v175 = *(float *)v177;
      }
    }
    if ((_DWORD)v386)
    {
      v178 = (uint64_t *)*((_QWORD *)*v412 + 4);
      if (v178)
      {
        v179 = RB::DisplayList::Metadata::numeric_value(v178);
        if (v179)
          v174 = *(float *)v179;
      }
    }
    v404 = v174 < v175;
  }
  else
  {
    v404 = 0;
  }
  v424 = 0;
  v425 = 0x800000000;
  v429 = 0;
  v430 = 0x800000000;
  v405 = 0;
  v406 = 0;
  if (v162)
    v180 = 4;
  else
    v180 = 8;
  v181 = (_DWORD)v386 != 0;
  v373 = v162;
  if (!v24)
  {
    v183 = 0;
    v187 = -INFINITY;
    goto LABEL_338;
  }
  v182 = 0;
  v183 = 0;
  v184 = 0x100000000;
  if (!v162)
    v184 = 0;
  v185 = 0x200000000;
  if (!v372)
    v185 = 0;
  v186 = 0x800000000;
  if (!v404)
    v186 = 0;
  v375 = v378 | ((unint64_t)((_DWORD)v386 == 0) << 34) | v184 | v185 | v186;
  v398 = v180 | 2;
  v187 = -INFINITY;
  v383 = v24;
  v384 = v180;
  do
  {
    v188 = v413;
    v390 = v182;
    v394 = (RB::DisplayList::AtomizedItems *)&v413[3 * v182];
    v189 = RB::DisplayList::AtomizedItems::transition(v394, a2);
    if (RB::Transition::empty_transition(v189, 2)
      || (animation = RB::DisplayList::find_animation(*(RB::DisplayList **)v394, 0, v190),
          (v193 = (RB::Animation *)animation) != 0)
      && !*(_DWORD *)(animation + 32))
    {
      v180 = v384;
      goto LABEL_335;
    }
    v194 = *((_DWORD *)a2 + 46);
    v195 = v396;
    if (*((_DWORD *)a2 + 47) < (v194 + 1))
    {
      LODWORD(animation) = RB::vector<RB::DisplayList::Interpolator::Op,4ul,unsigned int>::reserve_slow(v396, v194 + 1);
      v194 = *((_DWORD *)a2 + 46);
    }
    v196 = &v188[3 * v182];
    v197 = (char *)*((_QWORD *)a2 + 22);
    if (!v197)
      v197 = v396;
    v198 = &v197[40 * v194];
    v199 = v196[1];
    *(_QWORD *)v198 = 0x1000000000;
    *((_QWORD *)v198 + 1) = v199;
    *((_OWORD *)v198 + 1) = xmmword_209BDA4F0;
    *((_QWORD *)v198 + 4) = 0;
    v200 = *((_DWORD *)a2 + 46);
    *((_DWORD *)a2 + 46) = v200 + 1;
    if (*((_QWORD *)a2 + 22))
      v195 = (char *)*((_QWORD *)a2 + 22);
    v379 = v200;
    v201 = &v195[40 * v200];
    *(_QWORD *)v201 = v375 | *(_QWORD *)v201 & 0xFFFFFFF00000000FLL;
    *((_DWORD *)a2 + 48) |= 1u;
    v202 = v181 && (*(_WORD *)(*(_QWORD *)v394 + 46) & 0x3F) == 2;
    v203 = *((_DWORD *)v189 + 12);
    if (!v203)
    {
      v206 = 0;
      goto LABEL_325;
    }
    v376 = v195;
    v374 = v193;
    v204 = 0;
    v205 = 0;
    v206 = 0;
    v381 = (unsigned int *)v196 + 3;
    v208 = (_DWORD)v388 == (_DWORD)v391 || (*((_BYTE *)v189 + 14) + 1) < 2u;
    do
    {
      v209 = (char *)*((_QWORD *)v189 + 5);
      if (!v209)
        v209 = (char *)v189 + 24;
      v210 = (EffectOrArg *)&v209[4 * v204];
      if ((v201[4] & 4) != 0)
        v211 = 16;
      else
        v211 = 32;
      arg_low = LOWORD(v210->arg);
      if (((v211 | v398) & (arg_low >> 8)) == 2)
      {
        v213 = RB::Transition::Effect::anchor_direction((RB::Transition::Effect *)v210, 2u, v404);
        if (v213 >= 0x100u)
        {
          v217 = (char *)*((_QWORD *)v401 + 22);
          if (!v217)
            v217 = v396;
          RB::DisplayList::EditAdaptor::find_motion_projection(a1, (uint64_t)v401, (unsigned int *)v394, v201, v213, (uint64_t)&v217[40 * v391], v388 - v391, (uint64_t)&v405);
          goto LABEL_309;
        }
        v214 = RB::Transition::Effect::sequence_direction((RB::Transition::Effect *)v210, 2u, v404);
        if ((v214 < 0x100u) | v206 & 1)
        {
          v206 |= v214 > 0xFFu;
LABEL_309:
          animation = RB::Transition::Effect::custom_duration((RB::Transition::Effect *)v210, 2, v210 + 1, v215, v216);
          v235 = *(float *)&animation;
          if (v187 >= *(float *)&animation)
            v235 = v187;
          if ((animation & 0xFF00000000) != 0)
            v187 = v235;
          v205 |= (animation & 0xFF00000000) == 0;
          LOWORD(arg_low) = LOWORD(v210->arg);
          v236 = (LOWORD(v210->arg) & 0x7F) == 1 && v208;
          v202 = v202 && v236;
          v203 = *((_DWORD *)v189 + 12);
          goto LABEL_320;
        }
        v218 = 1.0;
        v219 = 0.0;
        v220 = 0.0;
        if ((LOWORD(v210->arg) & 0x80) == 0)
        {
          LOBYTE(v215) = v210->effect.begin_or_insert_animation;
          *(float *)&v221 = (float)LODWORD(v215);
          v220 = *(float *)&v221 * 0.0039216;
          LOBYTE(v221) = v210->effect.dur_or_remove_animation;
          *(float *)&v215 = (float)v221;
          v218 = *(float *)&v215 * 0.0039216;
        }
        v222 = v214;
        v223 = *((_DWORD *)v401 + 46) - 1;
        if (v214 >= 4u)
        {
          if (v214 - 4 < 2)
          {
            v226 = *(uint64_t **)(*(_QWORD *)v394 + 32);
            v227 = *((_DWORD *)v401 + 46) - 1;
            if (v226)
            {
              v228 = RB::DisplayList::Metadata::text_identity(v226);
              v227 = v223;
              if (v228)
              {
                v229 = *(_DWORD *)v228;
                v227 = v223;
                if (*(_DWORD *)v228 >= 4u)
                {
                  v230 = v229 >> 3;
                  v231 = (v229 >> 2) - 1;
                  if (v231 >= *v381)
                    v231 = *v381;
                  if (*v381 != -1)
                    v230 = v231;
                  v227 = *((_DWORD *)v228 + v230 + 1);
                }
              }
            }
            *(float *)&v215 = (float)v227;
            v216.f32[0] = -(float)v227;
            if (v222 == 5)
              v219 = -(float)v227;
            else
              v219 = (float)v227;
          }
        }
        else
        {
          v224 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)v394 + 56))(*(_QWORD *)v394, *v381);
          if (!v225)
          {
            v206 = 0;
            goto LABEL_309;
          }
          if (v222)
          {
            HIDWORD(v215) = HIDWORD(v224);
            if (v222 == 3)
            {
              LODWORD(v215) = HIDWORD(v224);
              v219 = -*((float *)&v224 + 1);
            }
            else
            {
              LODWORD(v215) = HIDWORD(v224);
              v216.i32[0] = v224 ^ 0x80000000;
              if (v222 == 1)
                LODWORD(v219) = v224 ^ 0x80000000;
              else
                v219 = *((float *)&v224 + 1);
            }
          }
          else
          {
            v219 = *(float *)&v224;
          }
        }
        v232 = v425;
        if (HIDWORD(v425) < (v425 + 1))
        {
          RB::vector<RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement,8ul,unsigned int>::reserve_slow(&v414, v425 + 1);
          v232 = v425;
        }
        v233 = (unsigned int *)v424;
        if (!v424)
          v233 = &v414;
        v234 = &v233[4 * v232];
        *v234 = v223;
        *((float *)v234 + 1) = v219;
        *((float *)v234 + 2) = v220;
        *((float *)v234 + 3) = v218;
        LODWORD(v425) = v425 + 1;
        v206 = 1;
        goto LABEL_309;
      }
LABEL_320:
      v204 += RB::Transition::_effect_args[arg_low & 0x7F] + 1;
    }
    while (v204 < v203);
    v195 = v376;
    if ((v205 & 1) != 0)
    {
      a2 = v401;
      RB::DisplayList::EditAdaptor::set_animation(animation, v401, v201, v192, v374, (uint64_t)v189);
      v180 = v384;
      v182 = v390;
      v237 = v379;
      goto LABEL_329;
    }
    a2 = v401;
LABEL_325:
    v180 = v384;
    v182 = v390;
    if (v187 <= 0.0)
      v238 = -1;
    else
      v238 = -2;
    v237 = v379;
    *(_DWORD *)&v195[40 * v379 + 32] = v238;
LABEL_329:
    if (*((_BYTE *)a2 + 251))
      v239 = 1;
    else
      v239 = *(_DWORD *)&v195[40 * v237 + 32] != *(_DWORD *)(*(_QWORD *)a2 + 20);
    *((_BYTE *)a2 + 251) = v239;
    if ((v206 & 1) == 0)
      RB::DisplayList::Interpolator::Layer::merge_tail((uint64_t)a2);
    v181 = v202;
    v183 = 1;
LABEL_335:
    ++v182;
  }
  while (v182 != v383);
LABEL_338:
  v377 = *((_DWORD *)a2 + 46);
  if (!(_DWORD)v386)
  {
    v303 = v388;
    goto LABEL_435;
  }
  v240 = 0;
  v241 = 0x100000000;
  if (!v373)
    v241 = 0;
  v242 = 0x200000000;
  if (!v372)
    v242 = 0;
  v243 = 0x400000000;
  if ((v183 & 1) != 0)
    v243 = 0;
  v244 = 0x800000000;
  if (!v404)
    v244 = 0;
  v382 = v241 | v378 | v242 | v244 | v243;
  v245 = v180 | 1;
  v380 = v386;
  while (2)
  {
    v246 = a2;
    v247 = v412;
    v395 = (RB::DisplayList::AtomizedItems *)&v412[3 * v240];
    v248 = RB::DisplayList::AtomizedItems::transition(v395, v246);
    v249 = *((_BYTE *)v248 + 14);
    if (RB::Transition::empty_transition(v248, 1))
      v251 = 8;
    else
      v251 = 1;
    v252 = v401;
    v253 = *((_DWORD *)v401 + 46);
    if (*((_DWORD *)v401 + 47) < (v253 + 1))
    {
      RB::vector<RB::DisplayList::Interpolator::Op,4ul,unsigned int>::reserve_slow(v396, v253 + 1);
      v252 = v401;
      v253 = *((_DWORD *)v401 + 46);
    }
    v254 = 0;
    v255 = &v247[3 * v240];
    v256 = (char *)*((_QWORD *)v252 + 22);
    if (!v256)
      v256 = v396;
    v257 = (uint64_t *)&v256[40 * v253];
    v258 = v255[1];
    *v257 = v251 | 0x1000000000;
    v257[1] = 0;
    v257[2] = (uint64_t)v258;
    v257[3] = 0x100000000;
    v257[4] = 0;
    v259 = *((_DWORD *)v252 + 46);
    *((_DWORD *)v252 + 46) = v259 + 1;
    v260 = (char *)*((_QWORD *)v252 + 22);
    if (!v260)
      v260 = v396;
    v385 = v260;
    v387 = v259;
    v261 = &v260[40 * v259];
    *(_QWORD *)v261 = v382 | *(_QWORD *)v261 & 0xFFFFFFF00000000FLL;
    *((_DWORD *)v252 + 48) |= 1 << v251;
    a2 = v252;
    if (v181)
      v254 = (*(_WORD *)(*(_QWORD *)v395 + 46) & 0x3F) == 2;
    v262 = *((_DWORD *)v248 + 12);
    if (!v262)
    {
      v265 = 0;
      v297 = v259;
      goto LABEL_423;
    }
    v263 = 0;
    v264 = 0;
    v265 = 0;
    v389 = (unsigned int *)v255 + 3;
    v267 = (_DWORD)v388 == (_DWORD)v391 || (v249 + 1) < 2u;
    v399 = v267;
    while (2)
    {
      v268 = (char *)*((_QWORD *)v248 + 5);
      if (!v268)
        v268 = (char *)v248 + 24;
      v269 = (EffectOrArg *)&v268[4 * v263];
      if ((v261[4] & 4) != 0)
        v270 = 16;
      else
        v270 = 32;
      v271 = LOWORD(v269->arg);
      if (((v270 | v245) & (v271 >> 8)) == 1)
      {
        v272 = RB::Transition::Effect::anchor_direction((RB::Transition::Effect *)v269, 1u, v404);
        if (v272 >= 0x100u)
        {
          v276 = (char *)*((_QWORD *)v401 + 22);
          if (!v276)
            v276 = v396;
          RB::DisplayList::EditAdaptor::find_motion_projection(a1, (uint64_t)v401, (unsigned int *)v395, v261, v272, (uint64_t)&v276[40 * v391], v388 - v391, (uint64_t)&v405);
        }
        else
        {
          v273 = RB::Transition::Effect::sequence_direction((RB::Transition::Effect *)v269, 1u, v404);
          if ((v273 < 0x100u) | v265 & 1)
          {
            v265 |= v273 > 0xFFu;
            goto LABEL_408;
          }
          v277 = 1.0;
          v278 = 0.0;
          v279 = 0.0;
          if ((LOWORD(v269->arg) & 0x80) == 0)
          {
            LOBYTE(v274) = v269->effect.begin_or_insert_animation;
            *(float *)&v280 = (float)LODWORD(v274);
            v279 = *(float *)&v280 * 0.0039216;
            LOBYTE(v280) = v269->effect.dur_or_remove_animation;
            *(float *)&v274 = (float)v280;
            v277 = *(float *)&v274 * 0.0039216;
          }
          v281 = v273;
          v282 = *((_DWORD *)v401 + 46) - 1;
          if (v273 >= 4u)
          {
            if (v273 - 4 < 2)
            {
              v285 = *(uint64_t **)(*(_QWORD *)v395 + 32);
              v286 = *((_DWORD *)v401 + 46) - 1;
              if (v285)
              {
                v287 = RB::DisplayList::Metadata::text_identity(v285);
                v286 = v282;
                if (v287)
                {
                  v288 = *(_DWORD *)v287;
                  v286 = v282;
                  if (*(_DWORD *)v287 >= 4u)
                  {
                    v289 = v288 >> 3;
                    v290 = (v288 >> 2) - 1;
                    if (v290 >= *v389)
                      v290 = *v389;
                    if (*v389 != -1)
                      v289 = v290;
                    v286 = *((_DWORD *)v287 + v289 + 1);
                  }
                }
              }
              *(float *)&v274 = (float)v286;
              v275.f32[0] = -(float)v286;
              if (v281 == 5)
                v278 = -(float)v286;
              else
                v278 = (float)v286;
            }
LABEL_403:
            v291 = v430;
            if (HIDWORD(v430) < (v430 + 1))
            {
              RB::vector<RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement,8ul,unsigned int>::reserve_slow(__dst, v430 + 1);
              v291 = v430;
            }
            v292 = v429;
            if (!v429)
              v292 = __dst;
            v293 = &v292[4 * v291];
            *v293 = v282;
            *((float *)v293 + 1) = v278;
            *((float *)v293 + 2) = v279;
            *((float *)v293 + 3) = v277;
            LODWORD(v430) = v430 + 1;
            v265 = 1;
          }
          else
          {
            v283 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)v395 + 56))(*(_QWORD *)v395, *v389);
            if (v284)
            {
              if (v281)
              {
                HIDWORD(v274) = HIDWORD(v283);
                if (v281 == 3)
                {
                  LODWORD(v274) = HIDWORD(v283);
                  v278 = -*((float *)&v283 + 1);
                }
                else
                {
                  LODWORD(v274) = HIDWORD(v283);
                  v275.i32[0] = v283 ^ 0x80000000;
                  if (v281 == 1)
                    LODWORD(v278) = v283 ^ 0x80000000;
                  else
                    v278 = *((float *)&v283 + 1);
                }
              }
              else
              {
                v278 = *(float *)&v283;
              }
              goto LABEL_403;
            }
            v265 = 0;
          }
        }
LABEL_408:
        v294 = RB::Transition::Effect::custom_duration((RB::Transition::Effect *)v269, 1, v269 + 1, v274, v275);
        v295 = *(float *)&v294;
        if (v187 >= *(float *)&v294)
          v295 = v187;
        if ((v294 & 0xFF00000000) != 0)
          v187 = v295;
        v264 |= (v294 & 0xFF00000000) == 0;
        LOWORD(v271) = LOWORD(v269->arg);
        v296 = v399;
        if ((LOWORD(v269->arg) & 0x7F) != 1)
          v296 = 0;
        v254 = v254 && v296;
        v262 = *((_DWORD *)v248 + 12);
      }
      v263 += RB::Transition::_effect_args[v271 & 0x7F] + 1;
      if (v263 < v262)
        continue;
      break;
    }
    v297 = v387;
    if ((v264 & 1) != 0)
    {
      v298 = (RB::Animation *)RB::DisplayList::find_animation(0, *(const RB::DisplayList::Item **)v395, v250);
      a2 = v401;
      v299 = v385;
      RB::DisplayList::EditAdaptor::set_animation((int)v298, v401, v261, v300, v298, (uint64_t)v248);
      goto LABEL_427;
    }
    a2 = v401;
LABEL_423:
    if (v187 <= 0.0)
      v301 = -1;
    else
      v301 = -2;
    v299 = v385;
    *(_DWORD *)&v385[40 * v297 + 32] = v301;
LABEL_427:
    if (*((_BYTE *)a2 + 251))
      v302 = 1;
    else
      v302 = *(_DWORD *)&v299[40 * v297 + 32] != *(_DWORD *)(*(_QWORD *)a2 + 20);
    *((_BYTE *)a2 + 251) = v302;
    if ((v265 & 1) == 0)
      RB::DisplayList::Interpolator::Layer::merge_tail((uint64_t)a2);
    ++v240;
    v181 = v254;
    v303 = v388;
    if (v240 != v380)
      continue;
    break;
  }
LABEL_435:
  if (v187 > 0.0)
  {
    v304 = *(float *)(*(_QWORD *)a2 + 72);
    if (v304 <= v187)
      v304 = v187;
    *(float *)(*(_QWORD *)a2 + 72) = v304;
  }
  if (v181 && v377 > v303)
  {
    v305 = *((_DWORD *)a2 + 46);
    if (v305 > v377)
    {
      if (v303 + 1 >= v377)
      {
        v309 = 1;
        v306 = v396;
      }
      else
      {
        v306 = v396;
        if (*((_QWORD *)a2 + 22))
          v307 = (char *)*((_QWORD *)a2 + 22);
        else
          v307 = v396;
        v308 = &v307[40 * v303 + 48];
        LOBYTE(v309) = 1;
        v310 = v303;
        do
        {
          v309 = v309 && *(_DWORD *)v308 == *(_DWORD *)&v307[40 * v310++ + 8] + 1;
          v308 += 40;
        }
        while (v377 - 1 != v310);
      }
      if (v377 + 1 < v305)
      {
        v311 = (char *)*((_QWORD *)a2 + 22);
        if (!v311)
          v311 = v306;
        v312 = &v311[40 * v377 + 56];
        v313 = v377;
        do
        {
          v309 = v309 && *(_DWORD *)v312 == *(_DWORD *)&v311[40 * v313++ + 16] + 1;
          v312 += 40;
        }
        while (v305 - 1 != v313);
      }
      if (v309)
      {
        v314 = (char *)*((_QWORD *)a2 + 22);
        v315 = v396;
        if (v314)
          v315 = (char *)*((_QWORD *)a2 + 22);
        v316 = &v315[40 * v303];
        v317 = *((_DWORD *)v316 + 2);
        v318 = *(_DWORD *)&v315[40 * v377 - 32];
        v319 = *(_DWORD *)&v315[40 * v377 + 16];
        v320 = *(_DWORD *)&v315[40 * v305 - 24];
        v321 = 0xCCCCCCCCCCCCCCCDLL * ((40 * v305 - (40 * v303 + 40)) >> 3);
        v322 = (40 * v303 + 40) >> 3;
        v323 = v305 - v321;
        *((_DWORD *)a2 + 46) = v323;
        if (v323 != 0xCCCCCCCCCCCCCCCDLL * v322)
        {
          memmove(v316 + 40, &v316[40 * v321 + 40], 40 * (v323 - 0xCCCCCCCCCCCCCCCDLL * v322));
          v314 = (char *)*((_QWORD *)a2 + 22);
          LODWORD(v323) = *((_DWORD *)a2 + 46);
        }
        if (!v314)
          v314 = v396;
        v324 = &v314[40 * (v323 - 1)];
        *(_QWORD *)v324 = *(_QWORD *)v324 & 0xFFFFFFFFFFFFFFF0 | 9;
        *((_DWORD *)a2 + 48) |= 0x200u;
        *(_QWORD *)v324 &= 0xFFFFFFFFFuLL;
        *((_DWORD *)v324 + 2) = v317;
        *((_DWORD *)v324 + 3) = v318 - v317 + 1;
        *((_DWORD *)v324 + 4) = v319;
        *((_DWORD *)v324 + 5) = v320 - v319 + 1;
      }
    }
  }
  v325 = a2;
  if (v425 >= 2)
  {
    v326 = (float *)(v424 ? v424 : &v414);
    std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *,false>(v326, &v326[4 * v425], 126 - 2 * __clz(v425), 1);
    v327 = v425;
    if ((_DWORD)v425)
    {
      v328 = 0;
      v329 = 0;
      do
      {
        if (v424)
          v330 = (unsigned int *)v424;
        else
          v330 = &v414;
        v331 = v330[v328];
        if (*((_QWORD *)v325 + 22))
          v332 = (char *)*((_QWORD *)v325 + 22);
        else
          v332 = v396;
        v333 = RB::DisplayList::Interpolator::Contents::animation_max_duration(*(RB::DisplayList::Interpolator::Contents **)v325, *(_DWORD *)&v332[40 * v331 + 32]);
        v334 = *(float *)&v330[v328 + 2];
        v335 = *(float *)&v330[v328 + 3];
        if (v335 < 1.0)
        {
          v336 = v330[v328 + 3];
          v337 = vrecpe_f32((float32x2_t)LODWORD(v335));
          v338 = vmul_f32(vrecps_f32((float32x2_t)v336, v337), v337);
          v338.i32[0] = vmul_f32(v338, vrecps_f32((float32x2_t)v336, v338)).u32[0];
          v339 = vmlas_n_f32(-v333, v333, v338.f32[0]);
          v338 = (float32x2_t)v338.u32[0];
          v338.f32[0] = (float)(v425 - 1);
          v340 = vrecpe_f32(v338);
          v341 = vmul_f32(vrecps_f32(v338, v340), v340);
          v342 = v339 * vmul_f32(v341, vrecps_f32(v338, v341)).f32[0];
          if (v342 < v334)
            v334 = v342;
        }
        v343 = v333 * (float)((float)v329 * v334);
        *(float *)&v332[40 * v331 + 36] = v343;
        v325 = v401;
        v345 = v343 != 0.0 || *((_BYTE *)v401 + 251) != 0;
        *((_BYTE *)v401 + 251) = v345;
        ++v329;
        v328 += 4;
      }
      while (v327 != v329);
    }
  }
  if (v430 >= 2)
  {
    v346 = (float *)(v429 ? v429 : __dst);
    std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *,false>(v346, &v346[4 * v430], 126 - 2 * __clz(v430), 1);
    v347 = v430;
    if ((_DWORD)v430)
    {
      v348 = 0;
      v349 = 0;
      do
      {
        if (v429)
          v350 = v429;
        else
          v350 = __dst;
        v351 = v350[v348];
        if (*((_QWORD *)v325 + 22))
          v352 = (char *)*((_QWORD *)v325 + 22);
        else
          v352 = v396;
        v353 = RB::DisplayList::Interpolator::Contents::animation_max_duration(*(RB::DisplayList::Interpolator::Contents **)v325, *(_DWORD *)&v352[40 * v351 + 32]);
        v354 = *(float *)&v350[v348 + 2];
        v355 = *(float *)&v350[v348 + 3];
        if (v355 < 1.0)
        {
          v356 = v350[v348 + 3];
          v357 = vrecpe_f32((float32x2_t)LODWORD(v355));
          v358 = vmul_f32(vrecps_f32((float32x2_t)v356, v357), v357);
          v358.i32[0] = vmul_f32(v358, vrecps_f32((float32x2_t)v356, v358)).u32[0];
          v359 = vmlas_n_f32(-v353, v353, v358.f32[0]);
          v358 = (float32x2_t)v358.u32[0];
          v358.f32[0] = (float)(v430 - 1);
          v360 = vrecpe_f32(v358);
          v361 = vmul_f32(vrecps_f32(v358, v360), v360);
          v362 = v359 * vmul_f32(v361, vrecps_f32(v358, v361)).f32[0];
          if (v362 < v354)
            v354 = v362;
        }
        v363 = v353 * (float)((float)v349 * v354);
        *(float *)&v352[40 * v351 + 36] = v363;
        v325 = v401;
        v365 = v363 != 0.0 || *((_BYTE *)v401 + 251) != 0;
        *((_BYTE *)v401 + 251) = v365;
        ++v349;
        v348 += 4;
      }
      while (v347 != v349);
    }
  }
  if (v405)
    free(v405);
  if (v429)
    free(v429);
  if (v424)
    free(v424);
  return !v373;
}

void sub_209BC054C(_Unwind_Exception *a1)
{
  if (STACK[0xB28])
    free((void *)STACK[0xB28]);
  if (STACK[0x718])
    free((void *)STACK[0x718]);
  _Unwind_Resume(a1);
}

double RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_0::operator()<RB::vector<RB::DisplayList::EditAdaptor::Element,0ul,unsigned int>,unsigned int>@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned int *a3@<X2>, uint64_t a4@<X8>)
{
  unsigned int v4;
  uint64_t v8;
  int v9;
  uint64_t *v10;
  RB::DisplayList::Interpolator::Layer *v11;
  uint64_t *v12;
  const RB::Transition *v13;
  _BYTE *v14;
  unsigned int v15;
  int *v16;
  int v17;
  _BYTE *v18;
  unsigned int v19;
  unsigned int v20;
  char *v21;
  char *v22;
  __int16 v23;
  unsigned int v25;
  uint64_t v26;
  double v27;
  float32x2_t v28;
  double v29;
  double v30;
  double v31;
  int32x4_t v32;
  double result;
  __int128 v35;

  v35 = 0uLL;
  v4 = *a3;
  if (*a3 >= *(_DWORD *)(a2 + 8))
  {
    v9 = 0;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    do
    {
      if (*(_DWORD *)(*(_QWORD *)a2 + 24 * v4 + 20) != *(_DWORD *)(a1 + 8))
        break;
      v10 = *(uint64_t **)(*(_QWORD *)(*(_QWORD *)a2 + 24 * v4) + 32);
      if (v10)
      {
        v11 = *(RB::DisplayList::Interpolator::Layer **)a1;
        v12 = RB::DisplayList::Metadata::transition(v10);
        v13 = RB::DisplayList::Interpolator::Layer::item_transition(v11, (const RB::Transition *)v12);
        v14 = *(_BYTE **)(a1 + 16);
        v15 = *v14;
        if (v15 <= *((unsigned __int8 *)v13 + 12))
          LOBYTE(v15) = *((_BYTE *)v13 + 12);
        *v14 = v15;
        v16 = *(int **)(a1 + 24);
        v17 = *((_DWORD *)v13 + 4);
        if (*v16 > v17)
          v17 = *v16;
        *v16 = v17;
        v18 = *(_BYTE **)(a1 + 32);
        if (!*v18)
        {
          v19 = *((_DWORD *)v13 + 12);
          if (v19)
          {
            v20 = 0;
            v21 = (char *)v13 + 24;
            if (*((_QWORD *)v13 + 5))
              v21 = (char *)*((_QWORD *)v13 + 5);
            do
            {
              v22 = &v21[4 * v20];
              v23 = *(_WORD *)v22;
              if ((*(_WORD *)v22 & 0x7Fu) <= 0x12 && ((1 << (*(_WORD *)v22 & 0x7F)) & 0x60020) != 0)
              {
                *v18 = 1;
                v23 = *(_WORD *)v22;
              }
              v20 += RB::Transition::_effect_args[v23 & 0x7F] + 1;
            }
            while (v20 < v19);
          }
        }
      }
      v25 = *a3;
      v26 = *(_QWORD *)(*(_QWORD *)a2 + 24 * *a3);
      if (v26 != v8)
      {
        v27 = RB::DisplayList::Item::clipped_bounds(*(float32x2_t ***)(*(_QWORD *)a2 + 24 * v25));
        RB::Rect::Union((float32x2_t *)&v35, *(float32x2_t *)&v27, v28, v29, v30, v31, v32);
        v25 = *a3;
        v8 = v26;
      }
      v4 = v25 + 1;
      *a3 = v25 + 1;
      ++v9;
    }
    while (v25 + 1 < *(_DWORD *)(a2 + 8));
  }
  *(_DWORD *)a4 = v9;
  result = *(double *)&v35;
  *(_OWORD *)(a4 + 8) = v35;
  return result;
}

uint64_t RB::lcs_diff<RB::DisplayList::EditAdaptor::Element,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int)::$_0,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int)::$_1>(uint64_t matrix_value, unsigned int **a2, uint64_t a3, unsigned int **a4, unsigned int *a5, uint64_t *a6, unsigned int *a7)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int **v12;
  unsigned int **v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  int v23;
  uint64_t v24;
  unsigned int *v25;
  char v26;
  uint64_t v27;
  size_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  _QWORD *v33;
  _QWORD *v34;
  unsigned int *v35;
  unsigned int *v36;
  uint64_t v37;
  unsigned int *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  unsigned int *v46;
  char *v47;
  uint64_t *v49;
  unsigned int **v50;
  unsigned int **v51;
  unsigned int v52;
  int v53;
  unsigned int *v54;
  _QWORD *v55;
  _QWORD *v56;
  _QWORD *v57;
  unsigned int **v58;
  int v59;
  uint64_t v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  unsigned int *v64;
  unsigned int v65;
  unsigned int *v66;
  unsigned int *v67;
  unsigned int v68;
  unsigned int *v69;
  unsigned int v70;
  unsigned int *v71;
  uint64_t *v72;
  unsigned int **v73;
  uint64_t v74;
  __int128 *v75;
  uint64_t v76;
  __int128 v77;
  int v78;
  _BYTE v79[12];
  int v80;
  unint64_t v81;
  unsigned int *v82;
  uint64_t v83;
  _BOOL8 v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _BYTE *v89;
  _BYTE *v90;
  unsigned int *v91;
  unint64_t v92;
  unsigned int *v93;
  unsigned int *v94;
  unsigned int **v95;
  unsigned int **v96;
  uint64_t *v97;
  size_t v98[2];
  unint64_t v99;
  unint64_t v100;
  char v101[1024];
  uint64_t v102;

  v97 = a6;
  v93 = a5;
  v8 = a3;
  v9 = matrix_value;
  v102 = *MEMORY[0x24BDAC8D0];
  if (matrix_value >= a3)
    v10 = a3;
  else
    v10 = matrix_value;
  v95 = a2;
  v96 = a4;
  v11 = 0;
  if (v10 >= 1)
  {
    v12 = a2;
    v13 = a4;
    while (1)
    {
      matrix_value = *v97;
      v14 = *((_DWORD *)v12 + 4) + *((_DWORD *)v13 + 4);
      v15 = (*(_DWORD *)(*(_QWORD *)(*v97 + 192) + 4 * (v14 >> 3)) >> (4 * (v14 & 7))) & 0xF;
      if (!v15)
      {
        matrix_value = RB::DisplayList::EditAdaptor::make_matrix_value(matrix_value, (_QWORD *)v97[1], (uint64_t *)v12, (uint64_t *)v13);
        v15 = matrix_value;
      }
      if (v15 == 1)
        break;
      ++v11;
      v13 += 3;
      v12 += 3;
      if (v10 == v11)
      {
        v11 = v10;
        break;
      }
    }
  }
  v16 = v8 + v9;
  v17 = -v9;
  do
  {
    v18 = v9;
    v19 = v8;
    v20 = v16;
    v21 = v17;
    --v9;
    if (v11 >= v8 || v11 >= v18)
      break;
    --v8;
    matrix_value = *v97;
    v22 = LODWORD(v95[3 * v9 + 2]) + LODWORD(v96[3 * v19 - 1]);
    v23 = (*(_DWORD *)(*(_QWORD *)(*v97 + 192) + 4 * (v22 >> 3)) >> (4 * (v22 & 7))) & 0xF;
    if (!v23)
    {
      matrix_value = RB::DisplayList::EditAdaptor::make_matrix_value(matrix_value, (_QWORD *)v97[1], (uint64_t *)&v95[3 * v9], (uint64_t *)&v96[3 * v8]);
      v23 = matrix_value;
    }
    v16 = v20 - 2;
    v17 = v21 + 1;
  }
  while (v23 != 1);
  if (v18 + v19 >= (uint64_t)v93)
    v24 = (uint64_t)v93;
  else
    v24 = v18 + v19;
  if (v18 == v11)
    v25 = (unsigned int *)(v18 + 1);
  else
    v25 = (unsigned int *)v9;
  if (v19 == v11)
  {
    if (v18 == v11)
    {
      v26 = 1;
      return v26 & 1;
    }
  }
  else
  {
    v9 = v18 + 1;
  }
  if (v24 < 1 || (v18 <= v19 ? (v27 = v19) : (v27 = v18), v27 >= 0x8000 || (((unint64_t)v27 >> 60) & 7) != 0))
  {
    v26 = 0;
    return v26 & 1;
  }
  v94 = v25;
  v29 = (16 * v27) | 8;
  if (v29 <= 0x1000)
  {
    MEMORY[0x24BDAC7A8](matrix_value, a2);
    v92 = (v29 + 15) & 0xFFFFFFFFFFFFFFF0;
    v90 = &v79[-v92];
    bzero(&v79[-v92], v29);
    MEMORY[0x24BDAC7A8](v30, v31);
    v89 = &v79[-v92];
    bzero(&v79[-v92], v29);
    v32 = 0;
    goto LABEL_39;
  }
  v90 = malloc_type_malloc((16 * v27) | 8, 0x5560CE4DuLL);
  v89 = malloc_type_malloc(v29, 0x14FC10C4uLL);
  if (v90)
  {
    v32 = 1;
    if (v89)
    {
LABEL_39:
      v83 = v24;
      v80 = v32;
      v81 = v29;
      RB::Heap::Heap((RB::Heap *)v98, v101, 1024, 0);
      v33 = v90;
      *(_QWORD *)&v90[8 * v18] = v11;
      v34 = v89;
      *(_QWORD *)&v89[8 * v18] = 0;
      v35 = v93;
      v36 = v94;
      if ((uint64_t)v93 >= v20)
        v35 = (unsigned int *)v20;
      v82 = v35;
      v84 = 1;
      v37 = 1;
      v38 = (unsigned int *)v9;
      while (1)
      {
        v85 = v37;
        if ((uint64_t)v36 <= (uint64_t)v38)
          break;
        v93 = v36;
LABEL_44:
        v36 = (unsigned int *)((char *)v93 - 1);
        v38 = (unsigned int *)((char *)v38 + 1);
        v37 = v85 + 1;
        v84 = v85 < v83;
        if ((unsigned int *)v85 == v82)
        {
LABEL_98:
          RB::Heap::~Heap((RB::Heap *)v98);
          v32 = v80;
          v26 = v84;
          if (v81 <= 0x1000)
            goto LABEL_103;
          goto LABEL_102;
        }
      }
      v88 = v37 + v18;
      v92 = v18 - v37;
      v93 = v36;
      v86 = v37 + v18 - 1;
      v87 = v18 - v37 + 1;
      v39 = (uint64_t)v36 + v21;
      while (1)
      {
        v40 = (v99 + 7) & 0xFFFFFFFFFFFFFFF8;
        if (v40 + 32 > v100)
          v40 = RB::Heap::alloc_slow(v98, 0x20uLL, 7);
        else
          v99 = v40 + 32;
        v94 = v36;
        if ((unsigned int *)v92 == v36)
          break;
        if ((unsigned int *)v88 == v36)
        {
          v44 = 0;
          v41 = v86;
          v43 = v33[v86];
        }
        else
        {
          v41 = (uint64_t)v36 + 1;
          v42 = v33[(_QWORD)v36 + 1];
          v45 = (uint64_t)v36 - 1;
          v43 = v33[(_QWORD)v36 - 1];
          if (v42 >= v43)
            goto LABEL_51;
          v44 = 0;
          v41 = v45;
        }
LABEL_56:
        *(_QWORD *)v40 = v34[v41];
        *(_DWORD *)(v40 + 8) = v44;
        v46 = v94;
        v47 = (char *)v94 + v43 - v18;
        *(_QWORD *)(v40 + 16) = v43 - 1;
        *(_QWORD *)(v40 + 24) = v47 - 1;
        v34[(_QWORD)v46] = v40;
        if (v43 < v18 && (uint64_t)v47 < v19)
        {
          v91 = v38;
          v49 = v97;
          v50 = &(&v96[3 * v43])[3 * v39];
          v51 = &v95[3 * v43];
          do
          {
            v52 = *((_DWORD *)v51 + 4) + *((_DWORD *)v50 + 4);
            v53 = (*(_DWORD *)(*(_QWORD *)(*v49 + 192) + 4 * (v52 >> 3)) >> (4 * (v52 & 7))) & 0xF;
            if (!v53)
              v53 = RB::DisplayList::EditAdaptor::make_matrix_value(*v49, (_QWORD *)v49[1], (uint64_t *)v51, (uint64_t *)v50);
            if (v53 == 1)
              break;
            if (++v43 >= v18)
              break;
            v50 += 3;
            v51 += 3;
          }
          while (v43 + v39 < v19);
          v47 = (char *)(v39 + v43);
          v34 = v89;
          v33 = v90;
          v38 = v91;
        }
        v33[(_QWORD)v94] = v43;
        if (v18 == v43 && (char *)v19 == v47)
        {
          v55 = (_QWORD *)v34[(_QWORD)v94];
          if (!v55)
            goto LABEL_98;
          v56 = 0;
          do
          {
            v57 = v55;
            v55 = (_QWORD *)*v55;
            *v57 = v56;
            v56 = v57;
          }
          while (v55);
          v58 = (unsigned int **)(a7 + 2);
          v93 = a7 + 12;
          v94 = a7 + 10;
          v96 = (unsigned int **)(a7 + 18);
          v97 = (uint64_t *)(a7 + 4);
          v95 = (unsigned int **)(a7 + 16);
          while (1)
          {
            v59 = *((_DWORD *)v57 + 2);
            if (v59 == 1)
              v60 = 2;
            else
              v60 = 3;
            v61 = v57[v60];
            if (v59 == 1)
              v62 = 2;
            else
              v62 = 4;
            if (**(_DWORD **)&a7[v62] < v61)
            {
              v63 = *((_QWORD *)a7 + 3);
              v64 = *v58;
              v65 = *(_DWORD *)*v97;
              do
              {
                RB::DisplayList::EditAdaptor::mix_elements(v63, *((_QWORD *)a7 + 4), (const RB::DisplayList::Item *)*a7, **((_QWORD **)a7 + 5) + 24 * *v64, **((_QWORD **)a7 + 6) + 24 * v65);
                **((_BYTE **)a7 + 7) = 1;
                v64 = (unsigned int *)*((_QWORD *)a7 + 1);
                ++*v64;
                v66 = (unsigned int *)*((_QWORD *)a7 + 2);
                v65 = *v66 + 1;
                *v66 = v65;
              }
              while (**(_DWORD **)&a7[v62] < v61);
            }
            if (v59 == 1)
            {
              v67 = *v58;
              v68 = **v58;
              v69 = *v95;
              v70 = **v95;
              if (v68 != v70)
              {
                v71 = v94;
                v72 = (uint64_t *)(a7 + 2);
                v73 = v95;
LABEL_95:
                v74 = **(_QWORD **)v71;
                v75 = (__int128 *)(v74 + 24 * v68);
                v76 = v74 + 24 * v70;
                v77 = *v75;
                *(_QWORD *)(v76 + 16) = *((_QWORD *)v75 + 2);
                *(_OWORD *)v76 = v77;
                v67 = (unsigned int *)*v72;
                v68 = *v67;
                v69 = *v73;
              }
            }
            else
            {
              v67 = (unsigned int *)*v97;
              v68 = *(_DWORD *)*v97;
              v69 = *v96;
              v70 = **v96;
              if (v68 != v70)
              {
                v71 = v93;
                v72 = v97;
                v73 = v96;
                goto LABEL_95;
              }
            }
            *v67 = v68 + 1;
            ++*v69;
            v57 = (_QWORD *)*v57;
            if (!v57)
            {
              v34 = v89;
              v33 = v90;
              goto LABEL_98;
            }
          }
        }
        v54 = v93;
        if (v18 == v43)
          v54 = (unsigned int *)((char *)v94 + 2);
        v93 = v54;
        if ((char *)v19 == v47)
          v38 = (unsigned int *)((char *)v94 - 2);
        v39 += 2;
        v36 = (unsigned int *)((char *)v94 + 2);
        if ((uint64_t)((char *)v94 + 2) > (uint64_t)v38)
          goto LABEL_44;
      }
      v41 = v87;
      v42 = v33[v87];
LABEL_51:
      v43 = v42 + 1;
      v44 = 1;
      goto LABEL_56;
    }
    v26 = 0;
    v34 = 0;
    v33 = v90;
  }
  else
  {
    v26 = 0;
    v33 = 0;
    v32 = 1;
    v34 = v89;
  }
LABEL_102:
  v78 = v32;
  free(v34);
  v32 = v78;
LABEL_103:
  if (v32)
    free(v33);
  return v26 & 1;
}

void sub_209BC0EC4(_Unwind_Exception *a1)
{
  uint64_t v1;

  RB::Heap::~Heap((RB::Heap *)(v1 + 152));
  if (*(_QWORD *)(v1 + 16) > 0x1000uLL)
  {
    free(*(void **)(v1 + 80));
    free(*(void **)(v1 + 88));
  }
  _Unwind_Resume(a1);
}

uint64_t RB::DisplayList::EditAdaptor::mix_elements(uint64_t result, uint64_t a2, const RB::DisplayList::Item *a3, uint64_t a4, uint64_t a5)
{
  unsigned int v5;
  unsigned int v6;
  int v9;
  char *v11;
  int v12;
  char *v13;
  char *v14;
  int v15;
  char *v16;
  char *v17;
  __int128 v18;
  RB::Animation *animation;
  int v20;

  v5 = *(_DWORD *)(a4 + 16) + *(_DWORD *)(a5 + 16);
  v6 = (*(_DWORD *)(*(_QWORD *)(result + 192) + 4 * (v5 >> 3)) >> (4 * (v5 & 7))) & 0xF;
  if (v6 >= 2)
  {
    v9 = (int)a3;
    v11 = (char *)(a2 + 16);
    v12 = *(_DWORD *)(a2 + 184);
    if (*(_DWORD *)(a2 + 188) < (v12 + 1))
    {
      RB::vector<RB::DisplayList::Interpolator::Op,4ul,unsigned int>::reserve_slow(v11, v12 + 1);
      v12 = *(_DWORD *)(a2 + 184);
    }
    v13 = *(char **)(a2 + 176);
    if (!v13)
      v13 = v11;
    v14 = &v13[40 * v12];
    *((_QWORD *)v14 + 1) = 0;
    *((_QWORD *)v14 + 2) = 0;
    *(_QWORD *)v14 = 0xFFFFFFF000000000;
    *((_DWORD *)v14 + 6) = 0;
    *(_QWORD *)(v14 + 28) = 1;
    *((_DWORD *)v14 + 9) = 0;
    v15 = *(_DWORD *)(a2 + 184);
    *(_DWORD *)(a2 + 184) = v15 + 1;
    v16 = *(char **)(a2 + 176);
    if (!v16)
      v16 = v11;
    v17 = &v16[40 * v15];
    *(_QWORD *)v17 = *(_QWORD *)v17 & 0xF00000000 | v6 | (16 * v9) | 0x1000000000;
    v18 = *(_OWORD *)(a4 + 8);
    *((_QWORD *)&v18 + 1) = *(_QWORD *)(a5 + 8);
    *(_OWORD *)(v17 + 8) = v18;
    animation = (RB::Animation *)RB::DisplayList::find_animation(*(RB::DisplayList **)a4, *(const RB::DisplayList::Item **)a5, a3);
    RB::DisplayList::EditAdaptor::set_animation((int)animation, (_BYTE *)a2, v17, v20, animation, 0);
    *(_DWORD *)(a2 + 192) |= 1 << (*(_DWORD *)v17 & 0xF);
    return RB::DisplayList::Interpolator::Layer::merge_tail(a2);
  }
  return result;
}

_QWORD *RB::prefix_suffix_diff<RB::DisplayList::EditAdaptor::Element,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int)::$_0,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int,RB::DisplayList::EditAdaptor::Element*,unsigned int)::$_2>(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, int a7, int a8)
{
  _QWORD *v9;
  unint64_t v12;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  int matrix_value;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  int v26;

  v9 = a6;
  v12 = a3;
  v14 = a1;
  if (a7 && (a1 >= a3 ? (v15 = a3) : (v15 = a1), v15))
  {
    v16 = 0;
    v17 = a2;
    v18 = a4;
    while (1)
    {
      v19 = *(_DWORD *)(v17 + 16) + *(_DWORD *)(v18 + 16);
      matrix_value = (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)a5 + 192) + 4 * (v19 >> 3)) >> (4 * (v19 & 7))) & 0xF;
      if (!matrix_value)
        matrix_value = RB::DisplayList::EditAdaptor::make_matrix_value(*(_QWORD *)a5, *(_QWORD **)(a5 + 8), (uint64_t *)v17, (uint64_t *)v18);
      if (matrix_value == 1)
        break;
      ++v16;
      v18 += 24;
      v17 += 24;
      if (v15 == v16)
      {
        v16 = v15;
        break;
      }
    }
    v9 = a6;
    if (!a8)
      goto LABEL_13;
  }
  else
  {
    v16 = 0;
    if (!a8)
    {
LABEL_13:
      v21 = v12;
      v22 = v14;
      goto LABEL_21;
    }
  }
  v23 = a4 + 24 * v12 - 24;
  v24 = a2 + 24 * v14 - 24;
  do
  {
    v22 = v14;
    v21 = v12;
    if (v12 <= v16 || v14 <= v16)
      break;
    v25 = *(_DWORD *)(v24 + 16) + *(_DWORD *)(v23 + 16);
    v26 = (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)a5 + 192) + 4 * (v25 >> 3)) >> (4 * (v25 & 7))) & 0xF;
    if (!v26)
      v26 = RB::DisplayList::EditAdaptor::make_matrix_value(*(_QWORD *)a5, *(_QWORD **)(a5 + 8), (uint64_t *)v24, (uint64_t *)v23);
    v23 -= 24;
    v24 -= 24;
    --v12;
    --v14;
  }
  while (v26 != 1);
LABEL_21:
  RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::$_2::operator()(v9, 1, v16, v22 - v16);
  return RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::$_2::operator()(v9, 0, v16, v21 - (int)v16);
}

_QWORD *RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::$_2::operator()(_QWORD *result, int a2, int a3, int a4)
{
  _DWORD **v4;
  uint64_t v5;
  _DWORD **v6;
  int v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  _DWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _DWORD *v14;
  int v15;
  int v16;
  _DWORD *v17;
  unsigned int v18;
  _DWORD *v19;
  _DWORD *v20;
  uint64_t v21;
  _DWORD *v22;
  int v23;
  _DWORD *v24;
  int v25;
  uint64_t v26;
  _DWORD *v27;
  _DWORD **v28;
  int v29;
  _QWORD *v30;

  if (a4)
  {
    v4 = (_DWORD **)(result + 1);
    v5 = 1;
    if (a2)
    {
      v5 = 0;
      v6 = (_DWORD **)result;
    }
    else
    {
      v6 = (_DWORD **)(result + 1);
    }
    v7 = *(_DWORD *)result[v5];
    v8 = a3 - v7;
    if (a3 == v7)
      goto LABEL_20;
    v9 = result[2];
    v10 = *(_DWORD *)(v9 + 1544);
    v11 = (_DWORD *)*result;
    if (v10)
    {
      if (*(_QWORD *)(v9 + 1536))
        v12 = *(_QWORD *)(v9 + 1536);
      else
        v12 = result[2];
      v13 = v12 + 12 * (v10 - 1);
      v16 = *(_DWORD *)(v13 + 8);
      v14 = (_DWORD *)(v13 + 8);
      v15 = v16;
      v17 = *v4;
      if (v16 + *(_DWORD *)(v12 + 12 * (v10 - 1)) == *v11 && *(_DWORD *)(v12 + 12 * (v10 - 1) + 4) + v15 == *v17)
      {
        *v14 = v15 + v8;
LABEL_19:
        *v11 += v8;
        *v17 += v8;
        *(_DWORD *)result[3] += v8;
LABEL_20:
        **v6 += a4;
        return result;
      }
    }
    else
    {
      v17 = *v4;
    }
    v18 = v10 + 1;
    if (*(_DWORD *)(v9 + 1548) < v10 + 1)
    {
      v29 = a4;
      v30 = result;
      v26 = result[2];
      v28 = v6;
      v25 = v8;
      v27 = (_DWORD *)*result;
      v24 = v17;
      RB::vector<RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::Mixed,128ul,unsigned int>::reserve_slow((void *)v9, v18);
      v17 = v24;
      v9 = v26;
      v11 = v27;
      v8 = v25;
      v6 = v28;
      a4 = v29;
      result = v30;
      v10 = *(_DWORD *)(v26 + 1544);
      v20 = (_DWORD *)*v30;
      v19 = (_DWORD *)v30[1];
      v18 = v10 + 1;
    }
    else
    {
      v19 = v17;
      v20 = (_DWORD *)*result;
    }
    v21 = *(_QWORD *)(v9 + 1536);
    if (!v21)
      v21 = v9;
    v22 = (_DWORD *)(v21 + 12 * v10);
    v23 = *v17;
    *v22 = *v11;
    v22[1] = v23;
    v22[2] = v8;
    *(_DWORD *)(v9 + 1544) = v18;
    v17 = v19;
    v11 = v20;
    goto LABEL_19;
  }
  return result;
}

void RB::DisplayList::EditAdaptor::find_motion_projection(uint64_t a1, uint64_t a2, unsigned int *a3, _QWORD *a4, int a5, uint64_t a6, unsigned int a7, uint64_t a8)
{
  float32x2_t v12;
  uint32x2_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  int32x2_t v18;
  float v19;
  int8x8_t v20;
  unsigned int *v21;
  int v22;
  int32x2_t v23;
  float32x2_t v24;
  float32x2_t v25;
  uint64_t v26;
  unsigned int *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int *v32;
  uint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  float32x2_t *v36;
  float32x2_t v37;
  uint32x2_t v38;
  double v39;
  uint32x2_t v40;
  int32x2_t v41;
  unsigned __int32 v42;
  int32x2_t v44;
  int32x2_t v45;
  float v46;
  float32x2_t v48;
  float v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  unsigned int *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  float32x2_t v59;
  uint32x2_t v60;
  double v61;
  int v62;
  float32x2_t v63;
  float32x2_t v64;
  unsigned int v65;
  uint64_t v66;
  uint32x2_t v67;
  unsigned int v68;
  uint32x2_t v69;
  unsigned int v70;
  uint64_t v71;
  float32x2_t *v72;
  int v73;
  unsigned int v74;
  unsigned int v75;
  uint64_t v76;
  float32x2_t *v77;
  unsigned int v80;
  int32x2_t v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  float32x2_t v85;
  uint64_t v87;

  v85 = COERCE_FLOAT32X2_T((*(double (**)(_QWORD, _QWORD, uint64_t))(**(_QWORD **)a3 + 64))(*(_QWORD *)a3, a3[3], 1));
  v13 = (uint32x2_t)vclez_f32(v12);
  if ((vpmax_u32(v13, v13).u32[0] & 0x80000000) == 0 && a7)
  {
    v14 = a1;
    v15 = a4;
    v16 = 0;
    v17 = 0;
    v87 = a1 + 112;
    v83 = a4;
    v84 = a1 + 32;
    v18 = (int32x2_t)vadd_f32(v12, v85);
    v19 = *(float *)&v18.i32[1];
    v81 = v18;
    v20 = (int8x8_t)vzip2_s32(v18, (int32x2_t)v85);
    v21 = (unsigned int *)(a6 + 12);
    v80 = -1;
    v22 = 0x7FFFFFFF;
    v23 = vdup_n_s32(0x7FC00000u);
    v24 = 0;
    v25 = 0;
    v82 = v14;
    do
    {
      v26 = *v15 & 0xFLL;
      if (v26)
      {
        v27 = v21 + 1;
        v28 = *(_QWORD *)(v14 + 176);
        v29 = v28 == 0;
        v30 = v87;
      }
      else
      {
        v27 = (unsigned int *)(a6 + 40 * v17 + 8);
        v28 = *(_QWORD *)(v14 + 96);
        v29 = v28 == 0;
        v30 = v84;
      }
      if (v29)
        v28 = v30;
      v31 = *(_QWORD *)(v28 + 8 * *v27);
      v32 = v21 + 2;
      if (!v26)
        v32 = v21;
      v33 = *v32;
      v34 = *(unsigned int *)(a8 + 8);
      if (v17 >= v34)
      {
        if (*(_DWORD *)(a8 + 12) < (v34 + 1))
        {
          RB::vector<RB::BinAllocator::Shelf,0ul,unsigned int>::reserve_slow(a8, v34 + 1);
          v14 = v82;
          v15 = v83;
          v34 = *(unsigned int *)(a8 + 8);
        }
        v35 = (_QWORD *)(*(_QWORD *)a8 + 32 * v34);
        *v35 = 0;
        v35[1] = v23;
        v35[2] = 0;
        v35[3] = v23;
        ++*(_DWORD *)(a8 + 8);
        v26 = *v15 & 0xFLL;
      }
      if (v26)
        v36 = (float32x2_t *)(*(_QWORD *)a8 + v16 + 16);
      else
        v36 = (float32x2_t *)(*(_QWORD *)a8 + v16);
      v37 = v36[1];
      v38 = (uint32x2_t)vmvn_s8(vorr_s8((int8x8_t)vcltz_f32(v37), (int8x8_t)vcgez_f32(v37)));
      if ((vpmax_u32(v38, v38).u32[0] & 0x80000000) != 0)
      {
        v39 = (*(double (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v31 + 64))(v31, v33, *(_QWORD *)(v21 - 3) >> 36);
        v14 = v82;
        v15 = v83;
        *(double *)v36 = v39;
        v36[1] = v37;
      }
      v40 = (uint32x2_t)vclez_f32(v37);
      if ((vpmax_u32(v40, v40).u32[0] & 0x80000000) == 0)
      {
        switch(a5)
        {
          case 0:
            v41 = (int32x2_t)*v36;
            v42 = vsub_f32((float32x2_t)v81, vadd_f32(v37, *v36)).u32[0];
            goto LABEL_24;
          case 1:
            v41 = (int32x2_t)*v36;
            v42 = vsub_f32(*v36, v85).u32[0];
LABEL_24:
            if (*(float *)&v42 < 0.0 || *(float *)&v42 >= (float)v22)
              break;
            v44 = (int32x2_t)vadd_f32((float32x2_t)v41, v37);
            v45 = (int32x2_t)vbsl_s8((int8x8_t)vcgt_f32((float32x2_t)vzip2_s32(v81, v41), (float32x2_t)vzip2_s32(v44, (int32x2_t)v85)), (int8x8_t)vzip2_s32(v44, v41), v20);
            if ((vmvn_s8((int8x8_t)vcge_f32((float32x2_t)vdup_lane_s32(v45, 1), (float32x2_t)v45)).u32[0] & 1) == 0)
              break;
            v22 = (int)*(float *)&v42;
            v25 = (float32x2_t)v41;
            goto LABEL_45;
          case 2:
            v46 = v19 - (float)(v37.f32[1] + v36->f32[1]);
            goto LABEL_33;
          case 3:
            v46 = v36->f32[1] - v85.f32[1];
LABEL_33:
            if (v46 < 0.0 || v46 >= (float)v22)
              break;
            v48 = vadd_f32(*v36, v37);
            if ((vcgt_f32((float32x2_t)v81, v48).u8[0] & 1) == 0)
              v48.f32[0] = *(float *)v81.i32;
            if ((vcgt_f32(*v36, v85).u32[0] & 1) != 0)
              LODWORD(v49) = *(float32x2_t *)v36->f32;
            else
              v49 = v85.f32[0];
            if (v48.f32[0] <= v49)
              break;
            v22 = (int)v46;
            v25 = *v36;
LABEL_45:
            v24 = v37;
            v80 = v17;
            break;
          case 4:
          case 5:
            return;
          default:
            break;
        }
      }
      if (!v22)
        break;
      ++v17;
      v21 += 10;
      v16 += 32;
    }
    while (v17 < a7);
    if (v80 < a7)
    {
      v50 = *v15;
      v51 = *(_QWORD *)a8;
      if ((*v15 & 0xFLL) != 0)
      {
        v52 = a6 + 40 * v80;
        v53 = *(_QWORD *)(v14 + 96);
        if (!v53)
          v53 = v84;
        v54 = (_QWORD *)(v53 + 8 * *(unsigned int *)(v52 + 8));
        v55 = (unsigned int *)(v52 + 12);
        v56 = v51 + 32 * v80;
      }
      else
      {
        v57 = a6 + 40 * v80;
        v58 = *(_QWORD *)(v14 + 176);
        if (!v58)
          v58 = v87;
        v54 = (_QWORD *)(v58 + 8 * *(unsigned int *)(v57 + 16));
        v55 = (unsigned int *)(v57 + 20);
        v56 = v51 + 32 * v80 + 16;
      }
      v59 = *(float32x2_t *)(v56 + 8);
      v60 = (uint32x2_t)vmvn_s8(vorr_s8((int8x8_t)vcltz_f32(v59), (int8x8_t)vcgez_f32(v59)));
      if ((vpmax_u32(v60, v60).u32[0] & 0x80000000) != 0)
      {
        v61 = (*(double (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)*v54 + 64))(*v54, *v55, *(_QWORD *)(a6 + 40 * v80) >> 36);
        v15 = v83;
        *(double *)v56 = v61;
        *(float32x2_t *)(v56 + 8) = v59;
        v50 = *v83;
      }
      else
      {
        v61 = *(double *)v56;
      }
      v62 = v50 & 0xF;
      if (v62 == 8 || v62 == 1)
      {
        v63 = v59;
        v64 = *(float32x2_t *)&v61;
      }
      else
      {
        v63 = v24;
        v64 = v25;
        v24 = v59;
        v25 = *(float32x2_t *)&v61;
      }
      v65 = *(_DWORD *)(a2 + 240);
      if (v65 < 2)
        goto LABEL_68;
      v66 = *(_QWORD *)(a2 + 232);
      if (!v66)
        v66 = a2 + 200;
      v67 = (uint32x2_t)vand_s8((int8x8_t)vceq_f32(*(float32x2_t *)(v66 + 16 * (v65 - 2) + 8), v63), (int8x8_t)vceq_f32(*(float32x2_t *)(v66 + 16 * (v65 - 2)), v64));
      if ((vpmin_u32(v67, v67).u32[0] & 0x80000000) != 0
        && (v68 = v65 - 1,
            v69 = (uint32x2_t)vand_s8((int8x8_t)vceq_f32(*(float32x2_t *)(v66 + 16 * v68 + 8), v24), (int8x8_t)vceq_f32(*(float32x2_t *)(v66 + 16 * v68), v25)), (vpmin_u32(v69, v69).u32[0] & 0x80000000) != 0))
      {
        v65 -= 2;
      }
      else
      {
LABEL_68:
        v68 = v65 + 1;
        v70 = *(_DWORD *)(a2 + 240);
        if (*(_DWORD *)(a2 + 244) < v65 + 1)
        {
          RB::vector<RB::Rect,2ul,unsigned int>::reserve_slow((void *)(a2 + 200), v65 + 1);
          v15 = v83;
          v70 = *(_DWORD *)(a2 + 240);
        }
        v71 = *(_QWORD *)(a2 + 232);
        if (!v71)
          v71 = a2 + 200;
        v72 = (float32x2_t *)(v71 + 16 * v70);
        *v72 = v64;
        v72[1] = v63;
        v73 = *(_DWORD *)(a2 + 240);
        v74 = *(_DWORD *)(a2 + 244);
        v75 = v73 + 1;
        *(_DWORD *)(a2 + 240) = v73 + 1;
        if (v74 < v73 + 2)
        {
          RB::vector<RB::Rect,2ul,unsigned int>::reserve_slow((void *)(a2 + 200), v73 + 2);
          v15 = v83;
          v75 = *(_DWORD *)(a2 + 240);
        }
        v76 = *(_QWORD *)(a2 + 232);
        if (!v76)
          v76 = a2 + 200;
        v77 = (float32x2_t *)(v76 + 16 * v75);
        *v77 = v25;
        v77[1] = v24;
        ++*(_DWORD *)(a2 + 240);
      }
      *((_DWORD *)v15 + 6) = v65;
      *((_DWORD *)v15 + 7) = v68;
    }
  }
}

uint64_t RB::DisplayList::EditAdaptor::set_animation(int a1, _BYTE *a2, _DWORD *a3, int a4, RB::Animation *a5, uint64_t a6)
{
  unsigned int v8;
  BOOL v9;
  int v10;
  uint64_t result;
  const RB::Animation *v13;
  unsigned int *v14;

  v8 = *a3 & 0xF;
  v9 = v8 > 8;
  v10 = (1 << v8) & 0x130;
  if (v9 || v10 == 0)
  {
    if (a6)
    {
      if (*(_DWORD *)(a6 + 88))
        v13 = (const RB::Animation *)(a6 + 56);
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    v14 = *(unsigned int **)a2;
    if ((unint64_t)a5 | (unint64_t)v13)
      result = RB::DisplayList::Interpolator::Contents::intern_animation((RB::DisplayList::Interpolator::Contents *)v14, a5, v13);
    else
      result = v14[4];
  }
  else
  {
    result = 0xFFFFFFFFLL;
  }
  a3[8] = result;
  if ((_DWORD)result != *(_DWORD *)(*(_QWORD *)a2 + 20))
    a2[251] = 1;
  return result;
}

void RB::DisplayList::make_interpolator(RB::DisplayList *this, RB::DisplayList::Interpolator::Layer *a2, const RB::DisplayList::Item *a3, const RB::DisplayList::Item *a4)
{
  uint64_t v4;
  int v8;
  unint64_t v9;
  char v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  float *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  void *v19[2];
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  char v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)this;
  if (!*(_QWORD *)this)
    RB::precondition_failure((RB *)"missing contents", (const char *)a2, a3, a4);
  v8 = *(_DWORD *)(v4 + 72);
  *(_DWORD *)(v4 + 72) = 0;
  RB::DisplayList::Interpolator::Layer::clear(this);
  v9 = *(_QWORD *)(v4 + 24);
  if (v9 < 8)
  {
    *(_QWORD *)(v4 + 24) = v9 + 1;
    RB::DisplayList::EditAdaptor::EditAdaptor((RB::DisplayList::EditAdaptor *)v19, (RB::Transition ***)this, a2, a3);
    RB::DisplayList::EditAdaptor::finalize((RB::DisplayList::EditAdaptor *)v19, (uint64_t **)this);
    v10 = v25;
    *((_BYTE *)this + 250) |= v25 & 1;
    *((_BYTE *)this + 249) = (*((unsigned __int8 *)this + 249) | v24) != 0;
    *((_DWORD *)this + 2) = *(_DWORD *)(v4 + 72);
    if ((v10 & 2) != 0)
    {
      if (*((_BYTE *)this + 251))
      {
        v11 = (char *)this + 16;
        if (*((_QWORD *)this + 22))
          v11 = (char *)*((_QWORD *)this + 22);
        v12 = *((unsigned int *)this + 46);
        if ((_DWORD)v12)
        {
          v13 = 40 * v12;
          v14 = (float *)(v11 + 36);
          do
          {
            v15 = RB::DisplayList::Interpolator::Contents::animation_max_duration(*(RB::DisplayList::Interpolator::Contents **)this, *((_DWORD *)v14 - 1));
            v16 = *v14;
            v14 += 10;
            v17 = v16 + v15;
            if (*((float *)this + 2) >= v17)
              v17 = *((float *)this + 2);
            *((float *)this + 2) = v17;
            v13 -= 40;
          }
          while (v13);
        }
      }
      else
      {
        v18 = RB::DisplayList::Interpolator::Contents::animation_max_duration((RB::DisplayList::Interpolator::Contents *)v4, *(_DWORD *)(v4 + 20));
        if (*((float *)this + 2) >= v18)
          v18 = *((float *)this + 2);
        *((float *)this + 2) = v18;
      }
    }
    *(_DWORD *)(v4 + 72) = v8;
    --*(_QWORD *)(v4 + 24);
    if (v23)
      free(v23);
    if (v22)
      free(v22);
    if (v21)
      free(v21);
    if (v20)
      free(v20);
    if (v19[0])
      free(v19[0]);
  }
  else
  {
    RB::DisplayList::Interpolator::Layer::failed((uint64_t)this);
  }
}

void sub_209BC1B70(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  RB::DisplayList::EditAdaptor::~EditAdaptor((RB::DisplayList::EditAdaptor *)va);
  _Unwind_Resume(a1);
}

void RB::DisplayList::EditAdaptor::~EditAdaptor(RB::DisplayList::EditAdaptor *this)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)*((_QWORD *)this + 24);
  if (v2)
    free(v2);
  v3 = (void *)*((_QWORD *)this + 22);
  if (v3)
    free(v3);
  v4 = (void *)*((_QWORD *)this + 12);
  if (v4)
    free(v4);
  v5 = (void *)*((_QWORD *)this + 2);
  if (v5)
    free(v5);
  if (*(_QWORD *)this)
    free(*(void **)this);
}

void RB::DisplayList::make_interpolator(RB::DisplayList *this, RB::DisplayList::Interpolator::Layer **a2, const RB::DisplayList::Item **a3, const RB::DisplayList::Contents *a4)
{
  unsigned __int8 v7;
  FILE **v8;
  std::string *v9;
  RB::DisplayList::Interpolator::Layer *v10;
  const RB::DisplayList::Item *v11;
  unsigned __int8 v12;
  uint64_t v13;
  RB::DisplayList::Interpolator::Layer *v14;
  std::string *v15;
  const char *v16;
  uint64_t v17;
  unsigned int v18;
  const char *v19;
  unsigned int v20;
  std::string __p[2];

  if ((v7 & 1) == 0
  {
    v17 = RB::debug_int((RB *)"RB_PRINT_TREE", v16);
    v18 = (v17 >> 2) & 1;
    if ((v17 & 0xFF00000000) == 0)
      LOBYTE(v18) = 0;
    RB::DisplayList::make_interpolator(RB::DisplayList::Interpolator::Layer &,RB::DisplayList::Contents const*,RB::DisplayList::Contents const*)::print_tree = v18;
  }
  v8 = (FILE **)MEMORY[0x24BDAC8D8];
  if (!RB::DisplayList::make_interpolator(RB::DisplayList::Interpolator::Layer &,RB::DisplayList::Contents const*,RB::DisplayList::Contents const*)::print_tree)
    goto LABEL_11;
  memset(__p, 0, 41);
  RB::SexpString::push(__p, "make-interpolator");
  RB::SexpString::push(__p, "from");
  if (a2)
    RB::DisplayList::Contents::print((RB::DisplayList::Contents *)a2, __p);
  RB::SexpString::pop(__p);
  RB::SexpString::push(__p, "to");
  if (a3)
    RB::DisplayList::Contents::print((RB::DisplayList::Contents *)a3, __p);
  RB::SexpString::pop(__p);
  RB::SexpString::pop(__p);
  RB::SexpString::newline(__p);
  v9 = (__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
     ? __p
     : (std::string *)__p[0].__r_.__value_.__r.__words[0];
  fputs((const char *)v9, *v8);
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p[0].__r_.__value_.__l.__data_);
    if (a2)
    {
LABEL_12:
      if (!*((_BYTE *)a2 + 400))
        goto LABEL_18;
    }
  }
  else
  {
LABEL_11:
    if (a2)
      goto LABEL_12;
  }
  if (!a3 || *((_BYTE *)a3 + 400))
  {
    if (a2)
    {
      v10 = a2[40];
      if (a3)
      {
LABEL_17:
        v11 = a3[40];
LABEL_23:
        RB::DisplayList::make_interpolator(this, v10, v11, a4);
        goto LABEL_24;
      }
    }
    else
    {
      v10 = 0;
      if (a3)
        goto LABEL_17;
    }
    v11 = 0;
    goto LABEL_23;
  }
LABEL_18:
  RB::DisplayList::Interpolator::Layer::failed((uint64_t)this);
LABEL_24:
  if ((v12 & 1) == 0
  {
    v20 = (unsigned __int16)RB::debug_BOOL((RB *)"RB_PRINT_INTERPOLATORS", v19);
    if (v20 <= 0x100)
      LOBYTE(v20) = 0;
    RB::DisplayList::make_interpolator(RB::DisplayList::Interpolator::Layer &,RB::DisplayList::Contents const*,RB::DisplayList::Contents const*)::print_interpolators = v20 != 0;
  }
  if (RB::DisplayList::make_interpolator(RB::DisplayList::Interpolator::Layer &,RB::DisplayList::Contents const*,RB::DisplayList::Contents const*)::print_interpolators)
  {
    memset(__p, 0, 41);
    RB::SexpString::push(__p, "interpolator");
    RB::DisplayList::Interpolator::Layer::print(this, __p);
    v13 = *(_QWORD *)this + 48;
    while (1)
    {
      v13 = *(_QWORD *)v13;
      if (!v13)
        break;
      RB::SexpString::push(__p, "layer");
      RB::SexpString::printf(__p, 0, "#:ids (%d . %d)", *(_DWORD *)(v13 + 16), *(_DWORD *)(v13 + 20));
      v14 = *(RB::DisplayList::Interpolator::Layer **)(v13 + 24);
      if (v14)
        RB::DisplayList::Interpolator::Layer::print(v14, __p);
      RB::SexpString::pop(__p);
    }
    RB::SexpString::pop(__p);
    RB::SexpString::newline(__p);
    v15 = (__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? __p
        : (std::string *)__p[0].__r_.__value_.__r.__words[0];
    fputs((const char *)v15, *v8);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p[0].__r_.__value_.__l.__data_);
  }
}

void sub_209BC1EB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  _Unwind_Resume(a1);
}

void *RB::vector<RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::Mixed,128ul,unsigned int>::reserve_slow(void *__dst, unsigned int a2)
{
  unsigned int v3;
  void *result;

  if (*((_DWORD *)__dst + 387) + (*((_DWORD *)__dst + 387) >> 1) <= a2)
    v3 = a2;
  else
    v3 = *((_DWORD *)__dst + 387) + (*((_DWORD *)__dst + 387) >> 1);
  result = RB::details::realloc_vector<unsigned int,12ul>(*((void **)__dst + 192), __dst, 0x80u, (_DWORD *)__dst + 387, v3);
  *((_QWORD *)__dst + 192) = result;
  return result;
}

void *RB::vector<RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement,8ul,unsigned int>::reserve_slow(void *__dst, unsigned int a2)
{
  unsigned int v3;
  void *result;

  if (*((_DWORD *)__dst + 35) + (*((_DWORD *)__dst + 35) >> 1) <= a2)
    v3 = a2;
  else
    v3 = *((_DWORD *)__dst + 35) + (*((_DWORD *)__dst + 35) >> 1);
  result = RB::details::realloc_vector<unsigned int,16ul>(*((void **)__dst + 16), __dst, 8u, (_DWORD *)__dst + 35, v3);
  *((_QWORD *)__dst + 16) = result;
  return result;
}

void std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *,false>(float *a1, float *a2, uint64_t a3, char a4)
{
  float *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  float *v12;
  float v13;
  uint64_t v14;
  float v15;
  uint64_t v16;
  float v17;
  float *v18;
  float *v19;
  float *v20;
  float v21;
  float *v22;
  float v23;
  float *v24;
  float v25;
  float v26;
  BOOL v27;
  float *v28;
  float v29;
  float *v30;
  float v31;
  float *v32;
  float *v33;
  float v34;
  float v35;
  uint64_t v36;
  float v37;
  float v38;
  __int128 *v39;
  __int128 *v40;
  __int128 *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  float *v45;
  BOOL v47;
  uint64_t v48;
  float *v49;
  float *v50;
  float v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  float v55;
  uint64_t v56;
  int64_t v57;
  int64_t v58;
  int64_t v59;
  uint64_t v60;
  float *v61;
  float v62;
  float *v63;
  int v64;
  uint64_t v65;
  float *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  float *v71;
  float *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  float v77;
  int v78;
  uint64_t v79;
  float *v80;
  float *v82;
  float v83;
  int v84;
  uint64_t v85;
  float *v86;
  float v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;

float *std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>(float *result, float *a2, float *a3)
{
  float v3;
  float v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = a2[1];
  v4 = a3[1];
  if (v3 >= result[1])
  {
    if (v4 < v3)
    {
      v6 = *(_OWORD *)a2;
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(_OWORD *)a3 = v6;
      if (a2[1] < result[1])
      {
        v7 = *(_OWORD *)result;
        *(_OWORD *)result = *(_OWORD *)a2;
        *(_OWORD *)a2 = v7;
      }
    }
  }
  else
  {
    if (v4 >= v3)
    {
      v8 = *(_OWORD *)result;
      *(_OWORD *)result = *(_OWORD *)a2;
      *(_OWORD *)a2 = v8;
      if (a3[1] >= a2[1])
        return result;
      v5 = *(_OWORD *)a2;
      *(_OWORD *)a2 = *(_OWORD *)a3;
    }
    else
    {
      v5 = *(_OWORD *)result;
      *(_OWORD *)result = *(_OWORD *)a3;
    }
    *(_OWORD *)a3 = v5;
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>(float *a1, float *a2)
{
  uint64_t v4;
  _BOOL8 result;
  __int128 v6;
  float *v7;
  float *v8;
  uint64_t v9;
  int v10;
  float v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  uint64_t v16;
  __int128 *v17;
  __int128 *v18;
  __int128 *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v4 = ((char *)a2 - (char *)a1) >> 4;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      if (*(a2 - 3) < a1[1])
      {
        v6 = *(_OWORD *)a1;
        *(_OWORD *)a1 = *((_OWORD *)a2 - 1);
        *((_OWORD *)a2 - 1) = v6;
      }
      return result;
    case 3:
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>(a1, a1 + 4, a2 - 4);
      return 1;
    case 4:
      std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>(a1, (uint64_t)(a1 + 4), (uint64_t)(a1 + 8), (uint64_t)(a2 - 4));
      return 1;
    case 5:
      v17 = (__int128 *)(a1 + 4);
      v18 = (__int128 *)(a1 + 8);
      v19 = (__int128 *)(a1 + 12);
      std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>(a1, (uint64_t)(a1 + 4), (uint64_t)(a1 + 8), (uint64_t)(a1 + 12));
      if (*(a2 - 3) < a1[13])
      {
        v20 = *v19;
        *v19 = *((_OWORD *)a2 - 1);
        *((_OWORD *)a2 - 1) = v20;
        if (a1[13] < a1[9])
        {
          v21 = *v18;
          *v18 = *v19;
          *v19 = v21;
          if (a1[9] < a1[5])
          {
            v22 = *v17;
            *v17 = *v18;
            *v18 = v22;
            if (a1[5] < a1[1])
            {
              v23 = *(_OWORD *)a1;
              *(_OWORD *)a1 = *v17;
              *v17 = v23;
            }
          }
        }
      }
      return 1;
    default:
      v7 = a1 + 8;
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>(a1, a1 + 4, a1 + 8);
      v8 = a1 + 12;
      if (a1 + 12 == a2)
        return 1;
      v9 = 0;
      v10 = 0;
      break;
  }
  while (1)
  {
    v11 = v8[1];
    if (v11 < v7[1])
    {
      v12 = *(_DWORD *)v8;
      v13 = *((_QWORD *)v8 + 1);
      v14 = v9;
      while (1)
      {
        *(_OWORD *)((char *)a1 + v14 + 48) = *(_OWORD *)((char *)a1 + v14 + 32);
        if (v14 == -32)
          break;
        v15 = *(float *)((char *)a1 + v14 + 20);
        v14 -= 16;
        if (v11 >= v15)
        {
          v16 = (uint64_t)a1 + v14 + 48;
          goto LABEL_13;
        }
      }
      v16 = (uint64_t)a1;
LABEL_13:
      *(_DWORD *)v16 = v12;
      *(float *)(v16 + 4) = v11;
      *(_QWORD *)(v16 + 8) = v13;
      if (++v10 == 8)
        return v8 + 4 == a2;
    }
    v7 = v8;
    v9 += 16;
    v8 += 4;
    if (v8 == a2)
      return 1;
  }
}

__n128 std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>(float *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __n128 result;

  std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,RB::DisplayList::EditAdaptor::finalize_group(RB::DisplayList::Interpolator::Layer &,RB::Transition::Method,unsigned int,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int,RB::DisplayList::EditAdaptor::Element *,unsigned int)::SequenceElement *>(a1, (float *)a2, (float *)a3);
  result.n128_u32[0] = *(_DWORD *)(a4 + 4);
  if (result.n128_f32[0] < *(float *)(a3 + 4))
  {
    result = *(__n128 *)a3;
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(__n128 *)a4 = result;
    result.n128_u32[0] = *(_DWORD *)(a3 + 4);
    if (result.n128_f32[0] < *(float *)(a2 + 4))
    {
      result = *(__n128 *)a2;
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(__n128 *)a3 = result;
      result.n128_u32[0] = *(_DWORD *)(a2 + 4);
      if (result.n128_f32[0] < a1[1])
      {
        result = *(__n128 *)a1;
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(__n128 *)a2 = result;
      }
    }
  }
  return result;
}

void *std::get_temporary_buffer[abi:nn180100]<RB::DisplayList::EditAdaptor::Element>(uint64_t a1)
{
  unint64_t v1;
  const std::nothrow_t *v2;
  void *result;
  BOOL v4;

  if (a1 < 1)
    return 0;
  if (a1 >= 0x555555555555555)
    v1 = 0x555555555555555;
  else
    v1 = a1;
  v2 = (const std::nothrow_t *)MEMORY[0x24BEDB6B8];
  while (1)
  {
    result = operator new(24 * v1, v2);
    if (result)
      break;
    v4 = v1 > 1;
    v1 >>= 1;
    if (!v4)
      return 0;
  }
  return result;
}

__n128 std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>(__n128 *a1, __n128 *a2, unint64_t a3, __n128 *a4, uint64_t a5, __n128 result)
{
  __n128 *v7;
  __n128 *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v20;
  unint64_t v21;
  __n128 *v22;
  unint64_t v23;
  __n128 v24;
  __n128 *v25;
  __n128 *v26;
  __n128 *v27;
  unint64_t v28;
  __n128 *v29;
  uint64_t v30;
  __n128 *v31;
  __int128 v32;
  uint64_t v33;

  if (a3 >= 2)
  {
    v7 = a1;
    if (a3 == 2)
    {
      v8 = (__n128 *)((char *)a2 - 24);
      if (RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()((uint64_t)&a2[-2].n128_i64[1], (uint64_t)a1))
      {
        v9 = v7[1].n128_u64[0];
        result = *v7;
        v10 = a2[-1].n128_u64[1];
        *v7 = *v8;
        v7[1].n128_u64[0] = v10;
        *v8 = result;
        a2[-1].n128_u64[1] = v9;
      }
    }
    else if ((uint64_t)a3 > 128)
    {
      v20 = (uint64_t)a4;
      v21 = a3 >> 1;
      v22 = (__n128 *)((char *)a1 + 24 * (a3 >> 1));
      v23 = a3 >> 1;
      if ((uint64_t)a3 <= a5)
      {
        v24 = std::__stable_sort_move<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>(a1, v22, v23, a4, result);
        v25 = (__n128 *)(v20 + 24 * v21);
        result.n128_u64[0] = std::__stable_sort_move<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>((__n128 *)((char *)v7 + 24 * (a3 >> 1)), a2, a3 - (a3 >> 1), v25, v24).n128_u64[0];
        v26 = (__n128 *)(v20 + 24 * a3);
        v27 = v25;
        while (v27 != v26)
        {
          if (RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()((uint64_t)v27, v20))
          {
            result = *v27;
            v7[1].n128_u64[0] = v27[1].n128_u64[0];
            *v7 = result;
            v27 = (__n128 *)((char *)v27 + 24);
          }
          else
          {
            result = *(__n128 *)v20;
            v7[1].n128_u64[0] = *(_QWORD *)(v20 + 16);
            *v7 = result;
            v20 += 24;
          }
          v7 = (__n128 *)((char *)v7 + 24);
          if ((__n128 *)v20 == v25)
          {
            if (v27 != v26)
            {
              v28 = 0;
              do
              {
                v29 = (__n128 *)((char *)v7 + v28);
                result = *(__n128 *)((char *)v27 + v28);
                v29[1].n128_u64[0] = v27[1].n128_u64[v28 / 8];
                *v29 = result;
                v28 += 24;
              }
              while ((__n128 *)((char *)v27 + v28) != v26);
            }
            return result;
          }
        }
        if ((__n128 *)v20 != v25)
        {
          v30 = 0;
          do
          {
            v31 = (__n128 *)((char *)v7 + v30);
            result = *(__n128 *)(v20 + v30);
            v31[1].n128_u64[0] = *(_QWORD *)(v20 + v30 + 16);
            *v31 = result;
            v30 += 24;
          }
          while ((__n128 *)(v20 + v30) != v25);
        }
      }
      else
      {
        std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>(a1, v22, v23, a4, a5);
        std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>((char *)v7 + 24 * (a3 >> 1), a2, a3 - (a3 >> 1), v20, a5);
        std::__inplace_merge<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>((uint64_t)v7, (uint64_t)v7 + 24 * (a3 >> 1), (__int128 *)a2, a3 >> 1, a3 - (a3 >> 1), (char *)v20, a5);
      }
    }
    else if (a1 != a2)
    {
      v12 = (uint64_t)&a1[1].n128_i64[1];
      if (&a1[1].n128_i8[8] != (__int8 *)a2)
      {
        v13 = 0;
        v14 = (uint64_t)a1;
        do
        {
          v15 = v14;
          v14 = v12;
          if (RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()(v12, v15))
          {
            v32 = *(_OWORD *)v14;
            v33 = *(_QWORD *)(v14 + 16);
            v16 = v13;
            while (1)
            {
              v17 = (char *)v7 + v16;
              *(__n128 *)(v17 + 24) = *(__n128 *)((char *)v7 + v16);
              *((_QWORD *)v17 + 5) = *(unint64_t *)((char *)v7[1].n128_u64 + v16);
              if (!v16)
                break;
              v16 -= 24;
              if (!RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()((uint64_t)&v32, (uint64_t)v7 + v16))
              {
                v18 = (uint64_t)&v7[1].n128_i64[1] + v16;
                goto LABEL_15;
              }
            }
            v18 = (uint64_t)v7;
LABEL_15:
            result.n128_u64[0] = v32;
            *(_OWORD *)v18 = v32;
            *(_QWORD *)(v18 + 16) = v33;
          }
          v12 = v14 + 24;
          v13 += 24;
        }
        while ((__n128 *)(v14 + 24) != a2);
      }
    }
  }
  return result;
}

__n128 std::__stable_sort_move<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>(__n128 *a1, __n128 *a2, unint64_t a3, __n128 *a4, __n128 result)
{
  __n128 *v5;
  __n128 *v8;
  __n128 *v9;
  __n128 v10;
  unint64_t v11;
  __n128 *v12;
  uint64_t v13;
  __n128 *v14;
  uint64_t v15;
  __n128 *v16;
  uint64_t v17;
  __n128 v18;
  __n128 *v19;
  __n128 *v20;
  unint64_t v21;
  __n128 *v22;
  unint64_t v23;
  __n128 *v24;

  if (a3)
  {
    v5 = a4;
    v8 = a1;
    if (a3 == 2)
    {
      v9 = (__n128 *)((char *)a2 - 24);
      if (RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()((uint64_t)&a2[-2].n128_i64[1], (uint64_t)a1))
      {
        v10 = *v9;
        v5[1].n128_u64[0] = v9[1].n128_u64[0];
        *v5 = v10;
        result = *v8;
        v11 = v8[1].n128_u64[0];
      }
      else
      {
        v18 = *v8;
        v5[1].n128_u64[0] = v8[1].n128_u64[0];
        *v5 = v18;
        result = *v9;
        v11 = v9[1].n128_u64[0];
      }
      v5[2].n128_u64[1] = v11;
      *(__n128 *)((char *)v5 + 24) = result;
    }
    else if (a3 == 1)
    {
      result = *a1;
      a4[1].n128_u64[0] = a1[1].n128_u64[0];
      *a4 = result;
    }
    else if ((uint64_t)a3 > 8)
    {
      v19 = (__n128 *)((char *)a1 + 24 * (a3 >> 1));
      std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>(a1, v19, a3 >> 1, a4, a3 >> 1);
      std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>((char *)v8 + 24 * (a3 >> 1), a2, a3 - (a3 >> 1), (char *)v5 + 24 * (a3 >> 1), a3 - (a3 >> 1));
      v20 = (__n128 *)((char *)v8 + 24 * (a3 >> 1));
      while (v20 != a2)
      {
        if (RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()((uint64_t)v20, (uint64_t)v8))
        {
          result = *v20;
          v5[1].n128_u64[0] = v20[1].n128_u64[0];
          *v5 = result;
          v20 = (__n128 *)((char *)v20 + 24);
        }
        else
        {
          result = *v8;
          v5[1].n128_u64[0] = v8[1].n128_u64[0];
          *v5 = result;
          v8 = (__n128 *)((char *)v8 + 24);
        }
        v5 = (__n128 *)((char *)v5 + 24);
        if (v8 == v19)
        {
          if (v20 != a2)
          {
            v21 = 0;
            do
            {
              v22 = (__n128 *)((char *)v5 + v21);
              result = *(__n128 *)((char *)v20 + v21);
              v22[1].n128_u64[0] = v20[1].n128_u64[v21 / 8];
              *v22 = result;
              v21 += 24;
            }
            while ((__n128 *)((char *)v20 + v21) != a2);
          }
          return result;
        }
      }
      if (v8 != v19)
      {
        v23 = 0;
        do
        {
          v24 = (__n128 *)((char *)v5 + v23);
          result = *(__n128 *)((char *)v8 + v23);
          v24[1].n128_u64[0] = v8[1].n128_u64[v23 / 8];
          *v24 = result;
          v23 += 24;
        }
        while ((__n128 *)((char *)v8 + v23) != v19);
      }
    }
    else if (a1 != a2)
    {
      result = *a1;
      a4[1].n128_u64[0] = a1[1].n128_u64[0];
      *a4 = result;
      v12 = (__n128 *)((char *)a1 + 24);
      if (&a1[1].n128_i8[8] != (__int8 *)a2)
      {
        v13 = 0;
        v14 = a4;
        do
        {
          v15 = (uint64_t)v14;
          v14 = (__n128 *)((char *)v14 + 24);
          v16 = v14;
          if (RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()((uint64_t)v12, v15))
          {
            *v14 = *(__n128 *)v15;
            v14[1].n128_u64[0] = *(_QWORD *)(v15 + 16);
            v16 = v5;
            if ((__n128 *)v15 != v5)
            {
              v17 = v13;
              while (1)
              {
                v16 = (__n128 *)((char *)v5 + v17);
                if (!RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()((uint64_t)v12, (uint64_t)&v5[-1] + v17 - 8))break;
                *v16 = *(__n128 *)((char *)v5 + v17 - 24);
                v16[1].n128_u64[0] = *(unint64_t *)((char *)&v5->n128_u64[-1] + v17);
                v17 -= 24;
                if (!v17)
                {
                  v16 = v5;
                  break;
                }
              }
            }
          }
          result = *v12;
          v16[1].n128_u64[0] = v12[1].n128_u64[0];
          *v16 = result;
          v12 = (__n128 *)((char *)v12 + 24);
          v13 += 24;
        }
        while (v12 != a2);
      }
    }
  }
  return result;
}

uint64_t std::__inplace_merge<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>(uint64_t result, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5, char *a6, uint64_t a7)
{
  char *v12;
  char *i;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v24;
  unint64_t v25;
  __int128 *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 *v29;
  uint64_t v30;
  __int128 *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  __int128 v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  __int128 v43;
  char *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  char *v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *__src;
  __int128 *v56;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;

  v57 = a5;
  if (a5)
  {
    v12 = (char *)result;
    while (v57 > a7 && a4 > a7)
    {
      if (!a4)
        return result;
      for (i = v12; ; i += 24)
      {
        result = RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()(a2, (uint64_t)v12);
        if ((result & 1) != 0)
          break;
        v12 += 24;
        if (!--a4)
          return result;
      }
      v14 = v57;
      __src = a6;
      v56 = a3;
      if (a4 >= v57)
      {
        if (a4 == 1)
        {
          v59 = *((_QWORD *)v12 + 2);
          v58 = *(_OWORD *)v12;
          v47 = *(_OWORD *)a2;
          *((_QWORD *)v12 + 2) = *(_QWORD *)(a2 + 16);
          *(_OWORD *)v12 = v47;
          *(_QWORD *)(a2 + 16) = v59;
          *(_OWORD *)a2 = v58;
          return result;
        }
        if (a4 >= 0)
          v20 = a4;
        else
          v20 = a4 + 1;
        v18 = v20 >> 1;
        v16 = &v12[24 * (v20 >> 1)];
        if (a3 != (__int128 *)a2)
        {
          v52 = v20 >> 1;
          v54 = a7;
          v21 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)a3 - a2) >> 3);
          a3 = (__int128 *)a2;
          do
          {
            v22 = (uint64_t)a3 + 24 * (v21 >> 1);
            v23 = RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()(v22, (uint64_t)v16);
            if (v23)
              v21 += ~(v21 >> 1);
            else
              v21 >>= 1;
            if (v23)
              a3 = (__int128 *)(v22 + 24);
          }
          while (v21);
          v18 = v52;
          a7 = v54;
          v14 = v57;
        }
        v19 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)a3 - a2) >> 3);
      }
      else
      {
        if (v57 >= 0)
          v15 = v57;
        else
          v15 = v57 + 1;
        v51 = v15 >> 1;
        v53 = a7;
        a3 = (__int128 *)(a2 + 24 * (v15 >> 1));
        v16 = (char *)a2;
        if (v12 != (char *)a2)
        {
          v17 = 0xAAAAAAAAAAAAAAABLL * ((a2 - (uint64_t)i) >> 3);
          v16 = v12;
          do
          {
            if (RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()((uint64_t)a3, (uint64_t)&v16[24 * (v17 >> 1)]))
            {
              v17 >>= 1;
            }
            else
            {
              v16 += 24 * (v17 >> 1) + 24;
              v17 += ~(v17 >> 1);
            }
          }
          while (v17);
        }
        v18 = 0xAAAAAAAAAAAAAAABLL * ((v16 - i) >> 3);
        v19 = v51;
        a7 = v53;
        v14 = v57;
      }
      v24 = a4 - v18;
      v25 = v14 - v19;
      v26 = (__int128 *)a2;
      v27 = v14;
      v28 = v18;
      v29 = std::__rotate[abi:nn180100]<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::Element *,RB::DisplayList::EditAdaptor::Element *>(v16, v26, a3);
      v30 = v28;
      v31 = v29;
      if ((uint64_t)(v30 + v19) >= (uint64_t)(v27 - (v30 + v19) + a4))
      {
        v33 = v30;
        result = std::__inplace_merge<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>(v29, a3, v56, v24, v25, __src, a7);
        a3 = (__int128 *)v16;
        a6 = __src;
        v25 = v19;
        v24 = v33;
        v56 = v31;
      }
      else
      {
        v32 = v16;
        a6 = __src;
        result = std::__inplace_merge<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2 &,RB::DisplayList::EditAdaptor::Element *>(v12, v32, v29, v30, v19, __src, a7);
        v12 = (char *)v31;
      }
      a4 = v24;
      v57 = v25;
      a2 = (uint64_t)a3;
      a3 = v56;
      if (!v25)
        return result;
    }
    if (a4 <= v57)
    {
      if (v12 != (char *)a2)
      {
        v41 = 0;
        do
        {
          v42 = &a6[v41];
          v43 = *(_OWORD *)&v12[v41];
          *((_QWORD *)v42 + 2) = *(_QWORD *)&v12[v41 + 16];
          *(_OWORD *)v42 = v43;
          v41 += 24;
        }
        while (&v12[v41] != (char *)a2);
        if (v41)
        {
          v44 = a6;
          while ((__int128 *)a2 != a3)
          {
            result = RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()(a2, (uint64_t)v44);
            if ((_DWORD)result)
            {
              v45 = *(_OWORD *)a2;
              *((_QWORD *)v12 + 2) = *(_QWORD *)(a2 + 16);
              *(_OWORD *)v12 = v45;
              a2 += 24;
            }
            else
            {
              v46 = *(_OWORD *)v44;
              *((_QWORD *)v12 + 2) = *((_QWORD *)v44 + 2);
              *(_OWORD *)v12 = v46;
              v44 += 24;
            }
            v12 += 24;
            if (&a6[v41] == v44)
              return result;
          }
          return (uint64_t)memmove(v12, v44, a6 - v44 + v41);
        }
      }
    }
    else if ((__int128 *)a2 != a3)
    {
      v34 = 0;
      do
      {
        v35 = &a6[v34];
        v36 = *(_OWORD *)(a2 + v34);
        *((_QWORD *)v35 + 2) = *(_QWORD *)(a2 + v34 + 16);
        *(_OWORD *)v35 = v36;
        v34 += 24;
      }
      while ((__int128 *)(a2 + v34) != a3);
      if (v34)
      {
        v37 = &a6[v34];
        v38 = (char *)a3 - 24;
        while ((char *)a2 != v12)
        {
          result = RB::DisplayList::EditAdaptor::EditAdaptor(RB::DisplayList::Interpolator::Layer const&,RB::DisplayList::Item const*,RB::DisplayList::Item const*)::$_2::operator()((uint64_t)(v37 - 24), a2 - 24);
          if ((_DWORD)result)
            v39 = a2 - 24;
          else
            v39 = (uint64_t)(v37 - 24);
          if ((_DWORD)result)
            a2 -= 24;
          v40 = *(_QWORD *)(v39 + 16);
          if (!(_DWORD)result)
            v37 -= 24;
          *(_OWORD *)v38 = *(_OWORD *)v39;
          *((_QWORD *)v38 + 2) = v40;
          v38 -= 24;
          if (v37 == a6)
            return result;
        }
        v48 = 0;
        do
        {
          v49 = &v38[v48];
          v50 = *(_OWORD *)&v37[v48 - 24];
          *((_QWORD *)v49 + 2) = *(_QWORD *)&v37[v48 - 8];
          *(_OWORD *)v49 = v50;
          v48 -= 24;
        }
        while (&v37[v48] != a6);
      }
    }
  }
  return result;
}

__int128 *std::__rotate[abi:nn180100]<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::Element *,RB::DisplayList::EditAdaptor::Element *>(char *__src, __int128 *a2, __int128 *a3)
{
  __int128 *v4;
  int64_t v6;
  size_t v7;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  if (__src != (char *)a2)
  {
    if (a2 == a3)
    {
      return (__int128 *)__src;
    }
    else if (__src + 24 == (char *)a2)
    {
      v9 = *(_OWORD *)__src;
      v11 = *((_QWORD *)__src + 2);
      v6 = (char *)a3 - (char *)a2;
      memmove(__src, a2, (char *)a3 - (char *)a2);
      v4 = (__int128 *)&__src[v6];
      *v4 = v9;
      *((_QWORD *)v4 + 2) = v11;
    }
    else if ((__int128 *)((char *)a2 + 24) == a3)
    {
      v4 = (__int128 *)(__src + 24);
      v10 = *(__int128 *)((char *)a3 - 24);
      v12 = *((_QWORD *)a3 - 1);
      v7 = (char *)a3 - 24 - __src;
      if ((char *)a3 - 24 != __src)
        memmove(__src + 24, __src, v7);
      *(_OWORD *)__src = v10;
      *((_QWORD *)__src + 2) = v12;
    }
    else
    {
      return std::__rotate_gcd[abi:nn180100]<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::Element *>((__int128 *)__src, a2, a3);
    }
  }
  return v4;
}

__int128 *std::__rotate_gcd[abi:nn180100]<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::Element *>(__int128 *a1, __int128 *a2, __int128 *a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  __int128 *v13;
  __int128 v14;
  uint64_t v15;
  __int128 *v16;
  __int128 *v17;
  __int128 *v18;
  __int128 v19;
  unint64_t v20;
  BOOL v21;
  char v22;
  uint64_t v23;
  __int128 v25;
  uint64_t v26;

  v3 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)a1) >> 3);
  if (v3 == 0xAAAAAAAAAAAAAAABLL * (((char *)a3 - (char *)a2) >> 3))
  {
    if (a1 != a2 && a2 != a3)
    {
      v4 = 0;
      do
      {
        v5 = (uint64_t)a2 + v4;
        v6 = (uint64_t)a1 + v4;
        v7 = *(_QWORD *)((char *)a1 + v4 + 16);
        v8 = *(__int128 *)((char *)a1 + v4);
        v9 = *(_QWORD *)((char *)a2 + v4 + 16);
        *(_OWORD *)v6 = *(__int128 *)((char *)a2 + v4);
        *(_QWORD *)(v6 + 16) = v9;
        *(_OWORD *)v5 = v8;
        *(_QWORD *)(v5 + 16) = v7;
        if ((__int128 *)((char *)a1 + v4 + 24) == a2)
          break;
        v4 += 24;
      }
      while ((__int128 *)(v5 + 24) != a3);
    }
  }
  else
  {
    v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)a3 - (char *)a2) >> 3);
    v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)a1) >> 3);
    do
    {
      v12 = v11;
      v11 = v10;
      v10 = v12 % v10;
    }
    while (v10);
    if (v11)
    {
      v13 = (__int128 *)((char *)a1 + 24 * v11);
      do
      {
        v14 = *(__int128 *)((char *)v13 - 24);
        v15 = *((_QWORD *)v13 - 1);
        v13 = (__int128 *)((char *)v13 - 24);
        v25 = v14;
        v26 = v15;
        v16 = (__int128 *)((char *)v13 + 8 * (((char *)a2 - (char *)a1) >> 3));
        v17 = v13;
        do
        {
          v18 = v17;
          v17 = v16;
          v19 = *v16;
          *((_QWORD *)v18 + 2) = *((_QWORD *)v16 + 2);
          *v18 = v19;
          v20 = 0xAAAAAAAAAAAAAAABLL * (((char *)a3 - (char *)v16) >> 3);
          v21 = __OFSUB__(v3, v20);
          v23 = v3 - v20;
          v22 = (v23 < 0) ^ v21;
          v16 = (__int128 *)((char *)a1 + 24 * v23);
          if (v22)
            v16 = (__int128 *)((char *)v17 + 8 * (((char *)a2 - (char *)a1) >> 3));
        }
        while (v16 != v13);
        *((_QWORD *)v17 + 2) = v26;
        *v17 = v25;
      }
      while (v13 != a1);
    }
    return (__int128 *)((char *)a1 + 8 * (((char *)a3 - (char *)a2) >> 3));
  }
  return a2;
}

void *RB::vector<RB::Rect,2ul,unsigned int>::reserve_slow(void *__dst, unsigned int a2)
{
  unsigned int v3;
  void *result;

  if (*((_DWORD *)__dst + 11) + (*((_DWORD *)__dst + 11) >> 1) <= a2)
    v3 = a2;
  else
    v3 = *((_DWORD *)__dst + 11) + (*((_DWORD *)__dst + 11) >> 1);
  result = RB::details::realloc_vector<unsigned int,16ul>(*((void **)__dst + 4), __dst, 2u, (_DWORD *)__dst + 11, v3);
  *((_QWORD *)__dst + 4) = result;
  return result;
}

void *std::get_temporary_buffer[abi:nn180100]<RB::DisplayList::Interpolator::Op>(uint64_t a1)
{
  unint64_t v1;
  const std::nothrow_t *v2;
  void *result;
  BOOL v4;

  if (a1 < 1)
    return 0;
  if (a1 >= 0x333333333333333)
    v1 = 0x333333333333333;
  else
    v1 = a1;
  v2 = (const std::nothrow_t *)MEMORY[0x24BEDB6B8];
  while (1)
  {
    result = operator new(40 * v1, v2);
    if (result)
      break;
    v4 = v1 > 1;
    v1 >>= 1;
    if (!v4)
      return 0;
  }
  return result;
}

void std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>(__int128 *a1, __int128 *a2, unint64_t a3, uint64_t *a4, uint64_t a5, __n128 a6)
{
  __int128 *v7;
  __int128 *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  int v13;
  int v14;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  BOOL v25;
  int v26;
  BOOL v27;
  BOOL v28;
  BOOL v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  __int128 v34;
  uint64_t *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int v40;
  BOOL v41;
  unsigned int v42;
  int v43;
  __int128 v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  BOOL v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  uint64_t *v63;
  unint64_t v64;
  uint64_t *v65;
  unint64_t v66;
  unsigned int v67;
  unsigned int v68;
  unsigned int v69;
  unsigned int v70;
  __n128 v71;
  uint64_t *v72;
  uint64_t *v73;
  uint64_t *v74;
  uint64_t v75;
  unsigned int v76;
  uint64_t v77;
  uint64_t v78;
  unsigned int v80;
  unsigned int v81;
  BOOL v82;
  unsigned int v83;
  unsigned int v84;
  int v85;
  BOOL v86;
  int v87;
  BOOL v88;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  unsigned int v94;
  unsigned int v95;
  unsigned int v96;
  unsigned int v97;
  uint64_t v98;
  uint64_t v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;
  uint64_t v103;
  __int128 v104;
  __int128 v105;
  unsigned int v106;
  unsigned int v107;
  unsigned int v108;
  unsigned int v109;
  __int128 v110;

  if (a3 < 2)
    return;
  v7 = a1;
  if (a3 == 2)
  {
    v8 = (__int128 *)((char *)a2 - 40);
    v9 = *((_QWORD *)a2 - 5);
    v10 = *(_QWORD *)a1;
    if (v9 >> 4 == *(_QWORD *)a1 >> 4)
    {
      v11 = *(_QWORD *)a1 & 0xFLL;
      v12 = (v9 & 0xF) == 0 || v11 == 0;
      if (v12
        || (v67 = *((_DWORD *)a2 - 6), v68 = *((_DWORD *)a1 + 4), v56 = v67 >= v68, v67 == v68)
        && (v69 = *((_DWORD *)a2 - 5), v70 = *((_DWORD *)a1 + 5), v56 = v69 >= v70, v69 == v70))
      {
        v13 = v9 & 0xF;
        if (v13 == 1
          || v13 == 8
          || (v14 = v10 & 0xF, v14 == 1)
          || v14 == 8
          || (v106 = *((_DWORD *)a2 - 8), v107 = *((_DWORD *)a1 + 2), v56 = v106 >= v107, v106 == v107)
          && (v108 = *((_DWORD *)a2 - 7), v109 = *((_DWORD *)a1 + 3), v56 = v108 >= v109, v108 == v109))
        {
          if ((*((_QWORD *)a2 - 5) & 0xFLL) == 0 || v11)
            return;
LABEL_80:
          v57 = *a1;
          v58 = a1[1];
          v59 = *((_QWORD *)a1 + 4);
          v60 = *((_QWORD *)a2 - 1);
          v61 = *(__int128 *)((char *)a2 - 24);
          *a1 = *v8;
          a1[1] = v61;
          *((_QWORD *)a1 + 4) = v60;
          *((_QWORD *)a2 - 1) = v59;
          *v8 = v57;
          *(__int128 *)((char *)a2 - 24) = v58;
          return;
        }
      }
    }
    else
    {
      v56 = v9 >> 4 >= v10 >> 4;
    }
    if (v56)
      return;
    goto LABEL_80;
  }
  if ((uint64_t)a3 > 128)
  {
    v63 = a4;
    v64 = a3 >> 1;
    v65 = (uint64_t *)a1 + 5 * (a3 >> 1);
    v66 = a3 >> 1;
    if ((uint64_t)a3 > a5)
    {
      std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>(a1, v65, v66, a4, a5);
      std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>((char *)v7 + 40 * (a3 >> 1), a2, a3 - (a3 >> 1), v63, a5);
      std::__inplace_merge<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>(v7, (__int128 *)((char *)v7 + 40 * (a3 >> 1)), a2, a3 >> 1, a3 - (a3 >> 1), (char *)v63, a5);
      return;
    }
    v71 = std::__stable_sort_move<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>((uint64_t *)a1, v65, v66, a4, a6);
    v72 = &v63[5 * v64];
    std::__stable_sort_move<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>((uint64_t *)v7 + 5 * (a3 >> 1), (uint64_t *)a2, a3 - (a3 >> 1), v72, v71);
    v73 = &v63[5 * a3];
    v74 = v72;
    while (1)
    {
      if (v74 == v73)
      {
        if (v63 != v72)
        {
          v98 = 0;
          do
          {
            v99 = (uint64_t)v7 + v98 * 8;
            v100 = *(_OWORD *)&v63[v98];
            v101 = *(_OWORD *)&v63[v98 + 2];
            *(_QWORD *)(v99 + 32) = v63[v98 + 4];
            *(_OWORD *)v99 = v100;
            *(_OWORD *)(v99 + 16) = v101;
            v98 += 5;
          }
          while (&v63[v98] != v72);
        }
        return;
      }
      v75 = *v74;
      v76 = *v74 >> 4;
      v77 = *v63;
      if (v76 != *v63 >> 4)
        break;
      v78 = *v63 & 0xF;
      if ((v75 & 0xF) != 0 && v78 != 0)
      {
        v80 = *((_DWORD *)v74 + 4);
        v81 = *((_DWORD *)v63 + 4);
        v82 = v80 >= v81;
        if (v80 != v81)
          goto LABEL_110;
        v83 = *((_DWORD *)v74 + 5);
        v84 = *((_DWORD *)v63 + 5);
        v82 = v83 >= v84;
        if (v83 != v84)
          goto LABEL_110;
      }
      v85 = v75 & 0xF;
      v86 = v85 == 1 || v85 == 8;
      v87 = v77 & 0xF;
      v88 = v86 || v87 == 1;
      if (!v88 && v87 != 8)
      {
        v94 = *((_DWORD *)v74 + 2);
        v95 = *((_DWORD *)v63 + 2);
        v82 = v94 >= v95;
        if (v94 != v95)
          goto LABEL_110;
        v96 = *((_DWORD *)v74 + 3);
        v97 = *((_DWORD *)v63 + 3);
        v82 = v96 >= v97;
        if (v96 != v97)
          goto LABEL_110;
      }
      if ((*v74 & 0xF) == 0 || v78)
      {
LABEL_112:
        v92 = *(_OWORD *)v63;
        v93 = *((_OWORD *)v63 + 1);
        *((_QWORD *)v7 + 4) = v63[4];
        *v7 = v92;
        v7[1] = v93;
        v63 += 5;
        goto LABEL_113;
      }
LABEL_108:
      v90 = *(_OWORD *)v74;
      v91 = *((_OWORD *)v74 + 1);
      *((_QWORD *)v7 + 4) = v74[4];
      *v7 = v90;
      v7[1] = v91;
      v74 += 5;
LABEL_113:
      v7 = (__int128 *)((char *)v7 + 40);
      if (v63 == v72)
      {
        if (v74 != v73)
        {
          v102 = 0;
          do
          {
            v103 = (uint64_t)v7 + v102 * 8;
            v104 = *(_OWORD *)&v74[v102];
            v105 = *(_OWORD *)&v74[v102 + 2];
            *(_QWORD *)(v103 + 32) = v74[v102 + 4];
            *(_OWORD *)v103 = v104;
            *(_OWORD *)(v103 + 16) = v105;
            v102 += 5;
          }
          while (&v74[v102] != v73);
        }
        return;
      }
    }
    v82 = v76 >= v77 >> 4;
LABEL_110:
    if (v82)
      goto LABEL_112;
    goto LABEL_108;
  }
  if (a1 == a2)
    return;
  v16 = (uint64_t *)a1 + 5;
  if ((__int128 *)((char *)a1 + 40) == a2)
    return;
  v17 = 0;
  v18 = (uint64_t *)a1;
  do
  {
    v19 = v18;
    v18 = v16;
    v20 = v19[5];
    v21 = v20 >> 4;
    v22 = *v19;
    if (v20 >> 4 == *v19 >> 4)
    {
      v23 = *v19 & 0xF;
      v24 = (v20 & 0xF) == 0 || v23 == 0;
      if (v24
        || (v48 = *((_DWORD *)v19 + 14), v49 = *((_DWORD *)v19 + 4), v29 = v48 >= v49, v48 == v49)
        && (v50 = *((_DWORD *)v19 + 15), v51 = *((_DWORD *)v19 + 5), v29 = v50 >= v51, v50 == v51))
      {
        v25 = (v20 & 0xF) == 1 || (v20 & 0xF) == 8;
        v26 = v22 & 0xF;
        v27 = v25 || v26 == 1;
        v28 = v27 || v26 == 8;
        if (v28
          || (v52 = *((_DWORD *)v19 + 12), v53 = *((_DWORD *)v19 + 2), v29 = v52 >= v53, v52 == v53)
          && (v54 = *((_DWORD *)v19 + 13), v55 = *((_DWORD *)v19 + 3), v29 = v54 >= v55, v54 == v55))
        {
          if ((v20 & 0xF) == 0 || v23)
            goto LABEL_73;
          goto LABEL_43;
        }
      }
    }
    else
    {
      v29 = v21 >= v22 >> 4;
    }
    if (v29)
      goto LABEL_73;
LABEL_43:
    v30 = *((_DWORD *)v19 + 12);
    v31 = *((_DWORD *)v19 + 13);
    v32 = *((_DWORD *)v19 + 14);
    v33 = *((_DWORD *)v19 + 15);
    v110 = *((_OWORD *)v19 + 4);
    v18[4] = v19[4];
    v34 = *((_OWORD *)v19 + 1);
    *(_OWORD *)v18 = *(_OWORD *)v19;
    *((_OWORD *)v18 + 1) = v34;
    v35 = (uint64_t *)v7;
    if (v19 == (uint64_t *)v7)
      goto LABEL_72;
    v36 = v20 & 0xF;
    v37 = v17;
    while (1)
    {
      v38 = (uint64_t)v7 + v37;
      v39 = *(_QWORD *)((char *)v7 + v37 - 40);
      if (v21 != v39 >> 4)
      {
        v41 = v21 >= v39 >> 4;
LABEL_61:
        if (v41)
          goto LABEL_71;
        goto LABEL_62;
      }
      if ((v20 & 0xF) != 0 && (v39 & 0xF) != 0)
      {
        v40 = *(_DWORD *)((char *)v7 + v37 - 24);
        v41 = v32 >= v40;
        if (v32 != v40)
          goto LABEL_61;
        v42 = *(_DWORD *)((char *)v7 + v37 - 20);
        v41 = v33 >= v42;
        if (v33 != v42)
          goto LABEL_61;
      }
      if (v36 == 1 || v36 == 8)
        break;
      v43 = v39 & 0xF;
      if (v43 == 1 || v43 == 8)
        break;
      v46 = *(_DWORD *)((char *)v7 + v37 - 32);
      v41 = v30 >= v46;
      if (v30 != v46)
        goto LABEL_61;
      v47 = *(_DWORD *)((char *)v7 + v37 - 28);
      if (v31 == v47)
        break;
      if (v31 >= v47)
      {
        v35 = (uint64_t *)((char *)v7 + v37);
        goto LABEL_72;
      }
LABEL_62:
      v19 -= 5;
      v45 = *(__int128 *)((char *)v7 + v37 - 24);
      *(_OWORD *)v38 = *(__int128 *)((char *)v7 + v37 - 40);
      *(_OWORD *)(v38 + 16) = v45;
      *(_QWORD *)(v38 + 32) = *(_QWORD *)((char *)v7 + v37 - 8);
      v37 -= 40;
      if (!v37)
      {
        v35 = (uint64_t *)v7;
        goto LABEL_72;
      }
    }
    if ((v20 & 0xF) != 0 && (*(_QWORD *)((_BYTE *)v7 + v37 - 40) & 0xFLL) == 0)
      goto LABEL_62;
LABEL_71:
    v35 = v19;
LABEL_72:
    *v35 = v20;
    *((_DWORD *)v35 + 2) = v30;
    *((_DWORD *)v35 + 3) = v31;
    *((_DWORD *)v35 + 4) = v32;
    *((_DWORD *)v35 + 5) = v33;
    *(_OWORD *)(v35 + 3) = v110;
LABEL_73:
    v16 = v18 + 5;
    v17 += 40;
  }
  while (v18 + 5 != (uint64_t *)a2);
}

__n128 std::__stable_sort_move<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>(uint64_t *a1, uint64_t *a2, unint64_t a3, uint64_t *a4, __n128 result)
{
  uint64_t *v5;
  uint64_t *v8;
  __int128 v9;
  __n128 *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  int v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  BOOL v19;
  unsigned int v20;
  unsigned int v21;
  __n128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t *v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v37;
  BOOL v38;
  int v39;
  BOOL v40;
  uint64_t *v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  BOOL v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unsigned int v58;
  uint64_t v59;
  int v61;
  BOOL v62;
  int v63;
  BOOL v64;
  BOOL v66;
  __int128 v67;
  unsigned int v68;
  unsigned int v69;
  unsigned int v70;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  __int128 v76;
  __n128 v77;
  __int128 v78;
  uint64_t *v79;
  uint64_t *v80;
  uint64_t v81;
  unsigned int v82;
  uint64_t v83;
  uint64_t v84;
  int v86;
  BOOL v87;
  int v88;
  BOOL v89;
  __int128 v91;
  BOOL v92;
  unsigned int v93;
  unsigned int v94;
  unsigned int v95;
  unsigned int v96;
  unsigned int v97;
  unsigned int v98;
  unsigned int v99;
  unsigned int v100;
  __int128 v101;
  uint64_t v102;
  uint64_t *v103;
  __int128 v104;
  uint64_t v105;
  uint64_t *v106;
  __int128 v107;
  unsigned int v108;
  unsigned int v109;
  unsigned int v110;
  unsigned int v111;

  if (!a3)
    return result;
  v5 = a4;
  v8 = a1;
  if (a3 == 2)
  {
    v10 = (__n128 *)(a2 - 5);
    v11 = *(a2 - 5);
    v12 = *a1;
    if (v11 >> 4 == *a1 >> 4)
    {
      v13 = *a1 & 0xF;
      v14 = (v11 & 0xF) == 0 || v13 == 0;
      if (v14
        || (v108 = *((_DWORD *)a2 - 6), v109 = *((_DWORD *)a1 + 4), v19 = v108 >= v109, v108 == v109)
        && (v110 = *((_DWORD *)a2 - 5), v111 = *((_DWORD *)a1 + 5), v19 = v110 >= v111, v110 == v111))
      {
        v15 = v11 & 0xF;
        if (v15 == 1
          || v15 == 8
          || (v16 = v12 & 0xF, v16 == 1)
          || v16 == 8
          || (v17 = *((_DWORD *)a2 - 8), v18 = *((_DWORD *)a1 + 2), v19 = v17 >= v18, v17 == v18)
          && (v20 = *((_DWORD *)a2 - 7), v21 = *((_DWORD *)a1 + 3), v19 = v20 >= v21, v20 == v21))
        {
          if ((*(a2 - 5) & 0xF) != 0 && !v13)
            goto LABEL_19;
          goto LABEL_91;
        }
      }
    }
    else
    {
      v19 = v11 >> 4 >= v12 >> 4;
    }
    if (!v19)
    {
LABEL_19:
      v22 = *v10;
      v23 = *(_OWORD *)(a2 - 3);
      a4[4] = *(a2 - 1);
      *(__n128 *)a4 = v22;
      *((_OWORD *)a4 + 1) = v23;
      result = *(__n128 *)a1;
      v24 = *((_OWORD *)a1 + 1);
      v25 = a1[4];
LABEL_92:
      a4[9] = v25;
      *(_OWORD *)(a4 + 7) = v24;
      *(__n128 *)(a4 + 5) = result;
      return result;
    }
LABEL_91:
    v77 = *(__n128 *)a1;
    v78 = *((_OWORD *)a1 + 1);
    a4[4] = a1[4];
    *(__n128 *)a4 = v77;
    *((_OWORD *)a4 + 1) = v78;
    result = *v10;
    v24 = *(_OWORD *)(a2 - 3);
    v25 = *(a2 - 1);
    goto LABEL_92;
  }
  if (a3 == 1)
  {
    result = *(__n128 *)a1;
    v9 = *((_OWORD *)a1 + 1);
    a4[4] = a1[4];
    *(__n128 *)a4 = result;
    *((_OWORD *)a4 + 1) = v9;
    return result;
  }
  if ((uint64_t)a3 > 8)
  {
    v79 = &a1[5 * (a3 >> 1)];
    std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>(a1, v79, a3 >> 1, a4, a3 >> 1);
    std::__stable_sort<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>(&v8[5 * (a3 >> 1)], a2, a3 - (a3 >> 1), &v5[5 * (a3 >> 1)], a3 - (a3 >> 1));
    v80 = &v8[5 * (a3 >> 1)];
    while (1)
    {
      if (v80 == a2)
      {
        if (v8 != v79)
        {
          v105 = 0;
          do
          {
            v106 = &v5[v105];
            result = *(__n128 *)&v8[v105];
            v107 = *(_OWORD *)&v8[v105 + 2];
            v106[4] = v8[v105 + 4];
            *(__n128 *)v106 = result;
            *((_OWORD *)v106 + 1) = v107;
            v105 += 5;
          }
          while (&v8[v105] != v79);
        }
        return result;
      }
      v81 = *v80;
      v82 = *v80 >> 4;
      v83 = *v8;
      if (v82 != *v8 >> 4)
        break;
      v84 = *v8 & 0xF;
      if ((v81 & 0xF) != 0 && v84 != 0)
      {
        v93 = *((_DWORD *)v80 + 4);
        v94 = *((_DWORD *)v8 + 4);
        v92 = v93 >= v94;
        if (v93 != v94)
          goto LABEL_122;
        v95 = *((_DWORD *)v80 + 5);
        v96 = *((_DWORD *)v8 + 5);
        v92 = v95 >= v96;
        if (v95 != v96)
          goto LABEL_122;
      }
      v86 = v81 & 0xF;
      v87 = v86 == 1 || v86 == 8;
      v88 = v83 & 0xF;
      v89 = v87 || v88 == 1;
      if (!v89 && v88 != 8)
      {
        v97 = *((_DWORD *)v80 + 2);
        v98 = *((_DWORD *)v8 + 2);
        v92 = v97 >= v98;
        if (v97 != v98)
          goto LABEL_122;
        v99 = *((_DWORD *)v80 + 3);
        v100 = *((_DWORD *)v8 + 3);
        v92 = v99 >= v100;
        if (v99 != v100)
          goto LABEL_122;
      }
      if ((*v80 & 0xF) == 0 || v84)
      {
LABEL_124:
        result = *(__n128 *)v8;
        v101 = *((_OWORD *)v8 + 1);
        v5[4] = v8[4];
        *(__n128 *)v5 = result;
        *((_OWORD *)v5 + 1) = v101;
        v8 += 5;
        goto LABEL_125;
      }
LABEL_115:
      result = *(__n128 *)v80;
      v91 = *((_OWORD *)v80 + 1);
      v5[4] = v80[4];
      *(__n128 *)v5 = result;
      *((_OWORD *)v5 + 1) = v91;
      v80 += 5;
LABEL_125:
      v5 += 5;
      if (v8 == v79)
      {
        if (v80 != a2)
        {
          v102 = 0;
          do
          {
            v103 = &v5[v102];
            result = *(__n128 *)&v80[v102];
            v104 = *(_OWORD *)&v80[v102 + 2];
            v103[4] = v80[v102 + 4];
            *(__n128 *)v103 = result;
            *((_OWORD *)v103 + 1) = v104;
            v102 += 5;
          }
          while (&v80[v102] != a2);
        }
        return result;
      }
    }
    v92 = v82 >= v83 >> 4;
LABEL_122:
    if (v92)
      goto LABEL_124;
    goto LABEL_115;
  }
  if (a1 != a2)
  {
    result = *(__n128 *)a1;
    v26 = *((_OWORD *)a1 + 1);
    a4[4] = a1[4];
    *(__n128 *)a4 = result;
    *((_OWORD *)a4 + 1) = v26;
    v27 = a1 + 5;
    if (a1 + 5 != a2)
    {
      v28 = 0;
      v29 = a4;
      do
      {
        v30 = v8;
        v31 = v29;
        v8 = v27;
        v33 = *v29;
        v29 += 5;
        v32 = v33;
        v34 = v30[5];
        if (v34 >> 4 == v33 >> 4)
        {
          v35 = v32 & 0xF;
          if ((v34 & 0xF) != 0 && v35 != 0)
          {
            v44 = *((_DWORD *)v30 + 14);
            v45 = *((_DWORD *)v31 + 4);
            v46 = v44 >= v45;
            if (v44 != v45)
              goto LABEL_51;
            v47 = *((_DWORD *)v30 + 15);
            v48 = *((_DWORD *)v31 + 5);
            v46 = v47 >= v48;
            if (v47 != v48)
              goto LABEL_51;
          }
          v37 = v34 & 0xF;
          v38 = v37 == 1 || v37 == 8;
          v39 = v32 & 0xF;
          v40 = v38 || v39 == 1;
          if (!v40 && v39 != 8)
          {
            v49 = *((_DWORD *)v30 + 12);
            v50 = *((_DWORD *)v31 + 2);
            v46 = v49 >= v50;
            if (v49 != v50 || (v51 = *((_DWORD *)v30 + 13), v52 = *((_DWORD *)v31 + 3), v46 = v51 >= v52, v51 != v52))
            {
LABEL_51:
              v42 = v29;
              if (v46)
                goto LABEL_86;
LABEL_52:
              v53 = *((_OWORD *)v31 + 1);
              *(_OWORD *)v29 = *(_OWORD *)v31;
              *((_OWORD *)v29 + 1) = v53;
              v29[4] = v31[4];
              v42 = v5;
              if (v31 == v5)
                goto LABEL_86;
              v54 = v28;
              while (2)
              {
                v55 = (uint64_t)v5 + v54;
                v56 = *(uint64_t *)((char *)v5 + v54 - 40);
                v57 = *v8;
                v58 = *v8 >> 4;
                if (v58 == v56 >> 4)
                {
                  v59 = *(uint64_t *)((char *)v5 + v54 - 40) & 0xF;
                  if ((v57 & 0xF) != 0 && v59 != 0)
                  {
                    v68 = *((_DWORD *)v30 + 14);
                    v69 = *(_DWORD *)((char *)v5 + v54 - 24);
                    v66 = v68 >= v69;
                    if (v68 != v69)
                      goto LABEL_75;
                    v70 = *((_DWORD *)v30 + 15);
                    v71 = *(_DWORD *)((char *)v5 + v54 - 20);
                    v66 = v70 >= v71;
                    if (v70 != v71)
                      goto LABEL_75;
                  }
                  v61 = v57 & 0xF;
                  v62 = v61 == 1 || v61 == 8;
                  v63 = v56 & 0xF;
                  v64 = v62 || v63 == 1;
                  if (!v64 && v63 != 8)
                  {
                    v72 = *((_DWORD *)v30 + 12);
                    v73 = *(_DWORD *)((char *)v5 + v54 - 32);
                    v66 = v72 >= v73;
                    if (v72 != v73)
                      goto LABEL_75;
                    v74 = *((_DWORD *)v30 + 13);
                    v75 = *(_DWORD *)((char *)v5 + v54 - 28);
                    v66 = v74 >= v75;
                    if (v74 != v75)
                      goto LABEL_75;
                  }
                  if ((*v8 & 0xF) == 0 || v59)
                  {
                    v42 = (uint64_t *)((char *)v5 + v54);
                    goto LABEL_86;
                  }
                }
                else
                {
                  v66 = v58 >= v56 >> 4;
LABEL_75:
                  if (v66)
                  {
                    v42 = v31;
                    goto LABEL_86;
                  }
                }
                v31 -= 5;
                v67 = *(_OWORD *)((char *)v5 + v54 - 24);
                *(_OWORD *)v55 = *(_OWORD *)((char *)v5 + v54 - 40);
                *(_OWORD *)(v55 + 16) = v67;
                *(_QWORD *)(v55 + 32) = *(uint64_t *)((char *)v5 + v54 - 8);
                v54 -= 40;
                if (!v54)
                {
                  v42 = v5;
                  goto LABEL_86;
                }
                continue;
              }
            }
          }
          v42 = v29;
          if ((v30[5] & 0xF) != 0)
          {
            v42 = v29;
            if (!v35)
              goto LABEL_52;
          }
        }
        else
        {
          v43 = v32 >> 4;
          v42 = v29;
          if (v34 >> 4 < v43)
            goto LABEL_52;
        }
LABEL_86:
        result = *(__n128 *)v8;
        v76 = *((_OWORD *)v8 + 1);
        v42[4] = v8[4];
        *(__n128 *)v42 = result;
        *((_OWORD *)v42 + 1) = v76;
        v27 = v8 + 5;
        v28 += 40;
      }
      while (v8 + 5 != a2);
    }
  }
  return result;
}

__int128 *std::__inplace_merge<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>(__int128 *result, __int128 *a2, __int128 *a3, uint64_t a4, uint64_t a5, char *a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  BOOL v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  __int128 *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 *v32;
  char *v33;
  unint64_t v34;
  unsigned int v35;
  uint64_t v36;
  _DWORD *v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  __int128 *v42;
  unint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  unsigned int v46;
  BOOL v47;
  unsigned int v48;
  int v49;
  unsigned int v51;
  unsigned int v52;
  uint64_t v53;
  unint64_t v54;
  unsigned int v55;
  uint64_t v56;
  _DWORD *v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int v60;
  unsigned int v61;
  unint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  unsigned int v65;
  BOOL v66;
  unsigned int v67;
  unsigned int v68;
  int v69;
  BOOL v70;
  BOOL v71;
  BOOL v72;
  unsigned int v73;
  unsigned int v74;
  uint64_t v75;
  __int128 *v76;
  __int128 *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  __int128 v81;
  __int128 v82;
  char *v83;
  char *i;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int v90;
  BOOL v91;
  int v92;
  BOOL v93;
  BOOL v94;
  __int128 *v95;
  __int128 v96;
  __int128 v97;
  unsigned int v98;
  unsigned int v99;
  BOOL v100;
  unsigned int v101;
  unsigned int v102;
  unsigned int v103;
  unsigned int v104;
  unsigned int v105;
  unsigned int v106;
  uint64_t v107;
  char *v108;
  __int128 v109;
  __int128 v110;
  __int128 *v111;
  uint64_t v112;
  unsigned int v113;
  uint64_t v114;
  uint64_t v115;
  int v117;
  BOOL v118;
  int v119;
  BOOL v120;
  __int128 v122;
  __int128 v123;
  BOOL v124;
  __int128 v125;
  __int128 v126;
  unsigned int v127;
  unsigned int v128;
  unsigned int v129;
  unsigned int v130;
  unsigned int v131;
  unsigned int v132;
  unsigned int v133;
  unsigned int v134;
  char *v135;
  __int128 v136;
  __int128 v137;
  uint64_t v138;
  char *v139;
  __int128 v140;
  __int128 v141;
  __int128 *v142;
  uint64_t v143;
  __int128 *v144;
  char *__src;
  __int128 v146;
  __int128 v147;
  uint64_t v148;

  if (!a5)
    return result;
  v9 = a5;
  while (v9 > a7 && a4 > a7)
  {
    if (!a4)
      return result;
    v12 = 0;
    v13 = *(_QWORD *)a2 >> 4;
    v14 = *(_QWORD *)a2 & 0xFLL;
    v15 = -a4;
    while (1)
    {
      v16 = *(_QWORD *)((char *)result + v12);
      if (v13 != v16 >> 4)
      {
        v19 = v13 >= v16 >> 4;
LABEL_23:
        if (!v19)
          break;
        goto LABEL_25;
      }
      if (v14)
      {
        if ((v16 & 0xF) != 0)
        {
          v17 = *((_DWORD *)a2 + 4);
          v18 = *(_DWORD *)((char *)result + v12 + 16);
          v19 = v17 >= v18;
          if (v17 != v18)
            goto LABEL_23;
          v20 = *((_DWORD *)a2 + 5);
          v21 = *(_DWORD *)((char *)result + v12 + 20);
          v19 = v20 >= v21;
          if (v20 != v21)
            goto LABEL_23;
        }
      }
      if ((_DWORD)v14 != 1 && (_DWORD)v14 != 8)
      {
        v22 = v16 & 0xF;
        if (v22 != 1 && v22 != 8)
        {
          v24 = *((_DWORD *)a2 + 2);
          v25 = *(_DWORD *)((char *)result + v12 + 8);
          v19 = v24 >= v25;
          if (v24 != v25)
            goto LABEL_23;
          v26 = *((_DWORD *)a2 + 3);
          v27 = *(_DWORD *)((char *)result + v12 + 12);
          v19 = v26 >= v27;
          if (v26 != v27)
            goto LABEL_23;
        }
      }
      if (v14 && (*(_QWORD *)((_BYTE *)result + v12) & 0xFLL) == 0)
        break;
LABEL_25:
      v12 += 40;
      v19 = __CFADD__(v15++, 1);
      if (v19)
        return result;
    }
    v28 = -v15;
    v29 = (__int128 *)((char *)result + v12);
    v144 = a3;
    __src = a6;
    v142 = (__int128 *)((char *)result + v12);
    v143 = a7;
    if (-v15 >= v9)
    {
      if (v15 == -1)
      {
        v135 = (char *)result + v12;
        v148 = *((_QWORD *)v135 + 4);
        v146 = *(_OWORD *)v135;
        v147 = *((_OWORD *)v135 + 1);
        v136 = *a2;
        v137 = a2[1];
        *((_QWORD *)v135 + 4) = *((_QWORD *)a2 + 4);
        *(_OWORD *)v135 = v136;
        *((_OWORD *)v135 + 1) = v137;
        *((_QWORD *)a2 + 4) = v148;
        *a2 = v146;
        a2[1] = v147;
        return result;
      }
      if (v15 > 0)
        v28 = 1 - v15;
      v53 = v28 >> 1;
      v42 = (__int128 *)((char *)result + 40 * (v28 >> 1) + v12);
      if (a3 == a2)
      {
        v32 = a3;
LABEL_94:
        v31 = 0xCCCCCCCCCCCCCCCDLL * (((char *)v32 - (char *)a2) >> 3);
        goto LABEL_95;
      }
      v54 = 0xCCCCCCCCCCCCCCCDLL * (((char *)a3 - (char *)a2) >> 3);
      v55 = *(_QWORD *)v42 >> 4;
      v56 = *(_QWORD *)v42 & 0xFLL;
      v57 = (_DWORD *)((char *)result + 40 * v53 + v12);
      v58 = v57[4];
      v59 = v57[5];
      v60 = v57[2];
      v61 = v57[3];
      v32 = a2;
      while (2)
      {
        v62 = v54 >> 1;
        v63 = (_QWORD *)v32 + 5 * (v54 >> 1);
        v64 = *v63;
        v65 = *v63 >> 4;
        v66 = v65 >= v55;
        if (v65 != v55)
          goto LABEL_87;
        if (v56)
        {
          if ((v64 & 0xF) != 0)
          {
            v67 = *((_DWORD *)v32 + 10 * v62 + 4);
            v66 = v67 >= v58;
            if (v67 != v58)
              goto LABEL_87;
            v68 = *((_DWORD *)v32 + 10 * v62 + 5);
            v66 = v68 >= v59;
            if (v68 != v59)
              goto LABEL_87;
          }
        }
        v69 = v64 & 0xF;
        v70 = v69 == 1 || v69 == 8;
        v71 = v70 || (_DWORD)v56 == 1;
        v72 = v71 || (_DWORD)v56 == 8;
        if (v72
          || (v73 = *((_DWORD *)v32 + 10 * v62 + 2), v66 = v73 >= v60, v73 == v60)
          && (v74 = *((_DWORD *)v32 + 10 * v62 + 3), v66 = v74 >= v61, v74 == v61))
        {
          if (!v56 && (*v63 & 0xFLL) != 0)
          {
LABEL_88:
            v32 = (__int128 *)(v63 + 5);
            v62 = v54 + ~v62;
          }
        }
        else
        {
LABEL_87:
          if (!v66)
            goto LABEL_88;
        }
        v54 = v62;
        if (!v62)
          goto LABEL_94;
        continue;
      }
    }
    if (v9 >= 0)
      v30 = v9;
    else
      v30 = v9 + 1;
    v31 = v30 >> 1;
    v32 = (__int128 *)((char *)a2 + 40 * (v30 >> 1));
    if (v29 != a2)
    {
      v33 = (char *)result + v12;
      v34 = 0xCCCCCCCCCCCCCCCDLL * (((char *)a2 - (char *)result - v12) >> 3);
      v35 = *(_QWORD *)v32 >> 4;
      v36 = *(_QWORD *)v32 & 0xFLL;
      v37 = (_DWORD *)a2 + 10 * v31;
      v38 = v37[4];
      v39 = v37[5];
      v40 = v37[2];
      v41 = v37[3];
      v42 = v29;
      while (1)
      {
        v43 = v34 >> 1;
        v44 = (_QWORD *)v42 + 5 * (v34 >> 1);
        v45 = *v44;
        if (v35 != *v44 >> 4)
          break;
        if (v36)
        {
          if ((v45 & 0xF) != 0)
          {
            v46 = *((_DWORD *)v42 + 10 * v43 + 4);
            v47 = v38 >= v46;
            if (v38 != v46)
              goto LABEL_53;
            v48 = *((_DWORD *)v42 + 10 * v43 + 5);
            v47 = v39 >= v48;
            if (v39 != v48)
              goto LABEL_53;
          }
        }
        if ((_DWORD)v36 != 1 && (_DWORD)v36 != 8)
        {
          v49 = v45 & 0xF;
          if (v49 != 1 && v49 != 8)
          {
            v51 = *((_DWORD *)v42 + 10 * v43 + 2);
            v47 = v40 >= v51;
            if (v40 != v51)
              goto LABEL_53;
            v52 = *((_DWORD *)v42 + 10 * v43 + 3);
            v47 = v41 >= v52;
            if (v41 != v52)
              goto LABEL_53;
          }
        }
        if (v36 && (*v44 & 0xFLL) == 0)
          goto LABEL_56;
LABEL_55:
        v42 = (__int128 *)(v44 + 5);
        v43 = v34 + ~v43;
LABEL_56:
        v34 = v43;
        if (!v43)
          goto LABEL_92;
      }
      v47 = v35 >= v45 >> 4;
LABEL_53:
      if (!v47)
        goto LABEL_56;
      goto LABEL_55;
    }
    v33 = (char *)result + v12;
    v42 = a2;
LABEL_92:
    v53 = 0xCCCCCCCCCCCCCCCDLL * (((char *)v42 - v33) >> 3);
LABEL_95:
    a4 = -(v53 + v15);
    v75 = v9 - v31;
    v76 = std::__rotate[abi:nn180100]<std::_ClassicAlgPolicy,RB::DisplayList::Interpolator::Op *,RB::DisplayList::Interpolator::Op *>(v42, a2, v32);
    a3 = v76;
    if (v53 + v31 >= v9 - (v53 + v31) - v15)
    {
      std::__inplace_merge<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>(v76, v32, v144, -(v53 + v15), v75, __src, v143);
      v32 = v42;
      a7 = v143;
      v75 = v31;
      a6 = __src;
      a4 = v53;
      result = v142;
    }
    else
    {
      v77 = v42;
      v78 = v31;
      a6 = __src;
      a7 = v143;
      std::__inplace_merge<std::_ClassicAlgPolicy,RB::DisplayList::EditAdaptor::finalize(RB::DisplayList::Interpolator::Layer &)::$_1 &,RB::DisplayList::Interpolator::Op *>(v142, v77, v76, v53, v78, __src, v143);
      result = a3;
      a3 = v144;
    }
    v9 = v75;
    a2 = v32;
    if (!v75)
      return result;
  }
  if (a4 <= v9)
  {
    if (result == a2)
      return result;
    v107 = 0;
    do
    {
      v108 = &a6[v107];
      v109 = *(__int128 *)((char *)result + v107);
      v110 = *(__int128 *)((char *)result + v107 + 16);
      *((_QWORD *)v108 + 4) = *(_QWORD *)((char *)result + v107 + 32);
      *(_OWORD *)v108 = v109;
      *((_OWORD *)v108 + 1) = v110;
      v107 += 40;
    }
    while ((__int128 *)((char *)result + v107) != a2);
    if (!v107)
      return result;
    v111 = (__int128 *)a6;
    while (1)
    {
      if (a2 == a3)
        return (__int128 *)memmove(result, v111, a6 - (char *)v111 + v107);
      v112 = *(_QWORD *)a2;
      v113 = *(_QWORD *)a2 >> 4;
      v114 = *(_QWORD *)v111;
      if (v113 != *(_QWORD *)v111 >> 4)
        break;
      v115 = *(_QWORD *)v111 & 0xFLL;
      if ((v112 & 0xF) != 0 && v115 != 0)
      {
        v127 = *((_DWORD *)a2 + 4);
        v128 = *((_DWORD *)v111 + 4);
        v124 = v127 >= v128;
        if (v127 != v128)
          goto LABEL_165;
        v129 = *((_DWORD *)a2 + 5);
        v130 = *((_DWORD *)v111 + 5);
        v124 = v129 >= v130;
        if (v129 != v130)
          goto LABEL_165;
      }
      v117 = v112 & 0xF;
      v118 = v117 == 1 || v117 == 8;
      v119 = v114 & 0xF;
      v120 = v118 || v119 == 1;
      if (!v120 && v119 != 8)
      {
        v131 = *((_DWORD *)a2 + 2);
        v132 = *((_DWORD *)v111 + 2);
        v124 = v131 >= v132;
        if (v131 != v132)
          goto LABEL_165;
        v133 = *((_DWORD *)a2 + 3);
        v134 = *((_DWORD *)v111 + 3);
        v124 = v133 >= v134;
        if (v133 != v134)
          goto LABEL_165;
      }
      if ((*(_QWORD *)a2 & 0xFLL) == 0 || v115)
      {
LABEL_167:
        v125 = *v111;
        v126 = v111[1];
        *((_QWORD *)result + 4) = *((_QWORD *)v111 + 4);
        *result = v125;
        result[1] = v126;
        v111 = (__int128 *)((char *)v111 + 40);
        goto LABEL_168;
      }
LABEL_163:
      v122 = *a2;
      v123 = a2[1];
      *((_QWORD *)result + 4) = *((_QWORD *)a2 + 4);
      *result = v122;
      result[1] = v123;
      a2 = (__int128 *)((char *)a2 + 40);
LABEL_168:
      result = (__int128 *)((char *)result + 40);
      if (&a6[v107] == (char *)v111)
        return result;
    }
    v124 = v113 >= v114 >> 4;
LABEL_165:
    if (v124)
      goto LABEL_167;
    goto LABEL_163;
  }
  if (a2 != a3)
  {
    v79 = 0;
    do
    {
      v80 = &a6[v79];
      v81 = *(__int128 *)((char *)a2 + v79);
      v82 = *(__int128 *)((char *)a2 + v79 + 16);
      *((_QWORD *)v80 + 4) = *(_QWORD *)((char *)a2 + v79 + 32);
      *(_OWORD *)v80 = v81;
      *((_OWORD *)v80 + 1) = v82;
      v79 += 40;
    }
    while ((__int128 *)((char *)a2 + v79) != a3);
    if (v79)
    {
      v83 = &a6[v79];
      for (i = (char *)a3 - 40; ; i -= 40)
      {
        if (a2 == result)
        {
          v138 = 0;
          do
          {
            v139 = &i[v138];
            v140 = *(_OWORD *)&v83[v138 - 40];
            v141 = *(_OWORD *)&v83[v138 - 24];
            *((_QWORD *)v139 + 4) = *(_QWORD *)&v83[v138 - 8];
            *(_OWORD *)v139 = v140;
            *((_OWORD *)v139 + 1) = v141;
            v138 -= 40;
          }
          while (&v83[v138] != a6);
          return result;
        }
        v85 = (char *)a2 - 40;
        v86 = *((_QWORD *)a2 - 5);
        v87 = *((_QWORD *)v83 - 5);
        if (v87 >> 4 == v86 >> 4)
          break;
        v95 = (__int128 *)((char *)a2 - 40);
        if (v87 >> 4 >= v86 >> 4)
          goto LABEL_128;
LABEL_129:
        v96 = *(_OWORD *)v85;
        v97 = *((_OWORD *)v85 + 1);
        *((_QWORD *)i + 4) = *((_QWORD *)v85 + 4);
        *(_OWORD *)i = v96;
        *((_OWORD *)i + 1) = v97;
        a2 = v95;
        if (v83 == a6)
          return result;
      }
      v88 = *((_QWORD *)a2 - 5) & 0xFLL;
      if ((v87 & 0xF) != 0 && v88 != 0)
      {
        v98 = *((_DWORD *)v83 - 6);
        v99 = *((_DWORD *)a2 - 6);
        v100 = v98 >= v99;
        if (v98 != v99)
          goto LABEL_136;
        v101 = *((_DWORD *)v83 - 5);
        v102 = *((_DWORD *)a2 - 5);
        v100 = v101 >= v102;
        if (v101 != v102)
          goto LABEL_136;
      }
      v90 = v87 & 0xF;
      v91 = v90 == 1 || v90 == 8;
      v92 = v86 & 0xF;
      v93 = v91 || v92 == 1;
      v94 = v93 || v92 == 8;
      if (v94
        || (v103 = *((_DWORD *)v83 - 8), v104 = *((_DWORD *)a2 - 8), v100 = v103 >= v104, v103 == v104)
        && (v105 = *((_DWORD *)v83 - 7), v106 = *((_DWORD *)a2 - 7), v100 = v105 >= v106, v105 == v106))
      {
        if ((*((_QWORD *)v83 - 5) & 0xFLL) != 0)
        {
          v95 = (__int128 *)((char *)a2 - 40);
          if (!v88)
            goto LABEL_129;
        }
      }
      else
      {
LABEL_136:
        v95 = (__int128 *)((char *)a2 - 40);
        if (!v100)
          goto LABEL_129;
      }
LABEL_128:
      v85 = v83 - 40;
      v95 = a2;
      v83 -= 40;
      goto LABEL_129;
    }
  }
  return result;
}

__int128 *std::__rotate[abi:nn180100]<std::_ClassicAlgPolicy,RB::DisplayList::Interpolator::Op *,RB::DisplayList::Interpolator::Op *>(__int128 *__src, __int128 *a2, __int128 *a3)
{
  __int128 *v4;
  int64_t v6;
  size_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  if (__src != a2)
  {
    if (a2 == a3)
    {
      return __src;
    }
    else if ((__int128 *)((char *)__src + 40) == a2)
    {
      v9 = *__src;
      v11 = __src[1];
      v13 = *((_QWORD *)__src + 4);
      v6 = (char *)a3 - (char *)a2;
      memmove(__src, a2, (char *)a3 - (char *)a2);
      v4 = (__int128 *)((char *)__src + v6);
      *v4 = v9;
      v4[1] = v11;
      *((_QWORD *)v4 + 4) = v13;
    }
    else if ((__int128 *)((char *)a2 + 40) == a3)
    {
      v4 = (__int128 *)((char *)__src + 40);
      v10 = *(__int128 *)((char *)a3 - 40);
      v12 = *(__int128 *)((char *)a3 - 24);
      v14 = *((_QWORD *)a3 - 1);
      v7 = (char *)a3 - 40 - (char *)__src;
      if ((__int128 *)((char *)a3 - 40) != __src)
        memmove((char *)__src + 40, __src, v7);
      *__src = v10;
      __src[1] = v12;
      *((_QWORD *)__src + 4) = v14;
    }
    else
    {
      return std::__rotate_gcd[abi:nn180100]<std::_ClassicAlgPolicy,RB::DisplayList::Interpolator::Op *>(__src, a2, a3);
    }
  }
  return v4;
}

__int128 *std::__rotate_gcd[abi:nn180100]<std::_ClassicAlgPolicy,RB::DisplayList::Interpolator::Op *>(__int128 *a1, __int128 *a2, __int128 *a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  __int128 *v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  __int128 *v19;
  __int128 *v20;
  __int128 *v21;
  __int128 v22;
  __int128 v23;
  unint64_t v24;
  BOOL v25;
  char v26;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v3 = 0xCCCCCCCCCCCCCCCDLL * (((char *)a2 - (char *)a1) >> 3);
  if (v3 == 0xCCCCCCCCCCCCCCCDLL * (((char *)a3 - (char *)a2) >> 3))
  {
    if (a1 != a2 && a2 != a3)
    {
      v4 = 0;
      do
      {
        v5 = (uint64_t)a2 + v4;
        v6 = (uint64_t)a1 + v4;
        v7 = *(__int128 *)((char *)a1 + v4);
        v8 = *(__int128 *)((char *)a1 + v4 + 16);
        v9 = *(_QWORD *)((char *)a1 + v4 + 32);
        v10 = *(_QWORD *)((char *)a2 + v4 + 32);
        v11 = *(__int128 *)((char *)a2 + v4 + 16);
        *(_OWORD *)v6 = *(__int128 *)((char *)a2 + v4);
        *(_OWORD *)(v6 + 16) = v11;
        *(_QWORD *)(v6 + 32) = v10;
        *(_QWORD *)(v5 + 32) = v9;
        *(_OWORD *)v5 = v7;
        *(_OWORD *)(v5 + 16) = v8;
        if ((__int128 *)((char *)a1 + v4 + 40) == a2)
          break;
        v4 += 40;
      }
      while ((__int128 *)(v5 + 40) != a3);
    }
  }
  else
  {
    v12 = 0xCCCCCCCCCCCCCCCDLL * (((char *)a3 - (char *)a2) >> 3);
    v13 = 0xCCCCCCCCCCCCCCCDLL * (((char *)a2 - (char *)a1) >> 3);
    do
    {
      v14 = v13;
      v13 = v12;
      v12 = v14 % v12;
    }
    while (v12);
    if (v13)
    {
      v15 = (__int128 *)((char *)a1 + 40 * v13);
      do
      {
        v16 = *(__int128 *)((char *)v15 - 40);
        v17 = *(__int128 *)((char *)v15 - 24);
        v18 = *((_QWORD *)v15 - 1);
        v15 = (__int128 *)((char *)v15 - 40);
        v29 = v16;
        v30 = v17;
        v31 = v18;
        v19 = (__int128 *)((char *)v15 + 8 * (((char *)a2 - (char *)a1) >> 3));
        v20 = v15;
        do
        {
          v21 = v20;
          v20 = v19;
          v22 = *v19;
          v23 = v19[1];
          *((_QWORD *)v21 + 4) = *((_QWORD *)v19 + 4);
          *v21 = v22;
          v21[1] = v23;
          v24 = 0xCCCCCCCCCCCCCCCDLL * (((char *)a3 - (char *)v19) >> 3);
          v25 = __OFSUB__(v3, v24);
          v27 = v3 - v24;
          v26 = (v27 < 0) ^ v25;
          v19 = (__int128 *)((char *)a1 + 40 * v27);
          if (v26)
            v19 = (__int128 *)((char *)v20 + 8 * (((char *)a2 - (char *)a1) >> 3));
        }
        while (v19 != v15);
        *((_QWORD *)v20 + 4) = v31;
        *v20 = v29;
        v20[1] = v30;
      }
      while (v15 != a1);
    }
    return (__int128 *)((char *)a1 + 8 * (((char *)a3 - (char *)a2) >> 3));
  }
  return a2;
}

void *RB::vector<RB::DisplayList::Interpolator::Op,4ul,unsigned int>::reserve_slow(void *__dst, unsigned int a2)
{
  unsigned int v3;
  void *result;

  if (*((_DWORD *)__dst + 43) + (*((_DWORD *)__dst + 43) >> 1) <= a2)
    v3 = a2;
  else
    v3 = *((_DWORD *)__dst + 43) + (*((_DWORD *)__dst + 43) >> 1);
  result = RB::details::realloc_vector<unsigned int,40ul>(*((void **)__dst + 20), __dst, 4u, (_DWORD *)__dst + 43, v3);
  *((_QWORD *)__dst + 20) = result;
  return result;
}

void *RB::details::realloc_vector<unsigned int,40ul>(void *__src, void *__dst, unsigned int a3, _DWORD *a4, unsigned int a5)
{
  void *v7;
  size_t v8;
  unint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v7 = __src;
  if (a5 <= a3)
  {
    if (__src)
    {
      LODWORD(v9) = a3;
      memcpy(__dst, __src, 40 * a5);
      free(v7);
      v12 = 0;
LABEL_8:
      *a4 = v9;
      return v12;
    }
  }
  else
  {
    v8 = malloc_good_size(40 * a5);
    v9 = v8 / 0x28;
    if (*a4 != (v8 / 0x28))
    {
      v10 = malloc_type_realloc(v7, v8, 0x66ED1BA4uLL);
      if (!v10)
        RB::precondition_failure((RB *)"allocation failure", v11);
      v12 = v10;
      if (!v7)
        memcpy(v10, __dst, 40 * *a4);
      goto LABEL_8;
    }
  }
  return v7;
}

void RB::Fill::MeshGradient::Data::finalize(RB::Fill::MeshGradient::Data *this)
{
  (*(void (**)(RB::Fill::MeshGradient::Data *))(*(_QWORD *)this + 16))(this);
  free(this);
}

uint64_t RB::Fill::MeshGradient::valid_config(unsigned __int8 *a1, unint64_t a2, unint64_t a3, _QWORD *a4)
{
  int v4;
  uint64_t result;
  unsigned int v6;
  BOOL v7;
  unint64_t v8;
  BOOL v9;

  v4 = *a1;
  result = 1;
  switch(v4)
  {
    case 0:
      return result;
    case 1:
    case 2:
    case 5:
      result = 0;
      if (a2 >= 4 && a3 >= 2 && !((a3 | a2) >> 32))
      {
        v6 = a2 / a3;
        if (a2 / a3 * (_DWORD)a3 != a2)
          goto LABEL_12;
        v7 = v4 == 5;
        v8 = 0x4000;
        if (v7)
          v8 = 0x10000;
        if ((a3 - 1) * (unint64_t)(v6 - 1) >= v8)
          goto LABEL_12;
        if (a4)
          *a4 = __PAIR64__(v6, a3);
        result = 1;
      }
      break;
    case 3:
    case 4:
      v9 = a2 - 1 >= 0x4000;
      goto LABEL_16;
    case 6:
      v9 = a2 - 1 >= 0x5555;
LABEL_16:
      result = !v9;
      break;
    default:
LABEL_12:
      result = 0;
      break;
  }
  return result;
}

uint64_t RB::Fill::MeshGradient::MeshGradient(uint64_t a1, int a2, unint64_t a3, unint64_t a4, const void *a5, float32x4_t *a6, uint64_t a7, char a8)
{
  __int16 v13;
  uint64_t v14;
  float16x4_t *v15;
  float32x4_t v16;
  float16x4_t *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unsigned __int8 v22;

  v22 = a2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = 0;
  *(_DWORD *)(a1 + 24) = 0;
  v13 = *(_WORD *)(a7 + 8);
  *(_QWORD *)(a1 + 28) = *(_QWORD *)a7;
  *(_WORD *)(a1 + 36) = v13;
  *(_BYTE *)(a1 + 38) = a8;
  *(_BYTE *)(a1 + 39) = *(_BYTE *)(a1 + 39) & 0xE0 | 0x10;
  *(_BYTE *)(a1 + 40) = 0;
  if (RB::Fill::MeshGradient::valid_config(&v22, a3, a4, (_QWORD *)a1))
  {
    v20 = 0;
    v21 = 0;
    v18 = 0;
    v19 = 0;
    if ((RB::Fill::MeshGradient::allocate_data(a1, a2, a3, &v20, &v18) & 1) != 0)
    {
      memcpy(v20, a5, 8 * v21);
      v14 = v19;
      if (v19)
      {
        v15 = v18;
        do
        {
          v16 = *a6++;
          *v15++ = vcvt_f16_f32(v16);
          --v14;
        }
        while (v14);
      }
      RB::Fill::MeshGradient::update_colors((RB::Fill::MeshGradient *)a1);
    }
  }
  return a1;
}

void sub_209BC4D90(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 8);
  if (v3)
    -[RBDrawable renderWithFlags:items:count:displayList:].cold.3(v3);
  _Unwind_Resume(exception_object);
}

uint64_t RB::Fill::MeshGradient::allocate_data(uint64_t a1, int a2, unint64_t a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unint64_t v9;
  BOOL v10;
  int v11;
  char v15;
  _DWORD *v17;
  _DWORD *v18;
  unsigned int *v19;
  unsigned int *v20;
  unsigned int v21;
  unsigned int v22;

  v5 = RB::Fill::MeshGradient::points_per_elt[a2];
  v6 = RB::Fill::MeshGradient::colors_per_elt[a2];
  v7 = 8 * (v6 + v5);
  v8 = a3 * v7;
  v10 = (a3 * (unsigned __int128)(unint64_t)v7) >> 64 == 0;
  v9 = (a3 * v7) >> 32;
  v10 = v10 && v9 == 0;
  v11 = !v10;
  if (v10)
  {
    v15 = a2;
    v17 = malloc_type_malloc((v8 & 0xFFFFFFF8) + 16, 0x8AEC0A08uLL);
    v18 = v17;
    if (v17)
    {
      *(_QWORD *)v17 = &off_24C223D30;
      v17[2] = 1;
      v17[3] = v8;
    }
    v19 = *(unsigned int **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v18;
    if (v19)
    {
      v20 = v19 + 2;
      do
      {
        v21 = __ldxr(v20);
        v22 = v21 - 1;
      }
      while (__stlxr(v22, v20));
      if (!v22)
      {
        __dmb(9u);
        (*(void (**)(unsigned int *))(*(_QWORD *)v19 + 8))(v19);
      }
    }
    *(_BYTE *)(a1 + 39) = *(_BYTE *)(a1 + 39) & 0xF0 | v15 & 0xF;
    *(_DWORD *)(a1 + 24) = a3;
    *a4 = v18 + 4;
    a4[1] = v5 * a3;
    *a5 = &v18[2 * v5 * a3 + 4];
    a5[1] = v6 * a3;
  }
  return v11 ^ 1u;
}

uint64_t RB::Fill::MeshGradient::update_colors(RB::Fill::MeshGradient *this)
{
  int v2;
  char v3;
  uint64_t v4;
  float16x4_t *v5;
  uint64_t v6;
  float v7;
  float v8;
  float16x4_t v9;
  float32x4_t v10;
  float v11;
  float v12;
  char v13;
  RB *v14;
  unsigned int v15;
  int v16;
  uint64_t result;

  v2 = *((_DWORD *)this + 6);
  v3 = *((_BYTE *)this + 39);
  v4 = v2 * RB::Fill::MeshGradient::colors_per_elt[v3 & 0xF];
  if ((_DWORD)v4)
  {
    v5 = (float16x4_t *)(*((_QWORD *)this + 1)
                       + 8 * v2 * RB::Fill::MeshGradient::points_per_elt[v3 & 0xF]
                       + 16);
    v6 = 8 * v4;
    LOBYTE(v4) = 1;
    v7 = -INFINITY;
    v8 = INFINITY;
    do
    {
      v9 = *v5++;
      v10 = vcvtq_f32_f16(v9);
      LODWORD(v4) = v4 & (v10.f32[3] == 1.0);
      v11 = fminf(fminf(v10.f32[0], v10.f32[2]), v10.f32[1]);
      if (v11 < v8)
        v8 = v11;
      v12 = fmaxf(fmaxf(v10.f32[0], v10.f32[2]), v10.f32[1]);
      if (v7 < v12)
        v7 = v12;
      v6 -= 8;
    }
    while (v6);
    if ((_DWORD)v4)
      v13 = 16;
    else
      v13 = 0;
  }
  else
  {
    v13 = 16;
    v8 = INFINITY;
    v7 = -INFINITY;
  }
  *((_BYTE *)this + 39) = v13 | v3 & 0xEF;
  v14 = (RB *)RB::Fill::Color::required_depth((float16x4_t *)((char *)this + 28));
  v15 = v14;
  v16 = RB::required_color_depth(v14, v8, v7);
  result = RB::max_color_depth(v15, v16);
  *((_BYTE *)this + 40) = result;
  return result;
}

uint64_t RB::Fill::MeshGradient::MeshGradient(uint64_t a1, uint64_t a2, __int16 a3, RB::Heap *this)
{
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  char v9;
  __int128 *v10;
  _OWORD *v11;
  __int128 v12;
  __int128 v13;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  if (v5)
  {
    v6 = (unsigned int *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  if (*(_BYTE *)(a2 + 37))
    a3 = *(_WORD *)(a2 + 36);
  *(_QWORD *)(a1 + 28) = *(_QWORD *)(a2 + 28);
  *(_WORD *)(a1 + 36) = a3;
  *(_BYTE *)(a1 + 38) = *(_BYTE *)(a2 + 38);
  v9 = *(_BYTE *)(a1 + 39) & 0xF0 | *(_BYTE *)(a2 + 39) & 0xF;
  *(_BYTE *)(a1 + 39) = v9;
  *(_BYTE *)(a1 + 39) = v9 & 0xEF | *(_BYTE *)(a2 + 39) & 0x10;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v10 = *(__int128 **)(a2 + 16);
  if (v10)
  {
    v11 = (_OWORD *)((*((_QWORD *)this + 2) + 15) & 0xFFFFFFFFFFFFFFF0);
    if ((unint64_t)(v11 + 3) > *((_QWORD *)this + 3))
      v11 = (_OWORD *)RB::Heap::alloc_slow((size_t *)this, 0x30uLL, 15);
    else
      *((_QWORD *)this + 2) = v11 + 3;
    v12 = *v10;
    v13 = v10[2];
    v11[1] = v10[1];
    v11[2] = v13;
    *v11 = v12;
    *(_QWORD *)(a1 + 16) = v11;
  }
  return a1;
}

void sub_209BC50D0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 8);
  if (v3)
    -[RBDrawable renderWithFlags:items:count:displayList:].cold.3(v3);
  _Unwind_Resume(exception_object);
}

uint64_t RB::Fill::MeshGradient::MeshGradient(uint64_t a1, uint64_t a2, __int16 a3, RB::Heap *a4)
{
  return RB::Fill::MeshGradient::MeshGradient(a1, a2, a3, a4);
}

uint64_t RB::Fill::MeshGradient::copy_on_write_data(uint64_t a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t result;
  size_t v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
    return 0;
  if (*(_DWORD *)(v3 + 8) == 1)
  {
    __dmb(9u);
    v7 = *(_QWORD *)(a1 + 8) + 16;
  }
  else
  {
    v9 = *(unsigned int *)(v3 + 12);
    result = (uint64_t)malloc_type_malloc(v9 + 16, 0x8AEC0A08uLL);
    if (!result)
      return result;
    v10 = result;
    *(_QWORD *)result = &off_24C223D30;
    *(_DWORD *)(result + 8) = 1;
    *(_DWORD *)(result + 12) = v9;
    v7 = result + 16;
    memcpy((void *)(result + 16), (const void *)(*(_QWORD *)(a1 + 8) + 16), v9);
    v11 = *(unsigned int **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v10;
    if (v11)
    {
      v12 = v11 + 2;
      do
      {
        v13 = __ldxr(v12);
        v14 = v13 - 1;
      }
      while (__stlxr(v14, v12));
      if (!v14)
      {
        __dmb(9u);
        (*(void (**)(unsigned int *))(*(_QWORD *)v11 + 8))(v11);
      }
    }
  }
  v15 = *(_DWORD *)(a1 + 24);
  v16 = *(_BYTE *)(a1 + 39) & 0xF;
  v17 = v15 * RB::Fill::MeshGradient::points_per_elt[v16];
  v18 = v15 * RB::Fill::MeshGradient::colors_per_elt[v16];
  *a2 = v7;
  a2[1] = v17;
  *a3 = v7 + 8 * v17;
  a3[1] = v18;
  return 1;
}

void RB::Fill::MeshGradient::append_color_matrix(uint64_t a1, float16x4_t *a2, uint64_t a3, __int16 a4)
{
  unsigned __int8 v4;
  int v7;
  uint16x4_t *v9;
  uint64_t v10;
  uint16x4_t v11;
  __int16 v12;
  unsigned int v14;
  char v19;
  uint64_t v20;
  uint16x4_t v21;
  __int16 v22;
  uint16x4_t *v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a4;
  *(_BYTE *)(a1 + 39) |= 0x10u;
  v7 = HIBYTE(a4);
  v23 = 0;
  v24 = 0;
  if (RB::Fill::MeshGradient::copy_on_write_data(a1, &v25, &v23) && v24)
  {
    v9 = v23;
    v10 = 8 * v24;
    do
    {
      v11 = *v9;
      v12 = *(_WORD *)(a1 + 36);
      v21 = *v9;
      v22 = v12;
      if (v7)
        RB::Fill::Color::convert((uint64_t)&v21, v4, v11);
      RB::operator*=((uint64_t)&v21, a2);
      _D0.i32[1] = v21.i32[1];
      _H1 = v21.i16[3];
      *v9++ = v21;
      v14 = *(unsigned __int8 *)(a1 + 39);
      __asm { FCVT            S0, H1 }
      if (((*(float *)_D0.i32 == 1.0) & (v14 >> 4)) != 0)
        v19 = 16;
      else
        v19 = 0;
      *(_BYTE *)(a1 + 39) = v19 | v14 & 0xEF;
      v10 -= 8;
    }
    while (v10);
  }
  if (v7)
  {
    v20 = a1 + 28;
    RB::Fill::Color::convert(v20, v4, _D0);
    RB::operator*=(v20, a2);
  }
}

uint64_t RB::Fill::MeshGradient::can_mix(RB::Fill::MeshGradient *this, const RB::Fill::MeshGradient *a2, const RB::AffineTransform *a3)
{
  uint64_t result;

  if (((*((_BYTE *)a2 + 39) ^ *((_BYTE *)this + 39)) & 0xF) != 0
    || *((_DWORD *)this + 6) != *((_DWORD *)a2 + 6)
    || *((unsigned __int8 *)this + 38) != *((unsigned __int8 *)a2 + 38))
  {
    return 0;
  }
  LODWORD(result) = RB::can_mix(*((float64x2_t **)this + 2), *((float64x2_t **)a2 + 2), a3);
  if ((result & 0xFC) != 0)
    return 2;
  else
    return result;
}

void RB::Fill::MeshGradient::mix(RB::Fill::MeshGradient *this, const RB::DisplayList::Interpolator::Op *a2, const RB::Fill::MeshGradient *a3, double a4, RB::Heap *a5)
{
  if ((*(_QWORD *)a2 & 0xELL) == 2)
    RB::Fill::MeshGradient::mix(this, a3, a4, a3);
}

void RB::Fill::MeshGradient::mix(RB::Fill::MeshGradient *this, const RB::Fill::MeshGradient *a2, double a3, RB::Heap *a4)
{
  CGAffineTransform *v6;
  float64x2_t *v7;
  _OWORD *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  int v12;
  float32x2_t v15;
  double v16;
  int8x16_t v17;
  int8x16_t v18;
  int v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  float32x2_t *v23;
  float32x2_t *v24;
  float32x2_t v25;
  uint64_t v26;
  float16x4_t *v27;
  float16x4_t *v28;
  __int16 v29;
  float16x4_t v30;
  __int16 v31;
  unsigned int v32;
  char v37;
  int8x16_t v38;
  float16x4_t v39;
  __int16 v40;
  float16x4_t v41;
  __int16 v42;
  float16x4_t *v43;
  uint64_t v44;
  float32x2_t *v45;
  uint64_t v46;

  *(double *)v38.i64 = a3;
  v6 = (CGAffineTransform *)*((_QWORD *)this + 2);
  if (v6)
  {
    v7 = (float64x2_t *)*((_QWORD *)a2 + 2);
    if (v7)
    {
      RB::mix(v6, v7, a4, *(float *)&a3);
      v8 = (_OWORD *)*((_QWORD *)this + 2);
      *v8 = v9;
      v8[1] = v10;
      v8[2] = v11;
    }
  }
  *((_BYTE *)this + 39) |= 0x10u;
  v45 = 0;
  v46 = 0;
  v43 = 0;
  v44 = 0;
  v12 = RB::Fill::MeshGradient::copy_on_write_data((uint64_t)this, (uint64_t *)&v45, &v43);
  v18 = v38;
  if (v12)
  {
    v19 = *((_DWORD *)a2 + 6);
    v20 = *((_BYTE *)a2 + 39);
    v21 = *((_QWORD *)a2 + 1) + 16;
    v22 = v46;
    if (v46)
    {
      v23 = v45;
      v15 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v38.i8, 0);
      v24 = (float32x2_t *)(*((_QWORD *)a2 + 1) + 16);
      do
      {
        v25 = *v24++;
        *(float32x2_t *)_Q1.i8 = vsub_f32(v25, *v23);
        _D2 = COERCE_DOUBLE(vmla_f32(*v23, v15, *(float32x2_t *)_Q1.i8));
        *(double *)v23++ = _D2;
        --v22;
      }
      while (v22);
    }
    v26 = v44;
    if (v44)
    {
      v27 = (float16x4_t *)(v21 + 8 * v19 * RB::Fill::MeshGradient::points_per_elt[v20 & 0xF]);
      v28 = v43;
      do
      {
        v29 = *((_WORD *)this + 18);
        v41 = *v28;
        v42 = v29;
        v30 = *v27++;
        *(float16x4_t *)_Q1.i8 = v30;
        v31 = *((_WORD *)a2 + 18);
        v39 = v30;
        v40 = v31;
        RB::Fill::Color::mix(&v41, &v39, 0, v18, _Q1, _D2, *(double *)&v15, v16, v17);
        v18 = v38;
        v32 = *((unsigned __int8 *)this + 39);
        LOWORD(_D2) = v41.i16[3];
        __asm { FCVT            S1, H2 }
        if (((*(float *)_Q1.i32 == 1.0) & (v32 >> 4)) != 0)
          v37 = 16;
        else
          v37 = 0;
        *((_BYTE *)this + 39) = v37 | v32 & 0xEF;
        *(float16x4_t *)_Q1.i8 = v41;
        _Q1.i16[3] = LOWORD(_D2);
        *v28++ = *(float16x4_t *)_Q1.i8;
        --v26;
      }
      while (v26);
    }
  }
  RB::Fill::Color::mix((float16x4_t *)((char *)this + 28), (float16x4_t *)((char *)a2 + 28), 0, v18, _Q1, _D2, *(double *)&v15, v16, v17);
}

uint64_t RB::Fill::MeshGradient::get_alpha(RB::Fill::MeshGradient *this, float *a2)
{
  if ((*((_BYTE *)this + 39) & 0x10) == 0)
    return 0;
  _H0 = *((_WORD *)this + 17);
  __asm { FCVT            S0, H0 }
  if (_S0 != 1.0)
    return 0;
  *a2 = 1.0;
  return 1;
}

float16x4_t RB::Fill::MeshGradient::ColorConversion::convert(uint64_t a1, float16x4_t *a2, double a3, int8x16_t a4, double a5, double a6, double a7, int8x16_t a8)
{
  int v10;
  float32x4_t v17;
  int v18;
  const __int16 *v19;
  float16x4_t v20;
  float16x4_t v21;
  float16x4_t result;
  uint64_t v23;
  __int16 v24;

  v17 = vcvtq_f32_f16(*a2);
  v10 = *(unsigned __int8 *)(a1 + 4);
  _S1 = v17.i32[3];
  __asm { FCVT            H1, S1 }
  v24 = v10 | 0x100;
  LODWORD(a5) = *(_DWORD *)a1;
  __asm { FCVT            S1, H1 }
  *(float *)a4.i32 = *(float *)a1 * _S1;
  v17.i32[3] = a4.i32[0];
  *(float16x4_t *)v17.f32 = vcvt_f16_f32(v17);
  v23 = v17.i64[0];
  v18 = *(unsigned __int8 *)(a1 + 5);
  if (v10 != v18)
    RB::Fill::Color::convert((uint64_t)&v23, v18, *(uint16x4_t *)v17.f32);
  if (*(_BYTE *)(a1 + 6))
    RB::Fill::Color::convert_to_oklab((RB::Fill::Color *)&v23, (int8x16_t)v17, a4, a5, a6, a7, a8);
  v19 = (const __int16 *)&v23 + 3;
  v20.i32[0] = v23;
  v20.i16[2] = WORD2(v23);
  v20.i16[3] = unk_209BDA528;
  v21 = (float16x4_t)vld1_dup_s16(v19);
  result = vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(v21), vcvtq_f32_f16(v20)));
  *a2 = result;
  return result;
}

void RB::Fill::MeshGradient::ColorConversion::convert_out_slow(uint64_t a1, RB::Fill::Color *this, int a3, double _D0)
{
  _H0 = *((_WORD *)this + 3);
  __asm { FCVT            S0, H0 }
  if (*(float *)&_D0 != 1.0 && *(float *)&_D0 != 0.0)
  {
    _S0 = 1.0 / *(float *)&_D0;
    __asm { FCVT            H0, S0 }
    _H1 = *(_WORD *)this;
    __asm
    {
      FCVT            S1, H1
      FCVT            S0, H0
    }
    _S1 = _S1 * _S0;
    __asm { FCVT            H1, S1 }
    *(_WORD *)this = LOWORD(_S1);
    LOWORD(_S1) = *((_WORD *)this + 1);
    __asm { FCVT            S1, H1 }
    _S1 = _S1 * _S0;
    __asm { FCVT            H1, S1 }
    *((_WORD *)this + 1) = LOWORD(_S1);
    LOWORD(_S1) = *((_WORD *)this + 2);
    __asm { FCVT            S1, H1 }
    *(float *)&_D0 = _S1 * _S0;
    __asm { FCVT            H0, S0 }
    *((_WORD *)this + 2) = LOWORD(_D0);
  }
  if (*(_BYTE *)(a1 + 6))
    *(_QWORD *)&_D0 = RB::Fill::Color::convert_from_oklab(this);
  if (*(unsigned __int8 *)(a1 + 4) != a3)
    RB::Fill::Color::convert((uint64_t)this, a3, *(uint16x4_t *)&_D0);
}

float32x2_t *RB::Fill::MeshGradient::PatchBuffer::PatchBuffer(float32x2_t *a1, __int32 a2, __int32 a3, float64x2_t *a4, __int32 a5, int32x2_t a6, int32x2_t a7, int32x2_t a8)
{
  uint32x2_t v10;
  int8x8_t v11;
  float32x2_t v12;
  float32x2_t v13;
  float64x2_t v14;
  float64x2_t *v15;
  float64x2_t v16;
  float64x2_t v17;
  float32x2_t v18;
  float32x2_t v19;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;

  a8.i32[0] = 0;
  a1->i32[0] = a2;
  a1->i32[1] = a3;
  a1[1].i32[0] = a5;
  a1[4] = 0;
  a1[5].i32[0] = 0;
  a1[6] = 0;
  v10 = (uint32x2_t)vceq_s32(a7, (int32x2_t)0x8000000080000000);
  v11 = (int8x8_t)vdup_lane_s32(vcgt_s32(a8, (int32x2_t)vpmin_u32(v10, v10)), 0);
  v12 = (float32x2_t)vbsl_s8(v11, (int8x8_t)0x100000001000000, (int8x8_t)vcvt_f32_s32(a6));
  v13 = (float32x2_t)vbsl_s8(v11, (int8x8_t)vdup_n_s32(0x7F7FFFFFu), (int8x8_t)vcvt_f32_s32(a7));
  v14 = a4[1];
  v21 = *a4;
  v22 = v14;
  v23 = a4[2];
  if (RB::AffineTransform::invert((RB::AffineTransform *)&v21))
    v15 = &v21;
  else
    v15 = a4;
  v16 = v15[1];
  v17 = v15[2];
  v21 = *v15;
  v22 = v16;
  v23 = v17;
  v18 = RB::operator*(&v21, v12, v13);
  a1[2] = v18;
  a1[3] = vadd_f32(v19, v18);
  a1[5].f32[1] = RB::AffineTransform::scale(a4);
  return a1;
}

uint64_t RB::Fill::MeshGradient::PatchBuffer::alloc_patch(RB::Fill::MeshGradient::PatchBuffer *this)
{
  uint64_t v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;

  if (*((_BYTE *)this + 56))
  {
    v2 = *((unsigned int *)this + 12);
    if (*((_QWORD *)this + 9) >= (unint64_t)(*(_DWORD *)this + v2))
      return *((_QWORD *)this + 8) + v2;
    return 0;
  }
  v4 = *((_QWORD *)this + 8);
  v5 = *(_DWORD *)(v4 + 136);
  if (v5)
  {
    v6 = *((unsigned int *)this + 12);
    v7 = *(_QWORD *)(v4 + 128);
    if (v7)
      v8 = *(_QWORD *)(v4 + 128);
    else
      v8 = *((_QWORD *)this + 8);
    v9 = (v5 - 1);
    v10 = v8 + 32 * v9;
    if (*(_QWORD *)(v10 + 16) >= (unint64_t)(*(_DWORD *)this + v6))
      goto LABEL_16;
    RB::RenderFrame::commit_buffer_region_size(*((_QWORD *)this + 9), v10, v6);
  }
  RB::RenderFrame::alloc_buffer_region(*((RB::RenderFrame **)this + 9), (RB::Device *)*(unsigned int *)this, *((unsigned int *)this + 1), 1, &v20);
  v11 = v20;
  if (!v20)
    return 0;
  v12 = *((_QWORD *)this + 8);
  v13 = v21;
  v14 = *(_DWORD *)(v12 + 136);
  if (*(_DWORD *)(v12 + 140) < v14 + 1)
  {
    v18 = v20;
    v19 = *((_QWORD *)this + 8);
    v17 = v21;
    RB::vector<RB::Fill::MeshGradient::MeshBuffer,4ul,unsigned int>::reserve_slow((void *)v12, v14 + 1);
    v13 = v17;
    v11 = v18;
    v12 = v19;
    v14 = *(_DWORD *)(v19 + 136);
  }
  LODWORD(v6) = 0;
  v15 = *(_QWORD *)(v12 + 128);
  if (!v15)
    v15 = v12;
  v16 = v15 + 32 * v14;
  *(_QWORD *)v16 = v11;
  *(_OWORD *)(v16 + 8) = v13;
  *(_QWORD *)(v16 + 24) = 0;
  ++*(_DWORD *)(v12 + 136);
  *((_DWORD *)this + 12) = 0;
  v4 = *((_QWORD *)this + 8);
  v7 = *(_QWORD *)(v4 + 128);
  v9 = (*(_DWORD *)(v4 + 136) - 1);
LABEL_16:
  if (v7)
    v4 = v7;
  return *(_QWORD *)(*(_QWORD *)(v4 + 32 * v9) + 56) + *(_QWORD *)(v4 + 32 * v9 + 8) + v6;
}

float32x2_t *RB::Fill::MeshGradient::PatchBuffer::commit_patch(float32x2_t *result, uint64_t a2)
{
  float16x4_t v2;
  float32x4_t v5;
  float32x2_t v6;
  float32x2_t v7;
  float32x2_t v8;
  float32x2_t v9;
  float16x4_t v10;
  float32x2_t v11;
  float32x2_t v12;
  float16x4_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float16x4_t v16;
  float32x2_t v17;
  float32x2_t v18;
  float32x2_t v19;
  float32x2_t v20;
  float32x2_t v26;
  float32x2_t v27;
  float32x2_t v28;
  float32x2_t v29;
  float32x2_t v30;
  int32x4_t v31;
  float32x2_t v32;
  float32x2_t v33;
  uint32x2_t v34;
  float32x2_t v35;
  float v36;
  __int32 v37;
  float16x4_t v38;
  float16x4_t v39;
  float16x4_t v40;
  float16x4_t v41;
  float16x4_t v42;
  float16x4_t v43;
  float16x4_t v44;
  float16x4_t v45;
  float16x4_t v46;
  float16x4_t v47;
  float16x4_t v49;
  float16x4_t v50;
  float16x4_t v51;
  float16x4_t v52;
  float16x4_t v53;
  float16x4_t v54;
  float32x4_t v55;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float32x4_t v70;
  float32x4_t v71;
  float32x4_t v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;
  float32x4_t v84;
  float32x2_t v85;
  float32x2_t v86;
  uint64_t v87;

  v7 = *(float32x2_t *)a2;
  v6 = *(float32x2_t *)(a2 + 8);
  v9 = *(float32x2_t *)(a2 + 16);
  v8 = *(float32x2_t *)(a2 + 24);
  v10 = (float16x4_t)vcvtq_f32_f16(*(float16x4_t *)(a2 + 32)).u64[0];
  v11 = vadd_f32(*(float32x2_t *)a2, (float32x2_t)v10);
  v10.i32[0] = *(_DWORD *)(a2 + 36);
  v12 = vadd_f32(v6, (float32x2_t)*(_OWORD *)&vcvtq_f32_f16(v10));
  v13 = (float16x4_t)vcvtq_f32_f16(*(float16x4_t *)(a2 + 40)).u64[0];
  v14 = vadd_f32(*(float32x2_t *)a2, (float32x2_t)v13);
  v13.i32[0] = *(_DWORD *)(a2 + 44);
  v15 = vadd_f32(v6, (float32x2_t)*(_OWORD *)&vcvtq_f32_f16(v13));
  v16 = (float16x4_t)vcvtq_f32_f16(*(float16x4_t *)(a2 + 48)).u64[0];
  v17 = vadd_f32(v9, (float32x2_t)v16);
  v16.i32[0] = *(_DWORD *)(a2 + 52);
  v18 = vadd_f32(v8, (float32x2_t)*(_OWORD *)&vcvtq_f32_f16(v16));
  v19 = vadd_f32(v9, (float32x2_t)*(_OWORD *)&vcvtq_f32_f16(*(float16x4_t *)(a2 + 56)));
  v2.i32[0] = *(_DWORD *)(a2 + 60);
  v20 = vadd_f32(v8, (float32x2_t)*(_OWORD *)&vcvtq_f32_f16(v2));
  if ((result[1].i8[0] & 1) != 0)
  {
    __asm
    {
      FMOV            V20.2S, #-4.0
      FMOV            V22.2S, #6.0
    }
    *(float32x2_t *)v5.f32 = vmul_f32(vadd_f32(v9, v6), (float32x2_t)0xC0000000C0000000);
    __asm { FMOV            V26.2S, #3.0 }
    v26 = (float32x2_t)vdup_n_s32(0x3DE38E39u);
    v27 = vmla_f32(vmla_f32(vsub_f32(*(float32x2_t *)v5.f32, vmls_f32(v8, *(float32x2_t *)_Q20.f32, v7)), *(float32x2_t *)_Q22.f32, vadd_f32(v14, v11)), _D26, vadd_f32(v19, v15));
    v28 = vmul_f32(vadd_f32(v8, v7), (float32x2_t)0xC0000000C0000000);
    v29 = vmla_f32(vmla_f32(vsub_f32(v28, vmls_f32(v9, *(float32x2_t *)_Q20.f32, v6)), *(float32x2_t *)_Q22.f32, vadd_f32(v15, v12)), _D26, vadd_f32(v20, v14));
    v30 = vmla_f32(vmla_f32(vsub_f32(v28, vmls_f32(v6, *(float32x2_t *)_Q20.f32, v9)), _D26, vadd_f32(v18, v11)), *(float32x2_t *)_Q22.f32, vadd_f32(v19, v17));
    *(float32x2_t *)_Q20.f32 = vmla_f32(vmla_f32(vsub_f32(*(float32x2_t *)v5.f32, vmls_f32(v7, *(float32x2_t *)_Q20.f32, v8)), _D26, vadd_f32(v17, v12)), *(float32x2_t *)_Q22.f32, vadd_f32(v20, v18));
    *(float32x2_t *)_Q22.f32 = vneg_f32(vmls_f32(v7, v26, v27));
    *(float32x2_t *)v5.f32 = vneg_f32(vmls_f32(v9, v26, v30));
    *(float32x2_t *)_Q20.f32 = vneg_f32(vmls_f32(v8, v26, *(float32x2_t *)_Q20.f32));
    v31 = (int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v5), _Q20);
    *(float32x2_t *)_Q20.f32 = vneg_f32(vmls_f32(v6, v26, v29));
    *(int32x4_t *)(a2 + 64) = vuzp1q_s32((int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(_Q22), _Q20), v31);
  }
  v32 = vminnm_f32(vminnm_f32(vminnm_f32(vminnm_f32(vminnm_f32(vminnm_f32(vminnm_f32(vminnm_f32(vminnm_f32(vminnm_f32(vminnm_f32(v7, v11), v12), v6), v14), v15), v17), v18), v9), v19), v20), v8);
  v33 = vmaxnm_f32(vmaxnm_f32(vmaxnm_f32(vmaxnm_f32(vmaxnm_f32(vmaxnm_f32(vmaxnm_f32(vmaxnm_f32(vmaxnm_f32(vmaxnm_f32(vmaxnm_f32(v7, v11), v12), v6), v14), v15), v17), v18), v9), v19), v20), v8);
  v34 = (uint32x2_t)vorr_s8((int8x8_t)vcgt_f32(result[2], v33), (int8x8_t)vcgt_f32(v32, result[3]));
  if ((vpmax_u32(v34, v34).u32[0] & 0x80000000) == 0)
  {
    result[4] = vmaxnm_f32(result[4], vmaxnm_f32(vmaxnm_f32(vmaxnm_f32(vabs_f32(vadd_f32(vsub_f32(v7, vadd_f32(v11, v11)), v12)), vabd_f32(vadd_f32(v11, v6), vadd_f32(v12, v12))), vmaxnm_f32(vabs_f32(vadd_f32(vsub_f32(v9, vadd_f32(v19, v19)), v20)), vabd_f32(vadd_f32(v19, v8), vadd_f32(v20, v20)))), vmaxnm_f32(vmaxnm_f32(vabs_f32(vadd_f32(vsub_f32(v7, vadd_f32(v14, v14)), v17)), vabd_f32(vadd_f32(v14, v9), vadd_f32(v17, v17))), vmaxnm_f32(vabs_f32(vadd_f32(vsub_f32(v6, vadd_f32(v15, v15)), v18)), vabd_f32(vadd_f32(v15, v8), vadd_f32(v18, v18))))));
    v35 = vsub_f32(v33, v32);
    v36 = vmul_lane_f32(v35, v35, 1).f32[0];
    if (result[5].f32[0] >= v36)
      v36 = result[5].f32[0];
    result[5].f32[0] = v36;
    v37 = result[1].i32[0];
    if ((v37 & 2) == 0)
      goto LABEL_13;
    v39 = *(float16x4_t *)(a2 + 80);
    v38 = *(float16x4_t *)(a2 + 88);
    v41 = *(float16x4_t *)(a2 + 96);
    v40 = *(float16x4_t *)(a2 + 104);
    v43 = *(float16x4_t *)(a2 + 112);
    v42 = *(float16x4_t *)(a2 + 120);
    v45 = *(float16x4_t *)(a2 + 128);
    v44 = *(float16x4_t *)(a2 + 136);
    v47 = *(float16x4_t *)(a2 + 144);
    v46 = *(float16x4_t *)(a2 + 152);
    __asm { FMOV            V16.4S, #3.0 }
    v50 = *(float16x4_t *)(a2 + 160);
    v49 = *(float16x4_t *)(a2 + 168);
    if ((v37 & 1) != 0)
    {
      v55 = vcvtq_f32_f16(v39);
      __asm { FMOV            V25.4S, #-4.0 }
      v57 = vcvtq_f32_f16(v43);
      v58 = vcvtq_f32_f16(v45);
      __asm { FMOV            V26.4S, #6.0 }
      v60 = vcvtq_f32_f16(v38);
      v61 = vcvtq_f32_f16(v41);
      v62.i64[0] = 0xC0000000C0000000;
      v62.i64[1] = 0xC0000000C0000000;
      v63 = vcvtq_f32_f16(v44);
      v64 = vcvtq_f32_f16(v50);
      v65 = vcvtq_f32_f16(v40);
      v66 = vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(v61, v60))), v62)));
      v67 = (float32x4_t)vdupq_n_s32(0x3DE38000u);
      v51 = vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(v55, _Q25))), v65))), v66))), vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(v58, v57))), _Q26)))))), vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(v64, v63))), _Q16)))))), v67));
      v68 = vcvtq_f32_f16(v42);
      v69 = vcvtq_f32_f16(v49);
      v70 = vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(v65, v55))), v62)));
      v52 = vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(v60, _Q25))), v61))), v70))), vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(v63, v68))), _Q26)))))), vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(v69, v58))), _Q16)))))), v67));
      v71 = vcvtq_f32_f16(v47);
      v72 = vcvtq_f32_f16(v46);
      v53 = vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(v61, _Q25))), v60))), v70))), vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(v72, v57))), _Q16)))))), vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(v64, v71))), _Q26)))))), v67));
      v54 = vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(v65, _Q25))), v55))), v66))), vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(v71, v68))), _Q16)))))), vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(v69, v72))), _Q26)))))), v67));
      if ((v37 & 4) == 0)
      {
LABEL_12:
        *(float16x4_t *)(a2 + 88) = v38;
        *(float16x4_t *)(a2 + 104) = v40;
        *(float16x4_t *)(a2 + 112) = v43;
        *(float16x4_t *)(a2 + 120) = v42;
        *(float16x4_t *)(a2 + 136) = v44;
        *(float16x4_t *)(a2 + 152) = v46;
        *(float16x4_t *)(a2 + 160) = v50;
        *(float16x4_t *)(a2 + 168) = v49;
        *(float16x4_t *)(a2 + 176) = v51;
        *(float16x4_t *)(a2 + 184) = v52;
        *(float16x4_t *)(a2 + 192) = v53;
        *(float16x4_t *)(a2 + 200) = v54;
LABEL_13:
        ++result[6].i32[1];
        if (!result[7].i8[0])
        {
          v85 = result[8];
          v86 = *(float32x2_t *)(*(_QWORD *)&v85 + 128);
          if (!*(_QWORD *)&v86)
            v86 = result[8];
          v87 = *(_QWORD *)&v86 + 32 * (*(_DWORD *)(*(_QWORD *)&v85 + 136) - 1);
          ++*(_DWORD *)(v87 + 28);
        }
        result[6].i32[0] += result->i32[0];
        return result;
      }
    }
    else
    {
      v51 = *(float16x4_t *)(a2 + 176);
      v52 = *(float16x4_t *)(a2 + 184);
      v53 = *(float16x4_t *)(a2 + 192);
      v54 = *(float16x4_t *)(a2 + 200);
      if ((v37 & 4) == 0)
        goto LABEL_12;
    }
    v73 = vcvtq_f32_f16(v42);
    v74 = vcvtq_f32_f16(v43);
    v75 = vcvtq_f32_f16(v39);
    v38 = vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(vcvtq_f32_f16(v38), v75))), vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(v74, v73))), _Q16)))));
    v42 = vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(v75, vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(v74, v74)))))), v73))), _Q16));
    v43 = vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(v74, v75))), _Q16));
    v76 = vcvtq_f32_f16(v52);
    v77 = vcvtq_f32_f16(v51);
    v78 = vcvtq_f32_f16(v45);
    v44 = vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(vcvtq_f32_f16(v44), v78))), vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(v77, v76))), _Q16)))));
    v52 = vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(v78, vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(v77, v77)))))), v76))), _Q16));
    v51 = vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(v77, v78))), _Q16));
    v79 = vcvtq_f32_f16(v54);
    v80 = vcvtq_f32_f16(v53);
    v81 = vcvtq_f32_f16(v47);
    v46 = vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(vcvtq_f32_f16(v46), v81))), vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(v80, v79))), _Q16)))));
    v54 = vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(v81, vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(v80, v80)))))), v79))), _Q16));
    v53 = vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(v80, v81))), _Q16));
    v82 = vcvtq_f32_f16(v49);
    v83 = vcvtq_f32_f16(v50);
    v84 = vcvtq_f32_f16(v41);
    v40 = vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(vcvtq_f32_f16(v40), v84))), vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(v83, v82))), _Q16)))));
    v49 = vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(v84, vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(v83, v83)))))), v82))), _Q16));
    v50 = vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(v83, v84))), _Q16));
    goto LABEL_12;
  }
  return result;
}

uint64_t RB::Fill::MeshGradient::PatchBuffer::finalize(uint64_t this)
{
  uint64_t v1;
  int v2;

  if (!*(_BYTE *)(this + 56))
  {
    v1 = *(_QWORD *)(this + 64);
    v2 = *(_DWORD *)(v1 + 136);
    if (v2)
    {
      if (*(_QWORD *)(v1 + 128))
        v1 = *(_QWORD *)(v1 + 128);
      return RB::RenderFrame::commit_buffer_region_size(*(_QWORD *)(this + 72), v1 + 32 * (v2 - 1), *(unsigned int *)(this + 48));
    }
  }
  return this;
}

uint64_t RB::Fill::MeshGradient::make_buffers(int32x2_t *this, uint64_t a2, uint64_t a3, RB::RenderFrame ***a4, float64x2_t *a5, int32x2_t *a6, float a7)
{
  int v13;
  int v14;
  int v15;
  __int8 v16;
  __int8 v17;
  int v18;
  BOOL v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  int8x16_t v25;
  double v26;
  double v27;
  double v28;
  int8x16_t v29;
  float16x4_t *v30;
  uint64_t v31;
  RB::RenderFrame *v32;
  __int32 v33;
  __int32 v34;
  int32x2_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int *v39;
  int v40;
  uint64_t v41;
  float32x2_t v42;
  __int128 v43;
  uint64_t v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  float v48;
  unsigned int v49;
  unsigned int v50;
  char v51;
  unsigned int v52;
  float32x2_t v53;
  float32x2_t v54;
  __int128 v56;
  float32x2_t v57;
  __int128 v58;
  float32x2_t v59;
  float v60;
  char v61;
  uint64_t v62;
  RB::RenderFrame *v63;
  float v64;
  char v65;
  char v66;
  char v67;
  char v68;

  v13 = *((unsigned __int8 *)a4 + 124);
  v14 = v13;
  if (this[4].i8[5])
    v14 = this[4].u8[4];
  v15 = 0;
  v16 = this[4].i8[7];
  v17 = this[4].i8[6];
  v64 = a7;
  v65 = v14;
  v66 = v13;
  v67 = 0;
  v18 = v17 & 0xF;
  if (v18 == 1)
    goto LABEL_8;
  if (v18 == 3)
  {
    v15 = 1;
    v67 = 1;
LABEL_8:
    v13 &= 0xFEu;
    goto LABEL_9;
  }
  if (v18 != 2)
    goto LABEL_10;
  v15 = 0;
  v13 |= 1u;
LABEL_9:
  v66 = v13;
LABEL_10:
  v20 = (v16 & 0x10) == 0 || v15 != 0 || a7 != 1.0;
  v21 = v13 != v14 || v20;
  v68 = v21;
  v22 = v16 & 0xF;
  if ((v16 & 0xF) == 0)
    return v22;
  if ((_DWORD)v22 == 5)
  {
    v22 = (2 * (HIDWORD(*(unint64_t *)this) + this[3].i32[0] - *(_QWORD *)this) - 4);
LABEL_24:
    RB::RenderFrame::alloc_buffer_region(**a4, (RB::Device *)(16 * v22), 8uLL, 0, &v57);
    if (!*(_QWORD *)&v57)
      return 0;
    v30 = (float16x4_t *)(*(_QWORD *)(*(_QWORD *)&v57 + 56) + v58);
    if ((this[4].i8[7] & 0xF) == 6)
      RB::Fill::MeshGradient::make_triangles((uint64_t)this, v30, v22, (uint64_t)&v64, v24, v25, v26, v27, v28, v29);
    else
      RB::Fill::MeshGradient::make_triangle_grid((uint64_t *)this, (uint64_t)v30, v24, v25, v26, v27, v28, v29, v23, (uint64_t)&v64);
    *(_DWORD *)(a3 + 14) = 0;
    *(_DWORD *)(a3 + 4) = 0;
    *(_DWORD *)(a3 + 8) = 0;
    *(_DWORD *)(a3 + 20) = 0;
    if ((this[4].i8[7] & 0xF) == 6)
      v41 = this[3].u32[0];
    else
      v41 = v22;
    v42 = v57;
    v43 = v58;
    v44 = v41 << 32;
    v45 = *(_DWORD *)(a2 + 136);
    if (*(_DWORD *)(a2 + 140) < v45 + 1)
    {
      v56 = v58;
      RB::vector<RB::Fill::MeshGradient::MeshBuffer,4ul,unsigned int>::reserve_slow((void *)a2, v45 + 1);
      v43 = v56;
      v45 = *(_DWORD *)(a2 + 136);
    }
    v46 = *(_QWORD *)(a2 + 128);
    if (!v46)
      v46 = a2;
    v47 = v46 + 32 * v45;
    *(float32x2_t *)v47 = v42;
    *(_OWORD *)(v47 + 8) = v43;
    *(_QWORD *)(v47 + 24) = v44;
    ++*(_DWORD *)(a2 + 136);
    return v22;
  }
  if ((_DWORD)v22 == 6)
  {
    v22 = (3 * this[3].i32[0]);
    goto LABEL_24;
  }
  v31 = RB::Fill::MeshGradient::patches_info(this);
  v32 = **a4;
  RB::Fill::MeshGradient::PatchBuffer::PatchBuffer(&v57, SHIDWORD(v31), v33, a5, v34, *a6, a6[1], v35);
  v61 = 0;
  v62 = a2;
  v63 = v32;
  RB::Fill::MeshGradient::make_patches((float32x2_t *)this, (RB::Fill::MeshGradient::PatchBuffer *)&v57, (uint64_t)&v64);
  RB::Fill::MeshGradient::PatchBuffer::finalize((uint64_t)&v57);
  if (*(_QWORD *)(a2 + 128))
    v36 = *(_QWORD *)(a2 + 128);
  else
    v36 = a2;
  v37 = *(unsigned int *)(a2 + 136);
  if ((_DWORD)v37)
  {
    LODWORD(v22) = 0;
    v38 = 32 * v37;
    v39 = (int *)(v36 + 28);
    do
    {
      *(v39 - 1) = v22;
      v40 = *v39;
      v39 += 8;
      v22 = (v40 + v22);
      v38 -= 32;
    }
    while (v38);
  }
  else
  {
    v22 = 0;
  }
  v48 = ceilf(log2f(fmaxf(sqrtf((float)(v60 * 0.25) * sqrtf(vaddv_f32(vmul_f32(v59, v59)))), 1.0)));
  if (v48 > 7.0)
    v48 = 7.0;
  v49 = v48 + 1;
  v50 = 2 * v48;
  do
  {
    v51 = v50 - 2;
    if (!--v49)
      break;
    v52 = (_DWORD)v22 << v50;
    LOBYTE(v50) = v50 - 2;
  }
  while (v52 > 0x10000);
  *(_DWORD *)(a3 + 4) = (1 << v49) - 1;
  *(_DWORD *)(a3 + 8) = ~(-1 << (v51 + 2));
  *(_WORD *)(a3 + 14) = 2 * v49;
  *(_WORD *)(a3 + 16) = v49;
  v53 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT((float)(1 << v49)));
  v54 = vmul_f32(vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT((float)(1 << v49)), v53), v53);
  *(_DWORD *)(a3 + 20) = vmul_f32(v54, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT((float)(1 << v49)), v54)).u32[0];
  return v22;
}

void RB::Fill::MeshGradient::make_triangles(uint64_t a1, float16x4_t *a2, int a3, uint64_t a4, double a5, int8x16_t a6, double a7, double a8, double a9, int8x16_t a10)
{
  uint64_t v11;
  float16x4_t *v12;
  uint64_t v13;
  float16x4_t *v14;
  double v15;

  if (a3)
  {
    v11 = *(_DWORD *)(a1 + 24) * RB::Fill::MeshGradient::points_per_elt[*(_BYTE *)(a1 + 39) & 0xF];
    v12 = (float16x4_t *)(*(_QWORD *)(a1 + 8) + 16);
    if ((3 * a3) <= 1)
      v13 = 1;
    else
      v13 = (3 * a3);
    v14 = a2 + 1;
    do
    {
      v14[-1] = *v12;
      v15 = *(double *)&v12[v11];
      *(double *)v14 = v15;
      if (*(_BYTE *)(a4 + 7))
        RB::Fill::MeshGradient::ColorConversion::convert(a4, v14, v15, a6, a7, a8, a9, a10);
      v14 += 2;
      ++v12;
      --v13;
    }
    while (v13);
  }
}

void RB::Fill::MeshGradient::make_triangle_grid(uint64_t *a1, uint64_t a2, double a3, int8x16_t a4, double a5, double a6, double a7, int8x16_t a8, uint64_t a9, uint64_t a10)
{
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  int v19;
  float16x4_t *v20;
  double v21;
  unsigned int v22;
  _QWORD *v23;
  double v24;
  float16x4_t *v25;
  int v26;
  unsigned int v27;
  int v28;
  unsigned int v29;
  unsigned int v30;

  if (HIDWORD(*a1) != 1)
  {
    v12 = 0;
    v13 = 0;
    v14 = a1[1] + 16;
    v28 = *a1;
    v15 = v14
        + 8 * *((_DWORD *)a1 + 6) * RB::Fill::MeshGradient::points_per_elt[*((_BYTE *)a1 + 39) & 0xF];
    do
    {
      v16 = *a1;
      if (*a1)
      {
        v17 = 0;
        v18 = v12 * v28;
        v29 = v12 + 1;
        v30 = v12;
        v19 = (v12 + 1) * v28;
        do
        {
          v20 = (float16x4_t *)(a2 + 16 * v13);
          *v20 = *(float16x4_t *)(v14 + 8 * (v18 + v17));
          v21 = *(double *)(v15 + 8 * (v18 + v17));
          *(double *)&v20[1] = v21;
          if (*(_BYTE *)(a10 + 7))
            RB::Fill::MeshGradient::ColorConversion::convert(a10, v20 + 1, v21, a4, a5, a6, a7, a8);
          v22 = v13 + 1;
          if (v30 && !v17)
          {
            *(_OWORD *)(a2 + 16 * v22) = *(_OWORD *)v20->i8;
            v22 = v13 + 2;
          }
          v23 = (_QWORD *)(a2 + 16 * v22);
          *v23 = *(_QWORD *)(v14 + 8 * (v19 + v17));
          v24 = *(double *)(v15 + 8 * (v19 + v17));
          *((double *)v23 + 1) = v24;
          v25 = (float16x4_t *)(v23 + 1);
          if (*(_BYTE *)(a10 + 7))
            RB::Fill::MeshGradient::ColorConversion::convert(a10, v25, v24, a4, a5, a6, a7, a8);
          v13 = v22 + 1;
          ++v17;
          v16 = *a1;
        }
        while (v17 < *a1);
        v26 = HIDWORD(*a1);
        v27 = v29;
        v12 = v30;
      }
      else
      {
        v26 = HIDWORD(*a1);
        v27 = v12 + 1;
      }
      if (v12 != HIDWORD(v16) - 2)
      {
        *(_OWORD *)(a2 + 16 * v13) = *(_OWORD *)(a2 + 16 * (v13 - 1));
        ++v13;
        v26 = *((_DWORD *)a1 + 1);
      }
      v12 = v27;
    }
    while (v27 < v26 - 1);
  }
}

uint64_t RB::Fill::MeshGradient::patches_info(int32x2_t *this)
{
  int v1;
  int32x2_t v2;
  unsigned __int32 v3;
  uint64_t v4;

  v1 = this[4].i8[7] & 0xF;
  if ((v1 - 1) < 2)
  {
    v2 = vadd_s32(*this, (int32x2_t)-1);
    v3 = vmul_lane_s32(v2, v2, 1).u32[0];
    v4 = 0xD000000000;
    if ((this[4].i8[6] & 0x10) == 0)
      v4 = 0x7000000000;
  }
  else if (v1 == 3 || v1 == 4)
  {
    v3 = this[3].u32[0];
    v4 = 0x7000000000;
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return v4 | v3;
}

float32x2_t *RB::Fill::MeshGradient::make_patches(float32x2_t *result, RB::Fill::MeshGradient::PatchBuffer *this, uint64_t a3)
{
  switch(result[4].i8[7] & 0xF)
  {
    case 1:
      result = RB::Fill::MeshGradient::make_vertex_grid(result, this, a3);
      break;
    case 2:
      result = RB::Fill::MeshGradient::make_bezier_grid(result, this, a3);
      break;
    case 3:
      result = RB::Fill::MeshGradient::make_coons_patches(result, this);
      break;
    case 4:
      result = RB::Fill::MeshGradient::make_tensor_patches(result, this, a3);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t RB::Fill::MeshGradient::primitive_type(RB::Fill::MeshGradient *this)
{
  uint64_t v1;

  v1 = *((_BYTE *)this + 39) & 0xF;
  if (v1 > 6)
    return 4;
  else
    return qword_209BDA550[v1];
}

float32x2_t *RB::Fill::MeshGradient::make_vertex_grid(float32x2_t *result, RB::Fill::MeshGradient::PatchBuffer *this, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unsigned int v6;
  int v8;
  unsigned int v9;
  int v10;
  unint64_t v11;
  float32x4_t v12;
  int8x16_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  uint64_t v20;
  float32x2_t v21;
  float32x2_t v22;
  float32x2_t v23;
  float32x2_t v24;
  float32x2_t v25;
  float32x2_t v26;
  float32x2_t v27;
  float v28;
  float v29;
  float32x2_t v30;
  float32x2_t v31;
  float32x2_t v32;
  float32x2_t v33;
  float32x2_t v34;
  float32x2_t v35;
  float v36;
  float v37;
  float32x2_t v38;
  float32x2_t v39;
  float32x2_t v40;
  uint32x2_t v41;
  unsigned __int32 v42;
  int32x2_t v43;
  float32x2_t v44;
  float32x2_t v45;
  float32x2_t v46;
  uint32x2_t v47;
  int32x2_t v48;
  float32x2_t v49;
  float32x2_t v50;
  float32x2_t v51;
  float v52;
  float v53;
  float32x2_t v54;
  float32x2_t v55;
  float32x2_t v56;
  float32x2_t v57;
  float32x2_t v58;
  float32x2_t v59;
  float v60;
  float v61;
  float32x2_t v62;
  float32x2_t v63;
  float32x2_t v64;
  float32x2_t v65;
  uint32x2_t v66;
  unsigned __int32 v67;
  float32x2_t v68;
  int32x2_t v69;
  float32x2_t v70;
  float32x2_t v71;
  float32x2_t v72;
  uint32x2_t v73;
  int32x2_t v74;
  float32x2_t v75;
  float32x2_t v76;
  float32x2_t v77;
  int16x4_t v78;
  float32x4_t v79;
  float32x2_t v80;
  unint64_t v81;
  float32x2_t v82;
  float32x2_t v83;
  float32x2_t v84;
  float32x2_t v85;
  float v86;
  float v87;
  float32x2_t v88;
  float32x2_t v89;
  float32x2_t v90;
  float32x2_t v91;
  float32x2_t v92;
  float32x2_t v93;
  float v94;
  float v95;
  float32x2_t v96;
  float32x2_t v97;
  float32x2_t v98;
  uint32x2_t v99;
  unsigned __int32 v100;
  float32x2_t v101;
  int32x2_t v102;
  float32x2_t v103;
  float32x2_t v104;
  float32x2_t v105;
  uint32x2_t v106;
  int32x2_t v107;
  float32x2_t v108;
  float32x2_t v109;
  float32x2_t v110;
  float v111;
  float v112;
  float32x2_t v113;
  float32x2_t v114;
  float32x2_t v115;
  float32x2_t v116;
  float32x2_t v117;
  float32x2_t v118;
  float v119;
  float v120;
  float32x2_t v121;
  float32x2_t v122;
  float32x2_t v123;
  uint32x2_t v124;
  unsigned __int32 v125;
  float32x2_t v126;
  int32x2_t v127;
  float32x2_t v128;
  float32x2_t v129;
  float32x2_t v130;
  uint32x2_t v131;
  int32x2_t v132;
  float32x2_t v133;
  float32x2_t v134;
  int32x2_t v135;
  int32x2_t v136;
  double v137;
  int v138;
  int v139;
  float32x2_t *v140;
  int v142;
  int v143;
  unsigned int v144;
  unsigned int v145;
  unsigned int v146;
  uint64_t v147[2];
  int v148;

  v140 = result;
  v3 = *(_QWORD *)&result[1] + 16;
  v4 = (uint64_t)*result;
  v147[0] = v3 + 8 * result[3].i32[0] * RB::Fill::MeshGradient::points_per_elt[result[4].i8[7] & 0xF];
  v147[1] = v4;
  v5 = v4;
  v148 = v4;
  v6 = HIDWORD(v4);
  if (HIDWORD(v4) != 1)
  {
    v8 = 0;
    v9 = 0;
    v143 = 2 * v4;
    v142 = -(int)v4;
    v139 = v4 - 1;
    v138 = -1;
    v10 = v4;
    while (1)
    {
      v146 = v9 + 1;
      if ((_DWORD)v4 != 1)
        break;
LABEL_72:
      v143 += v5;
      v142 += v5;
      v10 += v5;
      v8 += v5;
      v139 += v5;
      v138 += v5;
      ++v9;
      if (v146 >= HIDWORD(v4) - 1)
        return result;
    }
    v11 = 0;
    v144 = v9 + 2;
    v145 = v9 - 1;
    while (1)
    {
      result = (float32x2_t *)RB::Fill::MeshGradient::PatchBuffer::alloc_patch(this);
      if (!result)
        break;
      v20 = (uint64_t)result;
      v15.i64[0] = *(_QWORD *)(v3 + 8 * (v8 + v11));
      v13.i64[0] = *(_QWORD *)(v3 + 8 * (v8 + v11 + 1));
      v21 = *(float32x2_t *)(v3 + 8 * (v10 + v11));
      v22 = *(float32x2_t *)(v3 + 8 * (v10 + v11 + 1));
      *result = *(float32x2_t *)v15.f32;
      result[1] = v21;
      result[2] = *(float32x2_t *)v13.i8;
      result[3] = v22;
      v23 = *(float32x2_t *)v15.f32;
      if (v5 > (int)v11 - 1)
      {
        v23 = *(float32x2_t *)v15.f32;
        if (v6 > v9)
          v23 = *(float32x2_t *)(v3 + 8 * (v138 + v11));
      }
      v24 = *(float32x2_t *)v13.i8;
      if (v5 > (int)v11 + 2)
      {
        v24 = *(float32x2_t *)v13.i8;
        if (v6 > v9)
          v24 = *(float32x2_t *)(v3 + 8 * (v8 + v11 + 2));
      }
      v25 = v21;
      if (v5 > (int)v11 - 1)
      {
        v25 = v21;
        if (v6 > v146)
          v25 = *(float32x2_t *)(v3 + 8 * (v139 + v11));
      }
      v26 = v22;
      if (v5 > (int)v11 + 2)
      {
        v26 = v22;
        if (v6 > v146)
          v26 = *(float32x2_t *)(v3 + 8 * (v10 + v11 + 2));
      }
      v27 = vsub_f32(*(float32x2_t *)v15.f32, v23);
      v28 = sqrtf(vaddv_f32(vmul_f32(v27, v27)));
      if (v28 != 0.0)
      {
        v29 = v28;
        v30 = vrecpe_f32((float32x2_t)LODWORD(v28));
        v31 = vmul_f32(vrecps_f32((float32x2_t)LODWORD(v29), v30), v30);
        v27 = vmul_n_f32(v27, vmul_f32(v31, vrecps_f32((float32x2_t)LODWORD(v29), v31)).f32[0]);
      }
      v32 = vsub_f32(*(float32x2_t *)v13.i8, *(float32x2_t *)v15.f32);
      v17.f32[0] = sqrtf(vaddv_f32(vmul_f32(v32, v32)));
      if (v17.f32[0] != 0.0)
      {
        v33 = vrecpe_f32((float32x2_t)v17.u32[0]);
        v34 = vmul_f32(vrecps_f32((float32x2_t)v17.u32[0], v33), v33);
        v32 = vmul_n_f32(v32, vmul_f32(v34, vrecps_f32((float32x2_t)v17.u32[0], v34)).f32[0]);
      }
      v35 = vsub_f32(v24, *(float32x2_t *)v13.i8);
      v36 = sqrtf(vaddv_f32(vmul_f32(v35, v35)));
      if (v36 != 0.0)
      {
        v37 = v36;
        v38 = vrecpe_f32((float32x2_t)LODWORD(v36));
        v39 = vmul_f32(vrecps_f32((float32x2_t)LODWORD(v37), v38), v38);
        v35 = vmul_n_f32(v35, vmul_f32(v39, vrecps_f32((float32x2_t)LODWORD(v37), v39)).f32[0]);
      }
      v40 = vadd_f32(v32, v27);
      v18.i64[0] = 0;
      v41 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(v40));
      v42 = vpmax_u32(v41, v41).u32[0];
      v16.i64[0] = 0;
      if ((v42 & 0x80000000) != 0)
      {
        v43 = (int32x2_t)vmul_f32(v40, v40);
        v43.i32[0] = vadd_f32((float32x2_t)v43, (float32x2_t)vdup_lane_s32(v43, 1)).u32[0];
        v44 = vrsqrte_f32((float32x2_t)v43.u32[0]);
        v45 = vmul_f32(vrsqrts_f32((float32x2_t)v43.u32[0], vmul_f32(v44, v44)), v44);
        *(float32x2_t *)v16.f32 = vmul_n_f32(v40, vmul_f32(v45, vrsqrts_f32((float32x2_t)v43.u32[0], vmul_f32(v45, v45))).f32[0]);
      }
      v46 = vadd_f32(v35, v32);
      v47 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(v46));
      if ((vpmax_u32(v47, v47).u32[0] & 0x80000000) != 0)
      {
        v48 = (int32x2_t)vmul_f32(v46, v46);
        v48.i32[0] = vadd_f32((float32x2_t)v48, (float32x2_t)vdup_lane_s32(v48, 1)).u32[0];
        v49 = vrsqrte_f32((float32x2_t)v48.u32[0]);
        v50 = vmul_f32(vrsqrts_f32((float32x2_t)v48.u32[0], vmul_f32(v49, v49)), v49);
        *(float32x2_t *)v18.f32 = vmul_n_f32(v46, vmul_f32(v50, vrsqrts_f32((float32x2_t)v48.u32[0], vmul_f32(v50, v50))).f32[0]);
      }
      v51 = vsub_f32(v21, v25);
      v52 = sqrtf(vaddv_f32(vmul_f32(v51, v51)));
      if (v52 != 0.0)
      {
        v53 = v52;
        v54 = vrecpe_f32((float32x2_t)LODWORD(v52));
        v55 = vmul_f32(vrecps_f32((float32x2_t)LODWORD(v53), v54), v54);
        v51 = vmul_n_f32(v51, vmul_f32(v55, vrecps_f32((float32x2_t)LODWORD(v53), v55)).f32[0]);
      }
      v56 = vsub_f32(v22, v21);
      v19.f32[0] = sqrtf(vaddv_f32(vmul_f32(v56, v56)));
      if (v19.f32[0] != 0.0)
      {
        v57 = vrecpe_f32((float32x2_t)v19.u32[0]);
        v58 = vmul_f32(vrecps_f32((float32x2_t)v19.u32[0], v57), v57);
        v56 = vmul_n_f32(v56, vmul_f32(v58, vrecps_f32((float32x2_t)v19.u32[0], v58)).f32[0]);
      }
      v59 = vsub_f32(v26, v22);
      v60 = sqrtf(vaddv_f32(vmul_f32(v59, v59)));
      if (v60 != 0.0)
      {
        v61 = v60;
        v62 = vrecpe_f32((float32x2_t)LODWORD(v60));
        v63 = vmul_f32(vrecps_f32((float32x2_t)LODWORD(v61), v62), v62);
        v59 = vmul_n_f32(v59, vmul_f32(v63, vrecps_f32((float32x2_t)LODWORD(v61), v63)).f32[0]);
      }
      v64 = vadd_f32(v56, v51);
      v65 = 0;
      v66 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(v64));
      v67 = vpmax_u32(v66, v66).u32[0];
      v68 = 0;
      if ((v67 & 0x80000000) != 0)
      {
        v69 = (int32x2_t)vmul_f32(v64, v64);
        v69.i32[0] = vadd_f32((float32x2_t)v69, (float32x2_t)vdup_lane_s32(v69, 1)).u32[0];
        v70 = vrsqrte_f32((float32x2_t)v69.u32[0]);
        v71 = vmul_f32(vrsqrts_f32((float32x2_t)v69.u32[0], vmul_f32(v70, v70)), v70);
        v68 = vmul_n_f32(v64, vmul_f32(v71, vrsqrts_f32((float32x2_t)v69.u32[0], vmul_f32(v71, v71))).f32[0]);
      }
      v72 = vadd_f32(v59, v56);
      v73 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(v72));
      if ((vpmax_u32(v73, v73).u32[0] & 0x80000000) != 0)
      {
        v74 = (int32x2_t)vmul_f32(v72, v72);
        v74.i32[0] = vadd_f32((float32x2_t)v74, (float32x2_t)vdup_lane_s32(v74, 1)).u32[0];
        v75 = vrsqrte_f32((float32x2_t)v74.u32[0]);
        v76 = vmul_f32(vrsqrts_f32((float32x2_t)v74.u32[0], vmul_f32(v75, v75)), v75);
        v65 = vmul_n_f32(v72, vmul_f32(v76, vrsqrts_f32((float32x2_t)v74.u32[0], vmul_f32(v76, v76))).f32[0]);
      }
      v77 = (float32x2_t)vdup_n_s32(0x3EAAAAABu);
      *(float32x2_t *)v16.f32 = vmul_f32(vmul_n_f32(v77, v17.f32[0]), *(float32x2_t *)v16.f32);
      v78 = (int16x4_t)vcvt_f16_f32(v16);
      *(int32x2_t *)v16.f32 = vdup_n_s32(0xBEAAAAAB);
      *(float32x2_t *)v17.f32 = vmul_f32(vmul_n_f32(*(float32x2_t *)v16.f32, v17.f32[0]), *(float32x2_t *)v18.f32);
      *(float32x2_t *)v18.f32 = vmul_f32(vmul_n_f32(v77, v19.f32[0]), v68);
      *(float32x2_t *)v19.f32 = vmul_f32(vmul_n_f32(*(float32x2_t *)v16.f32, v19.f32[0]), v65);
      v79 = (float32x4_t)vuzp1q_s32((int32x4_t)vcvt_hight_f16_f32(v78, v18), (int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v17), v19));
      *(float32x4_t *)result[5].f32 = v79;
      v80 = *(float32x2_t *)v15.f32;
      if (v11 < v5)
      {
        v80 = *(float32x2_t *)v15.f32;
        if (v6 > v145)
          v80 = *(float32x2_t *)(v3 + 8 * (v142 + v11));
      }
      v81 = v11 + 1;
      v82 = *(float32x2_t *)v13.i8;
      if (v11 + 1 < v5)
      {
        v82 = *(float32x2_t *)v13.i8;
        if (v6 > v145)
          v82 = *(float32x2_t *)(v3 + 8 * (v142 + v11 + 1));
      }
      v83 = v21;
      if (v11 < v5)
      {
        v83 = v21;
        if (v6 > v144)
          v83 = *(float32x2_t *)(v3 + 8 * (v143 + v11));
      }
      v84 = v22;
      if (v81 < v5)
      {
        v84 = v22;
        if (v6 > v144)
          v84 = *(float32x2_t *)(v3 + 8 * (v143 + v11 + 1));
      }
      v85 = vsub_f32(*(float32x2_t *)v15.f32, v80);
      v86 = sqrtf(vaddv_f32(vmul_f32(v85, v85)));
      if (v86 != 0.0)
      {
        v87 = v86;
        v88 = vrecpe_f32((float32x2_t)LODWORD(v86));
        v89 = vmul_f32(vrecps_f32((float32x2_t)LODWORD(v87), v88), v88);
        v85 = vmul_n_f32(v85, vmul_f32(v89, vrecps_f32((float32x2_t)LODWORD(v87), v89)).f32[0]);
      }
      v90 = vsub_f32(v21, *(float32x2_t *)v15.f32);
      v15.f32[0] = sqrtf(vaddv_f32(vmul_f32(v90, v90)));
      if (v15.f32[0] != 0.0)
      {
        v91 = vrecpe_f32((float32x2_t)v15.u32[0]);
        v92 = vmul_f32(vrecps_f32((float32x2_t)v15.u32[0], v91), v91);
        v90 = vmul_n_f32(v90, vmul_f32(v92, vrecps_f32((float32x2_t)v15.u32[0], v92)).f32[0]);
      }
      v93 = vsub_f32(v83, v21);
      v94 = sqrtf(vaddv_f32(vmul_f32(v93, v93)));
      if (v94 != 0.0)
      {
        v95 = v94;
        v96 = vrecpe_f32((float32x2_t)LODWORD(v94));
        v97 = vmul_f32(vrecps_f32((float32x2_t)LODWORD(v95), v96), v96);
        v93 = vmul_n_f32(v93, vmul_f32(v97, vrecps_f32((float32x2_t)LODWORD(v95), v97)).f32[0]);
      }
      v98 = vadd_f32(v90, v85);
      v14.i64[0] = 0;
      v99 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(v98));
      v100 = vpmax_u32(v99, v99).u32[0];
      v101 = 0;
      if ((v100 & 0x80000000) != 0)
      {
        v102 = (int32x2_t)vmul_f32(v98, v98);
        v102.i32[0] = vadd_f32((float32x2_t)v102, (float32x2_t)vdup_lane_s32(v102, 1)).u32[0];
        v103 = vrsqrte_f32((float32x2_t)v102.u32[0]);
        v104 = vmul_f32(vrsqrts_f32((float32x2_t)v102.u32[0], vmul_f32(v103, v103)), v103);
        v101 = vmul_n_f32(v98, vmul_f32(v104, vrsqrts_f32((float32x2_t)v102.u32[0], vmul_f32(v104, v104))).f32[0]);
      }
      v105 = vadd_f32(v93, v90);
      v106 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(v105));
      if ((vpmax_u32(v106, v106).u32[0] & 0x80000000) != 0)
      {
        v107 = (int32x2_t)vmul_f32(v105, v105);
        v107.i32[0] = vadd_f32((float32x2_t)v107, (float32x2_t)vdup_lane_s32(v107, 1)).u32[0];
        v108 = vrsqrte_f32((float32x2_t)v107.u32[0]);
        v109 = vmul_f32(vrsqrts_f32((float32x2_t)v107.u32[0], vmul_f32(v108, v108)), v108);
        *(float32x2_t *)v14.f32 = vmul_n_f32(v105, vmul_f32(v109, vrsqrts_f32((float32x2_t)v107.u32[0], vmul_f32(v109, v109))).f32[0]);
      }
      v110 = vsub_f32(*(float32x2_t *)v13.i8, v82);
      v111 = sqrtf(vaddv_f32(vmul_f32(v110, v110)));
      if (v111 != 0.0)
      {
        v112 = v111;
        v113 = vrecpe_f32((float32x2_t)LODWORD(v111));
        v114 = vmul_f32(vrecps_f32((float32x2_t)LODWORD(v112), v113), v113);
        v110 = vmul_n_f32(v110, vmul_f32(v114, vrecps_f32((float32x2_t)LODWORD(v112), v114)).f32[0]);
      }
      v115 = vsub_f32(v22, *(float32x2_t *)v13.i8);
      *(float *)v13.i32 = sqrtf(vaddv_f32(vmul_f32(v115, v115)));
      if (*(float *)v13.i32 != 0.0)
      {
        v116 = vrecpe_f32((float32x2_t)v13.u32[0]);
        v117 = vmul_f32(vrecps_f32((float32x2_t)v13.u32[0], v116), v116);
        v115 = vmul_n_f32(v115, vmul_f32(v117, vrecps_f32((float32x2_t)v13.u32[0], v117)).f32[0]);
      }
      v118 = vsub_f32(v84, v22);
      v119 = sqrtf(vaddv_f32(vmul_f32(v118, v118)));
      if (v119 != 0.0)
      {
        v120 = v119;
        v121 = vrecpe_f32((float32x2_t)LODWORD(v119));
        v122 = vmul_f32(vrecps_f32((float32x2_t)LODWORD(v120), v121), v121);
        v118 = vmul_n_f32(v118, vmul_f32(v122, vrecps_f32((float32x2_t)LODWORD(v120), v122)).f32[0]);
      }
      v123 = vadd_f32(v115, v110);
      v12.i64[0] = 0;
      v124 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(v123));
      v125 = vpmax_u32(v124, v124).u32[0];
      v126 = 0;
      if ((v125 & 0x80000000) != 0)
      {
        v127 = (int32x2_t)vmul_f32(v123, v123);
        v127.i32[0] = vadd_f32((float32x2_t)v127, (float32x2_t)vdup_lane_s32(v127, 1)).u32[0];
        v128 = vrsqrte_f32((float32x2_t)v127.u32[0]);
        v129 = vmul_f32(vrsqrts_f32((float32x2_t)v127.u32[0], vmul_f32(v128, v128)), v128);
        v126 = vmul_n_f32(v123, vmul_f32(v129, vrsqrts_f32((float32x2_t)v127.u32[0], vmul_f32(v129, v129))).f32[0]);
      }
      v130 = vadd_f32(v118, v115);
      v131 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(v130));
      if ((vpmax_u32(v131, v131).u32[0] & 0x80000000) != 0)
      {
        v132 = (int32x2_t)vmul_f32(v130, v130);
        v132.i32[0] = vadd_f32((float32x2_t)v132, (float32x2_t)vdup_lane_s32(v132, 1)).u32[0];
        v133 = vrsqrte_f32((float32x2_t)v132.u32[0]);
        v134 = vmul_f32(vrsqrts_f32((float32x2_t)v132.u32[0], vmul_f32(v133, v133)), v133);
        *(float32x2_t *)v12.f32 = vmul_n_f32(v130, vmul_f32(v134, vrsqrts_f32((float32x2_t)v132.u32[0], vmul_f32(v134, v134))).f32[0]);
      }
      *(float32x2_t *)v79.f32 = vmul_f32(vmul_n_f32(v77, v15.f32[0]), v101);
      *(float32x2_t *)v14.f32 = vmul_f32(vmul_n_f32(*(float32x2_t *)v16.f32, v15.f32[0]), *(float32x2_t *)v14.f32);
      v135 = (int32x2_t)vcvt_f16_f32(v14);
      *(float32x2_t *)v15.f32 = vmul_f32(vmul_n_f32(v77, *(float *)v13.i32), v126);
      v136 = (int32x2_t)vcvt_f16_f32(v15);
      *(float32x2_t *)v12.f32 = vmul_f32(vmul_n_f32(*(float32x2_t *)v16.f32, *(float *)v13.i32), *(float32x2_t *)v12.f32);
      *(int32x2_t *)v13.i8 = vzip1_s32((int32x2_t)vcvt_f16_f32(v79), v135);
      result[4] = *(float32x2_t *)v13.i8;
      v137 = COERCE_DOUBLE(vzip1_s32(v136, (int32x2_t)vcvt_f16_f32(v12)));
      *(double *)&result[7] = v137;
      result = RB::Fill::MeshGradient::PatchBuffer::commit_patch((float32x2_t *)this, v20);
      v4 = (uint64_t)*v140;
      ++v11;
      if (v81 >= v140->u32[0] - 1)
        goto LABEL_72;
    }
  }
  return result;
}

float32x2_t *RB::Fill::MeshGradient::make_bezier_grid(float32x2_t *result, RB::Fill::MeshGradient::PatchBuffer *this, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  float32x2_t *v6;
  int v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  int8x16_t v15;
  uint64_t v16;
  uint64_t *v17;
  double *v18;
  double v19;
  float32x2_t *v20;
  float32x2_t *v21;
  float32x2_t v22;
  float32x2_t v23;
  float32x2_t v24;
  float32x2_t v25;
  float32x2_t v26;
  float32x2_t v27;
  float32x4_t v28;
  int32x4_t v29;
  int32x4_t v30;
  int8x16_t v31;
  int v32;
  uint64_t v34[2];
  int v35;

  v3 = *(_QWORD *)&result[1] + 16;
  v4 = (uint64_t)*result;
  v34[0] = v3 + 8 * result[3].i32[0] * RB::Fill::MeshGradient::points_per_elt[result[4].i8[7] & 0xF];
  v34[1] = v4;
  v32 = v4;
  v35 = v4;
  if (HIDWORD(v4) != 1)
  {
    v6 = result;
    v7 = 0;
    v8 = 0;
    v9 = v4;
    while ((_DWORD)v4 == 1)
    {
LABEL_8:
      ++v8;
      v9 += v32;
      v7 += v32;
      if (v8 >= HIDWORD(v4) - 1)
        return result;
    }
    v10 = 0;
    while (1)
    {
      result = (float32x2_t *)RB::Fill::MeshGradient::PatchBuffer::alloc_patch(this);
      if (!result)
        break;
      v16 = (uint64_t)result;
      v17 = (uint64_t *)(v3 + 40 * (v7 + v10));
      v11.i64[0] = *v17;
      v18 = (double *)(v3 + 40 * (v9 + v10));
      v12.i64[0] = *(uint64_t *)v18;
      v14.i64[0] = v17[3];
      v13.i64[0] = v17[4];
      v19 = v18[2];
      v15.i64[0] = (uint64_t)v18[3];
      v20 = (float32x2_t *)(v3 + 40 * (v7 + v10 + 1));
      v21 = (float32x2_t *)(v3 + 40 * (v9 + v10 + 1));
      v23 = *v20;
      v22 = v20[1];
      v24 = v20[4];
      v26 = v21[1];
      v25 = v21[2];
      v27 = *v21;
      *result = *(float32x2_t *)v11.f32;
      result[1] = *(float32x2_t *)v12.f32;
      result[2] = v23;
      result[3] = v27;
      *(float32x2_t *)v13.f32 = vsub_f32(*(float32x2_t *)v13.f32, *(float32x2_t *)v11.f32);
      *(float32x2_t *)v11.f32 = vsub_f32(*(float32x2_t *)v14.f32, *(float32x2_t *)v11.f32);
      *(float32x2_t *)v14.f32 = vsub_f32(*(float32x2_t *)v15.i8, *(float32x2_t *)v12.f32);
      *(float32x2_t *)v12.f32 = vsub_f32(*(float32x2_t *)&v19, *(float32x2_t *)v12.f32);
      v28 = (float32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v13), v12);
      v29 = vuzp1q_s32((int32x4_t)v28, (int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v11), v14));
      *(float32x2_t *)v12.f32 = vsub_f32(v22, v23);
      *(float32x2_t *)v28.f32 = vsub_f32(v24, v23);
      *(float32x2_t *)v14.f32 = vsub_f32(v25, v27);
      v30 = (int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v28), v14);
      *(float32x2_t *)v14.f32 = vsub_f32(v26, v27);
      v31 = (int8x16_t)vuzp1q_s32((int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v12), v14), v30);
      *(int32x4_t *)result[4].f32 = v29;
      *(int8x16_t *)result[6].f32 = v31;
      result = RB::Fill::MeshGradient::PatchBuffer::commit_patch((float32x2_t *)this, v16);
      v4 = (uint64_t)*v6;
      if (++v10 >= (unint64_t)(v6->u32[0] - 1))
        goto LABEL_8;
    }
  }
  return result;
}

float32x2_t *RB::Fill::MeshGradient::make_coons_patches(float32x2_t *result, RB::Fill::MeshGradient::PatchBuffer *this)
{
  __int32 v2;
  float32x2_t *v4;
  unint64_t v5;
  float32x2_t v6;
  uint64_t v7;
  float32x2_t *v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  float32x2_t v17;
  float32x2_t v18;
  float32x2_t v19;
  float32x2_t v20;
  float32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;

  v2 = result[3].i32[0];
  if (v2)
  {
    v4 = result;
    v5 = 0;
    v6 = result[1];
    v7 = *(_QWORD *)&v6 + 8 * v2 * RB::Fill::MeshGradient::points_per_elt[result[4].i8[7] & 0xF] + 24;
    v8 = (float32x2_t *)(*(_QWORD *)&v6 + 56);
    do
    {
      result = (float32x2_t *)RB::Fill::MeshGradient::PatchBuffer::alloc_patch(this);
      if (!result)
        break;
      *(float32x2_t *)v9.f32 = v8[-5];
      *(float32x2_t *)v10.f32 = v8[-4];
      *(float32x2_t *)v11.f32 = v8[-3];
      *(float32x2_t *)v12.f32 = v8[-2];
      *(float32x2_t *)v13.f32 = v8[-1];
      v14 = *v8;
      v15 = v8[1];
      v16 = v8[2];
      v17 = v8[3];
      v18 = v8[4];
      v19 = v8[5];
      v20 = v8[6];
      *result = *(float32x2_t *)v9.f32;
      result[1] = *(float32x2_t *)v12.f32;
      result[2] = v18;
      result[3] = v15;
      *(float32x2_t *)v10.f32 = vsub_f32(*(float32x2_t *)v10.f32, *(float32x2_t *)v9.f32);
      *(float32x2_t *)v9.f32 = vsub_f32(v20, *(float32x2_t *)v9.f32);
      *(float32x2_t *)v13.f32 = vsub_f32(*(float32x2_t *)v13.f32, *(float32x2_t *)v12.f32);
      *(float32x2_t *)v11.f32 = vsub_f32(*(float32x2_t *)v11.f32, *(float32x2_t *)v12.f32);
      v21 = (float32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v10), v11);
      v22 = vuzp1q_s32((int32x4_t)v21, (int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v9), v13));
      *(float32x2_t *)v21.f32 = vsub_f32(v19, v18);
      *(float32x2_t *)v11.f32 = vsub_f32(v17, v18);
      *(float32x2_t *)v12.f32 = vsub_f32(v16, v15);
      v23 = (int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v11), v12);
      *(float32x2_t *)v12.f32 = vsub_f32(v14, v15);
      *(int32x4_t *)result[4].f32 = v22;
      *(int32x4_t *)result[6].f32 = vuzp1q_s32((int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v21), v12), v23);
      v21.i64[0] = *(_QWORD *)(v7 + 8);
      v23.i64[0] = *(_QWORD *)(v7 + 16);
      *(_OWORD *)result[10].f32 = *(_OWORD *)(v7 - 8);
      result[12] = *(float32x2_t *)v23.i8;
      result[13] = *(float32x2_t *)v21.f32;
      result = RB::Fill::MeshGradient::PatchBuffer::commit_patch((float32x2_t *)this, (uint64_t)result);
      ++v5;
      v7 += 32;
      v8 += 12;
    }
    while (v5 < v4[3].u32[0]);
  }
  return result;
}

float32x2_t *RB::Fill::MeshGradient::make_tensor_patches(float32x2_t *result, RB::Fill::MeshGradient::PatchBuffer *this, uint64_t a3)
{
  __int32 v3;
  float32x2_t *v6;
  unint64_t v7;
  float32x2_t v8;
  double *v9;
  uint64_t *v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  int8x16_t v16;
  float32x4_t v17;
  float16x4_t *v18;
  float32x2_t v19;
  float32x2_t v20;
  float32x2_t v21;
  float32x2_t v22;
  float32x2_t v23;
  float32x2_t v24;
  float32x2_t v25;
  float32x2_t v26;
  float32x2_t v27;
  float32x4_t v28;
  float32x4_t v29;
  int32x4_t v30;
  float32x4_t v31;
  int32x4_t v32;
  int32x4_t v33;
  double v34;
  double v35;
  float16x4_t v36;
  float16x4_t v37;

  v3 = result[3].i32[0];
  if (v3)
  {
    v6 = result;
    v7 = 0;
    v8 = result[1];
    v9 = (double *)(*(_QWORD *)&v8
                  + 8 * v3 * RB::Fill::MeshGradient::points_per_elt[result[4].i8[7] & 0xF]
                  + 24);
    v10 = (uint64_t *)(*(_QWORD *)&v8 + 72);
    do
    {
      result = (float32x2_t *)RB::Fill::MeshGradient::PatchBuffer::alloc_patch(this);
      if (!result)
        break;
      v18 = (float16x4_t *)result;
      v12.i64[0] = *(v10 - 7);
      v13.i64[0] = *(v10 - 6);
      v14.i64[0] = *(v10 - 5);
      v11.i64[0] = *(v10 - 4);
      v15.i64[0] = *(v10 - 3);
      v16.i64[0] = *(v10 - 2);
      v19 = (float32x2_t)*(v10 - 1);
      v17.i64[0] = *v10;
      v20 = (float32x2_t)v10[1];
      v21 = (float32x2_t)v10[2];
      v22 = (float32x2_t)v10[3];
      v23 = (float32x2_t)v10[4];
      v24 = (float32x2_t)v10[5];
      v25 = (float32x2_t)v10[6];
      v26 = (float32x2_t)v10[7];
      v27 = (float32x2_t)v10[8];
      *result = *(float32x2_t *)v12.f32;
      result[1] = *(float32x2_t *)v11.f32;
      result[2] = v24;
      result[3] = v27;
      *(float32x2_t *)v13.f32 = vsub_f32(*(float32x2_t *)v13.f32, *(float32x2_t *)v12.f32);
      *(float32x2_t *)v15.f32 = vsub_f32(*(float32x2_t *)v15.f32, *(float32x2_t *)v12.f32);
      *(float32x2_t *)v17.f32 = vsub_f32(*(float32x2_t *)v17.f32, *(float32x2_t *)v11.f32);
      v28 = (float32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v15), v17);
      *(float32x2_t *)v14.f32 = vsub_f32(*(float32x2_t *)v14.f32, *(float32x2_t *)v11.f32);
      v29 = (float32x4_t)vuzp1q_s32((int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v13), v14), (int32x4_t)v28);
      *(float32x2_t *)v14.f32 = vsub_f32(v20, v24);
      *(float32x2_t *)v28.f32 = vsub_f32(v25, v24);
      *(float32x2_t *)v17.f32 = vsub_f32(v26, v27);
      v30 = (int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v28), v17);
      *(float32x2_t *)v17.f32 = vsub_f32(v23, v27);
      v31 = (float32x4_t)vuzp1q_s32((int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v14), v17), v30);
      *(float32x4_t *)result[4].f32 = v29;
      *(float32x4_t *)result[6].f32 = v31;
      *(float32x2_t *)v12.f32 = vsub_f32(*(float32x2_t *)v16.i8, *(float32x2_t *)v12.f32);
      *(float32x2_t *)v29.f32 = vsub_f32(v21, v24);
      *(float32x2_t *)v31.f32 = vsub_f32(v22, v27);
      v32 = (int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v29), v31);
      *(float32x2_t *)v11.f32 = vsub_f32(v19, *(float32x2_t *)v11.f32);
      v33 = (int32x4_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(v12), v11);
      *(int32x4_t *)result[8].f32 = vuzp1q_s32(v33, v32);
      v34 = *(v9 - 1);
      v35 = *v9;
      v37 = (float16x4_t)v9[1];
      v36 = (float16x4_t)v9[2];
      *(double *)&result[10] = v34;
      if (*(_BYTE *)(a3 + 7))
        *(float16x4_t *)&v34 = RB::Fill::MeshGradient::ColorConversion::convert(a3, (float16x4_t *)&result[10], v34, (int8x16_t)v33, *(double *)v32.i64, *(double *)v31.i64, *(double *)v30.i64, v16);
      *(double *)&v18[11] = v35;
      if (*(_BYTE *)(a3 + 7))
        *(float16x4_t *)&v34 = RB::Fill::MeshGradient::ColorConversion::convert(a3, v18 + 11, v34, (int8x16_t)v33, *(double *)v32.i64, *(double *)v31.i64, *(double *)v30.i64, v16);
      v18[12] = v37;
      if (*(_BYTE *)(a3 + 7))
        *(float16x4_t *)&v34 = RB::Fill::MeshGradient::ColorConversion::convert(a3, v18 + 12, v34, (int8x16_t)v33, *(double *)v32.i64, *(double *)v31.i64, *(double *)v30.i64, v16);
      v18[13] = v36;
      if (*(_BYTE *)(a3 + 7))
        RB::Fill::MeshGradient::ColorConversion::convert(a3, v18 + 13, v34, (int8x16_t)v33, *(double *)v32.i64, *(double *)v31.i64, *(double *)v30.i64, v16);
      result = RB::Fill::MeshGradient::PatchBuffer::commit_patch((float32x2_t *)this, (uint64_t)v18);
      ++v7;
      v9 += 4;
      v10 += 16;
    }
    while (v7 < v6[3].u32[0]);
  }
  return result;
}

void RB::Fill::`anonymous namespace'::make_grid_color(float16x4_t *a1, uint64_t *a2, unsigned int a3, unsigned int a4, uint64_t a5, int a6, double a7, int8x16_t a8, double a9, double a10, double a11, int8x16_t a12)
{
  uint64_t v18;
  int v19;
  float16x4_t v20;
  int v21;
  unsigned int v22;
  float16x4_t v23;
  int v24;
  unsigned int v25;
  int v26;
  float16x4_t v27;
  int v28;
  float16x4_t v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  float16x4_t v33;
  unsigned int v34;
  float16x4_t v35;
  float16x4_t v36;
  float16x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  int8x16_t v44;
  int8x16_t v45;
  float32x4_t v46;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  double v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  int8x16_t v69;
  int8x16_t v70;
  int8x16_t v71;
  float32x4_t v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  float16x4_t v82;
  double v83;
  unsigned int v84;
  unsigned int v85;
  unsigned int v86;
  unsigned int v87;
  float32x4_t v88;
  float16x4_t v89;
  float32x4_t v90;
  float32x4_t v91;
  float32x4_t v92;
  float32x4_t v93;
  int8x16_t v94;
  int8x16_t v95;
  float32x4_t v96;
  float32x4_t v97;
  float32x4_t v98;
  float32x4_t v99;
  float32x4_t v100;
  float32x4_t v101;
  float32x4_t v102;
  float32x4_t v103;
  float32x4_t v104;
  float32x4_t v105;
  float32x4_t v106;
  float32x4_t v107;
  float32x4_t v108;
  int8x16_t v109;
  int8x16_t v110;
  int8x16_t v111;
  float32x4_t v112;
  float32x4_t v113;
  float32x4_t v114;
  float32x4_t v115;
  float32x4_t v116;
  float32x4_t v117;
  float32x4_t v118;
  float32x4_t v119;
  float32x4_t v120;
  float32x4_t v121;
  float32x4_t v122;
  float32x4_t v123;
  float16x4_t v124;

  v18 = *a2;
  v19 = *((_DWORD *)a2 + 4);
  v20 = *(float16x4_t *)(*a2 + 8 * (v19 * a4 + a3));
  v124 = v20;
  if (!*(_BYTE *)(a5 + 7))
  {
    v22 = a3 + 1;
    v23 = *(float16x4_t *)(v18 + 8 * (v19 * a4 + a3 + 1));
    goto LABEL_7;
  }
  *(float16x4_t *)&a7 = RB::Fill::MeshGradient::ColorConversion::convert(a5, &v124, a7, a8, a9, a10, a11, a12);
  v20 = v124;
  v18 = *a2;
  v19 = *((_DWORD *)a2 + 4);
  v21 = *(unsigned __int8 *)(a5 + 7);
  v22 = a3 + 1;
  v23 = *(float16x4_t *)(*a2 + 8 * (a3 + 1 + v19 * a4));
  v124 = v23;
  if (!v21)
  {
LABEL_7:
    v25 = a4 + 1;
    v26 = v19 * (a4 + 1);
    v27 = *(float16x4_t *)(v18 + 8 * (v26 + a3));
    goto LABEL_8;
  }
  *(float16x4_t *)&a7 = RB::Fill::MeshGradient::ColorConversion::convert(a5, &v124, a7, a8, a9, a10, a11, a12);
  v23 = v124;
  v18 = *a2;
  v24 = *(unsigned __int8 *)(a5 + 7);
  v25 = a4 + 1;
  v26 = *((_DWORD *)a2 + 4) * (a4 + 1);
  v27 = *(float16x4_t *)(*a2 + 8 * (v26 + a3));
  v124 = v27;
  if (!v24)
  {
LABEL_8:
    v29 = *(float16x4_t *)(v18 + 8 * (v26 + v22));
    goto LABEL_9;
  }
  *(float16x4_t *)&a7 = RB::Fill::MeshGradient::ColorConversion::convert(a5, &v124, a7, a8, a9, a10, a11, a12);
  v27 = v124;
  v28 = *(unsigned __int8 *)(a5 + 7);
  v29 = *(float16x4_t *)(*a2 + 8 * (v22 + *((_DWORD *)a2 + 4) * v25));
  v124 = v29;
  if (v28)
  {
    *(float16x4_t *)&a7 = RB::Fill::MeshGradient::ColorConversion::convert(a5, &v124, a7, a8, a9, a10, a11, a12);
    v29 = v124;
  }
LABEL_9:
  a1[10] = v20;
  a1[11] = v27;
  a1[12] = v23;
  a1[13] = v29;
  if (a6)
  {
    v30 = a3 - 1;
    v31 = *((_DWORD *)a2 + 2);
    v32 = *((_DWORD *)a2 + 3);
    if (v31 <= a3 - 1 || v32 <= a4)
    {
      v33 = v20;
    }
    else
    {
      v33 = *(float16x4_t *)(*a2 + 8 * (v30 + *((_DWORD *)a2 + 4) * a4));
      v124 = v33;
      if (*(_BYTE *)(a5 + 7))
      {
        *(float16x4_t *)&a7 = RB::Fill::MeshGradient::ColorConversion::convert(a5, &v124, a7, a8, a9, a10, a11, a12);
        v33 = v124;
        v31 = *((_DWORD *)a2 + 2);
        v32 = *((_DWORD *)a2 + 3);
      }
    }
    v34 = a3 + 2;
    if (v31 <= a3 + 2 || v32 <= a4)
    {
      v35 = v23;
    }
    else
    {
      v35 = *(float16x4_t *)(*a2 + 8 * (v34 + *((_DWORD *)a2 + 4) * a4));
      v124 = v35;
      if (*(_BYTE *)(a5 + 7))
      {
        *(float16x4_t *)&a7 = RB::Fill::MeshGradient::ColorConversion::convert(a5, &v124, a7, a8, a9, a10, a11, a12);
        v35 = v124;
        v31 = *((_DWORD *)a2 + 2);
        v32 = *((_DWORD *)a2 + 3);
      }
    }
    if (v31 <= v30 || v32 <= v25)
    {
      v36 = v27;
    }
    else
    {
      v36 = *(float16x4_t *)(*a2 + 8 * (v30 + *((_DWORD *)a2 + 4) * v25));
      v124 = v36;
      if (*(_BYTE *)(a5 + 7))
      {
        RB::Fill::MeshGradient::ColorConversion::convert(a5, &v124, a7, a8, a9, a10, a11, a12);
        v36 = v124;
        v31 = *((_DWORD *)a2 + 2);
        v32 = *((_DWORD *)a2 + 3);
      }
    }
    v37 = v29;
    if (v31 > v34)
    {
      v37 = v29;
      if (v32 > v25)
      {
        v37 = *(float16x4_t *)(*a2 + 8 * (v34 + *((_DWORD *)a2 + 4) * v25));
        v124 = v37;
        if (*(_BYTE *)(a5 + 7))
        {
          RB::Fill::MeshGradient::ColorConversion::convert(a5, &v124, *(double *)&v37, a8, a9, a10, a11, a12);
          v37 = v124;
        }
      }
    }
    v38 = vcvtq_f32_f16(v20);
    v39 = vsubq_f32(v38, vcvtq_f32_f16(v33));
    v40 = vcvtq_f32_f16(v23);
    v41 = vsubq_f32(v40, v38);
    v42 = vsubq_f32(vcvtq_f32_f16(v35), v40);
    v43.i64[0] = 0x3F0000003F000000;
    v43.i64[1] = 0x3F0000003F000000;
    v44 = (int8x16_t)vmulq_f32(vaddq_f32(v42, v41), v43);
    v45 = (int8x16_t)vcltzq_f32(v41);
    v46 = (float32x4_t)vbicq_s8((int8x16_t)vmulq_f32(vaddq_f32(v39, v41), v43), veorq_s8((int8x16_t)vcltzq_f32(v39), v45));
    __asm { FMOV            V18.4S, #3.0 }
    v52 = vmulq_f32(v39, _Q18);
    v53 = (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v46, v52), (int8x16_t)v52, (int8x16_t)v46);
    v54 = vmulq_f32(v41, _Q18);
    v55 = (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v53, v54), (int8x16_t)v54, (int8x16_t)v53);
    v56 = (float32x4_t)vbicq_s8(v44, veorq_s8((int8x16_t)vcltzq_f32(v42), v45));
    v57 = (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v56, v54), (int8x16_t)v54, (int8x16_t)v56);
    v58 = vmulq_f32(v42, _Q18);
    v59 = (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v57, v58), (int8x16_t)v58, (int8x16_t)v57);
    v60 = (float32x4_t)vdupq_n_s32(0x3EAAAAABu);
    v120 = v38;
    v61 = vmlaq_f32(v38, v60, v55);
    v122 = v40;
    v63 = vmlsq_f32(v40, v60, v59);
    v62 = COERCE_DOUBLE(vcvt_f16_f32(v61));
    *(float16x4_t *)v63.f32 = vcvt_f16_f32(v63);
    v64 = vcvtq_f32_f16(v27);
    v65 = vsubq_f32(v64, vcvtq_f32_f16(v36));
    v66 = vcvtq_f32_f16(v29);
    v67 = vsubq_f32(v66, v64);
    v68 = vsubq_f32(vcvtq_f32_f16(v37), v66);
    v69 = (int8x16_t)vmulq_f32(vaddq_f32(v65, v67), v43);
    v70 = (int8x16_t)vmulq_f32(vaddq_f32(v68, v67), v43);
    v71 = (int8x16_t)vcltzq_f32(v67);
    v72 = (float32x4_t)vbicq_s8(v69, veorq_s8((int8x16_t)vcltzq_f32(v65), v71));
    v73 = vmulq_f32(v65, _Q18);
    v74 = (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v72, v73), (int8x16_t)v73, (int8x16_t)v72);
    v75 = vmulq_f32(v67, _Q18);
    v76 = (float32x4_t)vbicq_s8(v70, veorq_s8((int8x16_t)vcltzq_f32(v68), v71));
    v77 = (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v76, v75), (int8x16_t)v75, (int8x16_t)v76);
    v121 = _Q18;
    v78 = vmulq_f32(v68, _Q18);
    v79 = (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v77, v78), (int8x16_t)v78, (int8x16_t)v77);
    v119 = v64;
    v80 = vmlaq_f32(v64, v60, (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v74, v75), (int8x16_t)v75, (int8x16_t)v74));
    v81 = vmlsq_f32(v66, v60, v79);
    v82 = vcvt_f16_f32(v80);
    v83 = COERCE_DOUBLE(vcvt_f16_f32(v81));
    *(double *)&a1[16] = v62;
    a1[17] = v82;
    a1[18] = *(float16x4_t *)v63.f32;
    *(double *)&a1[19] = v83;
    v84 = a4 - 1;
    v85 = *((_DWORD *)a2 + 2);
    v86 = *((_DWORD *)a2 + 3);
    v123 = v66;
    if (v85 > a3 && v86 > v84)
    {
      v20 = *(float16x4_t *)(*a2 + 8 * (a3 + *((_DWORD *)a2 + 4) * v84));
      v124 = v20;
      if (*(_BYTE *)(a5 + 7))
      {
        v82 = RB::Fill::MeshGradient::ColorConversion::convert(a5, &v124, *(double *)&v82, (int8x16_t)v63, v62, v83, *(double *)v81.i64, (int8x16_t)v80);
        v66 = v123;
        v20 = v124;
        v85 = *((_DWORD *)a2 + 2);
        v86 = *((_DWORD *)a2 + 3);
      }
    }
    if (v85 > v22 && v86 > v84)
    {
      v23 = *(float16x4_t *)(*a2 + 8 * (v22 + *((_DWORD *)a2 + 4) * v84));
      v124 = v23;
      if (*(_BYTE *)(a5 + 7))
      {
        v82 = RB::Fill::MeshGradient::ColorConversion::convert(a5, &v124, *(double *)&v82, (int8x16_t)v63, v62, v83, *(double *)v81.i64, (int8x16_t)v80);
        v66 = v123;
        v23 = v124;
        v85 = *((_DWORD *)a2 + 2);
        v86 = *((_DWORD *)a2 + 3);
      }
    }
    v87 = a4 + 2;
    if (v85 > a3 && v86 > v87)
    {
      v27 = *(float16x4_t *)(*a2 + 8 * (a3 + *((_DWORD *)a2 + 4) * v87));
      v124 = v27;
      if (*(_BYTE *)(a5 + 7))
      {
        RB::Fill::MeshGradient::ColorConversion::convert(a5, &v124, *(double *)&v82, (int8x16_t)v63, v62, v83, *(double *)v81.i64, (int8x16_t)v80);
        v66 = v123;
        v27 = v124;
        v85 = *((_DWORD *)a2 + 2);
        v86 = *((_DWORD *)a2 + 3);
      }
    }
    v88 = v66;
    if (v85 > v22)
    {
      v88 = v66;
      if (v86 > v87)
      {
        v89 = *(float16x4_t *)(*a2 + 8 * (v22 + *((_DWORD *)a2 + 4) * v87));
        v124 = v89;
        if (*(_BYTE *)(a5 + 7))
        {
          RB::Fill::MeshGradient::ColorConversion::convert(a5, &v124, *(double *)&v89, (int8x16_t)v63, v62, v83, *(double *)v81.i64, (int8x16_t)v80);
          v66 = v123;
          v89 = v124;
        }
        v88 = vcvtq_f32_f16(v89);
      }
    }
    v90 = vsubq_f32(v120, vcvtq_f32_f16(v20));
    v91 = vsubq_f32(v119, v120);
    v92 = vsubq_f32(vcvtq_f32_f16(v27), v119);
    v93.i64[0] = 0x3F0000003F000000;
    v93.i64[1] = 0x3F0000003F000000;
    v94 = (int8x16_t)vmulq_f32(vaddq_f32(v92, v91), v93);
    v95 = (int8x16_t)vcltzq_f32(v91);
    v96 = (float32x4_t)vbicq_s8((int8x16_t)vmulq_f32(vaddq_f32(v90, v91), v93), veorq_s8((int8x16_t)vcltzq_f32(v90), v95));
    v97 = vmulq_f32(v90, v121);
    v98 = (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v96, v97), (int8x16_t)v97, (int8x16_t)v96);
    v99 = vmulq_f32(v91, v121);
    v100 = (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v98, v99), (int8x16_t)v99, (int8x16_t)v98);
    v101 = (float32x4_t)vbicq_s8(v94, veorq_s8((int8x16_t)vcltzq_f32(v92), v95));
    v102 = (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v101, v99), (int8x16_t)v99, (int8x16_t)v101);
    v103 = vmulq_f32(v92, v121);
    v104 = (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v102, v103), (int8x16_t)v103, (int8x16_t)v102);
    v105 = (float32x4_t)vdupq_n_s32(0x3EAAAAABu);
    v106 = vsubq_f32(v122, vcvtq_f32_f16(v23));
    v107 = vsubq_f32(v66, v122);
    v108 = vsubq_f32(v88, v66);
    v109 = (int8x16_t)vmulq_f32(vaddq_f32(v106, v107), v93);
    v110 = (int8x16_t)vmulq_f32(vaddq_f32(v108, v107), v93);
    v111 = (int8x16_t)vcltzq_f32(v107);
    v112 = (float32x4_t)vbicq_s8(v109, veorq_s8((int8x16_t)vcltzq_f32(v106), v111));
    v113 = vmulq_f32(v106, v121);
    v114 = (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v112, v113), (int8x16_t)v113, (int8x16_t)v112);
    v115 = vmulq_f32(v107, v121);
    v116 = (float32x4_t)vbicq_s8(v110, veorq_s8((int8x16_t)vcltzq_f32(v108), v111));
    v117 = (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v116, v115), (int8x16_t)v115, (int8x16_t)v116);
    v118 = vmulq_f32(v108, v121);
    a1[14] = vcvt_f16_f32(vmlaq_f32(v120, v105, v100));
    a1[15] = vcvt_f16_f32(vmlsq_f32(v119, v105, v104));
    a1[20] = vcvt_f16_f32(vmlaq_f32(v122, v105, (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v114, v115), (int8x16_t)v115, (int8x16_t)v114)));
    a1[21] = vcvt_f16_f32(vmlsq_f32(v66, v105, (float32x4_t)vbslq_s8((int8x16_t)vcagtq_f32(v117, v118), (int8x16_t)v118, (int8x16_t)v117)));
  }
}

uint64_t RB::Fill::MeshGradient::set_fill_state(uint64_t this, RB::RenderState *a2, const RB::RenderPass *a3, float a4, char a5)
{
  unsigned int v5;
  int v6;
  __int16 v7;
  int v8;
  int v9;
  __int16 v10;
  int v11;
  __int16 v12;

  v5 = *(unsigned __int8 *)(this + 39);
  v6 = v5 & 0xF;
  if ((v6 - 1) < 2)
  {
    v8 = (*(unsigned __int8 *)(this + 38) >> 1) & 8;
    if ((a5 & 1) != 0)
      goto LABEL_22;
  }
  else
  {
    if (v6 == 6)
      v7 = 16;
    else
      v7 = 0;
    if (v6 == 5)
      LOWORD(v8) = 24;
    else
      LOWORD(v8) = v7;
    if ((a5 & 1) != 0)
      goto LABEL_22;
  }
  v9 = *(_BYTE *)(this + 38) & 0xF;
  switch(v9)
  {
    case 1:
      goto LABEL_16;
    case 3:
      LOWORD(v8) = v8 | 4;
LABEL_16:
      v10 = *((_BYTE *)a3 + 124) & 1;
      goto LABEL_17;
    case 2:
      v10 = (*((_BYTE *)a3 + 124) & 1) == 0;
LABEL_17:
      LOWORD(v8) = v8 | v10;
      break;
  }
  v11 = (v5 >> 3) & 2;
  if (a4 != 1.0)
    LOWORD(v11) = 0;
  v12 = v8 & 0xFFFD | v11;
  if ((v8 & 1) != 0)
    LOWORD(v8) = v12;
LABEL_22:
  *(_DWORD *)a2 = *(_DWORD *)a2 & 0x3FFFFF | ((unsigned __int16)v8 << 22);
  return this;
}

void RB::Fill::MeshGradient::fill(int32x2_t *a1, int8x8_t *a2, int32x2_t a3, int32x2_t a4)
{
  double v5;
  uint32x2_t v8;
  int8x8_t v9;
  float32x2_t v10;
  CGFloat y;
  CGFloat height;
  double v13;
  int32x4_t v14;
  uint32x2_t v15;
  double v20;
  int8x16_t v21;
  float64x2_t v22;
  float64x2_t v23;
  double v24;
  int8x16_t v25;
  int v26;
  int v27;
  int v28;
  __int8 v29;
  __int8 v30;
  int v31;
  BOOL v33;
  int v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  size_t v39;
  size_t v40;
  char *v41;
  __int128 v42;
  unsigned int v43;
  int32x2_t v44;
  __int32 v45;
  unsigned int v46;
  __int32 v47;
  unsigned int v48;
  unsigned int v49;
  int v50;
  double v51;
  int8x16_t v52;
  float64x2_t v53;
  float64x2_t v54;
  double v55;
  int8x16_t v56;
  __int128 *v57;
  __int128 v58;
  float v59;
  float v60;
  float v61;
  unint64_t v62;
  uint64_t v63;
  float32x2_t v64;
  float16x4_t *v65;
  float16x4_t v66;
  float32x4_t v67;
  float16x4_t v68;
  float16x4_t v69;
  float16x4_t v70;
  float16x4_t v71;
  float32x4_t v72;
  float32x4_t v73;
  float32x4_t v74;
  int v75;
  float32x4_t v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;
  int v84;
  float32x2_t v85;
  float32x2_t v86;
  float32x2_t v87;
  float32x2_t v88;
  float16x4_t v89;
  float32x4_t v90;
  float16x4_t v91;
  float32x4_t v92;
  float16x4_t v93;
  float32x4_t v94;
  float16x4_t v95;
  float32x4_t v96;
  float64x2_t *v97;
  float64x2_t v98;
  float64x2_t v99;
  float64x2_t v100;
  float64x2_t v101;
  float64x2_t v102;
  uint32x2_t v103;
  int v104;
  __int16 v105;
  _BOOL4 v106;
  unsigned __int32 v107;
  int v108;
  CGImage *Image;
  uint64_t v110;
  unint64_t v111;
  float32x4_t v112;
  float32x4_t v113;
  float16x4_t v114;
  uint64_t v115;
  float16x4_t v116;
  float16x4_t v117;
  float16x4_t v118;
  float16x4_t v119;
  float16x4_t v120;
  float32x2_t v121;
  uint64_t v122;
  __int16 v123;
  uint64_t v124;
  __int16 v125;
  uint64_t v126;
  __int16 v127;
  float16x4_t v128;
  __int16 v129;
  float16x4_t v130;
  float16x4_t v131;
  float16x4_t v132;
  float16x4_t v133;
  float16x4_t v134;
  float16x4_t v135;
  float16x4_t v136;
  float16x4_t v137;
  float32x2_t v138;
  float32x2_t v139;
  float32x2_t v140;
  float32x2_t v141;
  float32x2_t v142;
  float32x2_t v143;
  float32x2_t v144;
  float32x2_t v145;
  float16x4_t v146;
  float16x4_t v147;
  float16x4_t v148;
  float16x4_t v149;
  float16x4_t v150;
  float16x4_t v151;
  float16x4_t v152;
  float16x4_t v153;
  float16x4_t v154;
  float16x4_t v155;
  float16x4_t v156;
  float16x4_t v157;
  float16x4_t v158;
  float16x4_t v159;
  float16x4_t v160;
  float16x4_t v161;
  float32x2_t v162;
  float32x2_t v163;
  float32x2_t v164;
  float32x2_t v165;
  float32x2_t v166;
  float32x2_t v167;
  float32x2_t v168;
  float32x2_t v169;
  float32x2_t v170;
  float32x2_t v171;
  float32x2_t v172;
  float32x2_t v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  float32x2_t v177;
  char v178;
  float32x2_t v179;
  float v180;
  float v181;
  unsigned int v182;
  char v183;
  char *v184;
  unint64_t v185;
  uint64_t v186[3];
  int v187;
  char v188;
  unsigned __int8 v189;
  char v190;
  BOOL v191;
  CGContext *v192;
  float32x2_t v193;
  float32x2_t v194;
  _BYTE v195[80];
  _QWORD v196[114];
  CGRect ClipBoundingBox;
  CGRect v198;

  v5 = *(double *)&a3;
  a3.i32[0] = 0;
  v196[112] = *MEMORY[0x24BDAC8D0];
  v8 = (uint32x2_t)vceq_s32(a4, (int32x2_t)0x8000000080000000);
  v9 = (int8x8_t)vdup_lane_s32(vcgt_s32(a3, (int32x2_t)vpmin_u32(v8, v8)), 0);
  v10 = (float32x2_t)vbsl_s8(v9, (int8x8_t)vdup_n_s32(0x7F7FFFFFu), (int8x8_t)vcvt_f32_s32(a4));
  v121 = (float32x2_t)vbsl_s8(v9, (int8x8_t)0x100000001000000, (int8x8_t)vcvt_f32_s32(*(int32x2_t *)&v5));
  v193 = v121;
  v194 = v10;
  ClipBoundingBox = CGContextGetClipBoundingBox((CGContextRef)*(_QWORD *)a2);
  y = ClipBoundingBox.origin.y;
  height = ClipBoundingBox.size.height;
  RB::Rect::intersect(&v193, vcvt_f32_f64((float64x2_t)ClipBoundingBox.origin), vcvt_f32_f64((float64x2_t)ClipBoundingBox.size), ClipBoundingBox.size.width, ClipBoundingBox.size.height, v13, v14);
  v15 = (uint32x2_t)vclez_f32(v194);
  if ((vpmax_u32(v15, v15).u32[0] & 0x80000000) != 0)
    return;
  RB::CGContext::begin_bitmap(a2, &v193, 2, 0, 0, 0, &v192);
  if (!v192)
    return;
  __asm { FMOV            V0.2S, #1.0 }
  RB::CGContext::CGContext(v196, v192, a2[1].u8[0], _D0);
  RB::Fill::Color::fill((__int16 *)&a1[3] + 2, (uint64_t)v196, v5);
  RB::CGContext::Raster::Raster((RB::CGContext::Raster *)v195, (RB::CGContext *)v196);
  v26 = a2[1].u8[0];
  v27 = v26;
  if (a1[4].i8[5])
    v27 = a1[4].u8[4];
  v28 = 0;
  v29 = a1[4].i8[7];
  v30 = a1[4].i8[6];
  v187 = 1065353216;
  v188 = v27;
  v189 = v26;
  v190 = 0;
  v31 = v30 & 0xF;
  if (v31 == 1)
    goto LABEL_10;
  if (v31 == 3)
  {
    v28 = 1;
    v190 = 1;
LABEL_10:
    v26 &= 0xFEu;
    goto LABEL_11;
  }
  if (v31 != 2)
    goto LABEL_12;
  v28 = 0;
  v26 |= 1u;
LABEL_11:
  v189 = v26;
LABEL_12:
  v33 = v26 != v27 || (v29 & 0x10) == 0 || v28 != 0;
  v191 = v33;
  v186[0] = (uint64_t)a1;
  v186[1] = (uint64_t)v195;
  v186[2] = (uint64_t)&v187;
  v34 = v29 & 0xF;
  if ((v34 - 1) >= 4)
  {
    if (v34 == 6)
    {
      if (a1[3].i32[0])
      {
        v107 = 0;
        v108 = 2;
        do
        {
          *(float32x2_t *)&v20 = RB::Fill::MeshGradient::fill(RB::CGContext &,RB::Bounds)const::$_0::operator()(v186, v108 - 2, v108 - 1, v108, v20, v21, v22, v23, v24, v25);
          ++v107;
          v108 += 3;
        }
        while (v107 < a1[3].i32[0]);
      }
    }
    else if (v34 == 5 && a1->i32[1] != 1)
    {
      v43 = 0;
      v44 = *a1;
      do
      {
        v45 = v44.i32[0];
        if (v44.i32[0] != 1)
        {
          v46 = 0;
          do
          {
            v47 = v44.i32[1];
            v48 = v46 + v43 * v44.i32[1];
            v49 = v48 + 1;
            v50 = v48 + v45;
            *(float32x2_t *)&v51 = RB::Fill::MeshGradient::fill(RB::CGContext &,RB::Bounds)const::$_0::operator()(v186, v48, v48 + 1, v48 + v45, *(double *)&v44, v21, v22, v23, v24, v25);
            RB::Fill::MeshGradient::fill(RB::CGContext &,RB::Bounds)const::$_0::operator()(v186, v49, v45 + v46++ + v43 * v47 + 1, v50, v51, v52, v53, v54, v55, v56);
            v44 = *a1;
            v45 = (__int32)*a1;
          }
          while (v46 < v45 - 1);
        }
        ++v43;
      }
      while (v43 < v44.i32[1] - 1);
    }
    goto LABEL_67;
  }
  v35 = RB::Fill::MeshGradient::patches_info(a1);
  v37 = v36;
  v38 = HIDWORD(v35);
  v39 = v35 * (unint64_t)HIDWORD(v35);
  v111 = v39;
  if (v39 <= 0x1000)
  {
    MEMORY[0x24BDAC7A8](v39, v36);
    v41 = (char *)&v110 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v41, v40);
    goto LABEL_33;
  }
  v41 = (char *)malloc_type_malloc(v39, 0x8CB3090EuLL);
  if (v41)
  {
LABEL_33:
    v57 = (__int128 *)a1[2];
    if (v57)
    {
      v58 = *v57;
      v42 = v57[2];
      v175 = v57[1];
      v176 = v42;
      v174 = v58;
    }
    else
    {
      v174 = xmmword_209BD5290;
      v175 = xmmword_209BD52A0;
      v176 = 0uLL;
    }
    RB::Fill::MeshGradient::PatchBuffer::PatchBuffer(&v177, v38, v37, (float64x2_t *)&v174, HIDWORD(v37) & 0xFFFFFFFB, *(int32x2_t *)&v5, a4, *(int32x2_t *)&v42);
    v183 = 1;
    v184 = v41;
    v185 = v111;
    RB::Fill::MeshGradient::make_patches((float32x2_t *)a1, (RB::Fill::MeshGradient::PatchBuffer *)&v177, (uint64_t)&v187);
    v59 = fmaxf(sqrtf((float)(v181 * 4.0) * sqrtf(vaddv_f32(vmul_f32(v179, v179)))), 1.0);
    v60 = sqrtf(v180) * 0.125;
    if (v59 < v60)
      v59 = v60;
    v61 = ceilf(log2f(v59));
    if (v61 > 7.0)
      v61 = 7.0;
    if (v182)
    {
      v62 = 0;
      v63 = (1 << v61);
      v64 = vadd_f32(v10, v121);
      v112 = (float32x4_t)vdupq_n_s32(0x3F2AA000u);
      v113 = (float32x4_t)vdupq_n_s32(0x3EAAA000u);
      do
      {
        v65 = (float16x4_t *)&v41[v38 * v62];
        v120 = v65[3];
        v66 = (float16x4_t)vcvtq_f32_f16(v65[4]).u64[0];
        v66.i32[0] = v65[4].i32[1];
        v67 = vcvtq_f32_f16(v66);
        v68 = v65[6];
        v67.i32[0] = v65[6].i32[1];
        v118 = *(float16x4_t *)v67.f32;
        v114 = v65[7];
        v67.i32[1] = v114.i32[1];
        v67.i32[0] = v65[7].i32[1];
        v115 = v67.i64[0];
        v116 = v68;
        v117 = v65[9];
        v67.i32[1] = v117.i32[1];
        v67.i32[0] = v65[9].i32[1];
        v119 = *(float16x4_t *)v67.f32;
        _ZN2RB13CubicIteratorIDv2_fEC1ES1_S1_S1_S1_i(&v174, v63);
        _ZN2RB13CubicIteratorIDv2_fEC1ES1_S1_S1_S1_i(&v170, v63);
        _ZN2RB13CubicIteratorIDv2_fEC1ES1_S1_S1_S1_i(&v166, v63);
        _ZN2RB13CubicIteratorIDv2_fEC1ES1_S1_S1_S1_i(&v162, v63);
        v69 = v65[10];
        v70 = v65[12];
        v71 = v65[13];
        v119 = v70;
        v117 = v71;
        if ((v178 & 2) != 0)
        {
          v120 = v65[16];
          v118 = v65[20];
          v116 = v65[21];
        }
        else
        {
          v72 = vcvtq_f32_f16(v69);
          v73 = vcvtq_f32_f16(v70);
          v74 = vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(vcvtq_f32_f16(v71), v73)));
          v118 = vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(v74, v113))), v73));
          v116 = vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(v74, v112))), v73));
          v120 = vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(v73, v72))), v113))), v72));
        }
        _ZN2RB13CubicIteratorIDv4_DF16_EC1ES1_S1_S1_S1_i(&v158, v63);
        _ZN2RB13CubicIteratorIDv4_DF16_EC1ES1_S1_S1_S1_i(&v154, v63);
        _ZN2RB13CubicIteratorIDv4_DF16_EC1ES1_S1_S1_S1_i(&v150, v63);
        _ZN2RB13CubicIteratorIDv4_DF16_EC1ES1_S1_S1_S1_i(&v146, v63);
        v75 = 0;
        do
        {
          _ZN2RB13CubicIteratorIDv2_fEC1ES1_S1_S1_S1_i(&v142, v63);
          *(float32x2_t *)&v174 = vadd_f32(*(float32x2_t *)&v174, *(float32x2_t *)((char *)&v174 + 8));
          *((float32x2_t *)&v174 + 1) = vadd_f32(*(float32x2_t *)&v175, *(float32x2_t *)((char *)&v174 + 8));
          *(float32x2_t *)&v175 = vadd_f32(*(float32x2_t *)((char *)&v175 + 8), *(float32x2_t *)&v175);
          v170 = vadd_f32(v170, v171);
          v171 = vadd_f32(v172, v171);
          v172 = vadd_f32(v173, v172);
          v166 = vadd_f32(v166, v167);
          v167 = vadd_f32(v168, v167);
          v168 = vadd_f32(v169, v168);
          v162 = vadd_f32(v162, v163);
          v163 = vadd_f32(v164, v163);
          v164 = vadd_f32(v165, v164);
          _ZN2RB13CubicIteratorIDv2_fEC1ES1_S1_S1_S1_i(&v138, v63);
          _ZN2RB13CubicIteratorIDv4_DF16_EC1ES1_S1_S1_S1_i(&v134, v63);
          v76 = vcvtq_f32_f16(v159);
          v77 = vcvtq_f32_f16(v160);
          v158 = vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(v158), v76));
          v159 = vcvt_f16_f32(vaddq_f32(v77, v76));
          v160 = vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(v161), v77));
          v78 = vcvtq_f32_f16(v155);
          v79 = vcvtq_f32_f16(v156);
          v154 = vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(v154), v78));
          v155 = vcvt_f16_f32(vaddq_f32(v79, v78));
          v156 = vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(v157), v79));
          v80 = vcvtq_f32_f16(v151);
          v81 = vcvtq_f32_f16(v152);
          v150 = vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(v150), v80));
          v151 = vcvt_f16_f32(vaddq_f32(v81, v80));
          v152 = vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(v153), v81));
          v82 = vcvtq_f32_f16(v147);
          v83 = vcvtq_f32_f16(v148);
          v146 = vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(v146), v82));
          v147 = vcvt_f16_f32(vaddq_f32(v83, v82));
          v148 = vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(v149), v83));
          _ZN2RB13CubicIteratorIDv4_DF16_EC1ES1_S1_S1_S1_i(&v130, v63);
          v84 = v63;
          do
          {
            v85 = v142;
            v86 = vadd_f32(v143, v142);
            v142 = v86;
            v143 = vadd_f32(v144, v143);
            v144 = vadd_f32(v145, v144);
            v87 = v138;
            v88 = vadd_f32(v139, v138);
            v138 = v88;
            v139 = vadd_f32(v140, v139);
            v140 = vadd_f32(v141, v140);
            v89 = v134;
            v90 = vcvtq_f32_f16(v135);
            v91 = vcvt_f16_f32(vaddq_f32(v90, vcvtq_f32_f16(v134)));
            v92 = vcvtq_f32_f16(v136);
            v134 = v91;
            v135 = vcvt_f16_f32(vaddq_f32(v92, v90));
            v136 = vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(v137), v92));
            v93 = v130;
            v94 = vcvtq_f32_f16(v131);
            v95 = vcvt_f16_f32(vaddq_f32(v94, vcvtq_f32_f16(v130)));
            v96 = vcvtq_f32_f16(v132);
            v130 = v95;
            v131 = vcvt_f16_f32(vaddq_f32(v96, v94));
            v132 = vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(v133), v96));
            v97 = (float64x2_t *)a1[2];
            if (v97)
            {
              v98 = vcvtq_f64_f32(v85);
              v99 = v97[1];
              v85 = vcvt_f32_f64(vmlaq_laneq_f64(vmlaq_n_f64(v97[2], *v97, v98.f64[0]), v99, v98, 1));
              v100 = vcvtq_f64_f32(v87);
              v87 = vcvt_f32_f64(vmlaq_laneq_f64(vmlaq_n_f64(v97[2], *v97, v100.f64[0]), v99, v100, 1));
              v101 = vcvtq_f64_f32(v86);
              v86 = vcvt_f32_f64(vmlaq_laneq_f64(vmlaq_n_f64(v97[2], *v97, v101.f64[0]), v99, v101, 1));
              v102 = vcvtq_f64_f32(v88);
              v88 = vcvt_f32_f64(vmlaq_laneq_f64(vmlaq_n_f64(v97[2], *v97, v102.f64[0]), v99, v102, 1));
            }
            v103 = (uint32x2_t)vorr_s8((int8x8_t)vcgt_f32(v121, vmaxnm_f32(vmaxnm_f32(v85, v87), vmaxnm_f32(v86, v88))), (int8x8_t)vcgt_f32(vminnm_f32(vminnm_f32(v85, v87), vminnm_f32(v86, v88)), v64));
            if ((vpmax_u32(v103, v103).u32[0] & 0x80000000) == 0)
            {
              v126 = 0x3C00000000000000;
              v127 = 0;
              v124 = 0x3C00000000000000;
              v125 = 0;
              v122 = 0x3C00000000000000;
              v123 = 0;
              v104 = v189;
              v128 = v89;
              v105 = v189 | 0x100;
              v129 = v105;
              v106 = v191;
              if (v191)
              {
                RB::Fill::MeshGradient::ColorConversion::convert_out_slow((uint64_t)&v187, (RB::Fill::Color *)&v128, v189, *(double *)&v89);
                v104 = v189;
                v106 = v191;
                v105 = v189 | 0x100;
              }
              v126 = (uint64_t)v93;
              v127 = v105;
              if (v106)
              {
                RB::Fill::MeshGradient::ColorConversion::convert_out_slow((uint64_t)&v187, (RB::Fill::Color *)&v126, v104, *(double *)&v89);
                v104 = v189;
                v106 = v191;
                v105 = v189 | 0x100;
              }
              v124 = (uint64_t)v91;
              v125 = v105;
              if (v106)
              {
                RB::Fill::MeshGradient::ColorConversion::convert_out_slow((uint64_t)&v187, (RB::Fill::Color *)&v124, v104, *(double *)&v89);
                v104 = v189;
                v106 = v191;
                v105 = v189 | 0x100;
              }
              v122 = (uint64_t)v95;
              v123 = v105;
              if (v106)
                RB::Fill::MeshGradient::ColorConversion::convert_out_slow((uint64_t)&v187, (RB::Fill::Color *)&v122, v104, *(double *)&v89);
              RB::CGContext::Raster::fill_triangle((uint64_t)v195, &v128, (float16x4_t *)&v122, (float16x4_t *)&v126, v85, v88, v87);
              RB::CGContext::Raster::fill_triangle((uint64_t)v195, &v128, (float16x4_t *)&v124, (float16x4_t *)&v122, v85, v86, v88);
            }
            --v84;
          }
          while (v84);
          ++v75;
        }
        while (v75 != (_DWORD)v63);
        ++v62;
      }
      while (v62 < v182);
    }
    if (v111 <= 0x1000)
      goto LABEL_67;
  }
  free(v41);
LABEL_67:
  Image = CGBitmapContextCreateImage(v192);
  v198.origin.x = v193.f32[0];
  v198.origin.y = v193.f32[1];
  v198.size.width = v194.f32[0];
  v198.size.height = v194.f32[1];
  CGContextDrawImage(*(CGContextRef *)a2, v198, Image);
  if (Image)
    CFRelease(Image);
  RB::CGContext::~CGContext((RB::CGContext *)v196);
  if (v192)
    CFRelease(v192);
}

void sub_209BC871C(_Unwind_Exception *a1)
{
  uint64_t v1;
  const void *v3;

  RB::CGContext::~CGContext((RB::CGContext *)(v1 + 800));
  v3 = *(const void **)(v1 + 696);
  if (v3)
    CFRelease(v3);
  _Unwind_Resume(a1);
}

float32x2_t RB::Fill::MeshGradient::fill(RB::CGContext &,RB::Bounds)const::$_0::operator()(uint64_t *a1, unsigned int a2, int a3, int a4, double a5, int8x16_t a6, float64x2_t a7, float64x2_t a8, double a9, int8x16_t a10)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float32x2_t *v22;
  uint64_t v23;
  float32x2_t v24;
  uint64_t v25;
  float64x2_t v26;
  float16x4_t v27;
  uint64_t v28;
  RB::Fill::Color *v29;
  int v30;
  float16x4_t v32;
  float16x4_t v33;
  float16x4_t v34;
  float16x4_t v35;
  float32x2_t v36[4];

  v14 = 0;
  v36[3] = *(float32x2_t *)MEMORY[0x24BDAC8D0];
  v15 = *a1;
  v16 = *(_DWORD *)(*a1 + 24) * RB::Fill::MeshGradient::points_per_elt[*(_BYTE *)(*a1 + 39) & 0xF];
  v17 = *(_QWORD *)(*a1 + 8);
  do
  {
    v18 = (char *)&v33 + v14;
    *(_QWORD *)v18 = 0x3C00000000000000;
    *((_WORD *)v18 + 4) = 0;
    v14 += 10;
  }
  while (v14 != 30);
  v19 = 0;
  v20 = v17 + 16;
  v21 = v17 + 16 + 8 * v16;
  v22 = v36;
  do
  {
    if (v19 == 10)
      LODWORD(v23) = a3;
    else
      LODWORD(v23) = a4;
    if (v19)
      v23 = v23;
    else
      v23 = a2;
    v24 = *(float32x2_t *)(v20 + 8 * v23);
    *v22 = v24;
    v25 = *(_QWORD *)(v15 + 16);
    if (v25)
    {
      v26 = vcvtq_f64_f32(v24);
      a6 = *(int8x16_t *)v25;
      a7 = *(float64x2_t *)(v25 + 16);
      a8 = vmlaq_laneq_f64(vmlaq_n_f64(*(float64x2_t *)(v25 + 32), *(float64x2_t *)v25, v26.f64[0]), a7, v26, 1);
      *v22 = vcvt_f32_f64(a8);
    }
    v27 = *(float16x4_t *)(v21 + 8 * v23);
    v32 = v27;
    v28 = a1[2];
    if (*(_BYTE *)(v28 + 7))
    {
      RB::Fill::MeshGradient::ColorConversion::convert(v28, &v32, *(double *)&v27, a6, a7.f64[0], a8.f64[0], a9, a10);
      v27 = v32;
      v28 = a1[2];
    }
    v29 = (RB::Fill::Color *)((char *)&v33 + v19);
    v30 = *(unsigned __int8 *)(v28 + 5);
    *(float16x4_t *)v29 = v27;
    *((_WORD *)v29 + 4) = v30 | 0x100;
    if (*(_BYTE *)(v28 + 7) || *(unsigned __int8 *)(v28 + 5) != v30)
      RB::Fill::MeshGradient::ColorConversion::convert_out_slow(v28, v29, v30, *(double *)&v27);
    v19 += 10;
    ++v22;
  }
  while (v19 != 30);
  return RB::CGContext::Raster::fill_triangle(a1[1], &v33, &v34, &v35, v36[0], v36[1], v36[2]);
}

_QWORD *RB::Fill::MeshGradient::encode(RB::Fill::MeshGradient *this, RB::Encoder *a2)
{
  unint64_t v4;
  _QWORD *result;
  unint64_t v6;
  float64x2_t *v19;
  int64x2_t v20;

  v4 = *((_BYTE *)this + 39) & 0xF;
  RB::ProtobufEncoder::encode_varint(a2, 8uLL);
  RB::ProtobufEncoder::encode_varint(a2, v4);
  RB::ProtobufEncoder::packed_fixed32_field(a2, 2, (const unsigned int *)(*((_QWORD *)this + 1) + 16), 2 * *((_DWORD *)this + 6) * RB::Fill::MeshGradient::points_per_elt[*((_BYTE *)this + 39) & 0xF]);
  result = RB::ProtobufEncoder::packed_fixed64_field(a2, 3, (const unint64_t *)(*((_QWORD *)this + 1)+ 8* *((_DWORD *)this + 6)* RB::Fill::MeshGradient::points_per_elt[*((_BYTE *)this + 39) & 0xF]+ 16), *((_DWORD *)this + 6) * RB::Fill::MeshGradient::colors_per_elt[*((_BYTE *)this + 39) & 0xF]);
  v6 = *(_QWORD *)this;
  if ((_DWORD)v6)
  {
    RB::ProtobufEncoder::encode_varint(a2, 0x20uLL);
    result = RB::ProtobufEncoder::encode_varint(a2, v6);
  }
  _H0 = *((_WORD *)this + 14);
  __asm { FCVT            S0, H0 }
  if (_S0 != 0.0)
    goto LABEL_7;
  _H0 = *((_WORD *)this + 15);
  __asm { FCVT            S0, H0 }
  if (_S0 != 0.0)
    goto LABEL_7;
  _H0 = *((_WORD *)this + 16);
  __asm { FCVT            S0, H0 }
  if (_S0 != 0.0)
    goto LABEL_7;
  _H0 = *((_WORD *)this + 17);
  __asm { FCVT            S0, H0 }
  if (_S0 != 0.0)
  {
LABEL_7:
    RB::ProtobufEncoder::encode_varint(a2, 0x2AuLL);
    RB::ProtobufEncoder::begin_length_delimited(a2);
    RB::Fill::Color::encode((RB::Fill::MeshGradient *)((char *)this + 28), a2);
    result = RB::ProtobufEncoder::end_length_delimited(a2);
  }
  v19 = (float64x2_t *)*((_QWORD *)this + 2);
  if (v19)
  {
    v20 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(v19[1], (float64x2_t)xmmword_209BD52A0), (int8x16_t)vceqq_f64(*v19, (float64x2_t)xmmword_209BD5290)), (int8x16_t)vceqzq_f64(v19[2]));
    if ((vandq_s8((int8x16_t)vdupq_laneq_s64(v20, 1), (int8x16_t)v20).u64[0] & 0x8000000000000000) == 0)
    {
      RB::ProtobufEncoder::encode_varint(a2, 0x32uLL);
      RB::ProtobufEncoder::begin_length_delimited(a2);
      RB::AffineTransform::encode(v19->f64, a2);
      result = RB::ProtobufEncoder::end_length_delimited(a2);
    }
  }
  if ((*((_BYTE *)this + 38) & 0xFu) - 1 <= 2)
  {
    RB::ProtobufEncoder::encode_varint(a2, 8 * ((*((_BYTE *)this + 38) & 0xFu) - 1) + 56);
    result = RB::ProtobufEncoder::encode_varint(a2, 1uLL);
  }
  if ((*((_BYTE *)this + 38) & 0x10) != 0)
  {
    RB::ProtobufEncoder::encode_varint(a2, 0x50uLL);
    return RB::ProtobufEncoder::encode_varint(a2, 1uLL);
  }
  return result;
}

void RB::Fill::MeshGradient::decode(uint64_t a1, RB::Heap **this)
{
  unsigned __int8 v4;
  unsigned int v5;
  uint64_t v6;
  unint64_t field;
  unint64_t v8;
  float v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  void *__dst[2];
  float64x2_t v17[2];
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *__src;
  unint64_t v24;
  unint64_t v25;
  unsigned __int8 v26[9];

  v4 = 0;
  v5 = 0;
  __src = 0;
  v24 = 0;
  v25 = 0;
  v20 = 0;
  v21 = 0;
  *(_QWORD *)(a1 + 28) = 0;
  v6 = a1 + 28;
  v22 = 0;
  *(_WORD *)(a1 + 36) = 0;
  while (1)
  {
    field = RB::ProtobufDecoder::next_field((RB::ProtobufDecoder *)this);
    if (!field)
      break;
    switch((field >> 3))
    {
      case 1u:
        v8 = RB::ProtobufDecoder::uint_field((RB::ProtobufDecoder *)this, field);
        if (v8 <= 6)
          v4 = v8;
        else
          v4 = 0;
        continue;
      case 2u:
        v9 = RB::ProtobufDecoder::float_field((RB::ProtobufDecoder *)this, field);
        v10 = v24;
        v11 = v24 + 1;
        if (v25 < v24 + 1)
        {
          RB::vector<float,0ul,unsigned long>::reserve_slow((uint64_t)&__src, v11);
          v10 = v24;
          v11 = v24 + 1;
        }
        *((float *)__src + v10) = v9;
        v24 = v11;
        continue;
      case 3u:
        v12 = RB::ProtobufDecoder::color_field((unint64_t *)this, field);
        v13 = v21;
        if (v22 < v21 + 1)
        {
          RB::vector<unsigned long,0ul,unsigned long>::reserve_slow((uint64_t)&v20, v21 + 1);
          v13 = v21;
        }
        *((double *)v20 + v13) = v12;
        ++v21;
        continue;
      case 4u:
        v5 = RB::ProtobufDecoder::uint_field((RB::ProtobufDecoder *)this, field);
        continue;
      case 5u:
        if ((field & 7) == 2)
        {
          RB::ProtobufDecoder::begin_message((RB::ProtobufDecoder *)this);
          RB::Fill::Color::decode(v6, (RB::ProtobufDecoder *)this);
          RB::ProtobufDecoder::end_message((uint64_t)this);
        }
        else
        {
          *((_BYTE *)this + 56) = 1;
          *this = this[1];
        }
        continue;
      case 6u:
        v17[0] = (float64x2_t)xmmword_209BD5290;
        v17[1] = (float64x2_t)xmmword_209BD52A0;
        v18 = 0;
        v19 = 0;
        if ((field & 7) == 2)
        {
          RB::ProtobufDecoder::begin_message((RB::ProtobufDecoder *)this);
          RB::AffineTransform::decode((RB::AffineTransform *)v17, (RB::ProtobufDecoder *)this);
          RB::ProtobufDecoder::end_message((uint64_t)this);
        }
        else
        {
          *((_BYTE *)this + 56) = 1;
          *this = this[1];
        }
        RB::Fill::Gradient::concat((RB::Fill::Gradient *)a1, v17, this[8]);
        continue;
      case 7u:
        *(_BYTE *)(a1 + 38) &= 0xF0u;
        *(_BYTE *)(a1 + 38) |= RB::ProtobufDecoder::BOOL_field((RB::ProtobufDecoder *)this, field);
        continue;
      case 8u:
        *(_BYTE *)(a1 + 38) &= 0xF0u;
        if (RB::ProtobufDecoder::BOOL_field((RB::ProtobufDecoder *)this, field))
          v14 = 2;
        else
          v14 = 0;
        goto LABEL_29;
      case 9u:
        *(_BYTE *)(a1 + 38) &= 0xF0u;
        if (RB::ProtobufDecoder::BOOL_field((RB::ProtobufDecoder *)this, field))
          v14 = 3;
        else
          v14 = 0;
        goto LABEL_29;
      case 0xAu:
        *(_BYTE *)(a1 + 38) &= ~0x10u;
        if (RB::ProtobufDecoder::BOOL_field((RB::ProtobufDecoder *)this, field))
          v14 = 16;
        else
          v14 = 0;
LABEL_29:
        *(_BYTE *)(a1 + 38) |= v14;
        break;
      default:
        continue;
    }
  }
  v15 = 0;
  v26[0] = v4;
  if (v4 <= 6u)
  {
    if (((1 << v4) & 0x26) != 0)
    {
      v15 = v21;
    }
    else if (((1 << v4) & 0x18) != 0)
    {
      v15 = v21 >> 2;
    }
    else if (v4 == 6)
    {
      v15 = v21 / 3;
    }
  }
  if (RB::Fill::MeshGradient::valid_config(v26, v15, v5, (_QWORD *)a1))
  {
    v17[0] = 0uLL;
    __dst[0] = 0;
    __dst[1] = 0;
    if ((RB::Fill::MeshGradient::allocate_data(a1, v4, v15, v17, __dst) & 1) != 0)
    {
      if (v15)
      {
        memcpy(*(void **)&v17[0].f64[0], __src, 8 * *(_QWORD *)&v17[0].f64[1]);
        if (v21)
          memmove(__dst[0], v20, 8 * v21);
      }
      RB::Fill::MeshGradient::update_colors((RB::Fill::MeshGradient *)a1);
    }
  }
  if (v20)
    free(v20);
  if (__src)
    free(__src);
}

void sub_209BC8F00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,void *a24)
{
  if (a21)
    free(a21);
  if (a24)
    free(a24);
  _Unwind_Resume(exception_object);
}

void RB::Fill::MeshGradient::attributes(RB::Fill::MeshGradient *this, RB::XML::Element *a2)
{
  int v4;
  const char *v5;
  const char *v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  float64x2_t *v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  int64x2_t v14;
  int v27;
  void (**v28)(RB::XML::Value::ColorArray *__hidden);
  void *v29[2];
  float64x2_t v30;
  float64x2_t v31;

  LOBYTE(v4) = 0;
  v5 = "triangle-grid";
  v6 = "coons-patches";
  switch(*((_BYTE *)this + 39) & 0xF)
  {
    case 1:
      v4 = (*((unsigned __int8 *)this + 38) >> 4) & 1;
      v5 = "vertex-grid";
      goto LABEL_7;
    case 2:
      v4 = (*((unsigned __int8 *)this + 38) >> 4) & 1;
      v5 = "bezier-grid";
      goto LABEL_7;
    case 3:
      goto LABEL_5;
    case 4:
      v6 = "tensor-product-patches";
LABEL_5:
      v28 = (void (**)(RB::XML::Value::ColorArray *__hidden))&unk_24C228F48;
      v29[0] = (void *)v6;
      RB::XML::Element::set<RB::XML::Value::ConstantString>(a2, (uint64_t)"mesh-gradient-type", (uint64_t)&v28);
      break;
    case 5:
      goto LABEL_7;
    case 6:
      LOBYTE(v4) = 0;
      v5 = "triangles";
LABEL_7:
      v28 = (void (**)(RB::XML::Value::ColorArray *__hidden))&unk_24C228F48;
      v29[0] = (void *)v5;
      RB::XML::Element::set<RB::XML::Value::ConstantString>(a2, (uint64_t)"mesh-gradient-type", (uint64_t)&v28);
      v7 = *(_QWORD *)this;
      v28 = (void (**)(RB::XML::Value::ColorArray *__hidden))&unk_24C228FE8;
      v29[0] = (void *)v7;
      RB::XML::Element::set<RB::XML::Value::Int>(a2, (uint64_t)"gradient-mesh-width", (uint64_t)&v28);
      if ((v4 & 1) != 0)
      {
        v28 = (void (**)(RB::XML::Value::ColorArray *__hidden))&unk_24C229010;
        LOBYTE(v29[0]) = 1;
        RB::XML::Element::set<RB::XML::Value::Bool>(a2, (uint64_t)"gradient-smooth-color", (uint64_t)&v28);
      }
      break;
    default:
      break;
  }
  v8 = (*((_BYTE *)this + 38) & 0xF) - 1;
  if (v8 <= 2)
  {
    v9 = off_24C22C2E0[v8];
    v28 = (void (**)(RB::XML::Value::ColorArray *__hidden))&unk_24C228F48;
    v29[0] = v9;
    RB::XML::Element::set<RB::XML::Value::ConstantString>(a2, (uint64_t)"color-interpolation", (uint64_t)&v28);
  }
  v10 = (float64x2_t *)*((_QWORD *)this + 2);
  if (v10)
  {
    v11 = *v10;
    v12 = v10[1];
    v13 = v10[2];
    v14 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(v12, (float64x2_t)xmmword_209BD52A0), (int8x16_t)vceqq_f64(*v10, (float64x2_t)xmmword_209BD5290)), (int8x16_t)vceqzq_f64(v13));
    if ((vandq_s8((int8x16_t)vdupq_laneq_s64(v14, 1), (int8x16_t)v14).u64[0] & 0x8000000000000000) == 0)
    {
      v28 = (void (**)(RB::XML::Value::ColorArray *__hidden))&unk_24C228EF8;
      *(float64x2_t *)v29 = v11;
      v30 = v12;
      v31 = v13;
      RB::XML::Element::set<RB::XML::Value::AffineMatrix>(a2, (uint64_t)"gradient-transform", (uint64_t)&v28);
    }
  }
  _H0 = *((_WORD *)this + 14);
  __asm { FCVT            S0, H0 }
  if (_S0 != 0.0)
    goto LABEL_18;
  _H0 = *((_WORD *)this + 15);
  __asm { FCVT            S0, H0 }
  if (_S0 != 0.0)
    goto LABEL_18;
  _H0 = *((_WORD *)this + 16);
  __asm { FCVT            S0, H0 }
  if (_S0 != 0.0)
    goto LABEL_18;
  _H0 = *((_WORD *)this + 17);
  __asm { FCVT            S0, H0 }
  if (_S0 != 0.0)
  {
LABEL_18:
    RB::XML::Value::Color::Color((RB::XML::Value::Color *)&v28, (float16x4_t *)((char *)this + 28));
    RB::XML::Element::set<RB::XML::Value::Color>(a2, (uint64_t)"gradient-background", (uint64_t)&v28);
  }
  if (*((_BYTE *)this + 37))
  {
    v27 = rb_color_space(*((unsigned __int8 *)this + 36) | 0x100u);
    v28 = (void (**)(RB::XML::Value::ColorArray *__hidden))&unk_24C223D08;
    LODWORD(v29[0]) = v27;
    RB::XML::Element::set<RB::XML::Value::ColorSpace>(a2, (uint64_t)"color-space", (uint64_t)&v28);
  }
  RB::XML::Value::FloatArray::FloatArray<float>(&v28, (float *)(*((_QWORD *)this + 1) + 16), 2 * *((_DWORD *)this + 6) * RB::Fill::MeshGradient::points_per_elt[*((_BYTE *)this + 39) & 0xF]);
  RB::XML::Element::set<RB::XML::Value::FloatArray>(a2, (uint64_t)"gradient-positions", (uint64_t)&v28);
  v28 = &off_24C228E58;
  if (v29[0])
    free(v29[0]);
  _ZN2RB3XML5Value10ColorArrayC2IDF16_EEPKDv4_T_m12RBColorSpace((uint64_t)&v28, (uint64_t *)(*((_QWORD *)this + 1)+ 8* *((_DWORD *)this + 6)* RB::Fill::MeshGradient::points_per_elt[*((_BYTE *)this + 39) & 0xF]+ 16), *((_DWORD *)this + 6) * RB::Fill::MeshGradient::colors_per_elt[*((_BYTE *)this + 39) & 0xF], 0);
  RB::XML::Element::set<RB::XML::Value::ColorArray>(a2, (uint64_t)"gradient-colors", (uint64_t)&v28);
  v28 = &off_24C223CE0;
  if (v29[0])
    free(v29[0]);
}

void sub_209BC92A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11)
{
  if (a11)
    free(a11);
  _Unwind_Resume(exception_object);
}

_QWORD *RB::XML::Element::set<RB::XML::Value::ColorArray>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *result;
  uint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = (_QWORD *)operator new();
  v7 = (uint64_t)v6;
  v8 = 0;
  *v6 = &off_24C223CE0;
  v6[1] = 0;
  v6[2] = 0;
  v6[3] = 0;
  v9 = *(_QWORD *)(a3 + 16);
  if (v9)
  {
    v13 = *(uint64_t **)(a3 + 8);
    RB::vector<unsigned long,0ul,unsigned long>::reserve_slow((uint64_t)(v6 + 1), *(_QWORD *)(a3 + 16));
    v14 = (_QWORD *)(*(_QWORD *)(v7 + 8) + 8 * *(_QWORD *)(v7 + 16));
    v15 = v9;
    do
    {
      v16 = *v13++;
      *v14++ = v16;
      --v15;
    }
    while (v15);
    v8 = *(_QWORD *)(v7 + 16);
  }
  *(_QWORD *)(v7 + 16) = v8 + v9;
  *(_DWORD *)(v7 + 32) = *(_DWORD *)(a3 + 32);
  v10 = a1[7];
  if (a1[8] < (unint64_t)(v10 + 1))
  {
    RB::vector<std::pair<char const*,std::shared_ptr<RB::XML::Value::Base>>,0ul,unsigned long>::reserve_slow((uint64_t)(a1 + 6), v10 + 1);
    v10 = a1[7];
  }
  v11 = (_QWORD *)(a1[6] + 24 * v10);
  *v11 = a2;
  result = std::shared_ptr<RB::XML::Value::Base>::shared_ptr[abi:nn180100]<RB::XML::Value::ColorArray,void>(v11 + 1, v7);
  ++a1[7];
  return result;
}

void sub_209BC93E8(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;

  if (*v2)
    free(*v2);
  MEMORY[0x20BD16544](v1, 0x1081C40B7564605);
  _Unwind_Resume(a1);
}

uint64_t RB::Refcount<RB::Fill::MeshGradient::Data,std::atomic<unsigned int>>::release(uint64_t result)
{
  unsigned int *v1;
  unsigned int v2;
  unsigned int v3;

  v1 = (unsigned int *)(result + 8);
  do
  {
    v2 = __ldxr(v1);
    v3 = v2 - 1;
  }
  while (__stlxr(v3, v1));
  if (!v3)
  {
    __dmb(9u);
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  }
  return result;
}

void RB::Fill::MeshGradient::Data::~Data(RB::Fill::MeshGradient::Data *this)
{
  JUMPOUT(0x20BD16544);
}

void *RB::vector<RB::Fill::MeshGradient::MeshBuffer,4ul,unsigned int>::reserve_slow(void *__dst, unsigned int a2)
{
  unsigned int v3;
  void *result;

  if (*((_DWORD *)__dst + 35) + (*((_DWORD *)__dst + 35) >> 1) <= a2)
    v3 = a2;
  else
    v3 = *((_DWORD *)__dst + 35) + (*((_DWORD *)__dst + 35) >> 1);
  result = RB::details::realloc_vector<unsigned int,32ul>(*((void **)__dst + 16), __dst, 4u, (_DWORD *)__dst + 35, v3);
  *((_QWORD *)__dst + 16) = result;
  return result;
}

uint64_t _ZN2RB13CubicIteratorIDv4_DF16_EC2ES1_S1_S1_S1_i(uint64_t result, int a2, float16x4_t a3, float16x4_t a4, float16x4_t a5, float16x4_t a6)
{
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float16x4_t v18;
  float32x4_t v19;
  float32x4_t v21;
  float32x4_t v22;

  v6 = vcvtq_f32_f16(a3);
  v7 = vcvtq_f32_f16(a4);
  __asm { FMOV            V6.4S, #3.0 }
  _D5 = vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(v7, v6))), _Q6));
  v14 = vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(vcvtq_f32_f16(a5), v7))), _Q6)));
  v15 = vcvtq_f32_f16(_D5);
  v16 = vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(v14, v15)));
  _Q4 = vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(v15, v6))), v16)));
  v18 = vcvt_f16_f32(vsubq_f32(vcvtq_f32_f16(a6), _Q4));
  _Q4.f32[0] = 1.0 / (float)a2;
  *(float *)_D5.i32 = _Q4.f32[0] * _Q4.f32[0];
  _Q6.f32[0] = (float)(_Q4.f32[0] * _Q4.f32[0]) * _Q4.f32[0];
  v19 = vcvtq_f32_f16(v18);
  __asm
  {
    FMOV            V7.4S, #6.0
    FCVT            H6, S6
  }
  v21 = vcvtq_f32_f16((float16x4_t)vdup_lane_s16(*(int16x4_t *)_Q6.f32, 0));
  *(float16x4_t *)_Q7.f32 = vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(v19, _Q7))), v21));
  __asm { FCVT            H5, S5 }
  v22 = vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16((float16x4_t)vdup_lane_s16((int16x4_t)_D5, 0)), v16)));
  *(float16x4_t *)(result + 16) = vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(*(float16x4_t *)_Q7.f32), vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(v22, v22)))));
  *(_QWORD *)(result + 24) = _Q7.i64[0];
  __asm { FCVT            H4, S4 }
  *(double *)result = *(double *)&a3;
  *(float16x4_t *)(result + 8) = vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(v22, vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16((float16x4_t)vdup_lane_s16(*(int16x4_t *)_Q4.f32, 0)), v15)))))), vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(v21, v19)))));
  return result;
}

uint64_t _ZN2RB3XML5Value10ColorArrayC2IDF16_EEPKDv4_T_m12RBColorSpace(uint64_t a1, uint64_t *a2, unint64_t a3, int a4)
{
  uint64_t v5;
  unint64_t v7;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)a1 = &off_24C223CE0;
  *(_QWORD *)(a1 + 8) = 0;
  v5 = a1 + 8;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = a4;
  if (a3)
  {
    v7 = a3;
    RB::vector<unsigned long,0ul,unsigned long>::reserve_slow(a1 + 8, a3);
    v9 = *(_QWORD *)(a1 + 16);
    do
    {
      v10 = *a2;
      if (*(_QWORD *)(a1 + 24) < (unint64_t)(v9 + 1))
      {
        RB::vector<unsigned long,0ul,unsigned long>::reserve_slow(v5, v9 + 1);
        v9 = *(_QWORD *)(a1 + 16);
      }
      *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * v9) = v10;
      v9 = *(_QWORD *)(a1 + 16) + 1;
      *(_QWORD *)(a1 + 16) = v9;
      ++a2;
      --v7;
    }
    while (v7);
  }
  return a1;
}

void sub_209BC9674(_Unwind_Exception *exception_object)
{
  void **v1;

  if (*v1)
    free(*v1);
  _Unwind_Resume(exception_object);
}

_QWORD *std::shared_ptr<RB::XML::Value::Base>::shared_ptr[abi:nn180100]<RB::XML::Value::ColorArray,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &off_24C223EA0;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_209BC96E4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<RB::XML::Value::ColorArray *,std::shared_ptr<RB::XML::Value::Base>::__shared_ptr_default_delete<RB::XML::Value::Base,RB::XML::Value::ColorArray>,std::allocator<RB::XML::Value::ColorArray>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x20BD16544);
}

uint64_t std::__shared_ptr_pointer<RB::XML::Value::ColorArray *,std::shared_ptr<RB::XML::Value::Base>::__shared_ptr_default_delete<RB::XML::Value::Base,RB::XML::Value::ColorArray>,std::allocator<RB::XML::Value::ColorArray>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

void sub_209BC9B80(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_209BCA034(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void free_data(void *a1, void *a2)
{
  free(a2);
}

BOOL RBSurfaceIsOpaque(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 65))
    return 1;
  if (*(_BYTE *)(a1 + 64))
    return *(float *)(a1 + 108) >= 1.0;
  return 0;
}

uint64_t RBSurfacePrepareTexture(uint64_t a1, RB::Device ***a2)
{
  _BYTE v5[8];

  RB::ColorMode::ColorMode(v5, *(unsigned int *)(a1 + 68));
  return -[RBSurface _updateWithDevice:frame:synchronized:](a1, **a2, (RB::RenderFrame *)*a2, 0);
}

uint64_t RBSurfaceGetTexture(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t RB::Transition::set_add_remove_duration(uint64_t this, float a2)
{
  float v2;
  BOOL v3;
  float v4;

  if (a2 < 0.0)
    a2 = 0.0;
  v2 = (float)(a2 * 255.0) + 0.5;
  v3 = a2 <= 1.0;
  v4 = 255.5;
  if (v3)
    v4 = v2;
  *(_BYTE *)(this + 14) = (int)v4;
  return this;
}

uint64_t RB::Transition::properties(RB::Transition *this)
{
  unsigned int v1;
  unsigned int v2;
  char *v3;
  int v4;
  __int16 v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;

  v1 = *((_DWORD *)this + 12);
  if (v1)
  {
    v2 = 0;
    v3 = (char *)this + 24;
    if (*((_QWORD *)this + 5))
      v3 = (char *)*((_QWORD *)this + 5);
    v4 = 2;
    do
    {
      v5 = *(_WORD *)&v3[4 * v2];
      v6 = v5 & 0x7F;
      v7 = 1 << (v5 & 0x7F);
      v8 = v4 | 4;
      if ((v5 & 0x400) != 0)
        v8 = v4;
      v9 = v4 | 9;
      if ((v7 & 0x60020) == 0)
        v9 = v4;
      if ((v7 & 0x187800) == 0)
        v8 = v9;
      if ((v7 & 0x187DC) != 0)
        v10 = v4 | 1;
      else
        v10 = v8;
      if (v6 <= 0x14)
        v4 = v10;
      if (v5 < 0)
        v4 |= 0x10u;
      v2 += RB::Transition::_effect_args[v6] + 1;
    }
    while (v2 < v1);
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

BOOL RB::Transition::empty_transition(RB::Transition *this, char a2)
{
  unsigned int v2;
  unsigned int v3;
  char *v4;
  int v5;
  unsigned int v6;
  _BOOL8 result;

  v2 = *((_DWORD *)this + 12);
  if (!v2)
    return 1;
  v3 = 0;
  v4 = (char *)this + 24;
  if (*((_QWORD *)this + 5))
    v4 = (char *)*((_QWORD *)this + 5);
  v5 = a2 & 0x3F;
  do
  {
    v6 = *(unsigned __int16 *)&v4[4 * v3];
    result = (v5 & (v6 >> 8)) == 0;
    if ((v5 & (v6 >> 8)) != 0)
      break;
    v3 += RB::Transition::_effect_args[v6 & 0x7F] + 1;
  }
  while (v3 < v2);
  return result;
}

BOOL RB::Transition::operator==(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int16 *v9;
  unsigned __int16 *v10;
  int v11;
  unsigned int v12;
  int *v13;
  int *v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;

  if (*(unsigned __int8 *)(a1 + 12) == *(unsigned __int8 *)(a2 + 12)
    && *(unsigned __int8 *)(a1 + 13) == *(unsigned __int8 *)(a2 + 13)
    && *(unsigned __int8 *)(a1 + 14) == *(unsigned __int8 *)(a2 + 14)
    && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16)
    && *(_DWORD *)(a1 + 48) == *(_DWORD *)(a2 + 48))
  {
    result = RB::Animation::operator==(a1 + 56, a2 + 56);
    if (!result)
      return result;
    v5 = *(_DWORD *)(a1 + 48);
    if (!v5)
      return 1;
    v6 = 0;
    v7 = a1 + 24;
    v8 = a2 + 24;
    if (*(_QWORD *)(a1 + 40))
      v7 = *(_QWORD *)(a1 + 40);
    if (*(_QWORD *)(a2 + 40))
      v8 = *(_QWORD *)(a2 + 40);
    while (1)
    {
      v9 = (unsigned __int16 *)(v7 + 4 * v6);
      v10 = (unsigned __int16 *)(v8 + 4 * v6);
      v11 = *v9;
      if (*v10 != v11
        || *((unsigned __int8 *)v9 + 2) != *((unsigned __int8 *)v10 + 2)
        || *((unsigned __int8 *)v9 + 3) != *((unsigned __int8 *)v10 + 3))
      {
        break;
      }
      v12 = RB::Transition::_effect_args[v11 & 0x7F];
      if (((0x187FA3uLL >> v11) & 1) == 0)
      {
        v13 = (int *)(v9 + 2);
        v14 = (int *)(v10 + 2);
        if (v12 <= 1)
          v15 = 1;
        else
          v15 = RB::Transition::_effect_args[v11 & 0x7F];
        do
        {
          v17 = *v13++;
          v16 = v17;
          v18 = *v14++;
          if (v16 != v18)
            return 0;
        }
        while (--v15);
      }
      v6 += v12 + 1;
      result = 1;
      if (v6 >= v5)
        return result;
    }
  }
  return 0;
}

uint64_t RB::Transition::Effect::set_begin_time(uint64_t this, float a2)
{
  float v2;
  BOOL v3;
  float v4;

  if ((*(_WORD *)this & 0x80) != 0)
  {
    *(_WORD *)this &= ~0x80u;
    *(_BYTE *)(this + 3) = -1;
  }
  if (a2 < 0.0)
    a2 = 0.0;
  v2 = (float)(a2 * 255.0) + 0.5;
  v3 = a2 <= 1.0;
  v4 = 255.5;
  if (v3)
    v4 = v2;
  *(_BYTE *)(this + 2) = (int)v4;
  return this;
}

uint64_t RB::Transition::Effect::set_duration(uint64_t this, float a2)
{
  float v2;
  BOOL v3;
  float v4;

  if ((*(_WORD *)this & 0x80) != 0)
  {
    *(_WORD *)this &= ~0x80u;
    *(_BYTE *)(this + 2) = 0;
  }
  if (a2 < 0.0)
    a2 = 0.0;
  v2 = (float)(a2 * 255.0) + 0.5;
  v3 = a2 <= 1.0;
  v4 = 255.5;
  if (v3)
    v4 = v2;
  *(_BYTE *)(this + 3) = (int)v4;
  return this;
}

uint64_t RB::Transition::Effect::set_insert_animation(uint64_t this, char a2)
{
  if ((*(_WORD *)this & 0x80) == 0)
  {
    *(_WORD *)this |= 0x80u;
    *(_BYTE *)(this + 3) = 0;
  }
  *(_BYTE *)(this + 2) = a2;
  return this;
}

uint64_t RB::Transition::Effect::set_remove_animation(uint64_t this, char a2)
{
  if ((*(_WORD *)this & 0x80) == 0)
  {
    *(_WORD *)this |= 0x80u;
    *(_BYTE *)(this + 2) = 0;
  }
  *(_BYTE *)(this + 3) = a2;
  return this;
}

unint64_t RB::Transition::Effect::hash(RB::Transition::Effect *this)
{
  return ((unint64_t)*(unsigned __int16 *)this >> 2) & 0x3000 | *(_WORD *)this & 0x3FFF | ((unint64_t)*((unsigned __int8 *)this + 2) << 16) | ((unint64_t)*((unsigned __int8 *)this + 3) << 24);
}

uint64_t RB::Transition::Effect::custom_duration(RB::Transition::Effect *this, char a2, const EffectOrArg *a3, double a4, float32x2_t a5)
{
  int v5;
  float v6;
  float32x2_t v7;
  float32x2_t v8;
  float v9;
  uint64_t v10;

  v5 = *(_WORD *)this & 0x7F;
  if (v5 == 18)
  {
    v6 = 0.5;
    if ((a3->int_arg & 0xF) == 4)
      v6 = 0.25;
  }
  else
  {
    if (v5 != 17)
    {
      v10 = 0;
      v9 = 0.0;
      return v10 | LODWORD(v9);
    }
    v6 = 0.16667;
    if ((a2 & 1) != 0)
      v6 = 0.25;
  }
  a5.f32[0] = a3[1].arg;
  v7 = vrecpe_f32(a5);
  v8 = vmul_f32(vrecps_f32(a5, v7), v7);
  v9 = v6 * vmul_f32(v8, vrecps_f32(a5, v8)).f32[0];
  v10 = 0x100000000;
  return v10 | LODWORD(v9);
}

uint64_t RB::Transition::Effect::anchor_direction(RB::Transition::Effect *this, unsigned int a2, int a3)
{
  int v3;
  unsigned int v4;
  int v5;
  unsigned int v6;
  int v7;

  v3 = *(__int16 *)this;
  LOBYTE(v4) = (v3 & 0x7F) - 7;
  if (((*(_WORD *)this & 0x7F) - 7) > 3u)
  {
    LOBYTE(v4) = 0;
    v7 = 0;
  }
  else
  {
    if (v3 < 0)
      v5 = a3;
    else
      v5 = 0;
    if (v5 != ((a2 >> 1) & ((unsigned __int16)(v3 & 0x4000) >> 14)))
    {
      v6 = ((v3 & 0x7F) - 7);
      if (v6 > 3)
        LOBYTE(v4) = 1;
      else
        v4 = 0x2030001u >> (8 * v6);
    }
    v7 = 1;
  }
  return v4 | (v7 << 8);
}

uint64_t RB::Transition::Effect::sequence_direction(RB::Transition::Effect *this, unsigned int a2, int a3)
{
  uint64_t v3;
  unint64_t v4;
  int v5;
  int v7;
  int v8;

  v3 = (*(_WORD *)this & 0x7FLL) - 11;
  if (((*(_WORD *)this & 0x7F) - 11) <= 9u && ((0x30Fu >> v3) & 1) != 0)
  {
    v7 = *(__int16 *)this;
    LOBYTE(v4) = byte_209BDA5D1[v3];
    if (v7 < 0)
      v8 = a3;
    else
      v8 = 0;
    if (v8 != ((a2 >> 1) & ((unsigned __int16)(v7 & 0x4000) >> 14)))
      v4 = 0x40502030001uLL >> (8 * v4);
    v5 = 1;
  }
  else
  {
    LOBYTE(v4) = 0;
    v5 = 0;
  }
  return v4 | (v5 << 8);
}

_DWORD *RB::Transition::add_default_effect(_DWORD *this)
{
  _DWORD *v1;
  _DWORD *v2;
  int v3;
  _DWORD *v4;

  v1 = this;
  v2 = this + 6;
  v3 = this[12];
  if (this[13] < (v3 + 1))
  {
    this = RB::vector<RB::Symbol::Tag,4ul,unsigned int>::reserve_slow(this + 6, v3 + 1);
    v3 = v1[12];
  }
  v4 = (_DWORD *)*((_QWORD *)v1 + 5);
  if (!v4)
    v4 = v2;
  v4[v3] = -16776447;
  ++v1[12];
  return this;
}

_QWORD *RB::Transition::encode(RB::Transition *this, RB::Encoder *a2)
{
  _QWORD *result;
  unsigned int v5;
  unsigned int v6;
  char *v7;
  char *v8;
  __int16 v9;
  unsigned int *v10;
  unint64_t v11;
  unint64_t v12;
  float v13;
  int v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  __int16 v19;
  const unsigned int *v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  const unsigned int *v27;
  unsigned int v28;
  int v29;
  unint64_t v30;
  _BYTE v31[16];
  void *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  result = (_QWORD *)rb_transition_method((Method)*((unsigned __int8 *)this + 12));
  if ((_DWORD)result)
  {
    v5 = result;
    RB::ProtobufEncoder::encode_varint(a2, 8uLL);
    result = RB::ProtobufEncoder::encode_varint(a2, v5);
  }
  if (*((_DWORD *)this + 12))
  {
    v6 = 0;
    do
    {
      if (*((_QWORD *)this + 5))
        v7 = (char *)*((_QWORD *)this + 5);
      else
        v7 = (char *)this + 24;
      RB::ProtobufEncoder::encode_varint(a2, 0x12uLL);
      RB::ProtobufEncoder::begin_length_delimited(a2);
      v8 = &v7[4 * v6];
      v10 = (unsigned int *)(v8 + 4);
      LOBYTE(v9) = *(_WORD *)v8;
      v11 = *(_WORD *)v8 & 0x7F;
      if ((_DWORD)v11 != 1)
      {
        RB::ProtobufEncoder::encode_varint(a2, 8uLL);
        RB::ProtobufEncoder::encode_varint(a2, v11);
        v9 = *(_WORD *)v8;
      }
      v12 = v8[2];
      if ((v9 & 0x80) != 0)
      {
        if ((_DWORD)v12 == v8[3])
        {
          RB::ProtobufEncoder::encode_varint(a2, 0x48uLL);
          RB::ProtobufEncoder::encode_varint(a2, v12);
        }
        else
        {
          RB::ProtobufEncoder::encode_varint(a2, 0x50uLL);
          RB::ProtobufEncoder::encode_varint(a2, v12);
          if ((*(_WORD *)v8 & 0x80) != 0)
            v16 = v8[3];
          else
            v16 = 0;
          RB::ProtobufEncoder::encode_varint(a2, 0x58uLL);
          RB::ProtobufEncoder::encode_varint(a2, v16);
        }
      }
      else
      {
        v13 = (float)v12;
        *(float *)&v14 = (float)v12 * 0.0039216;
        if (*(float *)&v14 != 0.0)
        {
          RB::ProtobufEncoder::encode_varint(a2, 0x1DuLL);
          RB::ProtobufEncoder::encode_fixed32(a2, v14);
          v9 = *(_WORD *)v8;
        }
        if ((v9 & 0x80) == 0)
        {
          LOBYTE(v13) = v8[3];
          *(float *)&v15 = (float)LODWORD(v13) * 0.0039216;
          if (*(float *)&v15 != 1.0)
          {
            RB::ProtobufEncoder::encode_varint(a2, 0x25uLL);
            RB::ProtobufEncoder::encode_fixed32(a2, v15);
          }
        }
      }
      v17 = *(unsigned __int16 *)v8;
      v18 = (v17 >> 8) & 0x3F;
      if ((_DWORD)v18 == 3)
      {
        v19 = *(_WORD *)v8;
        if ((v17 & 0x4000) == 0)
          goto LABEL_24;
      }
      else
      {
        RB::ProtobufEncoder::encode_varint(a2, 0x28uLL);
        RB::ProtobufEncoder::encode_varint(a2, v18);
        v19 = *(_WORD *)v8;
        if ((*(_WORD *)v8 & 0x4000) == 0)
        {
LABEL_24:
          if (v19 < 0)
            goto LABEL_28;
          goto LABEL_29;
        }
      }
      RB::ProtobufEncoder::encode_varint(a2, 0x30uLL);
      RB::ProtobufEncoder::encode_varint(a2, 1uLL);
      v19 = *(_WORD *)v8;
      if ((*(_WORD *)v8 & 0x8000) != 0)
      {
LABEL_28:
        RB::ProtobufEncoder::encode_varint(a2, 0x40uLL);
        RB::ProtobufEncoder::encode_varint(a2, 1uLL);
        v19 = *(_WORD *)v8;
      }
LABEL_29:
      if (((0x187FA3uLL >> v19) & 1) == 0)
      {
        v20 = 0;
        v21 = 0;
        v22 = RB::Transition::_effect_args[v19 & 0x7F];
        v32 = 0;
        v33 = 0;
        v34 = 4;
        if (v22 <= 1)
          v23 = 1;
        else
          v23 = v22;
        do
        {
          v24 = v21 + 1;
          if (v34 < v21 + 1)
          {
            RB::vector<float,4ul,unsigned long>::reserve_slow(v31, v21 + 1);
            v20 = (const unsigned int *)v32;
            v21 = v33;
            v24 = v33 + 1;
          }
          v25 = *v10++;
          v26 = v25;
          if (v20)
            v27 = v20;
          else
            v27 = (const unsigned int *)v31;
          v27[v21] = v26;
          v33 = v24;
          v21 = v24;
          --v23;
        }
        while (v23);
        RB::ProtobufEncoder::packed_fixed32_field(a2, 2, v27, v24);
        if (v32)
          free(v32);
      }
      result = RB::ProtobufEncoder::end_length_delimited(a2);
      v6 += RB::Transition::_effect_args[*(_WORD *)v8 & 0x7F] + 1;
    }
    while (v6 < *((_DWORD *)this + 12));
  }
  v28 = *((unsigned __int8 *)this + 14);
  if (v28 != 32)
  {
    *(float *)&v29 = (float)v28 * 0.0039216;
    if (*(float *)&v29 != 0.0)
    {
      RB::ProtobufEncoder::encode_varint(a2, 0x1DuLL);
      result = RB::ProtobufEncoder::encode_fixed32(a2, v29);
    }
  }
  v30 = *((unsigned int *)this + 4);
  if ((v30 + 1) >= 2)
  {
    RB::ProtobufEncoder::encode_varint(a2, 0x20uLL);
    result = RB::ProtobufEncoder::encode_varint(a2, v30);
  }
  if (*((_BYTE *)this + 13))
  {
    RB::ProtobufEncoder::encode_varint(a2, 0x28uLL);
    result = RB::ProtobufEncoder::encode_varint(a2, 1uLL);
  }
  if (*((_DWORD *)this + 22))
  {
    RB::ProtobufEncoder::encode_varint(a2, 0x32uLL);
    RB::ProtobufEncoder::begin_length_delimited(a2);
    RB::Animation::encode((_QWORD *)this + 7, a2);
    return RB::ProtobufEncoder::end_length_delimited(a2);
  }
  return result;
}

void sub_209BCAC40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11)
{
  if (a11)
    free(a11);
  _Unwind_Resume(exception_object);
}

unint64_t RB::Transition::decode(uint64_t a1, RB::ProtobufDecoder *this)
{
  unint64_t result;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  uint64_t field;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  __int16 v16;
  float v17;
  unsigned int v18;
  uint64_t v19;
  float v20;
  float v21;
  __int16 v22;
  int v23;
  unsigned int v24;
  uint64_t v25;
  char v26;
  char v27;
  __int16 v28;
  char v29;
  float v30;
  float v31;
  unint64_t v32;
  int v33;
  int v34;
  int v35;
  uint64_t v36;

  result = RB::ProtobufDecoder::next_field(this);
  if (result)
  {
    v5 = result;
    do
    {
      switch((v5 >> 3))
      {
        case 1u:
          v6 = RB::ProtobufDecoder::uint_field(this, v5);
          if (v6 <= 8)
            *(_BYTE *)(a1 + 12) = rb_transition_method(v6);
          break;
        case 2u:
          v7 = *(unsigned int *)(a1 + 48);
          v8 = *(_DWORD *)(a1 + 48);
          if (*(_DWORD *)(a1 + 52) < (v7 + 1))
          {
            RB::vector<RB::Symbol::Tag,4ul,unsigned int>::reserve_slow((void *)(a1 + 24), v7 + 1);
            v8 = *(_DWORD *)(a1 + 48);
          }
          v9 = *(_QWORD *)(a1 + 40);
          if (!v9)
            v9 = a1 + 24;
          *(_DWORD *)(v9 + 4 * v8) = -16776447;
          v10 = *(_DWORD *)(a1 + 48) + 1;
          *(_DWORD *)(a1 + 48) = v10;
          if ((v5 & 7) == 2)
          {
            RB::ProtobufDecoder::begin_message(this);
            field = RB::ProtobufDecoder::next_field(this);
            if (field)
            {
              v12 = field;
              do
              {
                if (*(_QWORD *)(a1 + 40))
                  v13 = *(_QWORD *)(a1 + 40);
                else
                  v13 = a1 + 24;
                v14 = v13 + 4 * v7;
                switch((v12 >> 3))
                {
                  case 1u:
                    v15 = RB::ProtobufDecoder::uint_field(this, v12);
                    if (v15 <= 0x14)
                    {
                      v16 = *(_WORD *)v14 & 0xFF80 | v15;
                      goto LABEL_33;
                    }
                    break;
                  case 2u:
                    v17 = RB::ProtobufDecoder::float_field(this, v12);
                    v18 = *(_DWORD *)(a1 + 48);
                    if (*(_DWORD *)(a1 + 52) < v18 + 1)
                    {
                      RB::vector<RB::Symbol::Tag,4ul,unsigned int>::reserve_slow((void *)(a1 + 24), v18 + 1);
                      v18 = *(_DWORD *)(a1 + 48);
                    }
                    v19 = *(_QWORD *)(a1 + 40);
                    if (!v19)
                      v19 = a1 + 24;
                    *(float *)(v19 + 4 * v18) = v17;
                    goto LABEL_39;
                  case 3u:
                    v20 = RB::ProtobufDecoder::float_field(this, v12);
                    RB::Transition::Effect::set_begin_time(v14, v20);
                    break;
                  case 4u:
                    v21 = RB::ProtobufDecoder::float_field(this, v12);
                    RB::Transition::Effect::set_duration(v14, v21);
                    break;
                  case 5u:
                    v16 = ((RB::ProtobufDecoder::uint_field(this, v12) & 0x3F) << 8) | *(_WORD *)v14 & 0xC0FF;
                    goto LABEL_33;
                  case 6u:
                    if (RB::ProtobufDecoder::BOOL_field(this, v12))
                      v22 = 0x4000;
                    else
                      v22 = 0;
                    v16 = *(_WORD *)v14 | v22;
LABEL_33:
                    *(_WORD *)v14 = v16;
                    break;
                  case 7u:
                    v23 = RB::ProtobufDecoder::uint_field(this, v12);
                    v24 = *(_DWORD *)(a1 + 48);
                    if (*(_DWORD *)(a1 + 52) < v24 + 1)
                    {
                      RB::vector<RB::Symbol::Tag,4ul,unsigned int>::reserve_slow((void *)(a1 + 24), v24 + 1);
                      v24 = *(_DWORD *)(a1 + 48);
                    }
                    v25 = *(_QWORD *)(a1 + 40);
                    if (!v25)
                      v25 = a1 + 24;
                    *(_DWORD *)(v25 + 4 * v24) = v23;
LABEL_39:
                    ++*(_DWORD *)(a1 + 48);
                    break;
                  case 8u:
                    if (RB::ProtobufDecoder::BOOL_field(this, v12))
                      v26 = 2;
                    else
                      v26 = 0;
                    *(_WORD *)v14 = *(_WORD *)v14 & 0x3FFF | ((v26 & 3 | (*(_WORD *)v14 >> 14)) << 14);
                    break;
                  case 9u:
                    v27 = RB::ProtobufDecoder::uint_field(this, v12);
                    v28 = *(_WORD *)v14;
                    if ((*(_WORD *)v14 & 0x80) == 0)
                    {
                      v28 |= 0x80u;
                      *(_WORD *)v14 = v28;
                    }
                    *(_BYTE *)(v14 + 2) = v27;
                    if ((v28 & 0x80) == 0)
                      goto LABEL_47;
                    goto LABEL_48;
                  case 0xAu:
                    v29 = RB::ProtobufDecoder::uint_field(this, v12);
                    if ((*(_WORD *)v14 & 0x80) == 0)
                    {
                      *(_WORD *)v14 |= 0x80u;
                      *(_BYTE *)(v14 + 3) = 0;
                    }
                    *(_BYTE *)(v14 + 2) = v29;
                    break;
                  case 0xBu:
                    v27 = RB::ProtobufDecoder::uint_field(this, v12);
                    v28 = *(_WORD *)v14;
                    if ((*(_WORD *)v14 & 0x80) != 0)
                      goto LABEL_48;
LABEL_47:
                    *(_WORD *)v14 = v28 | 0x80;
                    *(_BYTE *)(v14 + 2) = 0;
LABEL_48:
                    *(_BYTE *)(v14 + 3) = v27;
                    break;
                  default:
                    RB::ProtobufDecoder::skip_field(this, v12);
                    break;
                }
                v12 = RB::ProtobufDecoder::next_field(this);
              }
              while (v12);
            }
            RB::ProtobufDecoder::end_message((uint64_t)this);
            v34 = *(_DWORD *)(a1 + 48);
          }
          else
          {
            *((_BYTE *)this + 56) = 1;
            *(_QWORD *)this = *((_QWORD *)this + 1);
            v34 = v10;
          }
          v35 = v34 - v10;
          v36 = *(_QWORD *)(a1 + 40);
          if (!v36)
            v36 = a1 + 24;
          if (v35 != RB::Transition::_effect_args[*(_WORD *)(v36 + 4 * v7) & 0x7F])
            goto LABEL_73;
          break;
        case 3u:
          v30 = RB::ProtobufDecoder::float_field(this, v5);
          if (v30 < 0.0)
            v30 = 0.0;
          if (v30 <= 1.0)
            v31 = (float)(v30 * 255.0) + 0.5;
          else
            v31 = 255.5;
          *(_BYTE *)(a1 + 14) = (int)v31;
          break;
        case 4u:
          v32 = RB::ProtobufDecoder::uint_field(this, v5);
          if (v32 >= 0xFFFFFFFF)
            v33 = -1;
          else
            v33 = v32;
          *(_DWORD *)(a1 + 16) = v33;
          break;
        case 5u:
          *(_BYTE *)(a1 + 13) = RB::ProtobufDecoder::BOOL_field(this, v5);
          break;
        case 6u:
          *(_DWORD *)(a1 + 88) = 0;
          if ((v5 & 7) == 2)
          {
            RB::ProtobufDecoder::begin_message(this);
            RB::Animation::decode(a1 + 56, this);
            RB::ProtobufDecoder::end_message((uint64_t)this);
          }
          else
          {
LABEL_73:
            *((_BYTE *)this + 56) = 1;
            *(_QWORD *)this = *((_QWORD *)this + 1);
          }
          break;
        default:
          RB::ProtobufDecoder::skip_field(this, v5);
          break;
      }
      result = RB::ProtobufDecoder::next_field(this);
      v5 = result;
    }
    while (result);
  }
  return result;
}

void RB::Transition::print(RB::Transition *this, std::string *a2)
{
  unsigned int v2;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int i;
  char *v9;
  char *v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  float v14;
  unsigned int v15;
  int v16;

  RB::SexpString::push(a2, "transition");
  v5 = *((unsigned __int8 *)this + 12);
  if ((v5 - 1) <= 7)
    RB::SexpString::printf(a2, 0, "%s", (&RB::Transition::print(RB::SexpString &)const::method_names)[v5]);
  if (*((_BYTE *)this + 13))
    RB::SexpString::print(a2, 0, "implicit");
  v6 = *((unsigned __int8 *)this + 14);
  if (v6 != 32)
    RB::SexpString::printf(a2, 0, "(add-remove %g)", (float)((float)v6 * 0.0039216));
  if (*((_DWORD *)this + 4) != -1)
    RB::SexpString::printf(a2, 0, "(max-changes %u)", *((_DWORD *)this + 4));
  if (*((_DWORD *)this + 12))
  {
    RB::SexpString::push(a2, "effects");
    v7 = *((_DWORD *)this + 12);
    if (v7)
    {
      for (i = 0; i < v7; i += RB::Transition::_effect_args[v11] + 1)
      {
        v9 = (char *)*((_QWORD *)this + 5);
        if (!v9)
          v9 = (char *)this + 24;
        v10 = &v9[4 * i];
        v11 = *(_WORD *)v10 & 0x7F;
        if (v11 <= 0x12)
        {
          RB::SexpString::push(a2, (&RB::Transition::print(RB::SexpString &)const::effect_names)[v11]);
          v12 = *(unsigned __int16 *)v10;
          if (((v12 >> 8) & 0x3F) != 3)
          {
            RB::SexpString::printf(a2, 0, "(events #x%x)", (v12 >> 8) & 0x3F);
            LOWORD(v12) = *(_WORD *)v10;
          }
          v13 = v10[2];
          if ((v12 & 0x80) != 0)
          {
            if (v13 == v10[3])
            {
              RB::SexpString::printf(a2, 0, "(animation %d)");
            }
            else
            {
              RB::SexpString::printf(a2, 0, "(insert-animation %d)", v10[2]);
              RB::SexpString::printf(a2, 0, "(remove-animation %d)");
            }
          }
          else
          {
            v14 = (float)v13 * 0.0039216;
            LOBYTE(v2) = v10[3];
            if (v14 != 0.0)
              RB::SexpString::printf(a2, 0, "(begin %g)", v14);
            if ((float)((float)v2 * 0.0039216) != 1.0)
              RB::SexpString::printf(a2, 0, "(duration %g)");
          }
          v15 = *(_WORD *)v10 & 0x7F;
          if (v15 <= 0x10)
          {
            v16 = 1 << v15;
            if ((v16 & 0x54) != 0)
            {
              RB::SexpString::printf(a2, 0, "(arg %g)");
            }
            else if ((v16 & 0x18008) != 0)
            {
              RB::SexpString::printf(a2, 0, "(args %g %g)");
            }
          }
          RB::SexpString::pop(a2);
          v7 = *((_DWORD *)this + 12);
          LODWORD(v11) = *(_WORD *)v10 & 0x7F;
        }
      }
    }
    RB::SexpString::pop(a2);
  }
  RB::SexpString::pop(a2);
}

void *RB::vector<float,4ul,unsigned long>::reserve_slow(void *__dst, size_t a2)
{
  size_t v3;
  void *result;

  if (*((_QWORD *)__dst + 4) + (*((_QWORD *)__dst + 4) >> 1) <= a2)
    v3 = a2;
  else
    v3 = *((_QWORD *)__dst + 4) + (*((_QWORD *)__dst + 4) >> 1);
  result = RB::details::realloc_vector<unsigned long,4ul>(*((void **)__dst + 2), __dst, 4uLL, (size_t *)__dst + 4, v3);
  *((_QWORD *)__dst + 2) = result;
  return result;
}

__n128 RB::Fill::Custom::Custom(RB::Fill::Custom *this, const RB::CustomShader::Closure *a2, __n128 *a3, int a4)
{
  RB::CustomShader::Closure *v6;
  __n128 result;

  v6 = RB::CustomShader::Closure::Closure(this, a2);
  *((_OWORD *)v6 + 8) = xmmword_209BD5290;
  *((_OWORD *)v6 + 9) = xmmword_209BD52A0;
  *((_QWORD *)v6 + 20) = 0;
  *((_QWORD *)v6 + 21) = 0;
  result = *a3;
  *((__n128 *)v6 + 11) = *a3;
  *((_DWORD *)v6 + 48) = a4;
  return result;
}

__n128 RB::Fill::Custom::Custom(RB::CustomShader::Closure *a1, uint64_t a2)
{
  RB::CustomShader::Closure *v3;
  __int128 v4;
  __int128 v5;
  __n128 result;

  v3 = RB::CustomShader::Closure::Closure(a1, (const RB::CustomShader::Closure *)a2);
  v4 = *(_OWORD *)(a2 + 128);
  v5 = *(_OWORD *)(a2 + 160);
  *((_OWORD *)v3 + 9) = *(_OWORD *)(a2 + 144);
  *((_OWORD *)v3 + 10) = v5;
  *((_OWORD *)v3 + 8) = v4;
  result = *(__n128 *)(a2 + 176);
  *((__n128 *)v3 + 11) = result;
  *((_DWORD *)v3 + 48) = *(_DWORD *)(a2 + 192);
  return result;
}

uint64_t *RB::Fill::Custom::function(RB::Fill::Custom *this, uint64_t **a2)
{
  uint64_t *result;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  _QWORD v8[2];

  result = *(uint64_t **)this;
  if (result)
  {
    v4 = **a2;
    v5 = (char *)this + 8;
    v7 = (char *)*((_QWORD *)this + 13);
    v6 = *((_QWORD *)this + 14);
    if (v7)
      v5 = v7;
    v8[0] = v5;
    v8[1] = v6;
    return RB::CustomShader::Function::function((uint64_t)result, v4, 0, v8);
  }
  return result;
}

uint64_t RB::Fill::Custom::set_custom(uint64_t a1, float32x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, float32x4_t *a6, float a7)
{
  float32x4_t v14;
  float32x4_t *v15;
  float32x4_t v16;
  uint64_t v17;
  int64x2_t v18;
  float64x2_t v24;
  float64x2_t v26;
  uint64_t v27;
  RB::Texture *v29;
  _BYTE v30[32];
  float32x4_t v31;

  _S8 = a7;
  v14 = a6[1];
  *(float32x4_t *)v30 = *a6;
  *(float32x4_t *)&v30[16] = v14;
  v31 = a6[2];
  if (RB::AffineTransform::invert((RB::AffineTransform *)v30))
    v15 = (float32x4_t *)v30;
  else
    v15 = a6;
  v16 = v15[1];
  v17 = *(_QWORD *)(a5 + 104);
  v18.i64[0] = (int)v17;
  v18.i64[1] = SHIDWORD(v17);
  __asm { FMOV            V4.2D, #0.5 }
  v24 = vmulq_f64(vcvtq_f64_s64(v18), _Q4);
  _Q0 = vmulq_n_f64(*(float64x2_t *)v15, v24.f64[0]);
  v26 = vmlaq_laneq_f64(vaddq_f64(_Q0, (float64x2_t)v15[2]), (float64x2_t)v16, v24, 1);
  *(float32x2_t *)v16.f32 = vcvt_f32_f64(vmulq_n_f64((float64x2_t)v16, -v24.f64[1]));
  *a2 = vcvt_f32_f64(_Q0);
  a2[1] = *(float32x2_t *)v16.f32;
  *(float32x2_t *)&_Q0.f64[0] = vcvt_f32_f64(v26);
  a2[2] = *(float32x2_t *)&_Q0.f64[0];
  __asm { FCVT            H0, S8 }
  a2[3].i16[0] = LOWORD(_Q0.f64[0]);
  memset(v30, 0, 24);
  v29 = 0;
  v27 = RB::CustomShader::Closure::marshal_args((_QWORD *)a1, a5, a3, (_OWORD *)(a1 + 176), a4, (uint64_t)v30, (uint64_t *)&v29, _Q0.f64[0], v16);
  if ((_DWORD)v27)
  {
    *(_DWORD *)(a5 + 220) = RB::RenderFrame::buffer_id(**(RB::RenderFrame ***)a5, *(RB::Buffer **)v30);
    *(int32x2_t *)(a5 + 224) = vmovn_s64(*(int64x2_t *)&v30[8]);
    if (v29)
      *(_DWORD *)(a5 + 232) = RB::RenderFrame::texture_id(**(RB::RenderFrame ***)a5, (uint64_t)v29);
  }
  return v27;
}

void RB::Fill::Custom::reset_custom(RB::Fill::Custom *this, RB::RenderPass *a2)
{
  *(_QWORD *)((char *)a2 + 228) = 0;
  *(_QWORD *)((char *)a2 + 220) = 0;
  *((_BYTE *)a2 + 236) = 0;
}

unint64_t RB::Fill::Custom::set_fill_state(RB::Fill::Custom *this, RB::RenderState *a2, Function *a3, unint64_t **a4)
{
  unint64_t result;

  *(_DWORD *)a2 = (*(_DWORD *)a2 & 0x3FFFFF | ((*((_DWORD *)this + 48) & 1 | (2 * (*((_DWORD *)a3 + 25) >> 31))) << 22)) ^ 0x800000;
  result = RB::RenderFrame::add_function(**a4, a3);
  *((_DWORD *)a2 + 1) = (8 * *((_DWORD *)a3 + 1)) | (*(_DWORD *)a3 << 6) | *((_DWORD *)a2 + 1) & 7;
  return result;
}

CGAffineTransform *RB::Fill::Custom::mix(RB::Fill::Custom *this, const RB::DisplayList::Interpolator::Op *a2, const RB::Fill::Custom *a3, float32_t a4, RB::Heap *a5, int8x16_t a6, double a7, double a8, double a9, int8x16_t a10)
{
  float32x2_t v12;
  float32x2_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  const RB::AffineTransform *v17;
  CGAffineTransform *result;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  RB::CustomShader::Closure::mix(this, a3, a4, a6, a7, a8, a9, a10);
  v12 = *(float32x2_t *)((char *)this + 176);
  v13 = *(float32x2_t *)((char *)a3 + 176);
  v14 = vadd_f32(*(float32x2_t *)((char *)this + 184), v12);
  v15 = vmla_n_f32(v12, vsub_f32(v13, v12), a4);
  v16 = vsub_f32(vmla_n_f32(v14, vadd_f32(vsub_f32(v13, v14), *(float32x2_t *)((char *)a3 + 184)), a4), v15);
  *((float32x2_t *)this + 22) = v15;
  *((float32x2_t *)this + 23) = v16;
  result = RB::mix((CGAffineTransform *)((char *)this + 128), (float64x2_t *)a3 + 8, v17, a4);
  *((_OWORD *)this + 8) = v19;
  *((_OWORD *)this + 9) = v20;
  *((_OWORD *)this + 10) = v21;
  return result;
}

void RB::Fill::Custom::attributes(RB::Fill::Custom *this, RB::XML::Element *a2)
{
  void *v4;
  _QWORD *v5;
  unsigned int *v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  const RB::CustomShader::Value *v13;
  uint64_t v14;
  const void **v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  RB::CustomShader::Value *v21;
  unint64_t v22;
  uint64_t v23;
  float32x2_t v24;
  uint32x2_t v25;
  float32x2_t v26;
  void (**v27)(RB::XML::Value::Shader *__hidden);
  id v28[2];
  float64x2_t v29;

  v4 = (void *)objc_opt_new();
  v5 = (_QWORD *)-[RBShape shapeData]((uint64_t)v4);
  v6 = (unsigned int *)*v5;
  v7 = *(_QWORD *)this;
  if (*v5 != *(_QWORD *)this)
  {
    if (v6)
    {
      v8 = v6 + 2;
      do
      {
        v9 = __ldxr(v8);
        v10 = v9 - 1;
      }
      while (__stlxr(v10, v8));
      if (!v10)
      {
        __dmb(9u);
        (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 8))(v6);
      }
      v7 = *(_QWORD *)this;
    }
    if (v7)
    {
      v11 = (unsigned int *)(v7 + 8);
      do
        v12 = __ldxr(v11);
      while (__stxr(v12 + 1, v11));
    }
    *v5 = v7;
  }
  v13 = (RB::Fill::Custom *)((char *)this + 8);
  v14 = v5[14];
  if (v5[13])
    v15 = (const void **)v5[13];
  else
    v15 = (const void **)(v5 + 1);
  if (v14)
  {
    v16 = 24 * v14;
    do
    {
      RB::CustomShader::Value::reset_data(v15);
      v15 += 3;
      v16 -= 24;
    }
    while (v16);
  }
  v5[14] = 0;
  v17 = *((_QWORD *)this + 14);
  if (*((_QWORD *)this + 13))
    v13 = (const RB::CustomShader::Value *)*((_QWORD *)this + 13);
  if (v5[15] < v17)
  {
    RB::vector<RB::CustomShader::Value,4ul,unsigned long>::reserve_slow(v5 + 1, *((_QWORD *)this + 14));
    v18 = v5[14];
  }
  else
  {
    v18 = 0;
    v19 = 0;
    if (!v17)
      goto LABEL_27;
  }
  v20 = (_QWORD *)v5[13];
  if (!v20)
    v20 = v5 + 1;
  v21 = (RB::CustomShader::Value *)&v20[3 * v18];
  v22 = v17;
  do
  {
    v23 = RB::CustomShader::Value::Value(v21, v13);
    v13 = (const RB::CustomShader::Value *)((char *)v13 + 24);
    v21 = (RB::CustomShader::Value *)(v23 + 24);
    --v22;
  }
  while (v22);
  v19 = v5[14];
LABEL_27:
  v5[14] = v19 + v17;
  v27 = &off_24C2291C8;
  v28[0] = v4;
  RB::XML::Element::set<RB::XML::Value::Shader>(a2, (uint64_t)"shader", (uint64_t)&v27);
  v27 = &off_24C2291C8;

  v24 = *(float32x2_t *)((char *)this + 184);
  v25 = (uint32x2_t)vcgtz_f32(v24);
  if ((vpmin_u32(v25, v25).u32[0] & 0x80000000) != 0)
  {
    v26 = *(float32x2_t *)((char *)this + 176);
    v27 = (void (**)(RB::XML::Value::Shader *__hidden))&unk_24C229100;
    *(float64x2_t *)v28 = vcvtq_f64_f32(v26);
    v29 = vcvtq_f64_f32(v24);
    RB::XML::Element::set<RB::XML::Value::Vec4>(a2, (uint64_t)"bounds", (uint64_t)&v27);
  }
  if ((*((_BYTE *)this + 192) & 1) != 0)
  {
    v27 = (void (**)(RB::XML::Value::Shader *__hidden))&unk_24C229010;
    LOBYTE(v28[0]) = 1;
    RB::XML::Element::set<RB::XML::Value::Bool>(a2, (uint64_t)"dither", (uint64_t)&v27);
  }

}

void sub_209BCB958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

_QWORD *RB::Fill::Custom::encode(RB::Fill::Custom *this, RB::Encoder *a2)
{
  _QWORD *result;
  int64x2_t v5;
  uint32x2_t v6;

  RB::ProtobufEncoder::encode_varint(a2, 0xAuLL);
  RB::ProtobufEncoder::begin_length_delimited(a2);
  RB::CustomShader::Closure::encode((RB::CustomShader::Function **)this, a2);
  result = RB::ProtobufEncoder::end_length_delimited(a2);
  v5 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(*((float64x2_t *)this + 9), (float64x2_t)xmmword_209BD52A0), (int8x16_t)vceqq_f64(*((float64x2_t *)this + 8), (float64x2_t)xmmword_209BD5290)), (int8x16_t)vceqzq_f64(*((float64x2_t *)this + 10)));
  if ((vandq_s8((int8x16_t)vdupq_laneq_s64(v5, 1), (int8x16_t)v5).u64[0] & 0x8000000000000000) == 0)
  {
    RB::ProtobufEncoder::encode_varint(a2, 0x12uLL);
    RB::ProtobufEncoder::begin_length_delimited(a2);
    RB::AffineTransform::encode((double *)this + 16, a2);
    result = RB::ProtobufEncoder::end_length_delimited(a2);
  }
  if ((*((_BYTE *)this + 192) & 1) != 0)
  {
    RB::ProtobufEncoder::encode_varint(a2, 0x18uLL);
    result = RB::ProtobufEncoder::encode_varint(a2, 1uLL);
  }
  v6 = (uint32x2_t)vcgtz_f32(*(float32x2_t *)((char *)this + 184));
  if ((vpmin_u32(v6, v6).u32[0] & 0x80000000) != 0)
    return RB::ProtobufEncoder::float4_field(a2, 4, *((float32x4_t *)this + 11));
  return result;
}

unint64_t RB::Fill::Custom::decode(RB::Fill::Custom *this, RB::Decoder *a2)
{
  unint64_t result;
  unint64_t v5;

  result = RB::ProtobufDecoder::next_field(a2);
  if (result)
  {
    v5 = result;
    do
    {
      switch((v5 >> 3))
      {
        case 1u:
          if ((v5 & 7) != 2)
            goto LABEL_14;
          RB::ProtobufDecoder::begin_message(a2);
          RB::CustomShader::Closure::decode(this, a2);
          goto LABEL_9;
        case 2u:
          if ((v5 & 7) == 2)
          {
            RB::ProtobufDecoder::begin_message(a2);
            RB::AffineTransform::decode((RB::Fill::Custom *)((char *)this + 128), a2);
LABEL_9:
            RB::ProtobufDecoder::end_message((uint64_t)a2);
          }
          else
          {
LABEL_14:
            *((_BYTE *)a2 + 56) = 1;
            *(_QWORD *)a2 = *((_QWORD *)a2 + 1);
          }
          break;
        case 3u:
          *((_DWORD *)this + 48) &= ~1u;
          *((_DWORD *)this + 48) |= RB::ProtobufDecoder::BOOL_field(a2, v5);
          break;
        case 4u:
          *((__n128 *)this + 11) = RB::ProtobufDecoder::float4_field(a2, v5);
          break;
        default:
          RB::ProtobufDecoder::skip_field(a2, v5);
          break;
      }
      result = RB::ProtobufDecoder::next_field(a2);
      v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t RBImageMakeIOSurface()
{
  return 1;
}

uint64_t RBImageMakeRBSurface()
{
  return 2;
}

uint64_t RBImageMakeMTLTexture()
{
  return 4;
}

float64x2_t RBImageTransform@<Q0>(uint64_t a1@<X8>, float64x2_t a2@<Q0>, float64_t a3@<D1>, float64x2_t a4@<Q2>, float64_t a5@<D3>, float64x2_t a6@<Q4>, float64_t a7@<D5>, float64x2_t a8, float64x2_t a9)
{
  float32x2_t v9;
  float32x2_t v10;
  float32x2_t v11;
  int8x8_t v12;
  int8x8_t v13;
  float64x2_t result;

  a2.f64[1] = a3;
  a4.f64[1] = a5;
  v9 = vcvt_f32_f64(a4);
  a6.f64[1] = a7;
  v10 = vcvt_f32_f64(a6);
  v11 = vcvt_f32_f64(a9);
  v12 = (int8x8_t)vdiv_f32(vmul_f32(v10, vcvt_f32_f64(a2)), v11);
  v13 = (int8x8_t)vsub_f32(v9, vdiv_f32(vmul_f32(vcvt_f32_f64(a8), v10), v11));
  *(double *)a1 = *(float *)v12.i32;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  result = vcvtq_f64_f32((float32x2_t)vext_s8(v12, v13, 4uLL));
  *(float64x2_t *)(a1 + 24) = result;
  *(double *)(a1 + 40) = *(float *)&v13.i32[1];
  return result;
}

float64x2_t RBTiledImageTransform@<Q0>(uint64_t a1@<X8>, float64x2_t a2@<Q0>, float64_t a3@<D1>, double a4@<D2>, float64x2_t a5@<Q3>, float64_t a6@<D4>, float64x2_t a7, float64x2_t a8)
{
  float32x2_t v8;
  float32x2_t v9;
  int8x8_t v10;
  int8x8_t v11;
  float64x2_t result;

  a2.f64[1] = a3;
  *(float *)&a3 = a4;
  a5.f64[1] = a6;
  v8 = vcvt_f32_f64(a8);
  v9 = vdiv_f32(v8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a3, 0));
  v10 = (int8x8_t)vdiv_f32(vmul_f32(v9, vcvt_f32_f64(a2)), v8);
  v11 = (int8x8_t)vsub_f32(vcvt_f32_f64(a5), vdiv_f32(vmul_f32(v9, vcvt_f32_f64(a7)), v8));
  *(double *)a1 = *(float *)v10.i32;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  result = vcvtq_f64_f32((float32x2_t)vext_s8(v10, v11, 4uLL));
  *(float64x2_t *)(a1 + 24) = result;
  *(double *)(a1 + 40) = *(float *)&v11.i32[1];
  return result;
}

RB::XML::Document *RB::XML::Document::Document(RB::XML::Document *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2 = operator new();
  *(_DWORD *)(v2 + 8) = 1;
  *(_QWORD *)v2 = off_24C229358;
  *(_QWORD *)(v2 + 16) = "display-list";
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_DWORD *)(v2 + 72) = 0;
  *(_QWORD *)this = v2;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  RB::UntypedTable::UntypedTable((RB::XML::Document *)((char *)this + 32), 0, 0, 0, 0, 0);
  *((_QWORD *)this + 14) = 1;
  *((_DWORD *)this + 30) = 0;
  v3 = *(_QWORD *)this;
  v4 = *((_QWORD *)this + 2);
  v5 = v4 + 1;
  if (*((_QWORD *)this + 3) < (unint64_t)(v4 + 1))
  {
    RB::vector<unsigned long,0ul,unsigned long>::reserve_slow((uint64_t)this + 8, v5);
    v4 = *((_QWORD *)this + 2);
    v5 = v4 + 1;
  }
  *(_QWORD *)(*((_QWORD *)this + 1) + 8 * v4) = v3;
  *((_QWORD *)this + 2) = v5;
  return this;
}

void sub_209BCBDB8(_Unwind_Exception *a1)
{
  _DWORD **v1;
  void **v2;
  RB::UntypedTable *v3;
  _DWORD *v5;
  int v6;

  RB::UntypedTable::~UntypedTable(v3);
  if (*v2)
    free(*v2);
  v5 = *v1;
  if (*v1)
  {
    v6 = v5[2] - 1;
    v5[2] = v6;
    if (!v6)
      (*(void (**)(_DWORD *))(*(_QWORD *)v5 + 8))(v5);
  }
  _Unwind_Resume(a1);
}

uint64_t RB::XML::Document::push(RB::XML::Document *this, const char *a2)
{
  char *v4;
  _QWORD *v5;
  uint64_t result;
  uint64_t v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v4 = (char *)this + 8;
  v5 = *(_QWORD **)(*((_QWORD *)this + 1) + 8 * *((_QWORD *)this + 2) - 8);
  result = operator new();
  v7 = result;
  *(_DWORD *)(result + 8) = 1;
  v8 = *((_DWORD *)v4 + 28);
  *(_QWORD *)result = off_24C229358;
  *(_QWORD *)(result + 16) = a2;
  *(_OWORD *)(result + 24) = 0u;
  *(_OWORD *)(result + 40) = 0u;
  *(_OWORD *)(result + 56) = 0u;
  *(_DWORD *)(result + 72) = v8;
  v9 = v5[4];
  v10 = v9 + 1;
  if (v5[5] < (unint64_t)(v9 + 1))
  {
    result = (uint64_t)RB::vector<unsigned long,0ul,unsigned long>::reserve_slow((uint64_t)(v5 + 3), v10);
    v9 = v5[4];
    v10 = v9 + 1;
  }
  *(_QWORD *)(v5[3] + 8 * v9) = v7;
  v5[4] = v10;
  v11 = *((_QWORD *)this + 2);
  v12 = v11 + 1;
  if (*((_QWORD *)this + 3) < (unint64_t)(v11 + 1))
  {
    result = (uint64_t)RB::vector<unsigned long,0ul,unsigned long>::reserve_slow((uint64_t)v4, v12);
    v11 = *((_QWORD *)this + 2);
    v12 = v11 + 1;
  }
  *(_QWORD *)(*((_QWORD *)this + 1) + 8 * v11) = v7;
  *((_QWORD *)this + 2) = v12;
  return result;
}

uint64_t RB::XML::Document::pop(uint64_t this)
{
  --*(_QWORD *)(this + 16);
  return this;
}

uint64_t *RB::XML::Document::append(_QWORD *a1, uint64_t *a2, uint64_t *a3)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *result;
  uint64_t v11;
  _QWORD *v12;
  _QWORD v13[2];

  v6 = *(_QWORD **)(a1[1] + 8 * a1[2] - 8);
  v7 = v6[4];
  if (v6[5] < (unint64_t)(v7 + 1))
  {
    RB::vector<unsigned long,0ul,unsigned long>::reserve_slow((uint64_t)(v6 + 3), v7 + 1);
    v7 = v6[4];
  }
  v8 = v6[3];
  v9 = *a2;
  if (*a2)
    ++*(_DWORD *)(v9 + 8);
  *(_QWORD *)(v8 + 8 * v7) = v9;
  v6[4] = v7 + 1;
  result = RB::UntypedTable::lookup((RB::UntypedTable *)(a1 + 4), a3, 0);
  if (result)
  {
    v11 = *(_QWORD *)(a1[1] + 8 * a1[2] - 8);
    v12 = *(_QWORD **)(*(_QWORD *)(v11 + 24) + 8 * *(_QWORD *)(v11 + 32) - 8);
    v13[0] = &unk_24C229240;
    v13[1] = result;
    return RB::XML::Element::set<RB::XML::Value::StateID>(v12, (uint64_t)"state", (uint64_t)v13);
  }
  return result;
}

size_t *RB::XML::Document::add_state(RB::XML::Document *this, _RBDrawingState *a2)
{
  size_t *v4;
  RB::XML::Document *v6;

  v4 = (size_t *)*((_QWORD *)this + 14);
  *((_QWORD *)this + 14) = (char *)v4 + 1;
  if (v4 == (size_t *)-1)
  {
    *((_QWORD *)this + 14) = 1;
    v6 = this;
    RB::UntypedTable::for_each((uint64_t)this + 32, (void (*)(const void *, const void *, void *))RB::Table<_RBDrawingState *,unsigned long>::for_each<RB::XML::Document::add_state(_RBDrawingState *)::$_0>(RB::XML::Document::add_state(_RBDrawingState *)::$_0)const::{lambda(void const*,void const*,void *)#1}::__invoke, &v6);
    v4 = (size_t *)*((_QWORD *)this + 14);
    *((_QWORD *)this + 14) = (char *)v4 + 1;
  }
  RB::UntypedTable::insert((size_t **)this + 4, (size_t *)a2, v4);
  return v4;
}

uint64_t *RB::XML::Document::remove_state(RB::XML::Document *this, _RBDrawingState *a2)
{
  RB::UntypedTable *v4;
  uint64_t *result;
  uint64_t *v6;
  uint64_t v7;

  v4 = (RB::XML::Document *)((char *)this + 32);
  result = RB::UntypedTable::lookup((RB::XML::Document *)((char *)this + 32), (uint64_t *)a2, 0);
  if (result)
  {
    v6 = result;
    result = (uint64_t *)RB::UntypedTable::remove(v4, a2);
    if ((uint64_t *)(*((_QWORD *)this + 14) - 1) == v6)
      v7 = (uint64_t)v6;
    else
      v7 = -1;
    *((_QWORD *)this + 14) = v7;
  }
  return result;
}

uint64_t *RB::XML::Document::set_state(RB::XML::Document *this, _RBDrawingState *a2)
{
  uint64_t *result;
  _QWORD *v4;
  _QWORD v5[2];

  result = RB::UntypedTable::lookup((RB::XML::Document *)((char *)this + 32), (uint64_t *)a2, 0);
  if (result)
  {
    v4 = *(_QWORD **)(*((_QWORD *)this + 1) + 8 * *((_QWORD *)this + 2) - 8);
    v5[0] = &unk_24C229240;
    v5[1] = result;
    return RB::XML::Element::set<RB::XML::Value::StateID>(v4, (uint64_t)"state", (uint64_t)v5);
  }
  return result;
}

void *RB::XML::Document::snapshot@<X0>(RB::XML::Element **this@<X0>, uint64_t *a2@<X8>)
{
  return RB::XML::Element::copy(*this, a2);
}

void *RB::XML::Element::copy@<X0>(RB::XML::Element *this@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  void *result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = operator new();
  v5 = *((_QWORD *)this + 2);
  *(_DWORD *)(v4 + 8) = 1;
  v6 = *((_DWORD *)this + 18);
  *(_QWORD *)v4 = off_24C229358;
  *(_OWORD *)(v4 + 24) = 0u;
  result = (void *)(v4 + 24);
  *(_QWORD *)(v4 + 16) = v5;
  *(_OWORD *)(v4 + 40) = 0u;
  *(_OWORD *)(v4 + 56) = 0u;
  *(_DWORD *)(v4 + 72) = v6;
  *a2 = v4;
  v8 = *((_QWORD *)this + 4);
  if (v8)
  {
    v18 = (uint64_t *)*((_QWORD *)this + 3);
    result = RB::vector<unsigned long,0ul,unsigned long>::reserve_slow((uint64_t)result, *((_QWORD *)this + 4));
    v19 = *(_QWORD *)(v4 + 32);
    v20 = (_QWORD *)(*(_QWORD *)(v4 + 24) + 8 * v19);
    v21 = v8;
    do
    {
      v22 = *v18;
      if (*v18)
        ++*(_DWORD *)(v22 + 8);
      *v20++ = v22;
      ++v18;
      --v21;
    }
    while (v21);
    v23 = *(_QWORD *)(v4 + 48);
    v24 = *(_QWORD *)(v4 + 56);
    *(_QWORD *)(v4 + 32) = v19 + v8;
    if (v24)
    {
      v25 = 24 * v24;
      result = (void *)(v23 + 8);
      do
      {
        result = (void *)(std::shared_ptr<RB::XML::Value::Base>::~shared_ptr[abi:nn180100]((uint64_t)result) + 24);
        v25 -= 24;
      }
      while (v25);
    }
  }
  else
  {
    *(_QWORD *)(v4 + 32) = 0;
  }
  *(_QWORD *)(v4 + 56) = 0;
  v10 = *((_QWORD *)this + 6);
  v9 = *((_QWORD *)this + 7);
  if (*(_QWORD *)(v4 + 64) < v9)
  {
    result = RB::vector<std::pair<char const*,std::shared_ptr<RB::XML::Value::Base>>,0ul,unsigned long>::reserve_slow(v4 + 48, v9);
    v11 = *(_QWORD *)(v4 + 56);
  }
  else
  {
    v11 = 0;
    v12 = 0;
    if (!v9)
      goto LABEL_11;
  }
  v13 = *(_QWORD *)(v4 + 48) + 24 * v11;
  v14 = v9;
  do
  {
    *(_OWORD *)v13 = *(_OWORD *)v10;
    v15 = *(_QWORD *)(v10 + 16);
    *(_QWORD *)(v13 + 16) = v15;
    if (v15)
    {
      v16 = (unint64_t *)(v15 + 8);
      do
        v17 = __ldxr(v16);
      while (__stxr(v17 + 1, v16));
    }
    v10 += 24;
    v13 += 24;
    --v14;
  }
  while (v14);
  v12 = *(_QWORD *)(v4 + 56);
LABEL_11:
  *(_QWORD *)(v4 + 56) = v12 + v9;
  return result;
}

void sub_209BCC2B8(_Unwind_Exception *exception_object)
{
  _DWORD **v1;

  if (*v1)
    RB::Device::alloc_shared_texture(*v1);
  _Unwind_Resume(exception_object);
}

_QWORD *RB::XML::Document::print(uint64_t a1, _QWORD *a2, uint64_t a3, double a4, double a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[3];

  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n", 39);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)"<display-list xmlns=\"http://www.apple.com/RenderBox/1.0\"", 56);
  v10 = *(_QWORD *)(*(_QWORD *)a1 + 56);
  if (v10)
  {
    v11 = *(_QWORD *)(*(_QWORD *)a1 + 48);
    v12 = v11 + 24 * v10;
    do
    {
      LOBYTE(v19[0]) = 32;
      std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)v19, 1);
      v13 = strlen(*(const char **)v11);
      std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, *(_QWORD *)v11, v13);
      LOBYTE(v19[0]) = 61;
      std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)v19, 1);
      v11 += 24;
    }
    while (v11 != v12);
  }
  if (a4 > 0.0 && a5 > 0.0)
  {
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)" size=", 6);
    v19[0] = &unk_24C2290B0;
    *(double *)&v19[1] = a4;
    *(double *)&v19[2] = a5;
  }
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)">\n", 2);
  v14 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  if (v14)
  {
    v15 = *(uint64_t **)(*(_QWORD *)a1 + 24);
    v16 = 8 * v14;
    do
    {
      v17 = *v15++;
      RB::XML::Element::print(v17, a2, 1, a3);
      v16 -= 8;
    }
    while (v16);
  }
  return std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)"</display-list>\n", 16);
}

void RB::XML::`anonymous namespace'::quote_value(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  _BYTE *p_p;
  _BYTE *v5;
  _BYTE *v6;
  unsigned int v8;
  const char *v9;
  size_t v10;
  void *__p;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v12 = 0;
  v13 = 0;
  __p = 0;
  (*(void (**)(uint64_t, void **))(*(_QWORD *)a2 + 16))(a2, &__p);
  v14 = 34;
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a1, (uint64_t)&v14, 1);
  v3 = HIBYTE(v13);
  if (v13 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  if (v13 < 0)
    v3 = v12;
  if (v3 >= 1)
  {
    v5 = &p_p[v3];
    v6 = p_p;
    while ((char)*p_p > 0x3E || ((1 << *p_p) & 0x500000C400000000) == 0)
    {
      ++p_p;
LABEL_26:
      if (p_p >= v5)
      {
        if (p_p > v6)
          std::ostream::write();
        goto LABEL_29;
      }
    }
    if (p_p > v6)
      std::ostream::write();
    v8 = *p_p;
    if (v8 > 0x3B)
    {
      if (v8 == 62)
      {
        v9 = "&gt;";
      }
      else
      {
        if (v8 != 60)
        {
LABEL_24:
          v9 = "&apos;";
          goto LABEL_25;
        }
        v9 = "&lt;";
      }
    }
    else if (v8 == 34)
    {
      v9 = "&quot;";
    }
    else
    {
      v9 = "&amp;";
      if (v8 != 38)
        goto LABEL_24;
    }
LABEL_25:
    v10 = strlen(v9);
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a1, (uint64_t)v9, v10);
    v6 = ++p_p;
    goto LABEL_26;
  }
LABEL_29:
  v14 = 34;
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a1, (uint64_t)&v14, 1);
  if (SHIBYTE(v13) < 0)
    operator delete(__p);
}

void sub_209BCC62C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *RB::XML::Element::print(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unsigned int v8;
  uint64_t v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  size_t v20;
  const char *v21;
  _QWORD *v22;
  uint64_t v23;
  char v25;
  char v26;
  char v27;

  v4 = a4;
  v8 = *(_DWORD *)(a1 + 72);
  if (v8)
    v4 = a4 & 0x7FFFFFFF | (~rb_color_space(v8) << 31);
  v25 = 60;
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)&v25, 1);
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    v10 = strlen(*(const char **)(a1 + 16));
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, v9, v10);
  }
  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
  {
    v12 = *(_QWORD *)(a1 + 48);
    v13 = v12 + 24 * v11;
    do
    {
      v26 = 32;
      std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)&v26, 1);
      v14 = strlen(*(const char **)v12);
      std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, *(_QWORD *)v12, v14);
      v27 = 61;
      std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)&v27, 1);
      v12 += 24;
    }
    while (v12 != v13);
  }
  if (*(_QWORD *)(a1 + 32))
  {
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)">\n", 2);
    v15 = *(_QWORD *)(a1 + 32);
    if (v15)
    {
      v16 = *(uint64_t **)(a1 + 24);
      v17 = 8 * v15;
      do
      {
        v18 = *v16++;
        RB::XML::Element::print(v18, a2, (a3 + 1), v4);
        v17 -= 8;
      }
      while (v17);
    }
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)"</", 2);
    v19 = *(const char **)(a1 + 16);
    if (v19)
    {
      v20 = strlen(v19);
      std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a2, (uint64_t)v19, v20);
    }
    v21 = ">\n";
    v22 = a2;
    v23 = 2;
  }
  else
  {
    v21 = "/>\n";
    v22 = a2;
    v23 = 3;
  }
  return std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v22, (uint64_t)v21, v23);
}

void RB::XML::Element::print(RB::XML::Element *this, std::string *a2, uint64_t a3)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  void **v10;
  uint64_t v11;
  RB::XML::Element **v12;
  uint64_t v13;
  RB::XML::Element *v14;
  void *__p[2];
  uint64_t v16;

  v6 = (const char *)*((_QWORD *)this + 2);
  if (v6)
    RB::SexpString::push(a2, v6);
  v7 = *((_QWORD *)this + 7);
  if (v7)
  {
    v8 = 24 * v7;
    v9 = (_QWORD *)(*((_QWORD *)this + 6) + 8);
    do
    {
      __p[0] = 0;
      __p[1] = 0;
      v16 = 0;
      (*(void (**)(_QWORD, void **, uint64_t))(*(_QWORD *)*v9 + 16))(*v9, __p, a3);
      if (v16 >= 0)
        v10 = __p;
      else
        v10 = (void **)__p[0];
      RB::SexpString::printf(a2, 0, "(%s \"%s\")", (const char *)*(v9 - 1), (const char *)v10);
      if (SHIBYTE(v16) < 0)
        operator delete(__p[0]);
      v9 += 3;
      v8 -= 24;
    }
    while (v8);
  }
  v11 = *((_QWORD *)this + 4);
  if (v11)
  {
    v12 = (RB::XML::Element **)*((_QWORD *)this + 3);
    v13 = 8 * v11;
    do
    {
      v14 = *v12++;
      RB::XML::Element::print(v14, (RB::SexpString *)a2, a3);
      v13 -= 8;
    }
    while (v13);
  }
  if (*((_QWORD *)this + 2))
    RB::SexpString::pop(a2);
}

void sub_209BCC938(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void RB::XML::Document::print_children(RB::XML::Document *this, std::string *a2, uint64_t a3)
{
  uint64_t v3;
  RB::XML::Element **v6;
  uint64_t v7;
  RB::XML::Element *v8;

  v3 = *(_QWORD *)(*(_QWORD *)this + 32);
  if (v3)
  {
    v6 = *(RB::XML::Element ***)(*(_QWORD *)this + 24);
    v7 = 8 * v3;
    do
    {
      v8 = *v6++;
      RB::XML::Element::print(v8, a2, a3);
      v7 -= 8;
    }
    while (v7);
  }
}

void *RB::XML::Document::dictionary(RB::XML::Element **this, uint64_t a2)
{
  return RB::XML::Element::dictionary(*this, a2);
}

void *RB::XML::Element::dictionary(RB::XML::Element *this, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  void **v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  RB::XML::Element **v14;
  uint64_t v15;
  uint64_t v16;
  void *__p[2];
  uint64_t v19;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if (*((_QWORD *)this + 2))
  {
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, RBXMLRecorderKeyName);
  }
  if (*((_QWORD *)this + 7))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = *((_QWORD *)this + 7);
    if (v7)
    {
      v8 = 24 * v7;
      v9 = (_QWORD *)(*((_QWORD *)this + 6) + 8);
      do
      {
        __p[0] = 0;
        __p[1] = 0;
        v19 = 0;
        (*(void (**)(_QWORD, void **, uint64_t))(*(_QWORD *)*v9 + 16))(*v9, __p, a2);
        if (v19 >= 0)
          v10 = __p;
        else
          v10 = (void **)__p[0];
        v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v10);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *(v9 - 1)));
        if (SHIBYTE(v19) < 0)
          operator delete(__p[0]);
        v9 += 3;
        v8 -= 24;
      }
      while (v8);
    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, RBXMLRecorderKeyAttributes);
  }
  if (*((_QWORD *)this + 4))
  {
    v12 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = *((_QWORD *)this + 4);
    if (v13)
    {
      v14 = (RB::XML::Element **)*((_QWORD *)this + 3);
      v15 = 8 * v13;
      do
      {
        v16 = RB::XML::Element::dictionary(*v14, a2);
        if (v16)
          objc_msgSend(v12, "addObject:", v16);
        ++v14;
        v15 -= 8;
      }
      while (v15);
    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, RBXMLRecorderKeyChildren);
  }
  return v4;
}

void sub_209BCCB5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void RB::XML::`anonymous namespace'::indent(_QWORD *a1, uint64_t a2)
{
  size_t v3;
  size_t v4;
  char *v5;
  size_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if ((a2 & 0x80000000) == 0)
  {
    v3 = 2 * (int)a2;
    v4 = (int)(v3 | 1);
    if ((v3 | 1) > 0x1000)
    {
      v5 = (char *)malloc_type_malloc((int)(v3 | 1), 0xCFB199FuLL);
      if (!v5)
      {
LABEL_6:
        free(v5);
        return;
      }
    }
    else
    {
      MEMORY[0x24BDAC7A8](a1, a2);
      v5 = (char *)v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v5, v4);
    }
    memset(v5, 32, v3);
    v5[v3] = 0;
    v6 = strlen(v5);
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a1, (uint64_t)v5, v6);
    if (v4 <= 0x1000)
      return;
    goto LABEL_6;
  }
}

_QWORD *RB::XML::Element::set_rendering_mode(_QWORD *result, int a2, float a3)
{
  const char *v3;
  void *v4;
  double v5;

  switch(a2)
  {
    case 3:
      v4 = &unk_24C229178;
      v5 = a3;
      v3 = "outer-distance";
      return RB::XML::Element::set<RB::XML::Value::Float>(result, (uint64_t)v3, (uint64_t)&v4);
    case 2:
      v4 = &unk_24C229178;
      v5 = a3;
      v3 = "inner-distance";
      return RB::XML::Element::set<RB::XML::Value::Float>(result, (uint64_t)v3, (uint64_t)&v4);
    case 1:
      v4 = &unk_24C229010;
      LOBYTE(v5) = 0;
      return RB::XML::Element::set<RB::XML::Value::Bool>(result, (uint64_t)"antialiased", (uint64_t)&v4);
  }
  return result;
}

void RB::Table<_RBDrawingState *,unsigned long>::for_each<RB::XML::Document::add_state(_RBDrawingState *)::$_0>(RB::XML::Document::add_state(_RBDrawingState *)::$_0)const::{lambda(void const*,void const*,void *)#1}::__invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  if (*(_QWORD *)(*(_QWORD *)a3 + 112) <= (unint64_t)(a2 + 1))
    v3 = a2 + 1;
  else
    v3 = *(_QWORD *)(*(_QWORD *)a3 + 112);
  *(_QWORD *)(*(_QWORD *)a3 + 112) = v3;
}

void RB::`anonymous namespace'::print_ops(unsigned int *a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v5;
  int32x2_t *v6;
  int v7;
  const std::string::value_type *v8;
  std::string::size_type v9;
  const char *v10;
  size_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char v15;
  char v16;
  const std::string::value_type *v17;
  char *v18;
  char v19;
  int32x2_t v20;
  float32x2_t v21;
  float32x2_t v22;
  void **v23;
  std::string::size_type v24;
  std::string *v25;
  _QWORD v26[2];
  void *__p[2];
  unsigned __int8 v28;
  std::string v29;

  v2 = *a1;
  if ((_DWORD)v2)
  {
    v5 = 0;
    while (1)
    {
      v6 = *(int32x2_t **)(a2 + 16 * v5);
      if (v6)
        break;
LABEL_42:
      if (++v5 >= v2)
        return;
    }
    std::string::basic_string[abi:nn180100]<0>(&v29, " ");
    v7 = v6[5].u8[5];
    if (v7 == 1)
    {
      v8 = "depth-tested ";
      v9 = 13;
    }
    else
    {
      if (v7 != 2)
        goto LABEL_9;
      v8 = "depth-writing ";
      v9 = 14;
    }
    std::string::append(&v29, v8, v9);
LABEL_9:
    v10 = RB::RenderState::name((RB::RenderState *)v6);
    v11 = strlen(v10);
    std::string::append(&v29, v10, v11);
    v12 = a2 + 16 * v5;
    v13 = (char *)(v12 + 14);
    v14 = (char *)(v12 + 15);
    v15 = 1;
    do
    {
      v16 = v15;
      if ((v15 & 1) != 0)
        v17 = " r=";
      else
        v17 = " w=";
      std::string::append(&v29, v17, 3uLL);
      if ((v16 & 1) != 0)
        v18 = v13;
      else
        v18 = v14;
      v19 = *v18;
      if ((*v18 & 1) != 0)
        std::string::push_back(&v29, 83);
      if ((v19 & 2) != 0)
        std::string::push_back(&v29, 67);
      if ((v19 & 4) != 0)
        std::string::push_back(&v29, 76);
      if ((v19 & 8) != 0)
        std::string::push_back(&v29, 65);
      if ((v19 & 0x10) != 0)
        std::string::push_back(&v29, 77);
      if ((v19 & 0x20) != 0)
        std::string::push_back(&v29, 90);
      v15 = 0;
    }
    while ((v16 & 1) != 0);
    std::string::push_back(&v29, 32);
    v20 = v6[1];
    v21 = vcvt_f32_s32(v20);
    v22 = vcvt_f32_s32(vsub_s32(v6[2], v20));
    v26[0] = v21;
    v26[1] = v22;
    RB::Rect::operator std::string(v26, __p);
    if ((v28 & 0x80u) == 0)
      v23 = __p;
    else
      v23 = (void **)__p[0];
    if ((v28 & 0x80u) == 0)
      v24 = v28;
    else
      v24 = (std::string::size_type)__p[1];
    std::string::append(&v29, (const std::string::value_type *)v23, v24);
    if ((char)v28 < 0)
      operator delete(__p[0]);
    v25 = &v29;
    if ((v29.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v25 = (std::string *)v29.__r_.__value_.__r.__words[0];
    printf("  [%d%s]%s\n", *(__int16 *)(a2 + 16 * v5 + 12), (const char *)v25, "");
    if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v29.__r_.__value_.__l.__data_);
    v2 = *a1;
    goto LABEL_42;
  }
}

void sub_209BCCF78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a20 < 0)
    operator delete(__p);
  if (a26 < 0)
    operator delete(a21);
  _Unwind_Resume(exception_object);
}

uint64_t RB::Texture::set_swizzle(void *a1, const char *a2)
{
  uint64_t v2;

  if (((_BYTE)a2 - 1) > 3u)
    v2 = 84148994;
  else
    v2 = qword_209BDA600[(char)((_BYTE)a2 - 1)];
  return objc_msgSend(a1, "setSwizzle:", v2);
}

uint64_t RB::Texture::alloc@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, unsigned int a3@<W2>, char a4@<W3>, int a5@<W4>, int a6@<W5>, uint64_t *a7@<X8>, __n128 a8@<Q0>)
{
  const float *v9;
  int32x2_t v10;
  uint32x2_t v11;
  uint64_t v12;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  MTLPixelFormat v23;
  void *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  unsigned int *v28;
  uint64_t v29;
  unsigned int *v30;
  void *v31;
  __n128 v32;

  v9 = (const float *)(result + 288);
  v10 = (int32x2_t)vld1_dup_f32(v9);
  v11 = (uint32x2_t)vand_s8((int8x8_t)vcge_s32(v10, (int32x2_t)a8.n128_u64[0]), (int8x8_t)vcgtz_s32((int32x2_t)a8.n128_u64[0]));
  if ((vpmin_u32(v11, v11).u32[0] & 0x80000000) != 0)
  {
    v18 = result;
    v32 = a8;
    v19 = RB::max_mipmap_levels((int32x2_t)a8.n128_u64[0]);
    if (a3 <= 1)
      v20 = 1;
    else
      v20 = a3;
    if (v20 >= v19)
      v21 = v19;
    else
      v21 = v20;
    v22 = (void *)objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a2, v32.n128_i32[0], v32.n128_i32[1], v21 > 1);
    v24 = v22;
    if (v21 >= 2)
      objc_msgSend(v22, "setMipmapLevelCount:", v21);
    switch(a6)
    {
      case 0:
        goto LABEL_18;
      case 1:
        v25 = 17040130;
        goto LABEL_17;
      case 2:
        v25 = 33686018;
        goto LABEL_17;
      case 3:
        v25 = 16908802;
        goto LABEL_17;
      case 4:
        v25 = 50463234;
        goto LABEL_17;
      default:
        v25 = 84148994;
LABEL_17:
        objc_msgSend(v24, "setSwizzle:", v25, *(_OWORD *)&v32);
LABEL_18:
        switch(a5)
        {
          case 0:
          case 6:
            v28 = RB::pixel_format_traits(a2, v23);
            v27 = 0;
            if (((*v28 | ((unint64_t)*((unsigned __int16 *)v28 + 2) << 32)) & 0x40000000000) != 0)
              v29 = 17;
            else
              v29 = 1;
            goto LABEL_30;
          case 1:
            v30 = RB::pixel_format_traits(a2, v23);
            if (((*v30 | ((unint64_t)*((unsigned __int16 *)v30 + 2) << 32)) & 0x40000000000) != 0)
              v29 = 21;
            else
              v29 = 5;
            v27 = 2;
LABEL_30:
            objc_msgSend(v24, "setUsage:", v29, *(_OWORD *)&v32);
            v26 = 1;
            goto LABEL_31;
          case 2:
          case 3:
          case 4:
          case 5:
            objc_msgSend(v24, "setUsage:", 4);
            objc_msgSend(v24, "setStorageMode:", 2);
            if (!*(_BYTE *)(v18 + 283) || (*(_BYTE *)(v18 + 292) & 4) != 0)
              goto LABEL_22;
            v26 = 0;
            v27 = 3;
LABEL_31:
            objc_msgSend(v24, "setStorageMode:", v27, *(_OWORD *)&v32);
            break;
          default:
LABEL_22:
            v26 = 1;
            break;
        }
        result = objc_msgSend(*(id *)(v18 + 24), "newTextureWithDescriptor:", v24, *(_OWORD *)&v32);
        if (!result)
          goto LABEL_2;
        v31 = (void *)result;
        v12 = operator new();
        result = RB::Texture::Texture(v12, v31, a4, a5, a6);
        *(_BYTE *)(v12 + 45) = v26;
        break;
    }
  }
  else
  {
LABEL_2:
    v12 = 0;
  }
  *a7 = v12;
  return result;
}

void sub_209BCD22C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD16544](v1, 0x10A1C401006C202);
  _Unwind_Resume(a1);
}

float *RB::Texture::alloc@<X0>(float *result@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, int a6@<W5>, int a7@<W6>, uint64_t *a8@<X8>, int32x2_t a9@<D0>)
{
  const float *v10;
  int32x2_t v11;
  uint32x2_t v12;
  uint64_t v13;
  void *v20;
  MTLPixelFormat v21;
  void *v22;
  uint64_t v23;
  unsigned int *v24;
  uint64_t v25;
  float *v26;
  int v27;

  v10 = result + 72;
  v11 = (int32x2_t)vld1_dup_f32(v10);
  v12 = (uint32x2_t)vand_s8((int8x8_t)vcge_s32(v11, a9), (int8x8_t)vcgtz_s32(a9));
  if ((vpmin_u32(v12, v12).u32[0] & 0x80000000) != 0)
  {
    v20 = (void *)objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a3, a9.i32[0], a9.i32[1], 0);
    v22 = v20;
    switch(a7)
    {
      case 0:
        goto LABEL_10;
      case 1:
        v23 = 17040130;
        goto LABEL_9;
      case 2:
        v23 = 33686018;
        goto LABEL_9;
      case 3:
        v23 = 16908802;
        goto LABEL_9;
      case 4:
        v23 = 50463234;
        goto LABEL_9;
      default:
        v23 = 84148994;
LABEL_9:
        objc_msgSend(v20, "setSwizzle:", v23);
LABEL_10:
        if (a6 != 6 && a6)
          abort();
        v24 = RB::pixel_format_traits(a3, v21);
        if (((*v24 | ((unint64_t)*((unsigned __int16 *)v24 + 2) << 32)) & 0x40000000000) != 0)
          v25 = 17;
        else
          v25 = 1;
        objc_msgSend(v22, "setUsage:", v25);
        objc_msgSend(v22, "setStorageMode:", 0);
        objc_msgSend(v22, "setCpuCacheMode:", objc_msgSend(*(id *)(a2 + 16), "cpuCacheMode"));
        result = (float *)objc_msgSend(*(id *)(a2 + 16), "newTextureWithDescriptor:offset:bytesPerRow:", v22, 0, a4);
        if (!result)
          goto LABEL_2;
        v26 = result;
        v13 = operator new();
        RB::Texture::Texture(v13, v26, a5, a6, a7);
        result = *(float **)(v13 + 24);
        if (result != (float *)a2)
        {
          if (result)
          {
            v27 = *((_DWORD *)result + 2) - 1;
            *((_DWORD *)result + 2) = v27;
            if (!v27)
              result = (float *)(*(uint64_t (**)(float *))(*(_QWORD *)result + 8))(result);
          }
          ++*(_DWORD *)(a2 + 8);
          *(_QWORD *)(v13 + 24) = a2;
        }
        *(_BYTE *)(v13 + 77) |= 2u;
        break;
    }
  }
  else
  {
LABEL_2:
    v13 = 0;
  }
  *a8 = v13;
  return result;
}

void sub_209BCD434(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD16544](v1, 0x10A1C401006C202);
  _Unwind_Resume(a1);
}

uint64_t RB::Texture::Texture(uint64_t a1, void *a2, char a3, int a4, char a5)
{
  _QWORD *v10;
  unsigned int v11;
  MTLPixelFormat v12;
  unsigned __int32 v13;
  unsigned int *v14;
  int v15;

  v10 = (_QWORD *)RB::Resource::Resource(a1, (uint64_t)a2);
  *v10 = &off_24C2298D0;
  v10[6] = 0;
  *(_QWORD *)(a1 + 56) = objc_msgSend(a2, "pixelFormat");
  v11 = objc_msgSend(a2, "width");
  *(_QWORD *)(a1 + 64) = __PAIR64__(objc_msgSend(a2, "height"), v11);
  *(_DWORD *)(a1 + 72) = 0;
  *(_BYTE *)(a1 + 76) = objc_msgSend(a2, "mipmapLevelCount");
  *(_BYTE *)(a1 + 77) = 0;
  *(_BYTE *)(a1 + 78) = a4;
  *(_BYTE *)(a1 + 79) = a5;
  *(_BYTE *)(a1 + 80) = a3;
  if (objc_msgSend(a2, "storageMode") != 3)
  {
    v13 = vmul_lane_s32(*(int32x2_t *)(a1 + 64), *(int32x2_t *)(a1 + 64), 1).u32[0];
    v14 = RB::pixel_format_traits(*(_QWORD *)(a1 + 56), v12);
    if (*((_BYTE *)v14 + 6))
      v15 = v13 * *((unsigned __int8 *)v14 + 6);
    else
      v15 = 4 * v13;
    *(_DWORD *)(a1 + 72) = v15;
  }
  if (a4 == 6)
    *(_BYTE *)(a1 + 45) = 0;
  return a1;
}

void sub_209BCD540(_Unwind_Exception *a1)
{
  RB::Resource *v1;

  RB::Resource::~Resource(v1);
  _Unwind_Resume(a1);
}

unint64_t RB::Texture::has_view_usage(id *this)
{
  unsigned int v1;

  v1 = *((unsigned __int8 *)this + 78);
  if (v1 < 2)
    return 1;
  if (v1 == 6)
    return ((unint64_t)objc_msgSend(this[2], "usage") >> 4) & 1;
  return 0;
}

uint64_t RB::Texture::replace(RB::Texture *this, int a2, const void *a3, uint64_t a4)
{
  uint64_t v4;
  void *v5;
  __int128 v6;
  _QWORD v8[3];
  __int128 v9;
  uint64_t v10;

  v4 = *((_QWORD *)this + 8);
  v5 = (void *)*((_QWORD *)this + 2);
  memset(v8, 0, sizeof(v8));
  *(_QWORD *)&v6 = (int)v4;
  *((_QWORD *)&v6 + 1) = SHIDWORD(v4);
  v9 = v6;
  v10 = 1;
  return objc_msgSend(v5, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v8, a2, a3, a4);
}

void RB::Path::Storage::clear(RB::Path::Storage *this)
{
  RB::Path::Storage *v1;
  uint64_t v2;
  int v3;
  os_unfair_lock_s *v4;
  const void *v5;

  v1 = this;
  v2 = *(_QWORD *)this;
  if (*(_QWORD *)this)
  {
    *(_QWORD *)this = 0;
    if ((v2 & 1) != 0)
    {
      this = (RB::Path::Storage *)(v2 & 0xFFFFFFFFFFFFFFFCLL);
      if ((v2 & 0xFFFFFFFFFFFFFFFCLL) != 0)
        this = (RB::Path::Storage *)MEMORY[0x20BD1652C](this, 0x1000C8052888210);
    }
  }
  v3 = *((_DWORD *)v1 + 2);
  if ((v3 & 0x20) != 0)
  {
    v4 = (os_unfair_lock_s *)RB::Path::Storage::MapCache::shared(this);
    RB::Path::Storage::MapCache::remove(v4, v1);
    v3 = *((_DWORD *)v1 + 2);
  }
  if ((v3 & 1) != 0)
  {
    v5 = (const void *)*((_QWORD *)v1 + 7);
    if (v5)
    {
      *((_QWORD *)v1 + 7) = 0;
      CFRelease(v5);
      v3 = *((_DWORD *)v1 + 2);
    }
  }
  if ((v3 & 1) != 0)
    *((_QWORD *)v1 + 3) = 0;
  else
    v3 &= 0xFFF000FF;
  *((_DWORD *)v1 + 2) = v3 & 0xFFFFFFC1;
}

BOOL RB::Path::Storage::operator==(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  const void *v7;
  size_t v8;
  const void *v9;
  const void *v10;
  const void *v11;

  v2 = *(unsigned int *)(a1 + 8);
  if ((v2 & 1) != 0)
    v3 = *(_QWORD *)(a1 + 24);
  else
    v3 = (v2 >> 8) & 0xFFF;
  v4 = *(unsigned int *)(a2 + 8);
  v5 = (v4 >> 8) & 0xFFF;
  if ((v4 & 1) != 0)
    v5 = *(_QWORD *)(a2 + 24);
  if (v3 != v5 || ((v4 ^ v2) & 0x3E) != 0)
    return 0;
  if ((v2 & 1) != 0)
  {
    v7 = *(const void **)(a1 + 16);
    v8 = *(_QWORD *)(a1 + 24);
  }
  else
  {
    v7 = (const void *)(a1 + 16);
    v8 = (v2 >> 8) & 0xFFF;
  }
  v11 = *(const void **)(a2 + 16);
  v9 = (const void *)(a2 + 16);
  v10 = v11;
  if ((v4 & 1) != 0)
    v9 = v10;
  return memcmp(v7, v9, v8) == 0;
}

uint64_t RB::Path::NestedCallbacks::apply_elements_callback(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v5;
  BOOL v6;
  char v7;

  v2 = *(_QWORD *)(a1 + 24);
  if (a2 <= 0x18)
  {
    if (((1 << a2) & 0x1DE0000) != 0)
    {
      *(_QWORD *)(a1 + 24) = v2 + 1;
    }
    else if (a2 == 16)
    {
      *(_QWORD *)(a1 + 24) = v2 - 1;
      v5 = *(_QWORD *)(a1 + 16);
      v6 = v2 == v5;
      if (v2 <= v5)
      {
        v3 = 0;
        v7 = v6;
        *(_BYTE *)(a1 + 32) = v7;
        return v3;
      }
    }
  }
  if (v2 < *(_QWORD *)(a1 + 16))
    return 1;
  return (*(uint64_t (**)(_QWORD))(a1 + 8))(*(_QWORD *)a1);
}

BOOL RB::Path::NestedCallbacks::single_element_callback(uint64_t a1, int a2)
{
  uint64_t v2;
  _BOOL8 result;

  v2 = *(_QWORD *)(a1 + 8);
  switch(a2)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 12:
    case 13:
    case 14:
    case 15:
      if (v2 != *(_QWORD *)a1)
        goto LABEL_7;
      *(_BYTE *)(a1 + 24) = 1;
      goto LABEL_4;
    case 4:
      if (v2 != *(_QWORD *)a1 || !*(_BYTE *)(a1 + 24))
        goto LABEL_7;
      *(_BYTE *)(a1 + 24) = 0;
LABEL_4:
      ++*(_QWORD *)(a1 + 16);
LABEL_7:
      result = *(_QWORD *)(a1 + 16) < 2uLL;
      break;
    case 16:
      *(_QWORD *)(a1 + 8) = v2 - 1;
      if (v2 != *(_QWORD *)a1)
        goto LABEL_7;
      result = 0;
      break;
    case 17:
    case 18:
    case 19:
    case 20:
    case 22:
    case 23:
    case 24:
      *(_QWORD *)(a1 + 8) = v2 + 1;
      if (v2 == *(_QWORD *)a1)
      {
        ++*(_QWORD *)(a1 + 16);
        *(_BYTE *)(a1 + 24) = a2 != 19;
      }
      goto LABEL_7;
    default:
      if (v2 != *(_QWORD *)a1)
        goto LABEL_7;
      goto LABEL_4;
  }
  return result;
}

uint64_t RB::Path::Storage::MapCache::shared(RB::Path::Storage::MapCache *this)
{
  unsigned __int8 v1;
  unint64_t v2;
  _DWORD *v4;

  v2 = 0x253EAE000uLL;
  {
    v4 = (_DWORD *)operator new();
    *v4 = 0;
    RB::UntypedTable::UntypedTable((RB::UntypedTable *)(v4 + 2), 0, 0, 0, (void (*)(void *))RB::Path::Storage::MapCache::MapCache(void)::$_0::__invoke, 0);
    RB::Path::Storage::MapCache::shared(void)::shared = (uint64_t)v4;
    v2 = 0x253EAE000;
  }
  return *(_QWORD *)(v2 + 3736);
}

uint64_t RB::Path::Storage::MapCache::apply(os_unfair_lock_s *a1, uint64_t a2, RB::Path::Storage *a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  unsigned int **v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int *v15;
  unsigned int v16;
  RB::Path::Storage *v17;
  uint64_t v18;
  unsigned int *v19;
  RB::Path::Storage *v20;
  unsigned int v21;
  unsigned int v22;
  size_t *v23;
  unsigned int v24;
  size_t v25;
  size_t v26;
  size_t *v27;
  uint64_t *v28;
  uint64_t v29;
  unsigned int *v30;
  unsigned int v31;
  unsigned int v32;
  _QWORD v34[2];
  uint64_t (**v35)(RB::Path::Mapper *__hidden);
  _DWORD v36[10];
  char v37[256];
  uint64_t v38;
  _QWORD *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int16 v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock(a1);
  v9 = RB::UntypedTable::lookup((RB::UntypedTable *)&a1[2], (uint64_t *)*(unsigned int *)(a2 + 12), 0);
  if (!v9)
    goto LABEL_13;
  v10 = (uint64_t *)v9[2];
  v11 = v9[3];
  if (!v10)
    v10 = v9;
  if (!v11)
    goto LABEL_13;
  v12 = (unsigned int **)(v10 + 1);
  v13 = 16 * v11;
  while (*(v12 - 1) != (unsigned int *)a5)
  {
    v12 += 2;
    v13 -= 16;
    if (!v13)
      goto LABEL_13;
  }
  v14 = *v12;
  if (*v12)
  {
    v15 = v14 + 2;
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
    os_unfair_lock_unlock(a1);
    v17 = (RB::Path::Storage *)(v14 + 4);
  }
  else
  {
LABEL_13:
    os_unfair_lock_unlock(a1);
    v18 = operator new();
    v14 = (unsigned int *)v18;
    *(_DWORD *)(v18 + 8) = 1;
    v19 = (unsigned int *)(v18 + 8);
    *(_QWORD *)v18 = off_24C229608;
    v20 = (RB::Path::Storage *)(v18 + 16);
    v35 = 0;
    v36[0] = 0x8000000;
    do
    {
      v21 = __ldxr(&RB::Path::Storage::_last_identifier);
      v22 = v21 + 1;
    }
    while (__stxr(v22, &RB::Path::Storage::_last_identifier));
    v36[1] = v22;
    RB::Path::Storage::Storage((RB::Path::Storage *)(v18 + 16), (const char *)0x90, (const RB::Path::Storage *)&v35);
    RB::Path::Storage::~Storage((RB::Path::Storage *)&v35);
    v34[0] = off_24C229638;
    v34[1] = v14;
    v35 = off_24C2295C8;
    RB::Heap::Heap((RB::Heap *)v36, v37, 256, 0);
    v38 = 0;
    v39 = v34;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 257;
    RB::Path::Storage::apply_elements_at_depth(a2, (uint64_t)&v35, (uint64_t (*)(uint64_t))RB::Path::Mapper::apply_callback, a5);
    RB::Path::Mapper::~Mapper((RB::Path::Mapper *)&v35);
    os_unfair_lock_lock(a1);
    v23 = (size_t *)RB::UntypedTable::lookup((RB::UntypedTable *)&a1[2], (uint64_t *)*(unsigned int *)(a2 + 12), 0);
    if (!v23)
    {
      v23 = (size_t *)operator new();
      v23[2] = 0;
      v23[3] = 0;
      v23[4] = 1;
      RB::UntypedTable::insert((size_t **)&a1[2], (size_t *)*(unsigned int *)(a2 + 12), v23);
    }
    do
      v24 = __ldxr(v19);
    while (__stxr(v24 + 1, v19));
    v25 = v23[3];
    v26 = v25 + 1;
    if (v23[4] < v25 + 1)
    {
      RB::vector<std::pair<unsigned long,RB::refcounted_ptr<RB::Path::Object>>,1ul,unsigned long>::reserve_slow(v23, v26);
      v25 = v23[3];
      v26 = v25 + 1;
    }
    v27 = (size_t *)v23[2];
    if (!v27)
      v27 = v23;
    v28 = (uint64_t *)&v27[2 * v25];
    *v28 = a5;
    v28[1] = (uint64_t)v14;
    v23[3] = v26;
    os_unfair_lock_unlock(a1);
    v17 = v20;
  }
  v29 = RB::Path::Storage::apply_elements(v17, a3);
  v30 = v14 + 2;
  do
  {
    v31 = __ldxr(v30);
    v32 = v31 - 1;
  }
  while (__stlxr(v32, v30));
  if (!v32)
  {
    __dmb(9u);
    (*(void (**)(unsigned int *))(*(_QWORD *)v14 + 8))(v14);
  }
  return v29;
}

uint64_t RB::Path::Storage::bounding_rect(void)const::$_2::__invoke(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 8) >> 3) & 1;
}

const CGPath *RB::Path::Storage::cgpath(RB::Path::Storage *this)
{
  const CGPath *result;
  unint64_t *v3;
  unint64_t v4;

  if ((*((_BYTE *)this + 8) & 1) == 0)
    return 0;
  v3 = (unint64_t *)((char *)this + 56);
  result = (const CGPath *)atomic_load((unint64_t *)this + 7);
  if (!result)
  {
    result = RBPathCopyCGPath(this, (uint64_t)&RB::Path::Storage::cgpath(void)const::callbacks);
    while (1)
    {
      v4 = __ldaxr(v3);
      if (v4)
        break;
      if (!__stlxr((unint64_t)result, v3))
        return result;
    }
    __clrex();
    CGPathRelease(result);
    return (const CGPath *)v4;
  }
  return result;
}

unsigned int *RB::Path::Object::$_7::__invoke(unsigned int *this, const void *a2)
{
  unsigned int *v2;
  unsigned int v3;
  unsigned int v4;

  v2 = this + 2;
  do
  {
    v3 = __ldxr(v2);
    v4 = v3 - 1;
  }
  while (__stlxr(v4, v2));
  if (!v4)
  {
    __dmb(9u);
    return (unsigned int *)(*(uint64_t (**)(unsigned int *))(*(_QWORD *)this + 8))(this);
  }
  return this;
}

uint64_t RB::Path::Object::$_8::__invoke(uint64_t a1, RB::Path::Storage *a2, void *a3)
{
  return RB::Path::Storage::apply_elements((RB::Path::Storage *)(a1 + 16), a2, a3);
}

BOOL RB::Path::Object::$_9::__invoke(RB::Path::Object::$_9 *this, const void *a2, const void *a3)
{
  return RB::Path::Storage::operator==((uint64_t)this + 16, (uint64_t)a2 + 16);
}

uint64_t RB::Path::Object::$_11::__invoke(RB::Path::Object::$_11 *this, const void *a2)
{
  return (*((unsigned __int8 *)this + 24) >> 3) & 1;
}

void RB::Path::Object::$_13::__invoke(RBPath this)
{
  this.info = (char *)this.info + 16;
  RB::Path::Storage::bounding_rect(this);
}

const CGPath *RB::Path::Object::$_14::__invoke(RB::Path::Object::$_14 *this, const void *a2)
{
  return RB::Path::Storage::cgpath((RB::Path::Object::$_14 *)((char *)this + 16));
}

BOOL RB::Path::Storage::decode(RB::Path::Storage *this, RB::ProtobufDecoder *a2)
{
  uint64_t field;
  _BOOL8 v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  size_t v8;
  const void *v9;
  size_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  float v14;
  void *v15;
  char *v16;
  _BYTE *v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  RB::AffineTransform *v25;
  uint64_t *v26;
  _OWORD *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  float v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  BOOL v42;
  int v43;
  int v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  unint64_t v50;
  float *v51;
  float *v52;
  float *v53;
  float *v54;
  int v55;
  int v56;
  double v57;
  uint64_t v58;
  size_t v59;
  _BYTE *v60;
  uint64_t v61;
  char *v62;
  char *v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  _BYTE *v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  void *v72;
  unint64_t v73;
  unint64_t v74;
  void **v75;
  int v76;
  _QWORD *v78;
  double *v79;
  double *v80;
  int v81;
  char v82;
  int *v83;
  unsigned int v84;
  uint64_t v85;
  uint64_t v86;
  BOOL v87;
  uint64_t v88;
  double *v89;
  uint64_t v90;
  double *v91;
  double *v92;
  _QWORD *v94;
  _QWORD v95[3];
  void *v96;
  unint64_t v97;
  unint64_t v98;
  _BYTE v99[257];
  __int128 v100;
  unint64_t v101;
  _BYTE v102[512];
  void *v103[2];
  unint64_t v104;
  _BYTE __dst[64];
  __int128 v106;
  unint64_t v107;
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  v106 = 0u;
  v107 = 64;
  *(_OWORD *)v103 = 0u;
  v104 = 64;
  v100 = 0u;
  v101 = 64;
  v96 = 0;
  v97 = 0;
  v98 = 0;
  field = RB::ProtobufDecoder::next_field(a2);
  v4 = 1;
  if (field)
  {
    v5 = field;
    do
    {
      v6 = v5 >> 3;
      switch((v5 >> 3))
      {
        case 1u:
        case 3u:
          v7 = RB::ProtobufDecoder::data_field(a2, v5);
          *((_QWORD *)&v106 + 1) = 0;
          if (v8)
          {
            v9 = (const void *)v7;
            v10 = v8;
            if (v107 < v8)
              RB::vector<unsigned char,64ul,unsigned long>::reserve_slow(__dst, v8);
            *((_QWORD *)&v106 + 1) = v10;
            if ((_QWORD)v106)
              v11 = (_BYTE *)v106;
            else
              v11 = __dst;
            memcpy(v11, v9, v10);
            if ((_DWORD)v6 == 1)
            {
              v12 = *((_QWORD *)&v106 + 1);
              v13 = (_BYTE *)v106;
              if (!(_QWORD)v106)
                v13 = __dst;
              if (*((_QWORD *)&v106 + 1))
              {
                do
                {
                  *v13++ &= 0x1Fu;
                  --v12;
                }
                while (v12);
              }
            }
          }
          break;
        case 2u:
          v14 = RB::ProtobufDecoder::float_field(a2, v5);
          v15 = v103[1];
          v16 = (char *)v103[1] + 1;
          if ((void *)v104 < (char *)v103[1] + 1)
          {
            RB::vector<objc_object *,64ul,unsigned long>::reserve_slow(v102, (size_t)v16);
            v15 = v103[1];
            v16 = (char *)v103[1] + 1;
          }
          v17 = v103[0];
          if (!v103[0])
            v17 = v102;
          *(double *)&v17[8 * (_QWORD)v15] = v14;
          v103[1] = v16;
          break;
        case 4u:
          v18 = v97;
          v19 = v97 + 1;
          if (v98 < v97 + 1)
          {
            v18 = v97;
            v19 = v97 + 1;
          }
          v20 = (char *)v96;
          v21 = (char *)v96 + 64 * v18;
          *(_DWORD *)v21 = 0;
          v97 = v19;
          if ((v5 & 7) == 2)
          {
            RB::ProtobufDecoder::begin_message(a2);
            v22 = RB::ProtobufDecoder::next_field(a2);
            if (v22)
            {
              v23 = v22;
              v24 = &v20[64 * v18];
              v25 = (RB::AffineTransform *)(v24 + 16);
              v26 = (uint64_t *)(v21 + 24);
              v27 = v24 + 32;
              v94 = v24 + 48;
              while (2)
              {
                switch((v23 >> 3))
                {
                  case 1u:
                    if (*(_DWORD *)v21)
                      goto LABEL_61;
                    *(_DWORD *)v21 = 1;
                    *(_OWORD *)v25 = xmmword_209BD5290;
                    *v27 = xmmword_209BD52A0;
                    *v94 = 0;
                    v94[1] = 0;
                    if ((v23 & 7) != 2)
                      goto LABEL_102;
                    RB::ProtobufDecoder::begin_message(a2);
                    RB::AffineTransform::decode(v25, a2);
                    goto LABEL_59;
                  case 2u:
                    if (*(_DWORD *)v21)
                      goto LABEL_61;
                    *(_DWORD *)v21 = 2;
                    *(_OWORD *)v25 = 0u;
                    *((_OWORD *)v25 + 1) = 0u;
                    if ((v23 & 7) != 2)
                      goto LABEL_102;
                    RB::ProtobufDecoder::begin_message(a2);
                    v28 = RB::ProtobufDecoder::next_field(a2);
                    if (v28)
                    {
                      v29 = v28;
                      do
                      {
                        v30 = v29 >> 3;
                        if ((v29 >> 3) == 3)
                        {
                          v32 = RB::ProtobufDecoder::float_field(a2, v29);
                          v33 = *(_QWORD *)v27;
                          v34 = *(_QWORD *)v27 + 1;
                          if (*((_QWORD *)v21 + 5) < v34)
                          {
                            RB::vector<unsigned long,0ul,unsigned long>::reserve_slow((uint64_t)(v21 + 24), v34);
                            v33 = *(_QWORD *)v27;
                            v34 = *(_QWORD *)v27 + 1;
                          }
                          *(double *)(*v26 + 8 * v33) = v32;
                          *(_QWORD *)v27 = v34;
                        }
                        else if ((_DWORD)v30 == 2)
                        {
                          v35 = RB::ProtobufDecoder::uint_field(a2, v29);
                          if (v35 <= 2)
                            *((_DWORD *)v21 + 5) = v35;
                        }
                        else if ((_DWORD)v30 == 1)
                        {
                          v31 = RB::ProtobufDecoder::uint_field(a2, v29);
                          if (v31 <= 6)
                            *(_DWORD *)v25 = v31;
                        }
                        else
                        {
                          RB::ProtobufDecoder::skip_field(a2, v29);
                        }
                        v29 = RB::ProtobufDecoder::next_field(a2);
                      }
                      while (v29);
                    }
                    goto LABEL_59;
                  case 3u:
                    if (*(_DWORD *)v21)
                      goto LABEL_61;
                    *(_DWORD *)v21 = 3;
                    if ((v23 & 7) != 2)
                      goto LABEL_102;
                    RB::ProtobufDecoder::begin_message(a2);
                    v36 = RB::ProtobufDecoder::next_field(a2);
                    if (v36)
                    {
                      v37 = v36;
                      do
                      {
                        if ((v37 >> 3) == 2)
                        {
                          v21[17] = RB::ProtobufDecoder::BOOL_field(a2, v37);
                        }
                        else if ((v37 >> 3) == 1)
                        {
                          v38 = RB::ProtobufDecoder::uint_field(a2, v37);
                          if (v38 <= 6)
                            *(_BYTE *)v25 = v38;
                        }
                        else
                        {
                          RB::ProtobufDecoder::skip_field(a2, v37);
                        }
                        v37 = RB::ProtobufDecoder::next_field(a2);
                      }
                      while (v37);
                    }
                    goto LABEL_59;
                  case 4u:
                    if (*(_DWORD *)v21)
                      goto LABEL_61;
                    *(_DWORD *)v21 = 4;
                    *(_QWORD *)v25 = 0x100000000;
                    *((_QWORD *)v21 + 4) = 0;
                    *((_QWORD *)v21 + 5) = 0;
                    *v26 = 0;
                    if ((v23 & 7) == 2)
                    {
                      RB::ProtobufDecoder::begin_message(a2);
                      v39 = RB::ProtobufDecoder::next_field(a2);
                      if (v39)
                      {
                        v40 = v39;
                        do
                        {
                          switch((v40 >> 3))
                          {
                            case 1u:
                              v41 = RB::ProtobufDecoder::uint_field(a2, v40);
                              if (v41 <= 6)
                                *((_DWORD *)v21 + 5) = v41;
                              break;
                            case 2u:
                              v42 = RB::ProtobufDecoder::BOOL_field(a2, v40) == 0;
                              v43 = 4;
                              goto LABEL_93;
                            case 3u:
                              v44 = *(_DWORD *)v25 | RB::ProtobufDecoder::BOOL_field(a2, v40);
                              goto LABEL_97;
                            case 4u:
                              v42 = RB::ProtobufDecoder::BOOL_field(a2, v40) == 0;
                              v43 = 2;
                              goto LABEL_93;
                            case 5u:
                              v45 = *(_QWORD *)v27;
                              v46 = *(_QWORD *)v27 + 1;
                              if (*((_QWORD *)v21 + 5) < v46)
                              {
                                RB::vector<RB::Fill::Gradient::Stop,0ul,unsigned long>::reserve_slow((uint64_t)(v21 + 24), v46);
                                v45 = *(_QWORD *)v27;
                                v46 = *(_QWORD *)v27 + 1;
                              }
                              v47 = *v26;
                              v48 = (_QWORD *)(*v26 + 16 * v45);
                              *v48 = 0;
                              v48[1] = 0;
                              *(_QWORD *)v27 = v46;
                              if ((v40 & 7) == 2)
                              {
                                RB::ProtobufDecoder::begin_message(a2);
                                v49 = RB::ProtobufDecoder::next_field(a2);
                                if (v49)
                                {
                                  v50 = v49;
                                  v51 = (float *)(v47 + 16 * v45);
                                  v52 = v51 + 3;
                                  v53 = v51 + 2;
                                  v54 = v51 + 1;
                                  do
                                  {
                                    switch((v50 >> 3))
                                    {
                                      case 1u:
                                        *v54 = RB::ProtobufDecoder::float_field(a2, v50);
                                        break;
                                      case 2u:
                                        *v53 = RB::ProtobufDecoder::float_field(a2, v50);
                                        break;
                                      case 3u:
                                        *v52 = RB::ProtobufDecoder::float_field(a2, v50);
                                        break;
                                      case 4u:
                                        v55 = *(_DWORD *)v48 | RB::ProtobufDecoder::BOOL_field(a2, v50);
                                        goto LABEL_88;
                                      case 5u:
                                        if (RB::ProtobufDecoder::BOOL_field(a2, v50))
                                          v56 = 2;
                                        else
                                          v56 = 0;
                                        v55 = *(_DWORD *)v48 | v56;
LABEL_88:
                                        *(_DWORD *)v48 = v55;
                                        break;
                                      default:
                                        RB::ProtobufDecoder::skip_field(a2, v50);
                                        break;
                                    }
                                    v50 = RB::ProtobufDecoder::next_field(a2);
                                  }
                                  while (v50);
                                }
                                RB::ProtobufDecoder::end_message((uint64_t)a2);
                              }
                              else
                              {
                                *((_BYTE *)a2 + 56) = 1;
                                *(_QWORD *)a2 = *((_QWORD *)a2 + 1);
                              }
                              break;
                            case 6u:
                              v42 = RB::ProtobufDecoder::BOOL_field(a2, v40) == 0;
                              v43 = 8;
LABEL_93:
                              if (v42)
                                v43 = 0;
                              v44 = *(_DWORD *)v25 | v43;
LABEL_97:
                              *(_DWORD *)v25 = v44;
                              break;
                            default:
                              RB::ProtobufDecoder::skip_field(a2, v40);
                              break;
                          }
                          v40 = RB::ProtobufDecoder::next_field(a2);
                        }
                        while (v40);
                      }
LABEL_59:
                      RB::ProtobufDecoder::end_message((uint64_t)a2);
                    }
                    else
                    {
LABEL_102:
                      *((_BYTE *)a2 + 56) = 1;
                      *(_QWORD *)a2 = *((_QWORD *)a2 + 1);
                    }
LABEL_62:
                    v23 = RB::ProtobufDecoder::next_field(a2);
                    if (!v23)
                      break;
                    continue;
                  default:
LABEL_61:
                    RB::ProtobufDecoder::skip_field(a2, v23);
                    goto LABEL_62;
                }
                break;
              }
            }
            RB::ProtobufDecoder::end_message((uint64_t)a2);
          }
          else
          {
            *((_BYTE *)a2 + 56) = 1;
            *(_QWORD *)a2 = *((_QWORD *)a2 + 1);
          }
          break;
        case 5u:
          v57 = RB::ProtobufDecoder::double_field(a2, v5);
          v58 = *((_QWORD *)&v100 + 1);
          v59 = *((_QWORD *)&v100 + 1) + 1;
          if (v101 < *((_QWORD *)&v100 + 1) + 1)
          {
            RB::vector<objc_object *,64ul,unsigned long>::reserve_slow(v99, v59);
            v58 = *((_QWORD *)&v100 + 1);
            v59 = *((_QWORD *)&v100 + 1) + 1;
          }
          v60 = (_BYTE *)v100;
          if (!(_QWORD)v100)
            v60 = v99;
          *(double *)&v60[8 * v58] = v57;
          *((_QWORD *)&v100 + 1) = v59;
          break;
        default:
          RB::ProtobufDecoder::skip_field(a2, v5);
          break;
      }
      v5 = RB::ProtobufDecoder::next_field(a2);
    }
    while (v5);
    v61 = *((_QWORD *)&v106 + 1);
    v62 = (_QWORD)v106 ? (char *)v106 : __dst;
    v4 = 1;
    if (*((_QWORD *)&v106 + 1))
    {
      v63 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v67 = *((_QWORD *)&v106 + 1);
      v68 = v62;
      do
      {
        v69 = *v68 & 0x3F;
        if ((*v68 & 0x3Fu) > 0x18)
        {
LABEL_140:
          v4 = 0;
          goto LABEL_141;
        }
        if ((*v68 & 0x80) != 0)
        {
          v70 = 0;
          switch(*v68 & 0x3F)
          {
            case 0x10:
            case 0x12:
            case 0x16:
            case 0x17:
              break;
            case 0x11:
            case 0x15:
              goto LABEL_122;
            case 0x13:
              v70 = 2;
              break;
            case 0x14:
              v70 = 3;
              break;
            case 0x18:
              v70 = 4;
              break;
            default:
              if ((_DWORD)v69 != 4)
LABEL_122:
                v70 = 1;
              break;
          }
          if (v66 >= v97 || *((_DWORD *)v96 + 16 * v66) != v70)
            goto LABEL_140;
          ++v66;
        }
        v71 = __RBPathElementArgumentCount[v69];
        if ((*v68 & 0x40) != 0)
        {
          v64 += v71;
          if (v64 > *((_QWORD *)&v100 + 1))
            goto LABEL_140;
        }
        else
        {
          v63 += v71;
          if (v63 > v103[1])
            goto LABEL_140;
        }
        if (v69 <= 0x18)
        {
          if (((1 << v69) & 0x1DE0000) != 0)
          {
            ++v65;
          }
          else if ((_DWORD)v69 == 16)
          {
            if (!v65)
              goto LABEL_140;
            --v65;
          }
        }
        ++v68;
        --v67;
      }
      while (v67);
      v4 = v65 == 0;
      if (!v65)
      {
        v78 = v96;
        v79 = (double *)v100;
        if (!(_QWORD)v100)
          v79 = (double *)v99;
        v80 = (double *)v103[0];
        if (!v103[0])
          v80 = (double *)v102;
        do
        {
          v81 = *v62;
          v82 = *v62;
          if (v81 < 0)
          {
            v84 = v82 & 0x3F;
            if (v84 == 24 || v84 == 19)
            {
              v95[0] = v78[2];
              v85 = v78[3];
              v95[1] = v78[4];
              v95[2] = v85;
              v83 = (int *)v95;
            }
            else
            {
              v83 = (int *)(v78 + 2);
            }
            v78 += 8;
          }
          else
          {
            v83 = 0;
            v84 = v81 & 0xFFFFFFBF;
          }
          if (v84 > 0x18)
            v86 = 0;
          else
            v86 = __RBPathElementArgumentCount[v84];
          v87 = (v82 & 0x40) == 0;
          if ((v82 & 0x40) != 0)
            v88 = 0;
          else
            v88 = v86;
          v89 = &v80[v88];
          if (v87)
            v90 = 0;
          else
            v90 = v86;
          v91 = &v79[v90];
          if (v87)
            v92 = v80;
          else
            v92 = v79;
          RB::Path::Storage::append_element(this, (const char *)v84, v92, v83);
          ++v62;
          v79 = v91;
          v80 = v89;
          --v61;
        }
        while (v61);
        v4 = 1;
      }
    }
  }
LABEL_141:
  v72 = v96;
  v73 = v97;
  if (v97)
  {
    v74 = 0;
    v75 = (void **)((char *)v96 + 24);
    do
    {
      v76 = *((_DWORD *)v75 - 6);
      if ((v76 == 4 || v76 == 2) && *v75)
      {
        free(*v75);
        v73 = v97;
      }
      ++v74;
      v75 += 8;
    }
    while (v74 < v73);
    v72 = v96;
  }
  if (v72)
    free(v72);
  if ((_QWORD)v100)
    free((void *)v100);
  if (v103[0])
    free(v103[0]);
  if ((_QWORD)v106)
    free((void *)v106);
  return v4;
}

void RB::Path::Storage::MapCache::remove(os_unfair_lock_s *this, const RB::Path::Storage *a2)
{
  os_unfair_lock_lock(this);
  RB::UntypedTable::remove((RB::UntypedTable *)&this[2], (void *)*((unsigned int *)a2 + 3));
  os_unfair_lock_unlock(this);
}

uint64_t RBPathStorageGetBezierOrder(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(a1 + 8);
  v2 = 1;
  if ((v1 & 2) != 0)
    v2 = 2;
  if ((v1 & 4) != 0)
    return 3;
  else
    return v2;
}

_QWORD *RB::Path::Storage::MapCache::MapCache(void)::$_0::__invoke(_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v4;
  unsigned int *v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;

  if (result)
  {
    v1 = result;
    v2 = (_QWORD *)result[2];
    if (v2)
      v3 = v2;
    else
      v3 = v1;
    if (v1[3])
    {
      v4 = 0;
      do
      {
        v5 = (unsigned int *)v3[2 * v4 + 1];
        if (v5)
        {
          v6 = v5 + 2;
          do
          {
            v7 = __ldxr(v6);
            v8 = v7 - 1;
          }
          while (__stlxr(v8, v6));
          if (!v8)
          {
            __dmb(9u);
            (*(void (**)(unsigned int *))(*(_QWORD *)v5 + 8))(v5);
          }
        }
        ++v4;
      }
      while (v4 < v1[3]);
      v2 = (_QWORD *)v1[2];
    }
    if (v2)
      free(v2);
    JUMPOUT(0x20BD16544);
  }
  return result;
}

_DWORD *RB::Path::Storage::MapCache::Destination::closepath(RB::Path::Storage::MapCache::Destination *this)
{
  return RB::Path::Storage::append_element((RB::Path::Storage *)(*((_QWORD *)this + 1) + 16), (const char *)4, 0, 0);
}

_DWORD *RB::Path::Storage::MapCache::Destination::moveto(uint64_t a1, __n128 a2)
{
  __n128 v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  return RB::Path::Storage::append_element((RB::Path::Storage *)(*(_QWORD *)(a1 + 8) + 16), 0, v3.n128_f64, 0);
}

_DWORD *RB::Path::Storage::MapCache::Destination::lineto(uint64_t a1, __n128 a2)
{
  __n128 v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  return RB::Path::Storage::append_element((RB::Path::Storage *)(*(_QWORD *)(a1 + 8) + 16), (const char *)1, v3.n128_f64, 0);
}

_DWORD *RB::Path::Storage::MapCache::Destination::quadto(uint64_t a1, __n128 a2, __n128 a3)
{
  _OWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v4[0] = a2;
  v4[1] = a3;
  return RB::Path::Storage::append_element((RB::Path::Storage *)(*(_QWORD *)(a1 + 8) + 16), (const char *)2, (double *)v4, 0);
}

_DWORD *RB::Path::Storage::MapCache::Destination::cubeto(uint64_t a1, __n128 a2, __n128 a3, __n128 a4)
{
  _OWORD v5[3];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  return RB::Path::Storage::append_element((RB::Path::Storage *)(*(_QWORD *)(a1 + 8) + 16), (const char *)3, (double *)v5, 0);
}

uint64_t RB::Path::NestedCallbacks::NestedCallbacks(RBPathCallbacks const*,unsigned long)::$_0::__invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t result;
  _QWORD v6[4];
  char v7;

  v6[0] = a2;
  v6[1] = a3;
  v4 = *(_QWORD *)(a4 + 88);
  v6[2] = *(_QWORD *)(a4 + 96);
  v6[3] = 0;
  v7 = 0;
  LODWORD(result) = (*(uint64_t (**)(uint64_t, _QWORD *, uint64_t (*)(uint64_t, unsigned int)))(v4 + 24))(a1, v6, RB::Path::NestedCallbacks::apply_elements_callback);
  if (v7)
    return 1;
  else
    return result;
}

BOOL RB::Path::NestedCallbacks::NestedCallbacks(RBPathCallbacks const*,unsigned long)::$_1::__invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v4[2];
  uint64_t v5;
  char v6;

  v6 = 0;
  v4[1] = 0;
  v5 = 0;
  v2 = *(_QWORD *)(a2 + 88);
  v4[0] = *(_QWORD *)(a2 + 96);
  (*(void (**)(uint64_t, _QWORD *, BOOL (*)(uint64_t, int)))(v2 + 24))(a1, v4, RB::Path::NestedCallbacks::single_element_callback);
  return v5 == 1;
}

uint64_t RB::Path::NestedCallbacks::NestedCallbacks(RBPathCallbacks const*,unsigned long)::$_2::__invoke(uint64_t a1, uint64_t a2)
{
  return RBPathGetBezierOrder(a1, *(_QWORD *)(a2 + 88));
}

uint64_t RB::Path::NestedCallbacks::NestedCallbacks(RBPathCallbacks const*,unsigned long)::$_3::__invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  RB::Path::NestedCallbacks::get(*(RB::Path::NestedCallbacks **)(a2 + 88), (const RBPathCallbacks *)(*(_QWORD *)(a2 + 96) + 1), a3);
  return a1;
}

void *RB::vector<RB::Path::`anonymous namespace'::Transform,0ul,unsigned long>::reserve_slow(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  void *result;

  if (*(_QWORD *)(a1 + 16) + (*(_QWORD *)(a1 + 16) >> 1) <= a2)
    v3 = a2;
  else
    v3 = *(_QWORD *)(a1 + 16) + (*(_QWORD *)(a1 + 16) >> 1);
  result = RB::details::realloc_vector<unsigned long,64ul>(*(void **)a1, (size_t *)(a1 + 16), v3);
  *(_QWORD *)a1 = result;
  return result;
}

void *RB::details::realloc_vector<unsigned long,64ul>(void *a1, size_t *a2, uint64_t a3)
{
  void *v4;
  size_t v5;
  size_t v6;
  void *v7;
  const char *v8;

  v4 = a1;
  if (a3)
  {
    v5 = malloc_good_size(a3 << 6);
    v6 = v5 >> 6;
    if (v5 >> 6 != *a2)
    {
      v7 = malloc_type_realloc(v4, v5, 0x2F8905C9uLL);
      if (!v7)
        RB::precondition_failure((RB *)"allocation failure", v8);
      v4 = v7;
      *a2 = v6;
    }
  }
  else
  {
    *a2 = 0;
    free(a1);
    return 0;
  }
  return v4;
}

void *RB::vector<std::pair<unsigned long,RB::refcounted_ptr<RB::Path::Object>>,1ul,unsigned long>::reserve_slow(void *__dst, size_t a2)
{
  size_t v3;
  void *result;

  if (*((_QWORD *)__dst + 4) + (*((_QWORD *)__dst + 4) >> 1) <= a2)
    v3 = a2;
  else
    v3 = *((_QWORD *)__dst + 4) + (*((_QWORD *)__dst + 4) >> 1);
  result = RB::details::realloc_vector<unsigned long,16ul>(*((void **)__dst + 2), __dst, 1uLL, (size_t *)__dst + 4, v3);
  *((_QWORD *)__dst + 2) = result;
  return result;
}

uint64_t CG::offset::offset(uint64_t result, uint64_t a2, double a3, double a4)
{
  double v4;
  double v5;

  *(_QWORD *)result = off_24C222F48;
  *(double *)(result + 8) = a4;
  *(double *)(result + 16) = a3;
  *(_QWORD *)(result + 32) = a2;
  *(_DWORD *)(result + 40) = 0;
  v4 = a3 * 0.1;
  if (a3 * 0.1 < 0.001)
    v4 = 0.001;
  if (a3 <= 0.0)
    v5 = 0.1;
  else
    v5 = v4;
  *(_OWORD *)(result + 48) = 0u;
  *(_OWORD *)(result + 64) = 0u;
  *(_OWORD *)(result + 80) = 0u;
  *(_OWORD *)(result + 96) = 0u;
  *(_OWORD *)(result + 112) = 0u;
  *(_OWORD *)(result + 128) = 0u;
  *(_OWORD *)(result + 144) = 0u;
  *(double *)(result + 24) = v5;
  return result;
}

__n128 CG::offset::moveto(__n128 *a1, __n128 a2)
{
  __n128 result;

  a1[2].n128_u32[2] = 2;
  a1[9] = a2;
  result = a1[9];
  a1[6] = result;
  a1[3] = result;
  return result;
}

__n128 CG::offset::lineto(__n128 *a1, __n128 result)
{
  __int32 v2;
  __n128 *v3;
  __n128 *v4;

  v2 = a1[2].n128_i32[2];
  if (v2)
  {
    if (v2 == 1)
      a1[2].n128_u32[2] = 2;
    a1[9] = result;
    v3 = a1 + 9;
    v4 = a1 + 6;
    if (CG::offset::add_line_segment(a1, (const Point *)&a1[6], (const Point *)&a1[9]))
    {
      result = *v3;
      *v4 = *v3;
    }
  }
  return result;
}

BOOL CG::offset::add_line_segment(__n128 *this, const Point *a2, const Point *a3)
{
  float64x2_t v4;
  double v5;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  __n128 v13;
  __n128 v14;
  __n128 v15;
  float64x2_t v17;
  __n128 v18;

  v4 = vsubq_f64(*(float64x2_t *)&a3->v, *(float64x2_t *)&a2->v);
  v5 = vaddvq_f64(vmulq_f64(v4, v4));
  if (v5 <= 0.00000001)
  {
    if (this[2].n128_u32[2] == 2)
      this[2].n128_u32[2] = 3;
  }
  else
  {
    v7 = v4.f64[1];
    if (v4.f64[0] == 0.0 && v4.f64[1] == 0.0)
    {
      v8 = v4.f64[0];
    }
    else
    {
      v9 = sqrt(v5);
      v8 = v4.f64[0] / v9;
      v7 = v4.f64[1] / v9;
    }
    v18.n128_f64[0] = v8;
    v18.n128_f64[1] = v7;
    v10 = this->n128_f64[1];
    v11 = -(v7 * v10);
    v12 = v10 * v8;
    if (this[2].n128_u32[2] == 4)
    {
      v17 = v4;
      CG::offset::add_join((uint64_t)this, (double *)&a2->v, (uint64_t)a3, v18.n128_f64);
      v13 = v18;
      this[7] = (__n128)v17;
      this[8] = v13;
    }
    else
    {
      this[2].n128_u32[2] = 4;
      v14 = v18;
      this[7] = (__n128)v4;
      this[8] = v14;
      this[4] = (__n128)v4;
      this[5] = v14;
      v14.n128_f64[0] = *(double *)&a2->v + v11;
      v14.n128_f64[1] = *(double *)&a2[2].v + v12;
      (*(void (**)(unint64_t, __n128))(*(_QWORD *)this[2].n128_u64[0] + 16))(this[2].n128_u64[0], v14);
    }
    v15.n128_f64[0] = *(double *)&a3->v + v11;
    v15.n128_f64[1] = *(double *)&a3[2].v + v12;
    (*(void (**)(unint64_t, __n128))(*(_QWORD *)this[2].n128_u64[0] + 24))(this[2].n128_u64[0], v15);
  }
  return v5 > 0.00000001;
}

float64x2_t CG::offset::quadto(Point *a1, float64x2_t result, float64x2_t a3)
{
  Point v3;
  float64x2_t *v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8[7];
  Point v9[4];
  Point v10[4];

  v3 = a1[10];
  if (v3)
  {
    if (v3 == 1)
      a1[10] = (Point)2;
    *(float64x2_t *)&a1[36].v = a3;
    v5 = (float64x2_t *)&a1[36];
    v6 = (float64x2_t)vdupq_n_s64(0x3FD5555555555555uLL);
    v7 = vmlaq_f64(result, v6, vsubq_f64(*(float64x2_t *)&a1[24].v, result));
    *(float64x2_t *)&v9[0].v = vmlaq_f64(result, v6, vsubq_f64(a3, result));
    *(float64x2_t *)&v10[0].v = v7;
    CG::Cubic::Cubic((CG::Cubic *)v8, a1 + 24, v10, v9, a1 + 36);
    if (CG::offset::add_cubic_segment((CG::offset *)a1, v8))
    {
      result = *v5;
      *(float64x2_t *)&a1[24].v = *v5;
    }
  }
  return result;
}

uint64_t CG::offset::add_cubic_segment(CG::offset *this, float64x2_t *a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __n128 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CG::offset *v24;
  float64x2_t *v25;
  uint64_t result;
  float64x2_t v27[7];
  uint64_t v28;
  float64x2_t v29[7];
  float64x2_t v30[7];
  __int128 v31;

  v4 = a2[1].f64[0];
  v5 = a2[1].f64[1];
  if ((v4 - a2->f64[0]) * (v4 - a2->f64[0]) + (v5 - a2->f64[1]) * (v5 - a2->f64[1]) <= 0.00000001
    && (v6 = a2[2].f64[0], v7 = a2[2].f64[1], (v6 - v4) * (v6 - v4) + (v7 - v5) * (v7 - v5) <= 0.00000001)
    && (a2[3].f64[0] - v6) * (a2[3].f64[0] - v6) + (a2[3].f64[1] - v7) * (a2[3].f64[1] - v7) <= 0.00000001)
  {
    if (*((_DWORD *)this + 10) == 2)
    {
      result = 0;
      *((_DWORD *)this + 10) = 3;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v9 = CG::Cubic::derivative((CG::Cubic *)a2, 0.0);
    if (v9 != 0.0 || (v11 = v9, v12 = v10, v10 != 0.0))
    {
      v13 = sqrt(v9 * v9 + v10 * v10);
      v11 = v9 / v13;
      v12 = v10 / v13;
    }
    *(double *)&v31 = v11;
    *((double *)&v31 + 1) = v12;
    if (*((_DWORD *)this + 10) == 4)
    {
      v29[0] = *a2;
      CG::offset::add_join((uint64_t)this, v29[0].f64, v8, (double *)&v31);
    }
    else
    {
      *((_DWORD *)this + 10) = 4;
      *((double *)this + 8) = v9;
      *((double *)this + 9) = v10;
      *((_OWORD *)this + 5) = v31;
      v14 = *((double *)this + 1);
      v15.n128_f64[0] = a2->f64[0] - v14 * v12;
      v15.n128_f64[1] = a2->f64[1] + v14 * v11;
      (*(void (**)(_QWORD, __n128))(**((_QWORD **)this + 4) + 16))(*((_QWORD *)this + 4), v15);
    }
    v16 = CG::Cubic::derivative((CG::Cubic *)a2, 1.0);
    *((double *)this + 14) = v16;
    *((double *)this + 15) = v17;
    if (v16 != 0.0 || v17 != 0.0)
    {
      v18 = sqrt(v16 * v16 + v17 * v17);
      v16 = v16 / v18;
      v17 = v17 / v18;
    }
    *((double *)this + 16) = v16;
    *((double *)this + 17) = v17;
    v19 = a2[1].f64[0];
    if (((a2[2].f64[0] - a2[3].f64[0]) * (a2[2].f64[1] - a2[1].f64[1])
        + (a2[3].f64[1] - a2[2].f64[1]) * (a2[2].f64[0] - v19))
       * ((a2[2].f64[0] - v19) * (a2->f64[1] - a2[1].f64[1]) + (a2[2].f64[1] - a2[1].f64[1]) * (v19 - a2->f64[0])) > 0.0
      || (v20 = CG::Cubic::inflection_points_classic((CG::Cubic *)a2), v22 = v20, v23 = v21, v20 == -1.0) && v21 == -1.0)
    {
      v24 = this;
      v25 = a2;
    }
    else
    {
      CG::Cubic::split(a2, v20, v29);
      CG::offset::path_offset_round_cube(this, v29);
      if (v23 == -1.0)
      {
        v25 = v30;
      }
      else
      {
        CG::Cubic::split(v30, (v23 - v22) / (1.0 - v22), v27);
        CG::offset::path_offset_round_cube(this, v27);
        v25 = (float64x2_t *)&v28;
      }
      v24 = this;
    }
    CG::offset::path_offset_round_cube(v24, v25);
    return 1;
  }
  return result;
}

__n128 CG::offset::cubeto(uint64_t a1, __n128 result, __n128 a3, __n128 a4)
{
  int v4;
  __n128 *v6;
  float64x2_t v7[7];
  Point v8[4];
  Point v9[4];

  v4 = *(_DWORD *)(a1 + 40);
  if (v4)
  {
    if (v4 == 1)
      *(_DWORD *)(a1 + 40) = 2;
    *(__n128 *)&v8[0].v = a3;
    *(__n128 *)&v9[0].v = result;
    *(__n128 *)(a1 + 144) = a4;
    v6 = (__n128 *)(a1 + 144);
    CG::Cubic::Cubic((CG::Cubic *)v7, (const Point *)(a1 + 96), v9, v8, (const Point *)(a1 + 144));
    if (CG::offset::add_cubic_segment((CG::offset *)a1, v7))
    {
      result = *v6;
      *(__n128 *)(a1 + 96) = *v6;
    }
  }
  return result;
}

__n128 CG::offset::closepath(CG::offset *this)
{
  unsigned int v1;
  uint64_t v3;
  __n128 result;

  v1 = *((_DWORD *)this + 10);
  if (v1 >= 2)
  {
    if (v1 == 4)
    {
      CG::offset::add_line_segment((__n128 *)this, (const Point *)this + 24, (const Point *)this + 12);
      CG::offset::add_join((uint64_t)this, (double *)this + 6, v3, (double *)this + 10);
      (*(void (**)(_QWORD))(**((_QWORD **)this + 4) + 8))(*((_QWORD *)this + 4));
    }
    *((_DWORD *)this + 10) = 1;
    result = *((__n128 *)this + 3);
    *((__n128 *)this + 6) = result;
    *((__n128 *)this + 9) = result;
  }
  return result;
}

uint64_t CG::offset::add_join(uint64_t result, double *a2, uint64_t a3, double *a4)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  __n128 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __n128 v22;
  __n128 v23;
  __n128 v24;

  v5 = *(double *)(result + 128);
  v4 = *(double *)(result + 136);
  v7 = *a4;
  v6 = a4[1];
  if (v6 * v4 + *a4 * v5 <= 0.99)
  {
    v8 = *(double *)(result + 8);
    v9 = -(v6 * v8);
    v10 = v8 * v7;
    if (-(v4 * v8 - v6 * v8) * -(v4 * v8 - v6 * v8) + -(v8 * v7 - v8 * v5) * -(v8 * v7 - v8 * v5) >= 0.05)
    {
      v12 = v7 + v5;
      v13 = v4 + v6;
      v14 = sqrt(v12 * v12 + v13 * v13);
      if (v14 >= 0.001)
      {
        v16 = 2.66666667 / v14;
        if (vabdd_f64(v4, v6) <= vabdd_f64(v5, v7))
          v15 = (1.33333333 - v16) * v13 / (v5 - v7);
        else
          v15 = (v16 + -1.33333333) * v12 / (v4 - v6);
      }
      else
      {
        v15 = -1.33333333;
      }
      v17 = v5 + v15 * v4;
      v18 = -(v4 - v15 * v5);
      v19 = v7 - v15 * v6;
      v20 = v6 + v15 * v7;
      v21 = a2[1];
      v22.n128_f64[0] = *a2 + v18 * v8;
      v22.n128_f64[1] = v21 + v17 * v8;
      v23.n128_f64[0] = *a2 - v20 * v8;
      v23.n128_f64[1] = v21 + v19 * v8;
      v24.n128_f64[0] = *a2 + v9;
      v24.n128_f64[1] = v21 + v10;
      return (*(uint64_t (**)(_QWORD, __n128, __n128, __n128))(**(_QWORD **)(result + 32) + 40))(*(_QWORD *)(result + 32), v22, v23, v24);
    }
    else
    {
      v11.n128_f64[0] = *a2 - v6 * v8;
      v11.n128_f64[1] = a2[1] + v10;
      return (*(uint64_t (**)(_QWORD, __n128))(**(_QWORD **)(result + 32) + 24))(*(_QWORD *)(result + 32), v11);
    }
  }
  return result;
}

uint64_t CG::offset::endpath(CG::offset *this)
{
  return (***((uint64_t (****)(_QWORD))this + 4))(*((_QWORD *)this + 4));
}

double CG::offset::offset_normal(uint64_t a1, CG::Cubic *this, double *a3, double a4)
{
  double v6;
  double v7;
  double v8;

  v6 = CG::Cubic::derivative(this, a4);
  if (a3)
  {
    *a3 = v6;
    a3[1] = v7;
  }
  v8 = -v7;
  if (v7 != 0.0 || v6 != 0.0)
    v8 = v8 / sqrt(v7 * v7 + v6 * v6);
  return *(double *)(a1 + 8) * v8;
}

uint64_t CG::offset::path_offset_round_cube_offset(CG::offset *this, float64x2_t *a2, int a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float64x2_t *v24;
  float64x2_t *v25;
  BOOL v26;
  int v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  BOOL v36;
  _BOOL4 v37;
  __n128 v39;
  double v40;
  float64x2_t v41;
  __int128 v42;
  uint64_t v43;
  Point v44[2];
  double v45;
  float64x2_t v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  Point v55[4];
  char v56[8];
  uint64_t v57;
  Point v58[4];
  char v59[8];
  uint64_t v60;
  float64x2_t v61;
  __int128 v62;
  Point v63[4];
  __int128 v64;
  Point v65[4];
  __int128 v66;

  v5 = a2[3].f64[0];
  v6 = a2[3].f64[1];
  v7 = a2->f64[0];
  v8 = a2->f64[1];
  if ((v5 - a2->f64[0]) * (v5 - a2->f64[0]) + (v6 - v8) * (v6 - v8) <= 0.00000001)
  {
    v39.n128_f64[0] = CG::offset::offset_normal((uint64_t)this, (CG::Cubic *)a2, 0, 1.0) + v5;
    v39.n128_f64[1] = v40 + v6;
    return (*(uint64_t (**)(_QWORD, __n128))(**((_QWORD **)this + 4) + 24))(*((_QWORD *)this + 4), v39);
  }
  else
  {
    v66 = 0uLL;
    v10 = CG::offset::offset_normal((uint64_t)this, (CG::Cubic *)a2, (double *)&v66, 0.0) + v7;
    v12 = v11 + v8;
    *(double *)&v65[0].v = v10;
    *(double *)&v65[2].v = v11 + v8;
    v64 = 0uLL;
    v13 = a2[3].f64[0];
    v14 = a2[3].f64[1];
    v15 = CG::offset::offset_normal((uint64_t)this, (CG::Cubic *)a2, (double *)&v64, 1.0) + v13;
    v17 = v16 + v14;
    *(double *)&v63[0].v = v15;
    *(double *)&v63[2].v = v16 + v14;
    v62 = 0uLL;
    v18 = CG::Cubic::evaluate(a2, 0.5);
    v20 = v19;
    v21 = CG::offset::offset_normal((uint64_t)this, (CG::Cubic *)a2, (double *)&v62, 0.5) + v18;
    v23 = v22 + v20;
    v61.f64[0] = v21 + -(v10 + v15 - v21 * 2.0) * 0.166666667;
    v61.f64[1] = v22 + v20 + -(v12 + v17 - (v22 + v20) * 2.0) * 0.166666667;
    v41 = *(float64x2_t *)&v65[0].v;
    v42 = v66;
    v46 = v61;
    v47 = v62;
    CG::intersection(v41.f64, v46.f64, (uint64_t)v59);
    if (v59[0])
      v24 = (float64x2_t *)&v60;
    else
      v24 = &v61;
    *(float64x2_t *)&v58[0].v = *v24;
    v41 = *(float64x2_t *)&v63[0].v;
    v42 = v64;
    v46 = v61;
    v47 = v62;
    CG::intersection(v41.f64, v46.f64, (uint64_t)v56);
    if (v56[0])
      v25 = (float64x2_t *)&v57;
    else
      v25 = &v61;
    *(float64x2_t *)&v55[0].v = *v25;
    v26 = __OFSUB__(a3, 1);
    v27 = a3 - 1;
    if (v27 < 0 != v26)
    {
      return (*(uint64_t (**)(_QWORD, __n128, __n128, __n128))(**((_QWORD **)this + 4) + 40))(*((_QWORD *)this + 4), *(__n128 *)&v58[0].v, *(__n128 *)&v55[0].v, *(__n128 *)&v63[0].v);
    }
    else
    {
      CG::Cubic::Cubic((CG::Cubic *)&v46, v65, v58, v55, v63);
      v28 = 0;
      while (1)
      {
        v29 = *(double *)&CG::offset::path_offset_round_cube_offset(CG::Cubic const&,int)::samples[v28];
        v30 = v23;
        v31 = v21;
        if (v28 * 8)
        {
          v32 = CG::Cubic::evaluate(a2, *(double *)&CG::offset::path_offset_round_cube_offset(CG::Cubic const&,int)::samples[v28]);
          v34 = v33;
          v31 = CG::offset::offset_normal((uint64_t)this, (CG::Cubic *)a2, 0, v29) + v32;
          v30 = v35 + v34;
        }
        *(double *)&v44[0].v = v31;
        v45 = v30;
        v36 = (*(_QWORD *)&v31 & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000
           && (*(_QWORD *)&v30 & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000;
        v37 = v36;
        if ((*(_QWORD *)&v46.f64[0] & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
          && (*(_QWORD *)&v46.f64[1] & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
          && ((unint64_t)v47 & 0x7FFFFFFFFFFFFFFFLL) <= 0x7FEFFFFFFFFFFFFFLL
          && (*((_QWORD *)&v47 + 1) & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
          && (v48 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
          && (v49 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
          && (v50 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
          && (v51 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
          && (v52 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
          && (v53 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
          && v37
          && (v54 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
          && (CG::Cubic::is_near(&v46, v44, v29, *((double *)this + 3)) & 1) == 0)
        {
          break;
        }
        if (++v28 == 5)
          return (*(uint64_t (**)(_QWORD, __n128, __n128, __n128))(**((_QWORD **)this + 4) + 40))(*((_QWORD *)this + 4), *(__n128 *)&v58[0].v, *(__n128 *)&v55[0].v, *(__n128 *)&v63[0].v);
      }
      CG::Cubic::split(a2, 0.5, &v41);
      CG::offset::path_offset_round_cube_offset(this, (const CG::Cubic *)&v41, v27);
      return CG::offset::path_offset_round_cube_offset(this, (const CG::Cubic *)&v43, v27);
    }
  }
}

void CG::offset::path_offset_round_cube(CG::offset *this, float64x2_t *a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __n128 v15;
  double v16;
  float64x2_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24[14];

  v4 = a2[1].f64[0];
  v5 = a2[1].f64[1];
  v7 = a2[2].f64[0];
  v6 = a2[2].f64[1];
  v8 = a2[3].f64[0];
  v9 = v4 - a2->f64[0];
  v10 = v5 - a2->f64[1];
  v11 = v7 - v4;
  v12 = v6 - v5;
  v13 = v8 - v7;
  if (v11 * v9 + (v6 - v5) * v10 >= 0.0 && v13 * v11 + (a2[3].f64[1] - v6) * v12 >= 0.0)
  {
    CG::offset::path_offset_round_cube_offset(this, a2, 4);
  }
  else if (v9 * v9 + v10 * v10 <= 0.00000001
         && v11 * v11 + v12 * v12 <= 0.00000001
         && (v14 = a2[3].f64[1], v13 * v13 + (v14 - v6) * (v14 - v6) <= 0.00000001))
  {
    v15.n128_f64[0] = CG::offset::offset_normal((uint64_t)this, (CG::Cubic *)a2, 0, 1.0) + v8;
    v15.n128_f64[1] = v16 + v14;
    (*(void (**)(_QWORD, __n128))(**((_QWORD **)this + 4) + 24))(*((_QWORD *)this + 4), v15);
  }
  else
  {
    CG::Cubic::split(a2, 0.5, &v17);
    if (a2->f64[0] != v17.f64[0]
      || a2->f64[1] != v17.f64[1]
      || a2[1].f64[0] != v18
      || a2[1].f64[1] != v19
      || a2[2].f64[0] != v20
      || a2[2].f64[1] != v21
      || a2[3].f64[0] != v22
      || a2[3].f64[1] != v23)
    {
      CG::offset::path_offset_round_cube(this, (const CG::Cubic *)&v17);
      if (a2->f64[0] != v24[0]
        || a2->f64[1] != v24[1]
        || a2[1].f64[0] != v24[2]
        || a2[1].f64[1] != v24[3]
        || a2[2].f64[0] != v24[4]
        || a2[2].f64[1] != v24[5]
        || a2[3].f64[0] != v24[6]
        || a2[3].f64[1] != v24[7])
      {
        CG::offset::path_offset_round_cube(this, (const CG::Cubic *)v24);
      }
    }
  }
}

uint64_t RB::DisplayList::Layer::Layer(uint64_t this, int a2, int a3)
{
  *(_QWORD *)this = 0;
  *(_QWORD *)(this + 8) = 0;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)(this + 32) = 0;
  *(_QWORD *)(this + 40) = 0;
  *(_QWORD *)(this + 48) = 0xBF80000000000000;
  *(_DWORD *)(this + 56) = a2;
  *(_DWORD *)(this + 60) = a3;
  *(_DWORD *)(this + 64) = 0;
  return this;
}

uint64_t RB::DisplayList::Layer::append(RB::DisplayList::Layer *this, RB::DisplayList::Builder *a2, RB::DisplayList::Item *a3)
{
  unsigned int v6;
  BOOL v7;
  double v8;
  double v9;
  _QWORD *v10;
  double v11;
  double v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  const RB::DisplayList::ClipNode *v19;
  _QWORD *v20;
  char v21;
  uint64_t v22;
  const RB::DisplayList::ClipNode *v23;
  uint64_t v24;
  _BYTE *v25;
  char v27;
  const RB::DisplayList::ClipNode *v28;
  _BYTE __dst[128];
  void *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (!*((_BYTE *)a2 + 272))
    return RB::DisplayList::Layer::append_item(this, a3);
  if (*((_QWORD *)this + 1)
    || ((v6 = *((_WORD *)a3 + 23) & 0x3F, v6 != 2) ? (v7 = v6 == 24) : (v7 = 1),
        v7 || (*((_BYTE *)this + 60) & 0x21) != 0))
  {
LABEL_8:
    if (*((_QWORD *)a3 + 3))
    {
      (*(void (**)(RB::DisplayList::Item *, _QWORD))(*(_QWORD *)a3 + 144))(a3, 0);
      v30 = 0;
      v31 = 0;
      v32 = 16;
      v10 = (_QWORD *)*((_QWORD *)a3 + 3);
      if (v10)
      {
        v11 = v8;
        v12 = v9;
        v13 = 1;
        do
        {
          while (((*(uint64_t (**)(unint64_t, double, double))(*(_QWORD *)(v10[1] & 0xFFFFFFFFFFFFFFFELL)
                                                                               + 32))(v10[1] & 0xFFFFFFFFFFFFFFFELL, v11, v12) & 1) != 0)
          {
            v13 = 0;
            v10 = (_QWORD *)*v10;
            if (!v10)
            {
              v16 = v31;
              goto LABEL_21;
            }
          }
          v14 = v10[1];
          v15 = v31;
          v16 = v31 + 1;
          if (v32 < v31 + 1)
          {
            _ZN2RB6vectorIDv4_DF16_Lm16EmE12reserve_slowEm(__dst, v31 + 1);
            v15 = v31;
            v16 = v31 + 1;
          }
          v17 = v30;
          if (!v30)
            v17 = __dst;
          *(_QWORD *)&v17[8 * v15] = v14 & 0xFFFFFFFFFFFFFFFELL;
          v31 = v16;
          v10 = (_QWORD *)*v10;
        }
        while (v10);
        if ((v13 & 1) != 0)
          goto LABEL_41;
LABEL_21:
        v28 = 0;
        if (v16)
        {
          v18 = *((_QWORD *)this + 1);
          if (!v18)
            goto LABEL_33;
          v19 = *(const RB::DisplayList::ClipNode **)(v18 + 24);
          if (!v19)
            goto LABEL_33;
          v20 = v30;
          if (!v30)
            v20 = __dst;
          v21 = 1;
          v22 = 8 * v16;
          v23 = v19;
          do
          {
            if (v23 && *v20 == (*((_QWORD *)v23 + 1) & 0xFFFFFFFFFFFFFFFELL))
              v23 = *(const RB::DisplayList::ClipNode **)v23;
            else
              v21 = 0;
            ++v20;
            v22 -= 8;
          }
          while (v22);
          if ((v21 & (v23 == 0)) == 0)
          {
LABEL_33:
            v24 = 8 * v16 - 8;
            do
            {
              v25 = v30;
              if (!v30)
                v25 = __dst;
              v19 = (const RB::DisplayList::ClipNode *)RB::Heap::emplace<RB::DisplayList::ClipNode,RB::DisplayList::Clip const*&,RB::DisplayList::ClipNode*&>((size_t *)(*((_QWORD *)a2 + 1) + 16), (const RB::DisplayList::Clip **)&v25[v24], &v28);
              v28 = v19;
              v24 -= 8;
              --v16;
            }
            while (v16);
          }
        }
        else
        {
          v19 = 0;
        }
        *((_QWORD *)a3 + 3) = v19;
LABEL_41:
        if (v30)
          free(v30);
      }
    }
    return RB::DisplayList::Layer::append_item(this, a3);
  }
  v27 = RB::blend_into_zero(v6);
  *((_WORD *)a3 + 23) = *((_WORD *)a3 + 23) & 0xFFC0 | v27 & 0x3F;
  if ((v27 & 0x3F) != 1)
  {
    if (*((_BYTE *)a2 + 272))
      goto LABEL_8;
    return RB::DisplayList::Layer::append_item(this, a3);
  }
  return (**(uint64_t (***)(RB::DisplayList::Item *))a3)(a3);
}

void sub_209BCFE40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27)
{
  if (a27)
    free(a27);
  _Unwind_Resume(exception_object);
}

uint64_t RB::DisplayList::Layer::append_filter(uint64_t result, _QWORD *a2)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = 0;
  v4 = (_QWORD *)(result + 16);
  do
  {
    v5 = v3;
    v6 = v4;
    v3 = *v4;
    v4 = (_QWORD *)(*v4 + 8);
  }
  while (v3);
  if (v5)
  {
    v7 = (*(uint64_t (**)(_QWORD *))(*a2 + 40))(a2);
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v5 + 32))(v5, v7, v8);
    if ((_DWORD)result)
      return (*(uint64_t (**)(_QWORD *))*a2)(a2);
  }
  *v6 = a2;
  a2[1] = 0;
  return result;
}

void RB::DisplayList::Layer::compute_bounds(RB::DisplayList::Layer *this)
{
  uint64_t v2;

  if (!*((_BYTE *)this + 66))
  {
    *((_BYTE *)this + 66) = 1;
    *((double *)this + 4) = RB::DisplayList::Layer::compute_bounds_(this, 0);
    *((_QWORD *)this + 5) = v2;
  }
}

uint64_t RB::DisplayList::Layer::effect_needs_zero_alpha(RB::DisplayList::Layer *this)
{
  if (*((_BYTE *)this + 64) == 2)
    return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 3) + 96))(*((_QWORD *)this + 3));
  else
    return 0;
}

void RB::DisplayList::Layer::min_scale(RB::DisplayList::Layer *this)
{
  _QWORD *v2;
  float v3;
  float v4;
  _QWORD *i;
  float v6;
  float v7;

  if (*((float *)this + 13) < 0.0)
  {
    v2 = *(_QWORD **)this;
    if (*(_QWORD *)this)
    {
      v3 = 0.0;
      do
      {
        v4 = (*(float (**)(_QWORD *))(*v2 + 152))(v2);
        if (v3 < v4)
          v3 = v4;
        for (i = (_QWORD *)v2[3]; i; i = (_QWORD *)*i)
        {
          v6 = (*(float (**)(unint64_t))(*(_QWORD *)(i[1] & 0xFFFFFFFFFFFFFFFELL) + 40))(i[1] & 0xFFFFFFFFFFFFFFFELL);
          if (v3 < v6)
            v3 = v6;
        }
        v2 = (_QWORD *)v2[1];
      }
      while (v2);
    }
    else
    {
      v3 = 0.0;
    }
    v7 = 0.25;
    if (v3 >= 0.25)
      v7 = v3;
    if ((*((_DWORD *)this + 15) & 1) == 0)
      v7 = v3;
    *((float *)this + 13) = v7;
  }
}

uint64_t RB::DisplayList::Layer::move_filters(uint64_t this, RB::DisplayList::Layer *a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  v2 = *((_QWORD *)a2 + 2);
  if (v2)
  {
    v3 = (_QWORD *)(this + 16);
    do
    {
      v4 = v3;
      v5 = *v3;
      v3 = (_QWORD *)(*v3 + 8);
    }
    while (v5);
    *v4 = v2;
    *((_QWORD *)a2 + 2) = 0;
  }
  return this;
}

uint64_t RB::DisplayList::Layer::max_depth(RB::DisplayList::Layer *this)
{
  uint64_t v1;
  _QWORD *v2;
  unsigned __int8 v3;
  int v4;

  v1 = *((unsigned __int8 *)this + 65);
  v2 = (_QWORD *)*((_QWORD *)this + 2);
  if (v2)
  {
    v3 = *((_BYTE *)this + 65);
    do
    {
      v4 = (*(uint64_t (**)(_QWORD *, _QWORD))(*v2 + 72))(v2, v3);
      v3 = v4;
      v1 = RB::max_color_depth(v1, v4);
      v2 = (_QWORD *)v2[1];
    }
    while (v2);
  }
  return v1;
}

uint64_t RB::DisplayList::Layer::copy(RB::DisplayList::Layer *this, RB::DisplayList::Builder *a2, unsigned int a3)
{
  uint64_t layer;
  _QWORD *v7;
  uint64_t v8;
  int v9;
  RB::DisplayList::Item *v10;
  _QWORD *i;
  _QWORD *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  size_t *v16;
  __int128 *v17;
  __int128 v18;
  __int128 v19;

  layer = RB::DisplayList::Builder::make_layer(a2, *((_DWORD *)this + 15));
  *(_DWORD *)(layer + 48) = *((_DWORD *)this + 12);
  if ((a3 & 1) == 0)
  {
    v7 = *(_QWORD **)this;
    if (*(_QWORD *)this)
    {
      v8 = a3 & 0xFFFFFFFE;
      v9 = (a3 >> 2) & 1;
      do
      {
        v10 = (RB::DisplayList::Item *)(*(uint64_t (**)(_QWORD *, RB::DisplayList::Builder *, uint64_t))(*v7 + 24))(v7, a2, v8);
        if (v10)
          RB::DisplayList::Builder::draw(a2, v10, (RB::DisplayList::Layer *)layer, v9);
        v7 = (_QWORD *)v7[1];
      }
      while (v7);
    }
  }
  for (i = (_QWORD *)*((_QWORD *)this + 2); i; i = (_QWORD *)i[1])
  {
    v12 = (_QWORD *)(*(uint64_t (**)(_QWORD *, RB::DisplayList::Builder *))(*i + 16))(i, a2);
    if (v12)
      RB::DisplayList::Layer::append_filter(layer, v12);
  }
  *(_BYTE *)(layer + 64) = *((_BYTE *)this + 64);
  v13 = *((_QWORD *)this + 3);
  *(_QWORD *)(layer + 24) = v13;
  v14 = *((unsigned __int8 *)this + 64);
  if (v14 == 1)
  {
    v16 = (size_t *)*((_QWORD *)a2 + 1);
    v17 = (__int128 *)*((_QWORD *)this + 3);
    v15 = (v16[4] + 3) & 0xFFFFFFFFFFFFFFFCLL;
    if (v15 + 36 > v16[5])
      v15 = RB::Heap::alloc_slow(v16 + 2, 0x24uLL, 3);
    else
      v16[4] = v15 + 36;
    v18 = *v17;
    v19 = v17[1];
    *(_DWORD *)(v15 + 32) = *((_DWORD *)v17 + 8);
    *(_OWORD *)v15 = v18;
    *(_OWORD *)(v15 + 16) = v19;
    goto LABEL_17;
  }
  if (v14 == 2)
  {
    v15 = (*(uint64_t (**)(uint64_t, RB::DisplayList::Builder *))(*(_QWORD *)v13 + 16))(v13, a2);
LABEL_17:
    *(_QWORD *)(layer + 24) = v15;
  }
  return layer;
}

uint64_t RB::DisplayList::Layer::discard_color(uint64_t this)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  int v5;
  char v6;
  _QWORD *v7;
  uint64_t i;
  char v9;

  if ((*(_BYTE *)(this + 60) & 8) == 0)
  {
    v1 = this;
    if (*(_BYTE *)(this + 64) != 2
      || (this = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(this + 24) + 48))(*(_QWORD *)(this + 24)),
          (_DWORD)this))
    {
      v2 = *(_QWORD **)(v1 + 16);
      if (!v2)
        goto LABEL_14;
      v3 = 0;
      do
      {
        v4 = v3;
        v3 = v2;
        v2 = (_QWORD *)v2[1];
        v3[1] = v4;
      }
      while (v2);
      *(_QWORD *)(v1 + 16) = 0;
      LOBYTE(v5) = 1;
      do
      {
        v6 = v5;
        v7 = (_QWORD *)v3[1];
        v9 = 0;
        v5 = 0;
        if ((v6 & 1) != 0
          && (this = (*(uint64_t (**)(_QWORD *, char *))(*v3 + 80))(v3, &v9), v5 = this, v9))
        {
          this = (*(uint64_t (**)(_QWORD *))*v3)(v3);
        }
        else
        {
          v3[1] = *(_QWORD *)(v1 + 16);
          *(_QWORD *)(v1 + 16) = v3;
        }
        v3 = v7;
      }
      while (v7);
      if (v5)
      {
LABEL_14:
        *(_DWORD *)(v1 + 60) |= 8u;
        for (i = *(_QWORD *)v1; i; i = *(_QWORD *)(i + 8))
        {
          if ((*(_WORD *)(i + 46) & 0x200) != 0)
            this = RB::DisplayList::Layer::discard_color(*(RB::DisplayList::Layer **)(i + 48));
        }
      }
    }
  }
  return this;
}

void RB::DisplayList::Layer::apply_transform(RB::DisplayList::Layer *this, const RB::DisplayList::CachedTransform *a2)
{
  float v4;
  float v5;
  int v6;
  float v7;
  float v8;
  _QWORD *i;
  float v10;
  unsigned int v11;
  float v12;
  float v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[15];

  v18[14] = *MEMORY[0x24BDAC8D0];
  v4 = *((float *)this + 12);
  if (v4 == 0.0)
    v5 = 1.0;
  else
    v5 = *((float *)this + 12);
  v6 = *((_DWORD *)this + 15);
  if (v5 == 1.0)
  {
    if ((v6 & 0x200) == 0)
    {
      RB::DisplayList::Layer::apply_transform_(this, a2);
      return;
    }
    goto LABEL_8;
  }
  if ((v6 & 0x200) != 0)
  {
LABEL_8:
    RB::DisplayList::CachedTransform::transform_scale(a2);
    v8 = v7;
    for (i = (_QWORD *)*((_QWORD *)this + 2); i; i = (_QWORD *)i[1])
    {
      if ((*(unsigned int (**)(_QWORD *))(*i + 40))(i) == 5)
        v8 = RB::Filter::GaussianBlur::layer_scale((RB::Filter::GaussianBlur *)(i + 4), v8);
    }
    RB::DisplayList::Layer::min_scale(this);
    v11 = 0;
    do
    {
      v12 = v8;
      v8 = v8 + v8;
    }
    while (v8 <= v10 && v11++ < 3);
    v4 = fminf(v12 * v5, 1.0);
    if ((float)(v12 * v5) <= 1.0)
      v5 = v12;
    else
      v5 = 1.0 / v5;
    *((float *)this + 12) = v4;
  }
  v14 = 1.0;
  if (v4 != 0.0)
    v14 = v4;
  RB::DisplayList::CachedTransform::CachedTransform((RB::DisplayList::CachedTransform *)&v15, (float64x2_t *)a2, v5, v14, 0);
  RB::DisplayList::Layer::apply_transform_(this, (const RB::DisplayList::CachedTransform *)&v15);
  RB::UntypedTable::~UntypedTable((RB::UntypedTable *)v18);
  RB::UntypedTable::~UntypedTable((RB::UntypedTable *)&v17);
  RB::Heap::~Heap((RB::Heap *)&v16);
}

void sub_209BD0488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  RB::DisplayList::CachedTransform::~CachedTransform((RB::DisplayList::CachedTransform *)&a9);
  _Unwind_Resume(a1);
}

void RB::DisplayList::Layer::apply_transform_(RB::DisplayList::Layer *this, const RB::DisplayList::CachedTransform *a2)
{
  int v4;
  int v5;
  BOOL v6;
  const RB::DisplayList::CachedTransform *v7;
  unsigned int v8;
  _QWORD *v9;
  _QWORD *i;
  int v11;
  uint64_t v12;
  _QWORD v13[186];

  v13[185] = *MEMORY[0x24BDAC8D0];
  v4 = *((_DWORD *)a2 + 286);
  v5 = *((_DWORD *)this + 15);
  v6 = (v5 & 0x2001) == 0 || (*((_DWORD *)a2 + 286) & 1) == 0;
  v7 = a2;
  if (!v6)
  {
    ++*((_BYTE *)this + 67);
    v7 = a2;
    if ((v5 & 1) != 0)
    {
      v8 = v4 & 0xFFFFFFFE;
      v7 = a2;
      if ((v4 & 0xFFFFFFFE) != v4)
      {
        MEMORY[0x24BDAC7A8](this, a2);
        v7 = (const RB::DisplayList::CachedTransform *)v13;
        bzero(v13, 0x5C0uLL);
        RB::DisplayList::CachedTransform::CachedTransform((RB::DisplayList::CachedTransform *)v13, (float64x2_t *)a2, 1.0, 1.0, v8);
      }
    }
  }
  v9 = *(_QWORD **)this;
  if (*(_QWORD *)this)
  {
    do
    {
      (*(void (**)(_QWORD *, const RB::DisplayList::CachedTransform *, _QWORD))(*v9 + 32))(v9, v7, 0);
      v9 = (_QWORD *)v9[1];
    }
    while (v9);
  }
  for (i = (_QWORD *)*((_QWORD *)this + 2); i; i = (_QWORD *)i[1])
    (*(void (**)(_QWORD *, const RB::DisplayList::CachedTransform *))(*i + 24))(i, v7);
  if (v7 != a2)
  {
    RB::UntypedTable::~UntypedTable((const RB::DisplayList::CachedTransform *)((char *)v7 + 1368));
    RB::UntypedTable::~UntypedTable((const RB::DisplayList::CachedTransform *)((char *)v7 + 1288));
    RB::Heap::~Heap((const RB::DisplayList::CachedTransform *)((char *)v7 + 8));
  }
  v11 = *((unsigned __int8 *)this + 64);
  if (v11 == 2)
  {
    v12 = (*(uint64_t (**)(_QWORD, const RB::DisplayList::CachedTransform *))(**((_QWORD **)this + 3) + 24))(*((_QWORD *)this + 3), a2);
    goto LABEL_18;
  }
  if (v11 == 1)
  {
    v12 = RB::DisplayList::CachedTransform::transform_projection(a2, *((const RB::ProjectionMatrix **)this + 3));
LABEL_18:
    *((_QWORD *)this + 3) = v12;
  }
  *((_BYTE *)this + 66) = 0;
  *((_DWORD *)this + 13) = -1082130432;
}

void RB::DisplayList::Layer::print(RB::DisplayList::Layer *this, std::string *a2)
{
  int v4;
  int v5;
  float v6;
  int v7;
  float *v8;
  _QWORD *i;
  _QWORD *j;

  RB::SexpString::push(a2, "layer");
  v4 = *((_DWORD *)this + 15);
  if ((v4 & 1) != 0)
  {
    RB::SexpString::print(a2, 0, "needs-bg");
    v4 = *((_DWORD *)this + 15);
  }
  if ((v4 & 0x2000) != 0)
    RB::SexpString::print(a2, 0, "needs-bg-below");
  if (*((_BYTE *)this + 67))
    RB::SexpString::printf(a2, 0, "(bg-depth %d)", *((unsigned __int8 *)this + 67));
  v5 = *((_DWORD *)this + 15);
  if ((v5 & 2) != 0)
  {
    RB::SexpString::print(a2, 0, "linear");
    v5 = *((_DWORD *)this + 15);
    if ((v5 & 4) == 0)
    {
LABEL_9:
      if ((v5 & 8) == 0)
        goto LABEL_10;
      goto LABEL_22;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_9;
  }
  RB::SexpString::print(a2, 0, "non-linear");
  v5 = *((_DWORD *)this + 15);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  RB::SexpString::print(a2, 0, "alpha-only");
  v5 = *((_DWORD *)this + 15);
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  RB::SexpString::print(a2, 0, "dither");
  v5 = *((_DWORD *)this + 15);
  if ((v5 & 0x200) == 0)
  {
LABEL_12:
    if ((v5 & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_25;
  }
LABEL_24:
  RB::SexpString::print(a2, 0, "filter-scale");
  v5 = *((_DWORD *)this + 15);
  if ((v5 & 0x100) == 0)
  {
LABEL_13:
    if ((v5 & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_25:
  RB::SexpString::print(a2, 0, "non-normal-blend");
  if ((*((_DWORD *)this + 15) & 0x10) != 0)
LABEL_14:
    RB::SexpString::print(a2, 0, "read-as-backdrop");
LABEL_15:
  v6 = *((float *)this + 12);
  if (v6 != 0.0)
    RB::SexpString::printf(a2, 0, "(scale %g)", v6);
  v7 = *((unsigned __int8 *)this + 64);
  if (v7 == 2)
  {
    (*(void (**)(_QWORD, std::string *))(**((_QWORD **)this + 3) + 144))(*((_QWORD *)this + 3), a2);
  }
  else if (v7 == 1)
  {
    v8 = (float *)*((_QWORD *)this + 3);
    RB::SexpString::printf(a2, 1, "(projection %g %g %g; %g %g %g; %g %g %g)",
      *v8,
      v8[1],
      v8[2],
      v8[3],
      v8[4],
      v8[5],
      v8[6],
      v8[7],
      v8[8]);
  }
  if (*((_QWORD *)this + 2))
  {
    RB::SexpString::push(a2, "filters");
    for (i = (_QWORD *)*((_QWORD *)this + 2); i; i = (_QWORD *)i[1])
    {
      a2[1].__r_.__value_.__s.__data_[16] = 1;
      (*(void (**)(_QWORD *, std::string *))(*i + 120))(i, a2);
    }
    RB::SexpString::pop(a2);
  }
  if (*(_QWORD *)this)
  {
    RB::SexpString::push(a2, "contents");
    for (j = *(_QWORD **)this; j; j = (_QWORD *)j[1])
      (*(void (**)(_QWORD *, std::string *))(*j + 256))(j, a2);
    RB::SexpString::pop(a2);
  }
  RB::SexpString::pop(a2);
}

void RB::DisplayList::Clip::mix(RB::DisplayList::Clip *this, const RB::DisplayList::Interpolator::State *a2, const RB::DisplayList::Clip *a3, const RB::DisplayList::CachedTransform *a4)
{
  abort();
}

uint64_t render_image_async(uint64_t a1)
{
  __dmb(9u);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
}

void init_background_notifications(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209ACA000, log, OS_LOG_TYPE_ERROR, "RBDevice: unable to determine bg state", v1, 2u);
}

void RB::DisplayList::GenericItem1<RB::Coverage::Primitive,RB::Fill::Custom>::append_color_matrix()
{
  abort();
}

void RB::DisplayList::GenericItem1<RB::Coverage::Stroke<RB::Coverage::StrokeablePath>,RB::Fill::Custom>::append_color_matrix()
{
  abort();
}

void RB::DisplayList::GenericItem1<RB::Coverage::Path,RB::Fill::Custom>::append_color_matrix()
{
  abort();
}

void RB::DisplayList::GenericItem1<RB::Coverage::Glyphs,RB::Fill::Custom>::append_color_matrix()
{
  abort();
}

void RB::DisplayList::GenericItem1<RB::Coverage::Stroke<RBStrokeRef>,RB::Fill::Custom>::append_color_matrix()
{
  abort();
}

unsigned int *RB::DisplayList::FilterStyle<RB::Filter::Custom>::FilterStyle<RB::Filter::Custom>(uint64_t *a1, void *a2)
{
  unsigned int *result;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;

  if (a2)
    free(a2);
  result = (unsigned int *)*a1;
  if (*a1)
  {
    v4 = result + 2;
    do
    {
      v5 = __ldxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
    {
      __dmb(9u);
      return (unsigned int *)(*(uint64_t (**)(unsigned int *))(*(_QWORD *)result + 8))(result);
    }
  }
  return result;
}

uint64_t RB::CustomShader::Library::intern_function(uint64_t a1)
{
  __dmb(9u);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
}

void RB::DisplayList::GenericEffect<RB::CustomEffect>::append_color_matrix(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  size_t *v5;
  unint64_t v6;

  if (*(_BYTE *)(a1 + 256))
  {
    v5 = *(size_t **)(a5 + 8);
    v6 = RB::Heap::emplace<RB::DisplayList::GenericEffect<RB::CustomEffect>,RB::DisplayList::GenericEffect<RB::CustomEffect> const&,RB::DisplayList::Contents &>(v5 + 2, a1, (RB::DisplayList::Contents *)v5);
    *(_BYTE *)(v6 + 256) = 0;
    *(_QWORD *)(v6 + 8) = v5[39];
    v5[39] = v6;
  }
  abort();
}

void RB::DisplayList::Item::append_color_matrix()
{
  abort();
}

void RB::DisplayList::Item::mix(RB::DisplayList::Item *this, const RB::DisplayList::Interpolator::State *a2, const RB::DisplayList::Item *a3, const RB::DisplayList::CachedTransform *a4)
{
  abort();
}

uint64_t RB::DisplayList::Builder::Builder(uint64_t *a1)
{
  uint64_t result;
  unsigned int *v2;
  unsigned int v3;
  unsigned int v4;

  result = *a1;
  if (result)
  {
    v2 = (unsigned int *)(result + 8);
    do
    {
      v3 = __ldxr(v2);
      v4 = v3 - 1;
    }
    while (__stlxr(v4, v2));
    if (!v4)
      return RB::CustomShader::Library::intern_function(result);
  }
  return result;
}

uint64_t RB::Device::~Device(uint64_t a1, uint64_t *a2)
{
  uint64_t i;
  uint64_t j;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t result;
  int v11;

  std::unique_ptr<RB::GlyphPathCache>::reset[abi:nn180100]((uint64_t *)(a1 + 960), 0);
  RB::UntypedTable::~UntypedTable((RB::UntypedTable *)(a1 + 880));
  RB::UntypedTable::~UntypedTable((RB::UntypedTable *)(a1 + 800));
  for (i = 0; i != -192; i -= 8)

  for (j = 0; j != -48; j -= 8)
  std::__hash_table<RB::FormattedRenderState,std::hash<RB::FormattedRenderState>,std::equal_to<RB::FormattedRenderState>,std::allocator<RB::FormattedRenderState>>::~__hash_table(a1 + 512);
  RB::UntypedTable::~UntypedTable((RB::UntypedTable *)(a1 + 432));
  std::__list_imp<RB::refcounted_ptr<RB::Texture>>::clear((uint64_t *)(a1 + 400));
  std::__list_imp<RB::refcounted_ptr<RB::Texture>>::clear(a2);
  std::__list_imp<RB::refcounted_ptr<RB::Texture>>::clear((uint64_t *)(a1 + 344));
  RB::Heap::~Heap((RB::Heap *)(a1 + 304));
  RB::vector<RB::Device::FrameContinuation,2ul,unsigned long>::~vector((char *)(a1 + 200));
  v6 = *(_QWORD *)(a1 + 176);
  if (v6)
  {
    v7 = *(_DWORD *)(v6 + 8) - 1;
    *(_DWORD *)(v6 + 8) = v7;
    if (!v7)
      OUTLINED_FUNCTION_0(v6);
  }
  v8 = *(_QWORD *)(a1 + 168);
  if (v8)
  {
    v9 = *(_DWORD *)(v8 + 8) - 1;
    *(_DWORD *)(v8 + 8) = v9;
    if (!v9)
      OUTLINED_FUNCTION_0(v8);
  }
  result = *(_QWORD *)(a1 + 160);
  if (result)
  {
    v11 = *(_DWORD *)(result + 8) - 1;
    *(_DWORD *)(result + 8) = v11;
    if (!v11)
      return OUTLINED_FUNCTION_0(result);
  }
  return result;
}

void RB::Device::alloc_shared_buffer(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_209ACA000, a2, OS_LOG_TYPE_FAULT, "unable to create buffer: %d bytes", (uint8_t *)v3, 8u);
}

_DWORD *RB::Device::alloc_shared_texture(_DWORD *result)
{
  int v1;

  v1 = result[2] - 1;
  result[2] = v1;
  if (!v1)
    return (_DWORD *)(*(uint64_t (**)(_DWORD *))(*(_QWORD *)result + 8))(result);
  return result;
}

void RB::Device::noise_texture(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_209ACA000, log, OS_LOG_TYPE_FAULT, "unable to create noise texture", v1, 2u);
}

void RB::Device::RenderPipelineEntry::function_table(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_209ACA000, log, OS_LOG_TYPE_ERROR, "failed to add binary function: %@", buf, 0xCu);
}

void RB::Device::command_buffer_error(void *a1, NSObject *a2)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 134218242;
  v5 = objc_msgSend(a1, "code");
  v6 = 2112;
  v7 = a1;
  _os_log_error_impl(&dword_209ACA000, a2, OS_LOG_TYPE_ERROR, "command buffer error: %ld, %@", (uint8_t *)&v4, 0x16u);
}

_DWORD *RB::RenderFrame::alloc_buffer_region(_DWORD *result)
{
  int v1;

  v1 = result[2] - 1;
  result[2] = v1;
  if (!v1)
    return (_DWORD *)(*(uint64_t (**)(_DWORD *))(*(_QWORD *)result + 8))(result);
  return result;
}

void RB::DisplayList::Style::mix(RB::DisplayList::Style *this, const RB::DisplayList::Interpolator::State *a2, const RB::DisplayList::Style *a3, const RB::DisplayList::CachedTransform *a4)
{
  abort();
}

unsigned int *RB::DisplayList::Style::decode(uint64_t *a1, int a2, void *a3)
{
  unsigned int *result;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;

  if (a3)
    free(a3);
  result = (unsigned int *)*a1;
  if (*a1)
  {
    v5 = result + 2;
    do
    {
      v6 = __ldxr(v5);
      v7 = v6 - 1;
    }
    while (__stlxr(v7, v5));
    if (!v7)
    {
      __dmb(9u);
      return (unsigned int *)(*(uint64_t (**)(unsigned int *))(*(_QWORD *)result + 8))(result);
    }
  }
  return result;
}

void RB::DisplayList::SpillItem::copy(RB::DisplayList::SpillItem *this, RB::DisplayList::Builder *a2)
{
  abort();
}

void RB::DisplayList::SpillItem::apply_transform(RB::DisplayList::SpillItem *this, const RB::DisplayList::CachedTransform *a2)
{
  abort();
}

void RB::DisplayList::SpillItem::render(RB::DisplayList::SpillItem *this, RB::CGContext *a2)
{
  abort();
}

void RB::DisplayList::SpillItem::matches(RB::DisplayList::SpillItem *this, const RB::DisplayList::Predicate *a2)
{
  abort();
}

void RB::DisplayList::SpillItem::prepare_encode()
{
  abort();
}

void RB::DisplayList::SpillItem::encode()
{
  abort();
}

void RB::DisplayList::RootTexture::render(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_209ACA000, log, OS_LOG_TYPE_ERROR, "no drawable", buf, 2u);
}

uint64_t RB::DisplayList::LayerTask::append_task(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 8) - 1;
  *(_DWORD *)(a1 + 8) = v1;
  if (!v1)
    return OUTLINED_FUNCTION_0_0(a1);
  return a1;
}

void RB::non_fatal_precondition_failure(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 136315138;
  v4 = v2;
  _os_log_fault_impl(&dword_209ACA000, a2, OS_LOG_TYPE_FAULT, "precondition failure: %s", (uint8_t *)&v3, 0xCu);
}

void RB::RenderPass::RenderPass(id *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  char v8;

  do
  {
    v5 = *(_QWORD *)(a2 - 24);
    a2 -= 24;
    if (v5)
    {
      OUTLINED_FUNCTION_1_1();
      *(_DWORD *)(v6 + 8) = v7;
      if (v8)
        OUTLINED_FUNCTION_0(v6);
    }
  }
  while (a2 != a3);
}

void RB::RenderPass::~RenderPass(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  int v4;
  char v5;

  for (i = 80; i != -16; i -= 24)
  {
    if (*(_QWORD *)(a1 + i))
    {
      OUTLINED_FUNCTION_1_1();
      *(_DWORD *)(v3 + 8) = v4;
      if (v5)
        OUTLINED_FUNCTION_0(v3);
    }
  }
}

void RB::RenderPass::set_extra_attachments()
{
  uint64_t v0;
  int v1;
  char v2;

  OUTLINED_FUNCTION_1_1();
  *(_DWORD *)(v0 + 8) = v1;
  if (v2)
    OUTLINED_FUNCTION_0(v0);
}

void RB::SharedSurfaceGroup::schedule_updates(char a1, uint64_t a2)
{
  unsigned int *v2;
  char v3;
  uint64_t v4;
  unsigned int v5;

  if ((a1 & 1) == 0)
  {
    v2 = (unsigned int *)(a2 + 8);
    do
      OUTLINED_FUNCTION_1_2(v2);
    while (__stlxr(v5, v2));
    if (v3)
    {
      __dmb(9u);
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    }
  }
}

void RB::SharedSurfaceGroup::schedule_updates(uint64_t a1)
{
  unsigned int *v1;
  char v2;
  uint64_t v3;
  unsigned int v4;

  v1 = (unsigned int *)(a1 + 8);
  do
    OUTLINED_FUNCTION_1_2(v1);
  while (__stlxr(v4, v1));
  if (v2)
    OUTLINED_FUNCTION_1_0(v3);
}

void RB::SurfacePool::dealloc(dispatch_queue_t *context)
{
  dispatch_async_f(context[1], context, (dispatch_function_t)RB::SurfacePool::AsyncCollection::~AsyncCollection()::$_0::__invoke);
}

void RB::Surface::Surface(id *a1, CFTypeRef *a2)
{

  if (*a2)
    OUTLINED_FUNCTION_0_1(*a2);
}

void RB::Surface::~Surface(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 48);
  if (v2)
    OUTLINED_FUNCTION_0_1(v2);
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

uint64_t CAIOSurfaceCreateDefault()
{
  return MEMORY[0x24BDE5448]();
}

uint64_t CAImageQueueCollect()
{
  return MEMORY[0x24BDE5450]();
}

uint64_t CAImageQueueConsumeUnconsumedInRange()
{
  return MEMORY[0x24BDE5458]();
}

uint64_t CAImageQueueCreate()
{
  return MEMORY[0x24BDE5460]();
}

uint64_t CAImageQueueGetLastUpdateHostTime()
{
  return MEMORY[0x24BDE5478]();
}

uint64_t CAImageQueueGetReleasedImageInfo()
{
  return MEMORY[0x24BDE5480]();
}

uint64_t CAImageQueueGetRotationFlags()
{
  return MEMORY[0x24BDE5488]();
}

uint64_t CAImageQueueInsertImageWithRotation()
{
  return MEMORY[0x24BDE54A0]();
}

uint64_t CAImageQueueInvalidate()
{
  return MEMORY[0x24BDE54A8]();
}

uint64_t CAImageQueueRegisterIOSurfaceBuffer()
{
  return MEMORY[0x24BDE54B0]();
}

uint64_t CAImageQueueSetFlags()
{
  return MEMORY[0x24BDE54B8]();
}

uint64_t CAImageQueueSetSize()
{
  return MEMORY[0x24BDE54C0]();
}

uint64_t CAImageQueueUnregisterBuffer()
{
  return MEMORY[0x24BDE54C8]();
}

uint64_t CALayerGetDelegate()
{
  return MEMORY[0x24BDE54D8]();
}

uint64_t CALayerGetSuperlayer()
{
  return MEMORY[0x24BDE54E8]();
}

CATransform3D *__cdecl CATransform3DConcat_(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x24BDE5580](retstr, a, b);
}

CATransform3D *__cdecl CATransform3DMakeTranslation_(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x24BDE55E0](retstr, tx, ty, tz);
}

CATransform3D *__cdecl CATransform3DRotate_(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x24BDE55F0](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DTranslate_(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x24BDE5608](retstr, t, tx, ty, tz);
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x24BDBB798](allocator, context);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x24BDBBC80](type_id);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x24BDBBCA0](allocator, theData);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB8](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x24BDBBD00](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC388](rl);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
  MEMORY[0x24BDBC4B0](theString, cStr, *(_QWORD *)&encoding);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x24BDBC560](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x24BDBC618](theString, idx);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  double result;

  MEMORY[0x24BDBC630](str);
  return result;
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x24BDBC650](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x24BDBC6A8](theString, prefix);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

CGAffineTransformComponents *__cdecl CGAffineTransformDecompose(CGAffineTransformComponents *__return_ptr retstr, CGAffineTransform *transform)
{
  return (CGAffineTransformComponents *)MEMORY[0x24BDBD8A8](retstr, transform);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x24BDBD8B0](t1, t2);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x24BDBD8C8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeWithComponents(CGAffineTransform *__return_ptr retstr, CGAffineTransformComponents *components)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8F0](retstr, components);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

CGImageAlphaInfo CGBitmapContextGetAlphaInfo(CGContextRef context)
{
  return MEMORY[0x24BDBD938](context);
}

CGBitmapInfo CGBitmapContextGetBitmapInfo(CGContextRef context)
{
  return MEMORY[0x24BDBD940](context);
}

size_t CGBitmapContextGetBitsPerComponent(CGContextRef context)
{
  return MEMORY[0x24BDBD948](context);
}

size_t CGBitmapContextGetBitsPerPixel(CGContextRef context)
{
  return MEMORY[0x24BDBD950](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x24BDBD958](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x24BDBD968](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x24BDBD970](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x24BDBD978](context);
}

uint64_t CGBlt_copyBytes()
{
  return MEMORY[0x24BDBD998]();
}

uint64_t CGBlt_fillBytes()
{
  return MEMORY[0x24BDBD9A0]();
}

uint64_t CGClipGetMask()
{
  return MEMORY[0x24BDBD9A8]();
}

uint64_t CGClipGetMode()
{
  return MEMORY[0x24BDBD9B0]();
}

uint64_t CGClipGetPath()
{
  return MEMORY[0x24BDBD9B8]();
}

uint64_t CGClipGetRect()
{
  return MEMORY[0x24BDBD9C0]();
}

uint64_t CGClipGetShouldAntialias()
{
  return MEMORY[0x24BDBD9C8]();
}

uint64_t CGClipGetStroke()
{
  return MEMORY[0x24BDBD9D0]();
}

uint64_t CGClipGetTextClipping()
{
  return MEMORY[0x24BDBD9D8]();
}

uint64_t CGClipGetType()
{
  return MEMORY[0x24BDBD9E0]();
}

uint64_t CGClipMaskGetImage()
{
  return MEMORY[0x24BDBD9E8]();
}

uint64_t CGClipMaskGetMatrix()
{
  return MEMORY[0x24BDBD9F0]();
}

uint64_t CGClipMaskGetRect()
{
  return MEMORY[0x24BDBD9F8]();
}

uint64_t CGClipStackGetClipAtIndex()
{
  return MEMORY[0x24BDBDA00]();
}

uint64_t CGClipStackGetCount()
{
  return MEMORY[0x24BDBDA08]();
}

uint64_t CGClipStackGetIdentifier()
{
  return MEMORY[0x24BDBDA10]();
}

uint64_t CGClipStackGetRect()
{
  return MEMORY[0x24BDBDA18]();
}

uint64_t CGClipStackIsInfinite()
{
  return MEMORY[0x24BDBDA20]();
}

uint64_t CGClipStrokeGetDash()
{
  return MEMORY[0x24BDBDA28]();
}

uint64_t CGClipStrokeGetLineCap()
{
  return MEMORY[0x24BDBDA30]();
}

uint64_t CGClipStrokeGetLineJoin()
{
  return MEMORY[0x24BDBDA38]();
}

uint64_t CGClipStrokeGetLineWidth()
{
  return MEMORY[0x24BDBDA40]();
}

uint64_t CGClipStrokeGetMatrix()
{
  return MEMORY[0x24BDBDA48]();
}

uint64_t CGClipStrokeGetMiterLimit()
{
  return MEMORY[0x24BDBDA50]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x24BDBDA78](space, components);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDAB0](red, green, blue, alpha);
}

CGColorRef CGColorCreateWithPattern(CGColorSpaceRef space, CGPatternRef pattern, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x24BDBDAB8](space, pattern, components);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x24BDBDAC0](color1, color2);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  CGFloat result;

  MEMORY[0x24BDBDAE8](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDAF0](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x24BDBDAF8](color);
}

CGColorRef CGColorGetConstantColor(CFStringRef colorName)
{
  return (CGColorRef)MEMORY[0x24BDBDB00](colorName);
}

CGPatternRef CGColorGetPattern(CGColorRef color)
{
  return (CGPatternRef)MEMORY[0x24BDBDB10](color);
}

uint64_t CGColorGetPatternBaseColor()
{
  return MEMORY[0x24BDBDB18]();
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x24BDBDB68](space);
}

CGColorSpaceRef CGColorSpaceCreatePattern(CGColorSpaceRef baseSpace)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBA0](baseSpace);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBC0](plist);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x24BDBDBC8]();
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x24BDBDC18](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC20](space);
}

uint64_t CGColorSpaceGetType()
{
  return MEMORY[0x24BDBDC28]();
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x24BDBDC58](a1);
}

BOOL CGColorSpaceUsesExtendedRange(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC78](space);
}

uint64_t CGColorTransformConvertColorComponents()
{
  return MEMORY[0x24BDBDCA0]();
}

uint64_t CGColorTransformCreate()
{
  return MEMORY[0x24BDBDCA8]();
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDCC8](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDCD0](c, x, y);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x24BDBDCE0](c, path);
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDCF0](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextBeginPath(CGContextRef c)
{
  MEMORY[0x24BDBDD00](c);
}

void CGContextBeginTransparencyLayer(CGContextRef c, CFDictionaryRef auxiliaryInfo)
{
  MEMORY[0x24BDBDD08](c, auxiliaryInfo);
}

void CGContextBeginTransparencyLayerWithRect(CGContextRef c, CGRect rect, CFDictionaryRef auxInfo)
{
  MEMORY[0x24BDBDD10](c, auxInfo, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CGContextClear()
{
  return MEMORY[0x24BDBDD18]();
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD20](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x24BDBDD28](c);
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
  MEMORY[0x24BDBDD30](c, mask, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD38](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x24BDBDD50](c, transform);
}

uint64_t CGContextCreateWithDelegate()
{
  return MEMORY[0x24BDBDD98]();
}

uint64_t CGContextDelegateCreate()
{
  return MEMORY[0x24BDBDDA0]();
}

uint64_t CGContextDelegateGetCallback()
{
  return MEMORY[0x24BDBDDA8]();
}

uint64_t CGContextDelegateGetInfo()
{
  return MEMORY[0x24BDBDDB0]();
}

uint64_t CGContextDelegateSetCallbacks()
{
  return MEMORY[0x24BDBDDC0]();
}

void CGContextDrawConicGradient(CGContextRef c, CGGradientRef gradient, CGPoint center, CGFloat angle)
{
  MEMORY[0x24BDBDDC8](c, gradient, (__n128)center, *(__n128 *)&center.y, angle);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CGContextDrawImageFromRect()
{
  return MEMORY[0x24BDBDDE0]();
}

void CGContextDrawLayerAtPoint(CGContextRef context, CGPoint point, CGLayerRef layer)
{
  MEMORY[0x24BDBDDE8](context, layer, (__n128)point, *(__n128 *)&point.y);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x24BDBDDF8](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
  MEMORY[0x24BDBDE18](c, *(_QWORD *)&mode);
}

uint64_t CGContextDrawPathDirect()
{
  return MEMORY[0x24BDBDE20]();
}

void CGContextDrawRadialGradient(CGContextRef c, CGGradientRef gradient, CGPoint startCenter, CGFloat startRadius, CGPoint endCenter, CGFloat endRadius, CGGradientDrawingOptions options)
{
  MEMORY[0x24BDBDE28](c, gradient, *(_QWORD *)&options, (__n128)startCenter, *(__n128 *)&startCenter.y, startRadius, (__n128)endCenter, *(__n128 *)&endCenter.y, endRadius);
}

void CGContextDrawShading(CGContextRef c, CGShadingRef shading)
{
  MEMORY[0x24BDBDE30](c, shading);
}

void CGContextDrawTiledImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDE38](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextEOClip(CGContextRef c)
{
  MEMORY[0x24BDBDE40](c);
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
  MEMORY[0x24BDBDE58](c);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x24BDBDE68](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x24BDBDE98](retstr, c);
}

CGRect CGContextGetClipBoundingBox(CGContextRef c)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBDEA0](c);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t CGContextGetDelegate()
{
  return MEMORY[0x24BDBDEB0]();
}

uint64_t CGContextGetGState()
{
  return MEMORY[0x24BDBDEB8]();
}

CGInterpolationQuality CGContextGetInterpolationQuality(CGContextRef c)
{
  return MEMORY[0x24BDBDEC0](c);
}

uint64_t CGContextGetRenderingState()
{
  return MEMORY[0x24BDBDEF8]();
}

uint64_t CGContextGetSoftMask()
{
  return MEMORY[0x24BDBDF00]();
}

uint64_t CGContextGetType()
{
  return MEMORY[0x24BDBDF10]();
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDF20](c, x, y);
}

void CGContextReplacePathWithStrokedPath(CGContextRef c)
{
  MEMORY[0x24BDBDF38](c);
}

uint64_t CGContextResetState()
{
  return MEMORY[0x24BDBDF50]();
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
  MEMORY[0x24BDBDFA0](c, alpha);
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x24BDBDFA8]();
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x24BDBDFB0](c, *(_QWORD *)&mode);
}

uint64_t CGContextSetCTM()
{
  return MEMORY[0x24BDBDFB8]();
}

uint64_t CGContextSetCompositeOperation()
{
  return MEMORY[0x24BDBDFC0]();
}

void CGContextSetFillColor(CGContextRef c, const CGFloat *components)
{
  MEMORY[0x24BDBDFC8](c, components);
}

void CGContextSetFillColorSpace(CGContextRef c, CGColorSpaceRef space)
{
  MEMORY[0x24BDBDFD0](c, space);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetFont(CGContextRef c, CGFontRef font)
{
  MEMORY[0x24BDBDFF0](c, font);
}

uint64_t CGContextSetFontRenderingStyle()
{
  return MEMORY[0x24BDBDFF8]();
}

void CGContextSetFontSize(CGContextRef c, CGFloat size)
{
  MEMORY[0x24BDBE000](c, size);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x24BDBE018](c, *(_QWORD *)&quality);
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
  MEMORY[0x24BDBE020](c, *(_QWORD *)&cap);
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
  MEMORY[0x24BDBE028](c, lengths, count, phase);
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
  MEMORY[0x24BDBE030](c, *(_QWORD *)&join);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x24BDBE038](c, width);
}

void CGContextSetMiterLimit(CGContextRef c, CGFloat limit)
{
  MEMORY[0x24BDBE048](c, limit);
}

void CGContextSetPatternPhase(CGContextRef c, CGSize phase)
{
  MEMORY[0x24BDBE050](c, (__n128)phase, *(__n128 *)&phase.height);
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x24BDBE060](c, red, green, blue, alpha);
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
  MEMORY[0x24BDBE088](c, shouldAntialias);
}

uint64_t CGContextSetShouldDrawBitmapRuns()
{
  return MEMORY[0x24BDBE090]();
}

uint64_t CGContextSetSoftMask()
{
  return MEMORY[0x24BDBE0B0]();
}

void CGContextSetStrokeColor(CGContextRef c, const CGFloat *components)
{
  MEMORY[0x24BDBE0C0](c, components);
}

void CGContextSetStrokeColorSpace(CGContextRef c, CGColorSpaceRef space)
{
  MEMORY[0x24BDBE0C8](c, space);
}

void CGContextSetTextDrawingMode(CGContextRef c, CGTextDrawingMode mode)
{
  MEMORY[0x24BDBE0E0](c, *(_QWORD *)&mode);
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
  MEMORY[0x24BDBE0F0](c, t);
}

void CGContextShowGlyphsAtPositions(CGContextRef c, const CGGlyph *glyphs, const CGPoint *Lpositions, size_t count)
{
  MEMORY[0x24BDBE100](c, glyphs, Lpositions, count);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x24BDBE118](c);
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBE120](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

uint64_t CGDashGetPattern()
{
  return MEMORY[0x24BDBE138]();
}

CGDataConsumerRef CGDataConsumerCreateWithURL(CFURLRef url)
{
  return (CGDataConsumerRef)MEMORY[0x24BDBE150](url);
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
  MEMORY[0x24BDBE160](consumer);
}

CGDataProviderRef CGDataProviderCreateDirect(void *info, off_t size, const CGDataProviderDirectCallbacks *callbacks)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE170](info, size, callbacks);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE180](data);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE190](info, data, size, releaseData);
}

CGDataProviderRef CGDataProviderCreateWithURL(CFURLRef url)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE1A0](url);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x24BDBE1C8](provider);
}

CFStringRef CGFontCopyGlyphNameForGlyph(CGFontRef font, CGGlyph glyph)
{
  return (CFStringRef)MEMORY[0x24BDBE2A0](font, glyph);
}

uint64_t CGFontCopyName()
{
  return MEMORY[0x24BDBE2A8]();
}

CFStringRef CGFontCopyPostScriptName(CGFontRef font)
{
  return (CFStringRef)MEMORY[0x24BDBE2B0](font);
}

uint64_t CGFontCopyURL()
{
  return MEMORY[0x24BDBE2B8]();
}

uint64_t CGFontCreateFontSubset()
{
  return MEMORY[0x24BDBE2C0]();
}

uint64_t CGFontCreateGlyphPath()
{
  return MEMORY[0x24BDBE2D0]();
}

CGFontRef CGFontCreateWithDataProvider(CGDataProviderRef provider)
{
  return (CGFontRef)MEMORY[0x24BDBE2D8](provider);
}

uint64_t CGFontCreateWithVariations()
{
  return MEMORY[0x24BDBE2E0]();
}

CGRect CGFontGetFontBBox(CGFontRef font)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBE2F8](font);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t CGFontGetFontSubsetFormat()
{
  return MEMORY[0x24BDBE300]();
}

BOOL CGFontGetGlyphAdvances(CGFontRef font, const CGGlyph *glyphs, size_t count, int *advances)
{
  return MEMORY[0x24BDBE308](font, glyphs, count, advances);
}

BOOL CGFontGetGlyphBBoxes(CGFontRef font, const CGGlyph *glyphs, size_t count, CGRect *bboxes)
{
  return MEMORY[0x24BDBE310](font, glyphs, count, bboxes);
}

uint64_t CGFontGetGlyphIdentifiers()
{
  return MEMORY[0x24BDBE318]();
}

uint64_t CGFontGetIdentifier()
{
  return MEMORY[0x24BDBE328]();
}

uint64_t CGFontGetPostScriptName()
{
  return MEMORY[0x24BDBE330]();
}

uint64_t CGFontGetProperty()
{
  return MEMORY[0x24BDBE338]();
}

uint64_t CGFontGetQuantizationLevelWithStyle()
{
  return MEMORY[0x24BDBE340]();
}

int CGFontGetUnitsPerEm(CGFontRef font)
{
  return MEMORY[0x24BDBE350](font);
}

uint64_t CGFontGetVariationAxes()
{
  return MEMORY[0x24BDBE358]();
}

uint64_t CGFontGetVariations()
{
  return MEMORY[0x24BDBE360]();
}

uint64_t CGFontIndexMapAddIndexes()
{
  return MEMORY[0x24BDBE368]();
}

uint64_t CGFontIndexMapCreate()
{
  return MEMORY[0x24BDBE370]();
}

uint64_t CGFontIndexMapGetValue()
{
  return MEMORY[0x24BDBE378]();
}

uint64_t CGFontIndexMapGetValues()
{
  return MEMORY[0x24BDBE380]();
}

uint64_t CGFontIndexMapRelease()
{
  return MEMORY[0x24BDBE388]();
}

uint64_t CGFontIndexSetAddIndexes()
{
  return MEMORY[0x24BDBE390]();
}

uint64_t CGFontIndexSetCreate()
{
  return MEMORY[0x24BDBE398]();
}

uint64_t CGFontIndexSetGetCount()
{
  return MEMORY[0x24BDBE3A0]();
}

uint64_t CGFontIndexSetGetIndexes()
{
  return MEMORY[0x24BDBE3A8]();
}

uint64_t CGFontIndexSetGetName()
{
  return MEMORY[0x24BDBE3B0]();
}

uint64_t CGFontIndexSetRelease()
{
  return MEMORY[0x24BDBE3B8]();
}

CGFontRef CGFontRetain(CGFontRef font)
{
  return (CGFontRef)MEMORY[0x24BDBE3D0](font);
}

uint64_t CGFunctionEvaluate()
{
  return MEMORY[0x24BDBE3E0]();
}

uint64_t CGFunctionGetDomain()
{
  return MEMORY[0x24BDBE3E8]();
}

uint64_t CGFunctionGetRangeDimension()
{
  return MEMORY[0x24BDBE3F0]();
}

uint64_t CGFunctionIsIdentity()
{
  return MEMORY[0x24BDBE3F8]();
}

uint64_t CGGStateCreateCopy()
{
  return MEMORY[0x24BDBE408]();
}

uint64_t CGGStateGetAdjustedLineWidth()
{
  return MEMORY[0x24BDBE410]();
}

uint64_t CGGStateGetAlpha()
{
  return MEMORY[0x24BDBE418]();
}

uint64_t CGGStateGetCTM()
{
  return MEMORY[0x24BDBE420]();
}

uint64_t CGGStateGetClipStack()
{
  return MEMORY[0x24BDBE428]();
}

uint64_t CGGStateGetCompositeOperation()
{
  return MEMORY[0x24BDBE430]();
}

uint64_t CGGStateGetFillColor()
{
  return MEMORY[0x24BDBE438]();
}

uint64_t CGGStateGetFont()
{
  return MEMORY[0x24BDBE448]();
}

uint64_t CGGStateGetFontDilation()
{
  return MEMORY[0x24BDBE450]();
}

uint64_t CGGStateGetFontRenderingStyle()
{
  return MEMORY[0x24BDBE458]();
}

uint64_t CGGStateGetFontSize()
{
  return MEMORY[0x24BDBE460]();
}

uint64_t CGGStateGetInterpolationQuality()
{
  return MEMORY[0x24BDBE468]();
}

uint64_t CGGStateGetLineCap()
{
  return MEMORY[0x24BDBE470]();
}

uint64_t CGGStateGetLineDash()
{
  return MEMORY[0x24BDBE478]();
}

uint64_t CGGStateGetLineJoin()
{
  return MEMORY[0x24BDBE480]();
}

uint64_t CGGStateGetMiterLimit()
{
  return MEMORY[0x24BDBE498]();
}

uint64_t CGGStateGetPatternPhase()
{
  return MEMORY[0x24BDBE4A0]();
}

uint64_t CGGStateGetShouldAntialias()
{
  return MEMORY[0x24BDBE4A8]();
}

uint64_t CGGStateGetShouldDrawBitmapRuns()
{
  return MEMORY[0x24BDBE4B0]();
}

uint64_t CGGStateGetSoftMask()
{
  return MEMORY[0x24BDBE4B8]();
}

uint64_t CGGStateGetStrokeColor()
{
  return MEMORY[0x24BDBE4C8]();
}

uint64_t CGGStateGetStyle()
{
  return MEMORY[0x24BDBE4D0]();
}

uint64_t CGGStateGetTextDrawingMode()
{
  return MEMORY[0x24BDBE4D8]();
}

uint64_t CGGStateRelease()
{
  return MEMORY[0x24BDBE4E0]();
}

uint64_t CGGStateSetCTM()
{
  return MEMORY[0x24BDBE4E8]();
}

uint64_t CGGlyphLockAccessCustomized()
{
  return MEMORY[0x24BDBE4F0]();
}

uint64_t CGGlyphLockCreate()
{
  return MEMORY[0x24BDBE4F8]();
}

uint64_t CGGlyphLockGetQuantizationLevel()
{
  return MEMORY[0x24BDBE500]();
}

uint64_t CGGlyphLockLockGlyphBitmaps()
{
  return MEMORY[0x24BDBE508]();
}

uint64_t CGGlyphLockRelease()
{
  return MEMORY[0x24BDBE510]();
}

uint64_t CGGlyphLockUnlock()
{
  return MEMORY[0x24BDBE518]();
}

uint64_t CGGradientApply()
{
  return MEMORY[0x24BDBE520]();
}

CGGradientRef CGGradientCreateWithColorComponents(CGColorSpaceRef space, const CGFloat *components, const CGFloat *locations, size_t count)
{
  return (CGGradientRef)MEMORY[0x24BDBE528](space, components, locations, count);
}

uint64_t CGGradientGetColorSpace()
{
  return MEMORY[0x24BDBE540]();
}

uint64_t CGGradientGetLocationCount()
{
  return MEMORY[0x24BDBE548]();
}

uint64_t CGImageBlockCreate()
{
  return MEMORY[0x24BDBE570]();
}

uint64_t CGImageBlockRelease()
{
  return MEMORY[0x24BDBE590]();
}

uint64_t CGImageBlockSetCreate()
{
  return MEMORY[0x24BDBE598]();
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x24BDBE5E0](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x24BDBE5F8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CGImageCreateWithImageProvider()
{
  return MEMORY[0x24BDBE600]();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9078](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithDataConsumer(CGDataConsumerRef consumer, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9080](consumer, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE620](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE628](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x24BDBE630](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

uint64_t CGImageGetIdentifier()
{
  return MEMORY[0x24BDBE688]();
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x24BDBE690]();
}

uint64_t CGImageGetMask()
{
  return MEMORY[0x24BDBE698]();
}

uint64_t CGImageGetMaskingColors()
{
  return MEMORY[0x24BDBE6A0]();
}

uint64_t CGImageGetProperty()
{
  return MEMORY[0x24BDBE6B8]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

uint64_t CGImageHasAlpha()
{
  return MEMORY[0x24BDBE6E8]();
}

BOOL CGImageIsMask(CGImageRef image)
{
  return MEMORY[0x24BDBE6F0](image);
}

uint64_t CGImageProviderCopyIOSurface()
{
  return MEMORY[0x24BDBE708]();
}

uint64_t CGImageProviderCopyImageTextureData()
{
  return MEMORY[0x24BDBE718]();
}

uint64_t CGImageProviderCreate()
{
  return MEMORY[0x24BDBE720]();
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x24BDBE780]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9170](data, options);
}

uint64_t CGImageTextureDataGetColorSpace()
{
  return MEMORY[0x24BDBE788]();
}

uint64_t CGImageTextureDataGetDataWithBlock()
{
  return MEMORY[0x24BDBE790]();
}

uint64_t CGImageTextureDataGetNumberOfMipmaps()
{
  return MEMORY[0x24BDBE798]();
}

uint64_t CGImageTextureDataGetPixelFormat()
{
  return MEMORY[0x24BDBE7A0]();
}

uint64_t CGImageTextureDataGetSize()
{
  return MEMORY[0x24BDBE7A8]();
}

uint64_t CGImageTextureDataRelease()
{
  return MEMORY[0x24BDBE7B0]();
}

uint64_t CGImageTextureDataRetain()
{
  return MEMORY[0x24BDBE7B8]();
}

uint64_t CGImageTextureDataSupportsTiledLayout()
{
  return MEMORY[0x24BDBE7C0]();
}

CGLayerRef CGLayerCreateWithContext(CGContextRef context, CGSize size, CFDictionaryRef auxiliaryInfo)
{
  return (CGLayerRef)MEMORY[0x24BDBE7D0](context, auxiliaryInfo, (__n128)size, *(__n128 *)&size.height);
}

CGContextRef CGLayerGetContext(CGLayerRef layer)
{
  return (CGContextRef)MEMORY[0x24BDBE7D8](layer);
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDB8](path, m, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDC8](path, m, x, y);
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDE0](path, m, cpx, cpy, x, y);
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
  MEMORY[0x24BDBEE08](path, info, function);
}

uint64_t CGPathApplyWithBlock2()
{
  return MEMORY[0x24BDBEE18]();
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x24BDBEE20](path);
}

CGPathRef CGPathCreateCopyByIntersectingPath(CGPathRef path, CGPathRef maskPath, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x24BDBEE38](path, maskPath, evenOddFillRule);
}

CGPathRef CGPathCreateCopyByNormalizing(CGPathRef path, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x24BDBEE40](path, evenOddFillRule);
}

CGPathRef CGPathCreateCopyBySubtractingPath(CGPathRef path, CGPathRef maskPath, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x24BDBEE50](path, maskPath, evenOddFillRule);
}

CGPathRef CGPathCreateCopyBySymmetricDifferenceOfPath(CGPathRef path, CGPathRef maskPath, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x24BDBEE58](path, maskPath, evenOddFillRule);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEE60](path, transform);
}

CGPathRef CGPathCreateCopyByUnioningPath(CGPathRef path, CGPathRef maskPath, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x24BDBEE68](path, maskPath, evenOddFillRule);
}

CGPathRef CGPathCreateCopyOfLineByIntersectingPath(CGPathRef path, CGPathRef maskPath, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x24BDBEE70](path, maskPath, evenOddFillRule);
}

CGPathRef CGPathCreateCopyOfLineBySubtractingPath(CGPathRef path, CGPathRef maskPath, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x24BDBEE78](path, maskPath, evenOddFillRule);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEEA8](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGPathEqualToPath(CGPathRef path1, CGPathRef path2)
{
  return MEMORY[0x24BDBEEB8](path1, path2);
}

uint64_t CGPathGetNumberOfElements()
{
  return MEMORY[0x24BDBEED0]();
}

uint64_t CGPathGetNumberOfPoints()
{
  return MEMORY[0x24BDBEED8]();
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBEEE0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t CGPathIsEllipseWithTransform()
{
  return MEMORY[0x24BDBEF08]();
}

BOOL CGPathIsEmpty(CGPathRef path)
{
  return MEMORY[0x24BDBEF10](path);
}

uint64_t CGPathIsPrimitive()
{
  return MEMORY[0x24BDBEF20]();
}

uint64_t CGPathIsRectWithTransform()
{
  return MEMORY[0x24BDBEF30]();
}

uint64_t CGPathIsRoundedRectWithTransform()
{
  return MEMORY[0x24BDBEF38]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEF40](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x24BDBEF50](path);
}

uint64_t CGPatternGetImage()
{
  return MEMORY[0x24BDBEF68]();
}

uint64_t CGPatternGetMatrix()
{
  return MEMORY[0x24BDBEF70]();
}

uint64_t CGPatternGetShading()
{
  return MEMORY[0x24BDBEF78]();
}

uint64_t CGPatternIsColored()
{
  return MEMORY[0x24BDBEF80]();
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x24BDBF058]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectStandardize(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF080]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CGRenderingStateGetAllowsAntialiasing()
{
  return MEMORY[0x24BDBF0C8]();
}

uint64_t CGRenderingStateGetBaseCTM()
{
  return MEMORY[0x24BDBF0D0]();
}

uint64_t CGRenderingStateGetFontRenderingStyle()
{
  return MEMORY[0x24BDBF0D8]();
}

uint64_t CGShadingGetBackground()
{
  return MEMORY[0x24BDBF0F0]();
}

uint64_t CGShadingGetBounds()
{
  return MEMORY[0x24BDBF0F8]();
}

uint64_t CGShadingGetColorSpace()
{
  return MEMORY[0x24BDBF100]();
}

uint64_t CGShadingGetDescriptor()
{
  return MEMORY[0x24BDBF108]();
}

uint64_t CGShadingGetType()
{
  return MEMORY[0x24BDBF110]();
}

uint64_t CGSoftMaskCreate()
{
  return MEMORY[0x24BDBF150]();
}

uint64_t CGSoftMaskDelegateDrawSoftMask()
{
  return MEMORY[0x24BDBF158]();
}

uint64_t CGSoftMaskGetBackground()
{
  return MEMORY[0x24BDBF160]();
}

uint64_t CGSoftMaskGetBounds()
{
  return MEMORY[0x24BDBF168]();
}

uint64_t CGSoftMaskGetIdentifier()
{
  return MEMORY[0x24BDBF170]();
}

uint64_t CGSoftMaskGetMatrix()
{
  return MEMORY[0x24BDBF178]();
}

uint64_t CGSoftMaskGetTransfer()
{
  return MEMORY[0x24BDBF180]();
}

uint64_t CGStyleGetColor()
{
  return MEMORY[0x24BDBF1B0]();
}

uint64_t CGStyleGetData()
{
  return MEMORY[0x24BDBF1B8]();
}

uint64_t CGStyleGetDrawOrdering()
{
  return MEMORY[0x24BDBF1C0]();
}

uint64_t CGStyleGetIdentifier()
{
  return MEMORY[0x24BDBF1C8]();
}

uint64_t CGStyleGetType()
{
  return MEMORY[0x24BDBF1D0]();
}

uint64_t CGTextClippingCreatePath()
{
  return MEMORY[0x24BDBF1E0]();
}

CGFontRef CTFontCopyGraphicsFont(CTFontRef font, CTFontDescriptorRef *attributes)
{
  return (CGFontRef)MEMORY[0x24BDC4728](font, attributes);
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return (CTFontRef)MEMORY[0x24BDC47D0](name, matrix, options, size);
}

CFIndex CTRunGetGlyphCount(CTRunRef run)
{
  return MEMORY[0x24BDC4B28](run);
}

CTRunStatus CTRunGetStatus(CTRunRef run)
{
  return MEMORY[0x24BDC4B58](run);
}

void CTRunGetStringIndices(CTRunRef run, CFRange range, CFIndex *buffer)
{
  MEMORY[0x24BDC4B60](run, range.location, range.length, buffer);
}

const CFIndex *__cdecl CTRunGetStringIndicesPtr(CTRunRef run)
{
  return (const CFIndex *)MEMORY[0x24BDC4B68](run);
}

CFTypeID CTRunGetTypeID(void)
{
  return MEMORY[0x24BDC4B80]();
}

size_t IOSurfaceAlignProperty(CFStringRef property, size_t value)
{
  return MEMORY[0x24BDD8B28](property, value);
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x24BDD8B48](buffer, key);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8B50](properties);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x24BDD8B80](buffer);
}

uint64_t IOSurfaceGetBulkAttachments()
{
  return MEMORY[0x24BDD8BB0]();
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8BD0](buffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C48](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C68](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C80](buffer);
}

CFTypeID IOSurfaceGetTypeID(void)
{
  return MEMORY[0x24BDD8CB8]();
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8CD0](buffer);
}

Boolean IOSurfaceIsInUse(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8CF8](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8D08](buffer, *(_QWORD *)&options, seed);
}

uint64_t IOSurfaceSetBulkAttachments2()
{
  return MEMORY[0x24BDD8D98]();
}

kern_return_t IOSurfaceSetPurgeable(IOSurfaceRef buffer, uint32_t newState, uint32_t *oldState)
{
  return MEMORY[0x24BDD8DB0](buffer, *(_QWORD *)&newState, oldState);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
  MEMORY[0x24BDD8DB8](buffer, key, value);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8DD0](buffer, *(_QWORD *)&options, seed);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x24BDDD388]();
}

uint64_t MTLPixelFormatGetName()
{
  return MEMORY[0x24BDDD390]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x24BEDAC50](this, __n, __c);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x24BEDAEE8]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x24BEDAEF0]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x24BEDAF10]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
  MEMORY[0x24BEDB0F8](this);
}

void std::condition_variable::wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk)
{
  MEMORY[0x24BEDB110](this, __lk);
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
  MEMORY[0x24BEDB118](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
  MEMORY[0x24BEDB1B0](*(_QWORD *)&__ev, __what_arg);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x24BEDB368](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x24BEDB370](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x24BEDB380](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

uint64_t operator delete[]()
{
  return off_24C222498();
}

void operator delete(void *__p)
{
  off_24C2224A0(__p);
}

uint64_t operator delete()
{
  return off_24C2224A8();
}

uint64_t operator new[]()
{
  return off_24C2224B0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C2224B8(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_24C2224C0(__sz, a2);
}

uint64_t operator new()
{
  return off_24C2224C8();
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

simd_float4 _simd_exp2_f4(simd_float4 x)
{
  simd_float4 result;

  MEMORY[0x24BDACD38]((__n128)x);
  return result;
}

simd_float4 _simd_log2_f4(simd_float4 x)
{
  simd_float4 result;

  MEMORY[0x24BDACDB8]((__n128)x);
  return result;
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x24BDAD108](__x);
  return result;
}

long double asin(long double __x)
{
  long double result;

  MEMORY[0x24BDAD188](__x);
  return result;
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x24BDAD200](a1, a2);
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_after_f(dispatch_time_t when, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADC68](when, queue, context, work);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADCD8](queue, context, work);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x24BDADD60](buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADFF0](queue, context, work);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x24BDAE0C0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x24BDAE108]();
}

double erand48(unsigned __int16 a1[3])
{
  double result;

  MEMORY[0x24BDAE1A0](a1);
  return result;
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

float exp2f(float a1)
{
  float result;

  MEMORY[0x24BDAE280](a1);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAE3F8](a1, a2);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

float frexpf(float a1, int *a2)
{
  float result;

  MEMORY[0x24BDAE488](a2, a1);
  return result;
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

int getpagesize(void)
{
  return MEMORY[0x24BDAE6B8]();
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x24BDAEAA0](a1, a2);
}

float log2f(float a1)
{
  float result;

  MEMORY[0x24BDAEAE0](a1);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x24BDAEAF8](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

size_t malloc_good_size(size_t size)
{
  return MEMORY[0x24BDAED38](size);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x24BDAEFC8](a1, a2, *(_QWORD *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

id objc_initWeakOrNil(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C8](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

id objc_storeWeakOrNil(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD428](location, obj);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x24BDAF240](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x24BDAF478](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAF690](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x24BDAF6F8](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

uint64_t proc_pidoriginatorinfo()
{
  return MEMORY[0x24BDAF700]();
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x24BDAF8A8](a1);
}

int pthread_main_np(void)
{
  return MEMORY[0x24BDAF8B0]();
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

float scalbnf(float a1, int a2)
{
  float result;

  MEMORY[0x24BDAFC40](*(_QWORD *)&a2, a1);
  return result;
}

int setlinebuf(FILE *a1)
{
  return MEMORY[0x24BDAFD38](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int snprintf_l(char *a1, size_t a2, locale_t a3, const char *a4, ...)
{
  return MEMORY[0x24BDAFE48](a1, a2, a3, a4);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x24BDAFF08](__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x24BDAFF28](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x24BDAFFC0](__s, __charset);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

double strtod(const char *a1, char **a2)
{
  double result;

  MEMORY[0x24BDAFFD0](a1, a2);
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

float tanf(float a1)
{
  float result;

  MEMORY[0x24BDB0140](a1);
  return result;
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x24BDB0220](*(_QWORD *)&thread, *(_QWORD *)&flavor, policy_info, *(_QWORD *)&policy_infoCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

void uuid_clear(uuid_t uu)
{
  MEMORY[0x24BDB0300](uu);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x24BDB0310](dst, src);
}

void uuid_generate(uuid_t out)
{
  MEMORY[0x24BDB0318](out);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x24BDB0328](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x24BDB0330](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0338](uu, out);
}

vImage_Error vImageAffineWarp_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, const vImage_AffineTransform *transform, const Pixel_8888 backColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB35F8](src, dest, tempBuffer, transform, backColor, *(_QWORD *)&flags);
}

vImage_Error vImageAffineWarp_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, const vImage_AffineTransform *transform, Pixel_8 backColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB3600](src, dest, tempBuffer, transform, backColor, *(_QWORD *)&flags);
}

vImage_Error vImageBoxConvolve_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, const Pixel_8888 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB3610](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, *(_QWORD *)&kernel_height, *(_QWORD *)&kernel_width, backgroundColor);
}

vImage_Error vImageBoxConvolve_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, Pixel_8 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB3618](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, *(_QWORD *)&kernel_height, *(_QWORD *)&kernel_width, backgroundColor);
}

vImage_Error vImageBuffer_InitWithCGImage(vImage_Buffer *buf, vImage_CGImageFormat *format, const CGFloat *backgroundColor, CGImageRef image, vImage_Flags flags)
{
  return MEMORY[0x24BDB3638](buf, format, backgroundColor, image, *(_QWORD *)&flags);
}

vImage_Error vImageClipToAlpha_RGBA8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB3650](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageMatrixMultiply_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const int16_t matrix[16], int32_t divisor, const int16_t *pre_bias, const int32_t *post_bias, vImage_Flags flags)
{
  return MEMORY[0x24BDB3910](src, dest, matrix, *(_QWORD *)&divisor, pre_bias, post_bias, *(_QWORD *)&flags);
}

vImage_Error vImageOverwriteChannelsWithScalar_ARGB8888(Pixel_8 scalar, const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t copyMask, vImage_Flags flags)
{
  return MEMORY[0x24BDB3938](scalar, src, dest, copyMask, *(_QWORD *)&flags);
}

vImage_Error vImagePermuteChannels_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x24BDB3948](src, dest, permuteMap, *(_QWORD *)&flags);
}

vImage_Error vImagePremultiplyData_RGBA8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB3968](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageTableLookUp_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const Pixel_8 alphaTable[256], const Pixel_8 redTable[256], const Pixel_8 greenTable[256], const Pixel_8 blueTable[256], vImage_Flags flags)
{
  return MEMORY[0x24BDB3A88](src, dest, alphaTable, redTable, greenTable, blueTable, *(_QWORD *)&flags);
}

vImage_Error vImageTableLookUp_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, const Pixel_8 table[256], vImage_Flags flags)
{
  return MEMORY[0x24BDB3A90](src, dest, table, *(_QWORD *)&flags);
}

vImage_Error vImageTentConvolve_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, const Pixel_8888 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB3A98](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, *(_QWORD *)&kernel_height, *(_QWORD *)&kernel_width, backgroundColor);
}

vImage_Error vImageTentConvolve_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, Pixel_8 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB3AA0](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, *(_QWORD *)&kernel_height, *(_QWORD *)&kernel_width, backgroundColor);
}

vImage_Error vImageUnpremultiplyData_RGBA8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB3AA8](src, dest, *(_QWORD *)&flags);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0358](a1, a2, a3);
}

