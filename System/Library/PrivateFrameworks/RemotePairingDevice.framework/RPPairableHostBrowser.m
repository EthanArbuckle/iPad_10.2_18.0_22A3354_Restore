@implementation RPPairableHostBrowser

- (RPPairableHostBrowser)init
{
  return (RPPairableHostBrowser *)sub_1CF708764();
}

- (void)registerInvalidationHandlerOnQueue:(id)a3 handler:(id)a4
{
  sub_1CF708F94(self, (int)a2, a3, a4, (uint64_t)&unk_1E8CA0330, (uint64_t)sub_1CF6A6F88, (void (*)(void *, uint64_t, uint64_t))RPPairableHostBrowser.registerInvalidationHandler(onQueue:handler:));
}

- (void)registerHostDiscoveredHandlerOnQueue:(id)a3 handler:(id)a4
{
  sub_1CF708F94(self, (int)a2, a3, a4, (uint64_t)&unk_1E8CA0308, (uint64_t)sub_1CF6DFC14, RPPairableHostBrowser.registerHostDiscoveredHandler(on:handler:));
}

- (void)startBrowsing
{
  RPPairableHostBrowser *v2;

  v2 = self;
  RPPairableHostBrowser.startBrowsing()();

}

- (void)cancel
{
  RPPairableHostBrowser *v2;

  v2 = self;
  RPPairableHostBrowser.cancel()();

}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
