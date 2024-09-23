@implementation UICalendarHeaderView

void __44___UICalendarHeaderView__setupViewHierarchy__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "headerViewDidSelect:", WeakRetained);

}

uint64_t __46___UICalendarHeaderView_setExpanded_animated___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 432);
  v3 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(v2, "setChevronTransform:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setSelected:", *(unsigned __int8 *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 32), "_updateMonthYearLabel");
  return objc_msgSend(*(id *)(a1 + 32), "_updateMonthButtonVisibility");
}

@end
