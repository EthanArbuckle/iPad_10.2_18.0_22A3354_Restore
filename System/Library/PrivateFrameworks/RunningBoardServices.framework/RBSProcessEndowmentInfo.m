@implementation RBSProcessEndowmentInfo

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (RBSProcessEndowmentInfo)initWithRBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  RBSProcessEndowmentInfo *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("namespace"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("environment"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("encodedEndowment"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  RBSXPCUnpackObject(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[RBSProcessEndowmentInfo _initWithNamespace:environment:encodedEndowment:](self, "_initWithNamespace:environment:encodedEndowment:", v5, v6, v8);

  return v9;
}

- (id)_initWithNamespace:(id)a3 environment:(id)a4 encodedEndowment:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  RBSProcessEndowmentInfo *v12;
  uint64_t v13;
  NSString *endowmentNamespace;
  uint64_t v15;
  NSString *environment;
  void *v17;
  uint64_t v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    rbs_state_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[RBSProcessEndowmentInfo _initWithNamespace:environment:encodedEndowment:].cold.1(v11);

  }
  v20.receiver = self;
  v20.super_class = (Class)RBSProcessEndowmentInfo;
  v12 = -[RBSProcessEndowmentInfo init](&v20, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v8, "copy");
    endowmentNamespace = v12->_endowmentNamespace;
    v12->_endowmentNamespace = (NSString *)v13;

    v15 = objc_msgSend(v9, "copy");
    environment = v12->_environment;
    v12->_environment = (NSString *)v15;

    objc_storeStrong((id *)&v12->_encodedEndowment, a5);
    -[OS_xpc_object description](v12->_encodedEndowment, "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_encodedEndowmentHash = objc_msgSend(v17, "hash");

    v18 = -[NSString hash](v12->_endowmentNamespace, "hash");
    v12->_hash = -[NSString hash](v12->_environment, "hash") ^ v18;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedEndowment, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_endowmentNamespace, 0);
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  NSString *endowmentNamespace;
  id v5;
  id v6;

  endowmentNamespace = self->_endowmentNamespace;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", endowmentNamespace, CFSTR("namespace"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_environment, CFSTR("environment"));
  RBSXPCPackObject(self->_encodedEndowment);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeXPCObject:forKey:", v6, CFSTR("encodedEndowment"));

}

- (BOOL)isEqual:(id)a3
{
  RBSProcessEndowmentInfo *v4;
  uint64_t v5;
  uint64_t v6;
  NSString *environment;
  NSString *v8;
  char v9;
  NSString *endowmentNamespace;
  NSString *v11;

  v4 = (RBSProcessEndowmentInfo *)a3;
  if (self == v4)
    goto LABEL_17;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_16;
  if (self->_hash != v4->_hash)
    goto LABEL_16;
  if (self->_encodedEndowment)
  {
    if (v4->_encodedEndowment)
    {
      v6 = MEMORY[0x194019424]();
      if (v6 != MEMORY[0x194019424](v4->_encodedEndowment)
        || !xpc_equal(self->_encodedEndowment, v4->_encodedEndowment))
      {
        goto LABEL_16;
      }
    }
  }
  environment = self->_environment;
  v8 = v4->_environment;
  if (environment != v8)
  {
    v9 = 0;
    if (!environment || !v8)
      goto LABEL_18;
    if (!-[NSString isEqual:](environment, "isEqual:"))
    {
LABEL_16:
      v9 = 0;
      goto LABEL_18;
    }
  }
  endowmentNamespace = self->_endowmentNamespace;
  v11 = v4->_endowmentNamespace;
  if (endowmentNamespace == v11)
  {
LABEL_17:
    v9 = 1;
    goto LABEL_18;
  }
  v9 = 0;
  if (endowmentNamespace && v11)
    v9 = -[NSString isEqual:](endowmentNamespace, "isEqual:");
LABEL_18:

  return v9;
}

- (NSString)description
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("payload:");
  if (!self->_encodedEndowment)
    v6 = &stru_1E2D183D0;
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| namespace:%@ env:%@ %@ %lu>"), v4, self->_endowmentNamespace, self->_environment, v6, self->_encodedEndowmentHash);

  return (NSString *)v7;
}

- (id)endowment
{
  return RBSEndowmentDecode(self->_encodedEndowment);
}

- (NSString)endowmentNamespace
{
  return self->_endowmentNamespace;
}

- (NSString)environment
{
  return self->_environment;
}

- (OS_xpc_object)encodedEndowment
{
  return self->_encodedEndowment;
}

- (void)_initWithNamespace:(os_log_t)log environment:encodedEndowment:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_190CD6000, log, OS_LOG_TYPE_DEBUG, "endowmentNamespace can not be nil", v1, 2u);
}

@end
