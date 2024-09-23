@implementation _UIViewServiceViewControllerOperatorCreateOptions

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
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
  id v16;

  v16 = a3;
  -[_UIViewServiceViewControllerOperatorCreateOptions viewControllerClassName](self, "viewControllerClassName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UIViewServiceViewControllerOperatorCreateOptions viewControllerClassName](self, "viewControllerClassName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v5, CFSTR("viewControllerClassName"));

  }
  -[_UIViewServiceViewControllerOperatorCreateOptions serializedAppearanceRepresentations](self, "serializedAppearanceRepresentations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_UIViewServiceViewControllerOperatorCreateOptions serializedAppearanceRepresentations](self, "serializedAppearanceRepresentations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v7, CFSTR("serializedAppearanceRepresentations"));

  }
  -[_UIViewServiceViewControllerOperatorCreateOptions contextToken](self, "contextToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_UIViewServiceViewControllerOperatorCreateOptions contextToken](self, "contextToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v9, CFSTR("contextToken"));

  }
  -[_UIViewServiceViewControllerOperatorCreateOptions displayConfigurations](self, "displayConfigurations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_UIViewServiceViewControllerOperatorCreateOptions displayConfigurations](self, "displayConfigurations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v11, CFSTR("displayConfigurations"));

  }
  -[_UIViewServiceViewControllerOperatorCreateOptions traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_UIViewServiceViewControllerOperatorCreateOptions traitCollection](self, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v13, CFSTR("traitCollection"));

  }
  -[_UIViewServiceViewControllerOperatorCreateOptions hostAccessibilityServerPort](self, "hostAccessibilityServerPort");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_UIViewServiceViewControllerOperatorCreateOptions hostAccessibilityServerPort](self, "hostAccessibilityServerPort");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v15, CFSTR("hostAccessibilityServerPort"));

  }
  objc_msgSend(v16, "encodeInteger:forKey:", -[_UIViewServiceViewControllerOperatorCreateOptions availableTextServices](self, "availableTextServices"), CFSTR("availableTextServices"));
  objc_msgSend(v16, "encodeInteger:forKey:", -[_UIViewServiceViewControllerOperatorCreateOptions initialInterfaceOrientation](self, "initialInterfaceOrientation"), CFSTR("initialInterfaceOrientation"));

}

- (_UIViewServiceViewControllerOperatorCreateOptions)initWithCoder:(id)a3
{
  id v4;
  _UIViewServiceViewControllerOperatorCreateOptions *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_UIViewServiceViewControllerOperatorCreateOptions;
  v5 = -[_UIViewServiceViewControllerOperatorCreateOptions init](&v27, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("viewControllerClassName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIViewServiceViewControllerOperatorCreateOptions setViewControllerClassName:](v5, "setViewControllerClassName:", v7);

    v8 = (void *)MEMORY[0x1E0C99E60];
    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v9;
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("serializedAppearanceRepresentations"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIViewServiceViewControllerOperatorCreateOptions setSerializedAppearanceRepresentations:](v5, "setSerializedAppearanceRepresentations:", v13);

    objc_opt_self();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, CFSTR("contextToken"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIViewServiceViewControllerOperatorCreateOptions setContextToken:](v5, "setContextToken:", v15);

    v16 = (void *)MEMORY[0x1E0C99E60];
    objc_opt_self();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v17;
    objc_opt_self();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("displayConfigurations"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIViewServiceViewControllerOperatorCreateOptions setDisplayConfigurations:](v5, "setDisplayConfigurations:", v21);

    objc_opt_self();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, CFSTR("traitCollection"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIViewServiceViewControllerOperatorCreateOptions setTraitCollection:](v5, "setTraitCollection:", v23);

    objc_opt_self();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v24, CFSTR("hostAccessibilityServerPort"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIViewServiceViewControllerOperatorCreateOptions setHostAccessibilityServerPort:](v5, "setHostAccessibilityServerPort:", v25);

    -[_UIViewServiceViewControllerOperatorCreateOptions setAvailableTextServices:](v5, "setAvailableTextServices:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("availableTextServices")));
    -[_UIViewServiceViewControllerOperatorCreateOptions setInitialInterfaceOrientation:](v5, "setInitialInterfaceOrientation:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("initialInterfaceOrientation")));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)viewControllerClassName
{
  return self->_viewControllerClassName;
}

- (void)setViewControllerClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)serializedAppearanceRepresentations
{
  return self->_serializedAppearanceRepresentations;
}

- (void)setSerializedAppearanceRepresentations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)contextToken
{
  return self->_contextToken;
}

- (void)setContextToken:(id)a3
{
  objc_storeStrong((id *)&self->_contextToken, a3);
}

- (NSArray)displayConfigurations
{
  return self->_displayConfigurations;
}

- (void)setDisplayConfigurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
}

- (BSMachPortSendRight)hostAccessibilityServerPort
{
  return self->_hostAccessibilityServerPort;
}

- (void)setHostAccessibilityServerPort:(id)a3
{
  objc_storeStrong((id *)&self->_hostAccessibilityServerPort, a3);
}

- (int64_t)availableTextServices
{
  return self->_availableTextServices;
}

- (void)setAvailableTextServices:(int64_t)a3
{
  self->_availableTextServices = a3;
}

- (int64_t)initialInterfaceOrientation
{
  return self->_initialInterfaceOrientation;
}

- (void)setInitialInterfaceOrientation:(int64_t)a3
{
  self->_initialInterfaceOrientation = a3;
}

- (BOOL)hostCanDynamicallySpecifySupportedInterfaceOrientations
{
  return self->_hostCanDynamicallySpecifySupportedInterfaceOrientations;
}

- (void)setHostCanDynamicallySpecifySupportedInterfaceOrientations:(BOOL)a3
{
  self->_hostCanDynamicallySpecifySupportedInterfaceOrientations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostAccessibilityServerPort, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_displayConfigurations, 0);
  objc_storeStrong((id *)&self->_contextToken, 0);
  objc_storeStrong((id *)&self->_serializedAppearanceRepresentations, 0);
  objc_storeStrong((id *)&self->_viewControllerClassName, 0);
}

@end
