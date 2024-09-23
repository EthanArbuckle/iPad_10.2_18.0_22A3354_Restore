@implementation TSDConnectionLineLayout

- (id)quadraticCurve:(CGPoint)a3[3]
{
  double y;
  double x;
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
  id v32;
  double v34;

  x = a3->x;
  y = a3->y;
  v5 = a3[1].x;
  v6 = a3[1].y;
  v7 = a3[2].x;
  v8 = a3[2].y;
  v34 = a3->x;
  v9 = TSDMultiplyPointScalar(a3->x, y, 0.25);
  v10 = TSDSubtractPoints(v5, v6, v9);
  v12 = v11;
  v13 = TSDMultiplyPointScalar(v7, v8, 0.25);
  v14 = TSDSubtractPoints(v10, v12, v13);
  v16 = TSDMultiplyPointScalar(v14, v15, 2.0);
  v18 = v17;
  v19 = TSDMultiplyPointScalar(x, y, 0.333333333);
  v21 = v20;
  v22 = TSDMultiplyPointScalar(v16, v18, 0.666666667);
  v24 = v23;
  v25 = TSDAddPoints(v19, v21, v22);
  v27 = v26;
  v28 = TSDMultiplyPointScalar(v7, v8, 0.333333333);
  v29 = TSDAddPoints(v22, v24, v28);
  v31 = v30;
  v32 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
  objc_msgSend(v32, "moveToPoint:", v34, y);
  objc_msgSend(v32, "curveToPoint:controlPoint1:controlPoint2:", v7, v8, v25, v27, v29, v31);
  return v32;
}

- (id)createConnectedPathFrom:(id)a3 to:(id)a4 withControlPoints:(CGPoint)a5[3]
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  double v12;
  id v13;
  void *v14;
  uint64_t v15;
  double v16;
  _BOOL4 v17;
  id v18;
  char v20;

  v8 = -[TSDConnectionLineLayout quadraticCurve:](self, "quadraticCurve:", a5);
  self->mStartClipT = 0.0;
  v20 = 1;
  self->mEndClipT = 1.0;
  if (a3
    && (-[TSDConnectionLineAbstractLayout outsetFrom](self, "outsetFrom"),
        (v9 = -[TSDConnectionLineAbstractLayout clipPath:onLayout:outset:reversed:isValid:](self, "clipPath:onLayout:outset:reversed:isValid:", v8, a3, 0, &v20)) != 0))
  {
    v10 = v9;
    v11 = objc_msgSend(v9, "segment");
    objc_msgSend(v10, "t");
    self->mStartClipT = v12;
    if (!a4)
      goto LABEL_8;
  }
  else
  {
    v11 = -1;
    if (!a4)
    {
LABEL_8:
      v15 = -1;
      goto LABEL_9;
    }
  }
  -[TSDConnectionLineAbstractLayout outsetTo](self, "outsetTo");
  v13 = -[TSDConnectionLineAbstractLayout clipPath:onLayout:outset:reversed:isValid:](self, "clipPath:onLayout:outset:reversed:isValid:", v8, a4, 1, &v20);
  if (!v13)
    goto LABEL_8;
  v14 = v13;
  v15 = objc_msgSend(v13, "segment");
  objc_msgSend(v14, "t");
  self->mEndClipT = v16;
LABEL_9:
  self->super.mVisibleLine = 1;
  if ((v11 & 0x8000000000000000) == 0 || (v15 & 0x8000000000000000) == 0)
  {
    v17 = 0;
    if ((v11 & 0x8000000000000000) == 0 && (v15 & 0x8000000000000000) == 0 && v11 >= v15)
      v17 = v11 != v15 || self->mStartClipT >= self->mEndClipT;
    if (a3 && a4)
    {
      if (!v20)
        v17 = 1;
      if (v17)
      {
        self->super.mVisibleLine = 0;
        return v8;
      }
    }
    else if ((unint64_t)a3 | (unint64_t)a4 && !v20)
    {
      self->mStartClipT = 0.0;
      self->mEndClipT = 1.0;
      return v8;
    }
    v18 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
    objc_msgSend(v18, "appendBezierPath:fromSegment:t:toSegment:t:withoutMove:", v8, v11, v15, 0, self->mStartClipT, self->mEndClipT);
    return v18;
  }
  return v8;
}

- (CGPoint)controlPointForPointA:(CGPoint)a3 pointB:(CGPoint)a4 andOriginalA:(CGPoint)a5 originalB:(CGPoint)a6
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  void *v15;
  TSDInfoGeometry *mResizeInfoGeometry;
  double v17;
  double v18;
  float64x2_t v19;
  double v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CGPoint result;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  v10 = a4.y;
  v11 = a4.x;
  v12 = a3.y;
  v13 = a3.x;
  objc_opt_class();
  if (!self->super.super.mResizePathSource)
    objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "pathSource");
  v15 = (void *)TSUDynamicCast();
  mResizeInfoGeometry = self->super.super.mResizeInfoGeometry;
  if (mResizeInfoGeometry)
  {
    v25 = 0u;
    v26 = 0u;
    v24 = 0u;
LABEL_6:
    -[TSDInfoGeometry transform](mResizeInfoGeometry, "transform");
    goto LABEL_7;
  }
  mResizeInfoGeometry = (TSDInfoGeometry *)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry");
  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  if (mResizeInfoGeometry)
    goto LABEL_6;
LABEL_7:
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  TSDTransformMakeFree(1, (uint64_t)&v21, v9, v8, x, y, v13, v12, v11, v10);
  objc_msgSend(v15, "getControlKnobPosition:", 12);
  v19 = vaddq_f64(v23, vmlaq_n_f64(vmulq_n_f64(v22, *((double *)&v26 + 1) + v17 * *((double *)&v25 + 1) + *((double *)&v24 + 1) * v18), v21, *(double *)&v26 + v17 * *(double *)&v25 + *(double *)&v24 * v18));
  v20 = v19.f64[1];
  result.x = v19.f64[0];
  result.y = v20;
  return result;
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  TSDConnectionLinePathSource *v4;
  float64_t v5;
  double v6;
  float64_t v7;
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
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  float64x2_t v28;
  double v29;
  uint64_t v30;
  double v31;
  double v32;
  uint64_t v33;
  CGPoint result;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = -[TSDConnectionLineAbstractLayout connectedPathSource](self, "connectedPathSource", a3);
  -[TSDConnectionLinePathSource getControlKnobPosition:](v4, "getControlKnobPosition:", 10);
  v6 = v5;
  v8 = v7;
  v28.f64[0] = v5;
  v28.f64[1] = v7;
  -[TSDConnectionLinePathSource getControlKnobPosition:](v4, "getControlKnobPosition:", 12);
  v10 = v9;
  v12 = v11;
  -[TSDConnectionLinePathSource getControlKnobPosition:](v4, "getControlKnobPosition:", 11);
  v14 = v13;
  v16 = v15;
  v31 = v13;
  v32 = v15;
  v17 = TSDMultiplyPointScalar(v6, v8, 0.25);
  v18 = TSDSubtractPoints(v10, v12, v17);
  v20 = v19;
  v21 = TSDMultiplyPointScalar(v14, v16, 0.25);
  v22 = TSDSubtractPoints(v18, v20, v21);
  v29 = TSDMultiplyPointScalar(v22, v23, 2.0);
  v30 = v24;
  if (-[TSDConnectionLineAbstractLayout isStraightLine](self, "isStraightLine"))
  {
    v25 = (self->mStartClipT + self->mEndClipT) * 0.5;
  }
  else if (self->super.mVisibleLine)
  {
    v25 = fmax(self->mStartClipT, fmin(self->mEndClipT, 0.5));
  }
  else
  {
    v25 = 0.5;
  }
  v26 = TSDPointOnQuadraticCurve(&v28, v25);
  result.y = v27;
  result.x = v26;
  return result;
}

@end
