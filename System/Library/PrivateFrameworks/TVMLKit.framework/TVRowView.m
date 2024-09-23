@implementation TVRowView

void __28___TVRowView_setComponents___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(*(_QWORD *)(a1 + 32) + 488);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);

  if (WeakRetained == v6)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
}

@end
