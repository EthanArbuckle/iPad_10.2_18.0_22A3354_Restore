@implementation NSLineFragmentRenderingContext

- (void)setApplicationFrameworkContext:(int64_t)a3
{
  if (!a3)
    LOBYTE(a3) = _NSTextScalingTypeForCurrentEnvironment();
  self->_flags = ($02312DB0ACF3CF5CFCBD8D4CC11D7559)(*(_DWORD *)&self->_flags & 0xFFFFFF8F | (16 * (a3 & 7)));
}

- (void)release
{
  uint64_t v3;
  CFTypeRef *runs;
  int64_t numRuns;
  char *v6;
  CFTypeRef *v7;
  CFTypeRef v8;
  objc_super v9;

  os_unfair_lock_lock_with_options();
  if (-[NSLineFragmentRenderingContext retainCount](self, "retainCount") == 1
    && (self->_textStorage,
        self->_textStorage = 0,
        v3 = __NSRenderingContextCacheNextIndex,
        __NSRenderingContextCacheNextIndex <= 2))
  {
    ++__NSRenderingContextCacheNextIndex;
    __NSRenderingContextCache[v3] = self;
    runs = (CFTypeRef *)self->_runs;
    numRuns = self->_numRuns;
    self->_runs = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSRenderingContextLock);
    if (runs)
    {
      if (numRuns >= 1)
      {
        v6 = (char *)&runs[16 * numRuns];
        v7 = runs;
        do
        {
          if (((_BYTE)v7[15] & 1) == 0)
            CFRelease(v7[6]);
          v8 = *v7;
          v7 += 16;
          CFRelease(v8);
        }
        while (v7 < (CFTypeRef *)v6);
      }
      NSZoneFree(0, runs);
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSRenderingContextLock);
    v9.receiver = self;
    v9.super_class = (Class)NSLineFragmentRenderingContext;
    -[NSLineFragmentRenderingContext release](&v9, sel_release);
  }
}

- (double)lineFragmentWidth
{
  return self->_lineWidth;
}

- (NSLineFragmentRenderingContext)initWithTextStorage:(id)a3 runs:(__CFArray *)a4 glyphOrigin:(double)a5 lineFragmentWidth:(double)a6 elasticWidth:(double)a7 usesScreenFonts:(BOOL)a8 isRTL:(BOOL)a9 applicationFrameworkContext:(int64_t)a10
{
  _BOOL4 v11;
  __CFArray *v15;
  CFIndex Count;
  uint64_t v19;
  uint64_t v20;
  CGSize v21;
  CFIndex v22;
  uint64_t v23;
  const __CTRun *ValueAtIndex;
  void *runs;
  char *v26;
  CGSize *v27;
  unint64_t v28;
  CFIndex v29;
  CFIndex v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  const __CTRun *v35;
  CFRange StringRange;
  uint64_t GlyphStorage;
  _QWORD *v38;
  _QWORD *v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v44;
  CFIndex v45;
  uint64_t v46;
  void *v47;
  char *v48;
  uint64_t v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  __int128 v55;
  uint64_t v56;
  void *v57;
  long double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  CGGlyph *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  CGGlyph *v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  double *v71;
  double v72;
  _DWORD *v73;
  double v74;
  char v75;
  uint64_t v76;
  CGGlyph *v77;
  CGGlyph *v78;
  _DWORD *v79;
  double *v80;
  int v81;
  double v83;
  CGFloat v84;
  double v85;
  CGGlyph *v86;
  double *v87;
  CGGlyph *v88;
  double v89;
  double *p_leftControlWidth;
  uint64_t v91;
  _DWORD *v92;
  char *v93;
  double *v94;
  uint64_t v95;
  uint64_t v96;
  double *v97;
  CGFloat v98;
  CGGlyph *v99;
  CGGlyph *v100;
  char *v101;
  double v102;
  double v103;
  uint64_t v104;
  double *v105;
  CGFloat v106;
  uint64_t v107;
  const void *v108;
  _BYTE *v109;
  $02312DB0ACF3CF5CFCBD8D4CC11D7559 flags;
  unint64_t v112;
  double *p_rightControlWidth;
  CGGlyph *v114;
  uint64_t v115;
  char *v116;
  __CFArray *v117;
  uint64_t v118;
  UniChar characters;
  uint64_t v120;
  uint64_t v121;
  CFRange v122;
  NSRect v123;

  v11 = a9;
  v15 = a4;
  Count = CFArrayGetCount(a4);
  if (!Count)
  {

    return 0;
  }
  v19 = Count;
  self->_rightControlWidth = 0.0;
  self->_appContext = a10;
  self->_leftControlWidth = 0.0;
  v20 = MEMORY[0x1E0CB3438];
  self->_leftSideDelta = a5;
  self->_lineWidth = a6;
  v21 = *(CGSize *)(v20 + 16);
  self->_imageBounds.origin = *(CGPoint *)v20;
  self->_imageBounds.size = v21;
  self->_elasticWidth = a7;
  self->_textStorage = (__NSImmutableTextStorage *)a3;
  self->_flags = ($02312DB0ACF3CF5CFCBD8D4CC11D7559)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | v11);
  p_rightControlWidth = &self->_rightControlWidth;
  self->_flags = ($02312DB0ACF3CF5CFCBD8D4CC11D7559)(*(_DWORD *)&self->_flags & 0xFFFFFF8F | (16
                                                                                            * (_NSTextScalingTypeForCurrentEnvironment() & 7)));
  if (v19 < 1)
  {
    v23 = 0;
  }
  else
  {
    v22 = 0;
    v23 = 0;
    do
    {
      ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(v15, v22);
      v23 += CTRunGetGlyphCount(ValueAtIndex);
      ++v22;
    }
    while (v19 != v22);
  }
  runs = (void *)NSAllocateScannedUncollectable();
  self->_runs = runs;
  if (!runs)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@: Failed to allocate space for %ld runs and %ld glyphs"), objc_opt_class(), v19, v23);
    runs = self->_runs;
  }
  bzero(runs, 18 * v23 + (v19 << 7));
  v26 = (char *)self->_runs;
  v27 = (CGSize *)&v26[128 * v19];
  self->_glyphs = (unsigned __int16 *)&v27[v23];
  self->_advancements = v27;
  v114 = (CGGlyph *)&v27[v23];
  if (v19 < 1)
  {
    v109 = v26;
    goto LABEL_118;
  }
  v116 = v26;
  v28 = 0;
  v29 = 0;
  v30 = 0;
  v120 = 0;
  v121 = 0;
  v31 = *(double *)v20;
  v32 = *(double *)(v20 + 8);
  v33 = *(double *)(v20 + 16);
  v34 = *(double *)(v20 + 24);
  v117 = v15;
  v118 = v19;
  do
  {
    v35 = (const __CTRun *)CFArrayGetValueAtIndex(v15, v29);
    StringRange = CTRunGetStringRange(v35);
    GlyphStorage = CTRunGetGlyphStorage();
    v38 = (_QWORD *)MEMORY[0x18D790F38](GlyphStorage);
    v39 = v38;
    v40 = v38[11];
    v41 = v40 + 104 * v38[12];
    if (v40 > v28 || v28 >= v41 || v30 > StringRange.location)
    {
      v44 = v38[19];
      if (v44)
        v30 = v38[16] - *(_QWORD *)(v44 + 128);
      else
        v30 = 0;
      v28 = v38[11];
    }
    if (v28 && v28 < v41)
    {
      while (1)
      {
        v45 = *(_QWORD *)(v28 + 16) + v30;
        if (StringRange.location < v45)
          break;
        v28 += 104;
        v30 = v45;
        if (v28 >= v41)
          goto LABEL_29;
      }
      v47 = *(void **)v28;
      v48 = v116;
      *(_QWORD *)v116 = CFRetain(*(CFTypeRef *)v28);
      *((_OWORD *)v116 + 1) = *(_OWORD *)(v28 + 32);
      *((_QWORD *)v116 + 4) = *(_QWORD *)(v28 + 56);
      v122.location = 0;
      v122.length = 0;
      *((double *)v116 + 5) = CTRunGetTypographicBounds(v35, v122, 0, 0, 0);
      v123.origin.x = v31;
      v123.origin.y = v32;
      v123.size.width = v33;
      v123.size.height = v34;
      if (!NSEqualRects(*(NSRect *)(v28 + 64), v123))
      {
        *((_DWORD *)v116 + 30) |= 1u;
        v55 = *(_OWORD *)(v28 + 64);
        *(_OWORD *)(v116 + 72) = *(_OWORD *)(v28 + 80);
        *(_OWORD *)(v116 + 56) = v55;
        *((double *)v116 + 8) = *(double *)(*(_QWORD *)((char *)v39 + (int)*MEMORY[0x1E0CA8100]) + 16 * v120 + 8)
                              + *((double *)v116 + 8);
        *((_QWORD *)v116 + 6) = objc_msgSend(v47, "objectForKey:", CFSTR("NSAttachment"));
        *((_QWORD *)v116 + 12) = objc_msgSend(v47, "objectForKey:", CFSTR("NSColor"));
        if (objc_msgSend(*((id *)v116 + 6), "attachmentCell") && (objc_opt_respondsToSelector() & 1) == 0)
          v56 = -1;
        else
          v56 = *(_QWORD *)(v28 + 24);
        v15 = v117;
        v46 = v118;
        v63 = v114;
        *((_QWORD *)v116 + 11) = v56;
        v121 = 0;
        *p_rightControlWidth = 0.0;
        goto LABEL_67;
      }
      *((_QWORD *)v116 + 6) = CFRetain(*(CFTypeRef *)(v28 + 8));
      *((_QWORD *)v116 + 7) = objc_msgSend(v47, "objectForKey:", CFSTR("NSColor"));
      *((_QWORD *)v116 + 8) = objc_msgSend(v47, "objectForKey:", CFSTR("NSStrokeColor"));
      *((_QWORD *)v116 + 9) = objc_msgSend(v47, "objectForKey:", CFSTR("NSShadow"));
      v49 = objc_msgSend(v47, "objectForKey:", CFSTR("NSStrokeWidth"));
      if (v49)
      {
        v50 = (void *)v49;
        objc_msgSend(*(id *)(v28 + 8), "pointSize");
        v52 = v51 * 0.01;
        objc_msgSend(v50, "doubleValue");
        v54 = v52 * v53;
      }
      else
      {
        v54 = 0.0;
      }
      v46 = v118;
      v48 = v116;
      *((double *)v116 + 10) = v54;
      v57 = (void *)objc_msgSend(v47, "objectForKey:", CFSTR("NSExpansion"));
      if (v57)
      {
        objc_msgSend(v57, "doubleValue");
        v59 = exp(v58);
      }
      else
      {
        v59 = 1.0;
      }
      *((double *)v116 + 11) = v59;
      v60 = (void *)objc_msgSend(v47, "objectForKey:", CFSTR("NSObliqueness"));
      if (v60)
      {
        objc_msgSend(v60, "doubleValue");
        v62 = -v61;
      }
      else
      {
        v62 = 0.0;
      }
      v63 = v114;
      *((double *)v116 + 12) = v62;
      CTRunGetInitialAdvance();
      *((_QWORD *)v116 + 13) = v64;
      *((_QWORD *)v116 + 14) = v65;
      if ((*(_BYTE *)(v28 + 96) & 4) != 0)
      {
        v76 = v121;
        if (v121 >= 1)
        {
          v77 = (CGGlyph *)(*(_QWORD *)((char *)v39 + (int)*MEMORY[0x1E0CA8110]) + 2 * v120);
          v78 = &v77[v121];
          v79 = (_DWORD *)(*(_QWORD *)((char *)v39 + (int)*MEMORY[0x1E0CA8118]) + 4 * v120);
          v80 = (double *)(*(_QWORD *)((char *)v39 + (int)*MEMORY[0x1E0CA8100]) + 16 * v120 + 8);
          v15 = v117;
          do
          {
            v81 = (*v79 >> 5) & 1;
            if (!*v77)
              v81 = 1;
            if (v81 == 1 && (*v79 & 0x10000) == 0)
            {
              v121 = --v76;
            }
            else
            {
              *v63++ = *v77;
              v83 = *v80;
              if (*v80 != 0.0)
              {
                *(_DWORD *)&self->_flags |= 2u;
                v83 = *v80;
              }
              v27->width = *(v80 - 1);
              v27->height = -v83;
              ++v27;
            }
            ++v77;
            ++v79;
            v80 += 2;
          }
          while (v77 < v78);
          goto LABEL_67;
        }
        goto LABEL_112;
      }
      v66 = v120;
      v67 = (CGGlyph *)(*(_QWORD *)((char *)v39 + (int)*MEMORY[0x1E0CA8110]) + 2 * v120);
      if ((v39[28] & 8) != 0)
      {
        *p_rightControlWidth = 0.0;
        if (v121 == 1)
        {
          if (!*v67)
          {
            characters = 8230;
            v48 = v116;
            CTFontGetGlyphsForCharacters(*((CTFontRef *)v116 + 6), &characters, v114, 1);
            objc_msgSend(*((id *)v116 + 6), "advancementForGlyph:", *v114);
            v15 = v117;
            if (v85 != 0.0)
              *(_DWORD *)&self->_flags |= 2u;
            v27->width = v84;
            v27->height = -v85;
            ++v27;
            v63 = v114 + 1;
            goto LABEL_67;
          }
LABEL_76:
          v86 = &v67[v121];
          v87 = (double *)(*(_QWORD *)((char *)v39 + (int)*MEMORY[0x1E0CA8100]) + 16 * v66 + 8);
          v88 = v114;
          v15 = v117;
          do
          {
            if (*v67)
            {
              *v88++ = *v67;
              v89 = *v87;
              if (*v87 != 0.0)
              {
                *(_DWORD *)&self->_flags |= 2u;
                v89 = *v87;
              }
              v27->width = *(v87 - 1);
              v27->height = -v89;
              ++v27;
            }
            ++v67;
            v87 += 2;
          }
          while (v67 < v86);
        }
        else
        {
          if (v121 >= 1)
            goto LABEL_76;
          v88 = v114;
          v15 = v117;
        }
        v121 = v88 - v114;
        v63 = v88;
        v48 = v116;
LABEL_67:
        *((_QWORD *)v48 + 1) = v121;
        v114 = v63;
        v116 = v48 + 128;
        goto LABEL_68;
      }
      v68 = v121;
      if (v121 >= 1)
      {
        v69 = *(_QWORD *)((char *)v39 + (int)*MEMORY[0x1E0CA8118]) + 4 * v120;
        v70 = v69 + 4 * v121;
        v71 = (double *)(*(_QWORD *)((char *)v39 + (int)*MEMORY[0x1E0CA8100]) + 16 * v120);
        v72 = 0.0;
        v73 = (_DWORD *)v69;
        while ((*v73 & 0x10020) != 0 || !*v67)
        {
          v74 = *v71;
          v71 += 2;
          v72 = v72 + v74;
          ++v73;
          ++v67;
          if ((unint64_t)v73 >= v70)
          {
            v75 = 0;
            goto LABEL_86;
          }
        }
        v75 = 1;
LABEL_86:
        if (v72 != 0.0)
        {
          p_leftControlWidth = &self->_leftControlWidth;
          if (self->_runs != v116)
          {
            *((double *)v116 - 11) = v72 + *((double *)v116 - 11);
            p_leftControlWidth = &self->_rightControlWidth;
          }
          *p_leftControlWidth = v72 + *p_leftControlWidth;
          *((double *)v116 + 5) = *((double *)v116 + 5) - v72;
        }
        if ((v75 & 1) != 0)
        {
          v91 = v68 - (((uint64_t)v73 - v69) >> 2);
          v121 = v91;
          if ((unint64_t)v73 >= v70)
          {
            v48 = v116;
            v15 = v117;
          }
          else
          {
            v92 = v73;
            v93 = (char *)v67;
            v94 = &self->_rightControlWidth;
            v112 = v70;
            do
            {
              if ((*v92 & 0x10020) != 0 || !*v67)
              {
                v95 = (char *)v92 - (char *)v73;
                v96 = v95 >> 2;
                if (v95 <= 0)
                {
                  v102 = *v94;
                }
                else
                {
                  v115 = v95 >> 2;
                  v97 = &v71[2 * v96];
                  do
                  {
                    v98 = -v71[1];
                    v27->width = *v71;
                    v27->height = v98;
                    if (v71[1] != 0.0)
                      *(_DWORD *)&self->_flags |= 2u;
                    ++v27;
                    v71 += 2;
                  }
                  while (v71 < v97);
                  v99 = v63;
                  v100 = v63;
                  v101 = v93;
                  memcpy(v100, v93, v95 >> 1);
                  v93 = v101;
                  v94 = &self->_rightControlWidth;
                  v96 = v115;
                  v63 = &v99[v115];
                  *p_rightControlWidth = 0.0;
                  v102 = 0.0;
                  v91 = v121;
                  v70 = v112;
                }
                v93 += 2 * v96 + 2;
                *v94 = *v71 + v102;
                v103 = *v71;
                v71 += 2;
                v27[-1].width = v103 + v27[-1].width;
                v73 = v92 + 1;
                v121 = --v91;
                v46 = v118;
              }
              ++v92;
              ++v67;
            }
            while ((unint64_t)v92 < v70);
            v48 = v116;
            if (v73 < v92)
            {
              v104 = (char *)v92 - (char *)v73;
              if (v104 >= 1)
              {
                v105 = (double *)((char *)v71 + 4 * v104);
                do
                {
                  v106 = -v71[1];
                  v27->width = *v71;
                  v27->height = v106;
                  if (v71[1] != 0.0)
                    *(_DWORD *)&self->_flags |= 2u;
                  ++v27;
                  v71 += 2;
                }
                while (v71 < v105);
              }
              v15 = v117;
              v107 = v104 >> 2;
              memcpy(v63, v93, v104 >> 1);
              v63 += v107;
              *p_rightControlWidth = 0.0;
              v46 = v118;
              goto LABEL_67;
            }
LABEL_112:
            v15 = v117;
          }
          goto LABEL_67;
        }
      }
      CFRelease(*(CFTypeRef *)v116);
      *(_QWORD *)v116 = 0;
      v108 = (const void *)*((_QWORD *)v116 + 6);
      if (v108)
      {
        CFRelease(v108);
        *((_QWORD *)v116 + 6) = 0;
      }
      v15 = v117;
    }
    else
    {
      v45 = v30;
LABEL_29:
      NSLog((NSString *)CFSTR("NSATSGlyphStorage inconsistency. Cannot find run storage for character range {%ld %ld} for CTRun %p. Ignoring the run..."), StringRange.location, StringRange.length, v35);
      v28 = 0;
      v30 = v45;
      v15 = v117;
      v46 = v118;
    }
LABEL_68:
    ++v29;
  }
  while (v29 != v46);
  v109 = self->_runs;
  v26 = v116;
LABEL_118:
  self->_numRuns = (v26 - v109) >> 7;
  self->_leftSideDelta = self->_leftControlWidth + self->_leftSideDelta;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
    self->_flags = ($02312DB0ACF3CF5CFCBD8D4CC11D7559)(*(_DWORD *)&flags | 4);
  return self;
}

+ (void)initialize
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
    __NSImageBoundsOriginZero = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("__NSStringDrawingTigerImageBounds"));
}

- (void)setResolvedTextAlignment:(int64_t)a3
{
  self->_resolvedAlignment = a3;
}

- (void)setResolvedBaseWritingDirection:(int64_t)a3
{
  self->_resolvedDirection = a3;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  int v5;
  void *v6;
  objc_super v8;

  os_unfair_lock_lock_with_options();
  v5 = __NSRenderingContextCacheNextIndex;
  if (!__NSRenderingContextCacheNextIndex)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSRenderingContextLock);
LABEL_5:
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___NSLineFragmentRenderingContext;
    return objc_msgSendSuper2(&v8, sel_allocWithZone_, a3);
  }
  --__NSRenderingContextCacheNextIndex;
  v6 = (void *)__NSRenderingContextCache[v5 - 1];
  os_unfair_lock_unlock((os_unfair_lock_t)&__NSRenderingContextLock);
  if (!v6)
    goto LABEL_5;
  return v6;
}

- (CGRect)imageBounds
{
  int64_t numRuns;
  double v4;
  char *runs;
  uint64_t v6;
  unsigned __int16 *glyphs;
  CGSize *advancements;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  int v16;
  _QWORD *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  BOOL v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double x;
  double v42;
  double leftControlWidth;
  double rightControlWidth;
  double v45;
  double v46;
  char *v47;
  double v48;
  char *v49;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  CGFloat v57;
  double v58;
  double v59;
  CGAffineTransform v60;
  char v61[16];
  _QWORD v62[80];
  CGRect v63;
  CGRect v64;
  NSRect v65;
  NSRect v66;
  CGRect result;
  NSRect v68;
  NSRect v69;
  NSRect v70;

  v62[78] = *MEMORY[0x1E0C80C00];
  v68 = *(NSRect *)*(_QWORD *)&MEMORY[0x1E0CB3438];
  y = v68.origin.y;
  v53 = *MEMORY[0x1E0CB3438];
  height = v68.size.height;
  width = v68.size.width;
  if (NSEqualRects(self->_imageBounds, *MEMORY[0x1E0CB3438]))
  {
    numRuns = self->_numRuns;
    v4 = -1.0;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      v4 = 1.0;
    v55 = v4;
    if (numRuns < 1)
    {
      v9 = y;
      v58 = width;
      v59 = height;
      v10 = v53;
    }
    else
    {
      runs = (char *)self->_runs;
      v47 = &runs[128 * numRuns];
      v6 = MEMORY[0x1E0C9BAA8];
      v54 = *(double *)(MEMORY[0x1E0C9BAA8] + 8);
      glyphs = self->_glyphs;
      advancements = self->_advancements;
      v9 = y;
      v10 = v53;
      v58 = width;
      v59 = height;
      v11 = 0.0;
      do
      {
        v48 = v11;
        if ((runs[120] & 1) != 0)
        {
          v32 = *((double *)runs + 8);
          v34 = *((double *)runs + 9);
          v33 = *((double *)runs + 10);
          v35 = v11 + *((double *)runs + 7);
          if (__NSImageBoundsOriginZero)
            goto LABEL_35;
          v66.origin.x = v10;
          v66.origin.y = v9;
          v66.size.width = v58;
          v66.size.height = v59;
          v70.origin.y = y;
          v70.origin.x = v53;
          v70.size.height = height;
          v70.size.width = width;
          if (!NSEqualRects(v66, v70))
          {
LABEL_35:
            v36 = v35 - v10;
            if (v35 >= v10)
              v36 = 0.0;
            v37 = v58 - v36;
            if (v35 < v10)
              v10 = v35;
            v38 = -0.0;
            if (v35 + v34 > v10 + v37)
              v38 = v35 + v34 - (v10 + v37);
            v58 = v37 + v38;
            v39 = v32 - v9;
            if (v32 >= v9)
              v39 = 0.0;
            v40 = v59 - v39;
            if (v32 < v9)
              v9 = v32;
            if (v32 + v33 > v9 + v40)
              v40 = v40 + v32 + v33 - (v9 + v40);
            v59 = v40;
          }
          else
          {
            v58 = v34;
            v59 = v33;
            v9 = v32;
            v10 = v35;
          }
        }
        else
        {
          v12 = *((_QWORD *)runs + 1);
          if (v12 >= 1)
          {
            v56 = *((double *)runs + 12);
            v57 = *((double *)runs + 11);
            v13 = *((double *)runs + 14);
            v14 = v11 + *((double *)runs + 13);
            v49 = runs;
            do
            {
              if (v12 >= 20)
                v15 = 20;
              else
                v15 = v12;
              objc_msgSend(*((id *)runs + 6), "getBoundingRects:forCGGlyphs:count:", v61, glyphs, v15);
              v16 = __NSImageBoundsOriginZero;
              v17 = v62;
              v18 = v15;
              do
              {
                v63 = *(CGRect *)(v17 - 2);
                v60.a = v57;
                v60.b = v54;
                v60.c = v56;
                *(_OWORD *)&v60.d = *(_OWORD *)(v6 + 24);
                v60.ty = *(CGFloat *)(v6 + 40);
                v64 = CGRectApplyAffineTransform(v63, &v60);
                v19 = v64.size.width;
                v20 = v64.size.height;
                v21 = v14 + v64.origin.x;
                v22 = v13 + v64.origin.y;
                if (v16)
                  goto LABEL_16;
                v65.origin.x = v10;
                v65.origin.y = v9;
                v65.size.width = v58;
                v65.size.height = v59;
                v69.origin.y = y;
                v69.origin.x = v53;
                v69.size.height = height;
                v69.size.width = width;
                v23 = NSEqualRects(v65, v69);
                v16 = __NSImageBoundsOriginZero;
                if (!v23)
                {
LABEL_16:
                  v25 = v21 - v10;
                  if (v21 >= v10)
                    v25 = 0.0;
                  v26 = v58 - v25;
                  if (v21 < v10)
                    v10 = v21;
                  v27 = -0.0;
                  if (v19 + v21 > v10 + v26)
                    v27 = v19 + v21 - (v10 + v26);
                  v58 = v26 + v27;
                  v28 = v22 - v9;
                  if (v22 >= v9)
                    v28 = 0.0;
                  v24 = v59 - v28;
                  if (v22 < v9)
                    v9 = v22;
                  if (v20 + v22 > v9 + v24)
                    v24 = v24 + v20 + v22 - (v9 + v24);
                }
                else
                {
                  v24 = v20;
                  v58 = v19;
                  v9 = v22;
                  v10 = v21;
                }
                v59 = v24;
                v29 = advancements->width;
                v30 = advancements->height;
                ++advancements;
                v14 = v14 + v29;
                v13 = v13 + v30 * v55;
                v17 += 4;
                --v18;
              }
              while (v18);
              glyphs += v15;
              v31 = v12 <= v15;
              v12 -= v15;
              runs = v49;
            }
            while (!v31);
          }
        }
        v11 = v48 + *((double *)runs + 5);
        runs += 128;
      }
      while (runs < v47);
    }
    leftControlWidth = self->_leftControlWidth;
    rightControlWidth = self->_rightControlWidth;
    x = v10 + self->_leftSideDelta - leftControlWidth;
    self->_imageBounds.origin.x = x;
    self->_imageBounds.origin.y = v9;
    v42 = v58 + leftControlWidth + rightControlWidth;
    self->_imageBounds.size.width = v42;
    self->_imageBounds.size.height = v59;
  }
  else
  {
    x = self->_imageBounds.origin.x;
    v9 = self->_imageBounds.origin.y;
    v42 = self->_imageBounds.size.width;
    v59 = self->_imageBounds.size.height;
  }
  v45 = v9;
  v46 = v59;
  result.size.height = v46;
  result.size.width = v42;
  result.origin.y = v45;
  result.origin.x = x;
  return result;
}

- (void)dealloc
{
  char *runs;
  int64_t numRuns;
  CFTypeRef *v5;
  CFTypeRef *v6;
  CFTypeRef v7;
  objc_super v8;

  runs = (char *)self->_runs;
  if (runs)
  {
    numRuns = self->_numRuns;
    if (numRuns >= 1)
    {
      v5 = (CFTypeRef *)&runs[128 * numRuns];
      v6 = (CFTypeRef *)self->_runs;
      do
      {
        if (((_BYTE)v6[15] & 1) == 0)
          CFRelease(v6[6]);
        v7 = *v6;
        v6 += 16;
        CFRelease(v7);
      }
      while (v6 < v5);
    }
    NSZoneFree(0, runs);
  }

  v8.receiver = self;
  v8.super_class = (Class)NSLineFragmentRenderingContext;
  -[NSLineFragmentRenderingContext dealloc](&v8, sel_dealloc);
}

- (void)finalize
{
  char *runs;
  int64_t numRuns;
  CFTypeRef *v5;
  CFTypeRef *v6;
  CFTypeRef v7;
  objc_super v8;

  runs = (char *)self->_runs;
  if (runs)
  {
    numRuns = self->_numRuns;
    if (numRuns >= 1)
    {
      v5 = (CFTypeRef *)&runs[128 * numRuns];
      v6 = (CFTypeRef *)self->_runs;
      do
      {
        if (((_BYTE)v6[15] & 1) == 0)
          CFRelease(v6[6]);
        v7 = *v6;
        v6 += 16;
        CFRelease(v7);
      }
      while (v6 < v5);
    }
    NSZoneFree(0, runs);
  }
  v8.receiver = self;
  v8.super_class = (Class)NSLineFragmentRenderingContext;
  -[NSLineFragmentRenderingContext finalize](&v8, sel_finalize);
}

- (void)_setUsesSimpleTextEffects:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_flags = ($02312DB0ACF3CF5CFCBD8D4CC11D7559)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)_usesSimpleTextEffects
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (void)drawAtPoint:(CGPoint)a3 inContext:(CGContext *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  CGContext *v9;
  CGContext *v10;
  double v11;
  double v12;
  double v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *v20;
  uint64_t v21;
  unint64_t v22;
  int v23;
  int v24;
  unint64_t v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  double v38;
  CGTextDrawingMode v39;
  double v40;
  double v41;
  double v42;
  double height;
  double width;
  void *v45;
  double v46;
  double x;
  double y;
  double v49;
  CGFloat v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  double v58;
  double v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  double v63;
  __NSTextAppearanceEffectContext *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  __NSTextAppearanceEffectContext *v69;
  uint64_t v70;
  double v71;
  uint64_t v72;
  double v73;
  double v74;
  double v75;
  uint64_t v76;
  float64x2_t v77;
  float64x2_t v78;
  double *v79;
  float64x2_t *p_t2;
  uint64_t v81;
  float64x2_t v82;
  double v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  double v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;
  double v91;
  uint64_t v92;
  float64x2_t v93;
  float64x2_t v94;
  double *v95;
  CGAffineTransform *v96;
  uint64_t v97;
  float64x2_t v98;
  double v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  double v103;
  uint64_t v104;
  uint64_t v105;
  int v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t *v110;
  void *v111;
  _QWORD *v112;
  char v113;
  unint64_t v114;
  uint64_t v115;
  __int128 v116;
  __int128 v117;
  CGAffineTransform v118;
  CGAffineTransform v119;
  CGAffineTransform v120;
  CGAffineTransform t1;
  CGAffineTransform v122;
  CGAffineTransform t2;
  uint64_t v124;
  NSRect v125;
  NSRect v126;

  v8 = ((double (*)(NSLineFragmentRenderingContext *, SEL, CGContext *, uint64_t, uint64_t, uint64_t, uint64_t, __n128, __n128))MEMORY[0x1E0C80A78])(self, a2, a4, v4, v5, v6, v7, (__n128)a3, *(__n128 *)&a3.y);
  v10 = v9;
  v12 = v11;
  v13 = v8;
  v15 = v14;
  v124 = *MEMORY[0x1E0C80C00];
  v16 = (void *)-[objc_class graphicsContextForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "graphicsContextForApplicationFrameworkContext:", objc_msgSend(v14, "applicationFrameworkContext"));
  v17 = (double *)v15[1];
  v18 = v15[2];
  CGContextGetFontRenderingStyle();
  v112 = v15;
  v19 = objc_msgSend(v15, "applicationFrameworkContext");
  if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery](NSTextGraphicsContextProvider, "textGraphicsContextProviderClassRespondsToColorQuery"))
  {
    v20 = (objc_class *)-[objc_class colorClassForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "colorClassForApplicationFrameworkContext:", v19);
  }
  else
  {
    v20 = +[NSTextGraphicsContextProvider __defaultColorClass](NSTextGraphicsContextProvider, "__defaultColorClass");
  }
  v108 = (void *)-[objc_class blackColor](v20, "blackColor");
  v21 = v15[3];
  v22 = v112[4];
  v105 = v112[20];
  if (v16)
    v23 = objc_msgSend(v16, "isFlipped");
  else
    v23 = 1;
  v24 = *((_DWORD *)v112 + 28);
  if ((v24 & 2) == 0 || v23 == ((_DWORD)v112[14] & 4u) >> 2)
  {
    v106 = 0;
  }
  else
  {
    *((_DWORD *)v112 + 28) = v24 ^ 4;
    v106 = 1;
  }
  v25 = (unint64_t)&v17[16 * v18];
  v26 = *(double *)(MEMORY[0x1E0C9BAA8] + 8);
  v27 = *((double *)v112 + 6);
  v28 = v13 + *((double *)v112 + 5);
  v29 = 0.0;
  if (v27 == 0.0)
    v30 = 0.0;
  else
    v30 = v28 + v27;
  objc_msgSend(v108, "set");
  v113 = 0;
  v109 = 0;
  v115 = 0;
  v31 = 0;
  v110 = (uint64_t *)&v17[16 * v18];
  v107 = v16;
  while ((unint64_t)v17 < v25)
  {
    v32 = v17;
    if (((_BYTE)v17[15] & 1) != 0)
    {
      v41 = v17[7];
      v42 = v17[8];
      width = v17[9];
      height = v17[10];
      v45 = (void *)objc_msgSend(*((id *)v17 + 6), "attachmentCell");
      if (v23)
        v46 = -(v42 + height) - v17[4];
      else
        v46 = v42 + v17[4];
      x = v28 + v41;
      y = v12 + v46;
      objc_msgSend(*((id *)v17 + 6), "lineLayoutPadding");
      if (v49 != 0.0)
      {
        v50 = v49;
        v125.origin.x = x;
        v125.origin.y = y;
        v125.size.width = width;
        v125.size.height = height;
        v126 = NSInsetRect(v125, v50, 0.0);
        x = v126.origin.x;
        y = v126.origin.y;
        width = v126.size.width;
        height = v126.size.height;
      }
      if (v45)
      {
        if (*((_QWORD *)v17 + 11) == -1)
          objc_msgSend(v45, "drawWithFrame:inView:", 0, x, y, width, height);
        else
          objc_msgSend(v45, "drawWithFrame:inView:characterIndex:", 0, x, y, width, height);
LABEL_54:
        v115 = 0;
        v31 = 0;
        v29 = 0.0;
        goto LABEL_108;
      }
      v51 = v109;
      if (!v109)
      {
        v51 = (void *)v112[19];
        if (v51)
          v51 = (void *)objc_msgSend(v51, "textContainer");
      }
      v52 = (void *)*((_QWORD *)v17 + 6);
      v109 = v51;
      v53 = (void *)objc_msgSend(v52, "imageForBounds:textContainer:characterIndex:", x, y, width, height);
      v54 = objc_msgSend(v52, "image");
      if (v105 == 2)
      {
        v25 = (unint64_t)v110;
        if (v53 == (void *)v54 && objc_msgSend(v53, "conformsToProtocol:", &unk_1EE095188))
        {
          v55 = *(_QWORD *)v17;
          if (objc_msgSend(v53, "willProvideAdaptedImageForPresentation"))
            v53 = (void *)objc_msgSend(v53, "imageForBounds:attributes:location:textContainer:", v55, 0, v109, x, y, width, height);
          goto LABEL_46;
        }
      }
      else
      {
LABEL_46:
        v25 = (unint64_t)v110;
      }
      v56 = *((_QWORD *)v17 + 12);
      if (v115 != v56)
      {
        if (v56)
          v57 = (void *)*((_QWORD *)v17 + 12);
        else
          v57 = v108;
        objc_msgSend(v57, "set");
      }
      objc_msgSend(v53, "drawInRect:", x, y, width, height);
      goto LABEL_54;
    }
    if (*((uint64_t *)v17 + 1) >= 1)
    {
      v33 = (void *)*((_QWORD *)v17 + 9);
      v34 = (void *)*((_QWORD *)v17 + 6);
      if ((v31 != v34) | v113 & 1)
      {
        CGContextSetFontRenderingStyle();
        objc_msgSend(v34, "applyToGraphicsContext:", v16);
        v31 = v34;
      }
      v35 = *((_QWORD *)v17 + 7);
      if (v115 != v35)
      {
        if (v35)
          v36 = (void *)*((_QWORD *)v32 + 7);
        else
          v36 = v108;
        objc_msgSend(v36, "set");
        v115 = v35;
      }
      v37 = (void *)*((_QWORD *)v32 + 8);
      if (v37)
      {
        objc_msgSend(v37, "setStroke");
        v115 = 0;
      }
      v38 = v32[10];
      if (v29 != v38)
      {
        if (v38 == 0.0)
        {
          v39 = kCGTextFill;
          v40 = 1.0;
        }
        else if (v38 < 0.0)
        {
          v40 = -v38;
          v39 = kCGTextFillStroke;
        }
        else
        {
          v39 = kCGTextStroke;
          v40 = v32[10];
        }
        CGContextSetTextDrawingMode(v10, v39);
        CGContextSetLineWidth(v10, v40);
        v29 = v38;
      }
      v58 = v32[11];
      if (v58 == 1.0 && v32[12] == 0.0)
      {
        v113 = 0;
        if (v33)
          goto LABEL_65;
      }
      else
      {
        if (v23)
          v59 = v32[12];
        else
          v59 = -v32[12];
        CGContextGetTextMatrix(&t1, v10);
        t2.a = v58;
        t2.b = v26;
        t2.c = v59;
        *(_OWORD *)&t2.d = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 24);
        t2.ty = *(CGFloat *)(MEMORY[0x1E0C9BAA8] + 40);
        CGAffineTransformConcat(&v122, &t1, &t2);
        CGContextSetTextMatrix(v10, &v122);
        v113 = 1;
        if (v33)
        {
LABEL_65:
          CGContextSaveGState(v10);
          objc_msgSend(v33, "applyToGraphicsContext:", v16);
        }
      }
      v111 = v33;
      if (v106)
      {
        v60 = *((_QWORD *)v32 + 1);
        if (v60 >= 1)
        {
          v61 = v22 + 16 * v60;
          v62 = v22;
          do
          {
            *(double *)(v62 + 8) = -*(double *)(v62 + 8);
            v62 += 16;
          }
          while (v62 < v61);
        }
      }
      v114 = v22;
      v63 = v32[4] + v32[14];
      v64 = [__NSTextAppearanceEffectContext alloc];
      v65 = objc_msgSend(*(id *)v32, "objectForKey:", CFSTR("NSTextEffect"));
      v67 = v112[17];
      v66 = v112[18];
      v68 = objc_msgSend(v112, "applicationFrameworkContext");
      LOBYTE(v104) = (v112[14] & 8) != 0;
      v69 = -[__NSTextAppearanceEffectContext initWithTextEffectName:catalog:styleEffectConfiguration:font:color:applicationFrameworkContext:useSimplifiedEffect:](v64, "initWithTextEffectName:catalog:styleEffectConfiguration:font:color:applicationFrameworkContext:useSimplifiedEffect:", v65, v67, v66, v31, v115, v68, v104);
      if (objc_msgSend(v31, "isVertical"))
      {
        v70 = *((_QWORD *)v32 + 1);
        v71 = v32[13];
        memset(&v120, 0, sizeof(v120));
        CGContextGetTextMatrix(&v119, v10);
        CGAffineTransformInvert(&v120, &v119);
        if (*((uint64_t *)v32 + 1) >= 1)
        {
          v72 = 0;
          v73 = -v63;
          if (!v23)
            v73 = v63;
          v74 = v12 + v73;
          v75 = v28 + v71;
          if (v70 >= 256)
            v76 = 256;
          else
            v76 = v70;
          do
          {
            objc_msgSend(v31, "getVerticalOriginTranslations:forCGGlyphs:count:", &t2, v21 + 2 * v72, v76);
            if (v76 >= 1)
            {
              v77 = *(float64x2_t *)&v120.a;
              v78 = *(float64x2_t *)&v120.c;
              v79 = (double *)(v114 + 8 + 16 * v72);
              p_t2 = (float64x2_t *)&t2;
              v81 = v76;
              v82 = *(float64x2_t *)&v120.tx;
              do
              {
                v83 = p_t2->f64[1];
                if (v23)
                  v83 = -v83;
                *p_t2 = vaddq_f64(v82, vmlaq_n_f64(vmulq_n_f64(v78, v74 + v83), v77, v75 + p_t2->f64[0]));
                ++p_t2;
                v75 = v75 + *(v79 - 1);
                v84 = *v79;
                v79 += 2;
                v74 = v74 + v84;
                --v81;
              }
              while (v81);
            }
            if (v69)
              -[__NSTextAppearanceEffectContext drawGlyphs:positions:count:context:](v69, "drawGlyphs:positions:count:context:", v21 + 2 * v72, &t2, v76, v10);
            else
              CTFontDrawGlyphsAtPositions();
            v72 += v76;
            v85 = *((_QWORD *)v32 + 1);
            if (v85 - v72 >= 256)
              v76 = 256;
            else
              v76 = v85 - v72;
          }
          while (v85 > v72);
        }
        v16 = v107;
        goto LABEL_104;
      }
      if (v69)
      {
        v86 = *((_QWORD *)v32 + 1);
        v87 = v32[13];
        memset(&v120, 0, sizeof(v120));
        CGContextGetTextMatrix(&v118, v10);
        CGAffineTransformInvert(&v120, &v118);
        v16 = v107;
        if (*((uint64_t *)v32 + 1) >= 1)
        {
          v90 = 0;
          v91 = -v63;
          if (!v23)
            v91 = v63;
          *(double *)&v88 = v12 + v91;
          *(double *)&v89 = v28 + v87;
          if (v86 >= 256)
            v92 = 256;
          else
            v92 = v86;
          do
          {
            if (v92 >= 1)
            {
              v93 = *(float64x2_t *)&v120.a;
              v94 = *(float64x2_t *)&v120.c;
              v95 = (double *)(v114 + 8 + 16 * v90);
              v96 = &t2;
              v97 = v92;
              v98 = *(float64x2_t *)&v120.tx;
              do
              {
                *(float64x2_t *)&v96->a = vaddq_f64(v98, vmlaq_n_f64(vmulq_n_f64(v94, *(double *)&v88), v93, *(double *)&v89));
                v96 = (CGAffineTransform *)((char *)v96 + 16);
                *(double *)&v89 = *(double *)&v89 + *(v95 - 1);
                v99 = *v95;
                v95 += 2;
                *(double *)&v88 = *(double *)&v88 + v99;
                --v97;
              }
              while (v97);
            }
            v116 = v89;
            v117 = v88;
            -[__NSTextAppearanceEffectContext drawGlyphs:positions:count:context:](v69, "drawGlyphs:positions:count:context:", v21 + 2 * v90, &t2, v92, v10);
            v89 = v116;
            v88 = v117;
            v90 += v92;
            v100 = *((_QWORD *)v32 + 1);
            if (v100 - v90 >= 256)
              v92 = 256;
            else
              v92 = v100 - v90;
          }
          while (v100 > v90);
        }
LABEL_104:
        v101 = v114;
      }
      else
      {
        v103 = -v63;
        if (!v23)
          v103 = v63;
        CGContextSetTextPosition(v10, v28 + v32[13], v12 + v103);
        v16 = v107;
        v101 = v114;
        if (v31)
          CTFontDrawGlyphsWithAdvances();
      }

      v25 = (unint64_t)v110;
      if (v111)
        CGContextRestoreGState(v10);
      v102 = *((_QWORD *)v32 + 1);
      v21 += 2 * v102;
      v22 = v101 + 16 * v102;
    }
LABEL_108:
    v17 = v32 + 16;
    v28 = v28 + v32[5];
    if (v30 > 0.0 && v28 >= v30)
      break;
  }
  CGContextSetFontRenderingStyle();
  if (v29 != 0.0)
  {
    CGContextSetTextDrawingMode(v10, kCGTextFill);
    CGContextSetLineWidth(v10, 1.0);
  }
}

- (CGSize)sizeWithBehavior:(int64_t)a3 usesFontLeading:(BOOL)a4 baselineDelta:(double *)a5
{
  _BOOL4 v6;
  int64_t numRuns;
  double *runs;
  double *v10;
  unsigned __int8 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSParagraphStyle *v29;
  NSParagraphStyle *v30;
  double v31;
  BOOL v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  _BOOL4 v41;
  _BOOL4 v42;
  double v43;
  double v44;
  double v45;
  _BOOL4 v46;
  _BOOL4 v47;
  BOOL v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double lineWidth;
  double v57;
  int64_t v58;
  double *v59;
  CGSize result;

  v6 = a4;
  runs = (double *)self->_runs;
  numRuns = self->_numRuns;
  if (a3 < 0)
  {
    a3 = sizeWithBehavior_usesFontLeading_baselineDelta__defaultBehavior;
    if (sizeWithBehavior_usesFontLeading_baselineDelta__defaultBehavior == -1)
    {
      a3 = +[NSTypesetter defaultTypesetterBehavior](NSTypesetter, "defaultTypesetterBehavior");
      sizeWithBehavior_usesFontLeading_baselineDelta__defaultBehavior = a3;
    }
  }
  v59 = a5;
  v58 = a3;
  if (numRuns < 1)
  {
    v14 = 0.0;
    v13 = 0.0;
    v12 = 0.0;
  }
  else
  {
    v10 = &runs[16 * numRuns];
    v11 = (a3 < 2) & ~v6;
    v12 = 0.0;
    v13 = 0.0;
    v14 = 0.0;
    do
    {
      if (((_BYTE)runs[15] & 1) != 0)
      {
        v15 = runs[10];
        v16 = v15 + runs[8];
      }
      else
      {
        v15 = runs[2];
        v16 = runs[3];
      }
      v17 = 0.0;
      if (v6)
      {
        v18 = *(id *)runs;
        if (!*(_QWORD *)runs)
          goto LABEL_16;
        v19 = (void *)objc_msgSend(*(id *)runs, "objectForKey:", _NSOriginalFontAttributeName, 0.0);
        if (!v19)
          v19 = (void *)objc_msgSend(v18, "objectForKey:", CFSTR("NSFont"));
        if (objc_msgSend((id)objc_msgSend(v18, "objectForKey:", CFSTR("CTVerticalForms")), "BOOLValue"))
          v19 = (void *)objc_msgSend(v19, "verticalFont");
        if (!v19)
LABEL_16:
          v19 = (void *)NSDefaultFont();
        objc_msgSend(v19, "_leading");
      }
      v20 = runs[4];
      if (v20 <= 0.0)
        v21 = 0.0;
      else
        v21 = runs[4];
      v22 = v16 + v21;
      if (v20 >= 0.0)
        v23 = 0.0;
      else
        v23 = runs[4];
      v24 = v16 - v15 + v23;
      if ((v11 & (v20 > 0.0)) != 0)
        v25 = runs[4];
      else
        v25 = -0.0;
      v26 = v24 + v25;
      if (v24 < v13)
      {
        v13 = v26;
        v24 = v26;
      }
      if ((v11 & (v20 < 0.0)) == 0)
        v20 = -0.0;
      v27 = v22 + v20;
      if (v22 > v14)
        v14 = v27;
      v28 = v17 - v24;
      if (v28 > v12)
        v12 = v28;
      runs += 16;
    }
    while (runs < v10);
  }
  v29 = (NSParagraphStyle *)objc_msgSend(*(id *)self->_runs, "objectForKey:", CFSTR("NSParagraphStyle"));
  v30 = (NSParagraphStyle *)sizeWithBehavior_usesFontLeading_baselineDelta__defaultParagraphStyle;
  if (!sizeWithBehavior_usesFontLeading_baselineDelta__defaultParagraphStyle)
  {
    v30 = +[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle");
    sizeWithBehavior_usesFontLeading_baselineDelta__defaultParagraphStyle = (uint64_t)v30;
  }
  v31 = v14 - v13;
  if (v29)
    v32 = v30 == v29;
  else
    v32 = 1;
  v33 = 0.0;
  v34 = 0.0;
  v35 = 0.0;
  v36 = 0.0;
  if (!v32)
  {
    -[NSParagraphStyle lineHeightMultiple](v29, "lineHeightMultiple");
    v33 = v37;
    -[NSParagraphStyle minimumLineHeight](v29, "minimumLineHeight");
    v34 = v38;
    -[NSParagraphStyle maximumLineHeight](v29, "maximumLineHeight");
    v35 = v39;
    -[NSParagraphStyle lineSpacing](v29, "lineSpacing");
    v36 = v40;
  }
  v41 = v58 > 2;
  v42 = v33 > 0.0;
  v43 = v31 * v33;
  if (v41 && v42)
    v44 = v31 * v33 - v31;
  else
    v44 = -0.0;
  if (!v41 || !v42)
    v43 = v14 - v13;
  if (v43 >= v34)
    v45 = -0.0;
  else
    v45 = v34 - v43;
  if (v43 >= v34)
    v34 = v43;
  v46 = v35 > 0.0;
  v47 = v34 > v35;
  v48 = v46 && v47;
  if (v46 && v47)
    v49 = v34 - v35;
  else
    v49 = 0.0;
  if (v6 && v58 <= 2)
  {
    v50 = v44;
    v51 = *(void **)self->_runs;
    if (!v51)
      goto LABEL_66;
    v52 = (void *)objc_msgSend(v51, "objectForKey:", _NSOriginalFontAttributeName);
    if (!v52)
      v52 = (void *)objc_msgSend(v51, "objectForKey:", CFSTR("NSFont"));
    if (objc_msgSend((id)objc_msgSend(v51, "objectForKey:", CFSTR("CTVerticalForms")), "BOOLValue"))
      v52 = (void *)objc_msgSend(v52, "verticalFont");
    if (!v52)
LABEL_66:
      v52 = (void *)NSDefaultFont();
    objc_msgSend(v52, "_leading");
    v44 = v50;
  }
  else
  {
    v53 = v13 + v12;
  }
  if (v58 >= 2 && v36 < 0.0)
  {
    v53 = v36 + v53;
    if (v53 < 0.0)
      v53 = 0.0;
  }
  if (v59)
    *v59 = v14 + v44 + v45 - v49;
  if (v48)
    v54 = v35;
  else
    v54 = v34;
  if (v53 >= v36)
    v55 = v53;
  else
    v55 = v36;
  lineWidth = self->_lineWidth;
  v57 = v54 + v55;
  result.height = v57;
  result.width = lineWidth;
  return result;
}

- (void)getMaximumAscender:(double *)a3 minimumDescender:(double *)a4
{
  int64_t numRuns;
  char *runs;
  unint64_t v8;
  char *v9;
  double v10;
  double v11;
  void *v12;
  char *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  numRuns = self->_numRuns;
  if (numRuns < 1)
  {
    v11 = 0.0;
    v10 = 0.0;
  }
  else
  {
    runs = (char *)self->_runs;
    v8 = (unint64_t)&runs[128 * numRuns];
    v9 = runs + 80;
    v10 = 0.0;
    v11 = 0.0;
    do
    {
      v13 = v9 - 80;
      v12 = (void *)*((_QWORD *)v9 - 10);
      if (!v12)
        goto LABEL_9;
      v14 = (void *)objc_msgSend(*((id *)v9 - 10), "objectForKey:", _NSOriginalFontAttributeName);
      if (!v14)
        v14 = (void *)objc_msgSend(v12, "objectForKey:", CFSTR("NSFont"));
      if (objc_msgSend((id)objc_msgSend(v12, "objectForKey:", CFSTR("CTVerticalForms")), "BOOLValue"))
        v14 = (void *)objc_msgSend(v14, "verticalFont");
      if (!v14)
LABEL_9:
        v14 = (void *)NSDefaultFont();
      objc_msgSend(v14, "boundingRectForFont");
      if ((v9[40] & 1) != 0)
      {
        v17 = *((double *)v9 - 2);
        v18 = v17 - v15;
        if (v17 >= v15)
          v18 = 0.0;
        v16 = v16 - v18;
        if (v17 < v15)
          v15 = *((double *)v9 - 2);
        v19 = v17 + *(double *)v9;
        if (v19 > v15 + v16)
          v16 = v16 + v19 - (v15 + v16);
      }
      v20 = v15 + *((double *)v9 - 6);
      if (v20 < v10)
        v10 = v15 + *((double *)v9 - 6);
      v21 = v16 + v20;
      if (v21 > v11)
        v11 = v21;
      v9 += 128;
    }
    while ((unint64_t)(v13 + 128) < v8);
  }
  *a3 = ceil(v11);
  *a4 = floor(v10);
}

- (double)elasticWidth
{
  return self->_elasticWidth;
}

- (BOOL)isRTL
{
  return *(_DWORD *)&self->_flags & 1;
}

- (int64_t)applicationFrameworkContext
{
  return ((unint64_t)self->_flags >> 4) & 7;
}

- (int64_t)resolvedBaseWritingDirection
{
  return self->_resolvedDirection;
}

- (int64_t)resolvedTextAlignment
{
  return self->_resolvedAlignment;
}

- (CUICatalog)cuiCatalog
{
  return self->_catalog;
}

- (void)setCuiCatalog:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (CUIStyleEffectConfiguration)cuiStyleEffects
{
  return self->_styleEffects;
}

- (void)setCuiStyleEffects:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

@end
