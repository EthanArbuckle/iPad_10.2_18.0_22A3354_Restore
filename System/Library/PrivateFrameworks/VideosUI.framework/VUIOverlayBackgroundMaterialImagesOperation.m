@implementation VUIOverlayBackgroundMaterialImagesOperation

- (VUIOverlayBackgroundMaterialImagesOperation)initWithSourceBackgroundImage:(id)a3
{
  id v5;
  VUIOverlayBackgroundMaterialImagesOperation *v6;
  VUIOverlayBackgroundMaterialImagesOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIOverlayBackgroundMaterialImagesOperation;
  v6 = -[VUIOverlayBackgroundMaterialImagesOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sourceBackgroundImage, a3);

  return v7;
}

- (VUIOverlayBackgroundMaterialImagesOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (void)main
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v9;
  double v10;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;
  CGSize v41;

  v40 = *MEMORY[0x1E0C80C00];
  if ((-[VUIOverlayBackgroundMaterialImagesOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[VUIOverlayBackgroundMaterialImagesOperation sourceBackgroundImage](self, "sourceBackgroundImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIOverlayBackgroundMaterialImagesOperation resizedBackgroundImageSize](self, "resizedBackgroundImageSize");
    v5 = fabs(v4);
    -[VUIOverlayBackgroundMaterialImagesOperation resizedBackgroundImageSize](self, "resizedBackgroundImageSize");
    v7 = fabs(v6);
    if (v5 != *MEMORY[0x1E0C9D820] || v7 != *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      objc_msgSend(v3, "size");
      if (v5 != v10 || v7 != v9)
      {
        v41.width = v5;
        v41.height = v7;
        UIGraphicsBeginImageContextWithOptions(v41, 0, 0.0);
        objc_msgSend(v3, "drawInRect:", 0.0, 0.0, v5, v7);
        UIGraphicsGetImageFromCurrentImageContext();
        v12 = objc_claimAutoreleasedReturnValue();

        UIGraphicsEndImageContext();
        -[VUIOverlayBackgroundMaterialImagesOperation setResizedSourceBackgroundImage:](self, "setResizedSourceBackgroundImage:", v12);
        v3 = (void *)v12;
      }
    }
    -[VUIOverlayBackgroundMaterialImagesOperation overlayMaterialRequests](self, "overlayMaterialRequests");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    else
      v14 = 0;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v36 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v20, "identifier", (_QWORD)v35);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "rect");
          v23 = v22;
          v25 = v24;
          v27 = v26;
          v29 = v28;
          objc_msgSend(v20, "croppedRect");
          -[VUIOverlayBackgroundMaterialImagesOperation _blurredMaterialImageWithSourceBackgroundImage:forRect:croppedRect:](self, "_blurredMaterialImageWithSourceBackgroundImage:forRect:croppedRect:", v3, v23, v25, v27, v29, v30, v31, v32, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "vui_setObjectIfNotNil:forKey:", v34, v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v17);
    }

    if ((-[VUIOverlayBackgroundMaterialImagesOperation isCancelled](self, "isCancelled") & 1) == 0)
      -[VUIOverlayBackgroundMaterialImagesOperation setOverlayMaterialImageByIdentifier:](self, "setOverlayMaterialImageByIdentifier:", v14);

  }
}

- (id)_blurredMaterialImageWithSourceBackgroundImage:(id)a3 forRect:(CGRect)a4 croppedRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  id v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  id v16;
  CGImage *v17;
  CGImageRef v18;
  CGImage *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  void *v25;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  if (a3)
  {
    height = a5.size.height;
    width = a5.size.width;
    y = a5.origin.y;
    x = a5.origin.x;
    v9 = a4.size.width;
    v10 = objc_retainAutorelease(a3);
    v11 = (double)CGImageGetWidth((CGImageRef)objc_msgSend(v10, "CGImage")) / v9;
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    v12 = CGRectGetMinX(v27) * v11;
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    v13 = CGRectGetMinY(v28) * v11;
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v14 = v11 * CGRectGetWidth(v29);
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    v15 = v11 * CGRectGetHeight(v30);
    v16 = objc_retainAutorelease(v10);
    v17 = (CGImage *)objc_msgSend(v16, "CGImage");

    v31.origin.x = v12;
    v31.origin.y = v13;
    v31.size.width = v14;
    v31.size.height = v15;
    v18 = CGImageCreateWithImageInRect(v17, v31);
    if (v18)
    {
      v19 = v18;
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "userInterfaceIdiom");

      objc_msgSend(MEMORY[0x1E0DC4030], "settingsForPrivateStyle:", 4001);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22 == 2)
      {
        if (UIAccessibilityIsReduceTransparencyEnabled())
        {
LABEL_9:
          objc_msgSend(v20, "_applyBackdropViewSettings:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          CGImageRelease(v19);

          return v25;
        }
        v24 = 0.55;
      }
      else
      {
        v24 = 0.6;
      }
      objc_msgSend(v23, "setColorTintAlpha:", v24);
      goto LABEL_9;
    }
  }
  v25 = 0;
  return v25;
}

- (CGSize)resizedBackgroundImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_resizedBackgroundImageSize.width;
  height = self->_resizedBackgroundImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setResizedBackgroundImageSize:(CGSize)a3
{
  self->_resizedBackgroundImageSize = a3;
}

- (NSArray)overlayMaterialRequests
{
  return self->_overlayMaterialRequests;
}

- (void)setOverlayMaterialRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (UIImage)resizedSourceBackgroundImage
{
  return self->_resizedSourceBackgroundImage;
}

- (void)setResizedSourceBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_resizedSourceBackgroundImage, a3);
}

- (NSDictionary)overlayMaterialImageByIdentifier
{
  return self->_overlayMaterialImageByIdentifier;
}

- (void)setOverlayMaterialImageByIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (UIImage)sourceBackgroundImage
{
  return self->_sourceBackgroundImage;
}

- (void)setSourceBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_sourceBackgroundImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceBackgroundImage, 0);
  objc_storeStrong((id *)&self->_overlayMaterialImageByIdentifier, 0);
  objc_storeStrong((id *)&self->_resizedSourceBackgroundImage, 0);
  objc_storeStrong((id *)&self->_overlayMaterialRequests, 0);
}

@end
