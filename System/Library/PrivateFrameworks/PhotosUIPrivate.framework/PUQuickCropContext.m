@implementation PUQuickCropContext

- (PUQuickCropContext)initWithTileTransform:(id)a3 renderedImageSize:(CGSize)a4 boundingSize:(CGSize)a5 selectedAspectRatio:(CGSize)a6
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  id v13;
  PUQuickCropContext *v14;
  PUQuickCropContext *v15;
  _BOOL4 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double MinY;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat x;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat MinX;
  double v39;
  CGFloat v40;
  CGFloat y;
  double v42;
  double v43;
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
  PUQuickCropContext *v55;
  double v57;
  double v58;
  double v59;
  objc_super v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
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
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

  height = a6.height;
  width = a6.width;
  v8 = a5.height;
  v9 = a5.width;
  v10 = a4.height;
  v11 = a4.width;
  v13 = a3;
  v60.receiver = self;
  v60.super_class = (Class)PUQuickCropContext;
  v14 = -[PUQuickCropContext init](&v60, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_selectedAspectRatio.width = width;
    v14->_selectedAspectRatio.height = height;
    v16 = height != *(double *)(MEMORY[0x1E0C9D820] + 8) || width != *MEMORY[0x1E0C9D820];
    if (v16)
      v17 = height;
    else
      v17 = v8;
    if (v16)
      v18 = width;
    else
      v18 = v9;
    v58 = v17;
    v59 = v18;
    objc_msgSend(v13, "scale");
    v20 = v9 / v8;
    v21 = v11 / v10;
    if (v11 / v10 >= v9 / v8)
    {
      v23 = v11 / v19;
      if (v19 <= v21 / v20)
        v22 = v10;
      else
        v22 = v11 / v19 / v20;
    }
    else
    {
      v22 = v10 / v19;
      if (v19 <= v20 / v21)
        v23 = v11;
      else
        v23 = v20 * (v10 / v19);
    }
    objc_msgSend(v13, "normalizedTranslation");
    v26 = (v11 - v23) * (0.5 - v24);
    MinY = (v10 - v22) * (v25 + 0.5);
    v28 = v59;
    if (v59 == 0.0)
    {
      v29 = v58;
LABEL_48:
      v15->_cropRectRelativeToRenderedImage.origin.x = v26;
      v15->_cropRectRelativeToRenderedImage.origin.y = MinY;
      v15->_cropRectRelativeToRenderedImage.size.width = v23;
      v15->_cropRectRelativeToRenderedImage.size.height = v22;
      v15->_renderedImageSize.width = v11;
      v15->_renderedImageSize.height = v10;
      v15->_aspectRatio.width = v28;
      v15->_aspectRatio.height = v29;
      v15->_lockAspectRatio = v16;
      v55 = v15;
      goto LABEL_49;
    }
    v29 = v58;
    if (v58 == 0.0 || v9 == v59 && v8 == v58 || v59 / v58 <= 0.0)
      goto LABEL_48;
    v57 = v59 / v58;
    v30 = MinY;
    v31 = v23;
    v32 = v22;
    x = v26;
    v34 = CGRectGetWidth(*(CGRect *)&v26);
    v61.origin.x = x;
    v61.origin.y = MinY;
    v61.size.width = v23;
    v61.size.height = v22;
    v35 = v34 / CGRectGetHeight(v61);
    if (v20 <= 1.0)
    {
      if (v35 >= v57)
        goto LABEL_42;
      v68.origin.x = x;
      v68.origin.y = MinY;
      v68.size.width = v23;
      v68.size.height = v22;
      v39 = v57 * CGRectGetHeight(v68);
      v69.origin.x = x;
      v69.origin.y = MinY;
      v69.size.width = v23;
      v69.size.height = v22;
      v40 = (v39 - CGRectGetWidth(v69)) * -0.5;
      v70.origin.x = x;
      v70.origin.y = MinY;
      v70.size.width = v23;
      v70.size.height = v22;
      v71 = CGRectInset(v70, v40, 0.0);
      x = v71.origin.x;
      y = v71.origin.y;
      v23 = v71.size.width;
      v22 = v71.size.height;
      if (CGRectGetWidth(v71) > v11)
      {
        v72.origin.x = x;
        v72.origin.y = y;
        v72.size.width = v23;
        v72.size.height = v22;
        MinY = CGRectGetMinY(v72);
        v73.origin.x = x;
        v73.origin.y = y;
        v73.size.width = v23;
        v73.size.height = v22;
        v22 = CGRectGetHeight(v73);
        v23 = v11;
        x = 0.0;
        goto LABEL_42;
      }
      v76.origin.x = x;
      v76.origin.y = y;
      v76.size.width = v23;
      v76.size.height = v22;
      if (CGRectGetMinX(v76) >= 0.0)
      {
        v80.origin.x = x;
        v80.origin.y = y;
        v80.size.width = v23;
        v80.size.height = v22;
        if (CGRectGetMaxX(v80) <= v11)
        {
          MinY = y;
LABEL_42:
          v83.origin.x = x;
          v83.origin.y = MinY;
          v83.size.width = v23;
          v83.size.height = v22;
          v48 = CGRectGetWidth(v83);
          v84.origin.x = x;
          v84.origin.y = MinY;
          v84.size.width = v23;
          v84.size.height = v22;
          v49 = CGRectGetHeight(v84);
          if (vabdd_f64(v48 / v49, v57) <= 0.00000999999975)
          {
            v29 = v58;
            v28 = v59;
            v26 = x;
          }
          else
          {
            if (v48 / v49 >= v57)
            {
              v51 = (v48 - v57 * v49) * 0.5;
              v50 = 0.0;
            }
            else
            {
              v50 = (v49 - v48 / v57) * 0.5;
              v51 = 0.0;
            }
            v85.origin.x = x;
            v85.origin.y = MinY;
            v85.size.width = v23;
            v85.size.height = v22;
            *(CGRect *)&v26 = CGRectInset(v85, v51, v50);
            MinY = v52;
            v23 = v53;
            v22 = v54;
            v29 = v58;
            v28 = v59;
          }
          goto LABEL_48;
        }
        v81.origin.x = x;
        v81.origin.y = y;
        v81.size.width = v23;
        v81.size.height = v22;
        v43 = v11 - CGRectGetMaxX(v81);
      }
      else
      {
        v77.origin.x = x;
        v77.origin.y = y;
        v77.size.width = v23;
        v77.size.height = v22;
        v43 = -CGRectGetMinX(v77);
      }
      v42 = 0.0;
      v44 = x;
      v45 = y;
    }
    else
    {
      if (v35 <= v57)
        goto LABEL_42;
      v62.origin.x = x;
      v62.origin.y = MinY;
      v62.size.width = v23;
      v62.size.height = v22;
      v36 = CGRectGetWidth(v62) / v57;
      v63.origin.x = x;
      v63.origin.y = MinY;
      v63.size.width = v23;
      v63.size.height = v22;
      v37 = (v36 - CGRectGetHeight(v63)) * -0.5;
      v64.origin.x = x;
      v64.origin.y = MinY;
      v64.size.width = v23;
      v64.size.height = v22;
      v65 = CGRectInset(v64, 0.0, v37);
      x = v65.origin.x;
      MinY = v65.origin.y;
      v23 = v65.size.width;
      v22 = v65.size.height;
      if (CGRectGetHeight(v65) > v10)
      {
        v66.origin.x = x;
        v66.origin.y = MinY;
        v66.size.width = v23;
        v66.size.height = v22;
        MinX = CGRectGetMinX(v66);
        v67.origin.x = x;
        v67.origin.y = MinY;
        v67.size.width = v23;
        v67.size.height = v22;
        x = MinX;
        v23 = CGRectGetWidth(v67);
        v22 = v10;
        MinY = 0.0;
        goto LABEL_42;
      }
      v74.origin.x = x;
      v74.origin.y = MinY;
      v74.size.width = v23;
      v74.size.height = v22;
      if (CGRectGetMinY(v74) >= 0.0)
      {
        v78.origin.x = x;
        v78.origin.y = MinY;
        v78.size.width = v23;
        v78.size.height = v22;
        if (CGRectGetMaxY(v78) <= v10)
          goto LABEL_42;
        v79.origin.x = x;
        v79.origin.y = MinY;
        v79.size.width = v23;
        v79.size.height = v22;
        v42 = v10 - CGRectGetMaxY(v79);
      }
      else
      {
        v75.origin.x = x;
        v75.origin.y = MinY;
        v75.size.width = v23;
        v75.size.height = v22;
        v42 = -CGRectGetMinY(v75);
      }
      v43 = 0.0;
      v44 = x;
      v45 = MinY;
    }
    v46 = v23;
    v47 = v22;
    v82 = CGRectOffset(*(CGRect *)&v44, v43, v42);
    x = v82.origin.x;
    MinY = v82.origin.y;
    v23 = v82.size.width;
    v22 = v82.size.height;
    goto LABEL_42;
  }
LABEL_49:

  return v15;
}

- (id)applyCropToAssetTransitionInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CGImage *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];

  v4 = a3;
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = -[PUQuickCropContext _croppedCGImageForTransition:](self, "_croppedCGImageForTransition:", objc_msgSend(objc_retainAutorelease(v5), "CGImage"));
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v4, "imageLayerModulator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __53__PUQuickCropContext_applyCropToAssetTransitionInfo___block_invoke;
  v22[3] = &unk_1E58A9E78;
  v22[4] = self;
  objc_msgSend(v9, "performChanges:", v22);
  objc_msgSend(v4, "snapshotView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    -[PUQuickCropContext _croppedSnapshotViewForTransition:](self, "_croppedSnapshotViewForTransition:", v11);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __53__PUQuickCropContext_applyCropToAssetTransitionInfo___block_invoke_2;
  v18[3] = &unk_1E58A9EA0;
  v19 = v8;
  v20 = v9;
  v21 = v11;
  v13 = v11;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v4, "assetTransitionInfoWithModifications:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)applyCropRectToCompositionController:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  id v32;
  _QWORD v33[10];
  BOOL v34;
  CGRect v35;
  CGRect v36;

  v32 = a3;
  -[PUQuickCropContext cropRectRelativeToRenderedImage](self, "cropRectRelativeToRenderedImage");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v32, "orientationAdjustmentController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "orientation");

  NUOrientationInverse();
  if (NUOrientationIsValid())
  {
    -[PUQuickCropContext renderedImageSize](self, "renderedImageSize");
    NUPixelSizeFromCGSize();
    NUOrientationTransformRect();
    v5 = v13;
    v7 = v14;
    v9 = v15;
    v11 = v16;
  }
  objc_msgSend(v32, "cropAdjustmentController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cropRect");
  v19 = v18;
  v21 = v20;

  v35.origin.x = v5;
  v35.origin.y = v7;
  v35.size.width = v9;
  v35.size.height = v11;
  v36 = CGRectOffset(v35, v19, v21);
  x = v36.origin.x;
  y = v36.origin.y;
  width = v36.size.width;
  height = v36.size.height;
  -[PUQuickCropContext aspectRatio](self, "aspectRatio");
  v27 = v26;
  v29 = v28;
  v30 = -[PUQuickCropContext lockAspectRatio](self, "lockAspectRatio");
  v31 = *MEMORY[0x1E0D71328];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __59__PUQuickCropContext_applyCropRectToCompositionController___block_invoke;
  v33[3] = &__block_descriptor_81_e36_v16__0__PICropAdjustmentController_8l;
  *(CGFloat *)&v33[4] = x;
  *(CGFloat *)&v33[5] = y;
  *(CGFloat *)&v33[6] = width;
  *(CGFloat *)&v33[7] = height;
  v34 = v30;
  v33[8] = v27;
  v33[9] = v29;
  objc_msgSend(v32, "modifyAdjustmentWithKey:modificationBlock:", v31, v33);

}

- (CGRect)_normalizedCropRectForTransition
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat MinX;
  double v19;
  CGFloat Width;
  double Height;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  -[PUQuickCropContext cropRectRelativeToRenderedImage](self, "cropRectRelativeToRenderedImage");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PUQuickCropContext renderedImageSize](self, "renderedImageSize");
  v12 = v11;
  -[PUQuickCropContext renderedImageSize](self, "renderedImageSize");
  v13 = v4 / v12;
  v15 = v6 / v14;
  v16 = v8 / v12;
  v17 = v10 / v14;
  v25.origin.x = v13;
  v25.origin.y = v15;
  v25.size.width = v16;
  v25.size.height = v17;
  MinX = CGRectGetMinX(v25);
  v26.origin.x = v13;
  v26.origin.y = v15;
  v26.size.width = v16;
  v26.size.height = v17;
  v19 = 1.0 - CGRectGetMaxY(v26);
  v27.origin.x = v13;
  v27.origin.y = v15;
  v27.size.width = v16;
  v27.size.height = v17;
  Width = CGRectGetWidth(v27);
  v28.origin.x = v13;
  v28.origin.y = v15;
  v28.size.width = v16;
  v28.size.height = v17;
  Height = CGRectGetHeight(v28);
  v22 = MinX;
  v23 = v19;
  v24 = Width;
  result.size.height = Height;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGImage)_croppedCGImageForTransition:(CGImage *)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double Width;
  size_t Height;
  double v14;
  double v15;
  double v16;
  CGColorSpace *ColorSpace;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  CGImage *v23;
  CGRect v25;

  -[PUQuickCropContext _normalizedCropRectForTransition](self, "_normalizedCropRectForTransition");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  Width = (double)CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  v14 = v5 * Width + 0.0;
  v15 = v7 * (double)Height + 0.0;
  v16 = v11 * (double)Height;
  ColorSpace = CGImageGetColorSpace(a3);
  if (CGColorSpaceUsesITUR_2100TF(ColorSpace))
  {
    objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCGImage:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "extent");
    v21 = v19 + v20 - (v15 + v16);
    objc_msgSend(MEMORY[0x1E0C9DD90], "context");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (CGImage *)objc_msgSend(v22, "createCGImage:fromRect:format:colorSpace:deferred:", v18, *MEMORY[0x1E0C9E058], ColorSpace, 1, v14, v21, v9 * Width, v16);

    return v23;
  }
  else
  {
    v25.origin.x = v14;
    v25.origin.y = v15;
    v25.size.width = v9 * Width;
    v25.size.height = v16;
    return CGImageCreateWithImageInRect(a3, v25);
  }
}

- (id)_croppedSnapshotViewForTransition:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  v4 = a3;
  -[PUQuickCropContext _normalizedCropRectForTransition](self, "_normalizedCropRectForTransition");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "bounds");
  objc_msgSend(v4, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, v13 + v6 * v14, v15 + v8 * v16, v10 * v14, v12 * v16, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (CGSize)selectedAspectRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_selectedAspectRatio.width;
  height = self->_selectedAspectRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSelectedAspectRatio:(CGSize)a3
{
  self->_selectedAspectRatio = a3;
}

- (CGRect)cropRectRelativeToRenderedImage
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRectRelativeToRenderedImage.origin.x;
  y = self->_cropRectRelativeToRenderedImage.origin.y;
  width = self->_cropRectRelativeToRenderedImage.size.width;
  height = self->_cropRectRelativeToRenderedImage.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCropRectRelativeToRenderedImage:(CGRect)a3
{
  self->_cropRectRelativeToRenderedImage = a3;
}

- (CGSize)renderedImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_renderedImageSize.width;
  height = self->_renderedImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setRenderedImageSize:(CGSize)a3
{
  self->_renderedImageSize = a3;
}

- (CGSize)aspectRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_aspectRatio.width;
  height = self->_aspectRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setAspectRatio:(CGSize)a3
{
  self->_aspectRatio = a3;
}

- (BOOL)lockAspectRatio
{
  return self->_lockAspectRatio;
}

- (void)setLockAspectRatio:(BOOL)a3
{
  self->_lockAspectRatio = a3;
}

void __59__PUQuickCropContext_applyCropRectToCompositionController___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setCropRect:", *(double *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(v4, "setConstraintWidth:", (uint64_t)*(double *)(a1 + 64));
    v3 = (uint64_t)*(double *)(a1 + 72);
  }
  else
  {
    objc_msgSend(v4, "setConstraintWidth:", 0);
    v3 = 0;
  }
  objc_msgSend(v4, "setConstraintHeight:", v3);
  objc_msgSend(v4, "setIsAuto:", 0);
  objc_msgSend(v4, "setEnabled:", 1);

}

void __53__PUQuickCropContext_applyCropToAssetTransitionInfo___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  CGImage *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (CGImage *)objc_msgSend(v2, "_croppedCGImageForTransition:", objc_msgSend(v3, "gainMapImage"));
  objc_msgSend(v3, "setGainMapImage:", v4);

  CGImageRelease(v4);
}

void __53__PUQuickCropContext_applyCropToAssetTransitionInfo___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setImage:", v3);
  objc_msgSend(v4, "setImageLayerModulator:", a1[5]);
  objc_msgSend(v4, "setSnapshotView:", a1[6]);

}

@end
