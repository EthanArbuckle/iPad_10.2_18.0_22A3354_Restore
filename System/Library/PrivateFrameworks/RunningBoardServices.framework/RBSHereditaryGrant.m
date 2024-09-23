@implementation RBSHereditaryGrant

- (RBSHereditaryGrant)initWithRBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  RBSHereditaryGrant *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  RBSHereditaryGrant *v23;
  RBSHereditaryGrant *v24;
  uint64_t v25;
  uint64_t v26;
  NSArray *attributes;
  objc_super v29;

  v4 = a3;
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("_endowmentNamespace"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sourceEnvironment"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("_encodedEndowment"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    RBSXPCUnpackObject(v7);
    v8 = objc_claimAutoreleasedReturnValue();

    if (v6 | v8)
    {
      v29.receiver = self;
      v29.super_class = (Class)RBSHereditaryGrant;
      v23 = -[RBSAttribute initWithRBSXPCCoder:](&v29, sel_initWithRBSXPCCoder_, v4);
      v24 = v23;
      if (v23)
      {
        objc_storeStrong((id *)&v23->_endowmentNamespace, v5);
        objc_storeStrong((id *)&v24->_sourceEnvironment, (id)v6);
        objc_storeStrong((id *)&v24->_encodedEndowment, (id)v8);
        v25 = objc_opt_class();
        objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v25, objc_opt_class(), CFSTR("_attributes"));
        v26 = objc_claimAutoreleasedReturnValue();
        attributes = v24->_attributes;
        v24->_attributes = (NSArray *)v26;

      }
      self = v24;
      v16 = self;
    }
    else
    {
      rbs_assertion_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[RBSHereditaryGrant initWithRBSXPCCoder:].cold.2((uint64_t)self, v9, v10, v11, v12, v13, v14, v15);

      v16 = 0;
    }

  }
  else
  {
    rbs_assertion_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
      -[RBSHereditaryGrant initWithRBSXPCCoder:].cold.1((uint64_t)self, v6, v17, v18, v19, v20, v21, v22);
    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  v3 = -[NSArray hash](self->_attributes, "hash");
  v4 = -[NSString hash](self->_endowmentNamespace, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_sourceEnvironment, "hash");
}

- (OS_xpc_object)encodedEndowment
{
  return self->_encodedEndowment;
}

- (NSString)endowmentNamespace
{
  return self->_endowmentNamespace;
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *endowmentNamespace;
  NSString *sourceEnvironment;
  OS_xpc_object *encodedEndowment;
  OS_xpc_object *v8;
  BOOL v9;
  NSArray *attributes;
  BOOL v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RBSHereditaryGrant;
  v11 = 0;
  if (-[RBSAttribute isEqual:](&v13, sel_isEqual_, v4))
  {
    endowmentNamespace = self->_endowmentNamespace;
    if (endowmentNamespace == (NSString *)v4[1] || -[NSString isEqual:](endowmentNamespace, "isEqual:"))
    {
      sourceEnvironment = self->_sourceEnvironment;
      if (sourceEnvironment == (NSString *)v4[2] || -[NSString isEqualToString:](sourceEnvironment, "isEqualToString:"))
      {
        encodedEndowment = self->_encodedEndowment;
        v8 = (OS_xpc_object *)v4[3];
        if (encodedEndowment == v8 || (encodedEndowment ? (v9 = v8 == 0) : (v9 = 1), !v9))
        {
          attributes = self->_attributes;
          if (attributes == (NSArray *)v4[4] || -[NSArray isEqualToArray:](attributes, "isEqualToArray:"))
            v11 = 1;
        }
      }
    }
  }

  return v11;
}

- (NSString)sourceEnvironment
{
  return self->_sourceEnvironment;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RBSHereditaryGrant;
  v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v6, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_endowmentNamespace, CFSTR("_endowmentNamespace"), v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sourceEnvironment, CFSTR("_sourceEnvironment"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_attributes, CFSTR("_attributes"));
  RBSXPCPackObject(self->_encodedEndowment);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeXPCObject:forKey:", v5, CFSTR("_encodedEndowment"));

}

+ (id)grantWithNamespace:(id)a3 sourceEnvironment:(id)a4 attributes:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[RBSHereditaryGrant _initWithNamespace:sourceEnvironment:endowment:attributes:]([RBSHereditaryGrant alloc], v9, v8, 0, v7);

  return v10;
}

- (_QWORD)_initWithNamespace:(void *)a3 sourceEnvironment:(void *)a4 endowment:(void *)a5 attributes:
{
  id v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (a1)
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithNamespace_sourceEnvironment_endowment_attributes_, a1, CFSTR("RBSHereditaryGrant.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endowmentNamespace"));

    }
    if (!(v11 | v12))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithNamespace_sourceEnvironment_endowment_attributes_, a1, CFSTR("RBSHereditaryGrant.m"), 134, CFSTR("Missing source environment or endowment"));

    }
    v25.receiver = a1;
    v25.super_class = (Class)RBSHereditaryGrant;
    v14 = objc_msgSendSuper2(&v25, sel__init);
    a1 = v14;
    if (v14)
    {
      objc_storeStrong((id *)v14 + 1, a2);
      v15 = objc_msgSend((id)v11, "copy");
      v16 = (void *)a1[2];
      a1[2] = v15;

      RBSEndowmentEncode((void *)v12);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)a1[3];
      a1[3] = v17;

      v19 = objc_msgSend(v13, "copy");
      v20 = (void *)a1[4];
      a1[4] = v19;

      if ((v12 == 0) != (a1[3] == 0))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithNamespace_sourceEnvironment_endowment_attributes_, a1, CFSTR("RBSHereditaryGrant.m"), 142, CFSTR("endowment encode failed : %@"), v12);

      }
    }
  }

  return a1;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *sourceEnvironment;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  sourceEnvironment = (const __CFString *)self->_sourceEnvironment;
  v7 = CFSTR(" ");
  v8 = &stru_1E2D183D0;
  if (!sourceEnvironment)
  {
    v7 = &stru_1E2D183D0;
    sourceEnvironment = &stru_1E2D183D0;
  }
  if (self->_encodedEndowment)
    v8 = CFSTR(" hasEncodedEndowment");
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| endowmentNamespace:%@%@%@%@>"), v4, self->_endowmentNamespace, v7, sourceEnvironment, v8);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_encodedEndowment, 0);
  objc_storeStrong((id *)&self->_sourceEnvironment, 0);
  objc_storeStrong((id *)&self->_endowmentNamespace, 0);
}

+ (id)grantWithNamespace:(id)a3 endowment:(id)a4 attributes:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[RBSHereditaryGrant _initWithNamespace:sourceEnvironment:endowment:attributes:]([RBSHereditaryGrant alloc], v9, 0, v8, v7);

  return v10;
}

+ (id)grantWithNamespace:(id)a3 sourceEnvironment:(id)a4 endowment:(id)a5 attributes:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[RBSHereditaryGrant _initWithNamespace:sourceEnvironment:endowment:attributes:]([RBSHereditaryGrant alloc], v12, v11, v10, v9);

  return v13;
}

- (id)debugDescription
{
  void *v3;
  NSString *endowmentNamespace;
  NSString *sourceEnvironment;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  NSArray *attributes;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v16;

  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  endowmentNamespace = self->_endowmentNamespace;
  sourceEnvironment = self->_sourceEnvironment;
  if (sourceEnvironment)
    v6 = CFSTR(" sourceEnvironment:");
  else
    v6 = &stru_1E2D183D0;
  if (sourceEnvironment)
    v7 = (const __CFString *)self->_sourceEnvironment;
  else
    v7 = &stru_1E2D183D0;
  if (self->_encodedEndowment)
    v8 = CFSTR(" hasEncodedEndowment");
  else
    v8 = &stru_1E2D183D0;
  attributes = self->_attributes;
  if (attributes)
    v10 = CFSTR("attributes: [\n\t");
  else
    v10 = &stru_1E2D183D0;
  -[NSArray componentsJoinedByString:](attributes, "componentsJoinedByString:", CFSTR(",\n\t"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (self->_attributes)
    v13 = CFSTR("\n\t]");
  else
    v13 = &stru_1E2D183D0;
  v14 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("<%@| endowmentNamespace:%@%@%@%@%@%@%@>"), v3, endowmentNamespace, v6, v7, v8, v10, v11, v13);

  return v14;
}

- (void)initWithRBSXPCCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_190CD6000, a2, a3, "RBSHereditaryGrant has no namespace: %@", a5, a6, a7, a8, 2u);
}

- (void)initWithRBSXPCCoder:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_190CD6000, a2, a3, "RBSHereditaryGrant is missing both source environment and endowment: %@", a5, a6, a7, a8, 2u);
}

@end
