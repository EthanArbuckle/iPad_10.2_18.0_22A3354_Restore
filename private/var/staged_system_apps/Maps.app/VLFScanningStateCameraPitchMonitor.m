@implementation VLFScanningStateCameraPitchMonitor

- (VLFScanningStateCameraPitchMonitor)initWithDelegate:(id)a3 session:(id)a4
{
  VLFScanningStateCameraPitchMonitor *v4;
  id v5;
  NSObject *v6;
  double cameraPitchThreshold;
  objc_super v9;
  uint8_t buf[4];
  double v11;

  v9.receiver = self;
  v9.super_class = (Class)VLFScanningStateCameraPitchMonitor;
  v4 = -[VLFScanningStateMonitor initWithDelegate:session:](&v9, "initWithDelegate:session:", a3, a4);
  if (v4)
  {
    v4->_cameraPitchThreshold = GEOConfigGetDouble(MapsConfig_VLFSessionCameraPitchThreshold, off_1014B3928)
                              * 0.0174532925;
    v5 = sub_1005801E4();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      cameraPitchThreshold = v4->_cameraPitchThreshold;
      *(_DWORD *)buf = 134217984;
      v11 = cameraPitchThreshold;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Initialized with pitch threshold: %f", buf, 0xCu);
    }

  }
  return v4;
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  void *v5;
  float v6;
  id v7;
  NSObject *v8;
  float v9;
  _QWORD block[5];
  float v11;
  uint8_t buf[4];
  double v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "camera", a3));
  objc_msgSend(v5, "eulerAngles");
  v9 = v6;

  v7 = sub_1005801E4();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Got camera pitch: %f", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100580330;
  block[3] = &unk_1011B71A0;
  v11 = v9;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (double)cameraPitchThreshold
{
  return self->_cameraPitchThreshold;
}

- (void)setCameraPitchThreshold:(double)a3
{
  self->_cameraPitchThreshold = a3;
}

@end
