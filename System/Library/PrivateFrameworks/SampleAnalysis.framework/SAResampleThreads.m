@implementation SAResampleThreads

void __SAResampleThreads_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unsigned __int8 *v5;
  unsigned __int8 v6;
  int v7;
  NSObject *v8;
  ipc_space_t *v9;
  uint8_t v10[16];

  objc_msgSend(*(id *)(a1 + 32), "sampleThread:", *(unsigned int *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  do
    v6 = __ldxr(v5);
  while (__stxr(1u, v5));
  if ((v6 & 1) != 0)
  {
    v7 = *__error();
    _sa_logt();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1B9BE0000, v8, OS_LOG_TYPE_INFO, "Sampler completed after timeout", v10, 2u);
    }

    *__error() = v7;
    v9 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(_DWORD *)(a1 + 56));
    mach_port_deallocate(*v9, *(_DWORD *)(a1 + 60));
  }
}

@end
