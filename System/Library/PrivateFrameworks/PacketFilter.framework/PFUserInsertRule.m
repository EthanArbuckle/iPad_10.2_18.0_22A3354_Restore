@implementation PFUserInsertRule

CFTypeRef __PFUserInsertRule_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  CFTypeRef result;
  _QWORD v8[6];

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = PFManagerCheckUserExists(*(const void **)(a1 + 48));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    return (CFTypeRef)PFManagerErrorLog();
  PFManagerInfoLog();
  v3 = *(_QWORD *)(a1 + 48);
  v2 = *(void **)(a1 + 56);
  v4 = *(const char **)(v3 + 24);
  v5 = *(const char **)(v3 + 32);
  v6 = *(unsigned __int16 *)(a1 + 64);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 0x40000000;
  v8[2] = __PFUserInsertRule_block_invoke_2;
  v8[3] = &unk_24D793958;
  v8[4] = *(_QWORD *)(a1 + 32);
  v8[5] = v3;
  result = (CFTypeRef)PFManagerSendMessage(v2, v4, v5, 0x3E9u, v6, (uint64_t)v8);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    return CFRetain(*(CFTypeRef *)(a1 + 48));
  return result;
}

void __PFUserInsertRule_block_invoke_2(uint64_t a1, char a2, void *a3)
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
  block[2] = ____PFUserXPCInsertRuleResponseHandler_block_invoke;
  block[3] = &unk_24D793C68;
  v9 = a2;
  block[4] = v6;
  block[5] = a3;
  dispatch_async(v7, block);
  CFRelease(v5);
}

void __PFUserInsertRule_S_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = PFManagerCheckUserExists(*(const void **)(a1 + 48));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    PFManagerInfoLog();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = PFManagerSendMessage(*(void **)(a1 + 56), *(const char **)(*(_QWORD *)(a1 + 48) + 24), *(const char **)(*(_QWORD *)(a1 + 48) + 32), 0x3E9u, *(unsigned __int16 *)(a1 + 64), 0);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      v2 = (void *)PFXPCGetResponse();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_uint64(v2, (const char *)pfXPCKeyInsertID);
      v3 = (void *)PFXPCGetResponse();
      xpc_release(v3);
    }
  }
  else
  {
    PFManagerErrorLog();
  }
}

@end
