@implementation RBSBaseMemoryGrant

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSBaseMemoryGrant;
  v5 = -[RBSAttribute isEqual:](&v7, sel_isEqual_, v4)
    && -[NSString isEqualToString:](self->_category, "isEqualToString:", v4[1])
    && self->_strength == *((unsigned __int8 *)v4 + 16);

  return v5;
}

- (NSString)category
{
  return self->_category;
}

- (unint64_t)hash
{
  uint64_t strength;

  strength = self->_strength;
  return -[NSString hash](self->_category, "hash") ^ strength;
}

- (unsigned)strength
{
  return self->_strength;
}

- (_BYTE)_initWithCategory:(char)a3 strength:
{
  id v6;
  id v7;
  objc_super v9;

  v6 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)RBSBaseMemoryGrant;
    v7 = objc_msgSendSuper2(&v9, sel__init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 1, a2);
      a1[16] = a3;
    }
  }

  return a1;
}

+ (id)grantWithCategory:(id)a3 strength:(unsigned __int8)a4
{
  id v5;
  _BYTE *v6;

  v5 = a3;
  v6 = -[RBSBaseMemoryGrant _initWithCategory:strength:]([RBSBaseMemoryGrant alloc], v5, a4);

  return v6;
}

+ (id)grantWithActiveLimit
{
  return +[RBSBaseMemoryGrant grantWithCategory:strength:](RBSBaseMemoryGrant, "grantWithCategory:strength:", CFSTR("Active"), 2);
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBSBaseMemoryGrant;
  v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_category, CFSTR("_category"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_strength, CFSTR("_strength"));

}

- (RBSBaseMemoryGrant)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSBaseMemoryGrant *v5;
  uint64_t v6;
  NSString *category;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBSBaseMemoryGrant;
  v5 = -[RBSAttribute initWithRBSXPCCoder:](&v9, sel_initWithRBSXPCCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("_category"));
    v6 = objc_claimAutoreleasedReturnValue();
    category = v5->_category;
    v5->_category = (NSString *)v6;

    v5->_strength = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_strength"));
  }

  return v5;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t strength;
  const __CFString *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  strength = (char)self->_strength;
  if (strength > 2)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_1E2D17828[strength];
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| category:%@ strength:%@>"), v4, self->_category, v7);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
}

@end
