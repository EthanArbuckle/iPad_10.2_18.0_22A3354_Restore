@implementation AccelerometerObserver

- (_TtC13EnsembleAgentP33_E744CF5210EDE89134C765150EF1117921AccelerometerObserver)init
{
  return (_TtC13EnsembleAgentP33_E744CF5210EDE89134C765150EF1117921AccelerometerObserver *)sub_100106F98();
}

- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4
{
  id v6;
  _TtC13EnsembleAgentP33_E744CF5210EDE89134C765150EF1117921AccelerometerObserver *v7;

  v6 = a3;
  v7 = self;
  sub_10010709C((uint64_t)v6, a4);

}

- (void)accelerometer:(id)a3 didAccelerateWithTimeStamp:(double)a4 x:(float)a5 y:(float)a6 z:(float)a7 eventType:(int)a8
{
  CGSize.init(_:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13EnsembleAgentP33_E744CF5210EDE89134C765150EF1117921AccelerometerObserver_accelerometer));
}

@end
