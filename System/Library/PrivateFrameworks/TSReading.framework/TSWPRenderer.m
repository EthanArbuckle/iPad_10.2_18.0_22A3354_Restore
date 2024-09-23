@implementation TSWPRenderer

- (void)drawAdornmentRects:(const void *)a3 forColumn:(id)a4 foreground:(BOOL)a5
{
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPath *Mutable;
  CGFloat MaxX;
  void *v16;
  CGColor *v17;
  CGRect v18;

  if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
  {
    CGContextSaveGState(self->_context);
    v8 = *(_QWORD *)a3;
    v9 = *((_QWORD *)a3 + 1);
    if (*(_QWORD *)a3 != v9)
    {
      do
      {
        v11 = *(double *)(v8 + 24);
        v10 = *(double *)(v8 + 32);
        v12 = *(double *)(v8 + 40);
        v13 = *(double *)(v8 + 48);
        if (a5)
        {
          if (*(_QWORD *)(v8 + 8) && *(_DWORD *)v8 == 2)
          {
            CGContextSetShouldAntialias(self->_context, 1);
            if (v13 == 0.0)
            {
              Mutable = CGPathCreateMutable();
              CGPathMoveToPoint(Mutable, 0, v11, v10);
              v18.origin.x = v11;
              v18.origin.y = v10;
              v18.size.width = v12;
              v18.size.height = v13;
              MaxX = CGRectGetMaxX(v18);
              CGPathAddLineToPoint(Mutable, 0, MaxX, v10);
              objc_msgSend(*(id *)(v8 + 8), "paintPath:inContext:", Mutable, self->_context);
              CGPathRelease(Mutable);
            }
            else
            {
              objc_msgSend(*(id *)(v8 + 8), "paintRect:inContext:", self->_context, v11, v10, v12, v13);
            }
          }
          if (*(_QWORD *)(v8 + 16))
          {
            if (*(_DWORD *)v8 == 3)
            {
              objc_opt_class();
              v17 = (CGColor *)objc_msgSend((id)TSUDynamicCast(), "CGColor");
              CGContextSetStrokeColorWithColor(self->_context, v17);
              CGContextSetShouldAntialias(self->_context, 1);
              -[TSWPRenderer p_strokeLineFromPoint:toPoint:width:](self, "p_strokeLineFromPoint:toPoint:width:", v11 + v12 * 0.5, v10, v11 + v12 * 0.5, v10 + v13, v12);
            }
          }
        }
        else
        {
          v16 = *(void **)(v8 + 16);
          if (v16 && *(_DWORD *)v8 == 1)
            objc_msgSend(v16, "paintRect:inContext:", self->_context, *(double *)(v8 + 24), *(double *)(v8 + 32), *(double *)(v8 + 40), *(double *)(v8 + 48));
        }
        v8 += 56;
      }
      while (v8 != v9);
    }
    CGContextRestoreGState(self->_context);
  }
}

- (BOOL)preventClipToColumn
{
  return self->_preventClipToColumn;
}

- (CGRect)getClipBoundingBox
{
  return CGContextGetClipBoundingBox(self->_context);
}

- (void)didRenderFragments
{
  CGContextRestoreGState(self->_context);
}

+ (__CTFont)invisiblesFont
{
  __CTFont *result;
  void *v3;
  double v4;
  CGDataProvider *v5;
  CGFont *v6;
  double UnitsPerEm;
  double v8;
  uint64_t v9;
  double v10;
  double *v11;
  void *v12;
  uint64_t v13;
  int advances;

  result = (__CTFont *)+[TSWPRenderer invisiblesFont]::sInvisibleFont;
  if (!+[TSWPRenderer invisiblesFont]::sInvisibleFont)
  {
    if ((+[TSWPRenderer invisiblesFont]::sInited & 1) != 0)
    {
      return 0;
    }
    else
    {
      +[TSWPRenderer invisiblesFont]::sInited = 1;
      v3 = (void *)objc_msgSend((id)TSWPBundle(), "pathForResource:ofType:", CFSTR("invisible_glyphs"), CFSTR("ttf"));
      v4 = TSWPInvisibleFontSize();
      v5 = CGDataProviderCreateWithFilename((const char *)objc_msgSend(v3, "UTF8String"));
      v6 = CGFontCreateWithDataProvider(v5);
      CGDataProviderRelease(v5);
      +[TSWPRenderer invisiblesFont]::sInvisibleFont = (uint64_t)CTFontCreateWithGraphicsFont(v6, v4, 0, 0);
      UnitsPerEm = (double)CGFontGetUnitsPerEm(v6);
      v8 = v4 * (double)CGFontGetAscent(v6) / UnitsPerEm;
      v9 = 0;
      v10 = v4 * (double)-CGFontGetDescent(v6) / UnitsPerEm;
      do
      {
        v11 = (double *)((char *)&gInvisibles + v9);
        CTFontGetGlyphsForCharacters((CTFontRef)+[TSWPRenderer invisiblesFont]::sInvisibleFont, (const UniChar *)((char *)&gInvisibles + v9), (CGGlyph *)((char *)&gInvisibles + v9 + 32), 1);
        advances = 0;
        if (!CGFontGetGlyphAdvances(v6, (const CGGlyph *)((char *)&gInvisibles + v9 + 32), 1uLL, &advances))
        {
          v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPRenderer invisiblesFont]");
          objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRenderer.mm"), 653, CFSTR("CGFontGetGlyphAdvances failed"));
        }
        v11[1] = v4 * (double)advances / UnitsPerEm;
        v11[2] = v8;
        v11[3] = v10;
        v9 += 40;
      }
      while (v9 != 400);
      CGFontRelease(v6);
      return (__CTFont *)+[TSWPRenderer invisiblesFont]::sInvisibleFont;
    }
  }
  return result;
}

- (void)willRenderFragmentsWithDrawingState:(const void *)a3
{
  CGContext *context;
  void *v6;
  CGContext *v7;
  __int128 v8;
  CGAffineTransform v9;
  CGAffineTransform transform;

  CGContextSaveGState(self->_context);
  context = self->_context;
  v6 = (void *)*((_QWORD *)a3 + 1);
  if (v6)
    objc_msgSend(v6, "transformFromWP");
  else
    memset(&transform, 0, sizeof(transform));
  CGContextConcatCTM(context, &transform);
  v7 = self->_context;
  v8 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v9.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v9.c = v8;
  *(_OWORD *)&v9.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  CGContextSetTextMatrix(v7, &v9);
}

- (void)setViewScale:(double)a3
{
  self->_viewScale = a3;
}

- (void)setPreventClipToColumn:(BOOL)a3
{
  self->_preventClipToColumn = a3;
}

- (void)setFlipShadows:(BOOL)a3
{
  self->_flipShadows = a3;
}

- (TSWPRenderer)initWithContext:(CGContext *)a3
{
  TSWPRenderer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSWPRenderer;
  v4 = -[TSWPRenderer init](&v6, sel_init);
  if (v4)
    v4->_context = CGContextRetain(a3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CGContextRelease(self->_context);

  v3.receiver = self;
  v3.super_class = (Class)TSWPRenderer;
  -[TSWPRenderer dealloc](&v3, sel_dealloc);
}

- (void)drawFragment:(const void *)a3 updateRect:(CGRect)a4 drawingState:(const void *)a5 runState:(id *)a6 lineDrawFlags:(unsigned int)a7
{
  uint64_t v7;
  double height;
  double width;
  double y;
  double x;
  void *v16;
  uint64_t v17;
  CGSize v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  double v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  id v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSUInteger v56;
  NSUInteger v57;
  _BOOL4 v58;
  int v59;
  uint64_t v60;
  _QWORD v61[2];
  void (*v62)(uint64_t, uint64_t *, uint64_t);
  void *v63;
  TSWPRenderer *v64;
  const void *v65;
  double v66;
  const void *v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  CGRect v76;
  void **v77;
  _BYTE v78[128];
  uint64_t v79;
  NSRange v80;
  CGRect v81;
  CGRect v82;

  v7 = *(_QWORD *)&a7;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v79 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)a5)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRenderer drawFragment:updateRect:drawingState:runState:lineDrawFlags:]");
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRenderer.mm"), 185, CFSTR("storage is nil"));
  }
  v59 = *((_DWORD *)a3 + 6);
  v82.origin.x = x;
  v82.origin.y = y;
  v82.size.width = width;
  v82.size.height = height;
  v81 = CGRectIntersection(*(CGRect *)((char *)a3 + 80), v82);
  if (!CGRectIsEmpty(v81))
  {
    v56 = *((_QWORD *)a3 + 1);
    v57 = *(_QWORD *)a3;
    v18 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
    v76.origin = (CGPoint)*MEMORY[0x24BDBF090];
    v76.size = v18;
    v58 = -[TSWPRenderer p_shouldClipFragment:drawingState:lineDrawFlags:updateRect:outClipRect:](self, "p_shouldClipFragment:drawingState:lineDrawFlags:updateRect:outClipRect:", a3, a5, v7, &v76, x, y, width, height);
    if (v58)
    {
      CGContextSaveGState(self->_context);
      CGContextClipToRect(self->_context, v76);
    }
    v20 = *((double *)a3 + 5);
    v19 = *((double *)a3 + 6);
    v21 = *((double *)a3 + 8);
    v22 = *((double *)a3 + 4);
    if ((v7 & 1) != 0)
    {
      v23 = *((double *)a3 + 7);
      v24 = *((double *)a3 + 9);
      v26 = *((_QWORD *)a3 + 40);
      v25 = *((_QWORD *)a3 + 41);
      while (v26 != v25)
      {
        -[TSWPRenderer p_drawAdornmentLineBackgroundRect:lineDrawFlags:drawingState:bounds:](self, "p_drawAdornmentLineBackgroundRect:lineDrawFlags:drawingState:bounds:", v26, v7, a5, v19, v23, v21, v24);
        v26 += 80;
      }
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v27 = (void *)*((_QWORD *)a3 + 66);
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
      if (v28)
      {
        v29 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v73 != v29)
              objc_enumerationMutation(v27);
            v31 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
            if (objc_msgSend(v31, "isBackground"))
              objc_msgSend(v31, "drawAdornmentForFragment:inContext:withFlags:state:bounds:", a3, self->_context, v7, a5, v19, v23, v21, v24);
          }
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
        }
        while (v28);
      }
    }
    v32 = v22 + v20;
    if ((v7 & 0x10000) != 0)
    {
      v46 = *((_QWORD *)a3 + 43);
      v45 = *((_QWORD *)a3 + 44);
      while (v46 != v45)
      {
        -[TSWPRenderer p_drawAdornmentLineBackgroundRect:lineDrawFlags:drawingState:bounds:](self, "p_drawAdornmentLineBackgroundRect:lineDrawFlags:drawingState:bounds:", v46, v7, a5, v19, v32 - *((double *)a3 + 16), v21, *((double *)a3 + 16) + *((double *)a3 + 17));
        v46 += 80;
      }
    }
    v69 = 0;
    v70 = 0;
    v71 = 0;
    if ((v7 & 0x400) != 0)
    {
      v80.length = v56;
      v80.location = v57;
      if (NSIntersectionRange(v80, *(NSRange *)(a5 + 216)).length)
        -[TSWPRenderer p_calculateMarkAdornments:drawingState:lineFragment:](self, "p_calculateMarkAdornments:drawingState:lineFragment:", &v69, a5, a3);
    }
    if ((v7 & 2) != 0)
    {
      a6->var2 = v32;
      if ((v7 & 8) != 0)
        -[TSWPRenderer p_drawMisspelledWordMarkingsFragment:drawingState:](self, "p_drawMisspelledWordMarkingsFragment:drawingState:", a3, a5);
      if ((v7 & 0x10) != 0)
        -[TSWPRenderer p_drawUngrammaticMarkingsFragment:drawingState:](self, "p_drawUngrammaticMarkingsFragment:drawingState:", a3, a5);
      if ((v7 & 0x200) != 0)
        -[TSWPRenderer p_drawDictationMarkingsFragment:drawingState:](self, "p_drawDictationMarkingsFragment:drawingState:", a3, a5);
      if ((v7 & 0x800) != 0)
        -[TSWPRenderer p_drawAutocorrectionMarkingsFragment:drawingState:](self, "p_drawAutocorrectionMarkingsFragment:drawingState:", a3, a5);
      if (*((_QWORD *)a3 + 22))
        -[TSWPRenderer p_drawListLabelForFragment:drawingState:lineDrawFlags:](self, "p_drawListLabelForFragment:drawingState:lineDrawFlags:", a3, a5, v7);
      v33 = v59 & 0x2000;
      v61[0] = MEMORY[0x24BDAC760];
      v61[1] = 3221225472;
      v62 = __76__TSWPRenderer_drawFragment_updateRect_drawingState_runState_lineDrawFlags___block_invoke;
      v63 = &unk_24D82EE88;
      v66 = v22 + v20;
      v64 = self;
      v65 = a3;
      v68 = v33 >> 13;
      v67 = a5;
      if ((((!*((_QWORD *)a5 + 7) || !*((_QWORD *)a5 + 25))
          && (__76__TSWPRenderer_drawFragment_updateRect_drawingState_runState_lineDrawFlags___block_invoke((uint64_t)v61, (uint64_t *)a3 + 24, 0), !*((_QWORD *)a5 + 7))|| *((_QWORD *)a5 + 25))&& (v62((uint64_t)v61, (uint64_t *)a3 + 28, 0), !*((_QWORD *)a5 + 7))|| !*((_QWORD *)a5 + 25))&& (v62((uint64_t)v61, (uint64_t *)a3 + 31, 1), !*((_QWORD *)a5 + 7))|| !*((_QWORD *)a5 + 25))
      {
        v35 = *((_QWORD *)a3 + 46);
        v34 = *((_QWORD *)a3 + 47);
        v60 = v34;
        while (v35 != v34)
        {
          CGContextSaveGState(self->_context);
          v36 = *(double *)(v35 + 8);
          v37 = *(double *)(v35 + 16);
          v38 = *(id *)v35;
          objc_msgSend(*(id *)v35, "baselineOffset");
          v40 = v39;
          objc_msgSend(v38, "size");
          CGContextTranslateCTM(self->_context, v19 + v36, v37 + v32 - v40 - v41);
          CGContextSetShouldAntialias(self->_context, 1);
          v42 = (void *)objc_msgSend(v38, "rendererForAttachment");
          if (!v42)
          {
            v43 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v44 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRenderer drawFragment:updateRect:drawingState:runState:lineDrawFlags:]");
            objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRenderer.mm"), 425, CFSTR("Nil TSWPGraphicalAttachmentRenderer for graphical attachment"));
          }
          objc_msgSend(v42, "drawAttachment:inContext:selection:", v38, self->_context, 0);
          CGContextRestoreGState(self->_context);
          v35 += 32;
          v34 = v60;
        }
        v48 = *((_QWORD *)a3 + 34);
        v47 = *((_QWORD *)a3 + 35);
        while (v48 != v47)
        {
          -[TSWPRenderer p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:](self, "p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:", v48, a5, a3, v33 != 0, v19, v32);
          v48 += 80;
        }
        if ((v7 & 0x400) != 0)
        {
          v55 = v69;
          v54 = v70;
          while (v55 != v54)
          {
            -[TSWPRenderer p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:](self, "p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:", v55, a5, a3, v33 != 0, v19, v32);
            v55 += 80;
          }
        }
        v50 = *((_QWORD *)a3 + 37);
        v49 = *((_QWORD *)a3 + 38);
        while (v50 != v49)
        {
          -[TSWPRenderer p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:](self, "p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:", v50, a5, a3, v33 != 0, v19, v32);
          v50 += 80;
        }
        CGContextSetTextDrawingMode(self->_context, kCGTextFill);
        v51 = *((_QWORD *)a3 + 55);
        v52 = *((_QWORD *)a3 + 56);
        while (v51 != v52)
        {
          -[TSWPRenderer p_drawAdornments:lineFragment:state:](self, "p_drawAdornments:lineFragment:state:", v51, a3, a5);
          v51 += 200;
        }
        v53 = *((_QWORD *)a3 + 58);
        if (v53)
          -[TSWPRenderer p_drawInvisiblesBreakLine:lineFragment:state:](self, "p_drawInvisiblesBreakLine:lineFragment:state:", v53, a3, a5);
      }
    }
    if (v58)
      CGContextRestoreGState(self->_context);
    v77 = (void **)&v69;
    std::vector<TSWPAdornmentLine>::__destroy_vector::operator()[abi:nn180100](&v77);
  }
}

void __76__TSWPRenderer_drawFragment_updateRect_drawingState_runState_lineDrawFlags___block_invoke(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v7;
  const __CTLine *v8;
  CGFloat v9;
  CGFloat v10;
  uint64_t v11;
  uint64_t v12;
  CGContext *v13;
  uint64_t v14;
  CGAffineTransform transform;

  v3 = *a2;
  v4 = a2[1];
  if (*a2 != v4)
  {
    v7 = 1;
    do
    {
      v8 = *(const __CTLine **)v3;
      v9 = *(double *)(v3 + 8) + *(double *)(*(_QWORD *)(a1 + 40) + 48);
      v10 = *(double *)(v3 + 16) + *(double *)(a1 + 48);
      CGContextSaveGState(*(CGContextRef *)(*(_QWORD *)(a1 + 32) + 8));
      CGContextTranslateCTM(*(CGContextRef *)(*(_QWORD *)(a1 + 32) + 8), v9, v10);
      CGContextSetTextPosition(*(CGContextRef *)(*(_QWORD *)(a1 + 32) + 8), 0.0, 0.0);
      v11 = *(_QWORD *)(a1 + 40);
      if (*(_BYTE *)(a1 + 64))
      {
        v12 = *(_QWORD *)(a1 + 56);
      }
      else
      {
        v12 = *(_QWORD *)(a1 + 56);
        if ((*(_WORD *)(v11 + 24) & 0x420) == 0 && !*(_QWORD *)(v12 + 56))
        {
          v13 = *(CGContext **)(*(_QWORD *)(a1 + 32) + 8);
          CGAffineTransformMakeScale(&transform, 1.0, -1.0);
          CGContextConcatCTM(v13, &transform);
          CTLineDraw(v8, *(CGContextRef *)(*(_QWORD *)(a1 + 32) + 8));
          goto LABEL_8;
        }
      }
      LOBYTE(v14) = v7;
      objc_msgSend(*(id *)(a1 + 32), "p_drawTextInRunsForLine:fragment:state:tateChuYoko:baseRange:isFirstLineRef:", v8, v11, v12, a3, *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32), v14);
LABEL_8:
      CGContextRestoreGState(*(CGContextRef *)(*(_QWORD *)(a1 + 32) + 8));
      v7 = 0;
      v3 += 48;
    }
    while (v3 != v4);
  }
}

- (BOOL)p_shouldClipFragment:(const void *)a3 drawingState:(const void *)a4 lineDrawFlags:(unsigned int)a5 updateRect:(CGRect)a6 outClipRect:(CGRect *)a7
{
  double height;
  double width;
  double y;
  double x;
  char v12;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  CFIndex v19;
  double MaxX;
  double v21;
  double MinX;
  int v23;
  double v24;
  double MaxY;
  double v26;
  double v27;
  double v28;
  BOOL v29;
  double v30;
  double MinY;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  BOOL v41;
  BOOL result;
  double v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat rect;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v12 = a5;
  v15 = *((double *)a4 + 2);
  v16 = *((double *)a4 + 3);
  v17 = *((double *)a4 + 4);
  v48.size.height = *((CGFloat *)a4 + 5);
  v48.origin.x = v15;
  v48.origin.y = v16;
  v48.size.width = v17;
  rect = v48.size.height;
  v18 = CGRectGetWidth(v48);
  v19 = TSWPLineFragment::glyphCount((TSWPLineFragment *)a3);
  v46 = 10000000.0;
  if ((v19 == 1 || v19 == 2 && (*((_BYTE *)a3 + 25) & 8) != 0) && rint(*((double *)a3 + 27)) > rint(v18))
  {
    v49.origin.x = v15;
    v49.origin.y = v16;
    v49.size.width = v17;
    v49.size.height = rect;
    MaxX = CGRectGetMaxX(v49);
    v50.origin.x = x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = height;
    v21 = CGRectGetMaxX(v50);
    if (v21 >= MaxX)
      v21 = MaxX;
    v46 = v21;
    v51.origin.x = v15;
    v51.origin.y = v16;
    v51.size.width = v17;
    v51.size.height = rect;
    MinX = CGRectGetMinX(v51);
    if (MinX >= x)
      x = MinX;
    y = fmax(y, -10000000.0);
    v23 = 1;
    if ((v12 & 2) != 0)
      goto LABEL_10;
LABEL_12:
    MaxY = CGRectGetMaxY(*(CGRect *)((char *)a3 + 48));
    v24 = *((double *)a3 + 4) + *((double *)a3 + 5);
    goto LABEL_13;
  }
  v23 = 0;
  if ((v12 & 2) == 0)
    goto LABEL_12;
LABEL_10:
  v24 = *((double *)a3 + 4) + *((double *)a3 + 5);
  MaxY = v24 + *((double *)a3 + 17);
LABEL_13:
  if (*((_BYTE *)a4 + 94))
    goto LABEL_14;
  v43 = *((double *)a3 + 16);
  v44 = *((double *)a3 + 18);
  v45 = width;
  v27 = height;
  v28 = rint(MaxY);
  v52.origin.x = v15;
  v52.origin.y = v16;
  v52.size.width = v17;
  v52.size.height = rect;
  v29 = v28 <= rint(CGRectGetMaxY(v52));
  height = v27;
  width = v45;
  if (!v29)
    goto LABEL_19;
  v53.origin.x = v15;
  v53.origin.y = v16;
  v53.size.width = v17;
  v53.size.height = rect;
  if (rint(v24 - v43 - fmin(v44, 0.0)) >= rint(CGRectGetMinY(v53)))
  {
LABEL_14:
    if (!v23)
    {
      v41 = 0;
      goto LABEL_31;
    }
    v26 = 10000000.0;
  }
  else
  {
LABEL_19:
    v54.origin.x = v15;
    v54.origin.y = v16;
    v54.size.width = v17;
    v54.size.height = rect;
    v26 = CGRectGetMaxY(v54);
    v55.origin.x = x;
    v55.origin.y = y;
    v55.size.width = v45;
    v55.size.height = height;
    v30 = CGRectGetMaxY(v55);
    if (v30 < v26)
      v26 = v30;
    v56.origin.x = v15;
    v56.origin.y = v16;
    v56.size.width = v17;
    v56.size.height = rect;
    MinY = CGRectGetMinY(v56);
    if (MinY >= y)
      y = MinY;
    x = fmax(x, -10000000.0);
  }
  v57.origin.x = x;
  v57.origin.y = y;
  v57.size.width = width;
  v57.size.height = height;
  v32 = CGRectGetMaxX(v57);
  v33 = height;
  if (v32 >= v46)
    v34 = v46;
  else
    v34 = v32;
  v35 = x;
  v36 = y;
  v37 = width;
  v38 = CGRectGetMaxY(*(CGRect *)(&v33 - 3));
  if (v38 >= v26)
    v38 = v26;
  v39 = fmax(v38 - y, 0.0);
  v40 = v34 - x;
  height = v39;
  width = fmax(v40, 0.0);
  v41 = 1;
LABEL_31:
  result = (*((_DWORD *)a3 + 6) & 0x1000000) == 0 && v41;
  a7->origin.x = x;
  a7->origin.y = y;
  a7->size.width = width;
  a7->size.height = height;
  return result;
}

- (void)p_drawAdornments:(const void *)a3 lineFragment:(const void *)a4 state:(const void *)a5
{
  int v5;

  v5 = *(_DWORD *)a3;
  if ((*(_DWORD *)a3 - 1) >= 2)
  {
    if (v5 == 3)
    {
      if (!*((_BYTE *)a5 + 88) && *((_BYTE *)a5 + 90) && TSWPLineFragment::glyphCount((TSWPLineFragment *)a4))
        -[TSWPRenderer p_drawAttachmentAdornments:lineFragment:state:](self, "p_drawAttachmentAdornments:lineFragment:state:", a3, a4, a5);
    }
    else if (v5 == 6)
    {
      if (!*((_BYTE *)a5 + 88))
      {
        if (*((_BYTE *)a5 + 90))
          -[TSWPRenderer p_drawHiddenDeletionsAdornments:lineFragment:state:](self, "p_drawHiddenDeletionsAdornments:lineFragment:state:", a3, a4, a5);
      }
    }
    else
    {
      -[TSWPRenderer p_drawAdornmentGlyphs:lineFragment:state:](self, "p_drawAdornmentGlyphs:lineFragment:state:", a3, a4, a5);
    }
  }
}

- (CGSize)convertSizeToDeviceSpace:(CGSize)a3
{
  double width;
  double height;
  CGSize v5;
  CGSize result;

  v5 = CGContextConvertSizeToDeviceSpace(self->_context, a3);
  height = v5.height;
  width = v5.width;
  result.height = height;
  result.width = width;
  return result;
}

- (void)p_drawWordMarkingsForFragment:(const void *)a3 color:(id)a4 ranges:(const void *)a5 suppressRange:(_NSRange)a6 drawingState:(const void *)a7
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v14;
  unint64_t v15;
  id v16;
  const void *v17;
  NSUInteger v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v22;
  NSRange v23;
  double v24;
  NSUInteger v25;
  NSUInteger v26;
  uint64_t v27;
  BOOL v28;
  NSRange v29;
  NSRange v31;
  NSUInteger *v32;
  NSUInteger *v33;
  NSUInteger v34;
  NSUInteger v35;
  NSRange v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  NSUInteger range1;
  void *range1_8a;
  int range1_8;
  TSWPColumn **v47;
  CGFloat lengths[3];
  NSRange v49;
  NSRange v50;
  NSRange v51;
  NSRange v52;
  NSRange v53;
  NSRange v54;

  length = a6.length;
  range1 = a6.location;
  lengths[2] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  location = *(_QWORD *)a3;
  v14 = *((_QWORD *)a3 + 1);
  v15 = v14 + *(_QWORD *)a3;
  if (v15 > objc_msgSend(*(id *)a7, "characterCount"))
  {
    range1_8a = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v16 = a4;
    v17 = a5;
    v18 = length;
    v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRenderer p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:]");
    v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRenderer.mm");
    v21 = v19;
    length = v18;
    a5 = v17;
    a4 = v16;
    objc_msgSend(range1_8a, "handleFailureInFunction:file:lineNumber:description:", v21, v20, 742, CFSTR("Invalid line fragment range"));
    v52.location = objc_msgSend(*(id *)a7, "range");
    v52.length = v22;
    v49.location = location;
    v49.length = v14;
    v23 = NSIntersectionRange(v49, v52);
    location = v23.location;
    v14 = v23.length;
  }
  CGContextSaveGState(self->_context);
  CGContextSetStrokeColorWithColor(self->_context, (CGColorRef)objc_msgSend(a4, "CGColor"));
  *(_QWORD *)&lengths[0] = gSpellDotWidth;
  lengths[1] = *(double *)&gSpellDotStride - *(double *)&gSpellDotWidth;
  CGContextSetLineDash(self->_context, 0.0, lengths, 2uLL);
  range1_8 = *((_DWORD *)a3 + 6);
  v24 = *((double *)a3 + 16);
  v26 = *((_QWORD *)a7 + 27);
  v25 = *((_QWORD *)a7 + 28);
  v27 = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
  v28 = v26 == *MEMORY[0x24BEB3BF0] && v25 == v27;
  v47 = (TSWPColumn **)a7;
  if (v28)
  {
    v25 = length;
    v26 = range1;
  }
  else
  {
    v29.location = range1;
    if (range1 != *MEMORY[0x24BEB3BF0] || length != v27)
    {
      v29.length = length;
      v31 = NSUnionRange(v29, *(NSRange *)((char *)a7 + 216));
      v26 = v31.location;
      v25 = v31.length;
    }
  }
  v33 = *(NSUInteger **)a5;
  v32 = (NSUInteger *)*((_QWORD *)a5 + 1);
  if (*(NSUInteger **)a5 != v32)
  {
    do
    {
      v34 = *v33;
      v35 = v33[1];
      v50.location = *v33;
      v50.length = v35;
      v53.location = v26;
      v53.length = v25;
      if (!NSIntersectionRange(v50, v53).length)
      {
        v51.location = v34;
        v51.length = v35;
        v54.location = location;
        v54.length = v14;
        v36 = NSIntersectionRange(v51, v54);
        if (v36.length)
        {
          v37 = TSWPLineFragment::wpOffsetForCharIndex((TSWPLineFragment *)a3, v36.location, 1, 1, 0);
          v38 = rint(TSWPLineFragment::wpOffsetForCharIndex((TSWPLineFragment *)a3, v36.location + v36.length, 1, 1, 0)- v37);
          if (v38 > 0.0)
          {
            v39 = *(double *)&gSpellDotStride;
            v40 = fmod(v38, *(long double *)&gSpellDotStride);
            if (v40 <= 1.0)
              v41 = -v40;
            else
              v41 = v39 - v40;
            v42 = TSWPLineFragment::lowestBaselineInRange((TSWPLineFragment *)a3, v36, v47[1]);
            if ((range1_8 & 0x2000) != 0)
              v43 = floor(v42 - v24);
            else
              v43 = floor(v42) + *(double *)&gSpellDotHeight;
            -[TSWPRenderer p_strokeLineFromPoint:toPoint:width:](self, "p_strokeLineFromPoint:toPoint:width:", v37, v43, v37 + fmax(v38 + v41, v39), v43);
          }
        }
      }
      v33 += 2;
    }
    while (v33 != v32);
  }
  CGContextRestoreGState(self->_context);
}

- (void)p_drawMisspelledWordMarkingsFragment:(const void *)a3 drawingState:(const void *)a4
{
  _NSRange *begin;
  TSWPRangeVector __p;
  TSWPRangeVector v9;

  *(_OWORD *)&__p.__begin_ = *(_OWORD *)a3;
  TSWPRangeVector::rangesIntersecting((TSWPRangeVector *)a4 + 4, &v9);
  if (objc_msgSend(*(id *)a4, "hasTrackedChanges") && *(_QWORD *)a4)
  {
    objc_msgSend(*(id *)a4, "deletedRangeVectorInRange:", *(_QWORD *)a3, *((_QWORD *)a3 + 1));
    begin = __p.__begin_;
    if (__p.__end_ != __p.__begin_)
    {
      TSWPRangeVector::subtract(&v9, &__p);
      begin = __p.__begin_;
    }
    if (begin)
    {
      __p.__end_ = begin;
      operator delete(begin);
    }
  }
  -[TSWPRenderer p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:](self, "p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:", a3, objc_msgSend(MEMORY[0x24BEB3C40], "redColor", __p.__begin_), &v9, *((_QWORD *)a4 + 18), *((_QWORD *)a4 + 19), a4);
  if (v9.__begin_)
  {
    v9.__end_ = v9.__begin_;
    operator delete(v9.__begin_);
  }
}

- (void)p_drawUngrammaticMarkingsFragment:(const void *)a3 drawingState:(const void *)a4
{
  _NSRange *begin;
  uint64_t v8;
  TSWPRangeVector __p;
  TSWPRangeVector v10;
  TSWPRangeVector v11;

  *(_OWORD *)&v10.__begin_ = *(_OWORD *)a3;
  TSWPRangeVector::rangesIntersecting((TSWPRangeVector *)a4 + 5, &v11);
  *(_OWORD *)&__p.__begin_ = *(_OWORD *)a3;
  TSWPRangeVector::rangesIntersecting((TSWPRangeVector *)a4 + 4, &v10);
  TSWPRangeVector::subtract(&v11, &v10);
  if (objc_msgSend(*(id *)a4, "hasTrackedChanges") && *(_QWORD *)a4)
  {
    objc_msgSend(*(id *)a4, "deletedRangeVectorInRange:", *(_QWORD *)a3, *((_QWORD *)a3 + 1));
    begin = __p.__begin_;
    if (__p.__end_ != __p.__begin_)
    {
      TSWPRangeVector::subtract(&v11, &__p);
      begin = __p.__begin_;
    }
    if (begin)
    {
      __p.__end_ = begin;
      operator delete(begin);
    }
  }
  v8 = objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.22, 0.62, 0.2, 1.0, __p.__begin_);
  -[TSWPRenderer p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:](self, "p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:", a3, v8, &v11, *MEMORY[0x24BEB3BF0], *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8), a4);
  if (v10.__begin_)
  {
    v10.__end_ = v10.__begin_;
    operator delete(v10.__begin_);
  }
  if (v11.__begin_)
  {
    v11.__end_ = v11.__begin_;
    operator delete(v11.__begin_);
  }
}

- (void)p_drawDictationMarkingsFragment:(const void *)a3 drawingState:(const void *)a4
{
  uint64_t v7;

  v7 = objc_msgSend(MEMORY[0x24BEB3C40], "blueColor");
  -[TSWPRenderer p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:](self, "p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:", a3, v7, *((_QWORD *)a4 + 20), *MEMORY[0x24BEB3BF0], *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8), a4);
}

- (void)p_drawAutocorrectionMarkingsFragment:(const void *)a3 drawingState:(const void *)a4
{
  uint64_t v7;

  v7 = objc_msgSend(MEMORY[0x24BEB3C40], "blueColor");
  -[TSWPRenderer p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:](self, "p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:", a3, v7, *((_QWORD *)a4 + 21), *MEMORY[0x24BEB3BF0], *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8), a4);
}

- (void)p_drawAdornmentLine:(const TSWPAdornmentLine *)a3 drawingState:(const void *)a4 lineFragment:(const void *)a5 lineFragmentStart:(CGPoint)a6 vertical:(BOOL)a7
{
  double var3;
  double v12;
  double y;
  unsigned int var4;
  double var1;
  CGSize v16;
  double v17;
  CGFloat x;
  CGPoint v19;
  double v20;
  double v21;
  double v22;
  CGContext *context;
  id var9;
  CGColor *var2;
  double v26;
  double v27;
  double v28;
  void *v29;
  NSRange v30;
  uint64_t v31;
  NSUInteger v32;
  double v33;
  BOOL v34;
  char v35;
  NSUInteger v36;
  NSUInteger v37;
  NSRange v38;
  double v39;
  unint64_t v40;
  BOOL v41;
  _BOOL4 v42;
  double v43;
  BOOL v44;
  double v45;
  double WavyLineHalfAmplitude;
  double v47;
  double v48;
  CGFloat v49;
  double v50;
  CGAffineTransform v51;
  CGAffineTransform v52;
  NSRange v53;
  CGSize v54;
  CGPoint v55;
  CGSize v56;
  CGRect v57;

  var3 = a3->var3;
  v12 = a6.x + a3->var0.x;
  y = a6.y + a3->var0.y;
  var4 = a3->var4;
  if (a3->var1 >= *((double *)a5 + 8) - a3->var0.x)
    var1 = *((double *)a5 + 8) - a3->var0.x;
  else
    var1 = a3->var1;
  if (*((_BYTE *)a4 + 90))
  {
    memset(&v52, 0, sizeof(v52));
    CGContextGetCTM(&v52, self->_context);
    v51 = v52;
    if (TSDIsTransformAxisAligned(&v51.a))
    {
      v54.width = var3;
      v54.height = var3;
      v16 = CGContextConvertSizeToDeviceSpace(self->_context, v54);
      if (v16.height >= 0.5)
      {
        CGContextConvertPointToDeviceSpace(self->_context, *((CGPoint *)a4 + 1));
        CGContextConvertSizeToDeviceSpace(self->_context, *((CGSize *)a4 + 2));
        v17 = fmax(rint(v16.height), 1.0);
        v55.x = v12;
        v55.y = y;
        v19 = CGContextConvertPointToDeviceSpace(self->_context, v55);
        x = v19.x;
        v20 = rint(v19.y);
        v21 = 0.0;
        if (((int)v17 & 0x80000001) == 1)
          v21 = 0.5;
        v22 = v21 + v20;
        y = CGContextConvertPointToUserSpace((CGContextRef)self[8], *(CGPoint *)&x).y;
        v56.width = v16.width;
        v56.height = v17;
        var3 = fabs(CGContextConvertSizeToUserSpace((CGContextRef)self[8], v56).height);
      }
    }
  }
  context = self->_context;
  var9 = a3->var9;
  if (var9)
    var2 = (CGColor *)objc_msgSend(var9, "cgColor");
  else
    var2 = a3->var2;
  v26 = fmax(var1, 0.0);
  CGContextSetStrokeColorWithColor(context, var2);
  v27 = *MEMORY[0x24BDBF070];
  v28 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v29 = (void *)*((_QWORD *)a4 + 7);
  if (v29)
  {
    v30.location = objc_msgSend(v29, "range");
    v31 = *MEMORY[0x24BEB3BF0];
    v32 = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
  }
  else
  {
    v31 = *MEMORY[0x24BEB3BF0];
    v32 = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
    v30.location = *MEMORY[0x24BEB3BF0];
    v30.length = v32;
  }
  v33 = v12 + v26;
  v34 = v30.location == v31 && v30.length == v32;
  v35 = !v34;
  if (!v34)
  {
    v36 = *(_QWORD *)a5;
    v37 = *((_QWORD *)a5 + 1);
    v53.location = *(_QWORD *)a5;
    v53.length = v37;
    v38 = NSIntersectionRange(v30, v53);
    if (!v38.length)
      return;
    if (v38.location >= v36 && v38.location - v36 < v37)
    {
      v39 = TSWPLineFragment::wpOffsetForCharIndex((TSWPLineFragment *)a5, v38.location, 1, 1, 0);
      if (v12 >= v39)
        v39 = v12;
      v27 = v39 + -1.0;
    }
    v40 = v38.location + v38.length;
    v41 = v38.location + v38.length - v36 < v37 && v40 >= v36;
    if (v41 || v40 == v37 + v36)
    {
      v43 = TSWPLineFragment::wpOffsetForCharIndex((TSWPLineFragment *)a5, v40, 1, 1, 0);
      if (v43 >= v33)
        v43 = v33;
      v44 = v43 <= v27;
      v42 = v43 > v27;
      v45 = v43 - v27;
      if (!v44)
        v28 = v45;
    }
    else
    {
      v42 = 1;
    }
    if (a3->var5 == 3)
    {
      WavyLineHalfAmplitude = GetWavyLineHalfAmplitude(var3);
      if (!v42)
        return;
    }
    else
    {
      WavyLineHalfAmplitude = var3 * 0.5;
      if (!v42)
        return;
    }
    v47 = WavyLineHalfAmplitude + 1.0;
    if (var4 == 2)
      v48 = (v47 + v47) * 1.5;
    else
      v48 = v47 + v47;
    v49 = y - v47;
    CGContextSaveGState(self->_context);
    v57.origin.x = v27;
    v57.origin.y = v49;
    v57.size.width = v28;
    v57.size.height = v48;
    CGContextClipToRect(self->_context, v57);
  }
  if (var4)
  {
    v50 = y;
    do
    {
      if (a3->var5 == 3)
        -[TSWPRenderer p_strokeWavyLineFromPoint:toPoint:width:](self, "p_strokeWavyLineFromPoint:toPoint:width:", v12, y, v33, v50, var3);
      else
        -[TSWPRenderer p_strokeLineFromPoint:toPoint:width:](self, "p_strokeLineFromPoint:toPoint:width:", v12, y, v33, v50, var3);
      y = y + var3 * 2.0;
      v50 = v50 + var3 * 2.0;
      --var4;
    }
    while (var4);
  }
  if ((v35 & 1) != 0)
    CGContextRestoreGState(self->_context);
}

- (void)p_drawAdornmentLineBackgroundRect:(const TSWPAdornmentLine *)a3 lineDrawFlags:(unsigned int)a4 drawingState:(const void *)a5 bounds:(CGRect)a6
{
  CGFloat height;
  double width;
  CGFloat y;
  double x;
  CGContext *context;
  id v13;
  CGColor *v14;
  id var9;
  CGColor *var2;
  CGColor *CopyWithAlpha;
  double var1;
  double v19;
  CGFloat v20;
  CGFloat v21;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  if ((a4 & 2) != 0)
  {
    var9 = a3->var9;
    if (var9)
      var2 = (CGColor *)objc_msgSend(var9, "cgColor");
    else
      var2 = a3->var2;
    CopyWithAlpha = CGColorCreateCopyWithAlpha(var2, 0.5);
    CGContextSetFillColorWithColor(self->_context, CopyWithAlpha);
    CGColorRelease(CopyWithAlpha);
  }
  else
  {
    context = self->_context;
    v13 = a3->var9;
    if (v13)
      v14 = (CGColor *)objc_msgSend(v13, "cgColor");
    else
      v14 = a3->var2;
    CGContextSetFillColorWithColor(context, v14);
  }
  var1 = width - a3->var0.x;
  if (a3->var1 < var1)
    var1 = a3->var1;
  if (var1 > 0.0)
  {
    v19 = x + a3->var0.x;
    v20 = y;
    v21 = height;
    CGContextFillRect(self->_context, *(CGRect *)(&var1 - 2));
  }
}

- (void)p_strokeLineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 width:(double)a5
{
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  CGFloat v8;

  y = a4.y;
  x = a4.x;
  v7 = a3.y;
  v8 = a3.x;
  CGContextSetLineWidth(self->_context, a5);
  CGContextMoveToPoint(self->_context, v8, v7);
  CGContextAddLineToPoint(self->_context, x, y);
  CGContextStrokePath(self->_context);
}

- (void)p_strokeWavyLineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 width:(double)a5
{
  double x;
  double y;
  double v8;
  double WavyLineRate;
  double WavyLineHalfAmplitude;
  double WavyLineThickness;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  CGRect v22;

  x = a4.x;
  y = a3.y;
  v8 = a3.x;
  WavyLineRate = GetWavyLineRate();
  WavyLineHalfAmplitude = GetWavyLineHalfAmplitude(a5);
  WavyLineThickness = GetWavyLineThickness(a5);
  CGContextSaveGState(self->_context);
  v22.origin.y = y - (WavyLineHalfAmplitude + 1.0);
  v22.size.height = WavyLineHalfAmplitude + 1.0 + WavyLineHalfAmplitude + 1.0;
  v22.origin.x = v8;
  v22.size.width = x - v8;
  CGContextClipToRect(self->_context, v22);
  CGContextBeginPath(self->_context);
  CGContextMoveToPoint(self->_context, v8, y);
  CGContextSetLineWidth(self->_context, WavyLineThickness);
  v21 = fmax((x - v8) * WavyLineRate, 1.0);
  if (v21 > 0.0)
  {
    v13 = (x - v8) / v21 * 0.5;
    v14 = v13 * 0.5;
    v15 = y - WavyLineHalfAmplitude;
    v16 = y + WavyLineHalfAmplitude;
    v17 = 0.0;
    do
    {
      v18 = v14 + v8;
      if (x < v14 + v8)
        v18 = x;
      v19 = v13 + v8;
      CGContextAddQuadCurveToPoint(self->_context, v18, v15, v19, y);
      v20 = v14 + v19;
      v8 = v13 + v19;
      CGContextAddQuadCurveToPoint(self->_context, v20, v16, v8, y);
      v17 = v17 + 1.0;
    }
    while (v17 < v21);
  }
  CGContextDrawPath(self->_context, kCGPathStroke);
  CGContextRestoreGState(self->_context);
}

- (void)p_drawTextInRunsForLine:(__CTLine *)a3 fragment:(const void *)a4 state:(const void *)a5 tateChuYoko:(BOOL)a6 baseRange:(_NSRange)a7 isFirstLineRef:(BOOL)a8
{
  uint64_t v11;
  const __CTRun *v12;
  uint64_t GlyphCount;
  TSWPLineFragment *Attributes;
  void *v15;
  const __CFDictionary *v16;
  double v17;
  char Status;
  double v19;
  double v20;
  char v21;
  CGContext *context;
  void *v23;
  void *v24;
  NSUInteger v25;
  NSUInteger v26;
  void *v27;
  NSRange v28;
  CFRange v29;
  NSRange v30;
  char *v31;
  id v32;
  _NSRange *begin;
  unint64_t v34;
  unsigned int v35;
  uint64_t v36;
  _NSRange *v37;
  NSUInteger v38;
  uint64_t v39;
  CFIndex v40;
  CFIndex v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSUInteger length;
  NSUInteger location;
  CFArrayRef obj;
  _BOOL4 v50;
  uint64_t v51;
  uint64_t v52;
  TSWPRangeVector leading;
  CGFloat descent;
  void *v55;
  uint64_t v56;
  TSWPRangeVector ascent;
  _NSRange v58;
  CGAffineTransform transform;
  CGAffineTransform v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;
  CFRange v67;
  CFRange v68;
  CFRange v69;

  length = a7.length;
  location = a7.location;
  v50 = a6;
  v66 = *MEMORY[0x24BDAC8D0];
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = CTLineGetGlyphRuns(a3);
  v52 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  if (v52)
  {
    v51 = *(_QWORD *)v62;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v62 != v51)
          objc_enumerationMutation(obj);
        v12 = *(const __CTRun **)(*((_QWORD *)&v61 + 1) + 8 * v11);
        GlyphCount = CTRunGetGlyphCount(v12);
        if ((unint64_t)(GlyphCount - 65537) < 0xFFFFFFFFFFFF0000)
        {
          v44 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v45 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRenderer p_drawTextInRunsForLine:fragment:state:tateChuYoko:baseRange:isFirstLineRef:]");
          objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRenderer.mm"), 1187, CFSTR("bad glyph count: %ld"), GlyphCount);
          return;
        }
        Attributes = (TSWPLineFragment *)CTRunGetAttributes(v12);
        v15 = (void *)-[TSWPLineFragment objectForKeyedSubscript:](Attributes, "objectForKeyedSubscript:", CFSTR("TSWPRubySpacingRunAttribute"));
        if (!v15 || (objc_msgSend(v15, "BOOLValue") & 1) == 0)
        {
          CGContextSaveGState(self->_context);
          v17 = TSWPLineFragment::baselineShiftFromRunAttributes(Attributes, v16);
          memset(&v60, 0, sizeof(v60));
          CTRunGetTextMatrix(&v60, v12);
          Status = CTRunGetStatus(v12);
          v19 = 0.0;
          v20 = 0.0;
          if ((*((_BYTE *)a4 + 25) & 0x20) != 0)
          {
            if (v50)
            {
              CGContextTranslateCTM(self->_context, *((CGFloat *)a3 + 1), *((CGFloat *)a3 + 2));
              CGContextRotateCTM(self->_context, -1.57079633);
              goto LABEL_15;
            }
            v21 = Status;
            ascent.__begin_ = 0;
            descent = 0.0;
            leading.__begin_ = 0;
            v67.location = 0;
            v67.length = 0;
            CTRunGetTypographicBounds(v12, v67, (CGFloat *)&ascent, &descent, (CGFloat *)&leading);
            if ((v21 & 4) != 0)
            {
              CGContextRotateCTM(self->_context, -1.57079633);
LABEL_15:
              v20 = 0.0;
            }
            else
            {
              v20 = (*(double *)&ascent.__begin_ - descent) * -0.5;
            }
          }
          if ((*((_BYTE *)a4 + 25) & 0x10) != 0 && a8)
            v19 = *((double *)a4 + 65);
          CGContextSetTextPosition(self->_context, v19 + v60.tx, v20 + v17 + v60.ty);
          context = self->_context;
          CGAffineTransformMakeScale(&transform, 1.0, -1.0);
          CGContextConcatCTM(context, &transform);
          if (!*((_BYTE *)a5 + 89))
          {
            v23 = (void *)-[TSWPLineFragment objectForKeyedSubscript:](Attributes, "objectForKeyedSubscript:", CFSTR("TSWPShadow"));
            if (v23)
              objc_msgSend(v23, "applyToContext:viewScale:flipped:", self->_context, self->_flipShadows, self->_viewScale);
          }
          v58.location = 0;
          v58.length = 0;
          v24 = (void *)*((_QWORD *)a5 + 7);
          if (v24)
          {
            v26 = objc_msgSend(v24, "superRange");
            v58.location = v26;
            v58.length = v25;
            v27 = (void *)*((_QWORD *)a5 + 7);
            if (v27 && (v50 || (location < v26 || location - v26 >= v25) && (location != v26 || v25 != length)))
            {
              if (*((_QWORD *)a5 + 24) == *MEMORY[0x24BEB3BF0]
                && *((_QWORD *)a5 + 25) == *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8))
              {
                if ((unint64_t)objc_msgSend(v27, "visualRangeCount") < 2)
                  TSWPRangeVector::TSWPRangeVector(&ascent, &v58);
                else
                  std::vector<CGPoint>::vector(&ascent, objc_msgSend(*((id *)a5 + 7), "visualRanges"));
                descent = 0.0;
                v55 = 0;
                v56 = 0;
                std::vector<unsigned long>::__vallocate[abi:nn180100](&descent, GlyphCount);
                v31 = (char *)v55;
                bzero(v55, 8 * GlyphCount);
                v55 = &v31[8 * GlyphCount];
                v68.location = 0;
                v68.length = GlyphCount;
                CTRunGetStringIndices(v12, v68, *(CFIndex **)&descent);
                v32 = objc_alloc_init(MEMORY[0x24BDD1698]);
                if (v50 && v58.location != 0x7FFFFFFFFFFFFFFFLL && location != 0x7FFFFFFFFFFFFFFFLL)
                  v58.location -= location;
                TSWPRangeVector::intersection(&ascent, &leading);
                std::vector<EQKitLength>::__assign_with_size[abi:nn180100]<EQKitLength*,EQKitLength*>((char *)&ascent, (char *)leading.__begin_, (uint64_t)leading.__end_, leading.__end_ - leading.__begin_);
                if (leading.__begin_)
                {
                  leading.__end_ = leading.__begin_;
                  operator delete(leading.__begin_);
                }
                begin = ascent.__begin_;
                if (ascent.__end_ == ascent.__begin_)
                  goto LABEL_51;
                v34 = 0;
                v35 = 1;
                do
                {
                  v36 = objc_msgSend(*((id *)a4 + 23), "charRangeMappedFromStorage:", begin[v34].location, begin[v34].length);
                  begin = ascent.__begin_;
                  v37 = &ascent.__begin_[v34];
                  v37->location = v36;
                  v37->length = v38;
                  v34 = v35++;
                }
                while (v34 < ascent.__end_ - begin);
                if (GlyphCount >= 1)
                {
LABEL_51:
                  v39 = 0;
                  do
                  {
                    if (TSWPRangeVector::containsCharacterAtIndex(&ascent, *(_QWORD *)(*(_QWORD *)&descent + 8 * v39), 0))objc_msgSend(v32, "addIndex:", v39);
                    ++v39;
                  }
                  while (GlyphCount != v39);
                }
                v40 = objc_msgSend(v32, "firstIndex");
                v41 = 0;
                v42 = v40;
                do
                {
                  if (v42 == v41 + v40)
                  {
                    ++v41;
                  }
                  else
                  {
                    CGContextSaveGState(self->_context);
                    v69.location = v40;
                    v69.length = v41;
                    CTRunDraw(v12, self->_context, v69);
                    CGContextRestoreGState(self->_context);
                    v40 = v42;
                    v41 = 1;
                  }
                  v42 = objc_msgSend(v32, "indexGreaterThanIndex:", v42);
                }
                while (v40 != 0x7FFFFFFFFFFFFFFFLL);

                if (descent != 0.0)
                {
                  v55 = *(void **)&descent;
                  operator delete(*(void **)&descent);
                }
                if (ascent.__begin_)
                {
                  ascent.__end_ = ascent.__begin_;
                  operator delete(ascent.__begin_);
                }
              }
            }
            else
            {
LABEL_34:
              v28 = (NSRange)*((_OWORD *)a5 + 12);
              v29.location = 0;
              if (v28 != *MEMORY[0x24BEB3BF0])
              {
                v29.length = GlyphCount;
                v30 = NSIntersectionRange(v28, (NSRange)v29);
                v29.location = v30.location;
                GlyphCount = v30.length;
              }
              v29.length = GlyphCount;
              CTRunDraw(v12, self->_context, v29);
            }
            CGContextRestoreGState(self->_context);
            goto LABEL_38;
          }
          v58 = (_NSRange)*MEMORY[0x24BEB3BF0];
          goto LABEL_34;
        }
LABEL_38:
        ++v11;
      }
      while (v11 != v52);
      v43 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      v52 = v43;
    }
    while (v43);
  }
}

- (void)p_drawAttachmentGlyphAtPosition:(id)a3 fragment:(const void *)a4
{
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGRect v8;

  v5 = floor(a3.var1) + 0.5;
  v6 = -*((double *)a4 + 16) - *((double *)a4 + 18);
  v7 = v5 - 4.80000019 * 0.5;
  -[TSWPRenderer p_strokeLineFromPoint:toPoint:width:](self, "p_strokeLineFromPoint:toPoint:width:", a3.var0, v5, v6, v5, *((double *)a4 + 17) + *((double *)a4 + 19) + *((double *)a4 + 20), 1.0);
  v8.origin.x = v7;
  v8.origin.y = v6;
  v8.size.width = 4.80000019;
  v8.size.height = 4.80000019;
  CGContextFillEllipseInRect(self->_context, v8);
}

- (void)p_drawInvisiblesAdornments:(const void *)a3 lineFragment:(const void *)a4 state:(const void *)a5
{
  int v9;
  const __CTFont *v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  CGContext *context;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  CGAffineTransform v19;

  v9 = *((unsigned __int8 *)a5 + 91);
  v10 = (const __CTFont *)*((_QWORD *)a3 + 3);
  v11 = *((double *)a4 + 6);
  v12 = *((double *)a4 + 4) + *((double *)a4 + 5);
  CGContextSaveGState(self->_context);
  CGContextTranslateCTM(self->_context, v11 + *(double *)(*((_QWORD *)a4 + 24) + 8), v12 + (*((double *)a4 + 17) - *((double *)a4 + 16) + *(double *)&qword_253DE0B38) * 0.5);
  CGContextSetTextPosition(self->_context, 0.0, 0.0);
  CGContextSetFillColorWithColor(self->_context, *((CGColorRef *)a5 + 9));
  v14 = *((_QWORD *)a3 + 13);
  v13 = *((_QWORD *)a3 + 14);
  if (v9)
  {
    if (v13 != v14)
    {
LABEL_3:
      context = self->_context;
      CGAffineTransformMakeScale(&v19, 1.0, -1.0);
      CGContextConcatCTM(context, &v19);
      CTFontDrawGlyphs(v10, *((const CGGlyph **)a3 + 7), *((const CGPoint **)a3 + 13), (v13 - v14) >> 4, self->_context);
    }
  }
  else
  {
    v16 = *((_QWORD *)a4 + 1);
    if (v16)
    {
      v17 = *(_QWORD *)a4;
      v18 = (void *)*((_QWORD *)a5 + 6);
      if (objc_msgSend(v18, "isValid"))
      {
        if (objc_msgSend(v18, "containsCharacterAtIndex:", v16 + v17 - 1)
          && v13 != v14
          && *(_DWORD *)a3 == 2)
        {
          goto LABEL_3;
        }
      }
    }
  }
  CGContextRestoreGState(self->_context);
}

- (void)p_drawHiddenDeletionsAdornments:(const void *)a3 lineFragment:(const void *)a4 state:(const void *)a5
{
  const __CTFont *v8;
  double v9;
  CGFloat v10;
  uint64_t v11;
  size_t v12;
  CGContext *context;
  CGAffineTransform v14;

  v8 = (const __CTFont *)*((_QWORD *)a3 + 3);
  v9 = *((double *)a4 + 6);
  v10 = *((double *)a4 + 4) + *((double *)a4 + 5);
  CGContextSaveGState(self->_context);
  CGContextTranslateCTM(self->_context, v9 + *(double *)(*((_QWORD *)a4 + 24) + 8), v10);
  CGContextSetTextPosition(self->_context, 0.0, 0.0);
  CGContextSetFillColorWithColor(self->_context, *((CGColorRef *)a3 + 2));
  v11 = *((_QWORD *)a3 + 14) - *((_QWORD *)a3 + 13);
  if (v11)
  {
    v12 = v11 >> 4;
    context = self->_context;
    CGAffineTransformMakeScale(&v14, 1.0, -1.0);
    CGContextConcatCTM(context, &v14);
    CTFontDrawGlyphs(v8, *((const CGGlyph **)a3 + 7), *((const CGPoint **)a3 + 13), v12, self->_context);
  }
  CGContextRestoreGState(self->_context);
}

- (BOOL)p_canvasSelectionIncludesDrawableOfAttachmentAtCharIndex:(unint64_t)a3 state:(const void *)a4
{
  void *v6;
  void *v7;
  void *v8;

  v6 = (void *)objc_msgSend(*((id *)a4 + 30), "infos");
  if (!objc_msgSend(v6, "count"))
    return 0;
  objc_opt_class();
  v7 = (void *)TSUDynamicCast();
  if (v7)
  {
    if ((objc_msgSend(v7, "isValid") & 1) != 0)
      return 0;
  }
  v8 = (void *)objc_msgSend(*(id *)a4, "attachmentAtCharIndex:", a3);
  if (!objc_msgSend(v8, "isDrawable")
    || !objc_msgSend(v8, "isAnchored")
    || (objc_msgSend(v8, "isPartitioned") & 1) != 0)
  {
    return 0;
  }
  objc_opt_class();
  return objc_msgSend(v6, "containsObject:", objc_msgSend((id)TSUDynamicCast(), "drawable"));
}

- (void)p_drawAttachmentAdornments:(const void *)a3 lineFragment:(const void *)a4 state:(const void *)a5
{
  int v9;
  double v10;
  CGFloat v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;

  v9 = *((unsigned __int8 *)a5 + 91);
  v10 = *((double *)a4 + 6);
  v11 = *((double *)a4 + 4) + *((double *)a4 + 5);
  CGContextSaveGState(self->_context);
  CGContextTranslateCTM(self->_context, v10 + *(double *)(*((_QWORD *)a4 + 24) + 8), v11);
  CGContextSetFillColorWithColor(self->_context, *((CGColorRef *)a5 + 9));
  CGContextSetStrokeColorWithColor(self->_context, *((CGColorRef *)a5 + 9));
  v12 = (_QWORD *)*((_QWORD *)a3 + 16);
  v13 = (_QWORD *)*((_QWORD *)a3 + 17);
  if (v12 != v13)
  {
    v14 = (void *)*((_QWORD *)a5 + 6);
    do
    {
      if (v9
        || (objc_msgSend(v14, "containsCharacterAtIndex:", *v12),
            -[TSWPRenderer p_canvasSelectionIncludesDrawableOfAttachmentAtCharIndex:state:](self, "p_canvasSelectionIncludesDrawableOfAttachmentAtCharIndex:state:", *v12, a5)))
      {
        -[TSWPRenderer p_drawAttachmentGlyphAtPosition:fragment:](self, "p_drawAttachmentGlyphAtPosition:fragment:", *v12, v12[1], a4);
      }
      v12 += 2;
    }
    while (v12 != v13);
  }
  CGContextRestoreGState(self->_context);
}

- (void)p_drawAdornmentGlyphs:(const void *)a3 lineFragment:(const void *)a4 state:(const void *)a5
{
  const __CTFont *v8;
  CGColor *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  double v18;
  CGFloat v19;
  unsigned int v20;
  CGPoint *v21;
  CGContext *context;
  CGContext *v23;
  CGContext *v24;
  CGContext *v26;
  size_t v27;
  CGAffineTransform v28;
  CGPoint positions;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGAffineTransform transform;

  v9 = (CGColor *)*((_QWORD *)a3 + 2);
  v8 = (const __CTFont *)*((_QWORD *)a3 + 3);
  v10 = *((double *)a4 + 6);
  v11 = *((double *)a4 + 4) + *((double *)a4 + 5);
  v13 = *((double *)a3 + 22);
  v12 = *((double *)a3 + 23);
  if (*((_BYTE *)a3 + 192))
  {
    v15 = *((_QWORD *)a3 + 13);
    v14 = *((_QWORD *)a3 + 14);
    if (v14 != v15)
    {
      v16 = 0;
      v17 = (v14 - v15) >> 4;
      v18 = *((double *)a3 + 19) + *((double *)a3 + 20);
      v19 = *((double *)a3 + 21);
      v20 = 1;
      v21 = (CGPoint *)MEMORY[0x24BDBEFB0];
      do
      {
        CGContextSaveGState(self->_context);
        CGContextSetFillColorWithColor(self->_context, v9);
        CGContextTranslateCTM(self->_context, *(double *)(*((_QWORD *)a3 + 13) + 16 * v16) + v13 + v10 + *(double *)(*((_QWORD *)a4 + 24) + 8), v11 + v12 + *(double *)(*((_QWORD *)a3 + 13) + 16 * v16 + 8) - v18);
        CGContextSetTextPosition(self->_context, 0.0, 0.0);
        context = self->_context;
        CGAffineTransformMakeScale(&transform, 1.0, -1.0);
        CGContextConcatCTM(context, &transform);
        v23 = self->_context;
        CGAffineTransformMakeTranslation(&v31, v19, -v18);
        CGContextConcatCTM(v23, &v31);
        v24 = self->_context;
        CGAffineTransformMakeRotation(&v30, 1.57079633);
        CGContextConcatCTM(v24, &v30);
        positions = *v21;
        CTFontDrawGlyphs(v8, (const CGGlyph *)(*((_QWORD *)a3 + 7) + 2 * v16), &positions, 1uLL, self->_context);
        CGContextRestoreGState(self->_context);
        v16 = v20;
      }
      while (v17 > v20++);
    }
  }
  else
  {
    CGContextSaveGState(self->_context);
    CGContextSetFillColorWithColor(self->_context, v9);
    CGContextTranslateCTM(self->_context, v13 + v10 + *(double *)(*((_QWORD *)a4 + 24) + 8), v11 + v12);
    v26 = self->_context;
    CGAffineTransformMakeScale(&v28, 1.0, -1.0);
    CGContextConcatCTM(v26, &v28);
    v27 = (uint64_t)(*((_QWORD *)a3 + 14) - *((_QWORD *)a3 + 13)) >> 4;
    CGContextSetTextPosition(self->_context, 0.0, 0.0);
    CTFontDrawGlyphs(v8, *((const CGGlyph **)a3 + 7), *((const CGPoint **)a3 + 13), v27, self->_context);
    CGContextRestoreGState(self->_context);
  }
}

- (void)p_drawInvisiblesBreakLine:(const TSWPAdornmentLine *)a3 lineFragment:(const void *)a4 state:(const void *)a5
{
  uint64_t v5;
  char v10;
  uint64_t v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  __int128 *v15;
  CGColor *v16;
  uint64_t v17;
  id v18;
  __int128 v19;
  uint64_t v20;
  CGColorRef color;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  char v26;
  id v27;

  v5 = *((_QWORD *)a4 + 1);
  if (v5)
  {
    if (*((_BYTE *)a5 + 91))
    {
      v10 = 0;
      if (!a3)
        return;
    }
    else
    {
      v11 = *(_QWORD *)a4;
      v12 = (void *)*((_QWORD *)a5 + 6);
      if (!objc_msgSend(v12, "isValid"))
        return;
      v10 = objc_msgSend(v12, "containsCharacterAtIndex:", v11 + v5 - 1) ^ 1;
      if (!a3)
        return;
    }
    if ((v10 & 1) == 0)
    {
      v13 = *((double *)a4 + 6);
      v14 = *((double *)a4 + 4) + *((double *)a4 + 5);
      CGContextSaveGState(self->_context);
      CGContextTranslateCTM(self->_context, v13, v14);
      v15 = (__int128 *)*((_QWORD *)a4 + 58);
      if (v15)
      {
        v16 = (CGColor *)*((_QWORD *)a5 + 9);
        v19 = *v15;
        v20 = *((_QWORD *)v15 + 2);
        color = v16;
        v17 = *((_QWORD *)v15 + 5);
        v22 = *((_QWORD *)v15 + 4);
        v23 = v17;
        v24 = *((_DWORD *)v15 + 12);
        v25 = *((_QWORD *)v15 + 7);
        v26 = *((_BYTE *)v15 + 64);
        v27 = (id)*((_QWORD *)v15 + 9);
        CGColorRetain(v16);
        v18 = v27;
        -[TSWPRenderer p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:](self, "p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:", &v19, a5, a4, 0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
        CGColorRelease(color);

      }
      CGContextRestoreGState(self->_context);
    }
  }
}

- (void)p_drawListLabelForFragment:(const void *)a3 drawingState:(const void *)a4 lineDrawFlags:(unsigned int)a5
{
  __int16 v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  BOOL v13;
  BOOL v14;
  uint64_t v15;
  double v16;
  CGFloat v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  uint64_t v26;

  v5 = a5;
  v9 = *(_QWORD *)a3;
  v10 = *((_QWORD *)a3 + 1);
  v11 = *((_QWORD *)a3 + 22);
  v12 = objc_msgSend(*((id *)a4 + 7), "type");
  if (!objc_msgSend(*((id *)a4 + 7), "isValid")
    || (objc_msgSend(*((id *)a4 + 7), "containsCharacterAtIndex:", v9) ? (v13 = v12 == 2) : (v13 = 0), v13))
  {
    v14 = 0;
    if (!v11)
      return;
  }
  else
  {
    if (objc_msgSend(*((id *)a4 + 7), "start") != v9)
      return;
    v14 = (v12 - 3) < 0xFFFFFFFE;
    if (!v11)
      return;
  }
  if (!v14
    && (!*((_BYTE *)a4 + 93)
     || (v5 & 0x100) != 0
     || v10 != 1
     || (IsParagraphBreakingCharacter(objc_msgSend(*(id *)a4, "characterAtIndex:", v9)) & 1) == 0))
  {
    CGContextSaveGState(self->_context);
    if (!*((_BYTE *)a4 + 89))
    {
      v18 = *(void **)(v11 + 32);
      if (v18)
      {
        if (objc_msgSend(*(id *)(v11 + 32), "isEnabled"))
          objc_msgSend(v18, "applyToContext:viewScale:flipped:", self->_context, self->_flipShadows, self->_viewScale);
      }
    }
    v15 = *(_QWORD *)(v11 + 16);
    if (v15)
    {
      v16 = TSWPLineFragment::labelTextPosition((TSWPLineFragment *)a3);
      CGContextTranslateCTM(self->_context, v16, v17);
      CGContextSetTextPosition(self->_context, 0.0, 0.0);
      LOBYTE(v26) = 0;
      -[TSWPRenderer p_drawTextInRunsForLine:fragment:state:tateChuYoko:baseRange:isFirstLineRef:](self, "p_drawTextInRunsForLine:fragment:state:tateChuYoko:baseRange:isFirstLineRef:", v15, a3, a4, *(unsigned __int8 *)(v11 + 81), v9, 0, v26);
    }
    else
    {
      v19 = *(void **)(v11 + 24);
      if (v19)
      {
        TSWPLineFragment::labelRect((TSWPLineFragment *)a3);
        v21 = v20;
        v23 = v22;
        CGContextTranslateCTM(self->_context, v24, v25);
        if ((*((_BYTE *)a3 + 25) & 0x20) != 0)
        {
          CGContextTranslateCTM(self->_context, 0.0, v23);
          CGContextRotateCTM(self->_context, -1.57079633);
        }
        objc_msgSend(v19, "drawImageInContext:rect:", self->_context, 0.0, 0.0, v21, v23);
      }
    }
    CGContextRestoreGState(self->_context);
  }
}

- (BOOL)flipShadows
{
  return self->_flipShadows;
}

- (double)viewScale
{
  return self->_viewScale;
}

- (TSDBezierPath)interiorClippingPath
{
  return self->_interiorClippingPath;
}

- (void)setInteriorClippingPath:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
