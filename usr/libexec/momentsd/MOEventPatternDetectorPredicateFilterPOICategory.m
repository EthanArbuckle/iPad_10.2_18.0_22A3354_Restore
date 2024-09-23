@implementation MOEventPatternDetectorPredicateFilterPOICategory

- (MOEventPatternDetectorPredicateFilterPOICategory)init
{
  MOEventPatternDetectorPredicateFilterPOICategory *v2;
  uint64_t v3;
  NSCalendar *cal;
  MOEventPatternDetectorPredicateFilterPOICategory *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MOEventPatternDetectorPredicateFilterPOICategory;
  v2 = -[MOEventPatternDetectorPredicateFilterPOICategory init](&v7, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    cal = v2->_cal;
    v2->_cal = (NSCalendar *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)filterEvents:(id)a3
{
  NSMutableArray *v4;
  id v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  id v12;
  id v13;
  id v14;
  int v15;
  uint64_t v16;
  void *j;
  void *v18;
  NSCalendar *cal;
  void *v20;
  NSInteger v21;
  NSCalendar *v22;
  void *v23;
  BOOL v24;
  NSCalendar *v25;
  void *v26;
  void *v27;
  NSMutableArray *v28;
  _UNKNOWN **v29;
  void *v30;
  void *v31;
  uint64_t v32;
  char v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSMutableArray *v41;
  id v43;
  NSMutableArray *v44;
  uint64_t v45;
  id v46;
  id v47;
  unsigned int v48;
  void *v49;
  void *v50;
  int v51;
  id v52;
  id obj;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  _BYTE v64[128];
  id v65;
  _BYTE v66[128];

  v46 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v5 = (id)interestingPOIcategories;
  v47 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
  if (!v47)
  {

    goto LABEL_39;
  }
  v51 = 0;
  v44 = v4;
  v45 = *(_QWORD *)v60;
  v43 = v5;
  do
  {
    for (i = 0; i != v47; i = (char *)i + 1)
    {
      if (*(_QWORD *)v60 != v45)
        objc_enumerationMutation(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu AND %K = %@"), CFSTR("category"), 1, CFSTR("poiCategory"), *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i)));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "filteredArrayUsingPredicate:", v7));
      if (objc_msgSend(v8, "count"))
      {
        v49 = v7;
        v50 = i;
        v48 = objc_msgSend(v8, "count");
        v52 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
        v65 = v52;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v65, 1));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sortedArrayUsingDescriptors:", v9));

        v11 = objc_opt_new(NSMutableDictionary);
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v12 = v10;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
        obj = v12;
        if (v13)
        {
          v14 = v13;
          v54 = *(_QWORD *)v56;
          v15 = -1;
          v16 = 0xFFFFFFFFLL;
          do
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(_QWORD *)v56 != v54)
                objc_enumerationMutation(obj);
              v18 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)j);
              cal = self->_cal;
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startDate"));
              v21 = -[NSCalendar component:fromDate:](cal, "component:fromDate:", 0x2000, v20);

              v22 = self->_cal;
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startDate"));
              LODWORD(v22) = -[NSCalendar isDateInWeekend:](v22, "isDateInWeekend:", v23);

              if ((_DWORD)v22)
                v24 = v15 == (_DWORD)v21;
              else
                v24 = 1;
              if (!v24)
              {
                v29 = &off_1002DB330;
                v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v11, "objectForKey:", &off_1002DB330));

                if (v30)
                {
                  v15 = v21;
                }
                else
                {
                  v28 = objc_opt_new(NSMutableArray);
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v28, &off_1002DB330);
                  v15 = v21;
LABEL_24:

                }
                v21 = v16;
                goto LABEL_26;
              }
              v25 = self->_cal;
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "startDate"));
              LOBYTE(v25) = -[NSCalendar isDateInWeekend:](v25, "isDateInWeekend:", v26);

              if ((v25 & 1) == 0 && (_DWORD)v16 != (_DWORD)v21)
              {
                v29 = &off_1002DB348;
                v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v11, "objectForKey:", &off_1002DB348));

                if (!v27)
                {
                  v28 = objc_opt_new(NSMutableArray);
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v28, &off_1002DB348);
                  v16 = v21;
                  goto LABEL_24;
                }
LABEL_26:
                v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v29));
                objc_msgSend(v31, "addObject:", v18);

                v16 = v21;
                continue;
              }
            }
            v12 = obj;
            v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
          }
          while (v14);
        }
        v51 += v48;

        v32 = 0;
        v33 = 1;
        v4 = v44;
        do
        {
          v34 = v33;
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v32));
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v35));

          if (v36)
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v32));
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v37));

            v63 = v52;
            v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v63, 1));
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "sortedArrayUsingDescriptors:", v39));
            -[NSMutableArray addObject:](v44, "addObject:", v40);

          }
          v33 = 0;
          v32 = 1;
        }
        while ((v34 & 1) != 0);

        v5 = v43;
        v7 = v49;
        i = v50;
        v8 = obj;
      }

    }
    v47 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
  }
  while (v47);

  if (!v51)
  {
LABEL_39:
    v41 = 0;
    goto LABEL_40;
  }
  v41 = v4;
LABEL_40:

  return v41;
}

- (BOOL)configure:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cal, 0);
}

@end
