@implementation PFUserGetRules

CFTypeRef __PFUserGetRules_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const char *v3;
  const char *v4;
  CFTypeRef result;
  _QWORD v6[6];

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = PFManagerCheckUserExists(*(const void **)(a1 + 48));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    return (CFTypeRef)PFManagerErrorLog();
  PFManagerInfoLog();
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(const char **)(v2 + 24);
  v4 = *(const char **)(v2 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 0x40000000;
  v6[2] = __PFUserGetRules_block_invoke_2;
  v6[3] = &unk_24D793A20;
  v6[4] = *(_QWORD *)(a1 + 32);
  v6[5] = v2;
  result = (CFTypeRef)PFManagerSendMessage(0, v3, v4, 0x3EDu, 0xFFFFFFFFuLL, (uint64_t)v6);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    return CFRetain(*(CFTypeRef *)(a1 + 48));
  return result;
}

void __PFUserGetRules_block_invoke_2(uint64_t a1, char a2, void *a3)
{
  _QWORD *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[6];
  char v9;

  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD **)(a1 + 40);
  PFManagerInfoLog();
  if (a3)
    xpc_retain(a3);
  v7 = v5[5];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ____PFUserXPCGetRulesResponseHandler_block_invoke;
  block[3] = &unk_24D793CB8;
  v9 = a2;
  block[4] = v6;
  block[5] = a3;
  dispatch_async(v7, block);
  CFRelease(v5);
}

@end
