@implementation PFQueryGatewayAddrAndPortForDescriptor

void __PFQueryGatewayAddrAndPortForDescriptor_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  xpc_object_t v4;
  char v5;
  int v6;
  void *v7;
  _DWORD *data;
  uint64_t uint64;
  size_t length;

  v2 = a1[5];
  v3 = a1[6];
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_data(v4, (const char *)pfXPCLANAddress, (const void *)(v2 + 24), 4uLL);
  xpc_dictionary_set_uint64(v4, (const char *)pfXPCLANPort, *(unsigned __int16 *)(v2 + 44));
  v5 = *(_BYTE *)(v2 + 8);
  if ((v5 & 8) != 0)
  {
    xpc_dictionary_set_data(v4, (const char *)pfXPCEXTLANAddress, (const void *)(v2 + 40), 4uLL);
    v5 = *(_BYTE *)(v2 + 8);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)(v2 + 8) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  xpc_dictionary_set_uint64(v4, (const char *)pfXPCEXTLANPort, *(unsigned __int16 *)(v2 + 46));
  if ((*(_BYTE *)(v2 + 8) & 2) != 0)
LABEL_4:
    xpc_dictionary_set_uint64(v4, (const char *)pfXPCIPProto, *(unsigned __int8 *)(v2 + 10));
LABEL_5:
  PFManagerInfoLog();
  v6 = PFManagerSendMessage(v4, 0, 0, 0xBB9u, 0, 0);
  PFManagerDebugLog();
  if (!v6)
  {
    PFManagerNoticeLog();
    v7 = 0;
    if (!v4)
      goto LABEL_16;
    goto LABEL_15;
  }
  v7 = (void *)PFXPCGetResponse();
  length = 0;
  data = xpc_dictionary_get_data(v7, (const char *)pfXPCResponseV4GatewayAddress, &length);
  if (data)
  {
    if (length == 4)
    {
      *(_DWORD *)v3 = *data;
      uint64 = xpc_dictionary_get_uint64(v7, (const char *)pfXPCResponseGatewayPort);
      if (uint64)
      {
        *(_WORD *)(v3 + 4) = uint64;
        if (!v4)
          goto LABEL_16;
LABEL_15:
        xpc_release(v4);
        goto LABEL_16;
      }
    }
  }
  PFManagerErrorLog();
  if (v4)
    goto LABEL_15;
LABEL_16:
  if (v7)
    xpc_release(v7);
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = v6;
}

@end
