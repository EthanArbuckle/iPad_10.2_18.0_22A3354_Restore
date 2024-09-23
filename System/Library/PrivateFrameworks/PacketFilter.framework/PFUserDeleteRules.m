@implementation PFUserDeleteRules

void __PFUserDeleteRules_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const char *v3;
  const char *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = PFManagerCheckUserExists(*(const void **)(a1 + 48));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    PFManagerErrorLog();
    return;
  }
  PFManagerInfoLog();
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(const char **)(v2 + 24);
  v4 = *(const char **)(v2 + 32);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 0x40000000;
    v9[2] = __PFUserDeleteRules_block_invoke_2;
    v9[3] = &unk_24D7938E0;
    v9[4] = v5;
    v9[5] = v2;
    v6 = v9;
  }
  else
  {
    v6 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = PFManagerSendMessage(0, v3, v4, 0x3ECu, 0xFFFFFFFFuLL, (uint64_t)v6);
  v7 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
    goto LABEL_10;
  if (*(_BYTE *)(*(_QWORD *)(v7 + 8) + 24))
  {
    v8 = (void *)PFXPCGetResponse();
    xpc_release(v8);
    if (*(_QWORD *)(a1 + 32))
    {
      v7 = *(_QWORD *)(a1 + 40);
LABEL_10:
      if (*(_BYTE *)(*(_QWORD *)(v7 + 8) + 24))
        CFRetain(*(CFTypeRef *)(a1 + 48));
    }
  }
}

void __PFUserDeleteRules_block_invoke_2(uint64_t a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];
  char v7;

  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD **)(a1 + 40);
  PFManagerInfoLog();
  v5 = v3[5];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ____PFUserXPCDeleteRulesResponseHandler_block_invoke;
  block[3] = &unk_24D793C40;
  block[4] = v4;
  v7 = a2;
  dispatch_async(v5, block);
  CFRelease(v3);
}

@end
