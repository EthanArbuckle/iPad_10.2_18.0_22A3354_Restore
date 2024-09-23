@implementation THContainerRep

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (unint64_t)hitTestOptions
{
  return 5;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  int v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  CGFloat x;
  float64x2_t v17;
  double y;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  CGPoint v27;
  CGRect v28;

  x = a3.x;
  y = a3.y;
  if ((-[THContainerRep hitTestOptions](self, "hitTestOptions") & 1) != 0
    && (-[THContainerRep naturalBoundsForHitTesting](self, "naturalBoundsForHitTesting"),
        v27.x = x,
        v27.y = y,
        CGRectContainsPoint(v28, v27)))
  {
    LOBYTE(v4) = 1;
  }
  else if ((-[THContainerRep hitTestOptions](self, "hitTestOptions") & 4) != 0
         && (v24 = 0u,
             v25 = 0u,
             v22 = 0u,
             v23 = 0u,
             v5 = objc_msgSend(*(id *)&self->TSDContainerRep_opaque[OBJC_IVAR___TSDContainerRep_mChildReps], "reverseObjectEnumerator"), (v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16)) != 0))
  {
    v7 = v6;
    v4 = 0;
    v8 = *(_QWORD *)v23;
    v17 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&x, 0);
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(objc_msgSend(v10, "layout", *(_QWORD *)&v17.f64[0]), "geometry");
        if (v11)
        {
          objc_msgSend(v11, "inverseTransform");
          v12 = v19;
          v13 = v20;
          v14 = v21;
        }
        else
        {
          v20 = 0u;
          v21 = 0u;
          v14 = 0uLL;
          v12 = 0uLL;
          v13 = 0uLL;
          v19 = 0u;
        }
        v4 |= objc_msgSend(v10, "containsPoint:", vaddq_f64(v14, vmlaq_f64(vmulq_n_f64(v13, y), v17, v12)));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4 & 1;
}

- (BOOL)containsPoint:(CGPoint)a3 withSlop:(CGSize)a4
{
  double height;
  double width;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  int v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  id v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  double x;
  float64x2_t v27;
  double y;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  CGRect v37;
  CGRect v38;

  height = a4.height;
  width = a4.width;
  x = a3.x;
  y = a3.y;
  if ((-[THContainerRep hitTestOptions](self, "hitTestOptions") & 1) == 0)
    goto LABEL_20;
  v7 = TSDRectWithCenterAndSize(x);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[THContainerRep naturalBoundsForHitTesting](self, "naturalBoundsForHitTesting");
  v38.origin.x = v7;
  v38.origin.y = v9;
  v38.size.width = v11;
  v38.size.height = v13;
  if (CGRectIntersectsRect(v37, v38))
  {
    LOBYTE(v14) = 1;
  }
  else
  {
LABEL_20:
    if ((-[THContainerRep hitTestOptions](self, "hitTestOptions") & 4) != 0
      && (v34 = 0u,
          v35 = 0u,
          v32 = 0u,
          v33 = 0u,
          v15 = objc_msgSend(*(id *)&self->TSDContainerRep_opaque[OBJC_IVAR___TSDContainerRep_mChildReps], "reverseObjectEnumerator"), (v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16)) != 0))
    {
      v17 = v16;
      v14 = 0;
      v18 = *(_QWORD *)v33;
      v27 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&x, 0);
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          v21 = objc_msgSend(objc_msgSend(v20, "layout", *(_QWORD *)&v27.f64[0]), "geometry");
          if (v21)
          {
            objc_msgSend(v21, "inverseTransform");
            v22 = v29;
            v23 = v30;
            v24 = v31;
          }
          else
          {
            v30 = 0u;
            v31 = 0u;
            v24 = 0uLL;
            v22 = 0uLL;
            v23 = 0uLL;
            v29 = 0u;
          }
          v14 |= objc_msgSend(v20, "containsPoint:withSlop:", vaddq_f64(v24, vmlaq_f64(vmulq_n_f64(v23, y), v27, v22)), width, height);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v17);
    }
    else
    {
      LOBYTE(v14) = 0;
    }
  }
  return v14 & 1;
}

- (id)childRepsForHitTesting
{
  if ((-[THContainerRep hitTestOptions](self, "hitTestOptions") & 4) != 0)
    return -[THContainerRep childReps](self, "childReps");
  else
    return 0;
}

@end
