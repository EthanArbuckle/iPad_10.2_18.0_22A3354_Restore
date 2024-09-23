@implementation UISceneMaskingHostComponent

void __53___UISceneMaskingHostComponent__handleMaskingAction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "canSendResponse"))
  {
    objc_msgSend(MEMORY[0x1E0D016A8], "responseForError:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sendResponse:", v3);

  }
}

@end
