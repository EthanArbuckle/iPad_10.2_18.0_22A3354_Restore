@implementation UICollectionLayoutSolveParameters

void __65___UICollectionLayoutSolveParameters_invalidatedAuxillaryOffsets__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  void *v6;
  id v7;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v3)
  {
    if (!objc_msgSend(a2, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_setIndexes_forElementKind_, v3, CFSTR("_UICollectionLayoutHelpers.m"), 1674, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind.length"));

    }
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexSet:", a3);
    objc_msgSend(*(id *)(v3 + 8), "setObject:forKeyedSubscript:", v7, a2);

  }
}

@end
