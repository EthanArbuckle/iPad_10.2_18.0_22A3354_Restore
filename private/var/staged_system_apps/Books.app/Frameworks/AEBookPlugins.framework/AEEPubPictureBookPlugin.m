@implementation AEEPubPictureBookPlugin

- (AEEPubPictureBookPlugin)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AEEPubPictureBookPlugin;
  return -[AEEPubPictureBookPlugin init](&v3, "init");
}

+ (id)associatedAssetType
{
  return CFSTR("application/ePubPictureBook");
}

- (id)associatedAssetType
{
  return CFSTR("application/ePubPictureBook");
}

- (id)helperForURL:(id)a3 withOptions:(id)a4
{
  id v5;
  AEEPubPictureBookHelper *v6;

  v5 = a3;
  v6 = -[AEEPubPictureBookHelper initWithDelegate:forURL:]([AEEPubPictureBookHelper alloc], "initWithDelegate:forURL:", self, v5);

  return v6;
}

- (id)newViewControllerForAEBookInfo:(id)a3 storeID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  BKPictureBookViewController *v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isFixedLayout"))
  {
    +[BKEpubBookParser recomputeFixedLayoutDimensionsForBook:](BKEpubBookParser, "recomputeFixedLayoutDimensionsForBook:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "managedObjectContext"));
    v8 = objc_msgSend(v7, "hasChanges");

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "managedObjectContext"));
      objc_msgSend(v9, "save:", 0);

    }
    v10 = -[BKPictureBookViewController initWithBook:storeID:]([BKPictureBookViewController alloc], "initWithBook:storeID:", v5, v6);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
