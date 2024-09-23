@implementation PFUserNATLook

CFTypeRef __PFUserNATLook_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  const char *v5;
  CFTypeRef result;
  _QWORD v7[6];

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = PFManagerCheckUserExists(*(const void **)(a1 + 40));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    return (CFTypeRef)PFManagerErrorLog();
  PFManagerInfoLog();
  v3 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(a1 + 48);
  v4 = *(const char **)(v3 + 24);
  v5 = *(const char **)(v3 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 0x40000000;
  v7[2] = __PFUserNATLook_block_invoke_2;
  v7[3] = &__block_descriptor_tmp_52;
  v7[4] = *(_QWORD *)(a1 + 56);
  v7[5] = v3;
  result = (CFTypeRef)PFManagerSendMessage(v2, v4, v5, 0x3EEu, 0xFFFFFFFFuLL, (uint64_t)v7);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (_BYTE)result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    return CFRetain(*(CFTypeRef *)(a1 + 40));
  return result;
}

void __PFUserNATLook_block_invoke_2(uint64_t a1, char a2, void *a3)
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
  block[2] = ____PFUserXPCNatLookResponseHandler_block_invoke;
  block[3] = &unk_24D793D08;
  v9 = a2;
  block[4] = v6;
  block[5] = a3;
  dispatch_async(v7, block);
  CFRelease(v5);
}

void __PFUserNATLook_S_block_invoke(uint64_t a1)
{
  void *v2;
  xpc_object_t value;
  void *v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = PFManagerCheckUserExists(*(const void **)(a1 + 48));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    PFManagerInfoLog();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = PFManagerSendMessage(*(void **)(a1 + 56), *(const char **)(*(_QWORD *)(a1 + 48) + 24), *(const char **)(*(_QWORD *)(a1 + 48) + 32), 0x3EEu, 0xFFFFFFFFuLL, 0);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      v2 = (void *)PFXPCGetResponse();
      value = xpc_dictionary_get_value(v2, (const char *)pfXPCKeyRule);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_copy(value);
      v4 = (void *)PFXPCGetResponse();
      xpc_release(v4);
    }
  }
  else
  {
    PFManagerErrorLog();
  }
}

@end
