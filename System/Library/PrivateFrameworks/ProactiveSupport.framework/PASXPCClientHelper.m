@implementation PASXPCClientHelper

void __50___PASXPCClientHelper__locked_establishConnection__block_invoke_3(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[16];
    if (v3 && os_log_type_enabled(WeakRetained[16], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v2[10];
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A0957000, v3, OS_LOG_TYPE_DEFAULT, "Connection to %@ invalidated.", (uint8_t *)&v6, 0xCu);
    }
    ((void (*)(void))v2[15][2].isa)();
    pthread_mutex_lock((pthread_mutex_t *)(v2 + 1));
    v5 = v2[9];
    v2[9] = 0;

    pthread_mutex_unlock((pthread_mutex_t *)(v2 + 1));
  }

}

void __50___PASXPCClientHelper__locked_establishConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *((_QWORD *)WeakRetained + 16);
    if (v3 && os_log_type_enabled(*((os_log_t *)WeakRetained + 16), OS_LOG_TYPE_ERROR))
    {
      v4 = v2[10];
      v5 = 138412290;
      v6 = v4;
      _os_log_error_impl(&dword_1A0957000, v3, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v5, 0xCu);
    }
    (*(void (**)(void))(v2[14] + 16))();
  }

}

@end
