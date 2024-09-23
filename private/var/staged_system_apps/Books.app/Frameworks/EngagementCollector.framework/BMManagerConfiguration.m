@implementation BMManagerConfiguration

- (BMManagerConfiguration)initWithDirectory:(id)a3 shouldRunUpdatesOnSchedule:(BOOL)a4 shouldPurgeOutdatedData:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  BMManagerConfiguration *v9;
  BMInternalManagerConfiguration *v10;
  objc_super v12;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BMManagerConfiguration;
  v9 = -[BMManagerConfiguration init](&v12, "init");
  if (v9)
  {
    v10 = -[BMInternalManagerConfiguration initWithDirectory:shouldRunUpdatesOnSchedule:shouldPurgeOutdatedData:]([BMInternalManagerConfiguration alloc], "initWithDirectory:shouldRunUpdatesOnSchedule:shouldPurgeOutdatedData:", v8, v6, v5);
    -[BMManagerConfiguration setManagerConfiguration:](v9, "setManagerConfiguration:", v10);

  }
  return v9;
}

+ (void)setBackgroundTaskDelegate:(id)a3
{
  objc_storeWeak(qword_3F2F0, a3);
}

+ (ECBackgroundTaskProviding)backgroundTaskDelegate
{
  return (ECBackgroundTaskProviding *)objc_loadWeakRetained(qword_3F2F0);
}

- (BMInternalManagerConfiguration)managerConfiguration
{
  return self->_managerConfiguration;
}

- (void)setManagerConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managerConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managerConfiguration, 0);
}

@end
