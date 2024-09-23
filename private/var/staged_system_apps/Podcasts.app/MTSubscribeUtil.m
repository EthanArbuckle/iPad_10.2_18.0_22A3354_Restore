@implementation MTSubscribeUtil

+ (BOOL)isSubscribedToPodcastWithUuid:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mainOrPrivateContext"));

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100050918;
    v9[3] = &unk_1004A6690;
    v10 = v3;
    v6 = v5;
    v11 = v6;
    v12 = &v13;
    objc_msgSend(v6, "performBlockAndWait:", v9);
    v7 = *((_BYTE *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isSubscribedToPodcastWithFeedUrl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOrPrivateContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast podcastUuidForFeedUrlString:ctx:](MTPodcast, "podcastUuidForFeedUrlString:ctx:", v4, v6));

    v8 = objc_msgSend(a1, "isSubscribedToPodcastWithUuid:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isSubscribedToPodcastWithStorePlatformDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_identifierForDictionary:", v4));
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mainOrPrivateContext"));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100050B80;
  v11[3] = &unk_1004A6690;
  v8 = v5;
  v12 = v8;
  v9 = v7;
  v13 = v9;
  v14 = &v15;
  objc_msgSend(v9, "performBlockAndWait:", v11);
  LOBYTE(v6) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v6;
}

+ (void)subscribeToPodcastWithFeedUrl:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _BOOL8 v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v5 = a3;
  v6 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mainOrPrivateContext"));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100050E0C;
  v15[3] = &unk_1004A66B8;
  v9 = v5;
  v16 = v9;
  v10 = v8;
  v17 = v10;
  v18 = &v24;
  v19 = &v20;
  objc_msgSend(v10, "performBlockAndWait:", v15);
  if (!*((_BYTE *)v25 + 24))
  {
    if (objc_msgSend(v9, "length"))
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100050F18;
      v12[3] = &unk_1004A63C8;
      v13 = v9;
      v14 = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);

      goto LABEL_7;
    }
    if (!v6)
      goto LABEL_7;
    v11 = 0;
    goto LABEL_4;
  }
  if (v6)
  {
    v11 = *((_BYTE *)v21 + 24) == 0;
LABEL_4:
    (*((void (**)(id, _BOOL8))v6 + 2))(v6, v11);
  }
LABEL_7:

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

}

+ (void)subscribeToPodcastWithAdamID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  MTAddPodcastParams *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(MTAddPodcastParams);
  v8 = objc_msgSend(v6, "longLongValue");

  -[MTAddPodcastParams setStoreCollectionId:](v7, "setStoreCollectionId:", v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000510D8;
  v11[3] = &unk_1004A66E0;
  v12 = v5;
  v9 = v5;
  -[MTAddPodcastParams setCompletion:](v7, "setCompletion:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTSubscriptionManager sharedInstance](MTSubscriptionManager, "sharedInstance"));
  objc_msgSend(v10, "subscribeToPodcastWithParams:", v7);

}

+ (void)subscribeToPodcastWithStorePlatformDictionary:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _BOOL8 v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTSubscribeUtil _identifierForDictionary:](MTSubscribeUtil, "_identifierForDictionary:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isNotSubscribeable")));
  v9 = objc_msgSend(v8, "BOOLValue");

  if (!v9)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mainOrPrivateContext"));

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100051360;
    v20[3] = &unk_1004A66B8;
    v12 = v7;
    v21 = v12;
    v13 = v11;
    v22 = v13;
    v23 = &v29;
    v24 = &v25;
    objc_msgSend(v13, "performBlockAndWait:", v20);
    if (*((_BYTE *)v30 + 24))
    {
      if (!v6)
      {
LABEL_10:

        _Block_object_dispose(&v25, 8);
        _Block_object_dispose(&v29, 8);
        goto LABEL_11;
      }
      v14 = *((_BYTE *)v26 + 24) == 0;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "feedUrl"));
      v16 = objc_msgSend(v15, "length");

      if (v16)
      {
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10005146C;
        v17[3] = &unk_1004A63C8;
        v18 = v12;
        v19 = v6;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v17);

        goto LABEL_10;
      }
      if (!v6)
        goto LABEL_10;
      v14 = 0;
    }
    (*((void (**)(id, _BOOL8))v6 + 2))(v6, v14);
    goto LABEL_10;
  }
  if (v6)
    (*((void (**)(id, _QWORD, uint64_t))v6 + 2))(v6, 0, 3);
LABEL_11:

}

+ (void)unsubscribeToPodcastWithStorePlatformDictionary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_identifierForDictionary:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "privateQueueContext"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005164C;
  v8[3] = &unk_1004A6640;
  v9 = v3;
  v10 = v5;
  v6 = v5;
  v7 = v3;
  objc_msgSend(v6, "performBlockAndWait:", v8);

}

+ (id)_identifierForDictionary:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", AMSLookupPropertyItemIdentifier));
  v5 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v6, "longLongValue")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
    v9 = objc_msgSend(v8, "isEqualToString:", v6);

    v4 = v6;
    if (v9)
    {
      v4 = v7;

    }
  }
  v10 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v4, v10) & 1) == 0)
  {

    v4 = 0;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("feedUrl")));
  v12 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
  {

    v11 = 0;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTStoreIdentifier identifierWithFeedUrl:storeIdentifier:](MTStoreIdentifier, "identifierWithFeedUrl:storeIdentifier:", v11, v4));

  return v13;
}

@end
