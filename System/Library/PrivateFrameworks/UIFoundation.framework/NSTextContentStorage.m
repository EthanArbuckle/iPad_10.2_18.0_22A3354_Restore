@implementation NSTextContentStorage

uint64_t __55__NSTextContentStorage__supportsTextAttributesInRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    result = objc_msgSend((id)objc_msgSend(a2, "textBlocks"), "count");
    if (result)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a5 = 1;
    }
  }
  return result;
}

- (id)enumerateTextElementsFromLocation:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  NSTextStorage *textStorage;
  NSCountableTextLocation *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  BOOL v17;
  unint64_t v18;
  uint64_t v19;
  $A622375D3863639446C6735D77F52D30 *activeEnumerationCache;
  char *v21;
  unint64_t v22;
  NSTextParagraph *v23;
  uint64_t v24;
  NSUInteger location;
  NSUInteger v26;
  BOOL v27;
  NSRunStorage *indexTable;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  objc_class *v32;
  NSString *v33;
  NSCountableTextLocation *v34;
  NSUInteger v35;
  NSUInteger v36;
  char isKindOfClass;
  NSRunStorage *v38;
  unint64_t v39;
  unint64_t v40;
  NSAttributedString *v41;
  id v42;
  char v43;
  char v44;
  NSUInteger v45;
  uint64_t v46;
  NSTextParagraph *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSString *v51;
  NSUInteger v52;
  NSRange v53;
  NSRange v54;
  NSUInteger length;
  NSUInteger v56;
  id v57;
  unint64_t v58;
  char *v60;
  BOOL v61;
  NSUInteger v62;
  id v63;
  NSUInteger v64;
  id v65;
  _BOOL4 v66;
  uint64_t v67;
  NSTextParagraph *v68;
  NSUInteger v69;
  _BOOL4 v70;
  NSCountableTextRange *v71;
  uint64_t v72;
  BOOL v73;
  unint64_t v74;
  NSUInteger v75;
  NSCountableTextRange *v76;
  NSCountableTextRange *v77;
  _BOOL8 v78;
  uint64_t v79;
  NSRange v80;
  uint64_t v81;
  uint64_t v82;
  NSArray *v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSTextParagraph *v88;
  unint64_t v89;
  NSTextParagraph *v90;
  void *v91;
  id v92;
  NSTextElement *v93;
  void *v94;
  NSTextParagraph *v95;
  NSTextParagraph *v96;
  uint64_t v97;
  id v98;
  NSUInteger v99;
  unint64_t v100;
  __n128 *v101;
  uint64_t v102;
  NSTextParagraph *NextElement;
  _BOOL4 v105;
  NSTextRange *v106;
  NSTextRange *v107;
  id v108;
  void *v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  int v115;
  uint64_t v116;
  uint64_t v117;
  unsigned int v119;
  BOOL v120;
  char v121;
  NSUInteger v122;
  $A622375D3863639446C6735D77F52D30 *v123;
  unint64_t v124;
  unint64_t v125;
  uint64_t v126;
  uint64_t v128;
  NSUInteger range1;
  NSCountableTextLocation *range1a;
  char v131;
  uint64_t v132;
  unint64_t v133;
  unint64_t v134;
  __int128 v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  _OWORD v139[33];
  _BYTE v140[24];
  unint64_t v141;
  uint64_t v142;
  BOOL v143;
  unsigned __int8 v144;
  NSUInteger v145;
  NSUInteger v146;
  _QWORD v147[2];
  NSRange range2;
  NSUInteger v149;
  NSUInteger v150;
  NSUInteger v151;
  __n128 v152[64];
  uint64_t v153;
  NSRange v154;
  NSRange v155;

  v153 = *MEMORY[0x1E0C80C00];
  textStorage = self->_textStorage;
  if (!textStorage)
    textStorage = (NSTextStorage *)self->_attributedString;
  v10 = (NSCountableTextLocation *)-[NSTextStorage length](textStorage, "length");
  if (!a3)
    a3 = -[NSTextRange location](-[NSTextContentStorage documentRange](self, "documentRange"), "location");
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (v11 = (void *)objc_msgSend(a3, "type"),
        (objc_msgSend(v11, "isEqualToString:", NSTextLocationTypeCountable) & 1) == 0))
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v14 = objc_opt_class();
    objc_msgSend(v12, "raise:format:", v13, CFSTR("-[%@ %@] received NSTextLocation unrecognized %@."), v14, NSStringFromSelector(a2), a3);
  }
  objc_sync_enter(self);
  if (!v10)
    goto LABEL_209;
  v15 = objc_msgSend(a3, "characterIndex");
  if ((a4 & 1) != 0)
    v16 = -1;
  else
    v16 = 0;
  v132 = v16;
  -[NSTextContentStorage delegate](self, "delegate");
  v131 = objc_opt_respondsToSelector();
  v17 = (a4 & 1) == 0;
  memset(v139, 0, 512);
  v18 = -[NSTextContentManager maximumNumberOfUncachedElements](self, "maximumNumberOfUncachedElements");
  v134 = a4;
  bzero(v139, 0x248uLL);
  *(int64x2_t *)v140 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  if (v18)
    v19 = v18;
  else
    v19 = -1;
  *((_QWORD *)&v139[0] + 1) = 0x7FFFFFFFFFFFFFFFLL;
  v141 = v19;
  v142 = 0x7FFFFFFFFFFFFFFFLL;
  v144 = 1;
  activeEnumerationCache = self->_activeEnumerationCache;
  v143 = (a4 & 1) == 0;
  v135 = 0u;
  v136 = 0;
  v137 = 0x7FFFFFFFFFFFFFFFLL;
  v138 = v17;
  v123 = activeEnumerationCache;
  if (activeEnumerationCache)
    __NSTextContentStorageFlushUncachedTextElements((NSUInteger)self, (uint64_t)activeEnumerationCache, 1);
  self->_activeEnumerationCache = ($A622375D3863639446C6735D77F52D30 *)v139;
  v21 = (char *)v10 + self->_modifiedDocumentLengthDelta;
  if (v15 >= (unint64_t)v21)
    v22 = (unint64_t)v10 + self->_modifiedDocumentLengthDelta;
  else
    v22 = v15;
  if ((v134 & 1) != 0)
    v21 = 0;
  v125 = (unint64_t)v21;
  if ((char *)v22 == v21)
    goto LABEL_206;
  v120 = v17;
  v126 = 0;
  v23 = 0;
  v124 = 0;
  v24 = 1;
  if ((v134 & 1) != 0)
    v24 = -1;
  v128 = v24;
  v133 = 0x7FFFFFFFFFFFFFFFLL;
  while (2)
  {
    v22 += v132;
    if (v23)
      goto LABEL_170;
    v152[0] = 0uLL;
    location = self->_cachedRange.location;
    v27 = v22 >= location;
    v26 = v22 - location;
    v27 = !v27 || v26 >= self->_cachedRange.length;
    if (!v27)
    {
      indexTable = self->_indexTable;
      _NSBlockNumberForIndex(indexTable, v22, v152);
      v30 = indexTable->_gapBlockIndex <= v29 ? indexTable->_maxBlocks - indexTable->_numBlocks : 0;
      v31 = *(_QWORD *)&indexTable->_runs->var1[(indexTable->_elementSize + 8) * (v30 + v29)];
      if (v31 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (__NSTextContentStorageFlushUncachedTextElements((NSUInteger)self, (uint64_t)v139, 1))
        {
          v38 = self->_indexTable;
          _NSBlockNumberForIndex(v38, v22, v152);
          if (v38->_gapBlockIndex <= v39)
            v40 = v38->_maxBlocks - v38->_numBlocks;
          else
            v40 = 0;
          v31 = *(_QWORD *)&v38->_runs->var1[(v38->_elementSize + 8) * (v40 + v39)];
        }
        v58 = *((_QWORD *)&v139[0] + 1);
        if (v31 < *((_QWORD *)&v139[0] + 1) || v31 - *((_QWORD *)&v139[0] + 1) >= *(_QWORD *)&v139[1])
        {
          v60 = -[NSStorage pointerToElement:directlyAccessibleElements:](self->_elements, "pointerToElement:directlyAccessibleElements:", v31, (char *)v139 + 8);
          *(_QWORD *)&v139[0] = v60;
          v58 = v31;
          if (*((_QWORD *)&v139[0] + 1) != v31)
          {
            v60 += 8 * (*((_QWORD *)&v139[0] + 1) - v31);
            *(_QWORD *)&v139[0] = v60;
            v58 = *((_QWORD *)&v139[0] + 1);
          }
        }
        else
        {
          v60 = *(char **)&v139[0];
        }
        v23 = *(NSTextParagraph **)&v60[8 * (v31 - v58)];
        v142 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_139;
      }
    }
    if (v124 >= v141)
    {
      v23 = 0;
      goto LABEL_139;
    }
    v151 = 0;
    v150 = 0;
    v149 = 0;
    v32 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v32);
    _UIFoundationAssert(self, v33, -[NSTextStorage editedMask](self->_textStorage, "editedMask") == 0, &__block_literal_global_291);
    -[NSString getParagraphStart:end:contentsEnd:forRange:](-[NSAttributedString string](-[NSTextContentStorage attributedString](self, "attributedString"), "string"), "getParagraphStart:end:contentsEnd:forRange:", &v151, &v150, &v149, __NSTextContentStorageQueryDocumentLocationDeltaForLocation((uint64_t)self, v22, (uint64_t)v139) + v22, 1);
    -[NSTextContentStorage delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v34 = -[NSCountableTextLocation initWithIndex:]([NSCountableTextLocation alloc], "initWithIndex:", v22);
      v23 = (NSTextParagraph *)(id)objc_msgSend(-[NSTextContentStorage delegate](self, "delegate"), "textContentManager:textElementAtLocation:", self, v34);

      v35 = v151;
      v36 = v150;
      range1 = v150 - v151;
      if (v23)
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v121 = isKindOfClass ^ 1;
        v119 = 1;
        goto LABEL_117;
      }
    }
    else
    {
      v35 = v151;
      v36 = v150;
      range1 = v150 - v151;
    }
    v41 = -[NSTextContentStorage attributedString](self, "attributedString");
    range2.length = 0;
    range2.location = 0;
    v42 = -[NSAttributedString attribute:atIndex:longestEffectiveRange:inRange:](v41, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSAttachment"), v22, &range2, v35, range1);
    v43 = v42 != 0;
    -[NSTextContentStorage delegate](self, "delegate");
    v44 = objc_opt_respondsToSelector();
    if (v42 && objc_msgSend(v42, "embeddingType") == 1)
    {
      v45 = v150 - v22;
      if (v22 + 1 == v149)
        v46 = v150 - v22;
      else
        v46 = 1;
      range1 = v46;
      if ((v44 & 1) != 0
        && (v23 = (NSTextParagraph *)(id)objc_msgSend(-[NSTextContentStorage delegate](self, "delegate"), "textContentStorage:textParagraphWithRange:", self, v22, v46)) != 0|| (v47 = -[NSTextParagraph initWithTextAttachment:attributes:]([NSTextParagraph alloc], "initWithTextAttachment:attributes:", v42, -[NSAttributedString attributesAtIndex:effectiveRange:](v41, "attributesAtIndex:effectiveRange:", v22, 0)), v23 = v47, range1 < 2))
      {
        v121 = 1;
        v52 = v22;
      }
      else
      {
        v48 = (void *)-[NSAttributedString mutableCopy](-[NSTextParagraph attributedString](v47, "attributedString"), "mutableCopy");
        v49 = (void *)objc_msgSend(v48, "mutableString");
        v50 = objc_msgSend(v48, "length");
        v51 = -[NSAttributedString string](v41, "string");
        objc_msgSend(v49, "replaceCharactersInRange:withString:", v50, 0, -[NSString substringWithRange:](v51, "substringWithRange:", v149, v150 - v149));
        -[NSTextParagraph setAttributedString:](v23, "setAttributedString:", v48);

        v121 = 1;
        v52 = v22;
        range1 = v45;
      }
      v43 = 1;
      goto LABEL_115;
    }
    v53 = range2;
    if (range2.location == v35 && range2.length == range1)
    {
      v52 = v35;
      if ((v44 & 1) != 0)
        goto LABEL_100;
LABEL_101:
      v147[1] = 0;
      v147[0] = 0;
      if (objc_msgSend((id)objc_opt_class(), "_usesTextListElements"))
        v65 = -[NSAttributedString attribute:atIndex:longestEffectiveRange:inRange:](v41, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSParagraphStyle"), v52, v147, v52, range1);
      else
        v65 = 0;
      if (!objc_msgSend((id)objc_msgSend(v65, "textLists"), "count")
        || (v146 = 0,
            v145 = 0,
            (v23 = (NSTextParagraph *)+[NSTextListElement _rootTextListElementFromAttributedString:atIndex:options:effectiveRange:textListElementInstantiationCallback:](NSTextListElement, "_rootTextListElementFromAttributedString:atIndex:options:effectiveRange:textListElementInstantiationCallback:", v41, v52, -[NSTextContentStorage includesTextListMarkers](self, "includesTextListMarkers"), &v145, &__block_literal_global_300)) == 0))
      {
        if (-[NSTextContentStorage copiesContentsInTextParagraphs](self, "copiesContentsInTextParagraphs"))
        {
          if (-[NSTextStorage _isSwiftAttributedString](-[NSTextContentStorage textStorage](self, "textStorage"), "_isSwiftAttributedString"))
          {
            v67 = -[NSTextStorage _nsAttributedSubstringFromRange:](-[NSTextContentStorage textStorage](self, "textStorage"), "_nsAttributedSubstringFromRange:", v52, range1);
          }
          else
          {
            v67 = -[NSAttributedString attributedSubstringFromRange:](v41, "attributedSubstringFromRange:", v52, range1);
          }
          v68 = -[NSTextParagraph initWithAttributedString:]([NSTextParagraph alloc], "initWithAttributedString:", v67);
        }
        else
        {
          v68 = -[NSTextParagraph initWithAttributedString:range:]([NSTextParagraph alloc], "initWithAttributedString:range:", v41, v52, range1);
        }
        v23 = v68;
        goto LABEL_114;
      }
      v121 = 0;
      v52 = v145;
      range1 = v146;
      v149 = v146 + v145;
      v66 = 1;
      goto LABEL_116;
    }
    v154.location = v35;
    v154.length = range1;
    v54 = NSIntersectionRange(v154, v53);
    v52 = v54.location;
    length = v54.length;
    v56 = range2.location;
    if (v35 >= range2.location || !v144 && v143)
      goto LABEL_87;
    length = v54.location + v54.length - v35;
    while (1)
    {
      v57 = -[NSAttributedString attribute:atIndex:longestEffectiveRange:inRange:](v41, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSAttachment"), v56 - 1, &range2, v35, v56 - v35);
      if (v57)
        break;
LABEL_64:
      v56 = range2.location;
      if (v35 >= range2.location)
      {
        v43 &= 1u;
        v52 = v35;
        goto LABEL_87;
      }
    }
    if (objc_msgSend(v57, "embeddingType") != 1)
    {
      v43 = 1;
      goto LABEL_64;
    }
    v61 = range2.length + range2.location < v36 && range2.length + range2.location == v149;
    v43 = 1;
    if (v61)
      length = v36 - range2.location;
    else
      length = v54.location + v54.length - (range2.length + range2.location);
    if (v61)
      v52 = range2.location;
    else
      v52 = range2.length + range2.location;
LABEL_87:
    range2.location = v52;
    range2.length = length;
    v62 = v52 + length;
    if (v52 + length >= v36 || !(v144 | v143))
      goto LABEL_96;
    length = v36 - v52;
    while (2)
    {
      v63 = -[NSAttributedString attribute:atIndex:longestEffectiveRange:inRange:](v41, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSAttachment"), v62, &range2, v62, v36 - v62);
      if (!v63)
      {
LABEL_93:
        v62 = range2.length + range2.location;
        if (range2.length + range2.location >= v36)
          goto LABEL_96;
        continue;
      }
      break;
    }
    if (objc_msgSend(v63, "embeddingType") != 1)
    {
      v43 = 1;
      goto LABEL_93;
    }
    length = range2.location - v52;
    v43 = 1;
LABEL_96:
    if (length + v52 == v149)
      v64 = v150 - v52;
    else
      v64 = length;
    range1 = v64;
    if ((v44 & 1) == 0)
      goto LABEL_101;
LABEL_100:
    v23 = (NSTextParagraph *)(id)objc_msgSend(-[NSTextContentStorage delegate](self, "delegate"), "textContentStorage:textParagraphWithRange:", self, v52, range1);
    if (!v23)
      goto LABEL_101;
LABEL_114:
    v121 = 0;
LABEL_115:
    -[NSTextParagraph _setContainsTextAttachments:](v23, "_setContainsTextAttachments:", v43 & 1);
    v66 = v52 == v151;
LABEL_116:
    v119 = v66;
    isKindOfClass = 1;
    v35 = v52;
LABEL_117:
    v69 = v149;
    v70 = v143;
    v71 = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", v35, range1);
    -[NSTextElement setTextContentManager:](v23, "setTextContentManager:", self);
    -[NSTextParagraph setElementRange:](v23, "setElementRange:", v71);

    v72 = (v121 & 1) == 0;
    if ((isKindOfClass & 1) != 0)
    {
      v73 = v69 - v35 < range1 && v69 >= v35;
      v74 = v35 + range1;
      if (v73)
        v75 = v69;
      else
        v75 = v35 + range1;
      v76 = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", v35, v75 - v35);
      -[NSTextParagraph setParagraphContentRange:](v23, "setParagraphContentRange:", v76);

      v77 = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", v75, v74 - v75);
      -[NSTextParagraph setParagraphSeparatorRange:](v23, "setParagraphSeparatorRange:", v77);

      if ((v121 & 1) == 0)
        v72 = -[NSTextElement coalescingType](v23, "coalescingType");
      -[NSTextParagraph setIsBeginningOfParagraph:](v23, "setIsBeginningOfParagraph:", v119);
      v78 = v74 > v75
         || v74 >= -[NSAttributedString length](-[NSTextContentStorage attributedString](self, "attributedString"), "length");
      -[NSTextParagraph setIsEndOfParagraph:](v23, "setIsEndOfParagraph:", v78);
    }
    __NSTextContentStorageFlushUncachedTextElements((NSUInteger)self, (uint64_t)v139, 0);
    if (*(_QWORD *)v140 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v79 = 63;
      if (v70)
        v79 = 0;
      *(_QWORD *)v140 = v79;
    }
    else
    {
      v155.location = v35;
      v155.length = range1;
      v80 = NSUnionRange(*(NSRange *)&v140[8], v155);
      range1 = v80.length;
      v35 = v80.location;
    }
    *(_QWORD *)&v140[8] = v35;
    *(_QWORD *)&v140[16] = range1;
    -[NSTextElement setCoalescingType:](v23, "setCoalescingType:", v72);
    *((_QWORD *)&v139[1] + *(_QWORD *)v140 + 1) = v23;
    if (v70)
      v81 = *(_QWORD *)v140 + 1;
    else
      v81 = *(_QWORD *)v140 - 1;
    *(_QWORD *)v140 = v81;
    ++v124;
LABEL_139:
    if (-[NSArray count](-[NSTextElement childElements](v23, "childElements"), "count"))
    {
      v133 = -[NSTextRange range](-[NSTextElement elementRange](v23, "elementRange"), "range");
      v126 = v82;
      v83 = -[NSTextElement childElements](v23, "childElements");
      WORD2(v147[0]) = 0;
      LODWORD(v147[0]) = 0;
      if (-[NSArray count](v83, "count"))
      {
        v84 = -[NSTextRange range](-[NSTextElement elementRange](v23, "elementRange"), "range");
        v86 = v85;
        if ((v134 & 1) != 0)
          v87 = -[NSArray count](v83, "count") - 1;
        else
          v87 = 0;
        v91 = 0;
        if (v84 >= v22 || v84 + v86 <= v22)
        {
          v90 = v23;
        }
        else
        {
          v122 = v87;
          range2.location = 0;
          range1a = -[NSCountableTextLocation initWithIndex:]([NSCountableTextLocation alloc], "initWithIndex:", v22);
          v92 = -[NSTextElement childTextElementForLocation:elementIndex:](v23, "childTextElementForLocation:elementIndex:", range1a, &range2);
          if (v92)
          {
            v90 = (NSTextParagraph *)objc_msgSend(v92, "parentElement");
            v83 = -[NSTextElement childElements](v90, "childElements");
            v122 = range2.location;
            v93 = -[NSTextElement parentElement](v90, "parentElement");
            v94 = 0;
            if (v93)
            {
              v95 = v90;
              do
              {
                v96 = (NSTextParagraph *)v93;
                v97 = -[NSArray indexOfObject:](-[NSTextElement childElements](v93, "childElements"), "indexOfObject:", v95)+ v128;
                if (v94)
                {
                  objc_msgSend(v94, "insertObject:atIndex:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v97), 0);
                }
                else
                {
                  v98 = objc_alloc(MEMORY[0x1E0C99DE8]);
                  v94 = (void *)objc_msgSend(v98, "initWithObjects:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v97), 0);
                }
                v93 = -[NSTextElement parentElement](v96, "parentElement");
                v95 = v96;
              }
              while (v93);
            }
            v99 = objc_msgSend(v94, "count");
            v100 = v99;
            if (v99)
            {
              if (v99 < 0x81)
                v101 = v152;
              else
                v101 = (__n128 *)NSZoneCalloc(0, v99, 8uLL);
              v102 = 0;
              do
              {
                v101->n128_u64[v102] = objc_msgSend((id)objc_msgSend(v94, "objectAtIndexedSubscript:", v102), "integerValue");
                ++v102;
              }
              while (v100 != v102);
              v91 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B0]), "initWithIndexes:length:", v101, v100);
              if (v100 > 0x80)
                NSZoneFree(0, v101);
            }
            else
            {
              v91 = 0;
            }

          }
          else
          {
            v91 = 0;
            v90 = v23;
          }

          v87 = v122;
        }
      }
      else
      {
        v90 = 0;
        v83 = 0;
        v91 = 0;
        v87 = 0x7FFFFFFFFFFFFFFFLL;
      }
      *(_QWORD *)&v135 = v90;
      *((_QWORD *)&v135 + 1) = v83;
      v136 = v91;
      v137 = v87;
      LOWORD(v138) = v120;
      *(_DWORD *)((char *)&v138 + 2) = v147[0];
      HIWORD(v138) = WORD2(v147[0]);
      if (!v23)
        goto LABEL_206;
LABEL_170:
      while (1)
      {
        NextElement = (NSTextParagraph *)__NSTextContentStorageChildElementsEnumerationCacheGetNextElement((uint64_t)&v135);
        v88 = NextElement;
        if (!v144 || NextElement == 0)
          break;
        v105 = v143;
        v106 = -[NSTextElement elementRange](NextElement, "elementRange");
        v107 = v106;
        if (v105)
        {
          if (!-[NSTextRange containsLocation:](v106, "containsLocation:", a3))
            continue;
        }
        else if (objc_msgSend(-[NSTextRange location](v106, "location"), "compare:", a3) != -1
               || objc_msgSend(a3, "compare:", -[NSTextRange endLocation](v107, "endLocation")) == 1)
        {
          continue;
        }
        if (v143)
        {
          v108 = -[NSArray firstObject](-[NSTextElement childElements](v88, "childElements"), "firstObject");
          v109 = v108;
          if (v108)
          {
            if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v108, "elementRange"), "location"), "isEqual:", -[NSTextRange location](-[NSTextElement elementRange](v88, "elementRange"), "location")) & 1) == 0&& objc_msgSend(a3, "compare:", objc_msgSend((id)objc_msgSend(v109, "elementRange"), "location")) != -1)
            {
              continue;
            }
          }
        }
        goto LABEL_185;
      }
      if (!NextElement)
        goto LABEL_206;
LABEL_185:
      v110 = -[NSTextRange range](-[NSTextElement elementRange](v88, "elementRange"), "range");
      v89 = v134;
      if ((v134 & 1) != 0 && v110 <= v133)
      {
        if ((NSTextParagraph *)-[NSTextElement parentElement](v88, "parentElement") == v23)
          goto LABEL_188;
      }
      else if ((v134 & 1) == 0
             && v110 + v111 >= v126 + v133
             && !-[NSTextElement _firstRepresentableChildElement](v88, "_firstRepresentableChildElement"))
      {
LABEL_188:

        v126 = 0;
        v23 = 0;
        v136 = 0;
        v133 = 0x7FFFFFFFFFFFFFFFLL;
      }
LABEL_192:
      v112 = -[NSTextRange range](-[NSTextElement elementRange](v88, "elementRange"), "range");
      v114 = v113;
      if ((v131 & 1) != 0
        && (objc_msgSend(-[NSTextContentStorage delegate](self, "delegate"), "textContentManager:shouldEnumerateTextElement:options:", self, v88, v89) & 1) == 0)
      {
        if ((v89 & 1) != 0)
          v117 = 0;
        else
          v117 = v114;
        v22 = v117 + v112;
      }
      else
      {
        v115 = (*((uint64_t (**)(id, NSTextParagraph *))a5 + 2))(a5, v88);
        if ((v89 & 1) != 0)
          v116 = 0;
        else
          v116 = v114;
        v22 = v116 + v112;
        if (!v115)
          goto LABEL_206;
      }
      v144 = 0;
      if (!v23 && v22 == v125)
      {
        v22 = v125;
        goto LABEL_206;
      }
      continue;
    }
    break;
  }
  if (v23)
  {
    v88 = v23;
    v23 = 0;
    v89 = v134;
    goto LABEL_192;
  }
LABEL_206:
  v10 = -[NSCountableTextLocation initWithIndex:]([NSCountableTextLocation alloc], "initWithIndex:", v22);
  __NSTextContentStorageFlushUncachedTextElements((NSUInteger)self, (uint64_t)v139, 1);
  self->_activeEnumerationCache = v123;
  if (v123)
    v123->var1 = (_NSRange)xmmword_18D6CBB80;

LABEL_209:
  objc_sync_exit(self);
  return v10;
}

- (BOOL)_supportsTextAttributesInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSTextStorage *v6;
  NSAttributedString *v7;
  uint64_t v8;
  NSRange v9;
  BOOL v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  NSRange v17;
  NSRange v18;

  length = a3.length;
  location = a3.location;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v6 = -[NSTextContentStorage textStorage](self, "textStorage");
  v7 = -[NSTextContentStorage attributedString](self, "attributedString");
  v8 = -[NSTextStorage ensuresFixingAttributes](v6, "ensuresFixingAttributes");
  if ((_DWORD)v8)
    -[NSTextStorage setEnsuresFixingAttributes:](v6, "setEnsuresFixingAttributes:", 0);
  v17.length = -[NSAttributedString length](v7, "length");
  v17.location = 0;
  v18.location = location;
  v18.length = length;
  v9 = NSIntersectionRange(v17, v18);
  if (v9.length)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55__NSTextContentStorage__supportsTextAttributesInRange___block_invoke;
    v12[3] = &unk_1E2604428;
    v12[4] = &v13;
    -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](v7, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSParagraphStyle"), v9.location, v9.length, 0x100000, v12);
  }
  -[NSTextStorage setEnsuresFixingAttributes:](v6, "setEnsuresFixingAttributes:", v8);
  v10 = *((_BYTE *)v14 + 24) == 0;
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (NSTextStorage)textStorage
{
  return self->_textStorage;
}

- (id)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSTextContentStorage;
  return -[NSTextContentManager delegate](&v3, sel_delegate);
}

+ (BOOL)_usesTextListElements
{
  if (_usesTextListElements_onceToken != -1)
    dispatch_once(&_usesTextListElements_onceToken, &__block_literal_global_23);
  return _usesTextListElements_usesTextListElements;
}

- (BOOL)copiesContentsInTextParagraphs
{
  return self->_copiesContentsInTextParagraphs;
}

- (NSCountableTextRange)documentRange
{
  NSCountableTextRange *documentRange;

  objc_sync_enter(self);
  documentRange = self->_documentRange;
  if (!documentRange)
  {
    documentRange = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", 0, -[NSAttributedString length](-[NSTextContentStorage attributedString](self, "attributedString"), "length"));
    self->_documentRange = documentRange;
  }
  objc_sync_exit(self);
  return documentRange;
}

- (id)locationFromLocation:(id)location withOffset:(NSInteger)offset
{
  uint64_t v8;
  unint64_t v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-[%@ %@] received invalid location %@"), self, NSStringFromSelector(a2), location);
  if (objc_msgSend(location, "isEndOfDocument"))
    v8 = -[NSAttributedString length](-[NSTextContentStorage attributedString](self, "attributedString"), "length");
  else
    v8 = objc_msgSend(location, "characterIndex");
  v9 = v8 + offset;
  if (v8 + offset < 0
    || v9 > -[NSAttributedString length](-[NSTextContentStorage attributedString](self, "attributedString"), "length"))
  {
    return 0;
  }
  if (!offset)
    return location;
  return -[NSCountableTextLocation initWithIndex:]([NSCountableTextLocation alloc], "initWithIndex:", v9);
}

- (NSInteger)offsetFromLocation:(id)from toLocation:(id)to
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (objc_msgSend(from, "isEndOfDocument"))
    v8 = -[NSAttributedString length](-[NSTextContentStorage attributedString](self, "attributedString"), "length");
  else
    v8 = objc_msgSend(from, "characterIndex");
  v9 = v8;
  if (objc_msgSend(to, "isEndOfDocument"))
    v10 = -[NSAttributedString length](-[NSTextContentStorage attributedString](self, "attributedString"), "length");
  else
    v10 = objc_msgSend(to, "characterIndex");
  v11 = v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-[%@ %@] received invalid locations %@ %@"), self, NSStringFromSelector(a2), from, to);
  return v11 - v9;
}

- (void)endEditingTransaction
{
  -[NSTextContentStorage synchronizeTextLayoutManagers:](self, "synchronizeTextLayoutManagers:", 0);
}

- (void)beginEditingTransaction
{
  -[NSTextContentManager setPrimaryTextLayoutManager:](self, "setPrimaryTextLayoutManager:", 0);
}

- (void)processEditingForTextStorage:(id)a3 edited:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6 invalidatedRange:(_NSRange)a7
{
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange *p_cachedRange;
  NSRange v15;
  NSUInteger v16;
  NSUInteger v17;
  uint64_t v18;
  unint64_t v19;
  unsigned int v20;
  NSRunStorage *indexTable;
  unint64_t v22;
  unint64_t v23;
  NSRange v24;
  NSUInteger v25;
  NSRunStorage *v26;
  double v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  NSRange v31;
  _BOOL4 v32;
  _NSRunBlock *runs;
  unint64_t elementSize;
  NSString *v35;
  NSString *v36;
  NSRange v37;
  int v38;
  unint64_t v39;
  NSRunStorage *v40;
  unint64_t v41;
  unint64_t v42;
  NSUInteger v43;
  NSRunStorage *v44;
  unint64_t v45;
  unint64_t v46;
  unsigned __int8 v47;
  NSRange v48;
  NSRange v49;
  NSRunStorage *v50;
  unint64_t v51;
  unint64_t v52;
  NSRange v53;
  NSRange v54;
  uint64_t ElementIndexRangeForRange;
  NSUInteger v56;
  NSUInteger v57;
  NSUInteger v58;
  NSUInteger v59;
  NSUInteger v60;
  NSRange v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  NSUInteger v67;
  NSUInteger v68;
  NSUInteger v69;
  NSCountableTextRange *v70;
  NSUInteger v71;
  NSCountableTextRange *v72;
  NSCountableTextRange *v73;
  _NSRange *p_editedRange;
  NSUInteger v75;
  NSUInteger v76;
  NSUInteger v77;
  NSRange v78;
  _NSRange *p_invalidatedRange;
  NSRange v80;
  NSRange v81;
  NSUInteger range1;
  NSUInteger range1a;
  unint64_t v84;
  NSUInteger v85;
  NSUInteger v86;
  NSUInteger length;
  NSUInteger location;
  unint64_t v89;
  NSUInteger v90;
  NSUInteger v91;
  _QWORD v92[6];
  NSRange range2;
  __int128 v94;
  NSRange v95;
  NSRange v96;
  NSRange v97;
  NSRange v98;
  NSRange v99;
  NSRange v100;
  NSRange v101;
  NSRange v102;
  NSRange v103;
  NSRange v104;

  length = a5.length;
  location = a5.location;
  v10 = -[NSTextContentStorage _applyEditedRangeAdjustmentsToRange:](self, "_applyEditedRangeAdjustmentsToRange:", a7.location, a7.length);
  if (v11)
    v12 = v10;
  else
    v12 = a7.location;
  if (v11)
    v13 = v11;
  else
    v13 = a7.length;
  v86 = -[NSString length](-[NSAttributedString string](-[NSTextContentStorage attributedString](self, "attributedString"), "string"), "length");
  v95.length = v13 - a6;
  p_cachedRange = &self->_cachedRange;
  v95.location = v12;
  v91 = v13 - a6;
  v15 = NSIntersectionRange(v95, self->_cachedRange);
  v16 = v15.location;
  v17 = v15.length;
  v89 = a4;
  v90 = v13;
  if (v15 == 0uLL)
  {
    if ((a4 & 2) == 0
      || (v16 = v12, v12 != self->_cachedRange.length + self->_cachedRange.location)
      && (v16 = p_cachedRange->location, v12 + v91 != p_cachedRange->location))
    {
      objc_sync_enter(self);
      v17 = 0;
      v18 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_73;
    }
  }
  objc_sync_enter(self);
  v18 = 0x7FFFFFFFFFFFFFFFLL;
  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_73;
  v19 = -[NSRunStorage count](self->_indexTable, "count");
  v84 = v19;
  if (v16 > v19)
  {
    v18 = v16;
    goto LABEL_67;
  }
  range2 = (NSRange)0;
  if (v16 == v19)
  {
    range2.location = v16;
    range2.length = v15.length;
    v20 = 3;
    goto LABEL_21;
  }
  indexTable = self->_indexTable;
  _NSBlockNumberForIndex(indexTable, v16, (__n128 *)&range2);
  if (indexTable->_gapBlockIndex <= v22)
    v23 = indexTable->_maxBlocks - indexTable->_numBlocks;
  else
    v23 = 0;
  v20 = indexTable->_runs->var1[(indexTable->_elementSize + 8) * (v23 + v22) + 24];
  v24.location = range2.location;
  if (v16 == range2.location)
  {
LABEL_21:
    v25 = v15.length;
    if (!v15.length)
    {
      if ((v20 & 3) == 0)
      {
        v25 = 0;
        if (v16)
          goto LABEL_25;
        goto LABEL_38;
      }
      v25 = range2.length;
    }
    if (v16)
    {
LABEL_25:
      range1a = v25;
      v26 = self->_indexTable;
      *(_QWORD *)&v27 = _NSBlockNumberForIndex(v26, v16 - 1, (__n128 *)&range2).n128_u64[0];
      v29 = v28;
      if (v26->_gapBlockIndex <= v28)
        v30 = v26->_maxBlocks - v26->_numBlocks;
      else
        v30 = 0;
      runs = v26->_runs;
      elementSize = v26->_elementSize;
      v35 = -[NSAttributedString string](-[NSTextContentStorage attributedString](self, "attributedString", v27, range1a), "string");
      v20 = runs->var1[(elementSize + 8) * (v30 + v29) + 24];
      if ((v20 & 2) != 0
        || (v20 & 4) != 0
        && (v36 = v35, v16 < -[NSString length](v35, "length"))
        && -[NSString characterAtIndex:](v36, "characterAtIndex:", v16) == 10)
      {
        v97.location = v16;
        v97.length = range1;
        v37 = NSUnionRange(v97, range2);
        v18 = v37.location;
        v25 = v37.length;
      }
      else
      {
        v18 = v16;
        v25 = range1;
      }
      goto LABEL_39;
    }
LABEL_38:
    v18 = 0;
LABEL_39:
    v32 = v16 == v18;
    goto LABEL_40;
  }
  if (range2.location >= v16)
  {
    v32 = 0;
    v18 = v16;
    v25 = v15.length;
  }
  else
  {
    v24.length = range2.length;
    v96.location = v16;
    v96.length = v15.length;
    v31 = NSUnionRange(v96, v24);
    v18 = v31.location;
    v32 = 0;
    v25 = v31.length;
  }
LABEL_40:
  if (!v25)
  {
    v17 = 0;
    goto LABEL_67;
  }
  v38 = (v20 >> 3) & 1;
  range1 = v25;
  v39 = v25 + v18;
  if (v25 + v18 < v84)
  {
    v40 = self->_indexTable;
    _NSBlockNumberForIndex(v40, v39, (__n128 *)&range2);
    if (v40->_gapBlockIndex <= v41)
      v42 = v40->_maxBlocks - v40->_numBlocks;
    else
      v42 = 0;
    v47 = v40->_runs->var1[(v40->_elementSize + 8) * (v42 + v41) + 24];
    v48.location = range2.location;
    if (range2.location < v39 || (v47 & 1) != 0 && v16 + v15.length >= range2.location)
    {
      v48.length = range2.length;
      v98.location = v18;
      v98.length = range1;
      v49 = NSUnionRange(v98, v48);
      range1 = v49.length;
      v18 = v49.location;
      if ((v47 & 1) != 0 && v32 && v16 + v15.length == range2.location && v49.location)
      {
        v50 = self->_indexTable;
        _NSBlockNumberForIndex(v50, v49.location - 1, (__n128 *)&range2);
        v52 = v50->_gapBlockIndex <= v51 ? v50->_maxBlocks - v50->_numBlocks : 0;
        v47 = v50->_runs->var1[(v50->_elementSize + 8) * (v52 + v51) + 24];
        if ((v47 & 2) != 0)
        {
          v81 = NSUnionRange(v49, range2);
          range1 = v81.length;
          v18 = v81.location;
        }
      }
    }
    else
    {
      v38 = 0;
    }
    v43 = v84;
    if (!(v38 | ((v47 & 8) >> 3)))
      goto LABEL_66;
LABEL_46:
    v17 = range1;
    if (range1 && range1 + v18 < v43)
    {
      v44 = self->_indexTable;
      _NSBlockNumberForIndex(v44, range1 + v18, (__n128 *)&range2);
      v46 = v44->_gapBlockIndex <= v45 ? v44->_maxBlocks - v44->_numBlocks : 0;
      v17 = range1;
      v53.location = range2.location;
      if (range2.location < range1 + v18 || (v44->_runs->var1[(v44->_elementSize + 8) * (v46 + v45) + 24] & 8) != 0)
      {
        v53.length = range2.length;
        v99.location = v18;
        v99.length = range1;
        v54 = NSUnionRange(v99, v53);
        v18 = v54.location;
        v17 = v54.length;
      }
    }
    goto LABEL_67;
  }
  v43 = v84;
  if (v38)
    goto LABEL_46;
LABEL_66:
  v17 = range1;
LABEL_67:
  ElementIndexRangeForRange = __NSTextContentStorageGetElementIndexRangeForRange((uint64_t)self, v18, v17);
  v57 = v56;
  if (v56)
  {
    v58 = ElementIndexRangeForRange;
    range2 = (NSRange)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v94 = xmmword_18D6CBD40;
    if (ElementIndexRangeForRange + v56 <= -[NSStorage count](self->_elements, "count"))
    {
      v18 = objc_msgSend((id)objc_msgSend(*(id *)-[NSStorage elementAtIndex:](self->_elements, "elementAtIndex:", v58), "elementRange"), "range");
      v17 = v59;
      if (v57 >= 2)
      {
        v103.location = objc_msgSend((id)objc_msgSend(*(id *)-[NSStorage elementAtIndex:](self->_elements, "elementAtIndex:", v58 + v57 - 1), "elementRange"), "range");
        v103.length = v60;
        v100.location = v18;
        v100.length = v17;
        v61 = NSUnionRange(v100, v103);
        v18 = v61.location;
        v17 = v61.length;
      }
    }
    else
    {
      v17 = 0;
      v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
    -[NSRunStorage replaceElementsInRange:withElement:coalesceRuns:](self->_indexTable, "replaceElementsInRange:withElement:coalesceRuns:", v18, v17, &range2, 1, range1);
    __NSTextContentStorageReleaseElementsInRange((NSUInteger)self, v58, v57);
    -[NSStorage removeElementsInRange:](self->_elements, "removeElementsInRange:", v58, v57);
    __NSTextContentStorageUpdateElementIndexRangeForRange((uint64_t)self, 0, 0, 0, v18 + v17, -[NSRunStorage count](self->_indexTable, "count") - (v18 + v17), -(uint64_t)v57);
    __NSTextContentStorageUpdateCachedRange((uint64_t)self);
  }
LABEL_73:
  if (a6)
  {
    v62 = -[NSRunStorage count](self->_indexTable, "count");
    v63 = v62;
    v64 = v86 - a6;
    if (v86 - a6 >= v62)
      v64 = v62;
    v65 = v64 - (v12 + v91);
    if (v64 > v12 + v91)
    {
      v66 = __NSTextContentStorageGetElementIndexRangeForRange((uint64_t)self, v12 + v91, v64 - (v12 + v91));
      v68 = v67;
      if (v67)
      {
        v85 = v66;
        range2 = (NSRange)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
        *(_QWORD *)&v94 = 0;
        *((_QWORD *)&v94 + 1) = 1;
        -[NSRunStorage replaceElementsInRange:withElement:coalesceRuns:](self->_indexTable, "replaceElementsInRange:withElement:coalesceRuns:", v12 + v91, v65, &range2, 1);
        if (v86 > v63)
          -[NSRunStorage insertElement:range:coalesceRuns:](self->_indexTable, "insertElement:range:coalesceRuns:", &range2, v63, v86 - v63, 1);
        v92[0] = MEMORY[0x1E0C809B0];
        v92[1] = 3221225472;
        v92[2] = __98__NSTextContentStorage_processEditingForTextStorage_edited_range_changeInLength_invalidatedRange___block_invoke;
        v92[3] = &unk_1E26057C8;
        v92[4] = self;
        v92[5] = a6;
        __NSTextContentStorageEnumerateCachedElementsInElementIndexRange((NSUInteger)self, v85, v68, (uint64_t)v92);
        __NSTextContentStorageUpdateCachedRange((uint64_t)self);
      }
    }

    self->_documentRange = 0;
  }
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    v69 = v91;
  else
    v69 = v17;
  v70 = [NSCountableTextRange alloc];
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    v71 = v12;
  else
    v71 = v18;
  v72 = -[NSCountableTextRange initWithRange:](v70, "initWithRange:", v71, v69, range1);
  v73 = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", v71, v69 + a6);
  -[NSTextContentManager recordEditActionInRange:newTextRange:](self, "recordEditActionInRange:newTextRange:", v72, v73);

  p_editedRange = &self->_editedRange;
  v75 = self->_editedRange.location;
  if (v75 == 0x7FFFFFFFFFFFFFFFLL)
  {
    p_editedRange->location = location;
    self->_editedRange.length = length;
    self->_editedDelta = a6;
    self->_editedMask = v89;
  }
  else
  {
    if (location >= v75)
      v76 = self->_editedRange.location;
    else
      v76 = location;
    v77 = self->_editedRange.length + v75 - self->_editedDelta;
    if (length - a6 + location > v77)
      v77 = length - a6 + location;
    p_editedRange->location = v76;
    self->_editedRange.length = a6 - v76 + v77;
    self->_editedDelta += a6;
    self->_editedMask |= v89;
  }
  v78.length = v90;
  p_invalidatedRange = &self->_invalidatedRange;
  if (self->_invalidatedRange.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    p_invalidatedRange->location = v12;
    self->_invalidatedRange.length = v90;
  }
  else
  {
    v101.location = p_editedRange->location;
    v101.length = self->_editedRange.length;
    v78.location = v12;
    v104 = NSUnionRange(v101, v78);
    v102.location = p_invalidatedRange->location;
    v102.length = self->_invalidatedRange.length;
    v80 = NSUnionRange(v102, v104);
    p_invalidatedRange->location = v80.location;
    self->_invalidatedRange.length = v80.length;
  }
  objc_sync_exit(self);
}

- (NSTextContentStorage)init
{
  NSTextContentStorage *v2;
  NSTextContentStorage *v3;
  NSTextStorage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSTextContentStorage;
  v2 = -[NSTextContentManager init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NSTextContentStorage _commonInitialization](v2, "_commonInitialization");
    v4 = objc_alloc_init(NSTextStorage);
    -[NSTextContentStorage setTextStorage:](v3, "setTextStorage:", v4);

  }
  return v3;
}

- (void)setTextStorage:(id)a3
{
  NSTextStorage *textStorage;

  textStorage = self->_textStorage;
  if (textStorage != a3)
  {
    -[NSTextStorage setTextStorageObserver:](textStorage, "setTextStorageObserver:", 0);
    objc_sync_enter(self);
    -[NSTextStorage _setShouldSetOriginalFontAttribute:](self->_textStorage, "_setShouldSetOriginalFontAttribute:", 0);
    self->_textStorage = (NSTextStorage *)a3;
    objc_msgSend(a3, "_setShouldSetOriginalFontAttribute:", 1);
    objc_sync_exit(self);
    -[NSTextContentStorage setAttributedString:](self, "setAttributedString:", a3);
    objc_msgSend(a3, "setTextStorageObserver:", self);
    if (objc_msgSend(a3, "_isSwiftAttributedString"))
      -[NSTextContentStorage setCopiesContentsInTextParagraphs:](self, "setCopiesContentsInTextParagraphs:", 1);
  }
}

- (void)setAttributedString:(NSAttributedString *)attributedString
{
  NSCountableTextRange *documentRange;
  NSMutableArray *textLayoutManagers;
  void *v7;
  _QWORD v8[5];
  _OWORD v9[2];

  if (self->_attributedString != attributedString)
  {
    objc_sync_enter(self);
    documentRange = self->_documentRange;
    if (documentRange && !-[NSCountableTextRange isEmpty](documentRange, "isEmpty"))
    {
      textLayoutManagers = self->super._textLayoutManagers;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __44__NSTextContentStorage_setAttributedString___block_invoke;
      v8[3] = &unk_1E2605718;
      v8[4] = self;
      -[NSMutableArray enumerateObjectsUsingBlock:](textLayoutManagers, "enumerateObjectsUsingBlock:", v8);
      -[NSTextContentStorage synchronizeTextLayoutManagers:](self, "synchronizeTextLayoutManagers:", 0);
    }

    if ((NSAttributedString *)self->_textStorage == attributedString)
    {
      self->_attributedString = attributedString;
    }
    else
    {
      self->_attributedString = (NSAttributedString *)-[NSAttributedString copy](attributedString, "copy");
      self->_textStorage = 0;
    }
    objc_sync_enter(self);
    v9[0] = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v9[1] = xmmword_18D6CBD40;
    __NSTextContentStorageEnumerateCachedElementsInElementIndexRange((NSUInteger)self, 0, -[NSStorage count](self->_elements, "count"), (uint64_t)&__block_literal_global_282);
    -[NSRunStorage replaceElementsInRange:withElement:coalesceRuns:](self->_indexTable, "replaceElementsInRange:withElement:coalesceRuns:", 0, -[NSRunStorage count](self->_indexTable, "count"), v9, 1);
    -[NSStorage removeElementsInRange:](self->_elements, "removeElementsInRange:", 0, -[NSStorage count](self->_elements, "count"));
    self->_cachedRange = (_NSRange)xmmword_18D6CBB80;
    objc_sync_exit(self);

    self->_documentRange = 0;
    if (!-[NSTextContentStorage _supportsTextAttributesInRange:](self, "_supportsTextAttributesInRange:", 0, -[NSAttributedString length](self->_attributedString, "length")))
    {
      v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      objc_msgSend(v7, "postNotificationName:object:", NSTextContentStorageUnsupportedAttributeAddedNotification, self);
    }
    objc_sync_exit(self);
  }
}

- (void)synchronizeTextLayoutManagers:(id)a3
{
  void *v5;
  NSMutableArray *textLayoutManagers;
  _QWORD v7[5];
  objc_super v8;

  objc_sync_enter(self);
  v8.receiver = self;
  v8.super_class = (Class)NSTextContentStorage;
  -[NSTextContentManager synchronizeTextLayoutManagers:](&v8, sel_synchronizeTextLayoutManagers_, a3);
  if (!-[NSTextContentStorage _supportsTextAttributesInRange:](self, "_supportsTextAttributesInRange:", self->_invalidatedRange.location, self->_invalidatedRange.length))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v5, "postNotificationName:object:", NSTextContentStorageUnsupportedAttributeAddedNotification, self);
  }
  if (!self->_notifyingToFixSelection && self->_editedRange.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_notifyingToFixSelection = 1;
    if ((self->_editedMask & 2) != 0)
    {
      textLayoutManagers = self->super._textLayoutManagers;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __54__NSTextContentStorage_synchronizeTextLayoutManagers___block_invoke;
      v7[3] = &unk_1E2605718;
      v7[4] = self;
      -[NSMutableArray enumerateObjectsUsingBlock:](textLayoutManagers, "enumerateObjectsUsingBlock:", v7);
    }
    self->_notifyingToFixSelection = 0;
    self->_invalidatedRange = (_NSRange)xmmword_18D6CBB80;
    self->_editedRange = (_NSRange)xmmword_18D6CBB80;
    self->_editedDelta = 0;
    self->_editedMask = 0;
  }
  objc_sync_exit(self);
}

- (BOOL)isCountableDataSource
{
  return 1;
}

- (void)_commonInitialization
{
  char v3;

  self->_indexTable = -[NSRunStorage initWithElementSize:capacity:]([NSRunStorage alloc], "initWithElementSize:capacity:", 32, 0);
  self->_elements = -[NSStorage initWithElementSize:capacity:]([NSStorage alloc], "initWithElementSize:capacity:", 8, 0);
  self->_cachedRange = (_NSRange)xmmword_18D6CBB80;
  self->_modifiedRange = (_NSRange)xmmword_18D6CBB80;
  self->_modifiedDocumentLengthDelta = 0;
  self->_invalidatedRange = (_NSRange)xmmword_18D6CBB80;
  self->_editedRange = (_NSRange)xmmword_18D6CBB80;
  self->_editedDelta = 0;
  self->_editedMask = 0;
  if (objc_msgSend((id)objc_opt_class(), "_includesTextListMarkers"))
    v3 = objc_msgSend((id)objc_opt_class(), "__isNotesTextContentStorageClass") ^ 1;
  else
    v3 = 0;
  self->_includesTextListMarkers = v3;
}

+ (BOOL)_includesTextListMarkers
{
  if (_includesTextListMarkers_onceToken != -1)
    dispatch_once(&_includesTextListMarkers_onceToken, &__block_literal_global_156);
  return _includesTextListMarkers_includesTextListMarkers;
}

+ (BOOL)__isNotesTextContentStorageClass
{
  if (__isNotesTextContentStorageClass_onceToken != -1)
    dispatch_once(&__isNotesTextContentStorageClass_onceToken, &__block_literal_global_160_0);
  return __isNotesTextContentStorageClass_notesTextContentStorageClass == (_QWORD)a1;
}

uint64_t __48__NSTextContentStorage__includesTextListMarkers__block_invoke()
{
  void *v0;
  uint64_t result;

  v0 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "valueForKey:", CFSTR("_NSTextContentStorageIncludesTextListMarkers"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    result = objc_msgSend(v0, "BOOLValue");
  else
    result = +[NSTextList includesTextListMarkers](NSTextList, "includesTextListMarkers");
  _includesTextListMarkers_includesTextListMarkers = result;
  return result;
}

uint64_t __54__NSTextContentStorage_synchronizeTextLayoutManagers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_fixSelectionAfterChangeInCharacterRange:changeInLength:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176));
}

Class __56__NSTextContentStorage___isNotesTextContentStorageClass__block_invoke()
{
  Class result;

  result = NSClassFromString((NSString *)CFSTR("ICTTTextContentStorage"));
  __isNotesTextContentStorageClass_notesTextContentStorageClass = (uint64_t)result;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTextContentStorage setAttributedString:](self, "setAttributedString:", 0);

  v3.receiver = self;
  v3.super_class = (Class)NSTextContentStorage;
  -[NSTextContentManager dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSTextContentStorage;
  -[NSTextContentManager setDelegate:](&v3, sel_setDelegate_, delegate);
}

uint64_t __45__NSTextContentStorage__usesTextListElements__block_invoke()
{
  void *v0;
  uint64_t result;

  v0 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "valueForKey:", CFSTR("_NSUsesTextListElements"));
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    result = objc_msgSend(v0, "BOOLValue");
    _usesTextListElements_usesTextListElements = result;
  }
  return result;
}

- (BOOL)includesTextListMarkers
{
  return self->_includesTextListMarkers;
}

- (NSTextRange)adjustedRangeFromRange:(NSTextRange *)textRange forEditingTextSelection:(BOOL)forEditingTextSelection
{
  _NSRange *p_editedRange;
  _BOOL4 v5;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger location;
  NSUInteger length;
  int64_t editedDelta;
  NSUInteger v13;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  NSString *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t RangeOfCharacterClusterAtIndex;
  uint64_t v23;
  uint64_t v25;
  BOOL v26;
  uint64_t v28;
  uint64_t v29;

  p_editedRange = &self->_editedRange;
  if (self->_editedRange.location == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v5 = forEditingTextSelection;
  v7 = -[NSTextRange range](textRange, "range");
  v9 = v8;
  location = p_editedRange->location;
  length = p_editedRange->length;
  editedDelta = self->_editedDelta;
  v13 = length - editedDelta;
  if (v5)
  {
    if (location >= v7 + v8 && (location != v7 || v13 != v8))
      return 0;
    v9 = 0;
    v15 = length + location;
  }
  else
  {
    v16 = v13 + location;
    if (editedDelta)
      v17 = v7 >= v16;
    else
      v17 = 0;
    if (!v17)
      return 0;
    v15 = editedDelta + v7;
  }
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v18 = -[NSAttributedString string](-[NSTextContentStorage attributedString](self, "attributedString"), "string");
  v19 = -[NSString length](v18, "length");
  v20 = v19;
  v21 = v15 + v9;
  if (v15 && v15 < v19 - 1)
  {
    RangeOfCharacterClusterAtIndex = CFStringGetRangeOfCharacterClusterAtIndex();
    if (RangeOfCharacterClusterAtIndex >= v15 || v15 >= RangeOfCharacterClusterAtIndex + v23)
    {
      if (-[NSString characterAtIndex:](v18, "characterAtIndex:", v15) == 10
        && -[NSString characterAtIndex:](v18, "characterAtIndex:", v15 - 1) == 13)
      {
        ++v15;
        if (v9)
          v9 = v21 - v15;
        else
          v9 = 0;
      }
    }
    else
    {
      if (v9)
        v9 = v21 - RangeOfCharacterClusterAtIndex;
      else
        v9 = 0;
      v15 = RangeOfCharacterClusterAtIndex;
    }
  }
  if (v9)
  {
    v26 = v21 < 2;
    v25 = v15 + v9;
    v26 = !v26 && v25 < v20;
    if (v26)
    {
      v28 = CFStringGetRangeOfCharacterClusterAtIndex();
      if (v28 >= v25)
      {
        if (-[NSString characterAtIndex:](v18, "characterAtIndex:", v15 + v9) == 10
          && -[NSString characterAtIndex:](v18, "characterAtIndex:", v25 - 1) == 13)
        {
          ++v9;
        }
      }
      else
      {
        v9 = v29 - v9 + v28;
      }
    }
  }
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  return (NSTextRange *)-[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", v15, v9);
}

- (_NSRange)_applyEditedRangeAdjustmentsToRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  NSRange v13;
  NSUInteger v14;
  NSUInteger v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  NSRange v23;
  _NSRange result;
  NSRange v25;

  length = a3.length;
  location = a3.location;
  v22 = *MEMORY[0x1E0C80C00];
  obj = (id)objc_opt_class();
  objc_sync_enter(obj);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (void *)_editedRangeValidators;
  v7 = objc_msgSend((id)_editedRangeValidators, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  v8 = location;
  v9 = length;
  if (v7)
  {
    v10 = *(_QWORD *)v18;
    v8 = location;
    v9 = length;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "adjustedInvalidationRangeForRange:limitRange:textContentStorage:", v8, v9, self->_cachedRange.location, self->_cachedRange.length, self);
        v9 = v12;
        ++v11;
      }
      while (v7 != v11);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }
  v23.location = location;
  v23.length = length;
  v25.location = v8;
  v25.length = v9;
  v13 = NSUnionRange(v23, v25);
  objc_sync_exit(obj);
  v14 = v13.location;
  v15 = v13.length;
  result.length = v15;
  result.location = v14;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSTextContentStorage)initWithCoder:(id)a3
{
  NSTextContentStorage *v4;
  NSTextContentStorage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSTextContentStorage;
  v4 = -[NSTextContentManager initWithCoder:](&v7, sel_initWithCoder_);
  v5 = v4;
  if (v4)
  {
    -[NSTextContentStorage _commonInitialization](v4, "_commonInitialization");
    if (objc_msgSend(a3, "allowsKeyedCoding"))
    {
      -[NSTextContentStorage setTextStorage:](v5, "setTextStorage:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.textStorage")));
      if (!v5->_attributedString)
        -[NSTextContentStorage setAttributedString:](v5, "setAttributedString:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.attributedString")));
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSTextContentStorage;
  -[NSTextContentManager encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if (objc_msgSend(a3, "allowsKeyedCoding") && (self->_textStorage || self->_attributedString))
    objc_msgSend(a3, "encodeObject:forKey:");
}

uint64_t __44__NSTextContentStorage_setAttributedString___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "textContentManager");
  if (result == *(_QWORD *)(a1 + 32))
    return objc_msgSend(a2, "invalidateLayoutForRange:", *(_QWORD *)(result + 80));
  return result;
}

- (NSAttributedString)attributedStringForTextElement:(NSTextElement *)textElement
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSAttributedString *)-[NSTextElement attributedString](textElement, "attributedString");
  else
    return 0;
}

- (NSTextElement)textElementForAttributedString:(NSAttributedString *)attributedString
{
  return (NSTextElement *)-[NSTextParagraph initWithAttributedString:]([NSTextParagraph alloc], "initWithAttributedString:", attributedString);
}

- (id)attributedStringForTextElements:(id)a3
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", &__block_literal_global_181);
  return v4;
}

- (id)textElementsForAttributedString:(id)a3
{
  return 0;
}

- (void)updateRangesForTextElement:(id)a3 locationDelta:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSCountableTextRange *v11;
  uint64_t v12;
  NSCountableTextRange *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSCountableTextRange *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSCountableTextRange *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[5];
  _QWORD v25[4];
  id v26[2];
  id location;

  v7 = (void *)objc_msgSend(a3, "elementRange");
  if (!v7)
  {
    v12 = 0;
    goto LABEL_9;
  }
  v8 = objc_msgSend(v7, "range");
  v10 = v8 + a4;
  if (a4 && !v8)
  {
    v11 = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", v10, v9);
    objc_msgSend(a3, "setElementRange:", v11);

LABEL_8:
    v12 = objc_msgSend(a3, "elementRange");
    goto LABEL_9;
  }
  v13 = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", v10, v9);
  objc_msgSend(a3, "setElementRange:", v13);

  v12 = 0;
  if (a4 && !v10)
    goto LABEL_8;
LABEL_9:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = (void *)objc_msgSend(a3, "paragraphContentRange");
    if (v14)
    {
      v15 = objc_msgSend(v14, "range");
      v17 = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", v15 + a4, v16);
      objc_msgSend(a3, "setParagraphContentRange:", v17);

    }
    v18 = (void *)objc_msgSend(a3, "paragraphSeparatorRange");
    if (v18)
    {
      v19 = objc_msgSend(v18, "range");
      v21 = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", v19 + a4, v20);
      objc_msgSend(a3, "setParagraphSeparatorRange:", v21);

    }
    objc_msgSend(a3, "synchronizeDocumentRange");
  }
  objc_initWeak(&location, self);
  v22 = (void *)objc_msgSend(a3, "childElements");
  v23 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __65__NSTextContentStorage_updateRangesForTextElement_locationDelta___block_invoke;
  v25[3] = &unk_1E26057A0;
  objc_copyWeak(v26, &location);
  v26[1] = (id)a4;
  objc_msgSend(v22, "enumerateObjectsUsingBlock:", v25);
  if (v12)
  {
    v24[0] = v23;
    v24[1] = 3221225472;
    v24[2] = __65__NSTextContentStorage_updateRangesForTextElement_locationDelta___block_invoke_2;
    v24[3] = &unk_1E2605718;
    v24[4] = v12;
    -[NSArray enumerateObjectsUsingBlock:](-[NSTextContentManager textLayoutManagers](self, "textLayoutManagers"), "enumerateObjectsUsingBlock:", v24);
  }
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
}

uint64_t __65__NSTextContentStorage_updateRangesForTextElement_locationDelta___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "updateRangesForTextElement:locationDelta:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __65__NSTextContentStorage_updateRangesForTextElement_locationDelta___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidateLayoutForRange:", *(_QWORD *)(a1 + 32));
}

uint64_t __98__NSTextContentStorage_processEditingForTextStorage_edited_range_changeInLength_invalidatedRange___block_invoke(uint64_t result, id *a2, uint64_t a3, uint64_t a4)
{
  id *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int64x2_t v12;
  uint64_t v13;
  uint64_t v14;

  v12 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  v13 = 0;
  v14 = 1;
  if (a4 >= 1)
  {
    v5 = a2;
    v6 = result;
    v7 = (unint64_t)&a2[a4];
    do
    {
      objc_msgSend(*(id *)(v6 + 32), "updateRangesForTextElement:locationDelta:", *v5, *(_QWORD *)(v6 + 40), *(_OWORD *)&v12, v13, v14);
      result = objc_msgSend(*v5, "elementRange");
      if (result)
      {
        v8 = (void *)result;
        v12.i64[0] = a3;
        LOBYTE(v14) = objc_msgSend(*v5, "coalescingType");
        v9 = *(void **)(*(_QWORD *)(v6 + 32) + 88);
        v10 = objc_msgSend(v8, "range");
        result = objc_msgSend(v9, "replaceElementsInRange:withElement:coalesceRuns:", v10, v11, &v12, 0);
      }
      ++v5;
      ++a3;
    }
    while ((unint64_t)v5 < v7);
  }
  return result;
}

- (void)performEditingTransactionForTextStorage:(id)a3 usingBlock:(id)a4
{
  -[NSTextContentStorage beginEditingTransaction](self, "beginEditingTransaction", a3);
  (*((void (**)(id))a4 + 2))(a4);
  -[NSTextContentStorage endEditingTransaction](self, "endEditingTransaction");
}

+ (void)registerEditedRangeValidator:(id)a3
{
  void *v4;
  id v5;

  if (objc_msgSend(a3, "conformsToProtocol:", &unk_1EE07F468))
  {
    v4 = (void *)objc_opt_class();
    objc_sync_enter(v4);
    v5 = (id)_editedRangeValidators;
    if (!_editedRangeValidators)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      _editedRangeValidators = (uint64_t)v5;
    }
    objc_msgSend(v5, "addObject:", a3);
    objc_sync_exit(v4);
  }
}

- (BOOL)containsExtraLineFragment
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSAttributedString length](-[NSTextContentStorage attributedString](self, "attributedString"), "length");
  if (v3 < 1)
    return 1;
  v4 = -[NSString characterAtIndex:](-[NSAttributedString string](-[NSTextContentStorage attributedString](self, "attributedString"), "string"), "characterAtIndex:", v3 - 1);
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet"), "characterIsMember:", v4);
}

- (void)replaceContentsInRange:(id)a3 withTextElements:(id)a4
{
  char *location;
  NSUInteger length;
  NSRange v8;
  NSRunStorage *indexTable;
  unint64_t v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  NSAttributedString *v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSAttributedString *v20;
  void *v21;
  NSTextParagraph *v22;
  unint64_t v23;
  NSUInteger v24;
  NSRunStorage *v25;
  unint64_t v26;
  double v27;
  unint64_t v28;
  uint64_t v29;
  NSAttributedString *v30;
  _QWORD *v31;
  _QWORD *v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  char isKindOfClass;
  uint64_t v38;
  NSAttributedString *v39;
  void *v40;
  NSTextParagraph *v41;
  uint64_t v43;
  __n128 v44;
  NSRange v45;

  objc_sync_enter(self);
  v45.location = objc_msgSend(a3, "range");
  location = (char *)v45.location;
  length = v45.length;
  v8 = NSIntersectionRange(v45, self->_cachedRange);
  v44 = 0uLL;
  v43 = 0;
  if (!location)
  {
    v13 = 0;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_27;
  }
  if (location == (char *)v8.location)
  {
    indexTable = self->_indexTable;
    *(_QWORD *)&v11 = _NSBlockNumberForIndex(indexTable, (unint64_t)location, &v44).n128_u64[0];
    if (indexTable->_gapBlockIndex <= v10)
      v12 = indexTable->_maxBlocks - indexTable->_numBlocks;
    else
      v12 = 0;
    v17 = (uint64_t)indexTable->_runs + (indexTable->_elementSize + 8) * (v12 + v10);
    v16 = (_QWORD *)(v17 + 8);
    if (*(_QWORD *)(v17 + 8) != 0x7FFFFFFFFFFFFFFFLL)
    {
      if ((char *)v44.n128_u64[0] == location
        || (v18 = *(void **)-[NSStorage elementAtIndex:](self->_elements, "elementAtIndex:", v11),
            objc_opt_class(),
            (objc_opt_isKindOfClass() & 1) == 0))
      {
        v15 = 0;
      }
      else
      {
        v19 = (void *)objc_msgSend(v18, "attributedString");
        v15 = (NSAttributedString *)objc_msgSend(v19, "attributedSubstringFromRange:", 0, &location[-v44.n128_u64[0]]);
      }
      v13 = v44.n128_u64[0];
      v14 = *(_QWORD *)(v17 + 16);
      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_18;
      goto LABEL_11;
    }
    v15 = 0;
  }
  else
  {
    v15 = 0;
    v16 = 0;
  }
  v13 = (unint64_t)location;
LABEL_11:
  v14 = v13 - __NSTextContentStorageQueryDocumentLocationDeltaForLocation((uint64_t)self, v13, 0);
  if (location != (char *)v8.location)
    goto LABEL_19;
LABEL_18:
  if (*v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_19:
    -[NSString getParagraphStart:end:contentsEnd:forRange:](-[NSAttributedString string](-[NSTextContentStorage attributedString](self, "attributedString"), "string"), "getParagraphStart:end:contentsEnd:forRange:", &v43, 0, 0, v14, 1);
    if (v43 != v14)
    {
      v20 = -[NSTextContentStorage attributedString](self, "attributedString");
      v15 = -[NSAttributedString attributedSubstringFromRange:](v20, "attributedSubstringFromRange:", v43, v14 - v43);
      v13 -= -[NSAttributedString length](v15, "length");
      v14 = v43;
    }
  }
  if (v15)
  {
    location = (char *)objc_msgSend(a4, "mutableCopy");
    objc_msgSend(a4, "firstObject");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = (void *)-[NSAttributedString mutableCopy](v15, "mutableCopy");
      objc_msgSend(v21, "appendAttributedString:", objc_msgSend((id)objc_msgSend(a4, "firstObject"), "attributedString"));
      v22 = -[NSTextParagraph initWithAttributedString:]([NSTextParagraph alloc], "initWithAttributedString:", v21);
      objc_msgSend(location, "replaceObjectAtIndex:withObject:", 0, v22);

    }
    else
    {
      v22 = -[NSTextParagraph initWithAttributedString:]([NSTextParagraph alloc], "initWithAttributedString:", v15);
      objc_msgSend(location, "insertObject:atIndex:", v22, 0);
    }

  }
  else
  {
    location = 0;
  }
LABEL_27:
  v23 = v13 + length;
  if (v13 + length < 2
    || v23 >= self->_modifiedDocumentLengthDelta
            + -[NSAttributedString length](-[NSTextContentStorage attributedString](self, "attributedString"), "length"))
  {
    v29 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_33;
  }
  v24 = v8.location + v8.length;
  if (v23 != v8.location + v8.length)
  {
    v30 = 0;
    v31 = 0;
LABEL_42:
    v33 = v13 + length;
    goto LABEL_43;
  }
  v25 = self->_indexTable;
  *(_QWORD *)&v27 = _NSBlockNumberForIndex(v25, v23 - 1, &v44).n128_u64[0];
  if (v25->_gapBlockIndex <= v26)
    v28 = v25->_maxBlocks - v25->_numBlocks;
  else
    v28 = 0;
  v32 = (unint64_t *)((char *)&v25->_runs->var0 + (v25->_elementSize + 8) * (v28 + v26));
  v31 = v32 + 1;
  if (v32[1] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v30 = 0;
    goto LABEL_42;
  }
  v35 = v44.n128_u64[1];
  v34 = v44.n128_u64[0];
  if (v44.n128_u64[1] + v44.n128_u64[0] == v23
    || (v36 = *(void **)-[NSStorage elementAtIndex:](self->_elements, "elementAtIndex:", v27),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v35 = v44.n128_u64[1],
        v34 = v44.n128_u64[0],
        (isKindOfClass & 1) == 0))
  {
    v38 = 0;
  }
  else
  {
    v38 = objc_msgSend((id)objc_msgSend(v36, "attributedString"), "attributedSubstringFromRange:", v23 - v44.n128_u64[0], v44.n128_u64[0] - v23 + v44.n128_u64[1]);
    v35 = v44.n128_u64[1];
    v34 = v44.n128_u64[0];
  }
  length = v34 - v13 + v35;
  v29 = v32[2] - v14 + v32[3];
  if (v29 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v30 = (NSAttributedString *)v38;
    goto LABEL_52;
  }
  v33 = v34 + v35;
  v30 = (NSAttributedString *)v38;
  v24 = v8.location + v8.length;
LABEL_43:
  v29 = v33 - v14 - __NSTextContentStorageQueryDocumentLocationDeltaForLocation((uint64_t)self, v33, 0);
  if (v23 != v24)
  {
LABEL_53:
    -[NSString getParagraphStart:end:contentsEnd:forRange:](-[NSAttributedString string](-[NSTextContentStorage attributedString](self, "attributedString"), "string"), "getParagraphStart:end:contentsEnd:forRange:", 0, &v43, 0, v29 + v14 - 1, 1);
    if (v29 + v14 != v43)
    {
      v39 = -[NSTextContentStorage attributedString](self, "attributedString");
      v30 = -[NSAttributedString attributedSubstringFromRange:](v39, "attributedSubstringFromRange:", v29 + v14, v43 - (v29 + v14));
      length += -[NSAttributedString length](v30, "length");
      v29 = v43 - v14;
    }
    goto LABEL_55;
  }
LABEL_52:
  if (*v31 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_53;
LABEL_55:
  if (v30)
  {
    if (!location)
      location = (char *)objc_msgSend(a4, "mutableCopy");
    objc_msgSend(a4, "lastObject");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "lastObject"), "attributedString"), "mutableCopy");
      objc_msgSend(v40, "appendAttributedString:", v30);
      v41 = -[NSTextParagraph initWithAttributedString:]([NSTextParagraph alloc], "initWithAttributedString:", v40);
      objc_msgSend(location, "replaceObjectAtIndex:withObject:", objc_msgSend(location, "count") - 1, v41);

    }
    else
    {
      v41 = -[NSTextParagraph initWithAttributedString:]([NSTextParagraph alloc], "initWithAttributedString:", v30);
      objc_msgSend(location, "addObject:", v41);
    }

  }
LABEL_33:
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    __NSTextContentStorageQueryDocumentLocationDeltaForLocation((uint64_t)self, v13, 0);
  if (v29 == 0x7FFFFFFFFFFFFFFFLL)
    __NSTextContentStorageQueryDocumentLocationDeltaForLocation((uint64_t)self, length + v13, 0);

  objc_sync_exit(self);
}

- (void)synchronizeToBackingStore:(id)a3
{
  NSTextStorage *v4;
  NSTextStorage *v5;
  _NSRange *p_modifiedRange;
  NSUInteger location;
  NSUInteger length;
  char *__ptr32 *v9;
  unint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  NSUInteger v14;
  uint64_t v15;
  _OWORD *v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  NSUInteger v21;
  uint64_t v22;
  _OWORD v23[2];

  objc_sync_enter(self);
  if (-[NSTextContentStorage textStorage](self, "textStorage"))
    v4 = -[NSTextContentStorage textStorage](self, "textStorage");
  else
    v4 = (NSTextStorage *)objc_alloc_init(MEMORY[0x1E0CB3778]);
  v5 = v4;
  memset(v23, 0, sizeof(v23));
  p_modifiedRange = &self->_modifiedRange;
  location = self->_modifiedRange.location;
  length = self->_modifiedRange.length;
  v21 = 0;
  v22 = 0;
  -[NSTextStorage beginEditing](v4, "beginEditing");
  v9 = &off_18D6CB000;
  v10 = 0x1EE06F000uLL;
  if (self->_modifiedRange.length)
  {
    v11 = length + location;
    if (length + location > p_modifiedRange->location)
    {
      v12 = 0;
      v13 = 0;
      v20 = xmmword_18D6CBB80;
      v14 = 0x7FFFFFFFFFFFFFFFLL;
      v15 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        v16 = -[NSRunStorage elementAtIndex:effectiveRange:](self->_indexTable, "elementAtIndex:effectiveRange:", v11 - 1, &v21, v20);
        v17 = v16[1];
        v23[0] = *v16;
        v23[1] = v17;
        v18 = 0x7FFFFFFFFFFFFFFFLL;
        v19 = *((_QWORD *)&v23[0] + 1);
        if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (*(_QWORD *)&v23[1] + *((_QWORD *)&v23[0] + 1) == v15 && *(_QWORD *)&v23[0] + 1 == v14)
          {
            v18 = v15;
          }
          else
          {
            __NSTextContentStorageFillAttributedStringWithElementsInIndexRange((NSUInteger)self, v14, v12, v5, v15, v13);
            v13 = 0;
            v12 = 0;
            v18 = 0x7FFFFFFFFFFFFFFFLL;
            v19 = *((_QWORD *)&v23[0] + 1);
            v14 = 0x7FFFFFFFFFFFFFFFLL;
          }
        }
        if (v19 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v15 = v18;
        }
        else
        {
          v14 = *(_QWORD *)&v23[0];
          if (v18 == 0x7FFFFFFFFFFFFFFFLL)
            v13 = *(_QWORD *)&v23[1];
          else
            v13 = v18 + v13 - v19;
          if (v18 == 0x7FFFFFFFFFFFFFFFLL)
            v12 = 1;
          else
            ++v12;
          *(_OWORD *)((char *)v23 + 8) = v20;
          -[NSRunStorage replaceElementsInRange:withElement:coalesceRuns:](self->_indexTable, "replaceElementsInRange:withElement:coalesceRuns:", v21, v22, v23, 1);
          v15 = v19;
        }
        v11 = v21;
      }
      while (v21 > p_modifiedRange->location);
      v10 = 0x1EE06F000;
      v9 = &off_18D6CB000;
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        __NSTextContentStorageFillAttributedStringWithElementsInIndexRange((NSUInteger)self, v14, v12, v5, v15, v13);
    }
  }
  else if (self->_modifiedDocumentLengthDelta >= 1)
  {
    -[NSTextStorage replaceCharactersInRange:withString:](v5, "replaceCharactersInRange:withString:", p_modifiedRange->location);
  }
  __NSTextContentStorageEnumerateCachedElementsInElementIndexRange((NSUInteger)self, 0, -[NSStorage count](self->_elements, "count"), (uint64_t)&__block_literal_global_204);
  *p_modifiedRange = *((_NSRange *)v9 + 184);
  *(Class *)((char *)&self->super.super.isa + *(int *)(v10 + 2772)) = 0;
  -[NSTextStorage endEditing](v5, "endEditing");
  if (!-[NSTextContentStorage textStorage](self, "textStorage"))
    -[NSTextContentStorage setAttributedString:](self, "setAttributedString:", v5);

  objc_sync_exit(self);
}

void __50__NSTextContentStorage_synchronizeToBackingStore___block_invoke(uint64_t a1, id *a2, uint64_t a3, uint64_t a4)
{
  id *v4;
  unint64_t v5;

  if (a4 >= 1)
  {
    v4 = a2;
    v5 = (unint64_t)&a2[a4];
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(*v4, "synchronizeDocumentRange");
      ++v4;
    }
    while ((unint64_t)v4 < v5);
  }
}

- (void)setCopiesContentsInTextParagraphs:(BOOL)a3
{
  self->_copiesContentsInTextParagraphs = a3;
}

- (void)setIncludesTextListMarkers:(BOOL)a3
{
  self->_includesTextListMarkers = a3;
}

@end
