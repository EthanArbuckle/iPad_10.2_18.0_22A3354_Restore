@implementation NETRBClientSetFixtureForwardedPorts

void ___NETRBClientSetFixtureForwardedPorts_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  const char *v4;
  uint64_t uint64;
  const char *v6;
  uint64_t v7;
  _QWORD v8[4];
  __int128 v9;

  if (__NETRBClientValidateClient(*(_BYTE **)(a1 + 48))
    || (v2 = xpc_dictionary_create(0, 0, 0)) == 0)
  {
    NETRBErrorLog();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    v3 = v2;
    xpc_dictionary_set_uint64(v2, netrbXPCKey, 0x3EEuLL);
    xpc_dictionary_set_string(v3, netrbXPCClientID, (const char *)(*(_QWORD *)(a1 + 48) + 32));
    v4 = netrbXPCForwardedLowPort;
    uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), netrbClientForwardedLowPort);
    xpc_dictionary_set_uint64(v3, v4, uint64);
    v6 = netrbXPCForwardedHighPort;
    v7 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), netrbClientForwardedHighPort);
    xpc_dictionary_set_uint64(v3, v6, v7);
    NETRBInfoLog();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 0x40000000;
    v8[2] = ___NETRBClientSetFixtureForwardedPorts_block_invoke_2;
    v8[3] = &unk_24DC364B0;
    v9 = *(_OWORD *)(a1 + 40);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = NETRBXPCSetupAndSend(0, v3, (uint64_t)v8);
    xpc_release(v3);
  }
}

uint64_t ___NETRBClientSetFixtureForwardedPorts_block_invoke_2(uint64_t a1, void *a2)
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
