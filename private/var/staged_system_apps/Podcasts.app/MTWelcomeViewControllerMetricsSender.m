@implementation MTWelcomeViewControllerMetricsSender

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MTWelcomeViewControllerMetricsSender_metricsController));
}

- (void)welcomeControllerDidAppear
{
  MTWelcomeViewControllerMetricsSender *v2;

  v2 = self;
  sub_10032B304();

}

- (void)welcomeControllerWillDisappear
{
  uint64_t v2;
  MTWelcomeViewControllerMetricsSender *v3;
  __n128 v4;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___MTWelcomeViewControllerMetricsSender_metricsController);
  v3 = self;
  v4 = swift_retain(v2);
  MetricsController.observe(lifecycleEvent:)(2, v4);

  swift_release(v2);
}

- (void)welcomeControllerDidDisappear
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  MTWelcomeViewControllerMetricsSender *v7;
  __n128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_10003F544(&qword_100564BF8);
  __chkstk_darwin();
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = OBJC_IVAR___MTWelcomeViewControllerMetricsSender_metricsController;
  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___MTWelcomeViewControllerMetricsSender_metricsController);
  v7 = self;
  v8 = swift_retain();
  MetricsController.observe(lifecycleEvent:)(3, v8);
  swift_release(v6);
  v9 = *(uint64_t *)((char *)&self->super.isa + v5);
  v10 = type metadata accessor for PageMetrics(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v4, 1, 1, v10);
  swift_retain();
  MetricsController.pageMetrics.setter(v4);

  swift_release(v9);
}

- (MTWelcomeViewControllerMetricsSender)init
{
  MTWelcomeViewControllerMetricsSender *result;

  result = (MTWelcomeViewControllerMetricsSender *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.WelcomeViewControllerMetricsSender", 43, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
