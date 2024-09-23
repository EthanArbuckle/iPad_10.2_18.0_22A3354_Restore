@implementation NETRBXPCCreate

void __NETRBXPCCreate_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v3;
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = __NETRBXPCCreate_block_invoke_2;
  v4[3] = &__block_descriptor_tmp_65;
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = object;
  v4[5] = v3;
  xpc_retain(object);
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), v4);
}

void __NETRBXPCCreate_block_invoke_2(uint64_t a1)
{
  if (MEMORY[0x220738B88](*(_QWORD *)(a1 + 32)) == MEMORY[0x24BDACFB8])
  {
    if (*(_QWORD *)(a1 + 40) == __netrbConnection)
    {
      xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), (const char *)*MEMORY[0x24BDACF40]);
      NETRBErrorLog();
      NETRBXPCCleanup();
    }
  }
  else
  {
    NETRBErrorLog();
  }
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

@end
