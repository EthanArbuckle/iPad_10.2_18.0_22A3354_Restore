@implementation AppEventObserver

- (void)dealloc
{
  uint64_t v2;

  sub_1C13C9B04((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC11SessionCore16AppEventObserver_applicationWorkspace, (SEL *)&selRef_removeObserver_, v2, (uint64_t (*)(uint64_t))type metadata accessor for AppEventObserver);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11SessionCore16AppEventObserver_knownClientStore);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

- (_TtC11SessionCore16AppEventObserver)init
{
  _TtC11SessionCore16AppEventObserver *result;

  result = (_TtC11SessionCore16AppEventObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)applicationsDidUninstall:(id)a3
{
  sub_1C13C8770(self, (uint64_t)a2, (uint64_t)a3);
}

- (void)applicationsDidInstall:(id)a3
{
  sub_1C13C8770(self, (uint64_t)a2, (uint64_t)a3);
}

@end
