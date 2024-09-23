@implementation _SKUIApplicationShutdownHelper

- (_SKUIApplicationShutdownHelper)initWithApplicationController:(id)a3
{
  id v5;
  _SKUIApplicationShutdownHelper *v6;
  _SKUIApplicationShutdownHelper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SKUIApplicationShutdownHelper;
  v6 = -[_SKUIApplicationShutdownHelper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_applicationController, a3);

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_taskID != *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endBackgroundTask:", self->_taskID);

  }
  v4.receiver = self;
  v4.super_class = (Class)_SKUIApplicationShutdownHelper;
  -[_SKUIApplicationShutdownHelper dealloc](&v4, sel_dealloc);
}

- (void)start
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39___SKUIApplicationShutdownHelper_start__block_invoke;
  v4[3] = &unk_1E739FD38;
  v4[4] = self;
  self->_taskID = objc_msgSend(v3, "beginBackgroundTaskWithExpirationHandler:", v4);

}

- (void)stop
{
  SKUIApplicationController *applicationController;
  unint64_t v4;
  void *v5;

  applicationController = self->_applicationController;
  self->_applicationController = 0;

  v4 = *MEMORY[0x1E0DC4878];
  if (self->_taskID != *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endBackgroundTask:", self->_taskID);

    self->_taskID = v4;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationController, 0);
}

@end
