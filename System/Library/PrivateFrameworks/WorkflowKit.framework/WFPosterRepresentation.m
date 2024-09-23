@implementation WFPosterRepresentation

- (WFPosterRepresentation)initWithUUID:(id)a3 name:(id)a4 providerBundleIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFPosterRepresentation *v12;
  WFPosterRepresentation *v13;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  NSString *providerBundleIdentifier;
  WFPosterRepresentation *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WFPosterRepresentation;
  v12 = -[WFPosterRepresentation init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_UUID, a3);
    v14 = objc_msgSend(v10, "copy");
    name = v13->_name;
    v13->_name = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    providerBundleIdentifier = v13->_providerBundleIdentifier;
    v13->_providerBundleIdentifier = (NSString *)v16;

    v18 = v13;
  }

  return v13;
}

- (id)serializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  -[WFPosterRepresentation UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v5, CFSTR("UUID"));

  -[WFPosterRepresentation name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v6, CFSTR("name"));

  -[WFPosterRepresentation providerBundleIdentifier](self, "providerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v7, CFSTR("providerBundleIdentifier"));

  v8 = (void *)objc_msgSend(v3, "copy");
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)WFPosterRepresentation;
  -[WFPosterRepresentation description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPosterRepresentation UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPosterRepresentation name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPosterRepresentation providerBundleIdentifier](self, "providerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, UUID: %@, name: %@, providerBundleId: %@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)wfName
{
  return (NSString *)WFLocalizedString(CFSTR("Wallpaper"));
}

- (BOOL)isEqual:(id)a3
{
  WFPosterRepresentation *v4;
  WFPosterRepresentation *v5;
  WFPosterRepresentation *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v4 = (WFPosterRepresentation *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_27:

      goto LABEL_28;
    }
    -[WFPosterRepresentation UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFPosterRepresentation UUID](v6, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
        goto LABEL_25;
      v15 = objc_msgSend(v9, "isEqual:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    -[WFPosterRepresentation name](self, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFPosterRepresentation name](v6, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      v12 = objc_msgSend(v14, "isEqualToString:", v18);

      if (!v12)
        goto LABEL_25;
    }
    -[WFPosterRepresentation providerBundleIdentifier](self, "providerBundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFPosterRepresentation providerBundleIdentifier](v6, "providerBundleIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v21;
    v23 = v22;
    v19 = v23;
    if (v20 == v23)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v20 && v23)
        LOBYTE(v12) = objc_msgSend(v20, "isEqualToString:", v23);
    }

    goto LABEL_24;
  }
  LOBYTE(v12) = 1;
LABEL_28:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[WFPosterRepresentation UUID](self, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WFPosterRepresentation name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[WFPosterRepresentation providerBundleIdentifier](self, "providerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (WFPosterRepresentation)initWithCoder:(id)a3
{
  id v4;
  WFPosterRepresentation *v5;
  uint64_t v6;
  NSUUID *UUID;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSString *providerBundleIdentifier;
  WFPosterRepresentation *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFPosterRepresentation;
  v5 = -[WFPosterRepresentation init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("providerBundleIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    providerBundleIdentifier = v5->_providerBundleIdentifier;
    v5->_providerBundleIdentifier = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WFPosterRepresentation UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UUID"));

  -[WFPosterRepresentation name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("name"));

  -[WFPosterRepresentation providerBundleIdentifier](self, "providerBundleIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("providerBundleIdentifier"));

}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)providerBundleIdentifier
{
  return self->_providerBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

+ (id)posterWithSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("UUID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v8 = v6;

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
    if (v9)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("name"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;
      }
      else
      {
        v11 = 0;
      }
      v12 = v11;

      objc_msgSend(v4, "objectForKey:", CFSTR("providerBundleIdentifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
      }
      else
      {
        v14 = 0;
      }
      v15 = v14;

      v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUUID:name:providerBundleIdentifier:", v9, v12, v15);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)defaultPoster
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("WFShortcutsDefaultPosterRepresentation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "posterWithSerializedRepresentation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
