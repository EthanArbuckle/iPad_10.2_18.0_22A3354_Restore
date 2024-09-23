@implementation SBCameraViewfinderMonitorToken

- (SBCameraViewfinderMonitorToken)initWithMonitor:(id)a3 observer:(id)a4
{
  id v8;
  id v9;
  void *v10;
  SBCameraViewfinderMonitorToken *v11;
  SBCameraViewfinderMonitorToken *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCameraViewfinderMonitor.m"), 178, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("monitor != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCameraViewfinderMonitor.m"), 179, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer != nil"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)SBCameraViewfinderMonitorToken;
  v11 = -[SBCameraViewfinderMonitorToken init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_monitor, a3);
    objc_storeStrong((id *)&v12->_observer, a4);
  }

  return v12;
}

- (void)cancel
{
  SBCameraViewfinderMonitor *monitor;
  SBCameraViewfinderMonitorObserver *observer;
  SBCameraViewfinderMonitor *v6;
  void *v7;

  monitor = self->_monitor;
  if (!monitor || !self->_observer)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCameraViewfinderMonitor.m"), 191, CFSTR("Already canceled?"));

    monitor = self->_monitor;
  }
  -[SBCameraViewfinderMonitor _removeObserver:](monitor, "_removeObserver:");
  observer = self->_observer;
  self->_observer = 0;

  v6 = self->_monitor;
  self->_monitor = 0;

}

- (id)auditTokenForProcessWithActiveOrImminentViewfinderSession
{
  SBCameraViewfinderMonitor *monitor;
  void *v6;

  monitor = self->_monitor;
  if (!monitor || !self->_observer)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCameraViewfinderMonitor.m"), 200, CFSTR("Already canceled?"));

    monitor = self->_monitor;
  }
  return -[SBCameraViewfinderMonitor auditTokenForProcessWithActiveOrImminentViewfinderSession](monitor, "auditTokenForProcessWithActiveOrImminentViewfinderSession");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end
