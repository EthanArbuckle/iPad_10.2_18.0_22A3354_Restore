@implementation UpdateEventMonitorController

- (void)appDocumentHasBecomeActive
{
  _TtC8VideosUI28UpdateEventMonitorController *v2;

  v2 = self;
  sub_1D9C9E950();

}

- (_TtC8VideosUI28UpdateEventMonitorController)init
{
  sub_1D9C9EBF0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8VideosUI28UpdateEventMonitorController_updateEventStore));
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8VideosUI28UpdateEventMonitorController_eventEligibleViewModels));
  swift_bridgeObjectRelease();
  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI28UpdateEventMonitorController_documentEventIterable, &qword_1EDA8E0D0);
  sub_1D97B50A8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8VideosUI28UpdateEventMonitorController_registrationHandler));
}

@end
