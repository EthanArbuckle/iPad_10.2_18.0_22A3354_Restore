@implementation PKCloudRecordPassCatalog

- (id)item
{
  return self->_catalog;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudRecordPassCatalog)initWithCoder:(id)a3
{
  id v4;
  PKCloudRecordPassCatalog *v5;
  uint64_t v6;
  PKCatalog *catalog;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKCloudRecordPassCatalog;
  v5 = -[PKCloudRecordObject initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("catalog"));
    v6 = objc_claimAutoreleasedReturnValue();
    catalog = v5->_catalog;
    v5->_catalog = (PKCatalog *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCloudRecordPassCatalog;
  v4 = a3;
  -[PKCloudRecordObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_catalog, CFSTR("catalog"), v5.receiver, v5.super_class);

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
    -[PKCloudRecordPassCatalog catalog](self, "catalog");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "catalog");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
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
  -[PKCloudRecordPassCatalog _descriptionWithIncludeItem:](self, "_descriptionWithIncludeItem:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PKCloudRecordPassCatalog;
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

  -[PKCloudRecordPassCatalog _descriptionWithIncludeItem:](self, "_descriptionWithIncludeItem:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)PKCloudRecordPassCatalog;
  -[PKCloudRecordObject description](&v6, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n%@"), v4);

  return v3;
}

- (id)_descriptionWithIncludeItem:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_catalog)
  {
    if (v3)
      objc_msgSend(v5, "appendFormat:", CFSTR("catalog: %@"), self->_catalog);
  }
  else
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("No associated pass catalog in database\n"), v8);
  }
  return v6;
}

- (void)applyCloudRecordObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  PKCatalog *v8;
  PKCatalog *catalog;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKCloudRecordPassCatalog;
    -[PKCloudRecordObject applyCloudRecordObject:](&v10, sel_applyCloudRecordObject_, v4);
    v5 = v4;
    v6 = v5;
    if (!self->_catalog)
    {
      objc_msgSend(v5, "catalog");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v6, "catalog");
        v8 = (PKCatalog *)objc_claimAutoreleasedReturnValue();
        catalog = self->_catalog;
        self->_catalog = v8;

      }
    }

  }
}

- (PKCatalog)catalog
{
  return self->_catalog;
}

- (void)setCatalog:(id)a3
{
  objc_storeStrong((id *)&self->_catalog, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catalog, 0);
}

@end
