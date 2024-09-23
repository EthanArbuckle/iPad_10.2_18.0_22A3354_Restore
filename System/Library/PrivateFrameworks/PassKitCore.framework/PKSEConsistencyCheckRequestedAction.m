@implementation PKSEConsistencyCheckRequestedAction

- (PKSEConsistencyCheckRequestedAction)init
{

  return 0;
}

- (PKSEConsistencyCheckRequestedAction)initWithActions:(int64_t)a3 deviceCredential:(id)a4 address:(id)a5
{
  id v9;
  id v10;
  PKSEConsistencyCheckRequestedAction *v11;
  PKSEConsistencyCheckRequestedAction *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKSEConsistencyCheckRequestedAction;
  v11 = -[PKSEConsistencyCheckRequestedAction init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_actions = a3;
    objc_storeStrong((id *)&v11->_deviceCredential, a4);
    objc_storeStrong((id *)&v12->_address, a5);
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKConsistencyCheckCleanupActionsToString(self->_actions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("actions: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("deviceCredential: '%@'; "), self->_deviceCredential);
  objc_msgSend(v3, "appendFormat:", CFSTR("address: '%@'; "), self->_address);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (int64_t)actions
{
  return self->_actions;
}

- (PKSEConsistencyCheckDeviceCredential)deviceCredential
{
  return self->_deviceCredential;
}

- (PKSECredentialAddress)address
{
  return self->_address;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_deviceCredential, 0);
}

@end
