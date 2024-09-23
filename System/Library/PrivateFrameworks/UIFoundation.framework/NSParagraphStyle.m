@implementation NSParagraphStyle

- (BOOL)isEqual:(id)a3
{
  int64_t v5;
  int v6;
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
  NSLineBreakMode v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
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
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  NSInteger v41;
  double v42;
  double v43;
  double v44;
  NSWritingDirection v45;
  NSArray *v46;
  int v47;
  NSArray *v48;
  NSArray *v49;
  int v50;
  unint64_t v51;
  NSLineBreakStrategy v52;
  int v53;
  int v54;
  int64_t v55;
  int v56;
  int64_t v57;
  NSArray *v58;
  uint64_t v59;
  NSArray *v60;
  uint64_t v61;
  uint64_t v62;
  int64_t v63;
  unsigned __int8 *extraData;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  __CFString *v73;
  __CFString *v74;
  unsigned int v75;
  double v76;
  uint64_t v77;
  $22B4A0797DCB34CD9773A3EA0AC32B0B flags;
  unsigned int v79;
  double v80;
  uint64_t v81;
  int v82;

  if (self == a3)
    goto LABEL_152;
  if (!a3)
    goto LABEL_139;
  if ((object_getClass(self) == (Class)__NSParagraphStyleClass
     || object_getClass(self) == (Class)__NSMutableParagraphStyleClass)
    && (object_getClass(a3) == (Class)__NSParagraphStyleClass
     || object_getClass(a3) == (Class)__NSMutableParagraphStyleClass))
  {
    extraData = (unsigned __int8 *)self->_extraData;
    v65 = *((_QWORD *)a3 + 11);
    if (extraData && v65)
    {
      if (*((double *)extraData + 1) != *(double *)(v65 + 8)
        || *((double *)extraData + 2) != *(double *)(v65 + 16)
        || *((double *)extraData + 3) != *(double *)(v65 + 24)
        || *((double *)extraData + 4) != *(double *)(v65 + 32)
        || *((_QWORD *)extraData + 5) != *(_QWORD *)(v65 + 40))
      {
        goto LABEL_139;
      }
      v66 = (void *)*((_QWORD *)extraData + 6);
      if (v66 != *(void **)(v65 + 48))
      {
        v47 = objc_msgSend(v66, "isEqualToArray:");
        if (!v47)
          return v47;
      }
      v67 = *((_QWORD *)extraData + 7);
      v68 = *(_QWORD *)(v65 + 56);
      if (v67 != v68)
      {
        v69 = (void *)(v67 ? *((_QWORD *)extraData + 7) : MEMORY[0x1E0C9AA60]);
        v70 = v68 ? *(_QWORD *)(v65 + 56) : MEMORY[0x1E0C9AA60];
        v47 = objc_msgSend(v69, "isEqualToArray:", v70);
        if (!v47)
          return v47;
      }
      if (*((_QWORD *)extraData + 8) != *(_QWORD *)(v65 + 64)
        || *((_QWORD *)extraData + 9) != *(_QWORD *)(v65 + 72)
        || extraData[80] != *(unsigned __int8 *)(v65 + 80)
        || extraData[81] != *(unsigned __int8 *)(v65 + 81)
        || *((_QWORD *)extraData + 16) != *(_QWORD *)(v65 + 128)
        || extraData[83] != *(unsigned __int8 *)(v65 + 83)
        || *((_QWORD *)extraData + 11) != *(_QWORD *)(v65 + 88))
      {
        goto LABEL_139;
      }
      v71 = (void *)(*((_QWORD *)extraData + 12) ? *((_QWORD *)extraData + 12) : MEMORY[0x1E0C9AA60]);
      v72 = *(_QWORD *)(v65 + 96) ? *(_QWORD *)(v65 + 96) : MEMORY[0x1E0C9AA60];
      v47 = objc_msgSend(v71, "isEqual:", v72);
      if (!v47)
        return v47;
      if (*((_QWORD *)extraData + 13) != *(_QWORD *)(v65 + 104))
        goto LABEL_139;
      v73 = *((_QWORD *)extraData + 14) ? (__CFString *)*((_QWORD *)extraData + 14) : &stru_1E260C7D0;
      v74 = *(_QWORD *)(v65 + 112) ? *(__CFString **)(v65 + 112) : &stru_1E260C7D0;
      v47 = -[__CFString isEqual:](v73, "isEqual:", v74);
      if (!v47)
        return v47;
      if (*((_QWORD *)extraData + 15) != *(_QWORD *)(v65 + 120) || extraData[82] != *(unsigned __int8 *)(v65 + 82))
        goto LABEL_139;
    }
    else if (!extraData || v65)
    {
      flags = self->_flags;
      if (extraData || !v65)
      {
        if (((*((_DWORD *)a3 + 18) ^ *(_DWORD *)&flags) & 0x180F) != 0)
          goto LABEL_139;
      }
      else
      {
        v79 = (*(unsigned int *)&flags >> 11) & 3;
        v80 = ((double)v79 + 1.0) * 0.5;
        if (!v79)
          v80 = 0.0;
        if (v80 != *(double *)(v65 + 8))
          goto LABEL_139;
        if (*(double *)(v65 + 16) != 0.0)
          goto LABEL_139;
        if (*(double *)(v65 + 24) != 0.0)
          goto LABEL_139;
        if (*(double *)&__NSTightenFactor != *(double *)(v65 + 32))
          goto LABEL_139;
        if (*(_QWORD *)(v65 + 40))
          goto LABEL_139;
        if (*(_QWORD *)(v65 + 48))
          goto LABEL_139;
        if (objc_msgSend(*(id *)(v65 + 56), "count", *(double *)&__NSTightenFactor))
          goto LABEL_139;
        if (*(_QWORD *)(v65 + 64))
          goto LABEL_139;
        if (*(_QWORD *)(v65 + 72))
          goto LABEL_139;
        if (__NSUsesDefaultHyphenation_0 != *(_BYTE *)(v65 + 80))
          goto LABEL_139;
        if (*(_BYTE *)(v65 + 81))
          goto LABEL_139;
        if (*(_QWORD *)(v65 + 128))
          goto LABEL_139;
        if (*(_BYTE *)(v65 + 83))
          goto LABEL_139;
        if (*(_QWORD *)(v65 + 88))
          goto LABEL_139;
        if (objc_msgSend(*(id *)(v65 + 96), "count"))
          goto LABEL_139;
        if (*(_QWORD *)(v65 + 104))
          goto LABEL_139;
        if (objc_msgSend(*(id *)(v65 + 112), "length"))
          goto LABEL_139;
        v81 = *(_QWORD *)(v65 + 120);
        if (v81 != -[NSParagraphStyle horizontalAlignment](self, "horizontalAlignment") || *(_BYTE *)(v65 + 82))
          goto LABEL_139;
      }
    }
    else
    {
      v75 = (*((_DWORD *)a3 + 18) >> 11) & 3;
      v76 = ((double)v75 + 1.0) * 0.5;
      if (!v75)
        v76 = 0.0;
      if (*((double *)extraData + 1) != v76)
        goto LABEL_139;
      if (*((double *)extraData + 2) != 0.0)
        goto LABEL_139;
      if (*((double *)extraData + 3) != 0.0)
        goto LABEL_139;
      if (*((double *)extraData + 4) != *(double *)&__NSTightenFactor)
        goto LABEL_139;
      if (*((_QWORD *)extraData + 5))
        goto LABEL_139;
      if (*((_QWORD *)extraData + 6))
        goto LABEL_139;
      if (objc_msgSend(*((id *)extraData + 7), "count"))
        goto LABEL_139;
      if (*((_QWORD *)extraData + 8))
        goto LABEL_139;
      if (*((_QWORD *)extraData + 9))
        goto LABEL_139;
      if (extraData[80] != __NSUsesDefaultHyphenation_0)
        goto LABEL_139;
      if (extraData[81])
        goto LABEL_139;
      if (*((_QWORD *)extraData + 16))
        goto LABEL_139;
      if (extraData[83])
        goto LABEL_139;
      if (*((_QWORD *)extraData + 11))
        goto LABEL_139;
      if (objc_msgSend(*((id *)extraData + 12), "count"))
        goto LABEL_139;
      if (*((_QWORD *)extraData + 13))
        goto LABEL_139;
      if (objc_msgSend(*((id *)extraData + 14), "length"))
        goto LABEL_139;
      v77 = *((_QWORD *)extraData + 15);
      if (v77 != objc_msgSend(a3, "horizontalAlignment") || extraData[82])
        goto LABEL_139;
    }
    if (self->_headIndent != *((double *)a3 + 3))
      goto LABEL_139;
    if (self->_firstLineHeadIndent != *((double *)a3 + 5))
      goto LABEL_139;
    if (self->_tailIndent != *((double *)a3 + 4))
      goto LABEL_139;
    if (self->_lineSpacing != *((double *)a3 + 1))
      goto LABEL_139;
    v82 = *((_DWORD *)a3 + 18) ^ *(_DWORD *)&self->_flags;
    if ((v82 & 0xF0) != 0
      || self->_paragraphSpacing != *((double *)a3 + 2)
      || self->_minimumLineHeight != *((double *)a3 + 6)
      || self->_maximumLineHeight != *((double *)a3 + 7))
    {
      goto LABEL_139;
    }
    LOBYTE(v47) = 0;
    if ((v82 & 0x2600) != 0 || self->_defaultTabInterval != *((double *)a3 + 10))
      return v47;
    if (self->_tabStops != (NSArray *)*((_QWORD *)a3 + 8))
    {
      LOBYTE(v47) = -[NSArray isEqualToArray:](-[NSParagraphStyle tabStops](self, "tabStops"), "isEqualToArray:", objc_msgSend(a3, "tabStops"));
      return v47;
    }
LABEL_152:
    LOBYTE(v47) = 1;
    return v47;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_139;
  v5 = -[NSParagraphStyle horizontalAlignment](self, "horizontalAlignment");
  if (v5 != objc_msgSend(a3, "horizontalAlignment"))
    goto LABEL_139;
  v6 = -[NSParagraphStyle isFullyJustified](self, "isFullyJustified");
  if (v6 != objc_msgSend(a3, "isFullyJustified"))
    goto LABEL_139;
  -[NSParagraphStyle headIndent](self, "headIndent");
  v8 = v7;
  objc_msgSend(a3, "headIndent");
  if (v8 != v9)
    goto LABEL_139;
  -[NSParagraphStyle firstLineHeadIndent](self, "firstLineHeadIndent");
  v11 = v10;
  objc_msgSend(a3, "firstLineHeadIndent");
  if (v11 != v12)
    goto LABEL_139;
  -[NSParagraphStyle tailIndent](self, "tailIndent");
  v14 = v13;
  objc_msgSend(a3, "tailIndent");
  if (v14 != v15)
    goto LABEL_139;
  -[NSParagraphStyle lineSpacing](self, "lineSpacing");
  v17 = v16;
  objc_msgSend(a3, "lineSpacing");
  if (v17 != v18)
    goto LABEL_139;
  v19 = -[NSParagraphStyle lineBreakMode](self, "lineBreakMode");
  if (v19 != objc_msgSend(a3, "lineBreakMode"))
    goto LABEL_139;
  -[NSParagraphStyle paragraphSpacing](self, "paragraphSpacing");
  v21 = v20;
  objc_msgSend(a3, "paragraphSpacing");
  if (v21 != v22)
    goto LABEL_139;
  -[NSParagraphStyle minimumLineHeight](self, "minimumLineHeight");
  v24 = v23;
  objc_msgSend(a3, "minimumLineHeight");
  if (v24 != v25)
    goto LABEL_139;
  -[NSParagraphStyle maximumLineHeight](self, "maximumLineHeight");
  v27 = v26;
  objc_msgSend(a3, "maximumLineHeight");
  if (v27 != v28)
    goto LABEL_139;
  -[NSParagraphStyle lineHeightMultiple](self, "lineHeightMultiple");
  v30 = v29;
  objc_msgSend(a3, "lineHeightMultiple");
  if (v30 != v31)
    goto LABEL_139;
  -[NSParagraphStyle paragraphSpacingBefore](self, "paragraphSpacingBefore");
  v33 = v32;
  objc_msgSend(a3, "paragraphSpacingBefore");
  if (v33 != v34)
    goto LABEL_139;
  -[NSParagraphStyle hyphenationFactor](self, "hyphenationFactor");
  v36 = v35;
  objc_msgSend(a3, "hyphenationFactor");
  if (v36 != v37)
    goto LABEL_139;
  -[NSParagraphStyle tighteningFactorForTruncation](self, "tighteningFactorForTruncation");
  v39 = v38;
  objc_msgSend(a3, "tighteningFactorForTruncation");
  if (v39 != v40)
    goto LABEL_139;
  v41 = -[NSParagraphStyle headerLevel](self, "headerLevel");
  if (v41 != objc_msgSend(a3, "headerLevel"))
    goto LABEL_139;
  -[NSParagraphStyle defaultTabInterval](self, "defaultTabInterval");
  v43 = v42;
  objc_msgSend(a3, "defaultTabInterval");
  if (v43 != v44)
    goto LABEL_139;
  v45 = -[NSParagraphStyle baseWritingDirection](self, "baseWritingDirection");
  if (v45 != objc_msgSend(a3, "baseWritingDirection"))
    goto LABEL_139;
  v46 = -[NSParagraphStyle tabStops](self, "tabStops");
  if (v46 == (NSArray *)objc_msgSend(a3, "tabStops")
    || (v47 = -[NSArray isEqualToArray:](-[NSParagraphStyle tabStops](self, "tabStops"), "isEqualToArray:", objc_msgSend(a3, "tabStops"))) != 0)
  {
    v48 = -[NSParagraphStyle textBlocks](self, "textBlocks");
    if (v48 == (NSArray *)objc_msgSend(a3, "textBlocks")
      || (v47 = -[NSArray isEqualToArray:](-[NSParagraphStyle textBlocks](self, "textBlocks"), "isEqualToArray:", objc_msgSend(a3, "textBlocks"))) != 0)
    {
      v49 = -[NSParagraphStyle textLists](self, "textLists");
      if (v49 == (NSArray *)objc_msgSend(a3, "textLists")
        || (v47 = -[NSArray isEqualToArray:](-[NSParagraphStyle textLists](self, "textLists"), "isEqualToArray:", objc_msgSend(a3, "textLists"))) != 0)
      {
        v50 = -[NSParagraphStyle allowsDefaultTighteningForTruncation](self, "allowsDefaultTighteningForTruncation");
        if (v50 != objc_msgSend(a3, "allowsDefaultTighteningForTruncation"))
          goto LABEL_139;
        v51 = -[NSParagraphStyle _lineBoundsOptions](self, "_lineBoundsOptions");
        if (v51 != objc_msgSend(a3, "_lineBoundsOptions"))
          goto LABEL_139;
        v52 = -[NSParagraphStyle lineBreakStrategy](self, "lineBreakStrategy");
        if (v52 != objc_msgSend(a3, "lineBreakStrategy"))
          goto LABEL_139;
        v53 = -[NSParagraphStyle usesDefaultHyphenation](self, "usesDefaultHyphenation");
        if (v53 != objc_msgSend(a3, "usesDefaultHyphenation"))
          goto LABEL_139;
        v54 = -[NSParagraphStyle spansAllLines](self, "spansAllLines");
        if (v54 != objc_msgSend(a3, "spansAllLines"))
          goto LABEL_139;
        v55 = -[NSParagraphStyle secondaryLineBreakMode](self, "secondaryLineBreakMode");
        if (v55 != objc_msgSend(a3, "secondaryLineBreakMode"))
          goto LABEL_139;
        v56 = -[NSParagraphStyle _alignmentFollowsWritingDirection](self, "_alignmentFollowsWritingDirection");
        if (v56 != objc_msgSend(a3, "_alignmentFollowsWritingDirection"))
          goto LABEL_139;
        v57 = -[NSParagraphStyle compositionLanguage](self, "compositionLanguage");
        if (v57 != objc_msgSend(a3, "compositionLanguage"))
          goto LABEL_139;
        v58 = -[NSParagraphStyle _presentationIntents](self, "_presentationIntents");
        v59 = MEMORY[0x1E0C9AA60];
        v60 = v58 ? v58 : (NSArray *)MEMORY[0x1E0C9AA60];
        v61 = objc_msgSend(a3, "_presentationIntents");
        v62 = v61 ? v61 : v59;
        v47 = -[NSArray isEqual:](v60, "isEqual:", v62);
        if (v47)
        {
          v63 = -[NSParagraphStyle _listIntentOrdinal](self, "_listIntentOrdinal");
          if (v63 == objc_msgSend(a3, "_listIntentOrdinal"))
          {
            LOBYTE(v47) = -[NSString isEqual:](-[NSParagraphStyle codeBlockIntentLanguageHint](self, "codeBlockIntentLanguageHint"), "isEqual:", objc_msgSend(a3, "codeBlockIntentLanguageHint"));
            return v47;
          }
LABEL_139:
          LOBYTE(v47) = 0;
        }
      }
    }
  }
  return v47;
}

- (unint64_t)hash
{
  int64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  NSArray *tabStops;
  uint64_t v8;
  unint64_t v9;
  id extraData;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;

  v3 = -[NSParagraphStyle horizontalAlignment](self, "horizontalAlignment");
  v4 = -[NSParagraphStyle isFullyJustified](self, "isFullyJustified");
  v5 = 0x10000000;
  if (!v4)
    v5 = 0;
  v6 = v5 + (v3 << 24) + ((uint64_t)self->_headIndent << 16) + ((uint64_t)self->_firstLineHeadIndent << 8);
  tabStops = self->_tabStops;
  if (tabStops)
    v8 = -[NSArray count](tabStops, "count");
  else
    v8 = 12;
  v9 = v6 + v8;
  extraData = self->_extraData;
  if (extraData)
  {
    v12 = (void *)*((_QWORD *)extraData + 6);
    v11 = (void *)*((_QWORD *)extraData + 7);
    if (v12 && objc_msgSend(*((id *)extraData + 6), "count"))
      v9 += objc_msgSend((id)objc_msgSend(v12, "lastObject"), "hash");
    if (v11 && objc_msgSend(v11, "count"))
      v9 += objc_msgSend((id)objc_msgSend(v11, "lastObject"), "hash");
    v13 = -[NSArray hash](-[NSParagraphStyle _presentationIntents](self, "_presentationIntents"), "hash");
    v14 = v9 + -[NSParagraphStyle _listIntentOrdinal](self, "_listIntentOrdinal");
    return v13
         + -[NSString hash](-[NSParagraphStyle codeBlockIntentLanguageHint](self, "codeBlockIntentLanguageHint"), "hash")+ v14;
  }
  return v9;
}

- (BOOL)isFullyJustified
{
  _BYTE *extraData;

  extraData = self->_extraData;
  if (extraData)
    return extraData[82] != 0;
  else
    return (*(_DWORD *)&self->_flags & 0xF) == 3;
}

- (int64_t)horizontalAlignment
{
  _QWORD *extraData;
  unsigned int v4;
  BOOL v5;
  int64_t v6;

  extraData = self->_extraData;
  if (extraData)
    return extraData[15];
  v4 = *(_DWORD *)&self->_flags & 0xF;
  v5 = v4 > 2;
  v6 = v4 + 2;
  if (v5)
    return 0;
  else
    return v6;
}

- (NSString)codeBlockIntentLanguageHint
{
  id extraData;

  extraData = self->_extraData;
  if (extraData)
    return (NSString *)*((_QWORD *)extraData + 14);
  else
    return (NSString *)&stru_1E260C7D0;
}

- (int64_t)_listIntentOrdinal
{
  _QWORD *extraData;

  extraData = self->_extraData;
  if (extraData)
    return extraData[13];
  else
    return 0;
}

- (NSArray)_presentationIntents
{
  id extraData;

  extraData = self->_extraData;
  if (extraData)
    return (NSArray *)*((_QWORD *)extraData + 12);
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

+ (NSWritingDirection)defaultWritingDirectionForLanguage:(NSString *)languageName
{
  NSWritingDirection result;

  if (!languageName)
    return objc_msgSend(a1, "_defaultWritingDirection");
  result = -[NSString length](languageName, "length");
  if (result)
    return (unint64_t)(objc_msgSend(MEMORY[0x1E0C99DC8], "characterDirectionForLanguage:", languageName) == 2);
  return result;
}

- (CGFloat)firstLineHeadIndent
{
  return self->_firstLineHeadIndent;
}

- (CGFloat)tailIndent
{
  return self->_tailIndent;
}

- (id)_initWithParagraphStyle:(id)a3
{
  NSParagraphStyle *v4;
  unsigned int *v5;
  double v6;
  double v7;
  double v8;
  float v9;
  float v10;
  float v11;
  float v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v31;
  unsigned int v32;
  unsigned int v33;
  void *v34;
  uint64_t v35;
  CTTextAlignment v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  NSParagraphStyleExtraData *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  double v45;
  NSParagraphStyleExtraData *v46;
  double v47;
  float64x2_t v49;
  unsigned int v50;
  uint64_t v51;
  int v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  double v57;
  objc_super v58;

  v58.receiver = self;
  v58.super_class = (Class)NSParagraphStyle;
  v4 = -[NSParagraphStyle init](&v58, sel_init);
  v5 = (unsigned int *)v4;
  if (!v4)
    return v5;
  if (!a3)
  {
    v4->_maximumLineHeight = 0.0;
    v36 = NSTextAlignmentToCTTextAlignment(NSTextAlignmentNatural);
    v37 = v5[18] & 0xFFFFFC00;
    *((_QWORD *)v5 + 4) = 0;
    *((_QWORD *)v5 + 8) = 0;
    v5[18] = v37 & 0xFFFFFFF0 | v36 & 0xF | 0x200;
    v5[18] = v5[18] & 0xFFFFC3FF | ((objc_msgSend((id)objc_opt_class(), "_defaultWritingDirection") == 1) << 10) | (__NSAllowsDefaultTightening << 13);
    return v5;
  }
  if (object_getClass(a3) != (Class)__NSParagraphStyleClass
    && object_getClass(a3) != (Class)__NSMutableParagraphStyleClass)
  {
    objc_msgSend(a3, "paragraphSpacingBefore");
    v7 = v6;
    objc_msgSend(a3, "lineHeightMultiple");
    v57 = v8;
    objc_msgSend(a3, "hyphenationFactor");
    v10 = v9;
    objc_msgSend(a3, "tighteningFactorForTruncation");
    v12 = v11;
    v13 = objc_msgSend(a3, "baseWritingDirection");
    v51 = objc_msgSend(a3, "headerLevel");
    v56 = (void *)objc_msgSend(a3, "textBlocks");
    v14 = (void *)objc_msgSend(a3, "textLists");
    v15 = objc_msgSend(a3, "_lineBoundsOptions");
    v16 = objc_msgSend(a3, "lineBreakStrategy");
    v52 = objc_msgSend(a3, "usesDefaultHyphenation");
    v17 = objc_msgSend(a3, "spansAllLines");
    v55 = objc_msgSend(a3, "secondaryLineBreakMode");
    v53 = objc_msgSend(a3, "_alignmentFollowsWritingDirection");
    v54 = objc_msgSend(a3, "compositionLanguage");
    v18 = objc_msgSend(a3, "horizontalAlignment");
    v19 = objc_msgSend(a3, "isFullyJustified");
    v5[18] = v5[18] & 0xFFFFFFF0 | NSTextAlignmentToCTTextAlignment((NSTextAlignment)objc_msgSend(a3, "alignment")) & 0xF;
    objc_msgSend(a3, "lineSpacing");
    *((_QWORD *)v5 + 1) = v20;
    v5[18] = v5[18] & 0xFFFFFF0F | (16 * (objc_msgSend(a3, "lineBreakMode") & 0xF));
    objc_msgSend(a3, "firstLineHeadIndent");
    *((_QWORD *)v5 + 5) = v21;
    objc_msgSend(a3, "paragraphSpacing");
    *((_QWORD *)v5 + 2) = v22;
    objc_msgSend(a3, "headIndent");
    *((_QWORD *)v5 + 3) = v23;
    objc_msgSend(a3, "tailIndent");
    *((_QWORD *)v5 + 4) = v24;
    objc_msgSend(a3, "minimumLineHeight");
    *((_QWORD *)v5 + 6) = v25;
    objc_msgSend(a3, "maximumLineHeight");
    *((_QWORD *)v5 + 7) = v26;
    objc_msgSend(a3, "defaultTabInterval");
    *((_QWORD *)v5 + 10) = v27;
    if (objc_msgSend(a3, "allowsDefaultTighteningForTruncation"))
      v28 = 0x2000;
    else
      v28 = 0;
    v5[18] = v5[18] & 0xFFFFDFFF | v28;
    *((_QWORD *)v5 + 8) = objc_msgSend((id)objc_msgSend(a3, "tabStops"), "copyWithZone:", objc_msgSend(v5, "zone"));
    v29 = v5[18];
    if (v13 == -1)
    {
      v5[18] = v29 & 0xFFFFFCFF | 0x200;
      v30 = v5[18] & 0xFFFFFBFF | ((objc_msgSend((id)objc_opt_class(), "_defaultWritingDirection") == 1) << 10);
    }
    else
    {
      v30 = v29 & 0xFFFFF8FF | ((v13 == 1) << 10);
    }
    v45 = v12;
    v5[18] = v30;
    if (v7 != 0.0
      || (v49 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v57, 0),
          (vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v49, (float64x2_t)xmmword_18D6CBF70), (int32x4_t)vceqq_f64(v49, (float64x2_t)xmmword_18D6CBF80)))) & 1) == 0)|| v56|| v14|| v10 != 0.0|| *(double *)&__NSTightenFactor != v45|| v51|| v15|| v16|| __NSUsesDefaultHyphenation_0 != v52|| (v17 & 1) != 0|| v55|| v54|| objc_msgSend(v5, "_listIntentOrdinal", *(double *)&__NSTightenFactor)|| objc_msgSend((id)objc_msgSend(v5, "_presentationIntents"), "count")|| objc_msgSend((id)objc_msgSend(v5, "codeBlockIntentLanguageHint"), "length")|| v18|| (v19 & 1) != 0
      || v53)
    {
      v5[18] &= 0xFFFFE7FF;
      v46 = -[NSParagraphStyleExtraData init](+[NSParagraphStyleExtraData allocWithZone:](NSParagraphStyleExtraData, "allocWithZone:", objc_msgSend(v5, "zone")), "init");
      *((_QWORD *)v5 + 11) = v46;
      v46->_lineHeightMultiple = v57;
      v46->_paragraphSpacingBefore = v7;
      v46->_tighteningFactor = v45;
      v46->_headerLevel = v51;
      if (v56)
        v46->_textBlocks = (NSArray *)objc_msgSend(v56, "copyWithZone:", objc_msgSend(v5, "zone"));
      if (v14)
        v46->_textLists = (NSArray *)objc_msgSend(v14, "copyWithZone:", objc_msgSend(v5, "zone"));
      v46->_lineBoundsOptions = v15;
      v46->_lineBreakStrategy = v16;
      v46->_compositionLanguage = v54;
      v46->_usesDefaultHyphenation = v52;
      v46->_spansAllLines = v17;
      v46->_secondaryLineBreakMode = v55;
      v46->_alignmentFollowsWritingDirection = v53;
      v47 = 0.0;
      if ((v52 & (v10 == *(float *)&__NSDefaultHyphenationFactor)) == 0)
        v47 = v10;
      v46->_hyphenationFactor = v47;
      v46->_listIntentOrdinal = objc_msgSend(a3, "_listIntentOrdinal");
      v46->_presentationIntents = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "_presentationIntents"), "copy");
      v46->_codeBlockIntentLanguageHint = (NSString *)objc_msgSend((id)objc_msgSend(a3, "codeBlockIntentLanguageHint"), "copy");
      v46->_horizontalAlignment = v18;
      v46->_fullyJustified = v19;
      goto LABEL_32;
    }
    if (v57 == 1.0)
    {
      v50 = v5[18] & 0xFFFFE7FF | 0x800;
    }
    else if (v57 == 1.5)
    {
      v50 = v5[18] & 0xFFFFE7FF | 0x1000;
    }
    else
    {
      if (v57 != 2.0)
        goto LABEL_32;
      v50 = v5[18] | 0x1800;
    }
    v5[18] = v50;
LABEL_32:
    if (objc_msgSend(a3, "_presentationIntents"))
      *(_QWORD *)(*((_QWORD *)v5 + 11) + 96) = objc_msgSend((id)objc_msgSend(a3, "_presentationIntents"), "copy");
    return v5;
  }
  v31 = objc_msgSend(a3, "baseWritingDirection");
  v32 = v5[18] & 0xFFFFFFF0 | *((_DWORD *)a3 + 18) & 0xF;
  v5[18] = v32;
  *((_QWORD *)v5 + 3) = *((_QWORD *)a3 + 3);
  *((_QWORD *)v5 + 4) = *((_QWORD *)a3 + 4);
  *((_QWORD *)v5 + 1) = *((_QWORD *)a3 + 1);
  v33 = v32 & 0xFFFFFF0F | (16 * ((*((_DWORD *)a3 + 18) >> 4) & 0xF));
  v5[18] = v33;
  *((_QWORD *)v5 + 5) = *((_QWORD *)a3 + 5);
  *((_QWORD *)v5 + 2) = *((_QWORD *)a3 + 2);
  *((_QWORD *)v5 + 6) = *((_QWORD *)a3 + 6);
  *((_QWORD *)v5 + 7) = *((_QWORD *)a3 + 7);
  v34 = (void *)*((_QWORD *)a3 + 8);
  if (v34)
  {
    v35 = objc_msgSend(v34, "copyWithZone:", objc_msgSend(v5, "zone"));
    v33 = v5[18];
  }
  else
  {
    v35 = 0;
  }
  *((_QWORD *)v5 + 8) = v35;
  v5[18] = v33 & 0xFFFFFEFF;
  v38 = *((_DWORD *)a3 + 18) & 0x1800 | v33 & 0xFFFFE6FF;
  v5[18] = v38;
  v39 = v38 & 0xFFFFDFFF | *((_DWORD *)a3 + 18) & 0x2000;
  v5[18] = v39;
  *((_QWORD *)v5 + 10) = *((_QWORD *)a3 + 10);
  if (v31 == -1)
  {
    v5[18] = v39 | 0x200;
    v40 = v5[18] & 0xFFFFFBFF | ((objc_msgSend((id)objc_opt_class(), "_defaultWritingDirection") == 1) << 10);
  }
  else
  {
    v40 = v39 & 0xFFFFF8FF | ((v31 == 1) << 10);
  }
  v5[18] = v40;
  if (*((_QWORD *)a3 + 11))
  {
    v41 = -[NSParagraphStyleExtraData init](+[NSParagraphStyleExtraData allocWithZone:](NSParagraphStyleExtraData, "allocWithZone:", objc_msgSend(v5, "zone")), "init");
    *((_QWORD *)v5 + 11) = v41;
    v42 = *((_QWORD *)a3 + 11);
    v41->_lineHeightMultiple = *(double *)(v42 + 8);
    v41->_paragraphSpacingBefore = *(double *)(v42 + 16);
    v41->_hyphenationFactor = *(double *)(v42 + 24);
    v41->_tighteningFactor = *(double *)(v42 + 32);
    v41->_headerLevel = *(_QWORD *)(v42 + 40);
    v43 = *(void **)(v42 + 48);
    if (v43)
      v41->_textBlocks = (NSArray *)objc_msgSend(v43, "copyWithZone:", objc_msgSend(v5, "zone"));
    v44 = *(void **)(v42 + 56);
    if (v44)
      v41->_textLists = (NSArray *)objc_msgSend(v44, "copyWithZone:", objc_msgSend(v5, "zone"));
    v41->_lineBoundsOptions = *(_QWORD *)(v42 + 64);
    v41->_lineBreakStrategy = *(_QWORD *)(v42 + 72);
    v41->_usesDefaultHyphenation = *(_BYTE *)(v42 + 80);
    v41->_spansAllLines = *(_BYTE *)(v42 + 81);
    v41->_secondaryLineBreakMode = *(_QWORD *)(v42 + 128);
    v41->_alignmentFollowsWritingDirection = *(_BYTE *)(v42 + 83);
    v41->_compositionLanguage = *(_QWORD *)(v42 + 88);
    v41->_presentationIntents = (NSArray *)objc_msgSend(*(id *)(v42 + 96), "copy");
    v41->_listIntentOrdinal = *(_QWORD *)(v42 + 104);
    v41->_codeBlockIntentLanguageHint = (NSString *)objc_msgSend(*(id *)(v42 + 112), "copy");
    v41->_horizontalAlignment = *(_QWORD *)(v42 + 120);
    v41->_fullyJustified = *(_BYTE *)(v42 + 82);
  }
  return v5;
}

- (BOOL)_isSuitableForFastStringDrawingWithAlignment:(int64_t *)a3 mirrorsTextAlignment:(BOOL)a4 lineBreakMode:(int64_t *)a5 tighteningFactorForTruncation:(double *)a6
{
  _BOOL4 v8;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSArray *v17;
  BOOL v18;
  NSWritingDirection v19;
  uint64_t v20;
  NSTextAlignment v21;
  int64_t v22;
  double *extraData;
  double v24;
  void *v26;
  int v28;
  BOOL v29;
  double *v30;
  NSWritingDirection v31;
  uint64_t v32;
  NSTextAlignment v33;
  int64_t v34;
  float v35;

  v8 = a4;
  if (object_getClass(self) == (Class)__NSParagraphStyleClass
    || object_getClass(self) == (Class)__NSMutableParagraphStyleClass)
  {
    if (self->_headIndent != 0.0
      || self->_tailIndent != 0.0
      || self->_firstLineHeadIndent != 0.0
      || self->_minimumLineHeight != 0.0
      || self->_maximumLineHeight != 0.0
      || (*(_DWORD *)&self->_flags & 0x400) != 0)
    {
LABEL_40:
      -[NSParagraphStyle baseWritingDirection](self, "baseWritingDirection");
      return 0;
    }
    extraData = (double *)self->_extraData;
    if (extraData)
    {
      v24 = extraData[1];
      if (v24 != 0.0 && v24 != 1.0)
        goto LABEL_40;
      v26 = (void *)*((_QWORD *)extraData + 6);
      if (v26)
      {
        if (objc_msgSend(v26, "count"))
          goto LABEL_40;
      }
      if (-[NSParagraphStyle alignment](self, "alignment") == NSTextAlignmentJustified && *((_BYTE *)extraData + 81))
        goto LABEL_40;
      v29 = *((_BYTE *)extraData + 83) == 0;
      if (a6 && !*((_BYTE *)extraData + 83))
      {
        v30 = extraData + 4;
        goto LABEL_48;
      }
    }
    else
    {
      v28 = *(_DWORD *)&self->_flags & 0x1000;
      v29 = v28 == 0;
      if (a6 && !v28)
      {
        v30 = (double *)&__NSTightenFactor;
LABEL_48:
        *a6 = *v30;
        v31 = -[NSParagraphStyle baseWritingDirection](self, "baseWritingDirection");
LABEL_50:
        v32 = v31;
        if (v31 == NSWritingDirectionRightToLeft
          || v31 == NSWritingDirectionNatural && objc_msgSend((id)objc_opt_class(), "_defaultWritingDirection") == 1)
        {
          return 0;
        }
        if (a3)
        {
          v33 = -[NSParagraphStyle alignment](self, "alignment");
          *a3 = v33;
          if ((unint64_t)(v33 - 3) <= 1)
          {
            if (v32 == -1)
              v32 = objc_msgSend((id)objc_opt_class(), "_defaultWritingDirection");
            v34 = 2 * (v32 == 1);
            goto LABEL_58;
          }
          if (v8)
          {
            if (v33 == NSTextAlignmentLeft)
            {
              v34 = 2;
              goto LABEL_58;
            }
            if (v33 == NSTextAlignmentRight)
            {
              v34 = 0;
LABEL_58:
              *a3 = v34;
            }
          }
        }
        if (a5)
          *a5 = (uint64_t)(int)(*(_DWORD *)&self->_flags << 24) >> 28;
        return 1;
      }
    }
    v31 = -[NSParagraphStyle baseWritingDirection](self, "baseWritingDirection");
    if (!v29)
      return 0;
    goto LABEL_50;
  }
  -[NSParagraphStyle headIndent](self, "headIndent");
  if (v11 != 0.0)
    goto LABEL_40;
  -[NSParagraphStyle tailIndent](self, "tailIndent");
  if (v12 != 0.0)
    goto LABEL_40;
  -[NSParagraphStyle firstLineHeadIndent](self, "firstLineHeadIndent");
  if (v13 != 0.0)
    goto LABEL_40;
  -[NSParagraphStyle minimumLineHeight](self, "minimumLineHeight");
  if (v14 != 0.0)
    goto LABEL_40;
  -[NSParagraphStyle maximumLineHeight](self, "maximumLineHeight");
  if (v15 != 0.0)
    goto LABEL_40;
  -[NSParagraphStyle lineHeightMultiple](self, "lineHeightMultiple");
  if (v16 != 0.0 && v16 != 1.0)
    goto LABEL_40;
  v17 = -[NSParagraphStyle textBlocks](self, "textBlocks");
  if (v17)
  {
    if (-[NSArray count](v17, "count"))
      goto LABEL_40;
  }
  if (-[NSParagraphStyle alignment](self, "alignment") == NSTextAlignmentJustified
    && -[NSParagraphStyle spansAllLines](self, "spansAllLines"))
  {
    goto LABEL_40;
  }
  v18 = -[NSParagraphStyle _alignmentFollowsWritingDirection](self, "_alignmentFollowsWritingDirection");
  v19 = -[NSParagraphStyle baseWritingDirection](self, "baseWritingDirection");
  if (v18)
    return 0;
  v20 = v19;
  if (v19 == NSWritingDirectionRightToLeft
    || v19 == NSWritingDirectionNatural && objc_msgSend((id)objc_opt_class(), "_defaultWritingDirection") == 1)
  {
    return 0;
  }
  if (a3)
  {
    v21 = -[NSParagraphStyle alignment](self, "alignment");
    *a3 = v21;
    if ((unint64_t)(v21 - 3) > 1)
    {
      if (!v8)
        goto LABEL_69;
      if (v21)
      {
        if (v21 != NSTextAlignmentRight)
          goto LABEL_69;
        v22 = 0;
      }
      else
      {
        v22 = 2;
      }
    }
    else
    {
      if (v20 == -1)
        v20 = objc_msgSend((id)objc_opt_class(), "_defaultWritingDirection");
      v22 = 2 * (v20 == 1);
    }
    *a3 = v22;
  }
LABEL_69:
  if (a5)
    *a5 = -[NSParagraphStyle lineBreakMode](self, "lineBreakMode");
  if (a6)
  {
    -[NSParagraphStyle tighteningFactorForTruncation](self, "tighteningFactorForTruncation");
    *a6 = v35;
  }
  return 1;
}

+ (int64_t)_defaultWritingDirection
{
  int64_t v2;
  void *v4;
  __CFBundle *MainBundle;
  __CFBundle *v6;
  const __CFArray *v7;
  const __CFArray *v8;
  CFArrayRef v9;
  CFArrayRef v10;
  const __CFBoolean *ValueForInfoDictionaryKey;
  const __CFBoolean *v13;
  CFTypeID v14;

  v2 = _defaultWritingDirection_defaultDirection;
  if (_defaultWritingDirection_defaultDirection == -1)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    if ((objc_msgSend(v4, "BOOLForKey:", CFSTR("NSForceRightToLeftWritingDirection")) & 1) != 0)
    {
      v2 = 1;
LABEL_12:
      _defaultWritingDirection_defaultDirection = v2;
      return v2;
    }
    MainBundle = CFBundleGetMainBundle();
    if (!MainBundle || (v6 = MainBundle, (v7 = CFBundleCopyBundleLocalizations(MainBundle)) == 0))
    {
      v2 = 0;
      goto LABEL_12;
    }
    v8 = v7;
    v9 = CFBundleCopyPreferredLocalizationsFromArray(v7);
    if (v9)
    {
      v10 = v9;
      v2 = objc_msgSend(a1, "defaultWritingDirectionForLanguage:", -[__CFArray objectAtIndex:](v9, "objectAtIndex:", 0));
      CFRelease(v10);
      if (v2 != 1)
      {
LABEL_10:
        CFRelease(v8);
        goto LABEL_12;
      }
      if ((objc_msgSend(v4, "BOOLForKey:", CFSTR("NSForceLeftToRightWritingDirection")) & 1) == 0)
      {
        ValueForInfoDictionaryKey = (const __CFBoolean *)CFBundleGetValueForInfoDictionaryKey(v6, CFSTR("NSForceLeftToRightWritingDirection"));
        if (!ValueForInfoDictionaryKey
          || ((v13 = ValueForInfoDictionaryKey, v14 = CFGetTypeID(ValueForInfoDictionaryKey),
                                                CFBooleanGetTypeID() != v14)
           || !CFBooleanGetValue(v13))
          && (CFNumberGetTypeID() != v14 || (-[__CFBoolean BOOLValue](v13, "BOOLValue") & 1) == 0)
          && (CFStringGetTypeID() != v14
           || CFStringGetLength((CFStringRef)v13) < 1
           || CFStringGetCharacterAtIndex((CFStringRef)v13, 0) != 89
           && CFStringGetCharacterAtIndex((CFStringRef)v13, 0) != 121))
        {
          v2 = 1;
          goto LABEL_10;
        }
      }
    }
    v2 = 0;
    goto LABEL_10;
  }
  return v2;
}

- (NSWritingDirection)baseWritingDirection
{
  unint64_t flags;

  flags = self->_flags;
  if ((flags & 0x200) != 0)
    return -1;
  else
    return (flags >> 10) & 1;
}

- (NSTextAlignment)alignment
{
  return NSTextAlignmentFromCTTextAlignment((CTTextAlignment)(*(_DWORD *)&self->_flags & 0xF));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NSParagraphStyle _initWithParagraphStyle:](+[NSMutableParagraphStyle allocWithZone:](NSMutableParagraphStyle, "allocWithZone:", -[NSParagraphStyle zone](self, "zone", a3)), "_initWithParagraphStyle:", self);
}

- (CGFloat)headIndent
{
  return self->_headIndent;
}

- (NSLineBreakMode)lineBreakMode
{
  return (uint64_t)(int)(*(_DWORD *)&self->_flags << 24) >> 28;
}

- (CGFloat)lineHeightMultiple
{
  double *extraData;
  unsigned int v4;

  extraData = (double *)self->_extraData;
  if (extraData)
    return extraData[1];
  v4 = (*(_DWORD *)&self->_flags >> 11) & 3;
  if (v4)
    return ((double)v4 + 1.0) * 0.5;
  else
    return 0.0;
}

- (CGFloat)maximumLineHeight
{
  return self->_maximumLineHeight;
}

- (CGFloat)minimumLineHeight
{
  return self->_minimumLineHeight;
}

- (NSArray)textBlocks
{
  id extraData;
  NSArray *result;
  NSArray *v4;

  extraData = self->_extraData;
  result = (NSArray *)MEMORY[0x1E0C9AA60];
  if (extraData)
  {
    v4 = (NSArray *)*((_QWORD *)extraData + 6);
    if (v4)
      return v4;
  }
  return result;
}

- (NSArray)textLists
{
  id extraData;
  NSArray *result;
  NSArray *v4;

  extraData = self->_extraData;
  result = (NSArray *)MEMORY[0x1E0C9AA60];
  if (extraData)
  {
    v4 = (NSArray *)*((_QWORD *)extraData + 7);
    if (v4)
      return v4;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSParagraphStyle;
  -[NSParagraphStyle dealloc](&v3, sel_dealloc);
}

uint64_t __41__NSParagraphStyle_defaultParagraphStyle__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_allocWithZone((Class)NSParagraphStyle), "init");
  defaultParagraphStyle_paraStyle = result;
  return result;
}

- (NSParagraphStyle)init
{
  return (NSParagraphStyle *)-[NSParagraphStyle _initWithParagraphStyle:](self, "_initWithParagraphStyle:", 0);
}

- (CGFloat)lineSpacing
{
  return self->_lineSpacing;
}

- (CGFloat)defaultTabInterval
{
  return self->_defaultTabInterval;
}

- (void)_allocExtraData
{
  NSParagraphStyleExtraData *v4;
  double v5;
  double v6;
  float v7;
  NSInteger v8;
  unsigned int v9;

  if (!self->_extraData)
  {
    if (objc_getAssociatedObject(self, a2))
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSParagraphStyle.m"), 610, CFSTR("_allocExtraData is not reentrant!"));
    objc_setAssociatedObject(self, a2, MEMORY[0x1E0C9AAB0], (void *)1);
    v4 = -[NSParagraphStyleExtraData init](+[NSParagraphStyleExtraData allocWithZone:](NSParagraphStyleExtraData, "allocWithZone:", -[NSParagraphStyle zone](self, "zone")), "init");
    -[NSParagraphStyle lineHeightMultiple](self, "lineHeightMultiple");
    v4->_lineHeightMultiple = v5;
    -[NSParagraphStyle paragraphSpacingBefore](self, "paragraphSpacingBefore");
    v4->_paragraphSpacingBefore = v6;
    v4->_hyphenationFactor = 0.0;
    -[NSParagraphStyle tighteningFactorForTruncation](self, "tighteningFactorForTruncation");
    v4->_tighteningFactor = v7;
    v8 = -[NSParagraphStyle headerLevel](self, "headerLevel");
    v4->_presentationIntents = 0;
    v4->_textBlocks = 0;
    v4->_textLists = 0;
    v4->_headerLevel = v8;
    v4->_lineBoundsOptions = -[NSParagraphStyle _lineBoundsOptions](self, "_lineBoundsOptions");
    v4->_lineBreakStrategy = -[NSParagraphStyle lineBreakStrategy](self, "lineBreakStrategy");
    v4->_usesDefaultHyphenation = -[NSParagraphStyle usesDefaultHyphenation](self, "usesDefaultHyphenation");
    v4->_spansAllLines = -[NSParagraphStyle spansAllLines](self, "spansAllLines");
    v4->_secondaryLineBreakMode = -[NSParagraphStyle secondaryLineBreakMode](self, "secondaryLineBreakMode");
    v4->_alignmentFollowsWritingDirection = -[NSParagraphStyle _alignmentFollowsWritingDirection](self, "_alignmentFollowsWritingDirection");
    v4->_compositionLanguage = -[NSParagraphStyle compositionLanguage](self, "compositionLanguage");
    v4->_listIntentOrdinal = -[NSParagraphStyle listIntentOrdinal](self, "listIntentOrdinal");
    v4->_codeBlockIntentLanguageHint = (NSString *)-[NSString copy](-[NSParagraphStyle codeBlockIntentLanguageHint](self, "codeBlockIntentLanguageHint"), "copy");
    v9 = *(_DWORD *)&self->_flags & 0xF;
    if (v9 <= 4)
    {
      v4->_horizontalAlignment = qword_18D6CBF40[v9];
      v4->_fullyJustified = 0x1000000uLL >> (8 * v9);
    }
    self->_extraData = v4;
    objc_setAssociatedObject(self, a2, 0, (void *)1);
  }
}

- (unint64_t)_lineBoundsOptions
{
  _QWORD *extraData;
  unint64_t v4;
  _BOOL4 v5;
  uint64_t v6;
  unint64_t v7;

  extraData = self->_extraData;
  if (extraData)
    v4 = extraData[8];
  else
    v4 = 0;
  if (object_getClass(self) != (Class)__NSParagraphStyleClass
    && object_getClass(self) != (Class)__NSMutableParagraphStyleClass)
  {
    v5 = -[NSParagraphStyle allowsHangingPunctuation](self, "allowsHangingPunctuation");
    v6 = 4;
    if (!v5)
      v6 = 0;
    v7 = v6 | v4 & 0xFFFFFFFFFFFFFFFBLL;
    if (-[NSParagraphStyle usesOpticalAlignment](self, "usesOpticalAlignment"))
      return v7 | 0x10;
    else
      return v7 & 0xFFFFFFFFFFFFFFEFLL;
  }
  return v4;
}

- (float)hyphenationFactor
{
  double *extraData;
  float v3;
  float result;

  extraData = (double *)self->_extraData;
  if (extraData)
  {
    v3 = extraData[3];
    if (v3 != 0.0)
      return v3;
  }
  else
  {
    v3 = 0.0;
  }
  if (-[NSParagraphStyle usesDefaultHyphenation](self, "usesDefaultHyphenation"))
  {
    objc_msgSend((id)objc_opt_class(), "_defaultHyphenationFactor");
    return result;
  }
  return v3;
}

- (BOOL)usesDefaultHyphenation
{
  char *extraData;
  BOOL *v3;

  extraData = (char *)self->_extraData;
  if (extraData)
    v3 = (BOOL *)(extraData + 80);
  else
    v3 = (BOOL *)&__NSUsesDefaultHyphenation_0;
  return *v3;
}

- (BOOL)spansAllLines
{
  _BYTE *extraData;

  extraData = self->_extraData;
  return extraData && extraData[81] != 0;
}

- (BOOL)_alignmentFollowsWritingDirection
{
  _BYTE *extraData;

  extraData = self->_extraData;
  return extraData && extraData[83] != 0;
}

- (int64_t)compositionLanguage
{
  _QWORD *extraData;

  extraData = self->_extraData;
  if (extraData)
    return extraData[11];
  else
    return 0;
}

- (NSLineBreakStrategy)lineBreakStrategy
{
  _QWORD *extraData;

  extraData = self->_extraData;
  if (extraData)
    return extraData[9];
  else
    return 0;
}

- (CGFloat)paragraphSpacingBefore
{
  double *extraData;

  extraData = (double *)self->_extraData;
  if (extraData)
    return extraData[2];
  else
    return 0.0;
}

- (float)tighteningFactorForTruncation
{
  char *extraData;
  double *v3;

  extraData = (char *)self->_extraData;
  if (extraData)
    v3 = (double *)(extraData + 32);
  else
    v3 = (double *)&__NSTightenFactor;
  return *v3;
}

- (NSInteger)headerLevel
{
  _QWORD *extraData;

  extraData = self->_extraData;
  if (extraData)
    return extraData[5];
  else
    return 0;
}

- (BOOL)allowsDefaultTighteningForTruncation
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (CGFloat)paragraphSpacing
{
  return self->_paragraphSpacing;
}

- (NSArray)tabStops
{
  NSArray *result;

  result = self->_tabStops;
  if (!result)
  {
    if (defaultTabStops_onceToken != -1)
      dispatch_once(&defaultTabStops_onceToken, &__block_literal_global_394);
    return (NSArray *)defaultTabStops_array;
  }
  return result;
}

+ (NSParagraphStyle)defaultParagraphStyle
{
  if (defaultParagraphStyle_once != -1)
    dispatch_once(&defaultParagraphStyle_once, &__block_literal_global_17);
  return (NSParagraphStyle *)defaultParagraphStyle_paraStyle;
}

+ (void)initialize
{
  void *v2;
  float v3;
  float v4;
  char v5;
  int v6;

  if (__NSParagraphStyleClass)
    return;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  objc_msgSend(v2, "floatForKey:", CFSTR("NSTighteningFactorForTruncation"));
  v4 = v3;
  __NSParagraphStyleClass = objc_opt_class();
  __NSMutableParagraphStyleClass = objc_opt_class();
  if (v4 > 0.0 || v4 == 0.0 && objc_msgSend(v2, "objectForKey:", CFSTR("NSTighteningFactorForTruncation")))
    *(double *)&__NSTightenFactor = v4;
  if (objc_msgSend(v2, "objectForKey:", CFSTR("NSAllowsDefaultTighteningForTruncation")))
  {
    v5 = objc_msgSend(v2, "BOOLForKey:", CFSTR("NSAllowsDefaultTighteningForTruncation"));
  }
  else
  {
    if (!__NSAllowsDefaultTightening || (dyld_program_sdk_at_least() & 1) != 0)
      goto LABEL_9;
    v5 = 0;
  }
  __NSAllowsDefaultTightening = v5;
LABEL_9:
  if (objc_msgSend(v2, "objectForKey:", CFSTR("NSUsesDefaultHyphenation")))
    __NSUsesDefaultHyphenation_0 = objc_msgSend(v2, "BOOLForKey:", CFSTR("NSUsesDefaultHyphenation"));
  if (objc_msgSend(v2, "objectForKey:", CFSTR("NSDefaultHyphenationFactor")))
  {
    objc_msgSend(v2, "floatForKey:", CFSTR("NSDefaultHyphenationFactor"));
    __NSDefaultHyphenationFactor = v6;
  }
  if (objc_msgSend(v2, "objectForKey:", CFSTR("NSUsesOptimalLineBreaking")))
    __NSUsesOptimalLineBreaking = objc_msgSend(v2, "BOOLForKey:", CFSTR("NSUsesOptimalLineBreaking"));
  if (objc_msgSend(v2, "objectForKey:", CFSTR("NSUsesOptimalLineBreakingForNonJustifiedAlignments")))
    __NSUsesOptimalLineBreakingForNonJustifiedAlignments = objc_msgSend(v2, "BOOLForKey:", CFSTR("NSUsesOptimalLineBreakingForNonJustifiedAlignments"));
}

+ (float)_defaultHyphenationFactor
{
  return *(float *)&__NSDefaultHyphenationFactor;
}

- (int64_t)secondaryLineBreakMode
{
  _QWORD *extraData;

  extraData = self->_extraData;
  if (extraData)
    return extraData[16];
  else
    return 0;
}

- (BOOL)allowsHangingPunctuation
{
  unsigned __int8 *extraData;
  _BOOL4 v3;

  extraData = (unsigned __int8 *)self->_extraData;
  if (extraData)
    return (extraData[64] >> 2) & 1;
  else
    LOBYTE(v3) = 0;
  return v3;
}

- (BOOL)usesOpticalAlignment
{
  unsigned __int8 *extraData;
  _BOOL4 v3;

  extraData = (unsigned __int8 *)self->_extraData;
  if (extraData)
    return (extraData[64] >> 4) & 1;
  else
    LOBYTE(v3) = 0;
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  $22B4A0797DCB34CD9773A3EA0AC32B0B flags;
  double v6;
  double v7;
  unsigned int v8;
  double *extraData;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  $22B4A0797DCB34CD9773A3EA0AC32B0B v20;
  $22B4A0797DCB34CD9773A3EA0AC32B0B v21;
  uint64_t v22;
  $22B4A0797DCB34CD9773A3EA0AC32B0B v23;
  double lineSpacing;
  __int16 v25;
  float v26;
  uint64_t v27;
  double paragraphSpacing;
  float v29;
  double headIndent;
  float v31;
  double tailIndent;
  float v33;
  double firstLineHeadIndent;
  float v35;
  double minimumLineHeight;
  float v37;
  double maximumLineHeight;
  float v39;
  float v40;
  float v41;
  double defaultTabInterval;
  float v43;
  float v44;
  float v45;
  float v46;
  void *v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  _BOOL4 v52;
  __int16 v53;
  char v54;
  char v55;
  float v56[16];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  flags = self->_flags;
  v6 = 0.0;
  if (((*(unsigned int *)&flags >> 11) & 3) != 0)
    v7 = ((double)((*(unsigned int *)&flags >> 11) & 3) + 1.0) * 0.5;
  else
    v7 = 0.0;
  v8 = *(_DWORD *)&self->_flags & 0xF;
  if (v8 > 4)
  {
    LOBYTE(v48) = 0;
    v49 = 0;
  }
  else
  {
    v48 = 0x1000000uLL >> (8 * v8);
    v49 = qword_18D6CBF40[v8];
  }
  extraData = (double *)self->_extraData;
  if (extraData)
  {
    v7 = extraData[1];
    v10 = extraData[2];
    v6 = extraData[3];
    v11 = extraData[4];
    v12 = (double)*((uint64_t *)extraData + 5);
    v14 = *((_QWORD *)extraData + 6);
    v13 = *((_QWORD *)extraData + 7);
    v16 = *((_QWORD *)extraData + 8);
    v15 = *((_QWORD *)extraData + 9);
    LODWORD(v50) = *((unsigned __int8 *)extraData + 80);
    HIDWORD(v50) = *((_BYTE *)extraData + 81) != 0;
    v17 = *((_QWORD *)extraData + 11);
    v18 = *((_QWORD *)extraData + 15);
    v19 = *((_QWORD *)extraData + 16);
    v51 = *((_BYTE *)extraData + 82) != 0;
    v52 = *((unsigned __int8 *)extraData + 83) != 0;
  }
  else
  {
    v14 = 0;
    v13 = 0;
    v16 = 0;
    v15 = 0;
    v51 = 0;
    v19 = 0;
    v17 = 0;
    v18 = 0;
    v52 = 0;
    v50 = __NSUsesDefaultHyphenation_0;
    v11 = *(double *)&__NSTightenFactor;
    v12 = 0.0;
    v10 = 0.0;
  }
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    v20 = self->_flags;
    if ((*(_BYTE *)&v20 & 0xF) != 0)
    {
      objc_msgSend(a3, "encodeInteger:forKey:");
      v20 = self->_flags;
    }
    if (*(_BYTE *)&v20 >> 4)
      objc_msgSend(a3, "encodeInteger:forKey:", (uint64_t)(int)(*(_DWORD *)&v20 << 24) >> 28, CFSTR("NSLineBreakMode"));
    if (self->_lineSpacing != 0.0)
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSLineSpacing"));
    if (self->_paragraphSpacing != 0.0)
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSParagraphSpacing"));
    if (self->_headIndent != 0.0)
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSHeadIndent"));
    if (self->_firstLineHeadIndent != 0.0)
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSFirstLineHeadIndent"));
    if (self->_tailIndent != 0.0)
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSTailIndent"));
    if (self->_minimumLineHeight != 0.0)
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSMinLineHeight"));
    if (self->_maximumLineHeight != 0.0)
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSMaxLineHeight"));
    if (v7 != 0.0)
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSLineHeightMultiple"), v7);
    if (v10 != 0.0)
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSParagraphSpacingBefore"), v10);
    if (self->_defaultTabInterval != 0.0)
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSDefaultTabInterval"));
    if (v6 != 0.0)
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSHyphenationFactor"), v6);
    if (v11 != *(double *)&__NSTightenFactor)
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSTighteningFactorForTruncation"), v11);
    if (v12 != 0.0)
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSHeaderLevel"), v12);
    if (self->_tabStops && (*((_BYTE *)&self->_flags + 1) & 1) != 0)
    {
      v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", self->_tabStops);
      objc_msgSend(a3, "encodeObject:forKey:", v47, CFSTR("NSTabStops"));

      if (!v14)
        goto LABEL_45;
    }
    else
    {
      objc_msgSend(a3, "encodeObject:forKey:");
      if (!v14)
      {
LABEL_45:
        if (v13)
          objc_msgSend(a3, "encodeObject:forKey:", v13, CFSTR("NSTextLists"));
        v21 = self->_flags;
        if ((*(_WORD *)&v21 & 0x200) == 0)
        {
          if ((*(_WORD *)&v21 & 0x400) != 0)
            v22 = 2;
          else
            v22 = 1;
          objc_msgSend(a3, "encodeInteger:forKey:", v22, CFSTR("NSWritingDirection"));
        }
        if (v16)
          objc_msgSend(a3, "encodeInteger:forKey:", v16, CFSTR("NSLineBoundsOptions"));
        if ((*((_BYTE *)&self->_flags + 1) & 0x20) != 0)
          objc_msgSend(a3, "encodeInteger:forKey:", 1, CFSTR("NSAllowsTighteningForTruncation"));
        if (v15)
          objc_msgSend(a3, "encodeInteger:forKey:", v15, CFSTR("NSLineBreakStrategy"));
        if ((_DWORD)v50)
          objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSUsesDefaultHyphenation"));
        if (HIDWORD(v50))
          objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSSpansAllLines"));
        if (v19)
          objc_msgSend(a3, "encodeInteger:forKey:", v19, CFSTR("NSSecondaryLineBreakMode"));
        if (v17)
          objc_msgSend(a3, "encodeInteger:forKey:", v17, CFSTR("NSCompositionLanguage"));
        if (v18 && (v18 != v49 || v51 != v48))
          objc_msgSend(a3, "encodeInteger:forKey:", v18, CFSTR("NSTextHorizontalAlignment"));
        if (v51 && (!(_BYTE)v48 || v18 != v49))
          objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSFullyJustified"));
        if (v52)
          objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSAlignmentFollowsWritingDirection"));
        return;
      }
    }
    objc_msgSend(a3, "encodeObject:forKey:", v14, CFSTR("NSTextBlocks"));
    goto LABEL_45;
  }
  v23 = self->_flags;
  v55 = *(_BYTE *)&v23 & 0xF;
  v54 = *(_BYTE *)&v23 >> 4;
  v53 = 0;
  lineSpacing = self->_lineSpacing;
  if (lineSpacing == 0.0)
  {
    v25 = 0;
    v27 = 0;
  }
  else
  {
    v25 = 1;
    v53 = 1;
    v26 = lineSpacing;
    v56[0] = v26;
    v27 = 1;
  }
  paragraphSpacing = self->_paragraphSpacing;
  if (paragraphSpacing != 0.0)
  {
    v25 |= 2u;
    v53 = v25;
    v29 = paragraphSpacing;
    v56[v27++] = v29;
  }
  headIndent = self->_headIndent;
  if (headIndent != 0.0)
  {
    v25 |= 4u;
    v53 = v25;
    v31 = headIndent;
    v56[v27++] = v31;
  }
  tailIndent = self->_tailIndent;
  if (tailIndent != 0.0)
  {
    v25 |= 8u;
    v53 = v25;
    v33 = tailIndent;
    v56[v27++] = v33;
  }
  firstLineHeadIndent = self->_firstLineHeadIndent;
  if (firstLineHeadIndent != 0.0)
  {
    v25 |= 0x10u;
    v53 = v25;
    v35 = firstLineHeadIndent;
    v56[v27++] = v35;
  }
  minimumLineHeight = self->_minimumLineHeight;
  if (minimumLineHeight != 0.0)
  {
    v25 |= 0x20u;
    v53 = v25;
    v37 = minimumLineHeight;
    v56[v27++] = v37;
  }
  maximumLineHeight = self->_maximumLineHeight;
  if (maximumLineHeight != 0.0)
  {
    v25 |= 0x40u;
    v53 = v25;
    v39 = maximumLineHeight;
    v56[v27++] = v39;
  }
  if (v7 != 0.0)
  {
    v25 |= 0x80u;
    v53 = v25;
    v40 = v7;
    v56[v27++] = v40;
  }
  if (v10 != 0.0)
  {
    v25 |= 0x100u;
    v53 = v25;
    v41 = v10;
    v56[v27++] = v41;
  }
  defaultTabInterval = self->_defaultTabInterval;
  if (defaultTabInterval != 0.0)
  {
    v25 |= 0x200u;
    v53 = v25;
    v43 = defaultTabInterval;
    v56[v27++] = v43;
  }
  if (v6 != 0.0)
  {
    v25 |= 0x400u;
    v53 = v25;
    v44 = v6;
    v56[v27++] = v44;
  }
  if (v11 != *(double *)&__NSTightenFactor)
  {
    v25 |= 0x800u;
    v53 = v25;
    v45 = v11;
    v56[v27++] = v45;
  }
  if (v12 != 0.0)
  {
    v53 = v25 | 0x1000;
    v46 = v12;
    v56[v27++] = v46;
  }
  objc_msgSend(a3, "encodeValuesOfObjCTypes:", "CC@S", &v55, &v54, &self->_tabStops, &v53);
  if (v53)
    objc_msgSend(a3, "encodeArrayOfObjCType:count:at:", "f", v27, v56);
}

- (NSParagraphStyle)initWithCoder:(id)a3
{
  double v4;
  int v5;
  char *v6;
  uint64_t v7;
  char v8;
  unint64_t v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t v12;
  BOOL v13;
  unsigned __int16 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  id v34;
  int v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSArray *v40;
  int v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  unsigned __int8 v50;
  float v51;
  float v52;
  double v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  uint64_t v63;
  NSParagraphStyleExtraData *v64;
  float64x2_t v66;
  char v67;
  BOOL v68;
  char v69;
  unsigned int v70;
  unsigned __int8 v71;
  uint64_t v72;
  int v73;
  NSArray *v74;
  double v75;
  unsigned __int16 v76;
  __int16 v77;
  objc_super v78;
  float v79[16];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v4 = *(double *)&__NSTightenFactor;
  v5 = __NSUsesDefaultHyphenation_0;
  v78.receiver = self;
  v78.super_class = (Class)NSParagraphStyle;
  v6 = -[NSParagraphStyle init](&v78, sel_init);
  if (!v6)
    return (NSParagraphStyle *)v6;
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v77 = 0;
    v76 = 0;
    objc_msgSend(a3, "decodeValuesOfObjCTypes:", "CC@S", (char *)&v77 + 1, &v77, v6 + 64, &v76);
    v10 = *((_DWORD *)v6 + 18) & 0xFFFFFE00 | HIBYTE(v77) & 0xF | (16 * (v77 & 0xF));
    *((_DWORD *)v6 + 18) = v10;
    if (!v76)
    {
      v75 = 0.0;
      v25 = 0.0;
      v28 = 0.0;
      v31 = 0.0;
LABEL_72:
      *((_DWORD *)v6 + 18) = v10 | 0x200;
      v63 = objc_msgSend((id)objc_opt_class(), "_defaultWritingDirection");
      v72 = 0;
      v50 = 0;
      v74 = 0;
      v40 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v73 = 0;
      v49 = 0;
      *((_DWORD *)v6 + 18) = *((_DWORD *)v6 + 18) & 0xFFFFFBFF | ((v63 == 1) << 10);
      goto LABEL_73;
    }
    v11 = 0;
    v12 = 1;
    do
    {
      if (((unsigned __int16)v12 & v76) != 0)
        ++v11;
      v13 = v12 >= 0x8000;
      v12 *= 2;
    }
    while (!v13);
    objc_msgSend(a3, "decodeArrayOfObjCType:count:at:", "f", v11, v79);
    v14 = v76;
    if ((v76 & 1) != 0)
    {
      *((double *)v6 + 1) = v79[0];
      v15 = 1;
      if ((v14 & 2) == 0)
        goto LABEL_47;
    }
    else
    {
      v15 = 0;
      if ((v76 & 2) == 0)
      {
LABEL_47:
        if ((v14 & 4) != 0)
        {
          v54 = v79[v15++];
          *((double *)v6 + 3) = v54;
          if ((v14 & 8) == 0)
          {
LABEL_49:
            if ((v14 & 0x10) == 0)
              goto LABEL_50;
            goto LABEL_58;
          }
        }
        else if ((v14 & 8) == 0)
        {
          goto LABEL_49;
        }
        v55 = v79[v15++];
        *((double *)v6 + 4) = v55;
        if ((v14 & 0x10) == 0)
        {
LABEL_50:
          if ((v14 & 0x20) == 0)
            goto LABEL_51;
          goto LABEL_59;
        }
LABEL_58:
        v56 = v79[v15++];
        *((double *)v6 + 5) = v56;
        if ((v14 & 0x20) == 0)
        {
LABEL_51:
          if ((v14 & 0x40) == 0)
            goto LABEL_53;
          goto LABEL_52;
        }
LABEL_59:
        v57 = v79[v15++];
        *((double *)v6 + 6) = v57;
        if ((v14 & 0x40) == 0)
        {
LABEL_53:
          v25 = 0.0;
          if ((v14 & 0x80) != 0)
          {
            v58 = v79[v15++];
            v53 = v58;
            if ((v14 & 0x100) == 0)
            {
LABEL_63:
              if ((v14 & 0x200) != 0)
              {
                v60 = v79[v15++];
                *((double *)v6 + 10) = v60;
              }
              v28 = 0.0;
              if ((v14 & 0x400) != 0)
              {
                v61 = v79[v15++];
                v28 = v61;
              }
              if ((v14 & 0x800) != 0)
              {
                v62 = v79[v15++];
                v4 = v62;
              }
              v31 = 0.0;
              if ((v14 & 0x1000) != 0)
                v31 = v79[v15];
              v75 = v53;
              v10 = *((_DWORD *)v6 + 18);
              goto LABEL_72;
            }
          }
          else
          {
            v53 = 0.0;
            if ((v14 & 0x100) == 0)
              goto LABEL_63;
          }
          v59 = v79[v15++];
          v25 = v59;
          goto LABEL_63;
        }
LABEL_52:
        v52 = v79[v15++];
        *((double *)v6 + 7) = v52;
        goto LABEL_53;
      }
    }
    v51 = v79[v15++];
    *((double *)v6 + 2) = v51;
    goto LABEL_47;
  }
  v7 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSWritingDirection"));
  v8 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSAlignment"));
  *((_DWORD *)v6 + 18) = *((_DWORD *)v6 + 18) & 0xFFFFFFF0 | v8 & 0xF;
  if ((v8 & 0xFu) > 4)
  {
    v72 = 0;
    LOBYTE(v9) = 0;
  }
  else
  {
    v72 = qword_18D6CBF40[v8 & 0xF];
    v9 = 0x1000000uLL >> (8 * (v8 & 0xFu));
  }
  v71 = v9;
  v73 = v9 != 0;
  *((_DWORD *)v6 + 18) = *((_DWORD *)v6 + 18) & 0xFFFFFF0F | (16
                                                            * (objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSLineBreakMode")) & 0xF));
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NSLineSpacing"));
  *((_QWORD *)v6 + 1) = v16;
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NSParagraphSpacing"));
  *((_QWORD *)v6 + 2) = v17;
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NSHeadIndent"));
  *((_QWORD *)v6 + 3) = v18;
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NSFirstLineHeadIndent"));
  *((_QWORD *)v6 + 5) = v19;
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NSTailIndent"));
  *((_QWORD *)v6 + 4) = v20;
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NSMinLineHeight"));
  *((_QWORD *)v6 + 6) = v21;
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NSMaxLineHeight"));
  *((_QWORD *)v6 + 7) = v22;
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NSLineHeightMultiple"));
  v75 = v23;
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NSParagraphSpacingBefore"));
  v25 = v24;
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NSDefaultTabInterval"));
  *((_QWORD *)v6 + 10) = v26;
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NSHyphenationFactor"));
  v28 = v27;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NSTighteningFactorForTruncation")))
  {
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NSTighteningFactorForTruncation"));
    v4 = v29;
  }
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NSHeaderLevel"));
  v31 = v30;
  v32 = (void *)MEMORY[0x1E0C99E60];
  v33 = objc_opt_class();
  v34 = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0), CFSTR("NSTabStops"));
  *((_QWORD *)v6 + 8) = v34;
  if (v34)
  {
    if (objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSTabStopsMutable")))
      v35 = 256;
    else
      v35 = 0;
    *((_DWORD *)v6 + 18) = *((_DWORD *)v6 + 18) & 0xFFFFFEFF | v35;
  }
  v36 = (void *)MEMORY[0x1E0C99E60];
  v37 = objc_opt_class();
  v74 = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0), CFSTR("NSTextBlocks"));
  v38 = (void *)MEMORY[0x1E0C99E60];
  v39 = objc_opt_class();
  v40 = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0), CFSTR("NSTextLists"));
  v41 = *((_DWORD *)v6 + 18);
  if (v7)
  {
    v42 = v41 & 0xFFFFF9FF | ((v7 == 2) << 10);
  }
  else
  {
    *((_DWORD *)v6 + 18) = v41 | 0x200;
    v42 = *((_DWORD *)v6 + 18) & 0xFFFFFBFF | ((objc_msgSend((id)objc_opt_class(), "_defaultWritingDirection") == 1) << 10);
  }
  *((_DWORD *)v6 + 18) = v42;
  v43 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSLineBoundsOptions"));
  *((_DWORD *)v6 + 18) = *((_DWORD *)v6 + 18) & 0xFFFFDFFF | ((objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSAllowsTighteningForTruncation")) != 0) << 13);
  v44 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSLineBreakStrategy"));
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NSUsesDefaultHyphenation")))
    v5 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSUsesDefaultHyphenation"));
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NSSpansAllLines")))
    v45 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSSpansAllLines"));
  else
    v45 = 0;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NSSecondaryLineBreakMode")))
    v46 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSSecondaryLineBreakMode"));
  else
    v46 = 0;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NSCompositionLanguage")))
    v47 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSCompositionLanguage"));
  else
    v47 = 0;
  v48 = v72;
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NSTextHorizontalAlignment")))
    v48 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSTextHorizontalAlignment"));
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NSFullyJustified")))
    v73 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSFullyJustified"));
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NSAlignmentFollowsWritingDirection")))
    v49 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSAlignmentFollowsWritingDirection"));
  else
    v49 = 0;
  v50 = v71;
LABEL_73:
  if (v25 != 0.0)
    goto LABEL_74;
  v66 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v75, 0);
  if ((vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v66, (float64x2_t)xmmword_18D6CBF70), (int32x4_t)vceqq_f64(v66, (float64x2_t)xmmword_18D6CBF80)))) & 1) == 0|| v74|| v40|| v28 != 0.0|| v4 != *(double *)&__NSTightenFactor|| v31 != 0.0|| v43|| v44|| __NSUsesDefaultHyphenation_0 != (v5 != 0))
  {
    goto LABEL_74;
  }
  v67 = v46 ? 1 : v45;
  if ((v67 & 1) != 0 || v47 || v48 && (v48 != v72 || v73 != v50))
    goto LABEL_74;
  if (v73)
  {
    if (v50)
      v68 = v48 == v72;
    else
      v68 = 0;
    if (v68)
      v69 = v49;
    else
      v69 = 1;
    if ((v69 & 1) == 0)
      goto LABEL_103;
LABEL_74:
    *((_DWORD *)v6 + 18) &= 0xFFFFE7FF;
    v64 = -[NSParagraphStyleExtraData init](+[NSParagraphStyleExtraData allocWithZone:](NSParagraphStyleExtraData, "allocWithZone:", objc_msgSend(v6, "zone")), "init");
    *((_QWORD *)v6 + 11) = v64;
    v64->_lineHeightMultiple = v75;
    v64->_paragraphSpacingBefore = v25;
    v64->_hyphenationFactor = v28;
    v64->_tighteningFactor = v4;
    v64->_headerLevel = (uint64_t)v31;
    v64->_textBlocks = v74;
    v64->_textLists = v40;
    v64->_lineBoundsOptions = v43;
    v64->_lineBreakStrategy = v44;
    v64->_usesDefaultHyphenation = v5 != 0;
    v64->_spansAllLines = v45;
    v64->_compositionLanguage = v47;
    v64->_horizontalAlignment = v48;
    v64->_secondaryLineBreakMode = 0;
    v64->_fullyJustified = v73;
    v64->_alignmentFollowsWritingDirection = v49;
    return (NSParagraphStyle *)v6;
  }
  if (v49)
    goto LABEL_74;
LABEL_103:
  if (v75 == 1.0)
  {
    v70 = *((_DWORD *)v6 + 18) & 0xFFFFE7FF | 0x800;
LABEL_109:
    *((_DWORD *)v6 + 18) = v70;
    return (NSParagraphStyle *)v6;
  }
  if (v75 == 1.5)
  {
    v70 = *((_DWORD *)v6 + 18) & 0xFFFFE7FF | 0x1000;
    goto LABEL_109;
  }
  if (v75 == 2.0)
  {
    v70 = *((_DWORD *)v6 + 18) | 0x1800;
    goto LABEL_109;
  }
  return (NSParagraphStyle *)v6;
}

- (NSString)description
{
  void *v3;
  NSTextAlignment v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSLineBreakMode v23;
  void *v24;
  unint64_t v25;
  __CFString *v26;
  const __CFString *v27;
  NSArray *v28;
  uint64_t v29;
  NSArray *v30;
  NSArray *v31;
  NSWritingDirection v32;
  __CFString *v33;
  const __CFString *v34;
  float v35;
  double v36;
  const __CFString *v37;
  NSInteger v38;
  NSLineBreakStrategy v39;
  const __CFString *v40;
  NSArray *v41;
  NSArray *v42;
  __CFString *v44;
  __CFString *v45;
  NSArray *v46;
  NSArray *v47;
  uint64_t v48;
  const __CFString *v49;
  uint64_t v50;
  uint64_t v51;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[NSParagraphStyle alignment](self, "alignment");
  if ((unint64_t)v4 >= (NSTextAlignmentNatural|NSTextAlignmentCenter))
    v45 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v4);
  else
    v45 = off_1E2604E78[v4];
  v5 = -[NSParagraphStyle spansAllLines](self, "spansAllLines");
  -[NSParagraphStyle lineSpacing](self, "lineSpacing");
  v7 = v6;
  -[NSParagraphStyle paragraphSpacing](self, "paragraphSpacing");
  v9 = v8;
  -[NSParagraphStyle paragraphSpacingBefore](self, "paragraphSpacingBefore");
  v11 = v10;
  -[NSParagraphStyle headIndent](self, "headIndent");
  v13 = v12;
  -[NSParagraphStyle tailIndent](self, "tailIndent");
  v15 = v14;
  -[NSParagraphStyle firstLineHeadIndent](self, "firstLineHeadIndent");
  v17 = v16;
  -[NSParagraphStyle minimumLineHeight](self, "minimumLineHeight");
  v19 = v18;
  -[NSParagraphStyle maximumLineHeight](self, "maximumLineHeight");
  v21 = v20;
  -[NSParagraphStyle lineHeightMultiple](self, "lineHeightMultiple");
  v50 = v22;
  v23 = -[NSParagraphStyle lineBreakMode](self, "lineBreakMode");
  if ((unint64_t)v23 >= (NSLineBreakByTruncatingTail|NSLineBreakByClipping))
    v44 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v23);
  else
    v44 = off_1E2604EA0[v23];
  if (-[NSParagraphStyle secondaryLineBreakMode](self, "secondaryLineBreakMode"))
  {
    v24 = (void *)MEMORY[0x1E0CB3940];
    v25 = -[NSParagraphStyle secondaryLineBreakMode](self, "secondaryLineBreakMode");
    if (v25 >= 3)
      v26 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v25);
    else
      v26 = off_1E2604ED0[v25];
    v27 = (const __CFString *)objc_msgSend(v24, "stringWithFormat:", CFSTR(", SecondaryLineBreakMode %@"), v26);
  }
  else
  {
    v27 = &stru_1E260C7D0;
  }
  v28 = -[NSParagraphStyle tabStops](self, "tabStops");
  -[NSParagraphStyle defaultTabInterval](self, "defaultTabInterval");
  v48 = v29;
  v30 = -[NSParagraphStyle textBlocks](self, "textBlocks");
  v31 = -[NSParagraphStyle textLists](self, "textLists");
  v32 = -[NSParagraphStyle baseWritingDirection](self, "baseWritingDirection");
  v51 = v7;
  v49 = v27;
  v46 = v30;
  v47 = v28;
  if ((unint64_t)(v32 + 1) >= 3)
    v33 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v32);
  else
    v33 = off_1E2604EE8[v32 + 1];
  if (v5)
    v34 = CFSTR(", SpansAllLines YES");
  else
    v34 = &stru_1E260C7D0;
  -[NSParagraphStyle hyphenationFactor](self, "hyphenationFactor");
  v36 = v35;
  if (-[NSParagraphStyle allowsDefaultTighteningForTruncation](self, "allowsDefaultTighteningForTruncation"))
    v37 = CFSTR("YES");
  else
    v37 = CFSTR("NO");
  v38 = -[NSParagraphStyle headerLevel](self, "headerLevel");
  v39 = -[NSParagraphStyle lineBreakStrategy](self, "lineBreakStrategy");
  if (-[NSParagraphStyle usesDefaultHyphenation](self, "usesDefaultHyphenation"))
    v40 = CFSTR(", UsesDefaultHyphenation YES");
  else
    v40 = &stru_1E260C7D0;
  v41 = -[NSParagraphStyle _presentationIntents](self, "_presentationIntents");
  if (v41)
    v42 = v41;
  else
    v42 = (NSArray *)MEMORY[0x1E0C9AA60];
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("Alignment %@%@, LineSpacing %g, ParagraphSpacing %g, ParagraphSpacingBefore %g, HeadIndent %g, TailIndent %g, FirstLineHeadIndent %g, LineHeight %g/%g, LineHeightMultiple %g, LineBreakMode %@%@, Tabs %@, DefaultTabInterval %g, Blocks %@, Lists %@, BaseWritingDirection %@, HyphenationFactor %g, TighteningForTruncation %@, HeaderLevel %ld LineBreakStrategy %lu%@ PresentationIntents %@ ListIntentOrdinal %ld CodeBlockIntentLanguageHint '%@'"), v45, v34, v51, v9, v11, v13, v15, v17, v19, v21, v50, v44, v49, v47, v48, v46,
                       v31,
                       v33,
                       *(_QWORD *)&v36,
                       v37,
                       v38,
                       v39,
                       v40,
                       v42,
                       -[NSParagraphStyle _listIntentOrdinal](self, "_listIntentOrdinal"),
                       -[NSParagraphStyle codeBlockIntentLanguageHint](self, "codeBlockIntentLanguageHint"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
