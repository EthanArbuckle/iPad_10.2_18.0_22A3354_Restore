@implementation RBSAssertionIdentifier

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSAssertionIdentifier)initWithRBSXPCCoder:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  unint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("serverPid"));
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("clientPid"));
  v7 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("count"));

  return (RBSAssertionIdentifier *)-[RBSAssertionIdentifier _initWithServerPid:clientPid:count:](self, v5, v6, v7);
}

- (unint64_t)hash
{
  return self->_hash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desc, 0);
}

- (int)clientPid
{
  return self->_clientPid;
}

- (NSString)description
{
  RBSAssertionIdentifier *v2;
  NSString *desc;
  uint64_t v4;
  NSString *v5;
  NSString *v6;

  v2 = self;
  objc_sync_enter(v2);
  desc = v2->_desc;
  if (!desc)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d-%d-%llu"), v2->_serverPid, v2->_clientPid, v2->_count);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v2->_desc;
    v2->_desc = (NSString *)v4;

    desc = v2->_desc;
  }
  v6 = desc;
  objc_sync_exit(v2);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  RBSAssertionIdentifier *v4;
  RBSAssertionIdentifier *v5;
  uint64_t v6;
  BOOL v7;

  v4 = (RBSAssertionIdentifier *)a3;
  v5 = v4;
  if (self == v4)
    v7 = 1;
  else
    v7 = v4
      && (v6 = objc_opt_class(), v6 == objc_opt_class())
      && self->_serverPid == v5->_serverPid
      && self->_clientPid == v5->_clientPid
      && self->_count == v5->_count;

  return v7;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  uint64_t serverPid;
  id v5;

  serverPid = self->_serverPid;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", serverPid, CFSTR("serverPid"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_clientPid, CFSTR("clientPid"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_count, CFSTR("count"));

}

+ (RBSAssertionIdentifier)identifierWithClientPid:(int)a3
{
  uint64_t v3;
  RBSAssertionIdentifier *v4;
  pid_t v5;
  unint64_t v6;

  v3 = *(_QWORD *)&a3;
  v4 = [RBSAssertionIdentifier alloc];
  v5 = getpid();
  objc_opt_self();
  do
    v6 = __ldxr(&_next___count);
  while (__stxr(v6 + 1, &_next___count));
  return (RBSAssertionIdentifier *)-[RBSAssertionIdentifier _initWithServerPid:clientPid:count:](v4, v5, v3, v6);
}

- (id)_initWithServerPid:(uint64_t)a3 clientPid:(unint64_t)a4 count:
{
  id v5;
  _DWORD *v8;
  unint64_t v9;
  objc_super v11;

  if (a1)
  {
    v5 = 0;
    if (a2 >= 1 && (int)a3 >= 1)
    {
      v11.receiver = a1;
      v11.super_class = (Class)RBSAssertionIdentifier;
      v8 = objc_msgSendSuper2(&v11, sel_init);
      if (v8)
      {
        v8[6] = a2;
        v8[7] = a3;
        *((_QWORD *)v8 + 4) = a4;
        v9 = 0x94D049BB133111EBLL
           * ((0xBF58476D1CE4E5B9 * (a4 ^ (a4 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (a4 ^ (a4 >> 30))) >> 27));
        *((_QWORD *)v8 + 2) = (a2 | (unint64_t)(a3 << 32)) ^ (v9 >> 31) ^ v9;
      }
      a1 = v8;
      v5 = a1;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (RBSAssertionIdentifier)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSAssertionIdentifier.m"), 36, CFSTR("-init is not allowed on RBSAssertionIdentifier"));

  return 0;
}

- (int)serverPid
{
  return self->_serverPid;
}

- (unint64_t)count
{
  return self->_count;
}

@end
