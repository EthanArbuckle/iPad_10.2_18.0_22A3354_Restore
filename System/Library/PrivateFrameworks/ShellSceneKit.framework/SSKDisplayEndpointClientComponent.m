@implementation SSKDisplayEndpointClientComponent

- (BOOL)wantsControlOfDisplay
{
  return 0;
}

- (unint64_t)priorityLevel
{
  return 0;
}

- (FBSDisplayConfigurationRequest)displayConfigurationRequest
{
  return 0;
}

- (SSKDisplayArrangementItem)displayArrangementItem
{
  return 0;
}

- (BOOL)hasControlOfDisplay
{
  return 0;
}

- (unint64_t)currentDeactivationReasons
{
  return 0;
}

- (UIRootSceneWindow)rootWindow
{
  return 0;
}

+ (Protocol)settingsProtocol
{
  return (Protocol *)&unk_257552130;
}

- (SSKDisplayEndpointDelegate)delegate
{
  return (SSKDisplayEndpointDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
