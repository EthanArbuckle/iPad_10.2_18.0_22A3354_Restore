@implementation SBFPhysicalButtonTarget

- (unint64_t)identifier
{
  return self->_identifier;
}

- (unint64_t)button
{
  return self->_button;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  _NSStringFromUIPhysicalButton();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {%@} (%llu)"), v4, self->_auditToken, self->_generation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_identifier)
  {
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" [id=%lu]"), self->_identifier);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

+ (id)targetWithPhysicalButton:(unint64_t)a3 generation:(unint64_t)a4 auditToken:(id)a5
{
  return (id)objc_msgSend(a1, "targetWithPhysicalButton:generation:auditToken:identifier:", a3, a4, a5, 0);
}

+ (id)targetWithPhysicalButton:(unint64_t)a3 generation:(unint64_t)a4 auditToken:(id)a5 identifier:(unint64_t)a6
{
  id v10;
  id *v11;

  v10 = a5;
  v11 = -[SBFPhysicalButtonTarget _initWithPhysicalButton:generation:auditToken:identifier:]((id *)objc_alloc((Class)a1), (void *)a3, (void *)a4, v10, (void *)a6);

  return v11;
}

- (id)_initWithPhysicalButton:(void *)a3 generation:(void *)a4 auditToken:(void *)a5 identifier:
{
  id v10;
  id *v11;
  objc_super v13;

  v10 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)SBFPhysicalButtonTarget;
    v11 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v11;
    if (v11)
    {
      v11[1] = a2;
      v11[2] = a3;
      v11[4] = a5;
      objc_storeStrong(v11 + 3, a4);
    }
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  SBFPhysicalButtonTarget *v4;
  void *v5;
  char isKindOfClass;
  SBFPhysicalButtonTarget *v7;
  SBFPhysicalButtonTarget *v8;
  char v9;

  v4 = (SBFPhysicalButtonTarget *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      v8 = v7;
      if (self->_button == v7->_button && self->_generation == v7->_generation && self->_identifier == v7->_identifier)
        v9 = BSEqualObjects();
      else
        v9 = 0;

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = self->_generation ^ self->_button ^ self->_identifier;
  return v2 ^ -[BSAuditToken hash](self->_auditToken, "hash");
}

- (unint64_t)generation
{
  return self->_generation;
}

- (BSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
}

@end
