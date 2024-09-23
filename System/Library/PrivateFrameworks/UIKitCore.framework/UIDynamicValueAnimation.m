@implementation UIDynamicValueAnimation

uint64_t __48___UIDynamicValueAnimation__animateForInterval___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 24);
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t, double, double))(v5 + 16))(v5, a2, *(double *)(a1 + 40), *(double *)(v4 + 40));
    v4 = *(_QWORD *)(a1 + 32);
  }
  result = *(_QWORD *)(v4 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, double, double))(result + 16))(result, a2, *(double *)(a1 + 40), *(double *)(v4 + 40));
  return result;
}

uint64_t __48___UIDynamicValueAnimation__animateForInterval___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 24);
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t, double, double))(v5 + 16))(v5, a2, *(double *)(v4 + 40), *(double *)(v4 + 40));
    v4 = *(_QWORD *)(a1 + 32);
  }
  result = *(_QWORD *)(v4 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, double, double))(result + 16))(result, a2, *(double *)(v4 + 40), *(double *)(v4 + 40));
  return result;
}

@end
