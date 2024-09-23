@implementation MTMediaLibraryRestorePostflightUtil

+ (id)downloadCandidateMediaItems
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &__kCFBooleanFalse, MPMediaItemPropertyIsLocal));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &__kCFBooleanFalse, MPMediaItemPropertyNeedsRestore));
  v4 = MPMediaEntityPropertyKeepLocal;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &off_1004D5CE0, MPMediaEntityPropertyKeepLocal));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &off_1004D5CF8, v4));
  v16[0] = v5;
  v16[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaCompoundAnyPredicate predicateMatchingPredicates:](MPMediaCompoundAnyPredicate, "predicateMatchingPredicates:", v7));

  v15[0] = v2;
  v15[1] = v3;
  v15[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaCompoundAllPredicate predicateMatchingPredicates:](MPMediaCompoundAllPredicate, "predicateMatchingPredicates:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery mt_allItemsForPodcastsAppWithAdditionalFilterPredicate:disableSystemPredicates:](MPMediaQuery, "mt_allItemsForPodcastsAppWithAdditionalFilterPredicate:disableSystemPredicates:", v10, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectsPassingTest:", &stru_1004A8740));

  return v13;
}

+ (id)postRestoreCandidateMediaItems
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &__kCFBooleanFalse, MPMediaItemPropertyIsLocal));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &__kCFBooleanFalse, MPMediaItemPropertyNeedsRestore));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &off_1004D5CF8, MPMediaEntityPropertyKeepLocal));
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaCompoundAllPredicate predicateMatchingPredicates:](MPMediaCompoundAllPredicate, "predicateMatchingPredicates:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery mt_allItemsForPodcastsAppWithAdditionalFilterPredicate:disableSystemPredicates:](MPMediaQuery, "mt_allItemsForPodcastsAppWithAdditionalFilterPredicate:disableSystemPredicates:", v6, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));

  return v8;
}

+ (id)uuidsByRemovingDownloadCandidatesFromEpisodeUuids:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = sub_1000466BC;
    v23 = sub_1000469D4;
    v5 = v4;
    v24 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "downloadCandidateMediaItems"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mt_compactMap:", &stru_1004A8760));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mainOrPrivateContext"));

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10008BCA4;
    v14[3] = &unk_1004A87F0;
    v18 = &v19;
    v15 = v5;
    v10 = v9;
    v16 = v10;
    v11 = v7;
    v17 = v11;
    objc_msgSend(v10, "performBlockAndWait:", v14);
    v12 = (id)v20[5];

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v12 = v4;
  }

  return v12;
}

@end
