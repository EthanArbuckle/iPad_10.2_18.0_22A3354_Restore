@implementation IndexRequestHandler

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  void (**v5)(_QWORD);
  void *v6;
  id v7;

  v7 = a3;
  v5 = (void (**)(_QWORD))a4;
  if (+[MTDB canExtensionOpenDatabase](MTDB, "canExtensionOpenDatabase"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTCoreSpotlightController sharedInstance](MTCoreSpotlightController, "sharedInstance"));
    objc_msgSend(v6, "searchableIndex:reindexAllSearchableItemsWithAcknowledgementHandler:", v7, v5);

  }
  else
  {
    v5[2](v5);
  }

}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  if (+[MTDB canExtensionOpenDatabase](MTDB, "canExtensionOpenDatabase"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTCoreSpotlightController sharedInstance](MTCoreSpotlightController, "sharedInstance"));
    objc_msgSend(v9, "searchableIndex:reindexSearchableItemsWithIdentifiers:acknowledgementHandler:", v10, v7, v8);

  }
  else
  {
    v8[2](v8);
  }

}

@end
