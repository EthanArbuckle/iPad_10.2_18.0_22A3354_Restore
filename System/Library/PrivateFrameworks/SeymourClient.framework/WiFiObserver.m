@implementation WiFiObserver

- (void).cxx_destruct
{
  sub_1CDFC5D94((uint64_t)self + OBJC_IVAR____TtC13SeymourClient12WiFiObserver_delegate);

}

- (void)dealloc
{
  void *v2;
  _TtC13SeymourClient12WiFiObserver *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13SeymourClient12WiFiObserver_wifiInterface);
  v3 = self;
  objc_msgSend(v2, sel_invalidate);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for WiFiObserver();
  -[WiFiObserver dealloc](&v4, sel_dealloc);
}

- (_TtC13SeymourClient12WiFiObserver)init
{
  _TtC13SeymourClient12WiFiObserver *result;

  result = (_TtC13SeymourClient12WiFiObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
