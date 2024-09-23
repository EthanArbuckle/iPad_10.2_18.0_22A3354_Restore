@implementation ShouldShowWeibo

void __ShouldShowWeibo_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CEA6F8], "sharedInputModeController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enabledInputModeIdentifiers");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
