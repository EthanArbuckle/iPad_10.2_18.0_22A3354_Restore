@implementation FMPeopleSuggester

- (_TtC6FindMy17FMPeopleSuggester)init
{
  return (_TtC6FindMy17FMPeopleSuggester *)sub_100270F04();
}

- (NSString)description
{
  _TtC6FindMy17FMPeopleSuggester *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  String.init(format:_:)(0xD000000000000013, 0x80000001004B8D40, &_swiftEmptyArrayStorage);
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (void)dealloc
{
  void *v3;
  _TtC6FindMy17FMPeopleSuggester *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  objc_msgSend(v5, "removeObserver:name:object:", v4, CNContactStoreDidChangeNotification, 0);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for FMPeopleSuggester();
  -[FMPeopleSuggester dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{

}

@end
