@implementation SSDialogGetDaemonDialogState

uint64_t __SSDialogGetDaemonDialogState_block_invoke(uint64_t a1, void *a2)
{
  if (a2 && MEMORY[0x1A85863E4](a2) == MEMORY[0x1E0C812F8])
    xpc_dictionary_get_BOOL(a2, "0");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
