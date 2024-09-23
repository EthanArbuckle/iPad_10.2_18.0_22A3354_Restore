@implementation FindMyHandleMapServiceTicket

- (BOOL)isCancelled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps28FindMyHandleMapServiceTicket_isCancelled);
}

- (void)setCancelled:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps28FindMyHandleMapServiceTicket_isCancelled) = a3;
}

- (void)cancel
{
  _TtC4Maps28FindMyHandleMapServiceTicket *v2;

  v2 = self;
  sub_1000B2DC0();

}

- (_TtC4Maps28FindMyHandleMapServiceTicket)init
{
  _TtC4Maps28FindMyHandleMapServiceTicket *result;

  result = (_TtC4Maps28FindMyHandleMapServiceTicket *)_swift_stdlib_reportUnimplementedInitializer("Maps.FindMyHandleMapServiceTicket", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC4Maps28FindMyHandleMapServiceTicket_handle;
  v4 = type metadata accessor for Handle(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC4Maps28FindMyHandleMapServiceTicket_ticket));
}

@end
