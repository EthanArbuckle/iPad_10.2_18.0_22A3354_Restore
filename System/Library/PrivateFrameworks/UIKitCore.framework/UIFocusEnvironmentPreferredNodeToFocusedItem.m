@implementation UIFocusEnvironmentPreferredNodeToFocusedItem

void ___UIFocusEnvironmentPreferredNodeToFocusedItem_block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  int v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  if (*(id *)(a1 + 32) == v5)
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  }
  else
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v5);
    v7 = v5;
    if (!v6)
      goto LABEL_6;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = v7;
  v10 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v9;

  *a3 = 1;
LABEL_6:
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v5;

}

@end
