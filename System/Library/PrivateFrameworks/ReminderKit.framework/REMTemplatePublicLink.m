@implementation REMTemplatePublicLink

- (REMTemplatePublicLink)initWithURL:(id)a3 configuration:(id)a4 creationDate:(id)a5 lastModifiedDate:(id)a6 expirationDate:(id)a7 canBeUpdated:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  REMTemplatePublicLink *v18;
  REMTemplatePublicLink *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)REMTemplatePublicLink;
  v18 = -[REMTemplatePublicLink init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_url, a3);
    objc_storeStrong((id *)&v19->_configuration, a4);
    objc_storeStrong((id *)&v19->_creationDate, a5);
    objc_storeStrong((id *)&v19->_lastModifiedDate, a6);
    objc_storeStrong((id *)&v19->_expirationDate, a7);
    v19->_canBeUpdated = a8;
  }

  return v19;
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
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMTemplatePublicLink url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTemplatePublicLink configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTemplatePublicLink creationDate](self, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTemplatePublicLink lastModifiedDate](self, "lastModifiedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTemplatePublicLink expirationDate](self, "expirationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[REMTemplatePublicLink canBeUpdated](self, "canBeUpdated"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p url: %@, configuration: %@, creationDate: %@, lastModifiedDate: %@, expirationDate: %@, canBeUpdated: %@>"), v4, self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
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
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  _BOOL4 v37;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_20;
  -[REMTemplatePublicLink url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[REMTemplatePublicLink url](self, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_20;
  }
  -[REMTemplatePublicLink configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v12)
  {

  }
  else
  {
    v13 = (void *)v12;
    -[REMTemplatePublicLink configuration](self, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_20;
  }
  -[REMTemplatePublicLink creationDate](self, "creationDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v17 == (void *)v18)
  {

  }
  else
  {
    v19 = (void *)v18;
    -[REMTemplatePublicLink creationDate](self, "creationDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "creationDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_20;
  }
  -[REMTemplatePublicLink lastModifiedDate](self, "lastModifiedDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastModifiedDate");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v23 == (void *)v24)
  {

  }
  else
  {
    v25 = (void *)v24;
    -[REMTemplatePublicLink lastModifiedDate](self, "lastModifiedDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastModifiedDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_20;
  }
  -[REMTemplatePublicLink expirationDate](self, "expirationDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expirationDate");
  v30 = objc_claimAutoreleasedReturnValue();
  if (v29 == (void *)v30)
  {

    goto LABEL_23;
  }
  v31 = (void *)v30;
  -[REMTemplatePublicLink expirationDate](self, "expirationDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expirationDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v32, "isEqual:", v33);

  if (v34)
  {
LABEL_23:
    v37 = -[REMTemplatePublicLink canBeUpdated](self, "canBeUpdated");
    v35 = v37 ^ objc_msgSend(v4, "canBeUpdated") ^ 1;
    goto LABEL_21;
  }
LABEL_20:
  LOBYTE(v35) = 0;
LABEL_21:

  return v35;
}

- (id)copyWithZone:(_NSZone *)a3
{
  REMTemplatePublicLink *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  REMTemplatePublicLink *v10;

  v4 = [REMTemplatePublicLink alloc];
  -[REMTemplatePublicLink url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTemplatePublicLink configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTemplatePublicLink creationDate](self, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTemplatePublicLink lastModifiedDate](self, "lastModifiedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTemplatePublicLink expirationDate](self, "expirationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[REMTemplatePublicLink initWithURL:configuration:creationDate:lastModifiedDate:expirationDate:canBeUpdated:](v4, "initWithURL:configuration:creationDate:lastModifiedDate:expirationDate:canBeUpdated:", v5, v6, v7, v8, v9, -[REMTemplatePublicLink canBeUpdated](self, "canBeUpdated"));

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMTemplatePublicLink)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  REMTemplatePublicLink *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastModifiedDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canBeUpdated"));

  v11 = -[REMTemplatePublicLink initWithURL:configuration:creationDate:lastModifiedDate:expirationDate:canBeUpdated:](self, "initWithURL:configuration:creationDate:lastModifiedDate:expirationDate:canBeUpdated:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[REMTemplatePublicLink url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("url"));

  -[REMTemplatePublicLink configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("configuration"));

  -[REMTemplatePublicLink creationDate](self, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("creationDate"));

  -[REMTemplatePublicLink lastModifiedDate](self, "lastModifiedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("lastModifiedDate"));

  -[REMTemplatePublicLink expirationDate](self, "expirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("expirationDate"));

  objc_msgSend(v9, "encodeBool:forKey:", -[REMTemplatePublicLink canBeUpdated](self, "canBeUpdated"), CFSTR("canBeUpdated"));
}

- (NSURL)url
{
  return self->_url;
}

- (REMTemplatePublicLinkConfiguration)configuration
{
  return self->_configuration;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (BOOL)canBeUpdated
{
  return self->_canBeUpdated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
