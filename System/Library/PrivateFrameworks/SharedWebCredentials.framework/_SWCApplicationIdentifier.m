@implementation _SWCApplicationIdentifier

+ (BOOL)isCaseSensitive
{
  return 1;
}

+ (_SWCApplicationIdentifier)new
{
  abort();
}

- (_SWCApplicationIdentifier)init
{
  abort();
}

- (_SWCApplicationIdentifier)initWithString:(id)a3
{
  id v4;
  _SWCApplicationIdentifier *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSString *prefix;
  uint64_t v12;
  NSString *bundleIdentifier;
  int v14;
  NSString *v15;
  void *v16;
  NSString *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_SWCApplicationIdentifier;
  v5 = -[_SWCApplicationIdentifier init](&v19, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1A85D4B3C]();
    if (objc_msgSend(v4, "rangeOfString:", CFSTR(".")) == 10)
    {
      v8 = v7;
      objc_msgSend(v4, "substringToIndex:", 10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uppercaseString");
      v10 = objc_claimAutoreleasedReturnValue();
      prefix = v5->_prefix;
      v5->_prefix = (NSString *)v10;

      objc_msgSend(v4, "substringFromIndex:", v8 + 10);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = objc_msgSend(v4, "copy");
    }
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v12;

    v14 = objc_msgSend((id)objc_opt_class(), "isCaseSensitive");
    v15 = v5->_bundleIdentifier;
    if (v14)
    {
      v5->_hash = -[NSString hash](v15, "hash");
    }
    else
    {
      -[NSString lowercaseString](v15, "lowercaseString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_hash = objc_msgSend(v16, "hash");

    }
    v17 = v5->_prefix;
    if (v17)
      v5->_hash ^= -[NSString hash](v17, "hash");
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSString)rawValue
{
  NSString *v2;

  if (self->_prefix)
    v2 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@"), self->_prefix, self->_bundleIdentifier);
  else
    v2 = self->_bundleIdentifier;
  return v2;
}

- (BOOL)isValid
{
  return -[NSString rangeOfString:](self->_bundleIdentifier, "rangeOfString:", CFSTR(".")) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isEqualToApplicationIdentifierIgnoringPrefix:(id)a3
{
  _QWORD *v4;
  int v5;
  NSString *bundleIdentifier;
  uint64_t v7;
  char v8;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "isCaseSensitive");
  bundleIdentifier = self->_bundleIdentifier;
  v7 = v4[3];
  if (v5)
    v8 = -[NSString isEqual:](bundleIdentifier, "isEqual:", v7);
  else
    v8 = -[NSString caseInsensitiveCompare:](bundleIdentifier, "caseInsensitiveCompare:", v7) == NSOrderedSame;

  return v8;
}

- (id)UUIDRepresentation
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v9;
  _OWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[_SWCApplicationIdentifier rawValue](self, "rawValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SWCApplicationIdentifier.mm"), 120, CFSTR("Failed to get the UTF-8 representation of an application identifier."));

  }
  memset(v10, 0, sizeof(v10));
  v6 = objc_retainAutorelease(v5);
  CC_SHA256((const void *)objc_msgSend(v6, "bytes", 0, 0, 0, 0), objc_msgSend(v6, "length"), (unsigned __int8 *)v10);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v10);

  return v7;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  _SWCApplicationIdentifier *v4;
  _SWCApplicationIdentifier *v5;
  NSString *prefix;
  BOOL v7;

  v4 = (_SWCApplicationIdentifier *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      prefix = self->_prefix;
      v7 = (prefix == v5->_prefix || -[NSString isEqual:](prefix, "isEqual:"))
        && -[_SWCApplicationIdentifier isEqualToApplicationIdentifierIgnoringPrefix:](self, "isEqualToApplicationIdentifierIgnoringPrefix:", v5);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[_SWCApplicationIdentifier description](self, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p> %@"), v4, self, v5);

  return v6;
}

- (id)redactedDescription
{
  return CFSTR("<app id>");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_SWCApplicationIdentifier rawValue](self, "rawValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("rawValue"));

}

- (_SWCApplicationIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SWCApplicationIdentifier *v6;

  v4 = a3;
  objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_SWCApplicationIdentifier initWithString:](self, "initWithString:", v5);

  return v6;
}

- (NSString)prefix
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
}

- (id)initForBundleRecord:(id)a3
{
  id v4;
  void *v5;
  _SWCApplicationIdentifier *v6;

  v4 = a3;
  objc_msgSend(v4, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v4, "isSystemPlaceholder")
    && (objc_msgSend(v4, "bundleIdentifier"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = -[_SWCApplicationIdentifier initWithString:](self, "initWithString:", v5);
  }
  else
  {

    v5 = 0;
    v6 = 0;
  }

  return v6;
}

@end
