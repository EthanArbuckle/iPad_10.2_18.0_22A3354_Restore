@implementation _UIImageCUIVectorGlyphContent

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  void *v5;
  CUINamedVectorGlyph *v6;
  CUINamedVectorGlyph *v7;
  CUINamedVectorGlyph *v8;
  BOOL v9;
  char v10;

  v4 = a3;
  if (+[_UIImageContent content:isEqualToContent:]((uint64_t)_UIImageContent, self, v4))
  {
    v5 = (void *)v4[5];
    v6 = self->_vectorGlyph;
    v7 = v5;
    v8 = v7;
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      if (v6)
        v9 = v7 == 0;
      else
        v9 = 1;
      if (v9)
        v10 = 0;
      else
        v10 = -[CUINamedVectorGlyph isEqual:](v6, "isEqual:", v7);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isVectorGlyph
{
  return self->_vectorGlyph != 0;
}

- (BOOL)containsNamedColorStyles
{
  int *p_isMultiColor;
  unsigned int v3;

  p_isMultiColor = &self->_isMultiColor;
  v3 = atomic_load((unsigned int *)&self->_isMultiColor);
  if ((v3 & 0x80000000) != 0)
  {
    v3 = -[CUINamedVectorGlyph containsNamedColorStyles](self->_vectorGlyph, "containsNamedColorStyles");
    atomic_store(v3, (unsigned int *)p_isMultiColor);
  }
  return v3 != 0;
}

- (double)variableValue
{
  double result;

  -[CUINamedVectorGlyph variableMaxValue](self->_vectorGlyph, "variableMaxValue");
  return result;
}

- (_UIImageCUIVectorGlyphContent)contentWithVariableValue:(double)a3
{
  double v5;
  _UIImageCUIVectorGlyphContent *v6;
  void *v7;
  _UIImageCUIVectorGlyphContent *v8;
  void *v9;
  objc_super v11;

  -[_UIImageCUIVectorGlyphContent variableValue](self, "variableValue");
  if (v5 == a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIImageCUIVectorGlyphContent;
    -[_UIImageContent contentWithVariableValue:](&v11, sel_contentWithVariableValue_, a3);
    v8 = (_UIImageCUIVectorGlyphContent *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = [_UIImageCUIVectorGlyphContent alloc];
    v7 = (void *)-[CUINamedVectorGlyph copy](self->_vectorGlyph, "copy");
    -[_UIImageContent scale](self, "scale");
    v8 = -[_UIImageCUIVectorGlyphContent initWithCUIVectorGlyph:scale:](v6, "initWithCUIVectorGlyph:scale:", v7);

    -[_UIImageCUIVectorGlyphContent vectorGlyph](v8, "vectorGlyph");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setVariableMaxValue:", a3);

  }
  return v8;
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

- (BOOL)canScaleImageToTargetResolution
{
  return 1;
}

- (unint64_t)hash
{
  return -[CUINamedVectorGlyph hash](self->_vectorGlyph, "hash");
}

- (BOOL)_canProvideCGImageDirectly
{
  return 1;
}

- (CGImage)_provideCGImageWithSize:(CGSize)a3 scale:(double)a4
{
  CGImage *v4;
  double height;
  double width;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  CGImageRef v13;

  v4 = 0;
  if (a3.width > 0.0)
  {
    height = a3.height;
    if (a3.height > 0.0)
    {
      width = a3.width;
      -[_UIImageContent size](self, "size");
      v11 = width == v10 && height == v9;
      if (v11 && (-[_UIImageContent scale](self, "scale"), v12 == a4))
        v13 = CGImageRetain(-[_UIImageCUIVectorGlyphContent CGImage](objc_retainAutorelease(self), "CGImage"));
      else
        v13 = (CGImageRef)-[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:](self->_vectorGlyph, "rasterizeImageUsingScaleFactor:forTargetSize:", a4, width, height);
      v4 = v13;
      if (v13)
        CFAutorelease(v13);
    }
  }
  return v4;
}

- (CGImage)_provideVectorGlyphCGImageWithSize:(CGSize)a3 scale:(double)a4 namedColorResolver:(id)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
  CGImage *v12;
  double v13;
  double v14;
  double v15;
  CGImageRef v16;
  CUINamedVectorGlyph *vectorGlyph;
  _QWORD aBlock[4];
  id v20;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __93___UIImageCUIVectorGlyphContent__provideVectorGlyphCGImageWithSize_scale_namedColorResolver___block_invoke;
    aBlock[3] = &unk_1E16C4E68;
    v20 = v9;
    v11 = _Block_copy(aBlock);

  }
  else
  {
    v11 = 0;
  }
  v12 = 0;
  if (width > 0.0 && height > 0.0)
  {
    -[_UIImageContent size](self, "size");
    if (width == v14 && height == v13 && (-[_UIImageContent scale](self, "scale"), v15 == a4))
    {
      if (v11)
        v16 = (CGImageRef)-[CUINamedVectorGlyph imageWithColorResolver:](self->_vectorGlyph, "imageWithColorResolver:", v11);
      else
        v16 = CGImageRetain(-[_UIImageCUIVectorGlyphContent CGImage](objc_retainAutorelease(self), "CGImage"));
    }
    else
    {
      vectorGlyph = self->_vectorGlyph;
      if (v11)
        v16 = (CGImageRef)-[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withColorResolver:](vectorGlyph, "rasterizeImageUsingScaleFactor:forTargetSize:withColorResolver:", v11, a4, width, height);
      else
        v16 = (CGImageRef)-[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:](vectorGlyph, "rasterizeImageUsingScaleFactor:forTargetSize:", a4, width, height);
    }
    v12 = v16;
    if (v16)
      CFAutorelease(v16);
  }

  return v12;
}

- (_UIImageCUIVectorGlyphContent)initWithCUIVectorGlyph:(id)a3 scale:(double)a4
{
  id v8;
  _UIImageCUIVectorGlyphContent *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v18;
  objc_super v19;

  v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_UIImageCUIVectorGlyphContent;
  v9 = -[_UIImageContent initWithScale:](&v19, sel_initWithScale_, a4);
  if (v9)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("_UIImageContent.m"), 1899, CFSTR("Need a valid vector glyph!"));

    }
    objc_msgSend(v8, "pointSize");
    v11 = v10;
    objc_msgSend(v8, "referencePointSize");
    v9->_glyphScaleFactor = v11 / v12;
    objc_storeStrong((id *)&v9->_vectorGlyph, a3);
    -[_UIImageContent scale](v9, "scale");
    v14 = v13;
    -[CUINamedVectorGlyph alignmentRect](v9->_vectorGlyph, "alignmentRect");
    v9->_sizeInPixels.width = v14 * v15;
    v9->_sizeInPixels.height = v14 * v16;
    atomic_store(0xFFFFFFFF, (unsigned int *)&v9->_isMultiColor);
    atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)&v9->_numberOfHierarchyLayers);
    atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)&v9->_numberOfPaletteLayers);
  }

  return v9;
}

- (_UIImageCUIVectorGlyphContent)contentWithCGImage:(CGImage *)a3
{
  _UIImageCUIVectorGlyphContent *v5;
  CUINamedVectorGlyph *vectorGlyph;
  _UIImageCUIVectorGlyphContent *v7;

  v5 = [_UIImageCUIVectorGlyphContent alloc];
  vectorGlyph = self->_vectorGlyph;
  -[_UIImageContent scale](self, "scale");
  v7 = -[_UIImageCUIVectorGlyphContent initWithCUIVectorGlyph:scale:](v5, "initWithCUIVectorGlyph:scale:", vectorGlyph);
  v7->_overrideImageRef = CGImageRetain(a3);
  return v7;
}

- (id)_automaticSymbolConfiguration
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v10;
  objc_super v11;
  uint8_t buf[16];

  v3 = -[CUINamedVectorGlyph preferredRenderingMode](self->_vectorGlyph, "preferredRenderingMode");
  if (v3 == 1)
  {
    +[UIImageSymbolConfiguration configurationPreferringMonochrome](UIImageSymbolConfiguration, "configurationPreferringMonochrome");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v5 = (void *)v6;
    return v5;
  }
  if (v3 == 2)
  {
    +[UIImageSymbolConfiguration configurationPreferringMulticolor](UIImageSymbolConfiguration, "configurationPreferringMulticolor");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (v3 != 3)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "SF Symbol has a preferred rendering mode unsupported by UIKit. This is an internal UIKit bug.", buf, 2u);
      }

    }
    else
    {
      v7 = _automaticSymbolConfiguration___s_category;
      if (!_automaticSymbolConfiguration___s_category)
      {
        v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&_automaticSymbolConfiguration___s_category);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "SF Symbol has a preferred rendering mode unsupported by UIKit. This is an internal UIKit bug.", buf, 2u);
      }
    }
    v11.receiver = self;
    v11.super_class = (Class)_UIImageCUIVectorGlyphContent;
    -[_UIImageContent _automaticSymbolConfiguration](&v11, sel__automaticSymbolConfiguration);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  +[UIColor tintColor](UIColor, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImageSymbolConfiguration configurationWithHierarchicalColor:](UIImageSymbolConfiguration, "configurationWithHierarchicalColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)numberOfHierarchyLayers
{
  int64_t *p_numberOfHierarchyLayers;
  unint64_t v3;

  p_numberOfHierarchyLayers = &self->_numberOfHierarchyLayers;
  v3 = atomic_load((unint64_t *)&self->_numberOfHierarchyLayers);
  if ((v3 & 0x8000000000000000) != 0)
  {
    v3 = -[CUINamedVectorGlyph numberOfHierarchyLayers](self->_vectorGlyph, "numberOfHierarchyLayers");
    atomic_store(v3, (unint64_t *)p_numberOfHierarchyLayers);
  }
  return v3;
}

- (void)dealloc
{
  CGImage *overrideImageRef;
  objc_super v4;

  overrideImageRef = self->_overrideImageRef;
  if (overrideImageRef)
    CGImageRelease(overrideImageRef);
  v4.receiver = self;
  v4.super_class = (Class)_UIImageCUIVectorGlyphContent;
  -[_UIImageCUIVectorGlyphContent dealloc](&v4, sel_dealloc);
}

- (BOOL)containsNamedColorStyle:(id)a3
{
  int v4;

  v4 = -[CUINamedVectorGlyph containsNamedColorStyle:](self->_vectorGlyph, "containsNamedColorStyle:", a3);
  if (v4)
    atomic_store(MEMORY[0x1E0C9AAB0], (unsigned int *)&self->_isMultiColor);
  return v4;
}

- (CGImage)_provideVectorGlyphCGImageWithSize:(CGSize)a3 scale:(double)a4 paletteColors:(id)a5
{
  double height;
  double width;
  void *v9;
  unint64_t v10;
  id v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  const void *v16;

  if (a3.width <= 0.0)
    return 0;
  height = a3.height;
  if (a3.height <= 0.0)
    return 0;
  width = a3.width;
  v9 = (void *)objc_msgSend(a5, "mutableCopy");
  if (objc_msgSend(v9, "count"))
  {
    v10 = 0;
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v9, "setObject:atIndexedSubscript:", objc_msgSend(v11, "CGColor"), v10);

      ++v10;
    }
    while (objc_msgSend(v9, "count") > v10);
  }
  -[_UIImageContent size](self, "size");
  if (width == v13 && height == v12 && (-[_UIImageContent scale](self, "scale"), v14 == a4))
    v15 = -[CUINamedVectorGlyph imageWithPaletteColors:](self->_vectorGlyph, "imageWithPaletteColors:", v9);
  else
    v15 = -[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withPaletteColors:](self->_vectorGlyph, "rasterizeImageUsingScaleFactor:forTargetSize:withPaletteColors:", v9, a4, width, height);
  v16 = (const void *)v15;

  if (v16)
    return (CGImage *)CFAutorelease(v16);
  else
    return 0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CUINamedVectorGlyph debugDescription](self->_vectorGlyph, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p vectorGlyph:%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGImage)_provideVectorGlyphCGImageWithSize:(CGSize)a3 scale:(double)a4 hierarchicalColorResolver:(id)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
  CGImage *v12;
  double v13;
  double v14;
  double v15;
  CGImageRef v16;
  CUINamedVectorGlyph *vectorGlyph;
  _QWORD aBlock[4];
  id v20;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __100___UIImageCUIVectorGlyphContent__provideVectorGlyphCGImageWithSize_scale_hierarchicalColorResolver___block_invoke;
    aBlock[3] = &unk_1E16C4E90;
    v20 = v9;
    v11 = _Block_copy(aBlock);

  }
  else
  {
    v11 = 0;
  }
  v12 = 0;
  if (width > 0.0 && height > 0.0)
  {
    -[_UIImageContent size](self, "size");
    if (width == v14 && height == v13 && (-[_UIImageContent scale](self, "scale"), v15 == a4))
    {
      if (v11)
        v16 = (CGImageRef)-[CUINamedVectorGlyph imageWithHierarchyColorResolver:](self->_vectorGlyph, "imageWithHierarchyColorResolver:", v11);
      else
        v16 = CGImageRetain(-[_UIImageCUIVectorGlyphContent CGImage](objc_retainAutorelease(self), "CGImage"));
    }
    else
    {
      vectorGlyph = self->_vectorGlyph;
      if (v11)
        v16 = (CGImageRef)-[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withHierarchyColorResolver:](vectorGlyph, "rasterizeImageUsingScaleFactor:forTargetSize:withHierarchyColorResolver:", v11, a4, width, height);
      else
        v16 = (CGImageRef)-[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:](vectorGlyph, "rasterizeImageUsingScaleFactor:forTargetSize:", a4, width, height);
    }
    v12 = v16;
    if (v16)
      CFAutorelease(v16);
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vectorContent, 0);
  objc_storeStrong((id *)&self->_vectorGlyph, 0);
}

- (CGImage)CGImage
{
  if (self->_overrideImageRef)
    return self->_overrideImageRef;
  else
    return (CGImage *)-[CUINamedVectorGlyph image](self->_vectorGlyph, "image");
}

- (BOOL)isCGImage
{
  return 1;
}

- (_UIImageCUIVectorGlyphContent)initWithScale:(double)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIImageContent.m"), 1918, CFSTR("You need to use -initWithCGImage:CUIVectorGlyph:scale:"));

  return 0;
}

- (id)typeName
{
  return CFSTR("symbol");
}

- (double)glyphScaleFactor
{
  return self->_glyphScaleFactor;
}

- (double)vectorScale
{
  return 2.0;
}

- (id)outlinePath
{
  void *v2;

  v2 = (void *)-[CUINamedVectorGlyph CGPath](self->_vectorGlyph, "CGPath");
  if (v2)
  {
    +[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", v2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (BOOL)canEmitVectorDrawingCommands
{
  return 1;
}

- (id)vectorGlyph
{
  return self->_vectorGlyph;
}

- (unint64_t)numberOfPaletteLayers
{
  int64_t *p_numberOfPaletteLayers;
  unint64_t v3;

  p_numberOfPaletteLayers = &self->_numberOfPaletteLayers;
  v3 = atomic_load((unint64_t *)&self->_numberOfPaletteLayers);
  if ((v3 & 0x8000000000000000) != 0)
  {
    v3 = -[CUINamedVectorGlyph numberOfPaletteLayers](self->_vectorGlyph, "numberOfPaletteLayers");
    atomic_store(v3, (unint64_t *)p_numberOfPaletteLayers);
  }
  return v3;
}

- (void)_prepareForDrawingWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5
{
  double height;
  double width;
  double v8;
  double v9;

  height = a3.height;
  width = a3.width;
  -[_UIImageContent size](self, "size", a3.width, a3.height, a4);
  CGContextScaleCTM(a5, width / v8, height / v9);
}

- (void)_drawWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 effect:(id)a6
{
  if (a3.width > 0.0 && a3.height > 0.0)
    -[CUINamedVectorGlyph drawInContext:](self->_vectorGlyph, "drawInContext:", a5, a6);
}

- (void)_drawVectorGlyphWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 namedColorResolver:(id)a6
{
  double height;
  double width;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  _QWORD aBlock[4];
  id v15;

  height = a3.height;
  width = a3.width;
  v10 = a6;
  v11 = v10;
  if (!v10)
  {
    v12 = 0;
    if (width <= 0.0 || height <= 0.0)
      goto LABEL_12;
LABEL_11:
    -[CUINamedVectorGlyph drawInContext:](self->_vectorGlyph, "drawInContext:", a5);
    v12 = 0;
    goto LABEL_12;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __93___UIImageCUIVectorGlyphContent__drawVectorGlyphWithSize_scale_inContext_namedColorResolver___block_invoke;
  aBlock[3] = &unk_1E16C4E68;
  v15 = v10;
  v12 = _Block_copy(aBlock);

  if (width <= 0.0 || height <= 0.0)
    goto LABEL_12;
  if (!v12)
    goto LABEL_11;
  if (-[CUINamedVectorGlyph numberOfMulticolorLayers](self->_vectorGlyph, "numberOfMulticolorLayers"))
  {
    v13 = 0;
    do
      -[CUINamedVectorGlyph drawMulticolorLayerAtIndex:inContext:withColorResolver:](self->_vectorGlyph, "drawMulticolorLayerAtIndex:inContext:withColorResolver:", v13++, a5, v12);
    while (v13 < -[CUINamedVectorGlyph numberOfMulticolorLayers](self->_vectorGlyph, "numberOfMulticolorLayers"));
  }
LABEL_12:

}

- (void)_drawVectorGlyphWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 hierarchicalColorResolver:(id)a6
{
  double height;
  double width;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  _QWORD aBlock[4];
  id v15;

  height = a3.height;
  width = a3.width;
  v10 = a6;
  v11 = v10;
  if (!v10)
  {
    v12 = 0;
    if (width <= 0.0 || height <= 0.0)
      goto LABEL_12;
LABEL_11:
    -[CUINamedVectorGlyph drawInContext:](self->_vectorGlyph, "drawInContext:", a5);
    v12 = 0;
    goto LABEL_12;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __100___UIImageCUIVectorGlyphContent__drawVectorGlyphWithSize_scale_inContext_hierarchicalColorResolver___block_invoke;
  aBlock[3] = &unk_1E16C4E90;
  v15 = v10;
  v12 = _Block_copy(aBlock);

  if (width <= 0.0 || height <= 0.0)
    goto LABEL_12;
  if (!v12)
    goto LABEL_11;
  if (-[CUINamedVectorGlyph numberOfHierarchyLayers](self->_vectorGlyph, "numberOfHierarchyLayers"))
  {
    v13 = 0;
    do
      -[CUINamedVectorGlyph drawHierarchyLayerAtIndex:inContext:withColorResolver:](self->_vectorGlyph, "drawHierarchyLayerAtIndex:inContext:withColorResolver:", v13++, a5, v12);
    while (v13 < -[CUINamedVectorGlyph numberOfHierarchyLayers](self->_vectorGlyph, "numberOfHierarchyLayers"));
  }
LABEL_12:

}

- (void)_drawVectorGlyphWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 paletteColors:(id)a6
{
  unint64_t v8;
  id v9;
  id v10;

  if (a3.width > 0.0 && a3.height > 0.0)
  {
    v10 = (id)objc_msgSend(a6, "mutableCopy");
    if (objc_msgSend(v10, "count"))
    {
      v8 = 0;
      do
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
        v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v10, "setObject:atIndexedSubscript:", objc_msgSend(v9, "CGColor"), v8);

        ++v8;
      }
      while (objc_msgSend(v10, "count") > v8);
    }
    -[CUINamedVectorGlyph drawInContext:withPaletteColors:](self->_vectorGlyph, "drawInContext:withPaletteColors:", a5, v10);

  }
}

- (void)setGlyphScaleFactor:(double)a3
{
  self->_glyphScaleFactor = a3;
}

@end
