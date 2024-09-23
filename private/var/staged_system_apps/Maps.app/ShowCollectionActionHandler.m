@implementation ShowCollectionActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  v6 = objc_opt_class(ShowCollectionAction);
  if ((objc_opt_isKindOfClass(v10, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "collectionStorage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionHandler collectionWithStorage:](CollectionHandler, "collectionWithStorage:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appCoordinator"));
    objc_msgSend(v9, "openCollection:", v8);

  }
}

@end
