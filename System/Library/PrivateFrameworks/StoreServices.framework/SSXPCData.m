@implementation SSXPCData

- (unint64_t)length
{
  return xpc_data_get_length(self->_xpcData);
}

- (SSXPCData)initWithXPCData:(id)a3
{
  SSXPCData *v4;
  objc_super v6;

  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SSXPCData;
    v4 = -[SSXPCData init](&v6, sel_init);
    if (v4)
      v4->_xpcData = (OS_xpc_object *)xpc_retain(a3);
  }
  else
  {

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("xpcData must be non-nil"));
    return 0;
  }
  return v4;
}

- (void)dealloc
{
  OS_xpc_object *xpcData;
  objc_super v4;

  xpcData = self->_xpcData;
  if (xpcData)
    xpc_release(xpcData);
  v4.receiver = self;
  v4.super_class = (Class)SSXPCData;
  -[SSXPCData dealloc](&v4, sel_dealloc);
}

- (const)bytes
{
  return xpc_data_get_bytes_ptr(self->_xpcData);
}

- (OS_xpc_object)xpcData
{
  return self->_xpcData;
}

@end
