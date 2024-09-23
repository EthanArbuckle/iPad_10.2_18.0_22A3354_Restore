@implementation _SBLegacyRemoteAlertContentHostViewController

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_UIRemoteViewController serviceBundleIdentifier](self, "serviceBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBLegacyRemoteAlertContentHostViewController serviceClassName](self, "serviceClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p -> %@:%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_getPreferredContentSizeWithReplyBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88___SBLegacyRemoteAlertContentHostViewController__getPreferredContentSizeWithReplyBlock___block_invoke;
  v7[3] = &unk_1E8EA3B80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getPreferredContentSizeWithReplyBlock:", v7);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFCCCA78);
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFEB4CB8);
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (NSString)serviceClassName
{
  return self->_serviceClassName;
}

- (void)setServiceClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1480);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceClassName, 0);
  objc_destroyWeak(&self->_delegate);
}

@end
