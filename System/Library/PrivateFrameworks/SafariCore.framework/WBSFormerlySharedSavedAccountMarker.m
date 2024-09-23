@implementation WBSFormerlySharedSavedAccountMarker

- (WBSFormerlySharedSavedAccountMarker)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WBSFormerlySharedSavedAccountMarker *v7;
  NSObject *v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("passwordManagerCredentialIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groupName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WBSFormerlySharedSavedAccountMarker initWithPasswordManagerCredentialIdentifier:nameOfGroupCredentialWasLastSharedIn:]([WBSFormerlySharedSavedAccountMarker alloc], "initWithPasswordManagerCredentialIdentifier:nameOfGroupCredentialWasLastSharedIn:", v5, v6);

  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WBSFormerlySharedSavedAccountMarker initWithDictionaryRepresentation:].cold.1(v8);
    v7 = 0;
  }

  return v7;
}

- (WBSFormerlySharedSavedAccountMarker)initWithPasswordManagerCredentialIdentifier:(id)a3 nameOfGroupCredentialWasLastSharedIn:(id)a4
{
  id v6;
  id v7;
  WBSFormerlySharedSavedAccountMarker *v8;
  uint64_t v9;
  NSString *passwordManagerCredentialIdentifier;
  uint64_t v11;
  NSString *nameOfGroupCredentialWasLastSharedIn;
  WBSFormerlySharedSavedAccountMarker *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSFormerlySharedSavedAccountMarker;
  v8 = -[WBSFormerlySharedSavedAccountMarker init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    passwordManagerCredentialIdentifier = v8->_passwordManagerCredentialIdentifier;
    v8->_passwordManagerCredentialIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    nameOfGroupCredentialWasLastSharedIn = v8->_nameOfGroupCredentialWasLastSharedIn;
    v8->_nameOfGroupCredentialWasLastSharedIn = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  NSString *passwordManagerCredentialIdentifier;
  void *v5;
  void *v6;
  NSString *nameOfGroupCredentialWasLastSharedIn;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  passwordManagerCredentialIdentifier = self->_passwordManagerCredentialIdentifier;
  v9 = CFSTR("passwordManagerCredentialIdentifier");
  v10[0] = passwordManagerCredentialIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  nameOfGroupCredentialWasLastSharedIn = self->_nameOfGroupCredentialWasLastSharedIn;
  if (nameOfGroupCredentialWasLastSharedIn)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", nameOfGroupCredentialWasLastSharedIn, CFSTR("groupName"));
  return (NSDictionary *)v6;
}

- (BOOL)isEqual:(id)a3
{
  WBSFormerlySharedSavedAccountMarker *v4;
  WBSFormerlySharedSavedAccountMarker *v5;
  NSString *nameOfGroupCredentialWasLastSharedIn;
  void *v7;
  NSString *passwordManagerCredentialIdentifier;
  void *v9;
  char v10;

  v4 = (WBSFormerlySharedSavedAccountMarker *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      nameOfGroupCredentialWasLastSharedIn = self->_nameOfGroupCredentialWasLastSharedIn;
      -[WBSFormerlySharedSavedAccountMarker nameOfGroupCredentialWasLastSharedIn](v5, "nameOfGroupCredentialWasLastSharedIn");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (WBSIsEqual(nameOfGroupCredentialWasLastSharedIn, v7))
      {
        passwordManagerCredentialIdentifier = self->_passwordManagerCredentialIdentifier;
        -[WBSFormerlySharedSavedAccountMarker passwordManagerCredentialIdentifier](v5, "passwordManagerCredentialIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[NSString isEqualToString:](passwordManagerCredentialIdentifier, "isEqualToString:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_nameOfGroupCredentialWasLastSharedIn, "hash");
  return -[NSString hash](self->_passwordManagerCredentialIdentifier, "hash") ^ v3;
}

- (NSString)passwordManagerCredentialIdentifier
{
  return self->_passwordManagerCredentialIdentifier;
}

- (NSString)nameOfGroupCredentialWasLastSharedIn
{
  return self->_nameOfGroupCredentialWasLastSharedIn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameOfGroupCredentialWasLastSharedIn, 0);
  objc_storeStrong((id *)&self->_passwordManagerCredentialIdentifier, 0);
}

- (void)initWithDictionaryRepresentation:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B2621000, log, OS_LOG_TYPE_ERROR, "formerly shared marker initialized with invalid dictionary", v1, 2u);
}

@end
