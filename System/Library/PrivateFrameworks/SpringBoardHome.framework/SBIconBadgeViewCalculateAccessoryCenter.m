@implementation SBIconBadgeViewCalculateAccessoryCenter

double __SBIconBadgeViewCalculateAccessoryCenter_block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 96))
    return *(double *)(a1 + 32) * 0.5 - *(double *)(a1 + 48);
  else
    return *(double *)(a1 + 48) + CGRectGetMaxX(*(CGRect *)(a1 + 64)) + *(double *)(a1 + 32) * -0.5;
}

@end
