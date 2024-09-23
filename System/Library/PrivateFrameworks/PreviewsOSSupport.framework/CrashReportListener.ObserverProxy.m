@implementation CrashReportListener.ObserverProxy

- (void)willWriteDiagnosticLog:(id)a3 logId:(id)a4 logInfo:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  _TtCC17PreviewsOSSupport19CrashReportListener13ObserverProxy *v11;

  v6 = sub_224D8260C();
  v8 = v7;
  v9 = sub_224D825D0();
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))((char *)&self->super.isa
                                                         + OBJC_IVAR____TtCC17PreviewsOSSupport19CrashReportListener13ObserverProxy_diagnosticsLogHandler);
  v11 = self;
  swift_retain();
  v10(v6, v8, v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtCC17PreviewsOSSupport19CrashReportListener13ObserverProxy)init
{
  _TtCC17PreviewsOSSupport19CrashReportListener13ObserverProxy *result;

  result = (_TtCC17PreviewsOSSupport19CrashReportListener13ObserverProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
