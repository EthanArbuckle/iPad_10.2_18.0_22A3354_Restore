@implementation UITextSearchingFindSessionAggregator

void __63___UITextSearchingFindSessionAggregator__performOnMainIfValid___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

uint64_t __58___UITextSearchingFindSessionAggregator_finishedSearching__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_finishedSearching");
}

uint64_t __79___UITextSearchingFindSessionAggregator_foundRange_forSearchString_inDocument___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "_foundRange:forSearchString:inDocument:", a1[4], a1[5], a1[6]);
}

uint64_t __73___UITextSearchingFindSessionAggregator_invalidateFoundRange_inDocument___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_invalidateFoundRange:inDocument:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __51___UITextSearchingFindSessionAggregator_invalidate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_invalidateAllFoundRanges");
}

@end
