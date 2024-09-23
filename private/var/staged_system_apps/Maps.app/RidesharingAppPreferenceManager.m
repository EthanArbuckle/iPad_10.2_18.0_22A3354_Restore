@implementation RidesharingAppPreferenceManager

+ (id)sortedRideOptionStatuses:(id)a3 withStoreOrdering:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_lastSelectionDates"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1004F60E8;
  v18[3] = &unk_1011B9468;
  v19 = objc_alloc_init((Class)NSMutableDictionary);
  v20 = v6;
  v9 = v6;
  v10 = v19;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1004F6270;
  v15[3] = &unk_1011B9490;
  v16 = v8;
  v17 = objc_retainBlock(v18);
  v11 = v17;
  v12 = v8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingComparator:", v15));

  return v13;
}

+ (void)recordAppSelection:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  if (v8)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_lastSelectionDates"));
    v5 = objc_msgSend(v4, "mutableCopy");

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, v8);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v7, "setObject:forKey:", v5, CFSTR("kLastRidesharingAppSelectionKey"));

  }
}

+ (void)recordRideChoice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "application"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  if (v10 && objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "preferredRideChoiceNamesByAppIdentifier"));
    v8 = objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("kRidesharingAppPreferenceRideChoiceKey"));

  }
}

+ (id)preferredRideChoiceNamesByAppIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dictionaryForKey:", CFSTR("kRidesharingAppPreferenceRideChoiceKey")));
  v4 = v3;
  if (!v3)
    v3 = &__NSDictionary0__struct;
  v5 = v3;

  return v5;
}

+ (void)removeRecordedAppSelectionForAppIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_lastSelectionDates"));
  v6 = objc_msgSend(v5, "mutableCopy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "preferredRideChoiceNamesByAppIdentifier"));
  v8 = objc_msgSend(v7, "mutableCopy");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "removeObjectForKey:", v14, (_QWORD)v16);
        objc_msgSend(v8, "removeObjectForKey:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v15, "setObject:forKey:", v6, CFSTR("kLastRidesharingAppSelectionKey"));

}

+ (id)mostRecentSelectedAppIdentifers
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_lastSelectionDates"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allKeys"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1004F6860;
  v7[3] = &unk_1011B94B8;
  v8 = v2;
  v4 = v2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedArrayUsingComparator:", v7));

  return v5;
}

+ (id)_lastSelectionDates
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dictionaryForKey:", CFSTR("kLastRidesharingAppSelectionKey")));
  v4 = v3;
  if (!v3)
    v3 = &__NSDictionary0__struct;
  v5 = v3;

  return v5;
}

@end
