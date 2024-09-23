@implementation NSLayoutManager

- (void)_fillLayoutHoleForCharacterRange:(_NSRange)a3 desiredNumberOfLines:(unint64_t)a4 isSoft:(BOOL)a5
{
  NSUInteger length;
  NSUInteger location;
  _QWORD *extraData;
  void *v11;
  unint64_t *v12;
  _BOOL4 v14;
  __lmFlags lmFlags;
  NSTextContainer *extraLineFragmentContainer;
  char *v17;
  __lmFlags v18;
  NSUInteger v19;
  NSUInteger v20;
  int64_t v21;
  uint64_t v22;
  unint64_t firstUnlaidGlyphIndex;
  unint64_t v24;
  NSRunStorage *containerRuns;
  unint64_t v26;
  unint64_t v27;
  NSRange v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  int64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  int v45;
  __int128 v46;
  id v47;
  uint64_t v48;
  unint64_t v49;
  NSRunStorage *v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  double v55;
  double v56;
  char *v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  __lmFlags v61;
  int v62;
  unint64_t v63;
  NSRunStorage *v64;
  unint64_t v65;
  unint64_t v66;
  CFDictionaryRef v67;
  CFDictionaryRef *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  unint64_t v75;
  void *v76;
  void *v77;
  int v78;
  char *v79;
  void *v80;
  void *v81;
  int v82;
  unint64_t v83;
  NSRunStorage *v84;
  unint64_t v85;
  unint64_t v86;
  CFDictionaryRef v87;
  unint64_t v88;
  CFDictionaryRef *v89;
  int ValueIfPresent;
  uint64_t v91;
  int64_t v92;
  char v93;
  NSTextContainer *v94;
  CFDictionaryRef *v96;
  int v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  int v103;
  unint64_t v104;
  unint64_t v105;
  unint64_t v106;
  NSRunStorage *v107;
  unint64_t v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  void *v114;
  NSRunStorage *v115;
  unint64_t v116;
  unint64_t v117;
  void *v118;
  unint64_t v119;
  char *v120;
  char *v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  char *v134;
  char *v135;
  uint64_t v136;
  unint64_t v137;
  char v138;
  int64_t v139;
  int64_t v140;
  uint64_t v141;
  _BYTE *v142;
  int v143;
  uint64_t v144;
  void *v145;
  unint64_t v146;
  _BOOL4 v147;
  NSUInteger range2;
  BOOL v149;
  __n128 v150;
  void *value[2];
  char *v152;
  _QWORD v153[2];
  NSRange v154;
  NSRange v155;

  length = a3.length;
  location = a3.location;
  range2 = -[NSTextStorage length](self->_textStorage, "length");
  v152 = 0;
  v153[0] = 0;
  extraData = self->_extraData;
  v149 = -[NSAttributedString _isStringDrawingTextStorage](-[NSLayoutManager textStorage](self, "textStorage"), "_isStringDrawingTextStorage");
  if (!v149 && !extraData[7])
  {
    v11 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB38E0], "allocWithZone:", -[NSLayoutManager zone](self, "zone")), "init");
    v12 = extraData + 7;
    while (!__ldaxr(v12))
    {
      if (!__stlxr((unint64_t)v11, v12))
        goto LABEL_8;
    }
    __clrex();

  }
LABEL_8:
  objc_msgSend((id)extraData[7], "lock");
  v14 = -[NSTextStorage _lockForReading](self->_textStorage, "_lockForReading");
  if (!a5
    && (*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0
    && self->_firstTextView
    && !*((_QWORD *)self->_extraData + 45))
  {
    -[NSLayoutManager _noteFirstTextViewVisibleCharacterRangeIfAfterIndex:](self, "_noteFirstTextViewVisibleCharacterRangeIfAfterIndex:", location);
  }
  if ((*(_DWORD *)&self->_lmFlags & 0x30000) == 0x10000
    && -[NSTextStorage _isEditing](self->_textStorage, "_isEditing"))
  {
    if (v14)
      -[NSTextStorage _unlock](self->_textStorage, "_unlock");
    if (!v149)
      objc_msgSend(*((id *)self->_extraData + 7), "unlock");
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@ *** attempted layout while textStorage is editing.  It is not valid to cause the layoutManager to do layout while the textStorage is editing (ie the textStorage has been sent a beginEditing message without a matching endEditing.)"), _NSFullMethodName());
  }
  lmFlags = self->_lmFlags;
  if ((*(_BYTE *)&lmFlags & 8) == 0)
  {
    ++self->_textViewResizeDisableStack;
    lmFlags = self->_lmFlags;
  }
  if ((*(_WORD *)&lmFlags & 0x2000) == 0)
    goto LABEL_23;
  extraLineFragmentContainer = self->_extraLineFragmentContainer;
  if (extraLineFragmentContainer)
    goto LABEL_25;
  if (self->_firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL
    || (firstUnlaidGlyphIndex = self->_firstUnlaidGlyphIndex, firstUnlaidGlyphIndex == 0x7FFFFFFFFFFFFFFFLL))
  {
    -[NSLayoutManager getFirstUnlaidCharacterIndex:glyphIndex:](self, "getFirstUnlaidCharacterIndex:glyphIndex:", 0, v153);
    firstUnlaidGlyphIndex = v153[0];
    if (v153[0])
      goto LABEL_35;
LABEL_73:
    extraLineFragmentContainer = (NSTextContainer *)*((_QWORD *)self->_extraData + 10);
    goto LABEL_25;
  }
  v153[0] = self->_firstUnlaidGlyphIndex;
  if (!firstUnlaidGlyphIndex)
    goto LABEL_73;
LABEL_35:
  if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    extraLineFragmentContainer = (NSTextContainer *)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
  }
  else
  {
    v24 = firstUnlaidGlyphIndex - 1;
    if (-[NSRunStorage count](self->_containerRuns, "count") <= firstUnlaidGlyphIndex - 1)
    {
LABEL_23:
      extraLineFragmentContainer = 0;
      goto LABEL_25;
    }
    containerRuns = self->_containerRuns;
    _NSBlockNumberForIndex(containerRuns, v24, 0);
    v27 = 0;
    if (containerRuns->_gapBlockIndex <= v26)
      v27 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
    extraLineFragmentContainer = *(NSTextContainer **)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8)
                                                                                * (v27 + v26)];
  }
LABEL_25:
  v147 = v14;
  v17 = (char *)-[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", location, 1, 0);
  v18 = self->_lmFlags;
  if ((*(_BYTE *)&v18 & 1) == 0)
  {
    if ((*(_DWORD *)&v18 & 0x8000000) != 0)
    {
      if (objc_msgSend(*((id *)self->_extraData + 23), "count"))
      {
        v19 = range2 - location;
        v20 = location;
      }
      else
      {
        v154.location = location;
        v154.length = length;
        v155.location = 0;
        v155.length = range2;
        v28 = NSIntersectionRange(v154, v155);
        v20 = v28.location;
        v19 = v28.length;
      }
      -[NSLayoutManager _invalidateGlyphsForExtendedCharacterRange:changeInLength:includeBlocks:](self, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:includeBlocks:", v20, v19, 0, 0);
    }
    v29 = -[NSTypesetter layoutCharactersInRange:forLayoutManager:maximumNumberOfLineFragments:](-[NSLayoutManager typesetter](self, "typesetter"), "layoutCharactersInRange:forLayoutManager:maximumNumberOfLineFragments:", location, length, self, a4);
    v31 = v30;
    v137 = v29;
    v32 = -[NSLayoutManager _primitiveGlyphRangeForCharacterRange:](self, "_primitiveGlyphRangeForCharacterRange:");
    v21 = v33;
    v142 = (_BYTE *)v32;
    v152 = (char *)(v32 + v33);
    v136 = v31;
    if (v17 == (char *)(v32 + v33) && (v34 = self->_extraData, (unint64_t)v17 < *(_QWORD *)(v34[26] + 8)))
    {
      *(_OWORD *)value = xmmword_18D6CBB80;
      if (v34[23])
      {
        v35 = v33;
        v36 = (void *)objc_msgSend((id)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), location, 0), "textBlocks");
        if (v36 && (v37 = v36, objc_msgSend(v36, "count")))
        {
          v38 = (void *)objc_msgSend(v37, "objectAtIndex:", 0);
          objc_opt_class();
          v145 = v38;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v39 = -[NSAttributedString _rangeOfTextTableRow:atIndex:](self->_textStorage, "_rangeOfTextTableRow:atIndex:", objc_msgSend(v38, "table"), location);
            v41 = v40;
            v42 = (void *)-[NSLayoutManager _primitiveGlyphRangeForCharacterRange:](self, "_primitiveGlyphRangeForCharacterRange:", v39, v40);
            v44 = v39;
            value[0] = v42;
            value[1] = v43;
          }
          else
          {
            v41 = 0;
            v44 = 0x7FFFFFFFFFFFFFFFLL;
            v43 = value[1];
          }
          v21 = v35;
          if (!v43)
          {
            -[NSLayoutManager layoutRectForTextBlock:atIndex:effectiveRange:](self, "layoutRectForTextBlock:atIndex:effectiveRange:", v145, location, value);
            if (value[1])
            {
              v44 = -[NSLayoutManager _primitiveCharacterRangeForGlyphRange:](self, "_primitiveCharacterRangeForGlyphRange:", value[0]);
              v41 = v110;
            }
            else
            {
              v111 = -[NSAttributedString rangeOfTextBlock:atIndex:](self->_textStorage, "rangeOfTextBlock:atIndex:", v145, location);
              v41 = v112;
              v113 = (void *)-[NSLayoutManager _primitiveGlyphRangeForCharacterRange:](self, "_primitiveGlyphRangeForCharacterRange:", v111, v112);
              v44 = v111;
              v21 = v35;
              value[0] = v113;
              value[1] = v114;
            }
          }
        }
        else
        {
          v41 = 0;
          v44 = 0x7FFFFFFFFFFFFFFFLL;
          v21 = v35;
        }
      }
      else
      {
        v41 = 0;
        v44 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v44 && v41 && value[1] && v17 > value[0])
      {
        v141 = v44;
        v150 = 0uLL;
        if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
        {
          v146 = (unint64_t)(v17 - 1);
          v150.n128_u64[1] = *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8);
          v118 = (void *)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
          if (v118)
            goto LABEL_237;
        }
        else if (-[NSRunStorage count](self->_containerRuns, "count") > (unint64_t)(v17 - 1))
        {
          v115 = self->_containerRuns;
          v146 = (unint64_t)(v17 - 1);
          _NSBlockNumberForIndex(v115, (unint64_t)(v17 - 1), &v150);
          v117 = v115->_gapBlockIndex <= v116 ? v115->_maxBlocks - v115->_numBlocks : 0;
          v118 = *(void **)&v115->_runs->var1[(v115->_elementSize + 8) * (v117 + v116)];
          if (v118)
          {
LABEL_237:
            v119 = v150.n128_u64[0];
            if ((void *)v150.n128_u64[0] == value[0])
            {
              v140 = v21;
              v120 = (char *)value[1];
              v121 = (char *)value[1] + v150.n128_u64[0] - (_QWORD)v17;
              v122 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v146, 0);
              v124 = v123;
              v126 = v125;
              v128 = v127;
              objc_msgSend(v118, "size");
              v130 = 10000000.0;
              if (v129 > 0.0)
                v130 = v129;
              v131 = v124 + v128;
              v132 = v130 - v131;
              if (v132 >= 0.0)
                v133 = v132;
              else
                v133 = 0.0;
              -[NSLayoutManager setTextContainer:forGlyphRange:](self, "setTextContainer:forGlyphRange:", v118, v17, v121);
              -[NSLayoutManager setLineFragmentRect:forGlyphRange:usedRect:](self, "setLineFragmentRect:forGlyphRange:usedRect:", v17, v121, v122, v131, v126, v133, v122, v131, v126, v133);
              -[NSLayoutManager setLocation:forStartOfGlyphRange:](self, "setLocation:forStartOfGlyphRange:", v17, v121, *MEMORY[0x1E0CB3430], *(double *)(MEMORY[0x1E0CB3430] + 8));
              v134 = &v120[v119];
              if (v17 < v134)
              {
                v135 = v17;
                do
                  -[NSLayoutManager setNotShownAttribute:forGlyphAtIndex:](self, "setNotShownAttribute:forGlyphAtIndex:", 1, v135++);
                while (v134 != v135);
              }
              v41 = 0;
              v152 = v134;
              v141 = 0x7FFFFFFFFFFFFFFFLL;
              v21 = v140;
            }
          }
        }
LABEL_51:
        v144 = v41;
        if (-[NSLayoutManager hasNonContiguousLayout](self, "hasNonContiguousLayout"))
          v45 = !-[NSLayoutManager isScrolling](self, "isScrolling");
        else
          v45 = 1;
        v143 = v45;
        goto LABEL_55;
      }
      v41 = 0;
      *(_DWORD *)&self->_lmFlags |= 1u;
    }
    else
    {
      v41 = 0;
    }
    v141 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_51;
  }
  if ((*(_BYTE *)(*((_QWORD *)self->_extraData + 26) + 56) & 1) != 0)
    _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, (unint64_t)v17, 0x9C4uLL);
  -[NSLayoutManager _doLayoutWithFullContainerStartingAtGlyphIndex:nextGlyphIndex:](self, "_doLayoutWithFullContainerStartingAtGlyphIndex:nextGlyphIndex:", v17, &v152);
  v21 = v152 - v17;
  v137 = -[NSLayoutManager _primitiveCharacterRangeForGlyphRange:](self, "_primitiveCharacterRangeForGlyphRange:", v17, v152 - v17);
  v136 = v22;
  v143 = 0;
  v144 = 0;
  v141 = 0x7FFFFFFFFFFFFFFFLL;
  v142 = v17;
LABEL_55:
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, (unint64_t)v152, 1uLL);
  self->_firstUnlaidGlyphIndex = 0x7FFFFFFFFFFFFFFFLL;
  self->_firstUnlaidCharIndex = 0x7FFFFFFFFFFFFFFFLL;
  _NSClearGlyphIndexForPointCache((uint64_t)self);
  v46 = xmmword_18D6CBB80;
  self->_cachedLocationNominalGlyphRange = (_NSRange)xmmword_18D6CBB80;
  v47 = self->_extraData;
  v139 = v21;
  if (!v21)
  {
    LODWORD(v48) = 0;
    goto LABEL_80;
  }
  v48 = *((_QWORD *)v47 + 49);
  if (!v48)
    goto LABEL_80;
  v49 = (unint64_t)&v142[v21 - 1];
  if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    v53 = -[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
  }
  else if (-[NSRunStorage count](self->_containerRuns, "count") <= v49)
  {
    v53 = 0;
  }
  else
  {
    v50 = self->_containerRuns;
    _NSBlockNumberForIndex(v50, v49, 0);
    v52 = 0;
    if (v50->_gapBlockIndex <= v51)
      v52 = v50->_maxBlocks - v50->_numBlocks;
    v53 = *(_QWORD *)&v50->_runs->var1[(v50->_elementSize + 8) * (v52 + v51)];
  }
  v46 = xmmword_18D6CBB80;
  v47 = self->_extraData;
  if (v53 != *((_QWORD *)v47 + 51) || v137 < *((_QWORD *)v47 + 48))
    goto LABEL_79;
  v54 = *((_QWORD *)v47 + 49) + *((_QWORD *)v47 + 48);
  if (v137 + v136 != v54)
  {
LABEL_76:
    if (v137 + v136 < v54)
    {
      value[0] = 0;
      _NSLayoutTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, (unint64_t)v152, (unint64_t *)value);
      v57 = (char *)value[0];
      if (value[0] == v152)
      {
        v138 = 1;
        goto LABEL_88;
      }
      LODWORD(v48) = 0;
      v47 = self->_extraData;
      goto LABEL_221;
    }
LABEL_79:
    LODWORD(v48) = 0;
    goto LABEL_80;
  }
  _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v49, 0);
  v47 = self->_extraData;
  if (vabdd_f64(v55 + v56, *((double *)v47 + 50)) >= 0.01)
  {
    v54 = *((_QWORD *)v47 + 49) + *((_QWORD *)v47 + 48);
    v46 = xmmword_18D6CBB80;
    goto LABEL_76;
  }
  LODWORD(v48) = 1;
LABEL_221:
  v46 = xmmword_18D6CBB80;
LABEL_80:
  *((_OWORD *)v47 + 24) = v46;
  *((_QWORD *)self->_extraData + 50) = 0;
  *((_QWORD *)self->_extraData + 51) = 0;
  if ((_DWORD)v48)
  {
    v138 = 1;
    v57 = v152;
    goto LABEL_88;
  }
  v57 = v152;
  if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    v138 = 0;
LABEL_88:
    if (*(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8) > (unint64_t)v57)
    {
      if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
      {
        v67 = (CFDictionaryRef)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
      }
      else
      {
        v63 = (unint64_t)(v57 - 1);
        if (-[NSRunStorage count](self->_containerRuns, "count") <= (unint64_t)(v57 - 1))
        {
          v67 = 0;
        }
        else
        {
          v64 = self->_containerRuns;
          _NSBlockNumberForIndex(v64, v63, 0);
          v66 = 0;
          if (v64->_gapBlockIndex <= v65)
            v66 = v64->_maxBlocks - v64->_numBlocks;
          v67 = *(CFDictionaryRef *)&v64->_runs->var1[(v64->_elementSize + 8) * (v66 + v65)];
        }
      }
      value[0] = 0;
      v68 = (CFDictionaryRef *)self->_extraData;
      if (v68[10] == v67)
      {
        v69 = 0;
      }
      else if (CFDictionaryGetValueIfPresent(v68[11], v67, (const void **)value))
      {
        v69 = (uint64_t)value[0];
      }
      else
      {
        v69 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v70 = -[NSMutableArray count](self->_textContainers, "count");
      if (v69 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v71 = v70;
        -[NSLayoutManager _invalidateUsageForTextContainersInRange:](self, "_invalidateUsageForTextContainersInRange:", v69, v70 - v69);
        v72 = v69 + 1;
        if (v72 < v71)
        {
          do
            CFDictionaryRemoveValue(*((CFMutableDictionaryRef *)self->_extraData + 12), (const void *)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", v72++));
          while (v71 != v72);
        }
      }
    }
    goto LABEL_105;
  }
  v58 = *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8);
  if (v58 <= (unint64_t)v152)
  {
    v138 = 0;
  }
  else
  {
    v59 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, (unint64_t)v152);
    v60 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, v58) - v59;
    v61 = self->_lmFlags;
    v62 = *(_BYTE *)&v61 & 1;
    if ((*(_DWORD *)&v61 & 0x8100000) != 0)
    {
      -[NSLayoutManager _invalidateGlyphsForExtendedCharacterRange:changeInLength:includeBlocks:](self, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:includeBlocks:", v59, v60, 0, 0);
      v61 = self->_lmFlags;
    }
    -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:invalidateUsage:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:invalidateUsage:", v59, v60, 0, (*(unsigned int *)&v61 >> 30) & 1);
    v138 = 0;
    self->_lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xFFFFFFFE | v62);
  }
LABEL_105:
  v73 = self->_extraData;
  if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    v79 = *(char **)(v73[26] + 8);
    if (v152 < v79)
      goto LABEL_147;
    v80 = (void *)-[NSTextStorage string](self->_textStorage, "string");
    if (range2)
    {
      v81 = v80;
      v82 = objc_msgSend(v80, "characterAtIndex:", range2 - 1);
      if (v82 > 132)
      {
        if ((v82 - 8232) >= 2 && v82 != 133)
          goto LABEL_147;
      }
      else if (v82 != 10
             && v82 != 12
             && (v82 != 13
              || range2 < objc_msgSend(v81, "length")
              && objc_msgSend(v81, "characterAtIndex:", range2) == 10))
      {
        goto LABEL_147;
      }
    }
    -[NSTypesetter layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:](-[NSLayoutManager typesetter](self, "typesetter"), "layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:", self, v79, 1, &v152);
    goto LABEL_147;
  }
  if ((*(_BYTE *)(v73[30] + 56) & 1) != 0)
    goto LABEL_147;
  v74 = *(_QWORD *)(v73[26] + 8);
  v75 = -[NSMutableArray count](self->_textContainers, "count");
  v76 = (void *)-[NSTextStorage string](self->_textStorage, "string");
  if (range2)
  {
    v77 = v76;
    v78 = objc_msgSend(v76, "characterAtIndex:", range2 - 1);
    if (v78 > 132)
    {
      if ((v78 - 8232) >= 2 && v78 != 133)
        goto LABEL_127;
    }
    else if (v78 != 10
           && v78 != 12
           && (v78 != 13
            || range2 < objc_msgSend(v77, "length")
            && objc_msgSend(v77, "characterAtIndex:", range2) == 10))
    {
      goto LABEL_127;
    }
  }
  -[NSTypesetter layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:](-[NSLayoutManager typesetter](self, "typesetter"), "layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:", self, v74, 1, &v152);
LABEL_127:
  if (v74)
  {
    if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
    {
      v87 = (CFDictionaryRef)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
    }
    else
    {
      v83 = v74 - 1;
      if (-[NSRunStorage count](self->_containerRuns, "count") <= v83)
      {
        v87 = 0;
      }
      else
      {
        v84 = self->_containerRuns;
        _NSBlockNumberForIndex(v84, v83, 0);
        v86 = 0;
        if (v84->_gapBlockIndex <= v85)
          v86 = v84->_maxBlocks - v84->_numBlocks;
        v87 = *(CFDictionaryRef *)&v84->_runs->var1[(v84->_elementSize + 8) * (v86 + v85)];
      }
    }
    value[0] = 0;
    v89 = (CFDictionaryRef *)self->_extraData;
    if (v89[10] == v87)
    {
      v91 = 0;
    }
    else
    {
      ValueIfPresent = CFDictionaryGetValueIfPresent(v89[11], v87, (const void **)value);
      v91 = (uint64_t)value[0];
      if (!ValueIfPresent)
        v91 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v88 = v91 + 1;
  }
  else
  {
    v88 = 0;
  }
  if (v88 < v75)
  {
    do
      -[NSLayoutManager _resizeTextViewForTextContainer:](self, "_resizeTextViewForTextContainer:", -[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", v88++));
    while (v75 != v88);
  }
LABEL_147:
  -[NSLayoutManager _invalidateInsertionPoint](self, "_invalidateInsertionPoint");
  if (v143)
  {
    if ((v138 & 1) != 0)
    {
      v92 = v139;
    }
    else
    {
      v92 = v139;
      if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
        v92 = *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8) - (_QWORD)v17;
    }
    -[NSLayoutManager invalidateDisplayForGlyphRange:](self, "invalidateDisplayForGlyphRange:", v142, v92);
  }
  else if (self->_deferredDisplayCharRange.location != 0x7FFFFFFFFFFFFFFFLL && !self->_displayInvalidationDisableStack)
  {
    -[NSLayoutManager _invalidateDisplayIfNeeded](self, "_invalidateDisplayIfNeeded");
  }
  _enableTextViewResizing((uint64_t)self);
  v93 = *(_BYTE *)(*((_QWORD *)self->_extraData + 30) + 56);
  if ((*((_BYTE *)&self->_lmFlags + 1) & 0x20) == 0)
  {
    if ((*(_BYTE *)(*((_QWORD *)self->_extraData + 30) + 56) & 1) != 0)
      goto LABEL_195;
    goto LABEL_190;
  }
  v94 = self->_extraLineFragmentContainer;
  if (v94)
    goto LABEL_160;
  v99 = -[NSTextStorage length](self->_textStorage, "length");
  v100 = *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8);
  v101 = (void *)-[NSTextStorage string](self->_textStorage, "string");
  if ((v93 & 1) == 0)
  {
    v94 = 0;
    if (!v99 || !v100)
      goto LABEL_165;
    v102 = v101;
    v103 = objc_msgSend(v101, "characterAtIndex:", v99 - 1);
    v94 = 0;
    if (v103 > 132)
    {
      if ((v103 - 8232) < 2 || v103 == 133)
        goto LABEL_165;
    }
    else
    {
      if (v103 == 10 || v103 == 12)
        goto LABEL_165;
      if (v103 == 13
        && (v99 >= objc_msgSend(v102, "length") || objc_msgSend(v102, "characterAtIndex:", v99) != 10))
      {
        v94 = 0;
        goto LABEL_165;
      }
    }
  }
  if (self->_firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL
    || (v105 = self->_firstUnlaidGlyphIndex, v105 == 0x7FFFFFFFFFFFFFFFLL))
  {
    -[NSLayoutManager getFirstUnlaidCharacterIndex:glyphIndex:](self, "getFirstUnlaidCharacterIndex:glyphIndex:", 0, v153);
    v105 = v153[0];
    if (v153[0])
      goto LABEL_207;
LABEL_214:
    v94 = (NSTextContainer *)*((_QWORD *)self->_extraData + 10);
    goto LABEL_160;
  }
  v153[0] = self->_firstUnlaidGlyphIndex;
  if (!v105)
    goto LABEL_214;
LABEL_207:
  if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    v94 = (NSTextContainer *)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
  }
  else
  {
    v106 = v105 - 1;
    if (-[NSRunStorage count](self->_containerRuns, "count") <= v105 - 1)
    {
      v94 = 0;
    }
    else
    {
      v107 = self->_containerRuns;
      _NSBlockNumberForIndex(v107, v106, 0);
      v109 = 0;
      if (v107->_gapBlockIndex <= v108)
        v109 = v107->_maxBlocks - v107->_numBlocks;
      v94 = *(NSTextContainer **)&v107->_runs->var1[(v107->_elementSize + 8) * (v109 + v108)];
    }
  }
LABEL_160:
  if (extraLineFragmentContainer == v94 && (v93 & 1) != 0)
    goto LABEL_195;
LABEL_165:
  value[0] = 0;
  v96 = (CFDictionaryRef *)self->_extraData;
  if (v96[10] == (CFDictionaryRef)extraLineFragmentContainer)
  {
    v98 = 0;
  }
  else
  {
    v97 = CFDictionaryGetValueIfPresent(v96[11], extraLineFragmentContainer, (const void **)value);
    v98 = (uint64_t)value[0];
    if (!v97)
      v98 = 0x7FFFFFFFFFFFFFFFLL;
  }
  *(_DWORD *)&self->_lmFlags &= ~0x40000u;
  if (extraLineFragmentContainer != v94)
  {
    v104 = v98 + 1;
    do
    {
      if ((*((_BYTE *)&self->_lmFlags + 2) & 4) != 0)
        break;
      objc_msgSend(-[NSLayoutManager delegate](self, "delegate"), "layoutManager:didCompleteLayoutForTextContainer:atEnd:", self, extraLineFragmentContainer, 0);
      extraLineFragmentContainer = v104 >= -[NSMutableArray count](self->_textContainers, "count")
                                 ? 0
                                 : (NSTextContainer *)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", v104);
      ++v104;
    }
    while (extraLineFragmentContainer != v94);
  }
  if ((*(_BYTE *)(*((_QWORD *)self->_extraData + 30) + 56) & 1) == 0)
  {
    if ((*((_BYTE *)&self->_lmFlags + 2) & 4) == 0)
      objc_msgSend(-[NSLayoutManager delegate](self, "delegate"), "layoutManager:didCompleteLayoutForTextContainer:atEnd:", self, v94, 1);
LABEL_190:
    if (-[NSLayoutManager didCompleteLayoutObserverBlock](self, "didCompleteLayoutObserverBlock"))
      (*(void (**)(void))(-[NSLayoutManager didCompleteLayoutObserverBlock](self, "didCompleteLayoutObserverBlock") + 16))();
    if (-[NSLayoutManager applicationFrameworkContext](self, "applicationFrameworkContext") == 2
      && objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      _NSRemoveDirtyLayoutManager((uint64_t)self);
    }
  }
LABEL_195:
  if (v147)
    -[NSTextStorage _unlock](self->_textStorage, "_unlock");
  if (!v149)
    objc_msgSend(*((id *)self->_extraData + 7), "unlock");
  if (v144)
    -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", v141, v144, 0);
}

- (_NSRange)_primitiveGlyphRangeForCharacterRange:(_NSRange)a3
{
  NSUInteger location;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  location = a3.location;
  v5 = a3.location + a3.length;
  v6 = -[NSTextStorage length](self->_textStorage, "length");
  if (location >= v6)
    v7 = v6;
  else
    v7 = location;
  if (v5 >= v6)
    v8 = v6;
  else
    v8 = v5;
  if (v8 <= v7)
    v9 = v7;
  else
    v9 = v8;
  v10 = -[NSLayoutManager glyphIndexForCharacterAtIndex:](self, "glyphIndexForCharacterAtIndex:");
  v11 = -[NSLayoutManager glyphIndexForCharacterAtIndex:](self, "glyphIndexForCharacterAtIndex:", v9) - v10;
  v12 = v10;
  result.length = v11;
  result.location = v12;
  return result;
}

- (NSUInteger)glyphIndexForCharacterAtIndex:(NSUInteger)charIndex
{
  if (!*((_QWORD *)self->_extraData + 26))
    return charIndex;
  _NSFastFillAllGlyphHolesForCharacterRange((uint64_t)self, charIndex, 1uLL);
  return _NSGlyphTreeGlyphIndexForCharacterAtIndex((uint64_t)self, charIndex);
}

- (NSRange)characterRangeForGlyphRange:(NSRange)glyphRange actualGlyphRange:(NSRangePointer)actualGlyphRange
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v8;
  NSUInteger v9;
  NSRange result;

  if (*((_QWORD *)self->_extraData + 26))
  {
    length = glyphRange.length;
    location = glyphRange.location;
    _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphRange.location, 1uLL);
    if (length)
      _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, length + location - 1, 2uLL);
    v8 = _NSGlyphTreeCharacterRangeForGlyphRange((uint64_t)self, location, length, 1, 1, &actualGlyphRange->location);
  }
  else
  {
    if (actualGlyphRange)
    {
      actualGlyphRange->location = 0;
      actualGlyphRange->length = 0;
    }
    v8 = 0;
    v9 = 0;
  }
  result.length = v9;
  result.location = v8;
  return result;
}

- (NSTextStorage)textStorage
{
  return self->_textStorage;
}

- (NSRange)glyphRangeForCharacterRange:(NSRange)charRange actualCharacterRange:(NSRangePointer)actualCharRange
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v8;
  NSUInteger v9;
  NSRange result;

  if (*((_QWORD *)self->_extraData + 26))
  {
    length = charRange.length;
    location = charRange.location;
    _NSFastFillAllGlyphHolesForCharacterRange((uint64_t)self, charRange.location, 1uLL);
    if (length >= 2)
      _NSFastFillAllGlyphHolesForCharacterRange((uint64_t)self, length + location - 1, 2uLL);
    v8 = _NSGlyphTreeGlyphRangeForCharacterRange((uint64_t)self, location, length, 1, 1, 1, (uint64_t *)actualCharRange);
  }
  else
  {
    if (actualCharRange)
    {
      actualCharRange->location = 0;
      actualCharRange->length = 0;
    }
    v8 = 0;
    v9 = 0;
  }
  result.length = v9;
  result.location = v8;
  return result;
}

- (void)_invalidateInsertionPoint
{
  if (self->_displayInvalidationDisableStack)
    *(_DWORD *)&self->_lmFlags |= 0x80u;
  else
    objc_msgSend(self->_firstTextView, "updateInsertionPointStateAndRestartTimer:", 0);
}

- (NSTypesetter)typesetter
{
  if (self->_typesetter)
    return self->_typesetter;
  else
    return (NSTypesetter *)+[NSTypesetter sharedSystemTypesetterForBehavior:](NSTypesetter, "sharedSystemTypesetterForBehavior:", *((_QWORD *)self->_extraData + 13));
}

- (void)invalidateDisplayForGlyphRange:(NSRange)glyphRange
{
  uint64_t v4;
  uint64_t v5;

  v4 = -[NSLayoutManager _primitiveCharacterRangeForGlyphRange:](self, "_primitiveCharacterRangeForGlyphRange:", glyphRange.location, glyphRange.length);
  -[NSLayoutManager invalidateDisplayForCharacterRange:](self, "invalidateDisplayForCharacterRange:", v4, v5);
}

- (_NSRange)_primitiveCharacterRangeForGlyphRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSUInteger v9;
  unint64_t v10;
  BOOL v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v6 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, a3.location);
  v7 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, location + length);
  v8 = -[NSTextStorage length](self->_textStorage, "length");
  if (v6 >= v8)
    v9 = v8;
  else
    v9 = v6;
  if (v7 >= v8)
    v10 = v8;
  else
    v10 = v7;
  v11 = v10 >= v9;
  v12 = v10 - v9;
  if (v11)
    v13 = v12;
  else
    v13 = 0;
  v14 = v9;
  result.length = v13;
  result.location = v14;
  return result;
}

- (BOOL)hasNonContiguousLayout
{
  _QWORD *extraData;
  BOOL result;

  result = (*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0
        && (extraData = self->_extraData, (*(_BYTE *)(extraData[30] + 56) & 1) != 0)
        && *(_QWORD *)(extraData[26] + 8) != 0;
  return result;
}

- (id)didCompleteLayoutObserverBlock
{
  return (id)*((_QWORD *)self->_extraData + 64);
}

- (void)processEditingForTextStorage:(NSTextStorage *)textStorage edited:(NSTextStorageEditActions)editMask range:(NSRange)newCharRange changeInLength:(NSInteger)delta invalidatedRange:(NSRange)invalidatedCharRange
{
  -[NSLayoutManager textStorage:edited:range:changeInLength:invalidatedRange:](self, "textStorage:edited:range:changeInLength:invalidatedRange:", textStorage, editMask, newCharRange.location, newCharRange.length, delta);
}

- (NSRange)glyphRangeForTextContainer:(NSTextContainer *)container
{
  CFDictionaryRef *extraData;
  unint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSTextContainer *v9;
  CFDictionaryRef *v10;
  int ValueIfPresent;
  unint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  NSTextContainer *v15;
  CFDictionaryRef *v16;
  int v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  void *value;
  NSRange result;

  if (-[NSTextContainer layoutManager](container, "layoutManager") != self)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("*** %@: given container does not appear in the list of containers for this NSLayoutManager."), _NSFullMethodName());
  if (-[NSTextStorage length](self->_textStorage, "length"))
  {
    v19 = 0;
    v20 = 0;
    if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
    {
      v7 = 0;
      v8 = *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8);
      goto LABEL_33;
    }
    value = 0;
    extraData = (CFDictionaryRef *)self->_extraData;
    if (extraData[10] == (CFDictionaryRef)container)
    {
      v6 = 0;
    }
    else if (CFDictionaryGetValueIfPresent(extraData[11], container, (const void **)&value))
    {
      v6 = (unint64_t)value;
    }
    else
    {
      v6 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v9 = -[NSLayoutManager textContainerForGlyphAtIndex:effectiveRange:](self, "textContainerForGlyphAtIndex:effectiveRange:", 0, &v19);
    value = 0;
    v10 = (CFDictionaryRef *)self->_extraData;
    if (v10[10] == (CFDictionaryRef)v9)
    {
      v12 = 0;
    }
    else
    {
      ValueIfPresent = CFDictionaryGetValueIfPresent(v10[11], v9, (const void **)&value);
      v12 = (unint64_t)value;
      if (!ValueIfPresent)
        v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v9 == container)
    {
LABEL_32:
      v7 = v19;
      v8 = v20;
      goto LABEL_33;
    }
    v7 = 0;
    while (v12 <= v6)
    {
      if (v20)
        v7 += v20;
      else
        ++v7;
      v13 = *((_QWORD *)self->_extraData + 26);
      if ((*(_BYTE *)(v13 + 56) & 1) == 0)
      {
        v14 = *(_QWORD *)(v13 + 8);
        if (v7 >= v14)
        {
          v8 = 0;
          v7 = v14;
          goto LABEL_33;
        }
      }
      v15 = -[NSLayoutManager textContainerForGlyphAtIndex:effectiveRange:](self, "textContainerForGlyphAtIndex:effectiveRange:", v7, &v19);
      value = 0;
      v16 = (CFDictionaryRef *)self->_extraData;
      if (v16[10] == (CFDictionaryRef)v15)
      {
        v12 = 0;
      }
      else
      {
        v17 = CFDictionaryGetValueIfPresent(v16[11], v15, (const void **)&value);
        v12 = (unint64_t)value;
        if (!v17)
          v12 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v15 == container)
        goto LABEL_32;
    }
  }
  else
  {
    v7 = 0;
  }
  v8 = 0;
LABEL_33:
  v18 = v7;
  result.length = v8;
  result.location = v18;
  return result;
}

- (NSTextContainer)textContainerForGlyphAtIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange
{
  _QWORD *extraData;
  uint64_t v6;
  __lmFlags lmFlags;
  NSUInteger v10;
  NSTextContainer *v11;
  NSUInteger v12;
  NSRunStorage *containerRuns;
  unint64_t v15;
  unint64_t v16;
  __lmFlags v17;
  unsigned __int16 v18;

  extraData = self->_extraData;
  v6 = extraData[26];
  if (!v6 || !extraData[30])
  {
    v11 = 0;
    if (effectiveGlyphRange)
    {
      effectiveGlyphRange->location = 0;
      effectiveGlyphRange->length = 0;
    }
    return v11;
  }
  lmFlags = self->_lmFlags;
  if ((*(_DWORD *)&lmFlags & 0x40000000) == 0)
  {
    if ((*(_BYTE *)&lmFlags & 0x40) == 0)
      ++self->_displayInvalidationDisableStack;
    if ((*(_BYTE *)&lmFlags & 8) == 0)
      ++self->_textViewResizeDisableStack;
    if (effectiveGlyphRange)
    {
      _NSFastFillAllLayoutHolesUpToEndOfContainerForGlyphIndex((uint64_t)self, glyphIndex);
      if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
      {
        v10 = *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8);
        effectiveGlyphRange->location = 0;
        effectiveGlyphRange->length = v10;
LABEL_20:
        v11 = (NSTextContainer *)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
LABEL_24:
        _enableTextViewResizing_0((uint64_t)self);
        v17 = self->_lmFlags;
        if ((*(_BYTE *)&v17 & 0x40) == 0)
        {
          if (!self->_displayInvalidationDisableStack
            || (v18 = self->_displayInvalidationDisableStack - 1, (self->_displayInvalidationDisableStack = v18) == 0))
          {
            self->_lmFlags = (__lmFlags)(*(_DWORD *)&v17 | 0x40);
            -[NSLayoutManager _invalidateDisplayIfNeeded](self, "_invalidateDisplayIfNeeded");
            *(_DWORD *)&self->_lmFlags &= ~0x40u;
          }
        }
        return v11;
      }
    }
    else
    {
      _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
      if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
        goto LABEL_20;
    }
    if (-[NSRunStorage count](self->_containerRuns, "count") <= glyphIndex)
    {
      v11 = 0;
    }
    else
    {
      containerRuns = self->_containerRuns;
      _NSBlockNumberForIndex(containerRuns, glyphIndex, (__n128 *)effectiveGlyphRange);
      if (containerRuns->_gapBlockIndex <= v15)
        v16 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
      else
        v16 = 0;
      v11 = *(NSTextContainer **)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v16 + v15)];
    }
    goto LABEL_24;
  }
  if (effectiveGlyphRange)
  {
    v12 = *(_QWORD *)(v6 + 8);
    effectiveGlyphRange->location = 0;
    effectiveGlyphRange->length = v12;
  }
  return (NSTextContainer *)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
}

- (void)_invalidateDisplayIfNeeded
{
  NSUInteger location;
  NSUInteger length;
  __lmFlags lmFlags;

  location = self->_deferredDisplayCharRange.location;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    length = self->_deferredDisplayCharRange.length;
    self->_deferredDisplayCharRange = (_NSRange)xmmword_18D6CBB80;
    -[NSLayoutManager invalidateDisplayForCharacterRange:](self, "invalidateDisplayForCharacterRange:", location, length);
  }
  lmFlags = self->_lmFlags;
  if ((*(_BYTE *)&lmFlags & 0x80) != 0)
  {
    self->_lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags & 0xFFFFFF7F);
    -[NSLayoutManager _invalidateInsertionPoint](self, "_invalidateInsertionPoint");
  }
}

- (void)setLineFragmentRect:(CGRect)a3 forGlyphRange:(_NSRange)a4 usedRect:(CGRect)a5 baselineOffset:(double)a6
{
  NSUInteger location;

  location = a4.location;
  -[NSLayoutManager setLineFragmentRect:forGlyphRange:usedRect:](self, "setLineFragmentRect:forGlyphRange:usedRect:", a4.location, a4.length, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  -[NSLayoutManager setBaselineOffset:forGlyphAtIndex:](self, "setBaselineOffset:forGlyphAtIndex:", location, a6);
}

- (void)_updateUsageForTextContainer:(id)a3 addingUsedRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  CFDictionaryRef *extraData;
  uint64_t ValueAtIndex;
  uint64_t v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  int v18;
  double v19;
  double v20;
  double v21;
  void *value;
  NSRect v23;
  NSRect v24;
  NSRect v25;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  value = 0;
  extraData = (CFDictionaryRef *)self->_extraData;
  if (extraData[10] != a3)
    CFDictionaryGetValueIfPresent(extraData[11], a3, (const void **)&value);
  ValueAtIndex = CFStorageGetValueAtIndex();
  if ((*(_BYTE *)(ValueAtIndex + 64) & 1) == 0)
  {
    v12 = ValueAtIndex;
    v13 = (void *)objc_msgSend(a3, "textView");
    v14 = *(double *)v12;
    v15 = *(double *)(v12 + 8);
    v16 = *(double *)(v12 + 16);
    v17 = *(double *)(v12 + 24);
    v18 = *(_DWORD *)(v12 + 64);
    v23.origin.x = *(CGFloat *)v12;
    v23.origin.y = v15;
    v23.size.width = v16;
    v23.size.height = v17;
    if (!NSEqualRects(v23, *MEMORY[0x1E0CB3438]))
    {
      x = NSLMUnionRect(*(double *)v12, *(double *)(v12 + 8), *(double *)(v12 + 16), *(double *)(v12 + 24), x, y, width, height);
      y = v19;
      width = v20;
      height = v21;
    }
    *(double *)v12 = x;
    *(double *)(v12 + 8) = y;
    *(double *)(v12 + 16) = width;
    *(double *)(v12 + 24) = height;
    *(_DWORD *)(v12 + 64) = *(_DWORD *)(v12 + 64) & 0xFFFFFFFB | (4
                                                                * (*(_BYTE *)(*((_QWORD *)self->_extraData + 30) + 56) & 1));
    if (v13)
    {
      v24.origin.x = v14;
      v24.origin.y = v15;
      v24.size.width = v16;
      v24.size.height = v17;
      v25.origin.x = x;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      if (!NSEqualRects(v24, v25)
        || (*((_BYTE *)&self->_lmFlags + 3) & 0x40) == 0 && (v18 & 4) != 0 && (*(_BYTE *)(v12 + 64) & 4) == 0)
      {
        -[NSLayoutManager _resizeTextViewForTextContainer:](self, "_resizeTextViewForTextContainer:", a3);
      }
      objc_msgSend(v13, "invalidateTextContainerOrigin");
    }
  }
}

- (void)setLineFragmentRect:(CGRect)fragmentRect forGlyphRange:(NSRange)glyphRange usedRect:(CGRect)usedRect
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double height;
  double width;
  double y;
  double x;
  NSUInteger location;
  NSRunStorage *containerRuns;
  unint64_t v16;
  double v17;
  unint64_t v18;
  CFDictionaryRef v19;
  CFDictionaryRef *extraData;
  void *v21;
  char v22;
  void *value;

  if (!glyphRange.length)
    return;
  height = usedRect.size.height;
  width = usedRect.size.width;
  y = usedRect.origin.y;
  x = usedRect.origin.x;
  location = glyphRange.location;
  _NSLayoutTreeSetLineFragmentRectForGlyphRange((uint64_t)self, glyphRange.location, glyphRange.length, fragmentRect.origin.x, fragmentRect.origin.y, fragmentRect.size.width, fragmentRect.size.height, usedRect.origin.x, usedRect.origin.y, usedRect.size.width, usedRect.size.height, glyphRange.length, v5, v6, v7, v8, v22);
  if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    v19 = (CFDictionaryRef)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
    if (!v19)
      return;
LABEL_9:
    if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) == 0)
    {
      -[NSLayoutManager _updateUsageForTextContainer:addingUsedRect:](self, "_updateUsageForTextContainer:addingUsedRect:", v19, x, y, width, height);
      return;
    }
    value = 0;
    extraData = (CFDictionaryRef *)self->_extraData;
    if (extraData[10] == v19)
    {
      v21 = 0;
    }
    else
    {
      if (!CFDictionaryGetValueIfPresent(extraData[11], v19, (const void **)&value))
        return;
      v21 = value;
      if (value == (void *)0x7FFFFFFFFFFFFFFFLL)
        return;
    }
    -[NSLayoutManager _invalidateUsageForTextContainersInRange:](self, "_invalidateUsageForTextContainersInRange:", v21, 1, v17);
    return;
  }
  if (-[NSRunStorage count](self->_containerRuns, "count") > location)
  {
    containerRuns = self->_containerRuns;
    *(_QWORD *)&v17 = _NSBlockNumberForIndex(containerRuns, location, 0).n128_u64[0];
    v18 = 0;
    if (containerRuns->_gapBlockIndex <= v16)
      v18 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
    v19 = *(CFDictionaryRef *)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v18 + v16)];
    if (v19)
      goto LABEL_9;
  }
}

- (NSFont)substituteFontForFont:(NSFont *)originalFont
{
  if (-[NSLayoutManager usesScreenFonts](self, "usesScreenFonts"))
    return (NSFont *)-[UIFont screenFontWithRenderingMode:](originalFont, "screenFontWithRenderingMode:", 0);
  else
    return originalFont;
}

- (BOOL)usesScreenFonts
{
  return (*(_BYTE *)&self->_lmFlags >> 4) & 1;
}

- (void)setUsesFontLeading:(BOOL)usesFontLeading
{
  int v3;

  if (usesFontLeading)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xFEFFFFFF | v3);
}

- (id)delegate
{
  id *p_delegate;
  id Weak;
  void *v5;

  objc_sync_enter(self);
  p_delegate = &self->_delegate;
  if (self->_delegateIsWeakValue)
    Weak = (id)objc_msgSend(*p_delegate, "weakObjectValue");
  else
    Weak = objc_loadWeak(p_delegate);
  v5 = Weak;
  objc_sync_exit(self);
  return v5;
}

- (void)setBaselineOffset:(double)a3 forGlyphAtIndex:(unint64_t)a4
{
  _NSLayoutTreeSetBaselineOffsetForGlyphAtIndex((uint64_t)self, a4, a3);
}

- (BOOL)_forcesTrackingFloor
{
  return (*((unsigned __int8 *)self->_extraData + 450) >> 4) & 1;
}

- (NSUInteger)getGlyphsInRange:(NSRange)glyphRange glyphs:(CGGlyph *)glyphBuffer properties:(NSGlyphProperty *)props characterIndexes:(NSUInteger *)charIndexBuffer bidiLevels:(unsigned __int8 *)bidiLevelBuffer
{
  NSUInteger length;
  NSUInteger location;

  length = glyphRange.length;
  location = glyphRange.location;
  if (glyphRange.length)
    _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphRange.location, glyphRange.length);
  return _NSGlyphTreeGetCGGlyphsInRange((uint64_t)self, location, length, (unint64_t)glyphBuffer, props, charIndexBuffer, bidiLevelBuffer);
}

- (void)textStorage:(NSTextStorage *)str edited:(NSTextStorageEditedOptions)editedMask range:(NSRange)newCharRange changeInLength:(NSInteger)delta invalidatedRange:(NSRange)invalidatedCharRange
{
  NSUInteger length;
  NSUInteger location;
  char v10;
  unint64_t v12;
  __lmFlags lmFlags;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  length = newCharRange.length;
  location = newCharRange.location;
  v10 = editedMask;
  v12 = -[NSTextStorage length](self->_textStorage, "length", str);
  v17 = 0;
  v18 = 0;
  lmFlags = self->_lmFlags;
  self->_lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags | 0x20000);
  if ((*(_BYTE *)&lmFlags & 8) == 0)
    ++self->_textViewResizeDisableStack;
  if ((v10 & 2) != 0)
    -[NSLayoutManager _clearTemporaryAttributesForCharacterRange:changeInLength:](self, "_clearTemporaryAttributesForCharacterRange:changeInLength:", location, length, delta);
  -[NSLayoutManager _invalidateGlyphsForCharacterRange:editedCharacterRange:changeInLength:actualCharacterRange:](self, "_invalidateGlyphsForCharacterRange:editedCharacterRange:changeInLength:actualCharacterRange:", invalidatedCharRange.location, invalidatedCharRange.length, location, length, delta, &v17);
  -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", v17, v18, 0);
  v14 = v18 + v17;
  v15 = v12 - (v18 + v17);
  if (v12 >= v18 + v17)
    -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", v14, v15, 1);
  if (self->_textStorage && !v12 && -[NSMutableArray count](self->_textContainers, "count", v14, v15))
  {
    v16 = 0;
    -[NSTypesetter layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:](-[NSLayoutManager typesetter](self, "typesetter"), "layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:", self, 0, 1, &v16);
    -[NSLayoutManager _invalidateInsertionPoint](self, "_invalidateInsertionPoint");
  }
  if ((v10 & 2) != 0)
  {
    -[NSLayoutManager _fixSelectionAfterChangeInCharacterRange:changeInLength:](self, "_fixSelectionAfterChangeInCharacterRange:changeInLength:", location, length, delta);
    if (delta < 0
      && (*(_DWORD *)&self->_lmFlags & 0x2000) != 0
      && !-[NSTextStorage length](self->_textStorage, "length"))
    {
      if (-[NSMutableArray count](self->_textContainers, "count"))
      {
        *(_DWORD *)&self->_lmFlags &= ~0x40000u;
        objc_msgSend(-[NSLayoutManager delegate](self, "delegate"), "layoutManager:didCompleteLayoutForTextContainer:atEnd:", self, -[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0), 1);
        if (-[NSLayoutManager didCompleteLayoutObserverBlock](self, "didCompleteLayoutObserverBlock"))
          (*(void (**)(void))(-[NSLayoutManager didCompleteLayoutObserverBlock](self, "didCompleteLayoutObserverBlock")
                            + 16))();
      }
    }
  }
  _enableTextViewResizing_0((uint64_t)self);
  -[NSLayoutManager _forceDisplayToBeCorrectForViewsWithUnlaidGlyphs](self, "_forceDisplayToBeCorrectForViewsWithUnlaidGlyphs");
  *(_DWORD *)&self->_lmFlags &= ~0x20000u;
}

- (void)_invalidateLayoutForExtendedCharacterRange:(_NSRange)a3 isSoft:(BOOL)a4
{
  -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:invalidateUsage:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:invalidateUsage:", a3.location, a3.length, a4, 1);
}

- (void)_forceDisplayToBeCorrectForViewsWithUnlaidGlyphs
{
  unint64_t v3;
  unint64_t v4;
  NSRunStorage *containerRuns;
  unint64_t v6;
  unint64_t v7;
  const void *v8;
  id extraData;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  unint64_t firstUnlaidGlyphIndex;
  void *value;

  firstUnlaidGlyphIndex = 0;
  if (self->_firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL
    || (v3 = self->_firstUnlaidGlyphIndex, v3 == 0x7FFFFFFFFFFFFFFFLL))
  {
    -[NSLayoutManager getFirstUnlaidCharacterIndex:glyphIndex:](self, "getFirstUnlaidCharacterIndex:glyphIndex:", 0, &firstUnlaidGlyphIndex);
    v3 = firstUnlaidGlyphIndex;
    if (!firstUnlaidGlyphIndex)
      goto LABEL_17;
  }
  else
  {
    firstUnlaidGlyphIndex = self->_firstUnlaidGlyphIndex;
    if (!v3)
    {
LABEL_17:
      v10 = 0;
      goto LABEL_18;
    }
  }
  if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    v8 = (const void *)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
  }
  else
  {
    v4 = v3 - 1;
    if (-[NSRunStorage count](self->_containerRuns, "count") <= v3 - 1)
    {
      v8 = 0;
    }
    else
    {
      containerRuns = self->_containerRuns;
      _NSBlockNumberForIndex(containerRuns, v4, 0);
      v7 = 0;
      if (containerRuns->_gapBlockIndex <= v6)
        v7 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
      v8 = *(const void **)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v7 + v6)];
    }
  }
  value = 0;
  extraData = self->_extraData;
  if (*((const void **)extraData + 10) == v8)
    goto LABEL_17;
  if (CFDictionaryGetValueIfPresent(*((CFDictionaryRef *)extraData + 11), v8, (const void **)&value))
    v10 = (unint64_t)value;
  else
    v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_18:
  if (v10 < -[NSMutableArray count](self->_textContainers, "count", firstUnlaidGlyphIndex))
  {
    v11 = *MEMORY[0x1E0CB3438];
    v12 = *(double *)(MEMORY[0x1E0CB3438] + 8);
    v13 = *(double *)(MEMORY[0x1E0CB3438] + 16);
    v14 = *(double *)(MEMORY[0x1E0CB3438] + 24);
    do
    {
      v15 = (void *)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", v10), "textView");
      if (v15)
      {
        v16 = v15;
        if (objc_msgSend(v15, "needsDisplay"))
          objc_msgSend(v16, "setNeedsDisplayInRect:avoidAdditionalLayout:", 0, v11, v12, v13, v14);
      }
      ++v10;
    }
    while (v10 < -[NSMutableArray count](self->_textContainers, "count"));
  }
}

- (NSLayoutManager)init
{
  NSLayoutManager *v2;
  NSLayoutManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSLayoutManager;
  v2 = -[NSLayoutManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[NSLayoutManager _commonInit](v2, "_commonInit");
  return v3;
}

- (void)_invalidateLayoutForExtendedCharacterRange:(_NSRange)a3 isSoft:(BOOL)a4 invalidateUsage:(BOOL)a5
{
  NSUInteger length;
  NSUInteger location;
  _QWORD *extraData;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;
  NSUInteger *v17;
  double v18;
  double v19;
  NSUInteger v20;
  NSRunStorage *containerRuns;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  BOOL v25;
  unint64_t v26;
  unint64_t v27;
  NSRunStorage *v28;
  unint64_t v29;
  unint64_t v30;
  CFDictionaryRef v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  CFDictionaryRef *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  NSUInteger v40;
  NSUInteger v41;
  NSRunStorage *v42;
  NSRange v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSUInteger v50;
  uint64_t v51;
  BOOL v52;
  char v53;
  unint64_t v54;
  unint64_t v55;
  _BOOL4 v56;
  _BOOL4 v57;
  BOOL v58;
  unint64_t firstUnlaidGlyphIndex;
  void *value;
  NSRange v61;
  NSRange v62;

  length = a3.length;
  location = a3.location;
  extraData = self->_extraData;
  v56 = a5;
  v57 = (*(_BYTE *)(extraData[26] + 56) & 1) == 0 && (*(_BYTE *)(extraData[30] + 56) & 1) == 0;
  firstUnlaidGlyphIndex = 0;
  v55 = -[NSTextStorage length](self->_textStorage, "length");
  v10 = _invalidateLayoutForExtendedCharacterRange_isSoft_invalidateUsage__omniBugRequiresWorkaroundInAppKit;
  if (_invalidateLayoutForExtendedCharacterRange_isSoft_invalidateUsage__omniBugRequiresWorkaroundInAppKit == 254)
  {
    v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier"), "hasPrefix:", CFSTR("com.omnigroup.OmniOutliner"));
    _invalidateLayoutForExtendedCharacterRange_isSoft_invalidateUsage__omniBugRequiresWorkaroundInAppKit = v10;
  }
  *(_DWORD *)&self->_lmFlags &= ~1u;
  self->_firstUnlaidGlyphIndex = 0x7FFFFFFFFFFFFFFFLL;
  if (v10)
    a4 &= (location != 0) | ~a4 | (length == 0);
  self->_firstUnlaidCharIndex = 0x7FFFFFFFFFFFFFFFLL;
  _NSClearGlyphIndexForPointCache((uint64_t)self);
  self->_cachedLocationNominalGlyphRange = (_NSRange)xmmword_18D6CBB80;
  v58 = a4;
  if (!a4)
  {
    if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0 && self->_firstTextView && !*((_QWORD *)self->_extraData + 45))
      -[NSLayoutManager _noteFirstTextViewVisibleCharacterRangeIfAfterIndex:](self, "_noteFirstTextViewVisibleCharacterRangeIfAfterIndex:", location);
    if (length)
    {
      if (location != *((_QWORD *)self->_extraData + 48) || length != *((_QWORD *)self->_extraData + 49))
      {
        v54 = location + length;
        v16 = _NSGlyphTreeGlyphIndexForCharacterAtIndex((uint64_t)self, location + length - 1);
        v17 = (NSUInteger *)((char *)self->_extraData + 384);
        *v17 = location;
        v17[1] = length;
        _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v16, 0);
        *((double *)self->_extraData + 50) = v18 + v19;
        if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
        {
          v24 = -[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
        }
        else if (-[NSRunStorage count](self->_containerRuns, "count") <= v16)
        {
          v24 = 0;
        }
        else
        {
          v20 = length;
          containerRuns = self->_containerRuns;
          _NSBlockNumberForIndex(containerRuns, v16, 0);
          v23 = 0;
          if (containerRuns->_gapBlockIndex <= v22)
            v23 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
          v24 = *(_QWORD *)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v23 + v22)];
          length = v20;
          a4 = v58;
        }
        *((_QWORD *)self->_extraData + 51) = v24;
        if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
        {
          if (self->_firstTextView)
          {
            if (!*((_QWORD *)self->_extraData + 45))
            {
              value = 0;
              _NSLayoutTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, v16, (unint64_t *)&value);
              if (_NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, (unint64_t)value) >= v54)
                -[NSLayoutManager _noteFirstTextViewVisibleCharacterRangeIfAfterIndex:](self, "_noteFirstTextViewVisibleCharacterRangeIfAfterIndex:", 0);
            }
          }
        }
      }
    }
  }
  _NSLayoutTreeInvalidateLayoutForCharacterRange((uint64_t)self, location, length, a4, v11, v12, v13, v14, v53);
  if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) == 0 || (location + length < v55 ? (v25 = 1) : (v25 = a4), !v25))
  {
    _NSLayoutTreeSetExtraLineFragmentRect((uint64_t)self, *MEMORY[0x1E0CB3438], *(double *)(MEMORY[0x1E0CB3438] + 8), *(double *)(MEMORY[0x1E0CB3438] + 16), *(double *)(MEMORY[0x1E0CB3438] + 24), *MEMORY[0x1E0CB3438], *(double *)(MEMORY[0x1E0CB3438] + 8), *(double *)(MEMORY[0x1E0CB3438] + 16), *(double *)(MEMORY[0x1E0CB3438] + 24));
    self->_extraLineFragmentContainer = 0;
  }
  if (self->_firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL
    || (v26 = self->_firstUnlaidGlyphIndex, v26 == 0x7FFFFFFFFFFFFFFFLL))
  {
    -[NSLayoutManager getFirstUnlaidCharacterIndex:glyphIndex:](self, "getFirstUnlaidCharacterIndex:glyphIndex:", 0, &firstUnlaidGlyphIndex);
    v26 = firstUnlaidGlyphIndex;
  }
  else
  {
    firstUnlaidGlyphIndex = self->_firstUnlaidGlyphIndex;
  }
  if (v26)
  {
    if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
    {
      v31 = (CFDictionaryRef)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
    }
    else
    {
      v27 = v26 - 1;
      if (-[NSRunStorage count](self->_containerRuns, "count") <= v26 - 1)
      {
        v31 = 0;
      }
      else
      {
        v28 = self->_containerRuns;
        _NSBlockNumberForIndex(v28, v27, 0);
        v30 = 0;
        if (v28->_gapBlockIndex <= v29)
          v30 = v28->_maxBlocks - v28->_numBlocks;
        v31 = *(CFDictionaryRef *)&v28->_runs->var1[(v28->_elementSize + 8) * (v30 + v29)];
      }
    }
    value = 0;
    v35 = (CFDictionaryRef *)self->_extraData;
    if (v35[10] == v31)
    {
      v36 = 0;
    }
    else if (CFDictionaryGetValueIfPresent(v35[11], v31, (const void **)&value))
    {
      v36 = (uint64_t)value;
    }
    else
    {
      v36 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v37 = -[NSMutableArray count](self->_textContainers, "count");
    if (v36 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v38 = v37;
      if (v56)
        -[NSLayoutManager _invalidateUsageForTextContainersInRange:](self, "_invalidateUsageForTextContainersInRange:", v36, v37 - v36);
      v39 = v36 + 1;
      if (v36 + 1 < v38)
      {
        do
          CFDictionaryRemoveValue(*((CFMutableDictionaryRef *)self->_extraData + 12), (const void *)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", v39++));
        while (v38 != v39);
      }
    }
  }
  else
  {
    v32 = -[NSMutableArray count](self->_textContainers, "count");
    if (v32)
    {
      v33 = v32;
      if (v56)
        -[NSLayoutManager _invalidateUsageForTextContainersInRange:](self, "_invalidateUsageForTextContainersInRange:", 0, v32);
      for (i = 0; i != v33; ++i)
        CFDictionaryRemoveValue(*((CFMutableDictionaryRef *)self->_extraData + 12), (const void *)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", i));
    }
  }
  if (!v58 && (*((_QWORD *)self->_extraData + 23) || -[NSRunStorage count](self->_containerRuns, "count")))
  {
    v40 = _NSGlyphTreeGlyphIndexForCharacterAtIndex((uint64_t)self, location);
    v41 = _NSGlyphTreeGlyphIndexForCharacterAtIndex((uint64_t)self, location + length) - v40;
    if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) == 0 && v40 < -[NSRunStorage count](self->_containerRuns, "count"))
    {
      value = 0;
      v42 = self->_containerRuns;
      v61.length = -[NSRunStorage count](v42, "count");
      v61.location = 0;
      v62.location = v40;
      v62.length = v41;
      v43 = NSIntersectionRange(v61, v62);
      -[NSRunStorage replaceElementsInRange:withElement:coalesceRuns:](v42, "replaceElementsInRange:withElement:coalesceRuns:", v43.location, v43.length, &value, 1);
    }
    v44 = (void *)*((_QWORD *)self->_extraData + 23);
    if (v44)
    {
      _NSRemoveTextBlocksForGlyphRange(v44, v40, v41);
      v45 = *((_QWORD *)self->_extraData + 52);
      if (v45)
      {
        if (location < *(_QWORD *)(v45 + 16) + *(_QWORD *)(v45 + 8))
          -[NSLayoutManager _setRowArrayCache:](self, "_setRowArrayCache:", 0);
      }
    }
  }
  v46 = (void *)*((_QWORD *)self->_extraData + 25);
  if (v46)
  {
    v47 = objc_msgSend(v46, "count");
    if (v47)
    {
      v48 = v47 - 1;
      do
      {
        v49 = objc_msgSend(*((id *)self->_extraData + 25), "objectAtIndex:", v48);
        v50 = *(_QWORD *)(v49 + 8);
        v51 = *(_QWORD *)(v49 + 16);
        if (location < v51 + v50 || (!v51 ? (v52 = location > v50) : (v52 = 1), !v52))
          objc_msgSend(*((id *)self->_extraData + 25), "removeObjectAtIndex:", v48);
        --v48;
      }
      while (v48 != -1);
    }
  }
  -[NSLayoutManager _markSelfAsDirtyForBackgroundLayout:](self, "_markSelfAsDirtyForBackgroundLayout:", self);
  -[NSLayoutManager _invalidateInsertionPoint](self, "_invalidateInsertionPoint");
  if (v57
    && (*((_BYTE *)&self->_lmFlags + 1) & 0x10) != 0
    && (*(_BYTE *)(*((_QWORD *)self->_extraData + 30) + 56) & 1) != 0)
  {
    objc_msgSend(-[NSLayoutManager delegate](self, "delegate"), "layoutManagerDidInvalidateLayout:", self);
  }
}

- (void)setTextStorage:(NSTextStorage *)textStorage
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  double v9;
  _QWORD *extraData;
  void *v11;
  void *v12;
  __lmFlags lmFlags;
  NSTextStorage *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  int v19;
  NSMutableArray *textContainers;
  _QWORD v21[5];
  uint64_t v22;

  v5 = -[NSMutableArray count](self->_textContainers, "count");
  if ((*(_BYTE *)&self->_lmFlags & 8) == 0)
    ++self->_textViewResizeDisableStack;
  self->_textStorage = textStorage;
  _NSGlyphTreeFree((uint64_t)self);
  _NSGlyphTreeCreate((uint64_t)self);
  v6 = -[NSRunStorage count](self->_containerRuns, "count");
  if (v6)
  {
    v7 = v6;
    -[NSRunStorage removeElementsInRange:coalesceRuns:](self->_containerRuns, "removeElementsInRange:coalesceRuns:", 0, v6, 1);
    v8 = (void *)*((_QWORD *)self->_extraData + 23);
    if (v8)
      _NSDeleteGlyphRangeFromTextBlocks(v8, 0, v7);
  }
  _NSLayoutTreeFree((uint64_t)self);
  *(_QWORD *)&v9 = _NSLayoutTreeCreate((uint64_t)self).n128_u64[0];
  extraData = self->_extraData;
  v11 = (void *)extraData[23];
  if (v11)
  {
    _NSRemoveTextBlocksStartingAtGlyphIndex(v11, 0);

    *((_QWORD *)self->_extraData + 23) = 0;
    extraData = self->_extraData;
    if (extraData[52])
    {
      -[NSLayoutManager _setRowArrayCache:](self, "_setRowArrayCache:", 0);
      extraData = self->_extraData;
    }
  }
  v12 = (void *)extraData[25];
  if (v12)
  {

    *((_QWORD *)self->_extraData + 25) = 0;
  }
  self->_firstUnlaidGlyphIndex = 0;
  self->_firstUnlaidCharIndex = 0;
  if (v5)
    -[NSLayoutManager _invalidateUsageForTextContainersInRange:](self, "_invalidateUsageForTextContainersInRange:", 0, v5, v9);
  lmFlags = self->_lmFlags;
  self->_lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags & 0xF5EFFFFC);
  self->_cachedLocationNominalGlyphRange = (_NSRange)xmmword_18D6CBB80;
  self->_cachedFontCharRange = (_NSRange)xmmword_18D6CBB80;
  self->_extraLineFragmentContainer = 0;
  v14 = self->_textStorage;
  if (v14)
  {
    v15 = -[NSTextStorage length](v14, "length");
    if (v15)
    {
      v16 = v15;
      v22 = 0;
      -[NSRunStorage insertElement:range:coalesceRuns:](self->_containerRuns, "insertElement:range:coalesceRuns:", &v22, 0, v15, 1);
      v17 = (void *)*((_QWORD *)self->_extraData + 23);
      if (v17)
        _NSInsertGlyphRangeInTextBlocks(v17, 0, v16);
      -[NSLayoutManager _markSelfAsDirtyForBackgroundLayout:](self, "_markSelfAsDirtyForBackgroundLayout:", self);
    }
    else if (-[NSMutableArray count](self->_textContainers, "count"))
    {
      v22 = 0;
      -[NSTypesetter layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:](-[NSLayoutManager typesetter](self, "typesetter"), "layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:", self, 0, 1, &v22);
      -[NSLayoutManager _invalidateInsertionPoint](self, "_invalidateInsertionPoint");
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = 0x10000;
    else
      v19 = 0;
    v18 = *(_DWORD *)&self->_lmFlags & 0xFFFEFFFF | v19;
  }
  else
  {
    v18 = *(_DWORD *)&lmFlags & 0xF5EEFFFC;
  }
  self->_lmFlags = (__lmFlags)v18;
  -[NSLayoutManager _clearTemporaryAttributes](self, "_clearTemporaryAttributes");
  textContainers = self->_textContainers;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __34__NSLayoutManager_setTextStorage___block_invoke;
  v21[3] = &unk_1E2603930;
  v21[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](textContainers, "enumerateObjectsUsingBlock:", v21);
  _enableTextViewResizing_0((uint64_t)self);
}

- (void)_invalidateUsageForTextContainersInRange:(_NSRange)a3
{
  NSUInteger v3;
  uint64_t ValueAtIndex;

  if (a3.length)
  {
    do
    {
      v3 = a3.length - 1;
      ValueAtIndex = CFStorageGetValueAtIndex();
      *(_DWORD *)(ValueAtIndex + 64) |= 1u;
      a3.length = v3;
    }
    while (v3);
  }
}

- (void)_commonInit
{
  NSExtraLMData *v3;
  CGSize v4;
  uint64_t v5;
  uint64_t v6;
  CGPoint v7;
  CGSize v8;

  self->_textContainers = (NSMutableArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", -[NSLayoutManager zone](self, "zone")), "init");
  self->_containerUsedRects = -[NSStorage initWithElementSize:capacity:](+[NSStorage allocWithZone:](NSStorage, "allocWithZone:", -[NSLayoutManager zone](self, "zone")), "initWithElementSize:capacity:", 120, 0);
  *(_DWORD *)&self->_lmFlags &= 0xFFFF3FFF;
  self->_containerRuns = (NSRunStorage *)-[NSRunStorage initWithElementSize:capacity:](+[NSIdRunStorage allocWithZone:](NSIdRunStorage, "allocWithZone:", -[NSLayoutManager zone](self, "zone")), "initWithElementSize:capacity:", 8, 0);
  v3 = -[NSExtraLMData init](+[NSExtraLMData allocWithZone:](NSExtraLMData, "allocWithZone:", -[NSLayoutManager zone](self, "zone")), "init");
  v3->_hyphenationFactor = 0.0;
  v7 = (CGPoint)*MEMORY[0x1E0CB3438];
  v8 = *(CGSize *)(MEMORY[0x1E0CB3438] + 16);
  v3->_currentAttachmentRect.origin = (CGPoint)*MEMORY[0x1E0CB3438];
  v3->_currentAttachmentRect.size = v8;
  v3->_currentAttachmentIndex = 0x7FFFFFFFFFFFFFFFLL;
  v3->_textContainerIndexes = CFDictionaryCreateMutable(0, 0, 0, 0);
  v3->_textContainerGlyphIndexes = CFDictionaryCreateMutable(0, 0, 0, 0);
  v3->_typesetterBehavior = +[NSTypesetter defaultTypesetterBehavior](NSTypesetter, "defaultTypesetterBehavior");
  v3->_cachedFontBounds.origin = v7;
  v3->_cachedFontBounds.size = v8;
  *(_OWORD *)&v3->_cachedUnderlineThickness = 0u;
  *(_OWORD *)&v3->_cachedUnderlineAdjustment = 0u;
  v3->_cachedUnderlineRange.length = 0;
  v4 = (CGSize)*MEMORY[0x1E0CB3440];
  v3->_firstTextViewVisibleCharRange = (_NSRange)xmmword_18D6CBB80;
  v3->_firstTextViewVisibleOffset = v4;
  v3->_lastInvalidatedCharRange.length = 0;
  v3->_lastInvalidatedLongitudinalPosition = 0.0;
  v3->_lastInvalidatedCharRange.location = 0x7FFFFFFFFFFFFFFFLL;
  v3->_paragraphArbitrator = -[NSParagraphArbitrator initWithAttributedString:range:]([NSParagraphArbitrator alloc], "initWithAttributedString:range:", 0, 0x7FFFFFFFFFFFFFFFLL, 0);
  v3->_lmFlags2 = (__lmFlags2)(*(_DWORD *)&v3->_lmFlags2 & 0xFC7FFFFF | ((_NSTextScalingTypeForCurrentEnvironment() & 7) << 23));
  if (_allocExtraData_onceToken != -1)
    dispatch_once(&_allocExtraData_onceToken, &__block_literal_global_501);
  v3->_lmFlags2 = (__lmFlags2)(*(_DWORD *)&v3->_lmFlags2 & 0xBFFFFFFF | (__NSUsesDefaultHyphenation << 30));
  self->_extraData = v3;
  if (!self->_textContainers || !self->_containerRuns || !self->_containerUsedRects)
  {
    v5 = _NSFullMethodName();
    -[NSLayoutManager dealloc](self, "dealloc");
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99850], CFSTR("*** %@: memory allocation failed."), v5);
  }
  _NSGlyphTreeCreate((uint64_t)self);
  _NSLayoutTreeCreate((uint64_t)self);
  self->_lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xDA1FF1EB | (4
                                                                        * __NSBackgroundLayoutEnabled) | (16 * __NSUsesScreenFonts) | (__NSShowsInvisibleCharacters << 10) | (__NSShowsControlCharacters << 11) | (__NSIgnoresViewTransformations << 26) | (__NSAllowsNonContiguousLayout << 29) | 0x1000200);
  self->_deferredDisplayCharRange = (_NSRange)xmmword_18D6CBB80;
  self->_cachedLocationNominalGlyphRange = (_NSRange)xmmword_18D6CBB80;
  self->_cachedFontCharRange = (_NSRange)xmmword_18D6CBB80;
  *(int64x2_t *)&self->_firstUnlaidGlyphIndex = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  self->_newlyFilledGlyphRange = (_NSRange)xmmword_18D6CBB80;
  v6 = __NSFillBackgroundRectArray;
  *((_DWORD *)self->_extraData + 112) = *((_DWORD *)self->_extraData + 112) & 0xDFFFFFFF | ((v6 == -[NSLayoutManager methodForSelector:](self, "methodForSelector:", sel_fillBackgroundRectArray_count_forCharacterRange_color_)) << 29);
  if (__NSForcesOldShowGlyphs)
    *((_DWORD *)self->_extraData + 112) |= 0x10000u;
}

- (void)_clearTemporaryAttributes
{
  _QWORD *extraData;
  void *v4;
  void *v5;

  extraData = self->_extraData;
  v4 = (void *)extraData[55];
  if (v4)
  {
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_130_0);
    objc_msgSend(*((id *)self->_extraData + 55), "removeAllObjects");
    extraData = self->_extraData;
  }
  v5 = (void *)extraData[9];
  if (v5)
  {

    *((_QWORD *)self->_extraData + 9) = 0;
  }
}

- (NSParagraphArbitrator)paragraphArbitrator
{
  return (NSParagraphArbitrator *)*((_QWORD *)self->_extraData + 53);
}

+ (void)initialize
{
  void *v3;
  char v4;

  if ((id)objc_opt_class() == a1)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    objc_msgSend(a1, "setVersion:", 1);
    if (objc_msgSend(v3, "objectForKey:", CFSTR("NSUsesScreenFonts")))
      __NSUsesScreenFonts = objc_msgSend(v3, "BOOLForKey:", CFSTR("NSUsesScreenFonts"));
    if (objc_msgSend(v3, "objectForKey:", CFSTR("NSIgnoresViewTransformations")))
      v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("NSIgnoresViewTransformations"));
    else
      v4 = 1;
    __NSIgnoresViewTransformations = v4;
    if (objc_msgSend(v3, "objectForKey:", CFSTR("NSTextShowsInvisibleCharacters")))
      __NSShowsInvisibleCharacters = objc_msgSend(v3, "BOOLForKey:", CFSTR("NSTextShowsInvisibleCharacters"));
    if (objc_msgSend(v3, "objectForKey:", CFSTR("NSTextShowsControlCharacters")))
      __NSShowsControlCharacters = objc_msgSend(v3, "BOOLForKey:", CFSTR("NSTextShowsControlCharacters"));
    if (objc_msgSend(v3, "objectForKey:", CFSTR("NSTextAllowsNonContiguousLayout")))
      __NSAllowsNonContiguousLayout = objc_msgSend(v3, "BOOLForKey:", CFSTR("NSTextAllowsNonContiguousLayout"));
    if (objc_msgSend(v3, "objectForKey:", CFSTR("NSTextBackgroundLayoutEnabled")))
      __NSBackgroundLayoutEnabled = objc_msgSend(v3, "BOOLForKey:", CFSTR("NSTextBackgroundLayoutEnabled"));
    __NSFillBackgroundRectArray = objc_msgSend(a1, "instanceMethodForSelector:", sel_fillBackgroundRectArray_count_forCharacterRange_color_);
    __NSShowCGGlyphsIMP = objc_msgSend(a1, "instanceMethodForSelector:", sel_showCGGlyphs_positions_count_font_matrix_attributes_inContext_);
    __NSForcesOldShowGlyphs = objc_msgSend(v3, "BOOLForKey:", CFSTR("NSLayoutManagerForcesShowPackedGlyphs"));
  }
}

- (void)addTextContainer:(NSTextContainer *)container
{
  -[NSLayoutManager insertTextContainer:atIndex:](self, "insertTextContainer:atIndex:", container, -[NSMutableArray count](self->_textContainers, "count"));
}

- (void)_setTextContainer:(id)a3 forGlyphRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSRunStorage *containerRuns;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  __n128 v23;
  id v24;

  v24 = a3;
  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    v23 = 0uLL;
    containerRuns = self->_containerRuns;
    *(_QWORD *)&v14 = _NSBlockNumberForIndex(containerRuns, a4.location, &v23).n128_u64[0];
    v15 = 0;
    if (containerRuns->_gapBlockIndex <= v9)
      v15 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
    if (&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v15 + v9)] != a3
      || v23.n128_u64[1] + v23.n128_u64[0] < location + length)
    {
      -[NSRunStorage replaceElementsInRange:withElement:coalesceRuns:](self->_containerRuns, "replaceElementsInRange:withElement:coalesceRuns:", location, length, &v24, 1, v14);
    }
    _NSLayoutTreeInvalidateLayoutForGlyphRange((uint64_t)self, location, length, 0, v10, v11, v12, v13, v21);
    if (v24)
      _NSGlyphTreeResetLayoutAttributesForGlyphsInRange((uint64_t)self, location, length, v16, v17, v18, v19, v20, v22);
  }
}

- (void)setLocation:(CGPoint)location forStartOfGlyphRange:(NSRange)glyphRange
{
  NSUInteger length;
  NSUInteger v5;
  double y;
  double x;
  NSRange v9;
  NSRange cachedLocationNominalGlyphRange;

  length = glyphRange.length;
  v5 = glyphRange.location;
  y = location.y;
  x = location.x;
  cachedLocationNominalGlyphRange = self->_cachedLocationNominalGlyphRange;
  v9.location = v5;
  v9.length = length;
  if (NSIntersectionRange(v9, cachedLocationNominalGlyphRange).length)
    self->_cachedLocationNominalGlyphRange = (_NSRange)xmmword_18D6CBB80;
  _NSLayoutTreeSetLocationForGlyphRange((uint64_t)self, v5, length, x, y);
}

- (void)setNotShownAttribute:(BOOL)flag forGlyphAtIndex:(NSUInteger)glyphIndex
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  _NSGlyphTreeSetNotShownAttributeForGlyphAtIndex((uint64_t)self, glyphIndex, flag, glyphIndex, v4, v5, v6, v7, v8);
}

uint64_t __34__NSLayoutManager_setTextStorage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "layoutManager");
  if (result == *(_QWORD *)(a1 + 32))
    return objc_msgSend(a2, "setLayoutManager:", result);
  return result;
}

- (void)_markSelfAsDirtyForBackgroundLayout:(id)a3
{
  int64_t v4;
  __lmFlags lmFlags;
  _QWORD *extraData;
  BOOL v7;
  void *v8;
  unint64_t *v9;

  if (-[NSMutableArray count](self->_textContainers, "count", a3))
  {
    v4 = -[NSLayoutManager applicationFrameworkContext](self, "applicationFrameworkContext");
    lmFlags = self->_lmFlags;
    if (v4 == 2)
    {
      if ((*(_DWORD *)&lmFlags & 0x40000104) == 4)
      {
        if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
          _NSAddDirtyLayoutManager((uint64_t)self);
      }
    }
    else if ((*(_DWORD *)&lmFlags & 0xC0000004) == 4)
    {
      self->_lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags | 0x80000000);
      extraData = self->_extraData;
      v7 = -[NSAttributedString _isStringDrawingTextStorage](-[NSLayoutManager textStorage](self, "textStorage"), "_isStringDrawingTextStorage");
      if (!v7 && !extraData[7])
      {
        v8 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB38E0], "allocWithZone:", -[NSLayoutManager zone](self, "zone")), "init");
        v9 = extraData + 7;
        while (!__ldaxr(v9))
        {
          if (!__stlxr((unint64_t)v8, v9))
            goto LABEL_14;
        }
        __clrex();

      }
LABEL_14:
      objc_msgSend((id)extraData[7], "lock");
      -[NSLayoutManager _mergeLayoutHoles](self, "_mergeLayoutHoles");
      if ((*(_BYTE *)(*((_QWORD *)self->_extraData + 30) + 56) & 1) != 0)
        -[NSLayoutManager _fillLayoutHoleAtIndex:desiredNumberOfLines:](self, "_fillLayoutHoleAtIndex:desiredNumberOfLines:", 0, 0x7FFFFFFFFFFFFFFFLL);
      if (!v7)
        objc_msgSend(*((id *)self->_extraData + 7), "unlock");
      *(_DWORD *)&self->_lmFlags &= ~0x80000000;
    }
  }
}

- (int64_t)applicationFrameworkContext
{
  return ((unint64_t)*((unsigned int *)self->_extraData + 112) >> 23) & 7;
}

- (void)_fillLayoutHoleAtIndex:(unint64_t)a3 desiredNumberOfLines:(unint64_t)a4
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v9 = 0;
  v10 = 0;
  v8 = 0;
  if (100 * a4 <= 0x400)
    v6 = 1024;
  else
    v6 = 100 * a4;
  _NSLayoutTreeGetFirstHoleAfterGlyphIndexWithLength((uint64_t)self, 0, v6, &v10, &v9);
  v7 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, v10);
  objc_msgSend((id)-[NSTextStorage string](self->_textStorage, "string"), "getParagraphStart:end:contentsEnd:forRange:", 0, &v8, 0, v7, _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, v9 + v10) - v7);
  -[NSLayoutManager _fillLayoutHoleForCharacterRange:desiredNumberOfLines:isSoft:](self, "_fillLayoutHoleForCharacterRange:desiredNumberOfLines:isSoft:", v7, v8 - v7, a4, 0);
}

- (NSUInteger)characterIndexForGlyphAtIndex:(NSUInteger)glyphIndex
{
  if (!*((_QWORD *)self->_extraData + 26))
    return glyphIndex;
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
  return _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, glyphIndex);
}

- (NSArray)textContainers
{
  return &self->_textContainers->super;
}

- (BOOL)isValidGlyphIndex:(NSUInteger)glyphIndex
{
  BOOL v4;

  v4 = 0;
  -[NSLayoutManager glyphAtIndex:isValidIndex:](self, "glyphAtIndex:isValidIndex:", glyphIndex, &v4);
  return v4;
}

- (CGGlyph)CGGlyphAtIndex:(NSUInteger)glyphIndex isValidIndex:(BOOL *)isValidIndex
{
  if (*((_QWORD *)self->_extraData + 26))
  {
    _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
    return _NSGlyphTreeGlyphAtIndex((uint64_t)self, glyphIndex, isValidIndex);
  }
  else
  {
    if (isValidIndex)
      *isValidIndex = 0;
    return -1;
  }
}

- (BOOL)allowsOriginalFontMetricsOverride
{
  return (*((unsigned __int8 *)&self->_lmFlags + 1) >> 1) & 1;
}

- (BOOL)_mirrorsTextAlignment
{
  return (*((unsigned __int8 *)self->_extraData + 450) >> 3) & 1;
}

- (BOOL)synchronizesAlignmentToDirection
{
  return (*((unsigned __int8 *)&self->_lmFlags + 2) >> 5) & 1;
}

- (BOOL)usesFontLeading
{
  return *((_BYTE *)&self->_lmFlags + 3) & 1;
}

- (BOOL)usesDefaultHyphenation
{
  return (*((unsigned __int8 *)self->_extraData + 451) >> 6) & 1;
}

- (NSTypesetterBehavior)typesetterBehavior
{
  return *((_QWORD *)self->_extraData + 13);
}

- (NSUInteger)numberOfGlyphs
{
  uint64_t v3;
  unint64_t v4;

  v3 = -[NSTextStorage length](self->_textStorage, "length");
  if (!*((_QWORD *)self->_extraData + 26))
    return 0;
  if (v3)
    v4 = v3 - 1;
  else
    v4 = 0;
  _NSFastFillAllGlyphHolesForCharacterRange((uint64_t)self, v4, 1uLL);
  return *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8);
}

- (BOOL)limitsLayoutForSuspiciousContents
{
  return (*((unsigned __int8 *)self->_extraData + 451) >> 2) & 1;
}

- (double)_hyphenationFactor
{
  return *((double *)self->_extraData + 24);
}

- (NSTextContainer)textContainerForGlyphAtIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange withoutAdditionalLayout:(BOOL)flag
{
  _QWORD *extraData;
  uint64_t v7;
  __lmFlags lmFlags;
  NSTextContainer *v12;
  NSUInteger v13;
  NSUInteger v15;
  NSUInteger v16;
  NSRunStorage *containerRuns;
  unint64_t v18;
  unint64_t v19;
  __lmFlags v20;
  unsigned __int16 v21;

  extraData = self->_extraData;
  v7 = extraData[26];
  if (!v7 || !extraData[30])
  {
    if (effectiveGlyphRange)
    {
      v12 = 0;
      effectiveGlyphRange->location = 0;
      effectiveGlyphRange->length = 0;
      return v12;
    }
    return 0;
  }
  lmFlags = self->_lmFlags;
  if ((*(_DWORD *)&lmFlags & 0x40000000) == 0)
  {
    if (flag)
    {
      if (self->_containerRuns->_count <= glyphIndex)
      {
        if (effectiveGlyphRange)
        {
          v12 = 0;
          v13 = *(_QWORD *)(v7 + 8);
          effectiveGlyphRange->location = 0;
          effectiveGlyphRange->length = v13;
          return v12;
        }
        return 0;
      }
      goto LABEL_23;
    }
    if ((*(_BYTE *)&lmFlags & 0x40) == 0)
      ++self->_displayInvalidationDisableStack;
    if ((*(_BYTE *)&lmFlags & 8) == 0)
      ++self->_textViewResizeDisableStack;
    if (effectiveGlyphRange)
    {
      _NSFastFillAllLayoutHolesUpToEndOfContainerForGlyphIndex((uint64_t)self, glyphIndex);
      if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
      {
        v16 = *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8);
        effectiveGlyphRange->location = 0;
        effectiveGlyphRange->length = v16;
LABEL_26:
        v12 = (NSTextContainer *)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
        goto LABEL_31;
      }
    }
    else
    {
      _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
      if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
        goto LABEL_26;
    }
LABEL_23:
    if (-[NSRunStorage count](self->_containerRuns, "count") <= glyphIndex)
    {
      v12 = 0;
      if (flag)
        return v12;
    }
    else
    {
      containerRuns = self->_containerRuns;
      _NSBlockNumberForIndex(containerRuns, glyphIndex, (__n128 *)effectiveGlyphRange);
      if (containerRuns->_gapBlockIndex <= v18)
        v19 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
      else
        v19 = 0;
      v12 = *(NSTextContainer **)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v19 + v18)];
      if (flag)
        return v12;
    }
LABEL_31:
    _enableTextViewResizing_0((uint64_t)self);
    v20 = self->_lmFlags;
    if ((*(_BYTE *)&v20 & 0x40) == 0)
    {
      if (!self->_displayInvalidationDisableStack
        || (v21 = self->_displayInvalidationDisableStack - 1, (self->_displayInvalidationDisableStack = v21) == 0))
      {
        self->_lmFlags = (__lmFlags)(*(_DWORD *)&v20 | 0x40);
        -[NSLayoutManager _invalidateDisplayIfNeeded](self, "_invalidateDisplayIfNeeded");
        *(_DWORD *)&self->_lmFlags &= ~0x40u;
      }
    }
    return v12;
  }
  if (effectiveGlyphRange)
  {
    v15 = *(_QWORD *)(v7 + 8);
    effectiveGlyphRange->location = 0;
    effectiveGlyphRange->length = v15;
  }
  return (NSTextContainer *)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
}

- (CGRect)lineFragmentRectForGlyphAtIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange withoutAdditionalLayout:(BOOL)flag
{
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  if (!flag)
    _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
  v8 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, glyphIndex, (uint64_t *)effectiveGlyphRange);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)insertTextContainer:(NSTextContainer *)container atIndex:(NSUInteger)index
{
  uint64_t v7;
  NSUInteger v8;
  NSTextView *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t firstUnlaidCharIndex;
  BOOL v13;
  NSLayoutManager *v14;
  NSUInteger v15;
  uint64_t v16;
  __int128 v17;
  NSMutableArray *textContainers;
  __CFDictionary *v24;
  unint64_t v25;
  void *v26;
  double v27;
  double v28;
  __lmFlags lmFlags;
  int v30;
  _BOOL4 v31;
  int v32;
  uint64_t i;
  NSTextStorage *textStorage;
  unint64_t v35;
  _OWORD v36[2];
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;

  v7 = -[NSTextStorage length](self->_textStorage, "length");
  v8 = -[NSMutableArray count](self->_textContainers, "count");
  v9 = -[NSTextContainer textView](container, "textView");
  if (v8 < index)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("*** %@: container index %lu is beyond the range of containers (count %lu)"), _NSFullMethodName(), index, v8);
  v40 = 0;
  if (!v7)
  {
    v13 = 0;
    if (index || !v8)
      goto LABEL_20;
    v14 = self;
    v15 = 0;
    v16 = 0;
    goto LABEL_18;
  }
  if (!v8)
  {
LABEL_15:
    if ((*((_WORD *)&self->_lmFlags + 1) & 0x810) != 0)
      -[NSLayoutManager _invalidateGlyphsForExtendedCharacterRange:changeInLength:](self, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:", v8, v7, 0);
    v14 = self;
    v15 = v8;
    v16 = v7;
LABEL_18:
    -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](v14, "_invalidateLayoutForExtendedCharacterRange:isSoft:", v15, v16, 0);
    goto LABEL_19;
  }
  if (v8 != index)
  {
    v10 = -[NSLayoutManager _characterRangeCurrentlyInAndAfterContainer:](self, "_characterRangeCurrentlyInAndAfterContainer:", -[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", index));
    if (!v11)
    {
LABEL_19:
      v13 = 0;
      goto LABEL_20;
    }
    goto LABEL_14;
  }
  v10 = -[NSLayoutManager _characterRangeCurrentlyInAndAfterContainer:](self, "_characterRangeCurrentlyInAndAfterContainer:", 0);
  if (v11)
  {
LABEL_14:
    v8 = v10;
    v7 = v11;
    goto LABEL_15;
  }
  v35 = 0;
  firstUnlaidCharIndex = self->_firstUnlaidCharIndex;
  if (firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSLayoutManager getFirstUnlaidCharacterIndex:glyphIndex:](self, "getFirstUnlaidCharacterIndex:glyphIndex:", &v35, 0);
    firstUnlaidCharIndex = v35;
  }
  v13 = firstUnlaidCharIndex == v7;
LABEL_20:
  *(_DWORD *)&self->_lmFlags &= ~1u;
  v17 = *(_OWORD *)(MEMORY[0x1E0CB3438] + 16);
  v36[0] = *MEMORY[0x1E0CB3438];
  v36[1] = v17;
  v37 = 0;
  v38 = 0;
  __asm { FMOV            V2.2D, #-1.0 }
  v39 = _Q2;
  LODWORD(v40) = 0;
  v41 = v36[0];
  v42 = v17;
  v43 = xmmword_18D6CBB80;
  -[NSStorage insertElements:count:atIndex:](self->_containerUsedRects, "insertElements:count:atIndex:", v36, 1, index);
  -[NSMutableArray insertObject:atIndex:](self->_textContainers, "insertObject:atIndex:", container, index);
  textContainers = self->_textContainers;
  v24 = (__CFDictionary *)*((_QWORD *)self->_extraData + 11);
  v25 = -[NSMutableArray count](textContainers, "count");
  if (v25)
    v26 = (void *)-[NSMutableArray objectAtIndex:](textContainers, "objectAtIndex:", 0);
  else
    v26 = 0;
  objc_msgSend(v26, "size");
  v28 = v27;
  CFDictionaryRemoveAllValues(v24);
  *((_QWORD *)self->_extraData + 10) = v26;
  lmFlags = self->_lmFlags;
  if (v25 == 1 && (*(_DWORD *)&lmFlags & 0x20000000) != 0)
  {
    v30 = objc_msgSend(v26, "isSimpleRectangularTextContainer");
    v31 = v28 >= 10000000.0;
    if (v28 <= 0.0)
      v31 = 1;
    if ((v30 & v31) != 0)
      v32 = 0x40000000;
    else
      v32 = 0;
    self->_lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xBFFFFFFF | v32);
  }
  else
  {
    self->_lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags & 0xBFFFFFFF);
    if (v25 >= 2)
    {
      for (i = 1; i != v25; ++i)
        CFDictionarySetValue(v24, (const void *)-[NSMutableArray objectAtIndex:](textContainers, "objectAtIndex:", i), (const void *)i);
    }
  }
  -[NSTextContainer setLayoutManager:](container, "setLayoutManager:", self);
  if (v9)
    -[NSLayoutManager _firstTextViewChanged](self, "_firstTextViewChanged");
  if (v13 || !index && (textStorage = self->_textStorage) != 0 && !-[NSTextStorage length](textStorage, "length"))
  {
    v35 = 0;
    -[NSTypesetter layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:](-[NSLayoutManager typesetter](self, "typesetter"), "layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:", self, *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8), 1, &v35);
    -[NSLayoutManager _invalidateInsertionPoint](self, "_invalidateInsertionPoint");
  }
  *(_DWORD *)&self->_lmFlags |= 0x40000u;
}

- (CGRect)usedRectForTextContainer:(NSTextContainer *)container
{
  id extraData;
  void *v5;
  _NSStoredContainerUsage *v6;
  double width;
  double height;
  double x;
  double y;
  void *value;
  CGRect result;

  value = 0;
  extraData = self->_extraData;
  if (*((NSTextContainer **)extraData + 10) == container)
  {
    v5 = 0;
LABEL_6:
    v6 = -[NSLayoutManager _validatedStoredUsageForTextContainerAtIndex:](self, "_validatedStoredUsageForTextContainerAtIndex:", v5);
    goto LABEL_7;
  }
  if (CFDictionaryGetValueIfPresent(*((CFDictionaryRef *)extraData + 11), container, (const void **)&value))
  {
    v5 = value;
    if (value != (void *)0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_6;
  }
  v6 = (_NSStoredContainerUsage *)MEMORY[0x1E0CB3438];
LABEL_7:
  width = v6->var0.size.width;
  height = v6->var0.size.height;
  x = v6->var0.origin.x;
  y = v6->var0.origin.y;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (_NSStoredContainerUsage)_validatedStoredUsageForTextContainerAtIndex:(unint64_t)a3
{
  uint64_t ValueAtIndex;

  ValueAtIndex = CFStorageGetValueAtIndex();
  if ((*(_BYTE *)(ValueAtIndex + 64) & 1) != 0)
    -[NSLayoutManager _recalculateUsageForTextContainerAtIndex:](self, "_recalculateUsageForTextContainerAtIndex:", a3);
  return (_NSStoredContainerUsage *)ValueAtIndex;
}

- (void)_recalculateUsageForTextContainerAtIndex:(unint64_t)a3
{
  NSTextContainer *v5;
  uint64_t ValueAtIndex;
  void *v7;
  char *v8;
  unint64_t v9;
  int v10;
  BOOL v11;
  unint64_t v12;
  NSRunStorage *containerRuns;
  unint64_t v14;
  unint64_t v15;
  const void *v16;
  id extraData;
  int ValueIfPresent;
  unint64_t v19;
  __int128 v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double x;
  double y;
  double width;
  double height;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSTextView *v48;
  __n128 v49;
  uint64_t v50;
  unint64_t firstUnlaidGlyphIndex;
  void *value[2];
  __int128 v53;
  NSRect v54;
  NSRect v55;

  v5 = (NSTextContainer *)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:");
  ValueAtIndex = CFStorageGetValueAtIndex();
  v48 = -[NSTextContainer textView](v5, "textView");
  v7 = (void *)-[NSTextStorage string](self->_textStorage, "string");
  v8 = -[NSLayoutManager _indexOfFirstGlyphInTextContainer:okToFillHoles:](self, "_indexOfFirstGlyphInTextContainer:okToFillHoles:", v5, 0);
  v9 = -[NSTextStorage length](self->_textStorage, "length");
  if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
    ++self->_textViewResizeDisableStack;
  firstUnlaidGlyphIndex = 0;
  v50 = 0;
  if (self->_firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL || self->_firstUnlaidGlyphIndex == 0x7FFFFFFFFFFFFFFFLL)
    -[NSLayoutManager getFirstUnlaidCharacterIndex:glyphIndex:](self, "getFirstUnlaidCharacterIndex:glyphIndex:", 0, &firstUnlaidGlyphIndex);
  else
    firstUnlaidGlyphIndex = self->_firstUnlaidGlyphIndex;
  if (((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0 || (*(_BYTE *)(*((_QWORD *)self->_extraData + 30) + 56) & 1) == 0)
    && !self->_extraLineFragmentContainer)
  {
    if (v9)
    {
      v10 = objc_msgSend(v7, "characterAtIndex:", v9 - 1);
      if (v10 > 132)
      {
        if ((v10 - 8232) >= 2 && v10 != 133)
          goto LABEL_37;
      }
      else
      {
        v11 = v10 == 10 || v10 == 12;
        if (!v11
          && (v10 != 13
           || v9 < objc_msgSend(v7, "length") && objc_msgSend(v7, "characterAtIndex:", v9) == 10))
        {
          goto LABEL_37;
        }
      }
    }
    if (!firstUnlaidGlyphIndex)
      goto LABEL_63;
    if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
    {
      v16 = (const void *)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
    }
    else
    {
      v12 = firstUnlaidGlyphIndex - 1;
      if (-[NSRunStorage count](self->_containerRuns, "count") <= v12)
      {
        v16 = 0;
      }
      else
      {
        containerRuns = self->_containerRuns;
        _NSBlockNumberForIndex(containerRuns, v12, 0);
        v15 = 0;
        if (containerRuns->_gapBlockIndex <= v14)
          v15 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
        v16 = *(const void **)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v15 + v14)];
      }
    }
    value[0] = 0;
    extraData = self->_extraData;
    if (*((const void **)extraData + 10) == v16)
      goto LABEL_63;
    ValueIfPresent = CFDictionaryGetValueIfPresent(*((CFDictionaryRef *)extraData + 11), v16, (const void **)value);
    v19 = (unint64_t)value[0];
    if (!ValueIfPresent)
      v19 = 0x7FFFFFFFFFFFFFFFLL;
    if (v19 <= a3)
    {
LABEL_63:
      if (self->_textStorage)
        -[NSTypesetter layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:](-[NSLayoutManager typesetter](self, "typesetter"), "layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:", self, *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8), 1, &v50);
      -[NSLayoutManager _invalidateInsertionPoint](self, "_invalidateInsertionPoint");
    }
  }
LABEL_37:
  *(_DWORD *)(ValueAtIndex + 64) &= ~1u;
  v20 = *(_OWORD *)(MEMORY[0x1E0CB3438] + 16);
  *(_OWORD *)ValueAtIndex = *MEMORY[0x1E0CB3438];
  *(_OWORD *)(ValueAtIndex + 16) = v20;
  if (v8 == (char *)0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_55;
  value[0] = 0;
  value[1] = 0;
  v49 = 0uLL;
  if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    v22 = *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8);
    v49.n128_u64[1] = v22;
    -[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
  }
  else
  {
    if (-[NSRunStorage count](self->_containerRuns, "count") > (unint64_t)v8)
    {
      _NSBlockNumberForIndex(&self->_containerRuns->super.isa, (unint64_t)v8, &v49);
      v22 = v49.n128_u64[1];
      v21 = v49.n128_u64[0];
      goto LABEL_44;
    }
    v22 = 0;
  }
  v21 = 0;
LABEL_44:
  if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) == 0 && v22 + v21 > firstUnlaidGlyphIndex)
  {
    v22 = firstUnlaidGlyphIndex - v21;
    v49.n128_u64[1] = firstUnlaidGlyphIndex - v21;
  }
  v23 = v22 + v21;
  while ((unint64_t)v8 < v23)
  {
    v24 = _NSLayoutTreeLineFragmentUsedRectForGlyphAtIndex((uint64_t)self, (unint64_t)v8, (uint64_t *)value);
    *(double *)ValueAtIndex = NSLMUnionRect(*(double *)ValueAtIndex, *(double *)(ValueAtIndex + 8), *(double *)(ValueAtIndex + 16), *(double *)(ValueAtIndex + 24), v24, v25, v26, v27);
    *(_QWORD *)(ValueAtIndex + 8) = v28;
    *(_QWORD *)(ValueAtIndex + 16) = v29;
    *(_QWORD *)(ValueAtIndex + 24) = v30;
    v8 = (char *)value[1] + (unint64_t)value[0];
  }
  if (*((_QWORD *)self->_extraData + 23))
  {
    v54.origin.x = _NSTextBlockBoundingRectAtIndex((uint64_t)self, v49.n128_u64[0]);
    x = v54.origin.x;
    y = v54.origin.y;
    width = v54.size.width;
    height = v54.size.height;
    if (!NSIsEmptyRect(v54))
    {
      *(double *)ValueAtIndex = NSLMUnionRect(*(double *)ValueAtIndex, *(double *)(ValueAtIndex + 8), *(double *)(ValueAtIndex + 16), *(double *)(ValueAtIndex + 24), x, y, width, height);
      *(_QWORD *)(ValueAtIndex + 8) = v35;
      *(_QWORD *)(ValueAtIndex + 16) = v36;
      *(_QWORD *)(ValueAtIndex + 24) = v37;
    }
    v55.origin.x = _NSTextBlockBoundingRectAtIndex((uint64_t)self, v49.n128_u64[0] + v49.n128_u64[1] - 1);
    v38 = v55.origin.x;
    v39 = v55.origin.y;
    v40 = v55.size.width;
    v41 = v55.size.height;
    if (!NSIsEmptyRect(v55))
    {
      *(double *)ValueAtIndex = NSLMUnionRect(*(double *)ValueAtIndex, *(double *)(ValueAtIndex + 8), *(double *)(ValueAtIndex + 16), *(double *)(ValueAtIndex + 24), v38, v39, v40, v41);
      *(_QWORD *)(ValueAtIndex + 8) = v42;
      *(_QWORD *)(ValueAtIndex + 16) = v43;
      *(_QWORD *)(ValueAtIndex + 24) = v44;
    }
  }
LABEL_55:
  if (self->_extraLineFragmentContainer == v5)
  {
    *(_OWORD *)value = 0u;
    v53 = 0u;
    _NSLayoutTreeGetExtraLineFragmentRect((uint64_t)self, 0, (uint64_t)value);
    *(double *)ValueAtIndex = NSLMUnionRect(*(double *)ValueAtIndex, *(double *)(ValueAtIndex + 8), *(double *)(ValueAtIndex + 16), *(double *)(ValueAtIndex + 24), *(double *)value, *(double *)&value[1], *(double *)&v53, *((double *)&v53 + 1));
    *(_QWORD *)(ValueAtIndex + 8) = v45;
    *(_QWORD *)(ValueAtIndex + 16) = v46;
    *(_QWORD *)(ValueAtIndex + 24) = v47;
  }
  *(_DWORD *)(ValueAtIndex + 64) = *(_DWORD *)(ValueAtIndex + 64) & 0xFFFFFFFB | (4
                                                                                * (*(_BYTE *)(*((_QWORD *)self->_extraData
                                                                                              + 30)
                                                                                            + 56) & 1));
  if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
    --self->_textViewResizeDisableStack;
  if (v48)
  {
    -[NSLayoutManager _resizeTextViewForTextContainer:](self, "_resizeTextViewForTextContainer:", v5);
    -[NSTextView invalidateTextContainerOrigin](v48, "invalidateTextContainerOrigin");
  }
}

- (unint64_t)_indexOfFirstGlyphInTextContainer:(id)a3 okToFillHoles:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;
  unint64_t v8;
  int ValueIfPresent;
  unint64_t v10;
  NSRunStorage *containerRuns;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  CFDictionaryRef v15;
  char *v16;
  NSRunStorage *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  CFDictionaryRef *extraData;
  unint64_t v22;
  int v23;
  unint64_t v24;
  NSRunStorage *v25;
  unint64_t v26;
  unint64_t v27;
  id v28;
  char *v29;
  NSRunStorage *v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  id v34;
  char *v36;
  uint64_t v37;
  void *v38[2];
  void *value;
  char *firstUnlaidGlyphIndex;

  v4 = a4;
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  value = (void *)0x7FFFFFFFFFFFFFFFLL;
  firstUnlaidGlyphIndex = 0;
  *(_OWORD *)v38 = xmmword_18D6CBB80;
  if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0
    && *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8)
    && (id)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0) == a3)
  {
    return 0;
  }
  if (self->_firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL
    || (v8 = self->_firstUnlaidGlyphIndex, v8 == 0x7FFFFFFFFFFFFFFFLL))
  {
    -[NSLayoutManager getFirstUnlaidCharacterIndex:glyphIndex:](self, "getFirstUnlaidCharacterIndex:glyphIndex:", 0, &firstUnlaidGlyphIndex);
    v8 = (unint64_t)firstUnlaidGlyphIndex;
    if (!firstUnlaidGlyphIndex)
      return v7;
  }
  else
  {
    firstUnlaidGlyphIndex = (char *)self->_firstUnlaidGlyphIndex;
    if (!v8)
      return v7;
  }
  if (a3)
  {
    ValueIfPresent = CFDictionaryGetValueIfPresent(*((CFDictionaryRef *)self->_extraData + 12), a3, (const void **)&value);
    v8 = (unint64_t)firstUnlaidGlyphIndex;
    if (ValueIfPresent)
    {
      v7 = (unint64_t)value;
      if (value < firstUnlaidGlyphIndex)
        return v7;
      CFDictionaryRemoveValue(*((CFMutableDictionaryRef *)self->_extraData + 12), a3);
      v8 = (unint64_t)firstUnlaidGlyphIndex;
    }
  }
  if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    v14 = *(void **)(*((_QWORD *)self->_extraData + 26) + 8);
    v38[0] = 0;
    v38[1] = v14;
    v15 = (CFDictionaryRef)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
  }
  else
  {
    v10 = v8 - 1;
    if (-[NSRunStorage count](self->_containerRuns, "count") <= v8 - 1)
    {
      if (!a3)
      {
        if (v38[0] >= firstUnlaidGlyphIndex)
          return 0x7FFFFFFFFFFFFFFFLL;
        else
          return (unint64_t)v38[0];
      }
      goto LABEL_27;
    }
    containerRuns = self->_containerRuns;
    _NSBlockNumberForIndex(containerRuns, v10, (__n128 *)v38);
    if (containerRuns->_gapBlockIndex <= v12)
      v13 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
    else
      v13 = 0;
    v15 = *(CFDictionaryRef *)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v13 + v12)];
  }
  if (v15 == a3)
    goto LABEL_42;
  if (!v15)
  {
LABEL_27:
    if (!v38[0])
      return 0x7FFFFFFFFFFFFFFFLL;
    if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
    {
      v20 = *(void **)(*((_QWORD *)self->_extraData + 26) + 8);
      v38[0] = 0;
      v38[1] = v20;
      v15 = (CFDictionaryRef)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
    }
    else
    {
      v16 = (char *)v38[0] - 1;
      if (-[NSRunStorage count](self->_containerRuns, "count") <= (unint64_t)v16)
      {
        v15 = 0;
      }
      else
      {
        v17 = self->_containerRuns;
        _NSBlockNumberForIndex(v17, (unint64_t)v16, (__n128 *)v38);
        if (v17->_gapBlockIndex <= v18)
          v19 = v17->_maxBlocks - v17->_numBlocks;
        else
          v19 = 0;
        v15 = *(CFDictionaryRef *)&v17->_runs->var1[(v17->_elementSize + 8) * (v19 + v18)];
      }
    }
    if (v15 != a3)
      goto LABEL_37;
LABEL_42:
    if (v38[0] < firstUnlaidGlyphIndex)
      v7 = (unint64_t)v38[0];
    else
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    if (v38[0] < firstUnlaidGlyphIndex && a3)
    {
      CFDictionarySetValue(*((CFMutableDictionaryRef *)self->_extraData + 12), a3, v38[0]);
      return (unint64_t)v38[0];
    }
    return v7;
  }
LABEL_37:
  v36 = 0;
  extraData = (CFDictionaryRef *)self->_extraData;
  if (extraData[10] == a3)
  {
    v22 = 0;
  }
  else
  {
    if (CFDictionaryGetValueIfPresent(extraData[11], a3, (const void **)&v36))
      v22 = (unint64_t)v36;
    else
      v22 = 0x7FFFFFFFFFFFFFFFLL;
    extraData = (CFDictionaryRef *)self->_extraData;
  }
  v36 = 0;
  if (extraData[10] == v15)
  {
    v24 = 0;
  }
  else
  {
    v23 = CFDictionaryGetValueIfPresent(extraData[11], v15, (const void **)&v36);
    v24 = (unint64_t)v36;
    if (!v23)
      v24 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v22 <= v24)
  {
    v29 = 0;
    while (1)
    {
      if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
      {
        v33 = *(void **)(*((_QWORD *)self->_extraData + 26) + 8);
        v38[0] = 0;
        v38[1] = v33;
        v34 = (id)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
      }
      else if (-[NSRunStorage count](self->_containerRuns, "count") <= (unint64_t)v29)
      {
        v34 = 0;
      }
      else
      {
        v30 = self->_containerRuns;
        _NSBlockNumberForIndex(v30, (unint64_t)v29, (__n128 *)v38);
        v32 = v30->_gapBlockIndex <= v31 ? v30->_maxBlocks - v30->_numBlocks : 0;
        v34 = *(id *)&v30->_runs->var1[(v30->_elementSize + 8) * (v32 + v31)];
      }
      if (v34 == a3)
        break;
      v29 = (char *)v38[1] + (unint64_t)v38[0];
      if ((char *)v38[1] + (unint64_t)v38[0] >= firstUnlaidGlyphIndex)
        return 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v29 < firstUnlaidGlyphIndex)
      v7 = (unint64_t)v29;
    else
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    if (a3 && v29 < firstUnlaidGlyphIndex)
    {
      CFDictionarySetValue(*((CFMutableDictionaryRef *)self->_extraData + 12), a3, v29);
      return (unint64_t)v29;
    }
    return v7;
  }
  if (!v4)
    return 0x7FFFFFFFFFFFFFFFLL;
  v7 = (unint64_t)(firstUnlaidGlyphIndex - 1);
  v36 = 0;
  v37 = 0;
  if (v15 != a3)
  {
    do
    {
      -[NSLayoutManager textContainerForGlyphAtIndex:effectiveRange:](self, "textContainerForGlyphAtIndex:effectiveRange:", v7, &v36);
      v7 = (unint64_t)&v36[v37];
      _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, (unint64_t)&v36[v37], 1uLL);
      if (v7 >= *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8))
        return 0x7FFFFFFFFFFFFFFFLL;
      if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
      {
        v28 = (id)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
      }
      else if (-[NSRunStorage count](self->_containerRuns, "count") <= v7)
      {
        v28 = 0;
      }
      else
      {
        v25 = self->_containerRuns;
        _NSBlockNumberForIndex(v25, v7, 0);
        v27 = 0;
        if (v25->_gapBlockIndex <= v26)
          v27 = v25->_maxBlocks - v25->_numBlocks;
        v28 = *(id *)&v25->_runs->var1[(v25->_elementSize + 8) * (v27 + v26)];
      }
    }
    while (v28 != a3);
  }
  if (a3)
    CFDictionarySetValue(*((CFMutableDictionaryRef *)self->_extraData + 12), a3, (const void *)v7);
  return v7;
}

- (void)invalidateDisplayForCharacterRange:(NSRange)charRange
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSRange v10;
  NSUInteger v11;
  NSRange v12;
  NSRange v13;
  NSRange v14;
  uint64_t v15;
  uint64_t v16;
  NSRange range2;
  NSRange v18;
  NSRange v19;

  length = charRange.length;
  location = charRange.location;
  v6 = -[NSTextStorage length](self->_textStorage, "length");
  v7 = v6;
  if (location >= v6)
    v8 = v6;
  else
    v8 = location;
  if (location + length > v6)
  {
    location = v8;
    length = v6 - v8;
  }
  v19.location = -[NSLayoutManager _blockRowRangeForCharRange:](self, "_blockRowRangeForCharRange:", location, length);
  v19.length = v9;
  v18.location = location;
  v18.length = length;
  v10 = NSUnionRange(v18, v19);
  v11 = v10.length;
  if (self->_displayInvalidationDisableStack)
    goto LABEL_7;
  range2.location = 0;
  if (self->_firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL)
    -[NSLayoutManager getFirstUnlaidCharacterIndex:glyphIndex:](self, "getFirstUnlaidCharacterIndex:glyphIndex:", &range2, 0);
  else
    range2.location = self->_firstUnlaidCharIndex;
  if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) == 0)
  {
    v13.location = range2.location;
    if (range2.location < v7)
    {
      if (range2.location <= v10.location)
      {
LABEL_7:
        v12.location = self->_deferredDisplayCharRange.location;
        if (v12.location == 0x7FFFFFFFFFFFFFFFLL)
        {
          self->_deferredDisplayCharRange = v10;
        }
        else
        {
          v12.length = self->_deferredDisplayCharRange.length;
          self->_deferredDisplayCharRange = NSUnionRange(v12, v10);
        }
        return;
      }
      v13.length = v10.location + v10.length - range2.location;
      if (v10.location + v10.length > range2.location)
      {
        v14.location = self->_deferredDisplayCharRange.location;
        if (v14.location == 0x7FFFFFFFFFFFFFFFLL)
        {
          self->_deferredDisplayCharRange.location = range2.location;
          self->_deferredDisplayCharRange.length = v13.length;
        }
        else
        {
          v14.length = self->_deferredDisplayCharRange.length;
          self->_deferredDisplayCharRange = NSUnionRange(v14, v13);
          v13.location = range2.location;
        }
        v11 = v13.location - v10.location;
      }
    }
  }
  if (v10.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = -[NSLayoutManager _primitiveGlyphRangeForCharacterRange:](self, "_primitiveGlyphRangeForCharacterRange:", v10.location, v11);
    -[NSLayoutManager _primitiveInvalidateDisplayForGlyphRange:](self, "_primitiveInvalidateDisplayForGlyphRange:", v15, v16);
  }
}

- (void)getFirstUnlaidCharacterIndex:(NSUInteger *)charIndex glyphIndex:(NSUInteger *)glyphIndex
{
  if (charIndex)
    *charIndex = -[NSLayoutManager firstUnlaidCharacterIndex](self, "firstUnlaidCharacterIndex");
  if (glyphIndex)
    *glyphIndex = -[NSLayoutManager firstUnlaidGlyphIndex](self, "firstUnlaidGlyphIndex");
}

- (_NSRange)_blockRowRangeForCharRange:(_NSRange)a3 completeRows:(BOOL *)a4
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  int v16;
  BOOL v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  int v21;
  NSRange v22;
  NSUInteger v23;
  NSUInteger v24;
  BOOL v25;
  NSUInteger v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  NSUInteger v31;
  NSRange v32;
  NSUInteger v33;
  NSRange v34;
  NSUInteger v35;
  NSUInteger v36;
  char v37;
  unsigned __int8 v38;
  NSRange v39;
  NSRange v40;
  _NSRange result;
  NSRange v42;

  length = a3.length;
  location = a3.location;
  v8 = -[NSTextStorage length](self->_textStorage, "length");
  if (location >= v8)
  {
    v17 = 1;
    if (!a4)
      goto LABEL_30;
    goto LABEL_29;
  }
  v9 = v8;
  v10 = (void *)objc_msgSend((id)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), location, 0), "textBlocks");
  if (v10 && (v11 = v10, objc_msgSend(v10, "count")))
  {
    v12 = (void *)objc_msgSend(v11, "objectAtIndex:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = 0;
      v13 = -[NSAttributedString _rangeOfTextTableRow:atIndex:completeRow:](self->_textStorage, "_rangeOfTextTableRow:atIndex:completeRow:", objc_msgSend(v12, "table"), location, &v38);
      v15 = v14;
      v16 = v38;
      if (!v14)
        goto LABEL_10;
LABEL_12:
      v39.location = location;
      v39.length = length;
      v21 = v16;
      v42.location = v13;
      v42.length = v15;
      v22 = NSUnionRange(v39, v42);
      v16 = v21;
      v19 = v22.location;
      v18 = v22.length;
      goto LABEL_13;
    }
    v13 = -[NSAttributedString rangeOfTextBlock:atIndex:](self->_textStorage, "rangeOfTextBlock:atIndex:", v12, location);
    v15 = v20;
    v16 = 1;
    if (v20)
      goto LABEL_12;
  }
  else
  {
    v15 = 0;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    v16 = 1;
  }
LABEL_10:
  v18 = length;
  v19 = location;
LABEL_13:
  if (length >= 2)
  {
    v23 = location + length;
    if (location + length < v9)
    {
      v24 = v23 - 1;
      v25 = v23 - 1 >= v13;
      v26 = v23 - 1 - v13;
      if (!v25 || v26 >= v15)
      {
        v27 = v16;
        v28 = (void *)objc_msgSend((id)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v24, 0, CFSTR("NSParagraphStyle")), "textBlocks");
        if (v28)
        {
          v29 = v28;
          if (objc_msgSend(v28, "count"))
          {
            v30 = (void *)objc_msgSend(v29, "objectAtIndex:", 0);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v37 = 0;
              v32.location = -[NSAttributedString _rangeOfTextTableRow:atIndex:completeRow:](self->_textStorage, "_rangeOfTextTableRow:atIndex:completeRow:", objc_msgSend(v30, "table"), v24, &v37);
              v32.length = v31;
              if (!v37)
                v27 = 0;
            }
            else
            {
              v32.location = -[NSAttributedString rangeOfTextBlock:atIndex:](self->_textStorage, "rangeOfTextBlock:atIndex:", v30, v24);
              v32.length = v33;
            }
            if (v32.length)
            {
              v40.location = v19;
              v40.length = v18;
              v34 = NSUnionRange(v40, v32);
              v19 = v34.location;
              v18 = v34.length;
            }
          }
        }
        v16 = v27;
      }
    }
  }
  v17 = v16 != 0;
  length = v18;
  location = v19;
  if (a4)
LABEL_29:
    *a4 = v17;
LABEL_30:
  v35 = location;
  v36 = length;
  result.length = v36;
  result.location = v35;
  return result;
}

- (NSUInteger)firstUnlaidGlyphIndex
{
  NSUInteger v3;

  v3 = 0;
  _getFirstUnlaid(self, 0, &v3);
  return v3;
}

- (_NSRange)_blockRowRangeForCharRange:(_NSRange)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[NSLayoutManager _blockRowRangeForCharRange:completeRows:](self, "_blockRowRangeForCharRange:completeRows:", a3.location, a3.length, 0);
  result.length = v4;
  result.location = v3;
  return result;
}

- (NSUInteger)firstUnlaidCharacterIndex
{
  NSUInteger v3;

  v3 = 0;
  _getFirstUnlaid(self, &v3, 0);
  return v3;
}

- (void)_primitiveInvalidateDisplayForGlyphRange:(_NSRange)a3
{
  unint64_t length;
  NSUInteger location;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSRunStorage *containerRuns;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  NSRunStorage *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  unint64_t v35;
  unint64_t v36;
  NSRunStorage *v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  NSRunStorage *v41;
  unint64_t v42;
  unint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  unint64_t v77;
  unint64_t v78;
  double v79;
  NSRunStorage *v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  CGFloat v93;
  double v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat v100;
  CGFloat v101;
  CGFloat v102;
  CGFloat v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  NSRange v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  CGFloat v120;
  CGFloat v121;
  CGFloat v122;
  CGFloat v123;
  CGFloat v124;
  CGFloat v125;
  CGFloat v126;
  CGFloat v127;
  double v128;
  double v129;
  double v130;
  double v131;
  uint64_t v132;
  uint64_t v133;
  NSUInteger v134;
  NSTextContainer *extraLineFragmentContainer;
  uint64_t v136;
  void *v137;
  __int128 v138;
  __int128 v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  void *v145;
  double v146;
  unint64_t v147;
  double v148;
  double v149;
  double v150;
  double v151;
  CGFloat v152;
  double v153;
  double v154;
  double v155;
  CGFloat v156;
  double v157;
  CGFloat v158;
  double v159;
  double v160;
  CGFloat v161;
  CGFloat v162;
  CGFloat v163;
  CGFloat v164;
  CGFloat v165;
  __lmFlags lmFlags;
  unint64_t v167;
  NSRunStorage *v168;
  unint64_t v169;
  unint64_t v170;
  void *v171;
  uint64_t v172;
  void *v173;
  CGFloat v174;
  CGFloat v175;
  CGFloat v176;
  CGFloat v177;
  double v178;
  double v179;
  double v180;
  double v181;
  char v182;
  uint64_t v183;
  CGFloat v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  _QWORD v195[6];
  uint64_t v196;
  uint64_t v197;
  _QWORD v198[2];
  uint64_t (*v199)(uint64_t, uint64_t, double, double, double, double);
  void *v200;
  void *v201;
  __int128 *v202;
  __int128 v203;
  __int128 v204;
  void (*v205)(uint64_t);
  uint64_t v206;
  __n128 v207;
  NSRange v208;
  NSRange v209;
  NSRect v210;
  NSRect v211;
  NSRect v212;
  NSRect v213;
  NSRect v214;
  NSRect v215;
  NSRect v216;
  NSRect v217;
  NSRect v218;
  NSRect v219;
  NSRect v220;
  NSRect v221;
  NSRect v222;
  NSRect v223;
  NSRect v224;
  NSRect v225;
  NSRect v226;
  NSRect v227;
  NSRect v228;
  NSRect v229;
  NSRect v230;
  NSRect v231;
  NSRect v232;
  NSRect v233;
  NSRect v234;
  NSRect v235;
  NSRect v236;
  NSRect v237;
  NSRect v238;
  NSRect v239;
  NSRect v240;

  length = a3.length;
  location = a3.location;
  if (a3.length)
  {
    v207 = 0uLL;
    v6 = (void *)*((_QWORD *)self->_extraData + 55);
    *(_QWORD *)&v203 = 0;
    *((_QWORD *)&v203 + 1) = &v203;
    *(_QWORD *)&v204 = 0x3052000000;
    *((_QWORD *)&v204 + 1) = __Block_byref_object_copy__7;
    v205 = __Block_byref_object_dispose__7;
    v206 = 0;
    v7 = objc_msgSend(v6, "count");
    if (v7)
      v7 = objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v206 = v7;
    v8 = MEMORY[0x1E0C809B0];
    v198[0] = MEMORY[0x1E0C809B0];
    v198[1] = 3221225472;
    v199 = __60__NSLayoutManager__primitiveInvalidateDisplayForGlyphRange___block_invoke;
    v200 = &unk_1E2604C70;
    v201 = v6;
    v202 = &v203;
    if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
    {
      v13 = *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8);
      v207.n128_u64[0] = 0;
      v207.n128_u64[1] = v13;
      v14 = (void *)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
    }
    else if (-[NSRunStorage count](self->_containerRuns, "count") <= location)
    {
      v14 = 0;
    }
    else
    {
      containerRuns = self->_containerRuns;
      _NSBlockNumberForIndex(containerRuns, location, &v207);
      if (containerRuns->_gapBlockIndex <= v10)
        v11 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
      else
        v11 = 0;
      v14 = *(void **)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v11 + v10)];
    }
    if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) == 0 && location && location == v207.n128_u64[0])
    {
      if (-[NSRunStorage count](self->_containerRuns, "count") <= location - 1)
      {
        v18 = 0;
      }
      else
      {
        v15 = self->_containerRuns;
        _NSBlockNumberForIndex(v15, location - 1, 0);
        v17 = v15->_gapBlockIndex <= v16 ? v15->_maxBlocks - v15->_numBlocks : 0;
        v18 = *(void **)&v15->_runs->var1[(v15->_elementSize + 8) * (v17 + v16)];
      }
      v19 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, location - 1, 0);
      v21 = v20;
      v23 = v22;
      v24 = (void *)objc_msgSend(v18, "textView", v19);
      if (v24)
      {
        objc_msgSend(v18, "textContainerOrigin");
        v26 = v25;
        objc_msgSend(v24, "bounds");
        v28 = v27;
        v30 = v29;
        v31 = v23 + v21 + v26;
        v34 = v32 + v33 - v31;
        objc_msgSend(v24, "setNeedsDisplayInRect:avoidAdditionalLayout:", 1, v27, v31);
        v199((uint64_t)v198, (uint64_t)v24, v28, v31, v30, v34);
      }
    }
    if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0
      || ((v35 = -[NSRunStorage count](self->_containerRuns, "count"), v36 = location + length - 1, v35 <= v36)
        ? (v40 = 0)
        : ((v37 = self->_containerRuns, _NSBlockNumberForIndex(v37, v36, 0), v37->_gapBlockIndex <= v38)
         ? (v39 = v37->_maxBlocks - v37->_numBlocks)
         : (v39 = 0),
           v40 = *(void **)&v37->_runs->var1[(v37->_elementSize + 8) * (v39 + v38)]),
          v14 == v40))
    {
      v12 = (void *)objc_msgSend(v14, "textView");
      if (v12)
      {
        if ((*(_DWORD *)&self->_lmFlags & 0x40000000) != 0 && !*((_QWORD *)self->_extraData + 23))
        {
          _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, location, 0);
          v64 = v63;
          v65 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, location + length - 1, 0);
          v67 = v66;
          v69 = v68;
          objc_msgSend(v12, "bounds", v65);
          v71 = v70;
          v73 = v72;
          objc_msgSend(v14, "textContainerOrigin");
          v75 = v64 + v74;
          v76 = v67 + v69 - v64;
          objc_msgSend(v12, "setNeedsDisplayInRect:avoidAdditionalLayout:", 1, v71, v75, v73, v76);
          v199((uint64_t)v198, (uint64_t)v12, v71, v75, v73, v76);
        }
        else
        {
          -[NSLayoutManager _boundingRectForGlyphRange:inTextContainer:fast:fullLineRectsOnly:](self, "_boundingRectForGlyphRange:inTextContainer:fast:fullLineRectsOnly:", location, length, v14, (*(_DWORD *)&self->_lmFlags & 2) == 0, 1);
          v45 = v44;
          v47 = v46;
          v49 = v48;
          v51 = v50;
          objc_msgSend(v14, "textContainerOrigin");
          v191 = v53;
          v193 = v52;
          if (*((_QWORD *)self->_extraData + 23))
          {
            v210.origin.x = _NSTextBlockBoundingRectAtIndex((uint64_t)self, location);
            x = v210.origin.x;
            y = v210.origin.y;
            width = v210.size.width;
            height = v210.size.height;
            if (!NSIsEmptyRect(v210))
            {
              v211.origin.x = v45;
              v211.origin.y = v47;
              v211.size.width = v49;
              v211.size.height = v51;
              v233.origin.x = x;
              v233.origin.y = y;
              v233.size.width = width;
              v233.size.height = height;
              v212 = NSUnionRect(v211, v233);
              v45 = v212.origin.x;
              v47 = v212.origin.y;
              v49 = v212.size.width;
              v51 = v212.size.height;
            }
            v213.origin.x = _NSTextBlockBoundingRectAtIndex((uint64_t)self, location + length - 1);
            v58 = v213.origin.x;
            v59 = v213.origin.y;
            v60 = v213.size.width;
            v61 = v213.size.height;
            if (!NSIsEmptyRect(v213))
            {
              v214.origin.x = v45;
              v214.origin.y = v47;
              v214.size.width = v49;
              v214.size.height = v51;
              v234.origin.x = v58;
              v234.origin.y = v59;
              v234.size.width = v60;
              v234.size.height = v61;
              v215 = NSUnionRect(v214, v234);
              v45 = v215.origin.x;
              v47 = v215.origin.y;
              v49 = v215.size.width;
              v51 = v215.size.height;
            }
          }
          objc_msgSend(v12, "setNeedsDisplayInRect:avoidAdditionalLayout:", 1, v193 + v45, v191 + v47, v49, v51);
          v199((uint64_t)v198, (uint64_t)v12, v193 + v45, v191 + v47, v49, v51);
        }
      }
    }
    else
    {
      v196 = 0;
      v197 = 0;
      if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
      {
        v62 = (void *)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
      }
      else if (-[NSRunStorage count](self->_containerRuns, "count") <= location)
      {
        v62 = 0;
      }
      else
      {
        v41 = self->_containerRuns;
        _NSBlockNumberForIndex(v41, location, 0);
        if (v41->_gapBlockIndex <= v42)
          v43 = v41->_maxBlocks - v41->_numBlocks;
        else
          v43 = 0;
        v62 = *(void **)&v41->_runs->var1[(v41->_elementSize + 8) * (v43 + v42)];
      }
      v77 = location;
      v78 = location;
      do
      {
        v79 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v78, &v196);
        if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
        {
          v83 = -[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0, v79);
        }
        else if (-[NSRunStorage count](self->_containerRuns, "count", v79) <= v78)
        {
          v83 = 0;
        }
        else
        {
          v80 = self->_containerRuns;
          _NSBlockNumberForIndex(v80, v78, 0);
          if (v80->_gapBlockIndex <= v81)
            v82 = v80->_maxBlocks - v80->_numBlocks;
          else
            v82 = 0;
          v83 = *(_QWORD *)&v80->_runs->var1[(v80->_elementSize + 8) * (v82 + v81)];
        }
        if ((void *)v83 != v62)
        {
          v84 = (void *)objc_msgSend(v62, "textView");
          v85 = v84;
          if (v84)
          {
            objc_msgSend(v84, "bounds");
            v192 = v87;
            v194 = v86;
            -[NSLayoutManager _boundingRectForGlyphRange:inTextContainer:fast:fullLineRectsOnly:](self, "_boundingRectForGlyphRange:inTextContainer:fast:fullLineRectsOnly:", v77, v78 - v77, v62, (*(_DWORD *)&self->_lmFlags & 2) == 0, 1);
            v89 = v88;
            v91 = v90;
            v93 = v92;
            v95 = v94;
            if (*((_QWORD *)self->_extraData + 23) && v78 > v77)
            {
              v216.origin.x = _NSTextBlockBoundingRectAtIndex((uint64_t)self, v77);
              v96 = v216.origin.x;
              v97 = v216.origin.y;
              v98 = v216.size.width;
              v99 = v216.size.height;
              if (!NSIsEmptyRect(v216))
              {
                v217.origin.x = v89;
                v217.origin.y = v91;
                v217.size.width = v93;
                v217.size.height = v95;
                v235.origin.x = v96;
                v235.origin.y = v97;
                v235.size.width = v98;
                v235.size.height = v99;
                v218 = NSUnionRect(v217, v235);
                v89 = v218.origin.x;
                v91 = v218.origin.y;
                v93 = v218.size.width;
                v95 = v218.size.height;
              }
              v219.origin.x = _NSTextBlockBoundingRectAtIndex((uint64_t)self, v78 - 1);
              v100 = v219.origin.x;
              v101 = v219.origin.y;
              v102 = v219.size.width;
              v103 = v219.size.height;
              if (!NSIsEmptyRect(v219))
              {
                v220.origin.x = v89;
                v220.origin.y = v91;
                v220.size.width = v93;
                v220.size.height = v95;
                v236.origin.x = v100;
                v236.origin.y = v101;
                v236.size.width = v102;
                v236.size.height = v103;
                v221 = NSUnionRect(v220, v236);
                v89 = v221.origin.x;
                v91 = v221.origin.y;
                v93 = v221.size.width;
                v95 = v221.size.height;
              }
            }
            objc_msgSend(v62, "textContainerOrigin");
            v222.origin.x = v89 + v104;
            v222.origin.y = v91 + v105;
            v237.size.height = v194 + v192 - v222.origin.y;
            v222.size.width = v93;
            v222.size.height = v95;
            v237.origin.x = v222.origin.x;
            v237.origin.y = v222.origin.y;
            v237.size.width = v93;
            v223 = NSUnionRect(v222, v237);
            v106 = v223.origin.x;
            v107 = v223.origin.y;
            v108 = v223.size.width;
            v109 = v223.size.height;
            objc_msgSend(v85, "setNeedsDisplayInRect:avoidAdditionalLayout:", 1);
            v199((uint64_t)v198, (uint64_t)v85, v106, v107, v108, v109);
            v62 = (void *)v83;
            v77 = v78;
          }
          else
          {
            v62 = (void *)v83;
            v77 = v78;
          }
        }
        v78 = v197 + v196;
      }
      while (v197 + v196 >= location && v197 + v196 - location < length);
      v12 = (void *)objc_msgSend(v62, "textView");
      if (v12)
      {
        v208.length = v78 - v77;
        v208.location = v77;
        v209.location = location;
        v209.length = length;
        v111 = NSIntersectionRange(v208, v209);
        -[NSLayoutManager _boundingRectForGlyphRange:inTextContainer:fast:fullLineRectsOnly:](self, "_boundingRectForGlyphRange:inTextContainer:fast:fullLineRectsOnly:", v111.location, v111.length, v62, (*(_DWORD *)&self->_lmFlags & 2) == 0, 1);
        v113 = v112;
        v115 = v114;
        v117 = v116;
        v119 = v118;
        if (*((_QWORD *)self->_extraData + 23) && v111.length)
        {
          v224.origin.x = _NSTextBlockBoundingRectAtIndex((uint64_t)self, v111.location);
          v120 = v224.origin.x;
          v121 = v224.origin.y;
          v122 = v224.size.width;
          v123 = v224.size.height;
          if (!NSIsEmptyRect(v224))
          {
            v225.origin.x = v113;
            v225.origin.y = v115;
            v225.size.width = v117;
            v225.size.height = v119;
            v238.origin.x = v120;
            v238.origin.y = v121;
            v238.size.width = v122;
            v238.size.height = v123;
            v226 = NSUnionRect(v225, v238);
            v113 = v226.origin.x;
            v115 = v226.origin.y;
            v117 = v226.size.width;
            v119 = v226.size.height;
          }
          v227.origin.x = _NSTextBlockBoundingRectAtIndex((uint64_t)self, v111.length + v111.location - 1);
          v124 = v227.origin.x;
          v125 = v227.origin.y;
          v126 = v227.size.width;
          v127 = v227.size.height;
          if (!NSIsEmptyRect(v227))
          {
            v228.origin.x = v113;
            v228.origin.y = v115;
            v228.size.width = v117;
            v228.size.height = v119;
            v239.origin.x = v124;
            v239.origin.y = v125;
            v239.size.width = v126;
            v239.size.height = v127;
            v229 = NSUnionRect(v228, v239);
            v113 = v229.origin.x;
            v115 = v229.origin.y;
            v117 = v229.size.width;
            v119 = v229.size.height;
          }
        }
        objc_msgSend(v62, "textContainerOrigin");
        v129 = v113 + v128;
        v131 = v115 + v130;
        objc_msgSend(v12, "setNeedsDisplayInRect:avoidAdditionalLayout:", 1, v129, v131, v117, v119);
        v199((uint64_t)v198, (uint64_t)v12, v129, v131, v117, v119);
      }
      v8 = MEMORY[0x1E0C809B0];
    }
    if (objc_msgSend(*(id *)(*((_QWORD *)&v203 + 1) + 40), "count"))
    {
      v132 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", location, length, 0);
      v195[0] = v8;
      v195[1] = 3221225472;
      v195[2] = __60__NSLayoutManager__primitiveInvalidateDisplayForGlyphRange___block_invoke_3;
      v195[3] = &unk_1E2604C98;
      v195[4] = self;
      v195[5] = &v203;
      -[NSTextStorage enumerateAttribute:inRange:options:usingBlock:](-[NSLayoutManager textStorage](self, "textStorage"), "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSAttachment"), v132, v133, 0x100000, v195);
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      objc_msgSend(*(id *)(*((_QWORD *)&v203 + 1) + 40), "enumerateObjectsUsingBlock:", &__block_literal_global_13);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      objc_msgSend(*((id *)self->_extraData + 55), "minusSet:", *(_QWORD *)(*((_QWORD *)&v203 + 1) + 40));
    }
    _Block_object_dispose(&v203, 8);
  }
  else
  {
    v12 = 0;
  }
  v134 = location + length;
  if (location + length >= *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8))
  {
    extraLineFragmentContainer = self->_extraLineFragmentContainer;
    if (extraLineFragmentContainer)
    {
      v136 = -[NSTextContainer textView](extraLineFragmentContainer, "textView");
      if (!v136)
        goto LABEL_95;
      v137 = (void *)v136;
      v203 = 0u;
      v204 = 0u;
      _NSLayoutTreeGetExtraLineFragmentRect((uint64_t)self, (uint64_t)&v203, 0);
      v138 = v203;
      v139 = v204;
      objc_msgSend(v137, "textContainerOrigin");
      v141 = *(double *)&v138 + v140;
      v143 = *((double *)&v138 + 1) + v142;
      v144 = *((double *)&v139 + 1) + *((double *)&v139 + 1);
      v145 = v137;
      v146 = *(double *)&v139;
    }
    else
    {
      if (!v134)
        goto LABEL_95;
      if ((*(_BYTE *)&self->_lmFlags & 2) == 0)
        goto LABEL_95;
      v147 = v134 - 1;
      if (!_NSLayoutTreeLineFragmentDrawsOutsideLineForGlyphAtIndex((uint64_t)self, v134 - 1))
        goto LABEL_95;
      v148 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v147, 0);
      v150 = v149;
      v152 = v151;
      v154 = v153;
      objc_msgSend(v12, "textContainerOrigin");
      v156 = v148 + v155;
      v158 = v150 + v157 + v154;
      objc_msgSend(v12, "bounds");
      v161 = v159 + v160 - v158;
      objc_msgSend(v12, "visibleRect");
      v240.origin.x = v162;
      v240.origin.y = v163;
      v240.size.width = v164;
      v240.size.height = v165;
      v230.origin.x = v156;
      v230.origin.y = v158;
      v230.size.width = v152;
      v230.size.height = v161;
      *(NSRect *)&v141 = NSIntersectionRect(v230, v240);
      v145 = v12;
    }
    objc_msgSend(v145, "setNeedsDisplayInRect:avoidAdditionalLayout:", 1, v141, v143, v146, v144);
  }
LABEL_95:
  lmFlags = self->_lmFlags;
  if ((*(_BYTE *)&lmFlags & 2) != 0 && location)
  {
    *(_QWORD *)&v203 = location;
    *((_QWORD *)&v203 + 1) = length;
    v207 = 0uLL;
    if ((*(_DWORD *)&lmFlags & 0x40000000) != 0)
    {
      v207.n128_u64[1] = *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8);
      v171 = (void *)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
    }
    else
    {
      v167 = location - 1;
      if (-[NSRunStorage count](self->_containerRuns, "count") <= location - 1)
      {
        v171 = 0;
      }
      else
      {
        v168 = self->_containerRuns;
        _NSBlockNumberForIndex(v168, v167, &v207);
        v170 = v168->_gapBlockIndex <= v169 ? v168->_maxBlocks - v168->_numBlocks : 0;
        v171 = *(void **)&v168->_runs->var1[(v168->_elementSize + 8) * (v170 + v169)];
      }
    }
    v172 = objc_msgSend(v171, "textView");
    if (v172)
    {
      v173 = (void *)v172;
      v175 = *MEMORY[0x1E0CB3438];
      v174 = *(double *)(MEMORY[0x1E0CB3438] + 8);
      v177 = *(double *)(MEMORY[0x1E0CB3438] + 16);
      v176 = *(double *)(MEMORY[0x1E0CB3438] + 24);
      objc_msgSend(v171, "textContainerOrigin");
      v179 = v178;
      v181 = v180;
      v182 = 0;
      v183 = 50;
      while ((unint64_t)v203 > v207.n128_u64[0]
           && _NSLayoutTreeOutsideDrawsUponLineFragmentForGlyphAtIndex((uint64_t)self, v203 - 1))
      {
        v184 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v203 - 1, (uint64_t *)&v203);
        v186 = v185;
        v188 = v187;
        v190 = v189;
        if ((v182 & 1) != 0)
        {
          v231.origin.x = v175;
          v231.origin.y = v174;
          v231.size.width = v177;
          v231.size.height = v176;
          v232 = NSUnionRect(v231, *(NSRect *)&v184);
          v184 = v232.origin.x;
          v186 = v232.origin.y;
          v188 = v232.size.width;
          v190 = v232.size.height;
        }
        v182 = 1;
        v176 = v190;
        v177 = v188;
        v174 = v186;
        v175 = v184;
        if (!--v183)
          goto LABEL_114;
      }
      v190 = v176;
      v188 = v177;
      v186 = v174;
      v184 = v175;
      if ((v182 & 1) == 0)
        return;
LABEL_114:
      objc_msgSend(v173, "setNeedsDisplayInRect:avoidAdditionalLayout:", 1, v179 + v184, v181 + v186, v188, v190);
    }
  }
}

- (void)_invalidateGlyphsForCharacterRange:(_NSRange)a3 editedCharacterRange:(_NSRange)a4 changeInLength:(int64_t)a5 actualCharacterRange:(_NSRange *)a6
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v10;
  NSUInteger v11;
  void *v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  uint64_t v17;
  int v18;
  _QWORD *extraData;
  unint64_t v20;

  length = a4.length;
  location = a4.location;
  v10 = a3.length;
  v11 = a3.location;
  v13 = (void *)-[NSTextStorage string](self->_textStorage, "string");
  v14 = -[NSLayoutManager _extendedCharRangeForInvalidation:editedCharRange:](self, "_extendedCharRangeForInvalidation:editedCharRange:", v11, v10, location, length);
  v16 = v14;
  v17 = *((_QWORD *)self->_extraData + 45);
  if (a6)
  {
    a6->location = v14;
    a6->length = v15;
  }
  -[NSLayoutManager _invalidateGlyphsForExtendedCharacterRange:changeInLength:](self, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:", v14, v15, a5);
  if (a5 == 1 && length == 1 && *((_QWORD *)self->_extraData + 45))
  {
    v18 = objc_msgSend(v13, "characterAtIndex:", location);
    if (v18 > 132)
    {
      if ((v18 - 8232) >= 2 && v18 != 133)
      {
LABEL_17:
        if (!v17)
        {
          extraData = self->_extraData;
          v20 = extraData[44];
          if (v20 >= v16 + 1 && v20 < location + 1)
            extraData[44] = v20 - 1;
        }
        return;
      }
    }
    else if (v18 != 10
           && v18 != 12
           && (v18 != 13
            || location + 1 < objc_msgSend(v13, "length")
            && objc_msgSend(v13, "characterAtIndex:", location + 1) == 10))
    {
      goto LABEL_17;
    }
    *((_OWORD *)self->_extraData + 22) = xmmword_18D6CBB80;
    *((_OWORD *)self->_extraData + 23) = *MEMORY[0x1E0CB3440];
  }
}

- (void)_invalidateGlyphsForExtendedCharacterRange:(_NSRange)a3 changeInLength:(int64_t)a4 includeBlocks:(BOOL)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  _QWORD *extraData;
  __lmFlags lmFlags;
  NSUInteger *v12;
  NSUInteger v13;
  unint64_t v15;
  NSUInteger *v16;
  double v17;
  double v18;
  NSRunStorage *containerRuns;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _NSRange *p_cachedFontCharRange;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  NSUInteger v32;
  uint64_t v33;
  void *v34;
  void *v35;
  char v36;
  _BOOL4 v37;
  _BOOL4 v38;
  NSUInteger v39;
  uint64_t v40;
  uint64_t v41;
  NSRange v42;

  v38 = a5;
  length = a3.length;
  location = a3.location;
  v9 = a3.length - a4;
  v39 = a3.location;
  v40 = a3.length - a4;
  extraData = self->_extraData;
  v37 = (*(_BYTE *)(extraData[26] + 56) & 1) == 0 && (*(_BYTE *)(extraData[30] + 56) & 1) == 0;
  *(_DWORD *)&self->_lmFlags &= ~1u;
  self->_firstUnlaidGlyphIndex = 0x7FFFFFFFFFFFFFFFLL;
  self->_firstUnlaidCharIndex = 0x7FFFFFFFFFFFFFFFLL;
  _NSClearGlyphIndexForPointCache((uint64_t)self);
  self->_cachedLocationNominalGlyphRange = (_NSRange)xmmword_18D6CBB80;
  lmFlags = self->_lmFlags;
  if ((unint64_t)a4 <= 1)
  {
    if ((*(_DWORD *)&lmFlags & 0x40000000) != 0 && self->_firstTextView && !*((_QWORD *)self->_extraData + 45))
    {
      -[NSLayoutManager _noteFirstTextViewVisibleCharacterRangeIfAfterIndex:](self, "_noteFirstTextViewVisibleCharacterRangeIfAfterIndex:", location);
      if (*((_QWORD *)self->_extraData + 45))
        *((_QWORD *)self->_extraData + 44) += a4;
      if (a4)
        goto LABEL_23;
    }
    else if (a4)
    {
      goto LABEL_9;
    }
    if (*((_QWORD *)self->_extraData + 48) == location && *((_QWORD *)self->_extraData + 49) == v9)
      goto LABEL_34;
    goto LABEL_23;
  }
LABEL_9:
  if ((*(_DWORD *)&lmFlags & 0x40000000) != 0)
  {
    if (self->_firstTextView)
    {
      v12 = (NSUInteger *)((char *)self->_extraData + 352);
      if (*((_QWORD *)self->_extraData + 45))
      {
        v13 = *v12;
        if (v9 + location <= *v12)
        {
          *v12 = v13 + a4;
        }
        else if (location <= v13)
        {
          *(_OWORD *)v12 = xmmword_18D6CBB80;
          *((_OWORD *)self->_extraData + 23) = *MEMORY[0x1E0CB3440];
        }
      }
    }
  }
LABEL_23:
  if (!length || length == a4)
  {
    v22 = 0;
    *((_OWORD *)self->_extraData + 24) = xmmword_18D6CBB80;
    *((_QWORD *)self->_extraData + 50) = 0;
  }
  else
  {
    v15 = _NSGlyphTreeGlyphIndexForCharacterAtIndex((uint64_t)self, location + v9 - 1);
    v16 = (NSUInteger *)((char *)self->_extraData + 384);
    *v16 = location;
    v16[1] = length;
    _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v15, 0);
    *((double *)self->_extraData + 50) = v17 + v18;
    if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
    {
      v22 = -[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
    }
    else if (-[NSRunStorage count](self->_containerRuns, "count") <= v15)
    {
      v22 = 0;
    }
    else
    {
      containerRuns = self->_containerRuns;
      _NSBlockNumberForIndex(containerRuns, v15, 0);
      v21 = 0;
      if (containerRuns->_gapBlockIndex <= v20)
        v21 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
      v22 = *(_QWORD *)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v21 + v20)];
    }
  }
  *((_QWORD *)self->_extraData + 51) = v22;
LABEL_34:
  _NSGlyphTreePrepareToInvalidateGlyphsForCharacterRange((uint64_t)self, location, v9, a4);
  p_cachedFontCharRange = &self->_cachedFontCharRange;
  v42.location = location;
  v42.length = v9;
  if (NSIntersectionRange((NSRange)self[184], v42).length)
  {
    *p_cachedFontCharRange = (_NSRange)xmmword_18D6CBB80;
  }
  else if (p_cachedFontCharRange->location > location)
  {
    p_cachedFontCharRange->location += a4;
  }
  v28 = _NSGlyphTreeGlyphRangeForCharacterRange((uint64_t)self, location, v9, 0, 0, 1, (uint64_t *)&v39);
  v29 = v24;
  if (v40 + v39 >= v9 + location)
    v30 = v40 + v39 - (v9 + location);
  else
    v30 = 0;
  if (v24)
  {
    -[NSRunStorage removeElementsInRange:coalesceRuns:](self->_containerRuns, "removeElementsInRange:coalesceRuns:", v28, v24, 1);
    if (v38)
    {
      v31 = (void *)*((_QWORD *)self->_extraData + 23);
      if (v31)
        _NSDeleteGlyphRangeFromTextBlocks(v31, v28, v29);
    }
  }
  v32 = location + length + v30;
  v41 = 0;
  v33 = v32 - v39;
  if (v32 == v39)
  {
    if (v38)
      goto LABEL_54;
    goto LABEL_52;
  }
  -[NSRunStorage insertElement:range:coalesceRuns:](self->_containerRuns, "insertElement:range:coalesceRuns:", &v41, v28, v33, 1);
  if (!v38)
  {
LABEL_52:
    v35 = (void *)*((_QWORD *)self->_extraData + 23);
    if (v35)
      _NSRemoveTextBlocksForGlyphRange(v35, v28, v29);
    goto LABEL_54;
  }
  v34 = (void *)*((_QWORD *)self->_extraData + 23);
  if (v34)
    _NSInsertGlyphRangeInTextBlocks(v34, v28, v33);
LABEL_54:
  _NSGlyphTreeInvalidateGlyphsForCharacterRange((uint64_t)self, v39, v40, a4, 0, v25, v26, v27, v36);
  if ((*(_BYTE *)(*((_QWORD *)self->_extraData + 26) + 56) & 2) == 0)
    *(_DWORD *)&self->_lmFlags &= 0xF5EFFFFC;
  if (v37
    && (*((_BYTE *)&self->_lmFlags + 1) & 0x10) != 0
    && (*(_BYTE *)(*((_QWORD *)self->_extraData + 26) + 56) & 1) != 0)
  {
    objc_msgSend(-[NSLayoutManager delegate](self, "delegate"), "layoutManagerDidInvalidateLayout:", self);
  }
}

- (void)_fillGlyphHoleForCharacterRange:(_NSRange)a3 startGlyphIndex:(unint64_t)a4 desiredNumberOfCharacters:(unint64_t)a5
{
  NSUInteger length;
  unint64_t v9;
  _QWORD *extraData;
  BOOL v11;
  void *v12;
  unint64_t *v13;
  _BOOL4 v15;
  unint64_t v16;
  NSUInteger location;
  unint64_t v18;
  NSUInteger v19;
  NSUInteger v20;

  length = a3.length;
  location = a3.location;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  if ((*(_DWORD *)&self->_lmFlags & 0x8000000) != 0)
    v9 = 2048;
  else
    v9 = 0x2000;
  extraData = self->_extraData;
  v11 = -[NSAttributedString _isStringDrawingTextStorage](-[NSLayoutManager textStorage](self, "textStorage"), "_isStringDrawingTextStorage");
  if (!v11 && !extraData[7])
  {
    v12 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB38E0], "allocWithZone:", -[NSLayoutManager zone](self, "zone")), "init");
    v13 = extraData + 7;
    while (!__ldaxr(v13))
    {
      if (!__stlxr((unint64_t)v12, v13))
        goto LABEL_11;
    }
    __clrex();

  }
LABEL_11:
  objc_msgSend((id)extraData[7], "lock");
  v15 = -[NSTextStorage _lockForReading](self->_textStorage, "_lockForReading");
  if ((*(_DWORD *)&self->_lmFlags & 0x30000) == 0x10000
    && -[NSTextStorage _isEditing](self->_textStorage, "_isEditing"))
  {
    if (v15)
      -[NSTextStorage _unlock](self->_textStorage, "_unlock");
    if (!v11)
      objc_msgSend(*((id *)self->_extraData + 7), "unlock");
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@ *** attempted glyph generation while textStorage is editing.  It is not valid to cause the layoutManager to do glyph generation while the textStorage is editing (ie the textStorage has been sent a beginEditing message without a matching endEditing.)"), _NSFullMethodName());
  }
  if ((*((_BYTE *)&self->_lmFlags + 2) & 8) != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("*** layout manager %p reentrant glyph generation problem."), self);
  if (a5)
    v16 = a5;
  else
    v16 = length;
  if (v16 <= v9)
    v16 = v9;
  self->_cachedLocationNominalGlyphRange = (_NSRange)xmmword_18D6CBB80;
  self->_newlyFilledGlyphRange.location = a4;
  self->_newlyFilledGlyphRange.length = 0;
  if (length >= v16)
    length = v16;
  *(_DWORD *)&self->_lmFlags |= 0x80000u;
  -[NSTextStorage _setForceFixAttributes:](self->_textStorage, "_setForceFixAttributes:", 1);
  v18 = a4;
  v19 = location;
  -[NSGlyphGenerator generateGlyphsForGlyphStorage:desiredNumberOfCharacters:glyphIndex:characterIndex:](-[NSLayoutManager glyphGenerator](self, "glyphGenerator"), "generateGlyphsForGlyphStorage:desiredNumberOfCharacters:glyphIndex:characterIndex:", self, length, &v18, &v19);
  v20 = v19 - location;
  -[NSTextStorage _setForceFixAttributes:](self->_textStorage, "_setForceFixAttributes:", 0);
  *(_DWORD *)&self->_lmFlags &= ~0x80000u;
  self->_newlyFilledGlyphRange = (_NSRange)xmmword_18D6CBB80;
  if (v15)
    -[NSTextStorage _unlock](self->_textStorage, "_unlock");
  if (!v11)
    objc_msgSend(*((id *)self->_extraData + 7), "unlock");
}

- (void)setGlyphs:(const CGGlyph *)glyphs properties:(const NSGlyphProperty *)props characterIndexes:(const NSUInteger *)charIndexes font:(UIFont *)aFont forGlyphRange:(NSRange)glyphRange
{
  NSUInteger location;
  const CGGlyph *v11;
  const CGGlyph *v12;
  unint64_t v13;
  size_t v14;
  NSUInteger v15;
  NSUInteger v16;
  NSGlyphProperty v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const NSGlyphProperty *v23;
  NSGlyphProperty v24;
  __lmFlags lmFlags;
  unsigned int v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((uint64_t)glyphRange.length >= 1)
  {
    location = glyphRange.location;
    v11 = glyphs;
    v12 = &glyphs[glyphRange.length];
    do
    {
      v13 = v12 - v11;
      if (v13 >= 0x80)
        v13 = 128;
      if (v13)
      {
        v14 = 0;
        v15 = -1;
        while (1)
        {
          v16 = v15;
          v15 = charIndexes[v14];
          if (v16 == v15)
            break;
          v17 = props[v14];
          if ((v17 & 1) != 0)
          {
            v18 = 0;
          }
          else if ((v17 & 2) != 0)
          {
            v18 = 0xFFFFFF;
          }
          else
          {
            v18 = v11[v14];
          }
          v26[v14++] = v18;
          if (v13 == v14)
          {
            v14 = v13;
            break;
          }
        }
        _NSGlyphTreeInsertGlyphs((uint64_t)self, *charIndexes, location, v14, v26);
        if (v14)
        {
          v23 = &props[v14];
          do
          {
            v24 = *props;
            if ((*props & 4) != 0)
            {
              _NSGlyphTreeSetIntAttributeForGlyphAtIndex((uint64_t)self, location, 1, 1, v19, v20, v21, v22, v26[0]);
              v24 = *props;
            }
            if ((v24 & 8) != 0)
              _NSGlyphTreeSetIntAttributeForGlyphAtIndex((uint64_t)self, location, 5, 1, v19, v20, v21, v22, v26[0]);
            ++props;
            ++location;
          }
          while (props < v23);
        }
      }
      else
      {
        _NSGlyphTreeInsertGlyphs((uint64_t)self, *charIndexes, location, 0, v26);
        v14 = 0;
      }
      v11 += v14;
      charIndexes += v14;
    }
    while (v11 < v12);
  }
  lmFlags = self->_lmFlags;
  if ((*(_DWORD *)&lmFlags & 0x80000) == 0)
    self->_lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags | 0x100000);
}

- (unint64_t)layoutOptions
{
  return (*(_DWORD *)&self->_lmFlags >> 9) & 2 | (*(_DWORD *)&self->_lmFlags >> 11) & 1u;
}

- (NSGlyphGenerator)glyphGenerator
{
  NSGlyphGenerator *result;

  result = self->_glyphGenerator;
  if (!result)
    return (NSGlyphGenerator *)+[NSGlyphGenerator defaultGlyphGenerator](NSGlyphGenerator, "defaultGlyphGenerator");
  return result;
}

- (id)attributedString
{
  return self->_textStorage;
}

- (void)_invalidateGlyphsForExtendedCharacterRange:(_NSRange)a3 changeInLength:(int64_t)a4
{
  -[NSLayoutManager _invalidateGlyphsForExtendedCharacterRange:changeInLength:includeBlocks:](self, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:includeBlocks:", a3.location, a3.length, a4, 1);
}

- (_NSRange)_extendedCharRangeForInvalidation:(_NSRange)a3 editedCharRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  NSUInteger v8;
  NSRange v9;
  NSUInteger v10;
  NSUInteger v11;
  void *v12;
  uint64_t v13;
  __lmFlags lmFlags;
  uint64_t v15;
  unint64_t v16;
  NSTypesetter *typesetter;
  unint64_t firstUnlaidCharIndex;
  _QWORD *extraData;
  uint64_t v20;
  NSTextStorage *textStorage;
  uint64_t v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *Uid;
  void *v30;
  char *v31;
  unint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  CGFloat v42;
  double v43;
  double v44;
  CGFloat v45;
  char v46;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  unint64_t v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  int v69;
  int v70;
  unint64_t v71;
  void *v72;
  uint64_t v73;
  unsigned __int16 v74;
  unint64_t v75;
  __int128 v76;
  __int16 v77;
  uint64_t v78;
  uint64_t v79;
  NSUInteger v80;
  NSUInteger v81;
  NSUInteger v82;
  NSRange v83;
  NSUInteger v84;
  NSRange v85;
  NSUInteger v86;
  NSUInteger v87;
  uint64_t v88;
  NSUInteger v89;
  NSUInteger v90;
  unint64_t v91;
  NSUInteger v92;
  void *v93;
  void *v94;
  uint64_t v95;
  unint64_t firstUnlaidGlyphIndex;
  NSUInteger v97;
  __int128 v98;
  __int128 v99;
  _OWORD v100[4];
  __int128 v101;
  char v102;
  uint64_t v103[3];
  NSRange v104;
  NSRange v105;
  _NSRange result;
  NSRange v107;
  NSRange v108;
  NSRange v109;
  NSRect v110;

  length = a3.length;
  location = a3.location;
  v7 = -[NSLayoutManager _blockRowRangeForCharRange:](self, "_blockRowRangeForCharRange:", a4.location, a4.length);
  v107.length = v8;
  v104.location = location;
  v104.length = length;
  v107.location = v7;
  v90 = v107.length;
  v9 = NSUnionRange(v104, v107);
  v10 = v9.location;
  v11 = v9.length;
  v12 = (void *)-[NSTextStorage string](self->_textStorage, "string");
  v13 = objc_msgSend(v12, "length");
  lmFlags = self->_lmFlags;
  v15 = 16;
  if ((*(_DWORD *)&lmFlags & 0x2000000) == 0)
    v15 = 56;
  v95 = v15;
  if (!v13)
    goto LABEL_140;
  v16 = v13;
  typesetter = self->_typesetter;
  v103[0] = 0;
  v103[1] = 0;
  v102 = 0;
  v98 = 0u;
  v99 = 0u;
  memset(v100, 0, sizeof(v100));
  v101 = 0u;
  firstUnlaidGlyphIndex = 0;
  v97 = 0;
  if ((*(_DWORD *)&lmFlags & 0x40000000) != 0)
  {
    extraData = self->_extraData;
    v97 = v13;
    firstUnlaidGlyphIndex = *(_QWORD *)(extraData[26] + 8);
  }
  else
  {
    firstUnlaidCharIndex = self->_firstUnlaidCharIndex;
    if (firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL || self->_firstUnlaidGlyphIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSLayoutManager getFirstUnlaidCharacterIndex:glyphIndex:](self, "getFirstUnlaidCharacterIndex:glyphIndex:", &v97, &firstUnlaidGlyphIndex);
    }
    else
    {
      firstUnlaidGlyphIndex = self->_firstUnlaidGlyphIndex;
      v97 = firstUnlaidCharIndex;
    }
  }
  v20 = -[NSTypesetter attributedString](typesetter, "attributedString");
  textStorage = self->_textStorage;
  *((_QWORD *)&v99 + 1) = v16;
  *(_QWORD *)&v100[0] = v9.location;
  if ((NSTextStorage *)v20 != textStorage)
    typesetter = 0;
  *(_QWORD *)&v99 = v12;
  if (v16 <= v9.location)
  {
    *(_QWORD *)&v98 = 0;
    v23 = -1;
  }
  else
  {
    if (v16 - v9.location >= 0x20)
      v22 = 32;
    else
      v22 = v16 - v9.location;
    *(_QWORD *)&v98 = v22;
    objc_msgSend(v12, sel_getUid("getCharacters:range:"), (char *)v100 + 8, v9.location, v22);
    v23 = WORD4(v100[0]);
  }
  WORD4(v101) = v23;
  *((_QWORD *)&v98 + 1) = 1;
  v89 = v7;
  if (!v9.location)
    goto LABEL_88;
  v91 = v16;
  if (v9.location == objc_msgSend(v12, "length"))
  {
    v24 = *((_QWORD *)&v98 + 1);
    if (*((_QWORD *)&v98 + 1) < 2uLL)
    {
      if (*(_QWORD *)&v100[0])
      {
        if (*(_QWORD *)&v100[0] >= 0x20uLL)
          v25 = 32;
        else
          v25 = *(_QWORD *)&v100[0];
        *(_QWORD *)&v98 = v25;
        *((_QWORD *)&v98 + 1) = v25;
        *(_QWORD *)&v100[0] -= v25;
        v26 = *(_QWORD *)&v100[0];
        v27 = v12;
        v28 = (void *)v99;
        Uid = sel_getUid("getCharacters:range:");
        v30 = v28;
        v12 = v27;
        objc_msgSend(v30, Uid, (char *)v100 + 8, v26, v25);
        v31 = (char *)v100 + 2 * *((_QWORD *)&v98 + 1) + 8;
LABEL_45:
        v33 = *((_WORD *)v31 - 1);
        goto LABEL_47;
      }
      goto LABEL_46;
    }
    goto LABEL_39;
  }
  if (WORD4(v101) > 0x84u)
  {
    if (WORD4(v101) - 8232 >= 2 && WORD4(v101) != 133)
      goto LABEL_48;
  }
  else if (WORD4(v101) != 10 && WORD4(v101) != 12)
  {
    if (WORD4(v101) != 13)
      goto LABEL_48;
    v32 = *((_QWORD *)&v98 + 1) + *(_QWORD *)&v100[0];
    if (v32 < objc_msgSend(v12, "length") && objc_msgSend(v12, "characterAtIndex:", v32) == 10)
      goto LABEL_48;
  }
  v24 = *((_QWORD *)&v98 + 1);
  if (!typesetter)
  {
LABEL_38:
    if (v24 < 2)
    {
      if (*(_QWORD *)&v100[0])
      {
        v34 = v12;
        if (*(_QWORD *)&v100[0] >= 0x20uLL)
          v35 = 32;
        else
          v35 = *(_QWORD *)&v100[0];
        *(_QWORD *)&v98 = v35;
        *((_QWORD *)&v98 + 1) = v35;
        *(_QWORD *)&v100[0] -= v35;
        v36 = *(_QWORD *)&v100[0];
        v37 = (void *)v99;
        v38 = sel_getUid("getCharacters:range:");
        v39 = v36;
        v16 = v91;
        v40 = v35;
        v12 = v34;
        objc_msgSend(v37, v38, (char *)v100 + 8, v39, v40);
        v31 = (char *)v100 + 2 * *((_QWORD *)&v98 + 1) + 8;
        goto LABEL_45;
      }
LABEL_46:
      *((_QWORD *)&v98 + 1) = 0;
      v33 = -1;
LABEL_47:
      WORD4(v101) = v33;
      v11 = v9.length + 1;
      v10 = v9.location - 1;
      if (v9.location == 1)
        goto LABEL_88;
      goto LABEL_48;
    }
LABEL_39:
    *((_QWORD *)&v98 + 1) = v24 - 1;
    v33 = *((_WORD *)v100 + v24 + 2);
    goto LABEL_47;
  }
  if ((-[NSTypesetter actionForControlCharacterAtIndex:](typesetter, "actionForControlCharacterAtIndex:", *(_QWORD *)&v100[0] + *((_QWORD *)&v98 + 1) - 1) & v95) != 0)
  {
    v24 = *((_QWORD *)&v98 + 1);
    goto LABEL_38;
  }
LABEL_48:
  v93 = v12;
  v88 = 0;
  v41 = 0;
  v42 = *MEMORY[0x1E0CB3438];
  v43 = *(double *)(MEMORY[0x1E0CB3438] + 8);
  v45 = *(double *)(MEMORY[0x1E0CB3438] + 16);
  v44 = *(double *)(MEMORY[0x1E0CB3438] + 24);
  v46 = 1;
  while (WORD4(v101) > 0x84u)
  {
    if (WORD4(v101) - 8232 < 2 || WORD4(v101) == 133)
      goto LABEL_60;
LABEL_62:
    v49 = v41 + 1;
    if ((*((_BYTE *)&self->_lmFlags + 3) & 2) != 0)
      goto LABEL_76;
    if (v10 >= v97)
      goto LABEL_76;
    v50 = -[NSLayoutManager _glyphIndexForCharacterIndex:startOfRange:okToFillHoles:considerNulls:](self, "_glyphIndexForCharacterIndex:startOfRange:okToFillHoles:considerNulls:", v10, 1, 0, 1);
    if (v50 >= firstUnlaidGlyphIndex)
      goto LABEL_76;
    v51 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v50, v103);
    v55 = v51;
    v56 = v52;
    v57 = v53;
    v58 = v54;
    if ((v46 & 1) != 0)
    {
      v42 = v51;
      v43 = v52;
      v45 = v53;
      v44 = v54;
    }
    v110.origin.x = v42;
    v110.origin.y = v43;
    v110.size.width = v45;
    v110.size.height = v44;
    if (NSEqualRects(*(NSRect *)&v51, v110))
    {
      v46 = 0;
    }
    else
    {
      if (v56 == v43 && v58 == v44)
      {
        v46 = 0;
LABEL_75:
        v42 = v55;
        v43 = v56;
        v45 = v57;
        v44 = v58;
        goto LABEL_76;
      }
      v46 = 0;
      v59 = ++v88;
      if (v49 < 0xB)
        goto LABEL_75;
      v42 = v55;
      v43 = v56;
      v45 = v57;
      v44 = v58;
      if (v59 >= 2)
        goto LABEL_86;
    }
LABEL_76:
    v60 = *((_QWORD *)&v98 + 1);
    if (*((_QWORD *)&v98 + 1) < 2uLL)
    {
      if (*(_QWORD *)&v100[0])
      {
        if (*(_QWORD *)&v100[0] >= 0x20uLL)
          v62 = 32;
        else
          v62 = *(_QWORD *)&v100[0];
        *(_QWORD *)&v98 = v62;
        *((_QWORD *)&v98 + 1) = v62;
        *(_QWORD *)&v100[0] -= v62;
        v63 = *(_QWORD *)&v100[0];
        v64 = (void *)v99;
        v65 = sel_getUid("getCharacters:range:");
        v66 = v63;
        v16 = v91;
        objc_msgSend(v64, v65, (char *)v100 + 8, v66, v62);
        v61 = *((_WORD *)v100 + *((_QWORD *)&v98 + 1) + 3);
      }
      else
      {
        *((_QWORD *)&v98 + 1) = 0;
        v61 = -1;
      }
    }
    else
    {
      --*((_QWORD *)&v98 + 1);
      v61 = *((_WORD *)v100 + v60 + 2);
    }
    WORD4(v101) = v61;
    v41 = v49;
    if (!--v10)
    {
      v11 += v49;
      goto LABEL_87;
    }
  }
  if (WORD4(v101) != 10 && WORD4(v101) != 12)
  {
    if (WORD4(v101) != 13)
      goto LABEL_62;
    v48 = *((_QWORD *)&v98 + 1) + *(_QWORD *)&v100[0];
    if (v48 < objc_msgSend(v93, "length") && objc_msgSend(v93, "characterAtIndex:", v48) == 10)
      goto LABEL_62;
  }
LABEL_60:
  if (typesetter
    && (-[NSTypesetter actionForControlCharacterAtIndex:](typesetter, "actionForControlCharacterAtIndex:", *(_QWORD *)&v100[0] + *((_QWORD *)&v98 + 1) - 1) & v95) == 0)
  {
    goto LABEL_62;
  }
LABEL_86:
  ++v10;
  v11 = v11 + v41 - 1;
LABEL_87:
  v12 = v93;
LABEL_88:
  v67 = v10 + v11;
  if (v10 + v11 >= v16)
    goto LABEL_138;
  if (!v11)
    goto LABEL_102;
  v68 = v67 - 1;
  if (v67 - 1 > v89 + v90)
    goto LABEL_103;
  v69 = objc_msgSend(v12, "characterAtIndex:", v67 - 1);
  if (v69 > 132)
  {
    if ((v69 - 8232) < 2 || v69 == 133)
      goto LABEL_100;
LABEL_103:
    v70 = (*(_DWORD *)&self->_lmFlags >> 25) & 1;
    if (v67 + 30000 > v16)
      v70 = 1;
    *((_QWORD *)&v99 + 1) = v16;
    *(_QWORD *)&v100[0] = v68;
    if (v70)
      v71 = v16;
    else
      v71 = v67 + 30000;
    *(_QWORD *)&v99 = v12;
    v94 = v12;
    if (v16 <= v68)
    {
      *(_QWORD *)&v98 = 0;
      v74 = -1;
    }
    else
    {
      v72 = v12;
      if (v16 - v68 >= 0x20)
        v73 = 32;
      else
        v73 = v16 - v68;
      *(_QWORD *)&v98 = v73;
      objc_msgSend(v72, sel_getUid("getCharacters:range:"), (char *)v100 + 8, v68, v73);
      v74 = WORD4(v100[0]);
    }
    WORD4(v101) = v74;
    *((_QWORD *)&v98 + 1) = 1;
    v92 = v16 - v10;
    while (1)
    {
      if (v74 > 0x84u)
      {
        if (v74 - 8232 >= 2 && v74 != 133)
          goto LABEL_126;
      }
      else if (v74 != 10 && v74 != 12)
      {
        if (v74 != 13)
          goto LABEL_126;
        v75 = *((_QWORD *)&v98 + 1) + *(_QWORD *)&v100[0];
        if (v75 < objc_msgSend(v94, "length") && objc_msgSend(v94, "characterAtIndex:", v75) == 10)
          goto LABEL_126;
      }
      if (!typesetter
        || (-[NSTypesetter actionForControlCharacterAtIndex:](typesetter, "actionForControlCharacterAtIndex:", *(_QWORD *)&v100[0] + *((_QWORD *)&v98 + 1) - 1) & v95) != 0)
      {
        goto LABEL_138;
      }
LABEL_126:
      v76 = v98;
      if (*((_QWORD *)&v98 + 1) < (unint64_t)v98)
      {
        ++*((_QWORD *)&v98 + 1);
        v77 = *((_WORD *)v100 + *((_QWORD *)&v76 + 1) + 4);
LABEL_134:
        WORD4(v101) = v77;
        goto LABEL_135;
      }
      v78 = *(_QWORD *)&v100[0] + v98;
      if (*((_QWORD *)&v99 + 1) <= *(_QWORD *)&v100[0] + (_QWORD)v98)
      {
        *((_QWORD *)&v98 + 1) = v98 + 1;
        v77 = -1;
        goto LABEL_134;
      }
      if (*((_QWORD *)&v99 + 1) - (*(_QWORD *)&v100[0] + (_QWORD)v98) >= 0x20uLL)
        v79 = 32;
      else
        v79 = *((_QWORD *)&v99 + 1) - (*(_QWORD *)&v100[0] + v98);
      *(_QWORD *)&v100[0] += v98;
      *(_QWORD *)&v98 = v79;
      objc_msgSend((id)v99, sel_getUid("getCharacters:range:"), (char *)v100 + 8, v78, v79);
      WORD4(v101) = WORD4(v100[0]);
      *((_QWORD *)&v98 + 1) = 1;
LABEL_135:
      if (v10 + 1 + v11 >= v71)
      {
        v11 = v92;
        goto LABEL_138;
      }
      v74 = WORD4(v101);
      ++v11;
    }
  }
  if (v69 != 10
    && v69 != 12
    && (v69 != 13
     || v67 < objc_msgSend(v12, "length") && objc_msgSend(v12, "characterAtIndex:", v10 + v11) == 10))
  {
    goto LABEL_103;
  }
LABEL_100:
  if (typesetter
    && (-[NSTypesetter actionForControlCharacterAtIndex:](typesetter, "actionForControlCharacterAtIndex:", v67 - 1) & v95) == 0)
  {
    goto LABEL_103;
  }
LABEL_102:
  ++v11;
  v68 = v67;
  v67 = v10 + v11;
  if (v10 + v11 < v16)
    goto LABEL_103;
LABEL_138:
  v80 = -[NSLayoutManager _blockRowRangeForCharRange:completeRows:](self, "_blockRowRangeForCharRange:completeRows:", v10, v11, &v102);
  v82 = v81;
  v105.location = v10;
  v105.length = v11;
  v108.location = v80;
  v108.length = v82;
  v83 = NSUnionRange(v105, v108);
  location = v83.location;
  length = v83.length;
  if (!v102)
  {
    v109.location = -[NSLayoutManager _blockRangeForCharRange:](self, "_blockRangeForCharRange:", v80, v82);
    v109.length = v84;
    v85 = NSUnionRange(v83, v109);
    location = v85.location;
    length = v85.length;
  }
LABEL_140:
  v86 = location;
  v87 = length;
  result.length = v87;
  result.location = v86;
  return result;
}

- (void)ensureLayoutForTextContainer:(NSTextContainer *)container
{
  id extraData;
  uint64_t v6;
  unint64_t v7;
  __lmFlags lmFlags;
  unint64_t v9;
  NSRunStorage *containerRuns;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  NSTextContainer *v14;
  BOOL v15;
  CFDictionaryRef *v16;
  int ValueIfPresent;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  __lmFlags v21;
  unsigned __int16 v22;
  __n128 v23;
  void *value;

  v23 = 0uLL;
  if (-[NSTextContainer layoutManager](container, "layoutManager") != self)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("*** %@: given container does not appear in the list of containers for this NSLayoutManager."), _NSFullMethodName());
  extraData = self->_extraData;
  if ((*(_BYTE *)(*((_QWORD *)extraData + 30) + 56) & 1) != 0)
  {
    v6 = *((_QWORD *)extraData + 26);
    if ((*(_BYTE *)(v6 + 56) & 1) != 0 || *(_QWORD *)(v6 + 8))
    {
      value = 0;
      if (*((NSTextContainer **)extraData + 10) == container)
      {
        v7 = 0;
      }
      else if (CFDictionaryGetValueIfPresent(*((CFDictionaryRef *)extraData + 11), container, (const void **)&value))
      {
        v7 = (unint64_t)value;
      }
      else
      {
        v7 = 0x7FFFFFFFFFFFFFFFLL;
      }
      lmFlags = self->_lmFlags;
      if ((*(_BYTE *)&lmFlags & 0x40) == 0)
        ++self->_displayInvalidationDisableStack;
      if ((*(_BYTE *)&lmFlags & 8) == 0)
        ++self->_textViewResizeDisableStack;
      v9 = 0;
      do
      {
        _NSFastFillAllLayoutHolesUpToEndOfContainerForGlyphIndex((uint64_t)self, v9);
        if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
        {
          v13 = *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8);
          v23.n128_u64[0] = 0;
          v23.n128_u64[1] = v13;
          v14 = (NSTextContainer *)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
        }
        else if (-[NSRunStorage count](self->_containerRuns, "count") <= v9)
        {
          v14 = 0;
        }
        else
        {
          containerRuns = self->_containerRuns;
          _NSBlockNumberForIndex(containerRuns, v9, &v23);
          if (containerRuns->_gapBlockIndex <= v11)
            v12 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
          else
            v12 = 0;
          v14 = *(NSTextContainer **)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v12 + v11)];
        }
        if (v23.n128_u64[1])
          v9 += v23.n128_u64[1];
        else
          ++v9;
        if (v14)
          v15 = v14 == container;
        else
          v15 = 1;
        if (v15)
          break;
        value = 0;
        v16 = (CFDictionaryRef *)self->_extraData;
        if (v16[10] == (CFDictionaryRef)v14)
        {
          v18 = 0;
        }
        else
        {
          ValueIfPresent = CFDictionaryGetValueIfPresent(v16[11], v14, (const void **)&value);
          v18 = (unint64_t)value;
          if (!ValueIfPresent)
            v18 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (v18 >= v7)
          break;
        v19 = self->_extraData;
        if ((*(_BYTE *)(v19[30] + 56) & 1) == 0)
          break;
        v20 = v19[26];
      }
      while ((*(_BYTE *)(v20 + 56) & 1) != 0 || v9 < *(_QWORD *)(v20 + 8));
      _enableTextViewResizing_0((uint64_t)self);
      v21 = self->_lmFlags;
      if ((*(_BYTE *)&v21 & 0x40) == 0)
      {
        if (!self->_displayInvalidationDisableStack
          || (v22 = self->_displayInvalidationDisableStack - 1, (self->_displayInvalidationDisableStack = v22) == 0))
        {
          self->_lmFlags = (__lmFlags)(*(_DWORD *)&v21 | 0x40);
          -[NSLayoutManager _invalidateDisplayIfNeeded](self, "_invalidateDisplayIfNeeded");
          *(_DWORD *)&self->_lmFlags &= ~0x40u;
        }
      }
    }
  }
}

- (void)_showCGGlyphs:(const unsigned __int16 *)a3 positions:(const CGPoint *)a4 count:(int64_t)a5 font:(id)a6 textMatrix:(CGAffineTransform *)a7 attributes:(id)a8 inContext:(CGContext *)a9
{
  uint64_t v9;
  uint64_t v10;
  CGFloat *v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  CGFloat *v19;
  id *v20;
  double v21;
  double v22;
  __int128 v23;
  void *v24;
  uint64_t v25;
  CGAffineTransform *v26;
  uint64_t v27;
  uint64_t v28;
  CGFloat v29;
  CGFloat v30;
  double *v31;
  uint64_t v32;
  __NSTextAppearanceEffectContext *v33;
  uint64_t v34;
  uint64_t v35;
  __NSTextAppearanceEffectContext *v36;
  __NSTextAppearanceEffectContext *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  uint64_t v43;

  v9 = ((uint64_t (*)(NSLayoutManager *, SEL, const unsigned __int16 *, const CGPoint *, int64_t, id, CGAffineTransform *, id))MEMORY[0x1E0C80A78])(self, a2, a3, a4, a5, a6, a7, a8);
  v43 = *MEMORY[0x1E0C80C00];
  if (!a9)
    return;
  v16 = v15;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  v20 = (id *)v9;
  v40 = v10;
  v21 = *MEMORY[0x1E0C9D538];
  v22 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  memset(&v41, 0, sizeof(v41));
  v23 = v14[1];
  *(_OWORD *)&v42.a = *v14;
  *(_OWORD *)&v42.c = v23;
  *(_OWORD *)&v42.tx = v14[2];
  CGAffineTransformInvert(&v41, &v42);
  v24 = (void *)objc_msgSend(v20, "textStorage");
  v25 = objc_msgSend(v24, "cuiCatalog");
  v39 = objc_msgSend(v20, "styleEffectConfiguration");
  if (v18 >= 257)
  {
    v26 = (CGAffineTransform *)NSZoneMalloc(0, 16 * v18);
    v26->a = v21;
    v26->b = v22;
    goto LABEL_5;
  }
  v42.a = v21;
  v42.b = v22;
  v26 = &v42;
  if ((unint64_t)v18 >= 2)
  {
LABEL_5:
    v27 = 0;
    v28 = v18 - 1;
    do
    {
      v29 = v19[v27 + 2] - v19[v27];
      v30 = v19[v27 + 3] - v19[v27 + 1];
      v21 = v21 + v30 * v41.c + v41.a * v29;
      v22 = v22 + v30 * v41.d + v41.b * v29;
      v31 = (double *)((char *)&v26->a + v27 * 8);
      v31[2] = v21;
      v31[3] = v22;
      v27 += 2;
      --v28;
    }
    while (v28);
  }
  CGContextSetTextPosition(a9, *v19, v19[1]);
  v32 = objc_msgSend(v16, "objectForKey:", CFSTR("NSTextEffect"));
  if (!v25
    && ((objc_opt_respondsToSelector() & 1) == 0
     || (v25 = objc_msgSend(v20[13], "layoutManager:effectiveCUICatalogForTextEffect:", v20, v32)) == 0))
  {
    objc_msgSend(v20, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = objc_msgSend((id)objc_msgSend(v20, "delegate"), "layoutManager:effectiveCUICatalogForTextEffect:", v20, v32);
    else
      v25 = 0;
  }
  v33 = [__NSTextAppearanceEffectContext alloc];
  v34 = objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("NSColor"));
  v35 = objc_msgSend(v20, "applicationFrameworkContext");
  LOBYTE(v38) = objc_msgSend(v24, "_usesSimpleTextEffects");
  v36 = -[__NSTextAppearanceEffectContext initWithTextEffectName:catalog:styleEffectConfiguration:font:color:applicationFrameworkContext:useSimplifiedEffect:](v33, "initWithTextEffectName:catalog:styleEffectConfiguration:font:color:applicationFrameworkContext:useSimplifiedEffect:", v32, v25, v39, v17, v34, v35, v38);
  v37 = v36;
  if (v36)
    -[__NSTextAppearanceEffectContext drawGlyphs:positions:count:context:](v36, "drawGlyphs:positions:count:context:", v40, v26, v18, a9);
  else
    CTFontDrawGlyphsAtPositions();

  if (v26 != &v42)
    NSZoneFree(0, v26);
}

- (void)_showAttachmentCell:(id)a3 inRect:(CGRect)a4 characterIndex:(unint64_t)a5
{
  double height;
  double width;
  double x;
  double v9;

  height = a4.size.height;
  width = a4.size.width;
  x = a4.origin.x;
  v9 = a4.origin.y - a4.size.height;
  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a3, "drawWithFrame:inView:characterIndex:layoutManager:", 0, a5, self, x, v9, width, height);
    return;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
LABEL_6:
    objc_msgSend(a3, "drawWithFrame:inView:", 0, x, v9, width, height);
  else
    objc_msgSend(a3, "drawWithFrame:inView:characterIndex:", 0, a5, x, v9, width, height);
}

- (void)drawSpellingUnderlineForGlyphRange:(_NSRange)a3 spellingState:(int64_t)a4 inGlyphRange:(_NSRange)a5 lineFragmentRect:(CGRect)a6 lineFragmentGlyphRange:(_NSRange)a7 containerOrigin:(CGPoint)a8
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v11;
  double y;
  double x;
  double height;
  double v15;
  double v16;
  NSUInteger v17;
  void *v19;
  CGContext *v20;
  double v21;
  double v22;
  BOOL v23;
  BOOL v24;
  int64_t v25;
  char v26;
  NSUInteger v27;
  CGFloat b;
  CGFloat a;
  CGFloat d;
  CGFloat c;
  CGFloat ty;
  CGFloat tx;
  double v34;
  double v35;
  double v36;
  _BOOL4 v37;
  uint64_t *v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  char v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  NSRect *v54;
  CGFloat v55;
  double *p_width;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  NSUInteger v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  BOOL v82;
  int v83;
  double v84;
  double v85;
  double v86;
  double v87;
  uint64_t v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  BOOL v98;
  double v99;
  double v100;
  int v101;
  uint64_t v102;
  uint64_t v103;
  CGFloat v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  _BOOL4 v113;
  CGFloat v114;
  NSTextContainer *v115;
  int phase;
  CGSize phasea;
  CGAffineTransform v118;
  CGAffineTransform v119;
  _QWORD block[4];
  BOOL v121;
  CGAffineTransform v122;
  CGAffineTransform v123;
  uint64_t v124;
  CGRect v125;
  CGRect v126;

  length = a5.length;
  location = a5.location;
  v11 = a3.length;
  y = a8.y;
  x = a8.x;
  height = a6.size.height;
  v15 = a6.origin.y;
  v16 = a6.origin.x;
  v17 = a3.location;
  v124 = *MEMORY[0x1E0C80C00];
  v19 = (void *)-[objc_class graphicsContextForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass", a6.origin.x, a6.origin.y, a6.size.width), "graphicsContextForApplicationFrameworkContext:", -[NSLayoutManager applicationFrameworkContext](self, "applicationFrameworkContext"));
  v20 = (CGContext *)objc_msgSend(v19, "CGContext");
  -[NSTypesetter baselineOffsetInLayoutManager:glyphIndex:](-[NSLayoutManager typesetter](self, "typesetter"), "baselineOffsetInLayoutManager:glyphIndex:", self, v17);
  v22 = v21;
  v115 = -[NSLayoutManager textContainerForGlyphAtIndex:effectiveRange:](self, "textContainerForGlyphAtIndex:effectiveRange:", v17, 0);
  if (v19)
    v23 = (*(_DWORD *)&self->_lmFlags & 0x10000000) == 0;
  else
    v23 = 1;
  if (v23)
    phase = 1;
  else
    phase = objc_msgSend(v19, "isFlipped");
  v24 = -[NSLayoutManager applicationFrameworkContext](self, "applicationFrameworkContext") == 2;
  v25 = -[NSLayoutManager applicationFrameworkContext](self, "applicationFrameworkContext");
  v26 = 1;
  if (a4 == 3)
    v26 = 2;
  if (a4 == 1)
    v26 = 0x80;
  if (v25 == 1)
    LOBYTE(a4) = v26;
  if (v20)
  {
    if ((a4 & 0x83) != 0)
    {
      v27 = location + length;
      if (v17 + v11 >= location + length)
      {
        CGContextGetCTM(&v123, v20);
        a = v123.a;
        b = v123.b;
        c = v123.c;
        d = v123.d;
        tx = v123.tx;
        ty = v123.ty;
        v34 = fabs(v123.a);
        v35 = floor(v34);
        v110 = v123.a;
        v111 = v123.b;
        v108 = v123.ty;
        v109 = v123.d;
        v107 = v123.tx;
        memset(&v123, 0, sizeof(v123));
        if (v35 <= 1.0)
        {
          v123.a = a;
          v123.b = b;
          v36 = d;
          v123.c = c;
        }
        else
        {
          v122.a = a;
          v122.b = b;
          v122.c = c;
          v122.d = d;
          v122.tx = tx;
          v122.ty = ty;
          CGAffineTransformScale(&v123, &v122, 1.0 / v35, -1.0 / v35);
          v36 = v123.d;
          v34 = fabs(v123.a);
        }
        v37 = v34 - fabs(v36) > 0.001 || fabs(v123.b) - fabs(v123.c) > 0.001 || ceil(v123.c) - v123.c > 0.001;
        v113 = v37;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __151__NSLayoutManager_OtherSupport__drawSpellingUnderlineForGlyphRange_spellingState_inGlyphRange_lineFragmentRect_lineFragmentGlyphRange_containerOrigin___block_invoke;
        block[3] = &__block_descriptor_33_e5_v8__0l;
        v121 = v24;
        if (drawSpellingUnderlineForGlyphRange_spellingState_inGlyphRange_lineFragmentRect_lineFragmentGlyphRange_containerOrigin__colorOncePredicate == -1)
        {
          if ((a4 & 1) == 0)
          {
LABEL_25:
            v38 = &drawSpellingUnderlineForGlyphRange_spellingState_inGlyphRange_lineFragmentRect_lineFragmentGlyphRange_containerOrigin__correctionPatternColor;
            if ((a4 & 0x80) == 0)
              v38 = &drawSpellingUnderlineForGlyphRange_spellingState_inGlyphRange_lineFragmentRect_lineFragmentGlyphRange_containerOrigin__grammarPatternColor;
            v39 = *v38;
            goto LABEL_30;
          }
        }
        else
        {
          dispatch_once(&drawSpellingUnderlineForGlyphRange_spellingState_inGlyphRange_lineFragmentRect_lineFragmentGlyphRange_containerOrigin__colorOncePredicate, block);
          if ((a4 & 1) == 0)
            goto LABEL_25;
        }
        v39 = drawSpellingUnderlineForGlyphRange_spellingState_inGlyphRange_lineFragmentRect_lineFragmentGlyphRange_containerOrigin__spellingPatternColor;
LABEL_30:
        -[NSLayoutManager lineFragmentUsedRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", v17, 0);
        v112 = v40;
        v42 = v41 + v40;
        v114 = c;
        if (v41 + v40 > v15 && v42 < v15 + height)
        {
          v22 = v22 - (v15 + height - v42);
          height = v42 - v15;
        }
        -[NSLayoutManager locationForGlyphAtIndex:](self, "locationForGlyphAtIndex:", location, v42);
        v44 = v43;
        if ((*((_BYTE *)&self->_lmFlags + 3) & 2) != 0
          && (-[NSLayoutManager intAttribute:forGlyphAtIndex:](self, "intAttribute:forGlyphAtIndex:", 2, v17) & 1) != 0)
        {
          v123.a = 0.0;
          v54 = -[NSLayoutManager rectArrayForGlyphRange:withinSelectedGlyphRange:inTextContainer:rectCount:](self, "rectArrayForGlyphRange:withinSelectedGlyphRange:inTextContainer:rectCount:", v17, v11, 0x7FFFFFFFFFFFFFFFLL, 0, v115, &v123);
          v55 = v123.a;
          v49 = 0.0;
          if (*(_QWORD *)&v123.a)
          {
            p_width = &v54->size.width;
            v46 = 0.0;
            do
            {
              v57 = *(p_width - 2);
              v58 = *p_width;
              p_width += 4;
              v59 = v58;
              v60 = v57 - v16;
              v61 = v46 + v44 - v60;
              if (v60 < v44)
                v44 = v60;
              else
                v61 = v46;
              v62 = v60 + v59;
              if (v62 <= v44 + v61)
                v46 = v61;
              else
                v46 = v62 - v44;
              --*(_QWORD *)&v55;
            }
            while (v55 != 0.0);
          }
          else
          {
            v46 = 0.0;
          }
          v47 = 0;
        }
        else if (v27 >= a7.location + a7.length)
        {
          -[NSLayoutManager lineFragmentUsedRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", a7.location, 0);
          v52 = v50 + v51;
          -[NSTextContainer lineFragmentPadding](v115, "lineFragmentPadding");
          v47 = 0;
          v46 = v52 - v53 - (v16 + v44);
          v49 = 0.0;
        }
        else
        {
          if ((*((_BYTE *)&self->_lmFlags + 3) & 2) != 0
            && (-[NSLayoutManager intAttribute:forGlyphAtIndex:](self, "intAttribute:forGlyphAtIndex:", 2, v27) & 1) != 0)
          {
            v72 = -[NSLayoutManager characterIndexForGlyphAtIndex:](self, "characterIndexForGlyphAtIndex:", v27 - 1);
            -[NSLayoutManager locationForGlyphAtIndex:](self, "locationForGlyphAtIndex:", v27 - 1);
            v74 = v73;
            v75 = (void *)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", CFSTR("NSFont"), v72, 0);
            v76 = (void *)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", CFSTR("CTVerticalForms"), v72, 0);
            if (!v75)
              v75 = (void *)NSDefaultFont();
            if ((objc_msgSend(v76, "BOOLValue") & 1) != 0
              || !v76 && -[NSTextContainer layoutOrientation](v115, "layoutOrientation"))
            {
              v75 = (void *)objc_msgSend(v75, "verticalFont");
            }
            v46 = v74 - v44;
            if (v75)
            {
              objc_msgSend(v75, "advancementForGlyph:", -[NSLayoutManager glyphAtIndex:](self, "glyphAtIndex:", v27 - 1));
              v47 = 0;
              v46 = v46 + v105;
            }
            else
            {
              v47 = 0;
            }
          }
          else
          {
            -[NSLayoutManager locationForGlyphAtIndex:](self, "locationForGlyphAtIndex:", v27);
            v46 = v45 - v44;
            v47 = 1;
          }
          if (v27 + 1 >= a7.location + a7.length)
          {
            -[NSLayoutManager lineFragmentUsedRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", a7.location, 0);
            v106 = v22;
            v63 = height;
            v64 = v15;
            v65 = y;
            v66 = x;
            v69 = v67 + v68;
            -[NSTextContainer lineFragmentPadding](v115, "lineFragmentPadding");
            v71 = v69 - v70;
            x = v66;
            y = v65;
            v15 = v64;
            height = v63;
            v22 = v106;
            v49 = v71 - (v16 + v44);
          }
          else
          {
            -[NSLayoutManager locationForGlyphAtIndex:](self, "locationForGlyphAtIndex:");
            v49 = v48 - v44;
          }
        }
        v77 = v16 + x + v44;
        v78 = y - (v15 + height - v22);
        if (phase)
          v78 = y + v15 + height - v22;
        if ((v47 & 1) != 0)
        {
          v79 = v77 + v49;
          v80 = v46 + v77;
          v81 = v114;
          v82 = v79 - (v46 + v77) < 5.0;
        }
        else
        {
          v82 = 0;
          v80 = v46 + v77;
          v81 = v114;
        }
        v83 = v81 == 0.0 || v113;
        if (v83)
          v84 = 3.0;
        else
          v84 = 4.0;
        if (v83)
          v85 = 4.0;
        else
          v85 = 3.0;
        if (!v83)
          v78 = v78 + -1.0;
        v86 = ceil(v77);
        v87 = floor(v80) - v86;
        v88 = (uint64_t)v87 % (uint64_t)vcvtmd_s64_f64(v85);
        v89 = v85 + v87 - (double)v88;
        if (!v82 || v88 != 0)
          v85 = 0.0;
        v90 = v89 - v85;
        if (v89 - v85 - v87 <= 2.0)
          v91 = v86;
        else
          v91 = v86 + -1.0;
        v92 = ceil(v78);
        v93 = floor(v22 + v78) - v92;
        if (v112 <= 19.0)
          v94 = 3.0;
        else
          v94 = 4.0;
        v95 = floor(v112 / 100.0) + 5.0;
        if (v112 > 25.0)
          v96 = v95;
        else
          v96 = v94;
        v97 = v93 - v96;
        v98 = v93 <= v96;
        v99 = -0.0;
        if (!v98)
          v99 = v97;
        v100 = v92 + v99;
        CGContextSaveGState(v20);
        if (v39)
          v101 = v113;
        else
          v101 = 1;
        if (v101 == 1)
        {
          v102 = __NSGetColorForSpellingState(a4);
          if (v102)
          {
            v103 = v102;
            *(_OWORD *)&v123.a = xmmword_18D6CBBE0;
            CGContextSetLineDash(v20, 0.0, &v123.a, 2uLL);
            v104 = v84 + v100;
            CGContextMoveToPoint(v20, v91, v104);
            CGContextAddLineToPoint(v20, v90 + v91, v104);
            CGContextSetLineWidth(v20, 2.0);
            objc_msgSend(-[NSLayoutManager renderingColorForDocumentColor:](self, "renderingColorForDocumentColor:", v103), "set");
            CGContextStrokePath(v20);
          }
        }
        else
        {
          CGContextGetBaseCTM();
          CGAffineTransformInvert(&v119, &v118);
          phasea = (CGSize)vaddq_f64(*(float64x2_t *)&v119.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v119.c, v108 + v109 * v100 + v111 * v91), *(float64x2_t *)&v119.a, v107 + v81 * v100 + v110 * v91));
          objc_msgSend(-[NSLayoutManager renderingColorForDocumentColor:](self, "renderingColorForDocumentColor:", v39), "set");
          CGContextSetPatternPhase(v20, phasea);
          if (CGContextGetCompositeOperation() == 2)
          {
            v125.origin.x = v91;
            v125.origin.y = v100;
            v125.size.width = v90;
            v125.size.height = v84;
            CGContextFillRect(v20, v125);
          }
          else
          {
            CGContextSetCompositeOperation();
            v126.origin.x = v91;
            v126.origin.y = v100;
            v126.size.width = v90;
            v126.size.height = v84;
            CGContextFillRect(v20, v126);
            CGContextSetCompositeOperation();
          }
        }
        CGContextRestoreGState(v20);
      }
    }
  }
}

id __151__NSLayoutManager_OtherSupport__drawSpellingUnderlineForGlyphRange_spellingState_inGlyphRange_lineFragmentRect_lineFragmentGlyphRange_containerOrigin___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id result;

  v0 = __NSGetColorForSpellingState(1);
  v1 = __NSGetCircledImage(v0, 3.0, 3.0);
  v2 = __NSGetColorForSpellingState(2);
  v3 = __NSGetCircledImage(v2, 3.0, 3.0);
  v4 = __NSGetColorForSpellingState(128);
  v5 = __NSGetCircledImage(v4, 3.0, 3.0);
  if (v1)
    v6 = (void *)objc_msgSend((Class)getNSColorClass[0](), "colorWithPatternImage:", v1);
  else
    v6 = 0;
  drawSpellingUnderlineForGlyphRange_spellingState_inGlyphRange_lineFragmentRect_lineFragmentGlyphRange_containerOrigin__spellingPatternColor = v6;
  if (v3)
    v7 = (void *)objc_msgSend((Class)getNSColorClass[0](), "colorWithPatternImage:", v3);
  else
    v7 = 0;
  drawSpellingUnderlineForGlyphRange_spellingState_inGlyphRange_lineFragmentRect_lineFragmentGlyphRange_containerOrigin__grammarPatternColor = v7;
  if (v5)
    v8 = (void *)objc_msgSend((Class)getNSColorClass[0](), "colorWithPatternImage:", v5);
  else
    v8 = 0;
  result = v8;
  drawSpellingUnderlineForGlyphRange_spellingState_inGlyphRange_lineFragmentRect_lineFragmentGlyphRange_containerOrigin__correctionPatternColor = (uint64_t)result;
  return result;
}

- (void)_drawLineForGlyphRange:(_NSRange)a3 inContext:(CGContext *)a4 from:(double)a5 to:(double)a6 at:(double)a7 thickness:(double)a8 lineOrigin:(CGPoint)a9 breakForDescenders:(BOOL)a10 flipped:(BOOL)a11
{
  double v11;
  double v13;
  double v14;
  CGContext *v15;
  _BOOL4 v17;
  double y;
  CGFloat x;
  NSUInteger length;
  NSUInteger location;
  uint64_t v22;
  double v23;
  void *v24;
  CGFont *v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  int v38;
  double v39;
  double v40;
  double v41;
  double v42;
  __int16 v43;
  int UnitsPerEm;
  double v45;
  const CGPath *GlyphPath;
  const CGPath *v47;
  __int128 v48;
  double v49;
  double v50;
  double v51;
  CGColor *StrokeColorAsColor;
  double v53;
  double v54;
  double v55;
  double v56;
  CGContext *c;
  double v58;
  __int128 v59;
  _OWORD info[2];
  double v61;
  double v62;
  __int128 v63;
  CGRect v64;

  v11 = a8;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  if (a10)
  {
    v17 = a11;
    y = a9.y;
    x = a9.x;
    length = a3.length;
    location = a3.location;
    CGContextMoveToPoint(a4, a5, a7);
    v22 = -[NSTextStorage string](self->_textStorage, "string");
    v59 = xmmword_18D6CBB80;
    v23 = a7 - y;
    if (!v17)
      v23 = y - a7;
    v58 = v11;
    c = v15;
    v54 = v13;
    if (location < location + length)
    {
      v24 = (void *)v22;
      v53 = x;
      v25 = 0;
      v56 = v23 + v11 * -0.5;
      v55 = v56 + v11;
      v26 = 0.0;
      v27 = 0.0;
      v28 = 0.0;
      do
      {
        v29 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, location);
        if (v29 < (unint64_t)v59 || v29 - (unint64_t)v59 >= *((_QWORD *)&v59 + 1))
        {
          v31 = (void *)-[NSTextStorage attributesAtIndex:effectiveRange:](self->_textStorage, "attributesAtIndex:effectiveRange:", v29, &v59);
          v32 = (void *)objc_msgSend(v31, "objectForKey:", CFSTR("NSFont"));
          v25 = (CGFont *)objc_msgSend(v32, "_backingCGSFont");
          objc_msgSend(v32, "pointSize");
          v28 = v33;
          v34 = (void *)objc_msgSend(v31, "objectForKey:", CFSTR("NSExpansion"));
          v26 = 0.0;
          v27 = 0.0;
          if (v34)
          {
            objc_msgSend(v34, "doubleValue");
            v27 = v35;
          }
          v36 = (void *)objc_msgSend(v31, "objectForKey:", CFSTR("NSObliqueness"), *(_QWORD *)&v53);
          if (v36)
          {
            objc_msgSend(v36, "doubleValue");
            v26 = v37;
          }
        }
        v38 = -[NSLayoutManager glyphAtIndex:](self, "glyphAtIndex:", location, *(_QWORD *)&v53);
        -[NSLayoutManager locationForGlyphAtIndex:](self, "locationForGlyphAtIndex:", location);
        v40 = v39;
        v42 = v41;
        v43 = objc_msgSend(v24, "characterAtIndex:", v29);
        if (v25)
        {
          if (v28 > 0.0 && v27 == 0.0 && v26 == 0.0 && (unsigned __int16)((unsigned __int16)(v43 + 1280) >> 7) <= 0x66u)
          {
            if (v38)
            {
              if (!-[NSLayoutManager notShownAttributeForGlyphAtIndex:](self, "notShownAttributeForGlyphAtIndex:", location))
              {
                UnitsPerEm = CGFontGetUnitsPerEm(v25);
                info[0] = *MEMORY[0x1E0C9D538];
                info[1] = info[0];
                v45 = (double)UnitsPerEm;
                v61 = (v42 - v56) * (double)UnitsPerEm / v28;
                v62 = (v42 - v55) * (double)UnitsPerEm / v28;
                v63 = xmmword_18D6CBBD0;
                GlyphPath = (const CGPath *)CGFontCreateGlyphPath();
                if (GlyphPath)
                {
                  v47 = GlyphPath;
                  CGPathApply(GlyphPath, info, (CGPathApplierFunction)lmProcessPathElement);
                  v48 = v63;
                  if (*(double *)&v63 >= *((double *)&v63 + 1) || UnitsPerEm <= 0)
                  {
                    CGPathRelease(v47);
                  }
                  else
                  {
                    v49 = v28 * *(double *)&v63 / v45;
                    CGPathRelease(v47);
                    v50 = v53 + v40;
                    v51 = v50 + v49 - v58;
                    if (v51 > v14 + v58 * 0.75)
                    {
                      CGContextAddLineToPoint(c, v51, a7);
                      CGContextStrokePath(c);
                      v14 = v51;
                    }
                    if (v50 + v28 * *((double *)&v48 + 1) / v45 + v58 > v14)
                      v14 = v50 + v28 * *((double *)&v48 + 1) / v45 + v58;
                    CGContextMoveToPoint(c, v14, a7);
                  }
                }
              }
            }
          }
        }
        ++location;
        --length;
      }
      while (length);
    }
    v11 = v58;
    v15 = c;
    v13 = v54;
  }
  else
  {
    if (-[NSLayoutManager _drawsUnderlinesLikeWebKit](self, "_drawsUnderlinesLikeWebKit", a3.location, a3.length, a5, a6, a7, a8, a9.x, a9.y))
    {
      StrokeColorAsColor = (CGColor *)CGContextGetStrokeColorAsColor();
      CGContextSetFillColorWithColor(v15, StrokeColorAsColor);
      v64.size.width = v13 - v14;
      v64.origin.x = v14;
      v64.origin.y = a7;
      v64.size.height = v11;
      CGContextFillRect(v15, v64);
      return;
    }
    CGContextMoveToPoint(v15, v14, a7);
  }
  if (vabdd_f64(v13, v14) > v11 * 0.75)
  {
    CGContextAddLineToPoint(v15, v13, a7);
    CGContextStrokePath(v15);
  }
}

- (void)_drawLineForGlyphRange:(_NSRange)a3 inContext:(CGContext *)a4 from:(double)a5 to:(double)a6 at:(double)a7 thickness:(double)a8 lineOrigin:(CGPoint)a9 breakForDescenders:(BOOL)a10
{
  -[NSLayoutManager _drawLineForGlyphRange:inContext:from:to:at:thickness:lineOrigin:breakForDescenders:flipped:](self, "_drawLineForGlyphRange:inContext:from:to:at:thickness:lineOrigin:breakForDescenders:flipped:", a3.location, a3.length, a4, a10, 1, a5, a6, a7, a8, a9.x, a9.y);
}

- (void)_drawLineForGlyphRange:(_NSRange)a3 type:(int64_t)a4 baselineOffset:(double)a5 lineFragmentRect:(CGRect)a6 lineFragmentGlyphRange:(_NSRange)a7 containerOrigin:(CGPoint)a8 isStrikethrough:(BOOL)a9
{
  _BOOL4 v9;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v12;
  double y;
  double height;
  double v15;
  NSUInteger v17;
  NSTextContainer *v19;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  const NSAttributedStringKey *v27;
  void *v28;
  CGContext *v29;
  _BOOL4 v30;
  double a;
  double b;
  double d;
  double c;
  int v35;
  uint64_t v36;
  int v37;
  NSAttributedStringKey v38;
  id v39;
  unint64_t i;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  BOOL v64;
  int64_t v65;
  unint64_t v66;
  unint64_t v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  id firstTextView;
  _BOOL4 v74;
  char v76;
  unint64_t v77;
  int v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  double v85;
  void *v86;
  int v87;
  BOOL v88;
  char v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  char v95;
  double v96;
  NSRange v97;
  char *v98;
  double v99;
  double v100;
  double v101;
  double v102;
  CGFloat v103;
  float v104;
  double v105;
  double v106;
  double v107;
  float v108;
  double v109;
  double v110;
  double v111;
  double v112;
  char v113;
  double v114;
  double v115;
  double v116;
  double v117;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  int v122;
  BOOL v123;
  char v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  const __CFDictionary *Mutable;
  NSRange v135;
  NSRange v136;
  CGFloat v137;
  uint64_t v138;
  unint64_t v139;
  double v140;
  CGFloat v141;
  double v142;
  char *Value;
  double v144;
  double v145;
  float v146;
  double v147;
  float v148;
  double v149;
  float v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  BOOL v158;
  double v159;
  double v160;
  double v161;
  double v162;
  char v163;
  double v164;
  double v165;
  double v166;
  double v167;
  BOOL v168;
  double v169;
  unint64_t v170;
  BOOL v171;
  double v172;
  uint64_t v173;
  size_t v174;
  double v175;
  float64x2_t *v176;
  size_t v177;
  NSUInteger v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  id v182;
  _BOOL4 v183;
  _BOOL4 v184;
  NSTextContainer *v185;
  NSRect *v186;
  float v187;
  unint64_t v188;
  unint64_t v189;
  double v190;
  uint64_t v191;
  double *p_width;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  void *v200;
  uint64_t v201;
  double v202;
  double v203;
  double v204;
  double v205;
  const __CFString *v206;
  double v207;
  void *v208;
  int v209;
  double v210;
  int64_t v211;
  uint64_t v212;
  NSUInteger v213;
  int64_t v214;
  NSTextContainer *v215;
  unint64_t v216;
  uint64_t v217;
  _BOOL4 v218;
  _BOOL4 v219;
  uint64_t v220;
  double v221;
  void *v222;
  char *extraData;
  double x;
  NSUInteger v225;
  double v227;
  CGAffineTransform v228;
  CGAffineTransform v229;
  CGAffineTransform v230;
  void *key;
  char *v232;
  __int128 v233;
  CGAffineTransform v234;
  unint64_t v235;
  CGFloat lengths[2];
  __int128 v237;
  __int128 v238;
  uint64_t v239;
  NSRange v240;
  NSRange v241;

  v9 = a9;
  length = a7.length;
  location = a7.location;
  v12 = a3.length;
  y = a8.y;
  x = a8.x;
  height = a6.size.height;
  v15 = a6.origin.y;
  v210 = a6.origin.x;
  v17 = a3.location;
  v239 = *MEMORY[0x1E0C80C00];
  v19 = -[NSLayoutManager textContainerForGlyphAtIndex:effectiveRange:](self, "textContainerForGlyphAtIndex:effectiveRange:", a3.location, 0, a5, a6.origin.x, a6.origin.y, a6.size.width);
  __asm { FMOV            V0.2D, #3.0 }
  *(_OWORD *)lengths = _Q0;
  v237 = _Q0;
  v238 = _Q0;
  v23 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", v17, v12, 0);
  v212 = v24;
  v213 = length;
  v225 = location;
  v216 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", location, length, 0);
  v217 = v25;
  v26 = CFSTR("NSStrikethrough");
  v218 = v9;
  if (!v9)
    v26 = CFSTR("NSUnderline");
  v206 = v26;
  if (v9)
    v27 = &NSStrikethroughColorAttributeName;
  else
    v27 = &NSUnderlineColorAttributeName;
  v28 = (void *)-[objc_class graphicsContextForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "graphicsContextForApplicationFrameworkContext:", -[NSLayoutManager applicationFrameworkContext](self, "applicationFrameworkContext"));
  v29 = (CGContext *)objc_msgSend(v28, "CGContext");
  v235 = 0;
  v30 = -[NSLayoutManager _drawsUnderlinesLikeWebKit](self, "_drawsUnderlinesLikeWebKit");
  v215 = v19;
  v220 = -[NSTextContainer layoutOrientation](v19, "layoutOrientation");
  CGContextGetCTM(&v234, v29);
  a = v234.a;
  b = v234.b;
  c = v234.c;
  d = v234.d;
  v35 = objc_msgSend(v28, "isDrawingToScreen");
  v36 = 1;
  if (v28 && (*(_DWORD *)&self->_lmFlags & 0x10000000) != 0)
    v36 = objc_msgSend(v28, "isFlipped");
  if (_drawLineForGlyphRange_type_baselineOffset_lineFragmentRect_lineFragmentGlyphRange_containerOrigin_isStrikethrough__onceToken != -1)
    dispatch_once(&_drawLineForGlyphRange_type_baselineOffset_lineFragmentRect_lineFragmentGlyphRange_containerOrigin_isStrikethrough__onceToken, &__block_literal_global_0);
  v219 = v30;
  v37 = !v30;
  if (!_drawLineForGlyphRange_type_baselineOffset_lineFragmentRect_lineFragmentGlyphRange_containerOrigin_isStrikethrough__breakForDescendersDefault)
    v37 = 0;
  v209 = v37;
  if (!_NSUnderlineWhiteSet)
  {
    _NSUnderlineWhiteSet = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    _NSUnderlineNonWhiteSet = (uint64_t)(id)objc_msgSend((id)_NSUnderlineWhiteSet, "invertedSet");
  }
  if ((a4 & 7) != 0)
  {
    v211 = a4 & 7;
    v38 = *v27;
    if (!v35
      || (v39 = -[NSLayoutManager temporaryAttribute:atCharacterIndex:effectiveRange:](self, "temporaryAttribute:atCharacterIndex:effectiveRange:", v38, v23, 0)) == 0)
    {
      v39 = (id)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", v38, v23, 0);
    }
    v208 = v39;
    i = a4 & 7;
    v207 = (double)(unint64_t)v211;
    v41 = -v15;
    if ((_DWORD)v36)
      v41 = v15;
    v42 = y + v41;
    -[NSLayoutManager lineFragmentUsedRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", v17, 0);
    v45 = v43 + v44;
    _NF = v43 + v44 < v15 + height;
    v47 = a5 - (v15 + height - (v43 + v44));
    v48 = v45 - v15;
    if (v45 >= v15 + height)
      v47 = a5;
    if (!_NF)
      v48 = height;
    if (v45 > v15)
    {
      v49 = v48;
    }
    else
    {
      v47 = a5;
      v49 = height;
    }
    v50 = -(b * c);
    v51 = v47;
    v52 = fabs(v50 + a * d);
    v53 = sqrt(v52);
    if (v52 <= 0.001)
      v54 = 1.0;
    else
      v54 = v53;
    if (v51 * 5.3636991 <= v49)
      v55 = v51 * 5.3636991;
    else
      v55 = v49;
    v56 = v49 - v51;
    v221 = v49;
    v57 = v51 - v49;
    if ((_DWORD)v36)
      v57 = v49 - v51;
    v227 = v42;
    v58 = v42 + v57;
    v205 = v55;
    if (v218)
    {
      v233 = 0uLL;
      key = 0;
      v232 = 0;
      v59 = v23;
      if (!v217)
      {
LABEL_94:
        v84 = (void *)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", CFSTR("NSFont"), v59, 0);
        v85 = 0.0;
        if (v84)
        {
          v86 = (void *)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", CFSTR("CTVerticalForms"), v59, 0);
          v87 = objc_msgSend(v86, "BOOLValue");
          if (v86)
            v88 = 1;
          else
            v88 = v220 == 0;
          v89 = v88;
          if (v87 || (v89 & 1) == 0)
          {
            v90 = v58;
            v84 = (void *)objc_msgSend(v84, "verticalFont");
          }
          else
          {
            v90 = v58;
          }
          -[NSLayoutManager defaultLineHeightForFont:](self, "defaultLineHeightForFont:", v84);
          if (v93 <= v221)
            v94 = v93;
          else
            v94 = v221;
          v95 = objc_msgSend(v84, "isVertical");
          v96 = 0.0;
          v65 = a4 & 0x3000;
          if ((v95 & 1) == 0)
            objc_msgSend(v84, "xHeight", 0.0);
          v92 = v96 * 0.5;
          v91 = v94 * 0.0440277313;
          v58 = v90;
        }
        else
        {
          v91 = -1.0;
          v92 = 0.0;
          v65 = a4 & 0x3000;
        }
        -[NSTextStorage attributesAtIndex:effectiveRange:](self->_textStorage, "attributesAtIndex:effectiveRange:", v23, &v233);
        v240.location = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v233, 0);
        v241.location = v17;
        v241.length = v12;
        v97 = NSIntersectionRange(v240, v241);
        key = (void *)v97.location;
        if (v97.location < v97.location + v97.length)
        {
          v98 = (char *)v97.location;
          do
          {
            _NSLayoutTreeRunLocationForGlyphAtIndex((uint64_t)self, (unint64_t)v98, &key);
            if (v99 > v85)
              v85 = v99;
            v98 = &v232[(_QWORD)key];
            key = v98;
          }
          while ((unint64_t)v98 < v97.location + v97.length);
        }
        if (v30)
        {
          -[NSLayoutManager defaultBaselineOffsetForFont:](self, "defaultBaselineOffsetForFont:", v84);
          v101 = v227 + (double)(2 * (int)v100 / 3);
          memset(&v234, 0, sizeof(v234));
          CGContextGetUserSpaceToDeviceSpaceTransform(&v234, v29);
          v102 = 1.0;
          if (v54 < 0.400000006)
            v102 = 0.0;
          v103 = v234.ty + v101 * v234.d + v234.b * 0.0;
          v104 = v234.tx + v101 * v234.c + v234.a * 0.0;
          v105 = roundf(v104);
          *(float *)&v103 = v103;
          v106 = v102 + ceilf(*(float *)&v103);
          v229 = v234;
          CGAffineTransformInvert(&v230, &v229);
          v107 = v230.ty + v106 * v230.d + v230.b * v105;
          v108 = v54;
          v109 = fmaxf(roundf(v108), 1.0);
          v110 = (double)(unint64_t)v211;
        }
        else
        {
          v111 = v221 - v85 - v51;
          if (!(_DWORD)v36)
            v111 = -v111;
          v107 = v58 - v111;
          v112 = v54 * v92;
          v110 = (double)(unint64_t)v211;
          v109 = v54 * v207 * v91;
          if (v54 * v92 > 1.0 && v109 > 0.35)
          {
            v113 = vcvtpd_s64_f64(v109);
            v109 = ceil(v109);
            v114 = -v54;
            if (!(_DWORD)v36)
              v114 = v54;
            v115 = v114 * v107 - floor(v114 * v107);
            v116 = floor(v112 + 0.5);
            v117 = floor(v112) + 0.5;
            if ((v113 & 1) == 0)
              v117 = v116;
            v112 = v117 - v115;
          }
          v92 = v112 / v54;
        }
        goto LABEL_232;
      }
      v60 = (void *)-[NSTextStorage string](self->_textStorage, "string");
      v61 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet"), "invertedSet");
      v222 = v60;
      if (v212)
      {
        v62 = objc_msgSend(v60, "rangeOfCharacterFromSet:options:range:", v61, 0, v23);
        v64 = v63 != 0;
        if (v63)
          v59 = v62;
        else
          v59 = v23;
        if (v63)
          goto LABEL_89;
      }
      else
      {
        v64 = 0;
        v59 = v23;
      }
      if (v23 > v216)
      {
        v80 = objc_msgSend(v222, "rangeOfCharacterFromSet:options:range:", v61, 4, v216, v23 - v216);
        if (v81)
        {
          v59 = v81 + v80 - 1;
LABEL_93:
          v30 = v219;
          goto LABEL_94;
        }
      }
LABEL_89:
      if (!v64 && v216 + v217 > v23 + v212)
      {
        v82 = objc_msgSend(v222, "rangeOfCharacterFromSet:options:range:", v61, 0, v23 + v212, v216 + v217 - (v23 + v212));
        if (v83)
          v59 = v82;
      }
      goto LABEL_93;
    }
    v233 = 0uLL;
    extraData = (char *)self->_extraData;
    if ((a4 & 0x3000) != 0)
      v65 = a4 & 0x3000;
    else
      v65 = 4096;
    if ((a4 & 0x3000) == 0 && v220)
    {
      if (_drawLineForGlyphRange_type_baselineOffset_lineFragmentRect_lineFragmentGlyphRange_containerOrigin_isStrikethrough__minimumEdgeUnderline < 0)
      {
        v118 = (void *)objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
        _drawLineForGlyphRange_type_baselineOffset_lineFragmentRect_lineFragmentGlyphRange_containerOrigin_isStrikethrough__minimumEdgeUnderline = 1;
        if (objc_msgSend(v118, "count"))
        {
          if (objc_msgSend((id)objc_msgSend(v118, "objectAtIndex:", 0), "hasPrefix:", CFSTR("zh")))
            _drawLineForGlyphRange_type_baselineOffset_lineFragmentRect_lineFragmentGlyphRange_containerOrigin_isStrikethrough__minimumEdgeUnderline = 0;
        }
      }
      if (_drawLineForGlyphRange_type_baselineOffset_lineFragmentRect_lineFragmentGlyphRange_containerOrigin_isStrikethrough__minimumEdgeUnderline)
        v65 = 0x2000;
      else
        v65 = 12288;
    }
    v66 = *((_QWORD *)extraData + 21);
    _CF = v23 >= v66;
    v67 = v23 - v66;
    v204 = v56;
    if (_CF && v67 < *((_QWORD *)extraData + 22))
    {
      v68 = v58;
      v69 = *((double *)extraData + 18);
      v70 = *((double *)extraData + 19);
      v71 = *((double *)extraData + 20);
      goto LABEL_176;
    }
    v214 = v65;
    v234.a = 0.0;
    v234.b = 0.0;
    v229.a = 0.0;
    v229.b = 0.0;
    v72 = (void *)-[NSTextStorage string](self->_textStorage, "string");
    key = 0;
    v232 = 0;
    firstTextView = self->_firstTextView;
    v74 = firstTextView
       && objc_msgSend((id)objc_msgSend(firstTextView, "linkTextAttributes"), "objectForKey:", CFSTR("NSUnderline"))
       || objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_defaultLinkAttributes"), "objectForKey:", CFSTR("NSUnderline")) != 0;
    if (-[NSTextStorage attribute:atIndex:longestEffectiveRange:inRange:](self->_textStorage, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSUnderline"), v23, &v233, v216, v217))
    {
      _ZF = *((_QWORD *)&v233 + 1) == 0;
    }
    else
    {
      _ZF = 1;
    }
    v76 = !_ZF;
    if (_ZF && v74)
    {
      if (-[NSTextStorage attribute:atIndex:longestEffectiveRange:inRange:](self->_textStorage, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSLink"), v23, &v233, v216, v217)&& *((_QWORD *)&v233 + 1))
      {
        goto LABEL_77;
      }
    }
    else if ((v76 & 1) != 0)
    {
      goto LABEL_77;
    }
    if (!-[NSLayoutManager temporaryAttribute:atCharacterIndex:longestEffectiveRange:inRange:](self, "temporaryAttribute:atCharacterIndex:longestEffectiveRange:inRange:", CFSTR("NSUnderline"), v23, &v233, v216, v217)|| !*((_QWORD *)&v233 + 1))
    {
      *(_QWORD *)&v233 = v23;
      *((_QWORD *)&v233 + 1) = v212;
    }
LABEL_77:
    *(_OWORD *)(extraData + 168) = v233;
    v77 = *((_QWORD *)&v233 + 1) + v233;
    *(_QWORD *)&v233 = v77;
    if (v23 + v212 >= v77)
      goto LABEL_139;
    v78 = objc_msgSend(v72, "characterAtIndex:", v77 - 1);
    v77 = v233;
    if (v78 > 132)
    {
      if ((v78 - 8232) >= 2 && v78 != 133)
        goto LABEL_139;
    }
    else if (v78 != 10 && v78 != 12)
    {
      if (v78 == 13)
      {
        if (v77 >= objc_msgSend(v72, "length"))
        {
          v77 = v233;
        }
        else
        {
          v79 = objc_msgSend(v72, "characterAtIndex:", v77);
          v77 = v233;
          if (v79 == 10)
            goto LABEL_139;
        }
        goto LABEL_138;
      }
LABEL_139:
      v202 = v58;
      v234.a = *((CGFloat *)extraData + 21);
      v234.b = 0.0;
      v203 = v54;
      if (*(_QWORD *)&v234.a >= v77)
      {
        v69 = -1.0;
        v70 = 0.0;
      }
      else
      {
        v70 = 0.0;
        v69 = -1.0;
        do
        {
          v119 = -[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", CFSTR("NSFont"), *(_QWORD *)&v202);
          if (v119)
          {
            v120 = (void *)v119;
            v121 = (void *)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", CFSTR("CTVerticalForms"), *(_QWORD *)&v234.a, 0);
            v122 = objc_msgSend(v121, "BOOLValue");
            if (v121)
              v123 = 1;
            else
              v123 = v220 == 0;
            v124 = v123;
            if (v122 || (v124 & 1) == 0)
              v120 = (void *)objc_msgSend(v120, "verticalFont");
            objc_msgSend(v120, "descender");
            v126 = v125;
            objc_msgSend(v120, "_leading");
            v128 = ceil(v126 - v127) * 5.3636991;
            objc_msgSend(v120, "underlineThickness");
            if (v129 <= 0.0)
              v129 = v128 * -0.0440277313;
            if (v69 < v129)
              v69 = v129;
            v130 = v128 * 0.0880554625;
            if (objc_msgSend(v120, "isVertical"))
            {
              objc_msgSend(v120, "ascender");
              v132 = v131;
              objc_msgSend(v120, "descender");
              if (v132 == -v133)
                v130 = v128 - v69;
            }
            if (v70 > v130)
              v70 = v130;
          }
          *(_QWORD *)&v234.a += *(_QWORD *)&v234.b;
        }
        while (*(_QWORD *)&v234.a < (unint64_t)v233);
      }
      *((double *)extraData + 18) = v69;
      *((double *)extraData + 19) = v70;
      Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
      v234.a = *((CGFloat *)extraData + 21);
      v234.b = 0.0;
      v68 = v202;
      v65 = v214;
      v55 = v205;
      for (i = a4 & 7; *(_QWORD *)&v234.a < (unint64_t)v233; *(_QWORD *)&v234.a += *(_QWORD *)&v234.b)
      {
        -[NSTextStorage attributesAtIndex:effectiveRange:](self->_textStorage, "attributesAtIndex:effectiveRange:", *(_QWORD *)&v202);
        v135.location = *(_QWORD *)&v234.a;
        v135.length = *(_QWORD *)&v234.b;
        if (*(_QWORD *)&v234.b + *(_QWORD *)&v234.a > (unint64_t)v233)
        {
          v135.length = v233 - *(_QWORD *)&v234.a;
          *(_QWORD *)&v234.b = v233 - *(_QWORD *)&v234.a;
        }
        v136 = NSIntersectionRange(v135, *(NSRange *)(extraData + 168));
        *(_QWORD *)&v234.a = v136.location;
        *(_QWORD *)&v234.b = v136.length;
        v137 = COERCE_DOUBLE(-[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v136.location, v136.length, 0));
        v139 = *(_QWORD *)&v137 + v138;
        v229.a = v137;
        v140 = 0.0;
        if (*(_QWORD *)&v137 < (unint64_t)(*(_QWORD *)&v137 + v138))
        {
          v141 = v137;
          do
          {
            _NSLayoutTreeRunLocationForGlyphAtIndex((uint64_t)self, *(unint64_t *)&v141, &v229);
            if (v142 > v140)
              v140 = v142;
            *(_QWORD *)&v141 = *(_QWORD *)&v229.a + *(_QWORD *)&v229.b;
            v229.a = v141;
          }
          while (*(_QWORD *)&v141 < v139);
        }
        key = (void *)vcvtmd_s64_f64(v221 - v140 - v51 + 0.5);
        Value = (char *)CFDictionaryGetValue(Mutable, key);
        v232 = &Value[*(_QWORD *)&v234.b];
        CFDictionarySetValue(Mutable, key, &Value[*(_QWORD *)&v234.b]);
      }
      key = 0;
      v232 = 0;
      CFDictionaryApplyFunction(Mutable, (CFDictionaryApplierFunction)_maxApplierFunction, &key);
      if (v232)
        v71 = (double)(uint64_t)key;
      else
        v71 = 0.0;
      CFRelease(Mutable);
      *((double *)extraData + 20) = v71;
      v54 = v203;
LABEL_176:
      if (v65 == 0x2000)
      {
        v110 = (double)(unint64_t)v211;
        v92 = v204;
      }
      else
      {
        if (v65 == 4096)
        {
          if (v70 >= 0.0)
            v70 = v55 * -0.0880554625;
          v144 = -v71;
          if ((_DWORD)v36)
            v144 = v71;
          v107 = v68 - v144;
          if (v30)
          {
            memset(&v234, 0, sizeof(v234));
            CGContextGetUserSpaceToDeviceSpaceTransform(&v234, v29);
            v145 = 1.0;
            if (v54 < 0.400000006)
              v145 = 0.0;
            v146 = v234.tx + v107 * v234.c + v234.a * 0.0;
            v92 = v70;
            v147 = roundf(v146);
            v148 = v234.ty + v107 * v234.d + v234.b * 0.0;
            v149 = v145 + ceilf(v148);
            v229 = v234;
            CGAffineTransformInvert(&v228, &v229);
            v107 = v228.ty + v149 * v228.d + v228.b * v147;
            v150 = v54;
            v69 = fmaxf(roundf(v150), 1.0) / v54;
            v110 = (double)(unint64_t)v211;
LABEL_233:
            v170 = ((unint64_t)a4 >> 8) & 7;
            if (!v30)
            {
              if (v69 <= 0.0)
                v69 = v205 * v110 * 0.0440277313;
              v171 = v65 == 0x2000 && v69 < 1.0;
              v172 = v92 + -1.0;
              if (!v171)
                v172 = v92;
              if (!(_DWORD)v36)
                v172 = -v172;
              v107 = v107 - v172;
            }
            if (v170 - 1 > 3)
            {
              v174 = 1;
            }
            else
            {
              v173 = 2;
              if (v170 == 3)
                v173 = 4;
              if (v170 == 4)
                v174 = 6;
              else
                v174 = v173;
              if (v170 >= 2)
              {
                lengths[0] = 10.0;
                if (v170 == 2)
                  lengths[1] = 5.0;
              }
              v175 = ceil(v69 / v110);
              v176 = (float64x2_t *)lengths;
              v177 = v174;
              do
              {
                *v176 = vmulq_n_f64(*v176, v175);
                ++v176;
                v177 -= 2;
              }
              while (v177);
            }
            v178 = v17 + v12;
            if ((*((_BYTE *)&self->_lmFlags + 3) & 2) == 0
              || !v12
              || (-[NSLayoutManager intAttribute:forGlyphAtIndex:](self, "intAttribute:forGlyphAtIndex:", 2, v178 - 1) & 1) == 0)
            {
              if (v178 >= v225 + v213)
              {
                v185 = v215;
                v184 = (*((_BYTE *)&self->_lmFlags + 3) & 2) == 0
                    || (-[NSLayoutManager intAttribute:forGlyphAtIndex:](self, "intAttribute:forGlyphAtIndex:", 2, v225) & 1) == 0;
                goto LABEL_275;
              }
              v179 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", v17 + v12, 1, 0);
              v181 = v180;
              v182 = self->_firstTextView;
              if (v182
                && objc_msgSend((id)objc_msgSend(v182, "linkTextAttributes"), "objectForKey:", CFSTR("NSUnderline")))
              {
                v183 = 1;
                if (!v181)
                {
LABEL_264:
                  v184 = 1;
LABEL_273:
                  v185 = v215;
LABEL_275:
                  v186 = -[NSLayoutManager rectArrayForGlyphRange:withinSelectedGlyphRange:inTextContainer:rectCount:](self, "rectArrayForGlyphRange:withinSelectedGlyphRange:inTextContainer:rectCount:", v17, v12, 0x7FFFFFFFFFFFFFFFLL, 0, v185, &v235, *(_QWORD *)&v202);
                  if (v219)
                  {
                    if (v54 < 1.0 && v208)
                    {
                      v187 = fmax(v54, 0.400000006);
                      v234.a = 0.0;
                      v229.a = 0.0;
                      *(_QWORD *)&v233 = 0;
                      key = 0;
                      objc_msgSend(v208, "getRed:green:blue:alpha:", &v234, &v229, &v233, &key);
                      objc_msgSend(-[NSLayoutManager renderingColorForDocumentColor:](self, "renderingColorForDocumentColor:", objc_msgSend((Class)getNSColorClass[0](), "colorWithRed:green:blue:alpha:", v234.a, v229.a, *(double *)&v233, v187)), "set");
                    }
                    CGContextSetShouldAntialias(v29, 0);
                  }
                  else if (v208)
                  {
                    objc_msgSend(-[NSLayoutManager renderingColorForDocumentColor:](self, "renderingColorForDocumentColor:"), "set");
                  }
                  CGContextSetLineWidth(v29, v69);
                  v188 = v235;
                  if (v235)
                  {
                    v189 = 0;
                    v190 = v210 + x;
                    v191 = v209 & !v218;
                    p_width = &v186->size.width;
                    do
                    {
                      v193 = *(p_width - 2);
                      v194 = x + v193;
                      v195 = x + v193 + *p_width;
                      ++v189;
                      v196 = v195 + -1.0;
                      if (v189 < v188)
                        v196 = v195;
                      if (v184)
                        v197 = v196;
                      else
                        v197 = v195;
                      -[NSLayoutManager locationForGlyphAtIndex:](self, "locationForGlyphAtIndex:", v225);
                      if (v174 >= 2)
                        CGContextSetLineDash(v29, v194 - v198, lengths, v174);
                      v199 = v107;
                      if ((a4 & 8) != 0)
                      {
                        -[NSLayoutManager _drawLineForGlyphRange:inContext:from:to:at:thickness:lineOrigin:breakForDescenders:flipped:](self, "_drawLineForGlyphRange:inContext:from:to:at:thickness:lineOrigin:breakForDescenders:flipped:", v17, v12, v29, v191, v36, v194, v197, v107 - v69, v69, v190, v227);
                        v199 = v69 + v107;
                      }
                      -[NSLayoutManager _drawLineForGlyphRange:inContext:from:to:at:thickness:lineOrigin:breakForDescenders:flipped:](self, "_drawLineForGlyphRange:inContext:from:to:at:thickness:lineOrigin:breakForDescenders:flipped:", v17, v12, v29, v191, v36, v194, v197, v199, v69, v190, v227);
                      v188 = v235;
                      p_width += 4;
                    }
                    while (v189 < v235);
                  }
                  return;
                }
              }
              else
              {
                v183 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_defaultLinkAttributes"), "objectForKey:", CFSTR("NSUnderline")) != 0;
                if (!v181)
                  goto LABEL_264;
              }
              if (!objc_msgSend((id)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", v206, v179, 0, *(_QWORD *)&v202), "integerValue")&& (!v183|| !-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", CFSTR("NSLink"), v179, 0))&& !objc_msgSend(-[NSLayoutManager temporaryAttribute:atCharacterIndex:effectiveRange:](self, "temporaryAttribute:atCharacterIndex:effectiveRange:",
                        v206,
                        v179,
                        0),
                      "integerValue"))
              {
                v200 = (void *)-[NSTextStorage string](self->_textStorage, "string");
                objc_msgSend(v200, "rangeOfCharacterFromSet:options:range:", _NSUnderlineNonWhiteSet, 0, v179, v216 + v217 - v179);
                v184 = v201 != 0;
                goto LABEL_273;
              }
            }
            v184 = 0;
            goto LABEL_273;
          }
          v151 = -(v54 * v70);
          v152 = v54 * v51;
          v153 = 0.0;
          if (i > 1)
            v153 = v54 * v69;
          v110 = (double)(unint64_t)v211;
          v109 = v54 * v69 * v207;
          if ((a4 & 8) != 0)
          {
            if (v152 < 4.0 || (v160 = v109 * 0.75, v160 <= 0.35))
            {
              v109 = v152 * 0.25;
              v151 = v152 * 0.25 * 2.5;
            }
            else
            {
              v161 = v160 * 0.5 - v54 * v70;
              v162 = v160 + -0.5;
              v109 = ceil(v160 + -0.5);
              v163 = vcvtpd_s64_f64(v162);
              if ((_DWORD)v36)
                v164 = -v54;
              else
                v164 = v54;
              v165 = v164 * v107 - floor(v164 * v107);
              v166 = floor(v161 + 0.5);
              v167 = floor(v161) + 0.5;
              if ((v163 & 1) == 0)
                v167 = v166;
              v151 = v165 + v167;
              if (v151 <= 1.5 || v109 >= 2.0 && (v151 < 3.0 || (v151 <= 3.0 ? (v168 = v152 < 7.0) : (v168 = 1), !v168)))
                v151 = v151 + 1.0;
            }
            v159 = 1.5;
          }
          else
          {
            if (v152 >= 2.0 && v109 > 0.35)
            {
              v109 = ceil(v109);
              if (v109 >= v152 || v152 <= 4.0 && v109 >= 3.0 || v152 <= 2.5 && v109 >= 2.0)
                v109 = v109 + -1.0;
              if ((_DWORD)v36)
                v154 = -v54;
              else
                v154 = v54;
              v155 = v154 * v107 - floor(v154 * v107);
              v156 = floor(0.5 - v54 * v70);
              v157 = floor(v151) + 0.5;
              if (((int)v109 & 1) == 0)
                v157 = v156;
              v151 = v155 + v157;
              if (v151 < 1.5 || (v151 <= 1.5 ? (v158 = v152 <= 4.0) : (v158 = 1), !v158))
                v151 = v151 + 1.0;
            }
            v159 = 0.5;
          }
          v169 = floor(v153 + v109 * v159);
          if (v151 >= v169)
            v169 = v151;
          v92 = v169 / -v54;
LABEL_232:
          v69 = v109 / v54;
          goto LABEL_233;
        }
        v92 = -v51;
        v110 = (double)(unint64_t)v211;
      }
      v107 = v68;
      goto LABEL_233;
    }
LABEL_138:
    *(_QWORD *)&v233 = --v77;
    goto LABEL_139;
  }
}

uint64_t __148__NSLayoutManager_OtherSupport___drawLineForGlyphRange_type_baselineOffset_lineFragmentRect_lineFragmentGlyphRange_containerOrigin_isStrikethrough___block_invoke()
{
  void *v0;
  uint64_t result;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  result = objc_msgSend(v0, "objectForKey:", CFSTR("NSUnderlinesBreakForDescenders"));
  if (result)
  {
    result = objc_msgSend(v0, "BOOLForKey:", CFSTR("NSUnderlinesBreakForDescenders"));
    _drawLineForGlyphRange_type_baselineOffset_lineFragmentRect_lineFragmentGlyphRange_containerOrigin_isStrikethrough__breakForDescendersDefault = result;
  }
  return result;
}

- (void)_lineGlyphRange:(_NSRange)a3 type:(int64_t)a4 lineFragmentRect:(CGRect)a5 lineFragmentGlyphRange:(_NSRange)a6 containerOrigin:(CGPoint)a7 isStrikethrough:(BOOL)a8
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v10;
  double y;
  double x;
  double height;
  double width;
  double v15;
  double v16;
  NSUInteger v17;
  double v19;
  double v20;
  uint64_t v21;
  NSUInteger v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  NSUInteger v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  BOOL v32;
  unint64_t v33;
  NSUInteger v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  unint64_t v45;
  unint64_t v46;
  int v47;
  uint64_t v48;
  NSUInteger v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSUInteger v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  NSUInteger v66;
  NSUInteger v68;
  unint64_t v69;
  void *v70;

  length = a6.length;
  location = a6.location;
  v10 = a3.length;
  y = a7.y;
  x = a7.x;
  height = a5.size.height;
  width = a5.size.width;
  v15 = a5.origin.y;
  v16 = a5.origin.x;
  v17 = a3.location;
  v70 = (void *)-[NSTextStorage string](self->_textStorage, "string");
  if (!_NSUnderlineWhiteSet)
  {
    _NSUnderlineWhiteSet = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    _NSUnderlineNonWhiteSet = (uint64_t)(id)objc_msgSend((id)_NSUnderlineWhiteSet, "invertedSet");
  }
  -[NSTypesetter baselineOffsetInLayoutManager:glyphIndex:](-[NSLayoutManager typesetter](self, "typesetter"), "baselineOffsetInLayoutManager:glyphIndex:", self, v17);
  v20 = v19;
  v21 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", v17, v10, 0);
  v66 = location;
  v22 = location;
  v24 = v23;
  v63 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", v22, length, 0);
  if (v24)
  {
    v62 = v63 + v25;
    v26 = v21;
    v27 = v24;
    v68 = length;
    while (1)
    {
      v28 = objc_msgSend(v70, "rangeOfCharacterFromSet:options:range:", _NSUnderlineWhiteSet, 0, v26, v27);
      v29 = v28;
      v69 = v21;
      if (v30 && (v31 = v21 + v24, v32 = v21 + v24 >= v28, v33 = v21 + v24 - v28, v33 != 0 && v32))
      {
        v34 = length;
        v35 = v24;
        v36 = 0;
        v37 = v28 - v31;
        while (1)
        {
          v38 = objc_msgSend(v70, "characterAtIndex:", v29 + v36);
          if ((_DWORD)v38 == 160 || !objc_msgSend((id)_NSUnderlineWhiteSet, "characterIsMember:", v38))
            break;
          ++v36;
          if (!(v37 + v36))
          {
            v36 = v33;
            break;
          }
        }
        v24 = v35;
        length = v34;
      }
      else
      {
        v36 = 0;
      }
      if ((*((_BYTE *)&self->_lmFlags + 3) & 2) != 0)
      {
        v40 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v26, v27, 0);
        if (v41)
        {
          v42 = v40;
          v43 = v41;
          v64 = v24;
          v44 = -[NSLayoutManager intAttribute:forGlyphAtIndex:](self, "intAttribute:forGlyphAtIndex:", 2, v40);
          v45 = v42 + v43;
          v46 = v42 + 1;
          if (v46 >= v45)
          {
LABEL_24:
            v39 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else
          {
            v47 = v44;
            v48 = v43 - 1;
            while (1)
            {
              if (((v47
                   - -[NSLayoutManager intAttribute:forGlyphAtIndex:](self, "intAttribute:forGlyphAtIndex:", 2, v46)) & 1) != 0)
              {
                v49 = -[NSLayoutManager characterIndexForGlyphAtIndex:](self, "characterIndexForGlyphAtIndex:", v46);
                if (v49 > v26)
                  break;
              }
              ++v46;
              if (!--v48)
                goto LABEL_24;
            }
            v39 = v49;
          }
          length = v68;
          v24 = v64;
          if (!v36)
            goto LABEL_30;
        }
        else
        {
          v39 = 0x7FFFFFFFFFFFFFFFLL;
          length = v68;
          if (!v36)
            goto LABEL_30;
        }
      }
      else
      {
        v39 = 0x7FFFFFFFFFFFFFFFLL;
        if (!v36)
          goto LABEL_30;
      }
      if (v39 == 0x7FFFFFFFFFFFFFFFLL || v29 < v39)
      {
        v55 = v24;
        v39 = v36 + v29;
        objc_msgSend(v70, "rangeOfCharacterFromSet:options:range:", _NSUnderlineNonWhiteSet, 0, v63, v36 + v29 - v63);
        v57 = v56;
        objc_msgSend(v70, "rangeOfCharacterFromSet:options:range:", _NSUnderlineNonWhiteSet, 0, v29, v62 - v29);
        if (v57)
        {
          v21 = v69;
          if ((a4 & 0x8000) == 0 && v58)
          {
            v24 = v55;
            goto LABEL_43;
          }
          if (v29 > v69)
          {
            v50 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v69, v29 - v69, 0);
            v52 = v59;
            v24 = v69 + v55 - v39;
            v27 = v26 + v27 - v39;
            v54 = v66;
            length = v68;
            if (!a8)
            {
LABEL_47:
              -[NSLayoutManager drawUnderlineForGlyphRange:underlineType:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:](self, "drawUnderlineForGlyphRange:underlineType:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:", v50, v52, a4, v54, length, v20, v16, v15, width, height, x, y);
              goto LABEL_48;
            }
LABEL_36:
            -[NSLayoutManager drawStrikethroughForGlyphRange:strikethroughType:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:](self, "drawStrikethroughForGlyphRange:strikethroughType:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:", v50, v52, a4, v54, length, v20, v16, v15, width, height, x, y);
LABEL_48:
            v21 = v39;
            goto LABEL_49;
          }
          v24 = v69 + v55 - v39;
          v27 = v26 + v27 - v39;
          v21 = v36 + v29;
        }
        else
        {
          v24 = v69 + v55 - v39;
          v21 = v36 + v29;
LABEL_43:
          v27 = v26 + v27 - v39;
        }
        length = v68;
        goto LABEL_49;
      }
LABEL_30:
      if (v39 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (!v24)
          return;
        v50 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v69, v24, 0);
        v52 = v51;
        v27 = 0;
        v39 = v69 + v24;
        v24 = 0;
LABEL_35:
        v54 = v66;
        if (!a8)
          goto LABEL_47;
        goto LABEL_36;
      }
      if (v39 > v69)
      {
        v50 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v69, v39 - v69, 0);
        v52 = v53;
        v24 = v69 + v24 - v39;
        v27 = v24;
        goto LABEL_35;
      }
      v24 = v69 + v24 - v39;
      v21 = v39;
      v27 = v24;
LABEL_49:
      v26 = v39;
      if (!v27)
      {
        if (v24)
        {
          v61 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v21, v24, 0);
          if (a8)
            -[NSLayoutManager drawStrikethroughForGlyphRange:strikethroughType:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:](self, "drawStrikethroughForGlyphRange:strikethroughType:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:", v61, v60, a4, v66, length, v20, v16, v15, width, height, x, y);
          else
            -[NSLayoutManager drawUnderlineForGlyphRange:underlineType:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:](self, "drawUnderlineForGlyphRange:underlineType:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:", v61, v60, a4, v66, length, v20, v16, v15, width, height, x, y);
        }
        return;
      }
    }
  }
}

+ (id)_defaultLinkAttributesForLabel
{
  if (_defaultLinkAttributesForLabel_onceToken != -1)
    dispatch_once(&_defaultLinkAttributesForLabel_onceToken, &__block_literal_global_2);
  return (id)_defaultLinkAttributesForLabel_defaultLinkAttributes;
}

uint64_t __60__NSLayoutManager_NSPrivate___defaultLinkAttributesForLabel__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", objc_msgSend((Class)getNSColorClass_0[0](), "linkColor"), CFSTR("NSColor"), 0);
  _defaultLinkAttributesForLabel_defaultLinkAttributes = result;
  return result;
}

+ (id)_defaultLinkAttributes
{
  if (_defaultLinkAttributes_onceToken != -1)
    dispatch_once(&_defaultLinkAttributes_onceToken, &__block_literal_global_1);
  return (id)_defaultLinkAttributes_defaultLinkAttributes;
}

uint64_t __52__NSLayoutManager_NSPrivate___defaultLinkAttributes__block_invoke()
{
  uint64_t v0;
  id v1;
  uint64_t result;

  v0 = objc_msgSend((Class)getNSColorClass_0[0](), "linkColor");
  v1 = objc_alloc(MEMORY[0x1E0C99D80]);
  result = objc_msgSend(v1, "initWithObjectsAndKeys:", v0, CFSTR("NSColor"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1), CFSTR("NSUnderline"), 0);
  _defaultLinkAttributes_defaultLinkAttributes = result;
  return result;
}

- (id)linkAttributesForLink:(id)a3 forCharacterAtIndex:(unint64_t)a4
{
  id v7;
  id result;
  _BOOL4 v9;
  void *v10;

  v7 = -[NSLayoutManager delegate](self, "delegate");
  if (((objc_opt_respondsToSelector() & 1) == 0
     || (result = (id)objc_msgSend(v7, "layoutManager:linkAttributesForLink:forCharacterAtIndex:", self, a3, a4)) == 0)
    && ((objc_opt_respondsToSelector() & 1) == 0
     || (result = (id)objc_msgSend(self->_firstTextView, "linkAttributesForLink:forCharacterAtIndex:", a3, a4)) == 0))
  {
    result = (id)objc_msgSend(self->_firstTextView, "linkTextAttributes");
    if (!result)
    {
      v9 = -[NSAttributedString _isStringDrawingTextStorage](-[NSLayoutManager textStorage](self, "textStorage"), "_isStringDrawingTextStorage");
      v10 = (void *)objc_opt_class();
      if (v9)
        return (id)objc_msgSend(v10, "_defaultLinkAttributesForLabel");
      else
        return (id)objc_msgSend(v10, "_defaultLinkAttributes");
    }
  }
  return result;
}

- (id)linkAttributesForAttributes:(id)a3 forCharacterAtIndex:(unint64_t)a4
{
  id v7;
  id result;

  v7 = -[NSLayoutManager delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return -[NSLayoutManager linkAttributesForLink:forCharacterAtIndex:](self, "linkAttributesForLink:forCharacterAtIndex:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NSLink")), a4);
  result = (id)objc_msgSend(v7, "layoutManager:linkAttributesForAttributes:forCharacterAtIndex:", self, a3, a4);
  if (!result)
    return -[NSLayoutManager linkAttributesForLink:forCharacterAtIndex:](self, "linkAttributesForLink:forCharacterAtIndex:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NSLink")), a4);
  return result;
}

- (_NSRange)_blockRangeForCharRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSRange v17;
  NSUInteger v18;
  NSUInteger v19;
  BOOL v20;
  NSUInteger v21;
  void *v22;
  void *v23;
  void *v24;
  char isKindOfClass;
  NSTextStorage *textStorage;
  NSUInteger v27;
  NSUInteger v28;
  NSRange v29;
  NSRange v30;
  NSUInteger v31;
  NSUInteger v32;
  NSRange v33;
  NSRange v34;
  _NSRange result;
  NSRange v36;

  length = a3.length;
  location = a3.location;
  v6 = -[NSTextStorage length](self->_textStorage, "length");
  if (location >= v6)
  {
    v13 = length;
    v14 = location;
    goto LABEL_24;
  }
  v7 = v6;
  v8 = (void *)objc_msgSend((id)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), location, 0), "textBlocks");
  if (!v8 || (v9 = v8, !objc_msgSend(v8, "count")))
  {
    v15 = 0;
    v16 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_8:
    v13 = length;
    v14 = location;
    goto LABEL_12;
  }
  v10 = (void *)objc_msgSend(v9, "objectAtIndex:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = -[NSAttributedString rangeOfTextTable:atIndex:](self->_textStorage, "rangeOfTextTable:atIndex:", objc_msgSend(v10, "table"), location);
  else
    v11 = -[NSAttributedString rangeOfTextBlock:atIndex:](self->_textStorage, "rangeOfTextBlock:atIndex:", v10, location);
  v16 = v11;
  v15 = v12;
  if (!v12)
    goto LABEL_8;
  v33.location = location;
  v33.length = length;
  v36.location = v16;
  v36.length = v15;
  v17 = NSUnionRange(v33, v36);
  v14 = v17.location;
  v13 = v17.length;
LABEL_12:
  if (length >= 2)
  {
    v18 = location + length;
    if (location + length < v7)
    {
      v19 = v18 - 1;
      v20 = v18 - 1 >= v16;
      v21 = v18 - 1 - v16;
      if (!v20 || v21 >= v15)
      {
        v22 = (void *)objc_msgSend((id)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v19, 0), "textBlocks");
        if (v22)
        {
          v23 = v22;
          if (objc_msgSend(v22, "count"))
          {
            v24 = (void *)objc_msgSend(v23, "objectAtIndex:", 0);
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();
            textStorage = self->_textStorage;
            if ((isKindOfClass & 1) != 0)
              v27 = -[NSAttributedString rangeOfTextTable:atIndex:](textStorage, "rangeOfTextTable:atIndex:", objc_msgSend(v24, "table"), v19);
            else
              v27 = -[NSAttributedString rangeOfTextBlock:atIndex:](textStorage, "rangeOfTextBlock:atIndex:", v24, v19);
            v29.location = v27;
            v29.length = v28;
            if (v28)
            {
              v34.location = v14;
              v34.length = v13;
              v30 = NSUnionRange(v34, v29);
              v14 = v30.location;
              v13 = v30.length;
            }
          }
        }
      }
    }
  }
LABEL_24:
  v31 = v14;
  v32 = v13;
  result.length = v32;
  result.location = v31;
  return result;
}

- (_NSRange)_blockRangeForGlyphRange:(_NSRange)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v4 = -[NSLayoutManager _primitiveCharacterRangeForGlyphRange:](self, "_primitiveCharacterRangeForGlyphRange:", a3.location, a3.length);
  v6 = -[NSLayoutManager _blockRangeForCharRange:](self, "_blockRangeForCharRange:", v4, v5);
  v8 = -[NSLayoutManager _primitiveGlyphRangeForCharacterRange:](self, "_primitiveGlyphRangeForCharacterRange:", v6, v7);
  result.length = v9;
  result.location = v8;
  return result;
}

- (_NSRange)_blockRowRangeForGlyphRange:(_NSRange)a3 completeRows:(BOOL *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  v6 = -[NSLayoutManager _primitiveCharacterRangeForGlyphRange:](self, "_primitiveCharacterRangeForGlyphRange:", a3.location, a3.length);
  v8 = -[NSLayoutManager _blockRowRangeForCharRange:completeRows:](self, "_blockRowRangeForCharRange:completeRows:", v6, v7, a4);
  v10 = -[NSLayoutManager _primitiveGlyphRangeForCharacterRange:](self, "_primitiveGlyphRangeForCharacterRange:", v8, v9);
  result.length = v11;
  result.location = v10;
  return result;
}

- (_NSRange)_blockRowRangeForGlyphRange:(_NSRange)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v4 = -[NSLayoutManager _primitiveCharacterRangeForGlyphRange:](self, "_primitiveCharacterRangeForGlyphRange:", a3.location, a3.length);
  v6 = -[NSLayoutManager _blockRowRangeForCharRange:completeRows:](self, "_blockRowRangeForCharRange:completeRows:", v4, v5, 0);
  v8 = -[NSLayoutManager _primitiveGlyphRangeForCharacterRange:](self, "_primitiveGlyphRangeForCharacterRange:", v6, v7);
  result.length = v9;
  result.location = v8;
  return result;
}

- (id)_rowArrayCache
{
  return (id)*((_QWORD *)self->_extraData + 52);
}

- (void)_setRowArrayCache:(id)a3
{
  id v3;

  v3 = (id)*((_QWORD *)self->_extraData + 52);
  if (v3 != a3)
  {

    *((_QWORD *)self->_extraData + 52) = a3;
  }
}

- (BOOL)_canDoLayout
{
  if ((*(_DWORD *)&self->_lmFlags & 0x30000) == 0x10000)
    return !-[NSTextStorage _isEditing](self->_textStorage, "_isEditing");
  else
    return 1;
}

- (void)_fillGlyphHoleAtIndex:(unint64_t)a3 desiredNumberOfCharacters:(unint64_t)a4
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v9 = 0;
  v10 = 0;
  v8 = 0;
  v5 = 2048;
  if ((*((_BYTE *)&self->_lmFlags + 3) & 8) == 0)
    v5 = 0x2000;
  if (!a4)
    a4 = **((_QWORD **)self->_extraData + 26);
  if (a4 <= v5)
    v6 = v5;
  else
    v6 = a4;
  _NSGlyphTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, 0, v6, &v9, &v8, &v10);
  v7 = v8;
  if (v8 > v6)
  {
    v8 = v6;
    v7 = v6;
  }
  -[NSLayoutManager _fillGlyphHoleForCharacterRange:startGlyphIndex:desiredNumberOfCharacters:](self, "_fillGlyphHoleForCharacterRange:startGlyphIndex:desiredNumberOfCharacters:", v9, v7, v10, v7);
}

- (BOOL)_doOptimizedLayoutStartingAtGlyphIndex:(unint64_t)a3 forCharacterRange:(_NSRange)a4 inTextContainer:(id)a5 lineLimit:(unint64_t)a6 nextGlyphIndex:(unint64_t *)a7
{
  *a7 = a3;
  return 0;
}

- (void)_doLayoutWithFullContainerStartingAtGlyphIndex:(unint64_t)a3 nextGlyphIndex:(unint64_t *)a4
{
  uint64_t v7;
  unint64_t v8;
  void *v9;

  v7 = *((_QWORD *)self->_extraData + 26);
  v8 = *(_QWORD *)(v7 + 8);
  if ((*(_BYTE *)(v7 + 56) & 1) == 0)
    -[NSLayoutManager _setExtraLineFragmentRect:usedRect:textContainer:](self, "_setExtraLineFragmentRect:usedRect:textContainer:", 0, *MEMORY[0x1E0CB3438], *(double *)(MEMORY[0x1E0CB3438] + 8), *(double *)(MEMORY[0x1E0CB3438] + 16), *(double *)(MEMORY[0x1E0CB3438] + 24), *MEMORY[0x1E0CB3438], *(double *)(MEMORY[0x1E0CB3438] + 8), *(double *)(MEMORY[0x1E0CB3438] + 16), *(double *)(MEMORY[0x1E0CB3438] + 24));
  if (v8 <= a3)
  {
    v8 = a3;
  }
  else
  {
    -[NSLayoutManager _setTextContainer:forGlyphRange:](self, "_setTextContainer:forGlyphRange:", 0, a3, v8 - a3);
    -[NSLayoutManager setLineFragmentRect:forGlyphRange:usedRect:](self, "setLineFragmentRect:forGlyphRange:usedRect:", a3, v8 - a3, *MEMORY[0x1E0CB3438], *(double *)(MEMORY[0x1E0CB3438] + 8), *(double *)(MEMORY[0x1E0CB3438] + 16), *(double *)(MEMORY[0x1E0CB3438] + 24), *MEMORY[0x1E0CB3438], *(double *)(MEMORY[0x1E0CB3438] + 8), *(double *)(MEMORY[0x1E0CB3438] + 16), *(double *)(MEMORY[0x1E0CB3438] + 24));
    -[NSLayoutManager setLocation:forStartOfGlyphRange:](self, "setLocation:forStartOfGlyphRange:", a3, v8 - a3, *MEMORY[0x1E0CB3430], *(double *)(MEMORY[0x1E0CB3430] + 8));
    v9 = (void *)*((_QWORD *)self->_extraData + 23);
    if (v9)
      _NSRemoveTextBlocksStartingAtGlyphIndex(v9, a3);
  }
  *a4 = v8;
}

- (void)_noteFirstTextViewVisibleCharacterRangeIfAfterIndex:(unint64_t)a3
{
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
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  BOOL v24;
  unint64_t v25;
  unint64_t v26;
  double v27;
  unint64_t *v28;
  double *v29;
  double v30;
  NSRect v31;

  objc_msgSend(self->_firstTextView, "visibleRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(self->_firstTextView, "textContainerOrigin");
  v14 = v13;
  v16 = v15;
  v31.origin.x = v6;
  v31.origin.y = v8;
  v31.size.width = v10;
  v31.size.height = v12;
  if (!NSIsEmptyRect(v31))
  {
    v17 = v6 - v14;
    v18 = v8 - v16;
    v19 = -[NSLayoutManager glyphRangeForBoundingRect:inTextContainer:](self, "glyphRangeForBoundingRect:inTextContainer:", objc_msgSend(self->_firstTextView, "textContainer"), v17, v18, v10, v12);
    if (v20)
    {
      v21 = v19;
      v22 = -[NSLayoutManager _primitiveCharacterRangeForGlyphRange:](self, "_primitiveCharacterRangeForGlyphRange:", v19, v20);
      if (v23)
        v24 = v22 >= a3;
      else
        v24 = 0;
      if (v24)
      {
        v25 = v22;
        v26 = v23;
        v27 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v21, 0);
        v28 = (unint64_t *)((char *)self->_extraData + 352);
        *v28 = v25;
        v28[1] = v26;
        v29 = (double *)((char *)self->_extraData + 368);
        *v29 = v17 - v27;
        v29[1] = v18 - v30;
      }
    }
  }
}

- (unint64_t)_smallEncodingGlyphIndexForCharacterIndex:(unint64_t)a3 startOfRange:(BOOL)a4 okToFillHoles:(BOOL)a5 considerNulls:(BOOL)a6
{
  if (a5)
    _NSFastFillAllGlyphHolesForCharacterRange((uint64_t)self, a3, 1uLL);
  return _NSGlyphTreeGlyphIndexForCharacterAtIndex((uint64_t)self, a3);
}

- (unint64_t)_smallEncodingGlyphIndexForCharacterIndex:(unint64_t)a3 startOfRange:(BOOL)a4 okToFillHoles:(BOOL)a5
{
  return -[NSLayoutManager _smallEncodingGlyphIndexForCharacterIndex:startOfRange:okToFillHoles:considerNulls:](self, "_smallEncodingGlyphIndexForCharacterIndex:startOfRange:okToFillHoles:considerNulls:", a3, a4, a5, 1);
}

- (unint64_t)_glyphIndexForCharacterIndex:(unint64_t)a3 startOfRange:(BOOL)a4 okToFillHoles:(BOOL)a5
{
  return -[NSLayoutManager _glyphIndexForCharacterIndex:startOfRange:okToFillHoles:considerNulls:](self, "_glyphIndexForCharacterIndex:startOfRange:okToFillHoles:considerNulls:", a3, a4, a5, 1);
}

- (unint64_t)_glyphIndexForCharacterIndex:(unint64_t)a3 startOfRange:(BOOL)a4 okToFillHoles:(BOOL)a5 considerNulls:(BOOL)a6
{
  if (a5)
    _NSFastFillAllGlyphHolesForCharacterRange((uint64_t)self, a3, 1uLL);
  return _NSGlyphTreeGlyphIndexForCharacterAtIndex((uint64_t)self, a3);
}

- (_NSRange)_glyphRangeForCharacterRange:(_NSRange)a3 actualCharacterRange:(_NSRange *)a4 okToFillHoles:(BOOL)a5
{
  _BOOL4 v5;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  v5 = a5;
  length = a3.length;
  location = a3.location;
  if (a5)
    _NSFastFillAllGlyphHolesForCharacterRange((uint64_t)self, a3.location, a3.length + 1);
  v10 = _NSGlyphTreeGlyphRangeForCharacterRange((uint64_t)self, location, length, v5, 1, 1, (uint64_t *)a4);
  result.length = v11;
  result.location = v10;
  return result;
}

- (_NSRange)_exactGlyphRangeForCharacterRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  _NSFastFillAllGlyphHolesForCharacterRange((uint64_t)self, a3.location, 1uLL);
  if (length >= 2)
    _NSFastFillAllGlyphHolesForCharacterRange((uint64_t)self, length + location - 1, 2uLL);
  v6 = _NSGlyphTreeGlyphRangeForCharacterRange((uint64_t)self, location, length, 1, 1, 0, 0);
  result.length = v7;
  result.location = v6;
  return result;
}

+ (BOOL)_inBackgroundLayout
{
  return _inBackgroundLayout;
}

+ (void)_doSomeBackgroundLayout
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void *v8;
  unint64_t *v9;
  id v11;

  v2 = objc_msgSend((id)_dirtyLMs, "count");
  if (!v2)
    return;
  v3 = v2;
  while (1)
  {
    v4 = objc_msgSend((id)_dirtyLMs, "pointerAtIndex:", 0);
    if (!v4)
    {
      objc_msgSend((id)_dirtyLMs, "removePointerAtIndex:", 0);
      goto LABEL_18;
    }
    v5 = v4;
    if ((*(_BYTE *)(v4 + 64) & 4) != 0)
      break;
    objc_msgSend((id)_dirtyLMs, "removePointerAtIndex:", 0);
    *(_DWORD *)(v5 + 64) &= ~0x100u;
LABEL_18:
    if (!--v3)
      return;
  }
  v6 = *(_QWORD *)(v4 + 240);
  v7 = objc_msgSend((id)objc_msgSend((id)v4, "textStorage"), "_isStringDrawingTextStorage");
  if ((v7 & 1) == 0 && !*(_QWORD *)(v6 + 56))
  {
    v8 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB38E0], "allocWithZone:", objc_msgSend((id)v5, "zone")), "init");
    v9 = (unint64_t *)(v6 + 56);
    while (!__ldaxr(v9))
    {
      if (!__stlxr((unint64_t)v8, v9))
        goto LABEL_14;
    }
    __clrex();

  }
LABEL_14:
  objc_msgSend(*(id *)(v6 + 56), "lock");
  objc_msgSend((id)v5, "_mergeLayoutHoles");
  if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 240) + 240) + 56) & 1) == 0 || (*(_BYTE *)(v5 + 67) & 0x40) != 0)
  {
    objc_msgSend((id)_dirtyLMs, "removePointerAtIndex:", 0);
    *(_DWORD *)(v5 + 64) &= ~0x100u;
    if ((v7 & 1) == 0)
      objc_msgSend(*(id *)(*(_QWORD *)(v5 + 240) + 56), "unlock");
    goto LABEL_18;
  }
  if ((unint64_t)objc_msgSend((id)_dirtyLMs, "count") >= 2)
  {
    v11 = (id)v5;
    objc_msgSend((id)_dirtyLMs, "removePointerAtIndex:", 0);
    objc_msgSend((id)_dirtyLMs, "addPointer:", v5);

  }
  _inBackgroundLayout = 1;
  objc_msgSend((id)v5, "_fillLayoutHoleAtIndex:desiredNumberOfLines:", 0, 100);
  if ((v7 & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(v5 + 240) + 56), "unlock");
  _inBackgroundLayout = 0;
}

- (id)_containerDescription
{
  void *v3;
  unint64_t firstUnlaidGlyphIndex;
  unint64_t v5;
  uint64_t v6;
  NSRunStorage *containerRuns;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSTextContainer *v11;
  uint64_t ValueAtIndex;
  const __CFString *v13;
  void *v14;
  NSString *v15;
  __n128 v16;
  const __CFString *v17;
  NSString *v18;
  const __CFString *v19;
  __n128 v21;
  unint64_t v22;
  objc_super v23;
  NSRect v24;
  NSSize v25;

  v23.receiver = self;
  v23.super_class = (Class)NSLayoutManager;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@\n"), -[NSLayoutManager description](&v23, sel_description));
  v22 = 0;
  v21 = 0uLL;
  if (self->_firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL
    || (firstUnlaidGlyphIndex = self->_firstUnlaidGlyphIndex, firstUnlaidGlyphIndex == 0x7FFFFFFFFFFFFFFFLL))
  {
    -[NSLayoutManager getFirstUnlaidCharacterIndex:glyphIndex:](self, "getFirstUnlaidCharacterIndex:glyphIndex:", 0, &v22);
    if (!v22)
      return v3;
    goto LABEL_6;
  }
  v22 = self->_firstUnlaidGlyphIndex;
  if (firstUnlaidGlyphIndex)
  {
LABEL_6:
    v5 = 0;
    v6 = 0;
    do
    {
      if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
      {
        v10 = *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8);
        v21.n128_u64[0] = 0;
        v21.n128_u64[1] = v10;
        v11 = (NSTextContainer *)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
      }
      else if (-[NSRunStorage count](self->_containerRuns, "count") <= v5)
      {
        v11 = 0;
      }
      else
      {
        containerRuns = self->_containerRuns;
        _NSBlockNumberForIndex(containerRuns, v5, &v21);
        if (containerRuns->_gapBlockIndex <= v8)
          v9 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
        else
          v9 = 0;
        v11 = *(NSTextContainer **)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v9 + v8)];
      }
      if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) == 0 && v21.n128_u64[1] + v21.n128_u64[0] > v22)
        v21.n128_u64[1] = v22 - v21.n128_u64[0];
      if (v11)
        ValueAtIndex = CFStorageGetValueAtIndex();
      else
        ValueAtIndex = 0;
      v13 = &stru_1E260C7D0;
      if (v11 == self->_extraLineFragmentContainer)
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        memset(&v24, 0, sizeof(v24));
        _NSLayoutTreeGetExtraLineFragmentRect((uint64_t)self, (uint64_t)&v24, 0);
        v15 = NSStringFromRect(v24);
        memset(&v24, 0, sizeof(v24));
        _NSLayoutTreeGetExtraLineFragmentRect((uint64_t)self, 0, (uint64_t)&v24);
        v13 = (const __CFString *)objc_msgSend(v14, "stringWithFormat:", CFSTR("elf rect %@ used rect %@"), v15, NSStringFromRect(v24));
      }
      v16 = v21;
      if (v11)
      {
        v17 = -[NSTextContainer description](v11, "description");
        -[NSTextContainer size](v11, "size");
        v18 = NSStringFromSize(v25);
        if (ValueAtIndex)
          goto LABEL_25;
      }
      else
      {
        v17 = CFSTR("nil");
        v18 = (NSString *)CFSTR("N/A");
        if (ValueAtIndex)
        {
LABEL_25:
          v19 = CFSTR("<invalid>");
          if ((*(_BYTE *)(ValueAtIndex + 64) & 1) == 0)
            v19 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{%.2f, %.2f}, {%.2f, %.2f}}"), *(_QWORD *)ValueAtIndex, *(_QWORD *)(ValueAtIndex + 8), *(_QWORD *)(ValueAtIndex + 16), *(_QWORD *)(ValueAtIndex + 24));
          goto LABEL_29;
        }
      }
      v19 = CFSTR("<none>");
LABEL_29:
      objc_msgSend(v3, "appendFormat:", CFSTR("Container %lu: glyph range {%lu, %lu}, %@, size %@, used rect %@ %@\n"), v6, *(_OWORD *)&v16, v17, v18, v19, v13);
      v5 = v21.n128_u64[1] + v21.n128_u64[0];
      ++v6;
    }
    while (v21.n128_u64[1] + v21.n128_u64[0] < v22);
  }
  return v3;
}

- (id)_lineFragmentDescriptionForGlyphRange:(_NSRange)a3 includeGlyphLocations:(BOOL)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v22;
  NSUInteger i;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  const __CFString *v29;
  uint64_t v31;
  NSUInteger v32;
  _BOOL4 v33;
  NSRange v34;
  NSRange v35;
  objc_super v36;

  v33 = a4;
  length = a3.length;
  location = a3.location;
  v36.receiver = self;
  v36.super_class = (Class)NSLayoutManager;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@\n"), -[NSLayoutManager description](&v36, sel_description));
  v35.location = 0;
  v35.length = 0;
  v8 = -[NSTextStorage string](self->_textStorage, "string");
  v32 = location + length;
  if (location < location + length)
  {
    v9 = (void *)v8;
    v10 = 0;
    do
    {
      v11 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, location, (uint64_t *)&v35);
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v18 = _NSLayoutTreeLineFragmentUsedRectForGlyphAtIndex((uint64_t)self, location, 0);
      objc_msgSend(v7, "appendFormat:", CFSTR("Line %lu: glyph range {%lu, %lu}, bounds {{%.2f, %.2f}, {%.2f, %.2f}}, usedRect {{%.2f, %.2f}, {%.2f, %.2f}}\n"), v10, v35.location, v35.length, *(_QWORD *)&v11, v13, v15, v17, *(_QWORD *)&v18, v19, v20, v21);
      if (v33)
      {
        v31 = v10;
        v34.location = 0;
        v34.length = 0;
        v22 = v35.location;
        for (i = v35.length + v35.location; v22 < i; i = v35.length + v35.location)
        {
          v24 = _NSLayoutTreeRunLocationForGlyphAtIndex((uint64_t)self, v22, &v34);
          v26 = v25;
          v34 = NSIntersectionRange(v34, v35);
          objc_msgSend(v7, "appendFormat:", CFSTR("    {%lu, %lu} {%.2f, %.2f}, glyphs: "), v34.location, v34.length, *(_QWORD *)&v24, v26);
          while (v22 < v34.length + v34.location)
          {
            v27 = _NSGlyphTreeGlyphAtIndex((uint64_t)self, v22, 0);
            v28 = objc_msgSend(v9, "characterAtIndex:", _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, v22));
            if ((_DWORD)v27 == 0xFFFFFF)
              objc_msgSend(v7, "appendString:", CFSTR("NSControlGlyph "));
            else
              objc_msgSend(v7, "appendFormat:", CFSTR("0x%x "), v27);
            if (v28 - 32 >= 0x5F)
              v29 = CFSTR("(ch=0x%04x) ");
            else
              v29 = CFSTR("(ch='%c') ");
            objc_msgSend(v7, "appendFormat:", v29, v28);
            ++v22;
          }
          objc_msgSend(v7, "appendString:", CFSTR("\n"));
        }
        objc_msgSend(v7, "replaceCharactersInRange:withString:", objc_msgSend(v7, "length") - 2, 2, CFSTR("\n"));
        v10 = v31;
      }
      location = v35.length + v35.location;
      ++v10;
    }
    while (v35.length + v35.location < v32);
  }
  return v7;
}

- (id)_lineFragmentDescription:(BOOL)a3
{
  return -[NSLayoutManager _lineFragmentDescriptionForGlyphRange:includeGlyphLocations:](self, "_lineFragmentDescriptionForGlyphRange:includeGlyphLocations:", 0, *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8), a3);
}

- (id)_lineFragmentDescription
{
  return -[NSLayoutManager _lineFragmentDescription:](self, "_lineFragmentDescription:", 0);
}

- (id)_glyphLocationDescription
{
  return -[NSLayoutManager _lineFragmentDescription:](self, "_lineFragmentDescription:", 1);
}

- (id)_glyphDescriptionForGlyphRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v21;

  length = a3.length;
  location = a3.location;
  v21.receiver = self;
  v21.super_class = (Class)NSLayoutManager;
  v18 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@\n"), -[NSLayoutManager description](&v21, sel_description));
  v17 = (void *)-[NSTextStorage string](self->_textStorage, "string");
  if (location < location + length)
  {
    do
    {
      v6 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, location);
      v7 = objc_msgSend(v17, "characterAtIndex:", v6);
      v20 = _NSGlyphTreeGlyphAtIndex((uint64_t)self, location, 0);
      if (v7 - 32 > 0x5E)
        v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%04x"), v7);
      else
        v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%c'"), v7);
      v19 = v8;
      v9 = _NSGlyphTreeIntAttributeForGlyphAtIndex((uint64_t)self, location, 5);
      v10 = _NSGlyphTreeBidiLevelForGlyphAtIndex((uint64_t)self, location);
      if (_NSGlyphTreeIntAttributeForGlyphAtIndex((uint64_t)self, location, 0))
        v11 = CFSTR("sft ");
      else
        v11 = CFSTR("    ");
      if (_NSGlyphTreeIntAttributeForGlyphAtIndex((uint64_t)self, location, 1))
        v12 = CFSTR("ela ");
      else
        v12 = CFSTR("    ");
      if (_NSGlyphTreeDrawsOutsideLineFragmentForGlyphAtIndex((uint64_t)self, location))
        v13 = CFSTR("out ");
      else
        v13 = CFSTR("    ");
      v14 = _NSGlyphTreeNotShownAttributeForGlyphAtIndex((uint64_t)self, location);
      v15 = CFSTR("inv ");
      if (!v14)
        v15 = CFSTR("    ");
      objc_msgSend(v18, "appendFormat:", CFSTR("%4d: %u (ch=%@) cix=%4d insc=%d bidi=%d %@%@%@%@\n"), location++, v20, v19, v6, v9, v10, v11, v12, v13, v15);
      --length;
    }
    while (length);
  }
  return v18;
}

- (id)_glyphDescription
{
  return -[NSLayoutManager _glyphDescriptionForGlyphRange:](self, "_glyphDescriptionForGlyphRange:", 0, *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8));
}

- (id)_glyphHoleDescription
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  BOOL HasGlyphsForCharacterAtIndex;
  char v7;
  unint64_t v8;
  NSUInteger length;
  NSUInteger location;
  _BOOL4 v11;
  NSUInteger v12;
  NSUInteger v13;
  const __CFString *v14;
  NSString *v15;
  NSUInteger v16;
  NSUInteger v17;
  NSRange v18;
  NSUInteger v19;
  NSUInteger v20;
  const __CFString *v21;
  NSString *v22;
  NSRange v24;
  objc_super v25;
  NSRange v26;
  NSRange v27;
  NSRange v28;
  NSRange v29;
  NSRange v30;

  v3 = -[NSTextStorage length](self->_textStorage, "length");
  v4 = *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8);
  v25.receiver = self;
  v25.super_class = (Class)NSLayoutManager;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@\n    Currently holding %lu characters and %lu glyphs\n"), -[NSLayoutManager description](&v25, sel_description), v3, v4);
  v24.location = 0;
  v24.length = 0;
  HasGlyphsForCharacterAtIndex = _NSGlyphTreeHasGlyphsForCharacterAtIndex((uint64_t)self, 0, 0);
  if (v3)
  {
    v7 = HasGlyphsForCharacterAtIndex;
    v8 = 0;
    length = 0;
    location = 0;
    do
    {
      v11 = _NSGlyphTreeHasGlyphsForCharacterAtIndex((uint64_t)self, v8, (uint64_t *)&v24);
      if ((v7 & 1) == v11)
      {
        v30.location = location;
        v30.length = length;
        v18 = NSUnionRange(v24, v30);
        location = v18.location;
        length = v18.length;
        v16 = v24.location;
        v17 = v24.length;
      }
      else
      {
        v12 = _NSGlyphTreeGlyphIndexForCharacterAtIndex((uint64_t)self, location);
        v13 = _NSGlyphTreeGlyphIndexForCharacterAtIndex((uint64_t)self, length + location) - v12;
        if ((v7 & 1) != 0)
          v14 = CFSTR("has glyphs");
        else
          v14 = CFSTR("no glyphs ");
        v26.location = location;
        v26.length = length;
        v15 = NSStringFromRange(v26);
        v27.location = v12;
        v27.length = v13;
        objc_msgSend(v5, "appendFormat:", CFSTR("    %@ char range %@ glyph range %@\n"), v14, v15, NSStringFromRange(v27));
        v16 = v24.location;
        v17 = v24.length;
        location = v24.location;
        length = v24.length;
        v7 = v11;
      }
      v8 = v17 + v16;
      if (v17 + v16 == v3)
      {
        v19 = _NSGlyphTreeGlyphIndexForCharacterAtIndex((uint64_t)self, location);
        v20 = _NSGlyphTreeGlyphIndexForCharacterAtIndex((uint64_t)self, length + location) - v19;
        if (v11)
          v21 = CFSTR("has glyphs");
        else
          v21 = CFSTR("no glyphs ");
        v28.location = location;
        v28.length = length;
        v22 = NSStringFromRange(v28);
        v29.location = v19;
        v29.length = v20;
        objc_msgSend(v5, "appendFormat:", CFSTR("    %@ char range %@ glyph range %@\n"), v21, v22, NSStringFromRange(v29));
        v8 = v24.length + v24.location;
      }
    }
    while (v8 < v3);
  }
  return v5;
}

- (id)_layoutHoleDescription
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  BOOL HasFragmentsForGlyphAtIndex;
  char v7;
  unint64_t v8;
  NSUInteger length;
  NSUInteger location;
  _BOOL4 v11;
  NSUInteger v12;
  NSRange v13;
  const __CFString *v14;
  NSString *v15;
  NSUInteger v16;
  NSUInteger v17;
  NSRange v18;
  NSUInteger v19;
  NSRange v20;
  const __CFString *v21;
  NSString *v22;
  NSRange v24;
  objc_super v25;
  NSRange v26;
  NSRange v27;
  NSRange v28;

  v3 = -[NSTextStorage length](self->_textStorage, "length");
  v4 = *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8);
  v25.receiver = self;
  v25.super_class = (Class)NSLayoutManager;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@\n    Currently holding %lu characters and %lu glyphs\n"), -[NSLayoutManager description](&v25, sel_description), v3, v4);
  v24.location = 0;
  v24.length = 0;
  HasFragmentsForGlyphAtIndex = _NSLayoutTreeHasFragmentsForGlyphAtIndex((uint64_t)self, 0, 0);
  if (v4)
  {
    v7 = HasFragmentsForGlyphAtIndex;
    v8 = 0;
    length = 0;
    location = 0;
    do
    {
      v11 = _NSLayoutTreeHasFragmentsForGlyphAtIndex((uint64_t)self, v8, (uint64_t *)&v24);
      if ((v7 & 1) == v11)
      {
        v28.location = location;
        v28.length = length;
        v18 = NSUnionRange(v24, v28);
        location = v18.location;
        length = v18.length;
        v16 = v24.location;
        v17 = v24.length;
      }
      else
      {
        v12 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, location);
        v13.length = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, length + location) - v12;
        if ((v7 & 1) != 0)
          v14 = CFSTR("laid out");
        else
          v14 = CFSTR("not laid");
        v13.location = v12;
        v15 = NSStringFromRange(v13);
        v26.location = location;
        v26.length = length;
        objc_msgSend(v5, "appendFormat:", CFSTR("    %@ char range %@ glyph range %@\n"), v14, v15, NSStringFromRange(v26));
        v16 = v24.location;
        v17 = v24.length;
        location = v24.location;
        length = v24.length;
        v7 = v11;
      }
      v8 = v17 + v16;
      if (v17 + v16 == v4)
      {
        v19 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, location);
        v20.length = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, length + location) - v19;
        if (v11)
          v21 = CFSTR("laid out");
        else
          v21 = CFSTR("not laid");
        v20.location = v19;
        v22 = NSStringFromRange(v20);
        v27.location = location;
        v27.length = length;
        objc_msgSend(v5, "appendFormat:", CFSTR("    %@ char range %@ glyph range %@\n"), v21, v22, NSStringFromRange(v27));
        v8 = v24.length + v24.location;
      }
    }
    while (v8 < v4);
  }
  return v5;
}

- (id)_blockDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSString *v13;
  NSString *v14;
  uint64_t v15;
  NSString *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  NSLayoutManager *v23;
  uint64_t v24;
  NSRange v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)NSLayoutManager;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", -[NSLayoutManager description](&v26, sel_description));
  v23 = self;
  v4 = (void *)*((_QWORD *)self->_extraData + 23);
  if (v4)
  {
    v5 = objc_msgSend(v4, "count");
    objc_msgSend(v3, "appendFormat:", CFSTR(" has %lu runs\n"), v5);
    if (v5)
    {
      v6 = 0;
      v22 = v5;
      do
      {
        v7 = (_QWORD *)objc_msgSend(*((id *)v23->_extraData + 23), "objectAtIndex:", v6);
        v8 = objc_msgSend(v7, "count");
        v25 = (NSRange)0;
        v24 = v6;
        objc_msgSend(v3, "appendFormat:", CFSTR("run %lu, %lu elements: "), v6, v8);
        if (v8)
        {
          v9 = 0;
          while (1)
          {
            _NSBlockNumberForIndex(v7, v9, (__n128 *)&v25);
            v11 = v7[11] <= v10 ? v7[4] - v7[3] : 0;
            v12 = *(_QWORD *)(v7[7] + (v7[2] + 8) * (v11 + v10) + 8);
            v13 = NSStringFromRange(v25);
            v14 = v13;
            if (v12)
            {
              v15 = *(_QWORD *)(v12 + 8);
              v16 = NSStringFromRect(*(NSRect *)(v12 + 16));
              objc_msgSend(v3, "appendFormat:", CFSTR("%@ block %p helper %p lr %@ br %@"), v14, v15, v12, v16, NSStringFromRect(*(NSRect *)(v12 + 48)));
            }
            else
            {
              objc_msgSend(v3, "appendFormat:", CFSTR("%@ empty"), v13, v18, v19, v20, v21);
            }
            v9 = v25.length + v25.location;
            if (v25.length + v25.location >= v8)
              break;
            objc_msgSend(v3, "appendString:", CFSTR("; "));
          }
        }
        v6 = v24 + 1;
        if (v24 + 1 < v22)
          objc_msgSend(v3, "appendString:", CFSTR("\n"));
      }
      while (v6 != v22);
    }
  }
  return v3;
}

- (void)_resizeTextViewForTextContainer:(id)a3
{
  CFDictionaryRef *extraData;
  char *v6;
  uint64_t v7;
  uint64_t ValueAtIndex;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
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
  uint64_t v27;
  uint64_t v28;
  int v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  char v37;
  double v38;
  double v39;
  double width;
  double height;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double x;
  double y;
  double v55;
  double v56;
  BOOL v57;
  uint64_t v58;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  uint64_t v72;
  double v74;
  double v75;
  double v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  CGFloat v103;
  CGFloat v104;
  CGFloat bRect;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double aRect;
  void *value[2];
  NSSize v114;
  NSSize v115;
  NSRect v116;
  NSRect v117;
  NSRect v118;
  NSRect v119;
  NSRect v120;
  NSRect v121;
  NSRect v122;
  NSRect v123;
  NSRect v124;
  NSRect v125;
  NSRect v126;

  value[0] = 0;
  extraData = (CFDictionaryRef *)self->_extraData;
  if (extraData[10] == a3)
  {
    v6 = 0;
  }
  else
  {
    if (!CFDictionaryGetValueIfPresent(extraData[11], a3, (const void **)value))
      return;
    v6 = (char *)value[0];
    if (value[0] == (void *)0x7FFFFFFFFFFFFFFFLL)
      return;
  }
  v7 = objc_msgSend(a3, "textView");
  if (!v7)
    return;
  if (self->_textViewResizeDisableStack
    || (v9 = (void *)v7, -[NSLayoutManager hasNonContiguousLayout](self, "hasNonContiguousLayout"))
    && -[NSLayoutManager isScrolling](self, "isScrolling"))
  {
    ValueAtIndex = CFStorageGetValueAtIndex();
    *(_DWORD *)(ValueAtIndex + 64) |= 2u;
    return;
  }
  v10 = objc_msgSend(v9, "superview");
  objc_msgSend(v9, "frame");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v9, "layoutOrientation");
  objc_msgSend(v9, "textContainerOrigin");
  v16 = v15;
  v18 = v17;
  objc_msgSend(a3, "textContainerInsetsForView:", v9);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v27 = CFStorageGetValueAtIndex();
  v28 = v27;
  v29 = *(_DWORD *)(v27 + 64);
  if ((v29 & 1) != 0)
  {
    *(_DWORD *)(v27 + 64) = v29 | 2;
    return;
  }
  v110 = v18;
  *(_DWORD *)(v27 + 64) = v29 & 0xFFFFFFFD;
  *(_OWORD *)value = *(_OWORD *)v27;
  v30 = *(double *)(v27 + 16);
  v106 = *(double *)(v27 + 32);
  v107 = v16;
  v109 = *(double *)(v27 + 40);
  v111 = *(double *)(v27 + 48);
  aRect = *(double *)(v27 + 56);
  v31 = v22 + v26;
  v32 = *(double *)(v27 + 24);
  objc_msgSend(v9, "convertSize:toView:", v10, v31 + v30, v20 + v24 + v32);
  v34 = v33;
  v36 = v35;
  v108 = v32;
  if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0 || (*(_BYTE *)(*((_QWORD *)self->_extraData + 30) + 56) & 1) == 0)
    goto LABEL_15;
  if ((unint64_t)v6 >= -[NSMutableArray count](self->_textContainers, "count") - 1)
  {
    if ((*(_BYTE *)&self->_lmFlags & 1) != 0)
      goto LABEL_15;
  }
  else if (-[NSLayoutManager _indexOfFirstGlyphInTextContainer:okToFillHoles:](self, "_indexOfFirstGlyphInTextContainer:okToFillHoles:", -[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", v6 + 1), 0) != 0x7FFFFFFFFFFFFFFFLL)
  {
    goto LABEL_15;
  }
  if (v34 >= v12)
    v38 = v34;
  else
    v38 = v12;
  if (v36 >= v14)
    v39 = v36;
  else
    v39 = v14;
  if (v36 < v14 || v34 < v12)
  {
    v37 = 1;
    goto LABEL_16;
  }
  v34 = v38;
LABEL_15:
  v37 = 0;
  *(_OWORD *)(v28 + 32) = *(_OWORD *)value;
  *(double *)(v28 + 48) = v30;
  *(double *)(v28 + 56) = v32;
  v38 = v34;
  v39 = v36;
LABEL_16:
  objc_msgSend(v9, "setConstrainedFrameSize:", v38, v39);
  objc_msgSend(v9, "frame");
  width = v115.width;
  height = v115.height;
  v114.width = v12;
  v114.height = v14;
  if (!NSEqualSizes(v114, v115) && v10)
  {
    objc_msgSend(v9, "visibleRect");
    v46 = v44;
    v47 = v45;
    if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
    {
      if (v14 != height)
      {
        v65 = v42;
        v66 = v43;
        if (NSIsEmptyRect(*(NSRect *)&v42))
          goto LABEL_49;
        v67 = v9;
        v68 = v65;
        v69 = v66;
        v70 = v46;
        v71 = v47;
        v72 = 1;
LABEL_48:
        objc_msgSend(v67, "setNeedsDisplayInRect:avoidAdditionalLayout:", v72, v68, v69, v70, v71);
        goto LABEL_49;
      }
      if (width <= v12)
        goto LABEL_49;
      v74 = v42;
      v75 = v43;
      objc_msgSend(v9, "frame");
      objc_msgSend(v9, "convertRect:fromView:", v10, v12 + v76);
      v62 = v74;
      v63 = v75;
      v64 = v46;
    }
    else
    {
      v103 = v42;
      v104 = v43;
      bRect = v44;
      objc_msgSend(v9, "frame");
      v52 = v48;
      if (height > v14)
      {
        v101 = v51;
        v102 = v49;
        v99 = v48;
        v100 = v50;
        objc_msgSend(v9, "convertRect:fromView:", v10, v48, v14 + v49, v50, v51 - v14);
        v124.origin.x = v103;
        v124.origin.y = v104;
        v124.size.width = bRect;
        v124.size.height = v47;
        v117 = NSIntersectionRect(v116, v124);
        x = v117.origin.x;
        y = v117.origin.y;
        v55 = v117.size.width;
        v56 = v117.size.height;
        v57 = NSIsEmptyRect(v117);
        v52 = v99;
        v50 = v100;
        v51 = v101;
        v49 = v102;
        if (!v57)
        {
          objc_msgSend(v9, "setNeedsDisplayInRect:avoidAdditionalLayout:", 1, x, y, v55, v56, v99);
          v52 = v99;
          v50 = v100;
          v51 = v101;
          v49 = v102;
        }
      }
      if (width <= v12)
        goto LABEL_49;
      objc_msgSend(v9, "convertRect:fromView:", v10, v12 + v52, v49, v50 - v12, v51);
      v62 = v103;
      v63 = v104;
      v64 = bRect;
    }
    v77 = v47;
    v118 = NSIntersectionRect(*(NSRect *)&v58, *(NSRect *)&v62);
    v78 = v118.origin.x;
    v79 = v118.origin.y;
    v80 = v118.size.width;
    v81 = v118.size.height;
    if (NSIsEmptyRect(v118))
      goto LABEL_49;
    v67 = v9;
    v68 = v78;
    v69 = v79;
    v70 = v80;
    v71 = v81;
    v72 = 0;
    goto LABEL_48;
  }
LABEL_49:
  if ((v37 & 1) == 0)
  {
    objc_msgSend(v9, "visibleRect");
    v84 = v83;
    v86 = v85;
    v87 = v82;
    v89 = v88;
    if (v30 >= v111)
    {
      v94 = aRect;
      v93 = aRect;
      v91 = v109;
    }
    else
    {
      v119.origin.x = v107 + v30 + v106;
      v119.origin.y = v110 + v109;
      v119.size.width = v84 + v82 - v119.origin.x;
      v119.size.height = aRect;
      v125.origin.x = v84;
      v125.origin.y = v86;
      v125.size.width = v87;
      v125.size.height = v89;
      v120 = NSIntersectionRect(v119, v125);
      v90 = v120.origin.x;
      v91 = v120.origin.y;
      v92 = v120.size.width;
      v93 = v120.size.height;
      if (!NSIsEmptyRect(v120))
        objc_msgSend(v9, "setNeedsDisplayInRect:avoidAdditionalLayout:", 1, v90, v91, v92, v93);
      v94 = aRect;
    }
    if (v108 < v94)
    {
      v121.origin.y = v110 + v108 + v91;
      v121.size.height = v93 - v108;
      v121.origin.x = v84;
      v121.size.width = v87;
      v126.origin.x = v84;
      v126.origin.y = v86;
      v126.size.width = v87;
      v126.size.height = v89;
      v122 = NSIntersectionRect(v121, v126);
      v95 = v122.origin.x;
      v96 = v122.origin.y;
      v97 = v122.size.width;
      v98 = v122.size.height;
      if (!NSIsEmptyRect(v122))
        objc_msgSend(v9, "setNeedsDisplayInRect:avoidAdditionalLayout:", 1, v95, v96, v97, v98);
    }
    if (v111 < 0.0 && aRect < 0.0)
    {
      v123.origin.x = v84;
      v123.origin.y = v86;
      v123.size.width = v87;
      v123.size.height = v89;
      if (!NSIsEmptyRect(v123))
        objc_msgSend(v9, "setNeedsDisplayInRect:avoidAdditionalLayout:", 1, v84, v86, v87, v89);
    }
  }
}

- (id)_selectedRanges
{
  return 0;
}

- (void)_growCachedRectArrayToSize:(unint64_t)a3
{
  unint64_t cachedRectArrayCapacity;
  CGRect *cachedRectArray;
  CGRect *v6;

  cachedRectArrayCapacity = self->_cachedRectArrayCapacity;
  if (cachedRectArrayCapacity < a3)
  {
    cachedRectArray = self->_cachedRectArray;
    if (cachedRectArray)
    {
      self->_cachedRectArrayCapacity = 2 * cachedRectArrayCapacity;
      v6 = (CGRect *)NSReallocateCollectable(cachedRectArray, cachedRectArrayCapacity << 6, 0);
    }
    else
    {
      self->_cachedRectArrayCapacity = 3;
      v6 = (CGRect *)NSAllocateCollectable(0x60uLL, 0);
    }
    self->_cachedRectArray = v6;
  }
}

- (CGRect)_rectArrayForRange:(_NSRange)a3 withinSelectionRange:(_NSRange)a4 rangeIsCharRange:(BOOL)a5 singleRectOnly:(BOOL)a6 fullLineRectsOnly:(BOOL)a7 inTextContainer:(id)a8 rectCount:(unint64_t *)a9 rangeWithinContainer:(_NSRange *)a10 glyphsDrawOutsideLines:(BOOL *)a11 rectArray:(CGRect *)a12 rectArrayCapacity:(unint64_t)a13
{
  NSUInteger location;
  NSUInteger v14;
  NSLayoutManager *v15;
  unint64_t *v16;
  _BOOL4 v18;
  uint64_t v19;
  _QWORD *extraData;
  void *v21;
  CGRect *result;
  unint64_t v23;
  unint64_t firstUnlaidGlyphIndex;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  CFDictionaryRef v28;
  unint64_t v29;
  CFDictionaryRef *v30;
  int ValueIfPresent;
  uint64_t v32;
  NSUInteger v33;
  unint64_t v34;
  int v35;
  char v36;
  unint64_t v38;
  unint64_t v39;
  NSUInteger v40;
  CGRect *cachedRectArray;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  NSUInteger v49;
  NSRunStorage *containerRuns;
  unint64_t v51;
  unint64_t v52;
  CFDictionaryRef v53;
  unint64_t v54;
  unint64_t v55;
  _BOOL4 v56;
  CGRect *v57;
  NSUInteger v58;
  CFDictionaryRef *v59;
  int v60;
  unint64_t v61;
  NSUInteger v62;
  NSUInteger v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  uint64_t v70;
  NSUInteger v71;
  NSUInteger v72;
  NSUInteger v73;
  NSUInteger v74;
  NSUInteger v75;
  NSUInteger v76;
  NSRange v77;
  CGRect *v78;
  NSUInteger v79;
  NSRange v80;
  NSUInteger v81;
  NSUInteger v82;
  unint64_t v83;
  int v84;
  unint64_t v86;
  double v87;
  _BOOL4 v88;
  int v89;
  uint64_t v90;
  NSUInteger v91;
  int v92;
  double v93;
  double v94;
  double v95;
  int v96;
  CGRect *v97;
  unint64_t v98;
  int v99;
  unint64_t v100;
  NSUInteger v101;
  NSUInteger v102;
  double v103;
  double v104;
  _BOOL4 v106;
  int v107;
  BOOL v108;
  unint64_t v109;
  int v110;
  unint64_t v111;
  BOOL v112;
  double v113;
  char v114;
  unint64_t v115;
  NSInsertionPointHelper *v116;
  NSRange v117;
  NSRange v118;
  NSUInteger v119;
  NSRange v120;
  double *logicalPositions;
  double *logicalLeftBoundaries;
  unint64_t *logicalCharIndexes;
  double *logicalAltPositions;
  unint64_t *logicalAltCharIndexes;
  unint64_t altCount;
  unint64_t count;
  unint64_t v128;
  unint64_t v129;
  int v131;
  double v132;
  uint64_t v133;
  NSRange v134;
  uint64_t v135;
  CGRect *v136;
  uint64_t i;
  NSRange v138;
  unint64_t v139;
  double v140;
  double v142;
  int v143;
  uint64_t v144;
  NSRange v145;
  uint64_t v146;
  uint64_t j;
  NSRange v148;
  unint64_t v149;
  double v150;
  uint64_t v152;
  double v153;
  CGRect *v154;
  double y;
  double x;
  double height;
  double width;
  double v160;
  double v162;
  double v163;
  double v164;
  unint64_t v166;
  double v167;
  void *v168;
  unint64_t v170;
  CGRect *v171;
  CGFloat v172;
  CGFloat v173;
  CGFloat v174;
  CGRect *v175;
  NSUInteger v176;
  unint64_t v177;
  void *v178;
  CGRect *v179;
  char v180;
  NSUInteger v181;
  NSUInteger v182;
  uint64_t v183;
  NSUInteger v184;
  unint64_t v185;
  unint64_t v186;
  double v187;
  unint64_t v188;
  double v189;
  int v190;
  BOOL *v191;
  void *v192;
  double v193;
  void *v194;
  void *v195;
  double v196;
  CGFloat v197;
  unint64_t v198;
  double v199;
  double v200;
  double v201;
  void *v202;
  unint64_t v203;
  double v204;
  double v205;
  void *v206;
  double v207;
  double v208;
  double v209;
  unint64_t v210;
  NSInsertionPointHelper *v211;
  _BOOL4 v212;
  unint64_t v213;
  uint64_t v214;
  double *v215;
  unint64_t *v216;
  unint64_t v217;
  uint64_t v218;
  double v219;
  double *v220;
  unint64_t *v221;
  uint64_t v222;
  uint64_t v223;
  unint64_t v224;
  CGRect *v225;
  CGFloat *p_x;
  unint64_t v227;
  void *v228;
  unint64_t v229;
  CGRect *v230;
  CGRect *v231;
  __lmFlags lmFlags;
  _NSRange *v233;
  NSUInteger v234;
  NSUInteger length;
  unint64_t v236;
  int v237;
  unint64_t __n;
  BOOL v239;
  _BOOL4 v240;
  double v241;
  NSUInteger v242;
  int v243;
  void *v244;
  double v245;
  double v246;
  NSUInteger v247;
  NSUInteger v248;
  NSUInteger v249;
  double v250;
  uint64_t range1;
  _BOOL4 v252;
  NSLayoutManager *v253;
  double v254;
  double v255;
  CGRect *v256;
  _BOOL4 v257;
  double v258;
  double v259;
  void *v260;
  double v261;
  double v262;
  BOOL v263;
  double v264;
  _BOOL4 v265;
  double v266;
  double *logicalRightBoundaries;
  NSUInteger v268;
  NSUInteger v269;
  double v270;
  uint64_t v271;
  NSRange v272;
  unint64_t v273;
  void *value[2];
  __int128 v275;
  NSRange v276;
  NSRange v277;
  NSRange v278;
  NSRange v279;
  NSRange v280;
  NSRect v281;
  NSRect v282;

  v265 = a6;
  v252 = a5;
  length = a4.length;
  location = a4.location;
  range1 = a3.length;
  v14 = a3.location;
  v15 = self;
  v16 = a9;
  v273 = 0;
  v18 = (*(_DWORD *)&self->_lmFlags & 0x20) == 0 && a12 == 0;
  v257 = v18;
  v272.location = 0;
  v272.length = 0;
  v19 = -[NSTextStorage string](self->_textStorage, "string");
  extraData = v15->_extraData;
  if (!extraData[26] || !extraData[30])
  {
    *a9 = 0;
    result = 0;
    if (a11)
      *a11 = 0;
    return result;
  }
  v21 = (void *)v19;
  if ((*(_BYTE *)&v15->_lmFlags & 0x40) == 0)
    ++v15->_displayInvalidationDisableStack;
  if (v257)
  {
    v244 = 0;
    *(_DWORD *)&v15->_lmFlags |= 0x20u;
  }
  else if (a12)
  {
    v244 = 0;
  }
  else
  {
    v244 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  }
  v23 = v14;
  if (v252)
    v23 = -[NSLayoutManager _primitiveGlyphRangeForCharacterRange:](v15, "_primitiveGlyphRangeForCharacterRange:", v14, range1);
  if ((*((_BYTE *)&v15->_lmFlags + 3) & 0x40) != 0)
  {
    firstUnlaidGlyphIndex = *(_QWORD *)(*((_QWORD *)v15->_extraData + 26) + 8);
  }
  else if (v15->_firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL
         || (firstUnlaidGlyphIndex = v15->_firstUnlaidGlyphIndex, firstUnlaidGlyphIndex == 0x7FFFFFFFFFFFFFFFLL))
  {
    -[NSLayoutManager getFirstUnlaidCharacterIndex:glyphIndex:](v15, "getFirstUnlaidCharacterIndex:glyphIndex:", 0, &v273);
    firstUnlaidGlyphIndex = v273;
    goto LABEL_26;
  }
  v273 = firstUnlaidGlyphIndex;
LABEL_26:
  v25 = -[NSLayoutManager _indexOfFirstGlyphInTextContainer:okToFillHoles:](v15, "_indexOfFirstGlyphInTextContainer:okToFillHoles:", a8, 0);
  if (v25 == 0x7FFFFFFFFFFFFFFFLL)
    v26 = firstUnlaidGlyphIndex;
  else
    v26 = v25;
  if (v23 > v26)
    v26 = v23;
  if ((*((_BYTE *)&v15->_lmFlags + 3) & 0x40) != 0)
  {
    v27 = v273;
  }
  else
  {
    v27 = v273;
    if ((*(_BYTE *)(*((_QWORD *)v15->_extraData + 30) + 56) & 1) != 0)
    {
      v28 = (CFDictionaryRef)a8;
      goto LABEL_37;
    }
  }
  v28 = (CFDictionaryRef)a8;
  if (v23 == v27)
  {
    v27 = v23;
    v26 = v23;
  }
LABEL_37:
  if (v26 >= v27)
    v29 = v27;
  else
    v29 = v26;
  value[0] = 0;
  v30 = (CFDictionaryRef *)v15->_extraData;
  if (v30[10] == v28)
  {
    v236 = 0;
  }
  else
  {
    ValueIfPresent = CFDictionaryGetValueIfPresent(v30[11], v28, (const void **)value);
    v32 = (uint64_t)value[0];
    if (!ValueIfPresent)
      v32 = 0x7FFFFFFFFFFFFFFFLL;
    v236 = v32;
  }
  *a9 = 0;
  _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)v15, v29, 1uLL);
  if (v29 >= *(_QWORD *)(*((_QWORD *)v15->_extraData + 26) + 8))
  {
    v272.location = v29;
    v272.length = 0;
    v33 = v29;
  }
  else
  {
    _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)v15, v29, (uint64_t *)&v272);
    v33 = v272.location;
  }
  v233 = a10;
  if (v33)
  {
    v34 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)v15, v33 - 1);
    if (v34 >= objc_msgSend(v21, "length"))
      goto LABEL_62;
    v35 = objc_msgSend(v21, "characterAtIndex:", v34);
    v36 = 1;
    if (v35 <= 132)
    {
      if (v35 == 10 || v35 == 12)
        goto LABEL_67;
      if (v35 == 13)
      {
        v38 = v34 + 1;
        if (v38 >= objc_msgSend(v21, "length") || objc_msgSend(v21, "characterAtIndex:", v38) != 10)
          goto LABEL_67;
      }
LABEL_62:
      if (v272.location == v29
        && -[NSLayoutManager applicationFrameworkContext](v15, "applicationFrameworkContext") == 2
        && objc_msgSend(v15->_firstTextView, "selectionAffinity") == 1)
      {
        v39 = v29 - 1;
        _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)v15, v39, 1uLL);
        _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)v15, v39, (uint64_t *)&v272);
      }
      v36 = 0;
      goto LABEL_67;
    }
    if ((v35 - 8232) >= 2 && v35 != 133)
      goto LABEL_62;
  }
  else
  {
    v36 = 1;
  }
LABEL_67:
  v40 = v272.location;
  if (v272.location >= *(_QWORD *)(*((_QWORD *)v15->_extraData + 26) + 8))
  {
    LOBYTE(v237) = 0;
    v180 = 0;
    cachedRectArray = a12;
    goto LABEL_394;
  }
  v234 = location;
  v239 = 0;
  v243 = 0;
  v237 = 0;
  __n = 32 * a13;
  cachedRectArray = a12;
  v253 = v15;
  v260 = v21;
  while (1)
  {
    v42 = v40;
    if (v252)
      v42 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)v15, v40);
    v43 = range1;
    if (range1 || (v36 & 1) == 0 && (v44 = objc_msgSend(v15->_firstTextView, "selectionAffinity"), v43 = 0, v44))
    {
      if (v42 >= v43 + v14)
        goto LABEL_385;
    }
    else if (v42 > v14)
    {
      v180 = 0;
      range1 = 0;
      goto LABEL_394;
    }
    if ((*((_BYTE *)&v15->_lmFlags + 3) & 0x40) == 0)
      _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)v15, v40, 1uLL);
    v45 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)v15, v40, (uint64_t *)&v272);
    v264 = v46;
    v258 = v48;
    v259 = v47;
    v49 = v272.location;
    if ((*((_BYTE *)&v15->_lmFlags + 3) & 0x40) != 0)
    {
      v53 = (CFDictionaryRef)-[NSMutableArray objectAtIndex:](v15->_textContainers, "objectAtIndex:", 0);
    }
    else if (-[NSRunStorage count](v15->_containerRuns, "count") <= v49)
    {
      v53 = 0;
    }
    else
    {
      containerRuns = v15->_containerRuns;
      _NSBlockNumberForIndex(containerRuns, v49, 0);
      v52 = 0;
      if (containerRuns->_gapBlockIndex <= v51)
        v52 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
      v53 = *(CFDictionaryRef *)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v52 + v51)];
    }
    v54 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)v15, v49);
    v55 = v54;
    if (!(v243 & 1 | (v53 != a8)))
    {
      if (v252)
      {
        if (v54 > v14)
        {
          range1 = range1 + v14 - v54;
          v243 = 1;
          v14 = v54;
          goto LABEL_93;
        }
      }
      else if (v49 > v14)
      {
        range1 = range1 + v14 - v49;
        v243 = 1;
        v14 = v49;
        goto LABEL_93;
      }
      v243 = 1;
    }
LABEL_93:
    if (v239)
    {
      v56 = 1;
    }
    else
    {
      v57 = cachedRectArray;
      v58 = v14;
      if (v252)
        v58 = -[NSLayoutManager _primitiveGlyphRangeForCharacterRange:](v15, "_primitiveGlyphRangeForCharacterRange:", v14, range1);
      v56 = v36 & 1 | (range1 != 0) || objc_msgSend(v15->_firstTextView, "selectionAffinity") != 1
          ? v58 < v272.length + v272.location
          : v58 <= v272.length + v272.location;
      cachedRectArray = v57;
    }
    value[0] = 0;
    v59 = (CFDictionaryRef *)v15->_extraData;
    if (v59[10] != v53)
    {
      v60 = CFDictionaryGetValueIfPresent(v59[11], v53, (const void **)value);
      v61 = (unint64_t)value[0];
      if (!v60)
        v61 = 0x7FFFFFFFFFFFFFFFLL;
      if (v61 > v236)
        break;
    }
    v239 = v56;
    if ((v243 & v56) != 1)
      goto LABEL_131;
    v62 = v272.location;
    v63 = v272.length;
    objc_msgSend(a8, "lineFragmentPadding");
    v65 = v64;
    v66 = _NSLayoutTreeLineFragmentUsedRectForGlyphAtIndex((uint64_t)v15, v272.location, 0);
    v250 = v67;
    v69 = v68;
    if (v252)
    {
      v70 = -[NSLayoutManager _primitiveGlyphRangeForCharacterRange:](v15, "_primitiveGlyphRangeForCharacterRange:", v14, range1, v66);
      v72 = v70;
      v73 = v71;
      if (v234 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v269 = v71;
        v249 = v70;
      }
      else
      {
        v249 = -[NSLayoutManager _primitiveGlyphRangeForCharacterRange:](v15, "_primitiveGlyphRangeForCharacterRange:", v234, length);
        v269 = v76;
      }
    }
    else
    {
      v73 = range1;
      v74 = length;
      if (v234 == 0x7FFFFFFFFFFFFFFFLL)
        v74 = range1;
      v269 = v74;
      if (v234 == 0x7FFFFFFFFFFFFFFFLL)
        v75 = v14;
      else
        v75 = v234;
      v249 = v75;
      v72 = v14;
    }
    v77 = v272;
    v78 = cachedRectArray;
    if (v72 == v272.length + v272.location)
    {
      v79 = 0;
    }
    else
    {
      v276.location = v72;
      v276.length = v73;
      v80 = NSIntersectionRange(v276, v77);
      v72 = v80.location;
      v79 = v80.length;
      v77.location = v272.location;
    }
    v81 = v63 + v62;
    if ((*((_BYTE *)&v15->_lmFlags + 3) & 2) != 0)
    {
      v21 = v260;
      if (v79 && v81 > v77.location)
      {
        do
        {
          v82 = v81 - 1;
          if ((-[NSLayoutManager propertyForGlyphAtIndex:](v15, "propertyForGlyphAtIndex:", v81 - 1, v233) & 4) == 0)
            break;
          --v81;
        }
        while (v82 > v272.location);
      }
    }
    else
    {
      v21 = v260;
    }
    v242 = v81;
    if (v72 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v247 = v249 + v269;
      v246 = v250 + v69;
      v87 = v45 + v65 + v259 + v65 * -2.0;
      v245 = v87;
      if (v87 < v45 + v65)
        v87 = v45 + v65;
      v254 = v45 + v65;
      v255 = v45;
      v241 = v87 - (v45 + v65);
      v88 = v252;
      if (!range1)
        v88 = 0;
      v240 = v88;
      v248 = v14;
      cachedRectArray = v78;
      while (1)
      {
        if ((*((_BYTE *)&v15->_lmFlags + 3) & 2) == 0)
        {
          v89 = 0;
LABEL_154:
          v90 = v79;
          goto LABEL_155;
        }
        v89 = 0;
        if (a7)
          goto LABEL_154;
        v90 = v79;
        if (v272.length)
        {
          v96 = -[NSLayoutManager intAttribute:forGlyphAtIndex:](v15, "intAttribute:forGlyphAtIndex:", 2, v72 - (v72 >= v272.length + v272.location));
          v89 = v96 & 1;
          if (!v79)
          {
            v90 = 0;
            v14 = v248;
            goto LABEL_155;
          }
          v90 = v79;
          if (v72 + 1 < v72 + v79)
          {
            v97 = cachedRectArray;
            v90 = 1;
            do
            {
              if (((-[NSLayoutManager intAttribute:forGlyphAtIndex:](v15, "intAttribute:forGlyphAtIndex:", 2, v72 + v90, v233)- v96) & 1) != 0)
              {
                if (v72 + v90 + 1 != v272.length + v272.location)
                  goto LABEL_175;
                v98 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)v15, v72 + v90);
                v99 = objc_msgSend(v21, "characterAtIndex:", v98);
                if (v99 > 132)
                {
                  if ((v99 - 8232) >= 2 && v99 != 133)
                    goto LABEL_175;
                }
                else if (v99 != 10 && v99 != 12)
                {
                  if (v99 != 13)
                    goto LABEL_175;
                  v100 = v98 + 1;
                  if (v100 < objc_msgSend(v21, "length")
                    && objc_msgSend(v21, "characterAtIndex:", v100) == 10)
                  {
                    goto LABEL_175;
                  }
                }
              }
              ++v90;
            }
            while (v79 != v90);
            v90 = v79;
LABEL_175:
            cachedRectArray = v97;
          }
          if (v72 <= v272.location)
          {
            v101 = v90 + v72;
            v112 = v90 + v72 < v272.length + v272.location && v242 > v72;
            v14 = v248;
            if (!v112)
              goto LABEL_155;
          }
          else
          {
            v14 = v248;
            if (v242 <= v72)
              goto LABEL_155;
            v101 = v90 + v72;
          }
          if (v101 > v242)
            v90 = v242 - v72;
        }
LABEL_155:
        v91 = v90 + v72;
        v268 = v90 + v72;
        if (a7)
        {
          v92 = 1;
          v93 = v45;
          v94 = v264;
          v262 = v264;
          v95 = v259;
          v266 = v259;
          v261 = v258;
          v270 = v258;
          goto LABEL_341;
        }
        v102 = v272.length + v272.location;
        if (v272.location <= v249)
          v103 = v250;
        else
          v103 = v264;
        if (v102 >= v247)
          v104 = v246;
        else
          v104 = v264 + v258;
        v106 = v72 > v272.location || v72 == v249;
        v256 = cachedRectArray;
        if (v91 != v247 && v91 >= v102)
        {
LABEL_193:
          v107 = 0;
          goto LABEL_218;
        }
        v108 = v91 != v102 || v102 == 0;
        if (v108 || !-[NSTextStorage length](v15->_textStorage, "length"))
          goto LABEL_217;
        v109 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)v15, v272.location + v272.length - 1);
        v110 = objc_msgSend(v260, "characterAtIndex:", v109);
        v107 = 0;
        if (v110 > 132)
        {
          if ((v110 - 8232) < 2 || v110 == 133)
            goto LABEL_218;
LABEL_217:
          v107 = 1;
          goto LABEL_218;
        }
        if (v110 == 10 || v110 == 12)
          goto LABEL_218;
        if (v110 != 13)
          goto LABEL_217;
        v111 = v109 + 1;
        if (v111 < objc_msgSend(v260, "length"))
        {
          v14 = v248;
          if (objc_msgSend(v260, "characterAtIndex:", v111) != 10)
            goto LABEL_193;
          goto LABEL_217;
        }
        v107 = 0;
        v14 = v248;
LABEL_218:
        v113 = v104 - v103;
        if (v89)
          v114 = v107;
        else
          v114 = v106;
        if (!v89)
          v106 = v107;
        v270 = v113;
        if ((v114 & 1) == 0 && !v106)
        {
          v94 = v103;
          v92 = 1;
          v93 = v254;
          v262 = v264;
          v266 = v259;
          v261 = v258;
          v95 = v241;
          v15 = v253;
          v21 = v260;
          cachedRectArray = v256;
          goto LABEL_341;
        }
        v115 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)v253, v272.location);
        v116 = _insertionPointHelperForCharacterAtIndex((uint64_t)v253, v115);
        v117.location = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](v253, "characterRangeForGlyphRange:actualGlyphRange:", v72, v90, 0);
        v118.location = v14;
        if (v252)
        {
          v119 = 0;
        }
        else
        {
          v14 = v117.location;
          v119 = v118.length;
        }
        if (v240)
        {
          v117.length = v118.length;
          v118.length = range1;
          v120 = NSIntersectionRange(v118, v117);
          v14 = v120.location;
          v119 = v120.length;
        }
        v263 = v106;
        if (v116)
        {
          logicalPositions = v116->_logicalPositions;
          logicalLeftBoundaries = v116->_logicalLeftBoundaries;
          logicalCharIndexes = v116->_logicalCharIndexes;
          logicalRightBoundaries = v116->_logicalRightBoundaries;
          logicalAltPositions = v116->_logicalAltPositions;
          logicalAltCharIndexes = v116->_logicalAltCharIndexes;
          count = v116->_count;
          altCount = v116->_altCount;
        }
        else
        {
          logicalPositions = 0;
          logicalAltPositions = 0;
          logicalLeftBoundaries = 0;
          logicalRightBoundaries = 0;
          logicalCharIndexes = 0;
          logicalAltCharIndexes = 0;
          count = 0;
          altCount = 0;
        }
        cachedRectArray = v256;
        if (v119)
        {
          if ((v114 & 1) != 0)
          {
            v93 = v245;
            if (!count)
              goto LABEL_285;
LABEL_251:
            v132 = v245;
            if (logicalLeftBoundaries)
            {
              v132 = v245;
              if (logicalCharIndexes)
              {
                v133 = 0;
                v132 = v245;
                do
                {
                  v134.location = logicalCharIndexes[v133];
                  v135 = v133 + 1;
                  if (v133 + 1 >= count)
                    v134.length = 1;
                  else
                    v134.length = logicalCharIndexes[v133 + 1] - v134.location;
                  v277.location = v14;
                  v277.length = v119;
                  if (NSIntersectionRange(v277, v134).length && v45 + logicalLeftBoundaries[v133] < v132)
                    v132 = v45 + logicalLeftBoundaries[v133];
                  ++v133;
                }
                while (count != v135);
              }
            }
            if ((v114 & 1) != 0)
            {
              v93 = v132;
              cachedRectArray = v256;
              goto LABEL_285;
            }
            v131 = *(_DWORD *)&v253->_lmFlags & 0x2000000;
            cachedRectArray = v256;
          }
          else
          {
            v131 = *(_DWORD *)&v253->_lmFlags & 0x2000000;
            if (v131)
            {
              v132 = v245;
              if (count)
                goto LABEL_251;
            }
            else
            {
              v132 = v245;
            }
          }
          v93 = v254;
          if (!v131)
            goto LABEL_285;
          v93 = v254;
          if (!count)
            goto LABEL_285;
          v93 = v254;
          if (!logicalLeftBoundaries)
            goto LABEL_285;
          v93 = v254;
          if (!logicalCharIndexes)
            goto LABEL_285;
          v136 = cachedRectArray;
          for (i = 0; ; ++i)
          {
            v138.location = logicalCharIndexes[i];
            v139 = i + 1;
            if (i + 1 < count)
              v138.length = logicalCharIndexes[i + 1] - v138.location;
            else
              v138.length = 1;
            v278.location = v14;
            v278.length = v119;
            if (NSIntersectionRange(v278, v138).length)
            {
              if (v139 >= count)
              {
                v93 = v254;
                goto LABEL_284;
              }
            }
            else
            {
              v140 = v45 + logicalLeftBoundaries[i];
              if (v140 < v132 || v139 >= count)
              {
                if (v140 >= v132)
                  v93 = v254;
                else
                  v93 = v132;
LABEL_284:
                cachedRectArray = v136;
LABEL_285:
                if (v263)
                {
                  v15 = v253;
                  if (!count)
                  {
                    v142 = v254;
                    goto LABEL_334;
                  }
LABEL_290:
                  v142 = v254;
                  if (logicalRightBoundaries)
                  {
                    v142 = v254;
                    if (logicalCharIndexes)
                    {
                      v144 = 0;
                      v142 = v254;
                      do
                      {
                        v145.location = logicalCharIndexes[v144];
                        v146 = v144 + 1;
                        if (v144 + 1 >= count)
                          v145.length = 1;
                        else
                          v145.length = logicalCharIndexes[v144 + 1] - v145.location;
                        v279.location = v14;
                        v279.length = v119;
                        if (NSIntersectionRange(v279, v145).length && v45 + logicalRightBoundaries[v144] > v142)
                          v142 = v45 + logicalRightBoundaries[v144];
                        ++v144;
                      }
                      while (count != v146);
                    }
                  }
                  if (!v263)
                  {
                    v143 = *(_DWORD *)&v15->_lmFlags & 0x2000000;
                    goto LABEL_302;
                  }
LABEL_321:
                  v16 = a9;
LABEL_335:
                  v21 = v260;
                  v14 = v248;
LABEL_336:
                  v94 = v103;
                  if (v142 >= v93)
                    v153 = v142;
                  else
                    v153 = v93;
                  v92 = 1;
                  v95 = v153 - v93;
LABEL_340:
                  v262 = v264;
                  v266 = v259;
                  v261 = v258;
                  goto LABEL_341;
                }
                v15 = v253;
                v143 = *(_DWORD *)&v253->_lmFlags & 0x2000000;
                if (v143)
                {
                  v142 = v254;
                  if (count)
                    goto LABEL_290;
LABEL_302:
                  if (v143 && count && logicalRightBoundaries && logicalCharIndexes)
                  {
                    for (j = 0; ; ++j)
                    {
                      v148.location = logicalCharIndexes[j];
                      v149 = j + 1;
                      if (j + 1 < count)
                        v148.length = logicalCharIndexes[j + 1] - v148.location;
                      else
                        v148.length = 1;
                      v280.location = v14;
                      v280.length = v119;
                      if (NSIntersectionRange(v280, v148).length)
                      {
                        if (v149 >= count)
                        {
                          v142 = v245;
                          goto LABEL_321;
                        }
                      }
                      else
                      {
                        v150 = v45 + logicalRightBoundaries[j];
                        if (v150 > v142 || v149 >= count)
                        {
                          if (v150 <= v142)
                            v142 = v245;
                          goto LABEL_321;
                        }
                      }
                    }
                  }
                }
                v142 = v245;
LABEL_334:
                v16 = a9;
                goto LABEL_335;
              }
            }
          }
        }
        v128 = 0x7FFFFFFFFFFFFFFFLL;
        if (!count)
        {
          v93 = v254;
          v15 = v253;
LABEL_323:
          if (!altCount)
            goto LABEL_333;
          goto LABEL_324;
        }
        v15 = v253;
        if (logicalPositions)
        {
          v93 = v254;
          if (!logicalCharIndexes)
            goto LABEL_323;
          v129 = 0;
          do
            v128 = logicalCharIndexes[v129++];
          while (v128 < v14 && v129 < count);
          v93 = v45 + logicalPositions[v129 - 1];
          if (!altCount)
          {
LABEL_333:
            v142 = v93;
            goto LABEL_334;
          }
        }
        else
        {
          v93 = v254;
          if (!altCount)
            goto LABEL_333;
        }
LABEL_324:
        v16 = a9;
        v21 = v260;
        v14 = v248;
        if (!logicalAltPositions || !logicalAltCharIndexes)
        {
          v142 = v93;
          goto LABEL_336;
        }
        v152 = 0;
        while (logicalAltCharIndexes[v152] != v128)
        {
          if (++v152 >= altCount)
          {
            v94 = v103;
            v92 = 1;
            v95 = v93 - v93;
            goto LABEL_340;
          }
        }
        v92 = 0;
        v45 = v45 + logicalAltPositions[v152];
        v94 = v103;
        v261 = v113;
        v262 = v103;
        v266 = v93 - v93;
        v95 = v93 - v93;
        if (!*v16)
          goto LABEL_357;
LABEL_341:
        if (v265)
          goto LABEL_367;
        v154 = &cachedRectArray[*v16];
        x = v154[-1].origin.x;
        y = v154[-1].origin.y;
        width = v154[-1].size.width;
        height = v154[-1].size.height;
        if (v93 == x && v95 == width)
        {
          v160 = v270;
          if (v94 == y + height || y == v94 + v270)
            goto LABEL_367;
          v162 = v94;
          v163 = v93;
          v164 = v95;
          if (NSIntersectsRect(*(NSRect *)(&v160 - 3), v154[-1]))
            goto LABEL_367;
        }
        if (v94 != y || v270 != height)
          goto LABEL_357;
        if (v93 == x + width || x == v93 + v95)
          goto LABEL_367;
        v281.origin.x = v93;
        v281.origin.y = v94;
        v281.size.width = v95;
        v281.size.height = v270;
        v282.origin.x = x;
        v282.origin.y = y;
        v282.size.width = width;
        v282.size.height = height;
        if (NSIntersectsRect(v281, v282))
        {
LABEL_367:
          v170 = *v16;
          v171 = &cachedRectArray[*v16];
          v171[-1].origin.x = NSLMUnionRect(v171[-1].origin.x, v171[-1].origin.y, v171[-1].size.width, v171[-1].size.height, v93, v94, v95, v270);
          v171[-1].origin.y = v172;
          v171[-1].size.width = v173;
          v171[-1].size.height = v174;
          v21 = v260;
        }
        else
        {
LABEL_357:
          v166 = *v16 + 1;
          *v16 = v166;
          if (v257)
          {
            -[NSLayoutManager _growCachedRectArrayToSize:](v15, "_growCachedRectArrayToSize:");
            cachedRectArray = v15->_cachedRectArray;
            v167 = v270;
          }
          else
          {
            v167 = v270;
            if (a12)
            {
              if (v166 > a13)
              {
                v168 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
                objc_msgSend(v168, "setLength:", 32 * *v16);
                v244 = v168;
                cachedRectArray = (CGRect *)objc_msgSend(v168, "mutableBytes");
                memcpy(cachedRectArray, a12, __n);
              }
            }
            else
            {
              objc_msgSend(v244, "setLength:", 32 * v166);
              cachedRectArray = (CGRect *)objc_msgSend(v244, "mutableBytes");
            }
          }
          v170 = *v16;
          v175 = &cachedRectArray[*v16];
          v175[-1].origin.x = v93;
          v175[-1].origin.y = v94;
          v175[-1].size.width = v95;
          v175[-1].size.height = v167;
        }
        if (((v92 | v265) & 1) != 0)
        {
          v176 = v268;
          goto LABEL_380;
        }
        v177 = v170 + 1;
        *v16 = v170 + 1;
        if (v257)
        {
          -[NSLayoutManager _growCachedRectArrayToSize:](v15, "_growCachedRectArrayToSize:");
          cachedRectArray = v15->_cachedRectArray;
        }
        else
        {
          if (a12)
          {
            v176 = v268;
            if (v177 > a13)
            {
              v178 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
              objc_msgSend(v178, "setLength:", 32 * *v16);
              v244 = v178;
              cachedRectArray = (CGRect *)objc_msgSend(v178, "mutableBytes");
              memcpy(cachedRectArray, a12, __n);
            }
            goto LABEL_379;
          }
          objc_msgSend(v244, "setLength:", 32 * v177);
          cachedRectArray = (CGRect *)objc_msgSend(v244, "mutableBytes");
        }
        v176 = v268;
LABEL_379:
        v179 = &cachedRectArray[*v16];
        v179[-1].origin.x = v45;
        v179[-1].origin.y = v262;
        v179[-1].size.width = v266;
        v179[-1].size.height = v261;
LABEL_380:
        v79 = v72 + v79 - v176;
        v45 = v255;
        if (v79)
        {
          v72 = v176;
          if (v176 != 0x7FFFFFFFFFFFFFFFLL)
            continue;
        }
        goto LABEL_130;
      }
    }
    cachedRectArray = v78;
LABEL_130:
    v237 |= _NSLayoutTreeLineFragmentDrawsOutsideLineForGlyphAtIndex((uint64_t)v15, v272.location);
LABEL_131:
    v40 = v272.length + v272.location;
    v83 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)v15, v272.length + v272.location - 1);
    v84 = objc_msgSend(v21, "characterAtIndex:", v83);
    v36 = 1;
    if (v84 > 132)
    {
      if ((v84 - 8232) < 2 || v84 == 133)
        goto LABEL_143;
    }
    else
    {
      if (v84 == 10 || v84 == 12)
        goto LABEL_143;
      if (v84 == 13)
      {
        v86 = v83 + 1;
        if (v86 >= objc_msgSend(v21, "length") || objc_msgSend(v21, "characterAtIndex:", v86) != 10)
          goto LABEL_143;
      }
    }
    v36 = 0;
LABEL_143:
    if ((*((_BYTE *)&v15->_lmFlags + 3) & 0x40) == 0)
      _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)v15, v40, 1uLL);
    if (v40 >= *(_QWORD *)(*((_QWORD *)v15->_extraData + 26) + 8))
    {
LABEL_385:
      v180 = 0;
      goto LABEL_394;
    }
  }
  v181 = range1 + v14;
  if (v252)
  {
    if (v55 <= v181)
    {
      v182 = v55 + range1;
      goto LABEL_391;
    }
  }
  else if (v49 <= v181)
  {
    v182 = v49 + range1;
LABEL_391:
    range1 = v182 - v181 + 1;
  }
  v180 = 1;
LABEL_394:
  if (v233)
  {
    v183 = 0x7FFFFFFFFFFFFFFFLL;
    if (*v16)
    {
      v183 = v14;
      v184 = range1;
    }
    else
    {
      v184 = 0;
    }
    v233->location = v183;
    v233->length = v184;
  }
  if (*v16 | range1)
    v180 = 1;
  if ((v180 & 1) != 0
    || ((v185 = -[NSTextStorage length](v15->_textStorage, "length"),
         v186 = *(_QWORD *)(*((_QWORD *)v15->_extraData + 26) + 8),
         v271 = 0,
         objc_msgSend(a8, "lineFragmentPadding"),
         !v252)
      ? (v188 = v186)
      : (v188 = v185),
        v14 != v188))
  {
LABEL_454:
    v191 = a11;
    goto LABEL_455;
  }
  v189 = v187;
  if (!v185 || !v186)
    goto LABEL_417;
  v190 = objc_msgSend(v21, "characterAtIndex:", v185 - 1);
  if (v190 > 132)
  {
    if ((v190 - 8232) < 2 || v190 == 133)
      goto LABEL_417;
LABEL_429:
    v203 = v186 - 1;
    v204 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)v15, v203, (uint64_t *)&v272);
    v205 = _NSLayoutTreeLineFragmentUsedRectForGlyphAtIndex((uint64_t)v15, v203, 0);
    v195 = v206;
    v197 = v207;
    v209 = v205 + v208 - v189;
    if (v272.length
      && (v210 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)v15, v272.location),
          (v211 = _insertionPointHelperForCharacterAtIndex((uint64_t)v15, v210)) != 0))
    {
      v212 = 0;
      v213 = v211->_count;
      v214 = 1;
      if (v213)
      {
        v215 = v211->_logicalPositions;
        if (v215)
        {
          v216 = v211->_logicalCharIndexes;
          if (v216)
          {
            v212 = 0;
            v217 = v211->_altCount;
            v218 = 8 * v213 - 8;
            v219 = v204 + *(double *)((char *)v215 + v218);
            v214 = 1;
            if (v217)
            {
              v220 = v211->_logicalAltPositions;
              if (v220)
              {
                v221 = v211->_logicalAltCharIndexes;
                if (v221)
                {
                  v222 = 0;
                  v223 = *(unint64_t *)((char *)v216 + v218);
                  v214 = 1;
                  while (1)
                  {
                    v224 = v221[v222];
                    v212 = v224 == v223;
                    if (v224 == v223)
                      break;
                    if (++v222 >= v217)
                      goto LABEL_446;
                  }
                  v209 = v204 + v220[v222];
                  v214 = 2;
                }
              }
            }
LABEL_446:
            v227 = *v16 + v214;
            *v16 = v227;
            if (v257)
            {
              -[NSLayoutManager _growCachedRectArrayToSize:](v15, "_growCachedRectArrayToSize:");
              cachedRectArray = v15->_cachedRectArray;
            }
            else if (a12)
            {
              if (v227 > a13)
              {
                v228 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
                objc_msgSend(v228, "setLength:", 32 * *v16);
                cachedRectArray = (CGRect *)objc_msgSend(v228, "mutableBytes");
                memcpy(cachedRectArray, a12, 32 * a13);
              }
            }
            else
            {
              objc_msgSend(v244, "setLength:", 32 * v227);
              cachedRectArray = (CGRect *)objc_msgSend(v244, "mutableBytes");
            }
            v229 = *v16;
            v230 = &cachedRectArray[*v16 - v214];
            v230->origin.x = v219;
            *(_QWORD *)&v230->origin.y = v195;
            v230->size.width = 0.0;
            v230->size.height = v197;
            if (v212)
            {
              v231 = &cachedRectArray[v229];
              v231[-1].origin.x = v209;
              p_x = &v231[-1].origin.x;
              v191 = a11;
              goto LABEL_443;
            }
            goto LABEL_454;
          }
        }
      }
    }
    else
    {
      v212 = 0;
      v214 = 1;
    }
    v219 = v209;
    goto LABEL_446;
  }
  if (v190 != 10
    && v190 != 12
    && (v190 != 13
     || v185 < objc_msgSend(v21, "length") && objc_msgSend(v21, "characterAtIndex:", v185) == 10))
  {
    goto LABEL_429;
  }
LABEL_417:
  if (v15->_textStorage && !v15->_extraLineFragmentContainer)
    -[NSTypesetter layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:](-[NSLayoutManager typesetter](v15, "typesetter"), "layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:", v15, v186, 1, &v271);
  v191 = a11;
  if (v15->_extraLineFragmentContainer == a8)
  {
    *(_OWORD *)value = 0u;
    v275 = 0u;
    _NSLayoutTreeGetExtraLineFragmentRect((uint64_t)v15, (uint64_t)value, 0);
    v192 = value[0];
    v193 = *(double *)&v275;
    *(_OWORD *)value = 0u;
    v275 = 0u;
    _NSLayoutTreeGetExtraLineFragmentRect((uint64_t)v15, 0, (uint64_t)value);
    v194 = value[0];
    v195 = value[1];
    v197 = *((double *)&v275 + 1);
    v196 = *(double *)&v275;
    v198 = *v16 + 1;
    *v16 = v198;
    v199 = *(double *)&v194 + v196;
    v200 = v189 + *(double *)&v194;
    if (v199 == *(double *)&v192 + v193)
      v201 = v200;
    else
      v201 = v199 - v189;
    if (v257)
    {
      -[NSLayoutManager _growCachedRectArrayToSize:](v15, "_growCachedRectArrayToSize:");
      cachedRectArray = v15->_cachedRectArray;
    }
    else if (a12)
    {
      if (v198 > a13)
      {
        v202 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
        objc_msgSend(v202, "setLength:", 32 * *v16);
        cachedRectArray = (CGRect *)objc_msgSend(v202, "mutableBytes");
        memcpy(cachedRectArray, a12, 32 * a13);
      }
    }
    else
    {
      objc_msgSend(v244, "setLength:", 32 * v198);
      cachedRectArray = (CGRect *)objc_msgSend(v244, "mutableBytes");
    }
    v225 = &cachedRectArray[*v16];
    v225[-1].origin.x = v201;
    p_x = &v225[-1].origin.x;
LABEL_443:
    *((_QWORD *)p_x + 1) = v195;
    p_x[2] = 0.0;
    p_x[3] = v197;
  }
LABEL_455:
  lmFlags = v15->_lmFlags;
  if ((*(_BYTE *)&lmFlags & 0x40) == 0)
  {
    if (!v15->_displayInvalidationDisableStack)
      goto LABEL_459;
    if (!--v15->_displayInvalidationDisableStack)
    {
      lmFlags = v15->_lmFlags;
LABEL_459:
      v15->_lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags | 0x40);
      -[NSLayoutManager _invalidateDisplayIfNeeded](v15, "_invalidateDisplayIfNeeded", v233);
      *(_DWORD *)&v15->_lmFlags &= ~0x40u;
    }
  }
  if (v257)
    *(_DWORD *)&v15->_lmFlags &= ~0x20u;
  if (v191)
    *v191 = v237 & 1;
  if (*v16)
    return cachedRectArray;
  else
    return 0;
}

- (CGRect)_rectArrayForRange:(_NSRange)a3 withinSelectionRange:(_NSRange)a4 rangeIsCharRange:(BOOL)a5 singleRectOnly:(BOOL)a6 fullLineRectsOnly:(BOOL)a7 inTextContainer:(id)a8 rectCount:(unint64_t *)a9 rangeWithinContainer:(_NSRange *)a10 glyphsDrawOutsideLines:(BOOL *)a11
{
  uint64_t v12;

  LOBYTE(v12) = a7;
  return -[NSLayoutManager _rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:rectArray:rectArrayCapacity:](self, "_rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:rectArray:rectArrayCapacity:", a3.location, a3.length, a4.location, a4.length, a5, a6, v12, a8, a9, a10, a11, 0, 0);
}

- (CGRect)_boundingRectForGlyphRange:(_NSRange)a3 inTextContainer:(id)a4 fast:(BOOL)a5 fullLineRectsOnly:(BOOL)a6
{
  NSTextContainer *v6;
  CGRect *v8;
  double height;
  double v10;
  double v11;
  CGSize size;
  _QWORD *extraData;
  double v14;
  NSTextContainer *v15;
  NSUInteger location;
  NSRunStorage *containerRuns;
  unint64_t v18;
  unint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  NSUInteger v28;
  int *v29;
  int *v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  unint64_t v38;
  char v39;
  int v40;
  double v41;
  double v42;
  double v43;
  double v44;
  NSUInteger v45;
  NSUInteger v47;
  int *v48;
  NSFont *cachedFont;
  int *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  char v54;
  BOOL v55;
  int v56;
  uint64_t v57;
  BOOL v58;
  double v59;
  double v60;
  double *v61;
  uint64_t v62;
  uint64_t v63;
  double *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  uint64_t v98;
  CGFloat v99;
  CGFloat v100;
  CGFloat v101;
  NSUInteger v102;
  double v103;
  CFDictionaryRef *v104;
  CGFloat v105;
  char *v106;
  uint64_t v107;
  NSTextContainer *v108;
  CGFloat v109;
  CGFloat i;
  uint64_t v111;
  double v112;
  double v113;
  double v114;
  double width;
  double y;
  double x;
  CGPoint origin;
  __n128 v119;
  char v120;
  NSRange v121;
  uint64_t v122;
  NSRect value;
  NSRect v124;
  NSRect v125;
  CGRect result;
  NSRect v127;
  NSRect v128;

  v6 = (NSTextContainer *)a4;
  v122 = 0;
  v121 = (NSRange)0;
  v120 = 0;
  LOBYTE(v107) = a6;
  v8 = -[NSLayoutManager _rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:](self, "_rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:", a3.location, a3.length, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 1, v107, a4, &v122, &v121, &v120);
  if (v122 == 1)
  {
    y = v8->origin.y;
    x = v8->origin.x;
    height = v8->size.height;
    width = v8->size.width;
    memset(&value, 0, sizeof(value));
    _NSLayoutTreeGetExtraLineFragmentRect((uint64_t)self, 0, (uint64_t)&value);
    v10 = value.origin.x;
    v11 = value.origin.y;
    size = value.size;
    extraData = self->_extraData;
    if (((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0 || (*(_BYTE *)(extraData[30] + 56) & 1) == 0)
      && v121.length + v121.location == *(_QWORD *)(extraData[26] + 8)
      && self->_extraLineFragmentContainer == v6)
    {
      if (NSIsEmptyRect(value))
      {
        v14 = height;
      }
      else
      {
        v25 = NSLMUnionRect(x, y, width, height, v10, v11, size.width, size.height);
        y = v26;
        x = v25;
        width = v27;
      }
    }
    else
    {
      v14 = height;
    }
    if (v120 && v121.length)
    {
      value.origin.x = 0.0;
      value.origin.y = 0.0;
      v119 = 0uLL;
      v114 = v14;
      if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
      {
        v119.n128_u64[1] = *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8);
        v24 = (void *)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
      }
      else
      {
        v15 = v6;
        location = v121.location;
        if (-[NSRunStorage count](self->_containerRuns, "count") <= location)
        {
          v24 = 0;
          v6 = v15;
        }
        else
        {
          containerRuns = self->_containerRuns;
          _NSBlockNumberForIndex(containerRuns, location, &v119);
          if (containerRuns->_gapBlockIndex <= v18)
            v19 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
          else
            v19 = 0;
          v6 = v15;
          v24 = *(void **)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v19 + v18)];
        }
      }
      v111 = objc_msgSend(v24, "layoutOrientation");
      -[NSLayoutManager _setCachedTextContainer:isVertical:](self, "_setCachedTextContainer:isVertical:", v6, v111 != 0);
      v108 = v6;
      if (v121.length)
      {
        v28 = v121.location;
        v29 = &OBJC_IVAR___NSLayoutManager__textStorage;
        v30 = &OBJC_IVAR___NSExtraLMData__cachedFontBounds;
        do
        {
          v31 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v28, (uint64_t *)&value);
          v33 = v32;
          v35 = v34;
          v37 = v36;
          value.origin = (CGPoint)NSIntersectionRange((NSRange)value.origin, v121);
          if (_NSLayoutTreeLineFragmentDrawsOutsideLineForGlyphAtIndex((uint64_t)self, v121.location))
          {
            v38 = *(_QWORD *)&value.origin.x;
            v112 = v33;
            v113 = v31;
            v109 = v37;
            for (i = v35; v38 < *(_QWORD *)&value.origin.y + *(_QWORD *)&value.origin.x; ++v38)
            {
              v39 = _NSGlyphTreeNotShownAttributeForGlyphAtIndex((uint64_t)self, v38);
              v40 = _NSGlyphTreeDrawsOutsideLineFragmentForGlyphAtIndex((uint64_t)self, v38);
              if ((v39 & 1) != 0 || !v40)
              {
                if (!v40
                  || !objc_msgSend(*(id *)((char *)&self->super.isa + *v29), "attribute:atIndex:effectiveRange:", CFSTR("NSAttachment"), _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, v38), 0))
                {
                  continue;
                }
                -[NSLayoutManager locationForGlyphAtIndex:](self, "locationForGlyphAtIndex:", v38);
                v82 = v81;
                v84 = v83;
                -[NSLayoutManager attachmentSizeForGlyphAtIndex:](self, "attachmentSizeForGlyphAtIndex:", v38);
                v86 = v85;
                v88 = v87;
                v89 = v113 + v82;
                v90 = v112 + v84 - v87;
                v91 = NSLMUnionRect(x, y, width, v114, v89, v90, v85, v87);
                y = v92;
                x = v91;
                v114 = v94;
                width = v93;
                v73 = v31;
                v74 = v33;
                v75 = v35;
                v76 = v37;
                v77 = v89;
                v78 = v90;
                v79 = v86;
                v80 = v88;
              }
              else
              {
                -[NSLayoutManager locationForGlyphAtIndex:](self, "locationForGlyphAtIndex:", v38);
                v42 = v41;
                v44 = v43;
                v45 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, v38);
                if (v45 < self->_cachedFontCharRange.location
                  || v45 - self->_cachedFontCharRange.location >= self->_cachedFontCharRange.length)
                {
                  v47 = v45;
                  v48 = v30;
                  cachedFont = self->_cachedFont;
                  v50 = v29;
                  v51 = *v29;
                  v52 = (void *)objc_msgSend(*(id *)((char *)&self->super.isa + v51), "attribute:atIndex:effectiveRange:", CFSTR("NSFont"), v45, &self->_cachedFontCharRange);
                  origin = (CGPoint)0;
                  v53 = (void *)objc_msgSend(*(id *)((char *)&self->super.isa + v51), "attribute:atIndex:effectiveRange:", CFSTR("CTVerticalForms"), v47, &origin);
                  if (!v52)
                    v52 = (void *)NSDefaultFont();
                  v54 = objc_msgSend(v53, "BOOLValue");
                  if (v111)
                    v55 = v53 == 0;
                  else
                    v55 = 0;
                  v56 = v55;
                  if ((v54 & 1) != 0 || (v57 = (uint64_t)v52, v56))
                    v57 = objc_msgSend(v52, "verticalFont");
                  if (v57)
                    v52 = (void *)v57;
                  if (objc_msgSend(v52, "isVertical"))
                    v58 = v53 == 0;
                  else
                    v58 = 1;
                  v29 = v50;
                  if (!v58
                    && *(_QWORD *)&origin.y + *(_QWORD *)&origin.x < self->_cachedFontCharRange.length
                                                                   + self->_cachedFontCharRange.location)
                  {
                    self->_cachedFontCharRange.length = *(_QWORD *)&origin.y
                                                      + *(_QWORD *)&origin.x
                                                      - self->_cachedFontCharRange.location;
                  }
                  self->_cachedFont = -[NSLayoutManager substituteFontForFont:](self, "substituteFontForFont:", v52);

                  -[UIFont boundingRectForFont](self->_cachedFont, "boundingRectForFont");
                  v30 = v48;
                  v61 = (double *)((char *)self->_extraData + *v48);
                  *(_QWORD *)v61 = v62;
                  v61[1] = -v59 - v60;
                  *((_QWORD *)v61 + 2) = v63;
                  v61[3] = v60;
                }
                v64 = (double *)((char *)self->_extraData + *v30);
                v65 = v64[2];
                v66 = v64[3];
                v67 = v113 + v42 + *v64;
                v68 = v112 + v44 + v64[1];
                v69 = NSLMUnionRect(x, y, width, v114, v67, v68, v65, v66);
                y = v70;
                x = v69;
                v114 = v72;
                width = v71;
                v73 = v31;
                v74 = v33;
                v75 = v35;
                v76 = v37;
                v77 = v67;
                v78 = v68;
                v79 = v65;
                v80 = v66;
              }
              v31 = NSLMUnionRect(v73, v74, v75, v76, v77, v78, v79, v80);
              v33 = v95;
              v35 = v96;
              v37 = v97;
            }
            v124.origin.y = v112;
            v124.origin.x = v113;
            v124.size.height = v109;
            v124.size.width = i;
            v127.origin.x = v31;
            v127.origin.y = v33;
            v127.size.width = v35;
            v127.size.height = v37;
            if (!NSEqualRects(v124, v127))
            {
              origin = value.origin;
              v98 = 30;
              do
              {
                if (*(_QWORD *)&origin.x <= v119.n128_u64[0])
                  break;
                v128.origin.x = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, *(_QWORD *)&origin.x - 1, (uint64_t *)&origin);
                v128.origin.y = v99;
                v128.size.width = v100;
                v128.size.height = v101;
                v125.origin.x = v31;
                v125.origin.y = v33;
                v125.size.width = v35;
                v125.size.height = v37;
                if (!NSIntersectsRect(v125, v128))
                  break;
                if (!_NSLayoutTreeOutsideDrawsUponLineFragmentForGlyphAtIndex((uint64_t)self, *(unint64_t *)&origin.x))_NSLayoutTreeSetOutsideDrawsUponLineFragmentAtGlyphIndex((uint64_t)self, *(unint64_t *)&origin.x);
                --v98;
              }
              while (v98);
            }
          }
          v28 = *(_QWORD *)&value.origin.y + *(_QWORD *)&value.origin.x;
          v102 = v121.length + v121.location - (*(_QWORD *)&value.origin.y + *(_QWORD *)&value.origin.x);
          v55 = v121.length + v121.location == *(_QWORD *)&value.origin.y + *(_QWORD *)&value.origin.x;
          v121.location = *(_QWORD *)&value.origin.y + *(_QWORD *)&value.origin.x;
          v121.length = v102;
        }
        while (!v55);
      }
      -[NSLayoutManager _resetCachedTextContainer](self, "_resetCachedTextContainer");
      v6 = v108;
      v14 = v114;
    }
    v103 = v14;
    value.origin.x = 0.0;
    v104 = (CFDictionaryRef *)self->_extraData;
    if (v104[10] == (CFDictionaryRef)v6)
    {
      v105 = 0.0;
    }
    else if (!CFDictionaryGetValueIfPresent(v104[11], v6, (const void **)&value)
           || (v105 = value.origin.x, *(_QWORD *)&value.origin.x == 0x7FFFFFFFFFFFFFFFLL))
    {
      v21 = y;
      v20 = x;
      v22 = width;
      v23 = v103;
      goto LABEL_74;
    }
    v106 = -[NSStorage elementAtIndex:](self->_containerUsedRects, "elementAtIndex:", *(_QWORD *)&v105);
    v21 = y;
    v20 = x;
    *((double *)v106 + 9) = x;
    *((double *)v106 + 10) = y;
    v22 = width;
    *((double *)v106 + 11) = width;
    *((double *)v106 + 12) = v103;
    v23 = v103;
    *(NSRange *)(v106 + 104) = v121;
    goto LABEL_74;
  }
  v20 = *MEMORY[0x1E0CB3438];
  v21 = *(double *)(MEMORY[0x1E0CB3438] + 8);
  v22 = *(double *)(MEMORY[0x1E0CB3438] + 16);
  v23 = *(double *)(MEMORY[0x1E0CB3438] + 24);
LABEL_74:
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (_NSRange)_firstPassGlyphRangeForBoundingRect:(CGRect)a3 inTextContainer:(id)a4 hintGlyphRange:(_NSRange)a5 okToFillHoles:(BOOL)a6
{
  NSUInteger length;
  NSUInteger location;
  double height;
  CGFloat width;
  double y;
  CGFloat x;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  unint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  NSRunStorage *containerRuns;
  unint64_t v26;
  unint64_t v27;
  id v28;
  NSRange v29;
  unint64_t v30;
  char v31;
  NSUInteger v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  NSRunStorage *v40;
  unint64_t v41;
  unint64_t v42;
  id v43;
  NSRange v44;
  _BOOL4 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  CGFloat v57;
  double v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  NSRunStorage *v65;
  unint64_t v66;
  unint64_t v67;
  id v68;
  NSRange v69;
  unint64_t v70;
  unint64_t v71;
  double v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  NSRunStorage *v79;
  unint64_t v80;
  unint64_t v81;
  id v82;
  NSRange v83;
  NSUInteger v84;
  NSUInteger v85;
  NSRect bRect;
  unint64_t firstUnlaidGlyphIndex;
  unint64_t v88;
  NSRange v89;
  NSRange v90;
  NSRange v91;
  NSRange v92;
  _NSRange result;
  NSRect v94;
  NSRect v95;
  NSRect v96;
  NSRect v97;
  NSRect v98;
  NSRect v99;
  NSRect v100;
  NSRect v101;

  HIDWORD(bRect.origin.y) = a6;
  length = a5.length;
  location = a5.location;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  firstUnlaidGlyphIndex = 0;
  bRect.size.width = 0.0;
  bRect.size.height = 0.0;
  if (self->_firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL || self->_firstUnlaidGlyphIndex == 0x7FFFFFFFFFFFFFFFLL)
    -[NSLayoutManager getFirstUnlaidCharacterIndex:glyphIndex:](self, "getFirstUnlaidCharacterIndex:glyphIndex:", 0, &firstUnlaidGlyphIndex);
  else
    firstUnlaidGlyphIndex = self->_firstUnlaidGlyphIndex;
  v14 = 0.0;
  if (*(double *)&location != 0.0)
  {
    v15 = NAN;
    v16 = *(double *)&location;
    while (1)
    {
      v17 = *(_QWORD *)&v16 - 1;
      v18 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, *(_QWORD *)&v16 - 1, (uint64_t *)&bRect.size);
      v20 = v19;
      v22 = v21;
      v24 = v23;
      if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
      {
        v28 = (id)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
      }
      else if (-[NSRunStorage count](self->_containerRuns, "count") <= v17)
      {
        v28 = 0;
      }
      else
      {
        containerRuns = self->_containerRuns;
        *(_QWORD *)&a3.origin.x = _NSBlockNumberForIndex(containerRuns, v17, 0).n128_u64[0];
        v27 = 0;
        if (containerRuns->_gapBlockIndex <= v26)
          v27 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
        v28 = *(id *)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v27 + v26)];
      }
      if (v28 != a4)
        goto LABEL_24;
      v94.origin.x = v18;
      v94.origin.y = v20;
      v94.size.width = v22;
      v94.size.height = v24;
      v98.origin.x = x;
      v98.origin.y = y;
      v98.size.width = width;
      v98.size.height = height;
      if (!NSIntersectsRect(v94, v98))
        break;
      if (v14 == 0.0)
      {
        v16 = bRect.size.width;
        v14 = bRect.size.height;
        v15 = bRect.size.width;
        if (!*(_QWORD *)&bRect.size.width)
          goto LABEL_24;
      }
      else
      {
        *(CGFloat *)&v89.location = v15;
        *(CGFloat *)&v89.length = v14;
        v29 = NSUnionRange(v89, (NSRange)bRect.size);
        v15 = *(double *)&v29.location;
        v14 = *(double *)&v29.length;
LABEL_19:
        v16 = bRect.size.width;
        if (!*(_QWORD *)&bRect.size.width)
          goto LABEL_24;
      }
    }
    a3.origin.x = v20 + v24;
    if (v20 + v24 <= y)
      goto LABEL_24;
    goto LABEL_19;
  }
  v15 = NAN;
LABEL_24:
  if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    v30 = *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8);
  }
  else if (HIDWORD(bRect.origin.y))
  {
    _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, location, 1uLL);
    v88 = 0;
    _NSGlyphTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, 0, 0, 0, 0, &v88);
    v30 = v88;
  }
  else
  {
    v30 = firstUnlaidGlyphIndex;
  }
  if (location < v30)
  {
    v31 = 0;
    v32 = location + length;
    do
    {
      v33 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, location, (uint64_t *)&bRect.size);
      v35 = v34;
      v37 = v36;
      v39 = v38;
      if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
      {
        v43 = (id)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
      }
      else if (-[NSRunStorage count](self->_containerRuns, "count") <= location)
      {
        v43 = 0;
      }
      else
      {
        v40 = self->_containerRuns;
        *(_QWORD *)&a3.origin.x = _NSBlockNumberForIndex(v40, location, 0).n128_u64[0];
        v42 = 0;
        if (v40->_gapBlockIndex <= v41)
          v42 = v40->_maxBlocks - v40->_numBlocks;
        v43 = *(id *)&v40->_runs->var1[(v40->_elementSize + 8) * (v42 + v41)];
      }
      v31 |= v43 == a4;
      if (v43 != a4)
        goto LABEL_42;
      v95.origin.x = v33;
      v95.origin.y = v35;
      v95.size.width = v37;
      v95.size.height = v39;
      v99.origin.x = x;
      v99.origin.y = y;
      v99.size.width = width;
      v99.size.height = height;
      if (NSIntersectsRect(v95, v99))
      {
        if (v14 == 0.0)
        {
          v15 = bRect.size.width;
          v14 = bRect.size.height;
        }
        else
        {
          *(CGFloat *)&v90.location = v15;
          *(CGFloat *)&v90.length = v14;
          v44 = NSUnionRange(v90, (NSRange)bRect.size);
          v15 = *(double *)&v44.location;
          v14 = *(double *)&v44.length;
        }
      }
      else
      {
LABEL_42:
        v46 = v35 < y + height && v43 == a4;
        if (((location < v32) & ~v31) == 0 && !v46)
          break;
      }
      location = *(_QWORD *)&bRect.size.height + *(_QWORD *)&bRect.size.width;
      if (HIDWORD(bRect.origin.y) && (*((_BYTE *)&self->_lmFlags + 3) & 0x40) == 0)
      {
        _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, *(_QWORD *)&bRect.size.height + *(_QWORD *)&bRect.size.width, 1uLL);
        v88 = 0;
        _NSGlyphTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, 0, 0, 0, 0, &v88);
        v30 = v88;
      }
    }
    while (location < v30);
  }
  v47 = -[NSLayoutManager _primitiveCharacterRangeForGlyphRange:](self, "_primitiveCharacterRangeForGlyphRange:", *(_QWORD *)&v15, *(_QWORD *)&v14, a3.origin.x, *(_QWORD *)&x);
  v49 = v48;
  v51 = -[NSLayoutManager _blockRangeForCharRange:](self, "_blockRangeForCharRange:", v47, v48);
  if (v47 != v51 || v49 != v50)
  {
    v52 = -[NSLayoutManager _glyphRangeForCharacterRange:actualCharacterRange:okToFillHoles:](self, "_glyphRangeForCharacterRange:actualCharacterRange:okToFillHoles:", v51, v50, 0, HIDWORD(bRect.origin.y));
    v53 = v52;
    v55 = v54;
    if (v52 >= *(_QWORD *)&v15)
    {
      v57 = bRect.origin.x;
    }
    else
    {
      v56 = v52;
      v57 = bRect.origin.x;
      do
      {
        v58 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v56, (uint64_t *)&bRect.size);
        v60 = v59;
        v62 = v61;
        v64 = v63;
        if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
        {
          v68 = (id)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
        }
        else if (-[NSRunStorage count](self->_containerRuns, "count") <= v56)
        {
          v68 = 0;
        }
        else
        {
          v65 = self->_containerRuns;
          _NSBlockNumberForIndex(v65, v56, 0);
          v67 = 0;
          if (v65->_gapBlockIndex <= v66)
            v67 = v65->_maxBlocks - v65->_numBlocks;
          v68 = *(id *)&v65->_runs->var1[(v65->_elementSize + 8) * (v67 + v66)];
        }
        if (v68 == a4)
        {
          v96.origin.x = v58;
          v96.origin.y = v60;
          v96.size.width = v62;
          v96.size.height = v64;
          v100.origin.x = bRect.origin.x;
          v100.origin.y = y;
          v100.size.width = width;
          v100.size.height = height;
          if (NSIntersectsRect(v96, v100))
          {
            if (v14 == 0.0)
            {
              v15 = bRect.size.width;
              v14 = bRect.size.height;
            }
            else
            {
              *(CGFloat *)&v91.location = v15;
              *(CGFloat *)&v91.length = v14;
              v69 = NSUnionRange(v91, (NSRange)bRect.size);
              v15 = *(double *)&v69.location;
              v14 = *(double *)&v69.length;
            }
          }
        }
        v56 = *(_QWORD *)&bRect.size.height + *(_QWORD *)&bRect.size.width;
      }
      while (*(_QWORD *)&bRect.size.height + *(_QWORD *)&bRect.size.width < *(_QWORD *)&v15);
    }
    v70 = *(_QWORD *)&v15 + *(_QWORD *)&v14;
    if (*(_QWORD *)&v15 + *(_QWORD *)&v14 < v30)
    {
      v71 = v53 + v55;
      do
      {
        if (v70 >= v71)
          break;
        v72 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v70, (uint64_t *)&bRect.size);
        v74 = v73;
        v76 = v75;
        v78 = v77;
        if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
        {
          v82 = (id)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
        }
        else if (-[NSRunStorage count](self->_containerRuns, "count") <= v70)
        {
          v82 = 0;
        }
        else
        {
          v79 = self->_containerRuns;
          _NSBlockNumberForIndex(v79, v70, 0);
          v81 = 0;
          if (v79->_gapBlockIndex <= v80)
            v81 = v79->_maxBlocks - v79->_numBlocks;
          v82 = *(id *)&v79->_runs->var1[(v79->_elementSize + 8) * (v81 + v80)];
        }
        if (v82 == a4)
        {
          v97.origin.x = v72;
          v97.origin.y = v74;
          v97.size.width = v76;
          v97.size.height = v78;
          v101.origin.x = v57;
          v101.origin.y = y;
          v101.size.width = width;
          v101.size.height = height;
          if (NSIntersectsRect(v97, v101))
          {
            if (v14 == 0.0)
            {
              v15 = bRect.size.width;
              v14 = bRect.size.height;
            }
            else
            {
              *(CGFloat *)&v92.location = v15;
              *(CGFloat *)&v92.length = v14;
              v83 = NSUnionRange(v92, (NSRange)bRect.size);
              v15 = *(double *)&v83.location;
              v14 = *(double *)&v83.length;
            }
          }
        }
        v70 = *(_QWORD *)&bRect.size.height + *(_QWORD *)&bRect.size.width;
        if (HIDWORD(bRect.origin.y) && (*((_BYTE *)&self->_lmFlags + 3) & 0x40) == 0)
        {
          _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, *(_QWORD *)&bRect.size.height + *(_QWORD *)&bRect.size.width, 1uLL);
          v88 = 0;
          _NSGlyphTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, 0, 0, 0, 0, &v88);
          v30 = v88;
        }
      }
      while (v70 < v30);
    }
  }
  v84 = *(_QWORD *)&v15;
  v85 = *(_QWORD *)&v14;
  result.length = v85;
  result.location = v84;
  return result;
}

- (_NSRange)_firstPassGlyphRangeForBoundingRect:(CGRect)a3 inTextContainer:(id)a4 okToFillHoles:(BOOL)a5
{
  double height;
  CGFloat width;
  double y;
  CGFloat x;
  NSUInteger v11;
  NSUInteger v12;
  void *v13;
  unint64_t v14;
  BOOL v15;
  char v16;
  char v17;
  NSRunStorage *containerRuns;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  id v22;
  BOOL v23;
  unint64_t v24;
  unint64_t v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  int v33;
  unint64_t v34;
  double v35;
  double v36;
  NSUInteger location;
  NSUInteger v38;
  NSUInteger length;
  NSUInteger v40;
  unint64_t v41;
  unint64_t v42;
  double v43;
  double v44;
  BOOL v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  double v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  NSUInteger v62;
  NSRunStorage *v63;
  unint64_t v64;
  unint64_t v65;
  id v66;
  NSRange v67;
  unint64_t v68;
  unint64_t v69;
  double v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  NSRunStorage *v77;
  unint64_t v78;
  unint64_t v79;
  id v80;
  NSRange v81;
  NSUInteger v82;
  NSUInteger v83;
  NSUInteger v84;
  NSUInteger v85;
  uint64_t v86;
  _BOOL4 v87;
  unint64_t v88;
  NSUInteger v89;
  __n128 v90;
  NSRange v91;
  unint64_t firstUnlaidGlyphIndex;
  void *value;
  NSRange v94;
  NSRange v95;
  _NSRange result;
  NSRect v97;
  NSRect v98;
  NSRect v99;
  NSRect v100;
  NSRect v101;

  v87 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  value = 0;
  v91.location = 0;
  v91.length = 0;
  v90 = 0uLL;
  v11 = 0;
  v12 = 0;
  if (!NSIsEmptyRect(a3))
  {
    firstUnlaidGlyphIndex = 0;
    if (self->_firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL || self->_firstUnlaidGlyphIndex == 0x7FFFFFFFFFFFFFFFLL)
      -[NSLayoutManager getFirstUnlaidCharacterIndex:glyphIndex:](self, "getFirstUnlaidCharacterIndex:glyphIndex:", 0, &firstUnlaidGlyphIndex);
    else
      firstUnlaidGlyphIndex = self->_firstUnlaidGlyphIndex;
    if (a4)
    {
      if (CFDictionaryGetValueIfPresent(*((CFDictionaryRef *)self->_extraData + 12), a4, (const void **)&value))
        v13 = value;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
    {
      v14 = *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8);
    }
    else if (v87)
    {
      _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, (unint64_t)v13, 1uLL);
      v88 = 0;
      _NSGlyphTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, 0, 0, 0, 0, &v88);
      v14 = v88;
    }
    else
    {
      v14 = firstUnlaidGlyphIndex;
    }
    if ((unint64_t)v13 >= v14)
    {
      v11 = 0;
      location = 0;
    }
    else
    {
      v84 = 0;
      v85 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      do
      {
        if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
        {
          v21 = *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8);
          v90.n128_u64[0] = 0;
          v90.n128_u64[1] = v21;
          v22 = (id)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
        }
        else if (-[NSRunStorage count](self->_containerRuns, "count") <= (unint64_t)v13)
        {
          v22 = 0;
        }
        else
        {
          containerRuns = self->_containerRuns;
          _NSBlockNumberForIndex(containerRuns, (unint64_t)v13, &v90);
          if (containerRuns->_gapBlockIndex <= v19)
            v20 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
          else
            v20 = 0;
          v22 = *(id *)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v20 + v19)];
        }
        v23 = v22 == a4;
        if (v22 == a4)
        {
          v26 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, (unint64_t)v13, (uint64_t *)&v91);
          v28 = v27;
          v30 = v29;
          v32 = v31;
          v33 = (*(_DWORD *)&self->_lmFlags >> 30) & 1;
          if (v90.n128_u64[1] + v90.n128_u64[0] < firstUnlaidGlyphIndex)
            v33 = 1;
          if (v33)
            v34 = v90.n128_u64[1] + v90.n128_u64[0];
          else
            v34 = firstUnlaidGlyphIndex;
          v97.origin.x = x;
          v97.origin.y = y;
          v97.size.width = width;
          v97.size.height = height;
          v35 = v28;
          v36 = v32;
          if (NSIntersectsRect(v97, *(NSRect *)&v26))
          {
            location = v91.location;
            v38 = v85;
            if ((v16 & 1) == 0)
              v38 = v91.location;
            v85 = v38;
            v16 = 1;
          }
          else if ((v16 & 1) != 0)
          {
            location = v91.location;
            if (v28 >= y + height)
              goto LABEL_66;
            v16 = 1;
            v84 = v91.location;
          }
          else if ((v17 & 1) != 0)
          {
            v16 = 0;
            v17 = 1;
            location = v91.location;
          }
          else
          {
            location = v91.location;
            if (v28 + v32 >= y
              || (length = v91.length, v40 = v91.length + v91.location, v91.length + v91.location + 2500 >= v34))
            {
              v17 = 0;
              v16 = 0;
            }
            else
            {
              v41 = v34 - v40;
              if (v34 - v40 >= 0xCA)
              {
                do
                {
                  v42 = location + (v41 >> 1) + length;
                  if (v42 >= v34)
                    break;
                  v88 = 0;
                  v89 = 0;
                  _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v42, (uint64_t *)&v88);
                  if (v43 + v44 < y)
                  {
                    location = v88;
                    length = v89;
                  }
                  v45 = v41 > 0x193;
                  v41 >>= 1;
                }
                while (v45);
              }
              v16 = 0;
              v91.location = location;
              v91.length = length;
              v17 = 1;
            }
          }
          v13 = (void *)(v91.length + location);
        }
        else
        {
          if (v15)
            break;
          if (v87 || (*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
          {
            -[NSLayoutManager textContainerForGlyphAtIndex:effectiveRange:](self, "textContainerForGlyphAtIndex:effectiveRange:", v13, &v90, v84);
            v25 = v90.n128_u64[1];
            v24 = v90.n128_u64[0];
          }
          else
          {
            v25 = v90.n128_u64[1];
            v24 = v90.n128_u64[0];
            if (v90.n128_u64[1] + v90.n128_u64[0] > firstUnlaidGlyphIndex)
            {
              v25 = firstUnlaidGlyphIndex - v90.n128_u64[0];
              v90.n128_u64[1] = firstUnlaidGlyphIndex - v90.n128_u64[0];
            }
          }
          v13 = (void *)(v25 + v24);
        }
        if (v87 && (*((_BYTE *)&self->_lmFlags + 3) & 0x40) == 0)
        {
          _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, (unint64_t)v13, 1uLL);
          v88 = 0;
          _NSGlyphTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, 0, 0, 0, 0, &v88);
          v14 = v88;
        }
        v15 = v23;
      }
      while ((unint64_t)v13 < v14);
      if ((v16 & 1) != 0)
        location = v91.length + v91.location;
      else
        location = v84;
LABEL_66:
      v11 = v85;
    }
    if (location >= v11)
      v12 = location - v11;
    else
      v12 = 0;
    v46 = -[NSLayoutManager _primitiveCharacterRangeForGlyphRange:](self, "_primitiveCharacterRangeForGlyphRange:", v11, v12, v84);
    v48 = v47;
    v50 = -[NSLayoutManager _blockRangeForCharRange:](self, "_blockRangeForCharRange:", v46, v47);
    if (v46 != v50 || v48 != v49)
    {
      v51 = -[NSLayoutManager _glyphRangeForCharacterRange:actualCharacterRange:okToFillHoles:](self, "_glyphRangeForCharacterRange:actualCharacterRange:okToFillHoles:", v50, v49, 0, v87);
      v52 = v51;
      v86 = v53;
      if (v51 < v11)
      {
        v54 = v51;
        do
        {
          v55 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v54, (uint64_t *)&v91);
          v57 = v56;
          v59 = v58;
          v61 = v60;
          if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
          {
            v66 = (id)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
          }
          else if (-[NSRunStorage count](self->_containerRuns, "count") <= v54)
          {
            v66 = 0;
          }
          else
          {
            v62 = v11;
            v63 = self->_containerRuns;
            _NSBlockNumberForIndex(v63, v54, 0);
            v65 = 0;
            if (v63->_gapBlockIndex <= v64)
              v65 = v63->_maxBlocks - v63->_numBlocks;
            v66 = *(id *)&v63->_runs->var1[(v63->_elementSize + 8) * (v65 + v64)];
            v11 = v62;
          }
          if (v66 == a4)
          {
            v98.origin.x = v55;
            v98.origin.y = v57;
            v98.size.width = v59;
            v98.size.height = v61;
            v100.origin.x = x;
            v100.origin.y = y;
            v100.size.width = width;
            v100.size.height = height;
            if (NSIntersectsRect(v98, v100))
            {
              v94.location = v11;
              v94.length = v12;
              v67 = NSUnionRange(v94, v91);
              v11 = v67.location;
              v12 = v67.length;
            }
          }
          v54 = v91.length + v91.location;
        }
        while (v91.length + v91.location < v11);
      }
      v68 = v11 + v12;
      if (v11 + v12 < v14)
      {
        v69 = v52 + v86;
        do
        {
          if (v68 >= v69)
            break;
          v70 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v68, (uint64_t *)&v91);
          v72 = v71;
          v74 = v73;
          v76 = v75;
          if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
          {
            v80 = (id)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
          }
          else if (-[NSRunStorage count](self->_containerRuns, "count") <= v68)
          {
            v80 = 0;
          }
          else
          {
            v77 = self->_containerRuns;
            _NSBlockNumberForIndex(v77, v68, 0);
            v79 = 0;
            if (v77->_gapBlockIndex <= v78)
              v79 = v77->_maxBlocks - v77->_numBlocks;
            v80 = *(id *)&v77->_runs->var1[(v77->_elementSize + 8) * (v79 + v78)];
          }
          if (v80 == a4)
          {
            v99.origin.x = v70;
            v99.origin.y = v72;
            v99.size.width = v74;
            v99.size.height = v76;
            v101.origin.x = x;
            v101.origin.y = y;
            v101.size.width = width;
            v101.size.height = height;
            if (NSIntersectsRect(v99, v101))
            {
              v95.location = v11;
              v95.length = v12;
              v81 = NSUnionRange(v95, v91);
              v11 = v81.location;
              v12 = v81.length;
            }
          }
          v68 = v91.length + v91.location;
          if (v87 && (*((_BYTE *)&self->_lmFlags + 3) & 0x40) == 0)
          {
            _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, v91.length + v91.location, 1uLL);
            v88 = 0;
            _NSGlyphTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, 0, 0, 0, 0, &v88);
            v14 = v88;
          }
        }
        while (v68 < v14);
      }
    }
  }
  v82 = v11;
  v83 = v12;
  result.length = v83;
  result.location = v82;
  return result;
}

- (_NSRange)_glyphRangeForBoundingRect:(CGRect)a3 inTextContainer:(id)a4 fast:(BOOL)a5 okToFillHoles:(BOOL)a6
{
  _BOOL8 v6;
  id v8;
  double height;
  double x;
  CFDictionaryRef *extraData;
  void *v13;
  NSUInteger v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  NSRunStorage *containerRuns;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  NSRunStorage *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  unint64_t v32;
  NSRunStorage *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  _BOOL4 v42;
  char v43;
  int v44;
  NSUInteger v45;
  BOOL v46;
  NSUInteger v47;
  NSFont *cachedFont;
  void *v49;
  void *v50;
  char v51;
  BOOL v52;
  int v53;
  uint64_t v54;
  BOOL v55;
  double v56;
  double v57;
  double *v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  CGFloat v63;
  CGFloat v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  CGFloat v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  char *v81;
  char *v82;
  unint64_t v83;
  unint64_t v84;
  NSRunStorage *v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  double v89;
  double v90;
  double v91;
  _BOOL4 v92;
  char *v93;
  char v94;
  int v95;
  double v96;
  double v97;
  double v98;
  double v99;
  NSUInteger v100;
  NSUInteger v102;
  NSFont *v103;
  void *v104;
  void *v105;
  char v106;
  BOOL v107;
  int v108;
  uint64_t v109;
  BOOL v110;
  double v111;
  double v112;
  double *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  uint64_t v124;
  double v125;
  NSUInteger v126;
  id v127;
  double v128;
  uint64_t v129;
  char *v130;
  uint64_t v131;
  double y;
  double width;
  unint64_t v134;
  uint64_t v135;
  void *value;
  uint64_t v137;
  unint64_t firstUnlaidGlyphIndex;
  _NSRange result;
  NSRect v140;
  NSRect v141;
  NSRect v142;
  NSRect v143;

  v6 = a6;
  v8 = a4;
  height = a3.size.height;
  y = a3.origin.y;
  width = a3.size.width;
  x = a3.origin.x;
  firstUnlaidGlyphIndex = 0;
  value = 0;
  extraData = (CFDictionaryRef *)self->_extraData;
  if (extraData[10] == a4)
  {
    v13 = 0;
  }
  else if (!CFDictionaryGetValueIfPresent(extraData[11], a4, (const void **)&value)
         || (v13 = value, value == (void *)0x7FFFFFFFFFFFFFFFLL))
  {
    v14 = 0;
    v15 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_144;
  }
  if (self->_firstUnlaidCharIndex == 0x7FFFFFFFFFFFFFFFLL || self->_firstUnlaidGlyphIndex == 0x7FFFFFFFFFFFFFFFLL)
    -[NSLayoutManager getFirstUnlaidCharacterIndex:glyphIndex:](self, "getFirstUnlaidCharacterIndex:glyphIndex:", 0, &firstUnlaidGlyphIndex);
  else
    firstUnlaidGlyphIndex = self->_firstUnlaidGlyphIndex;
  v16 = -[NSStorage elementAtIndex:](self->_containerUsedRects, "elementAtIndex:", v13);
  v17 = *((_QWORD *)v16 + 14);
  v127 = v8;
  if (!v17)
    goto LABEL_31;
  v18 = v16;
  if (*((_QWORD *)v16 + 13) + v17 > firstUnlaidGlyphIndex)
    goto LABEL_31;
  v140.origin.x = x;
  v140.origin.y = y;
  v140.size.width = width;
  v140.size.height = height;
  if (!NSContainsRect(v140, *(NSRect *)(v16 + 72)))
    goto LABEL_31;
  if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    v23 = -[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
  }
  else
  {
    v19 = *((_QWORD *)v18 + 13);
    if (-[NSRunStorage count](self->_containerRuns, "count") <= v19)
    {
      v23 = 0;
    }
    else
    {
      containerRuns = self->_containerRuns;
      _NSBlockNumberForIndex(containerRuns, v19, 0);
      v22 = 0;
      if (containerRuns->_gapBlockIndex <= v21)
        v22 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
      v23 = *(_QWORD *)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v22 + v21)];
    }
    v8 = v127;
  }
  if ((id)v23 == v8)
    goto LABEL_145;
  if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    v28 = -[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
  }
  else
  {
    v24 = *((_QWORD *)v18 + 13) + *((_QWORD *)v18 + 14) - 1;
    if (-[NSRunStorage count](self->_containerRuns, "count") <= v24)
    {
      v28 = 0;
    }
    else
    {
      v25 = self->_containerRuns;
      _NSBlockNumberForIndex(v25, v24, 0);
      v27 = 0;
      if (v25->_gapBlockIndex <= v26)
        v27 = v25->_maxBlocks - v25->_numBlocks;
      v28 = *(_QWORD *)&v25->_runs->var1[(v25->_elementSize + 8) * (v27 + v26)];
    }
    v8 = v127;
  }
  if ((id)v28 == v8)
LABEL_145:
    v29 = -[NSLayoutManager _firstPassGlyphRangeForBoundingRect:inTextContainer:hintGlyphRange:okToFillHoles:](self, "_firstPassGlyphRangeForBoundingRect:inTextContainer:hintGlyphRange:okToFillHoles:", v8, *((_QWORD *)v18 + 13), *((_QWORD *)v18 + 14), v6, x, y, width, height);
  else
LABEL_31:
    v29 = -[NSLayoutManager _firstPassGlyphRangeForBoundingRect:inTextContainer:okToFillHoles:](self, "_firstPassGlyphRangeForBoundingRect:inTextContainer:okToFillHoles:", v8, v6, x, y, width, height);
  v15 = v29;
  if (!a5)
  {
    v130 = (char *)v14;
    value = 0;
    v137 = 0;
    v131 = objc_msgSend(v8, "layoutOrientation");
    -[NSLayoutManager _setCachedTextContainer:isVertical:](self, "_setCachedTextContainer:isVertical:", v8, v131 != 0);
    if (v15)
    {
      v30 = 0;
      v129 = v15;
      v31 = (char *)v15;
      while (1)
      {
        v32 = (unint64_t)(v31 - 1);
        if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
        {
          v36 = -[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
        }
        else if (-[NSRunStorage count](self->_containerRuns, "count") <= v32)
        {
          v36 = 0;
        }
        else
        {
          v33 = self->_containerRuns;
          _NSBlockNumberForIndex(v33, v32, 0);
          v35 = 0;
          if (v33->_gapBlockIndex <= v34)
            v35 = v33->_maxBlocks - v33->_numBlocks;
          v36 = *(_QWORD *)&v33->_runs->var1[(v33->_elementSize + 8) * (v35 + v34)];
          v8 = v127;
        }
        if ((id)v36 != v8)
          goto LABEL_88;
        v37 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v32, (uint64_t *)&value);
        v39 = v38;
        v41 = v40;
        v42 = _NSLayoutTreeLineFragmentDrawsOutsideLineForGlyphAtIndex((uint64_t)self, v32);
        v31 = (char *)value;
        if (!v42 || value >= (char *)value + v137)
          goto LABEL_83;
        v128 = v39 + v41;
        while (1)
        {
          v43 = _NSGlyphTreeNotShownAttributeForGlyphAtIndex((uint64_t)self, (unint64_t)v31);
          v44 = _NSGlyphTreeDrawsOutsideLineFragmentForGlyphAtIndex((uint64_t)self, (unint64_t)v31);
          if ((v43 & 1) != 0 || !v44)
          {
            if (!v44
              || !-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", CFSTR("NSAttachment"), _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, (unint64_t)v31), 0))
            {
              goto LABEL_79;
            }
            -[NSLayoutManager locationForGlyphAtIndex:](self, "locationForGlyphAtIndex:", v31);
            v76 = v75;
            v78 = v77;
            -[NSLayoutManager attachmentSizeForGlyphAtIndex:](self, "attachmentSizeForGlyphAtIndex:", v31);
            v73 = v79;
            v74 = v80;
            v67 = v37 + v76;
            v68 = v39 + v78 - v80;
            v69 = x;
            v70 = y;
            v71 = width;
            v72 = height;
          }
          else
          {
            v45 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, (unint64_t)v31);
            v46 = v45 < self->_cachedFontCharRange.location
               || v45 - self->_cachedFontCharRange.location >= self->_cachedFontCharRange.length;
            if (v46)
            {
              v47 = v45;
              cachedFont = self->_cachedFont;
              v49 = (void *)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", CFSTR("NSFont"), v45, &self->_cachedFontCharRange);
              v134 = 0;
              v135 = 0;
              v50 = (void *)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", CFSTR("CTVerticalForms"), v47, &v134);
              if (!v49)
                v49 = (void *)NSDefaultFont();
              v51 = objc_msgSend(v50, "BOOLValue");
              if (v131)
                v52 = v50 == 0;
              else
                v52 = 0;
              v53 = v52;
              if ((v51 & 1) != 0 || (v54 = (uint64_t)v49, v53))
                v54 = objc_msgSend(v49, "verticalFont");
              if (v54)
                v49 = (void *)v54;
              if (objc_msgSend(v49, "isVertical"))
                v55 = v50 == 0;
              else
                v55 = 1;
              if (!v55 && v135 + v134 < self->_cachedFontCharRange.length + self->_cachedFontCharRange.location)
                self->_cachedFontCharRange.length = v135 + v134 - self->_cachedFontCharRange.location;
              self->_cachedFont = -[NSLayoutManager substituteFontForFont:](self, "substituteFontForFont:", v49);

              -[UIFont boundingRectForFont](self->_cachedFont, "boundingRectForFont");
              v58 = (double *)((char *)self->_extraData + 112);
              *(_QWORD *)v58 = v59;
              v58[1] = -v56 - v57;
              *((_QWORD *)v58 + 2) = v60;
              v58[3] = v57;
            }
            v61 = *((double *)self->_extraData + 14);
            v62 = *((double *)self->_extraData + 15);
            v63 = *((double *)self->_extraData + 16);
            v64 = *((double *)self->_extraData + 17);
            v141.origin.x = x + v61;
            v141.origin.y = v128 + v62;
            v141.size.width = v63;
            v141.size.height = v64;
            v143.origin.x = x;
            v143.origin.y = y;
            v143.size.width = width;
            v143.size.height = height;
            if (!NSIntersectsRect(v141, v143))
              goto LABEL_79;
            -[NSLayoutManager locationForGlyphAtIndex:](self, "locationForGlyphAtIndex:", v31);
            v67 = v37 + v61 + v65;
            v68 = v39 + v62 + v66;
            v69 = x;
            v70 = y;
            v71 = width;
            v72 = height;
            v73 = v63;
            v74 = v64;
          }
          if (NSIntersectsRect(*(NSRect *)&v69, *(NSRect *)&v67))
            break;
LABEL_79:
          if (++v31 >= (char *)value + v137)
          {
            v31 = (char *)value;
            goto LABEL_82;
          }
        }
        v31 = (char *)value;
        v81 = (char *)(&v130[v129] - (_BYTE *)value);
        v129 = (uint64_t)value;
        v130 = v81;
LABEL_82:
        v8 = v127;
LABEL_83:
        if (v31)
        {
          v46 = v30++ >= 0x1D;
          if (!v46)
            continue;
        }
        goto LABEL_88;
      }
    }
    v129 = 0;
LABEL_88:
    v15 = v129;
    v82 = &v130[v129];
    if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
    {
      v83 = *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8);
    }
    else
    {
      _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, (unint64_t)&v130[v129], 1uLL);
      v134 = 0;
      _NSGlyphTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, 0, 0, 0, 0, &v134);
      v83 = v134;
    }
    if ((unint64_t)v82 < v83)
    {
      v84 = 0;
      do
      {
        if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
        {
          v88 = -[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
        }
        else if (-[NSRunStorage count](self->_containerRuns, "count") <= (unint64_t)v82)
        {
          v88 = 0;
        }
        else
        {
          v85 = self->_containerRuns;
          _NSBlockNumberForIndex(v85, (unint64_t)v82, 0);
          v87 = 0;
          if (v85->_gapBlockIndex <= v86)
            v87 = v85->_maxBlocks - v85->_numBlocks;
          v88 = *(_QWORD *)&v85->_runs->var1[(v85->_elementSize + 8) * (v87 + v86)];
          v8 = v127;
        }
        if ((id)v88 != v8)
          break;
        v89 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, (unint64_t)v82, (uint64_t *)&value);
        v91 = v90;
        v92 = _NSLayoutTreeLineFragmentDrawsOutsideLineForGlyphAtIndex((uint64_t)self, (unint64_t)v82);
        v93 = (char *)value;
        v82 = (char *)value + v137;
        if (v92 && value < v82)
        {
          while (1)
          {
            v94 = _NSGlyphTreeNotShownAttributeForGlyphAtIndex((uint64_t)self, (unint64_t)v93);
            v95 = _NSGlyphTreeDrawsOutsideLineFragmentForGlyphAtIndex((uint64_t)self, (unint64_t)v93);
            if ((v94 & 1) == 0)
            {
              if (v95)
                break;
            }
            if (v95
              && -[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", CFSTR("NSAttachment"), _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, (unint64_t)v93), 0))
            {
              -[NSLayoutManager locationForGlyphAtIndex:](self, "locationForGlyphAtIndex:", v93);
              v121 = v120;
              v123 = v122;
              -[NSLayoutManager attachmentSizeForGlyphAtIndex:](self, "attachmentSizeForGlyphAtIndex:", v93);
              v116 = v124;
              v117 = v125;
              v118 = v89 + v121;
              v119 = v91 + v123 - v125;
LABEL_134:
              v142.origin.x = x;
              v142.origin.y = y;
              v142.size.width = width;
              v142.size.height = height;
              if (NSIntersectsRect(v142, *(NSRect *)&v118))
              {
                v130 = (char *)value + v137 - v15;
                v93 = (char *)value + v137 - 1;
              }
            }
            ++v93;
            v82 = (char *)value + v137;
            if (v93 >= (char *)value + v137)
            {
              v8 = v127;
              goto LABEL_138;
            }
          }
          -[NSLayoutManager locationForGlyphAtIndex:](self, "locationForGlyphAtIndex:", v93);
          v97 = v96;
          v99 = v98;
          v100 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, (unint64_t)v93);
          if (v100 < self->_cachedFontCharRange.location
            || v100 - self->_cachedFontCharRange.location >= self->_cachedFontCharRange.length)
          {
            v102 = v100;
            v103 = self->_cachedFont;
            v104 = (void *)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", CFSTR("NSFont"), v100, &self->_cachedFontCharRange);
            v134 = 0;
            v135 = 0;
            v105 = (void *)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", CFSTR("CTVerticalForms"), v102, &v134);
            if (!v104)
              v104 = (void *)NSDefaultFont();
            v106 = objc_msgSend(v105, "BOOLValue");
            if (v131)
              v107 = v105 == 0;
            else
              v107 = 0;
            v108 = v107;
            if ((v106 & 1) != 0 || (v109 = (uint64_t)v104, v108))
              v109 = objc_msgSend(v104, "verticalFont");
            if (v109)
              v104 = (void *)v109;
            if (objc_msgSend(v104, "isVertical"))
              v110 = v105 == 0;
            else
              v110 = 1;
            if (!v110 && v135 + v134 < self->_cachedFontCharRange.length + self->_cachedFontCharRange.location)
              self->_cachedFontCharRange.length = v135 + v134 - self->_cachedFontCharRange.location;
            self->_cachedFont = -[NSLayoutManager substituteFontForFont:](self, "substituteFontForFont:", v104);

            -[UIFont boundingRectForFont](self->_cachedFont, "boundingRectForFont");
            v113 = (double *)((char *)self->_extraData + 112);
            *(_QWORD *)v113 = v114;
            v113[1] = -v111 - v112;
            *((_QWORD *)v113 + 2) = v115;
            v113[3] = v112;
            v15 = v129;
          }
          v116 = *((_QWORD *)self->_extraData + 16);
          v117 = *((double *)self->_extraData + 17);
          v118 = v89 + v97 + *((double *)self->_extraData + 14);
          v119 = v91 + v99 + *((double *)self->_extraData + 15);
          goto LABEL_134;
        }
LABEL_138:
        if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) == 0)
        {
          _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, (unint64_t)v82, 1uLL);
          v134 = 0;
          _NSGlyphTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, 0, 0, 0, 0, &v134);
          v83 = v134;
        }
        if ((unint64_t)v82 >= v83)
          break;
        v46 = v84++ >= 0x1D;
      }
      while (!v46);
    }
    -[NSLayoutManager _resetCachedTextContainer](self, "_resetCachedTextContainer");
    v14 = (NSUInteger)v130;
  }
LABEL_144:
  v126 = v15;
  result.length = v14;
  result.location = v126;
  return result;
}

- (void)_firstTextViewChanged
{
  NSMutableArray *textContainers;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  id v9;
  id *p_firstTextView;
  uint64_t v11;
  id v12;
  int v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const __CFString *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  textContainers = self->_textContainers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](textContainers, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(textContainers);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "textView");
        if (v8)
        {
          v9 = (id)v8;
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](textContainers, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:
  p_firstTextView = &self->_firstTextView;
  if (v9 != self->_firstTextView)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = objc_msgSend(*p_firstTextView, "delegate");
    else
      v11 = 0;
    v12 = *p_firstTextView;
    *((_OWORD *)self->_extraData + 22) = xmmword_18D6CBB80;
    if (v11)
    {
      if ((NSLayoutManager *)objc_msgSend(v12, "layoutManager") == self && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(*p_firstTextView, "setDelegate:", 0);
      *p_firstTextView = objc_storeWeak(&self->_firstTextView, v9);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(*p_firstTextView, "setDelegate:", v11);
      if (*p_firstTextView)
        goto LABEL_22;
    }
    else
    {
      v14 = objc_storeWeak(&self->_firstTextView, v9);
      *p_firstTextView = v14;
      if (v14)
      {
LABEL_22:
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v13 = 0x10000000;
        else
          v13 = 0;
LABEL_27:
        *((_DWORD *)self->_extraData + 112) = *((_DWORD *)self->_extraData + 112) & 0xEFFFFFFF | v13;
        if (v9 && v12)
        {
          v15 = (void *)MEMORY[0x1E0C99D80];
          v19 = CFSTR("NSNewNotifyingTextView");
          v20 = 0;
          v18 = v9;
        }
        else
        {
          if (!v12)
          {
            if (!v9)
            {
              v17 = 0;
              goto LABEL_34;
            }
            v16 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v9, CFSTR("NSNewNotifyingTextView"), 0, v19, v20);
LABEL_33:
            v17 = v16;
LABEL_34:
            objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSTextViewWillChangeNotifyingTextViewNotification"), v12, v17);
            return;
          }
          v15 = (void *)MEMORY[0x1E0C99D80];
          v18 = 0;
        }
        v16 = objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v12, CFSTR("NSOldNotifyingTextView"), v18, v19, v20);
        goto LABEL_33;
      }
    }
    v13 = 0;
    goto LABEL_27;
  }
}

- (void)_drawBackgroundForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  NSUInteger length;
  NSUInteger location;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  NSLayoutManager *v12;
  int64_t v13;
  _BOOL4 v14;
  _BOOL4 v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSRunStorage *containerRuns;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  NSUInteger v58;
  NSUInteger v59;
  unint64_t v60;
  NSUInteger v61;
  char v63;
  uint64_t v64;
  uint64_t v65;
  NSRange v66;
  NSTextStorage *textStorage;
  NSUInteger v69;
  NSUInteger v70;
  NSRange v71;
  void *v72;
  NSDictionary *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  double *v77;
  unint64_t v78;
  double v79;
  NSUInteger v80;
  NSUInteger v81;
  NSUInteger v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  NSUInteger v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  NSRange v90;
  NSUInteger v91;
  NSRange v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  double *v97;
  double v98;
  double v99;
  double v100;
  double v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  double *v106;
  unint64_t v107;
  double v108;
  unsigned int v109;
  unsigned int v110;
  int64_t v111;
  _BOOL4 v112;
  uint64_t v113;
  NSUInteger v114;
  NSUInteger v115;
  NSUInteger range2;
  CGContext *range2_8;
  int v118;
  NSLayoutManager *v119;
  NSRange v120;
  unint64_t v121;
  NSRange v122;
  NSRange v123;
  NSRange v124;
  NSRange v125;
  NSRange v126;
  NSRange v127;
  CGRect v128;
  CGRect v129;

  y = a4.y;
  x = a4.x;
  length = a3.length;
  location = a3.location;
  v9 = (void *)-[objc_class graphicsContextForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "graphicsContextForApplicationFrameworkContext:", -[NSLayoutManager applicationFrameworkContext](self, "applicationFrameworkContext"));
  range2_8 = (CGContext *)objc_msgSend(v9, "CGContext");
  v122 = (NSRange)xmmword_18D6CBB80;
  v10 = objc_msgSend(v9, "isDrawingToScreen");
  v119 = self;
  if ((*((_BYTE *)&self->_lmFlags + 3) & 0x10) != 0)
    v118 = objc_msgSend(v9, "isFlipped");
  else
    v118 = 1;
  v11 = _os_feature_enabled_impl();
  v12 = self;
  v13 = -[NSLayoutManager applicationFrameworkContext](self, "applicationFrameworkContext");
  v14 = -[NSTextStorage _lockForReading](self->_textStorage, "_lockForReading");
  v15 = v14;
  if (length)
  {
    v124.location = 0;
    v124.length = 0;
    v123.location = 0;
    v123.length = 0;
    v121 = 0;
    _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)v119, location, length);
    v16 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](v119, "characterRangeForGlyphRange:actualGlyphRange:", location, length, 0);
    v18 = v17;
    if ((*((_BYTE *)&v119->_lmFlags + 3) & 0x40) != 0)
    {
      v113 = -[NSMutableArray objectAtIndex:](v119->_textContainers, "objectAtIndex:", 0);
    }
    else if (-[NSRunStorage count](v119->_containerRuns, "count") <= location)
    {
      v113 = 0;
    }
    else
    {
      containerRuns = v119->_containerRuns;
      _NSBlockNumberForIndex(containerRuns, location, 0);
      v21 = 0;
      if (containerRuns->_gapBlockIndex <= v20)
        v21 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
      v113 = *(_QWORD *)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v21 + v20)];
      v12 = v119;
    }
    CGContextSaveGState(range2_8);
    CGContextSetShouldAntialias(range2_8, 0);
    v112 = v15;
    range2 = v16;
    if (v16 < v16 + v18)
    {
      v114 = v16 + v18;
      v115 = v18;
      v109 = v10;
      v110 = v11;
      v111 = v13;
      while (1)
      {
        v22 = (void *)objc_msgSend((id)-[NSTextStorage attribute:atIndex:longestEffectiveRange:inRange:](v12->_textStorage, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSParagraphStyle"), v16, &v124, range2, v115), "textBlocks");
        if (v22)
        {
          v23 = v22;
          v24 = objc_msgSend(v22, "count");
          if (v24)
            break;
        }
LABEL_42:
        v16 = v124.length + v124.location;
        if (v124.length + v124.location >= v114)
        {
          v57 = 0;
          v58 = range2;
          v11 = v110;
          v59 = v114;
          do
          {
            v60 = objc_msgSend(v12->_firstTextView, "markedRange");
            if (v58 < v60 || v58 - v60 >= v61)
              v63 = 1;
            else
              v63 = v110;
            if ((v63 & 1) != 0)
            {
              v66 = v122;
              if (v58 < v122.location || v58 - v122.location >= v122.length)
              {
                v70 = range2;
                textStorage = v12->_textStorage;
                v69 = v115;
                v57 = -[NSTextStorage attribute:atIndex:longestEffectiveRange:inRange:](textStorage, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSBackgroundColor"), v58, &v122, range2, v115);
                v66 = v122;
              }
              else
              {
                v69 = v115;
                v70 = range2;
              }
              v126.location = v70;
              v126.length = v69;
              v71 = NSIntersectionRange(v66, v126);
              v124 = v71;
              if ((v109 & 1) != 0 || (v72 = (void *)v57, (*((_BYTE *)v119->_extraData + 449) & 0x10) != 0))
              {
                v73 = -[NSLayoutManager temporaryAttributesAtCharacterIndex:longestEffectiveRange:inRange:](v119, "temporaryAttributesAtCharacterIndex:longestEffectiveRange:inRange:", v58, &v123, v71.location, v71.length);
                if ((*((_BYTE *)v119->_extraData + 449) & 0x10) != 0)
                  v73 = (NSDictionary *)objc_msgSend(-[NSLayoutManager delegate](v119, "delegate"), "layoutManager:shouldUseTemporaryAttributes:forDrawingToScreen:atCharacterIndex:effectiveRange:", v119, v73, v109, v58, &v123);
                v124 = NSIntersectionRange(v124, v123);
                v72 = (void *)v57;
                if (v73)
                {
                  v74 = -[NSDictionary objectForKey:](v73, "objectForKey:", CFSTR("NSBackgroundColor"));
                  if (v74)
                    v72 = (void *)v74;
                  else
                    v72 = (void *)v57;
                }
              }
              v12 = v119;
              if (v72)
              {
                if ((objc_msgSend(v72, "isEqual:", 0) & 1) == 0)
                {
                  objc_msgSend(-[NSLayoutManager renderingColorForDocumentColor:](v119, "renderingColorForDocumentColor:", v72), "set");
                  v75 = -[NSLayoutManager rectArrayForCharacterRange:withinSelectedCharacterRange:inTextContainer:rectCount:](v119, "rectArrayForCharacterRange:withinSelectedCharacterRange:inTextContainer:rectCount:", v124.location, v124.length, 0x7FFFFFFFFFFFFFFFLL, 0, v113, &v121);
                  v76 = v121;
                  if (v121)
                  {
                    v77 = (double *)v75;
                    v78 = v121;
                    do
                    {
                      *v77 = x + *v77;
                      if (v118)
                        v79 = y + v77[1];
                      else
                        v79 = y - (v77[1] + v77[3]);
                      v77[1] = v79;
                      v77 += 4;
                      --v78;
                    }
                    while (v78);
                    if (v76)
                      -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](v119, "fillBackgroundRectArray:count:forCharacterRange:color:", v75, v76, v124.location, v124.length, v72);
                  }
                }
              }
              v58 = v124.length + v124.location;
              v59 = v114;
            }
            else
            {
              v64 = objc_msgSend(v12->_firstTextView, "markedRange");
              v58 = v64 + v65;
            }
          }
          while (v58 < v59);
          v13 = v111;
          v18 = v115;
          goto LABEL_79;
        }
      }
      v25 = v24;
      if (v16 <= range2)
      {
        v27 = 0;
      }
      else
      {
        v26 = (void *)objc_msgSend((id)-[NSTextStorage attribute:atIndex:effectiveRange:](v12->_textStorage, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v16 - 1, 0), "textBlocks");
        v27 = v26;
        if (v26)
        {
          v28 = objc_msgSend(v26, "count");
          goto LABEL_23;
        }
      }
      v28 = 0;
LABEL_23:
      v29 = 0;
      v30 = 1;
      do
      {
        v31 = (void *)objc_msgSend(v23, "objectAtIndex:", v29);
        v32 = v30 & (v29 < v28);
        if (v32 == 1 && v31 == (void *)objc_msgSend(v27, "objectAtIndex:", v29))
        {
          v30 = 1;
        }
        else
        {
          v33 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](v12, "glyphRangeForCharacterRange:actualCharacterRange:", v16, 1, 0);
          v120.location = 0;
          v120.length = 0;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v34 = (void *)objc_msgSend(v31, "table");
            if (!v32
              || (v35 = (void *)objc_msgSend(v27, "objectAtIndex:", v29),
                  objc_opt_class(),
                  (objc_opt_isKindOfClass() & 1) == 0)
              || v34 != (void *)objc_msgSend(v35, "table"))
            {
              -[NSLayoutManager boundsRectForTextBlock:atIndex:effectiveRange:](v119, "boundsRectForTextBlock:atIndex:effectiveRange:", v34, v33, &v120);
              if (v120.length)
              {
                v40 = v36;
                v41 = v37;
                v42 = v38;
                v43 = v39;
                if (!NSIsEmptyRect(*(NSRect *)&v36))
                {
                  v44 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](v119, "characterRangeForGlyphRange:actualGlyphRange:", v120.location, v120.length, 0);
                  objc_msgSend(v34, "drawBackgroundWithFrame:inView:characterRange:layoutManager:", 0, v44, v45, v119, x + v40, y + v41, v42, v43);
                }
              }
            }
          }
          v12 = v119;
          -[NSLayoutManager boundsRectForTextBlock:atIndex:effectiveRange:](v119, "boundsRectForTextBlock:atIndex:effectiveRange:", v31, v33, &v120);
          if (v120.length)
          {
            v50 = v46;
            v51 = v47;
            v52 = v48;
            v53 = v49;
            if (!NSIsEmptyRect(*(NSRect *)&v46))
            {
              v55 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](v119, "characterRangeForGlyphRange:actualGlyphRange:", v120.location, v120.length, 0);
              v56 = -(v51 + v53);
              if (v118)
                v56 = v51;
              objc_msgSend(v31, "drawBackgroundWithFrame:inView:characterRange:layoutManager:", 0, v55, v54, v119, x + v50, y + v56, v52, v53);
            }
          }
          v30 = 0;
        }
        ++v29;
      }
      while (v25 != v29);
      goto LABEL_42;
    }
LABEL_79:
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_109;
    v80 = objc_msgSend(v119->_firstTextView, "markedRange");
    v82 = v81;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v83 = (void *)objc_msgSend(v119->_firstTextView, "attributedSubstringForMarkedRange");
      if (!v82)
      {
LABEL_109:
        CGContextRestoreGState(range2_8);
        if (v112)
          -[NSTextStorage _unlock](v119->_textStorage, "_unlock");
        return;
      }
    }
    else
    {
      v83 = 0;
      if (!v82)
        goto LABEL_109;
    }
    v125.location = v80;
    v125.length = v82;
    v127.location = range2;
    v127.length = v18;
    v124 = NSIntersectionRange(v125, v127);
    if (!v124.length)
      goto LABEL_109;
    if (v83)
    {
      v84 = objc_msgSend(v83, "length");
      if (v124.length)
      {
        v85 = v84;
        v86 = v124.location;
        do
        {
          v87 = objc_msgSend(v83, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSBackgroundColor"), v86 - v80, &v123, 0, v85);
          if (v87)
            v88 = 1;
          else
            v88 = v11;
          if ((v88 & 1) == 0)
            v87 = objc_msgSend((Class)getNSColorClass_0[0](), "_markedTextBackgroundColor");
          v120.location = 0;
          v120.length = 0;
          v89 = objc_msgSend(v83, "attribute:atIndex:longestEffectiveRange:inRange:", NSMarkedClauseSegmentAttributeName, v124.location - v80, &v120, 0, v85);
          v90 = v123;
          if (v89)
          {
            v90 = NSIntersectionRange(v90, v120);
            v123.length = v90.length;
          }
          v90.location += v80;
          v123.location = v90.location;
          v92 = NSIntersectionRange(v90, v124);
          v91 = v92.length;
          v123 = v92;
          if (v87)
          {
            objc_msgSend(-[NSLayoutManager renderingColorForDocumentColor:](v119, "renderingColorForDocumentColor:", v87), "set");
            v93 = -[NSLayoutManager rectArrayForCharacterRange:withinSelectedCharacterRange:inTextContainer:rectCount:](v119, "rectArrayForCharacterRange:withinSelectedCharacterRange:inTextContainer:rectCount:", v123.location, v123.length, v80, v82, v113, &v121);
            if (v121)
            {
              v94 = v93;
              v95 = v11;
              v96 = 0;
              v97 = (double *)(v93 + 16);
              do
              {
                v98 = x + *(v97 - 2);
                *(v97 - 2) = v98;
                if (v118)
                {
                  v99 = y + *(v97 - 1);
                  *(v97 - 1) = v99;
                  v100 = v97[1];
                }
                else
                {
                  v100 = v97[1];
                  v99 = y - (*(v97 - 1) + v100);
                  *(v97 - 1) = v99;
                }
                v101 = *v97;
                v128 = CGContextConvertRectToDeviceSpace(range2_8, *(CGRect *)&v98);
                v128.origin.x = round(v128.origin.x);
                v128.size.width = round(v128.size.width);
                *(CGRect *)(v97 - 2) = v128;
                v129 = CGContextConvertRectToUserSpace(range2_8, v128);
                *(CGRect *)(v97 - 2) = v129;
                if (v129.size.width > 1.0)
                  *v97 = v129.size.width + -1.0;
                ++v96;
                v97 += 4;
              }
              while (v96 < v121);
              v91 = v123.length;
              v11 = v95;
              if (v121)
              {
                -[NSLayoutManager fillMarkedBackgroundRectArray:count:forCharacterRange:color:](v119, "fillMarkedBackgroundRectArray:count:forCharacterRange:color:", v94);
                v91 = v123.length;
              }
            }
            else
            {
              v91 = v123.length;
            }
          }
          v86 = v124.location + v91;
          v124.location += v91;
          v124.length -= v91;
        }
        while (v124.length);
      }
      goto LABEL_109;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v102 = (void *)objc_msgSend(v119->_firstTextView, "markedTextAttributes");
    else
      v102 = 0;
    v103 = objc_msgSend(v102, "objectForKey:", CFSTR("NSBackgroundColor"));
    if (!v103 && v13 != 2)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_109;
      v103 = objc_msgSend((id)objc_msgSend(v119->_firstTextView, "markedTextStyle"), "objectForKey:", CFSTR("NSBackgroundColor"));
      if (v103)
        goto LABEL_121;
      v103 = objc_msgSend((Class)getNSColorClass_0[0](), "_markedTextBackgroundColor");
    }
    if (!v103)
      goto LABEL_109;
LABEL_121:
    objc_msgSend(-[NSLayoutManager renderingColorForDocumentColor:](v119, "renderingColorForDocumentColor:", v103), "set");
    v104 = -[NSLayoutManager rectArrayForCharacterRange:withinSelectedCharacterRange:inTextContainer:rectCount:](v119, "rectArrayForCharacterRange:withinSelectedCharacterRange:inTextContainer:rectCount:", v124.location, v124.length, v80, v82, v113, &v121);
    v105 = v121;
    if (v121)
    {
      v106 = (double *)v104;
      v107 = v121;
      do
      {
        *v106 = x + *v106;
        if (v118)
          v108 = y + v106[1];
        else
          v108 = y - (v106[1] + v106[3]);
        v106[1] = v108;
        v106 += 4;
        --v107;
      }
      while (v107);
      if (v105)
        -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](v119, "fillBackgroundRectArray:count:forCharacterRange:color:", v104, v105, v124.location, v124.length, v103);
    }
    goto LABEL_109;
  }
  if (v14)
    -[NSTextStorage _unlock](v119->_textStorage, "_unlock");
}

- (id)selectedTextAttributesForCharacterAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  NSUInteger v7;

  if (a4)
  {
    v7 = -[NSTextStorage length](self->_textStorage, "length");
    a4->location = 0;
    a4->length = v7;
  }
  if (-[NSLayoutManager delegate](self, "delegate")
    && (-[NSLayoutManager delegate](self, "delegate"), (objc_opt_respondsToSelector() & 1) != 0))
  {
    return (id)objc_msgSend(-[NSLayoutManager delegate](self, "delegate"), "layoutManager:shouldUseSelectedTextAttributes:atCharacterIndex:effectiveRange:", self, 0, a3, a4);
  }
  else
  {
    return 0;
  }
}

- (char)_packedGlyphs:(unint64_t)a3 range:(_NSRange)a4 length:(unint64_t *)a5
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v9;
  char *glyphBuffer;
  uint64_t PackedGlyphsInRange;

  length = a4.length;
  location = a4.location;
  v9 = 2 * a4.length + 2;
  if (self->_glyphBufferSize < v9)
  {
    self->_glyphBuffer = (char *)NSReallocateCollectable(self->_glyphBuffer, 2 * a4.length + 2, 0);
    if (!self->_glyphBuffer)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99850], CFSTR("*** %@, _getGlyphBuffer(): NSZoneMalloc failed!"), objc_opt_class());
    self->_glyphBufferSize = v9;
  }
  glyphBuffer = self->_glyphBuffer;
  if (length)
    _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, location, length);
  PackedGlyphsInRange = _NSGlyphTreeGetPackedGlyphsInRange((uint64_t)self, location, length, glyphBuffer);
  if (a5)
    *a5 = 2 * PackedGlyphsInRange;
  return glyphBuffer;
}

- (void)_drawGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  CGContext *v15;
  uint64_t v16;
  int v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  NSUInteger v22;
  _QWORD *v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSUInteger v30;
  NSUInteger v31;
  uint64_t v32;
  NSUInteger v33;
  NSUInteger v34;
  unint64_t v35;
  NSUInteger v36;
  uint64_t v37;
  NSUInteger v38;
  void *v39;
  char v40;
  double v41;
  double v42;
  double v43;
  double v44;
  unint64_t location;
  void *v47;
  long double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  BOOL v56;
  int v57;
  void *v58;
  NSRange v59;
  NSRange v60;
  NSRange v62;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  NSRange v68;
  void *v69;
  void *v70;
  double v71;
  uint64_t v72;
  uint64_t v73;
  NSRange v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  NSUInteger v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  NSUInteger v88;
  void *v89;
  void *v90;
  uint64_t v91;
  NSUInteger v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  NSUInteger v98;
  NSUInteger v99;
  void *v100;
  uint64_t v101;
  unint64_t v102;
  NSUInteger v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  BOOL v111;
  NSUInteger v112;
  double v113;
  double v114;
  double v115;
  NSUInteger v116;
  uint64_t v117;
  uint64_t v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  uint64_t v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  NSUInteger v132;
  NSUInteger v133;
  NSUInteger v134;
  NSRange v135;
  uint64_t v136;
  double v137;
  double v138;
  BOOL v139;
  double v140;
  void *v141;
  double v142;
  double v143;
  double v144;
  unint64_t v145;
  int v146;
  unint64_t v147;
  unint64_t v148;
  double v149;
  double v150;
  double v151;
  int v152;
  NSUInteger v153;
  NSUInteger v154;
  NSUInteger v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  _QWORD *v173;
  unint64_t v174;
  uint64_t v175;
  uint64_t v176;
  double *v177;
  uint64_t v178;
  uint64_t v179;
  __NSLMMarkedTextUnderlineRenderer *v180;
  int v181;
  double v185;
  uint64_t v186;
  double v187;
  double v188;
  double v189;
  double v190;
  NSUInteger v191;
  NSUInteger v192;
  NSRange v193;
  NSUInteger v194;
  NSRange v195;
  uint64_t v196;
  NSUInteger v197;
  CGAffineTransform *v198;
  _WORD *v199;
  NSUInteger v200;
  NSRange v201;
  NSUInteger v202;
  NSUInteger v203;
  uint64_t v204;
  uint64_t PackedGlyphsInRange;
  uint64_t v206;
  int v207;
  const __CTFont *v208;
  double v209;
  double *v210;
  double *v211;
  double v212;
  double v213;
  NSUInteger v214;
  double v215;
  double v216;
  double v217;
  double v218;
  unint64_t v219;
  _BOOL8 v220;
  unint64_t v221;
  char v222;
  _BOOL4 v223;
  double v225;
  double v226;
  CGPath *Mutable;
  CGFloat v228;
  CGFloat v229;
  CGFloat d;
  CGFloat v231;
  double v232;
  double v233;
  double v234;
  double v235;
  CGTextDrawingMode v236;
  uint64_t v237;
  double v238;
  double v239;
  double v240;
  double v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  const __CFString *v245;
  uint64_t v246;
  NSUInteger v247;
  NSUInteger v248;
  NSUInteger v249;
  NSRange v250;
  uint64_t v251;
  const __CFURL *v252;
  unint64_t v253;
  uint64_t v254;
  CGFloat v255;
  unint64_t v256;
  CGFloat *v257;
  CGFloat v258;
  double v259;
  double v260;
  double v261;
  double v262;
  NSUInteger v263;
  BOOL v264;
  unint64_t v265;
  _QWORD *v266;
  uint64_t v267;
  CGFloat v268;
  int v269;
  NSUInteger range1;
  uint64_t v271;
  CGFloat v272;
  int v273;
  void *v274;
  char v275;
  double width;
  NSUInteger v277;
  NSUInteger v278;
  double y;
  void *v280;
  __NSLMMarkedTextUnderlineRenderer *v281;
  uint64_t v282;
  double v283;
  NSUInteger v284;
  NSUInteger v285;
  NSUInteger v286;
  NSUInteger v287;
  NSUInteger v288;
  NSUInteger v289;
  double v290;
  void *v291;
  uint64_t v292;
  CGFloat v293;
  uint64_t v294;
  __int128 v295;
  CGFloat b;
  CGFloat a;
  uint64_t v298;
  void *v299;
  uint64_t v300;
  double v301;
  void *v302;
  int v303;
  CGContext *c;
  uint64_t v305;
  void *v306;
  const __CTFont *v307;
  void *v308;
  NSUInteger v309;
  double v310;
  uint64_t v311;
  CGFloat aPoint;
  CGFloat v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  CGFloat aRect;
  CGFloat v318;
  CGFloat v319;
  CGFloat v320;
  uint64_t v321;
  void *v322;
  uint64_t v323;
  void *v324;
  int v325;
  CGFloat v326;
  double v327;
  double bRect;
  double v329;
  void *v330;
  NSUInteger v331;
  NSUInteger length;
  NSUInteger v333;
  void *v334;
  NSUInteger v335;
  unint64_t v336;
  NSUInteger v337;
  uint64_t v338;
  void *v339;
  int v340;
  CGAffineTransform v341;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform characters;
  __int128 v345;
  __int128 v346;
  NSRange v347;
  double v348;
  double v349;
  CGGlyph glyphs;
  __int128 v351;
  NSRange v352;
  NSRange v353;
  NSRange range2;
  NSRange v355;
  double v356;
  double v357;
  NSUInteger v358;
  uint64_t v359;
  CGAffineTransform v360[85];
  _WORD v361[256];
  uint64_t v362;
  NSRange v363;
  NSRange v364;
  NSRange v365;
  NSRange v366;
  NSRange v367;
  NSRange v368;
  NSRange v369;
  NSRange v370;
  NSRange v371;
  NSPoint v372;
  NSPoint v373;
  NSRect v374;
  CGRect v375;
  CGRect v376;
  NSRect v377;

  v9 = ((double (*)(NSLayoutManager *, SEL, NSUInteger, NSUInteger, uint64_t, uint64_t, uint64_t, __n128, __n128))MEMORY[0x1E0C80A78])(self, a2, a3.location, a3.length, v4, v5, v6, (__n128)a4, *(__n128 *)&a4.y);
  v310 = v10;
  v290 = v9;
  v362 = *MEMORY[0x1E0C80C00];
  v336 = v11;
  if (v11)
  {
    v12 = v8;
    v13 = v7;
    v273 = objc_msgSend(*(id *)(v7 + 8), "_lockForReading");
    v275 = _os_feature_enabled_impl();
    v338 = v13;
    v14 = (void *)-[objc_class graphicsContextForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "graphicsContextForApplicationFrameworkContext:", objc_msgSend((id)v13, "applicationFrameworkContext"));
    v15 = (CGContext *)objc_msgSend(v14, "CGContext");
    v355 = (NSRange)xmmword_18D6CBB80;
    range2 = (NSRange)xmmword_18D6CBB80;
    v353 = (NSRange)xmmword_18D6CBB80;
    v352 = (NSRange)xmmword_18D6CBB80;
    v16 = MEMORY[0x1E0C9BAA8];
    v351 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v303 = objc_msgSend((id)objc_msgSend((id)v13, "typesetter"), "_allowsEllipsisGlyphSubstitution");
    if ((*(_BYTE *)(v13 + 67) & 0x10) != 0)
      v340 = objc_msgSend(v14, "isFlipped");
    else
      v340 = 1;
    v17 = objc_msgSend((id)v13, "_drawsDebugBaselines");
    v18 = 0.0;
    if (v17)
    {
      memset(v360, 0, 48);
      CGContextGetCTM(v360, v15);
      v19 = fabs(v360[0].a * v360[0].d - v360[0].b * v360[0].c);
      v20 = 1.0 / sqrt(v19);
      if (v19 <= 0.001)
        v18 = 1.0;
      else
        v18 = v20;
    }
    v269 = v17;
    if (_drawGlyphsForGlyphRange_atPoint__configureOnce != -1)
      dispatch_once(&_drawGlyphsForGlyphRange_atPoint__configureOnce, &__block_literal_global_118);
    _NSFastFillAllLayoutHolesForGlyphRange(v13, v12, v336);
    v21 = objc_msgSend((id)v13, "characterRangeForGlyphRange:actualGlyphRange:", v12, v336, 0);
    v331 = v22;
    v335 = v21;
    if ((*(_BYTE *)(v13 + 67) & 0x40) != 0)
    {
      v26 = (void *)objc_msgSend(*(id *)(v13 + 32), "objectAtIndex:", 0);
    }
    else if (objc_msgSend(*(id *)(v13 + 48), "count") <= v12)
    {
      v26 = 0;
    }
    else
    {
      v23 = *(_QWORD **)(v13 + 48);
      _NSBlockNumberForIndex(v23, v12, 0);
      if (v23[11] <= v24)
        v25 = v23[4] - v23[3];
      else
        v25 = 0;
      v26 = *(void **)(v23[7] + (v23[2] + 8) * (v25 + v24) + 8);
    }
    v27 = objc_msgSend(v26, "layoutOrientation");
    objc_msgSend((id)v13, "_setCachedTextContainer:isVertical:", v26, v27 != 0);
    v292 = v27;
    v274 = v26;
    v28 = *(void **)(v13 + 104);
    c = v15;
    v291 = v14;
    v268 = v18;
    if (v28)
    {
      v29 = objc_msgSend(v28, "markedRange");
      v31 = v30;
      if (NSIntersectsRange() && (objc_opt_respondsToSelector() & 1) != 0)
        v280 = (void *)objc_msgSend(*(id *)(v13 + 104), "attributedSubstringForMarkedRange");
      else
        v280 = 0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v32 = objc_msgSend(*(id *)(v13 + 104), "selectedRange");
        v34 = v33;
        v35 = v12;
        v36 = v31;
        v37 = v29;
        v38 = v34;
      }
      else
      {
        v35 = v12;
        v38 = 0;
        v32 = 0x7FFFFFFFFFFFFFFFLL;
        v36 = v31;
        v37 = v29;
      }
    }
    else
    {
      v35 = v12;
      v280 = 0;
      v38 = 0;
      v36 = 0;
      v32 = 0x7FFFFFFFFFFFFFFFLL;
      v37 = 0x7FFFFFFFFFFFFFFFLL;
    }
    length = 0;
    v281 = 0;
    v282 = 0;
    v287 = 0;
    v272 = 0.0;
    v339 = 0;
    v39 = 0;
    v306 = 0;
    v311 = 0;
    v330 = 0;
    v324 = 0;
    v40 = 0;
    v334 = 0;
    v315 = 0;
    v322 = 0;
    v316 = 0;
    v314 = 0;
    v321 = 0;
    v323 = 0;
    v299 = 0;
    v300 = 0;
    v308 = 0;
    v302 = 0;
    v298 = 0;
    v305 = 0;
    v294 = 0;
    b = *(double *)(v16 + 8);
    a = *(double *)v16;
    v295 = *(_OWORD *)(v16 + 16);
    v41 = *(double *)(MEMORY[0x1E0CB3438] + 8);
    v313 = *MEMORY[0x1E0CB3430];
    aPoint = *(double *)(MEMORY[0x1E0CB3430] + 8);
    v42 = *MEMORY[0x1E0CB3440];
    v43 = *(double *)(MEMORY[0x1E0CB3440] + 8);
    if (v340)
      v44 = -1.0;
    else
      v44 = 1.0;
    v301 = 0.0;
    v293 = 0.0;
    v320 = *MEMORY[0x1E0CB3438];
    v329 = *MEMORY[0x1E0CB3438];
    v319 = *(double *)(MEMORY[0x1E0CB3438] + 8);
    v318 = *(double *)(MEMORY[0x1E0CB3438] + 16);
    v327 = v318;
    aRect = *(double *)(MEMORY[0x1E0CB3438] + 24);
    bRect = aRect;
    v289 = v36;
    v309 = v37;
    v277 = v37 + v36;
    v285 = v32;
    v278 = v32 + v38;
    location = 0x7FFFFFFFFFFFFFFFLL;
    v288 = 0x7FFFFFFFFFFFFFFFLL;
    range1 = v38;
    v271 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      v337 = v35;
      v325 = _NSGlyphTreeNotShownAttributeForGlyphAtIndex(v13, v35);
      if (v335 < range2.location || v335 - range2.location >= range2.length)
      {
        v339 = (void *)objc_msgSend(*(id *)(v13 + 8), "attributesAtIndex:longestEffectiveRange:inRange:", v335, &range2, v335, v331);
        if (v325)
          v306 = (void *)objc_msgSend(v339, "objectForKey:", CFSTR("NSAttachment"));
        else
          v306 = 0;
        v311 = objc_msgSend(v339, "objectForKey:", CFSTR("NSLink"));
        v47 = (void *)objc_msgSend(v339, "objectForKey:", CFSTR("NSExpansion"));
        if (v47)
        {
          objc_msgSend(v47, "doubleValue");
          v49 = exp(v48);
        }
        else
        {
          v49 = 1.0;
        }
        v301 = v49;
        if (_drawGlyphsForGlyphRange_atPoint__isBidiDebugging)
        {
          v50 = (void *)objc_msgSend(v339, "objectForKey:", CFSTR("NSWritingDirection"));
          v51 = v50;
          if (v50)
          {
            if (objc_msgSend(v50, "count"))
              v52 = v51;
            else
              v52 = 0;
            v324 = v52;
          }
          else
          {
            v324 = 0;
          }
        }
        v53 = (void *)objc_msgSend(v339, "objectForKey:", CFSTR("NSFont"));
        if (!v53)
          v53 = (void *)NSDefaultFont();
        v54 = (void *)objc_msgSend(v339, "objectForKey:", CFSTR("CTVerticalForms"));
        v55 = objc_msgSend(v54, "BOOLValue");
        if (v292)
          v56 = v54 == 0;
        else
          v56 = 0;
        if (v56)
          v57 = 1;
        else
          v57 = v55;
        v58 = v53;
        if (v57 == 1)
          v58 = (void *)objc_msgSend(v53, "verticalFont");
        if (!v58)
          v58 = v53;
        v330 = v58;
        v40 = objc_msgSend(v58, "isVertical");
        if (v330)
        {
          objc_msgSend(v330, "_textMatrixTransformForContext:", v291);
          b = v360[0].b;
          a = v360[0].a;
          v295 = *(_OWORD *)&v360[0].c;
        }
        else
        {
          v295 = 0uLL;
          b = 0.0;
          a = 0.0;
          memset(v360, 0, 48);
        }
        v351 = *(_OWORD *)&v360[0].tx;
      }
      v59 = v355;
      v60.location = v335;
      if (v335 < v355.location || v335 - v355.location >= v355.length)
        break;
      v60.length = v331;
      v355 = NSIntersectionRange(v60, v59);
      v363.location = v337;
      v363.length = v336;
      v367.location = location;
      v367.length = length;
      v68 = NSIntersectionRange(v363, v367);
      length = v68.length;
      location = v68.location;
LABEL_161:
      if (location < v352.location || location - v352.location >= v352.length)
      {
        v329 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex(v13, location, (uint64_t *)&v352);
        v327 = v104;
        bRect = v105;
        v41 = v106;
      }
      objc_msgSend((id)v13, "locationForGlyphAtIndex:", location);
      v108 = v107;
      v110 = v109;
      if (!v337)
        goto LABEL_171;
      v374.origin.x = v320;
      v374.origin.y = v319;
      v374.size.width = v318;
      v374.size.height = aRect;
      v377.origin.x = v329;
      v377.origin.y = v41;
      v377.size.width = v327;
      v377.size.height = bRect;
      if (!NSEqualRects(v374, v377))
        goto LABEL_171;
      v372.x = v313;
      v372.y = aPoint;
      v373.x = v108;
      v373.y = v110;
      if (NSEqualPoints(v372, v373))
      {
        v35 = v352.length + v352.location;
        v112 = v336 + v337 - (v352.length + v352.location);
        v111 = v336 + v337 > v352.length + v352.location;
        if (v336 + v337 < v352.length + v352.location)
          v112 = 0;
        v336 = v112;
        if (!v111)
          goto LABEL_399;
      }
      else
      {
LABEL_171:
        v113 = v290 + v329;
        v114 = v290 + v329 + v108;
        v115 = v41 + v110;
        if (!v340)
          v115 = -(v41 + v110);
        v283 = v115;
        v286 = v355.location;
        v116 = v355.length;
        if (v308 && length)
        {
          v117 = objc_msgSend(v308, "integerValue");
          if (v117 <= 0)
            v118 = -(-v117 & 3);
          else
            v118 = v117 & 3;
          v119 = _NSLayoutTreeLineFragmentUsedRectForGlyphAtIndex(v338, location, 0);
          v121 = v120;
          v123 = v122;
          width = (double)v118;
          v124 = objc_msgSend(v308, "integerValue", v119) & 0x3000;
          if (v124 || (v124 = objc_msgSend(v322, "integerValue") & 0x3000) != 0)
          {
            if (v124 == 12288)
            {
              v128 = bRect + v41;
              if (v340)
              {
                v322 = 0;
                v129 = v310 + v128;
                v130 = -1.0;
                goto LABEL_190;
              }
              v322 = 0;
              v140 = v128 + -1.0;
            }
            else
            {
              if (v124 == 4096)
                goto LABEL_182;
              if (v340)
              {
                v322 = 0;
                v129 = v310 + v41;
                v130 = 1.0;
LABEL_190:
                v131 = v129 + v130;
LABEL_212:
                y = v131;
                if (objc_msgSend((id)v338, "_hasSeenRightToLeft"))
                {
                  v144 = v114 + -1.0;
                  if ((_NSGlyphTreeBidiLevelForGlyphAtIndex(v338, location) & 1) == 0)
                  {
                    v145 = location + length;
                    if (location + length < v352.length + v352.location)
                    {
                      v146 = _NSGlyphTreeBidiLevelForGlyphAtIndex(v338, location + length);
                      if ((v146 & 1) != 0)
                      {
                        do
                        {
                          v147 = v145;
                          v148 = v145 + 1;
                          if (v145 + 1 >= v352.length + v352.location)
                            break;
                          ++v145;
                        }
                        while (v146 == _NSGlyphTreeBidiLevelForGlyphAtIndex(v338, v148));
                      }
                      else
                      {
                        v147 = location + length;
                      }
                      objc_msgSend((id)v338, "locationForGlyphAtIndex:", v147);
                      v150 = v290 + v329 + v149;
                      v151 = 1.0;
                      if (v116 + v286 != v277)
                        v151 = 0.0;
                      v144 = v150 - v151;
                    }
                    if (v144 < v114)
                    {
                      v152 = _NSGlyphTreeBidiLevelForGlyphAtIndex(v338, location);
                      v153 = location;
                      do
                      {
                        v154 = v153;
                        v155 = v352.location;
                        if (v153 <= v352.location)
                          goto LABEL_227;
                        --v153;
                      }
                      while (v152 == _NSGlyphTreeBidiLevelForGlyphAtIndex(v338, v154 - 1));
                      v155 = v352.location;
LABEL_227:
                      if (v154 <= v155)
                      {
                        objc_msgSend((id)v338, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", location, 0);
                        v169 = v168;
                        v171 = v170;
                        objc_msgSend((id)objc_msgSend((id)v338, "textContainerForGlyphAtIndex:effectiveRange:", location, 0), "lineFragmentPadding");
                        v144 = v290 + v169 + v171 - v172 + -1.0;
                      }
                      else
                      {
                        objc_msgSend((id)v338, "locationForGlyphAtIndex:", v154 - 1);
                        v157 = v290 + v329 + v156;
                        v158 = 1.0;
                        if (v116 + v286 != v277)
                          v158 = 0.0;
                        v144 = v157 - v158;
                      }
                    }
                  }
                  v167 = v114;
                  if (v144 < v114)
                  {
                    v360[0].a = 0.0;
                    if ((*(_BYTE *)(v338 + 67) & 0x40) != 0)
                    {
                      v176 = objc_msgSend(*(id *)(v338 + 32), "objectAtIndex:", 0);
                    }
                    else if (objc_msgSend(*(id *)(v338 + 48), "count") <= location)
                    {
                      v176 = 0;
                    }
                    else
                    {
                      v173 = *(_QWORD **)(v338 + 48);
                      _NSBlockNumberForIndex(v173, location, 0);
                      if (v173[11] <= v174)
                        v175 = v173[4] - v173[3];
                      else
                        v175 = 0;
                      v176 = *(_QWORD *)(v173[7] + (v173[2] + 8) * (v175 + v174) + 8);
                    }
                    LOBYTE(v267) = 0;
                    v177 = (double *)objc_msgSend((id)v338, "_rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:", location, length, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 1, v267, v176, v360, 0, 0);
                    v167 = *v177;
                    v144 = *v177 + v177[2];
                  }
                }
                else
                {
                  if (location + length >= v352.length + v352.location)
                  {
                    objc_msgSend((id)v338, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", location, 0);
                    v163 = v162;
                    v165 = v164;
                    objc_msgSend((id)objc_msgSend((id)v338, "textContainerForGlyphAtIndex:effectiveRange:", location, 0), "lineFragmentPadding");
                    v144 = v290 + v163 + v165 - v166 + -1.0;
                  }
                  else
                  {
                    objc_msgSend((id)v338, "locationForGlyphAtIndex:");
                    v160 = v290 + v329 + v159;
                    v161 = 1.0;
                    if (v116 + v286 != v277)
                      v161 = 0.0;
                    v144 = v160 - v161;
                  }
                  v167 = v114;
                }
                if (!v282)
                {
                  v178 = objc_msgSend((Class)getNSColorClass_0[0](), "blackColor");
                  if (v285 == 0x7FFFFFFFFFFFFFFFLL || !NSIntersectsRange())
                  {
                    if (v334 && (objc_msgSend(v334, "isEqual:", v178) & 1) == 0)
                      v282 = objc_msgSend(v334, "colorWithAlphaComponent:", 0.8);
                    else
                      v282 = objc_msgSend((Class)getNSColorClass_0[0](), "colorWithWhite:alpha:", 0.17, 1.0);
                  }
                  else
                  {
                    v179 = (uint64_t)v334;
                    if (!v334)
                      v179 = v178;
                    v282 = v179;
                  }
                }
                if ((v275 & 1) != 0)
                {
                  if (!v281)
                  {
                    v180 = [__NSLMMarkedTextUnderlineRenderer alloc];
                    if (v180)
                    {
                      *(_QWORD *)&v360[0].a = v180;
                      *(_QWORD *)&v360[0].b = __NSLMMarkedTextUnderlineRenderer;
                      v180 = -[CGAffineTransform init]((objc_super *)v360, sel_init);
                      if (v180)
                        v180->_cgContextRef = c;
                    }
                    v281 = v180;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    v181 = objc_msgSend(v302, "BOOLValue");
                  else
                    v181 = v118 != 1;
                  -[__NSLMMarkedTextUnderlineRenderer processMarkedTextUnderlineStartX:endX:yPosition:underlineColor:selected:]((uint64_t)v281, (void *)objc_msgSend((id)v338, "renderingColorForDocumentColor:", v282), v181, v167, v144, y);
                }
                else
                {
                  CGContextSaveGState(c);
                  objc_msgSend((id)objc_msgSend((id)v338, "renderingColorForDocumentColor:", v282), "set");
                  if (v144 - v167 > 1.0 && v271 != v309 && v286 == v271)
                    v167 = v167 + 1.0;
                  if (v116 + v286 == v271 + *(_QWORD *)&v272 && v144 - v167 > 1.0 && v116 + v286 != v277)
                    v144 = v144 + -1.0;
                  CGContextSetLineWidth(c, width);
                  CGContextMoveToPoint(c, v167, y);
                  CGContextAddLineToPoint(c, v144, y);
                  CGContextStrokePath(c);
                  CGContextRestoreGState(c);
                }
                goto LABEL_283;
              }
              v322 = 0;
              v140 = v41 + 1.0;
            }
LABEL_210:
            v143 = v310;
          }
          else
          {
LABEL_182:
            objc_msgSend((id)objc_msgSend((id)v338, "typesetter"), "baselineOffsetInLayoutManager:glyphIndex:", v338, location);
            v126 = v121 + v123;
            if (v121 + v123 <= v41)
            {
              v127 = bRect;
            }
            else
            {
              v127 = bRect;
              if (v126 < bRect + v41)
              {
                v125 = v125 - (bRect + v41 - v126);
                v127 = v126 - v41;
              }
            }
            v137 = v125 * 0.5;
            v138 = floor(v137);
            v139 = v137 < 4.0;
            if (v137 >= 4.0)
              v140 = (v137 - width) * 0.666;
            else
              v140 = v138;
            v141 = v322;
            if (v139)
              v141 = 0;
            v322 = v141;
            v142 = v41 + v127;
            if (!v340)
            {
              v140 = v142 - v140;
              goto LABEL_210;
            }
            v143 = v310 + v142;
          }
          v131 = v143 - v140;
          goto LABEL_212;
        }
LABEL_283:
        v185 = v310 + v283;
        if (v306)
        {
          v186 = objc_msgSend(v306, "attachmentCell");
          objc_msgSend((id)v338, "attachmentSizeForGlyphAtIndex:", location);
          v189 = v187;
          v190 = v188;
          if (v186)
          {
            objc_msgSend((id)v338, "showAttachmentCell:inRect:characterIndex:", v186, v335, v114, v185, v187, v188);
          }
          else
          {
            objc_msgSend((id)objc_msgSend((id)v338, "renderingColorForDocumentColor:", v334), "set");
            objc_msgSend((id)v338, "showAttachment:inRect:textContainer:characterIndex:", v306, v274, v335, v114, v185, v189, v190);
          }
          if (v116 > 1)
            v219 = 1;
          else
            v219 = length;
          v220 = v116 != 0;
          v221 = location;
          goto LABEL_381;
        }
        glyphs = 0;
        v349 = 0.0;
        v348 = 0.0;
        v347.length = 0;
        v347.location = 0;
        v191 = length;
        v192 = location + length;
        v193 = v352;
        v194 = location;
        if (location + length > v352.length + v352.location)
        {
          v365.location = location;
          v365.length = length;
          v195 = NSIntersectionRange(v365, v193);
          v191 = v195.length;
          v194 = v195.location;
          v192 = v195.location + v195.length;
        }
        v284 = v116;
        v196 = 0;
        v307 = 0;
        v197 = v194;
        v347.location = v194;
        v347.length = v191;
        v198 = v360;
        v199 = v361;
        while (1)
        {
          v200 = v347.location;
          _NSLayoutTreeRunLocationForGlyphAtIndex(v338, v347.location, &v347);
          v370.location = v197;
          v370.length = v191;
          v201 = NSIntersectionRange(v347, v370);
          v202 = v201.location;
          v203 = v201.length;
          v347 = v201;
          if (v201.location < v200)
          {
            v203 = v201.location - v200 + v201.length;
            v347.length = v203;
            v347.location = v200;
            v202 = v200;
          }
          v204 = 512 - 2 * v196;
          if (v203 > v204 >> 1)
          {
            v203 = v204 >> 1;
            v347.length = v204 >> 1;
          }
          PackedGlyphsInRange = _NSGlyphTreeGetPackedGlyphsInRange(v338, v202, v203, v199);
          v206 = PackedGlyphsInRange;
          v207 = PackedGlyphsInRange == 1 ? v303 : 0;
          if (v207 == 1)
          {
            if (_NSGlyphTreeVirtualEllipsisAttributeForGlyphAtIndex(v338, v347.location))
            {
              LOWORD(characters.a) = 8230;
              v208 = (const __CTFont *)objc_msgSend((id)v338, "substituteFontForFont:", objc_msgSend((id)objc_msgSend((id)v338, "typesetter"), "_ellipsisFontForFont:", v330));
              CTFontGetGlyphsForCharacters(v208, (const UniChar *)&characters, &glyphs, 1);
              -[__CTFont getAdvancements:forCGGlyphs:count:](v208, "getAdvancements:forCGGlyphs:count:", &v358, &glyphs, 1);
              v307 = v208;
              v348 = v114;
              v349 = v185;
              if ((v40 & 1) != 0)
              {
                -[__CTFont getVerticalOriginTranslations:forCGGlyphs:count:](v208, "getVerticalOriginTranslations:forCGGlyphs:count:", &v356, &glyphs, 1);
                v209 = v357;
                if (v340)
                  v209 = -v357;
                v348 = v356 + v348;
                v349 = v349 + v209;
              }
              goto LABEL_311;
            }
          }
          else if (!PackedGlyphsInRange)
          {
            goto LABEL_311;
          }
          objc_msgSend(v330, "getAdvancements:forCGGlyphs:count:", &v358, v199, v206);
          if ((v40 & 1) != 0)
            objc_msgSend(v330, "getVerticalOriginTranslations:forCGGlyphs:count:", &v356, v199, v206);
          v196 += v206;
          v210 = &v357;
          v211 = (double *)&v359;
          do
          {
            v198->a = v114;
            v198->b = v185;
            if ((v40 & 1) != 0)
            {
              v212 = *v210;
              if (v340)
                v212 = -*v210;
              v198->a = v114 + *(v210 - 1);
              v198->b = v212 + v185;
            }
            v198 = (CGAffineTransform *)((char *)v198 + 16);
            v114 = v114 + v42 + *(v211 - 1);
            v213 = *v211;
            v211 += 2;
            v185 = v185 + (v43 + v213) * v44;
            v210 += 2;
            --v206;
          }
          while (v206);
LABEL_311:
          v214 = v347.length + v347.location;
          v347.location = v214;
          if (v214 >= v192)
            break;
          objc_msgSend((id)v338, "locationForGlyphAtIndex:");
          v114 = v113 + v215;
          v217 = v41 + v216;
          v218 = -(v41 + v216);
          if (!v340)
            v217 = v218;
          v185 = v310 + v217;
          v199 = &v361[v196];
          if (v196 >= 256)
          {
            v214 = v347.location;
            goto LABEL_322;
          }
        }
        v199 = &v361[v196];
LABEL_322:
        v111 = v192 > v214;
        v221 = v197;
        if (v111)
          v219 = v214 - v197;
        else
          v219 = v191;
        if (v219 < length)
          v284 = _NSGlyphTreeCharacterIndexForGlyphAtIndex(v338, v219 + v197) - v286;
        if (v219)
        {
          v346 = v351;
          CGContextGetFontRenderingStyle();
          v222 = v325 ^ 1;
          if (v219 > 1)
            v222 = 1;
          v223 = (v222 & 1) != 0 || objc_msgSend((id)v338, "glyphAtIndex:", v197) != 0;
          objc_msgSend((id)objc_msgSend((id)v338, "renderingColorForDocumentColor:", v334), "set");
          if ((v300 & 7) != 0 && v223)
          {
            CGContextSaveGState(c);
            if (v316)
              objc_msgSend((id)objc_msgSend((id)v338, "renderingColorForDocumentColor:", v316), "set");
            objc_msgSend((id)v321, "applyToGraphicsContext:", v291);
            objc_msgSend((id)v338, "underlineGlyphRange:underlineType:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:", v197, v219, v300, v352.location, v352.length, v329, v41, v327, bRect, v290, v310);
            CGContextRestoreGState(c);
          }
          if (v269)
          {
            CGContextSaveGState(c);
            objc_msgSend((id)objc_msgSend((id)v338, "typesetter"), "baselineOffsetInLayoutManager:glyphIndex:", v338, v197);
            v226 = v225;
            Mutable = CGPathCreateMutable();
            v228 = v310 + bRect + v41 - v226;
            CGPathMoveToPoint(Mutable, 0, v113, v228);
            CGPathAddLineToPoint(Mutable, 0, v327 + v113, v228);
            CGContextAddPath(c, Mutable);
            CGContextSetLineWidth(c, v268);
            objc_msgSend((id)objc_msgSend((Class)getNSColorClass_0[0](), "blueColor"), "setStroke");
            CGContextSetLineDash(c, 0.0, _drawGlyphsForGlyphRange_atPoint__components, 2uLL);
            CGContextSetShouldAntialias(c, 0);
            CGContextStrokePath(c);
            CGPathRelease(Mutable);
            CGContextRestoreGState(c);
          }
          objc_msgSend(v330, "applyToGraphicsContext:", v291);
          if (v301 != 1.0 || (v229 = b, v326 = a, d = *((double *)&v295 + 1), v231 = *(double *)&v295, v299))
          {
            CGContextGetTextMatrix(&t1, c);
            t2.a = v301;
            t2.b = 0.0;
            t2.c = v293;
            t2.d = 1.0;
            t2.tx = 0.0;
            t2.ty = 0.0;
            CGAffineTransformConcat(&characters, &t1, &t2);
            v229 = characters.b;
            v231 = characters.c;
            d = characters.d;
            v345 = *(_OWORD *)&characters.tx;
            v326 = characters.a;
            CGContextSetTextMatrix(c, &characters);
            v346 = v345;
          }
          if (v321 | v323)
          {
            CGContextSaveGState(c);
            objc_msgSend((id)v321, "applyToGraphicsContext:", v291);
            if (v323)
            {
              objc_msgSend(v330, "pointSize");
              v233 = v232;
              objc_msgSend((id)v323, "doubleValue");
              v235 = v233 * 0.01 * v234;
              if (v235 <= 0.0)
              {
                if (v235 < 0.0)
                {
                  CGContextSetLineWidth(c, -v235);
                  v236 = kCGTextFillStroke;
                }
                else
                {
                  v236 = kCGTextFill;
                }
              }
              else
              {
                CGContextSetLineWidth(c, v235);
                v236 = kCGTextStroke;
              }
              CGContextSetTextDrawingMode(c, v236);
              if (v315)
                objc_msgSend((id)objc_msgSend((id)v338, "renderingColorForDocumentColor:", v315), "setStroke");
            }
          }
          v237 = (uint64_t)v339;
          if (!v339)
            v237 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
          characters.a = v326;
          characters.b = v229;
          characters.c = v231;
          characters.d = d;
          *(_OWORD *)&characters.tx = v346;
          objc_msgSend((id)v338, "showCGGlyphs:positions:count:font:matrix:attributes:inContext:", v361, v360, v199 - v361, v330, &characters, v237, c);
          if (v307)
          {
            CGContextSaveGState(c);
            -[__CTFont applyToGraphicsContext:](v307, "applyToGraphicsContext:", v291);
            characters.a = v326;
            characters.b = v229;
            characters.c = v231;
            characters.d = d;
            *(_OWORD *)&characters.tx = v346;
            objc_msgSend((id)v338, "showCGGlyphs:positions:count:font:matrix:attributes:inContext:", &glyphs, &v348, 1, v307, &characters, v237, c);
            CGContextRestoreGState(c);
          }
          CGContextSetFontRenderingStyle();
          if (v321 | v323)
            CGContextRestoreGState(c);
          if (v223)
          {
            if ((v298 & 7) != 0)
            {
              CGContextSaveGState(c);
              if (v314)
                objc_msgSend((id)objc_msgSend((id)v338, "renderingColorForDocumentColor:", v314), "set");
              objc_msgSend((id)v321, "applyToGraphicsContext:", v291);
              v238 = v329;
              if (v299)
              {
                objc_msgSend(v299, "doubleValue", v329);
                v240 = v239;
                objc_msgSend(v330, "xHeight");
                v238 = v329 + v240 * v241 * 0.5;
              }
              objc_msgSend((id)v338, "strikethroughGlyphRange:strikethroughType:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:", v197, v219, v298, v352.location, v352.length, v238, v41, v327, bRect, v290, v310);
              CGContextRestoreGState(c);
            }
            if (v305 | v294)
            {
              characters.b = 0.0;
              characters.a = 0.0;
              v243 = objc_msgSend((id)v338, "characterRangeForGlyphRange:actualGlyphRange:", v352.location, v352.length, 0);
              v244 = v242;
              if (v305)
                v245 = CFSTR("NSSpellingState");
              else
                v245 = CFSTR("NSTextAlternativesDisplayStyle");
              objc_msgSend((id)v338, "temporaryAttribute:atCharacterIndex:longestEffectiveRange:inRange:", v245, v286, &characters, v243, v242);
              v246 = objc_msgSend((id)v338, "glyphRangeForCharacterRange:actualCharacterRange:", *(_QWORD *)&characters.a, *(_QWORD *)&characters.b, 0);
              v248 = v247;
              if ((v305 & 0x80) != 0
                && (objc_msgSend((id)v338, "temporaryAttribute:atCharacterIndex:longestEffectiveRange:inRange:", NSTemporaryTextCorrectionAttributeName, v286, &characters, v243, v244)|| objc_msgSend((id)v338, "temporaryAttribute:atCharacterIndex:longestEffectiveRange:inRange:", CFSTR("NSTextAlternatives"), v286, &characters, v243, v244)))
              {
                v371.location = objc_msgSend((id)v338, "glyphRangeForCharacterRange:actualCharacterRange:", *(_QWORD *)&characters.a, *(_QWORD *)&characters.b, 0);
                v371.length = v249;
                v366.location = v246;
                v366.length = v248;
                v250 = NSIntersectionRange(v366, v371);
                v246 = v250.location;
                v248 = v250.length;
              }
              if (v305)
                v251 = v305;
              else
                v251 = v294;
              objc_msgSend((id)v338, "drawSpellingUnderlineForGlyphRange:spellingState:inGlyphRange:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:", v197, v219, v251, v246, v248, v329, v41, v327, bRect, v290, v310, v352.location, v352.length);
            }
          }
          v221 = v197;
        }
        v306 = 0;
        v220 = v284;
LABEL_381:
        if (v311)
        {
          if (v220 && CGContextGetType() == 1)
          {
            objc_opt_class();
            v252 = (const __CFURL *)v311;
            if ((objc_opt_isKindOfClass() & 1) != 0
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
              && (v252 = (const __CFURL *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v311)) != 0)
            {
              v360[0].a = 0.0;
              v253 = v221;
              v254 = objc_msgSend((id)v338, "rectArrayForGlyphRange:withinSelectedGlyphRange:inTextContainer:rectCount:", v221, v219, 0x7FFFFFFFFFFFFFFFLL, 0, v274, v360);
              v255 = v360[0].a;
              if (*(_QWORD *)&v360[0].a)
              {
                v256 = 0;
                v257 = (CGFloat *)(v254 + 16);
                do
                {
                  v258 = *v257;
                  if (*v257 > 0.0)
                  {
                    v259 = v257[1];
                    if (v259 > 0.0)
                    {
                      v260 = *(v257 - 2);
                      v261 = *(v257 - 1);
                      CGContextGetCTM(&v341, c);
                      v262 = -(v261 + v259);
                      if (v340)
                        v262 = v261;
                      v375.origin.y = v310 + v262;
                      v375.origin.x = v290 + v260;
                      v375.size.width = v258;
                      v375.size.height = v259;
                      v376 = CGRectApplyAffineTransform(v375, &v341);
                      CGPDFContextSetURLForRect(c, v252, v376);
                      v255 = v360[0].a;
                    }
                  }
                  ++v256;
                  v257 += 4;
                }
                while (v256 < *(_QWORD *)&v255);
              }
              v221 = v253;
            }
          }
        }
        v263 = v335 + v331;
        v335 = v220 + v286;
        v331 = v263 - (v220 + v286);
        v35 = v221 + v219;
        v265 = v336 + v337 - (v221 + v219);
        v264 = v336 + v337 > v221 + v219;
        if (v336 + v337 < v221 + v219)
          v265 = 0;
        v336 = v265;
        v13 = v338;
        if (!v264)
        {
LABEL_399:
          -[__NSLMMarkedTextUnderlineRenderer renderUnderline]((uint64_t)v281);

          objc_msgSend((id)v13, "_resetCachedTextContainer");
          v266 = (_QWORD *)(*(_QWORD *)(v13 + 240) + 168);
          *v266 = 0;
          v266[1] = 0;
          if (v273)
            objc_msgSend(*(id *)(v13 + 8), "_unlock");
          return;
        }
      }
    }
    v60.length = v331;
    v62 = NSIntersectionRange(v60, range2);
    v355 = v62;
    if (v62.location < v353.location || v62.location - v353.location >= v353.length)
    {
      v39 = (void *)objc_msgSend((id)v13, "temporaryAttributesAtCharacterIndex:longestEffectiveRange:inRange:", v62.location, &v353, v62.location, v62.length);
      if (v311)
      {
        v64 = objc_msgSend((id)v13, "linkAttributesForAttributes:forCharacterAtIndex:", v339, v355.location);
        if (v64)
        {
          v65 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v64);
          objc_msgSend(v65, "addEntriesFromDictionary:", v39);
          v39 = v65;
        }
      }
      if ((*(_BYTE *)(*(_QWORD *)(v13 + 240) + 449) & 0x10) != 0)
      {
        v66 = (void *)objc_msgSend((id)v13, "delegate", v64);
        v39 = (void *)objc_msgSend(v66, "layoutManager:shouldUseTemporaryAttributes:forDrawingToScreen:atCharacterIndex:effectiveRange:", v13, v39, 1, v355.location, &v353);
      }
    }
    if (!v39
      || (v355 = NSIntersectionRange(v355, v353),
          (v334 = (void *)objc_msgSend(v39, "objectForKey:", CFSTR("NSColor"))) == 0))
    {
      v334 = (void *)objc_msgSend(v339, "objectForKey:", CFSTR("NSColor"));
    }
    if (v324)
    {
      v334 = (void *)objc_msgSend((Class)getNSColorClass_0[0](), "brownColor");
      if (objc_msgSend(v324, "count") == 1)
      {
        v67 = objc_msgSend((id)objc_msgSend(v324, "objectAtIndex:", 0), "unsignedIntegerValue");
        if (v67)
        {
          if (v67 == 1)
            v334 = (void *)objc_msgSend((Class)getNSColorClass_0[0](), "redColor");
        }
        else
        {
          v334 = (void *)objc_msgSend((Class)getNSColorClass_0[0](), "blueColor");
        }
      }
    }
    if (!v39 || (v315 = objc_msgSend(v39, "objectForKey:", CFSTR("NSStrokeColor"))) == 0)
      v315 = objc_msgSend(v339, "objectForKey:", CFSTR("NSStrokeColor"));
    v322 = (void *)objc_msgSend(v339, "objectForKey:", CFSTR("NSUnderline"));
    if (!v39 || (v316 = objc_msgSend(v39, "objectForKey:", CFSTR("NSUnderlineColor"))) == 0)
      v316 = objc_msgSend(v339, "objectForKey:", CFSTR("NSUnderlineColor"));
    v69 = (void *)objc_msgSend(v339, "objectForKey:", CFSTR("NSStrikethrough"));
    if (((v39 && (v314 = objc_msgSend(v39, "objectForKey:", CFSTR("NSStrikethroughColor"))) != 0
        || (v314 = objc_msgSend(v339, "objectForKey:", CFSTR("NSStrikethroughColor")), v39))
       && (v321 = objc_msgSend(v39, "objectForKey:", CFSTR("NSShadow"))) != 0
       || (v321 = objc_msgSend(v339, "objectForKey:", CFSTR("NSShadow")), v39))
      && (v323 = objc_msgSend(v39, "objectForKey:", CFSTR("NSStrokeWidth"))) != 0
      || (v323 = objc_msgSend(v339, "objectForKey:", CFSTR("NSStrokeWidth")), v39))
    {
      v70 = (void *)objc_msgSend(v39, "objectForKey:", CFSTR("NSObliqueness"));
      if (v70)
        goto LABEL_105;
    }
    v70 = (void *)objc_msgSend(v339, "objectForKey:", CFSTR("NSObliqueness"));
    if (v70)
    {
LABEL_105:
      v299 = v70;
      objc_msgSend(v70, "doubleValue");
      if (v340)
        v71 = -v71;
    }
    else
    {
      v299 = 0;
      v71 = 0.0;
    }
    v293 = v71;
    if (v309 != 0x7FFFFFFFFFFFFFFFLL && NSIntersectsRange())
    {
      if (v355.location < v309)
      {
        v302 = 0;
        v308 = 0;
        v355.length = v309 - v355.location;
        goto LABEL_128;
      }
      if (v355.location - v309 >= v289)
      {
        v302 = 0;
        v308 = 0;
        v355.length += v355.location - v277;
        v355.location = v277;
        goto LABEL_128;
      }
      if (v280)
      {
        *(_OWORD *)&v360[0].a = 0uLL;
        v72 = objc_msgSend(v280, "attribute:atIndex:effectiveRange:", CFSTR("NSColor"));
        if (v72)
        {
          if (*(_QWORD *)&v360[0].b < v355.length)
            v355.length = *(_QWORD *)&v360[0].b;
          v334 = (void *)v72;
        }
        v308 = (void *)objc_msgSend(v280, "attribute:atIndex:effectiveRange:", CFSTR("NSUnderline"), v355.location - v309, v360);
        if (v308)
        {
          if (*(_QWORD *)&v360[0].b < v355.length)
            v355.length = *(_QWORD *)&v360[0].b;
          v282 = objc_msgSend(v280, "attribute:atIndex:effectiveRange:", CFSTR("NSUnderlineColor"), v355.location - v309, v360);
          if (v282 && *(_QWORD *)&v360[0].b < v355.length)
            v355.length = *(_QWORD *)&v360[0].b;
          v73 = objc_msgSend(v280, "attribute:atIndex:effectiveRange:", NSMarkedClauseSegmentAttributeName, v355.location - v309, v360);
          v74.location = v355.location;
          if (v73)
          {
            v368.length = *(_QWORD *)&v360[0].b;
            v368.location = *(_QWORD *)&v360[0].a + v309;
            v74.length = v355.length;
            v271 = *(_QWORD *)&v360[0].a + v309;
            v272 = v360[0].b;
            v74 = NSIntersectionRange(v74, v368);
            v355 = v74;
          }
          v302 = (void *)objc_msgSend(v280, "attribute:atIndex:effectiveRange:", CFSTR("NSMarkedTextSelectionAttributeName"), v74.location - v309, 0);
        }
        else
        {
          v302 = 0;
        }
LABEL_128:
        if (v322)
          v75 = objc_msgSend(v322, "integerValue");
        else
          v75 = 0;
        v76 = objc_msgSend((id)objc_msgSend(v39, "objectForKey:", CFSTR("NSUnderline")), "integerValue");
        if (v69)
          v77 = objc_msgSend(v69, "integerValue");
        else
          v77 = 0;
        v78 = objc_msgSend((id)objc_msgSend(v39, "objectForKey:", CFSTR("NSStrikethrough")), "integerValue");
        *(_OWORD *)&v360[0].a = 0uLL;
        v305 = objc_msgSend((id)objc_msgSend(v39, "objectForKey:", CFSTR("NSSpellingState")), "integerValue");
        v294 = objc_msgSend((id)objc_msgSend(v39, "objectForKey:", CFSTR("NSTextAlternativesDisplayStyle")), "integerValue");
        v79 = objc_msgSend(v39, "objectForKey:", NSTemporaryTextCorrectionAttributeName);
        v80 = (void *)objc_msgSend(v39, "objectForKey:", CFSTR("NSTextAlternatives"));
        if (v79)
        {
          v81 = (void *)objc_msgSend(*(id *)(v338 + 8), "string");
          v82 = v355.location;
          v83 = objc_msgSend(*(id *)(v338 + 8), "length");
          v84 = objc_msgSend(v81, "rangeOfString:options:range:", v79, 8, v82, v83 - v355.location);
          v86 = v85;
          if (v85)
          {
            v87 = v84;
            if (objc_msgSend((id)v338, "temporaryAttribute:atCharacterIndex:longestEffectiveRange:inRange:", NSTemporaryTextCorrectionAttributeName, v355.location, v360, v84, v85))
            {
              if (__PAIR128__(v86, v87) == *(_OWORD *)&v360[0].a)
              {
                v88 = v287;
                if (v355.location < v288 || v355.location - v288 >= v287)
                {
                  v358 = 0;
                  v356 = 0.0;
                  v89 = (void *)objc_msgSend(*(id *)(v338 + 8), "string");
                  objc_msgSend(v89, "getParagraphStart:end:contentsEnd:forRange:", &v358, 0, &v356, v355.location, v355.length);
                  v288 = v358;
                  v88 = *(_QWORD *)&v356 - v358;
                }
                v287 = v88;
                if (v288 + v88 >= v285 && v278 >= v288)
                {
                  if (!_drawGlyphsForGlyphRange_atPoint__correctionUnderlineBehavior)
                  {
                    v132 = v87 + v86;
                    v133 = v285;
                    v134 = range1;
                    v111 = v285 > v87 + v86;
                    v13 = v338;
                    if (v111)
                    {
                      v333 = v132;
                      v369.location = objc_msgSend(*(id *)(v338 + 8), "nextWordFromIndex:forward:", v285, 0);
                      v369.length = v278 - v369.location;
                      v364.location = v285;
                      v364.length = range1;
                      v135 = NSUnionRange(v364, v369);
                      v134 = v135.length;
                      v133 = v135.location;
                      v132 = v333;
                    }
                    if (v132 >= v133)
                    {
                      v136 = v305;
                      if (v134 + v133 >= v87)
                        v136 = v305 | 0x80;
                      v305 = v136;
                    }
                    goto LABEL_146;
                  }
                  v305 |= 0x80uLL;
                }
              }
            }
          }
        }
        v13 = v338;
LABEL_146:
        if (v80)
        {
          v90 = (void *)objc_msgSend(*(id *)(v13 + 8), "string");
          v91 = objc_msgSend(v80, "primaryString");
          v92 = v355.location;
          v93 = objc_msgSend(*(id *)(v13 + 8), "length");
          v94 = objc_msgSend(v90, "rangeOfString:options:range:", v91, 8, v92, v93 - v355.location);
          v96 = v95;
          if (v95)
          {
            v97 = v94;
            if (objc_msgSend((id)v13, "temporaryAttribute:atCharacterIndex:longestEffectiveRange:inRange:", CFSTR("NSTextAlternatives"), v355.location, v360, v94, v95))
            {
              v13 = v338;
              if (__PAIR128__(v96, v97) == *(_OWORD *)&v360[0].a)
              {
                v98 = v288;
                v99 = v287;
                if (v355.location < v288 || v355.location - v288 >= v287)
                {
                  v358 = 0;
                  v356 = 0.0;
                  v100 = (void *)objc_msgSend(*(id *)(v338 + 8), "string");
                  objc_msgSend(v100, "getParagraphStart:end:contentsEnd:forRange:", &v358, 0, &v356, v355.location, v355.length);
                  v98 = v358;
                  v99 = *(_QWORD *)&v356 - v358;
                }
                v287 = v99;
                v288 = v98;
                if (v98 + v99 >= v285)
                {
                  v101 = v305;
                  if (v278 >= v98)
                    v101 = v305 | 0x80;
                  v305 = v101;
                }
              }
            }
            else
            {
              v13 = v338;
            }
          }
        }
        if (!v334)
        {
          v334 = (void *)objc_msgSend((Class)getNSColorClass_0[0](), "blackColor");
          v13 = v338;
        }
        v102 = _NSGlyphTreeGlyphRangeForCharacterRange(v13, v355.location, v355.length, 1, 1, 1, (uint64_t *)&v355);
        length = v103;
        location = v102;
        v300 = v76 | v75;
        v298 = v78 | v77;
        goto LABEL_161;
      }
    }
    v302 = 0;
    v308 = 0;
    goto LABEL_128;
  }
}

uint64_t __63__NSLayoutManager_NSPrivate___drawGlyphsForGlyphRange_atPoint___block_invoke()
{
  uint64_t result;

  _drawGlyphsForGlyphRange_atPoint__isBidiDebugging = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSDebugBidi"));
  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "integerForKey:", CFSTR("NSCorrectionUnderlineBehavior"));
  _drawGlyphsForGlyphRange_atPoint__correctionUnderlineBehavior = result;
  return result;
}

- (unsigned)_glyphAtIndex:(unint64_t)a3 characterIndex:(unint64_t *)a4 glyphInscription:(unint64_t *)a5 isValidIndex:(BOOL *)a6
{
  unint64_t v9;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v15;

  v9 = a3;
  v15 = 0;
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, a3, 1uLL);
  v11 = _NSGlyphTreeGlyphAtIndex((uint64_t)self, v9, &v15);
  if (v15)
  {
    v12 = v9;
    if (a4)
      v12 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, v9);
    if (a5)
      v13 = _NSGlyphTreeIntAttributeForGlyphAtIndex((uint64_t)self, v9, 5);
    else
      v13 = 0;
    v9 = v12;
    if (a4)
      goto LABEL_10;
  }
  else
  {
    v13 = 0;
    if (a4)
LABEL_10:
      *a4 = v9;
  }
  if (a5)
    *a5 = v13;
  if (a6)
    *a6 = v15;
  return v11;
}

- (BOOL)_needToFlushGlyph
{
  return (*((unsigned __int8 *)&self->_lmFlags + 3) >> 3) & 1;
}

- (void)_setNeedToFlushGlyph:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xF7FFFFFF | v3);
}

- (void)_simpleInsertGlyph:(unsigned int)a3 atGlyphIndex:(unint64_t)a4 characterIndex:(unint64_t)a5 elastic:(BOOL)a6
{
  void *v8;
  uint64_t v9;

  v9 = 0;
  -[NSRunStorage insertElement:range:coalesceRuns:](self->_containerRuns, "insertElement:range:coalesceRuns:", &v9, a4, 1, 1);
  v8 = (void *)*((_QWORD *)self->_extraData + 23);
  if (v8)
    _NSInsertGlyphRangeInTextBlocks(v8, a4, 1);
}

- (void)_simpleDeleteGlyphsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;

  if (a3.length)
  {
    length = a3.length;
    location = a3.location;
    -[NSRunStorage removeElementsInRange:coalesceRuns:](self->_containerRuns, "removeElementsInRange:coalesceRuns:", a3.location, a3.length, 1);
    v6 = (void *)*((_QWORD *)self->_extraData + 23);
    if (v6)
      _NSDeleteGlyphRangeFromTextBlocks(v6, location, length);
  }
}

- (void)_insertGlyphs:(unsigned int *)a3 elasticAttributes:(BOOL *)a4 count:(unint64_t)a5 atGlyphIndex:(unint64_t)a6 characterIndex:(unint64_t)a7
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  __lmFlags lmFlags;
  char v17;

  v7 = a6;
  v8 = a5;
  _NSGlyphTreeInsertGlyphs((uint64_t)self, a7, a6, a5, a3);
  for (; v8; --v8)
  {
    v15 = *a4++;
    _NSGlyphTreeSetIntAttributeForGlyphAtIndex((uint64_t)self, v7++, 1, v15, v11, v12, v13, v14, v17);
  }
  lmFlags = self->_lmFlags;
  if ((*(_DWORD *)&lmFlags & 0x80000) == 0)
    self->_lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags | 0x100000);
}

- (id)_attachmentSizesRun
{
  return 0;
}

- (CGRect)_currentAttachmentRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *((double *)self->_extraData + 2);
  v3 = *((double *)self->_extraData + 3);
  v4 = *((double *)self->_extraData + 4);
  v5 = *((double *)self->_extraData + 5);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unint64_t)_currentAttachmentIndex
{
  return *((_QWORD *)self->_extraData + 6);
}

- (void)_setCurrentAttachmentRect:(CGRect)a3 index:(unint64_t)a4
{
  char *extraData;

  extraData = (char *)self->_extraData;
  *(CGRect *)(extraData + 16) = a3;
  *((_QWORD *)extraData + 6) = a4;
}

- (void)_clearCurrentAttachmentSettings
{
  *((_QWORD *)self->_extraData + 6) = 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __55__NSLayoutManager_NSPrivate___clearTemporaryAttributes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "performSelector:", sel_removeView);
  return result;
}

- (void)_clearTemporaryAttributesForCharacterRange:(_NSRange)a3 changeInLength:(int64_t)a4
{
  id extraData;
  void *v5;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSRange v10;
  id v11;
  NSUInteger v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  unint64_t v20;
  NSUInteger v21;
  NSUInteger v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  NSUInteger v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;
  NSRange v31;
  NSRange v32;

  v30 = *MEMORY[0x1E0C80C00];
  extraData = self->_extraData;
  v5 = (void *)*((_QWORD *)extraData + 9);
  if (v5)
  {
    length = a3.length;
    location = a3.location;
    v9 = a3.length - a4;
    v32.length = objc_msgSend(*((id *)extraData + 9), "count");
    v31.location = location;
    v31.length = v9;
    v32.location = 0;
    v10 = NSIntersectionRange(v31, v32);
    if (v10.length)
    {
      v11 = 0;
      v27 = v10.location;
      v28 = 0;
      if (v10.location < v10.location + v10.length)
      {
        v11 = 0;
        v12 = v10.location;
        do
        {
          v13 = -[NSLayoutManager temporaryAttribute:atCharacterIndex:effectiveRange:](self, "temporaryAttribute:atCharacterIndex:effectiveRange:", CFSTR("NSViewTextAttachmentCellHelper"), v12, &v27);
          if (v13)
          {
            v14 = v13;
            if (!v11)
              v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            objc_msgSend(v11, "addObject:", v14);
          }
          v12 = v28 + v27;
        }
        while (v28 + v27 < v10.location + v10.length);
      }
      objc_msgSend(v5, "replaceObjectsInRange:withObject:length:", v10.location, v10.length, +[NSAttributeDictionary emptyAttributeDictionary](NSAttributeDictionary, "emptyAttributeDictionary"), length);
      if (v11)
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v24 != v17)
                objc_enumerationMutation(v11);
              v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v19, "performSelector:", sel_removeView);
            }
            v16 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
          }
          while (v16);
        }
        objc_msgSend(*((id *)self->_extraData + 55), "minusSet:", v11);

      }
    }
    else
    {
      v20 = objc_msgSend(v5, "count");
      if (location <= v20)
        v21 = location;
      else
        v21 = v20;
      if (location <= v20)
        v22 = length;
      else
        v22 = location + length - v20;
      objc_msgSend(v5, "insertObject:range:", +[NSAttributeDictionary emptyAttributeDictionary](NSAttributeDictionary, "emptyAttributeDictionary"), v21, v22);
    }
  }
}

- (void)setAllowsOriginalFontMetricsOverride:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xFFFFFDFF | v3);
}

- (void)_setHasSeenRightToLeft:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xFDFFFFFF | v3);
}

- (BOOL)_hasSeenRightToLeft
{
  return (*((unsigned __int8 *)&self->_lmFlags + 3) >> 1) & 1;
}

- (BOOL)flipsIfNeeded
{
  return (*((unsigned __int8 *)&self->_lmFlags + 3) >> 4) & 1;
}

- (void)setFlipsIfNeeded:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000000;
  else
    v3 = 0;
  self->_lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xEFFFFFFF | v3);
}

- (double)baselineOffsetForGlyphAtIndex:(unint64_t)a3
{
  double v4;

  v4 = 0.0;
  _NSLayoutTreeGetBaselineOffsetForGlyphAtIndex((uint64_t)self, a3, &v4);
  return v4;
}

- (BOOL)ignoresViewTransformations
{
  return (*((unsigned __int8 *)&self->_lmFlags + 3) >> 2) & 1;
}

- (void)setIgnoresViewTransformations:(BOOL)a3
{
  __lmFlags lmFlags;
  int v5;
  uint64_t v6;
  __lmFlags v7;
  uint64_t v8;

  lmFlags = self->_lmFlags;
  if (a3)
  {
    if ((*(_DWORD *)&lmFlags & 0x4000000) != 0)
      return;
    v5 = 0x4000000;
  }
  else
  {
    if ((*(_DWORD *)&lmFlags & 0x4000000) == 0)
      return;
    v5 = 0;
  }
  v6 = -[NSTextStorage length](self->_textStorage, "length");
  v7 = self->_lmFlags;
  self->_lmFlags = (__lmFlags)(*(_DWORD *)&v7 & 0xFBFFFFFF | v5);
  if (v6)
  {
    v8 = v6;
    if ((*(_DWORD *)&v7 & 0x8100000) != 0)
      -[NSLayoutManager _invalidateGlyphsForExtendedCharacterRange:changeInLength:](self, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:", 0, v6, 0);
    -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", 0, v8, 0);
  }
}

- (BOOL)ignoresAntialiasThreshold
{
  return 0;
}

- (BOOL)_alwaysDrawsActive
{
  return *((unsigned __int8 *)self->_extraData + 449) >> 7;
}

- (void)_setAlwaysDrawsActive:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  *((_DWORD *)self->_extraData + 112) = *((_DWORD *)self->_extraData + 112) & 0xFFFF7FFF | v3;
}

- (id)_insertionPointHelperForGlyphAtIndex:(unint64_t)a3
{
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  unint64_t v13;
  NSRunStorage *containerRuns;
  unint64_t v15;
  double v16;
  unint64_t v17;
  void *v18;
  BOOL v19;
  NSInsertionPointHelper *v20;
  NSInsertionPointHelper *v22;
  char *v23;
  unsigned __int8 *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  double v28;
  double v29;
  double v30;
  unint64_t v31;
  unint64_t v32;
  __CFString *v33;
  NSUInteger RangeOfCharacterClusterAtIndex;
  unint64_t v35;
  NSUInteger v36;
  unint64_t v37;
  int v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  double v47;
  int v48;
  NSRange v49;
  NSRange v50;
  NSUInteger v51;
  uint64_t v52;
  void *v53;
  void *v54;
  int v55;
  BOOL v56;
  char v57;
  uint64_t v58;
  void *v59;
  NSFont *v60;
  NSFont *v61;
  double v62;
  unint64_t v63;
  int v64;
  unsigned __int16 v65;
  uint64_t v66;
  double *v67;
  double v68;
  unint64_t v69;
  double v70;
  unint64_t v71;
  unint64_t v72;
  unsigned int v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  double v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  uint64x2_t v87;
  double *v88;
  int32x2_t v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t HasRightToLeftBaseWritingDirectionAtIndex;
  double v93;
  double v94;
  void *v95;
  void *v96;
  void *v97;
  double v98;
  double v99;
  double *v100;
  double *v101;
  unint64_t v102;
  double v103;
  double v104;
  double v105;
  double v106;
  size_t v107;
  unint64_t *p_count;
  unint64_t *v109;
  double *v110;
  _QWORD *v111;
  unint64_t *v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  _QWORD *v116;
  char *v117;
  unint64_t v118;
  unsigned int v119;
  _QWORD *v120;
  unint64_t v121;
  NSUInteger v122;
  NSUInteger v123;
  BOOL v124;
  _QWORD *v125;
  unint64_t v126;
  double v127;
  double *v128;
  int (__cdecl *v129)(const void *, const void *);
  double *v130;
  unint64_t v131;
  _QWORD *v132;
  unint64_t v133;
  double *displayPositions;
  unint64_t *displayCharIndexes;
  double *v136;
  size_t v137;
  double *logicalLeftBoundaries;
  double *logicalRightBoundaries;
  double *v140;
  size_t v141;
  double v142;
  unsigned __int8 *v143;
  double *v144;
  uint64_t v145;
  _QWORD *v146;
  size_t v147;
  _QWORD *v148;
  double *v149;
  unint64_t v150;
  uint64_t v151;
  double v152;
  uint64_t v153;
  uint64_t v154;
  size_t v155;
  double v156;
  double *v157;
  unint64_t *v158;
  double *v159;
  unint64_t *v160;
  double *logicalAltPositions;
  unint64_t *logicalAltCharIndexes;
  uint64_t v163;
  double *v164;
  double v165;
  unint64_t v166;
  double *displayAltPositions;
  unint64_t *displayAltCharIndexes;
  double *v169;
  double *v170;
  uint64_t v171;
  NSInsertionPointHelper *v172;
  char v173;
  char *v174;
  void *v175;
  unint64_t v176;
  NSUInteger range1;
  unint64_t range1_8;
  NSUInteger length;
  char *v180;
  uint64_t v181;
  __CFString *v182;
  uint64_t v183;
  unint64_t *v184;
  double *v185;
  unsigned __int16 v186;
  uint64_t v187;
  uint64_t v188;
  unint64_t v189;
  uint64_t v190;
  unint64_t v191;
  uint64_t v192;
  _BYTE v193[128];
  _QWORD v194[258];
  NSRange v195;

  v194[256] = *MEMORY[0x1E0C80C00];
  v191 = 0;
  v192 = 0;
  v189 = 0;
  v190 = 0;
  v187 = 0;
  v188 = 0;
  v5 = -[NSTextStorage string](self->_textStorage, "string");
  v6 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, a3, (uint64_t *)&v191);
  v7 = _NSLayoutTreeLineFragmentUsedRectForGlyphAtIndex((uint64_t)self, v191, 0);
  v9 = v8;
  v10 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", v191, v192, 0);
  v12 = v11;
  if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    v18 = (void *)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
  }
  else
  {
    v13 = v191;
    if (-[NSRunStorage count](self->_containerRuns, "count") <= v13)
      return 0;
    containerRuns = self->_containerRuns;
    *(_QWORD *)&v16 = _NSBlockNumberForIndex(containerRuns, v13, 0).n128_u64[0];
    v17 = 0;
    if (containerRuns->_gapBlockIndex <= v15)
      v17 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
    v18 = *(void **)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v17 + v15)];
  }
  if (v18)
    v19 = v12 == 0;
  else
    v19 = 1;
  if (v19)
    return 0;
  v22 = -[NSInsertionPointHelper init](+[NSInsertionPointHelper allocWithZone:](NSInsertionPointHelper, "allocWithZone:", -[NSLayoutManager zone](self, "zone", v16)), "init");
  v20 = v22;
  if (v22)
  {
    v175 = v18;
    v176 = v10;
    v182 = (__CFString *)v5;
    v22->_charRange.location = v10;
    v22->_charRange.length = v12;
    v185 = (double *)NSAllocateCollectable(8 * (v12 + 1), 0);
    v20->_logicalPositions = v185;
    v23 = 0;
    v184 = (unint64_t *)NSAllocateCollectable(8 * (v12 + 1), 0);
    v20->_logicalCharIndexes = v184;
    if ((*((_BYTE *)&self->_lmFlags + 3) & 2) != 0)
      v23 = (char *)malloc_type_malloc(v12 + 1, 0x100004077774924uLL);
    v24 = 0;
    if (!v185)
    {
      v25 = 0;
      v26 = 0;
      v27 = 0;
      goto LABEL_175;
    }
    v25 = 0;
    v26 = 0;
    v27 = 0;
    if (!v184)
      goto LABEL_175;
    if ((*((_BYTE *)&self->_lmFlags + 3) & 2) == 0 || v23)
    {
      v172 = v20;
      v171 = objc_msgSend((id)objc_msgSend(v18, "textView"), "layoutOrientation");
      objc_msgSend(v18, "lineFragmentPadding");
      v29 = v28;
      v30 = v7 + v9;
      v31 = v176 + v12;
      v180 = v23;
      if (v176 < v176 + v12)
      {
        length = 0;
        v32 = 0;
        v173 = 0;
        v181 = 0;
        v174 = v23 + 1;
        v33 = v182;
        v170 = v185 + 1;
        range1 = 0x7FFFFFFFFFFFFFFFLL;
        range1_8 = v176 + v12;
        while (1)
        {
          RangeOfCharacterClusterAtIndex = CFStringGetRangeOfCharacterClusterAtIndex();
          v36 = v35;
          if (v35 <= 1)
          {
            if (-[__CFString characterAtIndex:](v33, "characterAtIndex:", RangeOfCharacterClusterAtIndex) == 13
              && RangeOfCharacterClusterAtIndex + 1 < v31)
            {
              if (-[__CFString characterAtIndex:](v33, "characterAtIndex:") == 10)
                v36 = 2;
              else
                v36 = 1;
            }
            else
            {
              v36 = 1;
            }
          }
          v37 = v36 + RangeOfCharacterClusterAtIndex;
          if (v36 + RangeOfCharacterClusterAtIndex >= v31)
          {
            v38 = -[__CFString characterAtIndex:](v33, "characterAtIndex:", v37 - 1);
            if (v38 > 132)
            {
              if ((v38 - 8232) < 2 || v38 == 133)
              {
LABEL_128:
                v51 = RangeOfCharacterClusterAtIndex;
                goto LABEL_129;
              }
            }
            else if (v38 == 13)
            {
              if (v37 >= -[__CFString length](v33, "length")
                || -[__CFString characterAtIndex:](v33, "characterAtIndex:", v36 + RangeOfCharacterClusterAtIndex) != 10)
              {
                goto LABEL_128;
              }
            }
            else if (v38 == 10 || v38 == 12)
            {
              goto LABEL_128;
            }
          }
          v39 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", RangeOfCharacterClusterAtIndex, v36, &v189, v170);
          v41 = v40;
          if (!v190)
            v190 = 1;
          -[NSLayoutManager locationForGlyphAtIndex:](self, "locationForGlyphAtIndex:", v39);
          v43 = v42;
          v44 = v39 + v41;
          v45 = v39 + 1;
          if (v39 + 1 < v39 + v41)
          {
            v46 = v41 - 1;
            do
            {
              -[NSLayoutManager locationForGlyphAtIndex:](self, "locationForGlyphAtIndex:", v45);
              if (v47 < v43)
                v43 = v47;
              ++v45;
              --v46;
            }
            while (v46);
          }
          v184[v32] = RangeOfCharacterClusterAtIndex;
          v185[v32] = v43;
          v23 = v180;
          if (v180)
          {
            v48 = _NSGlyphTreeBidiLevelForGlyphAtIndex((uint64_t)self, v39);
            v180[v32] = v48;
            v173 = v48;
            LOBYTE(v181) = (v48 != 0) | v181;
            BYTE4(v181) |= v48 == 0;
            if ((-[NSLayoutManager propertyForGlyphAtIndex:](self, "propertyForGlyphAtIndex:", v39) & 4) != 0)
            {
              v49.length = length;
              if (length)
              {
                v49.location = range1;
                v195.location = RangeOfCharacterClusterAtIndex;
                v195.length = v36;
                v50 = NSUnionRange(v49, v195);
                range1 = v50.location;
                length = v50.length;
              }
              else
              {
                length = v36;
                range1 = RangeOfCharacterClusterAtIndex;
              }
            }
            else
            {
              length = 0;
              range1 = 0x7FFFFFFFFFFFFFFFLL;
            }
          }
          v51 = v190 + v189;
          if (v37 < v190 + v189)
            break;
          v33 = v182;
          v31 = range1_8;
LABEL_94:
          ++v32;
          if (v51 >= v31)
            goto LABEL_129;
        }
        v194[0] = 0;
        v52 = -[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", CFSTR("NSFont"), RangeOfCharacterClusterAtIndex, &v187);
        if (v188 + v187 < v190 + v189)
          goto LABEL_92;
        v53 = (void *)v52;
        v54 = (void *)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", CFSTR("CTVerticalForms"), RangeOfCharacterClusterAtIndex, 0);
        if (!v53)
          v53 = (void *)NSDefaultFont();
        v55 = objc_msgSend(v54, "BOOLValue");
        if (v54)
          v56 = 1;
        else
          v56 = v171 == 0;
        v57 = v56;
        if (v55 || (v58 = (uint64_t)v53, (v57 & 1) == 0))
          v58 = objc_msgSend(v53, "verticalFont");
        v59 = v58 ? (void *)v58 : v53;
        v60 = -[NSLayoutManager substituteFontForFont:](self, "substituteFontForFont:", v59);
        if (v39 >= v44)
        {
LABEL_92:
          v33 = v182;
          v31 = range1_8;
        }
        else
        {
          v61 = v60;
          v62 = 0.0;
          v63 = 1;
          do
          {
            v64 = _NSGlyphTreeGlyphAtIndex((uint64_t)self, v39, 0);
            if (v64)
            {
              v65 = v64;
              if (v64 != 0xFFFFFF
                && !-[NSLayoutManager notShownAttributeForGlyphAtIndex:](self, "notShownAttributeForGlyphAtIndex:", v39))
              {
                v186 = v65;
                v66 = -[UIFont getCaretPositions:forGlyph:maximumLength:](v61, "getCaretPositions:forGlyph:maximumLength:", v193, v65, 16);
                if ((unint64_t)(v66 - 1) > 0xE || v66 + v63 > 0xFF)
                {
                  v69 = v63;
                }
                else
                {
                  v67 = (double *)v193;
                  do
                  {
                    v68 = *v67++;
                    v69 = v63 + 1;
                    *(double *)&v194[v63++] = v62 + v68;
                    --v66;
                  }
                  while (v66);
                }
                -[UIFont _totalAdvancementForNativeGlyphs:count:](v61, "_totalAdvancementForNativeGlyphs:count:", &v186, 1);
                v62 = v62 + v70;
                v63 = v69;
              }
            }
            ++v39;
          }
          while (v39 != v44);
          if (v62 > 0.0 && v63 <= 1)
          {
            v71 = v189;
            v72 = v190 + v189;
            v33 = v182;
            v31 = range1_8;
            if (v189 < v190 + v189)
            {
              while (1)
              {
                v73 = -[__CFString characterAtIndex:](v182, "characterAtIndex:", v71);
                if ((v73 - 1792) >> 9 < 0xB || v73 >> 8 > 0x30 || v73 - 11904 < 0x180)
                  goto LABEL_93;
                ++v71;
                v72 = v190 + v189;
                if (v71 >= v190 + v189)
                  goto LABEL_98;
              }
            }
            goto LABEL_98;
          }
          v33 = v182;
          v31 = range1_8;
          if (v62 > 0.0)
          {
            v72 = v190 + v189;
LABEL_98:
            v74 = v32;
            if (v37 < v72)
            {
              v74 = v32;
              do
              {
                v75 = CFStringGetRangeOfCharacterClusterAtIndex();
                v184[v74 + 1] = v75;
                if (v180)
                  v174[v74] = v173;
                ++v74;
              }
              while (v75 + v76 < v190 + v189);
            }
            v77 = v74 - v32 + 1;
            if (v63 == v77)
            {
              v78 = v74 - v32;
              if (v74 >= v32)
              {
                v79 = 0;
                do
                {
                  if ((v173 & 1) != 0)
                    v80 = v78;
                  else
                    v80 = v79;
                  v185[v32 + v79++] = v43 + *(double *)&v194[v80];
                  --v78;
                }
                while (v32 + v79 <= v74);
              }
            }
            else
            {
              v81 = v74 - v32;
              if (v74 >= v32)
              {
                v82 = 0;
                v83 = (double)(unint64_t)v77;
                v84 = v32 + 1;
                if (v32 + 1 <= v74 + 1)
                  v84 = v74 + 1;
                v85 = v84 - v32;
                v86 = (v84 - v32 + 1) & 0xFFFFFFFFFFFFFFFELL;
                v87 = (uint64x2_t)vdupq_n_s64(v85 - 1);
                v88 = &v170[v32];
                do
                {
                  v89 = vmovn_s64((int64x2_t)vcgeq_u64(v87, (uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v82), (int8x16_t)xmmword_18D6CBD40)));
                  if ((v89.i8[0] & 1) != 0)
                  {
                    if ((v173 & 1) != 0)
                      v90 = v81;
                    else
                      v90 = v82;
                    *(v88 - 1) = v43 + v62 * (double)v90 / v83;
                  }
                  if ((v89.i8[4] & 1) != 0)
                  {
                    v91 = v81 - 1;
                    if ((v173 & 1) == 0)
                      v91 = v82 + 1;
                    *v88 = v43 + v62 * (double)v91 / v83;
                  }
                  v82 += 2;
                  v81 -= 2;
                  v88 += 2;
                }
                while (v86 != v82);
              }
            }
            v32 = v74;
          }
        }
LABEL_93:
        v51 = v190 + v189;
        goto LABEL_94;
      }
      v181 = 0;
      v32 = 0;
      length = 0;
      range1 = 0x7FFFFFFFFFFFFFFFLL;
      v51 = v176;
LABEL_129:
      HasRightToLeftBaseWritingDirectionAtIndex = 0;
      v93 = v7 + v29;
      v94 = v30 - v29;
      if (v23)
      {
        if ((v181 & 0x100000000) == 0)
        {
          v95 = (void *)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v176, 0);
          v96 = v95;
          if (!v95
            || (HasRightToLeftBaseWritingDirectionAtIndex = objc_msgSend(v95, "baseWritingDirection"),
                HasRightToLeftBaseWritingDirectionAtIndex == -1))
          {
            v97 = (void *)objc_msgSend(v175, "textView", v170);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v96 = (void *)objc_msgSend(v97, "defaultParagraphStyle");
            if (!v96
              || (HasRightToLeftBaseWritingDirectionAtIndex = objc_msgSend(v96, "baseWritingDirection"),
                  HasRightToLeftBaseWritingDirectionAtIndex == -1))
            {
              HasRightToLeftBaseWritingDirectionAtIndex = _NSStringHasRightToLeftBaseWritingDirectionAtIndex(v182, v176, 0, -[__CFString length](v182, "length"));
            }
          }
        }
      }
      v98 = v93 - v6;
      v99 = v94 - v6;
      v172->_writingDirection = HasRightToLeftBaseWritingDirectionAtIndex;
      if (v32)
      {
        v100 = v185;
        v101 = v185;
        v102 = v32;
        v103 = v99;
        do
        {
          v104 = *v101++;
          v105 = v104;
          if (v104 < v103)
            v103 = v105;
          if (v105 > v98)
            v98 = v105;
          --v102;
        }
        while (v102);
      }
      else
      {
        v103 = v99;
        v100 = v185;
      }
      v184[v32] = v51;
      v183 = HasRightToLeftBaseWritingDirectionAtIndex;
      if (HasRightToLeftBaseWritingDirectionAtIndex == 1)
        v106 = v103;
      else
        v106 = v99;
      v100[v32] = v106;
      if (v23)
        v23[v32] = HasRightToLeftBaseWritingDirectionAtIndex == 1;
      v107 = v32 + 1;
      v172->_count = v32 + 1;
      p_count = &v172->_count;
      v25 = malloc_type_malloc(32 * (v32 + 1), 0x1000040E0EAB150uLL);
      v172->_logicalLeftBoundaries = (double *)NSAllocateCollectable(8 * (v32 + 1), 0);
      v172->_logicalRightBoundaries = (double *)NSAllocateCollectable(8 * (v32 + 1), 0);
      v172->_displayPositions = (double *)NSAllocateCollectable(8 * (v32 + 1), 0);
      v109 = (unint64_t *)NSAllocateCollectable(8 * (v32 + 1), 0);
      v172->_displayCharIndexes = v109;
      if (!v25 || !v172->_logicalLeftBoundaries || !v172->_logicalRightBoundaries)
      {
        v24 = 0;
        v26 = 0;
        v27 = 0;
        goto LABEL_174;
      }
      v24 = 0;
      if (!v172->_displayPositions)
      {
        v26 = 0;
        v27 = 0;
        goto LABEL_174;
      }
      v26 = 0;
      v27 = 0;
      if (!v109)
      {
LABEL_174:
        *p_count = 0;
        v20 = v172;
        v23 = v180;
        goto LABEL_175;
      }
      v23 = v180;
      v110 = v185;
      if (v32 != -1)
      {
        v111 = v25 + 2;
        v112 = v184;
        v113 = v32 + 1;
        do
        {
          v114 = *(_QWORD *)v110++;
          *v111 = v114;
          v115 = *v112++;
          *(v111 - 2) = v115;
          v111 += 4;
          --v113;
        }
        while (v113);
        if ((v181 & 1) != 0)
        {
          v116 = v25 + 1;
          v117 = v180;
          v118 = v32 + 1;
          do
          {
            v119 = *v117++;
            *v116 = v119;
            v116 += 4;
            --v118;
          }
          while (v118);
          if (range1 != 0x7FFFFFFFFFFFFFFFLL && length)
          {
            v120 = v25 + 1;
            v121 = v32 + 1;
            do
            {
              v122 = *(v120 - 1);
              v124 = v122 >= range1;
              v123 = v122 - range1;
              v124 = !v124 || v123 >= length;
              if (!v124)
                *v120 = v180[v32];
              v120 += 4;
              --v121;
            }
            while (v121);
          }
        }
        else
        {
          v125 = v25 + 1;
          v126 = v32 + 1;
          do
          {
            *v125 = 0;
            v125 += 4;
            --v126;
          }
          while (v126);
        }
      }
      v127 = v103 + -1.0;
      if (v183 != 1)
        v127 = v98 + 1.0;
      v128 = (double *)&v25[4 * v32];
      v128[2] = v127;
      if (v183 == 1)
        v129 = (int (__cdecl *)(const void *, const void *))_NSInsertionPointDisplayCompareR;
      else
        v129 = (int (__cdecl *)(const void *, const void *))_NSInsertionPointDisplayCompareL;
      qsort(v25, v32 + 1, 0x20uLL, v129);
      if (v32 == -1)
      {
        v128[3] = v99;
        qsort(v25, 0, 0x20uLL, (int (__cdecl *)(const void *, const void *))_NSInsertionPointLogicalCompare);
        v20 = v172;
      }
      else
      {
        v130 = (double *)(v25 + 2);
        v131 = v32 + 1;
        do
        {
          if (*((_QWORD *)v130 - 2) == v51)
            *v130 = v106;
          v130 += 4;
          --v131;
        }
        while (v131);
        if (v107 >= 2)
        {
          v132 = v25 + 3;
          v133 = v32;
          do
          {
            *v132 = v132[3];
            v132 += 4;
            --v133;
          }
          while (v133);
        }
        *(double *)&v25[4 * v32 + 3] = v99;
        v20 = v172;
        if (!((v107 == 0) | v181 & 1))
        {
          displayPositions = v172->_displayPositions;
          displayCharIndexes = v172->_displayCharIndexes;
          v136 = (double *)(v25 + 2);
          v137 = v107;
          do
          {
            *displayPositions++ = *v136;
            *displayCharIndexes++ = *((_QWORD *)v136 - 2);
            v136 += 4;
            --v137;
          }
          while (v137);
        }
        qsort(v25, v107, 0x20uLL, (int (__cdecl *)(const void *, const void *))_NSInsertionPointLogicalCompare);
        if (v107)
        {
          logicalLeftBoundaries = v172->_logicalLeftBoundaries;
          logicalRightBoundaries = v172->_logicalRightBoundaries;
          v140 = (double *)(v25 + 3);
          v141 = v107;
          do
          {
            *logicalLeftBoundaries++ = *(v140 - 1);
            v142 = *v140;
            v140 += 4;
            *logicalRightBoundaries++ = v142;
            --v141;
          }
          while (v141);
        }
      }
      if ((v181 & 1) == 0)
      {
        v24 = 0;
        v26 = 0;
        v27 = 0;
        goto LABEL_175;
      }
      v26 = malloc_type_malloc(8 * v107, 0x100004000313F17uLL);
      v27 = malloc_type_malloc(8 * v107, 0x100004000313F17uLL);
      v143 = (unsigned __int8 *)malloc_type_malloc(v107, 0x100004077774924uLL);
      v24 = v143;
      if (v26 && v27 && v143)
      {
        v144 = (double *)v25;
        if (!v107)
        {
          qsort(v25, 0, 0x20uLL, v129);
          v147 = 0;
          goto LABEL_244;
        }
        v145 = 0;
        v146 = v25;
        v147 = 0;
        v148 = v146 + 3;
        v149 = v185;
        while (1)
        {
          v150 = *(v148 - 3);
          v27[v147] = v150;
          v184[v145] = v150;
          LOBYTE(v150) = *((_BYTE *)v148 - 16);
          v143[v145] = v150;
          v180[v145] = v150;
          v151 = *(v148 - 2);
          if (v183 == 1)
          {
            if ((v151 & 1) != 0)
            {
              v185[v145] = *(double *)v148;
              if (!v145 || (*(_BYTE *)(v148 - 6) & 1) != 0)
                goto LABEL_236;
              v153 = *(v148 - 4);
            }
            else if (v145)
            {
              if ((*(_BYTE *)(v148 - 6) & 1) == 0)
              {
                v152 = *((double *)v148 - 1);
LABEL_235:
                v185[v145] = v152;
                goto LABEL_236;
              }
              v185[v145] = *((double *)v148 - 5);
              v153 = *(v148 - 1);
            }
            else
            {
              *v185 = v99;
              v153 = *((_QWORD *)v144 + 2);
            }
          }
          else if ((v151 & 1) != 0)
          {
            if (v145)
            {
              if ((*(_BYTE *)(v148 - 6) & 1) != 0)
              {
                v152 = *(double *)v148;
                goto LABEL_235;
              }
              v185[v145] = *((double *)v148 - 4);
              v153 = *v148;
            }
            else
            {
              *v185 = v103;
              v153 = *((_QWORD *)v144 + 3);
            }
          }
          else
          {
            v185[v145] = *((double *)v148 - 1);
            if (!v145 || (*(_BYTE *)(v148 - 6) & 1) == 0)
              goto LABEL_236;
            v153 = *(v148 - 5);
          }
          v26[v147++] = v153;
LABEL_236:
          ++v145;
          v148 += 4;
          if (v107 == v145)
          {
            v154 = 2;
            v155 = v107;
            do
            {
              v156 = *v149++;
              v144[v154] = v156;
              v154 += 4;
              --v155;
            }
            while (v155);
            qsort(v144, v107, 0x20uLL, v129);
            v157 = v20->_displayPositions;
            v158 = v20->_displayCharIndexes;
            v159 = v144 + 2;
            do
            {
              *v157++ = *v159;
              *v158++ = *((_QWORD *)v159 - 2);
              v159 += 4;
              --v107;
            }
            while (v107);
LABEL_244:
            if (!v147)
            {
              v23 = v180;
              goto LABEL_256;
            }
            v20->_altCount = v147;
            p_count = &v20->_altCount;
            v20->_logicalAltPositions = (double *)NSAllocateCollectable(8 * v147, 0);
            v20->_logicalAltCharIndexes = (unint64_t *)NSAllocateCollectable(8 * v147, 0);
            v20->_displayAltPositions = (double *)NSAllocateCollectable(8 * v147, 0);
            v160 = (unint64_t *)NSAllocateCollectable(8 * v147, 0);
            v20->_displayAltCharIndexes = v160;
            logicalAltPositions = v20->_logicalAltPositions;
            if (logicalAltPositions)
            {
              logicalAltCharIndexes = v20->_logicalAltCharIndexes;
              if (logicalAltCharIndexes)
              {
                if (v20->_displayAltPositions && v160)
                {
                  v163 = 0;
                  v164 = v144 + 2;
                  do
                  {
                    v165 = *(double *)&v26[v163];
                    logicalAltPositions[v163] = v165;
                    *v164 = v165;
                    v166 = v27[v163];
                    logicalAltCharIndexes[v163] = v166;
                    *((_QWORD *)v164 - 2) = v166;
                    *((_QWORD *)v164 - 1) = v24[v163++];
                    v164 += 4;
                  }
                  while (v147 != v163);
                  qsort(v144, v147, 0x20uLL, v129);
                  displayAltPositions = v20->_displayAltPositions;
                  displayAltCharIndexes = v20->_displayAltCharIndexes;
                  v169 = v144 + 2;
                  v23 = v180;
                  do
                  {
                    *displayAltPositions++ = *v169;
                    *displayAltCharIndexes++ = *((_QWORD *)v169 - 2);
                    v169 += 4;
                    --v147;
                  }
                  while (v147);
LABEL_256:
                  v25 = v144;
                  break;
                }
              }
            }
            v25 = v144;
            goto LABEL_174;
          }
        }
      }
LABEL_175:
      if (v23)
        free(v23);
      if (v26)
        free(v26);
      if (v27)
        free(v27);
      if (v24)
        free(v24);
      if (v25)
        free(v25);
    }
  }
  return v20;
}

- (int64_t)getLineFragmentInsertionPointArraysForCharacterAtIndex:(unint64_t)a3 inDisplayOrder:(BOOL)a4 positions:(double *)a5 characterIndexes:(unint64_t *)a6 count:(unint64_t *)a7 alternatePositions:(double *)a8 characterIndexes:(unint64_t *)a9 count:(unint64_t *)a10
{
  _BOOL4 v14;
  NSInsertionPointHelper *v15;
  NSInsertionPointHelper *v16;
  int64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t altCount;

  v14 = a4;
  v15 = _insertionPointHelperForCharacterAtIndex((uint64_t)self, a3);
  if (v15)
  {
    v16 = v15;
    result = v15->_writingDirection;
    if (a5)
    {
      v18 = 48;
      if (v14)
        v18 = 80;
      *a5 = *(double **)((char *)&v16->super.isa + v18);
    }
    if (a6)
    {
      v19 = 72;
      if (v14)
        v19 = 88;
      *a6 = *(unint64_t **)((char *)&v16->super.isa + v19);
    }
    if (a7)
      *a7 = v16->_count;
    if (a8)
    {
      v20 = 96;
      if (v14)
        v20 = 112;
      *a8 = *(double **)((char *)&v16->super.isa + v20);
    }
    if (a9)
    {
      v21 = 104;
      if (v14)
        v21 = 120;
      *a9 = *(unint64_t **)((char *)&v16->super.isa + v21);
    }
    if (a10)
    {
      altCount = v16->_altCount;
LABEL_33:
      *a10 = altCount;
    }
  }
  else
  {
    if (a5)
      *a5 = 0;
    if (a6)
      *a6 = 0;
    if (a7)
      *a7 = 0;
    if (a8)
      *a8 = 0;
    if (a9)
      *a9 = 0;
    altCount = 0;
    result = 0;
    if (a10)
      goto LABEL_33;
  }
  return result;
}

- (id)_selectionRangesForInsertionPointRange:(_NSRange)a3
{
  return 0;
}

- (void)_setDrawsUnderlinesLikeWebKit:(BOOL)a3
{
  _DWORD *extraData;
  int v4;
  int v5;

  extraData = self->_extraData;
  v4 = extraData[112];
  if (((((v4 & 0x20000) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 0x20000;
    else
      v5 = 0;
    extraData[112] = v4 & 0xFFFDFFFF | v5;
    -[NSLayoutManager invalidateLayoutForCharacterRange:actualCharacterRange:](self, "invalidateLayoutForCharacterRange:actualCharacterRange:", 0, -[NSTextStorage length](-[NSLayoutManager textStorage](self, "textStorage"), "length"), 0);
  }
}

- (BOOL)_drawsUnderlinesLikeWebKit
{
  return (*((unsigned __int8 *)self->_extraData + 450) >> 1) & 1;
}

- (void)_setDrawsDebugBaselines:(BOOL)a3
{
  _DWORD *extraData;
  int v4;
  int v5;

  extraData = self->_extraData;
  v4 = extraData[112];
  if (((((v4 & 0x40000) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 0x40000;
    else
      v5 = 0;
    extraData[112] = v4 & 0xFFFBFFFF | v5;
    -[NSLayoutManager invalidateLayoutForCharacterRange:actualCharacterRange:](self, "invalidateLayoutForCharacterRange:actualCharacterRange:", 0, -[NSTextStorage length](-[NSLayoutManager textStorage](self, "textStorage"), "length"), 0);
  }
}

- (BOOL)_drawsDebugBaselines
{
  return (*((unsigned __int8 *)self->_extraData + 450) >> 2) & 1;
}

- (void)_setMirrorsTextAlignment:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  *((_DWORD *)self->_extraData + 112) = *((_DWORD *)self->_extraData + 112) & 0xFFF7FFFF | v3;
}

- (void)_setForcesTrackingFloor:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  *((_DWORD *)self->_extraData + 112) = *((_DWORD *)self->_extraData + 112) & 0xFFEFFFFF | v3;
}

- (void)showAttachment:(id)a3 inRect:(CGRect)a4 textContainer:(id)a5 characterIndex:(unint64_t)a6
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v14;
  double v15;
  CGFloat v16;
  int64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  CGContext *v28;
  double v29;
  CGContext *v30;
  double v31;
  CGPoint v32;
  double v33;
  double v34;
  CGPoint v35;
  CGPoint v36;
  NSRect v37;
  NSRect v38;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = objc_msgSend(a3, "attachmentCell");
  if (v14)
  {
    -[NSLayoutManager showAttachmentCell:inRect:characterIndex:](self, "showAttachmentCell:inRect:characterIndex:", v14, a6, x, y, width, height);
  }
  else
  {
    if (a3)
    {
      objc_msgSend(a3, "lineLayoutPadding");
      v16 = v15;
      v17 = -[NSLayoutManager applicationFrameworkContext](self, "applicationFrameworkContext");
      if (v16 != 0.0)
      {
        v37.origin.x = x;
        v37.origin.y = y;
        v37.size.width = width;
        v37.size.height = height;
        v38 = NSInsetRect(v37, v16, 0.0);
        x = v38.origin.x;
        y = v38.origin.y;
        width = v38.size.width;
        height = v38.size.height;
      }
    }
    else
    {
      v17 = -[NSLayoutManager applicationFrameworkContext](self, "applicationFrameworkContext");
    }
    if (objc_msgSend(a3, "usesTextAttachmentView")
      && (v18 = objc_msgSend(a5, "textView")) != 0
      && (v19 = (void *)v18,
          v20 = (void *)objc_msgSend(a3, "viewProviderForParentView:characterIndex:layoutManager:", v18, a6, self),
          (v21 = objc_msgSend(v20, "view")) != 0))
    {
      v22 = (void *)v21;
      objc_msgSend(v19, "contentScaleFactor");
      ((void (*)(double, double, double, double, double))softLinkUIRectIntegralWithScale[0])(x, y - height, width, height, v23);
      objc_msgSend(a3, "placeView:withFrame:inParentView:characterIndex:layoutManager:", v22, v19, a6, self);
      v24 = (void *)*((_QWORD *)self->_extraData + 55);
      if (!v24)
      {
        *((_QWORD *)self->_extraData + 55) = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v24 = (void *)*((_QWORD *)self->_extraData + 55);
      }
      objc_msgSend(v24, "addObject:", v20);
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      objc_msgSend(v22, "setHidden:", 0);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
    else
    {
      v25 = (void *)objc_msgSend(a3, "imageForBounds:textContainer:characterIndex:", a5, a6, x, y, width, height);
      v26 = objc_msgSend(a3, "image");
      if (v17 == 2 && v25 == (void *)v26)
      {
        if (objc_msgSend(v25, "conformsToProtocol:", &unk_1EE095188))
        {
          v27 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "layoutManager"), "textStorage"), "attributesAtIndex:effectiveRange:", a6, 0);
          if (objc_msgSend(v25, "willProvideAdaptedImageForPresentation"))
            v25 = (void *)objc_msgSend(v25, "imageForBounds:attributes:location:textContainer:", v27, 0, a5, x, y, width, height);
        }
      }
      v28 = (CGContext *)objc_msgSend((id)-[objc_class graphicsContextForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "graphicsContextForApplicationFrameworkContext:", -[NSLayoutManager applicationFrameworkContext](self, "applicationFrameworkContext")), "CGContext");
      v29 = y - height;
      if (v28)
      {
        v30 = v28;
        v31 = x;
        v32 = CGContextConvertPointToDeviceSpace(v28, *(CGPoint *)(&v29 - 1));
        v36.x = floor(v32.x + 0.5);
        v36.y = floor(v32.y + 0.5);
        v35 = CGContextConvertPointToUserSpace(v30, v36);
        v34 = v35.y;
        v33 = v35.x;
      }
      else
      {
        v33 = floor(x + 0.5);
        v34 = floor(v29 + 0.5);
      }
      objc_msgSend(v25, "drawInRect:", v33, v34, width, height);
    }
  }
}

- (_NSRange)rangeOfCharacterClusterAtIndex:(unint64_t)a3 type:(int64_t)a4
{
  const __CFString *v5;
  CFIndex RangeOfCharacterClusterAtIndex;
  uint64_t v7;
  uint64_t v8;
  int CharacterAtIndex;
  NSUInteger v10;
  NSUInteger v11;
  CFIndex v12;
  uint64_t v13;
  _NSRange result;

  v5 = (const __CFString *)-[NSTextStorage string](self->_textStorage, "string");
  RangeOfCharacterClusterAtIndex = CFStringGetRangeOfCharacterClusterAtIndex();
  v8 = v7;
  v12 = RangeOfCharacterClusterAtIndex;
  v13 = v7;
  if (v7 == 2)
  {
    CharacterAtIndex = CFStringGetCharacterAtIndex(v5, RangeOfCharacterClusterAtIndex);
    if (((CFStringGetCharacterAtIndex(v5, RangeOfCharacterClusterAtIndex + 1) + (CharacterAtIndex << 10)) & 0x7FFFFE0) == 0x361CDE0)
    {
      -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", RangeOfCharacterClusterAtIndex, 2, &v12);
      RangeOfCharacterClusterAtIndex = v12;
      v8 = v13;
    }
    else
    {
      v8 = 2;
    }
  }
  v10 = RangeOfCharacterClusterAtIndex;
  v11 = v8;
  result.length = v11;
  result.location = v10;
  return result;
}

- (void)_setExtraLineFragmentRect:(CGRect)a3 usedRect:(CGRect)a4 textContainer:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  NSTextContainer *extraLineFragmentContainer;
  CFDictionaryRef *extraData;
  CGFloat v17;
  void *v18;
  NSRect v19;
  NSRect v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  if (self->_extraLineFragmentContainer)
  {
    memset(&v19, 0, sizeof(v19));
    _NSLayoutTreeGetExtraLineFragmentRect((uint64_t)self, (uint64_t)&v19, 0);
    if (!NSIsEmptyRect(v19))
    {
      extraLineFragmentContainer = self->_extraLineFragmentContainer;
      v19.origin.x = 0.0;
      extraData = (CFDictionaryRef *)self->_extraData;
      if (extraData[10] == (CFDictionaryRef)extraLineFragmentContainer)
      {
        v17 = 0.0;
      }
      else
      {
        if (!CFDictionaryGetValueIfPresent(extraData[11], extraLineFragmentContainer, (const void **)&v19))
          goto LABEL_9;
        v17 = v19.origin.x;
        if (*(_QWORD *)&v19.origin.x == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_9;
      }
      -[NSLayoutManager _invalidateUsageForTextContainersInRange:](self, "_invalidateUsageForTextContainersInRange:", *(_QWORD *)&v17, 1, *(_QWORD *)&v19.origin.x);
    }
  }
LABEL_9:
  _NSLayoutTreeSetExtraLineFragmentRect((uint64_t)self, v13, v12, v11, v10, x, y, width, height);
  self->_extraLineFragmentContainer = (NSTextContainer *)a5;
  if (a5)
  {
    v20.origin.x = v13;
    v20.origin.y = v12;
    v20.size.width = v11;
    v20.size.height = v10;
    if (!NSIsEmptyRect(v20))
    {
      -[NSLayoutManager _updateUsageForTextContainer:addingUsedRect:](self, "_updateUsageForTextContainer:addingUsedRect:", a5, x, y, width, height);
      -[NSLayoutManager invalidateDisplayForCharacterRange:](self, "invalidateDisplayForCharacterRange:", -[NSTextStorage length](self->_textStorage, "length"), 0);
      if (objc_msgSend(a5, "textView"))
      {
        if (!-[NSTextStorage length](self->_textStorage, "length"))
        {
          v18 = (void *)objc_msgSend(a5, "textView");
          objc_msgSend(v18, "bounds");
          objc_msgSend(v18, "setNeedsDisplayInRect:avoidAdditionalLayout:", 1);
        }
      }
    }
  }
}

- (void)setParagraphArbitrator:(id)a3
{
  id v4;
  NSParagraphArbitrator *v5;
  id v6;

  v4 = (id)*((_QWORD *)self->_extraData + 53);
  if (v4 != a3)
  {
    v6 = v4;
    if (a3)
      v5 = (NSParagraphArbitrator *)a3;
    else
      v5 = -[NSParagraphArbitrator initWithAttributedString:range:]([NSParagraphArbitrator alloc], "initWithAttributedString:range:", 0, 0x7FFFFFFFFFFFFFFFLL, 0);
    *((_QWORD *)self->_extraData + 53) = v5;

  }
}

- (CUIStyleEffectConfiguration)styleEffectConfiguration
{
  return (CUIStyleEffectConfiguration *)*((_QWORD *)self->_extraData + 54);
}

- (void)setStyleEffectConfiguration:(id)a3
{
  _QWORD *extraData;
  id v4;

  extraData = self->_extraData;
  if ((id)extraData[54] != a3)
  {
    v4 = (id)extraData[54];
    *((_QWORD *)self->_extraData + 54) = objc_msgSend(a3, "copy");

  }
}

- (id)viewProviderForTextAttachment:(id)a3 characterIndex:(unint64_t)a4
{
  return -[NSLayoutManager temporaryAttribute:atCharacterIndex:effectiveRange:](self, "temporaryAttribute:atCharacterIndex:effectiveRange:", CFSTR("NSViewTextAttachmentCellHelper"), a4, 0);
}

- (void)setViewProvider:(id)a3 forTextAttachment:(id)a4 characterIndex:(unint64_t)a5
{
  if (a3)
    -[NSLayoutManager addTemporaryAttribute:value:forCharacterRange:](self, "addTemporaryAttribute:value:forCharacterRange:", CFSTR("NSViewTextAttachmentCellHelper"), a3, a5, 1);
}

- (void)beginScrollingForView:(id)a3 textContainer:(id)a4
{
  uint64_t v5;

  if (beginScrollingForView_textContainer__onceToken != -1)
    dispatch_once(&beginScrollingForView_textContainer__onceToken, &__block_literal_global_191);
  if (-[NSLayoutManager hasNonContiguousLayout](self, "hasNonContiguousLayout"))
  {
    if ((beginScrollingForView_textContainer__allowsLiveScrollOptimization & 1) == 0)
    {
      *((_DWORD *)self->_extraData + 112) |= 0x200000u;
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      *((_QWORD *)self->_extraData + 63) = v5;
    }
  }
}

uint64_t __66__NSLayoutManager_NSPrivate__beginScrollingForView_textContainer___block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("_NSLayoutManagerDisableLiveScrollingOptimization"));
  if ((_DWORD)result)
    beginScrollingForView_textContainer__allowsLiveScrollOptimization = 1;
  return result;
}

- (void)endScrollingForView:(id)a3 textContainer:(id)a4
{
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t j;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double x;
  double y;
  double width;
  double height;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSRect v31;
  NSRect v32;
  NSRect v33;

  *((_DWORD *)self->_extraData + 112) &= ~0x200000u;
  if (-[NSLayoutManager hasNonContiguousLayout](self, "hasNonContiguousLayout"))
  {
    objc_msgSend(a3, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[NSLayoutManager _noteFirstTextViewVisibleCharacterRangeIfAfterIndex:](self, "_noteFirstTextViewVisibleCharacterRangeIfAfterIndex:", 0);
    -[NSLayoutManager _invalidateUsageForTextContainersInRange:](self, "_invalidateUsageForTextContainersInRange:", 0, 1);
    v15 = -[NSMutableArray count](self->_textContainers, "count");
    v16 = -[NSMutableArray count](self->_textContainers, "count");
    if (v16)
    {
      v17 = v16;
      for (i = 0; i != v17; ++i)
      {
        if ((*(_BYTE *)(CFStorageGetValueAtIndex() + 64) & 1) != 0)
          -[NSLayoutManager _recalculateUsageForTextContainerAtIndex:](self, "_recalculateUsageForTextContainerAtIndex:", i);
      }
    }
    if (v15)
    {
      for (j = 0; j != v15; ++j)
      {
        if ((*(_BYTE *)(CFStorageGetValueAtIndex() + 64) & 2) != 0)
          -[NSLayoutManager _resizeTextViewForTextContainer:](self, "_resizeTextViewForTextContainer:", -[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", j));
      }
    }
    objc_msgSend(a3, "bounds");
    v33.origin.x = v20;
    v33.origin.y = v21;
    v33.size.width = v22;
    v33.size.height = v23;
    v31.origin.x = v8;
    v31.origin.y = v10;
    v31.size.width = v12;
    v31.size.height = v14;
    if (NSEqualRects(v31, v33))
    {
      objc_msgSend(a3, "visibleRect");
      x = v32.origin.x;
      y = v32.origin.y;
      width = v32.size.width;
      height = v32.size.height;
      if (!NSIsEmptyRect(v32))
      {
        v28 = -[NSLayoutManager glyphRangeForBoundingRectWithoutAdditionalLayout:inTextContainer:](self, "glyphRangeForBoundingRectWithoutAdditionalLayout:inTextContainer:", a4, x, y, width, height);
        if (v29)
          -[NSLayoutManager _primitiveInvalidateDisplayForGlyphRange:](self, "_primitiveInvalidateDisplayForGlyphRange:", v28, v29);
      }
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture"), "timeIntervalSinceReferenceDate");
  *((_QWORD *)self->_extraData + 63) = v30;
}

- (BOOL)isScrolling
{
  return (*((unsigned __int8 *)self->_extraData + 450) >> 5) & 1;
}

- (CGRect)prepareLayoutForBoundingRect:(CGRect)a3 textContainer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  char v10;
  id *p_extraData;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  double v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t j;
  uint64_t v23;
  int v24;
  double v25;
  double v26;
  double v27;
  double v28;
  unint64_t v29;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = !-[NSLayoutManager isScrolling](self, "isScrolling");
  if (prepareLayoutForBoundingRect_textContainer__onceToken != -1)
    dispatch_once(&prepareLayoutForBoundingRect_textContainer__onceToken, &__block_literal_global_195);
  p_extraData = &self->_extraData;
  while ((*(_BYTE *)(*((_QWORD *)self->_extraData + 30) + 56) & 1) != 0)
  {
    v12 = -[NSLayoutManager glyphRangeForBoundingRect:inTextContainer:](self, "glyphRangeForBoundingRect:inTextContainer:", a4, x, y, width, height);
    v13 = v12;
    v15 = v14;
    v29 = 0;
    if ((*(_DWORD *)&self->_lmFlags & 0x40000000) != 0)
      v16 = v12;
    else
      v16 = 0;
    _NSLayoutTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, v16, &v29);
    if (v29 >= v13 + v15)
      break;
    -[NSLayoutManager ensureLayoutForGlyphRange:](self, "ensureLayoutForGlyphRange:", v13, v15);
    if (v13 + v15 < -[NSLayoutManager numberOfGlyphs](self, "numberOfGlyphs"))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      if (v17 - *((double *)*p_extraData + 63) <= *(double *)&prepareLayoutForBoundingRect_textContainer__timeStampDelta)
        continue;
    }
    v10 = 1;
    p_extraData = &self->_extraData;
  }
  if (-[NSLayoutManager hasNonContiguousLayout](self, "hasNonContiguousLayout") && (v10 & 1) != 0)
  {
    v18 = -[NSLayoutManager isScrolling](self, "isScrolling");
    *((_DWORD *)*p_extraData + 112) &= ~0x200000u;
    v19 = -[NSMutableArray count](self->_textContainers, "count");
    v20 = -[NSMutableArray count](self->_textContainers, "count");
    if (v20)
    {
      for (i = 0; i != v20; ++i)
      {
        if ((*(_BYTE *)(CFStorageGetValueAtIndex() + 64) & 1) != 0)
          -[NSLayoutManager _recalculateUsageForTextContainerAtIndex:](self, "_recalculateUsageForTextContainerAtIndex:", i);
      }
    }
    if (v19)
    {
      for (j = 0; j != v19; ++j)
      {
        if ((*(_BYTE *)(CFStorageGetValueAtIndex() + 64) & 2) != 0)
          -[NSLayoutManager _resizeTextViewForTextContainer:](self, "_resizeTextViewForTextContainer:", -[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", j));
      }
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *((_QWORD *)*p_extraData + 63) = v23;
    if (v18)
      v24 = 0x200000;
    else
      v24 = 0;
    *((_DWORD *)*p_extraData + 112) = *((_DWORD *)*p_extraData + 112) & 0xFFDFFFFF | v24;
  }
  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

uint64_t __73__NSLayoutManager_NSPrivate__prepareLayoutForBoundingRect_textContainer___block_invoke()
{
  void *v0;
  uint64_t result;
  uint64_t v2;

  v0 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("_NSLayoutManagerLiveScrollResizeTimeStampDelta"));
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    result = objc_msgSend(v0, "doubleValue");
    prepareLayoutForBoundingRect_textContainer__timeStampDelta = v2;
  }
  return result;
}

- (id)underlineColorForTextAlternatives
{
  if ((*((_BYTE *)self->_extraData + 450) & 0x40) != 0)
    return objc_getAssociatedObject(self, sel_underlineColorForTextAlternatives);
  else
    return 0;
}

- (void)setUnderlineColorForTextAlternatives:(id)a3
{
  BOOL v4;

  v4 = a3 != 0;
  objc_setAssociatedObject(self, sel_underlineColorForTextAlternatives, a3, (void *)0x301);
  *((_DWORD *)self->_extraData + 112) = *((_DWORD *)self->_extraData + 112) & 0xFFBFFFFF | (v4 << 22);
}

- (id)underlineColorForSpelling
{
  if ((*((_BYTE *)self->_extraData + 450) & 0x40) != 0)
    return objc_getAssociatedObject(self, sel_underlineColorForSpelling);
  else
    return 0;
}

- (void)setUnderlineColorForSpelling:(id)a3
{
  BOOL v4;

  v4 = a3 != 0;
  objc_setAssociatedObject(self, sel_underlineColorForSpelling, a3, (void *)0x301);
  *((_DWORD *)self->_extraData + 112) = *((_DWORD *)self->_extraData + 112) & 0xFFBFFFFF | (v4 << 22);
}

- (void)setApplicationFrameworkContext:(int64_t)a3
{
  if (!a3)
    LOBYTE(a3) = _NSTextScalingTypeForCurrentEnvironment();
  *((_DWORD *)self->_extraData + 112) = *((_DWORD *)self->_extraData + 112) & 0xFC7FFFFF | ((a3 & 7) << 23);
}

- (id)renderingColorForDocumentColor:(id)a3
{
  int v5;
  id result;

  v5 = *((_DWORD *)self->_extraData + 112);
  if ((v5 & 0x8000000) == 0)
    goto LABEL_4;
  result = (id)objc_msgSend(-[NSLayoutManager delegate](self, "delegate"), "layoutManager:renderingColorForDocumentColor:", self, a3);
  if (!result)
  {
    v5 = *((_DWORD *)self->_extraData + 112);
LABEL_4:
    if ((v5 & 0x10000000) != 0)
      result = (id)objc_msgSend(self->_firstTextView, "renderingColorForDocumentColor:", a3);
    else
      result = 0;
  }
  if (!result)
    return a3;
  return result;
}

- (void)fillMarkedBackgroundRectArray:(const CGRect *)a3 count:(unint64_t)a4 forCharacterRange:(_NSRange)a5 color:(id)a6
{
  unint64_t v6;
  CGContext *v8;
  CGSize *p_size;
  const CGPath *v10;
  CGRect v11;

  v6 = a4;
  if ((*((_BYTE *)self->_extraData + 451) & 0x20) != 0)
  {
    if (a4)
    {
      v8 = (CGContext *)objc_msgSend((id)-[objc_class graphicsContextForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass", a3, a4, a5.location, a5.length, a6), "graphicsContextForApplicationFrameworkContext:", -[NSLayoutManager applicationFrameworkContext](self, "applicationFrameworkContext")), "CGContext");
      CGContextSaveGState(v8);
      CGContextSetShouldAntialias(v8, 1);
      p_size = &a3->size;
      do
      {
        v11 = *(CGRect *)&p_size[-1].width;
        p_size += 2;
        v10 = CGPathCreateWithRoundedRect(v11, 3.0, 3.0, 0);
        CGContextAddPath(v8, v10);
        CGContextFillPath(v8);
        CGPathRelease(v10);
        --v6;
      }
      while (v6);
      CGContextRestoreGState(v8);
    }
  }
  else
  {
    -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](self, "fillBackgroundRectArray:count:forCharacterRange:color:", a3, a4, a5.location, a5.length, a6);
  }
}

- (id)_stringForLoggingLineFragmentForGlyphAtIndex:(int64_t)a3
{
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  NSString *v23;
  NSString *v24;
  NSUInteger i;
  unsigned int v26;
  NSRange v28;
  NSPoint v29;
  NSRect v30;
  NSRect v31;

  if (-[NSLayoutManager numberOfGlyphs](self, "numberOfGlyphs") <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSLayoutManager_Private.m"), 6630, CFSTR("Glyph index %ld is out-of-bounds for %@"), a3, self);
  -[NSLayoutManager ensureLayoutForGlyphRange:](self, "ensureLayoutForGlyphRange:", a3, 1);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Line Fragment @ %ld"), a3);
  v28.location = 0;
  v28.length = 0;
  -[NSLayoutManager lineFragmentRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentRectForGlyphAtIndex:effectiveRange:", a3, &v28);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[NSLayoutManager lineFragmentUsedRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", a3, 0);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = NSStringFromRange(v28);
  v30.origin.x = v8;
  v30.origin.y = v10;
  v30.size.width = v12;
  v30.size.height = v14;
  v24 = NSStringFromRect(v30);
  v31.origin.x = v16;
  v31.origin.y = v18;
  v31.size.width = v20;
  v31.size.height = v22;
  objc_msgSend(v6, "appendFormat:", CFSTR(", glyph range %@, rects %@/%@"), v23, v24, NSStringFromRect(v31));
  for (i = v28.location; i < v28.length + v28.location; ++i)
  {
    v26 = -[NSLayoutManager CGGlyphAtIndex:](self, "CGGlyphAtIndex:", i);
    -[NSLayoutManager locationForGlyphAtIndex:](self, "locationForGlyphAtIndex:", i);
    objc_msgSend(v6, "appendFormat:", CFSTR("\n %ld: %hu %@"), i, v26, NSStringFromPoint(v29));
  }
  return v6;
}

+ (BOOL)_usesScreenFonts
{
  return __NSUsesScreenFonts;
}

+ (BOOL)_ignoresViewTransformations
{
  return __NSIgnoresViewTransformations;
}

+ (BOOL)_showsInvisibleCharacters
{
  return __NSShowsInvisibleCharacters;
}

+ (BOOL)_showsControlCharacters
{
  return __NSShowsControlCharacters;
}

- (void)finalize
{
  objc_super v3;

  _NSGlyphTreeFree((uint64_t)self);
  _NSLayoutTreeFree((uint64_t)self);
  _freeExtraData((uint64_t)self->_extraData);
  v3.receiver = self;
  v3.super_class = (Class)NSLayoutManager;
  -[NSLayoutManager finalize](&v3, sel_finalize);
}

- (void)dealloc
{
  NSMutableArray *textContainers;
  CGRect *cachedRectArray;
  char *glyphBuffer;
  objc_super v6;
  _QWORD v7[5];

  if ((*((_BYTE *)&self->_lmFlags + 1) & 1) != 0)
    _NSRemoveDirtyLayoutManager((uint64_t)self);
  self->_firstTextView = objc_storeWeak(&self->_firstTextView, 0);
  -[NSLayoutManager setDelegate:](self, "setDelegate:", 0);

  textContainers = self->_textContainers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __26__NSLayoutManager_dealloc__block_invoke;
  v7[3] = &unk_1E2603930;
  v7[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](textContainers, "enumerateObjectsUsingBlock:", v7);

  _NSGlyphTreeFree((uint64_t)self);
  _NSLayoutTreeFree((uint64_t)self);
  _freeExtraData((uint64_t)self->_extraData);
  cachedRectArray = self->_cachedRectArray;
  if (cachedRectArray)
    NSZoneFree(0, cachedRectArray);
  glyphBuffer = self->_glyphBuffer;
  if (glyphBuffer)
    NSZoneFree(0, glyphBuffer);
  v6.receiver = self;
  v6.super_class = (Class)NSLayoutManager;
  -[NSLayoutManager dealloc](&v6, sel_dealloc);
}

uint64_t __26__NSLayoutManager_dealloc__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "_hasLayoutManager:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    return objc_msgSend(a2, "setLayoutManager:", 0);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  __lmFlags lmFlags;
  uint64_t v6;
  double *extraData;
  double v8;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    lmFlags = self->_lmFlags;
    v6 = (*(_BYTE *)&lmFlags & 4 | (*(unsigned int *)&lmFlags >> 22) & 3 | (*(unsigned int *)&lmFlags >> 7) & 0x18 | (32 * ((*(unsigned int *)&lmFlags >> 4) & 1)) | (*(unsigned int *)&lmFlags >> 18) & 0x40 | (*(unsigned int *)&lmFlags >> 22) & 0x80 | (*(unsigned int *)&lmFlags >> 13) & 0x100 | (*((_DWORD *)self->_extraData + 112) >> 17) & 0x200) ^ 0x20;
    objc_msgSend(a3, "encodeObject:forKey:", self->_textStorage, CFSTR("NSTextStorage"));
    objc_msgSend(a3, "encodeObject:forKey:", self->_textContainers, CFSTR("NSTextContainers"));
    extraData = (double *)self->_extraData;
    v8 = extraData[24];
    if (v8 != 0.0)
    {
      *(float *)&v8 = v8;
      objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("NSHyphenationFactor"), v8);
      extraData = (double *)self->_extraData;
    }
    if ((*((_BYTE *)extraData + 451) & 0x40) != 0)
      objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSUsesDefaultHyphenation"));
    objc_msgSend(a3, "encodeInt:forKey:", v6, CFSTR("NSLMFlags"));
    objc_msgSend(a3, "encodeConditionalObject:forKey:", -[NSLayoutManager delegate](self, "delegate"), CFSTR("NSDelegate"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@ *** NSLayoutManager does not support non-keyed coding."), _NSFullMethodName());
  }
}

- (NSLayoutManager)initWithCoder:(NSCoder *)coder
{
  float v5;
  int v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  int v11;
  NSMutableArray *v12;
  __int128 v13;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  NSMutableArray *textContainers;
  __CFDictionary *v22;
  unint64_t v23;
  void *v24;
  double v25;
  double v26;
  __lmFlags lmFlags;
  uint64_t j;
  int v30;
  _BOOL4 v31;
  int v32;
  id v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _OWORD v39[4];

  if (-[NSCoder allowsKeyedCoding](coder, "allowsKeyedCoding"))
  {
    v38 = 0u;
    memset(v39, 0, 56);
    v36 = 0u;
    v37 = 0u;
    v35 = 0u;
    -[NSLayoutManager _commonInit](self, "_commonInit");
    -[NSCoder decodeFloatForKey:](coder, "decodeFloatForKey:", CFSTR("NSHyphenationFactor"));
    *((double *)self->_extraData + 24) = v5;
    if (-[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("NSUsesDefaultHyphenation")))
      v6 = -[NSCoder decodeBoolForKey:](coder, "decodeBoolForKey:", CFSTR("NSUsesDefaultHyphenation"));
    else
      v6 = __NSUsesDefaultHyphenation;
    *((_DWORD *)self->_extraData + 112) = *((_DWORD *)self->_extraData + 112) & 0xBFFFFFFF | (v6 << 30);
    v7 = -[NSCoder decodeIntForKey:](coder, "decodeIntForKey:", CFSTR("NSLMFlags"));
    if (((__NSBackgroundLayoutEnabled != 0) & ((v7 & 4) >> 2)) != 0)
      v8 = 4;
    else
      v8 = 0;
    v9 = v8 | *(_DWORD *)&self->_lmFlags & 0xDE1FF3EB | ((v7 & 3) << 22) | (((__NSShowsInvisibleCharacters | v7 & 8) != 0) << 10) | (((__NSShowsControlCharacters | v7 & 0x10) != 0) << 11);
    if ((v7 & 0x20) != 0 || __NSUsesScreenFonts == 0)
      v11 = 0;
    else
      v11 = 16;
    self->_lmFlags = (__lmFlags)((v7 << 13) & 0x200000 | (((__NSAllowsNonContiguousLayout | v7 & 0x80) != 0) << 29) | v11 & 0xFEFFFFFF | (((v7 >> 6) & 1) << 24) | v9);
    *((_DWORD *)self->_extraData + 112) = *((_DWORD *)self->_extraData + 112) & 0xFBFFFFFF | (((v7 >> 9) & 1) << 26);

    if (-[NSCoder requiresSecureCoding](coder, "requiresSecureCoding"))
      v12 = (NSMutableArray *)-[NSArray mutableCopy](-[NSCoder decodeArrayOfObjectsOfClass:forKey:](coder, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("NSTextContainers")), "mutableCopy");
    else
      v12 = (NSMutableArray *)-[NSCoder decodeObjectForKey:](coder, "decodeObjectForKey:", CFSTR("NSTextContainers"));
    self->_textContainers = v12;
    v13 = *(_OWORD *)(MEMORY[0x1E0CB3438] + 16);
    v35 = *MEMORY[0x1E0CB3438];
    v36 = v13;
    v37 = 0uLL;
    __asm { FMOV            V2.2D, #-1.0 }
    v38 = _Q2;
    LODWORD(v39[0]) = 0;
    *(_OWORD *)((char *)v39 + 8) = v35;
    *(_OWORD *)((char *)&v39[1] + 8) = v13;
    *(_OWORD *)((char *)&v39[2] + 8) = xmmword_18D6CBB80;
    v18 = -[NSMutableArray count](v12, "count");
    if (v18)
    {
      v19 = v18;
      for (i = 0; i != v19; ++i)
        -[NSStorage insertElements:count:atIndex:](self->_containerUsedRects, "insertElements:count:atIndex:", &v35, 1, i);
    }
    textContainers = self->_textContainers;
    v22 = (__CFDictionary *)*((_QWORD *)self->_extraData + 11);
    v23 = -[NSMutableArray count](textContainers, "count");
    if (v23)
      v24 = (void *)-[NSMutableArray objectAtIndex:](textContainers, "objectAtIndex:", 0);
    else
      v24 = 0;
    objc_msgSend(v24, "size");
    v26 = v25;
    CFDictionaryRemoveAllValues(v22);
    *((_QWORD *)self->_extraData + 10) = v24;
    lmFlags = self->_lmFlags;
    if (v23 != 1 || (*(_DWORD *)&lmFlags & 0x20000000) == 0)
    {
      self->_lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags & 0xBFFFFFFF);
      if (v23 >= 2)
      {
        for (j = 1; j != v23; ++j)
          CFDictionarySetValue(v22, (const void *)-[NSMutableArray objectAtIndex:](textContainers, "objectAtIndex:", j), (const void *)j);
      }
    }
    else
    {
      v30 = objc_msgSend(v24, "isSimpleRectangularTextContainer");
      v31 = v26 >= 10000000.0;
      if (v26 <= 0.0)
        v31 = 1;
      if ((v30 & v31) != 0)
        v32 = 0x40000000;
      else
        v32 = 0;
      self->_lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xBFFFFFFF | v32);
    }
    objc_msgSend(-[NSCoder decodeObjectOfClass:forKey:](coder, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSTextStorage")), "addLayoutManager:", self);
    -[NSLayoutManager _firstTextViewChanged](self, "_firstTextViewChanged");
    v33 = -[NSCoder decodeObjectForKey:](coder, "decodeObjectForKey:", CFSTR("NSDelegate"));
    if (v33)
      -[NSLayoutManager setDelegate:](self, "setDelegate:", v33);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@ *** NSLayoutManager does not support non-keyed coding."), _NSFullMethodName());
  }
  return self;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSTextStorage *textStorage;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSLayoutManager;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@\n"), -[NSLayoutManager description](&v7, sel_description));
  v4 = -[NSMutableArray count](self->_textContainers, "count");
  textStorage = self->_textStorage;
  if (textStorage)
    textStorage = (NSTextStorage *)-[NSTextStorage length](textStorage, "length");
  objc_msgSend(v3, "appendFormat:", CFSTR("    %lu containers, text backing has %lu characters\n"), v4, textStorage);
  objc_msgSend(v3, "appendFormat:", CFSTR("    Currently holding %lu glyphs"), *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8));
  objc_msgSend(v3, "appendString:", CFSTR(".\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    %@\n"), _NSGlyphTreeSummaryDescription((uint64_t)self));
  objc_msgSend(v3, "appendFormat:", CFSTR("    %@\n"), _NSLayoutTreeSummaryDescription((uint64_t)self));
  return v3;
}

- (void)replaceTextStorage:(NSTextStorage *)newTextStorage
{
  NSTextStorage *textStorage;
  NSTextStorage *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!newTextStorage)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("*** %@: nil NSTextStorage given.  You must supply a NSTextStorage."), _NSFullMethodName());
  textStorage = self->_textStorage;
  if (textStorage)
  {
    v6 = textStorage;
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", -[NSTextStorage layoutManagers](v6, "layoutManagers"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          -[NSTextStorage removeLayoutManager:](v6, "removeLayoutManager:", v12);
          -[NSTextStorage addLayoutManager:](newTextStorage, "addLayoutManager:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
  else
  {
    -[NSTextStorage addLayoutManager:](newTextStorage, "addLayoutManager:", self);
  }
}

- (void)setGlyphGenerator:(NSGlyphGenerator *)glyphGenerator
{
  uint64_t v5;
  NSGlyphGenerator *v6;

  if (self->_glyphGenerator != glyphGenerator)
  {
    v5 = -[NSTextStorage length](self->_textStorage, "length");
    v6 = self->_glyphGenerator;
    self->_glyphGenerator = glyphGenerator;
    if (v5)
    {
      -[NSLayoutManager _invalidateGlyphsForExtendedCharacterRange:changeInLength:](self, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:", 0, v5, 0);
      -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", 0, v5, 0);
    }
  }
}

- (void)setTypesetter:(NSTypesetter *)typesetter
{
  uint64_t v5;
  NSTypesetter *v6;

  if (self->_typesetter != typesetter)
  {
    v5 = -[NSTextStorage length](self->_textStorage, "length");
    v6 = self->_typesetter;
    self->_typesetter = typesetter;
    if (v5)
    {
      -[NSLayoutManager _invalidateGlyphsForExtendedCharacterRange:changeInLength:](self, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:", 0, v5, 0);
      -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", 0, v5, 0);
    }
  }
}

- (void)setDelegate:(id)delegate
{
  int v5;
  int v6;
  int v7;
  id *p_extraData;
  _DWORD *extraData;
  int v10;
  _DWORD *v11;

  objc_sync_enter(self);
  if (self->_delegateIsWeakValue)

  objc_storeWeak(&self->_delegate, delegate);
  self->_delegateIsWeakValue = 0;
  objc_sync_exit(self);
  if (delegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 4096;
    else
      v5 = 0;
    self->_lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xFFFFEFFF | v5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 0x2000;
    else
      v6 = 0;
    self->_lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xFFFFDFFF | v6);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 4096;
    else
      v7 = 0;
    extraData = self->_extraData;
    p_extraData = &self->_extraData;
    extraData[112] = extraData[112] & 0xFFFFEFFF | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 0x8000000;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
    v11 = self->_extraData;
    p_extraData = &self->_extraData;
    *((_DWORD *)p_extraData - 44) &= 0xFFFFCFFF;
    v11[112] &= ~0x1000u;
  }
  *((_DWORD *)*p_extraData + 112) = *((_DWORD *)*p_extraData + 112) & 0xF7FFFFFF | v10;
}

- (_NSRange)_characterRangeCurrentlyInAndAfterContainer:(id)a3
{
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;
  CFDictionaryRef *extraData;
  unint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  unint64_t v13;
  void *value;
  _NSRange result;

  v5 = -[NSTextStorage length](self->_textStorage, "length");
  if (v5)
  {
    v6 = v5;
    v7 = -[NSMutableArray count](self->_textContainers, "count");
    v8 = v7;
    if (a3)
    {
      value = 0;
      extraData = (CFDictionaryRef *)self->_extraData;
      if (extraData[10] == a3)
      {
        v10 = 0;
      }
      else if (CFDictionaryGetValueIfPresent(extraData[11], a3, (const void **)&value))
      {
        v10 = (unint64_t)value;
      }
      else
      {
        v10 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      v10 = v7;
    }
    do
    {
      if (v8 == v10)
        v12 = 0;
      else
        v12 = -[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", v10);
      v13 = -[NSLayoutManager _indexOfFirstGlyphInTextContainer:okToFillHoles:](self, "_indexOfFirstGlyphInTextContainer:okToFillHoles:", v12, 0);
      v5 = 0x7FFFFFFFFFFFFFFFLL;
      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        v5 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, v13);
      ++v10;
    }
    while (v10 <= v8 && v5 == 0x7FFFFFFFFFFFFFFFLL);
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
      v11 = 0;
    else
      v11 = v6 - v5;
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
      v5 = 0;
  }
  else
  {
    v11 = 0;
  }
  result.length = v11;
  result.location = v5;
  return result;
}

- (void)removeTextContainerAtIndex:(NSUInteger)index
{
  NSUInteger v5;
  __lmFlags lmFlags;
  NSTextContainer *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSTextContainer *v12;
  NSMutableArray *textContainers;
  __CFDictionary *v14;
  unint64_t v15;
  void *v16;
  double v17;
  double v18;
  __lmFlags v19;
  int v20;
  _BOOL4 v21;
  int v22;
  uint64_t i;
  __lmFlags v24;
  unsigned __int16 v25;
  uint64_t v26;

  v26 = -[NSTextStorage length](self->_textStorage, "length");
  v5 = -[NSMutableArray count](self->_textContainers, "count");
  if (v5 <= index)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("*** %@: container index %lu is beyond the range of containers (%lu)"), _NSFullMethodName(), index, v5);
  lmFlags = self->_lmFlags;
  if ((*(_BYTE *)&lmFlags & 0x40) == 0)
    ++self->_displayInvalidationDisableStack;
  if ((*(_BYTE *)&lmFlags & 8) == 0)
    ++self->_textViewResizeDisableStack;
  v7 = (NSTextContainer *)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", index);
  v8 = -[NSTextContainer textView](v7, "textView");
  v9 = -[NSLayoutManager _characterRangeCurrentlyInAndAfterContainer:](self, "_characterRangeCurrentlyInAndAfterContainer:", v7);
  v11 = v10;
  *(_DWORD *)&self->_lmFlags &= ~1u;
  -[NSTextContainer setLayoutManager:](v7, "setLayoutManager:", 0);
  v12 = v7;
  -[NSMutableArray removeObjectAtIndex:](self->_textContainers, "removeObjectAtIndex:", index);
  textContainers = self->_textContainers;
  v14 = (__CFDictionary *)*((_QWORD *)self->_extraData + 11);
  v15 = -[NSMutableArray count](textContainers, "count");
  if (v15)
    v16 = (void *)-[NSMutableArray objectAtIndex:](textContainers, "objectAtIndex:", 0);
  else
    v16 = 0;
  objc_msgSend(v16, "size");
  v18 = v17;
  CFDictionaryRemoveAllValues(v14);
  *((_QWORD *)self->_extraData + 10) = v16;
  v19 = self->_lmFlags;
  if (v15 == 1 && (*(_DWORD *)&v19 & 0x20000000) != 0)
  {
    v20 = objc_msgSend(v16, "isSimpleRectangularTextContainer");
    v21 = v18 >= 10000000.0;
    if (v18 <= 0.0)
      v21 = 1;
    if ((v20 & v21) != 0)
      v22 = 0x40000000;
    else
      v22 = 0;
    self->_lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xBFFFFFFF | v22);
  }
  else
  {
    self->_lmFlags = (__lmFlags)(*(_DWORD *)&v19 & 0xBFFFFFFF);
    if (v15 >= 2)
    {
      for (i = 1; i != v15; ++i)
        CFDictionarySetValue(v14, (const void *)-[NSMutableArray objectAtIndex:](textContainers, "objectAtIndex:", i), (const void *)i);
    }
  }
  -[NSStorage removeElementAtIndex:](self->_containerUsedRects, "removeElementAtIndex:", index);
  CFDictionaryRemoveValue(*((CFMutableDictionaryRef *)self->_extraData + 12), v7);
  if (v7 == self->_extraLineFragmentContainer)
  {
    _NSLayoutTreeSetExtraLineFragmentRect((uint64_t)self, *MEMORY[0x1E0CB3438], *(double *)(MEMORY[0x1E0CB3438] + 8), *(double *)(MEMORY[0x1E0CB3438] + 16), *(double *)(MEMORY[0x1E0CB3438] + 24), *MEMORY[0x1E0CB3438], *(double *)(MEMORY[0x1E0CB3438] + 8), *(double *)(MEMORY[0x1E0CB3438] + 16), *(double *)(MEMORY[0x1E0CB3438] + 24));
    self->_extraLineFragmentContainer = 0;
    if (v11)
    {
LABEL_23:
      if ((*((_WORD *)&self->_lmFlags + 1) & 0x810) != 0)
        -[NSLayoutManager _invalidateGlyphsForExtendedCharacterRange:changeInLength:](self, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:", v9, v11, 0);
      goto LABEL_28;
    }
  }
  else if (v11)
  {
    goto LABEL_23;
  }
  if (!v26)
  {
    v9 = 0;
    v11 = 0;
LABEL_28:
    -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", v9, v11, 0);
  }
  _enableTextViewResizing_0((uint64_t)self);
  v24 = self->_lmFlags;
  if ((*(_BYTE *)&v24 & 0x40) == 0)
  {
    if (!self->_displayInvalidationDisableStack
      || (v25 = self->_displayInvalidationDisableStack - 1, (self->_displayInvalidationDisableStack = v25) == 0))
    {
      self->_lmFlags = (__lmFlags)(*(_DWORD *)&v24 | 0x40);
      -[NSLayoutManager _invalidateDisplayIfNeeded](self, "_invalidateDisplayIfNeeded");
      v24 = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xFFFFFFBF);
      self->_lmFlags = v24;
    }
  }
  if (v8)
  {
    -[NSLayoutManager _firstTextViewChanged](self, "_firstTextViewChanged");
    v24 = self->_lmFlags;
  }
  self->_lmFlags = (__lmFlags)(*(_DWORD *)&v24 | 0x40000);
}

- (void)textContainerChangedGeometry:(NSTextContainer *)container
{
  id extraData;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSTextStorage *textStorage;
  void *value;

  value = 0;
  extraData = self->_extraData;
  if (*((NSTextContainer **)extraData + 10) != container
    && (!CFDictionaryGetValueIfPresent(*((CFDictionaryRef *)extraData + 11), container, (const void **)&value)
     || value == (void *)0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("*** %@: given container does not appear in the list of containers for this NSLayoutManager."), _NSFullMethodName());
  }
  v7 = -[NSLayoutManager _characterRangeCurrentlyInAndAfterContainer:](self, "_characterRangeCurrentlyInAndAfterContainer:", container);
  v8 = v6;
  if (v6)
  {
    if ((*((_WORD *)&self->_lmFlags + 1) & 0x810) != 0)
      -[NSLayoutManager _invalidateGlyphsForExtendedCharacterRange:changeInLength:](self, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:", v7, v6, 0);
    goto LABEL_9;
  }
  if (!-[NSTextStorage length](-[NSLayoutManager textStorage](self, "textStorage"), "length"))
LABEL_9:
    -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", v7, v8, 0);
  *(_DWORD *)&self->_lmFlags &= ~1u;
  textStorage = self->_textStorage;
  if (textStorage && !-[NSTextStorage length](textStorage, "length"))
  {
    if (-[NSMutableArray count](self->_textContainers, "count"))
    {
      value = 0;
      -[NSTypesetter layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:](-[NSLayoutManager typesetter](self, "typesetter"), "layoutGlyphsInLayoutManager:startingAtGlyphIndex:maxNumberOfLineFragments:nextGlyphIndex:", self, 0, 1, &value);
      -[NSLayoutManager _invalidateInsertionPoint](self, "_invalidateInsertionPoint");
    }
  }
}

- (void)textContainerChangedTextView:(NSTextContainer *)container
{
  -[NSLayoutManager _firstTextViewChanged](self, "_firstTextViewChanged", container);
  -[NSLayoutManager _invalidateInsertionPoint](self, "_invalidateInsertionPoint");
}

- (void)textContainerChangedTextView:(id)a3 fromTextView:(id)a4
{
  void *v7;
  void *v8;

  -[NSLayoutManager textContainerChangedTextView:](self, "textContainerChangedTextView:");
  if ((id)objc_msgSend(a3, "textView") != a4)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = v7;
    if (a4)
      objc_msgSend(v7, "setObject:forKey:", a4, CFSTR("_NSOldTextView"));
    if (objc_msgSend(a3, "textView"))
      objc_msgSend(v8, "setObject:forKey:", objc_msgSend(a3, "textView"), CFSTR("_NSNewTextView"));
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("_NSLayoutManagerObservedTextViewChangeNotification"), self, v8);
  }
}

- (void)setAllowsNonContiguousLayout:(BOOL)allowsNonContiguousLayout
{
  int v3;
  uint64_t v5;
  __lmFlags lmFlags;
  int v7;
  int v8;
  NSMutableArray *textContainers;
  __CFDictionary *v10;
  unint64_t v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  __lmFlags v16;
  uint64_t i;
  int v19;
  _BOOL4 v20;
  int v21;
  int v22;

  v3 = allowsNonContiguousLayout;
  v5 = -[NSTextStorage length](self->_textStorage, "length");
  lmFlags = self->_lmFlags;
  v7 = (*(unsigned int *)&lmFlags >> 30) & 1;
  if (v3)
    v8 = 0x20000000;
  else
    v8 = 0;
  self->_lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags & 0xDFFFFFFF | v8);
  textContainers = self->_textContainers;
  v10 = (__CFDictionary *)*((_QWORD *)self->_extraData + 11);
  v11 = -[NSMutableArray count](textContainers, "count");
  if (v11)
    v12 = (void *)-[NSMutableArray objectAtIndex:](textContainers, "objectAtIndex:", 0);
  else
    v12 = 0;
  v13 = v7 & ~v3;
  objc_msgSend(v12, "size");
  v15 = v14;
  CFDictionaryRemoveAllValues(v10);
  *((_QWORD *)self->_extraData + 10) = v12;
  v16 = self->_lmFlags;
  if (v11 != 1 || (*(_DWORD *)&v16 & 0x20000000) == 0)
  {
    self->_lmFlags = (__lmFlags)(*(_DWORD *)&v16 & 0xBFFFFFFF);
    if (v11 >= 2)
    {
      for (i = 1; i != v11; ++i)
        CFDictionarySetValue(v10, (const void *)-[NSMutableArray objectAtIndex:](textContainers, "objectAtIndex:", i), (const void *)i);
    }
  }
  else
  {
    v19 = objc_msgSend(v12, "isSimpleRectangularTextContainer");
    v20 = v15 >= 10000000.0;
    if (v15 <= 0.0)
      v20 = 1;
    if ((v19 & v20) != 0)
      v21 = 0x40000000;
    else
      v21 = 0;
    self->_lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xBFFFFFFF | v21);
  }
  if (v5)
    v22 = v13;
  else
    v22 = 0;
  if (v22 == 1)
  {
    if ((*((_WORD *)&self->_lmFlags + 1) & 0x810) != 0)
      -[NSLayoutManager _invalidateGlyphsForExtendedCharacterRange:changeInLength:](self, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:", 0, v5, 0);
    -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", 0, v5, 0);
  }
}

- (BOOL)allowsNonContiguousLayout
{
  return (*((unsigned __int8 *)&self->_lmFlags + 3) >> 5) & 1;
}

- (void)_setGlyphsPerLineEstimate:(unint64_t)a3 offsetPerLineEstimate:(double)a4
{
  uint64_t v7;

  v7 = -[NSTextStorage length](self->_textStorage, "length");
  _NSLayoutTreeSetGlyphsPerLineEstimate((uint64_t)self, a3);
  _NSLayoutTreeSetOffsetPerLineEstimate((uint64_t)self, a4);
  -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", 0, v7, 0);
}

- (void)_setGlyphsPerLineEstimate:(unint64_t)a3 integerOffsetPerLineEstimate:(unint64_t)a4
{
  -[NSLayoutManager _setGlyphsPerLineEstimate:offsetPerLineEstimate:](self, "_setGlyphsPerLineEstimate:offsetPerLineEstimate:", a3, (double)a4);
}

- (void)setBackgroundLayoutEnabled:(BOOL)backgroundLayoutEnabled
{
  int v3;

  if (backgroundLayoutEnabled)
    v3 = 4;
  else
    v3 = 0;
  self->_lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xFFFFFFFB | v3);
  if (backgroundLayoutEnabled && (*(_BYTE *)(*((_QWORD *)self->_extraData + 30) + 56) & 1) != 0)
    -[NSLayoutManager _markSelfAsDirtyForBackgroundLayout:](self, "_markSelfAsDirtyForBackgroundLayout:", self);
}

- (BOOL)backgroundLayoutEnabled
{
  return (*(_BYTE *)&self->_lmFlags >> 2) & 1;
}

- (void)setUsesScreenFonts:(BOOL)usesScreenFonts
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  __lmFlags lmFlags;
  int v8;

  v3 = usesScreenFonts;
  v5 = -[NSTextStorage length](self->_textStorage, "length");
  v6 = v5;
  lmFlags = self->_lmFlags;
  if (v3)
  {
    if ((*(_BYTE *)&lmFlags & 0x10) != 0)
      return;
    v8 = 16;
  }
  else
  {
    if ((*(_BYTE *)&lmFlags & 0x10) == 0)
      return;
    v8 = 0;
  }
  self->_lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags & 0xFFFFFFEF | v8);
  if (v5)
  {
    if ((*(_DWORD *)&lmFlags & 0x8100000) != 0)
      -[NSLayoutManager _invalidateGlyphsForExtendedCharacterRange:changeInLength:](self, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:", 0, v5, 0);
    else
      self->_cachedFontCharRange = (_NSRange)xmmword_18D6CBB80;
    -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", 0, v6, 0);
  }
}

- (void)setShowsInvisibleCharacters:(BOOL)showsInvisibleCharacters
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  __lmFlags lmFlags;
  int v8;

  v3 = showsInvisibleCharacters;
  v5 = -[NSTextStorage length](self->_textStorage, "length");
  v6 = v5;
  lmFlags = self->_lmFlags;
  if (v3)
  {
    if ((*(_WORD *)&lmFlags & 0x400) != 0)
      return;
    v8 = 1024;
  }
  else
  {
    if ((*(_WORD *)&lmFlags & 0x400) == 0)
      return;
    v8 = 0;
  }
  self->_lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags & 0xFFFFFBFF | v8);
  if (v5)
  {
    -[NSLayoutManager invalidateGlyphsForCharacterRange:changeInLength:actualCharacterRange:](self, "invalidateGlyphsForCharacterRange:changeInLength:actualCharacterRange:", 0, v5, 0, 0);
    -[NSLayoutManager invalidateLayoutForCharacterRange:actualCharacterRange:](self, "invalidateLayoutForCharacterRange:actualCharacterRange:", 0, v6, 0);
  }
}

- (BOOL)showsInvisibleCharacters
{
  return (*((unsigned __int8 *)&self->_lmFlags + 1) >> 2) & 1;
}

- (void)setShowsControlCharacters:(BOOL)showsControlCharacters
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  __lmFlags lmFlags;
  int v8;

  v3 = showsControlCharacters;
  v5 = -[NSTextStorage length](self->_textStorage, "length");
  v6 = v5;
  lmFlags = self->_lmFlags;
  if (v3)
  {
    if ((*(_WORD *)&lmFlags & 0x800) != 0)
      return;
    v8 = 2048;
  }
  else
  {
    if ((*(_WORD *)&lmFlags & 0x800) == 0)
      return;
    v8 = 0;
  }
  self->_lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags & 0xFFFFF7FF | v8);
  if (v5)
  {
    -[NSLayoutManager invalidateGlyphsForCharacterRange:changeInLength:actualCharacterRange:](self, "invalidateGlyphsForCharacterRange:changeInLength:actualCharacterRange:", 0, v5, 0, 0);
    -[NSLayoutManager invalidateLayoutForCharacterRange:actualCharacterRange:](self, "invalidateLayoutForCharacterRange:actualCharacterRange:", 0, v6, 0);
  }
}

- (BOOL)showsControlCharacters
{
  return (*((unsigned __int8 *)&self->_lmFlags + 1) >> 3) & 1;
}

- (void)_setHyphenationFactor:(double)a3
{
  uint64_t v5;
  double *extraData;
  uint64_t v7;

  v5 = -[NSTextStorage length](self->_textStorage, "length");
  extraData = (double *)self->_extraData;
  if (extraData[24] != a3)
  {
    v7 = v5;
    extraData[24] = a3;
    if (v5)
    {
      -[NSLayoutManager invalidateGlyphsForCharacterRange:changeInLength:actualCharacterRange:](self, "invalidateGlyphsForCharacterRange:changeInLength:actualCharacterRange:", 0, v5, 0, 0);
      -[NSLayoutManager invalidateLayoutForCharacterRange:actualCharacterRange:](self, "invalidateLayoutForCharacterRange:actualCharacterRange:", 0, v7, 0);
    }
  }
}

- (void)setUsesDefaultHyphenation:(BOOL)usesDefaultHyphenation
{
  _BOOL4 v3;
  uint64_t v5;
  _DWORD *extraData;
  int v7;
  uint64_t v8;
  int v9;

  v3 = usesDefaultHyphenation;
  v5 = -[NSTextStorage length](self->_textStorage, "length");
  extraData = self->_extraData;
  v7 = extraData[112];
  if (((((v7 & 0x40000000) == 0) ^ v3) & 1) == 0)
  {
    v8 = v5;
    if (v3)
      v9 = 0x40000000;
    else
      v9 = 0;
    extraData[112] = v7 & 0xBFFFFFFF | v9;
    if (v5)
    {
      -[NSLayoutManager invalidateGlyphsForCharacterRange:changeInLength:actualCharacterRange:](self, "invalidateGlyphsForCharacterRange:changeInLength:actualCharacterRange:", 0, v5, 0, 0);
      -[NSLayoutManager invalidateLayoutForCharacterRange:actualCharacterRange:](self, "invalidateLayoutForCharacterRange:actualCharacterRange:", 0, v8, 0);
    }
  }
}

- (void)setTypesetterBehavior:(NSTypesetterBehavior)typesetterBehavior
{
  NSTypesetterBehavior v3;

  v3 = NSTypesetterBehavior_10_4|NSTypesetterBehavior_10_2;
  if ((unint64_t)typesetterBehavior < (NSTypesetterBehavior_10_4|NSTypesetterBehavior_10_2))
    v3 = typesetterBehavior;
  *((_QWORD *)self->_extraData + 13) = v3;
}

- (BOOL)backgroundColorProvidesOpaqueSurface
{
  return self->_firstTextView != 0;
}

- (void)setLimitsLayoutForSuspiciousContents:(BOOL)limitsLayoutForSuspiciousContents
{
  _BOOL4 v3;
  int v5;

  v3 = limitsLayoutForSuspiciousContents;
  if (-[NSLayoutManager limitsLayoutForSuspiciousContents](self, "limitsLayoutForSuspiciousContents") != limitsLayoutForSuspiciousContents)
  {
    if (v3)
      v5 = 0x4000000;
    else
      v5 = 0;
    *((_DWORD *)self->_extraData + 112) = *((_DWORD *)self->_extraData + 112) & 0xFBFFFFFF | v5;
    -[NSLayoutManager _invalidateGlyphsForExtendedCharacterRange:changeInLength:](self, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:", 0, -[NSTextStorage length](-[NSLayoutManager textStorage](self, "textStorage"), "length"), 0);
  }
}

- (void)invalidateGlyphsForCharacterRange:(NSRange)charRange changeInLength:(NSInteger)delta actualCharacterRange:(NSRangePointer)actualCharRange
{
  -[NSLayoutManager _invalidateGlyphsForCharacterRange:editedCharacterRange:changeInLength:actualCharacterRange:](self, "_invalidateGlyphsForCharacterRange:editedCharacterRange:changeInLength:actualCharacterRange:", charRange.location, charRange.length, charRange.location, charRange.length, delta, actualCharRange);
}

- (void)invalidateLayoutForCharacterRange:(NSRange)charRange actualCharacterRange:(NSRangePointer)actualCharRange
{
  uint64_t location;
  NSUInteger v7;
  NSUInteger v8;

  location = charRange.location;
  if (charRange.length)
  {
    location = -[NSLayoutManager _extendedCharRangeForInvalidation:editedCharRange:](self, "_extendedCharRangeForInvalidation:editedCharRange:", charRange.location, charRange.length, charRange.location, charRange.length);
    v8 = v7;
    if ((*((_BYTE *)&self->_lmFlags + 3) & 8) != 0)
    {
      -[NSLayoutManager _invalidateGlyphsForCharacterRange:editedCharacterRange:changeInLength:actualCharacterRange:](self, "_invalidateGlyphsForCharacterRange:editedCharacterRange:changeInLength:actualCharacterRange:", location, v7, location, v7, 0, 0);
      if (!actualCharRange)
        return;
    }
    else
    {
      -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", location, v7, 0);
      if (!actualCharRange)
        return;
    }
    goto LABEL_8;
  }
  if (!-[NSTextStorage length](-[NSLayoutManager textStorage](self, "textStorage"), "length"))
    -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", 0, 0, 0);
  v8 = 0;
  if (actualCharRange)
  {
LABEL_8:
    actualCharRange->location = location;
    actualCharRange->length = v8;
  }
}

- (void)invalidateLayoutForCharacterRange:(NSRange)charRange isSoft:(BOOL)flag actualCharacterRange:(NSRangePointer)actualCharRange
{
  uint64_t location;
  _BOOL8 v8;
  NSUInteger v9;
  NSUInteger v10;

  location = charRange.location;
  if (charRange.length)
  {
    v8 = flag;
    location = -[NSLayoutManager _extendedCharRangeForInvalidation:editedCharRange:](self, "_extendedCharRangeForInvalidation:editedCharRange:", charRange.location, charRange.length, charRange.location, charRange.length);
    v10 = v9;
    if (!v8 && (*((_BYTE *)&self->_lmFlags + 3) & 8) != 0)
    {
      -[NSLayoutManager _invalidateGlyphsForCharacterRange:editedCharacterRange:changeInLength:actualCharacterRange:](self, "_invalidateGlyphsForCharacterRange:editedCharacterRange:changeInLength:actualCharacterRange:", location, v9, location, v9, 0, 0);
      if (!actualCharRange)
        return;
    }
    else
    {
      -[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", location, v9, v8);
      if (!actualCharRange)
        return;
    }
    goto LABEL_9;
  }
  if (!-[NSTextStorage length](-[NSLayoutManager textStorage](self, "textStorage", charRange.location, 0, flag), "length"))-[NSLayoutManager _invalidateLayoutForExtendedCharacterRange:isSoft:](self, "_invalidateLayoutForExtendedCharacterRange:isSoft:", 0, 0, 0);
  v10 = 0;
  if (actualCharRange)
  {
LABEL_9:
    actualCharRange->location = location;
    actualCharRange->length = v10;
  }
}

uint64_t __60__NSLayoutManager__primitiveInvalidateDisplayForGlyphRange___block_invoke(uint64_t result, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t v6;
  void *v7;
  _QWORD v8[10];

  v6 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(*(_QWORD *)(v6 + 8) + 40))
  {
    v7 = *(void **)(result + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__NSLayoutManager__primitiveInvalidateDisplayForGlyphRange___block_invoke_2;
    v8[3] = &unk_1E2604C48;
    *(double *)&v8[6] = a3;
    *(double *)&v8[7] = a4;
    *(double *)&v8[8] = a5;
    *(double *)&v8[9] = a6;
    v8[4] = a2;
    v8[5] = v6;
    return objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);
  }
  return result;
}

uint64_t __60__NSLayoutManager__primitiveInvalidateDisplayForGlyphRange___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t result;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  NSRect v19;
  NSRect v20;
  NSRect v21;

  v4 = (void *)objc_msgSend(a2, "view");
  v5 = *(_QWORD *)(a1 + 32);
  result = objc_msgSend(v4, "superview");
  if (v5 == result)
  {
    result = objc_msgSend(v4, "isFirstResponder");
    if ((result & 1) == 0)
    {
      objc_msgSend(v4, "frame");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      objc_msgSend(v4, "frame");
      v20.origin.x = v15;
      v20.origin.y = v16;
      v20.size.width = v17;
      v20.size.height = v18;
      v21 = NSIntersectionRect(*(NSRect *)(a1 + 48), v20);
      v19.origin.x = v8;
      v19.origin.y = v10;
      v19.size.width = v12;
      v19.size.height = v14;
      result = NSEqualRects(v19, v21);
      if ((_DWORD)result)
        return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", a2);
    }
  }
  return result;
}

uint64_t __60__NSLayoutManager__primitiveInvalidateDisplayForGlyphRange___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t result;
  void *v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  uint64_t v16;
  double v17;
  _QWORD *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  NSRect v30;
  NSRect v31;

  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "viewProviderForTextAttachment:characterIndex:", a2, a3);
  result = objc_msgSend(v5, "view");
  if (result)
  {
    v7 = (void *)result;
    result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "containsObject:", v5);
    if ((_DWORD)result)
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "glyphIndexForCharacterAtIndex:", a3);
      v9 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex(*(_QWORD *)(a1 + 32), v8, 0);
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v16 = *(_QWORD *)(a1 + 32);
      if ((*(_BYTE *)(v16 + 67) & 0x40) != 0)
      {
        v21 = (void *)objc_msgSend(*(id *)(v16 + 32), "objectAtIndex:", 0);
      }
      else if (objc_msgSend(*(id *)(v16 + 48), "count") <= v8)
      {
        v21 = 0;
      }
      else
      {
        v18 = *(_QWORD **)(v16 + 48);
        *(_QWORD *)&v17 = _NSBlockNumberForIndex(v18, v8, 0).n128_u64[0];
        v20 = 0;
        if (v18[11] <= v19)
          v20 = v18[4] - v18[3];
        v21 = *(void **)(v18[7] + (v18[2] + 8) * (v20 + v19) + 8);
      }
      objc_msgSend(v21, "textContainerOrigin", v17);
      v23 = v9 + v22;
      v25 = v11 + v24;
      objc_msgSend((id)objc_msgSend(v7, "superview"), "visibleRect");
      v31.origin.x = v26;
      v31.origin.y = v27;
      v31.size.width = v28;
      v31.size.height = v29;
      v30.origin.x = v23;
      v30.origin.y = v25;
      v30.size.width = v13;
      v30.size.height = v15;
      result = NSIntersectsRect(v30, v31);
      if ((_DWORD)result)
        return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeObject:", v5);
    }
  }
  return result;
}

uint64_t __60__NSLayoutManager__primitiveInvalidateDisplayForGlyphRange___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "view"), "setHidden:", 1);
}

- (void)ensureGlyphsForCharacterRange:(NSRange)charRange
{
  _NSFastFillAllGlyphHolesForCharacterRange((uint64_t)self, charRange.location, charRange.length);
}

- (void)ensureGlyphsForGlyphRange:(NSRange)glyphRange
{
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphRange.location, glyphRange.length);
}

- (void)ensureLayoutForCharacterRange:(NSRange)charRange
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v6;
  unint64_t v7;

  length = charRange.length;
  location = charRange.location;
  -[NSLayoutManager ensureGlyphsForCharacterRange:](self, "ensureGlyphsForCharacterRange:");
  v6 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", location, length, 0);
  _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, v6, v7);
}

- (void)ensureLayoutForGlyphRange:(NSRange)glyphRange
{
  _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, glyphRange.location, glyphRange.length);
}

- (void)ensureLayoutForBoundingRect:(CGRect)bounds inTextContainer:(NSTextContainer *)container
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;

  if ((*(_BYTE *)(*((_QWORD *)self->_extraData + 30) + 56) & 1) != 0)
  {
    height = bounds.size.height;
    width = bounds.size.width;
    y = bounds.origin.y;
    x = bounds.origin.x;
    do
    {
      v10 = -[NSLayoutManager glyphRangeForBoundingRect:inTextContainer:](self, "glyphRangeForBoundingRect:inTextContainer:", container, x, y, width, height);
      v11 = v10;
      v13 = v12;
      v15 = 0;
      if ((*(_DWORD *)&self->_lmFlags & 0x40000000) != 0)
        v14 = v10;
      else
        v14 = 0;
      _NSLayoutTreeGetFirstHoleAfterGlyphIndex((uint64_t)self, v14, &v15);
      if (v15 >= v11 + v13)
        break;
      -[NSLayoutManager ensureLayoutForGlyphRange:](self, "ensureLayoutForGlyphRange:", v11, v13);
    }
    while ((*(_BYTE *)(*((_QWORD *)self->_extraData + 30) + 56) & 1) != 0);
  }
}

- (void)insertGlyphs:(const NSGlyph *)glyphs length:(NSUInteger)length forStartingGlyphAtIndex:(NSUInteger)glyphIndex characterIndex:(NSUInteger)charIndex
{
  __lmFlags lmFlags;

  _NSGlyphTreeInsertGlyphs((uint64_t)self, charIndex, glyphIndex, length, (unsigned int *)glyphs);
  lmFlags = self->_lmFlags;
  if ((*(_DWORD *)&lmFlags & 0x80000) == 0)
    self->_lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags | 0x100000);
}

- (void)insertGlyph:(NSGlyph)glyph atGlyphIndex:(NSUInteger)glyphIndex characterIndex:(NSUInteger)charIndex
{
  NSGlyph v5;

  v5 = glyph;
  -[NSLayoutManager insertGlyphs:length:forStartingGlyphAtIndex:characterIndex:](self, "insertGlyphs:length:forStartingGlyphAtIndex:characterIndex:", &v5, 1, glyphIndex, charIndex);
}

- (void)replaceGlyphAtIndex:(NSUInteger)glyphIndex withGlyph:(NSGlyph)newGlyph
{
  __lmFlags lmFlags;

  _NSGlyphTreeReplaceGlyphAtIndex((uint64_t)self, glyphIndex, newGlyph);
  lmFlags = self->_lmFlags;
  if ((*(_DWORD *)&lmFlags & 0x80000) == 0)
    self->_lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags | 0x100000);
}

- (void)deleteGlyphsInRange:(NSRange)glyphRange
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger length;
  NSUInteger location;
  __lmFlags lmFlags;
  char v11;

  length = glyphRange.length;
  location = glyphRange.location;
  _NSGlyphTreeDeleteGlyphsInRange((uint64_t)self, glyphRange.location, glyphRange.length, glyphRange.length, v3, v4, v5, v6, v11);
  lmFlags = self->_lmFlags;
  if ((*(_DWORD *)&lmFlags & 0x80000) == 0)
    self->_lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags | 0x100000);
  -[NSLayoutManager _primitiveDeleteGlyphsInRange:](self, "_primitiveDeleteGlyphsInRange:", location, length);
}

- (void)setCharacterIndex:(NSUInteger)charIndex forGlyphAtIndex:(NSUInteger)glyphIndex
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __lmFlags lmFlags;
  char v10;

  _NSGlyphTreeSetCharacterIndexForGlyphAtIndex((uint64_t)self, charIndex, glyphIndex, glyphIndex, v4, v5, v6, v7, v10);
  lmFlags = self->_lmFlags;
  if ((*(_DWORD *)&lmFlags & 0x80000) == 0)
    self->_lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags | 0x100000);
}

- (void)setIntAttribute:(NSInteger)attributeTag value:(NSInteger)val forGlyphAtIndex:(NSUInteger)glyphIndex
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __lmFlags lmFlags;
  char v12;

  _NSGlyphTreeSetIntAttributeForGlyphAtIndex((uint64_t)self, glyphIndex, attributeTag, val, glyphIndex, v5, v6, v7, v12);
  lmFlags = self->_lmFlags;
  if ((*(_DWORD *)&lmFlags & 0x80000) == 0)
  {
    lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags | 0x100000);
    self->_lmFlags = lmFlags;
  }
  if (attributeTag == 2 && val && (*(_DWORD *)&lmFlags & 0x2000000) == 0)
    self->_lmFlags = (__lmFlags)(*(_DWORD *)&lmFlags | 0x2000000);
}

- (void)invalidateGlyphsOnLayoutInvalidationForGlyphRange:(NSRange)glyphRange
{
  *(_DWORD *)&self->_lmFlags |= 0x8000000u;
}

- (CGGlyph)CGGlyphAtIndex:(NSUInteger)glyphIndex
{
  CGGlyph v5;
  char v7;

  v7 = 1;
  v5 = -[NSLayoutManager glyphAtIndex:isValidIndex:](self, "glyphAtIndex:isValidIndex:", glyphIndex, &v7);
  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("*** %@: glyph index %lu not valid in layout manager %p"), _NSFullMethodName(), glyphIndex, self);
  return v5;
}

- (NSInteger)intAttribute:(NSInteger)attributeTag forGlyphAtIndex:(NSUInteger)glyphIndex
{
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
  return _NSGlyphTreeIntAttributeForGlyphAtIndex((uint64_t)self, glyphIndex, attributeTag);
}

- (NSGlyphProperty)propertyForGlyphAtIndex:(NSUInteger)glyphIndex
{
  int v5;
  NSGlyphProperty v6;

  if (!*((_QWORD *)self->_extraData + 26))
    return 0;
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
  v5 = _NSGlyphTreeGlyphAtIndex((uint64_t)self, glyphIndex, 0);
  if (v5 == 0xFFFFFF)
    v6 = 2;
  else
    v6 = v5 == 0;
  if (_NSGlyphTreeIntAttributeForGlyphAtIndex((uint64_t)self, glyphIndex, 1))
    v6 |= 4uLL;
  if (_NSGlyphTreeIntAttributeForGlyphAtIndex((uint64_t)self, glyphIndex, 5))
    return v6 | 8;
  else
    return v6;
}

- (NSUInteger)getGlyphsInRange:(NSRange)glyphRange glyphs:(NSGlyph *)glyphBuffer characterIndexes:(NSUInteger *)charIndexBuffer glyphInscriptions:(NSGlyphInscription *)inscribeBuffer elasticBits:(BOOL *)elasticBuffer
{
  return -[NSLayoutManager getGlyphsInRange:glyphs:characterIndexes:glyphInscriptions:elasticBits:bidiLevels:](self, "getGlyphsInRange:glyphs:characterIndexes:glyphInscriptions:elasticBits:bidiLevels:", glyphRange.location, glyphRange.length, glyphBuffer, charIndexBuffer, inscribeBuffer, elasticBuffer, 0);
}

- (NSUInteger)getGlyphsInRange:(NSRange)glyphRange glyphs:(NSGlyph *)glyphBuffer characterIndexes:(NSUInteger *)charIndexBuffer glyphInscriptions:(NSGlyphInscription *)inscribeBuffer elasticBits:(BOOL *)elasticBuffer bidiLevels:(unsigned __int8 *)bidiLevelBuffer
{
  NSUInteger length;
  NSUInteger location;

  length = glyphRange.length;
  location = glyphRange.location;
  if (glyphRange.length)
    _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphRange.location, glyphRange.length);
  return _NSGlyphTreeGetGlyphsInRange((uint64_t)self, location, length, glyphBuffer, charIndexBuffer, inscribeBuffer, elasticBuffer, bidiLevelBuffer);
}

- (NSUInteger)getGlyphs:(NSGlyph *)glyphArray range:(NSRange)glyphRange
{
  NSUInteger length;
  NSUInteger location;

  length = glyphRange.length;
  location = glyphRange.location;
  if (glyphRange.length)
    _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphRange.location, glyphRange.length);
  return _NSGlyphTreeGetShownGlyphsInRange((uint64_t)self, location, length, (int *)glyphArray);
}

- (void)_setCachedTextContainer:(id)a3 isVertical:(BOOL)a4
{
  self->_cachedTextContainer = (NSTextContainer *)a3;
  self->_cachedTextContainerIsVertical = a4;
}

- (void)_resetCachedTextContainer
{
  self->_cachedTextContainer = 0;
}

- (void)setLocation:(CGPoint)a3 forStartOfGlyphRange:(_NSRange)a4 coalesceRuns:(BOOL)a5
{
  NSUInteger length;
  NSUInteger location;
  double y;
  double x;
  NSRange v10;
  NSRange cachedLocationNominalGlyphRange;

  length = a4.length;
  location = a4.location;
  y = a3.y;
  x = a3.x;
  cachedLocationNominalGlyphRange = self->_cachedLocationNominalGlyphRange;
  v10.location = location;
  v10.length = length;
  if (NSIntersectionRange(v10, cachedLocationNominalGlyphRange).length)
    self->_cachedLocationNominalGlyphRange = (_NSRange)xmmword_18D6CBB80;
  _NSLayoutTreeSetLocationForGlyphRange((uint64_t)self, location, length, x, y);
}

- (void)setLocations:(NSPointArray)locations startingGlyphIndexes:(NSUInteger *)glyphIndexes count:(NSUInteger)count forGlyphRange:(NSRange)glyphRange
{
  uint64_t v9;
  NSUInteger v10;
  CGFloat *p_y;
  uint64_t v12;
  NSUInteger v13;

  if (count)
  {
    v9 = 0;
    v10 = glyphRange.location + glyphRange.length;
    p_y = &locations->y;
    do
    {
      v12 = v9 + 1;
      v13 = v10;
      if (v9 + 1 < count)
        v13 = glyphIndexes[v9 + 1];
      -[NSLayoutManager setLocation:forStartOfGlyphRange:](self, "setLocation:forStartOfGlyphRange:", glyphIndexes[v9], v13 - glyphIndexes[v9], *(p_y - 1), *p_y);
      p_y += 2;
      v9 = v12;
    }
    while (count != v12);
  }
}

- (void)setDrawsOutsideLineFragment:(BOOL)flag forGlyphAtIndex:(NSUInteger)glyphIndex
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v9;
  char v11;

  v9 = flag;
  if (flag)
  {
    _NSLayoutTreeSetLineFragmentDrawsOutsideLineAtGlyphIndex((uint64_t)self, glyphIndex);
    *(_DWORD *)&self->_lmFlags |= 2u;
  }
  _NSGlyphTreeSetDrawsOutsideLineFragmentForGlyphAtIndex((uint64_t)self, glyphIndex, v9, glyphIndex, v4, v5, v6, v7, v11);
}

- (void)setAttachmentSize:(CGSize)attachmentSize forGlyphRange:(NSRange)glyphRange
{
  _NSLayoutTreeSetAttachmentSizeForGlyphRange((uint64_t)self, glyphRange.location, glyphRange.length, attachmentSize.width, attachmentSize.height);
}

- (void)setEllipsisGlyphAttribute:(BOOL)a3 forGlyphAtIndex:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  _NSGlyphTreeSetEllipsisAttributeForGlyphAtIndex((uint64_t)self, a4, a3, a4, v4, v5, v6, v7, v8);
}

- (CGRect)lineFragmentRectForGlyphAtIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange
{
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
  v7 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, glyphIndex, (uint64_t *)effectiveGlyphRange);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)lineFragmentUsedRectForGlyphAtIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange withoutAdditionalLayout:(BOOL)flag
{
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  if (!flag)
    _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
  v8 = _NSLayoutTreeLineFragmentUsedRectForGlyphAtIndex((uint64_t)self, glyphIndex, (uint64_t *)effectiveGlyphRange);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)lineFragmentUsedRectForGlyphAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4 allowLayout:(BOOL)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[NSLayoutManager lineFragmentUsedRectForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:](self, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:", a3, a4, !a5);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)lineFragmentUsedRectForGlyphAtIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange
{
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
  v7 = _NSLayoutTreeLineFragmentUsedRectForGlyphAtIndex((uint64_t)self, glyphIndex, (uint64_t *)effectiveGlyphRange);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)extraLineFragmentRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  __int128 v6;
  __int128 v7;
  CGRect result;

  v6 = 0u;
  v7 = 0u;
  _NSLayoutTreeGetExtraLineFragmentRect((uint64_t)self, (uint64_t)&v6, 0);
  v3 = *((double *)&v6 + 1);
  v2 = *(double *)&v6;
  v5 = *((double *)&v7 + 1);
  v4 = *(double *)&v7;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)extraLineFragmentUsedRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  __int128 v6;
  __int128 v7;
  CGRect result;

  v6 = 0u;
  v7 = 0u;
  _NSLayoutTreeGetExtraLineFragmentRect((uint64_t)self, 0, (uint64_t)&v6);
  v3 = *((double *)&v6 + 1);
  v2 = *(double *)&v6;
  v5 = *((double *)&v7 + 1);
  v4 = *(double *)&v7;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSTextContainer)extraLineFragmentTextContainer
{
  return self->_extraLineFragmentContainer;
}

- (CGPoint)locationForGlyphAtIndex:(NSUInteger)glyphIndex
{
  NSUInteger location;
  _NSRange *p_cachedLocationNominalGlyphRange;
  NSUInteger v7;
  BOOL v8;
  NSUInteger cachedLocationGlyphIndex;
  CGFloat v10;
  NSRange v11;
  double v12;
  NSRunStorage *containerRuns;
  unint64_t v14;
  unint64_t v15;
  NSTextContainer *v16;
  BOOL v17;
  int v18;
  NSUInteger v19;
  uint64_t v20;
  unint64_t v21;
  NSUInteger v22;
  NSUInteger v23;
  char v25;
  char v26;
  double v27;
  NSFont *cachedFont;
  void *v29;
  void *v30;
  char v31;
  int v32;
  int v33;
  uint64_t v34;
  int v35;
  NSUInteger v36;
  double v37;
  double *extraData;
  double v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  double v43;
  double x;
  double y;
  const __CFString *v46;
  _NSRange *p_cachedFontCharRange;
  uint64_t v48;
  uint64_t v49;
  NSRange v50;
  _WORD v51[256];
  uint64_t v52;
  CGPoint result;

  v52 = *MEMORY[0x1E0C80C00];
  v50.location = 0;
  v50.length = 0;
  p_cachedLocationNominalGlyphRange = &self->_cachedLocationNominalGlyphRange;
  location = self->_cachedLocationNominalGlyphRange.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL
    || ((v8 = glyphIndex >= location, v7 = glyphIndex - location, v8)
      ? (v8 = v7 >= self->_cachedLocationNominalGlyphRange.length)
      : (v8 = 1),
        v8 || (cachedLocationGlyphIndex = self->_cachedLocationGlyphIndex, cachedLocationGlyphIndex > glyphIndex)))
  {
    _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
    _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, glyphIndex, (uint64_t *)&v50);
    self->_cachedLocation.x = _NSLayoutTreeRunLocationForGlyphAtIndex((uint64_t)self, glyphIndex, p_cachedLocationNominalGlyphRange);
    self->_cachedLocation.y = v10;
    v11 = NSIntersectionRange(self->_cachedLocationNominalGlyphRange, v50);
    cachedLocationGlyphIndex = v11.location;
    self->_cachedLocationNominalGlyphRange = v11;
    self->_cachedLocationGlyphIndex = v11.location;
  }
  if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    v16 = (NSTextContainer *)-[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
  }
  else if (-[NSRunStorage count](self->_containerRuns, "count") <= cachedLocationGlyphIndex)
  {
    v16 = 0;
  }
  else
  {
    containerRuns = self->_containerRuns;
    *(_QWORD *)&v12 = _NSBlockNumberForIndex(containerRuns, cachedLocationGlyphIndex, 0).n128_u64[0];
    v15 = 0;
    if (containerRuns->_gapBlockIndex <= v14)
      v15 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
    v16 = *(NSTextContainer **)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v15 + v14)];
  }
  if (v16 == self->_cachedTextContainer)
    v17 = !self->_cachedTextContainerIsVertical;
  else
    v17 = -[NSTextContainer layoutOrientation](v16, "layoutOrientation", v12) == 0;
  v18 = !v17;
  v19 = self->_cachedLocationGlyphIndex;
  if (v19 >= glyphIndex)
    goto LABEL_62;
  v20 = 0;
  p_cachedFontCharRange = &self->_cachedFontCharRange;
  v46 = CFSTR("NSFont");
  do
  {
    if ((_NSGlyphTreeNotShownAttributeForGlyphAtIndex((uint64_t)self, v19) & 1) != 0)
      goto LABEL_59;
    v21 = _NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)self, self->_cachedLocationGlyphIndex);
    v22 = self->_cachedFontCharRange.location;
    v8 = v21 >= v22;
    v23 = v21 - v22;
    v25 = v8 && v23 < self->_cachedFontCharRange.length;
    if (v20 == 256)
      v26 = 0;
    else
      v26 = v25;
    if (v20 >= 1 && (v26 & 1) == 0)
    {
      -[UIFont _totalAdvancementForNativeGlyphs:count:](self->_cachedFont, "_totalAdvancementForNativeGlyphs:count:", v51, v20);
      v20 = 0;
      self->_cachedLocation.x = v27 + self->_cachedLocation.x;
    }
    if ((v25 & 1) == 0)
    {
      cachedFont = self->_cachedFont;
      v29 = (void *)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", v46, v21, p_cachedFontCharRange);
      v48 = 0;
      v49 = 0;
      v30 = (void *)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", CFSTR("CTVerticalForms"), v21, &v48);
      v31 = objc_msgSend(v30, "BOOLValue");
      if (v30)
        v32 = 0;
      else
        v32 = v18;
      if ((v31 & 1) != 0)
        v33 = 1;
      else
        v33 = v32;
      if (v29)
      {
        if (!v33)
          goto LABEL_53;
      }
      else
      {
        v29 = (void *)NSDefaultFont();
        if (!v33)
        {
LABEL_53:
          self->_cachedFont = -[NSLayoutManager substituteFontForFont:](self, "substituteFontForFont:", v29, v46, p_cachedFontCharRange);

          -[UIFont boundingRectForFont](self->_cachedFont, "boundingRectForFont");
          extraData = (double *)self->_extraData;
          *((_QWORD *)extraData + 14) = v40;
          extraData[15] = -v37 - v39;
          *((_QWORD *)extraData + 16) = v41;
          extraData[17] = v39;
          goto LABEL_54;
        }
      }
      v34 = objc_msgSend(v29, "verticalFont", v46, p_cachedFontCharRange);
      if (v34)
        v29 = (void *)v34;
      v35 = objc_msgSend(v29, "isVertical");
      if (v30)
      {
        if (v35)
        {
          v36 = self->_cachedFontCharRange.location;
          if (v49 + v48 < self->_cachedFontCharRange.length + v36)
            self->_cachedFontCharRange.length = v49 + v48 - v36;
        }
      }
      goto LABEL_53;
    }
LABEL_54:
    v42 = _NSGlyphTreeGlyphAtIndex((uint64_t)self, self->_cachedLocationGlyphIndex, 0);
    if (v42 == 0xFFFFFF)
    {
      if (-[UIFont _isDefaultFace](self->_cachedFont, "_isDefaultFace"))
        LOWORD(v42) = 0;
      else
        LOWORD(v42) = -1;
    }
    v51[v20++] = v42;
LABEL_59:
    v19 = self->_cachedLocationGlyphIndex + 1;
    self->_cachedLocationGlyphIndex = v19;
  }
  while (v19 < glyphIndex);
  if (v20 <= 0)
  {
LABEL_62:
    x = self->_cachedLocation.x;
    goto LABEL_63;
  }
  -[UIFont _totalAdvancementForNativeGlyphs:count:](self->_cachedFont, "_totalAdvancementForNativeGlyphs:count:", v51, v20);
  x = v43 + self->_cachedLocation.x;
  self->_cachedLocation.x = x;
LABEL_63:
  y = self->_cachedLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)notShownAttributeForGlyphAtIndex:(NSUInteger)glyphIndex
{
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
  return _NSGlyphTreeNotShownAttributeForGlyphAtIndex((uint64_t)self, glyphIndex);
}

- (BOOL)drawsOutsideLineFragmentForGlyphAtIndex:(NSUInteger)glyphIndex
{
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
  return _NSGlyphTreeDrawsOutsideLineFragmentForGlyphAtIndex((uint64_t)self, glyphIndex);
}

- (CGSize)attachmentSizeForGlyphAtIndex:(NSUInteger)glyphIndex
{
  double v3;
  double v4;
  CGSize result;

  v3 = _NSLayoutTreeAttachmentSizeForGlyphAtIndex((uint64_t)self, glyphIndex);
  result.height = v4;
  result.width = v3;
  return result;
}

- (NSRange)truncatedGlyphRangeInLineFragmentForGlyphAtIndex:(NSUInteger)glyphIndex
{
  uint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v8;
  uint64_t v9;
  NSRange result;

  v8 = 0;
  v9 = 0;
  -[NSLayoutManager lineFragmentRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentRectForGlyphAtIndex:effectiveRange:", glyphIndex, &v8);
  v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (v9
    && (v5 = _NSGlyphTreeEllipsisGlyphIndexForTruncatedGlyphRange((uint64_t)self, v8, v9), v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v6 = v8 - v5 + v9;
    v4 = v5;
  }
  else
  {
    v6 = 0;
  }
  v7 = v4;
  result.length = v6;
  result.location = v7;
  return result;
}

- (void)setLayoutRect:(NSRect)rect forTextBlock:(NSTextBlock *)block glyphRange:(NSRange)glyphRange
{
  NSUInteger length;
  NSUInteger location;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSLayoutManagerTextBlockHelper *v13;
  NSLayoutManagerTextBlockHelper *v14;
  unint64_t v15;
  double v16;
  double v17;
  NSRect v18;

  length = glyphRange.length;
  location = glyphRange.location;
  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphRange.location, glyphRange.length);
  v13 = _NSAddTextBlockWithGlyphRange((uint64_t)self, (id *)self->_extraData + 23, (uint64_t)block, location, length);
  v13->_layoutRect.origin.x = x;
  v13->_layoutRect.origin.y = y;
  v13->_layoutRect.size.width = width;
  v13->_layoutRect.size.height = height;
  if (location)
  {
    v14 = v13;
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    if (!NSIsEmptyRect(v18))
    {
      v15 = location - 1;
      _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v15, 0);
      v14->_layoutRect.origin.y = v14->_layoutRect.origin.y - (v16 + v17);
      _NSLayoutTreeSetBlocksDependUponLineFragmentAtGlyphIndex((uint64_t)self, v15);
    }
  }
}

- (void)setBoundsRect:(NSRect)rect forTextBlock:(NSTextBlock *)block glyphRange:(NSRange)glyphRange
{
  NSUInteger length;
  NSUInteger location;
  double height;
  double width;
  double y;
  double x;
  NSLayoutManagerTextBlockHelper *v13;
  NSLayoutManagerTextBlockHelper *v14;
  double v15;
  unint64_t v16;
  NSRunStorage *containerRuns;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  NSRect v21;
  NSRect v22;

  length = glyphRange.length;
  location = glyphRange.location;
  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphRange.location, glyphRange.length);
  v13 = _NSAddTextBlockWithGlyphRange((uint64_t)self, (id *)self->_extraData + 23, (uint64_t)block, location, length);
  v13->_boundsRect.origin.x = x;
  v13->_boundsRect.origin.y = y;
  v13->_boundsRect.size.width = width;
  v13->_boundsRect.size.height = height;
  if (location)
  {
    v14 = v13;
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    if (!NSIsEmptyRect(v21))
    {
      _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, location, 0);
      v14->_boundsRect.origin.y = v14->_boundsRect.origin.y - v15;
      _NSLayoutTreeSetBlocksDependUponLineFragmentAtGlyphIndex((uint64_t)self, location);
    }
  }
  if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
  {
    v20 = -[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
    if (!v20)
      return;
    goto LABEL_11;
  }
  v16 = length + location - 1;
  if (-[NSRunStorage count](self->_containerRuns, "count") > v16)
  {
    containerRuns = self->_containerRuns;
    _NSBlockNumberForIndex(containerRuns, v16, 0);
    v19 = 0;
    if (containerRuns->_gapBlockIndex <= v18)
      v19 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
    v20 = *(_QWORD *)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v19 + v18)];
    if (v20)
    {
LABEL_11:
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      if (!NSIsEmptyRect(v22))
        -[NSLayoutManager _updateUsageForTextContainer:addingUsedRect:](self, "_updateUsageForTextContainer:addingUsedRect:", v20, x, y, width, height);
    }
  }
}

- (NSRect)layoutRectForTextBlock:(NSTextBlock *)block glyphRange:(NSRange)glyphRange
{
  NSUInteger length;
  NSUInteger location;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  NSRect result;

  length = glyphRange.length;
  location = glyphRange.location;
  v8 = *MEMORY[0x1E0CB3438];
  v9 = *(double *)(MEMORY[0x1E0CB3438] + 8);
  v10 = *(double *)(MEMORY[0x1E0CB3438] + 16);
  v11 = *(double *)(MEMORY[0x1E0CB3438] + 24);
  v20 = xmmword_18D6CBB80;
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphRange.location, glyphRange.length);
  v12 = (void *)*((_QWORD *)self->_extraData + 23);
  if (v12)
  {
    _NSLocateTextBlockAtIndex(v12, (uint64_t)block, location, &v20);
    if (v13)
    {
      if (__PAIR128__(length, location) == v20)
      {
        v8 = *(double *)(v13 + 16);
        v9 = *(double *)(v13 + 24);
        v10 = *(double *)(v13 + 32);
        v11 = *(double *)(v13 + 40);
        if (location)
        {
          if (!NSIsEmptyRect(*(NSRect *)(v13 + 16)))
          {
            _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, location - 1, 0);
            v9 = v9 + v14 + v15;
          }
        }
      }
    }
  }
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (NSRect)boundsRectForTextBlock:(NSTextBlock *)block glyphRange:(NSRange)glyphRange
{
  NSUInteger length;
  NSUInteger location;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  NSRect result;

  length = glyphRange.length;
  location = glyphRange.location;
  v8 = *MEMORY[0x1E0CB3438];
  v9 = *(double *)(MEMORY[0x1E0CB3438] + 8);
  v10 = *(double *)(MEMORY[0x1E0CB3438] + 16);
  v11 = *(double *)(MEMORY[0x1E0CB3438] + 24);
  v19 = xmmword_18D6CBB80;
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphRange.location, glyphRange.length);
  v12 = (void *)*((_QWORD *)self->_extraData + 23);
  if (v12)
  {
    _NSLocateTextBlockAtIndex(v12, (uint64_t)block, location, &v19);
    if (v13)
    {
      if (__PAIR128__(length, location) == v19)
      {
        v8 = *(double *)(v13 + 48);
        v9 = *(double *)(v13 + 56);
        v10 = *(double *)(v13 + 64);
        v11 = *(double *)(v13 + 72);
        if (location)
        {
          if (!NSIsEmptyRect(*(NSRect *)(v13 + 48)))
          {
            _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, location, 0);
            v9 = v9 + v14;
          }
        }
      }
    }
  }
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v18 = v11;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (NSRect)layoutRectForTextBlock:(NSTextBlock *)block atIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange
{
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  NSRect result;

  v9 = *MEMORY[0x1E0CB3438];
  v10 = *(double *)(MEMORY[0x1E0CB3438] + 8);
  v11 = *(double *)(MEMORY[0x1E0CB3438] + 16);
  v12 = *(double *)(MEMORY[0x1E0CB3438] + 24);
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
  v13 = (void *)*((_QWORD *)self->_extraData + 23);
  if (v13 && (v23 = xmmword_18D6CBB80, _NSLocateTextBlockAtIndex(v13, (uint64_t)block, glyphIndex, &v23), v14))
  {
    v9 = *(double *)(v14 + 16);
    v10 = *(double *)(v14 + 24);
    v11 = *(double *)(v14 + 32);
    v12 = *(double *)(v14 + 40);
    v15 = *((_QWORD *)&v23 + 1);
    v16 = v23;
    if ((_QWORD)v23 && !NSIsEmptyRect(*(NSRect *)(v14 + 16)))
    {
      _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v16 - 1, 0);
      v10 = v10 + v17 + v18;
    }
  }
  else
  {
    v15 = 0;
    v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (effectiveGlyphRange)
  {
    effectiveGlyphRange->location = v16;
    effectiveGlyphRange->length = v15;
  }
  v19 = v9;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (NSRect)boundsRectForTextBlock:(NSTextBlock *)block atIndex:(NSUInteger)glyphIndex effectiveRange:(NSRangePointer)effectiveGlyphRange
{
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  NSUInteger v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  NSRect result;

  v9 = *MEMORY[0x1E0CB3438];
  v10 = *(double *)(MEMORY[0x1E0CB3438] + 8);
  v11 = *(double *)(MEMORY[0x1E0CB3438] + 16);
  v12 = *(double *)(MEMORY[0x1E0CB3438] + 24);
  _NSFastFillAllGlyphHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
  v13 = (void *)*((_QWORD *)self->_extraData + 23);
  if (v13 && (v22 = xmmword_18D6CBB80, _NSLocateTextBlockAtIndex(v13, (uint64_t)block, glyphIndex, &v22), v14))
  {
    v9 = *(double *)(v14 + 48);
    v10 = *(double *)(v14 + 56);
    v11 = *(double *)(v14 + 64);
    v12 = *(double *)(v14 + 72);
    v16 = *((_QWORD *)&v22 + 1);
    v15 = v22;
    if ((_QWORD)v22 && !NSIsEmptyRect(*(NSRect *)(v14 + 48)))
    {
      _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, v15, 0);
      v10 = v10 + v17;
    }
  }
  else
  {
    v16 = 0;
    v15 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (effectiveGlyphRange)
  {
    effectiveGlyphRange->location = v15;
    effectiveGlyphRange->length = v16;
  }
  v18 = v9;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (NSRange)rangeOfNominallySpacedGlyphsContainingIndex:(NSUInteger)glyphIndex
{
  NSUInteger location;
  NSUInteger length;
  NSRange v6;
  unint64_t v7;
  char v8;
  NSUInteger v9;
  NSUInteger v10;
  NSRange v11;
  NSRange v12;
  NSRange result;

  location = glyphIndex;
  length = 1;
  _NSFastFillAllLayoutHolesForGlyphRange((uint64_t)self, glyphIndex, 1uLL);
  if ((_NSGlyphTreeNotShownAttributeForGlyphAtIndex((uint64_t)self, location) & 1) == 0)
  {
    v12.location = 0;
    v12.length = 0;
    v11.location = 0;
    v11.length = 0;
    _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, location, (uint64_t *)&v11);
    _NSLayoutTreeRunLocationForGlyphAtIndex((uint64_t)self, location, &v12);
    v6 = NSIntersectionRange(v12, v11);
    v12 = v6;
    v7 = location + 1;
    if (location + 1 >= v6.length + v6.location)
    {
      length = v6.length;
      location = v6.location;
    }
    else
    {
      do
      {
        v8 = _NSGlyphTreeNotShownAttributeForGlyphAtIndex((uint64_t)self, v7);
        location = v12.location;
        if ((v8 & 1) != 0)
        {
          length = v7 - v12.location;
          v12.length = v7 - v12.location;
        }
        else
        {
          length = v12.length;
        }
        ++v7;
      }
      while (v7 < length + v12.location);
    }
  }
  v9 = location;
  v10 = length;
  result.length = v10;
  result.location = v9;
  return result;
}

- (NSRectArray)rectArrayForCharacterRange:(NSRange)charRange withinSelectedCharacterRange:(NSRange)selCharRange inTextContainer:(NSTextContainer *)container rectCount:(NSUInteger *)rectCount
{
  uint64_t v7;

  LOBYTE(v7) = 0;
  return -[NSLayoutManager _rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:](self, "_rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:", charRange.location, charRange.length, selCharRange.location, selCharRange.length, 1, 0, v7, container, rectCount, 0, 0);
}

- (NSRectArray)rectArrayForGlyphRange:(NSRange)glyphRange withinSelectedGlyphRange:(NSRange)selGlyphRange inTextContainer:(NSTextContainer *)container rectCount:(NSUInteger *)rectCount
{
  uint64_t v7;

  LOBYTE(v7) = 0;
  return -[NSLayoutManager _rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:](self, "_rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:", glyphRange.location, glyphRange.length, selGlyphRange.location, selGlyphRange.length, 0, 0, v7, container, rectCount, 0, 0);
}

- (CGRect)boundingRectForGlyphRange:(NSRange)glyphRange inTextContainer:(NSTextContainer *)container
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[NSLayoutManager _boundingRectForGlyphRange:inTextContainer:fast:fullLineRectsOnly:](self, "_boundingRectForGlyphRange:inTextContainer:fast:fullLineRectsOnly:", glyphRange.location, glyphRange.length, container, (*(_DWORD *)&self->_lmFlags & 2) == 0, 0);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (NSRange)glyphRangeForBoundingRect:(CGRect)bounds inTextContainer:(NSTextContainer *)container
{
  NSUInteger v4;
  NSUInteger v5;
  NSRange result;

  v4 = -[NSLayoutManager _glyphRangeForBoundingRect:inTextContainer:fast:okToFillHoles:](self, "_glyphRangeForBoundingRect:inTextContainer:fast:okToFillHoles:", container, (*(_DWORD *)&self->_lmFlags & 2) == 0, 1, bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
  result.length = v5;
  result.location = v4;
  return result;
}

- (NSRange)glyphRangeForBoundingRectWithoutAdditionalLayout:(CGRect)bounds inTextContainer:(NSTextContainer *)container
{
  NSUInteger v4;
  NSUInteger v5;
  NSRange result;

  v4 = -[NSLayoutManager _glyphRangeForBoundingRect:inTextContainer:fast:okToFillHoles:](self, "_glyphRangeForBoundingRect:inTextContainer:fast:okToFillHoles:", container, (*(_DWORD *)&self->_lmFlags & 2) == 0, 0, bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
  result.length = v5;
  result.location = v4;
  return result;
}

- (NSUInteger)glyphIndexForPoint:(CGPoint)point inTextContainer:(NSTextContainer *)container
{
  return _glyphIndexForPoint((uint64_t)self, container, 0, point.x, point.y);
}

- (CGFloat)fractionOfDistanceThroughGlyphForPoint:(CGPoint)point inTextContainer:(NSTextContainer *)container
{
  double v5;

  v5 = 0.0;
  _glyphIndexForPoint((uint64_t)self, container, &v5, point.x, point.y);
  return v5;
}

- (NSUInteger)glyphIndexForPoint:(CGPoint)point inTextContainer:(NSTextContainer *)container fractionOfDistanceThroughGlyph:(CGFloat *)partialFraction
{
  double y;
  double x;
  uint64_t v10;

  y = point.y;
  x = point.x;
  if (partialFraction)
  {
    -[NSLayoutManager fractionOfDistanceThroughGlyphForPoint:inTextContainer:](self, "fractionOfDistanceThroughGlyphForPoint:inTextContainer:", container, point.x, point.y);
    *(_QWORD *)partialFraction = v10;
  }
  return -[NSLayoutManager glyphIndexForPoint:inTextContainer:](self, "glyphIndexForPoint:inTextContainer:", container, x, y);
}

- (NSUInteger)characterIndexForPoint:(CGPoint)point inTextContainer:(NSTextContainer *)container fractionOfDistanceBetweenInsertionPoints:(CGFloat *)partialFraction
{
  double y;
  double x;
  unint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v19;
  int64_t v20;
  unint64_t i;
  uint64_t v22;
  unint64_t v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  double *v28;
  double v29;
  unint64_t v30;
  unint64_t j;
  uint64_t v32;
  unint64_t k;
  unint64_t v34;
  NSUInteger v35;
  unint64_t m;
  unint64_t v37;
  NSUInteger *v38;
  NSUInteger v39;
  NSUInteger v40;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t *v47;
  uint64_t v48;
  double *v49;
  double v50;

  y = point.y;
  x = point.x;
  v50 = 0.0;
  v48 = 0;
  v49 = 0;
  v10 = -[NSTextStorage length](self->_textStorage, "length");
  v11 = -[NSLayoutManager glyphIndexForPoint:inTextContainer:fractionOfDistanceThroughGlyph:](self, "glyphIndexForPoint:inTextContainer:fractionOfDistanceThroughGlyph:", container, &v50, x, y);
  v12 = -[NSLayoutManager characterIndexForGlyphAtIndex:](self, "characterIndexForGlyphAtIndex:", v11);
  v46 = 0;
  v47 = 0;
  v44 = 0;
  v45 = 0;
  v13 = -[NSTextStorage string](self->_textStorage, "string");
  v42 = 0;
  v43 = 0;
  if (v12 >= v10)
    goto LABEL_95;
  v14 = (void *)v13;
  -[NSLayoutManager lineFragmentRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v11, &v42);
  if (!v43)
    goto LABEL_95;
  if (y < v16 || y >= v16 + v17)
    goto LABEL_95;
  v19 = x - v15;
  v20 = -[NSLayoutManager getLineFragmentInsertionPointArraysForCharacterAtIndex:inDisplayOrder:positions:characterIndexes:count:alternatePositions:characterIndexes:count:](self, "getLineFragmentInsertionPointArraysForCharacterAtIndex:inDisplayOrder:positions:characterIndexes:count:alternatePositions:characterIndexes:count:", v12, 1, &v49, &v47, &v45, &v48, &v46, &v44);
  if (v45 >= 2)
  {
    if (v19 < *v49)
    {
      if (!v44)
        goto LABEL_18;
      for (i = 0; i < v44; ++i)
      {
        if (*v49 == *(double *)(v48 + 8 * i))
          v22 = *(_QWORD *)(v46 + 8 * i);
        else
          v22 = 0x7FFFFFFFFFFFFFFFLL;
        if (v22 != 0x7FFFFFFFFFFFFFFFLL)
          break;
      }
      if (v22 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_18:
        if (*v47 >= v10)
        {
          v12 = v47[1];
        }
        else
        {
          if (objc_msgSend(v14, "characterAtIndex:") != 13
            || *v47 + 1 >= v10
            || objc_msgSend(v14, "characterAtIndex:") != 10)
          {
            goto LABEL_95;
          }
          v12 = *v47;
        }
        goto LABEL_94;
      }
      v35 = *v47;
LABEL_55:
      v50 = 0.0;
      if (v35)
      {
        v12 = v35 - 1;
        goto LABEL_94;
      }
LABEL_98:
      v12 = 0;
      if (!partialFraction)
        return v12;
      goto LABEL_96;
    }
    v23 = v45 - 1;
    v24 = v49[v45 - 1];
    if (v19 >= v24)
    {
      if (!v44)
        goto LABEL_38;
      for (j = 0; j < v44; ++j)
      {
        if (v24 == *(double *)(v48 + 8 * j))
          v32 = *(_QWORD *)(v46 + 8 * j);
        else
          v32 = 0x7FFFFFFFFFFFFFFFLL;
        if (v32 != 0x7FFFFFFFFFFFFFFFLL)
          break;
      }
      if (v32 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_38:
        if (v47[v23] >= v10)
        {
          v12 = v47[v45 - 2];
        }
        else
        {
          if (objc_msgSend(v14, "characterAtIndex:") != 13
            || v47[v45 - 1] + 1 >= v10
            || objc_msgSend(v14, "characterAtIndex:") != 10)
          {
            goto LABEL_95;
          }
          v12 = v47[v45 - 1];
        }
LABEL_94:
        v50 = 1.0;
        goto LABEL_95;
      }
      v35 = v47[v23];
      goto LABEL_55;
    }
  }
  if (v45 < 2)
    goto LABEL_95;
  v25 = 0;
  v26 = v50;
  while (1)
  {
    v27 = v49[v25];
    if (v19 >= v27)
    {
      v28 = &v49[v25];
      v29 = v28[1];
      if (v19 < v29)
        break;
    }
    v30 = v25 + 2;
    ++v25;
    if (v30 >= v45)
      goto LABEL_95;
  }
  if (v44)
  {
    for (k = 0; k < v44; ++k)
    {
      if (v27 == *(double *)(v48 + 8 * k))
        v34 = *(_QWORD *)(v46 + 8 * k);
      else
        v34 = 0x7FFFFFFFFFFFFFFFLL;
      if (v34 != 0x7FFFFFFFFFFFFFFFLL)
        break;
    }
  }
  else
  {
    v34 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v44)
  {
    for (m = 0; m < v44; ++m)
    {
      if (v29 == *(double *)(v48 + 8 * m))
        v37 = *(_QWORD *)(v46 + 8 * m);
      else
        v37 = 0x7FFFFFFFFFFFFFFFLL;
      if (v37 != 0x7FFFFFFFFFFFFFFFLL)
        break;
    }
  }
  else
  {
    v37 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v38 = &v47[v25];
  v40 = *v38;
  v39 = v38[1];
  if (v40 >= v39)
  {
    if (v40 > v39)
    {
      v26 = (v29 - v19) / (v29 - v27);
      v50 = v26;
      v12 = v39;
    }
  }
  else
  {
    v26 = (v19 - v27) / (v29 - v27);
    v50 = v26;
    v12 = v40;
  }
  if (v20 == 1)
  {
    if (v34 == 0x7FFFFFFFFFFFFFFFLL || v26 < 0.5)
    {
      if (v37 == 0x7FFFFFFFFFFFFFFFLL || v26 >= 0.5)
      {
        if (v40 < v37 && v37 != 0x7FFFFFFFFFFFFFFFLL && v26 >= 0.5)
        {
          v50 = (v19 - v49[v25]) / (v28[1] - v49[v25]);
          v12 = v40;
          if (!partialFraction)
            return v12;
          goto LABEL_96;
        }
        goto LABEL_95;
      }
LABEL_92:
      v50 = 0.0;
      if (v39)
      {
        v12 = v39 - 1;
        goto LABEL_94;
      }
      goto LABEL_98;
    }
LABEL_83:
    v50 = 0.0;
    if (v40)
    {
      v12 = v40 - 1;
      goto LABEL_94;
    }
    goto LABEL_98;
  }
  if (v34 != 0x7FFFFFFFFFFFFFFFLL && v26 < 0.5)
    goto LABEL_83;
  if (v34 > v39 && v34 != 0x7FFFFFFFFFFFFFFFLL && v26 >= 0.5)
  {
    v50 = (v28[1] - v19) / (v28[1] - v49[v25]);
    v12 = v39;
    if (!partialFraction)
      return v12;
    goto LABEL_96;
  }
  if (v37 != 0x7FFFFFFFFFFFFFFFLL && v26 >= 0.5)
    goto LABEL_92;
LABEL_95:
  if (partialFraction)
LABEL_96:
    *partialFraction = v50;
  return v12;
}

- (NSUInteger)getLineFragmentInsertionPointsForCharacterAtIndex:(NSUInteger)charIndex alternatePositions:(BOOL)aFlag inDisplayOrder:(BOOL)dFlag positions:(CGFloat *)positions characterIndexes:(NSUInteger *)charIndexes
{
  NSUInteger result;
  void *__src;
  void *v11;
  NSUInteger v12;

  v12 = 0;
  __src = 0;
  v11 = 0;
  if (aFlag)
    -[NSLayoutManager getLineFragmentInsertionPointArraysForCharacterAtIndex:inDisplayOrder:positions:characterIndexes:count:alternatePositions:characterIndexes:count:](self, "getLineFragmentInsertionPointArraysForCharacterAtIndex:inDisplayOrder:positions:characterIndexes:count:alternatePositions:characterIndexes:count:", charIndex, dFlag, 0, 0, 0, &__src, &v11, &v12);
  else
    -[NSLayoutManager getLineFragmentInsertionPointArraysForCharacterAtIndex:inDisplayOrder:positions:characterIndexes:count:alternatePositions:characterIndexes:count:](self, "getLineFragmentInsertionPointArraysForCharacterAtIndex:inDisplayOrder:positions:characterIndexes:count:alternatePositions:characterIndexes:count:", charIndex, dFlag, &__src, &v11, &v12, 0, 0, 0);
  result = v12;
  if (v12)
  {
    if (positions)
    {
      memmove(positions, __src, 8 * v12);
      result = v12;
    }
    if (charIndexes)
    {
      memmove(charIndexes, v11, 8 * result);
      return v12;
    }
  }
  return result;
}

- (NSDictionary)temporaryAttributesAtCharacterIndex:(NSUInteger)charIndex effectiveRange:(NSRangePointer)effectiveCharRange
{
  void *v6;
  NSUInteger v8;
  NSDictionary *v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;

  v6 = (void *)*((_QWORD *)self->_extraData + 9);
  if (v6)
  {
    v8 = objc_msgSend(v6, "count");
    if (v8 > charIndex)
      return (NSDictionary *)objc_msgSend(*((id *)self->_extraData + 9), "objectAtIndex:effectiveRange:", charIndex, effectiveCharRange);
    v12 = v8;
    v10 = +[NSAttributeDictionary emptyAttributeDictionary](NSAttributeDictionary, "emptyAttributeDictionary");
    if (effectiveCharRange)
    {
      v13 = -[NSTextStorage length](self->_textStorage, "length");
      if (v13 <= charIndex)
      {
        effectiveCharRange->location = charIndex;
        effectiveCharRange->length = 1;
      }
      else
      {
        effectiveCharRange->location = v12;
        effectiveCharRange->length = v13 - v12;
      }
    }
  }
  else
  {
    v10 = +[NSAttributeDictionary emptyAttributeDictionary](NSAttributeDictionary, "emptyAttributeDictionary", charIndex);
    if (effectiveCharRange)
    {
      v11 = -[NSTextStorage length](self->_textStorage, "length");
      effectiveCharRange->location = 0;
      effectiveCharRange->length = v11;
    }
  }
  return v10;
}

- (void)setTemporaryAttributes:(NSDictionary *)attrs forCharacterRange:(NSRange)charRange
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  NSRange v9;
  id v10;
  NSRange v11;
  NSRange v12;

  if (charRange.length)
  {
    length = charRange.length;
    location = charRange.location;
    v8 = (void *)*((_QWORD *)self->_extraData + 9);
    if (v8)
    {
LABEL_3:
      v12.length = objc_msgSend(v8, "count");
      v11.location = location;
      v11.length = length;
      v12.location = 0;
      v9 = NSIntersectionRange(v11, v12);
      v10 = +[NSAttributeDictionary newWithDictionary:](NSAttributeDictionary, "newWithDictionary:", attrs);
      objc_msgSend(*((id *)self->_extraData + 9), "replaceObjectsInRange:withObject:length:", v9.location, v9.length, v10, v9.length);

      -[NSLayoutManager invalidateDisplayForCharacterRange:](self, "invalidateDisplayForCharacterRange:", v9.location, v9.length);
      return;
    }
    if (-[NSDictionary count](attrs, "count"))
    {
      v8 = (void *)*((_QWORD *)self->_extraData + 9);
      if (!v8)
      {
        *((_QWORD *)self->_extraData + 9) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3790], "allocWithZone:", -[NSLayoutManager zone](self, "zone")), "init");
        objc_msgSend(*((id *)self->_extraData + 9), "insertObject:range:", +[NSAttributeDictionary emptyAttributeDictionary](NSAttributeDictionary, "emptyAttributeDictionary"), 0, -[NSTextStorage length](self->_textStorage, "length"));
        v8 = (void *)*((_QWORD *)self->_extraData + 9);
      }
      goto LABEL_3;
    }
  }
}

- (void)addTemporaryAttributes:(NSDictionary *)attrs forCharacterRange:(NSRange)charRange
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  NSRange v9;
  NSUInteger v10;
  NSUInteger v11;
  void *v12;
  NSRange v13;
  NSRange v14;
  NSRange v15;
  NSRange v16;
  NSRange v17;
  NSRange v18;
  NSRange v19;
  NSRange v20;

  if (charRange.length)
  {
    length = charRange.length;
    location = charRange.location;
    v8 = (void *)*((_QWORD *)self->_extraData + 9);
    if (!v8)
    {
      *((_QWORD *)self->_extraData + 9) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3790], "allocWithZone:", -[NSLayoutManager zone](self, "zone")), "init");
      objc_msgSend(*((id *)self->_extraData + 9), "insertObject:range:", +[NSAttributeDictionary emptyAttributeDictionary](NSAttributeDictionary, "emptyAttributeDictionary"), 0, -[NSTextStorage length](self->_textStorage, "length"));
      v8 = (void *)*((_QWORD *)self->_extraData + 9);
    }
    v19.length = objc_msgSend(v8, "count");
    v16.location = location;
    v16.length = length;
    v19.location = 0;
    v9 = NSIntersectionRange(v16, v19);
    if (v9.length)
    {
      v10 = v9.location;
      v11 = v9.length;
      do
      {
        v15.location = 0;
        v15.length = 0;
        v12 = (void *)objc_msgSend((id)objc_msgSend(*((id *)self->_extraData + 9), "objectAtIndex:effectiveRange:", v10, &v15), "mutableCopyWithZone:", 0);
        v17.location = v10;
        v17.length = v11;
        v13 = NSIntersectionRange(v17, v15);
        v15.location = v10;
        v15.length = v13.length;
        if (v13.length > v11)
          v15.length = v11;
        objc_msgSend(v12, "addEntriesFromDictionary:", attrs, v15.location);
        if (v15.length)
          objc_msgSend(*((id *)self->_extraData + 9), "replaceObjectsInRange:withObject:length:", v15.location, v15.length, v12, v15.length);

        if (!v15.length)
          break;
        v10 += v15.length;
        v11 -= v15.length;
      }
      while (v11);
    }
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[NSDictionary allKeys](attrs, "allKeys")), "isSubsetOfSet:", _NSFaultInObject()) & 1) == 0)
    {
      v20.length = objc_msgSend(*((id *)self->_extraData + 9), "count");
      v18.location = location;
      v18.length = length;
      v20.location = 0;
      v14 = NSIntersectionRange(v18, v20);
      -[NSLayoutManager invalidateDisplayForCharacterRange:](self, "invalidateDisplayForCharacterRange:", v14.location, v14.length);
    }
  }
}

- (void)addTemporaryAttribute:(NSAttributedStringKey)attrName value:(id)value forCharacterRange:(NSRange)charRange
{
  NSUInteger length;
  NSUInteger location;
  void *v10;
  NSRange v11;
  NSUInteger v12;
  NSUInteger v13;
  void *v14;
  NSRange v15;
  NSRange v16;
  NSRange v17;
  NSRange v18;
  NSRange v19;
  NSRange v20;
  NSRange v21;
  NSRange v22;

  if (charRange.length)
  {
    length = charRange.length;
    location = charRange.location;
    v10 = (void *)*((_QWORD *)self->_extraData + 9);
    if (!v10)
    {
      *((_QWORD *)self->_extraData + 9) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3790], "allocWithZone:", -[NSLayoutManager zone](self, "zone")), "init");
      objc_msgSend(*((id *)self->_extraData + 9), "insertObject:range:", +[NSAttributeDictionary emptyAttributeDictionary](NSAttributeDictionary, "emptyAttributeDictionary"), 0, -[NSTextStorage length](self->_textStorage, "length"));
      v10 = (void *)*((_QWORD *)self->_extraData + 9);
    }
    v21.length = objc_msgSend(v10, "count");
    v18.location = location;
    v18.length = length;
    v21.location = 0;
    v11 = NSIntersectionRange(v18, v21);
    if (v11.length)
    {
      v12 = v11.location;
      v13 = v11.length;
      do
      {
        v17.location = 0;
        v17.length = 0;
        v14 = (void *)objc_msgSend((id)objc_msgSend(*((id *)self->_extraData + 9), "objectAtIndex:effectiveRange:", v12, &v17), "mutableCopyWithZone:", 0);
        v19.location = v12;
        v19.length = v13;
        v15 = NSIntersectionRange(v19, v17);
        v17.location = v12;
        v17.length = v15.length;
        if (v15.length > v13)
          v17.length = v13;
        objc_msgSend(v14, "setObject:forKey:", value, attrName, v17.location);
        if (v17.length)
          objc_msgSend(*((id *)self->_extraData + 9), "replaceObjectsInRange:withObject:length:", v17.location, v17.length, v14, v17.length);

        if (!v17.length)
          break;
        v12 += v17.length;
        v13 -= v17.length;
      }
      while (v13);
    }
    if ((objc_msgSend((id)_NSFaultInObject(), "containsObject:", attrName) & 1) == 0)
    {
      v22.length = objc_msgSend(*((id *)self->_extraData + 9), "count");
      v20.location = location;
      v20.length = length;
      v22.location = 0;
      v16 = NSIntersectionRange(v20, v22);
      -[NSLayoutManager invalidateDisplayForCharacterRange:](self, "invalidateDisplayForCharacterRange:", v16.location, v16.length);
    }
  }
}

- (void)removeTemporaryAttribute:(NSAttributedStringKey)attrName forCharacterRange:(NSRange)charRange
{
  void *v5;
  BOOL v6;
  NSUInteger length;
  NSUInteger location;
  NSRange v10;
  NSUInteger v11;
  NSUInteger v12;
  void *v13;
  NSRange v14;
  NSRange v15;
  NSRange v16;
  NSRange v17;
  NSRange v18;
  NSRange v19;
  NSRange v20;
  NSRange v21;

  v5 = (void *)*((_QWORD *)self->_extraData + 9);
  if (v5)
    v6 = charRange.length == 0;
  else
    v6 = 1;
  if (!v6)
  {
    length = charRange.length;
    location = charRange.location;
    v20.length = objc_msgSend(v5, "count");
    v17.location = location;
    v17.length = length;
    v20.location = 0;
    v10 = NSIntersectionRange(v17, v20);
    if (v10.length)
    {
      v11 = v10.location;
      v12 = v10.length;
      do
      {
        v16.location = 0;
        v16.length = 0;
        v13 = (void *)objc_msgSend((id)objc_msgSend(*((id *)self->_extraData + 9), "objectAtIndex:effectiveRange:", v11, &v16), "mutableCopyWithZone:", 0);
        v18.location = v11;
        v18.length = v12;
        v14 = NSIntersectionRange(v18, v16);
        v16.location = v11;
        v16.length = v14.length;
        if (v14.length > v12)
          v16.length = v12;
        objc_msgSend(v13, "removeObjectForKey:", attrName, v16.location);
        if (v16.length)
          objc_msgSend(*((id *)self->_extraData + 9), "replaceObjectsInRange:withObject:length:", v16.location, v16.length, v13, v16.length);

        if (!v16.length)
          break;
        v11 += v16.length;
        v12 -= v16.length;
      }
      while (v12);
    }
    if ((objc_msgSend((id)_NSFaultInObject(), "containsObject:", attrName) & 1) == 0)
    {
      v21.length = objc_msgSend(*((id *)self->_extraData + 9), "count");
      v19.location = location;
      v19.length = length;
      v21.location = 0;
      v15 = NSIntersectionRange(v19, v21);
      -[NSLayoutManager invalidateDisplayForCharacterRange:](self, "invalidateDisplayForCharacterRange:", v15.location, v15.length);
    }
  }
}

- (id)temporaryAttribute:(NSAttributedStringKey)attrName atCharacterIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range
{
  return -[NSDictionary objectForKey:](-[NSLayoutManager temporaryAttributesAtCharacterIndex:effectiveRange:](self, "temporaryAttributesAtCharacterIndex:effectiveRange:", location, range), "objectForKey:", attrName);
}

- (id)temporaryAttribute:(NSAttributedStringKey)attrName atCharacterIndex:(NSUInteger)location longestEffectiveRange:(NSRangePointer)range inRange:(NSRange)rangeLimit
{
  NSUInteger length;
  NSUInteger v7;
  id v11;
  unint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  id v15;
  NSUInteger v16;
  id v17;
  NSRange range2;
  NSRange v20;
  NSRange v21;

  length = rangeLimit.length;
  v7 = rangeLimit.location;
  v11 = -[NSLayoutManager temporaryAttribute:atCharacterIndex:effectiveRange:](self, "temporaryAttribute:atCharacterIndex:effectiveRange:", attrName, location);
  if (range)
  {
    v12 = -[NSTextStorage length](self->_textStorage, "length");
    range2 = *range;
    if (v7 + length >= v12)
      v13 = v12;
    else
      v13 = v7 + length;
    do
    {
      v14 = range2.length + range2.location;
      if (range2.length + range2.location >= v13)
        break;
      v15 = -[NSLayoutManager temporaryAttribute:atCharacterIndex:effectiveRange:](self, "temporaryAttribute:atCharacterIndex:effectiveRange:", attrName, range2.length + range2.location, &range2);
    }
    while (v15 == v11 || objc_msgSend(v15, "isEqual:", v11));
    range2 = *range;
    do
    {
      v16 = range2.location;
      if (range2.location <= v7)
        break;
      v17 = -[NSLayoutManager temporaryAttribute:atCharacterIndex:effectiveRange:](self, "temporaryAttribute:atCharacterIndex:effectiveRange:", attrName, range2.location - 1, &range2);
    }
    while (v17 == v11 || objc_msgSend(v17, "isEqual:", v11));
    v21.length = v14 - v16;
    v20.location = v7;
    v20.length = length;
    v21.location = v16;
    *range = NSIntersectionRange(v20, v21);
  }
  return v11;
}

- (NSDictionary)temporaryAttributesAtCharacterIndex:(NSUInteger)location longestEffectiveRange:(NSRangePointer)range inRange:(NSRange)rangeLimit
{
  NSUInteger length;
  NSUInteger v6;
  NSDictionary *v9;
  unint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSRange range2;
  NSRange v16;
  NSRange v17;

  length = rangeLimit.length;
  v6 = rangeLimit.location;
  v9 = -[NSLayoutManager temporaryAttributesAtCharacterIndex:effectiveRange:](self, "temporaryAttributesAtCharacterIndex:effectiveRange:", location);
  if (range)
  {
    v10 = -[NSTextStorage length](self->_textStorage, "length");
    range2 = *range;
    if (v6 + length >= v10)
      v11 = v10;
    else
      v11 = v6 + length;
    do
      v12 = range2.length + range2.location;
    while (range2.length + range2.location < v11
         && -[NSDictionary isEqualToDictionary:](-[NSLayoutManager temporaryAttributesAtCharacterIndex:effectiveRange:](self, "temporaryAttributesAtCharacterIndex:effectiveRange:", range2.length + range2.location, &range2), "isEqualToDictionary:", v9));
    range2 = *range;
    do
      v13 = range2.location;
    while (range2.location > v6
         && -[NSDictionary isEqualToDictionary:](-[NSLayoutManager temporaryAttributesAtCharacterIndex:effectiveRange:](self, "temporaryAttributesAtCharacterIndex:effectiveRange:", range2.location - 1, &range2), "isEqualToDictionary:", v9));
    v17.length = v12 - v13;
    v16.location = v6;
    v16.length = length;
    v17.location = v13;
    *range = NSIntersectionRange(v16, v17);
  }
  return v9;
}

- (CGFloat)defaultLineHeightForFont:(NSFont *)theFont
{
  _BOOL4 v4;
  double v5;
  double v6;
  double v7;

  v4 = -[NSLayoutManager usesFontLeading](self, "usesFontLeading");
  -[UIFont _defaultLineHeightForUILayout](theFont, "_defaultLineHeightForUILayout");
  v6 = v5;
  v7 = 0.0;
  if (v4)
    -[UIFont _leading](theFont, "_leading", 0.0);
  return v6 + v7;
}

- (CGFloat)defaultBaselineOffsetForFont:(NSFont *)theFont
{
  CGFloat result;

  -[NSLayoutManager usesFontLeading](self, "usesFontLeading");
  -[UIFont ascender](theFont, "ascender");
  return result;
}

- (void)setSynchronizesAlignmentToDirection:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_lmFlags = (__lmFlags)(*(_DWORD *)&self->_lmFlags & 0xFFDFFFFF | v3);
}

- (void)setDidCompleteLayoutObserverBlock:(id)a3
{
  *((_QWORD *)self->_extraData + 64) = objc_msgSend(a3, "copy");
}

- (void)enumerateLineFragmentsForGlyphRange:(NSRange)glyphRange usingBlock:(void *)block
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger i;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  unint64_t v25;
  NSRunStorage *containerRuns;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char v30;
  NSUInteger v31;
  uint64_t v32;

  length = glyphRange.length;
  location = glyphRange.location;
  v31 = glyphRange.location;
  v32 = 0;
  v30 = 0;
  -[NSLayoutManager ensureLayoutForGlyphRange:](self, "ensureLayoutForGlyphRange:");
  v8 = *(_QWORD *)(*((_QWORD *)self->_extraData + 26) + 8);
  if (v8 > location)
  {
    v9 = location + length <= v8 ? length : v8 - location;
    for (i = v9 + location; location < i; v31 = location)
    {
      v11 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex((uint64_t)self, location, (uint64_t *)&v31);
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v18 = _NSLayoutTreeLineFragmentUsedRectForGlyphAtIndex((uint64_t)self, v31, 0);
      v20 = v19;
      v22 = v21;
      v24 = v23;
      if ((*((_BYTE *)&self->_lmFlags + 3) & 0x40) != 0)
      {
        v29 = -[NSMutableArray objectAtIndex:](self->_textContainers, "objectAtIndex:", 0);
      }
      else
      {
        v25 = v31;
        if (-[NSRunStorage count](self->_containerRuns, "count") <= v25)
        {
          v29 = 0;
        }
        else
        {
          containerRuns = self->_containerRuns;
          _NSBlockNumberForIndex(containerRuns, v25, 0);
          v28 = 0;
          if (containerRuns->_gapBlockIndex <= v27)
            v28 = containerRuns->_maxBlocks - containerRuns->_numBlocks;
          v29 = *(_QWORD *)&containerRuns->_runs->var1[(containerRuns->_elementSize + 8) * (v28 + v27)];
        }
      }
      (*((void (**)(void *, uint64_t, NSUInteger, uint64_t, char *, double, double, double, double, double, double, double, double))block
       + 2))(block, v29, v31, v32, &v30, v11, v13, v15, v17, v18, v20, v22, v24);
      if (v30)
        break;
      location = v32 + v31;
    }
  }
}

- (void)enumerateEnclosingRectsForGlyphRange:(NSRange)glyphRange withinSelectedGlyphRange:(NSRange)selectedRange inTextContainer:(NSTextContainer *)textContainer usingBlock:(void *)block
{
  CGRect *v7;
  double *p_x;
  CGRect *v9;
  BOOL v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  _BYTE v14[2048];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v12 = 0;
  LOBYTE(v11) = 0;
  v7 = -[NSLayoutManager _rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:rectArray:rectArrayCapacity:](self, "_rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:rectArray:rectArrayCapacity:", glyphRange.location, glyphRange.length, selectedRange.location, selectedRange.length, 0, 0, v11, textContainer, &v13, 0, 0, v14, 64);
  if (v13 >= 1)
  {
    p_x = &v7->origin.x;
    v9 = &v7[v13];
    do
    {
      (*((void (**)(void *, char *, double, double, double, double))block + 2))(block, &v12, *p_x, p_x[1], p_x[2], p_x[3]);
      p_x += 4;
      if (v12)
        v10 = 1;
      else
        v10 = p_x >= (double *)v9;
    }
    while (!v10);
  }
}

- (void)enumerateEnclosingRectsForCharacterRange:(_NSRange)a3 withinSelectedCharacterRange:(_NSRange)a4 inTextContainer:(id)a5 usingBlock:(id)a6
{
  CGRect *v7;
  double *p_x;
  CGRect *v9;
  BOOL v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  _BYTE v14[2048];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v12 = 0;
  LOBYTE(v11) = 0;
  v7 = -[NSLayoutManager _rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:rectArray:rectArrayCapacity:](self, "_rectArrayForRange:withinSelectionRange:rangeIsCharRange:singleRectOnly:fullLineRectsOnly:inTextContainer:rectCount:rangeWithinContainer:glyphsDrawOutsideLines:rectArray:rectArrayCapacity:", a3.location, a3.length, a4.location, a4.length, 1, 0, v11, a5, &v13, 0, 0, v14, 64);
  if (v13 >= 1)
  {
    p_x = &v7->origin.x;
    v9 = &v7[v13];
    do
    {
      (*((void (**)(id, char *, double, double, double, double))a6 + 2))(a6, &v12, *p_x, p_x[1], p_x[2], p_x[3]);
      p_x += 4;
      if (v12)
        v10 = 1;
      else
        v10 = p_x >= (double *)v9;
    }
    while (!v10);
  }
}

- (void)showCGGlyphs:(const CGGlyph *)glyphs positions:(const CGPoint *)positions count:(NSUInteger)glyphCount font:(UIFont *)font matrix:(CGAffineTransform *)textMatrix attributes:(NSDictionary *)attributes inContext:(CGContextRef)graphicsContext
{
  __int128 v9;
  _OWORD v10[3];

  v9 = *(_OWORD *)&textMatrix->c;
  v10[0] = *(_OWORD *)&textMatrix->a;
  v10[1] = v9;
  v10[2] = *(_OWORD *)&textMatrix->tx;
  -[NSLayoutManager showCGGlyphs:positions:count:font:textMatrix:attributes:inContext:](self, "showCGGlyphs:positions:count:font:textMatrix:attributes:inContext:", glyphs, positions, glyphCount, font, v10, attributes, graphicsContext);
}

- (void)fillBackgroundRectArray:(const CGRect *)rectArray count:(NSUInteger)rectCount forCharacterRange:(NSRange)charRange color:(UIColor *)color
{
  CGContext *v9;
  int CompositeOperation;
  _QWORD block[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 2;
  if (rectCount)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __73__NSLayoutManager_fillBackgroundRectArray_count_forCharacterRange_color___block_invoke;
      block[3] = &unk_1E2604CE0;
      block[4] = &v12;
      if (fillBackgroundRectArray_count_forCharacterRange_color__onceToken != -1)
        dispatch_once(&fillBackgroundRectArray_count_forCharacterRange_color__onceToken, block);
    }
    v9 = (CGContext *)objc_msgSend((id)-[objc_class graphicsContextForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "graphicsContextForApplicationFrameworkContext:", -[NSLayoutManager applicationFrameworkContext](self, "applicationFrameworkContext")), "CGContext");
    CompositeOperation = CGContextGetCompositeOperation();
    if (CompositeOperation != *((_DWORD *)v13 + 6))
      CGContextSetCompositeOperation();
    CGContextFillRects(v9, rectArray, rectCount);
    if (CompositeOperation != *((_DWORD *)v13 + 6))
      CGContextSetCompositeOperation();
  }
  _Block_object_dispose(&v12, 8);
}

uint64_t __73__NSLayoutManager_fillBackgroundRectArray_count_forCharacterRange_color___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSLayoutManagerUseCompositeCopy"));
  if ((_DWORD)result)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

- (void)drawUnderlineForGlyphRange:(NSRange)glyphRange underlineType:(NSUnderlineStyle)underlineVal baselineOffset:(CGFloat)baselineOffset lineFragmentRect:(CGRect)lineRect lineFragmentGlyphRange:(NSRange)lineGlyphRange containerOrigin:(CGPoint)containerOrigin
{
  -[NSLayoutManager _drawLineForGlyphRange:type:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:isStrikethrough:](self, "_drawLineForGlyphRange:type:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:isStrikethrough:", glyphRange.location, glyphRange.length, underlineVal, lineGlyphRange.location, lineGlyphRange.length, 0, baselineOffset, lineRect.origin.x, lineRect.origin.y, lineRect.size.width, lineRect.size.height, containerOrigin.x, containerOrigin.y);
}

- (void)drawStrikethroughForGlyphRange:(NSRange)glyphRange strikethroughType:(NSUnderlineStyle)strikethroughVal baselineOffset:(CGFloat)baselineOffset lineFragmentRect:(CGRect)lineRect lineFragmentGlyphRange:(NSRange)lineGlyphRange containerOrigin:(CGPoint)containerOrigin
{
  -[NSLayoutManager _drawLineForGlyphRange:type:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:isStrikethrough:](self, "_drawLineForGlyphRange:type:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:isStrikethrough:", glyphRange.location, glyphRange.length, strikethroughVal, lineGlyphRange.location, lineGlyphRange.length, 1, baselineOffset, lineRect.origin.x, lineRect.origin.y, lineRect.size.width, lineRect.size.height, containerOrigin.x, containerOrigin.y);
}

- (void)strikethroughGlyphRange:(NSRange)glyphRange strikethroughType:(NSUnderlineStyle)strikethroughVal lineFragmentRect:(CGRect)lineRect lineFragmentGlyphRange:(NSRange)lineGlyphRange containerOrigin:(CGPoint)containerOrigin
{
  -[NSLayoutManager _lineGlyphRange:type:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:isStrikethrough:](self, "_lineGlyphRange:type:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:isStrikethrough:", glyphRange.location, glyphRange.length, strikethroughVal, lineGlyphRange.location, lineGlyphRange.length, 1, lineRect.origin.x, lineRect.origin.y, lineRect.size.width, lineRect.size.height, containerOrigin.x, containerOrigin.y);
}

- (void)underlineGlyphRange:(NSRange)glyphRange underlineType:(NSUnderlineStyle)underlineVal lineFragmentRect:(CGRect)lineRect lineFragmentGlyphRange:(NSRange)lineGlyphRange containerOrigin:(CGPoint)containerOrigin
{
  -[NSLayoutManager _lineGlyphRange:type:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:isStrikethrough:](self, "_lineGlyphRange:type:lineFragmentRect:lineFragmentGlyphRange:containerOrigin:isStrikethrough:", glyphRange.location, glyphRange.length, underlineVal, lineGlyphRange.location, lineGlyphRange.length, 0, lineRect.origin.x, lineRect.origin.y, lineRect.size.width, lineRect.size.height, containerOrigin.x, containerOrigin.y);
}

- (void)showCGGlyphs:(const CGGlyph *)glyphs positions:(const CGPoint *)positions count:(NSInteger)glyphCount font:(UIFont *)font textMatrix:(CGAffineTransform *)textMatrix attributes:(NSDictionary *)attributes inContext:(CGContextRef)CGContext
{
  __int128 v9;
  _OWORD v10[3];

  v9 = *(_OWORD *)&textMatrix->c;
  v10[0] = *(_OWORD *)&textMatrix->a;
  v10[1] = v9;
  v10[2] = *(_OWORD *)&textMatrix->tx;
  -[NSLayoutManager _showCGGlyphs:positions:count:font:textMatrix:attributes:inContext:](self, "_showCGGlyphs:positions:count:font:textMatrix:attributes:inContext:", glyphs, positions, glyphCount, font, v10, attributes, CGContext);
}

- (void)showAttachmentCell:(NSCell *)cell inRect:(NSRect)rect characterIndex:(NSUInteger)attachmentIndex
{
  double height;
  double width;
  double y;
  double x;
  void *v12;
  double v13;
  CGFloat v14;
  NSRect v15;
  NSRect v16;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  v12 = (void *)-[NSCell attachment](cell, "attachment");
  if (v12)
  {
    objc_msgSend(v12, "lineLayoutPadding");
    if (v13 != 0.0)
    {
      v14 = v13;
      v15.origin.x = x;
      v15.origin.y = y;
      v15.size.width = width;
      v15.size.height = height;
      v16 = NSInsetRect(v15, v14, 0.0);
      x = v16.origin.x;
      y = v16.origin.y;
      width = v16.size.width;
      height = v16.size.height;
    }
  }
  -[NSLayoutManager _showAttachmentCell:inRect:characterIndex:](self, "_showAttachmentCell:inRect:characterIndex:", cell, attachmentIndex, x, y, width, height);
}

- (void)coordinateAccess:(id)a3
{
  -[NSTextStorage _lockForWriting](self->_textStorage, "_lockForWriting");
  (*((void (**)(id, NSLayoutManager *))a3 + 2))(a3, self);
  -[NSTextStorage _unlock](self->_textStorage, "_unlock");
}

- (id)destinationTextContainerForRange:(_NSRange)a3 inTextContainer:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  id v9;
  id v10;
  id v11;

  length = a3.length;
  location = a3.location;
  -[NSLayoutManager delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (v8 = (void *)objc_msgSend(-[NSLayoutManager delegate](self, "delegate"), "layoutManager:destinationTextContainerForRange:inTextContainer:", self, location, length, a4)) == 0)
  {
    -[NSLayoutManager textStorage](self, "textStorage");
    v9 = objc_alloc_init((Class)objc_opt_class());
    v10 = objc_alloc_init((Class)objc_opt_class());
    objc_msgSend(v10, "setUsesFontLeading:", objc_msgSend((id)objc_msgSend(a4, "layoutManager"), "usesFontLeading"));
    objc_msgSend(v10, "setAllowsOriginalFontMetricsOverride:", objc_msgSend((id)objc_msgSend(a4, "layoutManager"), "allowsOriginalFontMetricsOverride"));
    objc_msgSend(v10, "setTypesetterBehavior:", objc_msgSend((id)objc_msgSend(a4, "layoutManager"), "typesetterBehavior"));
    v11 = objc_alloc((Class)objc_opt_class());
    objc_msgSend(a4, "size");
    v8 = (void *)objc_msgSend(v11, "initWithSize:");
    objc_msgSend(a4, "lineFragmentPadding");
    objc_msgSend(v8, "setLineFragmentPadding:");
    objc_msgSend(v8, "setExclusionPaths:", objc_msgSend(a4, "exclusionPaths"));
    objc_msgSend(v8, "setLineBreakMode:", objc_msgSend(a4, "lineBreakMode"));
    objc_msgSend(v8, "setMaximumNumberOfLines:", objc_msgSend(a4, "maximumNumberOfLines"));
    objc_msgSend(v9, "addLayoutManager:", v10);
    objc_msgSend(v10, "addTextContainer:", v8);

    objc_msgSend(v9, "replaceCharactersInRange:withAttributedString:", 0, objc_msgSend(v9, "length"), -[NSTextStorage attributedSubstringFromRange:](-[NSLayoutManager textStorage](self, "textStorage"), "attributedSubstringFromRange:", location, length));
  }
  return v8;
}

- (id)layoutFragmentsForReplacingCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4 rect:(CGRect)a5 textContainer:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  NSUInteger length;
  NSUInteger location;
  void *v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSTextContainer *v19;
  NSRange v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  double v24;
  NSUInteger v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  NSUInteger v32;
  NSUInteger v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  uint64_t v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  double v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  double v80;
  double v81;
  double v82;
  double v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  uint64_t v88;
  NSTextLayoutFragment *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat v100;
  CGFloat v101;
  CGFloat v102;
  CGFloat v103;
  CGFloat v104;
  double v105;
  double v106;
  CGFloat v107;
  double v108;
  CGFloat v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  CGFloat v125;
  CGFloat v126;
  CGFloat v127;
  uint64_t v128;
  CGFloat v129;
  CGFloat v130;
  CGFloat v131;
  CGFloat v132;
  double v133;
  double v134;
  double v135;
  CGFloat v136;
  CGFloat v137;
  CGFloat v138;
  CGFloat v139;
  CGFloat v140;
  CGFloat v141;
  CGFloat v142;
  CGFloat v143;
  uint64_t v144;
  NSTextLayoutFragment *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  double v150;
  CGFloat v151;
  double v152;
  CGFloat v153;
  double v154;
  CGFloat v155;
  double v156;
  CGFloat v157;
  CGFloat v158;
  CGFloat v159;
  CGFloat v160;
  CGFloat v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  unint64_t v171;
  uint64_t v172;
  uint64_t v173;
  double v174;
  CGFloat v175;
  double v176;
  CGFloat v177;
  double v178;
  CGFloat v179;
  double v180;
  CGFloat v181;
  void *v182;
  void *v183;
  unint64_t v184;
  double v185;
  double v186;
  double v187;
  double v188;
  CGFloat v189;
  CGFloat v190;
  CGFloat v191;
  CGFloat v192;
  double v193;
  double v194;
  double v195;
  double v196;
  _BOOL4 v197;
  _BOOL4 v198;
  BOOL v199;
  uint64_t v200;
  CGFloat v201;
  CGFloat v202;
  CGFloat v203;
  CGFloat v204;
  CGFloat v205;
  NSTextLayoutFragment *v206;
  CGFloat v208;
  CGFloat v209;
  CGFloat v210;
  double v211;
  CGFloat v212;
  uint64_t v213;
  unint64_t v214;
  double v215;
  double v216;
  double aRect;
  CGFloat aRecta;
  CGFloat aRectb;
  unint64_t v220;
  CGFloat v221;
  uint64_t v222;
  CGFloat v223;
  CGFloat v224;
  uint64_t v225;
  void *v226;
  id v227;
  unint64_t v228;
  uint64_t v229;
  unint64_t v230;
  NSRange v231;
  NSRange v232;
  NSSize v233;
  NSSize v234;
  NSPoint v235;
  NSSize v236;
  NSSize v237;
  NSSize v238;
  NSPoint v239;
  NSSize v240;
  NSRect v241;
  NSRect v242;
  NSRect v243;
  NSRect v244;
  NSRect v245;
  NSRect v246;
  NSRect v247;
  NSRect v248;
  NSRect v249;
  NSRect v250;
  NSRect v251;
  NSRect v252;
  NSRect v253;
  NSRect v254;
  NSRect v255;
  NSRect v256;
  NSRect v257;
  NSRect v258;
  NSRect v259;
  NSRect v260;
  NSRect v261;
  NSRect v262;
  NSRect v263;
  NSRect v264;
  NSRect v265;
  NSRect v266;
  NSRect v267;
  NSRect v268;
  NSRect v269;
  NSRect v270;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  length = a3.length;
  location = a3.location;
  v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (length || objc_msgSend(a4, "length"))
  {
    v16 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", location, length, 0);
    v18 = v17;
    v231.location = 0;
    v231.length = 0;
    v19 = -[NSLayoutManager textContainerForGlyphAtIndex:effectiveRange:](self, "textContainerForGlyphAtIndex:effectiveRange:", v17 + v16 - 1, &v231);
    v232.location = v16;
    v232.length = v18;
    v20 = NSIntersectionRange(v232, v231);
    if ((v20.length || objc_msgSend(a4, "length"))
      && (length || -[NSTextStorage length](-[NSLayoutManager textStorage](self, "textStorage"), "length") != location)
      && v19 == a6)
    {
      -[NSLayoutManager lineFragmentRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v20.location, 0);
      v259.origin.x = x;
      v259.origin.y = y;
      v259.size.width = width;
      v259.size.height = height;
      if (NSIntersectsRect(v241, v259)
        || (-[NSLayoutManager lineFragmentRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v20.length + v20.location - 1, 0), v260.origin.x = x, v260.origin.y = y, v260.size.width = width, v260.size.height = height, NSIntersectsRect(v242, v260)))
      {
        v21 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", v20.location, v20.length, 0);
        v222 = v22;
        v23 = (void *)-[NSTextStorage string](-[NSLayoutManager textStorage](self, "textStorage"), "string");
        v230 = 0;
        -[NSLayoutManager boundingRectForGlyphRange:inTextContainer:](self, "boundingRectForGlyphRange:inTextContainer:", v20.location, v20.length, a6);
        v25 = -[NSLayoutManager glyphRangeForBoundingRectWithoutAdditionalLayout:inTextContainer:](self, "glyphRangeForBoundingRectWithoutAdditionalLayout:inTextContainer:", a6, x, y, width, height + v24);
        v27 = v26;
        v29 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", v25, v26, 0);
        v30 = v28;
        if (v25 > v231.location)
        {
          objc_msgSend(v23, "getParagraphStart:end:contentsEnd:forRange:", &v230, 0, 0, v29, v28);
          v31 = v230;
          if (v230 == v29)
          {
            objc_msgSend(v23, "getParagraphStart:end:contentsEnd:forRange:", &v230, 0, 0, v29 - 1, 1);
            v31 = v230;
          }
          if (v31 < v29)
          {
            v30 = v29 + v30 - v31;
            v29 = v31;
          }
        }
        v32 = v231.location;
        v33 = v231.length;
        if (v231.length + v231.location > v25 + v27)
        {
          objc_msgSend(v23, "getParagraphStart:end:contentsEnd:forRange:", 0, 0, &v230, v29 + v30 - 1, 1);
          v34 = v230;
          if (v230 == v29 + v30)
          {
            objc_msgSend(v23, "getParagraphStart:end:contentsEnd:forRange:", 0, 0, &v230, v29 + v30, 1);
            v34 = v230;
          }
          if (v34 > v29 + v30)
            v30 = v34 - v29;
          v32 = v231.location;
          v33 = v231.length;
        }
        v35 = v222;
        v225 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", v32, v33, 0);
        v36 = v30 + v29;
        v37 = v30 + v29 - v225;
        v227 = -[NSLayoutManager destinationTextContainerForRange:inTextContainer:](self, "destinationTextContainerForRange:inTextContainer:", v225, v37, a6);
        v38 = (void *)objc_msgSend(v227, "layoutManager");
        v39 = (void *)objc_msgSend(v38, "textStorage");
        v214 = v37;
        v220 = v36;
        if (a4)
          objc_msgSend(v39, "replaceCharactersInRange:withAttributedString:", v21, v222, a4);
        else
          objc_msgSend(v39, "replaceCharactersInRange:withString:", v21, v222, &stru_1E260C7D0);
        objc_msgSend(v38, "ensureLayoutForTextContainer:", v227);
        v213 = objc_msgSend(a4, "length");
        v226 = v15;
        if (v21 > v29)
        {
          v40 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v29, v21 - v29, 0);
          v42 = v41;
          -[NSLayoutManager lineFragmentRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v40, 0);
          v44 = v43;
          v46 = v45;
          v48 = v47;
          v50 = v49;
          v51 = v42 + v40 - 1;
          -[NSLayoutManager lineFragmentRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v51, 0);
          v261.origin.x = v52;
          v261.origin.y = v53;
          v261.size.width = v54;
          v261.size.height = v55;
          v243.origin.x = v44;
          v243.origin.y = v46;
          v243.size.width = v48;
          v243.size.height = v50;
          v244 = NSUnionRect(v243, v261);
          v215 = v244.size.height;
          aRect = v244.origin.y;
          objc_msgSend(a6, "size", v244.origin.x);
          v211 = v56;
          -[NSLayoutManager lineFragmentUsedRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", v51, 0);
          v58 = v57;
          v60 = v59;
          v62 = v61;
          v64 = v63;
          v65 = objc_msgSend(v38, "glyphRangeForCharacterRange:actualCharacterRange:", v29 - v225, v21 - v29, 0);
          v67 = v66;
          objc_msgSend(v38, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v65, 0);
          v69 = v68;
          v71 = v70;
          v73 = v72;
          v75 = v74;
          objc_msgSend(v38, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v67 + v65 - 1, 0);
          v262.origin.x = v76;
          v262.origin.y = v77;
          v262.size.width = v78;
          v262.size.height = v79;
          v245.origin.x = v69;
          v245.origin.y = v71;
          v245.size.width = v73;
          v245.size.height = v75;
          v246 = NSUnionRect(v245, v262);
          v80 = v246.origin.y;
          v81 = v246.size.height;
          objc_msgSend(v227, "size", v246.origin.x);
          v83 = v82;
          objc_msgSend(v38, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", v67 + v65 - 1, 0);
          v263.origin.x = v84;
          v263.origin.y = v85;
          v263.size.width = v86;
          v263.size.height = v87;
          v247.origin.x = v58;
          v247.origin.y = v60;
          v247.size.width = v62;
          v247.size.height = v64;
          v88 = !NSEqualRects(v247, v263);
          v233.width = v211;
          v233.height = v215;
          v237.width = v83;
          v237.height = v81;
          if (!NSEqualSizes(v233, v237))
            v88 |= 4uLL;
          v89 = -[NSTextLayoutFragment initWithLayoutManager:characterRange:animationType:boundingRect:]([NSTextLayoutFragment alloc], "initWithLayoutManager:characterRange:animationType:boundingRect:", self, v29, v21 - v29, v88, 0.0, aRect, v211, v215);
          if ((-[NSTextLayoutFragment animationType](v89, "animationType") & 1) != 0)
          {
            -[NSTextLayoutFragment setDestinationTextStorage:](v89, "setDestinationTextStorage:", objc_msgSend(v38, "textStorage"));
            -[NSTextLayoutFragment setDestinationLayoutManager:](v89, "setDestinationLayoutManager:", v38);
            -[NSTextLayoutFragment setDestinationGlyphRange:](v89, "setDestinationGlyphRange:", v65, v67);
            -[NSTextLayoutFragment setDestinationVerticalDelta:](v89, "setDestinationVerticalDelta:", -v80);
            -[NSTextLayoutFragment setDestinationBoundingRect:](v89, "setDestinationBoundingRect:", 0.0, v80, v83, v81);
          }
          objc_msgSend(v226, "addObject:", v89);

          v35 = v222;
        }
        v90 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v21, v35, 0);
        v92 = v91;
        -[NSLayoutManager lineFragmentRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v90, 0);
        v97 = v96;
        if (v92)
        {
          v98 = v93;
          v99 = v94;
          v100 = v95;
          -[NSLayoutManager lineFragmentRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v92 + v90 - 1, 0);
          v264.origin.x = v101;
          v264.origin.y = v102;
          v264.size.width = v103;
          v264.size.height = v104;
          v248.origin.x = v98;
          v248.origin.y = v97;
          v248.size.width = v99;
          v248.size.height = v100;
          v249 = NSUnionRect(v248, v264);
          v97 = v249.origin.y;
          v105 = v249.size.height;
          -[NSLayoutManager lineFragmentUsedRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", v92 + v90 - 1, 0, v249.origin.x);
          v107 = v106;
          v109 = v108;
          v223 = v110;
          aRecta = v111;
          objc_msgSend(a6, "size");
          v216 = v112;
        }
        else
        {
          v105 = *(double *)(MEMORY[0x1E0CB3440] + 8);
          v216 = *MEMORY[0x1E0CB3440];
          v107 = *MEMORY[0x1E0CB3438];
          v109 = *(double *)(MEMORY[0x1E0CB3438] + 8);
          v223 = *(double *)(MEMORY[0x1E0CB3438] + 16);
          aRecta = *(double *)(MEMORY[0x1E0CB3438] + 24);
        }
        -[NSLayoutManager lineFragmentUsedRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", v90, 0);
        v210 = v114;
        v212 = v113;
        v208 = v116;
        v209 = v115;
        v117 = objc_msgSend(v38, "glyphRangeForCharacterRange:actualCharacterRange:", v21 - v225, objc_msgSend(a4, "length"), 0);
        v119 = v118;
        objc_msgSend(v38, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v117, 0);
        v124 = v123;
        if (v119)
        {
          v125 = v120;
          v126 = v121;
          v127 = v122;
          v128 = v119 + v117 - 1;
          objc_msgSend(v38, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v128, 0);
          v265.origin.x = v129;
          v265.origin.y = v130;
          v265.size.width = v131;
          v265.size.height = v132;
          v250.origin.x = v125;
          v250.origin.y = v124;
          v250.size.width = v126;
          v250.size.height = v127;
          v251 = NSUnionRect(v250, v265);
          v124 = v251.origin.y;
          v133 = v251.size.height;
          objc_msgSend(v227, "size", v251.origin.x);
          v135 = v134;
        }
        else
        {
          v135 = *MEMORY[0x1E0CB3440];
          v133 = *(double *)(MEMORY[0x1E0CB3440] + 8);
          v128 = v117 - 1;
        }
        objc_msgSend(v38, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", v128, 0);
        v266.origin.x = v136;
        v266.origin.y = v137;
        v266.size.width = v138;
        v266.size.height = v139;
        v252.origin.x = v107;
        v252.origin.y = v109;
        v252.size.width = v223;
        v252.size.height = aRecta;
        if (!NSEqualRects(v252, v266))
          goto LABEL_38;
        objc_msgSend(v38, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", v117, 0);
        v267.origin.x = v140;
        v267.origin.y = v141;
        v267.size.width = v142;
        v267.size.height = v143;
        v253.origin.y = v210;
        v253.origin.x = v212;
        v253.size.height = v208;
        v253.size.width = v209;
        v144 = 0;
        if (!NSEqualRects(v253, v267))
LABEL_38:
          v144 = 1;
        v234.width = v216;
        v234.height = v105;
        v238.width = v135;
        v238.height = v133;
        if (!NSEqualSizes(v234, v238))
          v144 |= 4uLL;
        v145 = -[NSTextLayoutFragment initWithLayoutManager:characterRange:animationType:boundingRect:]([NSTextLayoutFragment alloc], "initWithLayoutManager:characterRange:animationType:boundingRect:", self, v21, v35, v144, 0.0, v97, v216, v105);
        if ((-[NSTextLayoutFragment animationType](v145, "animationType") & 1) != 0)
        {
          -[NSTextLayoutFragment setDestinationTextStorage:](v145, "setDestinationTextStorage:", objc_msgSend(v38, "textStorage"));
          -[NSTextLayoutFragment setDestinationLayoutManager:](v145, "setDestinationLayoutManager:", v38);
          -[NSTextLayoutFragment setDestinationGlyphRange:](v145, "setDestinationGlyphRange:", v117, v119);
          -[NSTextLayoutFragment setDestinationVerticalDelta:](v145, "setDestinationVerticalDelta:", -v124);
          -[NSTextLayoutFragment setDestinationBoundingRect:](v145, "setDestinationBoundingRect:", 0.0, v124, v135, v133);
        }
        v15 = v226;
        objc_msgSend(v226, "addObject:", v145);

        v146 = v220 - (v21 + v35);
        if (v220 != v21 + v35)
        {
          v228 = 0;
          v229 = 0;
          v147 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v21 + v35, v220 - (v21 + v35), 0);
          v149 = v148;
          -[NSLayoutManager lineFragmentRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v147, 0);
          v151 = v150;
          v153 = v152;
          v155 = v154;
          v157 = v156;
          -[NSLayoutManager lineFragmentRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v149 + v147 - 1, 0);
          v268.origin.x = v158;
          v268.origin.y = v159;
          v268.size.width = v160;
          v268.size.height = v161;
          v254.origin.x = v151;
          v254.origin.y = v153;
          v254.size.width = v155;
          v254.size.height = v157;
          v255 = NSUnionRect(v254, v268);
          v162 = v255.origin.y;
          v163 = v255.size.height;
          objc_msgSend(a6, "size", v255.origin.x);
          v165 = v164;
          -[NSLayoutManager lineFragmentUsedRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", v147, 0);
          v221 = v167;
          v224 = v166;
          v169 = v168;
          aRectb = v170;
          v230 = objc_msgSend(a4, "length") + v21;
          v171 = objc_msgSend(v38, "glyphRangeForCharacterRange:actualCharacterRange:", v230 - v225, v225 - v35 + v213 + v214 - v230, 0);
          v173 = v172;
          objc_msgSend(v38, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v171, &v228);
          v175 = v174;
          v177 = v176;
          v179 = v178;
          v181 = v180;
          if (v228 < v171)
          {
            v182 = (void *)objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
            v183 = (void *)objc_msgSend((id)objc_msgSend(v38, "textStorage"), "string");
            if (objc_msgSend(v182, "longCharacterIsMember:", objc_msgSend(v183, "characterAtIndex:", v230 - v225)))
            {
              v184 = v171 + v173;
              v171 = v229 + v228;
              v173 = v184 - (v229 + v228);
              objc_msgSend(v38, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v229 + v228, 0);
              v175 = v185;
              v177 = v186;
              v179 = v187;
              v181 = v188;
            }
          }
          objc_msgSend(v38, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v173 + v171 - 1, 0);
          v269.origin.x = v189;
          v269.origin.y = v190;
          v269.size.width = v191;
          v269.size.height = v192;
          v256.origin.x = v175;
          v256.origin.y = v177;
          v256.size.width = v179;
          v256.size.height = v181;
          v257 = NSUnionRect(v256, v269);
          v193 = v257.origin.y;
          v194 = v257.size.height;
          objc_msgSend(v227, "size", v257.origin.x);
          v196 = v195;
          v235.x = 0.0;
          v239.x = 0.0;
          v235.y = v162;
          v239.y = v193;
          v197 = NSEqualPoints(v235, v239);
          v236.width = v165;
          v236.height = v163;
          v240.width = v196;
          v240.height = v194;
          v198 = NSEqualSizes(v236, v240);
          v199 = !v197;
          if (v197)
            v200 = 0;
          else
            v200 = 2;
          if (v199)
            v201 = v193;
          else
            v201 = v169;
          objc_msgSend(v38, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", v171, 0);
          v270.origin.x = v202;
          v270.origin.y = v203;
          v270.size.width = v204;
          v270.size.height = v205;
          v258.size.width = v221;
          v258.origin.x = v224;
          v258.origin.y = v201;
          v258.size.height = aRectb;
          v206 = -[NSTextLayoutFragment initWithLayoutManager:characterRange:animationType:boundingRect:]([NSTextLayoutFragment alloc], "initWithLayoutManager:characterRange:animationType:boundingRect:", self, v21 + v35, v146, v200 | (!NSEqualRects(v258, v270) || !v198), 0.0, v162, v165, v163);
          if (-[NSTextLayoutFragment animationType](v206, "animationType"))
            -[NSTextLayoutFragment setDestinationBoundingRect:](v206, "setDestinationBoundingRect:", 0.0, v193, v196, v194);
          v15 = v226;
          if ((-[NSTextLayoutFragment animationType](v206, "animationType") & 1) != 0)
          {
            -[NSTextLayoutFragment setDestinationTextStorage:](v206, "setDestinationTextStorage:", objc_msgSend(v38, "textStorage"));
            -[NSTextLayoutFragment setDestinationLayoutManager:](v206, "setDestinationLayoutManager:", v38);
            -[NSTextLayoutFragment setDestinationGlyphRange:](v206, "setDestinationGlyphRange:", v171, v173);
            -[NSTextLayoutFragment setDestinationVerticalDelta:](v206, "setDestinationVerticalDelta:", -v193);
          }
          objc_msgSend(v226, "addObject:", v206);

        }
      }
    }
  }
  return v15;
}

@end
