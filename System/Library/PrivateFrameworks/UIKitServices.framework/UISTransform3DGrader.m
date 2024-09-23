@implementation UISTransform3DGrader

- (UISTransform3DGrader)init
{
  UISTransform3DGrader *v2;
  UISTransform3DGrader *v3;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UISTransform3DGrader;
  v2 = -[UISTransform3DGrader init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v6 = 0;
    -[UISTransform3DGrader allowRotations:count:](v2, "allowRotations:count:", &v6, 1, 0x3FF0000000000000);
    -[UISTransform3DGrader allowScales:count:](v3, "allowScales:count:", &v5, 1);
    *(_OWORD *)&v3->_allowedShear = xmmword_190895A10;
    *(_QWORD *)&v3->_allowedShift = 10;
    *(_WORD *)&v3->_allowHorizontalFlip = 0;
  }
  return v3;
}

- (void)allowRotations:(const double *)a3 count:(unint64_t)a4
{
  -[UISTransform3DGrader allowRotations:count:lowerMultiplier:lowerConstant:upperMultiplier:upperConstant:](self, "allowRotations:count:lowerMultiplier:lowerConstant:upperMultiplier:upperConstant:", a3, a4, 1.0, 0.0, 1.0, 0.0);
}

- (void)allowRotations:(const double *)a3 count:(unint64_t)a4 lowerMultiplier:(double)a5 lowerConstant:(double)a6 upperMultiplier:(double)a7 upperConstant:(double)a8
{
  double *begin;
  uint64_t i;
  double v17;
  int64_t v18;
  BOOL v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  double *value;
  double *end;
  double *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  double *v31;
  uint64_t v32;
  int64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  double *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  double *v43;
  uint64_t v44;

  begin = self->_allowedRotations.__begin_;
  self->_allowedRotations.__end_ = begin;
  if (a4)
  {
    for (i = 0; i != a4; ++i)
    {
      v17 = a3[i];
      v18 = (COERCE__INT64(v17 * a5 + a6) >> 63) & 0x7FFFFFFFFFFFFFFFLL ^ COERCE_UNSIGNED_INT64(v17 * a5 + a6);
      v19 = v18 < 10;
      v20 = v18 - 10;
      if (v19)
        v21 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v21 = 0;
      v22 = v21 ^ v20;
      value = self->_allowedRotations.__end_cap_.__value_;
      if (begin >= value)
      {
        v25 = self->_allowedRotations.__begin_;
        v26 = begin - v25;
        v27 = v26 + 1;
        if ((unint64_t)(v26 + 1) >> 61)
          goto LABEL_43;
        v28 = (char *)value - (char *)v25;
        if (v28 >> 2 > v27)
          v27 = v28 >> 2;
        if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8)
          v29 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v29 = v27;
        if (v29)
        {
          v29 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<double>>(v29);
          v25 = self->_allowedRotations.__begin_;
          begin = self->_allowedRotations.__end_;
        }
        else
        {
          v30 = 0;
        }
        v31 = (double *)(v29 + 8 * v26);
        *(_QWORD *)v31 = v22;
        end = v31 + 1;
        while (begin != v25)
        {
          v32 = *((_QWORD *)begin-- - 1);
          *((_QWORD *)v31-- - 1) = v32;
        }
        value = (double *)(v29 + 8 * v30);
        self->_allowedRotations.__begin_ = v31;
        self->_allowedRotations.__end_ = end;
        self->_allowedRotations.__end_cap_.__value_ = value;
        if (v25)
        {
          operator delete(v25);
          value = self->_allowedRotations.__end_cap_.__value_;
        }
      }
      else
      {
        *(_QWORD *)begin = v22;
        end = begin + 1;
      }
      self->_allowedRotations.__end_ = end;
      v33 = (COERCE__INT64(v17 * a7 + a8) >> 63) & 0x7FFFFFFFFFFFFFFFLL ^ COERCE_UNSIGNED_INT64(v17 * a7 + a8);
      v34 = v33 + 10;
      if (v33 >= -10)
        v35 = 0;
      else
        v35 = 0x7FFFFFFFFFFFFFFFLL;
      v36 = v35 ^ v34;
      if (end >= value)
      {
        v37 = self->_allowedRotations.__begin_;
        v38 = end - v37;
        v39 = v38 + 1;
        if ((unint64_t)(v38 + 1) >> 61)
LABEL_43:
          abort();
        v40 = (char *)value - (char *)v37;
        if (v40 >> 2 > v39)
          v39 = v40 >> 2;
        if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF8)
          v41 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v41 = v39;
        if (v41)
        {
          v41 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<double>>(v41);
          v37 = self->_allowedRotations.__begin_;
          end = self->_allowedRotations.__end_;
        }
        else
        {
          v42 = 0;
        }
        v43 = (double *)(v41 + 8 * v38);
        *(_QWORD *)v43 = v36;
        begin = v43 + 1;
        while (end != v37)
        {
          v44 = *((_QWORD *)end-- - 1);
          *((_QWORD *)v43-- - 1) = v44;
        }
        self->_allowedRotations.__begin_ = v43;
        self->_allowedRotations.__end_ = begin;
        self->_allowedRotations.__end_cap_.__value_ = (double *)(v41 + 8 * v42);
        if (v37)
          operator delete(v37);
      }
      else
      {
        *(_QWORD *)end = v36;
        begin = end + 1;
      }
      self->_allowedRotations.__end_ = begin;
    }
  }
}

- (void)allowScales:(const double *)a3 count:(unint64_t)a4
{
  -[UISTransform3DGrader allowScales:count:lowerMultiplier:lowerConstant:upperMultiplier:upperConstant:](self, "allowScales:count:lowerMultiplier:lowerConstant:upperMultiplier:upperConstant:", a3, a4, 1.0, 0.0, 1.0, 0.0);
}

- (void)allowScales:(const double *)a3 count:(unint64_t)a4 lowerMultiplier:(double)a5 lowerConstant:(double)a6 upperMultiplier:(double)a7 upperConstant:(double)a8
{
  double *begin;
  uint64_t i;
  double v17;
  int64_t v18;
  BOOL v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  double *value;
  double *end;
  double *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  double *v31;
  uint64_t v32;
  int64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  double *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  double *v43;
  uint64_t v44;

  begin = self->_allowedScales.__begin_;
  self->_allowedScales.__end_ = begin;
  if (a4)
  {
    for (i = 0; i != a4; ++i)
    {
      v17 = a3[i];
      v18 = (COERCE__INT64(v17 * a5 + a6) >> 63) & 0x7FFFFFFFFFFFFFFFLL ^ COERCE_UNSIGNED_INT64(v17 * a5 + a6);
      v19 = v18 < 10;
      v20 = v18 - 10;
      if (v19)
        v21 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v21 = 0;
      v22 = v21 ^ v20;
      value = self->_allowedScales.__end_cap_.__value_;
      if (begin >= value)
      {
        v25 = self->_allowedScales.__begin_;
        v26 = begin - v25;
        v27 = v26 + 1;
        if ((unint64_t)(v26 + 1) >> 61)
          goto LABEL_43;
        v28 = (char *)value - (char *)v25;
        if (v28 >> 2 > v27)
          v27 = v28 >> 2;
        if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8)
          v29 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v29 = v27;
        if (v29)
        {
          v29 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<double>>(v29);
          v25 = self->_allowedScales.__begin_;
          begin = self->_allowedScales.__end_;
        }
        else
        {
          v30 = 0;
        }
        v31 = (double *)(v29 + 8 * v26);
        *(_QWORD *)v31 = v22;
        end = v31 + 1;
        while (begin != v25)
        {
          v32 = *((_QWORD *)begin-- - 1);
          *((_QWORD *)v31-- - 1) = v32;
        }
        value = (double *)(v29 + 8 * v30);
        self->_allowedScales.__begin_ = v31;
        self->_allowedScales.__end_ = end;
        self->_allowedScales.__end_cap_.__value_ = value;
        if (v25)
        {
          operator delete(v25);
          value = self->_allowedScales.__end_cap_.__value_;
        }
      }
      else
      {
        *(_QWORD *)begin = v22;
        end = begin + 1;
      }
      self->_allowedScales.__end_ = end;
      v33 = (COERCE__INT64(v17 * a7 + a8) >> 63) & 0x7FFFFFFFFFFFFFFFLL ^ COERCE_UNSIGNED_INT64(v17 * a7 + a8);
      v34 = v33 + 10;
      if (v33 >= -10)
        v35 = 0;
      else
        v35 = 0x7FFFFFFFFFFFFFFFLL;
      v36 = v35 ^ v34;
      if (end >= value)
      {
        v37 = self->_allowedScales.__begin_;
        v38 = end - v37;
        v39 = v38 + 1;
        if ((unint64_t)(v38 + 1) >> 61)
LABEL_43:
          abort();
        v40 = (char *)value - (char *)v37;
        if (v40 >> 2 > v39)
          v39 = v40 >> 2;
        if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF8)
          v41 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v41 = v39;
        if (v41)
        {
          v41 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<double>>(v41);
          v37 = self->_allowedScales.__begin_;
          end = self->_allowedScales.__end_;
        }
        else
        {
          v42 = 0;
        }
        v43 = (double *)(v41 + 8 * v38);
        *(_QWORD *)v43 = v36;
        begin = v43 + 1;
        while (end != v37)
        {
          v44 = *((_QWORD *)end-- - 1);
          *((_QWORD *)v43-- - 1) = v44;
        }
        self->_allowedScales.__begin_ = v43;
        self->_allowedScales.__end_ = begin;
        self->_allowedScales.__end_cap_.__value_ = (double *)(v41 + 8 * v42);
        if (v37)
          operator delete(v37);
      }
      else
      {
        *(_QWORD *)end = v36;
        begin = end + 1;
      }
      self->_allowedScales.__end_ = begin;
    }
  }
}

- (void)allowShear:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  v3 = (*(uint64_t *)&a3 >> 63) & 0x7FFFFFFFFFFFFFFFLL ^ *(_QWORD *)&a3;
  v4 = v3 + 0x3D00000000000000;
  v5 = v3 < (uint64_t)0xC300000000000000;
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (!v5)
    v6 = 0;
  *(_QWORD *)&self->_allowedShear = v6 ^ v4;
}

- (void)allowTranslation:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  v3 = (*(uint64_t *)&a3 >> 63) & 0x7FFFFFFFFFFFFFFFLL ^ *(_QWORD *)&a3;
  v4 = v3 + 10;
  v5 = v3 < -10;
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (!v5)
    v6 = 0;
  *(_QWORD *)&self->_allowedTranslation = v6 ^ v4;
}

- (void)allowShift:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  v3 = (*(uint64_t *)&a3 >> 63) & 0x7FFFFFFFFFFFFFFFLL ^ *(_QWORD *)&a3;
  v4 = v3 + 10;
  v5 = v3 < -10;
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (!v5)
    v6 = 0;
  *(_QWORD *)&self->_allowedShift = v6 ^ v4;
}

- (void)allowHorizontalFlip:(BOOL)a3
{
  self->_allowHorizontalFlip = a3;
}

- (void)allowVerticalFlip:(BOOL)a3
{
  self->_allowVerticalFlip = a3;
}

- (_UISTransform3DGrade)_gradeTransform3D:(SEL)a3
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CGFloat dx;
  CGFloat dy;
  unint64_t v14;
  unint64_t v15;
  double *v16;
  double *v17;
  double v18;
  _BOOL4 v19;
  double width;
  double height;
  double v22;
  double v23;
  _BOOL4 v24;
  uint64_t v25;
  CGFloat v26;
  CGFloat v27;
  unint64_t v28;
  CGFloat v29;
  unint64_t v30;
  unint64_t v31;
  double *v32;
  double *v33;
  double v34;
  unint64_t v35;
  double *v36;
  double *v37;
  double v38;
  _UISTransform3DGrade *v39;
  CGVector translation;
  double v41;
  uint64_t v42;
  long double v43;
  unint64_t v44;
  double v45;
  double v47;
  _UISTransform3DGrade *v49;
  CATransform3D v50;
  CGAffineTransform transform;
  CGAffineTransformComponents v52;
  _OWORD v53[8];

  if ((*(_QWORD *)&a4->m11 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(_QWORD *)&a4->m12 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(_QWORD *)&a4->m13 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(_QWORD *)&a4->m14 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(_QWORD *)&a4->m21 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(_QWORD *)&a4->m22 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(_QWORD *)&a4->m23 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(_QWORD *)&a4->m24 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(_QWORD *)&a4->m31 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(_QWORD *)&a4->m32 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(_QWORD *)&a4->m33 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(_QWORD *)&a4->m34 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(_QWORD *)&a4->m41 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(_QWORD *)&a4->m42 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(_QWORD *)&a4->m43 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(_QWORD *)&a4->m44 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    retstr->var0 = 1;
    retstr->var1 = (CGVector)vdupq_n_s64(0x7FF8000000000000uLL);
    return self;
  }
  v49 = self;
  v4 = *(_OWORD *)&a4->m33;
  v53[4] = *(_OWORD *)&a4->m31;
  v53[5] = v4;
  v5 = *(_OWORD *)&a4->m43;
  v53[6] = *(_OWORD *)&a4->m41;
  v53[7] = v5;
  v6 = *(_OWORD *)&a4->m13;
  v53[0] = *(_OWORD *)&a4->m11;
  v53[1] = v6;
  v7 = *(_OWORD *)&a4->m23;
  v53[2] = *(_OWORD *)&a4->m21;
  v53[3] = v7;
  self = (_UISTransform3DGrade *)MEMORY[0x1940103D0](v53, a3);
  if ((self & 1) != 0)
  {
    memset(&v52, 0, sizeof(v52));
    v8 = *(_OWORD *)&a4->m33;
    *(_OWORD *)&v50.m31 = *(_OWORD *)&a4->m31;
    *(_OWORD *)&v50.m33 = v8;
    v9 = *(_OWORD *)&a4->m43;
    *(_OWORD *)&v50.m41 = *(_OWORD *)&a4->m41;
    *(_OWORD *)&v50.m43 = v9;
    v10 = *(_OWORD *)&a4->m13;
    *(_OWORD *)&v50.m11 = *(_OWORD *)&a4->m11;
    *(_OWORD *)&v50.m13 = v10;
    v11 = *(_OWORD *)&a4->m23;
    *(_OWORD *)&v50.m21 = *(_OWORD *)&a4->m21;
    *(_OWORD *)&v50.m23 = v11;
    CATransform3DGetAffineTransform(&transform, &v50);
    CGAffineTransformDecompose(&v52, &transform);
    dx = v49->var1.dx;
    dy = v49->var1.dy;
    if (*(_QWORD *)&dy != *(_QWORD *)&dx)
    {
      v14 = (uint64_t)(*(_QWORD *)&dy - *(_QWORD *)&dx) >> 3;
      dy = v49->var1.dx;
      do
      {
        v15 = v14 >> 1;
        v16 = (double *)(*(_QWORD *)&dy + 8 * (v14 >> 1));
        v18 = *v16;
        v17 = v16 + 1;
        v14 += ~(v14 >> 1);
        if (v18 < v52.rotation)
          dy = *(double *)&v17;
        else
          v14 = v15;
      }
      while (v14);
    }
    v19 = (((uint64_t)(*(_QWORD *)&dy - *(_QWORD *)&dx) >> 3) & 0x8000000000000001) != 1;
    width = v52.scale.width;
    height = v52.scale.height;
    v22 = fabs(v52.scale.width);
    if (LOBYTE(v49[3].var1.dx))
      width = v22;
    v23 = fabs(v52.scale.height);
    if (BYTE1(v49[3].var1.dx))
      height = v23;
    v45 = height;
    v47 = width;
    v24 = _UISNearlyEqual(width, height);
    v25 = (4 * v19) | 8;
    if (v24)
      v25 = 4 * v19;
    v26 = v49[1].var1.dx;
    v27 = v49[1].var1.dy;
    v28 = (uint64_t)(*(_QWORD *)&v27 - *(_QWORD *)&v26) >> 3;
    if (*(_QWORD *)&v27 == *(_QWORD *)&v26)
    {
      if ((v28 & 0x8000000000000001) != 1)
        goto LABEL_47;
    }
    else
    {
      v29 = v49[1].var1.dx;
      v30 = v28;
      do
      {
        v31 = v30 >> 1;
        v32 = (double *)(*(_QWORD *)&v29 + 8 * (v30 >> 1));
        v34 = *v32;
        v33 = v32 + 1;
        v30 += ~(v30 >> 1);
        if (v34 < v47)
          v29 = *(double *)&v33;
        else
          v30 = v31;
      }
      while (v30);
      if ((((uint64_t)(*(_QWORD *)&v29 - *(_QWORD *)&v26) >> 3) & 0x8000000000000001) != 1)
        goto LABEL_47;
      v27 = v49[1].var1.dx;
      do
      {
        v35 = v28 >> 1;
        v36 = (double *)(*(_QWORD *)&v27 + 8 * (v28 >> 1));
        v38 = *v36;
        v37 = v36 + 1;
        v28 += ~(v28 >> 1);
        if (v38 < v45)
          v27 = *(double *)&v37;
        else
          v28 = v35;
      }
      while (v28);
    }
    if ((((uint64_t)(*(_QWORD *)&v27 - *(_QWORD *)&v26) >> 3) & 0x8000000000000001) == 1)
    {
LABEL_48:
      v41 = v49[2].var1.dy;
      if (v49[2].var1.dx >= fabs(v52.horizontalShear))
        v42 = v25;
      else
        v42 = v25 | 0x20;
      v43 = hypot(v52.translation.dx, v52.translation.dy);
      v44 = v42 | 0x40;
      if (v41 >= v43)
        v44 = v42;
      v39 = retstr;
      retstr->var0 = v44;
      translation = v52.translation;
      goto LABEL_54;
    }
LABEL_47:
    v25 |= 0x10uLL;
    goto LABEL_48;
  }
  v39 = retstr;
  retstr->var0 = 2;
  translation = (CGVector)vdupq_n_s64(0x7FF8000000000000uLL);
LABEL_54:
  v39->var1 = translation;
  return self;
}

- (unint64_t)gradeTransform3D:(CATransform3D *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[8];
  unint64_t v9;

  v3 = *(_OWORD *)&a3->m33;
  v8[4] = *(_OWORD *)&a3->m31;
  v8[5] = v3;
  v4 = *(_OWORD *)&a3->m43;
  v8[6] = *(_OWORD *)&a3->m41;
  v8[7] = v4;
  v5 = *(_OWORD *)&a3->m13;
  v8[0] = *(_OWORD *)&a3->m11;
  v8[1] = v5;
  v6 = *(_OWORD *)&a3->m23;
  v8[2] = *(_OWORD *)&a3->m21;
  v8[3] = v6;
  -[UISTransform3DGrader _gradeTransform3D:](self, "_gradeTransform3D:", v8);
  return v9;
}

- (unint64_t)gradeStartTransform3D:(CATransform3D *)a3 endTransform3D:(CATransform3D *)a4
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  double allowedShift;
  long double v15;
  _OWORD v17[8];
  uint64_t v18;
  double v19;
  double v20;
  _OWORD v21[8];
  uint64_t v22;
  double v23;
  double v24;

  v22 = 0;
  v23 = 0.0;
  v24 = 0.0;
  v6 = *(_OWORD *)&a3->m33;
  v21[4] = *(_OWORD *)&a3->m31;
  v21[5] = v6;
  v7 = *(_OWORD *)&a3->m43;
  v21[6] = *(_OWORD *)&a3->m41;
  v21[7] = v7;
  v8 = *(_OWORD *)&a3->m13;
  v21[0] = *(_OWORD *)&a3->m11;
  v21[1] = v8;
  v9 = *(_OWORD *)&a3->m23;
  v21[2] = *(_OWORD *)&a3->m21;
  v21[3] = v9;
  -[UISTransform3DGrader _gradeTransform3D:](self, "_gradeTransform3D:", v21);
  v18 = 0;
  v19 = 0.0;
  v20 = 0.0;
  v10 = *(_OWORD *)&a4->m33;
  v17[4] = *(_OWORD *)&a4->m31;
  v17[5] = v10;
  v11 = *(_OWORD *)&a4->m43;
  v17[6] = *(_OWORD *)&a4->m41;
  v17[7] = v11;
  v12 = *(_OWORD *)&a4->m13;
  v17[0] = *(_OWORD *)&a4->m11;
  v17[1] = v12;
  v13 = *(_OWORD *)&a4->m23;
  v17[2] = *(_OWORD *)&a4->m21;
  v17[3] = v13;
  -[UISTransform3DGrader _gradeTransform3D:](self, "_gradeTransform3D:", v17);
  allowedShift = self->_allowedShift;
  v15 = hypot(v23 - v19, v24 - v20);
  return v18 | v22 | ((unint64_t)(allowedShift < v15) << 7);
}

- (void).cxx_destruct
{
  double *begin;
  double *v4;

  begin = self->_allowedScales.__begin_;
  if (begin)
  {
    self->_allowedScales.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_allowedRotations.__begin_;
  if (v4)
  {
    self->_allowedRotations.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
