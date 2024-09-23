@implementation MOTrendBundlerPredicateWorkoutTypePattern

- (MOTrendBundlerPredicateWorkoutTypePattern)init
{
  MOTrendBundlerPredicateWorkoutTypePattern *v2;
  MOTrendBundlerPredicateWorkoutTypePattern *v3;
  MOTrendBundlerPredicateWorkoutTypePattern *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MOTrendBundlerPredicateWorkoutTypePattern;
  v2 = -[MOTrendBundlerPredicateWorkoutTypePattern init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)filterEvents:(id)a3
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  int v13;
  int v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSMutableArray *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSMutableArray *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *j;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  id v41;
  void *v42;
  void *v43;
  const __CFString *v45;
  NSMutableArray *v46;
  void *v47;
  void *v48;
  id v49;
  NSMutableArray *v50;
  id obj;
  NSMutableArray *v52;
  id v53;
  id v54;
  void *v55;
  uint64_t v56;
  id v57;
  id v58;
  NSMutableArray *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  NSMutableArray *v63;
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
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  id v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];

  v3 = a3;
  v52 = objc_opt_new(NSMutableArray);
  v4 = objc_opt_new(NSMutableArray);
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
  v46 = v4;
  if (v5)
  {
    v6 = v5;
    v58 = *(id *)v77;
    v45 = CFSTR("kEventPatternTrendSlope");
    do
    {
      v7 = 0;
      v49 = v6;
      do
      {
        if (*(id *)v77 != v58)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)v7);
        v9 = objc_msgSend(v8, "category", v45);
        if (v9 == (id)2
          && (v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "patterns")),
              v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("kEventPatternType"))),
              objc_msgSend(v60, "intValue") == 1))
        {
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "patterns"));
          v53 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("kEventPatternTrendFeatureType")));
          if (objc_msgSend(v53, "intValue") == 1)
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "patterns"));
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v45));
            objc_msgSend(v11, "doubleValue");
            v47 = v11;
            v48 = v10;
            if (v12 > 0.0)
            {

              goto LABEL_22;
            }
            if (objc_msgSend(v8, "category") != (id)2)
            {

              goto LABEL_24;
            }
            v13 = 1;
            v14 = 1;
            goto LABEL_13;
          }
          v13 = 1;
        }
        else
        {
          v13 = 0;
        }
        v14 = 0;
        v15 = 0;
        if (objc_msgSend(v8, "category") != (id)2)
          goto LABEL_16;
LABEL_13:
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "patterns"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kEventPatternType")));
        if (objc_msgSend(v17, "intValue") == 2)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "patterns"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kEventPatternRoutineStartingRoutine")));
          v15 = objc_msgSend(v19, "BOOLValue");

          v4 = v46;
          if ((v14 & 1) == 0)
            goto LABEL_15;
        }
        else
        {

          v15 = 0;
          if (!v14)
          {
LABEL_15:
            v6 = v49;
LABEL_16:
            if (!v13)
              goto LABEL_18;
LABEL_17:

            goto LABEL_18;
          }
        }

        v6 = v49;
        if ((v13 & 1) != 0)
          goto LABEL_17;
LABEL_18:
        if (v9 == (id)2)
        {

          if ((v15 & 1) == 0)
            goto LABEL_24;
        }
        else if (!v15)
        {
          goto LABEL_24;
        }
LABEL_22:
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "patterns"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", CFSTR("kEventPatternOverallWorkoutType")));

        if (v21)
          -[NSMutableArray addObject:](v4, "addObject:", v8);
LABEL_24:
        v7 = (char *)v7 + 1;
      }
      while (v6 != v7);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
      v6 = v22;
    }
    while (v22);
  }

  if (-[NSMutableArray count](v4, "count"))
  {
    v23 = objc_opt_new(NSMutableArray);
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v59 = v4;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(_QWORD *)v73 != v26)
            objc_enumerationMutation(v59);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i), "patterns"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("kEventPatternOverallWorkoutType")));
          -[NSMutableArray addObject:](v23, "addObject:", v29);

        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
      }
      while (v25);
    }

    v50 = v23;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v54 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v23, "valueForKeyPath:", CFSTR("@distinctUnionOfObjects.self")));
    v57 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
    if (v57)
    {
      v56 = *(_QWORD *)v69;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v69 != v56)
            objc_enumerationMutation(v54);
          v61 = v30;
          v31 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * v30);
          v63 = objc_opt_new(NSMutableArray);
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v67 = 0u;
          v32 = v59;
          v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v65;
            do
            {
              for (j = 0; j != v34; j = (char *)j + 1)
              {
                if (*(_QWORD *)v65 != v35)
                  objc_enumerationMutation(v32);
                v37 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)j);
                v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "patterns"));
                v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("kEventPatternOverallWorkoutType")));
                v40 = objc_msgSend(v39, "isEqualToString:", v31);

                if (v40)
                  -[NSMutableArray addObject:](v63, "addObject:", v37);
              }
              v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
            }
            while (v34);
          }

          v41 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 0);
          v80 = v41;
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v80, 1));
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingDescriptors:](v63, "sortedArrayUsingDescriptors:", v42));

          -[NSMutableArray addObject:](v52, "addObject:", v43);
          v30 = v61 + 1;
        }
        while ((id)(v61 + 1) != v57);
        v57 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
      }
      while (v57);
    }

    v4 = v46;
  }

  return v52;
}

- (BOOL)configure:(id)a3
{
  return 1;
}

@end
