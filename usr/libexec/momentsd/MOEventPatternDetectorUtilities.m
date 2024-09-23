@implementation MOEventPatternDetectorUtilities

+ (id)getHomeVisitChunksForStandardDay:(id)a3
{
  id v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  MOEvent *v19;
  void *v20;
  void *v21;
  MOEvent *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v28;
  id obj;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  _BYTE v40[128];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v5 = objc_opt_new(NSMutableArray);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v28 = v3;
    obj = v3;
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v32)
    {
      v30 = *(_QWORD *)v36;
      v31 = v4;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v36 != v30)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDate"));
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "components:fromDate:", 28, v8));
          objc_msgSend(v10, "setHour:", 3);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateFromComponents:", v10));
          v33 = v10;
          v34 = v6;
          if (objc_msgSend(v8, "isOnOrAfter:", v11))
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateFromComponents:", v10));
            v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateByAddingTimeInterval:", 86400.0));

            v11 = (void *)v13;
          }
          if (objc_msgSend(v8, "isBeforeDate:", v9))
          {
            v14 = 0;
            v15 = v8;
            v16 = v11;
            do
            {
              if (objc_msgSend(v15, "isBeforeDate:", v16)
                && objc_msgSend(v9, "isOnOrAfter:", v16))
              {
                v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dateByAddingTimeInterval:", -1.0));
              }
              else
              {
                v17 = v9;
              }
              v18 = v17;

              v19 = [MOEvent alloc];
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "eventIdentifier"));
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "creationDate"));
              v22 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v19, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v20, v15, v18, v21, objc_msgSend(v7, "provider"), objc_msgSend(v7, "category"));

              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "expirationDate"));
              -[MOEvent setExpirationDate:](v22, "setExpirationDate:", v23);

              -[NSMutableArray addObject:](v5, "addObject:", v22);
              v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dateByAddingTimeInterval:", 1.0));

              v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dateByAddingTimeInterval:", 86400.0));
              v15 = v8;
              v16 = v11;
              v14 = v18;
            }
            while ((objc_msgSend(v8, "isBeforeDate:", v9) & 1) != 0);
          }
          else
          {
            v18 = 0;
          }

          v6 = v34 + 1;
          v4 = v31;
        }
        while ((id)(v34 + 1) != v32);
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v32);
    }

    v24 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
    v39 = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v39, 1));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingDescriptors:](v5, "sortedArrayUsingDescriptors:", v25));

    v3 = v28;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

@end
