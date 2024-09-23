@implementation PassThroughStackView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PassThroughStackView subviews](self, "subviews", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "reverseObjectEnumerator"));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v14, "isUserInteractionEnabled"))
        {
          if ((objc_msgSend(v14, "isHidden") & 1) == 0)
          {
            objc_msgSend(v14, "alpha");
            if (v15 >= 0.01)
            {
              objc_msgSend(v14, "convertPoint:fromView:", self, x, y);
              v17 = v16;
              v19 = v18;
              if (objc_msgSend(v14, "pointInside:withEvent:", v7))
              {
                v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "hitTest:withEvent:", v7, v17, v19));
                if (v20)
                {
                  v21 = (void *)v20;
                  goto LABEL_15;
                }
              }
            }
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v11)
        continue;
      break;
    }
  }
  v21 = 0;
LABEL_15:

  return v21;
}

- (BOOL)_isTransparentFocusRegion
{
  return 1;
}

@end
