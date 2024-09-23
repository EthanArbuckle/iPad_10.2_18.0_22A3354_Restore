@implementation _UIViewServiceControllerOperatorCreateResult

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[_UIViewServiceControllerOperatorCreateResult serviceWindowHostingHandle](self, "serviceWindowHostingHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UIViewServiceControllerOperatorCreateResult serviceWindowHostingHandle](self, "serviceWindowHostingHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("serviceWindowHostingHandle"));

  }
  -[_UIViewServiceControllerOperatorCreateResult supportedInterfaceOrientations](self, "supportedInterfaceOrientations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_UIViewServiceControllerOperatorCreateResult supportedInterfaceOrientations](self, "supportedInterfaceOrientations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("supportedInterfaceOrientations"));

  }
  objc_msgSend(v10, "encodeInteger:forKey:", -[_UIViewServiceControllerOperatorCreateResult preferredStatusBarStyle](self, "preferredStatusBarStyle"), CFSTR("preferredStatusBarStyle"));
  objc_msgSend(v10, "encodeInteger:forKey:", -[_UIViewServiceControllerOperatorCreateResult preferredStatusBarVisibility](self, "preferredStatusBarVisibility"), CFSTR("preferredStatusBarVisibility"));
  -[_UIViewServiceControllerOperatorCreateResult accessibilityServerPort](self, "accessibilityServerPort");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_UIViewServiceControllerOperatorCreateResult accessibilityServerPort](self, "accessibilityServerPort");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("accessibilityServerPort"));

  }
}

- (_UIViewServiceControllerOperatorCreateResult)initWithCoder:(id)a3
{
  id v4;
  _UIViewServiceControllerOperatorCreateResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UIViewServiceControllerOperatorCreateResult;
  v5 = -[_UIViewServiceControllerOperatorCreateResult init](&v17, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("serviceWindowHostingHandle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIViewServiceControllerOperatorCreateResult setServiceWindowHostingHandle:](v5, "setServiceWindowHostingHandle:", v7);

    v8 = (void *)MEMORY[0x1E0C99E60];
    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("supportedInterfaceOrientations"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIViewServiceControllerOperatorCreateResult setSupportedInterfaceOrientations:](v5, "setSupportedInterfaceOrientations:", v13);

    -[_UIViewServiceControllerOperatorCreateResult setPreferredStatusBarStyle:](v5, "setPreferredStatusBarStyle:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredStatusBarStyle")));
    -[_UIViewServiceControllerOperatorCreateResult setPreferredStatusBarVisibility:](v5, "setPreferredStatusBarVisibility:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredStatusBarVisibility")));
    objc_opt_self();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, CFSTR("accessibilityServerPort"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIViewServiceControllerOperatorCreateResult setAccessibilityServerPort:](v5, "setAccessibilityServerPort:", v15);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHostedWindowHostingHandle)serviceWindowHostingHandle
{
  return self->_serviceWindowHostingHandle;
}

- (void)setServiceWindowHostingHandle:(id)a3
{
  objc_storeStrong((id *)&self->_serviceWindowHostingHandle, a3);
}

- (NSArray)supportedInterfaceOrientations
{
  return self->_supportedInterfaceOrientations;
}

- (void)setSupportedInterfaceOrientations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)preferredStatusBarStyle
{
  return self->_preferredStatusBarStyle;
}

- (void)setPreferredStatusBarStyle:(int64_t)a3
{
  self->_preferredStatusBarStyle = a3;
}

- (int)preferredStatusBarVisibility
{
  return self->_preferredStatusBarVisibility;
}

- (void)setPreferredStatusBarVisibility:(int)a3
{
  self->_preferredStatusBarVisibility = a3;
}

- (BSMachPortSendRight)accessibilityServerPort
{
  return self->_accessibilityServerPort;
}

- (void)setAccessibilityServerPort:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityServerPort, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityServerPort, 0);
  objc_storeStrong((id *)&self->_supportedInterfaceOrientations, 0);
  objc_storeStrong((id *)&self->_serviceWindowHostingHandle, 0);
}

@end
