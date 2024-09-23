@implementation PXStoryCropUtilities

+ (CGRect)suggestedCropWithAspectRatio:(double)a3 forAssetWithSize:(CGSize)a4 faceCount:(int64_t)a5 faceRects:(const CGRect *)a6 featuredFaceCount:(int64_t)a7
{
  double height;
  double width;
  uint64_t v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  int64_t v27;
  CGRect *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  int64_t v37;
  double v38;
  CGSize *p_size;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v57;
  int64_t v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect result;
  CGRect v73;
  CGRect v74;

  height = a4.height;
  width = a4.width;
  if (a5 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXStoryCropUtilities.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("faceCount > 0"));

  }
  v12 = PXRectWithOriginAndSize();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = MEMORY[0x1A85CD660](v12, a3, width, height) * 0.5;
  v23 = v22 * 0.5;
  v69.origin.x = v14;
  v69.origin.y = v16;
  v69.size.width = v18;
  v69.size.height = v20;
  CGRectInset(v69, v21, v23);
  v59 = *MEMORY[0x1E0C9D628];
  v60 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v61 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v62 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (width < height)
    width = height;
  PXFloatSign();
  v25 = v24;
  PXFloatSign();
  if (a5 >= 1)
  {
    v27 = 0;
    v64 = -1.79769313e308;
    v65 = v26 / width;
    v66 = v25 / width;
    do
    {
      v28 = (CGRect *)&a6[v27];
      v58 = v27;
      do
      {
        CGRectUnion(*v28, a6[v27]);
        PXRectGetCenter();
        PXRectClampPoint();
        PXRectWithCenterAndSize();
        v30 = v29;
        v32 = v31;
        v34 = v33;
        v36 = v35;
        v37 = 0;
        v38 = 0.0;
        p_size = &a6->size;
        v67 = v31;
        do
        {
          v68 = v38;
          v41 = p_size[-1].width;
          v40 = p_size[-1].height;
          v43 = p_size->width;
          v42 = p_size->height;
          v70.origin.x = v30;
          v70.origin.y = v32;
          v44 = v34;
          v70.size.width = v34;
          v70.size.height = v36;
          v45 = v30;
          v73.origin.x = v41;
          v73.origin.y = v40;
          v73.size.width = p_size->width;
          v73.size.height = v42;
          if (CGRectContainsRect(v70, v73))
          {
            PXRectGetCenter();
            PXPointSubtract();
            v38 = v68 + 10.0 - (v65 * v46 + v47 * v66) * (v65 * v46 + v47 * v66);
            v30 = v45;
            v34 = v44;
          }
          else
          {
            v71.origin.y = v32;
            v48 = v45;
            v71.origin.x = v45;
            v34 = v44;
            v71.size.width = v44;
            v71.size.height = v36;
            v74.origin.x = v41;
            v74.origin.y = v40;
            v74.size.width = v43;
            v74.size.height = v42;
            if (CGRectIntersectsRect(v71, v74))
            {
              if (v37 >= a7 || v37)
                v49 = -20.0;
              else
                v49 = -500.0;
              v38 = v68 + v49;
              v30 = v48;
              v32 = v67;
            }
            else
            {
              v30 = v48;
              if (v37 < a7)
              {
                if (v37)
                  v50 = -50.0;
                else
                  v50 = -1000.0;
                v38 = v68 + v50;
                v32 = v67;
              }
              else
              {
                v32 = v67;
                v38 = v68;
              }
            }
          }
          ++v37;
          p_size += 2;
        }
        while (a5 != v37);
        if (v38 > v64)
        {
          v64 = v38;
          v61 = v34;
          v62 = v36;
          v59 = v30;
          v60 = v32;
        }
        ++v27;
      }
      while (v27 < a5);
      v27 = v58 + 1;
    }
    while (v58 + 1 != a5);
  }
  v51 = v59;
  v52 = v60;
  v53 = v61;
  v54 = v62;
  result.size.height = v54;
  result.size.width = v53;
  result.origin.y = v52;
  result.origin.x = v51;
  return result;
}

@end
