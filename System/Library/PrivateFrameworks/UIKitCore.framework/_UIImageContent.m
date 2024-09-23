@implementation _UIImageContent

- (UIImageSymbolConfiguration)_automaticSymbolConfiguration
{
  return +[UIImageSymbolConfiguration unspecifiedConfiguration](UIImageSymbolConfiguration, "unspecifiedConfiguration");
}

+ (BOOL)content:(void *)a3 isEqualToContent:
{
  id v4;
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  if (v4 == v5)
  {
    v6 = 1;
  }
  else
  {
    v6 = 0;
    if (v4 && v5)
    {
      v7 = objc_opt_class();
      if (v7 == objc_opt_class())
      {
        objc_msgSend(v4, "scale");
        v9 = v8;
        objc_msgSend(v5, "scale");
        v6 = v9 == v10;
      }
      else
      {
        v6 = 0;
      }
    }
  }

  return v6;
}

- (BOOL)isVectorGlyph
{
  return 0;
}

- (double)scale
{
  return self->_scale;
}

- (BOOL)containsNamedColorStyles
{
  return 0;
}

- (BOOL)isCIImage
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  return +[_UIImageContent content:isEqualToContent:]((uint64_t)_UIImageContent, self, a3);
}

- (double)variableValue
{
  return INFINITY;
}

+ (_UIImageContent)empty
{
  if (qword_1ECD79528 != -1)
    dispatch_once(&qword_1ECD79528, &__block_literal_global_179);
  return (_UIImageContent *)(id)qword_1ECD79520;
}

- (CGSize)size
{
  double scale;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[_UIImageContent sizeInPixels](self, "sizeInPixels");
  scale = self->_scale;
  v5 = v4 / scale;
  v7 = v6 / scale;
  result.height = v7;
  result.width = v5;
  return result;
}

- (BOOL)canScaleImageToTargetResolution
{
  return 0;
}

- (BOOL)isHDR
{
  return 0;
}

- (id)renditionApplyingEffect:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  v4 = a3;
  -[_UIImageContent size](self, "size");
  v6 = v5;
  v8 = v7;
  -[_UIImageContent scale](self, "scale");
  -[_UIImageContent renditionWithSize:scale:applyingEffect:](self, "renditionWithSize:scale:applyingEffect:", v4, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)renditionWithSize:(CGSize)a3 scale:(double)a4 applyingEffect:(id)a5
{
  double height;
  double width;
  id v9;
  double v10;
  int v11;
  uint64_t v12;
  id v13;
  double v14;
  double v15;
  double v16;
  _UIImageContent *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  _QWORD *v28;
  double v29;
  double v30;
  double v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;
  double v36;
  double v37;
  double v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[5];
  id v42;
  double v43;
  double v44;
  double v45;
  _QWORD v46[4];
  id v47;
  _UIImageContent *v48;
  double v49;
  double v50;
  double v51;
  _QWORD v52[8];
  _QWORD v53[5];
  _QWORD aBlock[8];

  height = a3.height;
  width = a3.width;
  v9 = a5;
  if (a4 <= 0.0)
  {
    -[_UIImageContent scale](self, "scale");
    a4 = v10;
  }
  v11 = _UIImageDummyImageContentRendering();
  v12 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke;
    aBlock[3] = &unk_1E16C4C00;
    aBlock[4] = self;
    *(double *)&aBlock[5] = a4;
    *(double *)&aBlock[6] = width;
    *(double *)&aBlock[7] = height;
    v13 = _Block_copy(aBlock);
LABEL_15:
    v19 = 0;
LABEL_16:
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__75;
    v32[4] = __Block_byref_object_dispose__75;
    v33 = 0;
    v26[0] = v12;
    v26[1] = 3221225472;
    v26[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_25;
    v26[3] = &unk_1E16C4DD0;
    v28 = v32;
    v29 = a4;
    v30 = width;
    v31 = height;
    v13 = v13;
    v27 = v13;
    v18 = _Block_copy(v26);

    _Block_object_dispose(v32, 8);
    goto LABEL_17;
  }
  -[_UIImageContent size](self, "size");
  if (v15 == width
    && v14 == height
    && (-[_UIImageContent scale](self, "scale"), a4 == v16)
    && -[_UIImageContent hasCGImage](self, "hasCGImage"))
  {
    v17 = objc_retainAutorelease(self);
    v53[0] = v12;
    v53[1] = 3221225472;
    v53[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_2;
    v53[3] = &__block_descriptor_40_e15___CGImage__8__0l;
    v53[4] = -[_UIImageContent CGImage](v17, "CGImage");
    v18 = _Block_copy(v53);
    v52[0] = v12;
    v52[1] = 3221225472;
    v52[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_3;
    v52[3] = &unk_1E16C4C00;
    v52[4] = v17;
    *(double *)&v52[5] = width;
    *(double *)&v52[6] = height;
    *(double *)&v52[7] = a4;
    v13 = _Block_copy(v52);
    v19 = 0;
  }
  else
  {
    if (!-[_UIImageContent _canProvideCGImageDirectly](self, "_canProvideCGImageDirectly"))
    {
      v34[0] = v12;
      v34[1] = 3221225472;
      v34[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_20;
      v34[3] = &unk_1E16C4CC0;
      v34[4] = self;
      v36 = width;
      v37 = height;
      v38 = a4;
      v35 = v9;
      v13 = _Block_copy(v34);

      goto LABEL_15;
    }
    v46[0] = v12;
    v46[1] = 3221225472;
    v46[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_4;
    v46[3] = &unk_1E16C4C98;
    v20 = v9;
    v47 = v20;
    v48 = self;
    v49 = width;
    v50 = height;
    v51 = a4;
    v18 = _Block_copy(v46);
    v41[0] = v12;
    v41[1] = 3221225472;
    v41[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_7;
    v41[3] = &unk_1E16C4CC0;
    v41[4] = self;
    v43 = width;
    v44 = height;
    v45 = a4;
    v21 = v20;
    v42 = v21;
    v13 = _Block_copy(v41);
    v39[0] = v12;
    v39[1] = 3221225472;
    v39[2] = __58___UIImageContent_renditionWithSize_scale_applyingEffect___block_invoke_10;
    v39[3] = &unk_1E16C4D80;
    v40 = v21;
    v19 = _Block_copy(v39);

  }
  v11 = 1;
  if (!v18)
    goto LABEL_16;
LABEL_17:
  +[_UIImageContentRenditionResult resultWithDrawingProvider:CGImageProvider:rbSymbolConfigurationProvider:]((uint64_t)_UIImageContentRenditionResult, v13, v18, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && v11)
  {
    -[_UIImageContentContextualEffect _renditionWithRenditionResult:size:]((uint64_t)v9, v22, width, height);
    v23 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[_UIImageContentRendition renditionWithResult:]((uint64_t)_UIImageContentRendition, v22);
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v23;

  return v24;
}

- (BOOL)hasCGImage
{
  return 0;
}

- (_UIImageContent)initWithScale:(double)a3
{
  _UIImageContent *result;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIImageContent;
  result = -[_UIImageContent init](&v6, sel_init);
  if (result)
  {
    v5 = 1.0;
    if (a3 > 0.0)
      v5 = a3;
    result->_scale = v5;
  }
  return result;
}

- (void)_setCGImageSource:(CGImageSource *)a3
{
  objc_setAssociatedObject(self, &_UIImageContentCGImageSourceKey, a3, (void *)0x301);
}

- (unint64_t)numberOfHierarchyLayers
{
  return 0;
}

- (CIImage)CIImage
{
  return 0;
}

- (CGImage)CGImage
{
  return 0;
}

- (BOOL)isDecompressing
{
  return 0;
}

- (BOOL)isPreparedCGImage
{
  return 0;
}

- (BOOL)isCGImageOnly
{
  uint64_t v2;

  v2 = objc_opt_class();
  return v2 == objc_opt_class();
}

+ (void)_cachePreparedContent:(void *)a3 forDisplayOfContent:
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = a2;
  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_37);
  v5 = (void *)qword_1ECD79540;
  if (!qword_1ECD79540)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)qword_1ECD79540;
    qword_1ECD79540 = v6;

    v5 = (void *)qword_1ECD79540;
  }
  objc_msgSend(v5, "setObject:forKey:", v4, v8);
  objc_msgSend((id)qword_1ECD79540, "setObject:forKey:", v4, v4);

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_37);
}

- (id)_existingPreparedContentForDisplay
{
  id v1;

  v1 = a1;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_37);
    objc_msgSend((id)qword_1ECD79540, "objectForKey:", v1);
    v1 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_37);
  }
  return v1;
}

- (id)imageRendererFormat
{
  return +[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat");
}

- (_UIImageContent)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIImageContent.m"), 91, CFSTR("You can't just init an _UIImageContent!"));

  return 0;
}

- (NSString)typeName
{
  return (NSString *)CFSTR("generic");
}

- (BOOL)isCGImage
{
  return 0;
}

- (double)imageMaximumHeadroom
{
  _BOOL4 v2;
  double result;

  v2 = -[_UIImageContent isHDR](self, "isHDR");
  result = 1.0;
  if (v2)
    return 8.0;
  return result;
}

- (BOOL)prefersProvidingNonCGImageContentsDirectlyForRendering
{
  return 0;
}

- (BOOL)canEmitVectorDrawingCommands
{
  return 0;
}

- (BOOL)_canProvideCGImageDirectly
{
  return 0;
}

- (CGImageSource)CGImageSource
{
  return (CGImageSource *)objc_getAssociatedObject(self, &_UIImageContentCGImageSourceKey);
}

- (id)contentPreparedForDisplay
{
  return 0;
}

- (BOOL)prepareContentForDisplayWithCompletionHandler:(id)a3
{
  return 0;
}

- (id)contentOptimizedForImageSize:(CGSize)a3
{
  return 0;
}

- (BOOL)optimizeContentForImageSize:(CGSize)a3 completionHandler:(id)a4
{
  return 0;
}

- (BOOL)canRenderCIImage
{
  return 0;
}

- (__IOSurface)IOSurface
{
  return 0;
}

- (BOOL)isIOSurface
{
  return 0;
}

- (CGPDFPage)CGPDFPage
{
  return 0;
}

- (BOOL)isCGPDFPage
{
  return 0;
}

- (CGSize)CGPDFPageSize
{
  _UIImageContent *v3;
  double width;
  double height;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;
  CGRect BoxRect;

  if (-[_UIImageContent isCGPDFPage](self, "isCGPDFPage"))
  {
    v3 = objc_retainAutorelease(self);
    BoxRect = CGPDFPageGetBoxRect(-[_UIImageContent CGPDFPage](v3, "CGPDFPage"), kCGPDFMediaBox);
    width = BoxRect.size.width;
    height = BoxRect.size.height;
    -[_UIImageContent vectorScale](v3, "vectorScale", BoxRect.origin.x, BoxRect.origin.y);
    v7 = width / v6;
    -[_UIImageContent vectorScale](v3, "vectorScale");
    v9 = height / v8;
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D820];
    v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v10 = v7;
  result.height = v9;
  result.width = v10;
  return result;
}

- (CGSVGDocument)CGSVGDocument
{
  return 0;
}

- (BOOL)isCGSVGDocument
{
  return 0;
}

- (CGSize)CGSVGDocumentSize
{
  _UIImageContent *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  if (-[_UIImageContent isCGSVGDocument](self, "isCGSVGDocument"))
  {
    v3 = objc_retainAutorelease(self);
    -[_UIImageContent CGSVGDocument](v3, "CGSVGDocument");
    CGSVGDocumentGetCanvasSize();
    v5 = v4;
    v7 = v6;
    -[_UIImageContent vectorScale](v3, "vectorScale");
    v9 = v5 / v8;
    -[_UIImageContent vectorScale](v3, "vectorScale");
    v11 = v7 / v10;
  }
  else
  {
    v9 = *MEMORY[0x1E0C9D820];
    v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v12 = v9;
  result.height = v11;
  result.width = v12;
  return result;
}

- (BOOL)containsNamedColorStyle:(id)a3
{
  return 0;
}

- (unint64_t)numberOfPaletteLayers
{
  return 0;
}

- (CUINamedVectorGlyph)vectorGlyph
{
  return 0;
}

- (double)vectorScale
{
  return self->_scale;
}

- (UIBezierPath)outlinePath
{
  return 0;
}

- (unint64_t)hash
{
  return (unint64_t)self->_scale;
}

- (_UIImageContent)contentWithCGImage:(CGImage *)a3
{
  return 0;
}

- (BOOL)_isSameSymbolImageContentExceptVariableValue:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  char v13;

  v4 = a3;
  -[_UIImageContent vectorGlyph](self, "vectorGlyph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "variableMinValue");
  if (v6 != INFINITY || (objc_msgSend(v5, "variableMaxValue"), v7 != INFINITY))
  {
    v8 = (void *)objc_msgSend(v5, "copy");

    objc_msgSend(v8, "setVariableMinValue:", INFINITY);
    objc_msgSend(v8, "setVariableMaxValue:", INFINITY);
    v5 = v8;
  }
  objc_msgSend(v4, "vectorGlyph");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "variableMinValue");
  if (v10 != INFINITY || (objc_msgSend(v9, "variableMaxValue"), v11 != INFINITY))
  {
    v12 = (void *)objc_msgSend(v9, "copy");

    objc_msgSend(v12, "setVariableMinValue:", INFINITY);
    objc_msgSend(v12, "setVariableMaxValue:", INFINITY);
    v9 = v12;
  }
  v13 = 0;
  if (v5 && v9)
    v13 = objc_msgSend(v5, "isEqual:", v9);

  return v13;
}

- (void)_prepareForDrawingWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5
{
  double v7;

  -[_UIImageContent scale](self, "scale", a3.width, a3.height);
  CGContextScaleCTM(a5, a4 / v7, a4 / v7);
}

- (CGImage)_provideCGImageWithSize:(CGSize)a3 scale:(double)a4
{
  return 0;
}

- (void)_drawVectorGlyphWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 namedColorResolver:(id)a6
{
  -[_UIImageContent _drawWithSize:scale:inContext:effect:](self, "_drawWithSize:scale:inContext:effect:", a5, 0, a3.width, a3.height, a4);
}

- (void)_drawVectorGlyphWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 hierarchicalColorResolver:(id)a6
{
  -[_UIImageContent _drawWithSize:scale:inContext:effect:](self, "_drawWithSize:scale:inContext:effect:", a5, 0, a3.width, a3.height, a4);
}

- (void)_drawVectorGlyphWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 paletteColors:(id)a6
{
  -[_UIImageContent _drawWithSize:scale:inContext:effect:](self, "_drawWithSize:scale:inContext:effect:", a5, 0, a3.width, a3.height, a4);
}

- (id)debugDescription
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[_UIImageContent size](self, "size");
  v4 = v3;
  v6 = v5;
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_opt_class();
  -[_UIImageContent description](self, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@:%p (%g,%g) [%@]>"), v8, self, v4, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)debugQuickLookObject
{
  return -[UIImage _initWithContent:orientation:]([UIImage alloc], "_initWithContent:orientation:", self, 0);
}

- (CGSize)sizeInPixels
{
  double width;
  double height;
  CGSize result;

  width = self->_sizeInPixels.width;
  height = self->_sizeInPixels.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setIsDecompressing:(BOOL)a3
{
  self->_isDecompressing = a3;
}

@end
