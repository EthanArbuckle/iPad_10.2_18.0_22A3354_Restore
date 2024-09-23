@implementation RBSEndowmentLink

+ (id)endowmentLinkForNamespace:(id)a3 sourceEnvironment:(id)a4 sourcePid:(int)a5 targetEnvironment:(id)a6 targetPid:(int)a7
{
  id v11;
  id v12;
  id v13;
  id *v14;

  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = -[RBSEndowmentLink _initWithNamespace:sourceEnvironment:sourcePid:targetEnvironment:targetPid:]((id *)[RBSEndowmentLink alloc], v13, v12, a5, v11, a7);

  return v14;
}

- (id)_initWithNamespace:(void *)a3 sourceEnvironment:(int)a4 sourcePid:(void *)a5 targetEnvironment:(int)a6 targetPid:
{
  id v12;
  id v13;
  id v14;
  id *v15;
  objc_super v17;

  v12 = a2;
  v13 = a3;
  v14 = a5;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)RBSEndowmentLink;
    v15 = (id *)objc_msgSendSuper2(&v17, sel_init);
    a1 = v15;
    if (v15)
    {
      objc_storeStrong(v15 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      *((_DWORD *)a1 + 2) = a4;
      objc_storeStrong(a1 + 4, a5);
      *((_DWORD *)a1 + 3) = a6;
    }
  }

  return a1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  RBSEndowmentLink *v4;

  v4 = objc_alloc_init(RBSEndowmentLink);
  objc_storeStrong((id *)&v4->_endowmentNamespace, self->_endowmentNamespace);
  objc_storeStrong((id *)&v4->_sourceEnvironment, self->_sourceEnvironment);
  v4->_sourcePid = self->_sourcePid;
  objc_storeStrong((id *)&v4->_targetEnvironment, self->_targetEnvironment);
  v4->_targetPid = self->_targetPid;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RBSEndowmentLink *v4;
  uint64_t v5;
  BOOL v6;
  NSString *endowmentNamespace;
  NSString *v9;
  NSString *sourceEnvironment;
  NSString *v11;
  NSString *targetEnvironment;
  NSString *v13;

  v4 = (RBSEndowmentLink *)a3;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_5;
  }
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_3;
  endowmentNamespace = self->_endowmentNamespace;
  v9 = v4->_endowmentNamespace;
  if (endowmentNamespace != v9)
  {
    v6 = 0;
    if (!endowmentNamespace || !v9)
      goto LABEL_5;
    if (!-[NSString isEqual:](endowmentNamespace, "isEqual:"))
      goto LABEL_3;
  }
  sourceEnvironment = self->_sourceEnvironment;
  v11 = v4->_sourceEnvironment;
  if (sourceEnvironment != v11)
  {
    v6 = 0;
    if (!sourceEnvironment || !v11)
      goto LABEL_5;
    if (!-[NSString isEqual:](sourceEnvironment, "isEqual:"))
      goto LABEL_3;
  }
  if (self->_sourcePid != v4->_sourcePid)
    goto LABEL_3;
  targetEnvironment = self->_targetEnvironment;
  v13 = v4->_targetEnvironment;
  if (targetEnvironment == v13)
  {
LABEL_19:
    v6 = self->_targetPid == v4->_targetPid;
    goto LABEL_5;
  }
  v6 = 0;
  if (targetEnvironment && v13)
  {
    if (-[NSString isEqual:](targetEnvironment, "isEqual:"))
      goto LABEL_19;
LABEL_3:
    v6 = 0;
  }
LABEL_5:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t sourcePid;

  v3 = -[NSString hash](self->_endowmentNamespace, "hash");
  v4 = -[NSString hash](self->_sourceEnvironment, "hash") ^ v3;
  sourcePid = self->_sourcePid;
  return v4 ^ sourcePid ^ -[NSString hash](self->_targetEnvironment, "hash") ^ self->_targetPid;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| namespace:%@ srcEnv:%d/%@ targEnv:%d/%@>"), v4, self->_endowmentNamespace, self->_sourcePid, self->_sourceEnvironment, self->_targetPid, self->_targetEnvironment);

  return (NSString *)v5;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  NSString *endowmentNamespace;
  id v5;

  endowmentNamespace = self->_endowmentNamespace;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", endowmentNamespace, CFSTR("_endowmentNamespace"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceEnvironment, CFSTR("_sourceEnvironment"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_sourcePid, CFSTR("_sourcePid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_targetEnvironment, CFSTR("_targetEnvironment"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_targetPid, CFSTR("_targetPid"));

}

- (RBSEndowmentLink)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSEndowmentLink *v5;
  uint64_t v6;
  NSString *endowmentNamespace;
  uint64_t v8;
  NSString *sourceEnvironment;
  uint64_t v10;
  NSString *targetEnvironment;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RBSEndowmentLink;
  v5 = -[RBSEndowmentLink init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_endowmentNamespace"));
    v6 = objc_claimAutoreleasedReturnValue();
    endowmentNamespace = v5->_endowmentNamespace;
    v5->_endowmentNamespace = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sourceEnvironment"));
    v8 = objc_claimAutoreleasedReturnValue();
    sourceEnvironment = v5->_sourceEnvironment;
    v5->_sourceEnvironment = (NSString *)v8;

    v5->_sourcePid = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_sourcePid"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_targetEnvironment"));
    v10 = objc_claimAutoreleasedReturnValue();
    targetEnvironment = v5->_targetEnvironment;
    v5->_targetEnvironment = (NSString *)v10;

    v5->_targetPid = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_targetPid"));
  }

  return v5;
}

- (NSString)endowmentNamespace
{
  return self->_endowmentNamespace;
}

- (NSString)sourceEnvironment
{
  return self->_sourceEnvironment;
}

- (int)sourcePid
{
  return self->_sourcePid;
}

- (NSString)targetEnvironment
{
  return self->_targetEnvironment;
}

- (int)targetPid
{
  return self->_targetPid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetEnvironment, 0);
  objc_storeStrong((id *)&self->_sourceEnvironment, 0);
  objc_storeStrong((id *)&self->_endowmentNamespace, 0);
}

@end
