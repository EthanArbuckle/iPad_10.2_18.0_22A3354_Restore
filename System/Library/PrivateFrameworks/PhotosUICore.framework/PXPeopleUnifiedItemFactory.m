@implementation PXPeopleUnifiedItemFactory

+ (id)itemWithPerson:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)sub_1A6DE97B8((uint64_t)v3, 0);

  return v4;
}

+ (id)itemWithSocialGroup:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)sub_1A6DE9940((uint64_t)v3, 0);

  return v4;
}

- (_TtC12PhotosUICore26PXPeopleUnifiedItemFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PXPeopleUnifiedItemFactory();
  return -[PXPeopleUnifiedItemFactory init](&v3, sel_init);
}

@end
