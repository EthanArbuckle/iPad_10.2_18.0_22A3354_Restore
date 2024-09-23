@implementation VLFScanningStateCameraMotionMonitor

- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;
  VLFScanningStateCameraMotionMonitor *v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100216008;
  v6[3] = &unk_1011AC8B0;
  v7 = a4;
  v8 = self;
  v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

}

@end
