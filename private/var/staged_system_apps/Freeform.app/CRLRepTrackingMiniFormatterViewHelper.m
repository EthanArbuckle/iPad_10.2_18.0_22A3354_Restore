@implementation CRLRepTrackingMiniFormatterViewHelper

- (id)crlaxRepToFocus
{
  uint64_t v2;
  _TtC8Freeform37CRLRepTrackingMiniFormatterViewHelper *v3;
  uint64_t v4;
  void *v5;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform37CRLRepTrackingMiniFormatterViewHelper_reps);
  v3 = self;
  swift_bridgeObjectRetain(v2);
  v5 = (void *)sub_100857EA4(v4);

  swift_bridgeObjectRelease(v2);
  return v5;
}

- (_TtC8Freeform37CRLRepTrackingMiniFormatterViewHelper)init
{
  _TtC8Freeform37CRLRepTrackingMiniFormatterViewHelper *result;

  result = (_TtC8Freeform37CRLRepTrackingMiniFormatterViewHelper *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLRepTrackingMiniFormatterViewHelper", 46, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform37CRLRepTrackingMiniFormatterViewHelper_reps));
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform37CRLRepTrackingMiniFormatterViewHelper_delegate);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform37CRLRepTrackingMiniFormatterViewHelper_view);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Freeform37CRLRepTrackingMiniFormatterViewHelper____lazy_storage___miniFormatterPositionHelper));
}

- (NSArray)decoratorOverlayRenderables
{
  sub_1004BA914();
  return (NSArray *)Array._bridgeToObjectiveC()().super.isa;
}

- (void)willBeginDynamicOperation
{
  _TtC8Freeform37CRLRepTrackingMiniFormatterViewHelper *v2;

  v2 = self;
  sub_10070E434();

}

- (void)didEndDynamicOperation
{
  _TtC8Freeform37CRLRepTrackingMiniFormatterViewHelper *v2;

  v2 = self;
  sub_10070E6C8();

}

- (void)willBeginScrollingOperation
{
  uint64_t v2;
  _TtC8Freeform37CRLRepTrackingMiniFormatterViewHelper *v3;
  id v4;
  __n128 v5;
  uint64_t v6;
  _BYTE v7[24];

  v2 = qword_1013DD818;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_1013DD818, sub_100A04944);
  swift_beginAccess(&static OS_os_log.crlMiniFormatter, v7, 0, 0);
  v4 = (id)static OS_os_log.crlMiniFormatter;
  v6 = static os_log_type_t.default.getter(v5);
  sub_100A06EBC((uint64_t)v4, &_mh_execute_header, v6, "[MiniFormatter] RepTrackingViewHelper is beginning scroll operation", 67, 2, (uint64_t)_swiftEmptyArrayStorage);

  *((_BYTE *)&v3->super.isa + OBJC_IVAR____TtC8Freeform37CRLRepTrackingMiniFormatterViewHelper_isScrollingBoard) = 1;
}

- (void)didEndScrollingOperation
{
  uint64_t v2;
  _TtC8Freeform37CRLRepTrackingMiniFormatterViewHelper *v3;
  id v4;
  __n128 v5;
  uint64_t v6;
  _BYTE v7[24];

  v2 = qword_1013DD818;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_1013DD818, sub_100A04944);
  swift_beginAccess(&static OS_os_log.crlMiniFormatter, v7, 0, 0);
  v4 = (id)static OS_os_log.crlMiniFormatter;
  v6 = static os_log_type_t.default.getter(v5);
  sub_100A06EBC((uint64_t)v4, &_mh_execute_header, v6, "[MiniFormatter] RepTrackingViewHelper is ending scroll operation", 64, 2, (uint64_t)_swiftEmptyArrayStorage);

  *((_BYTE *)&v3->super.isa + OBJC_IVAR____TtC8Freeform37CRLRepTrackingMiniFormatterViewHelper_isScrollingBoard) = 0;
  sub_10070DE84();

}

- (void)willBeginZoomingOperation
{
  _TtC8Freeform37CRLRepTrackingMiniFormatterViewHelper *v2;

  v2 = self;
  sub_10070EACC();

}

- (void)didEndZoomingOperation
{
  _TtC8Freeform37CRLRepTrackingMiniFormatterViewHelper *v2;

  v2 = self;
  sub_10070EC5C();

}

- (void)unobscuredFrameDidChange
{
  _TtC8Freeform37CRLRepTrackingMiniFormatterViewHelper *v2;

  v2 = self;
  sub_10070DE84();

}

@end
