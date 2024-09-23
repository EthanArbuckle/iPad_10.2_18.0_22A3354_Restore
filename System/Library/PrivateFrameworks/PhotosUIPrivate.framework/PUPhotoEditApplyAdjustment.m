@implementation PUPhotoEditApplyAdjustment

uint64_t __PUPhotoEditApplyAdjustment_block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", CFSTR("auto")))
    return objc_msgSend(*(id *)(a1 + 40), "ppt_applyAutoenhance:", *(_QWORD *)(a1 + 64));
  if (objc_msgSend(&unk_1E59B9D00, "containsObject:", *(_QWORD *)(a1 + 32)))
    return objc_msgSend(*(id *)(a1 + 40), "ppt_scrollSliderNamed:value:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  v3 = *(NSObject **)(a1 + 56);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEFAULT, "PUPhotoEditApplyAdjustment: Unknown Adjustment Type: %@", (uint8_t *)&v5, 0xCu);
  }
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
