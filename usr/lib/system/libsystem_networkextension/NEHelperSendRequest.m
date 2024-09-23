@implementation NEHelperSendRequest

void __NEHelperSendRequest_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
}

void __NEHelperSendRequest_block_invoke_2(uint64_t a1, void *a2)
{
  void (*v4)(void);

  if (a2 && MEMORY[0x1A1ACD048](a2) == MEMORY[0x1E0C88FE8])
  {
    xpc_dictionary_get_int64(a2, "result-code");
    xpc_dictionary_get_value(a2, "result-data");
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v4();
  _Block_release(*(const void **)(a1 + 32));
}

@end
