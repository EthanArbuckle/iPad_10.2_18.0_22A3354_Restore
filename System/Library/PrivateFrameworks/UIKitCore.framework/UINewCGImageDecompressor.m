@implementation UINewCGImageDecompressor

void __45___UINewCGImageDecompressor_decompressAsync___block_invoke(uint64_t a1)
{
  uint64_t v2;
  char v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(v2 + 44);
  v4 = *(void **)(v2 + 16);
  if ((v3 & 4) != 0)
    v5 = 0;
  else
    v5 = v4;
  if ((v3 & 4) == 0)
    v4 = 0;
  v6 = v4;
  UIDecompressorLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134218498;
    v10 = v5;
    v11 = 2112;
    v12 = v8;
    v13 = 2048;
    v14 = objc_msgSend(v6, "code");
    _os_log_debug_impl(&dword_185066000, v7, OS_LOG_TYPE_DEBUG, "Deferred async reply with image=%p error.domain=%@ error.code=%ld", (uint8_t *)&v9, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __45___UINewCGImageDecompressor_decompressAsync___block_invoke_18(uint64_t a1)
{
  NSObject *v2;
  int v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  UIDecompressorLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_DWORD *)(a1 + 48);
    v5[0] = 67109120;
    v5[1] = v4;
    _os_log_debug_impl(&dword_185066000, v2, OS_LOG_TYPE_DEBUG, "Replying to failed async with error=(OSStatus) %d", (uint8_t *)v5, 8u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __45___UINewCGImageDecompressor_decompressAsync___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  UIDecompressorLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = *(_DWORD *)(a1 + 56);
    v5 = 134218240;
    v6 = v3;
    v7 = 1024;
    v8 = v4;
    _os_log_debug_impl(&dword_185066000, v2, OS_LOG_TYPE_DEBUG, "Async reply with image=%p error=(OSStatus) %d", (uint8_t *)&v5, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  CGImageRelease(*(CGImageRef *)(a1 + 48));
}

void __56___UINewCGImageDecompressor__sharedDecompressionSession__block_invoke()
{
  int v0;
  int v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = CMPhotoDecompressionSessionCreate();
  if (v0)
  {
    v1 = v0;
    UIDecompressorLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      v3 = 134349056;
      v4 = v1;
      _os_log_fault_impl(&dword_185066000, v2, OS_LOG_TYPE_FAULT, "Could not create decompression session (%{public}ld)", (uint8_t *)&v3, 0xCu);
    }

  }
}

void __45___UINewCGImageDecompressor_decompressAsync___block_invoke_15(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, CGImage *a6)
{
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  CGImage *v16;
  int v17;

  if (a6)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], a4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "_finishDecompressingWithImage:error:", a6, v9);
  CGImageRetain(a6);
  v10 = *(void **)(a1 + 40);
  v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __45___UINewCGImageDecompressor_decompressAsync___block_invoke_2;
  v13[3] = &unk_1E16CC878;
  v16 = a6;
  v17 = a4;
  v14 = v9;
  v15 = v10;
  v12 = v9;
  dispatch_async(v11, v13);

}

intptr_t __44___UINewCGImageDecompressor_waitForImageRef__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  UIDecompressorLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_185066000, v2, OS_LOG_TYPE_DEBUG, "Async decode finished; unblocking semaphore", v4, 2u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 32));
}

@end
