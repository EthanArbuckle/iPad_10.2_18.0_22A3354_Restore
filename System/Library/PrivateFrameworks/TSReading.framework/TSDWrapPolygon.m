@implementation TSDWrapPolygon

- (TSDWrapPolygon)initWithPath:(id)a3
{
  TSDWrapPolygon *v4;
  TSDWrapPolygon *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDWrapPolygon;
  v4 = -[TSDWrapPolygon init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[TSDWrapPolygon setPath:](v4, "setPath:", a3);
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TSDWrapPolygon *v4;

  v4 = objc_alloc_init(TSDWrapPolygon);
  -[TSDWrapPolygon p_setPolygon:](v4, "p_setPolygon:", copyPolygon((int *)self->mPolygon));
  if (self->mComputedSelfIntersection)
    -[TSDWrapPolygon setIntersectsSelf:](v4, "setIntersectsSelf:", self->mIntersectsSelf);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[TSDWrapPolygon p_freePolygon](self, "p_freePolygon");
  v3.receiver = self;
  v3.super_class = (Class)TSDWrapPolygon;
  -[TSDWrapPolygon dealloc](&v3, sel_dealloc);
}

- (void)setPath:(id)a3
{
  id v3;

  v3 = a3;
  if ((objc_msgSend(a3, "isFlat") & 1) == 0)
    v3 = (id)objc_msgSend(v3, "bezierPathByFlatteningPath");
  if (objc_msgSend(v3, "isClockwise"))
    v3 = (id)objc_msgSend(v3, "bezierPathByReversingPath");
  self->mComputedSelfIntersection = 0;
  self->mComputedBounds = 0;
  -[TSDWrapPolygon p_freePolygon](self, "p_freePolygon");
  self->mPolygon = polygonFromBezier(v3);
}

- (void)setIntersectsSelf:(BOOL)a3
{
  self->mIntersectsSelf = a3;
  self->mComputedSelfIntersection = 1;
}

- (BOOL)intersectsSelf
{
  if (!self->mComputedSelfIntersection)
  {
    -[TSDWrapPolygon p_computeIntersectionState](self, "p_computeIntersectionState");
    self->mComputedSelfIntersection = 1;
  }
  return self->mIntersectsSelf;
}

- (void)polygon
{
  return self->mPolygon;
}

- (CGRect)bounds
{
  int *mPolygon;
  CGSize v4;
  uint64_t v5;
  uint64_t v6;
  double x;
  double y;
  double width;
  double height;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  if (!self->mComputedBounds)
  {
    mPolygon = (int *)self->mPolygon;
    v4 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
    self->mBounds.origin = (CGPoint)*MEMORY[0x24BDBF090];
    self->mBounds.size = v4;
    if (mPolygon)
    {
      if (*mPolygon >= 1)
      {
        v5 = 0;
        v6 = 0;
        x = self->mBounds.origin.x;
        y = self->mBounds.origin.y;
        width = self->mBounds.size.width;
        height = self->mBounds.size.height;
        do
        {
          v11 = boundsForVertexList(*((_QWORD *)mPolygon + 2) + v5);
          x = TSDUnionRect(x, y, width, height, v11, v12, v13, v14);
          y = v15;
          width = v16;
          height = v17;
          self->mBounds.origin.x = x;
          self->mBounds.origin.y = v15;
          self->mBounds.size.width = v16;
          self->mBounds.size.height = v17;
          ++v6;
          v5 += 16;
        }
        while (v6 < *mPolygon);
      }
      self->mComputedBounds = 1;
    }
  }
  v18 = self->mBounds.size.width;
  v19 = self->mBounds.size.height;
  v20 = self->mBounds.origin.x;
  v21 = self->mBounds.origin.y;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (id)bezierPath
{
  id result;

  result = self->mPolygon;
  if (result)
    return bezierFromPolygon((int *)result);
  return result;
}

- (void)transformUsingAffineTransform:(CGAffineTransform *)a3
{
  unsigned int *mPolygon;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double *v8;

  mPolygon = (unsigned int *)self->mPolygon;
  if (mPolygon)
  {
    v4 = *mPolygon;
    if ((int)v4 >= 1)
    {
      v5 = 0;
      v6 = *((_QWORD *)mPolygon + 2);
      do
      {
        v7 = *(unsigned int *)(v6 + 16 * v5);
        if ((int)v7 >= 1)
        {
          v8 = *(double **)(v6 + 16 * v5 + 8);
          do
          {
            *(float64x2_t *)v8 = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v8[1]), *(float64x2_t *)&a3->a, *v8));
            v8 += 2;
            --v7;
          }
          while (v7);
        }
        ++v5;
      }
      while (v5 != v4);
    }
    self->mComputedBounds = 0;
  }
}

- (CGPoint)intersectionPointBetween:(CGPoint)a3 and:(CGPoint)a4
{
  unsigned int *mPolygon;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  double *v12;
  double v13;
  double v14;
  double *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v25;
  double v26;
  double v27;
  double v28;
  CGPoint result;

  mPolygon = (unsigned int *)self->mPolygon;
  v5 = 0.0;
  if (mPolygon)
  {
    v6 = *mPolygon;
    if ((int)v6 >= 1)
    {
      v7 = 0;
      v8 = *((_QWORD *)mPolygon + 2);
      v9 = a4.x - a3.x;
      do
      {
        v10 = *(unsigned int *)(v8 + 16 * v7);
        if ((int)v10 >= 2)
        {
          v11 = *(_QWORD *)(v8 + 16 * v7 + 8);
          v12 = (double *)(v11 + 16 * (v10 - 1));
          v13 = *v12;
          v14 = v12[1];
          v15 = (double *)(v11 + 8);
          do
          {
            v16 = v13;
            v17 = v14;
            v13 = *(v15 - 1);
            v14 = *v15;
            v18 = v16 - v13;
            v19 = v17 - *v15;
            v20 = v19 * v9 - v18 * (a4.y - a3.y);
            if (v20 != 0.0)
            {
              v21 = (v18 * (a3.y - v14) - v19 * (a3.x - v13)) / v20;
              v22 = ((a3.x - v13) * -(a4.y - a3.y) + v9 * (a3.y - v14)) / v20;
              v25 = v22 > 1.0 || v22 < 0.0 || v21 > 1.0 || v21 < 0.0;
              v26 = fmax(v5, v21);
              if (!v25)
                v5 = v26;
            }
            v15 += 2;
            --v10;
          }
          while (v10);
        }
        ++v7;
      }
      while (v7 != v6);
    }
  }
  v27 = a3.x + (a4.x - a3.x) * v5;
  v28 = a3.y + (a4.y - a3.y) * v5;
  result.y = v28;
  result.x = v27;
  return result;
}

- (void)p_freePolygon
{
  void *mPolygon;

  mPolygon = self->mPolygon;
  if (mPolygon)
  {
    TSDgpc_free_polygon((uint64_t)mPolygon);
    free(self->mPolygon);
    self->mPolygon = 0;
  }
}

- (void)p_setPolygon:(id *)a3
{
  -[TSDWrapPolygon p_freePolygon](self, "p_freePolygon");
  self->mPolygon = a3;
}

- (int)p_countSegments
{
  unsigned int *mPolygon;
  uint64_t v3;
  int result;
  int *v5;
  int v6;
  int v7;
  BOOL v8;

  mPolygon = (unsigned int *)self->mPolygon;
  if (!mPolygon)
    return 0;
  v3 = *mPolygon;
  if ((int)v3 < 1)
    return 0;
  result = 0;
  v5 = (int *)*((_QWORD *)mPolygon + 2);
  do
  {
    v7 = *v5;
    v5 += 4;
    v6 = v7;
    v8 = v7 == 2;
    if (v7 <= 2)
      v6 = 0;
    if (v8)
      v6 = 1;
    result += v6;
    --v3;
  }
  while (v3);
  return result;
}

- (void)p_computeIntersectionState
{
  int *mPolygon;
  int v4;
  int v5;
  double v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  int v16;
  _QWORD *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  double *v21;
  double *v22;
  double v23;
  int v24;
  int v25;
  int v26;
  _QWORD *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  double *v31;
  double *v32;
  double v33;
  double v34;
  double v36;

  mPolygon = (int *)self->mPolygon;
  v4 = -[TSDWrapPolygon p_countSegments](self, "p_countSegments");
  self->mIntersectsSelf = 0;
  if (v4 >= 1)
  {
    v5 = 0;
    v6 = 0.0;
    v7 = *mPolygon;
    v8 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
    v14 = 0.0;
    while (1)
    {
      if (v7 >= 1)
      {
        v15 = 0;
        v16 = 0;
        v17 = (_QWORD *)(*((_QWORD *)mPolygon + 2) + 8);
        v18 = *mPolygon;
        while (1)
        {
          v19 = *((_DWORD *)v17 - 2);
          if (v19 > 2)
            v15 = *((_DWORD *)v17 - 2);
          if (v19 == 2)
            v15 = 1;
          if (v15 + v16 >= v5)
            break;
          v17 += 2;
          v16 += v15;
          if (!--v18)
            goto LABEL_13;
        }
        v20 = *v17;
        v21 = (double *)(v20 + 16 * ((v5 - v16) % v19));
        v13 = *v21;
        v14 = v21[1];
        v22 = (double *)(v20 + 16 * ((v5 - v16 + 1) % v19));
        v11 = *v22;
        v12 = v22[1];
      }
LABEL_13:
      if (++v5 < v4)
        break;
LABEL_36:
      if (v5 == v4)
        return;
    }
    v23 = v11 - v13;
    v24 = v5;
    while (1)
    {
      if (v7 >= 1)
      {
        v25 = 0;
        v26 = 0;
        v27 = (_QWORD *)(*((_QWORD *)mPolygon + 2) + 8);
        v28 = *mPolygon;
        while (1)
        {
          v29 = *((_DWORD *)v27 - 2);
          if (v29 > 2)
            v25 = *((_DWORD *)v27 - 2);
          if (v29 == 2)
            v25 = 1;
          if (v25 + v26 >= v24)
            break;
          v27 += 2;
          v26 += v25;
          if (!--v28)
            goto LABEL_25;
        }
        v30 = *v27;
        v31 = (double *)(v30 + 16 * ((v24 - v26) % v29));
        v9 = *v31;
        v10 = v31[1];
        v32 = (double *)(v30 + 16 * ((v24 - v26 + 1) % v29));
        v6 = *v32;
        v8 = v32[1];
      }
LABEL_25:
      v33 = (v6 - v9) * -(v12 - v14) + v23 * (v8 - v10);
      if (v33 != 0.0)
      {
        v34 = ((v14 - v10) * (v6 - v9) - (v13 - v9) * (v8 - v10)) / v33;
        if (v34 > 0.0 && v34 < 1.0)
        {
          v36 = ((v14 - v10) * v23 - (v13 - v9) * (v12 - v14)) / v33;
          if (v36 > 0.0 && v36 < 1.0)
            break;
        }
      }
      if (++v24 == v4)
        goto LABEL_36;
    }
    self->mIntersectsSelf = 1;
  }
}

@end
