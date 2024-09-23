@implementation SBSUnlockOptions

- (SBSUnlockOptions)initWithXPCDictionary:(id)a3
{
  id v4;
  SBSUnlockOptions *v5;
  const char *string;
  uint64_t v7;
  NSString *title;
  const char *v9;
  uint64_t v10;
  NSString *subtitle;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBSUnlockOptions;
  v5 = -[SBSUnlockOptions init](&v13, sel_init);
  if (v5)
  {
    v5->_aboveOtherContexts = xpc_dictionary_get_BOOL(v4, (const char *)objc_msgSend(CFSTR("aboveOtherContexts"), "UTF8String"));
    string = xpc_dictionary_get_string(v4, (const char *)objc_msgSend(CFSTR("title"), "UTF8String"));
    if (string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v7 = objc_claimAutoreleasedReturnValue();
      title = v5->_title;
      v5->_title = (NSString *)v7;

    }
    v9 = xpc_dictionary_get_string(v4, (const char *)objc_msgSend(CFSTR("subtitle"), "UTF8String"));
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      subtitle = v5->_subtitle;
      v5->_subtitle = (NSString *)v10;

    }
  }

  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  xpc_object_t xdict;

  xdict = a3;
  xpc_dictionary_set_BOOL(xdict, (const char *)objc_msgSend(CFSTR("aboveOtherContexts"), "UTF8String"), self->_aboveOtherContexts);
  -[SBSUnlockOptions title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SBSUnlockOptions title](self, "title");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (const char *)objc_msgSend(v5, "UTF8String");

    xpc_dictionary_set_string(xdict, (const char *)objc_msgSend(CFSTR("title"), "UTF8String"), v6);
  }
  -[SBSUnlockOptions subtitle](self, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SBSUnlockOptions subtitle](self, "subtitle");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (const char *)objc_msgSend(v8, "UTF8String");

    xpc_dictionary_set_string(xdict, (const char *)objc_msgSend(CFSTR("subtitle"), "UTF8String"), v9);
  }

}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeBool:forKey:", self->_aboveOtherContexts, CFSTR("aboveOtherContexts"));
  -[SBSUnlockOptions title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SBSUnlockOptions title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("title"));

  }
  -[SBSUnlockOptions subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SBSUnlockOptions subtitle](self, "subtitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("subtitle"));

  }
}

- (SBSUnlockOptions)initWithBSXPCCoder:(id)a3
{
  id v4;
  SBSUnlockOptions *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSUnlockOptions;
  v5 = -[SBSUnlockOptions init](&v9, sel_init);
  if (v5)
  {
    v5->_aboveOtherContexts = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("aboveOtherContexts"));
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSUnlockOptions _setTitle:](v5, "_setTitle:", v6);

    objc_msgSend(v4, "decodeStringForKey:", CFSTR("subtitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSUnlockOptions _setSubtitle:](v5, "_setSubtitle:", v7);

  }
  return v5;
}

- (BOOL)_aboveOtherContexts
{
  return self->_aboveOtherContexts;
}

- (void)_setAboveOtherContexts:(BOOL)a3
{
  self->_aboveOtherContexts = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)_setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)_setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
