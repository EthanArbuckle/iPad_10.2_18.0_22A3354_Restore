@implementation RBSEndowmentGrant

- (unint64_t)hash
{
  return -[NSString hash](self->_endowmentNamespace, "hash");
}

- (NSString)endowmentNamespace
{
  return self->_endowmentNamespace;
}

- (OS_xpc_object)encodedEndowment
{
  return self->_encodedEndowment;
}

+ (id)grantWithNamespace:(id)a3 endowment:(id)a4
{
  id v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBSEndowmentGrant.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nspace != nil"));

  }
  v9 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "_init");
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    v11 = (void *)v9[1];
    v9[1] = v10;

    RBSEndowmentEncode(v8);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v9[2];
    v9[2] = v12;

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *endowmentNamespace;
  NSString *v6;
  BOOL v7;
  OS_xpc_object *encodedEndowment;
  OS_xpc_object *v9;
  BOOL v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RBSEndowmentGrant;
  if (!-[RBSAttribute isEqual:](&v12, sel_isEqual_, v4))
    goto LABEL_14;
  endowmentNamespace = self->_endowmentNamespace;
  v6 = (NSString *)v4[1];
  if (endowmentNamespace != v6)
  {
    v7 = !endowmentNamespace || v6 == 0;
    if (v7 || !-[NSString isEqualToString:](endowmentNamespace, "isEqualToString:"))
      goto LABEL_14;
  }
  encodedEndowment = self->_encodedEndowment;
  v9 = (OS_xpc_object *)v4[2];
  if (encodedEndowment)
  {
    if (v9 && (encodedEndowment == v9 || xpc_equal(encodedEndowment, v9)))
      goto LABEL_12;
LABEL_14:
    v10 = 0;
    goto LABEL_15;
  }
  if (v9)
    goto LABEL_14;
LABEL_12:
  v10 = 1;
LABEL_15:

  return v10;
}

- (id)description
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
  if (self->_encodedEndowment)
    v6 = CFSTR(" hasEndowment");
  else
    v6 = &stru_1E2D183D0;
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| namespace:%@%@>"), v4, self->_endowmentNamespace, v6);

  return v7;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RBSEndowmentGrant;
  v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v6, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_endowmentNamespace, CFSTR("_endowmentNamespace"), v6.receiver, v6.super_class);
  RBSXPCPackObject(self->_encodedEndowment);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeXPCObject:forKey:", v5, CFSTR("_encodedEndowment"));

}

- (RBSEndowmentGrant)initWithRBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  RBSEndowmentGrant *v6;
  RBSEndowmentGrant *v7;
  void *v8;
  uint64_t v9;
  OS_xpc_object *encodedEndowment;
  RBSEndowmentGrant *v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("_endowmentNamespace"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)RBSEndowmentGrant;
    v6 = -[RBSAttribute initWithRBSXPCCoder:](&v13, sel_initWithRBSXPCCoder_, v4);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_endowmentNamespace, v5);
      objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812F8], CFSTR("_encodedEndowment"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      RBSXPCUnpackObject(v8);
      v9 = objc_claimAutoreleasedReturnValue();
      encodedEndowment = v7->_encodedEndowment;
      v7->_encodedEndowment = (OS_xpc_object *)v9;

    }
    self = v7;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedEndowment, 0);
  objc_storeStrong((id *)&self->_endowmentNamespace, 0);
}

@end
