@implementation UINavigationBarLayout

uint64_t __41___UINavigationBarLayout__addLayoutItem___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  if (a2)
    a2 = *(_QWORD *)(a2 + 80);
  if (v4)
    v5 = v4[10];
  else
    v5 = 0;

  v6 = -1;
  if (a2 <= v5)
    v6 = 1;
  if (a2 == v5)
    return 0;
  else
    return v6;
}

uint64_t __41___UINavigationBarLayout__addLayoutItem___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  if (a2)
    a2 = *(_QWORD *)(a2 + 72);
  if (v4)
    v5 = v4[9];
  else
    v5 = 0;

  v6 = -1;
  if (a2 <= v5)
    v6 = 1;
  if (a2 == v5)
    return 0;
  else
    return v6;
}

uint64_t __61___UINavigationBarLayout__reprioritizeLayoutItem_toPriority___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  if (a2)
    a2 = *(_QWORD *)(a2 + 72);
  if (v4)
    v5 = v4[9];
  else
    v5 = 0;

  v6 = -1;
  if (a2 <= v5)
    v6 = 1;
  if (a2 == v5)
    return 0;
  else
    return v6;
}

@end
