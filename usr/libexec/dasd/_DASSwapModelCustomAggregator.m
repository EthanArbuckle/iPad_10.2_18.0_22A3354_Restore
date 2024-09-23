@implementation _DASSwapModelCustomAggregator

- (_DASSwapModelCustomAggregator)initWithAlgorithms:(id)a3
{
  _DASSwapModelCustomAggregator *v3;
  _DASSwapModelCustomAggregator *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];

  v17.receiver = self;
  v17.super_class = (Class)_DASSwapModelCustomAggregator;
  v3 = -[_DASSwapModelAbstractAggregator initWithAlgorithms:](&v17, "initWithAlgorithms:", a3);
  v4 = v3;
  if (v3)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](v3, "algorithms", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
          v11 = objc_opt_class(_DASSwapModelApplicationUsage);
          if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
            objc_storeStrong((id *)&v4->_applicationUsageModeling, v10);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v7);
    }

  }
  return v4;
}

- (id)scoresForAllApplicationsAtDate:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  char v19;
  void *i;
  _DASSwapModeling *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  uint64_t v27;
  _UNKNOWN **v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  uint64_t v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  uint64_t k;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  uint64_t j;
  void *v57;
  void *v58;
  double v59;
  id v60;
  unint64_t v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  id obj;
  id obja;
  void *v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];

  v70 = a3;
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms"));
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    goto LABEL_4;
  if (v6 == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scoresForAllApplicationsAtDate:", v70));

LABEL_4:
    objc_autoreleasePoolPop(v4);
    v9 = 0;
    goto LABEL_5;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModeling scoresForAllApplicationsAtDate:](self->_applicationUsageModeling, "scoresForAllApplicationsAtDate:", v70));
  v14 = objc_msgSend(v13, "count");
  objc_msgSend(v12, "addObject:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allKeys"));
  v69 = v11;
  objc_msgSend(v11, "addObjectsFromArray:", v15);

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms"));
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
  if (v17)
  {
    v18 = v17;
    v65 = v14;
    obj = v16;
    v60 = v6;
    v62 = v13;
    v63 = v4;
    v6 = *(id *)v76;
    v19 = 1;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(id *)v76 != v6)
          objc_enumerationMutation(obj);
        v21 = *(_DASSwapModeling **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)i);
        v22 = objc_autoreleasePoolPush();
        if (v21 != self->_applicationUsageModeling)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModeling scoresForAllApplicationsAtDate:](v21, "scoresForAllApplicationsAtDate:", v70));
          v19 &= objc_msgSend(v23, "count") == 0;
          objc_msgSend(v12, "addObject:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allKeys"));
          objc_msgSend(v69, "addObjectsFromArray:", v24);

        }
        objc_autoreleasePoolPop(v22);
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
    }
    while (v18);

    v13 = v62;
    v4 = v63;
    if ((v19 & 1) == 0)
    {
      if (!v65 && (unint64_t)objc_msgSend(v69, "count") < 0xA)
      {
        v25 = 0;
        v9 = 0;
        v6 = &__NSDictionary0__struct;
        goto LABEL_40;
      }
      obja = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary", v60));
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v66 = v69;
      v26 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
      if (!v26)
        goto LABEL_39;
      v6 = v26;
      v27 = *(_QWORD *)v72;
      v28 = &AnalyticsSendEvent_ptr;
LABEL_23:
      v29 = 0;
      v64 = v6;
      while (1)
      {
        if (*(_QWORD *)v72 != v27)
          objc_enumerationMutation(v66);
        v30 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * v29);
        if (v61 == 3)
          break;
        if (v61 != 2)
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 0));
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", v30));
          objc_msgSend(v53, "doubleValue");
          v55 = v54;

          if (v61 >= 2)
          {
            for (j = 1; j != v61; ++j)
            {
              v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", j));
              v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectForKeyedSubscript:", v30));
              objc_msgSend(v58, "doubleValue");
              v55 = v55 + v59;

            }
          }
          v50 = v28[133];
          v51 = v55 / (double)v61;
          goto LABEL_36;
        }
        v31 = v28[133];
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", v30));
        objc_msgSend(v33, "doubleValue");
        v35 = v34;
        v36 = v27;
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", v30));
        objc_msgSend(v38, "doubleValue");
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "numberWithDouble:", v39 * 0.75 + v35 * 0.25));
        objc_msgSend(obja, "setObject:forKeyedSubscript:", v40, v30);

        v27 = v36;
        v6 = v64;

        v28 = &AnalyticsSendEvent_ptr;
LABEL_37:

        if ((id)++v29 == v6)
        {
          v6 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
          if (!v6)
          {
LABEL_39:

            v9 = objc_msgSend(obja, "copy");
            v25 = 1;
            v13 = v62;
            v4 = v63;
            goto LABEL_40;
          }
          goto LABEL_23;
        }
      }
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKeyedSubscript:", v30));
      objc_msgSend(v42, "doubleValue");
      v44 = v43;

      v45 = 0.0;
      for (k = 1; k != 3; ++k)
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", k));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", v30));
        objc_msgSend(v48, "doubleValue");
        v45 = v45 + v49;

      }
      v50 = v28[133];
      v51 = v45 * 0.75 * 0.5 + v44 * 0.25;
LABEL_36:
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "numberWithDouble:", v51));
      objc_msgSend(obja, "setObject:forKeyedSubscript:", v32, v30);
      goto LABEL_37;
    }
  }
  else
  {

  }
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject", v60));
  v25 = 0;
  v9 = 0;
LABEL_40:

  objc_autoreleasePoolPop(v4);
  if (v25)
  {
    v9 = v9;
    v6 = v9;
  }
LABEL_5:

  return v6;
}

- (double)scoreForApplication:(id)a3 atDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  double v19;
  void *i;
  _DASSwapModeling *v21;
  double v22;
  double v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms"));
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    if (v9 == (id)1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
      objc_msgSend(v11, "scoreForApplication:atDate:", v6, v7);
      v13 = v12;

    }
    else
    {
      -[_DASSwapModeling scoreForApplication:atDate:](self->_applicationUsageModeling, "scoreForApplication:atDate:", v6, v7);
      v13 = v14;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAbstractAggregator algorithms](self, "algorithms", 0));
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v26;
        v19 = 0.0;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v26 != v18)
              objc_enumerationMutation(v15);
            v21 = *(_DASSwapModeling **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
            if (v21 != self->_applicationUsageModeling)
            {
              -[_DASSwapModeling scoreForApplication:atDate:](v21, "scoreForApplication:atDate:", v6, v7);
              v19 = v19 + v22;
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v17);

        if (v19 != 0.0)
        {
          if (v9 == (id)3)
          {
            v23 = v19 * 0.5 * 0.75;
          }
          else
          {
            if (v9 != (id)2)
            {
              v13 = (v13 + v19) / (double)(unint64_t)v9;
              goto LABEL_22;
            }
            v23 = v19 * 0.75;
          }
          v13 = v23 + v13 * 0.25;
        }
      }
      else
      {

      }
    }
  }
  else
  {
    v13 = 0.0;
  }
LABEL_22:

  return v13;
}

- (_DASSwapModeling)applicationUsageModeling
{
  return (_DASSwapModeling *)objc_getProperty(self, a2, 16, 1);
}

- (void)setApplicationUsageModeling:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationUsageModeling, 0);
}

@end
