@implementation _UIImageMultiVectorGlyphContent

- (_UIImageMultiVectorGlyphContent)initWithSize:(CGSize)a3 glyphs:(id)a4 colors:(id)a5 offsets:(id)a6 scaleFactors:(id)a7 anchorPoint:(CGPoint)a8
{
  CGFloat y;
  CGFloat x;
  double height;
  double width;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _UIImageMultiVectorGlyphContent *v22;
  uint64_t v23;
  NSArray *glyphs;
  uint64_t v25;
  NSArray *colors;
  uint64_t v27;
  NSArray *offsets;
  uint64_t v29;
  NSArray *scaleFactors;
  double v31;
  CGFloat v32;
  double v33;
  void *v35;
  objc_super v36;

  y = a8.y;
  x = a8.x;
  height = a3.height;
  width = a3.width;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  if (!objc_msgSend(v17, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIImageContent.m"), 2314, CFSTR("Need to pass some glyhps"));

  }
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "scale");
  v36.receiver = self;
  v36.super_class = (Class)_UIImageMultiVectorGlyphContent;
  v22 = -[_UIImageContent initWithScale:](&v36, sel_initWithScale_);

  if (v22)
  {
    v23 = objc_msgSend(v17, "copy");
    glyphs = v22->_glyphs;
    v22->_glyphs = (NSArray *)v23;

    v25 = objc_msgSend(v18, "copy");
    colors = v22->_colors;
    v22->_colors = (NSArray *)v25;

    v27 = objc_msgSend(v19, "copy");
    offsets = v22->_offsets;
    v22->_offsets = (NSArray *)v27;

    v29 = objc_msgSend(v20, "copy");
    scaleFactors = v22->_scaleFactors;
    v22->_scaleFactors = (NSArray *)v29;

    -[_UIImageContent scale](v22, "scale");
    v32 = width * v31;
    -[_UIImageContent scale](v22, "scale");
    v22->_sizeInPixels.width = v32;
    v22->_sizeInPixels.height = height * v33;
    v22->_anchorPoint.x = x;
    v22->_anchorPoint.y = y;
  }

  return v22;
}

- (_UIImageMultiVectorGlyphContent)initWithScale:(double)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIImageContent.m"), 2332, CFSTR("You need to use -initWithCGImage:CUIVectorGlyph:scale:symbolScaleFactor:"));

  return 0;
}

- (void)dealloc
{
  CGImage *imageRef;
  objc_super v4;

  imageRef = self->_imageRef;
  if (imageRef)
    CGImageRelease(imageRef);
  v4.receiver = self;
  v4.super_class = (Class)_UIImageMultiVectorGlyphContent;
  -[_UIImageMultiVectorGlyphContent dealloc](&v4, sel_dealloc);
}

- (id)typeName
{
  return CFSTR("multiSymbol");
}

- (BOOL)isCGImage
{
  return 1;
}

- (BOOL)canScaleImageToTargetResolution
{
  return 1;
}

- (BOOL)canEmitVectorDrawingCommands
{
  return 0;
}

- (BOOL)isVectorGlyph
{
  return 1;
}

- (BOOL)containsNamedColorStyles
{
  return 1;
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

- (double)vectorScale
{
  return 2.0;
}

- (CGImage)CGImage
{
  CGImage *result;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  UIGraphicsImageRenderer *v11;
  UIGraphicsImageRenderer *v12;
  id v13;
  _QWORD v14[8];

  result = self->_imageRef;
  if (!result)
  {
    -[_UIImageContent scale](self, "scale");
    v5 = v4;
    -[_UIImageContent size](self, "size");
    v7 = v6;
    v9 = v8;
    +[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setScale:", v5);
    v11 = [UIGraphicsImageRenderer alloc];
    -[_UIImageContent size](self, "size");
    v12 = -[UIGraphicsImageRenderer initWithSize:format:](v11, "initWithSize:format:", v10);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __42___UIImageMultiVectorGlyphContent_CGImage__block_invoke;
    v14[3] = &unk_1E16C4EB8;
    v14[4] = self;
    v14[5] = v7;
    v14[6] = v9;
    *(double *)&v14[7] = v5;
    -[UIGraphicsImageRenderer imageWithActions:](v12, "imageWithActions:", v14);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    self->_imageRef = (CGImage *)CFRetain((CFTypeRef)objc_msgSend(v13, "CGImage"));

    return self->_imageRef;
  }
  return result;
}

- (void)_prepareForDrawingWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5
{
  double height;
  double width;
  double v9;
  double v10;
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)_UIImageMultiVectorGlyphContent;
  -[_UIImageContent _prepareForDrawingWithSize:scale:inContext:](&v11, sel__prepareForDrawingWithSize_scale_inContext_, a3.width, a3.height, a4);
  CGContextTranslateCTM(a5, 0.0, height);
  CGContextScaleCTM(a5, 1.0, -1.0);
  -[_UIImageContent size](self, "size");
  CGContextScaleCTM(a5, width / v9, height / v10);
}

- (void)_drawWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 effect:(id)a6
{
  CGFloat height;
  CGFloat width;
  double v11;
  double v12;
  uint64_t v13;
  unint64_t v14;
  int *v15;
  CGFloat v16;
  unint64_t v17;
  int *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  float v33;
  double v34;
  double v35;
  double *v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  uint64_t v45;
  void *v46;
  void *v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGImage *v52;
  int *v53;
  int *v54;
  unint64_t v55;
  void *v56;
  CGFloat v57;
  CGFloat v58;
  CGImage *v59;
  uint64_t v60;
  CGFloat v61;
  CGFloat v62;
  double v63;
  double v64;
  double v65;
  CGFloat rect;
  id rect_8;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  height = a3.height;
  width = a3.width;
  rect_8 = a6;
  -[_UIImageContent size](self, "size");
  v64 = v12;
  v65 = v11;
  v13 = 40;
  if (-[NSArray count](self->_glyphs, "count"))
  {
    v14 = 0;
    v15 = &OBJC_IVAR____UIImageMultiVectorGlyphContent__colors;
    v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v61 = *MEMORY[0x1E0C9D538];
    v62 = width;
    v17 = 0x1E0C99000uLL;
    v18 = &OBJC_IVAR____UIImageMultiVectorGlyphContent__scaleFactors;
    v19 = 1.0;
    v63 = height;
    v60 = 40;
    do
    {
      CGContextSaveGState(a5);
      objc_msgSend(*(id *)((char *)&self->super.super.isa + v13), "objectAtIndexedSubscript:", v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)((char *)&self->super.super.isa + v15[1]), "objectAtIndexedSubscript:", v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "CGPointValue");
      v23 = v22;
      v25 = v24;

      objc_msgSend(*(id *)((char *)&self->super.super.isa + *v15), "objectAtIndexedSubscript:", v14);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v17 + 3640), "null");
      v27 = (id)objc_claimAutoreleasedReturnValue();

      if (v26 == v27)
      {

        v26 = 0;
      }
      objc_msgSend(v20, "size", v60);
      v29 = v28;
      v31 = v30;
      objc_msgSend(*(id *)((char *)&self->super.super.isa + *v18), "objectAtIndexedSubscript:", v14);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "floatValue");
      v34 = v33;

      v35 = v29 * v34;
      v36 = (double *)((char *)self + v18[2]);
      UIRoundToScale(v23 + (v65 - v35) * *v36, a4);
      rect = v37;
      v38 = v31 * v34;
      UIRoundToScale((v64 - v38) * (v19 - v36[1]) - v25, a4);
      v40 = v39;
      UIRoundToScale(v35, a4);
      v42 = v41;
      UIRoundToScale(v38, a4);
      v44 = v43;
      if (!rect_8 || v26)
      {
        objc_msgSend(v20, "renditionWithSize:scale:applyingEffect:", 0, v42, v43, a4);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v63;
        if (v26)
          goto LABEL_10;
      }
      else
      {
        objc_msgSend(v20, "renditionWithSize:scale:applyingEffect:", rect_8, v42, v43, a4);
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = (void *)v45;
        if (v45)
          v47 = *(void **)(v45 + 40);
        else
          v47 = 0;
        v48 = v63;
        v26 = v47;
        if (v26)
        {
LABEL_10:
          objc_msgSend(v26, "alphaComponent");
          if (v49 > 0.0)
          {
            v50 = v40;
            objc_msgSend(v26, "alphaComponent");
            if (v51 >= v19)
            {
              v58 = v61;
              v57 = v62;
            }
            else
            {
              CGContextSaveGState(a5);
              CGContextSetBlendMode(a5, kCGBlendModeDestinationOut);
              CGContextBeginTransparencyLayer(a5, 0);
              v52 = (CGImage *)-[_UIImageContentRendition CGImage]((uint64_t)objc_retainAutorelease(v46));
              v68.origin.x = rect;
              v68.origin.y = v40;
              v68.size.width = v42;
              v68.size.height = v44;
              CGContextDrawImage(a5, v68, v52);
              CGContextScaleCTM(a5, a4, a4);
              +[UIColor blackColor](UIColor, "blackColor");
              v53 = v18;
              v54 = v15;
              v55 = v17;
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "setFill");

              v17 = v55;
              v15 = v54;
              v18 = v53;
              v13 = v60;
              CGContextSetBlendMode(a5, kCGBlendModeSourceIn);
              v58 = v61;
              v57 = v62;
              v69.origin.x = v61;
              v69.origin.y = v16;
              v69.size.width = v62;
              v69.size.height = v48;
              CGContextFillRect(a5, v69);
              CGContextEndTransparencyLayer(a5);
              CGContextSetBlendMode(a5, kCGBlendModeNormal);
              CGContextRestoreGState(a5);
            }
            CGContextBeginTransparencyLayer(a5, 0);
            v59 = (CGImage *)-[_UIImageContentRendition CGImage]((uint64_t)objc_retainAutorelease(v46));
            v70.origin.x = rect;
            v70.origin.y = v50;
            v70.size.width = v42;
            v70.size.height = v44;
            CGContextDrawImage(a5, v70, v59);
            CGContextScaleCTM(a5, a4, a4);
            objc_msgSend(v26, "setFill");
            CGContextSetBlendMode(a5, kCGBlendModeSourceIn);
            v71.origin.x = v58;
            v71.origin.y = v16;
            v71.size.width = v57;
            v71.size.height = v48;
            CGContextFillRect(a5, v71);
            CGContextEndTransparencyLayer(a5);
            v19 = 1.0;
          }
          goto LABEL_17;
        }
      }
      -[_UIImageContentRendition drawInContext:]((uint64_t)v46);
LABEL_17:
      CGContextRestoreGState(a5);

      ++v14;
    }
    while (v14 < objc_msgSend(*(id *)((char *)&self->super.super.isa + v13), "count"));
  }

}

- (id)description
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSUInteger v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_glyphs, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = self->_glyphs;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8);
        if (v9)
          v10 = *(id *)(v9 + 40);
        else
          v10 = 0;
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v6 = v12;
    }
    while (v12);
  }

  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = -[NSArray count](self->_glyphs, "count");
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("composite-symbol:(%ld:%@)"), v14, v15, (_QWORD)v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  BOOL v9;
  int v10;
  char v11;
  NSArray *colors;
  void *v13;
  NSArray *v14;
  BOOL v15;

  v4 = a3;
  if (!+[_UIImageContent content:isEqualToContent:]((uint64_t)_UIImageContent, self, v4))
    goto LABEL_8;
  v5 = (void *)v4[5];
  v6 = self->_glyphs;
  v7 = v5;
  if (v6 == v7)
  {

    goto LABEL_10;
  }
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
    goto LABEL_16;
  v10 = -[NSArray isEqual:](v6, "isEqual:", v7);

  if (v10)
  {
LABEL_10:
    colors = self->_colors;
    v13 = (void *)v4[6];
    v6 = colors;
    v14 = v13;
    if (v6 == v14)
    {
      v11 = 1;
      v8 = v6;
      goto LABEL_18;
    }
    v8 = v14;
    if (v6)
      v15 = v14 == 0;
    else
      v15 = 1;
    if (!v15)
    {
      v11 = -[NSArray isEqual:](v6, "isEqual:", v14);
LABEL_18:

      goto LABEL_19;
    }
LABEL_16:
    v11 = 0;
    goto LABEL_18;
  }
LABEL_8:
  v11 = 0;
LABEL_19:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scaleFactors, 0);
  objc_storeStrong((id *)&self->_offsets, 0);
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_glyphs, 0);
}

@end
