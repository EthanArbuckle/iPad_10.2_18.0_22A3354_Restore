@implementation UICollectionViewListCellCommonInit

IMP __UICollectionViewListCellCommonInit_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  objc_class *v17;
  IMP MethodImplementation;
  IMP result;
  __int16 v22;

  +[UICollectionViewListCell _createVisualProviderForCell:](UICollectionViewListCell, "_createVisualProviderForCell:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 656);
  *(_QWORD *)(v3 + 656) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_updateConstants");
  objc_msgSend(*(id *)(a1 + 32), "setEdgesPreservingSuperviewLayoutMargins:", 10);
  objc_msgSend(*(id *)(a1 + 32), "setEdgesInsettingLayoutMarginsFromSafeArea:", objc_msgSend(*(id *)(a1 + 32), "edgesInsettingLayoutMarginsFromSafeArea") & 0xA);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 768);
  v7 = MEMORY[0x1E0C9AA60];
  *(_QWORD *)(v5 + 768) = MEMORY[0x1E0C9AA60];

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 776);
  *(_QWORD *)(v8 + 776) = v7;

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 784);
  *(_QWORD *)(v10 + 784) = v7;

  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 792);
  *(_QWORD *)(v12 + 792) = v7;

  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 800);
  *(_QWORD *)(v14 + 800) = v7;

  objc_msgSend(*(id *)(a1 + 32), "_createAccessoryManager");
  *(_WORD *)(*(_QWORD *)(a1 + 32) + 652) |= 0x1000u;
  objc_msgSend(*(id *)(a1 + 32), "_updateDefaultIndentationWidth");
  objc_msgSend(*(id *)(a1 + 32), "_setFocusStyle:", objc_msgSend(*(id *)(a1 + 32), "_defaultFocusStyle"));
  v16 = (objc_class *)objc_opt_class();
  v17 = (objc_class *)objc_opt_class();
  MethodImplementation = class_getMethodImplementation(v16, sel__preferredSeparatorInsetsForProposedInsets_);
  result = class_getMethodImplementation(v17, sel__preferredSeparatorInsetsForProposedInsets_);
  if (MethodImplementation == result || result == 0 || MethodImplementation == 0)
    v22 = 0;
  else
    v22 = 0x4000;
  *(_WORD *)(*(_QWORD *)(a1 + 32) + 652) = *(_WORD *)(*(_QWORD *)(a1 + 32) + 652) & 0xBFFF | v22;
  return result;
}

@end
