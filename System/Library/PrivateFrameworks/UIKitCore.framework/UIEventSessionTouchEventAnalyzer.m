@implementation UIEventSessionTouchEventAnalyzer

- (UIEventSessionTouchEventAnalyzer)init
{
  UIEventSessionTouchEventAnalyzer *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIEventSessionTouchEventAnalyzer;
  v2 = -[UIEventSessionTouchEventAnalyzer init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)_MergedGlobals_1120;
    _MergedGlobals_1120 = (uint64_t)v3;

    v5 = (void *)qword_1ECD7EDC0;
    qword_1ECD7EDC0 = 0;

    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = (void *)qword_1ECD7EDC8;
    qword_1ECD7EDC8 = (uint64_t)v6;

  }
  return v2;
}

- (id)completeGesture:(id)a3
{
  id v3;
  _UIEventSessionTouchAction *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(_UIEventSessionTouchAction);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v3, "touchStatus", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v3, "touchStatus");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "windowSection");

        objc_msgSend(v3, "touchStatus");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_msgSend(v15, "tapDragState");
        if (v16 == 2)
        {
          v17 = 2;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v13 = 0;
  }
  v17 = 1;
LABEL_13:

  -[_UIEventSessionTouchAction setTapDragState:](v4, "setTapDragState:", v17);
  if (objc_msgSend(v3, "touchType") && objc_msgSend(v3, "trackpadFingerDownCount") >= 1)
  {
    -[_UIEventSessionTouchAction setNumFingers:](v4, "setNumFingers:", objc_msgSend(v3, "trackpadFingerDownCount"));
  }
  else
  {
    objc_msgSend(v3, "touchStatus");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIEventSessionTouchAction setNumFingers:](v4, "setNumFingers:", objc_msgSend(v18, "count"));

  }
  -[_UIEventSessionTouchAction setWindowSection:](v4, "setWindowSection:", v13);
  -[_UIEventSessionAction setSource:](v4, "setSource:", +[_UIEventSessionAction getUIEventSourceForUITouchType:](_UIEventSessionAction, "getUIEventSourceForUITouchType:", objc_msgSend(v3, "touchType")));

  return v4;
}

- (id)checkifGestureComplete:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "touchStatus", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        objc_msgSend(v4, "touchStatus");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "upDownState");

        if (v13 != 2)
        {

          v14 = 0;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[UIEventSessionTouchEventAnalyzer completeGesture:](self, "completeGesture:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v14;
}

+ (double)squaredDistanceBetweenPoint:(CGPoint)a3 andPoint:(CGPoint)a4
{
  return (a3.x - a4.x) * (a3.x - a4.x) + (a3.y - a4.y) * (a3.y - a4.y);
}

- (int64_t)determineWindowSectionWithLocationInWindow:(CGPoint)a3 withWindowBounds:(CGRect)a4
{
  double height;
  double y;
  void *v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;

  height = a4.size.height;
  y = a3.y;
  +[UIScreen mainScreen](UIScreen, "mainScreen", a3.x, a3.y, a4.origin.x, a4.origin.y, a4.size.width);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;

  if (height != v8)
    return 0;
  v9 = height / 3.0;
  v10 = 3;
  if (y < v9 + v9)
    v10 = 2;
  if (y < v9)
    return 1;
  else
    return v10;
}

- (id)didTouchWithID:(id)a3 withPhase:(int64_t)a4 withType:(int64_t)a5 withLocationInWindow:(CGPoint)a6 withWindowBounds:(CGRect)a7 withTrackpadFingerDownCount:(int64_t)a8
{
  double height;
  double width;
  double y;
  double x;
  double v13;
  double v14;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  UIEventSessionTouchEventDetail *v59;
  void *v60;
  UIEventSessionTouchEvent *v61;
  void *v62;
  void *v63;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v13 = a6.y;
  v14 = a6.x;
  v85 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a4 != 1)
  {
    if (!a4)
    {
      objc_msgSend((id)_MergedGlobals_1120, "objectForKeyedSubscript:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        if (qword_1ECD7EDC0
          && objc_msgSend((id)qword_1ECD7EDC0, "touchType") != a5
          && objc_msgSend((id)qword_1ECD7EDC0, "trackpadFingerDownCount") != a8)
        {
          -[UIEventSessionTouchEventAnalyzer checkifGestureComplete:](self, "checkifGestureComplete:", qword_1ECD7EDC0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v67 = v21;
            objc_msgSend(v19, "addObject:", v21);
            v80 = 0u;
            v81 = 0u;
            v78 = 0u;
            v79 = 0u;
            objc_msgSend((id)qword_1ECD7EDC0, "touchStatus");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v79;
              do
              {
                for (i = 0; i != v24; ++i)
                {
                  if (*(_QWORD *)v79 != v25)
                    objc_enumerationMutation(v22);
                  objc_msgSend((id)_MergedGlobals_1120, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i));
                }
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
              }
              while (v24);
            }

            v21 = v67;
          }
          else
          {
            objc_msgSend((id)qword_1ECD7EDC8, "addObject:", qword_1ECD7EDC0);
          }

        }
        v59 = objc_alloc_init(UIEventSessionTouchEventDetail);
        -[UIEventSessionTouchEventDetail setUpDownState:](v59, "setUpDownState:", 1);
        -[UIEventSessionTouchEventDetail setLastLocation:](v59, "setLastLocation:", v14, v13);
        v60 = (void *)qword_1ECD7EDC0;
        if (!qword_1ECD7EDC0)
        {
          v61 = -[UIEventSessionTouchEvent initWithTouchType:withTrackpadFingerDownCount:]([UIEventSessionTouchEvent alloc], "initWithTouchType:withTrackpadFingerDownCount:", a5, a8);
          v62 = (void *)qword_1ECD7EDC0;
          qword_1ECD7EDC0 = (uint64_t)v61;

          v60 = (void *)qword_1ECD7EDC0;
        }
        objc_msgSend(v60, "touchStatus");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setObject:forKeyedSubscript:", v59, v18);

        objc_msgSend((id)_MergedGlobals_1120, "setObject:forKeyedSubscript:", qword_1ECD7EDC0, v18);
      }
      goto LABEL_60;
    }
    if ((unint64_t)(a4 - 3) > 1)
      goto LABEL_60;
    objc_msgSend((id)_MergedGlobals_1120, "objectForKeyedSubscript:", v18);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v35)
      goto LABEL_60;
    v36 = v35;
    objc_msgSend(v35, "touchStatus");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKeyedSubscript:", v18);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "setUpDownState:", 2);
    objc_msgSend(v38, "setWindowSection:", -[UIEventSessionTouchEventAnalyzer determineWindowSectionWithLocationInWindow:withWindowBounds:](self, "determineWindowSectionWithLocationInWindow:withWindowBounds:", v14, v13, x, y, width, height));
    objc_msgSend(v38, "dragDistanceSquared");
    if (v39 <= 10.0)
    {
      objc_msgSend(v38, "lastLocation");
      +[UIEventSessionTouchEventAnalyzer squaredDistanceBetweenPoint:andPoint:](UIEventSessionTouchEventAnalyzer, "squaredDistanceBetweenPoint:andPoint:");
      v41 = v40;
      objc_msgSend(v38, "dragDistanceSquared");
      objc_msgSend(v38, "setDragDistanceSquared:", v41 + v42);
    }
    objc_msgSend(v38, "dragDistanceSquared");
    if (v43 <= 10.0)
      v44 = 1;
    else
      v44 = 2;
    objc_msgSend(v38, "setTapDragState:", v44);
    if ((objc_msgSend((id)qword_1ECD7EDC0, "containsTouchID:", v18) & 1) != 0)
    {
      -[UIEventSessionTouchEventAnalyzer checkifGestureComplete:](self, "checkifGestureComplete:", qword_1ECD7EDC0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (v45)
      {
        v68 = v38;
        objc_msgSend(v19, "addObject:", v45);
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        objc_msgSend((id)qword_1ECD7EDC0, "touchStatus");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v75;
          do
          {
            for (j = 0; j != v48; ++j)
            {
              if (*(_QWORD *)v75 != v49)
                objc_enumerationMutation(v46);
              objc_msgSend((id)_MergedGlobals_1120, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * j));
            }
            v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
          }
          while (v48);
        }

        v38 = v68;
      }
      else
      {
        objc_msgSend((id)qword_1ECD7EDC8, "addObject:", qword_1ECD7EDC0);
      }
      v53 = (void *)qword_1ECD7EDC0;
      qword_1ECD7EDC0 = 0;
    }
    else
    {
      if (!objc_msgSend((id)qword_1ECD7EDC8, "count"))
      {
LABEL_46:

        goto LABEL_60;
      }
      v51 = 0;
      while (1)
      {
        objc_msgSend((id)qword_1ECD7EDC8, "objectAtIndexedSubscript:", v51);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v45, "containsTouchID:", v18))
        {
          -[UIEventSessionTouchEventAnalyzer checkifGestureComplete:](self, "checkifGestureComplete:", v45);
          v52 = objc_claimAutoreleasedReturnValue();
          if (v52)
            break;
        }

        if (++v51 >= (unint64_t)objc_msgSend((id)qword_1ECD7EDC8, "count"))
          goto LABEL_46;
      }
      v53 = (void *)v52;
      v66 = v19;
      v69 = v38;
      v65 = v36;
      objc_msgSend(v19, "addObject:", v52);
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      objc_msgSend(v45, "touchStatus");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
      if (v55)
      {
        v56 = v55;
        v57 = *(_QWORD *)v71;
        do
        {
          for (k = 0; k != v56; ++k)
          {
            if (*(_QWORD *)v71 != v57)
              objc_enumerationMutation(v54);
            objc_msgSend((id)_MergedGlobals_1120, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * k));
          }
          v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
        }
        while (v56);
      }

      objc_msgSend((id)qword_1ECD7EDC8, "removeObjectAtIndex:", v51);
      v36 = v65;
      v19 = v66;
      v38 = v69;
    }

    goto LABEL_46;
  }
  objc_msgSend((id)_MergedGlobals_1120, "objectForKeyedSubscript:", v18);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = v27;
    objc_msgSend(v27, "touchStatus");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", v18);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "dragDistanceSquared");
    if (v31 <= 10.0)
    {
      objc_msgSend(v30, "lastLocation");
      +[UIEventSessionTouchEventAnalyzer squaredDistanceBetweenPoint:andPoint:](UIEventSessionTouchEventAnalyzer, "squaredDistanceBetweenPoint:andPoint:");
      v33 = v32;
      objc_msgSend(v30, "dragDistanceSquared");
      objc_msgSend(v30, "setDragDistanceSquared:", v33 + v34);
      objc_msgSend(v30, "setLastLocation:", v14, v13);
    }

  }
LABEL_60:

  return v19;
}

- (id)didPointerHoverWithTrackpadFingerDownCount:(int64_t)a3 withLocationInWindow:(CGPoint)a4 withWindowBounds:(CGRect)a5
{
  void *v6;
  BOOL v7;
  int64_t v8;
  _UIEventSessionHoverAction *v9;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  if (qword_1ECD7EDD0 == 2)
  {
    if (!a3)
    {
      qword_1ECD7EDD0 = 0;
      qword_1ECD7EDD8 = 0;
    }
  }
  else if (qword_1ECD7EDD0 == 1)
  {
    if (a3)
    {
      v8 = qword_1ECD7EDD8;
      if (qword_1ECD7EDD8 <= a3)
        v8 = a3;
      qword_1ECD7EDD8 = v8;
    }
    else
    {
      v9 = objc_alloc_init(_UIEventSessionHoverAction);
      -[_UIEventSessionAction setSource:](v9, "setSource:", 4);
      -[_UIEventSessionHoverAction setNumFingers:](v9, "setNumFingers:", qword_1ECD7EDD8);
      objc_msgSend(v6, "addObject:", v9);
      qword_1ECD7EDD0 = 0;
      qword_1ECD7EDD8 = 0;

    }
  }
  else
  {
    if (qword_1ECD7EDD0)
      v7 = 1;
    else
      v7 = a3 < 1;
    if (!v7)
    {
      qword_1ECD7EDD0 = 1;
      qword_1ECD7EDD8 = a3;
    }
  }
  return v6;
}

- (id)didPointerClickWithTrackpadFingerDownCount:(int64_t)a3 withLocationInWindow:(CGPoint)a4 withWindowBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  void *v13;
  _UIEventSessionTouchAction *v14;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.y;
  v10 = a4.x;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  v14 = objc_alloc_init(_UIEventSessionTouchAction);
  -[_UIEventSessionAction setSource:](v14, "setSource:", 4);
  -[_UIEventSessionTouchAction setNumFingers:](v14, "setNumFingers:", a3);
  -[_UIEventSessionTouchAction setWindowSection:](v14, "setWindowSection:", -[UIEventSessionTouchEventAnalyzer determineWindowSectionWithLocationInWindow:withWindowBounds:](self, "determineWindowSectionWithLocationInWindow:withWindowBounds:", v10, v9, x, y, width, height));
  objc_msgSend(v13, "addObject:", v14);
  if (qword_1ECD7EDD0 == 1)
    qword_1ECD7EDD0 = 2;

  return v13;
}

@end
