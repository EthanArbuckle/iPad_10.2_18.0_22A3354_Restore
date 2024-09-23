@implementation NETRBClientAddHostExt

void ___NETRBClientAddHostExt_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  _QWORD v4[4];
  __int128 v5;

  if (__NETRBClientValidateClient(*(_BYTE **)(a1 + 48))
    || (v2 = xpc_dictionary_create(0, 0, 0)) == 0)
  {
    NETRBErrorLog();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    v3 = v2;
    xpc_dictionary_set_uint64(v2, netrbXPCKey, 0x3F0uLL);
    xpc_dictionary_set_string(v3, netrbXPCClientID, (const char *)(*(_QWORD *)(a1 + 48) + 32));
    xpc_dictionary_set_uint64(v3, netrbXPCHostType, *(unsigned int *)(a1 + 64));
    xpc_dictionary_set_uint64(v3, netrbXPCDeviceID, *(_QWORD *)(a1 + 56));
    NETRBInfoLog();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 0x40000000;
    v4[2] = ___NETRBClientAddHostExt_block_invoke_2;
    v4[3] = &unk_24DC36550;
    v5 = *(_OWORD *)(a1 + 40);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = NETRBXPCSetupAndSend(0, v3, (uint64_t)v4);
    xpc_release(v3);
  }
}

uint64_t ___NETRBClientAddHostExt_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = NETRBInfoLog();
  if (a2)
  {
    result = xpc_dictionary_get_uint64(a2, netrbXPCResponse);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

@end
