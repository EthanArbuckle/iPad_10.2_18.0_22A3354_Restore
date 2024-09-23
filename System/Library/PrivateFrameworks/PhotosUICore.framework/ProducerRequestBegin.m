@implementation ProducerRequestBegin

void ___ProducerRequestBegin_block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if ((a2 & 1) == 0 && WeakRetained)
  {
    PLStoryGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 136446722;
      v9 = v7;
      v10 = 2048;
      v11 = 0x4024000000000000;
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Invalid story component attributes change (%@ -> %@)", (uint8_t *)&v8, 0x20u);
    }

  }
}

@end
