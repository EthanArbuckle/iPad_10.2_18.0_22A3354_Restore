@implementation _BCDragStoreURLProvider

- (_BCDragStoreURLProvider)initWithStoreID:(id)a3 contentType:(int64_t)a4 storeURL:(id)a5
{
  id v9;
  id v10;
  _BCDragStoreURLProvider *v11;
  _BCDragStoreURLProvider *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_BCDragStoreURLProvider;
  v11 = -[_BCDragStoreURLProvider init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_storeID, a3);
    v12->_contentType = a4;
    objc_storeStrong((id *)&v12->_storeURL, a5);
  }

  return v12;
}

- (void)_loadStoreURL:(id)a3
{
  id v4;
  void ***v5;
  void ***v6;
  NSURL *storeURL;
  int64_t contentType;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *storeID;
  id v14;
  void *v15;
  id v16;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  id v21;

  v17 = _NSConcreteStackBlock;
  v18 = 3221225472;
  v19 = sub_CBC24;
  v20 = &unk_290A20;
  v4 = a3;
  v21 = v4;
  v5 = objc_retainBlock(&v17);
  v6 = v5;
  storeURL = self->_storeURL;
  if (storeURL)
  {
    ((void (*)(void ***, NSURL *, _QWORD))v5[2])(v5, storeURL, 0);
  }
  else
  {
    contentType = self->_contentType;
    if (contentType == 1)
    {
      v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("https://books.apple.com/book/id%@"), self->_storeID, v17, v18, v19, v20);
    }
    else
    {
      if (contentType != 6)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[BCMBridgedCatalogService sharedInstance](BCMBridgedCatalogService, "sharedInstance"));
        storeID = self->_storeID;
        v14 = objc_alloc((Class)BFMRequestMetadata);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "BCDragRepresentationFactory.m", v17, v18, v19, v20));
        v16 = objc_msgSend(v14, "initWithFileID:line:", v15, 286);
        objc_msgSend(v12, "fetchStoreURLOfUnknownTypeForAdamID:metadata:completionHandler:", storeID, v16, v6);

        goto LABEL_9;
      }
      v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("https://books.apple.com/audiobook/id%@"), self->_storeID, v17, v18, v19, v20);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v10));
    ((void (*)(void ***, void *, _QWORD))v6[2])(v6, v11, 0);

  }
LABEL_9:

}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeURL, "identifier"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return (NSArray *)v3;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  id v14;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeURL, "identifier"));
  v9 = objc_msgSend(v8, "isEqualToString:", v6);

  if (v9)
  {
    -[_BCDragStoreURLProvider _loadStoreURL:](self, "_loadStoreURL:", v7);
  }
  else
  {
    if (v6)
    {
      v13 = CFSTR("typeIdentifier");
      v14 = v6;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    }
    else
    {
      v10 = 0;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3328, v10));
    v7[2](v7, 0, v11);

  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
}

@end
