@implementation HostedContentTextureProvider.HostingControllerRequest

- (OS_dispatch_queue)hostingControllerObservationQueue
{
  return (OS_dispatch_queue *)*(id *)&self->requestQueue[4];
}

- (void)hostingController:(id)a3 didRenderFrame:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  sub_1A7ADBF34();
  sub_1A6A7B208(v6);

  swift_release();
}

@end
