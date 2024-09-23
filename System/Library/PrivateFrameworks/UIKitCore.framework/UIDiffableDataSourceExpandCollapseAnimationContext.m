@implementation UIDiffableDataSourceExpandCollapseAnimationContext

void __96___UIDiffableDataSourceExpandCollapseAnimationContext_indexPathsForChildItemsInExpandingParent___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = -[_UIDiffableDataSourceExpandCollapseAnimationContext _visibleIndexForIndex:identifiers:visibleIdentifiers:](*(_QWORD *)(a1 + 32), a2, *(void **)(*(_QWORD *)(a1 + 32) + 48), *(void **)(*(_QWORD *)(a1 + 32) + 64));
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

void __97___UIDiffableDataSourceExpandCollapseAnimationContext_indexPathsForChildItemsInCollapsingParent___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = -[_UIDiffableDataSourceExpandCollapseAnimationContext _visibleIndexForIndex:identifiers:visibleIdentifiers:](*(_QWORD *)(a1 + 32), a2, *(void **)(*(_QWORD *)(a1 + 32) + 40), *(void **)(*(_QWORD *)(a1 + 32) + 56));
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

@end
