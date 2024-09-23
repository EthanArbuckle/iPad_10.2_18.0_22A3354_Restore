@implementation PFUserDeleteRule

void __PFUserDeleteRule_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = PFManagerCheckUserExists(*(const void **)(a1 + 48));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    PFManagerErrorLog();
    return;
  }
  PFManagerInfoLog();
  v3 = *(_QWORD *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 56);
  v4 = *(const char **)(v3 + 24);
  v5 = *(const char **)(v3 + 32);
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 0x40000000;
    v10[2] = __PFUserDeleteRule_block_invoke_2;
    v10[3] = &unk_24D7939D0;
    v10[4] = v6;
    v10[5] = v3;
    v7 = v10;
  }
  else
  {
    v7 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = PFManagerSendMessage(0, v4, v5, 0x3EAu, v2, (uint64_t)v7);
  v8 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
    goto LABEL_10;
  if (*(_BYTE *)(*(_QWORD *)(v8 + 8) + 24))
  {
    v9 = (void *)PFXPCGetResponse();
    xpc_release(v9);
    if (*(_QWORD *)(a1 + 32))
    {
      v8 = *(_QWORD *)(a1 + 40);
LABEL_10:
      if (*(_BYTE *)(*(_QWORD *)(v8 + 8) + 24))
        CFRetain(*(CFTypeRef *)(a1 + 48));
    }
  }
}

void __PFUserDeleteRule_block_invoke_2(uint64_t a1, char a2)
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
  block[2] = ____PFUserXPCDeleteRuleResponseHandler_block_invoke;
  block[3] = &unk_24D793C90;
  block[4] = v4;
  v7 = a2;
  dispatch_async(v5, block);
  CFRelease(v3);
}

@end
