@implementation CurrentLocationController

- (_TtC5Books25CurrentLocationController)init
{
  _TtC5Books25CurrentLocationController *result;

  result = (_TtC5Books25CurrentLocationController *)_swift_stdlib_reportUnimplementedInitializer("Books.CurrentLocationController", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Books25CurrentLocationController_bookActionMediator);
  _s5Books15CurrentPageViewVwxx_0((Class *)((char *)&self->super.isa
                                          + OBJC_IVAR____TtC5Books25CurrentLocationController_bookEntity));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Books25CurrentLocationController_currentLocationProvider));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books25CurrentLocationController_paginationProvider));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Books25CurrentLocationController_cancellables));
  _s5Books15CurrentPageViewVwxx_0((Class *)((char *)&self->super.isa
                                          + OBJC_IVAR____TtC5Books25CurrentLocationController_historyController));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Books25CurrentLocationController_locationHistoryObserver));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Books25CurrentLocationController_cfiByOrdinal));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Books25CurrentLocationController_cfiUpdatesByOrdinal));
  sub_100010960((uint64_t)self + OBJC_IVAR____TtC5Books25CurrentLocationController_storedUpdate, &qword_1009F1BD8);
  sub_100010960((uint64_t)self + OBJC_IVAR____TtC5Books25CurrentLocationController_sendTimer, &qword_1009D6260);
  v3 = (char *)self + OBJC_IVAR____TtC5Books25CurrentLocationController_log;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
