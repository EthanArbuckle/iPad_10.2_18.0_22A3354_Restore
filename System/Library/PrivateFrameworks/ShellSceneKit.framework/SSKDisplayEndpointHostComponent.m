@implementation SSKDisplayEndpointHostComponent

- (void)updateDisplayConfiguration:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)updateRootWindow:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)wantsControlOfDisplay
{
  return 0;
}

- (SSKDisplayArrangementItem)displayArrangementItem
{
  return 0;
}

- (FBSDisplayConfigurationRequest)displayConfigurationRequest
{
  return 0;
}

+ (Protocol)settingsProtocol
{
  return (Protocol *)&unk_2575520D0;
}

- (SSKDisplayEndpointHostComponentDelegate)delegate
{
  return (SSKDisplayEndpointHostComponentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
