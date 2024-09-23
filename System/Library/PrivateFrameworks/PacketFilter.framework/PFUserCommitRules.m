@implementation PFUserCommitRules

uint64_t __PFUserCommitRules_block_invoke(uint64_t a1)
{
  void *TransArray;
  void *v3;
  uint64_t v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t result;
  void *v10;
  _QWORD v11[6];

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = PFManagerCheckUserExists(*(const void **)(a1 + 48));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    return PFManagerErrorLog();
  TransArray = (void *)__PFUserGetTransArray(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  if (TransArray)
  {
    v3 = TransArray;
    PFManagerInfoLog();
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(const char **)(v4 + 24);
    v6 = *(const char **)(v4 + 32);
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 0x40000000;
      v11[2] = __PFUserCommitRules_block_invoke_2;
      v11[3] = &unk_24D793868;
      v11[4] = v7;
      v11[5] = v4;
      v8 = v11;
    }
    else
    {
      v8 = 0;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = PFManagerSendMessage(v3, v5, v6, 0x3EBu, 0xFFFFFFFFuLL, (uint64_t)v8);
    if (!*(_QWORD *)(a1 + 32) && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      v10 = (void *)PFXPCGetResponse();
      xpc_release(v10);
    }
    result = __PFUserRemoveTransArray(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    if (*(_QWORD *)(a1 + 32))
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        return (uint64_t)CFRetain(*(CFTypeRef *)(a1 + 48));
    }
  }
  else
  {
    result = PFManagerErrorLog();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

void __PFUserCommitRules_block_invoke_2(uint64_t a1, char a2)
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
  block[2] = ____PFUserXPCCommitRulesResponseHandler_block_invoke;
  block[3] = &unk_24D793C18;
  block[4] = v4;
  v7 = a2;
  dispatch_async(v5, block);
  CFRelease(v3);
}

@end
