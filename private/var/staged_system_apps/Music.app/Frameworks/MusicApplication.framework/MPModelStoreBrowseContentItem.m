@implementation MPModelStoreBrowseContentItem

- (id)storeContentItemObject
{
  MPModelStoreBrowseContentItem *v2;
  id v3;

  v2 = self;
  v3 = sub_5CC848();

  return v3;
}

- (id)storeContentItemObjectPropertiesFor:(id)a3
{
  id v4;
  MPModelStoreBrowseContentItem *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_5CC8D0(v4);

  return v6;
}

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
