@implementation PFUserCopyRules

void __PFUserCopyRules_S_block_invoke(uint64_t a1)
{
  void *v2;
  xpc_object_t value;
  void *v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = PFManagerCheckUserExists(*(const void **)(a1 + 48));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    PFManagerInfoLog();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = PFManagerSendMessage(0, *(const char **)(*(_QWORD *)(a1 + 48) + 24), *(const char **)(*(_QWORD *)(a1 + 48) + 32), 0x3EDu, 0xFFFFFFFFuLL, 0);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      v2 = (void *)PFXPCGetResponse();
      value = xpc_dictionary_get_value(v2, (const char *)pfXPCKeyRuleArray);
      if (value)
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
