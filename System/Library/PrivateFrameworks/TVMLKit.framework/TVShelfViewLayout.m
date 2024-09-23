@implementation TVShelfViewLayout

void __50___TVShelfViewLayout_invalidateLayoutWithContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "section") == a3
    && *(_BYTE *)(a1 + 56)
    && objc_msgSend(*(id *)(a1 + 40), "_bumpHeaderForLayoutSection:forIndexPath:", v8, *(_QWORD *)(a1 + 32)))
  {
    goto LABEL_6;
  }
  objc_msgSend(v8, "sectionHeaderVerticalBump");
  if (v5 != 0.0)
  {
    objc_msgSend(v8, "setSectionHeaderVerticalBump:", 0.0);
LABEL_6:
    v6 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

@end
