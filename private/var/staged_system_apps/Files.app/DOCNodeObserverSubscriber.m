@implementation DOCNodeObserverSubscriber

- (_TtC5Files25DOCNodeObserverSubscriber)init
{
  _TtC5Files25DOCNodeObserverSubscriber *result;

  result = (_TtC5Files25DOCNodeObserverSubscriber *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCNodeObserverSubscriber", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC5Files25DOCNodeObserverSubscriber_uuid;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release(*(_QWORD *)&self->updateBlock[OBJC_IVAR____TtC5Files25DOCNodeObserverSubscriber_updateBlock]);
  sub_100087534(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files25DOCNodeObserverSubscriber_didFinishGatheringBlock), *(_QWORD *)&self->updateBlock[OBJC_IVAR____TtC5Files25DOCNodeObserverSubscriber_didFinishGatheringBlock]);
}

@end
