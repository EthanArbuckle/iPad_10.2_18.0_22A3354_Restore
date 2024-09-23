@implementation MPMediaQuery

+ (id)mt_allItemsForPodcastsApp
{
  return _objc_msgSend(a1, "mt_allItemsForPodcastsAppWithAdditionalFilterPredicate:includePendingDeletions:disableSystemPredicates:", 0, 0, 0);
}

+ (id)mt_allItemsForPodcastsAppWithAdditionalFilterPredicate:(id)a3 disableSystemPredicates:(BOOL)a4
{
  return _objc_msgSend(a1, "mt_allItemsForPodcastsAppWithAdditionalFilterPredicate:includePendingDeletions:disableSystemPredicates:", a3, 0, a4);
}

+ (id)mt_allItemsForPodcastsAppWithAdditionalFilterPredicate:(id)a3 includePendingDeletions:(BOOL)a4 disableSystemPredicates:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  BOOL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  void *v26;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery mt_podcastsQuery](MPMediaQuery, "mt_podcastsQuery"));
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "addFilterPredicate:", v7);
  v26 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery mt_iTunesUQuery](MPMediaQuery, "mt_iTunesUQuery"));
  v12 = v11;
  if (v7)
    objc_msgSend(v11, "addFilterPredicate:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "arrayByAddingObject:", v12));

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1000465B4;
  v24 = sub_10004695C;
  v25 = &__NSArray0__struct;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10005AAC4;
  v18[3] = &unk_1004A6E58;
  v19 = a5;
  v18[4] = &v20;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v18);
  if (!a4)
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v21[5], "mt_filter:", &stru_1004A6E98));
    v15 = (void *)v21[5];
    v21[5] = v14;

  }
  v16 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v16;
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
