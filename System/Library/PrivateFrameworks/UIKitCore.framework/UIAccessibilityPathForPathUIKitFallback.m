@implementation UIAccessibilityPathForPathUIKitFallback

void ___UIAccessibilityPathForPathUIKitFallback_block_invoke(uint64_t a1, int a2, CGFloat *a3, uint64_t a4)
{
  uint64_t v7;
  double *v8;
  uint64_t v9;

  if (a4)
  {
    v7 = a4;
    v8 = a3 + 1;
    do
    {
      *(v8 - 1) = (*(double (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(*(v8 - 1), *v8);
      *(_QWORD *)v8 = v9;
      v8 += 2;
      --v7;
    }
    while (v7);
  }
  switch(a2)
  {
    case 0:
      CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 40), 0, *a3, a3[1]);
      break;
    case 1:
      CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 40), 0, *a3, a3[1]);
      break;
    case 2:
      CGPathAddQuadCurveToPoint(*(CGMutablePathRef *)(a1 + 40), 0, *a3, a3[1], a3[2], a3[3]);
      break;
    case 3:
      CGPathAddCurveToPoint(*(CGMutablePathRef *)(a1 + 40), 0, *a3, a3[1], a3[2], a3[3], a3[4], a3[5]);
      break;
    case 4:
      CGPathCloseSubpath(*(CGMutablePathRef *)(a1 + 40));
      break;
    default:
      return;
  }
}

@end
