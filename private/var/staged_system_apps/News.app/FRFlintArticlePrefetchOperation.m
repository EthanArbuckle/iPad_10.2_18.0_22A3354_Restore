@implementation FRFlintArticlePrefetchOperation

- (id)executeWithArticleContentPool:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void ***v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  FRFlintArticlePrefetchOperation *v17;
  id v18;

  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_10006E3B0;
  v16 = &unk_1000DE590;
  v17 = self;
  v18 = a4;
  v6 = v18;
  v7 = a3;
  v8 = objc_retainBlock(&v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRArticlePrefetchOperation headline](self, "headline", v13, v14, v15, v16, v17));
  v10 = FCDispatchQueueForQualityOfService(9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v7, "fetchFlintDataProviderForHeadline:completionQueue:completionHandler:", v9, v11, v8);

  return self;
}

@end
