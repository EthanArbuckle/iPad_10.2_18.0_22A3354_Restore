@implementation SPGenerateSpindump

void __SPGenerateSpindump_block_invoke(uint64_t a1, void *a2)
{
  void (*v4)(void);

  if (MEMORY[0x20BD32A44](a2) != MEMORY[0x24BDACFB8] && MEMORY[0x20BD32A44](a2) == MEMORY[0x24BDACFA0])
  {
    xpc_dictionary_get_int64(a2, "errno");
    xpc_dictionary_get_string(a2, "path");
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v4();
  _Block_release(*(const void **)(a1 + 32));
}

uint64_t __SPGenerateSpindump_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), 0);
}

@end
