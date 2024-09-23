@implementation WDSURLSessionTaskDelegate

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC13WeatherDaemon25WDSURLSessionTaskDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1A61B3E34((uint64_t)v11, v9, v10);

}

- (void)URLSession:(id)a3 didCreateTask:(id)a4
{
  id v6;
  id v7;
  _TtC13WeatherDaemon25WDSURLSessionTaskDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1A61B44E4((uint64_t)v8, v7);

}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

- (_TtC13WeatherDaemon25WDSURLSessionTaskDelegate)init
{
  sub_1A6259AEC();
}

@end
