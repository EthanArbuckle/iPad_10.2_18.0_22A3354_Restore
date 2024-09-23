@implementation UIComplexBoundingPath

BOOL __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke_6(uint64_t a1)
{
  _QWORD *v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  char v9;
  uint64_t v10;
  _BOOL8 v11;
  char v13;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  char v18;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v1 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v20 = *(_OWORD *)(a1 + 40);
  v21 = *(_OWORD *)(a1 + 56);
  v22 = *(_OWORD *)(a1 + 72);
  v23 = *(_QWORD *)(a1 + 88);
  v2 = v1[4];
  v3 = v1[5];
  v4 = v1[6] + v2;
  v5 = v1[7] + v3;
  v6 = v2 + 1;
  v7 = v4 - 1;
  v8 = v2 + 1;
  while (v8 < v7)
  {
    v24 = v20;
    v25 = v21;
    v26 = v22;
    v27 = v23;
    v9 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v24, v8, v3);
    v8 += v10;
    if ((v9 & 1) == 0)
      return 0;
  }
  while (v6 < v7)
  {
    v24 = v20;
    v25 = v21;
    v26 = v22;
    v27 = v23;
    v13 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v24, v6, v5);
    v6 += v14;
    if ((v13 & 1) == 0)
      return 0;
  }
  v15 = v3 + 1;
  v16 = v5 - 1;
  v17 = v15;
  while (v17 < v16)
  {
    v24 = v20;
    v25 = v21;
    v26 = v22;
    v27 = v23;
    v18 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v24, v2, v17++);
    if ((v18 & 1) == 0)
      return 0;
  }
  do
  {
    v11 = v15 >= v16;
    if (v15 >= v16)
      break;
    v24 = v20;
    v25 = v21;
    v26 = v22;
    v27 = v23;
    v19 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v24, v4, v15++);
  }
  while ((v19 & 1) != 0);
  return v11;
}

void __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (**v5)(void);
  CGRect v6;

  v5 = a2;
  while (1)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(double *)(v3 + 48) <= 0.0 || *(double *)(v3 + 56) <= 0.0 || (v5[2]() & 1) != 0)
      break;
    *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectInset(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 32), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56));
    v6 = CGRectIntegral(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
    v4 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
    v4[4] = (uint64_t)v6.origin.x;
    v4[5] = (uint64_t)v6.origin.y;
    v4[6] = (uint64_t)v6.size.width;
    v4[7] = (uint64_t)v6.size.height;
  }

}

uint64_t __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke_5(uint64_t a1)
{
  _QWORD *v1;
  unint64_t v2;
  unint64_t v3;
  __int128 v4;
  _OWORD v6[3];
  uint64_t v7;

  v1 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v2 = v1[6] + v1[4];
  v3 = v1[7] + v1[5];
  v4 = *(_OWORD *)(a1 + 56);
  v6[0] = *(_OWORD *)(a1 + 40);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 88);
  return _UIBoundingPathBitmapDataRowHitTest((unint64_t *)v6, v2, v3) & 1;
}

uint64_t __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke_4(uint64_t a1)
{
  _QWORD *v1;
  unint64_t v2;
  unint64_t v3;
  __int128 v4;
  _OWORD v6[3];
  uint64_t v7;

  v1 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v2 = v1[4];
  v3 = v1[7] + v1[5];
  v4 = *(_OWORD *)(a1 + 56);
  v6[0] = *(_OWORD *)(a1 + 40);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 88);
  return _UIBoundingPathBitmapDataRowHitTest((unint64_t *)v6, v2, v3) & 1;
}

uint64_t __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke_3(uint64_t a1)
{
  _QWORD *v1;
  unint64_t v2;
  unint64_t v3;
  __int128 v4;
  _OWORD v6[3];
  uint64_t v7;

  v1 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v2 = v1[5];
  v3 = v1[6] + v1[4];
  v4 = *(_OWORD *)(a1 + 56);
  v6[0] = *(_OWORD *)(a1 + 40);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 88);
  return _UIBoundingPathBitmapDataRowHitTest((unint64_t *)v6, v3, v2) & 1;
}

uint64_t __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  __int128 v4;
  _OWORD v6[3];
  uint64_t v7;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(_QWORD *)(v1 + 32);
  v3 = *(_QWORD *)(v1 + 40);
  v4 = *(_OWORD *)(a1 + 56);
  v6[0] = *(_OWORD *)(a1 + 40);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 88);
  return _UIBoundingPathBitmapDataRowHitTest((unint64_t *)v6, v2, v3) & 1;
}

void __46___UIComplexBoundingPath__imageRepresentation__block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  uint64_t v4;
  double v5;
  CGContext *v6;
  double v7;
  double v8;
  CGImage *v9;
  id v10;
  CGRect v11;

  v10 = a2;
  CGContextTranslateCTM((CGContextRef)objc_msgSend(v10, "CGContext"), *(double *)(a1 + 48) * 0.5, *(double *)(a1 + 56) * 0.5);
  CGContextScaleCTM((CGContextRef)objc_msgSend(v10, "CGContext"), 1.0, -1.0);
  v3 = (CGContext *)objc_msgSend(v10, "CGContext");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  switch(v4)
  {
    case 1:
      v5 = 0.0;
      break;
    case 3:
      v5 = 1.57079633;
      break;
    case 4:
      v5 = -1.57079633;
      break;
    default:
      v5 = 3.14159265;
      if (v4 != 2)
        v5 = 0.0;
      break;
  }
  CGContextRotateCTM(v3, v5);
  v6 = (CGContext *)objc_msgSend(v10, "CGContext");
  v7 = *(double *)(a1 + 64);
  v8 = *(double *)(a1 + 72);
  v9 = (CGImage *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGImage");
  v11.origin.x = v7 * -0.5;
  v11.origin.y = v8 * -0.5;
  v11.size.width = v7;
  v11.size.height = v8;
  CGContextDrawImage(v6, v11, v9);

}

@end
