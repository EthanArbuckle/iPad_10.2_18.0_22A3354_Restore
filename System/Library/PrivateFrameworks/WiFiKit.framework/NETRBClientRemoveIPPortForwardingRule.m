@implementation NETRBClientRemoveIPPortForwardingRule

void ___NETRBClientRemoveIPPortForwardingRule_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  xpc_object_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[6];

  if (__NETRBClientValidateClient(*(_BYTE **)(a1 + 48)))
  {
    NETRBErrorLog();
  }
  else
  {
    v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v2, netrbXPCClientID, (const char *)(*(_QWORD *)(a1 + 48) + 32));
    xpc_dictionary_set_uint64(v2, netrbXPCKey, 0x3F8uLL);
    v3 = *(unsigned __int8 *)(a1 + 67);
    if ((_DWORD)v3 == 30 || (_DWORD)v3 == 2)
    {
      v5 = *(unsigned __int8 *)(a1 + 66);
      v6 = *(unsigned __int16 *)(a1 + 64);
      v7 = xpc_dictionary_create(0, 0, 0);
      v8 = v7;
      if ((_DWORD)v5)
        xpc_dictionary_set_uint64(v7, netrbXPCPortForwardingRuleProtocol, v5);
      if ((_DWORD)v6)
        xpc_dictionary_set_uint64(v8, netrbXPCPortForwardingRuleExternalPort, v6);
      xpc_dictionary_set_uint64(v8, netrbXPCPortForwardingRuleAddressFamily, v3);
    }
    else
    {
      v8 = 0;
    }
    xpc_dictionary_set_value(v2, netrbXPCPortForwardingRule, v8);
    xpc_release(v8);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 0x40000000;
    v10[2] = ___NETRBClientRemoveIPPortForwardingRule_block_invoke_2;
    v10[3] = &unk_24DC36778;
    v9 = *(_QWORD *)(a1 + 48);
    v10[4] = *(_QWORD *)(a1 + 32);
    v10[5] = v9;
    NETRBInfoLog();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = NETRBXPCSetupAndSend(*(NSObject **)(a1 + 56), v2, (uint64_t)v10);
    xpc_release(v2);
  }
}

void ___NETRBClientRemoveIPPortForwardingRule_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *global_queue;
  _QWORD v6[5];
  char v7;

  CFRelease(*(CFTypeRef *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    if (a2)
    {
      LOBYTE(a2) = xpc_dictionary_get_uint64(a2, netrbXPCResponse) == 2001;
      v4 = *(_QWORD *)(a1 + 32);
    }
    global_queue = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 0x40000000;
    v6[2] = ___NETRBClientRemoveIPPortForwardingRule_block_invoke_3;
    v6[3] = &unk_24DC36750;
    v6[4] = v4;
    v7 = (char)a2;
    dispatch_async(global_queue, v6);
  }
}

uint64_t ___NETRBClientRemoveIPPortForwardingRule_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

@end
