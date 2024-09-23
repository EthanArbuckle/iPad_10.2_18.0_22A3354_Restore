@implementation RBSSavedEndowmentGrant

+ (id)grantWithNamespace:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "_init");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    v10 = (void *)v8[1];
    v8[1] = v9;

    v11 = objc_msgSend(v7, "copy");
    v12 = (void *)v8[2];
    v8[2] = v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *endowmentNamespace;
  NSString *v6;
  BOOL v7;
  NSString *key;
  NSString *v9;
  char v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RBSSavedEndowmentGrant;
  if (!-[RBSAttribute isEqual:](&v13, sel_isEqual_, v4))
    goto LABEL_14;
  endowmentNamespace = self->_endowmentNamespace;
  v6 = (NSString *)v4[1];
  if (endowmentNamespace != v6)
  {
    v7 = !endowmentNamespace || v6 == 0;
    if (v7 || !-[NSString isEqualToString:](endowmentNamespace, "isEqualToString:"))
      goto LABEL_14;
  }
  key = self->_key;
  v9 = (NSString *)v4[2];
  if (key == v9)
  {
    v12 = 1;
    goto LABEL_15;
  }
  if (key && v9 != 0)
    v12 = -[NSString isEqualToString:](key, "isEqualToString:");
  else
LABEL_14:
    v12 = 0;
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_endowmentNamespace, "hash");
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| namespace:%@ key:%@>"), v4, self->_endowmentNamespace, self->_key);

  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBSSavedEndowmentGrant;
  v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_endowmentNamespace, CFSTR("_endowmentNamespace"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_key, CFSTR("_key"));

}

- (RBSSavedEndowmentGrant)initWithRBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  RBSSavedEndowmentGrant *v7;
  id *p_isa;
  RBSSavedEndowmentGrant *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("_endowmentNamespace"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("_key"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v11.receiver = self;
      v11.super_class = (Class)RBSSavedEndowmentGrant;
      v7 = -[RBSAttribute initWithRBSXPCCoder:](&v11, sel_initWithRBSXPCCoder_, v4);
      p_isa = (id *)&v7->super.super.super.isa;
      if (v7)
      {
        objc_storeStrong((id *)&v7->_endowmentNamespace, v5);
        objc_storeStrong(p_isa + 2, v6);
      }
      self = p_isa;
      v9 = self;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)endowmentNamespace
{
  return self->_endowmentNamespace;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_endowmentNamespace, 0);
}

@end
