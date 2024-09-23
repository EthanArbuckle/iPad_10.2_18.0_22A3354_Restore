@implementation VKFootprint

- (Matrix<double,)nearestGroundPoint
{
  double v2;
  double v3;
  double v4;
  Matrix<double, 3, 1> result;

  v2 = self->_nearestGroundPoint._e[0];
  v3 = self->_nearestGroundPoint._e[1];
  v4 = self->_nearestGroundPoint._e[2];
  result._e[2] = v4;
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (void)computeFromCamera:(id)a3
{
  void *v4;
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
  uint64_t v15;
  uint64_t v16;
  int v17;
  Matrix<double, 3, 1> *cornerGroundPoints;
  float64x2_t *v19;
  double v20;
  float64x2_t *v21;
  double v22;
  double v23;
  double v24;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t *v28;
  double *v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
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
  uint64_t v47;
  VKFootprintConvexHull_struct *p_convexHull;
  uint64_t v49;
  double *e;
  uint64_t v51;
  BOOL v52;
  double v53;
  double v54;
  double v55;
  double *v56;
  double v57;
  double v58;
  double v59;
  double *v60;
  double *v61;
  double v62;
  id v63;

  v63 = a3;
  objc_msgSend(v63, "viewVolume");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (double *)objc_msgSend(v63, "position");
  v6 = *v5;
  v7 = v5[1];
  v8 = v5[2];
  objc_msgSend(v63, "forwardVector");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = objc_msgSend(v4, "corners");
  v16 = 0;
  v17 = 0;
  self->_cornerGroundPointsCount = 0;
  cornerGroundPoints = self->_cornerGroundPoints;
  do
  {
    v19 = (float64x2_t *)(v15 + 24 * *(int *)((char *)&-[VKFootprint computeFromCamera:]::edgeList + v16));
    v20 = v19[1].f64[0];
    v21 = (float64x2_t *)(v15 + 24 * *(int *)((char *)&-[VKFootprint computeFromCamera:]::edgeList + v16 + 4));
    v22 = v21[1].f64[0];
    if (v20 - v22 != 0.0)
    {
      v23 = v22 - v20;
      v24 = -v20 / (v22 - v20);
      if (v24 >= 0.0 && v24 <= 1.0)
      {
        v26 = *v19;
        v27 = vsubq_f64(*v21, *v19);
        v28 = (float64x2_t *)&cornerGroundPoints[v17++];
        self->_cornerGroundPointsCount = v17;
        *v28 = vmlaq_n_f64(v26, v27, v24);
        v28[1].f64[0] = v20 + v24 * v23;
      }
    }
    v16 += 8;
  }
  while (v16 != 96);
  *(_OWORD *)&self->_minDepth = xmmword_19FFB3390;
  self->_maxDistance = 0.0;
  self->_minDistance = 1.79769313e308;
  if (v17 <= 0)
  {
    self->_boundingRect._minimum = (Matrix<double, 2, 1>)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    self->_boundingRect._maximum = (Matrix<double, 2, 1>)vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
    self->_convexHull.edgeCount = 0;
  }
  else
  {
    v29 = &self->_cornerGroundPoints[0]._e[2];
    v30 = 0.0;
    v31 = -1.79769313e308;
    v32 = 1.79769313e308;
    v33 = v17;
    v34 = 1.79769313e308;
    v35 = 0.0;
    v36 = 1.79769313e308;
    v37 = -1.79769313e308;
    v38 = 1.79769313e308;
    do
    {
      v41 = *(v29 - 2);
      v40 = *(v29 - 1);
      v42 = *v29;
      v43 = v41 - v6;
      v44 = v40 - v7;
      v45 = *v29 - v8;
      v46 = sqrt(v43 * v43 + v44 * v44 + v45 * v45);
      if (v46 > v30)
      {
        self->_furthestGroundPoint._e[1] = v40;
        self->_furthestGroundPoint._e[2] = v42;
        v30 = v46;
        self->_maxDistance = v46;
        self->_furthestGroundPoint._e[0] = v41;
      }
      if (v46 < v32)
      {
        self->_nearestGroundPoint._e[1] = v40;
        self->_nearestGroundPoint._e[2] = v42;
        v32 = v46;
        self->_minDistance = v46;
        self->_nearestGroundPoint._e[0] = v41;
      }
      v38 = fmin(v38, v41);
      v37 = fmax(v37, v41);
      v36 = fmin(v36, v40);
      v31 = fmax(v31, v40);
      v39 = v43 * v10 + v44 * v12 + v45 * v14;
      v35 = fmax(v39, v35);
      v34 = fmin(v39, v34);
      v29 += 3;
      --v33;
    }
    while (v33);
    v47 = 0;
    self->_convexHull.edgeCount = 0;
    p_convexHull = &self->_convexHull;
    self->_minDepth = v34;
    self->_maxDepth = v35;
    self->_boundingRect._minimum._e[0] = v38;
    self->_boundingRect._minimum._e[1] = v36;
    self->_boundingRect._maximum._e[0] = v37;
    self->_boundingRect._maximum._e[1] = v31;
    do
    {
      v49 = 0;
      e = cornerGroundPoints[v47]._e;
      do
      {
        if (v47 != v49)
        {
          v51 = 0;
          v52 = 0;
          v53 = *e;
          v54 = e[1];
          v55 = e[2];
          v56 = cornerGroundPoints[v49]._e;
          v57 = *v56 - *e;
          v58 = v56[2] - v55;
          v59 = v54 - v56[1];
          v60 = &self->_cornerGroundPoints[0]._e[2];
          do
          {
            if (v47 != v51
              && v49 != v51
              && (*(v60 - 2) - v53) * v59 + (*(v60 - 1) - v54) * v57 + (*v60 - v55) * v58 > 0.0)
            {
              break;
            }
            v52 = ++v51 >= (unint64_t)v17;
            v60 += 3;
          }
          while (v17 != v51);
          if (v52 && (int)v33 <= 5)
          {
            v61 = (double *)(&p_convexHull->edgeCount + 6 * (int)v33);
            v61[1] = v53;
            v61[2] = v54;
            v61[3] = v55;
            v61[19] = v59;
            v61[20] = v57;
            v61[21] = v58;
            LODWORD(v33) = v33 + 1;
            p_convexHull->edgeCount = v33;
          }
        }
        ++v49;
      }
      while (v49 != v17);
      ++v47;
    }
    while (v47 != v17);
  }
  if (v14 >= -0.00000011920929)
    v62 = 3.40282347e38;
  else
    v62 = v8 / -v14;
  self->_centerDepth = v62;

}

- (id)annotationCoordinateTest
{
  float64_t v2;
  float64x2_t v3;
  float64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[4];
  int64x2_t v9;
  float64_t v10;
  uint64_t v11;
  float64_t v12;
  uint64_t v13;

  -[VKFootprint _expandedBoundingRect](self, "_expandedBoundingRect");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v3.f64[0] = v2;
  v3.f64[1] = v4;
  v8[2] = __39__VKFootprint_annotationCoordinateTest__block_invoke;
  v8[3] = &__block_descriptor_80_e13_B24__0___dd_8l;
  v9 = vcvtq_s64_f64((float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v3), (int8x16_t)vnegq_f64(vrndpq_f64(vabsq_f64(v3))), (int8x16_t)v3));
  v10 = v2;
  v11 = v5;
  v12 = v4;
  v13 = v6;
  return (id)objc_msgSend(v8, "copy");
}

- (id)annotationRectTest
{
  float64_t v2;
  float64x2_t v3;
  float64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[4];
  int64x2_t v9;
  float64_t v10;
  uint64_t v11;
  float64_t v12;
  uint64_t v13;

  -[VKFootprint _expandedBoundingRect](self, "_expandedBoundingRect");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v3.f64[0] = v2;
  v3.f64[1] = v4;
  v8[2] = __33__VKFootprint_annotationRectTest__block_invoke;
  v8[3] = &__block_descriptor_80_e17_q40__0d8d16d24d32l;
  v9 = vcvtq_s64_f64((float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v3), (int8x16_t)vnegq_f64(vrndpq_f64(vabsq_f64(v3))), (int8x16_t)v3));
  v10 = v2;
  v11 = v5;
  v12 = v4;
  v13 = v6;
  return (id)objc_msgSend(v8, "copy");
}

- (Box<double,)_expandedBoundingRect
{
  double v2;
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
  Box<double, 2> result;

  v2 = self->_boundingRect._minimum._e[0];
  v3 = self->_boundingRect._minimum._e[1];
  v4 = self->_boundingRect._maximum._e[0] - v2;
  v5 = self->_boundingRect._maximum._e[1] - v3;
  v6 = v4 * 3.0;
  v7 = v5 * 3.0;
  if (v4 < 0.0)
    v6 = 0.0;
  if (v5 < 0.0)
    v7 = 0.0;
  v8 = v2 + (v4 - v6) * 0.5;
  v9 = v3 + (v5 - v7) * 0.5;
  v10 = v8 + v6;
  v11 = v9 + v7;
  v12 = fmax(v9, 0.0);
  v13 = fmin(v11, 1.0);
  result._maximum._e[1] = v13;
  result._maximum._e[0] = v10;
  result._minimum._e[1] = v12;
  result._minimum._e[0] = v8;
  return result;
}

uint64_t __33__VKFootprint_annotationRectTest__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  BOOL v14;
  BOOL v15;

  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if (v6 > v5)
    return 0;
  v9 = *(double *)(a1 + 48);
  v10 = *(double *)(a1 + 64);
  v11 = v5 + 1;
  v7 = 1;
  while (1)
  {
    v12 = (double)v6 + a2;
    v13 = (double)v6 + a4;
    v14 = v12 >= v9 && v13 <= v10;
    if (v14 && *(double *)(a1 + 56) <= a3 && *(double *)(a1 + 72) >= a5)
      break;
    v15 = v10 > v12 && v9 < v13;
    if (v15 && *(double *)(a1 + 72) > a3 && *(double *)(a1 + 56) < a5)
      return 2;
    if (v11 == ++v6)
      return 0;
  }
  return v7;
}

BOOL __39__VKFootprint_annotationCoordinateTest__block_invoke(uint64_t a1, double a2, double a3)
{
  long double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  double v11;
  double v12;

  v5 = tan(a2 * 0.00872664626 + 0.785398163);
  v6 = log(v5);
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  if (v8 <= v7)
  {
    v11 = v6 * 0.159154943 + 0.5;
    v9 = 1;
    do
    {
      v12 = a3 * 0.00277777778 + 0.5 + (double)v8;
      if (v12 >= *(double *)(a1 + 48)
        && v12 < *(double *)(a1 + 64)
        && v11 >= *(double *)(a1 + 56)
        && v11 < *(double *)(a1 + 72))
      {
        break;
      }
      v9 = v8++ < v7;
    }
    while (v7 + 1 != v8);
  }
  else
  {
    return 0;
  }
  return v9;
}

- (void)cornerGroundPoints
{
  return self->_cornerGroundPoints;
}

- (int)cornerGroundPointsCount
{
  return self->_cornerGroundPointsCount;
}

- (BOOL)rejectsRect:(const void *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  unint64_t edgeCount;
  uint64_t v8;
  double *v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  Matrix<double, 3, 1> *v15;
  double v16;
  double v17;
  unint64_t v18;
  double *v19;
  double v20;
  double v21;
  unint64_t v22;
  Matrix<double, 3, 1> *v23;
  double v24;
  double v25;
  unint64_t v26;
  double *v27;
  double v28;

  v3 = *((double *)a3 + 2);
  if (v3 <= self->_boundingRect._minimum._e[0])
    return 1;
  v4 = *(double *)a3;
  if (*(double *)a3 >= self->_boundingRect._maximum._e[0])
    return 1;
  v5 = *((double *)a3 + 3);
  if (v5 <= self->_boundingRect._minimum._e[1])
    return 1;
  v6 = *((double *)a3 + 1);
  if (v6 >= self->_boundingRect._maximum._e[1])
    return 1;
  edgeCount = self->_convexHull.edgeCount;
  if ((int)edgeCount < 1)
    return 1;
  v8 = 0;
  v9 = &self->_convexHull.edgeNormal[0]._e[2];
  v10 = 1;
  do
  {
    v11 = *(v9 - 1);
    if (v11 >= 0.0)
      v12 = *((double *)a3 + 1);
    else
      v12 = *((double *)a3 + 3);
    if (*v9 * *(v9 - 18)
       + (*(v9 - 20) - *((double *)a3 + 2 * (*(v9 - 2) < 0.0))) * *(v9 - 2)
       + (*(v9 - 19) - v12) * v11 < -0.0)
      break;
    v10 = ++v8 < edgeCount;
    v9 += 3;
  }
  while (edgeCount != v8);
  if (v10)
    return 1;
  v13 = self->_convexHull.edgeOrigin[0]._e[0];
  if ((v13 - v4) * (v6 - v5) > 0.0)
  {
    v14 = 0;
    v15 = &self->_convexHull.edgeOrigin[1];
    while (edgeCount - 1 != v14)
    {
      v16 = v15->_e[0];
      ++v15;
      ++v14;
      if ((v16 - v4) * (v6 - v5) <= 0.0)
      {
        if (v14 >= edgeCount)
          return 1;
        goto LABEL_18;
      }
    }
    return 1;
  }
LABEL_18:
  v17 = self->_convexHull.edgeOrigin[0]._e[1];
  if ((v6 - v17) * (v3 - v4) > 0.0)
  {
    v18 = 0;
    v19 = &self->_convexHull.edgeOrigin[1]._e[1];
    while (edgeCount - 1 != v18)
    {
      v20 = *v19;
      v19 += 3;
      ++v18;
      if ((v6 - v20) * (v3 - v4) <= 0.0)
      {
        if (v18 >= edgeCount)
          return 1;
        goto LABEL_23;
      }
    }
    return 1;
  }
LABEL_23:
  v21 = v5 - v6;
  if ((v13 - v3) * v21 > 0.0)
  {
    v22 = 0;
    v23 = &self->_convexHull.edgeOrigin[1];
    while (edgeCount - 1 != v22)
    {
      v24 = v23->_e[0];
      ++v23;
      ++v22;
      if ((v24 - v3) * v21 <= 0.0)
      {
        if (v22 >= edgeCount)
          return 1;
        goto LABEL_28;
      }
    }
    return 1;
  }
LABEL_28:
  v25 = v4 - v3;
  if ((v5 - v17) * v25 <= 0.0)
    return 0;
  v26 = 0;
  v27 = &self->_convexHull.edgeOrigin[1]._e[1];
  while (edgeCount - 1 != v26)
  {
    v28 = *v27;
    v27 += 3;
    ++v26;
    if ((v5 - v28) * v25 <= 0.0)
      return v26 >= edgeCount;
  }
  v26 = self->_convexHull.edgeCount;
  return v26 >= edgeCount;
}

- (BOOL)containsGroundPoint:(const void *)a3
{
  double v3;
  double v5;
  uint64_t v6;
  BOOL v7;
  double *v8;
  _DWORD __dst[74];

  v3 = *(double *)a3;
  if (*(double *)a3 < self->_boundingRect._minimum._e[0])
    return 0;
  if (v3 >= self->_boundingRect._maximum._e[0])
    return 0;
  v5 = *((double *)a3 + 1);
  if (v5 < self->_boundingRect._minimum._e[1] || v5 >= self->_boundingRect._maximum._e[1])
  {
    return 0;
  }
  else
  {
    memcpy(__dst, &self->_convexHull, sizeof(__dst));
    if (__dst[0] < 1)
    {
      return 1;
    }
    else
    {
      v6 = 0;
      v7 = 0;
      v8 = (double *)&__dst[42];
      do
      {
        if (*(v8 - 2) * (v3 - *(v8 - 20)) + *(v8 - 1) * (v5 - *(v8 - 19)) + *v8 * (*((double *)a3 + 2) - *(v8 - 18)) > 0.0)
          break;
        v7 = ++v6 >= (unint64_t)__dst[0];
        v8 += 3;
      }
      while (__dst[0] != v6);
    }
  }
  return v7;
}

- (Box<double,)boundingRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  Box<double, 2> result;

  v2 = self->_boundingRect._minimum._e[0];
  v3 = self->_boundingRect._minimum._e[1];
  v4 = self->_boundingRect._maximum._e[0];
  v5 = self->_boundingRect._maximum._e[1];
  result._maximum._e[1] = v5;
  result._maximum._e[0] = v4;
  result._minimum._e[1] = v3;
  result._minimum._e[0] = v2;
  return result;
}

- (VKFootprintConvexHull_struct)convexHull
{
  return (VKFootprintConvexHull_struct *)memcpy(retstr, &self->_convexHull, sizeof(VKFootprintConvexHull_struct));
}

- (double)minDepth
{
  return self->_minDepth;
}

- (double)maxDepth
{
  return self->_maxDepth;
}

- (double)centerDepth
{
  return self->_centerDepth;
}

- (Matrix<double,)furthestGroundPoint
{
  double v2;
  double v3;
  double v4;
  Matrix<double, 3, 1> result;

  v2 = self->_furthestGroundPoint._e[0];
  v3 = self->_furthestGroundPoint._e[1];
  v4 = self->_furthestGroundPoint._e[2];
  result._e[2] = v4;
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

@end
