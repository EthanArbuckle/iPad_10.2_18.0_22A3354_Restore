@implementation CRLConnectionLineLayout

- (id)quadraticCurve:(CGPoint)a3[3]
{
  double y;
  double x;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
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
  double v35;
  CGPoint v36;
  CGRect v37;

  x = a3->x;
  y = a3->y;
  v5 = a3[1].x;
  v6 = a3[1].y;
  v8 = a3[2].x;
  v7 = a3[2].y;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
  if (sub_1000600B4(x, y, v5, v6, v8, v7)
    && (v37.origin.x = sub_10005FDB0(x, y, v8), v36.x = v5, v36.y = v6, CGRectContainsPoint(v37, v36)))
  {
    objc_msgSend(v9, "moveToPoint:", x, y);
    objc_msgSend(v9, "lineToPoint:", v8, v7);
  }
  else
  {
    v10 = sub_1000603DC(x, y, 0.25);
    v11 = sub_1000603B8(v5, v6, v10);
    v13 = v12;
    v14 = sub_1000603DC(v8, v7, 0.25);
    v15 = sub_1000603B8(v11, v13, v14);
    v17 = sub_1000603DC(v15, v16, 2.0);
    v19 = v18;
    v20 = sub_1000603DC(x, y, 0.333333333);
    v35 = y;
    v21 = v7;
    v23 = v22;
    v24 = sub_1000603DC(v17, v19, 0.666666667);
    v26 = v25;
    v27 = sub_1000603D0(v20, v23, v24);
    v29 = v28;
    v30 = sub_1000603DC(v8, v21, 0.333333333);
    v31 = sub_1000603D0(v24, v26, v30);
    v33 = v32;
    objc_msgSend(v9, "moveToPoint:", x, v35);
    objc_msgSend(v9, "curveToPoint:controlPoint1:controlPoint2:", v8, v21, v27, v29, v31, v33);
  }
  return v9;
}

- (id)createConnectedPathFrom:(id)a3 to:(id)a4 withControlPoints:(CGPoint)a5[3] clipPath:(BOOL)a6
{
  _BOOL4 v6;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  _BOOL4 v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  char v29;

  v6 = a6;
  v10 = (unint64_t)a3;
  v11 = (unint64_t)a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineLayout quadraticCurve:](self, "quadraticCurve:", a5));
  v29 = 1;
  -[CRLConnectionLineAbstractLayout setTailClipT:](self, "setTailClipT:", 0.0);
  -[CRLConnectionLineAbstractLayout setHeadClipT:](self, "setHeadClipT:", 1.0);
  if (v10)
  {
    -[CRLConnectionLineAbstractLayout outsetFrom](self, "outsetFrom");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout clipPath:onLayout:outset:reversed:isValid:](self, "clipPath:onLayout:outset:reversed:isValid:", v12, v10, 0, &v29));
    v14 = v13;
    if (v13)
    {
      v15 = (uint64_t)objc_msgSend(v13, "segment");
      objc_msgSend(v14, "t");
      -[CRLConnectionLineAbstractLayout setTailClipT:](self, "setTailClipT:");
    }
    else
    {
      v15 = -1;
    }

    if (v11)
      goto LABEL_8;
LABEL_5:
    v16 = -1;
    goto LABEL_12;
  }
  v15 = -1;
  if (!v11)
    goto LABEL_5;
LABEL_8:
  -[CRLConnectionLineAbstractLayout outsetTo](self, "outsetTo");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout clipPath:onLayout:outset:reversed:isValid:](self, "clipPath:onLayout:outset:reversed:isValid:", v12, v11, 1, &v29));
  v18 = v17;
  if (v17)
  {
    v16 = (uint64_t)objc_msgSend(v17, "segment");
    objc_msgSend(v18, "t");
    -[CRLConnectionLineAbstractLayout setHeadClipT:](self, "setHeadClipT:");
  }
  else
  {
    v16 = -1;
  }

LABEL_12:
  -[CRLConnectionLineAbstractLayout i_setVisibleLine:](self, "i_setVisibleLine:", 1);
  if (v15 < 0 && v16 < 0)
  {
    v19 = v12;
  }
  else
  {
    v20 = 0;
    if ((v15 & 0x8000000000000000) == 0 && (v16 & 0x8000000000000000) == 0 && v15 >= v16)
    {
      if (v15 == v16)
      {
        -[CRLConnectionLineAbstractLayout tailClipT](self, "tailClipT");
        v22 = v21;
        -[CRLConnectionLineAbstractLayout headClipT](self, "headClipT");
        v20 = v22 >= v23;
      }
      else
      {
        v20 = 1;
      }
    }
    if (v10 && v11)
    {
      if (!v29)
        v20 = 1;
      if (v20)
      {
        v19 = v12;
        -[CRLConnectionLineAbstractLayout i_setVisibleLine:](self, "i_setVisibleLine:", 0);
        goto LABEL_38;
      }
    }
    else if (v10 | v11 && !v29)
    {
      v19 = v12;
      -[CRLConnectionLineAbstractLayout setTailClipT:](self, "setTailClipT:", 0.0);
      -[CRLConnectionLineAbstractLayout setHeadClipT:](self, "setHeadClipT:", 1.0);
      goto LABEL_38;
    }
    if (!-[CRLConnectionLineAbstractLayout clipTail](self, "clipTail"))
      -[CRLConnectionLineAbstractLayout setTailClipT:](self, "setTailClipT:", 0.0);
    if (!-[CRLConnectionLineAbstractLayout clipHead](self, "clipHead"))
      -[CRLConnectionLineAbstractLayout setHeadClipT:](self, "setHeadClipT:", 1.0);
    if (v6)
    {
      -[CRLConnectionLineAbstractLayout tailClipT](self, "tailClipT");
      v25 = v24;
      -[CRLConnectionLineAbstractLayout headClipT](self, "headClipT");
      v27 = v26;
    }
    else
    {
      v27 = 1.0;
      v25 = 0.0;
    }
    v19 = (id)objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPath](CRLBezierPath, "bezierPath"));
    objc_msgSend(v19, "appendBezierPath:fromSegment:t:toSegment:t:withoutMove:", v12, v15, v16, 0, v25, v27);
  }
LABEL_38:

  return v19;
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
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CGPoint result;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  v10 = a4.y;
  v11 = a4.x;
  v12 = a3.y;
  v13 = a3.x;
  v15 = objc_opt_class(CRLConnectionLinePathSource, a2);
  v16 = v15;
  v17 = *(CRLEditableBezierPathSource **)((char *)&self->super.super.mCachedEditableBezierPathSource + 3);
  if (v17)
  {
    v18 = sub_100221D0C(v15, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLayout shapeInfo](self, "shapeInfo"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "pathSource"));
    v22 = sub_100221D0C(v16, v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v22);

  }
  v23 = *(CRLPathSource **)((char *)&self->super.super.mCachedPathSource + 3);
  if (v23)
  {
    v24 = v23;
    v35 = 0u;
    v36 = 0u;
    v34 = 0u;
LABEL_7:
    objc_msgSend(v24, "transform");

    goto LABEL_8;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self, "info"));
  v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "geometry"));

  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  if (v24)
    goto LABEL_7;
LABEL_8:
  v32 = 0u;
  v33 = 0u;
  v31 = 0u;
  sub_10007979C(1, (uint64_t)&v31, v9, v8, x, y, v13, v12, v11, v10);
  objc_msgSend(v19, "getControlKnobPosition:", 12);
  v30 = vaddq_f64(v33, vmlaq_n_f64(vmulq_n_f64(v32, *((double *)&v36 + 1) + v26 * *((double *)&v35 + 1) + *((double *)&v34 + 1) * v27), v31, *(double *)&v36 + v26 * *(double *)&v35 + *(double *)&v34 * v27));

  v29 = v30.f64[1];
  v28 = v30.f64[0];
  result.y = v29;
  result.x = v28;
  return result;
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  void *v4;
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
  double v28;
  unsigned int v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  float64x2_t v38;
  double v39;
  uint64_t v40;
  double v41;
  double v42;
  CGPoint result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout connectedPathSource](self, "connectedPathSource", a3));
  objc_msgSend(v4, "getControlKnobPosition:", 10);
  v6 = v5;
  v8 = v7;
  v38.f64[0] = v5;
  v38.f64[1] = v7;
  objc_msgSend(v4, "getControlKnobPosition:", 12);
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "getControlKnobPosition:", 11);
  v14 = v13;
  v16 = v15;
  v41 = v13;
  v42 = v15;
  v17 = sub_1000603DC(v6, v8, 0.25);
  v18 = sub_1000603B8(v10, v12, v17);
  v20 = v19;
  v21 = sub_1000603DC(v14, v16, 0.25);
  v22 = sub_1000603B8(v18, v20, v21);
  v39 = sub_1000603DC(v22, v23, 2.0);
  v40 = v24;
  if (-[CRLConnectionLineAbstractLayout hasControlKnobsInStraightLine](self, "hasControlKnobsInStraightLine"))
  {
    -[CRLConnectionLineAbstractLayout tailClipT](self, "tailClipT");
    v26 = v25;
    -[CRLConnectionLineAbstractLayout headClipT](self, "headClipT");
    v28 = (v26 + v27) * 0.5;
  }
  else
  {
    v29 = -[CRLConnectionLineAbstractLayout i_visibleLine](self, "i_visibleLine");
    v28 = 0.5;
    if (v29)
    {
      -[CRLConnectionLineAbstractLayout tailClipT](self, "tailClipT", 0.5);
      v31 = v30;
      -[CRLConnectionLineAbstractLayout headClipT](self, "headClipT");
      v28 = fmax(v31, fmin(v32, 0.5));
    }
  }
  v33 = sub_1003133C8(&v38, v28);
  v35 = v34;

  v36 = v33;
  v37 = v35;
  result.y = v37;
  result.x = v36;
  return result;
}

- (void)dynamicallyMovedSmartShapeKnobTo:(CGPoint)a3 withTracker:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  float64x2_t v10;
  float64x2_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  void *v19;
  void *v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  float64x2_t v35;
  double y;
  float64x2_t v37;
  double x;
  float64x2_t v39;
  objc_super v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  float64x2_t v47;
  float64x2_t v48;
  CGPoint v49;
  float64x2_t v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  CGPoint v55;

  y = a3.y;
  x = a3.x;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "knob"));
  v7 = objc_msgSend(v6, "tag");

  if (v7 == (id)12)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalGeometry](self, "originalGeometry"));
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "transform");
      v10 = v51;
      v11 = v52;
      v35 = v53;
    }
    else
    {
      v11 = 0uLL;
      v52 = 0u;
      v53 = 0u;
      v10 = 0uLL;
      v35 = 0u;
      v51 = 0u;
    }
    v39 = vmlaq_n_f64(vmulq_n_f64(v11, y), v10, x);

    v49 = CGPointZero;
    v50 = (float64x2_t)v49;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineAbstractLayout i_originalPathSource](self, "i_originalPathSource"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bezierPath"));
    objc_msgSend(v13, "getStartPoint:andEndPoint:", &v50, &v49);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalPureGeometry](self, "originalPureGeometry"));
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "transform", *(_OWORD *)&v35);
      v16 = v46;
      v17 = v47;
      v18 = v48;
    }
    else
    {
      v18 = 0uLL;
      v47 = 0u;
      v48 = 0u;
      v46 = 0u;
      v16 = 0uLL;
      v17 = 0uLL;
    }
    v37 = vaddq_f64(v35, v39);
    v50 = vaddq_f64(v18, vmlaq_n_f64(vmulq_n_f64(v17, v50.f64[1]), v16, v50.f64[0]));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalPureGeometry](self, "originalPureGeometry"));
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "transform");
      v21 = v43;
      v22 = v44;
      v23 = v45;
    }
    else
    {
      v23 = 0uLL;
      v44 = 0u;
      v45 = 0u;
      v43 = 0u;
      v21 = 0uLL;
      v22 = 0uLL;
    }
    v49 = (CGPoint)vaddq_f64(v23, vmlaq_n_f64(vmulq_n_f64(v22, v49.y), v21, v49.x));

    v54 = v50;
    v55 = v49;
    v24 = v37.f64[1];
    v25 = sub_1003135C8(v54.f64, v37.f64[0], v37.f64[1]);
    v26 = sub_100061A8C(v54.f64[0], v54.f64[1], v55.x, v55.y, v25);
    v28 = sub_10006108C(v26, v27, v37.f64[0], v37.f64[1]);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "icc"));
    objc_msgSend(v29, "viewScale");
    v31 = (double)7 / v30;

    if (v28 < v31)
    {
      v37.f64[0] = sub_100061A8C(v54.f64[0], v54.f64[1], v55.x, v55.y, 0.5);
      v24 = v32;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout originalGeometry](self, "originalGeometry", *(_OWORD *)&v35));
    v34 = v33;
    if (v33)
      objc_msgSend(v33, "transform");
    else
      memset(&v41, 0, sizeof(v41));
    CGAffineTransformInvert(&v42, &v41);
    x = v42.tx + v24 * v42.c + v42.a * v37.f64[0];
    y = v42.ty + v24 * v42.d + v42.b * v37.f64[0];

  }
  v40.receiver = self;
  v40.super_class = (Class)CRLConnectionLineLayout;
  -[CRLConnectionLineAbstractLayout dynamicallyMovedSmartShapeKnobTo:withTracker:](&v40, "dynamicallyMovedSmartShapeKnobTo:withTracker:", v5, x, y);

}

@end
