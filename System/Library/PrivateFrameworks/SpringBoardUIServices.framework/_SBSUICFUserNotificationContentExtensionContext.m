@implementation _SBSUICFUserNotificationContentExtensionContext

- (_SBSUICFUserNotificationContentExtensionHostInterface)hostService
{
  return (_SBSUICFUserNotificationContentExtensionHostInterface *)objc_loadWeakRetained((id *)&self->_hostService);
}

- (void)setHostService:(id)a3
{
  objc_storeWeak((id *)&self->_hostService, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostService);
}

@end
