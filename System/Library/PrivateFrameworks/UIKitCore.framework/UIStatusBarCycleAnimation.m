@implementation UIStatusBarCycleAnimation

double __56___UIStatusBarCycleAnimation_stopWithCompletionHandler___block_invoke(uint64_t a1)
{
  double v2;
  double result;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = ceil(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                               + 24));
  v2 = *(double *)(a1 + 72);
  if (objc_msgSend(*(id *)(a1 + 32), "autoreverses"))
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24)
                                                                * 0.5;
    v2 = v2 + v2;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 8))
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = ceil(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48)
                                                                                               + 8)
                                                                                   + 24));
  }
  result = *(double *)(a1 + 80) + v2 * *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result;
  return result;
}

@end
