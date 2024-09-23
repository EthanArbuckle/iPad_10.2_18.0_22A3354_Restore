@implementation BagProvider.Retry

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  uint64_t Strong;
  uint64_t v6;
  id v7;
  _TtCC9MusicCore11BagProviderP33_D1F028703756EAFCB4E62A24E619467F5Retry *v8;

  Strong = swift_weakLoadStrong((char *)self + OBJC_IVAR____TtCC9MusicCore11BagProviderP33_D1F028703756EAFCB4E62A24E619467F5Retry_provider);
  if (Strong)
  {
    v6 = Strong;
    v7 = a3;
    v8 = self;
    sub_100164460(0);

    swift_release(v6);
  }
}

- (_TtCC9MusicCore11BagProviderP33_D1F028703756EAFCB4E62A24E619467F5Retry)init
{
  objc_super v4;

  swift_weakInit((char *)self + OBJC_IVAR____TtCC9MusicCore11BagProviderP33_D1F028703756EAFCB4E62A24E619467F5Retry_provider, 0);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCC9MusicCore11BagProviderP33_D1F028703756EAFCB4E62A24E619467F5Retry_bindings) = (Class)_swiftEmptyArrayStorage;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BagProvider.Retry();
  return -[BagProvider.Retry init](&v4, "init");
}

- (void).cxx_destruct
{
  swift_weakDestroy((char *)self + OBJC_IVAR____TtCC9MusicCore11BagProviderP33_D1F028703756EAFCB4E62A24E619467F5Retry_provider);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtCC9MusicCore11BagProviderP33_D1F028703756EAFCB4E62A24E619467F5Retry_bindings));
}

@end
