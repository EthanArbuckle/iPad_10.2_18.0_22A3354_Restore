@implementation PSYSyncOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PSYSyncOptions)initWithCoder:(id)a3
{
  id v4;
  PSYSyncOptions *v5;
  uint64_t v6;
  PSYTestInput *testInput;
  uint64_t v8;
  NSUUID *pairingIdentifier;
  uint64_t v10;
  NSUUID *sessionIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PSYSyncOptions;
  v5 = -[PSYSyncOptions init](&v13, sel_init);
  if (v5)
  {
    v5->_dryRun = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dryRun"));
    v5->_terminateDuringDryRun = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("terminateDuringDryRun"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("testInput"));
    v6 = objc_claimAutoreleasedReturnValue();
    testInput = v5->_testInput;
    v5->_testInput = (PSYTestInput *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairingIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    pairingIdentifier = v5->_pairingIdentifier;
    v5->_pairingIdentifier = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSUUID *)v10;

    v5->_syncSessionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("syncSessionType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 dryRun;
  id v5;

  dryRun = self->_dryRun;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", dryRun, CFSTR("dryRun"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_terminateDuringDryRun, CFSTR("terminateDuringDryRun"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_testInput, CFSTR("testInput"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pairingIdentifier, CFSTR("pairingIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionIdentifier, CFSTR("sessionIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_syncSessionType, CFSTR("syncSessionType"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NSUUID UUIDString](self->_pairingIdentifier, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_sessionIdentifier, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringfromPSYSyncSessionType(self->_syncSessionType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("pairingIdentifier=%@ sessionIdentifier=%@ syncSessionType=%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)dryRun
{
  return self->_dryRun;
}

- (void)setDryRun:(BOOL)a3
{
  self->_dryRun = a3;
}

- (BOOL)terminateDuringDryRun
{
  return self->_terminateDuringDryRun;
}

- (void)setTerminateDuringDryRun:(BOOL)a3
{
  self->_terminateDuringDryRun = a3;
}

- (PSYTestInput)testInput
{
  return self->_testInput;
}

- (void)setTestInput:(id)a3
{
  objc_storeStrong((id *)&self->_testInput, a3);
}

- (NSUUID)pairingIdentifier
{
  return self->_pairingIdentifier;
}

- (void)setPairingIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_pairingIdentifier, a3);
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
}

- (unint64_t)syncSessionType
{
  return self->_syncSessionType;
}

- (void)setSyncSessionType:(unint64_t)a3
{
  self->_syncSessionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_pairingIdentifier, 0);
  objc_storeStrong((id *)&self->_testInput, 0);
}

@end
