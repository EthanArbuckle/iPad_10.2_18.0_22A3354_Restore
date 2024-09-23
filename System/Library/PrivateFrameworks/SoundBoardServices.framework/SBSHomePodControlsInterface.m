@implementation SBSHomePodControlsInterface

- (SBSHomePodControlsInterface)init
{
  return -[SBSHomePodControlsInterface initWithTarget:](self, "initWithTarget:", CFSTR("localhost"));
}

- (SBSHomePodControlsInterface)initWithTarget:(id)a3
{
  id v4;
  SBSHomePodControlsInterface *v5;
  uint64_t v6;
  SBSHomePodControlsImplementer *sbProxy;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSHomePodControlsInterface;
  v5 = -[SBSHomePodControlsInterface init](&v9, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("localhost")))
      +[SBSUtils createProxyConnectionForXPCWithExportedObject:connection:](SBSUtils, "createProxyConnectionForXPCWithExportedObject:connection:", 0, &v5->_sbConnection);
    else
      +[SBSUtils createProxyConnectionForRapportTarget:](SBSUtils, "createProxyConnectionForRapportTarget:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    sbProxy = v5->_sbProxy;
    v5->_sbProxy = (SBSHomePodControlsImplementer *)v6;

  }
  return v5;
}

- (void)getAllSyncedAlarmsAndTimers:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (a3)
  {
    -[SBSHomePodControlsImplementer getAllSyncedAlarmsAndTimers:](self->_sbProxy, "getAllSyncedAlarmsAndTimers:");
  }
  else
  {
    _SBSLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_222D7A000, v3, OS_LOG_TYPE_ERROR, "getAllSyncedAlarmsAndTimers Reply completion handler is nil", v4, 2u);
    }

  }
}

- (BOOL)isMediaAlarm:(id)a3
{
  return -[SBSHomePodControlsImplementer isMediaAlarm:](self->_sbProxy, "isMediaAlarm:", a3);
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_sbConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSHomePodControlsInterface;
  -[SBSHomePodControlsInterface dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbProxy, 0);
  objc_storeStrong((id *)&self->_sbConnection, 0);
}

@end
