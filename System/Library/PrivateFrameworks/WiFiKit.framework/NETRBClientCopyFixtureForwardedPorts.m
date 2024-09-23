@implementation NETRBClientCopyFixtureForwardedPorts

void ___NETRBClientCopyFixtureForwardedPorts_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;
  __int128 v7;

  if (__NETRBClientValidateClient(*(_BYTE **)(a1 + 64))
    || (v2 = xpc_dictionary_create(0, 0, 0)) == 0)
  {
    NETRBErrorLog();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    v3 = v2;
    xpc_dictionary_set_uint64(v2, netrbXPCKey, 0x3EDuLL);
    xpc_dictionary_set_string(v3, netrbXPCClientID, (const char *)(*(_QWORD *)(a1 + 64) + 32));
    NETRBInfoLog();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 0x40000000;
    v5[2] = ___NETRBClientCopyFixtureForwardedPorts_block_invoke_2;
    v5[3] = &unk_24DC36460;
    v4 = *(_OWORD *)(a1 + 56);
    v6 = *(_OWORD *)(a1 + 40);
    v7 = v4;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = NETRBXPCSetupAndSend(0, v3, (uint64_t)v5);
    xpc_release(v3);
  }
}

uint64_t ___NETRBClientCopyFixtureForwardedPorts_block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = NETRBInfoLog();
  if (a2)
  {
    result = xpc_dictionary_get_uint64(a2, netrbXPCResponse);
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) == 2001)
    {
      *(_WORD *)(*(_QWORD *)(a1[5] + 8) + 24) = xpc_dictionary_get_uint64(a2, netrbXPCForwardedLowPort);
      result = xpc_dictionary_get_uint64(a2, netrbXPCForwardedHighPort);
      *(_WORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
    }
  }
  return result;
}

@end
