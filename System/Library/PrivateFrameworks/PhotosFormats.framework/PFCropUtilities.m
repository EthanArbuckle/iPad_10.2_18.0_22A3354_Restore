@implementation PFCropUtilities

+ (uint64_t)bestCropRectV2ForAspectRatio:(uint64_t)a3 withFocusRegion:(uint64_t)a4 sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:
{
  return +[PFCropUtilitiesCore bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:](PFCropUtilitiesCore, "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:", a3, a4, 0);
}

+ (double)_interpolationCropToSize:(double)a3 withinRect:(double)a4 withPreferredRect:(double)a5 andAcceptableRect:(double)a6 outputScore:(uint64_t)a7
{
  BOOL v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _BOOL4 v32;
  _BOOL4 v33;
  double v34;
  _BOOL4 v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  _BOOL4 v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v56;
  double v57;
  double v58;
  uint8_t buf[4];
  double v61;
  __int16 v62;
  double v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;
  CGRect v67;
  CGRect v68;

  v66 = *MEMORY[0x1E0C80C00];
  if (!+[PFCropUtilities _rectIsValid:](PFCropUtilities, "_rectIsValid:", a16)
    || !+[PFCropUtilities _rectIsValid:](PFCropUtilities, "_rectIsValid:"))
  {
    if (a5 - a1 <= 0.0)
      v28 = 0.0;
    else
      v28 = (a5 - a1) * 0.5;
    if (a9)
    {
      v29 = 0.5005;
LABEL_48:
      *a9 = v29;
      return v28;
    }
    return v28;
  }
  if (a1 == 0.0
    || a2 == 0.0
    || (a1 == *MEMORY[0x1E0D71130] ? (v27 = a2 == *(double *)(MEMORY[0x1E0D71130] + 8)) : (v27 = 0), v27))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218496;
      v61 = a1;
      v62 = 2048;
      v63 = a2;
      v64 = 2048;
      v65 = 0x3FF0000000000000;
      _os_log_fault_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
    }
  }
  PFSizeWithAspectRatioFittingSize();
  v56 = v31;
  v58 = v30;
  v32 = +[PFCropUtilities _rectIsValid:](PFCropUtilities, "_rectIsValid:", a16, a17, a18, a19);
  v33 = +[PFCropUtilities _rectIsValid:](PFCropUtilities, "_rectIsValid:", a12, a13, a14, a15);
  v35 = v33;
  v36 = a12;
  v37 = a14;
  v38 = a15;
  if (!v33)
  {
    v36 = a3 + a5 * 0.5 + v58 * -0.5;
    v34 = v56;
    v37 = v58;
    v38 = v56;
  }
  v39 = MEMORY[0x1E0C9D538];
  v40 = a1 < a18 && v32;
  v57 = v38;
  if (v40)
  {
    v67.origin.x = a16;
    v67.origin.y = a17;
    v67.size.width = a18;
    v67.size.height = a19;
    +[PFCropUtilities _interpolationWithFactor:between:and:](PFCropUtilities, "_interpolationWithFactor:between:and:", a1 / a18, CGRectGetMidX(v67), a16);
    v28 = v41;
    v42 = 2.0 - a1 / a18;
  }
  else
  {
    if (v32 && v33 && a1 < a14)
    {
      +[PFCropUtilities _interpolationFactorFor:between:and:](PFCropUtilities, "_interpolationFactorFor:between:and:", a1, a18, a14, v34, v36);
      v44 = v43;
      +[PFCropUtilities _interpolationWithFactor:between:and:](PFCropUtilities, "_interpolationWithFactor:between:and:");
      v28 = v45;
      v46 = 2.0;
    }
    else
    {
      if (a1 >= a5)
      {
        v42 = *MEMORY[0x1E0C9D538];
        v28 = *MEMORY[0x1E0C9D538];
        goto LABEL_31;
      }
      +[PFCropUtilities _interpolationFactorFor:between:and:](PFCropUtilities, "_interpolationFactorFor:between:and:", a1, v37, a5);
      v44 = v47;
      +[PFCropUtilities _interpolationWithFactor:between:and:](PFCropUtilities, "_interpolationWithFactor:between:and:");
      v28 = v48;
      v46 = 1.0;
    }
    v42 = (v46 - v44) * 0.5;
  }
LABEL_31:
  if (a2 < a19 && v32)
  {
    v68.origin.x = a16;
    v68.origin.y = a17;
    v68.size.width = a18;
    v68.size.height = a19;
    +[PFCropUtilities _interpolationWithFactor:between:and:](PFCropUtilities, "_interpolationWithFactor:between:and:", a2 / a19, CGRectGetMidY(v68), a17);
    v50 = 2.0 - a2 / a19;
    if (!a9)
      return v28;
    goto LABEL_45;
  }
  if (v32 && v35 && a2 < a15)
  {
    +[PFCropUtilities _interpolationFactorFor:between:and:](PFCropUtilities, "_interpolationFactorFor:between:and:", a2, a19, a15);
    v52 = v51;
    +[PFCropUtilities _interpolationWithFactor:between:and:](PFCropUtilities, "_interpolationWithFactor:between:and:");
    v53 = 2.0;
    goto LABEL_42;
  }
  if (a2 < a6)
  {
    +[PFCropUtilities _interpolationFactorFor:between:and:](PFCropUtilities, "_interpolationFactorFor:between:and:", a2, v57);
    v52 = v54;
    +[PFCropUtilities _interpolationWithFactor:between:and:](PFCropUtilities, "_interpolationWithFactor:between:and:");
    v53 = 1.0;
LABEL_42:
    v50 = (v53 - v52) * 0.5;
    if (!a9)
      return v28;
    goto LABEL_45;
  }
  v50 = *(double *)(v39 + 8);
  if (a9)
  {
LABEL_45:
    if (v42 >= v50)
      v50 = v42;
    v29 = (2.0 - v50) * 0.5;
    goto LABEL_48;
  }
  return v28;
}

+ (uint64_t)bestCropRectV2ForAspectRatio:(CGFloat)a3 withFocusRegion:(CGFloat)a4 sourcePixelWidth:(CGFloat)a5 sourcePixelHeight:(CGFloat)a6 sourcePreferredCropRectNormalized:(uint64_t)a7 sourceAcceptableCropRectNormalized:(unint64_t)a8 sourceFaceAreaRectNormalized:(unint64_t)a9 outputCropScore:(double *)a10
{
  double v27;
  double v28;
  double height;
  double v30;
  double v31;
  double v32;
  double v33;
  _BOOL4 v34;
  double x;
  double y;
  double width;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  uint64_t result;
  _BOOL4 v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  _BYTE v61[32];
  double v62;
  double v67;
  double v68;
  double v69;
  double r1;
  double r1_8;
  double r1_16;
  double r1_24;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;

  v27 = (double)a8;
  v28 = (double)a9;
  r1 = a14 * (double)a8 + 0.0;
  v68 = a15 * (double)a9 + 0.0;
  v69 = a16 * (double)a8;
  v62 = a17 * (double)a9;
  r1_16 = a19 * (double)a9 + 0.0;
  r1_24 = a18 * (double)a8 + 0.0;
  r1_8 = a20 * (double)a8;
  height = a21 * (double)a9;
  v31 = *MEMORY[0x1E0C9D628];
  v30 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v33 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v32 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v34 = +[PFCropUtilities _rectIsValid:](PFCropUtilities, "_rectIsValid:");
  v79 = v27;
  v67 = height;
  v77 = v30;
  v78 = v31;
  v75 = v32;
  v76 = v33;
  if (!v34)
  {
    *(double *)&v61[16] = v33;
    *(double *)&v61[24] = v32;
    *(double *)v61 = v31;
    *(double *)&v61[8] = v30;
    width = r1_8;
    y = r1_16;
    x = r1_24;
    v39 = v27;
LABEL_9:
    v38 = v62;
    goto LABEL_10;
  }
  x = a22 * v27 + 0.0;
  y = (1.0 - (a23 + a25)) * v28 + 0.0;
  width = a24 * v27;
  height = a25 * v28;
  *(double *)&v61[16] = a24 * v27;
  *(double *)&v61[24] = a25 * v28;
  *(double *)v61 = x;
  *(double *)&v61[8] = y;
  if (!+[PFCropUtilities _rectIsValid:](PFCropUtilities, "_rectIsValid:", x, y, a24 * v27, a25 * v28))
  {
    height = v67;
    width = r1_8;
    y = r1_16;
    x = r1_24;
    v39 = v27;
    goto LABEL_9;
  }
  if (+[PFCropUtilities _rectIsValid:](PFCropUtilities, "_rectIsValid:", r1_24, r1_16, r1_8, v67))
  {
    v81.origin.x = r1_24;
    v81.origin.y = r1_16;
    v81.size.width = r1_8;
    v81.size.height = v67;
    v92.origin.x = a22 * v27 + 0.0;
    v92.origin.y = (1.0 - (a23 + a25)) * v28 + 0.0;
    v92.size.width = a24 * v27;
    v92.size.height = a25 * v28;
    v82 = CGRectUnion(v81, v92);
    x = v82.origin.x;
    y = v82.origin.y;
    width = v82.size.width;
    height = v82.size.height;
  }
  v38 = v62;
  v39 = v27;
  if (+[PFCropUtilities _rectIsValid:](PFCropUtilities, "_rectIsValid:", r1, v68, v69, v62))
  {
    objc_msgSend(a1, "_faceAreaRectWithPadding:", *(double *)v61, *(double *)&v61[8], *(double *)&v61[16], *(double *)&v61[24]);
    v93.origin.x = 0.0;
    v93.origin.y = 0.0;
    v93.size.width = v27;
    v93.size.height = v28;
    v94 = CGRectIntersection(v83, v93);
    v84.origin.x = r1;
    v84.origin.y = v68;
    v84.size.width = v69;
    v84.size.height = v62;
    v85 = CGRectUnion(v84, v94);
    r1 = v85.origin.x;
    v68 = v85.origin.y;
    v69 = v85.size.width;
    v38 = v85.size.height;
  }
LABEL_10:
  if (+[PFCropUtilities _rectIsValid:](PFCropUtilities, "_rectIsValid:", x, y, width, height))
  {
    v95.origin.x = 0.0;
    v95.origin.y = 0.0;
    v86.origin.x = x;
    v86.origin.y = y;
    v86.size.width = width;
    v86.size.height = height;
    v95.size.width = v39;
    v95.size.height = v28;
    v87 = CGRectIntersection(v86, v95);
    v77 = v87.origin.y;
    v78 = v87.origin.x;
    v75 = v87.size.height;
    v76 = v87.size.width;
  }
  if (+[PFCropUtilities _rectIsValid:](PFCropUtilities, "_rectIsValid:", r1, v68, v69, v38))
  {
    v88.origin.x = r1;
    v88.origin.y = v68;
    v88.size.width = v69;
    v88.size.height = v38;
    v96.origin.y = v77;
    v96.origin.x = v78;
    v96.size.height = v75;
    v96.size.width = v76;
    v89 = CGRectUnion(v88, v96);
    v97.origin.x = 0.0;
    v97.origin.y = 0.0;
    v97.size.width = v39;
    v97.size.height = v28;
    v90 = CGRectIntersection(v89, v97);
    v40 = v90.origin.x;
    v41 = v90.origin.y;
    v42 = v90.size.width;
    v43 = v90.size.height;
  }
  else
  {
    v42 = v39;
    v41 = 0.0;
    v43 = v28;
    v40 = 0.0;
  }
  v80 = 0.0;
  if (!objc_msgSend(a1, "_rectIsValid:", a3, a4, a5, a6))
    goto LABEL_21;
  v98.origin.x = 0.0;
  v98.origin.y = 0.0;
  v98.size.width = 1.0;
  v98.size.height = 1.0;
  v91.origin.x = a3;
  v91.origin.y = a4;
  v91.size.width = a5;
  v91.size.height = a6;
  if (CGRectEqualToRect(v91, v98)
    || !objc_msgSend(a1, "_rectIsValid:", v78, v77, v76, v75)
    || !objc_msgSend(a1, "_rectIsValid:", v40, v41, v42, v43))
  {
LABEL_21:
    v57 = v43;
    v56 = v42;
    v55 = v40;
    v46 = v77;
    v47 = v78;
    v44 = v75;
    v45 = v76;
    result = +[PFCropUtilities _interpolationCropForAspectRatio:acceptableRect:andPreferredRect:andImageRect:outputCropScore:](PFCropUtilities, "_interpolationCropForAspectRatio:acceptableRect:andPreferredRect:andImageRect:outputCropScore:", &v80, a2, v78, v77, v76, v75, *(_QWORD *)&v55, *(_QWORD *)&v41, *(_QWORD *)&v56, *(_QWORD *)&v57, 0, 0, *(_QWORD *)&v79, *(_QWORD *)&v28);
    if (!a10)
      goto LABEL_23;
    goto LABEL_22;
  }
  v60 = v43;
  v59 = v42;
  v58 = v40;
  v44 = v75;
  v45 = v76;
  v46 = v77;
  v47 = v78;
  result = +[PFCropUtilities _interpolationV2CropForAspectRatio:withFocusRegion:andAcceptableRect:andPreferredRect:andImageRect:outputCropScore:](PFCropUtilities, "_interpolationV2CropForAspectRatio:withFocusRegion:andAcceptableRect:andPreferredRect:andImageRect:outputCropScore:", &v80, a2, a3, 1.0 - (a4 + a6), a5, a6, *(_QWORD *)&v78, *(_QWORD *)&v77, *(_QWORD *)&v76, *(_QWORD *)&v75, *(_QWORD *)&v58, *(_QWORD *)&v41, *(_QWORD *)&v59, *(_QWORD *)&v60, 0, 0, *(_QWORD *)&v79,
             *(_QWORD *)&v28);
  if (a10)
LABEL_22:
    *a10 = v80;
LABEL_23:
  if (v80 < 0.5 && v34)
  {
    v99.origin.x = v47;
    v99.origin.y = v46;
    v99.size.width = v45;
    v99.size.height = v44;
    v50 = CGRectEqualToRect(*(CGRect *)v61, v99);
    if (v50)
      v51 = r1_24;
    else
      v51 = *(double *)v61;
    if (v50)
      v52 = r1_16;
    else
      v52 = *(double *)&v61[8];
    if (v50)
      v53 = r1_8;
    else
      v53 = *(double *)&v61[16];
    if (v50)
      v54 = v67;
    else
      v54 = *(double *)&v61[24];
    return +[PFCropUtilities _interpolationCropForAspectRatio:acceptableRect:andPreferredRect:andImageRect:outputCropScore:](PFCropUtilities, "_interpolationCropForAspectRatio:acceptableRect:andPreferredRect:andImageRect:outputCropScore:", 0, a2, v51, v52, v53, v54, *(_QWORD *)&v47, *(_QWORD *)&v46, *(_QWORD *)&v45, *(_QWORD *)&v44, 0, 0, *(_QWORD *)&v79, *(_QWORD *)&v28);
  }
  return result;
}

+ (BOOL)_rectIsValid:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  BOOL v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsNull(a3))
    return 0;
  v7 = height > 0.0;
  if (width <= 0.0)
    v7 = 0;
  if (y < 0.0)
    v7 = 0;
  return x >= 0.0 && v7;
}

+ (double)_interpolationWithFactor:(double)a3 between:(double)a4 and:(double)a5
{
  return a4 + a3 * (a5 - a4);
}

+ (double)_interpolationFactorFor:(double)a3 between:(double)a4 and:(double)a5
{
  double v6;
  double result;

  v6 = a5 - a4;
  result = 0.5;
  if (v6 > 0.0)
    return (a3 - a4) / v6;
  return result;
}

+ (uint64_t)_interpolationCropForAspectRatio:(uint64_t)a3 andZoom:(uint64_t)a4 acceptableRect:(uint64_t)a5 andPreferredRect:(double)a6 andImageRect:(double)a7 outputCropScore:(double)a8
{
  +[PFCropUtilities _interpolationCropSizeForRatio:andZoom:forImageSize:](PFCropUtilities, "_interpolationCropSizeForRatio:andZoom:forImageSize:", a1, a2, a18, a19);
  return +[PFCropUtilities _interpolationCropToSize:withinRect:withPreferredRect:andAcceptableRect:outputScore:](PFCropUtilities, "_interpolationCropToSize:withinRect:withPreferredRect:andAcceptableRect:outputScore:", a5);
}

+ (CGSize)_interpolationCropSizeForRatio:(double)a3 andZoom:(double)a4 forImageSize:(CGSize)a5
{
  double width;
  double v6;
  double height;
  double v8;
  double v9;
  CGSize result;

  width = a5.height * a3;
  if (a5.width < a5.height * a3)
    width = a5.width;
  v6 = width / a4;
  height = a5.width / a3;
  if (a5.height < height)
    height = a5.height;
  v8 = height / a4;
  v9 = v6;
  result.height = v8;
  result.width = v9;
  return result;
}

+ (uint64_t)_interpolationCropForAspectRatio:(double)a3 acceptableRect:(double)a4 andPreferredRect:(double)a5 andImageRect:(double)a6 outputCropScore:(double)a7
{
  return objc_msgSend(a1, "_interpolationCropForAspectRatio:andZoom:acceptableRect:andPreferredRect:andImageRect:outputCropScore:", a3, 1.0, a4, a5, a6, a7);
}

+ (CGRect)_faceAreaRectWithPadding:(CGRect)a3
{
  double height;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  if (a3.size.width >= a3.size.height)
    height = a3.size.height;
  else
    height = a3.size.width;
  v4 = a3.origin.x + height * -0.1;
  v5 = a3.origin.y + height * -0.25;
  v6 = a3.size.width + height * 0.2;
  v7 = a3.size.height + height * 0.75;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (uint64_t)bestCropRectForAspectRatio:verticalContentMode:cropMode:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:
{
  return +[PFCropUtilitiesCore bestCropRectForAspectRatio:verticalContentMode:cropMode:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:](PFCropUtilitiesCore, "bestCropRectForAspectRatio:verticalContentMode:cropMode:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:");
}

+ (CGRect)bestCropRectV2ForAspectRatio:(double)a3 sourcePixelWidth:(unint64_t)a4 sourcePixelHeight:(unint64_t)a5 sourceEssentialAreaRect:(CGRect)a6 sourceSecondaryEssentialAreaRect:(CGRect)a7
{
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  +[PFCropUtilities bestCropRectV2ForAspectRatio:sourcePixelWidth:sourcePixelHeight:sourceEssentialAreaRect:sourceSecondaryEssentialAreaRect:outputCropScore:](PFCropUtilities, "bestCropRectV2ForAspectRatio:sourcePixelWidth:sourcePixelHeight:sourceEssentialAreaRect:sourceSecondaryEssentialAreaRect:outputCropScore:", a4, a5, 0, a3, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

+ (CGRect)bestCropRectV2ForAspectRatio:(double)a3 zoom:(double)a4 sourcePixelWidth:(unint64_t)a5 sourcePixelHeight:(unint64_t)a6 sourceEssentialAreaRect:(CGRect)a7 sourceSecondaryEssentialAreaRect:(CGRect)a8 outputCropScore:(double *)a9
{
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double width;
  double height;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double y;
  double v31;
  double x;
  double v33;
  uint64_t v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect result;
  CGRect v42;
  CGRect v43;

  v12 = (double)a5;
  v13 = (double)a6;
  v14 = a7.origin.x * (double)a5 + 0.0;
  v15 = a7.origin.y * (double)a6 + 0.0;
  v16 = a7.size.width * (double)a5;
  v17 = a7.size.height * (double)a6;
  v33 = a8.origin.x * (double)a5 + 0.0;
  v31 = a8.origin.y * (double)a6 + 0.0;
  v18 = a8.size.width * (double)a5;
  v19 = a8.size.height * (double)a6;
  if (+[PFCropUtilities _rectIsValid:](PFCropUtilities, "_rectIsValid:", v14, v15, v16, v17))
  {
    v42.origin.x = 0.0;
    v42.origin.y = 0.0;
    v37.origin.x = v14;
    v37.origin.y = v15;
    v37.size.width = v16;
    v37.size.height = v17;
    v42.size.width = v12;
    v42.size.height = v13;
    v38 = CGRectIntersection(v37, v42);
    x = v38.origin.x;
    y = v38.origin.y;
    width = v38.size.width;
    height = v38.size.height;
  }
  else
  {
    x = *MEMORY[0x1E0C9D628];
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  if (+[PFCropUtilities _rectIsValid:](PFCropUtilities, "_rectIsValid:", v33, v31, v18, v19))
  {
    v43.origin.x = 0.0;
    v43.origin.y = 0.0;
    v39.origin.x = v33;
    v39.origin.y = v31;
    v39.size.width = v18;
    v39.size.height = v19;
    v43.size.width = v12;
    v43.size.height = v13;
    v40 = CGRectIntersection(v39, v43);
  }
  else
  {
    v40.origin.y = 0.0;
    v40.size.height = v13;
    v40.size.width = v12;
    v40.origin.x = 0.0;
  }
  v36 = 0;
  +[PFCropUtilities _interpolationCropForAspectRatio:andZoom:acceptableRect:andPreferredRect:andImageRect:outputCropScore:](PFCropUtilities, "_interpolationCropForAspectRatio:andZoom:acceptableRect:andPreferredRect:andImageRect:outputCropScore:", &v36, a3, a4, x, y, width, height, *(_QWORD *)&v40.origin.x, *(_QWORD *)&v40.origin.y, *(_QWORD *)&v40.size.width, *(_QWORD *)&v40.size.height, 0, 0, *(_QWORD *)&v12, *(_QWORD *)&v13);
  v26 = v25;
  if (a9)
    *(_QWORD *)a9 = v36;
  v27 = 0.0;
  if (!a5)
  {
    v28 = 0.0;
    if (!a6)
      goto LABEL_12;
    goto LABEL_11;
  }
  v22 = v22 / v12;
  v28 = v24 / v12;
  if (a6)
  {
LABEL_11:
    v23 = v23 / v13;
    v27 = v26 / v13;
  }
LABEL_12:
  v29 = 1.0 - (v27 + v23);
  result.size.height = v27;
  result.size.width = v28;
  result.origin.y = v29;
  result.origin.x = v22;
  return result;
}

+ (CGRect)bestCropRectV2ForAspectRatio:(double)a3 sourcePixelWidth:(unint64_t)a4 sourcePixelHeight:(unint64_t)a5 sourceEssentialAreaRect:(CGRect)a6 sourceSecondaryEssentialAreaRect:(CGRect)a7 outputCropScore:(double *)a8
{
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  objc_msgSend(a1, "bestCropRectV2ForAspectRatio:zoom:sourcePixelWidth:sourcePixelHeight:sourceEssentialAreaRect:sourceSecondaryEssentialAreaRect:outputCropScore:", a4, a5, a8, a3, 1.0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

+ (uint64_t)scoreForCropRect:(double)a3 sourcePixelWidth:(double)a4 sourcePixelHeight:(double)a5 sourceEssentialAreaRect:(double)a6 sourceSecondaryEssentialAreaRect:(double)a7
{
  return +[PFCropUtilities _interpolationV2ScoreForCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:](PFCropUtilities, "_interpolationV2ScoreForCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:", a1, a2, a3, a4, 0.0, 0.0, (double)a11, (double)a12, a17, a18, a19, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8);
}

+ (double)bestCropRectV2ForPosterClassification:(double)a3 layoutConfiguration:(double)a4 sourcePixelWidth:(double)a5 sourcePixelHeight:(double)a6 sourcePreferredCropRectNormalized:(double)a7 sourceAcceptableCropRectNormalized:(double)a8 sourceFaceAreaRectNormalized:(uint64_t)a9 outputCropScore:(uint64_t)a10 outputLayoutScore:(unint64_t)a11 outputClockOverlapAcceptable:(void *)a12
{
  double v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  BOOL v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  PFParallaxLayoutHelper *v58;
  void *v59;
  double v60;
  double v61;
  float v62;
  float v63;
  double v64;
  double v65;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  uint64_t v75;
  uint64_t v77;
  uint64_t v79;
  uint64_t v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  _BYTE buf[12];
  __int16 v89;
  double v90;
  __int16 v91;
  uint64_t v92;
  uint64_t v93;

  v28 = a17;
  v93 = *MEMORY[0x1E0C80C00];
  v29 = a12;
  objc_msgSend(v29, "screenSize");
  v32 = v30;
  v33 = v31;
  if (v30 == 0.0
    || v31 == 0.0
    || (v30 == *MEMORY[0x1E0D71130] ? (v34 = v31 == *(double *)(MEMORY[0x1E0D71130] + 8)) : (v34 = 0), v34))
  {
    v67 = 1.0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(double *)&buf[4] = v32;
      v89 = 2048;
      v90 = v33;
      v91 = 2048;
      v92 = 0x3FF0000000000000;
      _os_log_fault_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
    }
  }
  else
  {
    v67 = fabs(v30 / v31);
  }
  if (+[PFCropUtilities _rectIsValid:](PFCropUtilities, "_rectIsValid:", a17, a18, a19, a20))
  {
    v35 = 1.0 - (a18 + a20);
    v36 = *MEMORY[0x1E0C9D628];
    v37 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v38 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v39 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v40 = a19;
    v41 = a20;
  }
  else
  {
    v36 = *MEMORY[0x1E0C9D628];
    v37 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v38 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v39 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v28 = *MEMORY[0x1E0C9D628];
    v35 = v37;
    v40 = v38;
    v41 = v39;
  }
  v71 = v35;
  v82 = (double)a14;
  v69 = v38;
  v70 = v39;
  v68 = v37;
  v83 = v36;
  +[PFParallaxLayoutUtilities effectiveAcceptableRectForClassification:havePetFaces:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:sourceGazeAreaRectNormalized:](PFParallaxLayoutUtilities, "effectiveAcceptableRectForClassification:havePetFaces:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:sourceGazeAreaRectNormalized:", a11, 0, a1, a2, a3, a4, a5, a6, a7, a8, *(_QWORD *)&v28, *(_QWORD *)&v35, *(_QWORD *)&v40, *(_QWORD *)&v41, *(_QWORD *)&v36, *(_QWORD *)&v37,
    *(_QWORD *)&v38,
    *(_QWORD *)&v39);
  v86 = v43;
  v87 = v42;
  v84 = v45;
  v85 = v44;
  +[PFParallaxLayoutUtilities effectivePreferredRectForClassification:havePetFaces:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:](PFParallaxLayoutUtilities, "effectivePreferredRectForClassification:havePetFaces:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:", a11, 0, a1, a2, a3, a4, a5, a6, a7, a8, *(_QWORD *)&v28, *(_QWORD *)&v71, *(_QWORD *)&v40, *(_QWORD *)&v41);
  v79 = v48;
  v81 = v47;
  v75 = v46;
  v77 = v49;
  if (a11 > 5)
  {
    v50 = (double)a13;
    v54 = 0.0;
    v55 = 0.0;
    v56 = 0.0;
    v57 = 0.0;
  }
  else
  {
    if (((1 << a11) & 0x39) != 0)
    {
      v50 = (double)a13;
      v51 = v68;
      v52 = v69;
      v53 = v70;
      +[PFCropUtilities bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:](PFCropUtilities, "bestCropRectV2ForAspectRatio:withFocusRegion:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:", a13, a14, a15, v67, v83, v68, v69, v70, v46, v47, v48, v49, *(_QWORD *)&v87, *(_QWORD *)&v86, *(_QWORD *)&v85, *(_QWORD *)&v84,
        *(_QWORD *)&a17,
        *(_QWORD *)&a18,
        *(_QWORD *)&a19,
        *(_QWORD *)&a20);
      goto LABEL_20;
    }
    v50 = (double)a13;
    *(_QWORD *)buf = 0;
    +[PFCropUtilities bestCropRectV2ForAspectRatio:sourcePixelWidth:sourcePixelHeight:sourceEssentialAreaRect:sourceSecondaryEssentialAreaRect:outputCropScore:](PFCropUtilities, "bestCropRectV2ForAspectRatio:sourcePixelWidth:sourcePixelHeight:sourceEssentialAreaRect:sourceSecondaryEssentialAreaRect:outputCropScore:", a13, a14, buf, v67, v87, v86, v85, v84, v46, v47, v48, v49);
    if (a15)
      *a15 = *(double *)buf;
  }
  v51 = v68;
  v52 = v69;
  v53 = v70;
LABEL_20:
  v58 = -[PFParallaxLayoutHelper initWithPosterClassification:initialRect:imageSize:effectiveAcceptableRect:effectivePreferredRect:validBoundsNormalized:headroomFeasible:hasTopEdgeContact:layoutType:layoutConfiguration:]([PFParallaxLayoutHelper alloc], "initWithPosterClassification:initialRect:imageSize:effectiveAcceptableRect:effectivePreferredRect:validBoundsNormalized:headroomFeasible:hasTopEdgeContact:layoutType:layoutConfiguration:", a11, 0, 0, +[PFParallaxLayoutUtilities layoutTypeFromLayoutConfiguration:](PFParallaxLayoutUtilities, "layoutTypeFromLayoutConfiguration:", v29), v29, v54 * v50 + 0.0, v55 * v82 + 0.0, v56 * v50, v57 * v82, v50, v82, *(_QWORD *)&v87, *(_QWORD *)&v86,
          *(_QWORD *)&v85,
          *(_QWORD *)&v84,
          v75,
          v81,
          v79,
          v77,
          *(_QWORD *)&v83,
          *(_QWORD *)&v51,
          *(_QWORD *)&v52,
          *(_QWORD *)&v53);
  +[PFParallaxLayoutUtilities computeLayoutWithHelper:](PFParallaxLayoutUtilities, "computeLayoutWithHelper:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "visibleRect");
  v61 = v60;
  if (a13)
    v61 = v60 / v50;
  +[PFParallaxLayoutUtilities headroomPenaltyForIntermediateLayout:originalFullExtent:layoutConfiguration:](PFParallaxLayoutUtilities, "headroomPenaltyForIntermediateLayout:originalFullExtent:layoutConfiguration:", v59, v29, 0.0, 0.0, v50, v82);
  v63 = v62;
  if (a15)
  {
    objc_msgSend(v59, "cropScore");
    *a15 = v64 - v63;
  }
  if (a16)
  {
    objc_msgSend(v59, "layoutScore");
    *a16 = v65 - v63;
  }
  if (a21)
    *a21 = objc_msgSend(v59, "clockOverlapAcceptableForLayoutConfiguration:", v29);

  return v61;
}

+ (double)_interpolationV2CropForAspectRatio:(double)a3 withFocusRegion:(double)a4 andAcceptableRect:(double)a5 andPreferredRect:(uint64_t)a6 andImageRect:(uint64_t)a7 outputCropScore:(double *)a8
{
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v37;

  +[PFCropUtilities _interpolationV2MaxCropSizeForAspectRatio:andZoom:withFocusRegion:forImageSize:withImportantRect:](PFCropUtilities, "_interpolationV2MaxCropSizeForAspectRatio:andZoom:withFocusRegion:forImageSize:withImportantRect:", a1, 1.0, a2, a3, a4, a5, a27, a28, a17, a18, a19, a20);
  +[PFCropUtilities _interpolationCropToSize:withinRect:withPreferredRect:andAcceptableRect:outputScore:](PFCropUtilities, "_interpolationCropToSize:withinRect:withPreferredRect:andAcceptableRect:outputScore:", a8, a21, a22, a23, a24, a17, a18, a19, a20);
  +[PFCropUtilities _interpolationV2AdjustedCrop:toFocusRegion:withFullsizeRect:andImportantRect:](PFCropUtilities, "_interpolationV2AdjustedCrop:toFocusRegion:withFullsizeRect:andImportantRect:", *(_QWORD *)&a25, *(_QWORD *)&a26, *(_QWORD *)&a27, *(_QWORD *)&a28, a17, a18, a19, a20);
  v30 = v26;
  v31 = v27;
  v32 = v28;
  v33 = v29;
  if (a8)
  {
    +[PFCropUtilities _interpolationV2ScoreForCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:](PFCropUtilities, "_interpolationV2ScoreForCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:", v26, v27, v28, v29, a25, a26, a27, a28, a21, a22, a23, a24, a17, a18, a19, a20);
    v37 = v34;
    +[PFCropUtilities _interpolationV2ScoreForFocusRegion:insideCropRect:withImportantRect:](PFCropUtilities, "_interpolationV2ScoreForFocusRegion:insideCropRect:withImportantRect:", a2, a3, a4, a5, v30, v31, v32, v33, a17, a18, a19, a20);
    *a8 = v37 * v35;
  }
  return v30;
}

+ (uint64_t)_interpolationV2MaxCropSizeForAspectRatio:(double)a3 andZoom:(double)a4 withFocusRegion:(double)a5 forImageSize:(double)a6 withImportantRect:(double)a7
{
  double v22;
  double v23;

  v23 = *MEMORY[0x1E0C9D538];
  v22 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  +[PFCropUtilities _rectDimensionSize:forEdge:](PFCropUtilities, "_rectDimensionSize:forEdge:", 0, a9, a10, a11, a12);
  +[PFCropUtilities _rectDimensionSize:forEdge:](PFCropUtilities, "_rectDimensionSize:forEdge:", 1, a9, a10, a11, a12);
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", 0, a9, a10, a11, a12, v23, v22, a7, a8);
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", 2, a9, a10, a11, a12, v23, v22, a7, a8);
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", 1, a9, a10, a11, a12, v23, v22, a7, a8);
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", 3, a9, a10, a11, a12, v23, v22, a7, a8);
  +[PFCropUtilities _rectDimensionSize:forEdge:](PFCropUtilities, "_rectDimensionSize:forEdge:", 0, a3, a4, a5, a6);
  +[PFCropUtilities _rectDimensionSize:forEdge:](PFCropUtilities, "_rectDimensionSize:forEdge:", 1, a3, a4, a5, a6);
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", 0, a3, a4, a5, a6, 0.0, 0.0, 1.0, 1.0);
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", 2, a3, a4, a5, a6, 0.0, 0.0, 1.0, 1.0);
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", 1, a3, a4, a5, a6, 0.0, 0.0, 1.0, 1.0);
  return +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", 3, a3, a4, a5, a6, 0.0, 0.0, 1.0, 1.0);
}

+ (double)_interpolationV2AdjustedCrop:(double)a3 toFocusRegion:(double)a4 withFullsizeRect:(double)a5 andImportantRect:(double)a6
{
  double v28;
  double v29;
  double v30;
  double v31;

  +[PFCropUtilities _translationToIncludeRect:insideRect:](PFCropUtilities, "_translationToIncludeRect:insideRect:", a13, a14, a15, a16, a1 + a5 * a3, a2 + a6 * a4, a3 * a7, a4 * a8);
  v29 = a1 - v28;
  +[PFCropUtilities _translationToIncludeRect:insideRect:](PFCropUtilities, "_translationToIncludeRect:insideRect:", v29, a2 - v30, a3, a4, a9, a10, a11, a12);
  return v29 + v31;
}

+ (uint64_t)_interpolationV2ScoreForCrop:(double)a3 withFullsizeRect:(double)a4 andPreferredRect:(double)a5 andAcceptableRect:(double)a6
{
  +[PFCropUtilities _interpolationV2ScoreAlongEdge:forCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:](PFCropUtilities, "_interpolationV2ScoreAlongEdge:forCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:", 0, a17, a18, a19, a20, a21, a22, a23, a24);
  +[PFCropUtilities _interpolationV2ScoreAlongEdge:forCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:](PFCropUtilities, "_interpolationV2ScoreAlongEdge:forCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:", 2, a1, a2, a3, a4, a5, a6, a7, a8, a17, a18, a19, a20, a21, a22, a23, a24);
  +[PFCropUtilities _interpolationV2ScoreAlongEdge:forCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:](PFCropUtilities, "_interpolationV2ScoreAlongEdge:forCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:", 1, a1, a2, a3, a4, a5, a6, a7, a8, a17, a18, a19, a20, a21, a22, a23, a24);
  return +[PFCropUtilities _interpolationV2ScoreAlongEdge:forCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:](PFCropUtilities, "_interpolationV2ScoreAlongEdge:forCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:", 3, a1, a2, a3, a4, a5, a6, a7, a8, a17, a18, a19, a20, a21, a22, a23, a24);
}

+ (CGFloat)_interpolationV2ScoreForFocusRegion:(double)a3 insideCropRect:(double)a4 withImportantRect:(double)a5
{
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v23.origin.x = a5 + a1 * a7;
  v23.origin.y = a6 + a2 * a8;
  v23.size.width = a3 * a7;
  v23.size.height = a4 * a8;
  v21.origin.x = a9;
  v21.origin.y = a10;
  v21.size.width = a11;
  v21.size.height = a12;
  v22 = CGRectIntersection(v21, v23);
  return v22.size.width * v22.size.height / (a11 * a12);
}

+ (uint64_t)_interpolationV2ScoreAlongEdge:(double)a3 forCrop:(double)a4 withFullsizeRect:(double)a5 andPreferredRect:(double)a6 andAcceptableRect:(double)a7
{
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t result;
  double v34;
  double v35;
  double v36;

  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", a1, a2, a3, a4, a5);
  v36 = v29;
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", a11, a12, a13, a14, a15, a5, a6, a7, a8);
  v35 = v30;
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", a11, a16, a17, a18, a19, a5, a6, a7, a8);
  v32 = v31;
  result = +[PFCropUtilities _rectDimensionSize:forEdge:](PFCropUtilities, "_rectDimensionSize:forEdge:", a11, a16, a17, a18, a19);
  if (v36 > 0.0)
  {
    if (v36 <= v35)
    {
      +[PFCropUtilities _interpolationFactorFor:between:and:](PFCropUtilities, "_interpolationFactorFor:between:and:", v36, 0.0);
    }
    else if (v36 <= v32)
    {
      +[PFCropUtilities _interpolationFactorFor:between:and:](PFCropUtilities, "_interpolationFactorFor:between:and:", v36, v35, v32);
    }
    else
    {
      if (v36 > v32 + v34)
        return result;
      +[PFCropUtilities _interpolationFactorFor:between:and:](PFCropUtilities, "_interpolationFactorFor:between:and:", v36, v32);
    }
    return +[PFCropUtilities _interpolationWithFactor:between:and:](PFCropUtilities, "_interpolationWithFactor:between:and:");
  }
  return result;
}

+ (double)_rectDimensionSize:(CGRect)a3 forEdge:(unsigned int)a4
{
  switch(a4)
  {
    case 0u:
    case 2u:
      a3.origin.x = a3.size.width;
      break;
    case 1u:
    case 3u:
      a3.origin.x = a3.size.height;
      break;
    default:
      return a3.origin.x;
  }
  return a3.origin.x;
}

+ (double)_rectDimensionOffset:(CGRect)a3 insideRect:(CGRect)a4 forEdge:(unsigned int)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.size.height;
  v10 = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.origin.x;
  switch(a5)
  {
    case 0u:
      MinX = CGRectGetMinX(a3);
      v18.origin.x = x;
      v18.origin.y = y;
      v18.size.width = width;
      v18.size.height = height;
      MinY = CGRectGetMinX(v18);
      goto LABEL_4;
    case 1u:
      MinX = CGRectGetMinY(a3);
      v19.origin.x = x;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      MinY = CGRectGetMinY(v19);
LABEL_4:
      a3.origin.x = MinX - MinY;
      return a3.origin.x;
    case 2u:
      MaxX = CGRectGetMaxX(a4);
      v20.origin.x = v12;
      v20.origin.y = v11;
      v20.size.width = v10;
      v20.size.height = v9;
      MaxY = CGRectGetMaxX(v20);
      goto LABEL_7;
    case 3u:
      MaxX = CGRectGetMaxY(a4);
      v21.origin.x = v12;
      v21.origin.y = v11;
      v21.size.width = v10;
      v21.size.height = v9;
      MaxY = CGRectGetMaxY(v21);
LABEL_7:
      a3.origin.x = MaxX - MaxY;
      break;
    default:
      return a3.origin.x;
  }
  return a3.origin.x;
}

+ (CGPoint)_translationToIncludeRect:(CGRect)a3 insideRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
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
  CGPoint result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", 0);
  v20 = v12;
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", 2, v11, v10, v9, v8, x, y, width, height);
  v19 = v13;
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", 1, v11, v10, v9, v8, x, y, width, height);
  v18 = v14;
  +[PFCropUtilities _rectDimensionOffset:insideRect:forEdge:](PFCropUtilities, "_rectDimensionOffset:insideRect:forEdge:", 3, v11, v10, v9, v8, x, y, width, height);
  v16 = fmin(v15, 0.0) - fmin(v18, 0.0);
  v17 = fmin(v19, 0.0) - fmin(v20, 0.0);
  result.y = v16;
  result.x = v17;
  return result;
}

@end
