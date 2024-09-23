@implementation CuratedCollectionURLActivityProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  void *v5;

  if ((objc_msgSend(a4, "isEqualToString:", UIActivityTypeMail) & 1) != 0)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionActivityProvider url](self, "url"));
  return v5;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  return 0;
}

@end
