@implementation MOTrendBundlerPredicateContactTypeTrend

- (MOTrendBundlerPredicateContactTypeTrend)init
{
  MOTrendBundlerPredicateContactTypeTrend *v2;
  MOTrendBundlerPredicateContactTypeTrend *v3;
  MOTrendBundlerPredicateContactTypeTrend *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MOTrendBundlerPredicateContactTypeTrend;
  v2 = -[MOTrendBundlerPredicateContactTypeTrend init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)filterEvents:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  double v21;
  _BOOL4 v22;
  NSMutableArray *v23;
  NSMutableArray *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSMutableArray *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *k;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  id v42;
  void *v43;
  void *v44;
  NSMutableArray *v46;
  NSMutableArray *v47;
  id v48;
  id v49;
  void *v50;
  uint64_t v51;
  NSMutableArray *v52;
  void *v53;
  id v54;
  unsigned int obja;
  NSMutableArray *obj;
  void *v57;
  uint64_t v58;
  NSMutableArray *v59;
  __int128 v60;
  __int128 v61;
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
  __int128 v74;
  __int128 v75;
  id v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];

  v3 = a3;
  v52 = objc_opt_new(NSMutableArray);
  v46 = objc_opt_new(NSMutableArray);
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
  v48 = v4;
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v73 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "category", v46) == (id)10)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "patterns"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kEventPatternType")));
          if (objc_msgSend(v11, "intValue") != 1)
          {

            continue;
          }
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "patterns"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kEventPatternTrendFeatureType")));
          v14 = objc_msgSend(v13, "intValue");
          if (v14 == 1
            || (v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "patterns")),
                v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("kEventPatternTrendFeatureType"))),
                objc_msgSend(v50, "intValue") == 2))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "patterns"));
            v57 = v10;
            obja = v14;
            v16 = v13;
            v17 = v12;
            v18 = v6;
            v19 = v7;
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("kEventPatternTrendSlope")));
            objc_msgSend(v20, "doubleValue");
            v22 = v21 > 0.0;

            v7 = v19;
            v6 = v18;
            v12 = v17;
            v13 = v16;

            v4 = v48;
            v10 = v57;
            if (obja == 1)
            {
LABEL_15:

              if (v22)
                -[NSMutableArray addObject:](v46, "addObject:", v9);
              continue;
            }
          }
          else
          {
            v22 = 0;
          }

          goto LABEL_15;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
    }
    while (v6);
  }

  v23 = v46;
  if (-[NSMutableArray count](v46, "count"))
  {
    v24 = objc_opt_new(NSMutableArray);
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    obj = v46;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v69;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(_QWORD *)v69 != v27)
            objc_enumerationMutation(obj);
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)j), "patterns", v46));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("kEventPatternInteractionScoredContactIdentifier")));
          -[NSMutableArray addObject:](v24, "addObject:", v30);

        }
        v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
      }
      while (v26);
    }

    v47 = v24;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v49 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v24, "valueForKeyPath:", CFSTR("@distinctUnionOfObjects.self")));
    v54 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
    if (v54)
    {
      v51 = *(_QWORD *)v65;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v65 != v51)
            objc_enumerationMutation(v49);
          v58 = v31;
          v32 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v31);
          v59 = objc_opt_new(NSMutableArray);
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          v63 = 0u;
          v33 = obj;
          v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v60, v77, 16);
          if (v34)
          {
            v35 = v34;
            v36 = *(_QWORD *)v61;
            do
            {
              for (k = 0; k != v35; k = (char *)k + 1)
              {
                if (*(_QWORD *)v61 != v36)
                  objc_enumerationMutation(v33);
                v38 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)k);
                v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "patterns", v46));
                v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("kEventPatternInteractionScoredContactIdentifier")));
                v41 = objc_msgSend(v40, "isEqualToString:", v32);

                if (v41)
                  -[NSMutableArray addObject:](v59, "addObject:", v38);
              }
              v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v60, v77, 16);
            }
            while (v35);
          }

          v42 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 0);
          v76 = v42;
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v76, 1));
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingDescriptors:](v59, "sortedArrayUsingDescriptors:", v43));

          -[NSMutableArray addObject:](v52, "addObject:", v44);
          v31 = v58 + 1;
        }
        while ((id)(v58 + 1) != v54);
        v54 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
      }
      while (v54);
    }

    v23 = v46;
    v4 = v48;
  }

  return v52;
}

- (BOOL)configure:(id)a3
{
  return 1;
}

@end
