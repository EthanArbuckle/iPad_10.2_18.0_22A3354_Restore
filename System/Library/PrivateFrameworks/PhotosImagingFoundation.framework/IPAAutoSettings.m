@implementation IPAAutoSettings

+ (id)pendingWithIdentifier:(id)a3
{
  id v3;
  IPAPendingAutoSettings *v4;

  v3 = a3;
  v4 = -[IPAAutoSettings initWithIdentifier:]([IPAPendingAutoSettings alloc], "initWithIdentifier:", v3);

  return v4;
}

- (IPAAutoSettings)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("unsupported initializer, use -initWithIdentifier instead"));

  return 0;
}

- (IPAAutoSettings)initWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  IPAAutoSettings *v6;
  uint64_t v7;
  NSString *identifier;
  IPAAutoSettings *v10;
  SEL v11;
  objc_super v12;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v12.receiver = self;
    v12.super_class = (Class)IPAAutoSettings;
    v6 = -[IPAAutoSettings init](&v12, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(v5, "copy");
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v7;

    }
    return v6;
  }
  else
  {
    v10 = (IPAAutoSettings *)_PFAssertFailHandler();
    return (IPAAutoSettings *)-[IPAAutoSettings pending](v10, v11);
  }
}

- (BOOL)pending
{
  return 0;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[IPAAutoSettings isEqualToAutoSettings:](self, "isEqualToAutoSettings:", v4);

  return v5;
}

- (BOOL)isEqualToAutoSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IPAAutoSettings archiveDictionary](self, "archiveDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "archiveDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToDictionary:", v6);
  return (char)v4;
}

- (BOOL)applyArchiveDictionary:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  IPAAutoSettings *v8;
  SEL v9;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = -[IPAAutoSettings _applyArchiveDictionary:](self, "_applyArchiveDictionary:", v4);

    return v6;
  }
  else
  {
    v8 = (IPAAutoSettings *)_PFAssertFailHandler();
    return -[IPAAutoSettings archiveDictionary](v8, v9);
  }
}

- (id)archiveDictionary
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  if (-[IPAAutoSettings pending](self, "pending"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("pending"));

  }
  -[IPAAutoSettings _archiveIntoDictionary:](self, "_archiveIntoDictionary:", v3);
  return v3;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[IPAAutoSettings archiveDictionary](self, "archiveDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %@>"), objc_opt_class(), self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)_applyArchiveDictionary:(id)a3
{
  id v3;
  objc_class *v4;
  IPAAutoSettings *v5;
  SEL v6;
  id v7;
  BOOL result;

  v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  v5 = (IPAAutoSettings *)_PFAssertFailHandler();
  -[IPAAutoSettings _archiveIntoDictionary:](v5, v6, v7);
  return result;
}

- (void)_archiveIntoDictionary:(id)a3
{
  id v3;
  objc_class *v4;
  IPAAdjustmentVersion *v5;
  SEL v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  v5 = (IPAAdjustmentVersion *)_PFAssertFailHandler();
  -[IPAAdjustmentVersion initWithMajor:minor:platform:](v5, v6, v7, v8, v9);
}

@end
