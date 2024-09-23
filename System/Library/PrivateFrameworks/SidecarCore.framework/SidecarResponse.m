@implementation SidecarResponse

- (void)accept
{
  BOOL *p_accepted;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  p_accepted = &self->_accepted;
  do
    v4 = __ldaxr((unsigned __int8 *)p_accepted);
  while (__stlxr(1u, (unsigned __int8 *)p_accepted));
  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 5);
    SidecarMessageSetType(v5, 2);
    -[SidecarRequest uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = 0;
    v7[1] = 0;
    objc_msgSend(v6, "getUUIDBytes:", v7);
    SidecarMessageSetRequestID(v5, bswap32(v7[0]));

    -[SidecarRequest _sendMessage:](self, "_sendMessage:", v5);
  }
}

- (void)sendItems:(id)a3
{
  -[SidecarRequest sendItems:complete:](self, "sendItems:complete:", a3, 1);
}

@end
