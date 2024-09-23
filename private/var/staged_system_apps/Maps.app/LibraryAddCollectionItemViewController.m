@implementation LibraryAddCollectionItemViewController

- (NSString)headerTitle
{
  uint64_t v2;
  _TtC4Maps38LibraryAddCollectionItemViewController *v3;
  Swift::String v4;
  Swift::String v5;
  void *object;
  NSString v7;
  Swift::String v9;

  v2 = qword_101490ED0;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_101490ED0, sub_10011833C);
  v9._countAndFlagsBits = 0xD00000000000002BLL;
  v9._object = (void *)0x8000000100E43660;
  v4._object = (void *)0x8000000100E43640;
  v4._countAndFlagsBits = 0xD000000000000018;
  v5._countAndFlagsBits = 0x4C206F7420646441;
  v5._object = (void *)0xEE00797261726269;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v4, (Swift::String_optional)0, (NSBundle)qword_1014D4B80, v5, v9)._object;

  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  return (NSString *)v7;
}

- (int)requestSource
{
  return 22;
}

- (BOOL)searchDataSource:(id)a3 shouldFilterItem:(id)a4
{
  id v7;
  _TtC4Maps38LibraryAddCollectionItemViewController *v8;
  id v9;
  _TtC4Maps38LibraryAddCollectionItemViewController *v10;
  char v11;
  _OWORD v13[2];

  if (a4)
  {
    v7 = a3;
    v8 = self;
    swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v13);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    v9 = a3;
    v10 = self;
  }
  v11 = sub_10003F400((uint64_t)a3, (uint64_t)v13);

  sub_10000C180((uint64_t)v13);
  return v11 & 1;
}

- (void)saveMapItem:(id)a3
{
  id v4;
  _TtC4Maps38LibraryAddCollectionItemViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10003F650(v4);

}

- (_TtC4Maps38LibraryAddCollectionItemViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC4Maps38LibraryAddCollectionItemViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for LibraryAddCollectionItemViewController();
  v11 = -[AddFromACViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC4Maps38LibraryAddCollectionItemViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LibraryAddCollectionItemViewController();
  return -[LibraryAddCollectionItemViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
