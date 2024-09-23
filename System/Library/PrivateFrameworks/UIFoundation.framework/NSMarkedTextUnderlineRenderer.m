@implementation NSMarkedTextUnderlineRenderer

void __93____NSMarkedTextUnderlineRenderer__renderUnderlineInTextRange_alphaValue_adjustmentCallback___block_invoke(uint64_t a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5)
{
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL v26;
  double v27;
  double v28;
  double v29;

  v5 = a5.n128_f64[0];
  v6 = a4.n128_f64[0];
  v7 = a3.n128_f64[0];
  v8 = a2.n128_f64[0];
  v11 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v12 = *(double *)(v11 + 40);
  if (v10)
  {
    v8 = (*(double (**)(__n128, __n128, __n128, __n128))(v10 + 16))(a2, a3, a4, a5);
    v7 = v13;
    v6 = v14;
    v5 = v15;
    v11 = *(_QWORD *)(a1 + 32);
  }
  v16 = *(_QWORD *)(v11 + 48) & 0x3000;
  switch(v16)
  {
    case 12288:
      goto LABEL_8;
    case 4096:
      goto LABEL_10;
    case 0:
      v17 = (void *)objc_msgSend(*(id *)(v11 + 8), "textLayoutFragment");
      v18 = (void *)objc_msgSend((id)objc_msgSend(v17, "textLayoutManager"), "textContainerForLocation:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "textElement"), "elementRange"), "location"));
      if (v18 && objc_msgSend(v18, "layoutOrientation"))
      {
LABEL_8:
        if (*(_BYTE *)(a1 + 64))
          v19 = v7 + v5 + *(double *)(*(_QWORD *)(a1 + 32) + 32);
        else
          v19 = *(double *)(*(_QWORD *)(a1 + 32) + 32) - (v7 + v5);
        goto LABEL_18;
      }
LABEL_10:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "glyphOrigin");
      v21 = (v5 - v20) * 0.5;
      v22 = floor(v21);
      if (v21 >= 4.0)
        v23 = (v21 - v12) * 0.666;
      else
        v23 = v22;
      v24 = v7 + v23;
      v25 = v7 + v5 - v23;
      v26 = *(_BYTE *)(a1 + 64) == 0;
      goto LABEL_15;
  }
  v27 = *(double *)(v11 + 32);
  v24 = v27 - v7;
  v25 = v7 + v27;
  v26 = *(_BYTE *)(a1 + 64) == 0;
LABEL_15:
  if (v26)
    v19 = v24;
  else
    v19 = v25;
LABEL_18:
  CGContextSaveGState(*(CGContextRef *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_setColor:inGraphicsContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v28 = v6 + v8;
  if (v6 + v8 - v8 > 1.0)
    v8 = v8 + 1.0;
  if (v28 - v8 <= 1.0)
    v29 = v28;
  else
    v29 = v28 + -1.0;
  CGContextSetLineWidth(*(CGContextRef *)(a1 + 48), v12);
  CGContextSetLineCap(*(CGContextRef *)(a1 + 48), kCGLineCapRound);
  CGContextSetAlpha(*(CGContextRef *)(a1 + 48), *(CGFloat *)(a1 + 56));
  CGContextMoveToPoint(*(CGContextRef *)(a1 + 48), v8, v19);
  CGContextAddLineToPoint(*(CGContextRef *)(a1 + 48), v29, v19);
  CGContextStrokePath(*(CGContextRef *)(a1 + 48));
  CGContextRestoreGState(*(CGContextRef *)(a1 + 48));
}

@end
