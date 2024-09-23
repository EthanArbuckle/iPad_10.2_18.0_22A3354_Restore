@implementation MPMediaQuery

+ (id)mt_allItemsForPodcastsApp
{
  return objc_msgSend(a1, "mt_allItemsForPodcastsAppWithAdditionalFilterPredicate:includePendingDeletions:disableSystemPredicates:", 0, 0, 0);
}

+ (id)mt_allItemsForPodcastsAppWithAdditionalFilterPredicate:(id)a3 disableSystemPredicates:(BOOL)a4
{
  return objc_msgSend(a1, "mt_allItemsForPodcastsAppWithAdditionalFilterPredicate:includePendingDeletions:disableSystemPredicates:", a3, 0, a4);
}

+ (id)mt_allItemsForPodcastsAppWithAdditionalFilterPredicate:(id)a3 includePendingDeletions:(BOOL)a4 disableSystemPredicates:(BOOL)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  BOOL v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  void *v23;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery mt_podcastsQuery](MPMediaQuery, "mt_podcastsQuery"));
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "addFilterPredicate:", v6);
  v23 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery mt_iTunesUQuery](MPMediaQuery, "mt_iTunesUQuery"));
  v11 = v10;
  if (v6)
    objc_msgSend(v10, "addFilterPredicate:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "arrayByAddingObject:", v11));

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_100004E54;
  v21 = sub_100004E64;
  v22 = &__NSArray0__struct;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100004E6C;
  v15[3] = &unk_1000083F8;
  v16 = a5;
  v15[4] = &v17;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v15);
  v13 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v13;
}

+ (id)mt_podcastsQuery
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery podcastsQuery](MPMediaQuery, "podcastsQuery"));
  objc_msgSend(v2, "setGroupingType:", 6);
  return v2;
}

+ (id)mt_iTunesUQuery
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init((Class)MPMediaQuery);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 4104));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v3, MPMediaItemPropertyMediaType));
  objc_msgSend(v2, "addFilterPredicate:", v4);

  objc_msgSend(v2, "setGroupingType:", 1);
  return v2;
}

@end
