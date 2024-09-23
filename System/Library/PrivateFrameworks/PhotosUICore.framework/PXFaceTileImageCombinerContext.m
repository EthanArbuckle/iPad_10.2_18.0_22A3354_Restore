@implementation PXFaceTileImageCombinerContext

- (PXFaceTileImageCombinerContext)initWithDisplayScale:(double)a3 isRTL:(BOOL)a4 isAscending:(BOOL)a5 imageSize:(double)a6 imageOffset:(double)a7 backgroundColor:(id)a8 borderColor:(id)a9 borderWidth:(double)a10
{
  id v20;
  id v21;
  PXFaceTileImageCombinerContext *v22;
  PXFaceTileImageCombinerContext *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v20 = a8;
  v21 = a9;
  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFaceTileImageCombiner.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayScale > 0"));

  }
  if (a6 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFaceTileImageCombiner.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageSize > 0"));

  }
  if (a7 > 0.0)
  {
    if (v20)
      goto LABEL_7;
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFaceTileImageCombiner.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("backgroundColor"));

    if (v21)
      goto LABEL_8;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFaceTileImageCombiner.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageOffset > 0"));

  if (!v20)
    goto LABEL_16;
LABEL_7:
  if (v21)
    goto LABEL_8;
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFaceTileImageCombiner.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("borderColor"));

LABEL_8:
  if (a10 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFaceTileImageCombiner.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("borderWidth > 0"));

  }
  if (a7 <= a10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFaceTileImageCombiner.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageOffset > borderWidth"));

  }
  v32.receiver = self;
  v32.super_class = (Class)PXFaceTileImageCombinerContext;
  v22 = -[PXFaceTileImageCombinerContext init](&v32, sel_init);
  v23 = v22;
  if (v22)
  {
    v22->_isRTL = a4;
    v22->_isAscending = a5;
    v22->_displayScale = a3;
    v22->_imageSize = a6;
    v22->_imageOffset = a7;
    objc_storeStrong((id *)&v22->_backgroundColor, a8);
    objc_storeStrong((id *)&v23->_borderColor, a9);
    v23->_borderWidth = a10;
  }

  return v23;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (BOOL)isAscending
{
  return self->_isAscending;
}

- (double)imageSize
{
  return self->_imageSize;
}

- (double)imageOffset
{
  return self->_imageOffset;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
