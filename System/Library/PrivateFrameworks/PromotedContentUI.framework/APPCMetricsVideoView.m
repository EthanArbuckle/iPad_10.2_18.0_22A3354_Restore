@implementation APPCMetricsVideoView

- (APPrivacyMarker)privacyMarker
{
  return (APPrivacyMarker *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                    + OBJC_IVAR___APPCMetricsVideoView_privacyMarker));
}

- (void)didAddSubview:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MetricsVideoView();
  v4 = a3;
  v5 = v6.receiver;
  -[APPCMetricsVideoView didAddSubview:](&v6, sel_didAddSubview_, v4);
  sub_1B12F5448(0, 0);

}

- (void)didMoveToSuperview
{
  sub_1B1347308(self, (uint64_t)a2, (const char **)&selRef_didMoveToSuperview);
}

- (void)didMoveToWindow
{
  sub_1B1347308(self, (uint64_t)a2, (const char **)&selRef_didMoveToWindow);
}

- (void)beginAction
{
  APPCMetricsVideoView *v2;

  v2 = self;
  sub_1B13474CC();

}

- (void).cxx_destruct
{

  sub_1B12C41A0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___APPCMetricsVideoView_representationFetched));

}

@end
