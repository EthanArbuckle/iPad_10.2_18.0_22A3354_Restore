@implementation CollationElement

+ (id)scopeToString:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("SCOPE_UNK");
  if (a3 == 2)
    v3 = CFSTR("SCOPE_USER");
  if (a3 == 1)
    return CFSTR("SCOPE_SYSTEM");
  else
    return (id)v3;
}

- (id)description
{
  void *v3;
  NSString *cle_bundle_id;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  cle_bundle_id = self->_cle_bundle_id;
  +[CollationElement scopeToString:](CollationElement, "scopeToString:", -[CollationElement cle_scope](self, "cle_scope"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[bundle: %@, scope: %@, mount: %@, cmd: %@, env: %@]"), cle_bundle_id, v5, self->_cle_mnt_path, self->_cle_command, self->_cle_env);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyAbsolutePath:(id)a3
{
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), self->_cle_mnt_path, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CollationElement)initWithBundle:(id)a3 version:(id)a4 atPath:(id)a5 withScope:(int64_t)a6 withCommand:(id)a7 withCommandArgs:(id)a8 withEnv:(id)a9
{
  id v16;
  id v17;
  CollationElement *v18;
  CollationElement *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a4;
  v22 = a5;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)CollationElement;
  v18 = -[CollationElement init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_cle_scope = a6;
    objc_storeStrong((id *)&v18->_cle_mnt_path, a5);
    objc_storeStrong((id *)&v19->_cle_bundle_id, a3);
    objc_storeStrong((id *)&v19->_cle_bundle_version, a4);
    objc_storeStrong((id *)&v19->_cle_command, a7);
    objc_storeStrong((id *)&v19->_cle_env, a9);
    objc_storeStrong((id *)&v19->_cle_command_args, a8);
  }

  return v19;
}

- (CollationElement)initWithXPC:(id)a3
{
  id v4;
  CollationElement *v5;
  const char *string;
  uint64_t v7;
  NSString *cle_mnt_path;
  uint64_t v9;
  NSString *cle_bundle_id;
  uint64_t v11;
  NSString *cle_bundle_version;
  uint64_t v13;
  NSString *cle_command;
  void *v15;
  uint64_t v16;
  NSDictionary *cle_env;
  void *v18;
  uint64_t v19;
  NSArray *cle_command_args;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CollationElement;
  v5 = -[CollationElement init](&v22, sel_init);
  if (v5)
  {
    string = xpc_dictionary_get_string(v4, "cmd");
    v5->_cle_scope = xpc_dictionary_get_int64(v4, "scope");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_dictionary_get_string(v4, "mntpath"));
    v7 = objc_claimAutoreleasedReturnValue();
    cle_mnt_path = v5->_cle_mnt_path;
    v5->_cle_mnt_path = (NSString *)v7;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_dictionary_get_string(v4, "cryptex_bundleid"));
    v9 = objc_claimAutoreleasedReturnValue();
    cle_bundle_id = v5->_cle_bundle_id;
    v5->_cle_bundle_id = (NSString *)v9;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_dictionary_get_string(v4, "version"));
    v11 = objc_claimAutoreleasedReturnValue();
    cle_bundle_version = v5->_cle_bundle_version;
    v5->_cle_bundle_version = (NSString *)v11;

    if (string)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
      v13 = objc_claimAutoreleasedReturnValue();
      cle_command = v5->_cle_command;
      v5->_cle_command = (NSString *)v13;

    }
    xpc_dictionary_get_dictionary(v4, "env");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = _CFXPCCreateCFObjectFromXPCObject();
      cle_env = v5->_cle_env;
      v5->_cle_env = (NSDictionary *)v16;

    }
    xpc_dictionary_get_array(v4, "cmd_arg");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = _CFXPCCreateCFObjectFromXPCObject();
      cle_command_args = v5->_cle_command_args;
      v5->_cle_command_args = (NSArray *)v19;

    }
  }

  return v5;
}

- (id)package
{
  xpc_object_t empty;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, "scope", -[CollationElement cle_scope](self, "cle_scope"));
  +[CollationElement scopeToString:](CollationElement, "scopeToString:", -[CollationElement cle_scope](self, "cle_scope"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(empty, "scope_string", (const char *)objc_msgSend(v4, "UTF8String"));

  -[CollationElement cle_bundle_id](self, "cle_bundle_id");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(empty, "cryptex_bundleid", (const char *)objc_msgSend(v5, "UTF8String"));

  -[CollationElement cle_mnt_path](self, "cle_mnt_path");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(empty, "mntpath", (const char *)objc_msgSend(v6, "UTF8String"));

  -[CollationElement cle_bundle_version](self, "cle_bundle_version");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(empty, "version", (const char *)objc_msgSend(v7, "UTF8String"));

  -[CollationElement cle_command](self, "cle_command");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CollationElement cle_command](self, "cle_command");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(empty, "command", (const char *)objc_msgSend(v9, "UTF8String"));

  }
  -[CollationElement cle_env](self, "cle_env");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CollationElement cle_env](self, "cle_env");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(empty, "env", v12);

  }
  -[CollationElement cle_command_args](self, "cle_command_args");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[CollationElement cle_command_args](self, "cle_command_args");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(empty, "cmd_arg", v15);

  }
  return empty;
}

- (int64_t)cle_scope
{
  return self->_cle_scope;
}

- (NSString)cle_bundle_id
{
  return self->_cle_bundle_id;
}

- (NSString)cle_bundle_version
{
  return self->_cle_bundle_version;
}

- (NSString)cle_mnt_path
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)cle_command
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)cle_env
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)cle_command_args
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cle_command_args, 0);
  objc_storeStrong((id *)&self->_cle_env, 0);
  objc_storeStrong((id *)&self->_cle_command, 0);
  objc_storeStrong((id *)&self->_cle_mnt_path, 0);
  objc_storeStrong((id *)&self->_cle_bundle_version, 0);
  objc_storeStrong((id *)&self->_cle_bundle_id, 0);
}

@end
