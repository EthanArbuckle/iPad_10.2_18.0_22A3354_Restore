@implementation RUIContentRegistry

+ (_TtC8RemoteUI18RUIContentRegistry)sharedRegistry
{
  if (qword_2545BEDA8 != -1)
    swift_once();
  return (_TtC8RemoteUI18RUIContentRegistry *)(id)qword_2545BEDB0;
}

- (BOOL)supportsViewNamed:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8RemoteUI18RUIContentRegistry *v7;

  v4 = sub_209F672C4();
  v6 = v5;
  v7 = self;
  LOBYTE(v4) = sub_209EFFAF4(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (_TtC8RemoteUI18RUIContentRegistry)init
{
  _TtC8RemoteUI18RUIContentRegistry *result;

  result = (_TtC8RemoteUI18RUIContentRegistry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
