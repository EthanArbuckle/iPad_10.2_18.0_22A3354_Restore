@implementation _SBUIPopoverExtensionContext

- (void)requestDismiss
{
  id v2;

  -[_SBUIPopoverExtensionContext hostService](self, "hostService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_extensionRequestsDismiss");

}

- (_SBUIPopoverExtensionHostInterface)hostService
{
  return (_SBUIPopoverExtensionHostInterface *)objc_loadWeakRetained((id *)&self->_hostService);
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
