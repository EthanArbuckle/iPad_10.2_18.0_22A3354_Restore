@implementation PBTextBlock

+ (void)readClientTextBox:(id)a3 textBody:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  PptTextBlock *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  const __CFDictionary *v15;
  const __CFAllocator *v16;
  const __CFAttributedString *v17;
  __CFAttributedString *MutableCopy;
  const __CFArray *Mutable;
  unint64_t i;
  void *v21;
  id v22;

  v22 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(PptTextBlock);
  -[PptTextBlock readTextBlock:](v10, "readTextBlock:", v22);
  v11 = -[PptTextBlock textRuler](v10, "textRuler");
  if (v11)
    objc_msgSend(a1, "applyTextRuler:toTextBlock:", v11, v10);
  v12 = -[PptTextBlock textType](v10, "textType", v11);
  -[PptTextBlock text](v10, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingString:", CFSTR("\r"));
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v16 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v17 = CFAttributedStringCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v14, v15);

  MutableCopy = CFAttributedStringCreateMutableCopy(v16, 0, v17);
  CFRelease(v17);
  CFAttributedStringBeginEditing(MutableCopy);
  objc_msgSend(a1, "readFromTextBlock:toStyledText:", v10, MutableCopy);
  CFAttributedStringEndEditing(MutableCopy);
  Mutable = CFArrayCreateMutable(v16, 0, MEMORY[0x24BDBD690]);
  objc_msgSend(a1, "readFromStyledText:toStyledPargraphs:", MutableCopy, Mutable);
  for (i = 0; i < CFArrayGetCount(Mutable); ++i)
  {
    objc_msgSend(v8, "addParagraph");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readParagraph:paragraph:textType:state:", v21, CFArrayGetValueAtIndex(Mutable, i), v12, v9);

  }
  CFRelease(Mutable);
  CFRelease(MutableCopy);

}

+ (void)readFromTextBlock:(id)a3 toStyledText:(__CFAttributedString *)a4
{
  int Length;
  int v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  int *v10;
  int v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  int *v16;
  int v17;
  void *v18;
  int v19;
  uint64_t v20;
  int v21;
  int *v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  unsigned int *v29;
  CFIndex v30;
  int v31;
  unint64_t v32;
  int Instance;
  __CFString *v34;
  __CFString *v35;
  int v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  int v42;
  int v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  id v47;
  CFRange v48;
  CFRange v49;
  CFRange v50;
  CFRange v51;
  CFRange v52;

  v47 = a3;
  Length = CFAttributedStringGetLength(a4);
  v6 = objc_msgSend(v47, "paragraphRunCount");
  v7 = 0x24BDD1000uLL;
  if (v6 >= 1)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = (int *)objc_msgSend(v47, "paragraphRunAtIndex:", v9);
      v11 = *v10;
      verifyRangeValidity(v8, *v10, Length);
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v48.location = v8;
      v48.length = v11;
      CFAttributedStringSetAttribute(a4, v48, CFSTR("PptParagraphPropertyRunAttribute"), v12);

      v8 += v11;
      v9 = (v9 + 1);
    }
    while (v6 != (_DWORD)v9);
  }
  v13 = objc_msgSend(v47, "characterRunCount");
  if (v13 >= 1)
  {
    v14 = 0;
    v15 = 0;
    do
    {
      v16 = (int *)objc_msgSend(v47, "characterRunAtIndex:", v15);
      v17 = *v16;
      verifyRangeValidity(v14, *v16, Length);
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v49.location = v14;
      v49.length = v17;
      CFAttributedStringSetAttribute(a4, v49, CFSTR("PptCharacterPropertyRunAttribute"), v18);

      v14 += v17;
      v15 = (v15 + 1);
    }
    while (v13 != (_DWORD)v15);
  }
  v19 = objc_msgSend(v47, "specialInfoRunCount");
  if (v19 >= 1)
  {
    v20 = 0;
    v21 = 0;
    do
    {
      v22 = (int *)objc_msgSend(v47, "specialInfoRunAtIndex:", v20);
      v23 = *v22;
      verifyRangeValidity(v21, *v22, Length);
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v50.location = v21;
      v50.length = v23;
      CFAttributedStringSetAttribute(a4, v50, CFSTR("PptSpecialInfoRunAttribute"), v24);

      v21 += v23;
      v20 = (v20 + 1);
    }
    while (v19 != (_DWORD)v20);
  }
  objc_msgSend(v47, "hyperlinks");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v25;
  v26 = objc_msgSend(v25, "count");
  if (v26)
  {
    v27 = 0;
    v45 = CFSTR("PptClickHyperlinkRunAttribute");
    do
    {
      objc_msgSend(v25, "objectAtIndex:", v27, v45);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (unsigned int *)objc_msgSend(v28, "txtInteractiveInfoAtom");
      v30 = v29[12];
      if ((int)v29[13] >= Length)
        v31 = Length;
      else
        v31 = v29[13];
      if ((v30 & 0x80000000) == 0 && v31 > (int)v30)
      {
        v32 = v7;
        Instance = EshRecord::getInstance((EshRecord *)v29);
        v34 = CFSTR("PptHoverHyperlinkRunAttribute");
        if (Instance != 1)
          v34 = (__CFString *)v45;
        v35 = v34;
        v36 = v31 - v30;
        verifyRangeValidity(v30, v31 - v30, Length);
        objc_msgSend(*(id *)(v32 + 2408), "valueWithPointer:", v28);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v51.length = v36;
        v51.location = v30;
        CFAttributedStringSetAttribute(a4, v51, v35, v37);

        v7 = v32;
        v25 = v46;
      }

      ++v27;
    }
    while (v26 != v27);
  }

  objc_msgSend(v47, "metaCharacterFields");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "count");
  if (v39)
  {
    v40 = 0;
    while (1)
    {
      objc_msgSend(v38, "objectAtIndex:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "position");
      v43 = v42;
      if (v42 > Length)
        break;
      verifyRangeValidity(v42, 1, Length);
      objc_msgSend(*(id *)(v7 + 2408), "valueWithPointer:", v41);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v52.location = v43;
      v52.length = 1;
      CFAttributedStringSetAttribute(a4, v52, CFSTR("PptMetaCharacterRunAttribute"), v44);

      if (v39 == ++v40)
        goto LABEL_27;
    }

  }
LABEL_27:

}

+ (void)readFromStyledText:(__CFAttributedString *)a3 toStyledPargraphs:(__CFArray *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CFIndex v10;
  const __CFAllocator *v11;
  void *v12;
  CFIndex v13;
  CFAttributedStringRef v14;
  id v15;
  CFRange v16;

  CFAttributedStringGetString(a3);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("\r"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = v7 - 1;
  if (v7 != 1)
  {
    v9 = 0;
    v10 = 0;
    v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    do
    {
      objc_msgSend(v6, "objectAtIndex:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length") + 1;
      v16.location = v10;
      v16.length = v13;
      v14 = CFAttributedStringCreateWithSubstring(v11, a3, v16);
      CFArrayAppendValue(a4, v14);
      CFRelease(v14);
      v10 += v13;

      ++v9;
    }
    while (v8 != v9);
  }

}

+ (void)readParagraph:(id)a3 paragraph:(__CFAttributedString *)a4 textType:(int)a5 state:(id)a6
{
  uint64_t v7;
  uint64_t v9;
  const __CFAllocator *v10;
  const __CFAttributedString *Copy;
  const __CFString *String;
  void *v13;
  const void *v14;
  const PptParaProperty9 *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  const PptParaProperty *LevelReference;
  PptTextMasterStyleAtom *v21;
  const PptParaProperty9 *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  const PptParaProperty9 *v27;
  uint64_t v28;
  void *v29;
  const PptCharProperty *v30;
  uint64_t v31;
  CFIndex v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const __CFAttributedString *v36;
  CFIndex v37;
  void *v38;
  void *v39;
  uint64_t v40;
  const __CFAttributedString *v41;
  CFIndex v42;
  void *v43;
  __CFAttributedString *aStr;
  void *v45;
  CFIndex Length;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  CFRange longestEffectiveRange;
  CFRange effectiveRange;
  CFRange v54;
  CFRange v55;

  v7 = *(_QWORD *)&a5;
  v50 = a3;
  v51 = a6;
  if (objc_msgSend(v51, "hasCurrentSourceMasterStyleInfoVector"))
    v9 = objc_msgSend(v51, "currentSourceMasterStyleInfoOfType:", v7);
  else
    v9 = 0;
  v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Copy = CFAttributedStringCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], a4);
  effectiveRange.location = 0;
  effectiveRange.length = 0;
  String = CFAttributedStringGetString(Copy);
  Length = CFStringGetLength(String);
  objc_msgSend(v51, "currentBulletStyle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (const void *)objc_msgSend(v13, "eshObject");
  if (v14)
  else
    v15 = 0;
  CFAttributedStringGetAttributes(Copy, 0, &effectiveRange);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "objectForKey:", CFSTR("PptParagraphPropertyRunAttribute"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  aStr = a4;
  v45 = v13;
  if (v49)
  {
    objc_msgSend(v50, "properties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v49, "pointerValue");
    v18 = v17;
    if (v9 && v17)
    {
      if (*(_QWORD *)v9)
      {
        v19 = *(unsigned __int16 *)(v17 + 4);
        LevelReference = (const PptParaProperty *)PptTextMasterStyleAtom::getLevelReference(*(PptTextMasterStyleAtom **)v9, v19);
        PptParaProperty::copyValuesOfNonOverriddenPropertiesFromParent((char *)(v18 + 8), LevelReference);
      }
      else
      {
        v19 = 0;
      }
    }
    else
    {
      v19 = 0;
      if (!v9)
        goto LABEL_19;
    }
    v21 = *(PptTextMasterStyleAtom **)(v9 + 8);
    if (v21)
    {
      v22 = (const PptParaProperty9 *)PptTextMasterStyleAtom::getLevelReference(v21, v19);
      if (!v15)
        goto LABEL_26;
      goto LABEL_20;
    }
LABEL_19:
    v22 = 0;
    if (!v15)
    {
LABEL_26:
      if (v15)
        v27 = v15;
      else
        v27 = v22;
      +[PBParagraphProperties readParagraphProperties:paragraphPropertyRun:bulletStyle:state:](PBParagraphProperties, "readParagraphProperties:paragraphPropertyRun:bulletStyle:state:", v16, v18, v27, v51);

      goto LABEL_30;
    }
LABEL_20:
    objc_msgSend(v48, "objectForKey:", CFSTR("PptCharacterPropertyRunAttribute"), v16, aStr, v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "pointerValue");

    if (v24)
    {
      v25 = ((unint64_t)*(unsigned __int16 *)(v24 + 8) >> 10) & 0xF;
      v26 = *(_QWORD *)&v15[4].var0;
      v16 = v43;
      if (v25 >= (unsigned __int16)((*(_DWORD *)&v15[4].var3 - v26) >> 3))
      {
        v15 = 0;
      }
      else
      {
        v15 = *(const PptParaProperty9 **)(v26 + 8 * v25);
        if (v22)
          PptParaProperty9::copyOverridesFromParent(*(PptParaProperty9 **)(v26 + 8 * v25), v22);
      }
    }
    else
    {
      v15 = 0;
      v16 = v43;
    }
    goto LABEL_26;
  }
  v19 = 0;
LABEL_30:
  if (v9 && *(_QWORD *)v9)
  {
    v28 = PptTextMasterStyleAtom::getLevelReference(*(PptTextMasterStyleAtom **)v9, v19);
    objc_msgSend(v50, "properties");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (const PptCharProperty *)(v28 + 48);
    +[PBCharacterProperties readCharacterProperties:characterProperty:state:](PBCharacterProperties, "readCharacterProperties:characterProperty:state:", v29, v28 + 48, v51);
    v31 = Length;

  }
  else
  {
    v30 = 0;
    v31 = Length;
  }
  v32 = v31 - 1;
  CFAttributedStringGetAttribute(Copy, v31 - 1, CFSTR("PptCharacterPropertyRunAttribute"), 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v47, "pointerValue");
  if (v33)
  {
    v34 = v33 + 4;
    if (v30)
      PptCharProperty::copyValuesOfNonOverriddenPropertiesFromParent((PptCharProperty *)(v33 + 4), v30);
    objc_msgSend(v50, "paragraphEndCharacterProperties");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBCharacterProperties readCharacterProperties:characterProperty:state:](PBCharacterProperties, "readCharacterProperties:characterProperty:state:", v35, v34, v51);

  }
  CFRelease(Copy);
  v54.location = 0;
  v54.length = v31 - 1;
  v36 = CFAttributedStringCreateWithSubstring(v10, aStr, v54);
  if (v31 >= 2)
  {
    v37 = 0;
    do
    {
      longestEffectiveRange.location = 0;
      longestEffectiveRange.length = 0;
      v55.location = 0;
      v55.length = v32;
      CFAttributedStringGetAttributesAndLongestEffectiveRange(v36, v37, v55, &longestEffectiveRange);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectForKey:", CFSTR("PptCharacterPropertyRunAttribute"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "pointerValue");

      if (v30 && v40)
        PptCharProperty::copyValuesOfNonOverriddenPropertiesFromParent((PptCharProperty *)(v40 + 4), v30);
      v41 = CFAttributedStringCreateWithSubstring(v10, v36, longestEffectiveRange);
      +[PBTextRun readTextRun:plainText:characterAttributes:state:](PBTextRun, "readTextRun:plainText:characterAttributes:state:", v50, CFAttributedStringGetString(v41), v38, v51);
      v42 = longestEffectiveRange.length;
      CFRelease(v41);
      v37 += v42;

    }
    while (v37 < v32);
  }
  objc_msgSend(v51, "setHasCharacterPropertyBulletIndex:", 0);
  CFRelease(v36);

}

+ (void)applyTextRuler:(void *)a3 toTextBlock:(id)a4
{
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  int v8;
  __int16 v9;
  uint64_t **v10;
  uint64_t **v11;
  __int16 v12;
  uint64_t v13;
  char *v14;
  int v15;
  __int16 v16;
  int v17;
  _WORD *v18;
  __int16 v19;
  id v20;

  v20 = a4;
  for (i = 0; (int)i < (int)objc_msgSend(v20, "paragraphRunCount"); i = (i + 1))
  {
    v6 = objc_msgSend(v20, "paragraphRunAtIndex:", i);
    v7 = v6;
    v8 = *((unsigned __int16 *)a3 + 38);
    if (v8 != 0xFFFF)
    {
      v9 = *(_WORD *)(v6 + 8);
      *(_WORD *)(v6 + 42) = v8;
      *(_WORD *)(v6 + 8) = v9 | 0x4000;
    }
    v10 = (uint64_t **)*((_QWORD *)a3 + 6);
    if (v10)
    {
      if ((*(_WORD *)(v6 + 8) & 0x8000) == 0)
      {
        v11 = (uint64_t **)operator new(0x18uLL);
        *v11 = 0;
        v11[1] = 0;
        v11[2] = 0;
        v12 = *(_WORD *)(v7 + 8);
        *(_QWORD *)(v7 + 48) = v11;
        *(_WORD *)(v7 + 8) = v12 | 0x8000;
        if (v11 != v10)
          std::vector<PptTab,ChAllocator<PptTab>>::__assign_with_size[abi:ne180100]<PptTab*,PptTab*>((uint64_t)v11, *v10, v10[1], v10[1] - *v10);
      }
    }
    v13 = *(__int16 *)(v7 + 4);
    if (v13 <= 4)
    {
      v14 = (char *)a3 + 2 * v13;
      v15 = *((unsigned __int16 *)v14 + 28);
      if (v15 != 0xFFFF)
      {
        v16 = *(_WORD *)(v7 + 8);
        *(_WORD *)(v7 + 38) = v15;
        *(_WORD *)(v7 + 8) = v16 | 0x100;
      }
      v17 = *((unsigned __int16 *)v14 + 33);
      if (v17 != 0xFFFF)
      {
        v19 = *(_WORD *)(v7 + 8);
        v18 = (_WORD *)(v7 + 8);
        v18[16] = v17;
        *v18 = v19 | 0x200;
      }
    }
  }

}

@end
