@implementation UVBSEndpointMonitor

- (_TtC17PreviewsInjection19UVBSEndpointMonitor)init
{
  return (_TtC17PreviewsInjection19UVBSEndpointMonitor *)sub_21C21A0E4();
}

- (void)monitor:(id)a3 didReceiveEndpoint:(id)a4
{
  id v6;
  id v7;
  _TtC17PreviewsInjection19UVBSEndpointMonitor *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  UVBSEndpointMonitor.monitor(_:didReceive:)(v6, v7);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17PreviewsInjection19UVBSEndpointMonitor_controlAgentMonitor));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17PreviewsInjection19UVBSEndpointMonitor_jitBootstrapAgentMonitor));
  swift_release();
}

@end
