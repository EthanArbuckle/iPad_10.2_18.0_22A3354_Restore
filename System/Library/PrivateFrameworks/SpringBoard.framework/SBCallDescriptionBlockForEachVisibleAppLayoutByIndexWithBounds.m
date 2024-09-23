@implementation SBCallDescriptionBlockForEachVisibleAppLayoutByIndexWithBounds

void ___SBCallDescriptionBlockForEachVisibleAppLayoutByIndexWithBounds_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  CGRect v19;
  uint64_t v20;

  v5 = a2;
  v20 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5))
  {
    objc_msgSend(*(id *)(a1 + 40), "frameForIndex:", a3);
    v19.origin.x = v6;
    v19.origin.y = v7;
    v19.size.width = v8;
    v19.size.height = v9;
    objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", *(_QWORD *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTarget:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v10, "setSelector:", *(_QWORD *)(a1 + 72));
    objc_msgSend(v10, "setArgument:atIndex:", &v20, 2);
    objc_msgSend(v10, "setArgument:atIndex:", &v19, 3);
    objc_msgSend(v10, "invoke");
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sb_switcherModifierDebugTimelineDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = *(void **)(a1 + 56);
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = v20;
    objc_msgSend(v5, "succinctDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromCGRect(v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%lu %@, bounds: %@ --> %@"), v15, v16, v17, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v18);

  }
}

@end
