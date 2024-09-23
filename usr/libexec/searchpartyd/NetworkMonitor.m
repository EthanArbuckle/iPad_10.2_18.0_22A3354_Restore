@implementation NetworkMonitor

- (_TtC12searchpartyd14NetworkMonitor)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd14NetworkMonitor_monitorBlock);
  *v2 = 0;
  v2[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd14NetworkMonitor_evaluator) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd14NetworkMonitor____lazy_storage___callbackQueue) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for NetworkMonitor();
  return -[NetworkMonitor init](&v4, "init");
}

- (void).cxx_destruct
{
  sub_10001D8A8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd14NetworkMonitor_monitorBlock), *(_QWORD *)&self->monitorBlock[OBJC_IVAR____TtC12searchpartyd14NetworkMonitor_monitorBlock]);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12searchpartyd14NetworkMonitor____lazy_storage___callbackQueue));
}

@end
