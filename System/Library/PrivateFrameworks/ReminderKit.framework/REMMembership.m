@implementation REMMembership

- (REMMembership)initWithMemberIdentifier:(id)a3 groupIdentifier:(id)a4 isObsolete:(BOOL)a5 modifiedOn:(id)a6
{
  id v11;
  id v12;
  id v13;
  REMMembership *v14;
  REMMembership *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)REMMembership;
  v14 = -[REMMembership init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_memberIdentifier, a3);
    objc_storeStrong((id *)&v15->_groupIdentifier, a4);
    v15->_isObsolete = a5;
    objc_storeStrong((id *)&v15->_modifiedOn, a6);
  }

  return v15;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMMembership memberIdentifier](self, "memberIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMMembership groupIdentifier](self, "groupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[REMMembership isObsolete](self, "isObsolete"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMMembership modifiedOn](self, "modifiedOn");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p memberIdentifier: %@, groupIdentifier: %@, isObsolete: %@, modifiedOn: %@>"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  char v18;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  -[REMMembership memberIdentifier](self, "memberIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "memberIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[REMMembership memberIdentifier](self, "memberIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "memberIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_11;
  }
  -[REMMembership groupIdentifier](self, "groupIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v12)
  {

  }
  else
  {
    v13 = (void *)v12;
    -[REMMembership groupIdentifier](self, "groupIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_11;
  }
  v17 = -[REMMembership isObsolete](self, "isObsolete");
  if (v17 != objc_msgSend(v4, "isObsolete"))
  {
LABEL_11:
    v18 = 0;
    goto LABEL_12;
  }
  -[REMMembership modifiedOn](self, "modifiedOn");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modifiedOn");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v20 == (void *)v21)
  {
    v18 = 1;
    v22 = v20;
  }
  else
  {
    v22 = (void *)v21;
    -[REMMembership modifiedOn](self, "modifiedOn");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modifiedOn");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v23, "isEqual:", v24);

  }
LABEL_12:

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;

  v4 = objc_alloc((Class)objc_opt_class());
  -[REMMembership memberIdentifier](self, "memberIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMMembership groupIdentifier](self, "groupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[REMMembership isObsolete](self, "isObsolete");
  -[REMMembership modifiedOn](self, "modifiedOn");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithMemberIdentifier:groupIdentifier:isObsolete:modifiedOn:", v5, v6, v7, v8);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMMembership)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  REMMembership *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("memberIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isObsolete"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modifiedOn"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[REMMembership initWithMemberIdentifier:groupIdentifier:isObsolete:modifiedOn:](self, "initWithMemberIdentifier:groupIdentifier:isObsolete:modifiedOn:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[REMMembership memberIdentifier](self, "memberIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("memberIdentifier"));

  -[REMMembership groupIdentifier](self, "groupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("groupIdentifier"));

  objc_msgSend(v4, "encodeBool:forKey:", -[REMMembership isObsolete](self, "isObsolete"), CFSTR("isObsolete"));
  -[REMMembership modifiedOn](self, "modifiedOn");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("modifiedOn"));

}

- (NSUUID)memberIdentifier
{
  return self->_memberIdentifier;
}

- (NSUUID)groupIdentifier
{
  return self->_groupIdentifier;
}

- (BOOL)isObsolete
{
  return self->_isObsolete;
}

- (NSDate)modifiedOn
{
  return self->_modifiedOn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedOn, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_memberIdentifier, 0);
}

@end
