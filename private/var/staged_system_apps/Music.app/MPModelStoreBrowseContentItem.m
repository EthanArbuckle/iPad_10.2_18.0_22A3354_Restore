@implementation MPModelStoreBrowseContentItem

- (MPModelObject)innermostModelObject
{
  MPModelStoreBrowseContentItem *v2;
  id v3;
  void *v4;
  MPModelStoreBrowseContentItem *v5;

  v2 = self;
  v3 = -[MPModelStoreBrowseContentItem innerObject](v2, "innerObject");
  if (v3)
  {
    v4 = v3;
    v5 = (MPModelStoreBrowseContentItem *)objc_msgSend(v3, "innermostModelObject");

    v2 = v5;
  }
  return v2;
}

@end
