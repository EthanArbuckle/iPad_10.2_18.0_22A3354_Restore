@implementation VKCImageContentRectCalculator

+ (CGRect)unitContentsRectForBounds:(CGRect)a3 contentMode:(int64_t)a4 imageSize:(CGSize)a5 orientation:(int64_t)a6 view:(id)a7
{
  CGFloat y;
  CGFloat x;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  double v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat width;
  CGFloat height;
  double v66;
  CGRect v67;
  CGRect result;
  CGRect v69;

  width = a3.size.width;
  height = a3.size.height;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(a7, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentsRect");
  vk_orientationApplyToRectAtPoint((CGAffineTransform *)a6, v13, v14, v15, v16, 0.5, 0.5);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v66 = 1.0;
  if ((unint64_t)(a4 - 1) > 1)
    goto LABEL_4;
  v69.origin.x = 0.0;
  v69.origin.y = 0.0;
  v69.size.width = 1.0;
  v69.size.height = 1.0;
  v67.origin.x = v18;
  v67.origin.y = v20;
  v67.size.width = v22;
  v67.size.height = v24;
  if (CGRectEqualToRect(v67, v69)
    || VKMNearlyEqualRects(*MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), v18, v20, v22, v24))
  {
LABEL_4:
    v25 = VKMRectWithSize();
    VKMNormalizedSubrectInRect(v25, v26, v27, v28, x, y, width, height);
    objc_msgSend(a1, "processNormalizedRect:scale:contentMode:", &v66, a4);
  }
  else
  {
    v33 = VKMRectWithSize();
    v35 = v34;
    v62 = v37;
    v63 = v36;
    VKMRectFromNormalizedSubrect(v33, v34, v36, v37, v18, v20, v22, v24);
    v39 = v38;
    v41 = v40;
    v43 = v42;
    v45 = v44;
    VKMNormalizedSubrectInRect(v38, v40, v42, v44, x, y, width, height);
    objc_msgSend(a1, "processNormalizedRect:scale:contentMode:", &v66, a4);
    v50 = VKMClampRectToRect(v46, v47, v48, v49, 0.0, 0.0, 1.0, 1.0);
    VKMRectFromNormalizedSubrect(v39, v41, v43, v45, v50, v51, v52, v53);
    v54 = VKMCenterOfRect(v39, v41, v43, v45);
    v56 = v55;
    v57 = VKMMultiplyPointScalar(width, height, 1.0 / v66);
    v58 = VKMRectWithCenterAndSize(v54, v56, v57);
    VKMNormalizedSubrectInRect(v33, v35, v63, v62, v58, v59, v60, v61);
  }
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

+ (CGRect)processNormalizedRect:(CGRect)a3 scale:(double *)a4 contentMode:(int64_t)a5
{
  double height;
  double width;
  double x;
  CGFloat y;
  CGFloat v10;
  int v11;
  int v12;
  double v13;
  int v14;
  char v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  x = a3.origin.x;
  y = a3.origin.y;
  *a4 = 1.0;
  v10 = a3.origin.y;
  v11 = 0;
  v12 = 0;
  v13 = 0.0;
  v14 = 1;
  v15 = 1;
  v16 = 0.0;
  v17 = 0.0;
  switch(a5)
  {
    case 0:
      x = 0.0;
      y = 0.0;
      width = 1.0;
      height = 1.0;
      goto LABEL_16;
    case 1:
      goto LABEL_3;
    case 2:
    case 3:
      v14 = 0;
LABEL_3:
      if (VKMSizeIsEmptyOrHasNanOrInf(width, a3.size.height))
      {
        v28.origin.x = x;
        v28.origin.y = v10;
        v28.size.width = width;
        v28.size.height = height;
        NSStringFromCGRect(v28);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "isValid", "+[VKCImageContentRectCalculator processNormalizedRect:scale:contentMode:]", 0, 0, CFSTR("Invalid rect for aspect fit / fill: %@"), v18);

      }
      else
      {
        if (width >= height)
          v19 = width;
        else
          v19 = height;
        if (width >= height)
          v20 = height;
        else
          v20 = width;
        if (!v14)
          v19 = v20;
        *a4 = 1.0 / v19;
        VKMScaledRect(x, v10, width, height, 1.0 / v19);
        width = v21;
        height = v22;
      }
      goto LABEL_14;
    case 4:
LABEL_14:
      v13 = 0.5 - width * 0.5;
      goto LABEL_29;
    case 5:
      v16 = 0.5 - width * 0.5;
      v17 = 0.0;
      goto LABEL_30;
    case 6:
      goto LABEL_23;
    case 7:
      goto LABEL_29;
    case 8:
      goto LABEL_21;
    case 9:
      goto LABEL_30;
    case 10:
      v14 = 0;
      v11 = 0;
      y = 0.0;
      goto LABEL_21;
    case 11:
      v15 = 0;
      v12 = 0;
      x = 0.0;
      goto LABEL_23;
    case 12:
      v14 = 0;
      v11 = 1;
LABEL_21:
      v23 = x;
      v24 = v10;
      v25 = width;
      x = 1.0 - CGRectGetMaxX(a3);
      if (v11)
      {
        v15 = 0;
        v12 = v14;
LABEL_23:
        v29.origin.x = x;
        v29.origin.y = y;
        v29.size.width = width;
        v29.size.height = height;
        v17 = 1.0 - CGRectGetMaxY(v29);
        if ((v15 & 1) != 0)
        {
          v13 = 0.5 - width * 0.5;
          v16 = v13;
          if ((v12 & 1) == 0)
            goto LABEL_30;
          goto LABEL_29;
        }
        v14 = v12;
      }
      else
      {
        v17 = y;
      }
      v13 = x;
      v16 = x;
      if (!v14)
        goto LABEL_30;
LABEL_29:
      v17 = 0.5 - height * 0.5;
      v16 = v13;
LABEL_30:
      v26 = width;
      v27 = height;
      result.size.height = v27;
      result.size.width = v26;
      result.origin.y = v17;
      result.origin.x = v16;
      return result;
    default:
LABEL_16:
      v16 = x;
      v17 = y;
      goto LABEL_30;
  }
}

@end
