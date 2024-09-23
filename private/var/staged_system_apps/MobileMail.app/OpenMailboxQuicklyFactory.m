@implementation OpenMailboxQuicklyFactory

+ (id)createOpenMailboxQuicklyViewControllerWithFavoritesManager:(id)a3 delegate:(id)a4
{
  id v4;
  id v9;

  swift_getObjCClassMetadata(a1);
  v4 = a3;
  swift_unknownObjectRetain(a4);
  swift_getObjCClassMetadata(a1);
  v9 = static OpenMailboxQuicklyFactory.createOpenMailboxQuicklyViewController(with:delegate:)((uint64_t)a3, (uint64_t)a4);
  swift_unknownObjectRelease();

  return v9;
}

+ (id)createOpenMailboxQuicklyItemWithFavoriteItem:(id)a3
{
  id v3;
  id v7;

  swift_getObjCClassMetadata(a1);
  v3 = a3;
  swift_getObjCClassMetadata(a1);
  v7 = static OpenMailboxQuicklyFactory.createOpenMailboxQuicklyItem(with:)(a3);

  return v7;
}

- (_TtC10MobileMail25OpenMailboxQuicklyFactory)init
{
  return (_TtC10MobileMail25OpenMailboxQuicklyFactory *)OpenMailboxQuicklyFactory.init()();
}

@end
