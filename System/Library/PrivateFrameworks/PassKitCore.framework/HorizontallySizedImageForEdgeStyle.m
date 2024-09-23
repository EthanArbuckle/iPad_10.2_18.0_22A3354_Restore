@implementation HorizontallySizedImageForEdgeStyle

void ___HorizontallySizedImageForEdgeStyle_block_invoke(uint64_t a1, double a2, double a3, uint64_t a4, uint64_t a5, int a6, int a7, int a8, int a9, int a10)
{
  CGContext *v11;
  uint64_t v12;
  double *v13;
  CGFloat *v14;
  double MaxX;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = a2;
  v12 = *(_QWORD *)(a1 + 40);
  v11 = *(CGContext **)(a1 + 48);
  *(double *)(*(_QWORD *)(v12 + 8) + 48) = a3;
  v13 = *(double **)(*(_QWORD *)(a1 + 32) + 8);
  v14 = *(CGFloat **)(*(_QWORD *)(a1 + 40) + 8);
  CGContextDrawSubimage(v11, *(CGImageRef *)(a1 + 56), a2 != a3, a6, a7, a8, a9, a10, v13[4], v13[5], v13[6], v13[7], v14[4], v14[5], v14[6], v14[7], *(_QWORD *)(a1 + 64));
  MaxX = CGRectGetMaxX(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
  v16 = *(double *)(a1 + 64);
  if (v16 == 0.0)
    v16 = PKScreenScale();
  if (v16 == 0.0)
    v17 = round(MaxX);
  else
    v17 = round(MaxX * v16) / v16;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = v17;
  v18 = CGRectGetMaxX(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
  v19 = *(double *)(a1 + 64);
  if (v19 == 0.0)
    v19 = PKScreenScale();
  if (v19 == 0.0)
    v20 = round(v18);
  else
    v20 = round(v18 * v19) / v19;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = v20;
}

@end
