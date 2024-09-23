@implementation SFCreateThumbnailForAirDropItem

void __SFCreateThumbnailForAirDropItem_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A868]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __SFCreateThumbnailForAirDropItem_block_invoke_2;
  v5[3] = &unk_1E482EF90;
  v3 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = v2;
  v8 = *(_QWORD *)(a1 + 48);
  v4 = v2;
  objc_msgSend(v3, "getCGImageForImageDescriptor:completion:", v4, v5);

}

void __SFCreateThumbnailForAirDropItem_block_invoke_2(uint64_t a1, CGImage *a2)
{
  void (**v4)(_QWORD);
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD aBlock[4];
  id v13;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __SFCreateThumbnailForAirDropItem_block_invoke_3;
  aBlock[3] = &unk_1E482DF78;
  v13 = *(id *)(a1 + 32);
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (a2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = CGImageRetain(a2);
  }
  else
  {
    airdrop_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __SFCreateThumbnailForAirDropItem_block_invoke_2_cold_1(a1, v5, v6, v7, v8, v9, v10, v11);

  }
  v4[2](v4);

}

intptr_t __SFCreateThumbnailForAirDropItem_block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __SFCreateThumbnailForAirDropItem_block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_1A2830000, a2, a3, "Failed to get CGImage for image descriptor %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
