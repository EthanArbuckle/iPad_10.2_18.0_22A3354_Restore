@implementation TransitSchedulesHeadsignCellProvider

- (id)identifiersForDepartureSequences:(id)a3
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
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesHeadsignCellProvider _identifierForDepartureSequence:](self, "_identifierForDepartureSequence:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), (_QWORD)v14));
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

- (id)_identifierForDepartureSequence:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "headsign"));
  if (objc_msgSend(v4, "length"))
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "headsign"));
  else
    v5 = &stru_1011EB268;

  return v5;
}

- (void)registerCellsForCollectionView:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a3;
  v4 = objc_opt_class(TransitSchedulesHeadsignCollectionViewCell);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[TransitSchedulesHeadsignCollectionViewCell cellIdentifier](TransitSchedulesHeadsignCollectionViewCell, "cellIdentifier"));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", v4, v5);

}

- (void)collectionView:(id)a3 selectedHeadsignForDepartureSequence:(id)a4 atIndexPath:(id)a5
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

  objc_msgSend(v6, "selectItemAtIndexPath:animated:scrollPosition:", v7, 0, 16);
}

- (id)collectionView:(id)a3 headsignCellWithIdentifier:(id)a4 indexPath:(id)a5 dataProvider:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a6;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TransitSchedulesHeadsignCollectionViewCell cellIdentifier](TransitSchedulesHeadsignCollectionViewCell, "cellIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v9));

  v13 = objc_msgSend(v9, "row");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "departureSequences"));
  v15 = objc_msgSend(v14, "count");

  if (v13 < v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "departureSequences"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", v13));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "headsign"));
    objc_msgSend(v12, "setHeadsign:", v18);

  }
  return v12;
}

@end
