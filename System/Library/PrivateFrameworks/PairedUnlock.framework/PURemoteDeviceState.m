@implementation PURemoteDeviceState

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  id v8;
  id v9;
  _BOOL8 v10;
  id v11;
  id v12;
  _BOOL8 v13;
  id v14;
  id v15;
  _BOOL8 v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PURemoteDeviceState hasPasscodeSet](self, "hasPasscodeSet");
  v7 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __31__PURemoteDeviceState_isEqual___block_invoke;
  v31[3] = &unk_24D800B18;
  v8 = v4;
  v32 = v8;
  v9 = (id)objc_msgSend(v5, "appendBool:counterpart:", v6, v31);
  v10 = -[PURemoteDeviceState isUnlockOnly](self, "isUnlockOnly");
  v29[0] = v7;
  v29[1] = 3221225472;
  v29[2] = __31__PURemoteDeviceState_isEqual___block_invoke_2;
  v29[3] = &unk_24D800B18;
  v11 = v8;
  v30 = v11;
  v12 = (id)objc_msgSend(v5, "appendBool:counterpart:", v10, v29);
  v13 = -[PURemoteDeviceState isPasscodeLocked](self, "isPasscodeLocked");
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __31__PURemoteDeviceState_isEqual___block_invoke_3;
  v27[3] = &unk_24D800B18;
  v14 = v11;
  v28 = v14;
  v15 = (id)objc_msgSend(v5, "appendBool:counterpart:", v13, v27);
  v16 = -[PURemoteDeviceState isWristDetectEnabled](self, "isWristDetectEnabled");
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __31__PURemoteDeviceState_isEqual___block_invoke_4;
  v25[3] = &unk_24D800B18;
  v17 = v14;
  v26 = v17;
  v18 = (id)objc_msgSend(v5, "appendBool:counterpart:", v16, v25);
  -[PURemoteDeviceState passcodePolicy](self, "passcodePolicy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __31__PURemoteDeviceState_isEqual___block_invoke_5;
  v23[3] = &unk_24D800B40;
  v24 = v17;
  v20 = v17;
  v21 = (id)objc_msgSend(v5, "appendObject:counterpart:", v19, v23);

  LOBYTE(v19) = objc_msgSend(v5, "isEqual");
  return (char)v19;
}

uint64_t __31__PURemoteDeviceState_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasPasscodeSet");
}

uint64_t __31__PURemoteDeviceState_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isUnlockOnly");
}

uint64_t __31__PURemoteDeviceState_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isPasscodeLocked");
}

uint64_t __31__PURemoteDeviceState_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isWristDetectEnabled");
}

uint64_t __31__PURemoteDeviceState_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "passcodePolicy");
}

- (unint64_t)hash
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;

  v3 = objc_alloc_init(MEMORY[0x24BE0BE28]);
  v4 = (id)objc_msgSend(v3, "appendBool:", -[PURemoteDeviceState hasPasscodeSet](self, "hasPasscodeSet"));
  v5 = (id)objc_msgSend(v3, "appendBool:", -[PURemoteDeviceState isUnlockOnly](self, "isUnlockOnly"));
  v6 = (id)objc_msgSend(v3, "appendBool:", -[PURemoteDeviceState isPasscodeLocked](self, "isPasscodeLocked"));
  v7 = (id)objc_msgSend(v3, "appendBool:", -[PURemoteDeviceState isWristDetectEnabled](self, "isWristDetectEnabled"));
  -[PURemoteDeviceState passcodePolicy](self, "passcodePolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:", v8);

  v10 = objc_msgSend(v3, "hash");
  return v10;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInt:withName:", self->_version, CFSTR("version"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_passcodeSet, CFSTR("passcodeSet"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_unlockOnly, CFSTR("isUnlockOnly"), 1);
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", self->_passcodeLocked, CFSTR("isPasscodeLocked"));
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", self->_wristDetectEnabled, CFSTR("wristDetectEnabled"));
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", self->_passcodePolicy, CFSTR("policy"));
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PURemoteDeviceState)initWithCoder:(id)a3
{
  id v4;
  PURemoteDeviceState *v5;
  uint64_t v6;
  PURemotePasscodePolicy *passcodePolicy;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PURemoteDeviceState;
  v5 = -[PURemoteDeviceState init](&v9, sel_init);
  if (v5)
  {
    v5->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kPURemoteDeviceState_Version"));
    v5->_passcodeSet = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kPURemoteDeviceState_PasscodeSet"));
    v5->_passcodeLocked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kPURemoteDeviceState_PasscodeLocked"));
    v5->_unlockOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kPURemoteDeviceState_UnlockOnly"));
    v5->_wristDetectEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kPURemoteDeviceState_WristDetectEnabled"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("kPURemoteDeviceState_PasscodePolicy"));
    v6 = objc_claimAutoreleasedReturnValue();
    passcodePolicy = v5->_passcodePolicy;
    v5->_passcodePolicy = (PURemotePasscodePolicy *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t version;
  id v5;

  version = self->_version;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", version, CFSTR("kPURemoteDeviceState_Version"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_passcodeSet, CFSTR("kPURemoteDeviceState_PasscodeSet"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_passcodeLocked, CFSTR("kPURemoteDeviceState_PasscodeLocked"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_unlockOnly, CFSTR("kPURemoteDeviceState_UnlockOnly"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_wristDetectEnabled, CFSTR("kPURemoteDeviceState_WristDetectEnabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passcodePolicy, CFSTR("kPURemoteDeviceState_PasscodePolicy"));

}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (BOOL)hasPasscodeSet
{
  return self->_passcodeSet;
}

- (void)setPasscodeSet:(BOOL)a3
{
  self->_passcodeSet = a3;
}

- (BOOL)isPasscodeLocked
{
  return self->_passcodeLocked;
}

- (void)setPasscodeLocked:(BOOL)a3
{
  self->_passcodeLocked = a3;
}

- (BOOL)isUnlockOnly
{
  return self->_unlockOnly;
}

- (void)setUnlockOnly:(BOOL)a3
{
  self->_unlockOnly = a3;
}

- (BOOL)isWristDetectEnabled
{
  return self->_wristDetectEnabled;
}

- (void)setWristDetectEnabled:(BOOL)a3
{
  self->_wristDetectEnabled = a3;
}

- (PURemotePasscodePolicy)passcodePolicy
{
  return self->_passcodePolicy;
}

- (void)setPasscodePolicy:(id)a3
{
  objc_storeStrong((id *)&self->_passcodePolicy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodePolicy, 0);
}

@end
