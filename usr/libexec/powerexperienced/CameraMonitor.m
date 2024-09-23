@implementation CameraMonitor

+ (id)monitorWithQueue:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  _QWORD block[4];
  id v8;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009780;
  block[3] = &unk_1000145C0;
  v8 = a3;
  v3 = qword_10001BE90;
  v4 = v8;
  if (v3 != -1)
    dispatch_once(&qword_10001BE90, block);
  v5 = (id)qword_10001BE98;

  return v5;
}

- (CameraMonitor)initWithQueue:(id)a3
{
  id v5;
  CameraMonitor *v6;
  CameraMonitor *v7;
  os_log_t v8;
  OS_os_log *log;
  uint64_t v10;
  FigCameraViewfinder *viewFinder;
  NSObject *v12;
  uint8_t v14[16];
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CameraMonitor;
  v6 = -[CameraMonitor init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = os_log_create("com.apple.powerexperienced", "cameramonitor");
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

    v10 = objc_claimAutoreleasedReturnValue(+[FigCameraViewfinder cameraViewfinder](FigCameraViewfinder, "cameraViewfinder"));
    viewFinder = v7->_viewFinder;
    v7->_viewFinder = (FigCameraViewfinder *)v10;

    -[FigCameraViewfinder setDelegate:queue:](v7->_viewFinder, "setDelegate:queue:", v7, v7->_queue);
    -[FigCameraViewfinder startWithOptions:](v7->_viewFinder, "startWithOptions:", 0);
  }
  v12 = objc_claimAutoreleasedReturnValue(-[CameraMonitor log](v7, "log"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Initialized camera monitor", v14, 2u);
  }

  return v7;
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4
{
  NSObject *v5;
  void *v6;
  id v7;
  uint8_t v8[16];

  v5 = objc_claimAutoreleasedReturnValue(-[CameraMonitor log](self, "log", a3, a4));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Camera session started", v8, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CameraMonitor cameraResourceHint](self, "cameraResourceHint"));
  if (v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CameraMonitor cameraResourceHint](self, "cameraResourceHint"));
    objc_msgSend(v7, "updateState:", 1);
  }
  else
  {
    v7 = objc_msgSend(objc_alloc((Class)ResourceHint), "initWithResourceType:andState:", 6, 1);
    -[CameraMonitor setCameraResourceHint:](self, "setCameraResourceHint:", v7);
  }

}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v5 = objc_claimAutoreleasedReturnValue(-[CameraMonitor log](self, "log", a3, a4));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Camera session ended", v8, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CameraMonitor cameraResourceHint](self, "cameraResourceHint"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CameraMonitor cameraResourceHint](self, "cameraResourceHint"));
    objc_msgSend(v7, "updateState:", 0);

  }
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (FigCameraViewfinder)viewFinder
{
  return (FigCameraViewfinder *)objc_getProperty(self, a2, 16, 1);
}

- (void)setViewFinder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (ResourceHint)cameraResourceHint
{
  return (ResourceHint *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCameraResourceHint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_cameraResourceHint, 0);
  objc_storeStrong((id *)&self->_viewFinder, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
