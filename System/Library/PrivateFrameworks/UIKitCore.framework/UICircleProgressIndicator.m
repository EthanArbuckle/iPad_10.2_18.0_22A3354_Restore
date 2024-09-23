@implementation UICircleProgressIndicator

uint64_t __58___UICircleProgressIndicator__startIndeterminateAnimation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  _QWORD v5[6];

  v2 = 0;
  v3 = MEMORY[0x1E0C809B0];
  do
  {
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __58___UICircleProgressIndicator__startIndeterminateAnimation__block_invoke_2;
    v5[3] = &unk_1E16B1888;
    v5[4] = *(_QWORD *)(a1 + 32);
    v5[5] = v2;
    result = +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, (double)v2++ * 0.25, 0.25);
  }
  while (v2 != 4);
  return result;
}

uint64_t __58___UICircleProgressIndicator__startIndeterminateAnimation__block_invoke_2(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 520);
  CGAffineTransformMakeRotation(&v3, (double)*(uint64_t *)(a1 + 40) * 1.57079633);
  return objc_msgSend(v1, "setTransform:", &v3);
}

@end
