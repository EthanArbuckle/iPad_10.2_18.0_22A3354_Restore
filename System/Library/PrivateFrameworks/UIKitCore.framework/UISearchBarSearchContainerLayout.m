@implementation UISearchBarSearchContainerLayout

double __49___UISearchBarSearchContainerLayout_updateLayout__block_invoke(uint64_t a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double v8;
  double v10;
  double v11;
  double v12;
  double MinX;
  double v14;
  double MaxX;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v8 = a2;
  v10 = *(double *)(*(_QWORD *)(a1 + 32) + 184);
  if (v10 < CGRectGetWidth(*(CGRect *)&a2))
  {
    v11 = *(double *)(*(_QWORD *)(a1 + 32) + 184);
    v12 = round(CGRectGetMidX(*(CGRect *)(a1 + 40)) + v11 * -0.5);
    if (*(_BYTE *)(a1 + 72))
    {
      v17.origin.x = v8;
      v17.origin.y = a3;
      v17.size.width = a4;
      v17.size.height = a5;
      MinX = CGRectGetMinX(v17);
      v18.origin.x = v12;
      v18.origin.y = a3;
      v18.size.width = v11;
      v18.size.height = a5;
      v14 = fmax(MinX - CGRectGetMinX(v18), 0.0);
    }
    else
    {
      v19.origin.x = v8;
      v19.origin.y = a3;
      v19.size.width = a4;
      v19.size.height = a5;
      MaxX = CGRectGetMaxX(v19);
      v20.origin.x = v12;
      v20.origin.y = a3;
      v20.size.width = v11;
      v20.size.height = a5;
      v14 = MaxX - CGRectGetMaxX(v20);
      if (v14 > 0.0)
        v14 = 0.0;
    }
    return v12 + v14;
  }
  return v8;
}

uint64_t __48___UISearchBarSearchContainerLayout_applyLayout__block_invoke(uint64_t a1)
{
  double v2;
  double v3;

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  if (*(_BYTE *)(a1 + 80))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 40), "mainContentAlpha");
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v2 * v3);
}

@end
