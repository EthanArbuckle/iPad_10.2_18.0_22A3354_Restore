@implementation _TUIFlexibleEqualWidthLayoutController

- (void)computeWithMeasured:(double)a3 desired:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  NSMutableArray *v9;
  id v10;
  uint64_t v11;
  void *i;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  id v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  void *j;
  uint64_t v24;
  float *v25;
  float *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  _BOOL4 v33;
  _BOOL4 v34;
  NSMapTable *layoutToFlexed;
  void *v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  void *k;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  id v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];

  v5 = v4;
  v46 = objc_msgSend(objc_alloc((Class)NSHashTable), "initWithOptions:capacity:", 512, -[NSMutableArray count](self->super._layouts, "count"));
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v9 = self->super._layouts;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v58 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(v46, "addObject:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i), v46);
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    }
    while (v10);
  }

  -[TUIFlexibleLayoutController _lengthToAdjustWithMeasured:desired:](self, "_lengthToAdjustWithMeasured:desired:", a4, v5, a3);
  v14 = v13;
  v15 = v13 + self->super._layoutTotalLength;
  while (1)
  {
    if (!objc_msgSend(v46, "count", v46))
      goto LABEL_38;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v16 = objc_msgSend(v46, "count");
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v17 = v46;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    if (v18)
    {
      v19 = v15 / (double)(unint64_t)v16;
      v20 = *(_QWORD *)v54;
      v21 = 0.0;
      v22 = 0.0;
      while (1)
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(_QWORD *)v54 != v20)
            objc_enumerationMutation(v17);
          v24 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)j);
          v52 = v24;
          v25 = (float *)sub_DAF50(&self->super._layoutToLength.__table_.__bucket_list_.__ptr_.__value_, &v52);
          v26 = v25;
          v27 = v25[6];
          v28 = v19 - v27;
          if (v19 - v27 <= 0.0)
          {
            v30 = v25[6];
            if (v28 >= 0.0)
              goto LABEL_20;
            v29 = fmax(-fmax((float)(COERCE_FLOAT(*((_QWORD *)v25 + 3)) - COERCE_FLOAT(HIDWORD(*((_QWORD *)v25 + 3)))), 0.0), v28);
          }
          else
          {
            v29 = fmin(fmax((float)(v25[8] - v25[6]), 0.0), v28);
          }
          v30 = v29 + v27;
LABEL_20:
          -[_TUIFlexibleEqualWidthLayoutController _layout:lengthForProposedLength:](self, "_layout:lengthForProposedLength:", v24, v30);
          v32 = v31;
          v33 = !TUICGFloatIsAlmostEqualFloat(vabdd_f64(v26[8], v31), 0.0);
          v34 = !TUICGFloatIsAlmostEqualFloat(vabdd_f64(v26[7], v32), 0.0);
          if (!TUICGFloatIsAlmostEqualFloat(vabdd_f64(v32, v19), 0.0) || !v33 && !v34)
          {
            objc_msgSend(v47, "addObject:", v24);
            v21 = v21 + v32 - v27;
          }
          layoutToFlexed = self->super._layoutToFlexed;
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v32));
          -[NSMapTable setObject:forKey:](layoutToFlexed, "setObject:forKey:", v36, v24);

          v22 = v22 + v32 - v27;
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
        if (!v18)
          goto LABEL_26;
      }
    }
    v21 = 0.0;
    v22 = 0.0;
LABEL_26:

    if (!objc_msgSend(v47, "count"))
      break;
    v37 = objc_msgSend(v47, "count");
    if (v37 == objc_msgSend(v17, "count") || TUICGFloatIsAlmostEqualFloat(v22, v14))
      break;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v38 = v47;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v49;
      do
      {
        for (k = 0; k != v39; k = (char *)k + 1)
        {
          if (*(_QWORD *)v49 != v40)
            objc_enumerationMutation(v38);
          v42 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)k);
          objc_msgSend(v17, "removeObject:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->super._layoutToFlexed, "objectForKey:", v42));
          objc_msgSend(v43, "doubleValue");
          v45 = v44;

          v15 = v15 - v45;
        }
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
      }
      while (v39);
    }

    v14 = v14 - v21;
  }

LABEL_38:
}

- (double)_layout:(id)a3 lengthForProposedLength:(double)a4
{
  double result;

  _objc_msgSend(a3, "computeWidthForProposedWidth:", a4);
  return result;
}

@end
