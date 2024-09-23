@implementation UIEditMenuAppendMenuToSnapshot

void ___UIEditMenuAppendMenuToSnapshot_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "_isVisible"))
  {
    if (objc_msgSend(v3, "_isInlineGroup"))
    {
      _UIEditMenuAppendMenuToSnapshot(v3, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
    }
    else
    {
      +[_UIEditMenuListItem itemWithMenuElement:](_UIEditMenuListItem, "itemWithMenuElement:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setWantsPasteSlotView:", *(unsigned __int8 *)(a1 + 40));
      v5 = *(void **)(a1 + 32);
      v7[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendItemsWithIdentifiers:", v6);

    }
  }

}

@end
