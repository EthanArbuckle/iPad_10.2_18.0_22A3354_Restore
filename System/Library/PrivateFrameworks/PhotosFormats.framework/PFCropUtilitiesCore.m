@implementation PFCropUtilitiesCore

+ (uint64_t)bestCropRectForAspectRatio:verticalContentMode:cropMode:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:
{
  return +[PFCropUtilitiesCore _curatedLibraryCropForAspectRatio:verticalContentMode:cropMode:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:](PFCropUtilitiesCore, "_curatedLibraryCropForAspectRatio:verticalContentMode:cropMode:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:");
}

+ (uint64_t)bestCropRectV2ForAspectRatio:(CGFloat)a3 withFocusRegion:(double)a4 sourcePixelWidth:(CGFloat)a5 sourcePixelHeight:(uint64_t)a6 sourcePreferredCropRectNormalized:(uint64_t)a7 sourceAcceptableCropRectNormalized:(unint64_t)a8 sourceFaceAreaRectNormalized:(unint64_t)a9 outputCropScore:(double *)a10
{
  double v26;
  double v27;
  double v28;
  double v29;
  int v30;
  int v31;
  double x;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double height;
  double width;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  BOOL v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  uint64_t result;
  double v60;
  int v61;
  _BOOL4 v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double y;
  double v76;
  double v77;
  double v81;
  double r2;
  double v83;
  double r1;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  CGFloat v92;
  double v93;
  double v94;
  double v95;
  double v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;

  v26 = (double)a8;
  v27 = (double)a9;
  v88 = a14 * (double)a8 + 0.0;
  v94 = a15 * (double)a9 + 0.0;
  v76 = a16 * (double)a8;
  v77 = a17 * (double)a9;
  v83 = a19 * (double)a9 + 0.0;
  v86 = a20 * (double)a8;
  v87 = a18 * (double)a8 + 0.0;
  r1 = a21 * (double)a9;
  v28 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v95 = *MEMORY[0x1E0C9D628];
  v29 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v93 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v97.origin.x = a22;
  v97.origin.y = a23;
  v97.size.width = a24;
  v97.size.height = a25;
  v30 = (a22 >= 0.0) & ~CGRectIsNull(v97);
  if (a23 < 0.0)
    v30 = 0;
  if (a24 <= 0.0)
    v30 = 0;
  if (a25 > 0.0)
    v31 = v30;
  else
    v31 = 0;
  v89 = v29;
  v90 = v28;
  v92 = v26;
  if (v31 != 1)
  {
    v81 = v93;
    r2 = v29;
    y = v28;
    v74 = v95;
    v43 = r1;
    width = v86;
    v40 = v83;
    x = v87;
LABEL_28:
    v42 = v76;
    v41 = v77;
    goto LABEL_29;
  }
  x = v87;
  v33 = a22 * v26 + 0.0;
  v98.size.width = a24 * v26;
  v98.origin.x = v33;
  v98.origin.y = (1.0 - (a23 + a25)) * v27 + 0.0;
  r2 = a24 * v26;
  v98.size.height = a25 * v27;
  v74 = v33;
  y = v98.origin.y;
  v81 = a25 * v27;
  if (CGRectIsNull(v98))
  {
    v43 = r1;
    width = v86;
LABEL_83:
    v40 = v83;
    goto LABEL_28;
  }
  v35 = r1;
  v34 = v86;
  if (v33 < 0.0)
  {
    v43 = r1;
    width = v86;
    goto LABEL_83;
  }
  if ((1.0 - (a23 + a25)) * v27 + 0.0 < 0.0 || r2 <= 0.0 || a25 * v27 <= 0.0)
  {
    v43 = r1;
    width = v86;
    v40 = v83;
    goto LABEL_28;
  }
  v36 = v87;
  v37 = v83;
  height = a25 * v27;
  width = r2;
  v40 = (1.0 - (a23 + a25)) * v27 + 0.0;
  x = v33;
  if (!CGRectIsNull(*(CGRect *)(&v34 - 2)))
  {
    height = a25 * v27;
    width = r2;
    v40 = (1.0 - (a23 + a25)) * v27 + 0.0;
    x = v33;
    if (v87 >= 0.0)
    {
      height = a25 * v27;
      width = r2;
      v40 = (1.0 - (a23 + a25)) * v27 + 0.0;
      x = v33;
      if (v83 >= 0.0)
      {
        height = a25 * v27;
        width = r2;
        v40 = (1.0 - (a23 + a25)) * v27 + 0.0;
        x = v33;
        if (v86 > 0.0)
        {
          height = a25 * v27;
          width = r2;
          v40 = (1.0 - (a23 + a25)) * v27 + 0.0;
          x = v33;
          if (r1 > 0.0)
          {
            v99.size.width = v86;
            v99.origin.x = v87;
            v99.origin.y = v83;
            v99.size.height = r1;
            v116.origin.x = v33;
            v116.origin.y = (1.0 - (a23 + a25)) * v27 + 0.0;
            v116.size.width = r2;
            v116.size.height = a25 * v27;
            v100 = CGRectUnion(v99, v116);
            x = v100.origin.x;
            v40 = v100.origin.y;
            width = v100.size.width;
            height = v100.size.height;
          }
        }
      }
    }
  }
  v101.origin.x = v88;
  v101.origin.y = v94;
  v42 = v76;
  v41 = v77;
  v101.size.width = v76;
  v101.size.height = v77;
  if (CGRectIsNull(v101))
  {
    v43 = height;
    goto LABEL_85;
  }
  v43 = height;
  if (v88 < 0.0)
  {
LABEL_85:
    v26 = v92;
    goto LABEL_29;
  }
  v26 = v92;
  if (v94 >= 0.0 && v76 > 0.0 && v77 > 0.0)
  {
    +[PFCropUtilitiesCore _faceAreaRectWithPadding:](PFCropUtilitiesCore, "_faceAreaRectWithPadding:", v74, y, r2, v81);
    v117.origin.x = 0.0;
    v117.origin.y = 0.0;
    v117.size.width = v92;
    v117.size.height = v27;
    v118 = CGRectIntersection(v102, v117);
    v103.origin.x = v88;
    v103.origin.y = v94;
    v103.size.width = v76;
    v103.size.height = v77;
    v104 = CGRectUnion(v103, v118);
    v88 = v104.origin.x;
    v94 = v104.origin.y;
    v42 = v104.size.width;
    v41 = v104.size.height;
  }
LABEL_29:
  v105.origin.x = x;
  v105.origin.y = v40;
  v105.size.width = width;
  v105.size.height = v43;
  if (!CGRectIsNull(v105) && x >= 0.0 && v40 >= 0.0 && width > 0.0 && v43 > 0.0)
  {
    v119.origin.x = 0.0;
    v119.origin.y = 0.0;
    v106.origin.x = x;
    v106.origin.y = v40;
    v106.size.width = width;
    v106.size.height = v43;
    v119.size.width = v26;
    v119.size.height = v27;
    v107 = CGRectIntersection(v106, v119);
    v95 = v107.origin.x;
    v89 = v107.size.width;
    v90 = v107.origin.y;
    v93 = v107.size.height;
  }
  v108.origin.x = v88;
  v108.origin.y = v94;
  v108.size.width = v42;
  v108.size.height = v41;
  v44 = 0.0;
  if (CGRectIsNull(v108))
  {
    v50 = v27;
    v51 = v26;
    v52 = 0.0;
    v46 = a2;
    v45 = a4;
  }
  else
  {
    v46 = a2;
    v45 = a4;
    if (v88 < 0.0 || v94 < 0.0 || v42 <= 0.0)
    {
      v50 = v27;
      v51 = v26;
      v52 = 0.0;
    }
    else
    {
      v47 = v42;
      v48 = v41 <= 0.0;
      v49 = v41;
      v50 = v27;
      v51 = v26;
      v52 = 0.0;
      if (!v48)
      {
        v53 = v88;
        v120.size.width = v89;
        v54 = v94;
        v120.origin.x = v95;
        v120.origin.y = v90;
        v120.size.height = v93;
        v109 = CGRectUnion(*(CGRect *)(&v47 - 2), v120);
        v121.origin.x = 0.0;
        v121.origin.y = 0.0;
        v121.size.width = v26;
        v121.size.height = v27;
        v110 = CGRectIntersection(v109, v121);
        v52 = v110.origin.x;
        v44 = v110.origin.y;
        v51 = v110.size.width;
        v50 = v110.size.height;
      }
    }
  }
  v96 = 0.0;
  v111.origin.x = v46;
  v111.origin.y = a3;
  v111.size.width = v45;
  v111.size.height = a5;
  if (CGRectIsNull(v111))
    goto LABEL_48;
  if (v46 < 0.0)
    goto LABEL_48;
  if (a3 < 0.0)
    goto LABEL_48;
  if (v45 <= 0.0)
    goto LABEL_48;
  if (a5 <= 0.0)
    goto LABEL_48;
  v122.origin.x = 0.0;
  v122.origin.y = 0.0;
  v122.size.width = 1.0;
  v122.size.height = 1.0;
  v112.origin.x = v46;
  v112.origin.y = a3;
  v112.size.width = v45;
  v112.size.height = a5;
  if (CGRectEqualToRect(v112, v122))
    goto LABEL_48;
  v114.origin.x = v95;
  v114.size.width = v89;
  v114.origin.y = v90;
  v114.size.height = v93;
  if (CGRectIsNull(v114)
    || v95 < 0.0
    || v90 < 0.0
    || v89 <= 0.0
    || v93 <= 0.0
    || (v115.origin.x = v52, v115.origin.y = v44, v115.size.width = v51, v115.size.height = v50, CGRectIsNull(v115))
    || v52 < 0.0
    || v44 < 0.0
    || v51 <= 0.0
    || v50 <= 0.0)
  {
LABEL_48:
    v69 = v51;
    v70 = v50;
    v68 = v52;
    v55 = v95;
    v57 = v89;
    v56 = v90;
    v58 = v93;
    result = +[PFCropUtilitiesCore _interpolationCropForAspectRatio:acceptableRect:andPreferredRect:andImageRect:outputCropScore:](PFCropUtilitiesCore, "_interpolationCropForAspectRatio:acceptableRect:andPreferredRect:andImageRect:outputCropScore:", &v96, a1, v95, v90, v89, *(_QWORD *)&v68, *(_QWORD *)&v44, *(_QWORD *)&v69, *(_QWORD *)&v70, 0, 0, *(_QWORD *)&v92, *(_QWORD *)&v27);
  }
  else
  {
    v72 = v51;
    v73 = v50;
    v71 = v52;
    v67 = v46;
    v58 = v93;
    v57 = v89;
    v56 = v90;
    v55 = v95;
    result = +[PFCropUtilitiesCore _interpolationV2CropForAspectRatio:withFocusRegion:andAcceptableRect:andPreferredRect:andImageRect:outputCropScore:](PFCropUtilitiesCore, "_interpolationV2CropForAspectRatio:withFocusRegion:andAcceptableRect:andPreferredRect:andImageRect:outputCropScore:", &v96, a1, v67, 1.0 - (a3 + a5), v45, a5, *(_QWORD *)&v95, *(_QWORD *)&v90, *(_QWORD *)&v89, *(_QWORD *)&v93, *(_QWORD *)&v71, *(_QWORD *)&v44, *(_QWORD *)&v72, *(_QWORD *)&v73, 0, 0, *(_QWORD *)&v92,
               *(_QWORD *)&v27);
  }
  v60 = v96;
  if (a10)
    *a10 = v96;
  if (v60 < 0.5)
    v61 = v31;
  else
    v61 = 0;
  if (v61 == 1)
  {
    v123.origin.x = v55;
    v113.origin.x = v74;
    v113.origin.y = y;
    v113.size.width = r2;
    v113.size.height = v81;
    v123.origin.y = v56;
    v123.size.width = v57;
    v123.size.height = v58;
    v62 = CGRectEqualToRect(v113, v123);
    if (v62)
      v63 = v87;
    else
      v63 = v74;
    if (v62)
      v64 = v83;
    else
      v64 = y;
    if (v62)
      v65 = v86;
    else
      v65 = r2;
    if (v62)
      v66 = r1;
    else
      v66 = v81;
    return +[PFCropUtilitiesCore _interpolationCropForAspectRatio:acceptableRect:andPreferredRect:andImageRect:outputCropScore:](PFCropUtilitiesCore, "_interpolationCropForAspectRatio:acceptableRect:andPreferredRect:andImageRect:outputCropScore:", 0, a1, v63, v64, v65, v66, *(_QWORD *)&v55, *(_QWORD *)&v56, *(_QWORD *)&v57, *(_QWORD *)&v58, 0, 0, *(_QWORD *)&v92, *(_QWORD *)&v27);
  }
  return result;
}

+ (void)_curatedLibraryCropForAspectRatio:(CGFloat)a3 verticalContentMode:(CGFloat)a4 cropMode:(CGFloat)a5 sourcePixelWidth:(uint64_t)a6 sourcePixelHeight:(uint64_t)a7 sourcePreferredCropRectNormalized:(uint64_t)a8 sourceAcceptableCropRectNormalized:(uint64_t)a9 sourceFaceAreaRectNormalized:(unint64_t)a10
{
  double v23;
  double v24;
  double v25;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v35;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  BOOL IsNull;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  double x;
  double y;
  double width;
  double height;
  double v53;
  double v54;
  double v55;
  double v56;
  BOOL v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double rect_8;
  double rect_16;
  double v66;
  CGFloat v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  v23 = (double)a10;
  v24 = (double)a11;
  v25 = (double)a10 / (double)a11;
  if (!a11)
    v25 = 1.0;
  if (vabdd_f64(a1, v25) > 0.00000999999975)
  {
    PFSizeWithAspectRatioFittingSize();
    v31 = v29;
    v32 = v23 * 0.5 + 0.0 + v29 * -0.5;
    v66 = v30;
    v33 = v24 * 0.5 + 0.0 + v30 * -0.5;
    if (a9 == 1)
    {
      +[PFCropUtilitiesCore _curatedLibraryAdjustedRectWithFaceAreaRect:proposedCropRect:assetRect:verticalContentMode:](PFCropUtilitiesCore, "_curatedLibraryAdjustedRectWithFaceAreaRect:proposedCropRect:assetRect:verticalContentMode:", a8, a19, a20, a21, a22, v32, v33, v29, v30, 0, 0, *(_QWORD *)&v23, *(_QWORD *)&v24);
    }
    else
    {
      v35 = a15;
      if (a9 == 3)
      {
        rect_8 = v23 * 0.5 + 0.0 + v31 * -0.5;
        rect_16 = v31;
        v70.origin.x = a19;
        v70.origin.y = a20;
        v70.size.width = a21;
        v70.size.height = a22;
        if (CGRectIsEmpty(v70))
        {
          v71.origin.x = a2;
          v71.origin.y = a3;
          v71.size.width = a4;
          v71.size.height = a5;
          IsNull = CGRectIsNull(v71);
          v38 = v66;
          v32 = rect_8;
          v31 = rect_16;
          if (IsNull)
            goto LABEL_18;
          PFLargestSalientAspectFilledCropRect();
          goto LABEL_17;
        }
      }
      else
      {
        if (a9 != 2)
        {
          v38 = v30;
          goto LABEL_18;
        }
        rect_8 = v23 * 0.5 + 0.0 + v31 * -0.5;
        rect_16 = v31;
        if (!CGRectIsNull(*(CGRect *)&v35))
        {
          v68.origin.x = a15;
          v68.origin.y = a16;
          v68.size.width = a17;
          v68.size.height = a18;
          if (!CGRectIsEmpty(v68))
          {
            PFLargestSalientAspectFilledCropRect();
            rect_8 = v44;
            rect_16 = v45;
            v33 = v46;
            v38 = v47;
            v74.origin.x = a19;
            v74.origin.y = a20;
            v74.size.width = a21;
            v74.size.height = a22;
            if (!CGRectIsEmpty(v74))
            {
              v75.size.width = a21 * v23 + a21 * v23;
              v75.size.height = a22 * v24 + a22 * v24;
              v75.origin.x = a19 * v23 + 0.0 + a21 * v23 * 0.5 + v75.size.width * -0.5;
              v75.origin.y = a20 * v24 + 0.0 + a22 * v24 * 0.5 + v75.size.height * -0.5;
              v78.origin.x = 0.0;
              v78.origin.y = 0.0;
              v78.size.width = v23;
              v78.size.height = v24;
              v76 = CGRectIntersection(v75, v78);
              v48 = v33;
              x = v76.origin.x;
              y = v76.origin.y;
              width = v76.size.width;
              height = v76.size.height;
              v76.origin.x = rect_8;
              v67 = v48;
              v76.origin.y = v48;
              v76.size.width = rect_16;
              v76.size.height = v38;
              v79.origin.x = x;
              v79.origin.y = y;
              v79.size.width = width;
              v79.size.height = height;
              if (CGRectContainsRect(v76, v79))
              {
                v33 = v67;
                v54 = rect_8;
                v53 = rect_16;
              }
              else
              {
                v55 = x + width * 0.5;
                v56 = y + height * 0.5;
                v53 = rect_16;
                v54 = v55 + rect_16 * -0.5;
                v33 = v56 + v38 * -0.5;
              }
              v77.origin.x = 0.0;
              v77.origin.y = 0.0;
              v77.size.width = v23;
              v77.size.height = v24;
              v80.origin.x = v54;
              v80.origin.y = v33;
              v80.size.width = v53;
              v80.size.height = v38;
              v57 = CGRectContainsRect(v77, v80);
              v31 = v53;
              v58 = v53 + fmax(v54, 0.0);
              if (v58 > v23)
                v58 = v23;
              v59 = v58 - v53;
              v60 = v38 + fmax(v33, 0.0);
              if (v60 > v24)
                v60 = v24;
              v61 = v60 - v53;
              if (v57)
              {
                v32 = v54;
              }
              else
              {
                v33 = v61;
                v32 = v59;
              }
              goto LABEL_18;
            }
            goto LABEL_22;
          }
        }
        v69.origin.x = a19;
        v69.origin.y = a20;
        v69.size.width = a21;
        v69.size.height = a22;
        if (CGRectIsEmpty(v69))
        {
          v38 = v66;
LABEL_22:
          v32 = rect_8;
          v31 = rect_16;
LABEL_18:
          v72.origin.x = v32;
          v72.origin.y = v33;
          v72.size.width = v31;
          v72.size.height = v38;
          if (!CGRectIsEmpty(v72))
          {
            v73.origin.x = 0.0;
            v73.origin.y = 0.0;
            v73.size.width = v23;
            v73.size.height = v24;
            CGRectIsEmpty(v73);
          }
          return;
        }
      }
      +[PFCropUtilitiesCore _curatedLibraryAdjustedRectWithFaceAreaRect:proposedCropRect:assetRect:verticalContentMode:](PFCropUtilitiesCore, "_curatedLibraryAdjustedRectWithFaceAreaRect:proposedCropRect:assetRect:verticalContentMode:", a8, a19, a20, a21, a22, rect_8, v33, rect_16, v66, 0, 0, *(_QWORD *)&v23, *(_QWORD *)&v24);
    }
LABEL_17:
    v32 = v39;
    v33 = v40;
    v31 = v41;
    v38 = v42;
    goto LABEL_18;
  }
}

+ (double)_curatedLibraryAdjustedRectWithFaceAreaRect:(double)a3 proposedCropRect:(double)a4 assetRect:(CGFloat)a5 verticalContentMode:(CGFloat)a6
{
  double v26;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  if (!CGRectIsEmpty(*(CGRect *)&a1))
  {
    v28.origin.x = a5;
    v28.origin.y = a6;
    v28.size.width = a7;
    v28.size.height = a8;
    if (!CGRectIsEmpty(v28))
    {
      v29.size.width = a11;
      v29.size.height = a12;
      v29.origin.x = a9;
      v29.origin.y = a10;
      v30.origin.x = a5;
      v30.origin.y = a6;
      v30.size.width = a7;
      v30.size.height = a8;
      if (CGRectContainsRect(v29, v30))
      {
        v26 = fmax(a9 + a1 * a11 + a3 * a11 * 0.5 + a7 * -0.5, 0.0);
        if (a7 + v26 <= a11)
          return v26;
        else
          return a11 - a7;
      }
    }
  }
  return a5;
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

+ (double)_interpolationWithFactor:(double)a3 between:(double)a4 and:(double)a5
{
  return a4 + a3 * (a5 - a4);
}

+ (double)_interpolationCropToSize:(double)a3 withinRect:(double)a4 withPreferredRect:(double)a5 andAcceptableRect:(double)a6 outputScore:(uint64_t)a7
{
  double v25;
  double v26;
  double v27;
  double v28;
  _BOOL4 IsNull;
  _BOOL4 v30;
  double v31;
  double v32;
  int v33;
  char v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  char v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v51;
  double v52;
  double v53;
  double v54;
  uint8_t buf[4];
  double v58;
  __int16 v59;
  double v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  v64.origin.y = a17;
  v63 = *MEMORY[0x1E0C80C00];
  v64.origin.x = a16;
  v64.size.width = a18;
  v64.size.height = a19;
  if (!CGRectIsNull(v64) && a16 >= 0.0 && a17 >= 0.0 && a18 > 0.0 && a19 > 0.0)
  {
    v65.size.height = a15;
    v65.origin.y = a13;
    v65.origin.x = a12;
    v65.size.width = a14;
    if (!CGRectIsNull(v65) && a12 >= 0.0 && a13 >= 0.0 && a14 > 0.0 && a15 > 0.0)
    {
      v54 = a2;
      if ((a1 == 0.0 || a2 == 0.0 || a1 == *MEMORY[0x1E0D71130] && a2 == *(double *)(MEMORY[0x1E0D71130] + 8))
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218496;
        v58 = a1;
        v59 = 2048;
        v60 = a2;
        v61 = 2048;
        v62 = 0x3FF0000000000000;
        _os_log_fault_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
      }
      PFSizeWithAspectRatioFittingSize();
      v51 = v28;
      v52 = v27;
      v66.origin.x = a16;
      v66.origin.y = a17;
      v66.size.width = a18;
      v66.size.height = a19;
      IsNull = CGRectIsNull(v66);
      v67.origin.x = a12;
      v67.origin.y = a13;
      v67.size.width = a14;
      v67.size.height = a15;
      v30 = !CGRectIsNull(v67);
      v31 = a14;
      v32 = a15;
      if (!v30)
      {
        v32 = v51;
        v31 = v52;
      }
      v33 = !IsNull;
      v34 = a1 >= a18 || IsNull;
      v53 = v32;
      if ((v34 & 1) == 0)
      {
        +[PFCropUtilitiesCore _interpolationWithFactor:between:and:](PFCropUtilitiesCore, "_interpolationWithFactor:between:and:", a1 / a18, a16 + a18 * 0.5, a16);
        v25 = v39;
        v40 = 2.0 - a1 / a18;
        goto LABEL_36;
      }
      if ((v33 & v30) == 1 && a1 < a14)
      {
        +[PFCropUtilitiesCore _interpolationFactorFor:between:and:](PFCropUtilitiesCore, "_interpolationFactorFor:between:and:", a1, a18, a14);
        v36 = v35;
        +[PFCropUtilitiesCore _interpolationWithFactor:between:and:](PFCropUtilitiesCore, "_interpolationWithFactor:between:and:");
        v25 = v37;
        v38 = 2.0;
      }
      else
      {
        v40 = 0.0;
        if (a1 >= a5)
        {
          v25 = 0.0;
LABEL_36:
          v43 = v54 >= a19 || IsNull;
          if ((v43 & 1) != 0)
          {
            if ((v33 & v30) == 1 && v54 < a15)
            {
              +[PFCropUtilitiesCore _interpolationFactorFor:between:and:](PFCropUtilitiesCore, "_interpolationFactorFor:between:and:", v54, a19, a15);
              v45 = v44;
              +[PFCropUtilitiesCore _interpolationWithFactor:between:and:](PFCropUtilitiesCore, "_interpolationWithFactor:between:and:");
              v46 = 2.0;
LABEL_46:
              v47 = (v46 - v45) * 0.5;
              goto LABEL_47;
            }
            v47 = 0.0;
            if (v54 < a6)
            {
              +[PFCropUtilitiesCore _interpolationFactorFor:between:and:](PFCropUtilitiesCore, "_interpolationFactorFor:between:and:", v54, v53, a6, 0.0);
              v45 = v48;
              +[PFCropUtilitiesCore _interpolationWithFactor:between:and:](PFCropUtilitiesCore, "_interpolationWithFactor:between:and:");
              v46 = 1.0;
              goto LABEL_46;
            }
          }
          else
          {
            +[PFCropUtilitiesCore _interpolationWithFactor:between:and:](PFCropUtilitiesCore, "_interpolationWithFactor:between:and:", v54 / a19, a17 + a19 * 0.5);
            v47 = 2.0 - v54 / a19;
          }
LABEL_47:
          if (!a9)
            return v25;
          if (v40 >= v47)
            v49 = v40;
          else
            v49 = v47;
          v26 = (2.0 - v49) * 0.5;
          goto LABEL_52;
        }
        +[PFCropUtilitiesCore _interpolationFactorFor:between:and:](PFCropUtilitiesCore, "_interpolationFactorFor:between:and:", a1, v31);
        v36 = v41;
        +[PFCropUtilitiesCore _interpolationWithFactor:between:and:](PFCropUtilitiesCore, "_interpolationWithFactor:between:and:");
        v25 = v42;
        v38 = 1.0;
      }
      v40 = (v38 - v36) * 0.5;
      goto LABEL_36;
    }
  }
  if (a5 - a1 <= 0.0)
    v25 = 0.0;
  else
    v25 = (a5 - a1) * 0.5;
  if (a9)
  {
    v26 = 0.5005;
LABEL_52:
    *a9 = v26;
  }
  return v25;
}

+ (uint64_t)_interpolationCropForAspectRatio:(double)a1 acceptableRect:(double)a2 andPreferredRect:(double)a3 andImageRect:(double)a4 outputCropScore:(double)a5
{
  return +[PFCropUtilitiesCore _interpolationCropForAspectRatio:andZoom:acceptableRect:andPreferredRect:andImageRect:outputCropScore:](PFCropUtilitiesCore, "_interpolationCropForAspectRatio:andZoom:acceptableRect:andPreferredRect:andImageRect:outputCropScore:", a1, 1.0, a2, a3, a4, a5);
}

+ (uint64_t)_interpolationCropForAspectRatio:(uint64_t)a3 andZoom:(uint64_t)a4 acceptableRect:(uint64_t)a5 andPreferredRect:(double)a6 andImageRect:(double)a7 outputCropScore:(double)a8
{
  +[PFCropUtilitiesCore _interpolationCropSizeForRatio:andZoom:forImageSize:](PFCropUtilitiesCore, "_interpolationCropSizeForRatio:andZoom:forImageSize:", a1, a2, a18, a19);
  return +[PFCropUtilitiesCore _interpolationCropToSize:withinRect:withPreferredRect:andAcceptableRect:outputScore:](PFCropUtilitiesCore, "_interpolationCropToSize:withinRect:withPreferredRect:andAcceptableRect:outputScore:", a5);
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

  +[PFCropUtilitiesCore _rectDimensionOffset:insideRect:forEdge:](PFCropUtilitiesCore, "_rectDimensionOffset:insideRect:forEdge:", a1, a2, a3, a4, a5);
  v36 = v29;
  +[PFCropUtilitiesCore _rectDimensionOffset:insideRect:forEdge:](PFCropUtilitiesCore, "_rectDimensionOffset:insideRect:forEdge:", a11, a12, a13, a14, a15, a5, a6, a7, a8);
  v35 = v30;
  +[PFCropUtilitiesCore _rectDimensionOffset:insideRect:forEdge:](PFCropUtilitiesCore, "_rectDimensionOffset:insideRect:forEdge:", a11, a16, a17, a18, a19, a5, a6, a7, a8);
  v32 = v31;
  result = +[PFCropUtilitiesCore _rectDimensionSize:forEdge:](PFCropUtilitiesCore, "_rectDimensionSize:forEdge:", a11, a16, a17, a18, a19);
  if (v36 > 0.0)
  {
    if (v36 <= v35)
    {
      +[PFCropUtilitiesCore _interpolationFactorFor:between:and:](PFCropUtilitiesCore, "_interpolationFactorFor:between:and:", v36, 0.0);
    }
    else if (v36 <= v32)
    {
      +[PFCropUtilitiesCore _interpolationFactorFor:between:and:](PFCropUtilitiesCore, "_interpolationFactorFor:between:and:", v36, v35, v32);
    }
    else
    {
      if (v36 > v32 + v34)
        return result;
      +[PFCropUtilitiesCore _interpolationFactorFor:between:and:](PFCropUtilitiesCore, "_interpolationFactorFor:between:and:", v36, v32);
    }
    return +[PFCropUtilitiesCore _interpolationWithFactor:between:and:](PFCropUtilitiesCore, "_interpolationWithFactor:between:and:");
  }
  return result;
}

+ (uint64_t)_interpolationV2ScoreForCrop:(double)a3 withFullsizeRect:(double)a4 andPreferredRect:(double)a5 andAcceptableRect:(double)a6
{
  +[PFCropUtilitiesCore _interpolationV2ScoreAlongEdge:forCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:](PFCropUtilitiesCore, "_interpolationV2ScoreAlongEdge:forCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:", 0, a17, a18, a19, a20, a21, a22, a23, a24);
  +[PFCropUtilitiesCore _interpolationV2ScoreAlongEdge:forCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:](PFCropUtilitiesCore, "_interpolationV2ScoreAlongEdge:forCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:", 2, a1, a2, a3, a4, a5, a6, a7, a8, a17, a18, a19, a20, a21, a22, a23, a24);
  +[PFCropUtilitiesCore _interpolationV2ScoreAlongEdge:forCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:](PFCropUtilitiesCore, "_interpolationV2ScoreAlongEdge:forCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:", 1, a1, a2, a3, a4, a5, a6, a7, a8, a17, a18, a19, a20, a21, a22, a23, a24);
  return +[PFCropUtilitiesCore _interpolationV2ScoreAlongEdge:forCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:](PFCropUtilitiesCore, "_interpolationV2ScoreAlongEdge:forCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:", 3, a1, a2, a3, a4, a5, a6, a7, a8, a17, a18, a19, a20, a21, a22, a23, a24);
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

+ (double)_interpolationV2AdjustedCrop:(double)a3 toFocusRegion:(double)a4 withFullsizeRect:(double)a5 andImportantRect:(double)a6
{
  double v28;
  double v29;
  double v30;
  double v31;

  +[PFCropUtilitiesCore _translationToIncludeRect:insideRect:](PFCropUtilitiesCore, "_translationToIncludeRect:insideRect:", a13, a14, a15, a16, a1 + a5 * a3, a2 + a6 * a4, a3 * a7, a4 * a8);
  v29 = a1 - v28;
  +[PFCropUtilitiesCore _translationToIncludeRect:insideRect:](PFCropUtilitiesCore, "_translationToIncludeRect:insideRect:", v29, a2 - v30, a3, a4, a9, a10, a11, a12);
  return v29 + v31;
}

+ (uint64_t)_interpolationV2MaxCropSizeForAspectRatio:(double)a3 andZoom:(double)a4 withFocusRegion:(double)a5 forImageSize:(double)a6 withImportantRect:(double)a7
{
  +[PFCropUtilitiesCore _rectDimensionSize:forEdge:](PFCropUtilitiesCore, "_rectDimensionSize:forEdge:", 0, a9, a10, a11, a12);
  +[PFCropUtilitiesCore _rectDimensionSize:forEdge:](PFCropUtilitiesCore, "_rectDimensionSize:forEdge:", 1, a9, a10, a11, a12);
  +[PFCropUtilitiesCore _rectDimensionOffset:insideRect:forEdge:](PFCropUtilitiesCore, "_rectDimensionOffset:insideRect:forEdge:", 0, a9, a10, a11, a12, 0.0, 0.0, a7, a8);
  +[PFCropUtilitiesCore _rectDimensionOffset:insideRect:forEdge:](PFCropUtilitiesCore, "_rectDimensionOffset:insideRect:forEdge:", 2, a9, a10, a11, a12, 0.0, 0.0, a7, a8);
  +[PFCropUtilitiesCore _rectDimensionOffset:insideRect:forEdge:](PFCropUtilitiesCore, "_rectDimensionOffset:insideRect:forEdge:", 1, a9, a10, a11, a12, 0.0, 0.0, a7, a8);
  +[PFCropUtilitiesCore _rectDimensionOffset:insideRect:forEdge:](PFCropUtilitiesCore, "_rectDimensionOffset:insideRect:forEdge:", 3, a9, a10, a11, a12, 0.0, 0.0, a7, a8);
  +[PFCropUtilitiesCore _rectDimensionSize:forEdge:](PFCropUtilitiesCore, "_rectDimensionSize:forEdge:", 0, a3, a4, a5, a6);
  +[PFCropUtilitiesCore _rectDimensionSize:forEdge:](PFCropUtilitiesCore, "_rectDimensionSize:forEdge:", 1, a3, a4, a5, a6);
  +[PFCropUtilitiesCore _rectDimensionOffset:insideRect:forEdge:](PFCropUtilitiesCore, "_rectDimensionOffset:insideRect:forEdge:", 0, a3, a4, a5, a6, 0.0, 0.0, 1.0, 1.0);
  +[PFCropUtilitiesCore _rectDimensionOffset:insideRect:forEdge:](PFCropUtilitiesCore, "_rectDimensionOffset:insideRect:forEdge:", 2, a3, a4, a5, a6, 0.0, 0.0, 1.0, 1.0);
  +[PFCropUtilitiesCore _rectDimensionOffset:insideRect:forEdge:](PFCropUtilitiesCore, "_rectDimensionOffset:insideRect:forEdge:", 1, a3, a4, a5, a6, 0.0, 0.0, 1.0, 1.0);
  return +[PFCropUtilitiesCore _rectDimensionOffset:insideRect:forEdge:](PFCropUtilitiesCore, "_rectDimensionOffset:insideRect:forEdge:", 3, a3, a4, a5, a6, 0.0, 0.0, 1.0, 1.0);
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

  +[PFCropUtilitiesCore _interpolationV2MaxCropSizeForAspectRatio:andZoom:withFocusRegion:forImageSize:withImportantRect:](PFCropUtilitiesCore, "_interpolationV2MaxCropSizeForAspectRatio:andZoom:withFocusRegion:forImageSize:withImportantRect:", a1, 1.0, a2, a3, a4, a5, a27, a28, a17, a18, a19, a20);
  +[PFCropUtilitiesCore _interpolationCropToSize:withinRect:withPreferredRect:andAcceptableRect:outputScore:](PFCropUtilitiesCore, "_interpolationCropToSize:withinRect:withPreferredRect:andAcceptableRect:outputScore:", a8, a21, a22, a23, a24, a17, a18, a19, a20);
  +[PFCropUtilitiesCore _interpolationV2AdjustedCrop:toFocusRegion:withFullsizeRect:andImportantRect:](PFCropUtilitiesCore, "_interpolationV2AdjustedCrop:toFocusRegion:withFullsizeRect:andImportantRect:", *(_QWORD *)&a25, *(_QWORD *)&a26, *(_QWORD *)&a27, *(_QWORD *)&a28, a17, a18, a19, a20);
  v30 = v26;
  v31 = v27;
  v32 = v28;
  v33 = v29;
  if (a8)
  {
    +[PFCropUtilitiesCore _interpolationV2ScoreForCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:](PFCropUtilitiesCore, "_interpolationV2ScoreForCrop:withFullsizeRect:andPreferredRect:andAcceptableRect:", v26, v27, v28, v29, a25, a26, a27, a28, a21, a22, a23, a24, a17, a18, a19, a20);
    v37 = v34;
    +[PFCropUtilitiesCore _interpolationV2ScoreForFocusRegion:insideCropRect:withImportantRect:](PFCropUtilitiesCore, "_interpolationV2ScoreForFocusRegion:insideCropRect:withImportantRect:", a2, a3, a4, a5, v30, v31, v32, v33, a17, a18, a19, a20);
    *a8 = v37 * v35;
  }
  return v30;
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

+ (double)_rectDimensionOffset:(CGRect)a3 insideRect:(CGRect)a4 forEdge:(unsigned int)a5
{
  switch(a5)
  {
    case 0u:
      a3.origin.x = a3.origin.x - a4.origin.x;
      break;
    case 1u:
      a3.origin.x = a3.origin.y - a4.origin.y;
      break;
    case 2u:
      a3.origin.x = a4.origin.x + a4.size.width - (a3.origin.x + a3.size.width);
      break;
    case 3u:
      a3.origin.x = a4.origin.y + a4.size.height - (a3.origin.y + a3.size.height);
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
  +[PFCropUtilitiesCore _rectDimensionOffset:insideRect:forEdge:](PFCropUtilitiesCore, "_rectDimensionOffset:insideRect:forEdge:", 0);
  v20 = v12;
  +[PFCropUtilitiesCore _rectDimensionOffset:insideRect:forEdge:](PFCropUtilitiesCore, "_rectDimensionOffset:insideRect:forEdge:", 2, v11, v10, v9, v8, x, y, width, height);
  v19 = v13;
  +[PFCropUtilitiesCore _rectDimensionOffset:insideRect:forEdge:](PFCropUtilitiesCore, "_rectDimensionOffset:insideRect:forEdge:", 1, v11, v10, v9, v8, x, y, width, height);
  v18 = v14;
  +[PFCropUtilitiesCore _rectDimensionOffset:insideRect:forEdge:](PFCropUtilitiesCore, "_rectDimensionOffset:insideRect:forEdge:", 3, v11, v10, v9, v8, x, y, width, height);
  v16 = fmin(v15, 0.0) - fmin(v18, 0.0);
  v17 = fmin(v19, 0.0) - fmin(v20, 0.0);
  result.y = v16;
  result.x = v17;
  return result;
}

@end
