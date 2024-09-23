@implementation TUIFlexibleLayoutController

- (id)_init
{
  TUIFlexibleLayoutController *v2;
  NSMutableArray *v3;
  NSMutableArray *layouts;
  NSMutableDictionary *v5;
  NSMutableDictionary *priorityToLayouts;
  uint64_t v7;
  NSMapTable *layoutToFlexed;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TUIFlexibleLayoutController;
  v2 = -[TUIFlexibleLayoutController init](&v10, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableArray);
    layouts = v2->_layouts;
    v2->_layouts = v3;

    v5 = objc_opt_new(NSMutableDictionary);
    priorityToLayouts = v2->_priorityToLayouts;
    v2->_priorityToLayouts = v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 512, 0));
    layoutToFlexed = v2->_layoutToFlexed;
    v2->_layoutToFlexed = (NSMapTable *)v7;

  }
  return v2;
}

+ (id)newWidthController
{
  return -[TUIFlexibleLayoutController _init]([_TUIFlexibleWidthLayoutController alloc], "_init");
}

+ (id)newHeightController
{
  return -[TUIFlexibleLayoutController _init]([_TUIFlexibleHeightLayoutController alloc], "_init");
}

+ (id)newEqualWidthController
{
  return -[TUIFlexibleLayoutController _init]([_TUIFlexibleEqualWidthLayoutController alloc], "_init");
}

+ (id)newStrictEqualWidthController
{
  return -[TUIFlexibleLayoutController _init]([_TUIFlexibleStrictEqualWidthLayoutController alloc], "_init");
}

- (NSArray)layouts
{
  return (NSArray *)self->_layouts;
}

- (double)adjustedNaturalLengthWithMeasured:(double)a3 computed:(double)a4
{
  return NAN;
}

- (void)addLayout:(id)a3 length:(id *)a4 compressed:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  id v10;
  NSMutableDictionary *priorityToLayouts;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *v14;
  NSMutableDictionary *v15;
  void *v16;
  _QWORD *v17;
  NSHashTable *hideableLayouts;
  NSHashTable *v19;
  NSHashTable *v20;
  id v21;
  id *v22;

  v6 = v5;
  v10 = a3;
  -[NSMutableArray addObject:](self->_layouts, "addObject:", v10);
  self->_layoutTotalLength = fmax(*(float *)&a4, 0.0) + self->_layoutTotalLength;
  priorityToLayouts = self->_priorityToLayouts;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", WORD2(a5)));
  v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](priorityToLayouts, "objectForKeyedSubscript:", v12));

  if (!v13)
  {
    v14 = objc_opt_new(NSMutableArray);
    v15 = self->_priorityToLayouts;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", WORD2(a5)));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v14, v16);

    v13 = v14;
  }
  -[NSMutableArray addObject:](v13, "addObject:", v10);
  v21 = v10;
  v22 = &v21;
  v17 = sub_EA17C((uint64_t)&self->_layoutToLength, &v21, (uint64_t)&std::piecewise_construct, (uint64_t **)&v22);
  v17[3] = a4;
  v17[4] = a5;
  -[NSMapTable setObject:forKey:](self->_layoutToFlexed, "setObject:forKey:", &off_254AD0, v10);
  objc_msgSend(v10, "setHidden:", 0);
  if (v6 == 1)
  {
    hideableLayouts = self->_hideableLayouts;
    if (!hideableLayouts)
    {
      v19 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
      v20 = self->_hideableLayouts;
      self->_hideableLayouts = v19;

      hideableLayouts = self->_hideableLayouts;
    }
    -[NSHashTable addObject:](hideableLayouts, "addObject:", v10);
  }

}

- (double)_lengthToAdjustWithMeasured:(double)a3 desired:(id *)a4
{
  float v4;

  return fmin(fmax(*(float *)&a4, *((float *)&a4 + 1)), v4) - a3;
}

- (void)computeWithMeasured:(double)a3 desired:(id *)a4
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  uint64_t v13;
  double v14;
  void *j;
  id v16;
  id v17;
  uint64_t v18;
  void *k;
  void *v20;
  float *v21;
  float v22;
  id v23;
  id v24;
  uint64_t v25;
  double v26;
  void *m;
  void *v28;
  float *v29;
  float *v30;
  uint64_t v31;
  float v32;
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
  double v45;
  double v46;
  NSMapTable *layoutToFlexed;
  void *v49;
  id v50;
  NSMutableArray *v51;
  id v52;
  uint64_t v53;
  void *n;
  id obj;
  uint64_t v56;
  id v57;
  void *i;
  id v59;
  NSMutableArray *v60;
  double v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];

  -[TUIFlexibleLayoutController _lengthToAdjustWithMeasured:desired:](self, "_lengthToAdjustWithMeasured:desired:", a4, a3);
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_priorityToLayouts, "allKeys"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingSelector:", "compare:"));

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = v8;
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
  if (v57)
  {
    v56 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v57; i = (char *)i + 1)
      {
        if (*(_QWORD *)v80 != v56)
          objc_enumerationMutation(obj);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_priorityToLayouts, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)i)));
        v59 = objc_msgSend(v9, "mutableCopy");

        if (fabs(v6) > 1.0)
        {
          v10 = 1;
          do
          {
            if (!objc_msgSend(v59, "count"))
              break;
            v77 = 0u;
            v78 = 0u;
            v75 = 0u;
            v76 = 0u;
            v11 = v59;
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
            if (v12)
            {
              v13 = *(_QWORD *)v76;
              v14 = 0.0;
              do
              {
                for (j = 0; j != v12; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v76 != v13)
                    objc_enumerationMutation(v11);
                  v74 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)j);
                  v14 = v14
                      + fmax(*((float *)sub_DAF50(&self->_layoutToLength.__table_.__bucket_list_.__ptr_.__value_, &v74) + 6), 1.0);
                }
                v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
              }
              while (v12);
            }
            else
            {
              v14 = 0.0;
            }

            v60 = objc_opt_new(NSMutableArray);
            if (self->_hideableLayouts && v6 < 0.0)
            {
              v72 = 0u;
              v73 = 0u;
              v70 = 0u;
              v71 = 0u;
              v16 = v11;
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
              if (v17)
              {
                v18 = *(_QWORD *)v71;
                do
                {
                  for (k = 0; k != v17; k = (char *)k + 1)
                  {
                    if (*(_QWORD *)v71 != v18)
                      objc_enumerationMutation(v16);
                    v20 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)k);
                    v74 = v20;
                    v21 = (float *)sub_DAF50(&self->_layoutToLength.__table_.__bucket_list_.__ptr_.__value_, &v74);
                    if (self->_hideableLayouts)
                    {
                      v22 = v21[6];
                      if (-[NSHashTable containsObject:](self->_hideableLayouts, "containsObject:", v20))
                      {
                        objc_msgSend(v20, "setHidden:", 1);
                        -[NSMapTable setObject:forKey:](self->_layoutToFlexed, "setObject:forKey:", &off_253BC8, v20);
                        v6 = v6 + v22;
                        v14 = v14 - v22;
                      }
                    }
                  }
                  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
                }
                while (v17);
              }

            }
            v68 = 0u;
            v69 = 0u;
            v66 = 0u;
            v67 = 0u;
            v23 = v11;
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
            if (v24)
            {
              v25 = *(_QWORD *)v67;
              v61 = 0.0;
              v26 = 0.0;
              do
              {
                for (m = 0; m != v24; m = (char *)m + 1)
                {
                  if (*(_QWORD *)v67 != v25)
                    objc_enumerationMutation(v23);
                  v28 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)m);
                  v74 = v28;
                  v29 = (float *)sub_DAF50(&self->_layoutToLength.__table_.__bucket_list_.__ptr_.__value_, &v74);
                  v30 = v29;
                  v31 = *((_QWORD *)v29 + 3);
                  if (v6 <= 0.0)
                    v32 = COERCE_FLOAT(*((_QWORD *)v29 + 3)) - *((float *)&v31 + 1);
                  else
                    v32 = v29[8] - *(float *)&v31;
                  v33 = v29[6];
                  v34 = fmax(v33, 1.0);
                  v35 = fmax(v32, 0.0);
                  if ((v10 & 1) != 0)
                    v36 = v34 / v14;
                  else
                    v36 = 1.0;
                  if ((objc_msgSend(v28, "hidden") & 1) == 0)
                  {
                    v37 = fmin(v35, v6 * v36) + v33;
                    if (v6 <= 0.0)
                      v38 = fmax(v37, v30[7]);
                    else
                      v38 = fmin(v37, v30[8]);
                    -[TUIFlexibleLayoutController _layout:lengthForProposedLength:](self, "_layout:lengthForProposedLength:", v28, v38);
                    v40 = v39;
                    if (v6 > 0.0)
                    {
                      v41 = v30[8];
                      v42 = vabdd_f64(v41, v40);
                      v43 = vabdd_f64(v41, v37);
                      if (v42 <= 1.0 || v43 <= 1.0)
                        goto LABEL_57;
                    }
                    if (v6 < 0.0)
                    {
                      v45 = v30[7];
                      v46 = vabdd_f64(v45, v40);
                      v43 = vabdd_f64(v45, v37);
                      if (v46 <= 1.0 || v43 <= 1.0)
                      {
LABEL_57:
                        -[NSMutableArray addObject:](v60, "addObject:", v28, v43);
                        v61 = v61 + v40 - v33;
                      }
                    }
                    layoutToFlexed = self->_layoutToFlexed;
                    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v40));
                    -[NSMapTable setObject:forKey:](layoutToFlexed, "setObject:forKey:", v49, v28);

                    v26 = v26 + v40 - v33;
                  }
                }
                v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
              }
              while (v24);
            }
            else
            {
              v61 = 0.0;
              v26 = 0.0;
            }

            if (vabdd_f64(v26, v6) >= 1.0)
            {
              v50 = -[NSMutableArray count](v60, "count");
              if (v50 != objc_msgSend(v23, "count"))
              {
                if (-[NSMutableArray count](v60, "count"))
                {
                  v64 = 0u;
                  v65 = 0u;
                  v62 = 0u;
                  v63 = 0u;
                  v51 = v60;
                  v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v62, v83, 16);
                  if (v52)
                  {
                    v53 = *(_QWORD *)v63;
                    do
                    {
                      for (n = 0; n != v52; n = (char *)n + 1)
                      {
                        if (*(_QWORD *)v63 != v53)
                          objc_enumerationMutation(v51);
                        objc_msgSend(v23, "removeObjectIdenticalTo:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)n));
                      }
                      v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v62, v83, 16);
                    }
                    while (v52);
                  }

                  v6 = v6 - v61;
                }
                else
                {
                  if ((v10 & 1) == 0)
                    objc_msgSend(v23, "removeAllObjects");
                  v10 = 0;
                }
                goto LABEL_67;
              }
              objc_msgSend(v23, "removeAllObjects");
            }
            v6 = v6 - v26;
LABEL_67:

          }
          while (fabs(v6) > 1.0);
        }

      }
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v87, 16);
    }
    while (v57);
  }

}

- (double)adjustedLengthForLayout:(id)a3
{
  void *v3;
  float v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_layoutToFlexed, "objectForKey:", a3));
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hideableLayouts, 0);
  objc_storeStrong((id *)&self->_layoutToFlexed, 0);
  objc_storeStrong((id *)&self->_priorityToLayouts, 0);
  sub_14B0C((uint64_t)&self->_layoutToLength);
  objc_storeStrong((id *)&self->_layouts, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  return self;
}

@end
