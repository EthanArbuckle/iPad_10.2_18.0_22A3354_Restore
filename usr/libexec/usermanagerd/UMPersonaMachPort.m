@implementation UMPersonaMachPort

- (id)replacementObjectForCoder:(id)a3
{
  id v4;
  uint64_t v5;
  UMPersonaMachPort *v6;
  id v7;
  UMPersonaMachPort *v8;
  objc_super v10;

  v4 = a3;
  v5 = objc_opt_class(NSXPCCoder);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = self;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UMPersonaMachPort;
    v7 = -[UMPersonaMachPort replacementObjectForCoder:](&v10, "replacementObjectForCoder:", v4);
    v6 = (UMPersonaMachPort *)objc_claimAutoreleasedReturnValue(v7);
  }
  v8 = v6;

  return v8;
}

- (UMPersonaMachPort)initWithCoder:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  UMPersonaMachPort *v11;
  void *v12;
  void *v14;
  objc_super v15;

  v5 = a3;
  v6 = objc_opt_class(NSXPCCoder);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UMPersonaMachPort.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[aDecoder isKindOfClass:[NSXPCCoder class]]"));

  }
  v7 = objc_opt_class(NSXPCCoder);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0
    && (v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "decodeXPCObjectOfType:forKey:", &_xpc_type_mach_send, CFSTR("UMPersonaMachPort")))) != 0
    && (v9 = (void *)v8, v10 = xpc_mach_send_copy_right(), v9, (v10 - 1) <= 0xFFFFFFFD))
  {
    v15.receiver = self;
    v15.super_class = (Class)UMPersonaMachPort;
    v11 = -[UMPersonaMachPort initWithMachPort:options:](&v15, "initWithMachPort:options:", v10, 0);
    if (!v11)
      mach_port_deallocate(mach_task_self_, v10);
  }
  else
  {

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, 4864, 0));
    objc_msgSend(v5, "failWithError:", v12);

    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  if (-[UMPersonaMachPort machPort](self, "machPort")
    && -[UMPersonaMachPort machPort](self, "machPort") != -1
    && (v5 = objc_opt_class(NSXPCCoder), (objc_opt_isKindOfClass(v4, v5) & 1) != 0))
  {
    v6 = (void *)xpc_mach_send_create(-[UMPersonaMachPort machPort](self, "machPort"));
    if (v6)
      objc_msgSend(v4, "encodeXPCObject:forKey:", v6, CFSTR("UMPersonaMachPort"));

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UMPersonaMachPort;
    -[UMPersonaMachPort encodeWithCoder:](&v7, "encodeWithCoder:", v4);
  }

}

- (Class)classForCoder
{
  return (Class)objc_opt_class(UMPersonaMachPort);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
