@implementation WBSPasskeyAutoFillFromNearbyDeviceOptions

- (WBSPasskeyAutoFillFromNearbyDeviceOptions)initWithOperationUUID:(id)a3
{
  id v5;
  WBSPasskeyAutoFillFromNearbyDeviceOptions *v6;
  WBSPasskeyAutoFillFromNearbyDeviceOptions *v7;
  WBSPasskeyAutoFillFromNearbyDeviceOptions *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSPasskeyAutoFillFromNearbyDeviceOptions;
  v6 = -[WBSPasskeyAutoFillFromNearbyDeviceOptions init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_operationUUID, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSPasskeyAutoFillFromNearbyDeviceOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WBSPasskeyAutoFillFromNearbyDeviceOptions *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("operationUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WBSPasskeyAutoFillFromNearbyDeviceOptions initWithOperationUUID:](self, "initWithOperationUUID:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_operationUUID, CFSTR("operationUUID"));
}

- (NSUUID)operationUUID
{
  return self->_operationUUID;
}

- (NSXPCListenerEndpoint)agentEndpoint
{
  return self->_agentEndpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agentEndpoint, 0);
  objc_storeStrong((id *)&self->_operationUUID, 0);
}

@end
