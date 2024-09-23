@implementation RBSDextProcessIdentity

- (id)_initDextWithServerName:(id)a3 label:(id)a4 containingAppBundleID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)RBSDextProcessIdentity;
  v11 = -[RBSProcessIdentity _init](&v23, sel__init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    v13 = (void *)*((_QWORD *)v11 + 7);
    *((_QWORD *)v11 + 7) = v12;

    v14 = objc_msgSend(v9, "copy");
    v15 = (void *)*((_QWORD *)v11 + 8);
    *((_QWORD *)v11 + 8) = v14;

    v16 = objc_msgSend(v10, "copy");
    v17 = (void *)*((_QWORD *)v11 + 9);
    *((_QWORD *)v11 + 9) = v16;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dext<%@>"), *((_QWORD *)v11 + 8));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v11 + 2);
    *((_QWORD *)v11 + 2) = v18;

    v20 = objc_msgSend(*((id *)v11 + 2), "hash");
    *((_QWORD *)v11 + 3) = objc_msgSend(*((id *)v11 + 9), "hash") ^ v20;
    v21 = v11;
  }

  return v11;
}

- (id)_initDextWithServerName:(id)a3 tagString:(id)a4 containingAppBundleID:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-%@"), v10, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[RBSDextProcessIdentity _initDextWithServerName:label:containingAppBundleID:](self, "_initDextWithServerName:label:containingAppBundleID:", v10, v11, v9);

  return v12;
}

- (BOOL)isAnonymous
{
  return 0;
}

- (id)dextServerName
{
  return self->_serverName;
}

- (id)dextLabel
{
  return self->_label;
}

- (id)dextContainingAppBundleID
{
  return self->_bundleID;
}

- (BOOL)isDext
{
  return 1;
}

- (BOOL)_matchesIdentity:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  char v6;
  NSString *label;
  NSString *v9;
  BOOL v10;
  NSString *bundleID;
  NSString *v12;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_2;
  label = self->_label;
  v9 = (NSString *)v4[8];
  if (label != v9)
  {
    v10 = !label || v9 == 0;
    if (v10 || !-[NSString isEqual:](label, "isEqual:"))
      goto LABEL_2;
  }
  bundleID = self->_bundleID;
  v12 = (NSString *)v4[9];
  if (bundleID == v12)
  {
    v6 = 1;
    goto LABEL_3;
  }
  if (bundleID && v12 != 0)
    v6 = -[NSString isEqual:](bundleID, "isEqual:");
  else
LABEL_2:
    v6 = 0;
LABEL_3:

  return v6;
}

- (id)debugDescription
{
  return self->super._description;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  NSString *serverName;
  id v5;

  serverName = self->_serverName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", serverName, CFSTR("_serverName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("_label"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleID, CFSTR("_bundleID"));

}

- (RBSDextProcessIdentity)initWithRBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  RBSDextProcessIdentity *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serverName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_label"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[RBSDextProcessIdentity _initDextWithServerName:label:containingAppBundleID:](self, "_initDextWithServerName:label:containingAppBundleID:", v5, v6, v7);
  return v8;
}

- (id)encodeForJob
{
  xpc_object_t empty;
  const char *v4;
  const char *v5;
  const char *v6;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, "TYPE", 5);
  v4 = -[NSString UTF8String](self->_serverName, "UTF8String");
  if (v4)
    xpc_dictionary_set_string(empty, "DSER", v4);
  v5 = -[NSString UTF8String](self->_label, "UTF8String");
  if (v5)
    xpc_dictionary_set_string(empty, "DLAB", v5);
  v6 = -[NSString UTF8String](self->_bundleID, "UTF8String");
  if (v6)
    xpc_dictionary_set_string(empty, "EAI", v6);
  return empty;
}

- (RBSDextProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *string;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  RBSDextProcessIdentity *v15;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    rbs_general_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[RBSDextProcessIdentity initWithDecodeFromJob:uuid:].cold.1((uint64_t)v7, v8);

  }
  string = xpc_dictionary_get_string(v6, "DSER");
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v11 = xpc_dictionary_get_string(v6, "DLAB");
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v13 = xpc_dictionary_get_string(v6, "EAI");
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  v15 = -[RBSDextProcessIdentity _initDextWithServerName:label:containingAppBundleID:](self, "_initDextWithServerName:label:containingAppBundleID:", v10, v12, v14);

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_serverName, 0);
}

- (void)initWithDecodeFromJob:(uint64_t)a1 uuid:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_190CD6000, a2, OS_LOG_TYPE_FAULT, "There is no reason an dext identity should have a UUID: %@", (uint8_t *)&v2, 0xCu);
}

@end
