@implementation RBSXPCServiceProcessIdentity

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_serviceIdentity, CFSTR("_serviceIdentity"));
  if (self->super._pid >= 1)
    objc_msgSend(v4, "encodeInt64:forKey:");

}

- (id)encodeForJob
{
  xpc_object_t empty;
  int64_t pid;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  const char *v14;
  id v15;
  const char *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  int64_t v21;
  unsigned __int8 uuid[8];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, "TYPE", 4);
  pid = self->super._pid;
  if ((_DWORD)pid)
    xpc_dictionary_set_int64(empty, "p", pid);
  -[RBSXPCServiceProcessIdentity hostIdentifier](self, "hostIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "pid");

  if (v6)
    xpc_dictionary_set_int64(empty, "h", v6);
  -[RBSXPCServiceProcessIdentity hostIdentity](self, "hostIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    *(_QWORD *)uuid = 0;
    v24 = 0;
    objc_msgSend(v8, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(empty, "hu", uuid);
  }
  -[RBSXPCServiceIdentity host](self->_serviceIdentity, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "encodeForJob");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      xpc_dictionary_set_value(empty, "H", v11);
    }
    else
    {
      rbs_process_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[RBSXPCServiceProcessIdentity encodeForJob].cold.1((uint64_t)v10, (uint64_t)self, v12);

    }
  }
  -[RBSXPCServiceProcessIdentity xpcServiceIdentifier](self, "xpcServiceIdentifier");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = (const char *)objc_msgSend(v13, "UTF8String");

  if (v14)
    xpc_dictionary_set_string(empty, "i", v14);
  -[RBSXPCServiceProcessIdentity personaString](self, "personaString");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = (const char *)objc_msgSend(v15, "UTF8String");

  if (v16)
    xpc_dictionary_set_string(empty, "o", v16);
  -[RBSXPCServiceProcessIdentity validationToken](self, "validationToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = objc_retainAutorelease(v17);
    xpc_dictionary_set_data(empty, "v", (const void *)objc_msgSend(v19, "bytes"), objc_msgSend(v19, "length"));
  }
  -[RBSXPCServiceIdentity definition](self->_serviceIdentity, "definition");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "variant");

  xpc_dictionary_set_int64(empty, "r", v21);
  return empty;
}

- (id)uuid
{
  return -[RBSXPCServiceIdentity uuid](self->_serviceIdentity, "uuid");
}

- (id)personaString
{
  return -[RBSXPCServiceIdentity personaString](self->_serviceIdentity, "personaString");
}

- (BOOL)isExtension
{
  void *v2;
  BOOL v3;

  -[RBSXPCServiceIdentity definition](self->_serviceIdentity, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "variant") > 1;

  return v3;
}

- (RBSXPCServiceProcessIdentity)initWithRBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  RBSXPCServiceProcessIdentity *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serviceIdentity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_pid"));

  v7 = (RBSXPCServiceProcessIdentity *)-[RBSXPCServiceProcessIdentity _initWithXPCServiceID:pid:auid:](self, "_initWithXPCServiceID:pid:auid:", v5, v6, 0);
  return v7;
}

- (id)_initWithXPCServiceID:(id)a3 pid:(int)a4 auid:(unsigned int)a5
{
  uint64_t v5;
  id v9;
  id *v10;
  id *v11;
  id *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id *v41;
  id v43;
  objc_super v44;

  v5 = *(_QWORD *)&a5;
  v9 = a3;
  v44.receiver = self;
  v44.super_class = (Class)RBSXPCServiceProcessIdentity;
  v10 = -[RBSProcessIdentity _init](&v44, sel__init);
  v11 = v10;
  if (v10)
  {
    v43 = v9;
    v12 = v10 + 7;
    objc_storeStrong(v10 + 7, a3);
    if (a4 >= 1)
      *((_DWORD *)v11 + 2) = a4;
    objc_msgSend(*v12, "definition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "variant");

    if (v14 == 3)
      v15 = CFSTR("extextension");
    else
      v15 = CFSTR("xpcservice");
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*v12, "definition");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v12, "host");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = (const __CFString *)v19;
    else
      v21 = CFSTR("no host");
    objc_msgSend(*v12, "validationToken");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "hash");
    if ((_DWORD)v5)
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@<%@(%@)(%d)>{vt hash: %lu}"), v15, v18, v21, v5, v23);
    else
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@<%@(%@)>{vt hash: %lu}"), v15, v18, v21, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v11[2];
    v11[2] = (id)v24;

    objc_msgSend(v11, "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = (void *)MEMORY[0x1E0CB3940];
      v28 = v11[2];
      objc_msgSend(v11, "uuid");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("%@[uuid:%@]"), v28, v29);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v11[2];
      v11[2] = (id)v30;

    }
    objc_msgSend(v11, "personaString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = (void *)MEMORY[0x1E0CB3940];
      v34 = v11[2];
      objc_msgSend(v11, "personaString");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringWithFormat:", CFSTR("%@{persona:%@}"), v34, v35);
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v11[2];
      v11[2] = (id)v36;

    }
    v38 = *((unsigned int *)v11 + 2);
    if ((_DWORD)v38)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%d"), v11[2], v38);
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = v11[2];
      v11[2] = (id)v39;

    }
    v11[3] = (id)objc_msgSend(*v12, "hash");
    v41 = v11;
    v9 = v43;
  }

  return v11;
}

- (id)hostIdentifier
{
  void *v2;
  void *v3;

  -[RBSXPCServiceIdentity host](self->_serviceIdentity, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)xpcServiceIdentifier
{
  void *v2;
  void *v3;

  -[RBSXPCServiceIdentity definition](self->_serviceIdentity, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)validationToken
{
  return -[RBSXPCServiceIdentity validationToken](self->_serviceIdentity, "validationToken");
}

- (BOOL)isEqualToIdentity:(id)a3
{
  RBSXPCServiceProcessIdentity *v4;
  unint64_t v5;
  BOOL v6;

  v4 = (RBSXPCServiceProcessIdentity *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v5 = -[RBSProcessIdentity hash](self, "hash");
    v6 = v5 == -[RBSProcessIdentity hash](v4, "hash")
      && -[RBSXPCServiceProcessIdentity _matchesIdentity:](self, "_matchesIdentity:", v4);
  }

  return v6;
}

- (BOOL)_matchesIdentity:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  char v6;
  RBSXPCServiceIdentity *serviceIdentity;
  RBSXPCServiceIdentity *v9;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    goto LABEL_2;
  serviceIdentity = self->_serviceIdentity;
  v9 = (RBSXPCServiceIdentity *)v4[7];
  if (serviceIdentity == v9)
  {
    v6 = 1;
    goto LABEL_3;
  }
  if (!serviceIdentity || v9 == 0)
LABEL_2:
    v6 = 0;
  else
    v6 = -[RBSXPCServiceIdentity isEqual:](serviceIdentity, "isEqual:");
LABEL_3:

  return v6;
}

- (BOOL)isXPCService
{
  return 1;
}

- (BOOL)isAnonymous
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentity, 0);
}

- (id)hostIdentity
{
  void *v2;
  void *v3;

  -[RBSXPCServiceIdentity host](self->_serviceIdentity, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isMultiInstanceExtension
{
  void *v3;
  BOOL v4;

  if (!-[RBSXPCServiceProcessIdentity isExtension](self, "isExtension"))
    return 0;
  -[RBSXPCServiceIdentity uuid](self->_serviceIdentity, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (unsigned)defaultManageFlags
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  RBSXPCServiceIdentity *serviceIdentity;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  int v12;
  RBSXPCServiceIdentity *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (defaultManageFlags_onceToken != -1)
    dispatch_once(&defaultManageFlags_onceToken, &__block_literal_global_1);
  v3 = (void *)defaultManageFlags___xpcserviceUnmanagedSet;
  -[RBSXPCServiceIdentity definition](self->_serviceIdentity, "definition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "containsObject:", v5);

  if ((_DWORD)v3)
  {
    rbs_process_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      serviceIdentity = self->_serviceIdentity;
      v12 = 138412290;
      v13 = serviceIdentity;
      _os_log_impl(&dword_190CD6000, v6, OS_LOG_TYPE_INFO, "Not managing %@", (uint8_t *)&v12, 0xCu);
    }

    return 0;
  }
  else
  {
    -[RBSXPCServiceIdentity host](self->_serviceIdentity, "host");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "defaultManageFlags");

    return v11;
  }
}

- (BOOL)isExternal
{
  void *v2;
  BOOL v3;

  -[RBSXPCServiceIdentity definition](self->_serviceIdentity, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "variant") == 3;

  return v3;
}

+ (BOOL)shouldManageExtensionWithExtensionPoint:(id)a3
{
  return 1;
}

void __50__RBSXPCServiceProcessIdentity_defaultManageFlags__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.FileProvider.ArchiveService"), CFSTR("com.apple.SMBClientProvider.FileProvider"), CFSTR("com.apple.SafariServices.ContentBlockerLoader"), CFSTR("com.apple.CallKit.CallDirectory"), CFSTR("com.apple.AppleMediaServicesUI.SpyglassPurchases"), 0);
  v1 = (void *)defaultManageFlags___xpcserviceUnmanagedSet;
  defaultManageFlags___xpcserviceUnmanagedSet = v0;

}

- (BOOL)supportsLaunchingDirectly
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;

  if (!-[RBSXPCServiceProcessIdentity isExtension](self, "isExtension"))
    return 0;
  -[RBSXPCServiceProcessIdentity hostIdentity](self, "hostIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSProcessHandle currentProcess](RBSProcessHandle, "currentProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identity");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3 == (void *)v5)
  {
    v7 = 1;
  }
  else
  {
    v7 = 0;
    if (v3 && v5)
      v7 = objc_msgSend(v3, "isEqual:", v5);
  }

  return v7;
}

- (BOOL)inheritsCoalitionBand
{
  RBSXPCServiceIdentity *serviceIdentity;
  void *v3;
  BOOL v4;

  serviceIdentity = self->_serviceIdentity;
  if (!serviceIdentity)
    return 0;
  -[RBSXPCServiceIdentity definition](serviceIdentity, "definition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "variant") == 1 && objc_msgSend(v3, "scope") == 1;

  return v4;
}

- (RBSXPCServiceProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4
{
  id v6;
  id v7;
  const char *string;
  int64_t v9;
  const uint8_t *uuid;
  void *v11;
  RBSXPCServiceProcessIdentity *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *data;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int64_t v25;
  int64_t v26;
  void *v27;
  int64_t int64;
  void *v29;
  size_t length;

  v6 = a3;
  v7 = a4;
  string = xpc_dictionary_get_string(v6, "i");
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    int64 = xpc_dictionary_get_int64(v6, "p");
    v9 = xpc_dictionary_get_int64(v6, "h");
    uuid = xpc_dictionary_get_uuid(v6, "hu");
    if (uuid)
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uuid);
    else
      v11 = 0;
    xpc_dictionary_get_value(v6, "H");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      +[RBSProcessIdentity decodeFromJob:uuid:](RBSProcessIdentity, "decodeFromJob:uuid:", v13, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

    v26 = xpc_dictionary_get_int64(v6, "e");
    v25 = xpc_dictionary_get_int64(v6, "r");
    v15 = xpc_dictionary_get_string(v6, "o");
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
    }
    length = 0;
    data = (void *)xpc_dictionary_get_data(v6, "v", &length);
    v17 = v7;
    if (data)
    {
      v18 = objc_alloc(MEMORY[0x1E0C99D50]);
      data = (void *)objc_msgSend(v18, "initWithBytes:length:", data, length);
    }
    v19 = 0;
    if ((_DWORD)v9)
      v20 = 1;
    else
      v20 = 3;
    if ((_DWORD)v9 && v14)
    {
      +[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[RBSProcessInstance instanceWithIdentifier:identity:](RBSProcessInstance, "instanceWithIdentifier:identity:", v21, v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    +[RBSXPCServiceDefinition definitionWithIdentifier:variant:scope:](RBSXPCServiceDefinition, "definitionWithIdentifier:variant:scope:", v29, v25, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;
    +[RBSXPCServiceIdentity identityWithDefinition:sessionID:host:UUID:persona:validationToken:](RBSXPCServiceIdentity, "identityWithDefinition:sessionID:host:UUID:persona:validationToken:", v22, 0, v19, v17, v27, data);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    self = (RBSXPCServiceProcessIdentity *)-[RBSXPCServiceProcessIdentity _initWithXPCServiceID:pid:auid:](self, "_initWithXPCServiceID:pid:auid:", v23, int64, v26);

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeForJob
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_190CD6000, log, OS_LOG_TYPE_FAULT, "error encoding host identity for job: %@ of %@", (uint8_t *)&v3, 0x16u);
}

@end
