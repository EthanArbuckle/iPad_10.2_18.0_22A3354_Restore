@implementation NSArray

- (id)sortMOEventArrayByStartDate
{
  id v3;
  void *v4;
  void *v5;
  id v7;

  v3 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v7 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray sortedArrayUsingDescriptors:](self, "sortedArrayUsingDescriptors:", v4));

  return v5;
}

- (id)sortMOEventArrayByEndDate
{
  id v3;
  void *v4;
  void *v5;
  id v7;

  v3 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("endDate"), 1);
  v7 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray sortedArrayUsingDescriptors:](self, "sortedArrayUsingDescriptors:", v4));

  return v5;
}

- (id)getDurationOfMOEventArray
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray sortMOEventArrayByStartDate](self, "sortMOEventArrayByStartDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray sortMOEventArrayByEndDate](self, "sortMOEventArrayByEndDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
  v9 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v5, v8);

  return v9;
}

- (id)sortMOEventBundleArrayByStartDate
{
  id v3;
  void *v4;
  void *v5;
  id v7;

  v3 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v7 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray sortedArrayUsingDescriptors:](self, "sortedArrayUsingDescriptors:", v4));

  return v5;
}

- (id)sortMOEventBundleArrayByEndDate
{
  id v3;
  void *v4;
  void *v5;
  id v7;

  v3 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("endDate"), 1);
  v7 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray sortedArrayUsingDescriptors:](self, "sortedArrayUsingDescriptors:", v4));

  return v5;
}

- (id)getTimeSpanOfMOEventBundleArray
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray sortMOEventBundleArrayByStartDate](self, "sortMOEventBundleArrayByStartDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray sortMOEventBundleArrayByEndDate](self, "sortMOEventBundleArrayByEndDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endDate"));
  v9 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v5, v8);

  return v9;
}

- (id)sortBundlesByTimespan
{
  return -[NSArray sortedArrayUsingComparator:](self, "sortedArrayUsingComparator:", &__block_literal_global_33);
}

int64_t __46__NSArray_MOExtensions__sortBundlesByTimespan__block_invoke(id a1, MOEventBundle *a2, MOEventBundle *a3)
{
  MOEventBundle *v4;
  MOEventBundle *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  int64_t v18;
  void *v19;
  void *v20;

  v4 = a2;
  v5 = a3;
  v6 = objc_alloc((Class)NSDateInterval);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v4, "startDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v4, "endDate"));
  v9 = objc_msgSend(v6, "initWithStartDate:endDate:", v7, v8);
  objc_msgSend(v9, "duration");
  v11 = v10;

  v12 = objc_alloc((Class)NSDateInterval);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v5, "startDate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v5, "endDate"));
  v15 = objc_msgSend(v12, "initWithStartDate:endDate:", v13, v14);
  objc_msgSend(v15, "duration");
  v17 = v16;

  if (v11 >= v17)
  {
    if (v11 <= v17)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle bundleIdentifier](v4, "bundleIdentifier"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle bundleIdentifier](v5, "bundleIdentifier"));
      v18 = (int64_t)objc_msgSend(v19, "compare:", v20);

    }
    else
    {
      v18 = 1;
    }
  }
  else
  {
    v18 = -1;
  }

  return v18;
}

- (double)getTotalDurationOfMOEventBundleArray
{
  NSArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  double v6;
  void *i;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = self;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v9 = objc_alloc((Class)NSDateInterval);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate", (_QWORD)v15));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
        v12 = objc_msgSend(v9, "initWithStartDate:endDate:", v10, v11);
        objc_msgSend(v12, "duration");
        v6 = v6 + v13;

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

@end
