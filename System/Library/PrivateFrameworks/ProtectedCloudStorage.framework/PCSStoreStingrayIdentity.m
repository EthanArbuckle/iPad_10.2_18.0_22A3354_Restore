@implementation PCSStoreStingrayIdentity

intptr_t ____PCSStoreStingrayIdentity_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    PCSLogGetOSLog(*(_QWORD *)(a1 + 56));
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = a2;
      _os_log_impl(&dword_1A9508000, v4, OS_LOG_TYPE_DEFAULT, "PCSStoreStingrayIdentity: %@", (uint8_t *)&v6, 0xCu);
    }

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    CFRetain(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
