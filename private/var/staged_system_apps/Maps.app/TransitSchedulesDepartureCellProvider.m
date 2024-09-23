@implementation TransitSchedulesDepartureCellProvider

- (id)identifiersForDepartures:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureCellProvider _identifierForDeparture:](self, "_identifierForDeparture:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), (_QWORD)v14));
        objc_msgSend(v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = objc_msgSend(v5, "copy");
  return v12;
}

- (id)_identifierForDeparture:(id)a3
{
  id v3;
  uint64_t v4;
  __CFString *v5;
  id v6;
  const __CFString *v7;
  void *v8;

  v3 = a3;
  if ((char *)objc_msgSend(v3, "liveStatus") - 1 > (char *)1)
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheduledDepartureDate"));
  else
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "liveDepartureDate"));
  v5 = (__CFString *)v4;
  v6 = objc_msgSend(v3, "tripIdentifier");

  v7 = CFSTR("NA");
  if (v5)
    v7 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu_%@"), v6, v7));

  return v8;
}

- (void)registerCellsForCollectionView:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(TransitSchedulesDepartureCollectionViewCell), CFSTR("TransitSchedulesDepartureCollectionCellIdentifier"));

}

- (void)collectionView:(id)a3 selectedDeparture:(id)a4 atIndexPath:(id)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  v7 = a5;
  v8 = objc_msgSend(v7, "section");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathsForSelectedItems", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v14, "section") == v8)
          objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v14, 0);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  objc_msgSend(v6, "selectItemAtIndexPath:animated:scrollPosition:", v7, 0, 0);
}

- (id)collectionView:(id)a3 departureCellWithIdentifier:(id)a4 indexPath:(id)a5 referenceDate:(id)a6 dataProvider:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v10 = a6;
  v11 = a7;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("TransitSchedulesDepartureCollectionCellIdentifier"), v12));
  v14 = objc_msgSend(v12, "row");

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "departures"));
  v16 = objc_msgSend(v15, "count");

  if (v14 < v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "departures"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v14));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "timeZone"));
    objc_msgSend(v13, "setDeparture:withReferenceDate:timeZone:timeDisplayStyle:", v18, v10, v19, objc_msgSend(v11, "timeDisplayStyle"));

  }
  return v13;
}

@end
