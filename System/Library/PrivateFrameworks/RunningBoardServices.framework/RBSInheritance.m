@implementation RBSInheritance

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (RBSAssertionIdentifier)originatingIdentifier
{
  return self->_originatingIdentifier;
}

- (NSString)endowmentNamespace
{
  return self->_endowmentNamespace;
}

- (RBSInheritance)initWithRBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  RBSInheritance *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("namespace"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("environment"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("encodedEndowment"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  RBSXPCUnpackObject(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originatingIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("originatingAttributePath"));

  v11 = -[RBSInheritance _initWithNamespace:environment:encodedEndowment:originatingIdentifier:attributePath:](self, "_initWithNamespace:environment:encodedEndowment:originatingIdentifier:attributePath:", v5, v6, v8, v9, v10);
  return v11;
}

- (NSString)description
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *environment;
  const __CFString *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  environment = CFSTR("(none)");
  if (self->_environment)
    environment = (const __CFString *)self->_environment;
  v7 = CFSTR(" payload");
  if (!self->_encodedEndowment)
    v7 = &stru_1E2D183D0;
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| environment:%@ name:%@ origID:%@%@ %lu>"), v4, environment, self->_endowmentNamespace, self->_originatingIdentifier, v7, self->_encodedEndowmentHash);

  return (NSString *)v8;
}

- (id)_initWithNamespace:(id)a3 environment:(id)a4 encodedEndowment:(id)a5 originatingIdentifier:(id)a6 attributePath:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  RBSInheritance *v17;
  uint64_t v18;
  NSString *endowmentNamespace;
  uint64_t v20;
  NSString *environment;
  uint64_t v22;
  RBSAssertionIdentifier *originatingIdentifier;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  void *v30;
  objc_super v31;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSInheritance.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endowmentNamespace != nil"));

  }
  v31.receiver = self;
  v31.super_class = (Class)RBSInheritance;
  v17 = -[RBSInheritance init](&v31, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v13, "copy");
    endowmentNamespace = v17->_endowmentNamespace;
    v17->_endowmentNamespace = (NSString *)v18;

    v20 = objc_msgSend(v14, "copy");
    environment = v17->_environment;
    v17->_environment = (NSString *)v20;

    objc_storeStrong((id *)&v17->_encodedEndowment, a5);
    v22 = objc_msgSend(v16, "copy");
    originatingIdentifier = v17->_originatingIdentifier;
    v17->_originatingIdentifier = (RBSAssertionIdentifier *)v22;

    v17->_originatingAttributePath = a7;
    v24 = -[RBSAssertionIdentifier hash](v17->_originatingIdentifier, "hash");
    v25 = 0xBF58476D1CE4E5B9 * (v17->_originatingAttributePath ^ (v17->_originatingAttributePath >> 30));
    v26 = 0x94D049BB133111EBLL * (v25 ^ (v25 >> 27));
    v27 = -[NSString hash](v17->_endowmentNamespace, "hash");
    v17->_hash = v27 ^ v24 ^ -[NSString hash](v17->_environment, "hash") ^ (v26 >> 31) ^ v26;
    -[OS_xpc_object description](v17->_encodedEndowment, "description");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_encodedEndowmentHash = objc_msgSend(v28, "hash");

  }
  return v17;
}

- (NSString)environment
{
  return self->_environment;
}

- (OS_xpc_object)encodedEndowment
{
  return self->_encodedEndowment;
}

- (BOOL)isEqual:(id)a3
{
  RBSInheritance *v4;
  uint64_t v5;
  uint64_t v6;
  RBSAssertionIdentifier *originatingIdentifier;
  RBSAssertionIdentifier *v8;
  char v9;
  NSString *environment;
  NSString *v11;
  NSString *endowmentNamespace;
  NSString *v13;

  v4 = (RBSInheritance *)a3;
  if (self == v4)
    goto LABEL_21;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_20;
  if (self->_hash != v4->_hash)
    goto LABEL_20;
  if (self->_originatingAttributePath != v4->_originatingAttributePath)
    goto LABEL_20;
  if (self->_encodedEndowment)
  {
    if (v4->_encodedEndowment)
    {
      v6 = MEMORY[0x194019424]();
      if (v6 != MEMORY[0x194019424](v4->_encodedEndowment))
        goto LABEL_20;
    }
  }
  originatingIdentifier = self->_originatingIdentifier;
  v8 = v4->_originatingIdentifier;
  if (originatingIdentifier != v8)
  {
    v9 = 0;
    if (!originatingIdentifier || !v8)
      goto LABEL_22;
    if (!-[RBSAssertionIdentifier isEqual:](originatingIdentifier, "isEqual:"))
      goto LABEL_20;
  }
  environment = self->_environment;
  v11 = v4->_environment;
  if (environment != v11)
  {
    v9 = 0;
    if (!environment || !v11)
      goto LABEL_22;
    if (!-[NSString isEqual:](environment, "isEqual:"))
    {
LABEL_20:
      v9 = 0;
      goto LABEL_22;
    }
  }
  endowmentNamespace = self->_endowmentNamespace;
  v13 = v4->_endowmentNamespace;
  if (endowmentNamespace == v13)
  {
LABEL_21:
    v9 = 1;
    goto LABEL_22;
  }
  v9 = 0;
  if (endowmentNamespace && v13)
    v9 = -[NSString isEqual:](endowmentNamespace, "isEqual:");
LABEL_22:

  return v9;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  NSString *endowmentNamespace;
  void *v5;
  id v6;

  endowmentNamespace = self->_endowmentNamespace;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", endowmentNamespace, CFSTR("namespace"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_environment, CFSTR("environment"));
  RBSXPCPackObject(self->_encodedEndowment);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeXPCObject:forKey:", v5, CFSTR("encodedEndowment"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_originatingIdentifier, CFSTR("originatingIdentifier"));
  objc_msgSend(v6, "encodeUInt64:forKey:", self->_originatingAttributePath, CFSTR("originatingAttributePath"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingIdentifier, 0);
  objc_storeStrong((id *)&self->_encodedEndowment, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_endowmentNamespace, 0);
}

- (RBSInheritance)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSInheritance.m"), 41, CFSTR("cannot call -init on RBSInheritance"));

  return 0;
}

- (id)endowment
{
  return RBSEndowmentDecode(self->_encodedEndowment);
}

@end
