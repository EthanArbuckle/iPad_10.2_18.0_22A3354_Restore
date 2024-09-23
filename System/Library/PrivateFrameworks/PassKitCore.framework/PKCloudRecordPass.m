@implementation PKCloudRecordPass

- (id)item
{
  return self->_pass;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudRecordPass)initWithCoder:(id)a3
{
  id v4;
  PKCloudRecordPass *v5;
  uint64_t v6;
  PKPass *pass;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKCloudRecordPass;
  v5 = -[PKCloudRecordObject initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pass"));
    v6 = objc_claimAutoreleasedReturnValue();
    pass = v5->_pass;
    v5->_pass = (PKPass *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCloudRecordPass;
  v4 = a3;
  -[PKCloudRecordObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_pass, CFSTR("pass"), v5.receiver, v5.super_class);

}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[PKCloudRecordPass pass](self, "pass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "organizationName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "organizationName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "compare:", v8);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)descriptionWithItem:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = a3;
  -[PKCloudRecordPass _descriptionWithIncludeItem:](self, "_descriptionWithIncludeItem:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PKCloudRecordPass;
  -[PKCloudRecordObject descriptionWithItem:](&v8, sel_descriptionWithItem_, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n%@"), v6);

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  -[PKCloudRecordPass _descriptionWithIncludeItem:](self, "_descriptionWithIncludeItem:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)PKCloudRecordPass;
  -[PKCloudRecordObject description](&v6, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n%@"), v4);

  return v3;
}

- (id)_descriptionWithIncludeItem:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  PKPass *pass;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  pass = self->_pass;
  if (pass)
  {
    if (v3)
    {
      -[PKPass organizationName](pass, "organizationName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPass localizedName](self->_pass, "localizedName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKObject uniqueID](self->_pass, "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("pass: name: \"%@\", type: %@, unique id: \"%@\"\n%@\n"), v7, v8, v9, self->_pass);

    }
  }
  else
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("No associated pass in database\n"));
  }
  return v5;
}

- (void)applyCloudRecordObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  PKPass *v8;
  PKPass *pass;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKCloudRecordPass;
    -[PKCloudRecordObject applyCloudRecordObject:](&v10, sel_applyCloudRecordObject_, v4);
    v5 = v4;
    v6 = v5;
    if (!self->_pass)
    {
      objc_msgSend(v5, "pass");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v6, "pass");
        v8 = (PKPass *)objc_claimAutoreleasedReturnValue();
        pass = self->_pass;
        self->_pass = v8;

      }
    }

  }
}

- (PKPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
