@implementation RBSProcessAssertionInfo

- (RBSProcessAssertionInfo)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSProcessAssertionInfo *v5;
  uint64_t v6;
  NSString *explanation;
  uint64_t v8;
  NSString *domain;
  uint64_t v10;
  NSString *name;

  v4 = a3;
  v5 = -[RBSProcessAssertionInfo initWithType:](self, "initWithType:", objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("t")));
  if (v5)
  {
    v5->_reason = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("r"));
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("e"));
    v6 = objc_claimAutoreleasedReturnValue();
    explanation = v5->_explanation;
    v5->_explanation = (NSString *)v6;

    objc_msgSend(v4, "decodeStringForKey:", CFSTR("d"));
    v8 = objc_claimAutoreleasedReturnValue();
    domain = v5->_domain;
    v5->_domain = (NSString *)v8;

    objc_msgSend(v4, "decodeStringForKey:", CFSTR("n"));
    v10 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v10;

  }
  return v5;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSProcessAssertionInfo)initWithType:(unsigned __int8)a3
{
  RBSProcessAssertionInfo *result;

  result = -[RBSProcessAssertionInfo init](self, "init");
  if (result)
    result->_type = a3;
  return result;
}

- (unsigned)type
{
  return self->_type;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = 0x94D049BB133111EBLL * ((0xBF58476D1CE4E5B9 * self->_type) ^ ((0xBF58476D1CE4E5B9 * self->_type) >> 27));
  v3 = self->_reason ^ (self->_reason >> 30);
  v4 = 0x94D049BB133111EBLL * ((0xBF58476D1CE4E5B9 * v3) ^ ((0xBF58476D1CE4E5B9 * v3) >> 27));
  return v2 ^ ((v4 ^ v2) >> 31) ^ v4;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setExplanation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
}

- (BOOL)isEqual:(id)a3
{
  RBSProcessAssertionInfo *v4;
  RBSProcessAssertionInfo *v5;
  uint64_t v6;
  NSString *explanation;
  NSString *v8;
  char v9;
  NSString *domain;
  NSString *v11;
  NSString *name;
  NSString *v13;

  v4 = (RBSProcessAssertionInfo *)a3;
  v5 = v4;
  if (self == v4)
    goto LABEL_19;
  if (!v4)
    goto LABEL_18;
  v6 = objc_opt_class();
  if (v6 != objc_opt_class() || self->_type != v5->_type || self->_reason != v5->_reason)
    goto LABEL_18;
  explanation = self->_explanation;
  v8 = v5->_explanation;
  if (explanation != v8)
  {
    v9 = 0;
    if (!explanation || !v8)
      goto LABEL_20;
    if (!-[NSString isEqualToString:](explanation, "isEqualToString:"))
      goto LABEL_18;
  }
  domain = self->_domain;
  v11 = v5->_domain;
  if (domain != v11)
  {
    v9 = 0;
    if (!domain || !v11)
      goto LABEL_20;
    if (!-[NSString isEqualToString:](domain, "isEqualToString:"))
    {
LABEL_18:
      v9 = 0;
      goto LABEL_20;
    }
  }
  name = self->_name;
  v13 = v5->_name;
  if (name == v13)
  {
LABEL_19:
    v9 = 1;
    goto LABEL_20;
  }
  v9 = 0;
  if (name && v13)
    v9 = -[NSString isEqualToString:](name, "isEqualToString:");
LABEL_20:

  return v9;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  uint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeUInt64:forKey:", type, CFSTR("t"));
  objc_msgSend(v5, "encodeUInt64:forKey:", self->_reason, CFSTR("r"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_explanation, CFSTR("e"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_domain, CFSTR("d"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("n"));

}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| type:%hhu reason:%llu name:\"%@\" domain:\"%@\" expl:\"%@\">"), v4, self->_type, self->_reason, self->_name, self->_domain, self->_explanation);

  return (NSString *)v5;
}

- (BOOL)isLegacyAssertionReason:(unint64_t)a3
{
  return self->_type == 3 && self->_reason == a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  RBSProcessAssertionInfo *v4;

  v4 = -[RBSProcessAssertionInfo initWithType:](+[RBSProcessAssertionInfo allocWithZone:](RBSProcessAssertionInfo, "allocWithZone:", a3), "initWithType:", self->_type);
  -[RBSProcessAssertionInfo setReason:](v4, "setReason:", self->_reason);
  -[RBSProcessAssertionInfo setExplanation:](v4, "setExplanation:", self->_explanation);
  -[RBSProcessAssertionInfo setDomain:](v4, "setDomain:", self->_domain);
  -[RBSProcessAssertionInfo setName:](v4, "setName:", self->_name);
  return v4;
}

- (NSString)name
{
  return self->_name;
}

@end
