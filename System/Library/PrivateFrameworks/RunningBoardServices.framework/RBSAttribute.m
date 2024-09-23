@implementation RBSAttribute

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;

  if (self == a3)
    return 1;
  v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

- (RBSAttribute)initWithRBSXPCCoder:(id)a3
{
  RBSAttribute *v3;
  NSObject *v4;
  RBSAttribute *v5;

  v3 = self;
  if (-[RBSAttribute isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    rbs_assertion_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[RBSAttribute initWithRBSXPCCoder:].cold.1(v4);

    v5 = 0;
  }
  else
  {
    v3 = (RBSAttribute *)-[RBSAttribute _init](v3, "_init");
    v5 = v3;
  }

  return v5;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RBSAttribute;
  return -[RBSAttribute init](&v3, sel_init);
}

- (RBSAttribute)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSAttribute.m"), 17, CFSTR("-init is not allowed on RBSAttribute"));

  return 0;
}

- (NSString)description
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("<%@>"), v3);

  return (NSString *)v4;
}

- (void)initWithRBSXPCCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_190CD6000, log, OS_LOG_TYPE_FAULT, "RBSAttribute initialized without valid subclass", v1, 2u);
}

@end
