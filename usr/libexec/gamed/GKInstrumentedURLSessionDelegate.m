@implementation GKInstrumentedURLSessionDelegate

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC14GameDaemonCore32GKInstrumentedURLSessionDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1001841A0((uint64_t)v11, (uint64_t)v9, (uint64_t)v10);

}

- (_TtC14GameDaemonCore32GKInstrumentedURLSessionDelegate)init
{
  return (_TtC14GameDaemonCore32GKInstrumentedURLSessionDelegate *)sub_100184344();
}

@end
