@implementation WBSPasswordBreachCredential

- (WBSPasswordBreachCredential)initWithSecItemDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WBSPasswordBreachCredential *v9;
  NSObject *v10;

  v4 = a3;
  objc_msgSend(v4, "safari_dataForKey:", *MEMORY[0x1E0CD70D8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 4);
  if (v6)
  {
    objc_msgSend(v4, "safari_dataForKey:", *MEMORY[0x1E0CD70E0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_dateForKey:", *MEMORY[0x1E0CD6A98]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[WBSPasswordBreachCredential initWithPassword:persistentIdentifier:dateLastModified:](self, "initWithPassword:persistentIdentifier:dateLastModified:", v6, v7, v8);

    v9 = self;
  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[WBSPasswordBreachCredential initWithSecItemDictionary:].cold.1(v10);
    v9 = 0;
  }

  return v9;
}

- (WBSPasswordBreachCredential)initWithPassword:(id)a3 persistentIdentifier:(id)a4 dateLastModified:(id)a5
{
  id v8;
  id v9;
  id v10;
  WBSPasswordBreachCredential *v11;
  uint64_t v12;
  NSString *password;
  uint64_t v14;
  NSData *persistentIdentifier;
  uint64_t v16;
  NSDate *dateLastModified;
  WBSPasswordBreachCredential *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WBSPasswordBreachCredential;
  v11 = -[WBSPasswordBreachCredential init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    password = v11->_password;
    v11->_password = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    persistentIdentifier = v11->_persistentIdentifier;
    v11->_persistentIdentifier = (NSData *)v14;

    v16 = objc_msgSend(v10, "copy");
    dateLastModified = v11->_dateLastModified;
    v11->_dateLastModified = (NSDate *)v16;

    v18 = v11;
  }

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p, persistentIdentifier: %@, dateLastModified: %@>"), objc_opt_class(), self, self->_persistentIdentifier, self->_dateLastModified);
}

- (NSString)password
{
  return self->_password;
}

- (NSData)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (NSDate)dateLastModified
{
  return self->_dateLastModified;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_password, 0);
}

- (void)initWithSecItemDictionary:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B2621000, log, OS_LOG_TYPE_DEBUG, "Skipping password with invalid UTF-8 byte sequence.", v1, 2u);
}

@end
