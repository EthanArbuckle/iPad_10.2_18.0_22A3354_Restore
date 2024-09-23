@implementation TSDContainerRep

+ (id)childrenFromLayoutInContainerRep:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v4 = objc_msgSend(a3, "childReps");
  v5 = objc_msgSend(objc_msgSend(a3, "layout"), "children");
  v6 = objc_msgSend(v5, "count");
  if (v6 == objc_msgSend(v4, "count"))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v28;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v5);
        v12 = *(id *)(*((_QWORD *)&v27 + 1) + 8 * v11);
        if (objc_msgSend(objc_msgSend(v4, "objectAtIndex:", v9 + v11), "layout") != v12)
          break;
        if (v8 == (id)++v11)
        {
          v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
          v9 += v11;
          if (v8)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      v13 = objc_msgSend(v5, "count");
      if (!v13)
        goto LABEL_27;
      v14 = v13;
      v15 = 0;
      while (objc_msgSend(objc_msgSend(v4, "objectAtIndex:", v15), "parentRep") == a3)
      {
        if (v14 == (id)++v15)
          goto LABEL_27;
      }
    }
  }
  v4 = +[NSMutableArray array](NSMutableArray, "array");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v5);
        v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v21 = objc_msgSend(objc_msgSend(a3, "canvas"), "repForLayout:", v20);
        if (v21)
          goto LABEL_24;
        v21 = objc_msgSend(objc_alloc((Class)objc_msgSend(v20, "repClassOverride")), "initWithLayout:canvas:", v20, objc_msgSend(a3, "canvas"));
        if ((objc_opt_respondsToSelector(objc_msgSend(objc_msgSend(a3, "canvas"), "delegate"), "canvas:willLayoutRep:") & 1) != 0)
          objc_msgSend(objc_msgSend(objc_msgSend(a3, "canvas"), "delegate"), "canvas:willLayoutRep:", objc_msgSend(a3, "canvas"), v21);
        if (v21)
        {
LABEL_24:
          objc_msgSend(v4, "addObject:", v21);

        }
        objc_msgSend(v21, "setParentRep:", a3);
      }
      v17 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v17);
  }
LABEL_27:
  objc_msgSend(v4, "makeObjectsPerformSelector:", "updateChildrenFromLayout");
  return v4;
}

+ (id)containerRep:(id)a3 hitRep:(CGPoint)a4 withGesture:(id)a5 passingTest:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  id v19;
  id v20;
  void *v21;
  double x;
  float64x2_t v24;
  double y;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  y = a4.y;
  x = a4.x;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = objc_msgSend(objc_msgSend(a3, "childRepsForHitTesting"), "reverseObjectEnumerator");
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    v24 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&x, 0);
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v15 = objc_msgSend(objc_msgSend(v14, "layout"), "geometry");
        if (v15)
        {
          objc_msgSend(v15, "inverseTransform");
          v16 = v26;
          v17 = v27;
          v18 = v28;
        }
        else
        {
          v27 = 0u;
          v28 = 0u;
          v18 = 0uLL;
          v16 = 0uLL;
          v17 = 0uLL;
          v26 = 0u;
        }
        v19 = objc_msgSend(v14, "hitRep:withGesture:passingTest:", a5, a6, vaddq_f64(v18, vmlaq_f64(vmulq_n_f64(v17, y), v24, v16)));
        if (v19)
          return v19;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v11)
        continue;
      break;
    }
  }
  v20 = objc_msgSend(a3, "hitRep:", x, y);
  v21 = v20;
  if (a6 && v20 && !(*((unsigned int (**)(id, id))a6 + 2))(a6, v20))
    return 0;
  return v21;
}

- (BOOL)shouldHitTestChildImageRep:(id)a3
{
  uint64_t v5;
  double v6;
  id v7;

  v5 = objc_opt_class(TSDContainerRep);
  *(_QWORD *)&v6 = TSUDynamicCast(v5, -[TSDContainerRep parentRep](self, "parentRep")).n128_u64[0];
  return objc_msgSend(v7, "shouldHitTestChildImageRep:", a3, v6);
}

@end
