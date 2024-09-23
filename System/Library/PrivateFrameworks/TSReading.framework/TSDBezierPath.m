@implementation TSDBezierPath

- (void)getStartPoint:(CGPoint *)a3 andEndPoint:(CGPoint *)a4
{
  unint64_t v7;
  CGPoint *v8;
  _BYTE v9[32];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  -[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", 0, a3);
  v7 = -[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", -[TSDBezierPath elementCount](self, "elementCount") - 1, v9);
  v8 = (CGPoint *)v9;
  if (v7 == 2)
    v8 = (CGPoint *)v10;
  if (v7 == 3)
    v8 = a3;
  *a4 = *v8;
}

- (void)addIntersectionsWithPath:(id)a3 to:(id)a4 allIntersections:(BOOL)a5 reversed:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  double v24;
  float64x2_t *v25;
  float64x2_t *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  unint64_t v30;
  uint64_t v32;
  TSDBezierPath *v33;
  _OWORD v34[4];
  float64x2_t v35[4];
  _OWORD v36[4];
  float64x2_t v37[4];
  uint64_t v38;

  v6 = a6;
  v38 = *MEMORY[0x24BDAC8D0];
  v30 = objc_msgSend(a4, "count");
  v33 = self;
  v10 = -[TSDBezierPath elementCount](self, "elementCount");
  v11 = objc_msgSend(a3, "elementCount");
  if (v10 < 2)
    return;
  v12 = v11;
  if (v11 < 2)
    return;
  if (v6)
    v13 = v10 - 1;
  else
    v13 = 0;
  if (v6)
    v14 = -1;
  else
    v14 = v10;
  v32 = v14;
  if (v6)
    v15 = -1;
  else
    v15 = 1;
  while (2)
  {
    v16 = -[TSDBezierPath elementAtIndex:allPoints:](v33, "elementAtIndex:allPoints:", v13, v35);
    if (!v16)
      goto LABEL_29;
    v17 = v16;
    v18 = 0;
    do
    {
      v19 = objc_msgSend(a3, "elementAtIndex:allPoints:", v18, v34);
      if (!v19)
        goto LABEL_26;
      if (v17 != 2)
      {
        if (v19 != 2)
        {
          lineIntersectsLine(v35[0].f64, (double *)v34, v13, v18, a4);
          goto LABEL_26;
        }
        v25 = (float64x2_t *)v34;
        v26 = v35;
        v27 = v18;
        v28 = v13;
        v29 = 1;
LABEL_24:
        curveIntersectLine(v25->f64, v26->f64, v27, v28, v29, a4);
        goto LABEL_26;
      }
      if (v19 != 2)
      {
        v25 = v35;
        v26 = (float64x2_t *)v34;
        v27 = v13;
        v28 = v18;
        v29 = 0;
        goto LABEL_24;
      }
      v20 = objc_msgSend(a4, "count");
      v37[0] = v35[0];
      v37[1] = v35[1];
      v37[2] = v35[2];
      v37[3] = v35[3];
      v36[0] = v34[0];
      v36[1] = v34[1];
      v36[2] = v34[2];
      v36[3] = v34[3];
      curveIntersectCurveR(v37, (double *)v36, v13, v18, 0, a4, 1.0, 0.0, 1.0, 0.0);
      v21 = objc_msgSend(a4, "count");
      if (v20 < v21)
      {
        v22 = v21;
        do
        {
          v23 = (void *)objc_msgSend(a4, "objectAtIndex:", v20);
          objc_msgSend(v23, "t");
          objc_msgSend(v23, "setPoint:", TSDPointOnCurve(v35, v24));
          ++v20;
        }
        while (v22 != v20);
      }
LABEL_26:
      ++v18;
    }
    while (v18 != v12);
    if (a5 || v30 >= objc_msgSend(a4, "count"))
    {
LABEL_29:
      v13 += v15;
      if (v13 == v32)
        return;
      continue;
    }
    break;
  }
}

- (void)addIntersectionsWithPath:(id)a3 to:(id)a4
{
  -[TSDBezierPath addIntersectionsWithPath:to:allIntersections:reversed:](self, "addIntersectionsWithPath:to:allIntersections:reversed:", a3, a4, 1, 0);
}

- (void)addIntersectionsWithLine:(CGPoint)a3[2] to:(id)a4
{
  int64_t v7;
  int64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[3];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11 = *MEMORY[0x24BDBEFB0];
  v7 = -[TSDBezierPath elementCount](self, "elementCount");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
    {
      switch(-[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", i, v13, v11, v12))
      {
        case 0uLL:
          v11 = v13[0];
          v12 = v13[0];
          continue;
        case 1uLL:
          goto LABEL_7;
        case 2uLL:
          curveIntersectLine((double *)&v12, &a3->x, i, -1, 0, a4);
          v10 = v13[2];
          goto LABEL_8;
        case 3uLL:
          v13[0] = v11;
LABEL_7:
          lineIntersectsLine((double *)&v12, &a3->x, i, -1, a4);
          v10 = v13[0];
LABEL_8:
          v12 = v10;
          break;
        default:
          continue;
      }
    }
  }
}

- (void)appendBezierPath:(id)a3 fromSegment:(int64_t)a4 toSegment:(int64_t)a5
{
  int64_t v6;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a4 < a5)
  {
    v6 = a4;
    do
    {
      switch(objc_msgSend(a3, "elementAtIndex:associatedPoints:", v6, &v9))
      {
        case 0:
          -[TSDBezierPath moveToPoint:](self, "moveToPoint:", v9, v10);
          break;
        case 1:
          -[TSDBezierPath lineToPoint:](self, "lineToPoint:", v9, v10);
          break;
        case 2:
          -[TSDBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v13, v14, v9, v10, v11, v12);
          break;
        case 3:
          -[TSDBezierPath closePath](self, "closePath");
          break;
        default:
          break;
      }
      ++v6;
    }
    while (a5 != v6);
  }
}

- (void)appendBezierPath:(id)a3 fromSegment:(int64_t)a4 t:(double)a5 toSegment:(int64_t)a6 t:(double)a7 withoutMove:(BOOL)a8
{
  int64_t v15;
  int64_t v16;
  _BOOL4 v18;
  int64_t v19;
  uint64_t v21;
  int64_t v22;
  int64_t v23;
  char v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  float64x2_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v15 = objc_msgSend(a3, "elementCount");
  v16 = v15;
  v18 = a4 < 1 || v15 <= a4;
  if (v18)
    v19 = -1;
  else
    v19 = a4;
  if (a6 <= 0)
    a6 = v15 + 1;
  if (v19 == a6)
  {
    if (a7 < a5 || v19 >= v15)
      LOBYTE(v18) = 1;
    if (!v18)
    {
      v21 = objc_msgSend(a3, "elementAtIndex:allPoints:", v19, &v34);
      if (v21 == 3)
      {
LABEL_22:
        if (!a8)
          -[TSDBezierPath moveToPoint:](self, "moveToPoint:", v35 * a5 + v34.f64[0] * (1.0 - a5), v36 * a5 + v34.f64[1] * (1.0 - a5));
        goto LABEL_55;
      }
      if (v21 != 2)
      {
        if (v21 != 1)
          return;
        goto LABEL_22;
      }
      TSDCurveBetween(&v34, (uint64_t)&v26, a5, a7);
      if (!a8)
        -[TSDBezierPath moveToPoint:](self, "moveToPoint:", v26, v27);
      goto LABEL_57;
    }
  }
  else
  {
    if (!v18)
    {
      switch(objc_msgSend(a3, "elementAtIndex:allPoints:", a4, &v34))
      {
        case 0:
          if (!a8)
            -[TSDBezierPath moveToPoint:](self, "moveToPoint:", *(_OWORD *)&v34);
          break;
        case 1:
        case 3:
          if (!a8)
            -[TSDBezierPath moveToPoint:](self, "moveToPoint:", v35 * a5 + v34.f64[0] * (1.0 - a5), v36 * a5 + v34.f64[1] * (1.0 - a5));
          -[TSDBezierPath lineToPoint:](self, "lineToPoint:", v35, v36);
          break;
        case 2:
          TSDCurveBetween(&v34, (uint64_t)&v26, a5, 1.0);
          if (!a8)
            -[TSDBezierPath moveToPoint:](self, "moveToPoint:", v26, v27);
          -[TSDBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v32, v33, v28, v29, v30, v31);
          break;
        default:
          break;
      }
    }
    if (a6 >= v16)
      v22 = v16;
    else
      v22 = a6;
    v23 = v19 + 1;
    if (v23 < v22)
    {
      v24 = 0;
      do
      {
        switch(objc_msgSend(a3, "elementAtIndex:associatedPoints:", v23, &v34))
        {
          case 0:
            -[TSDBezierPath moveToPoint:](self, "moveToPoint:", *(_OWORD *)&v34);
            goto LABEL_47;
          case 1:
            -[TSDBezierPath lineToPoint:](self, "lineToPoint:", *(_OWORD *)&v34);
            break;
          case 2:
            -[TSDBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v37, v38, *(_OWORD *)&v34, v35, v36);
            break;
          case 3:
            if ((v24 & 1) != 0)
            {
              -[TSDBezierPath closePath](self, "closePath");
LABEL_47:
              v24 = 1;
            }
            else
            {
              -[TSDBezierPath lineToPoint:](self, "lineToPoint:", *(_OWORD *)&v34);
              v24 = 0;
            }
            break;
          default:
            break;
        }
        ++v23;
      }
      while (v22 != v23);
    }
    if (a6 >= 1 && a6 < v16)
    {
      v25 = objc_msgSend(a3, "elementAtIndex:allPoints:", a6, &v34);
      if (v25 == 3)
      {
LABEL_55:
        -[TSDBezierPath lineToPoint:](self, "lineToPoint:", v35 * a7 + v34.f64[0] * (1.0 - a7), v36 * a7 + v34.f64[1] * (1.0 - a7));
        return;
      }
      if (v25 != 2)
      {
        if (v25 != 1)
          return;
        goto LABEL_55;
      }
      TSDCurveBetween(&v34, (uint64_t)&v26, 0.0, a7);
LABEL_57:
      -[TSDBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v32, v33, v28, v29, v30, v31);
    }
  }
}

- (id)copyFromSegment:(int)a3 t:(float)a4 toSegment:(int)a5 t:(float)a6
{
  id v11;

  v11 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v11, "appendBezierPath:fromSegment:t:toSegment:t:withoutMove:", self, a3, a5, 0, a4, a6);
  objc_msgSend(v11, "setWindingRule:", -[TSDBezierPath windingRule](self, "windingRule"));
  objc_msgSend(v11, "setLineCapStyle:", -[TSDBezierPath lineCapStyle](self, "lineCapStyle"));
  objc_msgSend(v11, "setLineJoinStyle:", -[TSDBezierPath lineJoinStyle](self, "lineJoinStyle"));
  -[TSDBezierPath lineWidth](self, "lineWidth");
  objc_msgSend(v11, "setLineWidth:");
  return v11;
}

- (CGPoint)nearestPointOnPathToLine:(CGPoint)a3[2]
{
  double v5;
  double v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  float v10;
  unint64_t v11;
  __int128 v12;
  float v13;
  CGFloat y;
  double x;
  CGFloat v16;
  double v17;
  float v18;
  double v19;
  float v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  float64x2_t v26;
  _OWORD v27[3];
  uint64_t v28;
  CGPoint result;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BDBEFB0];
  v6 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v25 = *MEMORY[0x24BDBEFB0];
  v7 = -[TSDBezierPath elementCount](self, "elementCount");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 3.4028e38;
    while (1)
    {
      v11 = -[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v9, v27);
      if (v11 == 2)
        break;
      if (v11 == 3)
      {
        v12 = v25;
LABEL_9:
        v27[0] = v12;
        v11 = 2;
      }
      x = a3[1].x;
      y = a3[1].y;
      v16 = y - a3->y;
      v17 = x - a3->x;
      v18 = v17 * v17 + v16 * v16;
      v19 = (float)(1.0 / sqrtf(v18));
      *(float *)&y = *((double *)v27 + 1) * -(v17 * v19)
                   + v16 * v19 * *(double *)v27
                   - (y * -(v17 * v19)
                    + v16 * v19 * x);
      v20 = fabsf(*(float *)&y);
      if (v10 > v20)
      {
        v6 = *((double *)v27 + 1);
        v5 = *(double *)v27;
        v10 = v20;
      }
      v26 = (float64x2_t)v27[0];
      if (!v11)
        v25 = v27[0];
      if (v8 == ++v9)
        goto LABEL_15;
    }
    v23 = 0.0;
    v24 = 0.0;
    TSDNearestPointOnCurveToLine(&v26, &a3->x, (uint64_t)&v23);
    if (v13 < v10)
    {
      v6 = v24;
      v5 = v23;
      v10 = v13;
    }
    v12 = v27[2];
    goto LABEL_9;
  }
LABEL_15:
  v21 = v5;
  v22 = v6;
  result.y = v22;
  result.x = v21;
  return result;
}

- (CGPoint)nearestAngleOnPathToLine:(CGPoint)a3[2]
{
  double v5;
  double v6;
  double x;
  double y;
  double v9;
  int64_t v10;
  int64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  float v18;
  unint64_t v19;
  uint64_t v20;
  double v21;
  float v22;
  __int128 v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float v28;
  double v29;
  double v30;
  double v31;
  double v32;
  __int128 v33;
  float64x2_t v34;
  _OWORD v35[3];
  uint64_t v36;
  CGPoint result;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BDBEFB0];
  v6 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  x = a3[1].x;
  y = a3[1].y;
  v9 = a3->x;
  v33 = *MEMORY[0x24BDBEFB0];
  v10 = -[TSDBezierPath elementCount](self, "elementCount");
  if (v10)
  {
    v11 = v10;
    v12 = TSDSubtractPoints(x, y, v9);
    v14 = TSDNormalizePoint(v12, v13);
    v16 = v15;
    v17 = 0;
    v18 = -2.0;
    do
    {
      v19 = -[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v17, v35);
      v20 = v19;
      if (v19 == 2)
      {
        v31 = 0.0;
        v32 = 0.0;
        nearestAngleOnCurveToLine(&v34, &a3->x, (uint64_t)&v31);
        v22 = v21;
        if (v18 < v22)
        {
          v18 = v22;
          v6 = v32;
          v5 = v31;
        }
        v35[0] = v35[2];
      }
      else if (v19 == 3)
      {
        v35[0] = v33;
        v20 = 2;
      }
      v23 = v35[0];
      v24 = TSDSubtractPoints(*(double *)v35, *((double *)v35 + 1), a3->x);
      v26 = TSDNormalizePoint(v24, v25);
      v28 = TSDDotPoints(v14, v16, v26, v27);
      if (v18 < v28)
      {
        v18 = v28;
        v6 = *((double *)&v23 + 1);
        v5 = *(double *)&v23;
      }
      v34 = (float64x2_t)v35[0];
      if (!v20)
        v33 = v35[0];
      ++v17;
    }
    while (v11 != v17);
  }
  v29 = v5;
  v30 = v6;
  result.y = v30;
  result.x = v29;
  return result;
}

- (id)pressure
{
  return 0;
}

- (int64_t)elementPercentage:(float *)a3 forOverallPercentage:(float)a4
{
  double v7;
  float v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;
  float v13;
  uint64_t v14;
  double v15;
  float v16;
  double v17;
  double v18;
  float v19;

  -[TSDBezierPath length](self, "length");
  v8 = v7;
  if (a4 < 0.0)
  {
    v9 = 0;
    do
      -[TSDBezierPath lengthOfElement:](self, "lengthOfElement:", ++v9);
    while (v10 == 0.0);
    -[TSDBezierPath lengthOfElement:](self, "lengthOfElement:", v9);
    v12 = (float)(v8 * a4) / v11;
LABEL_12:
    v19 = v12;
    goto LABEL_13;
  }
  v13 = v8 * a4;
  v14 = -[TSDBezierPath elementCount](self, "elementCount");
  if (v14 < 2)
  {
LABEL_9:
    v9 = v14;
    do
      -[TSDBezierPath lengthOfElement:](self, "lengthOfElement:", --v9);
    while (v17 == 0.0);
    -[TSDBezierPath lengthOfElement:](self, "lengthOfElement:", v9);
    v12 = v13 / v18 + 1.0;
    goto LABEL_12;
  }
  v9 = 1;
  while (1)
  {
    -[TSDBezierPath lengthOfElement:](self, "lengthOfElement:", v9);
    v16 = v15;
    v13 = v13 - v16;
    if (v13 < 0.0)
      break;
    if (v14 == ++v9)
      goto LABEL_9;
  }
  v19 = (float)(v13 + v16) / v16;
LABEL_13:
  *a3 = v19;
  return v9;
}

- (int64_t)elementPercentage:(double *)a3 forOverallPercentage:(double)a4 startingElementIndex:(int64_t)a5 lengthToStartingElement:(double)a6
{
  double v11;
  double v12;
  double v13;
  double v14;
  int64_t v15;
  double v16;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v24;
  double v25;

  -[TSDBezierPath length](self, "length");
  if (v11 <= 0.0 || (v12 = v11, -[TSDBezierPath elementCount](self, "elementCount") <= 0))
  {
    v20 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v21 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBezierPath(Distortion) elementPercentage:forOverallPercentage:startingElementIndex:lengthToStartingElement:]");
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDPathDistortion.m"), 1335, CFSTR("Can't calculate a percentage of a path with no length or elements."));
    a5 = 0;
    v22 = 0.0;
  }
  else
  {
    v13 = v12 * a4;
    if (a4 <= 0.0)
    {
      if (-[TSDBezierPath elementCount](self, "elementCount") < 1)
      {
        a5 = 0;
      }
      else
      {
        a5 = 0;
        do
        {
          -[TSDBezierPath lengthOfElement:](self, "lengthOfElement:", a5);
          if (v24 > 0.0)
            break;
          ++a5;
        }
        while (a5 < -[TSDBezierPath elementCount](self, "elementCount"));
      }
      -[TSDBezierPath lengthOfElement:](self, "lengthOfElement:", a5);
      v22 = v13 / v25;
    }
    else
    {
      v14 = v13 - a6;
      v15 = -[TSDBezierPath elementCount](self, "elementCount");
      if (v15 <= a5)
      {
        do
        {
LABEL_7:
          if (v15-- < 1)
            break;
          -[TSDBezierPath lengthOfElement:](self, "lengthOfElement:", v15);
        }
        while (v18 <= 0.0);
        -[TSDBezierPath lengthOfElement:](self, "lengthOfElement:", v15);
        v19 = v14 + v16;
        a5 = v15;
      }
      else
      {
        while (1)
        {
          -[TSDBezierPath lengthOfElement:](self, "lengthOfElement:", a5);
          v14 = v14 - v16;
          if (v14 < 0.0)
            break;
          if (v15 == ++a5)
            goto LABEL_7;
        }
        v19 = v16 + v14;
      }
      v22 = v19 / v16;
    }
  }
  *a3 = v22;
  return a5;
}

- (CGPoint)pointAt:(double)a3 fromElement:(int64_t)a4
{
  double v6;
  float64x2_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float64_t v16;
  double v22;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  uint64_t v28;
  CGPoint result;

  v28 = *MEMORY[0x24BDAC8D0];
  switch(-[TSDBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", a4, &v24))
  {
    case 0uLL:
      v7 = v24;
      break;
    case 1uLL:
    case 3uLL:
      v7 = vmlaq_n_f64(vmulq_n_f64(v25, a3), v24, 1.0 - a3);
      break;
    case 2uLL:
      if (a3 >= 0.0)
      {
        v13 = 1.0;
        if (a3 <= 1.0)
        {
          __asm { FMOV            V4.2D, #3.0 }
          v7 = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(vmulq_n_f64(vmulq_n_f64(vmulq_f64(v25, _Q4), a3), 1.0 - a3), 1.0 - a3), vmulq_n_f64(vmulq_n_f64(v24, 1.0 - a3), 1.0 - a3), 1.0 - a3), vmulq_n_f64(vmulq_n_f64(vmulq_f64(v26, _Q4), a3), a3), 1.0 - a3), vmulq_n_f64(vmulq_n_f64(v27, a3), a3), a3);
          break;
        }
        *(float *)&v13 = a3;
        -[TSDBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", a4, v13);
        v10 = TSDMultiplyPointScalar(v14, v15, a3 + -1.0);
        v12 = v27.f64[1];
        v11 = v27.f64[0];
      }
      else
      {
        *(float *)&v6 = a3;
        -[TSDBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", a4, v6);
        v10 = TSDMultiplyPointScalar(v8, v9, a3);
        v12 = v24.f64[1];
        v11 = v24.f64[0];
      }
      v7.f64[0] = TSDAddPoints(v11, v12, v10);
      v7.f64[1] = v16;
      break;
    default:
      v7 = *(float64x2_t *)MEMORY[0x24BDBEFB0];
      break;
  }
  v22 = v7.f64[1];
  result.x = v7.f64[0];
  result.y = v22;
  return result;
}

- (CGPoint)gradientAt:(double)a3 fromElement:(int64_t)a4
{
  double v4;
  double v5;
  float v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  *(float *)&a3 = a3;
  -[TSDBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", a4, a3);
  v6 = v4 * v4 + v5 * v5;
  v7 = (float)(1.0 / sqrtf(v6));
  v8 = v5 * v7;
  v9 = v4 * v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)gradientAt:(float)a3
{
  int64_t v4;
  double v5;
  double v6;
  float v7;
  CGPoint result;

  v7 = 0.0;
  v4 = -[TSDBezierPath elementPercentage:forOverallPercentage:](self, "elementPercentage:forOverallPercentage:", &v7);
  -[TSDBezierPath gradientAt:fromElement:](self, "gradientAt:fromElement:", v4, v7);
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)transformedCoordinate:(CGPoint)a3 withPressure:(id)a4
{
  double y;
  double x;
  int64_t v8;
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
  float v23;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v23 = 0.0;
  *(float *)&a3.x = a3.x;
  v8 = -[TSDBezierPath elementPercentage:forOverallPercentage:](self, "elementPercentage:forOverallPercentage:", &v23, a3.x);
  -[TSDBezierPath pointAt:fromElement:](self, "pointAt:fromElement:", v8, v23);
  v10 = v9;
  v12 = v11;
  -[TSDBezierPath gradientAt:fromElement:](self, "gradientAt:fromElement:", v8, v23);
  v14 = v13;
  v16 = v15;
  -[TSDBezierPath lineWidth](self, "lineWidth");
  v18 = v17;
  if (a4)
    objc_msgSend(a4, "pressureAt:", x);
  else
    v19 = 1.0;
  v20 = y * (v18 * v19);
  v21 = v10 - v16 * v20;
  v22 = v12 + v14 * v20;
  result.y = v22;
  result.x = v21;
  return result;
}

- (CGPoint)transformedTotalCoordinate:(CGPoint)a3 inElement:(int64_t)a4 withPressure:(id)a5
{
  double y;
  double x;
  float v10;
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
  CGPoint result;

  y = a3.y;
  x = a3.x;
  *(float *)&a3.x = a3.x;
  -[TSDBezierPath elementPercentageFromElement:forOverallPercentage:](self, "elementPercentageFromElement:forOverallPercentage:", a3.x);
  v11 = v10;
  -[TSDBezierPath pointAt:fromElement:](self, "pointAt:fromElement:", a4, v10);
  v13 = v12;
  v15 = v14;
  -[TSDBezierPath gradientAt:fromElement:](self, "gradientAt:fromElement:", a4, v11);
  v17 = v16;
  v19 = v18;
  -[TSDBezierPath lineWidth](self, "lineWidth");
  v21 = v20;
  if (a5)
    objc_msgSend(a5, "pressureAt:", x);
  else
    v22 = 1.0;
  v23 = y * (v21 * v22);
  v24 = v13 - v19 * v23;
  v25 = v15 + v17 * v23;
  result.y = v25;
  result.x = v24;
  return result;
}

- (CGPoint)transformedTotalCoordinate:(CGPoint)a3 betweenElement:(int64_t)a4 andElement:(int64_t)a5 withPressure:(id)a6 getElement:(int64_t *)a7 getPercentage:(float *)a8
{
  double y;
  double x;
  float v16;
  int64_t v17;
  double v18;
  float v19;
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
  float v34;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v34 = 0.0;
  v16 = a3.x;
  *(float *)&a3.x = v16;
  v17 = -[TSDBezierPath elementPercentage:forOverallPercentage:](self, "elementPercentage:forOverallPercentage:", &v34, a3.x);
  if (v17 >= a4)
  {
    if (v17 <= a5)
    {
      v19 = v34;
      a4 = v17;
    }
    else
    {
      *(float *)&v18 = v16;
      -[TSDBezierPath elementPercentageFromElement:forOverallPercentage:](self, "elementPercentageFromElement:forOverallPercentage:", a5, v18);
      v34 = v19;
      a4 = a5;
    }
  }
  else
  {
    *(float *)&v18 = v16;
    -[TSDBezierPath elementPercentageFromElement:forOverallPercentage:](self, "elementPercentageFromElement:forOverallPercentage:", a4, v18);
    v34 = v19;
  }
  -[TSDBezierPath pointAt:fromElement:](self, "pointAt:fromElement:", a4, v19);
  v21 = v20;
  v23 = v22;
  -[TSDBezierPath gradientAt:fromElement:](self, "gradientAt:fromElement:", a4, v34);
  v25 = v24;
  v27 = v26;
  -[TSDBezierPath lineWidth](self, "lineWidth");
  v29 = v28;
  if (a6)
    objc_msgSend(a6, "pressureAt:", x);
  else
    v30 = 1.0;
  v31 = y * (v29 * v30);
  v32 = v21 - v27 * v31;
  v33 = v23 + v25 * v31;
  *a7 = a4;
  *a8 = v34;
  result.y = v33;
  result.x = v32;
  return result;
}

- (float)elementPercentageFromElement:(int)a3 forOverallPercentage:(float)a4
{
  double v7;
  double v8;
  uint64_t v9;
  float v10;
  double v11;
  float v12;
  double v13;
  double v14;

  -[TSDBezierPath length](self, "length");
  v8 = v7;
  if (a3 < 1)
  {
    v10 = 0.0;
  }
  else
  {
    v9 = 0;
    v10 = 0.0;
    do
    {
      -[TSDBezierPath lengthOfElement:](self, "lengthOfElement:", v9);
      v10 = v11 + v10;
      ++v9;
    }
    while (a3 != v9);
  }
  v12 = v8 * a4;
  v13 = (float)(v12 - v10);
  -[TSDBezierPath lengthOfElement:](self, "lengthOfElement:", a3);
  return v13 / v14;
}

- (CGPoint)rawGradientAt:(float)a3 fromElement:(int64_t)a4
{
  float64x2_t v5;
  float v6;
  double v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  uint64_t v19;
  CGPoint result;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = *(float64x2_t *)MEMORY[0x24BDBEFB0];
  switch(-[TSDBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", a4, &v15))
  {
    case 0uLL:
      NSLog((NSString *)CFSTR("GA can't handle move to"));
      goto LABEL_4;
    case 1uLL:
    case 3uLL:
      v5 = vsubq_f64(v16, v15);
      break;
    case 2uLL:
      v6 = 0.01;
      if (a3 >= 0.01)
        v6 = a3;
      if (v6 > 0.99)
        v6 = 0.99;
      __asm
      {
        FMOV            V4.2D, #-3.0
        FMOV            V5.2D, #3.0
      }
      v5 = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(vmulq_f64(v16, _Q5), (float)((float)((float)(v6 * -4.0) + 1.0) + (float)((float)(v6 * 3.0) * v6))), vmulq_n_f64(vmulq_f64(v15, _Q4), (float)(v6 + -1.0)), (float)(v6 + -1.0)), vmulq_n_f64(vmulq_f64(v17, _Q5), v6), (float)((float)(v6 * -3.0) + 2.0)), vmulq_n_f64(vmulq_f64(v18, _Q5), v6), v6);
      break;
    default:
LABEL_4:
      v5 = v14;
      break;
  }
  v13 = v5.f64[1];
  result.x = v5.f64[0];
  result.y = v13;
  return result;
}

- (CGPoint)myGradientAt:(float)a3
{
  int64_t v4;
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
  int v15;
  CGPoint result;

  v15 = 0;
  v4 = -[TSDBezierPath elementPercentage:forOverallPercentage:](self, "elementPercentage:forOverallPercentage:", &v15);
  LODWORD(v5) = v15;
  -[TSDBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", v4, v5);
  v7 = v6;
  v9 = v8;
  -[TSDBezierPath length](self, "length");
  v11 = v10;
  -[TSDBezierPath lengthOfElement:](self, "lengthOfElement:", v4);
  v13 = TSDMultiplyPointScalar(v7, v9, v11 / v12);
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)myGradientAt:(float)a3 fromElement:(int64_t)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  -[TSDBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:");
  v7 = v6;
  v9 = v8;
  -[TSDBezierPath length](self, "length");
  v11 = v10;
  -[TSDBezierPath lengthOfElement:](self, "lengthOfElement:", a4);
  v13 = TSDMultiplyPointScalar(v7, v9, v11 / v12);
  result.y = v14;
  result.x = v13;
  return result;
}

- (float)curvatureAt:(float)a3
{
  int64_t v4;
  double v5;
  double v6;
  float result;
  float v8;

  v8 = 0.0;
  v4 = -[TSDBezierPath elementPercentage:forOverallPercentage:](self, "elementPercentage:forOverallPercentage:", &v8);
  -[TSDBezierPath curvatureAt:fromElement:](self, "curvatureAt:fromElement:", v4, v8);
  v6 = v5;
  result = 0.5;
  if (v6 <= 0.5)
  {
    result = -0.5;
    if (v6 >= -0.5)
      return v6;
  }
  return result;
}

- (double)curvatureAt:(double)a3 fromElement:(int)a4
{
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = -[TSDBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", a4, &v13);
  if (v5 == 2)
  {
    v7 = 0.01;
    if (a3 >= 0.01)
      v7 = a3;
    if (v7 > 0.99)
      v7 = 0.99;
    v8 = (v7 * (v7 * (v19 - v17) + (1.0 - v7) * (v17 - v15)) + (1.0 - v7)
                                                             * (v7 * (v17 - v15) + (1.0 - v7) * (v15 - v13)))
       * 3.0;
    v9 = (v7 * (v7 * (v20 - v18) + (1.0 - v7) * (v18 - v16)) + (1.0 - v7)
                                                             * (v7 * (v18 - v16) + (1.0 - v7) * (v16 - v14)))
       * 3.0;
    v10 = v8 * ((v7 * (v20 - v18 - (v18 - v16)) + (1.0 - v7) * (v18 - v16 - (v16 - v14))) * 6.0)
        - v9 * ((v7 * (v19 - v17 - (v17 - v15)) + (1.0 - v7) * (v17 - v15 - (v15 - v13))) * 6.0);
    return (float)(v10 / pow(v9 * v9 + v8 * v8, 1.5));
  }
  else
  {
    v6 = 0.0;
    if (!v5)
      NSLog((NSString *)CFSTR("CA can't handle move to"));
  }
  return v6;
}

- (void)recursiveSubdivideOntoPath:(id)a3 into:(id)a4
{
  -[TSDBezierPath recursiveSubdivideOntoPath:withScaling:inElementRange:into:](self, "recursiveSubdivideOntoPath:withScaling:inElementRange:into:", a3, 0, objc_msgSend(a3, "elementCount") - 1, a4, 0.0, 1.0);
}

- (void)recursiveSubdivideOntoPath:(id)a3 withScaling:(id)a4 into:(id)a5
{
  -[TSDBezierPath recursiveSubdivideOntoPath:withScaling:inElementRange:into:](self, "recursiveSubdivideOntoPath:withScaling:inElementRange:into:", a3, 0, objc_msgSend(a3, "elementCount") - 1, a5, a4.var0, a4.var1);
}

- (void)recursiveSubdivideOntoPath:(id)a3 withScaling:(id)a4 inElementRange:(_NSRange)a5 into:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  TSDPathCut *v11;
  double v12;
  double v13;
  double v14;
  TSDPathCut *v15;
  double v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
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
  float v33;
  double v34;
  double v35;
  double v36;
  float v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  float v45;
  float v46;
  float v47;
  TSDPathCut *v48;
  double v49;
  TSDPathCut *v50;
  double v51;
  double v52;
  double v53;
  TSDPathCut *v54;
  TSDPathCut *v55;
  double v56;
  double v57;
  double v58;
  TSDPathCut *v59;
  int64_t v60;
  int64_t v61;
  uint64_t v62;
  BOOL v63;
  unint64_t v64;
  BOOL v65;
  unint64_t v66;
  float64x2_t v67;
  float64x2_t v68;
  double v69;
  double v70;
  double v71;
  double v72;
  float64_t v73;
  double v74;
  uint64_t v75;
  double var1;
  double v77;
  double var0;
  double v79;
  float64x2_t v81;
  float64x2_t v82;
  float64x2_t v83;
  float64x2_t v84;
  float64x2_t v85;
  double v86;
  uint64_t v87;
  float64x2_t v88;
  uint64_t v89;

  length = a5.length;
  location = a5.location;
  var1 = a4.var1;
  var0 = a4.var0;
  v89 = *MEMORY[0x24BDAC8D0];
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = [TSDPathCut alloc];
  objc_msgSend(a3, "lengthToElement:", location);
  v13 = v12;
  objc_msgSend(a3, "length");
  v15 = -[TSDPathCut initWithSegment:atT:withSkew:](v11, "initWithSegment:atT:withSkew:", location, v13 / v14, 0.0);
  objc_msgSend(v10, "addObject:", v15);

  objc_msgSend(a3, "miterLimit");
  v17 = location + length;
  v18 = location + 1;
  if (v18 < v17)
  {
    v77 = v16 * 0.995;
    v19 = length - 1;
    do
    {
      v20 = v18 + 1;
      objc_msgSend(a3, "lengthOfElement:", v18 + 1, *(_QWORD *)&var1);
      if (v21 >= 0.1)
      {
        objc_msgSend(a3, "lengthOfElement:", v18);
        if (v22 >= 0.1)
        {
          objc_msgSend(a3, "gradientAt:fromElement:", v18, 1.0);
          v25 = TSDNormalizePoint(v23, v24);
          v27 = v26;
          objc_msgSend(a3, "gradientAt:fromElement:", v18 + 1, 0.0);
          v30 = TSDNormalizePoint(v28, v29);
          v32 = v31;
          v33 = TSDDotPoints(v25, v27, v30, v31);
          if (v33 < 0.99)
          {
            objc_msgSend(a3, "lengthToElement:", v18 + 1, v33);
            v79 = v34;
            objc_msgSend(a3, "length");
            v36 = v35;
            v37 = 0.0;
            if (v20 < v17)
            {
              v38 = TSDMultiplyPointScalar(v30, v32, -1.0);
              v39 = TSDAddPoints(v25, v27, v38);
              v41 = v40;
              v42 = -TSDDotPoints(v25, v27, v39, v40);
              v43 = TSDRotatePoint90Degrees(0, v25, v27);
              v37 = v42 / TSDDotPoints(v39, v41, v43, v44);
              v45 = fmin(fmax((float)-v33, -1.0), 1.0);
              v46 = acosf(v45);
              if (1.0 / sinf(v46 * 0.5) > v77)
                v37 = 0.0;
            }
            v47 = v79 / v36;
            v48 = -[TSDPathCut initWithSegment:atT:withSkew:]([TSDPathCut alloc], "initWithSegment:atT:withSkew:", v18, v47, v37);
            objc_msgSend(v10, "addObject:", v48);

          }
        }
      }
      v18 = v20;
      --v19;
    }
    while (v19);
  }
  if (v17)
  {
    while (1)
    {
      objc_msgSend(a3, "lengthOfElement:", v17, *(_QWORD *)&var1);
      if (v49 >= 0.1)
        break;
      if (!--v17)
        goto LABEL_14;
    }
    v55 = [TSDPathCut alloc];
    objc_msgSend(a3, "lengthToElement:", v17 + 1);
    v57 = v56;
    objc_msgSend(a3, "length");
    v59 = -[TSDPathCut initWithSegment:atT:withSkew:](v55, "initWithSegment:atT:withSkew:", v17, v57 / v58, 0.0);
    objc_msgSend(v10, "addObject:", v59);

    v83 = *(float64x2_t *)MEMORY[0x24BDBEFB0];
    v60 = -[TSDBezierPath elementCount](self, "elementCount");
    if (v60)
    {
      v61 = v60;
      v62 = 0;
      v63 = 0;
      do
      {
        v64 = -[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v62, &v85);
        v65 = v64 == 0;
        if (v64)
        {
          v66 = v64;
          if (v64 == 2)
          {
            v85.f64[0] = var0 + v85.f64[0] * var1;
            v86 = var0 + v86 * var1;
            v88.f64[0] = var0 + v88.f64[0] * var1;
            v81 = v88;
            recursiveSubdivideCurveSplit(&v84, a3, 0, a6, v63, v10);
            v84 = v81;
          }
          else
          {
            if (v64 == 3)
            {
              v85 = v83;
              v67 = v83;
            }
            else
            {
              v67.f64[0] = var0 + v85.f64[0] * var1;
              v85.f64[0] = v67.f64[0];
            }
            v68 = v84;
            v69 = TSDSubtractPoints(v67.f64[0], v85.f64[1], v84.f64[0]);
            v71 = v70;
            v88 = v85;
            v72 = TSDMultiplyPointScalar(v69, v70, 0.33);
            v85.f64[0] = TSDAddPoints(v68.f64[0], v68.f64[1], v72);
            v85.f64[1] = v73;
            v74 = TSDMultiplyPointScalar(v69, v71, 0.66);
            v86 = TSDAddPoints(v68.f64[0], v68.f64[1], v74);
            v87 = v75;
            v82 = v88;
            recursiveSubdivideCurveSplit(&v84, a3, 0, a6, v63, v10);
            v84 = v82;
            if (v66 == 3)
              objc_msgSend(a6, "closePath");
          }
        }
        else
        {
          v85.f64[0] = var0 + v85.f64[0] * var1;
          v83 = v85;
          v84 = v85;
        }
        ++v62;
        v63 = v65;
      }
      while (v61 != v62);
    }
  }
  else
  {
LABEL_14:
    v50 = [TSDPathCut alloc];
    objc_msgSend(a3, "lengthToElement:", 1);
    v52 = v51;
    objc_msgSend(a3, "length");
    v54 = -[TSDPathCut initWithSegment:atT:withSkew:](v50, "initWithSegment:atT:withSkew:", 0, v52 / v53, 0.0);
    objc_msgSend(v10, "addObject:", v54);

  }
}

- (id)chisel
{
  id v3;
  double v4;
  float v5;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  BOOL v9;
  float v10;
  float v11;
  BOOL v12;
  unint64_t v13;
  double v14;
  unint64_t v15;
  double v16;
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
  double v30;
  float v31;
  float v32;
  float v33;
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
  double v48;
  double v49;
  double v51;
  double v52;
  double v53;
  double v54;
  uint64_t v55;
  float v56;
  double v57;
  float v58;
  float v59;
  unint64_t v60;
  double v61;
  BOOL v62;
  unint64_t v63;
  double v64;
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
  float v75;
  float v76;
  float v77;
  double v78;
  float v79;
  float v80;
  float v81;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v99;
  double v100;
  double v101;
  double v102;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  float64x2_t v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  v3 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
  -[TSDBezierPath lineWidth](self, "lineWidth");
  v5 = v4 * 0.5;
  v6 = -[TSDBezierPath elementCount](self, "elementCount");
  if (!v6)
  {
    v9 = 1;
    v55 = -1;
    goto LABEL_60;
  }
  v7 = v6;
  v8 = 0;
  v9 = 1;
  v10 = 9.0;
  v11 = -3.0;
  do
  {
    v12 = v9;
    v13 = -[TSDBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", v8, &v112);
    v9 = v13 == 0;
    if (!v13)
      goto LABEL_56;
    v15 = v13;
    LODWORD(v14) = 0;
    -[TSDBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", v8, v14);
    if (v16 <= 0.0)
      v17 = -v5;
    else
      v17 = v5;
    if (v15 == 2)
    {
      v18 = v112.f64[0];
      v19 = v113;
      v20 = v115;
      v21 = v117;
      v22 = (float)((float)((float)(v19 * v10) + (float)(v18 * v11)) + (float)(v20 * -9.0)) + (float)(v21 * 3.0);
      v23 = (float)((float)(v19 * -12.0) + (float)(v18 * 6.0)) + (float)(v20 * 6.0);
      v24 = (float)(v19 * 3.0) + (float)(v18 * v11);
      v25 = (float)(v24 * (float)(v22 * -4.0)) + (float)(v23 * v23);
      if (v25 <= 0.0)
      {
        v36 = v17;
        v37 = v112.f64[1] + v17;
        if (v12)
          objc_msgSend(v3, "moveToPoint:", v112.f64[0], v37);
        else
          objc_msgSend(v3, "lineToPoint:", v112.f64[0], v37);
        v41 = v117;
        v42 = v118 + v36;
        v43 = v113;
        v44 = v114 + v36;
        v45 = v115;
        v46 = v116;
        goto LABEL_55;
      }
      v26 = sqrtf(v25);
      v27 = (float)((float)-v23 - v26) / (float)(v22 + v22);
      v28 = (float)(v26 - v23) / (float)(v22 + v22);
      if (v28 >= v27)
        v29 = v28;
      else
        v29 = v27;
      if (v28 < v27)
        v27 = v28;
      v30 = fabsf(v22);
      v31 = (float)-v24 / v23;
      if (v30 <= 0.001)
        v32 = 10.0;
      else
        v32 = v29;
      if (v30 <= 0.001)
        v33 = v31;
      else
        v33 = v27;
      if (v33 > 0.0 && v33 < 1.0)
      {
        v38 = v33;
        TSDCurveBetween(&v112, (uint64_t)&v104, 0.0, v33);
        v39 = v17;
        v40 = v105 + v39;
        if (v12)
          objc_msgSend(v3, "moveToPoint:", v104, v40);
        else
          objc_msgSend(v3, "lineToPoint:", v104, v40);
        objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v110, v111 + v39, v106, v107 + v39, v108, v109 + v39);
        v47 = v38 + 0.01;
        *(float *)&v47 = v38 + 0.01;
        -[TSDBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", v8, v47);
        v12 = 0;
        if (v48 <= 0.0)
          v17 = -v5;
        else
          v17 = v5;
      }
      else
      {
        v33 = 0.0;
      }
      v49 = v33;
      if (v32 > 0.0 && v32 < 1.0)
      {
        v51 = v32;
        TSDCurveBetween(&v112, (uint64_t)&v104, v49, v32);
        v52 = v105 + v17;
        if (v12)
          objc_msgSend(v3, "moveToPoint:", v104, v52);
        else
          objc_msgSend(v3, "lineToPoint:", v104, v52);
        v10 = 9.0;
        objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v110, v111 + v17, v106, v107 + v17, v108, v109 + v17);
        v53 = v51 + 0.01;
        *(float *)&v53 = v51 + 0.01;
        -[TSDBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", v8, v53);
        if (v54 <= 0.0)
          v17 = -v5;
        else
          v17 = v5;
        TSDCurveBetween(&v112, (uint64_t)&v104, v51, 1.0);
      }
      else
      {
        TSDCurveBetween(&v112, (uint64_t)&v104, v49, 1.0);
        if (v12)
        {
          v36 = v17;
          objc_msgSend(v3, "moveToPoint:", v104, v105 + v17);
          v10 = 9.0;
          v11 = -3.0;
LABEL_54:
          v41 = v110;
          v42 = v111 + v36;
          v43 = v106;
          v44 = v107 + v36;
          v45 = v108;
          v46 = v109;
LABEL_55:
          objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v41, v42, v43, v44, v45, v46 + v36);
          goto LABEL_56;
        }
        v10 = 9.0;
      }
      v11 = -3.0;
      v36 = v17;
      objc_msgSend(v3, "lineToPoint:", v104, v105 + v17);
      goto LABEL_54;
    }
    v35 = v112.f64[1] + v17;
    if (v12)
      objc_msgSend(v3, "moveToPoint:", v112.f64[0], v35);
    else
      objc_msgSend(v3, "lineToPoint:", v112.f64[0], v35);
    objc_msgSend(v3, "lineToPoint:", v113, v114 + v17);
LABEL_56:
    ++v8;
  }
  while (v7 != v8);
  v55 = v7 - 1;
  if (v55)
  {
LABEL_60:
    if (*MEMORY[0x24BDBEFB0] >= 0.0)
      v56 = -v5;
    else
      v56 = v5;
    v57 = v56;
    v58 = 9.0;
    v59 = -3.0;
    do
    {
      v60 = -[TSDBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", v55, &v112);
      v62 = v60 == 0;
      if (v60)
      {
        v63 = v60;
        LODWORD(v61) = 1.0;
        -[TSDBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", v55, v61);
        if (v64 >= 0.0)
          v65 = -v5;
        else
          v65 = v5;
        if (v63 == 2)
        {
          v66 = v112.f64[0];
          v67 = v113;
          v68 = v115;
          v69 = v117;
          v70 = (float)((float)((float)(v67 * v58) + (float)(v66 * v59)) + (float)(v68 * -9.0)) + (float)(v69 * 3.0);
          v71 = (float)((float)(v67 * -12.0) + (float)(v66 * 6.0)) + (float)(v68 * 6.0);
          v72 = (float)(v67 * 3.0) + (float)(v66 * v59);
          v73 = (float)(v72 * (float)(v70 * -4.0)) + (float)(v71 * v71);
          if (v73 <= 0.0)
          {
            v86 = v65;
            if (v9)
              objc_msgSend(v3, "moveToPoint:");
            else
              objc_msgSend(v3, "lineToPoint:");
            v90 = v112.f64[0];
            v91 = v112.f64[1] + v86;
            v92 = v115;
            v93 = v116 + v86;
            v94 = v113;
            v95 = v114;
          }
          else
          {
            v74 = sqrtf(v73);
            v75 = (float)((float)-v71 - v74) / (float)(v70 + v70);
            v76 = (float)(v74 - v71) / (float)(v70 + v70);
            if (v76 <= v75)
              v77 = v76;
            else
              v77 = v75;
            if (v76 > v75)
              v75 = v76;
            v78 = fabsf(v70);
            v79 = (float)-v72 / v71;
            if (v78 <= 0.001)
              v80 = 10.0;
            else
              v80 = v77;
            if (v78 <= 0.001)
              v81 = v79;
            else
              v81 = v75;
            if (v81 > 0.0 && v81 < 1.0)
            {
              v87 = v81;
              TSDCurveBetween(&v112, (uint64_t)&v104, v81, 1.0);
              v88 = v65;
              v89 = v111 + v88;
              if (v9)
                objc_msgSend(v3, "moveToPoint:", v110, v89);
              else
                objc_msgSend(v3, "lineToPoint:", v110, v89);
              objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v104, v105 + v88, v108, v109 + v88, v106, v107 + v88);
              v96 = v87 + -0.01;
              *(float *)&v96 = v87 + -0.01;
              -[TSDBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", v55, v96);
              v9 = 0;
              if (v97 >= 0.0)
                v65 = -v5;
              else
                v65 = v5;
            }
            else
            {
              v81 = 1.0;
            }
            if (v80 > 0.0 && v80 < 1.0)
            {
              v99 = v80;
              TSDCurveBetween(&v112, (uint64_t)&v104, v80, v81);
              v100 = v111 + v65;
              if (v9)
                objc_msgSend(v3, "moveToPoint:", v110, v100);
              else
                objc_msgSend(v3, "lineToPoint:", v110, v100);
              v58 = 9.0;
              objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v104, v105 + v65, v108, v109 + v65, v106, v107 + v65);
              v101 = v99 + -0.01;
              *(float *)&v101 = v99 + -0.01;
              -[TSDBezierPath rawGradientAt:fromElement:](self, "rawGradientAt:fromElement:", v55, v101);
              if (v102 >= 0.0)
                v65 = -v5;
              else
                v65 = v5;
              TSDCurveBetween(&v112, (uint64_t)&v104, 0.0, v99);
            }
            else
            {
              TSDCurveBetween(&v112, (uint64_t)&v104, 0.0, v81);
              if (v9)
              {
                v86 = v65;
                objc_msgSend(v3, "moveToPoint:", v110, v111 + v65);
                v58 = 9.0;
                v59 = -3.0;
                goto LABEL_117;
              }
              v58 = 9.0;
            }
            v59 = -3.0;
            v86 = v65;
            objc_msgSend(v3, "lineToPoint:", v110, v111 + v65);
LABEL_117:
            v90 = v104;
            v91 = v105 + v86;
            v92 = v108;
            v93 = v109 + v86;
            v94 = v106;
            v95 = v107;
          }
          objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v90, v91, v92, v93, v94, v95 + v86);
          goto LABEL_119;
        }
        v85 = v114 + v65;
        if (v9)
          objc_msgSend(v3, "moveToPoint:", v113, v85);
        else
          objc_msgSend(v3, "lineToPoint:", v113, v85);
        v83 = v112.f64[0];
        v84 = v112.f64[1] + v65;
      }
      else
      {
        v83 = v112.f64[0];
        v84 = v112.f64[1] - v57;
      }
      objc_msgSend(v3, "lineToPoint:", v83, v84);
LABEL_119:
      v9 = v62;
      --v55;
    }
    while (v55);
  }
  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    +[TSDBezierPath setVersion:](TSDBezierPath, "setVersion:", 524);
}

+ (id)bezierPath
{
  return objc_alloc_init((Class)a1);
}

+ (TSDBezierPath)bezierPathWithStart:(CGPoint)a3 end:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  TSDBezierPath *v8;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v8 = (TSDBezierPath *)objc_msgSend(a1, "bezierPath");
  -[TSDBezierPath moveToPoint:](v8, "moveToPoint:", v7, v6);
  -[TSDBezierPath lineToPoint:](v8, "lineToPoint:", x, y);
  return v8;
}

+ (TSDBezierPath)bezierPathWithRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  TSDBezierPath *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (TSDBezierPath *)objc_msgSend(a1, "bezierPath");
  -[TSDBezierPath appendBezierPathWithRect:](v7, "appendBezierPathWithRect:", x, y, width, height);
  return v7;
}

+ (TSDBezierPath)bezierPathWithOvalInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  TSDBezierPath *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (TSDBezierPath *)objc_msgSend(a1, "bezierPath");
  -[TSDBezierPath appendBezierPathWithOvalInRect:](v7, "appendBezierPathWithOvalInRect:", x, y, width, height);
  return v7;
}

+ (TSDBezierPath)bezierPathWithRoundedRect:(CGRect)a3 cornerRadius:(double)a4
{
  CGPath *v4;
  TSDBezierPath *v5;

  v4 = TSDCreateRoundRectPathForRectWithRadius(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
  v5 = +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", v4);
  CGPathRelease(v4);
  return v5;
}

- (void)copyPathAttributesTo:(id)a3
{
  double *sfr_dashedLinePattern;

  objc_msgSend(a3, "setWindingRule:", -[TSDBezierPath windingRule](self, "windingRule"));
  objc_msgSend(a3, "setLineCapStyle:", -[TSDBezierPath lineCapStyle](self, "lineCapStyle"));
  objc_msgSend(a3, "setLineJoinStyle:", -[TSDBezierPath lineJoinStyle](self, "lineJoinStyle"));
  -[TSDBezierPath lineWidth](self, "lineWidth");
  objc_msgSend(a3, "setLineWidth:");
  -[TSDBezierPath miterLimit](self, "miterLimit");
  objc_msgSend(a3, "setMiterLimit:");
  -[TSDBezierPath flatness](self, "flatness");
  objc_msgSend(a3, "setFlatness:");
  sfr_dashedLinePattern = self->sfr_dashedLinePattern;
  if (sfr_dashedLinePattern)
    objc_msgSend(a3, "setLineDash:count:phase:", sfr_dashedLinePattern, self->sfr_dashedLineCount, self->sfr_dashedLinePhase);
}

+ (TSDBezierPath)bezierPathWithCGPath:(CGPath *)a3
{
  TSDBezierPath *v4;

  v4 = (TSDBezierPath *)objc_msgSend(a1, "bezierPath");
  CGPathApply(a3, v4, (CGPathApplierFunction)pBuildBezierPath);
  return v4;
}

+ (void)fillRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  CGRect v8;

  if (a3.size.width >= 0.0)
  {
    height = a3.size.height;
    if (a3.size.height >= 0.0)
    {
      width = a3.size.width;
      y = a3.origin.y;
      x = a3.origin.x;
      CurrentContext = UIGraphicsGetCurrentContext();
      v8.origin.x = x;
      v8.origin.y = y;
      v8.size.width = width;
      v8.size.height = height;
      CGContextFillRect(CurrentContext, v8);
    }
  }
}

+ (void)strokeRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat MaxX;
  CGFloat v11;
  CGFloat v12;
  CGFloat MaxY;
  CGFloat v14;
  CGFloat v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  if (a3.size.width >= 0.0)
  {
    height = a3.size.height;
    if (a3.size.height >= 0.0)
    {
      width = a3.size.width;
      y = a3.origin.y;
      x = a3.origin.x;
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextSaveGState(CurrentContext);
      CGContextSetLineCap(CurrentContext, (CGLineCap)sfrdefaultLineCapStyle);
      CGContextSetLineJoin(CurrentContext, (CGLineJoin)sfrdefaultLineJoinStyle);
      _SFRSetLineWidth(CurrentContext, *(CGFloat *)&sfrdefaultLineWidth);
      CGContextSetMiterLimit(CurrentContext, *(CGFloat *)&sfrdefaultMiterLimit);
      CGContextBeginPath(CurrentContext);
      v16.origin.x = x;
      v16.origin.y = y;
      v16.size.width = width;
      v16.size.height = height;
      MinX = CGRectGetMinX(v16);
      v17.origin.x = x;
      v17.origin.y = y;
      v17.size.width = width;
      v17.size.height = height;
      MinY = CGRectGetMinY(v17);
      CGContextMoveToPoint(CurrentContext, MinX, MinY);
      v18.origin.x = x;
      v18.origin.y = y;
      v18.size.width = width;
      v18.size.height = height;
      MaxX = CGRectGetMaxX(v18);
      v19.origin.x = x;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      v11 = CGRectGetMinY(v19);
      CGContextAddLineToPoint(CurrentContext, MaxX, v11);
      v20.origin.x = x;
      v20.origin.y = y;
      v20.size.width = width;
      v20.size.height = height;
      v12 = CGRectGetMaxX(v20);
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      MaxY = CGRectGetMaxY(v21);
      CGContextAddLineToPoint(CurrentContext, v12, MaxY);
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      v14 = CGRectGetMinX(v22);
      v23.origin.x = x;
      v23.origin.y = y;
      v23.size.width = width;
      v23.size.height = height;
      v15 = CGRectGetMaxY(v23);
      CGContextAddLineToPoint(CurrentContext, v14, v15);
      CGContextClosePath(CurrentContext);
      CGContextStrokePath(CurrentContext);
      CGContextRestoreGState(CurrentContext);
    }
  }
}

+ (void)clipRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  CGRect v8;

  if (a3.size.width >= 0.0)
  {
    height = a3.size.height;
    if (a3.size.height >= 0.0)
    {
      width = a3.size.width;
      y = a3.origin.y;
      x = a3.origin.x;
      CurrentContext = UIGraphicsGetCurrentContext();
      v8.origin.x = x;
      v8.origin.y = y;
      v8.size.width = width;
      v8.size.height = height;
      CGContextClipToRect(CurrentContext, v8);
    }
  }
}

+ (void)strokeLineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat v6;
  CGFloat v7;
  CGContext *CurrentContext;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextSetLineCap(CurrentContext, (CGLineCap)sfrdefaultLineCapStyle);
  CGContextSetLineJoin(CurrentContext, (CGLineJoin)sfrdefaultLineJoinStyle);
  _SFRSetLineWidth(CurrentContext, *(CGFloat *)&sfrdefaultLineWidth);
  CGContextBeginPath(CurrentContext);
  CGContextMoveToPoint(CurrentContext, v7, v6);
  CGContextAddLineToPoint(CurrentContext, x, y);
  CGContextStrokePath(CurrentContext);
  CGContextRestoreGState(CurrentContext);
}

+ (void)setDefaultMiterLimit:(double)a3
{
  sfrdefaultMiterLimit = *(_QWORD *)&a3;
}

+ (double)defaultMiterLimit
{
  return *(double *)&sfrdefaultMiterLimit;
}

+ (void)setDefaultFlatness:(double)a3
{
  sfrdefaultFlatness = *(_QWORD *)&a3;
}

+ (double)defaultFlatness
{
  return *(double *)&sfrdefaultFlatness;
}

+ (void)setDefaultWindingRule:(unint64_t)a3
{
  sfrdefaultWindingRule = a3;
}

+ (unint64_t)defaultWindingRule
{
  return sfrdefaultWindingRule;
}

+ (void)setDefaultLineCapStyle:(unint64_t)a3
{
  sfrdefaultLineCapStyle = a3;
}

+ (unint64_t)defaultLineCapStyle
{
  return sfrdefaultLineCapStyle;
}

+ (void)setDefaultLineJoinStyle:(unint64_t)a3
{
  sfrdefaultLineJoinStyle = a3;
}

+ (unint64_t)defaultLineJoinStyle
{
  return sfrdefaultLineJoinStyle;
}

+ (void)setDefaultLineWidth:(double)a3
{
  sfrdefaultLineWidth = *(_QWORD *)&a3;
}

+ (double)defaultLineWidth
{
  return *(double *)&sfrdefaultLineWidth;
}

- (TSDBezierPath)init
{
  TSDBezierPath *result;
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags;
  $7B3C09426D5A94CD5FE07DCF037609F1 v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDBezierPath;
  result = -[TSDBezierPath init](&v6, sel_init);
  sfr_bpFlags = result->sfr_bpFlags;
  *(_OWORD *)&result->sfr_elementCount = 0u;
  *(_OWORD *)&result->sfr_head = 0u;
  result->sfr_extraSegmentCount = 0;
  result->sfr_extraSegmentMax = 0;
  result->sfr_totalLength = 0.0;
  result->sfr_lastSubpathIndex = -1;
  result->sfr_extraSegments = 0;
  v4 = ($7B3C09426D5A94CD5FE07DCF037609F1)(((8 * sfrdefaultWindingRule) | ((_BYTE)sfrdefaultLineCapStyle << 6)) | 5 | *(_DWORD *)&sfr_bpFlags & 0xFFFFF800 | (16 * (sfrdefaultLineJoinStyle & 0xF)));
  *(_QWORD *)&result->sfr_lineWidth = sfrdefaultLineWidth;
  v5 = *(double *)&sfrdefaultFlatness;
  *(_QWORD *)&result->sfr_miterLimit = sfrdefaultMiterLimit;
  result->sfr_flatness = v5;
  result->sfr_dashedLinePattern = 0;
  result->sfr_dashedLineCount = 0;
  result->sfr_dashedLinePhase = 0.0;
  result->sfr_bpFlags = v4;
  return result;
}

- (void)dealloc
{
  NSZone *v3;
  double *sfr_dashedLinePattern;
  void *sfr_path;
  void *sfr_extraSegments;
  objc_super v7;

  v3 = (NSZone *)-[TSDBezierPath zone](self, "zone");
  NSZoneFree(v3, self->sfr_head);
  NSZoneFree(v3, self->sfr_elementLength);
  sfr_dashedLinePattern = self->sfr_dashedLinePattern;
  if (sfr_dashedLinePattern)
    NSZoneFree(v3, sfr_dashedLinePattern);
  sfr_path = self->sfr_path;
  if (sfr_path)
    CFRelease(sfr_path);
  sfr_extraSegments = self->sfr_extraSegments;
  if (sfr_extraSegments)
    NSZoneFree(v3, sfr_extraSegments);
  v7.receiver = self;
  v7.super_class = (Class)TSDBezierPath;
  -[TSDBezierPath dealloc](&v7, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  double *sfr_dashedLinePattern;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "appendBezierPath:", self);
  objc_msgSend(v4, "setWindingRule:", -[TSDBezierPath windingRule](self, "windingRule"));
  objc_msgSend(v4, "setLineCapStyle:", -[TSDBezierPath lineCapStyle](self, "lineCapStyle"));
  objc_msgSend(v4, "setLineJoinStyle:", -[TSDBezierPath lineJoinStyle](self, "lineJoinStyle"));
  -[TSDBezierPath lineWidth](self, "lineWidth");
  objc_msgSend(v4, "setLineWidth:");
  -[TSDBezierPath miterLimit](self, "miterLimit");
  objc_msgSend(v4, "setMiterLimit:");
  -[TSDBezierPath flatness](self, "flatness");
  objc_msgSend(v4, "setFlatness:");
  sfr_dashedLinePattern = self->sfr_dashedLinePattern;
  if (sfr_dashedLinePattern)
    objc_msgSend(v4, "setLineDash:count:phase:", sfr_dashedLinePattern, self->sfr_dashedLineCount, self->sfr_dashedLinePhase);
  return v4;
}

- (void)lineToPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (-[TSDBezierPath isEmpty](self, "isEmpty"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("No current point for line"));
  -[TSDBezierPath _deviceLineToPoint:](self, "_deviceLineToPoint:", x, y);
}

- (void)curveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v9 = a3.y;
  v10 = a3.x;
  if (-[TSDBezierPath isEmpty](self, "isEmpty"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("No current point for curve"));
  -[TSDBezierPath _deviceCurveToPoint:controlPoint1:controlPoint2:](self, "_deviceCurveToPoint:controlPoint1:controlPoint2:", v10, v9, v8, v7, x, y);
}

- (void)removeAllPoints
{
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags;
  void *sfr_path;

  sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF);
  self->sfr_bpFlags = sfr_bpFlags;
  self->sfr_elementCount = 0;
  self->sfr_extraSegmentCount = 0;
  self->sfr_lastSubpathIndex = -1;
  sfr_path = self->sfr_path;
  if (sfr_path)
  {
    CFRelease(sfr_path);
    self->sfr_path = 0;
    sfr_bpFlags = self->sfr_bpFlags;
  }
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&sfr_bpFlags | 1);
}

- (void)relativeMoveToPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;

  y = a3.y;
  x = a3.x;
  -[TSDBezierPath currentPoint](self, "currentPoint");
  -[TSDBezierPath _deviceMoveToPoint:](self, "_deviceMoveToPoint:", x + v6, y + v7);
}

- (void)relativeLineToPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;

  y = a3.y;
  x = a3.x;
  -[TSDBezierPath currentPoint](self, "currentPoint");
  -[TSDBezierPath _deviceLineToPoint:](self, "_deviceLineToPoint:", x + v6, y + v7);
}

- (void)relativeCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v9 = a3.y;
  v10 = a3.x;
  -[TSDBezierPath currentPoint](self, "currentPoint");
  -[TSDBezierPath _deviceCurveToPoint:controlPoint1:controlPoint2:](self, "_deviceCurveToPoint:controlPoint1:controlPoint2:", v10 + v12, v9 + v13, v8 + v12, v7 + v13, x + v12, y + v13);
}

- (double)lineWidth
{
  return self->sfr_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->sfr_lineWidth = a3;
}

- (unint64_t)lineCapStyle
{
  return *(_DWORD *)&self->sfr_bpFlags >> 6;
}

- (void)setLineCapStyle:(unint64_t)a3
{
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFF3F | ((a3 & 3) << 6));
}

- (unint64_t)lineJoinStyle
{
  return ((unint64_t)self->sfr_bpFlags >> 4) & 3;
}

- (void)setLineJoinStyle:(unint64_t)a3
{
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFFCF | (16 * (a3 & 0xF)));
}

- (unint64_t)windingRule
{
  return ((unint64_t)self->sfr_bpFlags >> 3) & 1;
}

- (void)setWindingRule:(unint64_t)a3
{
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFFF7 | (8 * (a3 & 0x1F)));
}

- (double)miterLimit
{
  return self->sfr_miterLimit;
}

- (void)setMiterLimit:(double)a3
{
  self->sfr_miterLimit = a3;
}

- (double)flatness
{
  return self->sfr_flatness;
}

- (void)setFlatness:(double)a3
{
  self->sfr_flatness = a3;
}

- (void)setLineDash:(const double *)a3 count:(int64_t)a4 phase:(double)a5
{
  double **p_sfr_dashedLinePattern;
  double *sfr_dashedLinePattern;
  const double *v10;
  NSZone *v11;
  double *v12;
  uint64_t v13;

  p_sfr_dashedLinePattern = &self->sfr_dashedLinePattern;
  sfr_dashedLinePattern = self->sfr_dashedLinePattern;
  if (a3)
  {
    v10 = a3;
    v11 = (NSZone *)-[TSDBezierPath zone](self, "zone");
    if (sfr_dashedLinePattern)
      v12 = (double *)NSZoneRealloc(v11, *p_sfr_dashedLinePattern, 8 * a4);
    else
      v12 = (double *)NSZoneMalloc(v11, 8 * a4);
    self->sfr_dashedLinePattern = v12;
    self->sfr_dashedLineCount = a4;
    self->sfr_dashedLinePhase = a5;
    if (a4 >= 1)
    {
      do
      {
        v13 = *(_QWORD *)v10++;
        *(_QWORD *)v12++ = v13;
        --a4;
      }
      while (a4);
    }
  }
  else if (sfr_dashedLinePattern)
  {
    NSZoneFree((NSZone *)-[TSDBezierPath zone](self, "zone", a5), self->sfr_dashedLinePattern);
    *p_sfr_dashedLinePattern = 0;
    p_sfr_dashedLinePattern[1] = 0;
    p_sfr_dashedLinePattern[2] = 0;
  }
}

- (void)getLineDash:(double *)a3 count:(int64_t *)a4 phase:(double *)a5
{
  double *sfr_dashedLinePattern;
  unint64_t i;
  uint64_t v7;

  if (a4)
    *a4 = self->sfr_dashedLineCount;
  if (a5)
    *a5 = self->sfr_dashedLinePhase;
  if (a3)
  {
    sfr_dashedLinePattern = self->sfr_dashedLinePattern;
    if (sfr_dashedLinePattern)
    {
      for (i = self->sfr_dashedLineCount; i; --i)
      {
        v7 = *(_QWORD *)sfr_dashedLinePattern++;
        *(_QWORD *)a3++ = v7;
      }
    }
  }
}

- (void)_doPath
{
  CGPath *Mutable;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v6;
  CGFloat *sfr_extraSegments;

  if (!self->sfr_path && !-[TSDBezierPath isEmpty](self, "isEmpty"))
  {
    Mutable = CGPathCreateMutable();
    sfr_elementCount = self->sfr_elementCount;
    if (sfr_elementCount >= 1)
    {
      sfr_head = self->sfr_head;
      v6 = &sfr_head[6 * sfr_elementCount];
      sfr_extraSegments = (CGFloat *)self->sfr_extraSegments;
      do
      {
        switch(*(_DWORD *)sfr_head & 0xF)
        {
          case 0:
            CGPathMoveToPoint(Mutable, 0, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
            break;
          case 1:
            CGPathAddLineToPoint(Mutable, 0, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
            break;
          case 2:
            CGPathAddCurveToPoint(Mutable, 0, *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
            sfr_extraSegments += 4;
            break;
          case 3:
            CGPathCloseSubpath(Mutable);
            break;
          default:
            break;
        }
        sfr_head += 6;
      }
      while (sfr_head < v6);
    }
    self->sfr_path = Mutable;
  }
}

- (void)stroke
{
  CGContext *CurrentContext;
  double *sfr_dashedLinePattern;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v7;
  CGFloat *sfr_extraSegments;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextSetLineCap(CurrentContext, (CGLineCap)-[TSDBezierPath lineCapStyle](self, "lineCapStyle"));
  CGContextSetLineJoin(CurrentContext, (CGLineJoin)-[TSDBezierPath lineJoinStyle](self, "lineJoinStyle"));
  _SFRSetLineWidth(CurrentContext, self->sfr_lineWidth);
  CGContextSetMiterLimit(CurrentContext, self->sfr_miterLimit);
  CGContextSetFlatness(CurrentContext, self->sfr_flatness);
  sfr_dashedLinePattern = self->sfr_dashedLinePattern;
  if (sfr_dashedLinePattern)
    CGContextSetLineDash(CurrentContext, self->sfr_dashedLinePhase, sfr_dashedLinePattern, self->sfr_dashedLineCount);
  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    v7 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (CGFloat *)self->sfr_extraSegments;
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          CGContextMoveToPoint(CurrentContext, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          break;
        case 1:
          CGContextAddLineToPoint(CurrentContext, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          break;
        case 2:
          CGContextAddCurveToPoint(CurrentContext, *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          sfr_extraSegments += 4;
          break;
        case 3:
          CGContextClosePath(CurrentContext);
          break;
        default:
          break;
      }
      sfr_head += 6;
    }
    while (sfr_head < v7);
  }
  CGContextStrokePath(CurrentContext);
  CGContextRestoreGState(CurrentContext);
}

- (void)fill
{
  CGContext *CurrentContext;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v6;
  CGFloat *sfr_extraSegments;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextSetFlatness(CurrentContext, self->sfr_flatness);
  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    v6 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (CGFloat *)self->sfr_extraSegments;
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          CGContextMoveToPoint(CurrentContext, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          break;
        case 1:
          CGContextAddLineToPoint(CurrentContext, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          break;
        case 2:
          CGContextAddCurveToPoint(CurrentContext, *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          sfr_extraSegments += 4;
          break;
        case 3:
          CGContextClosePath(CurrentContext);
          break;
        default:
          break;
      }
      sfr_head += 6;
    }
    while (sfr_head < v6);
  }
  if (-[TSDBezierPath windingRule](self, "windingRule"))
    CGContextEOFillPath(CurrentContext);
  else
    CGContextFillPath(CurrentContext);
  CGContextRestoreGState(CurrentContext);
}

- (void)addClip
{
  CGContext *CurrentContext;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v6;
  CGFloat *sfr_extraSegments;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetFlatness(CurrentContext, self->sfr_flatness);
  CGContextBeginPath(CurrentContext);
  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    v6 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (CGFloat *)self->sfr_extraSegments;
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          CGContextMoveToPoint(CurrentContext, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          break;
        case 1:
          CGContextAddLineToPoint(CurrentContext, *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          break;
        case 2:
          CGContextAddCurveToPoint(CurrentContext, *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(CGFloat *)&sfr_head[2], *(CGFloat *)&sfr_head[4]);
          sfr_extraSegments += 4;
          break;
        case 3:
          CGContextClosePath(CurrentContext);
          break;
        default:
          break;
      }
      sfr_head += 6;
    }
    while (sfr_head < v6);
  }
  if (-[TSDBezierPath windingRule](self, "windingRule"))
    CGContextEOClip(CurrentContext);
  else
    CGContextClip(CurrentContext);
  CGContextBeginPath(CurrentContext);
}

- (void)subdivideBezierWithFlatness:(double)a3 startPoint:(CGPoint)a4 controlPoint1:(CGPoint)a5 controlPoint2:(CGPoint)a6 endPoint:(CGPoint)a7
{
  __int128 v7;
  float64x2_t v8;
  CGFloat y;
  float64x2_t v11;
  CGFloat v12;
  CGFloat v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  double v20;
  double v21;
  float64x2_t v22;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  uint64_t v32;
  uint64_t v36;
  unint64_t v37;
  CGPoint v38;
  __int128 v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;

  v8 = (float64x2_t)a4;
  a4.x = a7.x;
  *(CGFloat *)&v7 = a7.y;
  y = a5.y;
  v11 = vsubq_f64((float64x2_t)a5, v8);
  v12 = a6.y;
  v38 = a4;
  v39 = v7;
  v13 = a7.y;
  v14 = vsubq_f64((float64x2_t)a6, (float64x2_t)a5);
  v15 = vsubq_f64(v14, v11);
  v16 = vsubq_f64(vsubq_f64((float64x2_t)a4, (float64x2_t)a6), v14);
  v17 = (float64x2_t)vzip2q_s64((int64x2_t)v15, (int64x2_t)v16);
  v18 = (float64x2_t)vzip1q_s64((int64x2_t)v15, (int64x2_t)v16);
  v19 = vmlaq_f64(vmulq_f64(v17, v17), v18, v18);
  if (v19.f64[0] <= v19.f64[1])
    v19.f64[0] = v19.f64[1];
  v20 = a3 * a3;
  v21 = v19.f64[0] * 9.0 * 0.0625;
  if (v21 > v20)
  {
    v22 = vsubq_f64(v16, v15);
    __asm
    {
      FMOV            V5.2D, #3.0
      FMOV            V6.2D, #6.0
    }
    v29 = vmulq_f64(v22, _Q6);
    v30 = vmlaq_f64(v22, _Q5, vaddq_f64(v11, v15));
    v31 = vmulq_f64(vaddq_f64(v15, v22), _Q6);
    v32 = 1;
    __asm
    {
      FMOV            V2.2D, #0.125
      FMOV            V3.2D, #0.25
      FMOV            V4.2D, #0.5
    }
    do
    {
      v36 = v32;
      v29 = vmulq_f64(v29, _Q2);
      v31 = vsubq_f64(vmulq_f64(v31, _Q3), v29);
      v30 = vsubq_f64(vmulq_f64(v30, _Q4), vmulq_f64(v31, _Q4));
      v32 *= 2;
      v21 = v21 * 0.0625;
    }
    while (v21 > v20 && v32 <= 0x10000);
    if (v32 >= 2)
    {
      v37 = (2 * v36) | 1;
      do
      {
        v42 = v29;
        v43 = vaddq_f64(v8, v30);
        v40 = vaddq_f64(v30, v31);
        v41 = vaddq_f64(v29, v31);
        -[TSDBezierPath lineToPoint:](self, "lineToPoint:", *(_OWORD *)&v43, v38, v39);
        v30 = v40;
        v31 = v41;
        v29 = v42;
        v8 = v43;
        --v37;
      }
      while (v37 > 2);
    }
  }
  -[TSDBezierPath lineToPoint:](self, "lineToPoint:", v38.x, *(double *)&v39);
}

- (void)flattenIntoPath:(id)a3 flatness:(double)a4
{
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v8;
  double *sfr_extraSegments;

  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    v8 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (double *)self->sfr_extraSegments;
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          objc_msgSend(a3, "moveToPoint:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          break;
        case 1:
          objc_msgSend(a3, "lineToPoint:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          break;
        case 2:
          objc_msgSend(a3, "subdivideBezierWithFlatness:startPoint:controlPoint1:controlPoint2:endPoint:", a4, *(double *)&sfr_head[-4], *(double *)&sfr_head[-2], *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(_QWORD *)&sfr_head[2], *(_QWORD *)&sfr_head[4]);
          sfr_extraSegments += 4;
          break;
        case 3:
          objc_msgSend(a3, "closePath");
          break;
        default:
          break;
      }
      sfr_head += 6;
    }
    while (sfr_head < v8);
  }
}

- (id)bezierPathByFlatteningPath
{
  id v3;

  if ((*(_BYTE *)&self->sfr_bpFlags & 4) != 0)
  {
    v3 = (id)-[TSDBezierPath copy](self, "copy");
  }
  else
  {
    v3 = objc_alloc_init((Class)objc_opt_class());
    -[TSDBezierPath flattenIntoPath:flatness:](self, "flattenIntoPath:flatness:", v3, *(double *)&sfrdefaultFlatness);
  }
  return v3;
}

- (id)bezierPathByFlatteningPathWithFlatness:(double)a3
{
  id v5;

  if (-[TSDBezierPath isFlat](self, "isFlat"))
  {
    v5 = (id)-[TSDBezierPath copy](self, "copy");
  }
  else
  {
    v5 = objc_alloc_init((Class)objc_opt_class());
    -[TSDBezierPath flattenIntoPath:flatness:](self, "flattenIntoPath:flatness:", v5, a3);
  }
  return v5;
}

- (id)_copyFlattenedPath
{
  id v3;

  v3 = objc_alloc_init((Class)objc_opt_class());
  -[TSDBezierPath flattenIntoPath:flatness:](self, "flattenIntoPath:flatness:", v3, *(double *)&sfrdefaultFlatness);
  return v3;
}

- (id)bezierPathByReversingPath
{
  id v3;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  unint64_t v6;
  double *sfr_extraSegments;
  PATHSEGMENT *v8;
  PATHSEGMENT *v9;
  uint64_t v10;
  BOOL v11;
  PATHSEGMENT *v12;
  char v13;
  double *v14;

  if (self->sfr_elementCount > 1)
  {
    v3 = objc_alloc_init((Class)objc_opt_class());
    sfr_elementCount = self->sfr_elementCount;
    if (sfr_elementCount >= 2)
    {
      sfr_head = self->sfr_head;
      v6 = (unint64_t)&sfr_head[6 * sfr_elementCount];
      sfr_extraSegments = (double *)self->sfr_extraSegments;
      v8 = sfr_head + 6;
      do
      {
        v9 = v8;
        v10 = *(_QWORD *)&sfr_head[6] & 0xFLL;
        if (v10)
          v11 = (unint64_t)&sfr_head[12] >= v6;
        else
          v11 = 1;
        if (v11)
        {
          if (v10)
            v12 = v9;
          else
            v12 = sfr_head;
          objc_msgSend(v3, "moveToPoint:", *(double *)&v12[2], *(double *)&v12[4]);
          v13 = 0;
          v14 = (double *)&v12[-2];
          while (1)
          {
            switch((_DWORD)v14[1] & 0xF)
            {
              case 0:
                goto LABEL_25;
              case 1:
                if ((v13 & 1) != 0 && (*(_BYTE *)(v14 - 2) & 0xF) == 0)
                  goto LABEL_20;
                objc_msgSend(v3, "lineToPoint:", *(v14 - 1), *v14);
                goto LABEL_24;
              case 2:
                objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", *(v14 - 1), *v14, sfr_extraSegments[4 * (*((_QWORD *)v14 + 1) >> 4) + 2], sfr_extraSegments[4 * (*((_QWORD *)v14 + 1) >> 4) + 3], sfr_extraSegments[4 * (*((_QWORD *)v14 + 1) >> 4)], sfr_extraSegments[4 * (*((_QWORD *)v14 + 1) >> 4) + 1]);
                if ((v13 & 1) != 0)
                {
                  if ((*(_BYTE *)(v14 - 2) & 0xF) == 0)
LABEL_20:
                    objc_msgSend(v3, "closePath");
LABEL_22:
                  v13 = 1;
                }
                else
                {
                  v13 = 0;
                }
LABEL_24:
                v14 -= 3;
                break;
              case 3:
                objc_msgSend(v3, "lineToPoint:", *(v14 - 1), *v14);
                goto LABEL_22;
              default:
                goto LABEL_24;
            }
          }
        }
LABEL_25:
        v8 = v9 + 6;
        sfr_head = v9;
      }
      while ((unint64_t)&v9[6] < v6);
    }
  }
  else
  {
    v3 = (id)-[TSDBezierPath copy](self, "copy");
  }
  return v3;
}

- (void)transformUsingAffineTransform:(CGAffineTransform *)a3
{
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v6;
  double *sfr_extraSegments;
  int64_t sfr_extraSegmentCount;
  double *v9;
  void *sfr_path;

  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    v6 = &sfr_head[6 * sfr_elementCount];
    do
    {
      *(float64x2_t *)&sfr_head[2] = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, *(double *)&sfr_head[4]), *(float64x2_t *)&a3->a, *(double *)&sfr_head[2]));
      sfr_head += 6;
    }
    while (sfr_head < v6);
  }
  sfr_extraSegments = (double *)self->sfr_extraSegments;
  if (sfr_extraSegments)
  {
    sfr_extraSegmentCount = self->sfr_extraSegmentCount;
    if (sfr_extraSegmentCount >= 1)
    {
      v9 = &sfr_extraSegments[4 * sfr_extraSegmentCount];
      do
      {
        *(float64x2_t *)sfr_extraSegments = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, sfr_extraSegments[1]), *(float64x2_t *)&a3->a, *sfr_extraSegments));
        *((float64x2_t *)sfr_extraSegments + 1) = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, sfr_extraSegments[3]), *(float64x2_t *)&a3->a, sfr_extraSegments[2]));
        sfr_extraSegments += 4;
      }
      while (sfr_extraSegments < v9);
    }
  }
  sfr_path = self->sfr_path;
  if (sfr_path)
  {
    CFRelease(sfr_path);
    self->sfr_path = 0;
  }
  *(_DWORD *)&self->sfr_bpFlags |= 1u;
}

- (CGPath)CGPath
{
  -[TSDBezierPath _doPath](self, "_doPath");
  return (CGPath *)self->sfr_path;
}

- (BOOL)isTriangular
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;
  _BOOL4 v7;
  BOOL result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v13;
  double v14;
  double v15;
  double v16;

  v3 = -[TSDBezierPath elementCount](self, "elementCount");
  if (v3)
  {
    v4 = v3;
    v5 = v3 - 1;
    if (-[TSDBezierPath elementAtIndex:](self, "elementAtIndex:", v3 - 1))
      v6 = v4;
    else
      v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  v7 = -[TSDBezierPath isFlat](self, "isFlat");
  result = 0;
  if (v7 && (v6 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    v9 = 1;
    while (-[TSDBezierPath elementAtIndex:](self, "elementAtIndex:", v9) == 1)
    {
      if (v6 == ++v9)
      {
        v10 = v6 - 1;
        goto LABEL_13;
      }
    }
    v10 = v9 - 1;
LABEL_13:
    if (-[TSDBezierPath elementAtIndex:](self, "elementAtIndex:", v6 - 1) == 3)
      v11 = v10 + 1;
    else
      v11 = v10;
    result = 0;
    if (v6 == v11 + 1)
    {
      if (v10 != 3)
        return 1;
      v15 = 0.0;
      v16 = 0.0;
      v13 = 0.0;
      v14 = 0.0;
      -[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", 0, &v15);
      -[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", 3, &v13);
      if (v15 == v13 && v16 == v14)
        return 1;
    }
  }
  return result;
}

- (BOOL)isDiamond
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  _BOOL4 v6;
  BOOL result;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  uint64_t v16;
  double MidY;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  CGRect v21;
  CGRect v22;

  v3 = -[TSDBezierPath elementCount](self, "elementCount");
  if (!v3)
  {
    -[TSDBezierPath isFlat](self, "isFlat");
    return 0;
  }
  v4 = v3;
  v5 = v3 - 1;
  if (!-[TSDBezierPath elementAtIndex:](self, "elementAtIndex:", v3 - 1))
    v4 = v5;
  v6 = -[TSDBezierPath isFlat](self, "isFlat");
  result = 0;
  if (v6 && v4 == 5)
  {
    v8 = -5;
    v9 = 4;
    while (-[TSDBezierPath elementAtIndex:](self, "elementAtIndex:", v8 + 6) == 1)
    {
      if (++v8 == -1)
        goto LABEL_13;
    }
    if (v8 < 0xFFFFFFFFFFFFFFFELL)
      return 0;
    v9 = v8 + 5;
LABEL_13:
    v10 = -[TSDBezierPath elementAtIndex:](self, "elementAtIndex:", 4);
    if (v9 != 3 || v10 == 3)
    {
      -[TSDBezierPath bounds](self, "bounds");
      x = v21.origin.x;
      y = v21.origin.y;
      width = v21.size.width;
      height = v21.size.height;
      MidX = CGRectGetMidX(v21);
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      v16 = 0;
      MidY = (double)(unint64_t)CGRectGetMidY(v22);
      v18 = v9 + 1;
      v19 = *MEMORY[0x24BDBEFB0];
      while (1)
      {
        v20 = v19;
        -[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v16, &v20, v19);
        if (vabdd_f64((double)(unint64_t)MidX, *(double *)&v20) > 0.01
          && vabdd_f64(MidY, *((double *)&v20 + 1)) > 0.01)
        {
          break;
        }
        if (v18 == ++v16)
          return 1;
      }
    }
    return 0;
  }
  return result;
}

- (BOOL)isRectangular
{
  int64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  double MaxX;
  double MaxY;
  unint64_t v20;
  double *v21;
  double v22;
  uint64_t v23;
  _BOOL4 v24;
  float64x2_t v25;
  float64x2_t v27[6];
  uint64_t v28;
  CGRect v29;
  CGRect v30;

  v28 = *MEMORY[0x24BDAC8D0];
  LODWORD(v3) = -[TSDBezierPath isFlat](self, "isFlat");
  if ((_DWORD)v3)
  {
    v3 = -[TSDBezierPath elementCount](self, "elementCount");
    if (v3)
    {
      v4 = v3;
      v5 = v3 - 1;
      if (-[TSDBezierPath elementAtIndex:](self, "elementAtIndex:", v3 - 1))
        v6 = v4;
      else
        v6 = v5;
      if (v6 < 5)
        goto LABEL_7;
      if (v6 <= 6)
      {
        v9 = 1;
        while (-[TSDBezierPath elementAtIndex:](self, "elementAtIndex:", v9) == 1)
        {
          if (v6 == ++v9)
          {
            v10 = v6 - 1;
            goto LABEL_17;
          }
        }
        v10 = v9 - 1;
LABEL_17:
        v11 = -[TSDBezierPath elementAtIndex:](self, "elementAtIndex:", v6 - 1);
        LOBYTE(v3) = 0;
        if (v11 == 3)
          v12 = v10 + 2;
        else
          v12 = v10 + 1;
        if (v11 == 3)
          v13 = v10 + 1;
        else
          v13 = v10;
        if (v6 == v12 && v13 >= 4)
        {
          -[TSDBezierPath bounds](self, "bounds");
          x = v29.origin.x;
          y = v29.origin.y;
          width = v29.size.width;
          height = v29.size.height;
          MaxX = CGRectGetMaxX(v29);
          v30.origin.x = x;
          v30.origin.y = y;
          v30.size.width = width;
          v30.size.height = height;
          MaxY = CGRectGetMaxY(v30);
          v20 = 0;
          v21 = (double *)v27;
          while (1)
          {
            -[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v20, v21);
            if (vabdd_f64(x, *v21) >= 0.01 && vabdd_f64(MaxX, *v21) >= 0.01)
              goto LABEL_7;
            v22 = v21[1];
            if (vabdd_f64(y, v22) >= 0.01 && vabdd_f64(MaxY, v22) >= 0.01)
              goto LABEL_7;
            ++v20;
            v21 += 2;
            if (v20 > v10)
            {
              v23 = 0;
              v24 = 0;
              while (1)
              {
                v25 = vabdq_f64(v27[(v23 + 1) % (v10 + 1)], v27[v23]);
                if (v25.f64[0] > 0.01 != v25.f64[1] <= 0.01 || v23 && ((v24 ^ (v25.f64[0] > 0.01)) & 1) == 0)
                  break;
                ++v23;
                v24 = v25.f64[0] > 0.01;
                if (v23 == 4)
                {
                  LOBYTE(v3) = 1;
                  return v3;
                }
              }
              goto LABEL_7;
            }
          }
        }
      }
      else
      {
        v7 = -[TSDBezierPath bezierPathByRemovingRedundantElements](self, "bezierPathByRemovingRedundantElements");
        v8 = objc_msgSend(v7, "elementCount");
        if (v8 >= -[TSDBezierPath elementCount](self, "elementCount"))
        {
LABEL_7:
          LOBYTE(v3) = 0;
          return v3;
        }
        LOBYTE(v3) = objc_msgSend(v7, "isRectangular");
      }
    }
  }
  return v3;
}

- (BOOL)isCircular
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  double v15;
  double v16;
  unint64_t v17;
  float64x2_t *v18;
  double v19;
  double v20;
  double v21;
  float64x2_t v23;
  _BYTE v24[16];
  double v25[6];

  v25[5] = *(double *)MEMORY[0x24BDAC8D0];
  -[TSDBezierPath bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[TSDBezierPath elementCount](self, "elementCount");
  if (v11 >= 1)
  {
    v12 = v11;
    v13 = 0;
    v14 = 0;
    v15 = v4 + v8 * 0.5;
    v16 = v6 + v10 * 0.5;
    while (1)
    {
      v17 = -[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v13, v24, *(_OWORD *)&v23);
      if (v17 == 2)
      {
        if (fabs(TSDPointLength((v25[2] - v15) / v8, (v25[3] - v16) / v10) + -0.5) > 0.0001)
          return v14;
        v19 = TSDPointOnCurve(&v23, 0.5);
        v21 = TSDPointLength((v19 - v15) / v8, (v20 - v16) / v10);
        v18 = (float64x2_t *)v25;
        if (fabs(v21 + -0.5) > 0.0001)
          return v14;
      }
      else
      {
        v18 = (float64x2_t *)v24;
        if (v17 == 1)
          return v14;
      }
      v23 = *v18;
      v14 = v12 <= ++v13;
      if (v12 == v13)
        return v14;
    }
  }
  return 1;
}

- (BOOL)isEmpty
{
  return self->sfr_elementCount == 0;
}

- (CGPoint)currentPoint
{
  PATHSEGMENT *v3;
  double v4;
  double v5;
  CGPoint result;

  if (-[TSDBezierPath isEmpty](self, "isEmpty"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("No current point for line"));
  v3 = &self->sfr_head[6 * self->sfr_elementCount];
  v4 = *(double *)&v3[-4];
  v5 = *(double *)&v3[-2];
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGRect)controlPointBounds
{
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags;
  CGPoint v4;
  double y;
  float64x2_t size;
  PATHSEGMENT *sfr_head;
  int64_t sfr_elementCount;
  float64x2_t v9;
  unint64_t v10;
  PATHSEGMENT *v11;
  float64x2_t v13;
  float64x2_t *sfr_extraSegments;
  int64_t sfr_extraSegmentCount;
  float64x2_t *v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  double v21;
  CGRect result;

  if (-[TSDBezierPath isEmpty](self, "isEmpty"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("No current point for control point bounds"));
  sfr_bpFlags = self->sfr_bpFlags;
  if ((*(_BYTE *)&sfr_bpFlags & 1) != 0)
  {
    sfr_head = self->sfr_head;
    sfr_elementCount = self->sfr_elementCount;
    v9 = *(float64x2_t *)&sfr_head[2];
    if (sfr_elementCount < 2)
    {
      v4 = *(CGPoint *)&sfr_head[2];
    }
    else
    {
      v10 = (unint64_t)&sfr_head[6 * sfr_elementCount];
      v11 = sfr_head + 6;
      v4 = (CGPoint)v9;
      do
      {
        if ((*(_DWORD *)v11 & 0xF) != 3 && ((*(_DWORD *)v11 & 0xF) != 0 || (unint64_t)&v11[6] < v10))
        {
          v13 = *(float64x2_t *)&v11[2];
          v4 = (CGPoint)vbslq_s8((int8x16_t)vcgtq_f64(v13, (float64x2_t)v4), (int8x16_t)v4, (int8x16_t)v13);
          v9 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v9, v13), (int8x16_t)v9, (int8x16_t)v13);
        }
        v11 += 6;
      }
      while ((unint64_t)v11 < v10);
    }
    sfr_extraSegments = (float64x2_t *)self->sfr_extraSegments;
    if (sfr_extraSegments)
    {
      sfr_extraSegmentCount = self->sfr_extraSegmentCount;
      if (sfr_extraSegmentCount >= 1)
      {
        v16 = &sfr_extraSegments[2 * sfr_extraSegmentCount];
        do
        {
          v17 = *sfr_extraSegments;
          v18 = sfr_extraSegments[1];
          sfr_extraSegments += 2;
          v19 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v17, (float64x2_t)v4), (int8x16_t)v4, (int8x16_t)v17);
          v20 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v9, v17), (int8x16_t)v9, (int8x16_t)v17);
          v4 = (CGPoint)vbslq_s8((int8x16_t)vcgtq_f64(v18, v19), (int8x16_t)v19, (int8x16_t)v18);
          v9 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v20, v18), (int8x16_t)v20, (int8x16_t)v18);
        }
        while (sfr_extraSegments < v16);
      }
    }
    self->sfr_controlPointBounds.origin = v4;
    size = vsubq_f64(v9, (float64x2_t)v4);
    self->sfr_controlPointBounds.size = (CGSize)size;
    self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&sfr_bpFlags & 0xFFFFFFFE);
    y = v4.y;
  }
  else
  {
    v4.x = self->sfr_controlPointBounds.origin.x;
    y = self->sfr_controlPointBounds.origin.y;
    size = (float64x2_t)self->sfr_controlPointBounds.size;
  }
  v21 = size.f64[1];
  result.size.width = size.f64[0];
  result.origin.x = v4.x;
  result.size.height = v21;
  result.origin.y = y;
  return result;
}

- (CGRect)bounds
{
  const CGPath *sfr_path;
  CGRect result;

  if ((*(_BYTE *)&self->sfr_bpFlags & 4) != 0)
  {
    -[TSDBezierPath controlPointBounds](self, "controlPointBounds");
  }
  else
  {
    -[TSDBezierPath _doPath](self, "_doPath");
    sfr_path = (const CGPath *)self->sfr_path;
    if (sfr_path)
      return CGPathGetPathBoundingBox(sfr_path);
    else
      return *(CGRect *)*(_QWORD *)&MEMORY[0x24BDBF090];
  }
  return result;
}

- (BOOL)isFlat
{
  int64_t v3;
  unint64_t v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v3 = -[TSDBezierPath elementCount](self, "elementCount");
  if (!v3)
    return 1;
  v4 = v3;
  if (-[TSDBezierPath elementAtIndex:](self, "elementAtIndex:", 0) == 2)
    return 0;
  v6 = 1;
  do
  {
    v7 = v6;
    if (v4 == v6)
      break;
    v8 = -[TSDBezierPath elementAtIndex:](self, "elementAtIndex:", v6);
    v6 = v7 + 1;
  }
  while (v8 != 2);
  return v7 >= v4;
}

- (BOOL)isClockwise
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  double v7;
  double v8;
  float v9;
  double v10;
  double v11;
  BOOL v13;
  double v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = -[TSDBezierPath elementCount](self, "elementCount");
  if (v3 < 1)
  {
    v9 = 0.0;
  }
  else
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = *MEMORY[0x24BDBEFB0];
    v8 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v9 = 0.0;
    v10 = v8;
    v11 = *MEMORY[0x24BDBEFB0];
    do
    {
      switch(-[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v5, &v15))
      {
        case 0uLL:
          v11 = v15;
          v10 = v16;
          v7 = v15;
          v8 = v16;
          break;
        case 1uLL:
          if (v7 != v15 || v8 != v16)
            v9 = v7 * v16 - v8 * v15 + v9;
          v6 = 1;
          v7 = v15;
          v8 = v16;
          break;
        case 2uLL:
          NSLog((NSString *)CFSTR("Warning: Path should be flat. Illegal TSDCurveToBezierPathElement."));
          break;
        case 3uLL:
          v13 = v7 == v11 && v8 == v10;
          v6 = 0;
          if (!v13)
            v9 = v7 * v10 - v8 * v11 + v9;
          break;
        default:
          break;
      }
      ++v5;
    }
    while (v4 != v5);
    if ((v6 & 1) != 0)
      v9 = v7 * v10 - v8 * v11 + v9;
  }
  return v9 >= 0.0;
}

- (double)calculateLengthOfElement:(int64_t)a3
{
  double v3;
  unint64_t v4;
  float v5;
  float v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = 0.0;
  if (a3)
  {
    v4 = -[TSDBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", a3, &v9);
    switch(v4)
    {
      case 3uLL:
        goto LABEL_5;
      case 2uLL:
        v8 = 0.0;
        addifclose((uint64_t)&v9, &v8);
        return v8;
      case 1uLL:
LABEL_5:
        v5 = (v10 - v12) * (v10 - v12) + (v9 - v11) * (v9 - v11);
        return sqrtf(v5);
    }
  }
  return v3;
}

- (void)calculateLengths
{
  uint64_t v3;
  uint64_t i;
  double v5;

  self->sfr_totalLength = 0.0;
  v3 = -[TSDBezierPath elementCount](self, "elementCount");
  self->sfr_elementLength = (double *)NSZoneRealloc((NSZone *)-[TSDBezierPath zone](self, "zone"), self->sfr_elementLength, 8 * self->sfr_elementMax);
  if (v3 >= 1)
  {
    for (i = 0; i != v3; ++i)
    {
      -[TSDBezierPath calculateLengthOfElement:](self, "calculateLengthOfElement:", i);
      self->sfr_elementLength[i] = v5;
      self->sfr_totalLength = v5 + self->sfr_totalLength;
    }
  }
  *(_DWORD *)&self->sfr_bpFlags |= 0x400u;
}

- (double)length
{
  if ((*((_BYTE *)&self->sfr_bpFlags + 1) & 4) == 0)
    -[TSDBezierPath calculateLengths](self, "calculateLengths");
  return self->sfr_totalLength;
}

- (double)lengthOfElement:(int64_t)a3
{
  if ((*((_BYTE *)&self->sfr_bpFlags + 1) & 4) == 0)
    -[TSDBezierPath calculateLengths](self, "calculateLengths");
  return self->sfr_elementLength[a3];
}

- (double)lengthToElement:(int64_t)a3
{
  double *sfr_elementLength;
  double result;
  double v8;

  if ((*((_BYTE *)&self->sfr_bpFlags + 1) & 4) == 0)
    -[TSDBezierPath calculateLengths](self, "calculateLengths");
  if (self->sfr_elementCount < a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TSDBezierPath.m"), 1490, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("e <= sfr_elementCount"));
  if (a3 < 1)
    return 0.0;
  sfr_elementLength = self->sfr_elementLength;
  result = 0.0;
  do
  {
    v8 = *sfr_elementLength++;
    result = result + v8;
    --a3;
  }
  while (a3);
  return result;
}

- (int64_t)elementCount
{
  return self->sfr_elementCount;
}

- (unint64_t)elementAtIndex:(int64_t)a3
{
  return -[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", a3, 0);
}

- (unint64_t)elementAtIndex:(int64_t)a3 associatedPoints:(CGPoint *)a4
{
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v8;
  CGPoint *v9;

  if (a3 < 0 || self->sfr_elementCount <= a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB78], CFSTR("%@: index (%ld) beyond bounds (%ld)"), NSStringFromSelector(a2), a3, self->sfr_elementCount);
  sfr_head = self->sfr_head;
  v8 = &sfr_head[6 * a3];
  if (a4)
  {
    if ((*(_QWORD *)v8 & 0xFLL) == 2)
    {
      v9 = (CGPoint *)((char *)self->sfr_extraSegments + 32 * (*(_QWORD *)v8 >> 4));
      *a4 = *v9;
      a4[1] = v9[1];
      a4 += 2;
    }
    *a4 = *(CGPoint *)&sfr_head[6 * a3 + 2];
  }
  return *(_QWORD *)v8 & 0xFLL;
}

- (unint64_t)elementAtIndex:(int64_t)a3 allPoints:(CGPoint *)a4
{
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v8;
  unint64_t v9;
  CGPoint *v10;

  if (a3 < 0 || self->sfr_elementCount <= a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB78], CFSTR("%@: index (%ld) beyond bounds (%ld)"), NSStringFromSelector(a2), a3, self->sfr_elementCount);
  sfr_head = self->sfr_head;
  v8 = &sfr_head[6 * a3];
  if (a4)
  {
    v9 = *(_QWORD *)v8;
    if ((*(_QWORD *)v8 & 0xFLL) != 0)
    {
      *a4 = *(CGPoint *)&sfr_head[6 * a3 - 4];
      v9 = *(_QWORD *)v8;
    }
    if ((v9 & 0xF) != 0)
    {
      if ((v9 & 0xF) == 2)
      {
        v10 = (CGPoint *)((char *)self->sfr_extraSegments + 32 * (v9 >> 4));
        a4[1] = *v10;
        a4[2] = v10[1];
        a4 += 3;
      }
      else
      {
        ++a4;
      }
    }
    *a4 = *(CGPoint *)&sfr_head[6 * a3 + 2];
  }
  return *(_QWORD *)v8 & 0xFLL;
}

- (void)setAssociatedPoints:(CGPoint *)a3 atIndex:(int64_t)a4
{
  PATHSEGMENT *sfr_head;
  CGPoint *v8;
  CGPoint v9;
  void *sfr_path;

  if (a4 < 0 || self->sfr_elementCount <= a4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB78], CFSTR("%@: index (%ld) beyond bounds (%ld)"), NSStringFromSelector(a2), a4, self->sfr_elementCount);
  sfr_head = self->sfr_head;
  if ((*(_QWORD *)&sfr_head[6 * a4] & 0xFLL) == 2)
  {
    v8 = (CGPoint *)((char *)self->sfr_extraSegments + 32 * (*(_QWORD *)&sfr_head[6 * a4] >> 4));
    *v8 = *a3;
    v9 = a3[1];
    a3 += 2;
    v8[1] = v9;
  }
  *(CGPoint *)&sfr_head[6 * a4 + 2] = *a3;
  sfr_path = self->sfr_path;
  if (sfr_path)
  {
    CFRelease(sfr_path);
    self->sfr_path = 0;
  }
  *(_DWORD *)&self->sfr_bpFlags |= 1u;
}

- (void)_appendToPath:(id)a3
{
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v6;
  double *sfr_extraSegments;

  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    v6 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (double *)self->sfr_extraSegments;
    do
    {
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          objc_msgSend(a3, "moveToPoint:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          break;
        case 1:
          objc_msgSend(a3, "lineToPoint:", *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          break;
        case 2:
          objc_msgSend(a3, "curveToPoint:controlPoint1:controlPoint2:", *(double *)&sfr_head[2], *(double *)&sfr_head[4], *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3]);
          sfr_extraSegments += 4;
          break;
        case 3:
          objc_msgSend(a3, "closePath");
          break;
        default:
          break;
      }
      sfr_head += 6;
    }
    while (sfr_head < v6);
  }
}

- (void)appendBezierPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    objc_msgSend(a3, "_appendToPath:", self);
  }
  else
  {
    v6 = objc_msgSend(a3, "elementCount");
    if (v6 >= 1)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        switch(objc_msgSend(a3, "elementAtIndex:associatedPoints:", i, &v9))
        {
          case 0:
            -[TSDBezierPath moveToPoint:](self, "moveToPoint:", v9, v10);
            break;
          case 1:
            -[TSDBezierPath lineToPoint:](self, "lineToPoint:", v9, v10);
            break;
          case 2:
            -[TSDBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v13, v14, v9, v10, v11, v12);
            break;
          case 3:
            -[TSDBezierPath closePath](self, "closePath");
            break;
          default:
            continue;
        }
      }
    }
  }
}

- (void)appendBezierPathWithRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MaxX;
  double v9;
  double MinX;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TSDBezierPath moveToPoint:](self, "moveToPoint:");
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  MaxX = CGRectGetMaxX(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  -[TSDBezierPath lineToPoint:](self, "lineToPoint:", MaxX, CGRectGetMinY(v12));
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v9 = CGRectGetMaxX(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  -[TSDBezierPath lineToPoint:](self, "lineToPoint:", v9, CGRectGetMaxY(v14));
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  MinX = CGRectGetMinX(v15);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  -[TSDBezierPath lineToPoint:](self, "lineToPoint:", MinX, CGRectGetMaxY(v16));
  -[TSDBezierPath closePath](self, "closePath");
}

- (void)appendBezierPathWithPoints:(CGPoint *)a3 count:(int64_t)a4
{
  int64_t v4;
  double *p_y;

  v4 = a4 - 1;
  if (a4 >= 1)
  {
    if (-[TSDBezierPath isEmpty](self, "isEmpty") || (*(_DWORD *)&self->sfr_bpFlags & 0x300) == 0x100)
      -[TSDBezierPath moveToPoint:](self, "moveToPoint:", a3->x, a3->y);
    else
      -[TSDBezierPath lineToPoint:](self, "lineToPoint:", a3->x, a3->y);
    if ((unint64_t)a4 >= 2)
    {
      p_y = &a3[1].y;
      do
      {
        -[TSDBezierPath lineToPoint:](self, "lineToPoint:", *(p_y - 1), *p_y);
        p_y += 2;
        --v4;
      }
      while (v4);
    }
  }
}

- (void)appendBezierPathWithOvalInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  TSDBezierPath *v8;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat v11;
  CGFloat v12;
  __int128 v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v16.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v16.c = v13;
  *(_OWORD *)&v16.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  v8 = objc_alloc_init(TSDBezierPath);
  -[TSDBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:](v8, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), 1.0, -45.0, 315.0);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MidX = CGRectGetMidX(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  MidY = CGRectGetMidY(v18);
  *(_OWORD *)&v15.a = *(_OWORD *)&v16.a;
  *(_OWORD *)&v15.c = v13;
  *(_OWORD *)&v15.tx = *(_OWORD *)&v16.tx;
  CGAffineTransformTranslate(&v16, &v15, MidX, MidY);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v11 = CGRectGetWidth(v19) * 0.5;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v12 = CGRectGetHeight(v20);
  v14 = v16;
  CGAffineTransformScale(&v15, &v14, v11, v12 * 0.5);
  v16 = v15;
  -[TSDBezierPath transformUsingAffineTransform:](v8, "transformUsingAffineTransform:", &v15);
  -[TSDBezierPath appendBezierPath:](self, "appendBezierPath:", v8);

}

- (void)_appendArcSegmentWithCenter:(CGPoint)a3 radius:(double)a4 angle1:(double)a5 angle2:(double)a6
{
  double y;
  double x;
  __double2 v12;
  double v13;
  __double2 v14;
  __double2 v15;

  y = a3.y;
  x = a3.x;
  v12 = __sincos_stret((a6 - a5) * 0.5);
  v13 = (1.0 - v12.__cosval) * 4.0 / (v12.__sinval * 3.0);
  v14 = __sincos_stret(a5);
  v15 = __sincos_stret(a6);
  -[TSDBezierPath _deviceCurveToPoint:controlPoint1:controlPoint2:](self, "_deviceCurveToPoint:controlPoint1:controlPoint2:", x + a4 * v15.__cosval, y + a4 * v15.__sinval, x + a4 * v14.__cosval - v13 * a4 * v14.__sinval, y + a4 * v14.__sinval + v13 * a4 * v14.__cosval, x + a4 * v15.__cosval + v13 * a4 * v15.__sinval, y + a4 * v15.__sinval - v13 * a4 * v15.__cosval);
}

- (void)appendBezierPathWithArcWithCenter:(CGPoint)a3 radius:(double)a4 startAngle:(double)a5 endAngle:(double)a6 clockwise:(BOOL)a7
{
  double y;
  double x;
  double v15;
  double v16;
  __double2 v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  y = a3.y;
  x = a3.x;
  if (__fpclassifyd(a5) < 3 || __fpclassifyd(a6) <= 2)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@: illegal angle argument"), NSStringFromSelector(a2));
  v15 = a5 * 3.14159265 / 180.0;
  v16 = a6 * 3.14159265;
  v17 = __sincos_stret(v15);
  v18 = x + a4 * v17.__cosval;
  v19 = y + a4 * v17.__sinval;
  if (-[TSDBezierPath isEmpty](self, "isEmpty"))
    -[TSDBezierPath _deviceMoveToPoint:](self, "_deviceMoveToPoint:", v18, v19);
  else
    -[TSDBezierPath _deviceLineToPoint:](self, "_deviceLineToPoint:", v18, v19);
  v20 = v16 / 180.0;
  if (a7)
  {
    for (; v15 < v20; v15 = v15 + 6.28318531)
      ;
    v21 = v15 - v20;
    if (v15 - v20 > 1.57079633)
    {
      do
      {
        v22 = v15 + -1.57079633;
        -[TSDBezierPath _appendArcSegmentWithCenter:radius:angle1:angle2:](self, "_appendArcSegmentWithCenter:radius:angle1:angle2:", x, y, a4, v15, v15 + -1.57079633);
        v21 = v22 - v20;
        v15 = v15 + -1.57079633;
      }
      while (v22 - v20 > 1.57079633);
      goto LABEL_19;
    }
  }
  else
  {
    for (; v20 < v15; v20 = v20 + 6.28318531)
      ;
    v21 = v20 - v15;
    if (v20 - v15 > 1.57079633)
    {
      do
      {
        v22 = v15 + 1.57079633;
        -[TSDBezierPath _appendArcSegmentWithCenter:radius:angle1:angle2:](self, "_appendArcSegmentWithCenter:radius:angle1:angle2:", x, y, a4, v15, v15 + 1.57079633);
        v21 = v20 - v22;
        v15 = v15 + 1.57079633;
      }
      while (v20 - v22 > 1.57079633);
      goto LABEL_19;
    }
  }
  v22 = v15;
LABEL_19:
  if (v21 > 0.0)
    -[TSDBezierPath _appendArcSegmentWithCenter:radius:angle1:angle2:](self, "_appendArcSegmentWithCenter:radius:angle1:angle2:", x, y, a4, v22, v20);
}

- (void)appendBezierPathWithArcWithCenter:(CGPoint)a3 radius:(double)a4 startAngle:(double)a5 endAngle:(double)a6
{
  -[TSDBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:](self, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, a3.x, a3.y, a4, a5, a6);
}

- (void)appendBezierPathWithArcFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 radius:(double)a5
{
  double y;
  double x;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGAffineTransform v39;
  CGAffineTransform v40;

  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  v37 = *(double *)(MEMORY[0x24BDBD8B8] + 8);
  v38 = *MEMORY[0x24BDBD8B8];
  v35 = *(double *)(MEMORY[0x24BDBD8B8] + 24);
  v36 = *(double *)(MEMORY[0x24BDBD8B8] + 16);
  v33 = *(double *)(MEMORY[0x24BDBD8B8] + 40);
  v34 = *(double *)(MEMORY[0x24BDBD8B8] + 32);
  -[TSDBezierPath currentPoint](self, "currentPoint");
  v13 = v11;
  v14 = v12;
  if (v11 == v9 && v12 == v8)
  {
    v17 = v9 - v11;
    v16 = v8 - v12;
    v18 = 0.0;
    v30 = 0.0;
  }
  else
  {
    v30 = a5;
    v16 = v8 - v12;
    v17 = v9 - v11;
    v18 = atan2(v8 - v12, v17);
  }
  v39.a = v38;
  v39.b = v37;
  v39.c = v36;
  v39.d = v35;
  v39.tx = v34;
  v39.ty = v33;
  CGAffineTransformRotate(&v40, &v39, -v18);
  v19 = v40.tx + v16 * v40.c + v40.a * v17;
  v20 = v40.ty + v16 * v40.d + v40.b * v17;
  v32 = v14;
  v21 = v40.tx + (y - v14) * v40.c + v40.a * (x - v13);
  v22 = v40.ty + (y - v14) * v40.d + v40.b * (x - v13);
  v23 = v19 == v21 && v20 == v22;
  v24 = 0.0;
  if (!v23)
    v24 = 3.14159265 - fabs(atan2(v22 - v20, v21 - v19));
  v25 = sin(v24 * 0.5);
  v31 = v13;
  if (v25 == 0.0)
  {
    v26 = 0.0;
    v27 = v20;
    v28 = 0.0;
    v29 = 0.0;
  }
  else
  {
    v19 = v19 - v30 * fabs(cos(v24 * 0.5) / v25);
    if (v22 <= v20)
    {
      v27 = -v30;
      v29 = v24 + -1.57079633;
      v26 = 1.57079633;
    }
    else
    {
      v29 = 1.57079633 - v24;
      v26 = -1.57079633;
      v27 = v30;
    }
    v28 = v30;
  }
  v39.a = v38;
  v39.b = v37;
  v39.c = v36;
  v39.d = v35;
  v39.tx = v34;
  v39.ty = v33;
  CGAffineTransformRotate(&v40, &v39, v18);
  -[TSDBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:](self, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", v22 <= v20, v31 + v40.tx + v27 * v40.c + v40.a * v19, v32 + v40.ty + v27 * v40.d + v40.b * v19, v28, (v18 + v26) * 180.0 / 3.14159265, (v18 + v29) * 180.0 / 3.14159265);
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  const CGPath *sfr_path;
  BOOL v7;
  CGPoint v9;

  y = a3.y;
  x = a3.x;
  if ((containsPoint__doWindingRule & 1) == 0)
    containsPoint__doWindingRule = 1;
  -[TSDBezierPath _doPath](self, "_doPath");
  sfr_path = (const CGPath *)self->sfr_path;
  if (!sfr_path)
    return 0;
  v7 = -[TSDBezierPath windingRule](self, "windingRule") == 1;
  v9.x = x;
  v9.y = y;
  return CGPathContainsPoint(sfr_path, 0, v9, v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  double v8;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v11;
  float64x2_t *sfr_extraSegments;
  NSUInteger v13;
  char *v14;
  char *v15;
  uint64_t v16;
  NSUInteger v17;
  void *v18;
  void *v19;
  int64_t sfr_dashedLineCount;
  double *sfr_dashedLinePattern;
  _DWORD *v22;
  double v23;
  unsigned int v24;
  float sfr_lineWidth;
  double sfr_flatness;
  float sfr_miterLimit;
  float v28;
  int64_t v29;
  PATHSEGMENT *v30;
  PATHSEGMENT *v31;
  double *v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float sfr_dashedLinePhase;
  int64_t v40;
  float v41;
  float v42;
  float v43;
  char v44;
  float v45;
  float v46;
  float v47;
  float v48;
  int v49;
  int v50;
  int v51;
  float v52;

  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v5 = -[TSDBezierPath windingRule](self, "windingRule");
    v6 = -[TSDBezierPath lineCapStyle](self, "lineCapStyle");
    v7 = -[TSDBezierPath lineJoinStyle](self, "lineJoinStyle");
    sfr_elementCount = self->sfr_elementCount;
    if (sfr_elementCount >= 1)
    {
      sfr_head = self->sfr_head;
      v11 = &sfr_head[6 * sfr_elementCount];
      sfr_extraSegments = (float64x2_t *)self->sfr_extraSegments;
      v13 = 9 * (sfr_elementCount + 2 * self->sfr_extraSegmentCount);
      v14 = (char *)NSZoneMalloc((NSZone *)-[TSDBezierPath zone](self, "zone"), v13);
      v15 = v14;
      do
      {
        v16 = *(_QWORD *)sfr_head;
        if ((*(_QWORD *)sfr_head & 0xFLL) == 2)
        {
          *v15 = 2;
          *(int8x8_t *)(v15 + 1) = vrev32_s8((int8x8_t)vcvt_f32_f64(*sfr_extraSegments));
          v15[9] = 2;
          *(int8x8_t *)(v15 + 10) = vrev32_s8((int8x8_t)vcvt_f32_f64(sfr_extraSegments[1]));
          v15 += 18;
          sfr_extraSegments += 2;
          v16 = *(_QWORD *)sfr_head;
        }
        *v15 = v16 & 0xF;
        *(int8x8_t *)(v15 + 1) = vrev32_s8((int8x8_t)vcvt_f32_f64(*(float64x2_t *)&sfr_head[2]));
        v15 += 9;
        sfr_head += 6;
      }
      while (sfr_head < v11);
      objc_msgSend(a3, "encodeBytes:length:forKey:", v14, v13, CFSTR("TSDSegments"));
      NSZoneFree((NSZone *)-[TSDBezierPath zone](self, "zone"), v14);
    }
    if (v5)
    {
      *(float *)&v8 = (float)v5;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("TSDWindingRule"), v8);
    }
    if (v6)
    {
      *(float *)&v8 = (float)v6;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("TSDCapStyle"), v8);
    }
    if (v7)
    {
      *(float *)&v8 = (float)v7;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("TSDJoinStyle"), v8);
    }
    if (self->sfr_lineWidth != 1.0)
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("TSDLineWidth"));
    if (self->sfr_miterLimit != 10.0)
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("TSDMiterLimit"));
    if (self->sfr_flatness != 0.6)
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("TSDFlatness"));
    if (self->sfr_dashedLineCount)
    {
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("TSDDashPhase"), self->sfr_dashedLinePhase);
      v17 = 4 * self->sfr_dashedLineCount;
      v18 = NSZoneMalloc((NSZone *)-[TSDBezierPath zone](self, "zone"), v17);
      v19 = v18;
      sfr_dashedLineCount = self->sfr_dashedLineCount;
      if (sfr_dashedLineCount >= 1)
      {
        sfr_dashedLinePattern = self->sfr_dashedLinePattern;
        v22 = v18;
        do
        {
          v23 = *sfr_dashedLinePattern++;
          *(float *)&v24 = v23;
          *v22++ = bswap32(v24);
          --sfr_dashedLineCount;
        }
        while (sfr_dashedLineCount);
      }
      objc_msgSend(a3, "encodeBytes:length:forKey:", v18, v17, CFSTR("TSDDashPatterns"));
      NSZoneFree((NSZone *)-[TSDBezierPath zone](self, "zone"), v19);
    }
  }
  else
  {
    v52 = (float)(self->sfr_elementCount + 2 * self->sfr_extraSegmentCount);
    v51 = -[TSDBezierPath windingRule](self, "windingRule");
    v50 = -[TSDBezierPath lineCapStyle](self, "lineCapStyle");
    v49 = -[TSDBezierPath lineJoinStyle](self, "lineJoinStyle");
    sfr_lineWidth = self->sfr_lineWidth;
    sfr_flatness = self->sfr_flatness;
    sfr_miterLimit = self->sfr_miterLimit;
    v47 = sfr_miterLimit;
    v48 = sfr_lineWidth;
    v28 = sfr_flatness;
    v45 = (float)self->sfr_dashedLineCount;
    v46 = v28;
    objc_msgSend(a3, "encodeValueOfObjCType:at:", "i", &v52);
    v29 = self->sfr_elementCount;
    if (v29 >= 1)
    {
      v30 = self->sfr_head;
      v31 = &v30[6 * v29];
      v32 = (double *)self->sfr_extraSegments;
      do
      {
        v44 = *(_BYTE *)v30 & 0xF;
        if (v44 == 2)
        {
          v33 = *v32;
          v34 = v32[1];
          v42 = v34;
          v43 = v33;
          objc_msgSend(a3, "encodeValuesOfObjCTypes:", "cff", &v44, &v43, &v42);
          v35 = v32[2];
          v36 = v32[3];
          v42 = v36;
          v43 = v35;
          objc_msgSend(a3, "encodeValuesOfObjCTypes:", "cff", &v44, &v43, &v42);
          v32 += 4;
        }
        v37 = *(double *)&v30[2];
        v38 = *(double *)&v30[4];
        v42 = v38;
        v43 = v37;
        objc_msgSend(a3, "encodeValuesOfObjCTypes:", "cff", &v44, &v43, &v42);
        v30 += 6;
      }
      while (v30 < v31);
    }
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "iiifffi", &v51, &v50, &v49, &v48, &v47, &v46, &v45);
    if (self->sfr_dashedLineCount)
    {
      sfr_dashedLinePhase = self->sfr_dashedLinePhase;
      v43 = sfr_dashedLinePhase;
      objc_msgSend(a3, "encodeValueOfObjCType:at:", "f", &v43);
      if ((uint64_t)self->sfr_dashedLineCount >= 1)
      {
        v40 = 0;
        do
        {
          v41 = self->sfr_dashedLinePattern[v40];
          v43 = v41;
          objc_msgSend(a3, "encodeValueOfObjCType:at:", "f", &v43);
          ++v40;
        }
        while (v40 < (int64_t)self->sfr_dashedLineCount);
      }
    }
  }
}

- (TSDBezierPath)initWithCoder:(id)a3
{
  TSDBezierPath *v4;
  unint64_t v5;
  unint64_t v6;
  int8x8_t *v7;
  float v8;
  float v9;
  int8x8_t *v10;
  int8x8_t *v11;
  uint64_t v12;
  unsigned int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float sfr_lineWidth;
  double sfr_flatness;
  float sfr_miterLimit;
  float v21;
  double v22;
  unint64_t v23;
  unint64_t v24;
  int v25;
  double v26;
  int v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int *v31;
  unint64_t v32;
  double v33;
  double *v34;
  unsigned int *v35;
  float v37;
  float sfr_dashedLineCount;
  float v39;
  float v40;
  float v41;
  uint64_t v42;
  uint64_t v43;
  float v44;
  char v45;
  unint64_t v46;

  v4 = -[TSDBezierPath init](self, "init");
  if (!objc_msgSend(a3, "allowsKeyedCoding"))
  {
    LODWORD(v46) = 0;
    v45 = 0;
    v44 = 0.0;
    v42 = 0;
    v43 = 0;
    v12 = objc_msgSend(a3, "versionForClassName:", CFSTR("TSDBezierPath"));
    objc_msgSend(a3, "decodeValueOfObjCType:at:", "i", &v46);
    if ((_DWORD)v46)
    {
      v13 = 0;
      do
      {
        objc_msgSend(a3, "decodeValuesOfObjCTypes:", "cff", &v45, &v44, (char *)&v43 + 4);
        v14 = v44;
        v15 = *((float *)&v43 + 1);
        switch(v45)
        {
          case 0:
            -[TSDBezierPath moveToPoint:](v4, "moveToPoint:", v44, *((float *)&v43 + 1));
            break;
          case 1:
            -[TSDBezierPath lineToPoint:](v4, "lineToPoint:", v44, *((float *)&v43 + 1));
            break;
          case 2:
            objc_msgSend(a3, "decodeValuesOfObjCTypes:", "cff", &v45, &v44, (char *)&v43 + 4);
            v16 = v44;
            v17 = *((float *)&v43 + 1);
            objc_msgSend(a3, "decodeValuesOfObjCTypes:", "cff", &v45, &v44, (char *)&v43 + 4);
            v13 += 2;
            -[TSDBezierPath curveToPoint:controlPoint1:controlPoint2:](v4, "curveToPoint:controlPoint1:controlPoint2:", v44, *((float *)&v43 + 1), v14, v15, v16, v17);
            break;
          case 3:
            -[TSDBezierPath closePath](v4, "closePath");
            break;
          default:
            break;
        }
        ++v13;
      }
      while (v13 < v46);
    }
    if (v12 > 523)
    {
      sfr_lineWidth = v4->sfr_lineWidth;
      sfr_flatness = v4->sfr_flatness;
      sfr_miterLimit = v4->sfr_miterLimit;
      v40 = sfr_miterLimit;
      v41 = sfr_lineWidth;
      v21 = sfr_flatness;
      sfr_dashedLineCount = (float)v4->sfr_dashedLineCount;
      v39 = v21;
      objc_msgSend(a3, "decodeValuesOfObjCTypes:", "iiifffi", &v43, &v42, (char *)&v42 + 4, &v41, &v40, &v39, &sfr_dashedLineCount);
      -[TSDBezierPath setWindingRule:](v4, "setWindingRule:", v43);
      -[TSDBezierPath setLineCapStyle:](v4, "setLineCapStyle:", v42);
      -[TSDBezierPath setLineJoinStyle:](v4, "setLineJoinStyle:", HIDWORD(v42));
      v4->sfr_lineWidth = v41;
      v22 = v39;
      v4->sfr_miterLimit = v40;
      v4->sfr_flatness = v22;
      v23 = (unint64_t)sfr_dashedLineCount;
      v4->sfr_dashedLineCount = (unint64_t)sfr_dashedLineCount;
      if (v23)
      {
        v37 = 0.0;
        objc_msgSend(a3, "decodeValueOfObjCType:at:", "f", &v37);
        v4->sfr_dashedLinePhase = v37;
        v4->sfr_dashedLinePattern = (double *)NSZoneMalloc((NSZone *)-[TSDBezierPath zone](v4, "zone"), 8 * v4->sfr_dashedLineCount);
        if (v4->sfr_dashedLineCount)
        {
          v24 = 0;
          do
          {
            objc_msgSend(a3, "decodeValueOfObjCType:at:", "f", &v37);
            v4->sfr_dashedLinePattern[v24++] = v37;
          }
          while (v24 < v4->sfr_dashedLineCount);
        }
      }
    }
    else
    {
      v41 = 0.0;
      LOBYTE(v40) = 0;
      objc_msgSend(a3, "decodeValuesOfObjCTypes:", "iiifc", &v43, &v42, (char *)&v42 + 4, &v41, &v40);
      v4->sfr_lineWidth = v41;
      -[TSDBezierPath setWindingRule:](v4, "setWindingRule:", v43);
      -[TSDBezierPath setLineCapStyle:](v4, "setLineCapStyle:", v42);
      -[TSDBezierPath setLineJoinStyle:](v4, "setLineJoinStyle:", HIDWORD(v42));
    }
    return v4;
  }
  v46 = 0;
  v5 = objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("TSDSegments"), &v46);
  if (!v5)
    goto LABEL_38;
  if (!v46)
    goto LABEL_38;
  v6 = v5 + v46;
  if (v5 >= v5 + v46)
    goto LABEL_38;
  while (v5 + 1 <= v6)
  {
    if (v5 + 5 > v6)
      break;
    v7 = (int8x8_t *)(v5 + 9);
    if (v5 + 9 > v6)
      break;
    v8 = COERCE_FLOAT(bswap32(*(_DWORD *)(v5 + 1)));
    v9 = COERCE_FLOAT(bswap32(*(_DWORD *)(v5 + 5)));
    switch(*(_BYTE *)v5)
    {
      case 0:
        -[TSDBezierPath moveToPoint:](v4, "moveToPoint:", v8, v9);
        break;
      case 1:
        -[TSDBezierPath lineToPoint:](v4, "lineToPoint:", v8, v9);
        break;
      case 2:
        v7 = (int8x8_t *)(v5 + 14);
        if (v5 + 14 <= v6)
        {
          if (v5 + 18 <= v6)
          {
            v7 = (int8x8_t *)(v5 + 19);
            v10 = (int8x8_t *)(v5 + 23);
            if (v5 + 23 <= v6)
            {
              v11 = (int8x8_t *)(v5 + 27);
              if (v5 + 27 <= v6)
              {
                -[TSDBezierPath curveToPoint:controlPoint1:controlPoint2:](v4, "curveToPoint:controlPoint1:controlPoint2:", vcvtq_f64_f32((float32x2_t)vrev32_s8(*v7)), v8, v9, COERCE_FLOAT(bswap32(*(_DWORD *)(v5 + 10))), COERCE_FLOAT(bswap32(*(_DWORD *)(v5 + 14))));
                v7 = v11;
              }
              else
              {
                NSLog((NSString *)CFSTR("ERROR: TSDBezierPath VALIDATE_NEW_BYTE_OFFSET_OF_TYPE_FOR_LIMIT. attempt to read to byte offset outside limit "));
                v7 = v10;
              }
              break;
            }
          }
        }
        else
        {
          v7 = (int8x8_t *)(v5 + 10);
        }
        NSLog((NSString *)CFSTR("ERROR: TSDBezierPath VALIDATE_NEW_BYTE_OFFSET_OF_TYPE_FOR_LIMIT. attempt to read to byte offset outside limit "));
        break;
      case 3:
        -[TSDBezierPath closePath](v4, "closePath");
        break;
      default:
        break;
    }
    v5 = (unint64_t)v7;
    if ((unint64_t)v7 >= v6)
      goto LABEL_38;
  }
  NSLog((NSString *)CFSTR("ERROR: TSDBezierPath VALIDATE_NEW_BYTE_OFFSET_OF_TYPE_FOR_LIMIT. attempt to read to byte offset outside limit "));
LABEL_38:
  -[TSDBezierPath setWindingRule:](v4, "setWindingRule:", (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("TSDWindingRule")));
  -[TSDBezierPath setLineCapStyle:](v4, "setLineCapStyle:", (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("TSDCapStyle")));
  -[TSDBezierPath setLineJoinStyle:](v4, "setLineJoinStyle:", (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("TSDJoinStyle")));
  v25 = objc_msgSend(a3, "containsValueForKey:", CFSTR("TSDLineWidth"));
  v26 = 1.0;
  if (v25)
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("TSDLineWidth"), 1.0);
  v4->sfr_lineWidth = v26;
  v27 = objc_msgSend(a3, "containsValueForKey:", CFSTR("TSDMiterLimit"));
  v28 = 10.0;
  if (v27)
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("TSDMiterLimit"), 10.0);
  v4->sfr_miterLimit = v28;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("TSDFlatness")))
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("TSDFlatness"));
  else
    v29 = 0x3FE3333333333333;
  *(_QWORD *)&v4->sfr_flatness = v29;
  v30 = objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("TSDDashPatterns"), &v46);
  if (v30)
  {
    if (v46)
    {
      v31 = (unsigned int *)v30;
      v32 = v30 + v46;
      v4->sfr_dashedLineCount = v46 >> 2;
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("TSDDashPhase"));
      v4->sfr_dashedLinePhase = v33;
      v34 = (double *)NSZoneMalloc((NSZone *)-[TSDBezierPath zone](v4, "zone"), 8 * v4->sfr_dashedLineCount);
      v4->sfr_dashedLinePattern = v34;
      if ((unint64_t)v31 < v32)
      {
        while (1)
        {
          v35 = v31 + 1;
          if ((unint64_t)(v31 + 1) > v32)
            break;
          *v34++ = COERCE_FLOAT(bswap32(*v31++));
          if ((unint64_t)v35 >= v32)
            return v4;
        }
        NSLog((NSString *)CFSTR("ERROR: TSDBezierPath VALIDATE_NEW_BYTE_OFFSET_OF_TYPE_FOR_LIMIT. attempt to read to byte offset outside limit "));
      }
    }
  }
  return v4;
}

- (const)cString
{
  void *v3;
  int64_t sfr_elementCount;
  PATHSEGMENT *sfr_head;
  PATHSEGMENT *v6;
  double *sfr_extraSegments;
  char *v8;
  size_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char v16;
  _BYTE v17[271];

  *(_QWORD *)&v17[255] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount >= 1)
  {
    sfr_head = self->sfr_head;
    v6 = &sfr_head[6 * sfr_elementCount];
    sfr_extraSegments = (double *)self->sfr_extraSegments;
    while (2)
    {
      if (sfr_head == self->sfr_head)
      {
        v8 = &v16;
        v9 = 256;
      }
      else
      {
        v16 = 32;
        v8 = v17;
        v9 = 255;
      }
      switch(*(_DWORD *)sfr_head & 0xF)
      {
        case 0:
          v10 = snprintf(v8, v9, "M %f %f");
          goto LABEL_12;
        case 1:
          v10 = snprintf(v8, v9, "L %f %f");
          goto LABEL_12;
        case 2:
          v10 = snprintf(v8, v9, "C %f %f %f %f %f %f", *sfr_extraSegments, sfr_extraSegments[1], sfr_extraSegments[2], sfr_extraSegments[3], *(double *)&sfr_head[2], *(double *)&sfr_head[4]);
          sfr_extraSegments += 4;
          goto LABEL_12;
        case 3:
          *v8 = 90;
          v10 = 1;
LABEL_12:
          if (v10 < 1 || v10 >= (int)v9)
            goto LABEL_17;
          objc_msgSend(v3, "appendBytes:length:", &v16, &v8[v10] - &v16);
          sfr_head += 6;
          if (sfr_head >= v6)
            break;
          continue;
        default:
          v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBezierPath cString]");
          objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPath.m"), 2252, CFSTR("Unhandled path element type"));
LABEL_17:
          v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBezierPath cString]");
          objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPath.m"), 2261, CFSTR("buffer too small for path element string"));
          goto LABEL_18;
      }
      break;
    }
  }
LABEL_18:
  v16 = 0;
  objc_msgSend(v3, "appendBytes:length:", &v16, 1);
  return (const char *)objc_msgSend(v3, "bytes");
}

- (TSDBezierPath)initWithCString:(const char *)a3
{
  TSDBezierPath *v4;
  TSDBezierPath *v5;
  const char *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  char v29;

  v4 = -[TSDBezierPath init](self, "init");
  v5 = v4;
  if (a3)
  {
    if (v4)
    {
      if (*a3)
      {
        v29 = 0;
        v28 = 0;
        if (sscanf(a3, " %c%n", &v29, &v28) >= 1)
        {
          do
          {
            v6 = &a3[v28];
            v28 = 0;
            v26 = 0;
            v27 = 0;
            v25 = 0;
            if (v29 > 98)
            {
              if (v29 > 108)
              {
                if (v29 == 122)
                  goto LABEL_28;
                if (v29 == 113)
                {
LABEL_29:
                  v7 = sscanf(v6, " %g %g %g %g%n", (char *)&v27 + 4, &v27, (char *)&v26 + 4, &v26, &v28);
                  v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
                  v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBezierPath initWithCString:]");
                  v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPath.m");
                  if (v7 == 4)
                  {
                    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 2313, CFSTR("kCGPathElementAddQuadCurveToPoint not supported yet"));
                    -[TSDBezierPath lineToPoint:](v5, "lineToPoint:", *((float *)&v27 + 1), *(float *)&v27);
                  }
                  else
                  {
                    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 2317, CFSTR("Could not read bezier quad curve-to elmt"));
                  }
                  goto LABEL_37;
                }
                if (v29 != 109)
                {
LABEL_32:
                  v18 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
                  v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBezierPath initWithCString:]");
                  v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPath.m");
                  v14 = (void *)v18;
                  v15 = v19;
                  v16 = 2338;
                  v17 = CFSTR("Bezier path string contained unknown elmt.");
                  goto LABEL_35;
                }
LABEL_24:
                if (sscanf(v6, " %g %g%n", (char *)&v27 + 4, &v27, &v28) != 2)
                {
                  v20 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
                  v21 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBezierPath initWithCString:]");
                  v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPath.m");
                  v14 = (void *)v20;
                  v15 = v21;
                  v16 = 2298;
                  v17 = CFSTR("Could not read bezier movement elmt");
                  goto LABEL_35;
                }
                -[TSDBezierPath moveToPoint:](v5, "moveToPoint:", *((float *)&v27 + 1), *(float *)&v27);
                goto LABEL_37;
              }
              if (v29 == 99)
              {
LABEL_26:
                if (sscanf(v6, " %g %g %g %g %g %g%n", (char *)&v26 + 4, &v26, (char *)&v25 + 4, &v25, (char *)&v27 + 4, &v27, &v28) != 6)
                {
                  v22 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
                  v23 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBezierPath initWithCString:]");
                  v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPath.m");
                  v14 = (void *)v22;
                  v15 = v23;
                  v16 = 2326;
                  v17 = CFSTR("Could not read bezier curve-to elmt");
                  goto LABEL_35;
                }
                -[TSDBezierPath curveToPoint:controlPoint1:controlPoint2:](v5, "curveToPoint:controlPoint1:controlPoint2:", *((float *)&v27 + 1), *(float *)&v27, *((float *)&v26 + 1), *(float *)&v26, *((float *)&v25 + 1), *(float *)&v25);
                goto LABEL_37;
              }
              if (v29 == 101)
                goto LABEL_37;
              if (v29 != 108)
                goto LABEL_32;
            }
            else
            {
              if (v29 > 76)
              {
                if (v29 != 77)
                {
                  if (v29 == 81)
                    goto LABEL_29;
                  if (v29 != 90)
                    goto LABEL_32;
LABEL_28:
                  -[TSDBezierPath closePath](v5, "closePath");
                  goto LABEL_37;
                }
                goto LABEL_24;
              }
              if (v29 == 67)
                goto LABEL_26;
              if (v29 == 69)
                goto LABEL_37;
              if (v29 != 76)
                goto LABEL_32;
            }
            if (sscanf(v6, " %g %g%n", (char *)&v27 + 4, &v27, &v28) != 2)
            {
              v11 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
              v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBezierPath initWithCString:]");
              v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPath.m");
              v14 = (void *)v11;
              v15 = v12;
              v16 = 2307;
              v17 = CFSTR("Could not read bezier line path elmt");
LABEL_35:
              objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, v13, v16, v17);
              goto LABEL_37;
            }
            -[TSDBezierPath lineToPoint:](v5, "lineToPoint:", *((float *)&v27 + 1), *(float *)&v27);
LABEL_37:
            a3 = &v6[v28];
          }
          while (sscanf(a3, " %c%n", &v29, &v28) > 0);
        }
      }
    }
  }
  return v5;
}

- (void)_addPathSegment:(int64_t)a3 point:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  int64_t sfr_elementCount;
  PATHSEGMENT *v9;
  double *v10;
  int64_t v11;
  PATHSEGMENT *v12;
  void *sfr_path;
  $7B3C09426D5A94CD5FE07DCF037609F1 sfr_bpFlags;
  double v15;

  y = a4.y;
  x = a4.x;
  sfr_elementCount = self->sfr_elementCount;
  if (sfr_elementCount == self->sfr_elementMax)
  {
    self->sfr_elementMax = 2 * sfr_elementCount + 10;
    v9 = (PATHSEGMENT *)NSZoneRealloc((NSZone *)-[TSDBezierPath zone](self, "zone"), self->sfr_head, 24 * self->sfr_elementMax);
    if (v9)
      self->sfr_head = v9;
    else
      NSLog((NSString *)CFSTR("ERROR: TSDBezierPath _addPathSegment. sfr_head could not NSZoneRealloc. No memory"));
    if ((*((_BYTE *)&self->sfr_bpFlags + 1) & 4) != 0)
    {
      v10 = (double *)NSZoneRealloc((NSZone *)-[TSDBezierPath zone](self, "zone"), self->sfr_elementLength, 8 * self->sfr_elementMax);
      if (v10)
        self->sfr_elementLength = v10;
      else
        NSLog((NSString *)CFSTR("ERROR: TSDBezierPath _addPathSegment. sfr_elementLength could not NSZoneRealloc. No memory"));
    }
  }
  *(_QWORD *)&self->sfr_head[6 * self->sfr_elementCount] = *(_QWORD *)&self->sfr_head[6 * self->sfr_elementCount] & 0xFFFFFFFFFFFFFFF0 | a3 & 0xF;
  *(_QWORD *)&self->sfr_head[6 * self->sfr_elementCount] &= 0xFuLL;
  v11 = self->sfr_elementCount;
  v12 = &self->sfr_head[6 * v11];
  *(CGFloat *)&v12[2] = x;
  *(CGFloat *)&v12[4] = y;
  self->sfr_elementCount = v11 + 1;
  sfr_path = self->sfr_path;
  if (sfr_path)
  {
    CFRelease(sfr_path);
    self->sfr_path = 0;
  }
  sfr_bpFlags = self->sfr_bpFlags;
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&sfr_bpFlags | 1);
  if (a3 != 2 && (*(_WORD *)&sfr_bpFlags & 0x400) != 0)
  {
    -[TSDBezierPath lengthOfElement:](self, "lengthOfElement:", self->sfr_elementCount - 1);
    self->sfr_elementLength[self->sfr_elementCount - 1] = v15;
    self->sfr_totalLength = v15 + self->sfr_totalLength;
  }
}

- (void)_deviceMoveToPoint:(CGPoint)a3
{
  int v4;
  PATHSEGMENT *sfr_head;
  int64_t v6;

  v4 = (*(_DWORD *)&self->sfr_bpFlags >> 8) & 3;
  if (v4 == 2)
  {
    sfr_head = self->sfr_head;
    v6 = self->sfr_elementCount - 1;
    if ((*(_BYTE *)&sfr_head[6 * v6] & 0xF) == 0)
      goto LABEL_6;
  }
  else if (v4 == 1)
  {
    sfr_head = self->sfr_head;
    v6 = self->sfr_elementCount - 1;
LABEL_6:
    *(CGPoint *)&sfr_head[6 * v6 + 2] = a3;
    goto LABEL_7;
  }
  -[TSDBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 0, a3.x, a3.y);
  v6 = self->sfr_elementCount - 1;
LABEL_7:
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF | 0x200);
  self->sfr_lastSubpathIndex = v6;
}

- (void)_deviceLineToPoint:(CGPoint)a3
{
  -[TSDBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 1, a3.x, a3.y);
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF | 0x200);
}

- (void)_deviceCurveToPoint:(CGPoint)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  CGFloat v8;
  int64_t sfr_extraSegmentCount;
  void *v11;
  int64_t v12;
  CGFloat *v13;
  PATHSEGMENT *v14;
  double v15;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  -[TSDBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 2, a3.x, a3.y);
  sfr_extraSegmentCount = self->sfr_extraSegmentCount;
  if (sfr_extraSegmentCount == self->sfr_extraSegmentMax)
  {
    self->sfr_extraSegmentMax = 2 * sfr_extraSegmentCount + 10;
    v11 = NSZoneRealloc((NSZone *)-[TSDBezierPath zone](self, "zone"), self->sfr_extraSegments, 32 * self->sfr_extraSegmentMax);
    if (v11)
      self->sfr_extraSegments = v11;
    else
      NSLog((NSString *)CFSTR("ERROR: TSDBezierPath _deviceCurveToPoint sfr_extraSegments could not NSZoneRealloc. No memory"));
  }
  v12 = self->sfr_extraSegmentCount;
  v13 = (CGFloat *)((char *)self->sfr_extraSegments + 32 * v12);
  *v13 = v8;
  v13[1] = v7;
  v13[2] = x;
  v13[3] = y;
  self->sfr_extraSegmentCount = v12 + 1;
  v14 = &self->sfr_head[6 * self->sfr_elementCount];
  *(_QWORD *)&v14[-6] = *(_QWORD *)&v14[-6] & 0xFLL | (16 * v12);
  LODWORD(v14) = self->sfr_bpFlags;
  self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(v14 & 0xFFFFFCFB | 0x200);
  if (((unsigned __int16)v14 & 0x400) != 0)
  {
    -[TSDBezierPath lengthOfElement:](self, "lengthOfElement:", self->sfr_elementCount - 1);
    self->sfr_elementLength[self->sfr_elementCount - 1] = v15;
    self->sfr_totalLength = v15 + self->sfr_totalLength;
  }
}

- (void)_deviceClosePath
{
  int64_t sfr_lastSubpathIndex;
  void *v4;
  uint64_t v5;
  PATHSEGMENT *v6;

  if ((*(_DWORD *)&self->sfr_bpFlags & 0x300) == 0x200)
  {
    sfr_lastSubpathIndex = self->sfr_lastSubpathIndex;
    if (sfr_lastSubpathIndex < 0)
    {
      v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBezierPath(TSDBezierPathDevicePrimitives) _deviceClosePath]");
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPath.m"), 2475, CFSTR("Invalid parameter not satisfying: %s"), "sfr_lastSubpathIndex >= 0");
      sfr_lastSubpathIndex = self->sfr_lastSubpathIndex;
    }
    -[TSDBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 3, *(double *)&self->sfr_head[6 * sfr_lastSubpathIndex + 2], *(double *)&self->sfr_head[6 * sfr_lastSubpathIndex + 4]);
    v6 = &self->sfr_head[6 * self->sfr_lastSubpathIndex];
    -[TSDBezierPath _addPathSegment:point:](self, "_addPathSegment:point:", 0, *(double *)&v6[2], *(double *)&v6[4]);
    self->sfr_lastSubpathIndex = self->sfr_elementCount - 1;
    self->sfr_bpFlags = ($7B3C09426D5A94CD5FE07DCF037609F1)(*(_DWORD *)&self->sfr_bpFlags & 0xFFFFFCFF | 0x100);
  }
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD v12[2];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CGRect v16;
  CGRect v17;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  objc_msgSend(v3, "appendFormat:", CFSTR("TSDBezierPath <%p>"), self);
  if (!-[TSDBezierPath isEmpty](self, "isEmpty"))
  {
    -[TSDBezierPath bounds](self, "bounds");
    objc_msgSend(v3, "appendFormat:", CFSTR("\n  Bounds: %@"), NSStringFromCGRect(v16));
    -[TSDBezierPath controlPointBounds](self, "controlPointBounds");
    objc_msgSend(v3, "appendFormat:", CFSTR("\n  Control point bounds: %@"), NSStringFromCGRect(v17));
    v4 = -[TSDBezierPath elementCount](self, "elementCount");
    if (v4 >= 1)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        switch(-[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", i, v12))
        {
          case 0uLL:
            objc_msgSend(v3, "appendFormat:", CFSTR("\n    %f %f moveto"), v12[0], v8, v9, v10, v11);
            break;
          case 1uLL:
            objc_msgSend(v3, "appendFormat:", CFSTR("\n    %f %f lineto"), v12[0], v8, v9, v10, v11);
            break;
          case 2uLL:
            objc_msgSend(v3, "appendFormat:", CFSTR("\n    %f %f %f %f %f %f curveto"), v12[0], v12[1], v13, v14);
            break;
          case 3uLL:
            objc_msgSend(v3, "appendString:", CFSTR("\n    closepath"));
            break;
          default:
            continue;
        }
      }
    }
  }
  return v3;
}

- (double)yValueFromXValue:(double)a3 elementIndex:(int64_t *)a4 parametricValue:(double *)a5
{
  double v10;
  double v11;
  int64_t v12;
  double v13;
  double v14;
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
  long double v32;
  double v33;
  long double v34;
  long double v35;
  double v36;
  long double v37;
  __double2 v38;
  double v39;
  void *v43;
  uint64_t v44;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v11 = *MEMORY[0x24BDBEFB0];
  v10 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v12 = 1;
  if (-[TSDBezierPath elementCount](self, "elementCount") < 2)
  {
    v13 = v11;
    v14 = v10;
  }
  else
  {
    do
    {
      v13 = v11;
      v14 = v10;
      switch(-[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v12, &v49))
      {
        case 0uLL:
          v11 = v49;
          v10 = v50;
          break;
        case 1uLL:
          v11 = v49;
          v10 = v50;
          objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TSDBezierPathAdditions.mm"), 71, CFSTR("Don't use LineTo!"));
          break;
        case 2uLL:
          v11 = v53;
          v10 = v54;
          break;
        case 3uLL:
          objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TSDBezierPathAdditions.mm"), 77, CFSTR("Don't use ClosePath!"));
          break;
        default:
          break;
      }
      if (v13 <= a3 && v11 >= a3)
        break;
      ++v12;
    }
    while (v12 < -[TSDBezierPath elementCount](self, "elementCount"));
  }
  if (v13 == v11)
  {
    if (v13 != a3)
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TSDBezierPathAdditions.mm"), 88, CFSTR("something went wrong!"));
    if (v14 != v10)
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TSDBezierPathAdditions.mm"), 89, CFSTR("something is wrong with the curve!"));
  }
  else if (v13 >= a3)
  {
    if (a4)
      *a4 = v12 - 1;
    if (a5)
      *a5 = 0.0;
    return v14;
  }
  else if (v11 <= a3)
  {
    if (a4)
    {
      if (-[TSDBezierPath elementCount](self, "elementCount") <= v12)
        v12 = -[TSDBezierPath elementCount](self, "elementCount") - 1;
      *a4 = v12;
    }
    if (a5)
      *a5 = 1.0;
  }
  else
  {
    if (a4)
    {
      if (-[TSDBezierPath elementCount](self, "elementCount") <= v12)
        v12 = -[TSDBezierPath elementCount](self, "elementCount") - 1;
      *a4 = v12;
    }
    v16 = v50;
    v17 = v52;
    v18 = v11 + v49 * 3.0 - v13 + v51 * -3.0;
    v19 = v49 * 3.0 + v13 * -3.0;
    v20 = v13 - a3;
    v21 = (v49 * -6.0 + v13 * 3.0 + v51 * 3.0) / v18;
    v22 = v19 / v18;
    v23 = v20 / v18;
    v24 = v20 / v18 + v21 * (v21 * (v21 + v21)) / 27.0 + v21 * v22 / -3.0;
    v25 = v24 * v24 * 0.25;
    v26 = (v22 + v21 * v21 / -3.0) * ((v22 + v21 * v21 / -3.0) * (v22 + v21 * v21 / -3.0)) / 27.0 + v25;
    if (v26 <= 0.0)
    {
      if (v26 == 0.0)
      {
        if (v23 >= 0.0)
          v34 = -pow(v23, 0.333333333);
        else
          v34 = pow(fabs(v23), 0.333333333);
      }
      else
      {
        v35 = sqrt(v25 - v26);
        v36 = pow(v35, 0.333333333);
        v37 = acos(-v24 / (v35 + v35));
        v38 = __sincos_stret(v37 / 3.0);
        v39 = v21 / -3.0;
        v34 = v21 / -3.0 + (v36 + v36) * v38.__cosval;
        if (v34 < 0.0 || v34 > 1.0)
        {
          v34 = v39 + -v36 * (v38.__cosval + v38.__sinval * 1.73205081);
          if (v34 < 0.0 || v34 > 1.0)
          {
            v34 = v39 - v36 * (v38.__cosval - v38.__sinval * 1.73205081);
            if (v34 < 0.0 || v34 > 1.0)
            {
              v43 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
              v44 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBezierPath(Additions) yValueFromXValue:elementIndex:parametricValue:]");
              objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPathAdditions.mm"), 192, CFSTR("No valid roots!"));
              v34 = 0.0;
            }
          }
        }
      }
    }
    else
    {
      v27 = v24 * -0.5;
      v47 = v52;
      v48 = v50;
      v28 = sqrt(v26);
      v29 = v24 * -0.5 + v28;
      v30 = pow(fabs(v29), 0.333333333);
      if (v29 <= 0.0)
        v30 = -v30;
      v46 = v30;
      v31 = v27 - v28;
      v32 = vabdd_f64(v27, v28);
      v16 = v48;
      v33 = pow(v32, 0.333333333);
      if (v31 <= 0.0)
        v33 = -v33;
      v17 = v47;
      v34 = v46 + v33 + v21 / -3.0;
    }
    if (a5)
      *a5 = v34;
    return v14
         + (v16 * -6.0 + v14 * 3.0 + v17 * 3.0) * (v34 * v34)
         + v34 * (v34 * v34) * (v10 + v16 * 3.0 - v14 + v17 * -3.0)
         + v34 * (v16 * 3.0 + v14 * -3.0);
  }
  return v10;
}

- (id)pathBySplittingAtPointOnPath:(CGPoint)a3
{
  double v5;
  double v6;
  id v7;
  int64_t v8;
  unint64_t v9;
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
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  uint64_t v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v78 = 0.0;
  v79 = 0;
  -[TSDBezierPath yValueFromXValue:elementIndex:parametricValue:](self, "yValueFromXValue:elementIndex:parametricValue:", &v79, &v78, a3.x, a3.y);
  v6 = *MEMORY[0x24BDBEFB0];
  v5 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v7 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
  if (-[TSDBezierPath elementCount](self, "elementCount") >= 1)
  {
    v8 = 0;
    do
    {
      v9 = -[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v8, &v80);
      if (v8 == v79)
      {
        v10 = v80;
        v11 = v81;
        v12 = v82;
        v13 = v83;
        v14 = v85;
        v76 = v85;
        v77 = v84;
        v15 = TSDSubtractPoints(v80, v81, v6);
        v16 = v78;
        v18 = TSDMultiplyPointScalar(v15, v17, v78);
        v19 = TSDAddPoints(v6, v5, v18);
        v72 = v20;
        v73 = v19;
        v21 = TSDSubtractPoints(v12, v13, v10);
        v22 = v16;
        v24 = TSDMultiplyPointScalar(v21, v23, v16);
        v25 = TSDAddPoints(v10, v11, v24);
        v27 = v26;
        v71 = v26;
        v28 = TSDSubtractPoints(v77, v14, v12);
        v30 = TSDMultiplyPointScalar(v28, v29, v22);
        v31 = TSDAddPoints(v12, v13, v30);
        v74 = v32;
        v75 = v31;
        v33 = v32;
        v34 = TSDSubtractPoints(v25, v27, v73);
        v36 = TSDMultiplyPointScalar(v34, v35, v22);
        v37 = TSDAddPoints(v73, v72, v36);
        v39 = v38;
        v40 = TSDSubtractPoints(v31, v33, v25);
        v42 = TSDMultiplyPointScalar(v40, v41, v22);
        v43 = TSDAddPoints(v25, v71, v42);
        v45 = v44;
        v46 = TSDSubtractPoints(v43, v44, v37);
        v48 = TSDMultiplyPointScalar(v46, v47, v22);
        v49 = TSDAddPoints(v37, v39, v48);
        v51 = v50;
        v52 = TSDSubtractPoints(v37, v39, v49);
        v54 = v53;
        v55 = TSDSubtractPoints(v43, v45, v49);
        v57 = TSDMultiplyPointScalar(v55, v56, -1.0);
        v58 = TSDAddPoints(v52, v54, v57);
        v60 = TSDMultiplyPointScalar(v58, v59, 0.5);
        v62 = v61;
        v63 = TSDAddPoints(v49, v51, v60);
        v65 = v64;
        v66 = TSDMultiplyPointScalar(v60, v62, -1.0);
        v67 = TSDAddPoints(v49, v51, v66);
        v69 = v68;
        objc_msgSend(v7, "curveToPoint:controlPoint1:controlPoint2:", v49, v51, v73, v72, v63, v65);
        v5 = v76;
        v6 = v77;
        objc_msgSend(v7, "curveToPoint:controlPoint1:controlPoint2:", v77, v76, v67, v69, v75, v74);
      }
      else
      {
        switch(v9)
        {
          case 0uLL:
            objc_msgSend(v7, "moveToPoint:", v80, v81);
            goto LABEL_8;
          case 1uLL:
            objc_msgSend(v7, "lineToPoint:", v80, v81);
            objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TSDBezierPathAdditions.mm"), 288, CFSTR("Don't use LineTo!"));
LABEL_8:
            v6 = v80;
            v5 = v81;
            break;
          case 2uLL:
            objc_msgSend(v7, "curveToPoint:controlPoint1:controlPoint2:", v84, v85, v80, v81, v82, v83);
            v6 = v84;
            v5 = v85;
            break;
          case 3uLL:
            objc_msgSend(v7, "closePath");
            objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TSDBezierPathAdditions.mm"), 297, CFSTR("Don't use ClosePath!"));
            break;
          default:
            break;
        }
      }
      ++v8;
    }
    while (v8 < -[TSDBezierPath elementCount](self, "elementCount", *(_QWORD *)&v71));
  }
  return v7;
}

- (double)yValueFromXValue:(double)a3
{
  double result;

  -[TSDBezierPath yValueFromXValue:elementIndex:parametricValue:](self, "yValueFromXValue:elementIndex:parametricValue:", 0, 0, a3);
  return result;
}

- (void)alignBoundsToOrigin
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGAffineTransform v7;

  if (-[TSDBezierPath elementCount](self, "elementCount") >= 1)
  {
    -[TSDBezierPath bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    if (!TSDNearlyEqualPoints(*MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v3, v5))
    {
      CGAffineTransformMakeTranslation(&v7, -v4, -v6);
      -[TSDBezierPath transformUsingAffineTransform:](self, "transformUsingAffineTransform:", &v7);
    }
  }
}

- (BOOL)isCompound
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;

  v3 = -[TSDBezierPath elementCount](self, "elementCount");
  if (v3 < 1)
  {
    v7 = 0;
  }
  else
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    do
    {
      if (!-[TSDBezierPath elementAtIndex:](self, "elementAtIndex:", v5))
        ++v6;
      ++v5;
    }
    while (v4 != v5);
    v7 = v6 - (-[TSDBezierPath elementAtIndex:](self, "elementAtIndex:", v4 - 1) == 0);
  }
  return v7 > 1;
}

- (BOOL)isSelfIntersecting
{
  return 0;
}

- (void)takeAttributesFromStroke:(id)a3
{
  int v5;
  double v6;
  uint64_t v7;

  v5 = objc_msgSend(a3, "supportsWidth");
  v6 = 0.0;
  if (v5)
    objc_msgSend(a3, "width", 0.0);
  -[TSDBezierPath setLineWidth:](self, "setLineWidth:", v6);
  if (objc_msgSend(a3, "supportsLineOptions"))
  {
    objc_msgSend(a3, "miterLimit");
    -[TSDBezierPath setMiterLimit:](self, "setMiterLimit:");
    -[TSDBezierPath setLineCapStyle:](self, "setLineCapStyle:", (int)objc_msgSend(a3, "cap"));
    v7 = (int)objc_msgSend(a3, "join");
  }
  else
  {
    v7 = 1;
  }
  -[TSDBezierPath setLineJoinStyle:](self, "setLineJoinStyle:", v7);
}

- (CGRect)_addMitersFromSegments:(id)a3 toRect:(CGRect)a4
{
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  float v13;
  float v14;
  uint64_t i;
  void *v16;
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
  long double v29;
  double v30;
  long double v31;
  long double v32;
  long double v33;
  double v34;
  double v35;
  float v36;
  float v37;
  float v38;
  double v39;
  double v40;
  float v41;
  float v42;
  float v43;
  float v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  double x;
  double y;
  double width;
  double height;
  double v57;
  float v58;
  float v59;
  CGRect result;

  v6 = objc_msgSend(a3, "count");
  -[TSDBezierPath lineWidth](self, "lineWidth");
  v8 = v7;
  -[TSDBezierPath miterLimit](self, "miterLimit");
  v10 = v9;
  v11 = objc_msgSend(a3, "objectAtIndex:", 0);
  if (v6 >= 2)
  {
    v12 = (void *)v11;
    v13 = v8;
    v14 = v10;
    v58 = v14;
    v59 = v13;
    v57 = v13;
    for (i = 1; i != v6; ++i)
    {
      v16 = v12;
      v12 = (void *)objc_msgSend(a3, "objectAtIndex:", i);
      objc_msgSend(v16, "inPoint");
      v18 = v17;
      v20 = v19;
      objc_msgSend(v16, "toPoint");
      v22 = v21;
      v24 = v23;
      objc_msgSend(v12, "outPoint");
      v26 = v25;
      v28 = v27;
      v29 = TSDSubtractPoints(v18, v20, v22);
      v31 = v30;
      v32 = TSDSubtractPoints(v26, v28, v22);
      v34 = v33;
      v35 = TSDAngleFromDelta(v32, v33);
      v36 = v35 - TSDAngleFromDelta(v29, v31);
      v37 = fabsf(v36);
      if (v37 > 3.14159265)
      {
        v38 = 6.28318531 - v37;
        v37 = v38;
      }
      v39 = v37;
      v40 = sin(v37 * 0.5);
      if (vabdd_f64(3.14159265, v39) > 0.001)
      {
        v41 = v57 / v40;
        v42 = fabsf(v41);
        if ((float)(v42 / v59) < v58)
        {
          v43 = sqrt(v31 * v31 + v29 * v29);
          v44 = sqrt(v34 * v34 + v32 * v32);
          v45 = TSDAveragePoints(v29 / v43, v31 / v43, v32 / v44);
          v46 = -v45;
          *(float *)&v45 = sqrt(v47 * v47 + v45 * v45);
          v48 = TSDAddPoints(v22, v24, v42 * 0.5 * (v46 / *(float *)&v45));
          a4.origin.x = TSDGrowRectToPoint(a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, v48, v49);
          a4.origin.y = v50;
          a4.size.width = v51;
          a4.size.height = v52;
        }
      }
    }
  }
  x = a4.origin.x;
  y = a4.origin.y;
  width = a4.size.width;
  height = a4.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)boundsIncludingStrokeWidth:(double)a3 joinStyle:(unint64_t)a4 capStyle:(unint64_t)a5 miterLimit:(double)a6 needsToExtendJoins:(BOOL)a7
{
  double v8;
  CGFloat x;
  double v10;
  CGFloat y;
  double v12;
  CGFloat width;
  double v14;
  CGFloat height;
  _BOOL4 v16;
  const CGPath *CopyByStrokingPath;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _QWORD v30[7];
  CGRect PathBoundingBox;
  CGRect v32;
  CGRect v33;
  CGRect result;
  CGRect v35;

  v30[6] = *MEMORY[0x24BDAC8D0];
  if (a3 == 0.0)
  {
    -[TSDBezierPath bounds](self, "bounds", a4, a5, a7);
    x = v8;
    y = v10;
    width = v12;
    height = v14;
    goto LABEL_12;
  }
  v16 = a7;
  CopyByStrokingPath = CGPathCreateCopyByStrokingPath(-[TSDBezierPath CGPath](self, "CGPath"), 0, a3, (CGLineCap)a5, (CGLineJoin)a4, a6);
  PathBoundingBox = CGPathGetPathBoundingBox(CopyByStrokingPath);
  x = PathBoundingBox.origin.x;
  y = PathBoundingBox.origin.y;
  width = PathBoundingBox.size.width;
  height = PathBoundingBox.size.height;
  CGPathRelease(CopyByStrokingPath);
  if (v16)
  {
    v19 = -[TSDBezierPath elementCount](self, "elementCount");
    if (v19 >= 1)
    {
      v20 = v19;
      v21 = 0;
      v22 = sqrt(a3 * 0.5 * a3);
      while (1)
      {
        v23 = -[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v21, v30);
        if (v23 < 2)
          break;
        if (v23 == 2)
        {
          v24 = *(double *)&v30[4];
          v25 = *(double *)&v30[5];
          goto LABEL_10;
        }
LABEL_11:
        if (v20 == ++v21)
          goto LABEL_12;
      }
      v24 = *(double *)v30;
      v25 = *(double *)&v30[1];
LABEL_10:
      v35.origin.x = v24 - v22;
      v35.origin.y = v25 - v22;
      v32.origin.x = x;
      v32.origin.y = y;
      v32.size.width = width;
      v32.size.height = height;
      v35.size.width = v22 + v22;
      v35.size.height = v22 + v22;
      v33 = CGRectUnion(v32, v35);
      x = v33.origin.x;
      y = v33.origin.y;
      width = v33.size.width;
      height = v33.size.height;
      goto LABEL_11;
    }
  }
LABEL_12:
  v26 = x;
  v27 = y;
  v28 = width;
  v29 = height;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (CGRect)boundsIncludingStroke
{
  double v3;
  double v4;
  unint64_t v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  -[TSDBezierPath lineWidth](self, "lineWidth");
  v4 = v3;
  v5 = -[TSDBezierPath lineJoinStyle](self, "lineJoinStyle");
  v6 = -[TSDBezierPath lineCapStyle](self, "lineCapStyle");
  -[TSDBezierPath miterLimit](self, "miterLimit");
  -[TSDBezierPath boundsIncludingStrokeWidth:joinStyle:capStyle:miterLimit:needsToExtendJoins:](self, "boundsIncludingStrokeWidth:joinStyle:capStyle:miterLimit:needsToExtendJoins:", v5, v6, 0, v4, v7);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)boundsIncludingTSDStroke:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  char v18;
  BOOL v19;
  _BOOL4 v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect result;

  -[TSDBezierPath bounds](self, "bounds");
  if (TSDNearlyEqualSizes(v5, v6, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8))
    || -[TSDBezierPath isEmpty](self, "isEmpty"))
  {
    goto LABEL_21;
  }
  if (objc_msgSend(a3, "isFrame"))
  {
    -[TSDBezierPath bounds](self, "bounds");
    objc_msgSend(a3, "coverageRect:");
  }
  else
  {
    v11 = 0.0;
    if (objc_msgSend(a3, "supportsWidth"))
    {
      objc_msgSend(a3, "width");
      v11 = v12;
    }
    if (objc_msgSend(a3, "supportsLineOptions"))
    {
      v13 = (int)objc_msgSend(a3, "join");
      v14 = (int)objc_msgSend(a3, "cap");
      objc_msgSend(a3, "miterLimit");
    }
    else
    {
      v13 = +[TSDBezierPath defaultLineJoinStyle](TSDBezierPath, "defaultLineJoinStyle");
      v14 = +[TSDBezierPath defaultLineCapStyle](TSDBezierPath, "defaultLineCapStyle");
      +[TSDBezierPath defaultMiterLimit](TSDBezierPath, "defaultMiterLimit");
    }
    v16 = v15;
    v17 = objc_msgSend((id)objc_msgSend(a3, "pattern"), "count");
    v18 = objc_msgSend(a3, "needsToExtendJoinsForBoundsCalculation");
    v19 = !v17 || v14 == 0;
    v20 = !v19;
    v21 = (v18 & 1) != 0 || (unint64_t)v20;
    -[TSDBezierPath boundsIncludingStrokeWidth:joinStyle:capStyle:miterLimit:needsToExtendJoins:](self, "boundsIncludingStrokeWidth:joinStyle:capStyle:miterLimit:needsToExtendJoins:", v13, v14, v21, v11, v16);
  }
  v22 = v7;
  v23 = v8;
  v24 = v9;
  v25 = v10;
  if (CGRectIsNull(*(CGRect *)&v7))
  {
LABEL_21:
    v22 = *MEMORY[0x24BDBF090];
    v23 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v24 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v25 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  v26 = v22;
  v27 = v23;
  v28 = v24;
  v29 = v25;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (BOOL)pointOnPath:(CGPoint)a3 tolerance:(double)a4
{
  double v4;
  double v5;

  v4 = a4 * 0.5;
  -[TSDBezierPath distanceToPoint:elementIndex:tValue:threshold:](self, "distanceToPoint:elementIndex:tValue:threshold:", 0, 0, a3.x, a3.y, a4 * 0.5);
  return v5 < v4;
}

- (double)distanceToPoint:(CGPoint)a3 elementIndex:(unint64_t *)a4 tValue:(double *)a5 threshold:(double)a6
{
  double y;
  double x;
  int64_t v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  uint64_t v28;

  y = a3.y;
  x = a3.x;
  v28 = *MEMORY[0x24BDAC8D0];
  v12 = -[TSDBezierPath elementCount](self, "elementCount");
  v13 = 0;
  v25 = *(float64x2_t *)MEMORY[0x24BDBEFB0];
  v14 = 0.0;
  v15 = 1.79769313e308;
  if (v12)
  {
    v16 = a6 * a6;
    if (a6 * a6 < 1.79769313e308)
    {
      v17 = v12;
      v13 = 0;
      v15 = 1.79769313e308;
      v18 = 1;
      do
      {
        switch(-[TSDBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", v18 - 1, &v26, *(_OWORD *)&v25))
        {
          case 0uLL:
            v25 = v26;
            break;
          case 1uLL:
            goto LABEL_8;
          case 2uLL:
            v19 = TSDNearestPointOnCurveToPoint(&v26, x, y, 1.0);
            v20 = TSDPointOnCurve(&v26, v19);
            goto LABEL_9;
          case 3uLL:
            v27 = v25;
LABEL_8:
            TSDNearestPointOnLineToPoint(v26.f64, x, y);
            v19 = v22;
            v20 = TSDMixPoints(v26.f64[0], v26.f64[1], v27.f64[0], v27.f64[1], v22);
LABEL_9:
            v23 = TSDDistanceSquared(v20, v21, x, y);
            if (v23 < v15)
            {
              v14 = v19;
              v13 = v18 - 1;
              v15 = v23;
            }
            break;
          default:
            break;
        }
        if (v18 >= v17)
          break;
        ++v18;
      }
      while (v15 > v16);
    }
  }
  if (a4)
    *a4 = v13;
  if (a5)
    *a5 = v14;
  return sqrt(v15);
}

- (CGPoint)pointAlongPathAtPercentage:(double)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  float v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  float v16;
  float v17;
  uint64_t v18;
  double v19;
  double v20;
  float v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  float v27;
  double v28;
  double v29;
  uint64_t v30;
  CGPoint result;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = -[TSDBezierPath bezierPathByFlatteningPath](self, "bezierPathByFlatteningPath");
  v4 = objc_msgSend(v3, "elementCount");
  if (v4 < 1)
  {
    v10 = 0.0;
    v6 = 0.0;
    v9 = 0.0;
    v8 = 0.0;
    v7 = 0.0;
  }
  else
  {
    v5 = 0;
    v6 = 0.0;
    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
    do
    {
      v11 = objc_msgSend(v3, "elementAtIndex:associatedPoints:", v5, &v28);
      switch(v11)
      {
        case 3:
          v6 = TSDDistance(v10, v9, v7, v8) + v6;
          break;
        case 1:
          v12 = v28;
          v13 = v29;
          v6 = TSDDistance(v10, v9, v28, v29) + v6;
          v10 = v12;
          v9 = v13;
          break;
        case 0:
          v10 = v28;
          v9 = v29;
          v8 = v29;
          v7 = v28;
          break;
      }
      ++v5;
    }
    while (v4 != v5);
  }
  TSUClamp();
  if (v4 < 1)
  {
LABEL_25:
    v22 = *MEMORY[0x24BDBEFB0];
    v23 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    goto LABEL_29;
  }
  v15 = 0;
  v16 = v14 * v6;
  v27 = v16;
  v17 = 0.0;
  while (1)
  {
    v18 = objc_msgSend(v3, "elementAtIndex:associatedPoints:", v15, &v28);
    if (!v18)
    {
      v10 = v28;
      v9 = v29;
      v8 = v29;
      v7 = v28;
      goto LABEL_24;
    }
    v19 = v18 == 1 ? v28 : v7;
    v20 = v18 == 1 ? v29 : v8;
    v21 = TSDDistance(v10, v9, v19, v20);
    if ((float)(v17 + v21) >= v27)
      break;
    v17 = v17 + v21;
    v10 = v19;
    v9 = v20;
LABEL_24:
    if (v4 == ++v15)
      goto LABEL_25;
  }
  v24 = TSDSubtractPoints(v19, v20, v10);
  v26 = v24;
  if (v21 > 0.0)
    v26 = TSDMultiplyPointScalar(v24, v25, (float)((float)(v27 - v17) / v21));
  v22 = TSDAddPoints(v10, v9, v26);
LABEL_29:
  result.y = v23;
  result.x = v22;
  return result;
}

- (BOOL)isEffectivelyClosed
{
  unint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _QWORD v9[6];
  double v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (-[TSDBezierPath containsClosePathElement](self, "containsClosePathElement"))
    return 1;
  if (-[TSDBezierPath elementCount](self, "elementCount") < 2
    || -[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", 0, &v10))
  {
    return 0;
  }
  v4 = -[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", -[TSDBezierPath elementCount](self, "elementCount") - 1, v9);
  if (v4 < 2)
  {
    v5 = v10;
    v6 = v11;
    v7 = *(double *)v9;
    v8 = *(double *)&v9[1];
  }
  else
  {
    if (v4 != 2)
      return v4 == 3;
    v5 = v10;
    v6 = v11;
    v7 = *(double *)&v9[4];
    v8 = *(double *)&v9[5];
  }
  return v6 == v8 && v5 == v7;
}

- (BOOL)containsClosePathElement
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL result;

  v3 = -[TSDBezierPath elementCount](self, "elementCount");
  if (v3 < 2)
    return 0;
  v4 = v3;
  v5 = 2;
  do
    result = -[TSDBezierPath elementAtIndex:](self, "elementAtIndex:", v5 - 1) == 3;
  while (!result && v4 != v5++);
  return result;
}

- (void)appendBezierPathWithArcWithEllipseBounds:(CGRect)a3 startAngle:(double)a4 swingAngle:(double)a5 angleType:(int)a6 startNewPath:(BOOL)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  CGFloat MidY;
  CGFloat v36;
  CGFloat MidX;
  _BOOL4 v38;
  CGAffineTransform v40;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v38 = a7;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v47 = *MEMORY[0x24BDAC8D0];
  MidX = CGRectGetMidX(a3);
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  MidY = CGRectGetMidY(v48);
  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = width;
  v49.size.height = height;
  v14 = CGRectGetWidth(v49) * 0.5;
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = width;
  v50.size.height = height;
  v15 = CGRectGetHeight(v50) * 0.5;
  if (a6 == 1)
  {
    TSDEllipseParametricAngleWithPolarAngle(a4, v14, v15);
    v17 = v18;
    TSDEllipseParametricAngleWithPolarAngle(a4 + a5, v14, v15);
    v16 = v19;
  }
  else
  {
    if (a6)
      v16 = 0.0;
    else
      v16 = a4 + a5;
    if (a6)
      v17 = 0.0;
    else
      v17 = a4;
  }
  v20 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath", *(_QWORD *)&MidY);
  objc_msgSend(v20, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", v17 > v16, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), 1.0, v17, v16);
  memset(&v43, 0, sizeof(v43));
  CGAffineTransformMakeScale(&t1, v14, v15);
  CGAffineTransformMakeTranslation(&t2, MidX, v36);
  CGAffineTransformConcat(&v43, &t1, &t2);
  v40 = v43;
  objc_msgSend(v20, "transformUsingAffineTransform:", &v40);
  v21 = objc_msgSend(v20, "elementCount");
  if (v21 >= 1)
  {
    v22 = v21;
    for (i = 0; i != v22; ++i)
    {
      v45 = 0u;
      v46 = 0u;
      v44 = 0u;
      switch(objc_msgSend(v20, "elementAtIndex:associatedPoints:", i, &v44))
      {
        case 0:
          if (i)
          {
            v24 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBezierPath(Additions) appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:]");
            objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPathAdditions.mm"), 794, CFSTR("Only the first element of the arc should be a moveto"));
          }
          if (v38)
            -[TSDBezierPath moveToPoint:](self, "moveToPoint:", v44);
          else
            -[TSDBezierPath lineToPoint:](self, "lineToPoint:", v44);
          break;
        case 1:
          v26 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v27 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBezierPath(Additions) appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:]");
          v28 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPathAdditions.mm");
          v29 = (void *)v26;
          v30 = v27;
          v31 = 805;
          v32 = CFSTR("The arc shouldn't contain lineto elements");
          goto LABEL_19;
        case 2:
          -[TSDBezierPath curveToPoint:controlPoint1:controlPoint2:](self, "curveToPoint:controlPoint1:controlPoint2:", v46, v44, v45);
          break;
        case 3:
          v33 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v34 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBezierPath(Additions) appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:]");
          v28 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPathAdditions.mm");
          v29 = (void *)v33;
          v30 = v34;
          v31 = 811;
          v32 = CFSTR("The arc shouldn't contain close_subpath elements");
LABEL_19:
          objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, v28, v31, v32);
          break;
        default:
          continue;
      }
    }
  }
}

- (void)appendBezierPathWithArcWithEllipseBounds:(CGRect)a3 startRadialVector:(CGPoint)a4 endRadialVector:(CGPoint)a5 angleSign:(int)a6 startNewPath:(BOOL)a7
{
  _BOOL8 v7;
  double x;
  double v10;
  double v11;
  CGFloat height;
  CGFloat width;
  CGFloat v14;
  CGFloat v15;
  double MidX;
  double MidY;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double i;
  void *v25;
  uint64_t v26;
  CGFloat v27;
  double y;
  CGRect v29;

  v7 = a7;
  y = a5.y;
  x = a5.x;
  v10 = a4.y;
  v11 = a4.x;
  height = a3.size.height;
  width = a3.size.width;
  v14 = a3.origin.y;
  v15 = a3.origin.x;
  MidX = CGRectGetMidX(a3);
  v29.origin.x = v15;
  v29.origin.y = v14;
  v27 = height;
  v29.size.width = width;
  v29.size.height = height;
  MidY = CGRectGetMidY(v29);
  v19 = atan2(v10 - MidY, v11 - MidX) * 180.0 / 3.14159265;
  v20 = atan2(y - MidY, x - MidX) * 180.0 / 3.14159265;
  if (a6)
  {
    if (a6 == 1)
    {
      if (v19 < v20)
      {
        v21 = width;
        v22 = v27;
        v23 = v15;
        i = v14;
        do
          v19 = v19 + 360.0;
        while (v19 < v20);
        goto LABEL_12;
      }
    }
    else
    {
      v25 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v26 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBezierPath(Additions) appendBezierPathWithArcWithEllipseBounds:startRadialVector:endRadialVector:angleSign:startNewPath:]");
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPathAdditions.mm"), 842, CFSTR("Unexpected angle sign"));
    }
    v21 = width;
    v22 = v27;
    v23 = v15;
    i = v14;
    goto LABEL_12;
  }
  v21 = width;
  v22 = v27;
  v23 = v15;
  for (i = v14; v20 < v19; v20 = v20 + 360.0)
    ;
LABEL_12:
  -[TSDBezierPath appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:](self, "appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:", 1, v7, v23, i, v21, v22, v19, v20 - v19);
}

- (id)bezierPathByRemovingRedundantElements
{
  id v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v17;
  double v18;
  double v19;
  double v20;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
  v4 = *MEMORY[0x24BDBEFB0];
  v5 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v6 = -[TSDBezierPath elementCount](self, "elementCount");
  if (v6 >= 1)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = v5;
    v11 = v4;
    v12 = v5;
    v13 = v4;
    while (2)
    {
      switch(-[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v8, &v24))
      {
        case 0uLL:
          objc_msgSend(v3, "moveToPoint:", v24, v25);
          v9 = 0;
          v4 = v24;
          v5 = v25;
          goto LABEL_16;
        case 1uLL:
          v15 = v24;
          v14 = v25;
          if (v11 == v24 && v10 == v25)
            goto LABEL_13;
          if ((v9 & 1) != 0
            && TSDCollinearPoints(v13, v12, v11, v10, v24, v25)
            && (v17 = TSDSubtractPoints(v11, v10, v13),
                v22 = v18,
                v23 = v17,
                v19 = TSDSubtractPoints(v15, v14, v13),
                TSDDotPoints(v23, v22, v19, v20) > 0.0))
          {
            objc_msgSend(v3, "setAssociatedPoints:atIndex:", &v24, objc_msgSend(v3, "elementCount") - 1);
            v9 = 1;
LABEL_13:
            v11 = v13;
            v10 = v12;
          }
          else
          {
            objc_msgSend(v3, "lineToPoint:", v15, v14);
            v9 = 1;
          }
          v13 = v11;
          v12 = v10;
          v11 = v24;
          v10 = v25;
LABEL_19:
          if (v7 == ++v8)
            return v3;
          continue;
        case 2uLL:
          objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v28, v29, v24, v25, v26, v27);
          v9 = 0;
          v13 = v11;
          v12 = v10;
          v11 = v28;
          v10 = v29;
          goto LABEL_19;
        case 3uLL:
          objc_msgSend(v3, "closePath");
          v9 = 0;
LABEL_16:
          v13 = v11;
          v12 = v10;
          v11 = v4;
          v10 = v5;
          goto LABEL_19;
        default:
          goto LABEL_19;
      }
    }
  }
  return v3;
}

- (id)p_copyWithPointsInRange:(_NSRange)a3 countingSubpaths:(unint64_t *)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  char v9;
  __int128 *v10;
  unint64_t v11;
  __int128 v13;
  _BYTE v14[32];
  __int128 v15;
  uint64_t v16;

  length = a3.length;
  location = a3.location;
  v16 = *MEMORY[0x24BDAC8D0];
  v8 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
  if (location < location + length)
  {
    v9 = 0;
    v10 = (__int128 *)MEMORY[0x24BEB3F28];
    do
    {
      v13 = *v10;
      *(_OWORD *)v14 = v13;
      *(_OWORD *)&v14[16] = v13;
      v15 = v13;
      v11 = -[TSDBezierPath elementAtIndex:allPoints:](self, "elementAtIndex:allPoints:", location, &v13);
      if ((v9 & 1) != 0)
      {
        switch(v11)
        {
          case 0uLL:
            ++*a4;
            goto LABEL_7;
          case 1uLL:
            goto LABEL_9;
          case 2uLL:
            goto LABEL_11;
          case 3uLL:
            goto LABEL_13;
          default:
            break;
        }
      }
      else
      {
        ++*a4;
        switch(v11)
        {
          case 0uLL:
LABEL_7:
            objc_msgSend(v8, "moveToPoint:", v13);
            break;
          case 1uLL:
            objc_msgSend(v8, "moveToPoint:", v13);
LABEL_9:
            objc_msgSend(v8, "lineToPoint:", *(_OWORD *)v14);
            break;
          case 2uLL:
            objc_msgSend(v8, "moveToPoint:", v13);
LABEL_11:
            objc_msgSend(v8, "curveToPoint:controlPoint1:controlPoint2:", v15, *(double *)v14, *(_OWORD *)&v14[8], *(double *)&v14[24]);
            break;
          case 3uLL:
            objc_msgSend(v8, "moveToPoint:", v13);
LABEL_13:
            objc_msgSend(v8, "closePath");
            break;
          default:
            break;
        }
      }
      ++location;
      v9 = 1;
      --length;
    }
    while (length);
  }
  return v8;
}

- (id)copyWithPointsInRange:(_NSRange)a3
{
  uint64_t v4;

  v4 = 0;
  return -[TSDBezierPath p_copyWithPointsInRange:countingSubpaths:](self, "p_copyWithPointsInRange:countingSubpaths:", a3.location, a3.length, &v4);
}

- (id)pathSplitAtSubpathBoundariesWithSoftElementLimit:(unint64_t)a3 hardElementLimit:(unint64_t)a4
{
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  id v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  if (-[TSDBezierPath elementCount](self, "elementCount") < 0)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBezierPath(Additions) pathSplitAtSubpathBoundariesWithSoftElementLimit:hardElementLimit:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPathAdditions.mm"), 975, CFSTR("elementCount (%zd) should be positive."), -[TSDBezierPath elementCount](self, "elementCount"), v27);
    return (id)MEMORY[0x24BDBD1A8];
  }
  v7 = -[TSDBezierPath elementCount](self, "elementCount");
  if (a3 > a4)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBezierPath(Additions) pathSplitAtSubpathBoundariesWithSoftElementLimit:hardElementLimit:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPathAdditions.mm"), 982, CFSTR("softElementLimit (%zu) should be less than or equal to hardElementLimit (%zu)."), a3, a4);
    return (id)MEMORY[0x24BDBD1A8];
  }
  if (a3 < 2 || a4 <= 1)
  {
    v23 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBezierPath(Additions) pathSplitAtSubpathBoundariesWithSoftElementLimit:hardElementLimit:]");
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPathAdditions.mm"), 987, CFSTR("Unable to split a path with subpaths less than 2 elements at a time."), v26, v27);
    return (id)MEMORY[0x24BDBD1A8];
  }
  if (!v7)
    return (id)MEMORY[0x24BDBD1A8];
  if (v7 <= a3)
  {
    v29[0] = -[TSDBezierPath copy](self, "copy");
    return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
  }
  v12 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v28 = -[TSDBezierPath p_elementCountForSubpaths](self, "p_elementCountForSubpaths");
  v13 = objc_msgSend(v28, "count");
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    while (1)
    {
      v18 = v17++;
      v19 = objc_msgSend((id)objc_msgSend(v28, "objectAtIndexedSubscript:", v18), "unsignedIntegerValue");
      if (v19 + v16 <= a3)
        break;
      v20 = v19;
      if (v16)
      {
        objc_msgSend(v12, "addObject:", -[TSDBezierPath copyWithPointsInRange:](self, "copyWithPointsInRange:", v15, v16));
        v15 += v16;
      }
      if (v20 <= a4)
        goto LABEL_22;
      v21 = a4;
      do
      {
        if (v20 >= v21)
          v22 = v21;
        else
          v22 = v20;
        objc_msgSend(v12, "addObject:", -[TSDBezierPath copyWithPointsInRange:](self, "copyWithPointsInRange:", v15, v22));
        v15 += v22;
        v21 = a4 - 1;
        v20 -= v22;
      }
      while (v20);
LABEL_25:
      v16 = v20;
      if (v17 == v14)
        return v12;
    }
    v20 = v19 + v16;
LABEL_22:
    if (v17 == v14 && v20)
      objc_msgSend(v12, "addObject:", -[TSDBezierPath copyWithPointsInRange:](self, "copyWithPointsInRange:", v15, v20));
    goto LABEL_25;
  }
  return v12;
}

- (id)p_elementCountForSubpaths
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = -[TSDBezierPath elementCount](self, "elementCount");
  if (v4 >= 1)
  {
    v5 = 0;
    v6 = -v4;
    v7 = 1;
    do
    {
      if (!(v6 + v7) || !-[TSDBezierPath elementAtIndex:](self, "elementAtIndex:", v7))
      {
        objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7 - v5));
        v5 = v7;
      }
      ++v7;
    }
    while (v6 + v7 != 1);
  }
  return v3;
}

- (id)p_pathAsSegments
{
  double v3;
  double v4;
  void *v5;
  int64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unsigned __int128 v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  id v26;
  void *v28;
  unsigned __int128 v29;
  __int128 v30;
  __int128 v31;
  _OWORD v32[2];
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDBEFB0];
  v4 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v28 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = -[TSDBezierPath elementCount](self, "elementCount");
  if (v6)
  {
    v7 = v6;
    v8 = -[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", 0, v32);
    if (v7 >= 2)
    {
      v9 = v8;
      if (!v8)
      {
        v4 = *((double *)v32 + 1);
        v3 = *(double *)v32;
      }
      v10 = 1;
      while (1)
      {
        v11 = -[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v10, &v29);
        switch(v11)
        {
          case 0uLL:
            if (objc_msgSend(v5, "count"))
            {
              objc_msgSend(v28, "addObject:", v5);
              v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            }
            v4 = *((double *)&v29 + 1);
            v3 = *(double *)&v29;
            goto LABEL_32;
          case 1uLL:
            if (v9 < 2)
            {
              v13 = *((double *)v32 + 1);
              v12 = *(double *)v32;
              goto LABEL_18;
            }
            if (v9 == 2)
            {
              v13 = *((double *)&v33 + 1);
              v12 = *(double *)&v33;
LABEL_18:
              v18 = v29;
              if (!TSDNearlyEqualPoints(v12, v13, *(double *)&v29, *((double *)&v29 + 1)))
              {
                v14 = v12;
                v15 = v13;
                v19 = v12;
                v20 = v13;
                *(_QWORD *)&v22 = v18 >> 64;
                *(_QWORD *)&v21 = v18;
                *(_QWORD *)&v24 = v18 >> 64;
                *(_QWORD *)&v23 = v18;
                goto LABEL_23;
              }
              goto LABEL_32;
            }
            goto LABEL_32;
          case 2uLL:
            if (v9 < 2)
            {
              v15 = *((double *)v32 + 1);
              v14 = *(double *)v32;
              goto LABEL_22;
            }
            if (v9 == 2)
            {
              v15 = *((double *)&v33 + 1);
              v14 = *(double *)&v33;
LABEL_22:
              v20 = *((double *)&v29 + 1);
              v19 = *(double *)&v29;
              v22 = *((double *)&v30 + 1);
              v21 = *(double *)&v30;
              v24 = *((double *)&v31 + 1);
              v23 = *(double *)&v31;
LABEL_23:
              v25 = +[TSDBezierSegment segmentFromPoint:outPoint:inPoint:toPoint:](TSDBezierSegment, "segmentFromPoint:outPoint:inPoint:toPoint:", v14, v15, v19, v20, v21, v22, v23, v24);
              if ((objc_msgSend(v25, "bogusSegment") & 1) == 0)
                objc_msgSend(v5, "addObject:", v25);
              goto LABEL_32;
            }
            goto LABEL_32;
          case 3uLL:
            if (v9 < 2)
            {
              v17 = *((double *)v32 + 1);
              v16 = *(double *)v32;
LABEL_27:
              if (!TSDNearlyEqualPoints(v16, v17, v3, v4))
              {
                v26 = +[TSDBezierSegment segmentFromPoint:outPoint:inPoint:toPoint:](TSDBezierSegment, "segmentFromPoint:outPoint:inPoint:toPoint:", v16, v17, v16, v17, v3, v4, v3, v4);
                if ((objc_msgSend(v26, "bogusSegment") & 1) == 0)
                  objc_msgSend(v5, "addObject:", v26);
              }
              goto LABEL_30;
            }
            if (v9 == 2)
            {
              v17 = *((double *)&v33 + 1);
              v16 = *(double *)&v33;
              goto LABEL_27;
            }
LABEL_30:
            if (objc_msgSend(v5, "count"))
            {
              objc_msgSend(v5, "addObject:", objc_msgSend(v5, "objectAtIndex:", 0));
              objc_msgSend(v28, "addObject:", v5);
              v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            }
LABEL_32:
            v32[0] = v29;
            v32[1] = v30;
            v33 = v31;
            ++v10;
            v9 = v11;
            if (v7 == v10)
              goto LABEL_33;
            break;
          default:
            goto LABEL_32;
        }
      }
    }
LABEL_33:
    if (objc_msgSend(v5, "count"))
      objc_msgSend(v28, "addObject:", v5);
  }
  return v28;
}

- (id)p_beziersFromSegmentIntersections:(id)a3
{
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  float v14;
  float v15;
  uint64_t v16;
  double *v17;
  void *v18;
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
  double v32;
  double v33;
  double v34;
  float v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  float v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  float v53;
  double v54;
  double v55;
  double v56;
  int v57;
  double v58;
  double v59;
  float v60;
  float v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  float v68;
  float v69;
  float v70;
  _BOOL4 v71;
  _BOOL4 v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  id v85;
  double v87;
  float v88;
  float v89;
  double v90;
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

  v5 = objc_msgSend(a3, "count");
  -[TSDBezierPath lineWidth](self, "lineWidth");
  v7 = v6;
  -[TSDBezierPath miterLimit](self, "miterLimit");
  v9 = v8;
  v10 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = -[TSDBezierPath lineJoinStyle](self, "lineJoinStyle");
  v12 = objc_msgSend(a3, "objectAtIndex:", 0);
  if (v5 >= 2)
  {
    v13 = (void *)v12;
    v14 = v7;
    v15 = v9;
    v88 = v15;
    v89 = v14;
    v87 = v14;
    v92 = (float)(v14 * 0.5);
    v16 = 1;
    v17 = (double *)MEMORY[0x24BDBEFB0];
    do
    {
      v18 = (void *)objc_msgSend(a3, "objectAtIndex:", v16);
      objc_msgSend(v13, "inPoint");
      v20 = v19;
      v22 = v21;
      objc_msgSend(v13, "toPoint");
      v24 = v23;
      v26 = v25;
      objc_msgSend(v18, "outPoint");
      v28 = v27;
      v103 = v29;
      v95 = v20;
      v96 = v22;
      v30 = TSDSubtractPoints(v20, v22, v24);
      v32 = v31;
      v34 = *v17;
      v33 = v17[1];
      v35 = TSDDistance(v30, v31, *v17, v33);
      v36 = TSDMultiplyPointScalar(v30, v32, (float)(1.0 / v35));
      v38 = v37;
      v98 = v28;
      v39 = TSDSubtractPoints(v28, v103, v24);
      v41 = v40;
      v93 = v33;
      v94 = v34;
      v42 = v33;
      v43 = v26;
      v44 = TSDDistance(v39, v40, v34, v42);
      v45 = TSDMultiplyPointScalar(v39, v41, (float)(1.0 / v44));
      v47 = v46;
      v104 = TSDAddPoints(v24, v26, v36);
      v100 = v48;
      v49 = v24;
      v50 = TSDAddPoints(v24, v43, v45);
      v52 = v51;
      v101 = v47;
      v102 = v38;
      v53 = acos(v38 * v47 + v45 * v36);
      v54 = v53;
      v55 = sin(v53 * 0.5);
      v99 = v52;
      v97 = v50;
      if (v11 == 2)
      {
        v56 = v96;
        v57 = 0;
      }
      else
      {
        v56 = v96;
        v57 = 0;
        if (vabdd_f64(3.14159265, v54) > 0.001)
        {
          v60 = v87 / v55;
          v61 = fabsf(v60);
          v58 = v49;
          v59 = v95;
          if ((float)(v61 / v89) < v88)
          {
            v62 = TSDAveragePoints(v36, v102, v45);
            v91 = (float)(v61 * 0.5);
            v64 = TSDMultiplyPointScalar(v62, v63, -1.0);
            v66 = v65;
            v67 = TSDDistance(v64, v65, v94, v93);
            v90 = TSDMultiplyPointScalar(v64, v66, v91 / v67);
            v57 = 1;
          }
          goto LABEL_9;
        }
      }
      v58 = v49;
      v59 = v95;
LABEL_9:
      v68 = v59 * v43 - v56 * v58 + 0.0;
      v69 = v58 * v103 - v43 * v98 + v68;
      v70 = v98 * v56 - v103 * v59 + v69;
      v71 = v70 < 0.0;
      v72 = v70 >= 0.0;
      v73 = TSDMultiplyPointScalar(v36, v102, v92);
      v75 = TSDRotatePoint90Degrees(v72, v73, v74);
      v76 = TSDAddPoints(v104, v100, v75);
      v78 = v77;
      v79 = TSDMultiplyPointScalar(v45, v101, v92);
      v81 = TSDRotatePoint90Degrees(v71, v79, v80);
      v82 = TSDAddPoints(v97, v99, v81);
      v84 = v83;
      v85 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
      objc_msgSend(v85, "moveToPoint:", v76, v78);
      if (v57)
        objc_msgSend(v85, "lineToPoint:", TSDAddPoints(v58, v43, v90));
      objc_msgSend(v85, "lineToPoint:", v82, v84);
      objc_msgSend(v85, "lineToPoint:", v97, v99);
      objc_msgSend(v85, "lineToPoint:", v104, v100);
      objc_msgSend(v85, "closePath");
      objc_msgSend(v10, "addObject:", v85);
      ++v16;
      v13 = v18;
    }
    while (v5 != v16);
  }
  return v10;
}

- (id)bezierPathByOffsettingPath:(double)a3 joinStyle:(unint64_t)a4 withThreshold:(double)a5
{
  TSDBezierPath *v5;
  void *v10;
  id v11;
  uint64_t v12;
  CGRect v13;
  CGRect v14;

  v5 = self;
  if (a3 == 0.0)
    return v5;
  if (!-[TSDBezierPath isRectangular](self, "isRectangular"))
  {
    v10 = (void *)-[TSDBezierPath copy](v5, "copy");
    objc_msgSend(v10, "setLineWidth:", fabs(a3 + a3));
    objc_msgSend(v10, "setLineJoinStyle:", a4);
    v11 = +[TSDBezierPath outlineBezierPath:withThreshold:](TSDBezierPath, "outlineBezierPath:withThreshold:", v10, a5);
    if (a3 <= 0.0)
      v12 = objc_msgSend(v10, "subtractBezierPath:", v11);
    else
      v12 = objc_msgSend(v10, "uniteWithBezierPath:", v11);
    v5 = (TSDBezierPath *)v12;

    return v5;
  }
  -[TSDBezierPath bounds](v5, "bounds");
  v14 = CGRectInset(v13, -a3, -a3);
  if (a3 > 0.0 && a4 == 1)
    return +[TSDBezierPath bezierPathWithRoundedRect:cornerRadius:](TSDBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v14.origin.x, v14.origin.y, v14.size.width, v14.size.height, a3);
  else
    return +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", v14.origin.x, v14.origin.y, v14.size.width, v14.size.height);
}

- (id)outlineStroke
{
  return +[TSDBezierPath outlineBezierPath:](TSDBezierPath, "outlineBezierPath:", self);
}

- (id)uniteWithBezierPath:(id)a3
{
  return +[TSDBezierPath uniteBezierPaths:](TSDBezierPath, "uniteBezierPaths:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", self, a3, 0));
}

- (id)subtractBezierPath:(id)a3
{
  return +[TSDBezierPath subtractBezierPaths:](TSDBezierPath, "subtractBezierPaths:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", self, a3, 0));
}

- (id)intersectBezierPath:(id)a3
{
  return +[TSDBezierPath intersectBezierPaths:](TSDBezierPath, "intersectBezierPaths:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", self, a3, 0));
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  double v11[6];
  double v12[7];

  v12[6] = *(double *)MEMORY[0x24BDAC8D0];
  if (self == a3)
  {
LABEL_16:
    LOBYTE(v5) = 1;
    return v5;
  }
  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    v6 = -[TSDBezierPath elementCount](self, "elementCount");
    if (v6 != objc_msgSend(a3, "elementCount"))
    {
LABEL_17:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (v6 >= 1)
    {
      v7 = 0;
      while (1)
      {
        v8 = -[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v7, v12);
        if (v8 != objc_msgSend(a3, "elementAtIndex:associatedPoints:", v7, v11))
          goto LABEL_17;
        if (v8 >= 2)
        {
          if (v8 == 2)
          {
            v9 = 0;
            while (TSDNearlyEqualPoints(v12[v9], v12[v9 + 1], v11[v9], v11[v9 + 1]))
            {
              v9 += 2;
              if (v9 == 6)
                goto LABEL_14;
            }
            goto LABEL_17;
          }
        }
        else if (!TSDNearlyEqualPoints(v12[0], v12[1], v11[0], v11[1]))
        {
          goto LABEL_17;
        }
LABEL_14:
        ++v7;
        LOBYTE(v5) = 1;
        if (v7 == v6)
          return v5;
      }
    }
    goto LABEL_16;
  }
  return v5;
}

- (void)clearStroke:(CGContext *)a3
{
  CGFloat v5;
  CGFloat v6;
  double v7;
  double v8;
  CGRect v9;
  CGRect v10;

  CGContextSaveGState(a3);
  -[TSDBezierPath flatness](self, "flatness");
  CGContextSetFlatness(a3, v5);
  CGContextBeginPath(a3);
  -[TSDBezierPath addPathToContext:](self, "addPathToContext:", a3);
  -[TSDBezierPath lineWidth](self, "lineWidth");
  CGContextSetLineWidth(a3, v6);
  CGContextReplacePathWithStrokedPath(a3);
  CGContextClip(a3);
  CGContextBeginPath(a3);
  -[TSDBezierPath lineWidth](self, "lineWidth");
  v8 = v7;
  -[TSDBezierPath bounds](self, "bounds");
  v10 = CGRectInset(v9, -(v8 + 10.0), -(v8 + 10.0));
  CGContextClearRect(a3, v10);
  CGContextRestoreGState(a3);
}

- (id)pathByWobblingByUpTo:(double)a3 subdivisions:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  unint64_t v26;
  unsigned int v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  float v35;
  unint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v7 = (id)-[TSDBezierPath copy](self, "copy");
  objc_msgSend(v7, "removeAllPoints");
  v45 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v46 = *MEMORY[0x24BDBEFB0];
  v8 = -[TSDBezierPath elementCount](self, "elementCount");
  if (v8 >= 1)
  {
    v9 = v8;
    v10 = 0;
    v11 = a3;
    v12 = v11;
    do
    {
      switch(-[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v10, &v47))
      {
        case 0uLL:
          v13 = v47;
          v14 = v48;
          TSURandom();
          v16 = v13 + (v15 + -0.5) * v12;
          TSURandom();
          v45 = v14 + (v17 + -0.5) * v12;
          v46 = v16;
          objc_msgSend(v7, "moveToPoint:", v16);
          break;
        case 1uLL:
          v18 = 0;
          v19 = v47;
          v20 = v48;
          goto LABEL_8;
        case 2uLL:
          v21 = v51;
          v22 = v52;
          TSURandom();
          v24 = v21 + (v23 + -0.5) * v12;
          TSURandom();
          objc_msgSend(v7, "curveToPoint:controlPoint1:controlPoint2:", v24, v22 + (v25 + -0.5) * v12, v47, v48, v49, v50);
          break;
        case 3uLL:
          v20 = v45;
          v19 = v46;
          v47 = v46;
          v48 = v45;
          v18 = 1;
LABEL_8:
          v26 = 0;
          v27 = 1;
          do
          {
            objc_msgSend(v7, "currentPoint");
            v29 = v28;
            v31 = v30;
            v32 = TSDSubtractPoints(v19, v20, v28);
            v34 = v33;
            v35 = 1.0;
            v36 = a4 - v26;
            if (v36)
            {
              TSURandom();
              *(float *)&v37 = v37 + 0.5;
              v35 = fminf((float)(1.0 / (float)v36) * *(float *)&v37, 1.0);
            }
            v38 = v35;
            v39 = v29 + v32 * v38;
            v40 = v31 + v34 * v38;
            TSURandom();
            v42 = v39 + (v41 + -0.5) * v12;
            TSURandom();
            objc_msgSend(v7, "lineToPoint:", v42, v40 + (v43 + -0.5) * v12);
            v26 = v27++;
          }
          while (v26 <= a4);
          if (v18)
            objc_msgSend(v7, "closePath");
          break;
        default:
          break;
      }
      ++v10;
    }
    while (v10 != v9);
  }
  return v7;
}

- (BOOL)isOpen
{
  uint64_t v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  double v9;
  double v10;
  BOOL result;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = -[TSDBezierPath elementCount](self, "elementCount");
  v5 = *MEMORY[0x24BDBEFB0];
  v4 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  if (v3 < 1)
  {
    v9 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v10 = *MEMORY[0x24BDBEFB0];
    return v4 != v9 || v10 != v5;
  }
  else
  {
    v6 = v3;
    v7 = 0;
    v8 = 0;
    v9 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v10 = *MEMORY[0x24BDBEFB0];
    while (2)
    {
      switch(-[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v7, &v12))
      {
        case 0uLL:
          v5 = v12;
          v9 = v13;
          if (!v8)
          {
            v10 = v12;
            v4 = v13;
          }
          ++v8;
          goto LABEL_9;
        case 1uLL:
          v5 = v12;
          v9 = v13;
          goto LABEL_9;
        case 2uLL:
          v5 = v14;
          v9 = v15;
          goto LABEL_9;
        case 3uLL:
          goto LABEL_11;
        default:
LABEL_9:
          if (v6 != ++v7)
            continue;
          if (v8 <= 1)
            return v4 != v9 || v10 != v5;
LABEL_11:
          result = 0;
          break;
      }
      break;
    }
  }
  return result;
}

- (BOOL)isLineSegment
{
  BOOL result;
  unint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9[2];
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  result = 0;
  if (-[TSDBezierPath elementCount](self, "elementCount") == 2
    && !-[TSDBezierPath elementAtIndex:](self, "elementAtIndex:", 0))
  {
    v4 = -[TSDBezierPath elementAtIndex:](self, "elementAtIndex:", 1);
    if (v4 == 1)
      return 1;
    if (v4 == 2)
    {
      -[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", 0, v9);
      -[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", 1, &v10);
      v5 = v10;
      v6 = v11;
      v7 = v12;
      v8 = v13;
      if (TSDNearlyCollinearPoints(v9[0], v9[1], v10, v11, v12, v13)
        && TSDNearlyCollinearPoints(v5, v6, v7, v8, v14, v15))
      {
        return 1;
      }
    }
  }
  return result;
}

- (BOOL)intersectsRect:(CGRect)a3 hasFill:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat MaxX;
  CGFloat v16;
  CGFloat MinX;
  uint64_t v18;
  id v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CGFloat v25;
  CGFloat v26;
  uint64_t v27;
  double v28;
  double v29;
  char v30;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat MinY;
  CGFloat v38;
  CGFloat MaxY;
  CGFloat v40;
  CGFloat v41;
  uint64_t v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v42 = *MEMORY[0x24BDAC8D0];
  if (-[TSDBezierPath elementCount](self, "elementCount") < 2)
  {
LABEL_2:
    LOBYTE(v10) = 0;
    return v10;
  }
  -[TSDBezierPath bounds](self, "bounds");
  v10 = TSDIntersectsRect(v11, v12, v13, v14, x, y, width, height);
  if (!v10)
    return v10;
  if (!v4)
  {
LABEL_8:
    v19 = -[TSDBezierPath bezierPathByFlatteningPath](self, "bezierPathByFlatteningPath");
    v20 = *MEMORY[0x24BDBEFB0];
    v21 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v22 = objc_msgSend(v19, "elementCount");
    if (v22 >= 1)
    {
      v23 = v22;
      v24 = 0;
      v25 = v21;
      v26 = v20;
      do
      {
        v27 = objc_msgSend(v19, "elementAtIndex:associatedPoints:", v24, &v34);
        switch(v27)
        {
          case 3:
            if ((TSDLineIntersectsRect(v26, v25, v20, v21, x, y, width, height) & 1) != 0)
              goto LABEL_19;
            break;
          case 1:
            v32 = v21;
            v33 = v20;
            v28 = v34;
            v29 = v35;
            v30 = TSDLineIntersectsRect(v26, v25, v34, v35, x, y, width, height);
            v26 = v28;
            v25 = v29;
            v21 = v32;
            v20 = v33;
            if ((v30 & 1) != 0)
              goto LABEL_19;
            break;
          case 0:
            v26 = v34;
            v25 = v35;
            v20 = v34;
            v21 = v35;
            break;
        }
        ++v24;
      }
      while (v23 != v24);
    }
    goto LABEL_2;
  }
  v34 = x;
  v35 = y;
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  MaxX = CGRectGetMaxX(v43);
  v44.origin.x = x;
  v44.origin.y = y;
  v44.size.width = width;
  v44.size.height = height;
  v36 = MaxX;
  MinY = CGRectGetMinY(v44);
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  v16 = CGRectGetMaxX(v45);
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  v38 = v16;
  MaxY = CGRectGetMaxY(v46);
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  MinX = CGRectGetMinX(v47);
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  v18 = 0;
  v40 = MinX;
  v41 = CGRectGetMaxY(v48);
  while (!-[TSDBezierPath containsPoint:](self, "containsPoint:", *(double *)((char *)&v34 + v18), *(double *)((char *)&v34 + v18 + 8)))
  {
    v18 += 16;
    if (v18 == 64)
      goto LABEL_8;
  }
LABEL_19:
  LOBYTE(v10) = 1;
  return v10;
}

- (void)addPathToContext:(CGContext *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = -[TSDBezierPath elementCount](self, "elementCount");
  if (v5 >= 1)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      switch(-[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", i, &v8))
      {
        case 0uLL:
          CGContextMoveToPoint(a3, v8, v9);
          break;
        case 1uLL:
          CGContextAddLineToPoint(a3, v8, v9);
          break;
        case 2uLL:
          CGContextAddCurveToPoint(a3, v8, v9, v10, v11, v12, v13);
          break;
        case 3uLL:
          CGContextClosePath(a3);
          break;
        default:
          continue;
      }
    }
  }
}

- (CGPoint)roundPoint:(CGPoint)a3 inContext:(CGContext *)a4 strokeWidth:(int)a5
{
  char v5;
  CGPoint v7;
  double v8;
  double v9;
  float y;
  float x;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint v16;
  CGPoint result;

  v5 = a5;
  v7 = CGContextConvertPointToDeviceSpace(a4, a3);
  v8 = TSDRoundedPoint();
  if ((v5 & 1) != 0)
  {
    x = v7.x;
    if (v8 - x <= 0.0)
      v12 = 0.5;
    else
      v12 = -0.5;
    v8 = v8 + v12;
    y = v7.y;
    if (v9 - y <= 0.0)
      v13 = 0.5;
    else
      v13 = -0.5;
    v9 = v9 + v13;
  }
  v16 = CGContextConvertPointToUserSpace(a4, *(CGPoint *)&v8);
  v15 = v16.y;
  v14 = v16.x;
  result.y = v15;
  result.x = v14;
  return result;
}

- (id)p_aliasedPathInContext:(CGContext *)a3 viewScale:(float)a4 effectiveStrokeWidth:(float)a5
{
  uint64_t v9;
  double v10;
  id v11;
  uint64_t v13;
  int v14;
  uint64_t v15;
  double v16;
  double v17;
  int v18;
  CGFloat *p_c;
  double a;
  double b;
  double c;
  double d;
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
  _BOOL4 v35;
  _BOOL4 v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double y;
  double x;
  double v44;
  double v45;
  double v46;
  double v47;
  double *v48;
  double v49;
  _BOOL4 v50;
  double v51;
  double v52;
  _BOOL4 v53;
  int v54;
  int v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CGPoint v62;
  double v63;
  CGFloat v64;
  CGPoint v65;
  double v66;
  double v67;
  double v68;
  double v69;
  _BOOL4 v70;
  int v71;
  uint64_t v72;
  int v73;
  int v74;
  int v75;
  uint64_t v76;
  CGPoint v77;
  CGAffineTransform v78;
  double v79;
  uint64_t v80;
  double v81;
  double v82;
  double v83;
  uint64_t v84;
  CGAffineTransform v85;
  __int128 v86;
  uint64_t v87;
  CGPoint v88;
  CGPoint v89;

  v87 = *MEMORY[0x24BDAC8D0];
  v9 = -[TSDBezierPath elementCount](self, "elementCount");
  TSURound();
  if (!v9)
    return self;
  v71 = (int)v10;
  if (vabds_f32((float)(int)v10, a5) > 0.1)
    return self;
  if (a3)
  {
    memset(&v85, 0, sizeof(v85));
    CGContextGetUserSpaceToDeviceSpaceTransform(&v85, a3);
    v78 = v85;
    if (TSDIsTransformAxisAligned(&v78.a))
    {
      v70 = fabs(v85.a) < fabs(v85.b);
      goto LABEL_9;
    }
    return self;
  }
  v70 = 0;
LABEL_9:
  v11 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
  if (v9 >= 1)
  {
    v13 = 0;
    v76 = 0;
    v73 = 0;
    v74 = 0;
    v14 = 0;
    v72 = 0;
    v15 = 0;
    v69 = a4;
    v16 = (float)(1.0 / a4);
    v17 = 0.5;
    while (2)
    {
      v18 = 0;
      switch(-[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v13, &v85.c, *(_QWORD *)&v69))
      {
        case 0uLL:
          objc_msgSend(v11, "moveToPoint:", v85.c, v85.d);
          v73 = 0;
          v74 = 0;
          v76 = 0;
          v72 = objc_msgSend(v11, "elementCount") - 1;
          v14 = 1;
          p_c = &v85.c;
          v15 = v13;
          goto LABEL_45;
        case 1uLL:
          goto LABEL_18;
        case 2uLL:
          a = v85.a;
          b = v85.b;
          c = v85.c;
          d = v85.d;
          if (TSDNearlyEqualPoints(v85.a, v85.b, v85.c, v85.d)
            && TSDNearlyEqualPoints(a, b, v85.tx, v85.ty)
            && TSDNearlyEqualPoints(a, b, *(double *)&v86, *((double *)&v86 + 1)))
          {
            goto LABEL_46;
          }
          objc_msgSend(v11, "currentPoint");
          v26 = TSDSubtractPoints(v24, v25, v85.a);
          v85.c = TSDAddPoints(c, d, v26);
          v85.d = v27;
          objc_msgSend(v11, "curveToPoint:controlPoint1:controlPoint2:", v86, v85.c, v27, v85.tx, v85.ty);
          v14 = 0;
          v76 = 0;
          p_c = (CGFloat *)&v86;
          goto LABEL_45;
        case 3uLL:
          -[TSDBezierPath elementAtIndex:associatedPoints:](self, "elementAtIndex:associatedPoints:", v15, &v85.c);
          v18 = 1;
LABEL_18:
          v75 = v14;
          v29 = v85.a;
          v28 = v85.b;
          v31 = v85.c;
          v30 = v85.d;
          v32 = fabs(TSDSubtractPoints(v85.a, v85.b, v85.c));
          v34 = fabs(v33);
          v35 = v34 > v32 + v16 * -0.01 && v32 < v16;
          v36 = v32 > v34 + v16 * -0.01 && v34 < v16;
          if (v36 || v35)
          {
            if (v36 && v35)
            {
              if ((v18 & (v74 | v73)) == 1)
              {
                objc_msgSend(v11, "elementAtIndex:associatedPoints:", v72, &v85.c);
              }
              else if (objc_msgSend(v11, "elementAtIndex:associatedPoints:", objc_msgSend(v11, "elementCount") - 1, &v85.c) == 2)
              {
                *(_OWORD *)&v85.c = v86;
              }
              v77 = *(CGPoint *)&v85.c;
              y = v85.d;
              x = v85.c;
            }
            else
            {
              if (a3)
              {
                v88.x = v29;
                v88.y = v28;
                *(_QWORD *)&v40 = *(_OWORD *)&CGContextConvertPointToDeviceSpace(a3, v88);
                *(_QWORD *)&v41 = *(_OWORD *)&CGContextConvertPointToDeviceSpace(a3, *(CGPoint *)&v85.c);
              }
              else
              {
                v40 = TSDMultiplyPointScalar(v29, v28, v69);
                v17 = 0.5;
                v41 = TSDMultiplyPointScalar(v31, v30, v69);
              }
              v49 = v41;
              if (vabdd_f64(v40, v41) < 0.1)
                v49 = v40;
              if (v70)
                v50 = v35;
              else
                v50 = v36;
              if ((v71 & 1) != 0)
              {
                if (v70)
                  v53 = v36;
                else
                  v53 = v35;
                v52 = v40 + v17;
                v51 = v49 + v17;
                if (v53)
                {
                  BYTE4(v76) = 1;
                  v55 = v74;
                  v54 = v75;
                }
                else
                {
                  if ((v76 & 0x100000000) == 0)
                    v52 = v40;
                  v55 = v74;
                  v54 = v18 & v74;
                  if ((v18 & v74) == 0)
                    v51 = v49;
                }
                v74 = v54 | v55;
                if (v50)
                {
                  v73 |= v75;
                  LOBYTE(v76) = 1;
                }
              }
              else
              {
                v51 = v49;
                v52 = v40;
              }
              v56 = TSDAliasRoundedPoint(v52);
              v58 = v57;
              v60 = TSDAliasRoundedPoint(v51);
              v61 = v59;
              v77.x = v60;
              v77.y = v59;
              if ((v76 & 0x100000000) != 0)
              {
                v56 = v56 + -0.5;
                v60 = v60 + -0.5;
                v77.x = v60;
              }
              if ((v76 & 1) != 0)
              {
                v58 = v58 + -0.5;
                v61 = v59 + -0.5;
                v77.y = v59 + -0.5;
              }
              if (a3)
              {
                v89.x = v56;
                v89.y = v58;
                v62 = CGContextConvertPointToUserSpace(a3, v89);
                x = v62.x;
                y = v62.y;
                v65 = CGContextConvertPointToUserSpace(a3, v77);
                v64 = v65.y;
                v63 = v65.x;
              }
              else
              {
                x = TSDMultiplyPointScalar(v56, v58, v16);
                y = v66;
                v63 = TSDMultiplyPointScalar(v60, v61, v16);
              }
              v17 = 0.5;
              v77.x = v63;
              v77.y = v64;
              if (v36)
              {
                if ((v75 & 1) == 0)
                {
                  objc_msgSend(v11, "currentPoint");
                  x = v67;
                }
                if (v13 + 1 < v9 && -[TSDBezierPath elementAtIndex:](self, "elementAtIndex:"))
                  v77.x = v85.c;
              }
              else if (v35)
              {
                if ((v75 & 1) == 0)
                {
                  objc_msgSend(v11, "currentPoint");
                  y = v68;
                }
                if (v13 + 1 < v9 && -[TSDBezierPath elementAtIndex:](self, "elementAtIndex:"))
                  v77.y = v85.d;
              }
            }
            if (objc_msgSend(v11, "elementAtIndex:associatedPoints:", objc_msgSend(v11, "elementCount") - 1, &v79) == 2)
            {
              v44 = v81;
              v45 = v82;
              v46 = TSDSubtractPoints(x, y, v83);
              v81 = TSDAddPoints(v44, v45, v46);
              v82 = v47;
              v83 = x;
              v48 = (double *)&v84;
            }
            else
            {
              v79 = x;
              v48 = (double *)&v80;
            }
            *v48 = y;
            objc_msgSend(v11, "setAssociatedPoints:atIndex:", &v79, objc_msgSend(v11, "elementCount") - 1);
            if (v18)
            {
              objc_msgSend(v11, "setAssociatedPoints:atIndex:", &v77, v72);
              v37 = v11;
LABEL_41:
              objc_msgSend(v37, "closePath");
              goto LABEL_44;
            }
            v39 = v77.y;
            v38 = v77.x;
            v37 = v11;
          }
          else
          {
            v37 = v11;
            if (v18)
              goto LABEL_41;
            v38 = v31;
            v39 = v30;
          }
          objc_msgSend(v37, "lineToPoint:", v38, v39);
LABEL_44:
          v14 = 0;
          p_c = &v85.c;
LABEL_45:
          *(_OWORD *)&v85.a = *(_OWORD *)p_c;
LABEL_46:
          if (v9 == ++v13)
            return v11;
          continue;
        default:
          goto LABEL_46;
      }
    }
  }
  return v11;
}

- (id)aliasedPathInContext:(CGContext *)a3 effectiveStrokeWidth:(float)a4
{
  double v4;
  double v5;

  *(float *)&v4 = a4;
  LODWORD(v5) = 1.0;
  return -[TSDBezierPath p_aliasedPathInContext:viewScale:effectiveStrokeWidth:](self, "p_aliasedPathInContext:viewScale:effectiveStrokeWidth:", a3, v5, v4);
}

- (id)aliasedPathWithViewScale:(float)a3 effectiveStrokeWidth:(float)a4
{
  return -[TSDBezierPath p_aliasedPathInContext:viewScale:effectiveStrokeWidth:](self, "p_aliasedPathInContext:viewScale:effectiveStrokeWidth:", 0);
}

+ (TSDBezierPath)bezierPathWithConvexHullOfPoints:(CGPoint *)a3 count:(unint64_t)a4
{
  TSDBezierPath *v6;
  TSDBezierPath *v7;
  double y;
  double x;
  CGFloat *p_y;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat *v16;
  unint64_t i;
  double v18;
  double v19;
  BOOL v21;
  double v22;
  double v23;
  BOOL v24;

  v6 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
  v7 = v6;
  x = a3->x;
  y = a3->y;
  if (a4)
  {
    p_y = &a3->y;
    v11 = a4;
    do
    {
      if (*(p_y - 1) < x)
      {
        y = *p_y;
        x = *(p_y - 1);
      }
      p_y += 2;
      --v11;
    }
    while (v11);
  }
  -[TSDBezierPath moveToPoint:](v6, "moveToPoint:", x, y);
  v12 = x;
  v13 = y;
  do
  {
    v14 = a3->x;
    v15 = a3->y;
    v16 = &a3->y;
    for (i = a4; i; --i)
    {
      v18 = *(v16 - 1);
      v19 = *v16;
      if (v18 != v12 || v19 != v13)
      {
        v21 = v14 == v12 && v15 == v13;
        if (v21
          || (v22 = (v15 - v13) * (v18 - v12), v23 = (v14 - v12) * (v19 - v13), v22 < v23)
          && vabdd_f64(v22, v23) >= 0.01)
        {
          v14 = *(v16 - 1);
          v15 = *v16;
        }
      }
      v16 += 2;
    }
    -[TSDBezierPath lineToPoint:](v7, "lineToPoint:", v14, v15);
    v24 = v14 == x && v15 == y;
    v12 = v14;
    v13 = v15;
  }
  while (!v24);
  -[TSDBezierPath lineToPoint:](v7, "lineToPoint:", x, y);
  -[TSDBezierPath closePath](v7, "closePath");
  return v7;
}

- (id)bezierPathByFittingCurve
{
  return -[TSDBezierPath bezierPathByFittingCurve:](self, "bezierPathByFittingCurve:", +[TSDCurveFitter curveFitter](TSDCurveFitter, "curveFitter"));
}

- (id)bezierPathByFittingCurve:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  int v11;
  uint64_t i;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = -[TSDBezierPath bezierPathByFlatteningPath](self, "bezierPathByFlatteningPath");
  v5 = objc_msgSend(v4, "elementCount");
  if (!v5)
    return v4;
  v6 = v5;
  v7 = *MEMORY[0x24BDBEFB0];
  v8 = *(_QWORD *)(MEMORY[0x24BDBEFB0] + 8);
  if ((objc_msgSend(v4, "isRectangular") & 1) != 0)
    return v4;
  v10 = malloc_type_calloc(v6, 0x10uLL, 0x1000040451B5BE8uLL);
  v9 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
  if (v6 >= 1)
  {
    v11 = 0;
    for (i = 0; i != v6; ++i)
    {
      v13 = objc_msgSend(v4, "elementAtIndex:associatedPoints:", i, &v17);
      switch(v13)
      {
        case 3:
          if (v11 >= 2)
          {
            v14 = &v10[2 * v11];
            *v14 = v7;
            v14[1] = v8;
            v15 = (void *)objc_msgSend(a3, "bezierPathFittingPointArray:count:", v10, (v11 + 1));
            objc_msgSend(v15, "closePath");
            objc_msgSend(v9, "appendBezierPath:", v15);
          }
          v11 = 0;
          break;
        case 1:
          *(_OWORD *)&v10[2 * v11++] = v17;
          break;
        case 0:
          if (v11 >= 2)
            objc_msgSend(v9, "appendBezierPath:", objc_msgSend(a3, "bezierPathFittingPointArray:count:", v10, v11));
          v8 = *((_QWORD *)&v17 + 1);
          v7 = v17;
          *v10 = v17;
          v10[1] = v8;
          v11 = 1;
          break;
      }
    }
    if (v11 >= 2)
      objc_msgSend(v9, "appendBezierPath:", objc_msgSend(a3, "bezierPathFittingPointArray:count:", v10, v11));
  }
  free(v10);
  return v9;
}

+ (id)uniteBezierPaths:(id)a3
{
  return (id)objc_msgSend(a1, "p_BOOLeanWithBezierPaths:operation:", a3, 0);
}

+ (id)intersectBezierPaths:(id)a3
{
  return (id)objc_msgSend(a1, "p_BOOLeanWithBezierPaths:operation:", a3, 1);
}

+ (id)subtractBezierPaths:(id)a3
{
  return (id)objc_msgSend(a1, "p_BOOLeanWithBezierPaths:operation:", a3, 2);
}

+ (id)excludeBezierPaths:(id)a3
{
  id v4;
  id v5;

  v4 = +[TSDBezierPath p_BOOLeanWithBezierPaths:operation:](TSDBezierPath, "p_BOOLeanWithBezierPaths:operation:", a3, 0);
  v5 = +[TSDBezierPath p_BOOLeanWithBezierPaths:operation:](TSDBezierPath, "p_BOOLeanWithBezierPaths:operation:", a3, 1);
  return +[TSDBezierPath p_BOOLeanWithBezierPaths:operation:](TSDBezierPath, "p_BOOLeanWithBezierPaths:operation:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v4, v5, 0), 2);
}

+ (id)appendBezierPaths:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
  v5 = (void *)objc_msgSend(a3, "objectEnumerator");
  v6 = objc_msgSend(v5, "nextObject");
  if (v6)
  {
    v7 = v6;
    do
    {
      objc_msgSend(v4, "appendBezierPath:", v7);
      v7 = objc_msgSend(v5, "nextObject");
    }
    while (v7);
  }
  return v4;
}

+ (id)outlineBezierPath:(id)a3
{
  return +[TSDBezierPath outlineBezierPath:withThreshold:](TSDBezierPath, "outlineBezierPath:withThreshold:", a3, -1.0);
}

+ (id)outlineBezierPath:(id)a3 withThreshold:(double)a4
{
  id v4;
  double v6;
  Path *v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  Shape *v13;
  Path *v14;
  Path *v15;
  double v16;
  float v17;
  double v18;
  float v19;
  double v20;
  Shape *v21;
  Path *v23[2];

  v4 = a3;
  v23[1] = *(Path **)MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "lineWidth", a4);
  if (v6 != 0.0)
  {
    v7 = (Path *)objc_msgSend(a1, "p_bezierToPath:", v4);
    v8 = objc_msgSend(v4, "lineJoinStyle");
    if (v8 == 1)
      v9 = 1;
    else
      v9 = 2;
    if (v8 == 2)
      v10 = 0;
    else
      v10 = v9;
    v11 = objc_msgSend(v4, "lineCapStyle");
    if (v11 == 2)
      v12 = 1;
    else
      v12 = 2 * (v11 == 1);
    v13 = (Shape *)operator new();
    Shape::Shape(v13);
    v14 = (Path *)operator new();
    Path::Path(v14);
    Path::SetBackData(v14, 0);
    v15 = (Path *)operator new();
    Path::Path(v15);
    Path::ConvertWithBackData(v7, 1.0);
    objc_msgSend(v4, "lineWidth");
    v17 = v16 * 0.5;
    objc_msgSend(v4, "miterLimit");
    v19 = v18;
    Path::Outline(v7, v14, v10, v12, v17, v19);
    objc_msgSend(v4, "lineWidth");
    *(float *)&v20 = v20 * 0.5;
    Path::Coalesce(v7, *(float *)&v20);
    v21 = (Shape *)operator new();
    Shape::Shape(v21);
    Path::ConvertWithBackData(v14, 1.0);
    Path::Fill(v14, (void **)v13, 0, 0, 1, 0);
    if (!Shape::ConvertToShape((void **)v21, (uint64_t)v13, 1, 0))
    {
      v23[0] = v14;
      Shape::ConvertToForme(v21, v15, 1, v23);
    }
    v4 = (id)objc_msgSend(a1, "p_pathToBezier:", v15);
    Path::~Path(v15);
    MEMORY[0x219A153B8]();
    if (v7)
    {
      Path::~Path(v7);
      MEMORY[0x219A153B8]();
    }
    Shape::~Shape(v13);
    MEMORY[0x219A153B8]();
    Shape::~Shape(v21);
    MEMORY[0x219A153B8]();
    Path::~Path(v14);
    MEMORY[0x219A153B8]();
  }
  return v4;
}

+ (id)outsideEdgeOfBezierPath:(id)a3
{
  Path *v4;
  Shape *v5;
  Shape *v6;
  Path *v7;
  id v8;
  Path *v10[2];

  v10[1] = *(Path **)MEMORY[0x24BDAC8D0];
  v4 = +[TSDBezierPath p_bezierToPath:](TSDBezierPath, "p_bezierToPath:");
  v5 = (Shape *)operator new();
  Shape::Shape(v5);
  v6 = (Shape *)operator new();
  Shape::Shape(v6);
  v7 = (Path *)operator new();
  Path::Path(v7);
  Path::ConvertWithBackData(v4, 1.0);
  Path::Fill(v4, (void **)v5, 0, 0, 1, 0);
  if (!Shape::ConvertToShape((void **)v6, (uint64_t)v5, objc_msgSend(a3, "windingRule") == 0, 0))
  {
    v10[0] = v4;
    Shape::ConvertToForme(v6, v7, 1, v10);
  }
  Shape::~Shape(v5);
  MEMORY[0x219A153B8]();
  Shape::~Shape(v6);
  MEMORY[0x219A153B8]();
  v8 = +[TSDBezierPath p_pathToBezier:](TSDBezierPath, "p_pathToBezier:", v7);
  Path::~Path(v7);
  MEMORY[0x219A153B8]();
  if (v4)
  {
    Path::~Path(v4);
    MEMORY[0x219A153B8]();
  }
  return v8;
}

+ (id)exteriorOfBezierPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  double v14;
  double *v15;
  double v17[2];
  double v18;
  _QWORD v19[4];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a3, "elementCount");
  v5 = v4 - 1;
  if (v4 >= 1)
  {
    v6 = v4;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 1;
    while (1)
    {
      v11 = v7 + 1;
      if (v5 == v7 || !objc_msgSend(a3, "elementAtIndex:", v7 + 1))
      {
        if (v10)
        {
          if (!v8)
            v8 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
          objc_msgSend(v8, "appendBezierPath:fromSegment:toSegment:", a3, v9, v7 + 1);
        }
        if (v11 < v5)
        {
          objc_msgSend(a3, "elementAtIndex:associatedPoints:", v7 + 1, v17);
          v12 = objc_msgSend(v8, "containsPoint:", v17[0], v17[1]) ^ 1;
          if ((v12 & 1) == 0)
          {
            v13 = objc_msgSend(a3, "elementAtIndex:associatedPoints:", v7 + 2, &v18);
            if (v13 == 2)
            {
              v14 = *(double *)&v19[3];
              v15 = (double *)v20;
LABEL_17:
              v12 = objc_msgSend(v8, "containsPoint:", v14, *v15) ^ 1;
            }
            else if (v13 == 1)
            {
              v14 = v18;
              v15 = (double *)v19;
              goto LABEL_17;
            }
          }
          v10 = v12 != 0;
          goto LABEL_19;
        }
        v10 = 0;
      }
      v11 = v9;
LABEL_19:
      ++v7;
      v9 = v11;
      if (v6 == v7)
        goto LABEL_22;
    }
  }
  v8 = 0;
LABEL_22:
  if (v8)
    return v8;
  else
    return a3;
}

+ (id)smoothBezierPath:(id)a3 withThreshold:(double)a4
{
  Path *v6;
  float v7;
  void *v8;

  v6 = (Path *)objc_msgSend(a1, "p_bezierToPath:", a3);
  v7 = a4;
  Path::Coalesce(v6, v7);
  v8 = (void *)objc_msgSend(a1, "p_pathToBezier:", v6);
  if (v6)
  {
    Path::~Path(v6);
    MEMORY[0x219A153B8]();
  }
  return v8;
}

+ (Path)p_bezierToPath:(id)a3
{
  Path *v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  float v12;
  float v13;
  double v14;
  double v15;
  float v16;
  float v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  double v23;
  double v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = (Path *)operator new();
  Path::Path(v4);
  v5 = *MEMORY[0x24BDBEFB0];
  v6 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v7 = objc_msgSend(a3, "elementCount");
  if (v7 >= 1)
  {
    v8 = v7;
    v9 = 0;
    v10 = v6;
    v11 = v5;
    while (1)
    {
      switch(objc_msgSend(a3, "elementAtIndex:associatedPoints:", v9, &v34))
      {
        case 0:
          v12 = v34;
          v13 = v35;
          Path::MoveTo(v4, v12, v13);
          v11 = v34;
          v10 = v35;
          v5 = v34;
          v6 = v35;
          goto LABEL_17;
        case 1:
          v14 = v34;
          v15 = v35;
          if (!TSDNearlyEqualPoints(v5, v6, v34, v35))
          {
            v16 = v14;
            v17 = v15;
            Path::LineTo(v4, v16, v17);
            v5 = v34;
            v6 = v35;
          }
          goto LABEL_17;
        case 2:
          v32 = v11;
          v33 = v10;
          v19 = v34;
          v18 = v35;
          if (!TSDNearlyEqualPoints(v5, v6, v34, v35))
          {
            v24 = v38;
            v23 = v39;
            v21 = v36;
            v20 = v37;
LABEL_16:
            v25 = v24;
            v26 = v23;
            v27 = (v19 - v5) * 3.0;
            v28 = (v18 - v6) * 3.0;
            v29 = (v24 - v21) * 3.0;
            v30 = (v23 - v20) * 3.0;
            Path::CubicTo(v4, v25, v26, v27, v28, v29, v30);
            v11 = v32;
            v10 = v33;
            v5 = v38;
            v6 = v39;
            goto LABEL_17;
          }
          v21 = v36;
          v20 = v37;
          v22 = TSDNearlyEqualPoints(v5, v6, v36, v37);
          v24 = v38;
          v23 = v39;
          if (!v22 || !TSDNearlyEqualPoints(v5, v6, v38, v39))
            goto LABEL_16;
          v11 = v32;
          v10 = v33;
LABEL_17:
          if (v8 == ++v9)
            return v4;
          break;
        case 3:
          if (TSDNearlyEqualPoints(v5, v6, v11, v10) && objc_msgSend(a3, "elementAtIndex:", v9 - 1) == 1)
            --v4->var2;
          Path::Close(v4);
          goto LABEL_17;
        default:
          goto LABEL_17;
      }
    }
  }
  return v4;
}

+ (id)p_pathToBezier:(Path *)a3
{
  id v4;
  int var2;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  path_descr *var3;
  float *v11;
  float *v12;
  float *v13;
  double v14;
  double v15;
  float *v16;
  double v17;
  double v18;
  int v19;
  int v20;
  __double2 v21;
  double v22;
  double v23;
  double v24;
  double v25;
  float v26;
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
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;

  v4 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
  var2 = a3->var2;
  if (var2 >= 1)
  {
    v6 = 0;
    v8 = *MEMORY[0x24BDBEFB0];
    v7 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v9 = 44 * var2;
    while (1)
    {
      var3 = a3->var3;
      switch(*(_DWORD *)((char *)var3 + v6))
      {
        case 0:
          v11 = (float *)((char *)var3 + v6);
          v8 = v11[4];
          v7 = v11[5];
          objc_msgSend(v4, "moveToPoint:", v8, v7);
          goto LABEL_28;
        case 1:
          v12 = (float *)((char *)var3 + v6);
          v8 = v12[4];
          v7 = v12[5];
          objc_msgSend(v4, "lineToPoint:", v8, v7);
          goto LABEL_28;
        case 2:
          v13 = (float *)((char *)var3 + v6);
          v14 = v13[4];
          v15 = v13[5];
          objc_msgSend(v4, "curveToPoint:controlPoint1:controlPoint2:", v14, v15, v8 + v13[6] * 0.333333333, v7 + v13[7] * 0.333333333, v14 - v13[8] * 0.333333333, v15 - v13[9] * 0.333333333);
          v7 = v15;
          v8 = v14;
          goto LABEL_28;
        case 4:
          v16 = (float *)((char *)var3 + v6);
          v17 = v16[6];
          v18 = v16[7];
          v19 = *((unsigned __int8 *)v16 + 36);
          v20 = *((unsigned __int8 *)v16 + 37);
          v41 = v16[4];
          v42 = v8;
          v43 = v7;
          v40 = v16[5];
          v21 = __sincos_stret(v16[8]);
          v44 = v18;
          v45 = v17;
          v22 = TSDDotPoints(v41 - v8, v40 - v7, v21.__cosval, v21.__sinval) / v17;
          v23 = TSDCrossPoints(v41 - v8, v40 - v7, v21.__cosval, v21.__sinval) / v18;
          v24 = TSDDotPoints(v22, v23, v22, v23);
          v25 = 0.0;
          if (v24 < 4.0)
          {
            v26 = sqrt(1.0 / v24 + -0.25);
            v25 = v26;
          }
          v27 = v23 * v25;
          v28 = -(v22 * v25);
          v29 = -(v23 * v25 - v22 * -0.5);
          v30 = 3.14159265;
          if (v29 > -1.0)
          {
            v30 = 0.0;
            if (v29 < 1.0)
            {
              v30 = acos(v29);
              if (-(v28 - v23 * -0.5) < 0.0)
                v30 = 6.28318531 - v30;
            }
          }
          v31 = v22 * 0.5 - v23 * v25;
          v32 = 3.14159265;
          if (v31 > -1.0)
          {
            v32 = 0.0;
            if (v31 < 1.0)
            {
              v32 = acos(v31);
              if (v23 * 0.5 - v25 * -v22 < 0.0)
                v32 = 6.28318531 - v32;
            }
          }
          v33 = v28 * v44;
          v34 = TSDDotPoints(v27 * v45, v28 * v44, v21.__cosval, -v21.__sinval);
          v35 = TSDCrossPoints(v27 * v45, v33, v21.__cosval, -v21.__sinval);
          if (v20)
          {
            if (v19)
              goto LABEL_19;
          }
          else if (!v19)
          {
LABEL_19:
            v34 = -v34;
            v35 = -v35;
            v36 = v30 + 3.14159265;
            v30 = v32 + 3.14159265;
            if (v36 >= 6.28318531)
              v32 = v36 + -6.28318531;
            else
              v32 = v36;
            v37 = v42;
            v38 = v43;
            v7 = v40;
            v8 = v41;
            if (v30 >= 6.28318531)
              v30 = v30 + -6.28318531;
            goto LABEL_27;
          }
          v37 = v42;
          v38 = v43;
          v7 = v40;
          v8 = v41;
LABEL_27:
          objc_msgSend(v4, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", v20 != 0, v34 + (v37 + v8) * 0.5, v35 + (v38 + v7) * 0.5, v45, v30 * 180.0 / 3.14159265, v32 * 180.0 / 3.14159265);
LABEL_28:
          v6 += 44;
          if (v9 == v6)
            return v4;
          break;
        case 5:
          objc_msgSend(v4, "closePath");
          goto LABEL_28;
        default:
          goto LABEL_28;
      }
    }
  }
  return v4;
}

+ (CGRect)p_pathToBounds:(Path *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t var8;
  float *v8;
  char v9;
  CGRect result;

  var8 = a3->var8;
  if ((int)var8 >= 1)
  {
    v8 = (float *)(a3->var11 + 8);
    v9 = 1;
    do
    {
      if ((v9 & 1) != 0)
      {
        v5 = 0.0;
        v3 = *(v8 - 1);
        v4 = *v8;
        v6 = 0.0;
      }
      else
      {
        v3 = TSDGrowRectToPoint(v3, v4, v5, v6, *(v8 - 1), *v8);
      }
      v9 = 0;
      v8 += 3;
      --var8;
    }
    while (var8);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (id)p_BOOLeanWithBezierPaths:(id)a3 operation:(int)a4
{
  unint64_t v7;
  unint64_t v8;
  Path **v10;
  uint64_t v11;
  Shape *v12;
  Shape *v13;
  Shape *v14;
  Path *v15;
  uint64_t v16;
  Shape *v17;
  id v18;
  void *v19;
  uint64_t v20;
  Path *v21;
  void *v22;
  uint64_t v23;
  Path *v24;

  v7 = objc_msgSend(a3, "count");
  if (v7 >> 31)
  {
    v22 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v23 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDBezierPath(LivarotPrivate) p_BOOLeanWithBezierPaths:operation:]");
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBezierPathAdditions.mm"), 2453, CFSTR("Out-of-bounds type assignment failed"));
    return 0;
  }
  else
  {
    v8 = v7;
    if ((_DWORD)v7 == 1)
      return (id)objc_msgSend(a3, "lastObject");
    if (!(_DWORD)v7)
      return +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
    v10 = (Path **)malloc_type_malloc(8 * v7, 0x2004093837F09uLL);
    v11 = 0;
    do
    {
      v10[v11] = (Path *)objc_msgSend(a1, "p_bezierToPath:", objc_msgSend(a3, "objectAtIndex:", v11));
      ++v11;
    }
    while (v8 != v11);
    v12 = (Shape *)operator new();
    Shape::Shape(v12);
    v13 = (Shape *)operator new();
    Shape::Shape(v13);
    v14 = (Shape *)operator new();
    Shape::Shape(v14);
    v15 = (Path *)operator new();
    Path::Path(v15);
    v24 = v15;
    Path::ConvertWithBackData(*v10, 1.0);
    Path::Fill(*v10, (void **)v14, 0, 0, 1, 0);
    Shape::ConvertToShape((void **)v12, (uint64_t)v14, objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "windingRule") == 0, 0);
    if ((int)v8 < 2)
    {
      v17 = v14;
    }
    else
    {
      v16 = 1;
      do
      {
        v17 = v12;
        v12 = v14;
        Path::ConvertWithBackData(v10[v16], 1.0);
        Path::Fill(v10[v16], (void **)v14, v16, 0, 1, 0);
        Shape::ConvertToShape((void **)v13, (uint64_t)v14, objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v16), "windingRule") == 0, 0);
        Shape::Booleen((void **)v14, (uint64_t)v17, (uint64_t)v13, a4);
        ++v16;
        v14 = v17;
      }
      while (v8 != v16);
    }
    Shape::ConvertToForme(v12, v24, v8, v10);
    if (v24->var2 > 1)
      v18 = (id)objc_msgSend(a1, "p_pathToBezier:", v24);
    else
      v18 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
    v19 = v18;
    Path::~Path(v24);
    MEMORY[0x219A153B8]();
    if (v17)
    {
      Shape::~Shape(v17);
      MEMORY[0x219A153B8]();
    }
    if (v12)
    {
      Shape::~Shape(v12);
      MEMORY[0x219A153B8]();
    }
    Shape::~Shape(v13);
    MEMORY[0x219A153B8]();
    v20 = 0;
    do
    {
      v21 = v10[v20];
      if (v21)
      {
        Path::~Path(v21);
        MEMORY[0x219A153B8]();
      }
      ++v20;
    }
    while (v8 != v20);
    free(v10);
  }
  return v19;
}

+ (id)tracedPathForImage:(CGImage *)a3 alphaThreshold:(double)a4 pointSpacing:(double)a5
{
  size_t Width;
  size_t Height;
  id v8;
  CGImageAlphaInfo AlphaInfo;
  float v10;
  float v11;
  float v12;
  double v13;
  size_t v14;
  double v15;
  unsigned __int8 *v16;
  CGContext *v17;
  double v18;
  double v19;
  unsigned int v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  size_t v25;
  int v26;
  double v27;
  int v28;
  unint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  char *v35;
  unint64_t v36;
  unint64_t v37;
  double *v38;
  uint64_t v39;
  double *v40;
  double *v41;
  double *v42;
  __int128 v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double x;
  double y;
  unsigned int v52;
  unsigned int v53;
  unint64_t v54;
  double v55;
  double v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  char *v61;
  double *v62;
  double *v63;
  double *v64;
  double *v65;
  __int128 v66;
  double v68;
  float v69;
  CGAffineTransform v71;
  CGPoint v72;
  CGPoint v73;
  CGPoint v74;
  CGPoint v75;
  __int128 __p;
  double *v77;
  uint64_t *v78;
  _QWORD *v79;
  uint64_t v80;
  CGPoint v81;
  CGRect v82;

  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  v8 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
  AlphaInfo = CGImageGetAlphaInfo(a3);
  if (AlphaInfo <= kCGImageAlphaNoneSkipFirst && ((1 << AlphaInfo) & 0x61) != 0)
  {
    objc_msgSend(v8, "appendBezierPathWithRect:", TSDRectWithSize());
  }
  else
  {
    v10 = fminf((float)Width, 1024.0);
    v11 = fminf((float)Height, 1024.0) / (float)Height;
    if (v11 >= (float)(v10 / (float)Width))
      v12 = v10 / (float)Width;
    else
      v12 = v11;
    v13 = ceil((double)Width * v12) + 2.0;
    v14 = (unint64_t)v13;
    v15 = ceil((double)Height * v12) + 2.0;
    v16 = (unsigned __int8 *)malloc_type_calloc((unint64_t)(v15 * (double)(unint64_t)v13), 1uLL, 0x100004077774924uLL);
    v17 = CGBitmapContextCreate(v16, v14, (unint64_t)v15, 8uLL, v14, 0, 7u);
    CGContextSetBlendMode(v17, kCGBlendModeCopy);
    v82.size.width = v13 + -2.0;
    v82.size.height = v15 + -2.0;
    v82.origin.x = 1.0;
    v82.origin.y = 1.0;
    CGContextDrawImage(v17, v82, a3);
    CGContextFlush(v17);
    CGContextRelease(v17);
    TSUClamp();
    v19 = v15 + -1.0;
    v68 = v12;
    v69 = v12;
    if (v19 <= 1.0)
    {
      v79 = 0;
      v80 = 0;
      v77 = 0;
      v78 = (uint64_t *)&v79;
      __p = 0uLL;
    }
    else
    {
      v20 = (v18 * 255.0);
      v21 = v13 + -1.0;
      v22 = 1.0;
      do
      {
        if (v21 > 1.0)
        {
          v23 = 1;
          do
          {
            v16[(int)v22 * v14 + v23] = v16[(int)v22 * v14 + v23] >= v20;
            ++v23;
          }
          while (v21 > (double)v23);
        }
        v22 = v22 + 1.0;
      }
      while (v22 < v19);
      v79 = 0;
      v80 = 0;
      v78 = (uint64_t *)&v79;
      v24 = 1.0;
      do
      {
        if (v21 > 1.0)
        {
          v25 = (int)v24 * v14;
          v26 = v16[v25];
          v27 = 1.0;
          do
          {
            v28 = v26;
            v26 = v16[v25 + (int)v27];
            if (v28 != 1 && v26 == 1)
            {
              *(double *)&__p = v27 + 0.5;
              *((double *)&__p + 1) = v24 + 0.5;
              std::__tree<CGPoint>::__emplace_unique_key_args<CGPoint,CGPoint>(&v78, (double *)&__p, &__p);
            }
            v27 = v27 + 1.0;
          }
          while (v27 < v21);
        }
        v24 = v24 + 1.0;
      }
      while (v24 < v19);
      __p = 0uLL;
      v77 = 0;
      while (v80)
      {
        v75 = (CGPoint)*((_OWORD *)v78 + 2);
        std::__tree<CGPoint>::__erase_unique<CGPoint>(&v78, &v75.x);
        v29 = __p;
        *((_QWORD *)&__p + 1) = __p;
        v74 = v75;
        v31 = TSDFlooredPoint(v75.x);
        if (v16[(int)(v30 - 1.0) * v14 + (int)(v31 - 1.0)])
          v32 = v30 + 1.0;
        else
          v32 = v30;
        v33 = v31 + -1.0;
        v34 = v32 + -1.0;
        if (v29 >= (unint64_t)v77)
        {
          v36 = 0x5555555555555556 * ((uint64_t)((uint64_t)v77 - v29) >> 3);
          if (v36 <= 1)
            v36 = 1;
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v77 - v29) >> 3) >= 0x555555555555555)
            v37 = 0xAAAAAAAAAAAAAAALL;
          else
            v37 = v36;
          v38 = (double *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>((uint64_t)&v77, v37);
          *v38 = v33;
          v38[1] = v34;
          *((_QWORD *)v38 + 2) = 8;
          v40 = (double *)*((_QWORD *)&__p + 1);
          v41 = (double *)__p;
          v42 = v38;
          if (*((_QWORD *)&__p + 1) != (_QWORD)__p)
          {
            do
            {
              v43 = *(_OWORD *)(v40 - 3);
              *(v42 - 1) = *(v40 - 1);
              *(_OWORD *)(v42 - 3) = v43;
              v42 -= 3;
              v40 -= 3;
            }
            while (v40 != v41);
            v40 = (double *)__p;
          }
          v35 = (char *)(v38 + 3);
          *(_QWORD *)&__p = v42;
          *((_QWORD *)&__p + 1) = v38 + 3;
          v77 = &v38[3 * v39];
          if (v40)
            operator delete(v40);
        }
        else
        {
          *(double *)v29 = v33;
          *(double *)(v29 + 8) = v34;
          v35 = (char *)(v29 + 24);
          *(_QWORD *)(v29 + 16) = 8;
        }
        *((_QWORD *)&__p + 1) = v35;
        v44 = v32;
        v45 = v31;
        do
        {
          v81.x = v45;
          v81.y = v44;
          nextPivotAndBlackVectors(v74, v81, &v73, &v72);
          v46 = v74.x + v73.x;
          v47 = v74.y + v73.y;
          v48 = TSDFlooredPoint(v74.x + v73.x);
          if (v16[(int)v49 * v14 + (int)v48])
          {
            v74.x = v46;
            v74.y = v47;
            std::__tree<CGPoint>::__erase_unique<CGPoint>(&v78, &v74.x);
          }
          else
          {
            x = v72.x;
            y = v72.y;
            v52 = directionForVector(v72);
            v53 = v52;
            v54 = *((_QWORD *)&__p + 1);
            if (*((_QWORD *)&__p + 1) != (_QWORD)__p && *(_DWORD *)(*((_QWORD *)&__p + 1) - 8) == v52)
            {
              v54 = *((_QWORD *)&__p + 1) - 24;
              *((_QWORD *)&__p + 1) -= 24;
            }
            v45 = v45 + x;
            v44 = v44 + y;
            v55 = v45 + -1.0;
            v56 = v44 + -1.0;
            if (v54 >= (unint64_t)v77)
            {
              v58 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v54 - __p) >> 3);
              v59 = v58 + 1;
              if (v58 + 1 > 0xAAAAAAAAAAAAAAALL)
                abort();
              if (0x5555555555555556 * ((uint64_t)((uint64_t)v77 - __p) >> 3) > v59)
                v59 = 0x5555555555555556 * ((uint64_t)((uint64_t)v77 - __p) >> 3);
              if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v77 - __p) >> 3) >= 0x555555555555555)
                v60 = 0xAAAAAAAAAAAAAAALL;
              else
                v60 = v59;
              if (v60)
                v61 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>((uint64_t)&v77, v60);
              else
                v61 = 0;
              v62 = (double *)&v61[24 * v58];
              *v62 = v55;
              v62[1] = v56;
              *((_DWORD *)v62 + 4) = v53;
              *((_DWORD *)v62 + 5) = 0;
              v63 = (double *)*((_QWORD *)&__p + 1);
              v64 = (double *)__p;
              v65 = v62;
              if (*((_QWORD *)&__p + 1) != (_QWORD)__p)
              {
                do
                {
                  v66 = *(_OWORD *)(v63 - 3);
                  *(v65 - 1) = *(v63 - 1);
                  *(_OWORD *)(v65 - 3) = v66;
                  v65 -= 3;
                  v63 -= 3;
                }
                while (v63 != v64);
                v63 = (double *)__p;
              }
              v57 = (unint64_t)(v62 + 3);
              *(_QWORD *)&__p = v65;
              *((_QWORD *)&__p + 1) = v62 + 3;
              v77 = (double *)&v61[24 * v60];
              if (v63)
                operator delete(v63);
            }
            else
            {
              *(double *)v54 = v55;
              *(double *)(v54 + 8) = v56;
              v57 = v54 + 24;
              *(_QWORD *)(v54 + 16) = v52;
            }
            *((_QWORD *)&__p + 1) = v57;
          }
        }
        while (v31 != v45 || v32 != v44);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&__p + 1) - __p) >> 3) >= 2)
          buildSimplifiedPathFromPoints(v8, (__int128 **)&__p, a5);
      }
    }
    free(v16);
    if (v69 != 1.0)
    {
      CGAffineTransformMakeScale(&v71, 1.0 / v68, 1.0 / v68);
      objc_msgSend(v8, "transformUsingAffineTransform:", &v71);
    }
    if ((_QWORD)__p)
    {
      *((_QWORD *)&__p + 1) = __p;
      operator delete((void *)__p);
    }
    std::__tree<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::__map_value_compare<std::pair<unsigned short,EQKit::Config::Operator::Form>,std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::less<std::pair<unsigned short,EQKit::Config::Operator::Form>>,true>,std::allocator<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>>>::destroy((uint64_t)&v78, v79);
  }
  if (objc_msgSend(v8, "elementCount") <= 0)
    return 0;
  else
    return v8;
}

+ (id)tracedPathForInstantAlphaBinaryBitmap:(id)a3 pointSpacing:(double)a4
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  int v9;
  uint64_t v10;
  double v11;
  int v12;
  unint64_t v13;
  BOOL v14;
  uint64_t *v15;
  double *v16;
  unint64_t v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  double v24;
  double v25;
  char *v26;
  unint64_t v27;
  unint64_t v28;
  double *v29;
  uint64_t v30;
  double *v31;
  double *v32;
  double *v33;
  __int128 v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  BOOL v42;
  double x;
  double y;
  unsigned int v45;
  unsigned int v46;
  unint64_t v47;
  double v48;
  double v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  char *v54;
  double *v55;
  double *v56;
  double *v57;
  double *v58;
  __int128 v59;
  uint64_t v60;
  void *v61;
  id v64;
  CGPoint v65;
  CGPoint v66;
  CGPoint v67;
  CGPoint v68;
  __int128 __p;
  double *v70;
  uint64_t *v71;
  _QWORD *v72;
  uint64_t v73;
  CGPoint v74;

  v5 = *((_QWORD *)a3 + 1);
  v6 = *((_QWORD *)a3 + 2);
  v64 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
  v72 = 0;
  v73 = 0;
  v71 = (uint64_t *)&v72;
  if ((unint64_t)(v6 + 1) <= 1)
  {
    __p = 0uLL;
    v70 = 0;
    goto LABEL_77;
  }
  v7 = v5 + 1;
  v8 = 1.0;
  do
  {
    if (v7 >= 2)
    {
      v9 = 0;
      v10 = (uint64_t)v8;
      v11 = 1.0;
      do
      {
        if ((uint64_t)v11 >= 1)
        {
          v12 = 0;
          if (v10 < 1 || *((_QWORD *)a3 + 1) < (uint64_t)v11)
            goto LABEL_10;
          if (*((_QWORD *)a3 + 2) >= v10)
          {
            v13 = (0x80uLL >> (((uint64_t)v11 - 1) & 7)) & *(unsigned __int8 *)(*((_QWORD *)a3 + 4)
                                                                             + *((_QWORD *)a3 + 3) * ((uint64_t)v8 - 1)
                                                                             + ((unint64_t)((uint64_t)v11 - 1) >> 3));
            v12 = v13 == 0;
            if (v13)
              v14 = 1;
            else
              v14 = v9 == v12;
            if (!v14)
            {
              *(double *)&__p = v11 + 0.5;
              *((double *)&__p + 1) = v8 + 0.5;
              std::__tree<CGPoint>::__emplace_unique_key_args<CGPoint,CGPoint>(&v71, (double *)&__p, &__p);
              v12 = 1;
            }
            goto LABEL_10;
          }
        }
        v12 = 0;
LABEL_10:
        v11 = v11 + 1.0;
        v9 = v12;
      }
      while (v11 < (double)v7);
    }
    v8 = v8 + 1.0;
  }
  while (v8 < (double)(unint64_t)(v6 + 1));
  __p = 0uLL;
  v70 = 0;
  if (v73)
  {
    v15 = &TSDPointOne;
    do
    {
      v16 = (double *)v15;
      v68 = (CGPoint)*((_OWORD *)v71 + 2);
      std::__tree<CGPoint>::__erase_unique<CGPoint>(&v71, &v68.x);
      v17 = __p;
      *((_QWORD *)&__p + 1) = __p;
      v67 = v68;
      v19 = TSDFlooredPoint(v68.x);
      v20 = v18;
      v21 = (uint64_t)(v19 - *v16);
      if (v21 >= 1)
      {
        v22 = (uint64_t)(v18 - v16[1]);
        v23 = v22 < 1 || *((_QWORD *)a3 + 1) < v21;
        if (!v23
          && *((_QWORD *)a3 + 2) >= v22
          && (((unint64_t)*(unsigned __int8 *)(*((_QWORD *)a3 + 4)
                                                    + *((_QWORD *)a3 + 3) * (v22 - 1)
                                                    + ((unint64_t)(v21 - 1) >> 3)) << ((v21 - 1) & 7)) & 0x80) == 0)
        {
          v20 = v18 + 1.0;
        }
      }
      v24 = v19 + -1.0;
      v25 = v20 + -1.0;
      if (v17 >= (unint64_t)v70)
      {
        v27 = 0x5555555555555556 * ((uint64_t)((uint64_t)v70 - v17) >> 3);
        if (v27 <= 1)
          v27 = 1;
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v70 - v17) >> 3) >= 0x555555555555555)
          v28 = 0xAAAAAAAAAAAAAAALL;
        else
          v28 = v27;
        v29 = (double *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>((uint64_t)&v70, v28);
        v15 = (uint64_t *)v16;
        *v29 = v24;
        v29[1] = v25;
        *((_QWORD *)v29 + 2) = 8;
        v31 = (double *)*((_QWORD *)&__p + 1);
        v32 = (double *)__p;
        v33 = v29;
        if (*((_QWORD *)&__p + 1) != (_QWORD)__p)
        {
          do
          {
            v34 = *(_OWORD *)(v31 - 3);
            *(v33 - 1) = *(v31 - 1);
            *(_OWORD *)(v33 - 3) = v34;
            v33 -= 3;
            v31 -= 3;
          }
          while (v31 != v32);
          v31 = (double *)__p;
        }
        v26 = (char *)(v29 + 3);
        *(_QWORD *)&__p = v33;
        *((_QWORD *)&__p + 1) = v29 + 3;
        v70 = &v29[3 * v30];
        if (v31)
          operator delete(v31);
      }
      else
      {
        *(double *)v17 = v24;
        *(double *)(v17 + 8) = v25;
        v26 = (char *)(v17 + 24);
        *(_QWORD *)(v17 + 16) = 8;
        v15 = (uint64_t *)v16;
      }
      *((_QWORD *)&__p + 1) = v26;
      v35 = v20;
      v36 = v19;
      do
      {
        v74.x = v36;
        v74.y = v35;
        nextPivotAndBlackVectors(v67, v74, &v66, &v65);
        v37 = v67.x + v66.x;
        v38 = v67.y + v66.y;
        v39 = (uint64_t)TSDFlooredPoint(v67.x + v66.x);
        if (v39 < 1
          || ((v41 = (uint64_t)v40, (uint64_t)v40 >= 1) ? (v42 = *((_QWORD *)a3 + 1) < v39) : (v42 = 1),
              v42
           || *((_QWORD *)a3 + 2) < v41
           || (((unint64_t)*(unsigned __int8 *)(*((_QWORD *)a3 + 4)
                                                     + *((_QWORD *)a3 + 3) * (v41 - 1)
                                                     + ((unint64_t)(v39 - 1) >> 3)) << ((v39 - 1) & 7)) & 0x80) != 0))
        {
          x = v65.x;
          y = v65.y;
          v45 = directionForVector(v65);
          v46 = v45;
          v47 = *((_QWORD *)&__p + 1);
          if (*((_QWORD *)&__p + 1) != (_QWORD)__p && *(_DWORD *)(*((_QWORD *)&__p + 1) - 8) == v45)
          {
            v47 = *((_QWORD *)&__p + 1) - 24;
            *((_QWORD *)&__p + 1) -= 24;
          }
          v36 = v36 + x;
          v35 = v35 + y;
          v48 = v36 + -1.0;
          v49 = v35 + -1.0;
          if (v47 >= (unint64_t)v70)
          {
            v51 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v47 - __p) >> 3);
            v52 = v51 + 1;
            if (v51 + 1 > 0xAAAAAAAAAAAAAAALL)
              abort();
            if (0x5555555555555556 * ((uint64_t)((uint64_t)v70 - __p) >> 3) > v52)
              v52 = 0x5555555555555556 * ((uint64_t)((uint64_t)v70 - __p) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v70 - __p) >> 3) >= 0x555555555555555)
              v53 = 0xAAAAAAAAAAAAAAALL;
            else
              v53 = v52;
            if (v53)
              v54 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>((uint64_t)&v70, v53);
            else
              v54 = 0;
            v55 = (double *)&v54[24 * v51];
            *v55 = v48;
            v55[1] = v49;
            *((_DWORD *)v55 + 4) = v46;
            *((_DWORD *)v55 + 5) = 0;
            v56 = (double *)*((_QWORD *)&__p + 1);
            v57 = (double *)__p;
            v58 = v55;
            v15 = (uint64_t *)v16;
            if (*((_QWORD *)&__p + 1) != (_QWORD)__p)
            {
              do
              {
                v59 = *(_OWORD *)(v56 - 3);
                *(v58 - 1) = *(v56 - 1);
                *(_OWORD *)(v58 - 3) = v59;
                v58 -= 3;
                v56 -= 3;
              }
              while (v56 != v57);
              v56 = (double *)__p;
            }
            v50 = (unint64_t)(v55 + 3);
            *(_QWORD *)&__p = v58;
            *((_QWORD *)&__p + 1) = v55 + 3;
            v70 = (double *)&v54[24 * v53];
            if (v56)
              operator delete(v56);
          }
          else
          {
            *(double *)v47 = v48;
            *(double *)(v47 + 8) = v49;
            v50 = v47 + 24;
            *(_QWORD *)(v47 + 16) = v45;
            v15 = (uint64_t *)v16;
          }
          *((_QWORD *)&__p + 1) = v50;
        }
        else
        {
          v67.x = v37;
          v67.y = v38;
          std::__tree<CGPoint>::__erase_unique<CGPoint>(&v71, &v67.x);
        }
      }
      while (v19 != v36 || v20 != v35);
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&__p + 1) - __p) >> 3) >= 2)
        buildSimplifiedPathFromPoints(v64, (__int128 **)&__p, a4);
    }
    while (v73);
  }
LABEL_77:
  v60 = objc_msgSend(v64, "elementCount");
  if ((_QWORD)__p)
  {
    *((_QWORD *)&__p + 1) = __p;
    operator delete((void *)__p);
  }
  if (v60 <= 0)
    v61 = 0;
  else
    v61 = v64;
  std::__tree<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::__map_value_compare<std::pair<unsigned short,EQKit::Config::Operator::Form>,std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::less<std::pair<unsigned short,EQKit::Config::Operator::Form>>,true>,std::allocator<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>>>::destroy((uint64_t)&v71, v72);
  return v61;
}

@end
