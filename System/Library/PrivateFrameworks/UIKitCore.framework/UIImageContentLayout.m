@implementation UIImageContentLayout

double __61___UIImageContentLayout__prepareContentOfSize_source_target___block_invoke_2@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  CGImage *v5;
  CGImageRef v6;
  double result;

  objc_msgSend(*(id *)(a1 + 32), "renditionWithSize:scale:applyingEffect:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (CGImage *)-[_UIImageContentRendition CGImage]((uint64_t)v4);
  v6 = CGImageRetain(v5);
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v6;
  result = *(double *)(a1 + 72);
  *(double *)(a2 + 16) = result;
  return result;
}

double __61___UIImageContentLayout__prepareContentOfSize_source_target___block_invoke@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  CFTypeRef v4;
  double result;

  v4 = CFRetain((CFTypeRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "IOSurface"));
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = v4;
  result = *(double *)(a1 + 40);
  *(double *)(a2 + 16) = result;
  return result;
}

CGFloat __56___UIImageContentLayout_initWithSource_target_withSize___block_invoke@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  double tx;
  __int128 v9;
  double v11;
  double v12;
  CGFloat v13;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  double v22;
  double v23;
  double v24;
  BOOL v25;
  double v26;
  BOOL v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  double v42;
  double v43;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double v48;
  double v49;
  double v50;
  double v51;
  uint64_t v52;
  CGFloat v53;
  CGFloat MidY;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  CGFloat v59;
  double v60;
  double v61;
  CGFloat MidX;
  CGFloat v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  CGFloat result;
  __int128 rect;
  double recta;
  __int128 v82;
  uint64_t v83;
  __int128 v84;
  double v85;
  CGAffineTransform v86;
  CGAffineTransform v87;
  CGAffineTransform v88;
  CGAffineTransform v89;
  CGAffineTransform v90;
  CGAffineTransform v91;
  CGAffineTransform v92;
  CGAffineTransform v93;
  CGAffineTransform v94;
  CGAffineTransform v95;
  CGAffineTransform v96;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;

  v7 = MEMORY[0x1E0C9BAA8];
  v82 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v84 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)a4 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)(a4 + 16) = v82;
  rect = *(_OWORD *)(v7 + 32);
  *(_OWORD *)(a4 + 32) = rect;
  tx = *(double *)(a1 + 56);
  *(_QWORD *)&v9 = *(_QWORD *)(a1 + 64);
  if (a2)
  {
    if ((a2 & 2) != 0)
      v11 = *(double *)(a1 + 64);
    else
      v11 = *(double *)(a1 + 56);
    if ((a2 & 2) != 0)
      v12 = *(double *)(a1 + 56);
    else
      v12 = *(double *)(a1 + 64);
    CGAffineTransformMakeTranslation(&t2, tx * -0.5, *(double *)&v9 * -0.5);
    *(_OWORD *)&t1.a = v84;
    *(_OWORD *)&t1.c = v82;
    *(_OWORD *)&t1.tx = rect;
    CGAffineTransformConcat((CGAffineTransform *)a4, &t1, &t2);
    memset(&v96, 0, sizeof(v96));
    switch(a2)
    {
      case 1:
        v96.tx = 0.0;
        v96.ty = 0.0;
        v13 = -1.0;
        v96.a = -1.0;
        v96.b = 0.0;
        goto LABEL_16;
      case 2:
        v96.tx = 0.0;
        v96.ty = 0.0;
        _Q0 = xmmword_1866798C0;
        goto LABEL_19;
      case 3:
        v96.tx = 0.0;
        v96.ty = 0.0;
        _Q0 = xmmword_1866798D0;
        goto LABEL_19;
      case 4:
        v96.tx = 0.0;
        v96.ty = 0.0;
        v96.a = -1.0;
        v96.b = 0.0;
        v13 = 1.0;
        goto LABEL_16;
      case 5:
        v96.tx = 0.0;
        v96.ty = 0.0;
        v96.a = 1.0;
        v96.b = 0.0;
        v13 = -1.0;
LABEL_16:
        v96.c = 0.0;
        v96.d = v13;
        break;
      case 6:
        v96.tx = 0.0;
        v96.ty = 0.0;
        __asm { FMOV            V0.2D, #1.0 }
        goto LABEL_19;
      case 7:
        v96.tx = 0.0;
        v96.ty = 0.0;
        __asm { FMOV            V0.2D, #-1.0 }
LABEL_19:
        *(_OWORD *)&v96.b = _Q0;
        break;
      default:
        *(_OWORD *)&v96.a = v84;
        *(_OWORD *)&v96.c = v82;
        *(_OWORD *)&v96.tx = rect;
        break;
    }
    v19 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)&v95.a = *(_OWORD *)a4;
    *(_OWORD *)&v95.c = v19;
    *(_OWORD *)&v95.tx = *(_OWORD *)(a4 + 32);
    CGAffineTransformConcat(&t1, &v95, &v96);
    v20 = *(_OWORD *)&t1.c;
    *(_OWORD *)a4 = *(_OWORD *)&t1.a;
    *(_OWORD *)(a4 + 16) = v20;
    *(_OWORD *)(a4 + 32) = *(_OWORD *)&t1.tx;
    CGAffineTransformMakeTranslation(&v94, v11 * 0.5, v12 * 0.5);
    v21 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)&v95.a = *(_OWORD *)a4;
    *(_OWORD *)&v95.c = v21;
    *(_OWORD *)&v95.tx = *(_OWORD *)(a4 + 32);
    CGAffineTransformConcat(&t1, &v95, &v94);
    v9 = *(_OWORD *)&t1.c;
    *(_OWORD *)a4 = *(_OWORD *)&t1.a;
    *(_OWORD *)(a4 + 16) = v9;
    tx = t1.tx;
    *(_OWORD *)(a4 + 32) = *(_OWORD *)&t1.tx;
  }
  else
  {
    v12 = *(double *)(a1 + 64);
    v11 = *(double *)(a1 + 56);
  }
  objc_msgSend(*(id *)(a1 + 32), "_contentInsets", tx, *(double *)&v9, (_QWORD)rect);
  v25 = v24 == 0.0;
  if (v26 != 0.0)
    v25 = 0;
  if (v22 != 0.0)
    v25 = 0;
  v27 = v23 == 0.0 && v25;
  if (!v27)
  {
    objc_msgSend(*(id *)(a1 + 32), "_contentInsets");
    v32 = v29;
    if (!a3)
    {
      v33 = v29;
      v29 = v28;
LABEL_43:
      CGAffineTransformMakeTranslation(&v93, v33, v29);
      v35 = *(_OWORD *)(a4 + 16);
      *(_OWORD *)&v95.a = *(_OWORD *)a4;
      *(_OWORD *)&v95.c = v35;
      *(_OWORD *)&v95.tx = *(_OWORD *)(a4 + 32);
      CGAffineTransformConcat(&t1, &v95, &v93);
      v36 = *(_OWORD *)&t1.c;
      *(_OWORD *)a4 = *(_OWORD *)&t1.a;
      *(_OWORD *)(a4 + 16) = v36;
      *(_OWORD *)(a4 + 32) = *(_OWORD *)&t1.tx;
      goto LABEL_44;
    }
    if (a3 <= 7)
    {
      if (((1 << a3) & 0x22) != 0)
      {
        v29 = v30;
        v33 = v31;
        v34 = v28;
        v28 = v32;
        goto LABEL_39;
      }
      if (((1 << a3) & 0x44) != 0)
      {
        v29 = v31;
        v33 = v28;
        v34 = v32;
        v28 = v30;
        goto LABEL_39;
      }
      if (((1 << a3) & 0x88) != 0)
      {
        v33 = v30;
        v34 = v31;
        goto LABEL_39;
      }
    }
    v29 = v28;
    v33 = v32;
    v34 = v30;
    v28 = v31;
LABEL_39:
    if (a3 - 6 < 2)
    {
      v29 = v34;
    }
    else if (a3 - 4 <= 1)
    {
      v33 = v28;
    }
    goto LABEL_43;
  }
LABEL_44:
  LayerContentModeTransform(*(_QWORD *)(a1 + 72), (uint64_t)&v92, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  v37 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)&v95.a = *(_OWORD *)a4;
  *(_OWORD *)&v95.c = v37;
  *(_OWORD *)&v95.tx = *(_OWORD *)(a4 + 32);
  CGAffineTransformConcat(&t1, &v95, &v92);
  v38 = *(_OWORD *)&t1.c;
  *(_OWORD *)a4 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a4 + 16) = v38;
  *(_OWORD *)(a4 + 32) = *(_OWORD *)&t1.tx;
  v39 = *MEMORY[0x1E0C9D538];
  v40 = *(_QWORD *)(MEMORY[0x1E0C9D538] + 8);
  v41 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)&t1.a = *(_OWORD *)a4;
  *(_OWORD *)&t1.c = v41;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a4 + 32);
  v83 = v39;
  *(_QWORD *)&v41 = v40;
  v85 = v11;
  v42 = v11;
  v43 = v12;
  v99 = CGRectApplyAffineTransform(*(CGRect *)&v39, &t1);
  x = v99.origin.x;
  y = v99.origin.y;
  width = v99.size.width;
  height = v99.size.height;
  UIRoundToScale(v99.size.width, *(double *)(*(_QWORD *)(a1 + 40) + 64));
  v49 = v48;
  UIRoundToScale(height, *(double *)(*(_QWORD *)(a1 + 40) + 64));
  v51 = v50;
  if (*(_QWORD *)(a1 + 72) <= 3uLL && *(_BYTE *)(a1 + 128))
  {
    v52 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    *(double *)(v52 + 32) = v49;
    *(double *)(v52 + 40) = v50;
  }
  if (!v27)
  {
    v100.origin.x = x;
    v100.origin.y = y;
    v100.size.width = width;
    v100.size.height = height;
    recta = v12;
    v53 = -CGRectGetMidX(v100);
    v101.origin.x = x;
    v101.origin.y = y;
    v101.size.width = width;
    v101.size.height = height;
    MidY = CGRectGetMidY(v101);
    CGAffineTransformMakeTranslation(&v91, v53, -MidY);
    v55 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)&v95.a = *(_OWORD *)a4;
    *(_OWORD *)&v95.c = v55;
    *(_OWORD *)&v95.tx = *(_OWORD *)(a4 + 32);
    CGAffineTransformConcat(&t1, &v95, &v91);
    v56 = *(_OWORD *)&t1.c;
    *(_OWORD *)a4 = *(_OWORD *)&t1.a;
    *(_OWORD *)(a4 + 16) = v56;
    *(_OWORD *)(a4 + 32) = *(_OWORD *)&t1.tx;
    CGAffineTransformMakeScale(&v90, v49 / width, v51 / height);
    v57 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)&v95.a = *(_OWORD *)a4;
    *(_OWORD *)&v95.c = v57;
    *(_OWORD *)&v95.tx = *(_OWORD *)(a4 + 32);
    CGAffineTransformConcat(&t1, &v95, &v90);
    v58 = *(_OWORD *)&t1.c;
    *(_OWORD *)a4 = *(_OWORD *)&t1.a;
    *(_OWORD *)(a4 + 16) = v58;
    *(_OWORD *)(a4 + 32) = *(_OWORD *)&t1.tx;
    v59 = x;
    *(CGFloat *)&v58 = y;
    v60 = width;
    v61 = height;
    MidX = CGRectGetMidX(*(CGRect *)((char *)&v58 - 8));
    v102.origin.x = x;
    v102.origin.y = y;
    v102.size.width = width;
    v102.size.height = height;
    v63 = CGRectGetMidY(v102);
    CGAffineTransformMakeTranslation(&v89, MidX, v63);
    v64 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)&v95.a = *(_OWORD *)a4;
    *(_OWORD *)&v95.c = v64;
    *(_OWORD *)&v95.tx = *(_OWORD *)(a4 + 32);
    CGAffineTransformConcat(&t1, &v95, &v89);
    v65 = *(_OWORD *)&t1.c;
    *(_OWORD *)a4 = *(_OWORD *)&t1.a;
    *(_OWORD *)(a4 + 16) = v65;
    *(_OWORD *)(a4 + 32) = *(_OWORD *)&t1.tx;
    v66 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a4;
    *(_OWORD *)&t1.c = v66;
    *(_OWORD *)&t1.tx = *(_OWORD *)(a4 + 32);
    v67 = v83;
    *(_QWORD *)&v66 = v40;
    v68 = v85;
    v69 = recta;
    v103 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v66 - 8), &t1);
    v70 = v103.origin.x;
    v71 = v103.origin.y;
    UIRoundToScale(v103.origin.x, *(double *)(*(_QWORD *)(a1 + 40) + 64));
    v73 = v72;
    UIRoundToScale(v71, *(double *)(*(_QWORD *)(a1 + 40) + 64));
    CGAffineTransformMakeTranslation(&v88, v73 - v70, v74 - v71);
    v75 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)&v95.a = *(_OWORD *)a4;
    *(_OWORD *)&v95.c = v75;
    *(_OWORD *)&v95.tx = *(_OWORD *)(a4 + 32);
    CGAffineTransformConcat(&t1, &v95, &v88);
    v76 = *(_OWORD *)&t1.c;
    *(_OWORD *)a4 = *(_OWORD *)&t1.a;
    *(_OWORD *)(a4 + 16) = v76;
    *(_OWORD *)(a4 + 32) = *(_OWORD *)&t1.tx;
  }
  memset(&t1, 0, sizeof(t1));
  LayerContentModeTransform(*(_QWORD *)(a1 + 72), (uint64_t)&t1, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v95 = t1;
  CGAffineTransformInvert(&v87, &v95);
  v77 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)&v86.a = *(_OWORD *)a4;
  *(_OWORD *)&v86.c = v77;
  *(_OWORD *)&v86.tx = *(_OWORD *)(a4 + 32);
  CGAffineTransformConcat(&v95, &v87, &v86);
  v78 = *(_OWORD *)&v95.c;
  *(_OWORD *)a4 = *(_OWORD *)&v95.a;
  *(_OWORD *)(a4 + 16) = v78;
  result = v95.tx;
  *(_OWORD *)(a4 + 32) = *(_OWORD *)&v95.tx;
  return result;
}

@end
