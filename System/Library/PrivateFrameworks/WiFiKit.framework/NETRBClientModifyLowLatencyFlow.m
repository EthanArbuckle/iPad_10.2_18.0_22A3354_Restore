@implementation NETRBClientModifyLowLatencyFlow

uint64_t ___NETRBClientModifyLowLatencyFlow_block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  __int128 v6;

  if (__NETRBClientValidateClient(*(_BYTE **)(a1 + 40)))
  {
    result = NETRBErrorLog();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  else
  {
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 48), netrbXPCClientID, (const char *)(*(_QWORD *)(a1 + 40) + 32));
    if (*(_BYTE *)(a1 + 56))
      v3 = 1019;
    else
      v3 = 1018;
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 48), netrbXPCKey, v3);
    NETRBInfoLog();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    v4 = *(void **)(a1 + 48);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 0x40000000;
    v5[2] = ___NETRBClientModifyLowLatencyFlow_block_invoke_2;
    v5[3] = &unk_24DC369F0;
    v6 = *(_OWORD *)(a1 + 32);
    return NETRBXPCSetupAndSend(0, v4, (uint64_t)v5);
  }
  return result;
}

uint64_t ___NETRBClientModifyLowLatencyFlow_block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t value;
  void *v6;

  if (a2
    && MEMORY[0x220738B88](a2) == MEMORY[0x24BDACFA0]
    && (value = xpc_dictionary_get_value(a2, netrbXPCResponse)) != 0
    && (v6 = value, MEMORY[0x220738B88]() == MEMORY[0x24BDACFF8]))
  {
    if (xpc_uint64_get_value(v6) == 2001)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    NETRBErrorLog();
  }
  return NETRBInfoLog();
}

@end
