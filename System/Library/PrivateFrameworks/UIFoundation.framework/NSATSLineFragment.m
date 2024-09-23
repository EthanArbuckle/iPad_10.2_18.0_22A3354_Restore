@implementation NSATSLineFragment

uint64_t __92__NSATSLineFragment__charIndexToBreakLineByWordWrappingAtIndex_lineFragmentWidth_hyphenate___block_invoke(uint64_t a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = *a2;
  if (*((_BYTE *)a2 + 16))
    return objc_msgSend(v2, "shouldBreakLineByHyphenatingBeforeCharacterAtIndex:", v3);
  else
    return objc_msgSend(v2, "shouldBreakLineByWordBeforeCharacterAtIndex:", v3);
}

- (double)resolveOpticalAlignmentUpdatingMinPosition:(double *)a3 maxPosition:
{
  double x;
  double width;
  double result;
  CGRect BoundsWithOptions;
  CGRect v10;

  if (a1)
  {
    BoundsWithOptions = CTLineGetBoundsWithOptions((CTLineRef)*(_QWORD *)(a1 + 8), 0x80uLL);
    x = BoundsWithOptions.origin.x;
    width = BoundsWithOptions.size.width;
    v10 = CTLineGetBoundsWithOptions((CTLineRef)*(_QWORD *)(a1 + 8), 0xC0uLL);
    v10.size.height = *(CGFloat *)(a1 + 64);
    v10.origin.y = *(double *)(a1 + 56) + x - v10.origin.x;
    *(CGFloat *)(a1 + 56) = v10.origin.y;
    *(double *)(a1 + 64) = v10.size.height + x + width - (v10.origin.x + v10.size.width);
    *a2 = v10.origin.y;
    result = *(double *)(a1 + 64);
    *a3 = result;
  }
  return result;
}

- (CFIndex)layoutForStartingGlyphAtIndex:(double)a3 characterIndex:(CGFloat)a4 minPosition:(CGFloat)a5 maxPosition:(CGFloat)a6 lineFragmentRect:(CGFloat)a7
{
  uint64_t v16;
  uint64_t v17;
  const __CTTypesetter *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  CFIndex v23;
  uint64_t v24;
  double v25;
  _BYTE *v26;
  double v27;
  double v28;
  const __CTTypesetter *v29;
  _BOOL4 v30;
  uint64_t v31;
  double v32;
  double v33;
  uint64_t v34;
  double v35;
  double v36;
  BOOL v37;
  int v38;
  CFIndex v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  const __CTLine *v43;
  uint64_t JustifiedLineWithOptions;
  const __CTLine *v45;
  double v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;
  BOOL v51;
  BOOL v52;
  const __CTLine *TruncatedLineWithTokenCallback;
  const __CTLine *v54;
  const __CFArray *GlyphRuns;
  int v56;
  uint64_t RangeOfCharacterClusterAtIndex;
  unint64_t v58;
  uint64_t v59;
  CFIndex v60;
  CFIndex v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const __CTLine *v68;
  double v69;
  uint64_t v70;
  double v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const __CTLine *v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  __int128 v87;
  double v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  uint64_t v93;
  unsigned int v94;
  int v95;
  CFIndex v96;
  uint64_t v97;
  double v98;
  const __CTLine *v99;
  double v100;
  double v101;
  double v102;
  unint64_t v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  unint64_t v107;
  int v108;
  uint64_t v109;
  const __CFArray *v110;
  CFIndex v111;
  BOOL v112;
  const __CTRun *ValueAtIndex;
  CFIndex v114;
  const __CTRun *v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  int64_t v119;
  uint64_t *v120;
  uint64_t *v121;
  uint64_t v122;
  float v123;
  float v124;
  float v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const void *v130;
  const __CTLine *Line;
  const __CFArray *v132;
  CFIndex Count;
  __CFArray *Mutable;
  __CFArray *v135;
  _BYTE *v136;
  CTTypesetterRef typesetter;
  uint64_t v138;
  uint64_t v139;
  unint64_t v140;
  const __CFString *theString;
  CGGlyph glyphs[2];
  UniChar characters[2];
  char v144;
  __int128 v145;
  CFRange v146;
  CFRange v147;
  CFRange v148;
  CFRange v149;
  CFRange v150;
  CFRange v151;
  CFRange v152;
  CGRect BoundsWithOptions;
  CGRect v154;
  CGRect v155;

  if (!result)
    return result;
  v16 = result;
  v17 = objc_msgSend(*(id *)(result + 16), "_getATSTypesetterGuts");
  v18 = (const __CTTypesetter *)objc_msgSend(*(id *)(v16 + 16), "_ctTypesetter");
  v19 = *(_QWORD *)(v17 + 16);
  v20 = objc_msgSend(*(id *)(v16 + 16), "_isLineBreakModeOverridden");
  v21 = -[NSATSLineFragment resolvedLineBreakMode:](v16, v20);
  v22 = objc_msgSend(*(id *)(v16 + 16), "paragraphCharacterRange");
  v145 = 0uLL;
  v23 = a9 - v22;
  v138 = v24;
  v139 = v22 + v24;
  theString = (const __CFString *)objc_msgSend((id)objc_msgSend(*(id *)(v16 + 16), "attributedString"), "string");
  v25 = a3 - a2;
  v26 = (_BYTE *)objc_msgSend(*(id *)(v16 + 16), "_bidiLevels");
  objc_msgSend(*(id *)(v16 + 16), "defaultTighteningFactor");
  v28 = v27;
  -[NSATSLineFragment _invalidate](v16);
  *(double *)(v16 + 56) = a2;
  *(double *)(v16 + 64) = a3;
  *(_DWORD *)(v16 + 88) = 0;
  *(_QWORD *)(v16 + 96) = 0;
  if (v21 > 1)
  {
    *(_QWORD *)(v16 + 40) = objc_msgSend(*(id *)(v16 + 16), "paragraphCharacterRange");
    *(_QWORD *)(v16 + 48) = v40;
    *(_QWORD *)(v16 + 24) = objc_msgSend(*(id *)(v16 + 16), "paragraphGlyphRange");
    *(_QWORD *)(v16 + 32) = v41;
    v146.length = *(_QWORD *)(v16 + 48);
    v146.location = 0;
    *(_QWORD *)(v16 + 8) = CTTypesetterCreateLine(v18, v146);
    v42 = objc_msgSend((id)objc_msgSend(*(id *)(v16 + 16), "layoutManager"), "_forcesTrackingFloor");
    v43 = *(const __CTLine **)(v16 + 8);
    if (v42)
    {
      JustifiedLineWithOptions = CTLineCreateJustifiedLineWithOptions();
      v43 = *(const __CTLine **)(v16 + 8);
      if (JustifiedLineWithOptions)
      {
        v45 = (const __CTLine *)JustifiedLineWithOptions;
        CFRelease(*(CFTypeRef *)(v16 + 8));
        *(_QWORD *)(v16 + 8) = v45;
        v43 = v45;
      }
    }
    -[NSATSGlyphStorage _resolvePositionalStakeGlyphsForLineFragment:lineFragmentRect:minPosition:maxPosition:maxLineFragmentWidth:breakHint:](v19, v43, 0, a4, a5, a6, a7, *(double *)(v16 + 56), *(double *)(v16 + 64), 0.0);
    *(_QWORD *)(v16 + 72) = *(_QWORD *)(*(_QWORD *)(v17 + 16) + 168);
    v46 = *(double *)(*(_QWORD *)(v17 + 16) + 176);
    *(double *)(v16 + 80) = v46;
    BoundsWithOptions = CTLineGetBoundsWithOptions((CTLineRef)*(_QWORD *)(v16 + 8), 0);
    v35 = *(double *)(v16 + 96) - v46;
    v47 = BoundsWithOptions.size.width + v35;
    if (v20)
    {
      v48 = objc_msgSend(*(id *)(v16 + 16), "paragraphSeparatorCharacterRange");
      v50 = !v49 && *(_QWORD *)(v16 + 48) + *(_QWORD *)(v16 + 40) == v48;
      v51 = !v50 && (unint64_t)v21 >= 3;
      v52 = !v51 || v25 < v47;
      v35 = v47 + -1.0;
      if (!v52)
        v25 = v47 + -1.0;
    }
    if (v25 >= v47)
      goto LABEL_129;
    v35 = v47 - v25;
    if (v47 - v25 <= 0.001)
      goto LABEL_129;
    if ((unint64_t)v21 < 3)
    {
      if (v28 > 0.0)
      {
        v35 = (v28 + 1.0) * v25;
        if (v35 >= v47)
        {
          v64 = CTLineCreateJustifiedLineWithOptions();
          if (v64)
          {
            v65 = v64;
            CFRelease(*(CFTypeRef *)(v16 + 8));
            *(_QWORD *)(v16 + 8) = v65;
          }
        }
      }
      goto LABEL_129;
    }
    if ((v20 & 1) == 0)
    {
      v108 = objc_msgSend((id)objc_msgSend(*(id *)(v16 + 16), "currentParagraphStyle", v35), "allowsDefaultTighteningForTruncation");
      if ((v108 & 1) != 0
        || ((objc_msgSend(*(id *)(v16 + 16), "tightenThresholdForTruncation"),
             v124 = v123,
             objc_msgSend((id)objc_msgSend(*(id *)(v16 + 16), "currentParagraphStyle"), "tighteningFactorForTruncation"),
             v124 == 0.0)
         || v25 >= v47 * v124)
        && v25 * (v125 + 1.0) >= v47)
      {
        v126 = CTLineCreateJustifiedLineWithOptions();
        if (v126)
        {
          v127 = v126;
          CFRelease(*(CFTypeRef *)(v16 + 8));
          *(_QWORD *)(v16 + 8) = v127;
          goto LABEL_167;
        }
        if (v108)
        {
          v128 = CTLineCreateJustifiedLineWithOptions();
          if (v128)
          {
            v129 = v128;
            CFRelease(*(CFTypeRef *)(v16 + 8));
            *(_QWORD *)(v16 + 8) = v129;
          }
        }
      }
    }
    TruncatedLineWithTokenCallback = (const __CTLine *)CTLineCreateTruncatedLineWithTokenCallback();
    if (TruncatedLineWithTokenCallback)
    {
      v54 = TruncatedLineWithTokenCallback;
      GlyphRuns = CTLineGetGlyphRuns(TruncatedLineWithTokenCallback);
      if (CFArrayGetCount(GlyphRuns) != 1)
      {
        CFRelease(*(CFTypeRef *)(v16 + 8));
        *(_QWORD *)(v16 + 8) = v54;
        goto LABEL_167;
      }
      CFRelease(v54);
    }
    v56 = v21 == 3;
    if (v21 == 3)
    {
      RangeOfCharacterClusterAtIndex = CFStringGetRangeOfCharacterClusterAtIndex();
      v116 = 0;
      v58 = *(_QWORD *)(v16 + 40);
      v59 = RangeOfCharacterClusterAtIndex - v58;
      v60 = *(_QWORD *)(v16 + 48) - (RangeOfCharacterClusterAtIndex - v58);
      v61 = RangeOfCharacterClusterAtIndex - v58;
    }
    else
    {
      CFStringGetRangeOfCharacterClusterAtIndex();
      v117 = *(_QWORD *)(v16 + 72);
      v58 = *(_QWORD *)(v16 + 40);
      if (v117 > v58 && v58 + v116 >= v117)
        goto LABEL_167;
      v61 = 0;
      v59 = *(_QWORD *)(v16 + 48) - v116;
      v60 = v116;
    }
    if (v59 >= 1)
    {
      if (v19)
      {
        v118 = *(_QWORD *)(v19 + 96);
        if (v118 >= 1)
        {
          v119 = v58 + v116;
          v120 = *(uint64_t **)(v19 + 88);
          v121 = &v120[13 * v118];
          v122 = *(_QWORD *)(v19 + 128);
          while (1)
          {
            v122 += v120[2];
            if (v122 > v119)
              break;
            v120 += 13;
            if (v120 >= v121)
              goto LABEL_167;
          }
          v130 = -[NSATSGlyphStorage _createEllipsisRunWithStringRange:attributes:]((void *)v19, v116, v59, *v120);
          if (v26)
          {
            if (v21 == 3)
              v56 = (v26[v138 - 1] & 1) == 0;
            else
              v56 = *v26 & 1;
          }
          v150.location = v61;
          v150.length = v60;
          Line = CTTypesetterCreateLine(v18, v150);
          v132 = CTLineGetGlyphRuns(Line);
          Count = CFArrayGetCount(v132);
          Mutable = CFArrayCreateMutable(0, Count + 1, MEMORY[0x1E0C9B378]);
          v135 = Mutable;
          if (v56)
          {
            CFArrayAppendValue(Mutable, v130);
            v151.location = 0;
            v151.length = Count;
            CFArrayAppendArray(v135, v132, v151);
          }
          else
          {
            v152.location = 0;
            v152.length = Count;
            CFArrayAppendArray(Mutable, v132, v152);
            CFArrayAppendValue(v135, v130);
          }
          CFRelease(*(CFTypeRef *)(v16 + 8));
          *(_QWORD *)(v16 + 8) = CTLineCreateWithRunArray();
          CFRelease(v130);
          CFRelease(Line);
          CFRelease(v135);
        }
      }
    }
LABEL_167:
    *(_QWORD *)(v16 + 72) = v139;
    *(_QWORD *)(v16 + 80) = 0;
    goto LABEL_129;
  }
  v29 = v18;
  v136 = v26;
  v30 = 0;
  v144 = 0;
  if (v28 > 0.0)
    v30 = objc_msgSend(*(id *)(v16 + 16), "paragraphCharacterRange") == a9;
  v31 = objc_msgSend(*(id *)(v16 + 16), "layoutManager");
  v32 = 0.001;
  if (!v31)
    v32 = 0.0;
  v33 = v25 + v32;
  *(_QWORD *)(v16 + 40) = a9;
  *(_QWORD *)(v16 + 48) = 0;
  *(_QWORD *)(v16 + 80) = 0;
  typesetter = (CTTypesetterRef)objc_msgSend((id)objc_msgSend(*(id *)(v16 + 16), "attributedString"), "attribute:atIndex:effectiveRange:", CFSTR("NSAttachment"), a9, 0);
  v34 = -[__CTTypesetter embeddingType](typesetter, "embeddingType");
  v35 = *(double *)(v16 + 56);
  v36 = *(double *)(v16 + 64);
  v37 = v35 != v36 && v34 == 1;
  v38 = v37;
  if (v37)
  {
    v39 = 1;
  }
  else if (v35 == v36 || (v39 = CTTypesetterSuggestClusterBreak(v29, v23, v33), v39 <= 0))
  {
    v62 = CFStringGetRangeOfCharacterClusterAtIndex();
    v39 = v63 - a9 + v62;
    v21 = 1;
  }
  if (v30)
  {
    *(_QWORD *)(v16 + 40) = objc_msgSend(*(id *)(v16 + 16), "paragraphCharacterRange");
    *(_QWORD *)(v16 + 48) = v66;
    *(_QWORD *)(v16 + 24) = objc_msgSend(*(id *)(v16 + 16), "paragraphGlyphRange");
    *(_QWORD *)(v16 + 32) = v67;
    v147.length = *(_QWORD *)(v16 + 48);
    v147.location = 0;
    v68 = CTTypesetterCreateLine(v29, v147);
    *(_QWORD *)(v16 + 8) = v68;
    -[NSATSGlyphStorage _resolvePositionalStakeGlyphsForLineFragment:lineFragmentRect:minPosition:maxPosition:maxLineFragmentWidth:breakHint:](v19, v68, 0, a4, a5, a6, a7, *(double *)(v16 + 56), *(double *)(v16 + 64), 0.0);
    *(_QWORD *)(v16 + 72) = *(_QWORD *)(*(_QWORD *)(v17 + 16) + 168);
    v69 = *(double *)(*(_QWORD *)(v17 + 16) + 176);
    *(double *)(v16 + 80) = v69;
    v154 = CTLineGetBoundsWithOptions((CTLineRef)*(_QWORD *)(v16 + 8), 0);
    v35 = v154.size.width + *(double *)(v16 + 96) - v69;
    if (v35 > v33)
    {
      if ((v28 + 1.0) * v33 < v35 || (v70 = CTLineCreateJustifiedLineWithOptions()) == 0)
      {
        v70 = 0;
        *(_QWORD *)(v16 + 40) = a9;
        *(_QWORD *)(v16 + 48) = 0;
        *(_QWORD *)(v16 + 80) = 0;
      }
      CFRelease(*(CFTypeRef *)(v16 + 8));
      *(_QWORD *)(v16 + 8) = v70;
    }
  }
  if (*(_QWORD *)(v16 + 8))
    goto LABEL_128;
  v140 = v139 - a9;
  v71 = v33;
  while (1)
  {
    while (1)
    {
      if (v39)
      {
        v72 = -[NSATSGlyphStorage _collectElasticRangeSurroundingCharacterAtIndex:minimumCharacterIndex:](v19, v39 + a9, a9);
        *(_QWORD *)&v145 = v72;
        *((_QWORD *)&v145 + 1) = v73;
      }
      else
      {
        v145 = *(_OWORD *)(v16 + 40);
        v73 = *((_QWORD *)&v145 + 1);
        v72 = v145;
      }
      if (v21)
        v74 = 1;
      else
        v74 = v38;
      if ((v74 & 1) == 0)
      {
        if (v73 + v72 - a9 >= v140)
          goto LABEL_79;
        if (v39)
          v75 = v73 + v72;
        else
          v75 = a9;
        v76 = v75 + 1;
        if (v75 + 1 - a9 < v140 && (CFStringGetCharacterAtIndex(theString, v75 + 1) & 0xFC00) == 0xDC00)
          v76 = v75 + 2;
        if (typesetter
          && (*(_DWORD *)(v19 + 224) & 2) != 0
          && !-[__CTTypesetter attachmentCell](typesetter, "attachmentCell"))
        {
          *(_QWORD *)(v16 + 40) = objc_msgSend(*(id *)(v16 + 16), "paragraphCharacterRange");
          *(_QWORD *)(v16 + 48) = v77;
          *(_QWORD *)(v16 + 24) = objc_msgSend(*(id *)(v16 + 16), "paragraphGlyphRange");
          *(_QWORD *)(v16 + 32) = v78;
          v148.length = *(_QWORD *)(v16 + 48);
          v148.location = 0;
          v79 = CTTypesetterCreateLine(v29, v148);
          *(_QWORD *)(v16 + 8) = v79;
          -[NSATSGlyphStorage _resolvePositionalStakeGlyphsForLineFragment:lineFragmentRect:minPosition:maxPosition:maxLineFragmentWidth:breakHint:](v19, v79, 0, a4, a5, a6, a7, *(double *)(v16 + 56), *(double *)(v16 + 64), 0.0);
          *(_QWORD *)(v16 + 40) = a9;
          *(_QWORD *)(v16 + 48) = 0;
          CFRelease(*(CFTypeRef *)(v16 + 8));
          *(_QWORD *)(v16 + 8) = 0;
        }
        v80 = -[NSATSLineFragment _charIndexToBreakLineByWordWrappingAtIndex:lineFragmentWidth:hyphenate:](v16, v76, &v144, v33);
        if (v80 == a9)
        {
          v81 = CTTypesetterSuggestClusterBreak(v29, v23, v33);
          if (v81 <= 0)
          {
            CFStringGetRangeOfCharacterClusterAtIndex();
            v81 = v82;
          }
          *(_DWORD *)(v16 + 104) |= 0x10u;
          goto LABEL_121;
        }
        v83 = v80;
        v73 = *((_QWORD *)&v145 + 1);
        v72 = v145;
        if (*((_QWORD *)&v145 + 1) + (_QWORD)v145 == v83)
        {
LABEL_79:
          v21 = 0;
        }
        else
        {
          v72 = -[NSATSGlyphStorage _collectElasticRangeSurroundingCharacterAtIndex:minimumCharacterIndex:](v19, v83, a9);
          v21 = 0;
          *(_QWORD *)&v145 = v72;
          *((_QWORD *)&v145 + 1) = v73;
        }
      }
      v84 = v73 + v72;
      v81 = v73 + v72 - a9;
      v149.location = v23;
      v149.length = v81;
      *(_QWORD *)(v16 + 8) = CTTypesetterCreateLine(v29, v149);
      if (objc_msgSend((id)objc_msgSend(*(id *)(v16 + 16), "layoutManager"), "_forcesTrackingFloor"))
      {
        v85 = CTLineCreateJustifiedLineWithOptions();
        if (v85)
        {
          v86 = v85;
          CFRelease(*(CFTypeRef *)(v16 + 8));
          *(_QWORD *)(v16 + 8) = v86;
        }
      }
      v87 = v145;
      *(_QWORD *)(v16 + 72) = v145;
      if (*((_QWORD *)&v87 + 1))
        v88 = -[NSATSGlyphStorage _widthForStringRange:](v19, v87, *((uint64_t *)&v87 + 1));
      else
        v88 = 0.0;
      *(double *)(v16 + 80) = v88;
      *(_DWORD *)(v16 + 88) = 0;
      *(_QWORD *)(v16 + 96) = 0;
      if (v144)
      {
        if (v19 && (v89 = *(_QWORD *)(v19 + 96), v89 >= 1))
        {
          v90 = v84 - 1;
          v91 = *(_QWORD *)(v19 + 88);
          v92 = v91 + 104 * v89;
          v93 = *(_QWORD *)(v19 + 128);
          while (1)
          {
            v93 += *(_QWORD *)(v91 + 16);
            if (v93 > v90)
              break;
            v91 += 104;
            if (v91 >= v92)
              goto LABEL_92;
          }
        }
        else
        {
LABEL_92:
          v91 = 0;
        }
        v94 = objc_msgSend(*(id *)(v16 + 16), "hyphenCharacterForGlyphAtIndex:", objc_msgSend(*(id *)(v16 + 16), "glyphRangeForCharacterRange:actualCharacterRange:", *(_QWORD *)(v16 + 40) + *(_QWORD *)(v16 + 48) - 1, 1, 0));
        if (v94 < 0x10000)
        {
          LOWORD(v95) = v94;
          v96 = 1;
        }
        else
        {
          v95 = (v94 >> 10) - 10240;
          characters[1] = v94 & 0x3FF | 0xDC00;
          v96 = 2;
        }
        characters[0] = v95;
        if (CTFontGetGlyphsForCharacters(*(CTFontRef *)(v91 + 8), characters, glyphs, v96) && (v97 = glyphs[0]) != 0)
        {
          *(_DWORD *)(v16 + 88) = glyphs[0];
        }
        else
        {
          v97 = objc_msgSend(*(id *)(v91 + 8), "hyphenGlyphForLocale:", objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"));
          *(_DWORD *)(v16 + 88) = v97;
          if (!(_DWORD)v97)
            goto LABEL_101;
        }
        objc_msgSend(*(id *)(v91 + 8), "advancementForGlyph:", v97);
        *(double *)(v16 + 96) = v98 * *(double *)(v91 + 48);
      }
LABEL_101:
      v99 = *(const __CTLine **)(v16 + 8);
      v100 = *(double *)(v16 + 56);
      v101 = *(double *)(v16 + 64);
      if (!v38)
        break;
      -[NSATSGlyphStorage _resolvePositionalStakeGlyphsForLineFragment:lineFragmentRect:minPosition:maxPosition:maxLineFragmentWidth:breakHint:](v19, v99, (CFIndex *)&v145, a4, a5, a6, a7, v100, v101, 0.0);
LABEL_103:
      *(_QWORD *)(v16 + 48) = v81;
      v39 = v81;
      if (v81)
        goto LABEL_127;
    }
    if (-[NSATSGlyphStorage _resolvePositionalStakeGlyphsForLineFragment:lineFragmentRect:minPosition:maxPosition:maxLineFragmentWidth:breakHint:](v19, v99, (CFIndex *)&v145, a4, a5, a6, a7, v100, v101, v71 + *(double *)(v16 + 80)))
    {
      v102 = *(double *)(v16 + 80);
      v155 = CTLineGetBoundsWithOptions((CTLineRef)*(_QWORD *)(v16 + 8), 0);
      if (v155.size.width + *(double *)(v16 + 96) - v102 < v33)
        goto LABEL_103;
    }
    v103 = CFStringGetRangeOfCharacterClusterAtIndex();
    if (v103 == -1)
      break;
    v105 = v103;
    if (v21 != 1 || v103 > a9)
    {
      CFRelease(*(CFTypeRef *)(v16 + 8));
      *(_QWORD *)(v16 + 8) = 0;
      v144 = 0;
      if (v105 >= a9)
        v81 = v105 - a9;
      else
        v81 = 0;
      goto LABEL_122;
    }
    v106 = *(_QWORD *)(v16 + 72);
    if ((_QWORD)v145 == v106 || (v107 = v103 + v104, v103 + v104 == v106))
    {
      *(_QWORD *)(v16 + 48) = v81;
    }
    else
    {
      CFRelease(*(CFTypeRef *)(v16 + 8));
      *(_QWORD *)(v16 + 8) = 0;
      v144 = 0;
      if (v107 >= a9)
        v81 = v107 - a9;
      else
        v81 = 0;
      v71 = 0.0;
    }
LABEL_121:
    v21 = 1;
LABEL_122:
    v39 = v81;
    v81 = *(_QWORD *)(v16 + 48);
    if (v81)
      goto LABEL_127;
  }
  CFRelease(*(CFTypeRef *)(v16 + 8));
  *(_QWORD *)(v16 + 8) = 0;
  v81 = *(_QWORD *)(v16 + 48);
LABEL_127:
  *(_QWORD *)(v16 + 24) = objc_msgSend(*(id *)(v16 + 16), "glyphRangeForCharacterRange:actualCharacterRange:", *(_QWORD *)(v16 + 40), v81, 0);
  *(_QWORD *)(v16 + 32) = v109;
LABEL_128:
  v26 = v136;
LABEL_129:
  *(_DWORD *)(v16 + 104) = *(_DWORD *)(v16 + 104) & 0xFFFFFFFC | (objc_msgSend(*(id *)(v16 + 16), "_baseWritingDirection", v35) == 1);
  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v16 + 16), "attributedString"), "attribute:atIndex:effectiveRange:", CFSTR("NSAttachment"), *(_QWORD *)(v16 + 40), 0), "embeddingType");
  *(_DWORD *)(v16 + 104) = *(_DWORD *)(v16 + 104) & 0xFFFFFFF7 | (8 * (result == 1));
  if (v26)
  {
    v110 = CTLineGetGlyphRuns(*(CTLineRef *)(v16 + 8));
    result = CFArrayGetCount(v110);
    if (result >= 2)
    {
      v111 = result;
      if ((*(_BYTE *)(v16 + 104) & 3) != 0)
      {
        while (1)
        {
          v112 = v111-- < 1;
          if (v112)
            break;
          ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(v110, v111);
          result = CTRunGetStringRange(ValueAtIndex).location;
          v112 = v23 < result;
          v23 = result;
          if (v112)
            goto LABEL_135;
        }
      }
      else
      {
        v114 = 0;
        while (1)
        {
          v115 = (const __CTRun *)CFArrayGetValueAtIndex(v110, v114);
          result = CTRunGetStringRange(v115).location;
          if (result < v23)
            break;
          ++v114;
          v23 = result;
          if (v111 == v114)
            return result;
        }
LABEL_135:
        *(_DWORD *)(v16 + 104) = *(_DWORD *)(v16 + 104) & 0xFFFFFFFC | 2;
      }
    }
  }
  return result;
}

- (void)_invalidate
{
  const void *v2;

  if (a1)
  {
    *(_DWORD *)(a1 + 104) = 0;
    v2 = *(const void **)(a1 + 8);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(a1 + 8) = 0;
    }
  }
}

- (uint64_t)resolvedLineBreakMode:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    v3 = result;
    v4 = objc_msgSend(*(id *)(result + 16), "_getATSTypesetterGuts");
    if ((*(_BYTE *)(v4 + 84) & 0x10) == 0)
    {
      if (a2)
        return objc_msgSend((id)objc_msgSend(*(id *)(v3 + 16), "currentTextContainer"), "lineBreakMode");
      return ((unint64_t)*(unsigned int *)(*(_QWORD *)(v4 + 40) + 216) >> 11) & 0xF;
    }
    if (a2)
      return ((unint64_t)*(unsigned int *)(*(_QWORD *)(v4 + 40) + 216) >> 11) & 0xF;
    return 0;
  }
  return result;
}

- (unint64_t)getTypographicLineHeight:(double *)a3 baselineOffset:(double *)a4 leading:
{
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  double v24;
  double v25;
  CGFloat v26;
  unint64_t v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  int v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  unint64_t v46;
  uint64_t v47;
  double v48;
  BOOL v49;
  double v50;
  double *v51;
  double *v52;
  double *v53;
  _QWORD *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  _BOOL4 v59;
  _BOOL4 v60;
  double v61;
  double v62;
  int v63;
  int v64;
  int v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  double *v71;
  double *v72;
  double *v73;
  uint64_t v74;
  int v75;
  int v76;
  int v77;
  CGFloat bRect;
  CGFloat v79;
  CGFloat v80;
  NSRect v81;

  if (!result)
    return result;
  v7 = result;
  v8 = objc_msgSend(*(id *)(result + 16), "_getATSTypesetterGuts");
  v69 = *(_QWORD *)(v8 + 40);
  v9 = *(_QWORD **)(v8 + 16);
  v10 = v9[11];
  v11 = v9[12];
  v12 = *(_QWORD *)(v7 + 40);
  v13 = v12 - objc_msgSend(*(id *)(v7 + 16), "paragraphCharacterRange");
  v74 = objc_msgSend(*(id *)(v7 + 16), "typesetterBehavior");
  v77 = objc_msgSend(*(id *)(v7 + 16), "usesFontLeading");
  result = objc_msgSend(*(id *)(v7 + 16), "_forceOriginalFontBaseline");
  v75 = result;
  v72 = a3;
  v73 = a4;
  if (v9[25])
  {
    v14 = v9[26];
    if (v14 <= v13)
      v15 = v9[25];
    else
      v15 = v10;
    if (v14 <= v13)
      v16 = v9[26];
    else
      v16 = 0;
  }
  else
  {
    v16 = 0;
    v15 = v10;
  }
  v17 = v10 + 104 * v11;
  v70 = v9;
  if ((v77 & 1) == 0)
  {
    result = objc_msgSend(*(id *)(v7 + 16), "paragraphSeparatorGlyphRange");
    if (v19)
    {
      v20 = *(_QWORD *)(v7 + 24);
    }
    else
    {
      v20 = *(_QWORD *)(v7 + 24);
      if (*(_QWORD *)(v7 + 32) + v20 >= result)
      {
        v76 = 0;
        goto LABEL_17;
      }
    }
    v76 = 1;
LABEL_17:
    v18 = v20 != 0;
    goto LABEL_18;
  }
  v76 = 0;
  v18 = 0;
LABEL_18:
  v71 = a2;
  if (v15 < v17)
  {
    while (1)
    {
      v21 = *(_QWORD *)(v15 + 16) + v16;
      if (v13 < v21)
        break;
      v15 += 104;
      v16 = v21;
      if (v15 >= v17)
        goto LABEL_23;
    }
  }
  v21 = v16;
LABEL_23:
  v22 = 0.0;
  if (v15 >= v17)
  {
    v24 = 0.0;
    v25 = 0.0;
  }
  else
  {
    v23 = *(_QWORD *)(v7 + 48) + v13;
    v24 = 0.0;
    v25 = 0.0;
    if (v23 > v21)
    {
      v79 = *(double *)(MEMORY[0x1E0CB3438] + 8);
      v80 = *MEMORY[0x1E0CB3438];
      v26 = *(double *)(MEMORY[0x1E0CB3438] + 24);
      bRect = *(double *)(MEMORY[0x1E0CB3438] + 16);
      v27 = v15 + 104;
      do
      {
        v81.origin.y = v79;
        v81.origin.x = v80;
        v81.size.width = bRect;
        v81.size.height = v26;
        result = NSEqualRects(*(NSRect *)(v27 - 40), v81);
        if ((_DWORD)result)
        {
          v28 = *(double *)(v27 - 72);
          v29 = *(double *)(v27 - 64);
        }
        else
        {
          v28 = *(double *)(v27 - 16);
          v29 = v28 + *(double *)(v27 - 32);
        }
        v30 = 0.0;
        if (v76 | v18 | v77)
        {
          result = objc_msgSend(*(id *)(v27 - 96), "isVertical");
          if ((result & 1) == 0)
          {
            v31 = *(void **)(v27 - 104);
            if (!v31)
              goto LABEL_38;
            if (!v75
              || (v32 = (void *)objc_msgSend(*(id *)(v27 - 104), "objectForKey:", _NSOriginalFontAttributeName)) == 0)
            {
              v32 = (void *)objc_msgSend(v31, "objectForKey:", CFSTR("NSFont"));
            }
            result = objc_msgSend((id)objc_msgSend(v31, "objectForKey:", CFSTR("CTVerticalForms")), "BOOLValue");
            if ((_DWORD)result)
            {
              result = objc_msgSend(v32, "verticalFont");
              v32 = (void *)result;
            }
            if (!v32)
            {
LABEL_38:
              result = NSDefaultFont();
              v32 = (void *)result;
            }
            if ((v77 & 1) != 0 || (result = CTFontIsSystemUIFont(), (_DWORD)result))
            {
              if (v32)
              {
                result = objc_msgSend(v32, "_leading");
                v30 = v33;
              }
            }
          }
        }
        if (v18)
        {
          if ((v76 & 1) == 0)
          {
            v34 = v77;
            if (v30 <= 0.0)
              v34 = 1;
            if (!v34)
              v30 = 0.0;
          }
        }
        else if (v30 < 0.0)
        {
          v30 = 0.0;
        }
        v35 = *(double *)(v27 - 48);
        if (v35 <= 0.0)
          v36 = 0.0;
        else
          v36 = *(double *)(v27 - 48);
        v37 = fmin(v30, 0.0) + v29 + v36;
        if (v35 >= 0.0)
          v38 = 0.0;
        else
          v38 = *(double *)(v27 - 48);
        v39 = v29 - v28 + v38;
        if (((v74 < 2) & ~(_BYTE)v77 & (v35 > 0.0)) != 0)
          v40 = *(double *)(v27 - 48);
        else
          v40 = -0.0;
        v41 = v39 + v40;
        if (v39 < v24)
        {
          v24 = v41;
          v39 = v41;
        }
        if (((v74 < 2) & ~(_BYTE)v77 & (v35 < 0.0)) == 0)
          v35 = -0.0;
        v42 = v35 + v37;
        if (v37 > v22)
          v22 = v42;
        if (v30 >= 0.0)
          v43 = v30;
        else
          v43 = 0.0;
        v44 = v43 - v39;
        if (v44 > v25)
          v25 = v44;
        if (v27 >= v17)
          break;
        v21 += *(_QWORD *)(v27 - 88);
        v27 += 104;
      }
      while (v23 > v21);
    }
  }
  v45 = v22 - v24;
  if (v74 < 3)
  {
    v50 = v22 - v24;
    v51 = v72;
    v52 = v73;
    v54 = v70;
    v53 = v71;
    v47 = v69;
    v46 = v7;
  }
  else
  {
    v47 = v69;
    v46 = v7;
    v48 = *(double *)(v69 + 104);
    v49 = v48 <= 0.0;
    v50 = v45 * v48;
    if (v49)
      v50 = v22 - v24;
    else
      v22 = v22 + v50 - v45;
    v51 = v72;
    v52 = v73;
    v54 = v70;
    v53 = v71;
  }
  v55 = *(double *)(v47 + 88);
  v56 = *(double *)(v47 + 96);
  v57 = v55 - v50;
  if (v50 >= v55)
    v57 = -0.0;
  v58 = v22 + v57;
  if (v50 < v55)
    v50 = *(double *)(v47 + 88);
  v59 = v56 > 0.0;
  v60 = v50 > v56;
  v61 = v50 - v56;
  if (!v59 || !v60)
    v61 = 0.0;
  v62 = v58 - v61;
  if (v59 && v60)
    v50 = *(double *)(v47 + 96);
  v63 = HIWORD(*(_DWORD *)(v47 + 216)) & 1;
  if (v50 < v45)
    v63 = 1;
  if (v63)
    v64 = 4;
  else
    v64 = 0;
  *(_DWORD *)(v46 + 104) = v64 | *(_DWORD *)(v46 + 104) & 0xFFFFFFFB;
  *v53 = v62 - v24;
  *v51 = v62;
  *v52 = v24 + v25;
  v65 = v77;
  if (v74 >= 3)
    v65 = 0;
  if (v65 == 1)
  {
    v66 = *(void **)v54[11];
    if (!v66)
      goto LABEL_105;
    if (!v75 || (v67 = (void *)objc_msgSend(v66, "objectForKey:", _NSOriginalFontAttributeName)) == 0)
      v67 = (void *)objc_msgSend(v66, "objectForKey:", CFSTR("NSFont"));
    if (objc_msgSend((id)objc_msgSend(v66, "objectForKey:", CFSTR("CTVerticalForms")), "BOOLValue"))
      v67 = (void *)objc_msgSend(v67, "verticalFont");
    if (!v67)
LABEL_105:
      v67 = (void *)NSDefaultFont();
    result = objc_msgSend(v67, "_leading");
    *(_QWORD *)v52 = v68;
  }
  return result;
}

- (void)saveMorphedGlyphs:(uint64_t)a1
{
  uint64_t v2;
  const __CFArray *GlyphRuns;
  CFIndex Count;
  CFIndex v6;
  int v7;
  BOOL v8;
  uint64_t v9;
  CFIndex v10;
  __CFArray *MutableCopy;
  uint64_t v12;
  unint64_t v13;
  const __CTRun *ValueAtIndex;
  CFIndex location;
  uint64_t GlyphStorage;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned __int16 *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  _QWORD *v47;
  uint64_t v48;
  unsigned __int16 *v49;
  int v50;
  BOOL v51;
  uint64_t v52;
  char v53;
  uint64_t *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unsigned __int16 *v73;
  unint64_t *v74;
  _QWORD *v75;
  char *v76;
  int v77;
  uint64_t v78;
  char v79;
  uint64_t *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  int v86;
  unint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unsigned __int16 *v96;
  __CFArray *v97;
  uint64_t v98;
  uint64_t v99;
  const __CFArray *v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  _DWORD v114[128];
  uint64_t v115;
  CFRange v116;

  v115 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = a1;
    if (*(_QWORD *)(a1 + 8))
    {
      v101 = *(_QWORD *)(objc_msgSend(*(id *)(a1 + 16), "_getATSTypesetterGuts") + 16);
      GlyphRuns = CTLineGetGlyphRuns(*(CTLineRef *)(v2 + 8));
      v112 = 0;
      v113 = 0;
      Count = CFArrayGetCount(GlyphRuns);
      v6 = Count;
      v7 = *(_DWORD *)(v2 + 104) & 3;
      v98 = a2;
      if (v7 == 2)
      {
        MutableCopy = CFArrayCreateMutableCopy(0, Count, GlyphRuns);
        v116.location = 0;
        v116.length = v6;
        CFArraySortValues(MutableCopy, v116, (CFComparatorFunction)__NSATSLineFragmentRunCompare, 0);
        v10 = 0;
        v99 = 1;
        v100 = MutableCopy;
        v97 = MutableCopy;
      }
      else
      {
        v8 = v7 == 1;
        if (v7 == 1)
          v9 = -1;
        else
          v9 = 1;
        v99 = v9;
        v100 = GlyphRuns;
        if (v8)
          v10 = Count - 1;
        else
          v10 = 0;
        v97 = 0;
      }
      v12 = 0;
      v107 = v2;
      v108 = 0;
      v102 = (uint64_t *)(v2 + 32);
      v13 = 0x1EE06F000uLL;
LABEL_13:
      v104 = v12;
      while (v6-- >= 1)
      {
        ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(v100, v10);
        v10 += v99;
        location = CTRunGetStringRange(ValueAtIndex).location;
        GlyphStorage = CTRunGetGlyphStorage();
        v18 = MEMORY[0x18D790F38](GlyphStorage);
        v19 = *(int *)(v13 + 724);
        v20 = *(_DWORD *)(v18 + v19);
        if ((v20 & 1) != 0)
        {
          v21 = v18;
          v22 = *(_QWORD *)(v18 + 152);
          if (!v22)
            v22 = v18;
          v103 = *(_QWORD *)(v22 + 128);
          v23 = *(_QWORD *)(v18 + (int)*MEMORY[0x1E0CA8110]);
          v24 = v112;
          v25 = *(_QWORD *)(v18 + (int)*MEMORY[0x1E0CA8118]);
          v26 = *(_QWORD *)(v18 + (int)*MEMORY[0x1E0CA8120]);
          v27 = *(_QWORD *)(v18 + (int)*MEMORY[0x1E0CA80F8]);
          if (v27)
            v28 = (uint64_t *)(v27 + 8 * v112);
          else
            v28 = 0;
          if ((v20 & 0x10) != 0 || (*(_BYTE *)(v101 + v19) & 0x10) != 0)
          {
            v30 = *(void **)(v2 + 16);
            v31 = v103 + location;
            v32 = v25;
            v33 = v26;
            v94 = v112;
            v34 = v13;
            v35 = v2;
            v36 = v23;
            v37 = objc_msgSend(v30, "glyphRangeForCharacterRange:actualCharacterRange:", v31, 1, 0);
            v23 = v36;
            v2 = v35;
            v13 = v34;
            v24 = v94;
            v26 = v33;
            v25 = v32;
            v29 = v37;
          }
          else
          {
            v29 = *(_QWORD *)(v18 + 112) + v112;
          }
          v38 = (unsigned __int16 *)(v23 + 2 * v24);
          v111 = v29;
          if (v113 == 1 && (*(_BYTE *)(v21 + *(int *)(v13 + 724)) & 8) != 0 && !*v38)
          {
            v95 = v25;
            v39 = v26;
            v40 = objc_msgSend(*(id *)(v2 + 16), "_allowsEllipsisGlyphSubstitution");
            v26 = v39;
            v25 = v95;
            if (v40)
            {
              v114[0] = 0xFFFFFF;
              if (v28 && (v41 = *v28, v41 >= 1))
              {
                if ((unint64_t)v41 < 0x80)
                {
                  v45 = v41 + 1;
                  __memset_chk();
                  v108 = v29;
                  objc_msgSend(*(id *)(v2 + 16), "substituteGlyphsInRange:withGlyphs:", v29, v41 + 1, v114);
                }
                else
                {
                  v42 = v29;
                  v43 = 1;
                  do
                  {
                    v44 = 128 - v43;
                    bzero(&v114[v43], 4 * (128 - v43));
                    objc_msgSend(*(id *)(v2 + 16), "substituteGlyphsInRange:withGlyphs:", v42, 128, v114);
                    v43 = 0;
                    v42 += v44;
                    v41 -= v44;
                  }
                  while ((unint64_t)v41 > 0x80);
                  v108 = v42;
                  __memset_chk();
                  v12 = 0;
                  v45 = v41;
                  if (!v41)
                    goto LABEL_13;
LABEL_155:
                  objc_msgSend(*(id *)(v2 + 16), "substituteGlyphsInRange:withGlyphs:", v108, v41, v114);
                }
              }
              else
              {
                v108 = v29;
                v45 = 1;
                objc_msgSend(*(id *)(v2 + 16), "substituteGlyphsInRange:withGlyphs:", v29, 1, v114);
              }
              v12 = v45;
              goto LABEL_13;
            }
          }
          v46 = (char *)(v25 + 4 * v24);
          v47 = (_QWORD *)(v26 + 8 * v24);
          if ((CTRunGetStatus(ValueAtIndex) & 1) == 0)
          {
            v48 = v104;
            if (v113 < 1)
            {
LABEL_154:
              v45 = 0;
              v41 = v48;
              v12 = 0;
              if (!v41)
                goto LABEL_13;
              goto LABEL_155;
            }
            v49 = &v38[v113];
            v96 = v49;
            while (2)
            {
              v50 = *(_DWORD *)v46;
              if (!v48 || (v50 & 0x40000) != 0)
              {
                v51 = (v50 & 0x220000) != 0 || v28 == 0;
                if (!v51 && *v28 && v48 != 128)
                {
                  if ((v50 & 0x200000) == 0)
                    goto LABEL_48;
LABEL_55:
                  if ((char *)v49 - (char *)v38 < 1)
                  {
                    v52 = 0;
                  }
                  else
                  {
                    v53 = 0;
                    v54 = v28;
                    v55 = v46;
                    do
                    {
                      if ((*(_DWORD *)v55 & 0x200000) == 0)
                        break;
                      if (v54 && (v56 = *v54, ++v54, v56 > 0) || (*(_DWORD *)v55 & 0x60000) != 0)
                        v53 = 1;
                      v55 += 4;
                    }
                    while (v55 < &v46[2 * ((char *)v49 - (char *)v38)]);
                    v57 = v55 - v46;
                    v52 = v57 >> 2;
                    if ((v53 & 1) != 0)
                    {
                      v58 = v48;
                      v59 = v2;
                      v60 = *(_QWORD *)(v2 + 32);
                      __NSDoReordants(*(void **)(v59 + 16), (uint64_t)v38, (uint64_t)v46, (uint64_t)v47, (uint64_t)v28, v103, v57 >> 2, &v111, v102);
                      if (*(_QWORD *)(v59 + 32) <= v60)
                      {
                        v2 = v107;
                        v13 = 0x1EE06F000;
                      }
                      else
                      {
                        v13 = 0x1EE06F000uLL;
                        *(_DWORD *)(v101 + 224) |= 0x10u;
                        v2 = v107;
                      }
                      v48 = v58;
                      v49 = v96;
LABEL_70:
                      v38 += v52;
                      v46 += 4 * v52;
                      v47 += v52;
LABEL_71:
                      v61 = &v28[v52];
                      goto LABEL_72;
                    }
                  }
                  v111 += v52;
                  goto LABEL_70;
                }
              }
              objc_msgSend(*(id *)(v2 + 16), "substituteGlyphsInRange:withGlyphs:", v108);
              v48 = 0;
              v50 = *(_DWORD *)v46;
              if ((*(_DWORD *)v46 & 0x200000) != 0)
                goto LABEL_55;
LABEL_48:
              if ((v50 & 0x20000) != 0)
              {
                if ((v50 & 0x20) != 0)
                {
                  ++v38;
                  v46 += 4;
                  if (v47)
                    ++v47;
                  else
                    v47 = 0;
                  v52 = 1;
                  goto LABEL_71;
                }
                v62 = v48;
                objc_msgSend(*(id *)(v2 + 16), "insertGlyph:atGlyphIndex:characterIndex:", *v38, v111, *v47 + v103);
                v48 = v62;
                *(_DWORD *)(v101 + *(int *)(v13 + 724)) |= 0x10u;
                ++*(_QWORD *)(v2 + 32);
                v50 = *(_DWORD *)v46;
              }
              if ((v50 & 0x40000) != 0)
              {
                v63 = v108;
                if (!v48)
                  v63 = v111;
                v108 = v63;
                v64 = *v38;
                if (v64 == 0xFFFF)
                  v64 = 0;
                v114[v48++] = v64;
                v13 = 0x1EE06F000;
              }
              if (v28)
              {
                v65 = *v28;
                v66 = v111;
                if (*v28 >= 1)
                {
                  v67 = v108;
                  if (!v48)
                    v67 = v111 + 1;
                  v109 = v67;
                  v68 = v65 + v48;
                  v105 = v111;
                  if (v65 + v48 < 0x81)
                  {
                    v71 = v48;
                    v69 = v109;
                  }
                  else
                  {
                    v69 = v67;
                    do
                    {
                      v70 = 128 - v48;
                      bzero(&v114[v48], 4 * (128 - v48));
                      objc_msgSend(*(id *)(v107 + 16), "substituteGlyphsInRange:withGlyphs:", v69, 128, v114);
                      v48 = 0;
                      v71 = 0;
                      v69 += v70;
                      v65 -= v70;
                      v68 = v65;
                    }
                    while (v65 > 0x80);
                  }
                  v108 = v69;
                  bzero(&v114[v71], 4 * v65);
                  v66 = *v28 + v105;
                  v48 = v68;
                  v2 = v107;
                  v13 = 0x1EE06F000;
                }
              }
              else
              {
                v66 = v111;
              }
              v111 = v66 + 1;
              ++v38;
              v46 += 4;
              if (v47)
                ++v47;
              else
                v47 = 0;
              v61 = v28 + 1;
LABEL_72:
              if (v28)
                v28 = v61;
              else
                v28 = 0;
              if (v38 >= v49)
                goto LABEL_154;
              continue;
            }
          }
          v72 = v113 - 1;
          v12 = v104;
          if (v113 < 1)
            goto LABEL_13;
          v73 = &v38[v72];
          if (v28)
            v74 = (unint64_t *)&v28[v72];
          else
            v74 = 0;
          v75 = &v47[v72];
          v76 = &v46[4 * v72];
          while (2)
          {
            v106 = v12;
LABEL_105:
            v77 = *(_DWORD *)v76;
            if ((*(_DWORD *)v76 & 0x200000) == 0)
            {
              if ((v77 & 0x20000) == 0)
              {
                v85 = v111;
                if ((v77 & 0x40000) == 0)
                  goto LABEL_133;
                goto LABEL_130;
              }
              if ((v77 & 0x20) == 0)
              {
                v85 = v111;
                objc_msgSend(*(id *)(v2 + 16), "insertGlyph:atGlyphIndex:characterIndex:", *v73, v111, *v75 + v103);
                v12 = v106;
                ++*(_QWORD *)(v2 + 32);
                *(_DWORD *)(v101 + *(int *)(v13 + 724)) |= 0x10u;
                if ((*(_DWORD *)v76 & 0x40000) == 0)
                  goto LABEL_133;
LABEL_130:
                v86 = *v73;
                if (v86 == 0xFFFF)
                  v86 = 0;
                v114[0] = v86;
                v12 = 1;
LABEL_133:
                if (!v74)
                  goto LABEL_144;
                v110 = v85;
                v87 = *v74;
                if ((uint64_t)*v74 < 1)
                {
                  v85 = v110;
LABEL_144:
                  v88 = v85;
                  if (!v12)
                    goto LABEL_146;
LABEL_145:
                  objc_msgSend(*(id *)(v2 + 16), "substituteGlyphsInRange:withGlyphs:", v88, v12, v114);
                  goto LABEL_146;
                }
                if (v12)
                  v88 = v110;
                else
                  v88 = v110 + 1;
                v89 = v87 + v12;
                if (v87 + v12 < 0x81)
                {
                  v91 = v12;
                }
                else
                {
                  do
                  {
                    v90 = 128 - v12;
                    bzero(&v114[v12], 4 * (128 - v12));
                    objc_msgSend(*(id *)(v107 + 16), "substituteGlyphsInRange:withGlyphs:", v88, 128, v114);
                    v12 = 0;
                    v91 = 0;
                    v88 += v90;
                    v87 -= v90;
                    v89 = v87;
                  }
                  while (v87 > 0x80);
                }
                bzero(&v114[v91], 4 * v87);
                v85 = *v74 + v110;
                v12 = v89;
                v2 = v107;
                if (v12)
                  goto LABEL_145;
LABEL_146:
                v12 = 0;
                v108 = v88;
                v111 = v85 + 1;
                --v73;
                v76 -= 4;
                --v75;
                if (v74)
                  --v74;
                else
                  v74 = 0;
                v13 = 0x1EE06F000;
                if (v73 < v38)
                  goto LABEL_13;
                continue;
              }
              v78 = -1;
              goto LABEL_124;
            }
            break;
          }
          if ((char *)v73 - (char *)v38 < 0)
          {
            v83 = 0;
          }
          else
          {
            v79 = 0;
            v80 = (uint64_t *)v74;
            v81 = v76;
            do
            {
              if ((*(_DWORD *)v81 & 0x200000) == 0)
                break;
              if (v80 && (v82 = *v80, --v80, v82 > 0) || (*(_DWORD *)v81 & 0x60000) != 0)
                v79 = 1;
              v81 -= 4;
            }
            while (v81 >= &v76[-2 * ((char *)v73 - (char *)v38)]);
            v83 = (v76 - v81) >> 2;
            if ((v79 & 1) != 0)
            {
              v84 = *(_QWORD *)(v2 + 32);
              v78 = -v83;
              __NSDoReordants(*(void **)(v2 + 16), (uint64_t)v73, (uint64_t)v76, (uint64_t)v75, (uint64_t)v74, v103, -v83, &v111, v102);
              if (*(_QWORD *)(v2 + 32) <= v84)
              {
                v2 = v107;
                v13 = 0x1EE06F000;
              }
              else
              {
                v13 = 0x1EE06F000uLL;
                *(_DWORD *)(v101 + 224) |= 0x10u;
                v2 = v107;
              }
              v12 = v106;
LABEL_124:
              v73 += v78;
              v76 += 4 * v78;
              if (v74)
                v74 += v78;
              else
                v74 = 0;
              v75 += v78;
              if (v73 < v38)
                goto LABEL_13;
              goto LABEL_105;
            }
          }
          v111 += v83;
          v78 = -v83;
          goto LABEL_124;
        }
      }
      v92 = *(unsigned int *)(v2 + 88);
      v93 = *(_QWORD *)(v2 + 32);
      if ((_DWORD)v92)
      {
        objc_msgSend(*(id *)(v2 + 16), "insertGlyph:atGlyphIndex:characterIndex:", v92, v93 + *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 40) + *(_QWORD *)(v2 + 48) - 1);
        *(_DWORD *)(v101 + *(int *)(v13 + 724)) |= 0x10u;
        v93 = *(_QWORD *)(v2 + 32) + 1;
        *(_QWORD *)(v2 + 32) = v93;
      }
      if (*(_QWORD *)(v98 + 8) < v93)
        *(_QWORD *)(v98 + 8) = v93;
      if (v97)
        CFRelease(v97);
    }
  }
}

- (unint64_t)_charIndexToBreakLineByWordWrappingAtIndex:(char *)a3 lineFragmentWidth:(double)a4 hyphenate:
{
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  float v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  float v21;
  unsigned __int8 v22;
  int v23;
  char v24;
  int v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  int v31;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  int v41;
  unint64_t v42;
  BOOL v45;
  void *v46;
  char v47;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  __CFString *theString;
  void *v56;
  _QWORD v57[5];
  _QWORD v58[6];

  if (!a1)
    return 0;
  v7 = a1;
  v8 = (void *)objc_msgSend(*(id *)(a1 + 16), "paragraphArbitrator");
  v9 = *(_QWORD *)(v7 + 40);
  v10 = *(void **)(v7 + 16);
  if (v8)
  {
    objc_msgSend(v8, "setLineBreakStrategy:", objc_msgSend(v10, "lineBreakStrategy"));
    objc_msgSend(*(id *)(v7 + 16), "hyphenationFactorForGlyphAtIndex:", *(_QWORD *)(v7 + 24));
    objc_msgSend(v8, "setHyphenationFactor:", v11);
    v12 = MEMORY[0x1E0C809B0];
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __92__NSATSLineFragment__charIndexToBreakLineByWordWrappingAtIndex_lineFragmentWidth_hyphenate___block_invoke;
    v58[3] = &unk_1E2603460;
    v58[4] = v7;
    objc_msgSend(v8, "setValidateLineBreakContext:", v58);
    v57[0] = v12;
    v57[1] = 3221225472;
    v57[2] = __92__NSATSLineFragment__charIndexToBreakLineByWordWrappingAtIndex_lineFragmentWidth_hyphenate___block_invoke_2;
    v57[3] = &unk_1E2603488;
    v57[4] = v7;
    objc_msgSend(v8, "setLineWidth:", v57);
    objc_msgSend(v8, "setAttributedString:", objc_msgSend(*(id *)(v7 + 16), "attributedString"));
    v13 = objc_msgSend(*(id *)(v7 + 16), "paragraphCharacterRange");
    objc_msgSend(v8, "setParagraphRange:", v13, v14);
    objc_msgSend(v8, "setTypesetterBehavior:", objc_msgSend(*(id *)(v7 + 16), "typesetterBehavior"));
    objc_msgSend(v8, "lineBreakContextBeforeIndex:lineFragmentWidth:range:", a2, v9, a2 - v9, a4);
    objc_msgSend(v8, "resetBreaker");
    objc_msgSend(v8, "reset");
    *a3 = 0;
    return 0;
  }
  v49 = a3;
  v50 = objc_msgSend(v10, "_getATSTypesetterGuts");
  v16 = (void *)objc_msgSend(*(id *)(v7 + 16), "attributedString");
  theString = (__CFString *)objc_msgSend(v16, "string");
  v17 = objc_msgSend(*(id *)(v7 + 16), "paragraphCharacterRange");
  v19 = v18;
  objc_msgSend(*(id *)(v7 + 16), "hyphenationFactorForGlyphAtIndex:", *(_QWORD *)(v7 + 24));
  v21 = v20;
  v22 = objc_msgSend(*(id *)(v7 + 16), "lineBreakStrategy");
  v56 = v16;
  v53 = objc_msgSend(v16, "methodForSelector:", sel_lineBreakBeforeIndex_withinRange_);
  v51 = v7;
  v52 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", sel_lineBreakBeforeIndex_withinRange_);
  v23 = 0;
  v24 = 0;
  v25 = v22 & (v9 == v17);
  v26 = v17 + v19;
  v54 = a2 - v9;
  do
  {
    v27 = a2 - 1;
    if (a2 < 1 || CFStringGetCharacterAtIndex(theString, a2 - 1) != 9)
    {
      if (v53 == v52)
        v28 = objc_msgSend(v56, "_lineBreakBeforeIndex:withinRange:lineBreakStrategy:", a2, v9, v54, objc_msgSend(*(id *)(v7 + 16), "lineBreakStrategy"));
      else
        v28 = objc_msgSend(v56, "lineBreakBeforeIndex:withinRange:", a2, v9, v54);
      v27 = v28;
    }
    v29 = v27 < v9 || v27 == 0x7FFFFFFFFFFFFFFFLL;
    if (!v29 && v27 < a2)
      v15 = v27;
    else
      v15 = v9;
    if (v15 - v9 > 0x1D)
      v31 = v25;
    else
      v31 = 0;
    if (v31 == 1 && (uint64_t)v15 < a2 && v26 - v15 <= 5)
    {
      v34 = v26;
      v35 = objc_msgSend(v56, "nextWordFromIndex:forward:", v15, 1);
      if (v34 > v35)
      {
        v36 = objc_msgSend(v56, "string");
        v37 = objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
        v38 = (void *)v36;
        v7 = v51;
        objc_msgSend(v38, "rangeOfCharacterFromSet:options:range:", v37, 0, v35, v34 - v35);
        if (!v39)
          v35 = v34;
      }
      v29 = v35 == v34;
      v26 = v34;
      if (v29)
      {
        v40 = v15 - (v15 == a2);
        if (v40 > v9)
          goto LABEL_62;
      }
    }
    if (v15 > v9)
      v23 |= -[__CFString characterAtIndex:](theString, "characterAtIndex:", v15 - 1) == 173;
    if (v21 <= 0.0)
    {
      v41 = 0;
    }
    else
    {
      if (!((v15 <= v9) | v24 & 1)
        && ((v23 & 1) != 0 || -[NSATSGlyphStorage _widthForStringRange:](*(_QWORD *)(v50 + 16), v9, v15 - v9) / a4 < v21))
      {
        v24 = 1;
LABEL_46:
        v42 = objc_msgSend(v56, "lineBreakByHyphenatingBeforeIndex:withinRange:", a2, v9, v54);
        v45 = v42 != 0x7FFFFFFFFFFFFFFFLL && v42 > v9 && v42 < a2;
        v41 = v45 && v15 != v42;
        if (v41)
          v15 = v42;
        goto LABEL_57;
      }
      if (v24 & 1 | (v15 == v9))
        goto LABEL_46;
      v41 = 0;
      v24 = 0;
    }
LABEL_57:
    v46 = *(void **)(v7 + 16);
    if (((v23 | v41) & 1) != 0)
    {
      if ((objc_msgSend(v46, "shouldBreakLineByHyphenatingBeforeCharacterAtIndex:", v15) & 1) != 0)
      {
        v47 = 1;
        goto LABEL_64;
      }
    }
    else if ((objc_msgSend(v46, "shouldBreakLineByWordBeforeCharacterAtIndex:", v15) & 1) != 0)
    {
      break;
    }
    v40 = v15 - (v15 == a2);
LABEL_62:
    a2 = v40;
  }
  while (v40 > v9);
  v47 = 0;
LABEL_64:
  *v49 = v47;
  return v15;
}

- (void)saveWithGlyphOrigin:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const __CFArray *GlyphRuns;
  CFIndex Count;
  unint64_t v11;
  CFIndex v12;
  CFIndex v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  CFIndex v20;
  const __CTRun *ValueAtIndex;
  double v22;
  double v23;
  double v24;
  double v25;
  CFRange StringRange;
  uint64_t GlyphStorage;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v34;
  CFIndex v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _BYTE *v54;
  _QWORD *v55;
  unint64_t v56;
  char v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  const __CFArray *v62;
  CFIndex v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _BYTE v67[9];
  _BYTE v68[128];
  _BYTE v69[1024];
  uint64_t v70;
  NSRect v71;

  v70 = *MEMORY[0x1E0C80C00];
  if (!a1 || !*(_QWORD *)(a1 + 8))
    return;
  v4 = objc_msgSend(*(id *)(a1 + 16), "_getATSTypesetterGuts");
  v61 = *(_QWORD *)(v4 + 16);
  v65 = objc_msgSend(*(id *)(a1 + 16), "_bidiLevels");
  v67[8] = 0;
  v6 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 16), "lineFragmentPadding");
  v64 = v7;
  v8 = *(_DWORD *)(*(_QWORD *)(v4 + 40) + 216);
  *(_QWORD *)v67 = *(_DWORD *)(a1 + 88) != 0;
  GlyphRuns = CTLineGetGlyphRuns(*(CTLineRef *)(a1 + 8));
  Count = CFArrayGetCount(GlyphRuns);
  v66 = a1;
  *(float64x2_t *)(a1 + 56) = vaddq_f64((float64x2_t)vdupq_lane_s64(v64, 0), *(float64x2_t *)(a1 + 56));
  v63 = Count;
  if (Count <= 0)
    goto LABEL_57;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v59 = v8;
  v14 = *(double *)&v64 + a2;
  v15 = *MEMORY[0x1E0CB3438];
  v16 = *(double *)(MEMORY[0x1E0CB3438] + 8);
  v17 = *(double *)(MEMORY[0x1E0CB3438] + 16);
  v18 = *(double *)(MEMORY[0x1E0CB3438] + 24);
  v60 = v5 + v6 - 1;
  v19 = 0.0;
  v62 = GlyphRuns;
  v20 = Count;
  do
  {
    ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, v12);
    CTRunGetInitialAdvance();
    v23 = v22;
    v25 = v24;
    StringRange = CTRunGetStringRange(ValueAtIndex);
    GlyphStorage = CTRunGetGlyphStorage();
    v28 = MEMORY[0x18D790F38](GlyphStorage);
    v29 = v28;
    v30 = *(_QWORD *)(v28 + 88);
    v31 = v30 + 104 * *(_QWORD *)(v28 + 96);
    if (v30 > v11 || v11 >= v31 || v13 > StringRange.location)
    {
      v11 = *(_QWORD *)(v28 + 200);
      if (!v11 || (v13 = *(_QWORD *)(v28 + 208), v13 > StringRange.location))
      {
        v34 = *(_QWORD *)(v28 + 152);
        if (v34)
          v13 = *(_QWORD *)(v28 + 128) - *(_QWORD *)(v34 + 128);
        else
          v13 = 0;
        v11 = *(_QWORD *)(v28 + 88);
      }
    }
    v14 = v14 + v23;
    v19 = v19 + v25;
    if (v11 && v11 < v31)
    {
      while (1)
      {
        v35 = *(_QWORD *)(v11 + 16) + v13;
        if (StringRange.location < v35)
          break;
        v11 += 104;
        v13 = v35;
        if (v11 >= v31)
          goto LABEL_24;
      }
      v36 = *(_QWORD *)(v28 + (int)*MEMORY[0x1E0CA8100]);
      if ((*(_BYTE *)(v28 + 224) & 0x10) != 0 || (*(_BYTE *)(v61 + 224) & 0x10) != 0)
      {
        v39 = (void *)objc_msgSend(*(id *)(v66 + 16), "layoutManager");
        v40 = *(_QWORD *)(v29 + 152);
        if (!v40)
          v40 = v29;
        v37 = objc_msgSend(v39, "_exactGlyphRangeForCharacterRange:", *(_QWORD *)(v40 + 128) + StringRange.location, StringRange.length);
        v38 = v41;
      }
      else
      {
        v37 = *(_QWORD *)(v28 + 112) + *(_QWORD *)&v67[1];
        v38 = 0;
      }
      v71.origin.x = v15;
      v71.origin.y = v16;
      v71.size.width = v17;
      v71.size.height = v18;
      if (!NSEqualRects(*(NSRect *)(v11 + 64), v71))
      {
        v42 = *(double *)(v11 + 72);
        objc_msgSend(*(id *)(v66 + 16), "setAttachmentSize:forGlyphRange:", v37, 1, *(double *)(v11 + 80), *(double *)(v11 + 88));
        objc_msgSend(*(id *)(v66 + 16), "setNotShownAttribute:forGlyphRange:", 1, v37, 1);
        objc_msgSend(*(id *)(v66 + 16), "setLocation:withAdvancements:forStartOfGlyphRange:", 0, v37, 1, v14, v19 + v42 + *(double *)(v11 + 56));
        v14 = v14 + *(double *)(v36 + 16 * *(_QWORD *)&v67[1]);
LABEL_41:
        GlyphRuns = v62;
        v20 = v63;
        goto LABEL_25;
      }
      if ((*(_BYTE *)(v29 + 224) & 8) != 0)
      {
        v67[0] = 1;
        objc_msgSend((id)objc_msgSend(*(id *)(v66 + 16), "layoutManager"), "setEllipsisGlyphAttribute:forGlyphAtIndex:", 1, v37);
      }
      if (v65 && (*(_BYTE *)(v29 + 224) & 8) == 0 && (CTRunGetStatus(ValueAtIndex) & 1) != 0)
      {
        v67[0] = 1;
        if (*(_DWORD *)(v66 + 88) && v38 + v37 - 1 == v60)
        {
          objc_msgSend(*(id *)(v66 + 16), "setLocation:withAdvancements:forStartOfGlyphRange:", 0, v14, v19 + *(double *)(v11 + 56));
          v14 = v14 + *(double *)(v66 + 96);
        }
        goto LABEL_41;
      }
      GlyphRuns = v62;
      v20 = v63;
      if (*(_DWORD *)(v66 + 88) && v37 == v60)
      {
        objc_msgSend(*(id *)(v66 + 16), "setLocation:withAdvancements:forStartOfGlyphRange:", 0, v14, v19 + *(double *)(v11 + 56));
        v14 = v14 + *(double *)(v66 + 96);
      }
    }
    else
    {
      v35 = v13;
LABEL_24:
      NSLog((NSString *)CFSTR("NSATSGlyphStorage inconsistency. Cannot find run storage for character range {%ld %ld} for CTRun %p. Ignoring the run..."), StringRange.location, StringRange.length, ValueAtIndex);
      v11 = 0;
      v13 = v35;
    }
LABEL_25:
    ++v12;
  }
  while (v12 != v20);
  if (v29 && !v67[0] && (*(_BYTE *)(v29 + 224) & 1) != 0 && (*(_QWORD *)(v29 + 152) || (v59 & 0x20000) != 0))
    v67[0] = 1;
LABEL_57:
  if (v65)
  {
    v44 = objc_msgSend(*(id *)(v66 + 16), "paragraphCharacterRange");
    v46 = v44;
    v47 = *(_QWORD *)(v66 + 32);
    if (*(_QWORD *)(v66 + 48) == v47)
    {
      objc_msgSend(*(id *)(v66 + 16), "setBidiLevels:forGlyphRange:", v65 + *(_QWORD *)(v66 + 40) - v44, *(_QWORD *)(v66 + 24));
    }
    else
    {
      v48 = *(_QWORD *)(v66 + 24);
      v49 = v48 + v47;
      if (v48 < v48 + v47)
      {
        v50 = v45;
        do
        {
          if (v49 - v48 >= 0x80)
            v51 = 128;
          else
            v51 = v49 - v48;
          v52 = objc_msgSend(*(id *)(v66 + 16), "getGlyphsInRange:glyphs:properties:characterIndexes:bidiLevels:", v48, v51, 0, 0, v69, v68);
          v53 = v52;
          if (v52 >= 1)
          {
            v54 = v68;
            v55 = v69;
            do
            {
              v56 = *v55 - v46;
              if (*v55 < v46 || v56 >= v50)
                v58 = 0;
              else
                v58 = *(_BYTE *)(v65 + v56);
              *v54++ = v58;
              ++v55;
            }
            while (v54 < &v68[v52]);
          }
          objc_msgSend(*(id *)(v66 + 16), "setBidiLevels:forGlyphRange:", v68, v48, v52);
          v48 += v53;
        }
        while (v48 < v49);
      }
    }
  }
  if ((*(_BYTE *)(v66 + 104) & 4) != 0)
    objc_msgSend(*(id *)(v66 + 16), "setDrawsOutsideLineFragment:forGlyphRange:", 1, *(_QWORD *)(v66 + 24), *(_QWORD *)(v66 + 32));
  if (v67[0])
    objc_msgSend(*(id *)(v66 + 16), "setHardInvalidation:forGlyphRange:", 1, *(_QWORD *)(v66 + 24), *(_QWORD *)(v66 + 32));
}

- (uint64_t)_copyRenderingContextWithGlyphOrigin:(uint64_t)result
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  CFTypeID v6;
  const __CTLine *v7;
  CFArrayRef GlyphRuns;
  CGRect BoundsWithOptions;

  if (result)
  {
    v3 = result;
    v4 = objc_allocWithZone((Class)NSLineFragmentRenderingContext);
    v5 = objc_msgSend(*(id *)(v3 + 16), "_textStorageForAttachmentProtocol");
    v6 = CFGetTypeID(*(CFTypeRef *)(v3 + 8));
    v7 = *(const __CTLine **)(v3 + 8);
    if (v6 == __CFArrayTypeID)
    {
      GlyphRuns = *(CFArrayRef *)(v3 + 8);
    }
    else
    {
      GlyphRuns = CTLineGetGlyphRuns(v7);
      v7 = *(const __CTLine **)(v3 + 8);
    }
    BoundsWithOptions = CTLineGetBoundsWithOptions(v7, 0);
    return objc_msgSend(v4, "initWithTextStorage:runs:glyphOrigin:lineFragmentWidth:elasticWidth:usesScreenFonts:isRTL:applicationFrameworkContext:", v5, GlyphRuns, objc_msgSend(*(id *)(v3 + 16), "_usesScreenFonts"), objc_msgSend(*(id *)(v3 + 16), "_baseWritingDirection") == 1, objc_msgSend(*(id *)(v3 + 16), "applicationFrameworkContext"), a2, *(double *)(v3 + 96) + BoundsWithOptions.size.width, *(double *)(v3 + 80));
  }
  return result;
}

- (void)justifyWithFactor:(uint64_t)a1
{
  double v4;
  double v5;
  uint64_t JustifiedLineWithOptions;
  uint64_t v7;
  CGRect BoundsWithOptions;

  if (a1)
  {
    v4 = *(double *)(a1 + 64) - *(double *)(a1 + 56);
    v5 = *(double *)(a1 + 80);
    BoundsWithOptions = CTLineGetBoundsWithOptions((CTLineRef)*(_QWORD *)(a1 + 8), 0);
    if (BoundsWithOptions.size.width + *(double *)(a1 + 96) - v5 < v4 * a2)
    {
      JustifiedLineWithOptions = CTLineCreateJustifiedLineWithOptions();
      if (JustifiedLineWithOptions)
      {
        v7 = JustifiedLineWithOptions;
        CFRelease(*(CFTypeRef *)(a1 + 8));
        *(_QWORD *)(a1 + 8) = v7;
        *(_QWORD *)(a1 + 72) = *(_QWORD *)(a1 + 48) + *(_QWORD *)(a1 + 40);
        *(_QWORD *)(a1 + 80) = 0;
      }
    }
  }
}

double __92__NSATSLineFragment__charIndexToBreakLineByWordWrappingAtIndex_lineFragmentWidth_hyphenate___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[NSATSGlyphStorage _widthForStringRange:](*(_QWORD *)(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "_getATSTypesetterGuts") + 16), a2, a3);
}

- (void)dealloc
{
  objc_super v3;

  -[NSATSLineFragment _invalidate]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)NSATSLineFragment;
  -[NSATSLineFragment dealloc](&v3, sel_dealloc);
}

- (void)finalize
{
  objc_super v3;

  -[NSATSLineFragment _invalidate]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)NSATSLineFragment;
  -[NSATSLineFragment finalize](&v3, sel_finalize);
}

@end
