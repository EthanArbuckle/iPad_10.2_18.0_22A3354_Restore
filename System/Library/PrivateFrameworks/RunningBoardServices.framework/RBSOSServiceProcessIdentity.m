@implementation RBSOSServiceProcessIdentity

- (void)encodeWithRBSXPCCoder:(id)a3
{
  NSString *jobLabel;
  id v5;

  jobLabel = self->_jobLabel;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", jobLabel, CFSTR("_jobLabel"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->super._pid, CFSTR("_pid"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_type, CFSTR("_type"));

}

- (BOOL)_matchesIdentity:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  BOOL v6;
  NSString *jobLabel;
  NSString *v8;
  BOOL v9;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v5 == objc_opt_class()
    && ((jobLabel = self->_jobLabel, v8 = (NSString *)v4[7], jobLabel == v8)
     || (jobLabel ? (v9 = v8 == 0) : (v9 = 1), !v9 && -[NSString isEqual:](jobLabel, "isEqual:")))
    && self->super._pid == *((_DWORD *)v4 + 2);

  return v6;
}

- (id)encodeForJob
{
  unsigned __int8 *p_type;
  xpc_object_t empty;
  NSString *jobLabel;
  const char *v6;
  uint64_t v8;
  _OWORD v9[5];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  p_type = &self->_type;
  if (self->_type <= 1u)
    -[RBSOSServiceProcessIdentity encodeForJob].cold.1(&v8, v9);
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, "TYPE", 6);
  jobLabel = self->_jobLabel;
  if (jobLabel)
  {
    v6 = -[NSString UTF8String](jobLabel, "UTF8String");
    if (v6)
      xpc_dictionary_set_string(empty, "l", v6);
  }
  xpc_dictionary_set_int64(empty, "p", self->super._pid);
  xpc_dictionary_set_int64(empty, "t", *p_type);
  return empty;
}

- (unsigned)osServiceType
{
  return self->_type;
}

- (RBSOSServiceProcessIdentity)initWithRBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  RBSOSServiceProcessIdentity *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_pid"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_jobLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_type"));

  v8 = (RBSOSServiceProcessIdentity *)-[RBSOSServiceProcessIdentity _initServiceWithJobLabel:pid:auid:type:](self, "_initServiceWithJobLabel:pid:auid:type:", v6, v5, 0, v7);
  return v8;
}

- (id)_initServiceWithJobLabel:(id)a3 pid:(int)a4 auid:(unsigned int)a5 type:(unsigned __int8)a6
{
  uint64_t v7;
  id v11;
  id *v12;
  id *v13;
  _QWORD *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  char *v20;
  objc_super v22;

  v7 = *(_QWORD *)&a5;
  v11 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RBSOSServiceProcessIdentity;
  v12 = -[RBSProcessIdentity _init](&v22, sel__init);
  v13 = v12;
  if (v12)
  {
    *((_DWORD *)v12 + 2) = a4;
    objc_storeStrong(v12 + 7, a3);
    v14 = v13 + 7;
    if ((_DWORD)v7)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("osservice<%@(%d)>"), *v14, v7);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("osservice<%@>"), *v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v13[2];
    v13[2] = (id)v15;

    v17 = *((unsigned int *)v13 + 2);
    if ((_DWORD)v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%d"), v13[2], v17);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v13[2];
      v13[2] = (id)v18;

    }
    v13[3] = (id)objc_msgSend(v13[2], "hash");
    *((_BYTE *)v13 + 64) = a6;
    v20 = v13;
  }

  return v13;
}

- (id)_initDaemonWithJobLabel:(id)a3 pid:(int)a4 auid:(unsigned int)a5
{
  return -[RBSOSServiceProcessIdentity _initServiceWithJobLabel:pid:auid:type:](self, "_initServiceWithJobLabel:pid:auid:type:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 2);
}

- (id)_initAngelWithJobLabel:(id)a3
{
  return -[RBSOSServiceProcessIdentity _initServiceWithJobLabel:pid:auid:type:](self, "_initServiceWithJobLabel:pid:auid:type:", a3, 0, 0, 3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jobLabel, 0);
}

- (id)consistentLaunchdJobLabel
{
  return (id)-[NSString copy](self->_jobLabel, "copy");
}

- (BOOL)hasConsistentLaunchdJob
{
  return 1;
}

- (BOOL)isAnonymous
{
  return 0;
}

- (BOOL)isAngel
{
  return 1;
}

- (BOOL)isDaemon
{
  return 1;
}

- (void)setOsServiceType:(unsigned __int8)a3
{
  if (self->_type == 1)
    self->_type = a3;
}

- (BOOL)treatedAsAnAppByFrontBoard:(id *)a3
{
  int type;
  void *v7;

  type = self->_type;
  if (type == 2)
    return 0;
  if (type == 3)
    return 1;
  +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v7, "isIdentityAnAngel:withError:", self, a3);

  return (char)a3;
}

- (id)_initUnknownOSServiceWithJobLabel:(id)a3
{
  return -[RBSOSServiceProcessIdentity _initServiceWithJobLabel:pid:auid:type:](self, "_initServiceWithJobLabel:pid:auid:type:", a3, 0, 0, 1);
}

- (id)debugDescription
{
  NSString *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t pid;
  const __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  v3 = self->_jobLabel;
  v4 = -[RBSProcessIdentity auid](self, "auid");
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  pid = self->super._pid;
  if ((int)pid <= 0)
    v8 = &stru_1E2D183D0;
  else
    v8 = CFSTR(" pid=");
  if ((int)pid < 1)
  {
    v9 = &stru_1E2D183D0;
    if ((_DWORD)v4)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", pid);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v5)
    {
LABEL_6:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("<type=%@ identifier=%@%@%@%@%@>"), CFSTR("daemon"), v3, v8, v9, CFSTR(" AUID="), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
  }
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<type=%@ identifier=%@%@%@%@%@>"), CFSTR("daemon"), v3, v8, v9, &stru_1E2D183D0, &stru_1E2D183D0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  if ((int)pid >= 1)

  return v11;
}

- (RBSOSServiceProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int64_t int64;
  const char *string;
  void *v11;
  RBSOSServiceProcessIdentity *v12;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    rbs_general_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[RBSOSServiceProcessIdentity initWithDecodeFromJob:uuid:].cold.1((uint64_t)v7, v8);

  }
  int64 = xpc_dictionary_get_int64(v6, "p");
  string = xpc_dictionary_get_string(v6, "l");
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = -[RBSOSServiceProcessIdentity _initServiceWithJobLabel:pid:auid:type:](self, "_initServiceWithJobLabel:pid:auid:type:", v11, int64, 0, xpc_dictionary_get_int64(v6, "t"));

  return v12;
}

- (id)daemonJobLabel
{
  return (id)-[NSString copy](self->_jobLabel, "copy");
}

- (id)angelJobLabel
{
  return (id)-[NSString copy](self->_jobLabel, "copy");
}

- (BOOL)supportsLaunchingDirectly
{
  return 1;
}

- (void)encodeForJob
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

- (void)initWithDecodeFromJob:(uint64_t)a1 uuid:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_190CD6000, a2, OS_LOG_TYPE_FAULT, "There is no reason a daemon should have a UUID: %@", (uint8_t *)&v2, 0xCu);
}

@end
