@implementation PXGCreateBurstImageStackFromImage

void __PXGCreateBurstImageStackFromImage_block_invoke(uint64_t a1, CGContext *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  char v27;
  char v28;
  CGFloat rect;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v10 = *(double *)(a1 + 32);
  v11 = v10 * 2.5;
  v32 = v10 * 0.5;
  PXRectRoundToPixel();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  CGContextSetFillColorWithColor(a2, *(CGColorRef *)(a1 + 40));
  v33.origin.x = a3;
  v33.origin.y = a4;
  v33.size.width = a5;
  v33.size.height = a6;
  CGContextFillRect(a2, v33);
  CGImageGetWidth(*(CGImageRef *)(a1 + 48));
  CGImageGetHeight(*(CGImageRef *)(a1 + 48));
  PXSizeGetAspectRatioWithDefault();
  PXRectWithAspectRatioFillingRect();
  PXRectRoundToPixel();
  v21 = v20;
  v23 = v22;
  v25 = v24;
  rect = v26;
  v34.origin.x = v13;
  v34.origin.y = v15;
  v34.size.width = v17;
  v34.size.height = v19;
  CGContextClipToRect(a2, v34);
  v35.origin.x = v21;
  v35.origin.y = v23;
  v35.size.width = v25;
  v35.size.height = rect;
  CGContextDrawImage(a2, v35, *(CGImageRef *)(a1 + 48));
  CGContextResetClip(a2);
  CGContextSetAlpha(a2, 0.600000024);
  v27 = 1;
  do
  {
    v28 = v27;
    v36.origin.x = v13;
    v36.origin.y = v15;
    v36.size.width = v17;
    v36.size.height = v19;
    v15 = v32 + CGRectGetMaxY(v36);
    v17 = v17 + v11 * -2.0;
    v23 = v11 + v23;
    v37.origin.x = v11 + v13;
    v37.origin.y = v15;
    v37.size.width = v17;
    v37.size.height = v11 - v32;
    CGContextClipToRect(a2, v37);
    v38.size.width = v25;
    v38.origin.x = v21;
    v38.origin.y = v23;
    v38.size.height = rect;
    CGContextDrawImage(a2, v38, *(CGImageRef *)(a1 + 48));
    CGContextResetClip(a2);
    v27 = 0;
    v19 = v11 - v32;
    v13 = v11 + v13;
  }
  while ((v28 & 1) != 0);
}

@end
