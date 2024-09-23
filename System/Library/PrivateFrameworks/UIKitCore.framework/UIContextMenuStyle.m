@implementation UIContextMenuStyle

void __50___UIContextMenuStyle_setPreferredAttachmentEdge___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  _UIMainBundleIdentifier();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(&unk_1E1A92960, "containsObject:", v2);

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("_UIContextMenuStyle.m"), 86, CFSTR("This SPI may only be used by approved processes!"));

  }
}

@end
