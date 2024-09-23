@implementation PXNonuniformTransform

- (PXNonuniformTransform)init
{
  PXNonuniformTransform *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXNonuniformTransform;
  result = -[PXNonuniformTransform init](&v8, sel_init);
  if (result)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&result->_minimumScale = _Q0;
  }
  return result;
}

- (CGAffineTransform)affineTransformForRect:(SEL)a3 inCoordinateSpace:(CGRect)a4
{
  uint64_t v6;
  __int128 v7;
  CGAffineTransform *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  __int128 v18;
  CGFloat c;
  CGFloat b;
  CGFloat d;
  CGFloat tx;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double MinY;
  double v28;
  double MinX;
  double v30;
  __int128 v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat MaxY;
  __int128 v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  __int128 v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat height;
  double v57;
  CGFloat v58;
  double v59;
  double v60;
  double v61;
  CGFloat v62;
  CGFloat MaxX;
  __int128 v64;
  CGFloat v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  __int128 v69;
  double v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  __int128 v77;
  CGFloat rect;
  CGAffineTransform rect_8;
  CGRect v80;
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
  CGRect v100;
  CGRect v101;
  CGRect v102;

  v6 = MEMORY[0x1E0C9BAA8];
  v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v7;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v6 + 32);
  if (*(_QWORD *)&self[1].d)
  {
    v8 = self;
    v9 = a5;
    PXRectConvertFromCoordinateSpaceToCoordinateSpace();
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    PXAffineTransformMakeFromRects();
    v18 = *(_OWORD *)&rect_8.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&rect_8.a;
    *(_OWORD *)&retstr->c = v18;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&rect_8.tx;
    b = v8->b;
    c = v8->c;
    d = v8->d;
    tx = v8->tx;
    rect = v11;
    v23 = v11;
    v24 = v13;
    *(double *)&v18 = v13;
    v25 = v15;
    v26 = v17;
    MinY = CGRectGetMinY(*(CGRect *)((char *)&v18 - 8));
    if (MinY >= CGRectGetMaxY(*(CGRect *)&v8->b))
    {
      v83.origin.x = b;
      v83.origin.y = c;
      v83.size.width = d;
      v83.size.height = tx;
      MaxY = CGRectGetMaxY(v83);
      v36 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&rect_8.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&rect_8.c = v36;
      *(_OWORD *)&rect_8.tx = *(_OWORD *)&retstr->tx;
      v37 = b;
      *(CGFloat *)&v36 = MaxY;
      v38 = d;
      v39 = d;
      v84 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v36 - 8), &rect_8);
      x = v84.origin.x;
      y = v84.origin.y;
      width = v84.size.width;
      v84.size.height = v84.size.width;
      v43 = CGRectGetWidth(v84);
      v85.origin.x = b;
      v85.origin.y = MaxY;
      v85.size.width = d;
      v85.size.height = d;
      -[CGAffineTransform _adjustedZoomScale:](v8, "_adjustedZoomScale:", v43 / CGRectGetWidth(v85));
      v45 = v44;
      v86.origin.x = x;
      v86.origin.y = y;
      v86.size.width = width;
      v86.size.height = width;
      v46 = CGRectGetWidth(v86) / v45;
      v87.origin.x = b;
      v87.origin.y = MaxY;
      v87.size.width = d;
      v87.size.height = d;
      v88.origin.x = CGRectGetMidX(v87) + v46 * -0.5;
      v88.origin.y = MaxY;
      v88.size.width = d;
      v88.size.height = d;
      CGRectGetMinY(v88);
    }
    else
    {
      v80.origin.x = rect;
      v80.origin.y = v24;
      v80.size.width = v15;
      v80.size.height = v17;
      v28 = CGRectGetMaxY(v80);
      if (v28 <= CGRectGetMinY(*(CGRect *)&v8->b))
      {
        v89.origin.x = b;
        v89.origin.y = c;
        v89.size.width = d;
        v89.size.height = d;
        v47 = CGRectGetMinY(v89);
        v90.origin.x = b;
        v90.origin.y = c;
        v90.size.width = d;
        v90.size.height = d;
        v48 = v47 - CGRectGetHeight(v90);
        v49 = *(_OWORD *)&retstr->c;
        *(_OWORD *)&rect_8.a = *(_OWORD *)&retstr->a;
        *(_OWORD *)&rect_8.c = v49;
        *(_OWORD *)&rect_8.tx = *(_OWORD *)&retstr->tx;
        v50 = b;
        *(CGFloat *)&v49 = v48;
        v51 = d;
        v52 = d;
        v91 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v49 - 8), &rect_8);
        v53 = v91.origin.x;
        v54 = v91.origin.y;
        v55 = v91.size.width;
        height = v91.size.height;
        v57 = CGRectGetMaxY(v91);
        v92.origin.x = v53;
        v92.origin.y = v54;
        v92.size.width = v55;
        v92.size.height = height;
        v58 = v57 - CGRectGetWidth(v92);
        v93.origin.x = v53;
        v93.origin.y = v58;
        v93.size.width = v55;
        v93.size.height = v55;
        v59 = CGRectGetWidth(v93);
        v94.origin.x = b;
        v94.origin.y = v48;
        v94.size.width = d;
        v94.size.height = d;
        -[CGAffineTransform _adjustedZoomScale:](v8, "_adjustedZoomScale:", v59 / CGRectGetWidth(v94));
        v61 = v60;
        v95.origin.x = v53;
        v95.origin.y = v58;
        v95.size.width = v55;
        v95.size.height = v55;
        v62 = CGRectGetWidth(v95) / v61;
        v96.origin.x = b;
        v96.origin.y = v48;
        v96.size.width = d;
        v96.size.height = d;
        v97.origin.x = CGRectGetMidX(v96) + v62 * -0.5;
        v97.origin.y = v48;
        v97.size.width = d;
        v97.size.height = d;
        CGRectGetMaxY(v97);
      }
      else
      {
        v81.origin.x = rect;
        v81.origin.y = v24;
        v81.size.width = v15;
        v81.size.height = v17;
        MinX = CGRectGetMinX(v81);
        if (MinX >= CGRectGetMaxX(*(CGRect *)&v8->b))
        {
          v98.origin.x = b;
          v98.origin.y = c;
          v98.size.width = d;
          v98.size.height = tx;
          MaxX = CGRectGetMaxX(v98);
          v64 = *(_OWORD *)&retstr->c;
          *(_OWORD *)&rect_8.a = *(_OWORD *)&retstr->a;
          *(_OWORD *)&rect_8.c = v64;
          *(_OWORD *)&rect_8.tx = *(_OWORD *)&retstr->tx;
          *(CGFloat *)&v64 = c;
          v65 = tx;
          v66 = tx;
          CGRectApplyAffineTransform(*(CGRect *)&MaxX, &rect_8);
        }
        else
        {
          v82.origin.x = rect;
          v82.origin.y = v24;
          v82.size.width = v15;
          v82.size.height = v17;
          v30 = CGRectGetMaxX(v82);
          if (v30 > CGRectGetMinX(*(CGRect *)&v8->b))
          {
            v31 = *(_OWORD *)&retstr->c;
            *(_OWORD *)&rect_8.a = *(_OWORD *)&retstr->a;
            *(_OWORD *)&rect_8.c = v31;
            *(_OWORD *)&rect_8.tx = *(_OWORD *)&retstr->tx;
            v32 = b;
            *(CGFloat *)&v31 = c;
            v33 = d;
            v34 = tx;
            CGRectApplyAffineTransform(*(CGRect *)((char *)&v31 - 8), &rect_8);
          }
          else
          {
            v99.origin.x = b;
            v99.origin.y = c;
            v99.size.width = d;
            v99.size.height = tx;
            v67 = CGRectGetMinX(v99);
            v100.origin.x = b;
            v100.origin.y = c;
            v100.size.width = d;
            v100.size.height = tx;
            v68 = CGRectGetHeight(v100);
            v69 = *(_OWORD *)&retstr->c;
            *(_OWORD *)&rect_8.a = *(_OWORD *)&retstr->a;
            *(_OWORD *)&rect_8.c = v69;
            *(_OWORD *)&rect_8.tx = *(_OWORD *)&retstr->tx;
            v70 = v67 - v68;
            *(CGFloat *)&v69 = c;
            v71 = tx;
            v72 = tx;
            v101 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v69 - 8), &rect_8);
            v73 = v101.origin.x;
            v74 = v101.origin.y;
            v75 = v101.size.width;
            v76 = v101.size.height;
            CGRectGetMaxX(v101);
            v102.origin.x = v73;
            v102.origin.y = v74;
            v102.size.width = v75;
            v102.size.height = v76;
            CGRectGetHeight(v102);
          }
        }
      }
    }
    PXRectConvertFromCoordinateSpaceToCoordinateSpace();
    PXRectConvertFromCoordinateSpaceToCoordinateSpace();

    self = (CGAffineTransform *)PXAffineTransformMakeFromRects();
    v77 = *(_OWORD *)&rect_8.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&rect_8.a;
    *(_OWORD *)&retstr->c = v77;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&rect_8.tx;
  }
  return self;
}

- (double)_adjustedZoomScale:(double)result
{
  if (self->_minimumScale > result)
    result = self->_minimumScale;
  if (result >= self->_maximumScale)
    return self->_maximumScale;
  return result;
}

- (id)inverseTransform
{
  PXNonuniformTransform *v3;
  CGPoint origin;
  CGSize size;

  v3 = objc_alloc_init(PXNonuniformTransform);
  origin = self->_targetRect.origin;
  v3->_sourceRect.size = self->_targetRect.size;
  v3->_sourceRect.origin = origin;
  size = self->_sourceRect.size;
  v3->_targetRect.origin = self->_sourceRect.origin;
  v3->_targetRect.size = size;
  objc_storeStrong((id *)&v3->_coordinateSpace, self->_coordinateSpace);
  v3->_minimumScale = 1.0 / self->_maximumScale;
  v3->_maximumScale = 1.0 / self->_minimumScale;
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinateSpace, 0);
}

+ (id)identityTransform
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PXNonuniformTransform_identityTransform__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (identityTransform_onceToken != -1)
    dispatch_once(&identityTransform_onceToken, block);
  return (id)identityTransform_identityTransform;
}

+ (id)horizontallyDominantTransformWithSourceRect:(CGRect)a3 targetRect:(CGRect)a4 coordinateSpace:(id)a5 minimumScale:(double)a6 maximumScale:(double)a7
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  UICoordinateSpace *v14;
  PXNonuniformTransform *v15;
  UICoordinateSpace *coordinateSpace;
  CGFloat height;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  v14 = (UICoordinateSpace *)a5;
  v15 = objc_alloc_init(PXNonuniformTransform);
  v15->_sourceRect.origin.x = v13;
  v15->_sourceRect.origin.y = v12;
  v15->_sourceRect.size.width = v11;
  v15->_sourceRect.size.height = v10;
  v15->_targetRect.origin.x = x;
  v15->_targetRect.origin.y = y;
  v15->_targetRect.size.width = width;
  v15->_targetRect.size.height = height;
  coordinateSpace = v15->_coordinateSpace;
  v15->_coordinateSpace = v14;

  v15->_minimumScale = a6;
  v15->_maximumScale = a7;
  return v15;
}

void __42__PXNonuniformTransform_identityTransform__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)identityTransform_identityTransform;
  identityTransform_identityTransform = (uint64_t)v1;

}

@end
