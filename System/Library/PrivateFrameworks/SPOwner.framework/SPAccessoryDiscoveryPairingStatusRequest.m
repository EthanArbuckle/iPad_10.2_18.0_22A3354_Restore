@implementation SPAccessoryDiscoveryPairingStatusRequest

- (SPAccessoryDiscoveryPairingStatusRequest)initWithIdentifier:(id)a3
{
  id v5;
  SPAccessoryDiscoveryPairingStatusRequest *v6;
  SPAccessoryDiscoveryPairingStatusRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPAccessoryDiscoveryPairingStatusRequest;
  v6 = -[SPAccessoryDiscoveryPairingStatusRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    *(_DWORD *)&v7->_wantsLostModeInfo = 16843008;
  }

  return v7;
}

+ (id)checkSerialNumberWithIdentifier:(id)a3
{
  id v3;
  SPAccessoryDiscoveryPairingStatusRequest *v4;

  v3 = a3;
  v4 = -[SPAccessoryDiscoveryPairingStatusRequest initWithIdentifier:]([SPAccessoryDiscoveryPairingStatusRequest alloc], "initWithIdentifier:", v3);

  -[SPAccessoryDiscoveryPairingStatusRequest setWantsLostModeInfo:](v4, "setWantsLostModeInfo:", 0);
  -[SPAccessoryDiscoveryPairingStatusRequest setCheckSerialNumber:](v4, "setCheckSerialNumber:", 1);
  -[SPAccessoryDiscoveryPairingStatusRequest setVerifyFMNID:](v4, "setVerifyFMNID:", 0);
  -[SPAccessoryDiscoveryPairingStatusRequest setVerifyWithServer:](v4, "setVerifyWithServer:", 0);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPAccessoryDiscoveryPairingStatusRequest *v4;
  void *v5;
  SPAccessoryDiscoveryPairingStatusRequest *v6;

  v4 = [SPAccessoryDiscoveryPairingStatusRequest alloc];
  -[SPAccessoryDiscoveryPairingStatusRequest identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SPAccessoryDiscoveryPairingStatusRequest initWithIdentifier:](v4, "initWithIdentifier:", v5);

  -[SPAccessoryDiscoveryPairingStatusRequest setWantsLostModeInfo:](v6, "setWantsLostModeInfo:", -[SPAccessoryDiscoveryPairingStatusRequest wantsLostModeInfo](self, "wantsLostModeInfo"));
  -[SPAccessoryDiscoveryPairingStatusRequest setCheckSerialNumber:](v6, "setCheckSerialNumber:", -[SPAccessoryDiscoveryPairingStatusRequest checkSerialNumber](self, "checkSerialNumber"));
  -[SPAccessoryDiscoveryPairingStatusRequest setVerifyFMNID:](v6, "setVerifyFMNID:", -[SPAccessoryDiscoveryPairingStatusRequest verifyFMNID](self, "verifyFMNID"));
  -[SPAccessoryDiscoveryPairingStatusRequest setVerifyWithServer:](v6, "setVerifyWithServer:", -[SPAccessoryDiscoveryPairingStatusRequest verifyWithServer](self, "verifyWithServer"));
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_wantsLostModeInfo, CFSTR("wantsLostModeInfo"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_checkSerialNumber, CFSTR("checkSerialNumber"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_verifyFMNID, CFSTR("verifyFMNID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_verifyWithServer, CFSTR("verifyWithServer"));

}

- (SPAccessoryDiscoveryPairingStatusRequest)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *identifier;
  char v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v5;

  self->_wantsLostModeInfo = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wantsLostModeInfo"));
  self->_checkSerialNumber = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("checkSerialNumber"));
  self->_verifyFMNID = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("verifyFMNID"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("verifyWithServer"));

  self->_verifyWithServer = v7;
  return self;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)wantsLostModeInfo
{
  return self->_wantsLostModeInfo;
}

- (void)setWantsLostModeInfo:(BOOL)a3
{
  self->_wantsLostModeInfo = a3;
}

- (BOOL)checkSerialNumber
{
  return self->_checkSerialNumber;
}

- (void)setCheckSerialNumber:(BOOL)a3
{
  self->_checkSerialNumber = a3;
}

- (BOOL)verifyFMNID
{
  return self->_verifyFMNID;
}

- (void)setVerifyFMNID:(BOOL)a3
{
  self->_verifyFMNID = a3;
}

- (BOOL)verifyWithServer
{
  return self->_verifyWithServer;
}

- (void)setVerifyWithServer:(BOOL)a3
{
  self->_verifyWithServer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
