@implementation UINavigationBarTransitionContext

uint64_t __59___UINavigationBarTransitionContext__animateBackgroundView__block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if ((*(_WORD *)(v1 + 160) & 0x800) != 0)
  {
    objc_msgSend(*(id *)(v1 + 40), "transitionBackgroundViews");
    v1 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend(*(id *)(v1 + 8), "_updatePaletteBackgroundIfNecessary");
}

void __51___UINavigationBarTransitionContext_fadeInFunction__block_invoke(double a1, double a2, double a3, double a4)
{
  uint64_t v4;
  void *v5;

  LODWORD(a2) = 1036831949;
  LODWORD(a1) = 0.75;
  LODWORD(a3) = 0.75;
  LODWORD(a4) = 1036831949;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", a1, a2, a3, a4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_MergedGlobals_69_0;
  _MergedGlobals_69_0 = v4;

}

void __52___UINavigationBarTransitionContext_fadeOutFunction__block_invoke(double a1, double a2, double a3, double a4)
{
  uint64_t v4;
  void *v5;

  LODWORD(a2) = 1063675494;
  LODWORD(a1) = 0.25;
  LODWORD(a3) = 0.25;
  LODWORD(a4) = 1063675494;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", a1, a2, a3, a4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ECD7B6E0;
  qword_1ECD7B6E0 = v4;

}

uint64_t __83___UINavigationBarTransitionContext__animateAsTwoPartsWithOverlap_partOne_partTwo___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_QWORD *)(result + 40))
    result = +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", 0.0, *(double *)(*(_QWORD *)(result + 32) + 128) + *(double *)(result + 56));
  if (*(_QWORD *)(v1 + 48))
    return +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", *(double *)(*(_QWORD *)(v1 + 32) + 128) - *(double *)(v1 + 56), *(double *)(*(_QWORD *)(v1 + 32) + 128) + *(double *)(v1 + 56));
  return result;
}

void __103___UINavigationBarTransitionContext__animateInProcessAsTwoPartsWithKeyframeID_overlap_partOne_partTwo___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("-1"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIView _animateKeyframeWithID:relativeStartTime:relativeDuration:animations:](UIView, "_animateKeyframeWithID:relativeStartTime:relativeDuration:animations:", v2, *(_QWORD *)(a1 + 48), 0.0, *(double *)(*(_QWORD *)(a1 + 40) + 128) + *(double *)(a1 + 64));

  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("-2"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    +[UIView _animateKeyframeWithID:relativeStartTime:relativeDuration:animations:](UIView, "_animateKeyframeWithID:relativeStartTime:relativeDuration:animations:", v3, *(_QWORD *)(a1 + 56), *(double *)(*(_QWORD *)(a1 + 40) + 128) - *(double *)(a1 + 64), *(double *)(*(_QWORD *)(a1 + 40) + 128) + *(double *)(a1 + 64));

  }
}

@end
