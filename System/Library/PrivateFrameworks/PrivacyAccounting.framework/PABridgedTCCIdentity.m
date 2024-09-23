@implementation PABridgedTCCIdentity

- (PABridgedTCCIdentity)initWithTCCIdentity:(id)a3
{
  id v5;
  PABridgedTCCIdentity *v6;
  PABridgedTCCIdentity *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PABridgedTCCIdentity;
  v6 = -[PABridgedTCCIdentity init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identity, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PABridgedTCCIdentity)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PABridgedTCCIdentity *v13;
  PABridgedTCCIdentity *v14;
  _QWORD v16[2];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v17[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9, v16[0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v7, v10, CFSTR("identity"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = 0;
    goto LABEL_5;
  }
  v12 = (void *)tcc_identity_create_from_external_representation();
  if (!v12)
  {
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  self = -[PABridgedTCCIdentity initWithTCCIdentity:](self, "initWithTCCIdentity:", v12);
  v13 = self;
LABEL_6:
  v14 = v13;

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)tcc_identity_copy_external_representation();
  objc_msgSend(v3, "encodeObject:forKey:", v4, CFSTR("identity"));

}

- (unint64_t)hash
{
  uint64_t type;
  void *v3;
  uint64_t v4;
  uint64_t verifier_type;
  unint64_t v6;
  void *v7;

  type = tcc_identity_get_type();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", tcc_identity_get_identifier());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash") - type + 32 * type;

  verifier_type = tcc_identity_get_verifier_type();
  v6 = verifier_type - v4 + 32 * v4;
  if (verifier_type)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", tcc_identity_get_verifier_code_requirement_string());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "hash") - v6 + 32 * v6;

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PABridgedTCCIdentity *v4;
  char v5;

  v4 = (PABridgedTCCIdentity *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else if (-[PABridgedTCCIdentity isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = areTCCIdentitiesEqual(self->_identity, v4->_identity);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)description
{
  return (id)tcc_object_copy_description();
}

- (OS_tcc_identity)identity
{
  return self->_identity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
