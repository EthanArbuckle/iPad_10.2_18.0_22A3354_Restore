@implementation PURemotePasscodePolicy

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  unint64_t v8;

  v4 = a3;
  if (v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (v5 = -[PURemotePasscodePolicy isModificationAllowed](self, "isModificationAllowed"),
        v5 == objc_msgSend(v4, "isModificationAllowed")))
  {
    v8 = -[PURemotePasscodePolicy passcodeMinimumLength](self, "passcodeMinimumLength");
    v6 = v8 == objc_msgSend(v4, "passcodeMinimumLength");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[PURemotePasscodePolicy isModificationAllowed](self, "isModificationAllowed"), CFSTR("isModificationAllowed"));
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[PURemotePasscodePolicy passcodeMinimumLength](self, "passcodeMinimumLength"), CFSTR("passcodeMinimumLength"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  id v3;
  id v4;
  id v5;
  unint64_t v6;

  v3 = objc_alloc_init(MEMORY[0x24BE0BE28]);
  v4 = (id)objc_msgSend(v3, "appendBool:", -[PURemotePasscodePolicy isModificationAllowed](self, "isModificationAllowed"));
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[PURemotePasscodePolicy passcodeMinimumLength](self, "passcodeMinimumLength"));
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PURemotePasscodePolicy)initWithCoder:(id)a3
{
  id v4;
  PURemotePasscodePolicy *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PURemotePasscodePolicy;
  v5 = -[PURemotePasscodePolicy init](&v7, sel_init);
  if (v5)
  {
    v5->_modificationAllowed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kPURemotePasscodePolicy_ModificationAllowed"));
    v5->_passcodeMinimumLength = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kPURemotePasscodePolicy_MinimumLength"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 modificationAllowed;
  id v5;

  modificationAllowed = self->_modificationAllowed;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", modificationAllowed, CFSTR("kPURemotePasscodePolicy_ModificationAllowed"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_passcodeMinimumLength, CFSTR("kPURemotePasscodePolicy_MinimumLength"));

}

- (BOOL)isModificationAllowed
{
  return self->_modificationAllowed;
}

- (void)setModificationAllowed:(BOOL)a3
{
  self->_modificationAllowed = a3;
}

- (unint64_t)passcodeMinimumLength
{
  return self->_passcodeMinimumLength;
}

- (void)setPasscodeMinimumLength:(unint64_t)a3
{
  self->_passcodeMinimumLength = a3;
}

@end
