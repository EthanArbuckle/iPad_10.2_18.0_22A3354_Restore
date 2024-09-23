@implementation GeoPlaceCacheDetailTableViewController

- (GeoPlaceCacheDetailTableViewController)initWithGEORequestCounterCacheResults:(id)a3
{
  id v4;
  GeoPlaceCacheDetailTableViewController *v5;
  uint64_t v6;
  NSOrderedSet *displayOrder;
  void *i;
  void *v9;
  id v10;
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSDictionary *v20;
  NSDictionary *totalsDict;
  void *v22;
  void *v23;
  void *v24;
  GeoPlaceCacheDetailTableViewController *v26;
  id v27;
  id obj;
  uint64_t v29;
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _QWORD v37[3];
  _QWORD v38[3];
  _BYTE v39[128];

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)GeoPlaceCacheDetailTableViewController;
  v5 = -[GeoPlaceCacheDetailTableViewController initWithStyle:](&v36, "initWithStyle:", 1);
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", &off_101273B18));
    displayOrder = v5->_displayOrder;
    v26 = v5;
    v5->_displayOrder = (NSOrderedSet *)v6;

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v27 = v4;
    obj = v4;
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    if (v30)
    {
      v29 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v29)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          v10 = objc_msgSend(v9, "requestType");
          if (v10 >= 0x3F)
            v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v10));
          else
            v11 = off_1011C0FB8[(int)v10];
          v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", v11));
          if (!v12)
          {
            v37[0] = &off_10126E878;
            v37[1] = &off_10126E890;
            v38[0] = &off_10126E8C0;
            v38[1] = &off_10126E8C0;
            v37[2] = &off_10126E8A8;
            v38[2] = &off_10126E8C0;
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 3));
            v12 = objc_msgSend(v13, "mutableCopy");

            objc_msgSend(v31, "setObject:forKeyedSubscript:", v12, v11);
          }
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", &off_10126E878));
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)objc_msgSend(v14, "unsignedIntegerValue")+ objc_msgSend(v9, "cacheHitCount")));
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, &off_10126E878);

          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", &off_10126E890));
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)objc_msgSend(v16, "unsignedIntegerValue")+ objc_msgSend(v9, "cacheMissCount")));
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, &off_10126E890);

          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", &off_10126E8A8));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)objc_msgSend(v18, "unsignedIntegerValue")+ objc_msgSend(v9, "cacheExpiredCount")));
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, &off_10126E8A8);

        }
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
      }
      while (v30);
    }

    v20 = (NSDictionary *)objc_msgSend(v31, "copy");
    v5 = v26;
    totalsDict = v26->_totalsDict;
    v26->_totalsDict = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "allKeys"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sortedArrayUsingSelector:", "compare:"));

    if (v23)
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v23));
    else
      v24 = 0;
    objc_storeStrong((id *)&v26->_orderedKeys, v24);
    v4 = v27;
    if (v23)

  }
  return v5;
}

- (id)_totalsForSection:(int64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSOrderedSet objectAtIndexedSubscript:](self->_orderedKeys, "objectAtIndexedSubscript:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_totalsDict, "objectForKeyedSubscript:", v4));

  return v5;
}

- (id)_nonZeroTotalsForSection:(int64_t)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v5 = -[NSOrderedSet mutableCopy](self->_displayOrder, "mutableCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GeoPlaceCacheDetailTableViewController _totalsForSection:](self, "_totalsForSection:", a3));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1007000BC;
  v9[3] = &unk_1011C0F98;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSOrderedSet count](self->_orderedKeys, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GeoPlaceCacheDetailTableViewController _nonZeroTotalsForSection:](self, "_nonZeroTotalsForSection:", a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return -[NSOrderedSet objectAtIndexedSubscript:](self->_orderedKeys, "objectAtIndexedSubscript:", a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  unsigned __int8 v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("reuseIdentifier")));
  if (!v7)
    v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 1, CFSTR("reuseIdentifier"));
  objc_msgSend(v7, "setSelectionStyle:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GeoPlaceCacheDetailTableViewController _nonZeroTotalsForSection:](self, "_nonZeroTotalsForSection:", objc_msgSend(v6, "section")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
  v10 = 0;
  v11 = objc_msgSend(v9, "unsignedIntegerValue") - 1;
  if (v11 <= 2u)
    v10 = off_1011C11B0[(char)v11];
  v12 = objc_msgSend(v6, "section");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GeoPlaceCacheDetailTableViewController _totalsForSection:](self, "_totalsForSection:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v9));
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  objc_msgSend(v16, "setText:", v10);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), v15));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detailTextLabel"));
  objc_msgSend(v18, "setText:", v17);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedKeys, 0);
  objc_storeStrong((id *)&self->_totalsDict, 0);
  objc_storeStrong((id *)&self->_displayOrder, 0);
}

@end
