@implementation IPAAdjustment

- (IPAAdjustment)init
{
  IPAAdjustment *v2;
  IPAAdjustment *v3;
  NSDictionary *settings;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IPAAdjustment;
  v2 = -[IPAAdjustment init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    settings = v2->_settings;
    v2->_settings = (NSDictionary *)MEMORY[0x1E0C9AA70];

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_identifier);
  objc_storeStrong(v4 + 2, self->_version);
  objc_storeStrong(v4 + 3, self->_settings);
  return v4;
}

- (void)setIdentifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *identifier;
  IPAAdjustment *v7;
  SEL v8;
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    if (objc_msgSend(v4, "length"))
    {
      v5 = (NSString *)objc_msgSend(v10, "copy");
      identifier = self->_identifier;
      self->_identifier = v5;

      return;
    }
  }
  else
  {
    _PFAssertFailHandler();
  }
  v7 = (IPAAdjustment *)_PFAssertFailHandler();
  -[IPAAdjustment setVersion:](v7, v8, v9);
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (void)setSettings:(id)a3
{
  id v4;
  NSDictionary *v5;
  NSDictionary *settings;
  IPAAdjustment *v7;
  SEL v8;
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    v5 = (NSDictionary *)objc_msgSend(v4, "copy");
    settings = self->_settings;
    self->_settings = v5;

  }
  else
  {
    v7 = (IPAAdjustment *)_PFAssertFailHandler();
    -[IPAAdjustment isEqual:](v7, v8, v9);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[IPAAdjustment isEqualToAdjustment:](self, "isEqualToAdjustment:", v4);

  return v5;
}

- (BOOL)isEqualToAdjustment:(id)a3
{
  id v4;
  NSString *identifier;
  void *v6;
  IPAAdjustmentVersion *version;
  void *v8;
  NSDictionary *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;

  v4 = a3;
  identifier = self->_identifier;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(identifier) = -[NSString isEqualToString:](identifier, "isEqualToString:", v6);

  if ((_DWORD)identifier
    && (version = self->_version,
        objc_msgSend(v4, "version"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(version) = -[IPAAdjustmentVersion isEqualToAdjustmentVersion:](version, "isEqualToAdjustmentVersion:", v8), v8, (_DWORD)version))
  {
    v9 = self->_settings;
    objc_msgSend(v4, "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSDictionary count](v9, "count");
    v12 = v11 == objc_msgSend(v10, "count") && -[NSDictionary isEqualToDictionary:](v9, "isEqualToDictionary:", v10);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[IPAAdjustment identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPAAdjustment version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p:v%@ "), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[IPAAdjustment settings](self, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v6, "appendFormat:", CFSTR("settings=<%@:%p count:%lu>"), objc_opt_class(), v7, objc_msgSend(v7, "count"));
  else
    objc_msgSend(v6, "appendString:", CFSTR("settings=nil"));
  -[IPAAdjustment _debugDescriptionSuffix](self, "_debugDescriptionSuffix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "appendString:", CFSTR(" "));
    objc_msgSend(v6, "appendString:", v8);
  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));

  return v6;
}

- (id)_debugDescriptionSuffix
{
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (IPAAdjustmentVersion)version
{
  return self->_version;
}

- (NSDictionary)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
