@implementation VKRunningCurve

- (VKRunningCurve)init
{
  VKRunningCurve *v2;
  VKRunningCurve *v3;
  VKRunningCurve *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VKRunningCurve;
  v2 = -[VKRunningCurve init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VKRunningCurve reset](v2, "reset");
    v4 = v3;
  }

  return v3;
}

- (void)reset
{
  self->_t0 = -1.0;
  self->_t1 = -1.0;
  self->_tu = -1.0;
  self->_mbValid = 0;
}

- (void)appendPosition:()Matrix<double coordinate:()3 atTime:(1>)a3
{
  double v5;
  float64x2_t *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  long double v13;
  long double v14;
  long double v15;
  long double v16;
  long double v17;
  long double v18;
  long double v19;
  double v20;
  long double v21;
  long double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v38;
  double tu;
  _BOOL4 hasValue;
  double v42;
  double v43;
  double v44;
  long double v45;
  long double v46;
  long double v47;
  long double v48;
  long double v49;
  long double v50;
  long double v51;
  double v52;
  long double v53;
  long double v54;
  float64x2_t v55;
  float64x2_t v56;
  float64x2_t v57;
  float64x2_t v58;
  double v59;
  float64x2_t v62;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  float64x2_t v75;
  float64x2_t v77;
  float64x2_t v80;
  uint64_t v83;
  double distance;

  v5 = a3._e[2];
  if (self->_t0 >= 0.0)
  {
    v7 = (float64x2_t *)self->_mb.mb[1];
    if (self->_t1 >= 0.0)
    {
      tu = self->_tu;
      if (tu >= 0.0)
      {
        hasValue = self->_p0.position._hasValue;
        if (self->_pu.position._hasValue)
        {
          *(_OWORD *)self->_p0.position._value.data = *(_OWORD *)self->_pu.position._value.data;
          self->_p0.distance = self->_pu.distance;
          if (!hasValue)
            self->_p0.position._hasValue = 1;
        }
        else if (self->_p0.position._hasValue)
        {
          self->_p0.position._hasValue = 0;
        }
        *(_OWORD *)self->_p0.tangent._e = *(_OWORD *)self->_pu.tangent._e;
        *(_OWORD *)&self->_p0.tangent._e[2] = *(_OWORD *)&self->_pu.tangent._e[2];
        *(_QWORD *)self->_anon_48 = *(_QWORD *)self->_anon_f8;
        self->_anon_48[8] = self->_anon_f8[8];
        self->_t0 = tu;
      }
      self->_t1 = a5;
      if (!self->_p1.position._hasValue)
        self->_p1.position._hasValue = 1;
      self->_p1.position._value.type = a3._e[0];
      self->_p1.coordinate = *(PolylineCoordinate *)&a3._e[1];
      self->_p1.distance = v5;
      *(PolylineCoordinate *)&self->_p1.tangent._e[0] = a4;
      v42 = *(double *)&self->_p0.coordinate;
      v43 = v5 - self->_p0.distance;
      v44 = sqrt((a3._e[0] - self->_p0.position._value.type) * (a3._e[0] - self->_p0.position._value.type)+ (a3._e[1] - v42) * (a3._e[1] - v42)+ v43 * v43);
      v45 = exp(v42 * 6.28318531 + -3.14159265);
      v46 = atan(v45) * 114.591559 + -90.0;
      v47 = cos(v46 * 0.034906585) * -559.82 + 111132.92;
      v48 = v47 + cos(v46 * 0.0698131701) * 1.175;
      v49 = v48 + cos(v46 * 0.104719755) * -0.0023;
      v50 = v46 * 0.00872664626;
      v51 = tan(v46 * 0.00872664626 + 0.78103484);
      v52 = log(v51);
      v53 = tan(v50 + 0.789761487);
      v54 = v49 * v44 / fabs((log(v53) - v52) * 0.159154943);
      self->_anon_a0[8] = v54 > 1.0;
      if (v54 > 1.0)
      {
        v55 = *(float64x2_t *)self->_p1.position._value.data;
        v56 = *(float64x2_t *)self->_p0.position._value.data;
        v57 = vsubq_f64(v55, v56);
        v58 = vmulq_f64(v57, (float64x2_t)vdupq_n_s64(0x3F50624DD2F1A9FCuLL));
        v59 = v43 * 0.001;
        *(float64x2_t *)&self->_p1.tangent._e[2] = v58;
        *(double *)self->_anon_a0 = v43 * 0.001;
        self->_mbValid = 0;
        if (!self->_anon_48[8])
          return;
        _Q3 = *(float64x2_t *)&self->_p1.coordinate.index;
        _Q2 = *(float64x2_t *)&self->_p0.coordinate.index;
        v62 = vsubq_f64(_Q3, _Q2);
        _Q7 = vmulq_f64(v62, v62);
        v64 = sqrt(vaddq_f64(vmlaq_f64(_Q7, v57, v57), (float64x2_t)vdupq_laneq_s64((int64x2_t)_Q7, 1)).f64[0]);
        _Q7.f64[0] = self->_p0.tangent._e[2];
        v65 = *(double *)&self->_p0.tangentValid;
        v66 = *(double *)self->_anon_48;
        v67 = sqrt(_Q7.f64[0] * _Q7.f64[0] + v65 * v65 + v66 * v66);
        v68 = v64 * 0.5;
        _D21 = 3.0;
        v70 = fmin(v67 * 0.333333333, v68) * 3.0 / v67;
        _Q7.f64[0] = v70 * _Q7.f64[0];
        v71 = v70 * v65;
        v72 = v70 * v66;
        self->_p0.tangent._e[2] = _Q7.f64[0];
        *(double *)&self->_p0.tangentValid = v71;
        *(double *)self->_anon_48 = v72;
        _Q7.f64[0] = sqrt(vaddvq_f64(vmulq_f64(v58, v58)) + v59 * v59);
        v73 = fmin(_Q7.f64[0] * 0.333333333, v68) * 3.0 / _Q7.f64[0];
        v74 = v73 * v59;
        v75 = vmulq_n_f64(v58, v73);
        *(float64x2_t *)&self->_p1.tangent._e[2] = v75;
        *(double *)self->_anon_a0 = v74;
        _Q7.f64[0] = -2.0;
        __asm { FMLA            D6, D7, V2.D[1] }
        v77 = *(float64x2_t *)&self->_p0.tangent._e[2];
        __asm
        {
          FMOV            V16.2D, #-3.0
          FMOV            V18.2D, #3.0
        }
        v80 = vmlaq_f64(vmulq_f64(v56, _Q16), _Q18, v55);
        __asm
        {
          FMOV            V18.2D, #-2.0
          FMLA            D19, D21, V3.D[1]
        }
        *(float64x2_t *)&self->_mb.mb[0][0] = vaddq_f64(vsubq_f64(v77, vmlaq_f64(vaddq_f64(v55, v55), _Q18, v56)), v75);
        self->_mb.mb[0][2] = v72 - _D6 + v74;
        *v7 = vsubq_f64(vsubq_f64(v80, vaddq_f64(v77, v77)), v75);
        self->_mb.mb[1][2] = _D19 - (v72 + v72) - v74;
        *(float64x2_t *)&self->_mb.mb[2][0] = v77;
        self->_mb.mb[2][2] = v72;
        *(float64x2_t *)&self->_mb.mb[3][0] = v56;
        self->_mb.mb[3][2] = _Q2.f64[1];
        goto LABEL_23;
      }
      v83 = *(_QWORD *)self->_anon_48;
      self->_anon_a0[8] = self->_anon_48[8];
      *(_OWORD *)&self->_p1.tangent._e[2] = *(_OWORD *)&self->_p0.tangent._e[2];
      *(_QWORD *)self->_anon_a0 = v83;
    }
    else
    {
      self->_t1 = a5;
      if (!self->_p1.position._hasValue)
        self->_p1.position._hasValue = 1;
      self->_p1.position._value.type = a3._e[0];
      self->_p1.coordinate = *(PolylineCoordinate *)&a3._e[1];
      self->_p1.distance = a3._e[2];
      *(PolylineCoordinate *)&self->_p1.tangent._e[0] = a4;
      v8 = *(double *)&self->_p0.coordinate;
      v9 = a3._e[0] - self->_p0.position._value.type;
      v10 = a3._e[1] - v8;
      distance = self->_p0.distance;
      v11 = a3._e[2] - distance;
      v12 = sqrt(v9 * v9 + v10 * v10 + v11 * v11);
      v13 = exp(v8 * 6.28318531 + -3.14159265);
      v14 = atan(v13) * 114.591559 + -90.0;
      v15 = cos(v14 * 0.034906585) * -559.82 + 111132.92;
      v16 = v15 + cos(v14 * 0.0698131701) * 1.175;
      v17 = v16 + cos(v14 * 0.104719755) * -0.0023;
      v18 = v14 * 0.00872664626;
      v19 = tan(v14 * 0.00872664626 + 0.78103484);
      v20 = log(v19);
      v21 = tan(v18 + 0.789761487);
      v22 = v17 * v12 / fabs((log(v21) - v20) * 0.159154943);
      self->_anon_a0[8] = v22 > 1.0;
      self->_anon_48[8] = v22 > 1.0;
      if (v22 > 1.0)
      {
        v23 = sqrt(v9 * 0.001 * (v9 * 0.001) + v10 * 0.001 * (v10 * 0.001) + v11 * 0.001 * (v11 * 0.001));
        v24 = fmin(v23 * 0.333333333, v12 * 0.5);
        v25 = v24 * 3.0 * (1.0 / v23 * (v9 * 0.001));
        v26 = v24 * 3.0 * (1.0 / v23 * (v10 * 0.001));
        v27 = v24 * 3.0 * (1.0 / v23 * (v11 * 0.001));
        self->_p0.tangent._e[2] = v25;
        *(double *)&self->_p0.tangentValid = v26;
        *(double *)self->_anon_48 = v27;
        self->_p1.tangent._e[2] = v25;
        *(double *)&self->_p1.tangentValid = v26;
        *(double *)self->_anon_a0 = v27;
        v28 = *(float64x2_t *)self->_p0.position._value.data;
        v29 = *(float64x2_t *)self->_p1.position._value.data;
        v30 = *(float64x2_t *)&self->_p0.tangent._e[2];
        v31 = *(float64x2_t *)&self->_p1.tangent._e[2];
        __asm
        {
          FMOV            V7.2D, #-3.0
          FMOV            V16.2D, #3.0
        }
        v38 = vmlaq_f64(vmulq_f64(v28, _Q7), _Q16, v29);
        __asm { FMOV            V16.2D, #-2.0 }
        *(float64x2_t *)&self->_mb.mb[0][0] = vaddq_f64(vsubq_f64(v30, vmlaq_f64(vaddq_f64(v29, v29), _Q16, v28)), v31);
        self->_mb.mb[0][2] = v27 - (v5 + v5 + distance * -2.0) + v27;
        *v7 = vsubq_f64(vsubq_f64(v38, vaddq_f64(v30, v30)), v31);
        self->_mb.mb[1][2] = distance * -3.0 + v5 * 3.0 - (v27 + v27) - v27;
        *(float64x2_t *)&self->_mb.mb[2][0] = v30;
        self->_mb.mb[2][2] = v27;
        *(float64x2_t *)&self->_mb.mb[3][0] = v28;
        self->_mb.mb[3][2] = distance;
LABEL_23:
        self->_mbValid = 1;
        return;
      }
    }
    self->_mbValid = 0;
    return;
  }
  self->_t0 = a5;
  if (!self->_p0.position._hasValue)
    self->_p0.position._hasValue = 1;
  self->_p0.position._value.type = a3._e[0];
  self->_p0.coordinate = *(PolylineCoordinate *)&a3._e[1];
  self->_p0.distance = a3._e[2];
  *(PolylineCoordinate *)&self->_p0.tangent._e[0] = a4;
  self->_anon_48[8] = 0;
}

- (BOOL)hasStateAtTime:(double)a3
{
  double t0;
  double t1;

  t0 = self->_t0;
  if (t0 < 0.0)
    return 0;
  t1 = self->_t1;
  return t1 >= 0.0 && (self->_tu - t0) / (t1 - t0) <= 1.0;
}

- ($9C1B066A8D3A7DCAD1653419A6271DE1)stateAtTime:(SEL)a3
{
  double var2;
  __int128 v5;
  double v6;
  int v7;
  _BOOL4 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double type;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _BOOL4 v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  BOOL v33;
  _BOOL4 var4;
  _OWORD *p_var2;
  char index;
  __int128 v37;
  __int128 v38;

  *(_OWORD *)self[3].var3._e = 0u;
  *(_OWORD *)&self[3].var3._e[2] = 0u;
  var2 = self[1].var2;
  if (var2 >= 0.0)
  {
    self[4].var0._value.type = a4;
    v6 = self[2].var3._e[2];
    if (v6 >= 0.0)
    {
      v9 = (a4 - var2) / (v6 - var2);
      if (v9 >= 1.0)
      {
        v7 = LOBYTE(self[1].var3._e[0]);
        var4 = self[2].var4;
        if (LOBYTE(self[1].var3._e[0]))
        {
          self[3].var0 = *(optional<gm::Matrix<double, 3, 1>> *)&self[1].var3._e[1];
          self[3].var1 = *(PolylineCoordinate *)&self[1].var4;
          if (!var4)
            self[2].var4 = 1;
        }
        else if (self[2].var4)
        {
          self[2].var4 = 0;
        }
        p_var2 = (_OWORD *)&self[3].var2;
        v37 = *(_OWORD *)&self[2].var1.index;
        *(optional<gm::Matrix<double, 3, 1>> *)&self[3].var2 = self[2].var0;
        *(_OWORD *)&self[3].var3._e[1] = v37;
        *(double *)&self[3].var4 = self[2].var3._e[0];
        index = LOBYTE(self[2].var3._e[1]);
LABEL_28:
        self[4].var0._hasValue = index;
        retstr->var0._hasValue = 0;
        if (!v7)
        {
LABEL_30:
          v38 = p_var2[1];
          *(_OWORD *)retstr->var3._e = *p_var2;
          *(_OWORD *)&retstr->var3._e[2] = v38;
          *(_OWORD *)(&retstr->var4 + 1) = *(_OWORD *)((char *)p_var2 + 25);
          return self;
        }
LABEL_29:
        *(optional<gm::Matrix<double, 3, 1>> *)retstr->var0._value.data = self[3].var0;
        *(PolylineCoordinate *)&retstr->var2 = self[3].var1;
        retstr->var0._hasValue = 1;
        goto LABEL_30;
      }
      if (v9 > 0.0)
      {
        if (LOBYTE(self[5].var3._e[2]))
        {
          v10 = v9 * v9 * v9;
          v11 = *(double *)&self[4].var1;
          v12 = self[4].var2;
          v13 = *(double *)&self[5].var1;
          v14 = self[4].var3._e[0];
          v15 = self[4].var3._e[1];
          v17 = *(double *)&self[5].var0._hasValue;
          type = self[5].var0._value.type;
          v18 = self[5].var2 + v11 * v10 + v15 * (v9 * v9) + v17 * v9;
          v19 = self[5].var3._e[1] + v14 * v10;
          v21 = self[4].var3._e[2];
          v20 = *(double *)&self[4].var4;
          v22 = self[5].var3._e[0] + v12 * v10 + v21 * (v9 * v9) + type * v9;
          v23 = v19 + v20 * (v9 * v9) + v13 * v9;
          v24 = self[2].var4;
          if (!self[2].var4)
          {
            v24 = 1;
            self[2].var4 = 1;
          }
          *(double *)&self[3].var0._hasValue = v18;
          self[3].var0._value.type = v22;
          *(double *)&self[3].var1 = v23;
          v25 = v9 * v9 * 3.0;
          v26 = v9 + v9;
          v27 = v17 + v11 * v25 + v15 * v26;
          v28 = type + v12 * v25 + v21 * v26;
          v29 = v13 + v14 * v25 + v20 * v26;
          self[3].var3._e[1] = v27;
          self[3].var3._e[2] = v28;
          v30 = self[1].var3._e[2];
          v31 = *(double *)&self[1].var4;
          v32 = self[1].var3._e[1];
          v33 = !v24;
        }
        else
        {
          v32 = self[1].var3._e[1];
          v30 = self[1].var3._e[2];
          v18 = *(double *)&self->var1 + (v32 - *(double *)&self->var1) * v9;
          v22 = self->var2 + (v30 - self->var2) * v9;
          v31 = *(double *)&self[1].var4;
          v23 = self->var3._e[0] + (v31 - self->var3._e[0]) * v9;
          if (!self[2].var4)
            self[2].var4 = 1;
          v33 = 0;
          *(double *)&self[3].var0._hasValue = v18;
          self[3].var0._value.type = v22;
          *(double *)&self[3].var1 = v23;
          *(_OWORD *)&self[3].var3._e[1] = *(_OWORD *)&self[2].var1.index;
          v29 = self[2].var3._e[0];
        }
        self[3].var2 = *(double *)&self[2].var0._hasValue;
        p_var2 = (_OWORD *)&self[3].var2;
        *(double *)&self[3].var4 = v29;
        self[4].var0._hasValue = LOBYTE(self[2].var3._e[1]);
        self[3].var3._e[0] = sqrt((v32 - v18) * (v32 - v18)+ (v31 - v23) * 0.0000000249532021 * ((v31 - v23) * 0.0000000249532021)+ (v30 - v22) * (v30 - v22));
        retstr->var0._hasValue = 0;
        if (v33)
          goto LABEL_30;
        goto LABEL_29;
      }
      v7 = self->var0._value.data[0];
      v8 = self[2].var4;
      if (self->var0._value.data[0])
      {
        if (self[2].var4)
          goto LABEL_8;
        goto LABEL_20;
      }
    }
    else
    {
      v7 = self->var0._value.data[0];
      v8 = self[2].var4;
      if (self->var0._value.data[0])
      {
        if (self[2].var4)
        {
LABEL_8:
          self[3].var0 = *(optional<gm::Matrix<double, 3, 1>> *)&self->var1.index;
          self[3].var1 = *(PolylineCoordinate *)&self->var3._e[0];
LABEL_23:
          p_var2 = (_OWORD *)&self[3].var2;
          *(_OWORD *)&self[3].var2 = *(_OWORD *)&self->var3._e[1];
          *(_OWORD *)&self[3].var3._e[1] = *(_OWORD *)&self->var4;
          *(double *)&self[3].var4 = self[1].var0._value.type;
          index = self[1].var1.index;
          goto LABEL_28;
        }
LABEL_20:
        self[3].var0 = *(optional<gm::Matrix<double, 3, 1>> *)&self->var1.index;
        self[3].var1 = *(PolylineCoordinate *)&self->var3._e[0];
        self[2].var4 = 1;
        goto LABEL_23;
      }
    }
    if (v8)
      self[2].var4 = 0;
    goto LABEL_23;
  }
  retstr->var0._hasValue = 0;
  if (self[2].var4)
  {
    *(optional<gm::Matrix<double, 3, 1>> *)retstr->var0._value.data = self[3].var0;
    *(PolylineCoordinate *)&retstr->var2 = self[3].var1;
    retstr->var0._hasValue = 1;
  }
  v5 = *(_OWORD *)&self[3].var3._e[1];
  *(_OWORD *)retstr->var3._e = *(_OWORD *)&self[3].var2;
  *(_OWORD *)&retstr->var3._e[2] = v5;
  *(_OWORD *)(&retstr->var4 + 1) = *(_OWORD *)((char *)&self[3].var3._e[2] + 1);
  return self;
}

- (BOOL)courseValid
{
  return self->_courseValid;
}

- (void)setCourseValid:(BOOL)a3
{
  self->_courseValid = a3;
}

- (void).cxx_destruct
{
  if (self->_pu.position._hasValue)
    self->_pu.position._hasValue = 0;
  if (self->_p1.position._hasValue)
    self->_p1.position._hasValue = 0;
  if (self->_p0.position._hasValue)
    self->_p0.position._hasValue = 0;
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_QWORD *)self + 5) = 0xBF80000000000000;
  *((_BYTE *)self + 96) = 0;
  *((_QWORD *)self + 16) = 0xBF80000000000000;
  *((_BYTE *)self + 184) = 0;
  *((_QWORD *)self + 27) = 0xBF80000000000000;
  return self;
}

@end
