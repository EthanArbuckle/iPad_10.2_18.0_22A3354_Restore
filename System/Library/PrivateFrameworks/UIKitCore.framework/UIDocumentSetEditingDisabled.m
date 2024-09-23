@implementation UIDocumentSetEditingDisabled

uint64_t ___UIDocumentSetEditingDisabled_block_invoke(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v3, "disableEditing");
  else
    objc_msgSend(v3, "enableEditing");
  return objc_msgSend(*(id *)(a1 + 32), "_sendStateChangedNotification");
}

@end
