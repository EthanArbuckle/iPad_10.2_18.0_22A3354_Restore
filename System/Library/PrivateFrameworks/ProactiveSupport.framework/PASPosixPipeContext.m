@implementation PASPosixPipeContext

void __45___PASPosixPipeContext_startReadWithHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  BOOL v8;
  NSObject *data;

  data = a3;
  v5 = (void *)MEMORY[0x1A1AFDC98]();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(unsigned __int8 *)(v6 + 32);
  if (data && !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32))
  {
    if (dispatch_data_get_size(data))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(unsigned __int8 *)(v6 + 32);
    }
    else
    {
      v7 = 0;
    }
  }
  if (v7)
    v8 = 0;
  else
    v8 = a2 == 0;
  if (!v8)
    dispatch_io_close(*(dispatch_io_t *)(v6 + 16), 0);
  objc_autoreleasePoolPop(v5);

}

void __80___PASPosixPipeContext_setupWithSubprocessFd_fileActions_queue_group_readErrno___block_invoke(uint64_t a1, int a2)
{
  _DWORD *v4;

  close(*(_DWORD *)(a1 + 48));
  v4 = *(_DWORD **)(a1 + 40);
  if (!*v4)
    *v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end
