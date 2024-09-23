@implementation RBSMachPort

+ (id)portConsumingRightForPort:(unsigned int)a3
{
  RBSMachPort *v4;
  objc_super v6;

  v4 = [RBSMachPort alloc];
  if (v4)
  {
    v6.receiver = v4;
    v6.super_class = (Class)RBSMachPort;
    v4 = objc_msgSendSuper2(&v6, sel_init);
    if (v4)
    {
      v4->_port = a3;
      v4->_lock._os_unfair_lock_opaque = 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[RBSMachPort invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)RBSMachPort;
  -[RBSMachPort dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  OUTLINED_FUNCTION_0_0(&dword_190CD6000, a1, a3, "Unable to deallocate send right", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (unsigned)port
{
  if (self->_port + 1 >= 2)
    return self->_port;
  else
    return 0;
}

+ (id)portForPort:(unsigned int)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  RBSMachPort *v13;
  objc_super v14;

  if (mach_port_insert_right(*MEMORY[0x1E0C83DA0], a3, a3, 0x13u))
  {
    rbs_general_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[RBSMachPort portForPort:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    return 0;
  }
  else
  {
    v13 = [RBSMachPort alloc];
    if (v13)
    {
      v14.receiver = v13;
      v14.super_class = (Class)RBSMachPort;
      v13 = objc_msgSendSuper2(&v14, sel_init);
      if (v13)
      {
        v13->_port = a3;
        v13->_lock._os_unfair_lock_opaque = 0;
      }
    }
    return v13;
  }
}

- (BOOL)isUsable
{
  mach_port_name_t port;
  _BOOL4 v3;

  port = self->_port;
  if (port - 1 > 0xFFFFFFFD)
    LOBYTE(v3) = 0;
  else
    return (RBSMachPortType(port) >> 16) & 1;
  return v3;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  id v6;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)xpc_mach_send_create();
  if (v5)
    objc_msgSend(v6, "encodeXPCObject:forKey:", v5, CFSTR("_port"));
  os_unfair_lock_unlock(p_lock);

}

- (RBSMachPort)initWithRBSXPCCoder:(id)a3
{
  void *v4;
  unsigned int v5;
  RBSMachPort *v6;
  objc_super v8;

  objc_msgSend(a3, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81338], CFSTR("_port"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = xpc_mach_send_copy_right();
    if (!self)
      goto LABEL_7;
  }
  else
  {
    v5 = 0;
    if (!self)
      goto LABEL_7;
  }
  v8.receiver = self;
  v8.super_class = (Class)RBSMachPort;
  v6 = -[RBSMachPort init](&v8, sel_init);
  self = v6;
  if (v6)
  {
    v6->_port = v5;
    v6->_lock._os_unfair_lock_opaque = 0;
  }
LABEL_7:

  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RBSMachPort)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  RBSMachPort *v7;
  unsigned int v8;
  unsigned int v9;
  RBSMachPort *v10;
  objc_super v12;

  v4 = MEMORY[0x1E0C81338];
  objc_msgSend(a3, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81338], CFSTR("_port"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5 && MEMORY[0x194019424](v5) == v4)
  {
    v8 = xpc_mach_send_copy_right();
    if (self)
    {
      v9 = v8;
      v12.receiver = self;
      v12.super_class = (Class)RBSMachPort;
      v10 = -[RBSMachPort init](&v12, sel_init);
      if (v10)
      {
        v10->_port = v9;
        v10->_lock._os_unfair_lock_opaque = 0;
      }
    }
    else
    {
      v10 = 0;
    }
    self = v10;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  os_unfair_lock_s *p_lock;
  mach_port_name_t port;
  void *v6;
  id v7;

  v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  port = self->_port;
  if (port - 1 <= 0xFFFFFFFD && (RBSMachPortType(port) & 0x10000) != 0)
  {
    v6 = (void *)xpc_mach_send_create();
    if (v6)
      objc_msgSend(v7, "encodeXPCObject:forKey:", v6, CFSTR("_port"));

  }
  os_unfair_lock_unlock(p_lock);

}

- (id)copyWithZone:(_NSZone *)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  +[RBSMachPort portForPort:](RBSMachPort, "portForPort:", self->_port);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  RBSMachPort *v4;
  unsigned int v5;
  BOOL v6;

  v4 = (RBSMachPort *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[RBSMachPort port](self, "port");
      v6 = v5 == -[RBSMachPort port](v4, "port");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return -[RBSMachPort port](self, "port");
}

+ (void)portForPort:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_190CD6000, a1, a3, "Unable to insert COPY_SEND", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

@end
