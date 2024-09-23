@implementation CollectionURLActivityProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  void *v5;
  void *v6;

  if ((objc_msgSend(a4, "isEqualToString:", UIActivityTypeMail) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionActivityProvider collectionInfo](self, "collectionInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sharingURL"));

  }
  return v5;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionActivityProvider collectionInfo](self, "collectionInfo", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sharingURL"));

  return v4;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionActivityProvider collectionInfo](self, "collectionInfo", a3, a4, a5.width, a5.height));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "image"));

  return v6;
}

@end
