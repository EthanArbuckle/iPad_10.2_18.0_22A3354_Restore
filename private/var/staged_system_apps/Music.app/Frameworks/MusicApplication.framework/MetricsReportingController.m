@implementation MetricsReportingController

- (_TtC9MusicCore26MetricsReportingController)init
{
  return (_TtC9MusicCore26MetricsReportingController *)sub_C311BC();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC9MusicCore26MetricsReportingController_componentRenderEventSampler));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC9MusicCore26MetricsReportingController_pageRenderEventSampler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9MusicCore26MetricsReportingController_metricsConfiguration));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9MusicCore26MetricsReportingController_metricsController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9MusicCore26MetricsReportingController_carFocusedMetricsController));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC9MusicCore26MetricsReportingController_carMetricsReporter));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC9MusicCore26MetricsReportingController_backgroundObserver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC9MusicCore26MetricsReportingController_urlBagObserver));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC9MusicCore26MetricsReportingController_pageHistory));
}

@end
