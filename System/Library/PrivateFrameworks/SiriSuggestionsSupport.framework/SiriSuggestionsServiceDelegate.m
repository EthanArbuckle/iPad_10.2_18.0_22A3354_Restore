@implementation SiriSuggestionsServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC22SiriSuggestionsSupport30SiriSuggestionsServiceDelegate *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1C03C6484((int)v8, v7);

  return v9 & 1;
}

- (_TtC22SiriSuggestionsSupport30SiriSuggestionsServiceDelegate)init
{
  SiriSuggestionsServiceDelegate.init()();
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC22SiriSuggestionsSupport30SiriSuggestionsServiceDelegate_eventDrivenClient);
}

@end
