@implementation PFFindStatesByDescriptor

void __PFFindStatesByDescriptor_block_invoke(uint64_t a1)
{
  CFTypeRef v2;
  const void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[6];

  v2 = PFManagerCreate();
  if (v2)
  {
    v3 = v2;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 0x40000000;
    v6[2] = __PFFindStatesByDescriptor_block_invoke_2;
    v6[3] = &unk_24D793BA8;
    v4 = *(void **)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v6[4] = *(_QWORD *)(a1 + 32);
    v6[5] = v5;
    PFManagerSendMessage(v4, 0, 0, 0xBB8u, 0, (uint64_t)v6);
    PFManagerRelease(v3);
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

void __PFFindStatesByDescriptor_block_invoke_2(uint64_t a1, char a2, xpc_object_t object)
{
  NSObject *v6;
  _QWORD block[6];
  char v8;

  if (object)
    xpc_retain(object);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __PFFindStatesByDescriptor_block_invoke_3;
  block[3] = &unk_24D793B80;
  v8 = a2;
  v6 = *(NSObject **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = object;
  dispatch_async(v6, block);
}

uint64_t __PFFindStatesByDescriptor_block_invoke_3(uint64_t a1)
{
  void *v2;
  const _xpc_type_s *v3;
  xpc_object_t value;
  void *v5;

  v2 = *(void **)(a1 + 40);
  if (MEMORY[0x219A0CD04](v2) == MEMORY[0x24BDACFA0])
  {
    value = xpc_dictionary_get_value(v2, (const char *)pfXPCResponseArray);
    if (value)
    {
      v5 = value;
      if (MEMORY[0x219A0CD04]() == MEMORY[0x24BDACF78])
      {
        xpc_retain(v5);
        goto LABEL_6;
      }
    }
  }
  else
  {
    v3 = (const _xpc_type_s *)MEMORY[0x219A0CD04](v2);
    xpc_type_get_name(v3);
  }
  PFManagerErrorLog();
LABEL_6:
  xpc_release(*(xpc_object_t *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
