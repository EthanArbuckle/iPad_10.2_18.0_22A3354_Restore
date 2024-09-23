@implementation BKMusicLibraryUtilities

+ (void)storeIDsWithNonEmptyPurchasedToken:(id)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  _QWORD v26[3];

  v17 = a3;
  v16 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", ML3TrackPropertyPurchaseHistoryID, &off_10092EF28, 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ML3ComparisonPredicate predicateWithProperty:value:comparison:](ML3ComparisonPredicate, "predicateWithProperty:value:comparison:", ML3TrackPropertyPurchaseHistoryToken, &off_10092EF28, 2));
  v7 = ML3TrackPropertyStoreItemID;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ML3ContainsPredicate predicateWithProperty:valueSet:](ML3ContainsPredicate, "predicateWithProperty:valueSet:", ML3TrackPropertyStoreItemID, v17));
  v26[0] = v5;
  v26[1] = v6;
  v26[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ML3AllCompoundPredicate predicateMatchingPredicates:](ML3AllCompoundPredicate, "predicateMatchingPredicates:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ML3MusicLibrary autoupdatingSharedLibrary](ML3MusicLibrary, "autoupdatingSharedLibrary"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ML3Track queryWithLibrary:predicate:](ML3Track, "queryWithLibrary:predicate:", v11, v10));
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_10004E4B8;
  v23 = sub_10004E2D0;
  v24 = objc_alloc_init((Class)NSMutableSet);
  v25 = v7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10018CF0C;
  v18[3] = &unk_1008ED708;
  v18[4] = &v19;
  objc_msgSend(v12, "enumeratePersistentIDsAndProperties:ordered:usingBlock:", v13, 1, v18);

  v14 = objc_retainBlock(v16);
  v15 = v14;
  if (v14)
    (*((void (**)(id, uint64_t, uint64_t))v14 + 2))(v14, v20[5], 1);

  _Block_object_dispose(&v19, 8);
}

@end
