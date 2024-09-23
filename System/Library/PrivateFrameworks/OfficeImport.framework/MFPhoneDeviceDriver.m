@implementation MFPhoneDeviceDriver

- (MFPhoneDeviceDriver)initWithCanvas:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  MFPhoneDeviceDriver *v7;
  MFPhoneDeviceDriver *v8;
  CGContext *v9;
  __int128 v10;
  __int128 v11;
  __int128 *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CGAffineTransform v17;
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18.receiver = self;
  v18.super_class = (Class)MFPhoneDeviceDriver;
  v7 = -[MFPhoneDeviceDriver init](&v18, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->m_canvas.origin.x = x;
    v7->m_canvas.origin.y = y;
    v7->m_canvas.size.width = width;
    v7->m_canvas.size.height = height;
    v9 = TCCurrentGraphicsContext();
    CGContextGetCTM(&v17, v9);
    v11 = *(_OWORD *)&v17.c;
    v10 = *(_OWORD *)&v17.tx;
    *(_OWORD *)&v8->m_canvasTransform.a = *(_OWORD *)&v17.a;
    *(_OWORD *)&v8->m_canvasTransform.c = v11;
    *(_OWORD *)&v8->m_canvasTransform.tx = v10;
    v8->m_viewBox.origin.x = x;
    v8->m_viewBox.origin.y = y;
    v8->m_viewBox.size.width = width;
    v8->m_viewBox.size.height = height;
    v12 = (__int128 *)MEMORY[0x24BDBD8B8];
    v13 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v8->m_viewBoxTransform.a = *MEMORY[0x24BDBD8B8];
    v14 = *v12;
    *(_OWORD *)&v8->m_viewBoxTransform.c = v12[1];
    v15 = v12[2];
    *(_OWORD *)&v8->m_viewBoxTransform.tx = v15;
    *(_OWORD *)&v8->m_worldToDeviceTransform.tx = v15;
    *(_OWORD *)&v8->m_worldToDeviceTransform.a = v14;
    *(_OWORD *)&v8->m_worldToDeviceTransform.c = v13;
    *(_OWORD *)&v8->m_combinedTransform.tx = v12[2];
    *(_OWORD *)&v8->m_combinedTransform.c = v13;
    *(_OWORD *)&v8->m_combinedTransform.a = v14;
  }
  return v8;
}

- (id)createFont:(int)a3
{
  return +[MFFont fontWithStockFont:](MFPhoneFont, "fontWithStockFont:", *(_QWORD *)&a3);
}

- (id)createSolidBrush:(id)a3
{
  +[MFPhoneSolidBrush solidBrushWithColour:](MFPhoneSolidBrush, "solidBrushWithColour:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)createPath
{
  return objc_alloc_init(MFPhonePath);
}

- (int)activateTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->m_worldToDeviceTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->m_worldToDeviceTransform.c = v4;
  *(_OWORD *)&self->m_worldToDeviceTransform.a = v3;
  -[MFPhoneDeviceDriver applyTransformsToCurrentContext](self, "applyTransformsToCurrentContext");
  return 0;
}

- (void)updateViewBoxTransform
{
  float32x2_t v2;
  float32x2_t v3;

  self->m_viewBoxTransform.b = 0.0;
  self->m_viewBoxTransform.c = 0.0;
  v2 = vcvt_f32_f64(vdivq_f64((float64x2_t)self->m_canvas.size, (float64x2_t)self->m_viewBox.size));
  v3 = vcvt_f32_f64(vmlaq_f64((float64x2_t)self->m_canvas.origin, (float64x2_t)self->m_viewBox.origin, vcvtq_f64_f32(vneg_f32(v2))));
  self->m_viewBoxTransform.a = v2.f32[0];
  self->m_viewBoxTransform.d = v2.f32[1];
  *(float64x2_t *)&self->m_viewBoxTransform.tx = vcvtq_f64_f32(v3);
  -[MFPhoneDeviceDriver applyTransformsToCurrentContext](self, "applyTransformsToCurrentContext");
}

- (void)drawBezierPath:(id)a3 dc:(id)a4 fill:(BOOL)a5 stroke:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a6;
  v7 = a5;
  v13 = a3;
  v9 = a4;
  objc_msgSend(v9, "getPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isOpen") & 1) != 0)
  {
    objc_msgSend(v10, "appendBezierPath:dc:", v13, v9);
  }
  else
  {
    if (v7)
    {
      objc_msgSend(v9, "getBrush");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fillPath:in_path:", v9, v13);

    }
    if (v6)
    {
      objc_msgSend(v9, "getPen");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "strokePath:in_path:", v9, v13);

    }
  }

}

+ (int)getROP:(id)a3
{
  id v3;
  void *v4;
  int v5;
  int v6;
  int v7;

  v3 = a3;
  objc_msgSend(v3, "getPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isOpen") & 1) != 0)
  {
    v5 = 3;
  }
  else
  {
    v6 = objc_msgSend(v3, "getRop2");
    if (v6 == 16)
      v7 = 1;
    else
      v7 = 2;
    if (v6 == 1)
      v5 = 0;
    else
      v5 = v7;
  }

  return v5;
}

- (int)intersectClipRect:(CGRect)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3.size.width > 0.0 && a3.size.height > 0.0)
    +[OITSUBezierPath clipRect:](OITSUBezierPath, "clipRect:", a3.origin.x, a3.origin.y, v3, v4);
  return 0;
}

- (id)createNullBrush
{
  return +[MFPhoneNullBrush nullBrush](MFPhoneNullBrush, "nullBrush");
}

- (CGRect)getCanvas
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->m_canvas.origin.x;
  y = self->m_canvas.origin.y;
  width = self->m_canvas.size.width;
  height = self->m_canvas.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)createPen
{
  return +[MFPen pen](MFPhonePen, "pen");
}

- (int)excludeClipRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  CGRect v14;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIntersectsRect(a3, self->m_canvas))
  {
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    v15 = CGRectIntersection(v14, self->m_canvas);
    v8 = v15.origin.x;
    v9 = v15.origin.y;
    v10 = v15.size.width;
    v11 = v15.size.height;
    +[OITSUBezierPath bezierPathWithRect:](OITSUBezierPath, "bezierPathWithRect:", self->m_canvas.origin.x, self->m_canvas.origin.y, self->m_canvas.size.width, self->m_canvas.size.height);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendBezierPathWithRect:", v8, v9, v10, v11);
    objc_msgSend(v12, "setWindingRule:", 1);
    objc_msgSend(v12, "addClip");

  }
  return 0;
}

- (id)createPatternBrush:(id)a3 usePaletteForBilevel:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a4;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[MFPhonePatternBrush patternBrushWithBitmap:usePaletteForBilevel:](MFPhonePatternBrush, "patternBrushWithBitmap:usePaletteForBilevel:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int)setMetaRgn
{
  return 0;
}

- (id)createRegionWithPath:(id)a3
{
  id v4;
  MFPhoneRegion *v5;

  v4 = a3;
  v5 = -[MFPhoneRegion initWithPath:in_bounds:]([MFPhoneRegion alloc], "initWithPath:in_bounds:", v4, self->m_viewBox.origin.x, self->m_viewBox.origin.y, self->m_viewBox.size.width, self->m_viewBox.size.height);

  return v5;
}

- (int)textOut:(id)a3 px:(int *)a4 py:(int *)a5 in_text:(id)a6
{
  uint64_t v7;
  uint64_t v8;

  LODWORD(v8) = 0;
  LODWORD(v7) = 0;
  return -[MFPhoneDeviceDriver extTextOut:px:py:in_text:options:left:top:right:bottom:spacingValues:numValues:](self, "extTextOut:px:py:in_text:options:left:top:right:bottom:spacingValues:numValues:", a3, a4, a5, a6, 0, 0, 0, v7, 0, v8);
}

- (int)extTextOut:(id)a3 px:(int *)a4 py:(int *)a5 in_text:(id)a6 options:(int)a7 left:(int)a8 top:(int)a9 right:(int)a10 bottom:(int)a11 spacingValues:(int *)a12 numValues:(int)a13
{
  char v13;
  id v17;
  void *v18;
  const void *v19;
  int v20;
  int v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  int v27;
  __CFString *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  int v32;
  int v33;
  int v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  const __CTFont *v39;
  char v40;
  char v41;
  CGGlyph *v42;
  const UniChar *v43;
  CGSize *v44;
  const __CTFont **v45;
  __CFString *v46;
  const __CTFont *v47;
  int v48;
  int v49;
  uint64_t v50;
  float v51;
  int v52;
  uint64_t v53;
  double *p_width;
  double v55;
  float v56;
  float v57;
  uint64_t v58;
  int *v59;
  int v60;
  CFStringRef v61;
  void *v62;
  char v63;
  double Ascent;
  double Descent;
  int v66;
  float v67;
  float v68;
  float v69;
  float v70;
  int v71;
  float v72;
  CGContext *v73;
  double d;
  double v75;
  float v76;
  float v77;
  void *v78;
  void *v79;
  CGFloat Size;
  CGFont *v81;
  uint64_t v82;
  const void *v83;
  double v84;
  uint64_t v85;
  float v86;
  const CGGlyph *v87;
  double *v88;
  const void *v89;
  CGFont *v90;
  CGContext *v91;
  void *v92;
  double v93;
  int v94;
  float v95;
  float v96;
  float v97;
  float v98;
  void *v100;
  CGFloat tx;
  int *v102;
  void *v103;
  int v104;
  double Leading;
  UniChar *characters;
  char v107;
  const __CTFont *font;
  CGSize *advances;
  int *v110;
  CGGlyph *glyphs;
  void *v112;
  __CFString *v113;
  __CFString *v114;
  CGAffineTransform v115;
  uint64_t v116;
  CFRange v117;
  CFRange v118;
  CGRect v119;

  v13 = a7;
  v116 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v113 = (__CFString *)a6;
  objc_msgSend(v17, "getFont");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = v13;
  v112 = v18;
  v19 = (const void *)objc_msgSend(v18, "createCTFontEquivalent");
  v20 = *a4;
  v21 = *a5;
  objc_msgSend(v17, "getPath");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v113, "length"))
  {
    if (objc_msgSend(v17, "getTextUpdateCP"))
    {
      objc_msgSend(v17, "getPenPosition");
      v24 = v23;
      v26 = v25;
    }
    else
    {
      v24 = (double)v20;
      v26 = (double)v21;
    }
    v28 = v113;
    if (!v113)
      v28 = &stru_24F3BFFF8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v18, "faceName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "faceName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[TCFontUtils stringByFixingString:latinFontFamilyName:symbolFontFamilyName:](TCFontUtils, "stringByFixingString:latinFontFamilyName:symbolFontFamilyName:", v28, v29, v30);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v28 = v31;
      v32 = -[__CFString length](v31, "length");
      if (!v32)
      {
LABEL_22:
        CFRelease(v19);
        v27 = 0;
        goto LABEL_108;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_22;
      v33 = -[__CFString length](v28, "length");
      v34 = v33 >= 0 ? v33 : v33 + 1;
      v32 = v34 >> 1;
      if (!(v34 >> 1))
        goto LABEL_22;
    }
    glyphs = (CGGlyph *)malloc_type_malloc(2 * v32, 0x1000040BDFB0063uLL);
    bzero(glyphs, 2 * v32);
    characters = (UniChar *)malloc_type_malloc(2 * (v32 + 1), 0x1000040BDFB0063uLL);
    font = (const __CTFont *)v19;
    v102 = a4;
    advances = (CGSize *)malloc_type_malloc(16 * v32, 0x1000040451B5BE8uLL);
    v35 = malloc_type_malloc(8 * v32, 0x6004044C4A2DFuLL);
    v36 = v35;
    if (glyphs && characters && advances && v35)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[__CFString getCharacters:range:](v28, "getCharacters:range:", characters, 0, v32);
        CTFontGetGlyphsForCharacters(font, characters, glyphs, v32);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          memcpy(glyphs, (const void *)-[__CFString bytes](objc_retainAutorelease(v28), "bytes"), 2 * v32);
      }
      CTFontGetAdvancesForGlyphs(font, kCTFontOrientationDefault, glyphs, advances, v32);
      if (v32 >= 1)
        bzero(v36, 8 * v32);
      v100 = v17;
      v114 = v28;
      v103 = v22;
      objc_opt_class();
      v104 = v32;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v32 < 1)
        {
          v41 = 0;
        }
        else
        {
          v37 = 0;
          v38 = v32;
          while (glyphs[v37])
          {
            if (v32 == ++v37)
            {
              v39 = font;
              goto LABEL_45;
            }
          }
          v117.length = -[__CFString length](v28, "length");
          v117.location = 0;
          v39 = CTFontCreateForString(font, v28, v117);
          CFRelease(font);
          CTFontGetGlyphsForCharacters(v39, characters, glyphs, v32);
          CTFontGetAdvancesForGlyphs(v39, kCTFontOrientationDefault, glyphs, advances, v32);
LABEL_45:
          v41 = 0;
          v42 = glyphs;
          v43 = characters;
          v44 = advances;
          v45 = (const __CTFont **)v36;
          do
          {
            if (!*v42)
            {
              v46 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharactersNoCopy:length:freeWhenDone:", v43, 1, 0);
              v118.length = -[__CFString length](v46, "length");
              v118.location = 0;
              v47 = CTFontCreateForString(v39, v46, v118);
              CTFontGetGlyphsForCharacters(v47, v43, v42, 1);
              CTFontGetAdvancesForGlyphs(v47, kCTFontOrientationDefault, v42, v44, 1);
              *v45 = v47;

              v41 = 1;
              v32 = v104;
            }
            ++v45;
            ++v44;
            ++v43;
            ++v42;
            --v38;
          }
          while (v38);
          font = v39;
          v17 = v100;
        }
        v40 = v41;
      }
      else
      {
        v40 = 0;
      }
      v48 = objc_msgSend(v17, "getTextCharExtra");
      v49 = a13;
      v110 = a12;
      v50 = v32;
      v51 = 0.0;
      v52 = v32 - 1;
      if (v32 >= 1)
      {
        v53 = v32;
        p_width = &advances->width;
        do
        {
          v55 = *p_width;
          p_width += 2;
          v51 = v55 + v51;
          --v53;
        }
        while (v53);
      }
      v56 = (float)v48;
      tx = v24;
      if (a12 && a13)
      {
        v57 = 0.0;
        if (a13 >= 1)
        {
          v58 = a13;
          v59 = a12;
          do
          {
            v60 = *v59++;
            v57 = v57 + (float)v60;
            --v58;
          }
          while (v58);
        }
        if ((v40 & 1) != 0
          || (v61 = CTFontCopyFamilyName(font),
              objc_msgSend(v112, "faceName"),
              v62 = (void *)objc_claimAutoreleasedReturnValue(),
              v63 = objc_msgSend(v62, "isEqualToString:", v61),
              v62,
              CFRelease(v61),
              (v63 & 1) == 0))
        {
          v32 = v104;
          v49 = 0;
          v110 = 0;
          if (v104 < 2)
            v56 = 0.0;
          else
            v56 = (float)(v57 - v51) / (float)v52;
        }
        else
        {
          v32 = v104;
        }
      }
      else
      {
        v57 = v51 + (float)((float)v32 * v56);
      }
      Ascent = CTFontGetAscent(font);
      Descent = CTFontGetDescent(font);
      Leading = CTFontGetLeading(font);
      v66 = objc_msgSend(v17, "getTextVerticalAlign");
      v67 = Ascent;
      v68 = Descent;
      v69 = fabsf(v68);
      v70 = v67;
      if (v66)
      {
        if (v66 == 8)
          v70 = -v69;
        else
          v70 = 0.0;
      }
      v71 = objc_msgSend(v17, "getTextHorizontalAlign");
      v72 = v57;
      if (v71 != 2)
      {
        if (v71 == 6)
          v72 = v57 * 0.5;
        else
          v72 = 0.0;
      }
      v73 = TCCurrentGraphicsContext();
      CGContextSaveGState(v73);
      CGContextGetCTM(&v115, v73);
      d = v115.d;
      if (v115.d < 0.0)
        v70 = v67 - v70;
      CGContextTranslateCTM(v73, tx, v26);
      objc_msgSend(v112, "escapement");
      v76 = v75;
      if (v76 != 0.0)
        CGContextRotateCTM(v73, (float)(360.0 - v76) * 3.14159265 / 180.0);
      CGContextTranslateCTM(v73, (float)-v72, (float)-v70);
      if (d < 0.0)
      {
        CGContextTranslateCTM(v73, 0.0, (float)(v67 * 0.5));
        CGContextScaleCTM(v73, 1.0, -1.0);
        CGContextTranslateCTM(v73, 0.0, (float)-(float)(v67 * 0.5));
      }
      v77 = v69 + v67;
      if (((v107 & 2) != 0 || objc_msgSend(v17, "getBkMode") == 2)
        && (objc_msgSend(v103, "isOpen") & 1) == 0)
      {
        objc_msgSend(v17, "getBkColour");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "set");

        v119.origin.y = (float)-v69;
        v119.size.width = v57;
        v119.size.height = v77;
        v119.origin.x = 0.0;
        CGContextFillRect(v73, v119);
      }
      if ((objc_msgSend(v103, "isOpen") & 1) == 0)
      {
        objc_msgSend(v17, "getTextColour");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "set");

      }
      Size = CTFontGetSize(font);
      CGContextSetFontSize(v73, Size);
      v81 = CTFontCopyGraphicsFont(font, 0);
      CGContextSetFont(v73, v81);
      if (v32 >= 1)
      {
        v82 = 0;
        v83 = 0;
        v84 = v56;
        v85 = v49;
        v86 = 0.0;
        v87 = glyphs;
        v88 = &advances->width;
        while (1)
        {
          v89 = v83;
          v83 = (const void *)*((_QWORD *)v36 + v82);
          if (v83 != v89)
          {
            if (v83)
            {
              v90 = CTFontCopyGraphicsFont(*((CTFontRef *)v36 + v82), 0);
              CGContextSetFont(v73, v90);
              CFRelease(v90);
            }
            else
            {
              CGContextSetFont(v73, v81);
            }
          }
          v115.a = v86;
          v115.b = 0.0;
          v91 = TCCurrentGraphicsContext();
          CGContextShowGlyphsAtPositions(v91, v87, (const CGPoint *)&v115, 1uLL);
          if (v82 < v85)
            break;
          v86 = *v88 + v84 + v86;
          if (v83)
            goto LABEL_98;
LABEL_99:
          ++v82;
          v88 += 2;
          ++v87;
          if (v50 == v82)
            goto LABEL_100;
        }
        if (v110)
          v86 = v86 + (float)v110[v82];
        if (!v83)
          goto LABEL_99;
LABEL_98:
        CFRelease(v83);
        *((_QWORD *)v36 + v82) = 0;
        goto LABEL_99;
      }
LABEL_100:
      CFRelease(v81);
      v28 = v114;
      v17 = v100;
      if ((objc_msgSend(v112, "strikeout") & 1) != 0
        || objc_msgSend(v112, "underline") && (objc_msgSend(v103, "isOpen") & 1) == 0)
      {
        objc_msgSend(v100, "getTextColour");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "set");

        objc_msgSend(v112, "fontHeight");
        CGContextSetLineWidth(v73, fabs(v93) / 20.0);
        v94 = objc_msgSend(v112, "strikeout");
        v95 = Leading;
        v96 = v77 + v95;
        if (v94)
        {
          v97 = v96 * 0.2;
          v115.a = 0.0;
          v115.b = v97;
          v115.c = v57;
          v115.d = v97;
          CGContextStrokeLineSegments(v73, (const CGPoint *)&v115, 2uLL);
        }
        if (objc_msgSend(v112, "underline"))
        {
          v98 = v96 * -0.1;
          v115.a = 0.0;
          v115.b = v98;
          v115.c = v57;
          v115.d = v98;
          CGContextStrokeLineSegments(v73, (const CGPoint *)&v115, 2uLL);
        }
      }
      CGContextRestoreGState(v73);
      *v102 = (int)(tx + v72 + v57);
      CFRelease(font);
      free(glyphs);
      free(characters);
      free(advances);
      free(v36);
      v27 = 0;
      v22 = v103;
    }
    else
    {
      if (glyphs)
        free(glyphs);
      if (characters)
        free(characters);
      if (advances)
        free(advances);
      if (v36)
        free(v36);
      v27 = -4;
    }
  }
  else
  {
    CFRelease(v19);
    v27 = 0;
    v28 = v113;
  }
LABEL_108:

  return v27;
}

- (int)arc:(id)a3 nLeftRect:(int)a4 nTopRect:(int)a5 nRightRect:(int)a6 nBottomRect:(int)a7 nXStartArc:(int)a8 nYStartArc:(int)a9 nXEndArc:(int)a10 nYEndArc:(int)a11
{
  id v17;
  int v18;
  OITSUBezierPath *v19;

  v17 = a3;
  v18 = objc_msgSend(v17, "getArcDirection");
  v19 = objc_alloc_init(OITSUBezierPath);
  -[OITSUBezierPath appendBezierPathWithArcWithEllipseBounds:startRadialVector:endRadialVector:angleSign:startNewPath:](v19, "appendBezierPathWithArcWithEllipseBounds:startRadialVector:endRadialVector:angleSign:startNewPath:", v18 == 1, 1, (double)a4, (double)a5, (double)(a6 - a4), (double)(a7 - a5), (double)a8, (double)a9, (double)a10, (double)a11);
  -[MFPhoneDeviceDriver drawBezierPath:dc:fill:stroke:](self, "drawBezierPath:dc:fill:stroke:", v19, v17, 0, 1);

  return 0;
}

- (int)arcTo:(id)a3 nLeftRect:(int)a4 nTopRect:(int)a5 nRightRect:(int)a6 nBottomRect:(int)a7 nXStartArc:(int)a8 nYStartArc:(int)a9 nXEndArc:(int)a10 nYEndArc:(int)a11
{
  id v17;
  int v18;
  OITSUBezierPath *v19;

  v17 = a3;
  v18 = objc_msgSend(v17, "getArcDirection");
  v19 = objc_alloc_init(OITSUBezierPath);
  objc_msgSend(v17, "getPenPosition");
  -[OITSUBezierPath moveToPoint:](v19, "moveToPoint:");
  -[OITSUBezierPath appendBezierPathWithArcWithEllipseBounds:startRadialVector:endRadialVector:angleSign:startNewPath:](v19, "appendBezierPathWithArcWithEllipseBounds:startRadialVector:endRadialVector:angleSign:startNewPath:", v18 == 1, 0, (double)a4, (double)a5, (double)(a6 - a4), (double)(a7 - a5), (double)a8, (double)a9, (double)a10, (double)a11);
  -[MFPhoneDeviceDriver drawBezierPath:dc:fill:stroke:](self, "drawBezierPath:dc:fill:stroke:", v19, v17, 0, 1);
  -[OITSUBezierPath currentPoint](v19, "currentPoint");
  objc_msgSend(v17, "setPenPosition:");

  return 0;
}

- (int)angleArc:(id)a3 x:(int)a4 y:(int)a5 radius:(unsigned int)a6 startAngle:(double)a7 sweepAngle:(double)a8
{
  id v14;
  double v15;
  double v16;
  double v17;
  OITSUBezierPath *v18;

  v14 = a3;
  v15 = 360.0 - a7;
  v16 = fmod(360.0 - a7, 360.0);
  v17 = fmod(v15 - a8, 360.0);
  v18 = objc_alloc_init(OITSUBezierPath);
  objc_msgSend(v14, "getPenPosition");
  -[OITSUBezierPath moveToPoint:](v18, "moveToPoint:");
  -[OITSUBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:](v18, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", a8 > 0.0, (double)a4, (double)a5, (double)a6, v16, v17);
  -[MFPhoneDeviceDriver drawBezierPath:dc:fill:stroke:](self, "drawBezierPath:dc:fill:stroke:", v18, v14, 0, 1);
  -[OITSUBezierPath currentPoint](v18, "currentPoint");
  objc_msgSend(v14, "setPenPosition:");

  return 0;
}

- (int)pie:(id)a3 nLeftRect:(int)a4 nTopRect:(int)a5 nRightRect:(int)a6 nBottomRect:(int)a7 nXStartArc:(int)a8 nYStartArc:(int)a9 nXEndArc:(int)a10 nYEndArc:(int)a11
{
  id v17;
  int v18;
  OITSUBezierPath *v19;
  double v20;

  v17 = a3;
  v18 = objc_msgSend(v17, "getArcDirection");
  v19 = objc_alloc_init(OITSUBezierPath);
  v20 = (double)(a7 - a5);
  -[OITSUBezierPath moveToPoint:](v19, "moveToPoint:", (double)(a6 - a4) * 0.5 + (double)a4, v20 * 0.5 + (double)a5);
  -[OITSUBezierPath appendBezierPathWithArcWithEllipseBounds:startRadialVector:endRadialVector:angleSign:startNewPath:](v19, "appendBezierPathWithArcWithEllipseBounds:startRadialVector:endRadialVector:angleSign:startNewPath:", v18 == 1, 0, (double)a4, (double)a5, (double)(a6 - a4), v20, (double)a8, (double)a9, (double)a10, (double)a11);
  -[OITSUBezierPath closePath](v19, "closePath");
  -[MFPhoneDeviceDriver drawBezierPath:dc:fill:stroke:](self, "drawBezierPath:dc:fill:stroke:", v19, v17, 1, 1);

  return 0;
}

- (int)chord:(id)a3 leftRect:(int)a4 topRect:(int)a5 rightRect:(int)a6 bottomRect:(int)a7 xStartArc:(int)a8 yStartArc:(int)a9 xEndArc:(int)a10 yEndArc:(int)a11
{
  id v17;
  int v18;
  OITSUBezierPath *v19;

  v17 = a3;
  v18 = objc_msgSend(v17, "getArcDirection");
  v19 = objc_alloc_init(OITSUBezierPath);
  -[OITSUBezierPath appendBezierPathWithArcWithEllipseBounds:startRadialVector:endRadialVector:angleSign:startNewPath:](v19, "appendBezierPathWithArcWithEllipseBounds:startRadialVector:endRadialVector:angleSign:startNewPath:", v18 == 1, 1, (double)a4, (double)a5, (double)(a6 - a4), (double)(a7 - a5), (double)a8, (double)a9, (double)a10, (double)a11);
  -[OITSUBezierPath closePath](v19, "closePath");
  -[MFPhoneDeviceDriver drawBezierPath:dc:fill:stroke:](self, "drawBezierPath:dc:fill:stroke:", v19, v17, 1, 1);

  return 0;
}

- (int)polyline:(id)a3 in_points:(CGPoint *)a4 in_count:(int)a5
{
  id v8;
  OITSUBezierPath *v9;

  v8 = a3;
  if (a5 >= 2)
  {
    v9 = objc_alloc_init(OITSUBezierPath);
    -[OITSUBezierPath appendBezierPathWithPoints:count:](v9, "appendBezierPathWithPoints:count:", a4, a5);
    -[MFPhoneDeviceDriver drawBezierPath:dc:fill:stroke:](self, "drawBezierPath:dc:fill:stroke:", v9, v8, 0, 1);

  }
  return 0;
}

- (int)polyPolyline:(id)a3 in_points:(CGPoint *)a4 in_polyCounts:(int *)a5 in_count:(int)a6
{
  id v10;
  uint64_t v11;
  int v12;
  unint64_t v13;
  int v14;
  int v15;

  v10 = a3;
  if (a6 < 1)
  {
    v15 = 0;
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = a6;
    do
    {
      v14 = -[MFPhoneDeviceDriver polyline:in_points:in_count:](self, "polyline:in_points:in_count:", v10, &a4[v12], a5[v11]);
      v15 = v14;
      if (v11 + 1 >= v13)
        break;
      v12 += a5[v11++];
    }
    while (!v14);
  }

  return v15;
}

- (int)polygon:(id)a3 in_points:(CGPoint *)a4 in_count:(int)a5
{
  id v8;
  OITSUBezierPath *v9;

  v8 = a3;
  if (a5 >= 2)
  {
    v9 = objc_alloc_init(OITSUBezierPath);
    -[OITSUBezierPath appendBezierPathWithPoints:count:](v9, "appendBezierPathWithPoints:count:", a4, a5);
    -[OITSUBezierPath closePath](v9, "closePath");
    -[MFPhoneDeviceDriver drawBezierPath:dc:fill:stroke:](self, "drawBezierPath:dc:fill:stroke:", v9, v8, 1, 1);

  }
  return 0;
}

- (int)polyPolygon:(id)a3 in_points:(CGPoint *)a4 in_polyCounts:(int *)a5 in_count:(int)a6
{
  uint64_t v6;
  id v10;
  OITSUBezierPath *v11;
  int v12;
  int v13;

  LODWORD(v6) = a6;
  v10 = a3;
  v11 = objc_alloc_init(OITSUBezierPath);
  if ((int)v6 >= 1)
  {
    v12 = 0;
    v6 = v6;
    do
    {
      -[OITSUBezierPath appendBezierPathWithPoints:count:](v11, "appendBezierPathWithPoints:count:", &a4[v12], *a5);
      -[OITSUBezierPath closePath](v11, "closePath");
      v13 = *a5++;
      v12 += v13;
      --v6;
    }
    while (v6);
  }
  -[MFPhoneDeviceDriver drawBezierPath:dc:fill:stroke:](self, "drawBezierPath:dc:fill:stroke:", v11, v10, 1, 1);

  return 0;
}

- (int)lineTo:(id)a3 x:(double)a4 y:(double)a5
{
  id v8;
  OITSUBezierPath *v9;
  void *v10;
  int v11;
  CGFloat v12;
  CGFloat v13;
  CGPoint v15;
  CGPoint v16;
  CGPoint v17;

  v8 = a3;
  v9 = objc_alloc_init(OITSUBezierPath);
  objc_msgSend(v8, "getPenPosition");
  -[OITSUBezierPath moveToPoint:](v9, "moveToPoint:");
  objc_msgSend(v8, "getPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isOpen");

  if (v11)
  {
    -[OITSUBezierPath lineToPoint:](v9, "lineToPoint:", a4, a5);
  }
  else
  {
    v15 = (CGPoint)*MEMORY[0x24BDBEFB0];
    objc_msgSend(v8, "getPenPosition");
    v17.x = v12;
    v17.y = v13;
    v16.x = a4;
    v16.y = a5;
    calculatePreviousPointOnLine(v16, v17, &v15);
    -[OITSUBezierPath lineToPoint:](v9, "lineToPoint:", v15);
  }
  -[MFPhoneDeviceDriver drawBezierPath:dc:fill:stroke:](self, "drawBezierPath:dc:fill:stroke:", v9, v8, 0, 1);
  objc_msgSend(v8, "setPenPosition:", a4, a5);

  return 0;
}

- (int)rectangle:(id)a3 x1:(int)a4 y1:(int)a5 x2:(int)a6 y2:(int)a7
{
  id v12;
  OITSUBezierPath *v13;
  OITSUBezierPath *v14;
  int v15;
  float v16;
  int v17;
  float v18;
  int v19;
  float v20;
  int v21;

  v12 = a3;
  v13 = objc_alloc_init(OITSUBezierPath);
  v14 = v13;
  if (a5 <= a7)
    v15 = a7;
  else
    v15 = a5;
  v16 = (float)v15;
  if (a5 >= a7)
    v17 = a7;
  else
    v17 = a5;
  v18 = (float)v17;
  if (a4 <= a6)
    v19 = a6;
  else
    v19 = a4;
  v20 = (float)v19;
  if (a4 >= a6)
    v21 = a6;
  else
    v21 = a4;
  -[OITSUBezierPath appendBezierPathWithRect:](v13, "appendBezierPathWithRect:", (float)v21, v18, (float)(v20 - (float)v21), (float)(v16 - v18));
  -[MFPhoneDeviceDriver drawBezierPath:dc:fill:stroke:](self, "drawBezierPath:dc:fill:stroke:", v14, v12, 1, 1);

  return 0;
}

- (int)fillRectangle:(id)a3 x1:(int)a4 y1:(int)a5 x2:(int)a6 y2:(int)a7
{
  id v12;
  OITSUBezierPath *v13;
  OITSUBezierPath *v14;
  int v15;
  float v16;
  int v17;
  float v18;
  int v19;
  float v20;
  int v21;

  v12 = a3;
  v13 = objc_alloc_init(OITSUBezierPath);
  v14 = v13;
  if (a5 <= a7)
    v15 = a7;
  else
    v15 = a5;
  v16 = (float)v15;
  if (a5 >= a7)
    v17 = a7;
  else
    v17 = a5;
  v18 = (float)v17;
  if (a4 <= a6)
    v19 = a6;
  else
    v19 = a4;
  v20 = (float)v19;
  if (a4 >= a6)
    v21 = a6;
  else
    v21 = a4;
  -[OITSUBezierPath appendBezierPathWithRect:](v13, "appendBezierPathWithRect:", (float)v21, v18, (float)(v20 - (float)v21), (float)(v16 - v18));
  -[MFPhoneDeviceDriver drawBezierPath:dc:fill:stroke:](self, "drawBezierPath:dc:fill:stroke:", v14, v12, 1, 0);

  return 0;
}

- (int)roundRect:(id)a3 left:(int)a4 top:(int)a5 right:(int)a6 bottom:(int)a7 rx:(double)a8 ry:(double)a9
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v16;
  int v17;
  float v18;
  int v19;
  int v20;
  float v21;
  int v22;
  float v23;
  float v24;
  int v25;
  double v26;
  double v27;
  OITSUBezierPath *v28;
  double v29;
  double v30;
  double v32;
  double v33;

  v11 = *(_QWORD *)&a7;
  v12 = *(_QWORD *)&a6;
  v13 = *(_QWORD *)&a5;
  v14 = *(_QWORD *)&a4;
  v16 = a3;
  if ((int)v14 >= (int)v12)
    v17 = v12;
  else
    v17 = v14;
  v18 = (float)v17;
  if ((int)v14 <= (int)v12)
    v19 = v12;
  else
    v19 = v14;
  if ((int)v13 >= (int)v11)
    v20 = v11;
  else
    v20 = v13;
  v21 = (float)v19 - v18;
  if ((int)v13 <= (int)v11)
    v22 = v11;
  else
    v22 = v13;
  if (v21 * 0.001 <= a8 && (v23 = (float)v20, v24 = (float)v22 - (float)v20, v24 * 0.001 <= a9))
  {
    if ((float)(v21 * 0.5) >= a8)
      v26 = a8;
    else
      v26 = (float)(v21 * 0.5);
    if ((float)(v24 * 0.5) >= a9)
      v27 = a9;
    else
      v27 = (float)(v24 * 0.5);
    v28 = objc_alloc_init(OITSUBezierPath);
    v33 = v27;
    v29 = v27 + v27;
    v32 = v18;
    -[OITSUBezierPath appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:](v28, "appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:", 0, 1);
    v30 = (float)(v21 + v18) + v26 * -2.0;
    -[OITSUBezierPath appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:](v28, "appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:", 0, 0, v30, v23, v26 + v26, v29, 270.0, 90.0);
    -[OITSUBezierPath appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:](v28, "appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:", 0, 0, v30, (float)(v24 + v23) + v33 * -2.0, v26 + v26, v29, 0.0, 90.0);
    -[OITSUBezierPath appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:](v28, "appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:", 0, 0, v32, (float)(v24 + v23) + v33 * -2.0, v26 + v26, v29, 90.0, 90.0);
    -[OITSUBezierPath closePath](v28, "closePath");
    -[MFPhoneDeviceDriver drawBezierPath:dc:fill:stroke:](self, "drawBezierPath:dc:fill:stroke:", v28, v16, 1, 1);

    v25 = 0;
  }
  else
  {
    v25 = -[MFPhoneDeviceDriver rectangle:x1:y1:x2:y2:](self, "rectangle:x1:y1:x2:y2:", v16, v14, v13, v12, v11);
  }

  return v25;
}

- (int)ellipse:(id)a3 x1:(int)a4 y1:(int)a5 x2:(int)a6 y2:(int)a7
{
  id v12;
  OITSUBezierPath *v13;
  OITSUBezierPath *v14;
  int v15;
  double v16;
  int v17;
  double v18;
  double v19;
  int v20;
  double v21;
  int v22;

  v12 = a3;
  v13 = objc_alloc_init(OITSUBezierPath);
  v14 = v13;
  if (a5 <= a7)
    v15 = a7;
  else
    v15 = a5;
  v16 = (double)v15;
  if (a5 >= a7)
    v17 = a7;
  else
    v17 = a5;
  v18 = (double)v17;
  v19 = v16 - (double)v17;
  if (a4 <= a6)
    v20 = a6;
  else
    v20 = a4;
  v21 = (double)v20;
  if (a4 >= a6)
    v22 = a6;
  else
    v22 = a4;
  -[OITSUBezierPath appendBezierPathWithOvalInRect:](v13, "appendBezierPathWithOvalInRect:", (double)v22, v18, v21 - (double)v22, v19);
  -[MFPhoneDeviceDriver drawBezierPath:dc:fill:stroke:](self, "drawBezierPath:dc:fill:stroke:", v14, v12, 1, 1);

  return 0;
}

- (int)bezierTo:(id)a3 x:(int)a4 y:(int)a5 x2:(int)a6 y2:(int)a7 x3:(int)a8 y3:(int)a9
{
  id v15;
  OITSUBezierPath *v16;

  v15 = a3;
  v16 = objc_alloc_init(OITSUBezierPath);
  objc_msgSend(v15, "getPenPosition");
  -[OITSUBezierPath moveToPoint:](v16, "moveToPoint:");
  -[OITSUBezierPath curveToPoint:controlPoint1:controlPoint2:](v16, "curveToPoint:controlPoint1:controlPoint2:", (double)a8, (double)a9, (double)a4, (double)a5, (double)a6, (double)a7);
  -[MFPhoneDeviceDriver drawBezierPath:dc:fill:stroke:](self, "drawBezierPath:dc:fill:stroke:", v16, v15, 0, 1);
  objc_msgSend(v15, "setPenPosition:", (double)a8, (double)a9);

  return 0;
}

- (int)bezier:(id)a3 x:(int)a4 y:(int)a5 x2:(int)a6 y2:(int)a7 x3:(int)a8 y3:(int)a9 x4:(int)a10 y4:(int)a11
{
  id v17;
  OITSUBezierPath *v18;

  v17 = a3;
  v18 = objc_alloc_init(OITSUBezierPath);
  -[OITSUBezierPath moveToPoint:](v18, "moveToPoint:", (double)a4, (double)a5);
  -[OITSUBezierPath curveToPoint:controlPoint1:controlPoint2:](v18, "curveToPoint:controlPoint1:controlPoint2:", (double)a10, (double)a11, (double)a6, (double)a7, (double)a8, (double)a9);
  -[MFPhoneDeviceDriver drawBezierPath:dc:fill:stroke:](self, "drawBezierPath:dc:fill:stroke:", v18, v17, 0, 1);

  return 0;
}

- (void)applyTransformsToCurrentContext
{
  CGContext *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGAffineTransform v9;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform transform;

  v3 = TCCurrentGraphicsContext();
  CGContextGetCTM(&v14, v3);
  CGAffineTransformInvert(&transform, &v14);
  CGContextConcatCTM(v3, &transform);
  v4 = *(_OWORD *)&self->m_canvasTransform.c;
  *(_OWORD *)&v13.a = *(_OWORD *)&self->m_canvasTransform.a;
  *(_OWORD *)&v13.c = v4;
  *(_OWORD *)&v13.tx = *(_OWORD *)&self->m_canvasTransform.tx;
  CGContextConcatCTM(v3, &v13);
  v5 = *(_OWORD *)&self->m_worldToDeviceTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->m_worldToDeviceTransform.a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->m_worldToDeviceTransform.tx;
  v6 = *(_OWORD *)&self->m_viewBoxTransform.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&self->m_viewBoxTransform.a;
  *(_OWORD *)&t2.c = v6;
  *(_OWORD *)&t2.tx = *(_OWORD *)&self->m_viewBoxTransform.tx;
  CGAffineTransformConcat(&v12, &t1, &t2);
  v7 = *(_OWORD *)&v12.c;
  *(_OWORD *)&self->m_combinedTransform.a = *(_OWORD *)&v12.a;
  *(_OWORD *)&self->m_combinedTransform.c = v7;
  *(_OWORD *)&self->m_combinedTransform.tx = *(_OWORD *)&v12.tx;
  v8 = *(_OWORD *)&self->m_combinedTransform.c;
  *(_OWORD *)&v9.a = *(_OWORD *)&self->m_combinedTransform.a;
  *(_OWORD *)&v9.c = v8;
  *(_OWORD *)&v9.tx = *(_OWORD *)&self->m_combinedTransform.tx;
  CGContextConcatCTM(v3, &v9);
}

- (int)setViewBox:(double)a3 top:(double)a4 width:(double)a5 height:(double)a6
{
  __int128 v7;
  double width;
  double height;
  double v10;
  double v11;
  double x;
  double y;
  CGFloat v14;
  CGFloat v15;
  CGContext *v16;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGRect v20;

  self->m_viewBox.origin.x = a3;
  self->m_viewBox.origin.y = a4;
  self->m_viewBox.size.width = a5;
  self->m_viewBox.size.height = a6;
  -[MFPhoneDeviceDriver updateViewBoxTransform](self, "updateViewBoxTransform");
  v7 = *(_OWORD *)&self->m_worldToDeviceTransform.c;
  *(_OWORD *)&v18.a = *(_OWORD *)&self->m_worldToDeviceTransform.a;
  *(_OWORD *)&v18.c = v7;
  *(_OWORD *)&v18.tx = *(_OWORD *)&self->m_worldToDeviceTransform.tx;
  memset(&v19, 0, sizeof(v19));
  CGAffineTransformInvert(&v19, &v18);
  width = self->m_viewBox.size.width;
  height = self->m_viewBox.size.height;
  v10 = v19.c * height + v19.a * width;
  if (v10 > 0.0)
  {
    v11 = v19.d * height + v19.b * width;
    if (v11 > 0.0)
    {
      x = self->m_viewBox.origin.x;
      y = self->m_viewBox.origin.y;
      v14 = v19.ty + v19.d * y + v19.b * x;
      v15 = v19.tx + v19.c * y + v19.a * x;
      v16 = TCCurrentGraphicsContext();
      v20.origin.x = v15;
      v20.origin.y = v14;
      v20.size.width = v10;
      v20.size.height = v11;
      CGContextClipToRect(v16, v20);
    }
  }
  return 0;
}

- (int)patBlt:(id)a3 in_x:(int)a4 in_y:(int)a5 in_width:(int)a6 in_height:(int)a7 in_rop:(unsigned int)a8
{
  id v14;
  void *v15;
  char v16;
  char v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  OITSUBezierPath *v21;

  v14 = a3;
  objc_msgSend(v14, "getPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isOpen");

  if (a8 == 11141161)
    v17 = 1;
  else
    v17 = v16;
  if ((v17 & 1) == 0)
  {
    v18 = objc_msgSend(v14, "getRop2");
    if (a8 == 16711778)
      v19 = 16;
    else
      v19 = 13;
    if (a8 == 66)
      v20 = 1;
    else
      v20 = v19;
    objc_msgSend(v14, "setRop2:", v20);
    v21 = objc_alloc_init(OITSUBezierPath);
    -[OITSUBezierPath appendBezierPathWithRect:](v21, "appendBezierPathWithRect:", (double)a4, (double)a5, (double)a6, (double)a7);
    -[MFPhoneDeviceDriver drawBezierPath:dc:fill:stroke:](self, "drawBezierPath:dc:fill:stroke:", v21, v14, 1, 0);
    objc_msgSend(v14, "setRop2:", v18);

  }
  return 0;
}

- (int)bitBlt:(id)a3 in_xDest:(int)a4 in_yDest:(int)a5 in_widthDest:(int)a6 in_heightDest:(int)a7 in_sourceImage:(id)a8 in_xSrc:(int)a9 in_ySrc:(int)a10 in_rop:(unsigned int)a11 in_xform:(CGAffineTransform *)a12 in_colour:(unsigned int)a13
{
  uint64_t v14;
  uint64_t v15;

  LODWORD(v15) = a13;
  LODWORD(v14) = a11;
  return -[MFPhoneDeviceDriver stretchBlt:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:](self, "stretchBlt:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, a8, __PAIR64__(a10, a9), __PAIR64__(a7, a6), v14, a12, v15);
}

- (int)stretchBlt:(id)a3 in_xDest:(int)a4 in_yDest:(int)a5 in_widthDest:(int)a6 in_heightDest:(int)a7 in_sourceImage:(id)a8 in_xSrc:(int)a9 in_ySrc:(int)a10 in_widthSrc:(int)a11 in_heightSrc:(int)a12 in_rop:(unsigned int)a13 in_xform:(CGAffineTransform *)a14 in_colour:(unsigned int)a15
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;
  id v22;
  void *v23;
  char v24;
  char v25;
  int v26;
  double v28;
  double v29;
  double v30;
  double v31;
  double b;
  double c;
  double d;
  double v35;
  double v36;
  void *v37;

  v16 = *(_QWORD *)&a7;
  v17 = *(_QWORD *)&a6;
  v18 = *(_QWORD *)&a5;
  v19 = *(_QWORD *)&a4;
  v21 = a3;
  v22 = a8;
  objc_msgSend(v21, "getPath");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isOpen");

  if (a13 == 11141161)
    v25 = 1;
  else
    v25 = v24;
  if ((v25 & 1) == 0)
  {
    if ((objc_msgSend(v22, "isEmpty") & 1) != 0 || a13 == 16711778 || a13 == 66)
    {
      v26 = -[MFPhoneDeviceDriver patBlt:in_x:in_y:in_width:in_height:in_rop:](self, "patBlt:in_x:in_y:in_width:in_height:in_rop:", v21, v19, v18, v17, v16, a13);
      goto LABEL_10;
    }
    v28 = (double)a9;
    v29 = (double)a10;
    v30 = (double)a11;
    v31 = (double)a12;
    if (a14)
    {
      b = a14->b;
      c = a14->c;
      d = a14->d;
      v35 = d * v29 + b * v28;
      v28 = a14->tx + c * v29 + a14->a * v28;
      v29 = a14->ty + v35;
      v36 = c * v31;
      v31 = d * v31 + b * v30;
      v30 = v36 + a14->a * v30;
    }
    objc_msgSend(v22, "getImage");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "drawInRect:fromRect:isFlipped:", 1, (double)(int)v19, (double)(int)v18, (double)(int)v17, (double)(int)v16, v28, v29, v30, v31);

  }
  v26 = 0;
LABEL_10:

  return v26;
}

- (int)alphaBlend:(id)a3 in_xDest:(int)a4 in_yDest:(int)a5 in_widthDest:(int)a6 in_heightDest:(int)a7 in_sourceImage:(id)a8 in_xSrc:(int)a9 in_ySrc:(int)a10 in_widthSrc:(int)a11 in_heightSrc:(int)a12 in_sourceConstantOpacity:(unsigned __int8)a13 in_useSourceAlphaChannel:(BOOL)a14 in_xform:(CGAffineTransform *)a15 in_colour:(unsigned int)a16
{
  id v21;
  void *v22;
  char v23;
  int v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double b;
  double c;
  double d;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGImage *v39;
  CGImage *v40;
  unint64_t Width;
  unint64_t Height;
  void *v43;
  CGColorSpace *v44;
  CGContext *v45;
  CGContext *v46;
  CGImage *Image;
  int v48;
  CGImageRef v49;
  CGImage *v50;
  CGContext *v51;
  CGFloat MidY;
  CGFloat v53;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v21 = a8;
  objc_msgSend(a3, "getPath");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v22, "isOpen") & 1) != 0)
    goto LABEL_28;
  v23 = objc_msgSend(v21, "isEmpty");

  if ((v23 & 1) == 0)
  {
    v25 = (double)a9;
    v26 = (double)a10;
    v27 = (double)a11;
    v28 = (double)a12;
    if (a15)
    {
      b = a15->b;
      c = a15->c;
      d = a15->d;
      v32 = d * v26 + b * v25;
      v25 = a15->tx + c * v26 + a15->a * v25;
      v26 = a15->ty + v32;
      v33 = c * v28;
      v28 = d * v28 + b * v27;
      v27 = v33 + a15->a * v27;
    }
    objc_msgSend(v21, "getImage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v34;
    if (!v34)
    {
      v24 = -1;
LABEL_29:

      goto LABEL_30;
    }
    v35 = (double)a4;
    v36 = (double)a5;
    v37 = (double)a6;
    v38 = (double)a7;
    if (__PAIR64__(a14, a13) == 255)
      goto LABEL_27;
    v39 = (CGImage *)objc_msgSend(v34, "CGImage");
    v40 = v39;
    if (!v39)
      goto LABEL_27;
    Width = CGImageGetWidth(v39);
    Height = CGImageGetHeight(v40);
    if (a14)
    {
      v43 = (void *)objc_msgSend(v21, "pixelData");
      if (objc_msgSend(v21, "pixelDataLength") == Height * 4 * Width
        && (v44 = (CGColorSpace *)TSUDeviceRGBColorSpace(),
            v45 = CGBitmapContextCreateWithData(v43, Width, Height, 8uLL, 4 * Width, v44, 0x2002u, 0, 0),
            (v46 = v45) != 0))
      {
        Image = CGBitmapContextCreateImage(v45);
        CGContextRelease(v46);
      }
      else
      {
        Image = 0;
      }
      if ((objc_msgSend(v21, "isFlipped") & 1) == 0)
      {
        v55.origin.x = v25;
        v55.origin.y = v26;
        v55.size.width = v27;
        v55.size.height = v28;
        v48 = 0;
        v26 = v26 + (double)Height + CGRectGetMidY(v55) * -2.0;
        if (!Image)
        {
LABEL_27:
          objc_msgSend(v22, "drawInRect:fromRect:isFlipped:", 1, v35, v36, v37, v38, v25, v26, v27, v28);
LABEL_28:
          v24 = 0;
          goto LABEL_29;
        }
LABEL_20:
        v61.size.width = (double)Width;
        v61.size.height = (double)Height;
        v61.origin.x = 0.0;
        v61.origin.y = 0.0;
        v56.origin.x = v25;
        v56.origin.y = v26;
        v56.size.width = v27;
        v56.size.height = v28;
        if (CGRectEqualToRect(v56, v61))
        {
          v49 = CGImageRetain(Image);
        }
        else
        {
          v57.origin.x = v25;
          v57.origin.y = v26;
          v57.size.width = v27;
          v57.size.height = v28;
          v49 = CGImageCreateWithImageInRect(Image, v57);
        }
        v50 = v49;
        CGImageRelease(Image);
        if (v50)
        {
          v51 = TCCurrentGraphicsContext();
          CGContextSaveGState(v51);
          if (v48)
          {
            v58.origin.x = v35;
            v58.origin.y = v36;
            v58.size.width = v37;
            v58.size.height = v38;
            MidY = CGRectGetMidY(v58);
            CGContextTranslateCTM(v51, 0.0, MidY);
            CGContextScaleCTM(v51, 1.0, -1.0);
            v59.origin.x = v35;
            v59.origin.y = v36;
            v59.size.width = v37;
            v59.size.height = v38;
            v53 = CGRectGetMidY(v59);
            CGContextTranslateCTM(v51, 0.0, -v53);
          }
          CGContextSetAlpha(v51, (double)a13 / 255.0);
          CGContextSetBlendMode(v51, kCGBlendModeNormal);
          v60.origin.x = v35;
          v60.origin.y = v36;
          v60.size.width = v37;
          v60.size.height = v38;
          CGContextDrawImage(v51, v60, v50);
          CGContextRestoreGState(v51);
          CGImageRelease(v50);
          goto LABEL_28;
        }
        goto LABEL_27;
      }
    }
    else
    {
      Image = CGImageRetain(v40);
    }
    v48 = 1;
    if (!Image)
      goto LABEL_27;
    goto LABEL_20;
  }
  v24 = 0;
LABEL_30:

  return v24;
}

- (int)maskBlt:(id)a3 in_xDest:(int)a4 in_yDest:(int)a5 in_widthDest:(int)a6 in_heightDest:(int)a7 in_sourceImage:(id)a8 in_xSrc:(int)a9 in_ySrc:(int)a10 in_maskImage:(id)a11 in_xMask:(int)a12 in_yMask:(int)a13 in_rop:(unsigned int)a14 in_xform:(CGAffineTransform *)a15 in_colour:(unsigned int)a16
{
  return -[MFPhoneDeviceDriver bitBlt:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_rop:in_xform:in_colour:](self, "bitBlt:in_xDest:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_rop:in_xform:in_colour:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, a8);
}

- (int)plgBlt:(id)a3 in_destinationParallelogram:(CGPoint *)a4 in_sourceImage:(id)a5 in_xSrc:(int)a6 in_ySrc:(int)a7 in_widthSrc:(int)a8 in_heightSrc:(int)a9 in_maskImage:(id)a10 in_xMask:(int)a11 in_yMask:(int)a12 in_xform:(CGAffineTransform *)a13 in_colour:(unsigned int)a14
{
  return 0;
}

- (id)createHatchBrush:(id)a3 in_hatchstyle:(int)a4
{
  +[MFPhoneHatchBrush hatchBrushWithColour:in_style:](MFPhoneHatchBrush, "hatchBrushWithColour:in_style:", a3, *(_QWORD *)&a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)createPen:(int)a3 in_width:(int)a4 in_colour:(id)a5 in_userStyleArray:(double *)a6
{
  __int128 v6;
  _OWORD v8[3];

  v6 = *(_OWORD *)&self->m_combinedTransform.c;
  v8[0] = *(_OWORD *)&self->m_combinedTransform.a;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&self->m_combinedTransform.tx;
  +[MFPhonePen penWithStyle:width:colour:styleArray:LPToDPTransform:](MFPhonePen, "penWithStyle:width:colour:styleArray:LPToDPTransform:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, a6, v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)createFont:(int)a3 lfWidth:(int)a4 lfEscapement:(int)a5 lfOrientation:(int)a6 lfWeight:(int)a7 lfItalic:(BOOL)a8 lfUnderline:(BOOL)a9 lfStrikeOut:(BOOL)a10 lfCharSet:(int)a11 lfOutPrecision:(int)a12 lfClipPrecision:(unsigned __int8)a13 lfQuality:(int)a14 pitch:(int)a15 family:(int)a16 lfFaceName:(id)a17
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  LODWORD(v20) = a16;
  BYTE4(v19) = a13;
  HIDWORD(v18) = a11;
  LODWORD(v19) = a12;
  LOWORD(v18) = __PAIR16__(a10, a9);
  +[MFFont fontWithFeatures:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:](MFPhoneFont, "fontWithFeatures:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, a8, v18, v19, *(_QWORD *)&a14, v20, a17);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)createFontIndirectW:(int)a3 lfWidth:(int)a4 lfEscapement:(int)a5 lfOrientation:(int)a6 lfWeight:(int)a7 lfItalic:(BOOL)a8 lfUnderline:(BOOL)a9 lfStrikeOut:(BOOL)a10 lfCharSet:(int)a11 lfOutPrecision:(int)a12 lfClipPrecision:(unsigned __int8)a13 lfQuality:(int)a14 pitch:(int)a15 family:(int)a16 lfFaceName:(id)a17 elfFullName:(id)a18 elfStyle:(id)a19 elfVersion:(unsigned int)a20 elfStyleSize:(unsigned int)a21 elfMatch:(unsigned int)a22 elfVendorId:(unsigned int)a23 elfCulture:(unsigned int)a24
{
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  LODWORD(v28) = a24;
  LODWORD(v27) = a16;
  BYTE4(v26) = a13;
  HIDWORD(v25) = a11;
  LODWORD(v26) = a12;
  LOWORD(v25) = __PAIR16__(a10, a9);
  +[MFFont fontWithExtendedFeatures:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:elfFullName:elfStyle:elfVersion:elfStyleSize:elfMatch:elfVendorId:elfCulture:](MFPhoneFont, "fontWithExtendedFeatures:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:elfFullName:elfStyle:elfVersion:elfStyleSize:elfMatch:elfVendorId:elfCulture:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, a8, v25, v26, *(_QWORD *)&a14, v27, a17, a18, a19, *(_QWORD *)&a20, *(_QWORD *)&a22,
    v28);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)createRegionWithRects:(id)a3 in_dc:(id)a4
{
  id v6;
  id v7;
  MFPhoneRegion *v8;

  v6 = a3;
  v7 = a4;
  v8 = -[MFPhoneRegion initWithRects:in_bounds:in_dc:]([MFPhoneRegion alloc], "initWithRects:in_bounds:in_dc:", v6, v7, self->m_viewBox.origin.x, self->m_viewBox.origin.y, self->m_viewBox.size.width, self->m_viewBox.size.height);

  return v8;
}

- (id)createDIBitmap:(id)a3 in_dib:(const char *)a4 in_dibSize:(unsigned int)a5 in_usage:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  id v9;
  MFPhoneBitmap *v10;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v9 = a3;
  v10 = -[MFBitmap initWithDIBitmap:in_dib:in_dibSize:in_usage:]([MFPhoneBitmap alloc], "initWithDIBitmap:in_dib:in_dibSize:in_usage:", v9, a4, v7, v6);

  return v10;
}

- (id)createDIBitmap:(id)a3 in_header:(const char *)a4 in_headerSize:(unsigned int)a5 in_bitmap:(const char *)a6 in_bitmapSize:(unsigned int)a7 in_usage:(int)a8
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  id v13;
  MFPhoneBitmap *v14;

  v8 = *(_QWORD *)&a8;
  v9 = *(_QWORD *)&a7;
  v11 = *(_QWORD *)&a5;
  v13 = a3;
  v14 = -[MFBitmap initWithDIBitmap:in_header:in_headerSize:in_bitmap:in_bitmapSize:in_usage:]([MFPhoneBitmap alloc], "initWithDIBitmap:in_header:in_headerSize:in_bitmap:in_bitmapSize:in_usage:", v13, a4, v11, a6, v9, v8);

  return v14;
}

- (id)createBitmap:(id)a3 in_width:(int)a4 in_height:(int)a5 in_planes:(int)a6 in_bitsPerPixel:(int)a7 in_bitmap:(const char *)a8 in_bitmapSize:(unsigned int)a9
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  MFPhoneBitmap *v15;
  uint64_t v17;

  v10 = *(_QWORD *)&a7;
  v11 = *(_QWORD *)&a6;
  v12 = *(_QWORD *)&a5;
  v13 = *(_QWORD *)&a4;
  v14 = a3;
  LODWORD(v17) = a9;
  v15 = -[MFBitmap initWithBitmap:in_width:in_height:in_planes:in_bitsPerPixel:in_bitmap:in_bitmapSize:]([MFPhoneBitmap alloc], "initWithBitmap:in_width:in_height:in_planes:in_bitsPerPixel:in_bitmap:in_bitmapSize:", v14, v13, v12, v11, v10, a8, v17);

  return v15;
}

@end
