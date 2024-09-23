long double sinl(long double __x)
{
  double v1;
  char v2;
  uint64_t *v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unsigned __int128 v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t *v16;

  v1 = fabs(__x);
  if (__x != 0.0)
  {
    if (v1 <= 0.785398163)
      JUMPOUT(0x1DEE484A8);
    if (v1 < 524288.617)
    {
      if ((vcvtnd_s64_f64(__x * 0.636619772) & 1) == 0)
        JUMPOUT(0x1DEE484B0);
      JUMPOUT(0x1DEE485B0);
    }
    if ((*(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFuLL) >> 52 == 2047)
    {
      return __x - __x;
    }
    else
    {
      v2 = (((*(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFuLL) >> 52) + 1) & 0x3F;
      v3 = &qword_1DEE47D78[-((((*(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFuLL) >> 52) - 1023) >> 6)];
      if (v2)
      {
        v4 = *v3;
        v5 = v3[1];
        v6 = v3 + 2;
        v7 = (v6[1] << v2) | (*v6 >> (64 - v2));
        v8 = (v5 >> (64 - v2)) | (*v6 << v2);
        v9 = (v4 >> (64 - v2)) | (v5 << v2);
      }
      else
      {
        v9 = v3[1];
        v16 = (unint64_t *)(v3 + 2);
        v8 = *v16;
        v7 = v16[1];
      }
      v10 = __PAIR128__(v7 * ((*(_QWORD *)&__x << 11) | 0x8000000000000000), ((unint64_t)v9 * (unsigned __int128)((*(_QWORD *)&__x << 11) | 0x8000000000000000)) >> 64)+ v8 * (unsigned __int128)((*(_QWORD *)&__x << 11) | 0x8000000000000000);
      v11 = (4 * *((_QWORD *)&v10 + 1)) >> 63;
      v12 = (*((_QWORD *)&v10 + 1) ^ v11) & 0x1FFFFFFFFFFFFFFFLL;
      v13 = v10 ^ v11;
      v14 = __clz(v12);
      v15 = (v12 << v14) | (v13 >> (64 - v14));
      if (((4 * *((_QWORD *)&v10 + 1)) ^ (2 * *((_QWORD *)&v10 + 1))) >= 0)
        return sub_1DEE48428(*(int8x16_t *)&__x, v13, v15, v14);
      else
        return sub_1DEE48538(v13, v15, v14);
    }
  }
  return __x;
}

long double cosl(long double __x)
{
  char v1;
  uint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unsigned __int128 v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t *v16;

  __x = fabs(__x);
  if (__x <= 0.785398163)
    JUMPOUT(0x1DEE485A8);
  if (__x < 524288.617)
  {
    if ((vcvtnd_s64_f64(__x * 0.636619772) & 1) != 0)
      JUMPOUT(0x1DEE484B0);
    JUMPOUT(0x1DEE485B0);
  }
  if (*(_QWORD *)&__x >> 52 == 2047)
    JUMPOUT(0x1DEE47F24);
  v1 = ((*(_QWORD *)&__x >> 52) + 1) & 0x3F;
  v2 = &qword_1DEE47D78[-((unint64_t)((*(_QWORD *)&__x >> 52) - 1023) >> 6)];
  if (v1)
  {
    v3 = *v2;
    v4 = v2[1];
    v5 = v2 + 2;
    v6 = (v5[1] << v1) | (*v5 >> (64 - v1));
    v7 = (v4 >> (64 - v1)) | (*v5 << v1);
    v8 = (v3 >> (64 - v1)) | (v4 << v1);
  }
  else
  {
    v8 = v2[1];
    v16 = (unint64_t *)(v2 + 2);
    v7 = *v16;
    v6 = v16[1];
  }
  v9 = __PAIR128__(v6 * ((*(_QWORD *)&__x << 11) | 0x8000000000000000), ((unint64_t)v8 * (unsigned __int128)((*(_QWORD *)&__x << 11) | 0x8000000000000000)) >> 64)+ v7 * (unsigned __int128)((*(_QWORD *)&__x << 11) | 0x8000000000000000);
  v10 = (4 * *((_QWORD *)&v9 + 1)) >> 63;
  v11 = (*((_QWORD *)&v9 + 1) ^ v10) & 0x1FFFFFFFFFFFFFFFLL;
  v12 = v9 ^ v10;
  v13 = __clz(v11);
  v14 = (v11 << v13) | (v12 >> (64 - v13));
  if (((4 * *((_QWORD *)&v9 + 1)) ^ (2 * *((_QWORD *)&v9 + 1))) < 0)
    return sub_1DEE48428(*(int8x16_t *)&__x, v12, v14, v13);
  else
    return sub_1DEE48538(v12, v14, v13);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  char v3;
  uint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unsigned __int128 v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int8x16_t v15;
  double v16;
  double v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t *v21;
  double v22;
  char v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  __double2 result;

  v2 = fabs(a1);
  if (a1 == 0.0)
    JUMPOUT(0x1DEE47F14);
  if (v2 <= 0.785398163)
  {
LABEL_12:
    sub_1DEE4859C();
    JUMPOUT(0x1DEE484B0);
  }
  if (v2 < 524288.617)
  {
    v22 = vrndnd_f64(a1 * 0.636619772);
    v23 = vcvtnd_s64_f64(a1 * 0.636619772);
    v24 = v22 * 1.57079633;
    v25 = v22 * 2.56334415e-12;
    v26 = v22 * 1.05629991e-23;
    a1 = a1 - v22 * 1.57079633;
    v27 = a1 - v22 * 2.56334415e-12;
    v28 = a1 - v27 - v22 * 2.56334415e-12;
    v29 = v28 - v26;
    if ((v23 & 1) != 0)
    {
      sub_1DEE4849C(*(int8x16_t *)&a1, v25, v28, v1, 0.636619772, v24, v27, v29);
      JUMPOUT(0x1DEE485B0);
    }
    goto LABEL_12;
  }
  if ((*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) >> 52 == 2047)
    JUMPOUT(0x1DEE47F20);
  v3 = (((*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) >> 52) + 1) & 0x3F;
  v4 = &qword_1DEE47D78[-((((*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) >> 52) - 1023) >> 6)];
  if (v3)
  {
    v5 = *v4;
    v6 = v4[1];
    v7 = v4 + 2;
    v8 = (v7[1] << v3) | (*v7 >> (64 - v3));
    v9 = (v6 >> (64 - v3)) | (*v7 << v3);
    v10 = (v5 >> (64 - v3)) | (v6 << v3);
  }
  else
  {
    v10 = v4[1];
    v21 = (unint64_t *)(v4 + 2);
    v9 = *v21;
    v8 = v21[1];
  }
  v11 = __PAIR128__(v8 * ((*(_QWORD *)&a1 << 11) | 0x8000000000000000), ((unint64_t)v10 * (unsigned __int128)((*(_QWORD *)&a1 << 11) | 0x8000000000000000)) >> 64)+ v9 * (unsigned __int128)((*(_QWORD *)&a1 << 11) | 0x8000000000000000);
  if (((4 * *((_QWORD *)&v11 + 1)) ^ (2 * *((_QWORD *)&v11 + 1))) < 0)
  {
    v18 = sub_1DEE48420();
    v16 = sub_1DEE48538(v18, v19, v20);
  }
  else
  {
    v12 = sub_1DEE48530();
    v16 = sub_1DEE48428(v15, v12, v13, v14);
  }
  result.__cosval = v17;
  result.__sinval = v16;
  return result;
}

long double tanl(long double __x)
{
  double v1;
  unint64_t v2;
  BOOL v3;
  char v4;
  uint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unsigned __int128 v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  double v18;
  int8x16_t v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  unint64_t *v25;
  double v26;
  unint64_t v27;

  v1 = fabs(__x);
  if (__x == 0.0)
    JUMPOUT(0x1DEE47F28);
  v2 = 0;
  v3 = v1 > 0.785398163;
  if (v1 >= 0.785398163)
  {
    if (v1 < 524288.617)
    {
      v26 = vrndnd_f64(__x * 0.636619772);
      v27 = vcvtnd_s64_f64(__x * 0.636619772);
      __x = __x
          - v26 * 1.57079633
          - v26 * 2.56334415e-12
          + __x
          - v26 * 1.57079633
          - (__x
           - v26 * 1.57079633
           - v26 * 2.56334415e-12)
          - v26 * 2.56334415e-12
          - v26 * 1.05629991e-23;
      v2 = v27 << 63;
      v3 = (v27 & 1) != 0;
    }
    else
    {
      if ((*(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFuLL) >> 52 == 2047)
        JUMPOUT(0x1DEE47F24);
      v4 = (((*(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFuLL) >> 52) + 1) & 0x3F;
      v5 = &qword_1DEE47D78[-((((*(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFuLL) >> 52) - 1023) >> 6)];
      if (v4)
      {
        v6 = *v5;
        v7 = v5[1];
        v8 = v5 + 2;
        v9 = (v8[1] << v4) | (*v8 >> (64 - v4));
        v10 = (v7 >> (64 - v4)) | (*v8 << v4);
        v11 = (v6 >> (64 - v4)) | (v7 << v4);
      }
      else
      {
        v11 = v5[1];
        v25 = (unint64_t *)(v5 + 2);
        v10 = *v25;
        v9 = v25[1];
      }
      v12 = __PAIR128__(v9 * ((*(_QWORD *)&__x << 11) | 0x8000000000000000), ((unint64_t)v11 * (unsigned __int128)((*(_QWORD *)&__x << 11) | 0x8000000000000000)) >> 64)+ v10 * (unsigned __int128)((*(_QWORD *)&__x << 11) | 0x8000000000000000);
      v2 = (*(_QWORD *)&__x & 0x8000000000000000 ^ (2 * *((_QWORD *)&v12 + 1))) & 0x8000000000000000;
      v13 = (4 * *((_QWORD *)&v12 + 1)) >> 63;
      v14 = (*((_QWORD *)&v12 + 1) ^ v13) & 0x1FFFFFFFFFFFFFFFLL;
      v15 = v12 ^ v13;
      v3 = ((4 * *((_QWORD *)&v12 + 1)) ^ (2 * *((_QWORD *)&v12 + 1))) < 0;
      v16 = __clz(v14);
      *(_QWORD *)&__x = COERCE__INT64(vcvtd_n_f64_u64((0xC90FDAA22168C235* (unsigned __int128)((v14 << v16) | (v15 >> (64 - v16)))) >> 64, 0x3DuLL))- (v16 << 52);
    }
  }
  v17 = __x * __x;
  v18 = __x
      * __x
      * (__x
       * __x
       * (__x
        * __x
        * (__x * __x * (__x * __x * (__x * __x * -1.13585365e-11 + 0.00000000208757008) + -0.000000275573142)
         + 0.0000248015873)
        + -0.00138888889)
       + 0.0416666667)
      + -0.5;
  *(double *)v19.i64 = __x
                     + __x
                     * (__x
                      * __x
                      * (__x
                       * __x
                       * (__x
                        * __x
                        * (__x * __x * (__x * __x * (loc_1DEE483F8 + __x * __x * loc_1DEE483F0) + 0.00000275573136)
                         + -0.000198412698)
                        + 0.00833333333)
                       + -0.166666667));
  v20 = veorq_s8(v19, (int8x16_t)vdupq_n_s64(v2)).u64[0];
  v21 = v17 * v18 + 1.0;
  if (v3)
    v22 = v17 * v18 + 1.0;
  else
    v22 = *(double *)&v20;
  if (v3)
    v23 = *(double *)&v20;
  else
    v23 = v21;
  return v22 / v23;
}

uint64_t sub_1DEE48420()
{
  return sub_1DEE48428();
}

double sub_1DEE48428(int8x16_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;

  v5 = (0xC90FDAA22168C235 * (unsigned __int128)a3) >> 64;
  a1.i64[0] = COERCE__INT64(vcvtd_n_f64_u64(v5, 0x3DuLL)) - (a4 << 52);
  *(double *)a1.i64 = COERCE_DOUBLE(COERCE__INT64(vcvtd_n_f64_u64(v5 & 0xFFFFFFFFFFFFLL, 0x3DuLL)) - (a4 << 52))
                    + *(double *)a1.i64
                    * (*(double *)a1.i64
                     * *(double *)a1.i64
                     * (*(double *)a1.i64
                      * *(double *)a1.i64
                      * (*(double *)a1.i64
                       * *(double *)a1.i64
                       * (*(double *)a1.i64
                        * *(double *)a1.i64
                        * (*(double *)a1.i64
                         * *(double *)a1.i64
                         * (loc_1DEE483F8 + *(double *)a1.i64 * *(double *)a1.i64 * loc_1DEE483F0)
                         + 0.00000275573136)
                        + -0.000198412698)
                       + 0.00833333333)
                      + -0.166666667))
                    + COERCE_DOUBLE(COERCE__INT64(vcvtd_n_f64_u64(v5 & 0xFFFF000000000000, 0x3DuLL)) - (a4 << 52));
  a1.i64[0] = veorq_s8(a1, (int8x16_t)vdupq_n_s64(v4)).u64[0];
  return *(double *)a1.i64;
}

double sub_1DEE4849C(int8x16_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  unint64_t v8;

  *(double *)a1.i64 = a7 + a8;
  *(double *)a1.i64 = a8
                    + (a7 + a8)
                    * (*(double *)a1.i64
                     * *(double *)a1.i64
                     * (*(double *)a1.i64
                      * *(double *)a1.i64
                      * (*(double *)a1.i64
                       * *(double *)a1.i64
                       * (*(double *)a1.i64
                        * *(double *)a1.i64
                        * (*(double *)a1.i64
                         * *(double *)a1.i64
                         * (loc_1DEE483F8 + *(double *)a1.i64 * *(double *)a1.i64 * loc_1DEE483F0)
                         + 0.00000275573136)
                        + -0.000198412698)
                       + 0.00833333333)
                      + -0.166666667))
                    + a7;
  a1.i64[0] = veorq_s8(a1, (int8x16_t)vdupq_n_s64(v8)).u64[0];
  return *(double *)a1.i64;
}

uint64_t sub_1DEE48530()
{
  return sub_1DEE48538();
}

double sub_1DEE48538(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  double v4;
  double result;

  *(_QWORD *)&v4 = COERCE__INT64(vcvtd_n_f64_u64((((0xC90FDAA22168C235 * (unsigned __int128)a2) >> 64)* ((0xC90FDAA22168C235 * (unsigned __int128)a2) >> 64)) >> 64, 0x3AuLL))- (a3 << 53);
  *(_QWORD *)&result = COERCE__INT64(v4* (v4* (v4* (v4* (v4 * (v4 * (v4 * -1.13585365e-11 + 0.00000000208757008) + -0.000000275573142)+ 0.0000248015873)+ -0.00138888889)+ 0.0416666667)+ -0.5)+ 1.0)+ v3;
  return result;
}

void sub_1DEE4859C()
{
  JUMPOUT(0x1DEE48558);
}

long double fmodl(long double __x, long double __y)
{
  unint64_t v2;
  unint64_t v3;
  double v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  char v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  unint64_t v25;
  int v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;

  v2 = *(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFLL;
  v3 = *(_QWORD *)&__y & 0x7FFFFFFFFFFFFFFFLL;
  if ((*(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFuLL) - 0x7FF0000000000000 < 0x8010000000000001
    || (*(_QWORD *)&__y & 0x7FFFFFFFFFFFFFFFuLL) - 0x7FF0000000000000 < 0x8010000000000001)
  {
    v5 = NAN;
    if (fabs(__x) == INFINITY || __y == 0.0)
      return v5;
    if (__x == 0.0 || fabs(__y) == INFINITY)
      return __x;
  }
  if (v3 >= v2)
  {
    if (v3 == v2)
      *(_QWORD *)&v5 = *(_QWORD *)&__x & 0x8000000000000000;
    else
      return __x;
  }
  else
  {
    v6 = 0;
    v7 = v2 >> 52;
    v8 = v3 >> 52;
    v9 = __clz(v2);
    v10 = v9 - 11;
    v11 = 12 - v9;
    if ((_DWORD)v7)
      v12 = v7;
    else
      v12 = v11;
    v13 = *(_QWORD *)&__x & 0xFFFFFFFFFFFFFLL;
    v14 = *(_QWORD *)&__y & 0xFFFFFFFFFFFFFLL;
    if (!(_DWORD)v7)
      v13 = (*(_QWORD *)&__x & 0xFFFFFFFFFFFFFLL) << v10;
    v15 = __clz(v3);
    v16 = v14 << (v15 - 11);
    v17 = 12 - v15;
    if ((_DWORD)v8)
      v17 = v8;
    else
      v14 = v16;
    v18 = v13 | 0x10000000000000;
    v19 = v14 | 0x10000000000000;
    v20 = v12 - v17;
    do
    {
      v20 += ~v6;
      v21 = (v18 << v6) - v19;
      v22 = v19 & (v21 >> 63);
      v18 = v22 + 2 * v21;
      v6 = __clz(v18) - 11;
    }
    while (v20 >= v6 && v18 != 0);
    v24 = (uint64_t)(v18 + v22) >> 1;
    if (v20 >= 0)
      v24 = v18;
    v25 = v24 << (v20 & ~(v20 >> 31));
    if (v25)
    {
      v26 = __clz(v25) - 11;
      v27 = (v17 - v26);
      v28 = *(_QWORD *)&__x & 0x8000000000000000 | (v25 << v26) & 0xFFFFFFFFFFFFFLL;
      if ((int)v27 < 1)
        return COERCE_DOUBLE(v28 | ((unint64_t)(v27 + 1022) << 52)) * 2.22507386e-308;
      v29 = v28 | (v27 << 52);
    }
    else
    {
      v29 = *(_QWORD *)&__x & 0x8000000000000000;
    }
    return *(double *)&v29;
  }
  return v5;
}

__complex_double cexpl(__complex_double result)
{
  float64x2_t v2;
  double v3;
  long double v4;
  double v5;
  _BOOL4 v6;
  _BOOL4 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  if (result.c[0] != -INFINITY || (*(_QWORD *)&result.c[1] & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000)
  {
    if (result.c[1] == 0.0)
    {
      result.c[0] = expl(result.c[0]);
      v3 = 0.0;
    }
    else
    {
      v12 = result.c[1];
      v14 = result.c[0];
      v3 = sinl(result.c[1]);
      result.c[0] = INFINITY;
      if (v14 != INFINITY || v12 != INFINITY)
      {
        v4 = v12;
        v13 = v3;
        v5 = cosl(v4);
        v6 = v14 < 1419.56543;
        v7 = v14 > 709.782713;
        if (v6 && v7)
          v8 = v5 * 1.79769313e308;
        else
          v8 = v5;
        if (v6 && v7)
          v9 = v13 * 1.79769313e308;
        else
          v9 = v13;
        if (v6 && v7)
          v10 = v14 + -709.782713;
        else
          v10 = v14;
        v11 = expl(v10);
        result.c[0] = v8 * v11;
        v3 = v9 * v11;
      }
    }
  }
  else
  {
    result.c[0] = 0.0;
    v2.f64[0] = NAN;
    v2.f64[1] = NAN;
    *(_QWORD *)&v3 = vbslq_s8((int8x16_t)vnegq_f64(v2), (int8x16_t)result, *(int8x16_t *)((char *)&result + 8)).u64[0];
  }
  result.c[1] = v3;
  return result;
}

long double asinl(long double __x)
{
  if (__x < -0.5)
    return -sub_1DEE489CC(-__x);
  if (__x > 0.5)
    return sub_1DEE489CC(__x);
  if (__x < -0.0000000214911933 || __x > 0.0000000214911933)
    return __x
         + __x
         * __x
         * (((((((((((__x * __x * 0.0316658386 + -0.0158620441) * (__x * __x) + 0.0192942787) * (__x * __x)
                  + 0.00661531652)
                 * (__x
                  * __x)
                 + 0.0121483893)
                * (__x
                 * __x)
                + 0.013888541)
               * (__x
                * __x)
               + 0.0173593517)
              * (__x
               * __x)
              + 0.0223717831)
             * (__x
              * __x)
             + 0.030381958)
            * (__x
             * __x)
            + 0.0446428569)
           * (__x
            * __x)
           + 0.075)
          * (__x
           * __x)
          + 0.166666667)
         * __x;
  if (__x <= -2.22507386e-308 || __x >= 2.22507386e-308)
    return (2.22507386e-308 + 1.0) * __x;
  return __x - __x * __x;
}

double sub_1DEE489CC(double a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (a1 >= 1.0)
  {
    if (a1 == 1.0)
      return 2.22507386e-308 + 1.57079633;
    else
      return INFINITY - INFINITY;
  }
  else
  {
    v1 = (((((((((((a1 * -0.000012118982 + 0.000130756419) * a1 + -0.000670248512) * a1 + 0.0021912256) * a1
               + -0.00520497316)
              * a1
              + 0.00978682936)
             * a1
             + -0.0156746039)
            * a1
            + 0.022988348)
           * a1
           + -0.0331919619)
          * a1
          + 0.0506659694)
         * a1
         + -0.0890259194)
        * a1
        + 0.214599334)
       * a1;
    v2 = 1.0 - a1;
    v3 = 1.0 / sqrt(v2);
    v4 = v2 * v3;
    v5 = -(v2 * v3 - v3 * v2);
    v6 = v4 * -0.5 * (v3 * v4 + -1.0 + v3 * v5);
    v7 = v4 + v6;
    v8 = v5 + v6 + v4 - (v4 + v6);
    v9 = v1 + -1.5707962;
    return v7 * v9
         + 1.57079633
         + v7 * v9
         + 1.57079633
         - (v7 * v9
          + 1.57079633)
         + v7 * (v1 + -1.5707962 - (v1 + -1.5707962) + 1.06407195e-16)
         - (v7 * v9
          - v7 * v9)
         + v8 * v9
         + 6.123234e-17;
  }
}

double sub_1DEE48B30(double a1)
{
  double v1;
  double v2;

  if (a1 >= 9.00719925e15)
  {
    v2 = 2.22507386e-308;
  }
  else
  {
    v1 = 1.0 / a1;
    v2 = 6.123234e-17
       - (v1
        + v1
        * v1
        * ((((((((((v1 * v1 * -0.0118364085 + 0.0313068402) * (v1 * v1) + -0.0470977989) * (v1 * v1) + 0.0575572606)
               * (v1
                * v1)
               + -0.0664685022)
              * (v1
               * v1)
              + 0.0769018905)
             * (v1
              * v1)
             + -0.0909075706)
            * (v1
             * v1)
            + 0.111111041)
           * (v1
            * v1)
           + -0.142857141)
          * (v1
           * v1)
          + 0.2)
         * (v1
          * v1)
         + -0.333333333)
        * v1);
  }
  return v2 + 1.57079633;
}

long double erfcl(long double __x)
{
  long double result;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  if ((*(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFuLL) - 0x7FF0000000000000 <= 0x8010000000000000)
  {
    result = 1.0;
    if (__x != 0.0)
      return 1.0 - COERCE_DOUBLE(*(_QWORD *)&__x & 0x8000000000000000 | 0x3FF0000000000000);
    return result;
  }
  v4 = fabs(__x);
  if (v4 <= 0.46875)
  {
    if (v4 <= 1.11e-16)
    {
      v15 = v4 * 3209.37759;
      v16 = 2844.23683;
    }
    else
    {
      v11 = 0;
      v12 = __x * __x;
      v13 = __x * __x * 0.185777706;
      v14 = __x * __x;
      do
      {
        v13 = v12 * (v13 + *(double *)&qword_1DEE7CC70[v11]);
        v14 = v12 * (v14 + *(double *)&qword_1DEE7CC98[v11++]);
      }
      while (v11 != 3);
      v15 = v4 * (v13 + 3209.37759);
      v16 = v14 + 2844.23683;
    }
    v5 = 1.0 - v15 / v16;
    goto LABEL_20;
  }
  if (v4 <= 4.0)
  {
    v17 = 0;
    v18 = v4 * 0.0000000215311535;
    v19 = v4;
    do
    {
      v18 = v4 * (v18 + *(double *)&qword_1DEE7CCB8[v17]);
      v19 = v4 * (v19 + *(double *)&qword_1DEE7CD00[v17++]);
    }
    while (v17 != 7);
    v10 = (v18 + 1230.33935) / (v19 + 1230.33935);
  }
  else
  {
    v5 = 0.0;
    if (v4 >= 27.2)
      goto LABEL_20;
    v6 = 0;
    v7 = 1.0 / (__x * __x);
    v8 = v7 * 0.0163153871;
    v9 = v7;
    do
    {
      v8 = v7 * (v8 + *(double *)&qword_1DEE7CD40[v6]);
      v9 = v7 * (v9 + *(double *)&qword_1DEE7CD70[v6++]);
    }
    while (v6 != 4);
    v10 = (0.564189584 - v7 * (v8 + 0.000658749162) / (v9 + 0.00233520498)) / v4;
  }
  v20 = trunc(v4 * 16.0) * 0.0625;
  v21 = v4 - v20;
  v22 = v4 + v20;
  v23 = expl(-(v20 * v20));
  v5 = v23 * expl(-(v21 * v22)) * v10;
LABEL_20:
  result = 2.0 - v5;
  if (__x >= 0.0)
    return v5;
  return result;
}

float erff(float result)
{
  unsigned int v1;
  int v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float v24;

  v1 = LODWORD(result) & 0x80000000;
  if ((LODWORD(result) & 0x7FFFFFFFu) - 2139095040 >= 0x80800001)
  {
    v3 = result;
    v4 = fabs(result);
    if (v4 <= 0.46875)
    {
      if (v4 <= 1.11e-16)
      {
        v15 = v4 * 3209.37759;
        v16 = 2844.23683;
      }
      else
      {
        v11 = 0;
        v12 = v3 * v3;
        v13 = v12 * 0.185777706;
        v14 = v12;
        do
        {
          v13 = v12 * (v13 + *(double *)&qword_1DEE7CEC0[v11]);
          v14 = v12 * (v14 + *(double *)&qword_1DEE7CEE8[v11++]);
        }
        while (v11 != 3);
        v15 = v4 * (v13 + 3209.37759);
        v16 = v14 + 2844.23683;
      }
      v5 = v15 / v16;
      goto LABEL_20;
    }
    if (v4 <= 4.0)
    {
      v17 = 0;
      v18 = v4 * 0.0000000215311535;
      v19 = v4;
      do
      {
        v18 = v4 * (v18 + *(double *)&qword_1DEE7CF08[v17]);
        v19 = v4 * (v19 + *(double *)&qword_1DEE7CF50[v17++]);
      }
      while (v17 != 7);
      v10 = (v18 + 1230.33935) / (v19 + 1230.33935);
    }
    else
    {
      v5 = 1.0;
      if (v4 >= 27.2)
      {
LABEL_20:
        v24 = v5;
        v2 = v1 ^ LODWORD(v24);
        return *(float *)&v2;
      }
      v6 = 0;
      v7 = 1.0 / (v3 * v3);
      v8 = v7 * 0.0163153871;
      v9 = v7;
      do
      {
        v8 = v7 * (v8 + *(double *)&qword_1DEE7CF90[v6]);
        v9 = v7 * (v9 + *(double *)&qword_1DEE7CFC0[v6++]);
      }
      while (v6 != 4);
      v10 = (0.564189584 - v7 * (v8 + 0.000658749162) / (v9 + 0.00233520498)) / v4;
    }
    v20 = trunc(v4 * 16.0) * 0.0625;
    v21 = v4 - v20;
    v22 = v4 + v20;
    v23 = expl(-(v20 * v20));
    v5 = 0.5 - v23 * expl(-(v21 * v22)) * v10 + 0.5;
    goto LABEL_20;
  }
  if (result == 0.0)
    return result;
  v2 = v1 | 0x3F800000;
  return *(float *)&v2;
}

long double expl(long double __x)
{
  uint64_t v1;
  long double v2;
  long double v3;
  double *v4;
  double v5;
  double v6;
  uint64_t v7;
  long double result;
  double v9;

  if (*(_QWORD *)&__x < 0x40862E42FEFA39F0uLL || *(uint64_t *)&__x < (uint64_t)0xC0874A0000000000)
  {
    v1 = vcvtmd_s64_f64(__x * 184.664965);
    v2 = __x * 184.664965 - (double)v1;
    v3 = -(__x * 184.664965 - __x * 184.664965 - __x * 2.60547504e-15);
    v4 = (double *)&qword_1DEE49280[2 * (v1 & 0x7F)];
    v5 = *v4;
    v6 = (v2 + v4[1] + v3)
       * 3.88934341e-14
       * ((v2 + v4[1] + v3) * (v2 + 990.168112) + 344055.622)
       * ((v2 + v4[1] + v3) * (v2 + -68.926592) + 404678.883);
    v7 = v1 >> 7;
    if (v7 + 1022 < 0)
      return (COERCE_DOUBLE(*(_QWORD *)&v5 + ((v7 + 1022) << 52))
            + 1.0
            + COERCE_DOUBLE(*(_QWORD *)&v5 + ((v7 + 1022) << 52))
            - (COERCE_DOUBLE(*(_QWORD *)&v5 + ((v7 + 1022) << 52))
             + 1.0
             - 1.0)
            + COERCE_DOUBLE(*(_QWORD *)&v5 + ((v7 + 1022) << 52)) * v6
            - 1.0)
           * 2.22507386e-308;
    else
      *(_QWORD *)&result = COERCE__INT64(v5 + v6 * v5) + (v7 << 52);
  }
  else if (__x >= 0.0)
  {
    return __x * 1.79769313e308;
  }
  else
  {
    v9 = 2.22507386e-308;
    if (*(_QWORD *)&__x >= 0xFFF0000000000000)
      v9 = 0.0;
    return v9 * v9;
  }
  return result;
}

float hypotf(float a1, float a2)
{
  if ((LODWORD(a1) & 0x7FFFFFFFu) < 0x7F800000)
    return sqrt(a1 * a1 + a2 * a2);
  if ((LODWORD(a1) & 0x7FFFFFFF) == 0x7F800000 || (LODWORD(a2) & 0x7FFFFFFF) == 0x7F800000)
    a1 = INFINITY;
  return a1 * 1.0;
}

int fegetround(void)
{
  return _ReadStatusReg(ARM64_SYSREG(3, 3, 4, 4, 0)) & 0xC00000;
}

long double coshl(long double __x)
{
  double v1;
  int64_t v2;
  double v3;
  double v4;
  double *v5;
  uint64_t v6;
  double v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  int64_t v13;
  double v14;
  double *v15;
  double v16;
  double v17;
  double v18;

  v1 = fabs(__x);
  if (v1 >= 21.0)
  {
    if (v1 >= 710.47586)
    {
      return v1 * 1.79769313e308;
    }
    else
    {
      v13 = vcvtd_n_s64_f64(v1 * 1.44269504, 7uLL);
      v14 = v1 * 1.44269504 - vcvtd_n_f64_s64(v13, 7uLL);
      v15 = (double *)((char *)&unk_1DEE75A30 + 16 * (v13 & 0x7F));
      v16 = v14 + 7.73568837;
      v17 = v14 + -0.538489;
      v18 = v14 + v15[1] - (v1 * 1.44269504 - v1 * 1.44269504 - v1 * 2.03552737e-17);
      return (*v15 + v18 * 0.00133636822 * (v18 * v16 + 20.9994886) * (v18 * v17 + 24.6996388) * *v15)
           * COERCE_DOUBLE((v13 >> 7 << 52) + 0x3FE0000000000000);
    }
  }
  else if (v1 < 0.346573353)
  {
    if (v1 < 9.31322575e-10)
      return (v1 * v1 + 2.0) * 0.5;
    else
      return v1
           * (v1 * 0.5
            + v1
            * (v1
             * v1
             * (v1
              * v1
              * (v1 * v1 * (v1 * v1 * (v1 * v1 * 0.00000000209181303 + 0.000000275572633) + 0.0000248015873)
               + 0.00138888889)
              + 0.0416666667)))
           + 1.0;
  }
  else
  {
    v2 = vcvtd_n_s64_f64(v1 * 1.44269504, 7uLL);
    v3 = v1 * 1.44269504 - vcvtd_n_f64_s64(v2, 7uLL);
    v4 = -(v1 * 1.44269504 - v1 * 1.44269504 - v1 * 2.03552737e-17);
    v5 = (double *)((char *)&unk_1DEE75A30 + 16 * (v2 & 0x7F));
    v6 = *(_QWORD *)v5;
    v7 = v5[1];
    v8 = (double *)((char *)&unk_1DEE75A30 - 16 * (v2 & 0x7F) + 2032);
    v9 = 0.0078125 - v3;
    v2 >>= 7;
    *(_QWORD *)&v10 = v6 + ((v2 - 1) << 52);
    *(_QWORD *)&v11 = *(_QWORD *)v8 - ((v2 + 2) << 52);
    return v10
         + v11
         + v10
         * ((v3 + v7 + v4)
          * 0.00133636822
          * ((v3 + v7 + v4) * (v3 + 7.73568837) + 20.9994886)
          * ((v3 + v7 + v4) * (v3 + -0.538489) + 24.6996388))
         - (v10
          + v11
          - v10
          - v11
          - v11
          * ((v9 + v8[1] - v4)
           * 0.00133636822
           * ((v9 + v8[1] - v4) * (0.0078125 - v3 + 7.73568837) + 20.9994886)
           * ((v9 + v8[1] - v4) * (0.0078125 - v3 + -0.538489) + 24.6996388)));
  }
}

long double sinhl(long double __x)
{
  double v1;
  int64x2_t v2;
  int64_t v3;
  double v4;
  double v5;
  double *v6;
  uint64_t v7;
  double v8;
  double *v9;
  double v10;
  double v11;
  double v12;
  int64x2_t v13;
  long double result;
  int64x2_t v15;
  int64_t v16;
  double v17;
  double *v18;
  double v19;
  double v20;
  double v21;
  int64x2_t v22;

  v1 = fabs(__x);
  if (v1 >= 21.0)
  {
    if (v1 >= 710.47586)
    {
      return __x * 1.79769313e308;
    }
    else
    {
      v15 = (int64x2_t)vshrq_n_u64(*(uint64x2_t *)&__x, 0x3FuLL);
      v16 = vcvtd_n_s64_f64(v1 * 1.44269504, 7uLL);
      v17 = v1 * 1.44269504 - vcvtd_n_f64_s64(v16, 7uLL);
      v18 = (double *)((char *)&unk_1DEE75A30 + 16 * (v16 & 0x7F));
      v19 = v17 + 7.73568837;
      v20 = v17 + -0.538489;
      v21 = v17 + v18[1] - (v1 * 1.44269504 - v1 * 1.44269504 - v1 * 2.03552737e-17);
      *(double *)v22.i64 = (*v18 + v21 * 0.00133636822 * (v21 * v19 + 20.9994886) * (v21 * v20 + 24.6996388) * *v18)
                         * COERCE_DOUBLE((v16 >> 7 << 52) + 0x3FE0000000000000);
      *(_QWORD *)&result = vsliq_n_s64(v22, v15, 0x3FuLL).u64[0];
    }
  }
  else if (v1 < 0.346573353)
  {
    if (v1 < 0.0000000074505806)
      return (__x + __x * 3.6028797e16) * 2.77555756e-17;
    else
      return __x
           + __x
           * (__x
            * __x)
           * (__x
            * __x
            * (__x
             * __x
             * (__x * __x * (__x * __x * (__x * __x * 1.60866229e-10 + 0.0000000250520711) + 0.00000275573192)
              + 0.000198412698)
             + 0.00833333333)
            + 0.166666667);
  }
  else
  {
    v2 = (int64x2_t)vshrq_n_u64(*(uint64x2_t *)&__x, 0x3FuLL);
    v3 = vcvtd_n_s64_f64(v1 * 1.44269504, 7uLL);
    v4 = v1 * 1.44269504 - vcvtd_n_f64_s64(v3, 7uLL);
    v5 = -(v1 * 1.44269504 - v1 * 1.44269504 - v1 * 2.03552737e-17);
    v6 = (double *)((char *)&unk_1DEE75A30 + 16 * (v3 & 0x7F));
    v7 = *(_QWORD *)v6;
    v8 = v6[1];
    v9 = (double *)((char *)&unk_1DEE75A30 - 16 * (v3 & 0x7F) + 2032);
    v10 = 0.0078125 - v4;
    v3 >>= 7;
    *(_QWORD *)&v11 = v7 + ((v3 - 1) << 52);
    *(_QWORD *)&v12 = *(_QWORD *)v9 - ((v3 + 2) << 52);
    *(double *)v13.i64 = v11
                       - v12
                       - (v11
                        - v12
                        - v11
                        + v12
                        + v12
                        * ((v10 + v9[1] - v5)
                         * 0.00133636822
                         * ((v10 + v9[1] - v5) * (0.0078125 - v4 + 7.73568837) + 20.9994886)
                         * ((v10 + v9[1] - v5) * (0.0078125 - v4 + -0.538489) + 24.6996388))
                        - v11
                        * ((v4 + v8 + v5)
                         * 0.00133636822
                         * ((v4 + v8 + v5) * (v4 + 7.73568837) + 20.9994886)
                         * ((v4 + v8 + v5) * (v4 + -0.538489) + 24.6996388)));
    *(_QWORD *)&result = vsliq_n_s64(v13, v2, 0x3FuLL).u64[0];
  }
  return result;
}

long double modfl(long double __x, long double *__y)
{
  int8x16_t v2;
  float64x2_t v3;
  double v4;
  float64x2_t v5;

  if ((*(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFuLL) - 0x7FF0000000000000 > 0x8010000000000000)
  {
    v4 = trunc(__x);
    *__y = v4;
    if (v4 == __x)
    {
      v2.i64[0] = 0;
      v5.f64[0] = NAN;
      v5.f64[1] = NAN;
      *(_QWORD *)&__x = vbslq_s8((int8x16_t)vnegq_f64(v5), v2, *(int8x16_t *)&__x).u64[0];
    }
    else
    {
      return __x - v4;
    }
  }
  else
  {
    *__y = __x;
    v2.i64[0] = 0;
    v3.f64[0] = NAN;
    v3.f64[1] = NAN;
    v2.i64[0] = vbslq_s8((int8x16_t)vnegq_f64(v3), v2, *(int8x16_t *)&__x).u64[0];
    if ((*(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000)
      return *(double *)v2.i64;
  }
  return __x;
}

long double powl(long double __x, long double __y)
{
  int64x2_t v2;
  int8x16_t v3;
  int8x16_t v4;
  int8x16_t v5;
  int8x16_t v6;
  unint64_t v7;
  long double v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int8x16_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int8x16_t v20;
  long double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double v25;
  double *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  int8x16_t v32;
  int8x16_t v33;
  int8x16_t v34;
  int8x16_t v35;
  int8x16_t v36;
  double v37;

  v7 = 0;
  v8 = __x;
  if ((unint64_t)(*(_QWORD *)&__x - 0x10000000000000) < 0x7FE0000000000000
    && (unint64_t)(*(_QWORD *)&__y - 0x3BE0000000000000) <= 0x810000000000000)
  {
    goto LABEL_3;
  }
  if (__x == 1.0 || __y == 1.0)
    return __x;
  v28 = *(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFLL;
  v29 = *(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFLL;
  *(_QWORD *)&v30 = *(_QWORD *)&__y & 0x7FFFFFFFFFFFFFFFLL;
  v31 = *(_QWORD *)&__y & 0x7FFFFFFFFFFFFFFFLL;
  if ((*(_QWORD *)&__y & 0x7FFFFFFFFFFFFFFFLL) == 0)
    goto LABEL_47;
  if (*(_QWORD *)&v30 >= 0x7FF0000000000000uLL)
  {
    if (*(_QWORD *)&v30 > 0x7FF0000000000000uLL)
      return __y + __y;
    if (!v28)
      goto LABEL_34;
    if (v28 <= 0x7FF0000000000000)
    {
      if (v28 != 0x3FF0000000000000)
      {
        *(_QWORD *)&__x = ~((uint64_t)((v28 - 0x3FF0000000000000) ^ *(_QWORD *)&__y) >> 63) & 0x7FF0000000000000;
        return __x;
      }
      goto LABEL_47;
    }
    return __x + __x;
  }
  if (!v28)
    goto LABEL_34;
  if (v28 >= 0x7FF0000000000000)
  {
    if (v28 <= 0x7FF0000000000000)
    {
LABEL_34:
      if (*(_QWORD *)&v30 < 0x3FF0000000000000uLL)
        goto LABEL_39;
      if (*(_QWORD *)&v30 > 0x4340000000000000uLL)
        v30 = 9.00719925e15;
      if (trunc(v30) != v30 || ((uint64_t)v30 & 1) == 0)
LABEL_39:
        *(_QWORD *)&__x &= ~0x8000000000000000;
      if ((*(_QWORD *)&__y & 0x8000000000000000) != 0)
        return 1.0 / __x;
      return __x;
    }
    return __x + __x;
  }
  if ((*(_QWORD *)&__x & 0x8000000000000000) != 0)
  {
    if (*(_QWORD *)&v30 < 0x3FF0000000000000uLL)
      return INFINITY - INFINITY;
    if (*(_QWORD *)&v30 > 0x4340000000000000uLL)
      v30 = 9.00719925e15;
    if (trunc(v30) != v30)
      return INFINITY - INFINITY;
    if (((uint64_t)v30 & 1) != 0)
      v7 = *(_QWORD *)&__x & 0x8000000000000000;
    *(_QWORD *)&v8 = *(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFLL;
    *(_QWORD *)&__x &= ~0x8000000000000000;
  }
  v2.i64[0] = 1.0;
  v6.i64[0] = 0x3BE0000000000000;
  if (*(double *)&v31 > 1.84467441e19)
  {
    if (__y < 0.0)
    {
      if (__x == 1.0)
        goto LABEL_47;
      if (__x > 1.0)
        goto LABEL_52;
    }
    else
    {
      if (*(double *)&v29 == 1.0)
        goto LABEL_47;
      if (*(double *)&v29 <= 1.0)
      {
LABEL_52:
        v32.i64[0] = 0x10000000000001;
        v33.i64[0] = v7;
        return 2.22507386e-308 * *(double *)vorrq_s8(v33, v32).i64;
      }
    }
LABEL_55:
    v34.i64[0] = 0x7FE0000000000001;
    v35.i64[0] = v7;
    return 8.98846567e307 * *(double *)vorrq_s8(v35, v34).i64;
  }
  if (*(double *)&v31 >= 2.71050543e-20)
  {
    if (*(_QWORD *)&v8 < 0x10000000000000uLL)
    {
      *(int8x16_t *)&__x = vorrq_s8(*(int8x16_t *)&__x, (int8x16_t)v2);
      *(_QWORD *)&v8 = COERCE__INT64(__x - 1.0) - 0x3FE0000000000000;
    }
LABEL_3:
    v9 = *(_QWORD *)&v8 & 0xFFFFFFFFFFFFFLL;
    if ((*(_QWORD *)&v8 & 0xFFFFFFFFFFFFFLL) != 0)
    {
      v10 = (*(_QWORD *)&v8 - 0x3FE7F00000000000) >> 52;
      v11 = (char *)&unk_1DEE77F30 + (((v9 + 0x100000000000) & 0x1FE00000000000uLL) >> 41);
      v2.i32[0] = *(_DWORD *)v11;
      v12 = (int8x16_t)vshlq_n_s64(v2, 0x20uLL);
      v13 = *(double *)v12.i64 * COERCE_DOUBLE(v9 | 0x3FF0000000000000);
      v4.i64[0] = v9 & 0xC00FFFFFFFE00000 | 0x3FF0000000000000;
      v14 = COERCE_DOUBLE(v9 | 0x3FF0000000000000) - *(double *)v4.i64;
      *(double *)v4.i64 = -(v13 - *(double *)v12.i64 * *(double *)v4.i64);
      v15 = v13 - 1.0;
      *(double *)v12.i64 = *(double *)v4.i64 + *(double *)v12.i64 * v14;
      v16 = v15
          * v15
          * (v15
           * v15)
          * (v15 * (v15 * (v15 * (v15 * -0.180319199 + 0.206104228) + -0.240449174) + 0.288539008) + -0.36067376);
      v17 = 0.480898347 * v15 + -0.72134752;
      *(double *)v4.i64 = v17 * v15 + 1.44269504;
      *(double *)v5.i64 = (5.04742642e-18 * v15
                         + -1.01824332e-17
                         + 0.480898347 * *(double *)v12.i64
                         - (v17
                          - -0.72134752
                          - 0.480898347 * v15))
                        * v15
                        + 2.03552033e-17
                        + v17 * *(double *)v12.i64
                        - (*(double *)v4.i64
                         - 1.44269504
                         - v17 * v15);
      v18 = *(double *)v4.i64 * v15;
      v19 = *(double *)v5.i64 * v15
          + *(double *)v4.i64 * *(double *)v12.i64
          - (*(double *)v4.i64 * v15
           - *(double *)v4.i64 * v15);
      v4.i64[0] = *((_QWORD *)v11 + 1);
      *(double *)v20.i64 = (double)v10 + *(double *)v4.i64 + v18 + v16;
      v5.i64[0] = -2;
      *(int8x16_t *)&__x = vandq_s8(v20, v5);
      v21 = (double)v10 - __x + *(double *)v4.i64 + v18 + v16;
      v4.i64[0] = *(_QWORD *)v11;
      v12.i64[0] = 0xFFFFFFFF00000000;
      v22 = __y * 128.0;
      v23 = v22 * __x;
      *(double *)v4.i64 = v22 * (*(double *)vandq_s8(v4, v12).i64 + v21 + v19) - (v22 * __x - v22 * __x);
      goto LABEL_5;
    }
    v27 = *(_QWORD *)&v8 - 0x3FF0000000000000;
    if (v27)
    {
      v23 = vcvtd_n_f64_s64(v27, 0x2DuLL) * __y;
      *(double *)v4.i64 = -(v23 - v23);
LABEL_5:
      if (v23 <= 131200.0)
      {
        if (v23 >= -137600.0)
        {
          v24 = vcvtmd_s64_f64(v23);
          v25 = v23 - floor(v23);
          v26 = (double *)((char *)&unk_1DEE78770 + 16 * (v24 & 0x7F));
          return (COERCE_DOUBLE(((v24 << 44) & 0xFFF0000000000000 ^ v7) + *(_QWORD *)v26)
                + COERCE_DOUBLE(((v24 << 44) & 0xFFF0000000000000 ^ v7) + *(_QWORD *)v26)
                * ((*(double *)v4.i64 - v26[1] + v25)
                 * ((*(double *)v4.i64 - v26[1] + v25)
                  * ((*(double *)v4.i64 - v26[1] + v25)
                   * (v25 * (v25 * 3.8893434e-14 + 3.58302463e-11) + 0.0000000264664215)
                   + 0.0000146622624)
                  + 0.00541521235)))
               * COERCE_DOUBLE(((v24 << 45) & 0xFFF0000000000000) - ((v24 << 44) & 0xFFF0000000000000) + 0x3FF0000000000000);
        }
        goto LABEL_52;
      }
      goto LABEL_55;
    }
LABEL_47:
    *(_QWORD *)&__x = v7 | 0x3FF0000000000000;
    return __x;
  }
  v3.i64[0] = v7;
  v36.i64[0] = 1.0;
  *(_QWORD *)&v37 = vorrq_s8(v3, v36).u64[0];
  v3.i64[0] = vorrq_s8(v3, v6).u64[0];
  if (__y < 0.0)
  {
    if (*(double *)&v29 == 1.0)
      goto LABEL_47;
    if (*(double *)&v29 > 1.0)
      return v37 - *(double *)v3.i64;
  }
  else
  {
    if (*(double *)&v29 == 1.0)
      goto LABEL_47;
    if (*(double *)&v29 <= 1.0)
      return v37 - *(double *)v3.i64;
  }
  return v37 + *(double *)v3.i64;
}

float cosf(float a1)
{
  float v1;

  v1 = fabsf(a1);
  if (LODWORD(v1) >= 0x42F00000)
  {
    if (LODWORD(v1) < 0x7F800000)
      JUMPOUT(0x1DEE4A6D4);
    JUMPOUT(0x1DEE4A780);
  }
  if (LODWORD(v1) >= 0x3F490FDB)
    JUMPOUT(0x1DEE4A620);
  if (LODWORD(v1) < 0x39800000)
    return (float)(67109000.0 - v1) * 0.000000014901;
  else
    return v1
         * v1
         * (v1 * v1 * 0.0416666204 + -0.499999997 + v1 * v1 * (v1 * v1) * (v1 * v1 * 0.0000243835673 + -0.00138866816))
         + 1.0;
}

float sinf(float a1)
{
  float64x2_t v1;
  unsigned int v2;
  double v3;
  unint64_t v4;
  double v5;
  BOOL v6;
  int8x8_t v7;
  double v9;
  double *v10;
  int8x8_t v11;

  v2 = LODWORD(a1) & 0x7FFFFFFF;
  if ((LODWORD(a1) & 0x7FFFFFFFu) >= 0x42F00000)
  {
    if (v2 >= 0x7F800000)
    {
      return a1 - a1;
    }
    else
    {
      v9 = a1;
      v10 = (double *)((char *)&loc_1DEE4A934 + 16 * HIBYTE(v2) - 1024);
      v1.f64[0] = v9 * *v10;
      *(double *)&v11 = v1.f64[0] - vrndnd_f64(v1.f64[0]) + v9 * v10[1];
      return COERCE_DOUBLE(veor_s8(v11, (int8x8_t)*(_OWORD *)&vshlq_n_s64(vcvtnq_s64_f64(v1), 0x3FuLL)))
           * (*(double *)&v11 * *(double *)&v11 * (*(double *)&v11 * *(double *)&v11 + -4.16477198) + 15.4854663)
           * (0.0764924806
            * (*(double *)&v11 * *(double *)&v11 * (*(double *)&v11 * *(double *)&v11 + -3.64939237) + 2.65220347));
    }
  }
  else if (v2 < 0x3F490FDB)
  {
    if (v2 < 0x39800000)
      return (float)(a1 + (float)(a1 * 67109000.0)) * 0.000000014901;
    else
      return a1
           + a1 * (a1 * a1) * -0.166666546
           + a1 * a1 * (a1 * (a1 * a1)) * (a1 * a1 * -0.000195152832 + 0.00833216076);
  }
  else
  {
    v3 = a1;
    v4 = vcvtnd_s64_f64(v3 * 0.636619772);
    v5 = v3 - vrndnd_f64(v3 * 0.636619772) * 1.57079633;
    v6 = (v4 & 1) == 0;
    v7 = (int8x8_t)(v4 >> 1 << 63);
    if (v6)
      return *(double *)veor_s8(COERCE_INT8X8_T(v5+ v5 * (v5 * v5) * -0.166666546+ v5 * v5 * (v5 * (v5 * v5)) * (v5 * v5 * -0.000195152832 + 0.00833216076)), v7).i32;
    else
      return *(double *)veor_s8(COERCE_INT8X8_T(v5* v5* (v5 * v5 * 0.0416666204+ -0.499999997+ v5 * v5 * (v5 * v5) * (v5 * v5 * 0.0000243835673 + -0.00138866816))+ 1.0), v7).i32;
  }
}

__float2 __sincosf_stret(float a1)
{
  unsigned int v1;
  double v2;
  char v3;
  double v4;
  float64x2_t v5;
  float64x2_t v6;
  float32x2_t v7;
  float v8;
  double v9;
  double *v10;
  double v11;
  double v12;
  __float2 result;

  v1 = LODWORD(a1) & 0x7FFFFFFF;
  if ((LODWORD(a1) & 0x7FFFFFFFu) >= 0x42F00000)
  {
    if (v1 >= 0x7F800000)
    {
      v7.f32[0] = a1 - a1;
      v8 = v7.f32[0];
      goto LABEL_13;
    }
    v9 = a1 + a1;
    v10 = (double *)((char *)&loc_1DEE4A934 + 16 * HIBYTE(v1) - 1024);
    v11 = v9 * *v10;
    v12 = v9 * v10[1];
    v3 = vcvtnd_s64_f64(v11);
    v4 = v11 - vrndnd_f64(v11) + v12;
  }
  else
  {
    if (v1 < 0x39800000)
    {
      v8 = (float)(67109000.0 - fabsf(a1)) * 0.000000014901;
      v7.f32[0] = (float)(a1 + (float)(a1 * 67109000.0)) * 0.000000014901;
      goto LABEL_13;
    }
    v2 = a1 * 0.636619772;
    v3 = vcvtnd_s64_f64(v2);
    v4 = v2 - vrndnd_f64(v2);
  }
  v5 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v4 * v4), 0);
  v6.f64[0] = v4 * 0.000158206744;
  v6.f64[1] = 0.000903631703;
  v7 = vcvt_f32_f64(vmulq_f64(vmulq_f64(v6, vmlaq_f64(*(float64x2_t *)((char *)&qword_1DEE4AD40[5] + 4), v5, vaddq_f64(v5, *(float64x2_t *)&dword_1DEE4AD3C))), vmlaq_f64(*(float64x2_t *)((char *)&qword_1DEE4AD40[7] + 4), v5, vaddq_f64(v5, *(float64x2_t *)((char *)&qword_1DEE4AD40[1] + 4)))));
  if ((v3 & 2) != 0)
    v7 = vneg_f32(v7);
  if ((v3 & 1) != 0)
  {
    v8 = -v7.f32[0];
    v7.i32[0] = v7.i32[1];
  }
  else
  {
    v8 = v7.f32[1];
  }
LABEL_13:
  result.__sinval = v7.f32[0];
  result.__cosval = v8;
  return result;
}

long double scalbnl(long double __x, int __e)
{
  unsigned int v2;
  BOOL v3;
  int v4;
  BOOL v5;

  if (__e < 1024)
  {
    if (__e <= -1023)
    {
      if (__e <= -2100)
        v4 = -2100;
      else
        v4 = __e;
      do
      {
        __x = __x * 2.22507386e-308;
        *(_QWORD *)&__e = (v4 + 1022);
        v5 = __CFADD__(v4, 2044);
        v4 += 1022;
      }
      while (!v5);
    }
  }
  else
  {
    if (__e >= 2100)
      v2 = 2100;
    else
      v2 = __e;
    do
    {
      __x = __x * 8.98846567e307;
      *(_QWORD *)&__e = v2 - 1023;
      v3 = v2 > 0x7FE;
      v2 -= 1023;
    }
    while (v3);
  }
  return __x * COERCE_DOUBLE((*(_QWORD *)&__e << 52) + 0x3FF0000000000000);
}

long double atan2l(long double __y, long double __x)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  long double v12;
  long double v13;
  long double v14;
  long double v15;
  long double v16;
  long double v17;
  unsigned int v18;
  long double v19;
  long double v20;
  long double v21;
  long double v22;
  long double v23;
  double v24;

  v2 = fabs(__y);
  v3 = 1.0;
  if (__y < 0.0)
    v3 = -1.0;
  v4 = -0.0;
  if (__y < 0.0)
  {
    v5 = v2;
  }
  else
  {
    v4 = 0.0;
    v5 = __y;
  }
  if ((*(_QWORD *)&__x & 0x8000000000000000) != 0)
  {
    v6 = v4 + v3 * 3.14159265;
    v4 = v4 + v3 * 5.1266883e-12;
    v3 = -v3;
    __x = fabs(__x);
  }
  else
  {
    v6 = v4;
  }
  if (__x == v5)
  {
    if (v5 != 0.0)
    {
      v6 = v6 + v3 * 0.785398163;
      v4 = v4 + v3 * 1.28167208e-12;
    }
    return v4 + v6;
  }
  if (__x < v5)
  {
    v6 = v6 + v3 * 1.57079633;
    v4 = v4 + v3 * 2.56334415e-12;
    v3 = -v3;
    v8 = v5;
  }
  else
  {
    v8 = __x;
    __x = v5;
  }
  v9 = (*(_QWORD *)&v8 >> 52) & 0x7FFLL;
  if ((v9 - 1535) <= 0xFFFFFC00)
  {
    if (v9 > 0x1FF)
    {
      v11 = 0.0;
      if (((*(_QWORD *)&__x >> 52) & 0x7FFuLL) < 0x5FB)
        goto LABEL_28;
      v10 = 8.63616856e-78;
    }
    else
    {
      v10 = 1.15792089e77;
    }
    v8 = v8 * v10;
    __x = __x * v10;
  }
  v11 = 0.0;
  if (__x >= v8 * 0.5)
  {
    v12 = v8 + __x * 0.5;
    v13 = v8 - v12 + __x * 0.5;
    __x = __x + v8 * -0.5;
    v11 = v13 + 0.0;
    v6 = v6 + v3 * 0.463647609;
    v4 = v4 + v3 * 6.29981672e-12;
    v8 = v12;
  }
  if (__x >= v8 * 0.25)
  {
    v14 = v8 + __x * 0.25;
    v15 = v8 - v14 + __x * 0.25;
    __x = __x + v8 * -0.25;
    v11 = v11 + v15;
    v6 = v6 + v3 * 0.244978663;
    v4 = v4 + v3 * 9.15639383e-13;
    v8 = v14;
  }
  if (__x >= v8 * 0.125)
  {
    v16 = v8 + __x * 0.125;
    v17 = v8 - v16 + __x * 0.125;
    __x = __x + v8 * -0.125;
    v11 = v11 + v17;
    v6 = v6 + v3 * 0.124354995;
    v4 = v4 + v3 * 1.68500974e-13;
    v8 = v16;
  }
LABEL_28:
  v18 = ((*(_QWORD *)&v8 >> 52) & 0x7FF) - ((*(_QWORD *)&__x >> 52) & 0x7FF);
  if (v18 > 0x1E)
  {
    if (v18 < 0x3D || v6 == 0.0)
    {
      v24 = v3 * __x / v8 * 3.40282367e38;
      if (v24 != 0.0)
        v4 = v4 + (v24 + v24 * -5.42101086e-20) * 2.93873588e-39;
    }
    return v4 + v6;
  }
  v19 = v3 * __x;
  v20 = v19 / v8;
  v21 = (v19 - v19 / v8 * v8 - v11 * (v19 / v8)) / v8;
  v22 = v20 * v20 * -0.333333333;
  v23 = v20 * (v22 + 1.0);
  return v6
       + v23
       + v23
       + v6
       - (v6
        + v23)
       + v4
       + v20
       * v20
       * (v20 * v20 * (v20 * v20 + -2.09245088) + 1.68417519)
       * (v20
        * 0.0733832886
        * (v20
         * v20
         * (v20 * v20 * (v20 * v20 + 0.854651256) + 1.6182498)))
       + v20 * (v22 + 1.0 - (v22 + 1.0) + -1.75165416e-18)
       - (v23
        - v23)
       + v21 * (v22 + 1.0);
}

simd_float4 _simd_pow_f4(simd_float4 x, simd_float4 y)
{
  float32x4_t v4;
  int8x16_t v5;
  int32x4_t v6;
  int8x16_t v7;
  float32x4_t v13;
  float32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int8x16_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  uint32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  int8x16_t v31;
  float32x4_t v32;
  simd_float4 v33;
  int v34;
  float v35;
  float v36;
  uint32x4_t v38;
  simd_float4 v39;
  simd_float4 v40;
  simd_float4 v41;
  simd_float4 v42;
  simd_float4 v43;
  simd_float4 v44;
  uint32x4_t v45;
  int8x16x2_t v46;
  int8x16x2_t v47;

  v4.i64[0] = 0x80000000800000;
  v4.i64[1] = 0x80000000800000;
  v5 = vornq_s8((int8x16_t)vcgtq_f32(v4, (float32x4_t)x), (int8x16_t)vcgeq_f32((float32x4_t)vdupq_n_s32(0x7E400000u), (float32x4_t)x));
  v6.i64[0] = 0x8000000080000;
  v6.i64[1] = 0x8000000080000;
  v7 = (int8x16_t)vaddq_s32((int32x4_t)vrecpeq_f32((float32x4_t)x), v6);
  v6.i64[0] = 0xF0000000FLL;
  v6.i64[1] = 0xF0000000FLL;
  __asm { FMOV            V4.4S, #-1.0 }
  v13 = vmlaq_f32(_Q4, (float32x4_t)vandq_s8(v7, (int8x16_t)v6), (float32x4_t)x);
  v14 = vcvtq_f32_u32(vshrq_n_u32((uint32x4_t)v7, 0x17uLL));
  v6.i64[0] = 0x700000007;
  v6.i64[1] = 0x700000007;
  v15 = (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v7, 0x14uLL), (int8x16_t)v6);
  v16 = vdupq_n_s32(0x3020100u);
  v17.i64[0] = 0x404040404040404;
  v17.i64[1] = 0x404040404040404;
  v18 = (int8x16_t)vmlaq_s32(v16, v15, v17);
  v47.val[1] = (int8x16_t)xmmword_1DEE7D000;
  v47.val[0] = (int8x16_t)xmmword_1DEE7D010;
  v19 = (float32x4_t)vqtbl2q_s8(v47, v18);
  v47.val[1] = (int8x16_t)xmmword_1DEE7D020;
  v47.val[0] = (int8x16_t)xmmword_1DEE7D030;
  v20 = (float32x4_t)vqtbl2q_s8(v47, v18);
  v47.val[0] = (int8x16_t)vmulq_f32(v13, v13);
  v21 = vsubq_f32(v19, v14);
  v22 = (float32x4_t)vdupq_n_s32(0x3FB8AA3Bu);
  v47.val[1] = (int8x16_t)vmlaq_f32(v21, v22, v13);
  v23 = (float32x4_t)vdupq_n_s32(0xBF38AA3B);
  v24 = vmlaq_f32((float32x4_t)v47.val[1], v23, (float32x4_t)v47.val[0]);
  v25 = vmlaq_f32(vaddq_f32(vaddq_f32(vmlaq_f32(vnegq_f32(vsubq_f32((float32x4_t)v47.val[1], v21)), v22, v13), v20), vmlaq_f32(vnegq_f32(vsubq_f32(v24, (float32x4_t)v47.val[1])), v23, (float32x4_t)v47.val[0])), v13, vmlaq_f32(vmlaq_f32((float32x4_t)vdupq_n_s32(0x32A56F15u), (float32x4_t)vdupq_n_s32(0xB239C255), v13), (float32x4_t)v47.val[0], vmlaq_f32((float32x4_t)vdupq_n_s32(0x3EF6384Fu), v13, vmlaq_f32(vmlaq_f32((float32x4_t)vdupq_n_s32(0xBEB8A9EA), (float32x4_t)vdupq_n_s32(0x3E93BADCu), v13), (float32x4_t)v47.val[0], vmlaq_f32((float32x4_t)vdupq_n_s32(0xBE777CC7), (float32x4_t)vdupq_n_s32(0x3E547EDEu), v13)))));
  v26 = vmulq_f32(v24, (float32x4_t)y);
  v27 = vmlaq_f32(v26, (float32x4_t)y, v25);
  v28 = (uint32x4_t)vornq_s8(v5, (int8x16_t)vcgeq_f32((float32x4_t)vdupq_n_s32(0x42FB0000u), vabsq_f32(v27)));
  v29 = vaddq_f32(vmlaq_f32(vnegq_f32(v26), (float32x4_t)y, v24), vmlaq_f32(vnegq_f32(vsubq_f32(v27, v26)), (float32x4_t)y, v25));
  v30 = vaddq_f32(v27, (float32x4_t)vdupq_n_s32(0x49C003F8u));
  v31 = (int8x16_t)vmlaq_s32(v16, (int32x4_t)vandq_s8((int8x16_t)v30, (int8x16_t)v6), v17);
  v46.val[1] = (int8x16_t)xmmword_1DEE7D040;
  v46.val[0] = (int8x16_t)xmmword_1DEE7D050;
  v32 = (float32x4_t)vqtbl2q_s8(v46, v31);
  v46.val[1] = (int8x16_t)vaddq_f32(vsubq_f32(v27, vaddq_f32(v30, (float32x4_t)vdupq_n_s32(0xC9C003F8))), v29);
  v33 = (simd_float4)vmulq_f32(vmlaq_f32(v32, vmlaq_f32((float32x4_t)vdupq_n_s32(0x3F317218u), (float32x4_t)v46.val[1], vmlaq_f32((float32x4_t)vdupq_n_s32(0x3E7607C9u), (float32x4_t)vdupq_n_s32(0x3D636078u), (float32x4_t)v46.val[1])), vmulq_f32((float32x4_t)v46.val[1], v32)), (float32x4_t)vandq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v30, 0x14uLL), (int8x16_t)vdupq_n_s32(0x7F800000u)));
  if ((vmaxvq_u32(v28) & 0x80000000) != 0)
  {
    v34 = 0;
    v39 = x;
    v40 = y;
    v38 = v28;
    do
    {
      v45 = v28;
      if (*(_DWORD *)((unint64_t)&v45 & 0xFFFFFFFFFFFFFFF3 | (4 * (v34 & 3))))
      {
        v43 = x;
        v35 = *(float *)((unint64_t)&v43 & 0xFFFFFFFFFFFFFFF3 | (4 * (v34 & 3)));
        v41 = v33;
        v42 = y;
        v36 = powf(v35, *(float *)((unint64_t)&v42 & 0xFFFFFFFFFFFFFFF3 | (4 * (v34 & 3))));
        v28 = v38;
        x = v39;
        y = v40;
        v44 = v41;
        *(float *)((unint64_t)&v44 & 0xFFFFFFFFFFFFFFF3 | (4 * (v34 & 3))) = v36;
        v33 = v44;
      }
      ++v34;
    }
    while (v34 != 4);
  }
  return v33;
}

float powf(float result, float a2)
{
  int8x8_t v2;
  unsigned int v3;
  float v4;
  int v5;
  signed int v6;
  double *v7;
  double v8;
  double v9;
  unint64_t v10;
  double v11;
  int8x8_t v12;
  double v13;
  double v14;
  BOOL v15;
  unsigned int v16;
  unsigned int v17;
  int8x8_t v18;
  int8x8_t v19;
  unsigned int v20;
  int v21;
  float v22;
  float v23;

  if (result == 1.0)
    return result;
  if (a2 == 1.0)
    return result * 1.0;
  v3 = 0;
  v4 = result;
  v5 = (LODWORD(a2) & 0x7FFFFFFF) - 1;
  if (v5 >= 0x7F7FFFFF)
  {
    if (v5 > 2139095039)
    {
      result = a2;
      return result * 1.0;
    }
    if (v5 <= 0x7F7FFFFF)
    {
      v16 = LODWORD(result) & 0x7FFFFFFF;
      v15 = __OFSUB__(v5, 2139095039) || (LODWORD(result) & 0x7FFFFFFF) == 0;
      if ((LODWORD(result) & 0x7FFFFFFF) == 0)
        goto LABEL_23;
      if (v16 > 0x7F800000)
        return result * 1.0;
      v17 = v16 - 1065353216;
      if (v17)
      {
        v18.i32[0] = (int)(v17 ^ LODWORD(a2)) >> 31;
        *(float *)v19.i32 = fabsf(a2);
        LODWORD(result) = vbic_s8(v19, v18).u32[0];
        return result;
      }
    }
    return 1.0;
  }
  if ((LODWORD(result) - 0x800000) < 0x7F000000)
  {
LABEL_5:
    v6 = (LODWORD(v4) - 1060339712) & 0xFF800000;
    v7 = (double *)((char *)&unk_1DEE76250 + 16 * (((LODWORD(v4) - 1060339712) >> 16) & 0x7F));
    v8 = -(1.0 - COERCE_FLOAT(LODWORD(v4) - v6) * *v7);
    v9 = fmax(fmin(a2* (v7[1]+ (double)(v6 >> 16)+ (v8 * -92.3324826 + 184.664965 + (v8 * -46.1668049 + 61.555552) * (v8 * v8)) * v8), 32768.0), -32768.0);
    v10 = llround(v9);
    v11 = v9 - round(v9);
    *(double *)&v12 = 0.0000146622624 * v11 + 0.00541521731;
    *(_QWORD *)&v13 = qword_1DEE755F0[v10 & 0x7F] + (v10 << 45);
    v14 = v13 + *(double *)&v12 * v11 * v13;
    *(float *)&v14 = v14;
    v12.i32[0] = v3;
    LODWORD(result) = veor_s8(*(int8x8_t *)&v14, v12).u32[0];
    return result;
  }
  v20 = LODWORD(result) & 0x7FFFFFFF;
  v21 = (LODWORD(result) & 0x7FFFFFFF) - 1;
  v15 = v21 <= 2139095039;
  if (v21 >= 0x7F7FFFFF)
  {
LABEL_23:
    if (v15)
    {
      LODWORD(v23) = LODWORD(a2) & 0x7FFFFFFF;
      if ((LODWORD(a2) & 0x7FFFFFFFu) < 0x3F800000)
        goto LABEL_30;
      if (LODWORD(v23) > 0x4B800000)
        v23 = 16777000.0;
      if (truncf(v23) != v23 || ((int)v23 & 1) == 0)
LABEL_30:
        result = fabsf(result);
      if ((LODWORD(a2) & 0x80000000) != 0)
        return 1.0 / result;
      return result;
    }
    return result * 1.0;
  }
  if ((LODWORD(result) & 0x80000000) == 0)
  {
LABEL_22:
    v2.i32[0] = 1.0;
    LODWORD(v4) = COERCE_INT(*(float *)vorr_s8(*(int8x8_t *)&result, v2).i32 - 1.0) - 1056964608;
    goto LABEL_5;
  }
  LODWORD(v22) = LODWORD(a2) & 0x7FFFFFFF;
  if ((LODWORD(a2) & 0x7FFFFFFFu) >= 0x3F800000)
  {
    if (LODWORD(v22) > 0x4B800000)
      v22 = 16777000.0;
    if (truncf(v22) == v22)
    {
      if (((int)v22 & 1) != 0)
        v3 = 0x80000000;
      LODWORD(v4) = LODWORD(result) & 0x7FFFFFFF;
      LODWORD(result) &= ~0x80000000;
      if (v20 >= 0x800000)
        goto LABEL_5;
      goto LABEL_22;
    }
  }
  return INFINITY - INFINITY;
}

float scalbnf(float a1, int a2)
{
  uint64_t v2;

  if (a2 >= 1023)
    LODWORD(v2) = 1023;
  else
    LODWORD(v2) = a2;
  if ((int)v2 <= -1022)
    v2 = 4294966274;
  else
    v2 = v2;
  return a1 * COERCE_DOUBLE((v2 << 52) + 0x3FF0000000000000);
}

float expf(float a1)
{
  double v1;
  double v2;
  double v3;
  float v5;

  if ((LODWORD(a1) >> 23) >= 0x86u)
  {
    if (a1 >= 0.0)
    {
      return a1 * 3.4028e38;
    }
    else
    {
      if (LODWORD(a1) < 0xFF800000)
        v5 = 1.1755e-38;
      else
        v5 = 0.0;
      return v5 * v5;
    }
  }
  else
  {
    v1 = 184.664965 * a1;
    v2 = round(v1);
    *(_QWORD *)&v3 = qword_1DEE755F0[(uint64_t)v2 & 0x7F] + ((uint64_t)v2 << 45);
    return v3 + (0.0000146622624 * (v1 - v2) + 0.00541521731) * (v1 - v2) * v3;
  }
}

float logf(float result)
{
  int8x8_t v1;
  float v2;
  int v3;
  int v4;
  double *v5;
  double v6;

  v2 = result;
  if ((LODWORD(result) - 0x800000) < 0x7F000000)
    goto LABEL_2;
  if (result == 0.0)
    return -1.0 / 0.0;
  if (result < 0.0)
    return INFINITY - INFINITY;
  if (LODWORD(result) - 0x800000 < 0)
  {
    v1.i32[0] = 1.0;
    LODWORD(v2) = COERCE_INT(*(float *)vorr_s8(*(int8x8_t *)&result, v1).i32 - 1.0) - 1056964608;
LABEL_2:
    v3 = (LODWORD(v2) - 1061093376) >> 23;
    v4 = LODWORD(v2) & 0x7FFFFF;
    v5 = (double *)((char *)&unk_1DEE77AC0 + 16 * ((v4 + 0x10000) >> 17));
    v6 = -(1.0 - COERCE_FLOAT(v4 | 0x3F800000) * *v5);
    return v5[1] + (double)v3 * 0.693147181 + v6 + v6 * (v6 * (v6 * (v6 * -0.25 + 0.333333333) + -0.5));
  }
  return result;
}

int fesetenv(const fenv_t *a1)
{
  _WriteStatusReg(ARM64_SYSREG(3, 3, 4, 4, 1), a1->__fpsr);
  _WriteStatusReg(ARM64_SYSREG(3, 3, 4, 4, 0), a1->__fpcr);
  return 0;
}

int fegetenv(fenv_t *a1)
{
  a1->__fpsr = _ReadStatusReg(ARM64_SYSREG(3, 3, 4, 4, 1));
  a1->__fpcr = _ReadStatusReg(ARM64_SYSREG(3, 3, 4, 4, 0));
  return 0;
}

float atan2f(float result, float a2)
{
  double v2;
  float64x2_t v3;
  const double *v4;
  float64x2_t v5;
  float64x2_t v6;
  double v7;
  double v8;
  float64x2_t v9;
  const double *v10;
  float64x2_t v11;
  float64x2_t v12;
  double v13;
  float64x2_t v14;
  const double *v15;
  float64x2_t v16;
  float64x2_t v17;
  float v18;
  double v19;
  float64x2_t v20;
  const double *v21;
  float64x2_t v22;
  float64x2_t v23;

  if (result < a2)
  {
    if ((float)-a2 >= result)
    {
      if ((float)-a2 == result)
      {
        return -0.785398163;
      }
      else
      {
        v8 = a2 / result;
        v9 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v8 * v8), 0);
        v10 = (const double *)&qword_1DEE4BA80;
        *(_QWORD *)&v11.f64[0] = *(_OWORD *)&vld1q_dup_f64(v10);
        v11.f64[1] = v8;
        v12 = vmulq_f64(vmulq_f64(vmlaq_n_f64((float64x2_t)xmmword_1DEE4BA50, vaddq_f64(v9, (float64x2_t)xmmword_1DEE4BA40), v8 * v8), vmlaq_n_f64((float64x2_t)xmmword_1DEE4BA70, vaddq_f64(v9, (float64x2_t)xmmword_1DEE4BA60), v8 * v8)), v11);
        return -1.57079633 - vmulq_laneq_f64(v12, v12, 1).f64[0];
      }
    }
    else
    {
      v2 = result / a2;
      v3 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v2 * v2), 0);
      v4 = (const double *)&qword_1DEE4BA80;
      *(_QWORD *)&v5.f64[0] = *(_OWORD *)&vld1q_dup_f64(v4);
      v5.f64[1] = v2;
      v6 = vmulq_f64(vmulq_f64(vmlaq_n_f64((float64x2_t)xmmword_1DEE4BA50, vaddq_f64(v3, (float64x2_t)xmmword_1DEE4BA40), v2 * v2), vmlaq_n_f64((float64x2_t)xmmword_1DEE4BA70, vaddq_f64(v3, (float64x2_t)xmmword_1DEE4BA60), v2 * v2)), v5);
      *(_QWORD *)&v7 = *(_OWORD *)&vmulq_laneq_f64(v6, v6, 1);
    }
    return v7;
  }
  if (result != a2)
  {
    if ((float)-a2 < result)
    {
      v13 = a2 / result;
      v14 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v13 * v13), 0);
      v15 = (const double *)&qword_1DEE4BA80;
      *(_QWORD *)&v16.f64[0] = *(_OWORD *)&vld1q_dup_f64(v15);
      v16.f64[1] = v13;
      v17 = vmulq_f64(vmulq_f64(vmlaq_n_f64((float64x2_t)xmmword_1DEE4BA50, vaddq_f64(v14, (float64x2_t)xmmword_1DEE4BA40), v13 * v13), vmlaq_n_f64((float64x2_t)xmmword_1DEE4BA70, vaddq_f64(v14, (float64x2_t)xmmword_1DEE4BA60), v13 * v13)), v16);
      return 1.57079633 - vmulq_laneq_f64(v17, v17, 1).f64[0];
    }
    if ((float)-a2 == result)
      return 2.35619449;
    v18 = result;
    v19 = result / a2;
    if (fabs(v19) >= 0.000000238418579)
    {
      v20 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v19 * v19), 0);
      v21 = (const double *)&qword_1DEE4BA80;
      *(_QWORD *)&v22.f64[0] = *(_OWORD *)&vld1q_dup_f64(v21);
      v22.f64[1] = v19;
      v23 = vmulq_f64(vmulq_f64(vmlaq_n_f64((float64x2_t)xmmword_1DEE4BA50, vaddq_f64(v20, (float64x2_t)xmmword_1DEE4BA40), v19 * v19), vmlaq_n_f64((float64x2_t)xmmword_1DEE4BA70, vaddq_f64(v20, (float64x2_t)xmmword_1DEE4BA60), v19 * v19)), v22);
      return vmulq_laneq_f64(v23, v23, 1).f64[0] + *(double *)&qword_1DEE4BA90[LODWORD(v18) >> 31];
    }
LABEL_22:
    v7 = 3.1415925;
    if (v18 < 0.0)
      return -3.1415925;
    return v7;
  }
  if (result < 0.0)
    return -2.35619449;
  if (result != 0.0)
    return 0.785398163;
  if ((LODWORD(a2) & 0x80000000) != 0)
  {
    v18 = result;
    goto LABEL_22;
  }
  return result;
}

float exp2f(float a1)
{
  double v1;
  double v2;
  float v4;

  if ((LODWORD(a1) >> 23) >= 0x87u)
  {
    if (a1 >= 0.0)
    {
      return a1 * 3.4028e38;
    }
    else
    {
      if (LODWORD(a1) < 0xFF800000)
        v4 = 1.1755e-38;
      else
        v4 = 0.0;
      return v4 * v4;
    }
  }
  else
  {
    v1 = a1;
    *(_QWORD *)&v2 = qword_1DEE755F0[COERCE_UNSIGNED_INT64(v1 + 5.27765581e13) & 0x7F]
                   + (COERCE__INT64(v1 + 5.27765581e13) << 45);
    return v2
         + (0.240226507 * (v1 - (v1 + 5.27765581e13 - 5.27765581e13)) + 0.693147816)
         * (v1 - (v1 + 5.27765581e13 - 5.27765581e13))
         * v2;
  }
}

long double nexttoward(long double __x, long double __y)
{
  long double v2;
  long double result;
  BOOL v4;

  if (__x < __y)
  {
    v2 = INFINITY;
    return nexttowardl(__x, v2);
  }
  if (__x > __y)
  {
    v2 = -INFINITY;
    return nexttowardl(__x, v2);
  }
  v4 = __x == __y;
  result = __y + __y;
  if (v4)
    return __y;
  return result;
}

long double atanl(long double __x)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;

  if (__x < 0.0)
  {
    if (__x < -1.0)
    {
      if (__x >= -1.66666667)
      {
        if (__x >= -1.33333333)
        {
          v1 = -1.16666667 - __x;
          v2 = ((((((((((v1 * -0.000374069573 + 0.000809804682) * v1 + -0.000980867423) * v1 + 0.000219264283) * v1
                    + 0.00231783614)
                   * v1
                   + -0.00684699873)
                  * v1
                  + 0.0113421914)
                 * v1
                 + -0.00912499259)
                * v1
                + -0.0135556998)
               * v1
               + 0.0780818237)
              * v1
              + -0.209273356)
             * v1
             + 0.423529412;
          v3 = 0.862170055;
        }
        else
        {
          v1 = -1.5 - __x;
          v2 = (((((((((v1 * 0.0000308157532 + 0.000104161958) * v1 + -0.000462468541) * v1 + 0.0011204903) * v1
                   + -0.00190991275)
                  * v1
                  + 0.00182977869)
                 * v1
                 + 0.00210292135)
                * v1
                + -0.0168061342)
               * v1
               + 0.0558337126)
              * v1
              + -0.142011834)
             * v1
             + 0.307692308;
          v3 = 0.982793723;
        }
      }
      else
      {
        if (__x < -2.0)
          return -sub_1DEE48B30(-__x);
        v1 = -1.83333333 - __x;
        v2 = ((((((((v1 * 0.000061205255 + -0.000145088351) * v1 + 0.00026032522) * v1 + -0.00028572536) * v1
                + -0.000291355443)
               * v1
               + 0.0030267288)
              * v1
              + -0.0119665581)
             * v1
             + 0.0365033349)
            * v1
            + -0.0963933628)
           * v1
           + 0.229299363;
        v3 = 1.07144961;
      }
      return -(v3 + v2 * v1);
    }
    if (__x < -0.5)
    {
      if (__x >= -0.75)
      {
        v1 = -0.625 - __x;
        v2 = ((((((((((v1 * 0.00416492719 + -0.0144211285) * v1 + 0.0123613374) * v1 + 0.00780078683) * v1
                  + -0.0324382982)
                 * v1
                 + 0.0323836333)
                * v1
                + 0.012919563)
               * v1
               + -0.0824261347)
              * v1
              + 0.101841437)
             * v1
             + 0.0213040101)
            * v1
            + -0.323191516)
           * v1
           + 0.719101124;
        v3 = 0.558599315;
      }
      else
      {
        v1 = -0.875 - __x;
        v2 = (((((((((v1 * 0.000109312002 + -0.00449174389) * v1 + 0.0084575497) * v1 + -0.00653208919) * v1
                 + -0.00613354953)
                * v1
                + 0.0278965409)
               * v1
               + -0.043421395)
              * v1
              + 0.0211020894)
             * v1
             + 0.0785382925)
            * v1
            + -0.280679771)
           * v1
           + 0.566371681;
        v3 = 0.71883;
      }
      return -(v3 + v2 * v1);
    }
    if (__x >= -0.0000000135386034)
    {
      if (__x > -2.22507386e-308)
        goto LABEL_22;
      return (2.22507386e-308 + 1.0) * __x;
    }
    return __x
         + __x
         * __x
         * (((((((((((__x * __x * 0.010089798 + -0.0273999031) * (__x * __x) + 0.0418461372) * (__x * __x)
                  + -0.0512146755)
                 * (__x
                  * __x)
                 + 0.0585821744)
                * (__x
                 * __x)
                + -0.0666380617)
               * (__x
                * __x)
               + 0.0769207444)
              * (__x
               * __x)
              + -0.0909089636)
             * (__x
              * __x)
             + 0.111111107)
            * (__x
             * __x)
            + -0.142857143)
           * (__x
            * __x)
           + 0.2)
          * (__x
           * __x)
          + -0.333333333)
         * __x;
  }
  if (__x > 1.0)
  {
    if (__x <= 1.66666667)
    {
      if (__x <= 1.33333333)
      {
        v4 = __x + -1.16666667;
        v5 = ((((((((((v4 * -0.000374069573 + 0.000809804682) * v4 + -0.000980867423) * v4 + 0.000219264283) * v4
                  + 0.00231783614)
                 * v4
                 + -0.00684699873)
                * v4
                + 0.0113421914)
               * v4
               + -0.00912499259)
              * v4
              + -0.0135556998)
             * v4
             + 0.0780818237)
            * v4
            + -0.209273356)
           * v4
           + 0.423529412;
        v6 = 0.862170055;
      }
      else
      {
        v4 = __x + -1.5;
        v5 = (((((((((v4 * 0.0000308157532 + 0.000104161958) * v4 + -0.000462468541) * v4 + 0.0011204903) * v4
                 + -0.00190991275)
                * v4
                + 0.00182977869)
               * v4
               + 0.00210292135)
              * v4
              + -0.0168061342)
             * v4
             + 0.0558337126)
            * v4
            + -0.142011834)
           * v4
           + 0.307692308;
        v6 = 0.982793723;
      }
    }
    else
    {
      if (__x > 2.0)
        return sub_1DEE48B30(__x);
      v4 = __x + -1.83333333;
      v5 = ((((((((v4 * 0.000061205255 + -0.000145088351) * v4 + 0.00026032522) * v4 + -0.00028572536) * v4
              + -0.000291355443)
             * v4
             + 0.0030267288)
            * v4
            + -0.0119665581)
           * v4
           + 0.0365033349)
          * v4
          + -0.0963933628)
         * v4
         + 0.229299363;
      v6 = 1.07144961;
    }
    return v6 + v5 * v4;
  }
  if (__x > 0.5)
  {
    if (__x <= 0.75)
    {
      v4 = __x + -0.625;
      v5 = ((((((((((v4 * 0.00416492719 + -0.0144211285) * v4 + 0.0123613374) * v4 + 0.00780078683) * v4 + -0.0324382982)
               * v4
               + 0.0323836333)
              * v4
              + 0.012919563)
             * v4
             + -0.0824261347)
            * v4
            + 0.101841437)
           * v4
           + 0.0213040101)
          * v4
          + -0.323191516)
         * v4
         + 0.719101124;
      v6 = 0.558599315;
    }
    else
    {
      v4 = __x + -0.875;
      v5 = (((((((((v4 * 0.000109312002 + -0.00449174389) * v4 + 0.0084575497) * v4 + -0.00653208919) * v4
               + -0.00613354953)
              * v4
              + 0.0278965409)
             * v4
             + -0.043421395)
            * v4
            + 0.0211020894)
           * v4
           + 0.0785382925)
          * v4
          + -0.280679771)
         * v4
         + 0.566371681;
      v6 = 0.71883;
    }
    return v6 + v5 * v4;
  }
  if (__x > 0.0000000135386034)
    return __x
         + __x
         * __x
         * (((((((((((__x * __x * 0.010089798 + -0.0273999031) * (__x * __x) + 0.0418461372) * (__x * __x)
                  + -0.0512146755)
                 * (__x
                  * __x)
                 + 0.0585821744)
                * (__x
                 * __x)
                + -0.0666380617)
               * (__x
                * __x)
               + 0.0769207444)
              * (__x
               * __x)
              + -0.0909089636)
             * (__x
              * __x)
             + 0.111111107)
            * (__x
             * __x)
            + -0.142857143)
           * (__x
            * __x)
           + 0.2)
          * (__x
           * __x)
          + -0.333333333)
         * __x;
  if (__x >= 2.22507386e-308)
    return (2.22507386e-308 + 1.0) * __x;
LABEL_22:
  if (__x != 0.0)
    return __x + __x * 2.22507386e-308;
  return __x;
}

float asinf(float a1)
{
  float v1;
  int32x2_t v2;
  double v3;
  double v4;
  float result;
  int32x2_t v6;
  int32x2_t v7;

  v1 = fabsf(a1);
  if (v1 >= 1.0)
  {
    if (v1 == 1.0 || v1 <= 1.0)
    {
      v6 = (int32x2_t)vshr_n_u32(*(uint32x2_t *)&a1, 0x1FuLL);
      v7.i32[1] = 1073291771;
      *(float *)v7.i32 = 1.57079627;
      LODWORD(result) = vsli_n_s32(v7, v6, 0x1FuLL).u32[0];
    }
    else
    {
      return INFINITY - INFINITY;
    }
  }
  else if (v1 <= 0.5)
  {
    if (v1 >= 0.0000000074506)
      return a1
           + a1
           * (a1
            * a1
            * (a1 * a1 * 0.0750010316
             + 0.166666663
             + a1
             * a1
             * (a1
              * a1)
             * (a1 * a1 * 0.0311319185 + 0.0445966252 + a1 * a1 * (a1 * a1) * (a1 * a1 * 0.033921071 + 0.0170057923))));
    else
      return (float)(a1 + (float)(a1 * 134220000.0)) * 0.0000000074506;
  }
  else
  {
    v2 = (int32x2_t)vshr_n_u32(*(uint32x2_t *)&a1, 0x1FuLL);
    v3 = (float)(1.0 - v1);
    v4 = 1.57079633
       - (v3 * 0.117852018
        + 1.41421356
        + v3 * v3 * (v3 * 0.00805353841 + 0.0264965904 + v3 * v3 * (v3 * 0.00188666275 + 0.00210575839)))
       * sqrt(v3);
    *(float *)&v4 = v4;
    LODWORD(result) = vsli_n_s32(*(int32x2_t *)&v4, v2, 0x1FuLL).u32[0];
  }
  return result;
}

long double logl(long double __x)
{
  long double v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  double *v5;
  double *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int8x8_t v11;
  double v12;

  v1 = __x;
  if ((unint64_t)(*(_QWORD *)&__x - 0x10000000000000) >= 0x7FE0000000000000)
  {
    if (__x == 0.0)
      return -1.0 / 0.0;
    if (__x < 0.0)
      return INFINITY - INFINITY;
    if (*(_QWORD *)&__x - 0x10000000000000 >= 0)
      return __x;
    *(_QWORD *)&v1 = COERCE__INT64(COERCE_DOUBLE(vorr_s8(*(int8x8_t *)&__x, COERCE_INT8X8_T(1.0))) - 1.0)
                   - 0x3FE0000000000000;
  }
  v2 = (*(_QWORD *)&v1 - 0x3FE7F00000000000) >> 52;
  v3 = *(_QWORD *)&v1 & 0xFFFFFFFFFFFFFLL;
  v4 = COERCE_DOUBLE(vorr_s8((int8x8_t)v3, COERCE_INT8X8_T(1.0)));
  v5 = (double *)((char *)&unk_1DEE76A80 + 32 * ((unint64_t)(v3 + 0x100000000000) >> 45));
  v7 = *v5;
  v8 = v5[1];
  v6 = v5 + 2;
  v9 = -(1.0 - v4 * v7);
  v10 = v9
      * v9
      * (v9 * 0.142860958 + -0.185195468)
      * (v9 * (1.37739687 - (1.0 - v4 * v7)) + 1.61679209)
      * (v9 * (-1.24772208 - (1.0 - v4 * v7)) + 1.66988081);
  if (v2)
    return v8 + (double)v2 * 0.693147153 + *v6 + (double)v2 * 0.0000000278976681 + v10 - (1.0 - v4 * v7);
  *(double *)&v11 = v7 * v4 - 1.0;
  v12 = COERCE_DOUBLE(vand_s8(v11, (int8x8_t)-134217728));
  return v12 + v8 + *(double *)&v11 - v12 - (v7 * v4 - v7 * v4) + *v6 + v10;
}

float fmodf(float a1, float a2)
{
  unsigned int v2;
  unsigned int v3;
  float v5;
  int v6;
  unsigned int v7;
  char v8;
  unsigned int v9;
  char v10;
  int v11;
  unsigned int v12;
  BOOL v13;
  unsigned int v14;
  char v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v22;
  int v23;
  int v24;
  int v25;
  unsigned int v26;
  int v27;
  unsigned int v28;

  v2 = LODWORD(a1) & 0x7FFFFFFF;
  v3 = LODWORD(a2) & 0x7FFFFFFF;
  if ((LODWORD(a1) & 0x7FFFFFFFu) - 2139095040 < 0x80800001 || (LODWORD(a2) & 0x7FFFFFFFu) - 2139095040 < 0x80800001)
  {
    v5 = NAN;
    if (fabsf(a1) == INFINITY || a2 == 0.0)
      return v5;
    if (a1 == 0.0 || fabsf(a2) == INFINITY)
      return a1;
  }
  if (v3 >= v2)
  {
    if (v3 == v2)
      LODWORD(v5) = LODWORD(a1) & 0x80000000;
    else
      return a1;
  }
  else
  {
    v6 = 0;
    v7 = __clz(v2);
    v8 = v7 - 8;
    v9 = 9 - v7;
    if (v2 < 0x800000)
    {
      v10 = v8;
    }
    else
    {
      v9 = v2 >> 23;
      v10 = 0;
    }
    v11 = (LODWORD(a1) & 0x7FFFFF) << v10;
    v12 = __clz(v3);
    v13 = v3 >= 0x800000;
    if (v3 >= 0x800000)
      v14 = v3 >> 23;
    else
      v14 = 9 - v12;
    if (v13)
      v15 = 0;
    else
      v15 = v12 - 8;
    v16 = v11 | 0x800000;
    v17 = ((LODWORD(a2) & 0x7FFFFF) << v15) | 0x800000;
    v18 = v9 - v14;
    do
    {
      v18 += ~v6;
      v19 = (v16 << v6) - v17;
      v20 = v17 & (v19 >> 31);
      v16 = v20 + 2 * v19;
      v6 = __clz(v16) - 40;
    }
    while (v18 >= v6 && v16 != 0);
    if (v18 < 0)
      v16 = (v16 + v20) >> 1;
    v22 = v16 << (v18 & ~(v18 >> 31));
    if (v22)
    {
      v23 = __clz(v22) - 40;
      v24 = v22 << v23;
      v25 = v14 - v23;
      v26 = LODWORD(a1) & 0x80000000 | v24 & 0x7FFFFF;
      v27 = v25 << 23;
      if (v25 < 1)
        return COERCE_FLOAT(v26 | (v27 + 1056964608)) * 1.1755e-38;
      v28 = v26 | v27;
    }
    else
    {
      v28 = LODWORD(a1) & 0x80000000;
    }
    return *(float *)&v28;
  }
  return v5;
}

float __exp10f(float a1)
{
  double v1;
  double v2;
  double v3;
  float v5;

  if ((LODWORD(a1) >> 23) >= 0x85u)
  {
    if (a1 >= 0.0)
    {
      return a1 * 3.4028e38;
    }
    else
    {
      if (LODWORD(a1) < 0xFF800000)
        v5 = 1.1755e-38;
      else
        v5 = 0.0;
      return v5 * v5;
    }
  }
  else
  {
    v1 = 425.206796 * a1;
    v2 = round(v1);
    *(_QWORD *)&v3 = qword_1DEE755F0[(uint64_t)v2 & 0x7F] + ((uint64_t)v2 << 45);
    return v3 + (0.0000146622624 * (v1 - v2) + 0.00541521731) * (v1 - v2) * v3;
  }
}

uint64_t lrintf(float a1)
{
  return (uint64_t)rintf(a1);
}

long double nexttowardl(long double __x, long double __y)
{
  uint64_t v2;

  if (__y <= __x)
  {
    if (__y == __x)
      return __y;
    v2 = -1;
  }
  else
  {
    v2 = 1;
  }
  if (__x == 0.0)
    *(_QWORD *)&__y = *(_QWORD *)&__y & 0x8000000000000000 | 1;
  else
    *(_QWORD *)&__y = (v2 ^ (*(uint64_t *)&__x >> 63)) - (*(uint64_t *)&__x >> 63) + *(_QWORD *)&__x;
  return __y;
}

int __fpclassifyl(double a1)
{
  unint64_t v1;
  int v2;
  BOOL v3;
  int v4;

  v1 = *(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFLL;
  if ((*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) - 1 >= 0xFFFFFFFFFFFFFLL)
    v2 = 3;
  else
    v2 = 5;
  v3 = v1 > 0x7FF0000000000000;
  if (v1 == 0x7FF0000000000000)
    v4 = 2;
  else
    v4 = v2;
  if (v3)
    v4 = 1;
  if (((*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
    return v4;
  else
    return 4;
}

float modff(float result, float *a2)
{
  int8x16_t v2;
  int8x16_t v3;
  float v4;
  int8x16_t v5;

  if ((LODWORD(result) & 0x7FFFFFFFu) - 2139095040 >= 0x80800001)
  {
    v4 = truncf(result);
    *a2 = v4;
    if (v4 == result)
    {
      v2.i32[0] = 0;
      v5.i64[0] = 0x8000000080000000;
      v5.i64[1] = 0x8000000080000000;
      LODWORD(result) = vbslq_s8(v5, v2, *(int8x16_t *)&result).u32[0];
    }
    else
    {
      return result - v4;
    }
  }
  else
  {
    *a2 = result;
    v2.i32[0] = 0;
    v3.i64[0] = 0x8000000080000000;
    v3.i64[1] = 0x8000000080000000;
    v2.i32[0] = vbslq_s8(v3, v2, *(int8x16_t *)&result).u32[0];
    if ((LODWORD(result) & 0x7FFFFFFF) == 0x7F800000)
      return *(float *)v2.i32;
  }
  return result;
}

float log10f(float result)
{
  int8x8_t v1;
  float v2;
  int v3;
  int v4;
  double *v5;
  double v6;

  v2 = result;
  if ((LODWORD(result) - 0x800000) < 0x7F000000)
    goto LABEL_2;
  if (result == 0.0)
    return -1.0 / 0.0;
  if (result < 0.0)
    return INFINITY - INFINITY;
  if (LODWORD(result) - 0x800000 < 0)
  {
    v1.i32[0] = 1.0;
    LODWORD(v2) = COERCE_INT(*(float *)vorr_s8(*(int8x8_t *)&result, v1).i32 - 1.0) - 1056964608;
LABEL_2:
    v3 = (LODWORD(v2) - 1061093376) >> 23;
    v4 = LODWORD(v2) & 0x7FFFFF;
    v5 = (double *)&qword_1DEE4CB60[2 * ((v4 + 0x10000) >> 17) + 4];
    v6 = -(1.0 - COERCE_FLOAT(v4 | 0x3F800000) * *v5);
    return v5[1]
         + (double)v3 * 0.301029996
         + v6 * (v6 * (v6 * (v6 * -0.108580249 + 0.144770129) + -0.217147241) + 0.434294482);
  }
  return result;
}

float atanf(float a1)
{
  float v1;
  int32x2_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  float result;
  int32x2_t v9;
  int32x2_t v10;

  v1 = fabsf(a1);
  if (v1 >= 7401800.0)
  {
    v9 = (int32x2_t)vshr_n_u32(*(uint32x2_t *)&a1, 0x1FuLL);
    v10.i32[1] = 1073291771;
    *(float *)v10.i32 = 1.57079627;
    LODWORD(result) = vsli_n_s32(v10, v9, 0x1FuLL).u32[0];
  }
  else if (v1 <= 1.0)
  {
    if (v1 >= 0.0000000074506)
      return a1
           * 0.00293529219
           * ((a1 * a1 * (a1 * a1 + 2.29715623) + 2.44496923)
            * (a1 * a1 * (a1 * a1 + 0.0207432003) + 3.78888793)
            * ((a1 * a1 * (a1 * a1 + -2.94669675) + 5.47284473)
             * (a1 * a1 * (a1 * a1 + -4.97210724) + 6.71970762)));
    else
      return (float)(a1 + (float)(a1 * 134220000.0)) * 0.0000000074506;
  }
  else
  {
    v2 = (int32x2_t)vshr_n_u32(*(uint32x2_t *)&a1, 0x1FuLL);
    v3 = v1;
    v4 = 1.0 / v3;
    v5 = v3 * v3;
    v6 = v4 * v4 * (v4 * v4) * (v4 * v4 * (v4 * v4));
    v7 = 1.57079633
       - v4
       * ((v5 * (v5 + 0.919367235) + 0.399277299)
        * (v5 * (v5 + -0.00520359441) + 0.252126866)
        * ((v5 * (v5 + -0.527318654) + 0.173046627)
         * (v5 * (v5 + -0.72017388) + 0.140867941)))
       * (v6
        * v6);
    *(float *)&v7 = v7;
    LODWORD(result) = vsli_n_s32(*(int32x2_t *)&v7, v2, 0x1FuLL).u32[0];
  }
  return result;
}

simd_float4 _simd_exp2_f4(simd_float4 x)
{
  float32x4_t v1;
  float32x4_t v2;
  int32x4_t v3;
  int8x16_t v4;
  int8x16_t v5;
  int8x16_t v6;
  float32x4_t v7;
  float32x4_t v8;
  int8x16_t v9;
  float32x4_t v10;

  v1.i64[0] = 0x4300000043000000;
  v1.i64[1] = 0x4300000043000000;
  v2 = vminq_f32(vmaxq_f32((float32x4_t)x, (float32x4_t)vdupq_n_s32(0xC3160000)), v1);
  v3 = vcvtnq_s32_f32(v2);
  v4 = (int8x16_t)vcltzq_s32((int32x4_t)v2);
  v5.i64[0] = 0x7E0000007ELL;
  v5.i64[1] = 0x7E0000007ELL;
  v6.i64[0] = 0xA0000000A0;
  v6.i64[1] = 0xA0000000A0;
  v7 = (float32x4_t)vshlq_n_s32(vaddq_s32((int32x4_t)vbslq_s8(v4, v6, v5), v3), 0x17uLL);
  v8 = vsubq_f32(v2, vcvtq_f32_s32(v3));
  v6.i64[0] = 0x6F0000006F000000;
  v6.i64[1] = 0x6F0000006F000000;
  v9 = vandq_s8(v4, v6);
  v6.i64[0] = 0x4000000040000000;
  v6.i64[1] = 0x4000000040000000;
  v10 = (float32x4_t)veorq_s8(v9, v6);
  __asm { FMOV            V4.4S, #1.0 }
  return (simd_float4)vmulq_f32(vmulq_f32(vmlaq_f32(_Q4, v8, vmlaq_f32((float32x4_t)vdupq_n_s32(0x3F317218u), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3E75FDF0u), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3D6357B6u), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3C1D94F2u), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3AAF844Eu), (float32x4_t)vdupq_n_s32(0x39223642u), v8), v8), v8), v8),
                              v8)),
                          v7),
                        v10);
}

long double exp2l(long double __x)
{
  int64_t v1;
  long double v2;
  double *v3;
  double v4;
  double v5;
  uint64_t v6;
  long double result;
  double v8;

  if ((*(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFuLL) >= 0x4090000000000000 - (*(uint64_t *)&__x >> 63 << 48))
  {
    if (__x >= 0.0)
    {
      return __x * 1.79769313e308;
    }
    else
    {
      v8 = 2.22507386e-308;
      if (*(_QWORD *)&__x >= 0xFFF0000000000000)
        v8 = 0.0;
      return v8 * v8;
    }
  }
  else
  {
    v1 = vcvtd_n_s64_f64(__x, 7uLL) + (*(uint64_t *)&__x >> 63);
    v2 = __x - vcvtd_n_f64_s64(v1, 7uLL);
    v3 = (double *)((char *)&unk_1DEE75A30 + 16 * (v1 & 0x7F));
    v4 = *v3;
    v5 = (v2 + v3[1])
       * 0.00133636822
       * ((v2 + v3[1]) * (v2 + 7.73568837) + 20.9994886)
       * ((v2 + v3[1]) * (v2 + -0.538489) + 24.6996388);
    v6 = v1 >> 7;
    if (v6 + 1022 < 0)
      return (COERCE_DOUBLE(*(_QWORD *)&v4 + ((v6 + 1022) << 52))
            + 1.0
            + COERCE_DOUBLE(*(_QWORD *)&v4 + ((v6 + 1022) << 52))
            - (COERCE_DOUBLE(*(_QWORD *)&v4 + ((v6 + 1022) << 52))
             + 1.0
             - 1.0)
            + COERCE_DOUBLE(*(_QWORD *)&v4 + ((v6 + 1022) << 52)) * v5
            - 1.0)
           * 2.22507386e-308;
    else
      *(_QWORD *)&result = COERCE__INT64(v4 + v5 * v4) + (v6 << 52);
  }
  return result;
}

long double log2l(long double __x)
{
  long double v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  double *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v1 = __x;
  if ((unint64_t)(*(_QWORD *)&__x - 0x10000000000000) >= 0x7FE0000000000000)
  {
    if (__x == 0.0)
      return -1.0 / 0.0;
    if (__x < 0.0)
      return INFINITY - INFINITY;
    if (*(_QWORD *)&__x - 0x10000000000000 >= 0)
      return __x;
    *(_QWORD *)&v1 = COERCE__INT64(COERCE_DOUBLE(vorr_s8(*(int8x8_t *)&__x, COERCE_INT8X8_T(1.0))) - 1.0)
                   - 0x3FE0000000000000;
  }
  v2 = (*(_QWORD *)&v1 - 0x3FE7F00000000000) >> 52;
  v3 = *(_QWORD *)&v1 & 0xFFFFFFFFFFFFFLL;
  v4 = COERCE_DOUBLE(vorr_s8((int8x8_t)v3, COERCE_INT8X8_T(1.0)));
  v5 = (double *)&qword_1DEE4D510[2 * ((unint64_t)(v3 + 0x100000000000) >> 45) + 1];
  v6 = *v5;
  v7 = v5[1];
  v8 = -(1.0 - v4 * *v5);
  v9 = v8
     * v8
     * (v8 * 0.206104795 + -0.267180584)
     * (v8 * (1.37739687 - (1.0 - v4 * v6)) + 1.61679209)
     * (v8 * (-1.24772208 - (1.0 - v4 * v6)) + 1.66988081);
  if (v2)
  {
    v10 = COERCE_DOUBLE(vand_s8((int8x8_t)-134217728, *(int8x8_t *)&v7));
    return (double)v2 + v10 + v7 - v10 + v9 + v8 * 1.44269504;
  }
  else
  {
    v11 = v6 * v4 - 1.0;
    v12 = -(v6 * v4 - v6 * v4);
    v13 = v8 * 0.0000000192596299;
    v14 = COERCE_DOUBLE(vand_s8(*(int8x8_t *)&v8, (int8x8_t)-134217728));
    return v13
         + (v12 + v11 - v14) * 1.44269502
         + v14 * 1.44269502
         - (v7
          + v14 * 1.44269502
          - v7)
         + v9
         + v7
         + v14 * 1.44269502;
  }
}

double sub_1DEE4DD28(double a1)
{
  double v1;

  v1 = a1
     * a1
     * (((((((((((a1 * a1 * 0.179113217 + -0.371848168) * (a1 * a1) + 0.415448512) * (a1 * a1) + -0.260908275)
             * (a1
              * a1)
             + 0.133632019)
            * (a1
             * a1)
            + -0.0249641996)
           * (a1
            * a1)
           + 0.0262691683)
          * (a1
           * a1)
          + 0.0209095349)
         * (a1
          * a1)
         + 0.0305499958)
        * (a1
         * a1)
        + 0.0446299961)
       * (a1
        * a1)
       + 0.0750005894)
      * (a1
       * a1)
      + 0.166666654)
     * a1;
  return 1.57079633 - (v1 + a1) + v1 + a1 - a1 - v1 + 1.57079633 - (1.57079633 - (v1 + a1)) - (v1 + a1) + 6.123234e-17;
}

simd_float4 _simd_log2_f4(simd_float4 x)
{
  int32x4_t v1;
  int32x4_t v2;
  unsigned int v3;
  int8x16_t v4;
  int32x4_t v5;
  float32x4_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int32x4_t v14;
  int8x16_t v16;
  int32x4_t v17;
  int32x4_t v18;
  int32x4_t v19;
  int8x16_t v20;
  int32x4_t v21;
  int32x4_t v22;
  float32x4_t v24;
  int8x16_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v29;
  float32x4_t v30;
  simd_float4 v31;
  float32x4_t v32;
  int8x16_t v33;
  int8x16_t v34;
  int8x16_t v35;
  int8x16_t v36;
  int8x16_t v37;
  int8x16x3_t v39;

  v1.i64[0] = 0x80000000800000;
  v1.i64[1] = 0x80000000800000;
  v2.i64[0] = 0x100000001000000;
  v2.i64[1] = 0x100000001000000;
  v3 = vmaxvq_u32((uint32x4_t)vcgtq_s32(v2, vaddq_s32((int32x4_t)x, v1)));
  if ((v3 & 0x80000000) != 0)
  {
    v12 = (int8x16_t)vceqzq_s32((int32x4_t)vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s32(0x7F800000u)));
    v13.i64[0] = 0x7F0000007FLL;
    v13.i64[1] = 0x7F0000007FLL;
    v14 = (int32x4_t)vandq_s8((int8x16_t)x, v13);
    __asm { FMOV            V4.4S, #-6.25 }
    v16 = (int8x16_t)vcvtq_f32_s32(vshrq_n_s32(vaddq_s32((int32x4_t)x, _Q4), 0x17uLL));
    v17 = vclzq_s32(v14);
    v18.i64[0] = 0x700000007;
    v18.i64[1] = 0x700000007;
    v19 = (int32x4_t)vandq_s8((int8x16_t)vshlq_u32((uint32x4_t)x, (uint32x4_t)vaddq_s32(v17, v18)), v13);
    v18.i64[0] = 0x800000008;
    v18.i64[1] = 0x800000008;
    v20 = (int8x16_t)vsubq_f32(vcvtq_f32_s32(vshrq_n_s32(vaddq_s32(v19, _Q4), 0x17uLL)), vcvtq_f32_s32(vaddq_s32(v17, v18)));
    v5 = (int32x4_t)vbslq_s8(v12, (int8x16_t)v19, (int8x16_t)v14);
    v11 = (float32x4_t)vbslq_s8(v12, v20, v16);
  }
  else
  {
    v4.i64[0] = 0x7F0000007FLL;
    v4.i64[1] = 0x7F0000007FLL;
    v5 = (int32x4_t)vandq_s8((int8x16_t)x, v4);
    __asm { FMOV            V1.4S, #-6.25 }
    v11 = vcvtq_f32_s32(vshrq_n_s32(vaddq_s32((int32x4_t)x, _Q1), 0x17uLL));
  }
  v21.i64[0] = 0x8000000080000;
  v21.i64[1] = 0x8000000080000;
  v22 = vshrq_n_s32(vaddq_s32(v5, v21), 0x14uLL);
  __asm { FMOV            V4.4S, #1.0 }
  v24 = (float32x4_t)vorrq_s8((int8x16_t)v5, (int8x16_t)_Q4);
  _Q4.i64[0] = 0x404040404040404;
  _Q4.i64[1] = 0x404040404040404;
  v25 = (int8x16_t)vmlaq_s32(vdupq_n_s32(0x3020100u), v22, _Q4);
  v39.val[1] = (int8x16_t)xmmword_1DEE79820;
  v39.val[0] = (int8x16_t)xmmword_1DEE79830;
  v39.val[2].i64[0] = 0x3F0000003F000000;
  v39.val[2].i64[1] = 0x3F0000003F000000;
  v26 = (float32x4_t)vqtbl3q_s8(v39, v25);
  v39.val[1] = (int8x16_t)xmmword_1DEE79840;
  v39.val[0] = (int8x16_t)xmmword_1DEE79850;
  v39.val[2].i8[3] = 0;
  v39.val[2].i8[7] = 0;
  v39.val[2].i8[11] = 0;
  v39.val[2].i8[15] = 0;
  v27 = (float32x4_t)vqtbl3q_s8(v39, v25);
  __asm { FMOV            V5.4S, #-1.0 }
  v29 = vmlaq_f32(_Q5, v26, v24);
  v30 = vmulq_f32(v29, v29);
  v31 = (simd_float4)vaddq_f32(vmlaq_f32(vaddq_f32(v11, v27), vmulq_f32(v30, v30), vmulq_f32(v29, (float32x4_t)vdupq_n_s32(0x3E920AA5u))), vmulq_f32(v29, vmlaq_f32(vmlaq_f32((float32x4_t)vdupq_n_s32(0x3FB8AA3Bu), (float32x4_t)vdupq_n_s32(0xBF38AA2D), v29), v30, vmlaq_f32((float32x4_t)vdupq_n_s32(0x3EF63993u), (float32x4_t)vdupq_n_s32(0xBEB92E1D), v29))));
  if ((v3 & 0x80000000) != 0)
  {
    v32 = (float32x4_t)vdupq_n_s32(0x7F800000u);
    v33 = vbslq_s8((int8x16_t)vceqq_f32((float32x4_t)x, v32), (int8x16_t)v32, (int8x16_t)v31);
    v32.i64[0] = 0x7F0000007FLL;
    v32.i64[1] = 0x7F0000007FLL;
    v34 = vbslq_s8((int8x16_t)vceqzq_f32((float32x4_t)x), (int8x16_t)v32, v33);
    v35 = (int8x16_t)vcgezq_f32((float32x4_t)x);
    v36 = (int8x16_t)vcltzq_f32((float32x4_t)x);
    v37 = (int8x16_t)vdupq_n_s32(0x7FC00000u);
    return (simd_float4)vbslq_s8(vorrq_s8(v36, v35), vbslq_s8(v36, v37, v34), v37);
  }
  return v31;
}

long double hypotl(long double __x, long double __y)
{
  double v2;
  double v3;
  long double result;
  unint64_t v5;
  double v6;
  double v7;

  v2 = fabs(__x);
  v3 = fabs(__y);
  result = fmax(v2, v3);
  v5 = (*(_QWORD *)&result >> 52) & 0x7FFLL;
  if (v5 == 2047)
    return result + result;
  v6 = fmin(v2, v3);
  if (v6 != 0.0)
  {
    if (v5 - ((*(_QWORD *)&v6 >> 52) & 0x7FFLL) > 0x1B)
      v6 = 0.0;
    if (v5 >= 0x5FE)
    {
      v7 = 1.55251809e231;
      result = result * 6.44114877e-232;
      v6 = v6 * 6.44114877e-232;
    }
    else if (v5 < 0x21B)
    {
      v7 = 6.44114877e-232;
      result = result * 1.55251809e231;
      v6 = v6 * 1.55251809e231;
    }
    else
    {
      v7 = 1.0;
    }
    return sqrt(result * result + v6 * v6) * v7;
  }
  return result;
}

float ceilf(float a1)
{
  return ceilf(a1);
}

long double ceill(long double __x)
{
  return ceil(__x);
}

float floorf(float a1)
{
  return floorf(a1);
}

long double floorl(long double __x)
{
  return floor(__x);
}

float roundf(float a1)
{
  return roundf(a1);
}

long double roundl(long double __x)
{
  return round(__x);
}

float truncf(float a1)
{
  return truncf(a1);
}

long double truncl(long double __x)
{
  return trunc(__x);
}

float rintf(float a1)
{
  return rintf(a1);
}

long double rintl(long double __x)
{
  return rint(__x);
}

float nearbyintf(float a1)
{
  return nearbyintf(a1);
}

long double nearbyintl(long double __x)
{
  return nearbyint(__x);
}

simd_float4x4 __invert_f4(simd_float4x4 result)
{
  int32x4_t v1;
  int32x4_t v2;
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  int8x16_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  int8x16_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;

  v1 = vzip1q_s32((int32x4_t)result.columns[0], (int32x4_t)result.columns[2]);
  result.columns[0] = (simd_float4)vzip2q_s32((int32x4_t)result.columns[0], (int32x4_t)result.columns[2]);
  v2 = vzip1q_s32((int32x4_t)result.columns[1], (int32x4_t)result.columns[3]);
  result.columns[1] = (simd_float4)vzip2q_s32((int32x4_t)result.columns[1], (int32x4_t)result.columns[3]);
  result.columns[2] = (simd_float4)vzip1q_s32(v1, v2);
  v3 = (float32x4_t)vzip2q_s32(v1, v2);
  v4 = (float32x4_t)vzip1q_s32((int32x4_t)result.columns[0], (int32x4_t)result.columns[1]);
  result.columns[0] = (simd_float4)vzip2q_s32((int32x4_t)result.columns[0], (int32x4_t)result.columns[1]);
  result.columns[3] = (simd_float4)vextq_s8((int8x16_t)v3, (int8x16_t)v3, 8uLL);
  v5 = (float32x4_t)vextq_s8((int8x16_t)result.columns[0], (int8x16_t)result.columns[0], 8uLL);
  result.columns[0] = (simd_float4)vrev64q_s32((int32x4_t)vmulq_f32(v4, v5));
  v6 = (float32x4_t)vextq_s8((int8x16_t)result.columns[0], (int8x16_t)result.columns[0], 8uLL);
  result.columns[1] = (simd_float4)vmlaq_f32(vnegq_f32(vmulq_f32((float32x4_t)result.columns[2], (float32x4_t)result.columns[0])), v6, (float32x4_t)result.columns[2]);
  v7 = (float32x4_t)vrev64q_s32((int32x4_t)vmulq_f32(v4, (float32x4_t)result.columns[3]));
  result.columns[0] = (simd_float4)vmlaq_f32(vmlaq_f32(vnegq_f32(vmulq_f32((float32x4_t)result.columns[3], (float32x4_t)result.columns[0])), v6, (float32x4_t)result.columns[3]), v7, v5);
  v8 = vmulq_f32((float32x4_t)result.columns[2], v7);
  v9 = (float32x4_t)vextq_s8((int8x16_t)v7, (int8x16_t)v7, 8uLL);
  result.columns[0] = (simd_float4)vmlsq_f32((float32x4_t)result.columns[0], v9, v5);
  v10 = (int8x16_t)vmlaq_f32(vnegq_f32(v8), v9, (float32x4_t)result.columns[2]);
  v11 = (float32x4_t)vextq_s8(v10, v10, 8uLL);
  v12 = (float32x4_t)vrev64q_s32((int32x4_t)vmulq_f32(v3, v5));
  v13 = (float32x4_t)vextq_s8((int8x16_t)v4, (int8x16_t)v4, 8uLL);
  result.columns[0] = (simd_float4)vmlaq_f32((float32x4_t)result.columns[0], v12, v13);
  v14 = vmulq_f32((float32x4_t)result.columns[2], v12);
  v15 = (float32x4_t)vextq_s8((int8x16_t)v12, (int8x16_t)v12, 8uLL);
  result.columns[0] = (simd_float4)vmlsq_f32((float32x4_t)result.columns[0], v15, v13);
  v16 = (int8x16_t)vmlaq_f32(vnegq_f32(v14), v15, (float32x4_t)result.columns[2]);
  v17 = (float32x4_t)vextq_s8(v16, v16, 8uLL);
  v18 = (float32x4_t)vrev64q_s32((int32x4_t)vmulq_f32((float32x4_t)result.columns[2], (float32x4_t)result.columns[3]));
  v19 = vmlaq_f32(v17, v18, v5);
  v20 = vmlaq_f32(vnegq_f32(v11), v18, v13);
  v21 = (float32x4_t)vextq_s8((int8x16_t)v18, (int8x16_t)v18, 8uLL);
  v22 = vmlaq_f32(vnegq_f32(v19), v21, v5);
  v23 = vmlsq_f32(v20, v21, v13);
  v24 = (float32x4_t)vrev64q_s32((int32x4_t)vmulq_f32((float32x4_t)result.columns[2], v5));
  result.columns[1] = (simd_float4)vmlsq_f32((float32x4_t)vextq_s8((int8x16_t)result.columns[1], (int8x16_t)result.columns[1], 8uLL), v24, v13);
  v25 = vmlaq_f32(v22, v24, (float32x4_t)result.columns[3]);
  v26 = (float32x4_t)vextq_s8((int8x16_t)v24, (int8x16_t)v24, 8uLL);
  result.columns[1] = (simd_float4)vmlaq_f32((float32x4_t)result.columns[1], v26, v13);
  v27 = vmlsq_f32(v25, v26, (float32x4_t)result.columns[3]);
  v28 = (float32x4_t)vrev64q_s32((int32x4_t)vmulq_f32((float32x4_t)result.columns[2], v13));
  result.columns[1] = (simd_float4)vmlaq_f32((float32x4_t)result.columns[1], v28, v5);
  v29 = vmlsq_f32(v23, v28, (float32x4_t)result.columns[3]);
  v30 = (float32x4_t)vextq_s8((int8x16_t)v28, (int8x16_t)v28, 8uLL);
  v31 = vmlaq_f32(v29, v30, (float32x4_t)result.columns[3]);
  result.columns[2] = (simd_float4)vmulq_f32((float32x4_t)result.columns[2], (float32x4_t)result.columns[0]);
  *(float32x2_t *)result.columns[2].f32 = vadd_f32(*(float32x2_t *)result.columns[2].f32, (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)result.columns[2], (int8x16_t)result.columns[2], 8uLL));
  result.columns[2].i32[0] = vadd_f32(*(float32x2_t *)result.columns[2].f32, (float32x2_t)vdup_lane_s32(*(int32x2_t *)result.columns[2].f32, 1)).u32[0];
  *(float32x2_t *)result.columns[3].f32 = vrecpe_f32((float32x2_t)result.columns[2].u32[0]);
  *(float32x2_t *)result.columns[3].f32 = vmul_f32(*(float32x2_t *)result.columns[3].f32, vrecps_f32((float32x2_t)result.columns[2].u32[0], *(float32x2_t *)result.columns[3].f32));
  result.columns[3].i32[0] = vmul_f32(*(float32x2_t *)result.columns[3].f32, vrecps_f32((float32x2_t)result.columns[2].u32[0], *(float32x2_t *)result.columns[3].f32)).u32[0];
  result.columns[0] = (simd_float4)vmulq_n_f32((float32x4_t)result.columns[0], result.columns[3].f32[0]);
  result.columns[1] = (simd_float4)vmulq_n_f32(vmlsq_f32((float32x4_t)result.columns[1], v30, v5), result.columns[3].f32[0]);
  result.columns[2] = (simd_float4)vmulq_n_f32(v27, result.columns[3].f32[0]);
  result.columns[3] = (simd_float4)vmulq_n_f32(v31, result.columns[3].f32[0]);
  return result;
}

double __exp10(double a1)
{
  uint64_t v1;
  double v2;
  double v3;
  double *v4;
  double v5;
  double v6;
  uint64_t v7;
  double result;
  double v9;

  if (*(_QWORD *)&a1 < 0x40734413509F79FFuLL || *(uint64_t *)&a1 < (uint64_t)0xC07439B746E36B53)
  {
    v1 = vcvtmd_s64_f64(a1 * 425.206796);
    v2 = a1 * 425.206796 - (double)v1;
    v3 = -(a1 * 425.206796 - a1 * 425.206796 - a1 * loc_1DEE4E388);
    v4 = (double *)&qword_1DEE4E3C0[2 * (v1 & 0x7F)];
    v5 = *v4;
    v6 = (v2 + v4[1] + v3)
       * 3.88934341e-14
       * ((v2 + v4[1] + v3) * (v2 + 990.168112) + 344055.622)
       * ((v2 + v4[1] + v3) * (v2 + -68.926592) + 404678.883);
    v7 = v1 >> 7;
    if (v7 + 1022 < 0)
      return (COERCE_DOUBLE(*(_QWORD *)&v5 + ((v7 + 1022) << 52))
            + 1.0
            + COERCE_DOUBLE(*(_QWORD *)&v5 + ((v7 + 1022) << 52))
            - (COERCE_DOUBLE(*(_QWORD *)&v5 + ((v7 + 1022) << 52))
             + 1.0
             - 1.0)
            + COERCE_DOUBLE(*(_QWORD *)&v5 + ((v7 + 1022) << 52)) * v6
            - 1.0)
           * 2.22507386e-308;
    else
      *(_QWORD *)&result = COERCE__INT64(v5 + v6 * v5) + (v7 << 52);
  }
  else if (a1 >= 0.0)
  {
    return a1 * 1.79769313e308;
  }
  else
  {
    v9 = 2.22507386e-308;
    if (*(_QWORD *)&a1 >= 0xFFF0000000000000)
      v9 = 0.0;
    return v9 * v9;
  }
  return result;
}

long double remainderl(long double __x, long double __y)
{
  double v2;
  double v3;
  double v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  int v12;

  v2 = __x;
  v3 = fabs(__x);
  if (v3 == INFINITY || __y == 0.0)
    return INFINITY - INFINITY;
  v5 = fabs(__y);
  if (v5 != INFINITY && __x != 0.0)
  {
    v6 = (*(_QWORD *)&v3 >> 52) & 0x7FFLL;
    if ((_DWORD)v6)
      v7 = v6 - 1023;
    else
      v7 = (COERCE_UNSIGNED_INT64(COERCE_DOUBLE(*(_QWORD *)&v3 & 0x400FFFFFFFFFFFFFLL | 0x3FF0000000000000) - 1.0) >> 52)
         - 2045;
    v8 = (*(_QWORD *)&v5 >> 52) & 0x7FFLL;
    if ((_DWORD)v8)
      v9 = (v8 - 1023);
    else
      v9 = (COERCE_UNSIGNED_INT64(COERCE_DOUBLE(*(_QWORD *)&v5 & 0x400FFFFFFFFFFFFFLL | 0x3FF0000000000000) - 1.0) >> 52)
         - 2045;
    if (v7 - (int)v9 < 0)
    {
      LOBYTE(v12) = 0;
    }
    else
    {
      if (v7 == (_DWORD)v9)
      {
        LOBYTE(v12) = 0;
      }
      else
      {
        v10 = sub_1DEE6F01C(-(int)v9, v5);
        v11 = sub_1DEE6F01C(-v7, v3);
        v12 = 0;
        do
        {
          if (v11 >= v10)
          {
            v11 = v11 - v10;
            v12 |= 1u;
          }
          v12 *= 2;
          v11 = v11 + v11;
          --v7;
        }
        while ((_DWORD)v9 != v7);
        v3 = sub_1DEE6F01C(v9, v11);
      }
      if (v3 >= v5)
      {
        v3 = v3 - v5;
        LOBYTE(v12) = 1;
      }
    }
    if (v3 >= 4.49423284e307)
    {
      if (v3 <= 0.5 * v5 && ((v12 & 1) == 0 || v3 != 0.5 * v5))
        goto LABEL_30;
    }
    else if (v3 + v3 <= v5 && ((v12 & 1) == 0 || v3 + v3 != v5))
    {
      goto LABEL_30;
    }
    v3 = v3 - v5;
LABEL_30:
    if (v2 >= (double)0)
      return v3;
    else
      return -v3;
  }
  return v2;
}

long double acosl(long double __x)
{
  long double v1;
  long double result;
  BOOL v3;
  long double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (__x < -0.4)
  {
    if (__x < -0.6)
    {
      if (__x > -1.0)
      {
        v1 = sqrt(__x + 1.0)
           * (((((((((((__x * 0.0000167040296 + 0.000179640775) * __x + 0.000915701939) * __x + 0.00297267014) * __x
                   + 0.0070163077)
                  * __x
                  + 0.013174238)
                 * __x
                 + 0.0213350155)
                * __x
                + 0.0323969858)
               * __x
               + 0.0503948885)
              * __x
              + 0.0889636944)
             * __x
             + 0.2145907)
            * __x
            + 1.57079565);
        return 3.14159265 - v1 + 3.14159265 - (3.14159265 - v1) - v1 + 1.2246468e-16;
      }
      if (__x == -1.0)
      {
        v10 = 3.14159265;
        return v10 + 2.22507386e-308;
      }
      return INFINITY - INFINITY;
    }
    return sub_1DEE4DD28(__x);
  }
  if (__x <= 0.4)
  {
    if (__x < -1.72254642e-16 || __x > 1.72254642e-16)
      return 1.57079633
           - (__x
            + __x
            * __x
            * (((((((((__x * __x * 0.0195135077 + 0.00467347315) * (__x * __x) + 0.01277871) * (__x * __x) + 0.0137852767)
                  * (__x
                   * __x)
                  + 0.017369533)
                 * (__x
                  * __x)
                 + 0.0223711522)
                * (__x
                 * __x)
                + 0.0303819824)
               * (__x
                * __x)
               + 0.0446428563)
              * (__x
               * __x)
              + 0.075)
             * (__x
              * __x)
             + 0.166666667)
            * __x);
    v10 = 1.57079633;
    return v10 + 2.22507386e-308;
  }
  if (__x <= 0.6)
    return sub_1DEE4DD28(__x);
  v3 = __x == 1.0;
  if (__x < 1.0)
  {
    v4 = ((((((((((__x * -0.0000159486667 + 0.000173088354) * __x + -0.00088994591) * __x + 0.00291211469) * __x
              + -0.00692168921)
             * __x
             + 0.0130710732)
            * __x
            + -0.0212549234)
           * __x
           + 0.0323527118)
          * __x
          + -0.0503778106)
         * __x
         + 0.0889593166)
        * __x
        + -0.214590029)
       * __x;
    v5 = 1.0 - __x;
    v6 = 1.0 / sqrt(v5);
    v7 = v5 * v6;
    v8 = -(v5 * v6 - v6 * v5);
    v9 = v7 * -0.5 * (v6 * v7 + -1.0 + v6 * v8);
    return (v8 + v9 + v7 - (v7 + v9)) * (v4 + 1.5707956)
         + (v7 + v9) * (v4 + 1.5707956 - (v4 + 1.5707956) + 2.95874534e-18)
         + (v7 + v9) * (v4 + 1.5707956);
  }
  result = 0.0;
  if (!v3)
    return INFINITY - INFINITY;
  return result;
}

float log2f(float result)
{
  int8x8_t v1;
  float v2;
  int v3;
  int v4;
  double *v5;
  double v6;

  v2 = result;
  if ((LODWORD(result) - 0x800000) < 0x7F000000)
    goto LABEL_2;
  if (result == 0.0)
    return -1.0 / 0.0;
  if (result < 0.0)
    return INFINITY - INFINITY;
  if (LODWORD(result) - 0x800000 < 0)
  {
    v1.i32[0] = 1.0;
    LODWORD(v2) = COERCE_INT(*(float *)vorr_s8(*(int8x8_t *)&result, v1).i32 - 1.0) - 1056964608;
LABEL_2:
    v3 = (LODWORD(v2) - 1061093376) >> 23;
    v4 = LODWORD(v2) & 0x7FFFFF;
    v5 = (double *)&qword_1DEE4F198[2 * ((v4 + 0x10000) >> 17) + 4];
    v6 = -(1.0 - COERCE_FLOAT(v4 | 0x3F800000) * *v5);
    return (double)v3 + v5[1] + v6 * (v6 * (v6 * (v6 * -0.360695781 + 0.480915959) + -0.72134752) + 1.44269504);
  }
  return result;
}

float tanf(float a1)
{
  unsigned int v1;
  double v2;
  unsigned int v3;
  BOOL v4;
  uint64_t v5;
  double *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;

  v1 = LODWORD(a1) & 0x7FFFFFFF;
  if ((LODWORD(a1) & 0x7FFFFFFFu) >= 0x7F800000)
    return a1 - a1;
  if (v1 < 0x3F490FDB)
  {
    if (v1 < 0x39800000)
    {
      return (float)(a1 + (float)(a1 * 67109000.0)) * 0.000000014901;
    }
    else
    {
      v12 = a1;
      v13 = v12 * v12;
      return v12
           + v12
           * (v12
            * v12
            * (v12 * v12 * 0.133332166
             + 0.333333341
             + v13 * v13 * (v12 * v12 * loc_1DEE4F748 + 0.0539972382)
             + v13 * v13 * (v13 * v13) * (v12 * v12 * 0.00109333594 + 0.0100247457 + v13 * v13 * 0.00389378239)));
    }
  }
  else
  {
    v2 = a1;
    v3 = HIBYTE(v1);
    v4 = v3 >= 0x4B;
    LODWORD(v5) = v3 - 75;
    if (v4)
      v5 = v5;
    else
      v5 = 0;
    v6 = (double *)((char *)&loc_1DEE4F7B0 + 16 * v5);
    v7 = v2 * *v6;
    v8 = v7 + 6.75539944e15;
    v9 = v7 - (v7 + 6.75539944e15 - 6.75539944e15) + v2 * v6[1];
    v10 = v9
        * (v9 * v9 * 5.27860262 + 3.82127246)
        * (v9 * v9 * (v9 * v9 + *(double *)sub_1DEE4F780) + 0.75337416)
        * ((v9 * v9 * (v9 * v9 + loc_1DEE4F788) + 0.927836296)
         * (loc_1DEE4F7A8 + v9 * v9 * (v9 * v9 + 0.913011791)));
    if ((LOBYTE(v8) & 1) != 0)
      return -1.0 / v10;
    return v10;
  }
}

void sub_1DEE4F780()
{
  JUMPOUT(0x1DEE4F790);
}

float acosf(float a1)
{
  float v1;
  double v3;
  double v4;
  double v5;

  v1 = fabsf(a1);
  if (v1 >= 1.0)
  {
    if (v1 == 1.0 || v1 <= 1.0)
    {
      if (a1 <= 0.0)
        return 3.14159253;
      else
        return 0.0;
    }
    else
    {
      return INFINITY - INFINITY;
    }
  }
  else if (v1 > 0.5)
  {
    v3 = (float)(1.0 - v1);
    v4 = sqrt(v3);
    v5 = v3 * 0.117852018
       + 1.41421356
       + v3 * v3 * (v3 * 0.00805353841 + 0.0264965904 + v3 * v3 * (v3 * 0.00188666275 + 0.00210575839));
    if (a1 > 0.0)
      return v5 * v4;
    else
      return 3.14159265 - v5 * v4;
  }
  else if (v1 >= 0.0019531)
  {
    return 1.57079633
         - (a1
          + a1
          * (a1
           * a1
           * (a1 * a1 * 0.0750010316
            + 0.166666663
            + a1
            * a1
            * (a1
             * a1)
            * (a1 * a1 * 0.0311319185 + 0.0445966252 + a1 * a1 * (a1 * a1) * (a1 * a1 * 0.033921071 + 0.0170057923)))));
  }
  else
  {
    return 1.57079633 - a1;
  }
}

double cargl(__complex_double a1)
{
  return atan2l(a1.c[1], a1.c[0]);
}

long double log10l(long double __x)
{
  long double v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  double *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v1 = __x;
  if ((unint64_t)(*(_QWORD *)&__x - 0x10000000000000) >= 0x7FE0000000000000)
  {
    if (__x == 0.0)
      return -1.0 / 0.0;
    if (__x < 0.0)
      return INFINITY - INFINITY;
    if (*(_QWORD *)&__x - 0x10000000000000 >= 0)
      return __x;
    *(_QWORD *)&v1 = COERCE__INT64(COERCE_DOUBLE(vorr_s8(*(int8x8_t *)&__x, COERCE_INT8X8_T(1.0))) - 1.0)
                   - 0x3FE0000000000000;
  }
  v2 = (*(_QWORD *)&v1 - 0x3FE7F00000000000) >> 52;
  v3 = *(_QWORD *)&v1 & 0xFFFFFFFFFFFFFLL;
  v4 = COERCE_DOUBLE(vorr_s8((int8x8_t)v3, COERCE_INT8X8_T(1.0)));
  v5 = (double *)&qword_1DEE4FEA0[2 * ((unint64_t)(v3 + 0x100000000000) >> 45) + 1];
  v6 = *v5;
  v7 = v5[1];
  v8 = -(1.0 - v4 * *v5);
  v9 = v8
     * v8
     * (v8 * 0.0620437255 + -0.08042937)
     * (v8 * (1.37739687 - (1.0 - v4 * v6)) + 1.61679209)
     * (v8 * (-1.24772208 - (1.0 - v4 * v6)) + 1.66988081);
  if (v2)
  {
    v10 = COERCE_DOUBLE(vand_s8((int8x8_t)-134217728, *(int8x8_t *)&v7));
    return (double)v2 * 5.80172296e-10 + v8 * 0.434294482 + v7 - v10 + v9 + v10 + (double)v2 * 0.301029995;
  }
  else
  {
    v11 = v6 * v4 - 1.0;
    v12 = -(v6 * v4 - v6 * v4);
    v13 = v8 * -0.00000000265246946;
    v14 = COERCE_DOUBLE(vand_s8(*(int8x8_t *)&v8, (int8x8_t)-134217728));
    return v13
         + (v12 + v11 - v14) * loc_1DEE4FE68
         + v14 * loc_1DEE4FE68
         - (v7
          + v14 * loc_1DEE4FE68
          - v7)
         + v9
         + v7
         + v14 * loc_1DEE4FE68;
  }
}

uint64_t lroundl(long double __x)
{
  return llround(__x);
}

float frexpf(float result, int *a2)
{
  int8x16_t v2;
  int8x16_t v3;
  int v4;
  int v5;
  int8x16_t v7;
  int8x16_t v8;

  v4 = (LODWORD(result) >> 23);
  if ((v4 - 1) < 0xFE)
  {
    v2.i32[0] = 0.5;
LABEL_3:
    v3.i32[0] = 2139095040;
    LODWORD(result) = vbslq_s8(v3, v2, *(int8x16_t *)&result).u32[0];
    v5 = v4 - 126;
    goto LABEL_4;
  }
  v5 = 0;
  if ((LODWORD(result) & 0x7FFFFFFF) != 0 && (LODWORD(result) & 0x7FFFFFFFu) < 0x800000)
  {
    v2.i32[0] = 0.5;
    v7.i64[0] = 0x8000000080000000;
    v7.i64[1] = 0x8000000080000000;
    v3 = vbslq_s8(v7, *(int8x16_t *)&result, v2);
    v8 = vorrq_s8(*(int8x16_t *)&result, v2);
    result = *(float *)v8.i32 - *(float *)v3.i32;
    v4 = (LODWORD(result) >> 23) - 125;
    goto LABEL_3;
  }
LABEL_4:
  *a2 = v5;
  return result;
}

float64x2_t __invert_d3@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X8>, float64x2_t a3@<Q0>)
{
  double v3;
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
  double v15;
  double v16;
  float64_t v17;
  double v18;
  float64_t v19;
  double v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t result;

  v3 = a1->f64[1];
  v4 = a1[1].f64[0];
  v5 = a1[2].f64[0];
  v6 = a1[2].f64[1];
  v7 = a1[3].f64[0];
  v8 = a1[4].f64[0];
  v9 = a1[4].f64[1];
  v10 = a1[5].f64[0];
  v11 = -(v7 * v9 - v6 * v10);
  v12 = -(v4 * v9 - v3 * v10);
  v13 = -(v3 * v10 - v4 * v9);
  v14 = -(v4 * v6 - v3 * v7);
  v15 = -(v5 * v10 - v7 * v8);
  v16 = -(v4 * v8 - a1->f64[0] * v10);
  v17 = -(a1->f64[0] * v7 - v4 * v5);
  v18 = -(v6 * v8 - v5 * v9);
  v19 = -(a1->f64[0] * v9 - v3 * v8);
  v20 = -(v3 * v5 - a1->f64[0] * v6);
  a3.f64[0] = v8 * v14 - (v5 * v12 - a1->f64[0] * v11);
  a1->f64[0] = v11;
  a1->f64[1] = v13;
  a1[1].f64[0] = v14;
  a1[2].f64[0] = v15;
  a1[2].f64[1] = v16;
  a1[3].f64[0] = v17;
  a1[4].f64[0] = v18;
  a1[4].f64[1] = v19;
  a1[5].f64[0] = v20;
  a3.f64[0] = 1.0 / a3.f64[0];
  v21 = a1[5];
  v22 = vmulq_f64(a3, a1[1]);
  v23 = vmulq_n_f64(a1[2], a3.f64[0]);
  v24 = vmulq_f64(a3, a1[3]);
  v25 = vmulq_n_f64(a1[4], a3.f64[0]);
  *a2 = vmulq_n_f64(*a1, a3.f64[0]);
  a2[1] = v22;
  a2[2] = v23;
  a2[3] = v24;
  result = vmulq_f64(a3, v21);
  a2[4] = v25;
  a2[5] = result;
  return result;
}

long double tanhl(long double __x)
{
  int64x2_t v1;
  int64x2_t v2;
  double v3;
  int64x2_t v4;
  double v5;
  int64_t v6;
  double v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64x2_t v13;
  long double result;
  int64x2_t v15;
  unint64_t v16;
  double v17;
  double *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int64x2_t v31;
  int64x2_t v32;

  v3 = fabs(__x);
  v4 = (int64x2_t)vshrq_n_u64(*(uint64x2_t *)&__x, 0x3FuLL);
  if (v3 >= 19.0615475)
  {
    if (v3 == INFINITY)
    {
      v32.i64[0] = 1.0;
      *(_QWORD *)&result = vsliq_n_s64(v32, v4, 0x3FuLL).u64[0];
    }
    else
    {
      v1.i64[0] = 0x3C80000000000000;
      v15.i64[0] = 1.0;
      return *(double *)vsliq_n_s64(v15, v4, 0x3FuLL).i64 - *(double *)vsliq_n_s64(v1, v4, 0x3FuLL).i64;
    }
  }
  else if (v3 < 2.0)
  {
    if (v3 < 0.125)
    {
      if (v3 < 0.0000000074505806)
        return (__x + __x * 3.6028797e16) * 2.77555756e-17;
      else
        return __x
             + __x
             * (__x
              * __x)
             * -0.000191243831
             * ((__x * __x * (__x * __x + 3.75667527) + 6.16646283)
              * (__x * __x * (__x * __x + 0.762586651) + 6.36457496)
              * ((__x * __x * (__x * __x + -2.65581961) + 6.59041375)
               * (__x * __x * (__x * __x + -4.89257129) + 6.73865318)));
    }
    else
    {
      v2.i64[0] = v4.i64[0];
      v16 = vcvtd_n_s64_f64(v3, 2uLL);
      v17 = v3 - (vcvtd_n_f64_s64(v16, 2uLL) + 0.125);
      v18 = (double *)((char *)&loc_1DEE50B40 + 128 * v16);
      v19 = *v18;
      v20 = v18[1];
      v21 = v18[2];
      v22 = v18[3];
      v18 += 4;
      v23 = *v18;
      v24 = v18[1];
      v25 = v18[2];
      v26 = v18[3];
      v18 += 4;
      v27 = *v18;
      v28 = v18[1];
      v29 = v18[2];
      v30 = v18[3];
      v18 += 4;
      LODWORD(__x) = 0;
      HIDWORD(__x) = HIDWORD(v3);
      *(double *)v31.i64 = (v25 + v17 * (v17 + v19))
                         * (v26 + v17 * (v17 + v20))
                         * ((v27 + v17 * (v17 + v21))
                          * (v28 + v17 * (v17 + v22)))
                         * ((v29 + v17 * (v17 + v23))
                          * (v30 + v17 * (v17 + v24))
                          * (v18[1] + v17 * *v18))
                         + (v3 - __x) * v18[2]
                         + v18[3]
                         + __x * v18[2];
      *(_QWORD *)&result = vsliq_n_s64(v31, v2, 0x3FuLL).u64[0];
    }
  }
  else
  {
    v5 = -(v3 + v3);
    v6 = vcvtd_n_s64_f64(v5 * 1.44269504, 7uLL);
    v7 = v5 * 1.44269504 - vcvtd_n_f64_s64(v6, 7uLL);
    v8 = (double *)((char *)&unk_1DEE75A30 + 16 * (v6 & 0x7F));
    v9 = v7 + 7.73568837;
    v10 = v7 + -0.538489;
    v11 = v7 + v8[1] - (v5 * 1.44269504 - v5 * 1.44269504 - v5 * 2.03552737e-17);
    *(_QWORD *)&v12 = COERCE__INT64(*v8 + v11 * 0.00133636822 * (v11 * v9 + 20.9994886) * (v11 * v10 + 24.6996388) * *v8)
                    + (((v6 >> 7) + 1) << 52);
    *(double *)v13.i64 = v12
                       * (v12
                        * (v12
                         * (v12 * (loc_1DEE50AC8 + v12 * (loc_1DEE50AC0 + v12 * (v12 * -0.0145290334 + 0.0311857276)))
                          + -0.25)
                         + 0.5)
                        + -1.0)
                       + 1.0;
    *(_QWORD *)&result = vsliq_n_s64(v13, v4, 0x3FuLL).u64[0];
  }
  return result;
}

double __tanpi(double a1)
{
  double v1;
  unint64_t v2;
  char v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  double result;

  if ((*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x4340000000000000)
  {
    if ((*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
      return a1 - a1;
    else
      return a1 * 0.0;
  }
  else
  {
    v1 = a1 + a1;
    v2 = vcvtnd_s64_f64(v1 + v1);
    if (v1 + v1 == vrndnd_f64(v1 + v1))
    {
      if ((v2 & 3) != 0)
      {
        if ((v2 & 1) != 0)
          *(_QWORD *)&result = (v2 << 62) ^ 0x7FF0000000000000;
        else
          return COERCE_DOUBLE((v2 << 61) ^ 0x7FF0000000000000) / 0.0;
      }
      else
      {
        return COERCE_DOUBLE(veor_s8(COERCE_INT8X8_T(v1 * 0.0), (int8x8_t)(v2 << 61)));
      }
    }
    else
    {
      v3 = vcvtnd_s64_f64(v1);
      v4 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v1 - vrndnd_f64(v1)), 0);
      v5 = vmulq_f64(v4, v4);
      v6 = vmlaq_f64(*(float64x2_t *)&qword_1DEE510F8, v5, vmlaq_f64(loc_1DEE510E8, v5, vmlaq_f64(unk_1DEE510D8, v5, vmlaq_f64(*(float64x2_t *)byte_1DEE510C8, v5, vmlaq_f64(*(float64x2_t *)&qword_1DEE510A0[3], v5, vmlaq_f64(*(float64x2_t *)&qword_1DEE510A0[1], v5, unk_1DEE51098))))));
      v5.f64[1] = v4.f64[0];
      v4.f64[0] = 1.0;
      v7 = vaddq_f64(vmulq_f64(v5, v6), v4);
      if ((v3 & 1) != 0)
        return -v7.f64[0] / v7.f64[1];
      else
        return v7.f64[1] / v7.f64[0];
    }
  }
  return result;
}

long double cbrtl(long double __x)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  double v4;
  double *v5;
  double v6;

  v1 = (*(_QWORD *)&__x >> 52) & 0x7FFLL;
  if ((_DWORD)v1 != 2047)
  {
    v2 = *(_QWORD *)&__x & 0x8000000000000000;
    v3 = *(_QWORD *)&__x & 0xFFFFFFFFFFFFFLL;
    if ((_DWORD)v1)
    {
      *(_QWORD *)&v4 = v2 | ((unint64_t)(((699051 * v1) >> 21) + 682) << 52);
      v5 = (double *)((char *)&unk_1DEE7E7E0
                    + 32 * ((v3 >> 45) & 0xFFFFFE7F | ((((2796203 * v1) >> 21) & 3) << 7)));
      v6 = (COERCE_DOUBLE(v3 | ((unint64_t)((((2796203 * v1) >> 21) & 3) + 1023) << 52)) - *v5)
         * v5[1];
      return (v5[2]
            + v5[2]
            * v6
            * (v6 * (v6 * (v6 * (v6 * 0.0295939822 + -0.0411470774) + 0.0617283764) + -0.111111111) + 0.333333333))
           * v4;
    }
    else if (v3)
    {
      return cbrtl(COERCE_DOUBLE(v3 | 0x4000000000000000) + -2.0) * COERCE_DOUBLE(v2 | 0x2AA0000000000000);
    }
  }
  return __x;
}

long double expm1l(long double __x)
{
  unint64_t v1;
  uint64_t v2;
  long double v3;
  long double v4;
  double *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;

  v1 = *(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFLL;
  if ((*(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFuLL) >= 0x40862E42FEFA39F0 || *(_QWORD *)&__x >= 0xC0430FC100000000)
  {
    if (__x >= 0.0)
      return __x * 1.79769313e308;
    else
      return -1.0 + 2.22507386e-308;
  }
  else if (v1 < 0x3FA0000000000000)
  {
    if (v1 >= 0x3CA0000000000000)
      return __x
           + __x
           * __x
           * (__x
            * (__x * (__x * (loc_1DEE513D0 + __x * (__x * 0.000198418483 + 0.00138893128)) + 0.0416666666) + 0.166666667)
            + 0.5);
  }
  else
  {
    v2 = vcvtmd_s64_f64(__x * 184.664965);
    v3 = __x * 184.664965 - (double)v2;
    v4 = -(__x * 184.664965 - __x * 184.664965 - __x * 2.60547504e-15);
    v5 = (double *)&qword_1DEE51430[2 * (v2 & 0x7F)];
    v6 = *v5;
    v7 = (v3 + v5[1] + v4)
       * ((v3 + v5[1] + v4)
        * ((v3 + v5[1] + v4) * (v3 * (v3 * 3.88824685e-14 + 3.58302698e-11) + 0.0000000264664215) + 0.0000146622624)
        + 0.00541521235);
    v8 = v2 >> 7;
    v9 = v8 << 52;
    v10 = COERCE_DOUBLE(vqsubd_s64(COERCE__INT64(-1.0), v8 << 52));
    if (v8 < -1)
    {
      *(_QWORD *)&__x = COERCE__INT64(v6 - (v6 + v10 - v10) + v6 * v7 + v6 + v10) + v9;
    }
    else if (v8 > 52)
    {
      *(_QWORD *)&__x = COERCE__INT64(v6 + v10 + v6 * v7) + v9;
    }
    else
    {
      *(_QWORD *)&__x = COERCE__INT64(v6 + v10 + v6 * v7) + v9;
    }
  }
  return __x;
}

float __sinpif (float a1)
{
  float v1;
  unsigned int v2;
  int32x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  int8x8_t v8;
  float result;

  if ((LODWORD(a1) & 0x7FFFFFFFu) >= 0x4B800000)
  {
    if ((LODWORD(a1) & 0x7FFFFFFFu) >= 0x7F800000)
      return a1 - a1;
    return a1 * 0.0;
  }
  a1 = a1 + a1;
  v1 = vrndns_f32(a1);
  v2 = vcvtns_s32_f32(a1);
  if (a1 == v1)
  {
    if ((v2 & 1) != 0)
    {
      LODWORD(result) = (v2 << 30) ^ 0x7F800000;
      return result;
    }
    return a1 * 0.0;
  }
  *(float *)v3.i32 = a1 - v1;
  v4 = vcvtq_f64_f32((float32x2_t)vdup_lane_s32(v3, 0));
  v5 = vmulq_f64(v4, v4);
  v6.f64[1] = 0.000903631703;
  *(_QWORD *)&v6.f64[0] = *(_OWORD *)&vmulq_f64(v4, *(float64x2_t *)&qword_1DEE51F30[4]);
  v7 = vmulq_f64(vmlaq_f64(*(float64x2_t *)&qword_1DEE51F30[6], v5, vaddq_f64(v5, *(float64x2_t *)qword_1DEE51F30)), v6);
  v8 = (int8x8_t)vcvt_f32_f64(vmulq_f64(v7, vmlaq_f64(*(float64x2_t *)&qword_1DEE51F30[8], v5, vaddq_f64(v5, *(float64x2_t *)&qword_1DEE51F30[2]))));
  if ((v2 & 1) != 0)
    v8.i32[0] = v8.i32[1];
  LODWORD(v7.f64[0]) = (v2 << 30) & 0x80000000;
  LODWORD(result) = veor_s8(v8, *(int8x8_t *)&v7.f64[0]).u32[0];
  return result;
}

float __cospif (float a1)
{
  float v1;
  unsigned int v2;
  int32x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  int8x8_t v8;
  unsigned int v9;
  float result;

  if ((LODWORD(a1) & 0x7FFFFFFFu) >= 0x4B800000)
  {
    if ((LODWORD(a1) & 0x7FFFFFFFu) >= 0x7F800000)
      JUMPOUT(0x1DEE51D0CLL);
    return 1.0;
  }
  else
  {
    a1 = a1 + a1;
    v1 = vrndns_f32(a1);
    v2 = vcvtns_s32_f32(a1);
    if (a1 == v1)
    {
      if ((v2 & 1) != 0)
        return 0.0;
      else
        LODWORD(result) = (v2 << 30) | 0x3F800000;
    }
    else
    {
      *(float *)v3.i32 = a1 - v1;
      v4 = vcvtq_f64_f32((float32x2_t)vdup_lane_s32(v3, 0));
      v5 = vmulq_f64(v4, v4);
      v6.f64[1] = 0.000903631703;
      *(_QWORD *)&v6.f64[0] = *(_OWORD *)&vmulq_f64(v4, *(float64x2_t *)&qword_1DEE51F30[4]);
      v7 = vmulq_f64(vmlaq_f64(*(float64x2_t *)&qword_1DEE51F30[6], v5, vaddq_f64(v5, *(float64x2_t *)qword_1DEE51F30)), v6);
      v8 = (int8x8_t)vcvt_f32_f64(vmulq_f64(v7, vmlaq_f64(*(float64x2_t *)&qword_1DEE51F30[8], v5, vaddq_f64(v5, *(float64x2_t *)&qword_1DEE51F30[2]))));
      v9 = v2 + 1;
      if ((v9 & 1) != 0)
        v8.i32[0] = v8.i32[1];
      LODWORD(v7.f64[0]) = (v9 << 30) & 0x80000000;
      LODWORD(result) = veor_s8(v8, *(int8x8_t *)&v7.f64[0]).u32[0];
    }
  }
  return result;
}

__float2 __sincospif_stret(float a1)
{
  float v1;
  unsigned int v2;
  int32x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float32x2_t v7;
  float v8;
  float v9;
  __float2 result;

  if ((LODWORD(a1) & 0x7FFFFFFFu) >= 0x4B800000)
  {
    if ((LODWORD(a1) & 0x7FFFFFFFu) >= 0x7F800000)
    {
      a1 = a1 - a1;
      v9 = a1;
    }
    else
    {
      a1 = a1 * 0.0;
      v9 = 1.0;
    }
  }
  else
  {
    a1 = a1 + a1;
    v1 = vrndns_f32(a1);
    v2 = vcvtns_s32_f32(a1);
    if (a1 == v1)
    {
      if ((v2 & 1) != 0)
      {
        LODWORD(a1) = (v2 << 30) ^ 0x7F800000;
        v9 = 0.0;
      }
      else
      {
        a1 = a1 * 0.0;
        LODWORD(v9) = (v2 << 30) | 0x3F800000;
      }
    }
    else
    {
      *(float *)v3.i32 = a1 - v1;
      v4 = vcvtq_f64_f32((float32x2_t)vdup_lane_s32(v3, 0));
      v5 = vmulq_f64(v4, v4);
      v6.f64[1] = 0.000903631703;
      *(_QWORD *)&v6.f64[0] = *(_OWORD *)&vmulq_f64(v4, *(float64x2_t *)&qword_1DEE51F30[4]);
      v7 = vcvt_f32_f64(vmulq_f64(vmulq_f64(vmlaq_f64(*(float64x2_t *)&qword_1DEE51F30[6], v5, vaddq_f64(v5, *(float64x2_t *)qword_1DEE51F30)), v6), vmlaq_f64(*(float64x2_t *)&qword_1DEE51F30[8], v5, vaddq_f64(v5, *(float64x2_t *)&qword_1DEE51F30[2]))));
      if ((v2 & 1) != 0)
        v7 = (float32x2_t)vext_s8((int8x8_t)v7, (int8x8_t)vneg_f32(v7), 4uLL);
      *(int8x8_t *)&a1 = veor_s8((int8x8_t)v7, (int8x8_t)vdup_n_s32((v2 << 30) & 0x80000000));
      v9 = v8;
    }
  }
  result.__cosval = v9;
  result.__sinval = a1;
  return result;
}

float nextafterf(float a1, float a2)
{
  int v2;

  if (a2 <= a1)
  {
    if (a2 == a1)
      return a2;
    v2 = -1;
  }
  else
  {
    v2 = 1;
  }
  if (a1 == 0.0)
    LODWORD(a2) = LODWORD(a2) & 0x80000000 | 1;
  else
    LODWORD(a2) = (v2 ^ (SLODWORD(a1) >> 31)) - (SLODWORD(a1) >> 31) + LODWORD(a1);
  return a2;
}

uint64_t lrintl(long double __x)
{
  return (uint64_t)rint(__x);
}

uint64_t lroundf(float a1)
{
  return llroundf(a1);
}

long double fmal(long double __x, long double __y, long double __z)
{
  return __z + __x * __y;
}

float fmaf(float a1, float a2, float a3)
{
  return a3 + (float)(a1 * a2);
}

long double acoshl(long double __x)
{
  if (__x < 1.0)
    return NAN;
  if (__x < 1.25)
    return log1pl(__x + -1.0 + sqrt(__x + -1.0 + __x + -1.0 + (__x + -1.0) * (__x + -1.0)));
  if (__x >= 134217728.0)
    return logl(__x) + 0.693147181;
  return logl(__x + __x + -1.0 / (sqrt(__x * __x + -1.0) + __x));
}

float __tanpif (float a1)
{
  int8x8_t v1;
  float64x2_t v2;
  unsigned int v3;
  char v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float result;
  int8x8_t v12;

  if ((LODWORD(a1) & 0x7FFFFFFFu) >= 0x4B800000)
  {
    if ((LODWORD(a1) & 0x7FFFFFFFu) >= 0x7F800000)
      return a1 - a1;
    else
      return a1 * 0.0;
  }
  else
  {
    a1 = a1 + a1;
    v3 = vcvtns_s32_f32(a1 + a1);
    if ((float)(a1 + a1) == vrndns_f32(a1 + a1))
    {
      if ((v3 & 3) != 0)
      {
        if ((v3 & 1) != 0)
          LODWORD(result) = (v3 << 30) ^ 0x7F800000;
        else
          return COERCE_FLOAT((v3 << 29) ^ 0x7F800000) / 0.0;
      }
      else
      {
        *(float *)v12.i32 = a1 * 0.0;
        v1.i32[0] = v3 << 29;
        LODWORD(result) = veor_s8(v12, v1).u32[0];
      }
    }
    else
    {
      v4 = vcvtns_s32_f32(a1);
      v5 = (float64x2_t)vdupq_lane_s64(COERCE__INT64((float)(a1 - vrndns_f32(a1))), 0);
      *(_QWORD *)&v2.f64[0] = loc_1DEE52288;
      v6 = vmulq_f64(v5, loc_1DEE52288);
      v7 = vmulq_f64(v5, v5);
      v8 = vaddq_f64(v7, unk_1DEE52298);
      v9 = vmlaq_f64(unk_1DEE522B8, v7, vaddq_f64(v7, *(float64x2_t *)byte_1DEE522A8));
      v7.f64[1] = v6.f64[1];
      v10 = vmulq_f64(vaddq_f64(vmulq_f64(v7, v8), v2), v9);
      if ((v4 & 1) != 0)
        return -1.0 / (v10.f64[1] * v10.f64[0]);
      else
        return v10.f64[1] * v10.f64[0];
    }
  }
  return result;
}

int feclearexcept(int a1)
{
  _WriteStatusReg(ARM64_SYSREG(3, 3, 4, 4, 1), _ReadStatusReg(ARM64_SYSREG(3, 3, 4, 4, 1)) & ~(unint64_t)(a1 & 0x9F));
  return 0;
}

int fegetexceptflag(fexcept_t *a1, int a2)
{
  *a1 = a2 & _ReadStatusReg(ARM64_SYSREG(3, 3, 4, 4, 1)) & 0x9F;
  return 0;
}

int feholdexcept(fenv_t *a1)
{
  a1->__fpsr = _ReadStatusReg(ARM64_SYSREG(3, 3, 4, 4, 1));
  a1->__fpcr = _ReadStatusReg(ARM64_SYSREG(3, 3, 4, 4, 0));
  _WriteStatusReg(ARM64_SYSREG(3, 3, 4, 4, 1), a1->__fpsr & 0xFFFFFFFFFFFFFF60);
  _WriteStatusReg(ARM64_SYSREG(3, 3, 4, 4, 0), a1->__fpcr & 0xFFFFFFFFFFFF60FFLL);
  return 0;
}

int feraiseexcept(int a1)
{
  unint64_t StatusReg;

  if ((a1 & 0x80) != 0)
  {
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 4, 4, 0));
    if ((StatusReg & 0x1000000) == 0)
    {
      _WriteStatusReg(ARM64_SYSREG(3, 3, 4, 4, 0), StatusReg | 0x1000000);
      _WriteStatusReg(ARM64_SYSREG(3, 3, 4, 4, 0), _ReadStatusReg(ARM64_SYSREG(3, 3, 4, 4, 0)) & 0xFFFFFFFFFEFFFFFFLL);
    }
  }
  return 0;
}

int fesetexceptflag(const fexcept_t *a1, int a2)
{
  _WriteStatusReg(ARM64_SYSREG(3, 3, 4, 4, 1), _ReadStatusReg(ARM64_SYSREG(3, 3, 4, 4, 1)) & ~(unint64_t)(a2 & 0x9F) | a2 & 0x9F & *a1);
  return 0;
}

int fesetround(int result)
{
  if ((result & 0xFF3FFFFF) == 0)
  {
    _WriteStatusReg(ARM64_SYSREG(3, 3, 4, 4, 0), _ReadStatusReg(ARM64_SYSREG(3, 3, 4, 4, 0)) & 0xFFFFFFFFFF3FFFFFLL | result);
    return 0;
  }
  return result;
}

int fetestexcept(int a1)
{
  return a1 & _ReadStatusReg(ARM64_SYSREG(3, 3, 4, 4, 1)) & 0x9F;
}

int feupdateenv(const fenv_t *a1)
{
  char StatusReg;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 4, 4, 1));
  fesetenv(a1);
  feraiseexcept(StatusReg & 0x9F);
  return 0;
}

float expm1f(float result)
{
  int32x2_t v1;
  int32x2_t v2;
  unsigned int v3;
  unint64_t v4;
  float v5;
  float v6;
  float *v7;
  float v8;
  float v9;

  v3 = LODWORD(result) & 0x7FFFFFFF;
  if (SLODWORD(result) >= 1118925336 || LODWORD(result) >= 0xC18AA123)
  {
    if (result >= 0.0)
      return result * 3.4028e38;
    else
      return -1.0 + 1.1755e-38;
  }
  else if (v3 < 0x3E000000)
  {
    if (v3 >= 0x33800000)
      return result
           + (float)((float)(result * result)
                   * (float)((float)(result
                                   * (float)((float)(result * (float)((float)(result * 0.0083387) + 0.041694)) + 0.16667))
                           + 0.5));
  }
  else
  {
    v4 = vcvts_n_s32_f32(result * 1.4427, 5uLL);
    v5 = (float)(result * 1.4427) - vcvts_n_f32_s64(v4, 5uLL);
    v6 = -(float)((float)((float)(result * 1.4427) - (float)(result * 1.4427)) - (float)(result * 0.00000001926));
    v7 = (float *)((char *)&loc_1DEE52638 + 8 * (v4 & 0x1F));
    v8 = *v7;
    v9 = (float)((float)(v5 + (float)(v7[1] + v6))
               * (float)((float)((float)(v5 + (float)(v7[1] + v6))
                               * (float)((float)(v5 * (float)((float)(v5 * 0.0096184) + 0.055506)) + 0.24023))
                       + -0.000000002302))
       + (float)((float)(v5 + (float)(v7[1] + v6)) * 0.69315);
    v2.i32[0] = (int)v4 >> 5 << 23;
    v1.i32[0] = -1082130432 - v2.i32[0];
    if ((int)v4 >> 5 < -1)
    {
      *(float *)v1.i32 = (float)((float)(v8 - (float)((float)(v8 + *(float *)v1.i32) - *(float *)v1.i32))
                               + (float)(v8 * v9))
                       + (float)(v8 + *(float *)v1.i32);
      LODWORD(result) = vadd_s32(v1, v2).u32[0];
    }
    else
    {
      if ((int)v4 >> 5 > 23)
        *(float *)v1.i32 = v8 + (float)(*(float *)v1.i32 + (float)(v8 * v9));
      else
        *(float *)v1.i32 = (float)(v8 + *(float *)v1.i32) + (float)(v8 * v9);
      LODWORD(result) = vadd_s32(v1, v2).u32[0];
    }
  }
  return result;
}

double __sinpi(double a1)
{
  double v1;
  unint64_t v2;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  double result;

  if ((*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x4340000000000000)
  {
    if ((*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
      return a1 - a1;
    return a1 * 0.0;
  }
  a1 = a1 + a1;
  v1 = vrndnd_f64(a1);
  v2 = vcvtnd_s64_f64(a1);
  if (a1 == v1)
  {
    if ((v2 & 1) != 0)
    {
      *(_QWORD *)&result = (v2 << 62) ^ 0x7FF0000000000000;
      return result;
    }
    return a1 * 0.0;
  }
  v3 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a1 - v1), 0);
  v4 = vmulq_f64(v3, v3);
  v5 = vmlaq_f64(*(float64x2_t *)((char *)qword_1DEE52AB8 + 4), v4, vmlaq_f64(loc_1DEE52AAC, v4, vmlaq_f64(*(float64x2_t *)&dword_1DEE52A9C, v4, vmlaq_f64(*(float64x2_t *)((char *)&qword_1DEE52A60[5] + 4), v4, vmlaq_f64(*(float64x2_t *)((char *)&qword_1DEE52A60[3] + 4), v4, vmlaq_f64(*(float64x2_t *)((char *)&qword_1DEE52A60[1] + 4), v4, *(float64x2_t *)&dword_1DEE52A5C))))));
  v3.f64[0] = v4.f64[0];
  v4.f64[0] = 1.0;
  v6 = vmlaq_f64(v4, v3, v5);
  if ((v2 & 1) == 0)
    v6.f64[0] = v6.f64[1];
  return COERCE_DOUBLE(veor_s8(*(int8x8_t *)&v6.f64[0], (int8x8_t)((v2 << 62) & 0x8000000000000000)));
}

double __cospi(double a1)
{
  double v1;
  double v2;
  unint64_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  unint64_t v8;

  if ((*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x4340000000000000)
  {
    if ((*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
      JUMPOUT(0x1DEE52830);
    return 1.0;
  }
  else
  {
    v1 = a1 + a1;
    v2 = vrndnd_f64(v1);
    v3 = vcvtnd_s64_f64(v1);
    if (v1 == v2)
    {
      if ((v3 & 1) != 0)
        return 0.0;
      else
        return COERCE_DOUBLE(veor_s8((int8x8_t)(v3 << 62), COERCE_INT8X8_T(1.0)));
    }
    else
    {
      v4 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v1 - v2), 0);
      v5 = vmulq_f64(v4, v4);
      v6 = vmlaq_f64(*(float64x2_t *)((char *)qword_1DEE52AB8 + 4), v5, vmlaq_f64(loc_1DEE52AAC, v5, vmlaq_f64(*(float64x2_t *)&dword_1DEE52A9C, v5, vmlaq_f64(*(float64x2_t *)((char *)&qword_1DEE52A60[5] + 4), v5, vmlaq_f64(*(float64x2_t *)((char *)&qword_1DEE52A60[3] + 4), v5, vmlaq_f64(*(float64x2_t *)((char *)&qword_1DEE52A60[1] + 4), v5, *(float64x2_t *)&dword_1DEE52A5C))))));
      v4.f64[0] = v5.f64[0];
      v5.f64[0] = 1.0;
      v7 = vmlaq_f64(v5, v4, v6);
      v8 = v3 + 1;
      if ((v8 & 1) == 0)
        v7.f64[0] = v7.f64[1];
      return COERCE_DOUBLE(veor_s8(*(int8x8_t *)&v7.f64[0], (int8x8_t)((v8 << 62) & 0x8000000000000000)));
    }
  }
}

__double2 __sincospi_stret(double a1)
{
  double v1;
  double v2;
  unint64_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  int8x16_t v8;
  double v9;
  __double2 result;

  if ((*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x4340000000000000)
  {
    if ((*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
    {
      v9 = a1 - a1;
      *(double *)v8.i64 = v9;
    }
    else
    {
      v9 = a1 * 0.0;
      v8.i64[0] = 1.0;
    }
  }
  else
  {
    v1 = a1 + a1;
    v2 = vrndnd_f64(v1);
    v3 = vcvtnd_s64_f64(v1);
    if (v1 == v2)
    {
      if ((v3 & 1) != 0)
      {
        *(_QWORD *)&v9 = (v3 << 62) ^ 0x7FF0000000000000;
        v8.i64[0] = 0;
      }
      else
      {
        v9 = v1 * 0.0;
        v8.i64[0] = (v3 << 62) | 0x3FF0000000000000;
      }
    }
    else
    {
      v4 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v1 - v2), 0);
      v5 = vmulq_f64(v4, v4);
      v6 = vmlaq_f64(*(float64x2_t *)((char *)qword_1DEE52AB8 + 4), v5, vmlaq_f64(loc_1DEE52AAC, v5, vmlaq_f64(*(float64x2_t *)&dword_1DEE52A9C, v5, vmlaq_f64(*(float64x2_t *)((char *)&qword_1DEE52A60[5] + 4), v5, vmlaq_f64(*(float64x2_t *)((char *)&qword_1DEE52A60[3] + 4), v5, vmlaq_f64(*(float64x2_t *)((char *)&qword_1DEE52A60[1] + 4), v5, *(float64x2_t *)&dword_1DEE52A5C))))));
      v4.f64[0] = v5.f64[0];
      v5.f64[0] = 1.0;
      v7 = vmlaq_f64(v5, v4, v6);
      if ((v3 & 1) != 0)
        v7 = (float64x2_t)vextq_s8((int8x16_t)vnegq_f64(v7), (int8x16_t)v7, 8uLL);
      v8 = veorq_s8((int8x16_t)v7, (int8x16_t)vdupq_n_s64((v3 << 62) & 0x8000000000000000));
      v9 = *(double *)&v8.i64[1];
    }
  }
  result.__cosval = *(double *)v8.i64;
  result.__sinval = v9;
  return result;
}

long double log1pl(long double __x)
{
  double v1;
  double v2;
  long double v3;
  uint64_t v4;
  unint64_t v5;
  long double v6;
  double v7;
  double *v8;
  double *v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  int8x8_t v17;
  double v18;
  unsigned int v19;
  double v20;

  if (__x != INFINITY)
  {
    if (__x == -1.0)
    {
      return -1.0 / 0.0;
    }
    else if (__x < -1.0)
    {
      return INFINITY - INFINITY;
    }
    else
    {
      v1 = fabs(__x);
      if (v1 <= 0.0000000074505806)
      {
        v19 = HIDWORD(v1);
        v20 = __x;
        if (v19 >= 0x200000)
          v20 = __x * 0.5;
        return __x - __x * v20;
      }
      else
      {
        v2 = __x;
        v3 = __x + 1.0;
        v4 = (*(_QWORD *)&v3 - 0x3FE7F00000000000) >> 52;
        v5 = *(_QWORD *)&v3 & 0xFFFFFFFFFFFFFLL;
        v6 = v3 - 1.0;
        v7 = COERCE_DOUBLE(vorr_s8((int8x8_t)(*(_QWORD *)&v3 & 0xFFFFFFFFFFFFFLL), COERCE_INT8X8_T(1.0)));
        v8 = (double *)((char *)&unk_1DEE76A80 + 32 * ((v5 + 0x100000000000) >> 45));
        v10 = *v8;
        v11 = v8[1];
        v9 = v8 + 2;
        v12 = (v2 - v6) * v10;
        v13 = 1024 - (v4 + (v5 < 0x7F00000000000));
        if (v13 < 0)
          v13 = 0;
        v14 = v12 * COERCE_DOUBLE(v13 << 52);
        v15 = v14 - (1.0 - v7 * v10);
        v16 = v15
            * v15
            * (-(1.0 - v7 * v10) * 0.142860958 + -0.185195468)
            * (v15 * (1.37739687 - (1.0 - v7 * v10)) + 1.61679209)
            * (v15 * (-1.24772208 - (1.0 - v7 * v10)) + 1.66988081);
        if (v4)
        {
          return v11 + (double)v4 * 0.693147153 + v15 + *v9 + (double)v4 * 0.0000000278976681 + v16;
        }
        else
        {
          *(double *)&v17 = v10 * v7 - 1.0;
          v18 = COERCE_DOUBLE(vand_s8(v17, (int8x8_t)-134217728));
          return v18 + v11 + *(double *)&v17 - v18 - (v10 * v7 - v10 * v7) + v14 + *v9 + v16;
        }
      }
    }
  }
  return __x;
}

float log1pf(float result)
{
  float v1;
  int8x8_t v2;
  uint64_t v3;
  double v4;
  double *v5;
  unsigned int v6;
  float v7;

  if (result != INFINITY)
  {
    if (result == -1.0)
    {
      return -1.0 / 0.0;
    }
    else if (result < -1.0)
    {
      return INFINITY - INFINITY;
    }
    else
    {
      v1 = fabsf(result);
      if (v1 <= 0.000030518)
      {
        v6 = LODWORD(v1);
        v7 = result;
        if (v6 >= 0x1000000)
          v7 = result * 0.5;
        return result - (float)(result * v7);
      }
      else
      {
        *(double *)&v2 = result + 1.0;
        v3 = (*(_QWORD *)&v2 - 0x3FE7E00000000000) >> 52;
        *(_QWORD *)&v2 &= 0xFFFFFFFFFFFFFuLL;
        v4 = COERCE_DOUBLE(vorr_s8(v2, COERCE_INT8X8_T(1.0)));
        v5 = (double *)((char *)&unk_1DEE77AC0 + 16 * ((unint64_t)(*(_QWORD *)&v2 + 0x200000000000) >> 46));
        return v5[1]
             + (double)(int)v3 * 0.693147181
             + -(1.0 - v4 * *v5)
             * (-(1.0 - v4 * *v5)
              * (-(1.0 - v4 * *v5) * (-(1.0 - v4 * *v5) * -0.25 + 0.333333333) + -0.5))
             - (1.0
              - v4 * *v5);
      }
    }
  }
  return result;
}

float sinhf(float a1)
{
  float v1;
  double v2;
  double v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float result;
  int32x2_t v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v1 = fabsf(a1);
  if (v1 >= 9.6389)
  {
    if (v1 >= 89.416)
    {
      return a1 * 3.4028e38;
    }
    else
    {
      v8 = (int32x2_t)vshr_n_u32(*(uint32x2_t *)&a1, 0x1FuLL);
      v9 = 184.664965 * v1;
      v10 = round(v9);
      *(_QWORD *)&v11 = qword_1DEE755F0[(uint64_t)v10 & 0x7F] + (((uint64_t)v10 - 128) << 45);
      v12 = v11 + (0.0000146622624 * (v9 - v10) + 0.00541521731) * (v9 - v10) * v11;
      *(float *)&v12 = v12;
      LODWORD(result) = vsli_n_s32(*(int32x2_t *)&v12, v8, 0x1FuLL).u32[0];
    }
  }
  else if (v1 < 1.1875)
  {
    if (v1 < 0.0000000074506)
      return (float)(a1 + (float)(a1 * 134220000.0)) * 0.0000000074506;
    else
      return a1
           + a1
           * (a1
            * a1)
           * (a1 * a1 * (a1 * a1 * (loc_1DEE52F38 + a1 * a1 * 0.00000281908905) + 0.00833334579) + 0.166666666);
  }
  else
  {
    v2 = 184.664965 * a1;
    v3 = round(v2);
    v4.f64[0] = v2 - v3;
    v4.f64[1] = -v4.f64[0];
    *(_QWORD *)&v5.f64[0] = qword_1DEE755F0[(uint64_t)v3 & 0x7F] + ((uint64_t)v3 << 45);
    *(_QWORD *)&v5.f64[1] = qword_1DEE755F0[-(uint64_t)v3 & 0x7F] - ((uint64_t)v3 << 45);
    v6 = vmlaq_f64(v5, vmulq_f64(vmlaq_f64((float64x2_t)vdupq_lane_s64(0x3F762E4453E10DAELL, 0), (float64x2_t)vdupq_lane_s64(0x3EEEBFBDFF30D656, 0), v4), v4), v5);
    return (v6.f64[0] - v6.f64[1]) * 0.5;
  }
  return result;
}

float coshf(float a1)
{
  float v1;
  double v2;
  double v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  double v8;
  double v9;
  double v10;

  v1 = fabsf(a1);
  if (v1 >= 9.7039)
  {
    if (v1 >= 89.416)
    {
      return 3.4028e38 * v1;
    }
    else
    {
      v8 = 184.664965 * v1;
      v9 = round(v8);
      *(_QWORD *)&v10 = qword_1DEE755F0[(uint64_t)v9 & 0x7F] + (((uint64_t)v9 - 128) << 45);
      return v10 + (0.0000146622624 * (v8 - v9) + 0.00541521731) * (v8 - v9) * v10;
    }
  }
  else if (v1 < 1.4375)
  {
    if (v1 < 0.00024414)
      return (float)((float)(a1 * a1) + 2.0) * 0.5;
    else
      return a1
           * (a1 * 0.5
            + a1
            * (a1
             * a1
             * (a1 * a1 * (a1 * a1 * (a1 * a1 * 0.000000281911528 + 0.0000247956191) + 0.00138889068) + 0.0416666666)))
           + 1.0;
  }
  else
  {
    v2 = 184.664965 * a1;
    v3 = round(v2);
    v4.f64[0] = v2 - v3;
    v4.f64[1] = -v4.f64[0];
    *(_QWORD *)&v5.f64[0] = qword_1DEE755F0[(uint64_t)v3 & 0x7F] + ((uint64_t)v3 << 45);
    *(_QWORD *)&v5.f64[1] = qword_1DEE755F0[-(uint64_t)v3 & 0x7F] - ((uint64_t)v3 << 45);
    v6 = vmlaq_f64(v5, vmulq_f64(vmlaq_f64((float64x2_t)vdupq_lane_s64(0x3F762E4453E10DAELL, 0), (float64x2_t)vdupq_lane_s64(0x3EEEBFBDFF30D656, 0), v4), v4), v5);
    return (v6.f64[0] + v6.f64[1]) * 0.5;
  }
}

float tanhf(float a1)
{
  int32x2_t v1;
  float v2;
  int32x2_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float result;
  int32x2_t v10;
  float *v11;
  int32x2_t v12;
  int32x2_t v13;

  v2 = fabsf(a1);
  v3 = (int32x2_t)vshr_n_u32(*(uint32x2_t *)&a1, 0x1FuLL);
  if (v2 >= 9.0109)
  {
    if (v2 == INFINITY)
    {
      v13.i32[0] = 1.0;
      LODWORD(result) = vsli_n_s32(v13, v3, 0x1FuLL).u32[0];
    }
    else
    {
      v1.i32[0] = 838860800;
      v10.i32[0] = 1.0;
      return *(float *)vsli_n_s32(v10, v3, 0x1FuLL).i32 - *(float *)vsli_n_s32(v1, v3, 0x1FuLL).i32;
    }
  }
  else if (v2 < 0.75)
  {
    if (v2 < 0.125)
    {
      if (v2 < 0.0000000074506)
        return (float)(a1 + (float)(a1 * 134220000.0)) * 0.0000000074506;
      else
        return a1 + (float)(a1 * (float)((float)(a1 * a1) * (float)((float)((float)(a1 * a1) * 0.13216) + -0.33333)));
    }
    else
    {
      v11 = (float *)&dword_1DEE53294[5 * (vcvts_n_s32_f32(v2, 1uLL) & 1)];
      *(float *)v12.i32 = a1
                        + (float)(a1
                                * (float)((float)(a1 * a1)
                                        * (float)(v11[4]
                                                + (float)((float)(a1 * a1)
                                                        * (float)(v11[3]
                                                                + (float)((float)(a1 * a1)
                                                                        * (float)(v11[2]
                                                                                + (float)((float)(a1 * a1)
                                                                                        * (float)(v11[1]
                                                                                                + (float)((float)(a1 * a1) * *v11))))))))));
      LODWORD(result) = vsli_n_s32(v12, v3, 0x1FuLL).u32[0];
    }
  }
  else
  {
    v4 = 184.664965 * (float)-(float)(v2 + v2);
    v5 = round(v4);
    *(_QWORD *)&v6 = qword_1DEE755F0[(uint64_t)v5 & 0x7F] + ((uint64_t)v5 << 45);
    v7 = v6 + (0.0000146622624 * (v4 - v5) + 0.00541521731) * (v4 - v5) * v6;
    v8 = (1.0 - v7) / (v7 + 1.0);
    *(float *)&v8 = v8;
    LODWORD(result) = vsli_n_s32(*(int32x2_t *)&v8, v3, 0x1FuLL).u32[0];
  }
  return result;
}

float asinhf(float a1)
{
  float v1;
  int32x2_t v2;
  int v3;
  int v4;
  uint64_t v5;
  double v6;
  double *v7;
  double v8;
  double v9;
  float result;
  int32x2_t v11;
  double v12;

  v1 = fabsf(a1);
  if (v1 == INFINITY)
    return a1 + a1;
  if (v1 < 4.0)
  {
    if (v1 < 0.25)
    {
      if (v1 >= 0.0000000074506)
        return a1
             + a1
             * ((a1 * a1 * (a1 * a1 + loc_1DEE53480) + 3.20449309)
              * (a1
               * a1
               * (a1 * a1 * loc_1DEE53488 + -0.0520103019)));
      else
        return (float)(a1 + (float)(a1 * 134220000.0)) * 0.0000000074506;
    }
    else
    {
      v11 = (int32x2_t)vshr_n_u32(*(uint32x2_t *)&a1, 0x1FuLL);
      v12 = (v1
           * (v1
            * (v1 * (v1 * (v1 * (v1 * 0.000173613019 + 0.00324813666) + 0.00805162923) + 0.013336917) + 0.0105956359)
            + 0.0082834168)
           + 0.00000000892178019)
          / (v1
           * (v1
            * (v1 * (v1 * (v1 * (v1 * 0.0000307415909 + 0.00105032848) + 0.00507824408) + 0.00981077343) + 0.0147214043)
            + 0.0105945635)
           + 0.00828356899);
      *(float *)&v12 = v12;
      LODWORD(result) = vsli_n_s32(*(int32x2_t *)&v12, v11, 0x1FuLL).u32[0];
    }
  }
  else
  {
    v2 = (int32x2_t)vshr_n_u32(*(uint32x2_t *)&a1, 0x1FuLL);
    v3 = (LODWORD(v1) - 1052704768) >> 23;
    v4 = LODWORD(v1) & 0x7FFFFF;
    v5 = ((LODWORD(v1) & 0x7FFFFFu) + 0x10000) >> 17;
    v6 = 1.0 / (v1 * v1);
    v7 = (double *)((char *)&unk_1DEE77AC0 + 16 * v5);
    v8 = -(1.0 - COERCE_FLOAT(v4 | 0x3F800000) * *v7);
    v9 = v7[1]
       + (double)v3 * 0.693147181
       + v8
       + v8 * (v8 * (v8 * (v8 * -0.25 + 0.333333333) + -0.5))
       + v6 * ((v6 * -0.0313021463 + 0.0649066511) * (v6 * (v6 + 0.413168158) + 3.85168495));
    *(float *)&v9 = v9;
    LODWORD(result) = vsli_n_s32(*(int32x2_t *)&v9, v2, 0x1FuLL).u32[0];
  }
  return result;
}

float acoshf(float result)
{
  int v1;
  uint64_t v2;
  double v3;
  double v4;
  double *v5;
  double v6;

  if (result != INFINITY)
  {
    if (result < 4.0)
    {
      if (result < 1.0)
      {
        return INFINITY - INFINITY;
      }
      else if (result == 1.0)
      {
        return 0.0;
      }
      else
      {
        return sqrt((float)(result - 1.0))
             * 0.397634266
             * ((result * (result + 96.6951199) + 872.568894)
              * (result * (result + 4.54380468) + 4.401926))
             / ((result * (result + 43.5372573) + 268.174951)
              * (result * (result + 4.05093591) + 3.62568427));
      }
    }
    else
    {
      v1 = (LODWORD(result) - 1052704768) >> 23;
      v2 = ((LODWORD(result) & 0x7FFFFFu) + 0x10000) >> 17;
      v3 = COERCE_FLOAT(LODWORD(result) & 0x7FFFFF | 0x3F800000);
      v4 = 1.0 / (result * result);
      v5 = (double *)((char *)&unk_1DEE77AC0 + 16 * v2);
      v6 = -(1.0 - v3 * *v5);
      return v5[1]
           + (double)v1 * 0.693147181
           + v6
           + v6 * (v6 * (v6 * (v6 * -0.25 + 0.333333333) + -0.5))
           - v4 * ((v4 * 0.0374810702 + 0.0715021165) * (v4 * (v4 + -0.521622935) + 3.4964));
    }
  }
  return result;
}

float atanhf(float a1)
{
  float v1;
  int32x2_t v2;
  float v3;
  double *v4;
  double v5;
  double v6;
  int32x2_t v7;
  unint64_t v8;
  double *v9;
  double v10;
  double v11;
  double v12;
  float result;

  v1 = fabsf(a1);
  if (v1 == 1.0)
    return a1 / 0.0;
  if (v1 > 1.0)
    return INFINITY - INFINITY;
  if (v1 < 0.875)
  {
    if (v1 < 0.25)
    {
      if (v1 >= 0.0000000074506)
        return a1
             + a1
             * ((a1 * a1 * (a1 * a1 + -0.234364856) + 1.94607796)
              * (a1
               * a1
               * (a1 * a1 * 0.123401725 + 0.17128467)));
      else
        return (float)(a1 + (float)(a1 * 134220000.0)) * 0.0000000074506;
    }
    else
    {
      v7 = (int32x2_t)vshr_n_u32(*(uint32x2_t *)&a1, 0x1FuLL);
      v8 = vcvts_n_s32_f32(v1, 8uLL);
      v9 = (double *)&qword_1DEE53520[2 * v8];
      v10 = vcvtd_n_f64_s64(v8, 8uLL);
      v11 = (v1 - v10) * v9[1];
      v12 = *v9
          + v11
          * ((v11 * v10 + 1.0) * (v11 * v10 * (v11 * v10) + 1.0) + v11 * v11 * (v11 * v10 * loc_1DEE538F8 + 0.333333333));
      *(float *)&v12 = v12;
      LODWORD(result) = vsli_n_s32(*(int32x2_t *)&v12, v7, 0x1FuLL).u32[0];
    }
  }
  else
  {
    v2 = (int32x2_t)vshr_n_u32(*(uint32x2_t *)&a1, 0x1FuLL);
    v3 = 1.0 - v1;
    v4 = (double *)((char *)&unk_1DEE77AC0 + 16 * (((LODWORD(v3) & 0x7FFFFFu) + 0x10000) >> 17));
    v5 = -(1.0 - COERCE_FLOAT(LODWORD(v3) & 0x7FFFFF | 0x3F800000) * *v4);
    v6 = (v3 + 3.99964846) * (v3 * -0.062505472)
       + (v3 * v3 + v3 * 2.33220736) * (v3 * v3 * loc_1DEE53918)
       + (v4[1]
        + (double)((LODWORD(v3) - 1069481984) >> 23) * 0.693147181
        + v5
        + v5 * (v5 * (v5 * (v5 * -0.25 + 0.333333333) + -0.5)))
       * -0.5;
    *(float *)&v6 = v6;
    LODWORD(result) = vsli_n_s32(*(int32x2_t *)&v6, v2, 0x1FuLL).u32[0];
  }
  return result;
}

long double copysignl(long double __x, long double __y)
{
  int8x16_t v2;
  long double result;

  v2.i64[0] = 0x8000000000000000;
  *(_QWORD *)&result = vbslq_s8(v2, *(int8x16_t *)&__y, *(int8x16_t *)&__x).u64[0];
  return result;
}

float copysignf(float a1, float a2)
{
  int8x16_t v2;
  float result;

  v2.i64[0] = 0x8000000080000000;
  v2.i64[1] = 0x8000000080000000;
  LODWORD(result) = vbslq_s8(v2, *(int8x16_t *)&a2, *(int8x16_t *)&a1).u32[0];
  return result;
}

long double fabsl(long double __x)
{
  int8x16_t v1;
  long double result;

  v1.i64[0] = 0x7FFFFFFFFFFFFFFFLL;
  *(_QWORD *)&result = vandq_s8(*(int8x16_t *)&__x, v1).u64[0];
  return result;
}

float fabsf(float a1)
{
  int8x16_t v1;
  float result;

  v1.i64[0] = 0x8000000080000000;
  v1.i64[1] = 0x8000000080000000;
  LODWORD(result) = vandq_s8(*(int8x16_t *)&a1, v1).u32[0];
  return result;
}

long double fdiml(long double __x, long double __y)
{
  long double result;

  if (__x > __y)
    return __x - __y;
  *(_QWORD *)&result = veorq_s8(*(int8x16_t *)&__x, *(int8x16_t *)&__x).u64[0];
  return result;
}

float fdimf(float a1, float a2)
{
  float result;

  if (a1 > a2)
    return a1 - a2;
  LODWORD(result) = veorq_s8(*(int8x16_t *)&a1, *(int8x16_t *)&a1).u32[0];
  return result;
}

long double fmaxl(long double __x, long double __y)
{
  return fmax(__x, __y);
}

float fmaxf(float a1, float a2)
{
  return fmaxf(a1, a2);
}

long double fminl(long double __x, long double __y)
{
  return fmin(__x, __y);
}

float fminf(float a1, float a2)
{
  return fminf(a1, a2);
}

long double frexpl(long double __x, int *__e)
{
  int8x16_t v2;
  int8x16_t v3;
  uint64_t v4;
  int v5;
  int8x16_t v7;

  v4 = (*(_QWORD *)&__x >> 52) & 0x7FFLL;
  if ((unint64_t)(v4 - 1) < 0x7FE)
  {
    v2.i64[0] = 0.5;
LABEL_3:
    v3.i64[0] = 0x7FF0000000000000;
    *(_QWORD *)&__x = vbslq_s8(v3, v2, *(int8x16_t *)&__x).u64[0];
    v5 = v4 - 1022;
    goto LABEL_4;
  }
  v5 = 0;
  if ((*(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFLL) != 0 && (*(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFuLL) < 0x80000000000000)
  {
    v2.i64[0] = 0.5;
    v3.i64[0] = 0x8000000000000000;
    v3 = vbslq_s8(v3, *(int8x16_t *)&__x, v2);
    v7 = vorrq_s8(*(int8x16_t *)&__x, v2);
    __x = *(double *)v7.i64 - *(double *)v3.i64;
    v4 = ((*(_QWORD *)&__x >> 52) & 0x7FFLL) - 1021;
    goto LABEL_3;
  }
LABEL_4:
  *__e = v5;
  return __x;
}

float sqrtf(float a1)
{
  return sqrtf(a1);
}

long double sqrtl(long double __x)
{
  return sqrt(__x);
}

float logbf(float a1)
{
  int v1;

  v1 = (LODWORD(a1) >> 23);
  if ((v1 - 1) < 0xFE)
    return (float)(v1 - 127);
  if (v1 - 1 >= 254)
    return a1 * a1;
  if ((LODWORD(a1) & 0x7FFFFFFF) != 0)
    return (float)-(__clz(LODWORD(a1) & 0x7FFFFFFF) + 118);
  return -1.0 / 0.0;
}

long double logbl(long double __x)
{
  uint64_t v1;

  v1 = (*(_QWORD *)&__x >> 52) & 0x7FFLL;
  if ((unint64_t)(v1 - 1) < 0x7FE)
    return (double)(v1 - 1023);
  if (v1 - 1 >= 2046)
    return __x * __x;
  if ((*(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFLL) != 0)
    return (double)-(uint64_t)(__clz(*(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFLL) + 1011);
  return -1.0 / 0.0;
}

int ilogbf(float a1)
{
  int v1;

  v1 = (LODWORD(a1) >> 23);
  if ((v1 - 1) < 0xFE)
    return v1 - 127;
  if (v1 == 255)
  {
    if ((LODWORD(a1) & 0x7FFFFF) == 0)
      return 0x7FFFFFFF;
  }
  else if ((LODWORD(a1) & 0x7FFFFFFF) != 0)
  {
    return -(__clz(LODWORD(a1) & 0x7FFFFFFF) + 118);
  }
  return 0x80000000;
}

int ilogbl(long double __x)
{
  uint64_t v1;
  uint64_t v2;

  v1 = (*(_QWORD *)&__x >> 52) & 0x7FFLL;
  if ((unint64_t)(v1 - 1) >= 0x7FE)
  {
    if (v1 == 2047)
    {
      if ((*(_QWORD *)&__x & 0xFFFFFFFFFFFFFLL) == 0)
      {
        LODWORD(v2) = 0x7FFFFFFF;
        return v2;
      }
    }
    else if ((*(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFLL) != 0)
    {
      return -(uint64_t)(__clz(*(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFLL) + 1011);
    }
    LODWORD(v2) = 0x80000000;
    return v2;
  }
  LODWORD(v2) = v1 - 1023;
  return v2;
}

simd_float4 _simd_sin_f4(simd_float4 x)
{
  unsigned __int128 v1;
  int8x16_t v2;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  uint64_t v6;
  float64_t *v7;
  float64_t v8;
  float64_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  int64x2_t v16;
  int64x2_t v17;
  float32x4_t v18;
  float32x4_t v19;
  int8x16_t v21;
  int8x16_t v22;
  int32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;

  v1 = *(_OWORD *)&x & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL);
  if ((vminvq_u32((uint32x4_t)vcgeq_f32((float32x4_t)vdupq_n_s32(0x49742400u), (float32x4_t)(*(_OWORD *)&x & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)))) & 0x80000000) != 0)
  {
    v21.i64[0] = 0x8000000080000000;
    v21.i64[1] = 0x8000000080000000;
    v22 = vandq_s8((int8x16_t)x, v21);
    v23 = vcvtnq_s32_f32(vmulq_f32((float32x4_t)v1, (float32x4_t)vdupq_n_s32(0x3EA2F983u)));
    v24 = vcvtq_f32_s32(v23);
    v25 = (float32x4_t)veorq_s8((int8x16_t)vshlq_n_s32(v23, 0x1FuLL), (int8x16_t)vmlaq_f32(vmlaq_f32(vmlaq_f32((float32x4_t)v1, (float32x4_t)vdupq_n_s32(0xC0490FDB), v24), (float32x4_t)vdupq_n_s32(0x33BBBD2Eu), v24), (float32x4_t)vdupq_n_s32(0x27772CEDu), v24));
    v26 = vmulq_f32(v25, v25);
    return (simd_float4)veorq_s8(v22, (int8x16_t)vmlaq_f32(v25, vmlaq_f32((float32x4_t)vdupq_n_s32(0xBE2AAAA6), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3C088766u), vmlaq_f32((float32x4_t)vdupq_n_s32(0xB94FB7FF), (float32x4_t)vdupq_n_s32(0x362EDEF8u), v26), v26), v26), vmulq_f32(v26, v25)));
  }
  else
  {
    v2.i64[0] = 0xFE000000FELL;
    v2.i64[1] = 0xFE000000FELL;
    v3 = (float64x2_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)x, 0x17uLL), v2);
    *(_QWORD *)&v4.f64[0] = LODWORD(v3.f64[1]);
    *(_QWORD *)&v4.f64[1] = HIDWORD(v3.f64[1]);
    v5 = v4;
    *(_QWORD *)&v4.f64[1] = HIDWORD(v3.f64[0]);
    v6 = LODWORD(v3.f64[0]);
    v7 = (float64_t *)&qword_1DEE78F70[HIDWORD(v3.f64[0])];
    v8 = v5.f64[1];
    v9 = v5.f64[0];
    *(_QWORD *)&v3.f64[0] = qword_1DEE78F70[LODWORD(v3.f64[0])];
    v3.f64[1] = *v7;
    *(_QWORD *)&v5.f64[0] = qword_1DEE78F70[*(_QWORD *)&v5.f64[0]];
    *(_QWORD *)&v5.f64[1] = qword_1DEE78F70[*(_QWORD *)&v5.f64[1]];
    *(_QWORD *)&v10.f64[0] = qword_1DEE78F70[*(_QWORD *)&v9 + 1];
    *(_QWORD *)&v10.f64[1] = qword_1DEE78F70[*(_QWORD *)&v8 + 1];
    *(_QWORD *)&v11.f64[0] = qword_1DEE78F70[v6 + 1];
    *(_QWORD *)&v11.f64[1] = qword_1DEE78F70[*(_QWORD *)&v4.f64[1] + 1];
    v12 = vcvtq_f64_f32(*(float32x2_t *)x.f32);
    v13 = vcvt_hight_f64_f32((float32x4_t)x);
    v14 = vmlaq_f64((float64x2_t)0, v5, v13);
    v15 = vmlaq_f64((float64x2_t)0, v3, v12);
    v16 = vcvtnq_s64_f64(v15);
    v17 = vcvtnq_s64_f64(v14);
    v18 = vmulq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)veorq_s8((int8x16_t)vshlq_n_s64(v16, 0x3FuLL), (int8x16_t)vmlaq_f64(vsubq_f64(v15, vcvtq_f64_s64(v16)), v11, v12))), (float64x2_t)veorq_s8((int8x16_t)vshlq_n_s64(v17, 0x3FuLL), (int8x16_t)vmlaq_f64(vsubq_f64(v14, vcvtq_f64_s64(v17)), v10, v13))), (float32x4_t)vdupq_n_s32(0x40490FDBu));
    v19 = vmulq_f32(v18, v18);
    return (simd_float4)vmlaq_f32(v18, vmulq_f32(v19, vmlaq_f32((float32x4_t)vdupq_n_s32(0xBE2AAAA6), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3C088767u), vmlaq_f32((float32x4_t)vdupq_n_s32(0xB94FB6C5), (float32x4_t)vdupq_n_s32(0x362EC33Bu), v19), v19), v19)), v18);
  }
}

simd_float4 _simd_cos_f4(simd_float4 x)
{
  unsigned __int128 v1;
  int8x16_t v2;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  uint64_t v6;
  float64_t *v7;
  float64_t v8;
  float64_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v19;
  float64x2_t v20;
  int64x2_t v21;
  int64x2_t v22;
  float32x4_t v23;
  float32x4_t v24;
  int32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;

  v1 = *(_OWORD *)&x & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL);
  if ((vminvq_u32((uint32x4_t)vcgeq_f32((float32x4_t)vdupq_n_s32(0x49742400u), (float32x4_t)(*(_OWORD *)&x & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)))) & 0x80000000) != 0)
  {
    v26 = vcvtnq_s32_f32(vmulq_f32(vaddq_f32((float32x4_t)v1, (float32x4_t)vdupq_n_s32(0x3FC90FDBu)), (float32x4_t)vdupq_n_s32(0x3EA2F983u)));
    v27.i64[0] = 0xBF000000BF000000;
    v27.i64[1] = 0xBF000000BF000000;
    v28 = vaddq_f32(vcvtq_f32_s32(v26), v27);
    v29 = (float32x4_t)veorq_s8((int8x16_t)vshlq_n_s32(v26, 0x1FuLL), (int8x16_t)vmlaq_f32(vmlaq_f32(vmlaq_f32((float32x4_t)v1, (float32x4_t)vdupq_n_s32(0xC0490FDB), v28), (float32x4_t)vdupq_n_s32(0x33BBBD2Eu), v28), (float32x4_t)vdupq_n_s32(0x27772CEDu), v28));
    v30 = vmulq_f32(v29, v29);
    return (simd_float4)vmlaq_f32(v29, vmlaq_f32((float32x4_t)vdupq_n_s32(0xBE2AAAA6), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3C088764u), vmlaq_f32((float32x4_t)vdupq_n_s32(0xB94FB6CF), (float32x4_t)vdupq_n_s32(0x362EC335u), v30), v30), v30), vmulq_f32(v30, v29));
  }
  else
  {
    v2.i64[0] = 0xFE000000FELL;
    v2.i64[1] = 0xFE000000FELL;
    v3 = (float64x2_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)x, 0x17uLL), v2);
    *(_QWORD *)&v4.f64[0] = LODWORD(v3.f64[1]);
    *(_QWORD *)&v4.f64[1] = HIDWORD(v3.f64[1]);
    v5 = v4;
    *(_QWORD *)&v4.f64[1] = HIDWORD(v3.f64[0]);
    v6 = LODWORD(v3.f64[0]);
    v7 = (float64_t *)&qword_1DEE78F70[HIDWORD(v3.f64[0])];
    v8 = v5.f64[1];
    v9 = v5.f64[0];
    *(_QWORD *)&v3.f64[0] = qword_1DEE78F70[LODWORD(v3.f64[0])];
    v3.f64[1] = *v7;
    *(_QWORD *)&v5.f64[0] = qword_1DEE78F70[*(_QWORD *)&v5.f64[0]];
    *(_QWORD *)&v5.f64[1] = qword_1DEE78F70[*(_QWORD *)&v5.f64[1]];
    *(_QWORD *)&v10.f64[0] = qword_1DEE78F70[*(_QWORD *)&v9 + 1];
    *(_QWORD *)&v10.f64[1] = qword_1DEE78F70[*(_QWORD *)&v8 + 1];
    *(_QWORD *)&v11.f64[0] = qword_1DEE78F70[v6 + 1];
    *(_QWORD *)&v11.f64[1] = qword_1DEE78F70[*(_QWORD *)&v4.f64[1] + 1];
    v12 = vcvtq_f64_f32(*(float32x2_t *)x.f32);
    v13 = vcvt_hight_f64_f32((float32x4_t)x);
    __asm { FMOV            V6.2D, #0.5 }
    v19 = vmlaq_f64(_Q6, v5, v13);
    v20 = vmlaq_f64(_Q6, v3, v12);
    v21 = vcvtnq_s64_f64(v20);
    v22 = vcvtnq_s64_f64(v19);
    v23 = vmulq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)veorq_s8((int8x16_t)vshlq_n_s64(v21, 0x3FuLL), (int8x16_t)vmlaq_f64(vsubq_f64(v20, vcvtq_f64_s64(v21)), v11, v12))), (float64x2_t)veorq_s8((int8x16_t)vshlq_n_s64(v22, 0x3FuLL), (int8x16_t)vmlaq_f64(vsubq_f64(v19, vcvtq_f64_s64(v22)), v10, v13))), (float32x4_t)vdupq_n_s32(0x40490FDBu));
    v24 = vmulq_f32(v23, v23);
    return (simd_float4)vmlaq_f32(v23, vmulq_f32(v24, vmlaq_f32((float32x4_t)vdupq_n_s32(0xBE2AAAA6), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3C088767u), vmlaq_f32((float32x4_t)vdupq_n_s32(0xB94FB6C5), (float32x4_t)vdupq_n_s32(0x362EC33Bu), v24), v24), v24)), v23);
  }
}

simd_float4 _simd_tan_f4(simd_float4 x)
{
  int8x16_t v1;
  float64x2_t v2;
  float64x2_t v3;
  float64x2_t v4;
  uint64_t v5;
  float64_t *v6;
  float64_t v7;
  float64_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v18;
  float64x2_t v19;
  int64x2_t v20;
  int64x2_t v21;
  float32x4_t v22;
  float64x2_t v23;
  float64x2_t v24;
  int64x2_t v25;
  int64x2_t v26;
  float32x4_t v27;
  int32x4_t v28;
  int8x16_t v29;
  float32x4_t v30;
  float32x4_t v31;
  int8x16_t v32;
  int8x16_t v33;
  float32x4_t v34;
  float32x4_t v35;
  int32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  int8x16_t v42;
  int8x16_t v43;

  if ((vminvq_u32((uint32x4_t)vcgeq_f32((float32x4_t)vdupq_n_s32(0x42C80000u), (float32x4_t)(*(_OWORD *)&x & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)))) & 0x80000000) != 0)
  {
    v36 = vcvtnq_s32_f32(vmulq_f32((float32x4_t)x, (float32x4_t)vdupq_n_s32(0x3F22F983u)));
    v37 = vcvtq_f32_s32(v36);
    v38 = vmlaq_f32(vmlaq_f32(vmlaq_f32((float32x4_t)x, (float32x4_t)vdupq_n_s32(0xBFC90FDB), v37), (float32x4_t)vdupq_n_s32(0x333BBD2Eu), v37), (float32x4_t)vdupq_n_s32(0x26F72CEDu), v37);
    v39 = vmulq_f32(v38, v38);
    v40 = vmlaq_f32(v38, vmulq_f32(v39, vmlaq_f32((float32x4_t)vdupq_n_s32(0xBE2AAAA4), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3C088406u), (float32x4_t)vdupq_n_s32(0xB94CBDF7), v39), v39)), v38);
    __asm { FMOV            V4.4S, #1.0 }
    v42 = (int8x16_t)vmlaq_f32(_Q4, vmlaq_f32((float32x4_t)vdupq_n_s32(0xBEFFFFDA), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3D2A9F58u), (float32x4_t)vdupq_n_s32(0xBAB229F6), v39), v39), v39);
    v37.i64[0] = 0x100000001;
    v37.i64[1] = 0x100000001;
    v43 = (int8x16_t)vnegq_s32((int32x4_t)vandq_s8((int8x16_t)v36, (int8x16_t)v37));
    v34 = (float32x4_t)vbslq_s8(v43, v42, (int8x16_t)v40);
    v35 = (float32x4_t)vbslq_s8(v43, (int8x16_t)vnegq_f32(v40), v42);
  }
  else
  {
    v1.i64[0] = 0xFE000000FELL;
    v1.i64[1] = 0xFE000000FELL;
    v2 = (float64x2_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)x, 0x17uLL), v1);
    *(_QWORD *)&v3.f64[0] = LODWORD(v2.f64[1]);
    *(_QWORD *)&v3.f64[1] = HIDWORD(v2.f64[1]);
    v4 = v3;
    *(_QWORD *)&v3.f64[1] = HIDWORD(v2.f64[0]);
    v5 = LODWORD(v2.f64[0]);
    v6 = (float64_t *)&qword_1DEE78F70[HIDWORD(v2.f64[0])];
    v7 = v4.f64[1];
    v8 = v4.f64[0];
    *(_QWORD *)&v2.f64[0] = qword_1DEE78F70[LODWORD(v2.f64[0])];
    v2.f64[1] = *v6;
    *(_QWORD *)&v4.f64[0] = qword_1DEE78F70[*(_QWORD *)&v4.f64[0]];
    *(_QWORD *)&v4.f64[1] = qword_1DEE78F70[*(_QWORD *)&v4.f64[1]];
    *(_QWORD *)&v9.f64[0] = qword_1DEE78F70[*(_QWORD *)&v8 + 1];
    *(_QWORD *)&v9.f64[1] = qword_1DEE78F70[*(_QWORD *)&v7 + 1];
    *(_QWORD *)&v10.f64[0] = qword_1DEE78F70[v5 + 1];
    *(_QWORD *)&v10.f64[1] = qword_1DEE78F70[*(_QWORD *)&v3.f64[1] + 1];
    v11 = vcvtq_f64_f32(*(float32x2_t *)x.f32);
    v12 = vcvt_hight_f64_f32((float32x4_t)x);
    __asm { FMOV            V6.2D, #0.5 }
    v18 = vmlaq_f64(_Q6, v4, v12);
    v19 = vmlaq_f64(_Q6, v2, v11);
    v20 = vcvtnq_s64_f64(v19);
    v21 = vcvtnq_s64_f64(v18);
    v22 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)veorq_s8((int8x16_t)vshlq_n_s64(v20, 0x3FuLL), (int8x16_t)vmlaq_f64(vsubq_f64(v19, vcvtq_f64_s64(v20)), v10, v11))), (float64x2_t)veorq_s8((int8x16_t)vshlq_n_s64(v21, 0x3FuLL), (int8x16_t)vmlaq_f64(vsubq_f64(v18, vcvtq_f64_s64(v21)), v9, v12)));
    v23 = vmlaq_f64((float64x2_t)0, v4, v12);
    v24 = vmlaq_f64((float64x2_t)0, v2, v11);
    v25 = vcvtnq_s64_f64(v24);
    v26 = vcvtnq_s64_f64(v23);
    v27 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)veorq_s8((int8x16_t)vshlq_n_s64(v25, 0x3FuLL), (int8x16_t)vmlaq_f64(vsubq_f64(v24, vcvtq_f64_s64(v25)), v10, v11))), (float64x2_t)veorq_s8((int8x16_t)vshlq_n_s64(v26, 0x3FuLL), (int8x16_t)vmlaq_f64(vsubq_f64(v23, vcvtq_f64_s64(v26)), v9, v12)));
    v28 = (int32x4_t)vminnmq_f32(vabsq_f32(v27), vabsq_f32(v22));
    v29 = (int8x16_t)vceqq_s32((int32x4_t)(*(_OWORD *)&v22 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), v28);
    *(_QWORD *)&v9.f64[0] = 0x8000000080000000;
    *(_QWORD *)&v9.f64[1] = 0x8000000080000000;
    v30 = (float32x4_t)veorq_s8(vandq_s8(veorq_s8((int8x16_t)v27, (int8x16_t)v22), (int8x16_t)v9), (int8x16_t)v28);
    v31 = vmulq_f32(v30, v30);
    v32 = (int8x16_t)vmulq_f32(vmlaq_f32((float32x4_t)vdupq_n_s32(0x40490FD7u), (float32x4_t)vdupq_n_s32(0xC03E1BF0), v31), v30);
    v33 = (int8x16_t)vmlaq_f32((float32x4_t)vdupq_n_s32(0x3F7FFFFCu), vmlaq_f32((float32x4_t)vdupq_n_s32(0xC0878864), (float32x4_t)vdupq_n_s32(0x3F724E71u), v31), v31);
    v34 = (float32x4_t)vbslq_s8(v29, v33, v32);
    v35 = (float32x4_t)vbslq_s8(v29, v32, v33);
  }
  return (simd_float4)vdivq_f32(v34, v35);
}

void _simd_sincos_f4(simd_float4 x, simd_float4 *sinp, simd_float4 *cosp)
{
  unsigned __int128 v3;
  int8x16_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  uint64_t v8;
  float64_t *v9;
  float64_t v10;
  float64_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v21;
  float64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
  float32x4_t v25;
  float64x2_t v26;
  float64x2_t v27;
  int64x2_t v28;
  int64x2_t v29;
  float64x2_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  simd_float4 v38;
  float32x4_t v39;
  float32x4_t v40;
  simd_float4 v41;
  int8x16_t v42;
  int8x16_t v43;
  float32x4_t v44;
  float32x4_t v45;
  int32x4_t v46;
  int32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
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

  v3 = *(_OWORD *)&x & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL);
  if ((vminvq_u32((uint32x4_t)vcgeq_f32((float32x4_t)vdupq_n_s32(0x49742400u), (float32x4_t)(*(_OWORD *)&x & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)))) & 0x80000000) != 0)
  {
    v42.i64[0] = 0x8000000080000000;
    v42.i64[1] = 0x8000000080000000;
    v43 = vandq_s8((int8x16_t)x, v42);
    v44 = (float32x4_t)vdupq_n_s32(0x3EA2F983u);
    v45 = vmulq_f32(vaddq_f32((float32x4_t)v3, (float32x4_t)vdupq_n_s32(0x3FC90FDBu)), v44);
    v46 = vcvtnq_s32_f32(vmulq_f32((float32x4_t)v3, v44));
    v47 = vcvtnq_s32_f32(v45);
    v48 = vcvtq_f32_s32(v46);
    v49.i64[0] = 0xBF000000BF000000;
    v49.i64[1] = 0xBF000000BF000000;
    v50 = vaddq_f32(vcvtq_f32_s32(v47), v49);
    v51 = (float32x4_t)vdupq_n_s32(0x40490FDBu);
    v52 = (float32x4_t)vdupq_n_s32(0xB3BBBD2E);
    v53 = (float32x4_t)vdupq_n_s32(0xA7772CED);
    v54 = (float32x4_t)veorq_s8((int8x16_t)vshlq_n_s32(v46, 0x1FuLL), (int8x16_t)vmlsq_f32(vmlsq_f32(vmlsq_f32((float32x4_t)v3, v51, v48), v52, v48), v53, v48));
    v55 = (float32x4_t)veorq_s8((int8x16_t)vshlq_n_s32(v47, 0x1FuLL), (int8x16_t)vmlsq_f32(vmlsq_f32(vmlsq_f32((float32x4_t)v3, v51, v50), v52, v50), v53, v50));
    v56 = vmulq_f32(v54, v54);
    v57 = vmulq_f32(v55, v55);
    v58 = (float32x4_t)vdupq_n_s32(0x362EDEF8u);
    v59 = (float32x4_t)vdupq_n_s32(0xB94FB7FF);
    v60 = (float32x4_t)vdupq_n_s32(0x3C088766u);
    v61 = (float32x4_t)vdupq_n_s32(0xBE2AAAA6);
    v41 = (simd_float4)vmlaq_f32(v55, vmlaq_f32(v61, vmlaq_f32(v60, vmlaq_f32(v59, v58, v57), v57), v57), vmulq_f32(v57, v55));
    v38 = (simd_float4)veorq_s8(v43, (int8x16_t)vmlaq_f32(v54, vmlaq_f32(v61, vmlaq_f32(v60, vmlaq_f32(v59, v58, v56), v56), v56), vmulq_f32(v56, v54)));
  }
  else
  {
    v4.i64[0] = 0xFE000000FELL;
    v4.i64[1] = 0xFE000000FELL;
    v5 = (float64x2_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)x, 0x17uLL), v4);
    *(_QWORD *)&v6.f64[0] = LODWORD(v5.f64[1]);
    *(_QWORD *)&v6.f64[1] = HIDWORD(v5.f64[1]);
    v7 = v6;
    *(_QWORD *)&v6.f64[1] = HIDWORD(v5.f64[0]);
    v8 = LODWORD(v5.f64[0]);
    v9 = (float64_t *)&qword_1DEE78F70[HIDWORD(v5.f64[0])];
    v10 = v7.f64[1];
    v11 = v7.f64[0];
    *(_QWORD *)&v5.f64[0] = qword_1DEE78F70[LODWORD(v5.f64[0])];
    v5.f64[1] = *v9;
    *(_QWORD *)&v7.f64[0] = qword_1DEE78F70[*(_QWORD *)&v7.f64[0]];
    *(_QWORD *)&v7.f64[1] = qword_1DEE78F70[*(_QWORD *)&v7.f64[1]];
    *(_QWORD *)&v12.f64[0] = qword_1DEE78F70[*(_QWORD *)&v11 + 1];
    *(_QWORD *)&v12.f64[1] = qword_1DEE78F70[*(_QWORD *)&v10 + 1];
    *(_QWORD *)&v13.f64[0] = qword_1DEE78F70[v8 + 1];
    *(_QWORD *)&v13.f64[1] = qword_1DEE78F70[*(_QWORD *)&v6.f64[1] + 1];
    v14 = vcvtq_f64_f32(*(float32x2_t *)x.f32);
    v15 = vcvt_hight_f64_f32((float32x4_t)x);
    __asm { FMOV            V6.2D, #0.5 }
    v21 = vmlaq_f64(_Q6, v7, v15);
    v22 = vmlaq_f64(_Q6, v5, v14);
    v23 = vcvtnq_s64_f64(v22);
    v24 = vcvtnq_s64_f64(v21);
    v25 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)veorq_s8((int8x16_t)vshlq_n_s64(v23, 0x3FuLL), (int8x16_t)vmlaq_f64(vsubq_f64(v22, vcvtq_f64_s64(v23)), v13, v14))), (float64x2_t)veorq_s8((int8x16_t)vshlq_n_s64(v24, 0x3FuLL), (int8x16_t)vmlaq_f64(vsubq_f64(v21, vcvtq_f64_s64(v24)), v12, v15)));
    v26 = vmlaq_f64((float64x2_t)0, v7, v15);
    v27 = vmlaq_f64((float64x2_t)0, v5, v14);
    v28 = vcvtnq_s64_f64(v27);
    v29 = vcvtnq_s64_f64(v26);
    v30 = (float64x2_t)veorq_s8((int8x16_t)vshlq_n_s64(v29, 0x3FuLL), (int8x16_t)vmlaq_f64(vsubq_f64(v26, vcvtq_f64_s64(v29)), v12, v15));
    v31 = (float32x4_t)vdupq_n_s32(0x40490FDBu);
    v32 = vmulq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)veorq_s8((int8x16_t)vshlq_n_s64(v28, 0x3FuLL), (int8x16_t)vmlaq_f64(vsubq_f64(v27, vcvtq_f64_s64(v28)), v13, v14))), v30), v31);
    v33 = vmulq_f32(v32, v32);
    v34 = (float32x4_t)vdupq_n_s32(0x362EC33Bu);
    v35 = (float32x4_t)vdupq_n_s32(0xB94FB6C5);
    v36 = (float32x4_t)vdupq_n_s32(0x3C088767u);
    v37 = (float32x4_t)vdupq_n_s32(0xBE2AAAA6);
    v38 = (simd_float4)vmlaq_f32(v32, vmulq_f32(v33, vmlaq_f32(v37, vmlaq_f32(v36, vmlaq_f32(v35, v34, v33), v33), v33)), v32);
    v39 = vmulq_f32(v25, v31);
    v40 = vmulq_f32(v39, v39);
    v41 = (simd_float4)vmlaq_f32(v39, vmulq_f32(v40, vmlaq_f32(v37, vmlaq_f32(v36, vmlaq_f32(v35, v34, v40), v40), v40)), v39);
  }
  *sinp = v38;
  *cosp = v41;
}

simd_float4 _simd_cospi_f4(simd_float4 x)
{
  float32x4_t v1;
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v4;

  x.i64[0] &= 0x7FFFFFFF7FFFFFFFuLL;
  x.i32[2] &= ~0x80000000;
  x.i32[3] &= ~0x80000000;
  v1 = vrndnq_f32((float32x4_t)x);
  v2.i64[0] = 0x3F0000003F000000;
  v2.i64[1] = 0x3F0000003F000000;
  v3 = vmulq_f32((float32x4_t)veorq_s8((int8x16_t)vshlq_n_s32(vcvtq_s32_f32(vminnmq_f32(v1, (float32x4_t)vdupq_n_s32(0x4B800000u))), 0x1FuLL), (int8x16_t)vsubq_f32(v2, vabdq_f32((float32x4_t)x, v1))), (float32x4_t)vdupq_n_s32(0x40490FDBu));
  v4 = vmulq_f32(v3, v3);
  return (simd_float4)vmlaq_f32(v3, vmulq_f32(v4, vmlaq_f32((float32x4_t)vdupq_n_s32(0xBE2AAAA6), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3C088767u), vmlaq_f32((float32x4_t)vdupq_n_s32(0xB94FB6C5), (float32x4_t)vdupq_n_s32(0x362EC33Bu), v4), v4), v4)), v3);
}

simd_float4 _simd_sinpi_f4(simd_float4 x)
{
  int8x16_t v1;
  int8x16_t v2;
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;

  v1.i64[0] = 0x8000000080000000;
  v1.i64[1] = 0x8000000080000000;
  v2 = vandq_s8((int8x16_t)x, v1);
  x.i64[0] &= 0x7FFFFFFF7FFFFFFFuLL;
  x.i32[2] &= ~0x80000000;
  x.i32[3] &= ~0x80000000;
  v3 = vrndnq_f32((float32x4_t)x);
  v4 = vmulq_f32((float32x4_t)veorq_s8(veorq_s8(v2, (int8x16_t)vsubq_f32((float32x4_t)x, v3)), (int8x16_t)vshlq_n_s32(vcvtq_s32_f32(vminnmq_f32(v3, (float32x4_t)vdupq_n_s32(0x4B800000u))), 0x1FuLL)), (float32x4_t)vdupq_n_s32(0x40490FDBu));
  v5 = vmulq_f32(v4, v4);
  return (simd_float4)vmlaq_f32(v4, vmulq_f32(v5, vmlaq_f32((float32x4_t)vdupq_n_s32(0xBE2AAAA6), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3C088767u), vmlaq_f32((float32x4_t)vdupq_n_s32(0xB94FB6C5), (float32x4_t)vdupq_n_s32(0x362EC33Bu), v5), v5), v5)), v4);
}

simd_float4 _simd_tanpi_f4(simd_float4 x)
{
  float32x4_t v1;
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;

  v1 = vrndnq_f32((float32x4_t)x);
  v2 = (float32x4_t)vdupq_n_s32(0x40490FDBu);
  v3 = vmulq_f32(vsubq_f32((float32x4_t)x, v1), v2);
  v4 = (float32x4_t)vdupq_n_s32(0x362EC33Bu);
  v5 = vmulq_f32(v3, v3);
  v6 = (float32x4_t)vdupq_n_s32(0xB94FB6C5);
  v7 = (float32x4_t)vdupq_n_s32(0x3C088767u);
  v8 = (float32x4_t)vdupq_n_s32(0xBE2AAAA6);
  v9 = vabdq_f32((float32x4_t)x, v1);
  v1.i64[0] = 0x3F0000003F000000;
  v1.i64[1] = 0x3F0000003F000000;
  v10 = vmulq_f32(vsubq_f32(v1, v9), v2);
  v11 = vmulq_f32(v10, v10);
  return (simd_float4)vdivq_f32(vmlaq_f32(v3, vmulq_f32(v5, vmlaq_f32(v8, vmlaq_f32(v7, vmlaq_f32(v6, v4, v5), v5), v5)), v3), vmlaq_f32(v10, vmulq_f32(v11, vmlaq_f32(v8, vmlaq_f32(v7, vmlaq_f32(v6, v4, v11), v11), v11)), v10));
}

void _simd_sincospi_f4(simd_float4 x, simd_float4 *sinp, simd_float4 *cosp)
{
  int8x16_t v3;
  int8x16_t v4;
  float32x4_t v5;
  int8x16_t v6;
  float32x4_t v7;
  int8x16_t v8;
  int8x16_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;

  v3.i64[0] = 0x8000000080000000;
  v3.i64[1] = 0x8000000080000000;
  v4 = vandq_s8((int8x16_t)x, v3);
  x.i64[0] &= 0x7FFFFFFF7FFFFFFFuLL;
  x.i32[2] &= ~0x80000000;
  x.i32[3] &= ~0x80000000;
  v5 = vrndnq_f32((float32x4_t)x);
  v6 = (int8x16_t)vsubq_f32((float32x4_t)x, v5);
  v7.i64[0] = 0x3F0000003F000000;
  v7.i64[1] = 0x3F0000003F000000;
  v8 = (int8x16_t)vsubq_f32(v7, vabdq_f32((float32x4_t)x, v5));
  v9 = (int8x16_t)vshlq_n_s32(vcvtq_s32_f32(vminnmq_f32(v5, (float32x4_t)vdupq_n_s32(0x4B800000u))), 0x1FuLL);
  v10 = (float32x4_t)veorq_s8(veorq_s8(v4, v6), v9);
  v11 = (float32x4_t)veorq_s8(v9, v8);
  v12 = (float32x4_t)vdupq_n_s32(0x40490FDBu);
  v13 = vmulq_f32(v10, v12);
  v14 = (float32x4_t)vdupq_n_s32(0x362EC33Bu);
  v15 = (float32x4_t)vdupq_n_s32(0xB94FB6C5);
  v16 = vmulq_f32(v13, v13);
  v17 = (float32x4_t)vdupq_n_s32(0x3C088767u);
  v18 = (float32x4_t)vdupq_n_s32(0xBE2AAAA6);
  *(float32x4_t *)sinp = vmlaq_f32(v13, vmulq_f32(v16, vmlaq_f32(v18, vmlaq_f32(v17, vmlaq_f32(v15, v14, v16), v16), v16)), v13);
  v19 = vmulq_f32(v11, v12);
  v20 = vmulq_f32(v19, v19);
  *(float32x4_t *)cosp = vmlaq_f32(v19, vmulq_f32(v20, vmlaq_f32(v18, vmlaq_f32(v17, vmlaq_f32(v15, v14, v20), v20), v20)), v19);
}

float cargf(__complex_float a1)
{
  return atan2f(a1.c[1], a1.c[0]);
}

__complex_double casinl(__complex_double a1)
{
  double v1;
  __complex_double v2;
  double v3;
  double v4;
  __complex_double v5;
  __complex_double result;

  v1 = a1.c[0];
  v5.c[0] = -a1.c[1];
  v5.c[1] = v1;
  v2 = casinhl(v5);
  v3 = -v2.c[0];
  v4 = v2.c[1];
  result.c[1] = v3;
  result.c[0] = v4;
  return result;
}

__complex_float casinf(__complex_float a1)
{
  float v1;
  __complex_float v2;
  float v3;
  float v4;
  __complex_float v5;
  __complex_float result;

  v1 = a1.c[0];
  v5.c[0] = -a1.c[1];
  v5.c[1] = v1;
  v2 = casinhf(v5);
  v3 = -v2.c[0];
  v4 = v2.c[1];
  result.c[1] = v3;
  result.c[0] = v4;
  return result;
}

__complex_double casinhl(__complex_double a1)
{
  int8x16_t v1;
  int8x16_t v2;
  int8x16_t v3;
  long double v5;
  double v7;
  double v8;
  double v9;
  double v10;
  __complex_double v11;
  double v12;
  double v13;
  double v14;
  __complex_double v15;
  long double v16;
  float64x2_t v17;
  int8x16_t v18;
  double v19;
  double v20;
  __complex_double v21;
  long double __y;
  int8x16_t v23;
  int8x16_t v24;
  int8x16_t v25;
  int8x16_t v26;
  __complex_double v27;
  __complex_double result;

  v1.i64[0] = *(_QWORD *)&a1.c[1];
  v2.i64[0] = *(_QWORD *)&a1.c[0];
  a1.c[1] = fabs(a1.c[0]);
  *(double *)v3.i64 = fabs(*(double *)v1.i64);
  if (a1.c[1] == INFINITY || *(double *)v3.i64 == INFINITY)
  {
    v23 = v2;
    v25 = v1;
    v5 = atan2l(*(long double *)v3.i64, a1.c[1]);
    v2 = v23;
    v1 = v25;
    *(long double *)v3.i64 = v5;
    a1.c[1] = INFINITY;
  }
  else if (a1.c[1] >= 0.0000000074505806 || *(double *)v3.i64 >= 0.0000000074505806)
  {
    v24 = v2;
    v26 = v1;
    if (a1.c[1] > 134217728.0 || *(double *)v3.i64 > 134217728.0)
    {
      v27.c[0] = a1.c[1];
      *(_QWORD *)&v27.c[1] = v3.i64[0];
      v11 = clogl(v27);
      v2 = v24;
      v1 = v26;
      v3.i64[0] = *(_QWORD *)&v11.c[1];
      a1.c[1] = v11.c[0] + 0.693147181;
    }
    else
    {
      v7 = 1.0 - *(double *)v3.i64;
      v8 = a1.c[0] * a1.c[0];
      if (a1.c[1] < 1.23259516e-32)
        v8 = 0.0;
      if (v7 == 0.0)
      {
        v9 = sqrt(a1.c[1]) * 0.707106781;
        v10 = v9;
      }
      else
      {
        v12 = sqrt((fabs(v7) + sqrt(v8 + v7 * v7)) * 0.5);
        if (v7 >= 0.0)
          v9 = v12;
        else
          v9 = a1.c[1] / v12 * 0.5;
        if (v7 >= 0.0)
          v10 = a1.c[1] / v12 * 0.5;
        else
          v10 = v12;
      }
      v13 = sqrt((*(double *)v3.i64 + 1.0 + sqrt(v8 + (*(double *)v3.i64 + 1.0) * (*(double *)v3.i64 + 1.0))) * 0.5);
      v14 = a1.c[1] / (v13 + v13);
      __y = *(double *)v3.i64;
      v15.c[0] = asinhl(v13 * v10 + v9 * v14);
      v21 = v15;
      v16 = atan2l(__y, v14 * v10 + v9 * v13);
      *(__complex_double *)((char *)&a1 + 8) = v21;
      *(long double *)v3.i64 = v16;
      v2 = v24;
      v1 = v26;
    }
  }
  v17.f64[0] = NAN;
  v17.f64[1] = NAN;
  v18 = (int8x16_t)vnegq_f64(v17);
  *(_QWORD *)&v19 = vbslq_s8(v18, *(int8x16_t *)((char *)&a1 + 8), v2).u64[0];
  *(_QWORD *)&v20 = vbslq_s8(v18, v3, v1).u64[0];
  result.c[1] = v20;
  result.c[0] = v19;
  return result;
}

__complex_float casinhf(__complex_float a1)
{
  int8x16_t v1;
  int8x16_t v2;
  int8x16_t v3;
  float v5;
  float v7;
  float v8;
  float v9;
  float v10;
  __complex_float v11;
  float v12;
  float v13;
  float v14;
  uint64_t v15;
  float v16;
  int8x16_t v17;
  float v18;
  float v19;
  __int128 v20;
  float v21;
  int8x16_t v22;
  int8x16_t v23;
  int8x16_t v24;
  int8x16_t v25;
  __complex_float v26;
  __complex_float result;

  v1.i32[0] = LODWORD(a1.c[1]);
  v2.i32[0] = LODWORD(a1.c[0]);
  a1.c[1] = fabsf(a1.c[0]);
  *(float *)v3.i32 = fabsf(*(float *)v1.i32);
  if (a1.c[1] == INFINITY || *(float *)v3.i32 == INFINITY)
  {
    v22 = v2;
    v24 = v1;
    v5 = atan2f(*(float *)v3.i32, a1.c[1]);
    v2 = v22;
    v1 = v24;
    *(float *)v3.i32 = v5;
    a1.c[1] = INFINITY;
  }
  else if (a1.c[1] >= 0.00012207 || *(float *)v3.i32 >= 0.00012207)
  {
    v23 = v2;
    v25 = v1;
    if (a1.c[1] > 8192.0 || *(float *)v3.i32 > 8192.0)
    {
      v26.c[0] = a1.c[1];
      LODWORD(v26.c[1]) = v3.i32[0];
      v11 = clogf(v26);
      v2 = v23;
      v1 = v25;
      v3.i32[0] = LODWORD(v11.c[1]);
      a1.c[1] = v11.c[0] + 0.69315;
    }
    else
    {
      v7 = 1.0 - *(float *)v3.i32;
      v8 = a1.c[0] * a1.c[0];
      if (a1.c[1] < 2.2204e-16)
        v8 = 0.0;
      if (v7 == 0.0)
      {
        v9 = sqrtf(a1.c[1]) * 0.70711;
        v10 = v9;
      }
      else
      {
        v12 = sqrtf((float)(fabsf(v7) + sqrtf(v8 + (float)(v7 * v7))) * 0.5);
        if (v7 >= 0.0)
          v9 = v12;
        else
          v9 = (float)(a1.c[1] / v12) * 0.5;
        if (v7 >= 0.0)
          v10 = (float)(a1.c[1] / v12) * 0.5;
        else
          v10 = v12;
      }
      v13 = sqrtf((float)((float)(*(float *)v3.i32 + 1.0)+ sqrtf(v8 + (float)((float)(*(float *)v3.i32 + 1.0) * (float)(*(float *)v3.i32 + 1.0))))* 0.5);
      v14 = a1.c[1] / (float)(v13 + v13);
      v21 = *(float *)v3.i32;
      *(float *)&v15 = asinhf((float)(v13 * v10) + (float)(v9 * v14));
      *(_QWORD *)&v20 = v15;
      v16 = atan2f(v21, (float)(v14 * v10) + (float)(v9 * v13));
      *(_OWORD *)&a1.c[1] = v20;
      *(float *)v3.i32 = v16;
      v2 = v23;
      v1 = v25;
    }
  }
  v17.i64[0] = 0x8000000080000000;
  v17.i64[1] = 0x8000000080000000;
  LODWORD(v18) = vbslq_s8(v17, *(int8x16_t *)&a1.c[1], v2).u32[0];
  LODWORD(v19) = vbslq_s8(v17, v3, v1).u32[0];
  result.c[1] = v19;
  result.c[0] = v18;
  return result;
}

__complex_double catanl(__complex_double a1)
{
  double v1;
  __complex_double v2;
  double v3;
  double v4;
  __complex_double v5;
  __complex_double result;

  v1 = a1.c[0];
  v5.c[0] = -a1.c[1];
  v5.c[1] = v1;
  v2 = catanhl(v5);
  v3 = -v2.c[0];
  v4 = v2.c[1];
  result.c[1] = v3;
  result.c[0] = v4;
  return result;
}

unsigned __int16 __rintf16@<H0>(int8x16_t _Q0@<Q0>, int8x16_t a2@<Q1>)
{
  int8x16_t v6;

  if ((((unsigned __int32)_Q0.i32[0] >> 10) & 0x1F) > 0x18)
  {
    __asm { FCVT            S0, H0 }
    *(float *)_Q0.i32 = _S0 + 0.0;
    __asm { FCVT            H0, S0 }
  }
  else
  {
    __asm { FCVT            S0, H0 }
    a2.i32[0] = 1149239296;
    v6.i64[0] = 0x8000000080000000;
    v6.i64[1] = 0x8000000080000000;
    _Q1 = vbslq_s8(v6, a2, _Q0);
    _S3 = *(float *)_Q1.i32 + *(float *)_Q0.i32;
    __asm
    {
      FCVT            H3, S3
      FCVT            S3, H3
    }
    *(float *)_Q1.i32 = _S3 - *(float *)_Q1.i32;
    __asm
    {
      FCVT            H1, S1
      FCVT            S1, H1
    }
    _Q0.i32[0] = vbslq_s8(v6, _Q1, _Q0).u32[0];
    __asm { FCVT            H0, S0 }
  }
  return _Q0.i16[0];
}

__complex_float catanf(__complex_float a1)
{
  float v1;
  __complex_float v2;
  float v3;
  float v4;
  __complex_float v5;
  __complex_float result;

  v1 = a1.c[0];
  v5.c[0] = -a1.c[1];
  v5.c[1] = v1;
  v2 = catanhf(v5);
  v3 = -v2.c[0];
  v4 = v2.c[1];
  result.c[1] = v3;
  result.c[0] = v4;
  return result;
}

__complex_double catanhl(__complex_double a1)
{
  int8x16_t v1;
  int8x16_t v2;
  int8x16_t v3;
  int8x16_t v4;
  float64x2_t v5;
  int8x16_t v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  unint64_t v13;
  double v14;
  double v15;
  int8x16_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int8x16_t v24;
  double v25;
  __complex_double v26;
  __complex_double result;

  v1.i64[0] = 1.0;
  v5.f64[0] = NAN;
  v5.f64[1] = NAN;
  v6 = (int8x16_t)vnegq_f64(v5);
  v7 = *(double *)vbslq_s8(v6, v1, (int8x16_t)a1).i64;
  v8 = -v7;
  *(double *)v3.i64 = -(v7 * a1.c[1]);
  *(double *)v4.i64 = a1.c[0] * v7;
  v9 = fabs(*(double *)v3.i64);
  if (*(double *)v4.i64 <= 3.35195198e153 && v9 <= 3.35195198e153)
  {
    v24 = v3;
    v25 = v7;
    v15 = v9 + 2.98333629e-154;
    if (*(double *)v4.i64 == 1.0)
    {
      v14 = logl(sqrt(sqrt(v15 * v15 + 4.0)) / sqrt(v9));
      *(double *)v16.i64 = 3.14159265 - atanl(2.0 / v15);
      v17 = -1;
      v18 = -1;
      a1.c[1] = *(double *)vbslq_s8((int8x16_t)vnegq_f64(*(float64x2_t *)((char *)&a1 + 8)), v16, v24).i64 * 0.5;
    }
    else
    {
      v19 = 1.0 - *(double *)v4.i64;
      v20 = v15 * v15;
      v23 = *(double *)v4.i64;
      v14 = log1pl(*(double *)v4.i64 * 4.0 / (v20 + v19 * v19)) * 0.25;
      v26.c[0] = -(v20 - v19 * (v23 + 1.0));
      v26.c[1] = *(double *)v24.i64 + *(double *)v24.i64;
      a1.c[1] = cargl(v26) * 0.5;
    }
    v7 = v25;
  }
  else
  {
    a1.c[1] = 1.57079633;
    *(_QWORD *)&a1.c[1] = vbslq_s8(v6, *(int8x16_t *)((char *)&a1 + 8), v3).u64[0];
    v11 = fabs(*(double *)v4.i64);
    v12 = 1.0 / (*(double *)v4.i64 + *(double *)v3.i64 * (*(double *)v3.i64 / *(double *)v4.i64));
    v2.i64[0] = 0;
    v13 = vbslq_s8(v6, v2, v4).u64[0];
    if (v11 == INFINITY)
      v12 = *(double *)&v13;
    if (v11 >= v9)
      v14 = v12;
    else
      v14 = *(double *)v4.i64
          / *(double *)v3.i64
          / (*(double *)v3.i64 + *(double *)v4.i64 / *(double *)v3.i64 * *(double *)v4.i64);
  }
  v21 = v7 * v14;
  v22 = a1.c[1] * v8;
  result.c[1] = v22;
  result.c[0] = v21;
  return result;
}

__complex_float catanhf(__complex_float a1)
{
  int8x16_t v1;
  int8x16_t v2;
  int8x16_t v3;
  int8x16_t v4;
  int8x16_t v5;
  float v6;
  float v7;
  float v8;
  float v10;
  float v11;
  unsigned __int32 v12;
  float v13;
  float v14;
  int8x16_t v15;
  unint64_t v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  int8x16_t v22;
  float v23;
  __complex_float v24;
  __complex_float result;

  v1.i32[0] = 1.0;
  v5.i64[0] = 0x8000000080000000;
  v5.i64[1] = 0x8000000080000000;
  v6 = *(float *)vbslq_s8(v5, v1, *(int8x16_t *)a1.c).i32;
  v7 = -v6;
  *(float *)v3.i32 = -(float)(v6 * a1.c[1]);
  *(float *)v4.i32 = a1.c[0] * v6;
  v8 = fabsf(*(float *)v3.i32);
  if (*(float *)v4.i32 <= 4.6117e18 && v8 <= 4.6117e18)
  {
    v22 = v3;
    v23 = v6;
    v14 = v8 + 2.1684e-19;
    if (*(float *)v4.i32 == 1.0)
    {
      v13 = logf(sqrtf(sqrtf((float)(v14 * v14) + 4.0)) / sqrtf(v8));
      *(double *)v15.i64 = 3.14159265 - atanl((float)(2.0 / v14));
      *(float *)v15.i32 = *(double *)v15.i64;
      *(__complex_float *)((char *)&a1 + 4) = (__complex_float)0x8000000080000000;
      v16 = 0x8000000080000000;
      a1.c[1] = *(float *)vbslq_s8(*(int8x16_t *)&a1.c[1], v15, v22).i32 * 0.5;
    }
    else
    {
      v17 = 1.0 - *(float *)v4.i32;
      v18 = v14 * v14;
      v21 = *(float *)v4.i32;
      v13 = log1pf((float)(*(float *)v4.i32 * 4.0) / (float)(v18 + (float)(v17 * v17))) * 0.25;
      v24.c[0] = -(float)(v18 - (float)(v17 * (float)(v21 + 1.0)));
      v24.c[1] = *(float *)v22.i32 + *(float *)v22.i32;
      a1.c[1] = cargf(v24) * 0.5;
    }
    v6 = v23;
  }
  else
  {
    a1.c[1] = 1.5708;
    LODWORD(a1.c[1]) = vbslq_s8(v5, *(int8x16_t *)&a1.c[1], v3).u32[0];
    v10 = fabsf(*(float *)v4.i32);
    v11 = 1.0 / (float)(*(float *)v4.i32 + (float)(*(float *)v3.i32 * (float)(*(float *)v3.i32 / *(float *)v4.i32)));
    v2.i32[0] = 0;
    v12 = vbslq_s8(v5, v2, v4).u32[0];
    if (v10 == INFINITY)
      v11 = *(float *)&v12;
    if (v10 >= v8)
      v13 = v11;
    else
      v13 = (float)(*(float *)v4.i32 / *(float *)v3.i32)
          / (float)(*(float *)v3.i32 + (float)((float)(*(float *)v4.i32 / *(float *)v3.i32) * *(float *)v4.i32));
  }
  v19 = v6 * v13;
  v20 = a1.c[1] * v7;
  result.c[1] = v20;
  result.c[0] = v19;
  return result;
}

__complex_double ccosl(__complex_double a1)
{
  double v1;
  double v2;
  double v3;
  __complex_double v4;
  __complex_double v5;
  __complex_double result;

  v1 = a1.c[0];
  v5.c[0] = -a1.c[1];
  v5.c[1] = v1;
  v4 = ccoshl(v5);
  v3 = v4.c[1];
  v2 = v4.c[0];
  result.c[1] = v3;
  result.c[0] = v2;
  return result;
}

__complex_float ccosf(__complex_float a1)
{
  float v1;
  float v2;
  float v3;
  __complex_float v4;
  __complex_float v5;
  __complex_float result;

  v1 = a1.c[0];
  v5.c[0] = -a1.c[1];
  v5.c[1] = v1;
  v4 = ccoshf(v5);
  v3 = v4.c[1];
  v2 = v4.c[0];
  result.c[1] = v3;
  result.c[0] = v2;
  return result;
}

simd_double2 _simd_log_d2(simd_double2 x)
{
  return (simd_double2)vmulq_f64((float64x2_t)_simd_log2_d2(x), (float64x2_t)vdupq_n_s64(0x3FE62E42FEFA39EFuLL));
}

__int16 __fabsf16@<H0>(__n128 _Q0@<Q0>)
{
  __int16 result;

  __asm { FCVT            S0, H0 }
  _S0 = fabsf(_S0);
  __asm { FCVT            H0, S0 }
  return result;
}

double _simd_orient_vd2(simd_double2 a1, simd_double2 a2)
{
  float64x2_t v3;
  float64x2_t v4;
  double result;
  double v6;
  double v7;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  uint64_t i;
  _BYTE v18[8];
  double v19;
  double v20;
  double v21;

  v3 = (float64x2_t)vextq_s8((int8x16_t)a2, (int8x16_t)a2, 8uLL);
  v4 = vmulq_f64(v3, (float64x2_t)a1);
  result = v4.f64[0] - v4.f64[1];
  if (v4.f64[0] <= 0.0)
  {
    if (v4.f64[0] >= 0.0 || v4.f64[1] >= 0.0)
      return result;
    v6 = -v4.f64[0] - v4.f64[1];
  }
  else
  {
    if (v4.f64[1] <= 0.0)
      return result;
    v6 = v4.f64[0] + v4.f64[1];
  }
  v7 = v6 * 3.33066907e-16;
  if (result < v7 && v7 > -result)
  {
    v9 = (float64x2_t)vdupq_n_s64(0x41A0000000000000uLL);
    v10 = vmulq_f64((float64x2_t)a1, v9);
    v11 = vmulq_f64(v3, v9);
    v12 = vsubq_f64(v10, vsubq_f64(v10, (float64x2_t)a1));
    v13 = vsubq_f64((float64x2_t)a1, v12);
    v14 = vsubq_f64(v11, vsubq_f64(v11, v3));
    v15 = vsubq_f64(v3, v14);
    v16 = vmlaq_f64(vnegq_f64(vmlsq_f64(vmlsq_f64(vmlsq_f64(v4, v14, v12), v14, v13), v15, v12)), v15, v13);
    v15.f64[0] = v16.f64[0] - v16.f64[1];
    result = v16.f64[0]
           - (v16.f64[0]
            - v16.f64[1])
           - v16.f64[1]
           + v16.f64[0]
           - (v16.f64[0]
            - v16.f64[1]
            + v16.f64[0]
            - (v16.f64[0]
             - v16.f64[1]));
    v13.f64[0] = v4.f64[0] + v15.f64[0];
    v4.f64[0] = v15.f64[0]
              - (v4.f64[0]
               + v15.f64[0]
               - v4.f64[0])
              + v4.f64[0]
              - (v4.f64[0]
               + v15.f64[0]
               - (v4.f64[0]
                + v15.f64[0]
                - v4.f64[0]));
    v21 = v13.f64[0] + v4.f64[0] - v4.f64[1];
    v19 = v4.f64[0]
        - (v4.f64[0]
         - v4.f64[1])
        - v4.f64[1]
        + v4.f64[0]
        - (v4.f64[0]
         - v4.f64[1]
         + v4.f64[0]
         - (v4.f64[0]
          - v4.f64[1]));
    v20 = v4.f64[0] - v4.f64[1] - (v21 - v13.f64[0]) + v13.f64[0] - (v21 - (v21 - v13.f64[0]));
    for (i = 8; i != 32; i += 8)
      result = result + *(double *)&v18[i];
  }
  return result;
}

double _simd_orient_pd2(simd_double2 a1, simd_double2 a2, simd_double2 a3)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  double v17;
  double v18;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t i;
  float64x2_t v47;
  float64x2_t v48;
  float64x2_t v49;
  float64x2_t v50;
  float64x2_t v51;
  float64x2_t v52;
  long double v53;
  double v56;
  double v57;
  double v63;
  double v65;
  float64_t v66;
  float64_t v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  int v75;
  double v76;
  double v77;
  float64_t v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  int v85;
  float64_t v86;
  float64_t v87;
  float64_t v88;
  double v89;
  float64_t v90;
  float64_t v91;
  float64_t v92;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  float64_t v99;
  double v100;
  double v101;
  double v102;
  float64x2_t v103;
  double v104;
  float64x2_t v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110[16];
  double v111[12];
  double v112[8];
  double v113[16];

  v13 = vsubq_f64((float64x2_t)a1, (float64x2_t)a3);
  v14 = vsubq_f64((float64x2_t)a2, (float64x2_t)a3);
  v15 = vmulq_laneq_f64(v13, v14, 1);
  v16 = vmulq_laneq_f64(v14, v13, 1);
  *(_QWORD *)&v17 = *(_OWORD *)&vsubq_f64(v15, v16);
  if (v15.f64[0] <= 0.0)
  {
    if (v15.f64[0] >= 0.0 || v16.f64[0] >= 0.0)
      return v17;
    v18 = -v15.f64[0] - v16.f64[0];
  }
  else
  {
    if (v16.f64[0] <= 0.0)
      return v17;
    *(_QWORD *)&v18 = *(_OWORD *)&vaddq_f64(v15, v16);
  }
  v113[4] = v12;
  v113[5] = v11;
  v113[6] = v10;
  v113[7] = v9;
  v113[8] = v8;
  v113[9] = v7;
  v113[10] = v6;
  v113[11] = v5;
  v113[14] = v3;
  v113[15] = v4;
  if (v17 < v18 * 3.33066907e-16 && v18 * 3.33066907e-16 > -v17)
  {
    v20 = v14.f64[1];
    v21 = vmuld_lane_f64(v13.f64[0], v14, 1);
    v22 = 134217728.0 * v13.f64[0] - (134217728.0 * v13.f64[0] - v13.f64[0]);
    v23 = v13.f64[0] - v22;
    v24 = vmuld_lane_f64(134217728.0, v14, 1);
    v25 = v24 - (v24 - v14.f64[1]);
    v26 = v14.f64[1] - v25;
    v27 = -v22;
    v28 = -(v13.f64[0] - v22);
    v29 = -(v21
          - v22 * v25
          - (v13.f64[0] - v22) * v25
          - v22 * (v14.f64[1] - v25)
          - (v13.f64[0] - v22) * (v14.f64[1] - v25));
    v30 = v13.f64[1];
    v31 = vmuld_lane_f64(v14.f64[0], v13, 1);
    v32 = vmuld_lane_f64(134217728.0, v13, 1);
    v33 = v32 - (v32 - v13.f64[1]);
    v34 = v13.f64[1] - v33;
    v35 = 134217728.0 * v14.f64[0] - (134217728.0 * v14.f64[0] - v14.f64[0]);
    v36 = v14.f64[0] - v35;
    v37 = -v33;
    v38 = -(v13.f64[1] - v33);
    v39 = -(v31
          - v33 * v35
          - (v13.f64[1] - v33) * v35
          - v33 * (v14.f64[0] - v35)
          - (v13.f64[1] - v33) * (v14.f64[0] - v35));
    v40 = v29 - v39;
    v17 = v29 - (v29 - v39) - v39 + v29 - (v29 - v39 + v29 - (v29 - v39));
    v41 = v21 + v29 - v39;
    v42 = v40 - (v41 - v21) + v21 - (v41 - (v41 - v21));
    v43 = v42 - v31;
    v113[0] = v17;
    v113[1] = v42 - (v42 - v31) - v31 + v42 - (v42 - v31 + v42 - (v42 - v31));
    v44 = v41 + v42 - v31;
    v113[2] = v43 - (v44 - v41) + v41 - (v44 - (v44 - v41));
    v113[3] = v44;
    for (i = 1; i != 4; ++i)
      v17 = v17 + v113[i];
    if (v17 < v18 * 2.22044605e-16 && v18 * 2.22044605e-16 > -v17)
    {
      v47 = vsubq_f64((float64x2_t)a1, v13);
      v48 = vsubq_f64((float64x2_t)a2, v14);
      v49 = vaddq_f64(v13, v47);
      v50 = vsubq_f64(v47, (float64x2_t)a3);
      v51 = vaddq_f64(vsubq_f64(v48, (float64x2_t)a3), vsubq_f64((float64x2_t)a2, vaddq_f64(v14, v48)));
      v52 = vaddq_f64(v50, vsubq_f64((float64x2_t)a1, v49));
      if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(v52), (int32x4_t)vceqzq_f64(v51))))) & 1) != 0)
      {
        v94 = v38;
        v95 = v37;
        v96 = v28;
        v97 = v27;
        v104 = v13.f64[0];
        v105 = v51;
        v100 = v14.f64[0];
        v101 = v17;
        v103 = v52;
        v98 = v18;
        v53 = fabsl(v17);
        _D7 = v104;
        _V5.D[1] = v105.f64[1];
        v56 = v53 * 3.33066907e-16 + v98 * 1.10933565e-31;
        v57 = v20 * v103.f64[0];
        __asm { FMLA            D3, D7, V5.D[1] }
        v63 = vmuld_lane_f64(v100, v103, 1);
        v17 = _D3 - vmlad_n_f64(v63, v30, v105.f64[0]) + v101;
        if (v17 < v56 && v56 > -v17)
        {
          v102 = v105.f64[1];
          v99 = v103.f64[0] * 134217728.0 - (v103.f64[0] * 134217728.0 - v103.f64[0]);
          v65 = -(v57 - v99 * v25 - (v103.f64[0] - v99) * v25 - v99 * v26 - (v103.f64[0] - v99) * v26);
          v66 = v103.f64[1] * 134217728.0 - (v103.f64[1] * 134217728.0 - v103.f64[1]);
          v67 = v103.f64[1] - v66;
          v68 = -(v63 - v66 * v35 - v67 * v35 - v66 * v36 - v67 * v36);
          v69 = v65 - v68;
          v70 = v65 - (v65 - v68) - v68 + v65 - (v65 - v68 + v65 - (v65 - v68));
          v71 = v57 + v69;
          v72 = v69 - (v57 + v69 - v57) + v57 - (v57 + v69 - (v57 + v69 - v57));
          v73 = v72 - v63;
          v106 = v70;
          v107 = v72 - (v72 - v63) - v63 + v72 - (v72 - v63 + v72 - (v72 - v63));
          v74 = v71 + v72 - v63;
          v108 = v73 - (v74 - v71) + v71 - (v74 - (v74 - v71));
          v109 = v74;
          v75 = sub_1DEE5CCBC(4, v113, 4, &v106, v112);
          v76 = v102 * 134217728.0 - (v102 * 134217728.0 - v102);
          v77 = -(v104 * v102 + v97 * v76 + v96 * v76 + v97 * (v102 - v76) - v23 * (v102 - v76));
          v78 = v105.f64[0] * 134217728.0 - (v105.f64[0] * 134217728.0 - v105.f64[0]);
          v79 = -(v30 * v105.f64[0] + v95 * v78 + v94 * v78 + v95 * (v105.f64[0] - v78) - v34 * (v105.f64[0] - v78));
          v80 = v77 - v79;
          v81 = v77 - (v77 - v79) - v79 + v77 - (v77 - v79 + v77 - (v77 - v79));
          v82 = v104 * v105.f64[1] + v80;
          v83 = v80 - (v82 - v104 * v102) + v104 * v102 - (v82 - (v82 - v104 * v102));
          v84 = v83 - v30 * v105.f64[0];
          v106 = v81;
          v107 = v83 - v84 - v30 * v105.f64[0] + v83 - (v84 + v83 - v84);
          v108 = v84 - (v82 + v84 - v82) + v82 - (v82 + v84 - (v82 + v84 - v82));
          v109 = v82 + v84;
          v85 = sub_1DEE5CCBC(v75, v112, 4, &v106, v111);
          v86 = -(v103.f64[0] * v105.f64[1]
                - v99 * v76
                - (v103.f64[0] - v99) * v76
                - v99 * (v105.f64[1] - v76)
                - (v103.f64[0] - v99) * (v105.f64[1] - v76));
          v87 = -(v105.f64[0] * v103.f64[1]
                - v66 * v78
                - v67 * v78
                - v66 * (v105.f64[0] - v78)
                - v67 * (v105.f64[0] - v78));
          v88 = v86 - v87;
          v89 = v86 - (v86 - v87) - v87 + v86 - (v86 - v87 + v86 - (v86 - v87));
          v90 = v103.f64[0] * v105.f64[1] + v88;
          v91 = v88 - (v90 - v103.f64[0] * v102) + v103.f64[0] * v102 - (v90 - (v90 - v103.f64[0] * v102));
          v92 = v91 - v105.f64[0] * v103.f64[1];
          v106 = v89;
          v107 = v91 - v92 - v105.f64[0] * v103.f64[1] + v91 - (v92 + v91 - v92);
          v108 = v92 - (v90 + v92 - v90) + v90 - (v90 + v92 - (v90 + v92 - v90));
          v109 = v90 + v92;
          return v110[(int)sub_1DEE5CCBC(v85, v111, 4, &v106, v110) - 1];
        }
      }
    }
  }
  return v17;
}

double _simd_orient_vd3(const double *a1)
{
  float64x2_t v1;
  float64x2_t v2;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  double v12;
  double v13;
  const double *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float64_t v21;
  double v22;
  double v23;
  double v24;
  float64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  int v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  int v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  int v59;
  int v60;
  uint64_t v61;
  double *v62;
  double v63;
  float64x2_t v65;
  float64x2_t v66;
  float64_t v67;
  float64_t v68;
  double v69;
  float64x2_t v70;
  double v71;
  uint64_t v72;
  double v73[16];
  double v74[8];
  double v75[8];
  double v76[8];
  double v77[4];
  double v78[4];
  double v79[4];

  v2 = *(float64x2_t *)a1;
  v1 = *(float64x2_t *)(a1 + 2);
  v4 = *(float64x2_t *)(a1 + 4);
  v3 = *(float64x2_t *)(a1 + 6);
  v6 = *(float64x2_t *)(a1 + 8);
  v5 = *(float64x2_t *)(a1 + 10);
  v7 = (float64x2_t)vextq_s8((int8x16_t)v6, (int8x16_t)v5, 8uLL);
  v5.f64[1] = a1[8];
  v8 = vmulq_f64((float64x2_t)vextq_s8((int8x16_t)v4, (int8x16_t)v3, 8uLL), v5);
  v9 = vmulq_laneq_f64(v4, v6, 1);
  v3.f64[1] = a1[4];
  v10 = vmulq_f64(v3, v7);
  v11 = vmulq_laneq_f64(v6, v4, 1);
  v12 = vmulq_f64(v1, vsubq_f64(v9, v11)).f64[0] + vaddvq_f64(vmulq_f64(*(float64x2_t *)a1, vsubq_f64(v8, v10)));
  v13 = (vmulq_f64(vaddq_f64(vabsq_f64(v9), vabsq_f64(v11)), vabsq_f64(v1)).f64[0]
       + vaddvq_f64(vmulq_f64(vaddq_f64(vabsq_f64(v8), vabsq_f64(v10)), vabsq_f64(*(float64x2_t *)a1))))
      * 7.77156117e-16;
  if (v12 <= v13 && v13 >= -v12)
  {
    v15 = a1;
    v16 = a1[1];
    v17 = vmuld_lane_f64(v4.f64[0], v6, 1);
    v18 = 134217728.0 * v4.f64[0] - (134217728.0 * v4.f64[0] - v4.f64[0]);
    v19 = vmuld_lane_f64(134217728.0, v6, 1);
    v20 = v19 - (v19 - v6.f64[1]);
    v21 = v6.f64[1] - v20;
    v68 = v4.f64[0] - v18;
    v69 = v18;
    v22 = -(v17 - v18 * v20 - (v4.f64[0] - v18) * v20 - v18 * (v6.f64[1] - v20) - (v4.f64[0] - v18) * (v6.f64[1] - v20));
    v23 = vmuld_lane_f64(v6.f64[0], v4, 1);
    v24 = 134217728.0 * v6.f64[0] - (134217728.0 * v6.f64[0] - v6.f64[0]);
    v25 = v6.f64[0] - v24;
    v26 = vmuld_lane_f64(134217728.0, v4, 1);
    v27 = v26 - (v26 - v4.f64[1]);
    v67 = v4.f64[1] - v27;
    v28 = -(v23 - v24 * v27 - (v6.f64[0] - v24) * v27 - v24 * (v4.f64[1] - v27) - (v6.f64[0] - v24) * (v4.f64[1] - v27));
    v29 = v22 - v28;
    v30 = v22 - (v22 - v28) - v28 + v22 - (v22 - v28 + v22 - (v22 - v28));
    v31 = v17 + v29;
    v32 = v29 - (v17 + v29 - v17) + v17 - (v17 + v29 - (v17 + v29 - v17));
    v79[0] = v30;
    v79[1] = v32 - (v32 - v23) - v23 + v32 - (v32 - v23 + v32 - (v32 - v23));
    v79[2] = v32 - v23 - (v31 + v32 - v23 - v31) + v31 - (v31 + v32 - v23 - (v31 + v32 - v23 - v31));
    v79[3] = v31 + v32 - v23;
    v70 = v2;
    v65 = v6;
    v66 = v4;
    v33 = sub_1DEE5CEC4(4, v79, v76, v1.f64[0]);
    v34 = vmuld_lane_f64(v65.f64[0], v70, 1);
    v35 = vmuld_lane_f64(134217728.0, v70, 1);
    v36 = v35 - (v35 - v16);
    v37 = v16 - v36;
    v38 = -(v34 - v24 * v36 - v25 * v36 - v24 * v37 - v25 * v37);
    v39 = vmuld_lane_f64(v70.f64[0], v65, 1);
    v40 = 134217728.0 * v70.f64[0] - (134217728.0 * v70.f64[0] - v70.f64[0]);
    v41 = -(v39 - v40 * v20 - (v70.f64[0] - v40) * v20 - v40 * v21 - (v70.f64[0] - v40) * v21);
    v42 = v38 - v41;
    v43 = v38 - (v38 - v41) - v41 + v38 - (v38 - v41 + v38 - (v38 - v41));
    v44 = v34 + v42;
    v45 = v42 - (v34 + v42 - v34) + v34 - (v34 + v42 - (v34 + v42 - v34));
    v46 = v45 - v39;
    v78[0] = v43;
    v78[1] = v45 - (v45 - v39) - v39 + v45 - (v45 - v39 + v45 - (v45 - v39));
    v47 = v44 + v45 - v39;
    v78[2] = v46 - (v47 - v44) + v44 - (v47 - (v47 - v44));
    v78[3] = v47;
    v48 = sub_1DEE5CEC4(4, v78, v75, v15[6]);
    v49 = vmuld_lane_f64(v70.f64[0], v66, 1);
    v50 = -(v49 - v40 * v27 - (v70.f64[0] - v40) * v27 - v40 * v67 - (v70.f64[0] - v40) * v67);
    v51 = vmuld_lane_f64(v66.f64[0], v70, 1);
    v52 = -(v51 - v69 * v36 - v68 * v36 - v69 * v37 - v68 * v37);
    v53 = v50 - v52;
    v54 = v50 - (v50 - v52) - v52 + v50 - (v50 - v52 + v50 - (v50 - v52));
    v55 = v49 + v53;
    v56 = v53 - (v49 + v53 - v49) + v49 - (v49 + v53 - (v49 + v53 - v49));
    v57 = v56 - v51;
    v77[0] = v54;
    v77[1] = v56 - (v56 - v51) - v51 + v56 - (v56 - v51 + v56 - (v56 - v51));
    v58 = v55 + v56 - v51;
    v77[2] = v57 - (v58 - v55) + v55 - (v58 - (v58 - v55));
    v77[3] = v58;
    LODWORD(v15) = sub_1DEE5CEC4(4, v77, v74, v15[10]);
    v59 = sub_1DEE5CCBC(v33, v76, v48, v75, v73);
    v60 = sub_1DEE5CCBC(v59, v73, (int)v15, v74, &v71);
    v12 = v71;
    if (v60 >= 2)
    {
      v61 = v60 - 1;
      v62 = (double *)&v72;
      do
      {
        v63 = *v62++;
        v12 = v12 + v63;
        --v61;
      }
      while (v61);
    }
  }
  return v12;
}

double _simd_orient_pd3(const double *a1)
{
  uint64_t v1;
  float64x2_t v2;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  double v19;
  double v20;
  double v22;
  double v23;
  float64_t v24;
  double v25;
  double v26;
  float64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  float64_t v32;
  float64_t v33;
  float64_t v34;
  float64_t v35;
  double v36;
  double v37;
  int v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  int v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  int v60;
  int v61;
  int v62;
  int v63;
  uint64_t v64;
  double *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v75;
  double v76;
  double v77;
  long double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v89;
  int v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  int v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  int v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  int v146;
  int v147;
  double *v148;
  double *v149;
  int v150;
  int v151;
  int v152;
  int v153;
  int v154;
  int v155;
  int v156;
  int v157;
  int v158;
  double *v159;
  int v160;
  double *v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double v177;
  int v178;
  double v179;
  double v180;
  double v181;
  double *v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  int v198;
  double v199;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  double v205;
  double v206;
  double v207;
  double v208;
  double v209;
  double v210;
  double v211;
  int v212;
  double v213;
  double v214;
  double v215;
  int v216;
  double *v217;
  double v218;
  double v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double v224;
  double v225;
  double v226;
  double v227;
  double v228;
  int v229;
  double v230;
  double v231;
  double v232;
  double v233;
  double v234;
  double v235;
  double v236;
  double v237;
  double v238;
  double v239;
  double v240;
  double v241;
  double v242;
  double v243;
  double v244;
  double v245;
  double v246;
  int v247;
  double v248;
  double v249;
  double v250;
  double *v251;
  double v252;
  double v253;
  double v254;
  double v255;
  double v256;
  double v257;
  double v258;
  double v259;
  double v260;
  double v261;
  int v262;
  double v263;
  double v264;
  double v265;
  int v266;
  int v267;
  int v268;
  double *v269;
  int v270;
  double v272;
  double v273;
  double v274;
  double v275;
  double v276;
  double v277;
  double v278;
  double v279;
  double v280;
  double v281;
  double v282;
  double v283;
  double v284;
  double v285;
  __int128 v286;
  double v287;
  double v288;
  double v289;
  double v290;
  double v291;
  double v292;
  double v293;
  double v294;
  double v295;
  float64_t v296;
  double v297;
  double v298;
  double v299;
  double v300;
  double v301;
  double v302;
  double v303;
  double v304;
  double v305;
  double v306;
  double v307;
  double v308;
  double v309;
  double v310;
  double v311;
  double v312[16];
  double v313[12];
  double v314;
  double v315;
  double v316;
  double v317;
  double v318[8];
  double v319[8];
  double v320[8];
  double v321;
  double v322;
  double v323;
  double v324;
  double v325;
  double v326;
  double v327;
  double v328;
  double v329;
  double v330;
  double v331;
  double v332;
  double v333;
  double v334;
  double v335;
  double v336;
  double v337;
  double v338;
  double v339;
  double v340;
  double v341;
  double v342;
  double v343;
  double v344;
  double v345[192];
  double v346;
  uint64_t v347;
  double v348[16];
  double v349[8];
  double v350[8];
  double v351[8];
  double v352[4];
  double v353[4];
  double v354[4];

  v1 = MEMORY[0x1E0C86820](a1);
  v3 = *(float64x2_t *)v1;
  v2 = *(float64x2_t *)(v1 + 16);
  v5 = *(float64x2_t *)(v1 + 32);
  v4 = *(float64x2_t *)(v1 + 48);
  v7 = *(float64x2_t *)(v1 + 64);
  v6 = *(float64x2_t *)(v1 + 80);
  v9 = *(float64x2_t *)(v1 + 96);
  v8 = *(float64x2_t *)(v1 + 112);
  v10 = vsubq_f64(v4, v8);
  v11 = vsubq_f64(v5, v9);
  v12 = vsubq_f64(v7, v9);
  v13 = vsubq_f64(v6, v8);
  v14 = (float64x2_t)vextq_s8((int8x16_t)v12, (int8x16_t)v13, 8uLL);
  v13.f64[1] = v12.f64[0];
  v15 = vmulq_f64((float64x2_t)vextq_s8((int8x16_t)v11, (int8x16_t)v10, 8uLL), v13);
  v16 = vmulq_laneq_f64(v11, v12, 1);
  v10.f64[1] = v11.f64[0];
  v17 = vmulq_f64(v10, v14);
  v18 = vmulq_laneq_f64(v12, v11, 1);
  v19 = vmulq_f64(vsubq_f64(v2, v8), vsubq_f64(v16, v18)).f64[0]
      + vaddvq_f64(vmulq_f64(vsubq_f64(*(float64x2_t *)v1, v9), vsubq_f64(v15, v17)));
  v20 = vmulq_f64(vaddq_f64(vabsq_f64(v16), vabsq_f64(v18)), vabdq_f64(v2, v8)).f64[0]
      + vaddvq_f64(vmulq_f64(vaddq_f64(vabsq_f64(v15), vabsq_f64(v17)), vabdq_f64(*(float64x2_t *)v1, v9)));
  if (v19 <= v20 * 7.77156117e-16 && v20 * 7.77156117e-16 >= -v19)
  {
    v298 = v20;
    v286 = *(_OWORD *)(v1 + 32);
    v288 = *(double *)(v1 + 64);
    v22 = v7.f64[0] - v9.f64[0];
    v279 = *(double *)(v1 + 40);
    v280 = *(double *)(v1 + 72);
    v310 = v5.f64[1] - v9.f64[1];
    v311 = v5.f64[0] - v9.f64[0];
    v23 = v7.f64[1] - v9.f64[1];
    v24 = (v5.f64[0] - v9.f64[0]) * (v7.f64[1] - v9.f64[1]);
    v25 = (v5.f64[0] - v9.f64[0]) * 134217728.0 - ((v5.f64[0] - v9.f64[0]) * 134217728.0 - (v5.f64[0] - v9.f64[0]));
    v26 = (v7.f64[1] - v9.f64[1]) * 134217728.0 - ((v7.f64[1] - v9.f64[1]) * 134217728.0 - (v7.f64[1] - v9.f64[1]));
    v303 = v7.f64[1] - v9.f64[1] - v26;
    v301 = v25;
    v302 = v5.f64[0] - v9.f64[0] - v25;
    v27 = -(v24 - v25 * v26 - v302 * v26 - v25 * v303 - v302 * v303);
    v28 = (v7.f64[0] - v9.f64[0]) * (v5.f64[1] - v9.f64[1]);
    v29 = (v7.f64[0] - v9.f64[0]) * 134217728.0 - ((v7.f64[0] - v9.f64[0]) * 134217728.0 - (v7.f64[0] - v9.f64[0]));
    v30 = v7.f64[0] - v9.f64[0] - v29;
    v304 = (v5.f64[1] - v9.f64[1]) * 134217728.0 - ((v5.f64[1] - v9.f64[1]) * 134217728.0 - (v5.f64[1] - v9.f64[1]));
    v300 = v5.f64[1] - v9.f64[1] - v304;
    v31 = -(v28 - v29 * v304 - v30 * v304 - v29 * v300 - v30 * v300);
    v32 = v27 - v31;
    v33 = v27 - (v27 - v31) - v31 + v27 - (v27 - v31 + v27 - (v27 - v31));
    v34 = v24 + v32;
    v35 = v32 - (v24 + v32 - v24) + v24 - (v24 + v32 - (v24 + v32 - v24));
    v277 = v28;
    v278 = *(double *)(v1 + 8);
    v282 = *(double *)v1;
    v284 = *(double *)(v1 + 96);
    v36 = v3.f64[0] - v9.f64[0];
    v354[0] = v33;
    v354[1] = v35 - (v35 - v28) - v28 + v35 - (v35 - v28 + v35 - (v35 - v28));
    v281 = v9.f64[1];
    v37 = v3.f64[1] - v9.f64[1];
    v296 = v2.f64[0];
    v354[2] = v35 - v28 - (v34 + v35 - v28 - v34) + v34 - (v34 + v35 - v28 - (v34 + v35 - v28 - v34));
    v354[3] = v34 + v35 - v28;
    v291 = v4.f64[0];
    v293 = v6.f64[0];
    v289 = v8.f64[0];
    v308 = v6.f64[0] - v8.f64[0];
    v309 = v4.f64[0] - v8.f64[0];
    v295 = v2.f64[0] - v8.f64[0];
    v38 = sub_1DEE5CEC4(4, v354, v351, v2.f64[0] - v8.f64[0]);
    v307 = v22;
    v39 = v22 * v37;
    v40 = v37 * 134217728.0 - (v37 * 134217728.0 - v37);
    v273 = v30;
    v41 = -(v39 - v29 * v40 - v30 * v40 - v29 * (v37 - v40) - v30 * (v37 - v40));
    v305 = v23;
    v42 = v36 * 134217728.0 - (v36 * 134217728.0 - v36);
    v43 = v36 - v42;
    v272 = v26;
    v44 = -(v36 * v23 - v42 * v26 - (v36 - v42) * v26 - v42 * v303 - (v36 - v42) * v303);
    v45 = v41 - v44;
    v46 = v41 - (v41 - v44) - v44 + v41 - (v41 - v44 + v41 - (v41 - v44));
    v47 = v39 + v45;
    v48 = v45 - (v39 + v45 - v39) + v39 - (v39 + v45 - (v39 + v45 - v39));
    v49 = v48 - v36 * v23;
    v276 = v36 * v23;
    v353[0] = v46;
    v353[1] = v48 - v49 - v36 * v23 + v48 - (v49 + v48 - v49);
    v353[2] = v49 - (v47 + v49 - v47) + v47 - (v47 + v49 - (v47 + v49 - v47));
    v353[3] = v47 + v49;
    v50 = sub_1DEE5CEC4(4, v353, v350, v309);
    v306 = v36;
    v275 = v42;
    v51 = v36 * v310 - v42 * v304 - (v36 - v42) * v304 - v42 * v300;
    v52 = v37 - v40;
    v53 = -(v51 - v43 * v300);
    v274 = v40;
    v54 = -(v311 * v37 - v301 * v40 - v302 * v40 - v301 * v52 - v302 * v52);
    v55 = v53 - v54;
    v56 = v53 - (v53 - v54) - v54 + v53 - (v53 - v54 + v53 - (v53 - v54));
    v57 = v36 * v310 + v55;
    v58 = v55 - (v57 - v36 * v310) + v36 * v310 - (v57 - (v57 - v36 * v310));
    v59 = v58 - v311 * v37;
    v352[0] = v56;
    v352[1] = v58 - v59 - v311 * v37 + v58 - (v59 + v58 - v59);
    v352[2] = v59 - (v57 + v59 - v57) + v57 - (v57 + v59 - (v57 + v59 - v57));
    v352[3] = v57 + v59;
    v60 = sub_1DEE5CEC4(4, v352, v349, v308);
    v61 = sub_1DEE5CCBC(v38, v351, v50, v350, v348);
    v62 = sub_1DEE5CCBC(v61, v348, v60, v349, &v346);
    v63 = v62;
    v19 = v346;
    if (v62 < 2)
    {
      v67 = v310;
      v66 = v311;
      v68 = v36;
      v69 = v307;
      v70 = v305;
      v71 = v298;
      v72 = v296;
    }
    else
    {
      v64 = v62 - 1;
      v65 = (double *)&v347;
      v67 = v310;
      v66 = v311;
      v68 = v36;
      v69 = v307;
      v70 = v305;
      v71 = v298;
      v72 = v296;
      do
      {
        v73 = *v65++;
        v19 = v19 + v73;
        --v64;
      }
      while (v64);
    }
    if (v19 < v71 * 3.33066907e-16 && v71 * 3.33066907e-16 > -v19)
    {
      v75 = v282 - v68 - v284 + v282 - (v68 + v282 - v68);
      v76 = v278 - v37 - v281 + v278 - (v37 + v278 - v37);
      v77 = v280 - v70 - v281 + v280 - (v70 + v280 - v70);
      if (v75 != 0.0
        || *(double *)&v286 - v66 - v284 + *(double *)&v286 - (v66 + *(double *)&v286 - v66) != 0.0
        || v288 - v69 - v284 + v288 - (v69 + v288 - v69) != 0.0
        || v76 != 0.0
        || v279 - v67 - v281 + v279 - (v67 + v279 - v67) != 0.0
        || v77 != 0.0
        || v72 - v295 - v289 + v72 - (v295 + v72 - v295) != 0.0
        || v291 - v309 - v289 + v291 - (v309 + v291 - v309) != 0.0
        || v293 - v308 - v289 + v293 - (v308 + v293 - v308) != 0.0)
      {
        v294 = v293 - v308 - v289 + v293 - (v308 + v293 - v308);
        v292 = v291 - v309 - v289 + v291 - (v309 + v291 - v309);
        v299 = v72 - v295 - v289 + v72 - (v295 + v72 - v295);
        v290 = v288 - v69 - v284 + v288 - (v69 + v288 - v69);
        v297 = v279 - v67 - v281 + v279 - (v67 + v279 - v67);
        v287 = *(double *)&v286 - v66 - v284 + *(double *)&v286 - (v66 + *(double *)&v286 - v66);
        v283 = v77;
        v285 = v75;
        v78 = fabsl(v19);
        v79 = v307;
        v80 = v78 * 3.33066907e-16 + v71 * 3.20474743e-31;
        v81 = v287 * v305;
        v82 = v307 * v297;
        v83 = v37 * v290;
        v84 = v36 * v283;
        v85 = v309;
        v86 = v285 * v310;
        v87 = v311 * v76;
        v19 = -(v277 - v311 * v305) * v299
            + v295 * (v287 * v305 + v311 * v283 - (v307 * v297 + v310 * v290))
            + -(v276 - v307 * v37) * v292
            + v309 * (v37 * v290 + v307 * v76 - (v306 * v283 + v305 * v285))
            + -(v311 * v37 - v306 * v310) * v294
            + v308 * (v285 * v310 + v306 * v297 - (v311 * v76 + v37 * v287))
            + v19;
        if (v19 < v80 && v80 > -v19)
        {
          if (v285 == 0.0)
          {
            v89 = v308;
            if (v76 == 0.0)
            {
              v341 = 0.0;
              v337 = 0.0;
              v90 = 1;
              goto LABEL_37;
            }
            v341 = -(-(v76 * v311)
                   - (v76 * -134217728.0 - (v76 + v76 * -134217728.0)) * v301
                   - (-v76 - (v76 * -134217728.0 - (v76 + v76 * -134217728.0))) * v301
                   - (v76 * -134217728.0 - (v76 + v76 * -134217728.0)) * v302
                   - (-v76 - (v76 * -134217728.0 - (v76 + v76 * -134217728.0))) * v302);
            v342 = -(v76 * v311);
            v337 = -(v307 * v76
                   - (v76 * 134217728.0 - (v76 * 134217728.0 - v76)) * v29
                   - (v76 - (v76 * 134217728.0 - (v76 * 134217728.0 - v76))) * v29
                   - (v76 * 134217728.0 - (v76 * 134217728.0 - v76)) * v273
                   - (v76 - (v76 * 134217728.0 - (v76 * 134217728.0 - v76))) * v273);
            v338 = v307 * v76;
          }
          else
          {
            v91 = v285 * 134217728.0 - (v285 * 134217728.0 - v285);
            v92 = -(v86 - v91 * v304 - (v285 - v91) * v304 - v91 * v300 - (v285 - v91) * v300);
            v89 = v308;
            if (v76 != 0.0)
            {
              v93 = v76 * 134217728.0 - (v76 * 134217728.0 - v76);
              v94 = -(v87 - v93 * v301 - (v76 - v93) * v301 - v93 * v302 - (v76 - v93) * v302);
              v95 = v92 - v94;
              v96 = v92 - (v92 - v94) - v94 + v92 - (v92 - v94 + v92 - (v92 - v94));
              v97 = v86 + v95;
              v98 = v95 - (v86 + v95 - v86) + v86 - (v86 + v95 - (v86 + v95 - v86));
              v99 = v98 - v87;
              v341 = v96;
              v342 = v98 - (v98 - v87) - v87 + v98 - (v98 - v87 + v98 - (v98 - v87));
              v100 = v97 + v98 - v87;
              v101 = v99 - (v100 - v97);
              v102 = v97 - (v100 - (v100 - v97));
              v79 = v307;
              v343 = v101 + v102;
              v344 = v100;
              v103 = -(v307 * v76 - v93 * v29 - (v76 - v93) * v29 - v93 * v273 - (v76 - v93) * v273);
              v104 = -(v285 * v305 + -v91 * v272 + -(v285 - v91) * v272 + -v91 * v303 - (v285 - v91) * v303);
              v105 = v103 - v104;
              v106 = v103 - (v103 - v104) - v104 + v103 - (v103 - v104 + v103 - (v103 - v104));
              v107 = v307 * v76 + v105;
              v108 = v105 - (v107 - v307 * v76) + v307 * v76 - (v107 - (v107 - v307 * v76));
              v109 = v108 - v285 * v305;
              v337 = v106;
              v338 = v108 - v109 - v285 * v305 + v108 - (v109 + v108 - v109);
              v339 = v109 - (v107 + v109 - v107) + v107 - (v107 + v109 - (v107 + v109 - v107));
              v340 = v107 + v109;
              v90 = 4;
LABEL_37:
              if (v287 == 0.0)
              {
                if (v297 == 0.0)
                {
                  v333 = 0.0;
                  v329 = 0.0;
                  v110 = 1;
                  goto LABEL_45;
                }
                v333 = -(-(v297 * v79)
                       - (v297 * -134217728.0 - (v297 + v297 * -134217728.0)) * v29
                       - (-v297 - (v297 * -134217728.0 - (v297 + v297 * -134217728.0))) * v29
                       - (v297 * -134217728.0 - (v297 + v297 * -134217728.0)) * v273
                       - (-v297 - (v297 * -134217728.0 - (v297 + v297 * -134217728.0))) * v273);
                v334 = -(v297 * v79);
                v329 = -(v306 * v297
                       - (v297 * 134217728.0 - (v297 * 134217728.0 - v297)) * v275
                       - (v297 - (v297 * 134217728.0 - (v297 * 134217728.0 - v297))) * v275
                       - (v297 * 134217728.0 - (v297 * 134217728.0 - v297)) * v43
                       - (v297 - (v297 * 134217728.0 - (v297 * 134217728.0 - v297))) * v43);
                v330 = v306 * v297;
              }
              else
              {
                v111 = v287 * 134217728.0 - (v287 * 134217728.0 - v287);
                v112 = -(v81 - v111 * v272 - (v287 - v111) * v272 - v111 * v303 - (v287 - v111) * v303);
                if (v297 != 0.0)
                {
                  v113 = v297 * 134217728.0 - (v297 * 134217728.0 - v297);
                  v114 = -(v82 - v113 * v29 - (v297 - v113) * v29 - v113 * v273 - (v297 - v113) * v273);
                  v115 = v112 - v114;
                  v116 = v112 - (v112 - v114) - v114 + v112 - (v112 - v114 + v112 - (v112 - v114));
                  v117 = v81 + v115;
                  v118 = v115 - (v81 + v115 - v81) + v81 - (v81 + v115 - (v81 + v115 - v81));
                  v119 = v118 - v82;
                  v333 = v116;
                  v334 = v118 - (v118 - v82) - v82 + v118 - (v118 - v82 + v118 - (v118 - v82));
                  v120 = v117 + v118 - v82;
                  v335 = v119 - (v120 - v117) + v117 - (v120 - (v120 - v117));
                  v336 = v120;
                  v121 = -(v306 * v297 - v113 * v275 - (v297 - v113) * v275 - v113 * v43 - (v297 - v113) * v43);
                  v122 = -(v37 * v287 + -v111 * v274 + -(v287 - v111) * v274 + -v111 * v52 - (v287 - v111) * v52);
                  v123 = v121 - v122;
                  v124 = v121 - (v121 - v122) - v122 + v121 - (v121 - v122 + v121 - (v121 - v122));
                  v125 = v306 * v297 + v123;
                  v126 = v123 - (v125 - v306 * v297) + v306 * v297 - (v125 - (v125 - v306 * v297));
                  v127 = v126 - v37 * v287;
                  v329 = v124;
                  v330 = v126 - v127 - v37 * v287 + v126 - (v127 + v126 - v127);
                  v331 = v127 - (v125 + v127 - v125) + v125 - (v125 + v127 - (v125 + v127 - v125));
                  v332 = v125 + v127;
                  v110 = 4;
LABEL_45:
                  if (v290 == 0.0)
                  {
                    if (v283 == 0.0)
                    {
                      v325 = 0.0;
                      v321 = 0.0;
                      v128 = 1;
                      goto LABEL_53;
                    }
                    v325 = -(-(v283 * v306)
                           - (v283 * -134217728.0 - (v283 + v283 * -134217728.0)) * v275
                           - (-v283 - (v283 * -134217728.0 - (v283 + v283 * -134217728.0))) * v275
                           - (v283 * -134217728.0 - (v283 + v283 * -134217728.0)) * v43
                           - (-v283 - (v283 * -134217728.0 - (v283 + v283 * -134217728.0))) * v43);
                    v326 = -(v283 * v306);
                    v321 = -(v311 * v283
                           - (v283 * 134217728.0 - (v283 * 134217728.0 - v283)) * v301
                           - (v283 - (v283 * 134217728.0 - (v283 * 134217728.0 - v283))) * v301
                           - (v283 * 134217728.0 - (v283 * 134217728.0 - v283)) * v302
                           - (v283 - (v283 * 134217728.0 - (v283 * 134217728.0 - v283))) * v302);
                    v322 = v311 * v283;
                  }
                  else
                  {
                    v129 = v290 * 134217728.0 - (v290 * 134217728.0 - v290);
                    v130 = -(v83 - v129 * v274 - (v290 - v129) * v274 - v129 * v52 - (v290 - v129) * v52);
                    if (v283 != 0.0)
                    {
                      v131 = v283 * 134217728.0 - (v283 * 134217728.0 - v283);
                      v132 = -(v84 - v131 * v275 - (v283 - v131) * v275 - v131 * v43 - (v283 - v131) * v43);
                      v133 = v130 - v132;
                      v134 = v130 - (v130 - v132) - v132 + v130 - (v130 - v132 + v130 - (v130 - v132));
                      v135 = v83 + v133;
                      v136 = v133 - (v83 + v133 - v83) + v83 - (v83 + v133 - (v83 + v133 - v83));
                      v137 = v136 - v84;
                      v325 = v134;
                      v326 = v136 - (v136 - v84) - v84 + v136 - (v136 - v84 + v136 - (v136 - v84));
                      v138 = v135 + v136 - v84;
                      v327 = v137 - (v138 - v135) + v135 - (v138 - (v138 - v135));
                      v328 = v138;
                      v139 = -(v311 * v283 - v131 * v301 - (v283 - v131) * v301 - v131 * v302 - (v283 - v131) * v302);
                      v140 = -(v310 * v290 + -v129 * v304 + -(v290 - v129) * v304 + -v129 * v300 - (v290 - v129) * v300);
                      v141 = v139 - v140;
                      v142 = v139 - (v139 - v140) - v140 + v139 - (v139 - v140 + v139 - (v139 - v140));
                      v143 = v311 * v283 + v141;
                      v144 = v141 - (v143 - v311 * v283) + v311 * v283 - (v143 - (v143 - v311 * v283));
                      v145 = v144 - v310 * v290;
                      v321 = v142;
                      v322 = v144 - v145 - v310 * v290 + v144 - (v145 + v144 - v145);
                      v323 = v145 - (v143 + v145 - v143) + v143 - (v143 + v145 - (v143 + v145 - v143));
                      v324 = v143 + v145;
                      v128 = 4;
LABEL_53:
                      v146 = sub_1DEE5CCBC(v110, &v333, v128, &v321, v320);
                      v147 = sub_1DEE5CEC4(v146, v320, v312, v295);
                      v148 = &v346;
                      v149 = v345;
                      v150 = sub_1DEE5CCBC(v63, &v346, v147, v312, v345);
                      v151 = sub_1DEE5CCBC(v128, &v325, v90, &v337, v319);
                      v152 = sub_1DEE5CEC4(v151, v319, v312, v309);
                      v153 = sub_1DEE5CCBC(v150, v345, v152, v312, &v346);
                      v154 = sub_1DEE5CCBC(v90, &v341, v110, &v329, v318);
                      v155 = sub_1DEE5CEC4(v154, v318, v312, v89);
                      v156 = sub_1DEE5CCBC(v153, &v346, v155, v312, v345);
                      if (v299 != 0.0)
                      {
                        v157 = sub_1DEE5CEC4(4, v354, v313, v299);
                        v148 = v345;
                        v149 = &v346;
                        v156 = sub_1DEE5CCBC(v156, v345, v157, v313, &v346);
                      }
                      if (v292 == 0.0)
                      {
                        v159 = v148;
                        v148 = v149;
                      }
                      else
                      {
                        v158 = sub_1DEE5CEC4(4, v353, v313, v292);
                        v156 = sub_1DEE5CCBC(v156, v149, v158, v313, v148);
                        v159 = v149;
                      }
                      if (v294 == 0.0)
                      {
                        v161 = v159;
                        v159 = v148;
                      }
                      else
                      {
                        v160 = sub_1DEE5CEC4(4, v352, v313, v294);
                        v156 = sub_1DEE5CCBC(v156, v148, v160, v313, v159);
                        v161 = v148;
                      }
                      v162 = v299;
                      v163 = v290;
                      v164 = v297;
                      v165 = v287;
                      v166 = v285;
                      if (v285 != 0.0)
                      {
                        if (v297 == 0.0)
                        {
                          v182 = v161;
                          v183 = v283;
                        }
                        else
                        {
                          v167 = v285 * v297;
                          v168 = v285 * 134217728.0 - (v285 * 134217728.0 - v285);
                          v169 = -(v285 * v297
                                 - v168 * (v297 * 134217728.0 - (v297 * 134217728.0 - v297))
                                 - (v285 - v168) * (v297 * 134217728.0 - (v297 * 134217728.0 - v297))
                                 - v168 * (v297 - (v297 * 134217728.0 - (v297 * 134217728.0 - v297)))
                                 - (v285 - v168) * (v297 - (v297 * 134217728.0 - (v297 * 134217728.0 - v297))));
                          v170 = v89 * 134217728.0 - (v89 * 134217728.0 - v89);
                          v171 = v169 * 134217728.0 - (v169 * 134217728.0 - v169);
                          v172 = -(v89 * v169
                                 - v171 * v170
                                 - (v169 - v171) * v170
                                 - v171 * (v89 - v170)
                                 - (v169 - v171) * (v89 - v170));
                          v173 = v285 * v297 * v89;
                          v174 = v285 * v297 * 134217728.0 - (v167 * 134217728.0 - v167);
                          v175 = v285 * v297 - v174;
                          v176 = -(v173
                                 - v174 * v170
                                 - (v167 - v174) * v170
                                 - v174 * (v89 - v170)
                                 - (v167 - v174) * (v89 - v170));
                          v177 = v89 * v169
                               - (v173
                                - v174 * v170
                                - (v167 - v174) * v170
                                - v174 * (v89 - v170)
                                - (v167 - v174) * (v89 - v170));
                          v314 = v172;
                          v315 = v176 - (v177 - v89 * v169) + v89 * v169 - (v177 - (v177 - v89 * v169));
                          v316 = v177 - (v173 + v177 - v173);
                          v317 = v173 + v177;
                          v178 = sub_1DEE5CCBC(v156, v159, 4, &v314, v161);
                          v156 = v178;
                          if (v294 == 0.0)
                          {
                            v182 = v159;
                            v159 = v161;
                          }
                          else
                          {
                            v179 = v294 * 134217728.0 - (v294 * 134217728.0 - v294);
                            v180 = v167 * v294 + -v174 * v179;
                            v181 = v294 * v169 - (v180 + -v175 * v179 + -v174 * (v294 - v179) - v175 * (v294 - v179));
                            v314 = -(v294 * v169
                                   + -v171 * v179
                                   + -(v169 - v171) * v179
                                   + -v171 * (v294 - v179)
                                   - (v169 - v171) * (v294 - v179));
                            v315 = -(v180 + -v175 * v179 + -v174 * (v294 - v179) - v175 * (v294 - v179))
                                 - (v181
                                  - v294 * v169)
                                 + v294 * v169
                                 - (v181
                                  - (v181
                                   - v294 * v169));
                            v316 = v181 - (v167 * v294 + v181 - v167 * v294);
                            v317 = v167 * v294 + v181;
                            v156 = sub_1DEE5CCBC(v178, v161, 4, &v314, v159);
                            v182 = v161;
                          }
                          v162 = v299;
                          v85 = v309;
                          v163 = v290;
                          v164 = v297;
                          v76 = v278 - v37 - v281 + v278 - (v37 + v278 - v37);
                          v183 = v283;
                          v166 = v285;
                        }
                        if (v183 == 0.0)
                        {
                          v161 = v182;
                          v165 = v287;
                          goto LABEL_75;
                        }
                        v184 = -(v166 * v183);
                        v185 = v166 * -134217728.0 - (v166 + v166 * -134217728.0);
                        v186 = -(v184
                               - v185 * (v183 * 134217728.0 - (v183 * 134217728.0 - v183))
                               - (-v166 - v185) * (v183 * 134217728.0 - (v183 * 134217728.0 - v183))
                               - v185 * (v183 - (v183 * 134217728.0 - (v183 * 134217728.0 - v183)))
                               - (-v166 - v185) * (v183 - (v183 * 134217728.0 - (v183 * 134217728.0 - v183))));
                        v187 = v85 * 134217728.0 - (v85 * 134217728.0 - v85);
                        v188 = v85 - v187;
                        v189 = v85 * v186;
                        v190 = v186 * 134217728.0 - (v186 * 134217728.0 - v186);
                        v191 = -(v85 * v186
                               - v190 * v187
                               - (v186 - v190) * v187
                               - v190 * (v85 - v187)
                               - (v186 - v190) * (v85 - v187));
                        v192 = v85 * v184;
                        v193 = v184 * 134217728.0 - (v184 * 134217728.0 - v184);
                        v194 = v184 - v193;
                        v195 = -(v192 - v193 * v187 - (v184 - v193) * v187 - v193 * v188 - (v184 - v193) * v188);
                        v196 = v189 + v195;
                        v314 = v191;
                        v315 = v195 - (v189 + v195 - v189) + v189 - (v189 + v195 - (v189 + v195 - v189));
                        v197 = v192 + v189 + v195;
                        v316 = v196 - (v197 - v192);
                        v317 = v197;
                        v198 = sub_1DEE5CCBC(v156, v159, 4, &v314, v182);
                        v156 = v198;
                        if (v292 == 0.0)
                        {
                          v161 = v159;
                          v159 = v182;
                        }
                        else
                        {
                          v199 = v292 * 134217728.0 - (v292 * 134217728.0 - v292);
                          v200 = v184 * v292 + -v193 * v199;
                          v201 = v292 * v186 - (v200 + -v194 * v199 + -v193 * (v292 - v199) - v194 * (v292 - v199));
                          v314 = -(v292 * v186
                                 + -v190 * v199
                                 + -(v186 - v190) * v199
                                 + -v190 * (v292 - v199)
                                 - (v186 - v190) * (v292 - v199));
                          v315 = -(v200 + -v194 * v199 + -v193 * (v292 - v199) - v194 * (v292 - v199))
                               - (v201
                                - v292 * v186)
                               + v292 * v186
                               - (v201
                                - (v201
                                 - v292 * v186));
                          v316 = v201 - (v184 * v292 + v201 - v184 * v292);
                          v317 = v184 * v292 + v201;
                          v156 = sub_1DEE5CCBC(v198, v182, 4, &v314, v159);
                          v161 = v182;
                        }
                        v162 = v299;
                        v85 = v309;
                        v163 = v290;
                        v164 = v297;
                        v76 = v278 - v37 - v281 + v278 - (v37 + v278 - v37);
                        v165 = v287;
                      }
                      v183 = v283;
LABEL_75:
                      if (v165 != 0.0)
                      {
                        if (v183 == 0.0)
                        {
                          v217 = v161;
                        }
                        else
                        {
                          v202 = v165 * v183;
                          v203 = v165 * 134217728.0 - (v165 * 134217728.0 - v165);
                          v204 = -(v165 * v183
                                 - v203 * (v183 * 134217728.0 - (v183 * 134217728.0 - v183))
                                 - (v165 - v203) * (v183 * 134217728.0 - (v183 * 134217728.0 - v183))
                                 - v203 * (v183 - (v183 * 134217728.0 - (v183 * 134217728.0 - v183)))
                                 - (v165 - v203) * (v183 - (v183 * 134217728.0 - (v183 * 134217728.0 - v183))));
                          v205 = v295 * 134217728.0 - (v295 * 134217728.0 - v295);
                          v206 = v204 * 134217728.0 - (v204 * 134217728.0 - v204);
                          v207 = -(v295 * v204
                                 - v206 * v205
                                 - (v204 - v206) * v205
                                 - v206 * (v295 - v205)
                                 - (v204 - v206) * (v295 - v205));
                          v208 = v202 * 134217728.0 - (v202 * 134217728.0 - v202);
                          v209 = v202 - v208;
                          v210 = -(v295 * v202
                                 - v208 * v205
                                 - (v202 - v208) * v205
                                 - v208 * (v295 - v205)
                                 - (v202 - v208) * (v295 - v205));
                          v211 = v295 * v204
                               - (v295 * v202
                                - v208 * v205
                                - (v202 - v208) * v205
                                - v208 * (v295 - v205)
                                - (v202 - v208) * (v295 - v205));
                          v314 = v207;
                          v315 = v210 - (v211 - v295 * v204) + v295 * v204 - (v211 - (v211 - v295 * v204));
                          v316 = v211 - (v295 * v202 + v211 - v295 * v202);
                          v317 = v295 * v202 + v211;
                          v212 = sub_1DEE5CCBC(v156, v159, 4, &v314, v161);
                          v162 = v299;
                          v156 = v212;
                          if (v299 == 0.0)
                          {
                            v217 = v159;
                            v159 = v161;
                          }
                          else
                          {
                            v213 = v299 * 134217728.0 - (v299 * 134217728.0 - v299);
                            v214 = v202 * v299 + -v208 * v213;
                            v215 = v299 * v204 - (v214 + -v209 * v213 + -v208 * (v299 - v213) - v209 * (v299 - v213));
                            v314 = -(v299 * v204
                                   + -v206 * v213
                                   + -(v204 - v206) * v213
                                   + -v206 * (v299 - v213)
                                   - (v204 - v206) * (v299 - v213));
                            v315 = -(v214 + -v209 * v213 + -v208 * (v299 - v213) - v209 * (v299 - v213))
                                 - (v215
                                  - v299 * v204)
                                 + v299 * v204
                                 - (v215
                                  - (v215
                                   - v299 * v204));
                            v316 = v215 - (v202 * v299 + v215 - v202 * v299);
                            v317 = v202 * v299 + v215;
                            v216 = sub_1DEE5CCBC(v212, v161, 4, &v314, v159);
                            v162 = v299;
                            v156 = v216;
                            v217 = v161;
                          }
                          v164 = v297;
                          v76 = v278 - v37 - v281 + v278 - (v37 + v278 - v37);
                          v165 = v287;
                        }
                        if (v76 == 0.0)
                        {
                          v161 = v217;
                          v85 = v309;
                          v163 = v290;
                        }
                        else
                        {
                          v218 = v76;
                          v219 = -(v165 * v76);
                          v220 = v165 * -134217728.0 - (v165 + v165 * -134217728.0);
                          v221 = -(v219
                                 - v220 * (v218 * 134217728.0 - (v218 * 134217728.0 - v218))
                                 - (-v165 - v220) * (v218 * 134217728.0 - (v218 * 134217728.0 - v218))
                                 - v220 * (v218 - (v218 * 134217728.0 - (v218 * 134217728.0 - v218)))
                                 - (-v165 - v220) * (v218 - (v218 * 134217728.0 - (v218 * 134217728.0 - v218))));
                          v222 = v89 * 134217728.0 - (v89 * 134217728.0 - v89);
                          v223 = v221 * 134217728.0 - (v221 * 134217728.0 - v221);
                          v224 = -(v89 * v221
                                 - v223 * v222
                                 - (v221 - v223) * v222
                                 - v223 * (v89 - v222)
                                 - (v221 - v223) * (v89 - v222));
                          v225 = v219 * 134217728.0 - (v219 * 134217728.0 - v219);
                          v226 = v219 - v225;
                          v227 = -(v219 * v89
                                 - v225 * v222
                                 - (v219 - v225) * v222
                                 - v225 * (v89 - v222)
                                 - (v219 - v225) * (v89 - v222));
                          v228 = v89 * v221 + v227;
                          v314 = v224;
                          v315 = v227 - (v228 - v89 * v221) + v89 * v221 - (v228 - (v228 - v89 * v221));
                          v316 = v228 - (v219 * v89 + v228 - v219 * v89);
                          v317 = v219 * v89 + v228;
                          v229 = sub_1DEE5CCBC(v156, v159, 4, &v314, v217);
                          v156 = v229;
                          if (v294 == 0.0)
                          {
                            v161 = v159;
                            v159 = v217;
                          }
                          else
                          {
                            v230 = v294 * 134217728.0 - (v294 * 134217728.0 - v294);
                            v231 = v219 * v294 + -v225 * v230;
                            v232 = v294 * v221 - (v231 + -v226 * v230 + -v225 * (v294 - v230) - v226 * (v294 - v230));
                            v314 = -(v294 * v221
                                   + -v223 * v230
                                   + -(v221 - v223) * v230
                                   + -v223 * (v294 - v230)
                                   - (v221 - v223) * (v294 - v230));
                            v315 = -(v231 + -v226 * v230 + -v225 * (v294 - v230) - v226 * (v294 - v230))
                                 - (v232
                                  - v294 * v221)
                                 + v294 * v221
                                 - (v232
                                  - (v232
                                   - v294 * v221));
                            v316 = v232 - (v219 * v294 + v232 - v219 * v294);
                            v317 = v219 * v294 + v232;
                            v156 = sub_1DEE5CCBC(v229, v217, 4, &v314, v159);
                            v161 = v217;
                          }
                          v162 = v299;
                          v85 = v309;
                          v163 = v290;
                          v164 = v297;
                          v76 = v278 - v37 - v281 + v278 - (v37 + v278 - v37);
                        }
                      }
                      if (v163 == 0.0)
                      {
                        v251 = v161;
                      }
                      else
                      {
                        if (v76 == 0.0)
                        {
                          v251 = v161;
                        }
                        else
                        {
                          v233 = v76;
                          v234 = v163 * v76;
                          v235 = v163 * 134217728.0 - (v163 * 134217728.0 - v163);
                          v236 = -(v234
                                 - v235 * (v233 * 134217728.0 - (v233 * 134217728.0 - v233))
                                 - (v163 - v235) * (v233 * 134217728.0 - (v233 * 134217728.0 - v233))
                                 - v235 * (v233 - (v233 * 134217728.0 - (v233 * 134217728.0 - v233)))
                                 - (v163 - v235) * (v233 - (v233 * 134217728.0 - (v233 * 134217728.0 - v233))));
                          v237 = v85 * 134217728.0 - (v85 * 134217728.0 - v85);
                          v238 = v85 - v237;
                          v239 = v85 * v236;
                          v240 = v236 * 134217728.0 - (v236 * 134217728.0 - v236);
                          v241 = -(v85 * v236
                                 - v240 * v237
                                 - (v236 - v240) * v237
                                 - v240 * (v85 - v237)
                                 - (v236 - v240) * (v85 - v237));
                          v242 = v234 * v85;
                          v243 = v234 * 134217728.0 - (v234 * 134217728.0 - v234);
                          v244 = v234 - v243;
                          v245 = -(v242 - v243 * v237 - (v234 - v243) * v237 - v243 * v238 - (v234 - v243) * v238);
                          v246 = v239 - (v242 - v243 * v237 - (v234 - v243) * v237 - v243 * v238 - (v234 - v243) * v238);
                          v314 = v241;
                          v315 = v245 - (v246 - v239) + v239 - (v246 - (v246 - v239));
                          v316 = v246 - (v242 + v246 - v242);
                          v317 = v242 + v246;
                          v247 = sub_1DEE5CCBC(v156, v159, 4, &v314, v161);
                          v156 = v247;
                          if (v292 == 0.0)
                          {
                            v251 = v159;
                            v159 = v161;
                          }
                          else
                          {
                            v248 = v292 * 134217728.0 - (v292 * 134217728.0 - v292);
                            v249 = v234 * v292 + -v243 * v248;
                            v250 = v292 * v236 - (v249 + -v244 * v248 + -v243 * (v292 - v248) - v244 * (v292 - v248));
                            v314 = -(v292 * v236
                                   + -v240 * v248
                                   + -(v236 - v240) * v248
                                   + -v240 * (v292 - v248)
                                   - (v236 - v240) * (v292 - v248));
                            v315 = -(v249 + -v244 * v248 + -v243 * (v292 - v248) - v244 * (v292 - v248))
                                 - (v250
                                  - v292 * v236)
                                 + v292 * v236
                                 - (v250
                                  - (v250
                                   - v292 * v236));
                            v316 = v250 - (v234 * v292 + v250 - v234 * v292);
                            v317 = v234 * v292 + v250;
                            v156 = sub_1DEE5CCBC(v247, v161, 4, &v314, v159);
                            v251 = v161;
                          }
                          v162 = v299;
                          v163 = v290;
                          v164 = v297;
                        }
                        if (v164 != 0.0)
                        {
                          v252 = -(v163 * v164);
                          v253 = v163 * -134217728.0 - (v163 + v163 * -134217728.0);
                          v254 = -(v252
                                 - v253 * (v164 * 134217728.0 - (v164 * 134217728.0 - v164))
                                 - (-v163 - v253) * (v164 * 134217728.0 - (v164 * 134217728.0 - v164))
                                 - v253 * (v164 - (v164 * 134217728.0 - (v164 * 134217728.0 - v164)))
                                 - (-v163 - v253) * (v164 - (v164 * 134217728.0 - (v164 * 134217728.0 - v164))));
                          v255 = v295 * 134217728.0 - (v295 * 134217728.0 - v295);
                          v256 = v254 * 134217728.0 - (v254 * 134217728.0 - v254);
                          v257 = -(v295 * v254
                                 - v256 * v255
                                 - (v254 - v256) * v255
                                 - v256 * (v295 - v255)
                                 - (v254 - v256) * (v295 - v255));
                          v258 = v252 * 134217728.0 - (v252 * 134217728.0 - v252);
                          v259 = v252 - v258;
                          v260 = -(v295 * v252
                                 - v258 * v255
                                 - (v252 - v258) * v255
                                 - v258 * (v295 - v255)
                                 - (v252 - v258) * (v295 - v255));
                          v261 = v295 * v254 + v260;
                          v314 = v257;
                          v315 = v260 - (v261 - v295 * v254) + v295 * v254 - (v261 - (v261 - v295 * v254));
                          v316 = v261 - (v295 * v252 + v261 - v295 * v252);
                          v317 = v295 * v252 + v261;
                          v262 = sub_1DEE5CCBC(v156, v159, 4, &v314, v251);
                          v156 = v262;
                          if (v299 == 0.0)
                          {
LABEL_102:
                            v161 = v159;
                            v159 = v251;
                            goto LABEL_103;
                          }
                          v263 = v299 * 134217728.0 - (v299 * 134217728.0 - v299);
                          v264 = v252 * v299 + -v258 * v263;
                          v265 = v299 * v254 - (v264 + -v259 * v263 + -v258 * (v299 - v263) - v259 * (v299 - v263));
                          v314 = -(v299 * v254
                                 + -v256 * v263
                                 + -(v254 - v256) * v263
                                 + -v256 * (v299 - v263)
                                 - (v254 - v256) * (v299 - v263));
                          v315 = -(v264 + -v259 * v263 + -v258 * (v299 - v263) - v259 * (v299 - v263))
                               - (v265
                                - v299 * v254)
                               + v299 * v254
                               - (v265
                                - (v265
                                 - v299 * v254));
                          v316 = v265 - (v252 * v299 + v265 - v252 * v299);
                          v317 = v252 * v299 + v265;
                          v266 = sub_1DEE5CCBC(v262, v251, 4, &v314, v159);
                          v162 = v299;
                          v156 = v266;
LABEL_101:
                          v267 = sub_1DEE5CEC4(v146, v320, v312, v162);
                          v156 = sub_1DEE5CCBC(v156, v159, v267, v312, v251);
                          goto LABEL_102;
                        }
                        v161 = v251;
                      }
                      if (v162 == 0.0)
                      {
LABEL_103:
                        if (v292 == 0.0)
                        {
                          v269 = v161;
                          v161 = v159;
                        }
                        else
                        {
                          v268 = sub_1DEE5CEC4(v151, v319, v312, v292);
                          v156 = sub_1DEE5CCBC(v156, v159, v268, v312, v161);
                          v269 = v159;
                        }
                        if (v294 == 0.0)
                        {
                          v269 = v161;
                        }
                        else
                        {
                          v270 = sub_1DEE5CEC4(v154, v318, v312, v294);
                          v156 = sub_1DEE5CCBC(v156, v161, v270, v312, v269);
                        }
                        return v269[v156 - 1];
                      }
                      goto LABEL_101;
                    }
                    v325 = -(v83 - v129 * v274 - (v290 - v129) * v274 - v129 * v52 - (v290 - v129) * v52);
                    v326 = v37 * v290;
                    v321 = -(-(v290 * v310)
                           - (v290 * -134217728.0 - (v290 + v290 * -134217728.0)) * v304
                           - (-v290 - (v290 * -134217728.0 - (v290 + v290 * -134217728.0))) * v304
                           - (v290 * -134217728.0 - (v290 + v290 * -134217728.0)) * v300
                           - (-v290 - (v290 * -134217728.0 - (v290 + v290 * -134217728.0))) * v300);
                    v322 = -(v290 * v310);
                  }
                  v128 = 2;
                  goto LABEL_53;
                }
                v333 = -(v81 - v111 * v272 - (v287 - v111) * v272 - v111 * v303 - (v287 - v111) * v303);
                v334 = v287 * v305;
                v329 = -(-(v287 * v37)
                       - (v287 * -134217728.0 - (v287 + v287 * -134217728.0)) * v274
                       - (-v287 - (v287 * -134217728.0 - (v287 + v287 * -134217728.0))) * v274
                       - (v287 * -134217728.0 - (v287 + v287 * -134217728.0)) * v52
                       - (-v287 - (v287 * -134217728.0 - (v287 + v287 * -134217728.0))) * v52);
                v330 = -(v287 * v37);
              }
              v110 = 2;
              goto LABEL_45;
            }
            v341 = -(v86 - v91 * v304 - (v285 - v91) * v304 - v91 * v300 - (v285 - v91) * v300);
            v342 = v285 * v310;
            v337 = -(-(v285 * v305)
                   - (v285 * -134217728.0 - (v285 + v285 * -134217728.0)) * v272
                   - (-v285 - (v285 * -134217728.0 - (v285 + v285 * -134217728.0))) * v272
                   - (v285 * -134217728.0 - (v285 + v285 * -134217728.0)) * v303
                   - (-v285 - (v285 * -134217728.0 - (v285 + v285 * -134217728.0))) * v303);
            v338 = -(v285 * v305);
          }
          v90 = 2;
          goto LABEL_37;
        }
      }
    }
  }
  return v19;
}

double _simd_incircle_pd2(simd_double2 a1, simd_double2 a2, simd_double2 a3, simd_double2 a4)
{
  int v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  double v23;
  double v24;
  float64x2_t v26;
  float64x2_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  uint64_t v84;
  double *v85;
  double v86;
  double v87;
  float64x2_t v89;
  double v90;
  float64x2_t v91;
  float64x2_t v92;
  float64x2_t v93;
  double v94;
  float64x2_t v95;
  float64x2_t v96;
  long double v97;
  double v100;
  double v101;
  double v103;
  double v109;
  double v110;
  double v111;
  double v113;
  double v114;
  double v115;
  double v117;
  double v118;
  double v119;
  _BOOL4 v120;
  int v121;
  int v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  _BOOL4 v129;
  int v130;
  int v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  _BOOL4 v138;
  int v139;
  float64_t v140;
  float64_t v141;
  float64_t v142;
  float64_t v143;
  int v144;
  int v145;
  int v146;
  int v147;
  int v148;
  int v149;
  int v150;
  double *v151;
  double *v152;
  int v153;
  int v154;
  int v155;
  int v156;
  int v157;
  int v158;
  double *v159;
  int v160;
  int v161;
  int v162;
  int v163;
  int v164;
  int v165;
  int v166;
  double *v167;
  int v168;
  int v169;
  int v170;
  int v171;
  int v172;
  int v173;
  int v174;
  int v175;
  double v176;
  double *v177;
  double v178;
  double v179;
  int v180;
  int v181;
  int v182;
  int v183;
  int v184;
  int v185;
  int v186;
  double *v187;
  int v188;
  int v189;
  int v190;
  int v191;
  int v192;
  int v193;
  int v194;
  double *v195;
  double *v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  float64_t v202;
  double v203;
  double v204;
  double v205;
  double v206;
  float64_t v207;
  float64_t v208;
  float64_t v209;
  float64_t v210;
  float64_t v211;
  double v212;
  float64_t v213;
  float64_t v214;
  float64_t v215;
  int v216;
  int v217;
  double v218;
  float64_t v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double v224;
  int v225;
  int v226;
  int v227;
  int v228;
  int v229;
  int v230;
  int v231;
  double v232;
  int v233;
  int v234;
  int v235;
  int v236;
  double v237;
  double *v238;
  int v239;
  int v240;
  int v241;
  int v242;
  int v243;
  int v244;
  int v245;
  int v246;
  int v247;
  int v248;
  int v249;
  int v250;
  int v251;
  int v252;
  int v253;
  int v254;
  int v255;
  int v256;
  double v257;
  double v258;
  double v259;
  double v260;
  double v261;
  double v262;
  float64_t v263;
  float64_t v264;
  double v265;
  float64_t v266;
  double v267;
  double v268;
  double v269;
  double v270;
  double v271;
  double v272;
  double v273;
  double v274;
  double v275;
  double v276;
  double v277;
  double v278;
  int v279;
  int v280;
  float64_t v281;
  double v282;
  float64_t v283;
  double v284;
  float64_t v285;
  float64_t v286;
  float64_t v287;
  int v288;
  int v289;
  int v290;
  int v291;
  int v292;
  int v293;
  int v294;
  double *v295;
  int v296;
  int v297;
  int v298;
  double v299;
  double *v300;
  int v301;
  int v302;
  int v303;
  int v304;
  int v305;
  int v306;
  int v307;
  int v308;
  int v309;
  int v310;
  int v311;
  int v312;
  int v313;
  int v314;
  int v315;
  int v316;
  int v317;
  int v318;
  double v319;
  double v320;
  double v321;
  float64_t v322;
  double v323;
  double v324;
  double v325;
  double v326;
  double v327;
  double v328;
  float64_t v329;
  double v330;
  float64_t v331;
  float64_t v332;
  double v333;
  float64_t v334;
  float64_t v335;
  float64_t v336;
  int v337;
  int v338;
  double v339;
  double v340;
  double v341;
  double v342;
  double v343;
  double v344;
  double v345;
  int v346;
  int v347;
  int v348;
  int v349;
  int v350;
  int v351;
  int v352;
  double *v353;
  int v354;
  int v355;
  int v356;
  double v357;
  int v358;
  int v359;
  int v360;
  int v361;
  int v362;
  int v363;
  int v364;
  int v365;
  int v366;
  int v367;
  int v368;
  int v369;
  int v370;
  int v371;
  int v372;
  int v373;
  int v374;
  int v376;
  int v377;
  int v378;
  int v379;
  double v380;
  double v381;
  double v382;
  double v383;
  double v384;
  double v385;
  double v386;
  int v387;
  double v388;
  int v389;
  double v390;
  double v391;
  double v392;
  int v393;
  double v394;
  double v395;
  double v396;
  double v397;
  double v398;
  double v399;
  double v400;
  double v401;
  float64x2_t v402;
  BOOL v403;
  float64x2_t v404;
  BOOL v405;
  float64x2_t v406;
  double v407;
  float64x2_t v408;
  double v409;
  float64x2_t v410;
  double v411;
  float64x2_t v412;
  float64x2_t v413;
  double v414;
  double v415;
  double v416;
  float64x2_t v417;
  double v418;
  double v419;
  double v420;
  double v421;
  float64x2_t v422;
  float64x2_t v423;
  float64x2_t v424;
  float64x2_t v425;
  double v426[4];
  double v427[4];
  double v428[4];
  double v429[8];
  double v430[8];
  double v431[8];
  double v432[8];
  double v433[8];
  double v434[8];
  double v435[8];
  double v436[8];
  double v437[8];
  double v438[16];
  double v439[16];
  double v440[16];
  double v441[16];
  double v442[16];
  double v443[16];
  double v444[8];
  double v445[8];
  double v446[8];
  double v447[8];
  double v448[8];
  double v449[8];
  double v450[8];
  double v451[8];
  double v452[8];
  double v453[8];
  double v454[8];
  double v455[8];
  double v456[8];
  double v457[8];
  double v458[8];
  double v459[8];
  double v460[8];
  double v461[8];
  double v462[64];
  double v463[48];
  double v464[32];
  double v465[32];
  double v466[16];
  double v467[16];
  double v468[16];
  double v469[8];
  double v470;
  double v471;
  double v472;
  double v473;
  double v474;
  double v475;
  double v476;
  double v477;
  double v478[4];
  double v479[4];
  double v480[4];
  double v481[1152];
  double v482;
  uint64_t v483;
  double v484[64];
  double v485[32];
  double v486[16];
  double v487[8];
  double v488[16];
  double v489[8];
  double v490[32];
  double v491[16];
  double v492[8];
  double v493[16];
  double v494[8];
  double v495[32];
  double v496[16];
  double v497[8];
  double v498[16];
  double v499[8];
  double v500[4];
  double v501[4];
  double v502[5];

  v5.f64[0] = ((double (*)())MEMORY[0x1E0C86820])();
  v9 = vsubq_f64(v6, v5);
  v10 = vsubq_f64(v7, v5);
  v11 = vsubq_f64(v8, v5);
  v12 = vmulq_f64(v9, v9);
  v13 = vaddq_f64(v12, (float64x2_t)vdupq_laneq_s64((int64x2_t)v12, 1));
  v14 = vmulq_f64(v10, v10);
  v15 = vmulq_f64(v11, v11);
  v16 = vaddq_f64(v14, (float64x2_t)vdupq_laneq_s64((int64x2_t)v14, 1));
  v17 = vaddq_f64(v15, (float64x2_t)vdupq_laneq_s64((int64x2_t)v15, 1));
  v18 = (float64x2_t)vextq_s8((int8x16_t)v11, (int8x16_t)v17, 8uLL);
  v17.f64[1] = v11.f64[0];
  v19 = vmulq_f64((float64x2_t)vextq_s8((int8x16_t)v10, (int8x16_t)v16, 8uLL), v17);
  v20 = vmulq_laneq_f64(v10, v11, 1);
  v16.f64[1] = v10.f64[0];
  v21 = vmulq_f64(v16, v18);
  v22 = vmulq_laneq_f64(v11, v10, 1);
  v23 = vmulq_f64(v13, vsubq_f64(v20, v22)).f64[0] + vaddvq_f64(vmulq_f64(v9, vsubq_f64(v19, v21)));
  v24 = vmulq_f64(vaddq_f64(vabsq_f64(v20), vabsq_f64(v22)), vabsq_f64(v13)).f64[0]
      + vaddvq_f64(vmulq_f64(vaddq_f64(vabsq_f64(v19), vabsq_f64(v21)), vabdq_f64(v6, v5)));
  if (v23 <= v24 * 1.11022302e-15 && v24 * 1.11022302e-15 >= -v23)
  {
    v416 = v24;
    v386 = v12.f64[0];
    v388 = v14.f64[0];
    v406 = v6;
    v408 = v7;
    v6.f64[0] = v8.f64[0];
    v8.f64[0] = v7.f64[1];
    v410 = v5;
    v412 = v8;
    v402 = v6;
    v404 = (float64x2_t)vdupq_laneq_s64((int64x2_t)v5, 1);
    v26 = vsubq_f64(v6, v5);
    v27 = vsubq_f64(v8, v404);
    v28 = vmuld_lane_f64(v10.f64[0], v27, 1);
    v423 = v10;
    v414 = 134217728.0 * v10.f64[0] - (134217728.0 * v10.f64[0] - v10.f64[0]);
    v29 = vmuld_lane_f64(134217728.0, v27, 1);
    v420 = v10.f64[0] - v414;
    v421 = v27.f64[1];
    v30 = v29 - (v29 - v27.f64[1]);
    v31 = v27.f64[1] - v30;
    v32 = -(v28
          - v414 * v30
          - (v10.f64[0] - v414) * v30
          - v414 * (v27.f64[1] - v30)
          - (v10.f64[0] - v414) * (v27.f64[1] - v30));
    v424 = v27;
    v425 = v26;
    v33 = vmuld_n_f64(v27.f64[0], v26.f64[0]);
    v34 = 134217728.0 * v26.f64[0] - (134217728.0 * v26.f64[0] - v26.f64[0]);
    v35 = v26.f64[0] - v34;
    v36 = 134217728.0 * v27.f64[0] - (134217728.0 * v27.f64[0] - v27.f64[0]);
    v418 = v36;
    v419 = v27.f64[0] - v36;
    v37 = -(v33
          - v34 * v36
          - (v26.f64[0] - v34) * v36
          - v34 * (v27.f64[0] - v36)
          - (v26.f64[0] - v34) * (v27.f64[0] - v36));
    v38 = v32 - v37;
    v39 = v32 - (v32 - v37) - v37 + v32 - (v32 - v37 + v32 - (v32 - v37));
    v40 = v28 + v38;
    v41 = v38 - (v28 + v38 - v28) + v28 - (v28 + v38 - (v28 + v38 - v28));
    v42 = v41 - v33;
    v398 = v33;
    v502[0] = v39;
    v502[1] = v41 - (v41 - v33) - v33 + v41 - (v41 - v33 + v41 - (v41 - v33));
    v43 = v40 + v41 - v33;
    v502[2] = v42 - (v43 - v40) + v40 - (v43 - (v43 - v40));
    v502[3] = v43;
    v422 = v9;
    v44 = sub_1DEE5CEC4(4, v502, v499, v9.f64[0]);
    v45 = sub_1DEE5CEC4(v44, v499, v498, v422.f64[0]);
    v46 = sub_1DEE5CEC4(4, v502, v497, v425.f64[1]);
    v47 = sub_1DEE5CEC4(v46, v497, v496, v425.f64[1]);
    v48 = sub_1DEE5CCBC(v45, v498, v47, v496, v495);
    v49 = vmuld_lane_f64(v425.f64[0], v425, 1);
    v50 = vmuld_lane_f64(134217728.0, v425, 1);
    v51 = v50 - (v50 - v425.f64[1]);
    v401 = v35;
    v394 = v31;
    v396 = v34;
    v52 = -(v49 - v34 * v51 - v35 * v51 - v34 * (v425.f64[1] - v51) - v35 * (v425.f64[1] - v51));
    v53 = vmuld_lane_f64(v422.f64[0], v424, 1);
    v54 = 134217728.0 * v422.f64[0] - (134217728.0 * v422.f64[0] - v422.f64[0]);
    v392 = v30;
    v55 = -(v53 - v54 * v30 - (v422.f64[0] - v54) * v30 - v54 * v31 - (v422.f64[0] - v54) * v31);
    v56 = v52 - v55;
    v57 = v52 - (v52 - v55) - v55 + v52 - (v52 - v55 + v52 - (v52 - v55));
    v58 = v49 + v56;
    v59 = v56 - (v49 + v56 - v49) + v49 - (v49 + v56 - (v49 + v56 - v49));
    v60 = v59 - v53;
    v501[0] = v57;
    v501[1] = v59 - (v59 - v53) - v53 + v59 - (v59 - v53 + v59 - (v59 - v53));
    v61 = v58 + v59 - v53;
    v501[2] = v60 - (v61 - v58) + v58 - (v61 - (v61 - v58));
    v501[3] = v61;
    v62 = sub_1DEE5CEC4(4, v501, v494, v423.f64[0]);
    v63 = sub_1DEE5CEC4(v62, v494, v493, v423.f64[0]);
    v64 = sub_1DEE5CEC4(4, v501, v492, v424.f64[0]);
    v65 = sub_1DEE5CEC4(v64, v492, v491, v424.f64[0]);
    v66 = sub_1DEE5CCBC(v63, v493, v65, v491, v490);
    v67 = vmuld_n_f64(v422.f64[0], v424.f64[0]);
    v400 = v422.f64[0] - v54;
    v68 = -(v67 - v54 * v418 - v400 * v418 - v54 * v419 - v400 * v419);
    v69 = vmuld_lane_f64(v423.f64[0], v425, 1);
    v390 = v51;
    v391 = v425.f64[1] - v51;
    v70 = v414;
    v71 = -(v69 - v414 * v51 - v420 * v51 - v414 * v391 - v420 * v391);
    v72 = v68 - v71;
    v73 = v68 - (v68 - v71) - v71 + v68 - (v68 - v71 + v68 - (v68 - v71));
    v74 = v67 + v72;
    v75 = v72 - (v67 + v72 - v67) + v67 - (v67 + v72 - (v67 + v72 - v67));
    v500[0] = v73;
    v500[1] = v75 - (v75 - v69) - v69 + v75 - (v75 - v69 + v75 - (v75 - v69));
    v500[2] = v75 - v69 - (v74 + v75 - v69 - v74) + v74 - (v74 + v75 - v69 - (v74 + v75 - v69 - v74));
    v500[3] = v74 + v75 - v69;
    v76 = sub_1DEE5CEC4(4, v500, v489, v425.f64[0]);
    v77 = sub_1DEE5CEC4(v76, v489, v488, v425.f64[0]);
    v78 = sub_1DEE5CEC4(4, v500, v487, v421);
    v79 = sub_1DEE5CEC4(v78, v487, v486, v421);
    v80 = sub_1DEE5CCBC(v77, v488, v79, v486, v485);
    v81 = sub_1DEE5CCBC(v48, v495, v66, v490, v484);
    v82 = sub_1DEE5CCBC(v81, v484, v80, v485, &v482);
    v83 = v82;
    v23 = v482;
    if (v82 < 2)
    {
      v86 = v416;
    }
    else
    {
      v84 = v82 - 1;
      v85 = (double *)&v483;
      v86 = v416;
      do
      {
        v87 = *v85++;
        v23 = v23 + v87;
        --v84;
      }
      while (v84);
    }
    if (v23 < v86 * 4.4408921e-16 && v86 * 4.4408921e-16 > -v23)
    {
      v89 = vsubq_f64(v406, v422);
      *(_QWORD *)&v90 = *(_OWORD *)&vaddq_f64(vsubq_f64(v89, v410), vsubq_f64(v406, vaddq_f64(v422, v89)));
      v91 = vsubq_f64(v402, v425);
      v92 = vsubq_f64(v412, v424);
      v93 = vsubq_f64(v408, v423);
      *(_QWORD *)&v94 = *(_OWORD *)&vaddq_f64(vsubq_f64(v93, v410), vsubq_f64(v408, vaddq_f64(v423, v93)));
      v95 = vaddq_f64(vsubq_f64(v92, v404), vsubq_f64(v412, vaddq_f64(v424, v92)));
      v96 = vaddq_f64(vsubq_f64(v91, v410), vsubq_f64(v402, vaddq_f64(v425, v91)));
      if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(v96), (int32x4_t)vceqzq_f64(v95))))) & 1) != 0|| v94 != 0.0|| v90 != 0.0)
      {
        v413 = v96;
        v417 = v95;
        v407 = v90;
        v409 = v94;
        v97 = fabsl(v23);
        _V21.D[1] = v417.f64[1];
        _V20.D[1] = v413.f64[1];
        v100 = v97 * 3.33066907e-16 + v86 * 5.42341872e-31;
        v101 = v425.f64[1] * v425.f64[1];
        _D18 = v423.f64[0];
        v103 = v421 * v409;
        __asm { FMLA            D1, D18, V21.D[1] }
        _D17 = v425.f64[0];
        v109 = vmuld_lane_f64(v425.f64[1], v413, 1);
        v110 = -(v398 - v423.f64[0] * v421) * (v109 + v422.f64[0] * v407 + v109 + v422.f64[0] * v407)
             + (v425.f64[1] * v425.f64[1] + v422.f64[0] * v422.f64[0])
             * (_D1 - vmlad_n_f64(v425.f64[0] * v417.f64[0], v424.f64[0], v413.f64[0]));
        v111 = v424.f64[0] * v424.f64[0];
        __asm { FMLA            D5, D17, V20.D[1] }
        v113 = v110
             + -(v53 - v425.f64[0] * v425.f64[1])
             * (v424.f64[0] * v417.f64[0] + v423.f64[0] * v409 + v424.f64[0] * v417.f64[0] + v423.f64[0] * v409)
             + (v424.f64[0] * v424.f64[0] + _D18 * _D18) * (_D5 - (vmuld_lane_f64(v422.f64[0], v417, 1) + v421 * v407));
        v114 = v421 * v421;
        v115 = vmlad_n_f64(vmuld_lane_f64(v421, v417, 1), v425.f64[0], v413.f64[0]);
        v23 = v113
            + -(v69 - v422.f64[0] * v424.f64[0]) * (v115 + v115)
            + (v421 * v421 + _D17 * _D17)
            * (vmlad_n_f64(v424.f64[0] * v407, v422.f64[0], v417.f64[0])
             - (vmuld_lane_f64(v423.f64[0], v413, 1)
              + v425.f64[1] * v409))
            + v23;
        if (v23 < v100 && v100 > -v23)
        {
          v380 = v425.f64[1] * v413.f64[0];
          v117 = -v54;
          v118 = v417.f64[1];
          v119 = v413.f64[1];
          v120 = v417.f64[0] != 0.0 || v409 != 0.0;
          v121 = v413.f64[0] != 0.0 || v120;
          if (v417.f64[1] == 0.0)
            v122 = v121;
          else
            v122 = 1;
          if (v122 == 1)
          {
            v123 = -(v386 + v117 * v54 - (v54 + v54) * v400 - v400 * v400);
            v124 = v123 - (v101 - v390 * v390 - (v390 + v390) * v391 - v391 * v391);
            v125 = -(v101 - v390 * v390 - (v390 + v390) * v391 - v391 * v391)
                 - (v124
                  - v123)
                 + v123
                 + v124
                 - v123
                 - v124;
            v126 = v386 + v124;
            v127 = v124 - (v386 + v124 - v386) + v386 + v386 + v124 - v386 - (v386 + v124);
            v480[0] = v125;
            v480[1] = v101 - (v101 + v127 - v127) + v127 + v101 + v127 - v127 - (v101 + v127);
            v480[2] = v101
                    + v127
                    - (v126
                     + v101
                     + v127
                     - v126)
                    + v126
                    + v126
                    + v101
                    + v127
                    - v126
                    - (v126
                     + v101
                     + v127);
            v480[3] = v126 + v101 + v127;
          }
          v128 = -v414;
          v129 = v417.f64[1] != 0.0 || v413.f64[0] != 0.0;
          v130 = v407 != 0.0 || v129;
          if (v413.f64[1] == 0.0)
            v131 = v130;
          else
            v131 = 1;
          if (v131 == 1)
          {
            v132 = -(v388 + v128 * v414 - (v414 + v414) * v420 - v420 * v420);
            v133 = v132 - (v111 - v418 * v418 - (v418 + v418) * v419 - v419 * v419);
            v134 = -(v111 - v418 * v418 - (v418 + v418) * v419 - v419 * v419)
                 - (v133
                  - v132)
                 + v132
                 + v133
                 - v132
                 - v133;
            v135 = v388 + v133;
            v136 = v133 - (v388 + v133 - v388) + v388 + v388 + v133 - v388 - (v388 + v133);
            v479[0] = v134;
            v479[1] = v111 - (v111 + v136 - v136) + v136 + v111 + v136 - v136 - (v111 + v136);
            v479[2] = v111
                    + v136
                    - (v135
                     + v111
                     + v136
                     - v135)
                    + v135
                    + v135
                    + v111
                    + v136
                    - v135
                    - (v135
                     + v111
                     + v136);
            v479[3] = v135 + v111 + v136;
          }
          v137 = -v396;
          v138 = v413.f64[1] != 0.0 || v407 != 0.0;
          v139 = v409 != 0.0 || v138;
          if (v417.f64[0] != 0.0)
            v139 = 1;
          if (v139 == 1)
          {
            v140 = -(v425.f64[0] * v425.f64[0] + v137 * v396 - (v396 + v396) * v401 - v401 * v401);
            v141 = v140 - (v114 - v392 * v392 - (v392 + v392) * v394 - v394 * v394);
            v142 = v425.f64[0] * v425.f64[0] + v141;
            v143 = v141
                 - (v142
                  - v425.f64[0] * v425.f64[0])
                 + v425.f64[0] * v425.f64[0]
                 + v142
                 - v425.f64[0] * v425.f64[0]
                 - v142;
            v478[0] = -(v114 - v392 * v392 - (v392 + v392) * v394 - v394 * v394)
                    - (v141
                     - v140)
                    + v140
                    + v141
                    - v140
                    - v141;
            v478[1] = v114 - (v114 + v143 - v143) + v143 + v114 + v143 - v143 - (v114 + v143);
            v478[2] = v114
                    + v143
                    - (v142
                     + v114
                     + v143
                     - v142)
                    + v142
                    + v142
                    + v114
                    + v143
                    - v142
                    - (v142
                     + v114
                     + v143);
            v478[3] = v142 + v114 + v143;
          }
          v382 = v424.f64[0] * v407;
          v385 = v117;
          v405 = v129;
          v389 = v139;
          v403 = v120;
          v387 = v131;
          if (v407 == 0.0)
          {
            v152 = &v482;
            v151 = v481;
          }
          else
          {
            v379 = sub_1DEE5CEC4(4, v502, v449, v407);
            v144 = sub_1DEE5CEC4(v379, v449, v468, v422.f64[0] + v422.f64[0]);
            v145 = sub_1DEE5CEC4(4, v478, v460, v407);
            v146 = sub_1DEE5CEC4(v145, v460, v467, v424.f64[0]);
            v147 = sub_1DEE5CEC4(4, v479, v461, v407);
            v148 = sub_1DEE5CEC4(v147, v461, v466, -v421);
            v149 = sub_1DEE5CCBC(v144, v468, v146, v467, v465);
            v150 = sub_1DEE5CCBC(v148, v466, v149, v465, v463);
            v151 = &v482;
            v152 = v481;
            v83 = sub_1DEE5CCBC(v83, &v482, v150, v463, v481);
          }
          if (v413.f64[1] == 0.0)
          {
            v159 = v151;
          }
          else
          {
            v376 = sub_1DEE5CEC4(4, v502, v448, v413.f64[1]);
            v153 = sub_1DEE5CEC4(v376, v448, v468, v425.f64[1] + v425.f64[1]);
            v154 = sub_1DEE5CEC4(4, v479, v459, v413.f64[1]);
            v155 = sub_1DEE5CEC4(v154, v459, v467, v425.f64[0]);
            v156 = sub_1DEE5CEC4(4, v478, v458, v413.f64[1]);
            v4 = sub_1DEE5CEC4(v156, v458, v466, -v423.f64[0]);
            v157 = sub_1DEE5CCBC(v153, v468, v155, v467, v465);
            v158 = sub_1DEE5CCBC(v4, v466, v157, v465, v463);
            v83 = sub_1DEE5CCBC(v83, v152, v158, v463, v151);
            v159 = v152;
            v152 = v151;
          }
          if (v409 == 0.0)
          {
            v167 = v159;
          }
          else
          {
            v4 = sub_1DEE5CEC4(4, v501, v447, v409);
            v160 = sub_1DEE5CEC4(v4, v447, v468, v423.f64[0] + v423.f64[0]);
            v161 = sub_1DEE5CEC4(4, v480, v457, v409);
            v162 = sub_1DEE5CEC4(v161, v457, v467, v421);
            v163 = sub_1DEE5CEC4(4, v478, v456, v409);
            v164 = sub_1DEE5CEC4(v163, v456, v466, -v425.f64[1]);
            v165 = sub_1DEE5CCBC(v160, v468, v162, v467, v465);
            v166 = sub_1DEE5CCBC(v164, v466, v165, v465, v463);
            v83 = sub_1DEE5CCBC(v83, v152, v166, v463, v159);
            v167 = v152;
            v152 = v159;
          }
          if (v417.f64[0] == 0.0)
          {
            v177 = v167;
            v178 = v413.f64[0];
            v176 = v424.f64[0];
          }
          else
          {
            v377 = sub_1DEE5CEC4(4, v501, v446, v417.f64[0]);
            v168 = sub_1DEE5CEC4(v377, v446, v468, v424.f64[0] + v424.f64[0]);
            v169 = sub_1DEE5CEC4(4, v478, v454, v417.f64[0]);
            v170 = sub_1DEE5CEC4(v169, v454, v467, v422.f64[0]);
            v171 = sub_1DEE5CEC4(4, v480, v455, v417.f64[0]);
            v172 = sub_1DEE5CEC4(v171, v455, v466, -v425.f64[0]);
            v173 = sub_1DEE5CCBC(v168, v468, v170, v467, v465);
            v174 = sub_1DEE5CCBC(v172, v466, v173, v465, v463);
            v175 = sub_1DEE5CCBC(v83, v152, v174, v463, v167);
            v176 = v424.f64[0];
            v83 = v175;
            v177 = v152;
            v152 = v167;
            v178 = v413.f64[0];
          }
          v179 = -v176;
          if (v178 == 0.0)
          {
            v187 = v177;
          }
          else
          {
            v378 = sub_1DEE5CEC4(4, v500, v445, v178);
            v180 = sub_1DEE5CEC4(v378, v445, v468, v425.f64[0] + v425.f64[0]);
            v181 = sub_1DEE5CEC4(4, v479, v452, v413.f64[0]);
            v182 = sub_1DEE5CEC4(v181, v452, v467, v425.f64[1]);
            v183 = sub_1DEE5CEC4(4, v480, v453, v413.f64[0]);
            v184 = sub_1DEE5CEC4(v183, v453, v466, v179);
            v185 = sub_1DEE5CCBC(v180, v468, v182, v467, v465);
            v186 = sub_1DEE5CCBC(v184, v466, v185, v465, v463);
            v83 = sub_1DEE5CCBC(v83, v152, v186, v463, v177);
            v187 = v152;
            v152 = v177;
          }
          v415 = -v420;
          v397 = -v400;
          v399 = -v401;
          v381 = -v70;
          if (v417.f64[1] == 0.0)
          {
            if (!v138)
            {
              v196 = v187;
              v187 = v152;
              v197 = v409;
              goto LABEL_92;
            }
            if (!v122)
            {
              v395 = v137;
              v383 = v417.f64[1];
              v430[0] = 0.0;
              v217 = 1;
              v221 = 0.0;
              v216 = 1;
              goto LABEL_79;
            }
            v195 = v187;
            v187 = v152;
            v197 = v409;
          }
          else
          {
            v122 = sub_1DEE5CEC4(4, v500, v444, v417.f64[1]);
            v188 = sub_1DEE5CEC4(v122, v444, v468, v421 + v421);
            v189 = sub_1DEE5CEC4(4, v480, v451, v417.f64[1]);
            v190 = sub_1DEE5CEC4(v189, v451, v467, v423.f64[0]);
            v191 = sub_1DEE5CEC4(4, v479, v450, v417.f64[1]);
            v192 = sub_1DEE5CEC4(v191, v450, v466, -v422.f64[0]);
            v193 = sub_1DEE5CCBC(v188, v468, v190, v467, v465);
            v194 = sub_1DEE5CCBC(v192, v466, v193, v465, v463);
            v83 = sub_1DEE5CCBC(v83, v152, v194, v463, v187);
            v195 = v152;
            v196 = v152;
            v197 = v409;
            if (!v138)
              goto LABEL_92;
          }
          v152 = v187;
          v198 = v197 * 134217728.0 - (v197 * 134217728.0 - v197);
          v199 = v179;
          v200 = v197 - v198;
          v201 = -(v103 - v198 * v392 - (v197 - v198) * v392 - v198 * v394 - (v197 - v198) * v394);
          v202 = v417.f64[1] * 134217728.0 - (v417.f64[1] * 134217728.0 - v417.f64[1]);
          v203 = v201
               - (v423.f64[0] * v417.f64[1]
                + v128 * v202
                + v415 * v202
                + v128 * (v417.f64[1] - v202)
                - v420 * (v417.f64[1] - v202));
          v204 = -(v423.f64[0] * v417.f64[1]
                 + v128 * v202
                 + v415 * v202
                 + v128 * (v417.f64[1] - v202)
                 - v420 * (v417.f64[1] - v202))
               - (v203
                - v201)
               + v201
               - (v203
                - (v203
                 - v201));
          v205 = v103 + v203;
          v206 = v203 - (v103 + v203 - v103) + v103 - (v103 + v203 - (v103 + v203 - v103));
          v207 = v423.f64[0] * v417.f64[1] + v206;
          v474 = v204;
          v475 = v423.f64[0] * v417.f64[1] - (v207 - v206) + v206 - (v207 - (v207 - v206));
          v476 = v207 - (v205 + v207 - v205) + v205 - (v205 + v207 - (v205 + v207 - v205));
          v477 = v205 + v207;
          v208 = -(v424.f64[0] * v413.f64[0]);
          v209 = v413.f64[0] * 134217728.0 - (v413.f64[0] * 134217728.0 - v413.f64[0]);
          v210 = -(v208
                 - v209 * (v424.f64[0] * -134217728.0 - (v424.f64[0] + v424.f64[0] * -134217728.0))
                 - (v413.f64[0] - v209) * (v424.f64[0] * -134217728.0 - (v424.f64[0] + v424.f64[0] * -134217728.0))
                 - v209 * (v199 - (v424.f64[0] * -134217728.0 - (v424.f64[0] + v424.f64[0] * -134217728.0)))
                 - (v413.f64[0] - v209)
                 * (v199 - (v424.f64[0] * -134217728.0 - (v424.f64[0] + v424.f64[0] * -134217728.0))));
          v395 = v137;
          v211 = v210
               - (v395 * (v417.f64[0] * -134217728.0 - (v417.f64[0] + v417.f64[0] * -134217728.0))
                - v417.f64[0] * v425.f64[0]
                + v399 * (v417.f64[0] * -134217728.0 - (v417.f64[0] + v417.f64[0] * -134217728.0))
                + v395 * (-v417.f64[0] - (v417.f64[0] * -134217728.0 - (v417.f64[0] + v417.f64[0] * -134217728.0)))
                - v401 * (-v417.f64[0] - (v417.f64[0] * -134217728.0 - (v417.f64[0] + v417.f64[0] * -134217728.0))));
          v212 = -(v395 * (v417.f64[0] * -134217728.0 - (v417.f64[0] + v417.f64[0] * -134217728.0))
                 - v417.f64[0] * v425.f64[0]
                 + v399 * (v417.f64[0] * -134217728.0 - (v417.f64[0] + v417.f64[0] * -134217728.0))
                 + v395 * (-v417.f64[0] - (v417.f64[0] * -134217728.0 - (v417.f64[0] + v417.f64[0] * -134217728.0)))
                 - v401 * (-v417.f64[0] - (v417.f64[0] * -134217728.0 - (v417.f64[0] + v417.f64[0] * -134217728.0))))
               - (v211
                - v210)
               + v210
               - (v211
                - (v211
                 - v210));
          v213 = v211 - v424.f64[0] * v413.f64[0];
          v214 = v211 - (v213 - v208) + v208 - (v213 - (v213 - v208));
          v215 = v214 - v417.f64[0] * v425.f64[0];
          v470 = v212;
          v471 = -(v417.f64[0] * v425.f64[0]) - (v215 - v214) + v214 - (v215 - (v215 - v214));
          v472 = v215 - (v213 + v215 - v213) + v213 - (v213 + v215 - (v213 + v215 - v213));
          v473 = v213 + v215;
          v216 = 4;
          v217 = sub_1DEE5CCBC(4, &v474, 4, &v470, v430);
          v383 = v417.f64[1];
          v218 = -(v409 * v417.f64[1]
                 - v198 * v202
                 - v200 * v202
                 - v198 * (v417.f64[1] - v202)
                 - v200 * (v417.f64[1] - v202));
          v219 = -(v417.f64[0] * v413.f64[0]
                 - v209 * (v417.f64[0] * 134217728.0 - (v417.f64[0] * 134217728.0 - v417.f64[0]))
                 - (v413.f64[0] - v209) * (v417.f64[0] * 134217728.0 - (v417.f64[0] * 134217728.0 - v417.f64[0]))
                 - v209 * (v417.f64[0] - (v417.f64[0] * 134217728.0 - (v417.f64[0] * 134217728.0 - v417.f64[0])))
                 - (v413.f64[0] - v209)
                 * (v417.f64[0] - (v417.f64[0] * 134217728.0 - (v417.f64[0] * 134217728.0 - v417.f64[0]))));
          v220 = v218 - v219;
          v221 = v218 - (v218 - v219) - v219 + v218 - (v218 - v219 + v218 - (v218 - v219));
          v222 = v409 * v417.f64[1] + v218 - v219;
          v223 = v220 - (v222 - v409 * v417.f64[1]) + v409 * v417.f64[1] - (v222 - (v222 - v409 * v417.f64[1]));
          v224 = v223 - v417.f64[0] * v413.f64[0];
          v427[1] = v223 - v224 - v417.f64[0] * v413.f64[0] + v223 - (v224 + v223 - v224);
          v427[2] = v224 - (v222 + v224 - v222) + v222 - (v222 + v224 - (v222 + v224 - v222));
          v427[3] = v222 + v224;
          v187 = v195;
LABEL_79:
          v427[0] = v221;
          if (v407 == 0.0)
          {
            v196 = v187;
            v118 = v383;
            v232 = v425.f64[1];
          }
          else
          {
            v393 = v122;
            v225 = sub_1DEE5CEC4(v379, v449, v468, v407);
            v226 = sub_1DEE5CEC4(v217, v430, v443, v407);
            v227 = sub_1DEE5CEC4(v226, v443, v465, v422.f64[0] + v422.f64[0]);
            v228 = sub_1DEE5CCBC(v225, v468, v227, v465, v463);
            v229 = sub_1DEE5CCBC(v83, v152, v228, v463, v187);
            if (v417.f64[0] == 0.0)
            {
              v196 = v152;
              v152 = v187;
            }
            else
            {
              v230 = sub_1DEE5CEC4(4, v478, v469, v407);
              v231 = sub_1DEE5CEC4(v230, v469, v468, v417.f64[0]);
              v229 = sub_1DEE5CCBC(v229, v187, v231, v468, v152);
              v196 = v187;
            }
            v118 = v383;
            v232 = v425.f64[1];
            v233 = v4;
            if (v383 == 0.0)
            {
              v238 = v196;
              v196 = v152;
              v152 = v238;
              v237 = v407;
            }
            else
            {
              v234 = sub_1DEE5CEC4(4, v479, v469, -v407);
              v235 = sub_1DEE5CEC4(v234, v469, v468, v383);
              v236 = sub_1DEE5CCBC(v229, v152, v235, v468, v196);
              v237 = v407;
              v229 = v236;
              v238 = v152;
            }
            v239 = sub_1DEE5CEC4(v226, v443, v465, v237);
            v240 = sub_1DEE5CEC4(v216, v427, v437, v407);
            v241 = sub_1DEE5CEC4(v240, v437, v468, v422.f64[0] + v422.f64[0]);
            v242 = sub_1DEE5CEC4(v240, v437, v467, v407);
            v243 = sub_1DEE5CCBC(v241, v468, v242, v467, v464);
            v244 = sub_1DEE5CCBC(v239, v465, v243, v464, v462);
            v83 = sub_1DEE5CCBC(v229, v196, v244, v462, v238);
            v122 = v393;
            v4 = v233;
          }
          if (v413.f64[1] != 0.0)
          {
            v245 = sub_1DEE5CEC4(v376, v448, v468, v413.f64[1]);
            v246 = sub_1DEE5CEC4(v217, v430, v442, v413.f64[1]);
            v247 = sub_1DEE5CEC4(v246, v442, v465, v232 + v232);
            v248 = sub_1DEE5CCBC(v245, v468, v247, v465, v463);
            v249 = sub_1DEE5CCBC(v83, v152, v248, v463, v196);
            v250 = sub_1DEE5CEC4(v246, v442, v465, v413.f64[1]);
            v251 = sub_1DEE5CEC4(v216, v427, v436, v413.f64[1]);
            v252 = sub_1DEE5CEC4(v251, v436, v468, v232 + v232);
            v253 = sub_1DEE5CEC4(v251, v436, v467, v413.f64[1]);
            v254 = sub_1DEE5CCBC(v252, v468, v253, v467, v464);
            v255 = sub_1DEE5CCBC(v250, v465, v254, v464, v462);
            v256 = sub_1DEE5CCBC(v249, v196, v255, v462, v152);
            v257 = v413.f64[0];
            v83 = v256;
            v258 = v417.f64[0];
            v259 = v407;
            if (!v403)
              goto LABEL_112;
            goto LABEL_95;
          }
          v187 = v152;
          v197 = v409;
          v137 = v395;
LABEL_92:
          if (!v403)
          {
            v152 = v187;
            v257 = v413.f64[0];
            v258 = v417.f64[0];
LABEL_111:
            v259 = v407;
LABEL_112:
            if (!v405)
            {
              v187 = v152;
              return v187[v83 - 1];
            }
            if (!v389)
            {
              v431[0] = 0.0;
              v338 = 1;
              v342 = 0.0;
              v337 = 1;
              goto LABEL_118;
            }
            v187 = v152;
LABEL_115:
            v384 = v118;
            v319 = v259 * 134217728.0 - (v259 * 134217728.0 - v259);
            v320 = v259 - v319;
            v321 = -(v382 - v319 * v418 - v320 * v418 - v319 * v419 - v320 * v419);
            v322 = v422.f64[0] * v258;
            v323 = v258 * 134217728.0 - (v258 * 134217728.0 - v258);
            v324 = v258 - v323;
            v325 = v321 - (v422.f64[0] * v258 + v385 * v323 + v397 * v323 + v385 * (v258 - v323) - v400 * (v258 - v323));
            v326 = -(v422.f64[0] * v258 + v385 * v323 + v397 * v323 + v385 * (v258 - v323) - v400 * (v258 - v323))
                 - (v325
                  - v321)
                 + v321
                 - (v325
                  - (v325
                   - v321));
            v327 = v382 + v325;
            v328 = v325 - (v382 + v325 - v382) + v382 - (v382 + v325 - (v382 + v325 - v382));
            v474 = v326;
            v475 = v322 - (v322 + v328 - v328) + v328 - (v322 + v328 - (v322 + v328 - v328));
            v476 = v322 + v328 - (v327 + v322 + v328 - v327) + v327 - (v327 + v322 + v328 - (v327 + v322 + v328 - v327));
            v477 = v327 + v322 + v328;
            v329 = -(v425.f64[1] * v409);
            v330 = v409 * 134217728.0 - (v409 * 134217728.0 - v409);
            v331 = -(v329
                   - v330 * (v425.f64[1] * -134217728.0 - (v425.f64[1] + v425.f64[1] * -134217728.0))
                   - (v409 - v330) * (v425.f64[1] * -134217728.0 - (v425.f64[1] + v425.f64[1] * -134217728.0))
                   - v330 * (-v425.f64[1] - (v425.f64[1] * -134217728.0 - (v425.f64[1] + v425.f64[1] * -134217728.0)))
                   - (v409 - v330)
                   * (-v425.f64[1] - (v425.f64[1] * -134217728.0 - (v425.f64[1] + v425.f64[1] * -134217728.0))));
            v332 = v331
                 - (v381 * (v119 * -134217728.0 - (v119 + v119 * -134217728.0))
                  - v119 * v423.f64[0]
                  + v415 * (v119 * -134217728.0 - (v119 + v119 * -134217728.0))
                  + v381 * (-v119 - (v119 * -134217728.0 - (v119 + v119 * -134217728.0)))
                  - v420 * (-v119 - (v119 * -134217728.0 - (v119 + v119 * -134217728.0))));
            v333 = -(v381 * (v119 * -134217728.0 - (v119 + v119 * -134217728.0))
                   - v119 * v423.f64[0]
                   + v415 * (v119 * -134217728.0 - (v119 + v119 * -134217728.0))
                   + v381 * (-v119 - (v119 * -134217728.0 - (v119 + v119 * -134217728.0)))
                   - v420 * (-v119 - (v119 * -134217728.0 - (v119 + v119 * -134217728.0))))
                 - (v332
                  - v331)
                 + v331
                 - (v332
                  - (v332
                   - v331));
            v334 = v332 - v425.f64[1] * v409;
            v335 = v332 - (v334 - v329) + v329 - (v334 - (v334 - v329));
            v336 = v335 - v119 * v423.f64[0];
            v470 = v333;
            v471 = -(v119 * v423.f64[0]) - (v336 - v335) + v335 - (v336 - (v336 - v335));
            v472 = v336 - (v334 + v336 - v334) + v334 - (v334 + v336 - (v334 + v336 - v334));
            v473 = v334 + v336;
            v337 = 4;
            v338 = sub_1DEE5CCBC(4, &v474, 4, &v470, v431);
            v339 = -(v407 * v417.f64[0] - v319 * v323 - v320 * v323 - v319 * v324 - v320 * v324);
            v118 = v384;
            v340 = -(v119 * v409
                   - v330 * (v119 * 134217728.0 - (v119 * 134217728.0 - v119))
                   - (v409 - v330) * (v119 * 134217728.0 - (v119 * 134217728.0 - v119))
                   - v330 * (v119 - (v119 * 134217728.0 - (v119 * 134217728.0 - v119)))
                   - (v409 - v330) * (v119 - (v119 * 134217728.0 - (v119 * 134217728.0 - v119))));
            v341 = v339 - v340;
            v342 = v339 - (v339 - v340) - v340 + v339 - (v339 - v340 + v339 - (v339 - v340));
            v343 = v407 * v417.f64[0] + v341;
            v344 = v341 - (v343 - v407 * v417.f64[0]) + v407 * v417.f64[0] - (v343 - (v343 - v407 * v417.f64[0]));
            v345 = v344 - v119 * v409;
            v428[1] = v344 - v345 - v119 * v409 + v344 - (v345 + v344 - v345);
            v428[2] = v345 - (v343 + v345 - v343) + v343 - (v343 + v345 - (v343 + v345 - v343));
            v428[3] = v343 + v345;
            v152 = v187;
            v257 = v413.f64[0];
LABEL_118:
            v428[0] = v342;
            if (v257 == 0.0)
            {
              v187 = v152;
            }
            else
            {
              v346 = sub_1DEE5CEC4(v378, v445, v468, v257);
              v347 = sub_1DEE5CEC4(v338, v431, v439, v413.f64[0]);
              v348 = sub_1DEE5CEC4(v347, v439, v465, v425.f64[0] + v425.f64[0]);
              v349 = sub_1DEE5CCBC(v346, v468, v348, v465, v463);
              v350 = sub_1DEE5CCBC(v83, v152, v349, v463, v196);
              if (v119 == 0.0)
              {
                v353 = v152;
                v152 = v196;
              }
              else
              {
                v351 = sub_1DEE5CEC4(4, v479, v469, v413.f64[0]);
                v352 = sub_1DEE5CEC4(v351, v469, v468, v119);
                v350 = sub_1DEE5CCBC(v350, v196, v352, v468, v152);
                v353 = v196;
              }
              if (v417.f64[0] == 0.0)
              {
                v187 = v353;
                v353 = v152;
                v357 = v413.f64[0];
              }
              else
              {
                v354 = sub_1DEE5CEC4(4, v480, v469, -v413.f64[0]);
                v355 = sub_1DEE5CEC4(v354, v469, v468, v417.f64[0]);
                v356 = sub_1DEE5CCBC(v350, v152, v355, v468, v353);
                v357 = v413.f64[0];
                v350 = v356;
                v187 = v152;
              }
              v358 = sub_1DEE5CEC4(v347, v439, v465, v357);
              v359 = sub_1DEE5CEC4(v337, v428, v433, v413.f64[0]);
              v360 = sub_1DEE5CEC4(v359, v433, v468, v425.f64[0] + v425.f64[0]);
              v361 = sub_1DEE5CEC4(v359, v433, v467, v413.f64[0]);
              v362 = sub_1DEE5CCBC(v360, v468, v361, v467, v464);
              v363 = sub_1DEE5CCBC(v358, v465, v362, v464, v462);
              v83 = sub_1DEE5CCBC(v350, v353, v363, v462, v187);
              v196 = v353;
            }
            if (v118 != 0.0)
            {
              v364 = sub_1DEE5CEC4(v122, v444, v468, v118);
              v365 = sub_1DEE5CEC4(v338, v431, v438, v118);
              v366 = sub_1DEE5CEC4(v365, v438, v465, v421 + v421);
              v367 = sub_1DEE5CCBC(v364, v468, v366, v465, v463);
              v368 = sub_1DEE5CCBC(v83, v187, v367, v463, v196);
              v369 = sub_1DEE5CEC4(v365, v438, v465, v118);
              v370 = sub_1DEE5CEC4(v337, v428, v432, v118);
              v371 = sub_1DEE5CEC4(v370, v432, v468, v421 + v421);
              v372 = sub_1DEE5CEC4(v370, v432, v467, v118);
              v373 = sub_1DEE5CCBC(v371, v468, v372, v467, v464);
              v374 = sub_1DEE5CCBC(v369, v465, v373, v464, v462);
              v83 = sub_1DEE5CCBC(v368, v196, v374, v462, v187);
            }
            return v187[v83 - 1];
          }
          if (!v387)
          {
            v411 = v413.f64[1];
            v429[0] = 0.0;
            v280 = 1;
            v284 = 0.0;
            v279 = 1;
            goto LABEL_98;
          }
          v395 = v137;
          v152 = v187;
          v257 = v413.f64[0];
          v259 = v407;
LABEL_95:
          v260 = v257 * 134217728.0 - (v257 * 134217728.0 - v257);
          v261 = v257 - v260;
          v262 = -(v380 - v260 * v390 - (v257 - v260) * v390 - v260 * v391 - (v257 - v260) * v391);
          v263 = v425.f64[0] * v413.f64[1];
          v264 = v413.f64[1] * 134217728.0 - (v413.f64[1] * 134217728.0 - v413.f64[1]);
          v411 = v413.f64[1];
          v265 = v118;
          v266 = -(v425.f64[0] * v413.f64[1]
                 + v395 * v264
                 + v399 * v264
                 + v395 * (v413.f64[1] - v264)
                 - v401 * (v413.f64[1] - v264));
          v267 = v262
               - (v425.f64[0] * v413.f64[1]
                + v395 * v264
                + v399 * v264
                + v395 * (v413.f64[1] - v264)
                - v401 * (v413.f64[1] - v264));
          v268 = v266 - (v266 + v262 - v262) + v262 - (v266 + v262 - (v266 + v262 - v262));
          v269 = v380 + v267;
          v270 = v267 - (v380 + v267 - v380) + v380 - (v380 + v267 - (v380 + v267 - v380));
          v474 = v268;
          v475 = v263 - (v263 + v270 - v270) + v270 - (v263 + v270 - (v263 + v270 - v270));
          v476 = v263 + v270 - (v269 + v263 + v270 - v269) + v269 - (v269 + v263 + v270 - (v269 + v263 + v270 - v269));
          v477 = v269 + v425.f64[0] * v413.f64[1] + v270;
          v271 = v259 * 134217728.0 - (v259 * 134217728.0 - v259);
          v272 = v259 - v271;
          v273 = -(-(v421 * v259)
                 - v271 * (v421 * -134217728.0 - (v421 + v421 * -134217728.0))
                 - (v259 - v271) * (v421 * -134217728.0 - (v421 + v421 * -134217728.0))
                 - v271 * (-v421 - (v421 * -134217728.0 - (v421 + v421 * -134217728.0)))
                 - (v259 - v271) * (-v421 - (v421 * -134217728.0 - (v421 + v421 * -134217728.0))));
          v274 = v273
               - (v385 * (v265 * -134217728.0 - (v265 + v265 * -134217728.0))
                - v265 * v422.f64[0]
                + v397 * (v265 * -134217728.0 - (v265 + v265 * -134217728.0))
                + v385 * (-v265 - (v265 * -134217728.0 - (v265 + v265 * -134217728.0)))
                - v400 * (-v265 - (v265 * -134217728.0 - (v265 + v265 * -134217728.0))));
          v275 = -(v385 * (v265 * -134217728.0 - (v265 + v265 * -134217728.0))
                 - v265 * v422.f64[0]
                 + v397 * (v265 * -134217728.0 - (v265 + v265 * -134217728.0))
                 + v385 * (-v265 - (v265 * -134217728.0 - (v265 + v265 * -134217728.0)))
                 - v400 * (-v265 - (v265 * -134217728.0 - (v265 + v265 * -134217728.0))))
               - (v274
                - v273)
               + v273
               - (v274
                - (v274
                 - v273));
          v276 = v274 - v421 * v259;
          v277 = v274 - (v276 - -(v421 * v259)) + -(v421 * v259) - (v276 - (v276 - -(v421 * v259)));
          v278 = v277 - v118 * v422.f64[0];
          v470 = v275;
          v471 = -(v118 * v422.f64[0]) - (v278 - v277) + v277 - (v278 - (v278 - v277));
          v472 = v278 - (v276 + v278 - v276) + v276 - (v276 + v278 - (v276 + v278 - v276));
          v473 = v276 + v278;
          v279 = 4;
          v280 = sub_1DEE5CCBC(4, &v474, 4, &v470, v429);
          v281 = -(v413.f64[1] * v413.f64[0]
                 - v260 * v264
                 - v261 * v264
                 - v260 * (v413.f64[1] - v264)
                 - v261 * (v413.f64[1] - v264));
          v282 = -(v407 * v265
                 - v271 * (v265 * 134217728.0 - (v265 * 134217728.0 - v265))
                 - v272 * (v265 * 134217728.0 - (v265 * 134217728.0 - v265))
                 - v271 * (v265 - (v265 * 134217728.0 - (v265 * 134217728.0 - v265)))
                 - v272 * (v265 - (v265 * 134217728.0 - (v265 * 134217728.0 - v265))));
          v283 = v281 - v282;
          v284 = v281 - (v281 - v282) - v282 + v281 - (v281 - v282 + v281 - (v281 - v282));
          v285 = v413.f64[1] * v413.f64[0] + v281 - v282;
          v286 = v283 - (v285 - v411 * v413.f64[0]) + v411 * v413.f64[0] - (v285 - (v285 - v411 * v413.f64[0]));
          v287 = v286 - v407 * v118;
          v426[1] = v286 - v287 - v407 * v118 + v286 - (v287 + v286 - v287);
          v426[2] = v287 - (v285 + v287 - v285) + v285 - (v285 + v287 - (v285 + v287 - v285));
          v426[3] = v285 + v287;
          v187 = v152;
          v197 = v409;
LABEL_98:
          v426[0] = v284;
          if (v197 == 0.0)
          {
            v258 = v417.f64[0];
            v119 = v411;
          }
          else
          {
            v288 = sub_1DEE5CEC4(v4, v447, v468, v197);
            v289 = sub_1DEE5CEC4(v280, v429, v441, v409);
            v290 = sub_1DEE5CEC4(v289, v441, v465, v423.f64[0] + v423.f64[0]);
            v291 = sub_1DEE5CCBC(v288, v468, v290, v465, v463);
            v292 = sub_1DEE5CCBC(v83, v187, v291, v463, v196);
            if (v118 == 0.0)
            {
              v295 = v187;
              v187 = v196;
            }
            else
            {
              v293 = sub_1DEE5CEC4(4, v480, v469, v409);
              v294 = sub_1DEE5CEC4(v293, v469, v468, v118);
              v292 = sub_1DEE5CCBC(v292, v196, v294, v468, v187);
              v295 = v196;
            }
            v119 = v411;
            if (v411 == 0.0)
            {
              v300 = v295;
              v295 = v187;
              v187 = v300;
              v299 = v409;
            }
            else
            {
              v296 = sub_1DEE5CEC4(4, v478, v469, -v409);
              v297 = sub_1DEE5CEC4(v296, v469, v468, v411);
              v298 = sub_1DEE5CCBC(v292, v187, v297, v468, v295);
              v299 = v409;
              v292 = v298;
              v300 = v187;
            }
            v301 = sub_1DEE5CEC4(v289, v441, v465, v299);
            v302 = sub_1DEE5CEC4(v279, v426, v435, v409);
            v303 = sub_1DEE5CEC4(v302, v435, v468, v423.f64[0] + v423.f64[0]);
            v304 = sub_1DEE5CEC4(v302, v435, v467, v409);
            v305 = sub_1DEE5CCBC(v303, v468, v304, v467, v464);
            v306 = sub_1DEE5CCBC(v301, v465, v305, v464, v462);
            v83 = sub_1DEE5CCBC(v292, v295, v306, v462, v300);
            v196 = v295;
            v258 = v417.f64[0];
          }
          if (v258 != 0.0)
          {
            v307 = sub_1DEE5CEC4(v377, v446, v468, v258);
            v308 = sub_1DEE5CEC4(v280, v429, v440, v417.f64[0]);
            v309 = sub_1DEE5CEC4(v308, v440, v465, v424.f64[0] + v424.f64[0]);
            v310 = sub_1DEE5CCBC(v307, v468, v309, v465, v463);
            v311 = sub_1DEE5CCBC(v83, v187, v310, v463, v196);
            v312 = sub_1DEE5CEC4(v308, v440, v465, v417.f64[0]);
            v313 = sub_1DEE5CEC4(v279, v426, v434, v417.f64[0]);
            v314 = sub_1DEE5CEC4(v313, v434, v468, v424.f64[0] + v424.f64[0]);
            v315 = sub_1DEE5CEC4(v313, v434, v467, v417.f64[0]);
            v316 = sub_1DEE5CCBC(v314, v468, v315, v467, v464);
            v317 = sub_1DEE5CCBC(v312, v465, v316, v464, v462);
            v318 = sub_1DEE5CCBC(v311, v196, v317, v462, v187);
            v258 = v417.f64[0];
            v83 = v318;
            v259 = v407;
            if (!v405)
              return v187[v83 - 1];
            goto LABEL_115;
          }
          v152 = v187;
          v257 = v413.f64[0];
          goto LABEL_111;
        }
      }
    }
  }
  return v23;
}

double _simd_insphere_pd3(const double *a1)
{
  uint64_t v1;
  float64x2_t v2;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  int64x2_t v25;
  int64x2_t v26;
  double v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  double v32;
  double *v34;
  double v35;
  double v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  float64x2_t v46;
  float64x2_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  float64_t v52;
  float64x2_t v53;
  double v54;
  double v55;
  float64x2_t v56;
  double v57;
  float64_t v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  float64_t v64;
  float64_t v65;
  float64_t v66;
  float64_t v67;
  double v68;
  double v69;
  float64_t v70;
  double v71;
  double v72;
  double v73;
  double v74;
  float64_t v75;
  float64_t v76;
  float64_t v77;
  float64_t v78;
  float64x2_t v79;
  float64_t v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  float64_t v87;
  double v88;
  float64_t v89;
  double v90;
  double v91;
  double v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  int v117;
  int v118;
  int v119;
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;
  int v126;
  int v127;
  int v128;
  int v129;
  int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  int v136;
  int v137;
  double v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  int v144;
  int v145;
  int v146;
  int v147;
  int v148;
  uint64_t v149;
  double *v150;
  double v151;
  double v152;
  float64x2_t v154;
  float64x2_t v155;
  float64x2_t v156;
  float64x2_t v157;
  double v158;
  double v159;
  float64x2_t v160;
  float64x2_t v161;
  float64x2_t v162;
  float64x2_t v163;
  double v164;
  double v174;
  double v176;
  double v178;
  double v182;
  double v183;
  double v188;
  double v189;
  double v191;
  double v193;
  double v196;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  double v205;
  double v206;
  double v207;
  double v208;
  double v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  double v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double v224;
  double v225;
  double v226;
  double v227;
  double v228;
  double v229;
  double v230;
  double v231;
  double v232;
  double v233;
  double v234;
  double v235;
  double v236;
  double v237;
  double v238;
  double v239;
  double v240;
  double v241;
  double v242;
  double v243;
  double v244;
  double v245;
  double v246;
  double v247;
  double v248;
  double v249;
  double v250;
  double v251;
  double v252;
  double v253;
  double v254;
  double v255;
  double v256;
  double v257;
  double v258;
  double v259;
  double v260;
  double v261;
  double v262;
  double v263;
  double v264;
  double v265;
  double v266;
  double v267;
  double v268;
  double v269;
  double v270;
  double v271;
  double v272;
  double v273;
  double v274;
  double v275;
  double v276;
  double v277;
  double v278;
  double v279;
  double v280;
  double v281;
  double v282;
  double v283;
  double v284;
  double v285;
  double v286;
  double v287;
  double v288;
  double v289;
  double v290;
  double v291;
  double v292;
  double v293;
  double v294;
  double v295;
  double v296;
  double v297;
  double v298;
  double v299;
  double v300;
  double v301;
  double v302;
  double v303;
  int v304;
  double v305;
  int v306;
  int v307;
  double v308;
  int v309;
  int v310;
  int v311;
  int v312;
  double v313;
  int v314;
  int v315;
  int v316;
  int v317;
  int v318;
  double v319;
  int v320;
  int v321;
  int v322;
  int v323;
  int v324;
  int v325;
  int v326;
  int v327;
  int v328;
  int v329;
  int v330;
  int v331;
  int v332;
  int v333;
  int v334;
  int v335;
  int v336;
  int v337;
  int v338;
  int v339;
  int v340;
  int v341;
  int v342;
  int v343;
  int v344;
  int v345;
  int v346;
  int v347;
  int v348;
  int v349;
  int v350;
  int v351;
  int v352;
  int v353;
  int v354;
  int v355;
  int v356;
  uint64_t v357;
  double *v358;
  int v359;
  int v360;
  int v361;
  int v362;
  int v363;
  int v364;
  int v365;
  int v366;
  int v367;
  int v368;
  uint64_t v369;
  double *v370;
  int v371;
  double v372;
  int v373;
  int v374;
  double v375;
  int v376;
  int v377;
  int v378;
  int v379;
  int v380;
  int v381;
  int v382;
  int v383;
  uint64_t v384;
  double *v385;
  int v386;
  double v387;
  int v388;
  int v389;
  double v390;
  int v391;
  int v392;
  int v393;
  int v394;
  int v395;
  int v396;
  int v397;
  int v398;
  uint64_t v399;
  double *v400;
  int v401;
  double v402;
  int v403;
  int v404;
  double v405;
  int v406;
  int v407;
  int v408;
  int v409;
  int v410;
  int v411;
  int v412;
  int v413;
  uint64_t v414;
  double *v415;
  int v416;
  double v417;
  int v418;
  int v419;
  double v420;
  int v421;
  int v422;
  int v423;
  int v424;
  int v425;
  int v426;
  int v427;
  int v428;
  int v429;
  double v431;
  double v432;
  double v433;
  double v434;
  double v435;
  double v436;
  double v437;
  double v438;
  double v439;
  float64x2_t v440;
  float64x2_t v441;
  float64x2_t v442;
  double v443;
  float64x2_t v444;
  double v445;
  double v446;
  float64x2_t v447;
  float64x2_t v448;
  float64x2_t v449;
  float64x2_t v450;
  double v451;
  float64x2_t v452;
  double v453;
  float64x2_t v454;
  double v455;
  float64x2_t v456;
  double v457;
  double v458;
  double v459;
  double v460;
  double v461;
  double v462;
  double v463;
  double v464;
  double v465;
  float64x2_t v466;
  double v467;
  int v468;
  float64x2_t v469;
  int v470;
  float64x2_t v471;
  double v472;
  int v473;
  float64x2_t v474;
  double v475;
  int v476;
  float64x2_t v477;
  double v478;
  int v479;
  double v480;
  uint64_t v481;
  double v482[576];
  double v483[576];
  double v484[288];
  double v485[288];
  double v486[288];
  double v487[288];
  double v488[192];
  double v489[96];
  double v490[96];
  double v491[96];
  double v492[48];
  double v493[24];
  double v494[16];
  double v495[8];
  double v496[8];
  double v497[8];
  double v498[4];
  double v499[4];
  double v500[4];
  double v501[4];
  double v502[4];
  double v503[4];
  double v504[5760];
  double v505[3456];
  double v506[2304];
  double v507[2304];
  double v508[1152];
  double v509[1152];
  double v510[1152];
  double v511[1152];
  double v512[1152];
  double v513[768];
  double v514[384];
  double v515[384];
  double v516[384];
  double v517[192];
  double v518[96];
  double v519[96];
  double v520[96];
  double v521[96];
  double v522[96];
  double v523[48];
  double v524[48];
  double v525[24];
  double v526[24];
  double v527[24];
  double v528[24];
  double v529[24];
  double v530[24];
  double v531[24];
  double v532[24];
  double v533[24];
  double v534[24];
  double v535[16];
  double v536[8];
  double v537[8];
  double v538[4];
  double v539[4];
  double v540[4];
  double v541[4];
  double v542[4];
  double v543[4];
  double v544[4];
  double v545[4];
  double v546[4];
  double v547[5];

  MEMORY[0x1E0C86820](a1);
  v2 = *(float64x2_t *)(v1 + 16);
  v3 = *(float64x2_t *)(v1 + 32);
  v4 = *(float64x2_t *)(v1 + 64);
  v5 = vsubq_f64(v3, *(float64x2_t *)v1);
  v6 = vsubq_f64(*(float64x2_t *)(v1 + 48), v2);
  v6.f64[1] = vmulq_f64(v6, v6).f64[0] + vaddvq_f64(vmulq_f64(v5, v5));
  v7 = vsubq_f64(v4, *(float64x2_t *)v1);
  v8 = vsubq_f64(*(float64x2_t *)(v1 + 80), v2);
  v8.f64[1] = vmulq_f64(v8, v8).f64[0] + vaddvq_f64(vmulq_f64(v7, v7));
  v9 = vsubq_f64(*(float64x2_t *)(v1 + 96), *(float64x2_t *)v1);
  v10 = vsubq_f64(*(float64x2_t *)(v1 + 112), v2);
  v10.f64[1] = vmulq_f64(v10, v10).f64[0] + vaddvq_f64(vmulq_f64(v9, v9));
  v11 = vsubq_f64(*(float64x2_t *)(v1 + 128), *(float64x2_t *)v1);
  v12 = vsubq_f64(*(float64x2_t *)(v1 + 144), v2);
  v12.f64[1] = vmulq_f64(v12, v12).f64[0] + vaddvq_f64(vmulq_f64(v11, v11));
  v13 = (float64x2_t)vextq_s8((int8x16_t)v7, (int8x16_t)v8, 8uLL);
  v14 = (float64x2_t)vextq_s8((int8x16_t)v8, (int8x16_t)v7, 8uLL);
  v15 = (float64x2_t)vextq_s8((int8x16_t)v9, (int8x16_t)v10, 8uLL);
  v16 = (float64x2_t)vextq_s8((int8x16_t)v10, (int8x16_t)v9, 8uLL);
  v17 = (float64x2_t)vextq_s8((int8x16_t)v11, (int8x16_t)v12, 8uLL);
  v18 = (float64x2_t)vextq_s8((int8x16_t)v12, (int8x16_t)v11, 8uLL);
  v19 = vmulq_f64(v16, v12);
  v20 = vmulq_f64(v15, v11);
  v21 = vmulq_f64(v15, v18);
  v22 = vmulq_f64(v16, v17);
  v23 = vmulq_f64(v10, v17);
  v24 = vmulq_f64(v9, v18);
  v25 = (int64x2_t)vmulq_f64(v6, vmlaq_f64(vmlaq_f64(vmulq_f64(v7, vmlaq_f64(vnegq_f64(v22), v18, v15)), vmlaq_f64(vnegq_f64(v20), v17, v9), v14), vmlaq_f64(vnegq_f64(v24), v11, v16), v13));
  v26 = (int64x2_t)vmulq_f64(v5, vmlaq_f64(vmlaq_f64(vmulq_f64(v8, vmlaq_f64(vnegq_f64(v21), v17, v16)), vmlaq_f64(vnegq_f64(v19), v18, v10), v13), vmlaq_f64(vnegq_f64(v23), v12, v15), v14));
  v27 = vaddvq_f64(vsubq_f64((float64x2_t)vzip1q_s64(v26, v25), (float64x2_t)vzip2q_s64(v26, v25)));
  v28 = vabsq_f64(v14);
  v29 = vabsq_f64(v13);
  v30 = vabdq_f64(v4, *(float64x2_t *)v1);
  v31 = vaddq_f64(vabsq_f64(v22), vabsq_f64(v21));
  v32 = vaddvq_f64(vaddq_f64(vmulq_f64(vmlaq_f64(vmlaq_f64(vmulq_f64(v31, vabsq_f64(v8)), vaddq_f64(vabsq_f64(vmulq_f64(v10, v18)), vabsq_f64(v19)), v29), vaddq_f64(vabsq_f64(vmulq_f64(v15, v12)), vabsq_f64(v23)), v28), vabdq_f64(v3, *(float64x2_t *)v1)), vmulq_f64(vmlaq_f64(vmlaq_f64(vmulq_f64(v31, v30), vaddq_f64(vabsq_f64(vmulq_f64(v9, v17)), vabsq_f64(v20)), v28), vaddq_f64(vabsq_f64(vmulq_f64(v16, v11)), vabsq_f64(v24)), v29), vabsq_f64(v6))));
  if (v27 <= v32 * 1.77635684e-15 && v32 * 1.77635684e-15 >= -v27)
  {
    v34 = (double *)v1;
    v460 = v32;
    v445 = *(double *)(v1 + 128);
    v446 = *(double *)(v1 + 136);
    v35 = v445 - *(double *)v1;
    v443 = *(double *)(v1 + 8);
    v36 = v446 - v443;
    v37.f64[0] = *(float64_t *)(v1 + 48);
    v38.f64[0] = *(float64_t *)(v1 + 16);
    v465 = v38.f64[0];
    v37.f64[1] = *(float64_t *)(v1 + 64);
    v38.f64[1] = *(float64_t *)v1;
    v450 = v37;
    v452 = *(float64x2_t *)(v1 + 72);
    v441 = (float64x2_t)vextq_s8(*(int8x16_t *)v1, *(int8x16_t *)v1, 8uLL);
    v442 = v38;
    v39 = vsubq_f64(v37, v38);
    v454 = *(float64x2_t *)v1;
    v456 = *(float64x2_t *)(v1 + 96);
    v40 = vsubq_f64(v456, *(float64x2_t *)v1);
    v440 = *(float64x2_t *)(v1 + 8);
    v79 = vsubq_f64(v452, v440);
    v448 = (float64x2_t)vextq_s8(*(int8x16_t *)(v1 + 32), *(int8x16_t *)(v1 + 32), 8uLL);
    v41 = vsubq_f64(v448, v441);
    v42 = vmuld_lane_f64(134217728.0, v41, 1);
    v43 = v42 - (v42 - v41.f64[1]);
    v44 = 134217728.0 * v79.f64[0] - (134217728.0 * v79.f64[0] - v79.f64[0]);
    v459 = vmuld_lane_f64(v41.f64[0], v39, 1);
    v45 = vmuld_lane_f64(134217728.0, v39, 1);
    v46 = v39;
    v477 = v39;
    v39.f64[0] = v45 - (v45 - v39.f64[1]);
    v463 = v39.f64[1];
    v47 = v41;
    v48 = 134217728.0 * v41.f64[0] - (134217728.0 * v41.f64[0] - v41.f64[0]);
    v41.f64[0] = vmuld_lane_f64(134217728.0, v40, 1);
    v462 = v40.f64[1];
    v41.f64[0] = v41.f64[0] - (v41.f64[0] - v40.f64[1]);
    v49 = 134217728.0 * v40.f64[0] - (134217728.0 * v40.f64[0] - v40.f64[0]);
    v50 = v36 * 134217728.0 - (v36 * 134217728.0 - v36);
    v51 = v35 * 134217728.0 - (v35 * 134217728.0 - v35);
    v52 = v47.f64[0] - v48;
    v53 = v40;
    v54 = vmuld_lane_f64(v39.f64[1], v40, 1);
    v40.f64[0] = v40.f64[0] - v49;
    v55 = (v446 - v443) * v53.f64[0];
    v56 = v53;
    v57 = v55 - v49 * v50 - v40.f64[0] * v50;
    v464 = v41.f64[1];
    v53.f64[0] = vmuld_lane_f64(v446 - v443, v47, 1);
    v58 = v53.f64[0] - v43 * v50 - (v41.f64[1] - v43) * v50;
    v59 = vmuld_lane_f64(v446 - v443, v46, 1);
    v46.f64[0] = v59 - v39.f64[0] * v50 - (v39.f64[1] - v39.f64[0]) * v50;
    v60 = v446 - v443 - v50;
    v61 = -(v459
          - v39.f64[0] * v48
          - (v39.f64[1] - v39.f64[0]) * v48
          - v39.f64[0] * (v47.f64[0] - v48)
          - (v39.f64[1] - v39.f64[0]) * (v47.f64[0] - v48));
    v62 = -(v54
          - v39.f64[0] * v41.f64[0]
          - (v39.f64[1] - v39.f64[0]) * v41.f64[0]
          - v39.f64[0] * (v40.f64[1] - v41.f64[0])
          - (v39.f64[1] - v39.f64[0]) * (v40.f64[1] - v41.f64[0]));
    v39.f64[0] = -(v46.f64[0] - v39.f64[0] * v60 - (v39.f64[1] - v39.f64[0]) * v60);
    v63 = -(v57 - v49 * v60 - v40.f64[0] * v60);
    v64 = -(v58 - v43 * v60 - (v41.f64[1] - v43) * v60);
    v46.f64[0] = vmuld_lane_f64(v35, v56, 1);
    v38.f64[0] = vmuld_lane_f64(v41.f64[1], v56, 1);
    v471 = v47;
    v474 = v56;
    v56.f64[0] = vmuld_lane_f64(v79.f64[0], v47, 1);
    v65 = -(v56.f64[0]
          - v43 * v44
          - (v41.f64[1] - v43) * v44
          - v43 * (v79.f64[0] - v44)
          - (v41.f64[1] - v43) * (v79.f64[0] - v44));
    v66 = -(v38.f64[0]
          - v43 * v41.f64[0]
          - (v41.f64[1] - v43) * v41.f64[0]
          - v43 * (v40.f64[1] - v41.f64[0])
          - (v41.f64[1] - v43) * (v40.f64[1] - v41.f64[0]));
    v67 = -(v46.f64[0]
          - v51 * v41.f64[0]
          - (v35 - v51) * v41.f64[0]
          - v51 * (v40.f64[1] - v41.f64[0])
          - (v35 - v51) * (v40.f64[1] - v41.f64[0]));
    v68 = v35 * v47.f64[0] - v51 * v48 - (v35 - v51) * v48;
    v41.f64[0] = vmuld_n_f64(v474.f64[0], v47.f64[0]);
    v69 = vmuld_n_f64(v474.f64[0], v79.f64[0]);
    v70 = v41.f64[0] - v49 * v48 - v40.f64[0] * v48 - v49 * (v47.f64[0] - v48);
    v71 = -(v69 - v49 * v44 - v40.f64[0] * v44 - v49 * (v79.f64[0] - v44) - v40.f64[0] * (v79.f64[0] - v44));
    v40.f64[0] = -(v70 - v40.f64[0] * v52);
    v72 = -(v68 - v51 * v52 - (v35 - v51) * v52);
    v73 = v35 * v79.f64[0];
    v469 = v79;
    v74 = -(v35 * v79.f64[0]
          - v51 * v44
          - (v35 - v51) * v44
          - v51 * (v79.f64[0] - v44)
          - (v35 - v51) * (v79.f64[0] - v44));
    v75 = v65 - v61;
    v76 = v65 - (v65 - v61) - v61 + v65 - (v65 - v61 + v65 - (v65 - v61));
    v77 = v56.f64[0] + v65 - v61;
    v78 = v75 - (v77 - v56.f64[0]) + v56.f64[0] - (v77 - (v77 - v56.f64[0]));
    v503[0] = v76;
    v503[1] = v78 - (v78 - v459) - v459 + v78 - (v78 - v459 + v78 - (v78 - v459));
    v79.f64[0] = v77 + v78 - v459;
    v80 = v78 - v459 - (v79.f64[0] - v77) + v77 - (v79.f64[0] - (v79.f64[0] - v77));
    v81 = v54 + v62 - v71;
    v56.f64[0] = v62 - v71 - (v81 - v54) + v54 - (v81 - (v81 - v54));
    v502[0] = v62 - (v62 - v71) - v71 + v62 - (v62 - v71 + v62 - (v62 - v71));
    v502[1] = v56.f64[0] - (v56.f64[0] - v69) - v69 + v56.f64[0] - (v56.f64[0] - v69 + v56.f64[0] - (v56.f64[0] - v69));
    v82 = v81 + v56.f64[0] - v69;
    v502[2] = v56.f64[0] - v69 - (v82 - v81) + v81 - (v82 - (v82 - v81));
    v83 = v55 + v63 - v67;
    v56.f64[0] = v63 - v67 - (v83 - v55) + v55 - (v83 - (v83 - v55));
    v501[0] = v63 - (v63 - v67) - v67 + v63 - (v63 - v67 + v63 - (v63 - v67));
    v501[1] = v56.f64[0]
            - (v56.f64[0]
             - v46.f64[0])
            - v46.f64[0]
            + v56.f64[0]
            - (v56.f64[0]
             - v46.f64[0]
             + v56.f64[0]
             - (v56.f64[0]
              - v46.f64[0]));
    v84 = v83 + v56.f64[0] - v46.f64[0];
    v501[2] = v56.f64[0] - v46.f64[0] - (v84 - v83) + v83 - (v84 - (v84 - v83));
    v85 = v35 * v47.f64[0] + v72 - v64;
    v56.f64[0] = v72 - v64 - (v85 - v35 * v47.f64[0]) + v35 * v47.f64[0] - (v85 - (v85 - v35 * v47.f64[0]));
    v500[0] = v72 - (v72 - v64) - v64 + v72 - (v72 - v64 + v72 - (v72 - v64));
    v500[1] = v56.f64[0]
            - (v56.f64[0]
             - v53.f64[0])
            - v53.f64[0]
            + v56.f64[0]
            - (v56.f64[0]
             - v53.f64[0]
             + v56.f64[0]
             - (v56.f64[0]
              - v53.f64[0]));
    v86 = v85 + v56.f64[0] - v53.f64[0];
    v56.f64[0] = v56.f64[0] - v53.f64[0] - (v86 - v85) + v85 - (v86 - (v86 - v85));
    v87 = v38.f64[0] + v66 - v40.f64[0];
    v38.f64[0] = v66 - v40.f64[0] - (v87 - v38.f64[0]) + v38.f64[0] - (v87 - (v87 - v38.f64[0]));
    v499[0] = v66 - (v66 - v40.f64[0]) - v40.f64[0] + v66 - (v66 - v40.f64[0] + v66 - (v66 - v40.f64[0]));
    v499[1] = v38.f64[0]
            - (v38.f64[0]
             - v41.f64[0])
            - v41.f64[0]
            + v38.f64[0]
            - (v38.f64[0]
             - v41.f64[0]
             + v38.f64[0]
             - (v38.f64[0]
              - v41.f64[0]));
    v88 = v87 + v38.f64[0] - v41.f64[0];
    v499[2] = v38.f64[0] - v41.f64[0] - (v88 - v87) + v87 - (v88 - (v88 - v87));
    v38.f64[0] = v39.f64[0] - v74;
    v89 = v39.f64[0] - (v39.f64[0] - v74) - v74 + v39.f64[0] - (v39.f64[0] - v74 + v39.f64[0] - (v39.f64[0] - v74));
    v39.f64[0] = v59 + v38.f64[0];
    v38.f64[0] = v38.f64[0] - (v59 + v38.f64[0] - v59) + v59 - (v59 + v38.f64[0] - (v59 + v38.f64[0] - v59));
    v498[0] = v89;
    v498[1] = v38.f64[0] - (v38.f64[0] - v73) - v73 + v38.f64[0] - (v38.f64[0] - v73 + v38.f64[0] - (v38.f64[0] - v73));
    v438 = *(double *)(v1 + 112);
    v90 = v438 - v465;
    v503[2] = v80;
    v91 = *(double *)(v1 + 144);
    v503[3] = v79.f64[0];
    v436 = v84;
    v437 = v82;
    v502[3] = v82;
    v501[3] = v84;
    v500[2] = v56.f64[0];
    v439 = v91;
    v92 = v91 - v465;
    v434 = v88;
    v435 = v86;
    v500[3] = v86;
    v499[3] = v88;
    v498[2] = v38.f64[0]
            - v73
            - (v39.f64[0]
             + v38.f64[0]
             - v73
             - v39.f64[0])
            + v39.f64[0]
            - (v39.f64[0]
             + v38.f64[0]
             - v73
             - (v39.f64[0]
              + v38.f64[0]
              - v73
              - v39.f64[0]));
    v433 = v39.f64[0] + v38.f64[0] - v73;
    v498[3] = v433;
    v93 = sub_1DEE5CEC4(4, v501, v497, v79.f64[1]);
    v94 = sub_1DEE5CEC4(4, v498, v496, -(v438 - v465));
    v95 = sub_1DEE5CEC4(4, v502, v495, v92);
    v96 = sub_1DEE5CCBC(v93, v497, v94, v496, v494);
    v97 = sub_1DEE5CCBC(v95, v495, v96, v494, v493);
    v98 = sub_1DEE5CEC4(v97, v493, v492, v464);
    v99 = sub_1DEE5CEC4(v98, v492, v491, -v464);
    v100 = sub_1DEE5CEC4(v97, v493, v492, v47.f64[0]);
    v101 = sub_1DEE5CEC4(v100, v492, v490, -v47.f64[0]);
    v102 = sub_1DEE5CEC4(v97, v493, v492, v477.f64[0]);
    v103 = sub_1DEE5CEC4(v102, v492, v489, -v477.f64[0]);
    v104 = sub_1DEE5CCBC(v99, v491, v101, v490, v488);
    v105 = sub_1DEE5CCBC(v104, v488, v103, v489, v487);
    v106 = sub_1DEE5CEC4(4, v500, v497, v438 - v465);
    v107 = sub_1DEE5CEC4(4, v499, v496, v92);
    v108 = sub_1DEE5CEC4(4, v501, v495, v477.f64[0]);
    v109 = sub_1DEE5CCBC(v106, v497, v107, v496, v494);
    v110 = sub_1DEE5CCBC(v108, v495, v109, v494, v493);
    v111 = sub_1DEE5CEC4(v110, v493, v492, v463);
    v112 = sub_1DEE5CEC4(v111, v492, v491, v463);
    v113 = sub_1DEE5CEC4(v110, v493, v492, v469.f64[0]);
    v114 = sub_1DEE5CEC4(v113, v492, v490, v469.f64[0]);
    v115 = sub_1DEE5CEC4(v110, v493, v492, v79.f64[1]);
    v116 = sub_1DEE5CEC4(v115, v492, v489, v79.f64[1]);
    v117 = sub_1DEE5CCBC(v112, v491, v114, v490, v488);
    v118 = sub_1DEE5CCBC(v117, v488, v116, v489, v486);
    v119 = sub_1DEE5CEC4(4, v503, v497, v92);
    v120 = sub_1DEE5CEC4(4, v498, v496, v477.f64[0]);
    v121 = sub_1DEE5CEC4(4, v500, v495, v79.f64[1]);
    v122 = sub_1DEE5CCBC(v119, v497, v120, v496, v494);
    v123 = sub_1DEE5CCBC(v121, v495, v122, v494, v493);
    v124 = sub_1DEE5CEC4(v123, v493, v492, v474.f64[0]);
    v125 = sub_1DEE5CEC4(v124, v492, v491, -v474.f64[0]);
    v126 = sub_1DEE5CEC4(v123, v493, v492, v462);
    v127 = sub_1DEE5CEC4(v126, v492, v490, -v462);
    v128 = sub_1DEE5CEC4(v123, v493, v492, v438 - v465);
    v432 = -(v438 - v465);
    v129 = sub_1DEE5CEC4(v128, v492, v489, v432);
    v130 = sub_1DEE5CCBC(v125, v491, v127, v490, v488);
    v131 = sub_1DEE5CCBC(v130, v488, v129, v489, v485);
    v132 = sub_1DEE5CEC4(4, v502, v497, v477.f64[0]);
    v133 = sub_1DEE5CEC4(4, v499, v496, -v79.f64[1]);
    v134 = sub_1DEE5CEC4(4, v503, v495, v438 - v465);
    v135 = sub_1DEE5CCBC(v132, v497, v133, v496, v494);
    v136 = sub_1DEE5CCBC(v134, v495, v135, v494, v493);
    v137 = sub_1DEE5CEC4(v136, v493, v492, v35);
    v138 = v92;
    v139 = sub_1DEE5CEC4(v137, v492, v491, v35);
    v140 = sub_1DEE5CEC4(v136, v493, v492, v446 - v443);
    v458 = v446 - v443;
    v141 = sub_1DEE5CEC4(v140, v492, v490, v446 - v443);
    v142 = sub_1DEE5CEC4(v136, v493, v492, v92);
    v143 = sub_1DEE5CEC4(v142, v492, v489, v92);
    v144 = sub_1DEE5CCBC(v139, v491, v141, v490, v488);
    v145 = sub_1DEE5CCBC(v144, v488, v143, v489, v484);
    v146 = sub_1DEE5CCBC(v105, v487, v118, v486, v483);
    v147 = sub_1DEE5CCBC(v131, v485, v145, v484, v482);
    v148 = sub_1DEE5CCBC(v146, v483, v147, v482, &v480);
    v27 = v480;
    if (v148 < 2)
    {
      v151 = v460;
    }
    else
    {
      v149 = v148 - 1;
      v150 = (double *)&v481;
      v151 = v460;
      do
      {
        v152 = *v150++;
        v27 = v27 + v152;
        --v149;
      }
      while (v149);
    }
    if (v27 < v151 * 5.55111512e-16 && v151 * 5.55111512e-16 > -v27)
    {
      v461 = -v79.f64[1];
      v154 = vsubq_f64(v456, v474);
      v155 = vsubq_f64(v452, v469);
      v156 = vsubq_f64(v450, v477);
      v157 = vsubq_f64(v448, v471);
      v431 = v438 - v465;
      v158 = v446 - v36 - v443 + v446 - (v36 + v446 - v36);
      v159 = v439 - v138 - v465 + v439 - (v138 + v439 - v138);
      v160 = vaddq_f64(vsubq_f64(v157, v441), vsubq_f64(v448, vaddq_f64(v471, v157)));
      v161 = vaddq_f64(vsubq_f64(v156, v442), vsubq_f64(v450, vaddq_f64(v477, v156)));
      v162 = vaddq_f64(vsubq_f64(v155, v440), vsubq_f64(v452, vaddq_f64(v469, v155)));
      v163 = vaddq_f64(vsubq_f64(v154, v454), vsubq_f64(v456, vaddq_f64(v474, v154)));
      if ((vmaxv_u8((uint8x8_t)vmovn_s16((int16x8_t)vmvnq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_f64(v160), (int32x4_t)vceqzq_f64(v161)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_f64(v162), (int32x4_t)vceqzq_f64(v163)))))) & 1) != 0|| v438 - v90 - v465 + v438 - (v90 + v438 - v90) != 0.0|| v445 - v35 - v454.f64[0] + v445 - (v35 + v445 - v35) != 0.0|| v158 != 0.0|| v159 != 0.0)
      {
        v453 = v438 - v90 - v465 + v438 - (v90 + v438 - v90);
        v447 = v161;
        v449 = v163;
        v466 = v160;
        v444 = v162;
        v164 = v445 - v35 - v454.f64[0] + v445 - (v35 + v445 - v35);
        v457 = fabsl(v27) * 3.33066907e-16 + v151 * 8.75142567e-31;
        _D21 = v463;
        _D29 = v464;
        _D18 = v471.f64[0];
        _V17.D[1] = v447.f64[1];
        _V15.D[1] = v449.f64[1];
        __asm { FMLA            D2, D18, V17.D[1] }
        v174 = vmlad_n_f64(vmuld_lane_f64(v469.f64[0], v466, 1), v464, v444.f64[0]) - _D2;
        __asm { FMLA            D2, D21, V15.D[1] }
        v176 = _D2 - vmlad_n_f64(v474.f64[0] * v444.f64[0], v469.f64[0], v449.f64[0]);
        _D31 = v458;
        v178 = v458 * v449.f64[0] + v474.f64[0] * v158 - (vmuld_lane_f64(v35, v449, 1) + v462 * v164);
        _V0.D[1] = v466.f64[1];
        __asm { FMLA            D5, D31, V0.D[1] }
        v451 = vmlad_n_f64(v471.f64[0] * v164, v35, v466.f64[0]) - _D5;
        __asm { FMLA            D5, D29, V15.D[1] }
        v182 = _D5 - vmlad_n_f64(v474.f64[0] * v466.f64[0], v471.f64[0], v449.f64[0]);
        v183 = v138;
        _D13 = v79.f64[1];
        _D27 = v435;
        _D26 = v436;
        _V4.D[1] = v444.f64[1];
        v455 = (_D31 * _D31 + v35 * v35 + v183 * v183)
             * (v182 * v461
              + v477.f64[0] * v176
              + v431 * v174
              + vmlad_n_f64(-(v444.f64[1] * v434), v437, v447.f64[0])
              + v453 * v79.f64[0])
             + (v469.f64[0] * v469.f64[0] + _D21 * _D21 + _D13 * _D13)
             * (v138 * v182
              + v431 * v451
              + v477.f64[0] * v178
              + vmlad_n_f64(v159 * v434 + v453 * v435, v436, v447.f64[0]));
        v188 = vmuld_lane_f64(v458, v447, 1) + v463 * v158 - (v35 * v444.f64[0] + v469.f64[0] * v164);
        v189 = v188 * v432 + v79.f64[1] * v178 + v138 * v176;
        __asm { FMLA            D3, D26, V4.D[1] }
        v191 = v189 + _D3 + v159 * v437;
        __asm { FMLA            D3, D27, V4.D[1] }
        v193 = (v462 * v462 + v474.f64[0] * v474.f64[0] + v431 * v431)
             * (v477.f64[0] * v188 + v138 * v174 + v79.f64[1] * v451 + _D3)
             + (_D18 * _D18 + _D29 * _D29 + v477.f64[0] * v477.f64[0]) * v191;
        __asm
        {
          FMLA            D3, D21, V17.D[1]
          FMLA            D3, D13, V4.D[1]
        }
        v196 = (v458 * v158 + v35 * v164 + v183 * v159) * (v434 * v461 + v477.f64[0] * v437 + v431 * v79.f64[0])
             + _D3 * (v183 * v434 + v431 * v435 + v477.f64[0] * v436);
        _V0.D[1] = v466.f64[1];
        __asm { FMLA            D3, D29, V0.D[1] }
        v27 = v455
            - v193
            + (v196
             - ((vmlad_n_f64(vmuld_lane_f64(v462, v449, 1), v474.f64[0], v449.f64[0]) + v431 * v453)
              * (v477.f64[0] * v433 + v183 * v79.f64[0] + v79.f64[1] * v435)
              + vmlad_n_f64(_D3, v477.f64[0], v447.f64[0]) * (v433 * v432 + v79.f64[1] * v436 + v183 * v437)))
            * 2.0
            + v27;
        if (v27 < v457 && v457 > -v27)
        {
          v201 = v34[8];
          v200 = v34[9];
          v202 = v34[4];
          v203 = v34[5];
          v204 = v202 * 134217728.0 - (v202 * 134217728.0 - v202);
          v205 = v200 * 134217728.0 - (v200 * 134217728.0 - v200);
          v475 = v200;
          v206 = -(v202 * v200
                 - v204 * v205
                 - (v202 - v204) * v205
                 - v204 * (v200 - v205)
                 - (v202 - v204) * (v200 - v205));
          v207 = v201 * 134217728.0 - (v201 * 134217728.0 - v201);
          v478 = v201;
          v208 = v203 * 134217728.0 - (v203 * 134217728.0 - v203);
          v209 = -(v201 * v203
                 - v207 * v208
                 - (v201 - v207) * v208
                 - v207 * (v203 - v208)
                 - (v201 - v207) * (v203 - v208));
          v210 = v206 - v209;
          v211 = v206 - (v206 - v209) - v209 + v206 - (v206 - v209 + v206 - (v206 - v209));
          v212 = v202 * v200 + v210;
          v213 = v210 - (v212 - v202 * v200) + v202 * v200 - (v212 - (v212 - v202 * v200));
          v214 = v213 - v201 * v203;
          v547[0] = v211;
          v547[1] = v213 - v214 - v201 * v203 + v213 - (v214 + v213 - v214);
          v547[2] = v214 - (v212 + v214 - v212) + v212 - (v212 + v214 - (v212 + v214 - v212));
          v547[3] = v212 + v214;
          v216 = v34[12];
          v215 = v34[13];
          v217 = v215 * 134217728.0 - (v215 * 134217728.0 - v215);
          v218 = v215 - v217;
          v472 = v201 - v207;
          v219 = -(v201 * v215
                 - v207 * v217
                 - (v201 - v207) * v217
                 - v207 * (v215 - v217)
                 - (v201 - v207) * (v215 - v217));
          v220 = v216 * 134217728.0 - (v216 * 134217728.0 - v216);
          v467 = v200 - v205;
          v221 = -(v200 * v216
                 - v220 * v205
                 - (v216 - v220) * v205
                 - v220 * (v200 - v205)
                 - (v216 - v220) * (v200 - v205));
          v222 = v219 - v221;
          v223 = v219 - (v219 - v221) - v221 + v219 - (v219 - v221 + v219 - (v219 - v221));
          v224 = v201 * v215 + v222;
          v225 = v222 - (v224 - v201 * v215) + v201 * v215 - (v224 - (v224 - v201 * v215));
          v226 = v225 - v200 * v216;
          v546[0] = v223;
          v546[1] = v225 - v226 - v200 * v216 + v225 - (v226 + v225 - v226);
          v546[2] = v226 - (v224 + v226 - v224) + v224 - (v224 + v226 - (v224 + v226 - v224));
          v546[3] = v224 + v226;
          v228 = v34[16];
          v227 = v34[17];
          v229 = v227 * 134217728.0 - (v227 * 134217728.0 - v227);
          v230 = -(v216 * v227
                 - v220 * v229
                 - (v216 - v220) * v229
                 - v220 * (v227 - v229)
                 - (v216 - v220) * (v227 - v229));
          v231 = v228 * 134217728.0 - (v228 * 134217728.0 - v228);
          v232 = -(v215 * v228
                 - v231 * v217
                 - (v228 - v231) * v217
                 - v231 * (v215 - v217)
                 - (v228 - v231) * (v215 - v217));
          v233 = v230 - v232;
          v234 = v230 - (v230 - v232) - v232 + v230 - (v230 - v232 + v230 - (v230 - v232));
          v235 = v216 * v227 + v233;
          v236 = v233 - (v235 - v216 * v227) + v216 * v227 - (v235 - (v235 - v216 * v227));
          v237 = v236 - v215 * v228;
          v545[0] = v234;
          v545[1] = v236 - v237 - v215 * v228 + v236 - (v237 + v236 - v237);
          v545[2] = v237 - (v235 + v237 - v235) + v235 - (v235 + v237 - (v235 + v237 - v235));
          v545[3] = v235 + v237;
          v238 = *v34;
          v239 = v34[1];
          v240 = v239 * 134217728.0 - (v239 * 134217728.0 - v239);
          v241 = -(v228 * v239
                 - v231 * v240
                 - (v228 - v231) * v240
                 - v231 * (v239 - v240)
                 - (v228 - v231) * (v239 - v240));
          v242 = *v34 * 134217728.0 - (*v34 * 134217728.0 - *v34);
          v243 = v227 * *v34;
          v244 = *v34 - v242;
          v245 = -(v243 - v242 * v229 - v244 * v229 - v242 * (v227 - v229) - v244 * (v227 - v229));
          v246 = v241 - v245;
          v247 = v241 - (v241 - v245) - v245 + v241 - (v241 - v245 + v241 - (v241 - v245));
          v248 = v228 * v239 + v241 - v245;
          v249 = v246 - (v248 - v228 * v239) + v228 * v239 - (v248 - (v248 - v228 * v239));
          v250 = v249 - v243;
          v544[0] = v247;
          v544[1] = v249 - (v249 - v243) - v243 + v249 - (v249 - v243 + v249 - (v249 - v243));
          v251 = v248 + v249 - v243;
          v544[2] = v250 - (v251 - v248) + v248 - (v251 - (v251 - v248));
          v544[3] = v251;
          v252 = -(v203 * v238 - v242 * v208 - v244 * v208 - v242 * (v203 - v208) - v244 * (v203 - v208));
          v253 = -(v202 * v239
                 - v204 * v240
                 - (v202 - v204) * v240
                 - v204 * (v239 - v240)
                 - (v202 - v204) * (v239 - v240));
          v254 = v252 - v253;
          v255 = v252 - (v252 - v253) - v253 + v252 - (v252 - v253 + v252 - (v252 - v253));
          v256 = v203 * v238 + v254;
          v257 = v254 - (v256 - v203 * v238) + v203 * v238 - (v256 - (v256 - v203 * v238));
          v258 = v257 - v202 * v239;
          v543[0] = v255;
          v543[1] = v257 - v258 - v202 * v239 + v257 - (v258 + v257 - v258);
          v543[2] = v258 - (v256 + v258 - v256) + v256 - (v256 + v258 - (v256 + v258 - v256));
          v543[3] = v256 + v258;
          v259 = -(v202 * v215
                 - v204 * v217
                 - (v202 - v204) * v217
                 - v204 * (v215 - v217)
                 - (v202 - v204) * (v215 - v217));
          v260 = -(v203 * v216
                 - v220 * v208
                 - (v216 - v220) * v208
                 - v220 * (v203 - v208)
                 - (v216 - v220) * (v203 - v208));
          v261 = v259 - v260;
          v262 = v259 - (v259 - v260) - v260 + v259 - (v259 - v260 + v259 - (v259 - v260));
          v263 = v202 * v215 + v261;
          v264 = v261 - (v263 - v202 * v215) + v202 * v215 - (v263 - (v263 - v202 * v215));
          v265 = v264 - v203 * v216;
          v542[0] = v262;
          v542[1] = v264 - v265 - v203 * v216 + v264 - (v265 + v264 - v265);
          v542[2] = v265 - (v263 + v265 - v263) + v263 - (v263 + v265 - (v263 + v265 - v263));
          v542[3] = v263 + v265;
          v266 = -(v478 * v227 - v207 * v229 - v472 * v229 - v207 * (v227 - v229) - v472 * (v227 - v229));
          v267 = -(v475 * v228 - v231 * v205 - (v228 - v231) * v205 - v231 * v467 - (v228 - v231) * v467);
          v268 = v266 - v267;
          v269 = v266 - (v266 - v267) - v267 + v266 - (v266 - v267 + v266 - (v266 - v267));
          v270 = v478 * v227 + v268;
          v271 = v268 - (v270 - v478 * v227) + v478 * v227 - (v270 - (v270 - v478 * v227));
          v272 = v271 - v475 * v228;
          v541[0] = v269;
          v541[1] = v271 - v272 - v475 * v228 + v271 - (v272 + v271 - v272);
          v273 = v270 + v272;
          v274 = v270 + v272 - v270;
          v275 = v272 - v274;
          v276 = v270 - (v270 + v272 - v274);
          v277 = v202;
          v278 = v275 + v276;
          v279 = v203;
          v541[2] = v278;
          v541[3] = v273;
          v280 = -(v216 * v239
                 - v220 * v240
                 - (v216 - v220) * v240
                 - v220 * (v239 - v240)
                 - (v216 - v220) * (v239 - v240));
          v281 = v215 * v238;
          v282 = -(v281 - v242 * v217 - v244 * v217 - v242 * v218 - v244 * v218);
          v283 = v280 - v282;
          v284 = v280 - (v280 - v282) - v282 + v280 - (v280 - v282 + v280 - (v280 - v282));
          v285 = v216 * v239 + v283;
          v286 = v283 - (v285 - v216 * v239) + v216 * v239 - (v285 - (v285 - v216 * v239));
          v287 = v286 - v281;
          v540[0] = v284;
          v540[1] = v286 - (v286 - v281) - v281 + v286 - (v286 - v281 + v286 - (v286 - v281));
          v288 = v203 * v228;
          v289 = -(v203 * v228
                 - v231 * v208
                 - (v228 - v231) * v208
                 - v231 * (v203 - v208)
                 - (v228 - v231) * (v203 - v208));
          v540[2] = v287 - (v285 + v287 - v285) + v285 - (v285 + v287 - (v285 + v287 - v285));
          v540[3] = v285 + v287;
          v290 = -(v202 * v227
                 - v204 * v229
                 - (v202 - v204) * v229
                 - v204 * (v227 - v229)
                 - (v202 - v204) * (v227 - v229));
          v291 = v289 - v290;
          v292 = v289 - (v289 - v290) - v290 + v289 - (v289 - v290 + v289 - (v289 - v290));
          v293 = v288 + v291;
          v294 = v291 - (v288 + v291 - v288) + v288 - (v288 + v291 - (v288 + v291 - v288));
          v295 = v294 - v202 * v227;
          v539[0] = v292;
          v539[1] = v294 - v295 - v202 * v227 + v294 - (v295 + v294 - v295);
          v296 = -(v475 * v238 - v242 * v205 - v244 * v205 - v242 * v467 - v244 * v467);
          v539[2] = v295 - (v293 + v295 - v293) + v293 - (v293 + v295 - (v293 + v295 - v293));
          v539[3] = v293 + v295;
          v297 = -(v478 * v239 - v207 * v240 - v472 * v240 - v207 * (v239 - v240) - v472 * (v239 - v240));
          v298 = v296 - v297;
          v299 = v296 - (v296 - v297) - v297 + v296 - (v296 - v297 + v296 - (v296 - v297));
          v300 = v475 * v238 + v298;
          v301 = v298 - (v300 - v475 * v238) + v475 * v238 - (v300 - (v300 - v475 * v238));
          v302 = v301 - v478 * v239;
          v538[0] = v299;
          v538[1] = v301 - v302 - v478 * v239 + v301 - (v302 + v301 - v302);
          v538[2] = v302 - (v300 + v302 - v300) + v300 - (v300 + v302 - (v300 + v302 - v300));
          v538[3] = v300 + v302;
          v303 = v34[6];
          v304 = sub_1DEE5CEC4(4, v546, v537, v303);
          v305 = v34[10];
          v306 = sub_1DEE5CEC4(4, v542, v536, -v305);
          v307 = sub_1DEE5CCBC(v304, v537, v306, v536, v535);
          v308 = v34[14];
          v309 = sub_1DEE5CEC4(4, v547, v537, v308);
          v473 = sub_1DEE5CCBC(v309, v537, v307, v535, v534);
          v310 = sub_1DEE5CEC4(4, v545, v537, v305);
          v311 = sub_1DEE5CEC4(4, v541, v536, -v308);
          v312 = sub_1DEE5CCBC(v310, v537, v311, v536, v535);
          v313 = v34[18];
          v314 = sub_1DEE5CEC4(4, v546, v537, v313);
          v315 = sub_1DEE5CCBC(v314, v537, v312, v535, v533);
          v316 = sub_1DEE5CEC4(4, v544, v537, v308);
          v317 = sub_1DEE5CEC4(4, v540, v536, -v313);
          v318 = sub_1DEE5CCBC(v316, v537, v317, v536, v535);
          v319 = v34[2];
          v320 = sub_1DEE5CEC4(4, v545, v537, v319);
          v321 = sub_1DEE5CCBC(v320, v537, v318, v535, v532);
          v322 = sub_1DEE5CEC4(4, v543, v537, v313);
          v323 = sub_1DEE5CEC4(4, v539, v536, -v319);
          v324 = sub_1DEE5CCBC(v322, v537, v323, v536, v535);
          v325 = sub_1DEE5CEC4(4, v544, v537, v303);
          v326 = sub_1DEE5CCBC(v325, v537, v324, v535, v531);
          v327 = sub_1DEE5CEC4(4, v547, v537, v319);
          v328 = sub_1DEE5CEC4(4, v538, v536, -v303);
          v329 = sub_1DEE5CCBC(v327, v537, v328, v536, v535);
          v330 = sub_1DEE5CEC4(4, v543, v537, v305);
          v331 = sub_1DEE5CCBC(v330, v537, v329, v535, v530);
          v332 = sub_1DEE5CEC4(4, v541, v537, v303);
          v333 = sub_1DEE5CEC4(4, v539, v536, v305);
          v334 = sub_1DEE5CCBC(v332, v537, v333, v536, v535);
          v335 = sub_1DEE5CEC4(4, v547, v537, v313);
          v479 = sub_1DEE5CCBC(v335, v537, v334, v535, v529);
          v336 = sub_1DEE5CEC4(4, v540, v537, v305);
          v337 = sub_1DEE5CEC4(4, v538, v536, v308);
          v338 = sub_1DEE5CCBC(v336, v537, v337, v536, v535);
          v339 = sub_1DEE5CEC4(4, v546, v537, v319);
          v340 = sub_1DEE5CCBC(v339, v537, v338, v535, v528);
          v341 = sub_1DEE5CEC4(4, v539, v537, v308);
          v342 = sub_1DEE5CEC4(4, v542, v536, v313);
          v343 = sub_1DEE5CCBC(v341, v537, v342, v536, v535);
          v344 = sub_1DEE5CEC4(4, v545, v537, v303);
          v476 = sub_1DEE5CCBC(v344, v537, v343, v535, v527);
          v345 = sub_1DEE5CEC4(4, v538, v537, v313);
          v346 = sub_1DEE5CEC4(4, v541, v536, v319);
          v347 = sub_1DEE5CCBC(v345, v537, v346, v536, v535);
          v348 = sub_1DEE5CEC4(4, v544, v537, v305);
          v349 = sub_1DEE5CCBC(v348, v537, v347, v535, v526);
          v350 = sub_1DEE5CEC4(4, v542, v537, v319);
          v351 = sub_1DEE5CEC4(4, v540, v536, v303);
          v352 = sub_1DEE5CCBC(v350, v537, v351, v536, v535);
          v353 = sub_1DEE5CEC4(4, v543, v537, v308);
          v354 = sub_1DEE5CCBC(v353, v537, v352, v535, v525);
          v355 = sub_1DEE5CCBC(v321, v532, v340, v528, v524);
          v470 = v315;
          v356 = sub_1DEE5CCBC(v349, v526, v315, v533, v523);
          if (v356 >= 1)
          {
            v357 = v356;
            v358 = v523;
            do
            {
              *v358 = -*v358;
              ++v358;
              --v357;
            }
            while (v357);
          }
          v359 = sub_1DEE5CCBC(v355, v524, v356, v523, v521);
          v360 = sub_1DEE5CEC4(v359, v521, v517, v277);
          v361 = sub_1DEE5CEC4(v360, v517, v516, v277);
          v362 = sub_1DEE5CEC4(v359, v521, v517, v279);
          v363 = sub_1DEE5CEC4(v362, v517, v515, v279);
          v364 = sub_1DEE5CEC4(v359, v521, v517, v303);
          v365 = sub_1DEE5CEC4(v364, v517, v514, v303);
          v366 = sub_1DEE5CCBC(v361, v516, v363, v515, v513);
          v468 = sub_1DEE5CCBC(v366, v513, v365, v514, v512);
          v367 = sub_1DEE5CCBC(v326, v531, v476, v527, v524);
          v368 = sub_1DEE5CCBC(v354, v525, v321, v532, v523);
          if (v368 >= 1)
          {
            v369 = v368;
            v370 = v523;
            do
            {
              *v370 = -*v370;
              ++v370;
              --v369;
            }
            while (v369);
          }
          v371 = sub_1DEE5CCBC(v367, v524, v368, v523, v520);
          v372 = v34[8];
          v373 = sub_1DEE5CEC4(v371, v520, v517, v372);
          v374 = sub_1DEE5CEC4(v373, v517, v516, v372);
          v375 = v34[9];
          v376 = sub_1DEE5CEC4(v371, v520, v517, v375);
          v377 = sub_1DEE5CEC4(v376, v517, v515, v375);
          v378 = sub_1DEE5CEC4(v371, v520, v517, v305);
          v379 = sub_1DEE5CEC4(v378, v517, v514, v305);
          v380 = sub_1DEE5CCBC(v374, v516, v377, v515, v513);
          v381 = sub_1DEE5CCBC(v380, v513, v379, v514, v511);
          v382 = sub_1DEE5CCBC(v331, v530, v349, v526, v524);
          v383 = sub_1DEE5CCBC(v479, v529, v326, v531, v523);
          if (v383 >= 1)
          {
            v384 = v383;
            v385 = v523;
            do
            {
              *v385 = -*v385;
              ++v385;
              --v384;
            }
            while (v384);
          }
          v386 = sub_1DEE5CCBC(v382, v524, v383, v523, v519);
          v387 = v34[12];
          v388 = sub_1DEE5CEC4(v386, v519, v517, v387);
          v389 = sub_1DEE5CEC4(v388, v517, v516, v387);
          v390 = v34[13];
          v391 = sub_1DEE5CEC4(v386, v519, v517, v390);
          v392 = sub_1DEE5CEC4(v391, v517, v515, v390);
          v393 = sub_1DEE5CEC4(v386, v519, v517, v308);
          v394 = sub_1DEE5CEC4(v393, v517, v514, v308);
          v395 = sub_1DEE5CCBC(v389, v516, v392, v515, v513);
          v396 = sub_1DEE5CCBC(v395, v513, v394, v514, v510);
          v397 = sub_1DEE5CCBC(v473, v534, v354, v525, v524);
          v398 = sub_1DEE5CCBC(v340, v528, v331, v530, v523);
          if (v398 >= 1)
          {
            v399 = v398;
            v400 = v523;
            do
            {
              *v400 = -*v400;
              ++v400;
              --v399;
            }
            while (v399);
          }
          v401 = sub_1DEE5CCBC(v397, v524, v398, v523, v518);
          v402 = v34[16];
          v403 = sub_1DEE5CEC4(v401, v518, v517, v402);
          v404 = sub_1DEE5CEC4(v403, v517, v516, v402);
          v405 = v34[17];
          v406 = sub_1DEE5CEC4(v401, v518, v517, v405);
          v407 = sub_1DEE5CEC4(v406, v517, v515, v405);
          v408 = sub_1DEE5CEC4(v401, v518, v517, v313);
          v409 = sub_1DEE5CEC4(v408, v517, v514, v313);
          v410 = sub_1DEE5CCBC(v404, v516, v407, v515, v513);
          v411 = sub_1DEE5CCBC(v410, v513, v409, v514, v509);
          v412 = sub_1DEE5CCBC(v470, v533, v479, v529, v524);
          v413 = sub_1DEE5CCBC(v476, v527, v473, v534, v523);
          if (v413 >= 1)
          {
            v414 = v413;
            v415 = v523;
            do
            {
              *v415 = -*v415;
              ++v415;
              --v414;
            }
            while (v414);
          }
          v416 = sub_1DEE5CCBC(v412, v524, v413, v523, v522);
          v417 = *v34;
          v418 = sub_1DEE5CEC4(v416, v522, v517, *v34);
          v419 = sub_1DEE5CEC4(v418, v517, v516, v417);
          v420 = v34[1];
          v421 = sub_1DEE5CEC4(v416, v522, v517, v420);
          v422 = sub_1DEE5CEC4(v421, v517, v515, v420);
          v423 = sub_1DEE5CEC4(v416, v522, v517, v319);
          v424 = sub_1DEE5CEC4(v423, v517, v514, v319);
          v425 = sub_1DEE5CCBC(v419, v516, v422, v515, v513);
          v426 = sub_1DEE5CCBC(v425, v513, v424, v514, v508);
          v427 = sub_1DEE5CCBC(v468, v512, v381, v511, v507);
          v428 = sub_1DEE5CCBC(v396, v510, v411, v509, v506);
          v429 = sub_1DEE5CCBC(v428, v506, v426, v508, v505);
          return v504[(int)sub_1DEE5CCBC(v427, v507, v429, v505, v504) - 1];
        }
      }
    }
  }
  return v27;
}

uint64_t sub_1DEE5CCBC(int a1, double *a2, int a3, double *a4, double *a5)
{
  double v6;
  double v7;
  int v8;
  double v9;
  int v10;
  uint64_t result;
  double v12;
  double v13;
  uint64_t v14;
  double *v15;
  double v16;
  double v17;
  uint64_t v18;
  double *v19;
  double v20;
  double v21;
  double v23;
  double v24;
  double v25;

  v6 = *a2;
  v7 = *a4;
  if (*a4 <= *a2 == *a4 > -*a2)
  {
    v10 = 0;
    v9 = *a4;
    v7 = a4[1];
    v8 = 1;
  }
  else
  {
    v8 = 0;
    v9 = *a2;
    v6 = a2[1];
    v10 = 1;
  }
  result = 0;
  if (v10 >= a1 || v8 >= a3)
  {
    v12 = v9;
  }
  else
  {
    if (v7 <= v6 == v7 > -v6)
    {
      v12 = v9 + v7;
      v13 = v9 + v7 - v7;
      v7 = a4[++v8];
    }
    else
    {
      v12 = v9 + v6;
      v13 = v9 + v6 - v6;
      v6 = a2[++v10];
    }
    v23 = v9 - v13;
    if (v23 == 0.0)
    {
      result = 0;
    }
    else
    {
      *a5 = v23;
      result = 1;
    }
    while (v10 < a1 && v8 < a3)
    {
      if (v7 <= v6 == v7 > -v6)
      {
        v24 = v12 + v7;
        v25 = v7 - (v12 + v7 - v12) + v12 - (v12 + v7 - (v12 + v7 - v12));
        v7 = a4[++v8];
      }
      else
      {
        v24 = v12 + v6;
        v25 = v6 - (v12 + v6 - v12) + v12 - (v12 + v6 - (v12 + v6 - v12));
        v6 = a2[++v10];
      }
      v12 = v24;
      if (v25 != 0.0)
      {
        a5[(int)result] = v25;
        result = (result + 1);
      }
    }
  }
  if (v10 < a1)
  {
    v14 = a1 - (uint64_t)v10;
    v15 = &a2[v10 + 1];
    do
    {
      v16 = v12;
      v12 = v12 + v6;
      v17 = v6 - (v12 - v16) + v16 - (v12 - (v12 - v16));
      v6 = *v15;
      if (v17 != 0.0)
      {
        a5[(int)result] = v17;
        result = (result + 1);
      }
      ++v15;
      --v14;
    }
    while (v14);
  }
  if (v8 < a3)
  {
    v18 = a3 - (uint64_t)v8;
    v19 = &a4[v8 + 1];
    do
    {
      v20 = v12;
      v12 = v12 + v7;
      v21 = v7 - (v12 - v20) + v20 - (v12 - (v12 - v20));
      v7 = *v19;
      if (v21 != 0.0)
      {
        a5[(int)result] = v21;
        result = (result + 1);
      }
      ++v19;
      --v18;
    }
    while (v18);
  }
  if (v12 != 0.0 || (_DWORD)result == 0)
  {
    a5[(int)result] = v12;
    return (result + 1);
  }
  return result;
}

uint64_t sub_1DEE5CEC4(int a1, double *a2, double *a3, double a4)
{
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t result;
  uint64_t v10;
  double *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v5 = a4 * 134217728.0 - (a4 * 134217728.0 - a4);
  v6 = *a2 * a4;
  v7 = *a2 * 134217728.0 - (*a2 * 134217728.0 - *a2);
  v8 = -(v6 - v7 * v5 - (*a2 - v7) * v5 - v7 * (a4 - v5) - (*a2 - v7) * (a4 - v5));
  if (v8 == 0.0)
  {
    result = 0;
  }
  else
  {
    *a3 = v8;
    result = 1;
  }
  if (a1 >= 2)
  {
    v10 = a1;
    v11 = a2 + 1;
    v12 = v10 - 1;
    do
    {
      v13 = *v11 * a4;
      v14 = *v11 * 134217728.0 - (*v11 * 134217728.0 - *v11);
      v15 = -(v13 - v14 * v5 - (*v11 - v14) * v5 - v14 * (a4 - v5) - (*v11 - v14) * (a4 - v5));
      v16 = v6 + v15;
      v17 = v15 - (v6 + v15 - v6) + v6 - (v6 + v15 - (v6 + v15 - v6));
      if (v17 != 0.0)
      {
        a3[(int)result] = v17;
        result = (result + 1);
      }
      v6 = v13 + v16;
      v18 = v16 - (v13 + v16 - v13);
      if (v18 != 0.0)
      {
        a3[(int)result] = v18;
        result = (result + 1);
      }
      ++v11;
      --v12;
    }
    while (v12);
  }
  if (v6 != 0.0 || (_DWORD)result == 0)
  {
    a3[(int)result] = v6;
    return (result + 1);
  }
  return result;
}

__complex_double ccoshl(__complex_double a1)
{
  int8x16_t v1;
  double v2;
  int8x16_t v3;
  __double2 v4;
  double cosval;
  int8x16_t v6;
  float64x2_t v7;
  double v8;
  BOOL v9;
  BOOL v10;
  double v11;
  float64x2_t v12;
  _BOOL4 v13;
  _BOOL4 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int8x16_t v22;
  int8x16_t v23;
  double v24;
  __complex_double result;

  v1.i64[0] = *(_QWORD *)&a1.c[0];
  v2 = fabs(a1.c[0]);
  v22 = *(int8x16_t *)((char *)&a1 + 8);
  v23 = v1;
  v4 = __sincos_stret(a1.c[1]);
  cosval = v4.__cosval;
  v6.i64[0] = 1.0;
  v7.f64[0] = NAN;
  v7.f64[1] = NAN;
  v8 = v4.__sinval * *(double *)vbslq_s8((int8x16_t)vnegq_f64(v7), v6, v23).i64;
  if (v2 == INFINITY
    && ((v22.i64[0] & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FF0000000000000
      ? (v9 = v22.i64[0] == 0x7FF0000000000000)
      : (v9 = 1),
        !v9 ? (v10 = (v22.i64[0] & 0x7FFFFFFFFFFFFFFFLL) == 0) : (v10 = 1),
        v10))
  {
    v11 = INFINITY;
  }
  else if (*(double *)v23.i64 == 0.0)
  {
    v3.i64[0] = 1.0;
    v12.f64[0] = NAN;
    v12.f64[1] = NAN;
    v8 = *(double *)v23.i64 * *(double *)vbslq_s8((int8x16_t)vnegq_f64(v12), v3, v22).i64;
    v11 = v4.__cosval;
  }
  else
  {
    v13 = v2 < 1419.56543;
    v14 = v2 > 709.782713;
    v15 = v2 + -709.782713;
    if (v13 && v14)
      cosval = v4.__cosval * 1.79769313e308;
    v24 = cosval;
    if (v13 && v14)
      v16 = v8 * 1.79769313e308;
    else
      v16 = v8;
    if (!v13 || !v14)
      v15 = v2;
    v17 = expm1l(v15);
    if (v2 >= 0.0000000074505806)
    {
      v18 = v17 + 1.0;
      if (v2 <= 19.0)
      {
        v20 = v18 + v18;
        v11 = v24 * (v17 * v17 / v20 + 1.0);
        v19 = v17 / v20 + v17 * 0.5;
      }
      else
      {
        v19 = v18 * 0.5;
        v11 = v24 * (v18 * 0.5);
        if (*(double *)v22.i64 == 0.0)
          v19 = 1.0;
      }
      v8 = v16 * v19;
    }
    else
    {
      v8 = v2 * v16;
      v11 = v24;
    }
  }
  v21 = v11;
  result.c[1] = v8;
  result.c[0] = v21;
  return result;
}

__complex_float ccoshf(__complex_float a1)
{
  float v1;
  int8x16_t v2;
  __double2 v3;
  double cosval;
  int8x16_t v5;
  int8x16_t v6;
  float64x2_t v7;
  double v8;
  BOOL v9;
  BOOL v10;
  float v11;
  float v12;
  int8x16_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  float v19;
  int8x16_t v20;
  __complex_float result;

  v1 = fabsf(a1.c[0]);
  v19 = a1.c[0];
  v20 = *(int8x16_t *)&a1.c[1];
  v3 = __sincos_stret(a1.c[1]);
  v2.i32[1] = HIDWORD(v3.__sinval);
  cosval = v3.__cosval;
  v5.i64[0] = 1.0;
  *(double *)v6.i64 = v19;
  v7.f64[0] = NAN;
  v7.f64[1] = NAN;
  v8 = v3.__sinval * *(double *)vbslq_s8((int8x16_t)vnegq_f64(v7), v5, v6).i64;
  if (v1 == INFINITY
    && ((v20.i32[0] & 0x7FFFFFFFu) < 0x7F800001 ? (v9 = v20.i32[0] == 2139095040) : (v9 = 1),
        !v9 ? (v10 = (v20.i32[0] & 0x7FFFFFFF) == 0) : (v10 = 1),
        v10))
  {
    v11 = v8;
    v12 = INFINITY;
  }
  else if (v19 == 0.0)
  {
    v2.i32[0] = 1.0;
    v13.i64[0] = 0x8000000080000000;
    v13.i64[1] = 0x8000000080000000;
    v11 = v19 * *(float *)vbslq_s8(v13, v2, v20).i32;
    v12 = v3.__cosval;
  }
  else
  {
    v14 = v1;
    v15 = expm1l(v1);
    if (v1 >= 0.0000000074506)
    {
      v16 = v15 + 1.0;
      if (v1 <= 19.0)
      {
        v17 = v16 + v16;
        cosval = v3.__cosval * (v15 * v15 / v17 + 1.0);
        v14 = v15 / v17 + v15 * 0.5;
      }
      else
      {
        cosval = v3.__cosval * (v16 * 0.5);
        if (*(float *)v20.i32 == 0.0)
          v14 = 1.0;
        else
          v14 = v16 * 0.5;
      }
    }
    v12 = cosval;
    v11 = v8 * v14;
  }
  v18 = v12;
  result.c[1] = v11;
  result.c[0] = v18;
  return result;
}

__complex_float cexpf(__complex_float a1)
{
  int8x16_t v1;
  int8x16_t v3;
  float v4;
  long double v5;
  double v6;
  double v7;
  long double v8;
  float v9;
  float v10;
  float v11;
  __complex_float result;

  if (a1.c[0] != -INFINITY || (LODWORD(a1.c[1]) & 0x7FFFFFFFu) < 0x7F800000)
  {
    if (a1.c[1] == 0.0)
    {
      v1.i32[0] = expf(a1.c[0]);
      v4 = 0.0;
    }
    else
    {
      v10 = a1.c[1];
      v11 = a1.c[0];
      v5 = a1.c[1];
      v6 = sinl(a1.c[1]);
      v1.i32[0] = 2139095040;
      if (v11 != INFINITY || v10 != INFINITY)
      {
        v7 = cosl(v5);
        v8 = expl(v11);
        *(float *)v1.i32 = v8 * v7;
        v6 = v8 * v6;
      }
      v4 = v6;
    }
  }
  else
  {
    v1.i32[0] = 0;
    v3.i64[0] = 0x8000000080000000;
    v3.i64[1] = 0x8000000080000000;
    LODWORD(v4) = vbslq_s8(v3, v1, *(int8x16_t *)&a1.c[1]).u32[0];
  }
  v9 = *(float *)v1.i32;
  result.c[1] = v4;
  result.c[0] = v9;
  return result;
}

double cimagl(__complex_double a1)
{
  return a1.c[1];
}

float cimagf(__complex_float a1)
{
  return a1.c[1];
}

simd_float4 _simd_atan2_f4(simd_float4 y, simd_float4 x)
{
  int8x16_t v2;
  float32x4_t v3;
  float32x4_t v4;
  int8x16_t v5;
  int8x16_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  int8x16_t v10;
  int8x16_t v11;
  float32x4_t v18;
  float32x4_t v19;

  v2.i64[0] = 0x8000000080000000;
  v2.i64[1] = 0x8000000080000000;
  v3 = (float32x4_t)vcgeq_f32((float32x4_t)(*(_OWORD *)&x & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), (float32x4_t)(*(_OWORD *)&y & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)));
  v4 = (float32x4_t)vdupq_n_s32(0x7F800000u);
  v5 = (int8x16_t)vcltzq_s32((int32x4_t)x);
  v6 = (int8x16_t)vdupq_n_s32(0x3F490FDBu);
  v7 = (float32x4_t)vbslq_s8(vorrq_s8((int8x16_t)vcgtq_f32((float32x4_t)y, (float32x4_t)x), (int8x16_t)vcgeq_f32((float32x4_t)x, (float32x4_t)y)), vorrq_s8(vbslq_s8(vandq_s8((int8x16_t)vceqq_f32((float32x4_t)(*(_OWORD *)&x & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), v4), (int8x16_t)vceqq_f32((float32x4_t)(*(_OWORD *)&y & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), v4)), vbslq_s8(v5, (int8x16_t)vdupq_n_s32(0x4016CBE4u), v6), vorrq_s8(vandq_s8(vandq_s8(v5, (int8x16_t)v3), (int8x16_t)vdupq_n_s32(0x40490FDBu)),
                            vbicq_s8((int8x16_t)vdupq_n_s32(0x3FC90FDBu), (int8x16_t)v3))),
                        vandq_s8((int8x16_t)y, v2)),
                      (int8x16_t)vdupq_n_s32(0x7FC00000u));
  v8 = vdivq_f32((float32x4_t)vbslq_s8((int8x16_t)v3, (int8x16_t)y, (int8x16_t)vnegq_f32((float32x4_t)x)), (float32x4_t)vbslq_s8((int8x16_t)v3, (int8x16_t)x, (int8x16_t)y));
  v9 = vabsq_f32(v8);
  v3.i64[0] = 0x2000000020000000;
  v3.i64[1] = 0x2000000020000000;
  v10 = (int8x16_t)vcgeq_f32(v9, v3);
  v11 = (int8x16_t)vcgtq_f32(v9, (float32x4_t)vdupq_n_s32(0x3ED413CDu));
  __asm
  {
    FMOV            V7.4S, #-1.0
    FMOV            V17.4S, #1.0
  }
  v18 = (float32x4_t)vbslq_s8(v11, (int8x16_t)vdivq_f32(vaddq_f32(v9, _Q7), vaddq_f32(v9, _Q17)), (int8x16_t)v9);
  v19 = (float32x4_t)vandq_s8((int8x16_t)vmulq_f32(v18, v18), v10);
  return (simd_float4)vaddq_f32(v7, (float32x4_t)vbslq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v8), (int8x16_t)vcgezq_f32(v8)), vorrq_s8(vandq_s8((int8x16_t)v8, v2), (int8x16_t)vaddq_f32((float32x4_t)vandq_s8(v6, v11), vmlaq_f32(v18, vmlaq_f32((float32x4_t)vdupq_n_s32(0xBEAAAA2A), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3E4C925Fu), vmlaq_f32((float32x4_t)vdupq_n_s32(0xBE0E1B85), (float32x4_t)vdupq_n_s32(0x3DA4F0D1u), v19), v19), v19),
                                                        vmulq_f32(v18, v19)))),
                                       v2));
}

__complex_double clogl(__complex_double a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  long double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  __complex_double result;

  v9 = a1.c[1];
  v10 = a1.c[0];
  v1 = cargl(a1);
  v2 = fabs(v10);
  v3 = INFINITY;
  if (v2 != INFINITY)
  {
    v4 = fabs(v9);
    v3 = INFINITY;
    if (v4 != INFINITY)
    {
      v11 = v1;
      if (v2 >= v4)
        v5 = v4;
      else
        v5 = v2;
      if (v2 >= v4)
        v6 = v2;
      else
        v6 = v4;
      v3 = logl(v6);
      if (v6 == 0.0)
      {
        if (v6 != 1.0)
        {
LABEL_15:
          v1 = v11;
          goto LABEL_16;
        }
      }
      else if (v6 != 1.0 && ((*(_QWORD *)&v6 >> 52) & 0x7FF) - ((*(_QWORD *)&v5 >> 52) & 0x7FF) >= 0x35)
      {
        goto LABEL_15;
      }
      v3 = v3 + log1pl(v5 / v6 * (v5 / v6)) * 0.5;
      goto LABEL_15;
    }
  }
LABEL_16:
  v7 = v3;
  v8 = v1;
  result.c[1] = v8;
  result.c[0] = v7;
  return result;
}

__complex_float clogf(__complex_float a1)
{
  float v1;
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  __complex_float result;

  v10 = a1.c[1];
  v11 = a1.c[0];
  v1 = cargf(a1);
  v2 = fabsf(v11);
  v3 = INFINITY;
  if (v2 != INFINITY)
  {
    v4 = fabsf(v10);
    v3 = INFINITY;
    if (v4 != INFINITY)
    {
      v12 = v1;
      if (v2 >= v4)
        v5 = v4;
      else
        v5 = v2;
      if (v2 >= v4)
        v6 = v2;
      else
        v6 = v4;
      v3 = logf(v6);
      if (v6 == 0.0)
      {
        if (v6 != 1.0)
          goto LABEL_15;
      }
      else if (v6 != 1.0
             && (LODWORD(v6) >> 23) - (LODWORD(v5) >> 23) >= 0x18)
      {
        goto LABEL_15;
      }
      v3 = v3 + (float)(log1pf((float)(v5 / v6) * (float)(v5 / v6)) * 0.5);
LABEL_15:
      v1 = v12;
    }
  }
  v8 = v3;
  v9 = v1;
  result.c[1] = v9;
  result.c[0] = v8;
  return result;
}

__complex_double conjl(__complex_double result)
{
  double v1;

  v1 = -result.c[1];
  result.c[1] = v1;
  return result;
}

__complex_float conjf(__complex_float result)
{
  float v1;

  v1 = -result.c[1];
  result.c[1] = v1;
  return result;
}

simd_float4 _simd_acos_f4(simd_float4 x)
{
  float32x4_t v1;
  int8x16_t v2;
  float32x4_t v3;
  int8x16_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  int8x16_t v14;
  float32x4_t v15;
  int8x16_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;

  v1.i64[0] = 0xBF000000BF000000;
  v1.i64[1] = 0xBF000000BF000000;
  v2 = (int8x16_t)vcgtq_f32(v1, (float32x4_t)x);
  v3.i64[0] = 0x3F0000003F000000;
  v3.i64[1] = 0x3F0000003F000000;
  v4 = (int8x16_t)vcgtq_f32((float32x4_t)x, v3);
  v5.i64[0] = 0x3F0000003F000000;
  v5.i64[1] = 0x3F0000003F000000;
  v6.i64[0] = 0x3F0000003F000000;
  v6.i64[1] = 0x3F0000003F000000;
  v7 = (float32x4_t)vbslq_s8(vorrq_s8(v2, v4), (int8x16_t)vsqrtq_f32((float32x4_t)vbslq_s8(v2, (int8x16_t)vmlaq_f32(v5, v5, (float32x4_t)x), (int8x16_t)vmlaq_f32(v6, v1, (float32x4_t)x))), (int8x16_t)x);
  v8 = (float32x4_t)vbicq_s8(vbslq_s8(v2, (int8x16_t)vdupq_n_s32(0x40490FDBu), (int8x16_t)vdupq_n_s32(0x3FC90FDBu)), v4);
  __asm { FMOV            V5.4S, #-1.0 }
  v5.i64[0] = 0xC0000000C0000000;
  v5.i64[1] = 0xC0000000C0000000;
  v14 = vbslq_s8(v2, (int8x16_t)v5, _Q5);
  _Q5.i64[0] = 0x4000000040000000;
  _Q5.i64[1] = 0x4000000040000000;
  v15 = (float32x4_t)vbslq_s8(v4, _Q5, v14);
  v4.i64[0] = 0x8000000080000000;
  v4.i64[1] = 0x8000000080000000;
  v16 = vandq_s8((int8x16_t)v7, v4);
  v17 = vabsq_f32(v7);
  v18 = (float32x4_t)vandq_s8((int8x16_t)v17, (int8x16_t)vcgeq_f32(v17, (float32x4_t)vdupq_n_s32(0x38D1B717u)));
  v19 = vmulq_f32(v18, v18);
  return (simd_float4)vmlaq_f32(v8, (float32x4_t)vbslq_s8((int8x16_t)vcgeq_f32(v3, v17), veorq_s8(v16, (int8x16_t)vmlaq_f32(v17, v17, vmulq_f32(v19, vmlaq_f32((float32x4_t)vdupq_n_s32(0x3E2AAAE4u), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3D9980F6u), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3D3A3EC7u), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3CC617E3u), (float32x4_t)vdupq_n_s32(0x3D2CB352u),
                                                                v19),
                                                              v19),
                                                            v19),
                                                          v19)))),
                                       (int8x16_t)vdupq_n_s32(0x7FC00000u)),
                        v15);
}

__complex_double cpowl(__complex_double a1, __complex_double a2)
{
  double v2;
  double v3;
  __complex_double v4;
  double v5;
  double v6;
  __complex_double v7;
  __complex_double v8;
  __complex_double result;

  v2 = a2.c[1];
  v3 = a2.c[0];
  v4 = clogl(a1);
  v8.c[0] = v3 * v4.c[0] - v2 * v4.c[1];
  v8.c[1] = v3 * v4.c[1] + v2 * v4.c[0];
  v7 = cexpl(v8);
  v6 = v7.c[1];
  v5 = v7.c[0];
  result.c[1] = v6;
  result.c[0] = v5;
  return result;
}

__complex_float cpowf(__complex_float a1, __complex_float a2)
{
  float v2;
  float v3;
  __complex_float v4;
  float v5;
  float v6;
  __complex_float v7;
  __complex_float v8;
  __complex_float result;

  v2 = a2.c[1];
  v3 = a2.c[0];
  v4 = clogf(a1);
  v8.c[0] = (float)(v3 * v4.c[0]) - (float)(v2 * v4.c[1]);
  v8.c[1] = (float)(v3 * v4.c[1]) + (float)(v2 * v4.c[0]);
  v7 = cexpf(v8);
  v6 = v7.c[1];
  v5 = v7.c[0];
  result.c[1] = v6;
  result.c[0] = v5;
  return result;
}

__complex_double cprojl(__complex_double result)
{
  int8x16_t v1;
  float64x2_t v2;

  v1.i64[0] = 0;
  v2.f64[0] = NAN;
  v2.f64[1] = NAN;
  v1.i64[0] = vbslq_s8((int8x16_t)vnegq_f64(v2), v1, *(int8x16_t *)((char *)&result + 8)).u64[0];
  if (((fabs(result.c[0]) != INFINITY) & (fabs(result.c[1]) != INFINITY)) == 0)
  {
    result.c[1] = *(double *)v1.i64;
    result.c[0] = INFINITY;
  }
  return result;
}

__complex_float cprojf(__complex_float result)
{
  int8x16_t v1;
  int8x16_t v2;

  v1.i32[0] = 0;
  v2.i64[0] = 0x8000000080000000;
  v2.i64[1] = 0x8000000080000000;
  v1.i32[0] = vbslq_s8(v2, v1, *(int8x16_t *)&result.c[1]).u32[0];
  if (((fabsf(result.c[0]) != INFINITY) & (fabsf(result.c[1]) != INFINITY)) == 0)
  {
    result.c[1] = *(float *)v1.i32;
    result.c[0] = INFINITY;
  }
  return result;
}

unsigned __int16 __truncf16@<H0>(int8x16_t _Q0@<Q0>, int8x16_t a2@<Q1>)
{
  unsigned __int32 v2;
  int8x16_t v7;

  v2 = ((unsigned __int32)_Q0.i32[0] >> 10) & 0x1F;
  if (v2 - 15 > 9)
  {
    if (v2 > 0xE)
    {
      __asm { FCVT            S0, H0 }
      *(float *)_Q0.i32 = _S0 + 0.0;
      __asm { FCVT            H0, S0 }
    }
    else
    {
      a2.i32[0] = 0;
      __asm { FCVT            S0, H0 }
      v7.i64[0] = 0x8000000080000000;
      v7.i64[1] = 0x8000000080000000;
      _Q0.i32[0] = vbslq_s8(v7, a2, _Q0).u32[0];
      __asm { FCVT            H0, S0 }
    }
  }
  else
  {
    _Q0.i32[0] &= -1 << (25 - v2);
  }
  return _Q0.i16[0];
}

__complex_double csinl(__complex_double a1)
{
  double v1;
  __complex_double v2;
  double v3;
  double v4;
  __complex_double v5;
  __complex_double result;

  v1 = a1.c[0];
  v5.c[0] = -a1.c[1];
  v5.c[1] = v1;
  v2 = csinhl(v5);
  v3 = -v2.c[0];
  v4 = v2.c[1];
  result.c[1] = v3;
  result.c[0] = v4;
  return result;
}

simd_double2 _simd_asin_d2(simd_double2 x)
{
  float64x2_t v1;
  int8x16_t v2;
  int8x16_t v8;
  int8x16_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  int8x16_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;

  v1 = (float64x2_t)vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL));
  v2 = vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x8000000000000000));
  __asm { FMOV            V3.2D, #1.0 }
  v8 = (int8x16_t)vcgtq_f64(v1, _Q3);
  __asm
  {
    FMOV            V4.2D, #-0.5
    FMOV            V5.2D, #0.5
  }
  v11 = (int8x16_t)vcgeq_f64(v1, _Q5);
  v12 = vmlaq_f64(_Q5, _Q4, v1);
  v13 = vminnmq_f64(vmulq_f64((float64x2_t)x, (float64x2_t)x), v12);
  v14 = vsqrtq_f64(v12);
  __asm { FMOV            V5.2D, #-2.0 }
  v16 = (int8x16_t)vmulq_f64(v14, _Q5);
  v17 = vmulq_f64(v13, v13);
  v18 = vmulq_f64(v17, v17);
  v19 = (float64x2_t)vbslq_s8(v11, v16, (int8x16_t)v1);
  return (simd_double2)vbslq_s8(v8, (int8x16_t)vdupq_n_s64(0x7FF8000000000000uLL), veorq_s8(v2, (int8x16_t)vaddq_f64((float64x2_t)vandq_s8((int8x16_t)vdupq_n_s64(0x3FF921FB54442D18uLL), v11), vmlaq_f64(v19, v19, vmulq_f64(v13, vmlaq_f64(vmlaq_f64(vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FC555555555529CuLL), (float64x2_t)vdupq_n_s64(0x3FB333333337E0DEuLL), v13), v17, vmlaq_f64(
                                                  (float64x2_t)vdupq_n_s64(0x3FA6DB6DB3B445F8uLL),
                                                  (float64x2_t)vdupq_n_s64(0x3F9F1C72E13AD8BEuLL),
                                                  v13)),
                                              v18,
                                              vmlaq_f64(vmlaq_f64(vmlaq_f64((float64x2_t)vdupq_n_s64(0x3F96E89CEBDEFADDuLL), (float64x2_t)vdupq_n_s64(0x3F91C6DCF538AD2EuLL), v13), v17, vmlaq_f64((float64x2_t)vdupq_n_s64(0x3F8C6DBBCB88BD57uLL), (float64x2_t)vdupq_n_s64(0x3F88F8DC2AFCCAD6uLL), v13)), v18, vmlaq_f64(vmlaq_f64((float64x2_t)vdupq_n_s64(0x3F7A583395D45ED5uLL), (float64x2_t)vdupq_n_s64(0x3F943F44BFBC3BAEuLL), v13), v17, vmlaq_f64((float64x2_t)vdupq_n_s64(0xBF90FB17F7DBB0EDLL),
                                                    (float64x2_t)vdupq_n_s64(0x3FA07520C70EB909uLL),
                                                    v13)))))))));
}

simd_double2 _simd_acos_d2(simd_double2 x)
{
  int8x16_t v1;
  float64x2_t v2;
  int8x16_t v3;
  int8x16_t v9;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  int8x16_t v19;
  float64x2_t v20;

  v1 = (int8x16_t)vdupq_n_s64(0x8000000000000000);
  v2 = (float64x2_t)vorrq_s8((int8x16_t)x, v1);
  v3 = vandq_s8((int8x16_t)x, v1);
  __asm { FMOV            V1.2D, #-1.0 }
  v9 = (int8x16_t)vcgeq_f64(v2, _Q1);
  __asm { FMOV            V4.2D, #0.5 }
  v11 = vmlaq_f64(_Q4, _Q4, v2);
  v12 = vminnmq_f64(vmulq_f64((float64x2_t)x, (float64x2_t)x), v11);
  v13 = vsqrtq_f64(v11);
  v14 = vmulq_f64(v12, v12);
  v15 = vmlaq_f64(vmlaq_f64((float64x2_t)vdupq_n_s64(0x3F7A583395D45ED5uLL), (float64x2_t)vdupq_n_s64(0x3F943F44BFBC3BAEuLL), v12), v14, vmlaq_f64((float64x2_t)vdupq_n_s64(0xBF90FB17F7DBB0EDLL), (float64x2_t)vdupq_n_s64(0x3FA07520C70EB909uLL), v12));
  v16 = vmlaq_f64(vmlaq_f64((float64x2_t)vdupq_n_s64(0x3F96E89CEBDEFADDuLL), (float64x2_t)vdupq_n_s64(0x3F91C6DCF538AD2EuLL), v12), v14, vmlaq_f64((float64x2_t)vdupq_n_s64(0x3F8C6DBBCB88BD57uLL), (float64x2_t)vdupq_n_s64(0x3F88F8DC2AFCCAD6uLL), v12));
  v17 = vmlaq_f64(vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FC555555555529CuLL), (float64x2_t)vdupq_n_s64(0x3FB333333337E0DEuLL), v12), v14, vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FA6DB6DB3B445F8uLL), (float64x2_t)vdupq_n_s64(0x3F9F1C72E13AD8BEuLL), v12));
  v18 = vmulq_f64(v14, v14);
  v19 = (int8x16_t)vcgeq_f64(v12, v11);
  v20 = (float64x2_t)veorq_s8(vbslq_s8(v19, (int8x16_t)vaddq_f64(v13, v13), (int8x16_t)v2), v3);
  return (simd_double2)vbslq_s8(v9, (int8x16_t)vaddq_f64(vaddq_f64((float64x2_t)vbicq_s8((int8x16_t)vdupq_n_s64(0x3FF921FB54442D18uLL), v19), (float64x2_t)vandq_s8(vandq_s8((int8x16_t)vdupq_n_s64(0x400921FB54442D18uLL), (int8x16_t)vclezq_f64((float64x2_t)x)), v19)), vmlaq_f64(v20, v20, vmulq_f64(v12, vmlaq_f64(v17, v18, vmlaq_f64(v16, v18, v15))))), (int8x16_t)vdupq_n_s64(0x7FF8000000000000uLL));
}

__complex_float csinf(__complex_float a1)
{
  float v1;
  __complex_float v2;
  float v3;
  float v4;
  __complex_float v5;
  __complex_float result;

  v1 = a1.c[0];
  v5.c[0] = -a1.c[1];
  v5.c[1] = v1;
  v2 = csinhf(v5);
  v3 = -v2.c[0];
  v4 = v2.c[1];
  result.c[1] = v3;
  result.c[0] = v4;
  return result;
}

__complex_double csinhl(__complex_double a1)
{
  double v1;
  int8x16_t v2;
  int8x16_t v3;
  __double2 v4;
  double sinval;
  BOOL v6;
  BOOL v7;
  float64x2_t v8;
  double v9;
  float64x2_t v10;
  double v11;
  _BOOL4 v12;
  _BOOL4 v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v22;
  __complex_double result;

  v22 = a1.c[1];
  v1 = fabs(a1.c[0]);
  v4 = __sincos_stret(a1.c[1]);
  sinval = v4.__sinval;
  if (v1 == INFINITY
    && ((*(_QWORD *)&v22 & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000001
      ? (v6 = *(_QWORD *)&v22 == 0x7FF0000000000000)
      : (v6 = 1),
        !v6 ? (v7 = (*(_QWORD *)&v22 & 0x7FFFFFFFFFFFFFFFLL) == 0) : (v7 = 1),
        v7))
  {
    v2.i64[0] = 0x7FF0000000000000;
    v8.f64[0] = NAN;
    v8.f64[1] = NAN;
    *(_QWORD *)&v9 = vbslq_s8((int8x16_t)vnegq_f64(v8), v2, (int8x16_t)a1).u64[0];
  }
  else
  {
    v9 = a1.c[0];
    if (a1.c[0] != 0.0)
    {
      v3.i64[0] = 1.0;
      v10.f64[0] = NAN;
      v10.f64[1] = NAN;
      v11 = v4.__cosval * *(double *)vbslq_s8((int8x16_t)vnegq_f64(v10), v3, (int8x16_t)a1).i64;
      v12 = v1 < 1419.56543;
      v13 = v1 > 709.782713;
      if (v12 && v13)
        v14 = v11 * 1.79769313e308;
      else
        v14 = v11;
      if (v12 && v13)
      {
        sinval = v4.__sinval * 1.79769313e308;
        v15 = v1 + -709.782713;
      }
      else
      {
        v15 = v1;
      }
      v16 = expm1l(v15);
      if (v1 >= 0.0000000074505806)
      {
        v17 = v16 + 1.0;
        if (v1 <= 19.0)
        {
          v19 = v17 + v17;
          sinval = sinval * (v16 * v16 / v19 + 1.0);
          v1 = v16 / v19 + v16 * 0.5;
        }
        else
        {
          v1 = v17 * 0.5;
          if (v22 == 0.0)
            v18 = 1.0;
          else
            v18 = v17 * 0.5;
          sinval = sinval * v18;
        }
      }
      v9 = v14 * v1;
    }
  }
  v20 = sinval;
  result.c[1] = v20;
  result.c[0] = v9;
  return result;
}

__complex_float csinhf(__complex_float a1)
{
  float v1;
  int8x16_t v2;
  int8x16_t v3;
  __double2 v4;
  double sinval;
  BOOL v6;
  BOOL v7;
  int8x16_t v8;
  float v9;
  double v10;
  float64x2_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  int8x16_t v18;
  float v19;
  __complex_float result;

  v18 = *(int8x16_t *)a1.c;
  v19 = a1.c[1];
  v1 = fabsf(a1.c[0]);
  v4 = __sincos_stret(a1.c[1]);
  sinval = v4.__sinval;
  if (v1 == INFINITY
    && ((LODWORD(v19) & 0x7FFFFFFFu) < 0x7F800001 ? (v6 = LODWORD(v19) == 2139095040) : (v6 = 1),
        !v6 ? (v7 = (LODWORD(v19) & 0x7FFFFFFF) == 0) : (v7 = 1),
        v7))
  {
    v2.i32[0] = 2139095040;
    v8.i64[0] = 0x8000000080000000;
    v8.i64[1] = 0x8000000080000000;
    LODWORD(v9) = vbslq_s8(v8, v2, v18).u32[0];
  }
  else
  {
    v9 = *(float *)v18.i32;
    if (*(float *)v18.i32 != 0.0)
    {
      v10 = v1;
      v3.i64[0] = 1.0;
      *(double *)v2.i64 = *(float *)v18.i32;
      v11.f64[0] = NAN;
      v11.f64[1] = NAN;
      v12 = v4.__cosval * *(double *)vbslq_s8((int8x16_t)vnegq_f64(v11), v3, v2).i64;
      v13 = expm1l(v1);
      if (v1 >= 0.0000000074506)
      {
        v14 = v13 + 1.0;
        if (v1 <= 19.0)
        {
          v16 = v14 + v14;
          sinval = v4.__sinval * (v13 * v13 / v16 + 1.0);
          v10 = v13 / v16 + v13 * 0.5;
        }
        else
        {
          v10 = v14 * 0.5;
          if (v19 == 0.0)
            v15 = 1.0;
          else
            v15 = v14 * 0.5;
          sinval = v4.__sinval * v15;
        }
      }
      v9 = v12 * v10;
    }
  }
  v17 = sinval;
  result.c[1] = v17;
  result.c[0] = v9;
  return result;
}

__complex_double csqrtl(__complex_double result)
{
  int8x16_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  float64x2_t v7;
  double v8;
  double v9;
  double v10;
  float64x2_t v11;
  double v12;

  v2 = *(_QWORD *)&result.c[0];
  v3 = (*(_QWORD *)&result.c[0] >> 52) & 0x7FFLL;
  if ((v3 - 512) <= 0x3FE && ((*(_QWORD *)&result.c[1] >> 52) & 0x7FF) - 512 <= 0x3FE)
  {
    result.c[0] = sqrt((fabs(result.c[0]) + sqrt(result.c[1] * result.c[1] + result.c[0] * result.c[0])) * 0.5);
    *(double *)v1.i64 = result.c[1] * 0.5 / result.c[0];
    goto LABEL_27;
  }
  if (fabs(result.c[1]) == INFINITY)
  {
    result.c[0] = INFINITY;
    goto LABEL_14;
  }
  if (fabs(result.c[0]) == INFINITY)
  {
    v1.i64[0] = 0;
    v7.f64[0] = NAN;
    v7.f64[1] = NAN;
    v1.i64[0] = vbslq_s8((int8x16_t)vnegq_f64(v7), v1, *(int8x16_t *)((char *)&result + 8)).u64[0];
    goto LABEL_27;
  }
  if (result.c[0] == 0.0 && result.c[1] == 0.0)
  {
LABEL_14:
    v1.i64[0] = *(_QWORD *)&result.c[1];
    goto LABEL_27;
  }
  v4 = (*(_QWORD *)&result.c[1] >> 52) & 0x7FFLL;
  if (v3 <= v4)
  {
    if ((int)v4 - (int)v3 > 54)
      result.c[0] = result.c[0] * 0.0;
    if (v4 <= 0x5FD)
    {
      v5 = 1.0;
      if (v4 > 0x235)
        goto LABEL_26;
      v5 = 2.53794184e-116;
      v8 = 1.55251809e231;
    }
    else
    {
      v5 = 3.94020062e115;
      v8 = 6.44114877e-232;
    }
    result.c[1] = result.c[1] * v8;
    result.c[0] = result.c[0] * v8;
    goto LABEL_26;
  }
  if ((int)v3 - (int)v4 > 54)
    result.c[1] = result.c[1] * 0.0;
  if (v3 > 0x5FD)
  {
    v5 = 3.94020062e115;
    v6 = 6.44114877e-232;
LABEL_22:
    result.c[0] = result.c[0] * v6;
    result.c[1] = result.c[1] * v6;
    goto LABEL_26;
  }
  v5 = 1.0;
  if (v3 <= 0x235)
  {
    v5 = 2.53794184e-116;
    v6 = 1.55251809e231;
    goto LABEL_22;
  }
LABEL_26:
  v9 = sqrt((fabs(result.c[0]) + sqrt(result.c[1] * result.c[1] + result.c[0] * result.c[0])) * 0.5);
  v2 = *(_QWORD *)&result.c[0];
  result.c[0] = v5 * v9;
  *(double *)v1.i64 = v5 * (result.c[1] * 0.5 / v9);
LABEL_27:
  v10 = fabs(*(double *)v1.i64);
  v11.f64[0] = NAN;
  v11.f64[1] = NAN;
  *(_QWORD *)&v12 = vbslq_s8((int8x16_t)vnegq_f64(v11), (int8x16_t)result, *(int8x16_t *)((char *)&result + 8)).u64[0];
  if (v2 >= 0)
    v12 = *(double *)v1.i64;
  else
    result.c[0] = v10;
  result.c[1] = v12;
  return result;
}

__complex_float csqrtf(__complex_float result)
{
  int8x16_t v1;
  int v2;
  float v3;
  int8x16_t v4;
  float v5;
  int8x16_t v6;
  float v7;

  v1.i32[0] = LODWORD(result.c[1]);
  v2 = LODWORD(result.c[0]);
  if ((LODWORD(result.c[0]) >> 23) - 64 <= 0x7E
    && (LODWORD(result.c[1]) >> 23) - 64 <= 0x7E)
  {
    v3 = 0.5;
    result.c[0] = sqrtf((float)(fabsf(result.c[0])+ sqrtf((float)(result.c[1] * result.c[1]) + (float)(result.c[0] * result.c[0])))* 0.5);
LABEL_9:
    *(float *)v1.i32 = (float)(result.c[1] * v3) / result.c[0];
    goto LABEL_12;
  }
  if (fabsf(result.c[1]) == INFINITY)
  {
    result.c[0] = INFINITY;
  }
  else
  {
    if (fabsf(result.c[0]) != INFINITY)
    {
      if (result.c[0] == 0.0 && result.c[1] == 0.0)
        goto LABEL_12;
      *(double *)&result = sqrt((fabs(result.c[0]) + sqrt(result.c[1] * result.c[1] + result.c[0] * result.c[0])) * 0.5);
      result.c[0] = *(double *)&result;
      v3 = 0.5;
      goto LABEL_9;
    }
    v1.i32[0] = 0;
    v4.i64[0] = 0x8000000080000000;
    v4.i64[1] = 0x8000000080000000;
    v1.i32[0] = vbslq_s8(v4, v1, *(int8x16_t *)&result.c[1]).u32[0];
  }
LABEL_12:
  v5 = fabsf(*(float *)v1.i32);
  v6.i64[0] = 0x8000000080000000;
  v6.i64[1] = 0x8000000080000000;
  LODWORD(v7) = vbslq_s8(v6, *(int8x16_t *)result.c, *(int8x16_t *)&result.c[1]).u32[0];
  if (v2 >= 0)
    v7 = *(float *)v1.i32;
  else
    result.c[0] = v5;
  result.c[1] = v7;
  return result;
}

simd_float4 _simd_sinh_f4(simd_float4 x)
{
  int8x16_t v2;
  uint32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  int32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  simd_float4 v13;
  int v14;
  float v15;
  uint32x4_t v17;
  simd_float4 v18;
  simd_float4 v19;
  simd_float4 v20;
  simd_float4 v21;
  uint32x4_t v22;

  v2.i64[0] = 0x8000000080000000;
  v2.i64[1] = 0x8000000080000000;
  v3 = vcgtq_u32((uint32x4_t)(*(_OWORD *)&x & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), (uint32x4_t)vdupq_n_s32(0x42AEAC4Eu));
  v4 = vmlaq_f32((float32x4_t)vdupq_n_s32(0x4B400000u), (float32x4_t)vdupq_n_s32(0x3FB8AA3Bu), (float32x4_t)(*(_OWORD *)&x & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)));
  v5 = vaddq_f32(v4, (float32x4_t)vdupq_n_s32(0xCB400000));
  v6 = vmlaq_f32(vmlaq_f32((float32x4_t)(*(_OWORD *)&x & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), (float32x4_t)vdupq_n_s32(0xBF317000), v5), (float32x4_t)vdupq_n_s32(0xB805FDF4), v5);
  v7 = vshlq_n_s32((int32x4_t)v4, 0x17uLL);
  v5.i64[0] = 0x3F0000003F000000;
  v5.i64[1] = 0x3F0000003F000000;
  v8 = (float32x4_t)vaddq_s32(v7, (int32x4_t)v5);
  v9 = (float32x4_t)vsubq_s32((int32x4_t)v5, v7);
  v10 = vaddq_f32(v8, v9);
  v11 = vsubq_f32(v8, v9);
  v12 = vmulq_f32(v6, v6);
  v13 = (simd_float4)vorrq_s8(vandq_s8((int8x16_t)x, v2), (int8x16_t)vaddq_f32(v11, vmlaq_f32(vmulq_f32(v11, vmulq_f32(v12, vmlaq_f32(v5, v12, vmlaq_f32((float32x4_t)vdupq_n_s32(0x3D2AAA72u), (float32x4_t)vdupq_n_s32(0x3AB6A8A3u), v12)))), v10, vmlaq_f32(v6, v6,
                                        vmulq_f32(v12, vmlaq_f32((float32x4_t)vdupq_n_s32(0x3E2AAA57u), (float32x4_t)vdupq_n_s32(0x3C091461u), v12))))));
  if ((vmaxvq_u32(v3) & 0x80000000) != 0)
  {
    v14 = 0;
    v17 = v3;
    v18 = x;
    do
    {
      v22 = v3;
      if (*(_DWORD *)((unint64_t)&v22 & 0xFFFFFFFFFFFFFFF3 | (4 * (v14 & 3))))
      {
        v20 = x;
        v19 = v13;
        v15 = sinhf(*(float *)((unint64_t)&v20 & 0xFFFFFFFFFFFFFFF3 | (4 * (v14 & 3))));
        v3 = v17;
        x = v18;
        v21 = v19;
        *(float *)((unint64_t)&v21 & 0xFFFFFFFFFFFFFFF3 | (4 * (v14 & 3))) = v15;
        v13 = v21;
      }
      ++v14;
    }
    while (v14 != 4);
  }
  return v13;
}

simd_float4 _simd_cosh_f4(simd_float4 x)
{
  simd_float4 v1;
  uint32x4_t v2;
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  int32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  simd_float4 v11;
  int v12;
  float v13;
  uint32x4_t v15;
  simd_float4 v16;
  simd_float4 v17;
  simd_float4 v18;
  simd_float4 v19;
  uint32x4_t v20;

  v1 = x;
  x.i64[0] &= 0x7FFFFFFF7FFFFFFFuLL;
  x.i32[2] &= ~0x80000000;
  x.i32[3] &= ~0x80000000;
  v2 = vcgtq_u32((uint32x4_t)x, (uint32x4_t)vdupq_n_s32(0x42AEAC4Eu));
  v3 = vmlaq_f32((float32x4_t)vdupq_n_s32(0x4B400000u), (float32x4_t)vdupq_n_s32(0x3FB8AA3Bu), (float32x4_t)x);
  v4 = vaddq_f32(v3, (float32x4_t)vdupq_n_s32(0xCB400000));
  v5 = vmlaq_f32(vmlaq_f32((float32x4_t)x, (float32x4_t)vdupq_n_s32(0xBF317000), v4), (float32x4_t)vdupq_n_s32(0xB805FDF4), v4);
  v6 = vshlq_n_s32((int32x4_t)v3, 0x17uLL);
  v3.i64[0] = 0x3F0000003F000000;
  v3.i64[1] = 0x3F0000003F000000;
  v7 = (float32x4_t)vaddq_s32(v6, (int32x4_t)v3);
  v8 = (float32x4_t)vsubq_s32((int32x4_t)v3, v6);
  v9 = vaddq_f32(v7, v8);
  v10 = vmulq_f32(v5, v5);
  v11 = (simd_float4)vaddq_f32(v9, vmlaq_f32(vmulq_f32(v9, vmulq_f32(v10, vmlaq_f32(v3, v10, vmlaq_f32((float32x4_t)vdupq_n_s32(0x3D2AAA72u), (float32x4_t)vdupq_n_s32(0x3AB6A8A3u), v10)))), vsubq_f32(v7, v8), vmlaq_f32(v5, v5, vmulq_f32(v10,
                             vmlaq_f32((float32x4_t)vdupq_n_s32(0x3E2AAA57u), (float32x4_t)vdupq_n_s32(0x3C091461u), v10)))));
  if ((vmaxvq_u32(v2) & 0x80000000) != 0)
  {
    v12 = 0;
    v15 = v2;
    v16 = v1;
    do
    {
      v20 = v2;
      if (*(_DWORD *)((unint64_t)&v20 & 0xFFFFFFFFFFFFFFF3 | (4 * (v12 & 3))))
      {
        v18 = v1;
        v17 = v11;
        v13 = coshf(*(float *)((unint64_t)&v18 & 0xFFFFFFFFFFFFFFF3 | (4 * (v12 & 3))));
        v2 = v15;
        v1 = v16;
        v19 = v17;
        *(float *)((unint64_t)&v19 & 0xFFFFFFFFFFFFFFF3 | (4 * (v12 & 3))) = v13;
        v11 = v19;
      }
      ++v12;
    }
    while (v12 != 4);
  }
  return v11;
}

simd_float4 _simd_tanh_f4(simd_float4 x)
{
  int8x16_t v1;
  int8x16_t v2;
  float32x4_t v3;
  int32x4_t v4;
  int32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;

  v1.i64[0] = 0x8000000080000000;
  v1.i64[1] = 0x8000000080000000;
  v2 = vandq_s8((int8x16_t)x, v1);
  v3 = vminq_f32(vaddq_f32((float32x4_t)(*(_OWORD *)&x & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), (float32x4_t)(*(_OWORD *)&x & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL))), (float32x4_t)vdupq_n_s32(0x42B17217u));
  v4 = vcvtnq_s32_f32(vmulq_f32(v3, (float32x4_t)vdupq_n_s32(0x3FB8AA3Bu)));
  v5.i64[0] = 0x3F0000003F000000;
  v5.i64[1] = 0x3F0000003F000000;
  v6 = (float32x4_t)vaddq_s32(vshlq_n_s32(v4, 0x17uLL), v5);
  v7 = vcvtq_f32_s32(v4);
  v8 = vmlaq_f32(vmlaq_f32(v3, (float32x4_t)vdupq_n_s32(0xBF318000), v7), (float32x4_t)vdupq_n_s32(0x395E8083u), v7);
  v9 = vcvtq_f32_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqzq_f32(v7)));
  v10 = vmulq_f32(vsubq_f32(vmlaq_f32(v8, vmulq_f32(v8, v8), vmlaq_f32((float32x4_t)v5, vmlaq_f32((float32x4_t)vdupq_n_s32(0x3E2AAAAAu), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3D2AA9C1u), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3C088908u), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3AB743CEu), (float32x4_t)vdupq_n_s32(0x39506967u), v8), v8), v8), v8), v8)), v9), v6);
  v11 = vaddq_f32(vaddq_f32(v10, v10), v9);
  v9.i64[0] = 0x4000000040000000;
  v9.i64[1] = 0x4000000040000000;
  return (simd_float4)vorrq_s8(v2, (int8x16_t)vdivq_f32(v11, vaddq_f32(v11, v9)));
}

__complex_double ctanl(__complex_double a1)
{
  double v1;
  __complex_double v2;
  double v3;
  double v4;
  __complex_double v5;
  __complex_double result;

  v1 = a1.c[0];
  v5.c[0] = -a1.c[1];
  v5.c[1] = v1;
  v2 = ctanhl(v5);
  v3 = -v2.c[0];
  v4 = v2.c[1];
  result.c[1] = v3;
  result.c[0] = v4;
  return result;
}

__complex_float ctanf(__complex_float a1)
{
  float v1;
  __complex_float v2;
  float v3;
  float v4;
  __complex_float v5;
  __complex_float result;

  v1 = a1.c[0];
  v5.c[0] = -a1.c[1];
  v5.c[1] = v1;
  v2 = ctanhf(v5);
  v3 = -v2.c[0];
  v4 = v2.c[1];
  result.c[1] = v3;
  result.c[0] = v4;
  return result;
}

__complex_double ctanhl(__complex_double a1)
{
  int8x16_t v1;
  int8x16_t v2;
  double v3;
  double v4;
  float64x2_t v5;
  double v6;
  int8x16_t v7;
  float64x2_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float64x2_t v13;
  int8x16_t v14;
  double v15;
  double v16;
  int8x16_t v17;
  int8x16_t v18;
  __complex_double v19;
  __complex_double v20;
  __complex_double result;

  v2.i64[0] = *(_QWORD *)&a1.c[0];
  v3 = fabs(a1.c[0]);
  v4 = fabs(a1.c[1]);
  if (v3 == INFINITY)
  {
    v17 = v2;
    v19 = *(__complex_double *)((char *)&a1 + 8);
    a1.c[0] = sinl(v4 + v4);
    v2 = v17;
    *(__complex_double *)((char *)&a1 + 8) = v19;
    v1.i64[0] = 0;
    v5.f64[0] = NAN;
    v5.f64[1] = NAN;
    *(_QWORD *)&v6 = vbslq_s8((int8x16_t)vnegq_f64(v5), v1, (int8x16_t)a1).u64[0];
    a1.c[0] = 1.0;
  }
  else if (v4 == INFINITY)
  {
    a1.c[0] = NAN;
    v6 = NAN;
  }
  else
  {
    v18 = v2;
    v20 = *(__complex_double *)((char *)&a1 + 8);
    if (v3 <= 19.0)
    {
      v9 = tanl(v4);
      v10 = v9 * v9 + 1.0;
      if (v3 >= 0.0000000074505806)
      {
        a1.c[0] = expm1l(v3);
        v11 = a1.c[0] * a1.c[0] * 0.5 / (a1.c[0] + 1.0) + 1.0;
        v3 = (a1.c[0] + a1.c[0] / (a1.c[0] + 1.0)) * 0.5;
      }
      else
      {
        v11 = 1.0;
      }
      *(__complex_double *)((char *)&a1 + 8) = v20;
      v12 = v10 * v3 * v3 + 1.0;
      a1.c[0] = v10 * v11 * v3 / v12;
      v6 = v9 / v12;
    }
    else
    {
      a1.c[0] = sinl(v4 + v4);
      v7.i64[0] = 0;
      v8.f64[0] = NAN;
      v8.f64[1] = NAN;
      *(_QWORD *)&v6 = vbslq_s8((int8x16_t)vnegq_f64(v8), v7, (int8x16_t)a1).u64[0];
      a1.c[0] = 1.0;
      *(__complex_double *)((char *)&a1 + 8) = v20;
    }
    v2 = v18;
  }
  v13.f64[0] = NAN;
  v13.f64[1] = NAN;
  v14 = (int8x16_t)vnegq_f64(v13);
  *(_QWORD *)&v15 = vbslq_s8(v14, (int8x16_t)a1, v2).u64[0];
  v1.i64[0] = 1.0;
  v16 = *(double *)vbslq_s8(v14, v1, *(int8x16_t *)((char *)&a1 + 8)).i64 * v6;
  result.c[1] = v16;
  result.c[0] = v15;
  return result;
}

__complex_float ctanhf(__complex_float a1)
{
  int8x16_t v1;
  int8x16_t v2;
  float v3;
  float v4;
  int8x16_t v5;
  float v6;
  int8x16_t v7;
  int8x16_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int8x16_t v13;
  float v14;
  float v15;
  int8x16_t v16;
  int8x16_t v17;
  __int128 v18;
  __int128 v19;
  __complex_float result;

  v2.i32[0] = LODWORD(a1.c[0]);
  v3 = fabsf(a1.c[0]);
  v4 = fabsf(a1.c[1]);
  if (v3 == INFINITY)
  {
    v16 = v2;
    v18 = *(_OWORD *)&a1.c[1];
    a1.c[0] = sinf(v4 + v4);
    v2 = v16;
    *(_OWORD *)&a1.c[1] = v18;
    v1.i32[0] = 0;
    v5.i64[0] = 0x8000000080000000;
    v5.i64[1] = 0x8000000080000000;
    LODWORD(v6) = vbslq_s8(v5, v1, *(int8x16_t *)a1.c).u32[0];
    a1.c[0] = 1.0;
  }
  else if (v4 == INFINITY)
  {
    a1.c[0] = NAN;
    v6 = NAN;
  }
  else
  {
    v17 = v2;
    v19 = *(_OWORD *)&a1.c[1];
    if (v3 <= 19.0)
    {
      v9 = tanf(v4);
      v10 = 1.0;
      v11 = v9 * v9 + 1.0;
      if (v3 >= 0.00012207)
      {
        *(double *)&a1 = expm1f(v3);
        v10 = *(double *)&a1 * *(double *)&a1 * 0.5 / (*(double *)&a1 + 1.0) + 1.0;
        *(double *)&a1 = (*(double *)&a1 / (*(double *)&a1 + 1.0) + *(double *)&a1) * 0.5;
      }
      else
      {
        *(double *)&a1 = v3;
      }
      v2 = v17;
      *(_OWORD *)&a1.c[1] = v19;
      v1.i64[0] = 1.0;
      v12 = v11 * *(double *)&a1 * *(double *)&a1 + 1.0;
      *(double *)&a1 = v11 * v10 * *(double *)&a1 / v12;
      a1.c[0] = *(double *)&a1;
      v6 = v9 / v12;
    }
    else
    {
      a1.c[0] = sinf(v4 + v4);
      v7.i32[0] = 0;
      v8.i64[0] = 0x8000000080000000;
      v8.i64[1] = 0x8000000080000000;
      LODWORD(v6) = vbslq_s8(v8, v7, *(int8x16_t *)a1.c).u32[0];
      a1.c[0] = 1.0;
      v2 = v17;
      *(_OWORD *)&a1.c[1] = v19;
    }
  }
  v13.i64[0] = 0x8000000080000000;
  v13.i64[1] = 0x8000000080000000;
  LODWORD(v14) = vbslq_s8(v13, *(int8x16_t *)a1.c, v2).u32[0];
  v1.i32[0] = 1.0;
  v15 = *(float *)vbslq_s8(v13, v1, *(int8x16_t *)&a1.c[1]).i32 * v6;
  result.c[1] = v15;
  result.c[0] = v14;
  return result;
}

__complex_double cacosl(__complex_double result)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  long double v16;
  double v17;
  float64x2_t v18;
  double v19;
  __complex_double v20;

  v1 = result.c[1];
  v2 = result.c[0];
  v3 = fabs(result.c[0]);
  v4 = fabs(v1);
  if (v3 == INFINITY || v4 == INFINITY)
  {
    v6 = atan2l(v4, v3);
    result.c[0] = -INFINITY;
  }
  else if (v3 < 0.0000000074505806 && v4 < 0.0000000074505806)
  {
    v6 = 1.57079633 - v3;
    result.c[0] = -v4;
  }
  else if (v3 > 134217728.0 || v4 > 134217728.0)
  {
    v20.c[0] = v3;
    v20.c[1] = v4;
    result = clogl(v20);
    v6 = result.c[1] + (result.c[0] + 0.693147181) * -0.0;
    result.c[0] = result.c[1] * -0.0 - (result.c[0] + 0.693147181);
  }
  else
  {
    v8 = 0.0;
    if (v4 >= 1.23259516e-32)
      v8 = v1 * v1;
    v9 = sqrt((v3 + 1.0 + sqrt(v8 + (v3 + 1.0) * (v3 + 1.0))) * 0.5);
    v10 = v4 / v9;
    v11 = 1.0 - v3;
    if (v11 == 0.0)
    {
      v12 = sqrt(v4) * 0.707106781;
      v13 = v12;
    }
    else
    {
      v14 = sqrt((fabs(v11) + sqrt(v8 + v11 * v11)) * 0.5);
      v15 = v4 / v14;
      if (v11 >= 0.0)
        v12 = v15 * 0.5;
      else
        v12 = v14;
      if (v11 >= 0.0)
        v13 = v14;
      else
        v13 = v15 * 0.5;
    }
    v16 = atan2l(v13, v9);
    v6 = v16 + v16;
    result.c[0] = asinhl(v10 * -0.5 * v13 - v9 * v12);
  }
  if (v2 >= 0.0)
    v17 = v6;
  else
    v17 = 3.14159265 - v6;
  result.c[1] = -v1;
  v18.f64[0] = NAN;
  v18.f64[1] = NAN;
  *(_QWORD *)&result.c[1] = vbslq_s8((int8x16_t)vnegq_f64(v18), (int8x16_t)result, *(int8x16_t *)((char *)&result + 8)).u64[0];
  v19 = v17;
  result.c[0] = v19;
  return result;
}

__complex_float cacosf(__complex_float result)
{
  float v1;
  float v2;
  float v3;
  float v4;
  float v6;
  int v7;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  unsigned int v15;
  float v16;
  float v17;
  float v18;
  float v19;
  int8x16_t v20;
  float v21;
  __complex_float v22;

  v1 = result.c[1];
  v2 = result.c[0];
  v3 = fabsf(result.c[0]);
  v4 = fabsf(v1);
  if (v3 == INFINITY || v4 == INFINITY)
  {
    v6 = atan2f(v4, v3);
    result.c[0] = -INFINITY;
  }
  else
  {
    v7 = 956301312;
    if (v3 < 0.00012207 && v4 < 0.00012207)
    {
      v6 = 1.5708 - v3;
      result.c[0] = -v4;
    }
    else if (v3 > 8192.0 || v4 > 8192.0)
    {
      v22.c[0] = v3;
      v22.c[1] = v4;
      result = clogf(v22);
      v15 = 0x80000000;
      v6 = result.c[1] + (float)((float)(result.c[0] + 0.69315) * -0.0);
      result.c[0] = (float)(result.c[1] * -0.0) - (float)(result.c[0] + 0.69315);
    }
    else
    {
      v9 = 0.0;
      if (v4 >= 2.2204e-16)
        v9 = v1 * v1;
      v10 = sqrtf((float)((float)(v3 + 1.0) + sqrtf(v9 + (float)((float)(v3 + 1.0) * (float)(v3 + 1.0)))) * 0.5);
      v11 = v4 / v10;
      v12 = 1.0 - v3;
      if (v12 == 0.0)
      {
        v13 = sqrtf(v4) * 0.70711;
        v14 = v13;
      }
      else
      {
        v16 = sqrtf((float)(fabsf(v12) + sqrtf(v9 + (float)(v12 * v12))) * 0.5);
        v17 = v4 / v16;
        if (v12 >= 0.0)
          v13 = v17 * 0.5;
        else
          v13 = v16;
        if (v12 >= 0.0)
          v14 = v16;
        else
          v14 = v17 * 0.5;
      }
      v18 = atan2f(v14, v10);
      v6 = v18 + v18;
      result.c[0] = asinhf((float)((float)(v11 * -0.5) * v14) - (float)(v10 * v13));
    }
  }
  if (v2 >= 0.0)
    v19 = v6;
  else
    v19 = 3.1416 - v6;
  result.c[1] = -v1;
  v20.i64[0] = 0x8000000080000000;
  v20.i64[1] = 0x8000000080000000;
  LODWORD(result.c[1]) = vbslq_s8(v20, *(int8x16_t *)result.c, *(int8x16_t *)&result.c[1]).u32[0];
  v21 = v19;
  result.c[0] = v21;
  return result;
}

__int16 _simd_orient_vh2@<H0>(__int32 a1@<W0>, __int32 a2@<W1>, float16x4_t a3@<D0>, float16x4_t a4@<D1>)
{
  __int16 result;

  a3.i32[0] = a1;
  a4.i32[0] = a2;
  _D0 = vmul_f32((float32x2_t)vrev64_s32((int32x2_t)*(_OWORD *)&vcvtq_f32_f16(a4)), (float32x2_t)*(_OWORD *)&vcvtq_f32_f16(a3));
  _D0.i32[0] = vsub_f32(_D0, (float32x2_t)vdup_lane_s32((int32x2_t)_D0, 1)).u32[0];
  __asm { FCVT            H0, S0 }
  return result;
}

__int16 _simd_orient_ph2@<H0>(__int32 a1@<W0>, __int32 a2@<W1>, __int32 a3@<W2>, float16x4_t a4@<D0>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  float32x2_t v17;
  float32x2_t v18;
  float32x2_t v19;
  float32x2_t v20;
  float v22;
  float32x2_t v24;
  float32x2_t v25;
  float32x2_t v26;
  float32x2_t v27;
  float32x2_t v28;
  float32x2_t v29;
  float32x2_t v30;
  float32x2_t v31;
  float32x2_t v32;
  float32x2_t v35;
  float32x2_t v36;
  float32x2_t v37;
  float v38;
  float v39;
  float v40;
  float v41;
  uint64_t i;
  float32x2_t v44;
  float32x2_t v45;
  float32x2_t v46;
  float32x2_t v47;
  float32x4_t v48;
  float32x2_t v49;
  float32x2_t v50;
  float v51;
  float v53;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  int v74;
  float32x2_t v75;
  float v76;
  float v85;
  float v86;
  float v87;
  float v88;
  int v89;
  float v90;
  float v91;
  float v92;
  float v93;
  float v94;
  float v95;
  float v96;
  float v97;
  float v98;
  float v99;
  __int16 result;
  float32x2_t v101;
  float32x2_t v102;
  float32x2_t v103;
  float32x2_t v104;
  float v105;
  float32x2_t v106;
  float v107;
  float v108;
  float v109;
  float v110;
  float v111[16];
  float v112[12];
  float v113[8];
  float v114[4];
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;

  a4.i32[0] = a1;
  v14 = (float32x2_t)vcvtq_f32_f16(a4).u64[0];
  a4.i32[0] = a2;
  v15 = (float32x2_t)vcvtq_f32_f16(a4).u64[0];
  a4.i32[0] = a3;
  v16 = (float32x2_t)vcvtq_f32_f16(a4).u64[0];
  v17 = vsub_f32(v14, v16);
  v18 = vsub_f32(v15, v16);
  v19 = vmul_lane_f32(v17, v18, 1);
  v20 = vmul_lane_f32(v18, v17, 1);
  LODWORD(_S2) = vsub_f32(v19, v20).u32[0];
  if (v19.f32[0] <= 0.0)
  {
    if (v19.f32[0] >= 0.0 || v20.f32[0] >= 0.0)
      goto LABEL_26;
    v22 = (float)-v19.f32[0] - v20.f32[0];
  }
  else
  {
    if (v20.f32[0] <= 0.0)
      goto LABEL_26;
    LODWORD(v22) = vadd_f32(v19, v20).u32[0];
  }
  v115 = v13;
  v116 = v12;
  v117 = v11;
  v118 = v10;
  v119 = v9;
  v120 = v8;
  v121 = v7;
  v122 = v6;
  v123 = v4;
  v124 = v5;
  if (_S2 < (float)(v22 * 0.0014687) && (float)(v22 * 0.0014687) > (float)-_S2)
  {
    v24 = (float32x2_t)vrev64_s32((int32x2_t)v14);
    v25 = (float32x2_t)vrev64_s32((int32x2_t)v16);
    v26 = vsub_f32(v24, v25);
    v27 = vmul_f32(v26, v18);
    v28 = (float32x2_t)vdup_n_s32(0x45800001u);
    v29 = vmul_f32(v26, v28);
    v30 = vsub_f32(v29, vsub_f32(v29, v26));
    v31 = vsub_f32(v26, v30);
    v32 = vmul_f32(v18, v28);
    _D3 = vsub_f32(v32, vsub_f32(v32, v18));
    _D1 = vsub_f32(v18, _D3);
    v35 = vneg_f32(v30);
    v36 = vneg_f32(v31);
    v37 = vmla_f32(vneg_f32(vmls_f32(vmls_f32(vmls_f32(v27, _D3, v30), _D3, v31), _D1, v30)), _D1, v31);
    v38 = v37.f32[1] - v37.f32[0];
    _S2 = (float)((float)(v37.f32[1] - (float)(v37.f32[1] - v37.f32[0])) - v37.f32[0])
        + (float)(v37.f32[1]
                - (float)((float)(v37.f32[1] - v37.f32[0]) + (float)(v37.f32[1] - (float)(v37.f32[1] - v37.f32[0]))));
    v39 = v27.f32[1] + v38;
    v40 = (float)(v38 - (float)((float)(v27.f32[1] + v38) - v27.f32[1]))
        + (float)(v27.f32[1] - (float)((float)(v27.f32[1] + v38) - (float)((float)(v27.f32[1] + v38) - v27.f32[1])));
    v41 = v40 - v27.f32[0];
    v114[0] = _S2;
    v114[1] = (float)((float)(v40 - (float)(v40 - v27.f32[0])) - v27.f32[0])
            + (float)(v40 - (float)((float)(v40 - v27.f32[0]) + (float)(v40 - (float)(v40 - v27.f32[0]))));
    v27.f32[0] = v39 + (float)(v40 - v27.f32[0]);
    v114[2] = (float)(v41 - (float)(v27.f32[0] - v39)) + (float)(v39 - (float)(v27.f32[0] - (float)(v27.f32[0] - v39)));
    v114[3] = v27.f32[0];
    for (i = 1; i != 4; ++i)
      _S2 = _S2 + v114[i];
    if (_S2 < (float)(v22 * 0.00097942) && (float)(v22 * 0.00097942) > (float)-_S2)
    {
      v44 = vsub_f32(v24, v26);
      v45 = vsub_f32(v15, v18);
      v46 = vadd_f32(vsub_f32(v44, v25), vsub_f32(v24, vadd_f32(v26, v44)));
      v47 = vadd_f32(vsub_f32(v45, v16), vsub_f32(v15, vadd_f32(v18, v45)));
      *(float32x2_t *)v48.f32 = v46;
      *(float32x2_t *)&v48.u32[2] = v47;
      if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqzq_f32(v48)))) & 1) != 0)
      {
        v49 = vmul_f32(v18, v46);
        v50 = vmla_f32(v49, v47, v26);
        v51 = (float)(fabsf(_S2) * 0.0014668) + (float)(v22 * 0.0000021532);
        _S2 = vsub_f32((float32x2_t)vdup_lane_s32((int32x2_t)v50, 1), v50).f32[0] + _S2;
        if (_S2 < v51 && v51 > (float)-_S2)
        {
          v105 = v46.f32[1];
          v53 = vmuls_lane_f32(4096.0, v46, 1);
          _S10 = v53 - (float)(v53 - v46.f32[1]);
          _S11 = v46.f32[1] - _S10;
          __asm
          {
            FMLS            S5, S10, V3.S[1]
            FMLS            S5, S11, V3.S[1]
            FMLA            S2, S11, V1.S[1]
          }
          _S12 = (float)(4096.0 * v46.f32[0]) - (float)((float)(4096.0 * v46.f32[0]) - v46.f32[0]);
          _S13 = v46.f32[0] - _S12;
          __asm
          {
            FMLS            S6, S12, V3.S[0]
            FMLS            S6, S13, V3.S[0]
          }
          v67 = vmlas_n_f32(-(float)(_S6 + (float)((float)-_S12 * _D1.f32[0])), v46.f32[0] - _S12, _D1.f32[0]);
          v68 = _S2 - v67;
          v69 = (float)((float)(_S2 - (float)(_S2 - v67)) - v67)
              + (float)(_S2 - (float)((float)(_S2 - v67) + (float)(_S2 - (float)(_S2 - v67))));
          v70 = v49.f32[1] + v68;
          v71 = (float)(v68 - (float)((float)(v49.f32[1] + v68) - v49.f32[1]))
              + (float)(v49.f32[1] - (float)((float)(v49.f32[1] + v68) - (float)((float)(v49.f32[1] + v68) - v49.f32[1])));
          v72 = v71 - v49.f32[0];
          v107 = v69;
          v108 = (float)((float)(v71 - (float)(v71 - v49.f32[0])) - v49.f32[0])
               + (float)(v71 - (float)((float)(v71 - v49.f32[0]) + (float)(v71 - (float)(v71 - v49.f32[0]))));
          v73 = v70 + (float)(v71 - v49.f32[0]);
          v109 = (float)(v72 - (float)(v73 - v70)) + (float)(v70 - (float)(v73 - (float)(v73 - v70)));
          v110 = v73;
          v102 = v36;
          v103 = v31;
          v101 = v35;
          v104 = v46;
          v106 = v47;
          v74 = sub_1DEE659F0(4, v114, 4, &v107, v113);
          v75 = vmul_f32(v26, v106);
          v76 = vmuls_lane_f32(4096.0, v106, 1);
          _S15 = v76 - (float)(v76 - v106.f32[1]);
          _S8 = v106.f32[1] - _S15;
          _V4.S[1] = v101.i32[1];
          _V16.S[1] = v102.i32[1];
          __asm
          {
            FMLA            S3, S15, V4.S[1]
            FMLA            S3, S15, V16.S[1]
          }
          _V6.S[1] = v103.i32[1];
          __asm { FMLA            S0, S8, V6.S[1] }
          v85 = (float)(4096.0 * v106.f32[0]) - (float)((float)(4096.0 * v106.f32[0]) - v106.f32[0]);
          v86 = vmlas_n_f32(-(float)(vmlas_n_f32(vmlas_n_f32(v75.f32[0], v85, v101.f32[0]), v85, v102.f32[0])+ (float)(v101.f32[0] * (float)(v106.f32[0] - v85))), v106.f32[0] - v85, v103.f32[0]);
          v87 = _S0 - v86;
          v88 = (float)(v87 - (float)((float)(v75.f32[1] + v87) - v75.f32[1]))
              + (float)(v75.f32[1] - (float)((float)(v75.f32[1] + v87) - (float)((float)(v75.f32[1] + v87) - v75.f32[1])));
          v107 = (float)((float)(_S0 - (float)(_S0 - v86)) - v86)
               + (float)(_S0 - (float)((float)(_S0 - v86) + (float)(_S0 - (float)(_S0 - v86))));
          v108 = (float)((float)(v88 - (float)(v88 - v75.f32[0])) - v75.f32[0])
               + (float)(v88 - (float)((float)(v88 - v75.f32[0]) + (float)(v88 - (float)(v88 - v75.f32[0]))));
          v109 = (float)((float)(v88 - v75.f32[0])
                       - (float)((float)((float)(v75.f32[1] + v87) + (float)(v88 - v75.f32[0]))
                               - (float)(v75.f32[1] + v87)))
               + (float)((float)(v75.f32[1] + v87)
                       - (float)((float)((float)(v75.f32[1] + v87) + (float)(v88 - v75.f32[0]))
                               - (float)((float)((float)(v75.f32[1] + v87) + (float)(v88 - v75.f32[0]))
                                       - (float)(v75.f32[1] + v87))));
          v110 = (float)(v75.f32[1] + (float)(_S0 - v86)) + (float)(v88 - v75.f32[0]);
          v89 = sub_1DEE659F0(v74, v113, 4, &v107, v112);
          v90 = vmuls_lane_f32(v105, v106, 1);
          v91 = -(float)((float)((float)((float)(v90 - (float)(_S10 * _S15)) - (float)(_S11 * _S15))
                               - (float)(_S10 * _S8))
                       - (float)(_S11 * _S8));
          v92 = vmul_f32(v104, v106).f32[0];
          v93 = -(float)((float)((float)((float)(v92 - (float)(_S12 * v85)) - (float)(_S13 * v85))
                               - (float)(_S12 * (float)(v106.f32[0] - v85)))
                       - (float)(_S13 * (float)(v106.f32[0] - v85)));
          v94 = v91 - v93;
          v95 = (float)((float)(v91 - (float)(v91 - v93)) - v93)
              + (float)(v91 - (float)((float)(v91 - v93) + (float)(v91 - (float)(v91 - v93))));
          v96 = v90 + v94;
          v97 = (float)(v94 - (float)((float)(v90 + v94) - v90))
              + (float)(v90 - (float)((float)(v90 + v94) - (float)((float)(v90 + v94) - v90)));
          v98 = v97 - v92;
          v107 = v95;
          v108 = (float)((float)(v97 - (float)(v97 - v92)) - v92)
               + (float)(v97 - (float)((float)(v97 - v92) + (float)(v97 - (float)(v97 - v92))));
          v99 = v96 + (float)(v97 - v92);
          v109 = (float)(v98 - (float)(v99 - v96)) + (float)(v96 - (float)(v99 - (float)(v99 - v96)));
          v110 = v99;
          _S2 = v111[(int)sub_1DEE659F0(v89, v112, 4, &v107, v111) - 1];
        }
      }
    }
  }
LABEL_26:
  __asm { FCVT            H0, S2 }
  return result;
}

__int16 _simd_orient_vh3@<H0>(float16x4_t a1@<D0>, float16x4_t a2@<D1>, float16x4_t a3@<D2>)
{
  float32x4_t v3;
  int32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v10;
  float v11;
  double v13;
  __int16 result;

  v3 = vcvtq_f32_f16(a1);
  v4 = (int32x4_t)vcvtq_f32_f16(a2);
  v5 = vcvtq_f32_f16(a3);
  v6 = vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v4, (int8x16_t)v4, 0xCuLL), (int8x16_t)v4, 8uLL), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v5, (int32x4_t)v5), (int8x16_t)v5, 0xCuLL));
  v7 = vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v4, v4), (int8x16_t)v4, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v5, (int8x16_t)v5, 0xCuLL), (int8x16_t)v5, 8uLL));
  v8 = vmulq_f32(vsubq_f32(v6, v7), v3);
  _S2 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v8, 2), vaddq_f32(v8, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v8.f32, 1))).f32[0];
  v10 = vmulq_f32(vaddq_f32(vabsq_f32(v6), vabsq_f32(v7)), vabsq_f32(v3));
  v11 = 0.0034313
      * vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v10, 2), vaddq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 1))).f32[0];
  if (_S2 > v11 || v11 < (float)-_S2)
  {
    __asm { FCVT            H0, S2 }
  }
  else
  {
    v13 = (vmulq_lane_f32(v5, *(float32x2_t *)v3.f32, 1).f32[0] - vmulq_lane_f32(v3, *(float32x2_t *)v5.f32, 1).f32[0])
        * *(float *)&v4.i32[2];
    _Q0 = vmulq_f64(vsubq_f64(vcvtq_f64_f32(vmul_f32((float32x2_t)vrev64_s32(*(int32x2_t *)v4.i8), (float32x2_t)__PAIR64__(v5.u32[1], v3.u32[0]))), vcvtq_f64_f32(vmul_f32(*(float32x2_t *)v4.i8, (float32x2_t)vext_s8(*(int8x8_t *)v3.f32, *(int8x8_t *)v5.f32, 4uLL)))), vcvtq_f64_f32((float32x2_t)*(_OWORD *)&vzip2q_s32((int32x4_t)v5, (int32x4_t)v3)));
    _Q0.f64[0] = _Q0.f64[0] + _Q0.f64[1] + v13;
    __asm { FCVT            H0, D0 }
  }
  return result;
}

__int16 _simd_orient_ph3@<H0>(float16x4_t a1@<D0>, float16x4_t a2@<D1>, float16x4_t a3@<D2>, float16x4_t a4@<D3>)
{
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v15;
  float v16;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  int v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  int v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  int v58;
  int v59;
  int v60;
  int v61;
  uint64_t v62;
  float *v63;
  float32x4_t v64;
  float32x4_t v65;
  float v66;
  float32x4_t v67;
  float v68;
  float v69;
  float v70;
  float v72;
  float32x4_t v73;
  float v74;
  float32x4_t v75;
  float v76;
  float32x4_t v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  int v93;
  float v94;
  float v95;
  float v96;
  float v97;
  float v98;
  float v99;
  float v100;
  float v101;
  float v102;
  float v103;
  float v104;
  float v105;
  float v106;
  float v107;
  float v108;
  float v109;
  float v110;
  float v111;
  float v112;
  float v113;
  float v114;
  float v115;
  float v116;
  int v117;
  float v118;
  float v119;
  float v120;
  float v121;
  float v122;
  float v123;
  float v124;
  float v125;
  float v126;
  float v127;
  float v128;
  float v129;
  float v130;
  float v131;
  float v132;
  float v133;
  float v134;
  int v135;
  float v136;
  float v137;
  float v138;
  float v139;
  float v140;
  float v141;
  float v142;
  float v143;
  float v144;
  float v145;
  float v146;
  float v147;
  float v148;
  float v149;
  float v150;
  float v151;
  float v152;
  int v153;
  int v154;
  float *v155;
  float *v156;
  int v157;
  int v158;
  int v159;
  int v160;
  int v161;
  int v162;
  int v163;
  int v164;
  int v165;
  float *v166;
  int v167;
  float *v168;
  float v169;
  float v170;
  float v171;
  float v172;
  float v173;
  float v174;
  float v175;
  float v176;
  float v177;
  float v178;
  float v179;
  float v180;
  float v181;
  float v182;
  float v183;
  int v184;
  float v185;
  float v186;
  float v187;
  float *v188;
  float v189;
  float v190;
  float v191;
  float v192;
  float v193;
  float v194;
  float v195;
  float v196;
  float v197;
  float v198;
  float v199;
  int v200;
  float v201;
  float v202;
  float v203;
  float v204;
  float v205;
  float v206;
  float v207;
  float v208;
  float v209;
  float v210;
  float v211;
  float v212;
  float v213;
  int v214;
  float v215;
  float v216;
  float v217;
  float *v218;
  float v219;
  float v220;
  float v221;
  float v222;
  float v223;
  float v224;
  float v225;
  float v226;
  float v227;
  float v228;
  int v229;
  float v230;
  float v231;
  float v232;
  float v233;
  float v234;
  float v235;
  float v236;
  float v237;
  float v238;
  float v239;
  float v240;
  float v241;
  float v242;
  int v243;
  float v244;
  float v245;
  float v246;
  float *v247;
  float v248;
  float v249;
  float v250;
  float v251;
  float v252;
  float v253;
  float v254;
  float v255;
  float v256;
  float v257;
  float v258;
  int v259;
  float v260;
  float v261;
  float v262;
  float v263;
  int v264;
  int v265;
  float *v266;
  int v267;
  __int16 result;
  float v272;
  float v273;
  float v274;
  float v275;
  float v276;
  float v277;
  float v278;
  float v279;
  float v280;
  float v281;
  float v282;
  float v283;
  float v284;
  float v285;
  float32x4_t v286;
  float32x4_t v287;
  float v288;
  float32x4_t v289;
  float v290;
  float32x4_t v291;
  float v292;
  float v293;
  float v294;
  float v295;
  float v296;
  float v297;
  float v298;
  float v299;
  float v300;
  float v301;
  float v302;
  float v303;
  float v304;
  float32x4_t v305;
  float v306;
  float32x4_t v307;
  float v308;
  float32x4_t v309;
  float v310;
  float v311[16];
  float v312[12];
  float v313;
  float v314;
  float v315;
  float v316;
  float v317[8];
  float v318[8];
  float v319[8];
  float v320;
  float v321;
  float v322;
  float v323;
  float v324;
  float v325;
  float v326;
  float v327;
  float v328;
  float v329;
  float v330;
  float v331;
  float v332;
  float v333;
  float v334;
  float v335;
  float v336;
  float v337;
  float v338;
  float v339;
  float v340;
  float v341;
  float v342;
  float v343;
  float v344[192];
  float v345;
  int v346;
  float v347[16];
  float v348[8];
  float v349[8];
  float v350[8];
  float v351[4];
  float v352[4];
  float v353[4];

  v4 = vcvtq_f32_f16(a1);
  v5 = vcvtq_f32_f16(a2);
  v6 = vcvtq_f32_f16(a3);
  v7 = vcvtq_f32_f16(a4);
  v8 = vsubq_f32(v4, v7);
  v9 = (int32x4_t)vsubq_f32(v5, v7);
  v10 = (int32x4_t)vsubq_f32(v6, v7);
  v11 = vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v9, (int8x16_t)v9, 0xCuLL), (int8x16_t)v9, 8uLL), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v10, v10), (int8x16_t)v10, 0xCuLL));
  v12 = vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v9, v9), (int8x16_t)v9, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v10, (int8x16_t)v10, 0xCuLL), (int8x16_t)v10, 8uLL));
  v13 = vmulq_f32(v8, vsubq_f32(v11, v12));
  _S4 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2), vaddq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1))).f32[0];
  v15 = vmulq_f32(vaddq_f32(vabsq_f32(v11), vabsq_f32(v12)), vabdq_f32(v4, v7));
  v16 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v15, 2), vaddq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 1))).f32[0];
  if (_S4 <= (float)(0.0034313 * v16) && (float)(0.0034313 * v16) >= (float)-_S4)
  {
    v294 = v16;
    v281 = v4.f32[1];
    v18 = v4.f32[1] - v7.f32[1];
    v282 = v5.f32[1];
    v285 = v7.f32[1];
    v283 = v6.f32[1];
    v19 = v6.f32[1] - v7.f32[1];
    v286 = v4;
    v20 = (float)(v6.f32[1] - v7.f32[1]) * *(float *)v9.i32;
    v309 = v8;
    v21 = (float)(4096.0 * *(float *)v9.i32) - (float)((float)(4096.0 * *(float *)v9.i32) - *(float *)v9.i32);
    v22 = (float)((float)(v6.f32[1] - v7.f32[1]) * 4096.0)
        - (float)((float)((float)(v6.f32[1] - v7.f32[1]) * 4096.0) - (float)(v6.f32[1] - v7.f32[1]));
    v23 = (float)(v6.f32[1] - v7.f32[1]) - v22;
    v300 = v21;
    v301 = *(float *)v9.i32 - v21;
    v24 = -(float)((float)((float)((float)(v20 - (float)(v21 * v22)) - (float)((float)(*(float *)v9.i32 - v21) * v22))
                         - (float)(v21 * v23))
                 - (float)((float)(*(float *)v9.i32 - v21) * v23));
    v304 = v5.f32[1] - v7.f32[1];
    v4.f32[0] = (float)(v5.f32[1] - v7.f32[1]) * *(float *)v10.i32;
    v25 = (float)(4096.0 * *(float *)v10.i32) - (float)((float)(4096.0 * *(float *)v10.i32) - *(float *)v10.i32);
    v26 = *(float *)v10.i32 - v25;
    v27 = (float)((float)(v5.f32[1] - v7.f32[1]) * 4096.0)
        - (float)((float)((float)(v5.f32[1] - v7.f32[1]) * 4096.0) - (float)(v5.f32[1] - v7.f32[1]));
    v298 = (float)(v5.f32[1] - v7.f32[1]) - v27;
    v299 = v27;
    v28 = -(float)((float)((float)((float)(v4.f32[0] - (float)(v25 * v27))
                                 - (float)((float)(*(float *)v10.i32 - v25) * v27))
                         - (float)(v25 * v298))
                 - (float)((float)(*(float *)v10.i32 - v25) * v298));
    v29 = v24 - v28;
    v30 = (float)((float)(v24 - (float)(v24 - v28)) - v28)
        + (float)(v24 - (float)((float)(v24 - v28) + (float)(v24 - (float)(v24 - v28))));
    v31 = v20 + v29;
    v32 = (float)(v29 - (float)((float)(v20 + v29) - v20))
        + (float)(v20 - (float)((float)(v20 + v29) - (float)((float)(v20 + v29) - v20)));
    v287 = v5;
    v289 = v7;
    v284 = v4.f32[2];
    v353[0] = v30;
    v353[1] = (float)((float)(v32 - (float)(v32 - v4.f32[0])) - v4.f32[0])
            + (float)(v32 - (float)((float)(v32 - v4.f32[0]) + (float)(v32 - (float)(v32 - v4.f32[0]))));
    v277 = v4.f32[0];
    v278 = v5.f32[2];
    v353[2] = (float)((float)(v32 - v4.f32[0]) - (float)((float)(v31 + (float)(v32 - v4.f32[0])) - v31))
            + (float)(v31
                    - (float)((float)(v31 + (float)(v32 - v4.f32[0]))
                            - (float)((float)(v31 + (float)(v32 - v4.f32[0])) - v31)));
    v353[3] = v31 + (float)(v32 - v4.f32[0]);
    v291 = v6;
    v279 = v6.f32[2];
    v280 = v7.f32[2];
    v302 = v6.f32[2] - v7.f32[2];
    v303 = v5.f32[2] - v7.f32[2];
    v293 = v4.f32[2] - v7.f32[2];
    v305 = (float32x4_t)v9;
    v307 = (float32x4_t)v10;
    v33 = sub_1DEE65BF8(4, v353, v350, v4.f32[2] - v7.f32[2]);
    v34 = v18;
    v296 = v18;
    v35 = v18 * v307.f32[0];
    v36 = (float)(v18 * 4096.0) - (float)((float)(v18 * 4096.0) - v18);
    v37 = v34 - v36;
    v274 = v25;
    v275 = v26;
    v38 = -(float)((float)((float)((float)(v35 - (float)(v25 * v36)) - (float)(v26 * v36))
                         - (float)(v25 * (float)(v34 - v36)))
                 - (float)(v26 * (float)(v34 - v36)));
    v39 = v19;
    v40 = v19 * v309.f32[0];
    v41 = (float)(4096.0 * v309.f32[0]) - (float)((float)(4096.0 * v309.f32[0]) - v309.f32[0]);
    v272 = v23;
    v273 = v22;
    v42 = -(float)((float)((float)((float)(v40 - (float)(v41 * v22)) - (float)((float)(v309.f32[0] - v41) * v22))
                         - (float)(v41 * v23))
                 - (float)((float)(v309.f32[0] - v41) * v23));
    v43 = v38 - v42;
    v44 = (float)((float)(v38 - (float)(v38 - v42)) - v42)
        + (float)(v38 - (float)((float)(v38 - v42) + (float)(v38 - (float)(v38 - v42))));
    v45 = v35 + v43;
    v46 = (float)(v43 - (float)((float)(v35 + v43) - v35))
        + (float)(v35 - (float)((float)(v35 + v43) - (float)((float)(v35 + v43) - v35)));
    v47 = v46 - v40;
    v352[0] = v44;
    v352[1] = (float)((float)(v46 - (float)(v46 - v40)) - v40)
            + (float)(v46 - (float)((float)(v46 - v40) + (float)(v46 - (float)(v46 - v40))));
    v48 = v45 + (float)(v46 - v40);
    v352[2] = (float)(v47 - (float)(v48 - v45)) + (float)(v45 - (float)(v48 - (float)(v48 - v45)));
    v352[3] = v48;
    v49 = sub_1DEE65BF8(4, v352, v349, v303);
    v50 = v309.f32[0] - v41;
    v276 = v36;
    v51 = -(float)((float)((float)((float)((float)(v304 * v309.f32[0]) - (float)(v41 * v299)) - (float)(v50 * v299))
                         - (float)(v41 * v298))
                 - (float)(v50 * v298));
    v52 = -(float)((float)((float)((float)((float)(v296 * v305.f32[0]) - (float)(v300 * v36)) - (float)(v301 * v36))
                         - (float)(v300 * v37))
                 - (float)(v301 * v37));
    v53 = v51 - v52;
    v54 = (float)((float)(v51 - (float)(v51 - v52)) - v52)
        + (float)(v51 - (float)((float)(v51 - v52) + (float)(v51 - (float)(v51 - v52))));
    v55 = (float)(v304 * v309.f32[0]) + v53;
    v56 = (float)(v53 - (float)(v55 - (float)(v304 * v309.f32[0])))
        + (float)((float)(v304 * v309.f32[0]) - (float)(v55 - (float)(v55 - (float)(v304 * v309.f32[0]))));
    v57 = v56 - (float)(v296 * v305.f32[0]);
    v351[0] = v54;
    v351[1] = (float)((float)(v56 - v57) - (float)(v296 * v305.f32[0]))
            + (float)(v56 - (float)(v57 + (float)(v56 - v57)));
    v351[2] = (float)(v57 - (float)((float)(v55 + v57) - v55))
            + (float)(v55 - (float)((float)(v55 + v57) - (float)((float)(v55 + v57) - v55)));
    v351[3] = v55 + v57;
    v58 = sub_1DEE65BF8(4, v351, v348, v302);
    v59 = sub_1DEE659F0(v33, v350, v49, v349, v347);
    v60 = sub_1DEE659F0(v59, v347, v58, v348, &v345);
    v61 = v60;
    _S4 = v345;
    if (v60 < 2)
    {
      v65 = v305;
      v64 = v307;
      v66 = v304;
      v67 = v309;
      v68 = v296;
      v69 = v294;
    }
    else
    {
      v62 = v60 - 1;
      v63 = (float *)&v346;
      v65 = v305;
      v64 = v307;
      v66 = v304;
      v67 = v309;
      v68 = v296;
      v69 = v294;
      do
      {
        v70 = *v63++;
        _S4 = _S4 + v70;
        --v62;
      }
      while (v62);
    }
    if (_S4 < (float)(v69 * 0.0014715) && (float)(v69 * 0.0014715) > (float)-_S4)
    {
      v72 = v40;
      v73 = vsubq_f32(v286, v67);
      v74 = vaddq_f32(vsubq_f32(v73, v289), vsubq_f32(v286, vaddq_f32(v67, v73))).f32[0];
      v75 = vsubq_f32(v287, v65);
      LODWORD(v76) = vaddq_f32(vsubq_f32(v75, v289), vsubq_f32(v287, vaddq_f32(v65, v75))).u32[0];
      v77 = vsubq_f32(v291, v64);
      LODWORD(v78) = vaddq_f32(vsubq_f32(v77, v289), vsubq_f32(v291, vaddq_f32(v64, v77))).u32[0];
      v79 = (float)((float)(v281 - v68) - v285) + (float)(v281 - (float)(v68 + (float)(v281 - v68)));
      v80 = (float)((float)(v282 - v66) - v285) + (float)(v282 - (float)(v66 + (float)(v282 - v66)));
      v81 = (float)((float)(v283 - v39) - v285) + (float)(v283 - (float)(v39 + (float)(v283 - v39)));
      v82 = (float)((float)(v284 - v293) - v280) + (float)(v284 - (float)(v293 + (float)(v284 - v293)));
      v83 = (float)((float)(v278 - v303) - v280) + (float)(v278 - (float)(v303 + (float)(v278 - v303)));
      v84 = (float)((float)(v279 - v302) - v280) + (float)(v279 - (float)(v302 + (float)(v279 - v302)));
      if (v74 != 0.0
        || v76 != 0.0
        || v78 != 0.0
        || v79 != 0.0
        || v80 != 0.0
        || v81 != 0.0
        || v82 != 0.0
        || v83 != 0.0
        || v84 != 0.0)
      {
        v85 = (float)(fabsf(_S4) * 0.0014668) + (float)(v69 * 0.0000062324);
        v86 = v39 * v76;
        v87 = v64.f32[0] * v80;
        v88 = v68 * v78;
        v89 = v67.f32[0] * v81;
        v90 = v66 * v74;
        v91 = v65.f32[0] * v79;
        _S4 = (float)((float)((float)((float)-(float)((float)(v296 * v305.f32[0]) - (float)(v67.f32[0] * v66)) * v84)
                            + (float)(v302
                                    * (float)((float)((float)(v66 * v74) + (float)(v67.f32[0] * v80))
                                            - (float)((float)(v65.f32[0] * v79) + (float)(v68 * v76)))))
                    + (float)((float)((float)((float)-(float)(v277 - (float)(v65.f32[0] * v39)) * v82)
                                    + (float)(v293
                                            * (float)((float)((float)(v39 * v76) + (float)(v65.f32[0] * v81))
                                                    - (float)((float)(v64.f32[0] * v80) + (float)(v66 * v78)))))
                            + (float)((float)((float)-(float)(v72 - (float)(v64.f32[0] * v68)) * v83)
                                    + (float)(v303
                                            * (float)((float)((float)(v68 * v78) + (float)(v64.f32[0] * v79))
                                                    - (float)((float)(v67.f32[0] * v81) + (float)(v39 * v74)))))))
            + _S4;
        if (_S4 < v85 && v85 > (float)-_S4)
        {
          v295 = (float)((float)(v284 - v293) - v280) + (float)(v284 - (float)(v293 + (float)(v284 - v293)));
          if (v74 == 0.0)
          {
            if (v79 == 0.0)
            {
              v340 = 0.0;
              v336 = 0.0;
              v93 = 1;
              goto LABEL_37;
            }
            v340 = -(float)((float)((float)((float)((float)-(float)(v79 * v65.f32[0])
                                                  - (float)((float)((float)(v79 * -4096.0)
                                                                  - (float)(v79 + (float)(v79 * -4096.0)))
                                                          * v300))
                                          - (float)((float)((float)-v79
                                                          - (float)((float)(v79 * -4096.0)
                                                                  - (float)(v79 + (float)(v79 * -4096.0))))
                                                  * v300))
                                  - (float)((float)((float)(v79 * -4096.0) - (float)(v79 + (float)(v79 * -4096.0)))
                                          * v301))
                          - (float)((float)((float)-v79
                                          - (float)((float)(v79 * -4096.0) - (float)(v79 + (float)(v79 * -4096.0))))
                                  * v301));
            v341 = -(float)(v79 * v65.f32[0]);
            v336 = -(float)((float)((float)((float)((float)(v64.f32[0] * v79)
                                                  - (float)((float)((float)(v79 * 4096.0)
                                                                  - (float)((float)(v79 * 4096.0) - v79))
                                                          * v274))
                                          - (float)((float)(v79
                                                          - (float)((float)(v79 * 4096.0)
                                                                  - (float)((float)(v79 * 4096.0) - v79)))
                                                  * v274))
                                  - (float)((float)((float)(v79 * 4096.0) - (float)((float)(v79 * 4096.0) - v79)) * v275))
                          - (float)((float)(v79 - (float)((float)(v79 * 4096.0) - (float)((float)(v79 * 4096.0) - v79)))
                                  * v275));
            v337 = v64.f32[0] * v79;
          }
          else
          {
            v94 = (float)(v74 * 4096.0) - (float)((float)(v74 * 4096.0) - v74);
            v95 = -(float)((float)((float)((float)(v90 - (float)(v94 * v299)) - (float)((float)(v74 - v94) * v299))
                                 - (float)(v94 * v298))
                         - (float)((float)(v74 - v94) * v298));
            if (v79 != 0.0)
            {
              v96 = (float)(v79 * 4096.0) - (float)((float)(v79 * 4096.0) - v79);
              v97 = -(float)((float)((float)((float)(v91 - (float)(v96 * v300)) - (float)((float)(v79 - v96) * v300))
                                   - (float)(v96 * v301))
                           - (float)((float)(v79 - v96) * v301));
              v98 = v95 - v97;
              v99 = (float)((float)(v95 - (float)(v95 - v97)) - v97)
                  + (float)(v95 - (float)((float)(v95 - v97) + (float)(v95 - (float)(v95 - v97))));
              v100 = v90 + v98;
              v101 = (float)(v98 - (float)((float)(v90 + v98) - v90))
                   + (float)(v90 - (float)((float)(v90 + v98) - (float)((float)(v90 + v98) - v90)));
              v102 = v101 - v91;
              v103 = v101 - (float)(v101 - v91);
              v104 = (float)(v101 - v91) + v103;
              v105 = v103 - v91;
              v68 = v296;
              v340 = v99;
              v341 = v105 + (float)(v101 - v104);
              v106 = v100 + v102;
              v107 = (float)(v100 + v102) - v100;
              v108 = (float)(v100 + v102) - v107;
              v109 = v102 - v107;
              v64.i32[0] = v307.i32[0];
              v342 = v109 + (float)(v100 - v108);
              v343 = v106;
              v110 = -(float)((float)((float)((float)((float)(v307.f32[0] * v79) - (float)(v96 * v274))
                                            - (float)((float)(v79 - v96) * v274))
                                    - (float)(v96 * v275))
                            - (float)((float)(v79 - v96) * v275));
              v111 = -(float)((float)((float)((float)((float)(v39 * v74) + (float)((float)-v94 * v273))
                                            + (float)((float)-(float)(v74 - v94) * v273))
                                    + (float)((float)-v94 * v272))
                            - (float)((float)(v74 - v94) * v272));
              v112 = v110 - v111;
              v113 = (float)((float)(v110 - (float)(v110 - v111)) - v111)
                   + (float)(v110 - (float)((float)(v110 - v111) + (float)(v110 - (float)(v110 - v111))));
              v114 = (float)(v307.f32[0] * v79) + v112;
              v115 = (float)(v112 - (float)(v114 - (float)(v307.f32[0] * v79)))
                   + (float)((float)(v307.f32[0] * v79) - (float)(v114 - (float)(v114 - (float)(v307.f32[0] * v79))));
              v116 = v115 - (float)(v39 * v74);
              v336 = v113;
              v337 = (float)((float)(v115 - v116) - (float)(v39 * v74))
                   + (float)(v115 - (float)(v116 + (float)(v115 - v116)));
              v338 = (float)(v116 - (float)((float)(v114 + v116) - v114))
                   + (float)(v114 - (float)((float)(v114 + v116) - (float)((float)(v114 + v116) - v114)));
              v339 = v114 + v116;
              v93 = 4;
LABEL_37:
              if (v76 == 0.0)
              {
                if (v80 == 0.0)
                {
                  v332 = 0.0;
                  v328 = 0.0;
                  v117 = 1;
                  goto LABEL_45;
                }
                v332 = -(float)((float)((float)((float)((float)-(float)(v80 * v64.f32[0])
                                                      - (float)((float)((float)(v80 * -4096.0)
                                                                      - (float)(v80 + (float)(v80 * -4096.0)))
                                                              * v274))
                                              - (float)((float)((float)-v80
                                                              - (float)((float)(v80 * -4096.0)
                                                                      - (float)(v80 + (float)(v80 * -4096.0))))
                                                      * v274))
                                      - (float)((float)((float)(v80 * -4096.0) - (float)(v80 + (float)(v80 * -4096.0)))
                                              * v275))
                              - (float)((float)((float)-v80
                                              - (float)((float)(v80 * -4096.0) - (float)(v80 + (float)(v80 * -4096.0))))
                                      * v275));
                v333 = -(float)(v80 * v64.f32[0]);
                v328 = -(float)((float)((float)((float)((float)(v67.f32[0] * v80)
                                                      - (float)((float)((float)(v80 * 4096.0)
                                                                      - (float)((float)(v80 * 4096.0) - v80))
                                                              * v41))
                                              - (float)((float)(v80
                                                              - (float)((float)(v80 * 4096.0)
                                                                      - (float)((float)(v80 * 4096.0) - v80)))
                                                      * v41))
                                      - (float)((float)((float)(v80 * 4096.0) - (float)((float)(v80 * 4096.0) - v80))
                                              * v50))
                              - (float)((float)(v80
                                              - (float)((float)(v80 * 4096.0) - (float)((float)(v80 * 4096.0) - v80)))
                                      * v50));
                v329 = v67.f32[0] * v80;
              }
              else
              {
                v118 = (float)(v76 * 4096.0) - (float)((float)(v76 * 4096.0) - v76);
                v119 = -(float)((float)((float)((float)(v86 - (float)(v118 * v273)) - (float)((float)(v76 - v118) * v273))
                                      - (float)(v118 * v272))
                              - (float)((float)(v76 - v118) * v272));
                if (v80 != 0.0)
                {
                  v120 = (float)(v80 * 4096.0) - (float)((float)(v80 * 4096.0) - v80);
                  v121 = -(float)((float)((float)((float)(v87 - (float)(v120 * v274))
                                                - (float)((float)(v80 - v120) * v274))
                                        - (float)(v120 * v275))
                                - (float)((float)(v80 - v120) * v275));
                  v122 = v119 - v121;
                  v123 = (float)((float)(v119 - (float)(v119 - v121)) - v121)
                       + (float)(v119 - (float)((float)(v119 - v121) + (float)(v119 - (float)(v119 - v121))));
                  v124 = v86 + v122;
                  v125 = (float)(v122 - (float)((float)(v86 + v122) - v86))
                       + (float)(v86 - (float)((float)(v86 + v122) - (float)((float)(v86 + v122) - v86)));
                  v126 = v125 - v87;
                  v332 = v123;
                  v333 = (float)((float)(v125 - (float)(v125 - v87)) - v87)
                       + (float)(v125 - (float)((float)(v125 - v87) + (float)(v125 - (float)(v125 - v87))));
                  v127 = v124 + (float)(v125 - v87);
                  v334 = (float)(v126 - (float)(v127 - v124)) + (float)(v124 - (float)(v127 - (float)(v127 - v124)));
                  v335 = v127;
                  v128 = -(float)((float)((float)((float)((float)(v67.f32[0] * v80) - (float)(v120 * v41))
                                                - (float)((float)(v80 - v120) * v41))
                                        - (float)(v120 * v50))
                                - (float)((float)(v80 - v120) * v50));
                  v129 = -(float)((float)((float)((float)((float)(v68 * v76) + (float)((float)-v118 * v276))
                                                + (float)((float)-(float)(v76 - v118) * v276))
                                        + (float)((float)-v118 * v37))
                                - (float)((float)(v76 - v118) * v37));
                  v130 = v128 - v129;
                  v131 = (float)((float)(v128 - (float)(v128 - v129)) - v129)
                       + (float)(v128 - (float)((float)(v128 - v129) + (float)(v128 - (float)(v128 - v129))));
                  v132 = (float)(v67.f32[0] * v80) + v130;
                  v133 = (float)(v130 - (float)(v132 - (float)(v67.f32[0] * v80)))
                       + (float)((float)(v67.f32[0] * v80) - (float)(v132 - (float)(v132 - (float)(v67.f32[0] * v80))));
                  v134 = v133 - (float)(v68 * v76);
                  v328 = v131;
                  v329 = (float)((float)(v133 - v134) - (float)(v68 * v76))
                       + (float)(v133 - (float)(v134 + (float)(v133 - v134)));
                  v330 = (float)(v134 - (float)((float)(v132 + v134) - v132))
                       + (float)(v132 - (float)((float)(v132 + v134) - (float)((float)(v132 + v134) - v132)));
                  v331 = v132 + v134;
                  v117 = 4;
LABEL_45:
                  v308 = (float)((float)(v279 - v302) - v280) + (float)(v279 - (float)(v302 + (float)(v279 - v302)));
                  v306 = (float)((float)(v278 - v303) - v280) + (float)(v278 - (float)(v303 + (float)(v278 - v303)));
                  v297 = v78;
                  v290 = v74;
                  v292 = v76;
                  v288 = (float)((float)(v283 - v39) - v285) + (float)(v283 - (float)(v39 + (float)(v283 - v39)));
                  if (v78 == 0.0)
                  {
                    if (v81 == 0.0)
                    {
                      v324 = 0.0;
                      v320 = 0.0;
                      v135 = 1;
                    }
                    else
                    {
                      v324 = -(float)((float)((float)((float)((float)-(float)(v81 * v67.f32[0])
                                                            - (float)((float)((float)(v81 * -4096.0)
                                                                            - (float)(v81 + (float)(v81 * -4096.0)))
                                                                    * v41))
                                                    - (float)((float)((float)-v81
                                                                    - (float)((float)(v81 * -4096.0)
                                                                            - (float)(v81 + (float)(v81 * -4096.0))))
                                                            * v41))
                                            - (float)((float)((float)(v81 * -4096.0)
                                                            - (float)(v81 + (float)(v81 * -4096.0)))
                                                    * v50))
                                    - (float)((float)((float)-v81
                                                    - (float)((float)(v81 * -4096.0)
                                                            - (float)(v81 + (float)(v81 * -4096.0))))
                                            * v50));
                      v325 = -(float)(v81 * v67.f32[0]);
                      v320 = -(float)((float)((float)((float)((float)(v65.f32[0] * v81)
                                                            - (float)((float)((float)(v81 * 4096.0)
                                                                            - (float)((float)(v81 * 4096.0) - v81))
                                                                    * v300))
                                                    - (float)((float)(v81
                                                                    - (float)((float)(v81 * 4096.0)
                                                                            - (float)((float)(v81 * 4096.0) - v81)))
                                                            * v300))
                                            - (float)((float)((float)(v81 * 4096.0)
                                                            - (float)((float)(v81 * 4096.0) - v81))
                                                    * v301))
                                    - (float)((float)(v81
                                                    - (float)((float)(v81 * 4096.0)
                                                            - (float)((float)(v81 * 4096.0) - v81)))
                                            * v301));
                      v321 = v65.f32[0] * v81;
                      v135 = 2;
                    }
                  }
                  else
                  {
                    v136 = (float)(v78 * 4096.0) - (float)((float)(v78 * 4096.0) - v78);
                    v137 = -(float)((float)((float)((float)(v88 - (float)(v136 * v276))
                                                  - (float)((float)(v78 - v136) * v276))
                                          - (float)(v136 * v37))
                                  - (float)((float)(v78 - v136) * v37));
                    if (v81 == 0.0)
                    {
                      v324 = -(float)((float)((float)((float)(v88 - (float)(v136 * v276))
                                                    - (float)((float)(v78 - v136) * v276))
                                            - (float)(v136 * v37))
                                    - (float)((float)(v78 - v136) * v37));
                      v325 = v88;
                      v320 = -(float)((float)((float)((float)((float)-(float)(v78 * v66)
                                                            - (float)((float)((float)(v78 * -4096.0)
                                                                            - (float)(v78 + (float)(v78 * -4096.0)))
                                                                    * v299))
                                                    - (float)((float)((float)-v78
                                                                    - (float)((float)(v78 * -4096.0)
                                                                            - (float)(v78 + (float)(v78 * -4096.0))))
                                                            * v299))
                                            - (float)((float)((float)(v78 * -4096.0)
                                                            - (float)(v78 + (float)(v78 * -4096.0)))
                                                    * v298))
                                    - (float)((float)((float)-v78
                                                    - (float)((float)(v78 * -4096.0)
                                                            - (float)(v78 + (float)(v78 * -4096.0))))
                                            * v298));
                      v321 = -(float)(v78 * v66);
                      v135 = 2;
                    }
                    else
                    {
                      v138 = (float)(v81 * 4096.0) - (float)((float)(v81 * 4096.0) - v81);
                      v139 = -(float)((float)((float)((float)(v89 - (float)(v138 * v41))
                                                    - (float)((float)(v81 - v138) * v41))
                                            - (float)(v138 * v50))
                                    - (float)((float)(v81 - v138) * v50));
                      v140 = v137 - v139;
                      v141 = (float)((float)(v137 - (float)(v137 - v139)) - v139)
                           + (float)(v137 - (float)((float)(v137 - v139) + (float)(v137 - (float)(v137 - v139))));
                      v142 = v88 + v140;
                      v143 = (float)(v140 - (float)((float)(v88 + v140) - v88))
                           + (float)(v88 - (float)((float)(v88 + v140) - (float)((float)(v88 + v140) - v88)));
                      v144 = v143 - v89;
                      v324 = v141;
                      v325 = (float)((float)(v143 - (float)(v143 - v89)) - v89)
                           + (float)(v143 - (float)((float)(v143 - v89) + (float)(v143 - (float)(v143 - v89))));
                      v145 = v142 + (float)(v143 - v89);
                      v326 = (float)(v144 - (float)(v145 - v142)) + (float)(v142 - (float)(v145 - (float)(v145 - v142)));
                      v327 = v145;
                      v146 = -(float)((float)((float)((float)((float)(v65.f32[0] * v81) - (float)(v138 * v300))
                                                    - (float)((float)(v81 - v138) * v300))
                                            - (float)(v138 * v301))
                                    - (float)((float)(v81 - v138) * v301));
                      v147 = -(float)((float)((float)((float)((float)(v66 * v78) + (float)((float)-v136 * v299))
                                                    + (float)((float)-(float)(v78 - v136) * v299))
                                            + (float)((float)-v136 * v298))
                                    - (float)((float)(v78 - v136) * v298));
                      v148 = v146 - v147;
                      v149 = (float)((float)(v146 - (float)(v146 - v147)) - v147)
                           + (float)(v146 - (float)((float)(v146 - v147) + (float)(v146 - (float)(v146 - v147))));
                      v150 = (float)(v65.f32[0] * v81) + v148;
                      v151 = (float)(v148 - (float)(v150 - (float)(v65.f32[0] * v81)))
                           + (float)((float)(v65.f32[0] * v81)
                                   - (float)(v150 - (float)(v150 - (float)(v65.f32[0] * v81))));
                      v152 = v151 - (float)(v66 * v78);
                      v320 = v149;
                      v321 = (float)((float)(v151 - v152) - (float)(v66 * v78))
                           + (float)(v151 - (float)(v152 + (float)(v151 - v152)));
                      v322 = (float)(v152 - (float)((float)(v150 + v152) - v150))
                           + (float)(v150 - (float)((float)(v150 + v152) - (float)((float)(v150 + v152) - v150)));
                      v323 = v150 + v152;
                      v135 = 4;
                    }
                  }
                  v153 = sub_1DEE659F0(v117, &v332, v135, &v320, v319);
                  v154 = sub_1DEE65BF8(v153, v319, v311, v293);
                  v155 = &v345;
                  v156 = v344;
                  v157 = sub_1DEE659F0(v61, &v345, v154, v311, v344);
                  v158 = sub_1DEE659F0(v135, &v324, v93, &v336, v318);
                  v159 = sub_1DEE65BF8(v158, v318, v311, v303);
                  v160 = sub_1DEE659F0(v157, v344, v159, v311, &v345);
                  v161 = sub_1DEE659F0(v93, &v340, v117, &v328, v317);
                  v162 = sub_1DEE65BF8(v161, v317, v311, v302);
                  v163 = sub_1DEE659F0(v160, &v345, v162, v311, v344);
                  if (v295 != 0.0)
                  {
                    v164 = sub_1DEE65BF8(4, v353, v312, v295);
                    v155 = v344;
                    v156 = &v345;
                    v163 = sub_1DEE659F0(v163, v344, v164, v312, &v345);
                  }
                  if (v306 == 0.0)
                  {
                    v166 = v156;
                    v156 = v155;
                  }
                  else
                  {
                    v165 = sub_1DEE65BF8(4, v352, v312, v306);
                    v163 = sub_1DEE659F0(v163, v156, v165, v312, v155);
                    v166 = v155;
                  }
                  if (v308 == 0.0)
                  {
                    v168 = v166;
                    v166 = v156;
                  }
                  else
                  {
                    v167 = sub_1DEE65BF8(4, v351, v312, v308);
                    v163 = sub_1DEE659F0(v163, v166, v167, v312, v156);
                    v168 = v156;
                  }
                  v169 = v297;
                  v171 = v290;
                  v170 = v292;
                  v310 = v80;
                  v172 = v79;
                  if (v290 != 0.0)
                  {
                    if (v80 == 0.0)
                    {
                      v188 = v168;
                      v189 = (float)((float)(v283 - v39) - v285) + (float)(v283 - (float)(v39 + (float)(v283 - v39)));
                    }
                    else
                    {
                      v173 = v80;
                      v174 = v290 * v80;
                      v175 = (float)(v290 * 4096.0) - (float)((float)(v290 * 4096.0) - v290);
                      v176 = -(float)((float)((float)((float)(v174
                                                            - (float)(v175
                                                                    * (float)((float)(v173 * 4096.0)
                                                                            - (float)((float)(v173 * 4096.0) - v173))))
                                                    - (float)((float)(v290 - v175)
                                                            * (float)((float)(v173 * 4096.0)
                                                                    - (float)((float)(v173 * 4096.0) - v173))))
                                            - (float)(v175
                                                    * (float)(v173
                                                            - (float)((float)(v173 * 4096.0)
                                                                    - (float)((float)(v173 * 4096.0) - v173)))))
                                    - (float)((float)(v290 - v175)
                                            * (float)(v173
                                                    - (float)((float)(v173 * 4096.0)
                                                            - (float)((float)(v173 * 4096.0) - v173)))));
                      v177 = (float)(v302 * 4096.0) - (float)((float)(v302 * 4096.0) - v302);
                      v178 = (float)(v176 * 4096.0) - (float)((float)(v176 * 4096.0) - v176);
                      v179 = -(float)((float)((float)((float)((float)(v302 * v176) - (float)(v178 * v177))
                                                    - (float)((float)(v176 - v178) * v177))
                                            - (float)(v178 * (float)(v302 - v177)))
                                    - (float)((float)(v176 - v178) * (float)(v302 - v177)));
                      v180 = (float)(v174 * 4096.0) - (float)((float)(v174 * 4096.0) - v174);
                      v181 = v174 - v180;
                      v182 = -(float)((float)((float)((float)((float)(v302 * v174) - (float)(v180 * v177))
                                                    - (float)((float)(v174 - v180) * v177))
                                            - (float)(v180 * (float)(v302 - v177)))
                                    - (float)((float)(v174 - v180) * (float)(v302 - v177)));
                      v183 = (float)(v302 * v176) + v182;
                      v313 = v179;
                      v314 = (float)(v182 - (float)(v183 - (float)(v302 * v176)))
                           + (float)((float)(v302 * v176) - (float)(v183 - (float)(v183 - (float)(v302 * v176))));
                      v315 = v183 - (float)((float)((float)(v302 * v174) + v183) - (float)(v302 * v174));
                      v316 = (float)(v302 * v174) + v183;
                      v184 = sub_1DEE659F0(v163, v168, 4, &v313, v166);
                      v163 = v184;
                      if (v308 == 0.0)
                      {
                        v188 = v166;
                        v166 = v168;
                      }
                      else
                      {
                        v185 = (float)(v308 * 4096.0) - (float)((float)(v308 * 4096.0) - v308);
                        v186 = (float)(v308 * v174) + (float)((float)-v180 * v185);
                        v187 = (float)(v308 * v176)
                             - (float)((float)((float)(v186 + (float)((float)-v181 * v185))
                                             + (float)((float)-v180 * (float)(v308 - v185)))
                                     - (float)(v181 * (float)(v308 - v185)));
                        v313 = -(float)((float)((float)((float)((float)(v308 * v176) + (float)((float)-v178 * v185))
                                                      + (float)((float)-(float)(v176 - v178) * v185))
                                              + (float)((float)-v178 * (float)(v308 - v185)))
                                      - (float)((float)(v176 - v178) * (float)(v308 - v185)));
                        v314 = (float)((float)-(float)((float)((float)(v186 + (float)((float)-v181 * v185))
                                                             + (float)((float)-v180 * (float)(v308 - v185)))
                                                     - (float)(v181 * (float)(v308 - v185)))
                                     - (float)(v187 - (float)(v308 * v176)))
                             + (float)((float)(v308 * v176) - (float)(v187 - (float)(v187 - (float)(v308 * v176))));
                        v315 = v187 - (float)((float)((float)(v308 * v174) + v187) - (float)(v308 * v174));
                        v316 = (float)(v308 * v174) + v187;
                        v163 = sub_1DEE659F0(v184, v166, 4, &v313, v168);
                        v188 = v168;
                      }
                      v169 = v297;
                      v80 = v310;
                      v79 = v172;
                      v189 = v288;
                      v171 = v290;
                    }
                    if (v189 == 0.0)
                    {
                      v168 = v188;
                      v170 = v292;
                      goto LABEL_74;
                    }
                    v190 = -(float)(v171 * v189);
                    v191 = (float)(v171 * -4096.0) - (float)(v171 + (float)(v171 * -4096.0));
                    v192 = -(float)((float)((float)((float)(v190
                                                          - (float)(v191
                                                                  * (float)((float)(v189 * 4096.0)
                                                                          - (float)((float)(v189 * 4096.0) - v189))))
                                                  - (float)((float)((float)-v171 - v191)
                                                          * (float)((float)(v189 * 4096.0)
                                                                  - (float)((float)(v189 * 4096.0) - v189))))
                                          - (float)(v191
                                                  * (float)(v189
                                                          - (float)((float)(v189 * 4096.0)
                                                                  - (float)((float)(v189 * 4096.0) - v189)))))
                                  - (float)((float)((float)-v171 - v191)
                                          * (float)(v189
                                                  - (float)((float)(v189 * 4096.0)
                                                          - (float)((float)(v189 * 4096.0) - v189)))));
                    v193 = (float)(v303 * 4096.0) - (float)((float)(v303 * 4096.0) - v303);
                    v194 = (float)(v192 * 4096.0) - (float)((float)(v192 * 4096.0) - v192);
                    v195 = -(float)((float)((float)((float)((float)(v303 * v192) - (float)(v194 * v193))
                                                  - (float)((float)(v192 - v194) * v193))
                                          - (float)(v194 * (float)(v303 - v193)))
                                  - (float)((float)(v192 - v194) * (float)(v303 - v193)));
                    v196 = (float)(v190 * 4096.0) - (float)((float)(v190 * 4096.0) - v190);
                    v197 = v190 - v196;
                    v198 = -(float)((float)((float)((float)((float)(v303 * v190) - (float)(v196 * v193))
                                                  - (float)((float)(v190 - v196) * v193))
                                          - (float)(v196 * (float)(v303 - v193)))
                                  - (float)((float)(v190 - v196) * (float)(v303 - v193)));
                    v199 = (float)(v303 * v192) + v198;
                    v313 = v195;
                    v314 = (float)(v198 - (float)(v199 - (float)(v303 * v192)))
                         + (float)((float)(v303 * v192) - (float)(v199 - (float)(v199 - (float)(v303 * v192))));
                    v315 = v199 - (float)((float)((float)(v303 * v190) + v199) - (float)(v303 * v190));
                    v316 = (float)(v303 * v190) + v199;
                    v200 = sub_1DEE659F0(v163, v188, 4, &v313, v166);
                    v163 = v200;
                    if (v306 == 0.0)
                    {
                      v168 = v166;
                      v166 = v188;
                    }
                    else
                    {
                      v201 = (float)(v306 * 4096.0) - (float)((float)(v306 * 4096.0) - v306);
                      v202 = (float)(v306 * v190) + (float)((float)-v196 * v201);
                      v203 = (float)(v306 * v192)
                           - (float)((float)((float)(v202 + (float)((float)-v197 * v201))
                                           + (float)((float)-v196 * (float)(v306 - v201)))
                                   - (float)(v197 * (float)(v306 - v201)));
                      v313 = -(float)((float)((float)((float)((float)(v306 * v192) + (float)((float)-v194 * v201))
                                                    + (float)((float)-(float)(v192 - v194) * v201))
                                            + (float)((float)-v194 * (float)(v306 - v201)))
                                    - (float)((float)(v192 - v194) * (float)(v306 - v201)));
                      v314 = (float)((float)-(float)((float)((float)(v202 + (float)((float)-v197 * v201))
                                                           + (float)((float)-v196 * (float)(v306 - v201)))
                                                   - (float)(v197 * (float)(v306 - v201)))
                                   - (float)(v203 - (float)(v306 * v192)))
                           + (float)((float)(v306 * v192) - (float)(v203 - (float)(v203 - (float)(v306 * v192))));
                      v315 = v203 - (float)((float)((float)(v306 * v190) + v203) - (float)(v306 * v190));
                      v316 = (float)(v306 * v190) + v203;
                      v163 = sub_1DEE659F0(v200, v166, 4, &v313, v188);
                      v168 = v188;
                    }
                    v169 = v297;
                    v80 = v310;
                    v79 = v172;
                    v170 = v292;
                  }
                  v189 = v288;
LABEL_74:
                  if (v170 != 0.0)
                  {
                    if (v189 == 0.0)
                    {
                      v218 = v168;
                    }
                    else
                    {
                      v204 = v170 * v189;
                      v205 = (float)(v170 * 4096.0) - (float)((float)(v170 * 4096.0) - v170);
                      v206 = -(float)((float)((float)((float)((float)(v170 * v189)
                                                            - (float)(v205
                                                                    * (float)((float)(v189 * 4096.0)
                                                                            - (float)((float)(v189 * 4096.0) - v189))))
                                                    - (float)((float)(v170 - v205)
                                                            * (float)((float)(v189 * 4096.0)
                                                                    - (float)((float)(v189 * 4096.0) - v189))))
                                            - (float)(v205
                                                    * (float)(v189
                                                            - (float)((float)(v189 * 4096.0)
                                                                    - (float)((float)(v189 * 4096.0) - v189)))))
                                    - (float)((float)(v170 - v205)
                                            * (float)(v189
                                                    - (float)((float)(v189 * 4096.0)
                                                            - (float)((float)(v189 * 4096.0) - v189)))));
                      v207 = (float)(v293 * 4096.0) - (float)((float)(v293 * 4096.0) - v293);
                      v208 = (float)(v206 * 4096.0) - (float)((float)(v206 * 4096.0) - v206);
                      v209 = -(float)((float)((float)((float)((float)(v293 * v206) - (float)(v208 * v207))
                                                    - (float)((float)(v206 - v208) * v207))
                                            - (float)(v208 * (float)(v293 - v207)))
                                    - (float)((float)(v206 - v208) * (float)(v293 - v207)));
                      v210 = (float)(v204 * 4096.0) - (float)((float)(v204 * 4096.0) - v204);
                      v211 = v204 - v210;
                      v212 = -(float)((float)((float)((float)((float)(v293 * v204) - (float)(v210 * v207))
                                                    - (float)((float)(v204 - v210) * v207))
                                            - (float)(v210 * (float)(v293 - v207)))
                                    - (float)((float)(v204 - v210) * (float)(v293 - v207)));
                      v213 = (float)(v293 * v206) + v212;
                      v313 = v209;
                      v314 = (float)(v212 - (float)(v213 - (float)(v293 * v206)))
                           + (float)((float)(v293 * v206) - (float)(v213 - (float)(v213 - (float)(v293 * v206))));
                      v315 = v213 - (float)((float)((float)(v293 * v204) + v213) - (float)(v293 * v204));
                      v316 = (float)(v293 * v204) + v213;
                      v214 = sub_1DEE659F0(v163, v168, 4, &v313, v166);
                      v163 = v214;
                      if (v295 == 0.0)
                      {
                        v218 = v166;
                        v166 = v168;
                      }
                      else
                      {
                        v215 = (float)(v295 * 4096.0) - (float)((float)(v295 * 4096.0) - v295);
                        v216 = (float)(v295 * v204) + (float)((float)-v210 * v215);
                        v217 = (float)(v295 * v206)
                             - (float)((float)((float)(v216 + (float)((float)-v211 * v215))
                                             + (float)((float)-v210 * (float)(v295 - v215)))
                                     - (float)(v211 * (float)(v295 - v215)));
                        v313 = -(float)((float)((float)((float)((float)(v295 * v206) + (float)((float)-v208 * v215))
                                                      + (float)((float)-(float)(v206 - v208) * v215))
                                              + (float)((float)-v208 * (float)(v295 - v215)))
                                      - (float)((float)(v206 - v208) * (float)(v295 - v215)));
                        v314 = (float)((float)-(float)((float)((float)(v216 + (float)((float)-v211 * v215))
                                                             + (float)((float)-v210 * (float)(v295 - v215)))
                                                     - (float)(v211 * (float)(v295 - v215)))
                                     - (float)(v217 - (float)(v295 * v206)))
                             + (float)((float)(v295 * v206) - (float)(v217 - (float)(v217 - (float)(v295 * v206))));
                        v315 = v217 - (float)((float)((float)(v295 * v204) + v217) - (float)(v295 * v204));
                        v316 = (float)(v295 * v204) + v217;
                        v163 = sub_1DEE659F0(v214, v166, 4, &v313, v168);
                        v218 = v168;
                      }
                      v80 = v310;
                      v79 = v172;
                      v170 = v292;
                    }
                    if (v79 == 0.0)
                    {
                      v168 = v218;
                      v169 = v297;
                    }
                    else
                    {
                      v219 = -(float)(v170 * v79);
                      v220 = (float)(v170 * -4096.0) - (float)(v170 + (float)(v170 * -4096.0));
                      v221 = -(float)((float)((float)((float)(v219
                                                            - (float)(v220
                                                                    * (float)((float)(v79 * 4096.0)
                                                                            - (float)((float)(v79 * 4096.0) - v79))))
                                                    - (float)((float)((float)-v170 - v220)
                                                            * (float)((float)(v79 * 4096.0)
                                                                    - (float)((float)(v79 * 4096.0) - v79))))
                                            - (float)(v220
                                                    * (float)(v79
                                                            - (float)((float)(v79 * 4096.0)
                                                                    - (float)((float)(v79 * 4096.0) - v79)))))
                                    - (float)((float)((float)-v170 - v220)
                                            * (float)(v79
                                                    - (float)((float)(v79 * 4096.0)
                                                            - (float)((float)(v79 * 4096.0) - v79)))));
                      v222 = (float)(v302 * 4096.0) - (float)((float)(v302 * 4096.0) - v302);
                      v223 = (float)(v221 * 4096.0) - (float)((float)(v221 * 4096.0) - v221);
                      v224 = -(float)((float)((float)((float)((float)(v302 * v221) - (float)(v223 * v222))
                                                    - (float)((float)(v221 - v223) * v222))
                                            - (float)(v223 * (float)(v302 - v222)))
                                    - (float)((float)(v221 - v223) * (float)(v302 - v222)));
                      v225 = (float)(v219 * 4096.0) - (float)((float)(v219 * 4096.0) - v219);
                      v226 = v219 - v225;
                      v227 = -(float)((float)((float)((float)((float)(v302 * v219) - (float)(v225 * v222))
                                                    - (float)((float)(v219 - v225) * v222))
                                            - (float)(v225 * (float)(v302 - v222)))
                                    - (float)((float)(v219 - v225) * (float)(v302 - v222)));
                      v228 = (float)(v302 * v221) + v227;
                      v313 = v224;
                      v314 = (float)(v227 - (float)(v228 - (float)(v302 * v221)))
                           + (float)((float)(v302 * v221) - (float)(v228 - (float)(v228 - (float)(v302 * v221))));
                      v315 = v228 - (float)((float)((float)(v302 * v219) + v228) - (float)(v302 * v219));
                      v316 = (float)(v302 * v219) + v228;
                      v229 = sub_1DEE659F0(v163, v218, 4, &v313, v166);
                      v163 = v229;
                      if (v308 == 0.0)
                      {
                        v168 = v166;
                        v166 = v218;
                      }
                      else
                      {
                        v230 = (float)(v308 * 4096.0) - (float)((float)(v308 * 4096.0) - v308);
                        v231 = (float)(v308 * v219) + (float)((float)-v225 * v230);
                        v232 = (float)(v308 * v221)
                             - (float)((float)((float)(v231 + (float)((float)-v226 * v230))
                                             + (float)((float)-v225 * (float)(v308 - v230)))
                                     - (float)(v226 * (float)(v308 - v230)));
                        v313 = -(float)((float)((float)((float)((float)(v308 * v221) + (float)((float)-v223 * v230))
                                                      + (float)((float)-(float)(v221 - v223) * v230))
                                              + (float)((float)-v223 * (float)(v308 - v230)))
                                      - (float)((float)(v221 - v223) * (float)(v308 - v230)));
                        v314 = (float)((float)-(float)((float)((float)(v231 + (float)((float)-v226 * v230))
                                                             + (float)((float)-v225 * (float)(v308 - v230)))
                                                     - (float)(v226 * (float)(v308 - v230)))
                                     - (float)(v232 - (float)(v308 * v221)))
                             + (float)((float)(v308 * v221) - (float)(v232 - (float)(v232 - (float)(v308 * v221))));
                        v315 = v232 - (float)((float)((float)(v308 * v219) + v232) - (float)(v308 * v219));
                        v316 = (float)(v308 * v219) + v232;
                        v163 = sub_1DEE659F0(v229, v166, 4, &v313, v218);
                        v168 = v218;
                      }
                      v169 = v297;
                      v80 = v310;
                      v79 = v172;
                    }
                  }
                  if (v169 == 0.0)
                  {
                    v247 = v168;
                  }
                  else
                  {
                    if (v79 == 0.0)
                    {
                      v247 = v168;
                    }
                    else
                    {
                      v233 = v169 * v79;
                      v234 = (float)(v169 * 4096.0) - (float)((float)(v169 * 4096.0) - v169);
                      v235 = -(float)((float)((float)((float)((float)(v169 * v79)
                                                            - (float)(v234
                                                                    * (float)((float)(v79 * 4096.0)
                                                                            - (float)((float)(v79 * 4096.0) - v79))))
                                                    - (float)((float)(v169 - v234)
                                                            * (float)((float)(v79 * 4096.0)
                                                                    - (float)((float)(v79 * 4096.0) - v79))))
                                            - (float)(v234
                                                    * (float)(v79
                                                            - (float)((float)(v79 * 4096.0)
                                                                    - (float)((float)(v79 * 4096.0) - v79)))))
                                    - (float)((float)(v169 - v234)
                                            * (float)(v79
                                                    - (float)((float)(v79 * 4096.0)
                                                            - (float)((float)(v79 * 4096.0) - v79)))));
                      v236 = (float)(v303 * 4096.0) - (float)((float)(v303 * 4096.0) - v303);
                      v237 = (float)(v235 * 4096.0) - (float)((float)(v235 * 4096.0) - v235);
                      v238 = -(float)((float)((float)((float)((float)(v303 * v235) - (float)(v237 * v236))
                                                    - (float)((float)(v235 - v237) * v236))
                                            - (float)(v237 * (float)(v303 - v236)))
                                    - (float)((float)(v235 - v237) * (float)(v303 - v236)));
                      v239 = (float)((float)(v169 * v79) * 4096.0) - (float)((float)(v233 * 4096.0) - v233);
                      v240 = v233 - v239;
                      v241 = -(float)((float)((float)((float)((float)(v303 * v233) - (float)(v239 * v236))
                                                    - (float)((float)(v233 - v239) * v236))
                                            - (float)(v239 * (float)(v303 - v236)))
                                    - (float)((float)(v233 - v239) * (float)(v303 - v236)));
                      v242 = (float)(v303 * v235) + v241;
                      v313 = v238;
                      v314 = (float)(v241 - (float)(v242 - (float)(v303 * v235)))
                           + (float)((float)(v303 * v235) - (float)(v242 - (float)(v242 - (float)(v303 * v235))));
                      v315 = v242 - (float)((float)((float)(v303 * v233) + v242) - (float)(v303 * v233));
                      v316 = (float)(v303 * v233) + v242;
                      v243 = sub_1DEE659F0(v163, v168, 4, &v313, v166);
                      v163 = v243;
                      if (v306 == 0.0)
                      {
                        v247 = v166;
                        v166 = v168;
                      }
                      else
                      {
                        v244 = (float)(v306 * 4096.0) - (float)((float)(v306 * 4096.0) - v306);
                        v245 = (float)(v306 * v233) + (float)((float)-v239 * v244);
                        v246 = (float)(v306 * v235)
                             - (float)((float)((float)(v245 + (float)((float)-v240 * v244))
                                             + (float)((float)-v239 * (float)(v306 - v244)))
                                     - (float)(v240 * (float)(v306 - v244)));
                        v313 = -(float)((float)((float)((float)((float)(v306 * v235) + (float)((float)-v237 * v244))
                                                      + (float)((float)-(float)(v235 - v237) * v244))
                                              + (float)((float)-v237 * (float)(v306 - v244)))
                                      - (float)((float)(v235 - v237) * (float)(v306 - v244)));
                        v314 = (float)((float)-(float)((float)((float)(v245 + (float)((float)-v240 * v244))
                                                             + (float)((float)-v239 * (float)(v306 - v244)))
                                                     - (float)(v240 * (float)(v306 - v244)))
                                     - (float)(v246 - (float)(v306 * v235)))
                             + (float)((float)(v306 * v235) - (float)(v246 - (float)(v246 - (float)(v306 * v235))));
                        v315 = v246 - (float)((float)((float)(v306 * v233) + v246) - (float)(v306 * v233));
                        v316 = (float)(v306 * v233) + v246;
                        v163 = sub_1DEE659F0(v243, v166, 4, &v313, v168);
                        v247 = v168;
                      }
                      v169 = v297;
                      v80 = v310;
                    }
                    if (v80 != 0.0)
                    {
                      v248 = v80;
                      v249 = -(float)(v169 * v80);
                      v250 = (float)(v169 * -4096.0) - (float)(v169 + (float)(v169 * -4096.0));
                      v251 = -(float)((float)((float)((float)(v249
                                                            - (float)(v250
                                                                    * (float)((float)(v248 * 4096.0)
                                                                            - (float)((float)(v248 * 4096.0) - v248))))
                                                    - (float)((float)((float)-v169 - v250)
                                                            * (float)((float)(v248 * 4096.0)
                                                                    - (float)((float)(v248 * 4096.0) - v248))))
                                            - (float)(v250
                                                    * (float)(v248
                                                            - (float)((float)(v248 * 4096.0)
                                                                    - (float)((float)(v248 * 4096.0) - v248)))))
                                    - (float)((float)((float)-v169 - v250)
                                            * (float)(v248
                                                    - (float)((float)(v248 * 4096.0)
                                                            - (float)((float)(v248 * 4096.0) - v248)))));
                      v252 = (float)(v293 * 4096.0) - (float)((float)(v293 * 4096.0) - v293);
                      v253 = (float)(v251 * 4096.0) - (float)((float)(v251 * 4096.0) - v251);
                      v254 = -(float)((float)((float)((float)((float)(v293 * v251) - (float)(v253 * v252))
                                                    - (float)((float)(v251 - v253) * v252))
                                            - (float)(v253 * (float)(v293 - v252)))
                                    - (float)((float)(v251 - v253) * (float)(v293 - v252)));
                      v255 = (float)(v249 * 4096.0) - (float)((float)(v249 * 4096.0) - v249);
                      v256 = v249 - v255;
                      v257 = -(float)((float)((float)((float)((float)(v293 * v249) - (float)(v255 * v252))
                                                    - (float)((float)(v249 - v255) * v252))
                                            - (float)(v255 * (float)(v293 - v252)))
                                    - (float)((float)(v249 - v255) * (float)(v293 - v252)));
                      v258 = (float)(v293 * v251) + v257;
                      v313 = v254;
                      v314 = (float)(v257 - (float)(v258 - (float)(v293 * v251)))
                           + (float)((float)(v293 * v251) - (float)(v258 - (float)(v258 - (float)(v293 * v251))));
                      v315 = v258 - (float)((float)((float)(v293 * v249) + v258) - (float)(v293 * v249));
                      v316 = (float)(v293 * v249) + v258;
                      v259 = sub_1DEE659F0(v163, v247, 4, &v313, v166);
                      v163 = v259;
                      if (v295 == 0.0)
                      {
LABEL_101:
                        v168 = v166;
                        v166 = v247;
                        goto LABEL_102;
                      }
                      v260 = (float)(v295 * 4096.0) - (float)((float)(v295 * 4096.0) - v295);
                      v261 = (float)(v295 * v249) + (float)((float)-v255 * v260);
                      v262 = (float)(v295 * v251)
                           - (float)((float)((float)(v261 + (float)((float)-v256 * v260))
                                           + (float)((float)-v255 * (float)(v295 - v260)))
                                   - (float)(v256 * (float)(v295 - v260)));
                      v313 = -(float)((float)((float)((float)((float)(v295 * v251) + (float)((float)-v253 * v260))
                                                    + (float)((float)-(float)(v251 - v253) * v260))
                                            + (float)((float)-v253 * (float)(v295 - v260)))
                                    - (float)((float)(v251 - v253) * (float)(v295 - v260)));
                      v314 = (float)((float)-(float)((float)((float)(v261 + (float)((float)-v256 * v260))
                                                           + (float)((float)-v255 * (float)(v295 - v260)))
                                                   - (float)(v256 * (float)(v295 - v260)))
                                   - (float)(v262 - (float)(v295 * v251)))
                           + (float)((float)(v295 * v251) - (float)(v262 - (float)(v262 - (float)(v295 * v251))));
                      v315 = v262 - (float)((float)((float)(v295 * v249) + v262) - (float)(v295 * v249));
                      v316 = (float)(v295 * v249) + v262;
                      v163 = sub_1DEE659F0(v259, v166, 4, &v313, v247);
                      v263 = (float)((float)(v284 - v293) - v280) + (float)(v284 - (float)(v293 + (float)(v284 - v293)));
LABEL_100:
                      v264 = sub_1DEE65BF8(v153, v319, v311, v263);
                      v163 = sub_1DEE659F0(v163, v247, v264, v311, v166);
                      goto LABEL_101;
                    }
                    v168 = v247;
                  }
                  v263 = (float)((float)(v284 - v293) - v280) + (float)(v284 - (float)(v293 + (float)(v284 - v293)));
                  if (v295 == 0.0)
                  {
LABEL_102:
                    if (v306 == 0.0)
                    {
                      v266 = v168;
                      v168 = v166;
                    }
                    else
                    {
                      v265 = sub_1DEE65BF8(v158, v318, v311, v306);
                      v163 = sub_1DEE659F0(v163, v168, v265, v311, v166);
                      v266 = v166;
                    }
                    if (v308 == 0.0)
                    {
                      v168 = v266;
                    }
                    else
                    {
                      v267 = sub_1DEE65BF8(v161, v317, v311, v308);
                      v163 = sub_1DEE659F0(v163, v266, v267, v311, v168);
                    }
                    _S4 = v168[v163 - 1];
                    goto LABEL_109;
                  }
                  goto LABEL_100;
                }
                v332 = -(float)((float)((float)((float)(v86 - (float)(v118 * v273)) - (float)((float)(v76 - v118) * v273))
                                      - (float)(v118 * v272))
                              - (float)((float)(v76 - v118) * v272));
                v333 = v39 * v76;
                v328 = -(float)((float)((float)((float)((float)-(float)(v76 * v68)
                                                      - (float)((float)((float)(v76 * -4096.0)
                                                                      - (float)(v76 + (float)(v76 * -4096.0)))
                                                              * v276))
                                              - (float)((float)((float)-v76
                                                              - (float)((float)(v76 * -4096.0)
                                                                      - (float)(v76 + (float)(v76 * -4096.0))))
                                                      * v276))
                                      - (float)((float)((float)(v76 * -4096.0) - (float)(v76 + (float)(v76 * -4096.0)))
                                              * v37))
                              - (float)((float)((float)-v76
                                              - (float)((float)(v76 * -4096.0) - (float)(v76 + (float)(v76 * -4096.0))))
                                      * v37));
                v329 = -(float)(v76 * v68);
              }
              v117 = 2;
              goto LABEL_45;
            }
            v340 = -(float)((float)((float)((float)(v90 - (float)(v94 * v299)) - (float)((float)(v74 - v94) * v299))
                                  - (float)(v94 * v298))
                          - (float)((float)(v74 - v94) * v298));
            v341 = v66 * v74;
            v336 = -(float)((float)((float)((float)((float)-(float)(v74 * v39)
                                                  - (float)((float)((float)(v74 * -4096.0)
                                                                  - (float)(v74 + (float)(v74 * -4096.0)))
                                                          * v273))
                                          - (float)((float)((float)-v74
                                                          - (float)((float)(v74 * -4096.0)
                                                                  - (float)(v74 + (float)(v74 * -4096.0))))
                                                  * v273))
                                  - (float)((float)((float)(v74 * -4096.0) - (float)(v74 + (float)(v74 * -4096.0)))
                                          * v272))
                          - (float)((float)((float)-v74
                                          - (float)((float)(v74 * -4096.0) - (float)(v74 + (float)(v74 * -4096.0))))
                                  * v272));
            v337 = -(float)(v74 * v39);
          }
          v93 = 2;
          goto LABEL_37;
        }
      }
    }
  }
LABEL_109:
  __asm { FCVT            H0, S4 }
  return result;
}

__int16 _simd_incircle_ph2@<H0>(uint64_t a1@<X0>)
{
  float16x4_t v1;
  __int32 v2;
  float32x2_t v3;
  __int32 v4;
  float32x2_t v5;
  __int32 v6;
  float32x2_t v7;
  __int32 v8;
  float32x2_t v9;
  float32x4_t v10;
  float32x2_t v11;
  float32x2_t v12;
  float32x2_t v13;
  float32x2_t v14;
  int8x16_t v15;
  float32x2_t v16;
  int32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v22;
  float v23;
  float32x2_t v25;
  float v26;
  float v27;
  float v28;
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
  float v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  int v74;
  int v75;
  int v76;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  uint64_t v83;
  float *v84;
  float v85;
  float v86;
  float32x2_t v88;
  float32x2_t v89;
  float32x2_t v91;
  float32x2_t v92;
  float32x2_t v93;
  float32x4_t v94;
  int32x2_t v95;
  float v96;
  float v97;
  float32x2_t v99;
  double v101;
  double v105;
  float v106;
  float v107;
  float v109;
  double v110;
  float v111;
  float32x2_t v112;
  float32x2_t v113;
  float v114;
  float v116;
  float v117;
  float v118;
  _BOOL4 v119;
  int v120;
  int v121;
  float v122;
  float v123;
  float v124;
  float v125;
  _BOOL4 v126;
  int v127;
  int v128;
  float v129;
  float v130;
  float v131;
  float v132;
  float v133;
  float v134;
  _BOOL4 v135;
  int v136;
  float v137;
  float v138;
  float v139;
  float v140;
  float v141;
  float v142;
  int v143;
  int v144;
  int v145;
  int v146;
  int v147;
  int v148;
  int v149;
  float *v150;
  float *v151;
  int v152;
  int v153;
  int v154;
  int v155;
  int v156;
  int v157;
  int v158;
  int v159;
  float *v160;
  int v161;
  int v162;
  int v163;
  int v164;
  int v165;
  int v166;
  int v167;
  float *v168;
  int v169;
  int v170;
  int v171;
  int v172;
  int v173;
  int v174;
  int v175;
  float *v176;
  int v177;
  int v178;
  int v179;
  int v180;
  int v181;
  int v182;
  int v183;
  int v184;
  float *v185;
  int v186;
  int v187;
  int v188;
  int v189;
  int v190;
  int v191;
  int v192;
  float *v193;
  float *v194;
  float v195;
  float v196;
  float v197;
  float v198;
  float v199;
  float v200;
  float v201;
  float v202;
  float v203;
  float v204;
  float v205;
  float v206;
  float v207;
  float v208;
  float v209;
  float v210;
  float v211;
  float v212;
  float v213;
  float v214;
  float v215;
  float v216;
  float v217;
  float v218;
  float v219;
  int v220;
  int v221;
  float v222;
  float v223;
  float v224;
  float v225;
  float v226;
  float v227;
  float v228;
  int v229;
  int v230;
  int v231;
  int v232;
  int v233;
  int v234;
  int v235;
  float v236;
  int v237;
  int v238;
  int v239;
  float *v240;
  int v241;
  int v242;
  int v243;
  int v244;
  int v245;
  int v246;
  int v247;
  int v248;
  int v249;
  int v250;
  int v251;
  int v252;
  int v253;
  int v254;
  int v255;
  int v256;
  int v257;
  float32x2_t v258;
  float v259;
  float v260;
  float v261;
  float v262;
  float v263;
  float v264;
  float v265;
  float v266;
  float v267;
  float v268;
  float v269;
  float v270;
  float v271;
  float v272;
  float v273;
  float v274;
  float v275;
  float v276;
  float v277;
  float v278;
  int v279;
  int v280;
  float v281;
  float v282;
  float v283;
  float v284;
  float v285;
  float v286;
  float v287;
  float v288;
  float v289;
  int v290;
  int v291;
  int v292;
  int v293;
  int v294;
  int v295;
  int v296;
  float *v297;
  int v298;
  int v299;
  int v300;
  int v301;
  float v302;
  float *v303;
  int v304;
  int v305;
  int v306;
  int v307;
  int v308;
  int v309;
  int v310;
  int v311;
  int v312;
  int v313;
  int v314;
  int v315;
  int v316;
  int v317;
  int v318;
  int v319;
  int v320;
  float v321;
  float v322;
  float v323;
  float v324;
  float v325;
  float v326;
  float v327;
  float v328;
  float v329;
  float v330;
  float v331;
  float v332;
  float v333;
  float v334;
  float v335;
  float v336;
  float v337;
  float v338;
  int v339;
  int v340;
  float v341;
  float v342;
  float v343;
  float v344;
  float v345;
  float v346;
  float v347;
  float v348;
  float v349;
  float v350;
  float v351;
  float v352;
  int v353;
  int v354;
  int v355;
  int v356;
  int v357;
  int v358;
  int v359;
  float *v360;
  int v361;
  int v362;
  int v363;
  float v364;
  float *v365;
  int v366;
  int v367;
  int v368;
  int v369;
  int v370;
  int v371;
  int v372;
  int v373;
  int v374;
  int v375;
  int v376;
  int v377;
  int v378;
  int v379;
  int v380;
  int v381;
  int v382;
  __int16 result;
  int v384;
  int v385;
  int v386;
  int v387;
  int v388;
  float v389;
  float v390;
  int v391;
  float v392;
  float v393;
  float v394;
  float v395;
  float v396;
  float v397;
  int v398;
  float v399;
  float v400;
  float v401;
  float v402;
  float v403;
  float v404;
  float v405;
  float v406;
  float v407;
  float v408;
  float v409;
  float v410;
  float v411;
  float v412;
  float32x2_t v413;
  BOOL v414;
  float32x2_t v415;
  float32x2_t v416;
  float32x2_t v417;
  float32x2_t v418;
  float32x2_t v419;
  BOOL v420;
  float32x2_t v421;
  float v422;
  float v423;
  float v424;
  float v425;
  float32x2_t v426;
  float v427;
  float v428;
  float v429;
  float v430;
  float32x2_t v431;
  float32x2_t v432;
  float32x2_t v433;
  float v434[4];
  float v435[4];
  float v436[4];
  float v437[8];
  float v438[8];
  float v439[8];
  float v440[8];
  float v441[8];
  float v442[8];
  float v443[8];
  float v444[8];
  float v445[8];
  float v446[16];
  float v447[16];
  float v448[16];
  float v449[16];
  float v450[16];
  float v451[16];
  float v452[8];
  float v453[8];
  float v454[8];
  float v455[8];
  float v456[8];
  float v457[8];
  float v458[8];
  float v459[8];
  float v460[8];
  float v461[8];
  float v462[8];
  float v463[8];
  float v464[8];
  float v465[8];
  float v466[8];
  float v467[8];
  float v468[8];
  float v469[8];
  float v470[64];
  float v471[48];
  float v472[32];
  float v473[32];
  float v474[16];
  float v475[16];
  float v476[16];
  float v477[8];
  float v478;
  float v479;
  float v480;
  float v481;
  float v482;
  float v483;
  float v484;
  float v485;
  float v486[4];
  float v487[4];
  float v488[4];
  float v489[1152];
  float v490;
  int v491;
  float v492[64];
  float v493[32];
  float v494[16];
  float v495[8];
  float v496[16];
  float v497[8];
  float v498[32];
  float v499[16];
  float v500[8];
  float v501[16];
  float v502[8];
  float v503[32];
  float v504[16];
  float v505[8];
  float v506[16];
  float v507[8];
  float v508[4];
  float v509[4];
  float v510[6];

  *(double *)&v1 = MEMORY[0x1E0C86820](a1);
  v1.i32[0] = v2;
  v3 = (float32x2_t)vcvtq_f32_f16(v1).u64[0];
  v1.i32[0] = v4;
  v5 = (float32x2_t)vcvtq_f32_f16(v1).u64[0];
  v1.i32[0] = v6;
  v7 = (float32x2_t)vcvtq_f32_f16(v1).u64[0];
  v1.i32[0] = v8;
  v9 = (float32x2_t)vcvtq_f32_f16(v1).u64[0];
  *(float32x2_t *)v10.f32 = vsub_f32(v5, v3);
  v11 = vsub_f32(v7, v3);
  v12 = vmul_f32(*(float32x2_t *)v10.f32, *(float32x2_t *)v10.f32);
  *(float32x2_t *)&v10.u32[2] = vadd_f32(v12, (float32x2_t)vdup_lane_s32((int32x2_t)v12, 1));
  v13 = vmul_f32(v11, v11);
  v14 = vsub_f32(v9, v3);
  *(float32x2_t *)v15.i8 = v11;
  v15.u64[1] = (unint64_t)vadd_f32(v13, (float32x2_t)vdup_lane_s32((int32x2_t)v13, 1));
  v16 = vmul_f32(v14, v14);
  *(float32x2_t *)v17.i8 = v14;
  v17.u64[1] = (unint64_t)vadd_f32(v16, (float32x2_t)vdup_lane_s32((int32x2_t)v16, 1));
  v18 = vmulq_f32((float32x4_t)vextq_s8(vextq_s8(v15, v15, 0xCuLL), v15, 8uLL), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v17, v17), (int8x16_t)v17, 0xCuLL));
  v19 = vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v15, (int32x4_t)v15), v15, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v17, (int8x16_t)v17, 0xCuLL), (int8x16_t)v17, 8uLL));
  v20 = vmulq_f32(v10, vsubq_f32(v18, v19));
  _S0 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v20, 2), vaddq_f32(v20, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 1))).f32[0];
  v22 = vmulq_f32(vaddq_f32(vabsq_f32(v18), vabsq_f32(v19)), vabsq_f32(v10));
  v23 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 2), vaddq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.f32, 1))).f32[0];
  if (_S0 <= (float)(0.0049057 * v23) && (float)(0.0049057 * v23) >= (float)-_S0)
  {
    v425 = v23;
    v417 = v7;
    v419 = v9;
    v397 = v13.f32[0];
    v399 = v16.f32[0];
    v421 = v3;
    v413 = (float32x2_t)vrev64_s32((int32x2_t)v3);
    v415 = (float32x2_t)vrev64_s32((int32x2_t)v5);
    v432 = v14;
    v433 = vsub_f32(v415, v413);
    v25 = v14;
    v26 = vmuls_lane_f32(v11.f32[0], v14, 1);
    v423 = (float)(4096.0 * v11.f32[0]) - (float)((float)(4096.0 * v11.f32[0]) - v11.f32[0]);
    v27 = vmuls_lane_f32(4096.0, v14, 1);
    v28 = v27 - (float)(v27 - v14.f32[1]);
    v29 = v14.f32[1] - v28;
    v429 = v11.f32[0] - v423;
    v30 = -(float)((float)((float)((float)(v26 - (float)(v423 * v28)) - (float)((float)(v11.f32[0] - v423) * v28))
                         - (float)(v423 * (float)(v14.f32[1] - v28)))
                 - (float)((float)(v11.f32[0] - v423) * (float)(v14.f32[1] - v28)));
    v430 = v11.f32[1];
    v31 = vmuls_lane_f32(v14.f32[0], v11, 1);
    v32 = (float)(4096.0 * v25.f32[0]) - (float)((float)(4096.0 * v25.f32[0]) - v25.f32[0]);
    v33 = vmuls_lane_f32(4096.0, v11, 1);
    v427 = v33 - (float)(v33 - v11.f32[1]);
    v428 = v11.f32[1] - v427;
    v34 = -(float)((float)((float)((float)(v31 - (float)(v32 * v427)) - (float)((float)(v25.f32[0] - v32) * v427))
                         - (float)(v32 * (float)(v11.f32[1] - v427)))
                 - (float)((float)(v25.f32[0] - v32) * (float)(v11.f32[1] - v427)));
    v35 = v30 - v34;
    v36 = (float)((float)(v30 - (float)(v30 - v34)) - v34)
        + (float)(v30 - (float)((float)(v30 - v34) + (float)(v30 - (float)(v30 - v34))));
    v37 = v26 + v35;
    v38 = (float)(v35 - (float)((float)(v26 + v35) - v26))
        + (float)(v26 - (float)((float)(v26 + v35) - (float)((float)(v26 + v35) - v26)));
    v39 = v38 - v31;
    v409 = v31;
    v510[0] = v36;
    v510[1] = (float)((float)(v38 - (float)(v38 - v31)) - v31)
            + (float)(v38 - (float)((float)(v38 - v31) + (float)(v38 - (float)(v38 - v31))));
    v40 = v37 + (float)(v38 - v31);
    v510[2] = (float)(v39 - (float)(v40 - v37)) + (float)(v37 - (float)(v40 - (float)(v40 - v37)));
    v510[3] = v40;
    v41 = v433.f32[1];
    v431 = v11;
    v42 = sub_1DEE65BF8(4, v510, v507, v433.f32[1]);
    v43 = sub_1DEE65BF8(v42, v507, v506, v433.f32[1]);
    v44 = sub_1DEE65BF8(4, v510, v505, v433.f32[0]);
    v45 = sub_1DEE65BF8(v44, v505, v504, v433.f32[0]);
    v46 = sub_1DEE659F0(v43, v506, v45, v504, v503);
    v47 = vmul_f32(v433, v432).f32[0];
    v48 = (float)(4096.0 * v433.f32[0]) - (float)((float)(4096.0 * v433.f32[0]) - v433.f32[0]);
    v404 = v29;
    v412 = v25.f32[0] - v32;
    v49 = -(float)((float)((float)((float)(v47 - (float)(v32 * v48)) - (float)(v412 * v48))
                         - (float)(v32 * (float)(v433.f32[0] - v48)))
                 - (float)(v412 * (float)(v433.f32[0] - v48)));
    v50 = vmuls_lane_f32(v433.f32[1], v432, 1);
    v51 = vmuls_lane_f32(4096.0, v433, 1);
    v52 = v51 - (float)(v51 - v433.f32[1]);
    v403 = v28;
    v53 = -(float)((float)((float)((float)(v50 - (float)(v52 * v28)) - (float)((float)(v41 - v52) * v28))
                         - (float)(v52 * v29))
                 - (float)((float)(v41 - v52) * v29));
    v54 = v50;
    v55 = v49 - v53;
    v56 = (float)((float)(v49 - (float)(v49 - v53)) - v53)
        + (float)(v49 - (float)((float)(v49 - v53) + (float)(v49 - (float)(v49 - v53))));
    v57 = v47 + v55;
    v58 = (float)(v55 - (float)((float)(v47 + v55) - v47))
        + (float)(v47 - (float)((float)(v47 + v55) - (float)((float)(v47 + v55) - v47)));
    v509[0] = v56;
    v509[1] = (float)((float)(v58 - (float)(v58 - v50)) - v50)
            + (float)(v58 - (float)((float)(v58 - v50) + (float)(v58 - (float)(v58 - v50))));
    v509[2] = (float)((float)(v58 - v50) - (float)((float)(v57 + (float)(v58 - v50)) - v57))
            + (float)(v57 - (float)((float)(v57 + (float)(v58 - v50)) - (float)((float)(v57 + (float)(v58 - v50)) - v57)));
    v509[3] = v57 + (float)(v58 - v50);
    v59 = sub_1DEE65BF8(4, v509, v502, v431.f32[0]);
    v60 = sub_1DEE65BF8(v59, v502, v501, v431.f32[0]);
    v61 = sub_1DEE65BF8(4, v509, v500, v430);
    v62 = sub_1DEE65BF8(v61, v500, v499, v430);
    v63 = sub_1DEE659F0(v60, v501, v62, v499, v498);
    v64 = vmuls_lane_f32(v433.f32[1], v431, 1);
    v411 = v433.f32[1] - v52;
    v65 = -(float)((float)((float)((float)(v64 - (float)(v52 * v427)) - (float)((float)(v41 - v52) * v427))
                         - (float)(v52 * v428))
                 - (float)((float)(v41 - v52) * v428));
    v66 = vmul_f32(v433, v431).f32[0];
    v401 = v48;
    v402 = v433.f32[0] - v48;
    v67 = -(float)((float)((float)((float)(v66 - (float)(v423 * v48)) - (float)(v429 * v48)) - (float)(v423 * v402))
                 - (float)(v429 * v402));
    v68 = v65 - v67;
    v69 = (float)((float)(v65 - (float)(v65 - v67)) - v67)
        + (float)(v65 - (float)((float)(v65 - v67) + (float)(v65 - (float)(v65 - v67))));
    v70 = v64 + v68;
    v71 = (float)(v68 - (float)((float)(v64 + v68) - v64))
        + (float)(v64 - (float)((float)(v64 + v68) - (float)((float)(v64 + v68) - v64)));
    v72 = v71 - v66;
    v407 = v66;
    v508[0] = v69;
    v508[1] = (float)((float)(v71 - (float)(v71 - v66)) - v66)
            + (float)(v71 - (float)((float)(v71 - v66) + (float)(v71 - (float)(v71 - v66))));
    v73 = v70 + (float)(v71 - v66);
    v508[2] = (float)(v72 - (float)(v73 - v70)) + (float)(v70 - (float)(v73 - (float)(v73 - v70)));
    v508[3] = v73;
    v74 = sub_1DEE65BF8(4, v508, v497, v432.f32[0]);
    v75 = sub_1DEE65BF8(v74, v497, v496, v432.f32[0]);
    v76 = sub_1DEE65BF8(4, v508, v495, v25.f32[1]);
    _S12 = v25.f32[1];
    v78 = sub_1DEE65BF8(v76, v495, v494, v25.f32[1]);
    v79 = sub_1DEE659F0(v75, v496, v78, v494, v493);
    v80 = sub_1DEE659F0(v46, v503, v63, v498, v492);
    v81 = sub_1DEE659F0(v80, v492, v79, v493, &v490);
    v82 = v81;
    _S0 = v490;
    if (v81 < 2)
    {
      v85 = v425;
    }
    else
    {
      v83 = v81 - 1;
      v84 = (float *)&v491;
      v85 = v425;
      do
      {
        v86 = *v84++;
        _S0 = _S0 + v86;
        --v83;
      }
      while (v83);
    }
    if (_S0 < (float)(v85 * 0.0019646) && (float)(v85 * 0.0019646) > (float)-_S0)
    {
      v88 = vsub_f32(v415, v433);
      v89 = vsub_f32(v417, v431);
      _D21 = vadd_f32(vsub_f32(v88, v413), vsub_f32(v415, vadd_f32(v433, v88)));
      v91 = vadd_f32(vsub_f32(v89, v421), vsub_f32(v417, vadd_f32(v431, v89)));
      v92 = vsub_f32(v419, v432);
      v93 = vadd_f32(vsub_f32(v92, v421), vsub_f32(v419, vadd_f32(v432, v92)));
      v94.i64[0] = __PAIR64__(_D21.u32[1], v91.u32[0]);
      v94.i64[1] = __PAIR64__(vdup_lane_s32(*(int32x2_t *)&_D21, 0).u32[1], v93.u32[0]);
      if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqzq_f32(v94)))) & 1) != 0
        || (v95 = vceqz_f32((float32x2_t)vzip2_s32((int32x2_t)v93, (int32x2_t)v91)), (v95.i8[4] & 1) == 0)
        || (v95.i8[0] & 1) == 0)
      {
        v96 = (float)(fabsf(_S0) * 0.0014668) + (float)(v85 * 0.000010557);
        v97 = vmul_f32(v433, v433).f32[0];
        _S20 = v433.f32[1];
        v99 = vmul_f32(v432, (float32x2_t)vrev64_s32((int32x2_t)v91));
        _D2 = vmla_f32(v99, v93, (float32x2_t)vrev64_s32((int32x2_t)v431));
        v101 = (float)((float)(v97 + (float)(_S20 * _S20))
                     * vsub_f32((float32x2_t)vdup_lane_s32((int32x2_t)_D2, 1), _D2).f32[0]);
        __asm { FMLA            S2, S20, V21.S[1] }
        v105 = v101 + (_D2.f32[0] + _D2.f32[0]) * (float)-(float)(v409 - (float)(v431.f32[0] * v25.f32[1]));
        v106 = v430 * v430;
        LODWORD(v107) = vmul_f32(v433, v93).u32[0];
        __asm { FMLA            S7, S12, V21.S[1] }
        v109 = vmlas_n_f32(vmuls_lane_f32(v430, v91, 1), v431.f32[0], v91.f32[0]);
        v110 = v105
             + (float)((float)((float)(v430 * v430) + (float)(v431.f32[0] * v431.f32[0]))
                     * (float)(vmlas_n_f32(v107, v432.f32[0], _D21.f32[0]) - _S7))
             + (v109 + v109) * (float)-(float)(v54 - (float)(v432.f32[0] * v433.f32[0]));
        v111 = v25.f32[1] * v25.f32[1];
        v112 = vmul_f32(v431, _D21);
        v113 = vmla_f32(v112, v91, v433);
        v114 = vmuls_lane_f32(v25.f32[1], v93, 1);
        _S0 = (float)((float)((float)(v25.f32[1] * v25.f32[1]) + (float)(v432.f32[0] * v432.f32[0]))
                    * vsub_f32((float32x2_t)vdup_lane_s32((int32x2_t)v113, 1), v113).f32[0])
            + ((float)(v114 + (float)(v432.f32[0] * v93.f32[0])) + (float)(v114 + (float)(v432.f32[0] * v93.f32[0])))
            * (float)-(float)(v407 - (float)(v433.f32[1] * v430))
            + v110
            + _S0;
        if (v96 > _S0 && v96 > (float)-_S0)
        {
          v422 = -v52;
          v116 = _D21.f32[1];
          v117 = v93.f32[1];
          v118 = v91.f32[1];
          v119 = v91.f32[1] != 0.0 || v91.f32[0] != 0.0;
          v120 = v93.f32[0] != 0.0 || v119;
          if (v93.f32[1] == 0.0)
            v121 = v120;
          else
            v121 = 1;
          if (v121 == 1)
          {
            v122 = -(float)((float)((float)((float)(v433.f32[1] * v433.f32[1]) + (float)(v422 * v52))
                                  - (float)((float)(v52 + v52) * v411))
                          - (float)(v411 * v411));
            v123 = v122
                 - (float)((float)((float)(v97 - (float)(v401 * v401)) - (float)((float)(v401 + v401) * v402))
                         - (float)(v402 * v402));
            v124 = (float)(v433.f32[1] * v433.f32[1]) + v123;
            v125 = (float)(v123 - (float)(v124 - (float)(v433.f32[1] * v433.f32[1])))
                 + (float)((float)(v433.f32[1] * v433.f32[1])
                         + (float)((float)(v124 - (float)(v433.f32[1] * v433.f32[1])) - v124));
            v488[0] = (float)((float)-(float)((float)((float)(v97 - (float)(v401 * v401))
                                                    - (float)((float)(v401 + v401) * v402))
                                            - (float)(v402 * v402))
                            - (float)(v123 - v122))
                    + (float)(v122 + (float)((float)(v123 - v122) - v123));
            v488[1] = (float)(v97 - (float)((float)(v97 + v125) - v125))
                    + (float)(v125 + (float)((float)((float)(v97 + v125) - v125) - (float)(v97 + v125)));
            v488[2] = (float)((float)(v97 + v125) - (float)((float)(v124 + (float)(v97 + v125)) - v124))
                    + (float)(v124
                            + (float)((float)((float)(v124 + (float)(v97 + v125)) - v124)
                                    - (float)(v124 + (float)(v97 + v125))));
            v488[3] = v124 + (float)(v97 + v125);
          }
          v126 = v93.f32[1] != 0.0 || v93.f32[0] != 0.0;
          v127 = _D21.f32[1] != 0.0 || v126;
          if (_D21.f32[0] == 0.0)
            v128 = v127;
          else
            v128 = 1;
          if (v128 == 1)
          {
            v129 = -(float)((float)((float)(v397 + (float)((float)-v423 * v423)) - (float)((float)(v423 + v423) * v429))
                          - (float)(v429 * v429));
            v130 = v129
                 - (float)((float)((float)(v106 - (float)(v427 * v427)) - (float)((float)(v427 + v427) * v428))
                         - (float)(v428 * v428));
            v131 = (float)((float)-(float)((float)((float)(v106 - (float)(v427 * v427))
                                                 - (float)((float)(v427 + v427) * v428))
                                         - (float)(v428 * v428))
                         - (float)(v130 - v129))
                 + (float)(v129 + (float)((float)(v130 - v129) - v130));
            v132 = v397 + v130;
            v133 = (float)(v130 - (float)((float)(v397 + v130) - v397))
                 + (float)(v397 + (float)((float)((float)(v397 + v130) - v397) - (float)(v397 + v130)));
            v487[0] = v131;
            v487[1] = (float)(v106 - (float)((float)(v106 + v133) - v133))
                    + (float)(v133 + (float)((float)((float)(v106 + v133) - v133) - (float)(v106 + v133)));
            v487[2] = (float)((float)(v106 + v133) - (float)((float)(v132 + (float)(v106 + v133)) - v132))
                    + (float)(v132
                            + (float)((float)((float)(v132 + (float)(v106 + v133)) - v132)
                                    - (float)(v132 + (float)(v106 + v133))));
            v487[3] = v132 + (float)(v106 + v133);
          }
          v134 = -v32;
          v135 = _D21.f32[0] != 0.0 || _D21.f32[1] != 0.0;
          v136 = v91.f32[0] != 0.0 || v135;
          if (v91.f32[1] != 0.0)
            v136 = 1;
          v137 = v430;
          if (v136 == 1)
          {
            v138 = -(float)((float)((float)(v399
                                          + (float)(v134
                                                  * (float)((float)(4096.0 * v25.f32[0])
                                                          - (float)((float)(4096.0 * v25.f32[0]) - v25.f32[0]))))
                                  - (float)((float)((float)((float)(4096.0 * v25.f32[0])
                                                          - (float)((float)(4096.0 * v25.f32[0]) - v25.f32[0]))
                                                  + (float)((float)(4096.0 * v25.f32[0])
                                                          - (float)((float)(4096.0 * v25.f32[0]) - v25.f32[0])))
                                          * v412))
                          - (float)(v412 * v412));
            v139 = v138
                 - (float)((float)((float)(v111 - (float)(v28 * v28)) - (float)((float)(v28 + v28) * v404))
                         - (float)(v404 * v404));
            v140 = (float)((float)-(float)((float)((float)(v111 - (float)(v28 * v28))
                                                 - (float)((float)(v28 + v28) * v404))
                                         - (float)(v404 * v404))
                         - (float)(v139 - v138))
                 + (float)(v138 + (float)((float)(v139 - v138) - v139));
            v141 = v399 + v139;
            v142 = (float)(v139 - (float)((float)(v399 + v139) - v399))
                 + (float)(v399 + (float)((float)((float)(v399 + v139) - v399) - (float)(v399 + v139)));
            v486[0] = v140;
            v486[1] = (float)(v111 - (float)((float)(v111 + v142) - v142))
                    + (float)(v142 + (float)((float)((float)(v111 + v142) - v142) - (float)(v111 + v142)));
            v486[2] = (float)((float)(v111 + v142) - (float)((float)(v141 + (float)(v111 + v142)) - v141))
                    + (float)(v141
                            + (float)((float)((float)(v141 + (float)(v111 + v142)) - v141)
                                    - (float)(v141 + (float)(v111 + v142))));
            v486[3] = v141 + (float)(v111 + v142);
          }
          v426 = v93;
          v416 = _D21;
          v418 = v91;
          v389 = v107;
          v390 = v112.f32[1];
          v408 = -v423;
          v420 = v126;
          v398 = v136;
          v414 = v119;
          v391 = v128;
          v392 = v99.f32[1];
          if (_D21.f32[1] == 0.0)
          {
            v384 = 0;
            v150 = v489;
            v151 = &v490;
          }
          else
          {
            v384 = sub_1DEE65BF8(4, v510, v457, _D21.f32[1]);
            v143 = sub_1DEE65BF8(v384, v457, v476, v433.f32[1] + v433.f32[1]);
            v144 = sub_1DEE65BF8(4, v486, v468, v116);
            v145 = sub_1DEE65BF8(v144, v468, v475, v430);
            v146 = sub_1DEE65BF8(4, v487, v469, v116);
            v147 = sub_1DEE65BF8(v146, v469, v474, -v25.f32[1]);
            v148 = sub_1DEE659F0(v143, v476, v145, v475, v473);
            v149 = sub_1DEE659F0(v147, v474, v148, v473, v471);
            v150 = &v490;
            v151 = v489;
            v152 = sub_1DEE659F0(v82, &v490, v149, v471, v489);
            _D21.i32[0] = v416.i32[0];
            v82 = v152;
          }
          if (_D21.f32[0] == 0.0)
          {
            v385 = 0;
            v160 = v151;
          }
          else
          {
            v385 = sub_1DEE65BF8(4, v510, v456, _D21.f32[0]);
            v153 = sub_1DEE65BF8(v385, v456, v476, v433.f32[0] + v433.f32[0]);
            v154 = sub_1DEE65BF8(4, v487, v467, v416.f32[0]);
            v155 = sub_1DEE65BF8(v154, v467, v475, v432.f32[0]);
            v156 = sub_1DEE65BF8(4, v486, v466, v416.f32[0]);
            v157 = sub_1DEE65BF8(v156, v466, v474, -v431.f32[0]);
            v158 = sub_1DEE659F0(v153, v476, v155, v475, v473);
            v159 = sub_1DEE659F0(v157, v474, v158, v473, v471);
            v82 = sub_1DEE659F0(v82, v151, v159, v471, v150);
            v160 = v150;
            v150 = v151;
          }
          if (v418.f32[0] == 0.0)
          {
            v386 = 0;
            v168 = v160;
          }
          else
          {
            v386 = sub_1DEE65BF8(4, v509, v455, v418.f32[0]);
            v161 = sub_1DEE65BF8(v386, v455, v476, v431.f32[0] + v431.f32[0]);
            v162 = sub_1DEE65BF8(4, v488, v465, v418.f32[0]);
            v163 = sub_1DEE65BF8(v162, v465, v475, v25.f32[1]);
            v164 = sub_1DEE65BF8(4, v486, v464, v418.f32[0]);
            v165 = sub_1DEE65BF8(v164, v464, v474, -v433.f32[0]);
            v166 = sub_1DEE659F0(v161, v476, v163, v475, v473);
            v167 = sub_1DEE659F0(v165, v474, v166, v473, v471);
            v82 = sub_1DEE659F0(v82, v160, v167, v471, v150);
            v168 = v150;
            v150 = v160;
          }
          if (v118 == 0.0)
          {
            v387 = 0;
            v176 = v168;
          }
          else
          {
            v387 = sub_1DEE65BF8(4, v509, v454, v118);
            v169 = sub_1DEE65BF8(v387, v454, v476, v430 + v430);
            v170 = sub_1DEE65BF8(4, v486, v462, v118);
            v171 = sub_1DEE65BF8(v170, v462, v475, v433.f32[1]);
            v172 = sub_1DEE65BF8(4, v488, v463, v118);
            v173 = sub_1DEE65BF8(v172, v463, v474, -v432.f32[0]);
            v174 = sub_1DEE659F0(v169, v476, v171, v475, v473);
            v175 = sub_1DEE659F0(v173, v474, v174, v473, v471);
            v82 = sub_1DEE659F0(v82, v168, v175, v471, v150);
            v176 = v150;
            v150 = v168;
          }
          if (v426.f32[0] == 0.0)
          {
            v177 = 0;
            v185 = v176;
          }
          else
          {
            v177 = sub_1DEE65BF8(4, v508, v453, v426.f32[0]);
            v178 = sub_1DEE65BF8(v177, v453, v476, v432.f32[0] + v432.f32[0]);
            v179 = sub_1DEE65BF8(4, v487, v460, v426.f32[0]);
            v180 = sub_1DEE65BF8(v179, v460, v475, v433.f32[0]);
            v181 = sub_1DEE65BF8(4, v488, v461, v426.f32[0]);
            v182 = sub_1DEE65BF8(v181, v461, v474, -v430);
            v183 = sub_1DEE659F0(v178, v476, v180, v475, v473);
            v184 = sub_1DEE659F0(v182, v474, v183, v473, v471);
            v82 = sub_1DEE659F0(v82, v176, v184, v471, v150);
            v185 = v150;
            v150 = v176;
          }
          v424 = -v429;
          v406 = -v412;
          v400 = -v411;
          v410 = v117;
          if (v117 == 0.0)
          {
            if (!v135)
            {
              v388 = 0;
              v194 = v185;
              v185 = v150;
              v195 = v426.f32[0];
              v196 = v418.f32[0];
              goto LABEL_92;
            }
            if (!v121)
            {
              v405 = v134;
              v388 = 0;
              v438[0] = 0.0;
              v435[0] = 0.0;
              v221 = 1;
              v220 = 1;
              goto LABEL_79;
            }
            v388 = 0;
            v193 = v185;
            v185 = v150;
            v195 = v426.f32[0];
            v196 = v418.f32[0];
          }
          else
          {
            v388 = sub_1DEE65BF8(4, v508, v452, v117);
            v186 = sub_1DEE65BF8(v388, v452, v476, v25.f32[1] + v25.f32[1]);
            v187 = sub_1DEE65BF8(4, v488, v459, v117);
            v188 = sub_1DEE65BF8(v187, v459, v475, v431.f32[0]);
            v189 = sub_1DEE65BF8(4, v487, v458, v117);
            v190 = sub_1DEE65BF8(v189, v458, v474, -v433.f32[1]);
            v191 = sub_1DEE659F0(v186, v476, v188, v475, v473);
            v192 = sub_1DEE659F0(v190, v474, v191, v473, v471);
            v82 = sub_1DEE659F0(v82, v185, v192, v471, v150);
            v193 = v150;
            v194 = v150;
            v195 = v426.f32[0];
            v196 = v418.f32[0];
            if (!v135)
              goto LABEL_92;
          }
          v150 = v185;
          v197 = (float)(v196 * 4096.0) - (float)((float)(v196 * 4096.0) - v196);
          v395 = v116;
          v198 = v196 - v197;
          v199 = -(float)((float)((float)((float)(v392 - (float)(v197 * v403)) - (float)(v198 * v403))
                                - (float)(v197 * v404))
                        - (float)(v198 * v404));
          v200 = v431.f32[0] * v117;
          v201 = v134;
          v202 = (float)(v117 * 4096.0) - (float)((float)(v117 * 4096.0) - v117);
          v203 = v117;
          v204 = v117 - v202;
          v205 = v199
               - (float)((float)((float)((float)(v200 + (float)(v408 * v202)) + (float)(v424 * v202))
                               + (float)(v408 * v204))
                       - (float)(v429 * v204));
          v206 = (float)((float)-(float)((float)((float)((float)(v200 + (float)(v408 * v202)) + (float)(v424 * v202))
                                               + (float)(v408 * v204))
                                       - (float)(v429 * v204))
                       - (float)(v205 - v199))
               + (float)(v199 - (float)(v205 - (float)(v205 - v199)));
          v207 = v392 + v205;
          v208 = (float)(v205 - (float)((float)(v392 + v205) - v392))
               + (float)(v392 - (float)((float)(v392 + v205) - (float)((float)(v392 + v205) - v392)));
          v209 = v200 + v208;
          v482 = v206;
          v483 = (float)(v200 - (float)((float)(v200 + v208) - v208))
               + (float)(v208 - (float)((float)(v200 + v208) - (float)((float)(v200 + v208) - v208)));
          v210 = v207 + (float)(v200 + v208);
          v484 = (float)(v209 - (float)(v210 - v207)) + (float)(v207 - (float)(v210 - (float)(v210 - v207)));
          v485 = v210;
          v211 = -(float)(v430 * v195);
          v212 = (float)(v195 * 4096.0) - (float)((float)(v195 * 4096.0) - v195);
          v213 = v195 - v212;
          v214 = -(float)((float)((float)((float)(v211
                                                - (float)(v212
                                                        * (float)((float)(v430 * -4096.0)
                                                                - (float)(v430 + (float)(v430 * -4096.0)))))
                                        - (float)((float)(v195 - v212)
                                                * (float)((float)(v430 * -4096.0)
                                                        - (float)(v430 + (float)(v430 * -4096.0)))))
                                - (float)(v212
                                        * (float)((float)-v430
                                                - (float)((float)(v430 * -4096.0)
                                                        - (float)(v430 + (float)(v430 * -4096.0))))))
                        - (float)((float)(v195 - v212)
                                * (float)((float)-v430
                                        - (float)((float)(v430 * -4096.0) - (float)(v430 + (float)(v430 * -4096.0))))));
          v405 = v201;
          v215 = v214
               - (float)((float)((float)((float)((float)(v201
                                                       * (float)((float)(v118 * -4096.0)
                                                               - (float)(v118 + (float)(v118 * -4096.0))))
                                               - (float)(v118 * v432.f32[0]))
                                       + (float)(v406
                                               * (float)((float)(v118 * -4096.0)
                                                       - (float)(v118 + (float)(v118 * -4096.0)))))
                               + (float)(v201
                                       * (float)((float)-v118
                                               - (float)((float)(v118 * -4096.0)
                                                       - (float)(v118 + (float)(v118 * -4096.0))))))
                       - (float)(v412
                               * (float)((float)-v118
                                       - (float)((float)(v118 * -4096.0) - (float)(v118 + (float)(v118 * -4096.0))))));
          v216 = (float)((float)-(float)((float)((float)((float)((float)(v201
                                                                       * (float)((float)(v118 * -4096.0)
                                                                               - (float)(v118 + (float)(v118 * -4096.0))))
                                                               - (float)(v118 * v432.f32[0]))
                                                       + (float)(v406
                                                               * (float)((float)(v118 * -4096.0)
                                                                       - (float)(v118 + (float)(v118 * -4096.0)))))
                                               + (float)(v201
                                                       * (float)((float)-v118
                                                               - (float)((float)(v118 * -4096.0)
                                                                       - (float)(v118 + (float)(v118 * -4096.0))))))
                                       - (float)(v412
                                               * (float)((float)-v118
                                                       - (float)((float)(v118 * -4096.0)
                                                               - (float)(v118 + (float)(v118 * -4096.0))))))
                       - (float)(v215 - v214))
               + (float)(v214 - (float)(v215 - (float)(v215 - v214)));
          v217 = v215 - (float)(v430 * v195);
          v218 = (float)(v215 - (float)(v217 - v211)) + (float)(v211 - (float)(v217 - (float)(v217 - v211)));
          v219 = v218 - (float)(v118 * v432.f32[0]);
          v478 = v216;
          v479 = (float)((float)-(float)(v118 * v432.f32[0]) - (float)(v219 - v218))
               + (float)(v218 - (float)(v219 - (float)(v219 - v218)));
          v480 = (float)(v219 - (float)((float)(v217 + v219) - v217))
               + (float)(v217 - (float)((float)(v217 + v219) - (float)((float)(v217 + v219) - v217)));
          v481 = v217 + v219;
          v220 = 4;
          v221 = sub_1DEE659F0(4, &v482, 4, &v478, v438);
          v222 = -(float)((float)((float)((float)((float)(v418.f32[0] * v203) - (float)(v197 * v202))
                                        - (float)(v198 * v202))
                                - (float)(v197 * v204))
                        - (float)(v198 * v204));
          v116 = v395;
          v223 = -(float)((float)((float)((float)((float)(v118 * v426.f32[0])
                                                - (float)(v212
                                                        * (float)((float)(v118 * 4096.0)
                                                                - (float)((float)(v118 * 4096.0) - v118))))
                                        - (float)(v213
                                                * (float)((float)(v118 * 4096.0) - (float)((float)(v118 * 4096.0) - v118))))
                                - (float)(v212
                                        * (float)(v118
                                                - (float)((float)(v118 * 4096.0) - (float)((float)(v118 * 4096.0) - v118)))))
                        - (float)(v213
                                * (float)(v118 - (float)((float)(v118 * 4096.0) - (float)((float)(v118 * 4096.0) - v118)))));
          v224 = v222 - v223;
          v225 = (float)((float)(v222 - (float)(v222 - v223)) - v223)
               + (float)(v222 - (float)((float)(v222 - v223) + (float)(v222 - (float)(v222 - v223))));
          v226 = (float)(v418.f32[0] * v203) + v224;
          v227 = (float)(v224 - (float)(v226 - (float)(v418.f32[0] * v203)))
               + (float)((float)(v418.f32[0] * v203) - (float)(v226 - (float)(v226 - (float)(v418.f32[0] * v203))));
          v228 = v227 - (float)(v118 * v426.f32[0]);
          v435[0] = v225;
          v435[1] = (float)((float)(v227 - v228) - (float)(v118 * v426.f32[0]))
                  + (float)(v227 - (float)(v228 + (float)(v227 - v228)));
          v435[2] = (float)(v228 - (float)((float)(v226 + v228) - v226))
                  + (float)(v226 - (float)((float)(v226 + v228) - (float)((float)(v226 + v228) - v226)));
          v435[3] = v226 + v228;
          v185 = v193;
LABEL_79:
          if (v116 == 0.0)
          {
            v194 = v185;
            v117 = v410;
            _S12 = v25.f32[1];
            v236 = v416.f32[0];
            v137 = v430;
          }
          else
          {
            v229 = sub_1DEE65BF8(v384, v457, v476, v116);
            v230 = sub_1DEE65BF8(v221, v438, v451, v116);
            v231 = sub_1DEE65BF8(v230, v451, v473, v433.f32[1] + v433.f32[1]);
            v232 = sub_1DEE659F0(v229, v476, v231, v473, v471);
            v233 = sub_1DEE659F0(v82, v185, v232, v471, v150);
            if (v118 == 0.0)
            {
              v194 = v150;
              v150 = v185;
            }
            else
            {
              v234 = sub_1DEE65BF8(4, v486, v477, v116);
              v235 = sub_1DEE65BF8(v234, v477, v476, v118);
              v233 = sub_1DEE659F0(v233, v150, v235, v476, v185);
              v194 = v185;
            }
            v117 = v410;
            _S12 = v25.f32[1];
            v137 = v430;
            v237 = v177;
            if (v410 == 0.0)
            {
              v240 = v194;
              v194 = v150;
              v150 = v240;
            }
            else
            {
              v238 = sub_1DEE65BF8(4, v487, v477, -v116);
              v239 = sub_1DEE65BF8(v238, v477, v476, v410);
              v233 = sub_1DEE659F0(v233, v194, v239, v476, v150);
              v240 = v150;
            }
            v241 = sub_1DEE65BF8(v230, v451, v473, v116);
            v242 = sub_1DEE65BF8(v220, v435, v445, v116);
            v243 = sub_1DEE65BF8(v242, v445, v476, v433.f32[1] + v433.f32[1]);
            v244 = sub_1DEE65BF8(v242, v445, v475, v116);
            v245 = sub_1DEE659F0(v243, v476, v244, v475, v472);
            v246 = sub_1DEE659F0(v241, v473, v245, v472, v470);
            v82 = sub_1DEE659F0(v233, v240, v246, v470, v194);
            v236 = v416.f32[0];
            v177 = v237;
          }
          if (v236 != 0.0)
          {
            v247 = sub_1DEE65BF8(v385, v456, v476, v236);
            v248 = sub_1DEE65BF8(v221, v438, v450, v416.f32[0]);
            v249 = sub_1DEE65BF8(v248, v450, v473, v433.f32[0] + v433.f32[0]);
            v250 = sub_1DEE659F0(v247, v476, v249, v473, v471);
            v251 = sub_1DEE659F0(v82, v194, v250, v471, v150);
            v252 = sub_1DEE65BF8(v248, v450, v473, v416.f32[0]);
            v253 = sub_1DEE65BF8(v220, v435, v444, v416.f32[0]);
            v254 = sub_1DEE65BF8(v253, v444, v476, v433.f32[0] + v433.f32[0]);
            v255 = sub_1DEE65BF8(v253, v444, v475, v416.f32[0]);
            v256 = sub_1DEE659F0(v254, v476, v255, v475, v472);
            v257 = sub_1DEE659F0(v252, v473, v256, v472, v470);
            v82 = sub_1DEE659F0(v251, v150, v257, v470, v194);
            v258 = v432;
            v195 = v426.f32[0];
            if (!v414)
              goto LABEL_111;
            goto LABEL_95;
          }
          v185 = v150;
          v195 = v426.f32[0];
          v196 = v418.f32[0];
          v134 = v405;
LABEL_92:
          if (!v414)
          {
            v150 = v185;
            goto LABEL_111;
          }
          if (!v391)
          {
            v437[0] = 0.0;
            v434[0] = 0.0;
            v280 = 1;
            v279 = 1;
            goto LABEL_98;
          }
          v405 = v134;
          v150 = v185;
          v258 = v432;
LABEL_95:
          v393 = v118;
          v259 = (float)(v195 * 4096.0) - (float)((float)(v195 * 4096.0) - v195);
          v260 = v195 - v259;
          v261 = -(float)((float)((float)((float)(v389 - (float)(v259 * v401)) - (float)((float)(v195 - v259) * v401))
                                - (float)(v259 * v402))
                        - (float)((float)(v195 - v259) * v402));
          v262 = vmul_f32(v258, v416).f32[0];
          v263 = (float)(v416.f32[0] * 4096.0) - (float)((float)(v416.f32[0] * 4096.0) - v416.f32[0]);
          v264 = v117;
          v265 = v261
               - (float)((float)((float)((float)(v262 + (float)(v405 * v263)) + (float)(v406 * v263))
                               + (float)(v405 * (float)(v416.f32[0] - v263)))
                       - (float)(v412 * (float)(v416.f32[0] - v263)));
          v266 = (float)((float)-(float)((float)((float)((float)(v262 + (float)(v405 * v263)) + (float)(v406 * v263))
                                               + (float)(v405 * (float)(v416.f32[0] - v263)))
                                       - (float)(v412 * (float)(v416.f32[0] - v263)))
                       - (float)(v265 - v261))
               + (float)(v261 - (float)(v265 - (float)(v265 - v261)));
          v267 = v389 + v265;
          v268 = (float)(v265 - (float)((float)(v389 + v265) - v389))
               + (float)(v389 - (float)((float)(v389 + v265) - (float)((float)(v389 + v265) - v389)));
          v482 = v266;
          v483 = (float)(v262 - (float)((float)(v262 + v268) - v268))
               + (float)(v268 - (float)((float)(v262 + v268) - (float)((float)(v262 + v268) - v268)));
          v484 = (float)((float)(v262 + v268) - (float)((float)(v267 + (float)(v262 + v268)) - v267))
               + (float)(v267
                       - (float)((float)(v267 + (float)(v262 + v268))
                               - (float)((float)(v267 + (float)(v262 + v268)) - v267)));
          v485 = v267 + (float)(v262 + v268);
          v269 = -_S12;
          v270 = -(float)(_S12 * v116);
          v271 = _S12;
          v272 = (float)(v116 * 4096.0) - (float)((float)(v116 * 4096.0) - v116);
          v273 = -(float)((float)((float)((float)(v270
                                                - (float)(v272
                                                        * (float)((float)(v271 * -4096.0)
                                                                - (float)(v271 + (float)(v271 * -4096.0)))))
                                        - (float)((float)(v116 - v272)
                                                * (float)((float)(v271 * -4096.0)
                                                        - (float)(v271 + (float)(v271 * -4096.0)))))
                                - (float)(v272
                                        * (float)(v269
                                                - (float)((float)(v271 * -4096.0)
                                                        - (float)(v271 + (float)(v271 * -4096.0))))))
                        - (float)((float)(v116 - v272)
                                * (float)(v269
                                        - (float)((float)(v271 * -4096.0) - (float)(v271 + (float)(v271 * -4096.0))))));
          v274 = v273
               - (float)((float)((float)((float)((float)(v422
                                                       * (float)((float)(v264 * -4096.0)
                                                               - (float)(v264 + (float)(v264 * -4096.0))))
                                               - (float)(v264 * v433.f32[1]))
                                       + (float)(v400
                                               * (float)((float)(v264 * -4096.0)
                                                       - (float)(v264 + (float)(v264 * -4096.0)))))
                               + (float)(v422
                                       * (float)((float)-v264
                                               - (float)((float)(v264 * -4096.0)
                                                       - (float)(v264 + (float)(v264 * -4096.0))))))
                       - (float)(v411
                               * (float)((float)-v264
                                       - (float)((float)(v264 * -4096.0) - (float)(v264 + (float)(v264 * -4096.0))))));
          v275 = (float)((float)-(float)((float)((float)((float)((float)(v422
                                                                       * (float)((float)(v264 * -4096.0)
                                                                               - (float)(v264 + (float)(v264 * -4096.0))))
                                                               - (float)(v264 * v433.f32[1]))
                                                       + (float)(v400
                                                               * (float)((float)(v264 * -4096.0)
                                                                       - (float)(v264 + (float)(v264 * -4096.0)))))
                                               + (float)(v422
                                                       * (float)((float)-v264
                                                               - (float)((float)(v264 * -4096.0)
                                                                       - (float)(v264 + (float)(v264 * -4096.0))))))
                                       - (float)(v411
                                               * (float)((float)-v264
                                                       - (float)((float)(v264 * -4096.0)
                                                               - (float)(v264 + (float)(v264 * -4096.0))))))
                       - (float)(v274 - v273))
               + (float)(v273 - (float)(v274 - (float)(v274 - v273)));
          v276 = v270 + v274;
          v277 = (float)(v274 - (float)((float)(v270 + v274) - v270))
               + (float)(v270 - (float)((float)(v270 + v274) - (float)((float)(v270 + v274) - v270)));
          v278 = v277 - (float)(v117 * v433.f32[1]);
          v478 = v275;
          v479 = (float)((float)-(float)(v117 * v433.f32[1]) - (float)(v278 - v277))
               + (float)(v277 - (float)(v278 - (float)(v278 - v277)));
          v480 = (float)(v278 - (float)((float)(v276 + v278) - v276))
               + (float)(v276 - (float)((float)(v276 + v278) - (float)((float)(v276 + v278) - v276)));
          v481 = v276 + v278;
          v279 = 4;
          v280 = sub_1DEE659F0(4, &v482, 4, &v478, v437);
          v281 = vmul_f32(v416, v426).f32[0];
          v282 = (float)((float)(v281 - (float)(v259 * v263)) - (float)(v260 * v263))
               - (float)(v259 * (float)(v416.f32[0] - v263));
          v118 = v393;
          v283 = -(float)(v282 - (float)(v260 * (float)(v416.f32[0] - v263)));
          v137 = v430;
          v284 = -(float)((float)((float)((float)((float)(v116 * v117)
                                                - (float)(v272
                                                        * (float)((float)(v117 * 4096.0)
                                                                - (float)((float)(v117 * 4096.0) - v117))))
                                        - (float)((float)(v116 - v272)
                                                * (float)((float)(v117 * 4096.0) - (float)((float)(v117 * 4096.0) - v117))))
                                - (float)(v272
                                        * (float)(v117
                                                - (float)((float)(v117 * 4096.0) - (float)((float)(v117 * 4096.0) - v117)))))
                        - (float)((float)(v116 - v272)
                                * (float)(v117 - (float)((float)(v117 * 4096.0) - (float)((float)(v117 * 4096.0) - v117)))));
          v285 = v283 - v284;
          v286 = (float)((float)(v283 - (float)(v283 - v284)) - v284)
               + (float)(v283 - (float)((float)(v283 - v284) + (float)(v283 - (float)(v283 - v284))));
          v287 = v281 + v285;
          v288 = (float)(v285 - (float)((float)(v281 + v285) - v281))
               + (float)(v281 - (float)((float)(v281 + v285) - (float)((float)(v281 + v285) - v281)));
          v289 = v288 - (float)(v116 * v117);
          v434[0] = v286;
          v434[1] = (float)((float)(v288 - v289) - (float)(v116 * v117))
                  + (float)(v288 - (float)(v289 + (float)(v288 - v289)));
          v434[2] = (float)(v289 - (float)((float)(v287 + v289) - v287))
                  + (float)(v287 - (float)((float)(v287 + v289) - (float)((float)(v287 + v289) - v287)));
          v434[3] = v287 + v289;
          v185 = v150;
          v196 = v418.f32[0];
LABEL_98:
          if (v196 == 0.0)
          {
            _S12 = v25.f32[1];
          }
          else
          {
            v290 = sub_1DEE65BF8(v386, v455, v476, v196);
            v291 = sub_1DEE65BF8(v280, v437, v449, v418.f32[0]);
            v292 = sub_1DEE65BF8(v291, v449, v473, v431.f32[0] + v431.f32[0]);
            v293 = sub_1DEE659F0(v290, v476, v292, v473, v471);
            v294 = sub_1DEE659F0(v82, v194, v293, v471, v185);
            if (v117 == 0.0)
            {
              v297 = v185;
              v185 = v194;
            }
            else
            {
              v295 = sub_1DEE65BF8(4, v488, v477, v418.f32[0]);
              v296 = sub_1DEE65BF8(v295, v477, v476, v117);
              v294 = sub_1DEE659F0(v294, v185, v296, v476, v194);
              v297 = v194;
            }
            _S12 = v25.f32[1];
            v298 = v177;
            if (v416.f32[0] == 0.0)
            {
              v303 = v297;
              v297 = v185;
              v185 = v303;
              v302 = v418.f32[0];
            }
            else
            {
              v299 = sub_1DEE65BF8(4, v486, v477, -v418.f32[0]);
              v300 = sub_1DEE65BF8(v299, v477, v476, v416.f32[0]);
              v301 = sub_1DEE659F0(v294, v297, v300, v476, v185);
              v302 = v418.f32[0];
              v294 = v301;
              v303 = v185;
            }
            v304 = sub_1DEE65BF8(v291, v449, v473, v302);
            v305 = sub_1DEE65BF8(v279, v434, v443, v418.f32[0]);
            v306 = sub_1DEE65BF8(v305, v443, v476, v431.f32[0] + v431.f32[0]);
            v307 = sub_1DEE65BF8(v305, v443, v475, v418.f32[0]);
            v308 = sub_1DEE659F0(v306, v476, v307, v475, v472);
            v309 = sub_1DEE659F0(v304, v473, v308, v472, v470);
            v82 = sub_1DEE659F0(v294, v303, v309, v470, v297);
            v194 = v297;
            v177 = v298;
          }
          if (v118 != 0.0)
          {
            v310 = sub_1DEE65BF8(v387, v454, v476, v118);
            v311 = sub_1DEE65BF8(v280, v437, v448, v118);
            v312 = sub_1DEE65BF8(v311, v448, v473, v137 + v137);
            v313 = sub_1DEE659F0(v310, v476, v312, v473, v471);
            v314 = sub_1DEE659F0(v82, v194, v313, v471, v185);
            v315 = sub_1DEE65BF8(v311, v448, v473, v118);
            v316 = sub_1DEE65BF8(v279, v434, v442, v118);
            v317 = sub_1DEE65BF8(v316, v442, v476, v137 + v137);
            v318 = sub_1DEE65BF8(v316, v442, v475, v118);
            v319 = sub_1DEE659F0(v317, v476, v318, v475, v472);
            v320 = sub_1DEE659F0(v315, v473, v319, v472, v470);
            v82 = sub_1DEE659F0(v314, v185, v320, v470, v194);
            if (!v420)
              goto LABEL_126;
            goto LABEL_114;
          }
          v150 = v185;
          v195 = v426.f32[0];
LABEL_111:
          if (!v420)
          {
LABEL_126:
            _S0 = v194[v82 - 1];
            goto LABEL_127;
          }
          if (!v398)
          {
            v394 = v118;
            v439[0] = 0.0;
            v436[0] = 0.0;
            v340 = 1;
            v339 = 1;
            goto LABEL_116;
          }
          v185 = v150;
LABEL_114:
          v321 = (float)(v116 * 4096.0) - (float)((float)(v116 * 4096.0) - v116);
          v396 = v116;
          v322 = v116 - v321;
          v323 = -(float)((float)((float)((float)(v390 - (float)(v321 * v427)) - (float)(v322 * v427))
                                - (float)(v321 * v428))
                        - (float)(v322 * v428));
          v324 = (float)(v118 * 4096.0) - (float)((float)(v118 * 4096.0) - v118);
          v325 = v323
               - (float)((float)((float)((float)((float)(v433.f32[1] * v118) + (float)(v422 * v324))
                                       + (float)(v400 * v324))
                               + (float)(v422 * (float)(v118 - v324)))
                       - (float)(v411 * (float)(v118 - v324)));
          v326 = (float)((float)-(float)((float)((float)((float)((float)(v433.f32[1] * v118) + (float)(v422 * v324))
                                                       + (float)(v400 * v324))
                                               + (float)(v422 * (float)(v118 - v324)))
                                       - (float)(v411 * (float)(v118 - v324)))
                       - (float)(v325 - v323))
               + (float)(v323 - (float)(v325 - (float)(v325 - v323)));
          v327 = v390 + v325;
          v328 = (float)(v325 - (float)((float)(v390 + v325) - v390))
               + (float)(v390 - (float)((float)(v390 + v325) - (float)((float)(v390 + v325) - v390)));
          v329 = (float)(v433.f32[1] * v118) + v328;
          v482 = v326;
          v483 = (float)((float)(v433.f32[1] * v118) - (float)(v329 - v328))
               + (float)(v328 - (float)(v329 - (float)(v329 - v328)));
          v484 = (float)(v329 - (float)((float)(v327 + v329) - v327))
               + (float)(v327 - (float)((float)(v327 + v329) - (float)((float)(v327 + v329) - v327)));
          v485 = v327 + v329;
          v330 = -(float)(v433.f32[0] * v418.f32[0]);
          v331 = (float)(v418.f32[0] * 4096.0) - (float)((float)(v418.f32[0] * 4096.0) - v418.f32[0]);
          v332 = v418.f32[0] - v331;
          v333 = -(float)((float)((float)((float)(v330
                                                - (float)(v331
                                                        * (float)((float)(v433.f32[0] * -4096.0)
                                                                - (float)(v433.f32[0] + (float)(v433.f32[0] * -4096.0)))))
                                        - (float)((float)(v418.f32[0] - v331)
                                                * (float)((float)(v433.f32[0] * -4096.0)
                                                        - (float)(v433.f32[0] + (float)(v433.f32[0] * -4096.0)))))
                                - (float)(v331
                                        * (float)((float)-v433.f32[0]
                                                - (float)((float)(v433.f32[0] * -4096.0)
                                                        - (float)(v433.f32[0] + (float)(v433.f32[0] * -4096.0))))))
                        - (float)((float)(v418.f32[0] - v331)
                                * (float)((float)-v433.f32[0]
                                        - (float)((float)(v433.f32[0] * -4096.0)
                                                - (float)(v433.f32[0] + (float)(v433.f32[0] * -4096.0))))));
          v334 = v333
               - (float)((float)((float)((float)((float)(v408
                                                       * (float)((float)(v416.f32[0] * -4096.0)
                                                               - (float)(v416.f32[0] + (float)(v416.f32[0] * -4096.0))))
                                               - (float)(v416.f32[0] * v431.f32[0]))
                                       + (float)(v424
                                               * (float)((float)(v416.f32[0] * -4096.0)
                                                       - (float)(v416.f32[0] + (float)(v416.f32[0] * -4096.0)))))
                               + (float)(v408
                                       * (float)((float)-v416.f32[0]
                                               - (float)((float)(v416.f32[0] * -4096.0)
                                                       - (float)(v416.f32[0] + (float)(v416.f32[0] * -4096.0))))))
                       - (float)(v429
                               * (float)((float)-v416.f32[0]
                                       - (float)((float)(v416.f32[0] * -4096.0)
                                               - (float)(v416.f32[0] + (float)(v416.f32[0] * -4096.0))))));
          v335 = (float)((float)-(float)((float)((float)((float)((float)(v408
                                                                       * (float)((float)(v416.f32[0] * -4096.0)
                                                                               - (float)(v416.f32[0]
                                                                                       + (float)(v416.f32[0] * -4096.0))))
                                                               - (float)(v416.f32[0] * v431.f32[0]))
                                                       + (float)(v424
                                                               * (float)((float)(v416.f32[0] * -4096.0)
                                                                       - (float)(v416.f32[0]
                                                                               + (float)(v416.f32[0] * -4096.0)))))
                                               + (float)(v408
                                                       * (float)((float)-v416.f32[0]
                                                               - (float)((float)(v416.f32[0] * -4096.0)
                                                                       - (float)(v416.f32[0]
                                                                               + (float)(v416.f32[0] * -4096.0))))))
                                       - (float)(v429
                                               * (float)((float)-v416.f32[0]
                                                       - (float)((float)(v416.f32[0] * -4096.0)
                                                               - (float)(v416.f32[0] + (float)(v416.f32[0] * -4096.0))))))
                       - (float)(v334 - v333))
               + (float)(v333 - (float)(v334 - (float)(v334 - v333)));
          v336 = v334 - (float)(v433.f32[0] * v418.f32[0]);
          v337 = (float)(v334 - (float)(v336 - v330)) + (float)(v330 - (float)(v336 - (float)(v336 - v330)));
          v338 = v337 - (float)(v416.f32[0] * v431.f32[0]);
          v478 = v335;
          v479 = (float)((float)-(float)(v416.f32[0] * v431.f32[0]) - (float)(v338 - v337))
               + (float)(v337 - (float)(v338 - (float)(v338 - v337)));
          v480 = (float)(v338 - (float)((float)(v336 + v338) - v336))
               + (float)(v336 - (float)((float)(v336 + v338) - (float)((float)(v336 + v338) - v336)));
          v481 = v336 + v338;
          v339 = 4;
          v340 = sub_1DEE659F0(4, &v482, 4, &v478, v439);
          v394 = v118;
          v341 = -(float)((float)((float)((float)((float)(v396 * v118) - (float)(v321 * v324)) - (float)(v322 * v324))
                                - (float)(v321 * (float)(v118 - v324)))
                        - (float)(v322 * (float)(v118 - v324)));
          v342 = vmul_f32(v416, v418).f32[0];
          v343 = (float)(v416.f32[0] * 4096.0) - (float)((float)(v416.f32[0] * 4096.0) - v416.f32[0]);
          v344 = v416.f32[0] - v343;
          v345 = (float)((float)(v342 - (float)(v331 * v343)) - (float)((float)(v418.f32[0] - v331) * v343))
               - (float)(v331 * (float)(v416.f32[0] - v343));
          _S12 = v25.f32[1];
          v346 = -(float)(v345 - (float)(v332 * v344));
          v347 = v341 - v346;
          v348 = (float)((float)(v341 - (float)(v341 - v346)) - v346)
               + (float)(v341 - (float)((float)(v341 - v346) + (float)(v341 - (float)(v341 - v346))));
          v349 = (float)(v396 * v118) + v347;
          v350 = (float)(v347 - (float)(v349 - (float)(v396 * v118)))
               + (float)((float)(v396 * v118) - (float)(v349 - (float)(v349 - (float)(v396 * v118))));
          v351 = v350 - v342;
          v436[0] = v348;
          v436[1] = (float)((float)(v350 - (float)(v350 - v342)) - v342)
                  + (float)(v350 - (float)((float)(v350 - v342) + (float)(v350 - (float)(v350 - v342))));
          v352 = v349 + (float)(v350 - v342);
          v436[2] = (float)(v351 - (float)(v352 - v349)) + (float)(v349 - (float)(v352 - (float)(v352 - v349)));
          v436[3] = v352;
          v150 = v185;
          v195 = v426.f32[0];
LABEL_116:
          if (v195 != 0.0)
          {
            v353 = sub_1DEE65BF8(v177, v453, v476, v195);
            v354 = sub_1DEE65BF8(v340, v439, v447, v426.f32[0]);
            v355 = sub_1DEE65BF8(v354, v447, v473, v432.f32[0] + v432.f32[0]);
            v356 = sub_1DEE659F0(v353, v476, v355, v473, v471);
            v357 = sub_1DEE659F0(v82, v194, v356, v471, v150);
            if (v416.f32[0] == 0.0)
            {
              v360 = v150;
              v150 = v194;
            }
            else
            {
              v358 = sub_1DEE65BF8(4, v487, v477, v426.f32[0]);
              v359 = sub_1DEE65BF8(v358, v477, v476, v416.f32[0]);
              v357 = sub_1DEE659F0(v357, v150, v359, v476, v194);
              v360 = v194;
            }
            if (v394 == 0.0)
            {
              v365 = v360;
              v360 = v150;
              v150 = v365;
              v364 = v426.f32[0];
            }
            else
            {
              v361 = sub_1DEE65BF8(4, v488, v477, -v426.f32[0]);
              v362 = sub_1DEE65BF8(v361, v477, v476, v394);
              v363 = sub_1DEE659F0(v357, v360, v362, v476, v150);
              v364 = v426.f32[0];
              v357 = v363;
              v365 = v150;
            }
            v366 = sub_1DEE65BF8(v354, v447, v473, v364);
            v367 = sub_1DEE65BF8(v339, v436, v441, v426.f32[0]);
            v368 = sub_1DEE65BF8(v367, v441, v476, v432.f32[0] + v432.f32[0]);
            v369 = sub_1DEE65BF8(v367, v441, v475, v426.f32[0]);
            v370 = sub_1DEE659F0(v368, v476, v369, v475, v472);
            v371 = sub_1DEE659F0(v366, v473, v370, v472, v470);
            v82 = sub_1DEE659F0(v357, v365, v371, v470, v360);
            v194 = v360;
          }
          if (v410 != 0.0)
          {
            v372 = sub_1DEE65BF8(v388, v452, v476, v410);
            v373 = sub_1DEE65BF8(v340, v439, v446, v410);
            v374 = sub_1DEE65BF8(v373, v446, v473, _S12 + _S12);
            v375 = sub_1DEE659F0(v372, v476, v374, v473, v471);
            v376 = sub_1DEE659F0(v82, v194, v375, v471, v150);
            v377 = sub_1DEE65BF8(v373, v446, v473, v410);
            v378 = sub_1DEE65BF8(v339, v436, v440, v410);
            v379 = sub_1DEE65BF8(v378, v440, v476, _S12 + _S12);
            v380 = sub_1DEE65BF8(v378, v440, v475, v410);
            v381 = sub_1DEE659F0(v379, v476, v380, v475, v472);
            v382 = sub_1DEE659F0(v377, v473, v381, v472, v470);
            v82 = sub_1DEE659F0(v376, v150, v382, v470, v194);
          }
          goto LABEL_126;
        }
      }
    }
  }
LABEL_127:
  __asm { FCVT            H0, S0 }
  return result;
}

__int16 _simd_insphere_ph3@<H0>(uint64_t a1@<X0>)
{
  float32x4_t v1;
  float16x4_t v2;
  float32x4_t v3;
  float16x4_t v4;
  float32x4_t v5;
  float16x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float16x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  int8x16_t v15;
  float32x4_t v16;
  float32x4_t v17;
  int8x16_t v18;
  float32x4_t v19;
  float32x4_t v20;
  int8x16_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  int8x16_t v34;
  int32x2_t v35;
  int8x16_t v37;
  float v38;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float32x4_t v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float32x4_t v75;
  float32x4_t v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;
  float v93;
  float v94;
  float v95;
  float v96;
  float v97;
  float v98;
  float v99;
  float v100;
  float v101;
  float v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  int v117;
  int v118;
  int v119;
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;
  int v126;
  int v127;
  int v128;
  int v129;
  int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  float v143;
  float v144;
  int v145;
  int v146;
  int v147;
  int v148;
  int v149;
  int v150;
  int v151;
  int v152;
  int v153;
  int v154;
  int v155;
  int v156;
  int v157;
  int v158;
  int v159;
  uint64_t v160;
  float *v161;
  float v162;
  float v163;
  float32x4_t v165;
  float v166;
  float v167;
  float v168;
  float32x4_t v169;
  float v170;
  float v171;
  float v172;
  float32x4_t v173;
  float v174;
  float v175;
  float v176;
  float32x4_t v177;
  float v178;
  float v179;
  float v180;
  float v181;
  float v182;
  float v183;
  float v184;
  float v185;
  float v186;
  float v187;
  float v188;
  float v190;
  float v191;
  float v192;
  float v193;
  float v194;
  float v195;
  float v196;
  float v197;
  float v198;
  float v199;
  float v200;
  float v201;
  float v202;
  float v203;
  float v204;
  float v205;
  float v206;
  float v207;
  float v208;
  float v209;
  float v210;
  float v211;
  float v212;
  float v213;
  float v214;
  float v215;
  float v216;
  float v217;
  float v218;
  float v219;
  float v220;
  float v221;
  float v222;
  float v223;
  float v224;
  float v225;
  float v226;
  float v227;
  float v228;
  float v229;
  float v230;
  float v231;
  float v232;
  float v233;
  float v234;
  float v235;
  float v236;
  float v237;
  float v238;
  float v239;
  float v240;
  float v241;
  float v242;
  float v243;
  float v244;
  float v245;
  float v246;
  float v247;
  float v248;
  float v249;
  float v250;
  float v251;
  float v252;
  float v253;
  float v254;
  float v255;
  float v256;
  float v257;
  float v258;
  float v259;
  float v260;
  float v261;
  float v262;
  float v263;
  float v264;
  float v265;
  float v266;
  float v267;
  float v268;
  float v269;
  float v270;
  float v271;
  float v272;
  float v273;
  float v274;
  float v275;
  float v276;
  float v277;
  float v278;
  float v279;
  int v280;
  int v281;
  int v282;
  int v283;
  int v284;
  int v285;
  int v286;
  int v287;
  int v288;
  int v289;
  int v290;
  int v291;
  int v292;
  int v293;
  int v294;
  int v295;
  int v296;
  int v297;
  int v298;
  int v299;
  int v300;
  int v301;
  int v302;
  int v303;
  int v304;
  int v305;
  int v306;
  int v307;
  int v308;
  int v309;
  int v310;
  int v311;
  int v312;
  int v313;
  int v314;
  int v315;
  int v316;
  int v317;
  int v318;
  int v319;
  int v320;
  int v321;
  int v322;
  int v323;
  int v324;
  int v325;
  int v326;
  int v327;
  int v328;
  int v329;
  uint64_t v330;
  float *v331;
  int v332;
  int v333;
  int v334;
  int v335;
  int v336;
  int v337;
  int v338;
  int v339;
  int v340;
  int v341;
  int v342;
  uint64_t v343;
  float *v344;
  int v345;
  int v346;
  int v347;
  int v348;
  int v349;
  int v350;
  int v351;
  int v352;
  int v353;
  int v354;
  int v355;
  uint64_t v356;
  float *v357;
  int v358;
  int v359;
  int v360;
  int v361;
  int v362;
  int v363;
  int v364;
  int v365;
  int v366;
  int v367;
  int v368;
  uint64_t v369;
  float *v370;
  int v371;
  int v372;
  int v373;
  int v374;
  int v375;
  int v376;
  int v377;
  int v378;
  int v379;
  int v380;
  int v381;
  uint64_t v382;
  float *v383;
  int v384;
  int v385;
  int v386;
  int v387;
  int v388;
  int v389;
  int v390;
  int v391;
  int v392;
  int v393;
  int v394;
  int v395;
  __int16 result;
  float v400;
  float v401;
  float v402;
  float v403;
  float v404;
  float v405;
  float v406;
  float v407;
  float v408;
  float v409;
  float v410;
  float v411;
  float v412;
  float v413;
  float v414;
  float v415;
  float v416;
  float v417;
  float v418;
  float v419;
  float32x4_t v420;
  float v421;
  float v422;
  float32x4_t v423;
  float32x4_t v424;
  float32x4_t v425;
  float32x4_t v426;
  float32x4_t v427;
  float32x4_t v428;
  int v429;
  float32x4_t v430;
  int v431;
  float32x4_t v432;
  float v433;
  int v434;
  float v435;
  int v436;
  float v437[576];
  float v438[576];
  float v439[288];
  float v440[288];
  float v441[288];
  float v442[288];
  float v443[192];
  float v444[96];
  float v445[96];
  float v446[96];
  float v447[48];
  float v448[24];
  float v449[16];
  float v450[8];
  float v451[8];
  float v452[8];
  float v453[4];
  float v454[4];
  float v455[4];
  float v456[4];
  float v457[4];
  float v458[4];
  float v459[5760];
  float v460[3456];
  float v461[2304];
  float v462[2304];
  float v463[1152];
  float v464[1152];
  float v465[1152];
  float v466[1152];
  float v467[1152];
  float v468[768];
  float v469[384];
  float v470[384];
  float v471[384];
  float v472[192];
  float v473[96];
  float v474[96];
  float v475[96];
  float v476[96];
  float v477[96];
  float v478[48];
  float v479[48];
  float v480[24];
  float v481[24];
  float v482[24];
  float v483[24];
  float v484[24];
  float v485[24];
  float v486[24];
  float v487[24];
  float v488[24];
  float v489[24];
  float v490[16];
  float v491[8];
  float v492[8];
  float v493[4];
  float v494[4];
  float v495[4];
  float v496[4];
  float v497[4];
  float v498[4];
  float v499[4];
  float v500[4];
  float v501[4];
  float v502[6];

  v1 = vcvtq_f32_f16(COERCE_FLOAT16X4_T(MEMORY[0x1E0C86820](a1)));
  v3 = vcvtq_f32_f16(v2);
  v5 = vcvtq_f32_f16(v4);
  v7 = vcvtq_f32_f16(v6);
  v8 = vsubq_f32(v3, v1);
  v9 = vmulq_f32(v8, v8);
  v10 = v8;
  v10.i32[3] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v9, 2), vaddq_f32(v9, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v9.f32, 1))).u32[0];
  v12 = vcvtq_f32_f16(v11);
  v13 = vsubq_f32(v5, v1);
  v14 = vmulq_f32(v13, v13);
  v15 = (int8x16_t)v13;
  v15.i32[3] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 2), vaddq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 1))).u32[0];
  v16 = vsubq_f32(v7, v1);
  v17 = vmulq_f32(v16, v16);
  v18 = (int8x16_t)v16;
  v18.i32[3] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2), vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).u32[0];
  v19 = vsubq_f32(v12, v1);
  v20 = vmulq_f32(v19, v19);
  v21 = (int8x16_t)v19;
  v21.i32[3] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v20, 2), vaddq_f32(v20, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 1))).u32[0];
  v22 = (float32x4_t)vextq_s8(v15, v15, 4uLL);
  v23 = (float32x4_t)vextq_s8(v15, v15, 8uLL);
  v24 = (float32x4_t)vextq_s8(v15, v15, 0xCuLL);
  v25 = (float32x4_t)vextq_s8(v18, v18, 4uLL);
  v26 = (float32x4_t)vextq_s8(v18, v18, 8uLL);
  v27 = (float32x4_t)vextq_s8(v18, v18, 0xCuLL);
  v28 = (float32x4_t)vextq_s8(v21, v21, 4uLL);
  v29 = (float32x4_t)vextq_s8(v21, v21, 8uLL);
  v30 = (float32x4_t)vextq_s8(v21, v21, 0xCuLL);
  v31 = vmulq_f32(v27, v29);
  v32 = vmulq_f32(v25, v30);
  v33 = vmulq_f32(v26, v28);
  v34 = (int8x16_t)vmulq_f32(v10, vmlaq_f32(vmlaq_f32(vmulq_f32(v23, vmlaq_f32(vnegq_f32(v32), v28, v27)), vmlaq_f32(vnegq_f32(v31), v30, v26), v22), vmlaq_f32(vnegq_f32(v33), v29, v25), v24));
  v35 = (int32x2_t)vextq_s8(v34, v34, 8uLL).u64[0];
  _S0 = vaddv_f32(vsub_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v34.i8, v35), (float32x2_t)vzip2_s32(*(int32x2_t *)v34.i8, v35)));
  v37 = (int8x16_t)vmulq_f32(vmlaq_f32(vmlaq_f32(vmulq_f32(vaddq_f32(vabsq_f32(vmulq_f32(v27, v28)), vabsq_f32(v32)), vabsq_f32(v23)), vaddq_f32(vabsq_f32(vmulq_f32(v26, v30)), vabsq_f32(v31)), vabsq_f32(v22)), vaddq_f32(vabsq_f32(vmulq_f32(v25, v29)), vabsq_f32(v33)), vabsq_f32(v24)), vabsq_f32(v10));
  v38 = vaddv_f32(vadd_f32(*(float32x2_t *)v37.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v37, v37, 8uLL)));
  if (_S0 <= (float)(v38 * 0.0078659) && (float)(v38 * 0.0078659) >= (float)-_S0)
  {
    v418 = v38;
    v409 = v3.f32[1];
    v413 = v1.f32[1];
    v414 = v5.f32[1];
    v410 = v7.f32[1];
    v412 = v12.f32[1];
    v417 = v12.f32[1] - v1.f32[1];
    v40 = (float)(v5.f32[1] - v1.f32[1]) * v8.f32[0];
    v424 = v12;
    v41 = (float)(4096.0 * v8.f32[0]) - (float)((float)(4096.0 * v8.f32[0]) - v8.f32[0]);
    v42 = v8.f32[0] - v41;
    v43 = (float)((float)(v5.f32[1] - v1.f32[1]) * 4096.0)
        - (float)((float)((float)(v5.f32[1] - v1.f32[1]) * 4096.0) - (float)(v5.f32[1] - v1.f32[1]));
    v44 = (float)(v5.f32[1] - v1.f32[1]) - v43;
    v421 = v5.f32[1] - v1.f32[1];
    v422 = v3.f32[1] - v1.f32[1];
    v45 = -(float)((float)((float)((float)(v40 - (float)(v41 * v43)) - (float)((float)(v8.f32[0] - v41) * v43))
                         - (float)(v41 * v44))
                 - (float)((float)(v8.f32[0] - v41) * v44));
    v46 = (float)(v3.f32[1] - v1.f32[1]) * v13.f32[0];
    v47 = (float)(4096.0 * v13.f32[0]) - (float)((float)(4096.0 * v13.f32[0]) - v13.f32[0]);
    v48 = v13.f32[0] - v47;
    v49 = (float)((float)(v3.f32[1] - v1.f32[1]) * 4096.0)
        - (float)((float)((float)(v3.f32[1] - v1.f32[1]) * 4096.0) - (float)(v3.f32[1] - v1.f32[1]));
    v50 = (float)(v3.f32[1] - v1.f32[1]) - v49;
    v51 = -(float)((float)((float)((float)(v46 - (float)(v47 * v49)) - (float)((float)(v13.f32[0] - v47) * v49))
                         - (float)(v47 * v50))
                 - (float)((float)(v13.f32[0] - v47) * v50));
    v52 = v45 - v51;
    v53 = (float)((float)(v45 - (float)(v45 - v51)) - v51)
        + (float)(v45 - (float)((float)(v45 - v51) + (float)(v45 - (float)(v45 - v51))));
    v54 = v40 + v52;
    v55 = (float)(v52 - (float)((float)(v40 + v52) - v40))
        + (float)(v40 - (float)((float)(v40 + v52) - (float)((float)(v40 + v52) - v40)));
    v458[0] = v53;
    v458[1] = (float)((float)(v55 - (float)(v55 - v46)) - v46)
            + (float)(v55 - (float)((float)(v55 - v46) + (float)(v55 - (float)(v55 - v46))));
    v56 = v54 + (float)(v55 - v46);
    v415 = (float)((float)(v55 - v46) - (float)(v56 - v54)) + (float)(v54 - (float)(v56 - (float)(v56 - v54)));
    v57 = (float)(v7.f32[1] - v1.f32[1]) * v13.f32[0];
    v58 = (float)((float)(v7.f32[1] - v1.f32[1]) * 4096.0)
        - (float)((float)((float)(v7.f32[1] - v1.f32[1]) * 4096.0) - (float)(v7.f32[1] - v1.f32[1]));
    v59 = (float)(v7.f32[1] - v1.f32[1]) - v58;
    v60 = -(float)((float)((float)((float)(v57 - (float)(v47 * v58)) - (float)((float)(v13.f32[0] - v47) * v58))
                         - (float)(v47 * v59))
                 - (float)((float)(v13.f32[0] - v47) * v59));
    v61 = (float)(v5.f32[1] - v1.f32[1]) * v16.f32[0];
    v62 = (float)(4096.0 * v16.f32[0]) - (float)((float)(4096.0 * v16.f32[0]) - v16.f32[0]);
    v432 = v13;
    v63 = -(float)((float)((float)((float)(v61 - (float)(v62 * v43)) - (float)((float)(v16.f32[0] - v62) * v43))
                         - (float)(v62 * v44))
                 - (float)((float)(v16.f32[0] - v62) * v44));
    v425 = v3;
    v426 = v5;
    v64 = v19;
    v65 = v60 - v63;
    v423 = v7;
    v66 = (float)((float)(v60 - (float)(v60 - v63)) - v63)
        + (float)(v60 - (float)((float)(v60 - v63) + (float)(v60 - (float)(v60 - v63))));
    v67 = v57 + v65;
    v68 = (float)(v65 - (float)((float)(v57 + v65) - v57))
        + (float)(v57 - (float)((float)(v57 + v65) - (float)((float)(v57 + v65) - v57)));
    v457[0] = v66;
    v457[1] = (float)((float)(v68 - (float)(v68 - v61)) - v61)
            + (float)(v68 - (float)((float)(v68 - v61) + (float)(v68 - (float)(v68 - v61))));
    v69 = v67 + (float)(v68 - v61);
    v457[2] = (float)((float)(v68 - v61) - (float)(v69 - v67)) + (float)(v67 - (float)(v69 - (float)(v69 - v67)));
    v70 = (float)(v12.f32[1] - v1.f32[1]) * v16.f32[0];
    v71 = (float)((float)(v12.f32[1] - v1.f32[1]) * 4096.0)
        - (float)((float)((float)(v12.f32[1] - v1.f32[1]) * 4096.0) - (float)(v12.f32[1] - v1.f32[1]));
    v72 = (float)(v12.f32[1] - v1.f32[1]) - v71;
    v7.f32[0] = -(float)((float)((float)((float)(v70 - (float)(v62 * v71)) - (float)((float)(v16.f32[0] - v62) * v71))
                               - (float)(v62 * v72))
                       - (float)((float)(v16.f32[0] - v62) * v72));
    v5.f32[0] = (float)(v7.f32[1] - v1.f32[1]) * v64.f32[0];
    v73 = (float)(4096.0 * v64.f32[0]) - (float)((float)(4096.0 * v64.f32[0]) - v64.f32[0]);
    v74 = v64.f32[0] - v73;
    v75 = v64;
    v12.f32[0] = -(float)((float)((float)((float)(v5.f32[0] - (float)(v73 * v58))
                                        - (float)((float)(v64.f32[0] - v73) * v58))
                                - (float)(v73 * v59))
                        - (float)((float)(v64.f32[0] - v73) * v59));
    v76 = v8;
    v77 = v7.f32[0] - v12.f32[0];
    v428 = v16;
    v7.f32[0] = (float)((float)(v7.f32[0] - (float)(v7.f32[0] - v12.f32[0])) - v12.f32[0])
              + (float)(v7.f32[0]
                      - (float)((float)(v7.f32[0] - v12.f32[0]) + (float)(v7.f32[0] - (float)(v7.f32[0] - v12.f32[0]))));
    v12.f32[0] = v70 + v77;
    v78 = (float)(v77 - (float)((float)(v70 + v77) - v70))
        + (float)(v70 - (float)((float)(v70 + v77) - (float)((float)(v70 + v77) - v70)));
    v456[0] = v7.f32[0];
    v456[1] = (float)((float)(v78 - (float)(v78 - v5.f32[0])) - v5.f32[0])
            + (float)(v78 - (float)((float)(v78 - v5.f32[0]) + (float)(v78 - (float)(v78 - v5.f32[0]))));
    v64.f32[0] = v12.f32[0] + (float)(v78 - v5.f32[0]);
    v456[2] = (float)((float)(v78 - v5.f32[0]) - (float)(v64.f32[0] - v12.f32[0]))
            + (float)(v12.f32[0] - (float)(v64.f32[0] - (float)(v64.f32[0] - v12.f32[0])));
    v427 = v75;
    v7.f32[0] = -(float)((float)((float)((float)((float)(v422 * v75.f32[0]) - (float)(v73 * v49)) - (float)(v74 * v49))
                               - (float)(v73 * v50))
                       - (float)(v74 * v50));
    v430 = v76;
    v5.f32[0] = (float)(v12.f32[1] - v1.f32[1]) * v76.f32[0];
    v12.f32[0] = -(float)((float)((float)((float)(v5.f32[0] - (float)(v41 * v71)) - (float)(v42 * v71))
                                - (float)(v41 * v72))
                        - (float)(v42 * v72));
    v79 = v7.f32[0] - v12.f32[0];
    v7.f32[0] = (float)((float)(v7.f32[0] - (float)(v7.f32[0] - v12.f32[0])) - v12.f32[0])
              + (float)(v7.f32[0]
                      - (float)((float)(v7.f32[0] - v12.f32[0]) + (float)(v7.f32[0] - (float)(v7.f32[0] - v12.f32[0]))));
    v12.f32[0] = (float)(v422 * v75.f32[0]) + v79;
    v80 = (float)(v79 - (float)(v12.f32[0] - (float)(v422 * v75.f32[0])))
        + (float)((float)(v422 * v75.f32[0]) - (float)(v12.f32[0] - (float)(v12.f32[0] - (float)(v422 * v75.f32[0]))));
    v81 = v80 - v5.f32[0];
    v455[0] = v7.f32[0];
    v455[1] = (float)((float)(v80 - (float)(v80 - v5.f32[0])) - v5.f32[0])
            + (float)(v80 - (float)((float)(v80 - v5.f32[0]) + (float)(v80 - (float)(v80 - v5.f32[0]))));
    v455[2] = (float)(v81 - (float)((float)(v12.f32[0] + v81) - v12.f32[0]))
            + (float)(v12.f32[0] - (float)((float)(v12.f32[0] + v81) - (float)((float)(v12.f32[0] + v81) - v12.f32[0])));
    v82 = (float)(v7.f32[1] - v1.f32[1]) * v76.f32[0];
    v83 = -(float)((float)((float)((float)(v82 - (float)(v41 * v58)) - (float)(v42 * v58)) - (float)(v41 * v59))
                 - (float)(v42 * v59));
    v84 = -(float)((float)((float)((float)((float)(v422 * v16.f32[0]) - (float)(v62 * v49))
                                 - (float)((float)(v16.f32[0] - v62) * v49))
                         - (float)(v62 * v50))
                 - (float)((float)(v16.f32[0] - v62) * v50));
    v85 = v83 - v84;
    v86 = (float)((float)(v83 - (float)(v83 - v84)) - v84)
        + (float)(v83 - (float)((float)(v83 - v84) + (float)(v83 - (float)(v83 - v84))));
    v87 = v82 + v85;
    v88 = (float)(v85 - (float)((float)(v82 + v85) - v82))
        + (float)(v82 - (float)((float)(v82 + v85) - (float)((float)(v82 + v85) - v82)));
    v89 = v88 - (float)(v422 * v16.f32[0]);
    v454[0] = v86;
    v454[1] = (float)((float)(v88 - v89) - (float)(v422 * v16.f32[0]))
            + (float)(v88 - (float)(v89 + (float)(v88 - v89)));
    v90 = (float)(v12.f32[1] - v1.f32[1]) * v432.f32[0];
    v91 = -(float)((float)((float)((float)(v90 - (float)(v47 * v71)) - (float)(v48 * v71)) - (float)(v47 * v72))
                 - (float)(v48 * v72));
    v420 = v1;
    v76.f32[0] = -(float)((float)((float)((float)((float)((float)(v5.f32[1] - v1.f32[1]) * v75.f32[0])
                                                - (float)(v73 * v43))
                                        - (float)(v74 * v43))
                                - (float)(v73 * v44))
                        - (float)(v74 * v44));
    v92 = v91 - v76.f32[0];
    v76.f32[0] = (float)((float)(v91 - (float)(v91 - v76.f32[0])) - v76.f32[0])
               + (float)(v91 - (float)((float)(v91 - v76.f32[0]) + (float)(v91 - (float)(v91 - v76.f32[0]))));
    v93 = v90 + v92;
    v94 = (float)(v92 - (float)((float)(v90 + v92) - v90))
        + (float)(v90 - (float)((float)(v90 + v92) - (float)((float)(v90 + v92) - v90)));
    v95 = v94 - (float)((float)(v5.f32[1] - v1.f32[1]) * v75.f32[0]);
    v96 = (float)(v94 - v95) - (float)((float)(v5.f32[1] - v1.f32[1]) * v75.f32[0]);
    v97 = v425.f32[2] - v1.f32[2];
    v453[0] = v76.f32[0];
    v453[1] = v96 + (float)(v94 - (float)(v95 + (float)(v94 - v95)));
    v98 = v426.f32[2] - v1.f32[2];
    v453[2] = (float)(v95 - (float)((float)(v93 + v95) - v93))
            + (float)(v93 - (float)((float)(v93 + v95) - (float)((float)(v93 + v95) - v93)));
    v99 = v423.f32[2] - v1.f32[2];
    v458[2] = v415;
    v458[3] = v56;
    v407 = v69;
    v408 = v56;
    v100 = v5.f32[1] - v1.f32[1];
    v101 = v7.f32[1] - v1.f32[1];
    v457[3] = v69;
    v405 = v93 + v95;
    v406 = v64.f32[0];
    v456[3] = v64.f32[0];
    v403 = v87 + v89;
    v404 = v12.f32[0] + v81;
    v455[3] = v12.f32[0] + v81;
    v454[2] = (float)(v89 - (float)((float)(v87 + v89) - v87))
            + (float)(v87 - (float)((float)(v87 + v89) - (float)((float)(v87 + v89) - v87)));
    v411 = v1.f32[2];
    v102 = v424.f32[2] - v1.f32[2];
    v454[3] = v87 + v89;
    v453[3] = v93 + v95;
    v103 = sub_1DEE65BF8(4, v456, v452, v426.f32[2] - v1.f32[2]);
    v104 = sub_1DEE65BF8(4, v453, v451, -v99);
    v105 = sub_1DEE65BF8(4, v457, v450, v102);
    v106 = sub_1DEE659F0(v103, v452, v104, v451, v449);
    v107 = sub_1DEE659F0(v105, v450, v106, v449, v448);
    v108 = sub_1DEE65BF8(v107, v448, v447, v430.f32[0]);
    v109 = sub_1DEE65BF8(v108, v447, v446, -v430.f32[0]);
    v110 = sub_1DEE65BF8(v107, v448, v447, v422);
    v111 = sub_1DEE65BF8(v110, v447, v445, -v422);
    v112 = sub_1DEE65BF8(v107, v448, v447, v97);
    v113 = sub_1DEE65BF8(v112, v447, v444, -v97);
    v114 = sub_1DEE659F0(v109, v446, v111, v445, v443);
    v115 = sub_1DEE659F0(v114, v443, v113, v444, v442);
    v116 = sub_1DEE65BF8(4, v455, v452, v99);
    v117 = sub_1DEE65BF8(4, v454, v451, v102);
    v118 = sub_1DEE65BF8(4, v456, v450, v97);
    v119 = sub_1DEE659F0(v116, v452, v117, v451, v449);
    v120 = sub_1DEE659F0(v118, v450, v119, v449, v448);
    v121 = sub_1DEE65BF8(v120, v448, v447, v432.f32[0]);
    v122 = sub_1DEE65BF8(v121, v447, v446, v432.f32[0]);
    v123 = sub_1DEE65BF8(v120, v448, v447, v100);
    v124 = sub_1DEE65BF8(v123, v447, v445, v100);
    v125 = sub_1DEE65BF8(v120, v448, v447, v98);
    v126 = sub_1DEE65BF8(v125, v447, v444, v98);
    v127 = sub_1DEE659F0(v122, v446, v124, v445, v443);
    v128 = sub_1DEE659F0(v127, v443, v126, v444, v441);
    v129 = sub_1DEE65BF8(4, v458, v452, v102);
    v130 = sub_1DEE65BF8(4, v453, v451, v97);
    v131 = sub_1DEE65BF8(4, v455, v450, v98);
    v132 = sub_1DEE659F0(v129, v452, v130, v451, v449);
    v133 = sub_1DEE659F0(v131, v450, v132, v449, v448);
    v134 = sub_1DEE65BF8(v133, v448, v447, v428.f32[0]);
    v135 = sub_1DEE65BF8(v134, v447, v446, -v428.f32[0]);
    v136 = sub_1DEE65BF8(v133, v448, v447, v101);
    v137 = sub_1DEE65BF8(v136, v447, v445, -v101);
    v138 = sub_1DEE65BF8(v133, v448, v447, v99);
    v402 = -v99;
    v139 = sub_1DEE65BF8(v138, v447, v444, -v99);
    v140 = sub_1DEE659F0(v135, v446, v137, v445, v443);
    v141 = sub_1DEE659F0(v140, v443, v139, v444, v440);
    v142 = sub_1DEE65BF8(4, v457, v452, v97);
    v416 = v98;
    v143 = -v98;
    v144 = v99;
    v145 = sub_1DEE65BF8(4, v454, v451, v143);
    v146 = sub_1DEE65BF8(4, v458, v450, v99);
    v147 = sub_1DEE659F0(v142, v452, v145, v451, v449);
    v148 = sub_1DEE659F0(v146, v450, v147, v449, v448);
    v149 = sub_1DEE65BF8(v148, v448, v447, v427.f32[0]);
    v150 = sub_1DEE65BF8(v149, v447, v446, v427.f32[0]);
    v151 = sub_1DEE65BF8(v148, v448, v447, v417);
    v152 = sub_1DEE65BF8(v151, v447, v445, v417);
    v153 = sub_1DEE65BF8(v148, v448, v447, v102);
    v154 = sub_1DEE65BF8(v153, v447, v444, v102);
    v155 = sub_1DEE659F0(v150, v446, v152, v445, v443);
    v156 = sub_1DEE659F0(v155, v443, v154, v444, v439);
    v157 = sub_1DEE659F0(v115, v442, v128, v441, v438);
    v158 = sub_1DEE659F0(v141, v440, v156, v439, v437);
    v159 = sub_1DEE659F0(v157, v438, v158, v437, &v435);
    _S0 = v435;
    if (v159 < 2)
    {
      v162 = v418;
    }
    else
    {
      v160 = v159 - 1;
      v161 = (float *)&v436;
      v162 = v418;
      do
      {
        v163 = *v161++;
        _S0 = _S0 + v163;
        --v160;
      }
      while (v160);
    }
    if (_S0 < (float)(v162 * 0.0024586) && (float)(v162 * 0.0024586) > (float)-_S0)
    {
      v165 = vsubq_f32(v425, v430);
      v166 = vaddq_f32(vsubq_f32(v165, v420), vsubq_f32(v425, vaddq_f32(v430, v165))).f32[0];
      v167 = (float)((float)(v409 - v422) - v413) + (float)(v409 - (float)(v422 + (float)(v409 - v422)));
      v168 = (float)((float)(v425.f32[2] - v97) - v411)
           + (float)(v425.f32[2] - (float)(v97 + (float)(v425.f32[2] - v97)));
      v169 = vsubq_f32(v426, v432);
      LODWORD(v170) = vaddq_f32(vsubq_f32(v169, v420), vsubq_f32(v426, vaddq_f32(v432, v169))).u32[0];
      v171 = (float)((float)(v414 - v421) - v413) + (float)(v414 - (float)(v421 + (float)(v414 - v421)));
      v172 = (float)((float)(v426.f32[2] - v416) - v411)
           + (float)(v426.f32[2] - (float)(v416 + (float)(v426.f32[2] - v416)));
      v173 = vsubq_f32(v423, v428);
      LODWORD(v174) = vaddq_f32(vsubq_f32(v173, v420), vsubq_f32(v423, vaddq_f32(v428, v173))).u32[0];
      v175 = (float)((float)(v410 - v101) - v413) + (float)(v410 - (float)(v101 + (float)(v410 - v101)));
      v176 = (float)((float)(v423.f32[2] - v144) - v411)
           + (float)(v423.f32[2] - (float)(v144 + (float)(v423.f32[2] - v144)));
      v177 = vsubq_f32(v424, v427);
      LODWORD(v178) = vaddq_f32(vsubq_f32(v177, v420), vsubq_f32(v424, vaddq_f32(v427, v177))).u32[0];
      v179 = (float)((float)(v412 - v417) - v413) + (float)(v412 - (float)(v417 + (float)(v412 - v417)));
      v180 = (float)((float)(v424.f32[2] - v102) - v411)
           + (float)(v424.f32[2] - (float)(v102 + (float)(v424.f32[2] - v102)));
      if (v166 != 0.0
        || v167 != 0.0
        || v168 != 0.0
        || v170 != 0.0
        || v171 != 0.0
        || v172 != 0.0
        || v174 != 0.0
        || v175 != 0.0
        || v176 != 0.0
        || v178 != 0.0
        || v179 != 0.0
        || v180 != 0.0)
      {
        v419 = (float)(fabsf(_S0) * 0.0014668) + (float)(v162 * 0.000017092);
        v181 = (float)((float)(v423.f32[2] - v144) - v411)
             + (float)(v423.f32[2] - (float)(v144 + (float)(v423.f32[2] - v144)));
        v400 = (float)((float)(v421 * v166) + (float)(v430.f32[0] * v171))
             - (float)((float)(v432.f32[0] * v167) + (float)(v422 * v170));
        v182 = (float)((float)(v101 * v170) + (float)(v432.f32[0] * v175))
             - (float)((float)(v428.f32[0] * v171) + (float)(v421 * v174));
        v183 = (float)((float)(v417 * v174) + (float)(v428.f32[0] * v179))
             - (float)((float)(v427.f32[0] * v175) + (float)(v101 * v178));
        v184 = (float)((float)(v101 * v166) + (float)(v430.f32[0] * v175))
             - (float)((float)(v428.f32[0] * v167) + (float)(v422 * v174));
        v185 = (float)((float)(v425.f32[2] - v97) - v411)
             + (float)(v425.f32[2] - (float)(v97 + (float)(v425.f32[2] - v97)));
        v401 = (float)((float)((float)((float)(v417 * v417) + (float)(v427.f32[0] * v427.f32[0])) + (float)(v102 * v102))
                     * (float)((float)((float)((float)(v184 * v143) + (float)(v97 * v182)) + (float)(v144 * v400))
                             + (float)((float)((float)(v185 * v407) - (float)(v172 * v403)) + (float)(v181 * v408))))
             + (float)((float)((float)((float)(v421 * v421) + (float)(v432.f32[0] * v432.f32[0])) + (float)(v416 * v416))
                     * (float)((float)((float)((float)(v102 * v184)
                                             + (float)(v144
                                                     * (float)((float)((float)(v422 * v178) + (float)(v427.f32[0] * v167))
                                                             - (float)((float)(v430.f32[0] * v179) + (float)(v417 * v166)))))
                                     + (float)(v97 * v183))
                             + (float)((float)((float)(v180 * v403) + (float)(v176 * v404)) + (float)(v168 * v406))));
        v186 = (float)((float)(v412 - v417) - v413) + (float)(v412 - (float)(v417 + (float)(v412 - v417)));
        v187 = (float)((float)(v417 * v170) + (float)(v432.f32[0] * v186))
             - (float)((float)(v427.f32[0] * v171) + (float)(v421 * v178));
        v188 = (float)((float)(v426.f32[2] - v416) - v411)
             + (float)(v426.f32[2] - (float)(v416 + (float)(v426.f32[2] - v416)));
        _S0 = (float)(v401
                    - (float)((float)((float)((float)((float)(v101 * v101) + (float)(v428.f32[0] * v428.f32[0]))
                                            + (float)(v144 * v144))
                                    * (float)((float)((float)((float)(v97 * v187) + (float)(v102 * v400))
                                                    + (float)(v416
                                                            * (float)((float)((float)(v422 * v178)
                                                                            + (float)(v427.f32[0] * v167))
                                                                    - (float)((float)(v430.f32[0] * v179)
                                                                            + (float)(v417 * v166)))))
                                            + (float)((float)((float)(v185 * v405) + (float)(v180 * v408))
                                                    + (float)(v188 * v404))))
                            + (float)((float)((float)((float)(v422 * v422) + (float)(v430.f32[0] * v430.f32[0]))
                                            + (float)(v97 * v97))
                                    * (float)((float)((float)((float)(v187 * v402) + (float)(v416 * v183))
                                                    + (float)(v102 * v182))
                                            + (float)((float)((float)(v188 * v406) - (float)(v181 * v405))
                                                    + (float)(v180 * v407))))))
            + (float)((float)((float)((float)((float)((float)(v417 * v186) + (float)(v427.f32[0] * v178))
                                            + (float)(v102 * v180))
                                    * (float)((float)((float)(v403 * v143) + (float)(v97 * v407)) + (float)(v144 * v408)))
                            + (float)((float)((float)((float)(v421
                                                            * (float)((float)((float)(v414 - v421) - v413)
                                                                    + (float)(v414 - (float)(v421 + (float)(v414 - v421)))))
                                                    + (float)(v432.f32[0] * v170))
                                            + (float)(v416 * v188))
                                    * (float)((float)((float)(v102 * v403) + (float)(v144 * v404)) + (float)(v97 * v406))))
                    - (float)((float)((float)((float)((float)(v101
                                                            * (float)((float)((float)(v410 - v101) - v413)
                                                                    + (float)(v410 - (float)(v101 + (float)(v410 - v101)))))
                                                    + (float)(v428.f32[0] * v174))
                                            + (float)(v144 * v181))
                                    * (float)((float)((float)(v97 * v405) + (float)(v102 * v408)) + (float)(v416 * v404)))
                            + (float)((float)((float)((float)(v422 * v167) + (float)(v430.f32[0] * v166))
                                            + (float)(v97 * v185))
                                    * (float)((float)((float)(v405 * v402) + (float)(v416 * v406)) + (float)(v102 * v407)))))
            * 2.0
            + _S0;
        if (v419 > _S0 && v419 > (float)-_S0)
        {
          v190 = (float)(v425.f32[0] * 4096.0) - (float)((float)(v425.f32[0] * 4096.0) - v425.f32[0]);
          v191 = v425.f32[0] - v190;
          v192 = (float)(v414 * 4096.0) - (float)((float)(v414 * 4096.0) - v414);
          v193 = -(float)((float)((float)((float)((float)(v425.f32[0] * v414) - (float)(v190 * v192))
                                        - (float)((float)(v425.f32[0] - v190) * v192))
                                - (float)(v190 * (float)(v414 - v192)))
                        - (float)((float)(v425.f32[0] - v190) * (float)(v414 - v192)));
          v194 = (float)(v426.f32[0] * 4096.0) - (float)((float)(v426.f32[0] * 4096.0) - v426.f32[0]);
          v195 = v426.f32[0] - v194;
          v196 = (float)(v409 * 4096.0) - (float)((float)(v409 * 4096.0) - v409);
          v197 = v409 - v196;
          v198 = -(float)((float)((float)((float)((float)(v409 * v426.f32[0]) - (float)(v194 * v196))
                                        - (float)((float)(v426.f32[0] - v194) * v196))
                                - (float)(v194 * (float)(v409 - v196)))
                        - (float)((float)(v426.f32[0] - v194) * (float)(v409 - v196)));
          v199 = v193 - v198;
          v200 = (float)((float)(v193 - (float)(v193 - v198)) - v198)
               + (float)(v193 - (float)((float)(v193 - v198) + (float)(v193 - (float)(v193 - v198))));
          v201 = (float)(v425.f32[0] * v414) + v199;
          v202 = (float)(v199 - (float)(v201 - (float)(v425.f32[0] * v414)))
               + (float)((float)(v425.f32[0] * v414) - (float)(v201 - (float)(v201 - (float)(v425.f32[0] * v414))));
          v203 = v202 - (float)(v409 * v426.f32[0]);
          v502[0] = v200;
          v502[1] = (float)((float)(v202 - v203) - (float)(v409 * v426.f32[0]))
                  + (float)(v202 - (float)(v203 + (float)(v202 - v203)));
          v502[2] = (float)(v203 - (float)((float)(v201 + v203) - v201))
                  + (float)(v201 - (float)((float)(v201 + v203) - (float)((float)(v201 + v203) - v201)));
          v502[3] = v201 + v203;
          v204 = (float)(v410 * 4096.0) - (float)((float)(v410 * 4096.0) - v410);
          v205 = v410 - v204;
          v206 = -(float)((float)((float)((float)((float)(v426.f32[0] * v410) - (float)(v194 * v204))
                                        - (float)((float)(v426.f32[0] - v194) * v204))
                                - (float)(v194 * (float)(v410 - v204)))
                        - (float)((float)(v426.f32[0] - v194) * (float)(v410 - v204)));
          v207 = (float)(v423.f32[0] * 4096.0) - (float)((float)(v423.f32[0] * 4096.0) - v423.f32[0]);
          v208 = v423.f32[0] - v207;
          v433 = v414 - v192;
          v209 = -(float)((float)((float)((float)((float)(v414 * v423.f32[0]) - (float)(v207 * v192))
                                        - (float)((float)(v423.f32[0] - v207) * v192))
                                - (float)(v207 * (float)(v414 - v192)))
                        - (float)((float)(v423.f32[0] - v207) * (float)(v414 - v192)));
          v210 = v206 - v209;
          v211 = (float)((float)(v206 - (float)(v206 - v209)) - v209)
               + (float)(v206 - (float)((float)(v206 - v209) + (float)(v206 - (float)(v206 - v209))));
          v212 = (float)(v426.f32[0] * v410) + v210;
          v213 = (float)(v210 - (float)(v212 - (float)(v426.f32[0] * v410)))
               + (float)((float)(v426.f32[0] * v410) - (float)(v212 - (float)(v212 - (float)(v426.f32[0] * v410))));
          v214 = v213 - (float)(v414 * v423.f32[0]);
          v501[0] = v211;
          v501[1] = (float)((float)(v213 - v214) - (float)(v414 * v423.f32[0]))
                  + (float)(v213 - (float)(v214 + (float)(v213 - v214)));
          v501[2] = (float)(v214 - (float)((float)(v212 + v214) - v212))
                  + (float)(v212 - (float)((float)(v212 + v214) - (float)((float)(v212 + v214) - v212)));
          v501[3] = v212 + v214;
          v215 = (float)(v412 * 4096.0) - (float)((float)(v412 * 4096.0) - v412);
          v216 = v412 - v215;
          v217 = -(float)((float)((float)((float)((float)(v423.f32[0] * v412) - (float)(v207 * v215))
                                        - (float)(v208 * v215))
                                - (float)(v207 * (float)(v412 - v215)))
                        - (float)(v208 * (float)(v412 - v215)));
          v218 = v424.f32[0];
          v219 = (float)(v424.f32[0] * 4096.0) - (float)((float)(v424.f32[0] * 4096.0) - v424.f32[0]);
          v220 = v424.f32[0] - v219;
          v221 = -(float)((float)((float)((float)((float)(v410 * v424.f32[0]) - (float)(v219 * v204))
                                        - (float)((float)(v424.f32[0] - v219) * v204))
                                - (float)(v219 * v205))
                        - (float)((float)(v424.f32[0] - v219) * v205));
          v222 = v217 - v221;
          v223 = (float)((float)(v217 - (float)(v217 - v221)) - v221)
               + (float)(v217 - (float)((float)(v217 - v221) + (float)(v217 - (float)(v217 - v221))));
          v224 = (float)(v423.f32[0] * v412) + v222;
          v225 = (float)(v222 - (float)(v224 - (float)(v423.f32[0] * v412)))
               + (float)((float)(v423.f32[0] * v412) - (float)(v224 - (float)(v224 - (float)(v423.f32[0] * v412))));
          v226 = v225 - (float)(v410 * v424.f32[0]);
          v500[0] = v223;
          v500[1] = (float)((float)(v225 - v226) - (float)(v410 * v424.f32[0]))
                  + (float)(v225 - (float)(v226 + (float)(v225 - v226)));
          v500[2] = (float)(v226 - (float)((float)(v224 + v226) - v224))
                  + (float)(v224 - (float)((float)(v224 + v226) - (float)((float)(v224 + v226) - v224)));
          v500[3] = v224 + v226;
          v227 = (float)(v413 * 4096.0) - (float)((float)(v413 * 4096.0) - v413);
          v228 = v413 - v227;
          v229 = -(float)((float)((float)((float)((float)(v413 * v424.f32[0]) - (float)(v219 * v227))
                                        - (float)(v220 * v227))
                                - (float)(v219 * (float)(v413 - v227)))
                        - (float)(v220 * (float)(v413 - v227)));
          v230 = (float)(v420.f32[0] * 4096.0) - (float)((float)(v420.f32[0] * 4096.0) - v420.f32[0]);
          v231 = v420.f32[0] - v230;
          v232 = -(float)((float)((float)((float)((float)(v420.f32[0] * v412) - (float)(v230 * v215))
                                        - (float)((float)(v420.f32[0] - v230) * v215))
                                - (float)(v230 * v216))
                        - (float)((float)(v420.f32[0] - v230) * v216));
          v233 = v229 - v232;
          v234 = (float)((float)(v229 - (float)(v229 - v232)) - v232)
               + (float)(v229 - (float)((float)(v229 - v232) + (float)(v229 - (float)(v229 - v232))));
          v235 = (float)(v413 * v424.f32[0]) + v233;
          v236 = (float)(v233 - (float)(v235 - (float)(v413 * v218)))
               + (float)((float)(v413 * v218) - (float)(v235 - (float)(v235 - (float)(v413 * v218))));
          v237 = v236 - (float)(v420.f32[0] * v412);
          v499[0] = v234;
          v499[1] = (float)((float)(v236 - v237) - (float)(v420.f32[0] * v412))
                  + (float)(v236 - (float)(v237 + (float)(v236 - v237)));
          v499[2] = (float)(v237 - (float)((float)(v235 + v237) - v235))
                  + (float)(v235 - (float)((float)(v235 + v237) - (float)((float)(v235 + v237) - v235)));
          v499[3] = v235 + v237;
          v238 = -(float)((float)((float)((float)((float)(v420.f32[0] * v409) - (float)(v230 * v196))
                                        - (float)(v231 * v196))
                                - (float)(v230 * v197))
                        - (float)(v231 * v197));
          v239 = -(float)((float)((float)((float)((float)(v413 * v425.f32[0]) - (float)(v190 * v227))
                                        - (float)(v191 * v227))
                                - (float)(v190 * v228))
                        - (float)(v191 * v228));
          v240 = v238 - v239;
          v241 = (float)((float)(v238 - (float)(v238 - v239)) - v239)
               + (float)(v238 - (float)((float)(v238 - v239) + (float)(v238 - (float)(v238 - v239))));
          v242 = (float)(v420.f32[0] * v409) + v240;
          v243 = (float)(v240 - (float)(v242 - (float)(v420.f32[0] * v409)))
               + (float)((float)(v420.f32[0] * v409) - (float)(v242 - (float)(v242 - (float)(v420.f32[0] * v409))));
          v244 = v243 - (float)(v413 * v425.f32[0]);
          v498[0] = v241;
          v498[1] = (float)((float)(v243 - v244) - (float)(v413 * v425.f32[0]))
                  + (float)(v243 - (float)(v244 + (float)(v243 - v244)));
          v498[2] = (float)(v244 - (float)((float)(v242 + v244) - v242))
                  + (float)(v242 - (float)((float)(v242 + v244) - (float)((float)(v242 + v244) - v242)));
          v498[3] = v242 + v244;
          v245 = -(float)((float)((float)((float)((float)(v425.f32[0] * v410) - (float)(v190 * v204))
                                        - (float)(v191 * v204))
                                - (float)(v190 * v205))
                        - (float)(v191 * v205));
          v246 = -(float)((float)((float)((float)((float)(v409 * v423.f32[0]) - (float)(v207 * v196))
                                        - (float)(v208 * v196))
                                - (float)(v207 * v197))
                        - (float)(v208 * v197));
          v247 = v245 - v246;
          v248 = (float)((float)(v245 - (float)(v245 - v246)) - v246)
               + (float)(v245 - (float)((float)(v245 - v246) + (float)(v245 - (float)(v245 - v246))));
          v249 = (float)(v425.f32[0] * v410) + v247;
          v250 = (float)(v247 - (float)(v249 - (float)(v425.f32[0] * v410)))
               + (float)((float)(v425.f32[0] * v410) - (float)(v249 - (float)(v249 - (float)(v425.f32[0] * v410))));
          v251 = v250 - (float)(v409 * v423.f32[0]);
          v497[0] = v248;
          v497[1] = (float)((float)(v250 - v251) - (float)(v409 * v423.f32[0]))
                  + (float)(v250 - (float)(v251 + (float)(v250 - v251)));
          v497[2] = (float)(v251 - (float)((float)(v249 + v251) - v249))
                  + (float)(v249 - (float)((float)(v249 + v251) - (float)((float)(v249 + v251) - v249)));
          v497[3] = v249 + v251;
          v252 = -(float)((float)((float)((float)((float)(v426.f32[0] * v412) - (float)(v194 * v215))
                                        - (float)(v195 * v215))
                                - (float)(v194 * v216))
                        - (float)(v195 * v216));
          v253 = -(float)((float)((float)((float)((float)(v414 * v424.f32[0]) - (float)(v219 * v192))
                                        - (float)(v220 * v192))
                                - (float)(v219 * v433))
                        - (float)(v220 * v433));
          v254 = v252 - v253;
          v255 = (float)((float)(v252 - (float)(v252 - v253)) - v253)
               + (float)(v252 - (float)((float)(v252 - v253) + (float)(v252 - (float)(v252 - v253))));
          v256 = (float)(v426.f32[0] * v412) + v254;
          v257 = (float)(v254 - (float)(v256 - (float)(v426.f32[0] * v412)))
               + (float)((float)(v426.f32[0] * v412) - (float)(v256 - (float)(v256 - (float)(v426.f32[0] * v412))));
          v258 = v257 - (float)(v414 * v424.f32[0]);
          v496[0] = v255;
          v496[1] = (float)((float)(v257 - v258) - (float)(v414 * v424.f32[0]))
                  + (float)(v257 - (float)(v258 + (float)(v257 - v258)));
          v496[2] = (float)(v258 - (float)((float)(v256 + v258) - v256))
                  + (float)(v256 - (float)((float)(v256 + v258) - (float)((float)(v256 + v258) - v256)));
          v496[3] = v256 + v258;
          v259 = -(float)((float)((float)((float)((float)(v413 * v423.f32[0]) - (float)(v207 * v227))
                                        - (float)(v208 * v227))
                                - (float)(v207 * v228))
                        - (float)(v208 * v228));
          v260 = -(float)((float)((float)((float)((float)(v420.f32[0] * v410) - (float)(v230 * v204))
                                        - (float)(v231 * v204))
                                - (float)(v230 * v205))
                        - (float)(v231 * v205));
          v261 = v259 - v260;
          v262 = (float)((float)(v259 - (float)(v259 - v260)) - v260)
               + (float)(v259 - (float)((float)(v259 - v260) + (float)(v259 - (float)(v259 - v260))));
          v263 = (float)(v413 * v423.f32[0]) + v261;
          v264 = (float)(v261 - (float)(v263 - (float)(v413 * v423.f32[0])))
               + (float)((float)(v413 * v423.f32[0]) - (float)(v263 - (float)(v263 - (float)(v413 * v423.f32[0]))));
          v265 = v264 - (float)(v420.f32[0] * v410);
          v495[0] = v262;
          v495[1] = (float)((float)(v264 - v265) - (float)(v420.f32[0] * v410))
                  + (float)(v264 - (float)(v265 + (float)(v264 - v265)));
          v495[2] = (float)(v265 - (float)((float)(v263 + v265) - v263))
                  + (float)(v263 - (float)((float)(v263 + v265) - (float)((float)(v263 + v265) - v263)));
          v495[3] = v263 + v265;
          v266 = -(float)((float)((float)((float)((float)(v409 * v424.f32[0]) - (float)(v219 * v196))
                                        - (float)(v220 * v196))
                                - (float)(v219 * v197))
                        - (float)(v220 * v197));
          v267 = -(float)((float)((float)((float)((float)(v425.f32[0] * v412) - (float)(v190 * v215))
                                        - (float)(v191 * v215))
                                - (float)(v190 * v216))
                        - (float)(v191 * v216));
          v268 = v266 - v267;
          v269 = (float)((float)(v266 - (float)(v266 - v267)) - v267)
               + (float)(v266 - (float)((float)(v266 - v267) + (float)(v266 - (float)(v266 - v267))));
          v270 = (float)(v409 * v424.f32[0]) + v268;
          v271 = (float)(v268 - (float)(v270 - (float)(v409 * v218)))
               + (float)((float)(v409 * v218) - (float)(v270 - (float)(v270 - (float)(v409 * v218))));
          v272 = v271 - (float)(v425.f32[0] * v412);
          v494[0] = v269;
          v494[1] = (float)((float)(v271 - v272) - (float)(v425.f32[0] * v412))
                  + (float)(v271 - (float)(v272 + (float)(v271 - v272)));
          v494[2] = (float)(v272 - (float)((float)(v270 + v272) - v270))
                  + (float)(v270 - (float)((float)(v270 + v272) - (float)((float)(v270 + v272) - v270)));
          v494[3] = v270 + v272;
          v273 = -(float)((float)((float)((float)((float)(v420.f32[0] * v414) - (float)(v230 * v192))
                                        - (float)(v231 * v192))
                                - (float)(v230 * v433))
                        - (float)(v231 * v433));
          v274 = -(float)((float)((float)((float)((float)(v413 * v426.f32[0]) - (float)(v194 * v227))
                                        - (float)(v195 * v227))
                                - (float)(v194 * v228))
                        - (float)(v195 * v228));
          v275 = v273 - v274;
          v276 = (float)((float)(v273 - (float)(v273 - v274)) - v274)
               + (float)(v273 - (float)((float)(v273 - v274) + (float)(v273 - (float)(v273 - v274))));
          v277 = (float)(v420.f32[0] * v414) + v275;
          v278 = (float)(v275 - (float)(v277 - (float)(v420.f32[0] * v414)))
               + (float)((float)(v420.f32[0] * v414) - (float)(v277 - (float)(v277 - (float)(v420.f32[0] * v414))));
          v279 = v278 - (float)(v413 * v426.f32[0]);
          v493[0] = v276;
          v493[1] = (float)((float)(v278 - v279) - (float)(v413 * v426.f32[0]))
                  + (float)(v278 - (float)(v279 + (float)(v278 - v279)));
          v493[2] = (float)(v279 - (float)((float)(v277 + v279) - v277))
                  + (float)(v277 - (float)((float)(v277 + v279) - (float)((float)(v277 + v279) - v277)));
          v493[3] = v277 + v279;
          v280 = sub_1DEE65BF8(4, v501, v492, v425.f32[2]);
          v281 = sub_1DEE65BF8(4, v497, v491, -v426.f32[2]);
          v282 = sub_1DEE659F0(v280, v492, v281, v491, v490);
          v283 = sub_1DEE65BF8(4, v502, v492, v423.f32[2]);
          v434 = sub_1DEE659F0(v283, v492, v282, v490, v489);
          v284 = sub_1DEE65BF8(4, v500, v492, v426.f32[2]);
          v285 = sub_1DEE65BF8(4, v496, v491, -v423.f32[2]);
          v286 = sub_1DEE659F0(v284, v492, v285, v491, v490);
          v287 = sub_1DEE65BF8(4, v501, v492, v424.f32[2]);
          v288 = sub_1DEE659F0(v287, v492, v286, v490, v488);
          v289 = sub_1DEE65BF8(4, v499, v492, v423.f32[2]);
          v290 = sub_1DEE65BF8(4, v495, v491, -v424.f32[2]);
          v291 = sub_1DEE659F0(v289, v492, v290, v491, v490);
          v292 = sub_1DEE65BF8(4, v500, v492, v411);
          v293 = sub_1DEE659F0(v292, v492, v291, v490, v487);
          v294 = sub_1DEE65BF8(4, v498, v492, v424.f32[2]);
          v295 = sub_1DEE65BF8(4, v494, v491, -v411);
          v296 = sub_1DEE659F0(v294, v492, v295, v491, v490);
          v297 = sub_1DEE65BF8(4, v499, v492, v425.f32[2]);
          v298 = sub_1DEE659F0(v297, v492, v296, v490, v486);
          v299 = sub_1DEE65BF8(4, v502, v492, v411);
          v300 = sub_1DEE65BF8(4, v493, v491, -v425.f32[2]);
          v301 = sub_1DEE659F0(v299, v492, v300, v491, v490);
          v302 = sub_1DEE65BF8(4, v498, v492, v426.f32[2]);
          v303 = sub_1DEE659F0(v302, v492, v301, v490, v485);
          v304 = sub_1DEE65BF8(4, v496, v492, v425.f32[2]);
          v305 = sub_1DEE65BF8(4, v494, v491, v426.f32[2]);
          v306 = sub_1DEE659F0(v304, v492, v305, v491, v490);
          v307 = sub_1DEE65BF8(4, v502, v492, v424.f32[2]);
          v431 = sub_1DEE659F0(v307, v492, v306, v490, v484);
          v308 = sub_1DEE65BF8(4, v495, v492, v426.f32[2]);
          v309 = sub_1DEE65BF8(4, v493, v491, v423.f32[2]);
          v310 = sub_1DEE659F0(v308, v492, v309, v491, v490);
          v311 = sub_1DEE65BF8(4, v501, v492, v411);
          v312 = sub_1DEE659F0(v311, v492, v310, v490, v483);
          v313 = sub_1DEE65BF8(4, v494, v492, v423.f32[2]);
          v314 = sub_1DEE65BF8(4, v497, v491, v424.f32[2]);
          v315 = sub_1DEE659F0(v313, v492, v314, v491, v490);
          v316 = sub_1DEE65BF8(4, v500, v492, v425.f32[2]);
          v317 = sub_1DEE659F0(v316, v492, v315, v490, v482);
          v318 = sub_1DEE65BF8(4, v493, v492, v424.f32[2]);
          v319 = sub_1DEE65BF8(4, v496, v491, v411);
          v320 = sub_1DEE659F0(v318, v492, v319, v491, v490);
          v321 = sub_1DEE65BF8(4, v499, v492, v426.f32[2]);
          v322 = sub_1DEE659F0(v321, v492, v320, v490, v481);
          v323 = sub_1DEE65BF8(4, v497, v492, v411);
          v324 = sub_1DEE65BF8(4, v495, v491, v425.f32[2]);
          v325 = sub_1DEE659F0(v323, v492, v324, v491, v490);
          v326 = sub_1DEE65BF8(4, v498, v492, v423.f32[2]);
          v327 = sub_1DEE659F0(v326, v492, v325, v490, v480);
          v328 = sub_1DEE659F0(v293, v487, v312, v483, v479);
          v429 = v288;
          v329 = sub_1DEE659F0(v322, v481, v288, v488, v478);
          if (v329 >= 1)
          {
            v330 = v329;
            v331 = v478;
            do
            {
              *v331 = -*v331;
              ++v331;
              --v330;
            }
            while (v330);
          }
          v332 = sub_1DEE659F0(v328, v479, v329, v478, v476);
          v333 = sub_1DEE65BF8(v332, v476, v472, v425.f32[0]);
          v334 = sub_1DEE65BF8(v333, v472, v471, v425.f32[0]);
          v335 = sub_1DEE65BF8(v332, v476, v472, v409);
          v336 = sub_1DEE65BF8(v335, v472, v470, v409);
          v337 = sub_1DEE65BF8(v332, v476, v472, v425.f32[2]);
          v338 = sub_1DEE65BF8(v337, v472, v469, v425.f32[2]);
          v339 = sub_1DEE659F0(v334, v471, v336, v470, v468);
          v340 = sub_1DEE659F0(v339, v468, v338, v469, v467);
          v341 = sub_1DEE659F0(v298, v486, v317, v482, v479);
          v342 = sub_1DEE659F0(v327, v480, v293, v487, v478);
          if (v342 >= 1)
          {
            v343 = v342;
            v344 = v478;
            do
            {
              *v344 = -*v344;
              ++v344;
              --v343;
            }
            while (v343);
          }
          v345 = sub_1DEE659F0(v341, v479, v342, v478, v475);
          v346 = sub_1DEE65BF8(v345, v475, v472, v426.f32[0]);
          v347 = sub_1DEE65BF8(v346, v472, v471, v426.f32[0]);
          v348 = sub_1DEE65BF8(v345, v475, v472, v414);
          v349 = sub_1DEE65BF8(v348, v472, v470, v414);
          v350 = sub_1DEE65BF8(v345, v475, v472, v426.f32[2]);
          v351 = sub_1DEE65BF8(v350, v472, v469, v426.f32[2]);
          v352 = sub_1DEE659F0(v347, v471, v349, v470, v468);
          v353 = sub_1DEE659F0(v352, v468, v351, v469, v466);
          v354 = sub_1DEE659F0(v303, v485, v322, v481, v479);
          v355 = sub_1DEE659F0(v431, v484, v298, v486, v478);
          if (v355 >= 1)
          {
            v356 = v355;
            v357 = v478;
            do
            {
              *v357 = -*v357;
              ++v357;
              --v356;
            }
            while (v356);
          }
          v358 = sub_1DEE659F0(v354, v479, v355, v478, v474);
          v359 = sub_1DEE65BF8(v358, v474, v472, v423.f32[0]);
          v360 = sub_1DEE65BF8(v359, v472, v471, v423.f32[0]);
          v361 = sub_1DEE65BF8(v358, v474, v472, v410);
          v362 = sub_1DEE65BF8(v361, v472, v470, v410);
          v363 = sub_1DEE65BF8(v358, v474, v472, v423.f32[2]);
          v364 = sub_1DEE65BF8(v363, v472, v469, v423.f32[2]);
          v365 = sub_1DEE659F0(v360, v471, v362, v470, v468);
          v366 = sub_1DEE659F0(v365, v468, v364, v469, v465);
          v367 = sub_1DEE659F0(v434, v489, v327, v480, v479);
          v368 = sub_1DEE659F0(v312, v483, v303, v485, v478);
          if (v368 >= 1)
          {
            v369 = v368;
            v370 = v478;
            do
            {
              *v370 = -*v370;
              ++v370;
              --v369;
            }
            while (v369);
          }
          v371 = sub_1DEE659F0(v367, v479, v368, v478, v473);
          v372 = sub_1DEE65BF8(v371, v473, v472, v424.f32[0]);
          v373 = sub_1DEE65BF8(v372, v472, v471, v424.f32[0]);
          v374 = sub_1DEE65BF8(v371, v473, v472, v412);
          v375 = sub_1DEE65BF8(v374, v472, v470, v412);
          v376 = sub_1DEE65BF8(v371, v473, v472, v424.f32[2]);
          v377 = sub_1DEE65BF8(v376, v472, v469, v424.f32[2]);
          v378 = sub_1DEE659F0(v373, v471, v375, v470, v468);
          v379 = sub_1DEE659F0(v378, v468, v377, v469, v464);
          v380 = sub_1DEE659F0(v429, v488, v431, v484, v479);
          v381 = sub_1DEE659F0(v317, v482, v434, v489, v478);
          if (v381 >= 1)
          {
            v382 = v381;
            v383 = v478;
            do
            {
              *v383 = -*v383;
              ++v383;
              --v382;
            }
            while (v382);
          }
          v384 = sub_1DEE659F0(v380, v479, v381, v478, v477);
          v385 = sub_1DEE65BF8(v384, v477, v472, v420.f32[0]);
          v386 = sub_1DEE65BF8(v385, v472, v471, v420.f32[0]);
          v387 = sub_1DEE65BF8(v384, v477, v472, v413);
          v388 = sub_1DEE65BF8(v387, v472, v470, v413);
          v389 = sub_1DEE65BF8(v384, v477, v472, v411);
          v390 = sub_1DEE65BF8(v389, v472, v469, v411);
          v391 = sub_1DEE659F0(v386, v471, v388, v470, v468);
          v392 = sub_1DEE659F0(v391, v468, v390, v469, v463);
          v393 = sub_1DEE659F0(v340, v467, v353, v466, v462);
          v394 = sub_1DEE659F0(v366, v465, v379, v464, v461);
          v395 = sub_1DEE659F0(v394, v461, v392, v463, v460);
          _S0 = v459[(int)sub_1DEE659F0(v393, v462, v395, v460, v459) - 1];
        }
      }
    }
  }
  __asm { FCVT            H0, S0 }
  return result;
}

uint64_t sub_1DEE659F0(int a1, float *a2, int a3, float *a4, float *a5)
{
  float v6;
  float v7;
  int v8;
  float v9;
  int v10;
  uint64_t result;
  float v12;
  float v13;
  uint64_t v14;
  float *v15;
  float v16;
  float v17;
  uint64_t v18;
  float *v19;
  float v20;
  float v21;
  float v23;
  float v24;
  float v25;

  v6 = *a2;
  v7 = *a4;
  if (*a4 <= *a2 == *a4 > (float)-*a2)
  {
    v10 = 0;
    v9 = *a4;
    v7 = a4[1];
    v8 = 1;
  }
  else
  {
    v8 = 0;
    v9 = *a2;
    v6 = a2[1];
    v10 = 1;
  }
  result = 0;
  if (v10 >= a1 || v8 >= a3)
  {
    v12 = v9;
  }
  else
  {
    if (v7 <= v6 == v7 > (float)-v6)
    {
      v12 = v9 + v7;
      v13 = (float)(v9 + v7) - v7;
      v7 = a4[++v8];
    }
    else
    {
      v12 = v9 + v6;
      v13 = (float)(v9 + v6) - v6;
      v6 = a2[++v10];
    }
    v23 = v9 - v13;
    if (v23 == 0.0)
    {
      result = 0;
    }
    else
    {
      *a5 = v23;
      result = 1;
    }
    while (v10 < a1 && v8 < a3)
    {
      if (v7 <= v6 == v7 > (float)-v6)
      {
        v24 = v12 + v7;
        v25 = (float)(v7 - (float)((float)(v12 + v7) - v12))
            + (float)(v12 - (float)((float)(v12 + v7) - (float)((float)(v12 + v7) - v12)));
        v7 = a4[++v8];
      }
      else
      {
        v24 = v12 + v6;
        v25 = (float)(v6 - (float)((float)(v12 + v6) - v12))
            + (float)(v12 - (float)((float)(v12 + v6) - (float)((float)(v12 + v6) - v12)));
        v6 = a2[++v10];
      }
      v12 = v24;
      if (v25 != 0.0)
      {
        a5[(int)result] = v25;
        result = (result + 1);
      }
    }
  }
  if (v10 < a1)
  {
    v14 = a1 - (uint64_t)v10;
    v15 = &a2[v10 + 1];
    do
    {
      v16 = v12;
      v12 = v12 + v6;
      v17 = (float)(v6 - (float)(v12 - v16)) + (float)(v16 - (float)(v12 - (float)(v12 - v16)));
      v6 = *v15;
      if (v17 != 0.0)
      {
        a5[(int)result] = v17;
        result = (result + 1);
      }
      ++v15;
      --v14;
    }
    while (v14);
  }
  if (v8 < a3)
  {
    v18 = a3 - (uint64_t)v8;
    v19 = &a4[v8 + 1];
    do
    {
      v20 = v12;
      v12 = v12 + v7;
      v21 = (float)(v7 - (float)(v12 - v20)) + (float)(v20 - (float)(v12 - (float)(v12 - v20)));
      v7 = *v19;
      if (v21 != 0.0)
      {
        a5[(int)result] = v21;
        result = (result + 1);
      }
      ++v19;
      --v18;
    }
    while (v18);
  }
  if (v12 != 0.0 || (_DWORD)result == 0)
  {
    a5[(int)result] = v12;
    return (result + 1);
  }
  return result;
}

uint64_t sub_1DEE65BF8(int a1, float *a2, float *a3, float a4)
{
  float v5;
  float v6;
  float v7;
  float v8;
  uint64_t result;
  uint64_t v10;
  float *v11;
  uint64_t v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;

  v5 = (float)(a4 * 4096.0) - (float)((float)(a4 * 4096.0) - a4);
  v6 = *a2 * a4;
  v7 = (float)(*a2 * 4096.0) - (float)((float)(*a2 * 4096.0) - *a2);
  v8 = -(float)((float)((float)((float)(v6 - (float)(v7 * v5)) - (float)((float)(*a2 - v7) * v5))
                      - (float)(v7 * (float)(a4 - v5)))
              - (float)((float)(*a2 - v7) * (float)(a4 - v5)));
  if (v8 == 0.0)
  {
    result = 0;
  }
  else
  {
    *a3 = v8;
    result = 1;
  }
  if (a1 >= 2)
  {
    v10 = a1;
    v11 = a2 + 1;
    v12 = v10 - 1;
    do
    {
      v13 = *v11 * a4;
      v14 = (float)(*v11 * 4096.0) - (float)((float)(*v11 * 4096.0) - *v11);
      v15 = -(float)((float)((float)((float)(v13 - (float)(v14 * v5)) - (float)((float)(*v11 - v14) * v5))
                           - (float)(v14 * (float)(a4 - v5)))
                   - (float)((float)(*v11 - v14) * (float)(a4 - v5)));
      v16 = v6 + v15;
      v17 = (float)(v15 - (float)((float)(v6 + v15) - v6))
          + (float)(v6 - (float)((float)(v6 + v15) - (float)((float)(v6 + v15) - v6)));
      if (v17 != 0.0)
      {
        a3[(int)result] = v17;
        result = (result + 1);
      }
      v6 = v13 + v16;
      v18 = v16 - (float)((float)(v13 + v16) - v13);
      if (v18 != 0.0)
      {
        a3[(int)result] = v18;
        result = (result + 1);
      }
      ++v11;
      --v12;
    }
    while (v12);
  }
  if (v6 != 0.0 || (_DWORD)result == 0)
  {
    a3[(int)result] = v6;
    return (result + 1);
  }
  return result;
}

__complex_double cacoshl(__complex_double a1)
{
  int8x16_t v1;
  double v2;
  double v3;
  double v4;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  __complex_double v12;
  double v13;
  BOOL v14;
  float64x2_t v15;
  double v16;
  double v17;
  int8x16_t v18;
  int8x16_t v19;
  __complex_double v20;
  __complex_double result;

  v1.i64[0] = *(_QWORD *)&a1.c[1];
  v2 = a1.c[0];
  v3 = fabs(a1.c[0]);
  v4 = fabs(*(double *)v1.i64);
  if (v3 == INFINITY || v4 == INFINITY)
  {
    v18 = v1;
    a1.c[0] = atan2l(v4, v3);
    v1 = v18;
    v4 = INFINITY;
  }
  else if (v3 < 0.0000000074505806 && v4 < 0.0000000074505806)
  {
    a1.c[0] = 1.57079633 - v3;
  }
  else
  {
    v19 = v1;
    if (v3 > 134217728.0 || v4 > 134217728.0)
    {
      v20.c[0] = v3;
      v20.c[1] = v4;
      v12 = clogl(v20);
      a1.c[0] = v12.c[1];
      v4 = v12.c[0] + 0.693147181;
    }
    else
    {
      if (v4 >= 1.23259516e-32)
        v7 = *(double *)v1.i64 * *(double *)v1.i64;
      else
        v7 = 0.0;
      v8 = sqrt((v3 + 1.0 + sqrt(v7 + (v3 + 1.0) * (v3 + 1.0))) * 0.5);
      v9 = v3 + -1.0;
      if (v9 == 0.0)
      {
        v10 = sqrt(v4) * 0.707106781;
        v11 = v10;
      }
      else
      {
        v13 = sqrt((fabs(v9) + sqrt(v7 + v9 * v9)) * 0.5);
        v14 = v9 < 0.0;
        if (v9 >= 0.0)
          v10 = v13;
        else
          v10 = v4 / v13 * 0.5;
        if (v14)
          v11 = v13;
        else
          v11 = v4 / v13 * 0.5;
      }
      v4 = asinhl(v4 / v8 * 0.5 * v11 + v8 * v10);
      a1.c[0] = atan2l(v11, v8);
      a1.c[0] = a1.c[0] + a1.c[0];
    }
    v1 = v19;
  }
  if (v2 < 0.0)
    a1.c[0] = 3.14159265 - a1.c[0];
  v15.f64[0] = NAN;
  v15.f64[1] = NAN;
  *(_QWORD *)&v16 = vbslq_s8((int8x16_t)vnegq_f64(v15), (int8x16_t)a1, v1).u64[0];
  v17 = v4;
  result.c[1] = v16;
  result.c[0] = v17;
  return result;
}

__complex_float cacoshf(__complex_float a1)
{
  int8x16_t v1;
  float v2;
  float v3;
  float v4;
  int v6;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  __complex_float v13;
  float v14;
  BOOL v15;
  int8x16_t v16;
  float v17;
  float v18;
  int8x16_t v19;
  int8x16_t v20;
  __complex_float v21;
  __complex_float result;

  v1.i32[0] = LODWORD(a1.c[1]);
  v2 = a1.c[0];
  v3 = fabsf(a1.c[0]);
  v4 = fabsf(*(float *)v1.i32);
  if (v3 == INFINITY || v4 == INFINITY)
  {
    v19 = v1;
    a1.c[0] = atan2f(v4, v3);
    v1 = v19;
    v4 = INFINITY;
  }
  else
  {
    v6 = 956301312;
    if (v3 < 0.00012207 && v4 < 0.00012207)
    {
      a1.c[0] = 1.5708 - v3;
    }
    else
    {
      v20 = v1;
      if (v3 > 8192.0 || v4 > 8192.0)
      {
        v21.c[0] = v3;
        v21.c[1] = v4;
        v13 = clogf(v21);
        a1.c[0] = v13.c[1];
        v4 = v13.c[0] + 0.69315;
      }
      else
      {
        if (v4 >= 2.2204e-16)
          v8 = *(float *)v1.i32 * *(float *)v1.i32;
        else
          v8 = 0.0;
        v9 = sqrtf((float)((float)(v3 + 1.0) + sqrtf(v8 + (float)((float)(v3 + 1.0) * (float)(v3 + 1.0)))) * 0.5);
        v10 = v3 + -1.0;
        if (v10 == 0.0)
        {
          v11 = sqrtf(v4) * 0.70711;
          v12 = v11;
        }
        else
        {
          v14 = sqrtf((float)(fabsf(v10) + sqrtf(v8 + (float)(v10 * v10))) * 0.5);
          v15 = v10 < 0.0;
          if (v10 >= 0.0)
            v11 = v14;
          else
            v11 = (float)(v4 / v14) * 0.5;
          if (v15)
            v12 = v14;
          else
            v12 = (float)(v4 / v14) * 0.5;
        }
        v4 = asinhf((float)((float)((float)(v4 / v9) * 0.5) * v12) + (float)(v9 * v11));
        a1.c[0] = atan2f(v12, v9);
        a1.c[0] = a1.c[0] + a1.c[0];
      }
      v1 = v20;
    }
  }
  if (v2 < 0.0)
    a1.c[0] = 3.1416 - a1.c[0];
  v16.i64[0] = 0x8000000080000000;
  v16.i64[1] = 0x8000000080000000;
  LODWORD(v17) = vbslq_s8(v16, *(int8x16_t *)a1.c, v1).u32[0];
  v18 = v4;
  result.c[1] = v17;
  result.c[0] = v18;
  return result;
}

float __copysignf16(__n128 a1, float a2)
{
  float result;

  LODWORD(result) = LODWORD(a2) & 0xFFFF8000 | a1.n128_u16[0] & 0x7FFF;
  return result;
}

float _simd_orient_vf2(simd_float2 a1, simd_float2 a2)
{
  float32x2_t v3;
  float32x2_t v4;
  float result;
  float v6;
  float v7;
  float32x2_t v9;
  float32x2_t v10;
  float32x2_t v11;
  float32x2_t v12;
  float32x2_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  uint64_t i;
  _BYTE v18[4];
  float v19;
  float v20;
  float v21;

  v3 = (float32x2_t)vrev64_s32((int32x2_t)a2);
  v4 = vmul_f32(v3, (float32x2_t)a1);
  result = v4.f32[0] - v4.f32[1];
  if (v4.f32[0] <= 0.0)
  {
    if (v4.f32[0] >= 0.0 || v4.f32[1] >= 0.0)
      return result;
    v6 = (float)-v4.f32[0] - v4.f32[1];
  }
  else
  {
    if (v4.f32[1] <= 0.0)
      return result;
    v6 = v4.f32[0] + v4.f32[1];
  }
  v7 = v6 * 0.00000017881;
  if (result < v7 && v7 > (float)-result)
  {
    v9 = (float32x2_t)vdup_n_s32(0x45800001u);
    v10 = vmul_f32((float32x2_t)a1, v9);
    v11 = vmul_f32(v3, v9);
    v12 = vsub_f32(v10, vsub_f32(v10, (float32x2_t)a1));
    v13 = vsub_f32((float32x2_t)a1, v12);
    v14 = vsub_f32(v11, vsub_f32(v11, v3));
    v15 = vsub_f32(v3, v14);
    v16 = vmla_f32(vneg_f32(vmls_f32(vmls_f32(vmls_f32(v4, v14, v12), v14, v13), v15, v12)), v15, v13);
    v15.f32[0] = v16.f32[0] - v16.f32[1];
    result = (float)((float)(v16.f32[0] - (float)(v16.f32[0] - v16.f32[1])) - v16.f32[1])
           + (float)(v16.f32[0]
                   - (float)((float)(v16.f32[0] - v16.f32[1]) + (float)(v16.f32[0] - (float)(v16.f32[0] - v16.f32[1]))));
    v13.f32[0] = v4.f32[0] + v15.f32[0];
    v4.f32[0] = (float)(v15.f32[0] - (float)((float)(v4.f32[0] + v15.f32[0]) - v4.f32[0]))
              + (float)(v4.f32[0]
                      - (float)((float)(v4.f32[0] + v15.f32[0]) - (float)((float)(v4.f32[0] + v15.f32[0]) - v4.f32[0])));
    v21 = v13.f32[0] + (float)(v4.f32[0] - v4.f32[1]);
    v19 = (float)((float)(v4.f32[0] - (float)(v4.f32[0] - v4.f32[1])) - v4.f32[1])
        + (float)(v4.f32[0]
                - (float)((float)(v4.f32[0] - v4.f32[1]) + (float)(v4.f32[0] - (float)(v4.f32[0] - v4.f32[1]))));
    v20 = (float)((float)(v4.f32[0] - v4.f32[1]) - (float)(v21 - v13.f32[0]))
        + (float)(v13.f32[0] - (float)(v21 - (float)(v21 - v13.f32[0])));
    for (i = 4; i != 16; i += 4)
      result = result + *(float *)&v18[i];
  }
  return result;
}

float _simd_orient_pf2(simd_float2 a1, simd_float2 a2, simd_float2 a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  float32x2_t v17;
  float result;
  float v19;
  float32x2_t v21;
  float32x2_t v22;
  float32x2_t v23;
  float32x2_t v24;
  float32x2_t v25;
  float32x2_t v26;
  float32x2_t v27;
  float32x2_t v28;
  float32x2_t v29;
  float32x2_t v32;
  float32x2_t v33;
  float32x2_t v34;
  float v35;
  float v36;
  float v37;
  uint64_t i;
  float32x2_t v40;
  float32x2_t v41;
  float32x2_t v42;
  float32x2_t v43;
  float32x4_t v44;
  float32x2_t v45;
  float32x2_t v46;
  float v47;
  float v49;
  float v63;
  float v64;
  float v65;
  int v66;
  float32x2_t v67;
  float v68;
  float v77;
  float v78;
  float v79;
  float v80;
  int v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float32x2_t v92;
  float32x2_t v93;
  float32x2_t v94;
  float32x2_t v95;
  float v96;
  float32x2_t v97;
  float v98;
  float v99;
  float v100;
  float v101;
  float v102[16];
  float v103[12];
  float v104[8];
  float v105[4];
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;

  v14 = vsub_f32((float32x2_t)a1, (float32x2_t)a3);
  v15 = vsub_f32((float32x2_t)a2, (float32x2_t)a3);
  v16 = vmul_lane_f32(v14, v15, 1);
  v17 = vmul_lane_f32(v15, v14, 1);
  LODWORD(result) = vsub_f32(v16, v17).u32[0];
  if (v16.f32[0] <= 0.0)
  {
    if (v16.f32[0] >= 0.0 || v17.f32[0] >= 0.0)
      return result;
    v19 = (float)-v16.f32[0] - v17.f32[0];
  }
  else
  {
    if (v17.f32[0] <= 0.0)
      return result;
    LODWORD(v19) = vadd_f32(v16, v17).u32[0];
  }
  v106 = v12;
  v107 = v11;
  v108 = v10;
  v109 = v9;
  v110 = v8;
  v111 = v7;
  v112 = v6;
  v113 = v5;
  v114 = v3;
  v115 = v4;
  if (result < (float)(v19 * 0.00000017881) && (float)(v19 * 0.00000017881) > (float)-result)
  {
    v21 = (float32x2_t)vrev64_s32((int32x2_t)a1);
    v22 = (float32x2_t)vrev64_s32((int32x2_t)a3);
    v23 = vsub_f32(v21, v22);
    v24 = vmul_f32(v15, v23);
    v25 = (float32x2_t)vdup_n_s32(0x45800001u);
    v26 = vmul_f32(v23, v25);
    v27 = vsub_f32(v26, vsub_f32(v26, v23));
    v28 = vsub_f32(v23, v27);
    v29 = vmul_f32(v15, v25);
    _D5 = vsub_f32(v29, vsub_f32(v29, v15));
    _D3 = vsub_f32(v15, _D5);
    v32 = vneg_f32(v27);
    v33 = vneg_f32(v28);
    v34 = vmla_f32(vneg_f32(vmls_f32(vmls_f32(vmls_f32(v24, _D5, v27), _D5, v28), _D3, v27)), _D3, v28);
    v35 = v34.f32[1] - v34.f32[0];
    result = (float)((float)(v34.f32[1] - (float)(v34.f32[1] - v34.f32[0])) - v34.f32[0])
           + (float)(v34.f32[1]
                   - (float)((float)(v34.f32[1] - v34.f32[0]) + (float)(v34.f32[1] - (float)(v34.f32[1] - v34.f32[0]))));
    v36 = v24.f32[1] + v35;
    v27.f32[0] = (float)(v35 - (float)((float)(v24.f32[1] + v35) - v24.f32[1]))
               + (float)(v24.f32[1]
                       - (float)((float)(v24.f32[1] + v35) - (float)((float)(v24.f32[1] + v35) - v24.f32[1])));
    v37 = v27.f32[0] - v24.f32[0];
    v105[0] = result;
    v105[1] = (float)((float)(v27.f32[0] - (float)(v27.f32[0] - v24.f32[0])) - v24.f32[0])
            + (float)(v27.f32[0]
                    - (float)((float)(v27.f32[0] - v24.f32[0]) + (float)(v27.f32[0] - (float)(v27.f32[0] - v24.f32[0]))));
    v24.f32[0] = v36 + (float)(v27.f32[0] - v24.f32[0]);
    v105[2] = (float)(v37 - (float)(v24.f32[0] - v36)) + (float)(v36 - (float)(v24.f32[0] - (float)(v24.f32[0] - v36)));
    v105[3] = v24.f32[0];
    for (i = 1; i != 4; ++i)
      result = result + v105[i];
    if (result < (float)(v19 * 0.00000011921) && (float)(v19 * 0.00000011921) > (float)-result)
    {
      v40 = vsub_f32(v21, v23);
      v41 = vsub_f32((float32x2_t)a2, v15);
      v42 = vadd_f32(vsub_f32(v40, v22), vsub_f32(v21, vadd_f32(v23, v40)));
      v43 = vadd_f32(vsub_f32(v41, (float32x2_t)a3), vsub_f32((float32x2_t)a2, vadd_f32(v15, v41)));
      *(float32x2_t *)v44.f32 = v42;
      *(float32x2_t *)&v44.u32[2] = v43;
      if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqzq_f32(v44)))) & 1) != 0)
      {
        v45 = vmul_f32(v15, v42);
        v46 = vmla_f32(v45, v43, v23);
        v47 = (float)(fabsf(result) * 0.00000017881) + (float)(v19 * 3.1974e-14);
        result = vsub_f32((float32x2_t)vdup_lane_s32((int32x2_t)v46, 1), v46).f32[0] + result;
        if (result < v47 && v47 > (float)-result)
        {
          v96 = v42.f32[1];
          v49 = vmuls_lane_f32(4096.0, v42, 1);
          _S10 = v49 - (float)(v49 - v42.f32[1]);
          _S11 = v42.f32[1] - _S10;
          __asm
          {
            FMLS            S4, S10, V5.S[1]
            FMLS            S4, S11, V5.S[1]
            FMLA            S0, S11, V3.S[1]
          }
          _S12 = (float)(4096.0 * v42.f32[0]) - (float)((float)(4096.0 * v42.f32[0]) - v42.f32[0]);
          _S13 = v42.f32[0] - _S12;
          __asm
          {
            FMLS            S6, S12, V5.S[0]
            FMLS            S6, S13, V5.S[0]
          }
          v63 = vmlas_n_f32(-(float)(_S6 + (float)((float)-_S12 * _D3.f32[0])), v42.f32[0] - _S12, _D3.f32[0]);
          v64 = _S0 - v63;
          v65 = (float)(v64 - (float)((float)(v45.f32[1] + v64) - v45.f32[1]))
              + (float)(v45.f32[1] - (float)((float)(v45.f32[1] + v64) - (float)((float)(v45.f32[1] + v64) - v45.f32[1])));
          v98 = (float)((float)(_S0 - (float)(_S0 - v63)) - v63)
              + (float)(_S0 - (float)((float)(_S0 - v63) + (float)(_S0 - (float)(_S0 - v63))));
          v99 = (float)((float)(v65 - (float)(v65 - v45.f32[0])) - v45.f32[0])
              + (float)(v65 - (float)((float)(v65 - v45.f32[0]) + (float)(v65 - (float)(v65 - v45.f32[0]))));
          v100 = (float)((float)(v65 - v45.f32[0])
                       - (float)((float)((float)(v45.f32[1] + v64) + (float)(v65 - v45.f32[0]))
                               - (float)(v45.f32[1] + v64)))
               + (float)((float)(v45.f32[1] + v64)
                       - (float)((float)((float)(v45.f32[1] + v64) + (float)(v65 - v45.f32[0]))
                               - (float)((float)((float)(v45.f32[1] + v64) + (float)(v65 - v45.f32[0]))
                                       - (float)(v45.f32[1] + v64))));
          v101 = (float)(v45.f32[1] + (float)(_S0 - v63)) + (float)(v65 - v45.f32[0]);
          v93 = v33;
          v94 = v28;
          v92 = v32;
          v95 = v42;
          v97 = v43;
          v66 = sub_1DEE659F0(4, v105, 4, &v98, v104);
          v67 = vmul_f32(v23, v97);
          v68 = vmuls_lane_f32(4096.0, v97, 1);
          _S15 = v68 - (float)(v68 - v97.f32[1]);
          _S8 = v97.f32[1] - _S15;
          _V4.S[1] = v92.i32[1];
          _V16.S[1] = v93.i32[1];
          __asm
          {
            FMLA            S3, S15, V4.S[1]
            FMLA            S3, S15, V16.S[1]
          }
          _V6.S[1] = v94.i32[1];
          __asm { FMLA            S0, S8, V6.S[1] }
          v77 = (float)(4096.0 * v97.f32[0]) - (float)((float)(4096.0 * v97.f32[0]) - v97.f32[0]);
          v78 = vmlas_n_f32(-(float)(vmlas_n_f32(vmlas_n_f32(v67.f32[0], v77, v92.f32[0]), v77, v93.f32[0])+ (float)(v92.f32[0] * (float)(v97.f32[0] - v77))), v97.f32[0] - v77, v94.f32[0]);
          v79 = _S0 - v78;
          v80 = (float)(v79 - (float)((float)(v67.f32[1] + v79) - v67.f32[1]))
              + (float)(v67.f32[1] - (float)((float)(v67.f32[1] + v79) - (float)((float)(v67.f32[1] + v79) - v67.f32[1])));
          v98 = (float)((float)(_S0 - (float)(_S0 - v78)) - v78)
              + (float)(_S0 - (float)((float)(_S0 - v78) + (float)(_S0 - (float)(_S0 - v78))));
          v99 = (float)((float)(v80 - (float)(v80 - v67.f32[0])) - v67.f32[0])
              + (float)(v80 - (float)((float)(v80 - v67.f32[0]) + (float)(v80 - (float)(v80 - v67.f32[0]))));
          v100 = (float)((float)(v80 - v67.f32[0])
                       - (float)((float)((float)(v67.f32[1] + v79) + (float)(v80 - v67.f32[0]))
                               - (float)(v67.f32[1] + v79)))
               + (float)((float)(v67.f32[1] + v79)
                       - (float)((float)((float)(v67.f32[1] + v79) + (float)(v80 - v67.f32[0]))
                               - (float)((float)((float)(v67.f32[1] + v79) + (float)(v80 - v67.f32[0]))
                                       - (float)(v67.f32[1] + v79))));
          v101 = (float)(v67.f32[1] + (float)(_S0 - v78)) + (float)(v80 - v67.f32[0]);
          v81 = sub_1DEE659F0(v66, v104, 4, &v98, v103);
          v82 = vmuls_lane_f32(v96, v97, 1);
          v83 = -(float)((float)((float)((float)(v82 - (float)(_S10 * _S15)) - (float)(_S11 * _S15))
                               - (float)(_S10 * _S8))
                       - (float)(_S11 * _S8));
          v84 = vmul_f32(v97, v95).f32[0];
          v85 = -(float)((float)((float)((float)(v84 - (float)(_S12 * v77)) - (float)(_S13 * v77))
                               - (float)(_S12 * (float)(v97.f32[0] - v77)))
                       - (float)(_S13 * (float)(v97.f32[0] - v77)));
          v86 = v83 - v85;
          v87 = (float)((float)(v83 - (float)(v83 - v85)) - v85)
              + (float)(v83 - (float)((float)(v83 - v85) + (float)(v83 - (float)(v83 - v85))));
          v88 = v82 + v86;
          v89 = (float)(v86 - (float)((float)(v82 + v86) - v82))
              + (float)(v82 - (float)((float)(v82 + v86) - (float)((float)(v82 + v86) - v82)));
          v90 = v89 - v84;
          v98 = v87;
          v99 = (float)((float)(v89 - (float)(v89 - v84)) - v84)
              + (float)(v89 - (float)((float)(v89 - v84) + (float)(v89 - (float)(v89 - v84))));
          v91 = v88 + (float)(v89 - v84);
          v100 = (float)(v90 - (float)(v91 - v88)) + (float)(v88 - (float)(v91 - (float)(v91 - v88)));
          v101 = v91;
          return v102[(int)sub_1DEE659F0(v81, v103, 4, &v98, v102) - 1];
        }
      }
    }
  }
  return result;
}

float _simd_orient_vf3(simd_float3 a1, simd_float3 a2, simd_float3 a3)
{
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float result;
  float32x4_t v10;
  float v11;
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
  float v27;
  float v28;
  int v29;
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
  int v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  int v52;
  int v53;
  int v54;
  uint64_t v55;
  float *v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float32x2_t v61;
  simd_float3 v62;
  simd_float3 v63;
  float v64;
  int v65;
  float v66[16];
  float v67[8];
  float v68[8];
  float v69[8];
  float v70[4];
  float v71[4];
  float v72[4];

  v6 = vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)a2, (int8x16_t)a2, 0xCuLL), (int8x16_t)a2, 8uLL), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a3, (int32x4_t)a3), (int8x16_t)a3, 0xCuLL));
  v7 = vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a2, (int32x4_t)a2), (int8x16_t)a2, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)a3, (int8x16_t)a3, 0xCuLL), (int8x16_t)a3, 8uLL));
  v8 = vmulq_f32((float32x4_t)a1, vsubq_f32(v6, v7));
  result = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v8, 2), vaddq_f32(v8, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v8.f32, 1))).f32[0];
  v10 = vmulq_f32(vaddq_f32(vabsq_f32(v6), vabsq_f32(v7)), vabsq_f32((float32x4_t)a1));
  v11 = 0.00000041723
      * vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v10, 2), vaddq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 1))).f32[0];
  if (result <= v11 && v11 >= (float)-result)
  {
    v13 = vmuls_lane_f32(a2.f32[0], *(float32x2_t *)a3.f32, 1);
    v14 = (float)(4096.0 * a2.f32[0]) - (float)((float)(4096.0 * a2.f32[0]) - a2.f32[0]);
    v15 = vmuls_lane_f32(4096.0, *(float32x2_t *)a3.f32, 1);
    v16 = v15 - (float)(v15 - a3.f32[1]);
    v17 = a3.f32[1] - v16;
    v59 = a2.f32[0] - v14;
    v60 = v14;
    v18 = -(float)((float)((float)((float)(v13 - (float)(v14 * v16)) - (float)((float)(a2.f32[0] - v14) * v16))
                         - (float)(v14 * (float)(a3.f32[1] - v16)))
                 - (float)((float)(a2.f32[0] - v14) * (float)(a3.f32[1] - v16)));
    v19 = vmuls_lane_f32(a3.f32[0], *(float32x2_t *)a2.f32, 1);
    v62 = a3;
    v63 = a2;
    v20 = (float)(4096.0 * a3.f32[0]) - (float)((float)(4096.0 * a3.f32[0]) - a3.f32[0]);
    v21 = a3.f32[0] - v20;
    v22 = vmuls_lane_f32(4096.0, *(float32x2_t *)a2.f32, 1);
    v23 = v22 - (float)(v22 - a2.f32[1]);
    v58 = a2.f32[1] - v23;
    v24 = -(float)((float)((float)((float)(v19 - (float)(v20 * v23)) - (float)(v21 * v23))
                         - (float)(v20 * (float)(a2.f32[1] - v23)))
                 - (float)(v21 * (float)(a2.f32[1] - v23)));
    v25 = v18 - v24;
    v26 = (float)((float)(v18 - (float)(v18 - v24)) - v24)
        + (float)(v18 - (float)((float)(v18 - v24) + (float)(v18 - (float)(v18 - v24))));
    v27 = v13 + v25;
    v28 = (float)(v25 - (float)((float)(v13 + v25) - v13))
        + (float)(v13 - (float)((float)(v13 + v25) - (float)((float)(v13 + v25) - v13)));
    v72[0] = v26;
    v72[1] = (float)((float)(v28 - (float)(v28 - v19)) - v19)
           + (float)(v28 - (float)((float)(v28 - v19) + (float)(v28 - (float)(v28 - v19))));
    v72[2] = (float)((float)(v28 - v19) - (float)((float)(v27 + (float)(v28 - v19)) - v27))
           + (float)(v27 - (float)((float)(v27 + (float)(v28 - v19)) - (float)((float)(v27 + (float)(v28 - v19)) - v27)));
    v72[3] = v27 + (float)(v28 - v19);
    v61 = *(float32x2_t *)a1.f32;
    v29 = sub_1DEE65BF8(4, v72, v69, a1.f32[2]);
    v30 = vmuls_lane_f32(v62.f32[0], v61, 1);
    v31 = vmuls_lane_f32(4096.0, v61, 1);
    v32 = v31 - (float)(v31 - v61.f32[1]);
    v33 = -(float)((float)((float)((float)(v30 - (float)(v20 * v32)) - (float)(v21 * v32))
                         - (float)(v20 * (float)(v61.f32[1] - v32)))
                 - (float)(v21 * (float)(v61.f32[1] - v32)));
    v34 = vmuls_lane_f32(v61.f32[0], *(float32x2_t *)v62.f32, 1);
    v35 = (float)(4096.0 * v61.f32[0]) - (float)((float)(4096.0 * v61.f32[0]) - v61.f32[0]);
    v36 = -(float)((float)((float)((float)(v34 - (float)(v35 * v16)) - (float)((float)(v61.f32[0] - v35) * v16))
                         - (float)(v35 * v17))
                 - (float)((float)(v61.f32[0] - v35) * v17));
    v37 = v33 - v36;
    v38 = (float)((float)(v33 - (float)(v33 - v36)) - v36)
        + (float)(v33 - (float)((float)(v33 - v36) + (float)(v33 - (float)(v33 - v36))));
    v39 = v30 + v37;
    v40 = (float)(v37 - (float)((float)(v30 + v37) - v30))
        + (float)(v30 - (float)((float)(v30 + v37) - (float)((float)(v30 + v37) - v30)));
    v71[0] = v38;
    v71[1] = (float)((float)(v40 - (float)(v40 - v34)) - v34)
           + (float)(v40 - (float)((float)(v40 - v34) + (float)(v40 - (float)(v40 - v34))));
    v71[2] = (float)((float)(v40 - v34) - (float)((float)(v39 + (float)(v40 - v34)) - v39))
           + (float)(v39 - (float)((float)(v39 + (float)(v40 - v34)) - (float)((float)(v39 + (float)(v40 - v34)) - v39)));
    v71[3] = v39 + (float)(v40 - v34);
    v41 = sub_1DEE65BF8(4, v71, v68, v63.f32[2]);
    v42 = vmuls_lane_f32(v61.f32[0], *(float32x2_t *)v63.f32, 1);
    v43 = -(float)((float)((float)((float)(v42 - (float)(v35 * v23)) - (float)((float)(v61.f32[0] - v35) * v23))
                         - (float)(v35 * v58))
                 - (float)((float)(v61.f32[0] - v35) * v58));
    v44 = vmuls_lane_f32(v63.f32[0], v61, 1);
    v45 = -(float)((float)((float)((float)(v44 - (float)(v60 * v32)) - (float)(v59 * v32))
                         - (float)(v60 * (float)(v61.f32[1] - v32)))
                 - (float)(v59 * (float)(v61.f32[1] - v32)));
    v46 = v43 - v45;
    v47 = (float)((float)(v43 - (float)(v43 - v45)) - v45)
        + (float)(v43 - (float)((float)(v43 - v45) + (float)(v43 - (float)(v43 - v45))));
    v48 = v42 + v46;
    v49 = (float)(v46 - (float)((float)(v42 + v46) - v42))
        + (float)(v42 - (float)((float)(v42 + v46) - (float)((float)(v42 + v46) - v42)));
    v50 = v49 - v44;
    v70[0] = v47;
    v70[1] = (float)((float)(v49 - (float)(v49 - v44)) - v44)
           + (float)(v49 - (float)((float)(v49 - v44) + (float)(v49 - (float)(v49 - v44))));
    v51 = v48 + (float)(v49 - v44);
    v70[2] = (float)(v50 - (float)(v51 - v48)) + (float)(v48 - (float)(v51 - (float)(v51 - v48)));
    v70[3] = v51;
    v52 = sub_1DEE65BF8(4, v70, v67, v62.f32[2]);
    v53 = sub_1DEE659F0(v29, v69, v41, v68, v66);
    v54 = sub_1DEE659F0(v53, v66, v52, v67, &v64);
    result = v64;
    if (v54 >= 2)
    {
      v55 = v54 - 1;
      v56 = (float *)&v65;
      do
      {
        v57 = *v56++;
        result = result + v57;
        --v55;
      }
      while (v55);
    }
  }
  return result;
}

float _simd_orient_pf3(simd_float3 a1, simd_float3 a2, simd_float3 a3, simd_float3 a4)
{
  simd_float3 v6;
  float32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float result;
  float32x4_t v14;
  float v15;
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
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  int v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  int v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  int v57;
  int v58;
  int v59;
  int v60;
  uint64_t v61;
  float *v62;
  float32x4_t v63;
  float32x4_t v64;
  float v65;
  float32x4_t v66;
  float v67;
  float v68;
  float v69;
  float v71;
  float32x4_t v72;
  float v73;
  float32x4_t v74;
  float v75;
  float32x4_t v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  int v92;
  float v93;
  float v94;
  float v95;
  float v96;
  float v97;
  float v98;
  float v99;
  float v100;
  float v101;
  float v102;
  float v103;
  float v104;
  float v105;
  float v106;
  float v107;
  float v108;
  float v109;
  float v110;
  float v111;
  float v112;
  float v113;
  float v114;
  float v115;
  int v116;
  float v117;
  float v118;
  float v119;
  float v120;
  float v121;
  float v122;
  float v123;
  float v124;
  float v125;
  float v126;
  float v127;
  float v128;
  float v129;
  float v130;
  float v131;
  float v132;
  float v133;
  int v134;
  float v135;
  float v136;
  float v137;
  float v138;
  float v139;
  float v140;
  float v141;
  float v142;
  float v143;
  float v144;
  float v145;
  float v146;
  float v147;
  float v148;
  float v149;
  float v150;
  float v151;
  int v152;
  int v153;
  float *v154;
  float *v155;
  int v156;
  int v157;
  int v158;
  int v159;
  int v160;
  int v161;
  int v162;
  int v163;
  int v164;
  float *v165;
  int v166;
  float *v167;
  float v168;
  float v169;
  float v170;
  float v171;
  float v172;
  float v173;
  float v174;
  float v175;
  float v176;
  float v177;
  float v178;
  float v179;
  float v180;
  float v181;
  float v182;
  int v183;
  float v184;
  float v185;
  float v186;
  float *v187;
  float v188;
  float v189;
  float v190;
  float v191;
  float v192;
  float v193;
  float v194;
  float v195;
  float v196;
  float v197;
  float v198;
  int v199;
  float v200;
  float v201;
  float v202;
  float v203;
  float v204;
  float v205;
  float v206;
  float v207;
  float v208;
  float v209;
  float v210;
  float v211;
  float v212;
  int v213;
  float v214;
  float v215;
  float v216;
  float *v217;
  float v218;
  float v219;
  float v220;
  float v221;
  float v222;
  float v223;
  float v224;
  float v225;
  float v226;
  float v227;
  int v228;
  float v229;
  float v230;
  float v231;
  float v232;
  float v233;
  float v234;
  float v235;
  float v236;
  float v237;
  float v238;
  float v239;
  float v240;
  float v241;
  int v242;
  float v243;
  float v244;
  float v245;
  float *v246;
  float v247;
  float v248;
  float v249;
  float v250;
  float v251;
  float v252;
  float v253;
  float v254;
  float v255;
  float v256;
  float v257;
  int v258;
  float v259;
  float v260;
  float v261;
  float v262;
  int v263;
  int v264;
  float *v265;
  int v266;
  float v267;
  float v268;
  float v269;
  float v270;
  float v271;
  float v272;
  float v273;
  float v274;
  float v275;
  float v276;
  float v277;
  float v278;
  float v279;
  float v280;
  float32x4_t v281;
  simd_float3 v282;
  float v283;
  float v285;
  simd_float3 v286;
  float v287;
  float v288;
  float v289;
  float v290;
  float v291;
  float v292;
  float v293;
  float v294;
  float v295;
  float v296;
  float v297;
  float v298;
  float v299;
  float32x4_t v300;
  float v301;
  float32x4_t v302;
  float v303;
  float32x4_t v304;
  float v305;
  float v306[16];
  float v307[12];
  float v308;
  float v309;
  float v310;
  float v311;
  float v312[8];
  float v313[8];
  float v314[8];
  float v315;
  float v316;
  float v317;
  float v318;
  float v319;
  float v320;
  float v321;
  float v322;
  float v323;
  float v324;
  float v325;
  float v326;
  float v327;
  float v328;
  float v329;
  float v330;
  float v331;
  float v332;
  float v333;
  float v334;
  float v335;
  float v336;
  float v337;
  float v338;
  float v339[192];
  float v340;
  int v341;
  float v342[16];
  float v343[8];
  float v344[8];
  float v345[8];
  float v346[4];
  float v347[4];
  float v348[4];

  v6 = a1;
  v7 = vsubq_f32((float32x4_t)a1, (float32x4_t)a4);
  v8 = (int32x4_t)vsubq_f32((float32x4_t)a2, (float32x4_t)a4);
  v9 = (int32x4_t)vsubq_f32((float32x4_t)a3, (float32x4_t)a4);
  v10 = vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v8, (int8x16_t)v8, 0xCuLL), (int8x16_t)v8, 8uLL), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v9, v9), (int8x16_t)v9, 0xCuLL));
  v11 = vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v8, v8), (int8x16_t)v8, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v9, (int8x16_t)v9, 0xCuLL), (int8x16_t)v9, 8uLL));
  v12 = vmulq_f32(v7, vsubq_f32(v10, v11));
  result = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2), vaddq_f32(v12, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v12.f32, 1))).f32[0];
  v14 = vmulq_f32(vaddq_f32(vabsq_f32(v10), vabsq_f32(v11)), vabdq_f32((float32x4_t)v6, (float32x4_t)a4));
  v15 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 2), vaddq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 1))).f32[0];
  if (result <= (float)(0.00000041723 * v15) && (float)(0.00000041723 * v15) >= (float)-result)
  {
    v289 = v15;
    v276 = v6.f32[1];
    v17 = v6.f32[1] - a4.f32[1];
    v277 = a2.f32[1];
    v280 = a4.f32[1];
    v278 = a3.f32[1];
    v18 = a3.f32[1] - a4.f32[1];
    v281 = (float32x4_t)v6;
    v19 = (float)(a3.f32[1] - a4.f32[1]) * *(float *)v8.i32;
    v304 = v7;
    v20 = (float)(4096.0 * *(float *)v8.i32) - (float)((float)(4096.0 * *(float *)v8.i32) - *(float *)v8.i32);
    v21 = (float)((float)(a3.f32[1] - a4.f32[1]) * 4096.0)
        - (float)((float)((float)(a3.f32[1] - a4.f32[1]) * 4096.0) - (float)(a3.f32[1] - a4.f32[1]));
    v22 = (float)(a3.f32[1] - a4.f32[1]) - v21;
    v295 = v20;
    v296 = *(float *)v8.i32 - v20;
    v23 = -(float)((float)((float)((float)(v19 - (float)(v20 * v21)) - (float)((float)(*(float *)v8.i32 - v20) * v21))
                         - (float)(v20 * v22))
                 - (float)((float)(*(float *)v8.i32 - v20) * v22));
    v299 = a2.f32[1] - a4.f32[1];
    v6.f32[0] = (float)(a2.f32[1] - a4.f32[1]) * *(float *)v9.i32;
    v24 = (float)(4096.0 * *(float *)v9.i32) - (float)((float)(4096.0 * *(float *)v9.i32) - *(float *)v9.i32);
    v25 = *(float *)v9.i32 - v24;
    v26 = (float)((float)(a2.f32[1] - a4.f32[1]) * 4096.0)
        - (float)((float)((float)(a2.f32[1] - a4.f32[1]) * 4096.0) - (float)(a2.f32[1] - a4.f32[1]));
    v293 = (float)(a2.f32[1] - a4.f32[1]) - v26;
    v294 = v26;
    v27 = -(float)((float)((float)((float)(v6.f32[0] - (float)(v24 * v26))
                                 - (float)((float)(*(float *)v9.i32 - v24) * v26))
                         - (float)(v24 * v293))
                 - (float)((float)(*(float *)v9.i32 - v24) * v293));
    v28 = v23 - v27;
    v29 = (float)((float)(v23 - (float)(v23 - v27)) - v27)
        + (float)(v23 - (float)((float)(v23 - v27) + (float)(v23 - (float)(v23 - v27))));
    v30 = v19 + v28;
    v31 = (float)(v28 - (float)((float)(v19 + v28) - v19))
        + (float)(v19 - (float)((float)(v19 + v28) - (float)((float)(v19 + v28) - v19)));
    v282 = a2;
    v279 = v6.f32[2];
    v348[0] = v29;
    v348[1] = (float)((float)(v31 - (float)(v31 - v6.f32[0])) - v6.f32[0])
            + (float)(v31 - (float)((float)(v31 - v6.f32[0]) + (float)(v31 - (float)(v31 - v6.f32[0]))));
    v272 = v6.f32[0];
    v273 = a2.f32[2];
    v348[2] = (float)((float)(v31 - v6.f32[0]) - (float)((float)(v30 + (float)(v31 - v6.f32[0])) - v30))
            + (float)(v30
                    - (float)((float)(v30 + (float)(v31 - v6.f32[0]))
                            - (float)((float)(v30 + (float)(v31 - v6.f32[0])) - v30)));
    v348[3] = v30 + (float)(v31 - v6.f32[0]);
    v286 = a3;
    v274 = a3.f32[2];
    v275 = a4.f32[2];
    v297 = a3.f32[2] - a4.f32[2];
    v298 = a2.f32[2] - a4.f32[2];
    v288 = v6.f32[2] - a4.f32[2];
    v300 = (float32x4_t)v8;
    v302 = (float32x4_t)v9;
    v32 = sub_1DEE65BF8(4, v348, v345, v6.f32[2] - a4.f32[2]);
    v33 = v17;
    v291 = v17;
    v34 = v17 * v302.f32[0];
    v35 = (float)(v17 * 4096.0) - (float)((float)(v17 * 4096.0) - v17);
    v36 = v33 - v35;
    v269 = v24;
    v270 = v25;
    v37 = -(float)((float)((float)((float)(v34 - (float)(v24 * v35)) - (float)(v25 * v35))
                         - (float)(v24 * (float)(v33 - v35)))
                 - (float)(v25 * (float)(v33 - v35)));
    v38 = v18;
    v39 = v18 * v304.f32[0];
    v40 = (float)(4096.0 * v304.f32[0]) - (float)((float)(4096.0 * v304.f32[0]) - v304.f32[0]);
    v267 = v22;
    v268 = v21;
    v41 = -(float)((float)((float)((float)(v39 - (float)(v40 * v21)) - (float)((float)(v304.f32[0] - v40) * v21))
                         - (float)(v40 * v22))
                 - (float)((float)(v304.f32[0] - v40) * v22));
    v42 = v37 - v41;
    v43 = (float)((float)(v37 - (float)(v37 - v41)) - v41)
        + (float)(v37 - (float)((float)(v37 - v41) + (float)(v37 - (float)(v37 - v41))));
    v44 = v34 + v42;
    v45 = (float)(v42 - (float)((float)(v34 + v42) - v34))
        + (float)(v34 - (float)((float)(v34 + v42) - (float)((float)(v34 + v42) - v34)));
    v46 = v45 - v39;
    v347[0] = v43;
    v347[1] = (float)((float)(v45 - (float)(v45 - v39)) - v39)
            + (float)(v45 - (float)((float)(v45 - v39) + (float)(v45 - (float)(v45 - v39))));
    v47 = v44 + (float)(v45 - v39);
    v347[2] = (float)(v46 - (float)(v47 - v44)) + (float)(v44 - (float)(v47 - (float)(v47 - v44)));
    v347[3] = v47;
    v48 = sub_1DEE65BF8(4, v347, v344, v298);
    v49 = v304.f32[0] - v40;
    v271 = v35;
    v50 = -(float)((float)((float)((float)((float)(v299 * v304.f32[0]) - (float)(v40 * v294)) - (float)(v49 * v294))
                         - (float)(v40 * v293))
                 - (float)(v49 * v293));
    v51 = -(float)((float)((float)((float)((float)(v291 * v300.f32[0]) - (float)(v295 * v35)) - (float)(v296 * v35))
                         - (float)(v295 * v36))
                 - (float)(v296 * v36));
    v52 = v50 - v51;
    v53 = (float)((float)(v50 - (float)(v50 - v51)) - v51)
        + (float)(v50 - (float)((float)(v50 - v51) + (float)(v50 - (float)(v50 - v51))));
    v54 = (float)(v299 * v304.f32[0]) + v52;
    v55 = (float)(v52 - (float)(v54 - (float)(v299 * v304.f32[0])))
        + (float)((float)(v299 * v304.f32[0]) - (float)(v54 - (float)(v54 - (float)(v299 * v304.f32[0]))));
    v56 = v55 - (float)(v291 * v300.f32[0]);
    v346[0] = v53;
    v346[1] = (float)((float)(v55 - v56) - (float)(v291 * v300.f32[0]))
            + (float)(v55 - (float)(v56 + (float)(v55 - v56)));
    v346[2] = (float)(v56 - (float)((float)(v54 + v56) - v54))
            + (float)(v54 - (float)((float)(v54 + v56) - (float)((float)(v54 + v56) - v54)));
    v346[3] = v54 + v56;
    v57 = sub_1DEE65BF8(4, v346, v343, v297);
    v58 = sub_1DEE659F0(v32, v345, v48, v344, v342);
    v59 = sub_1DEE659F0(v58, v342, v57, v343, &v340);
    v60 = v59;
    result = v340;
    if (v59 < 2)
    {
      v64 = v300;
      v63 = v302;
      v65 = v299;
      v66 = v304;
      v67 = v291;
      v68 = v289;
    }
    else
    {
      v61 = v59 - 1;
      v62 = (float *)&v341;
      v64 = v300;
      v63 = v302;
      v65 = v299;
      v66 = v304;
      v67 = v291;
      v68 = v289;
      do
      {
        v69 = *v62++;
        result = result + v69;
        --v61;
      }
      while (v61);
    }
    if (result < (float)(v68 * 0.00000017881) && (float)(v68 * 0.00000017881) > (float)-result)
    {
      v71 = v39;
      v72 = vsubq_f32(v281, v66);
      v73 = vaddq_f32(vsubq_f32(v72, (float32x4_t)a4), vsubq_f32(v281, vaddq_f32(v66, v72))).f32[0];
      v74 = vsubq_f32((float32x4_t)v282, v64);
      LODWORD(v75) = vaddq_f32(vsubq_f32(v74, (float32x4_t)a4), vsubq_f32((float32x4_t)v282, vaddq_f32(v64, v74))).u32[0];
      v76 = vsubq_f32((float32x4_t)v286, v63);
      LODWORD(v77) = vaddq_f32(vsubq_f32(v76, (float32x4_t)a4), vsubq_f32((float32x4_t)v286, vaddq_f32(v63, v76))).u32[0];
      v78 = (float)((float)(v276 - v67) - v280) + (float)(v276 - (float)(v67 + (float)(v276 - v67)));
      v79 = (float)((float)(v277 - v65) - v280) + (float)(v277 - (float)(v65 + (float)(v277 - v65)));
      v80 = (float)((float)(v278 - v38) - v280) + (float)(v278 - (float)(v38 + (float)(v278 - v38)));
      v81 = (float)((float)(v279 - v288) - v275) + (float)(v279 - (float)(v288 + (float)(v279 - v288)));
      v82 = (float)((float)(v273 - v298) - v275) + (float)(v273 - (float)(v298 + (float)(v273 - v298)));
      v83 = (float)((float)(v274 - v297) - v275) + (float)(v274 - (float)(v297 + (float)(v274 - v297)));
      if (v73 != 0.0
        || v75 != 0.0
        || v77 != 0.0
        || v78 != 0.0
        || v79 != 0.0
        || v80 != 0.0
        || v81 != 0.0
        || v82 != 0.0
        || v83 != 0.0)
      {
        v84 = (float)(fabsf(result) * 0.00000017881) + (float)(v68 * 9.2371e-14);
        v85 = v38 * v75;
        v86 = v63.f32[0] * v79;
        v87 = v67 * v77;
        v88 = v66.f32[0] * v80;
        v89 = v65 * v73;
        v90 = v64.f32[0] * v78;
        result = (float)((float)((float)((float)-(float)((float)(v291 * v300.f32[0]) - (float)(v66.f32[0] * v65)) * v83)
                               + (float)(v297
                                       * (float)((float)((float)(v65 * v73) + (float)(v66.f32[0] * v79))
                                               - (float)((float)(v64.f32[0] * v78) + (float)(v67 * v75)))))
                       + (float)((float)((float)((float)-(float)(v272 - (float)(v64.f32[0] * v38)) * v81)
                                       + (float)(v288
                                               * (float)((float)((float)(v38 * v75) + (float)(v64.f32[0] * v80))
                                                       - (float)((float)(v63.f32[0] * v79) + (float)(v65 * v77)))))
                               + (float)((float)((float)-(float)(v71 - (float)(v63.f32[0] * v67)) * v82)
                                       + (float)(v298
                                               * (float)((float)((float)(v67 * v77) + (float)(v63.f32[0] * v78))
                                                       - (float)((float)(v66.f32[0] * v80) + (float)(v38 * v73)))))))
               + result;
        if (result < v84 && v84 > (float)-result)
        {
          v290 = (float)((float)(v279 - v288) - v275) + (float)(v279 - (float)(v288 + (float)(v279 - v288)));
          if (v73 == 0.0)
          {
            if (v78 == 0.0)
            {
              v335 = 0.0;
              v331 = 0.0;
              v92 = 1;
              goto LABEL_37;
            }
            v335 = -(float)((float)((float)((float)((float)-(float)(v78 * v64.f32[0])
                                                  - (float)((float)((float)(v78 * -4096.0)
                                                                  - (float)(v78 + (float)(v78 * -4096.0)))
                                                          * v295))
                                          - (float)((float)((float)-v78
                                                          - (float)((float)(v78 * -4096.0)
                                                                  - (float)(v78 + (float)(v78 * -4096.0))))
                                                  * v295))
                                  - (float)((float)((float)(v78 * -4096.0) - (float)(v78 + (float)(v78 * -4096.0)))
                                          * v296))
                          - (float)((float)((float)-v78
                                          - (float)((float)(v78 * -4096.0) - (float)(v78 + (float)(v78 * -4096.0))))
                                  * v296));
            v336 = -(float)(v78 * v64.f32[0]);
            v331 = -(float)((float)((float)((float)((float)(v63.f32[0] * v78)
                                                  - (float)((float)((float)(v78 * 4096.0)
                                                                  - (float)((float)(v78 * 4096.0) - v78))
                                                          * v269))
                                          - (float)((float)(v78
                                                          - (float)((float)(v78 * 4096.0)
                                                                  - (float)((float)(v78 * 4096.0) - v78)))
                                                  * v269))
                                  - (float)((float)((float)(v78 * 4096.0) - (float)((float)(v78 * 4096.0) - v78)) * v270))
                          - (float)((float)(v78 - (float)((float)(v78 * 4096.0) - (float)((float)(v78 * 4096.0) - v78)))
                                  * v270));
            v332 = v63.f32[0] * v78;
          }
          else
          {
            v93 = (float)(v73 * 4096.0) - (float)((float)(v73 * 4096.0) - v73);
            v94 = -(float)((float)((float)((float)(v89 - (float)(v93 * v294)) - (float)((float)(v73 - v93) * v294))
                                 - (float)(v93 * v293))
                         - (float)((float)(v73 - v93) * v293));
            if (v78 != 0.0)
            {
              v95 = (float)(v78 * 4096.0) - (float)((float)(v78 * 4096.0) - v78);
              v96 = -(float)((float)((float)((float)(v90 - (float)(v95 * v295)) - (float)((float)(v78 - v95) * v295))
                                   - (float)(v95 * v296))
                           - (float)((float)(v78 - v95) * v296));
              v97 = v94 - v96;
              v98 = (float)((float)(v94 - (float)(v94 - v96)) - v96)
                  + (float)(v94 - (float)((float)(v94 - v96) + (float)(v94 - (float)(v94 - v96))));
              v99 = v89 + v97;
              v100 = (float)(v97 - (float)((float)(v89 + v97) - v89))
                   + (float)(v89 - (float)((float)(v89 + v97) - (float)((float)(v89 + v97) - v89)));
              v101 = v100 - v90;
              v102 = v100 - (float)(v100 - v90);
              v103 = (float)(v100 - v90) + v102;
              v104 = v102 - v90;
              v67 = v291;
              v335 = v98;
              v336 = v104 + (float)(v100 - v103);
              v105 = v99 + v101;
              v106 = (float)(v99 + v101) - v99;
              v107 = (float)(v99 + v101) - v106;
              v108 = v101 - v106;
              v63.i32[0] = v302.i32[0];
              v337 = v108 + (float)(v99 - v107);
              v338 = v105;
              v109 = -(float)((float)((float)((float)((float)(v302.f32[0] * v78) - (float)(v95 * v269))
                                            - (float)((float)(v78 - v95) * v269))
                                    - (float)(v95 * v270))
                            - (float)((float)(v78 - v95) * v270));
              v110 = -(float)((float)((float)((float)((float)(v38 * v73) + (float)((float)-v93 * v268))
                                            + (float)((float)-(float)(v73 - v93) * v268))
                                    + (float)((float)-v93 * v267))
                            - (float)((float)(v73 - v93) * v267));
              v111 = v109 - v110;
              v112 = (float)((float)(v109 - (float)(v109 - v110)) - v110)
                   + (float)(v109 - (float)((float)(v109 - v110) + (float)(v109 - (float)(v109 - v110))));
              v113 = (float)(v302.f32[0] * v78) + v111;
              v114 = (float)(v111 - (float)(v113 - (float)(v302.f32[0] * v78)))
                   + (float)((float)(v302.f32[0] * v78) - (float)(v113 - (float)(v113 - (float)(v302.f32[0] * v78))));
              v115 = v114 - (float)(v38 * v73);
              v331 = v112;
              v332 = (float)((float)(v114 - v115) - (float)(v38 * v73))
                   + (float)(v114 - (float)(v115 + (float)(v114 - v115)));
              v333 = (float)(v115 - (float)((float)(v113 + v115) - v113))
                   + (float)(v113 - (float)((float)(v113 + v115) - (float)((float)(v113 + v115) - v113)));
              v334 = v113 + v115;
              v92 = 4;
LABEL_37:
              if (v75 == 0.0)
              {
                if (v79 == 0.0)
                {
                  v327 = 0.0;
                  v323 = 0.0;
                  v116 = 1;
                  goto LABEL_45;
                }
                v327 = -(float)((float)((float)((float)((float)-(float)(v79 * v63.f32[0])
                                                      - (float)((float)((float)(v79 * -4096.0)
                                                                      - (float)(v79 + (float)(v79 * -4096.0)))
                                                              * v269))
                                              - (float)((float)((float)-v79
                                                              - (float)((float)(v79 * -4096.0)
                                                                      - (float)(v79 + (float)(v79 * -4096.0))))
                                                      * v269))
                                      - (float)((float)((float)(v79 * -4096.0) - (float)(v79 + (float)(v79 * -4096.0)))
                                              * v270))
                              - (float)((float)((float)-v79
                                              - (float)((float)(v79 * -4096.0) - (float)(v79 + (float)(v79 * -4096.0))))
                                      * v270));
                v328 = -(float)(v79 * v63.f32[0]);
                v323 = -(float)((float)((float)((float)((float)(v66.f32[0] * v79)
                                                      - (float)((float)((float)(v79 * 4096.0)
                                                                      - (float)((float)(v79 * 4096.0) - v79))
                                                              * v40))
                                              - (float)((float)(v79
                                                              - (float)((float)(v79 * 4096.0)
                                                                      - (float)((float)(v79 * 4096.0) - v79)))
                                                      * v40))
                                      - (float)((float)((float)(v79 * 4096.0) - (float)((float)(v79 * 4096.0) - v79))
                                              * v49))
                              - (float)((float)(v79
                                              - (float)((float)(v79 * 4096.0) - (float)((float)(v79 * 4096.0) - v79)))
                                      * v49));
                v324 = v66.f32[0] * v79;
              }
              else
              {
                v117 = (float)(v75 * 4096.0) - (float)((float)(v75 * 4096.0) - v75);
                v118 = -(float)((float)((float)((float)(v85 - (float)(v117 * v268)) - (float)((float)(v75 - v117) * v268))
                                      - (float)(v117 * v267))
                              - (float)((float)(v75 - v117) * v267));
                if (v79 != 0.0)
                {
                  v119 = (float)(v79 * 4096.0) - (float)((float)(v79 * 4096.0) - v79);
                  v120 = -(float)((float)((float)((float)(v86 - (float)(v119 * v269))
                                                - (float)((float)(v79 - v119) * v269))
                                        - (float)(v119 * v270))
                                - (float)((float)(v79 - v119) * v270));
                  v121 = v118 - v120;
                  v122 = (float)((float)(v118 - (float)(v118 - v120)) - v120)
                       + (float)(v118 - (float)((float)(v118 - v120) + (float)(v118 - (float)(v118 - v120))));
                  v123 = v85 + v121;
                  v124 = (float)(v121 - (float)((float)(v85 + v121) - v85))
                       + (float)(v85 - (float)((float)(v85 + v121) - (float)((float)(v85 + v121) - v85)));
                  v125 = v124 - v86;
                  v327 = v122;
                  v328 = (float)((float)(v124 - (float)(v124 - v86)) - v86)
                       + (float)(v124 - (float)((float)(v124 - v86) + (float)(v124 - (float)(v124 - v86))));
                  v126 = v123 + (float)(v124 - v86);
                  v329 = (float)(v125 - (float)(v126 - v123)) + (float)(v123 - (float)(v126 - (float)(v126 - v123)));
                  v330 = v126;
                  v127 = -(float)((float)((float)((float)((float)(v66.f32[0] * v79) - (float)(v119 * v40))
                                                - (float)((float)(v79 - v119) * v40))
                                        - (float)(v119 * v49))
                                - (float)((float)(v79 - v119) * v49));
                  v128 = -(float)((float)((float)((float)((float)(v67 * v75) + (float)((float)-v117 * v271))
                                                + (float)((float)-(float)(v75 - v117) * v271))
                                        + (float)((float)-v117 * v36))
                                - (float)((float)(v75 - v117) * v36));
                  v129 = v127 - v128;
                  v130 = (float)((float)(v127 - (float)(v127 - v128)) - v128)
                       + (float)(v127 - (float)((float)(v127 - v128) + (float)(v127 - (float)(v127 - v128))));
                  v131 = (float)(v66.f32[0] * v79) + v129;
                  v132 = (float)(v129 - (float)(v131 - (float)(v66.f32[0] * v79)))
                       + (float)((float)(v66.f32[0] * v79) - (float)(v131 - (float)(v131 - (float)(v66.f32[0] * v79))));
                  v133 = v132 - (float)(v67 * v75);
                  v323 = v130;
                  v324 = (float)((float)(v132 - v133) - (float)(v67 * v75))
                       + (float)(v132 - (float)(v133 + (float)(v132 - v133)));
                  v325 = (float)(v133 - (float)((float)(v131 + v133) - v131))
                       + (float)(v131 - (float)((float)(v131 + v133) - (float)((float)(v131 + v133) - v131)));
                  v326 = v131 + v133;
                  v116 = 4;
LABEL_45:
                  v303 = (float)((float)(v274 - v297) - v275) + (float)(v274 - (float)(v297 + (float)(v274 - v297)));
                  v301 = (float)((float)(v273 - v298) - v275) + (float)(v273 - (float)(v298 + (float)(v273 - v298)));
                  v292 = v77;
                  v285 = v73;
                  v287 = v75;
                  v283 = (float)((float)(v278 - v38) - v280) + (float)(v278 - (float)(v38 + (float)(v278 - v38)));
                  if (v77 == 0.0)
                  {
                    if (v80 == 0.0)
                    {
                      v319 = 0.0;
                      v315 = 0.0;
                      v134 = 1;
                    }
                    else
                    {
                      v319 = -(float)((float)((float)((float)((float)-(float)(v80 * v66.f32[0])
                                                            - (float)((float)((float)(v80 * -4096.0)
                                                                            - (float)(v80 + (float)(v80 * -4096.0)))
                                                                    * v40))
                                                    - (float)((float)((float)-v80
                                                                    - (float)((float)(v80 * -4096.0)
                                                                            - (float)(v80 + (float)(v80 * -4096.0))))
                                                            * v40))
                                            - (float)((float)((float)(v80 * -4096.0)
                                                            - (float)(v80 + (float)(v80 * -4096.0)))
                                                    * v49))
                                    - (float)((float)((float)-v80
                                                    - (float)((float)(v80 * -4096.0)
                                                            - (float)(v80 + (float)(v80 * -4096.0))))
                                            * v49));
                      v320 = -(float)(v80 * v66.f32[0]);
                      v315 = -(float)((float)((float)((float)((float)(v64.f32[0] * v80)
                                                            - (float)((float)((float)(v80 * 4096.0)
                                                                            - (float)((float)(v80 * 4096.0) - v80))
                                                                    * v295))
                                                    - (float)((float)(v80
                                                                    - (float)((float)(v80 * 4096.0)
                                                                            - (float)((float)(v80 * 4096.0) - v80)))
                                                            * v295))
                                            - (float)((float)((float)(v80 * 4096.0)
                                                            - (float)((float)(v80 * 4096.0) - v80))
                                                    * v296))
                                    - (float)((float)(v80
                                                    - (float)((float)(v80 * 4096.0)
                                                            - (float)((float)(v80 * 4096.0) - v80)))
                                            * v296));
                      v316 = v64.f32[0] * v80;
                      v134 = 2;
                    }
                  }
                  else
                  {
                    v135 = (float)(v77 * 4096.0) - (float)((float)(v77 * 4096.0) - v77);
                    v136 = -(float)((float)((float)((float)(v87 - (float)(v135 * v271))
                                                  - (float)((float)(v77 - v135) * v271))
                                          - (float)(v135 * v36))
                                  - (float)((float)(v77 - v135) * v36));
                    if (v80 == 0.0)
                    {
                      v319 = -(float)((float)((float)((float)(v87 - (float)(v135 * v271))
                                                    - (float)((float)(v77 - v135) * v271))
                                            - (float)(v135 * v36))
                                    - (float)((float)(v77 - v135) * v36));
                      v320 = v87;
                      v315 = -(float)((float)((float)((float)((float)-(float)(v77 * v65)
                                                            - (float)((float)((float)(v77 * -4096.0)
                                                                            - (float)(v77 + (float)(v77 * -4096.0)))
                                                                    * v294))
                                                    - (float)((float)((float)-v77
                                                                    - (float)((float)(v77 * -4096.0)
                                                                            - (float)(v77 + (float)(v77 * -4096.0))))
                                                            * v294))
                                            - (float)((float)((float)(v77 * -4096.0)
                                                            - (float)(v77 + (float)(v77 * -4096.0)))
                                                    * v293))
                                    - (float)((float)((float)-v77
                                                    - (float)((float)(v77 * -4096.0)
                                                            - (float)(v77 + (float)(v77 * -4096.0))))
                                            * v293));
                      v316 = -(float)(v77 * v65);
                      v134 = 2;
                    }
                    else
                    {
                      v137 = (float)(v80 * 4096.0) - (float)((float)(v80 * 4096.0) - v80);
                      v138 = -(float)((float)((float)((float)(v88 - (float)(v137 * v40))
                                                    - (float)((float)(v80 - v137) * v40))
                                            - (float)(v137 * v49))
                                    - (float)((float)(v80 - v137) * v49));
                      v139 = v136 - v138;
                      v140 = (float)((float)(v136 - (float)(v136 - v138)) - v138)
                           + (float)(v136 - (float)((float)(v136 - v138) + (float)(v136 - (float)(v136 - v138))));
                      v141 = v87 + v139;
                      v142 = (float)(v139 - (float)((float)(v87 + v139) - v87))
                           + (float)(v87 - (float)((float)(v87 + v139) - (float)((float)(v87 + v139) - v87)));
                      v143 = v142 - v88;
                      v319 = v140;
                      v320 = (float)((float)(v142 - (float)(v142 - v88)) - v88)
                           + (float)(v142 - (float)((float)(v142 - v88) + (float)(v142 - (float)(v142 - v88))));
                      v144 = v141 + (float)(v142 - v88);
                      v321 = (float)(v143 - (float)(v144 - v141)) + (float)(v141 - (float)(v144 - (float)(v144 - v141)));
                      v322 = v144;
                      v145 = -(float)((float)((float)((float)((float)(v64.f32[0] * v80) - (float)(v137 * v295))
                                                    - (float)((float)(v80 - v137) * v295))
                                            - (float)(v137 * v296))
                                    - (float)((float)(v80 - v137) * v296));
                      v146 = -(float)((float)((float)((float)((float)(v65 * v77) + (float)((float)-v135 * v294))
                                                    + (float)((float)-(float)(v77 - v135) * v294))
                                            + (float)((float)-v135 * v293))
                                    - (float)((float)(v77 - v135) * v293));
                      v147 = v145 - v146;
                      v148 = (float)((float)(v145 - (float)(v145 - v146)) - v146)
                           + (float)(v145 - (float)((float)(v145 - v146) + (float)(v145 - (float)(v145 - v146))));
                      v149 = (float)(v64.f32[0] * v80) + v147;
                      v150 = (float)(v147 - (float)(v149 - (float)(v64.f32[0] * v80)))
                           + (float)((float)(v64.f32[0] * v80)
                                   - (float)(v149 - (float)(v149 - (float)(v64.f32[0] * v80))));
                      v151 = v150 - (float)(v65 * v77);
                      v315 = v148;
                      v316 = (float)((float)(v150 - v151) - (float)(v65 * v77))
                           + (float)(v150 - (float)(v151 + (float)(v150 - v151)));
                      v317 = (float)(v151 - (float)((float)(v149 + v151) - v149))
                           + (float)(v149 - (float)((float)(v149 + v151) - (float)((float)(v149 + v151) - v149)));
                      v318 = v149 + v151;
                      v134 = 4;
                    }
                  }
                  v152 = sub_1DEE659F0(v116, &v327, v134, &v315, v314);
                  v153 = sub_1DEE65BF8(v152, v314, v306, v288);
                  v154 = &v340;
                  v155 = v339;
                  v156 = sub_1DEE659F0(v60, &v340, v153, v306, v339);
                  v157 = sub_1DEE659F0(v134, &v319, v92, &v331, v313);
                  v158 = sub_1DEE65BF8(v157, v313, v306, v298);
                  v159 = sub_1DEE659F0(v156, v339, v158, v306, &v340);
                  v160 = sub_1DEE659F0(v92, &v335, v116, &v323, v312);
                  v161 = sub_1DEE65BF8(v160, v312, v306, v297);
                  v162 = sub_1DEE659F0(v159, &v340, v161, v306, v339);
                  if (v290 != 0.0)
                  {
                    v163 = sub_1DEE65BF8(4, v348, v307, v290);
                    v154 = v339;
                    v155 = &v340;
                    v162 = sub_1DEE659F0(v162, v339, v163, v307, &v340);
                  }
                  if (v301 == 0.0)
                  {
                    v165 = v154;
                    v154 = v155;
                  }
                  else
                  {
                    v164 = sub_1DEE65BF8(4, v347, v307, v301);
                    v162 = sub_1DEE659F0(v162, v155, v164, v307, v154);
                    v165 = v155;
                  }
                  if (v303 == 0.0)
                  {
                    v167 = v165;
                    v165 = v154;
                  }
                  else
                  {
                    v166 = sub_1DEE65BF8(4, v346, v307, v303);
                    v162 = sub_1DEE659F0(v162, v154, v166, v307, v165);
                    v167 = v154;
                  }
                  v168 = v292;
                  v170 = v285;
                  v169 = v287;
                  v305 = v79;
                  v171 = v78;
                  if (v285 != 0.0)
                  {
                    if (v79 == 0.0)
                    {
                      v187 = v167;
                      v188 = (float)((float)(v278 - v38) - v280) + (float)(v278 - (float)(v38 + (float)(v278 - v38)));
                    }
                    else
                    {
                      v172 = v79;
                      v173 = v285 * v79;
                      v174 = (float)(v285 * 4096.0) - (float)((float)(v285 * 4096.0) - v285);
                      v175 = -(float)((float)((float)((float)(v173
                                                            - (float)(v174
                                                                    * (float)((float)(v172 * 4096.0)
                                                                            - (float)((float)(v172 * 4096.0) - v172))))
                                                    - (float)((float)(v285 - v174)
                                                            * (float)((float)(v172 * 4096.0)
                                                                    - (float)((float)(v172 * 4096.0) - v172))))
                                            - (float)(v174
                                                    * (float)(v172
                                                            - (float)((float)(v172 * 4096.0)
                                                                    - (float)((float)(v172 * 4096.0) - v172)))))
                                    - (float)((float)(v285 - v174)
                                            * (float)(v172
                                                    - (float)((float)(v172 * 4096.0)
                                                            - (float)((float)(v172 * 4096.0) - v172)))));
                      v176 = (float)(v297 * 4096.0) - (float)((float)(v297 * 4096.0) - v297);
                      v177 = (float)(v175 * 4096.0) - (float)((float)(v175 * 4096.0) - v175);
                      v178 = -(float)((float)((float)((float)((float)(v297 * v175) - (float)(v177 * v176))
                                                    - (float)((float)(v175 - v177) * v176))
                                            - (float)(v177 * (float)(v297 - v176)))
                                    - (float)((float)(v175 - v177) * (float)(v297 - v176)));
                      v179 = (float)(v173 * 4096.0) - (float)((float)(v173 * 4096.0) - v173);
                      v180 = v173 - v179;
                      v181 = -(float)((float)((float)((float)((float)(v297 * v173) - (float)(v179 * v176))
                                                    - (float)((float)(v173 - v179) * v176))
                                            - (float)(v179 * (float)(v297 - v176)))
                                    - (float)((float)(v173 - v179) * (float)(v297 - v176)));
                      v182 = (float)(v297 * v175) + v181;
                      v308 = v178;
                      v309 = (float)(v181 - (float)(v182 - (float)(v297 * v175)))
                           + (float)((float)(v297 * v175) - (float)(v182 - (float)(v182 - (float)(v297 * v175))));
                      v310 = v182 - (float)((float)((float)(v297 * v173) + v182) - (float)(v297 * v173));
                      v311 = (float)(v297 * v173) + v182;
                      v183 = sub_1DEE659F0(v162, v165, 4, &v308, v167);
                      v162 = v183;
                      if (v303 == 0.0)
                      {
                        v187 = v165;
                        v165 = v167;
                      }
                      else
                      {
                        v184 = (float)(v303 * 4096.0) - (float)((float)(v303 * 4096.0) - v303);
                        v185 = (float)(v303 * v173) + (float)((float)-v179 * v184);
                        v186 = (float)(v303 * v175)
                             - (float)((float)((float)(v185 + (float)((float)-v180 * v184))
                                             + (float)((float)-v179 * (float)(v303 - v184)))
                                     - (float)(v180 * (float)(v303 - v184)));
                        v308 = -(float)((float)((float)((float)((float)(v303 * v175) + (float)((float)-v177 * v184))
                                                      + (float)((float)-(float)(v175 - v177) * v184))
                                              + (float)((float)-v177 * (float)(v303 - v184)))
                                      - (float)((float)(v175 - v177) * (float)(v303 - v184)));
                        v309 = (float)((float)-(float)((float)((float)(v185 + (float)((float)-v180 * v184))
                                                             + (float)((float)-v179 * (float)(v303 - v184)))
                                                     - (float)(v180 * (float)(v303 - v184)))
                                     - (float)(v186 - (float)(v303 * v175)))
                             + (float)((float)(v303 * v175) - (float)(v186 - (float)(v186 - (float)(v303 * v175))));
                        v310 = v186 - (float)((float)((float)(v303 * v173) + v186) - (float)(v303 * v173));
                        v311 = (float)(v303 * v173) + v186;
                        v162 = sub_1DEE659F0(v183, v167, 4, &v308, v165);
                        v187 = v167;
                      }
                      v168 = v292;
                      v79 = v305;
                      v78 = v171;
                      v188 = v283;
                      v170 = v285;
                    }
                    if (v188 == 0.0)
                    {
                      v167 = v187;
                      v169 = v287;
                      goto LABEL_74;
                    }
                    v189 = -(float)(v170 * v188);
                    v190 = (float)(v170 * -4096.0) - (float)(v170 + (float)(v170 * -4096.0));
                    v191 = -(float)((float)((float)((float)(v189
                                                          - (float)(v190
                                                                  * (float)((float)(v188 * 4096.0)
                                                                          - (float)((float)(v188 * 4096.0) - v188))))
                                                  - (float)((float)((float)-v170 - v190)
                                                          * (float)((float)(v188 * 4096.0)
                                                                  - (float)((float)(v188 * 4096.0) - v188))))
                                          - (float)(v190
                                                  * (float)(v188
                                                          - (float)((float)(v188 * 4096.0)
                                                                  - (float)((float)(v188 * 4096.0) - v188)))))
                                  - (float)((float)((float)-v170 - v190)
                                          * (float)(v188
                                                  - (float)((float)(v188 * 4096.0)
                                                          - (float)((float)(v188 * 4096.0) - v188)))));
                    v192 = (float)(v298 * 4096.0) - (float)((float)(v298 * 4096.0) - v298);
                    v193 = (float)(v191 * 4096.0) - (float)((float)(v191 * 4096.0) - v191);
                    v194 = -(float)((float)((float)((float)((float)(v298 * v191) - (float)(v193 * v192))
                                                  - (float)((float)(v191 - v193) * v192))
                                          - (float)(v193 * (float)(v298 - v192)))
                                  - (float)((float)(v191 - v193) * (float)(v298 - v192)));
                    v195 = (float)(v189 * 4096.0) - (float)((float)(v189 * 4096.0) - v189);
                    v196 = v189 - v195;
                    v197 = -(float)((float)((float)((float)((float)(v298 * v189) - (float)(v195 * v192))
                                                  - (float)((float)(v189 - v195) * v192))
                                          - (float)(v195 * (float)(v298 - v192)))
                                  - (float)((float)(v189 - v195) * (float)(v298 - v192)));
                    v198 = (float)(v298 * v191) + v197;
                    v308 = v194;
                    v309 = (float)(v197 - (float)(v198 - (float)(v298 * v191)))
                         + (float)((float)(v298 * v191) - (float)(v198 - (float)(v198 - (float)(v298 * v191))));
                    v310 = v198 - (float)((float)((float)(v298 * v189) + v198) - (float)(v298 * v189));
                    v311 = (float)(v298 * v189) + v198;
                    v199 = sub_1DEE659F0(v162, v165, 4, &v308, v187);
                    v162 = v199;
                    if (v301 == 0.0)
                    {
                      v167 = v165;
                      v165 = v187;
                    }
                    else
                    {
                      v200 = (float)(v301 * 4096.0) - (float)((float)(v301 * 4096.0) - v301);
                      v201 = (float)(v301 * v189) + (float)((float)-v195 * v200);
                      v202 = (float)(v301 * v191)
                           - (float)((float)((float)(v201 + (float)((float)-v196 * v200))
                                           + (float)((float)-v195 * (float)(v301 - v200)))
                                   - (float)(v196 * (float)(v301 - v200)));
                      v308 = -(float)((float)((float)((float)((float)(v301 * v191) + (float)((float)-v193 * v200))
                                                    + (float)((float)-(float)(v191 - v193) * v200))
                                            + (float)((float)-v193 * (float)(v301 - v200)))
                                    - (float)((float)(v191 - v193) * (float)(v301 - v200)));
                      v309 = (float)((float)-(float)((float)((float)(v201 + (float)((float)-v196 * v200))
                                                           + (float)((float)-v195 * (float)(v301 - v200)))
                                                   - (float)(v196 * (float)(v301 - v200)))
                                   - (float)(v202 - (float)(v301 * v191)))
                           + (float)((float)(v301 * v191) - (float)(v202 - (float)(v202 - (float)(v301 * v191))));
                      v310 = v202 - (float)((float)((float)(v301 * v189) + v202) - (float)(v301 * v189));
                      v311 = (float)(v301 * v189) + v202;
                      v162 = sub_1DEE659F0(v199, v187, 4, &v308, v165);
                      v167 = v187;
                    }
                    v168 = v292;
                    v79 = v305;
                    v78 = v171;
                    v169 = v287;
                  }
                  v188 = v283;
LABEL_74:
                  if (v169 != 0.0)
                  {
                    if (v188 == 0.0)
                    {
                      v217 = v167;
                    }
                    else
                    {
                      v203 = v169 * v188;
                      v204 = (float)(v169 * 4096.0) - (float)((float)(v169 * 4096.0) - v169);
                      v205 = -(float)((float)((float)((float)((float)(v169 * v188)
                                                            - (float)(v204
                                                                    * (float)((float)(v188 * 4096.0)
                                                                            - (float)((float)(v188 * 4096.0) - v188))))
                                                    - (float)((float)(v169 - v204)
                                                            * (float)((float)(v188 * 4096.0)
                                                                    - (float)((float)(v188 * 4096.0) - v188))))
                                            - (float)(v204
                                                    * (float)(v188
                                                            - (float)((float)(v188 * 4096.0)
                                                                    - (float)((float)(v188 * 4096.0) - v188)))))
                                    - (float)((float)(v169 - v204)
                                            * (float)(v188
                                                    - (float)((float)(v188 * 4096.0)
                                                            - (float)((float)(v188 * 4096.0) - v188)))));
                      v206 = (float)(v288 * 4096.0) - (float)((float)(v288 * 4096.0) - v288);
                      v207 = (float)(v205 * 4096.0) - (float)((float)(v205 * 4096.0) - v205);
                      v208 = -(float)((float)((float)((float)((float)(v288 * v205) - (float)(v207 * v206))
                                                    - (float)((float)(v205 - v207) * v206))
                                            - (float)(v207 * (float)(v288 - v206)))
                                    - (float)((float)(v205 - v207) * (float)(v288 - v206)));
                      v209 = (float)(v203 * 4096.0) - (float)((float)(v203 * 4096.0) - v203);
                      v210 = v203 - v209;
                      v211 = -(float)((float)((float)((float)((float)(v288 * v203) - (float)(v209 * v206))
                                                    - (float)((float)(v203 - v209) * v206))
                                            - (float)(v209 * (float)(v288 - v206)))
                                    - (float)((float)(v203 - v209) * (float)(v288 - v206)));
                      v212 = (float)(v288 * v205) + v211;
                      v308 = v208;
                      v309 = (float)(v211 - (float)(v212 - (float)(v288 * v205)))
                           + (float)((float)(v288 * v205) - (float)(v212 - (float)(v212 - (float)(v288 * v205))));
                      v310 = v212 - (float)((float)((float)(v288 * v203) + v212) - (float)(v288 * v203));
                      v311 = (float)(v288 * v203) + v212;
                      v213 = sub_1DEE659F0(v162, v165, 4, &v308, v167);
                      v162 = v213;
                      if (v290 == 0.0)
                      {
                        v217 = v165;
                        v165 = v167;
                      }
                      else
                      {
                        v214 = (float)(v290 * 4096.0) - (float)((float)(v290 * 4096.0) - v290);
                        v215 = (float)(v290 * v203) + (float)((float)-v209 * v214);
                        v216 = (float)(v290 * v205)
                             - (float)((float)((float)(v215 + (float)((float)-v210 * v214))
                                             + (float)((float)-v209 * (float)(v290 - v214)))
                                     - (float)(v210 * (float)(v290 - v214)));
                        v308 = -(float)((float)((float)((float)((float)(v290 * v205) + (float)((float)-v207 * v214))
                                                      + (float)((float)-(float)(v205 - v207) * v214))
                                              + (float)((float)-v207 * (float)(v290 - v214)))
                                      - (float)((float)(v205 - v207) * (float)(v290 - v214)));
                        v309 = (float)((float)-(float)((float)((float)(v215 + (float)((float)-v210 * v214))
                                                             + (float)((float)-v209 * (float)(v290 - v214)))
                                                     - (float)(v210 * (float)(v290 - v214)))
                                     - (float)(v216 - (float)(v290 * v205)))
                             + (float)((float)(v290 * v205) - (float)(v216 - (float)(v216 - (float)(v290 * v205))));
                        v310 = v216 - (float)((float)((float)(v290 * v203) + v216) - (float)(v290 * v203));
                        v311 = (float)(v290 * v203) + v216;
                        v162 = sub_1DEE659F0(v213, v167, 4, &v308, v165);
                        v217 = v167;
                      }
                      v79 = v305;
                      v78 = v171;
                      v169 = v287;
                    }
                    if (v78 == 0.0)
                    {
                      v167 = v217;
                      v168 = v292;
                    }
                    else
                    {
                      v218 = -(float)(v169 * v78);
                      v219 = (float)(v169 * -4096.0) - (float)(v169 + (float)(v169 * -4096.0));
                      v220 = -(float)((float)((float)((float)(v218
                                                            - (float)(v219
                                                                    * (float)((float)(v78 * 4096.0)
                                                                            - (float)((float)(v78 * 4096.0) - v78))))
                                                    - (float)((float)((float)-v169 - v219)
                                                            * (float)((float)(v78 * 4096.0)
                                                                    - (float)((float)(v78 * 4096.0) - v78))))
                                            - (float)(v219
                                                    * (float)(v78
                                                            - (float)((float)(v78 * 4096.0)
                                                                    - (float)((float)(v78 * 4096.0) - v78)))))
                                    - (float)((float)((float)-v169 - v219)
                                            * (float)(v78
                                                    - (float)((float)(v78 * 4096.0)
                                                            - (float)((float)(v78 * 4096.0) - v78)))));
                      v221 = (float)(v297 * 4096.0) - (float)((float)(v297 * 4096.0) - v297);
                      v222 = (float)(v220 * 4096.0) - (float)((float)(v220 * 4096.0) - v220);
                      v223 = -(float)((float)((float)((float)((float)(v297 * v220) - (float)(v222 * v221))
                                                    - (float)((float)(v220 - v222) * v221))
                                            - (float)(v222 * (float)(v297 - v221)))
                                    - (float)((float)(v220 - v222) * (float)(v297 - v221)));
                      v224 = (float)(v218 * 4096.0) - (float)((float)(v218 * 4096.0) - v218);
                      v225 = v218 - v224;
                      v226 = -(float)((float)((float)((float)((float)(v297 * v218) - (float)(v224 * v221))
                                                    - (float)((float)(v218 - v224) * v221))
                                            - (float)(v224 * (float)(v297 - v221)))
                                    - (float)((float)(v218 - v224) * (float)(v297 - v221)));
                      v227 = (float)(v297 * v220) + v226;
                      v308 = v223;
                      v309 = (float)(v226 - (float)(v227 - (float)(v297 * v220)))
                           + (float)((float)(v297 * v220) - (float)(v227 - (float)(v227 - (float)(v297 * v220))));
                      v310 = v227 - (float)((float)((float)(v297 * v218) + v227) - (float)(v297 * v218));
                      v311 = (float)(v297 * v218) + v227;
                      v228 = sub_1DEE659F0(v162, v165, 4, &v308, v217);
                      v162 = v228;
                      if (v303 == 0.0)
                      {
                        v167 = v165;
                        v165 = v217;
                      }
                      else
                      {
                        v229 = (float)(v303 * 4096.0) - (float)((float)(v303 * 4096.0) - v303);
                        v230 = (float)(v303 * v218) + (float)((float)-v224 * v229);
                        v231 = (float)(v303 * v220)
                             - (float)((float)((float)(v230 + (float)((float)-v225 * v229))
                                             + (float)((float)-v224 * (float)(v303 - v229)))
                                     - (float)(v225 * (float)(v303 - v229)));
                        v308 = -(float)((float)((float)((float)((float)(v303 * v220) + (float)((float)-v222 * v229))
                                                      + (float)((float)-(float)(v220 - v222) * v229))
                                              + (float)((float)-v222 * (float)(v303 - v229)))
                                      - (float)((float)(v220 - v222) * (float)(v303 - v229)));
                        v309 = (float)((float)-(float)((float)((float)(v230 + (float)((float)-v225 * v229))
                                                             + (float)((float)-v224 * (float)(v303 - v229)))
                                                     - (float)(v225 * (float)(v303 - v229)))
                                     - (float)(v231 - (float)(v303 * v220)))
                             + (float)((float)(v303 * v220) - (float)(v231 - (float)(v231 - (float)(v303 * v220))));
                        v310 = v231 - (float)((float)((float)(v303 * v218) + v231) - (float)(v303 * v218));
                        v311 = (float)(v303 * v218) + v231;
                        v162 = sub_1DEE659F0(v228, v217, 4, &v308, v165);
                        v167 = v217;
                      }
                      v168 = v292;
                      v79 = v305;
                      v78 = v171;
                    }
                  }
                  if (v168 == 0.0)
                  {
                    v246 = v167;
                  }
                  else
                  {
                    if (v78 == 0.0)
                    {
                      v246 = v167;
                    }
                    else
                    {
                      v232 = v168 * v78;
                      v233 = (float)(v168 * 4096.0) - (float)((float)(v168 * 4096.0) - v168);
                      v234 = -(float)((float)((float)((float)((float)(v168 * v78)
                                                            - (float)(v233
                                                                    * (float)((float)(v78 * 4096.0)
                                                                            - (float)((float)(v78 * 4096.0) - v78))))
                                                    - (float)((float)(v168 - v233)
                                                            * (float)((float)(v78 * 4096.0)
                                                                    - (float)((float)(v78 * 4096.0) - v78))))
                                            - (float)(v233
                                                    * (float)(v78
                                                            - (float)((float)(v78 * 4096.0)
                                                                    - (float)((float)(v78 * 4096.0) - v78)))))
                                    - (float)((float)(v168 - v233)
                                            * (float)(v78
                                                    - (float)((float)(v78 * 4096.0)
                                                            - (float)((float)(v78 * 4096.0) - v78)))));
                      v235 = (float)(v298 * 4096.0) - (float)((float)(v298 * 4096.0) - v298);
                      v236 = (float)(v234 * 4096.0) - (float)((float)(v234 * 4096.0) - v234);
                      v237 = -(float)((float)((float)((float)((float)(v298 * v234) - (float)(v236 * v235))
                                                    - (float)((float)(v234 - v236) * v235))
                                            - (float)(v236 * (float)(v298 - v235)))
                                    - (float)((float)(v234 - v236) * (float)(v298 - v235)));
                      v238 = (float)((float)(v168 * v78) * 4096.0) - (float)((float)(v232 * 4096.0) - v232);
                      v239 = v232 - v238;
                      v240 = -(float)((float)((float)((float)((float)(v298 * v232) - (float)(v238 * v235))
                                                    - (float)((float)(v232 - v238) * v235))
                                            - (float)(v238 * (float)(v298 - v235)))
                                    - (float)((float)(v232 - v238) * (float)(v298 - v235)));
                      v241 = (float)(v298 * v234) + v240;
                      v308 = v237;
                      v309 = (float)(v240 - (float)(v241 - (float)(v298 * v234)))
                           + (float)((float)(v298 * v234) - (float)(v241 - (float)(v241 - (float)(v298 * v234))));
                      v310 = v241 - (float)((float)((float)(v298 * v232) + v241) - (float)(v298 * v232));
                      v311 = (float)(v298 * v232) + v241;
                      v242 = sub_1DEE659F0(v162, v165, 4, &v308, v167);
                      v162 = v242;
                      if (v301 == 0.0)
                      {
                        v246 = v165;
                        v165 = v167;
                      }
                      else
                      {
                        v243 = (float)(v301 * 4096.0) - (float)((float)(v301 * 4096.0) - v301);
                        v244 = (float)(v301 * v232) + (float)((float)-v238 * v243);
                        v245 = (float)(v301 * v234)
                             - (float)((float)((float)(v244 + (float)((float)-v239 * v243))
                                             + (float)((float)-v238 * (float)(v301 - v243)))
                                     - (float)(v239 * (float)(v301 - v243)));
                        v308 = -(float)((float)((float)((float)((float)(v301 * v234) + (float)((float)-v236 * v243))
                                                      + (float)((float)-(float)(v234 - v236) * v243))
                                              + (float)((float)-v236 * (float)(v301 - v243)))
                                      - (float)((float)(v234 - v236) * (float)(v301 - v243)));
                        v309 = (float)((float)-(float)((float)((float)(v244 + (float)((float)-v239 * v243))
                                                             + (float)((float)-v238 * (float)(v301 - v243)))
                                                     - (float)(v239 * (float)(v301 - v243)))
                                     - (float)(v245 - (float)(v301 * v234)))
                             + (float)((float)(v301 * v234) - (float)(v245 - (float)(v245 - (float)(v301 * v234))));
                        v310 = v245 - (float)((float)((float)(v301 * v232) + v245) - (float)(v301 * v232));
                        v311 = (float)(v301 * v232) + v245;
                        v162 = sub_1DEE659F0(v242, v167, 4, &v308, v165);
                        v246 = v167;
                      }
                      v168 = v292;
                      v79 = v305;
                    }
                    if (v79 != 0.0)
                    {
                      v247 = v79;
                      v248 = -(float)(v168 * v79);
                      v249 = (float)(v168 * -4096.0) - (float)(v168 + (float)(v168 * -4096.0));
                      v250 = -(float)((float)((float)((float)(v248
                                                            - (float)(v249
                                                                    * (float)((float)(v247 * 4096.0)
                                                                            - (float)((float)(v247 * 4096.0) - v247))))
                                                    - (float)((float)((float)-v168 - v249)
                                                            * (float)((float)(v247 * 4096.0)
                                                                    - (float)((float)(v247 * 4096.0) - v247))))
                                            - (float)(v249
                                                    * (float)(v247
                                                            - (float)((float)(v247 * 4096.0)
                                                                    - (float)((float)(v247 * 4096.0) - v247)))))
                                    - (float)((float)((float)-v168 - v249)
                                            * (float)(v247
                                                    - (float)((float)(v247 * 4096.0)
                                                            - (float)((float)(v247 * 4096.0) - v247)))));
                      v251 = (float)(v288 * 4096.0) - (float)((float)(v288 * 4096.0) - v288);
                      v252 = (float)(v250 * 4096.0) - (float)((float)(v250 * 4096.0) - v250);
                      v253 = -(float)((float)((float)((float)((float)(v288 * v250) - (float)(v252 * v251))
                                                    - (float)((float)(v250 - v252) * v251))
                                            - (float)(v252 * (float)(v288 - v251)))
                                    - (float)((float)(v250 - v252) * (float)(v288 - v251)));
                      v254 = (float)(v248 * 4096.0) - (float)((float)(v248 * 4096.0) - v248);
                      v255 = v248 - v254;
                      v256 = -(float)((float)((float)((float)((float)(v288 * v248) - (float)(v254 * v251))
                                                    - (float)((float)(v248 - v254) * v251))
                                            - (float)(v254 * (float)(v288 - v251)))
                                    - (float)((float)(v248 - v254) * (float)(v288 - v251)));
                      v257 = (float)(v288 * v250) + v256;
                      v308 = v253;
                      v309 = (float)(v256 - (float)(v257 - (float)(v288 * v250)))
                           + (float)((float)(v288 * v250) - (float)(v257 - (float)(v257 - (float)(v288 * v250))));
                      v310 = v257 - (float)((float)((float)(v288 * v248) + v257) - (float)(v288 * v248));
                      v311 = (float)(v288 * v248) + v257;
                      v258 = sub_1DEE659F0(v162, v165, 4, &v308, v246);
                      v162 = v258;
                      if (v290 == 0.0)
                      {
LABEL_101:
                        v167 = v165;
                        v165 = v246;
                        goto LABEL_102;
                      }
                      v259 = (float)(v290 * 4096.0) - (float)((float)(v290 * 4096.0) - v290);
                      v260 = (float)(v290 * v248) + (float)((float)-v254 * v259);
                      v261 = (float)(v290 * v250)
                           - (float)((float)((float)(v260 + (float)((float)-v255 * v259))
                                           + (float)((float)-v254 * (float)(v290 - v259)))
                                   - (float)(v255 * (float)(v290 - v259)));
                      v308 = -(float)((float)((float)((float)((float)(v290 * v250) + (float)((float)-v252 * v259))
                                                    + (float)((float)-(float)(v250 - v252) * v259))
                                            + (float)((float)-v252 * (float)(v290 - v259)))
                                    - (float)((float)(v250 - v252) * (float)(v290 - v259)));
                      v309 = (float)((float)-(float)((float)((float)(v260 + (float)((float)-v255 * v259))
                                                           + (float)((float)-v254 * (float)(v290 - v259)))
                                                   - (float)(v255 * (float)(v290 - v259)))
                                   - (float)(v261 - (float)(v290 * v250)))
                           + (float)((float)(v290 * v250) - (float)(v261 - (float)(v261 - (float)(v290 * v250))));
                      v310 = v261 - (float)((float)((float)(v290 * v248) + v261) - (float)(v290 * v248));
                      v311 = (float)(v290 * v248) + v261;
                      v162 = sub_1DEE659F0(v258, v246, 4, &v308, v165);
                      v262 = (float)((float)(v279 - v288) - v275) + (float)(v279 - (float)(v288 + (float)(v279 - v288)));
LABEL_100:
                      v263 = sub_1DEE65BF8(v152, v314, v306, v262);
                      v162 = sub_1DEE659F0(v162, v165, v263, v306, v246);
                      goto LABEL_101;
                    }
                    v167 = v246;
                  }
                  v262 = (float)((float)(v279 - v288) - v275) + (float)(v279 - (float)(v288 + (float)(v279 - v288)));
                  if (v290 == 0.0)
                  {
LABEL_102:
                    if (v301 == 0.0)
                    {
                      v265 = v167;
                      v167 = v165;
                    }
                    else
                    {
                      v264 = sub_1DEE65BF8(v157, v313, v306, v301);
                      v162 = sub_1DEE659F0(v162, v165, v264, v306, v167);
                      v265 = v165;
                    }
                    if (v303 == 0.0)
                    {
                      v265 = v167;
                    }
                    else
                    {
                      v266 = sub_1DEE65BF8(v160, v312, v306, v303);
                      v162 = sub_1DEE659F0(v162, v167, v266, v306, v265);
                    }
                    return v265[v162 - 1];
                  }
                  goto LABEL_100;
                }
                v327 = -(float)((float)((float)((float)(v85 - (float)(v117 * v268)) - (float)((float)(v75 - v117) * v268))
                                      - (float)(v117 * v267))
                              - (float)((float)(v75 - v117) * v267));
                v328 = v38 * v75;
                v323 = -(float)((float)((float)((float)((float)-(float)(v75 * v67)
                                                      - (float)((float)((float)(v75 * -4096.0)
                                                                      - (float)(v75 + (float)(v75 * -4096.0)))
                                                              * v271))
                                              - (float)((float)((float)-v75
                                                              - (float)((float)(v75 * -4096.0)
                                                                      - (float)(v75 + (float)(v75 * -4096.0))))
                                                      * v271))
                                      - (float)((float)((float)(v75 * -4096.0) - (float)(v75 + (float)(v75 * -4096.0)))
                                              * v36))
                              - (float)((float)((float)-v75
                                              - (float)((float)(v75 * -4096.0) - (float)(v75 + (float)(v75 * -4096.0))))
                                      * v36));
                v324 = -(float)(v75 * v67);
              }
              v116 = 2;
              goto LABEL_45;
            }
            v335 = -(float)((float)((float)((float)(v89 - (float)(v93 * v294)) - (float)((float)(v73 - v93) * v294))
                                  - (float)(v93 * v293))
                          - (float)((float)(v73 - v93) * v293));
            v336 = v65 * v73;
            v331 = -(float)((float)((float)((float)((float)-(float)(v73 * v38)
                                                  - (float)((float)((float)(v73 * -4096.0)
                                                                  - (float)(v73 + (float)(v73 * -4096.0)))
                                                          * v268))
                                          - (float)((float)((float)-v73
                                                          - (float)((float)(v73 * -4096.0)
                                                                  - (float)(v73 + (float)(v73 * -4096.0))))
                                                  * v268))
                                  - (float)((float)((float)(v73 * -4096.0) - (float)(v73 + (float)(v73 * -4096.0)))
                                          * v267))
                          - (float)((float)((float)-v73
                                          - (float)((float)(v73 * -4096.0) - (float)(v73 + (float)(v73 * -4096.0))))
                                  * v267));
            v332 = -(float)(v73 * v38);
          }
          v92 = 2;
          goto LABEL_37;
        }
      }
    }
  }
  return result;
}

float _simd_incircle_pf2(simd_float2 a1, simd_float2 a2, simd_float2 a3, simd_float2 a4)
{
  float32x2_t v4;
  float32x2_t v5;
  float32x2_t v6;
  float32x2_t v7;
  float32x2_t v8;
  float32x2_t v9;
  float32x4_t v10;
  float32x2_t v11;
  float32x2_t v12;
  float32x2_t v13;
  float32x2_t v14;
  int8x16_t v15;
  float32x2_t v16;
  int32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float result;
  float32x4_t v22;
  float v23;
  float32x2_t v25;
  float v26;
  float v27;
  float v28;
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
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  uint64_t v82;
  float *v83;
  float v84;
  float v85;
  float32x2_t v87;
  float32x2_t v88;
  float32x2_t v90;
  float32x2_t v91;
  float32x2_t v92;
  float32x4_t v93;
  int32x2_t v94;
  float v95;
  float v96;
  float32x2_t v98;
  double v100;
  double v105;
  float v106;
  float v107;
  float v109;
  double v110;
  float v111;
  float32x2_t v112;
  float32x2_t v113;
  float v114;
  float v116;
  float v117;
  float v118;
  _BOOL4 v119;
  int v120;
  int v121;
  float v122;
  float v123;
  float v124;
  float v125;
  _BOOL4 v126;
  int v127;
  int v128;
  float v129;
  float v130;
  float v131;
  float v132;
  float v133;
  float v134;
  _BOOL4 v135;
  int v136;
  float v137;
  float v138;
  float v139;
  float v140;
  float v141;
  float v142;
  int v143;
  int v144;
  int v145;
  int v146;
  int v147;
  int v148;
  int v149;
  float *v150;
  float *v151;
  int v152;
  int v153;
  int v154;
  int v155;
  int v156;
  int v157;
  int v158;
  int v159;
  float *v160;
  int v161;
  int v162;
  int v163;
  int v164;
  int v165;
  int v166;
  int v167;
  float *v168;
  int v169;
  int v170;
  int v171;
  int v172;
  int v173;
  int v174;
  int v175;
  float *v176;
  int v177;
  int v178;
  int v179;
  int v180;
  int v181;
  int v182;
  int v183;
  float *v184;
  int v185;
  int v186;
  int v187;
  int v188;
  int v189;
  int v190;
  int v191;
  float *v192;
  float *v193;
  float v194;
  float v195;
  float v196;
  float v197;
  float v198;
  float v199;
  float v200;
  float v201;
  float v202;
  float v203;
  float v204;
  float v205;
  float v206;
  float v207;
  float v208;
  float v209;
  int v210;
  int v211;
  float v212;
  float v213;
  float v214;
  float v215;
  float v216;
  float v217;
  float v218;
  float v219;
  int v220;
  int v221;
  int v222;
  int v223;
  int v224;
  int v225;
  int v226;
  float *v227;
  int v228;
  int v229;
  float *v230;
  int v231;
  int v232;
  int v233;
  int v234;
  int v235;
  int v236;
  int v237;
  int v238;
  int v239;
  int v240;
  int v241;
  int v242;
  int v243;
  int v244;
  int v245;
  int v246;
  int v247;
  float v248;
  _BOOL4 v249;
  float v250;
  float v251;
  float v252;
  float v253;
  float v254;
  float v255;
  float v256;
  float v257;
  float v258;
  float v259;
  float v260;
  float v261;
  float v262;
  float v263;
  float v264;
  float v265;
  float v266;
  float v267;
  int v268;
  int v269;
  float v270;
  float v271;
  float v272;
  float v273;
  float v274;
  float v275;
  float v276;
  float v277;
  float v278;
  float v279;
  float v280;
  float v281;
  int v282;
  int v283;
  int v284;
  int v285;
  int v286;
  int v287;
  int v288;
  float *v289;
  int v290;
  int v291;
  int v292;
  float v293;
  float *v294;
  int v295;
  int v296;
  int v297;
  int v298;
  int v299;
  int v300;
  int v301;
  int v302;
  int v303;
  int v304;
  int v305;
  int v306;
  int v307;
  int v308;
  int v309;
  int v310;
  int v311;
  float v312;
  float v313;
  float v314;
  float v315;
  float v316;
  float v317;
  float v318;
  float v319;
  float v320;
  float v321;
  float v322;
  float v323;
  float v324;
  float v325;
  float v326;
  float v327;
  float v328;
  float v329;
  float v330;
  int v331;
  int v332;
  float v333;
  float v334;
  float v335;
  float v336;
  float v337;
  float v338;
  float v339;
  float v340;
  float v341;
  int v342;
  int v343;
  int v344;
  int v345;
  int v346;
  int v347;
  int v348;
  float *v349;
  int v350;
  int v351;
  int v352;
  float v353;
  float *v354;
  int v355;
  int v356;
  int v357;
  int v358;
  int v359;
  int v360;
  int v361;
  int v362;
  int v363;
  int v364;
  int v365;
  int v366;
  int v367;
  int v368;
  int v369;
  int v370;
  int v371;
  int v372;
  int v373;
  int v374;
  int v375;
  float v376;
  float v377;
  int v378;
  float v379;
  float v380;
  float v381;
  float v382;
  float v383;
  float v384;
  int v385;
  int v386;
  float v387;
  float v388;
  float v389;
  float v390;
  float v391;
  int v392;
  float v393;
  float v394;
  float v395;
  float v396;
  float v397;
  float v398;
  float32x2_t v399;
  float v400;
  float32x2_t v401;
  float32x2_t v402;
  float32x2_t v403;
  BOOL v404;
  float32x2_t v405;
  float v406;
  float32x2_t v407;
  float32x2_t v408;
  float v409;
  float v410;
  float v411;
  float32x2_t v412;
  float v413;
  float v414;
  float v415;
  float v416;
  float32x2_t v417;
  float32x2_t v418;
  float32x2_t v419;
  float v420[4];
  float v421[4];
  float v422[4];
  float v423[8];
  float v424[8];
  float v425[8];
  float v426[8];
  float v427[8];
  float v428[8];
  float v429[8];
  float v430[8];
  float v431[8];
  float v432[16];
  float v433[16];
  float v434[16];
  float v435[16];
  float v436[16];
  float v437[16];
  float v438[8];
  float v439[8];
  float v440[8];
  float v441[8];
  float v442[8];
  float v443[8];
  float v444[8];
  float v445[8];
  float v446[8];
  float v447[8];
  float v448[8];
  float v449[8];
  float v450[8];
  float v451[8];
  float v452[8];
  float v453[8];
  float v454[8];
  float v455[8];
  float v456[64];
  float v457[48];
  float v458[32];
  float v459[32];
  float v460[16];
  float v461[16];
  float v462[16];
  float v463[8];
  float v464;
  float v465;
  float v466;
  float v467;
  float v468;
  float v469;
  float v470;
  float v471;
  float v472[4];
  float v473[4];
  float v474[4];
  float v475[1152];
  float v476;
  int v477;
  float v478[64];
  float v479[32];
  float v480[16];
  float v481[8];
  float v482[16];
  float v483[8];
  float v484[32];
  float v485[16];
  float v486[8];
  float v487[16];
  float v488[8];
  float v489[32];
  float v490[16];
  float v491[8];
  float v492[16];
  float v493[8];
  float v494[4];
  float v495[4];
  float v496[6];

  *(double *)&v4 = ((double (*)())MEMORY[0x1E0C86820])();
  v8 = v7;
  v9 = v4;
  *(float32x2_t *)v10.f32 = vsub_f32(v5, v4);
  v11 = vsub_f32(v6, v4);
  v12 = vmul_f32(*(float32x2_t *)v10.f32, *(float32x2_t *)v10.f32);
  *(float32x2_t *)&v10.u32[2] = vadd_f32(v12, (float32x2_t)vdup_lane_s32((int32x2_t)v12, 1));
  v13 = vmul_f32(v11, v11);
  v14 = vsub_f32(v7, v9);
  *(float32x2_t *)v15.i8 = v11;
  v15.u64[1] = (unint64_t)vadd_f32(v13, (float32x2_t)vdup_lane_s32((int32x2_t)v13, 1));
  v16 = vmul_f32(v14, v14);
  *(float32x2_t *)v17.i8 = v14;
  v17.u64[1] = (unint64_t)vadd_f32(v16, (float32x2_t)vdup_lane_s32((int32x2_t)v16, 1));
  v18 = vmulq_f32((float32x4_t)vextq_s8(vextq_s8(v15, v15, 0xCuLL), v15, 8uLL), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v17, v17), (int8x16_t)v17, 0xCuLL));
  v19 = vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v15, (int32x4_t)v15), v15, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v17, (int8x16_t)v17, 0xCuLL), (int8x16_t)v17, 8uLL));
  v20 = vmulq_f32(v10, vsubq_f32(v18, v19));
  result = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v20, 2), vaddq_f32(v20, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 1))).f32[0];
  v22 = vmulq_f32(vaddq_f32(vabsq_f32(v18), vabsq_f32(v19)), vabsq_f32(v10));
  v23 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 2), vaddq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.f32, 1))).f32[0];
  if (result <= (float)(0.00000059605 * v23) && (float)(0.00000059605 * v23) >= (float)-result)
  {
    v411 = v23;
    v403 = v6;
    v405 = v9;
    v407 = v8;
    v384 = v13.f32[0];
    v386 = v16.i32[0];
    v399 = (float32x2_t)vrev64_s32((int32x2_t)v9);
    v401 = (float32x2_t)vrev64_s32((int32x2_t)v5);
    v418 = v14;
    v419 = vsub_f32(v401, v399);
    v25 = v14;
    v26 = vmuls_lane_f32(v11.f32[0], v14, 1);
    v409 = (float)(4096.0 * v11.f32[0]) - (float)((float)(4096.0 * v11.f32[0]) - v11.f32[0]);
    v27 = vmuls_lane_f32(4096.0, v14, 1);
    v28 = v27 - (float)(v27 - v14.f32[1]);
    v29 = v14.f32[1] - v28;
    v415 = v11.f32[0] - v409;
    v30 = -(float)((float)((float)((float)(v26 - (float)(v409 * v28)) - (float)((float)(v11.f32[0] - v409) * v28))
                         - (float)(v409 * (float)(v14.f32[1] - v28)))
                 - (float)((float)(v11.f32[0] - v409) * (float)(v14.f32[1] - v28)));
    v416 = v11.f32[1];
    v31 = vmuls_lane_f32(v14.f32[0], v11, 1);
    v32 = (float)(4096.0 * v25.f32[0]) - (float)((float)(4096.0 * v25.f32[0]) - v25.f32[0]);
    v33 = vmuls_lane_f32(4096.0, v11, 1);
    v413 = v33 - (float)(v33 - v11.f32[1]);
    v414 = v11.f32[1] - v413;
    v34 = -(float)((float)((float)((float)(v31 - (float)(v32 * v413)) - (float)((float)(v25.f32[0] - v32) * v413))
                         - (float)(v32 * (float)(v11.f32[1] - v413)))
                 - (float)((float)(v25.f32[0] - v32) * (float)(v11.f32[1] - v413)));
    v35 = v30 - v34;
    v36 = (float)((float)(v30 - (float)(v30 - v34)) - v34)
        + (float)(v30 - (float)((float)(v30 - v34) + (float)(v30 - (float)(v30 - v34))));
    v37 = v26 + v35;
    v38 = (float)(v35 - (float)((float)(v26 + v35) - v26))
        + (float)(v26 - (float)((float)(v26 + v35) - (float)((float)(v26 + v35) - v26)));
    v39 = v38 - v31;
    v395 = v31;
    v496[0] = v36;
    v496[1] = (float)((float)(v38 - (float)(v38 - v31)) - v31)
            + (float)(v38 - (float)((float)(v38 - v31) + (float)(v38 - (float)(v38 - v31))));
    v40 = v37 + (float)(v38 - v31);
    v496[2] = (float)(v39 - (float)(v40 - v37)) + (float)(v37 - (float)(v40 - (float)(v40 - v37)));
    v496[3] = v40;
    v417 = v11;
    v41 = sub_1DEE65BF8(4, v496, v493, v419.f32[1]);
    v42 = sub_1DEE65BF8(v41, v493, v492, v419.f32[1]);
    v43 = sub_1DEE65BF8(4, v496, v491, v419.f32[0]);
    v44 = sub_1DEE65BF8(v43, v491, v490, v419.f32[0]);
    v45 = sub_1DEE659F0(v42, v492, v44, v490, v489);
    v46 = vmul_f32(v419, v418).f32[0];
    v47 = (float)(4096.0 * v419.f32[0]) - (float)((float)(4096.0 * v419.f32[0]) - v419.f32[0]);
    *(float *)&v392 = v32;
    v398 = v25.f32[0] - v32;
    v48 = -(float)((float)((float)((float)(v46 - (float)(v32 * v47)) - (float)(v398 * v47))
                         - (float)(v32 * (float)(v419.f32[0] - v47)))
                 - (float)(v398 * (float)(v419.f32[0] - v47)));
    v49 = vmuls_lane_f32(v419.f32[1], v418, 1);
    v50 = vmuls_lane_f32(4096.0, v419, 1);
    v51 = v50 - (float)(v50 - v419.f32[1]);
    v389 = v28;
    v390 = v29;
    v52 = (float)(v49 - (float)(v51 * v28)) - (float)((float)(v419.f32[1] - v51) * v28);
    v53 = v49;
    v54 = -(float)((float)(v52 - (float)(v51 * v29)) - (float)((float)(v419.f32[1] - v51) * v29));
    v55 = v48 - v54;
    v56 = (float)((float)(v48 - (float)(v48 - v54)) - v54)
        + (float)(v48 - (float)((float)(v48 - v54) + (float)(v48 - (float)(v48 - v54))));
    v57 = v46 + v55;
    v58 = (float)(v55 - (float)((float)(v46 + v55) - v46))
        + (float)(v46 - (float)((float)(v46 + v55) - (float)((float)(v46 + v55) - v46)));
    v495[0] = v56;
    v495[1] = (float)((float)(v58 - (float)(v58 - v49)) - v49)
            + (float)(v58 - (float)((float)(v58 - v49) + (float)(v58 - (float)(v58 - v49))));
    v495[2] = (float)((float)(v58 - v49) - (float)((float)(v57 + (float)(v58 - v49)) - v57))
            + (float)(v57 - (float)((float)(v57 + (float)(v58 - v49)) - (float)((float)(v57 + (float)(v58 - v49)) - v57)));
    v495[3] = v57 + (float)(v58 - v49);
    v59 = sub_1DEE65BF8(4, v495, v488, v417.f32[0]);
    v60 = sub_1DEE65BF8(v59, v488, v487, v417.f32[0]);
    v61 = sub_1DEE65BF8(4, v495, v486, v416);
    v62 = sub_1DEE65BF8(v61, v486, v485, v416);
    v63 = sub_1DEE659F0(v60, v487, v62, v485, v484);
    v64 = vmuls_lane_f32(v419.f32[1], v417, 1);
    v397 = v419.f32[1] - v51;
    v65 = -(float)((float)((float)((float)(v64 - (float)(v51 * v413)) - (float)((float)(v419.f32[1] - v51) * v413))
                         - (float)(v51 * v414))
                 - (float)((float)(v419.f32[1] - v51) * v414));
    v66 = vmul_f32(v419, v417).f32[0];
    v387 = v47;
    v388 = v419.f32[0] - v47;
    v67 = -(float)((float)((float)((float)(v66 - (float)(v409 * v47)) - (float)(v415 * v47)) - (float)(v409 * v388))
                 - (float)(v415 * v388));
    v68 = v65 - v67;
    v69 = (float)((float)(v65 - (float)(v65 - v67)) - v67)
        + (float)(v65 - (float)((float)(v65 - v67) + (float)(v65 - (float)(v65 - v67))));
    v70 = v64 + v68;
    v71 = (float)(v68 - (float)((float)(v64 + v68) - v64))
        + (float)(v64 - (float)((float)(v64 + v68) - (float)((float)(v64 + v68) - v64)));
    v72 = v71 - v66;
    v393 = v66;
    v494[0] = v69;
    v494[1] = (float)((float)(v71 - (float)(v71 - v66)) - v66)
            + (float)(v71 - (float)((float)(v71 - v66) + (float)(v71 - (float)(v71 - v66))));
    v73 = v70 + (float)(v71 - v66);
    v494[2] = (float)(v72 - (float)(v73 - v70)) + (float)(v70 - (float)(v73 - (float)(v73 - v70)));
    v494[3] = v73;
    v74 = sub_1DEE65BF8(4, v494, v483, v418.f32[0]);
    v75 = sub_1DEE65BF8(v74, v483, v482, v418.f32[0]);
    v76 = sub_1DEE65BF8(4, v494, v481, v25.f32[1]);
    v77 = sub_1DEE65BF8(v76, v481, v480, v25.f32[1]);
    v78 = sub_1DEE659F0(v75, v482, v77, v480, v479);
    v79 = sub_1DEE659F0(v45, v489, v63, v484, v478);
    v80 = sub_1DEE659F0(v79, v478, v78, v479, &v476);
    v81 = v80;
    result = v476;
    if (v80 < 2)
    {
      v84 = v411;
    }
    else
    {
      v82 = v80 - 1;
      v83 = (float *)&v477;
      v84 = v411;
      do
      {
        v85 = *v83++;
        result = result + v85;
        --v82;
      }
      while (v82);
    }
    if (result < (float)(v84 * 0.00000023842) && (float)(v84 * 0.00000023842) > (float)-result)
    {
      v87 = vsub_f32(v401, v419);
      v88 = vsub_f32(v403, v417);
      _D21 = vadd_f32(vsub_f32(v87, v399), vsub_f32(v401, vadd_f32(v419, v87)));
      v90 = vadd_f32(vsub_f32(v88, v405), vsub_f32(v403, vadd_f32(v417, v88)));
      v91 = vsub_f32(v407, v418);
      v92 = vadd_f32(vsub_f32(v91, v405), vsub_f32(v407, vadd_f32(v418, v91)));
      v93.i64[0] = __PAIR64__(_D21.u32[1], v90.u32[0]);
      v93.i64[1] = __PAIR64__(vdup_lane_s32(*(int32x2_t *)&_D21, 0).u32[1], v92.u32[0]);
      if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqzq_f32(v93)))) & 1) != 0
        || (v94 = vceqz_f32((float32x2_t)vzip2_s32((int32x2_t)v92, (int32x2_t)v90)), (v94.i8[4] & 1) == 0)
        || (v94.i8[0] & 1) == 0)
      {
        v95 = (float)(fabsf(result) * 0.00000017881) + (float)(v84 * 1.5632e-13);
        v96 = vmul_f32(v419, v419).f32[0];
        _S20 = v419.f32[1];
        v98 = vmul_f32(v418, (float32x2_t)vrev64_s32((int32x2_t)v90));
        _D2 = vmla_f32(v98, v92, (float32x2_t)vrev64_s32((int32x2_t)v417));
        v100 = (float)((float)(v96 + (float)(_S20 * _S20))
                     * vsub_f32((float32x2_t)vdup_lane_s32((int32x2_t)_D2, 1), _D2).f32[0]);
        __asm { FMLA            S2, S20, V21.S[1] }
        _S9 = v25.f32[1];
        v105 = v100 + (_D2.f32[0] + _D2.f32[0]) * (float)-(float)(v395 - (float)(v417.f32[0] * v25.f32[1]));
        v106 = v416 * v416;
        LODWORD(v107) = vmul_f32(v419, v92).u32[0];
        __asm { FMLA            S7, S9, V21.S[1] }
        v109 = vmlas_n_f32(vmuls_lane_f32(v416, v90, 1), v417.f32[0], v90.f32[0]);
        v110 = v105
             + (float)((float)((float)(v416 * v416) + (float)(v417.f32[0] * v417.f32[0]))
                     * (float)(vmlas_n_f32(v107, v418.f32[0], _D21.f32[0]) - _S7))
             + (v109 + v109) * (float)-(float)(v53 - (float)(v418.f32[0] * v419.f32[0]));
        v111 = _S9 * _S9;
        v112 = vmul_f32(v417, _D21);
        v113 = vmla_f32(v112, v90, v419);
        v114 = vmuls_lane_f32(v25.f32[1], v92, 1);
        result = (float)((float)((float)(_S9 * _S9) + (float)(v418.f32[0] * v418.f32[0]))
                       * vsub_f32((float32x2_t)vdup_lane_s32((int32x2_t)v113, 1), v113).f32[0])
               + ((float)(v114 + (float)(v418.f32[0] * v92.f32[0])) + (float)(v114 + (float)(v418.f32[0] * v92.f32[0])))
               * (float)-(float)(v393 - (float)(v419.f32[1] * v416))
               + v110
               + result;
        if (v95 > result && v95 > (float)-result)
        {
          v406 = -v51;
          v116 = _D21.f32[1];
          v117 = v92.f32[1];
          v118 = v90.f32[1];
          v119 = v90.f32[1] != 0.0 || v90.f32[0] != 0.0;
          v120 = v92.f32[0] != 0.0 || v119;
          if (v92.f32[1] == 0.0)
            v121 = v120;
          else
            v121 = 1;
          if (v121 == 1)
          {
            v122 = -(float)((float)((float)((float)(v419.f32[1] * v419.f32[1]) + (float)(v406 * v51))
                                  - (float)((float)(v51 + v51) * v397))
                          - (float)(v397 * v397));
            v123 = v122
                 - (float)((float)((float)(v96 - (float)(v47 * v47)) - (float)((float)(v47 + v47) * v388))
                         - (float)(v388 * v388));
            v124 = (float)(v419.f32[1] * v419.f32[1]) + v123;
            v125 = (float)(v123 - (float)(v124 - (float)(v419.f32[1] * v419.f32[1])))
                 + (float)((float)(v419.f32[1] * v419.f32[1])
                         + (float)((float)(v124 - (float)(v419.f32[1] * v419.f32[1])) - v124));
            v474[0] = (float)((float)-(float)((float)((float)(v96 - (float)(v47 * v47))
                                                    - (float)((float)(v47 + v47) * v388))
                                            - (float)(v388 * v388))
                            - (float)(v123 - v122))
                    + (float)(v122 + (float)((float)(v123 - v122) - v123));
            v474[1] = (float)(v96 - (float)((float)(v96 + v125) - v125))
                    + (float)(v125 + (float)((float)((float)(v96 + v125) - v125) - (float)(v96 + v125)));
            v474[2] = (float)((float)(v96 + v125) - (float)((float)(v124 + (float)(v96 + v125)) - v124))
                    + (float)(v124
                            + (float)((float)((float)(v124 + (float)(v96 + v125)) - v124)
                                    - (float)(v124 + (float)(v96 + v125))));
            v474[3] = v124 + (float)(v96 + v125);
          }
          v126 = v92.f32[1] != 0.0 || v92.f32[0] != 0.0;
          v127 = _D21.f32[1] != 0.0 || v126;
          if (_D21.f32[0] == 0.0)
            v128 = v127;
          else
            v128 = 1;
          if (v128 == 1)
          {
            v129 = -(float)((float)((float)(v384 + (float)((float)-v409 * v409)) - (float)((float)(v409 + v409) * v415))
                          - (float)(v415 * v415));
            v130 = v129
                 - (float)((float)((float)(v106 - (float)(v413 * v413)) - (float)((float)(v413 + v413) * v414))
                         - (float)(v414 * v414));
            v131 = (float)((float)-(float)((float)((float)(v106 - (float)(v413 * v413))
                                                 - (float)((float)(v413 + v413) * v414))
                                         - (float)(v414 * v414))
                         - (float)(v130 - v129))
                 + (float)(v129 + (float)((float)(v130 - v129) - v130));
            v132 = v384 + v130;
            v133 = (float)(v130 - (float)((float)(v384 + v130) - v384))
                 + (float)(v384 + (float)((float)((float)(v384 + v130) - v384) - (float)(v384 + v130)));
            v473[0] = v131;
            v473[1] = (float)(v106 - (float)((float)(v106 + v133) - v133))
                    + (float)(v133 + (float)((float)((float)(v106 + v133) - v133) - (float)(v106 + v133)));
            v473[2] = (float)((float)(v106 + v133) - (float)((float)(v132 + (float)(v106 + v133)) - v132))
                    + (float)(v132
                            + (float)((float)((float)(v132 + (float)(v106 + v133)) - v132)
                                    - (float)(v132 + (float)(v106 + v133))));
            v473[3] = v132 + (float)(v106 + v133);
          }
          v134 = -v32;
          v135 = _D21.f32[0] != 0.0 || _D21.f32[1] != 0.0;
          v136 = v90.f32[0] != 0.0 || v135;
          if (v90.f32[1] != 0.0)
            v136 = 1;
          v137 = v416;
          if (v136 == 1)
          {
            v138 = -(float)((float)((float)(*(float *)&v386 + (float)(v134 * v32)) - (float)((float)(v32 + v32) * v398))
                          - (float)(v398 * v398));
            v139 = v138
                 - (float)((float)((float)(v111 - (float)(v389 * v389)) - (float)((float)(v389 + v389) * v390))
                         - (float)(v390 * v390));
            v140 = (float)((float)-(float)((float)((float)(v111 - (float)(v389 * v389))
                                                 - (float)((float)(v389 + v389) * v390))
                                         - (float)(v390 * v390))
                         - (float)(v139 - v138))
                 + (float)(v138 + (float)((float)(v139 - v138) - v139));
            v141 = *(float *)&v386 + v139;
            v142 = (float)(v139 - (float)((float)(*(float *)&v386 + v139) - *(float *)&v386))
                 + (float)(*(float *)&v386
                         + (float)((float)((float)(*(float *)&v386 + v139) - *(float *)&v386)
                                 - (float)(*(float *)&v386 + v139)));
            v472[0] = v140;
            v472[1] = (float)(v111 - (float)((float)(v111 + v142) - v142))
                    + (float)(v142 + (float)((float)((float)(v111 + v142) - v142) - (float)(v111 + v142)));
            v472[2] = (float)((float)(v111 + v142) - (float)((float)(v141 + (float)(v111 + v142)) - v141))
                    + (float)(v141
                            + (float)((float)((float)(v141 + (float)(v111 + v142)) - v141)
                                    - (float)(v141 + (float)(v111 + v142))));
            v472[3] = v141 + (float)(v111 + v142);
          }
          v408 = v92;
          v402 = _D21;
          v412 = v90;
          v376 = v107;
          v377 = v112.f32[1];
          v400 = -v409;
          v385 = v136;
          v404 = v119;
          v378 = v128;
          v379 = v98.f32[1];
          if (_D21.f32[1] == 0.0)
          {
            v151 = &v476;
            v150 = v475;
          }
          else
          {
            v392 = sub_1DEE65BF8(4, v496, v443, _D21.f32[1]);
            v143 = sub_1DEE65BF8(v392, v443, v462, v419.f32[1] + v419.f32[1]);
            v144 = sub_1DEE65BF8(4, v472, v454, v116);
            v145 = sub_1DEE65BF8(v144, v454, v461, v416);
            v146 = sub_1DEE65BF8(4, v473, v455, v116);
            v147 = sub_1DEE65BF8(v146, v455, v460, -v25.f32[1]);
            v148 = sub_1DEE659F0(v143, v462, v145, v461, v459);
            v149 = sub_1DEE659F0(v147, v460, v148, v459, v457);
            v150 = &v476;
            v151 = v475;
            v152 = sub_1DEE659F0(v81, &v476, v149, v457, v475);
            _D21.i32[0] = v402.i32[0];
            v81 = v152;
          }
          if (_D21.f32[0] == 0.0)
          {
            v160 = v150;
          }
          else
          {
            v373 = sub_1DEE65BF8(4, v496, v442, _D21.f32[0]);
            v153 = sub_1DEE65BF8(v373, v442, v462, v419.f32[0] + v419.f32[0]);
            v154 = sub_1DEE65BF8(4, v473, v453, v402.f32[0]);
            v155 = sub_1DEE65BF8(v154, v453, v461, v418.f32[0]);
            v156 = sub_1DEE65BF8(4, v472, v452, v402.f32[0]);
            v157 = sub_1DEE65BF8(v156, v452, v460, -v417.f32[0]);
            v158 = sub_1DEE659F0(v153, v462, v155, v461, v459);
            v159 = sub_1DEE659F0(v157, v460, v158, v459, v457);
            v81 = sub_1DEE659F0(v81, v151, v159, v457, v150);
            v160 = v151;
            v151 = v150;
          }
          if (v412.f32[0] == 0.0)
          {
            v168 = v160;
          }
          else
          {
            v374 = sub_1DEE65BF8(4, v495, v441, v412.f32[0]);
            v161 = sub_1DEE65BF8(v374, v441, v462, v417.f32[0] + v417.f32[0]);
            v162 = sub_1DEE65BF8(4, v474, v451, v412.f32[0]);
            v163 = sub_1DEE65BF8(v162, v451, v461, v25.f32[1]);
            v164 = sub_1DEE65BF8(4, v472, v450, v412.f32[0]);
            v165 = sub_1DEE65BF8(v164, v450, v460, -v419.f32[0]);
            v166 = sub_1DEE659F0(v161, v462, v163, v461, v459);
            v167 = sub_1DEE659F0(v165, v460, v166, v459, v457);
            v81 = sub_1DEE659F0(v81, v151, v167, v457, v160);
            v168 = v151;
            v151 = v160;
          }
          if (v118 == 0.0)
          {
            v176 = v168;
          }
          else
          {
            v372 = sub_1DEE65BF8(4, v495, v440, v118);
            v169 = sub_1DEE65BF8(v372, v440, v462, v416 + v416);
            v170 = sub_1DEE65BF8(4, v472, v448, v118);
            v171 = sub_1DEE65BF8(v170, v448, v461, v419.f32[1]);
            v172 = sub_1DEE65BF8(4, v474, v449, v118);
            v173 = sub_1DEE65BF8(v172, v449, v460, -v418.f32[0]);
            v174 = sub_1DEE659F0(v169, v462, v171, v461, v459);
            v175 = sub_1DEE659F0(v173, v460, v174, v459, v457);
            v81 = sub_1DEE659F0(v81, v151, v175, v457, v168);
            v176 = v151;
            v151 = v168;
          }
          if (v408.f32[0] == 0.0)
          {
            v184 = v176;
          }
          else
          {
            v375 = sub_1DEE65BF8(4, v494, v439, v408.f32[0]);
            v177 = sub_1DEE65BF8(v375, v439, v462, v418.f32[0] + v418.f32[0]);
            v178 = sub_1DEE65BF8(4, v473, v446, v408.f32[0]);
            v179 = sub_1DEE65BF8(v178, v446, v461, v419.f32[0]);
            v180 = sub_1DEE65BF8(4, v474, v447, v408.f32[0]);
            v181 = sub_1DEE65BF8(v180, v447, v460, -v416);
            v182 = sub_1DEE659F0(v177, v462, v179, v461, v459);
            v183 = sub_1DEE659F0(v181, v460, v182, v459, v457);
            v81 = sub_1DEE659F0(v81, v151, v183, v457, v176);
            v184 = v151;
            v151 = v176;
          }
          v410 = -v415;
          v396 = -v398;
          v394 = -v397;
          if (v117 == 0.0)
          {
            if (!v135)
            {
              v192 = v151;
              v151 = v184;
LABEL_78:
              v184 = v151;
              v151 = v192;
              goto LABEL_92;
            }
            if (!v121)
            {
              v391 = -v32;
              v383 = v117;
              v424[0] = 0.0;
              v211 = 1;
              v215 = 0.0;
              v210 = 1;
LABEL_80:
              v219 = v402.f32[0];
              v421[0] = v215;
              if (v116 == 0.0)
              {
                _S9 = v25.f32[1];
                v117 = v383;
                v137 = v416;
                v134 = v391;
              }
              else
              {
                v220 = sub_1DEE65BF8(v392, v443, v462, v116);
                v221 = sub_1DEE65BF8(v211, v424, v437, v116);
                v222 = sub_1DEE65BF8(v221, v437, v459, v419.f32[1] + v419.f32[1]);
                v223 = sub_1DEE659F0(v220, v462, v222, v459, v457);
                v224 = sub_1DEE659F0(v81, v151, v223, v457, v184);
                if (v118 == 0.0)
                {
                  v227 = v151;
                  v151 = v184;
                }
                else
                {
                  v225 = sub_1DEE65BF8(4, v472, v463, v116);
                  v226 = sub_1DEE65BF8(v225, v463, v462, v118);
                  v224 = sub_1DEE659F0(v224, v184, v226, v462, v151);
                  v227 = v184;
                }
                _S9 = v25.f32[1];
                v117 = v383;
                v137 = v416;
                v134 = v391;
                if (v383 == 0.0)
                {
                  v230 = v227;
                  v227 = v151;
                  v151 = v230;
                }
                else
                {
                  v228 = sub_1DEE65BF8(4, v473, v463, -v116);
                  v229 = sub_1DEE65BF8(v228, v463, v462, v383);
                  v224 = sub_1DEE659F0(v224, v151, v229, v462, v227);
                  v230 = v151;
                }
                v231 = sub_1DEE65BF8(v221, v437, v459, v116);
                v232 = sub_1DEE65BF8(v210, v421, v431, v116);
                v233 = sub_1DEE65BF8(v232, v431, v462, v419.f32[1] + v419.f32[1]);
                v234 = sub_1DEE65BF8(v232, v431, v461, v116);
                v235 = sub_1DEE659F0(v233, v462, v234, v461, v458);
                v236 = sub_1DEE659F0(v231, v459, v235, v458, v456);
                v81 = sub_1DEE659F0(v224, v227, v236, v456, v230);
                v184 = v227;
                v219 = v402.f32[0];
              }
              if (v219 != 0.0)
              {
                v237 = sub_1DEE65BF8(v373, v442, v462, v219);
                v238 = sub_1DEE65BF8(v211, v424, v436, v402.f32[0]);
                v239 = sub_1DEE65BF8(v238, v436, v459, v419.f32[0] + v419.f32[0]);
                v240 = sub_1DEE659F0(v237, v462, v239, v459, v457);
                v241 = sub_1DEE659F0(v81, v151, v240, v457, v184);
                v242 = sub_1DEE65BF8(v238, v436, v459, v402.f32[0]);
                v243 = sub_1DEE65BF8(v210, v421, v430, v402.f32[0]);
                v244 = sub_1DEE65BF8(v243, v430, v462, v419.f32[0] + v419.f32[0]);
                v245 = sub_1DEE65BF8(v243, v430, v461, v402.f32[0]);
                v246 = sub_1DEE659F0(v244, v462, v245, v461, v458);
                v247 = sub_1DEE659F0(v242, v459, v246, v458, v456);
                v81 = sub_1DEE659F0(v241, v184, v247, v456, v151);
                v248 = v412.f32[0];
                v249 = v126;
                if (v404)
                  goto LABEL_94;
                goto LABEL_95;
              }
LABEL_92:
              v248 = v412.f32[0];
              v249 = v126;
              if (v404)
              {
                if (!v378)
                {
                  v249 = 0;
                  v423[0] = 0.0;
                  v269 = 1;
                  v278 = 0.0;
                  v268 = 1;
LABEL_98:
                  v420[0] = v278;
                  if (v248 == 0.0)
                  {
                    _S9 = v25.f32[1];
                  }
                  else
                  {
                    v282 = sub_1DEE65BF8(v374, v441, v462, v248);
                    v283 = sub_1DEE65BF8(v269, v423, v435, v412.f32[0]);
                    v284 = sub_1DEE65BF8(v283, v435, v459, v417.f32[0] + v417.f32[0]);
                    v285 = sub_1DEE659F0(v282, v462, v284, v459, v457);
                    v286 = sub_1DEE659F0(v81, v151, v285, v457, v184);
                    if (v117 == 0.0)
                    {
                      v289 = v151;
                      v151 = v184;
                    }
                    else
                    {
                      v287 = sub_1DEE65BF8(4, v474, v463, v412.f32[0]);
                      v288 = sub_1DEE65BF8(v287, v463, v462, v117);
                      v286 = sub_1DEE659F0(v286, v184, v288, v462, v151);
                      v289 = v184;
                    }
                    _S9 = v25.f32[1];
                    if (v402.f32[0] == 0.0)
                    {
                      v294 = v289;
                      v289 = v151;
                      v151 = v294;
                      v293 = v412.f32[0];
                    }
                    else
                    {
                      v290 = sub_1DEE65BF8(4, v472, v463, -v412.f32[0]);
                      v291 = sub_1DEE65BF8(v290, v463, v462, v402.f32[0]);
                      v292 = sub_1DEE659F0(v286, v151, v291, v462, v289);
                      v293 = v412.f32[0];
                      v286 = v292;
                      v294 = v151;
                    }
                    v295 = sub_1DEE65BF8(v283, v435, v459, v293);
                    v296 = sub_1DEE65BF8(v268, v420, v429, v412.f32[0]);
                    v297 = sub_1DEE65BF8(v296, v429, v462, v417.f32[0] + v417.f32[0]);
                    v298 = sub_1DEE65BF8(v296, v429, v461, v412.f32[0]);
                    v299 = sub_1DEE659F0(v297, v462, v298, v461, v458);
                    v300 = sub_1DEE659F0(v295, v459, v299, v458, v456);
                    v81 = sub_1DEE659F0(v286, v289, v300, v456, v294);
                    v184 = v289;
                  }
                  if (v118 != 0.0)
                  {
                    v301 = sub_1DEE65BF8(v372, v440, v462, v118);
                    v302 = sub_1DEE65BF8(v269, v423, v434, v118);
                    v303 = sub_1DEE65BF8(v302, v434, v459, v137 + v137);
                    v304 = sub_1DEE659F0(v301, v462, v303, v459, v457);
                    v305 = sub_1DEE659F0(v81, v151, v304, v457, v184);
                    v306 = sub_1DEE65BF8(v302, v434, v459, v118);
                    v307 = sub_1DEE65BF8(v268, v420, v428, v118);
                    v308 = sub_1DEE65BF8(v307, v428, v462, v137 + v137);
                    v309 = sub_1DEE65BF8(v307, v428, v461, v118);
                    v310 = sub_1DEE659F0(v308, v462, v309, v461, v458);
                    v311 = sub_1DEE659F0(v306, v459, v310, v458, v456);
                    v81 = sub_1DEE659F0(v305, v184, v311, v456, v151);
                    v248 = v412.f32[0];
                    if (!v249)
                      return v151[v81 - 1];
                    goto LABEL_112;
                  }
                  v248 = v412.f32[0];
                  if (v249)
                  {
LABEL_111:
                    if (!v385)
                    {
                      v381 = v118;
                      v425[0] = 0.0;
                      v332 = 1;
                      v339 = 0.0;
                      v331 = 1;
                      goto LABEL_114;
                    }
LABEL_112:
                    v382 = v116;
                    v312 = (float)(v116 * 4096.0) - (float)((float)(v116 * 4096.0) - v116);
                    v313 = v116 - v312;
                    v314 = -(float)((float)((float)((float)(v377 - (float)(v312 * v413)) - (float)(v313 * v413))
                                          - (float)(v312 * v414))
                                  - (float)(v313 * v414));
                    v315 = (float)(v118 * 4096.0) - (float)((float)(v118 * 4096.0) - v118);
                    v316 = v118 - v315;
                    v317 = v314
                         - (float)((float)((float)((float)((float)(v419.f32[1] * v118) + (float)(v406 * v315))
                                                 + (float)(v394 * v315))
                                         + (float)(v406 * (float)(v118 - v315)))
                                 - (float)(v397 * (float)(v118 - v315)));
                    v318 = (float)((float)-(float)((float)((float)((float)((float)(v419.f32[1] * v118)
                                                                         + (float)(v406 * v315))
                                                                 + (float)(v394 * v315))
                                                         + (float)(v406 * (float)(v118 - v315)))
                                                 - (float)(v397 * (float)(v118 - v315)))
                                 - (float)(v317 - v314))
                         + (float)(v314 - (float)(v317 - (float)(v317 - v314)));
                    v319 = v377 + v317;
                    v320 = (float)(v317 - (float)((float)(v377 + v317) - v377))
                         + (float)(v377 - (float)((float)(v377 + v317) - (float)((float)(v377 + v317) - v377)));
                    v321 = (float)(v419.f32[1] * v118) + v320;
                    v468 = v318;
                    v469 = (float)((float)(v419.f32[1] * v118) - (float)(v321 - v320))
                         + (float)(v320 - (float)(v321 - (float)(v321 - v320)));
                    v470 = (float)(v321 - (float)((float)(v319 + v321) - v319))
                         + (float)(v319 - (float)((float)(v319 + v321) - (float)((float)(v319 + v321) - v319)));
                    v471 = v319 + v321;
                    v322 = v118;
                    v323 = (float)(v248 * 4096.0) - (float)((float)(v248 * 4096.0) - v248);
                    v324 = v248 - v323;
                    v325 = -(float)((float)((float)((float)((float)-(float)(v419.f32[0] * v248)
                                                          - (float)(v323
                                                                  * (float)((float)(v419.f32[0] * -4096.0)
                                                                          - (float)(v419.f32[0]
                                                                                  + (float)(v419.f32[0] * -4096.0)))))
                                                  - (float)((float)(v248 - v323)
                                                          * (float)((float)(v419.f32[0] * -4096.0)
                                                                  - (float)(v419.f32[0] + (float)(v419.f32[0] * -4096.0)))))
                                          - (float)(v323
                                                  * (float)((float)-v419.f32[0]
                                                          - (float)((float)(v419.f32[0] * -4096.0)
                                                                  - (float)(v419.f32[0] + (float)(v419.f32[0] * -4096.0))))))
                                  - (float)((float)(v248 - v323)
                                          * (float)((float)-v419.f32[0]
                                                  - (float)((float)(v419.f32[0] * -4096.0)
                                                          - (float)(v419.f32[0] + (float)(v419.f32[0] * -4096.0))))));
                    v326 = v325
                         - (float)((float)((float)((float)((float)(v400
                                                                 * (float)((float)(v402.f32[0] * -4096.0)
                                                                         - (float)(v402.f32[0]
                                                                                 + (float)(v402.f32[0] * -4096.0))))
                                                         - (float)(v402.f32[0] * v417.f32[0]))
                                                 + (float)(v410
                                                         * (float)((float)(v402.f32[0] * -4096.0)
                                                                 - (float)(v402.f32[0] + (float)(v402.f32[0] * -4096.0)))))
                                         + (float)(v400
                                                 * (float)((float)-v402.f32[0]
                                                         - (float)((float)(v402.f32[0] * -4096.0)
                                                                 - (float)(v402.f32[0] + (float)(v402.f32[0] * -4096.0))))))
                                 - (float)(v415
                                         * (float)((float)-v402.f32[0]
                                                 - (float)((float)(v402.f32[0] * -4096.0)
                                                         - (float)(v402.f32[0] + (float)(v402.f32[0] * -4096.0))))));
                    v327 = (float)((float)-(float)((float)((float)((float)((float)(v400
                                                                                 * (float)((float)(v402.f32[0] * -4096.0)
                                                                                         - (float)(v402.f32[0]
                                                                                                 + (float)(v402.f32[0] * -4096.0))))
                                                                         - (float)(v402.f32[0] * v417.f32[0]))
                                                                 + (float)(v410
                                                                         * (float)((float)(v402.f32[0] * -4096.0)
                                                                                 - (float)(v402.f32[0]
                                                                                         + (float)(v402.f32[0] * -4096.0)))))
                                                         + (float)(v400
                                                                 * (float)((float)-v402.f32[0]
                                                                         - (float)((float)(v402.f32[0] * -4096.0)
                                                                                 - (float)(v402.f32[0]
                                                                                         + (float)(v402.f32[0] * -4096.0))))))
                                                 - (float)(v415
                                                         * (float)((float)-v402.f32[0]
                                                                 - (float)((float)(v402.f32[0] * -4096.0)
                                                                         - (float)(v402.f32[0]
                                                                                 + (float)(v402.f32[0] * -4096.0))))))
                                 - (float)(v326 - v325))
                         + (float)(v325 - (float)(v326 - (float)(v326 - v325)));
                    v328 = v326 - (float)(v419.f32[0] * v248);
                    v329 = (float)(v326 - (float)(v328 - (float)-(float)(v419.f32[0] * v248)))
                         + (float)((float)-(float)(v419.f32[0] * v248)
                                 - (float)(v328 - (float)(v328 - (float)-(float)(v419.f32[0] * v248))));
                    v330 = v329 - (float)(v402.f32[0] * v417.f32[0]);
                    v464 = v327;
                    v465 = (float)((float)-(float)(v402.f32[0] * v417.f32[0]) - (float)(v330 - v329))
                         + (float)(v329 - (float)(v330 - (float)(v330 - v329)));
                    v466 = (float)(v330 - (float)((float)(v328 + v330) - v328))
                         + (float)(v328 - (float)((float)(v328 + v330) - (float)((float)(v328 + v330) - v328)));
                    v467 = v328 + v330;
                    v331 = 4;
                    v332 = sub_1DEE659F0(4, &v468, 4, &v464, v425);
                    v381 = v322;
                    v333 = v382 * v322;
                    _S9 = v25.f32[1];
                    v334 = -(float)((float)((float)((float)(v333 - (float)(v312 * v315)) - (float)(v313 * v315))
                                          - (float)(v312 * v316))
                                  - (float)(v313 * v316));
                    v335 = vmul_f32(v402, v412).f32[0];
                    v336 = v402.f32[0] * 4096.0;
                    v337 = -(float)((float)((float)((float)(v335
                                                          - (float)(v323 * (float)(v336 - (float)(v336 - v402.f32[0]))))
                                                  - (float)(v324 * (float)(v336 - (float)(v336 - v402.f32[0]))))
                                          - (float)(v323
                                                  * (float)(v402.f32[0] - (float)(v336 - (float)(v336 - v402.f32[0])))))
                                  - (float)(v324 * (float)(v402.f32[0] - (float)(v336 - (float)(v336 - v402.f32[0])))));
                    v338 = v334 - v337;
                    v339 = (float)((float)(v334 - (float)(v334 - v337)) - v337)
                         + (float)(v334 - (float)((float)(v334 - v337) + (float)(v334 - (float)(v334 - v337))));
                    v340 = v333 + (float)(v334 - v337);
                    v341 = (float)(v338 - (float)((float)(v333 + v338) - v333))
                         + (float)(v333 - (float)((float)(v333 + v338) - (float)((float)(v333 + v338) - v333)));
                    v422[1] = (float)((float)(v341 - (float)(v341 - v335)) - v335)
                            + (float)(v341 - (float)((float)(v341 - v335) + (float)(v341 - (float)(v341 - v335))));
                    v422[2] = (float)((float)(v341 - v335) - (float)((float)(v340 + (float)(v341 - v335)) - v340))
                            + (float)(v340
                                    - (float)((float)(v340 + (float)(v341 - v335))
                                            - (float)((float)(v340 + (float)(v341 - v335)) - v340)));
                    v422[3] = v340 + (float)(v341 - v335);
LABEL_114:
                    v422[0] = v339;
                    if (v408.f32[0] != 0.0)
                    {
                      v342 = sub_1DEE65BF8(v375, v439, v462, v408.f32[0]);
                      v343 = sub_1DEE65BF8(v332, v425, v433, v408.f32[0]);
                      v344 = sub_1DEE65BF8(v343, v433, v459, v418.f32[0] + v418.f32[0]);
                      v345 = sub_1DEE659F0(v342, v462, v344, v459, v457);
                      v346 = sub_1DEE659F0(v81, v151, v345, v457, v184);
                      if (v402.f32[0] == 0.0)
                      {
                        v349 = v151;
                        v151 = v184;
                      }
                      else
                      {
                        v347 = sub_1DEE65BF8(4, v473, v463, v408.f32[0]);
                        v348 = sub_1DEE65BF8(v347, v463, v462, v402.f32[0]);
                        v346 = sub_1DEE659F0(v346, v184, v348, v462, v151);
                        v349 = v184;
                      }
                      if (v381 == 0.0)
                      {
                        v354 = v349;
                        v349 = v151;
                        v151 = v354;
                        v353 = v408.f32[0];
                      }
                      else
                      {
                        v350 = sub_1DEE65BF8(4, v474, v463, -v408.f32[0]);
                        v351 = sub_1DEE65BF8(v350, v463, v462, v381);
                        v352 = sub_1DEE659F0(v346, v151, v351, v462, v349);
                        v353 = v408.f32[0];
                        v346 = v352;
                        v354 = v151;
                      }
                      v355 = sub_1DEE65BF8(v343, v433, v459, v353);
                      v356 = sub_1DEE65BF8(v331, v422, v427, v408.f32[0]);
                      v357 = sub_1DEE65BF8(v356, v427, v462, v418.f32[0] + v418.f32[0]);
                      v358 = sub_1DEE65BF8(v356, v427, v461, v408.f32[0]);
                      v359 = sub_1DEE659F0(v357, v462, v358, v461, v458);
                      v360 = sub_1DEE659F0(v355, v459, v359, v458, v456);
                      v81 = sub_1DEE659F0(v346, v349, v360, v456, v354);
                      v184 = v349;
                    }
                    if (v117 != 0.0)
                    {
                      v361 = sub_1DEE65BF8(v386, v438, v462, v117);
                      v362 = sub_1DEE65BF8(v332, v425, v432, v117);
                      v363 = sub_1DEE65BF8(v362, v432, v459, _S9 + _S9);
                      v364 = sub_1DEE659F0(v361, v462, v363, v459, v457);
                      v365 = sub_1DEE659F0(v81, v151, v364, v457, v184);
                      v366 = sub_1DEE65BF8(v362, v432, v459, v117);
                      v367 = sub_1DEE65BF8(v331, v422, v426, v117);
                      v368 = sub_1DEE65BF8(v367, v426, v462, _S9 + _S9);
                      v369 = sub_1DEE65BF8(v367, v426, v461, v117);
                      v370 = sub_1DEE659F0(v368, v462, v369, v461, v458);
                      v371 = sub_1DEE659F0(v366, v459, v370, v458, v456);
                      v81 = sub_1DEE659F0(v365, v184, v371, v456, v151);
                    }
                  }
                  return v151[v81 - 1];
                }
LABEL_94:
                v380 = v118;
                v250 = _S9;
                v251 = (float)(v408.f32[0] * 4096.0) - (float)((float)(v408.f32[0] * 4096.0) - v408.f32[0]);
                v252 = v408.f32[0] - v251;
                v253 = -(float)((float)((float)((float)(v376 - (float)(v251 * v387))
                                              - (float)((float)(v408.f32[0] - v251) * v387))
                                      - (float)(v251 * v388))
                              - (float)((float)(v408.f32[0] - v251) * v388));
                v254 = vmul_f32(v418, v402).f32[0];
                v255 = (float)(v402.f32[0] * 4096.0) - (float)((float)(v402.f32[0] * 4096.0) - v402.f32[0]);
                v256 = v253
                     - (float)((float)((float)((float)(v254 + (float)(v134 * v255)) + (float)(v396 * v255))
                                     + (float)(v134 * (float)(v402.f32[0] - v255)))
                             - (float)(v398 * (float)(v402.f32[0] - v255)));
                v257 = (float)((float)-(float)((float)((float)((float)(v254 + (float)(v134 * v255))
                                                             + (float)(v396 * v255))
                                                     + (float)(v134 * (float)(v402.f32[0] - v255)))
                                             - (float)(v398 * (float)(v402.f32[0] - v255)))
                             - (float)(v256 - v253))
                     + (float)(v253 - (float)(v256 - (float)(v256 - v253)));
                v258 = v376 + v256;
                v259 = (float)(v256 - (float)((float)(v376 + v256) - v376))
                     + (float)(v376 - (float)((float)(v376 + v256) - (float)((float)(v376 + v256) - v376)));
                v468 = v257;
                v469 = (float)(v254 - (float)((float)(v254 + v259) - v259))
                     + (float)(v259 - (float)((float)(v254 + v259) - (float)((float)(v254 + v259) - v259)));
                v470 = (float)((float)(v254 + v259) - (float)((float)(v258 + (float)(v254 + v259)) - v258))
                     + (float)(v258
                             - (float)((float)(v258 + (float)(v254 + v259))
                                     - (float)((float)(v258 + (float)(v254 + v259)) - v258)));
                v471 = v258 + (float)(v254 + v259);
                v260 = (float)(v116 * 4096.0) - (float)((float)(v116 * 4096.0) - v116);
                v261 = v116 - v260;
                v262 = -(float)((float)((float)((float)((float)-(float)(v250 * v116)
                                                      - (float)(v260
                                                              * (float)((float)(v250 * -4096.0)
                                                                      - (float)(v250 + (float)(v250 * -4096.0)))))
                                              - (float)((float)(v116 - v260)
                                                      * (float)((float)(v250 * -4096.0)
                                                              - (float)(v250 + (float)(v250 * -4096.0)))))
                                      - (float)(v260
                                              * (float)((float)-v250
                                                      - (float)((float)(v250 * -4096.0)
                                                              - (float)(v250 + (float)(v250 * -4096.0))))))
                              - (float)((float)(v116 - v260)
                                      * (float)((float)-v250
                                              - (float)((float)(v250 * -4096.0) - (float)(v250 + (float)(v250 * -4096.0))))));
                v263 = v262
                     - (float)((float)((float)((float)((float)(v406
                                                             * (float)((float)(v117 * -4096.0)
                                                                     - (float)(v117 + (float)(v117 * -4096.0))))
                                                     - (float)(v117 * v419.f32[1]))
                                             + (float)(v394
                                                     * (float)((float)(v117 * -4096.0)
                                                             - (float)(v117 + (float)(v117 * -4096.0)))))
                                     + (float)(v406
                                             * (float)((float)-v117
                                                     - (float)((float)(v117 * -4096.0)
                                                             - (float)(v117 + (float)(v117 * -4096.0))))))
                             - (float)(v397
                                     * (float)((float)-v117
                                             - (float)((float)(v117 * -4096.0) - (float)(v117 + (float)(v117 * -4096.0))))));
                v264 = (float)((float)-(float)((float)((float)((float)((float)(v406
                                                                             * (float)((float)(v117 * -4096.0)
                                                                                     - (float)(v117
                                                                                             + (float)(v117 * -4096.0))))
                                                                     - (float)(v117 * v419.f32[1]))
                                                             + (float)(v394
                                                                     * (float)((float)(v117 * -4096.0)
                                                                             - (float)(v117 + (float)(v117 * -4096.0)))))
                                                     + (float)(v406
                                                             * (float)((float)-v117
                                                                     - (float)((float)(v117 * -4096.0)
                                                                             - (float)(v117 + (float)(v117 * -4096.0))))))
                                             - (float)(v397
                                                     * (float)((float)-v117
                                                             - (float)((float)(v117 * -4096.0)
                                                                     - (float)(v117 + (float)(v117 * -4096.0))))))
                             - (float)(v263 - v262))
                     + (float)(v262 - (float)(v263 - (float)(v263 - v262)));
                v265 = v263 - (float)(v250 * v116);
                v266 = (float)(v263 - (float)(v265 - (float)-(float)(v250 * v116)))
                     + (float)((float)-(float)(v250 * v116)
                             - (float)(v265 - (float)(v265 - (float)-(float)(v250 * v116))));
                v267 = v266 - (float)(v117 * v419.f32[1]);
                v464 = v264;
                v465 = (float)((float)-(float)(v117 * v419.f32[1]) - (float)(v267 - v266))
                     + (float)(v266 - (float)(v267 - (float)(v267 - v266)));
                v466 = (float)(v267 - (float)((float)(v265 + v267) - v265))
                     + (float)(v265 - (float)((float)(v265 + v267) - (float)((float)(v265 + v267) - v265)));
                v467 = v265 + v267;
                v268 = 4;
                v269 = sub_1DEE659F0(4, &v468, 4, &v464, v423);
                v270 = vmul_f32(v402, v408).f32[0];
                v271 = (float)((float)(v270 - (float)(v251 * v255)) - (float)((float)(v408.f32[0] - v251) * v255))
                     - (float)(v251 * (float)(v402.f32[0] - v255));
                v137 = v416;
                v272 = -(float)(v271 - (float)(v252 * (float)(v402.f32[0] - v255)));
                v248 = v412.f32[0];
                v273 = (float)(v117 * 4096.0) - (float)((float)(v117 * 4096.0) - v117);
                v274 = v117 - v273;
                v275 = (float)((float)((float)(v116 * v117) - (float)(v260 * v273))
                             - (float)((float)(v116 - v260) * v273))
                     - (float)(v260 * (float)(v117 - v273));
                v118 = v380;
                v276 = -(float)(v275 - (float)(v261 * v274));
                v277 = v272 - v276;
                v278 = (float)((float)(v272 - (float)(v272 - v276)) - v276)
                     + (float)(v272 - (float)((float)(v272 - v276) + (float)(v272 - (float)(v272 - v276))));
                v279 = v270 + v277;
                v280 = (float)(v277 - (float)((float)(v270 + v277) - v270))
                     + (float)(v270 - (float)((float)(v270 + v277) - (float)((float)(v270 + v277) - v270)));
                v281 = v280 - (float)(v116 * v117);
                v420[1] = (float)((float)(v280 - v281) - (float)(v116 * v117))
                        + (float)(v280 - (float)(v281 + (float)(v280 - v281)));
                v420[2] = (float)(v281 - (float)((float)(v279 + v281) - v279))
                        + (float)(v279 - (float)((float)(v279 + v281) - (float)((float)(v279 + v281) - v279)));
                v420[3] = v279 + v281;
                goto LABEL_98;
              }
LABEL_95:
              if (v249)
                goto LABEL_111;
              return v151[v81 - 1];
            }
            v193 = v184;
            v184 = v151;
          }
          else
          {
            v386 = sub_1DEE65BF8(4, v494, v438, v117);
            v185 = sub_1DEE65BF8(v386, v438, v462, v25.f32[1] + v25.f32[1]);
            v186 = sub_1DEE65BF8(4, v474, v445, v117);
            v187 = sub_1DEE65BF8(v186, v445, v461, v417.f32[0]);
            v188 = sub_1DEE65BF8(4, v473, v444, v117);
            v189 = sub_1DEE65BF8(v188, v444, v460, -v419.f32[1]);
            v190 = sub_1DEE659F0(v185, v462, v187, v461, v459);
            v191 = sub_1DEE659F0(v189, v460, v190, v459, v457);
            v81 = sub_1DEE659F0(v81, v151, v191, v457, v184);
            v192 = v184;
            v193 = v151;
            if (!v135)
              goto LABEL_78;
          }
          v151 = v184;
          v194 = v416;
          v195 = (float)(v412.f32[0] * 4096.0) - (float)((float)(v412.f32[0] * 4096.0) - v412.f32[0]);
          v196 = -(float)((float)((float)((float)(v379 - (float)(v195 * v389))
                                        - (float)((float)(v412.f32[0] - v195) * v389))
                                - (float)(v195 * v390))
                        - (float)((float)(v412.f32[0] - v195) * v390));
          v197 = (float)(v117 * 4096.0) - (float)((float)(v117 * 4096.0) - v117);
          v198 = v196
               - (float)((float)((float)((float)((float)(v417.f32[0] * v117) + (float)(v400 * v197))
                                       + (float)(v410 * v197))
                               + (float)(v400 * (float)(v117 - v197)))
                       - (float)(v415 * (float)(v117 - v197)));
          v199 = (float)((float)-(float)((float)((float)((float)((float)(v417.f32[0] * v117) + (float)(v400 * v197))
                                                       + (float)(v410 * v197))
                                               + (float)(v400 * (float)(v117 - v197)))
                                       - (float)(v415 * (float)(v117 - v197)))
                       - (float)(v198 - v196))
               + (float)(v196 - (float)(v198 - (float)(v198 - v196)));
          v200 = v379 + v198;
          v201 = (float)(v198 - (float)((float)(v379 + v198) - v379))
               + (float)(v379 - (float)((float)(v379 + v198) - (float)((float)(v379 + v198) - v379)));
          v202 = (float)(v417.f32[0] * v117) + v201;
          v468 = v199;
          v469 = (float)((float)(v417.f32[0] * v117) - (float)(v202 - v201))
               + (float)(v201 - (float)(v202 - (float)(v202 - v201)));
          v470 = (float)(v202 - (float)((float)(v200 + v202) - v200))
               + (float)(v200 - (float)((float)(v200 + v202) - (float)((float)(v200 + v202) - v200)));
          v471 = v200 + v202;
          v203 = (float)(v408.f32[0] * 4096.0) - (float)((float)(v408.f32[0] * 4096.0) - v408.f32[0]);
          v204 = -(float)((float)((float)((float)((float)-(float)(v194 * v408.f32[0])
                                                - (float)(v203
                                                        * (float)((float)(v194 * -4096.0)
                                                                - (float)(v194 + (float)(v194 * -4096.0)))))
                                        - (float)((float)(v408.f32[0] - v203)
                                                * (float)((float)(v194 * -4096.0)
                                                        - (float)(v194 + (float)(v194 * -4096.0)))))
                                - (float)(v203
                                        * (float)((float)-v416
                                                - (float)((float)(v194 * -4096.0)
                                                        - (float)(v194 + (float)(v194 * -4096.0))))))
                        - (float)((float)(v408.f32[0] - v203)
                                * (float)((float)-v416
                                        - (float)((float)(v194 * -4096.0) - (float)(v194 + (float)(v194 * -4096.0))))));
          v391 = -v32;
          v205 = v204
               - (float)((float)((float)((float)((float)(v391
                                                       * (float)((float)(v118 * -4096.0)
                                                               - (float)(v118 + (float)(v118 * -4096.0))))
                                               - (float)(v118 * v418.f32[0]))
                                       + (float)(v396
                                               * (float)((float)(v118 * -4096.0)
                                                       - (float)(v118 + (float)(v118 * -4096.0)))))
                               + (float)(v391
                                       * (float)((float)-v118
                                               - (float)((float)(v118 * -4096.0)
                                                       - (float)(v118 + (float)(v118 * -4096.0))))))
                       - (float)(v398
                               * (float)((float)-v118
                                       - (float)((float)(v118 * -4096.0) - (float)(v118 + (float)(v118 * -4096.0))))));
          v206 = (float)((float)-(float)((float)((float)((float)((float)(v391
                                                                       * (float)((float)(v118 * -4096.0)
                                                                               - (float)(v118 + (float)(v118 * -4096.0))))
                                                               - (float)(v118 * v418.f32[0]))
                                                       + (float)(v396
                                                               * (float)((float)(v118 * -4096.0)
                                                                       - (float)(v118 + (float)(v118 * -4096.0)))))
                                               + (float)(v391
                                                       * (float)((float)-v118
                                                               - (float)((float)(v118 * -4096.0)
                                                                       - (float)(v118 + (float)(v118 * -4096.0))))))
                                       - (float)(v398
                                               * (float)((float)-v118
                                                       - (float)((float)(v118 * -4096.0)
                                                               - (float)(v118 + (float)(v118 * -4096.0))))))
                       - (float)(v205 - v204))
               + (float)(v204 - (float)(v205 - (float)(v205 - v204)));
          v207 = v205 - (float)(v416 * v408.f32[0]);
          v208 = (float)(v205
                       - (float)((float)(v205 - (float)(v194 * v408.f32[0])) - (float)-(float)(v194 * v408.f32[0])))
               + (float)((float)-(float)(v194 * v408.f32[0])
                       - (float)((float)(v205 - (float)(v194 * v408.f32[0]))
                               - (float)((float)(v205 - (float)(v194 * v408.f32[0]))
                                       - (float)-(float)(v194 * v408.f32[0]))));
          v209 = v208 - (float)(v118 * v418.f32[0]);
          v464 = v206;
          v465 = (float)((float)-(float)(v118 * v418.f32[0]) - (float)(v209 - v208))
               + (float)(v208 - (float)(v209 - (float)(v209 - v208)));
          v466 = (float)(v209 - (float)((float)(v207 + v209) - v207))
               + (float)(v207 - (float)((float)(v207 + v209) - (float)((float)(v207 + v209) - v207)));
          v467 = v207 + v209;
          v210 = 4;
          v211 = sub_1DEE659F0(4, &v468, 4, &v464, v424);
          v383 = v117;
          v212 = -(float)((float)((float)((float)((float)(v412.f32[0] * v117) - (float)(v195 * v197))
                                        - (float)((float)(v412.f32[0] - v195) * v197))
                                - (float)(v195 * (float)(v117 - v197)))
                        - (float)((float)(v412.f32[0] - v195) * (float)(v117 - v197)));
          v213 = -(float)((float)((float)((float)((float)(v118 * v408.f32[0])
                                                - (float)(v203
                                                        * (float)((float)(v118 * 4096.0)
                                                                - (float)((float)(v118 * 4096.0) - v118))))
                                        - (float)((float)(v408.f32[0] - v203)
                                                * (float)((float)(v118 * 4096.0) - (float)((float)(v118 * 4096.0) - v118))))
                                - (float)(v203
                                        * (float)(v118
                                                - (float)((float)(v118 * 4096.0) - (float)((float)(v118 * 4096.0) - v118)))))
                        - (float)((float)(v408.f32[0] - v203)
                                * (float)(v118 - (float)((float)(v118 * 4096.0) - (float)((float)(v118 * 4096.0) - v118)))));
          v214 = v212 - v213;
          v215 = (float)((float)(v212 - (float)(v212 - v213)) - v213)
               + (float)(v212 - (float)((float)(v212 - v213) + (float)(v212 - (float)(v212 - v213))));
          v216 = (float)(v412.f32[0] * v117) + (float)(v212 - v213);
          v217 = (float)(v214 - (float)(v216 - (float)(v412.f32[0] * v117)))
               + (float)((float)(v412.f32[0] * v117) - (float)(v216 - (float)(v216 - (float)(v412.f32[0] * v117))));
          v218 = v217 - (float)(v118 * v408.f32[0]);
          v421[1] = (float)((float)(v217 - v218) - (float)(v118 * v408.f32[0]))
                  + (float)(v217 - (float)(v218 + (float)(v217 - v218)));
          v421[2] = (float)(v218 - (float)((float)(v216 + v218) - v216))
                  + (float)(v216 - (float)((float)(v216 + v218) - (float)((float)(v216 + v218) - v216)));
          v421[3] = v216 + v218;
          v184 = v193;
          goto LABEL_80;
        }
      }
    }
  }
  return result;
}

float _simd_insphere_pf3(simd_float3 a1, simd_float3 a2, simd_float3 a3, simd_float3 a4, simd_float3 a5)
{
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  int8x16_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  int32x2_t v35;
  int8x16_t v36;
  int8x16_t v37;
  float v38;
  float v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float32x4_t v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float32x4_t v79;
  float32x4_t v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float32x4_t v91;
  float v92;
  float v93;
  float v94;
  float v95;
  float v96;
  float v97;
  float v98;
  float v99;
  float v100;
  float v101;
  float v102;
  float v103;
  float v104;
  float v105;
  float v106;
  float v107;
  float v108;
  float v109;
  float v110;
  float v111;
  int v113;
  int v114;
  int v115;
  int v116;
  int v117;
  int v118;
  int v119;
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;
  int v126;
  int v127;
  int v128;
  int v129;
  int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  int v144;
  int v145;
  int v146;
  int v148;
  int v149;
  int v150;
  int v151;
  int v152;
  int v153;
  int v154;
  int v155;
  int v156;
  int v157;
  int v158;
  int v159;
  int v160;
  int v161;
  int v162;
  int v163;
  int v164;
  int v165;
  int v166;
  int v167;
  int v168;
  uint64_t v169;
  float *v170;
  float v171;
  float v172;
  BOOL v173;
  float32x4_t v175;
  float v176;
  float v177;
  float32x4_t v178;
  float32x4_t v179;
  float v180;
  float v181;
  float32x4_t v182;
  float32x4_t v183;
  uint8x8_t v186;
  int v187;
  float v196;
  float v198;
  float v201;
  float v202;
  float v204;
  float v209;
  float v212;
  float v214;
  float v215;
  float v217;
  float v219;
  float v223;
  float v226;
  float v227;
  float v228;
  float v229;
  float v230;
  float v231;
  float v232;
  float v233;
  float v234;
  float v235;
  float v236;
  float v237;
  float v238;
  float v239;
  float v240;
  float v241;
  float v242;
  float v243;
  float v244;
  float v245;
  float v246;
  float v247;
  float v248;
  float v249;
  float v250;
  float v251;
  float v252;
  float v253;
  float v254;
  float v255;
  float v256;
  float v257;
  float v258;
  float v259;
  float v260;
  float v261;
  float v262;
  float v263;
  float v264;
  float v265;
  float v266;
  float v267;
  float v268;
  float v269;
  float v270;
  float v271;
  float v272;
  float v273;
  float v274;
  float v275;
  float v276;
  float v277;
  float v278;
  float v279;
  float v280;
  float v281;
  float v282;
  float v283;
  float v284;
  float v285;
  float v286;
  float v287;
  float v288;
  float v289;
  float v290;
  float v291;
  float v292;
  float v293;
  float v294;
  float v295;
  float v296;
  float v297;
  float v298;
  float v299;
  float v300;
  float v301;
  float v302;
  float v303;
  float v304;
  float v305;
  int v306;
  int v307;
  int v308;
  int v309;
  int v310;
  int v311;
  int v312;
  int v313;
  int v314;
  int v315;
  int v316;
  int v317;
  int v318;
  int v319;
  int v320;
  int v321;
  int v322;
  int v323;
  int v324;
  int v325;
  int v326;
  int v327;
  int v328;
  int v329;
  int v330;
  int v331;
  int v332;
  int v333;
  int v334;
  int v335;
  int v336;
  int v337;
  int v338;
  int v339;
  int v340;
  int v341;
  int v342;
  int v343;
  int v344;
  int v345;
  int v346;
  int v347;
  int v348;
  int v349;
  int v350;
  int v351;
  int v352;
  int v353;
  int v354;
  int v355;
  uint64_t v356;
  float *v357;
  int v358;
  int v359;
  int v360;
  int v361;
  int v362;
  int v363;
  int v364;
  int v365;
  int v366;
  int v367;
  int v368;
  uint64_t v369;
  float *v370;
  int v371;
  int v372;
  int v373;
  int v374;
  int v375;
  int v376;
  int v377;
  int v378;
  int v379;
  int v380;
  int v381;
  uint64_t v382;
  float *v383;
  int v384;
  int v385;
  int v386;
  int v387;
  int v388;
  int v389;
  int v390;
  int v391;
  int v392;
  int v393;
  int v394;
  uint64_t v395;
  float *v396;
  int v397;
  int v398;
  int v399;
  int v400;
  int v401;
  int v402;
  int v403;
  int v404;
  int v405;
  int v406;
  int v407;
  uint64_t v408;
  float *v409;
  int v410;
  int v411;
  int v412;
  int v413;
  int v414;
  int v415;
  int v416;
  int v417;
  int v418;
  int v419;
  int v420;
  int v421;
  float v423;
  float v424;
  float v425;
  float v426;
  float v427;
  float v428;
  float v429;
  float32x4_t v430;
  float v431;
  float32x4_t v432;
  float32x4_t v433;
  float32x4_t v434;
  float32x4_t v435;
  int8x16_t v436;
  float v437;
  float v438;
  float v439;
  float v440;
  float v441;
  float v442;
  float v443;
  float v444;
  float v445;
  float v446;
  int v447;
  float32x4_t v448;
  float32x4_t v449;
  float32x4_t v450;
  float32x4_t v451;
  float v452;
  int v453;
  float32x4_t v454;
  int v455;
  __int32 v456;
  int v457;
  float v458[576];
  float v459[576];
  float v460[288];
  float v461[288];
  float v462[288];
  float v463[288];
  float v464[192];
  float v465[96];
  float v466[96];
  float v467[96];
  float v468[48];
  float v469[24];
  float v470[16];
  float v471[8];
  float v472[8];
  float v473[8];
  float v474[4];
  float v475[4];
  float v476[4];
  float v477[4];
  float v478[4];
  float v479[4];
  float v480[5760];
  float v481[3456];
  float v482[2304];
  float v483[2304];
  float v484[1152];
  float v485[1152];
  float v486[1152];
  float v487[1152];
  float v488[1152];
  float v489[768];
  float v490[384];
  float v491[384];
  float v492[384];
  float v493[192];
  float v494[96];
  float v495[96];
  float v496[96];
  float v497[96];
  float v498[96];
  float v499[48];
  float v500[48];
  float v501[24];
  float v502[24];
  float v503[24];
  float v504[24];
  float v505[24];
  float v506[24];
  float v507[24];
  float v508[24];
  float v509[24];
  float v510[24];
  float v511[16];
  float v512[8];
  float v513[8];
  float v514[4];
  float v515[4];
  float v516[4];
  float v517[4];
  float v518[4];
  float v519[4];
  float v520[4];
  float v521[4];
  float v522[4];
  float v523[6];

  *(double *)v5.i64 = ((double (*)())MEMORY[0x1E0C86820])();
  v8 = v7;
  v10 = v9;
  v12 = (int8x16_t)v11;
  v13 = v5;
  v14 = vsubq_f32(v6, v5);
  v15 = vmulq_f32(v14, v14);
  v16 = v14;
  v16.i32[3] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v15, 2), vaddq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 1))).u32[0];
  v17 = vsubq_f32(v11, v13);
  v18 = vmulq_f32(v17, v17);
  v17.i32[3] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v18, 2), vaddq_f32(v18, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v18.f32, 1))).u32[0];
  v19 = vsubq_f32(v9, v13);
  v20 = vmulq_f32(v19, v19);
  v19.i32[3] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v20, 2), vaddq_f32(v20, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 1))).u32[0];
  v21 = vsubq_f32(v7, v13);
  v22 = vmulq_f32(v21, v21);
  v21.i32[3] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 2), vaddq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.f32, 1))).u32[0];
  v23 = (float32x4_t)vextq_s8((int8x16_t)v17, (int8x16_t)v17, 4uLL);
  v24 = (float32x4_t)vextq_s8((int8x16_t)v17, (int8x16_t)v17, 8uLL);
  v25 = (float32x4_t)vextq_s8((int8x16_t)v17, (int8x16_t)v17, 0xCuLL);
  v26 = (float32x4_t)vextq_s8((int8x16_t)v19, (int8x16_t)v19, 4uLL);
  v27 = (float32x4_t)vextq_s8((int8x16_t)v19, (int8x16_t)v19, 8uLL);
  v28 = (float32x4_t)vextq_s8((int8x16_t)v19, (int8x16_t)v19, 0xCuLL);
  v29 = (float32x4_t)vextq_s8((int8x16_t)v21, (int8x16_t)v21, 4uLL);
  v30 = (float32x4_t)vextq_s8((int8x16_t)v21, (int8x16_t)v21, 8uLL);
  v31 = (float32x4_t)vextq_s8((int8x16_t)v21, (int8x16_t)v21, 0xCuLL);
  v32 = vmulq_f32(v28, v30);
  v33 = vmulq_f32(v26, v31);
  v34 = vmulq_f32(v27, v29);
  v36 = (int8x16_t)vmulq_f32(v16, vmlaq_f32(vmlaq_f32(vmulq_f32(v24, vmlaq_f32(vnegq_f32(v33), v29, v28)), vmlaq_f32(vnegq_f32(v32), v31, v27), v23), vmlaq_f32(vnegq_f32(v34), v30, v26), v25));
  v35 = (int32x2_t)vextq_s8(v36, v36, 8uLL).u64[0];
  *(float32x2_t *)v36.i8 = vsub_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v36.i8, v35), (float32x2_t)vzip2_s32(*(int32x2_t *)v36.i8, v35));
  *(float *)v36.i32 = vaddv_f32(*(float32x2_t *)v36.i8);
  v37 = (int8x16_t)vmulq_f32(vmlaq_f32(vmlaq_f32(vmulq_f32(vaddq_f32(vabsq_f32(vmulq_f32(v28, v29)), vabsq_f32(v33)), vabsq_f32(v24)), vaddq_f32(vabsq_f32(vmulq_f32(v27, v31)), vabsq_f32(v32)), vabsq_f32(v23)), vaddq_f32(vabsq_f32(vmulq_f32(v26, v30)), vabsq_f32(v34)), vabsq_f32(v25)), vabsq_f32(v16));
  v38 = vaddv_f32(vadd_f32(*(float32x2_t *)v37.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v37, v37, 8uLL)));
  if (*(float *)v36.i32 <= (float)(v38 * 0.00000095368) && (float)(v38 * 0.00000095368) >= (float)-*(float *)v36.i32)
  {
    v444 = v38;
    v36.i32[0] = v6.i32[1];
    v439 = v6.f32[1];
    v40 = v6.f32[1] - v13.f32[1];
    v41 = (float32x4_t)vextq_s8(v36, v12, 0xCuLL);
    v448 = v6;
    v41.i32[0] = v6.i32[2];
    v430 = v10;
    v10.i32[3] = v8.i32[0];
    v42 = v13;
    v42.i32[3] = v13.i32[0];
    v435 = v41;
    v436 = v12;
    v433 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v13, (int32x4_t)v13), (int8x16_t)v13, 0xCuLL);
    v434 = v10;
    v43 = vsubq_f32(v41, v433);
    v432 = v42;
    v44 = vsubq_f32(v10, v42);
    v446 = v43.f32[2];
    v45 = vmuls_lane_f32(v14.f32[0], v43, 2);
    v46 = (float)(4096.0 * v14.f32[0]) - (float)((float)(4096.0 * v14.f32[0]) - v14.f32[0]);
    v47 = v14.f32[0] - v46;
    v48 = vmuls_lane_f32(4096.0, v43, 2);
    v49 = v48 - (float)(v48 - v43.f32[2]);
    v50 = -(float)((float)((float)((float)(v45 - (float)(v46 * v49)) - (float)((float)(v14.f32[0] - v46) * v49))
                         - (float)(v46 * (float)(v43.f32[2] - v49)))
                 - (float)((float)(v14.f32[0] - v46) * (float)(v43.f32[2] - v49)));
    v51 = v43.f32[1];
    v52 = vmuls_lane_f32(v40, *(float32x2_t *)v43.f32, 1);
    v41.f32[0] = vmuls_lane_f32(4096.0, *(float32x2_t *)v43.f32, 1);
    v41.f32[0] = v41.f32[0] - (float)(v41.f32[0] - v43.f32[1]);
    v53 = (float)(v40 * 4096.0) - (float)((float)(v40 * 4096.0) - v40);
    v54 = v40 - v53;
    v55 = -(float)((float)((float)((float)(v52 - (float)(v41.f32[0] * v53))
                                 - (float)((float)(v43.f32[1] - v41.f32[0]) * v53))
                         - (float)(v41.f32[0] * (float)(v40 - v53)))
                 - (float)((float)(v43.f32[1] - v41.f32[0]) * (float)(v40 - v53)));
    v56 = v50 - v55;
    v57 = (float)((float)(v50 - (float)(v50 - v55)) - v55)
        + (float)(v50 - (float)((float)(v50 - v55) + (float)(v50 - (float)(v50 - v55))));
    v58 = v45 + v56;
    v59 = (float)(v56 - (float)((float)(v45 + v56) - v45))
        + (float)(v45 - (float)((float)(v45 + v56) - (float)((float)(v45 + v56) - v45)));
    v479[0] = v57;
    v479[1] = (float)((float)(v59 - (float)(v59 - v52)) - v52)
            + (float)(v59 - (float)((float)(v59 - v52) + (float)(v59 - (float)(v59 - v52))));
    v60 = v58 + (float)(v59 - v52);
    v440 = (float)((float)(v59 - v52) - (float)(v60 - v58)) + (float)(v58 - (float)(v60 - (float)(v60 - v58)));
    v61 = vmuls_lane_f32(v43.f32[1], *(float32x2_t *)v44.f32, 1);
    v62 = vmuls_lane_f32(4096.0, *(float32x2_t *)v44.f32, 1);
    v63 = v62 - (float)(v62 - v44.f32[1]);
    v442 = v44.f32[1];
    v64 = -(float)((float)((float)((float)(v61 - (float)(v41.f32[0] * v63))
                                 - (float)((float)(v43.f32[1] - v41.f32[0]) * v63))
                         - (float)(v41.f32[0] * (float)(v44.f32[1] - v63)))
                 - (float)((float)(v43.f32[1] - v41.f32[0]) * (float)(v44.f32[1] - v63)));
    v65 = vmuls_lane_f32(v44.f32[0], v43, 2);
    v66 = (float)(4096.0 * v44.f32[0]) - (float)((float)(4096.0 * v44.f32[0]) - v44.f32[0]);
    v67 = v44.f32[0] - v66;
    v68 = v44;
    v44.f32[0] = -(float)((float)((float)((float)(v65 - (float)(v66 * v49)) - (float)((float)(v44.f32[0] - v66) * v49))
                                - (float)(v66 * (float)(v43.f32[2] - v49)))
                        - (float)((float)(v44.f32[0] - v66) * (float)(v43.f32[2] - v49)));
    v69 = v64 - v44.f32[0];
    v70 = (float)((float)(v64 - (float)(v64 - v44.f32[0])) - v44.f32[0])
        + (float)(v64 - (float)((float)(v64 - v44.f32[0]) + (float)(v64 - (float)(v64 - v44.f32[0]))));
    v44.f32[0] = v61 + v69;
    v71 = (float)(v69 - (float)((float)(v61 + v69) - v61))
        + (float)(v61 - (float)((float)(v61 + v69) - (float)((float)(v61 + v69) - v61)));
    v478[0] = v70;
    v478[1] = (float)((float)(v71 - (float)(v71 - v65)) - v65)
            + (float)(v71 - (float)((float)(v71 - v65) + (float)(v71 - (float)(v71 - v65))));
    v72 = v44.f32[0] + (float)(v71 - v65);
    v438 = v13.f32[1];
    v478[2] = (float)((float)(v71 - v65) - (float)(v72 - v44.f32[0]))
            + (float)(v44.f32[0] - (float)(v72 - (float)(v72 - v44.f32[0])));
    v73 = (float)((float)(v8.f32[1] - v13.f32[1]) * 4096.0)
        - (float)((float)((float)(v8.f32[1] - v13.f32[1]) * 4096.0) - (float)(v8.f32[1] - v13.f32[1]));
    v441 = v68.f32[3];
    v74 = vmuls_lane_f32(4096.0, v68, 3);
    v75 = v74 - (float)(v74 - v68.f32[3]);
    v76 = (float)(v8.f32[1] - v13.f32[1]) * v68.f32[0];
    v44.f32[0] = (float)(v8.f32[1] - v13.f32[1]) - v73;
    v77 = -(float)((float)((float)((float)(v76 - (float)(v66 * v73)) - (float)(v67 * v73)) - (float)(v66 * v44.f32[0]))
                 - (float)(v67 * v44.f32[0]));
    v78 = vmuls_lane_f32(v44.f32[1], v68, 3);
    v79 = v68;
    v80 = v14;
    v81 = -(float)((float)((float)((float)(v78 - (float)(v75 * v63)) - (float)((float)(v68.f32[3] - v75) * v63))
                         - (float)(v75 * (float)(v44.f32[1] - v63)))
                 - (float)((float)(v68.f32[3] - v75) * (float)(v44.f32[1] - v63)));
    v82 = v77 - v81;
    v83 = (float)((float)(v77 - (float)(v77 - v81)) - v81)
        + (float)(v77 - (float)((float)(v77 - v81) + (float)(v77 - (float)(v77 - v81))));
    v84 = v76 + v82;
    v85 = (float)(v82 - (float)((float)(v76 + v82) - v76))
        + (float)(v76 - (float)((float)(v76 + v82) - (float)((float)(v76 + v82) - v76)));
    v477[0] = v83;
    v477[1] = (float)((float)(v85 - (float)(v85 - v78)) - v78)
            + (float)(v85 - (float)((float)(v85 - v78) + (float)(v85 - (float)(v85 - v78))));
    v68.f32[0] = v84 + (float)(v85 - v78);
    v477[2] = (float)((float)(v85 - v78) - (float)(v68.f32[0] - v84))
            + (float)(v84 - (float)(v68.f32[0] - (float)(v68.f32[0] - v84)));
    v86 = vmuls_lane_f32(v40, v79, 3);
    v87 = (float)(v86 - (float)(v75 * v53)) - (float)((float)(v68.f32[3] - v75) * v53);
    v88 = -(float)((float)((float)((float)((float)(v40 * v79.f32[0]) - (float)(v66 * v53)) - (float)(v67 * v53))
                         - (float)(v66 * (float)(v40 - v53)))
                 - (float)(v67 * (float)(v40 - v53)));
    v89 = -(float)((float)(v87 - (float)(v75 * v54)) - (float)((float)(v68.f32[3] - v75) * v54));
    v450 = v80;
    v451 = v79;
    v90 = vmuls_lane_f32(v80.f32[0], *(float32x2_t *)v79.f32, 1);
    v91 = v79;
    v92 = (float)(v8.f32[1] - v13.f32[1]) * v80.f32[0];
    v443 = v8.f32[1] - v13.f32[1];
    v93 = (float)((float)(v92 - (float)(v46 * v73)) - (float)(v47 * v73)) - (float)(v46 * v44.f32[0]);
    v94 = -(float)((float)((float)((float)(v90 - (float)(v46 * v63)) - (float)(v47 * v63))
                         - (float)(v46 * (float)(v44.f32[1] - v63)))
                 - (float)(v47 * (float)(v44.f32[1] - v63)));
    v95 = -(float)(v93 - (float)(v47 * v44.f32[0]));
    v96 = v89 - v95;
    v97 = (float)((float)(v89 - (float)(v89 - v95)) - v95)
        + (float)(v89 - (float)((float)(v89 - v95) + (float)(v89 - (float)(v89 - v95))));
    v98 = v86 + v96;
    v99 = (float)(v96 - (float)((float)(v86 + v96) - v86))
        + (float)(v86 - (float)((float)(v86 + v96) - (float)((float)(v86 + v96) - v86)));
    v100 = v99 - v92;
    v476[0] = v97;
    v476[1] = (float)((float)(v99 - (float)(v99 - v92)) - v92)
            + (float)(v99 - (float)((float)(v99 - v92) + (float)(v99 - (float)(v99 - v92))));
    v101 = v98 + (float)(v99 - v92);
    v102 = (float)(v100 - (float)((float)(v98 + v100) - v98))
         + (float)(v98 - (float)((float)(v98 + v100) - (float)((float)(v98 + v100) - v98)));
    v103 = v94 - v88;
    v104 = (float)((float)(v94 - (float)(v94 - v88)) - v88)
         + (float)(v94 - (float)((float)(v94 - v88) + (float)(v94 - (float)(v94 - v88))));
    v105 = v90 + v103;
    v106 = (float)(v103 - (float)((float)(v90 + v103) - v90))
         + (float)(v90 - (float)((float)(v90 + v103) - (float)((float)(v90 + v103) - v90)));
    v107 = v106 - (float)(v40 * v79.f32[0]);
    v475[0] = v104;
    v475[1] = (float)((float)(v106 - v107) - (float)(v40 * v79.f32[0]))
            + (float)(v106 - (float)(v107 + (float)(v106 - v107)));
    v475[2] = (float)(v107 - (float)((float)(v105 + v107) - v105))
            + (float)(v105 - (float)((float)(v105 + v107) - (float)((float)(v105 + v107) - v105)));
    v454 = v43;
    v108 = vmuls_lane_f32(v8.f32[1] - v13.f32[1], *(float32x2_t *)v43.f32, 1);
    v41.f32[0] = -(float)((float)((float)((float)(v108 - (float)(v41.f32[0] * v73))
                                        - (float)((float)(v43.f32[1] - v41.f32[0]) * v73))
                                - (float)(v41.f32[0] * v44.f32[0]))
                        - (float)((float)(v43.f32[1] - v41.f32[0]) * v44.f32[0]));
    v79.i32[0] = v43.i32[2];
    v43.f32[0] = vmuls_lane_f32(v43.f32[2], v91, 3);
    v109 = -(float)((float)((float)((float)(v43.f32[0] - (float)(v75 * v49)) - (float)((float)(v68.f32[3] - v75) * v49))
                          - (float)(v75 * (float)(v43.f32[2] - v49)))
                  - (float)((float)(v68.f32[3] - v75) * (float)(v43.f32[2] - v49)));
    v42.f32[0] = v41.f32[0] - v109;
    v110 = (float)((float)(v41.f32[0] - (float)(v41.f32[0] - v109)) - v109)
         + (float)(v41.f32[0] - (float)((float)(v41.f32[0] - v109) + (float)(v41.f32[0] - (float)(v41.f32[0] - v109))));
    v41.f32[0] = v108 + v42.f32[0];
    v42.f32[0] = (float)(v42.f32[0] - (float)((float)(v108 + v42.f32[0]) - v108))
               + (float)(v108 - (float)((float)(v108 + v42.f32[0]) - (float)((float)(v108 + v42.f32[0]) - v108)));
    v474[0] = v110;
    v474[1] = (float)((float)(v42.f32[0] - (float)(v42.f32[0] - v43.f32[0])) - v43.f32[0])
            + (float)(v42.f32[0]
                    - (float)((float)(v42.f32[0] - v43.f32[0]) + (float)(v42.f32[0] - (float)(v42.f32[0] - v43.f32[0]))));
    v449 = v13;
    v479[2] = v440;
    v479[3] = v60;
    v431 = v8.f32[0];
    v428 = v72;
    v478[3] = v72;
    v426 = v101;
    v427 = v68.f32[0];
    v477[3] = v68.f32[0];
    v476[2] = v102;
    v437 = v13.f32[2];
    v111 = v8.f32[2] - v13.f32[2];
    v476[3] = v101;
    v424 = v41.f32[0] + (float)(v42.f32[0] - v43.f32[0]);
    v425 = v105 + v107;
    v475[3] = v105 + v107;
    v474[2] = (float)((float)(v42.f32[0] - v43.f32[0]) - (float)(v424 - v41.f32[0]))
            + (float)(v41.f32[0] - (float)(v424 - (float)(v424 - v41.f32[0])));
    v474[3] = v424;
    _S13 = v43.f32[3];
    v113 = sub_1DEE65BF8(4, v477, v473, v43.f32[3]);
    v114 = sub_1DEE65BF8(4, v474, v472, -v451.f32[2]);
    v115 = sub_1DEE65BF8(4, v478, v471, v111);
    v116 = sub_1DEE659F0(v113, v473, v114, v472, v470);
    v117 = sub_1DEE659F0(v115, v471, v116, v470, v469);
    v118 = sub_1DEE65BF8(v117, v469, v468, v450.f32[0]);
    v119 = sub_1DEE65BF8(v118, v468, v467, -v450.f32[0]);
    v120 = sub_1DEE65BF8(v117, v469, v468, v40);
    v121 = sub_1DEE65BF8(v120, v468, v466, -v40);
    v122 = sub_1DEE65BF8(v117, v469, v468, v454.f32[0]);
    v123 = sub_1DEE65BF8(v122, v468, v465, -v454.f32[0]);
    v124 = sub_1DEE659F0(v119, v467, v121, v466, v464);
    v125 = sub_1DEE659F0(v124, v464, v123, v465, v463);
    v126 = sub_1DEE65BF8(4, v476, v473, v451.f32[2]);
    v127 = sub_1DEE65BF8(4, v475, v472, v111);
    v128 = sub_1DEE65BF8(4, v477, v471, v454.f32[0]);
    v129 = sub_1DEE659F0(v126, v473, v127, v472, v470);
    v130 = sub_1DEE659F0(v128, v471, v129, v470, v469);
    v131 = sub_1DEE65BF8(v130, v469, v468, v51);
    v429 = v51;
    v132 = sub_1DEE65BF8(v131, v468, v467, v51);
    v133 = sub_1DEE65BF8(v130, v469, v468, v79.f32[0]);
    v134 = sub_1DEE65BF8(v133, v468, v466, v79.f32[0]);
    v135 = sub_1DEE65BF8(v130, v469, v468, _S13);
    v136 = sub_1DEE65BF8(v135, v468, v465, _S13);
    v137 = sub_1DEE659F0(v132, v467, v134, v466, v464);
    v138 = sub_1DEE659F0(v137, v464, v136, v465, v462);
    v139 = sub_1DEE65BF8(4, v479, v473, v111);
    v140 = sub_1DEE65BF8(4, v474, v472, v454.f32[0]);
    v141 = sub_1DEE65BF8(4, v476, v471, _S13);
    v142 = sub_1DEE659F0(v139, v473, v140, v472, v470);
    v143 = sub_1DEE659F0(v141, v471, v142, v470, v469);
    v144 = sub_1DEE65BF8(v143, v469, v468, v451.f32[0]);
    v145 = sub_1DEE65BF8(v144, v468, v467, -v451.f32[0]);
    v146 = sub_1DEE65BF8(v143, v469, v468, v442);
    _S15 = v442;
    v148 = sub_1DEE65BF8(v146, v468, v466, -v442);
    v149 = sub_1DEE65BF8(v143, v469, v468, v451.f32[2]);
    v423 = -v451.f32[2];
    v150 = sub_1DEE65BF8(v149, v468, v465, -v451.f32[2]);
    v151 = sub_1DEE659F0(v145, v467, v148, v466, v464);
    v152 = sub_1DEE659F0(v151, v464, v150, v465, v461);
    v153 = sub_1DEE65BF8(4, v478, v473, v454.f32[0]);
    v154 = sub_1DEE65BF8(4, v475, v472, -_S13);
    v155 = sub_1DEE65BF8(4, v479, v471, v451.f32[2]);
    v156 = sub_1DEE659F0(v153, v473, v154, v472, v470);
    v157 = sub_1DEE659F0(v155, v471, v156, v470, v469);
    v158 = sub_1DEE65BF8(v157, v469, v468, v441);
    v159 = sub_1DEE65BF8(v158, v468, v467, v441);
    v160 = sub_1DEE65BF8(v157, v469, v468, v443);
    v161 = sub_1DEE65BF8(v160, v468, v466, v443);
    v162 = sub_1DEE65BF8(v157, v469, v468, v111);
    v163 = sub_1DEE65BF8(v162, v468, v465, v111);
    v164 = sub_1DEE659F0(v159, v467, v161, v466, v464);
    v165 = sub_1DEE659F0(v164, v464, v163, v465, v460);
    v166 = sub_1DEE659F0(v125, v463, v138, v462, v459);
    v167 = sub_1DEE659F0(v152, v461, v165, v460, v458);
    v168 = sub_1DEE659F0(v166, v459, v167, v458, (float *)&v456);
    v36.i32[0] = v456;
    if (v168 < 2)
    {
      v171 = v444;
    }
    else
    {
      v169 = v168 - 1;
      v170 = (float *)&v457;
      v171 = v444;
      do
      {
        v172 = *v170++;
        *(float *)v36.i32 = *(float *)v36.i32 + v172;
        --v169;
      }
      while (v169);
    }
    v173 = *(float *)v36.i32 < (float)(v171 * 0.00000029802)
        && (float)(v171 * 0.00000029802) > (float)-*(float *)v36.i32;
    _S23 = v450.i32[0];
    if (v173)
    {
      v175 = vsubq_f32(v448, v450);
      v176 = vaddq_f32(vsubq_f32(v175, v449), vsubq_f32(v448, vaddq_f32(v450, v175))).f32[0];
      v177 = (float)((float)(v439 - v40) - v438) + (float)(v439 - (float)(v40 + (float)(v439 - v40)));
      v178 = vsubq_f32(v434, v451);
      v179 = vsubq_f32(v435, v454);
      v180 = (float)((float)(v8.f32[1] - v443) - v438) + (float)(v8.f32[1] - (float)(v443 + (float)(v8.f32[1] - v443)));
      v181 = (float)((float)(v8.f32[2] - v111) - v437) + (float)(v8.f32[2] - (float)(v111 + (float)(v8.f32[2] - v111)));
      v182 = vaddq_f32(v451, v178);
      v183 = vsubq_f32(v178, v432);
      _Q3 = vaddq_f32(vsubq_f32(v179, v433), vsubq_f32(v435, vaddq_f32(v454, v179)));
      _Q4 = vaddq_f32(v183, vsubq_f32(v434, v182));
      v186 = (uint8x8_t)vmovn_s16((int16x8_t)vmvnq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vceqzq_f32(_Q3), (int16x8_t)vceqzq_f32(_Q4))));
      v186.i8[0] = vmaxv_u8(v186);
      v187 = (v177 == 0.0) & ~v186.i32[0];
      if (v176 != 0.0)
        v187 = 0;
      if (v180 != 0.0)
        v187 = 0;
      if (v187 != 1 || v181 != 0.0)
      {
        v445 = (float)(fabsf(*(float *)v36.i32) * 0.00000017881) + (float)(v171 * 2.5224e-13);
        _S27 = v446;
        __asm { FMLA            S16, S23, V3.S[2] }
        _S28 = v51;
        _S10 = v40;
        __asm { FMLA            S17, S10, V3.S[1] }
        v196 = _S16 - _S17;
        __asm { FMLA            S17, S28, V4.S[1] }
        v198 = _S17 - vmlas_n_f32(vmuls_lane_f32(v451.f32[0], _Q3, 2), v446, _Q4.f32[0]);
        _S26 = v441;
        __asm { FMLA            S19, S15, V4.S[3] }
        v201 = (float)((float)(v443 * _Q4.f32[0]) + (float)(v451.f32[0] * v180)) - _S19;
        v202 = (float)(vmuls_lane_f32(v40, _Q4, 3) + (float)(v441 * v177))
             - (float)((float)(v450.f32[0] * v180) + (float)(v443 * v176));
        __asm { FMLA            S20, S23, V4.S[1] }
        v204 = _S20 - vmlas_n_f32(v451.f32[0] * v177, v40, _Q4.f32[0]);
        _S12 = v451.f32[2];
        _S7 = v426;
        __asm { FMLA            S22, S7, V4.S[2] }
        _S15 = v427;
        v209 = (float)((float)((float)(v111 * v204) + (float)(v451.f32[2] * v202)) + (float)(v454.f32[0] * v201))
             + vmlas_n_f32(_S22, v427, _Q3.f32[0]);
        _S29 = v60;
        __asm { FMLA            S22, S29, V4.S[2] }
        v212 = (float)((float)((float)((float)(v443 * v443) + (float)(_S26 * _S26)) + (float)(v111 * v111))
                     * (float)((float)((float)((float)(v204 * (float)-_S13) + (float)(v454.f32[0] * v198))
                                     + (float)(v451.f32[2] * v196))
                             + _S22))
             + (float)((float)((float)((float)(_S27 * _S27) + (float)(_S28 * _S28)) + (float)(_S13 * _S13)) * v209);
        __asm { FMLA            S22, S27, V4.S[3] }
        v214 = (float)(vmuls_lane_f32(v443, *(float32x2_t *)_Q3.f32, 1) + (float)(v429 * v180)) - _S22;
        v215 = (float)((float)(v214 * v423) + (float)(_S13 * v201)) + (float)(v111 * v198);
        __asm { FMLA            S18, S15, V3.S[3] }
        v217 = v215 + (float)(_S18 + (float)(v181 * v428));
        __asm { FMLA            S18, S7, V3.S[3] }
        v219 = (float)((float)((float)((float)(v442 * v442) + (float)(v451.f32[0] * v451.f32[0])) + (float)(_S12 * _S12))
                     * (float)((float)((float)((float)(v454.f32[0] * v214) + (float)(v111 * v196)) + (float)(_S13 * v202))
                             + _S18))
             + (float)((float)((float)((float)(_S10 * _S10) + (float)(v450.f32[0] * v450.f32[0]))
                             + (float)(v454.f32[0] * v454.f32[0]))
                     * v217);
        __asm
        {
          FMLA            S17, S28, V3.S[1]
          FMLA            S5, S26, V4.S[3]
          FMLA            S17, S13, V3.S[3]
        }
        v223 = (float)(v40 * v177) + (float)(v450.f32[0] * v176);
        __asm { FMLA            S2, S12, V4.S[2] }
        *(float *)v36.i32 = (float)(v212 - v219)
                          + (float)((float)((float)((float)(_S5 + (float)(v111 * v181))
                                                  * (float)((float)((float)(v425 * (float)-_S13)
                                                                  + (float)(v454.f32[0] * v428))
                                                          + (float)(_S12 * v60)))
                                          + (float)(_S17
                                                  * (float)((float)((float)(v111 * v425) + (float)(_S12 * v426))
                                                          + (float)(v454.f32[0] * v427))))
                                  - (float)((float)(_S2
                                                  * (float)((float)((float)(v454.f32[0] * v424) + (float)(v111 * v60))
                                                          + (float)(_S13 * v426)))
                                          + (float)(vmlas_n_f32(v223, v454.f32[0], _Q3.f32[0])
                                                  * (float)((float)((float)(v424 * v423) + (float)(_S13 * v427))
                                                          + (float)(v111 * v428)))))
                          * 2.0
                          + *(float *)v36.i32;
        if (v445 > *(float *)v36.i32 && v445 > (float)-*(float *)v36.i32)
        {
          v226 = (float)(v448.f32[0] * 4096.0) - (float)((float)(v448.f32[0] * 4096.0) - v448.f32[0]);
          v227 = (float)(*(float *)&v436.i32[1] * 4096.0)
               - (float)((float)(*(float *)&v436.i32[1] * 4096.0) - *(float *)&v436.i32[1]);
          v228 = -(float)((float)((float)((float)((float)(v448.f32[0] * *(float *)&v436.i32[1]) - (float)(v226 * v227))
                                        - (float)((float)(v448.f32[0] - v226) * v227))
                                - (float)(v226 * (float)(*(float *)&v436.i32[1] - v227)))
                        - (float)((float)(v448.f32[0] - v226) * (float)(*(float *)&v436.i32[1] - v227)));
          v229 = (float)(*(float *)v436.i32 * 4096.0)
               - (float)((float)(*(float *)v436.i32 * 4096.0) - *(float *)v436.i32);
          v230 = (float)(v439 * 4096.0) - (float)((float)(v439 * 4096.0) - v439);
          v231 = -(float)((float)((float)((float)((float)(v439 * *(float *)v436.i32) - (float)(v229 * v230))
                                        - (float)((float)(*(float *)v436.i32 - v229) * v230))
                                - (float)(v229 * (float)(v439 - v230)))
                        - (float)((float)(*(float *)v436.i32 - v229) * (float)(v439 - v230)));
          v232 = v228 - v231;
          v233 = (float)((float)(v228 - (float)(v228 - v231)) - v231)
               + (float)(v228 - (float)((float)(v228 - v231) + (float)(v228 - (float)(v228 - v231))));
          v234 = (float)(v448.f32[0] * *(float *)&v436.i32[1]) + v232;
          v235 = (float)(v232 - (float)(v234 - (float)(v448.f32[0] * *(float *)&v436.i32[1])))
               + (float)((float)(v448.f32[0] * *(float *)&v436.i32[1])
                       - (float)(v234 - (float)(v234 - (float)(v448.f32[0] * *(float *)&v436.i32[1]))));
          v236 = v235 - (float)(v439 * *(float *)v436.i32);
          v523[0] = v233;
          v523[1] = (float)((float)(v235 - v236) - (float)(v439 * *(float *)v436.i32))
                  + (float)(v235 - (float)(v236 + (float)(v235 - v236)));
          v523[2] = (float)(v236 - (float)((float)(v234 + v236) - v234))
                  + (float)(v234 - (float)((float)(v234 + v236) - (float)((float)(v234 + v236) - v234)));
          v523[3] = v234 + v236;
          v237 = (float)(v430.f32[1] * 4096.0) - (float)((float)(v430.f32[1] * 4096.0) - v430.f32[1]);
          v238 = -(float)((float)((float)((float)((float)(*(float *)v436.i32 * v430.f32[1]) - (float)(v229 * v237))
                                        - (float)((float)(*(float *)v436.i32 - v229) * v237))
                                - (float)(v229 * (float)(v430.f32[1] - v237)))
                        - (float)((float)(*(float *)v436.i32 - v229) * (float)(v430.f32[1] - v237)));
          v239 = (float)(v430.f32[0] * 4096.0) - (float)((float)(v430.f32[0] * 4096.0) - v430.f32[0]);
          v452 = *(float *)&v436.i32[1] - v227;
          v240 = -(float)((float)((float)((float)((float)(*(float *)&v436.i32[1] * v430.f32[0]) - (float)(v239 * v227))
                                        - (float)((float)(v430.f32[0] - v239) * v227))
                                - (float)(v239 * v452))
                        - (float)((float)(v430.f32[0] - v239) * v452));
          v241 = v238 - v240;
          v242 = (float)((float)(v238 - (float)(v238 - v240)) - v240)
               + (float)(v238 - (float)((float)(v238 - v240) + (float)(v238 - (float)(v238 - v240))));
          v243 = (float)(*(float *)v436.i32 * v430.f32[1]) + v241;
          v244 = (float)(v241 - (float)(v243 - (float)(*(float *)v436.i32 * v430.f32[1])))
               + (float)((float)(*(float *)v436.i32 * v430.f32[1])
                       - (float)(v243 - (float)(v243 - (float)(*(float *)v436.i32 * v430.f32[1]))));
          v245 = v244 - (float)(*(float *)&v436.i32[1] * v430.f32[0]);
          v522[0] = v242;
          v522[1] = (float)((float)(v244 - v245) - (float)(*(float *)&v436.i32[1] * v430.f32[0]))
                  + (float)(v244 - (float)(v245 + (float)(v244 - v245)));
          v522[2] = (float)(v245 - (float)((float)(v243 + v245) - v243))
                  + (float)(v243 - (float)((float)(v243 + v245) - (float)((float)(v243 + v245) - v243)));
          v522[3] = v243 + v245;
          v246 = (float)(v8.f32[1] * 4096.0) - (float)((float)(v8.f32[1] * 4096.0) - v8.f32[1]);
          v247 = -(float)((float)((float)((float)((float)(v430.f32[0] * v8.f32[1]) - (float)(v239 * v246))
                                        - (float)((float)(v430.f32[0] - v239) * v246))
                                - (float)(v239 * (float)(v8.f32[1] - v246)))
                        - (float)((float)(v430.f32[0] - v239) * (float)(v8.f32[1] - v246)));
          v248 = (float)(v431 * 4096.0) - (float)((float)(v431 * 4096.0) - v431);
          v249 = -(float)((float)((float)((float)((float)(v430.f32[1] * v431) - (float)(v248 * v237))
                                        - (float)((float)(v431 - v248) * v237))
                                - (float)(v248 * (float)(v430.f32[1] - v237)))
                        - (float)((float)(v431 - v248) * (float)(v430.f32[1] - v237)));
          v250 = v247 - v249;
          v251 = (float)((float)(v247 - (float)(v247 - v249)) - v249)
               + (float)(v247 - (float)((float)(v247 - v249) + (float)(v247 - (float)(v247 - v249))));
          v252 = (float)(v430.f32[0] * v8.f32[1]) + v250;
          v253 = (float)(v250 - (float)(v252 - (float)(v430.f32[0] * v8.f32[1])))
               + (float)((float)(v430.f32[0] * v8.f32[1])
                       - (float)(v252 - (float)(v252 - (float)(v430.f32[0] * v8.f32[1]))));
          v254 = v253 - (float)(v430.f32[1] * v431);
          v521[0] = v251;
          v521[1] = (float)((float)(v253 - v254) - (float)(v430.f32[1] * v431))
                  + (float)(v253 - (float)(v254 + (float)(v253 - v254)));
          v521[2] = (float)(v254 - (float)((float)(v252 + v254) - v252))
                  + (float)(v252 - (float)((float)(v252 + v254) - (float)((float)(v252 + v254) - v252)));
          v521[3] = v252 + v254;
          v255 = (float)(v438 * 4096.0) - (float)((float)(v438 * 4096.0) - v438);
          v256 = -(float)((float)((float)((float)((float)(v438 * v431) - (float)(v248 * v255))
                                        - (float)((float)(v431 - v248) * v255))
                                - (float)(v248 * (float)(v438 - v255)))
                        - (float)((float)(v431 - v248) * (float)(v438 - v255)));
          v257 = (float)(v449.f32[0] * 4096.0) - (float)((float)(v449.f32[0] * 4096.0) - v449.f32[0]);
          v258 = -(float)((float)((float)((float)((float)(v449.f32[0] * v8.f32[1]) - (float)(v257 * v246))
                                        - (float)((float)(v449.f32[0] - v257) * v246))
                                - (float)(v257 * (float)(v8.f32[1] - v246)))
                        - (float)((float)(v449.f32[0] - v257) * (float)(v8.f32[1] - v246)));
          v259 = v256 - v258;
          v260 = (float)((float)(v256 - (float)(v256 - v258)) - v258)
               + (float)(v256 - (float)((float)(v256 - v258) + (float)(v256 - (float)(v256 - v258))));
          v261 = (float)(v438 * v431) + v259;
          v262 = (float)(v259 - (float)(v261 - (float)(v438 * v431)))
               + (float)((float)(v438 * v431) - (float)(v261 - (float)(v261 - (float)(v438 * v431))));
          v263 = v262 - (float)(v449.f32[0] * v8.f32[1]);
          v520[0] = v260;
          v520[1] = (float)((float)(v262 - v263) - (float)(v449.f32[0] * v8.f32[1]))
                  + (float)(v262 - (float)(v263 + (float)(v262 - v263)));
          v520[2] = (float)(v263 - (float)((float)(v261 + v263) - v261))
                  + (float)(v261 - (float)((float)(v261 + v263) - (float)((float)(v261 + v263) - v261)));
          v520[3] = v261 + v263;
          v264 = -(float)((float)((float)((float)((float)(v449.f32[0] * v439) - (float)(v257 * v230))
                                        - (float)((float)(v449.f32[0] - v257) * v230))
                                - (float)(v257 * (float)(v439 - v230)))
                        - (float)((float)(v449.f32[0] - v257) * (float)(v439 - v230)));
          v265 = -(float)((float)((float)((float)((float)(v438 * v448.f32[0]) - (float)(v226 * v255))
                                        - (float)((float)(v448.f32[0] - v226) * v255))
                                - (float)(v226 * (float)(v438 - v255)))
                        - (float)((float)(v448.f32[0] - v226) * (float)(v438 - v255)));
          v266 = v264 - v265;
          v267 = (float)((float)(v264 - (float)(v264 - v265)) - v265)
               + (float)(v264 - (float)((float)(v264 - v265) + (float)(v264 - (float)(v264 - v265))));
          v268 = (float)(v449.f32[0] * v439) + v266;
          v269 = (float)(v266 - (float)(v268 - (float)(v449.f32[0] * v439)))
               + (float)((float)(v449.f32[0] * v439) - (float)(v268 - (float)(v268 - (float)(v449.f32[0] * v439))));
          v270 = v269 - (float)(v438 * v448.f32[0]);
          v519[0] = v267;
          v519[1] = (float)((float)(v269 - v270) - (float)(v438 * v448.f32[0]))
                  + (float)(v269 - (float)(v270 + (float)(v269 - v270)));
          v519[2] = (float)(v270 - (float)((float)(v268 + v270) - v268))
                  + (float)(v268 - (float)((float)(v268 + v270) - (float)((float)(v268 + v270) - v268)));
          v519[3] = v268 + v270;
          v271 = -(float)((float)((float)((float)((float)(v448.f32[0] * v430.f32[1]) - (float)(v226 * v237))
                                        - (float)((float)(v448.f32[0] - v226) * v237))
                                - (float)(v226 * (float)(v430.f32[1] - v237)))
                        - (float)((float)(v448.f32[0] - v226) * (float)(v430.f32[1] - v237)));
          v272 = -(float)((float)((float)((float)((float)(v439 * v430.f32[0]) - (float)(v239 * v230))
                                        - (float)((float)(v430.f32[0] - v239) * v230))
                                - (float)(v239 * (float)(v439 - v230)))
                        - (float)((float)(v430.f32[0] - v239) * (float)(v439 - v230)));
          v273 = v271 - v272;
          v274 = (float)((float)(v271 - (float)(v271 - v272)) - v272)
               + (float)(v271 - (float)((float)(v271 - v272) + (float)(v271 - (float)(v271 - v272))));
          v275 = (float)(v448.f32[0] * v430.f32[1]) + v273;
          v276 = (float)(v273 - (float)(v275 - (float)(v448.f32[0] * v430.f32[1])))
               + (float)((float)(v448.f32[0] * v430.f32[1])
                       - (float)(v275 - (float)(v275 - (float)(v448.f32[0] * v430.f32[1]))));
          v277 = v276 - (float)(v439 * v430.f32[0]);
          v518[0] = v274;
          v518[1] = (float)((float)(v276 - v277) - (float)(v439 * v430.f32[0]))
                  + (float)(v276 - (float)(v277 + (float)(v276 - v277)));
          v518[2] = (float)(v277 - (float)((float)(v275 + v277) - v275))
                  + (float)(v275 - (float)((float)(v275 + v277) - (float)((float)(v275 + v277) - v275)));
          v518[3] = v275 + v277;
          v278 = -(float)((float)((float)((float)((float)(*(float *)v436.i32 * v8.f32[1]) - (float)(v229 * v246))
                                        - (float)((float)(*(float *)v436.i32 - v229) * v246))
                                - (float)(v229 * (float)(v8.f32[1] - v246)))
                        - (float)((float)(*(float *)v436.i32 - v229) * (float)(v8.f32[1] - v246)));
          v279 = -(float)((float)((float)((float)((float)(*(float *)&v436.i32[1] * v431) - (float)(v248 * v227))
                                        - (float)((float)(v431 - v248) * v227))
                                - (float)(v248 * v452))
                        - (float)((float)(v431 - v248) * v452));
          v280 = v278 - v279;
          v281 = (float)((float)(v278 - (float)(v278 - v279)) - v279)
               + (float)(v278 - (float)((float)(v278 - v279) + (float)(v278 - (float)(v278 - v279))));
          v282 = (float)(*(float *)v436.i32 * v8.f32[1]) + v280;
          v283 = (float)(v280 - (float)(v282 - (float)(*(float *)v436.i32 * v8.f32[1])))
               + (float)((float)(*(float *)v436.i32 * v8.f32[1])
                       - (float)(v282 - (float)(v282 - (float)(*(float *)v436.i32 * v8.f32[1]))));
          v284 = v283 - (float)(*(float *)&v436.i32[1] * v431);
          v517[0] = v281;
          v517[1] = (float)((float)(v283 - v284) - (float)(*(float *)&v436.i32[1] * v431))
                  + (float)(v283 - (float)(v284 + (float)(v283 - v284)));
          v517[2] = (float)(v284 - (float)((float)(v282 + v284) - v282))
                  + (float)(v282 - (float)((float)(v282 + v284) - (float)((float)(v282 + v284) - v282)));
          v517[3] = v282 + v284;
          v285 = -(float)((float)((float)((float)((float)(v438 * v430.f32[0]) - (float)(v239 * v255))
                                        - (float)((float)(v430.f32[0] - v239) * v255))
                                - (float)(v239 * (float)(v438 - v255)))
                        - (float)((float)(v430.f32[0] - v239) * (float)(v438 - v255)));
          v286 = -(float)((float)((float)((float)((float)(v449.f32[0] * v430.f32[1]) - (float)(v257 * v237))
                                        - (float)((float)(v449.f32[0] - v257) * v237))
                                - (float)(v257 * (float)(v430.f32[1] - v237)))
                        - (float)((float)(v449.f32[0] - v257) * (float)(v430.f32[1] - v237)));
          v287 = v285 - v286;
          v288 = (float)((float)(v285 - (float)(v285 - v286)) - v286)
               + (float)(v285 - (float)((float)(v285 - v286) + (float)(v285 - (float)(v285 - v286))));
          v289 = (float)(v438 * v430.f32[0]) + v287;
          v290 = (float)(v287 - (float)(v289 - (float)(v438 * v430.f32[0])))
               + (float)((float)(v438 * v430.f32[0]) - (float)(v289 - (float)(v289 - (float)(v438 * v430.f32[0]))));
          v291 = v290 - (float)(v449.f32[0] * v430.f32[1]);
          v516[0] = v288;
          v516[1] = (float)((float)(v290 - v291) - (float)(v449.f32[0] * v430.f32[1]))
                  + (float)(v290 - (float)(v291 + (float)(v290 - v291)));
          v516[2] = (float)(v291 - (float)((float)(v289 + v291) - v289))
                  + (float)(v289 - (float)((float)(v289 + v291) - (float)((float)(v289 + v291) - v289)));
          v516[3] = v289 + v291;
          v292 = -(float)((float)((float)((float)((float)(v439 * v431) - (float)(v248 * v230))
                                        - (float)((float)(v431 - v248) * v230))
                                - (float)(v248 * (float)(v439 - v230)))
                        - (float)((float)(v431 - v248) * (float)(v439 - v230)));
          v293 = -(float)((float)((float)((float)((float)(v448.f32[0] * v8.f32[1]) - (float)(v226 * v246))
                                        - (float)((float)(v448.f32[0] - v226) * v246))
                                - (float)(v226 * (float)(v8.f32[1] - v246)))
                        - (float)((float)(v448.f32[0] - v226) * (float)(v8.f32[1] - v246)));
          v294 = v292 - v293;
          v295 = (float)((float)(v292 - (float)(v292 - v293)) - v293)
               + (float)(v292 - (float)((float)(v292 - v293) + (float)(v292 - (float)(v292 - v293))));
          v296 = (float)(v439 * v431) + v294;
          v297 = (float)(v294 - (float)(v296 - (float)(v439 * v431)))
               + (float)((float)(v439 * v431) - (float)(v296 - (float)(v296 - (float)(v439 * v431))));
          v298 = v297 - (float)(v448.f32[0] * v8.f32[1]);
          v515[0] = v295;
          v515[1] = (float)((float)(v297 - v298) - (float)(v448.f32[0] * v8.f32[1]))
                  + (float)(v297 - (float)(v298 + (float)(v297 - v298)));
          v515[2] = (float)(v298 - (float)((float)(v296 + v298) - v296))
                  + (float)(v296 - (float)((float)(v296 + v298) - (float)((float)(v296 + v298) - v296)));
          v515[3] = v296 + v298;
          v299 = -(float)((float)((float)((float)((float)(v449.f32[0] * *(float *)&v436.i32[1]) - (float)(v257 * v227))
                                        - (float)((float)(v449.f32[0] - v257) * v227))
                                - (float)(v257 * v452))
                        - (float)((float)(v449.f32[0] - v257) * v452));
          v300 = -(float)((float)((float)((float)((float)(v438 * *(float *)v436.i32) - (float)(v229 * v255))
                                        - (float)((float)(*(float *)v436.i32 - v229) * v255))
                                - (float)(v229 * (float)(v438 - v255)))
                        - (float)((float)(*(float *)v436.i32 - v229) * (float)(v438 - v255)));
          v301 = v299 - v300;
          v302 = (float)((float)(v299 - (float)(v299 - v300)) - v300)
               + (float)(v299 - (float)((float)(v299 - v300) + (float)(v299 - (float)(v299 - v300))));
          v303 = (float)(v449.f32[0] * *(float *)&v436.i32[1]) + v301;
          v304 = (float)(v301 - (float)(v303 - (float)(v449.f32[0] * *(float *)&v436.i32[1])))
               + (float)((float)(v449.f32[0] * *(float *)&v436.i32[1])
                       - (float)(v303 - (float)(v303 - (float)(v449.f32[0] * *(float *)&v436.i32[1]))));
          v305 = v304 - (float)(v438 * *(float *)v436.i32);
          v514[0] = v302;
          v514[1] = (float)((float)(v304 - v305) - (float)(v438 * *(float *)v436.i32))
                  + (float)(v304 - (float)(v305 + (float)(v304 - v305)));
          v514[2] = (float)(v305 - (float)((float)(v303 + v305) - v303))
                  + (float)(v303 - (float)((float)(v303 + v305) - (float)((float)(v303 + v305) - v303)));
          v514[3] = v303 + v305;
          v306 = sub_1DEE65BF8(4, v522, v513, v448.f32[2]);
          v307 = sub_1DEE65BF8(4, v518, v512, -*(float *)&v436.i32[2]);
          v308 = sub_1DEE659F0(v306, v513, v307, v512, v511);
          v309 = sub_1DEE65BF8(4, v523, v513, v430.f32[2]);
          v455 = sub_1DEE659F0(v309, v513, v308, v511, v510);
          v310 = sub_1DEE65BF8(4, v521, v513, *(float *)&v436.i32[2]);
          v311 = sub_1DEE65BF8(4, v517, v512, -v430.f32[2]);
          v312 = sub_1DEE659F0(v310, v513, v311, v512, v511);
          v313 = sub_1DEE65BF8(4, v522, v513, v8.f32[2]);
          v314 = sub_1DEE659F0(v313, v513, v312, v511, v509);
          v315 = sub_1DEE65BF8(4, v520, v513, v430.f32[2]);
          v316 = sub_1DEE65BF8(4, v516, v512, -v8.f32[2]);
          v317 = sub_1DEE659F0(v315, v513, v316, v512, v511);
          v318 = sub_1DEE65BF8(4, v521, v513, v437);
          v319 = sub_1DEE659F0(v318, v513, v317, v511, v508);
          v320 = sub_1DEE65BF8(4, v519, v513, v8.f32[2]);
          v321 = sub_1DEE65BF8(4, v515, v512, -v437);
          v322 = sub_1DEE659F0(v320, v513, v321, v512, v511);
          v323 = sub_1DEE65BF8(4, v520, v513, v448.f32[2]);
          v324 = sub_1DEE659F0(v323, v513, v322, v511, v507);
          v325 = sub_1DEE65BF8(4, v523, v513, v437);
          v326 = sub_1DEE65BF8(4, v514, v512, -v448.f32[2]);
          v327 = sub_1DEE659F0(v325, v513, v326, v512, v511);
          v328 = sub_1DEE65BF8(4, v519, v513, *(float *)&v436.i32[2]);
          v329 = sub_1DEE659F0(v328, v513, v327, v511, v506);
          v330 = sub_1DEE65BF8(4, v517, v513, v448.f32[2]);
          v331 = sub_1DEE65BF8(4, v515, v512, *(float *)&v436.i32[2]);
          v332 = sub_1DEE659F0(v330, v513, v331, v512, v511);
          v333 = sub_1DEE65BF8(4, v523, v513, v8.f32[2]);
          v453 = sub_1DEE659F0(v333, v513, v332, v511, v505);
          v334 = sub_1DEE65BF8(4, v516, v513, *(float *)&v436.i32[2]);
          v335 = sub_1DEE65BF8(4, v514, v512, v430.f32[2]);
          v336 = sub_1DEE659F0(v334, v513, v335, v512, v511);
          v337 = sub_1DEE65BF8(4, v522, v513, v437);
          v338 = sub_1DEE659F0(v337, v513, v336, v511, v504);
          v339 = sub_1DEE65BF8(4, v515, v513, v430.f32[2]);
          v340 = sub_1DEE65BF8(4, v518, v512, v8.f32[2]);
          v341 = sub_1DEE659F0(v339, v513, v340, v512, v511);
          v342 = sub_1DEE65BF8(4, v521, v513, v448.f32[2]);
          v343 = sub_1DEE659F0(v342, v513, v341, v511, v503);
          v344 = sub_1DEE65BF8(4, v514, v513, v8.f32[2]);
          v345 = sub_1DEE65BF8(4, v517, v512, v437);
          v346 = sub_1DEE659F0(v344, v513, v345, v512, v511);
          v347 = sub_1DEE65BF8(4, v520, v513, *(float *)&v436.i32[2]);
          v348 = sub_1DEE659F0(v347, v513, v346, v511, v502);
          v349 = sub_1DEE65BF8(4, v518, v513, v437);
          v350 = sub_1DEE65BF8(4, v516, v512, v448.f32[2]);
          v351 = sub_1DEE659F0(v349, v513, v350, v512, v511);
          v352 = sub_1DEE65BF8(4, v519, v513, v430.f32[2]);
          v353 = sub_1DEE659F0(v352, v513, v351, v511, v501);
          v354 = sub_1DEE659F0(v319, v508, v338, v504, v500);
          v447 = v314;
          v355 = sub_1DEE659F0(v348, v502, v314, v509, v499);
          if (v355 >= 1)
          {
            v356 = v355;
            v357 = v499;
            do
            {
              *v357 = -*v357;
              ++v357;
              --v356;
            }
            while (v356);
          }
          v358 = sub_1DEE659F0(v354, v500, v355, v499, v497);
          v359 = sub_1DEE65BF8(v358, v497, v493, v448.f32[0]);
          v360 = sub_1DEE65BF8(v359, v493, v492, v448.f32[0]);
          v361 = sub_1DEE65BF8(v358, v497, v493, v439);
          v362 = sub_1DEE65BF8(v361, v493, v491, v439);
          v363 = sub_1DEE65BF8(v358, v497, v493, v448.f32[2]);
          v364 = sub_1DEE65BF8(v363, v493, v490, v448.f32[2]);
          v365 = sub_1DEE659F0(v360, v492, v362, v491, v489);
          v366 = sub_1DEE659F0(v365, v489, v364, v490, v488);
          v367 = sub_1DEE659F0(v324, v507, v343, v503, v500);
          v368 = sub_1DEE659F0(v353, v501, v319, v508, v499);
          if (v368 >= 1)
          {
            v369 = v368;
            v370 = v499;
            do
            {
              *v370 = -*v370;
              ++v370;
              --v369;
            }
            while (v369);
          }
          v371 = sub_1DEE659F0(v367, v500, v368, v499, v496);
          v372 = sub_1DEE65BF8(v371, v496, v493, *(float *)v436.i32);
          v373 = sub_1DEE65BF8(v372, v493, v492, *(float *)v436.i32);
          v374 = sub_1DEE65BF8(v371, v496, v493, *(float *)&v436.i32[1]);
          v375 = sub_1DEE65BF8(v374, v493, v491, *(float *)&v436.i32[1]);
          v376 = sub_1DEE65BF8(v371, v496, v493, *(float *)&v436.i32[2]);
          v377 = sub_1DEE65BF8(v376, v493, v490, *(float *)&v436.i32[2]);
          v378 = sub_1DEE659F0(v373, v492, v375, v491, v489);
          v379 = sub_1DEE659F0(v378, v489, v377, v490, v487);
          v380 = sub_1DEE659F0(v329, v506, v348, v502, v500);
          v381 = sub_1DEE659F0(v453, v505, v324, v507, v499);
          if (v381 >= 1)
          {
            v382 = v381;
            v383 = v499;
            do
            {
              *v383 = -*v383;
              ++v383;
              --v382;
            }
            while (v382);
          }
          v384 = sub_1DEE659F0(v380, v500, v381, v499, v495);
          v385 = sub_1DEE65BF8(v384, v495, v493, v430.f32[0]);
          v386 = sub_1DEE65BF8(v385, v493, v492, v430.f32[0]);
          v387 = sub_1DEE65BF8(v384, v495, v493, v430.f32[1]);
          v388 = sub_1DEE65BF8(v387, v493, v491, v430.f32[1]);
          v389 = sub_1DEE65BF8(v384, v495, v493, v430.f32[2]);
          v390 = sub_1DEE65BF8(v389, v493, v490, v430.f32[2]);
          v391 = sub_1DEE659F0(v386, v492, v388, v491, v489);
          v392 = sub_1DEE659F0(v391, v489, v390, v490, v486);
          v393 = sub_1DEE659F0(v455, v510, v353, v501, v500);
          v394 = sub_1DEE659F0(v338, v504, v329, v506, v499);
          if (v394 >= 1)
          {
            v395 = v394;
            v396 = v499;
            do
            {
              *v396 = -*v396;
              ++v396;
              --v395;
            }
            while (v395);
          }
          v397 = sub_1DEE659F0(v393, v500, v394, v499, v494);
          v398 = sub_1DEE65BF8(v397, v494, v493, v431);
          v399 = sub_1DEE65BF8(v398, v493, v492, v431);
          v400 = sub_1DEE65BF8(v397, v494, v493, v8.f32[1]);
          v401 = sub_1DEE65BF8(v400, v493, v491, v8.f32[1]);
          v402 = sub_1DEE65BF8(v397, v494, v493, v8.f32[2]);
          v403 = sub_1DEE65BF8(v402, v493, v490, v8.f32[2]);
          v404 = sub_1DEE659F0(v399, v492, v401, v491, v489);
          v405 = sub_1DEE659F0(v404, v489, v403, v490, v485);
          v406 = sub_1DEE659F0(v447, v509, v453, v505, v500);
          v407 = sub_1DEE659F0(v343, v503, v455, v510, v499);
          if (v407 >= 1)
          {
            v408 = v407;
            v409 = v499;
            do
            {
              *v409 = -*v409;
              ++v409;
              --v408;
            }
            while (v408);
          }
          v410 = sub_1DEE659F0(v406, v500, v407, v499, v498);
          v411 = sub_1DEE65BF8(v410, v498, v493, v449.f32[0]);
          v412 = sub_1DEE65BF8(v411, v493, v492, v449.f32[0]);
          v413 = sub_1DEE65BF8(v410, v498, v493, v438);
          v414 = sub_1DEE65BF8(v413, v493, v491, v438);
          v415 = sub_1DEE65BF8(v410, v498, v493, v437);
          v416 = sub_1DEE65BF8(v415, v493, v490, v437);
          v417 = sub_1DEE659F0(v412, v492, v414, v491, v489);
          v418 = sub_1DEE659F0(v417, v489, v416, v490, v484);
          v419 = sub_1DEE659F0(v366, v488, v379, v487, v483);
          v420 = sub_1DEE659F0(v392, v486, v405, v485, v482);
          v421 = sub_1DEE659F0(v420, v482, v418, v484, v481);
          *(float *)v36.i32 = v480[(int)sub_1DEE659F0(v419, v483, v421, v481, v480) - 1];
        }
      }
    }
  }
  return *(float *)v36.i32;
}

simd_double2 _simd_atan2_d2(simd_double2 y, simd_double2 x)
{
  int8x16_t v2;
  int8x16_t v3;
  float64x2_t v4;
  float64x2_t v5;
  int8x16_t v6;
  float64x2_t v7;
  int8x16_t v8;
  int8x16_t v9;
  int8x16_t v10;
  float64x2_t v11;
  float64x2_t v12;
  int8x16_t v13;
  int8x16_t v14;
  float64x2_t v15;
  int8x16_t v16;
  float64x2_t v22;
  float64x2_t v24;
  float64x2_t v25;

  v2 = (int8x16_t)vdupq_n_s64(0x8000000000000000);
  v3 = (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  v4 = (float64x2_t)vandq_s8((int8x16_t)x, v3);
  v5 = (float64x2_t)vandq_s8((int8x16_t)y, v3);
  v6 = (int8x16_t)vcgeq_f64(v4, v5);
  v7 = (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL);
  v8 = vandq_s8((int8x16_t)vceqq_f64(v4, v7), (int8x16_t)vceqq_f64(v5, v7));
  v9 = (int8x16_t)vcltzq_s64((int64x2_t)x);
  v10 = (int8x16_t)vdupq_n_s64(0x3FE921FB54442D18uLL);
  v11 = (float64x2_t)vbslq_s8(vorrq_s8((int8x16_t)vcgtq_f64((float64x2_t)y, (float64x2_t)x), (int8x16_t)vcgeq_f64((float64x2_t)x, (float64x2_t)y)), vorrq_s8(vbslq_s8(v8, vbslq_s8(v9, (int8x16_t)vdupq_n_s64(0x4002D97C7F3321D2uLL), v10), vorrq_s8(vandq_s8(vandq_s8(v9, (int8x16_t)vdupq_n_s64(0x400921FB54442D18uLL)), v6), vbicq_s8((int8x16_t)vdupq_n_s64(0x3FF921FB54442D18uLL), v6))), vandq_s8((int8x16_t)y, v2)), (int8x16_t)vdupq_n_s64(0x7FF8000000000000uLL));
  v12 = vdivq_f64((float64x2_t)vbslq_s8(v6, (int8x16_t)y, (int8x16_t)vnegq_f64((float64x2_t)x)), (float64x2_t)vbslq_s8(v6, (int8x16_t)x, (int8x16_t)y));
  v13 = vorrq_s8((int8x16_t)vcltzq_f64(v12), (int8x16_t)vcgezq_f64(v12));
  v14 = vandq_s8((int8x16_t)v12, v2);
  v15 = vabsq_f64(v12);
  v16 = (int8x16_t)vcgtq_f64(v15, (float64x2_t)vdupq_n_s64(0x3FE51EB851EB851FuLL));
  __asm { FMOV            V18.2D, #-1.0 }
  v22 = (float64x2_t)vorrq_s8(vandq_s8((int8x16_t)vaddq_f64(v15, _Q18), v16), vandq_s8(vbicq_s8((int8x16_t)v12, v16), v3));
  __asm { FMOV            V6.2D, #1.0 }
  v24 = vdivq_f64(v22, (float64x2_t)vbslq_s8(v16, (int8x16_t)vaddq_f64(v15, _Q6), (int8x16_t)_Q6));
  v25 = (float64x2_t)vandq_s8((int8x16_t)vmulq_f64(v24, v24), vandq_s8((int8x16_t)vcgeq_f64(v15, (float64x2_t)vdupq_n_s64(0x3CA0000000000000uLL)), (int8x16_t)vcgtq_f64((float64x2_t)vdupq_n_s64(0x4330000000000000uLL), v15)));
  return (simd_double2)vaddq_f64(v11, (float64x2_t)vbslq_s8(v13, veorq_s8(v14, (int8x16_t)vaddq_f64((float64x2_t)vandq_s8(v10, v16), vmlaq_f64(v24, vdivq_f64(vmulq_f64(v25, vmlaq_f64((float64x2_t)vdupq_n_s64(0xC0503669FD28EC8ELL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xC05EB8BF2D05BA25), vmlaq_f64((float64x2_t)vdupq_n_s64(0xC052C08C36880273), vmlaq_f64(
                                                                     (float64x2_t)vdupq_n_s64(0xC03028545B6B807ALL),
                                                                     (float64x2_t)vdupq_n_s64(0xBFEC007FA1F72594),
                                                                     v25),
                                                                   v25),
                                                                 v25),
                                                               v25)),
                                                           vmlaq_f64((float64x2_t)vdupq_n_s64(0x4068519EFBBD62ECuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x407E563F13B049EAuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x407B0E18D2E2BE3BuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x4064A0DD43B8FA25uLL), vaddq_f64(v25, (float64x2_t)vdupq_n_s64(0x4038DBC45B14603CuLL)), v25), v25), v25), v25)), v24))), v2));
}

unsigned __int16 __floorf16@<H0>(int8x16_t _Q0@<Q0>, int8x16_t a2@<Q1>)
{
  unsigned __int32 v2;
  int8x16_t v7;

  v2 = ((unsigned __int32)_Q0.i32[0] >> 10) & 0x1F;
  if (v2 - 15 > 9)
  {
    if (v2 > 0xE)
    {
      __asm { FCVT            S0, H0 }
      *(float *)_Q0.i32 = _S0 + 0.0;
      __asm { FCVT            H0, S0 }
    }
    else if (_Q0.u16[0] <= 0x8000u)
    {
      a2.i32[0] = 0;
      __asm { FCVT            S0, H0 }
      v7.i64[0] = 0x8000000080000000;
      v7.i64[1] = 0x8000000080000000;
      _Q0.i32[0] = vbslq_s8(v7, a2, _Q0).u32[0];
      __asm { FCVT            H0, S0 }
    }
    else
    {
      _Q0.i16[0] = -17408;
    }
  }
  else
  {
    _Q0.i32[0] = ((((1 << (25 - v2)) - 1) & (_Q0.i16[0] >> 15)) + _Q0.i32[0]) & -(1 << (25 - v2));
  }
  return _Q0.i16[0];
}

simd_double2 _simd_pow_d2(simd_double2 x, simd_double2 y)
{
  float64x2_t v3;
  int64x2_t v4;
  int64x2_t v5;
  int64x2_t v6;
  uint64_t v7;
  int64x2_t v8;
  int64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  int8x16_t v32;
  float64x2_t v33;
  float64x2_t v34;
  int8x16_t v35;
  float64x2_t v36;
  simd_double2 v37;
  uint64_t v38;
  long double v39;
  long double v40;
  long double v42;
  long double v43;
  double v44;
  double v45;

  v3 = (float64x2_t)vorrq_s8(vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0xFFFFFFFFFFFFFuLL)), (int8x16_t)vdupq_n_s64(0x4070000000000000uLL));
  v4.i64[0] = -256;
  v4.i64[1] = -256;
  v5 = vaddq_s64(vcvtnq_s64_f64(v3), v4);
  v6 = vaddq_s64(v5, v5);
  v7 = v6.i64[1];
  v8 = *(int64x2_t *)((char *)&unk_1DEE798E0 + 8 * v6.i64[0]);
  v9 = *(int64x2_t *)((char *)&unk_1DEE798E0 + 8 * v7);
  v10 = (float64x2_t)vzip1q_s64(v8, v9);
  v11 = (float64x2_t)vzip2q_s64(v8, v9);
  v12 = vmulq_f64(v10, v3);
  __asm { FMOV            V7.2D, #-1.0 }
  v18 = vaddq_f64(v12, _Q7);
  v19 = vmlaq_f64(vnegq_f64(v12), v10, v3);
  v20 = vaddq_f64(v18, v19);
  v21 = vsubq_f64(v19, vsubq_f64(v20, v18));
  v22 = vcvtq_f64_s64(vaddq_s64(vsubq_s64(vshrq_n_s64((int64x2_t)x, 0x34uLL), vcgtq_s64(v5, vdupq_n_s64(0x6AuLL))), vdupq_n_s64(0xFFFFFFFFFFFFFC01)));
  v23 = vaddq_f64(v11, v22);
  v24 = vsubq_f64(v11, vsubq_f64(v23, v22));
  v25 = vmulq_f64(v20, v20);
  v26 = (float64x2_t)vdupq_n_s64(0x3FF71547652B82FEuLL);
  v27 = vmlaq_f64(v23, v26, v20);
  v28 = vaddq_f64(v24, vmlaq_f64(vmlaq_f64(vmlaq_f64(vnegq_f64(vsubq_f64(v27, v23)), v26, v20), v26, v21), v20, vmlaq_f64((float64x2_t)vdupq_n_s64(0x3C7777CBAE0ED1AAuLL), v20, vmlaq_f64(vmlaq_f64((float64x2_t)vdupq_n_s64(0xBFE71547652B82FFLL), (float64x2_t)vdupq_n_s64(0x3FDEC709DC3A0401uLL), v20), v25, vmlaq_f64(vmlaq_f64((float64x2_t)vdupq_n_s64(0xBFD71547652169A0), (float64x2_t)vdupq_n_s64(0x3FD2776C50DEF013uLL), v20), v25,
                  vmlaq_f64((float64x2_t)vdupq_n_s64(0xBFCEC73241A1A98BLL), (float64x2_t)vdupq_n_s64(0x3FCA61A45543B7AAuLL), v20))))));
  v29 = vaddq_f64(v27, v28);
  v30 = vsubq_f64(v28, vsubq_f64(v29, v27));
  v31 = vmulq_f64(v29, (float64x2_t)y);
  v32 = vornq_s8(vornq_s8((int8x16_t)vcgtq_f64((float64x2_t)vdupq_n_s64(0x10000000000000uLL), (float64x2_t)x), (int8x16_t)vcgeq_f64((float64x2_t)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL), (float64x2_t)x)), (int8x16_t)vcgeq_f64((float64x2_t)vdupq_n_s64(0x408FEC0000000000uLL), vabsq_f64(v31)));
  v33 = vmlaq_f64(vnegq_f64(v31), v29, (float64x2_t)y);
  v34 = vmlaq_f64((float64x2_t)vdupq_n_s64(0x4338000000000000uLL), (float64x2_t)vdupq_n_s64(0x4060000000000000uLL), v31);
  v35 = vandq_s8((int8x16_t)v34, (int8x16_t)vdupq_n_s64(0x7FuLL));
  v36 = vaddq_f64(vmlaq_f64(v33, v30, (float64x2_t)y), vmlaq_f64(v31, (float64x2_t)vdupq_n_s64(0xBF80000000000000), vaddq_f64(v34, (float64x2_t)vdupq_n_s64(0xC338000000000000))));
  *(_QWORD *)&v30.f64[0] = qword_1DEE7A900[v35.i64[0]];
  *(_QWORD *)&v30.f64[1] = qword_1DEE7A900[v35.i64[1]];
  v37 = (simd_double2)vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshlq_n_s64((int64x2_t)v34, 0x2DuLL), (int8x16_t)vdupq_n_s64(0xFFF0000000000000)), (int64x2_t)vmlaq_f64(v30, v30, vmulq_f64(v36, vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FE62E42FEFA39EFuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FCEBFBDFF82BDA7uLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FAC6B08D78310B7uLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3F83B2A8ABDA3E41uLL), (float64x2_t)vdupq_n_s64(0x3F55E52272DFDAA6uLL), v36), v36),
                                           v36),
                                         v36))));
  v38 = v32.i64[1];
  if ((v32.i64[0] | v32.i64[1]) < 0)
  {
    v42 = x.f64[1];
    v43 = y.f64[1];
    if (v32.i64[0])
    {
      v45 = v37.f64[1];
      v39 = powl(x.f64[0], y.f64[0]);
      v37.f64[1] = v45;
      v37.f64[0] = v39;
    }
    if (v38)
    {
      v44 = v37.f64[0];
      v40 = powl(v42, v43);
      v37.f64[0] = v44;
      v37.f64[1] = v40;
    }
  }
  return v37;
}

simd_float4 _simd_atan_f4(simd_float4 x)
{
  int8x16_t v1;
  int8x16_t v2;
  float32x4_t v3;
  float32x4_t v4;
  int8x16_t v5;
  int8x16_t v6;
  int8x16_t v7;
  float32x4_t v14;
  float32x4_t v15;

  v1.i64[0] = 0x8000000080000000;
  v1.i64[1] = 0x8000000080000000;
  v2 = vandq_s8((int8x16_t)x, v1);
  x.i64[0] &= 0x7FFFFFFF7FFFFFFFuLL;
  x.i32[2] &= ~0x80000000;
  x.i32[3] &= ~0x80000000;
  v3.i64[0] = 0x2000000020000000;
  v3.i64[1] = 0x2000000020000000;
  v4.i64[0] = 0x5F0000005F000000;
  v4.i64[1] = 0x5F0000005F000000;
  v5 = vandq_s8((int8x16_t)vcgeq_f32((float32x4_t)x, v3), (int8x16_t)vcgeq_f32(v4, (float32x4_t)x));
  v6 = (int8x16_t)vcgtq_f32((float32x4_t)x, (float32x4_t)vdupq_n_s32(0x3ED413CDu));
  v7 = (int8x16_t)vcgtq_f32((float32x4_t)x, (float32x4_t)vdupq_n_s32(0x401A827Au));
  __asm
  {
    FMOV            V5.4S, #-1.0
    FMOV            V7.4S, #1.0
  }
  v14 = vdivq_f32((float32x4_t)vbslq_s8(v7, (int8x16_t)_Q5, vbslq_s8(v6, (int8x16_t)vaddq_f32((float32x4_t)x, _Q5), (int8x16_t)x)), (float32x4_t)vbslq_s8(v7, (int8x16_t)x, vbslq_s8(v6, (int8x16_t)vaddq_f32((float32x4_t)x, _Q7), (int8x16_t)_Q7)));
  v15 = (float32x4_t)vandq_s8((int8x16_t)vmulq_f32(v14, v14), v5);
  return (simd_float4)vorrq_s8(v2, (int8x16_t)vaddq_f32((float32x4_t)vbslq_s8(v7, (int8x16_t)vdupq_n_s32(0x3FC90FDBu), vandq_s8((int8x16_t)vdupq_n_s32(0x3F490FDBu), v6)), vmlaq_f32(v14, vmlaq_f32((float32x4_t)vdupq_n_s32(0xBEAAAA2A), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3E4C925Fu), vmlaq_f32((float32x4_t)vdupq_n_s32(0xBE0E1B85), (float32x4_t)vdupq_n_s32(0x3DA4F0D1u), v15), v15), v15), vmulq_f32(v14, v15))));
}

float __nextafterf16(float _S0, float _S1)
{
  int v8;
  unsigned int v9;

  __asm
  {
    FCVT            S2, H0
    FCVT            S3, H1
  }
  if (_S3 <= _S2)
  {
    if (_S3 == _S2)
      return _S1;
    v8 = 0xFFFF;
  }
  else
  {
    v8 = 1;
  }
  v9 = LODWORD(_S0) + ((unsigned __int16)(LOWORD(_S0) & 0x8000) >> 15) + (v8 ^ (SLOWORD(_S0) >> 15));
  if ((LOWORD(_S0) & 0x7FFF) == 0)
    v9 = LODWORD(_S1) & 0xFFFF8000 | 1;
  return *(float *)&v9;
}

float __fminf16(float _S0, float _S1)
{
  __asm
  {
    FCVT            S2, H0
    FCVT            S3, H1
  }
  if (_S2 <= _S3)
    return _S0;
  return _S1;
}

simd_float4 _simd_log10_f4(simd_float4 x)
{
  int32x4_t v1;
  int32x4_t v2;
  unsigned int v3;
  int32x4_t v4;
  float32x4_t v5;
  int8x16_t v6;
  float32x4_t v7;
  float32x4_t v8;
  int8x16_t v14;
  float32x4_t v15;
  float32x4_t v17;
  float32x4_t v18;
  simd_float4 v19;
  float32x4_t v20;
  int8x16_t v21;

  v1.i64[0] = 0x80000000800000;
  v1.i64[1] = 0x80000000800000;
  v2.i64[0] = 0x100000001000000;
  v2.i64[1] = 0x100000001000000;
  v3 = vmaxvq_u32((uint32x4_t)vcgtq_s32(v2, vaddq_s32((int32x4_t)x, v1)));
  if ((v3 & 0x80000000) != 0)
  {
    v6 = (int8x16_t)vceqzq_s32((int32x4_t)vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s32(0x7F800000u)));
    v7.i64[0] = 0x4B0000004B000000;
    v7.i64[1] = 0x4B0000004B000000;
    x = (simd_float4)vbslq_s8(v6, (int8x16_t)vmulq_f32((float32x4_t)x, v7), (int8x16_t)x);
    v4 = vaddq_s32((int32x4_t)x, vdupq_n_s32(0xC0D55555));
    v8 = vcvtq_f32_s32(vshrq_n_s32(v4, 0x17uLL));
    __asm { FMOV            V4.4S, #-23.0 }
    v5 = (float32x4_t)vbslq_s8(v6, (int8x16_t)vaddq_f32(v8, _Q4), (int8x16_t)v8);
  }
  else
  {
    v4 = vaddq_s32((int32x4_t)x, vdupq_n_s32(0xC0D55555));
    v5 = vcvtq_f32_s32(vshrq_n_s32(v4, 0x17uLL));
  }
  v14.i64[0] = 0x7F0000007FLL;
  v14.i64[1] = 0x7F0000007FLL;
  v15 = (float32x4_t)vaddq_s32((int32x4_t)vandq_s8((int8x16_t)v4, v14), vdupq_n_s32(0x3F2AAAABu));
  __asm { FMOV            V3.4S, #-1.0 }
  v17 = vaddq_f32(v15, _Q3);
  v18 = vmulq_f32(v17, v17);
  v19 = (simd_float4)vmlaq_f32(vmlaq_f32(vmulq_f32(v5, (float32x4_t)vdupq_n_s32(0xB64AF600)), v17, vmlaq_f32((float32x4_t)vdupq_n_s32(0x3EDE5BD9u), v17, vmlaq_f32(vmlaq_f32((float32x4_t)vdupq_n_s32(0xBE5E5BC5), (float32x4_t)vdupq_n_s32(0x3E143CE5u), v17), v18, vmlaq_f32(vmlaq_f32((float32x4_t)vdupq_n_s32(0xBDDE6E20), (float32x4_t)vdupq_n_s32(0x3DB20B96u), v17), v18, vmlaq_f32(vmlaq_f32((float32x4_t)vdupq_n_s32(0xBD91FB27), (float32x4_t)vdupq_n_s32(0x3D775317u),
                                   v17),
                                 v18,
                                 vmlaq_f32((float32x4_t)vdupq_n_s32(0xBD890073), (float32x4_t)vdupq_n_s32(0x3D8063B4u), v17)))))), (float32x4_t)vdupq_n_s32(0x3E9A2100u), v5);
  if ((v3 & 0x80000000) != 0)
  {
    v20 = (float32x4_t)vdupq_n_s32(0x7F800000u);
    v21 = vbslq_s8((int8x16_t)vceqq_f32((float32x4_t)x, v20), (int8x16_t)v20, (int8x16_t)v19);
    v20.i64[0] = 0x7F0000007FLL;
    v20.i64[1] = 0x7F0000007FLL;
    return (simd_float4)vbslq_s8((int8x16_t)vcgezq_f32((float32x4_t)x), vbslq_s8((int8x16_t)vceqzq_f32((float32x4_t)x), (int8x16_t)v20, v21), (int8x16_t)vdupq_n_s32(0x7FC00000u));
  }
  return v19;
}

float cbrtf(float result)
{
  int8x16_t v1;
  float v2;
  int v3;
  unsigned __int16 v4;
  double *v5;
  uint64_t *v6;
  double v7;
  int v8;
  unsigned __int16 v9;
  double v10;
  int8x16_t v11;

  v2 = fabsf(result);
  if (v2 != INFINITY)
  {
    if (v2 >= 1.1755e-38)
    {
      v3 = (LODWORD(v2) >> 23) - 1;
      v9 = (__int16)((LODWORD(v2) >> 23) - 1) % 3;
      v5 = (double *)((char *)&unk_1DEE7B2E8 + 96 * ((LODWORD(v2) >> 17) & 0x3F) + 32 * (__int16)v9);
      v6 = (uint64_t *)(v5 + 3);
      v7 = COERCE_FLOAT((LODWORD(v2) & 0x7FFFFF | (v9 << 23)) + 1065353216) - *v5;
      v8 = 713031680;
    }
    else
    {
      if (result == 0.0)
        return result;
      v3 = (COERCE_UNSIGNED_INT(v2 * 3.5184e13) >> 23) - 1;
      v4 = (__int16)((COERCE_UNSIGNED_INT(v2 * 3.5184e13) >> 23) - 1) % 3;
      v5 = (double *)((char *)&unk_1DEE7B2E8
                    + 96 * ((COERCE_UNSIGNED_INT(v2 * 3.5184e13) >> 17) & 0x3F)
                    + 32 * (__int16)v4);
      v6 = (uint64_t *)(v5 + 3);
      v7 = COERCE_FLOAT((COERCE_UNSIGNED_INT(v2 * 3.5184e13) & 0x7FFFFF | (v4 << 23)) + 1065353216) - *v5;
      v8 = 587202560;
    }
    v1.i64[0] = *v6;
    v10 = v7 * *(double *)v6;
    v1.i32[0] = v8 + ((((21846 * v3) >> 16) + ((21846 * v3) >> 31)) << 23);
    v11.i64[0] = 0x8000000080000000;
    v11.i64[1] = 0x8000000080000000;
    *(float *)&v10 = v5[1]
                   * ((((((v10 * -0.0234797653 + 0.0301852863) * v10 + -0.0411522623) * v10 + 0.0617283944) * v10
                      + -0.111111111)
                     * v10
                     + 0.333333333)
                    * v10
                    + 1.0);
    return *(float *)vbslq_s8(v11, v1, *(int8x16_t *)&result).i32 * *(float *)&v10;
  }
  return result;
}

long double erfl(long double __x)
{
  unint64_t v1;
  uint64_t v2;
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v1 = *(_QWORD *)&__x & 0x8000000000000000;
  if ((*(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFuLL) - 0x7FF0000000000000 > 0x8010000000000000)
  {
    v3 = fabs(__x);
    if (v3 <= 0.46875)
    {
      if (v3 <= 1.11e-16)
      {
        v14 = v3 * 3209.37759;
        v15 = 2844.23683;
      }
      else
      {
        v10 = 0;
        v11 = __x * __x;
        v12 = v11 * 0.185777706;
        v13 = v11;
        do
        {
          v12 = v11 * (v12 + *(double *)&qword_1DEE7CB48[v10]);
          v13 = v11 * (v13 + *(double *)&qword_1DEE7CB70[v10++]);
        }
        while (v10 != 3);
        v14 = v3 * (v12 + 3209.37759);
        v15 = v13 + 2844.23683;
      }
      v4 = v14 / v15;
      goto LABEL_20;
    }
    if (v3 <= 4.0)
    {
      v16 = 0;
      v17 = v3 * 0.0000000215311535;
      v18 = v3;
      do
      {
        v17 = v3 * (v17 + *(double *)&qword_1DEE7CB90[v16]);
        v18 = v3 * (v18 + *(double *)&qword_1DEE7CBD8[v16++]);
      }
      while (v16 != 7);
      v9 = (v17 + 1230.33935) / (v18 + 1230.33935);
    }
    else
    {
      v4 = 1.0;
      if (v3 >= 27.2)
      {
LABEL_20:
        v2 = v1 ^ *(_QWORD *)&v4;
        return *(double *)&v2;
      }
      v5 = 0;
      v6 = 1.0 / (__x * __x);
      v7 = v6 * 0.0163153871;
      v8 = v6;
      do
      {
        v7 = v6 * (v7 + *(double *)&qword_1DEE7CC18[v5]);
        v8 = v6 * (v8 + *(double *)&qword_1DEE7CC48[v5++]);
      }
      while (v5 != 4);
      v9 = (0.564189584 - v6 * (v7 + 0.000658749162) / (v8 + 0.00233520498)) / v3;
    }
    v19 = trunc(v3 * 16.0) * 0.0625;
    v20 = v3 - v19;
    v21 = v3 + v19;
    v22 = expl(-(v19 * v19));
    v4 = 0.5 - v22 * expl(-(v20 * v21)) * v9 + 0.5;
    goto LABEL_20;
  }
  if (__x == 0.0)
    return __x;
  v2 = v1 | 0x3FF0000000000000;
  return *(double *)&v2;
}

double __hypotf16(__n128 _Q0, float _S1)
{
  __asm { FCVT            S2, H0 }
  _S3 = fabsf(_S2);
  __asm
  {
    FCVT            H3, S3
    FCVT            S3, H3
  }
  if (_S3 == INFINITY)
    goto LABEL_4;
  __asm { FCVT            S0, H1 }
  _S3 = fabsf(_S0);
  __asm
  {
    FCVT            H3, S3
    FCVT            S3, H3
  }
  if (_S3 == INFINITY)
  {
    _Q0.n128_f32[0] = _S1;
LABEL_4:
    _Q0.n128_u64[0] = __fabsf16(_Q0);
    return _Q0.n128_f64[0];
  }
  _Q0.n128_f32[0] = sqrtf((float)(_S0 * _S0) + (float)(_S2 * _S2));
  __asm { FCVT            H0, S0 }
  return _Q0.n128_f64[0];
}

float erfcf(float a1)
{
  float result;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  if ((LODWORD(a1) & 0x7FFFFFFFu) - 2139095040 < 0x80800001)
  {
    result = 1.0;
    if (a1 != 0.0)
      return 1.0 - COERCE_FLOAT(LODWORD(a1) & 0x80000000 | 0x3F800000);
    return result;
  }
  v4 = a1;
  v5 = fabs(a1);
  if (v5 <= 0.46875)
  {
    if (v5 <= 1.11e-16)
    {
      v16 = v5 * 3209.37759;
      v17 = 2844.23683;
    }
    else
    {
      v12 = 0;
      v13 = v4 * v4;
      v14 = v13 * 0.185777706;
      v15 = v13;
      do
      {
        v14 = v13 * (v14 + *(double *)&qword_1DEE7CD98[v12]);
        v15 = v13 * (v15 + *(double *)&qword_1DEE7CDC0[v12++]);
      }
      while (v12 != 3);
      v16 = v5 * (v14 + 3209.37759);
      v17 = v15 + 2844.23683;
    }
    v6 = 1.0 - v16 / v17;
    goto LABEL_21;
  }
  if (v5 <= 4.0)
  {
    v18 = 0;
    v19 = v5 * 0.0000000215311535;
    v20 = v5;
    do
    {
      v19 = v5 * (v19 + *(double *)&qword_1DEE7CDE0[v18]);
      v20 = v5 * (v20 + *(double *)&qword_1DEE7CE28[v18++]);
    }
    while (v18 != 7);
    v11 = (v19 + 1230.33935) / (v20 + 1230.33935);
  }
  else
  {
    v6 = 0.0;
    if (v5 >= 27.2)
      goto LABEL_21;
    v7 = 0;
    v8 = 1.0 / (v4 * v4);
    v9 = v8 * 0.0163153871;
    v10 = v8;
    do
    {
      v9 = v8 * (v9 + *(double *)&qword_1DEE7CE68[v7]);
      v10 = v8 * (v10 + *(double *)&qword_1DEE7CE98[v7++]);
    }
    while (v7 != 4);
    v11 = (0.564189584 - v8 * (v9 + 0.000658749162) / (v10 + 0.00233520498)) / v5;
  }
  v21 = trunc(v5 * 16.0) * 0.0625;
  v22 = v5 - v21;
  v23 = v5 + v21;
  v24 = expl(-(v21 * v21));
  v6 = v24 * expl(-(v22 * v23)) * v11;
LABEL_21:
  result = v6;
  if (a1 < 0.0)
    return 2.0 - result;
  return result;
}

simd_float4 _simd_log1p_f4(simd_float4 x)
{
  float32x4_t v6;
  float32x4_t v7;
  int8x16_t v8;
  int32x4_t v9;
  float32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  int32x4_t v16;
  float32x4_t v17;
  int8x16_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v22;
  int8x16_t v23;
  int8x16_t v24;
  int8x16_t v25;
  int8x16x3_t v27;

  __asm { FMOV            V2.4S, #1.0 }
  v6 = vaddq_f32((float32x4_t)x, _Q2);
  v7 = vaddq_f32(vsubq_f32(_Q2, v6), (float32x4_t)x);
  v8.i64[0] = 0x7F0000007FLL;
  v8.i64[1] = 0x7F0000007FLL;
  v9 = (int32x4_t)vandq_s8((int8x16_t)v6, v8);
  __asm { FMOV            V1.4S, #-6.25 }
  v11 = vcvtq_f32_s32(vshrq_n_s32(vaddq_s32((int32x4_t)v6, _Q1), 0x17uLL));
  v12.i64[0] = 0x8000000080000;
  v12.i64[1] = 0x8000000080000;
  v13 = (int32x4_t)vshrq_n_u32((uint32x4_t)vaddq_s32(v9, v12), 0x14uLL);
  v14 = (float32x4_t)vorrq_s8((int8x16_t)v9, (int8x16_t)_Q2);
  v15 = (float32x4_t)vdupq_n_s32(0x7F800000u);
  v16.i64[0] = 0x7F0000007F000000;
  v16.i64[1] = 0x7F0000007F000000;
  v17 = vmulq_f32(v7, (float32x4_t)vsubq_s32(v16, (int32x4_t)vandq_s8((int8x16_t)v6, (int8x16_t)v15)));
  v7.i64[0] = 0x404040404040404;
  v7.i64[1] = 0x404040404040404;
  v18 = (int8x16_t)vmlaq_s32(vdupq_n_s32(0x3020100u), v13, (int32x4_t)v7);
  v27.val[1] = (int8x16_t)xmmword_1DEE79820;
  v27.val[0] = (int8x16_t)xmmword_1DEE79830;
  v27.val[2].i64[0] = 0x3F0000003F000000;
  v27.val[2].i64[1] = 0x3F0000003F000000;
  v19 = (float32x4_t)vqtbl3q_s8(v27, v18);
  v27.val[1] = (int8x16_t)xmmword_1DEE79840;
  v27.val[0] = (int8x16_t)xmmword_1DEE79850;
  v27.val[2].i8[3] = 0;
  v27.val[2].i8[7] = 0;
  v27.val[2].i8[11] = 0;
  v27.val[2].i8[15] = 0;
  v20 = (float32x4_t)vqtbl3q_s8(v27, v18);
  __asm { FMOV            V7.4S, #-1.0 }
  v27.val[0] = (int8x16_t)vceqq_f32((float32x4_t)x, _Q7);
  v27.val[1] = (int8x16_t)vcgtq_f32(_Q7, (float32x4_t)x);
  v22 = vmlaq_f32(vmlaq_f32(_Q7, v19, v14), v19, v17);
  v23 = vbslq_s8((int8x16_t)vceqq_f32((float32x4_t)x, v15), (int8x16_t)v15, (int8x16_t)vmulq_f32(vaddq_f32(vaddq_f32(v11, v20), vmulq_f32(v22, vmlaq_f32((float32x4_t)vdupq_n_s32(0x3FB8AA3Bu), vmlaq_f32((float32x4_t)vdupq_n_s32(0xBF38AA2D), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3EF63993u), vmlaq_f32((float32x4_t)vdupq_n_s32(0xBEB92E1D), (float32x4_t)vdupq_n_s32(0x3E920AA5u), v22), v22), v22),
                             v22))),
                       (float32x4_t)vdupq_n_s32(0x3F317218u)));
  v15.i64[0] = 0x7F0000007FLL;
  v15.i64[1] = 0x7F0000007FLL;
  v24 = vbslq_s8(v27.val[0], (int8x16_t)v15, v23);
  v25 = (int8x16_t)vdupq_n_s32(0x7FC00000u);
  return (simd_float4)vbslq_s8(vorrq_s8((int8x16_t)vcltzq_f32((float32x4_t)x), (int8x16_t)vcgezq_f32((float32x4_t)x)), vbslq_s8(v27.val[1], v25, v24), v25);
}

float __fmaxf16(float _S0, float _S1)
{
  __asm
  {
    FCVT            S2, H0
    FCVT            S3, H1
  }
  if (_S2 >= _S3)
    return _S0;
  return _S1;
}

uint64_t __fegetfltrounds()
{
  unsigned int v0;
  unint64_t v1;

  HIDWORD(v1) = fegetround();
  LODWORD(v1) = HIDWORD(v1);
  v0 = v1 >> 22;
  if (v0 > 3)
    return 0xFFFFFFFFLL;
  else
    return dword_1DEE7CFE8[v0];
}

int __fpclassifyf(float a1)
{
  unsigned int v1;
  int v2;
  BOOL v3;
  int v4;

  v1 = LODWORD(a1) & 0x7FFFFFFF;
  if ((LODWORD(a1) & 0x7FFFFFFFu) - 1 >= 0x7FFFFF)
    v2 = 3;
  else
    v2 = 5;
  v3 = v1 > 0x7F800000;
  if (v1 == 2139095040)
    v4 = 2;
  else
    v4 = v2;
  if (v3)
    v4 = 1;
  if (((LODWORD(a1) & 0x7FFFFFFFu) - 0x800000) >> 24 >= 0x7F)
    return v4;
  else
    return 4;
}

double lgammal_r(double a1, int *a2)
{
  long double v2;
  double result;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  long double v10;
  long double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  int v30;

  v2 = a1;
  if ((*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) - 0x7FF0000000000000 <= 0x8010000000000000)
  {
    if (a1 == 0.0)
      return INFINITY;
    else
      return fabs(a1);
  }
  *a2 = 1;
  if (a1 >= 0.0)
  {
    if (a1 > 2.55e305)
      return a1 * 8.98846567e307;
    if (a1 > 2.22e-16)
    {
      if (a1 <= 1.5)
      {
        if (a1 >= 0.6796875)
        {
          v12 = a1 + -0.5 + -0.5;
          result = 0.0;
        }
        else
        {
          result = -logl(a1);
          v12 = v2;
        }
        if (v2 <= 0.5 || v2 >= 0.6796875)
        {
          if (v12 == 0.0)
            return result;
          v23 = 0;
          v24 = 0.0;
          v25 = 1.0;
          do
          {
            v24 = *(double *)&qword_1DEE7D0A8[v23] + v24 * v12;
            v25 = *(double *)&qword_1DEE7D0E8[v23++] + v25 * v12;
          }
          while (v23 != 8);
          v21 = v24 / v25;
          v22 = -0.577215665;
        }
        else
        {
          v18 = 0;
          v12 = v2 + -0.5 + -0.5;
          v19 = 0.0;
          v20 = 1.0;
          do
          {
            v19 = *(double *)&qword_1DEE7D128[v18] + v19 * v12;
            v20 = *(double *)&qword_1DEE7D168[v18++] + v20 * v12;
          }
          while (v18 != 8);
          v21 = v19 / v20;
          v22 = 0.422784335;
        }
        return result + v12 * (v22 + v12 * v21);
      }
      if (a1 <= 4.0)
      {
        v15 = a1 + -2.0;
        result = 0.0;
        if (v2 + -2.0 != 0.0)
        {
          v16 = 0;
          v17 = 1.0;
          do
          {
            result = *(double *)&qword_1DEE7D128[v16] + result * v15;
            v17 = *(double *)&qword_1DEE7D168[v16++] + v17 * v15;
          }
          while (v16 != 8);
          return v15 * (v15 * (result / v17) + 0.422784335);
        }
      }
      else if (a1 <= 12.0)
      {
        v26 = 0;
        v27 = a1 + -4.0;
        v28 = 0.0;
        v29 = -1.0;
        do
        {
          v28 = *(double *)&qword_1DEE7D1A8[v26] + v28 * v27;
          v29 = *(double *)&qword_1DEE7D1E8[v26++] + v29 * v27;
        }
        while (v26 != 8);
        return v27 * (v28 / v29) + 1.79175947;
      }
      else
      {
        v8 = 0.0;
        if (v2 <= 2.25e76)
        {
          v9 = 0;
          v8 = 0.00570838353;
          do
            v8 = v8 / (v2 * v2) + *(double *)&qword_1DEE7D228[v9++];
          while (v9 != 6);
        }
        v10 = v8 / v2;
        v11 = logl(v2);
        return v11 * -0.5 + 0.918938533 + v10 + v2 * (v11 + -1.0);
      }
      return result;
    }
    return -logl(a1);
  }
  if (a1 <= -4.50359963e15)
    return v2 / -0.0;
  if (a1 >= -2.22044605e-16)
  {
    *a2 = -1;
    a1 = -a1;
    return -logl(a1);
  }
  v5 = -a1;
  v6 = (double)(uint64_t)-a1;
  if (v2 <= -9.22337204e18)
    v6 = -v2;
  v7 = v5 - v6;
  if (v7 == 0.0)
    return v2 / -0.0;
  v13 = sinl(v7 * 3.14159265);
  if (v2 <= -9.22337204e18 || ((uint64_t)v5 & 1) == 0)
    *a2 = -1;
  v14 = logl(3.14159265 / fabs(v13 * v2));
  return v14 - lgammal_r(v5, &v30);
}

long double lgammal(long double __x)
{
  return lgammal_r(__x, &signgam);
}

float lgammaf_r(int *a1, float a2)
{
  return lgammal_r(a2, a1);
}

float lgammaf(float a1)
{
  return lgammal_r(a1, &signgam);
}

simd_double2 _simd_erf_d2(simd_double2 x)
{
  long double v1;
  simd_double2 v2;
  long double v4;
  long double v5;

  v4 = x.f64[1];
  v5 = erfl(x.f64[0]);
  v1 = erfl(v4);
  v2.f64[0] = v5;
  v2.f64[1] = v1;
  return v2;
}

simd_double2 _simd_erfc_d2(simd_double2 x)
{
  long double v1;
  simd_double2 v2;
  long double v4;
  long double v5;

  v4 = x.f64[1];
  v5 = erfcl(x.f64[0]);
  v1 = erfcl(v4);
  v2.f64[0] = v5;
  v2.f64[1] = v1;
  return v2;
}

simd_double2 _simd_tgamma_d2(simd_double2 x)
{
  long double v1;
  simd_double2 v2;
  long double v4;
  long double v5;

  v4 = x.f64[1];
  v5 = tgammal(x.f64[0]);
  v1 = tgammal(v4);
  v2.f64[0] = v5;
  v2.f64[1] = v1;
  return v2;
}

simd_double2 _simd_lgamma_d2(simd_double2 x)
{
  long double v1;
  simd_double2 v2;
  long double v4;
  long double v5;

  v4 = x.f64[1];
  v5 = lgammal(x.f64[0]);
  v1 = lgammal(v4);
  v2.f64[0] = v5;
  v2.f64[1] = v1;
  return v2;
}

simd_double2 _simd_round_d2(simd_double2 x)
{
  return (simd_double2)vrndaq_f64((float64x2_t)x);
}

simd_double2 _simd_nextafter_d2(simd_double2 x, simd_double2 y)
{
  long double v2;
  simd_double2 v3;
  long double v5;
  long double v6;
  long double v7;

  v5 = x.f64[1];
  v6 = y.f64[1];
  v7 = nexttowardl(x.f64[0], y.f64[0]);
  v2 = nexttowardl(v5, v6);
  v3.f64[0] = v7;
  v3.f64[1] = v2;
  return v3;
}

simd_double2 _simd_fma_d2(simd_double2 x, simd_double2 y, simd_double2 z)
{
  return (simd_double2)vmlaq_f64((float64x2_t)z, (float64x2_t)y, (float64x2_t)x);
}

simd_double2 _simd_hypot_d2(simd_double2 x, simd_double2 y)
{
  uint32x4_t v2;
  simd_double2 v3;
  long double v4;
  long double v5;
  uint64_t v7;
  long double v8;
  long double v9;
  double v10;
  double v11;

  v2 = vcgtq_u32((uint32x4_t)vdupq_n_s32(0xFFFFFC02), (uint32x4_t)vaddq_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)vtrn2q_s32((int32x4_t)x, (int32x4_t)y), 0x14uLL), (int8x16_t)vdupq_n_s32(0x7FEu)), vdupq_n_s32(0xFFFFFA02)));
  v3 = (simd_double2)vsqrtq_f64(vmlaq_f64(vmulq_f64((float64x2_t)y, (float64x2_t)y), (float64x2_t)x, (float64x2_t)x));
  if ((vmaxvq_u32(v2) & 0x80000000) != 0)
  {
    v8 = x.f64[1];
    v9 = y.f64[1];
    if (v2.i64[0])
    {
      v11 = v3.f64[1];
      v7 = v2.i64[1];
      v4 = hypotl(x.f64[0], y.f64[0]);
      v2.i64[1] = v7;
      v3.f64[1] = v11;
      v3.f64[0] = v4;
    }
    if (v2.i64[1])
    {
      v10 = v3.f64[0];
      v5 = hypotl(v8, v9);
      v3.f64[0] = v10;
      v3.f64[1] = v5;
    }
  }
  return v3;
}

simd_double2 _simd_remainder_d2(simd_double2 x, simd_double2 y)
{
  float64x2_t v2;
  float64x2_t v3;
  int8x16_t v4;
  float64x2_t v5;
  simd_double2 v11;
  uint64_t v12;
  long double v13;
  long double v14;
  long double v16;
  long double v17;
  double v18;
  double v19;

  v2 = (float64x2_t)vandq_s8((int8x16_t)y, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL));
  v3 = vrndxq_f64(vdivq_f64((float64x2_t)x, (float64x2_t)y));
  v4 = vornq_s8(vorrq_s8((int8x16_t)vceqq_s64((int64x2_t)v2, vdupq_n_s64(0x7FF0000000000000uLL)), (int8x16_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x10000000000000uLL), (uint64x2_t)v2)), (int8x16_t)vcgtq_f64((float64x2_t)vdupq_n_s64(0x4340000000000000uLL), vabsq_f64(v3)));
  v5 = vmlsq_f64((float64x2_t)x, (float64x2_t)y, v3);
  __asm { FMOV            V5.2D, #0.5 }
  v11 = (simd_double2)vsubq_f64(v5, (float64x2_t)vandq_s8(vbslq_s8((int8x16_t)vdupq_n_s64(0x8000000000000000), (int8x16_t)v5, (int8x16_t)y), (int8x16_t)vcgtq_f64(vabsq_f64(v5), vmulq_f64(v2, _Q5))));
  v12 = v4.i64[1];
  if ((v4.i64[0] | v4.i64[1]) < 0)
  {
    v16 = x.f64[1];
    v17 = y.f64[1];
    if (v4.i64[0])
    {
      v19 = v11.f64[1];
      v13 = remainderl(x.f64[0], y.f64[0]);
      v11.f64[1] = v19;
      v11.f64[0] = v13;
    }
    if (v12)
    {
      v18 = v11.f64[0];
      v14 = remainderl(v16, v17);
      v11.f64[0] = v18;
      v11.f64[1] = v14;
    }
  }
  return v11;
}

simd_double2 _simd_fmod_d2(simd_double2 x, simd_double2 y)
{
  int8x16_t v2;
  float64x2_t v3;
  int64x2_t v4;
  int64x2_t v5;
  float64x2_t v6;
  int64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  simd_double2 v10;
  uint64_t v11;
  long double v12;
  int8x16_t v13;
  long double v14;
  long double v16;
  long double v17;
  int8x16_t v18;
  int8x16_t v19;
  double v20;

  v2 = (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  v3 = (float64x2_t)vandq_s8((int8x16_t)x, v2);
  v4 = (int64x2_t)vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x8000000000000000));
  v5 = (int64x2_t)vandq_s8((int8x16_t)y, v2);
  v6 = vrndq_f64(vdivq_f64((float64x2_t)x, (float64x2_t)y));
  v7 = (int64x2_t)vornq_s8((int8x16_t)vceqq_s64(v5, vdupq_n_s64(0x7FF0000000000000uLL)), (int8x16_t)vcgtq_f64((float64x2_t)vdupq_n_s64(0x4340000000000000uLL), vabsq_f64(v6)));
  v8 = (float64x2_t)veorq_s8((int8x16_t)v4, (int8x16_t)y);
  v9 = vmlsq_f64(v3, v8, v6);
  v10 = (simd_double2)vorrq_s8((int8x16_t)v4, (int8x16_t)vaddq_f64(v9, (float64x2_t)vandq_s8((int8x16_t)v5, (int8x16_t)vcltzq_f64(v9))));
  v11 = v7.i64[1];
  if ((v7.i64[0] | v7.i64[1]) < 0)
  {
    v4.i64[0] = 0;
    v17 = x.f64[1];
    v18 = (int8x16_t)vdupq_lane_s64(vceqq_s64(v7, v4).i64[0], 0);
    v16 = v8.f64[1];
    v19 = (int8x16_t)v10;
    v12 = fmodl(x.f64[0], v8.f64[0]);
    v13.i64[1] = v19.i64[1];
    *(long double *)v13.i64 = v12;
    v10 = (simd_double2)vbslq_s8(v18, v19, v13);
    if (v11)
    {
      v20 = v10.f64[0];
      v14 = fmodl(v17, v16);
      v10.f64[0] = v20;
      v10.f64[1] = v14;
    }
  }
  return v10;
}

simd_float4 _simd_asinh_f4(simd_float4 x)
{
  int8x16_t v2;
  unsigned __int128 v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v28;
  int8x16_t v30;
  int8x16_t v31;
  int8x16_t v32;

  v2.i64[0] = 0x8000000080000000;
  v2.i64[1] = 0x8000000080000000;
  v32 = vandq_s8((int8x16_t)x, v2);
  v3 = *(_OWORD *)&x & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL);
  v30 = (int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x44BB8000u), (float32x4_t)v3);
  v4 = vmulq_f32((float32x4_t)v3, (float32x4_t)v3);
  v5 = vmlaq_f32(vnegq_f32(v4), (float32x4_t)v3, (float32x4_t)v3);
  v6 = (float32x4_t)v3;
  v31 = (int8x16_t)vmlaq_f32((float32x4_t)v3, vmulq_f32(v4, (float32x4_t)vdupq_n_s32(0xBE2AA5DE)), (float32x4_t)v3);
  __asm { FMOV            V2.4S, #1.0 }
  v12 = vmaxnmq_f32(v4, _Q2);
  v13 = vminnmq_f32(v4, _Q2);
  v14 = vaddq_f32(v4, _Q2);
  v15 = vaddq_f32(v5, vsubq_f32(v13, vsubq_f32(v14, v12)));
  v16 = vrsqrteq_f32(v14);
  v17 = vmulq_f32(v14, v16);
  v18 = vmlaq_f32(vmlaq_f32(vnegq_f32(v17), v16, v14), v16, v15);
  v19 = vmlsq_f32(vmlsq_f32(_Q2, v16, v17), v16, v18);
  __asm
  {
    FMOV            V1.4S, #0.3125
    FMOV            V3.4S, #0.375
  }
  v22 = vmlaq_f32(_Q3, _Q1, v19);
  _Q1.i64[0] = 0x3F0000003F000000;
  _Q1.i64[1] = 0x3F0000003F000000;
  v23 = vmlaq_f32(v18, vmulq_f32(v19, vmlaq_f32(_Q1, v19, v22)), v17);
  v24 = vaddq_f32(v17, v6);
  v25 = vaddq_f32(v24, v23);
  v26 = vaddq_f32(vsubq_f32(v6, vsubq_f32(v24, v17)), vsubq_f32(v23, vsubq_f32(v25, v24)));
  __asm { FMOV            V1.4S, #-1.0 }
  v28 = vaddq_f32(v25, _Q1);
  return (simd_float4)vorrq_s8(v32, vbslq_s8((int8x16_t)vcgeq_f32(v6, (float32x4_t)vdupq_n_s32(0x3C800000u)), (int8x16_t)vaddq_f32((float32x4_t)vbicq_s8((int8x16_t)vdupq_n_s32(0x3F317218u), v30), (float32x4_t)_simd_log1p_f4((simd_float4)vbslq_s8(v30, (int8x16_t)vaddq_f32(v28, vsubq_f32(v26, vaddq_f32(vsubq_f32(v28, v25), _Q2))), (int8x16_t)vaddq_f32(v6, _Q1)))), v31));
}

simd_float4 _simd_acosh_f4(simd_float4 x)
{
  float32x4_t v6;
  float32x4_t v7;
  int8x16_t v8;
  float32x4_t v9;
  int8x16_t v10;
  int8x16_t v11;
  int8x16_t v12;
  float32x4_t v13;
  unsigned __int128 v14;
  int32x4_t v15;
  int32x4_t v16;
  float32x4_t v17;
  int32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;

  __asm { FMOV            V4.4S, #-1.0 }
  v6 = vaddq_f32((float32x4_t)x, _Q4);
  v7 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_f32(v6), (int8x16_t)vdupq_n_s32(0x7FC00000u), (int8x16_t)v6);
  v6.i64[0] = 0x3F0000003F000000;
  v6.i64[1] = 0x3F0000003F000000;
  v8 = (int8x16_t)vcgeq_f32(v7, v6);
  v9 = vsqrtq_f32((float32x4_t)vbslq_s8(v8, (int8x16_t)vmlaq_f32(_Q4, (float32x4_t)x, (float32x4_t)x), (int8x16_t)v7));
  v10 = (int8x16_t)vmulq_f32(vmlaq_f32((float32x4_t)vdupq_n_s32(0x3FB504F3u), vmlaq_f32((float32x4_t)vdupq_n_s32(0xBDF159FD), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3CD8B7F5u), vmlaq_f32((float32x4_t)vdupq_n_s32(0xBBF6A779), (float32x4_t)vdupq_n_s32(0x3AE6A556u), v7), v7), v7), v7), v9);
  v11 = (int8x16_t)vcgeq_f32((float32x4_t)x, (float32x4_t)vdupq_n_s32(0x44BB8000u));
  v12.i64[0] = 0x8000000080000000;
  v12.i64[1] = 0x8000000080000000;
  v13 = vaddq_f32((float32x4_t)vbslq_s8(v11, v12, (int8x16_t)v9), (float32x4_t)x);
  v14 = *(_OWORD *)&vandq_s8((int8x16_t)v13, (int8x16_t)vdupq_n_s32(0x807FFFFF)) | __PAIR128__(0x3F0000003F000000, 0x3F0000003F000000);
  v15 = vcgtq_f32((float32x4_t)vdupq_n_s32(0x3F3504F3u), (float32x4_t)v14);
  v16.i64[0] = 0x7D0000007DLL;
  v16.i64[1] = 0x7D0000007DLL;
  v17 = vaddq_f32((float32x4_t)vbslq_s8((int8x16_t)v15, (int8x16_t)vaddq_f32((float32x4_t)v14, (float32x4_t)v14), (int8x16_t)v14), _Q4);
  v18 = vaddq_s32(vsraq_n_s32(v15, (int32x4_t)v13, 0x17uLL), v16);
  v19 = vmulq_f32(v17, v17);
  v20 = vcvtq_f32_s32(v18);
  v21.i64[0] = 0xBF000000BF000000;
  v21.i64[1] = 0xBF000000BF000000;
  v22 = (float32x4_t)vdupq_n_s32(0x7F800000u);
  return (simd_float4)vbslq_s8(v8, (int8x16_t)vaddq_f32((float32x4_t)vandq_s8((int8x16_t)vdupq_n_s32(0x3F317218u), v11), (float32x4_t)vbslq_s8((int8x16_t)vceqq_f32(v13, v22), (int8x16_t)v22, (int8x16_t)vmlaq_f32(vaddq_f32(v17, vmlaq_f32(vmlaq_f32(vmulq_f32(vmulq_f32(v17, v19), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3EAAAAAAu), vmlaq_f32((float32x4_t)vdupq_n_s32(0xBE7FFFFC), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3E4CCEACu),
                                                                               vmlaq_f32((float32x4_t)vdupq_n_s32(0xBE2AAE50), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3E11E9BFu), vmlaq_f32((float32x4_t)vdupq_n_s32(0xBDFE5D4F), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3DEF251Au), vmlaq_f32((float32x4_t)vdupq_n_s32(0xBDEBD1B8), (float32x4_t)vdupq_n_s32(0x3D9021BBu), v17), v17), v17), v17), v17), v17), v17), v17)), (float32x4_t)vdupq_n_s32(0xB95E8082),
                                                                       v20),
                                                                     v21,
                                                                     v19)),
                                                                 (float32x4_t)vdupq_n_s32(0x3F318000u),
                                                                 v20))),
                        v10);
}

simd_float4 _simd_atanh_f4(simd_float4 x)
{
  int8x16_t v1;
  int8x16_t v2;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  int8x16_t v13;
  float32x4_t v14;
  unsigned __int128 v15;
  int32x4_t v16;
  float32x4_t v18;
  int32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;

  v1.i64[0] = 0x8000000080000000;
  v1.i64[1] = 0x8000000080000000;
  v2 = vandq_s8((int8x16_t)x, v1);
  __asm { FMOV            V2.4S, #1.0 }
  v8 = (float32x4_t)vorrq_s8(vandq_s8((int8x16_t)vcgtq_f32((float32x4_t)(*(_OWORD *)&x & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), _Q2), (int8x16_t)vdupq_n_s32(0x7FC00000u)), (int8x16_t)(*(_OWORD *)&x & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)));
  v9 = (float32x4_t)vbicq_s8((int8x16_t)v8, (int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x39800000u), v8));
  v10 = vmulq_f32(v9, v9);
  v11 = vaddq_f32(v8, _Q2);
  v12 = vsubq_f32(_Q2, v8);
  v13 = (int8x16_t)vmulq_f32(vmlaq_f32(_Q2, v10, vmlaq_f32((float32x4_t)vdupq_n_s32(0x3EAAAB30u), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3E4C93B2u), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3E163647u), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3DA8D4BFu), (float32x4_t)vdupq_n_s32(0x3E3A1A12u), v10), v10), v10), v10)), v8);
  v14 = vdivq_f32(v11, v12);
  v15 = *(_OWORD *)&vandq_s8((int8x16_t)v14, (int8x16_t)vdupq_n_s32(0x807FFFFF)) | __PAIR128__(0x3F0000003F000000, 0x3F0000003F000000);
  v16 = vcgtq_f32((float32x4_t)vdupq_n_s32(0x3F3504F3u), (float32x4_t)v15);
  v12.i64[0] = 0x7D0000007DLL;
  v12.i64[1] = 0x7D0000007DLL;
  __asm { FMOV            V7.4S, #-1.0 }
  v18 = vaddq_f32((float32x4_t)vbslq_s8((int8x16_t)v16, (int8x16_t)vaddq_f32((float32x4_t)v15, (float32x4_t)v15), (int8x16_t)v15), _Q7);
  v19 = vaddq_s32(vsraq_n_s32(v16, (int32x4_t)v14, 0x17uLL), (int32x4_t)v12);
  v20 = vmulq_f32(v18, v18);
  v21 = vcvtq_f32_s32(v19);
  v22.i64[0] = 0xBF000000BF000000;
  v22.i64[1] = 0xBF000000BF000000;
  v23 = vmlaq_f32(vaddq_f32(v18, vmlaq_f32(vmlaq_f32(vmulq_f32(vmulq_f32(v18, v20), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3EAAAAAAu), vmlaq_f32((float32x4_t)vdupq_n_s32(0xBE7FFFFC), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3E4CCEACu), vmlaq_f32((float32x4_t)vdupq_n_s32(0xBE2AAE50), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3E11E9BFu), vmlaq_f32((float32x4_t)vdupq_n_s32(0xBDFE5D4F), vmlaq_f32(
                                (float32x4_t)vdupq_n_s32(0x3DEF251Au),
                                vmlaq_f32((float32x4_t)vdupq_n_s32(0xBDEBD1B8), (float32x4_t)vdupq_n_s32(0x3D9021BBu), v18), v18), v18), v18), v18), v18), v18), v18)), (float32x4_t)vdupq_n_s32(0xB95E8082), v21), v22, v20)), (float32x4_t)vdupq_n_s32(0x3F318000u), v21);
  v24 = (float32x4_t)vdupq_n_s32(0x7F800000u);
  v20.i64[0] = 0x3F0000003F000000;
  v20.i64[1] = 0x3F0000003F000000;
  return (simd_float4)vorrq_s8(v2, vbslq_s8((int8x16_t)vcgeq_f32(v8, v20), vbslq_s8((int8x16_t)vceqq_f32(v14, v24), (int8x16_t)v24, (int8x16_t)vmulq_f32(v23, v20)), v13));
}

simd_double2 _simd_expm1_d2(simd_double2 x)
{
  float64x2_t v1;
  int64x2_t v2;
  float64x2_t v3;
  float64x2_t v4;
  int64x2_t v10;
  int64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v16;

  v1 = vminq_f64(vmaxq_f64((float64x2_t)x, (float64x2_t)vdupq_n_s64(0xC042B708872320E2)), (float64x2_t)vdupq_n_s64(0x40862E42FEFA39F0uLL));
  v2 = vcvtnq_s64_f64(vmulq_f64(v1, (float64x2_t)vdupq_n_s64(0x40671547652B82FDuLL)));
  v3 = vcvtq_f64_s64(v2);
  v4 = vmlaq_f64(vmlaq_f64(v1, (float64x2_t)vdupq_n_s64(0xBF762E4000000000), v3), (float64x2_t)vdupq_n_s64(0xBE47F7D1CF79ABCALL), v3);
  __asm { FMOV            V4.2D, #1.0 }
  v10 = vaddq_s64(v2, vdupq_n_s64(0x40uLL));
  v11 = (int64x2_t)vandq_s8((int8x16_t)vshlq_n_s64(v10, 0x2DuLL), (int8x16_t)vdupq_n_s64(0xFFF0000000000000));
  v12 = vsubq_f64(_Q4, (float64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(v10, vdupq_n_s64(0x1B7FuLL)), (int8x16_t)vdupq_n_s64(0x3C90000000000000uLL), (int8x16_t)vsubq_s64((int64x2_t)_Q4, v11)));
  v13 = vmulq_f64(v4, vmlaq_f64(_Q4, vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FDFFFFFFFFFFE1FuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FC55555555553F0uLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FA55555CA407CCBuLL), (float64x2_t)vdupq_n_s64(0x3F8111116E99AC77uLL), v4), v4), v4), v4));
  v14 = (float64x2_t)vandq_s8((int8x16_t)v10, (int8x16_t)vdupq_n_s64(0x7FuLL));
  __asm { FMOV            V3.2D, #0.5 }
  *(_QWORD *)&v14.f64[0] = qword_1DEE7D260[*(_QWORD *)&v14.f64[0]];
  *(_QWORD *)&v14.f64[1] = qword_1DEE7D260[*(_QWORD *)&v14.f64[1]];
  v16 = vmulq_f64(vaddq_f64(vaddq_f64(v14, v12), vmlaq_f64(v13, v14, v13)), (float64x2_t)vaddq_s64(v11, _Q3));
  return (simd_double2)vaddq_f64(v16, v16);
}

simd_float4 _simd_cbrt_f4(simd_float4 x)
{
  unsigned __int128 v1;
  int8x16_t v2;
  int8x16_t v3;
  uint32x4_t v4;
  int8x16_t v5;
  int8x16_t v11;
  int8x16_t v12;
  float32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  int32x4_t v16;
  int32x4_t v17;
  int32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  int8x16_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int8x16_t v24;
  int8x16_t v25;
  float32x4_t v26;
  float32x4_t v28;
  int8x16_t v29;
  int8x16_t v30;
  __int128 v31;
  uint32x4_t v32;
  int8x16_t v33;
  float32x4_t v34;
  int8x16x2_t v36;

  v1 = *(_OWORD *)&x & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL);
  v2.i64[0] = 0x8000000080000000;
  v2.i64[1] = 0x8000000080000000;
  v3 = vandq_s8((int8x16_t)x, v2);
  v4.i64[0] = 0x80000000800000;
  v4.i64[1] = 0x80000000800000;
  v5 = (int8x16_t)vcgtq_u32(v4, (uint32x4_t)(*(_OWORD *)&x & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)));
  __asm { FMOV            V4.4S, #1.0 }
  v11.i64[0] = 0x5600000056000000;
  v11.i64[1] = 0x5600000056000000;
  v12 = (int8x16_t)vmulq_f32((float32x4_t)vbslq_s8(v5, v11, _Q4), (float32x4_t)x);
  v11.i64[0] = 0x7F0000007FLL;
  v11.i64[1] = 0x7F0000007FLL;
  v13 = (float32x4_t)vorrq_s8(vandq_s8(v12, v11), _Q4);
  v11.i64[0] = -1;
  v11.i64[1] = -1;
  v14 = vaddq_s32((int32x4_t)(*(_OWORD *)&vshrq_n_u32((uint32x4_t)v12, 0x17uLL) & __PAIR128__(0xFFFFFEFFFFFFFEFFLL, 0xFFFFFEFFFFFFFEFFLL)), (int32x4_t)v11);
  v15 = vmulq_s32(v14, vdupq_n_s32(0x2AAAABu));
  v16.i64[0] = 0x200000002;
  v16.i64[1] = 0x200000002;
  v17 = vmlaq_s32(v14, vshrq_n_s32(v15, 0x17uLL), v16);
  v18 = vdupq_n_s32(0x3020100u);
  v16.i64[0] = 0x404040404040404;
  v16.i64[1] = 0x404040404040404;
  v19 = vrecpeq_f32(v13);
  v20 = vaddq_f32(vaddq_f32(vmulq_f32(v19, vrecpsq_f32(v13, v19)), (float32x4_t)vdupq_n_s32(0x48C00000u)), (float32x4_t)vdupq_n_s32(0xC8C00000));
  v21.i64[0] = 0x1F0000001FLL;
  v21.i64[1] = 0x1F0000001FLL;
  v22 = (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v20, 0x13uLL), v21);
  v23 = vmulq_s32(v22, v16);
  v24 = (int8x16_t)vaddq_s32(v23, v18);
  v25 = (int8x16_t)vmlaq_s32(v18, v17, v16);
  v26 = (float32x4_t)vqtbl1q_s8((int8x16_t)xmmword_1DEE7D660, v25);
  __asm { FMOV            V7.4S, #-1.0 }
  v28 = vmlaq_f32(_Q7, v13, v20);
  v29 = (int8x16_t)vaddq_s32(v23, vdupq_n_s32(0xE2E1E0E0));
  v36.val[1] = (int8x16_t)xmmword_1DEE7D680;
  v36.val[0] = (int8x16_t)xmmword_1DEE7D690;
  v30 = vqtbl2q_s8(v36, v24);
  v36.val[0] = (int8x16_t)xmmword_1DEE7D6A0;
  v31 = xmmword_1DEE7D6B0;
  v32 = (uint32x4_t)xmmword_1DEE7D6C0;
  v33 = vqtbl3q_s8(*(int8x16x3_t *)v36.val[0].i8, v29);
  v32.i64[0] = 0x700000007;
  v32.i64[1] = 0x700000007;
  v34 = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)v22, v32), v33, v30);
  v30.i64[0] = 0x5500000055;
  v30.i64[1] = 0x5500000055;
  v22.i64[0] = 0x4600000046;
  v22.i64[1] = 0x4600000046;
  return (simd_float4)vorrq_s8(vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vdupq_n_s32(0x80800001), (uint32x4_t)vaddq_s32((int32x4_t)v1, vdupq_n_s32(0x80800000))), (int8x16_t)v1, (int8x16_t)vmulq_f32(vaddq_f32(vmlaq_f32((float32x4_t)vqtbl1q_s8((int8x16_t)xmmword_1DEE7D670, v25), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3EAAAAAAu), vmlaq_f32((float32x4_t)vdupq_n_s32(0xBDE3A363), (float32x4_t)vdupq_n_s32(0x3D7D057Cu), v28), v28), vmulq_f32(v28, v26)), v26), vmulq_f32(
                                         (float32x4_t)vshlq_n_s32(vsraq_n_s32((int32x4_t)vbslq_s8(v5, (int8x16_t)v22, v30), v15, 0x17uLL), 0x17uLL), v34))), v3);
}

simd_double2 _simd_log10_d2(simd_double2 x)
{
  return (simd_double2)vmulq_f64((float64x2_t)_simd_log2_d2(x), (float64x2_t)vdupq_n_s64(0x3FD34413509F79FFuLL));
}

double sub_1DEE6F01C(uint64_t a1, double a2)
{
  unsigned int v2;
  int v3;
  double v4;

  if ((int)a1 >= 0)
    v2 = a1;
  else
    v2 = -(int)a1;
  if (v2 >= 0x3FF)
  {
    v3 = (((int)a1 >> 31) ^ 0x3FE) - ((int)a1 >> 31);
    *(_QWORD *)&v4 = (unint64_t)(v3 + 1023) << 52;
    if ((a1 & 0x80000000) != 0)
    {
      do
      {
        a2 = a2 * v4;
        a1 = (a1 - v3);
      }
      while ((int)a1 < -1022);
    }
    else
    {
      do
      {
        a2 = a2 * v4;
        a1 = (a1 - v3);
      }
      while ((int)a1 > 1022);
    }
  }
  return a2 * COERCE_DOUBLE((a1 << 52) + 0x3FF0000000000000);
}

float remainderf(float a1, float a2)
{
  int v2;
  float v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  BOOL v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  int v24;
  unsigned int v25;

  v2 = (LODWORD(a1) >> 23);
  v3 = a2;
  v4 = (LODWORD(a2) >> 23);
  v5 = LODWORD(a1) & 0x7FFFFF | 0x800000;
  v6 = LODWORD(a2) & 0x7FFFFF | 0x800000;
  if ((LODWORD(a1) & 0x7F800000u) - 2139095040 < 0x81000000 || (LODWORD(a2) & 0x7F800000u) - 2139095040 < 0x81000000)
  {
    v7 = LODWORD(a1) & 0x7FFFFFFF;
    if ((LODWORD(a1) & 0x7FFFFFFFu) > 0x7F800000)
      return a1;
    v8 = LODWORD(a2) & 0x7FFFFFFF;
    if ((LODWORD(a2) & 0x7FFFFFFFu) > 0x7F800000)
      return a2;
    if (v7 == 2139095040 || !v8)
      return INFINITY - INFINITY;
    if (!v7)
      return a1;
    a2 = a1;
    if (v8 == 2139095040)
      return a2;
    if (!(v7 >> 23))
    {
      v9 = __clz(LODWORD(a1) & 0x7FFFFF);
      v5 = (LODWORD(a1) & 0x7FFFFF) << (v9 - 8);
      v2 = v2 - v9 + 9;
    }
    if (!(v8 >> 23))
    {
      v10 = LODWORD(v3) & 0x7FFFFF;
      v11 = __clz(LODWORD(v3) & 0x7FFFFF);
      v6 = v10 << (v11 - 8);
      v4 = v4 - v11 + 9;
    }
  }
  v12 = LODWORD(a1) & 0x80000000;
  v13 = v2 - v4;
  if (v13 >= 1)
  {
    do
    {
      v14 = v5 - v6;
      if (v5 == v6)
        goto LABEL_26;
      v15 = __clz(v14) - 8;
      v16 = v14 << v15;
      v17 = v13 - v15;
      --v13;
      v18 = v5 >= v6;
      if (v5 < v6)
        v5 *= 2;
      else
        v5 = v16;
      if (v18)
        v13 = v17;
    }
    while (v13 > 0);
  }
  v19 = v13 + v4;
  if (v13 >= -1)
  {
    v20 = v6 << -(char)v13;
    if (2 * v5 >= 3 * v20)
    {
      v21 = 2 * v20 - v5;
      v12 ^= 0x80000000;
    }
    else
    {
      v21 = v5 - v20;
      if (v5 <= v20)
      {
        if (v5 == v20)
        {
LABEL_26:
          LODWORD(a2) = LODWORD(a1) & 0x80000000;
          return a2;
        }
        v21 = v20 - v5;
        if (2 * v5 > v20)
          v12 ^= 0x80000000;
        else
          v21 = v5;
      }
    }
    v22 = __clz(v21);
    v23 = v22 - 8;
    v5 = v21 << (v22 - 8);
    v19 -= v23;
  }
  v24 = v19 << 23;
  v25 = (v5 >> (v19 == 0)) & 0xFF7FFFFF;
  if (v19 < 1)
    v24 = 0;
  LODWORD(a2) = v24 | v12 | v25;
  return a2;
}

long double remquol(long double __x, long double __y, int *__z)
{
  double v3;
  double v4;
  uint64_t v5;
  unsigned int v6;
  int v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  double v15;
  double v16;
  char v17;
  double v18;
  uint64_t v19;
  unsigned int v20;
  int v21;
  double v22;
  double v23;
  double v24;
  int v25;
  double v26;
  unsigned int v27;
  int v28;
  double v29;
  double v30;
  long double v31;

  *__z = 0;
  v3 = fabs(__x);
  if (v3 == INFINITY || __y == 0.0)
    return INFINITY - INFINITY;
  if (__x != 0.0)
  {
    v4 = fabs(__y);
    if (v4 != INFINITY)
    {
      v5 = (*(_QWORD *)&v3 >> 52) & 0x7FFLL;
      v6 = v5 - 2047;
      v7 = v5 - 1023;
      v8 = (COERCE_UNSIGNED_INT64(COERCE_DOUBLE(*(_QWORD *)&v3 & 0x400FFFFFFFFFFFFFLL | 0x3FF0000000000000) + -1.0) >> 52)
         - 2045;
      if (v6 > 0xFFFFF801)
        v8 = v7;
      v10 = (*(_QWORD *)&v4 >> 52) & 0x7FFLL;
      v9 = v10 - 2047;
      LODWORD(v10) = v10 - 1023;
      if (v9 <= 0xFFFFF801)
        v10 = (COERCE_UNSIGNED_INT64(COERCE_DOUBLE(*(_QWORD *)&v4 & 0x400FFFFFFFFFFFFFLL | 0x3FF0000000000000) + -1.0) >> 52)
            - 2045;
      else
        v10 = v10;
      v11 = v8 - v10;
      if (v8 - (int)v10 < 0)
      {
        v17 = 0;
      }
      else
      {
        if (v11)
        {
          v12 = -(int)v10;
          if ((int)v10 > 0)
            v13 = v10;
          else
            v13 = -(int)v10;
          if (v13 < 0x3FF)
          {
            v16 = v4;
          }
          else
          {
            v14 = (((int)v12 >> 31) ^ 0x3FE) - ((int)v12 >> 31);
            *(_QWORD *)&v15 = (unint64_t)(v14 + 1023) << 52;
            v16 = v4;
            if ((int)v10 <= 0)
            {
              do
              {
                v16 = v16 * v15;
                v12 = (v12 - v14);
              }
              while ((int)v12 > 1022);
            }
            else
            {
              do
              {
                v16 = v16 * v15;
                v12 = (v12 - v14);
              }
              while ((int)v12 < -1022);
            }
          }
          *(_QWORD *)&v18 = (v12 << 52) + 0x3FF0000000000000;
          v19 = -v8;
          if (v8 > 0)
            v20 = v8;
          else
            v20 = -v8;
          if (v20 >= 0x3FF)
          {
            v21 = (((int)v19 >> 31) ^ 0x3FE) - ((int)v19 >> 31);
            *(_QWORD *)&v22 = (unint64_t)(v21 + 1023) << 52;
            if (v8 <= 0)
            {
              do
              {
                v3 = v3 * v22;
                v19 = (v19 - v21);
              }
              while ((int)v19 > 1022);
            }
            else
            {
              do
              {
                v3 = v3 * v22;
                v19 = (v19 - v21);
              }
              while ((int)v19 < -1022);
            }
          }
          v11 = 0;
          v23 = v16 * v18;
          v24 = v3 * COERCE_DOUBLE((v19 << 52) + 0x3FF0000000000000);
          do
          {
            v25 = v11 | (v24 >= v23);
            if (v24 < v23)
              v26 = 0.0;
            else
              v26 = v23;
            v11 = 2 * v25;
            v24 = v24 - v26 + v24 - v26;
            --v8;
          }
          while ((_DWORD)v10 != v8);
          if ((int)v10 >= 0)
            v27 = v10;
          else
            v27 = -(int)v10;
          if (v27 >= 0x3FF)
          {
            v28 = (((int)v10 >> 31) ^ 0x3FE) - ((int)v10 >> 31);
            *(_QWORD *)&v29 = (unint64_t)(v28 + 1023) << 52;
            if ((v10 & 0x80000000) != 0)
            {
              do
              {
                v24 = v24 * v29;
                v10 = (v10 - v28);
              }
              while ((int)v10 < -1022);
            }
            else
            {
              do
              {
                v24 = v24 * v29;
                v10 = (v10 - v28);
              }
              while ((int)v10 > 1022);
            }
          }
          v3 = v24 * COERCE_DOUBLE((v10 << 52) + 0x3FF0000000000000);
        }
        v17 = v11 | (v3 >= v4);
        v30 = 0.0;
        if (v3 >= v4)
          v30 = v4;
        v3 = v3 - v30;
      }
      if (v3 >= 4.49423284e307)
      {
        if (v3 <= v4 * 0.5 && ((v17 & 1) == 0 || v3 != v4 * 0.5))
        {
LABEL_58:
          v31 = __x;
          if (__x >= 0.0)
            __x = v3;
          else
            __x = -v3;
          *__z = (v17 & 0x7F ^ ((uint64_t)(*(_QWORD *)&__y ^ *(_QWORD *)&v31) >> 63))
               - ((uint64_t)(*(_QWORD *)&__y ^ *(_QWORD *)&v31) >> 63);
          return __x;
        }
      }
      else if (v3 + v3 <= v4 && ((v17 & 1) == 0 || v3 + v3 != v4))
      {
        goto LABEL_58;
      }
      v3 = v3 - v4;
      ++v17;
      goto LABEL_58;
    }
  }
  return __x;
}

simd_double2 _simd_log1p_d2(simd_double2 x)
{
  float64x2_t v6;
  float64x2_t v7;
  int8x16_t v8;
  float64x2_t v9;
  float64x2_t v10;
  int64x2_t v12;
  float64x2_t v13;
  int64x2_t v14;
  float64x2_t v15;
  float64_t v16;
  float64_t v17;
  float64x2_t v18;
  int8x16_t v20;
  int8x16_t v21;
  float64x2_t v22;

  __asm { FMOV            V1.2D, #1.0 }
  v6 = vaddq_f64((float64x2_t)x, _Q1);
  v7 = vaddq_f64(vsubq_f64(_Q1, v6), (float64x2_t)x);
  v8 = vandq_s8((int8x16_t)v6, (int8x16_t)vdupq_n_s64(0xFFFFFFFFFFFFFuLL));
  v9 = (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL);
  v10 = (float64x2_t)vandq_s8((int8x16_t)v6, (int8x16_t)v9);
  __asm { FMOV            V2.2D, #-4.0 }
  v12 = vaddq_s64((int64x2_t)v10, _Q2);
  v13 = (float64x2_t)vorrq_s8(v8, (int8x16_t)vdupq_n_s64(0x4070000000000000uLL));
  v14.i64[0] = -256;
  v14.i64[1] = -256;
  v15 = (float64x2_t)vaddq_s64(vcvtnq_s64_f64(v13), v14);
  v16 = v15.f64[1];
  v17 = v15.f64[0];
  *(_QWORD *)&v15.f64[0] = qword_1DEE7D700[*(_QWORD *)&v15.f64[0]];
  *(_QWORD *)&v15.f64[1] = qword_1DEE7D700[*(_QWORD *)&v15.f64[1]];
  v18 = vmulq_f64(v7, (float64x2_t)vsubq_s64(vdupq_n_s64(0x8060000000000000), (int64x2_t)v10));
  *(_QWORD *)&v10.f64[0] = qword_1DEE7DF08[*(_QWORD *)&v17];
  *(_QWORD *)&v10.f64[1] = qword_1DEE7DF08[*(_QWORD *)&v16];
  __asm { FMOV            V7.2D, #-1.0 }
  v20 = (int8x16_t)vceqq_f64((float64x2_t)x, _Q7);
  v21 = (int8x16_t)vcgtq_f64(_Q7, (float64x2_t)x);
  v22 = vmlaq_f64(vmlaq_f64(_Q7, v10, v13), v10, v18);
  return (simd_double2)vbslq_s8(vornq_s8(v21, vorrq_s8((int8x16_t)vcltzq_f64((float64x2_t)x), (int8x16_t)vcgezq_f64((float64x2_t)x))), (int8x16_t)vdupq_n_s64(0x7FF8000000000033uLL), vbslq_s8(v20, (int8x16_t)vdupq_n_s64(0xFFF0000000000000), vbslq_s8((int8x16_t)vceqq_f64((float64x2_t)x, v9), (int8x16_t)v9, (int8x16_t)vmulq_f64(vaddq_f64(vaddq_f64(v15, vmulq_f64(v22, vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FF71547652B82FEuLL), vmlaq_f64(
                                                    (float64x2_t)vdupq_n_s64(0xBFE71547652B82FFLL),
                                                    vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FDEC709DC32988BuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xBFD71547651DCE47), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FD277801A1AD442uLL), (float64x2_t)vdupq_n_s64(0xBFCEC73806FD15A2), v22), v22), v22), v22), v22))), vcvtq_f64_s64(vsubq_s64(vshrq_n_s64(v12, 0x34uLL), vcgeq_f64((float64x2_t)vdupq_n_s64(0x3F65555555555555uLL), v10)))), (float64x2_t)vdupq_n_s64(0x3FE62E42FEFA39EFuLL)))));
}

double scalb(double a1, double a2)
{
  if (a2 > 2100.0)
    a2 = 2100.0;
  if (a2 < -2100.0)
    a2 = -2100.0;
  return scalbnl(a1, (int)a2);
}

long double scalblnl(long double __x, uint64_t __y)
{
  unint64_t v2;
  BOOL v3;
  uint64_t v4;
  BOOL v5;

  if (__y < 1024)
  {
    if (__y <= -1023)
    {
      v4 = -2100;
      if (__y > -2100)
        v4 = __y;
      do
      {
        __x = __x * 2.22507386e-308;
        __y = v4 + 1022;
        v5 = __CFADD__(v4, 2044);
        v4 += 1022;
      }
      while (!v5);
    }
  }
  else
  {
    v2 = 2100;
    if (__y < 2100)
      v2 = __y;
    do
    {
      __x = __x * 8.98846567e307;
      __y = v2 - 1023;
      v3 = v2 > 0x7FE;
      v2 -= 1023;
    }
    while (v3);
  }
  return __x * COERCE_DOUBLE((__y << 52) + 0x3FF0000000000000);
}

float scalblnf(float a1, uint64_t a2)
{
  uint64_t v2;

  v2 = 1023;
  if (a2 < 1023)
    v2 = a2;
  if (v2 <= -1022)
    v2 = -1022;
  return a1 * COERCE_DOUBLE((v2 << 52) + 0x3FF0000000000000);
}

simd_float4 _simd_exp_f4(simd_float4 x)
{
  float32x4_t v1;
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int8x16_t v13;
  int32x4_t v14;
  float32x4_t v15;

  v1 = vminq_f32(vmaxq_f32((float32x4_t)x, (float32x4_t)vdupq_n_s32(0xC2CFF1B5)), (float32x4_t)vdupq_n_s32(0x42B17218u));
  v2 = vrndmq_f32(vmulq_f32(v1, (float32x4_t)vdupq_n_s32(0x3FB8AA3Bu)));
  v3 = vmlaq_f32(vmlaq_f32(v1, (float32x4_t)vdupq_n_s32(0xBF318000), v2), (float32x4_t)vdupq_n_s32(0x395E8083u), v2);
  __asm { FMOV            V3.4S, #1.0 }
  v9 = (float32x4_t)vcvtq_s32_f32(v2);
  v10.i64[0] = 0x7F0000007FLL;
  v10.i64[1] = 0x7F0000007FLL;
  v11 = vaddq_s32((int32x4_t)v9, v10);
  v12.i64[0] = 0x100000001;
  v12.i64[1] = 0x100000001;
  v13 = (int8x16_t)vcgtq_s32(v12, v11);
  v14.i64[0] = 0xFE000000FELL;
  v14.i64[1] = 0xFE000000FELL;
  v15 = vmulq_f32(vmlaq_f32(_Q3, v3, vmlaq_f32(_Q3, vmlaq_f32((float32x4_t)vdupq_n_s32(0x3F000001u), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3E2AA92Bu), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3D2AEE9Au), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3C045BFBu), (float32x4_t)vdupq_n_s32(0x3AEA6BC0u), v3), v3), v3), v3), v3)), (float32x4_t)vshlq_n_s32((int32x4_t)vbslq_s8(v13, (int8x16_t)vaddq_s32((int32x4_t)v9, v14), (int8x16_t)v11), 0x17uLL));
  v9.i64[0] = 0x40000000400000;
  v9.i64[1] = 0x40000000400000;
  return (simd_float4)vbslq_s8(v13, (int8x16_t)vmulq_f32(v15, v9), (int8x16_t)v15);
}

long double asinhl(long double __x)
{
  double v1;
  double v2;
  double v3;

  v1 = __x;
  v2 = fabs(__x);
  if (v2 >= 0.0000000074505806)
  {
    if (v2 <= 1.33333333)
    {
      v3 = log1pl(v2 + v2 / (1.0 / v2 + sqrt(1.0 / v2 * (1.0 / v2) + 1.0)));
    }
    else if (v2 <= 134217728.0)
    {
      v3 = logl(v2 + v2 + 1.0 / (v2 + sqrt(v1 * v1 + 1.0)));
    }
    else
    {
      v3 = logl(v2) + 0.693147181;
    }
  }
  else
  {
    if (v1 == 0.0)
      return v1;
    v3 = (v2 * 3.6028797e16 + -2.22507386e-308) * 2.77555756e-17;
  }
  if (v1 >= 0.0)
    return v3;
  else
    return -v3;
}

long double atanhl(long double __x)
{
  double v1;
  double v2;
  double v4;
  double v5;
  double v6;

  v1 = __x;
  v2 = fabs(__x);
  if (v2 > 1.0)
    return sqrt(-v2);
  if (v2 >= 0.0000000074505806)
  {
    v4 = log1pl((v2 + v2) / (1.0 - v2));
    v5 = 0.5;
LABEL_7:
    v6 = v4 * v5;
    if (v1 >= 0.0)
      return v6;
    else
      return -v6;
  }
  if (v1 != 0.0)
  {
    v4 = v2 * 3.6028797e16 + 2.22507386e-308;
    v5 = 2.77555756e-17;
    goto LABEL_7;
  }
  return v1;
}

simd_double2 _simd_sinh_d2(simd_double2 x)
{
  float64x2_t v1;
  int64x2_t v2;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  int8x16_t v6;
  int8x16_t v7;
  uint64_t v8;
  int64x2_t v9;
  int64x2_t v10;
  int64x2_t v11;
  int64x2_t v12;
  int64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  simd_double2 v20;
  uint64_t v21;
  long double v22;
  long double v23;
  long double v25;
  double v26;
  double v27;

  v1 = (float64x2_t)vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL));
  v2 = vcgtq_f64(v1, (float64x2_t)vdupq_n_s64(0x40861D9900000000uLL));
  v3 = vmlaq_f64((float64x2_t)vdupq_n_s64(0x42C8000000000000uLL), (float64x2_t)vdupq_n_s64(0x3FF71547652B82FEuLL), v1);
  v4 = vaddq_f64(v3, (float64x2_t)vdupq_n_s64(0xC2C8000000000000));
  v5 = vmlaq_f64(vmlaq_f64(v1, (float64x2_t)vdupq_n_s64(0xBFE62E42FEFA0000), v4), (float64x2_t)vdupq_n_s64(0xBD7CF79ABC9E3B3ALL), v4);
  v6 = (int8x16_t)vshlq_n_s64((int64x2_t)v3, 0x2DuLL);
  v7 = vandq_s8((int8x16_t)v3, (int8x16_t)vdupq_n_s64(0x7FuLL));
  v8 = v7.i64[1];
  v9 = xmmword_1DEE817E0[v7.i64[0]];
  v10 = xmmword_1DEE817E0[v8];
  v11 = (int64x2_t)vandq_s8(v6, (int8x16_t)vdupq_n_s64(0x7FF0000000000000uLL));
  v12 = vzip1q_s64(v9, v10);
  v13 = vzip2q_s64(v9, v10);
  v14 = (float64x2_t)vaddq_s64(v11, v12);
  v15 = (float64x2_t)vaddq_s64(v11, v13);
  v16 = (float64x2_t)vsubq_s64(v13, v11);
  v17 = vaddq_f64(vsubq_f64(v15, v16), v14);
  v18 = vaddq_f64(vaddq_f64(v15, v16), v14);
  v19 = vmulq_f64(v5, v5);
  v20 = (simd_double2)vorrq_s8(vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x8000000000000000)), (int8x16_t)vaddq_f64(v17, vmlaq_f64(vmulq_f64(vmulq_f64(v19, vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FDFFFFFFFFFFDBDuLL), (float64x2_t)vdupq_n_s64(0x3FA55555CF16D299uLL), v19)), v17), v18, vmlaq_f64(v5, v5, vmulq_f64(v19, vmlaq_f64(
                                             (float64x2_t)vdupq_n_s64(0x3FC55555555554ADuLL),
                                             (float64x2_t)vdupq_n_s64(0x3F8111115712F425uLL),
                                             v19))))));
  v21 = v2.i64[1];
  if ((v2.i64[0] | v2.i64[1]) < 0)
  {
    v25 = x.f64[1];
    if (v2.i64[0])
    {
      v27 = v20.f64[1];
      v22 = sinhl(x.f64[0]);
      v20.f64[1] = v27;
      v20.f64[0] = v22;
    }
    if (v21)
    {
      v26 = v20.f64[0];
      v23 = sinhl(v25);
      v20.f64[0] = v26;
      v20.f64[1] = v23;
    }
  }
  return v20;
}

simd_double2 _simd_cosh_d2(simd_double2 x)
{
  float64x2_t v1;
  int64x2_t v2;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  int8x16_t v6;
  int8x16_t v7;
  uint64_t v8;
  int64x2_t v9;
  int64x2_t v10;
  int64x2_t v11;
  int64x2_t v12;
  int64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  simd_double2 v20;
  uint64_t v21;
  long double v22;
  long double v23;
  long double v25;
  double v26;
  double v27;

  v1 = (float64x2_t)vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL));
  v2 = vcgtq_f64(v1, (float64x2_t)vdupq_n_s64(0x40861D9900000000uLL));
  v3 = vmlaq_f64((float64x2_t)vdupq_n_s64(0x42C8000000000000uLL), (float64x2_t)vdupq_n_s64(0x3FF71547652B82FEuLL), v1);
  v4 = vaddq_f64(v3, (float64x2_t)vdupq_n_s64(0xC2C8000000000000));
  v5 = vmlaq_f64(vmlaq_f64(v1, (float64x2_t)vdupq_n_s64(0xBFE62E42FEFA0000), v4), (float64x2_t)vdupq_n_s64(0xBD7CF79ABC9E3B3ALL), v4);
  v6 = (int8x16_t)vshlq_n_s64((int64x2_t)v3, 0x2DuLL);
  v7 = vandq_s8((int8x16_t)v3, (int8x16_t)vdupq_n_s64(0x7FuLL));
  v8 = v7.i64[1];
  v9 = (int64x2_t)vandq_s8(v6, (int8x16_t)vdupq_n_s64(0x7FF0000000000000uLL));
  v10 = xmmword_1DEE817E0[v7.i64[0]];
  v11 = xmmword_1DEE817E0[v8];
  v12 = vzip1q_s64(v10, v11);
  v13 = vzip2q_s64(v10, v11);
  v14 = (float64x2_t)vaddq_s64(v9, v12);
  v15 = (float64x2_t)vaddq_s64(v9, v13);
  v16 = (float64x2_t)vsubq_s64(v13, v9);
  v17 = vaddq_f64(vsubq_f64(v15, v16), v14);
  v18 = vaddq_f64(vaddq_f64(v15, v16), v14);
  v19 = vmulq_f64(v5, v5);
  v20 = (simd_double2)vaddq_f64(v18, vmlaq_f64(vmulq_f64(vmulq_f64(v19, vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FDFFFFFFFFFFDBDuLL), (float64x2_t)vdupq_n_s64(0x3FA55555CF16D299uLL), v19)), v18), v17, vmlaq_f64(v5, v5, vmulq_f64(v19, vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FC55555555554ADuLL), (float64x2_t)vdupq_n_s64(0x3F8111115712F425uLL),
                                v19)))));
  v21 = v2.i64[1];
  if ((v2.i64[0] | v2.i64[1]) < 0)
  {
    v25 = x.f64[1];
    if (v2.i64[0])
    {
      v27 = v20.f64[1];
      v22 = coshl(x.f64[0]);
      v20.f64[1] = v27;
      v20.f64[0] = v22;
    }
    if (v21)
    {
      v26 = v20.f64[0];
      v23 = coshl(v25);
      v20.f64[0] = v26;
      v20.f64[1] = v23;
    }
  }
  return v20;
}

simd_double2 _simd_tanh_d2(simd_double2 x)
{
  float64x2_t v1;
  simd_double2 v2;
  int8x16_t v9;

  v9 = vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x8000000000000000));
  v1 = (float64x2_t)vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL));
  v2 = _simd_expm1_d2((simd_double2)vminq_f64(vaddq_f64(v1, v1), (float64x2_t)vdupq_n_s64(0x40862E42FEFA39EFuLL)));
  __asm { FMOV            V1.2D, #2.0 }
  return (simd_double2)vorrq_s8(v9, (int8x16_t)vdivq_f64((float64x2_t)v2, vaddq_f64((float64x2_t)v2, _Q1)));
}

double j0(double a1)
{
  double result;
  uint64_t v3;
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
  double v15;

  if (((HIDWORD(a1) >> 20) & 0x7FF) == 0x7FF)
    return 1.0 / (a1 * a1);
  v3 = HIDWORD(*(_QWORD *)&a1) & 0x7FFFFFFFLL;
  v4 = fabs(a1);
  if (v3 >> 30)
  {
    v5 = sinl(v4);
    v6 = cosl(a1);
    v7 = v6 + v5;
    if (v3 >> 21 <= 0x3FE
      && ((v8 = v6, v9 = -cosl(v4 + v4), v8 * v5 >= 0.0) ? (v10 = v9 / v7) : (v10 = v5 - v8, v7 = v9 / v10),
          v3 < 0x48000001))
    {
      v15 = sub_1DEE6FFC8(v4);
      v14 = (v15 * v7 - sub_1DEE700A4(v4) * v10) * 0.564189584;
    }
    else
    {
      v14 = v7 * 0.564189584;
    }
    return v14 / sqrt(v4);
  }
  else if (v4 + 1.0e300 <= 1.0 || v3 >> 21 > 0x1F8)
  {
    v11 = a1 * a1;
    v12 = a1
        * a1
        * (a1 * a1 * (a1 * a1 * (a1 * a1 * -0.00000000461832689 + 0.0000018295405) + -0.000189979294) + 0.015625);
    v13 = a1
        * a1
        * (a1 * a1 * (a1 * a1 * (a1 * a1 * 0.00000000116614003 + 0.00000051354655) + 0.000116926785) + 0.0156191029)
        + 1.0;
    if (v3 >> 20 > 0x3FE)
      return v11 * (v12 / v13) + (v4 * 0.5 + 1.0) * (1.0 - v4 * 0.5);
    else
      return v11 * (v12 / v13 + -0.25) + 1.0;
  }
  else
  {
    result = 1.0;
    if (v3 >> 22 >= 0xF9)
      return v4 * -0.25 * v4 + 1.0;
  }
  return result;
}

double sub_1DEE6FFC8(double a1)
{
  uint64_t v1;
  double *v2;
  double *v3;
  double *v4;
  BOOL v5;
  double *v6;
  double *v7;
  double v8;

  v1 = HIDWORD(*(_QWORD *)&a1) & 0x7FFFFFFFLL;
  v2 = (double *)&unk_1DEE82110;
  v3 = (double *)&unk_1DEE82190;
  if (v1 > 0x4006DB6C)
    v3 = (double *)&unk_1DEE82138;
  v4 = (double *)&unk_1DEE82168;
  if (v1 <= 0x4006DB6C)
    v4 = (double *)&unk_1DEE821C0;
  v5 = v1 > 0x40122E8A;
  if (v1 <= 0x40122E8A)
    v6 = v3;
  else
    v6 = (double *)&unk_1DEE820E0;
  if (!v5)
    v2 = v4;
  if (((HIDWORD(a1) >> 21) & 0x3FF) <= 0x200)
  {
    v7 = v2;
  }
  else
  {
    v6 = (double *)&unk_1DEE82088;
    v7 = (double *)&unk_1DEE820B8;
  }
  v8 = 1.0 / (a1 * a1);
  return (*v6 + v8 * (v6[1] + v8 * (v6[2] + v8 * (v6[3] + v8 * (v6[4] + v8 * v6[5])))))
       / (v8 * (*v7 + v8 * (v7[1] + v8 * (v7[2] + v8 * (v7[3] + v8 * v7[4])))) + 1.0)
       + 1.0;
}

double sub_1DEE700A4(double a1)
{
  uint64_t v1;
  double *v2;
  double *v3;
  double *v4;
  BOOL v5;
  double *v6;
  double *v7;
  double v8;

  v1 = HIDWORD(*(_QWORD *)&a1) & 0x7FFFFFFFLL;
  v2 = (double *)&unk_1DEE82278;
  v3 = (double *)&unk_1DEE82308;
  if (v1 > 0x4006DB6C)
    v3 = (double *)&unk_1DEE822A8;
  v4 = (double *)&unk_1DEE82338;
  if (v1 > 0x4006DB6C)
    v4 = (double *)&unk_1DEE822D8;
  v5 = v1 > 0x40122E8A;
  if (v1 <= 0x40122E8A)
    v6 = v3;
  else
    v6 = (double *)&unk_1DEE82248;
  if (!v5)
    v2 = v4;
  if (((HIDWORD(a1) >> 21) & 0x3FF) <= 0x200)
  {
    v7 = v2;
  }
  else
  {
    v6 = (double *)&unk_1DEE821E8;
    v7 = (double *)&unk_1DEE82218;
  }
  v8 = 1.0 / (a1 * a1);
  return ((*v6 + v8 * (v6[1] + v8 * (v6[2] + v8 * (v6[3] + v8 * (v6[4] + v8 * v6[5])))))
        / (v8 * (*v7 + v8 * (v7[1] + v8 * (v7[2] + v8 * (v7[3] + v8 * (v7[4] + v8 * v7[5]))))) + 1.0)
        + -0.125)
       / a1;
}

double y0(double a1)
{
  uint64_t v3;
  __double2 v4;
  double v5;
  long double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;

  if (((HIDWORD(a1) >> 20) & 0x7FF) == 0x7FF)
    return 1.0 / (a1 + a1 * a1);
  v3 = HIDWORD(*(_QWORD *)&a1) & 0x7FFFFFFFLL;
  if (!(v3 | LODWORD(a1)))
    return -INFINITY;
  if ((*(_QWORD *)&a1 & 0x8000000000000000) != 0)
    return NAN;
  if (v3 >> 30)
  {
    v4 = __sincos_stret(a1);
    v5 = v4.__sinval - v4.__cosval;
    if (v3 >> 21 <= 0x3FE
      && ((v6 = -cosl(a1 + a1), v7 = v6 / (v4.__sinval + v4.__cosval), v8 = v6 / v5, v4.__sinval * v4.__cosval < 0.0)
        ? (v9 = v8)
        : (v5 = v7, v9 = v4.__sinval + v4.__cosval),
          v3 < 0x48000001))
    {
      v14 = sub_1DEE6FFC8(a1);
      v10 = (v9 * sub_1DEE700A4(a1) + v14 * v5) * 0.564189584;
    }
    else
    {
      v10 = v5 * 0.564189584;
    }
    return v10 / sqrt(a1);
  }
  else if (v3 > 0x3E400000)
  {
    v12 = (a1
         * a1
         * (a1
          * a1
          * (a1
           * a1
           * (a1 * a1 * (a1 * a1 * (a1 * a1 * -3.98205194e-11 + 0.0000000195590137) + -0.00000381407054) + 0.000347453432)
           + -0.0138185672)
          + 0.176666453)
         + -0.0738042951)
        / (a1
         * a1
         * (a1 * a1 * (a1 * a1 * (a1 * a1 * 4.41110311e-10 + 0.000000259150852) + 0.0000760068627) + 0.0127304835)
         + 1.0);
    v13 = j0(a1);
    return v12 + logl(a1) * v13 * 0.636619772;
  }
  else
  {
    return logl(a1) * 0.636619772 + -0.0738042951;
  }
}

double j1(double a1)
{
  double result;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if (((HIDWORD(a1) >> 20) & 0x7FF) == 0x7FF)
    return 1.0 / a1;
  v4 = HIDWORD(*(_QWORD *)&a1) & 0x7FFFFFFFLL;
  if (v4 >> 30)
  {
    v5 = fabs(a1);
    v6 = sinl(v5);
    v7 = cosl(a1);
    v8 = v6 - v7;
    if (v4 >> 21 <= 0x3FE)
    {
      v9 = v7;
      v10 = cosl(v5 + v5);
      if (v9 * v6 <= 0.0)
      {
        v11 = v10 / v8;
      }
      else
      {
        v11 = -v6 - v9;
        v8 = v10 / v11;
      }
      if (v4 <= 0x48000000)
      {
        v12 = sub_1DEE70530(v5);
        v8 = v12 * v8 - sub_1DEE7060C(v5) * v11;
      }
    }
    result = v8 * 0.564189584 / sqrt(v5);
    if (a1 < 0.0)
      return -result;
  }
  else if (a1 + 1.0e300 <= 1.0 || v4 >> 22 > 0xF8)
  {
    return a1
         * a1
         * (a1 * a1 * (a1 * a1 * (a1 * a1 * 0.0000000496728 + -0.0000159955631) + 0.00140705667) + -0.0625)
         * a1
         / (a1
          * a1
          * (a1
           * a1
           * (a1 * a1 * (a1 * a1 * (a1 * a1 * 1.23542274e-11 + 0.00000000504636257) + 0.00000117718464) + 0.000185946786)
           + 0.01915376)
          + 1.0)
         + a1 * 0.5;
  }
  else
  {
    return a1 * 0.5;
  }
  return result;
}

double sub_1DEE70530(double a1)
{
  uint64_t v1;
  double *v2;
  double *v3;
  double *v4;
  BOOL v5;
  double *v6;
  double *v7;
  double v8;

  v1 = HIDWORD(*(_QWORD *)&a1) & 0x7FFFFFFFLL;
  v2 = (double *)&unk_1DEE82488;
  v3 = (double *)&unk_1DEE82508;
  if (v1 > 0x4006DB6C)
    v3 = (double *)&unk_1DEE824B0;
  v4 = (double *)&unk_1DEE824E0;
  if (v1 <= 0x4006DB6C)
    v4 = (double *)&unk_1DEE82538;
  v5 = v1 > 0x40122E8A;
  if (v1 <= 0x40122E8A)
    v6 = v3;
  else
    v6 = (double *)&unk_1DEE82458;
  if (!v5)
    v2 = v4;
  if (((HIDWORD(a1) >> 21) & 0x3FF) <= 0x200)
  {
    v7 = v2;
  }
  else
  {
    v6 = (double *)&unk_1DEE82400;
    v7 = (double *)&unk_1DEE82430;
  }
  v8 = 1.0 / (a1 * a1);
  return (*v6 + v8 * (v6[1] + v8 * (v6[2] + v8 * (v6[3] + v8 * (v6[4] + v8 * v6[5])))))
       / (v8 * (*v7 + v8 * (v7[1] + v8 * (v7[2] + v8 * (v7[3] + v8 * v7[4])))) + 1.0)
       + 1.0;
}

double sub_1DEE7060C(double a1)
{
  uint64_t v1;
  double *v2;
  double *v3;
  double *v4;
  BOOL v5;
  double *v6;
  double *v7;
  double v8;

  v1 = HIDWORD(*(_QWORD *)&a1) & 0x7FFFFFFFLL;
  v2 = (double *)&unk_1DEE825F0;
  v3 = (double *)&unk_1DEE82680;
  if (v1 > 0x4006DB6C)
    v3 = (double *)&unk_1DEE82620;
  v4 = (double *)&unk_1DEE826B0;
  if (v1 > 0x4006DB6C)
    v4 = (double *)&unk_1DEE82650;
  v5 = v1 > 0x40122E8A;
  if (v1 <= 0x40122E8A)
    v6 = v3;
  else
    v6 = (double *)&unk_1DEE825C0;
  if (!v5)
    v2 = v4;
  if (((HIDWORD(a1) >> 21) & 0x3FF) <= 0x200)
  {
    v7 = v2;
  }
  else
  {
    v6 = (double *)&unk_1DEE82560;
    v7 = (double *)&unk_1DEE82590;
  }
  v8 = 1.0 / (a1 * a1);
  return ((*v6 + v8 * (v6[1] + v8 * (v6[2] + v8 * (v6[3] + v8 * (v6[4] + v8 * v6[5])))))
        / (v8 * (*v7 + v8 * (v7[1] + v8 * (v7[2] + v8 * (v7[3] + v8 * (v7[4] + v8 * v7[5]))))) + 1.0)
        + 0.375)
       / a1;
}

double y1(double a1)
{
  uint64_t v3;
  __double2 v4;
  double v5;
  long double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;

  if (((HIDWORD(a1) >> 20) & 0x7FF) == 0x7FF)
    return 1.0 / (a1 + a1 * a1);
  v3 = HIDWORD(*(_QWORD *)&a1) & 0x7FFFFFFFLL;
  if (!(v3 | LODWORD(a1)))
    return -INFINITY;
  if ((*(_QWORD *)&a1 & 0x8000000000000000) != 0)
    return NAN;
  if (v3 >> 30)
  {
    v4 = __sincos_stret(a1);
    v5 = -v4.__sinval - v4.__cosval;
    if (v3 >> 21 <= 0x3FE
      && ((v6 = cosl(a1 + a1), v7 = v6 / (v4.__sinval - v4.__cosval), v8 = v6 / v5, v4.__sinval * v4.__cosval > 0.0)
        ? (v9 = v8)
        : (v5 = v7, v9 = v4.__sinval - v4.__cosval),
          v3 < 0x48000001))
    {
      v14 = sub_1DEE70530(a1);
      v10 = (v9 * sub_1DEE7060C(a1) + v14 * v5) * 0.564189584;
    }
    else
    {
      v10 = v5 * 0.564189584;
    }
    return v10 / sqrt(a1);
  }
  else if (v3 > 0x3C900000)
  {
    v12 = (a1
         * a1
         * (a1 * a1 * (a1 * a1 * (a1 * a1 * -0.0000000919099158 + 0.0000235252601) + -0.00191256896) + 0.0504438717)
         + -0.196057091)
        / (a1
         * a1
         * (a1
          * a1
          * (a1 * a1 * (a1 * a1 * (a1 * a1 * 1.66559246e-11 + 0.00000000622741452) + 0.00000135608801) + 0.000202552581)
          + 0.0199167318)
         + 1.0);
    v13 = j1(a1);
    return (-1.0 / a1 + v13 * logl(a1)) * 0.636619772 + a1 * v12;
  }
  else
  {
    return -0.636619772 / a1;
  }
}

double jn(int a1, double a2)
{
  int v2;
  int v4;
  uint64_t v5;
  double result;
  int v7;
  double v8;
  int v9;
  unsigned int v10;
  double v11;
  double v12;
  int v13;
  double v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int i;
  double v21;
  int v22;
  double v23;
  double v24;
  double v25;
  int v26;
  double v27;
  double v28;
  double v29;
  int v30;
  double v31;
  double v32;
  double v33;
  int v34;
  double v35;
  double v36;

  v4 = LODWORD(a2);
  v5 = HIDWORD(*(_QWORD *)&a2) & 0x7FFFFFFFLL;
  if ((v5 | (LODWORD(a2) != 0)) >= 0x7FF00001)
    return a2 + a2;
  if (a1 >= 0)
    v7 = a1;
  else
    v7 = -a1;
  if (a1 >= 0)
    v8 = a2;
  else
    v8 = -a2;
  if (!v7)
    return j0(v8);
  v9 = HIDWORD(a2) ^ a1;
  result = 0.0;
  v10 = v5 >> 20;
  if (v5 >> 20 > 0x7FE || !(v5 | v4))
    goto LABEL_43;
  v11 = fabs(a2);
  if (v11 < (double)v7)
  {
    if (v10 <= 0x3E0)
    {
      if (v7 <= 0x21)
      {
        v12 = 1.0;
        v13 = 1;
        v14 = v11 * 0.5;
        do
        {
          v12 = v12 * (double)++v13;
          v14 = v11 * 0.5 * v14;
        }
        while (v7 != v13);
        result = v14 / v12;
      }
      goto LABEL_43;
    }
    v15 = 2 * v7;
    v16 = (double)(2 * v7) / v11;
    v17 = 2.0 / v11;
    v18 = 2.0 / v11 + v16;
    v19 = v16 * v18 + -1.0;
    for (i = 1; v19 < 1000000000.0; v16 = v21)
    {
      v21 = v19;
      ++i;
      v18 = v17 + v18;
      v19 = -(v16 - v18 * v19);
    }
    v22 = 2 * (i + v7);
    v23 = 0.0;
    do
    {
      v23 = 1.0 / ((double)v22 / v11 - v23);
      v22 -= 2;
    }
    while (v22 >= v15);
    v24 = 1.0;
    if (logl(fabs(v17 * (double)v7)) * (double)v7 >= 709.782713)
    {
      if (v7 >= 2)
      {
        v32 = (double)(v15 - 2);
        v33 = 1.0;
        v34 = v7;
        v27 = v23;
        do
        {
          v24 = v33 * v32 / v11 - v27;
          if (v24 > 1.0e100)
          {
            v33 = v33 / v24;
            v23 = v23 / v24;
            v24 = 1.0;
          }
          v27 = v33;
          v32 = v32 + -2.0;
          --v34;
          v33 = v24;
        }
        while (v34 > 1);
        goto LABEL_40;
      }
    }
    else if (v7 >= 2)
    {
      v25 = (double)(v15 - 2);
      v26 = v7;
      v27 = v23;
      do
      {
        v28 = v27;
        v27 = v24;
        v24 = v24 * v25 / v11 - v28;
        v25 = v25 + -2.0;
        --v26;
      }
      while (v26 > 1);
      goto LABEL_40;
    }
    v27 = v23;
LABEL_40:
    v35 = j0(v11);
    v36 = j1(v11);
    if (fabs(v35) >= fabs(v36))
      result = v23 * v35 / v24;
    else
      result = v23 * v36 / v27;
    goto LABEL_43;
  }
  if (v10 >= 0x52D)
    return j1(v8);
  v29 = j0(v11);
  result = j1(v11);
  v30 = 2;
  do
  {
    v31 = result;
    result = -(v29 - result * ((double)v30 / v11));
    v30 += 2;
    v29 = v31;
    --v2;
  }
  while (v2);
LABEL_43:
  if (v9 <= -1 && (v7 & 1) != 0)
    return -result;
  return result;
}

double yn(int a1, double a2)
{
  uint64_t v3;
  double result;
  int v5;
  int v6;
  double v8;
  int v9;
  unsigned int v10;
  double v11;

  v3 = HIDWORD(*(_QWORD *)&a2) & 0x7FFFFFFFLL;
  if ((v3 | (LODWORD(a2) != 0)) >= 0x7FF00001)
    return a2 + a2;
  if (!(v3 | LODWORD(a2)))
    return -INFINITY;
  if ((*(_QWORD *)&a2 & 0x8000000000000000) != 0)
    return NAN;
  if (a1 >= 0)
    v5 = a1;
  else
    v5 = -a1;
  if (a1 >= 0)
    v6 = 1;
  else
    v6 = 1 - 2 * (a1 & 1);
  if (!v5)
    return y0(a2);
  result = 0.0;
  if ((_DWORD)v3 != 2146435072)
  {
    if (v3 >> 20 < 0x52D)
    {
      v8 = y0(a2);
      result = y1(a2);
      if (v5 >= 2 && (*(_QWORD *)&result & 0xFFFFFFFF00000000) != 0xFFF0000000000000)
      {
        v9 = 2;
        v10 = 2;
        do
        {
          v11 = v8;
          v8 = result;
          result = -(v11 - (double)v9 / a2 * result);
          if (v10 >= v5)
            break;
          ++v10;
          v9 += 2;
        }
        while ((*(_QWORD *)&result & 0xFFFFFFFF00000000) != 0xFFF0000000000000);
      }
      if (v6 <= 0)
        return -result;
    }
    else
    {
      return y1(a2) * (double)v6;
    }
  }
  return result;
}

float nexttowardf(float a1, long double a2)
{
  float v2;
  float result;
  BOOL v4;
  float v5;

  if (a1 < a2)
  {
    v2 = INFINITY;
    return nextafterf(a1, v2);
  }
  if (a1 > a2)
  {
    v2 = -INFINITY;
    return nextafterf(a1, v2);
  }
  v4 = a1 == a2;
  result = a2 + a2;
  v5 = a2;
  if (v4)
    return v5;
  return result;
}

long double tgammal(long double __x)
{
  double v2;
  long double v3;
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  long double v20;
  long double v21;
  double v22;
  double v23;
  long double v24;
  double v25;
  double v26;
  long double v27;
  int8x16_t v28;
  int8x16_t v29;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  long double v36;
  double v37;
  double v38;
  long double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  int8x16_t v63;
  int8x16_t v64;
  double v65;
  double v66;

  if (__x >= 6.0)
  {
    if (__x <= 171.63)
    {
      v20 = 1.0 / (__x * __x);
      v21 = (v20
           * (v20
            * (v20
             * (v20 * (v20 * (v20 * (v20 * -0.0144705562 + 0.00569394463) + -0.00189773526) + 0.00084142856)
              + -0.000595235083)
             + 0.000793650779)
            + -0.00277777778)
           + 0.0833333333)
          / __x;
      v22 = sub_1DEE71850(__x) + -1.0;
      *(_QWORD *)&v23 = COERCE_UNSIGNED_INT64(__x + -0.5) & 0xFFFFFFFFF8000000;
      v24 = __x + -0.5 - v23;
      v25 = v22 * v23;
      v27 = v21 + (__x + -0.5) * v26 + v24 * v22 + -0.00000677929533;
      *(double *)v28.i64 = v25 + v27 + 0.418945312;
      *(double *)v29.i64 = v25 - *(double *)v28.i64;
      return sub_1DEE71730(v28, v27 + *(double *)v29.i64 + 0.418945312, *(double *)v29.i64 + 0.418945312, v29);
    }
    return __x * 8.98846567e307;
  }
  if (__x < 1.06612433)
  {
    if (__x <= 1.0e-17)
    {
      if (__x <= -1.0e-17)
      {
        v50 = fabs(__x);
        if (v50 < INFINITY || v50 > INFINITY)
        {
          v51 = ceil(__x);
          if (v51 == __x)
          {
            return (__x - __x) / 0.0;
          }
          else
          {
            v52 = v51 - __x;
            if (v51 - __x > 0.5)
              v52 = 1.0 - (v51 - __x);
            v53 = v51 * 0.5;
            v54 = ceil(v51 * 0.5);
            if (v51 * 0.5 == v54)
              v9 = -0.0;
            else
              v9 = 0.0;
            if (v52 >= 0.25)
              v55 = cosl((0.5 - v52) * 3.14159265);
            else
              v55 = sinl(v52 * 3.14159265);
            v56 = v55;
            if (__x >= -170.0)
            {
              if (1.0 - (1.0 - __x) == __x)
                v66 = tgammal(1.0 - __x);
              else
                v66 = -(__x * tgammal(-__x));
              if (v53 == v54)
                v66 = -v66;
              return 3.14159265 / (v56 * v66);
            }
            else if (__x >= -190.0)
            {
              v57 = sub_1DEE71644(1.0 - __x);
              v59 = v58;
              v60 = v57 - sub_1DEE71850(3.14159265 / v56);
              v62 = v59 - v61;
              *(double *)v63.i64 = v60 + v62;
              *(double *)v64.i64 = -(v60 + v62);
              v65 = sub_1DEE71730(v64, v62 + v60 - (v60 + v62), v60 - (v60 + v62), v63);
              if (v53 == v54)
                return -v65;
              else
                return v65;
            }
          }
        }
        else
        {
          return __x - __x;
        }
      }
      else
      {
        return 1.0 / __x;
      }
    }
    else
    {
      *(_QWORD *)&v2 = *(_QWORD *)&__x & 0xFFFFFFFFF8000000;
      if (__x >= 0.0661243325)
      {
        v5 = __x - v2;
        v6 = __x + -0.461632145;
        v7 = -0.461632145 - (__x + -0.461632145);
        v8 = __x;
      }
      else
      {
        v3 = (v2 + __x) * (__x - v2);
        v4 = v2 * v2;
        *(_QWORD *)&v2 = COERCE_UNSIGNED_INT64(v2 * v2 + __x) & 0xFFFFFFFFF8000000;
        v5 = v3 + v4 + __x - v2;
        v6 = __x + 0.538367855;
        v7 = 0.538367855 - (__x + 0.538367855);
        v8 = v5 + v2;
      }
      v34 = (v6 * (v6 * (v6 * (v6 * 0.0024065995 + 0.00138456698) + 0.00553859446) + 0.265757199) + 0.621389572)
          / (v6
           * (v6
            * (v6
             * (v6
              * (v6 * (v6 * (v6 * (v6 * 0.00000613275507 + 0.0000935021024) + -0.00176012741) + 0.00512449348)
               + 0.0307878176)
              + -0.146734132)
             + -0.207474562)
            + 1.06258522)
           + 1.45019531);
      *(_QWORD *)&v35 = *(_QWORD *)&v6 & 0xFFFFFFFFF8000000;
      v36 = (v6 + COERCE_DOUBLE(*(_QWORD *)&v6 & 0xFFFFFFFFF8000000))
          * (v7 + __x + v6 - COERCE_DOUBLE(*(_QWORD *)&v6 & 0xFFFFFFFFF8000000));
      v37 = v35 * v35;
      *(_QWORD *)&v38 = COERCE_UNSIGNED_INT64(v35 * v35) & 0xFFFFFFFFF8000000;
      v39 = (v34 - COERCE_DOUBLE(*(_QWORD *)&v34 & 0xFFFFFFFFF8000000)) * v38
          + (v36 + v37 - v38) * v34
          + -4.99642704e-17;
      v40 = v38 * COERCE_DOUBLE(*(_QWORD *)&v34 & 0xFFFFFFFFF8000000);
      *(_QWORD *)&v41 = COERCE_UNSIGNED_INT64(v40 + 0.885603194) & 0xFFFFFFFFF8000000;
      return (v39
            + v40
            + 0.885603194
            - v41
            + v41
            - COERCE_DOUBLE(COERCE_UNSIGNED_INT64(v41 / v8) & 0xFFFFFFFFF8000000) * v2
            - COERCE_DOUBLE(COERCE_UNSIGNED_INT64(v41 / v8) & 0xFFFFFFFFF8000000) * v5)
           / v8
           + COERCE_DOUBLE(COERCE_UNSIGNED_INT64(v41 / v8) & 0xFFFFFFFFF8000000);
    }
    return v9;
  }
  v10 = __x + -1.0;
  if (__x + -1.0 <= 1.06612433)
  {
    v31 = v10 + -0.461632145;
    v32 = (v31 * (v31 * (v31 * (v31 * 0.0024065995 + 0.00138456698) + 0.00553859446) + 0.265757199) + 0.621389572)
        / (v31
         * (v31
          * (v31
           * (v31
            * (v31 * (v31 * (v31 * (v31 * 0.00000613275507 + 0.0000935021024) + -0.00176012741) + 0.00512449348)
             + 0.0307878176)
            + -0.146734132)
           + -0.207474562)
          + 1.06258522)
         + 1.45019531);
    v33 = COERCE_DOUBLE(*(_QWORD *)&v31 & 0xFFFFFFFFF8000000) * COERCE_DOUBLE(*(_QWORD *)&v31 & 0xFFFFFFFFF8000000);
    return (v32 - COERCE_DOUBLE(*(_QWORD *)&v32 & 0xFFFFFFFFF8000000))
         * COERCE_DOUBLE(*(_QWORD *)&v33 & 0xFFFFFFFFF8000000)
         + ((v31 + COERCE_DOUBLE(*(_QWORD *)&v31 & 0xFFFFFFFFF8000000))
          * (v31 - COERCE_DOUBLE(*(_QWORD *)&v31 & 0xFFFFFFFFF8000000))
          + v33
          - COERCE_DOUBLE(*(_QWORD *)&v33 & 0xFFFFFFFFF8000000))
         * v32
         + -4.99642704e-17
         + COERCE_DOUBLE(*(_QWORD *)&v33 & 0xFFFFFFFFF8000000) * COERCE_DOUBLE(*(_QWORD *)&v32 & 0xFFFFFFFFF8000000)
         + 0.885603194
         - COERCE_DOUBLE(COERCE_UNSIGNED_INT64(COERCE_DOUBLE(*(_QWORD *)&v33 & 0xFFFFFFFFF8000000)* COERCE_DOUBLE(*(_QWORD *)&v32 & 0xFFFFFFFFF8000000)+ 0.885603194) & 0xFFFFFFFFF8000000)+ COERCE_DOUBLE(COERCE_UNSIGNED_INT64(COERCE_DOUBLE(*(_QWORD *)&v33 & 0xFFFFFFFFF8000000)* COERCE_DOUBLE(*(_QWORD *)&v32 & 0xFFFFFFFFF8000000)+ 0.885603194) & 0xFFFFFFFFF8000000);
  }
  v11 = v10 + -1.0;
  *(_QWORD *)&v12 = *(_QWORD *)&v10 & 0xFFFFFFFFF8000000;
  v13 = v12 + -1.0;
  v14 = v11 - (v12 + -1.0);
  v15 = v11 + -1.0;
  if (v11 + -1.0 <= 0.0661243325)
  {
    v16 = v11 - (v12 + -1.0);
    v17 = v11;
  }
  else
  {
    v16 = v11 - (v12 + -1.0);
    do
    {
      v17 = v15;
      v18 = v12 * v13;
      v19 = v11 * v16 + v12 * v14;
      *(_QWORD *)&v12 = COERCE_UNSIGNED_INT64(v12 * v13) & 0xFFFFFFFFF8000000;
      v16 = v19 + v18 - v12;
      v13 = v13 + -1.0;
      v15 = v17 + -1.0;
      v11 = v17;
    }
    while (v17 + -1.0 > 0.0661243325);
  }
  v42 = ((v17 + -0.461632145)
       * ((v17 + -0.461632145)
        * ((v17 + -0.461632145) * ((v17 + -0.461632145) * 0.0024065995 + 0.00138456698) + 0.00553859446)
        + 0.265757199)
       + 0.621389572)
      / ((v17 + -0.461632145)
       * ((v17 + -0.461632145)
        * ((v17 + -0.461632145)
         * ((v17 + -0.461632145)
          * ((v17 + -0.461632145)
           * ((v17 + -0.461632145)
            * ((v17 + -0.461632145) * ((v17 + -0.461632145) * 0.00000613275507 + 0.0000935021024) + -0.00176012741)
            + 0.00512449348)
           + 0.0307878176)
          + -0.146734132)
         + -0.207474562)
        + 1.06258522)
       + 1.45019531);
  *(_QWORD *)&v43 = COERCE_UNSIGNED_INT64(v17 + -0.461632145) & 0xFFFFFFFFF8000000;
  v44 = (v17 + -0.461632145 + v43) * (v17 + -0.461632145 - v43);
  v45 = v43 * v43;
  *(_QWORD *)&v46 = *(_QWORD *)&v45 & 0xFFFFFFFFF8000000;
  v47 = v44 + v45 - COERCE_DOUBLE(*(_QWORD *)&v45 & 0xFFFFFFFFF8000000);
  *(_QWORD *)&v48 = *(_QWORD *)&v42 & 0xFFFFFFFFF8000000;
  v49 = (v42 - COERCE_DOUBLE(*(_QWORD *)&v42 & 0xFFFFFFFFF8000000)) * v46 + v47 * v42 + -4.99642704e-17;
  return v12
       * (v49
        + v46 * v48
        + 0.885603194
        - COERCE_DOUBLE(COERCE_UNSIGNED_INT64(v46 * v48 + 0.885603194) & 0xFFFFFFFFF8000000))
       + v16
       * (v49
        + v46 * v48
        + 0.885603194
        - COERCE_DOUBLE(COERCE_UNSIGNED_INT64(v46 * v48 + 0.885603194) & 0xFFFFFFFFF8000000)
        + COERCE_DOUBLE(COERCE_UNSIGNED_INT64(v46 * v48 + 0.885603194) & 0xFFFFFFFFF8000000))
       + COERCE_DOUBLE(COERCE_UNSIGNED_INT64(v46 * v48 + 0.885603194) & 0xFFFFFFFFF8000000) * v12;
}

long double sub_1DEE71644(long double a1)
{
  long double v2;
  long double v3;
  double v4;
  double v5;

  v2 = 1.0 / (a1 * a1);
  v3 = (v2
      * (v2
       * (v2
        * (v2 * (v2 * (v2 * (v2 * -0.0144705562 + 0.00569394463) + -0.00189773526) + 0.00084142856) + -0.000595235083)
        + 0.000793650779)
       + -0.00277777778)
      + 0.0833333333)
     / a1;
  v4 = sub_1DEE71850(a1);
  return (v4 + -1.0) * COERCE_DOUBLE(COERCE_UNSIGNED_INT64(a1 + -0.5) & 0xFFFFFFFFF8000000)
       + v3
       + (a1 + -0.5) * v5
       + (a1 + -0.5 - COERCE_DOUBLE(COERCE_UNSIGNED_INT64(a1 + -0.5) & 0xFFFFFFFFF8000000)) * (v4 + -1.0)
       + -0.00000677929533
       + 0.418945312;
}

double sub_1DEE71730(int8x16_t a1, double a2, double a3, int8x16_t a4)
{
  double v4;
  float64x2_t v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (*(double *)a1.i64 <= 716.021038)
  {
    if (*(double *)a1.i64 >= -751.371544)
    {
      a4.i64[0] = 0.5;
      v5.f64[0] = NAN;
      v5.f64[1] = NAN;
      v6 = (int)(*(double *)a1.i64 * 1.44269504 + *(double *)vbslq_s8((int8x16_t)vnegq_f64(v5), a4, a1).i64);
      v7 = *(double *)a1.i64 + (double)v6 * -0.69314718;
      v8 = -(a2 - (double)v6 * 1.90821493e-10);
      v9 = v7 - v8;
      v10 = v9
          - v9
          * v9
          * (v9
           * v9
           * (v9 * v9 * (v9 * v9 * (v9 * v9 * 0.000000041381368 + -0.00000165339022) + 0.0000661375632) + -0.00277777778)
           + 0.166666667);
      *(double *)a1.i64 = scalbnl(v7 - (v8 - (v7 - v8) * v10 / (2.0 - v10)) + 1.0, v6);
    }
    else
    {
      v4 = fabs(*(double *)a1.i64);
      a1.i64[0] = 0;
      if (v4 != INFINITY)
        *(double *)a1.i64 = scalbnl(1.0, -5000);
    }
  }
  else if (fabs(*(double *)a1.i64) != INFINITY)
  {
    *(double *)a1.i64 = scalbnl(1.0, 5000);
  }
  return *(double *)a1.i64;
}

double sub_1DEE71850(long double a1)
{
  int v2;
  long double v3;
  long double v4;
  long double v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double result;

  v2 = (int)logbl(a1);
  v3 = scalbnl(a1, -v2);
  v4 = v3;
  if (v2 == -1022)
  {
    v5 = logbl(v3);
    v2 = (int)v5 - 1022;
    v4 = scalbnl(v4, -(int)v5);
  }
  v6 = (int)((v4 + -1.0) * 128.0 + 0.5);
  v7 = (double)v6 * 0.0078125 + 1.0;
  v8 = v4 - v7;
  v9 = 1.0 / (v4 - v7 + v7 * 2.0);
  v10 = (v8 + v8) * v9;
  v11 = v10 + 513.0;
  v12 = v10 * v10;
  v13 = v10 * (v10 * v10);
  *(_QWORD *)&v14 = *(_QWORD *)&v10 & 0xFFFFFFFFF8000000;
  v15 = v11 + -513.0;
  if (v2 | v6)
    v14 = v15;
  *(_QWORD *)&result = COERCE_UNSIGNED_INT64(v14+ dbl_1DEE82870[v6]+ (double)v2 * 0.693147181+ v13 * (v12 * (v12 * (v12 * 0.000434887778 + 0.00223213999) + 0.0125) + 0.0833333333)+ dbl_1DEE82C78[v6]+ v9 * ((v8 - v7 * v14) * 2.0 - v14 * v8)+ (double)v2 * -1.72394445e-13) & 0xFFFFFFFFF8000000;
  return result;
}

float tgammaf(float a1)
{
  return tgammal(a1);
}

unsigned __int16 __ceilf16@<H0>(int8x16_t _Q0@<Q0>, int8x16_t a2@<Q1>)
{
  unsigned __int32 v2;
  int v3;
  int v4;
  int8x16_t v9;

  v2 = ((unsigned __int32)_Q0.i32[0] >> 10) & 0x1F;
  if (v2 - 15 > 9)
  {
    if (v2 > 0xE)
    {
      __asm { FCVT            S0, H0 }
      *(float *)_Q0.i32 = _S0 + 0.0;
      __asm { FCVT            H0, S0 }
    }
    else if (_Q0.i16[0] <= 0)
    {
      a2.i32[0] = 0;
      __asm { FCVT            S0, H0 }
      v9.i64[0] = 0x8000000080000000;
      v9.i64[1] = 0x8000000080000000;
      _Q0.i32[0] = vbslq_s8(v9, a2, _Q0).u32[0];
      __asm { FCVT            H0, S0 }
    }
    else
    {
      _Q0.i16[0] = 15360;
    }
  }
  else
  {
    v3 = 1 << (25 - v2);
    v4 = v3 - 1;
    if (_Q0.i16[0] < 0)
      v4 = 0;
    _Q0.i32[0] = (v4 + _Q0.i16[0]) & -v3;
  }
  return _Q0.i16[0];
}

simd_double2 _simd_sin_d2(simd_double2 x)
{
  float64x2_t v1;
  int8x16_t v2;
  float64x2_t v3;
  int64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  int8x16_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  simd_double2 v12;
  float64x2_t v13;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v25;
  float64x2_t v26;
  int8x16_t v27;
  int8x16_t v28;
  int8x16_t v29;
  int8x16_t v30;

  v1 = (float64x2_t)vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL));
  v2 = vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x8000000000000000));
  v3 = (float64x2_t)vdupq_n_s64(0x4160000000000000uLL);
  v4 = vcgeq_f64(v1, v3);
  v5 = (float64x2_t)vdupq_n_s64(0x4338000000000000uLL);
  v6 = vmlaq_f64(v5, (float64x2_t)vdupq_n_s64(0x3FD45F306DC9C883uLL), v1);
  v7 = (int8x16_t)vshlq_n_s64((int64x2_t)v6, 0x3FuLL);
  v8 = (float64x2_t)vdupq_n_s64(0xC338000000000000);
  v9 = vaddq_f64(v6, v8);
  v10 = (float64x2_t)veorq_s8(v7, (int8x16_t)vmlaq_f64(vmlaq_f64(vmlaq_f64(v1, (float64x2_t)vdupq_n_s64(0xC00921FB54442D18), v9), (float64x2_t)vdupq_n_s64(0xBCA1A62633145C06), v9), (float64x2_t)vdupq_n_s64(0xB95C1CD129024E09), v9));
  v11 = vmulq_f64(v10, v10);
  v12 = (simd_double2)veorq_s8(v2, (int8x16_t)vmlaq_f64(v10, vmlaq_f64((float64x2_t)vdupq_n_s64(0xBFC55555555554A8), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3F8111111110A573uLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xBF2A01A019A659DDLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3EC71DE3806ADD1AuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xBE5AE6355AAA4A53), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3DE60E6BEE01D83EuLL), (float64x2_t)vdupq_n_s64(0xBD69F1517E9F65F0), v11), v11), v11),
                                           v11),
                                         v11),
                                       v11),
                                     vmulq_f64(v11, v10)));
  if ((vorrq_s8((int8x16_t)vdupq_laneq_s64(v4, 1), (int8x16_t)v4).u64[0] & 0x8000000000000000) != 0)
  {
    v30 = 0uLL;
    v27 = (int8x16_t)v4;
    v28 = v2;
    v29 = (int8x16_t)v12;
    v25 = v5;
    v26 = v8;
    v13.f64[0] = sub_1DEE71D64(&v30, (uint64x2_t)vorrq_s8(vandq_s8((int8x16_t)v1, (int8x16_t)v4), vbicq_s8((int8x16_t)v3, (int8x16_t)v4)));
    __asm
    {
      FMOV            V3.2D, #1.0
      FMOV            V2.2D, #0.5
    }
    v20 = vmulq_f64(vaddq_f64(v13, (float64x2_t)vbicq_s8(_Q3, (int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v30, (int8x16_t)vdupq_n_s64(1uLL))))), _Q2);
    v21 = vaddq_f64(v20, v25);
    v22 = (float64x2_t)veorq_s8((int8x16_t)vshlq_n_s64((int64x2_t)vsraq_n_u64((uint64x2_t)v21, (uint64x2_t)v30, 1uLL), 0x3FuLL), (int8x16_t)vsubq_f64(v20, vaddq_f64(v21, v26)));
    v23 = vmulq_f64(v22, v22);
    return (simd_double2)vorrq_s8(vandq_s8(veorq_s8(v28, (int8x16_t)vmulq_f64(vmlaq_f64((float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xC014ABBCE625BE52), vmlaq_f64((float64x2_t)vdupq_n_s64(0x400466BC6775AA7DuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xBFE32D2CCE627C9ELL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FB50783485523F5uLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xBF7E3074DFB5BB7ELL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3F3E8F3677C34BAAuLL), vmlaq_f64(
                                                            (float64x2_t)vdupq_n_s64(0xBEF6F7AD23B8333CLL),
                                                            (float64x2_t)vdupq_n_s64(0x3EA9D46B06FC620DuLL),
                                                            v23),
                                                          v23),
                                                        v23),
                                                      v23),
                                                    v23),
                                                  v23),
                                                v23),
                                              v23),
                                            v22)),
                             v27),
                           vbicq_s8(v29, v27));
  }
  return v12;
}

double sub_1DEE71D64(int8x16_t *a1, uint64x2_t a2)
{
  int64x2_t v2;
  int64x2_t v3;
  float64x2_t v4;
  int8x16_t v5;
  int64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64_t *v10;
  float64_t *v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  double result;

  v2 = (int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64(a2, 0x34uLL), (int8x16_t)vdupq_n_s64(0x7FFuLL));
  v3 = vshrq_n_s64((int64x2_t)vmlal_u32((uint64x2_t)vdupq_n_s64(0xFFFFFFFFFFD9D718), (uint32x2_t)vmovn_s64(v2), (uint32x2_t)vdup_n_s32(0x97Cu)), 0x10uLL);
  v4 = (float64x2_t)vshlq_n_s64(v3, 2uLL);
  v3.i64[0] *= 27;
  v3.i64[1] *= 27;
  v5.i64[0] = 0xFFFFLL;
  v5.i64[1] = 0xFFFFLL;
  v6 = (int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)vaddq_s64(vsubq_s64(v3, v2), vdupq_n_s64(0x420uLL)), 3uLL), v5);
  v7 = vmulq_f64((float64x2_t)a2, (float64x2_t)vdupq_n_s64(0x26F0000000000000uLL));
  v8 = (float64x2_t)vandq_s8((int8x16_t)vaddq_s64((int64x2_t)v7, vdupq_n_s64(0x4000000uLL)), (int8x16_t)vdupq_n_s64(0xFFFFFFFFF8000000));
  v9 = (float64x2_t)vaddq_s64(v6, (int64x2_t)v4);
  v10 = (float64_t *)((char *)&unk_1DEE830A0 + 8 * *(_QWORD *)&v9.f64[0]);
  v9.f64[0] = *v10;
  v11 = (float64_t *)((char *)&unk_1DEE830A0 + 8 * *(_QWORD *)&v9.f64[1]);
  v9.f64[1] = *v11;
  v4.f64[0] = v10[4];
  v4.f64[1] = v11[4];
  v12 = vsubq_f64(v7, v8);
  v13.f64[0] = v10[8];
  v13.f64[1] = v11[8];
  v14.f64[0] = v10[12];
  v14.f64[1] = v11[12];
  v15 = vmlaq_f64(vmulq_f64(v4, v8), v9, v12);
  v16 = vmlaq_f64(vmulq_f64(v13, v8), v4, v12);
  v17 = vaddq_f64(vaddq_f64(v15, v16), (float64x2_t)vdupq_n_s64(0x4338000000000000uLL));
  *a1 = vandq_s8((int8x16_t)v17, (int8x16_t)vdupq_n_s64(3uLL));
  v18 = vaddq_f64(v17, (float64x2_t)vdupq_n_s64(0xC338000000000000));
  v17.f64[0] = v10[16];
  v17.f64[1] = v11[16];
  v19.f64[0] = v10[20];
  v19.f64[1] = v11[20];
  v20.f64[0] = v10[24];
  v20.f64[1] = v11[24];
  v21 = vsubq_f64(v15, v18);
  v22 = vaddq_f64(v16, v21);
  v23 = vaddq_f64(v16, vsubq_f64(v21, v22));
  v24 = vmlaq_f64(vmulq_f64(v14, v8), v13, v12);
  v25 = vaddq_f64(v24, v22);
  v26 = vaddq_f64(v23, vaddq_f64(v24, vsubq_f64(v22, v25)));
  v27 = vmlaq_f64(vmulq_f64(v17, v8), v14, v12);
  v28 = vaddq_f64(v27, v25);
  v29 = vaddq_f64(v26, vaddq_f64(v27, vsubq_f64(v25, v28)));
  v30 = vmlaq_f64(vmulq_f64(v19, v8), v17, v12);
  v31 = vaddq_f64(v28, v30);
  v32 = vaddq_f64(v29, vaddq_f64(v30, vsubq_f64(v28, v31)));
  v33 = vmlaq_f64(vmulq_f64(v20, v8), v19, v12);
  v34 = vaddq_f64(v31, v33);
  *(_QWORD *)&result = *(_OWORD *)&vaddq_f64(v34, vaddq_f64(v32, vaddq_f64(v33, vsubq_f64(v31, v34))));
  return result;
}

simd_double2 _simd_cos_d2(simd_double2 x)
{
  float64x2_t v1;
  float64x2_t v2;
  int64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  int8x16_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  simd_double2 v17;
  float64x2_t v18;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v26;
  float64x2_t v27;
  int8x16_t v28;
  int8x16_t v29;
  int8x16_t v30;

  v1 = (float64x2_t)vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL));
  v2 = (float64x2_t)vdupq_n_s64(0x4160000000000000uLL);
  v3 = vcgeq_f64(v1, v2);
  v4 = (float64x2_t)vdupq_n_s64(0x4338000000000000uLL);
  v5 = vmlaq_f64(v4, (float64x2_t)vdupq_n_s64(0x3FD45F306DC9C883uLL), vaddq_f64(v1, (float64x2_t)vdupq_n_s64(0x3FF921FB54442D18uLL)));
  v6 = (int8x16_t)vshlq_n_s64((int64x2_t)v5, 0x3FuLL);
  v7 = (float64x2_t)vdupq_n_s64(0xC338000000000000);
  v8 = vaddq_f64(v5, v7);
  __asm { FMOV            V4.2D, #-0.5 }
  v14 = vaddq_f64(v8, _Q4);
  v15 = (float64x2_t)veorq_s8(v6, (int8x16_t)vmlaq_f64(vmlaq_f64(vmlaq_f64(v1, (float64x2_t)vdupq_n_s64(0xC00921FB54442D18), v14), (float64x2_t)vdupq_n_s64(0xBCA1A62633145C06), v14), (float64x2_t)vdupq_n_s64(0xB95C1CD129024E09), v14));
  v16 = vmulq_f64(v15, v15);
  v17 = (simd_double2)vmlaq_f64(v15, vmlaq_f64((float64x2_t)vdupq_n_s64(0xBFC55555555554A8), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3F8111111110A573uLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xBF2A01A019A659DDLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3EC71DE3806ADD1AuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xBE5AE6355AAA4A53), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3DE60E6BEE01D83EuLL), (float64x2_t)vdupq_n_s64(0xBD69F1517E9F65F0), v16), v16), v16), v16), v16),
                          v16),
                        vmulq_f64(v16, v15));
  if ((vorrq_s8((int8x16_t)vdupq_laneq_s64(v3, 1), (int8x16_t)v3).u64[0] & 0x8000000000000000) != 0)
  {
    v30 = 0uLL;
    v28 = (int8x16_t)v3;
    v29 = (int8x16_t)v17;
    v26 = v4;
    v27 = v7;
    v18.f64[0] = sub_1DEE71D64(&v30, (uint64x2_t)vorrq_s8(vandq_s8((int8x16_t)v1, (int8x16_t)v3), vbicq_s8((int8x16_t)v2, (int8x16_t)v3)));
    __asm
    {
      FMOV            V3.2D, #1.0
      FMOV            V1.2D, #0.5
    }
    v21 = vmulq_f64(vsubq_f64(v18, (float64x2_t)vandq_s8((int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v30, (int8x16_t)vdupq_n_s64(1uLL))), _Q3)), _Q1);
    v22 = vaddq_f64(v21, v26);
    v23 = (float64x2_t)veorq_s8((int8x16_t)vshlq_n_s64((int64x2_t)vsraq_n_u64((uint64x2_t)v22, (uint64x2_t)v30, 1uLL), 0x3FuLL), (int8x16_t)vsubq_f64(vaddq_f64(v22, v27), v21));
    v24 = vmulq_f64(v23, v23);
    return (simd_double2)vorrq_s8(vandq_s8((int8x16_t)vmulq_f64(vmlaq_f64((float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xC014ABBCE625BE52), vmlaq_f64((float64x2_t)vdupq_n_s64(0x400466BC6775AA7DuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xBFE32D2CCE627C9ELL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FB50783485523F5uLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xBF7E3074DFB5BB7ELL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3F3E8F3677C34BAAuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xBEF6F7AD23B8333CLL), (float64x2_t)vdupq_n_s64(0x3EA9D46B06FC620DuLL),
                                                          v24),
                                                        v24),
                                                      v24),
                                                    v24),
                                                  v24),
                                                v24),
                                              v24),
                                            v24),
                                          v23),
                             v28),
                           vbicq_s8(v29, v28));
  }
  return v17;
}

void _simd_sincos_d2(simd_double2 x, simd_double2 *sinp, simd_double2 *cosp)
{
  float64x2_t v5;
  int8x16_t v6;
  float64x2_t v7;
  int64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  int8x16_t v13;
  int8x16_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  simd_double2 v37;
  simd_double2 v38;
  float64x2_t v39;
  int64x2_t v40;
  float64x2_t v43;
  int64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  float64x2_t v47;
  float64x2_t v48;
  float64x2_t v49;
  float64x2_t v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t v56;
  float64x2_t v57;
  float64x2_t v58;
  int8x16_t v59;
  float64x2_t v60;
  int8x16_t v61;
  float64x2_t v62;
  float64x2_t v63;
  float64x2_t v64;
  int8x16_t v65;
  int8x16_t v66;
  int8x16_t v67;
  int8x16_t v68;
  int8x16_t v69;

  v5 = (float64x2_t)vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL));
  v6 = vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x8000000000000000));
  v7 = (float64x2_t)vdupq_n_s64(0x4160000000000000uLL);
  v8 = vcgeq_f64(v5, v7);
  v9 = (float64x2_t)vdupq_n_s64(0x3FD45F306DC9C883uLL);
  v10 = (float64x2_t)vdupq_n_s64(0x4338000000000000uLL);
  v11 = vmlaq_f64(v10, v9, v5);
  v12 = vmlaq_f64(v10, v9, vaddq_f64(v5, (float64x2_t)vdupq_n_s64(0x3FF921FB54442D18uLL)));
  v13 = (int8x16_t)vshlq_n_s64((int64x2_t)v11, 0x3FuLL);
  v14 = (int8x16_t)vshlq_n_s64((int64x2_t)v12, 0x3FuLL);
  v15 = (float64x2_t)vdupq_n_s64(0xC338000000000000);
  v16 = vaddq_f64(v11, v15);
  __asm { FMOV            V6.2D, #-0.5 }
  v22 = vaddq_f64(vaddq_f64(v12, v15), _Q6);
  v23 = (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL);
  v24 = (float64x2_t)vdupq_n_s64(0x3CA1A62633145C06uLL);
  v25 = (float64x2_t)vdupq_n_s64(0x395C1CD129024E09uLL);
  v26 = (float64x2_t)veorq_s8(v13, (int8x16_t)vmlsq_f64(vmlsq_f64(vmlsq_f64(v5, v23, v16), v24, v16), v25, v16));
  v27 = (float64x2_t)veorq_s8(v14, (int8x16_t)vmlsq_f64(vmlsq_f64(vmlsq_f64(v5, v23, v22), v24, v22), v25, v22));
  v28 = vmulq_f64(v26, v26);
  v29 = vmulq_f64(v27, v27);
  v30 = (float64x2_t)vdupq_n_s64(0xBD69F1517E9F65F0);
  v31 = (float64x2_t)vdupq_n_s64(0x3DE60E6BEE01D83EuLL);
  v32 = (float64x2_t)vdupq_n_s64(0xBE5AE6355AAA4A53);
  v33 = (float64x2_t)vdupq_n_s64(0x3EC71DE3806ADD1AuLL);
  v34 = (float64x2_t)vdupq_n_s64(0xBF2A01A019A659DDLL);
  v35 = (float64x2_t)vdupq_n_s64(0x3F8111111110A573uLL);
  v36 = (float64x2_t)vdupq_n_s64(0xBFC55555555554A8);
  v37 = (simd_double2)vmlaq_f64(v27, vmlaq_f64(v36, vmlaq_f64(v35, vmlaq_f64(v34, vmlaq_f64(v33, vmlaq_f64(v32, vmlaq_f64(v31, v30, v29), v29), v29), v29), v29), v29), vmulq_f64(v29, v27));
  v38 = (simd_double2)veorq_s8(v6, (int8x16_t)vmlaq_f64(v26, vmlaq_f64(v36, vmlaq_f64(v35, vmlaq_f64(v34, vmlaq_f64(v33, vmlaq_f64(v32, vmlaq_f64(v31, v30, v28), v28), v28), v28), v28), v28), vmulq_f64(v28, v26)));
  if ((vorrq_s8((int8x16_t)vdupq_laneq_s64(v8, 1), (int8x16_t)v8).u64[0] & 0x8000000000000000) != 0)
  {
    v69 = 0uLL;
    v67 = v6;
    v66 = (int8x16_t)v8;
    v64 = v23;
    v68 = (int8x16_t)v37;
    v62 = v10;
    v63 = v15;
    v65 = (int8x16_t)v38;
    v39.f64[0] = sub_1DEE71D64(&v69, (uint64x2_t)vorrq_s8(vandq_s8((int8x16_t)v5, (int8x16_t)v8), vbicq_s8((int8x16_t)v7, (int8x16_t)v8)));
    v40 = (int64x2_t)vandq_s8(v69, (int8x16_t)vdupq_n_s64(1uLL));
    __asm
    {
      FMOV            V4.2D, #1.0
      FMOV            V5.2D, #0.5
    }
    v43 = vmulq_f64(vaddq_f64(v39, (float64x2_t)vbicq_s8(_Q4, (int8x16_t)vceqzq_s64(v40))), _Q5);
    v44.i64[0] = -1;
    v44.i64[1] = -1;
    v45 = vmulq_f64(vsubq_f64(v39, (float64x2_t)vandq_s8((int8x16_t)vaddq_s64(v40, v44), _Q4)), _Q5);
    v46 = vaddq_f64(v43, v62);
    v47 = vaddq_f64(v45, v62);
    v48 = (float64x2_t)veorq_s8((int8x16_t)vshlq_n_s64(vsraq_n_s64((int64x2_t)v46, (int64x2_t)v69, 1uLL), 0x3FuLL), (int8x16_t)vsubq_f64(v43, vaddq_f64(v46, v63)));
    v49 = (float64x2_t)veorq_s8((int8x16_t)vshlq_n_s64(vsraq_n_s64((int64x2_t)v47, (int64x2_t)v69, 1uLL), 0x3FuLL), (int8x16_t)vsubq_f64(vaddq_f64(v47, v63), v45));
    v50 = vmulq_f64(v48, v48);
    v51 = (float64x2_t)vdupq_n_s64(0x3EA9D46B06FC620DuLL);
    v52 = (float64x2_t)vdupq_n_s64(0xBEF6F7AD23B8333CLL);
    v53 = (float64x2_t)vdupq_n_s64(0x3F3E8F3677C34BAAuLL);
    v54 = (float64x2_t)vdupq_n_s64(0xBF7E3074DFB5BB7ELL);
    v55 = (float64x2_t)vdupq_n_s64(0x3FB50783485523F5uLL);
    v56 = (float64x2_t)vdupq_n_s64(0xBFE32D2CCE627C9ELL);
    v57 = (float64x2_t)vdupq_n_s64(0x400466BC6775AA7DuLL);
    v58 = (float64x2_t)vdupq_n_s64(0xC014ABBCE625BE52);
    v59 = (int8x16_t)vmulq_f64(vmlaq_f64(v64, vmlaq_f64(v58, vmlaq_f64(v57, vmlaq_f64(v56, vmlaq_f64(v55, vmlaq_f64(v54, vmlaq_f64(v53, vmlaq_f64(v52, v51, v50), v50), v50), v50), v50), v50), v50), v50), v48);
    v60 = vmulq_f64(v49, v49);
    v61 = (int8x16_t)vmulq_f64(vmlaq_f64(v64, vmlaq_f64(v58, vmlaq_f64(v57, vmlaq_f64(v56, vmlaq_f64(v55, vmlaq_f64(v54, vmlaq_f64(v53, vmlaq_f64(v52, v51, v60), v60), v60), v60), v60), v60), v60), v60), v49);
    v38 = (simd_double2)vorrq_s8(vandq_s8(veorq_s8(v67, v59), v66), vbicq_s8(v65, v66));
    v37 = (simd_double2)vorrq_s8(vandq_s8(v61, v66), vbicq_s8(v68, v66));
  }
  *sinp = v38;
  *cosp = v37;
}

simd_double2 _simd_tan_d2(simd_double2 x)
{
  float64x2_t v1;
  int64x2_t v2;
  float64x2_t v3;
  int8x16_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  int8x16_t v14;
  simd_double2 v15;
  int8x16_t v16;
  int8x16_t v17;
  float64x2_t v18;
  float64x2_t v19;
  int8x16_t v20;
  int8x16_t v21;
  float64x2_t v23;
  int8x16_t v24;
  int8x16_t v25;
  int8x16_t v26;

  v1 = (float64x2_t)vdupq_n_s64(0x40FF400000000000uLL);
  v2 = vcgtq_f64((float64x2_t)vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL)), v1);
  v3 = vmlaq_f64((float64x2_t)vdupq_n_s64(0x4338000000000000uLL), (float64x2_t)vdupq_n_s64(0x3FE45F306DC9C883uLL), (float64x2_t)x);
  v4 = (int8x16_t)vnegq_s64((int64x2_t)vandq_s8((int8x16_t)v3, (int8x16_t)vdupq_n_s64(1uLL)));
  v5 = vaddq_f64(v3, (float64x2_t)vdupq_n_s64(0xC338000000000000));
  v6 = vmlaq_f64(vmlaq_f64(vmlaq_f64((float64x2_t)x, (float64x2_t)vdupq_n_s64(0xBFF921FB54442D18), v5), (float64x2_t)vdupq_n_s64(0xBC91A62633145C06), v5), (float64x2_t)vdupq_n_s64(0xB94C1CD129024E09), v5);
  v7 = vmulq_f64(v6, v6);
  v8 = vmlaq_f64(v6, vmulq_f64(v7, vmlaq_f64((float64x2_t)vdupq_n_s64(0xBFC06B97BE36D389), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3F66FC6FDCE5D301uLL), (float64x2_t)vdupq_n_s64(0xBEDF637DCE2A3800), v7), v7)), v6);
  __asm { FMOV            V16.2D, #1.0 }
  v14 = (int8x16_t)vmlaq_f64(_Q16, vmlaq_f64((float64x2_t)vdupq_n_s64(0xBFDD8B213470BEEELL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3F97E7B68AC28A56uLL), (float64x2_t)vdupq_n_s64(0xBF2B525B03BC92A6), v7), v7), v7);
  v15 = (simd_double2)vdivq_f64((float64x2_t)vbslq_s8(v4, v14, (int8x16_t)v8), (float64x2_t)vbslq_s8(v4, (int8x16_t)vnegq_f64(v8), v14));
  if ((vorrq_s8((int8x16_t)vdupq_laneq_s64(v2, 1), (int8x16_t)v2).u64[0] & 0x8000000000000000) != 0)
  {
    v26 = 0u;
    v24 = (int8x16_t)v2;
    v25 = (int8x16_t)v15;
    v23 = _Q16;
    *(double *)v16.i64 = sub_1DEE71D64(&v26, (uint64x2_t)vorrq_s8(vandq_s8((int8x16_t)v2, (int8x16_t)x), vbicq_s8((int8x16_t)v1, (int8x16_t)v2)));
    v17 = (int8x16_t)vnegq_s64((int64x2_t)vandq_s8(v26, (int8x16_t)vdupq_n_s64(1uLL)));
    v18 = (float64x2_t)veorq_s8((int8x16_t)vshlq_n_s64((int64x2_t)v26, 0x3FuLL), v16);
    v19 = vmulq_f64(v18, v18);
    v20 = (int8x16_t)vmlaq_f64(vmulq_f64(vmulq_f64(v19, v18), vmlaq_f64((float64x2_t)vdupq_n_s64(0xBFE08BB113B2D25ALL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FA0C8580FA6B9B9uLL), (float64x2_t)vdupq_n_s64(0xBF3BB103D68EE571), v19), v19)), (float64x2_t)vdupq_n_s64(0x3FF921FB54442D18uLL), v18);
    v21 = (int8x16_t)vmlaq_f64(v23, vmlaq_f64((float64x2_t)vdupq_n_s64(0xBFF26D1667518600), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FC401CCE5F3A97BuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xBF7336A7EAFF7F8ELL), (float64x2_t)vdupq_n_s64(0x3EF3727E6E36B82FuLL), v19), v19), v19), v19);
    return (simd_double2)vorrq_s8(vandq_s8((int8x16_t)vdivq_f64((float64x2_t)vbslq_s8(v17, v21, v20), (float64x2_t)vbslq_s8(v17, v20, v21)), v24), vbicq_s8(v25, v24));
  }
  return v15;
}

simd_double2 _simd_cospi_d2(simd_double2 x)
{
  float64x2_t v1;
  float64x2_t v2;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;

  v1 = (float64x2_t)vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL));
  v2 = vrndnq_f64(v1);
  __asm { FMOV            V2.2D, #0.5 }
  v8 = (float64x2_t)vdupq_n_s64(0x4330000000000000uLL);
  v9 = (float64x2_t)veorq_s8((int8x16_t)vshlq_n_s64((int64x2_t)vaddq_f64((float64x2_t)vandq_s8((int8x16_t)v8, (int8x16_t)vcgtq_f64(v8, v2)), vminnmq_f64(v2, (float64x2_t)vdupq_n_s64(0x4340000000000000uLL))), 0x3FuLL), (int8x16_t)vsubq_f64(_Q2, vabdq_f64(v1, v2)));
  v10 = vmulq_f64(v9, v9);
  return (simd_double2)vmulq_f64(vmlaq_f64((float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xC014ABBCE625BE52), vmlaq_f64((float64x2_t)vdupq_n_s64(0x400466BC6775AA7DuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xBFE32D2CCE627C9ELL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FB50783485523F5uLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xBF7E3074DFB5BB7ELL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3F3E8F3677C34BAAuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xBEF6F7AD23B8333CLL), (float64x2_t)vdupq_n_s64(0x3EA9D46B06FC620DuLL), v10), v10),
                                     v10),
                                   v10),
                                 v10),
                               v10),
                             v10),
                           v10),
                         v9);
}

simd_double2 _simd_sinpi_d2(simd_double2 x)
{
  int8x16_t v1;
  float64x2_t v2;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;

  v1 = vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x8000000000000000));
  v2 = (float64x2_t)vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL));
  v3 = vrndnq_f64(v2);
  v4 = (float64x2_t)vdupq_n_s64(0x4330000000000000uLL);
  v5 = (float64x2_t)veorq_s8(veorq_s8(v1, (int8x16_t)vsubq_f64(v2, v3)), (int8x16_t)vshlq_n_s64((int64x2_t)vaddq_f64((float64x2_t)vandq_s8((int8x16_t)v4, (int8x16_t)vcgtq_f64(v4, v3)), vminnmq_f64(v3, (float64x2_t)vdupq_n_s64(0x4340000000000000uLL))), 0x3FuLL));
  v6 = vmulq_f64(v5, v5);
  return (simd_double2)vmulq_f64(vmlaq_f64((float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xC014ABBCE625BE52), vmlaq_f64((float64x2_t)vdupq_n_s64(0x400466BC6775AA7DuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xBFE32D2CCE627C9ELL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FB50783485523F5uLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xBF7E3074DFB5BB7ELL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3F3E8F3677C34BAAuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xBEF6F7AD23B8333CLL), (float64x2_t)vdupq_n_s64(0x3EA9D46B06FC620DuLL), v6), v6),
                                     v6),
                                   v6),
                                 v6),
                               v6),
                             v6),
                           v6),
                         v5);
}

simd_double2 _simd_tanpi_d2(simd_double2 x)
{
  float64x2_t v1;
  float64x2_t v2;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v19;
  float64x2_t v20;

  v1 = vrndnq_f64((float64x2_t)x);
  v2 = vsubq_f64((float64x2_t)x, v1);
  v3 = (float64x2_t)vdupq_n_s64(0x3EA9D46B06FC620DuLL);
  v4 = (float64x2_t)vdupq_n_s64(0xBEF6F7AD23B8333CLL);
  v5 = vmulq_f64(v2, v2);
  v6 = (float64x2_t)vdupq_n_s64(0x3F3E8F3677C34BAAuLL);
  v7 = (float64x2_t)vdupq_n_s64(0xBF7E3074DFB5BB7ELL);
  v8 = (float64x2_t)vdupq_n_s64(0x3FB50783485523F5uLL);
  v9 = (float64x2_t)vdupq_n_s64(0xBFE32D2CCE627C9ELL);
  v10 = (float64x2_t)vdupq_n_s64(0x400466BC6775AA7DuLL);
  v11 = (float64x2_t)vdupq_n_s64(0xC014ABBCE625BE52);
  v12 = (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL);
  v13 = vabdq_f64((float64x2_t)x, v1);
  __asm { FMOV            V1.2D, #0.5 }
  v19 = vsubq_f64(_Q1, v13);
  v20 = vmulq_f64(v19, v19);
  return (simd_double2)vdivq_f64(vmulq_f64(v2, vmlaq_f64(v12, vmlaq_f64(v11, vmlaq_f64(v10, vmlaq_f64(v9, vmlaq_f64(v8, vmlaq_f64(v7, vmlaq_f64(v6, vmlaq_f64(v4, v3, v5), v5), v5), v5), v5), v5), v5), v5)), vmulq_f64(v19, vmlaq_f64(v12,
                             vmlaq_f64(v11, vmlaq_f64(v10, vmlaq_f64(v9, vmlaq_f64(v8, vmlaq_f64(v7, vmlaq_f64(v6, vmlaq_f64(v4, v3, v20), v20), v20), v20), v20), v20), v20), v20)));
}

void _simd_sincospi_d2(simd_double2 x, simd_double2 *sinp, simd_double2 *cosp)
{
  int8x16_t v3;
  float64x2_t v4;
  float64x2_t v5;
  int8x16_t v6;
  int8x16_t v12;
  float64x2_t v13;
  int8x16_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;

  v3 = vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x8000000000000000));
  v4 = (float64x2_t)vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL));
  v5 = vrndnq_f64(v4);
  v6 = (int8x16_t)vsubq_f64(v4, v5);
  __asm { FMOV            V4.2D, #0.5 }
  v12 = (int8x16_t)vsubq_f64(_Q4, vabdq_f64(v4, v5));
  v13 = (float64x2_t)vdupq_n_s64(0x4330000000000000uLL);
  v14 = (int8x16_t)vshlq_n_s64((int64x2_t)vaddq_f64((float64x2_t)vandq_s8((int8x16_t)v13, (int8x16_t)vcgtq_f64(v13, v5)), vminnmq_f64(v5, (float64x2_t)vdupq_n_s64(0x4340000000000000uLL))), 0x3FuLL);
  v15 = (float64x2_t)veorq_s8(v14, v12);
  v16 = (float64x2_t)veorq_s8(veorq_s8(v3, v6), v14);
  v17 = (float64x2_t)vdupq_n_s64(0x3EA9D46B06FC620DuLL);
  v18 = vmulq_f64(v16, v16);
  v19 = (float64x2_t)vdupq_n_s64(0xBEF6F7AD23B8333CLL);
  v20 = (float64x2_t)vdupq_n_s64(0x3F3E8F3677C34BAAuLL);
  v21 = (float64x2_t)vdupq_n_s64(0xBF7E3074DFB5BB7ELL);
  v22 = (float64x2_t)vdupq_n_s64(0x3FB50783485523F5uLL);
  v23 = (float64x2_t)vdupq_n_s64(0xBFE32D2CCE627C9ELL);
  v24 = (float64x2_t)vdupq_n_s64(0x400466BC6775AA7DuLL);
  v25 = (float64x2_t)vdupq_n_s64(0xC014ABBCE625BE52);
  v26 = (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL);
  *(float64x2_t *)sinp = vmulq_f64(vmlaq_f64(v26, vmlaq_f64(v25, vmlaq_f64(v24, vmlaq_f64(v23, vmlaq_f64(v22, vmlaq_f64(v21, vmlaq_f64(v20, vmlaq_f64(v19, v17, v18), v18), v18), v18), v18), v18), v18), v18), v16);
  v27 = vmulq_f64(v15, v15);
  *(float64x2_t *)cosp = vmulq_f64(vmlaq_f64(v26, vmlaq_f64(v25, vmlaq_f64(v24, vmlaq_f64(v23, vmlaq_f64(v22, vmlaq_f64(v21, vmlaq_f64(v20, vmlaq_f64(v19, v17, v27), v27), v27), v27), v27), v27), v27), v27), v15);
}

float nanf(const char *a1)
{
  float result;

  LODWORD(result) = sub_1DEE72DE8((unint64_t)a1) & 0x3FFFFF | 0x7FC00000;
  return result;
}

unint64_t sub_1DEE72DE8(unint64_t result)
{
  unsigned __int8 *v1;
  signed __int8 v2;
  unsigned __int8 *v3;
  int v4;
  unsigned int v5;
  int v6;
  int v7;
  unsigned int v8;
  unsigned __int8 *v9;
  unsigned int v10;
  int v11;
  unsigned __int8 *v12;
  int v13;

  if (result)
  {
    v1 = (unsigned __int8 *)result;
    result = *(unsigned __int8 *)result;
    if ((_DWORD)result)
    {
      if ((_DWORD)result != 48)
      {
        v8 = result;
        v9 = v1 + 1;
        result = 0;
        while (v8 - 48 <= 9)
        {
          result = 10 * result + v8 - 48;
          v10 = *v9++;
          v8 = v10;
          if (!v10)
            return result;
        }
        return 0;
      }
      result = v1[1];
      if (v1[1])
      {
        if ((_DWORD)result == 88 || (_DWORD)result == 120)
        {
          v2 = v1[2];
          if (v2)
          {
            result = 0;
            v3 = v1 + 3;
            while (1)
            {
              v4 = v2;
              v5 = (v2 - 48);
              v6 = -48;
              if (v5 >= 0xA)
              {
                v6 = -87;
                if ((v4 - 97) >= 6u)
                {
                  v6 = -55;
                  if ((v4 - 65) > 5u)
                    break;
                }
              }
              result = (v6 + v4) | (16 * result);
              v7 = *v3++;
              v2 = v7;
              if (!v7)
                return result;
            }
          }
        }
        else
        {
          v11 = v1[1];
          v12 = v1 + 2;
          result = 0;
          while ((v11 & 0xF8) == 0x30)
          {
            result = (v11 - 48) | (8 * result);
            v13 = *v12++;
            v11 = v13;
            if (!v13)
              return result;
          }
        }
        return 0;
      }
    }
  }
  return result;
}

double nanl(const char *a1)
{
  double result;

  *(_QWORD *)&result = sub_1DEE72DE8((unint64_t)a1) & 0x7FFFFFFFFFFFFLL | 0x7FF8000000000000;
  return result;
}

unsigned __int16 __roundf16@<H0>(int8x16_t _Q0@<Q0>, int8x16_t a2@<Q1>, double a3@<D2>, int8x16_t a4@<Q3>)
{
  unsigned __int32 v4;
  unsigned __int32 v5;
  float64x2_t v10;
  int8x16_t v11;

  v4 = _Q0.i32[0];
  v5 = ((unsigned __int32)_Q0.i32[0] >> 10) & 0x1F;
  if (v5 - 15 > 9)
  {
    if (v5 > 0xE)
    {
      __asm { FCVT            S0, H0 }
      *(float *)_Q0.i32 = _S0 + 0.0;
      __asm { FCVT            H0, S0 }
    }
    else
    {
      a2.i64[0] = 1.0;
      __asm { FCVT            D0, H0 }
      v10.f64[0] = NAN;
      v10.f64[1] = NAN;
      v11 = (int8x16_t)vnegq_f64(v10);
      a2.i64[0] = vbslq_s8(v11, a2, _Q0).u64[0];
      a4.i64[0] = 0;
      _Q0.i64[0] = vbslq_s8(v11, a4, _Q0).u64[0];
      if (((v4 >> 11) & 0xF) >= 7)
        _Q0.i64[0] = a2.i64[0];
      __asm { FCVT            H0, D0 }
    }
  }
  else
  {
    _Q0.i32[0] = (_Q0.i32[0] + ((1 << (25 - v5)) >> 1)) & -(1 << (25 - v5));
  }
  return _Q0.i16[0];
}

simd_float4 _simd_asin_f4(simd_float4 x)
{
  int8x16_t v1;
  int8x16_t v2;
  float32x4_t v3;
  float32x4_t v4;
  int8x16_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  int8x16_t v12;
  int8x16_t v13;

  v1.i64[0] = 0x8000000080000000;
  v1.i64[1] = 0x8000000080000000;
  v2 = vandq_s8((int8x16_t)x, v1);
  x.i64[0] &= 0x7FFFFFFF7FFFFFFFuLL;
  x.i32[2] &= ~0x80000000;
  x.i32[3] &= ~0x80000000;
  v3 = (float32x4_t)vandq_s8((int8x16_t)x, (int8x16_t)vcgeq_f32((float32x4_t)x, (float32x4_t)vdupq_n_s32(0x38D1B717u)));
  v4.i64[0] = 0x3F0000003F000000;
  v4.i64[1] = 0x3F0000003F000000;
  v5 = (int8x16_t)vcgtq_f32((float32x4_t)x, v4);
  v6.i64[0] = 0xBF000000BF000000;
  v6.i64[1] = 0xBF000000BF000000;
  v7 = vmlaq_f32(v4, v6, (float32x4_t)x);
  v8 = (float32x4_t)vbslq_s8(v5, (int8x16_t)v7, (int8x16_t)vmulq_f32(v3, v3));
  v9 = vsqrtq_f32(v7);
  v10 = vmulq_f32(vmlaq_f32((float32x4_t)vdupq_n_s32(0x3E2AAAE4u), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3D9980F6u), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3D3A3EC7u), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3CC617E3u), (float32x4_t)vdupq_n_s32(0x3D2CB352u), v8), v8), v8), v8), v8);
  v6.i64[0] = 0xC0000000C0000000;
  v6.i64[1] = 0xC0000000C0000000;
  v11 = (float32x4_t)vdupq_n_s32(0x3FC90FDBu);
  v12 = vorrq_s8(v2, (int8x16_t)v11);
  v13 = (int8x16_t)vmlaq_f32(v11, v6, vmlaq_f32(v9, v9, v10));
  __asm { FMOV            V3.4S, #1.0 }
  return (simd_float4)vbslq_s8((int8x16_t)vcgtq_f32(_Q3, (float32x4_t)x), veorq_s8(vbslq_s8(v5, v13, (int8x16_t)vmlaq_f32((float32x4_t)x, (float32x4_t)x, v10)), v2), vbslq_s8((int8x16_t)vceqq_f32((float32x4_t)x, _Q3), v12, (int8x16_t)vdupq_n_s32(0x7FC00000u)));
}

int __math_errhandling(void)
{
  return 2;
}

unint64_t __invert_h2(unint64_t a1, double _D0, double _D1, double _D2)
{
  float32x4_t v11;

  _KR00_4 = a1;
  LOWORD(_D2) = WORD2(a1);
  _H3 = HIWORD(a1);
  __asm
  {
    FCVT            S0, H0
    FCVT            S3, H3
  }
  *(float *)&_D0 = *(float *)&_D0 * _S3;
  __asm
  {
    FCVT            H0, S0
    FCVT            S2, H2
    FCVT            S1, H1
  }
  *(float *)&_D1 = *(float *)&_D1 * *(float *)&_D2;
  __asm
  {
    FCVT            H1, S1
    FCVT            S1, H1
    FCVT            S0, H0
  }
  *(float *)&_D0 = *(float *)&_D0 - *(float *)&_D1;
  __asm
  {
    FCVT            H0, S0
    FCVT            S0, H0
  }
  *(float *)&_D0 = 1.0 / *(float *)&_D0;
  __asm { FCVT            H0, S0 }
  LODWORD(_D1) = HIWORD(a1) | (((a1 >> 16) ^ 0x8000) << 16);
  LODWORD(_D2) = ((a1 << 48) | ((unint64_t)(WORD2(a1) ^ 0x8000u) << 32)) >> 32;
  v11 = vcvtq_f32_f16((float16x4_t)vdup_lane_s16(*(int16x4_t *)&_D0, 0));
  return vcvt_f16_f32(vmulq_f32(v11, vcvtq_f32_f16(*(float16x4_t *)&_D1))).u32[0] | ((unint64_t)vcvt_f16_f32(vmulq_f32(v11, vcvtq_f32_f16(*(float16x4_t *)&_D2))).u32[0] << 32);
}

float16x4_t __invert_h3(double _D0, double _D1, double _D2, double _D3)
{
  _H4 = WORD1(_D0);
  _H5 = WORD2(_D0);
  LOWORD(_D3) = WORD1(_D1);
  _H7 = WORD2(_D1);
  _H16 = WORD1(_D2);
  _H6 = WORD2(_D2);
  __asm
  {
    FCVT            S19, H6
    FCVT            S6, H3
  }
  *(float *)&_D3 = _S6 * _S19;
  __asm
  {
    FCVT            H3, S3
    FCVT            S20, H7
    FCVT            S17, H16
  }
  _S7 = _S17 * _S20;
  __asm
  {
    FCVT            H7, S7
    FCVT            S7, H7
    FCVT            S3, H3
  }
  *(float *)&_D3 = *(float *)&_D3 - _S7;
  __asm
  {
    FCVT            H3, S3
    FCVT            S7, H4
  }
  _S4 = _S7 * _S19;
  __asm
  {
    FCVT            H4, S4
    FCVT            S21, H5
  }
  _S5 = _S17 * _S21;
  __asm
  {
    FCVT            H5, S5
    FCVT            S5, H5
    FCVT            S4, H4
  }
  _S4 = _S4 - _S5;
  __asm
  {
    FCVT            H4, S4
    FCVT            S16, H4
  }
  _S4 = -_S16;
  __asm { FCVT            H4, S4 }
  _S5 = _S7 * _S20;
  __asm { FCVT            H5, S5 }
  _S18 = _S6 * _S21;
  __asm
  {
    FCVT            H18, S18
    FCVT            S18, H18
    FCVT            S5, H5
  }
  _S5 = _S5 - _S18;
  __asm
  {
    FCVT            H5, S5
    FCVT            S22, H1
  }
  _S1 = _S22 * _S19;
  __asm
  {
    FCVT            H1, S1
    FCVT            S18, H2
  }
  _S2 = _S18 * _S20;
  __asm
  {
    FCVT            H2, S2
    FCVT            S2, H2
    FCVT            S1, H1
  }
  _S1 = _S1 - _S2;
  __asm
  {
    FCVT            H1, S1
    FCVT            S1, H1
  }
  _S1 = -_S1;
  __asm
  {
    FCVT            H1, S1
    FCVT            S23, H0
  }
  *(float *)&_D0 = _S23 * _S19;
  __asm { FCVT            H0, S0 }
  _S2 = _S18 * _S21;
  __asm
  {
    FCVT            H2, S2
    FCVT            S2, H2
    FCVT            S0, H0
  }
  *(float *)&_D0 = *(float *)&_D0 - _S2;
  __asm { FCVT            H0, S0 }
  _S2 = _S23 * _S20;
  __asm { FCVT            H2, S2 }
  _S19 = _S22 * _S21;
  __asm
  {
    FCVT            H19, S19
    FCVT            S19, H19
    FCVT            S2, H2
  }
  _S2 = _S2 - _S19;
  __asm
  {
    FCVT            H2, S2
    FCVT            S2, H2
  }
  _S2 = -_S2;
  __asm { FCVT            H19, S2 }
  _S2 = _S22 * _S17;
  __asm { FCVT            H2, S2 }
  _S20 = _S18 * _S6;
  __asm
  {
    FCVT            H20, S20
    FCVT            S20, H20
    FCVT            S2, H2
  }
  _S2 = _S2 - _S20;
  __asm { FCVT            H2, S2 }
  _S17 = _S23 * _S17;
  __asm { FCVT            H17, S17 }
  _S20 = _S18 * _S7;
  __asm
  {
    FCVT            H20, S20
    FCVT            S20, H20
    FCVT            S17, H17
  }
  _S17 = _S17 - _S20;
  __asm
  {
    FCVT            H17, S17
    FCVT            S17, H17
  }
  _S17 = -_S17;
  __asm { FCVT            H17, S17 }
  _S6 = _S23 * _S6;
  __asm { FCVT            H6, S6 }
  _S7 = _S22 * _S7;
  __asm
  {
    FCVT            H7, S7
    FCVT            S7, H7
    FCVT            S6, H6
  }
  _S6 = _S6 - _S7;
  __asm
  {
    FCVT            H6, S6
    FCVT            S7, H3
  }
  _S7 = _S23 * _S7;
  __asm { FCVT            H7, S7 }
  _S16 = _S22 * _S16;
  __asm
  {
    FCVT            H16, S16
    FCVT            S16, H16
    FCVT            S7, H7
  }
  _S7 = _S7 - _S16;
  __asm
  {
    FCVT            H7, S7
    FCVT            S16, H5
  }
  _S16 = _S18 * _S16;
  __asm
  {
    FCVT            H16, S16
    FCVT            S7, H7
    FCVT            S16, H16
  }
  _S7 = _S16 + _S7;
  WORD1(_D3) = LOWORD(_S4);
  WORD2(_D3) = LOWORD(_S5);
  __asm
  {
    FCVT            H0, S7
    FCVT            S0, H0
  }
  *(float *)&_D0 = 1.0 / *(float *)&_D0;
  __asm { FCVT            H0, S0 }
  return vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(*(float16x4_t *)&_D3), vcvtq_f32_f16((float16x4_t)vdup_lane_s16(*(int16x4_t *)&_D0, 0))));
}

float16x4_t __invert_h4(int16x4_t a1, int16x4_t a2, double a3, double a4)
{
  float16x4_t v4;
  int8x8_t v5;
  float16x4_t v6;
  int8x8_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float16x4_t v10;
  float32x4_t v11;
  float16x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float16x4_t v15;
  float16x4_t v16;

  v4.i32[0] = vzip1_s16(a1, a2).u32[0];
  v4.i16[2] = LOWORD(a3);
  v4.i16[3] = LOWORD(a4);
  v5.i32[0] = vtrn2_s16(a1, a2).u32[0];
  v5.i16[2] = WORD1(a3);
  v5.i16[3] = WORD1(a4);
  v6.i32[0] = vzip2_s16(a1, a2).u32[0];
  v6.i16[2] = WORD2(a3);
  v6.i16[3] = WORD2(a4);
  v7.i32[0] = vuzp2_s16(vuzp2_s16(a1, a2), a1).u32[0];
  v7.i16[2] = HIWORD(a3);
  v7.i16[3] = HIWORD(a4);
  v8 = vcvtq_f32_f16(v6);
  v9 = vcvtq_f32_f16((float16x4_t)vext_s8(v7, v7, 4uLL));
  v10 = (float16x4_t)vrev32_s16((int16x4_t)vcvt_f16_f32(vmulq_f32(v8, v9)));
  v11 = vcvtq_f32_f16((float16x4_t)vext_s8(v5, v5, 4uLL));
  *(int16x4_t *)v8.f32 = vrev32_s16((int16x4_t)vcvt_f16_f32(vmulq_f32(v8, v11)));
  v12 = vcvt_f16_f32(vsubq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(v9, vcvtq_f32_f16(*(float16x4_t *)v8.f32)))), vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(v11, vcvtq_f32_f16((float16x4_t)vext_s8((int8x8_t)v10, (int8x8_t)v10, 4uLL))))), vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(v11, vcvtq_f32_f16(v10)))))))))), vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(v9, vcvtq_f32_f16((float16x4_t)vext_s8(*(int8x8_t *)v8.f32, *(int8x8_t *)v8.f32, 4uLL)))))));
  *(int16x4_t *)v8.f32 = vrev32_s16((int16x4_t)vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16((float16x4_t)v5), v9)));
  v13 = vcvtq_f32_f16((float16x4_t)vext_s8((int8x8_t)v6, (int8x8_t)v6, 4uLL));
  v14 = vcvtq_f32_f16(vcvt_f16_f32(vsubq_f32(vcvtq_f32_f16(vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(v13, vcvtq_f32_f16(*(float16x4_t *)v8.f32)))), vcvtq_f32_f16(v12)))), vcvtq_f32_f16(vcvt_f16_f32(vmulq_f32(v13, vcvtq_f32_f16((float16x4_t)vext_s8(*(int8x8_t *)v8.f32, *(int8x8_t *)v8.f32, 4uLL))))))));
  v15 = vcvt_f16_f32(vmulq_f32(vcvtq_f32_f16(v4), v14));
  v16 = vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(v15), vcvtq_f32_f16((float16x4_t)vdup_lane_s32((int32x2_t)v15, 1))));
  _D0 = (int16x4_t)vcvt_f16_f32(vaddq_f32(vcvtq_f32_f16(v16), vcvtq_f32_f16((float16x4_t)vdup_lane_s16((int16x4_t)v16, 1))));
  __asm { FCVT            S0, H0 }
  *(float *)_D0.i32 = 1.0 / *(float *)_D0.i32;
  __asm { FCVT            H0, S0 }
  return vcvt_f16_f32(vmulq_f32(v14, vcvtq_f32_f16((float16x4_t)vdup_lane_s16(_D0, 0))));
}

simd_float2x2 __invert_f2(simd_float2x2 a1)
{
  int32x2_t v1;
  float v2;
  float32x2_t v3;
  float32x2_t v4;
  float v5;
  float32x2_t v6;
  float32x2_t v7;
  simd_float2x2 result;

  v2 = vmlas_n_f32(-(float)(a1.columns[0].f32[1] * a1.columns[1].f32[0]), a1.columns[1].f32[1], a1.columns[0].f32[0]);
  *(float *)v1.i32 = -a1.columns[1].f32[0];
  v3.i32[0] = vdup_lane_s32((int32x2_t)a1.columns[1], 1).u32[0];
  v3.i32[1] = vneg_f32(*(float32x2_t *)&a1).i32[1];
  v4 = (float32x2_t)vzip1_s32(v1, (int32x2_t)a1.columns[0]);
  v5 = 1.0 / v2;
  v6 = vmul_n_f32(v3, v5);
  v7 = vmul_n_f32(v4, v5);
  result.columns[1] = (simd_float2)v7;
  result.columns[0] = (simd_float2)v6;
  return result;
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  float32x4_t v3;
  float v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  simd_float3x3 result;

  _Q6.i32[0] = a1.columns[1].i32[2];
  _S16 = a1.columns[2].i32[2];
  __asm
  {
    FMLA            S17, S16, V1.S[1]
    FMLA            S18, S16, V0.S[1]
    FMLA            S20, S6, V0.S[1]
  }
  v3.f32[0] = -(float)((float)(a1.columns[1].f32[0] * a1.columns[2].f32[2])
                     - (float)(a1.columns[2].f32[0] * a1.columns[1].f32[2]));
  _Q6.f32[0] = vmlas_n_f32(-(float)(a1.columns[2].f32[0] * a1.columns[1].f32[1]), a1.columns[2].f32[1], a1.columns[1].f32[0]);
  _Q17.f32[1] = -(float)((float)(a1.columns[0].f32[1] * a1.columns[2].f32[2])
                       - (float)(a1.columns[2].f32[1] * a1.columns[0].f32[2]));
  _Q17.f32[2] = _S20;
  v3.i32[1] = vmlas_n_f32(-(float)(a1.columns[2].f32[0] * a1.columns[0].f32[2]), a1.columns[2].f32[2], a1.columns[0].f32[0]);
  v3.f32[2] = -(float)((float)(a1.columns[0].f32[0] * a1.columns[1].f32[2])
                     - (float)(a1.columns[1].f32[0] * a1.columns[0].f32[2]));
  _Q6.f32[1] = -(float)((float)(a1.columns[0].f32[0] * a1.columns[2].f32[1])
                      - (float)(a1.columns[2].f32[0] * a1.columns[0].f32[1]));
  _Q6.i32[2] = vmlas_n_f32(-(float)(a1.columns[1].f32[0] * a1.columns[0].f32[1]), a1.columns[1].f32[1], a1.columns[0].f32[0]);
  v11 = 1.0
      / vmlas_n_f32(vmlas_n_f32(-(float)(a1.columns[1].f32[0] * _S18), _Q17.f32[0], a1.columns[0].f32[0]), _S20, a1.columns[2].f32[0]);
  v12 = vmulq_n_f32(_Q17, v11);
  v13 = vmulq_n_f32(v3, v11);
  v14 = vmulq_n_f32(_Q6, v11);
  result.columns[2] = (simd_float3)v14;
  result.columns[1] = (simd_float3)v13;
  result.columns[0] = (simd_float3)v12;
  return result;
}

simd_double2x2 __invert_d2(simd_double2x2 a1)
{
  int64x2_t v1;
  double v2;
  float64x2_t v3;
  double v4;
  float64x2_t v5;
  float64x2_t v6;
  simd_double2x2 result;

  v2 = vmlad_n_f64(-(a1.columns[0].f64[1] * a1.columns[1].f64[0]), a1.columns[1].f64[1], a1.columns[0].f64[0]);
  *(double *)v1.i64 = -a1.columns[1].f64[0];
  *(_QWORD *)&a1.columns[1].f64[0] = vdupq_laneq_s64((int64x2_t)a1.columns[1], 1).u64[0];
  a1.columns[1].f64[1] = vnegq_f64(*(float64x2_t *)&a1).f64[1];
  v3 = (float64x2_t)vzip1q_s64(v1, (int64x2_t)a1.columns[0]);
  v4 = 1.0 / v2;
  v5 = vmulq_n_f64((float64x2_t)a1.columns[1], v4);
  v6 = vmulq_n_f64(v3, v4);
  result.columns[1] = (simd_double2)v6;
  result.columns[0] = (simd_double2)v5;
  return result;
}

float64x2_t __invert_d4@<Q0>(uint64_t a1@<X0>, float64x2_t *a2@<X8>)
{
  const double *v2;
  int64x2_t v3;
  int64x2_t v4;
  int64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  int8x16_t v10;
  int8x16_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  int8x16_t v18;
  int8x16_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  int8x16_t v26;
  int8x16_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  int8x16_t v34;
  int8x16_t v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  int8x16_t v44;
  int8x16_t v45;
  float64x2_t v46;
  float64x2_t v47;
  float64x2_t v48;
  float64x2_t v49;
  float64x2_t v50;
  float64x2_t v51;
  int8x16_t v52;
  int8x16_t v53;
  float64x2_t v54;
  float64x2_t v55;
  float64x2_t v56;
  float64x2_t result;
  float64x2x4_t v58;

  v2 = (const double *)(a1 + 64);
  v58 = vld4q_f64(v2);
  v3 = *(int64x2_t *)(a1 + 16);
  v5 = *(int64x2_t *)(a1 + 32);
  v4 = *(int64x2_t *)(a1 + 48);
  v6 = (float64x2_t)vzip1q_s64(*(int64x2_t *)a1, v5);
  v7 = (float64x2_t)vzip2q_s64(*(int64x2_t *)a1, v5);
  v8 = (float64x2_t)vzip1q_s64(v3, v4);
  v9 = (float64x2_t)vzip2q_s64(v3, v4);
  v10 = (int8x16_t)vmulq_f64(v58.val[2], v9);
  v11 = (int8x16_t)vmulq_f64(v8, v58.val[3]);
  v12 = (float64x2_t)vextq_s8(v11, v11, 8uLL);
  v13 = (float64x2_t)vextq_s8(v10, v10, 8uLL);
  v14 = vmlaq_f64(vnegq_f64(vmulq_f64(v58.val[1], v12)), v13, v58.val[1]);
  v15 = vmlaq_f64(vnegq_f64(vmulq_f64(v7, v13)), v12, v7);
  v16 = vmlaq_f64(vnegq_f64(vmulq_f64(v6, v12)), v13, v6);
  v17 = vmlaq_f64(vnegq_f64(vmulq_f64(v58.val[0], v13)), v12, v58.val[0]);
  v18 = (int8x16_t)vmulq_f64(v7, v58.val[2]);
  v19 = (int8x16_t)vmulq_f64(v58.val[1], v8);
  v20 = (float64x2_t)vextq_s8(v19, v19, 8uLL);
  v21 = (float64x2_t)vextq_s8(v18, v18, 8uLL);
  v22 = vmlsq_f64(vmlaq_f64(v14, v20, v58.val[3]), v21, v58.val[3]);
  v23 = vmlsq_f64(vmlaq_f64(v15, v21, v9), v20, v9);
  v24 = vmlaq_f64(vnegq_f64(vmulq_f64(v6, v20)), v21, v6);
  v25 = vmlaq_f64(vnegq_f64(vmulq_f64(v58.val[0], v21)), v20, v58.val[0]);
  v26 = (int8x16_t)vmulq_f64(v58.val[1], v9);
  v27 = (int8x16_t)vmulq_f64(v7, v58.val[3]);
  v28 = (float64x2_t)vextq_s8(v27, v27, 8uLL);
  v29 = (float64x2_t)vextq_s8(v26, v26, 8uLL);
  v30 = vmlsq_f64(vmlaq_f64(v22, v28, v58.val[2]), v29, v58.val[2]);
  v31 = vmlsq_f64(vmlaq_f64(v23, v29, v8), v28, v8);
  v32 = vmlaq_f64(vnegq_f64(vmulq_f64(v6, v28)), v29, v6);
  v33 = vmlaq_f64(vnegq_f64(vmulq_f64(v58.val[0], v29)), v28, v58.val[0]);
  v34 = (int8x16_t)vmulq_f64(v6, v58.val[1]);
  v35 = (int8x16_t)vmulq_f64(v58.val[0], v7);
  v36 = (float64x2_t)vextq_s8(v35, v35, 8uLL);
  v37 = (float64x2_t)vextq_s8(v34, v34, 8uLL);
  v38 = vmlaq_f64(vnegq_f64(v25), v37, v58.val[2]);
  v39 = vmlaq_f64(vnegq_f64(v24), v36, v8);
  v40 = vmlaq_f64(vnegq_f64(vmlaq_f64(v32, v36, v9)), v37, v9);
  v41 = vmlaq_f64(vnegq_f64(vmlaq_f64(v33, v37, v58.val[3])), v36, v58.val[3]);
  v42 = vmlsq_f64(v39, v37, v8);
  v43 = vmlsq_f64(v38, v36, v58.val[2]);
  v44 = (int8x16_t)vmulq_f64(v6, v58.val[3]);
  v45 = (int8x16_t)vmulq_f64(v58.val[0], v9);
  v46 = (float64x2_t)vextq_s8(v45, v45, 8uLL);
  v47 = (float64x2_t)vextq_s8(v44, v44, 8uLL);
  v48 = vmlaq_f64(vmlsq_f64(v16, v46, v8), v47, v8);
  v49 = vmlaq_f64(vmlsq_f64(v17, v47, v58.val[2]), v46, v58.val[2]);
  v50 = vmlsq_f64(vmlaq_f64(v40, v46, v7), v47, v7);
  v51 = vmlsq_f64(vmlaq_f64(v41, v47, v58.val[1]), v46, v58.val[1]);
  v52 = (int8x16_t)vmulq_f64(v6, v58.val[2]);
  v53 = (int8x16_t)vmulq_f64(v58.val[0], v8);
  v54 = (float64x2_t)vextq_s8(v53, v53, 8uLL);
  v55 = (float64x2_t)vextq_s8(v52, v52, 8uLL);
  v58.val[0].f64[0] = 1.0 / vaddvq_f64(vmlaq_f64(vmulq_f64(v58.val[0], v31), v30, v6));
  v58.val[2] = vmulq_n_f64(v31, v58.val[0].f64[0]);
  v56 = vmulq_n_f64(vmlaq_f64(vmlsq_f64(v43, v55, v58.val[1]), v54, v58.val[1]), v58.val[0].f64[0]);
  *a2 = vmulq_n_f64(v30, v58.val[0].f64[0]);
  a2[1] = v58.val[2];
  a2[2] = vmulq_n_f64(vmlsq_f64(vmlaq_f64(v49, v55, v58.val[3]), v54, v58.val[3]), v58.val[0].f64[0]);
  a2[3] = vmulq_n_f64(vmlsq_f64(vmlaq_f64(v48, v54, v9), v55, v9), v58.val[0].f64[0]);
  a2[4] = vmulq_n_f64(v51, v58.val[0].f64[0]);
  a2[5] = vmulq_n_f64(v50, v58.val[0].f64[0]);
  result = vmulq_n_f64(vmlaq_f64(vmlsq_f64(v42, v54, v7), v55, v7), v58.val[0].f64[0]);
  a2[6] = v56;
  a2[7] = result;
  return result;
}

simd_double2 _simd_atan_d2(simd_double2 x)
{
  int8x16_t v1;
  float64x2_t v2;
  int8x16_t v3;
  int8x16_t v4;
  int8x16_t v5;
  float64x2_t v12;
  float64x2_t v13;

  v1 = vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x8000000000000000));
  v2 = (float64x2_t)vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL));
  v3 = vandq_s8((int8x16_t)vcgeq_f64(v2, (float64x2_t)vdupq_n_s64(0x3CA0000000000000uLL)), (int8x16_t)vcgtq_f64((float64x2_t)vdupq_n_s64(0x4330000000000000uLL), v2));
  v4 = (int8x16_t)vcgtq_f64(v2, (float64x2_t)vdupq_n_s64(0x3FE51EB851EB851FuLL));
  v5 = (int8x16_t)vcgtq_f64(v2, (float64x2_t)vdupq_n_s64(0x4003504F333F9DE6uLL));
  __asm
  {
    FMOV            V5.2D, #-1.0
    FMOV            V7.2D, #1.0
  }
  v12 = vdivq_f64((float64x2_t)vbslq_s8(v5, (int8x16_t)_Q5, vbslq_s8(v4, (int8x16_t)vaddq_f64(v2, _Q5), (int8x16_t)v2)), (float64x2_t)vbslq_s8(v5, (int8x16_t)v2, vbslq_s8(v4, (int8x16_t)vaddq_f64(v2, _Q7), (int8x16_t)_Q7)));
  v13 = (float64x2_t)vandq_s8((int8x16_t)vmulq_f64(v12, v12), v3);
  return (simd_double2)veorq_s8(v1, (int8x16_t)vaddq_f64((float64x2_t)vbslq_s8(v5, (int8x16_t)vdupq_n_s64(0x3FF921FB54442D18uLL), vandq_s8((int8x16_t)vdupq_n_s64(0x3FE921FB54442D18uLL), v4)), vmlaq_f64(v12, vdivq_f64(vmulq_f64(v13, vmlaq_f64((float64x2_t)vdupq_n_s64(0xC0503669FD28EC8ELL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xC05EB8BF2D05BA25), vmlaq_f64((float64x2_t)vdupq_n_s64(0xC052C08C36880273), vmlaq_f64((float64x2_t)vdupq_n_s64(0xC03028545B6B807ALL),
                                                    (float64x2_t)vdupq_n_s64(0xBFEC007FA1F72594),
                                                    v13),
                                                  v13),
                                                v13),
                                              v13)),
                                          vmlaq_f64((float64x2_t)vdupq_n_s64(0x4068519EFBBD62ECuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x407E563F13B049EAuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x407B0E18D2E2BE3BuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x4064A0DD43B8FA25uLL), vaddq_f64(v13, (float64x2_t)vdupq_n_s64(0x4038DBC45B14603CuLL)), v13), v13), v13), v13)), v12)));
}

float remquof(float a1, float a2, int *a3)
{
  int v3;
  float v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  BOOL v22;
  int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  int v27;
  int v28;
  unsigned int v29;
  unsigned int v30;
  int v31;
  unsigned int v32;
  int v33;

  v3 = (LODWORD(a1) >> 23);
  v4 = a2;
  v5 = (LODWORD(a2) >> 23);
  v6 = LODWORD(a1) & 0x7FFFFF | 0x800000;
  v7 = LODWORD(a2) & 0x7FFFFF | 0x800000;
  if ((LODWORD(a1) & 0x7F800000u) - 2139095040 < 0x81000000 || (LODWORD(a2) & 0x7F800000u) - 2139095040 < 0x81000000)
  {
    *a3 = 0;
    v8 = LODWORD(a1) & 0x7FFFFFFF;
    if ((LODWORD(a1) & 0x7FFFFFFFu) > 0x7F800000)
      return a1;
    v9 = LODWORD(a2) & 0x7FFFFFFF;
    if ((LODWORD(a2) & 0x7FFFFFFFu) > 0x7F800000)
      return a2;
    if (v8 == 2139095040 || !v9)
      return INFINITY - INFINITY;
    if (!v8)
      return a1;
    a2 = a1;
    if (v9 == 2139095040)
      return a2;
    if (!(v8 >> 23))
    {
      v10 = __clz(LODWORD(a1) & 0x7FFFFF);
      v6 = (LODWORD(a1) & 0x7FFFFF) << (v10 - 8);
      v3 = v3 - v10 + 9;
    }
    if (!(v9 >> 23))
    {
      v11 = __clz(LODWORD(v4) & 0x7FFFFF);
      v7 = (LODWORD(v4) & 0x7FFFFF) << (v11 - 8);
      v5 = v5 - v11 + 9;
    }
  }
  v12 = LODWORD(a1) & 0x80000000;
  v13 = v3 - v5;
  v14 = LODWORD(v4) ^ LODWORD(a1);
  if (v13 >= 1)
  {
    v15 = 0;
    while (1)
    {
      v16 = v6 - v7;
      if (v6 == v7)
        break;
      v17 = 1 << v13;
      if (v13 >= 0x1F)
        v17 = 0;
      v18 = v17 + v15;
      v19 = __clz(v16) - 8;
      v20 = v16 << v19;
      v21 = v13 - v19;
      --v13;
      v22 = v6 >= v7;
      if (v6 < v7)
        v6 *= 2;
      else
        v6 = v20;
      if (v22)
      {
        v13 = v21;
        v15 = v18;
      }
      if (v13 <= 0)
        goto LABEL_27;
    }
    v27 = 1 << v13;
    if (v13 >= 0x1F)
      v27 = 0;
    v28 = v27 + v15;
    goto LABEL_35;
  }
  v15 = 0;
LABEL_27:
  v23 = v13 + v5;
  if (v13 < -1)
  {
LABEL_47:
    v31 = v23 << 23;
    v32 = (v6 >> (v23 == 0)) & 0xFF7FFFFF;
    if (v23 < 1)
      v31 = 0;
    if (v14 >= 0)
      v33 = v15;
    else
      v33 = -v15;
    *a3 = v33;
    LODWORD(a2) = v12 | v31 | v32;
    return a2;
  }
  v24 = v7 << -(char)v13;
  v25 = 2 * v6;
  if (2 * v6 >= 3 * v24)
  {
    v15 = (v15 + 2) & 0x7FFFFFFF;
    v26 = 2 * v24 - v6;
    v12 ^= 0x80000000;
    goto LABEL_46;
  }
  v26 = v6 - v24;
  if (v6 > v24)
  {
    v15 = (v15 + 1) & 0x7FFFFFFF;
LABEL_46:
    v29 = __clz(v26);
    v30 = v29 - 8;
    v6 = v26 << (v29 - 8);
    v23 -= v30;
    goto LABEL_47;
  }
  if (v6 != v24)
  {
    v26 = v24 - v6;
    if (v25 > v24)
      v15 = (v15 + 1) & 0x7FFFFFFF;
    else
      v26 = v6;
    if (v25 > v24)
      v12 ^= 0x80000000;
    goto LABEL_46;
  }
  v28 = (v15 + 1) & 0x7FFFFFFF;
LABEL_35:
  if (v14 < 0)
    v28 = -v28;
  *a3 = v28;
  LODWORD(a2) = LODWORD(a1) & 0x80000000;
  return a2;
}

simd_float4 _simd_exp10_f4(simd_float4 x)
{
  float32x4_t v1;
  float32x4_t v2;
  float32x4_t v3;
  int32x4_t v4;
  int32x4_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int8x16_t v8;
  int32x4_t v9;
  float32x4_t v10;
  float32x4_t v16;

  v1 = vminq_f32(vmaxq_f32((float32x4_t)x, (float32x4_t)vdupq_n_s32(0xC2349E36)), (float32x4_t)vdupq_n_s32(0x421A209Bu));
  v2 = vrndmq_f32(vmulq_f32(v1, (float32x4_t)vdupq_n_s32(0x40549A78u)));
  v3 = vmlaq_f32(vmlaq_f32(v1, (float32x4_t)vdupq_n_s32(0xBE9A2000), v2), (float32x4_t)vdupq_n_s32(0xB69A84FC), v2);
  v4 = vcvtq_s32_f32(v2);
  v5.i64[0] = 0x7F0000007FLL;
  v5.i64[1] = 0x7F0000007FLL;
  v6 = vaddq_s32(v4, v5);
  v7.i64[0] = 0x100000001;
  v7.i64[1] = 0x100000001;
  v8 = (int8x16_t)vcgtq_s32(v7, v6);
  v9.i64[0] = 0xFE000000FELL;
  v9.i64[1] = 0xFE000000FELL;
  v10 = (float32x4_t)vshlq_n_s32((int32x4_t)vbslq_s8(v8, (int8x16_t)vaddq_s32(v4, v9), (int8x16_t)v6), 0x17uLL);
  __asm { FMOV            V2.4S, #1.0 }
  v16 = vmulq_f32(vmlaq_f32(_Q2, v3, vmlaq_f32((float32x4_t)vdupq_n_s32(0x40135D8Fu), vmlaq_f32((float32x4_t)vdupq_n_s32(0x4029A931u), vmlaq_f32((float32x4_t)vdupq_n_s32(0x400237D6u), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3F95E5EFu), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3F0A2F59u), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3E576FFDu), (float32x4_t)vdupq_n_s32(0x3D879C0Eu), v3), v3), v3), v3), v3), v3)),
          v10);
  v10.i64[0] = 0x40000000400000;
  v10.i64[1] = 0x40000000400000;
  return (simd_float4)vbslq_s8(v8, (int8x16_t)vmulq_f32(v16, v10), (int8x16_t)v16);
}

int __isfinitel(double __x)
{
  return (~*(_QWORD *)&__x & 0x7FF0000000000000) != 0;
}

int __isfinitef(float __x)
{
  return (~LODWORD(__x) & 0x7F800000) != 0;
}

int isinf(double __x)
{
  return (*(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000;
}

int __isinff(float __x)
{
  return (LODWORD(__x) & 0x7FFFFFFF) == 2139095040;
}

int isnan(double __x)
{
  return (*(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FF0000000000000;
}

int __isnanf(float __x)
{
  return (LODWORD(__x) & 0x7FFFFFFFu) > 0x7F800000;
}

__int16 __fmaf16@<H0>(__n128 _Q0@<Q0>, __n128 _Q1@<Q1>, __n128 _Q2@<Q2>)
{
  float v10;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  int v17;
  __int16 result;

  __asm
  {
    FCVT            S2, H2
    FCVT            S0, H0
    FCVT            S1, H1
  }
  v10 = _S0 * _S1;
  _S0 = v10 + _S2;
  v12 = v10 + _S2;
  if (fabsf(v10 + _S2) < 0.000061035 || (LOWORD(v12) & 0x1FFF) == 0x1000)
  {
    v13 = fabsf(v10);
    v14 = (float)(v10 - _S0) + _S2;
    v15 = v10 + (float)(_S2 - _S0);
    if (v13 >= fabsf(_S2))
      v15 = v14;
    v16 = _S0 * v15;
    if (v16 > 0.0)
    {
      v17 = LODWORD(v12) | 1;
LABEL_9:
      _S0 = *(float *)&v17;
      goto LABEL_10;
    }
    if (v16 < 0.0)
    {
      v17 = LODWORD(v12) + (LODWORD(v12) | 0xFFFFFFFE) + 1;
      goto LABEL_9;
    }
  }
LABEL_10:
  __asm { FCVT            H0, S0 }
  return result;
}

simd_float4 _simd_log_f4(simd_float4 x)
{
  int32x4_t v1;
  int32x4_t v2;
  unsigned int v3;
  int32x4_t v4;
  int32x4_t v5;
  int8x16_t v6;
  float32x4_t v7;
  int32x4_t v8;
  unsigned __int128 v9;
  int32x4_t v10;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  simd_float4 v20;
  float32x4_t v21;
  int8x16_t v22;

  v1.i64[0] = 0x80000000800000;
  v1.i64[1] = 0x80000000800000;
  v2.i64[0] = 0x100000001000000;
  v2.i64[1] = 0x100000001000000;
  v3 = vmaxvq_u32((uint32x4_t)vcgtq_s32(v2, vaddq_s32((int32x4_t)x, v1)));
  if ((v3 & 0x80000000) != 0)
  {
    v6 = (int8x16_t)vceqzq_s32((int32x4_t)vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s32(0x7F800000u)));
    v7.i64[0] = 0x4B0000004B000000;
    v7.i64[1] = 0x4B0000004B000000;
    x = (simd_float4)vbslq_s8(v6, (int8x16_t)vmulq_f32((float32x4_t)x, v7), (int8x16_t)x);
    v7.i64[0] = 0x7D0000007DLL;
    v7.i64[1] = 0x7D0000007DLL;
    v8.i64[0] = 0x9400000094;
    v8.i64[1] = 0x9400000094;
    v5 = (int32x4_t)vbslq_s8(v6, (int8x16_t)vsraq_n_s32(v8, (int32x4_t)x, 0x17uLL), (int8x16_t)vsraq_n_s32((int32x4_t)v7, (int32x4_t)x, 0x17uLL));
  }
  else
  {
    v4.i64[0] = 0x7D0000007DLL;
    v4.i64[1] = 0x7D0000007DLL;
    v5 = vsraq_n_s32(v4, (int32x4_t)x, 0x17uLL);
  }
  v9 = *(_OWORD *)&vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s32(0x807FFFFF)) | __PAIR128__(0x3F0000003F000000, 0x3F0000003F000000);
  v10 = vcgtq_f32((float32x4_t)vdupq_n_s32(0x3F3504F3u), (float32x4_t)v9);
  __asm { FMOV            V4.4S, #-1.0 }
  v16 = vaddq_f32((float32x4_t)vbslq_s8((int8x16_t)v10, (int8x16_t)vaddq_f32((float32x4_t)v9, (float32x4_t)v9), (int8x16_t)v9), _Q4);
  v17 = (float32x4_t)vaddq_s32(v5, v10);
  v18 = vmulq_f32(v16, v16);
  v19 = vcvtq_f32_s32((int32x4_t)v17);
  v17.i64[0] = 0xBF000000BF000000;
  v17.i64[1] = 0xBF000000BF000000;
  v20 = (simd_float4)vmlaq_f32(vaddq_f32(v16, vmlaq_f32(vmlaq_f32(vmulq_f32(vmulq_f32(v16, v18), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3EAAAAAAu), vmlaq_f32((float32x4_t)vdupq_n_s32(0xBE7FFFFC), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3E4CCEACu), vmlaq_f32((float32x4_t)vdupq_n_s32(0xBE2AAE50), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3E11E9BFu), vmlaq_f32((float32x4_t)vdupq_n_s32(0xBDFE5D4F), vmlaq_f32(
                                             (float32x4_t)vdupq_n_s32(0x3DEF251Au),
                                             vmlaq_f32((float32x4_t)vdupq_n_s32(0xBDEBD1B8), (float32x4_t)vdupq_n_s32(0x3D9021BBu), v16), v16), v16), v16), v16), v16), v16), v16)), (float32x4_t)vdupq_n_s32(0xB95E8082), v19), v17, v18)), (float32x4_t)vdupq_n_s32(0x3F318000u), v19);
  if ((v3 & 0x80000000) != 0)
  {
    v21 = (float32x4_t)vdupq_n_s32(0x7F800000u);
    v22 = vbslq_s8((int8x16_t)vceqq_f32((float32x4_t)x, v21), (int8x16_t)v21, (int8x16_t)v20);
    v21.i64[0] = 0x7F0000007FLL;
    v21.i64[1] = 0x7F0000007FLL;
    return (simd_float4)vbslq_s8((int8x16_t)vcgezq_f32((float32x4_t)x), vbslq_s8((int8x16_t)vceqzq_f32((float32x4_t)x), (int8x16_t)v21, v22), (int8x16_t)vdupq_n_s32(0x7FC00000u));
  }
  return v20;
}

int __isnormall(double __x)
{
  return (*(_QWORD *)&__x & 0x7FFFFFFFFFFFFFFFuLL) - 1 < 0x7FEFFFFFFFFFFFFFLL;
}

simd_double2 _simd_cbrt_d2(simd_double2 x)
{
  float64x2_t v1;
  int8x16_t v2;
  int64x2_t v8;
  int64x2_t v9;
  int8x16_t v10;
  uint64_t v11;
  int64x2_t v12;
  float64x2_t v13;
  int64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;

  v1 = (float64x2_t)vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL));
  v2 = (int8x16_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x10000000000000uLL), (uint64x2_t)v1);
  __asm { FMOV            V3.2D, #1.0 }
  v8 = (int64x2_t)vmulq_f64(v1, (float64x2_t)vbslq_s8(v2, (int8x16_t)vdupq_n_s64(0x4680000000000000uLL), _Q3));
  v9 = vshrq_n_s64(v8, 0x34uLL);
  v9.i64[0] *= 0x5555555555556;
  v9.i64[1] *= 0x5555555555556;
  v10 = vandq_s8((int8x16_t)vsraq_n_s64(vshrq_n_s64(v9, 0x34uLL), v8, 0x34uLL), (int8x16_t)vdupq_n_s64(3uLL));
  v11 = v10.i64[1];
  v12 = xmmword_1DEE83820[v10.i64[0]];
  v13 = (float64x2_t)vorrq_s8(vandq_s8((int8x16_t)v8, (int8x16_t)vdupq_n_s64(0xFFFFFFFFFFFFFuLL)), _Q3);
  v14 = xmmword_1DEE83820[v11];
  v15 = (float64x2_t)vzip1q_s64(v12, v14);
  v16 = vaddq_f64(vaddq_f64(vrecpeq_f64(v13), (float64x2_t)vdupq_n_s64(0x42F8000000000000uLL)), (float64x2_t)vdupq_n_s64(0xC2F8000000000000));
  __asm { FMOV            V3.2D, #-1.0 }
  v18 = vmlaq_f64(_Q3, v13, v16);
  v19 = (float64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v16, 0x31uLL), (int8x16_t)vdupq_n_s64(0xFuLL));
  *(_QWORD *)&v19.f64[0] = qword_1DEE83850[*(_QWORD *)&v19.f64[0]];
  *(_QWORD *)&v19.f64[1] = qword_1DEE83850[*(_QWORD *)&v19.f64[1]];
  v20 = vmulq_f64(v19, (float64x2_t)vshlq_n_s64(vsraq_n_s64((int64x2_t)vbslq_s8(v2, (int8x16_t)vdupq_n_s64(0x287uLL), (int8x16_t)vdupq_n_s64(0x2AAuLL)), v9, 0x34uLL), 0x34uLL));
  v21 = vmulq_f64(v18, v18);
  return (simd_double2)vorrq_s8(vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x8000000000000000)), vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x8010000000000001), (uint64x2_t)vaddq_s64(v8, vdupq_n_s64(0x8010000000000000))), (int8x16_t)v8, (int8x16_t)vmulq_f64(v20, vaddq_f64(v15, vmlaq_f64((float64x2_t)vzip2q_s64(v12, v14), vmlaq_f64(vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FD5555555555557uLL), (float64x2_t)vdupq_n_s64(0xBFBC71C71C71C741), v18), v21, vmlaq_f64(
                                                vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FAF9ADD3C0B7E31uLL), (float64x2_t)vdupq_n_s64(0xBFA511E8D2B0363ELL), v18), v21, vmlaq_f64(vmlaq_f64((float64x2_t)vdupq_n_s64(0x3F9EE71141DCF569uLL), (float64x2_t)vdupq_n_s64(0xBF98090D77F2468ELL), v18), v21, vmlaq_f64(vmlaq_f64((float64x2_t)vdupq_n_s64(0x3F9374ED9398B914uLL), (float64x2_t)vdupq_n_s64(0xBF9036B87C71D55FLL), v18), v21, vmlaq_f64((float64x2_t)vdupq_n_s64(0x3F8BDA24BAE48875uLL), (float64x2_t)vdupq_n_s64(0xBF882E3B6ADECA62),
                                                      v18))))),
                                            vmulq_f64(v15, v18))))));
}

int __isnormalf(float __x)
{
  return (LODWORD(__x) & 0x7FFFFFFFu) - 1 < 0x7F7FFFFF;
}

int __signbitl(double __x)
{
  return *(_QWORD *)&__x >> 63;
}

int __signbitf(float __x)
{
  return LODWORD(__x) >> 31;
}

simd_double2 _simd_asinh_d2(simd_double2 x)
{
  float64x2_t v1;
  float64x2_t v2;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v25;
  int8x16_t v27;
  int8x16_t v28;
  int8x16_t v29;

  v29 = vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x8000000000000000));
  v1 = (float64x2_t)vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL));
  v27 = (int8x16_t)vcgtq_f64((float64x2_t)vdupq_n_s64(0x4197D78400000000uLL), v1);
  v2 = vmulq_f64(v1, v1);
  v3 = vmlaq_f64(vnegq_f64(v2), v1, v1);
  v4 = v1;
  v28 = (int8x16_t)vmlaq_f64(v1, vmulq_f64(v2, vmlaq_f64((float64x2_t)vdupq_n_s64(0xBFC5555555521E7ELL), (float64x2_t)vdupq_n_s64(0x3FB333220EAF02E7uLL), v2)), v1);
  __asm { FMOV            V2.2D, #1.0 }
  v10 = vmaxnmq_f64(v2, _Q2);
  v11 = vminnmq_f64(v2, _Q2);
  v12 = vaddq_f64(v2, _Q2);
  v13 = vaddq_f64(v3, vsubq_f64(v11, vsubq_f64(v12, v10)));
  v14 = vrsqrteq_f64(v12);
  v15 = vmulq_f64(v12, v14);
  v16 = vmlaq_f64(vmlaq_f64(vnegq_f64(v15), v14, v12), v14, v13);
  v17 = vmlsq_f64(vmlsq_f64(_Q2, v14, v15), v14, v16);
  __asm
  {
    FMOV            V3.2D, #0.375
    FMOV            V1.2D, #0.5
  }
  v20 = vmlaq_f64(v16, vmulq_f64(v17, vmlaq_f64(_Q1, v17, vmlaq_f64(_Q3, v17, vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FD4000000000177uLL), v17, vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FD17FFFFFF39F43uLL), v17, vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FCF80004F1AE7EAuLL), v17, vmlaq_f64(
                        (float64x2_t)vdupq_n_s64(0x3FCCDF873C8242D3uLL),
                        (float64x2_t)vdupq_n_s64(0x3FCB28B65B5004FAuLL),
                        v17))))))),
          v15);
  v21 = vaddq_f64(v15, v4);
  v22 = vaddq_f64(v21, v20);
  v23 = vaddq_f64(vsubq_f64(v4, vsubq_f64(v21, v15)), vsubq_f64(v20, vsubq_f64(v22, v21)));
  __asm { FMOV            V1.2D, #-1.0 }
  v25 = vaddq_f64(v22, _Q1);
  return (simd_double2)vorrq_s8(v29, vbslq_s8((int8x16_t)vcgeq_f64(v4, (float64x2_t)vdupq_n_s64(0x3F70000000000000uLL)), (int8x16_t)vaddq_f64((float64x2_t)vbicq_s8((int8x16_t)vdupq_n_s64(0x3FE62E42FEFA39EFuLL), v27), (float64x2_t)_simd_log1p_d2((simd_double2)vbslq_s8(v27, (int8x16_t)vaddq_f64(v25, vsubq_f64(v23, vaddq_f64(vsubq_f64(v25, v22), _Q2))), (int8x16_t)vaddq_f64(v4, _Q1)))), v28));
}

simd_double2 _simd_acosh_d2(simd_double2 x)
{
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  int8x16_t v25;
  float64x2_t v26;
  int8x16_t v27;
  float64x2_t v28;

  v25 = (int8x16_t)vcgtq_f64((float64x2_t)vdupq_n_s64(0x4197D78400000000uLL), (float64x2_t)x);
  __asm { FMOV            V7.2D, #-1.0 }
  v6 = vmlaq_f64(_Q7, (float64x2_t)x, (float64x2_t)x);
  v7 = vmlaq_f64((float64x2_t)vdupq_n_s64(0xBFC5555555521E7ELL), (float64x2_t)vdupq_n_s64(0x3FB333220EAF02E7uLL), v6);
  v8 = vrsqrteq_f64(v6);
  v9 = vmulq_f64(v6, v8);
  v10 = vmlaq_f64(vnegq_f64(v9), v8, v6);
  v11 = v6;
  v28 = v6;
  __asm { FMOV            V6.2D, #1.0 }
  v13 = _Q6;
  v26 = _Q6;
  v14 = vmlsq_f64(vmlsq_f64(_Q6, v8, v9), v8, v10);
  __asm
  {
    FMOV            V6.2D, #0.375
    FMOV            V1.2D, #0.5
  }
  v17 = vmlaq_f64(v10, vmulq_f64(v14, vmlaq_f64(_Q1, v14, vmlaq_f64(_Q6, v14, vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FD4000000000177uLL), v14, vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FD17FFFFFF39F43uLL), v14, vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FCF80004F1AE7EAuLL), v14, vmlaq_f64(
                        (float64x2_t)vdupq_n_s64(0x3FCCDF873C8242D3uLL),
                        (float64x2_t)vdupq_n_s64(0x3FCB28B65B5004FAuLL),
                        v14))))))),
          v9);
  v18 = vaddq_f64(v9, v17);
  v27 = (int8x16_t)vmlaq_f64(v18, vmulq_f64(v11, v7), v18);
  v19 = vaddq_f64(v9, (float64x2_t)x);
  v20 = vsubq_f64(v9, vsubq_f64(v19, (float64x2_t)x));
  v21 = vaddq_f64(v19, v17);
  v22 = vaddq_f64(v20, vsubq_f64(v17, vsubq_f64(v21, v19)));
  v23 = vaddq_f64(v21, _Q7);
  return (simd_double2)vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f64(v26, (float64x2_t)x), (int8x16_t)vdupq_n_s64(0x7FF8000000000000uLL), vbslq_s8((int8x16_t)vcgtq_f64(v28, (float64x2_t)vdupq_n_s64(0x3EF0000000000000uLL)), (int8x16_t)vaddq_f64((float64x2_t)vbicq_s8((int8x16_t)vdupq_n_s64(0x3FE62E42FEFA39EFuLL), v25), (float64x2_t)_simd_log1p_d2((simd_double2)vbslq_s8(v25, (int8x16_t)vaddq_f64(v23, vsubq_f64(v22, vaddq_f64(vsubq_f64(v23, v21), v13))), (int8x16_t)vaddq_f64((float64x2_t)x, _Q7)))), v27)), (int8x16_t)vceqq_f64((float64x2_t)x, v26));
}

simd_double2 _simd_atanh_d2(simd_double2 x)
{
  float64x2_t v1;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  simd_double2 v10;
  float64x2_t v13;
  int8x16_t v14;
  int8x16_t v15;

  v1 = (float64x2_t)vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL));
  __asm { FMOV            V2.2D, #1.0 }
  v7 = (float64x2_t)vorrq_s8(vandq_s8((int8x16_t)vcgtq_f64(v1, _Q2), (int8x16_t)vdupq_n_s64(0x7FF8000000000000uLL)), (int8x16_t)v1);
  v8 = (float64x2_t)vbicq_s8((int8x16_t)v7, (int8x16_t)vcgtq_f64((float64x2_t)vdupq_n_s64(0x3E40000000000000uLL), v7));
  v9 = vmulq_f64(v8, v8);
  v13 = v7;
  v15 = vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0x8000000000000000));
  v14 = (int8x16_t)vmulq_f64(vmlaq_f64(_Q2, v9, vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FD5555555554BF8uLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FC9999999A9AEC6uLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FC249248CDDDC54uLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FBC71C90133831BuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FB7459F33535074uLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FB3B48F7C7604BFuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FB0EB74F86784F8uLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FB02F1C949709C4uLL),
                                       vmlaq_f64((float64x2_t)vdupq_n_s64(0x3F9E937D18B92C74uLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FC008CB5B8A071DuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xBFBE6FC9611DC43DLL), (float64x2_t)vdupq_n_s64(0x3FCB4B3141587F72uLL), v9), v9), v9), v9), v9), v9), v9), v9), v9), v9), v9)), v7);
  v10 = _simd_log_d2((simd_double2)vdivq_f64(vaddq_f64(v7, _Q2), vsubq_f64(_Q2, v7)));
  __asm { FMOV            V1.2D, #0.5 }
  return (simd_double2)vorrq_s8(v15, vbslq_s8((int8x16_t)vcgeq_f64(v13, _Q1), (int8x16_t)vmulq_f64((float64x2_t)v10, _Q1), v14));
}

__int16 __sqrtf16@<H0>(__n128 _Q0@<Q0>)
{
  __int16 result;

  __asm { FCVT            S0, H0 }
  _S0 = sqrtf(_S0);
  __asm { FCVT            H0, S0 }
  return result;
}

simd_double2 _simd_log2_d2(simd_double2 x)
{
  float64x2_t v1;
  int64x2_t v2;
  unint64_t v3;
  int64x2_t v4;
  int8x16_t v5;
  float64x2_t v6;
  int64x2_t v7;
  float64x2_t v8;
  float64_t v9;
  float64_t v10;
  float64x2_t v16;
  simd_double2 v17;
  float64x2_t v18;

  v1 = (float64x2_t)vdupq_n_s64(0x10000000000000uLL);
  v2 = (int64x2_t)vornq_s8((int8x16_t)vcgtq_f64(v1, (float64x2_t)x), (int8x16_t)vcgeq_f64((float64x2_t)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL), (float64x2_t)x));
  v3 = vorrq_s8((int8x16_t)vdupq_laneq_s64(v2, 1), (int8x16_t)v2).u64[0];
  if ((v3 & 0x8000000000000000) != 0)
  {
    v5 = (int8x16_t)vcgtq_u64((uint64x2_t)v1, (uint64x2_t)x);
    x = (simd_double2)vbslq_s8(v5, (int8x16_t)vmulq_f64((float64x2_t)x, (float64x2_t)vdupq_n_s64(0x4330000000000000uLL)), (int8x16_t)x);
    v4 = (int64x2_t)vbslq_s8(v5, (int8x16_t)vsraq_n_s64(vdupq_n_s64(0xFFFFFFFFFFFFFBCDLL), (int64x2_t)x, 0x34uLL), (int8x16_t)vsraq_n_s64(vdupq_n_s64(0xFFFFFFFFFFFFFC01), (int64x2_t)x, 0x34uLL));
  }
  else
  {
    v4 = vsraq_n_s64(vdupq_n_s64(0xFFFFFFFFFFFFFC01), (int64x2_t)x, 0x34uLL);
  }
  v6 = (float64x2_t)vorrq_s8(vandq_s8((int8x16_t)x, (int8x16_t)vdupq_n_s64(0xFFFFFFFFFFFFFuLL)), (int8x16_t)vdupq_n_s64(0x4070000000000000uLL));
  v7.i64[0] = -256;
  v7.i64[1] = -256;
  v8 = (float64x2_t)vaddq_s64(vcvtnq_s64_f64(v6), v7);
  v9 = v8.f64[1];
  v10 = v8.f64[0];
  *(_QWORD *)&v8.f64[0] = qword_1DEE838A0[*(_QWORD *)&v8.f64[0]];
  *(_QWORD *)&v8.f64[1] = qword_1DEE838A0[*(_QWORD *)&v8.f64[1]];
  v7.i64[0] = qword_1DEE840C0[*(_QWORD *)&v10];
  v7.i64[1] = qword_1DEE840C0[*(_QWORD *)&v9];
  __asm { FMOV            V5.2D, #-1.0 }
  v16 = vmlaq_f64(_Q5, (float64x2_t)v7, v6);
  v17 = (simd_double2)vaddq_f64(vaddq_f64(v8, vmulq_f64(v16, vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FF71547652B82FEuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xBFE71547652B82FFLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FDEC709DC32988BuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0xBFD71547651DCE47), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FD277801A1AD442uLL), (float64x2_t)vdupq_n_s64(0xBFCEC73806FD15A2), v16), v16), v16), v16),
                              v16))),
                        vcvtq_f64_s64(vsubq_s64(v4, vcgeq_f64((float64x2_t)vdupq_n_s64(0x3F65555555555555uLL), (float64x2_t)v7))));
  if ((v3 & 0x8000000000000000) != 0)
  {
    v18 = (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL);
    return (simd_double2)vbslq_s8((int8x16_t)vcgezq_f64((float64x2_t)x), vbslq_s8((int8x16_t)vceqzq_f64((float64x2_t)x), (int8x16_t)vdupq_n_s64(0xFFF0000000000000), vbslq_s8((int8x16_t)vceqq_f64((float64x2_t)x, v18), (int8x16_t)v18, (int8x16_t)v17)), (int8x16_t)vdupq_n_s64(0x7FF8000000000033uLL));
  }
  return v17;
}

void __sincosf(float __x, float *__sinp, float *__cosp)
{
  __float2 v5;

  v5 = __sincosf_stret(__x);
  *__sinp = v5.__sinval;
  *__cosp = v5.__cosval;
}

void __sincos(double __x, double *__sinp, double *__cosp)
{
  __double2 v5;

  v5 = __sincos_stret(__x);
  *__sinp = v5.__sinval;
  *__cosp = v5.__cosval;
}

void __sincospif (float __x, float *__sinp, float *__cosp)
{
  __float2 v5;

  v5 = __sincospif_stret(__x);
  *__sinp = v5.__sinval;
  *__cosp = v5.__cosval;
}

void __sincospi(double __x, double *__sinp, double *__cosp)
{
  __double2 v5;

  v5 = __sincospi_stret(__x);
  *__sinp = v5.__sinval;
  *__cosp = v5.__cosval;
}

simd_float4 _simd_erf_f4(simd_float4 x)
{
  float v1;
  simd_float4 v2;
  float v4;
  float v5;
  float v6;

  v6 = erff(x.f32[0]);
  v5 = erff(x.f32[1]);
  v4 = erff(x.f32[2]);
  v1 = erff(x.f32[3]);
  v2.i64[0] = __PAIR64__(LODWORD(v5), LODWORD(v6));
  v2.i64[1] = __PAIR64__(LODWORD(v1), LODWORD(v4));
  return v2;
}

simd_float4 _simd_erfc_f4(simd_float4 x)
{
  float v1;
  simd_float4 v2;
  float v4;
  float v5;
  float v6;

  v6 = erfcf(x.f32[0]);
  v5 = erfcf(x.f32[1]);
  v4 = erfcf(x.f32[2]);
  v1 = erfcf(x.f32[3]);
  v2.i64[0] = __PAIR64__(LODWORD(v5), LODWORD(v6));
  v2.i64[1] = __PAIR64__(LODWORD(v1), LODWORD(v4));
  return v2;
}

simd_float4 _simd_tgamma_f4(simd_float4 x)
{
  float v1;
  simd_float4 v2;
  float v4;
  float v5;
  float v6;

  v6 = tgammaf(x.f32[0]);
  v5 = tgammaf(x.f32[1]);
  v4 = tgammaf(x.f32[2]);
  v1 = tgammaf(x.f32[3]);
  v2.i64[0] = __PAIR64__(LODWORD(v5), LODWORD(v6));
  v2.i64[1] = __PAIR64__(LODWORD(v1), LODWORD(v4));
  return v2;
}

simd_float4 _simd_lgamma_f4(simd_float4 x)
{
  float v1;
  simd_float4 v2;
  float v4;
  float v5;
  float v6;

  v6 = lgammaf(x.f32[0]);
  v5 = lgammaf(x.f32[1]);
  v4 = lgammaf(x.f32[2]);
  v1 = lgammaf(x.f32[3]);
  v2.i64[0] = __PAIR64__(LODWORD(v5), LODWORD(v6));
  v2.i64[1] = __PAIR64__(LODWORD(v1), LODWORD(v4));
  return v2;
}

simd_float4 _simd_round_f4(simd_float4 x)
{
  return (simd_float4)vrndaq_f32((float32x4_t)x);
}

simd_float4 _simd_nextafter_f4(simd_float4 x, simd_float4 y)
{
  float v2;
  simd_float4 v3;
  float v5;
  float v6;
  float v7;

  v7 = nextafterf(x.f32[0], y.f32[0]);
  v6 = nextafterf(x.f32[1], y.f32[1]);
  v5 = nextafterf(x.f32[2], y.f32[2]);
  v2 = nextafterf(x.f32[3], y.f32[3]);
  v3.i64[0] = __PAIR64__(LODWORD(v6), LODWORD(v7));
  v3.i64[1] = __PAIR64__(LODWORD(v2), LODWORD(v5));
  return v3;
}

simd_float4 _simd_fma_f4(simd_float4 x, simd_float4 y, simd_float4 z)
{
  return (simd_float4)vmlaq_f32((float32x4_t)z, (float32x4_t)y, (float32x4_t)x);
}

simd_float4 _simd_hypot_f4(simd_float4 x, simd_float4 y)
{
  simd_float4 v2;
  float32x4_t v4;
  uint32x4_t v5;
  simd_float4 v6;
  int v7;
  float v8;
  float v9;
  uint32x4_t v11;
  simd_float4 v12;
  simd_float4 v13;
  simd_float4 v14;
  simd_float4 v15;
  simd_float4 v16;
  simd_float4 v17;
  uint32x4_t v18;

  v2 = y;
  v4 = vmlaq_f32(vmulq_f32((float32x4_t)y, (float32x4_t)y), (float32x4_t)x, (float32x4_t)x);
  v5 = vcgtq_u32((uint32x4_t)vdupq_n_s32(0xBD900000), (uint32x4_t)vaddq_s32((int32x4_t)v4, vdupq_n_s32(0x9F600000)));
  v6 = (simd_float4)vsqrtq_f32(v4);
  if ((vmaxvq_u32(v5) & 0x80000000) != 0)
  {
    v7 = 0;
    v12 = x;
    v13 = v2;
    v11 = v5;
    do
    {
      v18 = v5;
      if (*(_DWORD *)((unint64_t)&v18 & 0xFFFFFFFFFFFFFFF3 | (4 * (v7 & 3))))
      {
        v16 = x;
        v8 = *(float *)((unint64_t)&v16 & 0xFFFFFFFFFFFFFFF3 | (4 * (v7 & 3)));
        v14 = v6;
        v15 = v2;
        v9 = hypotf(v8, *(float *)((unint64_t)&v15 & 0xFFFFFFFFFFFFFFF3 | (4 * (v7 & 3))));
        v5 = v11;
        x = v12;
        v2 = v13;
        v17 = v14;
        *(float *)((unint64_t)&v17 & 0xFFFFFFFFFFFFFFF3 | (4 * (v7 & 3))) = v9;
        v6 = v17;
      }
      ++v7;
    }
    while (v7 != 4);
  }
  return v6;
}

simd_float4 _simd_remainder_f4(simd_float4 x, simd_float4 y)
{
  simd_float4 v2;
  unsigned __int128 v4;
  uint32x4_t v5;
  int8x16_t v6;
  float32x4_t v7;
  uint32x4_t v8;
  float32x4_t v9;
  int8x16_t v10;
  float32x4_t v11;
  simd_float4 v12;
  int v13;
  float v14;
  float v15;
  uint32x4_t v17;
  simd_float4 v18;
  simd_float4 v19;
  simd_float4 v20;
  simd_float4 v21;
  simd_float4 v22;
  simd_float4 v23;
  uint32x4_t v24;

  v2 = y;
  v4 = *(_OWORD *)&y & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL);
  v5.i64[0] = 0x80000000800000;
  v5.i64[1] = 0x80000000800000;
  v6 = vorrq_s8((int8x16_t)vceqq_s32((int32x4_t)v4, vdupq_n_s32(0x7F800000u)), (int8x16_t)vcgtq_u32(v5, (uint32x4_t)v4));
  v7 = vrndxq_f32(vdivq_f32((float32x4_t)x, (float32x4_t)v2));
  v8 = (uint32x4_t)vornq_s8(v6, (int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x4B800000u), vabsq_f32(v7)));
  v9 = vmlsq_f32((float32x4_t)x, (float32x4_t)v2, v7);
  v10.i64[0] = 0x8000000080000000;
  v10.i64[1] = 0x8000000080000000;
  v11.i64[0] = 0x3F0000003F000000;
  v11.i64[1] = 0x3F0000003F000000;
  v12 = (simd_float4)vsubq_f32(v9, (float32x4_t)vandq_s8(vbslq_s8(v10, (int8x16_t)v9, (int8x16_t)v2), (int8x16_t)vcgtq_f32(vabsq_f32(v9), vmulq_f32((float32x4_t)v4, v11))));
  if ((vmaxvq_u32(v8) & 0x80000000) != 0)
  {
    v13 = 0;
    v18 = x;
    v19 = v2;
    v17 = v8;
    do
    {
      v24 = v8;
      if (*(_DWORD *)((unint64_t)&v24 & 0xFFFFFFFFFFFFFFF3 | (4 * (v13 & 3))))
      {
        v22 = x;
        v14 = *(float *)((unint64_t)&v22 & 0xFFFFFFFFFFFFFFF3 | (4 * (v13 & 3)));
        v20 = v12;
        v21 = v2;
        v15 = remainderf(v14, *(float *)((unint64_t)&v21 & 0xFFFFFFFFFFFFFFF3 | (4 * (v13 & 3))));
        v8 = v17;
        x = v18;
        v2 = v19;
        v23 = v20;
        *(float *)((unint64_t)&v23 & 0xFFFFFFFFFFFFFFF3 | (4 * (v13 & 3))) = v15;
        v12 = v23;
      }
      ++v13;
    }
    while (v13 != 4);
  }
  return v12;
}

simd_float4 _simd_fmod_f4(simd_float4 x, simd_float4 y)
{
  simd_float4 v2;
  int8x16_t v3;
  int8x16_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  uint32x4_t v8;
  float32x4_t v9;
  simd_float4 v10;
  int v11;
  float v12;
  float v13;
  uint32x4_t v15;
  float32x4_t v16;
  simd_float4 v17;
  simd_float4 v18;
  float32x4_t v19;
  simd_float4 v20;
  simd_float4 v21;
  uint32x4_t v22;

  v2 = x;
  v3.i64[0] = 0x8000000080000000;
  v3.i64[1] = 0x8000000080000000;
  v4 = vandq_s8((int8x16_t)x, v3);
  v5 = vdivq_f32((float32x4_t)x, (float32x4_t)y);
  v6 = (float32x4_t)veorq_s8(v4, (int8x16_t)y);
  y.i64[0] &= 0x7FFFFFFF7FFFFFFFuLL;
  y.i32[2] &= ~0x80000000;
  y.i32[3] &= ~0x80000000;
  v7 = vrndq_f32(v5);
  v8 = (uint32x4_t)vornq_s8((int8x16_t)vceqq_s32((int32x4_t)y, vdupq_n_s32(0x7F800000u)), (int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x4B800000u), vabsq_f32(v7)));
  v9 = vmlsq_f32((float32x4_t)(*(_OWORD *)&x & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), v6, v7);
  v10 = (simd_float4)vorrq_s8(v4, (int8x16_t)vaddq_f32(v9, (float32x4_t)vandq_s8((int8x16_t)y, (int8x16_t)vcltzq_f32(v9))));
  if ((vmaxvq_u32(v8) & 0x80000000) != 0)
  {
    v11 = 0;
    v16 = v6;
    v17 = v2;
    v15 = v8;
    do
    {
      v22 = v8;
      if (*(_DWORD *)((unint64_t)&v22 & 0xFFFFFFFFFFFFFFF3 | (4 * (v11 & 3))))
      {
        v20 = v2;
        v12 = *(float *)((unint64_t)&v20 & 0xFFFFFFFFFFFFFFF3 | (4 * (v11 & 3)));
        v18 = v10;
        v19 = v6;
        v13 = fmodf(v12, *(float *)((unint64_t)&v19 & 0xFFFFFFFFFFFFFFF3 | (4 * (v11 & 3))));
        v8 = v15;
        v6 = v16;
        v2 = v17;
        v21 = v18;
        *(float *)((unint64_t)&v21 & 0xFFFFFFFFFFFFFFF3 | (4 * (v11 & 3))) = v13;
        v10 = v21;
      }
      ++v11;
    }
    while (v11 != 4);
  }
  return v10;
}

simd_double2 _simd_exp2_d2(simd_double2 x)
{
  float64x2_t v1;
  float64x2_t v2;
  float64x2_t v3;
  int64x2_t v4;
  float64x2_t v5;
  int8x16_t v6;
  float64x2_t v7;

  v1 = vminq_f64(vmaxq_f64((float64x2_t)x, (float64x2_t)vdupq_n_s64(0xC090D80000000000)), (float64x2_t)vdupq_n_s64(0x4090000000000000uLL));
  v2 = vrndmq_f64(vmulq_f64(v1, (float64x2_t)vdupq_n_s64(0x4060000000000000uLL)));
  v3 = vmlaq_f64(v1, (float64x2_t)vdupq_n_s64(0xBF80000000000000), v2);
  v4 = vcvtq_s64_f64(v2);
  v5 = (float64x2_t)vandq_s8((int8x16_t)v4, (int8x16_t)vdupq_n_s64(0x7FuLL));
  v6 = (int8x16_t)vcgtq_s64(vdupq_n_s64(0xFFFFFFFFFFFE0100), v4);
  *(_QWORD *)&v5.f64[0] = qword_1DEE848E0[*(_QWORD *)&v5.f64[0]];
  *(_QWORD *)&v5.f64[1] = qword_1DEE848E0[*(_QWORD *)&v5.f64[1]];
  v7 = vmulq_f64(vmlaq_f64(v5, v5, vmulq_f64(v3, vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FE62E42FEFA39EFuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FCEBFBDFF82BDA7uLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FAC6B08D78310B7uLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3F83B2A8ABDA3E41uLL), (float64x2_t)vdupq_n_s64(0x3F55E52272DFDAA6uLL), v3), v3), v3), v3))), (float64x2_t)vshlq_n_s64(
                        (int64x2_t)vbslq_s8(v6, (int8x16_t)vsraq_n_s64(vdupq_n_s64(0x7FEuLL), v4, 7uLL), (int8x16_t)vsraq_n_s64(vdupq_n_s64(0x3FFuLL), v4, 7uLL)), 0x34uLL));
  return (simd_double2)vbslq_s8(v6, (int8x16_t)vmulq_f64(v7, (float64x2_t)vdupq_n_s64(0x8000000000000uLL)), (int8x16_t)v7);
}

simd_double2 _simd_exp_d2(simd_double2 x)
{
  float64x2_t v1;
  float64x2_t v2;
  float64x2_t v3;
  int64x2_t v9;
  int8x16_t v10;
  int8x16_t v11;
  float64x2_t v12;
  float64x2_t v13;

  v1 = vminq_f64(vmaxq_f64((float64x2_t)x, (float64x2_t)vdupq_n_s64(0xC0874910D52D3052)), (float64x2_t)vdupq_n_s64(0x40862E42FEFA39F0uLL));
  v2 = vrndmq_f64(vmulq_f64(v1, (float64x2_t)vdupq_n_s64(0x40671547652B82FDuLL)));
  v3 = vmlaq_f64(vmlaq_f64(v1, (float64x2_t)vdupq_n_s64(0xBF762E4000000000), v2), (float64x2_t)vdupq_n_s64(0xBE47F7D1CF79ABCALL), v2);
  __asm { FMOV            V2.2D, #1.0 }
  v9 = vcvtq_s64_f64(v2);
  v10 = vandq_s8((int8x16_t)v9, (int8x16_t)vdupq_n_s64(0x7FuLL));
  v11 = (int8x16_t)vcgtq_s64(vdupq_n_s64(0xFFFFFFFFFFFE0100), v9);
  v12 = vmulq_f64(v3, vmlaq_f64(_Q2, vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FDFFFFFFFFFFE1FuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FC55555555553F0uLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FA55555CA407CCBuLL), (float64x2_t)vdupq_n_s64(0x3F8111116E99AC77uLL), v3), v3), v3), v3));
  *(_QWORD *)&_Q2.f64[0] = qword_1DEE848E0[v10.i64[0]];
  *(_QWORD *)&_Q2.f64[1] = qword_1DEE848E0[v10.i64[1]];
  v13 = vmulq_f64(vmlaq_f64(_Q2, _Q2, v12), (float64x2_t)vshlq_n_s64((int64x2_t)vbslq_s8(v11, (int8x16_t)vsraq_n_s64(vdupq_n_s64(0x7FEuLL), v9, 7uLL), (int8x16_t)vsraq_n_s64(vdupq_n_s64(0x3FFuLL), v9, 7uLL)), 0x34uLL));
  return (simd_double2)vbslq_s8(v11, (int8x16_t)vmulq_f64(v13, (float64x2_t)vdupq_n_s64(0x8000000000000uLL)), (int8x16_t)v13);
}

simd_double2 _simd_exp10_d2(simd_double2 x)
{
  float64x2_t v1;
  float64x2_t v2;
  float64x2_t v3;
  int64x2_t v4;
  float64x2_t v5;
  int8x16_t v6;
  float64x2_t v7;

  v1 = vminq_f64(vmaxq_f64((float64x2_t)x, (float64x2_t)vdupq_n_s64(0xC07439B746E36B53)), (float64x2_t)vdupq_n_s64(0x40734413509F79FFuLL));
  v2 = vrndmq_f64(vmulq_f64(v1, (float64x2_t)vdupq_n_s64(0x407A934F0979A371uLL)));
  v3 = vmlaq_f64(vmlaq_f64(v1, (float64x2_t)vdupq_n_s64(0xBF63441000000000), v2), (float64x2_t)vdupq_n_s64(0xBE3A84FBCFF79890), v2);
  v4 = vcvtq_s64_f64(v2);
  v5 = (float64x2_t)vandq_s8((int8x16_t)v4, (int8x16_t)vdupq_n_s64(0x7FuLL));
  v6 = (int8x16_t)vcgtq_s64(vdupq_n_s64(0xFFFFFFFFFFFE0100), v4);
  *(_QWORD *)&v5.f64[0] = qword_1DEE848E0[*(_QWORD *)&v5.f64[0]];
  *(_QWORD *)&v5.f64[1] = qword_1DEE848E0[*(_QWORD *)&v5.f64[1]];
  v7 = vmulq_f64(vmlaq_f64(v5, v5, vmulq_f64(v3, vmlaq_f64((float64x2_t)vdupq_n_s64(0x40026BB1BBB55515uLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x40053524C73CD20AuLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x4000470591E2BC10uLL), vmlaq_f64((float64x2_t)vdupq_n_s64(0x3FF2BD77B840F0C0uLL), (float64x2_t)vdupq_n_s64(0x3FE1427C87C70ABEuLL), v3), v3), v3), v3))), (float64x2_t)vshlq_n_s64(
                        (int64x2_t)vbslq_s8(v6, (int8x16_t)vsraq_n_s64(vdupq_n_s64(0x7FEuLL), v4, 7uLL), (int8x16_t)vsraq_n_s64(vdupq_n_s64(0x3FFuLL), v4, 7uLL)), 0x34uLL));
  return (simd_double2)vbslq_s8(v6, (int8x16_t)vmulq_f64(v7, (float64x2_t)vdupq_n_s64(0x8000000000000uLL)), (int8x16_t)v7);
}

simd_float4 _simd_expm1_f4(simd_float4 x)
{
  float32x4_t v1;
  int32x4_t v2;
  int32x4_t v3;
  int8x16_t v4;
  int8x16_t v5;
  int8x16_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  int8x16_t v12;
  int8x16_t v13;

  v1 = vminq_f32(vmaxq_f32((float32x4_t)x, (float32x4_t)vdupq_n_s32(0xC2CE8ED0)), (float32x4_t)vdupq_n_s32(0x42B17218u));
  v2 = vcvtnq_s32_f32(vmulq_f32(v1, (float32x4_t)vdupq_n_s32(0x3FB8AA3Bu)));
  v3.i64[0] = 0x100000001;
  v3.i64[1] = 0x100000001;
  v4 = (int8x16_t)vcgtq_s32(v3, (int32x4_t)v1);
  v5.i64[0] = 0x7E0000007ELL;
  v5.i64[1] = 0x7E0000007ELL;
  v6.i64[0] = 0xA0000000A0;
  v6.i64[1] = 0xA0000000A0;
  v7 = (float32x4_t)vshlq_n_s32(vaddq_s32((int32x4_t)vbslq_s8(v4, v6, v5), v2), 0x17uLL);
  v8 = vcvtq_f32_s32(v2);
  v9 = vmlaq_f32(vmlaq_f32(v1, (float32x4_t)vdupq_n_s32(0xBF318000), v8), (float32x4_t)vdupq_n_s32(0x395E8083u), v8);
  v10.i64[0] = 0x3F0000003F000000;
  v10.i64[1] = 0x3F0000003F000000;
  v11 = vcvtq_f32_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqzq_f32(v8)));
  v12.i64[0] = 0x4000000040000000;
  v12.i64[1] = 0x4000000040000000;
  v13.i64[0] = 0x2F0000002F000000;
  v13.i64[1] = 0x2F0000002F000000;
  return (simd_float4)vaddq_f32(vmulq_f32(vmulq_f32(vsubq_f32(vmlaq_f32(v9, vmulq_f32(v9, v9), vmlaq_f32(v10, vmlaq_f32((float32x4_t)vdupq_n_s32(0x3E2AAAAAu), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3D2AA9C1u), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3C088908u), vmlaq_f32((float32x4_t)vdupq_n_s32(0x3AB743CEu), (float32x4_t)vdupq_n_s32(0x39506967u), v9), v9),
                                      v9),
                                    v9),
                                  v9)),
                              v11),
                            v7),
                          (float32x4_t)vbslq_s8(v4, v13, v12)),
                        v11);
}

uint64_t __muldc3()
{
  return MEMORY[0x1E0C86830]();
}

