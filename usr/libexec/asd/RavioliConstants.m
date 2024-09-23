@implementation RavioliConstants

+ (NSUUID)ravioliUUID
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  Class isa;
  uint64_t v8;

  v2 = type metadata accessor for UUID(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static RavioliConstants.ravioliUUID.getter((uint64_t)v5);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSUUID *)isa;
}

- (_TtC3asd16RavioliConstants)init
{
  return (_TtC3asd16RavioliConstants *)ASBackgroundActivityManager.init()();
}

@end
