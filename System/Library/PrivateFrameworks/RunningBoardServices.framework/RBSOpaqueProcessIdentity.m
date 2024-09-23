@implementation RBSOpaqueProcessIdentity

- (id)_initOpaqueWithPid:(int)a3 auid:(unsigned int)a4 description:(id)a5
{
  id v7;
  _DWORD *v8;
  _DWORD *v9;
  uint64_t v10;
  void *v11;
  _DWORD *v12;
  objc_super v14;

  v7 = a5;
  v14.receiver = self;
  v14.super_class = (Class)RBSOpaqueProcessIdentity;
  v8 = -[RBSProcessIdentity _init](&v14, sel__init);
  v9 = v8;
  if (v8)
  {
    v8[2] = a3;
    v10 = objc_msgSend(v7, "copy");
    v11 = (void *)*((_QWORD *)v9 + 2);
    *((_QWORD *)v9 + 2) = v10;

    *((_QWORD *)v9 + 3) = (int)v9[2];
    v12 = v9;
  }

  return v9;
}

- (id)_initOpaqueWithPid:(int)a3 name:(id)a4 auid:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v8;
  id v9;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("anon<%@>"), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[RBSOpaqueProcessIdentity _initOpaqueWithPid:auid:description:](self, "_initOpaqueWithPid:auid:description:", v6, v5, v8);

  return v9;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  uint64_t pid;
  id v5;

  pid = self->super._pid;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", pid, CFSTR("_pid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->super._description, CFSTR("_description"));

}

- (RBSOpaqueProcessIdentity)initWithRBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  RBSOpaqueProcessIdentity *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_pid"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_description"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[RBSOpaqueProcessIdentity _initOpaqueWithPid:auid:description:](self, "_initOpaqueWithPid:auid:description:", v5, 0, v6);
  return v7;
}

- (id)encodeForJob
{
  xpc_object_t empty;
  const char *v4;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, "TYPE", 7);
  xpc_dictionary_set_int64(empty, "p", self->super._pid);
  v4 = -[NSString UTF8String](self->super._description, "UTF8String");
  if (v4)
    xpc_dictionary_set_string(empty, "d", v4);
  return empty;
}

- (RBSOpaqueProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int64_t int64;
  const char *string;
  void *v11;
  RBSOpaqueProcessIdentity *v12;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    rbs_general_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[RBSOpaqueProcessIdentity initWithDecodeFromJob:uuid:].cold.1((uint64_t)v7, v8);

  }
  int64 = xpc_dictionary_get_int64(v6, "p");
  string = xpc_dictionary_get_string(v6, "d");
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = -[RBSOpaqueProcessIdentity _initOpaqueWithPid:auid:description:](self, "_initOpaqueWithPid:auid:description:", int64, 0, v11);

  return v12;
}

- (void)initWithDecodeFromJob:(uint64_t)a1 uuid:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_190CD6000, a2, OS_LOG_TYPE_FAULT, "There is no reason an opaque identity should have a UUID %@:", (uint8_t *)&v2, 0xCu);
}

@end
