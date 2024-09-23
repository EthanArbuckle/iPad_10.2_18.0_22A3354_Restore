@implementation RBSMachEndpoint

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSMachEndpoint)initWithRBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  RBSMachEndpoint *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("nonLaunching"));
  objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81338], CFSTR("port"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[RBSMachEndpoint _initWithName:nonLaunching:port:](self, "_initWithName:nonLaunching:port:", v5, v6, v7);
  return v8;
}

- (id)_initWithName:(id)a3 nonLaunching:(BOOL)a4 port:(id)a5
{
  id v9;
  id v10;
  void *v11;
  RBSMachEndpoint *v12;
  uint64_t v13;
  NSString *name;
  OS_xpc_object *getterCache_endpoint;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSMachEndpoint.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name != nil"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSMachEndpoint.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("port != nil"));

LABEL_3:
  if (MEMORY[0x194019424](v11) != MEMORY[0x1E0C81338])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSMachEndpoint.m"), 42, CFSTR("unexpected port type %@"), v11);

  }
  v20.receiver = self;
  v20.super_class = (Class)RBSMachEndpoint;
  v12 = -[RBSMachEndpoint init](&v20, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    name = v12->_name;
    v12->_name = (NSString *)v13;

    v12->_nonLaunching = a4;
    objc_storeStrong((id *)&v12->_port, a5);
    v12->_lock._os_unfair_lock_opaque = 0;
    getterCache_endpoint = v12->_getterCache_endpoint;
    v12->_getterCache_endpoint = 0;

    v12->_lock_hasCheckedEndpoint = 0;
  }

  return v12;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("name"));
  if (self->_nonLaunching)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("nonLaunching"));
  objc_msgSend(v4, "encodeXPCObject:forKey:", self->_port, CFSTR("port"));

}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isNonLaunching
{
  return self->_nonLaunching;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_getterCache_endpoint, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (OS_xpc_object)endpoint
{
  os_unfair_lock_s *p_lock;
  OS_xpc_object *bs_from_port;
  OS_xpc_object *getterCache_endpoint;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_hasCheckedEndpoint)
  {
    self->_lock_hasCheckedEndpoint = 1;
    if (-[RBSMachEndpoint _isCachedPortValid](self, "_isCachedPortValid"))
    {
      if (xpc_mach_send_copy_right() - 1 <= 0xFFFFFFFD)
      {
        bs_from_port = (OS_xpc_object *)xpc_endpoint_create_bs_from_port();
        getterCache_endpoint = self->_getterCache_endpoint;
        self->_getterCache_endpoint = bs_from_port;

      }
    }
  }
  os_unfair_lock_unlock(p_lock);
  return self->_getterCache_endpoint;
}

- (BOOL)_isCachedPortValid
{
  int right;

  right = xpc_mach_send_get_right();
  if (right)
    LOBYTE(right) = xpc_mach_send_get_right() != -1;
  return right;
}

- (RBSMachEndpoint)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSMachEndpoint.m"), 32, CFSTR("cannot call -init on RBSMachEndpoint"));

  return 0;
}

- (id)_copy
{
  void *v3;
  id v4;

  xpc_mach_send_get_right();
  v3 = (void *)xpc_mach_send_create_with_disposition();
  v4 = -[RBSMachEndpoint _initWithName:nonLaunching:port:]([RBSMachEndpoint alloc], "_initWithName:nonLaunching:port:", self->_name, self->_nonLaunching, v3);

  return v4;
}

- (BOOL)_isEquivalentToEndpoint:(id)a3
{
  RBSMachEndpoint *v4;
  RBSMachEndpoint *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *name;
  NSString *v9;
  BOOL v10;

  v4 = (RBSMachEndpoint *)a3;
  v5 = v4;
  if (self == v4)
  {
    v10 = 1;
    goto LABEL_15;
  }
  if (!v4)
    goto LABEL_13;
  v6 = objc_opt_class();
  if (v6 != objc_opt_class())
    goto LABEL_13;
  v7 = objc_opt_class();
  if (v7 != objc_opt_class()
    || !-[RBSMachEndpoint _isCachedPortValid](self, "_isCachedPortValid")
    || !-[RBSMachEndpoint _isCachedPortValid](v5, "_isCachedPortValid"))
  {
    goto LABEL_13;
  }
  name = self->_name;
  v9 = v5->_name;
  if (name == v9)
  {
LABEL_11:
    if (!self->_nonLaunching != v5->_nonLaunching)
    {
      v10 = xpc_equal(self->_port, v5->_port);
      goto LABEL_15;
    }
LABEL_13:
    v10 = 0;
    goto LABEL_15;
  }
  v10 = 0;
  if (name && v9)
  {
    if (!-[NSString isEqualToString:](name, "isEqualToString:"))
      goto LABEL_13;
    goto LABEL_11;
  }
LABEL_15:

  return v10;
}

- (NSString)description
{
  id v3;
  void *v4;
  NSString *name;
  const __CFString *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  if (self->_nonLaunching)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = -[RBSMachEndpoint _isCachedPortValid](self, "_isCachedPortValid");
  v8 = CFSTR("Invalid");
  if (v7)
    v8 = CFSTR("YES");
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| name:%@ nonLaunching:%@ port:%@>"), v4, name, v6, v8);

  return (NSString *)v9;
}

@end
