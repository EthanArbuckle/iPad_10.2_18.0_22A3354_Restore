@implementation UMPersonaMachPort

- (id)replacementObjectForCoder:(id)a3
{
  id v4;
  UMPersonaMachPort *v5;
  UMPersonaMachPort *v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = self;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UMPersonaMachPort;
    -[UMPersonaMachPort replacementObjectForCoder:](&v8, sel_replacementObjectForCoder_, v4);
    v5 = (UMPersonaMachPort *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  if (objc_msgSend_machPort(self, v5, v6)
    && objc_msgSend_machPort(self, v7, v8) != -1
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_machPort(self, v9, v10);
    v12 = (void *)xpc_mach_send_create();
    if (v12)
      objc_msgSend_encodeXPCObject_forKey_(v4, v11, (uint64_t)v12, CFSTR("UMPersonaMachPort"));

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UMPersonaMachPort;
    -[UMPersonaMachPort encodeWithCoder:](&v13, sel_encodeWithCoder_, v4);
  }

}

- (UMPersonaMachPort)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  UMPersonaMachPort *v9;
  const char *v10;
  void *v11;
  const char *v12;
  objc_super v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend_decodeXPCObjectOfType_forKey_(v4, v5, MEMORY[0x1E0C81338], CFSTR("UMPersonaMachPort")),
        (v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v7 = (void *)v6, v8 = xpc_mach_send_copy_right(), v7, (v8 - 1) <= 0xFFFFFFFD))
  {
    v14.receiver = self;
    v14.super_class = (Class)UMPersonaMachPort;
    v9 = -[UMPersonaMachPort initWithMachPort:options:](&v14, sel_initWithMachPort_options_, v8, 0);
    if (!v9)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v8);
  }
  else
  {

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v10, *MEMORY[0x1E0CB2F90], 4864, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v12, (uint64_t)v11);

    v9 = 0;
  }

  return v9;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
