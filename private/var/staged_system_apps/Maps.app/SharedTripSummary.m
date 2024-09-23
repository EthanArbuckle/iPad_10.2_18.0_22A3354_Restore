@implementation SharedTripSummary

- (void)updateModel:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSummary title](self, "title"));
  objc_msgSend(v4, "setFirstLine:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[SharedTripSummary subtitle](self, "subtitle"));
  objc_msgSend(v4, "setSecondLine:", v6);

}

+ (id)summaryWithSharedTrips:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setSharedTrips:", v4);

  return v5;
}

- (NSString)title
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSummary sharedTrips](self, "sharedTrips"));
  v4 = objc_msgSend(v3, "count");

  if (v4 == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSummary sharedTrips](self, "sharedTrips"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "homeCellTitle"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Shared Trip Format [Cell, Title]"), CFSTR("localized string not found"), 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSummary sharedTrips](self, "sharedTrips"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, objc_msgSend(v9, "count")));

  }
  return (NSString *)v7;
}

- (NSString)subtitle
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSString *v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSummary sharedTrips](self, "sharedTrips"));
  v4 = objc_msgSend(v3, "count");

  if (v4 == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSummary sharedTrips](self, "sharedTrips"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "homeCellSubtitle"));
    return (NSString *)v7;
  }
  else
  {
    v9 = objc_alloc((Class)NSMutableArray);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSummary sharedTrips](self, "sharedTrips"));
    v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

    v12 = objc_alloc((Class)NSMutableSet);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSummary sharedTrips](self, "sharedTrips"));
    v14 = objc_msgSend(v12, "initWithCapacity:", objc_msgSend(v13, "count"));

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSummary sharedTrips](self, "sharedTrips"));
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "senderInfo"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "fromIdentifier"));

          if ((objc_msgSend(v14, "containsObject:", v22) & 1) == 0)
          {
            objc_msgSend(v14, "addObject:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "senderInfo"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localName"));
            objc_msgSend(v11, "addObject:", v24);

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v17);
    }

    v25 = objc_msgSend(v11, "count");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = v26;
    if (v25 == (id)1)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Shared Trips Cell Subtitle Format String (one sender, multiple routes)"), CFSTR("localized string not found"), 0));

      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
      v30 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v28, v4, v29);
    }
    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Shared Trips Cell Subtitle Format String (multiple sender, multiple routes)"), CFSTR("localized string not found"), 0));

      v31 = objc_msgSend(v11, "count") - 1;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
      v30 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v28, v31, v29);
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(v30);

    return (NSString *)v32;
  }
}

- (NSArray)sharedTrips
{
  return self->_sharedTrips;
}

- (void)setSharedTrips:(id)a3
{
  objc_storeStrong((id *)&self->_sharedTrips, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedTrips, 0);
}

- (id)_transportTypeStringForAnalytics
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSummary sharedTrips](self, "sharedTrips"));
  v3 = sub_10039DCD4(v2, &stru_1011BE980);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", CFSTR(",")));
  return v5;
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripSummary sharedTrips](self, "sharedTrips"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", CFSTR("groupIdentifier")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SharedTripSummary-%@"), v3));

  return (NSString *)v4;
}

@end
