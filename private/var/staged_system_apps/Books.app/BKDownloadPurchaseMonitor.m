@implementation BKDownloadPurchaseMonitor

- (BKDownloadPurchaseMonitor)init
{
  return (BKDownloadPurchaseMonitor *)DownloadPurchaseMonitor.init()();
}

- (void)start
{
  sub_1005FD078(self, (uint64_t)a2, (SEL *)&selRef_addObserver_);
}

- (void)stop
{
  sub_1005FD078(self, (uint64_t)a2, (SEL *)&selRef_removeObserver_);
}

- (void)downloadQueue:(id)a3 purchaseAttemptForRequest:(id)a4
{
  id v6;
  BKDownloadPurchaseMonitor *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  sub_1005FE11C(a4);

}

- (void)downloadQueue:(id)a3 purchasedDidCompleteWithResponse:(id)a4
{
  id v6;
  BKDownloadPurchaseMonitor *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  sub_1005FE4A0(a4);

}

- (void)downloadQueue:(id)a3 purchasedDidFailWithResponse:(id)a4
{
  id v6;
  id v7;
  BKDownloadPurchaseMonitor *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1005FEC10(a4);

}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKDownloadPurchaseMonitor_purchaseAttempts));
}

@end
