@implementation SPPairingConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPPairingConfiguration)initWithName:(id)a3 roleId:(int64_t)a4 roleEmoji:(id)a5 keyStatus:(id)a6 collaborativeKeyC3:(id)a7 signatureS4:(id)a8 isZeus:(BOOL)a9 batteryLevel:(int64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  SPPairingConfiguration *v20;
  SPPairingConfiguration *v21;
  id v24;
  objc_super v25;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v24 = a7;
  v19 = a8;
  v25.receiver = self;
  v25.super_class = (Class)SPPairingConfiguration;
  v20 = -[SPPairingConfiguration init](&v25, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_name, a3);
    v21->_roleId = a4;
    objc_storeStrong((id *)&v21->_roleEmoji, a5);
    objc_storeStrong((id *)&v21->_collaborativeKeyC3, a7);
    objc_storeStrong((id *)&v21->_signatureS4, a8);
    objc_storeStrong((id *)&v21->_keyStatus, a6);
    v21->_isZeus = a9;
    v21->_batteryLevel = a10;
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPPairingConfiguration *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SPPairingConfiguration *v11;
  uint64_t v13;

  v4 = [SPPairingConfiguration alloc];
  -[SPPairingConfiguration name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SPPairingConfiguration roleId](self, "roleId");
  -[SPPairingConfiguration roleEmoji](self, "roleEmoji");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPPairingConfiguration keyStatus](self, "keyStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPPairingConfiguration collaborativeKeyC3](self, "collaborativeKeyC3");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPPairingConfiguration signatureS4](self, "signatureS4");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = -[SPPairingConfiguration isZeus](self, "isZeus");
  v11 = -[SPPairingConfiguration initWithName:roleId:roleEmoji:keyStatus:collaborativeKeyC3:signatureS4:isZeus:batteryLevel:](v4, "initWithName:roleId:roleEmoji:keyStatus:collaborativeKeyC3:signatureS4:isZeus:batteryLevel:", v5, v6, v7, v8, v9, v10, v13, -[SPPairingConfiguration batteryLevel](self, "batteryLevel"));

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_roleId, CFSTR("roleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_roleEmoji, CFSTR("roleEmoji"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_collaborativeKeyC3, CFSTR("collaborativeKeyC3"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signatureS4, CFSTR("signatureS4"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyStatus, CFSTR("keyStatus"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isZeus, CFSTR("isZeus"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_batteryLevel, CFSTR("batteryLevel"));

}

- (SPPairingConfiguration)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *name;
  NSString *v7;
  NSString *roleEmoji;
  NSData *v9;
  NSData *collaborativeKeyC3;
  NSData *v11;
  NSData *signatureS4;
  NSData *v13;
  NSData *keyStatus;
  int64_t v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v5;

  self->_roleId = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("roleId"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("roleEmoji"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  roleEmoji = self->_roleEmoji;
  self->_roleEmoji = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("collaborativeKeyC3"));
  v9 = (NSData *)objc_claimAutoreleasedReturnValue();
  collaborativeKeyC3 = self->_collaborativeKeyC3;
  self->_collaborativeKeyC3 = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signatureS4"));
  v11 = (NSData *)objc_claimAutoreleasedReturnValue();
  signatureS4 = self->_signatureS4;
  self->_signatureS4 = v11;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyStatus"));
  v13 = (NSData *)objc_claimAutoreleasedReturnValue();
  keyStatus = self->_keyStatus;
  self->_keyStatus = v13;

  self->_isZeus = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isZeus"));
  v15 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("batteryLevel"));

  self->_batteryLevel = v15;
  return self;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)collaborativeKeyC3
{
  return self->_collaborativeKeyC3;
}

- (void)setCollaborativeKeyC3:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSData)signatureS4
{
  return self->_signatureS4;
}

- (void)setSignatureS4:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)keyStatus
{
  return self->_keyStatus;
}

- (void)setKeyStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyStatus, 0);
  objc_storeStrong((id *)&self->_signatureS4, 0);
  objc_storeStrong((id *)&self->_collaborativeKeyC3, 0);
  objc_storeStrong((id *)&self->_roleEmoji, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
