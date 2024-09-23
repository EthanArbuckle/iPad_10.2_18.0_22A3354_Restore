@implementation SPPairingSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPPairingSession)initWithIdentifier:(id)a3 nonce:(id)a4
{
  id v7;
  id v8;
  SPPairingSession *v9;
  SPPairingSession *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SPPairingSession;
  v9 = -[SPPairingSession init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_nonce, a4);
  }

  return v10;
}

- (void)updateWithSeed:(id)a3 collaborativeKeyC2:(id)a4 serverSignature:(id)a5 serverPublicKey:(id)a6 maskedAppleID:(id)a7 userMessage:(id)a8 baaIntermediateCert:(id)a9 baaLeafCert:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v23 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  -[SPPairingSession setServerSeed:](self, "setServerSeed:", a3);
  -[SPPairingSession setCollaborativeKeyC2:](self, "setCollaborativeKeyC2:", v22);

  -[SPPairingSession setServerSignature:](self, "setServerSignature:", v21);
  -[SPPairingSession setServerPublicKey:](self, "setServerPublicKey:", v20);

  -[SPPairingSession setMaskedAppleID:](self, "setMaskedAppleID:", v19);
  -[SPPairingSession setUserMessage:](self, "setUserMessage:", v18);

  -[SPPairingSession setBaaIntermediateCert:](self, "setBaaIntermediateCert:", v17);
  -[SPPairingSession setBaaLeaftCert:](self, "setBaaLeaftCert:", v23);

}

- (void)updateWithPayloadSignature:(id)a3 attestation:(id)a4 collaborativeKey:(id)a5 systemVersion:(id)a6 vendorId:(int64_t)a7 productId:(int64_t)a8 ecid:(id)a9 chipId:(id)a10 serialNumber:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v18 = a11;
  v19 = a10;
  v20 = a9;
  v23 = a5;
  v21 = a4;
  v22 = a3;
  -[SPPairingSession setSystemVersion:](self, "setSystemVersion:", a6);
  -[SPPairingSession setVendorId:](self, "setVendorId:", a7);
  -[SPPairingSession setProductId:](self, "setProductId:", a8);
  -[SPPairingSession setEcid:](self, "setEcid:", v20);

  -[SPPairingSession setChipId:](self, "setChipId:", v19);
  -[SPPairingSession setSerialNumber:](self, "setSerialNumber:", v18);

  -[SPPairingSession setPayloadSignature:](self, "setPayloadSignature:", v22);
  -[SPPairingSession setAttestation:](self, "setAttestation:", v21);

  -[SPPairingSession setCollaborativeKeyC1:](self, "setCollaborativeKeyC1:", v23);
}

- (void)updateName:(id)a3 roleId:(int64_t)a4 roleEmoji:(id)a5
{
  id v8;

  v8 = a5;
  -[SPPairingSession setName:](self, "setName:", a3);
  -[SPPairingSession setRoleId:](self, "setRoleId:", a4);
  -[SPPairingSession setRoleEmoji:](self, "setRoleEmoji:", v8);

}

- (void)updateWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPPairingSession setName:](self, "setName:", v5);

  -[SPPairingSession setRoleId:](self, "setRoleId:", objc_msgSend(v4, "roleId"));
  objc_msgSend(v4, "roleEmoji");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPPairingSession setRoleEmoji:](self, "setRoleEmoji:", v6);

  objc_msgSend(v4, "keyStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPPairingSession setKeyGenerationStatus:](self, "setKeyGenerationStatus:", v7);

  objc_msgSend(v4, "collaborativeKeyC3");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPPairingSession setCollaborativeKeyC3:](self, "setCollaborativeKeyC3:", v8);

  objc_msgSend(v4, "signatureS4");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPPairingSession setConfirmSignature:](self, "setConfirmSignature:", v9);

  -[SPPairingSession setIsZeus:](self, "setIsZeus:", objc_msgSend(v4, "isZeus"));
  v10 = objc_msgSend(v4, "batteryLevel");

  -[SPPairingSession setBatteryLevel:](self, "setBatteryLevel:", v10);
}

- (void)updateToPairingUsingTool
{
  -[SPPairingSession setPairingUsingTool:](self, "setPairingUsingTool:", 1);
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_beaconId, CFSTR("beaconId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nonce, CFSTR("nonce"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_pairingUsingTool, CFSTR("pairingUsingTool"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_roleId, CFSTR("roleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_roleEmoji, CFSTR("roleEmoji"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_systemVersion, CFSTR("systemVersion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_vendorId, CFSTR("vendorId"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_productId, CFSTR("productId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ecid, CFSTR("ecid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_chipId, CFSTR("chipId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serialNumber, CFSTR("serialNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_collaborativeKeyC1, CFSTR("collaborativeKeyC1"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_payloadSignature, CFSTR("payloadSignature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attestation, CFSTR("attestation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_systemPublicKey, CFSTR("systemPublicKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_refKeyPublicKey, CFSTR("refKeyPublicKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maskedAppleID, CFSTR("maskedAppleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userMessage, CFSTR("userMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_collaborativeKeyC2, CFSTR("collaborativeKeyC2"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serverSeed, CFSTR("serverSeed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serverSignature, CFSTR("serverSignature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serverPublicKey, CFSTR("serverPublicKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_baaIntermediateCert, CFSTR("baaIntermediateCert"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_baaLeaftCert, CFSTR("baaLeaftCert"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_collaborativeKeyC3, CFSTR("collaborativeKeyC3"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_confirmSignature, CFSTR("confirmSignature"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_ackSuccess, CFSTR("ackSuccess"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyGenerationStatus, CFSTR("keyGenerationStatus"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isZeus, CFSTR("isZeus"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_batteryLevel, CFSTR("batteryLevel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pairingLocation, CFSTR("pairingLocation"));

}

- (SPPairingSession)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *identifier;
  NSUUID *v7;
  NSUUID *beaconId;
  NSData *v9;
  NSData *nonce;
  NSString *v11;
  NSString *name;
  NSString *v13;
  NSString *roleEmoji;
  NSString *v15;
  NSString *systemVersion;
  NSData *v17;
  NSData *ecid;
  NSData *v19;
  NSData *chipId;
  NSString *v21;
  NSString *serialNumber;
  NSData *v23;
  NSData *collaborativeKeyC1;
  NSData *v25;
  NSData *payloadSignature;
  NSData *v27;
  NSData *attestation;
  NSData *v29;
  NSData *systemPublicKey;
  NSData *v31;
  NSData *refKeyPublicKey;
  NSString *v33;
  NSString *maskedAppleID;
  NSString *v35;
  NSString *userMessage;
  NSData *v37;
  NSData *collaborativeKeyC2;
  NSData *v39;
  NSData *serverSeed;
  NSData *v41;
  NSData *serverSignature;
  NSData *v43;
  NSData *serverPublicKey;
  NSData *v45;
  NSData *baaIntermediateCert;
  NSData *v47;
  NSData *baaLeaftCert;
  NSData *v49;
  NSData *collaborativeKeyC3;
  NSData *v51;
  NSData *confirmSignature;
  NSData *v53;
  NSData *keyGenerationStatus;
  CLLocation *v55;
  CLLocation *pairingLocation;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("beaconId"));
  v7 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  beaconId = self->_beaconId;
  self->_beaconId = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nonce"));
  v9 = (NSData *)objc_claimAutoreleasedReturnValue();
  nonce = self->_nonce;
  self->_nonce = v9;

  self->_pairingUsingTool = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pairingUsingTool"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v11;

  self->_roleId = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("roleId"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("roleEmoji"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  roleEmoji = self->_roleEmoji;
  self->_roleEmoji = v13;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemVersion"));
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  systemVersion = self->_systemVersion;
  self->_systemVersion = v15;

  self->_vendorId = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("vendorId"));
  self->_productId = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("productId"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ecid"));
  v17 = (NSData *)objc_claimAutoreleasedReturnValue();
  ecid = self->_ecid;
  self->_ecid = v17;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("chipId"));
  v19 = (NSData *)objc_claimAutoreleasedReturnValue();
  chipId = self->_chipId;
  self->_chipId = v19;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  serialNumber = self->_serialNumber;
  self->_serialNumber = v21;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collaborativeKeyC1"));
  v23 = (NSData *)objc_claimAutoreleasedReturnValue();
  collaborativeKeyC1 = self->_collaborativeKeyC1;
  self->_collaborativeKeyC1 = v23;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payloadSignature"));
  v25 = (NSData *)objc_claimAutoreleasedReturnValue();
  payloadSignature = self->_payloadSignature;
  self->_payloadSignature = v25;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attestation"));
  v27 = (NSData *)objc_claimAutoreleasedReturnValue();
  attestation = self->_attestation;
  self->_attestation = v27;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemPublicKey"));
  v29 = (NSData *)objc_claimAutoreleasedReturnValue();
  systemPublicKey = self->_systemPublicKey;
  self->_systemPublicKey = v29;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("refKeyPublicKey"));
  v31 = (NSData *)objc_claimAutoreleasedReturnValue();
  refKeyPublicKey = self->_refKeyPublicKey;
  self->_refKeyPublicKey = v31;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maskedAppleID"));
  v33 = (NSString *)objc_claimAutoreleasedReturnValue();
  maskedAppleID = self->_maskedAppleID;
  self->_maskedAppleID = v33;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userMessage"));
  v35 = (NSString *)objc_claimAutoreleasedReturnValue();
  userMessage = self->_userMessage;
  self->_userMessage = v35;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collaborativeKeyC2"));
  v37 = (NSData *)objc_claimAutoreleasedReturnValue();
  collaborativeKeyC2 = self->_collaborativeKeyC2;
  self->_collaborativeKeyC2 = v37;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverSeed"));
  v39 = (NSData *)objc_claimAutoreleasedReturnValue();
  serverSeed = self->_serverSeed;
  self->_serverSeed = v39;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverSignature"));
  v41 = (NSData *)objc_claimAutoreleasedReturnValue();
  serverSignature = self->_serverSignature;
  self->_serverSignature = v41;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverPublicKey"));
  v43 = (NSData *)objc_claimAutoreleasedReturnValue();
  serverPublicKey = self->_serverPublicKey;
  self->_serverPublicKey = v43;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baaIntermediateCert"));
  v45 = (NSData *)objc_claimAutoreleasedReturnValue();
  baaIntermediateCert = self->_baaIntermediateCert;
  self->_baaIntermediateCert = v45;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baaLeaftCert"));
  v47 = (NSData *)objc_claimAutoreleasedReturnValue();
  baaLeaftCert = self->_baaLeaftCert;
  self->_baaLeaftCert = v47;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collaborativeKeyC3"));
  v49 = (NSData *)objc_claimAutoreleasedReturnValue();
  collaborativeKeyC3 = self->_collaborativeKeyC3;
  self->_collaborativeKeyC3 = v49;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("confirmSignature"));
  v51 = (NSData *)objc_claimAutoreleasedReturnValue();
  confirmSignature = self->_confirmSignature;
  self->_confirmSignature = v51;

  self->_ackSuccess = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ackSuccess"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyGenerationStatus"));
  v53 = (NSData *)objc_claimAutoreleasedReturnValue();
  keyGenerationStatus = self->_keyGenerationStatus;
  self->_keyGenerationStatus = v53;

  self->_isZeus = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isZeus"));
  self->_batteryLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("batteryLevel"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairingLocation"));
  v55 = (CLLocation *)objc_claimAutoreleasedReturnValue();

  pairingLocation = self->_pairingLocation;
  self->_pairingLocation = v55;

  return self;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SPPairingSession identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)beaconId
{
  return self->_beaconId;
}

- (void)setBeaconId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)roleId
{
  return self->_roleId;
}

- (void)setRoleId:(int64_t)a3
{
  self->_roleId = a3;
}

- (NSString)roleEmoji
{
  return self->_roleEmoji;
}

- (void)setRoleEmoji:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)vendorId
{
  return self->_vendorId;
}

- (void)setVendorId:(int64_t)a3
{
  self->_vendorId = a3;
}

- (int64_t)productId
{
  return self->_productId;
}

- (void)setProductId:(int64_t)a3
{
  self->_productId = a3;
}

- (NSData)ecid
{
  return self->_ecid;
}

- (void)setEcid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSData)chipId
{
  return self->_chipId;
}

- (void)setChipId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSData)collaborativeKeyC1
{
  return self->_collaborativeKeyC1;
}

- (void)setCollaborativeKeyC1:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSData)payloadSignature
{
  return self->_payloadSignature;
}

- (void)setPayloadSignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSData)attestation
{
  return self->_attestation;
}

- (void)setAttestation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSData)systemPublicKey
{
  return self->_systemPublicKey;
}

- (void)setSystemPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSData)refKeyPublicKey
{
  return self->_refKeyPublicKey;
}

- (void)setRefKeyPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSData)collaborativeKeyC2
{
  return self->_collaborativeKeyC2;
}

- (void)setCollaborativeKeyC2:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSData)serverSeed
{
  return self->_serverSeed;
}

- (void)setServerSeed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSData)serverSignature
{
  return self->_serverSignature;
}

- (void)setServerSignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSData)serverPublicKey
{
  return self->_serverPublicKey;
}

- (void)setServerPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)maskedAppleID
{
  return self->_maskedAppleID;
}

- (void)setMaskedAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)userMessage
{
  return self->_userMessage;
}

- (void)setUserMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSData)baaLeaftCert
{
  return self->_baaLeaftCert;
}

- (void)setBaaLeaftCert:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSData)baaIntermediateCert
{
  return self->_baaIntermediateCert;
}

- (void)setBaaIntermediateCert:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSData)collaborativeKeyC3
{
  return self->_collaborativeKeyC3;
}

- (void)setCollaborativeKeyC3:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSData)confirmSignature
{
  return self->_confirmSignature;
}

- (void)setConfirmSignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (BOOL)ackSuccess
{
  return self->_ackSuccess;
}

- (void)setAckSuccess:(BOOL)a3
{
  self->_ackSuccess = a3;
}

- (NSData)keyGenerationStatus
{
  return self->_keyGenerationStatus;
}

- (void)setKeyGenerationStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (BOOL)isZeus
{
  return self->_isZeus;
}

- (void)setIsZeus:(BOOL)a3
{
  self->_isZeus = a3;
}

- (int64_t)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(int64_t)a3
{
  self->_batteryLevel = a3;
}

- (CLLocation)pairingLocation
{
  return self->_pairingLocation;
}

- (void)setPairingLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (BOOL)pairingUsingTool
{
  return self->_pairingUsingTool;
}

- (void)setPairingUsingTool:(BOOL)a3
{
  self->_pairingUsingTool = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingLocation, 0);
  objc_storeStrong((id *)&self->_keyGenerationStatus, 0);
  objc_storeStrong((id *)&self->_confirmSignature, 0);
  objc_storeStrong((id *)&self->_collaborativeKeyC3, 0);
  objc_storeStrong((id *)&self->_baaIntermediateCert, 0);
  objc_storeStrong((id *)&self->_baaLeaftCert, 0);
  objc_storeStrong((id *)&self->_userMessage, 0);
  objc_storeStrong((id *)&self->_maskedAppleID, 0);
  objc_storeStrong((id *)&self->_serverPublicKey, 0);
  objc_storeStrong((id *)&self->_serverSignature, 0);
  objc_storeStrong((id *)&self->_serverSeed, 0);
  objc_storeStrong((id *)&self->_collaborativeKeyC2, 0);
  objc_storeStrong((id *)&self->_refKeyPublicKey, 0);
  objc_storeStrong((id *)&self->_systemPublicKey, 0);
  objc_storeStrong((id *)&self->_attestation, 0);
  objc_storeStrong((id *)&self->_payloadSignature, 0);
  objc_storeStrong((id *)&self->_collaborativeKeyC1, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_chipId, 0);
  objc_storeStrong((id *)&self->_ecid, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_roleEmoji, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_beaconId, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
