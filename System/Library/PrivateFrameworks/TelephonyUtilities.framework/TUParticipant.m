@implementation TUParticipant

- (TUParticipant)initWithName:(id)a3
{
  id v4;
  TUParticipant *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s: parameter '%@' cannot be nil"), "-[TUParticipant initWithName:]", CFSTR("name"));
  v9.receiver = self;
  v9.super_class = (Class)TUParticipant;
  v5 = -[TUParticipant init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

  }
  return v5;
}

- (TUParticipant)initWithParticipant:(id)a3
{
  id v4;
  TUParticipant *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  TUSandboxExtendedURL *sandboxExtendedImageURL;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUParticipant;
  v5 = -[TUParticipant init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "sandboxExtendedImageURL");
    v8 = objc_claimAutoreleasedReturnValue();
    sandboxExtendedImageURL = v5->_sandboxExtendedImageURL;
    v5->_sandboxExtendedImageURL = (TUSandboxExtendedURL *)v8;

  }
  return v5;
}

- (NSURL)imageURL
{
  void *v2;
  void *v3;

  -[TUParticipant sandboxExtendedImageURL](self, "sandboxExtendedImageURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)setImageURL:(id)a3
{
  id v4;
  TUSandboxExtendedURL *v5;

  if (a3)
  {
    v4 = a3;
    v5 = -[TUSandboxExtendedURL initWithURL:]([TUSandboxExtendedURL alloc], "initWithURL:", v4);

  }
  else
  {
    v5 = 0;
  }
  -[TUParticipant setSandboxExtendedImageURL:](self, "setSandboxExtendedImageURL:", v5);

}

+ (id)unarchivedObjectClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = a3;
  objc_msgSend(a1, "unarchivedObjectClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v8, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;
  void *v6;
  TUSandboxExtendedURL *sandboxExtendedImageURL;
  id v8;

  name = self->_name;
  v5 = a3;
  NSStringFromSelector(sel_name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", name, v6);

  sandboxExtendedImageURL = self->_sandboxExtendedImageURL;
  NSStringFromSelector(sel_sandboxExtendedImageURL);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", sandboxExtendedImageURL, v8);

}

- (TUParticipant)initWithCoder:(id)a3
{
  id v4;
  TUParticipant *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  TUSandboxExtendedURL *sandboxExtendedImageURL;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TUParticipant;
  v5 = -[TUParticipant init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_name);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_sandboxExtendedImageURL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    sandboxExtendedImageURL = v5->_sandboxExtendedImageURL;
    v5->_sandboxExtendedImageURL = (TUSandboxExtendedURL *)v12;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TUParticipant initWithParticipant:](+[TUParticipant allocWithZone:](TUParticipant, "allocWithZone:", a3), "initWithParticipant:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TUParticipant initWithParticipant:](+[TUMutableParticipant allocWithZone:](TUMutableParticipant, "allocWithZone:", a3), "initWithParticipant:", self);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_name);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUParticipant name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%@"), v4, v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_imageURL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUParticipant imageURL](self, "imageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%@"), v6, v7);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[TUParticipant name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TUParticipant sandboxExtendedImageURL](self, "sandboxExtendedImageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  TUParticipant *v4;
  BOOL v5;

  v4 = (TUParticipant *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TUParticipant isEqualToParticipant:](self, "isEqualToParticipant:", v4);
  }

  return v5;
}

- (BOOL)isEqualToParticipant:(id)a3
{
  id v4;
  NSString *name;
  void *v6;
  TUSandboxExtendedURL *sandboxExtendedImageURL;
  void *v8;
  char v9;

  v4 = a3;
  name = self->_name;
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (TUObjectsAreEqualOrNil((unint64_t)name, (uint64_t)v6))
  {
    sandboxExtendedImageURL = self->_sandboxExtendedImageURL;
    objc_msgSend(v4, "sandboxExtendedImageURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = TUObjectsAreEqualOrNil((unint64_t)sandboxExtendedImageURL, (uint64_t)v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (TUSandboxExtendedURL)sandboxExtendedImageURL
{
  return self->_sandboxExtendedImageURL;
}

- (void)setSandboxExtendedImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_sandboxExtendedImageURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtendedImageURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
