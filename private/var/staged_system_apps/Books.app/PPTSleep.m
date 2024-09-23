@implementation PPTSleep

- (void)startTest
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[PPTBasicTest setRunning:](self, "setRunning:", 1);
  v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001881B0;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

@end
