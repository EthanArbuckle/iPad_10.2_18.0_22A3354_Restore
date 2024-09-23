@implementation UniversalMetricsDictionary

- (NSDictionary)dictionary
{
  _TtC8ShelfKit26UniversalMetricsDictionary *v2;
  Class isa;

  v2 = self;
  UniversalMetricsDictionary.dictionary.getter();

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)isa;
}

- (_TtC8ShelfKit26UniversalMetricsDictionary)init
{
  objc_class *ObjectType;
  _TtC8ShelfKit26UniversalMetricsDictionary *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  double *v11;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = sub_157B30();
  v7 = v6;
  v9 = v8;
  v10 = (objc_class *)objc_msgSend((id)objc_opt_self(ACAccountStore), "ams_sharedAccountStore");
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC8ShelfKit26UniversalMetricsDictionary_accountStore) = v10;
  v11 = (double *)((char *)v4 + OBJC_IVAR____TtC8ShelfKit26UniversalMetricsDictionary_screenSize);
  *v11 = v5;
  *((_QWORD *)v11 + 1) = v7;
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC8ShelfKit26UniversalMetricsDictionary_screenScale) = v9;

  v13.receiver = v4;
  v13.super_class = ObjectType;
  return -[UniversalMetricsDictionary init](&v13, "init");
}

- (void).cxx_destruct
{

}

@end
