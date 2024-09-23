@implementation REMTimestampedUUID

- (REMTimestampedUUID)initWithIdentifier:(id)a3 modifiedOn:(id)a4
{
  id v7;
  id v8;
  REMTimestampedUUID *v9;
  REMTimestampedUUID *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMTimestampedUUID;
  v9 = -[REMTimestampedUUID init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_modifiedOn, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMTimestampedUUID identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTimestampedUUID modifiedOn](self, "modifiedOn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p identifier: %@,  modifiedOn: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  -[REMTimestampedUUID identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[REMTimestampedUUID identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
    {
LABEL_4:
      v11 = 0;
      goto LABEL_10;
    }
  }
  -[REMTimestampedUUID modifiedOn](self, "modifiedOn");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modifiedOn");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v12 == (void *)v13)
  {
    v11 = 1;
    v14 = v12;
  }
  else
  {
    v14 = (void *)v13;
    -[REMTimestampedUUID modifiedOn](self, "modifiedOn");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modifiedOn");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v15, "isEqual:", v16);

  }
LABEL_10:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[REMTimestampedUUID identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTimestampedUUID modifiedOn](self, "modifiedOn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithIdentifier:modifiedOn:", v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMTimestampedUUID)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  REMTimestampedUUID *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modifiedOn"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[REMTimestampedUUID initWithIdentifier:modifiedOn:](self, "initWithIdentifier:modifiedOn:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[REMTimestampedUUID identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[REMTimestampedUUID modifiedOn](self, "modifiedOn");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("modifiedOn"));

}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDate)modifiedOn
{
  return self->_modifiedOn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedOn, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
