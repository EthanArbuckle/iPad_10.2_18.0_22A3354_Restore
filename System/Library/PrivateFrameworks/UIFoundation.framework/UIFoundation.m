uint64_t attributeDictionaryIsEqual(id a1, id a2)
{
  _BOOL4 v4;
  id v5;
  id v6;

  if (a1)
    v4 = object_getClass(a1) == (Class)attributeDictionaryClass;
  else
    v4 = 0;
  if (a1 == a2)
    return 1;
  if (v4)
    v5 = a1;
  else
    v5 = a2;
  if (v4)
    v6 = a2;
  else
    v6 = a1;
  return objc_msgSend(v5, "isEqualToDictionary:", v6);
}

uint64_t attributeDictionaryHash(char *a1)
{
  char i;
  Class Class;
  BOOL v4;
  unint64_t v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFIndex Count;
  uint64_t v12;
  void **v13;
  void *v14;
  const void **v15;
  uint64_t v16;
  void *values[101];

  values[100] = *(void **)MEMORY[0x1E0C80C00];
  for (i = attributeDictionaryHash_preTigerHash; ; attributeDictionaryHash_preTigerHash = i)
  {
    if (i == 1)
    {
      v8 = objc_msgSend(a1, "count");
      v9 = objc_msgSend((id)objc_msgSend(a1, "objectForKey:", CFSTR("NSFont")), "hash") + v8;
      v10 = objc_msgSend((id)objc_msgSend(a1, "objectForKey:", CFSTR("NSParagraphStyle")), "hash");
      return v9 + v10 + objc_msgSend((id)objc_msgSend(a1, "objectForKey:", CFSTR("NSColor")), "hash");
    }
    if (!i)
      break;
    i = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSPreTigerAttributedStringHash"));
  }
  if (a1
    && ((Class = object_getClass(a1), Class != (Class)attributeDictionaryClass)
      ? (v4 = Class == (Class)tempAttributeDictionaryClass)
      : (v4 = 1),
        v4))
  {
    if (!*((_QWORD *)a1 + 1))
      return 0;
    v5 = 0;
    v6 = 0;
    v7 = (id *)(a1 + 16);
    do
    {
      v6 += objc_msgSend(v7[2], "hash");
      ++v5;
      v7 += 3;
    }
    while (v5 < *((_QWORD *)a1 + 1));
  }
  else
  {
    Count = CFDictionaryGetCount((CFDictionaryRef)a1);
    v12 = Count;
    if (Count <= 100)
    {
      CFDictionaryGetKeysAndValues((CFDictionaryRef)a1, 0, (const void **)values);
      if (v12 >= 1)
      {
        v6 = 0;
        v13 = values;
        do
        {
          v14 = *v13++;
          v6 += objc_msgSend(v14, "hash");
          --v12;
        }
        while (v12);
        return v6;
      }
      return 0;
    }
    v15 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    CFDictionaryGetKeysAndValues((CFDictionaryRef)a1, 0, v15);
    v16 = 0;
    v6 = 0;
    do
      v6 += objc_msgSend((id)v15[v16++], "hash");
    while (v12 != v16);
    free(v15);
  }
  return v6;
}

uint64_t __CTFontGetExtraData(const __CTFont *a1)
{
  uint64_t ClientObject;
  double *v3;

  ClientObject = CTFontGetClientObject();
  if (!ClientObject)
  {
    v3 = -[__NSFontExtraData initWithFont:]([__NSFontExtraData alloc], a1);
    os_unfair_lock_lock((os_unfair_lock_t)&__CTFontExtraDataLock);
    ClientObject = CTFontGetClientObject();
    if (!ClientObject)
    {
      CTFontSetClientObject();
      ClientObject = (uint64_t)v3;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&__CTFontExtraDataLock);

  }
  return ClientObject;
}

void sub_18D5D1D50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double _flushFactorFromAlignment(unint64_t a1, NSWritingDirection IsRightToLeft, uint64_t a3, int a4, int a5)
{
  uint64_t v6;
  uint64_t v7;
  double result;

  if (a1 > 1)
  {
    v6 = 2;
    if (a1 == 2)
      v6 = 3;
    if (!a5)
      v6 = a1;
  }
  else
  {
    if (IsRightToLeft == NSWritingDirectionNatural)
    {
      if (a4)
        IsRightToLeft = (unint64_t)CTLineIsRightToLeft();
      else
        IsRightToLeft = +[NSParagraphStyle defaultWritingDirectionForLanguage:](NSParagraphStyle, "defaultWritingDirectionForLanguage:", 0);
    }
    v6 = 2;
    if (IsRightToLeft == NSWritingDirectionRightToLeft)
      v7 = 3;
    else
      v7 = 2;
    if (IsRightToLeft != NSWritingDirectionRightToLeft)
      v6 = 3;
    if (a1 != 1)
      v6 = v7;
  }
  result = 0.0;
  if (v6 == 3)
    result = 1.0;
  if (v6 == 4)
    return 0.5;
  return result;
}

NSTextAlignment NSTextAlignmentFromCTTextAlignment(CTTextAlignment ctTextAlignment)
{
  NSTextAlignment v1;

  v1 = (unint64_t)ctTextAlignment;
  if (ctTextAlignment == kCTTextAlignmentRight)
    v1 = NSTextAlignmentRight;
  if (ctTextAlignment == kCTTextAlignmentCenter)
    return 1;
  else
    return v1;
}

CTTextAlignment NSTextAlignmentToCTTextAlignment(NSTextAlignment nsTextAlignment)
{
  CTTextAlignment v1;

  if (nsTextAlignment == NSTextAlignmentCenter)
    v1 = kCTTextAlignmentCenter;
  else
    v1 = nsTextAlignment;
  if (nsTextAlignment == NSTextAlignmentRight)
    return 1;
  else
    return v1;
}

void sub_18D5D656C(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x448], 8);
  _Block_object_dispose(&STACK[0x6C0], 8);
  _Block_object_dispose(&STACK[0x708], 8);
  _Block_object_dispose(&STACK[0x728], 8);
  _Unwind_Resume(a1);
}

uint64_t __NSUltraFastLineBreakFinder(CFStringRef theString, uint64_t a2, _BYTE *a3, _BYTE *a4)
{
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  int64_t v13;
  char v14;
  uint64_t v15;
  void **p_vtable;
  char v17;
  uint64_t v18;
  UniChar v19;
  unsigned int v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  int64_t v26;
  CFRange v27;
  uint64_t v28;
  unsigned __int8 *v29;
  BOOL v30;
  BOOL v31;
  char v32;
  int v33;
  int v34;
  BOOL v35;
  int v36;
  UniChar buffer[8];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  CFStringRef theStringa;
  const UniChar *v48;
  const char *v49;
  uint64_t v50;
  int64_t v51;
  int64_t v52;
  int64_t v53;

  if (__NSUltraFastLineBreakFinder_once != -1)
    dispatch_once(&__NSUltraFastLineBreakFinder_once, &__block_literal_global_21);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  *(_OWORD *)buffer = 0u;
  v40 = 0u;
  theStringa = theString;
  v50 = 0;
  v51 = a2;
  CharactersPtr = CFStringGetCharactersPtr(theString);
  CStringPtr = 0;
  v48 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(theString, 0x600u);
  v52 = 0;
  v53 = 0;
  v49 = CStringPtr;
  if (a2 < 1)
  {
    v14 = 0;
    v13 = 0;
    v17 = 1;
    if (a3)
      goto LABEL_72;
    goto LABEL_73;
  }
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 64;
  p_vtable = (void **)(&OBJC_METACLASS___NSTextGraphicsContextProvider + 24);
  v17 = 1;
  do
  {
    if ((unint64_t)v13 >= 4)
      v18 = 4;
    else
      v18 = v13;
    if (v51 <= v13)
    {
      v19 = 0;
      v20 = 0;
LABEL_43:
      if (a3)
        v31 = v19 == 9;
      else
        v31 = 0;
      v32 = !v31;
      v17 &= v32;
      goto LABEL_50;
    }
    if (v48)
    {
      v19 = v48[v13 + v50];
    }
    else if (v49)
    {
      v19 = v49[v50 + v13];
    }
    else
    {
      if (v53 <= v13 || v12 > v13)
      {
        v22 = -v18;
        v23 = v18 + v10;
        v24 = v15 - v18;
        v25 = v13 + v22;
        v26 = v25 + 64;
        if (v25 + 64 >= v51)
          v26 = v51;
        v52 = v25;
        v53 = v26;
        v27.location = v25 + v50;
        if (v51 >= v24)
          v28 = v24;
        else
          v28 = v51;
        v27.length = v28 + v23;
        CFStringGetCharacters(theStringa, v27, buffer);
        p_vtable = &OBJC_METACLASS___NSTextGraphicsContextProvider.vtable;
        v11 = v52;
      }
      v19 = buffer[v13 - v11];
      v12 = v11;
    }
    v20 = v19;
    if ((v19 & 0xFF70) == 0)
    {
      v30 = v19 > 0xDu || ((1 << v19) & 0x3400) == 0;
      if (!v30 || v19 == 133)
        goto LABEL_71;
      goto LABEL_43;
    }
    if (v19 >= 0x100u)
    {
      if ((unsigned __int16)(v19 & 0xFFFE) >> 1 == 4116 && (v19 & 0xFF00) == 0x2000)
        goto LABEL_71;
      if (((a3 != 0) & v17) == 1)
      {
        v29 = (unsigned __int8 *)p_vtable[463];
        if (v29 && ((v29[(unint64_t)v19 >> 3] >> (v19 & 7)) & 1) != 0
          || __NSUltraFastLineBreakFinder_punctuationBMP
          && ((*(unsigned __int8 *)(__NSUltraFastLineBreakFinder_punctuationBMP + ((unint64_t)v19 >> 3)) >> (v19 & 7)) & 1) != 0)
        {
          v17 = 1;
        }
        else if (__NSUltraFastLineBreakFinder_alphaNumericBMP
               && (v34 = 1 << (v19 & 7),
                   (v34 & *(_BYTE *)(__NSUltraFastLineBreakFinder_alphaNumericBMP
                                                    + ((unint64_t)v19 >> 3))) != 0)
               && (!__NSUltraFastLineBreakFinder_nonBaseBMP
                || (v34 & *(_BYTE *)(__NSUltraFastLineBreakFinder_nonBaseBMP
                                                    + ((unint64_t)v19 >> 3))) == 0))
        {
          v35 = (unsigned __int16)((unsigned __int16)(v19 - 1424) >> 4) > 0x176u
             && (unsigned __int16)(v19 + 23344) > 0x72Fu;
          v36 = v19 >> 7;
          v17 = v35 && v36 != 431;
        }
        else
        {
          v17 = 0;
        }
      }
    }
LABEL_50:
    if (__NSUltraFastLineBreakFinder_strongRightBMP)
      v33 = (*(unsigned __int8 *)(__NSUltraFastLineBreakFinder_strongRightBMP + ((unint64_t)v20 >> 3)) >> (v20 & 7)) & 1;
    else
      LOBYTE(v33) = 0;
    v14 |= v33;
    ++v13;
    --v10;
    ++v15;
  }
  while (a2 != v13);
  v13 = a2;
LABEL_71:
  if (a3)
LABEL_72:
    *a3 = v17 & 1;
LABEL_73:
  if (a4)
    *a4 = v14 & 1;
  return v13;
}

void sub_18D5D7268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  id *v34;
  uint64_t v35;

  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v35 - 200), 8);
  _Block_object_dispose((const void *)(v35 - 168), 8);
  _Unwind_Resume(a1);
}

uint64_t __NSCoreTypesetterTruncateLine(uint64_t a1, CTLineRef *a2, void *a3, uint64_t a4, unsigned int a5, double *a6, double *a7, double a8)
{
  CTLineRef v15;
  double TypographicBounds;
  uint64_t v17;
  uint64_t HyphenatedLineWithOffset;
  const __CTLine *v19;
  BOOL v20;
  BOOL v21;
  int v22;
  float v23;
  const __CTLine *JustifiedLineWithOptions;
  const __CTLine *TruncatedLineWithTokenHandler;
  double v26;
  CFTypeRef v27;
  const void *v28;
  double v29;
  double TrailingWhitespaceWidth;
  void *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  const char *v47;
  __int128 v48;

  v15 = *a2;
  TypographicBounds = *a6;
  if (a4 == 4)
    v17 = a5;
  else
    v17 = 0;
  if ((_DWORD)v17 == 1)
  {
    CTLineGetStringRange(*a2);
    HyphenatedLineWithOffset = CTLineCreateHyphenatedLineWithOffset();
    if (HyphenatedLineWithOffset)
    {
      v19 = (const __CTLine *)HyphenatedLineWithOffset;
      CFRelease(v15);
      TypographicBounds = CTLineGetTypographicBounds(v19, 0, 0, 0);
      *a2 = v19;
      *a6 = TypographicBounds;
      v15 = v19;
    }
  }
  if ((unint64_t)(a4 - 3) > 2)
    return v17;
  v20 = a8 <= 0.0 || v15 == 0;
  v21 = v20 || TypographicBounds <= a8;
  if (v21 || CTLineGetGlyphCount(v15) < 2)
    return v17;
  if (a3)
  {
    if ((objc_msgSend(a3, "allowsDefaultTighteningForTruncation") & 1) != 0)
    {
      v22 = 1;
      goto LABEL_24;
    }
    objc_msgSend(a3, "tighteningFactorForTruncation");
  }
  else
  {
    if (-[NSParagraphStyle allowsDefaultTighteningForTruncation](+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"), "allowsDefaultTighteningForTruncation"))
    {
      v22 = 1;
      goto LABEL_24;
    }
    -[NSParagraphStyle tighteningFactorForTruncation](+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"), "tighteningFactorForTruncation");
  }
  v22 = 0;
  if ((v23 + 1.0) * a8 >= TypographicBounds)
  {
LABEL_24:
    JustifiedLineWithOptions = (const __CTLine *)CTLineCreateJustifiedLineWithOptions();
    if (JustifiedLineWithOptions)
    {
      TruncatedLineWithTokenHandler = JustifiedLineWithOptions;
      v26 = CTLineGetTypographicBounds(JustifiedLineWithOptions, 0, 0, 0);
      if (v26 - CTLineGetTrailingWhitespaceWidth(TruncatedLineWithTokenHandler) <= a8)
      {
LABEL_37:
        CFRelease(v15);
        v29 = CTLineGetTypographicBounds(TruncatedLineWithTokenHandler, 0, 0, 0);
        TrailingWhitespaceWidth = CTLineGetTrailingWhitespaceWidth(TruncatedLineWithTokenHandler);
        *a2 = TruncatedLineWithTokenHandler;
        *a6 = v29 - TrailingWhitespaceWidth;
        *a7 = TrailingWhitespaceWidth;
        return v17;
      }
      CFRelease(TruncatedLineWithTokenHandler);
    }
  }
  v32 = *(void **)(a1 + 40);
  v27 = CFRetain(v15);
  v44 = 0;
  v45 = &v44;
  v46 = 0x3010000000;
  v47 = "";
  v48 = xmmword_18D6CBB80;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3810000000;
  v40 = "a";
  v41 = 0;
  v42 = 0;
  v43 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 1;
  if (v22 && (v28 = (const void *)CTLineCreateJustifiedLineWithOptions()) != 0)
    CFRelease(v27);
  else
    v28 = v27;
  TruncatedLineWithTokenHandler = (const __CTLine *)CTLineCreateTruncatedLineWithTokenHandler();
  if (TruncatedLineWithTokenHandler && v32 && v45[4] != 0x7FFFFFFFFFFFFFFFLL && v45[5])
  {
    objc_msgSend(v32, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:"));
    v17 = 1;
  }
  __NSCoreTypesetterTruncationTokenContextDeallocate((uint64_t)(v38 + 4));
  *((_BYTE *)v34 + 24) = 0;
  CFRelease(v28);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v44, 8);
  if (TruncatedLineWithTokenHandler)
    goto LABEL_37;
  return v17;
}

void sub_18D5D7894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  uint64_t v15;
  va_list va;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v15 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 152), 8);
  _Unwind_Resume(a1);
}

double __NSCoreTypesetterAdjustLineHeightAndBaselineForTextAttachments(const __CTLine *a1, double *a2, double *a3)
{
  const __CFArray *GlyphRuns;
  CFIndex Count;
  double v7;
  double v8;
  CFIndex v9;
  CFIndex v10;
  int v11;
  const void *v12;
  const void *v13;
  const __CTRun *ValueAtIndex;
  const __CFDictionary *Attributes;
  _BOOL4 v16;
  double result;
  double v18;
  CGFloat ascent;
  CFRange v20;

  GlyphRuns = CTLineGetGlyphRuns(a1);
  Count = CFArrayGetCount(GlyphRuns);
  v7 = *a3;
  v8 = *a3 - *a2;
  if (Count >= 1)
  {
    v9 = Count;
    v10 = 0;
    v11 = 0;
    v12 = (const void *)*MEMORY[0x1E0CA85C0];
    v13 = (const void *)*MEMORY[0x1E0CA8158];
    do
    {
      ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, v10);
      if (CTRunGetStringRange(ValueAtIndex).length == 1)
      {
        Attributes = CTRunGetAttributes(ValueAtIndex);
        if (CFDictionaryGetValue(Attributes, v12) || CFDictionaryGetValue(Attributes, v13))
        {
          v18 = 0.0;
          ascent = 0.0;
          v20.location = 0;
          v20.length = 0;
          CTRunGetTypographicBounds(ValueAtIndex, v20, &ascent, &v18, 0);
          v16 = v8 > -v18;
          if (v8 > -v18)
            v8 = -v18;
          if (ascent > v7)
          {
            v7 = ascent;
            v16 = 1;
          }
          v11 |= v16;
        }
      }
      ++v10;
    }
    while (v9 != v10);
  }
  *a3 = v7;
  result = v7 - v8;
  *a2 = v7 - v8;
  return result;
}

uint64_t _NSTextScalingTypeForCurrentEnvironment()
{
  return 1;
}

double __NSStringDrawingEngine(__CFString *a1, void *a2, uint64_t a3, unsigned int a4, void *a5, void *a6, _BYTE *a7, CGFloat a8, CGFloat a9, CGFloat a10, CGFloat a11, double a12)
{
  void *v13;
  const __CFString *v20;
  CFIndex Length;
  int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  double v27;
  double *v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  void *v35;
  double v36;
  NSParagraphStyle *v37;
  NSParagraphStyle *v38;
  uint64_t v39;
  BOOL v40;
  int v41;
  uint64_t v42;
  double v43;
  double v44;
  BOOL v46;
  uint64_t v47;
  int v48;
  _BOOL4 v49;
  uint64_t v50;
  const __CFString *v51;
  void *v52;
  unint64_t v53;
  NSCoreTypesetter *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  _BOOL4 v68;
  int v69;
  void *v70;
  double v71;
  _BOOL4 v72;
  unint64_t v73;
  uint64_t v74;
  double v75;
  void *v76;
  uint64_t v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  BOOL v82;
  double v83;
  double v84;
  CGFloat v85;
  double v86;
  double v87;
  double v88;
  int v90;
  int v91;
  uint64_t v92;
  double v93;
  double v94;
  NSWritingDirection v95;
  NSParagraphStyle *v96;
  int v97;
  double v98;
  double v99;
  double v100;
  int v101;
  double v102;
  int v103;
  double v104;
  double v105;
  double v106;
  int v107;
  double v108;
  double v109;
  _BOOL4 v110;
  double v111;
  double v112;
  uint64_t v113;
  CGContext *v114;
  int v115;
  double v116;
  CGContext *v117;
  char v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  BOOL v129;
  int v130;
  uint64_t v131;
  NSParagraphStyle *v132;
  double v133;
  int v134;
  double v135;
  unint64_t v136;
  unint64_t v137;
  double *v138;
  uint64_t v139;
  char v140;
  char v141;
  int v142;
  uint64_t v144;
  const __CFString *theString;
  uint64_t v148;
  double v149;
  unint64_t v150;
  uint64_t v151;
  double v153;
  _QWORD v154[24];
  char v155;
  char v156;
  char v157;
  char v158;
  char v159;
  char v160;
  char v161;
  BOOL v162;
  char v163;
  double v164;
  double *v165;
  uint64_t v166;
  const char *v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double *v173;
  uint64_t v174;
  void (*v175)(uint64_t, uint64_t);
  void (*v176)(uint64_t);
  uint64_t v177;
  char v178;
  unint64_t v179;
  CFIndex v180;
  CGRect v181;
  CGRect v182;

  v13 = a5;
  if (!a5)
  {
    if (__NSSharedStringDrawingContext_onceToken != -1)
      dispatch_once(&__NSSharedStringDrawingContext_onceToken, &__block_literal_global_365);
    v13 = (void *)__NSSharedStringDrawingContext_sharedStringDrawingContext;
  }
  v148 = objc_msgSend(v13, "applicationFrameworkContext");
  v20 = a1;
  if (a2)
  {
    if (a1)
    {
LABEL_7:
      Length = CFStringGetLength(v20);
      goto LABEL_10;
    }
  }
  else
  {
    v20 = (const __CFString *)-[__CFString string](a1, "string");
    if (v20)
      goto LABEL_7;
  }
  Length = 0;
LABEL_10:
  v22 = objc_msgSend(v13, "wantsMultilineDeviceMetrics");
  if (__NSStringDrawingEngine_onceToken != -1)
    dispatch_once(&__NSStringDrawingEngine_onceToken, &__block_literal_global_340);
  v150 = a3 & 0x800;
  v23 = objc_msgSend(v13, "activeRenderers");
  v24 = __NSStringDrawingDefaultRendererConfiguration;
  if (v23)
    v24 = v23;
  v25 = 2;
  if (v22)
    v24 = 2;
  v26 = v24 & 0xFFFFFFFFFFFFFFFCLL;
  if (!v22)
    v25 = v24 & 0xFFFFFFFFFFFFFFFCLL;
  if ((a3 & 8) != 0)
    v24 = v25;
  v140 = v22;
  if ((a3 & 0x100) != 0)
  {
    if (__NSStringDrawingEngine_onceToken_347 != -1)
      dispatch_once(&__NSStringDrawingEngine_onceToken_347, &__block_literal_global_348);
    v27 = *(double *)&__NSStringDrawingEngine__factor;
  }
  else
  {
    v27 = 0.0;
    v26 = v24;
  }
  v28 = (double *)MEMORY[0x1E0CB3438];
  if ((a3 & 0x800) != 0)
    v29 = 8;
  else
    v29 = v26;
  if (v13)
  {
    objc_msgSend(v13, "setActualScaleFactor:", 1.0);
    objc_msgSend(v13, "setBaselineOffset:", 0.0);
    objc_msgSend(v13, "setFirstBaselineOffset:", 0.0);
  }
  v30 = *v28;
  v31 = v28[1];
  v144 = a3 & 2;
  v33 = v28[2];
  v32 = v28[3];
  if (Length < 1)
  {
    if (a6)
      v40 = v13 == 0;
    else
      v40 = 0;
    v41 = !v40;
    if ((a3 & 8) == 0 && v41)
    {
      v42 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSParagraphStyle"));
      v164 = 0.0;
      v172 = 0.0;
      +[NSCoreTypesetter _lineMetricsForAttributes:typesetterBehavior:usesFontLeading:applySpacings:usesSystemFontLeading:usesNegativeFontLeading:layoutOrientation:lineHeight:baselineOffset:spacing:](NSCoreTypesetter, "_lineMetricsForAttributes:typesetterBehavior:usesFontLeading:applySpacings:usesSystemFontLeading:usesNegativeFontLeading:layoutOrientation:lineHeight:baselineOffset:spacing:", a2, objc_msgSend(MEMORY[0x1E0CB3940], "typesetterBehavior"), v144 != 0, v42 != 0, 0, 0, 0, &v164, &v172, 0);
      v30 = *MEMORY[0x1E0CB3430];
      v43 = v164;
      v44 = (a3 & 1) != 0 ? *(double *)(MEMORY[0x1E0CB3430] + 8) : v172 - v164;
      if (v13)
      {
        objc_msgSend(v13, "setNumberOfLineFragments:", 0);
        objc_msgSend(v13, "setTotalBounds:", v30, v44, 0.0, v43);
        if (objc_msgSend(v13, "wantsBaselineOffset"))
        {
          objc_msgSend(v13, "setBaselineOffset:", v172);
          objc_msgSend(v13, "setFirstBaselineOffset:", v172);
        }
      }
    }
    return v30;
  }
  v179 = 0;
  v180 = Length;
  if (!a2)
    a2 = (void *)-[__CFString attributesAtIndex:effectiveRange:](a1, "attributesAtIndex:effectiveRange:", 0, &v179);
  if (objc_msgSend(a2, "objectForKey:", CFSTR("NSTextAnimation")))
  {
    v34 = softLinkSwiftUITextAnimationProviderClass[0]();
    if (v34)
    {
      v35 = (void *)v34;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v35, "drawStaticString:withAttributes:options:inRect:withPadding:forceClipping:cgContext:stringDrawingContext:", a1, a2, a3, a4, objc_msgSend(a6, "CGContext"), v13, a8, a9, a10, a11, a12);
        return v36;
      }
    }
  }
  theString = v20;
  v37 = (NSParagraphStyle *)objc_msgSend(a2, "objectForKey:", CFSTR("NSParagraphStyle"));
  v38 = v37;
  if ((a4 & 1) != 0)
    v39 = 2;
  else
    v39 = -[NSParagraphStyle lineBreakMode](v37, "lineBreakMode");
  v142 = ((a3 & 0x20) != 0) & a3;
  v178 = 0;
  v141 = objc_msgSend(v13, "drawsDebugBaselines");
  if ((a3 & 0x100000) == 0 && v148 != 2)
  {
    v46 = objc_msgSend(v13, "maximumNumberOfLines") == 1 && v39 < 2;
    if ((a3 & 1) != 0 && !v46)
      goto LABEL_65;
LABEL_72:
    if (v39 <= 2)
      v39 = 2;
    v50 = __NSUltraFastLineBreakFinder(theString, Length, 0, &v178);
    if (!v50)
    {
      if (v13)
      {
        objc_msgSend(v13, "setNumberOfLineFragments:", 0);
        objc_msgSend(v13, "setTotalBounds:", v30, v31, v33, v32);
      }
      return v30;
    }
    v47 = v50;
    v132 = v38;
    v49 = 0;
    v48 = 1;
    a11 = 0.0;
    goto LABEL_76;
  }
  if ((a3 & 1) == 0)
    goto LABEL_72;
LABEL_65:
  v132 = v38;
  if (objc_msgSend(v13, "wrapsForTruncationMode") && v39 >= 2)
  {
    if (objc_msgSend(v13, "maximumNumberOfLines") != 1)
      v39 = 0;
    v142 = 1;
  }
  v47 = __NSUltraFastLineBreakFinder(theString, Length, 0, &v178);
  v48 = 0;
  v49 = v47 == 0;
LABEL_76:
  v135 = a8;
  v136 = a3 & 0x400;
  v137 = a3 & 0x200;
  if (v47 < Length)
    v27 = 0.0;
  if ((v141 & 1) != 0)
  {
    v133 = v30;
    v138 = 0;
LABEL_80:
    v51 = theString;
    v52 = a6;
    v53 = v144;
LABEL_147:
    v83 = a10;
    v172 = 0.0;
    v173 = &v172;
    v174 = 0x3052000000;
    v175 = __Block_byref_object_copy__9;
    v176 = __Block_byref_object_dispose__9;
    v177 = 0;
    v84 = a11;
    if ((v48 | v142 ^ 1) == 1)
    {
      if (__NSSharedStringDrawingContext_onceToken != -1)
        dispatch_once(&__NSSharedStringDrawingContext_onceToken, &__block_literal_global_365);
      if (v13 == (void *)__NSSharedStringDrawingContext_sharedStringDrawingContext)
      {
        v84 = 9000000.0;
      }
      else if (objc_msgSend(v13, "maximumNumberOfLines") == 1)
      {
        v84 = 9000000.0;
      }
      else
      {
        v84 = a11;
      }
    }
    v85 = a11;
    v86 = v27;
    v87 = 10000000.0;
    if (v83 > 0.0)
      v87 = v83;
    if (a4)
      v88 = 40000.0;
    else
      v88 = v87;
    v164 = 0.0;
    v165 = &v164;
    v166 = 0x4010000000;
    v167 = "";
    v168 = v133;
    v169 = v31;
    v170 = v33;
    v171 = v32;
    objc_msgSend(MEMORY[0x1E0CB3940], "setUsesFontLeading:", v53 != 0);
    objc_msgSend(MEMORY[0x1E0CB3940], "setUsesScreenFonts:", 0);
    v154[0] = MEMORY[0x1E0C809B0];
    v154[1] = 3221225472;
    v154[2] = ____NSStringDrawingEngine_block_invoke_362;
    v154[3] = &unk_1E26053A8;
    v155 = v48;
    v154[10] = v51;
    v154[11] = v47;
    v154[12] = Length;
    v154[4] = a1;
    v154[5] = a2;
    *(double *)&v154[13] = v88;
    *(double *)&v154[14] = v84;
    v156 = v142;
    *(double *)&v154[15] = v86;
    v157 = v141;
    v158 = v137 >> 9;
    v159 = v136 >> 10;
    v160 = v150 >> 11;
    v161 = v53 >> 1;
    v154[6] = v13;
    v154[7] = v52;
    v162 = v148 == 2;
    v154[16] = v148;
    v154[17] = v138;
    *(double *)&v154[18] = v135;
    *(CGFloat *)&v154[19] = a9;
    *(double *)&v154[20] = v83;
    *(CGFloat *)&v154[21] = v85;
    v163 = a4;
    *(double *)&v154[22] = a12;
    v154[8] = &v172;
    v154[9] = &v164;
    v154[23] = a7;
    +[NSStringDrawingTextStorage performLayoutOperation:](NSStringDrawingTextStorage, "performLayoutOperation:", v154);

    v30 = v165[4];
    _Block_object_dispose(&v164, 8);
    _Block_object_dispose(&v172, 8);
    return v30;
  }
  v138 = 0;
  if ((v49 & ~v48) != 0)
    v29 &= ~2uLL;
  if ((v29 & 3) == 0 || v27 != 0.0)
  {
LABEL_101:
    v133 = v30;
    if (objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0CA80D0]))
      __UIFoundationWriteLog((uint64_t)"StringDrawing", OS_LOG_TYPE_ERROR, (uint64_t)"Can't draw encapsulation for string \"%@\" because it was disqualified from Core Text rendering paths!", v60, v61, v62, v63, v64, (uint64_t)theString);
    v65 = objc_msgSend(MEMORY[0x1E0CB3940], "typesetterBehavior");
    if (v47 == Length)
      v66 = 1;
    else
      v66 = v48;
    if ((v29 & 4) == 0 || !v66)
      goto LABEL_80;
    v131 = v65;
    v68 = a10 > 0.0 && v39 < 2;
    v129 = v68;
    v52 = a6;
    v53 = a3 & 2;
    if (!v68)
      goto LABEL_121;
    v69 = v48;
    if (!a2)
      goto LABEL_119;
    v70 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("NSFont"));
    if (objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("CTVerticalForms")), "BOOLValue"))
      v70 = (void *)objc_msgSend(v70, "verticalFont");
    if (!v70)
LABEL_119:
      v70 = (void *)NSDefaultFont();
    objc_msgSend(v70, "advancementForGlyph:", 0);
    v48 = v69;
    if (v71 * (double)Length <= a10 * 0.899999976)
    {
LABEL_121:
      if ((v142 & objc_msgSend(v13, "wrapsForTruncationMode") & 1) == 0)
      {
        if (theString == a1)
        {
          if (!+[NSSingleLineTypesetter _validateAttributes:measuringOnly:](NSSingleLineTypesetter, "_validateAttributes:measuringOnly:", a2, v52 == 0))goto LABEL_146;
          v77 = (uint64_t)a1;
          if (v47 < Length)
            v77 = -[__CFString substringToIndex:](a1, "substringToIndex:", v47);
          if (a4)
            v78 = 40000.0;
          else
            v78 = a10;
          v76 = (void *)__NSCreateRenderingContextForString(v77, (uint64_t)a2, v131, v137 != 0, v136 != 0, v178, v27, v78);
        }
        else
        {
          while (1)
          {
            v72 = +[NSSingleLineTypesetter _validateAttributes:measuringOnly:](NSSingleLineTypesetter, "_validateAttributes:measuringOnly:", a2, v52 == 0);
            v73 = v179;
            if (!v72)
              break;
            v73 = v180 + v179;
            v179 = v73;
            if (v73 >= v47)
              break;
            a2 = (void *)-[__CFString attributesAtIndex:effectiveRange:](a1, "attributesAtIndex:effectiveRange:");
            if (!a2)
            {
              v73 = v179;
              break;
            }
          }
          if (v73 < v47)
            goto LABEL_146;
          v74 = (uint64_t)a1;
          if (v47 < Length)
            v74 = -[__CFString attributedSubstringFromRange:](a1, "attributedSubstringFromRange:", 0, v47);
          if (a4)
            v75 = 40000.0;
          else
            v75 = a10;
          v76 = (void *)__NSCreateRenderingContextForAttributedString(v74, v131, v137 != 0, v136 != 0, v178, v27, v75);
        }
        v79 = v76;
        if (v76)
        {
          objc_msgSend(v76, "lineFragmentWidth");
          v81 = v80;
          objc_msgSend(v79, "setApplicationFrameworkContext:", v148);
          v82 = v129;
          if (v81 <= a10)
            v82 = 0;
          if (v82)
          {

            goto LABEL_146;
          }
          v90 = v81 > a10 && a10 > 0.0;
          if (!a4)
          {
            v91 = v48;
            v30 = v133;
            if (v52)
            {
LABEL_195:
              v107 = objc_msgSend(v52, "isFlipped") ^ 1;
LABEL_198:
              v108 = a9;
              if ((v91 & 1) == 0)
              {
                v164 = 0.0;
                objc_msgSend(v79, "sizeWithBehavior:usesFontLeading:baselineDelta:", v131, v144 != 0, &v164);
                v110 = a11 > 0.0;
                if (v109 <= a11)
                  v110 = 0;
                v90 |= v110;
                if ((v107 & 1) != 0)
                {
                  if (a11 > 0.0)
                    v111 = a11;
                  else
                    v111 = v109;
                  v112 = v111 - v164;
                }
                else
                {
                  v112 = v164;
                }
                v108 = a9 + v112;
              }
              v113 = objc_msgSend(v52, "CGContext");
              if (!v113)
                goto LABEL_222;
              v114 = (CGContext *)v113;
              if (v90)
              {
                if (a11 <= 0.0)
                  v115 = 1;
                else
                  v115 = v91;
                if (v115 == 1)
                {
                  v164 = 0.0;
                  v172 = 0.0;
                  objc_msgSend(v79, "getMaximumAscender:minimumDescender:", &v164, &v172);
                  v116 = -v164;
                  if (v107)
                    v116 = v172;
                  a9 = a9 + v116;
                  a11 = v164 - v172;
                }
                CGContextSaveGState(v114);
                v182.origin.x = a8 - a12;
                v182.origin.y = a9;
                v182.size.width = a10 + a12 * 2.0;
                v182.size.height = a11;
                CGContextClipToRect(v114, v182);
                v117 = v114;
              }
              else
              {
                v117 = 0;
              }
              objc_msgSend(v79, "setCuiCatalog:", objc_msgSend(v13, "cuiCatalog"));
              objc_msgSend(v79, "setCuiStyleEffects:", objc_msgSend(v13, "cuiStyleEffects"));
              objc_msgSend(v79, "_setUsesSimpleTextEffects:", objc_msgSend(v13, "usesSimpleTextEffects"));
              objc_msgSend(v79, "drawAtPoint:inContext:", v114, v135, v108);
              if (v90)
                CGContextRestoreGState(v117);
              if (v13)
              {
LABEL_222:
                if ((a3 & 8) != 0)
                  v118 = v140;
                else
                  v118 = 1;
                if ((v118 & 1) != 0)
                {
                  v164 = 0.0;
                  v30 = *MEMORY[0x1E0CB3430];
                  v119 = *(double *)(MEMORY[0x1E0CB3430] + 8);
                  objc_msgSend(v79, "sizeWithBehavior:usesFontLeading:baselineDelta:", v131, v144 != 0, &v164);
                  v122 = v121;
                  v123 = v120;
                  v124 = v164;
                  if (v91)
                    v119 = v164 - v120;
                }
                else
                {
                  objc_msgSend(v79, "imageBounds");
                  v30 = v126;
                  v124 = v125;
                  v122 = v127;
                  v123 = v128;
                  if (v91)
                    v119 = v125;
                  else
                    v119 = 0.0;
                }
                if (v13)
                {
                  objc_msgSend(v13, "setNumberOfLineFragments:", 1);
                  objc_msgSend(v13, "setTotalBounds:", v30, v119, v122, v123);
                  if (objc_msgSend(v13, "wantsBaselineOffset"))
                  {
                    objc_msgSend(v13, "setBaselineOffset:", v124);
                    objc_msgSend(v13, "setFirstBaselineOffset:", v124);
                  }
                }
              }

              return v30;
            }
LABEL_197:
            v107 = 0;
            goto LABEL_198;
          }
          v153 = v81;
          v91 = v48;
          v30 = v133;
          if (a10 > 0.0)
          {
            v92 = objc_msgSend(v79, "resolvedTextAlignment");
            v151 = objc_msgSend(v79, "resolvedBaseWritingDirection");
            objc_msgSend(v79, "elasticWidth");
            v94 = v93;
            switch(v92)
            {
              case 1:
                v149 = (v93 - v153 + 40000.0) * 0.5;
                v103 = objc_msgSend(v79, "isRTL");
                v104 = 0.0;
                if (v103)
                  v105 = v94;
                else
                  v105 = 0.0;
                if (!v90)
                {
                  v135 = a8 + floor((a10 - v153) * 0.5 - v149 + v105);
                  if (v52)
                    goto LABEL_195;
                  goto LABEL_197;
                }
                v106 = v105 - v149;
                if (v151 == 1)
                {
                  v181.origin.x = a8;
                  v181.origin.y = a9;
                  v181.size.width = a10;
                  v181.size.height = a11;
                  v104 = v153 - CGRectGetWidth(v181);
                }
                v102 = v106 - v104;
                goto LABEL_193;
              case 2:
                goto LABEL_176;
              case 3:
                v95 = v151;
                if ((a3 & 0x200) == 0)
                {
                  v96 = v132;
                  if (!v132)
                    v96 = +[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle");
                  v95 = -[NSParagraphStyle baseWritingDirection](v96, "baseWritingDirection");
                  if (v95 == NSWritingDirectionNatural)
                    v95 = +[NSParagraphStyle defaultWritingDirectionForLanguage:](NSParagraphStyle, "defaultWritingDirectionForLanguage:", 0);
                }
                if (v95 == NSWritingDirectionRightToLeft)
                {
LABEL_176:
                  v97 = objc_msgSend(v79, "isRTL");
                  v98 = 0.0;
                  if (!v97)
                    v98 = v94;
                  v99 = v153 - v98;
                  v100 = 40000.0 - v99;
                  if (v151)
                    v101 = 0;
                  else
                    v101 = v90;
                  if (v101 == 1)
                    v102 = -v100;
                  else
                    v102 = a10 - v99 - v100;
LABEL_193:
                  v135 = a8 + floor(v102);
                }
                break;
            }
          }
          if (v52)
            goto LABEL_195;
          goto LABEL_197;
        }
      }
    }
LABEL_146:
    v51 = theString;
    goto LABEL_147;
  }
  v130 = v48;
  v139 = objc_msgSend(v13, "activeRenderers");
  objc_msgSend(v13, "setActiveRenderers:", v29);
  v134 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!v134
    || (v54 = (NSCoreTypesetter *)__NSStringDrawingEngine_mainThreadCoreTypesetter,
        __NSStringDrawingEngine_mainThreadCoreTypesetter = 0,
        !v54))
  {
    v54 = objc_alloc_init(NSCoreTypesetter);
  }
  v165 = 0;
  v166 = 0;
  *(_QWORD *)&v164 = 255;
  -[NSCoreTypesetter setTextContainerSize:](v54, "setTextContainerSize:", a10, a11);
  -[NSTypesetter setLineFragmentPadding:](v54, "setLineFragmentPadding:", a12);
  -[NSCoreTypesetter setEnforcesMinimumTextLineFragment:](v54, "setEnforcesMinimumTextLineFragment:", 1);
  -[NSTypesetter setApplicationFrameworkContext:](v54, "setApplicationFrameworkContext:", v148);
  -[NSCoreTypesetter _stringDrawingCoreTextEngineWithOriginalString:rect:padding:graphicsContext:forceClipping:attributes:stringDrawingOptions:drawingContext:stringDrawingInterface:](v54, "_stringDrawingCoreTextEngineWithOriginalString:rect:padding:graphicsContext:forceClipping:attributes:stringDrawingOptions:drawingContext:stringDrawingInterface:", a1, a6, a4, a2, a3, v13, a8, a9, a10, a11, a12, &v164);
  v30 = v55;
  v31 = v56;
  v33 = v57;
  v32 = v58;
  objc_msgSend(v13, "setHasTruncatedRanges:", -[NSArray count](-[NSCoreTypesetter truncatedRanges](v54, "truncatedRanges"), "count") != 0);
  v59 = v134;
  if (__NSStringDrawingEngine_mainThreadCoreTypesetter)
    v59 = 0;
  if (v59 == 1)
    __NSStringDrawingEngine_mainThreadCoreTypesetter = (uint64_t)v54;
  else

  objc_msgSend(v13, "setActiveRenderers:", v139);
  if (a7)
    *a7 = BYTE1(v166);
  if ((_BYTE)v166 || LOBYTE(v164) == 255)
  {
    v138 = v165;
    v48 = v130;
    goto LABEL_101;
  }
  return v30;
}

void sub_18D5D9A98(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_18D5DADD0(_Unwind_Exception *a1)
{
  void *v1;

  objc_end_catch();
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D5DAE48(void *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x18D5DAD4CLL);
  }
  JUMPOUT(0x18D5DAE18);
}

void sub_18D5DAF98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __NSValidateCoreTextAttributes(CFDictionaryRef theDict, int a2, BOOL *a3)
{
  CFIndex Count;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __n128 v13;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  double v17;
  unint64_t v18;
  const void **v19;
  size_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __n128 v29;
  __n128 v30;
  __n128 v31;
  __n128 v32;
  double v33;
  id *v34;
  BOOL v35;
  int v36;
  uint64_t result;
  void *v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  BOOL *v43;
  const __CFString *v44;
  id v45;
  id v46;
  const __CFString *v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  if (__NSValidateCoreTextAttributes_invalidKeysOnce != -1)
    dispatch_once(&__NSValidateCoreTextAttributes_invalidKeysOnce, &__block_literal_global_257);
  Count = CFDictionaryGetCount(theDict);
  MEMORY[0x1E0C80A78](Count, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17);
  v18 = (8 * Count + 15) & 0xFFFFFFFFFFFFFFF0;
  v19 = (const void **)((char *)&v42 - v18);
  if ((unint64_t)(8 * Count) >= 0x200)
    v20 = 512;
  else
    v20 = 8 * Count;
  bzero((char *)&v42 - v18, v20);
  MEMORY[0x1E0C80A78](v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33);
  v34 = (id *)((char *)&v42 - v18);
  bzero(v34, v20);
  CFDictionaryGetKeysAndValues(theDict, v19, (const void **)v34);
  v48 = dyld_program_sdk_at_least();
  if (Count < 1)
  {
    v45 = 0;
    v46 = 0;
    v35 = 1;
LABEL_28:
    if (v43)
      *v43 = v35;
    v40 = v45;
    v41 = v46;
    if ((!v46 || !v45 || objc_msgSend(v46, "isEqual:"))
      && (unint64_t)objc_msgSend(v41, "renderingMode", v40) < 2)
    {
      return 1;
    }
  }
  else
  {
    v45 = 0;
    v46 = 0;
    v47 = CFSTR("NSFont");
    v35 = 1;
    v44 = CFSTR("NSOriginalFont");
    while (!CFSetContainsValue((CFSetRef)__NSValidateCoreTextAttributes_disallowedKeysForMeasurement, *v19))
    {
      if (v35)
      {
        v36 = CFSetContainsValue((CFSetRef)__NSValidateCoreTextAttributes_disallowedKeysForDrawing, *v19);
        v35 = v36 == 0;
        if (v36 && (a2 & 1) == 0)
          return 0;
      }
      else
      {
        v35 = 0;
        result = 0;
        if (!a2)
          return result;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v48)
          return 0;
        v38 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_Bool __NSValidateCoreTextAttributes(NSDictionary *, BOOL, NSTextApplicationFrameworkContext, BOOL *)"), CFSTR("NSCoreTypesetter.m"), 1834, CFSTR("Expected NSString type for attribute key, got %@ instead"), objc_opt_class());
      }
      if (objc_msgSend((id)*v19, "isEqualToString:", CFSTR("NSParagraphStyle")))
      {
        v39 = *v34;
        if (objc_msgSend((id)objc_msgSend(*v34, "textBlocks"), "count")
          || objc_msgSend((id)objc_msgSend(v39, "textLists"), "count"))
        {
          return 0;
        }
      }
      else if (objc_msgSend((id)*v19, "isEqualToString:", v47))
      {
        v46 = *v34;
      }
      else if (objc_msgSend((id)*v19, "isEqualToString:", v44))
      {
        v45 = *v34;
      }
      ++v34;
      ++v19;
      if (!--Count)
        goto LABEL_28;
    }
  }
  return 0;
}

uint64_t __NSTextContentStorageFlushUncachedTextElements(NSUInteger a1, uint64_t a2, char a3)
{
  uint64_t v3;
  char v7;
  char v8;
  uint64_t v9;
  int64x2_t *v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  uint64_t v14;
  NSUInteger v15;
  _QWORD *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *v20;
  NSString *v21;
  uint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  uint64_t v26;
  objc_class *v28;
  NSString *v29;
  id *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64x2_t *v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  _OWORD v40[2];
  __n128 v41;
  void *(*v42)(uint64_t, void *, uint64_t, uint64_t);
  void *v43;
  uint64_t v44;
  NSUInteger v45;
  _QWORD v46[6];
  _QWORD v47[7];

  v3 = *(_QWORD *)(a2 + 536);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v7 = *(_BYTE *)(a2 + 576);
  v8 = *(_BYTE *)(a2 + 577);
  if ((a3 & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 576))
      goto LABEL_10;
LABEL_8:
    v9 = a2 + 24;
    goto LABEL_11;
  }
  if (*(_BYTE *)(a2 + 576))
  {
    if (v3 > 63)
      goto LABEL_8;
    return 0;
  }
  if ((v3 & 0x8000000000000000) == 0)
    return 0;
LABEL_10:
  v9 = a2 + 8 * v3 + 32;
  v3 = 63 - v3;
LABEL_11:
  v10 = (int64x2_t *)(a2 + 536);
  if (v3 >= 1)
  {
    v11 = *(_QWORD *)(a2 + 544);
    v12 = *(_QWORD *)(a1 + 104);
    v13 = v11 < v12 || v11 - v12 >= *(_QWORD *)(a1 + 112);
    v39 = *(_BYTE *)(a2 + 576);
    if (!v13)
    {
      v35 = (int64x2_t *)(a2 + 536);
      v36 = *(_BYTE *)(a2 + 577);
      v38 = *(_QWORD *)(a2 + 552);
      v41 = 0uLL;
      v16 = *(_QWORD **)(a1 + 88);
      _NSBlockNumberForIndex(v16, v11, &v41);
      v18 = 0;
      if (v16[11] <= v17)
        v18 = v16[4] - v16[3];
      v19 = *(_QWORD *)(v16[7] + (v16[2] + 8) * (v18 + v17) + 8);
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      v22 = 0x7FFFFFFFFFFFFFFFLL;
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = ____NSTextContentStorageCacheElementIndexRange_block_invoke;
      v47[3] = &__block_descriptor_48_e18___NSString_16__0_8l;
      v47[4] = v11;
      v47[5] = v38;
      _UIFoundationAssert((void *)a1, v21, v19 == 0x7FFFFFFFFFFFFFFFLL, v47);
      if (v19 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = v36;
        v10 = v35;
LABEL_39:
        v7 = v39;
        goto LABEL_40;
      }
      v23 = v41.n128_u64[0];
      if (v41.n128_u64[0])
      {
        do
        {
          v41.n128_u64[0] = v23 - 1;
          v24 = *(_QWORD **)(a1 + 88);
          _NSBlockNumberForIndex(v24, v23 - 1, &v41);
          if (v24[11] <= v25)
            v26 = v24[4] - v24[3];
          else
            v26 = 0;
          v22 = *(_QWORD *)(v24[7] + (v24[2] + 8) * (v26 + v25) + 8);
          v23 = v41.n128_u64[0];
        }
        while (v22 == 0x7FFFFFFFFFFFFFFFLL && v41.n128_u64[0] != 0);
      }
      v28 = (objc_class *)objc_opt_class();
      v29 = NSStringFromClass(v28);
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = ____NSTextContentStorageCacheElementIndexRange_block_invoke_2;
      v46[3] = &__block_descriptor_48_e18___NSString_16__0_8l;
      v46[4] = v11;
      v46[5] = v38;
      _UIFoundationAssert((void *)a1, v29, v22 != 0x7FFFFFFFFFFFFFFFLL, v46);
      v15 = v22 + 1;
      v12 = v38 + v11;
      v37 = *(_QWORD *)(a1 + 104) - (v38 + v11) + *(_QWORD *)(a1 + 112);
      v8 = v36;
      v10 = v35;
LABEL_36:
      objc_msgSend(*(id *)(a1 + 96), "insertElements:count:atIndex:", 0, v3, v15);
      v41.n128_u64[0] = MEMORY[0x1E0C809B0];
      v41.n128_u64[1] = 3221225472;
      v42 = ____NSTextContentStorageCacheElementIndexRange_block_invoke_3;
      v43 = &__block_descriptor_48_e24_v32__0__8__NSRange_QQ_16l;
      v44 = v9;
      v45 = v15;
      __NSTextContentStorageEnumerateCachedElementsInElementIndexRange(a1, v15, v3, (uint64_t)&v41);
      v30 = (id *)v9;
      v31 = objc_msgSend(*(id *)(a1 + 88), "count");
      v32 = objc_msgSend((id)objc_msgSend((id)a1, "attributedString"), "length");
      v40[0] = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      v40[1] = xmmword_18D6CBD40;
      if (v32 > v31)
        objc_msgSend(*(id *)(a1 + 88), "insertElement:range:coalesceRuns:", v40, v31, v32 - v31, 1);
      __NSTextContentStorageUpdateElementIndexRangeForRange(a1, v30, v3, v15, v12, v37, v3);
      __NSTextContentStorageUpdateCachedRange(a1);
      goto LABEL_39;
    }
    if (v11 >= v12)
    {
      v14 = objc_msgSend(*(id *)(a1 + 96), "count");
      if (v14)
      {
        v15 = v14;
        v37 = 0;
        v12 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_36;
      }
      v12 = *(_QWORD *)(a1 + 104);
    }
    v15 = 0;
    v37 = *(_QWORD *)(a1 + 112);
    goto LABEL_36;
  }
LABEL_40:
  v33 = objc_msgSend((id)a1, "maximumNumberOfUncachedElements");
  if (v33)
    v34 = v33;
  else
    v34 = -1;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0x7FFFFFFFFFFFFFFFLL;
  bzero((void *)(a2 + 16), 0x208uLL);
  *v10 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  *(_QWORD *)(a2 + 552) = 0;
  *(_QWORD *)(a2 + 560) = v34;
  *(_QWORD *)(a2 + 568) = 0x7FFFFFFFFFFFFFFFLL;
  *(_BYTE *)(a2 + 576) = v7;
  *(_BYTE *)(a2 + 577) = v8;
  *(_DWORD *)(a2 + 578) = 0;
  *(_WORD *)(a2 + 582) = 0;
  return 1;
}

__n128 _NSBlockNumberForIndex(_QWORD *a1, unint64_t a2, __n128 *a3)
{
  unint64_t v6;
  __n128 result;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  __n128 *v22;
  unint64_t v23;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __n128 *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;

  v6 = a1[1];
  if (v6 <= a2)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("*** NSRunStorage, _NSBlockNumberForIndex(): index (%lu) beyond array bounds (%lu)"), a2, v6);
  v8 = a1[8];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
    v8 = a1[3];
    goto LABEL_5;
  }
  v23 = a1[9];
  v22 = (__n128 *)(a1 + 9);
  if (a2 < v23 || a2 - v23 >= a1[10])
  {
    if (a2 < v23)
    {
      v9 = 0;
    }
    else
    {
      v9 = v8 + 1;
      v25 = a1[3];
      if (v8 == v25 - 2)
      {
        v26 = a1[1];
      }
      else
      {
        v27 = v8 + 2;
        if (a1[11] <= (unint64_t)(v8 + 2))
          v28 = a1[4] - v25;
        else
          v28 = 0;
        v26 = *(_QWORD *)(a1[7] + (a1[2] + 8) * (v28 + v27));
        if (v27 >= a1[5])
          v26 += a1[6];
      }
      if (v26 > a2)
        goto LABEL_45;
      v9 = v8 + 2;
      v8 = a1[3];
    }
LABEL_5:
    v10 = v8 - 1;
    if (v9 < v8 - 1)
    {
      v11 = a1[7];
      v12 = a1[11];
      v13 = a1[2] + 8;
      v14 = a1[5];
      do
      {
        v15 = v9 + ((v10 - v9) >> 1);
        if (v12 <= v15)
          v16 = a1[4] - a1[3];
        else
          v16 = 0;
        v17 = *(_QWORD *)(v11 + v13 * (v16 + v15));
        if (v15 >= v14)
          v17 += a1[6];
        if (v17 <= a2)
        {
          v18 = a1[3];
          if (v15 == v18 - 1)
          {
            v19 = a1[1];
          }
          else
          {
            v20 = v15 + 1;
            if (v12 <= v15 + 1)
              v21 = a1[4] - v18;
            else
              v21 = 0;
            v19 = *(_QWORD *)(v11 + (v21 + v20) * v13);
            if (v20 >= v14)
              v19 += a1[6];
          }
          if (v19 > a2)
            v9 = v15;
          else
            v9 = v15 + 1;
          if (v19 > a2)
            v10 = v15;
        }
        else
        {
          v10 = v15 - 1;
        }
      }
      while (v9 < v10);
      goto LABEL_46;
    }
LABEL_45:
    v11 = a1[7];
    v12 = a1[11];
LABEL_46:
    v29 = v9;
    a1[8] = v9;
    if (v12 <= v9)
      v30 = a1[4] - a1[3];
    else
      v30 = 0;
    v31 = a1[2] + 8;
    v32 = *(_QWORD *)(v11 + v31 * (v30 + v29));
    a1[9] = v32;
    v33 = (__n128 *)(a1 + 9);
    v34 = a1[5];
    if (v29 >= v34)
    {
      v32 += a1[6];
      a1[9] = v32;
    }
    v35 = a1[3];
    if (v29 == v35 - 1)
    {
      v36 = a1[1];
    }
    else
    {
      v37 = v29 + 1;
      if (v12 <= v29 + 1)
        v38 = a1[4] - v35;
      else
        v38 = 0;
      v36 = *(_QWORD *)(v11 + (v38 + v37) * v31);
      if (v37 >= v34)
        v36 += a1[6];
    }
    a1[10] = v36 - v32;
    if (a3)
    {
      result = *v33;
      *a3 = *v33;
    }
    return result;
  }
  if (a3)
  {
    result = *v22;
    *a3 = *v22;
  }
  return result;
}

BOOL __NSScaledTextOversized(__CFString *a1, unint64_t a2, void *a3, uint64_t a4, void *a5, unint64_t a6, double a7, double a8, CGFloat a9, CGFloat a10, CGFloat a11, CGFloat a12)
{
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  _BOOL4 v30;
  unint64_t v31;
  unsigned __int8 v33;

  v33 = 0;
  objc_msgSend(a5, "setLayout:", 0);
  v24 = __NSStringDrawingEngine(a1, a3, a4, 0, a5, 0, &v33, a9, a10, a11, a12, 0.0);
  v27 = v26;
  if (a6 == 1)
  {
    v28 = a7 / v25;
    if (a7 / v25 >= a8 / v26)
      v28 = a8 / v26;
    return v28 < 1.0;
  }
  else
  {
    v30 = v26 > a8;
    if (a6)
    {
      v31 = objc_msgSend(a5, "numberOfLineFragments", v24);
      v30 = v27 > a8 || v31 > a6;
    }
    if (a2 >= 0x201)
      return v30;
    else
      return (v33 | v30) != 0;
  }
}

uint64_t __NSTextContentStorageQueryDocumentLocationDeltaForLocation(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v5;
  uint64_t result;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v3 = *(_QWORD *)(a1 + 128);
  if (!v3)
    return 0;
  v5 = *(_QWORD *)(a1 + 120);
  if (v3 + v5 <= a2)
    return *(_QWORD *)(a1 + 136);
  if (v5 > a2)
    return 0;
  if (!a3 || (result = *(_QWORD *)(a3 + 568), result == 0x7FFFFFFFFFFFFFFFLL))
  {
    result = 0;
    v11 = a2;
    v12 = 0;
    if (v5 < a2)
    {
      for (i = a2 - 1; ; --i)
      {
        v9 = objc_msgSend(*(id *)(a1 + 88), "elementAtIndex:effectiveRange:", i, &v11);
        if (v9)
        {
          v10 = *(_QWORD *)(v9 + 8);
          if (v10 != 0x7FFFFFFFFFFFFFFFLL)
            break;
        }
        if (v11 <= *(_QWORD *)(a1 + 120))
          return 0;
      }
      result = *(_QWORD *)(v9 + 16) + v10 - (v11 + v12);
      if (a3)
        *(_QWORD *)(a3 + 568) = result;
    }
  }
  return result;
}

void sub_18D5DC0B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D5DCC60(void *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  uint64_t v25;

  objc_begin_catch(exc_buf);
  *(_QWORD *)(v25 + 120) = a10;
  objc_exception_rethrow();
}

void sub_18D5DCCB0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,id a56,char a57)
{
  uint64_t v57;

  objc_end_catch();
  objc_destroyWeak(location);
  objc_destroyWeak(&a56);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose((const void *)(v57 - 224), 8);
  _Block_object_dispose((const void *)(v57 - 192), 8);
  JUMPOUT(0x18D5DCCECLL);
}

void sub_18D5DCD78(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D5DD304(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D5DD3A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

char *__NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation(_QWORD *a1, void *a2)
{
  uint64_t v4;
  size_t v5;
  char *v6;
  char *TextContainerEntryAtIndex;
  char *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[6];

  if (!a1[31])
    goto LABEL_12;
  v4 = objc_msgSend((id)objc_msgSend(a1, "textContentManager"), "documentRange");
  v5 = a1[31];
  v6 = (char *)a1[28];
  TextContainerEntryAtIndex = (char *)a1[29];
  v8 = &v6[72 * v5];
  if (!TextContainerEntryAtIndex
    || TextContainerEntryAtIndex < v6
    || TextContainerEntryAtIndex >= v8
    || (v9 = (void *)*((_QWORD *)TextContainerEntryAtIndex + 2)) == 0)
  {
LABEL_11:
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = ____NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation_block_invoke;
    v12[3] = &unk_1E26042E0;
    v12[4] = v4;
    v12[5] = v8;
    TextContainerEntryAtIndex = (char *)bsearch_b(a2, v6, v5, 0x48uLL, v12);
    if (TextContainerEntryAtIndex)
    {
LABEL_13:
      a1[29] = TextContainerEntryAtIndex;
      return TextContainerEntryAtIndex;
    }
LABEL_12:
    TextContainerEntryAtIndex = (char *)__NSTextLayoutManagerGetTextContainerEntryAtIndex(a1, 0x7FFFFFFFFFFFFFFFuLL, 1);
    goto LABEL_13;
  }
  if ((objc_msgSend(v9, "containsLocation:", a2) & 1) == 0)
  {
    if (objc_msgSend(a2, "compare:", objc_msgSend(*((id *)TextContainerEntryAtIndex + 2), "location")) == -1)
    {
      v10 = (TextContainerEntryAtIndex - v6) >> 3;
    }
    else
    {
      v6 = TextContainerEntryAtIndex + 72;
      v10 = (v8 - (TextContainerEntryAtIndex + 72)) >> 3;
    }
    v5 = 0x8E38E38E38E38E39 * v10;
    goto LABEL_11;
  }
  return TextContainerEntryAtIndex;
}

_QWORD *__NSTextLayoutManagerGetTextContainerEntryAtIndex(_QWORD *a1, unint64_t a2, int a3)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a1[31] <= a2)
  {
    v6 = a1[19];
    if (v6)
      result = a1 + 19;
    else
      result = 0;
    if (a3 && !v6)
    {
      objc_msgSend(a1, "_addTextContainerForLocation:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "textContentManager"), "documentRange"), "location"));
      if (a1[19])
        return a1 + 19;
      else
        return 0;
    }
  }
  else
  {
    v4 = a1[28];
    if ((a3 & (v4 == 0)) != 0)
      return 0;
    else
      return (_QWORD *)(v4 + 72 * a2);
  }
  return result;
}

void sub_18D5DDBB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void sub_18D5DDDC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D5DDEC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D5DDFBC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D5DE7D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D5DE898(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D5DECE0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __NSTextLayoutManagerFillSoftInvalidationToLocation(uint64_t a1, void *a2, double a3)
{
  id v6;
  void *v7;
  char *TextContainerEntryAndIndexForLocation;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  NSTextRange *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  NSTextRange *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  CGFloat MaxY;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v36;
  _QWORD v37[9];
  _QWORD v38[7];
  uint64_t v39;
  double *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  uint64_t v52;
  CGRect v53;

  v47 = 0;
  v48 = &v47;
  v49 = 0x3052000000;
  v50 = __Block_byref_object_copy__2;
  v51 = __Block_byref_object_dispose__2;
  v52 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  objc_sync_enter((id)a1);
  v6 = *(id *)(a1 + 256);
  v7 = v6;
  if (v6 && (!a2 || objc_msgSend(v6, "compare:", a2) == -1))
  {
    TextContainerEntryAndIndexForLocation = __NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation((_QWORD *)a1, v7);
    v9 = (uint64_t)TextContainerEntryAndIndexForLocation;
    if (TextContainerEntryAndIndexForLocation)
      v10 = *((_QWORD *)TextContainerEntryAndIndexForLocation + 7);
    else
      v10 = 0;
    v36 = (void *)objc_msgSend((id)objc_msgSend((id)a1, "textContentManager"), "documentRange");
    if (v9)
    {
      do
      {
        if (a2 && objc_msgSend(v7, "compare:", a2) != -1)
          break;
        v11 = *(void **)(v9 + 16);
        if (a1 + 152 == v9 || v11 == 0)
          v11 = v36;
        v13 = v11;
        v14 = objc_msgSend(-[NSTextRange location](v13, "location"), "compare:", v7);
        if (a2)
          v15 = objc_msgSend(a2, "compare:", -[NSTextRange endLocation](v13, "endLocation"));
        else
          v15 = 0;
        v39 = 0;
        v40 = (double *)&v39;
        v41 = 0x2020000000;
        v42 = 0;
        v16 = *(_QWORD *)(v9 + 8);
        if (!v16)
          v16 = objc_msgSend(v36, "location");
        v48[5] = v16;
        if (v14 == -1 || v15 == -1)
        {
          v18 = v7;
          if (v14 != -1)
            v18 = -[NSTextRange location](v13, "location");
          v19 = (uint64_t)a2;
          if (v15 != -1)
            v19 = -[NSTextRange endLocation](v13, "endLocation");
          if (objc_msgSend(v18, "compare:", v19) != -1)
          {
            ++v10;
            v20 = *(_QWORD *)(a1 + 248);
            v21 = *(_QWORD *)(a1 + 152);
            if (v21)
              v22 = v20 + 1;
            else
              v22 = *(_QWORD *)(a1 + 248);
            if (v10 >= v22)
            {
              v9 = 0;
            }
            else if (v20 <= v10)
            {
              if (v21)
                v9 = a1 + 152;
              else
                v9 = 0;
            }
            else
            {
              v9 = *(_QWORD *)(a1 + 224) + 72 * v10;
            }

            goto LABEL_66;
          }
          v23 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v18, v19);

          if (v14 == -1)
          {
            v24 = objc_msgSend(*(id *)(v9 + 16), "location");
            if (!v24)
              v24 = objc_msgSend(v36, "location");
            v25 = -[NSTextRange location](v23, "location");
            v38[0] = MEMORY[0x1E0C809B0];
            v38[1] = 3221225472;
            v38[2] = ____NSTextLayoutManagerFillSoftInvalidationToLocation_block_invoke;
            v38[3] = &unk_1E2604248;
            v38[4] = v24;
            v38[5] = &v39;
            v38[6] = &v47;
            objc_msgSend(*(id *)(a1 + 80), "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", v25, 1, v38);
          }
        }
        else
        {
          v23 = v13;
        }
        if (v40[3] < a3)
        {
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = ____NSTextLayoutManagerFillSoftInvalidationToLocation_block_invoke_2;
          v37[3] = &unk_1E2604270;
          *(double *)&v37[8] = a3;
          v37[4] = a1;
          v37[5] = &v39;
          v37[6] = &v47;
          v37[7] = &v43;
          if (objc_msgSend(-[NSTextRange endLocation](v23, "endLocation"), "isEqual:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "textContentManager"), "documentRange"), "endLocation")))objc_msgSend(*(id *)(a1 + 80), "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", -[NSTextRange location](v23, "location"), 2, v37);
          else
            objc_msgSend(*(id *)(a1 + 80), "enumerateTextLayoutFragmentInTextRange:options:usingBlock:", v23, 2, v37);
        }
        if (*((_BYTE *)v44 + 24))
        {
          if (objc_msgSend(*(id *)(v9 + 16), "isNotEmpty"))
          {
            v26 = (void *)objc_msgSend(*(id *)(a1 + 80), "textLayoutFragmentForTextLocation:allowsTrailingEdge:", objc_msgSend(*(id *)(v9 + 16), "endLocation"), 1);
            if (v26)
            {
              objc_msgSend(v26, "layoutFragmentFrame");
              MaxY = CGRectGetMaxY(v53);
              *(_QWORD *)(v9 + 32) = 0;
              *(CGFloat *)(v9 + 48) = MaxY;
            }
          }
        }
        v28 = objc_msgSend(*(id *)(v9 + 16), "endLocation");
        ++v10;
        v29 = *(_QWORD *)(a1 + 248);
        v30 = *(_QWORD *)(a1 + 152);
        if (v30)
          v31 = v29 + 1;
        else
          v31 = *(_QWORD *)(a1 + 248);
        if (v10 < v31)
        {
          if (v29 <= v10)
          {
            v9 = a1 + 152;
            if (v30)
              goto LABEL_58;
          }
          else
          {
            v32 = *(_QWORD *)(a1 + 224);
            if (v32)
            {
              v9 = v32 + 72 * v10;
LABEL_58:
              v33 = (id)v48[5];
              goto LABEL_60;
            }
          }
        }
        if (!v28)
        {
          v9 = 0;
          v33 = 0;
          goto LABEL_60;
        }
        v9 = 0;
        v33 = 0;
        if (objc_msgSend((id)v48[5], "compare:", v28) == -1)
          goto LABEL_58;
LABEL_60:

        v7 = v33;
LABEL_66:
        _Block_object_dispose(&v39, 8);
      }
      while (v9 && v7);
    }
    if ((objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 256)) & 1) == 0)
      objc_msgSend((id)a1, "_setSoftInvalidationLocation:onlyIfUpstream:", v7, 0);
  }

  objc_sync_exit((id)a1);
  if (*((_BYTE *)v44 + 24))
    v34 = v48[5];
  else
    v34 = 0;
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  return v34;
}

void sub_18D5DF278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  void *v32;
  uint64_t v33;

  objc_sync_exit(v32);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v33 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_18D5DF968(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D5DFA60(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D5DFBB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__n128 UINibDecoderDecodeObjectForValue(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  __n128 result;
  uint64_t v27;
  __n128 v28;
  uint64_t v29;
  _BYTE v30[256];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a3 == 10)
  {
    v4 = *(unsigned int *)(*(_QWORD *)(a1 + 72) + *(unsigned int *)(a2 + 4));
    if (v4 < *(_DWORD *)(a1 + 108) && !*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8 * v4))
    {
      v5 = *(_QWORD *)(a1 + 152);
      if (v5)
        v6 = *(_DWORD *)(v5 + 4 * v4);
      else
        v6 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 160) + v4);
      v7 = v6;
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v6))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v7) = objc_msgSend(*(id *)(a1 + 216), "nibDecoder:cannotDecodeObjectOfClassName:", a1, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v7));
        if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v7))
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("Could not instantiate class named %1$@ because no class named %1$@ was found; the class needs to be defined in source code or linked in from a library (ensure the class is part of the correct target)"),
            *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v7));
      }
      v28 = *(__n128 *)(a1 + 184);
      v29 = *(_QWORD *)(a1 + 200);
      *(_QWORD *)(a1 + 192) = 0;
      *(_QWORD *)(a1 + 200) = 0;
      *(_QWORD *)(a1 + 184) = 0;
      *(_QWORD *)(a1 + 184) = v4;
      v8 = *(objc_class **)(*(_QWORD *)(a1 + 32) + 8 * v7);
      v9 = *(_QWORD *)(a1 + 48);
      if (!*(_DWORD *)(v9 + 8 * v4 + 4)
        || *(_QWORD *)(a1 + 176) != *(_DWORD *)(*(_QWORD *)(a1 + 56) + 8 * *(unsigned int *)(v9 + 8 * v4)))
      {
        *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8 * v4) = objc_allocWithZone(v8);
        v16 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 144) + 8 * v4), "initWithCoder:", a1);
        v17 = v16;
        if (*(_BYTE *)(a1 + 204))
        {
          v18 = *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8 * v4);
          if (v18 != v16)
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("This coder is expecting the replaced object %p to be returned from %@.initWithCoder instead of <%@: %p>"), v18, v8, objc_opt_class(), v16);
        }
        *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8 * v4) = v17;
        *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8 * v4) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 144) + 8 * v4), "awakeAfterUsingCoder:", a1);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(*(id *)(a1 + 216), "nibDecoder:didDecodeObject:", a1, *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8 * v4));
        goto LABEL_39;
      }
      if (!-[objc_class isSubclassOfClass:](v8, "isSubclassOfClass:", *(_QWORD *)(a1 + 8)))
      {
        if (-[objc_class isSubclassOfClass:](v8, "isSubclassOfClass:", *(_QWORD *)(a1 + 24)))
        {
          *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8 * v4) = objc_allocWithZone(v8);
          v19 = UINibDecoderDecodeDictionary((_QWORD *)a1, *(void **)(*(_QWORD *)(a1 + 144) + 8 * v4));
        }
        else
        {
          if (!-[objc_class isSubclassOfClass:](v8, "isSubclassOfClass:", *(_QWORD *)(a1 + 16)))
          {
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Unkown special cased class %@"), v8);
            goto LABEL_39;
          }
          *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8 * v4) = objc_allocWithZone(v8);
          v19 = UINibDecoderDecodeSet((_QWORD *)a1, *(void **)(*(_QWORD *)(a1 + 144) + 8 * v4));
        }
        v20 = v19;
LABEL_38:
        *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8 * v4) = v20;
LABEL_39:
        result = v28;
        *(__n128 *)(a1 + 184) = v28;
        *(_QWORD *)(a1 + 200) = v29;
        return result;
      }
      *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8 * v4) = objc_allocWithZone(v8);
      v10 = (int *)(*(_QWORD *)(a1 + 48) + 8 * *(_QWORD *)(a1 + 184));
      v11 = v10[1];
      if (!(_DWORD)v11)
        __assert_rtn("UINibDecoderDecodeArray", "UINibDecoder.m", 608, "count >= 1 && \"It isn't possible to get here with count == 0.\"");
      v12 = *(void **)(*(_QWORD *)(a1 + 144) + 8 * v4);
      v13 = *v10;
      v14 = (v11 - 1);
      if (v14 < 0x21)
      {
        v15 = v30;
        if (v11 < 2)
          goto LABEL_35;
      }
      else
      {
        v15 = malloc_type_malloc(8 * v14, 0x80040B8603338uLL);
      }
      v27 = (v11 - 1);
      v21 = 0;
      v22 = 0;
      v23 = v13 + 1;
      v24 = v11 - 1;
      do
      {
        v25 = UINibDecoderDecodeObjectForValue(a1, *(_QWORD *)(a1 + 56) + 8 * (v23 + v21), *(unsigned __int8 *)(*(_QWORD *)(a1 + 64) + (v23 + v21)));
        *(_QWORD *)&v15[8 * v21] = v25;
        v22 |= v25 == 0;
        ++v21;
      }
      while (v24 != v21);
      if ((v22 & 1) != 0)
      {

        v20 = 0;
        goto LABEL_36;
      }
      v14 = v27;
LABEL_35:
      v20 = objc_msgSend(v12, "initWithObjects:count:", v15, v14);
LABEL_36:
      if (v15 != v30)
        free(v15);
      goto LABEL_38;
    }
  }
  return result;
}

void sub_18D5E0C70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int128 a15, uint64_t a16)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    *(_QWORD *)(*(_QWORD *)(v16 + *(int *)(v18 + 1332)) + 8 * v17) = 0;
    *(_QWORD *)(v16 + 200) = a16;
    *(_OWORD *)(v16 + 184) = a15;
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_18D5E0CBC()
{
  objc_end_catch();
  JUMPOUT(0x18D5E0CC4);
}

uint64_t UINibDecoderDecodeDictionary(_QWORD *a1, void *a2)
{
  int *v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;
  int v7;
  unint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  unsigned int i;
  uint64_t v15;
  BOOL v16;
  void *v18;
  _BYTE v19[256];
  _BYTE v20[256];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (int *)(a1[6] + 8 * a1[23]);
  v3 = v2[1];
  if (!(_DWORD)v3)
    UINibDecoderDecodeDictionary_cold_1();
  v4 = a2;
  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Invalid NSDictionary in archive. Illegal quantity of Keys and Values"));

    return 0;
  }
  v7 = *v2;
  v8 = v3 >> 1;
  if (v3 < 0x42)
  {
    v9 = v20;
    v10 = v19;
    if (v3 < 2)
      goto LABEL_26;
    v18 = a2;
  }
  else
  {
    v18 = a2;
    v9 = malloc_type_malloc(8 * v8, 0x80040B8603338uLL);
    v10 = malloc_type_malloc(8 * v8, 0x80040B8603338uLL);
  }
  v11 = 0;
  v12 = 0;
  if (v8 <= 1)
    v13 = 1;
  else
    v13 = v8;
  for (i = v7 + 2; ; i += 2)
  {
    *(_QWORD *)&v9[8 * v11] = UINibDecoderDecodeObjectForValue(a1, a1[7] + 8 * (i - 1), *(unsigned __int8 *)(a1[8] + i - 1));
    v15 = UINibDecoderDecodeObjectForValue(a1, a1[7] + 8 * i, *(unsigned __int8 *)(a1[8] + i));
    *(_QWORD *)&v10[8 * v11] = v15;
    if ((v12 & 1) == 0)
      break;
    if (++v11 == v13)
      goto LABEL_24;
    v12 = 1;
LABEL_22:
    ;
  }
  if (*(_QWORD *)&v9[8 * v11])
    v16 = v15 == 0;
  else
    v16 = 1;
  v12 = v16;
  if (++v11 != v13)
    goto LABEL_22;
  if ((v12 & 1) != 0)
  {
LABEL_24:

    v5 = 0;
    goto LABEL_27;
  }
  v4 = v18;
LABEL_26:
  v5 = objc_msgSend(v4, "initWithObjects:forKeys:count:", v10, v9, v8);
LABEL_27:
  if (v9 != v20)
    free(v9);
  if (v10 != v19)
    free(v10);
  return v5;
}

uint64_t UIContentSizeCategoryUnspecifiedFunction()
{
  return constantUIContentSizeCategoryUnspecified;
}

uint64_t initUIContentSizeCategoryUnspecified()
{
  void *v0;
  uint64_t *v1;
  uint64_t result;

  v0 = (void *)__NSGetFrameworkReference(0, 0);
  v1 = (uint64_t *)dlsym(v0, "UIContentSizeCategoryUnspecified");
  if (!v1)
    initUIContentSizeCategoryUnspecified_cold_1();
  result = *v1;
  constantUIContentSizeCategoryUnspecified = result;
  getUIContentSizeCategoryUnspecified[0] = UIContentSizeCategoryUnspecifiedFunction;
  return result;
}

CFTypeRef __UIFontDescriptorWithTextStyle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v11;
  void *v12;
  uint64_t v13;
  const void *v14;
  CFTypeRef v15;

  +[UIFont _normalizedContentSizeCategory:default:](UIFont, "_normalizedContentSizeCategory:default:", a2, a3);
  if (!(_DWORD)a4 && !a5 && !a6)
  {
    if (a7 == -1)
    {
      v11 = 0;
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  v12 = (void *)objc_opt_new();
  if ((_DWORD)a4)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a4), CFSTR("NSCTFontSymbolicTrait"));
  if (a5)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", a5, CFSTR("NSCTFontUIFontDesignTrait"));
  if (a6)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", a6, CFSTR("NSCTFontWeightTrait"));
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("NSCTFontTraitsAttribute"));

  if (a7 != -1)
  {
    if (v11)
    {
LABEL_15:
      v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a7);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CA8368]);
      goto LABEL_16;
    }
LABEL_14:
    v11 = (void *)objc_opt_new();
    goto LABEL_15;
  }
LABEL_16:
  v14 = (const void *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  v15 = (id)CFMakeCollectable(v14);

  return v15;
}

uint64_t __UIGetLegibilityWeight(void *a1)
{
  if (a1)
    return objc_msgSend(a1, "legibilityWeight");
  else
    return -1;
}

CTFontRef UINewFont(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, CGFloat a7, double a8)
{
  int v9;
  int v14;
  id v16;
  void *v18;
  CTFontRef v19;
  void *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  const __CTFont *v24;
  CTFontUIFontType v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t *v30;
  const __CFString **v31;
  uint64_t v32;
  UIFontDescriptor *v33;
  const __CTFont *v34;
  CTFontRef UIFontForLanguage;
  void *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  _QWORD v45[2];
  _QWORD v46[2];
  uint64_t v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[3];
  _QWORD v53[4];

  v53[3] = *MEMORY[0x1E0C80C00];
  if (a7 == 0.0 && a3 == 0)
    return (CTFontRef)+[UIFont _sharedZeroPointFont](UIFont, "_sharedZeroPointFont");
  v9 = a6;
  v14 = a2;
  if (a5)
  {
    if (a3)
      v16 = +[_UIFontCacheKey newSystemFontCacheKeyWithDesign:weight:width:pointSize:monospacedDigits:](_UIFontCacheKey, "newSystemFontCacheKeyWithDesign:weight:width:pointSize:monospacedDigits:", a3, a4, a6, a8, a7);
    else
      v16 = +[_UIFontCacheKey newSystemFontCacheKeyWithTraits:pointSize:width:](_UIFontCacheKey, "newSystemFontCacheKeyWithTraits:pointSize:width:", a2, a4, a7);
  }
  else
  {
    v16 = +[_UIFontCacheKey newFontCacheKeyWithFontName:traits:pointSize:](_UIFontCacheKey, "newFontCacheKeyWithFontName:traits:pointSize:", a1, a2, a7);
  }
  v18 = v16;
  v19 = (CTFontRef)objc_msgSend(+[UIFont _sharedFontCache](UIFont, "_sharedFontCache"), "retainedObjectForKey:", v16);
  if (!v19)
  {
    if (a5)
    {
      if (a3)
      {
        if (a4)
        {
          v53[0] = a3;
          v52[0] = CFSTR("NSCTFontUIFontDesignTrait");
          v52[1] = CFSTR("NSCTFontWeightTrait");
          v52[2] = CFSTR("NSCTFontProportionTrait");
          v53[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a8);
          v53[2] = a4;
          v20 = (void *)MEMORY[0x1E0C99D80];
          v21 = v53;
          v22 = v52;
          v23 = 3;
        }
        else
        {
          v50[0] = CFSTR("NSCTFontUIFontDesignTrait");
          v50[1] = CFSTR("NSCTFontWeightTrait");
          v51[0] = a3;
          v51[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a8);
          v20 = (void *)MEMORY[0x1E0C99D80];
          v21 = v51;
          v22 = v50;
          v23 = 2;
        }
        v26 = objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, v23);
        v27 = v26;
        if (v9)
        {
          v48[0] = CFSTR("NSCTFontFeatureSettingsAttribute");
          v45[0] = CFSTR("CTFeatureTypeIdentifier");
          v45[1] = CFSTR("CTFeatureSelectorIdentifier");
          v46[0] = &unk_1E26317B0;
          v46[1] = &unk_1E26317C8;
          v47 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
          v28 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
          v48[1] = CFSTR("NSCTFontTraitsAttribute");
          v49[0] = v28;
          v49[1] = v27;
          v29 = (void *)MEMORY[0x1E0C99D80];
          v30 = v49;
          v31 = (const __CFString **)v48;
          v32 = 2;
        }
        else
        {
          v43 = CFSTR("NSCTFontTraitsAttribute");
          v44 = v26;
          v29 = (void *)MEMORY[0x1E0C99D80];
          v30 = &v44;
          v31 = &v43;
          v32 = 1;
        }
        v33 = +[UIFontDescriptor fontDescriptorWithFontAttributes:](UIFontDescriptor, "fontDescriptorWithFontAttributes:", objc_msgSend(v29, "dictionaryWithObjects:forKeys:count:", v30, v31, v32));
        if (!v33)
        {
          v38 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIFont *__UIUncachedFontWithDescriptor(UIFontDescriptor *, CGFloat)"), CFSTR("UIFont.m"), 183, CFSTR("descriptor must not be nil!"));
        }
        v34 = CTFontCreateWithFontDescriptor((CTFontDescriptorRef)v33, a7, 0);
      }
      else
      {
        if (v14)
        {
          if ((v14 & 2) != 0)
          {
            v25 = kCTFontUIFontEmphasizedSystem;
          }
          else if ((v14 & 1) != 0)
          {
            v25 = kCTFontControlContentFontType|kCTFontUserFixedPitchFontType;
          }
          else if ((v14 & 0x10) != 0)
          {
            v25 = 104;
          }
          else if ((v14 & 8) != 0)
          {
            v25 = kCTFontMiniEmphasizedSystemFontType|0x60;
          }
          else if ((v14 & 4) != 0)
          {
            v25 = 102;
          }
          else
          {
            v25 = kCTFontUIFontSystem;
          }
        }
        else
        {
          v25 = kCTFontUIFontSystem;
        }
        UIFontForLanguage = CTFontCreateUIFontForLanguage(v25, a7, 0);
        v19 = UIFontForLanguage;
        if (!a4 || !UIFontForLanguage)
          goto LABEL_42;
        v36 = (void *)-[__CTFont fontDescriptor](UIFontForLanguage, "fontDescriptor");
        v40 = a4;
        v41 = CFSTR("NSCTFontTraitsAttribute");
        v39 = CFSTR("NSCTFontProportionTrait");
        v42 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
        v37 = objc_msgSend(v36, "fontDescriptorByAddingAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));

        v34 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v37, a7);
      }
      v24 = v34;
    }
    else
    {
      v24 = (const __CTFont *)_CTFontCreateWithNameAndSymbolicTraits();
    }
    v19 = v24;
LABEL_42:
    if (v19)
    {
      __CTFontGetExtraData(v19);
      objc_msgSend(+[UIFont _sharedFontCache](UIFont, "_sharedFontCache"), "setObject:forKey:", v19, v18);
    }
  }

  return v19;
}

const __CTFont *__UIFontForTextStyle(const __CTFont *result, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  _BOOL8 v13;
  const __CTFont *v14;
  const __CTFontDescriptor *v15;
  const __CTFont *v16;
  uint64_t ExtraData;

  if (result)
  {
    v9 = (uint64_t)result;
    v10 = +[UIFont _sharedFontCache](UIFont, "_sharedFontCache");
    if ((a5 & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      v12 = +[UIFont _normalizedContentSizeCategory:default:](UIFont, "_normalizedContentSizeCategory:default:", a2, a4);
      if (a3 == -1)
        v13 = _AXSEnhanceTextLegibilityEnabled() != 0;
      else
        v13 = a3 == 1;
      v11 = +[_UIFontCacheKey newFontCacheKeyWithTextStyle:contentSizeCategory:textLegibility:](_UIFontCacheKey, "newFontCacheKeyWithTextStyle:contentSizeCategory:textLegibility:", v9, v12, v13);
      v14 = (const __CTFont *)objc_msgSend(v10, "retainedObjectForKey:", v11);
      if (v14)
        goto LABEL_15;
    }
    v15 = (const __CTFontDescriptor *)__UIFontDescriptorWithTextStyle(v9, a2, a4, 0, 0, 0, a3);
    if (v15)
    {
      v16 = CTFontCreateWithFontDescriptor(v15, 0.0, 0);
      v14 = v16;
      if ((a5 & 1) == 0)
      {
        if (v16)
          objc_msgSend(v10, "setObject:forKey:", v16, v11);
      }
      if (!a5)
        goto LABEL_15;
    }
    else
    {
      v14 = 0;
      if (!a5)
        goto LABEL_15;
    }
    ExtraData = __CTFontGetExtraData(v14);
    *(_BYTE *)(ExtraData + 24) |= 2u;
LABEL_15:

    return v14;
  }
  return result;
}

CTLineRef __NSCoreTypesetterCreateBaseLineFromAttributedString(void *a1, CFIndex a2, unint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  BOOL v11;
  void *v12;
  uint64_t v13;
  const __CFDictionary *v14;
  CTLineRef Line;
  char v16;
  uint64_t v17;
  const __CTTypesetter *v18;
  _QWORD v20[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  void *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[2];
  _QWORD v36[3];
  CFRange v37;

  v36[2] = *MEMORY[0x1E0C80C00];
  v27 = 0;
  v28 = &v27;
  v29 = 0x3052000000;
  v30 = __Block_byref_object_copy__10;
  v31 = __Block_byref_object_dispose__10;
  v32 = a1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__10;
  v25 = __Block_byref_object_dispose__10;
  v26 = 0;
  if (!a2)
  {
    v11 = a3 >= objc_msgSend(a1, "length");
    if (!a6)
      goto LABEL_6;
    goto LABEL_5;
  }
  v11 = 0;
  if (a6)
  {
LABEL_5:
    v12 = (void *)v28[5];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = ____NSCoreTypesetterCreateBaseLineFromAttributedString_block_invoke;
    v20[3] = &unk_1E2605658;
    v20[6] = &v21;
    v20[4] = a6;
    v20[5] = &v27;
    objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSAttachment"), a2, a3, 0x100000, v20);
  }
LABEL_6:
  if (a4 == 1)
  {
    v13 = *MEMORY[0x1E0CA8608];
    v35[0] = *MEMORY[0x1E0CA8618];
    v35[1] = v13;
    v36[0] = MEMORY[0x1E0C9AAB0];
    v36[1] = MEMORY[0x1E0C9AAB0];
    v14 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
LABEL_16:
    v18 = CTTypesetterCreateWithAttributedStringAndOptions((CFAttributedStringRef)v28[5], v14);
    v37.location = a2;
    v37.length = a3;
    Line = CTTypesetterCreateLine(v18, v37);
    CFRelease(v18);
    goto LABEL_17;
  }
  if (a5)
  {
    Line = CTLineCreateWithAttributedString((CFAttributedStringRef)v28[5]);
    if (Line)
      v16 = v11;
    else
      v16 = 1;
    if ((v16 & 1) == 0)
    {
      v17 = CTLineCreateFromLineWithOffset();
      CFRelease(Line);
      Line = (CTLineRef)v17;
    }
  }
  else
  {
    Line = 0;
  }
  v33 = *MEMORY[0x1E0CA8608];
  v34 = MEMORY[0x1E0C9AAB0];
  v14 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
  if (!Line)
    goto LABEL_16;
LABEL_17:

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  return Line;
}

void sub_18D5E3624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18D5E4170(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_18D5E4190(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x18D5E4150);
}

uint64_t __NSConcreteTextStorageLockedForwarding(id *a1, uint64_t a2)
{
  int v4;
  uint64_t result;

  v4 = objc_msgSend(a1, "_lockForWritingWithExceptionHandler:", 0);
  objc_msgSend(a1[12], "beginEditing");
  (*(void (**)(uint64_t))(a2 + 16))(a2);
  result = objc_msgSend(a1[12], "endEditing");
  if (v4)
    return objc_msgSend(a1, "_unlock");
  return result;
}

void sub_18D5E4214(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_18D5E43DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D5E4F28(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_18D5E4F48(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x18D5E4EF4);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t __NSLineBreakStrategyStandardActualOptions(char a1)
{
  uint64_t result;

  if (!__NSUsesOptimalLineBreaking)
    return 7;
  result = 11;
  if ((a1 & 1) == 0 && !__NSUsesOptimalLineBreakingForNonJustifiedAlignments)
    return 7;
  return result;
}

unint64_t _NSCopyBreakIterator(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  __CFString *v11;
  unint64_t *v12;
  unint64_t v13;
  __CFString *v15;
  __CFString *v16;
  char buffer[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  if (shouldUseHangulWordPriorityWithLineBreakStrategy_once != -1)
    dispatch_once(&shouldUseHangulWordPriorityWithLineBreakStrategy_once, &__block_literal_global_18);
  defaultBreakLanguage();
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v5 || v6 == v5 || -[__CFString isEqualToString:](v6, "isEqualToString:", v5))
  {
    if (a4 >= 4)
      _NSCopyBreakIterator_cold_1();
    v8 = (unint64_t *)((char *)&__NSDefaultBreakers + 8 * a4);
    v9 = *v8;
    if (*v8)
    {
      do
      {
        v10 = __ldxr(v8);
        if (v10 != v9)
        {
          __clrex();
          goto LABEL_13;
        }
      }
      while (__stxr(0, v8));
      ubrk_setText();
      if ((a4 & 1) != 0)
        goto LABEL_31;
      goto LABEL_34;
    }
LABEL_13:
    v11 = v7;

    v5 = v11;
  }
  if ((-[__CFString isEqualToString:](v5, "isEqualToString:", NSPOSIXLocaleIdentifier) & 1) != 0
    || -[__CFString isEqualToString:](v5, "isEqualToString:", NSPOSIXLanguageIdentifier))
  {
    v12 = (unint64_t *)((char *)&_NSCopyBreakIterator_posixBreakerSeed + 8 * !(a4 & 1));
    if (!*v12)
    {
      v13 = ubrk_open();
      while (!__ldxr(v12))
      {
        if (!__stxr(v13, v12))
          goto LABEL_21;
      }
      __clrex();
      ubrk_close();
    }
LABEL_21:
    v9 = ubrk_clone();
    ubrk_setText();
    if ((a4 & 1) == 0 && v9)
LABEL_34:
      ubrk_setLineWordOpts();
  }
  else
  {
    v15 = v5;
    v5 = v15;
    v16 = v15;
    if ((a4 & 2) != 0)
    {
      v16 = v15;
      if (-[__CFString rangeOfString:](v15, "rangeOfString:", CFSTR("lb=")) == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR("@lb=strict"));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
    }
    CFStringGetCString(v16, buffer, 128, 0x600u);
    v9 = ubrk_open();
    if (!v9)
      v9 = ubrk_open();
    if ((a4 & 1) == 0 && v9)
      ubrk_setLineWordOpts();

  }
LABEL_31:

  return v9;
}

void _NSDisposeBreakIterator(unint64_t a1, void *a2, unsigned int a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  unint64_t *v10;

  v5 = a2;
  if (v5)
  {
    defaultBreakLanguage();
    v6 = objc_claimAutoreleasedReturnValue();
    if ((id)v6 == v5)
    {

    }
    else
    {
      v7 = (void *)v6;
      defaultBreakLanguage();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", v5);

      if (!v9)
        goto LABEL_11;
    }
  }
  ubrk_setText();
  v10 = (unint64_t *)((char *)&__NSDefaultBreakers + 8 * a3);
  while (!__ldxr(v10))
  {
    if (!__stxr(a1, v10))
      goto LABEL_12;
  }
  __clrex();
LABEL_11:
  ubrk_close();
LABEL_12:

}

void sub_18D5E9F3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id __NSCreateNormalizedLanguage(CFStringRef localeIdentifier)
{
  const __CFAllocator *v1;
  const __CFString *CanonicalLocaleIdentifierFromString;
  const __CFDictionary *ComponentsFromLocaleIdentifier;
  const __CFDictionary *v4;
  void *Value;
  id v6;

  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  CanonicalLocaleIdentifierFromString = CFLocaleCreateCanonicalLocaleIdentifierFromString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], localeIdentifier);
  ComponentsFromLocaleIdentifier = CFLocaleCreateComponentsFromLocaleIdentifier(v1, CanonicalLocaleIdentifierFromString);
  v4 = ComponentsFromLocaleIdentifier;
  if (!ComponentsFromLocaleIdentifier
    || (Value = (void *)CFDictionaryGetValue(ComponentsFromLocaleIdentifier, (const void *)*MEMORY[0x1E0C9B088])) == 0)
  {
    v6 = 0;
    if (!CanonicalLocaleIdentifierFromString)
      goto LABEL_7;
    goto LABEL_6;
  }
  v6 = Value;
  if (CanonicalLocaleIdentifierFromString)
LABEL_6:
    CFRelease(CanonicalLocaleIdentifierFromString);
LABEL_7:
  if (v4)
    CFRelease(v4);
  return v6;
}

uint64_t __NSShouldUseTokenizerForPushOut(const __CFString *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = __NSTokenizerLanguageSet();
  v3 = 0;
  if (a1)
  {
    v4 = (void *)v2;
    if (v2)
    {
      v5 = __NSCreateNormalizedLanguage(a1);
      if (v5)
        v3 = objc_msgSend(v4, "containsObject:", v5);
      else
        v3 = 0;

    }
  }
  return v3;
}

uint64_t __NSTokenizerLanguageSet()
{
  uint64_t result;

  result = __tokenizerLanguageSet;
  if (!__tokenizerLanguageSet)
  {
    if (_createTokenizerLanguageSet_onceToken != -1)
      dispatch_once(&_createTokenizerLanguageSet_onceToken, &__block_literal_global_264);
    return __tokenizerLanguageSet;
  }
  return result;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_copy__6(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__7(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__8(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__9(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__10(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__11(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__12(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__13(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__14(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__15(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__16(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__17(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_copy__18(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_18D5ED5AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __NSTextContentStorageGetElementIndexRangeForRange(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __n128 v13;

  v3 = a2;
  v5 = a2 + a3;
  v6 = objc_msgSend(*(id *)(a1 + 88), "count");
  if (v5 >= v6)
    v7 = v6;
  else
    v7 = v5;
  if (v3 >= v7)
    return 0x7FFFFFFFFFFFFFFFLL;
  v13 = 0uLL;
  do
  {
    v8 = *(_QWORD **)(a1 + 88);
    _NSBlockNumberForIndex(v8, v3, &v13);
    if (v8[11] <= v9)
      v10 = v8[4] - v8[3];
    else
      v10 = 0;
    v11 = *(_QWORD *)(v8[7] + (v8[2] + 8) * (v10 + v9) + 8);
    v3 = v13.n128_u64[1] + v13.n128_u64[0];
  }
  while (v13.n128_u64[1] + v13.n128_u64[0] < v7 && v11 == 0x7FFFFFFFFFFFFFFFLL);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  if (v3 < v7)
  {
    do
    {
      _NSBlockNumberForIndex(*(_QWORD **)(a1 + 88), v3, &v13);
      v3 = v13.n128_u64[1] + v13.n128_u64[0];
    }
    while (v13.n128_u64[1] + v13.n128_u64[0] < v7);
  }
  return v11;
}

void sub_18D5ED864(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D5ED8D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __defaultTabStops_block_invoke()
{
  unint64_t v0;
  uint64_t v1;
  NSTextTab *v2;
  NSTextTab *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 12);
  v0 = 1;
  v1 = MEMORY[0x1E0C9AA70];
  do
  {
    objc_opt_class();
    v2 = (NSTextTab *)__NSTextTabAllocMarkerInstance;
    if (!__NSTextTabAllocMarkerInstance)
      v2 = [NSTextTab alloc];
    v3 = -[NSTextTab initWithTextAlignment:location:options:](v2, "initWithTextAlignment:location:options:", 0, v1, (double)v0 * 28.0);
    objc_msgSend(v4, "addObject:", v3);

    ++v0;
  }
  while (v0 != 13);
  defaultTabStops_array = objc_msgSend(v4, "copyWithZone:", 0);

}

void sub_18D5EE870(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D5EED64(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18D5EF030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D5EF780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

void sub_18D5EFF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18D5F0028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D5F01A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D5F1000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v15;

  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_18D5F114C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D5F1834(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x18D5F17E8);
}

void sub_18D5F1850(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void __NSCoreTypesetterProcessTextLineFragment(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14)
{
  NSTextLineFragment *v28;
  NSTextLineFragment *v29;
  NSTextLineFragment *v30;

  v28 = [NSTextLineFragment alloc];
  if (a1)
    v29 = -[NSTextLineFragment initWithAttributedString:range:](v28, "initWithAttributedString:range:", a1, a4, a5);
  else
    v29 = -[NSTextLineFragment initWithString:attributes:range:](v28, "initWithString:attributes:range:", a2, a3, a4, a5);
  v30 = v29;
  -[NSTextLineFragment setGlyphOrigin:](v29, "setGlyphOrigin:", a8 + a14, a9);
  -[NSTextLineFragment setTypographicBounds:](v30, "setTypographicBounds:", a10, a11, a12 + a14 * 2.0, a13);
  -[NSTextLineFragment setPadding:](v30, "setPadding:", a14);
  -[NSTextLineFragment setApplicationFrameworkContext:](v30, "setApplicationFrameworkContext:", a6);
  (*(void (**)(uint64_t, NSTextLineFragment *))(a7 + 16))(a7, v30);

}

void sub_18D5F1F94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18D5F2C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,id location,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a64;
  char a72;

  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&a72, 8);
  _Block_object_dispose(&STACK[0x218], 8);
  _Unwind_Resume(a1);
}

void sub_18D5F30E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D5F385C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v15;

  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_18D5F3AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18D5F3F40(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D5F4158(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_18D5F43C4(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  _Block_object_dispose((const void *)(v2 - 96), 8);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D5F4460(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_18D5F4480(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x18D5F443CLL);
}

void *__NSTextElementGetFirstRepresentableChild(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t FirstRepresentableChild;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = (void *)objc_msgSend(a1, "childElements", 0);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = *(_QWORD *)v10;
LABEL_3:
  v5 = 0;
  while (1)
  {
    if (*(_QWORD *)v10 != v4)
      objc_enumerationMutation(v1);
    v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v5);
    if ((objc_msgSend(v6, "isRepresentedElement") & 1) != 0)
      return v6;
    FirstRepresentableChild = __NSTextElementGetFirstRepresentableChild(v6);
    if (FirstRepresentableChild)
      return (void *)FirstRepresentableChild;
    if (v3 == ++v5)
    {
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v6 = 0;
      if (v3)
        goto LABEL_3;
      return v6;
    }
  }
}

void sub_18D5F4BAC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D5F587C(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_18D5F58AC(void *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x18D5F5818);
  }
  JUMPOUT(0x18D5F58A0);
}

void __NSCoreTypesetterRenderLineAndAttachments(CTLineRef line, void *a2, uint64_t a3, void *a4, const __CFAttributedString *a5, uint64_t a6, int a7, uint64_t a8, CGFloat a9, CGFloat a10, CGFloat a11, CGFloat a12, CGFloat a13, CGFloat a14)
{
  const __CFArray *GlyphRuns;
  CFIndex Count;
  BOOL v24;
  CGContext *v25;
  CGContext *v26;
  CFIndex v27;
  uint64_t v28;
  const __CTRun *ValueAtIndex;
  CFDictionaryRef Attributes;
  uint64_t v31;
  void *v32;
  CFIndex location;
  double TypographicBounds;
  double v35;
  double v36;
  NSCountableTextLocation *v37;
  uint64_t v38;
  CGContext *c;
  BOOL v40;
  CGFloat descent;
  CGFloat ascent;
  CGPoint buffer;
  __int128 v46;
  CFRange v47;
  CFRange v48;
  NSRect v49;
  CGRect v50;

  if (line)
    _NSCoreTypesetterRenderLine(line, a2, a6, a5, a7, a8, a9, a10, a11, a12, a13, a14);
  if (a4 && a2)
  {
    GlyphRuns = CTLineGetGlyphRuns(line);
    Count = CFArrayGetCount(GlyphRuns);
    v49.origin.x = a11;
    v49.origin.y = a12;
    v49.size.width = a13;
    v49.size.height = a14;
    v24 = NSEqualRects(v49, *MEMORY[0x1E0CB3438]);
    v25 = (CGContext *)objc_msgSend(a2, "CGContext");
    v26 = v25;
    v40 = v24;
    if (!v24)
    {
      CGContextSaveGState(v25);
      v50.origin.x = a11;
      v50.origin.y = a12;
      v50.size.width = a13;
      v50.size.height = a14;
      CGContextClipToRect(v26, v50);
    }
    c = v26;
    if (Count >= 1)
    {
      v27 = 0;
      v28 = *MEMORY[0x1E0CA85C0];
      do
      {
        ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, v27);
        Attributes = CTRunGetAttributes(ValueAtIndex);
        if (-[__CFDictionary objectForKeyedSubscript:](Attributes, "objectForKeyedSubscript:", v28, c))
        {
          v31 = -[__CFDictionary objectForKeyedSubscript:](Attributes, "objectForKeyedSubscript:", CFSTR("NSAttachment"));
          if (v31)
          {
            v32 = (void *)v31;
            location = CTRunGetStringRange(ValueAtIndex).location;
            buffer = (CGPoint)0;
            v46 = 0u;
            descent = 0.0;
            ascent = 0.0;
            v47.location = 0;
            v47.length = 0;
            TypographicBounds = CTRunGetTypographicBounds(ValueAtIndex, v47, &ascent, &descent, 0);
            v48.location = 0;
            v48.length = 1;
            CTRunGetPositions(ValueAtIndex, v48, &buffer);
            *(double *)&v46 = TypographicBounds;
            buffer.x = a9 + buffer.x;
            if (objc_msgSend(a2, "isFlipped"))
            {
              v35 = descent;
              v36 = a10 + descent - buffer.y;
            }
            else
            {
              v35 = descent;
              v36 = buffer.y + a10 - descent;
            }
            buffer.y = v36;
            *((double *)&v46 + 1) = v35 + ascent;
            v37 = -[NSCountableTextLocation initWithIndex:]([NSCountableTextLocation alloc], "initWithIndex:", location);
            v38 = objc_msgSend(a4, "textContainerForLocation:", v37);
            objc_msgSend(v32, "_showWithBounds:attributes:location:textContainer:applicationFrameworkContext:acceptsViewProvider:", Attributes, v37, v38, a3, 0, buffer.x, buffer.y, v46);

          }
        }
        ++v27;
      }
      while (Count != v27);
    }
    if (!v40)
      CGContextRestoreGState(c);
  }
}

void _NSCoreTypesetterRenderLine(const __CTLine *a1, void *a2, uint64_t a3, const __CFAttributedString *a4, int a5, uint64_t a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10, CGFloat a11, CGFloat a12)
{
  CGContext *v24;
  BOOL v25;
  int v26;
  double v27;
  double x;
  double y;
  double width;
  double height;
  __int128 v32;
  const __CTLine *v33;
  CGAffineTransform v34;
  CGAffineTransform transform;
  CGAffineTransform v36;
  CGAffineTransform v37;
  NSRect v38;
  CGRect v39;
  CGRect BoundsWithOptions;

  if (!a2)
    return;
  v24 = (CGContext *)objc_msgSend(a2, "CGContext");
  v38.origin.x = a9;
  v38.origin.y = a10;
  v38.size.width = a11;
  v38.size.height = a12;
  v25 = NSEqualRects(v38, *MEMORY[0x1E0CB3438]);
  v26 = objc_msgSend(a2, "isFlipped");
  if (!v25)
  {
    CGContextSaveGState(v24);
    v39.origin.x = a9;
    v39.origin.y = a10;
    v39.size.width = a11;
    v39.size.height = a12;
    CGContextClipToRect(v24, v39);
  }
  v37.a = 1.0;
  v37.b = 0.0;
  v37.c = 0.0;
  v37.d = 1.0;
  v37.tx = 0.0;
  v37.ty = 0.0;
  CGContextSetTextMatrix(v24, &v37);
  memset(&v36, 0, sizeof(v36));
  CGContextGetCTM(&v36, v24);
  v27 = 1.0;
  transform.b = 0.0;
  transform.c = 0.0;
  if (v26)
    v27 = -1.0;
  transform.a = 1.0;
  transform.d = v27;
  transform.tx = a7;
  transform.ty = a8;
  CGContextConcatCTM(v24, &transform);
  if (a5)
  {
    BoundsWithOptions = CTLineGetBoundsWithOptions(a1, 8uLL);
    x = BoundsWithOptions.origin.x;
    y = BoundsWithOptions.origin.y;
    width = BoundsWithOptions.size.width;
    height = BoundsWithOptions.size.height;
  }
  else
  {
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  if (!a3)
  {
    CTLineDraw(a1, v24);
    if (!a4)
      goto LABEL_12;
    goto LABEL_11;
  }
  CTLineDrawWithAttributeOverrides();
  if (a4)
  {
LABEL_11:
    v32 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v34.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v34.c = v32;
    *(_OWORD *)&v34.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    CGContextSetTextMatrix(v24, &v34);
    v33 = CTLineCreateWithAttributedString(a4);
    CTLineDraw(v33, v24);
    CFRelease(v33);
  }
LABEL_12:
  v34 = v36;
  CGContextSetCTM();
  if (a6)
    (*(void (**)(uint64_t, CGContext *, double, double, double, double))(a6 + 16))(a6, v24, x, y, width, height);
  if (!v25)
    CGContextRestoreGState(v24);
}

uint64_t NSDefaultFont()
{
  if (NSDefaultFont_onceToken != -1)
    dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_14);
  return NSDefaultFont__defaultFont;
}

void sub_18D5F6F48(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D5F7434(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t UIColorFunction()
{
  return classUIColor;
}

uint64_t UIColorFunction_0()
{
  return classUIColor_0;
}

uint64_t UIColorFunction_1()
{
  return classUIColor_1;
}

double _NSStringDrawingCore(__CFString *a1, void *a2, uint64_t a3, unsigned int a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, double a9, uint64_t a10, void *a11)
{
  objc_class *v21;
  uint64_t v22;

  v21 = +[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass");
  if (a11)
    v22 = objc_msgSend(a11, "applicationFrameworkContext");
  else
    v22 = _NSTextScalingTypeForCurrentEnvironment();
  return __NSStringDrawingEngine(a1, a2, a3, a4, a11, (void *)-[objc_class graphicsContextForApplicationFrameworkContext:](v21, "graphicsContextForApplicationFrameworkContext:", v22), 0, a5, a6, a7, a8, a9);
}

void sub_18D5F85F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_18D5F8850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t setCurrentCGContextDuringBlock_iOS(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (softLinkUIGraphicsGetCurrentContext_0() == a1)
    return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
  ((void (*)(uint64_t))softLinkUIGraphicsPushContext[0])(a1);
  (*(void (**)(uint64_t))(a3 + 16))(a3);
  return softLinkUIGraphicsPopContext[0]();
}

char *textTabHashCFSetCallback(uint64_t a1)
{
  int v1;
  double v2;
  char *v3;

  v1 = *(_DWORD *)(a1 + 8);
  v2 = *(double *)(a1 + 16);
  v3 = *(char **)(a1 + 24);
  if (v3)
    v3 = (char *)CFHash(v3);
  return &v3[0x10000000 * v1 + (unint64_t)v2];
}

uint64_t textTabIsEqualCFSetCallback(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  if (*(_QWORD *)(a1 + 24))
    v3 = *(void **)(a1 + 24);
  else
    v3 = (void *)MEMORY[0x1E0C9AA70];
  if (*(_QWORD *)(a2 + 24))
    v4 = *(void **)(a2 + 24);
  else
    v4 = (void *)MEMORY[0x1E0C9AA70];
  if (((*(_DWORD *)(a2 + 8) ^ *(_DWORD *)(a1 + 8)) & 0xF) != 0 || *(double *)(a1 + 16) != *(double *)(a2 + 16))
    return 0;
  if (v3 == v4)
    return 1;
  return objc_msgSend(v3, "isEqualToDictionary:");
}

void sub_18D5F9504(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_18D5F9518(void *a1)
{
  char v1;

  objc_begin_catch(a1);
  if ((v1 & 1) != 0)
    JUMPOUT(0x18D5F94E4);
  JUMPOUT(0x18D5F94D4);
}

void sub_18D5F9694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _enableTextViewResizing(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t j;

  if ((*(_BYTE *)(result + 64) & 8) == 0)
  {
    v1 = result;
    if (!*(_WORD *)(result + 80) || (--*(_WORD *)(result + 80), !*(_WORD *)(result + 80)))
    {
      *(_DWORD *)(result + 64) |= 8u;
      v2 = objc_msgSend(*(id *)(result + 32), "count");
      result = objc_msgSend(*(id *)(v1 + 32), "count");
      if (result)
      {
        v3 = result;
        for (i = 0; i != v3; ++i)
        {
          result = CFStorageGetValueAtIndex();
          if ((*(_BYTE *)(result + 64) & 1) != 0)
            result = objc_msgSend((id)v1, "_recalculateUsageForTextContainerAtIndex:", i);
        }
      }
      if (v2)
      {
        for (j = 0; j != v2; ++j)
        {
          result = CFStorageGetValueAtIndex();
          if ((*(_BYTE *)(result + 64) & 2) != 0)
            result = objc_msgSend((id)v1, "_resizeTextViewForTextContainer:", objc_msgSend(*(id *)(v1 + 32), "objectAtIndex:", j));
        }
      }
      *(_DWORD *)(v1 + 64) &= ~8u;
    }
  }
  return result;
}

uint64_t _enableTextViewResizing_0(uint64_t result)
{
  int v1;
  uint64_t v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t j;

  v1 = *(_DWORD *)(result + 64);
  if ((v1 & 8) == 0)
  {
    v2 = result;
    if (!*(_WORD *)(result + 80) || (v3 = *(_WORD *)(result + 80) - 1, (*(_WORD *)(result + 80) = v3) == 0))
    {
      *(_DWORD *)(result + 64) = v1 | 8;
      v4 = objc_msgSend(*(id *)(result + 32), "count");
      result = objc_msgSend(*(id *)(v2 + 32), "count");
      if (result)
      {
        v5 = result;
        for (i = 0; i != v5; ++i)
        {
          result = CFStorageGetValueAtIndex();
          if ((*(_BYTE *)(result + 64) & 1) != 0)
            result = objc_msgSend((id)v2, "_recalculateUsageForTextContainerAtIndex:", i);
        }
      }
      if (v4)
      {
        for (j = 0; j != v4; ++j)
        {
          result = CFStorageGetValueAtIndex();
          if ((*(_BYTE *)(result + 64) & 2) != 0)
            result = objc_msgSend((id)v2, "_resizeTextViewForTextContainer:", objc_msgSend(*(id *)(v2 + 32), "objectAtIndex:", j));
        }
      }
      *(_DWORD *)(v2 + 64) &= ~8u;
    }
  }
  return result;
}

uint64_t _NSGlyphTreeGlyphIndexForCharacterAtIndex(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;

  v2 = a2;
  if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 208) + 56) & 4) == 0)
    return v2;
  v4 = _NSGlyphTreeMoveToCharacterIndex(a1, a2);
  v5 = *(_QWORD *)(a1 + 240) + 208;
  if (!v4)
  {
    v14 = *(_QWORD **)v5;
    v15 = v14 + 1;
    return *v15 + v2 - *v14;
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
  if (!*(_BYTE *)(v6 + 59) || (v7 = *(_QWORD *)(v6 + 32)) == 0)
  {
    v15 = (_QWORD *)(v5 + 24);
    v14 = (_QWORD *)(v5 + 16);
    return *v15 + v2 - *v14;
  }
  v9 = *(_QWORD *)(v5 + 16);
  v8 = *(_QWORD *)(v5 + 24);
  v10 = _NSGlyphNodePrimitiveRelativeGlyphIndexForRelativeCharacterIndex(*(_QWORD *)(v5 + 8), v2 - v9);
  v11 = v10 + v8;
  if (v8 < v10 + v8)
    v11 = v8;
  while (v8 + v10 > v8)
  {
    v12 = *(unsigned __int8 *)(v6 + 58);
    if (v12 == 2)
    {
      v13 = *(int *)(v7 + 4 * v10 - 4);
    }
    else if (v12 == 1)
    {
      v13 = *(__int16 *)(v7 - 2 + 2 * v10);
    }
    else if (*(_BYTE *)(v6 + 58))
    {
      v13 = 0;
    }
    else
    {
      v13 = *(char *)(v7 + v10 - 1);
    }
    --v10;
    if (v9 - v13 + v10 < v2)
      return v8 + v10 + 1;
  }
  return v11;
}

void _NSFastFillAllGlyphHolesForCharacterRange(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v6;
  void *v7;
  unint64_t *v8;
  __CFString *v10;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  char v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int v25;
  char v26;
  unint64_t v27;
  CFTypeRef cf;
  _OWORD v29[8];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  UniChar v36[64];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v34 = 0;
  v35 = 0;
  v6 = *(_QWORD *)(a1 + 240);
  v26 = objc_msgSend((id)objc_msgSend((id)a1, "textStorage"), "_isStringDrawingTextStorage");
  if ((v26 & 1) == 0 && !*(_QWORD *)(v6 + 56))
  {
    v7 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB38E0], "allocWithZone:", objc_msgSend((id)a1, "zone")), "init");
    v8 = (unint64_t *)(v6 + 56);
    while (!__ldaxr(v8))
    {
      if (!__stlxr((unint64_t)v7, v8))
        goto LABEL_8;
    }
    __clrex();

  }
LABEL_8:
  objc_msgSend(*(id *)(v6 + 56), "lock");
  v10 = (__CFString *)objc_msgSend(*(id *)(a1 + 8), "string");
  v33 = 0;
  v31 = 0u;
  v32 = 0u;
  v30 = 0u;
  memset(v29, 0, sizeof(v29));
  cf = 0;
  v25 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v25)
    cf = (CFTypeRef)__NSMainThreadScratchString;
  if (!v10)
    v10 = &stru_1E260C7D0;
  *(_QWORD *)&v30 = v10;
  *((_QWORD *)&v31 + 1) = 0;
  *(_QWORD *)&v32 = -[__CFString length](v10, "length");
  CharactersPtr = CFStringGetCharactersPtr(v10);
  CStringPtr = 0;
  *((_QWORD *)&v30 + 1) = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v10, 0x600u);
  *((_QWORD *)&v32 + 1) = 0;
  v33 = 0;
  *(_QWORD *)&v31 = CStringPtr;
  if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 208) + 56) & 1) != 0)
  {
    v13 = 0;
    v14 = a3 + a2;
    do
    {
      v27 = 0;
      v15 = -[__CFString length](v10, "length");
      v16 = v15;
      v17 = 0;
      v18 = *(_DWORD *)(a1 + 64);
      if ((v18 & 0x8000000) != 0)
        v19 = 2048;
      else
        v19 = 0x2000;
      if ((v18 & 0x8000000) != 0)
        v20 = 1024;
      else
        v20 = 4096;
      v21 = a3;
      if ((v18 & 0x40000000) != 0)
      {
        v17 = a2;
        v21 = a3;
        if (a2 < v15)
        {
          v17 = __NSGetClusterHeadWithLimit(v10, a2, (uint64_t)v29, (CFMutableStringRef *)&cf, v36);
          v21 = v14 - v17;
          if (v17 >= a2)
            v21 = a3;
        }
      }
      if (v21 <= v19)
        v22 = v19;
      else
        v22 = v21;
      _NSGlyphTreeGetFirstHoleAfterCharacterIndex(a1, v17, v22, &v35, &v27, &v34);
      v23 = v35;
      if (v35 + v20 < v17)
      {
        v24 = __NSGetClusterHeadWithLimit(v10, v17 - v20, (uint64_t)v29, (CFMutableStringRef *)&cf, v36);
        v27 += v35 - v24;
        v35 = v24;
        v34 = _NSGlyphTreeGlyphIndexForCharacterAtIndex(a1, v24);
        v23 = v35;
      }
      if (v14 <= v23 || v23 >= v16 || !v27)
        break;
      if ((v13 & 1) != 0)
      {
        v13 = 1;
      }
      else
      {
        v13 = objc_msgSend(*(id *)(a1 + 8), "_lockForReading");
        v23 = v35;
      }
      objc_msgSend((id)a1, "_fillGlyphHoleForCharacterRange:startGlyphIndex:desiredNumberOfCharacters:", v23);
    }
    while ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 208) + 56) & 1) != 0);
  }
  else
  {
    v13 = 0;
  }
  if (!cf)
  {
LABEL_42:
    if ((v13 & 1) == 0)
      goto LABEL_44;
    goto LABEL_43;
  }
  if (v25)
  {
    __NSMainThreadScratchString = (uint64_t)cf;
    goto LABEL_42;
  }
  CFRelease(cf);
  if ((v13 & 1) != 0)
LABEL_43:
    objc_msgSend(*(id *)(a1 + 8), "_unlock");
LABEL_44:
  if ((v26 & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 240) + 56), "unlock");
}

void _NSFastFillAllGlyphHolesForGlyphRange(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v6;
  void *v7;
  unint64_t *v8;
  __CFString *v10;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  char v13;
  unint64_t v14;
  int v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  int v25;
  char v26;
  unint64_t v27;
  unint64_t v28;
  CFTypeRef cf;
  _OWORD v30[8];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  unint64_t v35;
  UniChar v36[64];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v35 = 0;
  v6 = *(_QWORD *)(a1 + 240);
  HIDWORD(v24) = objc_msgSend((id)objc_msgSend((id)a1, "textStorage"), "_isStringDrawingTextStorage");
  if ((v24 & 0x100000000) == 0 && !*(_QWORD *)(v6 + 56))
  {
    v7 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB38E0], "allocWithZone:", objc_msgSend((id)a1, "zone")), "init");
    v8 = (unint64_t *)(v6 + 56);
    while (!__ldaxr(v8))
    {
      if (!__stlxr((unint64_t)v7, v8))
        goto LABEL_8;
    }
    __clrex();

  }
LABEL_8:
  objc_msgSend(*(id *)(v6 + 56), "lock");
  v10 = (__CFString *)objc_msgSend(*(id *)(a1 + 8), "string");
  v34 = 0;
  v32 = 0u;
  v33 = 0u;
  v31 = 0u;
  memset(v30, 0, sizeof(v30));
  cf = 0;
  LODWORD(v24) = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if ((_DWORD)v24)
    cf = (CFTypeRef)__NSMainThreadScratchString;
  if (!v10)
    v10 = &stru_1E260C7D0;
  *(_QWORD *)&v31 = v10;
  *((_QWORD *)&v32 + 1) = 0;
  *(_QWORD *)&v33 = -[__CFString length](v10, "length", v24);
  CharactersPtr = CFStringGetCharactersPtr(v10);
  CStringPtr = 0;
  *((_QWORD *)&v31 + 1) = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v10, 0x600u);
  *((_QWORD *)&v33 + 1) = 0;
  v34 = 0;
  *(_QWORD *)&v32 = CStringPtr;
  if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 208) + 56) & 1) != 0)
  {
    v13 = 0;
    do
    {
      v27 = 0;
      v28 = 0;
      v14 = -[__CFString length](v10, "length");
      v15 = *(_DWORD *)(a1 + 64);
      v16 = 2048;
      if ((v15 & 0x8000000) != 0)
      {
        v17 = 1024;
      }
      else
      {
        v16 = 0x2000;
        v17 = 4096;
      }
      if ((v15 & 0x40000000) != 0)
        v18 = a2;
      else
        v18 = 0;
      if (a3 <= v16)
        v19 = v16;
      else
        v19 = a3;
      _NSGlyphTreeGetFirstHoleAfterGlyphIndex(a1, v18, v19, (uint64_t *)&v28, &v27, &v35);
      v20 = v35;
      if (v17 + v35 < v18)
      {
        v35 = v18 - v17;
        v21 = _NSGlyphTreeCharacterIndexForGlyphAtIndex(a1, v18 - v17);
        v22 = __NSGetClusterHeadWithLimit(v10, v21, (uint64_t)v30, (CFMutableStringRef *)&cf, v36);
        if (v22 == v21)
        {
          v20 = v35;
        }
        else
        {
          v23 = v22;
          v20 = _NSGlyphTreeGlyphIndexForCharacterAtIndex(a1, v22);
          v35 = v20;
          v21 = v23;
        }
        v27 += v28 - v21;
        v28 = v21;
      }
      if (a2 + a3 <= v20 || v28 >= v14 || !v27)
        break;
      v13 = (v13 & 1) != 0 ? 1 : objc_msgSend(*(id *)(a1 + 8), "_lockForReading");
      objc_msgSend((id)a1, "_fillGlyphHoleForCharacterRange:startGlyphIndex:desiredNumberOfCharacters:");
    }
    while ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 208) + 56) & 1) != 0);
  }
  else
  {
    v13 = 0;
  }
  if (!cf)
  {
LABEL_41:
    if ((v13 & 1) == 0)
      goto LABEL_43;
    goto LABEL_42;
  }
  if (v25)
  {
    __NSMainThreadScratchString = (uint64_t)cf;
    goto LABEL_41;
  }
  CFRelease(cf);
  if ((v13 & 1) != 0)
LABEL_42:
    objc_msgSend(*(id *)(a1 + 8), "_unlock");
LABEL_43:
  if ((v26 & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 240) + 56), "unlock");
}

unint64_t _NSGlyphTreeGlyphRangeForCharacterRange(uint64_t a1, unint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9;
  unint64_t v10;
  unint64_t v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  unint64_t v48;
  unsigned int v49;
  int v50;
  unsigned int v51;
  unsigned int v52;
  BOOL v53;
  unsigned int v54;
  BOOL v55;
  unint64_t v56;
  unint64_t *v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  BOOL v61;
  unint64_t **v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t *v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  int *v94;
  char v95;
  uint64_t v96;
  char v97;
  char v98;
  char v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unsigned int v103;
  int v104;
  int v105;
  unsigned int v106;
  uint64_t v107;
  unint64_t v108;
  char v109;
  char v110;
  int v111;
  unint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;

  v9 = a3;
  v10 = a2;
  v12 = 0;
  v13 = &OBJC_IVAR___NSExtraLMData__glyphTree;
  if (a2)
  {
    v14 = 0;
    if (a3)
    {
      if (_NSGlyphTreeMoveToCharacterIndex(a1, a2))
      {
        v22 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
        if (*(_BYTE *)(v22 + 59) && *(_QWORD *)(v22 + 32))
        {
          v23 = a6;
          v24 = v9;
          v25 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
          v12 = _NSGlyphNodePrimitiveRelativeGlyphIndexForRelativeCharacterIndex(v22, v10 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224))+ v25;
          v9 = v24;
          a6 = v23;
        }
        else
        {
          v12 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232) + v10 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224);
        }
        v27 = 0xFFFFFF;
        v119 = v9;
        while (1)
        {
          v28 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
          if (*(_BYTE *)(v28 + 59) && (v29 = *(_QWORD *)(v28 + 32)) != 0)
          {
            v30 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
            v31 = *(unsigned __int8 *)(v28 + 58);
            v32 = v12 - v30;
            if (v31 == 2)
            {
              v33 = *(int *)(v29 + 4 * v32);
            }
            else if (v31 == 1)
            {
              v33 = *(__int16 *)(v29 + 2 * v32);
            }
            else
            {
              v33 = v31 ? 0 : *(char *)(v29 + v32);
            }
            v34 = 0;
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224) + v12 - v30 - v33;
            v35 = v12 >= v30 ? *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232) : v12;
            v36 = -v33;
            v37 = v29 + v12 - v30 - 1;
            v38 = v29 - 2 * v30 + 2 * v12 - 2;
            v39 = v29 - 4 * v30 + 4 * v12 - 4;
            while (v12 + v34 > v30)
            {
              if (v31 == 2)
              {
                v40 = *(int *)(v39 + 4 * v34);
              }
              else if (v31 == 1)
              {
                v40 = *(__int16 *)(v38 + 2 * v34);
              }
              else if (v31)
              {
                v40 = 0;
              }
              else
              {
                v40 = *(char *)(v37 + v34);
              }
              if (v36 + v40 != --v34)
              {
                v41 = v12 + v34 + 1;
                if ((_DWORD)a6)
                  goto LABEL_39;
                goto LABEL_36;
              }
            }
            v12 = v35;
            if (!v35)
              goto LABEL_72;
          }
          else
          {
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224) + v12 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
            if (!v12)
              goto LABEL_72;
          }
          v41 = v12;
          if ((_DWORD)a6)
            break;
LABEL_36:
          v12 = v41;
LABEL_65:
          if (v27 == 0xFFFFFF)
          {
LABEL_155:
            v12 = v41;
            v9 = v119;
            goto LABEL_72;
          }
          v55 = v12 >= v41;
          v9 = v119;
          if (v55)
            goto LABEL_72;
        }
LABEL_39:
        v114 = v14;
        v42 = a6;
        v43 = *(_QWORD *)(a1 + 240) + 208;
        v44 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
        if (*(_BYTE *)(v44 + 59))
        {
          v45 = 24 * v41;
          v12 = v41;
          do
          {
            v46 = *(_QWORD *)(v44 + 24);
            if (!v46)
              break;
            v47 = *(unsigned __int8 *)(v44 + 57);
            v48 = *(_QWORD *)(v43 + 24);
            switch(v47)
            {
              case 0:
                v49 = *(unsigned __int8 *)(v46 - v48 + v12);
                if (v49 >= 4)
                  v50 = *(unsigned __int8 *)(v46 - v48 + v12);
                else
                  v50 = 0xFFFFFF;
                if (v49 <= 0xEF)
                  v27 = v50;
                else
                  v27 = v49 & 3;
                break;
              case 1:
                v51 = *(unsigned __int16 *)(v46 - 2 * v48 + 2 * v12);
                v52 = v51 >> 8;
                v53 = v51 > 0xFF;
                v27 = ((char)v51 >> 7) & 0xFFFFFF;
                if (v53)
                  v27 = v52;
                break;
              case 2:
                v54 = *(_DWORD *)(v46 - 4 * v48 + 4 * v12);
                goto LABEL_55;
              case 3:
                v54 = *(_DWORD *)(v46 - 24 * v48 + v45);
LABEL_55:
                if (v54 > 0xFF)
                  v27 = v54 >> 8;
                else
                  v27 = ((char)v54 >> 7) & 0xFFFFFF;
                break;
              default:
                v27 = 0;
                break;
            }
            if (!v12 || v27)
            {
              a6 = v42;
              v14 = v114;
              if (!v27)
                goto LABEL_155;
              goto LABEL_65;
            }
            if (--v12 < v48 && !_NSGlyphTreeMoveToGlyphIndex(a1, v12))
              goto LABEL_71;
            v43 = *(_QWORD *)(a1 + 240) + 208;
            v44 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
            v45 -= 24;
          }
          while (*(_BYTE *)(v44 + 59));
        }
        if (a4)
          _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeGlyphRangeForCharacterRange missing glyphs 1"), v15, v16, v17, v18, v19, v20, v21, v110);
LABEL_71:
        v12 = v41;
        v9 = v119;
        LODWORD(a6) = v42;
        v14 = v114;
      }
      else
      {
        v26 = *(uint64_t **)(*(_QWORD *)(a1 + 240) + 208);
        v14 = *v26;
        v12 = v26[1];
      }
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_72:
  v56 = v10 + v9;
  if (!(v10 + v9))
    goto LABEL_90;
  v57 = *(unint64_t **)(*(_QWORD *)(a1 + 240) + 208);
  v58 = *v57;
  if (!*v57)
    goto LABEL_91;
  v59 = v57[1];
  if (!v59)
  {
LABEL_90:
    v58 = 0;
    goto LABEL_91;
  }
  v120 = v9;
  v115 = v14;
  if (v56 >= v58)
    goto LABEL_82;
  v60 = v56 - 1;
  v61 = _NSGlyphTreeMoveToCharacterIndex(a1, v56 - 1);
  v62 = (unint64_t **)(*(_QWORD *)(a1 + 240) + 208);
  if (!v61)
  {
    v66 = *v62;
    v58 = **v62;
    v59 = v66[1];
LABEL_82:
    v67 = v59 - 1;
    v118 = v58 - 1;
    goto LABEL_83;
  }
  v63 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
  v112 = v10;
  v113 = a7;
  v111 = a6;
  if (*(_BYTE *)(v63 + 59) && *(_QWORD *)(v63 + 32))
  {
    v64 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
    v65 = _NSGlyphNodePrimitiveRelativeGlyphIndexForRelativeCharacterIndex(v63, v60 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224))+ v64;
  }
  else
  {
    v65 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232) + v60 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224);
  }
  while (1)
  {
    v70 = *(_QWORD *)(a1 + 240);
    v71 = *v13;
    v72 = (_QWORD *)(v70 + v71);
    v73 = *(_QWORD *)(v70 + v71 + 8);
    if (*(_BYTE *)(v73 + 59) && (v74 = *(_QWORD *)(v73 + 32)) != 0)
    {
      v75 = v72[3];
      v76 = *(unsigned __int8 *)(v73 + 58);
      v77 = v65 - v75;
      if (v76 == 2)
      {
        v78 = *(int *)(v74 + 4 * v77);
      }
      else if (v76 == 1)
      {
        v78 = *(__int16 *)(v74 + 2 * v77);
      }
      else if (*(_BYTE *)(v73 + 58))
      {
        v78 = 0;
      }
      else
      {
        v78 = *(char *)(v74 + v77);
      }
      v80 = 0;
      v81 = v72[2];
      v82 = v81 + v65 - v75 - v78;
      v83 = *(_QWORD *)(v73 + 8) + v75;
      if (v83 <= v65 + 1)
        v84 = v65 + 1;
      else
        v84 = *(_QWORD *)(v73 + 8) + v75;
      v85 = v84 - 1;
      v86 = v74 + v77 + 1;
      v87 = v74 - 2 * v75 + 2 * v65 + 2;
      v88 = v74 - 4 * v75 + 4 * v65 + 4;
      do
      {
        if (v65 + v80 + 1 >= v83)
        {
          v118 = v81 + *(_QWORD *)v73 - 1;
          v65 = v85;
          goto LABEL_121;
        }
        if (v76 == 2)
        {
          v89 = *(int *)(v88 + 4 * v80);
        }
        else if (v76 == 1)
        {
          v89 = *(__int16 *)(v87 + 2 * v80);
        }
        else if (*(_BYTE *)(v73 + 58))
        {
          v89 = 0;
        }
        else
        {
          v89 = *(char *)(v86 + v80);
        }
        ++v80;
        v90 = v78 - v89 + v80;
      }
      while (v90 < 1);
      v91 = v65 + v81;
      v65 = v65 + v80 - 1;
      v79 = ~v75 + v91 - v89 + v80;
      if (v90 == 1)
        v79 = v82;
    }
    else
    {
      v75 = v72[3];
      v79 = v72[2] + v65 - v75;
    }
    v118 = v79;
LABEL_121:
    v92 = v65 + 1;
    if (v65 + 1 >= *(_QWORD *)(*v72 + 8) || (_DWORD)a6 == 0)
    {
      v67 = v65;
      v10 = v112;
      a7 = v113;
      goto LABEL_83;
    }
    v94 = v13;
    v95 = 0;
    v96 = 24 * v65 + 24;
    v97 = 1;
    while (2)
    {
      v67 = v65;
      v98 = v97;
      v99 = v95;
      v100 = v92;
      if (v92 >= *(_QWORD *)(v73 + 8) + v75)
      {
        if (!_NSGlyphTreeMoveToGlyphIndex(a1, v92))
          break;
        LODWORD(v71) = *v94;
        v70 = *(_QWORD *)(a1 + 240);
        v101 = *v94;
        v73 = *(_QWORD *)(v70 + v101 + 8);
      }
      else
      {
        v101 = (int)v71;
      }
      if (*(_BYTE *)(v73 + 59))
      {
        v102 = *(_QWORD *)(v73 + 24);
        if (v102)
        {
          v75 = *(_QWORD *)(v70 + v101 + 24);
          switch(*(_BYTE *)(v73 + 57))
          {
            case 0:
              v103 = *(unsigned __int8 *)(v102 - v75 + v100);
              if (v103 >= 4)
                v104 = v103;
              else
                v104 = 0xFFFFFF;
              if (v103 <= 0xEF)
                v105 = v104;
              else
                v105 = v103 & 3;
              goto LABEL_146;
            case 1:
              v106 = *(unsigned __int16 *)(v102 - 2 * v75 + 2 * v100);
              goto LABEL_142;
            case 2:
              v106 = *(_DWORD *)(v102 - 4 * v75 + 4 * v100);
              goto LABEL_142;
            case 3:
              v106 = *(_DWORD *)(v102 - 24 * v75 + v96);
LABEL_142:
              if (v106 > 0xFF)
              {
                v105 = v106 >> 8;
              }
              else
              {
                if ((v106 & 0x80) != 0)
                  break;
LABEL_144:
                v105 = 0;
              }
LABEL_146:
              v97 = 0;
              v92 = v100 + 1;
              v96 += 24;
              ++v65;
              v95 = 1;
              if (v105)
                break;
              continue;
            default:
              goto LABEL_144;
          }
        }
      }
      break;
    }
    v65 = v100 - 1;
    if ((v98 & 1) != 0)
      break;
    v13 = v94;
    v107 = *(_QWORD *)(a1 + 240) + *v94;
    v108 = *(_QWORD *)(v107 + 24);
    if (v65 < v108 || v65 >= *(_QWORD *)(*(_QWORD *)(v107 + 8) + 8) + v108)
    {
      v109 = v99 & _NSGlyphTreeMoveToGlyphIndex(a1, v100 - 1);
      v10 = v112;
      a7 = v113;
      LODWORD(a6) = v111;
      if ((v109 & 1) == 0)
        goto LABEL_83;
    }
    else
    {
      v10 = v112;
      a7 = v113;
      LODWORD(a6) = v111;
      if ((v98 & 1) != 0)
        goto LABEL_83;
    }
  }
  v67 = v100 - 1;
  v10 = v112;
  a7 = v113;
  v13 = v94;
LABEL_83:
  if (v120)
  {
    v14 = v115;
    v58 = v118 - v115 + 1;
    goto LABEL_91;
  }
  v12 = v67 + 1;
  v14 = v118 + 1;
  if (!a5 || (~*(_DWORD *)(a1 + 64) & 0xC000) != 0)
    goto LABEL_90;
  v58 = 0;
  v68 = *v13;
  if (v10 >= **(_QWORD **)(*(_QWORD *)(a1 + 240) + v68))
    v14 = **(_QWORD **)(*(_QWORD *)(a1 + 240) + v68);
  else
    v14 = v10;
LABEL_91:
  if (a7)
  {
    *a7 = v14;
    a7[1] = v58;
  }
  return v12;
}

BOOL _NSGlyphTreeMoveToCharacterIndex(uint64_t a1, unint64_t a2)
{
  _QWORD *i;
  _QWORD *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  BOOL j;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t v19;

  for (i = (_QWORD *)(*(_QWORD *)(a1 + 240) + 208); ; i = (_QWORD *)(*(_QWORD *)(a1 + 240) + 208))
  {
    v3 = (_QWORD *)i[1];
    if (!v3 || !v3[2])
      break;
    v4 = i[2];
    if (v4 <= a2 && *v3 + v4 > a2)
      goto LABEL_14;
    v5 = 24;
    while (1)
    {
      v6 = *(_QWORD *)(a1 + 240);
      v7 = *(_QWORD **)(v6 + 216);
      v8 = v7[2];
      v9 = *(_QWORD **)(v8 + v5);
      if (!v9)
        break;
      if (v7 == v9)
        goto LABEL_12;
      v10 = v9[1];
      *(_QWORD *)(v6 + 224) -= *v9;
      *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232) -= v10;
      v5 += 8;
      if (v5 == 48)
      {
        v8 = 0;
        v6 = *(_QWORD *)(a1 + 240);
        goto LABEL_12;
      }
    }
    v8 = 0;
LABEL_12:
    *(_QWORD *)(v6 + 216) = v8;
  }
  i[1] = *i;
  *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224) = 0;
LABEL_14:
  v11 = (_QWORD *)(*(_QWORD *)(a1 + 240) + 208);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224);
  if (v12 > a2)
    return 0;
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
  if (*(_QWORD *)v13 + v12 <= a2)
    return 0;
  for (j = *(_BYTE *)(v13 + 59) != 0; !*(_BYTE *)(v13 + 59); j = *(_BYTE *)(v13 + 59) != 0)
  {
    v15 = 24;
    while (1)
    {
      v16 = *(_QWORD *)(a1 + 240);
      v17 = *(_QWORD **)(*(_QWORD *)(v16 + 216) + v15);
      if (!v17)
        break;
      v18 = *(_QWORD *)(v16 + 224);
      v19 = *v17 + v18;
      if (v18 <= a2 && v19 > a2)
        break;
      *(_QWORD *)(v16 + 224) = v19;
      *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232) += v17[1];
      v15 += 8;
      if (v15 == 48)
      {
        v17 = 0;
        v16 = *(_QWORD *)(a1 + 240);
        break;
      }
    }
    *(_QWORD *)(v16 + 216) = v17;
    v11 = (_QWORD *)(*(_QWORD *)(a1 + 240) + 208);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
    if (!v13)
      goto LABEL_29;
  }
  if (!*(_QWORD *)(v13 + 16))
  {
LABEL_29:
    v11[1] = *v11;
    *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224) = 0;
    return j;
  }
  return 1;
}

uint64_t _NSClearGlyphIndexForPointCache(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 240) + 472) = 0;
  return result;
}

uint64_t _NSGlyphTreeGetFirstHoleAfterCharacterIndex(uint64_t result, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5, uint64_t *a6)
{
  unint64_t v9;
  uint64_t v10;
  unint64_t **v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;

  v9 = a2;
  v10 = result;
  v11 = (unint64_t **)(*(_QWORD *)(result + 240) + 208);
  v12 = *v11;
  v13 = **v11;
  if (((*v11)[7] & 2) == 0)
  {
    v14 = v13 - a2;
    result = _NSGlyphTreeGlyphIndexForCharacterAtIndex(result, a2);
    v15 = result;
    goto LABEL_21;
  }
  v15 = v12[1];
  if (((*v11)[7] & 1) == 0
    || (*(_QWORD *)(*(_QWORD *)(result + 240) + 216) = v12,
        *(_QWORD *)(*(_QWORD *)(result + 240) + 232) = 0,
        *(_QWORD *)(*(_QWORD *)(result + 240) + 224) = 0,
        v13 <= a2))
  {
LABEL_20:
    v14 = 0;
    v9 = v13;
    goto LABEL_21;
  }
  while (1)
  {
    v17 = *(_QWORD **)(v10 + 240);
    v18 = v17 + 26;
    v19 = (uint64_t *)v17[27];
    if (v19)
      break;
    v9 = v13;
LABEL_19:
    v18[1] = *v18;
    *(_QWORD *)(*(_QWORD *)(v10 + 240) + 232) = 0;
    *(_QWORD *)(*(_QWORD *)(v10 + 240) + 224) = 0;
    if (v9 >= v13)
      goto LABEL_20;
  }
  if (!*((_BYTE *)v19 + 59))
  {
    while (1)
    {
      v20 = v18[2];
      v21 = *v19;
      v22 = 24;
      while (1)
      {
        v23 = *(_QWORD *)(v10 + 240);
        v24 = *(uint64_t **)(*(_QWORD *)(v23 + 216) + v22);
        if (!v24)
          break;
        result = *((unsigned __int8 *)v24 + 56);
        v25 = *v24;
        v26 = *(_QWORD *)(v23 + 224);
        if ((result & 1) != 0)
        {
          v27 = v25 + v26;
          if (v9 < v27)
            break;
        }
        else
        {
          v27 = v26 + v25;
        }
        *(_QWORD *)(v23 + 224) = v27;
        *(_QWORD *)(*(_QWORD *)(v10 + 240) + 232) += v24[1];
        v22 += 8;
        if (v22 == 48)
        {
          v24 = 0;
          v23 = *(_QWORD *)(v10 + 240);
          break;
        }
      }
      *(_QWORD *)(v23 + 216) = v24;
      v17 = *(_QWORD **)(v10 + 240);
      v18 = v17 + 26;
      v19 = (uint64_t *)v17[27];
      if (!v19)
        break;
      if (*((_BYTE *)v19 + 59))
        goto LABEL_28;
    }
    v9 = v21 + v20;
    goto LABEL_19;
  }
LABEL_28:
  v14 = 0;
  v9 = v18[2];
  v15 = v18[3];
  if (a5)
  {
    if (a3)
    {
      v14 = *v19;
      result = _NSGlyphTreeMoveToCharacterIndex(v10, v17[28] + *v19);
      if ((_DWORD)result)
      {
        do
        {
          v28 = *(_QWORD *)(v10 + 240);
          v29 = *(_QWORD *)(v28 + 216);
          if (*(_BYTE *)(v29 + 59))
          {
            if (*(_QWORD *)(v29 + 24))
              v30 = 1;
            else
              v30 = v14 >= a3;
            if (v30)
              break;
          }
          else if (v14 >= a3)
          {
            break;
          }
          v14 += *(_QWORD *)v29;
          result = _NSGlyphTreeMoveToCharacterIndex(v10, *(_QWORD *)(v28 + 224) + *(_QWORD *)v29);
        }
        while ((result & 1) != 0);
      }
    }
  }
LABEL_21:
  if (a4)
    *a4 = v9;
  if (a5)
    *a5 = v14;
  if (a6)
    *a6 = v15;
  return result;
}

uint64_t _NSFastFillAllLayoutHolesUpToEndOfContainerForGlyphIndex(uint64_t a1, unint64_t a2)
{
  int *v4;
  uint64_t v5;
  int *v6;
  int *v7;
  int *v8;
  void *v9;
  unint64_t *v10;
  uint64_t result;
  char v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int *v22;
  int *v23;
  int *v24;
  int *v25;
  unint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  char v33;
  char v34;
  uint64_t v35;

  v4 = &OBJC_IVAR___NSLayoutManager__extraData;
  v35 = -1;
  v5 = *(_QWORD *)(a1 + 240);
  v6 = &OBJC_IVAR___NSExtraLMData__layoutTree;
  v7 = &OBJC_IVAR___NSLayoutManager__firstUnlaidCharIndex;
  v8 = &OBJC_IVAR___NSLayoutManager__firstUnlaidGlyphIndex;
  v32 = 1;
  do
  {
    v33 = objc_msgSend((id)objc_msgSend((id)a1, "textStorage"), "_isStringDrawingTextStorage");
    if ((v33 & 1) == 0 && !*(_QWORD *)(v5 + 56))
    {
      v9 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB38E0], "allocWithZone:", objc_msgSend((id)a1, "zone")), "init");
      v10 = (unint64_t *)(v5 + 56);
      while (!__ldaxr(v10))
      {
        if (!__stlxr((unint64_t)v9, v10))
          goto LABEL_9;
      }
      __clrex();

    }
LABEL_9:
    result = objc_msgSend(*(id *)(v5 + 56), "lock");
    if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + *v4) + *v6) + 56) & 1) == 0)
    {
      v13 = 0;
      goto LABEL_48;
    }
    v13 = 0;
    v34 = 0;
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)(a1 + *v7) == 0x7FFFFFFFFFFFFFFFLL || (v15 = *(_QWORD *)(a1 + *v8), v15 == 0x7FFFFFFFFFFFFFFFLL))
      {
        objc_msgSend((id)a1, "getFirstUnlaidCharacterIndex:glyphIndex:", 0, &v35);
        v15 = v35;
      }
      else
      {
        v35 = *(_QWORD *)(a1 + *v8);
      }
      v16 = a2 >= v15;
      v17 = a2 - v15;
      if (v16)
      {
        v21 = v17 / 0x64 + 100;
        if ((v13 & 1) == 0)
          goto LABEL_37;
        goto LABEL_43;
      }
      if (!v14)
      {
        if ((*(_BYTE *)(a1 + 67) & 0x40) != 0)
        {
          v14 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 0);
        }
        else if (objc_msgSend(*(id *)(a1 + 48), "count") <= a2)
        {
          v14 = 0;
        }
        else
        {
          v18 = *(_QWORD **)(a1 + 48);
          _NSBlockNumberForIndex(v18, a2, 0);
          v20 = 0;
          if (v18[11] <= v19)
            v20 = v18[4] - v18[3];
          v14 = *(_QWORD *)(v18[7] + (v18[2] + 8) * (v20 + v19) + 8);
        }
      }
      if ((*(_BYTE *)(a1 + 67) & 0x40) != 0)
      {
        result = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 0);
      }
      else
      {
        v22 = v8;
        v23 = v4;
        v24 = v7;
        v25 = v6;
        v26 = v35 - 1;
        if (objc_msgSend(*(id *)(a1 + 48), "count") <= v26)
        {
          result = 0;
        }
        else
        {
          v27 = *(_QWORD **)(a1 + 48);
          _NSBlockNumberForIndex(v27, v26, 0);
          v29 = 0;
          if (v27[11] <= v28)
            v29 = v27[4] - v27[3];
          result = *(_QWORD *)(v27[7] + (v27[2] + 8) * (v29 + v28) + 8);
        }
        v6 = v25;
        v7 = v24;
        v4 = v23;
        v8 = v22;
      }
      if (result != v14)
        break;
      v21 = 100;
      if ((v13 & 1) == 0)
      {
LABEL_37:
        if ((v34 & 1) != 0)
          v34 = 1;
        else
          v34 = objc_msgSend(*(id *)(a1 + 8), "_lockForReading");
        if ((*(_BYTE *)(a1 + 64) & 8) == 0)
          ++*(_WORD *)(a1 + 80);
        _NSFastFillAllGlyphHolesForGlyphRange(a1, a2, 1uLL);
      }
LABEL_43:
      result = objc_msgSend((id)a1, "_fillLayoutHoleAtIndex:desiredNumberOfLines:", 0, v21);
      v13 = 1;
      if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + *v4) + *v6) + 56) & 1) == 0)
        goto LABEL_46;
    }
    if ((v13 & 1) == 0)
      goto LABEL_48;
LABEL_46:
    if ((v34 & 1) != 0)
      result = objc_msgSend(*(id *)(a1 + 8), "_unlock");
LABEL_48:
    if ((v33 & 1) == 0)
      result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + *v4) + 56), "unlock");
    if ((v13 & 1) == 0)
      break;
    result = _enableTextViewResizing(a1);
    if (*(_QWORD *)(a1 + *v7) == 0x7FFFFFFFFFFFFFFFLL || (v30 = *(_QWORD *)(a1 + *v8), v30 == 0x7FFFFFFFFFFFFFFFLL))
    {
      result = objc_msgSend((id)a1, "getFirstUnlaidCharacterIndex:glyphIndex:", 0, &v35);
      v30 = v35;
    }
    else
    {
      v35 = *(_QWORD *)(a1 + *v8);
    }
    if (v30 > a2)
      break;
    v5 = *(_QWORD *)(a1 + *v4);
    v31 = *(_BYTE *)(*(_QWORD *)(v5 + *v6) + 56) & v32;
    v32 = 0;
  }
  while ((v31 & 1) != 0);
  return result;
}

uint64_t initUIGraphicsGetCurrentContext()
{
  void *v0;
  uint64_t (*v1)();

  v0 = (void *)__NSGetFrameworkReference(0, 0);
  v1 = (uint64_t (*)())dlsym(v0, "UIGraphicsGetCurrentContext");
  softLinkUIGraphicsGetCurrentContext[0] = v1;
  if (!v1)
    initUIGraphicsGetCurrentContext_cold_1();
  return v1();
}

uint64_t initUIGraphicsGetCurrentContext_0()
{
  void *v0;
  uint64_t (*v1)();

  v0 = (void *)__NSGetFrameworkReference(0, 0);
  v1 = (uint64_t (*)())dlsym(v0, "UIGraphicsGetCurrentContext");
  softLinkUIGraphicsGetCurrentContext_0 = v1;
  if (!v1)
    initUIGraphicsGetCurrentContext_cold_1_0();
  return v1();
}

void _NSLayoutTreeSetLineFragmentRectForGlyphRange(uint64_t a1, unint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  __CFString *v40;
  _QWORD *v41;
  unint64_t v42;
  double v43;
  _QWORD *v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  double *Leaf;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  unint64_t v65;
  double *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  double *v83;
  uint64_t v84;
  double v85;
  double v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v91;
  _QWORD *v92;
  double v93;
  unint64_t v94;
  _QWORD *v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  double *v100;
  double v101;
  double v102;
  double v103;
  double v104;
  __int128 v105;
  __int128 v106;
  double *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  _QWORD *v114;
  unint64_t v115;
  double v116;
  double v117;
  double v118;
  double v119;
  unint64_t __src;
  uint64_t v121;
  double v122;
  double v123;
  __int128 v124;
  double v125;
  double v126;
  __int128 v127;

  if (a3)
  {
    if (!_NSLayoutTreeMoveToGlyphIndex(a1, a2)
      || (v35 = a2 + a3,
          v36 = *(_QWORD *)(a1 + 240),
          v37 = *(_QWORD *)(v36 + 248),
          v38 = *(_QWORD *)(v36 + 256),
          v29 = *(_QWORD *)v37,
          v39 = *(_QWORD *)v37 + v38,
          v39 < a2 + a3))
    {
      v40 = CFSTR("!!! _NSLayoutTreeSetLineFragmentRectForGlyphRange invalid glyph range");
LABEL_5:
      _NSLayoutTreeLogDebug((NSString *)v40, v28, v29, v30, v31, v32, v33, v34, a17);
      return;
    }
    v41 = *(_QWORD **)(v37 + 24);
    if (v41)
    {
      v42 = 0;
      v43 = *(double *)(v36 + 264);
      v32 = a2 - v38;
      v44 = v41 + 4;
      v45 = *v41 - 1;
      while (1)
      {
        v46 = (v42 + v45) >> 1;
        v47 = v44[10 * v46] & 0x8FFFFFFFFFFFFFFFLL;
        if (v47 <= v32)
        {
          v42 = v46 + 1;
          if (v46 + 1 >= *v41)
          {
            v48 = *(_QWORD *)v37;
LABEL_36:
            v81 = v48 - v47;
            if (a2 != v47 + v38 || a3 != v81)
            {
              v40 = CFSTR("!!! _NSLayoutTreeSetLineFragmentRectForGlyphRange does not match existing range");
              goto LABEL_5;
            }
            v83 = (double *)&v44[10 * v46];
            v116 = v83[9];
            v119 = v43 + v83[7];
            __src = a2 - v38;
            v121 = 0;
            *(double *)&v127 = a6;
            *((double *)&v127 + 1) = a7;
            v125 = a4;
            v126 = a5 - v43;
            *(double *)&v124 = a10;
            *((double *)&v124 + 1) = a11;
            v122 = a8;
            v123 = a9 - v43;
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) + 24) = _NSGlyphRangeListSet(v41, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedFragmentCapacity, v29, 32, 0x50uLL, v32, a3, &__src);
            v84 = *(_QWORD *)(a1 + 240) + 240;
            v85 = a5 + a7;
            v86 = v119 + v116 - (a5 + a7);
            v87 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 248);
            v88 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256);
            v89 = *(_QWORD *)v87;
            if (v35 >= *(_QWORD *)v87 + v88 || v85 == v119 + v116)
              goto LABEL_54;
LABEL_45:
            v91 = 0;
            v92 = *(_QWORD **)(v87 + 24);
            v93 = *(double *)(v84 + 24);
            v94 = v35 - v88;
            v95 = v92 + 4;
            v96 = *v92 - 1;
            while (1)
            {
              v97 = (v91 + v96) >> 1;
              v98 = v95[10 * v97] & 0x8FFFFFFFFFFFFFFFLL;
              if (v98 <= v94)
              {
                v91 = v97 + 1;
                if (v97 + 1 >= *v92)
                {
                  v99 = v89;
LABEL_53:
                  v100 = (double *)&v95[10 * v97];
                  v101 = v100[6];
                  v102 = v100[2];
                  v103 = v93 + v100[3] - v86;
                  v104 = v93 + v100[7] - v86 - v93;
                  v105 = *((_OWORD *)v100 + 2);
                  v106 = *((_OWORD *)v100 + 4);
                  __src = v98;
                  v121 = 0;
                  v127 = v106;
                  v125 = v101;
                  v126 = v104;
                  v124 = v105;
                  v122 = v102;
                  v123 = v103 - v93;
                  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) + 24) = _NSGlyphRangeListSet(v92, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedFragmentCapacity, v89, 32, 0x50uLL, v98, v99 - v98, &__src);
                  v35 = v99 + v88;
                  v84 = *(_QWORD *)(a1 + 240) + 240;
                  v87 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 248);
                  v88 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256);
                  v89 = *(_QWORD *)v87;
                  if (v35 >= *(_QWORD *)v87 + v88)
                  {
LABEL_54:
                    *(double *)(v87 + 8) = *(double *)(v87 + 8) - v86;
                    _NSLayoutNodeSetInvariants(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248));
                    return;
                  }
                  goto LABEL_45;
                }
                if ((v95[10 * v91] & 0x8FFFFFFFFFFFFFFFLL) > v94)
                  goto LABEL_51;
              }
              else
              {
                v96 = v97 - 1;
              }
              if (v96 < v91)
              {
LABEL_51:
                v99 = v95[10 * v97 + 10] & 0x8FFFFFFFFFFFFFFFLL;
                goto LABEL_53;
              }
            }
          }
          if ((v44[10 * v42] & 0x8FFFFFFFFFFFFFFFLL) > v32)
            goto LABEL_13;
        }
        else
        {
          v45 = v46 - 1;
        }
        if (v45 < v42)
        {
LABEL_13:
          v48 = v44[10 * v46 + 10] & 0x8FFFFFFFFFFFFFFFLL;
          goto LABEL_36;
        }
      }
    }
    if (a2 > v38)
    {
      if (v39 > v35)
      {
        Leaf = _NSLayoutNodeCreateLeaf(v39 - v35, *(_QWORD *)(v36 + 336), *(double *)(v36 + 344));
        _NSLayoutTreeInsertNodeAfterCurrentNode(a1, (uint64_t)Leaf, v50, v51, v52, v53, v54, v55);
        v36 = *(_QWORD *)(a1 + 240);
        v37 = *(_QWORD *)(v36 + 248);
        v38 = *(_QWORD *)(v36 + 256);
      }
      v56 = v36 + 240;
      v57 = a2 - v38;
      v115 = *(_QWORD *)(v56 + 96);
      v117 = *(double *)(v56 + 104);
      if (!*(_BYTE *)(v37 + 59))
      {
        v58 = 0;
        v59 = v37 + 24;
        do
        {
          v60 = *(_QWORD *)(v59 + v58);
          if (v60)
          {
            _NSLayoutNodeFree(v60);
            *(_QWORD *)(v59 + v58) = 0;
          }
          v58 += 8;
        }
        while (v58 != 24);
      }
      *(_BYTE *)(v37 + 59) = 1;
      *(_QWORD *)v37 = v57;
      v61 = v57 - 1;
      if (!v57)
        v61 = 0;
      *(double *)(v37 + 8) = v117 * (double)(v61 / v115 + 1);
      *(_BYTE *)(v37 + 56) = a2 != v38;
      v62 = *(void **)(v37 + 24);
      if (v62)
      {
        free(v62);
        *(_QWORD *)(v37 + 24) = 0;
      }
      v63 = *(void **)(v37 + 32);
      if (v63)
      {
        free(v63);
        *(_QWORD *)(v37 + 32) = 0;
        *(_BYTE *)(v37 + 58) = 0;
      }
      v64 = *(void **)(v37 + 40);
      if (v64)
      {
        free(v64);
        *(_QWORD *)(v37 + 40) = 0;
      }
      _NSLayoutNodeSetInvariants(v37);
      v65 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 336);
      v118 = *(double *)(*(_QWORD *)(a1 + 240) + 344);
      v66 = (double *)malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
      v73 = (uint64_t)v66;
      *((_BYTE *)v66 + 59) = 1;
      *(_QWORD *)v66 = a3;
      v66[1] = v118 * (double)((a3 - 1) / v65 + 1);
      *((_BYTE *)v66 + 56) = 1;
      goto LABEL_31;
    }
    if (a2)
    {
      v80 = v39 - v35;
      if (v39 <= v35)
        _NSLayoutTreeDeleteCurrentNode(a1, v80, v29, v30, v31, v32, v33, v34);
      else
        _NSLayoutNodeInvalidate(*(_QWORD *)(v36 + 248), v80, *(_QWORD *)(v36 + 336), *(double *)(v36 + 344));
      if (!_NSLayoutTreeMoveToGlyphIndex(a1, a2 - 1))
      {
        v40 = CFSTR("!!! _NSLayoutTreeSetLineFragmentRectForGlyphRange found invalid glyph index");
        goto LABEL_5;
      }
      v114 = *(_QWORD **)(*(_QWORD *)(a1 + 240) + 248);
      if (v114[3] && (unint64_t)(*v114 + a3) <= 0x2000)
      {
        _NSLayoutNodeAppendLineFragment((uint64_t)v114, a3, v29, v30, v31, v32, v33, v34, *(double *)(*(_QWORD *)(a1 + 240) + 264), a4, a5, a6, a7, *(uint64_t *)&a8, *(uint64_t *)&a9, *(uint64_t *)&a10, *(uint64_t *)&a11);
        return;
      }
      v66 = _NSLayoutNodeCreateLeaf(a3, *(_QWORD *)(*(_QWORD *)(a1 + 240) + 336), *(double *)(*(_QWORD *)(a1 + 240) + 344));
      v73 = (uint64_t)v66;
LABEL_31:
      _NSLayoutNodeSetLineFragment((uint64_t)v66, a3, *(double *)(*(_QWORD *)(a1 + 240) + 264) + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) + 8), a4, a5, a6, a7, v67, v68, v69, v70, v71, v72, *(uint64_t *)&a8, *(uint64_t *)&a9, *(uint64_t *)&a10, *(uint64_t *)&a11);
      _NSLayoutTreeInsertNodeAfterCurrentNode(a1, v73, v74, v75, v76, v77, v78, v79);
      return;
    }
    if (v39 > v35)
    {
      v107 = _NSLayoutNodeCreateLeaf(v39 - v35, *(_QWORD *)(v36 + 336), *(double *)(v36 + 344));
      _NSLayoutTreeInsertNodeAfterCurrentNode(a1, (uint64_t)v107, v108, v109, v110, v111, v112, v113);
      v36 = *(_QWORD *)(a1 + 240);
      v37 = *(_QWORD *)(v36 + 248);
    }
    _NSLayoutNodeSetLineFragment(v37, a3, *(double *)(v36 + 264), a4, a5, a6, a7, v29, v30, v31, v32, v33, v34, *(uint64_t *)&a8, *(uint64_t *)&a9, *(uint64_t *)&a10, *(uint64_t *)&a11);
  }
}

uint64_t _NSLayoutNodeSetInvariants(uint64_t result)
{
  char v1;
  uint64_t v2;
  double v3;
  uint64_t i;
  uint64_t v5;

  for (; result; result = *(_QWORD *)(result + 16))
  {
    if (!*(_BYTE *)(result + 59))
    {
      v1 = 0;
      v2 = 0;
      v3 = 0.0;
      for (i = 24; i != 48; i += 8)
      {
        v5 = *(_QWORD *)(result + i);
        if (v5)
        {
          v2 += *(_QWORD *)v5;
          v3 = v3 + *(double *)(v5 + 8);
          v1 |= *(_BYTE *)(v5 + 56);
        }
      }
      *(_QWORD *)result = v2;
      *(double *)(result + 8) = v3;
      *(_BYTE *)(result + 56) = v1;
    }
  }
  return result;
}

uint64_t _NSLayoutNodeSetLineFragment(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  size_t v29;
  unint64_t *v30;
  unint64_t v31;
  char *v32;
  _OWORD *v33;
  double *v34;
  _QWORD *v35;

  v24 = *(void **)(a1 + 24);
  if (v24)
  {
    free(v24);
    *(_QWORD *)(a1 + 24) = 0;
  }
  v25 = *(void **)(a1 + 32);
  if (v25)
  {
    free(v25);
    *(_QWORD *)(a1 + 32) = 0;
    *(_BYTE *)(a1 + 58) = 0;
  }
  v26 = *(void **)(a1 + 40);
  if (v26)
  {
    free(v26);
    *(_QWORD *)(a1 + 40) = 0;
  }
  *(_QWORD *)a1 = a2;
  *(_BYTE *)(a1 + 56) = 2;
  v27 = *MEMORY[0x1E0C85AD8] >> 3;
  if (v27 >= 0x2000)
    v27 = 0x2000;
  if (v27 <= 1)
    v27 = 1;
  if (*MEMORY[0x1E0C85AD8] >= 0x10uLL)
    v28 = 16;
  else
    v28 = v27;
  v29 = 80 * v28 + 32;
  v30 = *(unint64_t **)(a1 + 24);
  if (v30)
  {
    v31 = *v30;
    v32 = (char *)malloc_type_realloc(v30, v29, 0xFBC9DBC4uLL);
    *(_QWORD *)(a1 + 24) = v32;
    if (v28 > v31)
      bzero(&v32[80 * v31 + 32], 80 * (v28 - v31));
  }
  else
  {
    v33 = malloc_type_calloc(1uLL, v29, 0x70A7E097uLL);
    *(_QWORD *)(a1 + 24) = v33;
    v33[1] = *MEMORY[0x1E0CB3440];
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 24) + 8) = v28;
  **(_QWORD **)(a1 + 24) = 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 24) + 32) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 24) + 40) = 0;
  v34 = *(double **)(a1 + 24);
  v34[10] = a4;
  v34[11] = a5;
  v34[12] = a6;
  v34[13] = a7;
  v35 = *(_QWORD **)(a1 + 24);
  v35[6] = a14;
  v35[7] = a15;
  v35[8] = a16;
  v35[9] = a17;
  *(double *)(*(_QWORD *)(a1 + 24) + 88) = *(double *)(*(_QWORD *)(a1 + 24) + 88) - a3;
  *(double *)(*(_QWORD *)(a1 + 24) + 56) = *(double *)(*(_QWORD *)(a1 + 24) + 56) - a3;
  *(double *)(a1 + 8) = a5 + a7 - a3;
  return _NSLayoutNodeSetInvariants(a1);
}

void _NSLayoutTreeInsertNodeAfterCurrentNode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  BOOL v9;
  _QWORD *v10;
  _QWORD *v12;
  unint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  _QWORD *v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = *(_QWORD **)(*(_QWORD *)(a1 + 240) + 248);
  if (v8)
    v9 = a2 == 0;
  else
    v9 = 1;
  if (v9)
    return;
  v10 = (_QWORD *)a2;
  v23 = 0u;
  v24 = 0u;
  while (1)
  {
    v12 = (_QWORD *)v8[2];
    if (!v12)
    {
      v22 = malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
      v22[1] = 0;
      v22[3] = v8;
      v22[4] = v10;
      v8[2] = v22;
      v10[2] = v22;
      _NSLayoutNodeSetInvariants((uint64_t)v22);
      *(_QWORD *)(*(_QWORD *)(a1 + 240) + 240) = v22;
      return;
    }
    v13 = 0;
    while (1)
    {
      v14 = (_QWORD *)v12[v13 + 3];
      if (!v14)
        break;
      if (v8 == v14)
      {
        v14 = v8;
        break;
      }
      if (++v13 == 3)
      {
        v14 = 0;
        break;
      }
    }
    if (v8 != v14)
    {
      _NSLayoutTreeLogDebug((NSString *)CFSTR("!!! _NSLayoutTreeInsertNodeAfterCurrentNode found broken link"), a2, a3, a4, a5, a6, a7, a8, v23);
      v12 = v8;
      v15 = v10;
      if (!v8)
        return;
      goto LABEL_23;
    }
    if (!v12[5])
      break;
    v15 = malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
    v16 = 0;
    v15[1] = 0;
    do
    {
      *(_QWORD *)((char *)&v23 + v16 * 8) = v12[v16 + 3];
      v12[v16 + 3] = 0;
      ++v16;
    }
    while (v16 != 3);
    v17 = v13 + 1;
    if (v13 <= 1)
    {
      v18 = 0;
      do
      {
        *((_QWORD *)&v24 + v18 + 1) = *((_QWORD *)&v23 + v18 + 2);
        v19 = v18 + 2;
        --v18;
      }
      while (v19 > v17);
    }
    *((_QWORD *)&v23 + v17) = v10;
    v20 = v23;
    v12[3] = v23;
    *(_QWORD *)(v20 + 16) = v12;
    v12[4] = *((_QWORD *)&v20 + 1);
    *(_QWORD *)(*((_QWORD *)&v20 + 1) + 16) = v12;
    _NSLayoutNodeSetInvariants((uint64_t)v12);
    v21 = v24;
    v15[3] = v24;
    *(_QWORD *)(v21 + 16) = v15;
    v15[4] = *((_QWORD *)&v21 + 1);
    *(_QWORD *)(*((_QWORD *)&v21 + 1) + 16) = v15;
    _NSLayoutNodeSetInvariants((uint64_t)v15);
LABEL_23:
    v10 = v15;
    v8 = v12;
    if (!v15)
      return;
  }
  if (!v13)
    v12[5] = v12[4];
  v12[v13 + 4] = v10;
  v10[2] = v12;
  _NSLayoutNodeSetInvariants((uint64_t)v12);
}

double *_NSLayoutNodeCreateLeaf(uint64_t a1, unint64_t a2, double a3)
{
  double *result;
  unint64_t v7;

  result = (double *)malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
  *((_BYTE *)result + 59) = 1;
  *(_QWORD *)result = a1;
  v7 = a1 - 1;
  if (!a1)
    v7 = 0;
  result[1] = (double)(v7 / a2 + 1) * a3;
  *((_BYTE *)result + 56) = a1 != 0;
  return result;
}

uint64_t _NSLayoutNodeAppendLineFragment(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8, double a9, double a10, double a11, double a12, double a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  unint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  int v26;
  __int128 v27;
  unint64_t *v28;
  uint64_t v29;
  size_t v30;
  _QWORD *v31;
  unint64_t v38;
  __int128 v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  unint64_t v47;
  uint64_t v48;

  v22 = *(_QWORD *)a1;
  v23 = *(_QWORD *)a1 + a2;
  *(_QWORD *)a1 = v23;
  v24 = *(_QWORD **)(a1 + 24);
  v38 = v22;
  *(_QWORD *)&v39 = 0;
  v45 = a12;
  v46 = a13;
  v43 = a10;
  v44 = a11 - a9;
  v41 = a16;
  v42 = a17;
  *((_QWORD *)&v39 + 1) = a14;
  v40 = *(double *)&a15 - a9;
  *(_QWORD *)(a1 + 24) = _NSGlyphRangeListSet(v24, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedFragmentCapacity, v23, 32, 0x50uLL, v22, a2, &v38);
  v25 = *(_QWORD **)(a1 + 32);
  if (v25)
  {
    v26 = *(unsigned __int8 *)(a1 + 58);
    v27 = *MEMORY[0x1E0CB3430];
    v47 = 0;
    v48 = 0;
    v38 = 0;
    v39 = 0uLL;
    if (v26 == 1)
    {
      v38 = v22;
      v39 = v27;
      v28 = &v38;
    }
    else
    {
      v28 = 0;
      if (!v26)
      {
        v47 = v22;
        v48 = v27;
        v28 = &v47;
      }
    }
    v29 = 24;
    if (v26 != 1)
      v29 = 0;
    if (v26)
      v30 = v29;
    else
      v30 = 16;
    *(_QWORD *)(a1 + 32) = _NSGlyphRangeListSet(v25, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedLocationCapacity, v23, 16, v30, v22, a2, v28);
  }
  v31 = *(_QWORD **)(a1 + 40);
  if (v31)
  {
    v38 = v22;
    __asm { FMOV            V0.2D, #-1.0 }
    v39 = _Q0;
    *(_QWORD *)(a1 + 40) = _NSGlyphRangeListSet(v31, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedAttachmentSizeCapacity, v23, 16, 0x18uLL, v22, a2, &v38);
  }
  *(double *)(a1 + 8) = a11 + a13 - a9;
  return _NSLayoutNodeSetInvariants(a1);
}

uint64_t UIApplicationDidEnterBackgroundNotificationFunction()
{
  return constantUIApplicationDidEnterBackgroundNotification;
}

uint64_t UIApplicationDidEnterBackgroundNotificationFunction_0()
{
  return constantUIApplicationDidEnterBackgroundNotification_0;
}

uint64_t initUIApplicationDidEnterBackgroundNotification()
{
  void *v0;
  uint64_t *v1;
  uint64_t result;

  v0 = (void *)__NSGetFrameworkReference(0, 0);
  v1 = (uint64_t *)dlsym(v0, "UIApplicationDidEnterBackgroundNotification");
  if (!v1)
    initUIApplicationDidEnterBackgroundNotification_cold_1();
  result = *v1;
  constantUIApplicationDidEnterBackgroundNotification = result;
  getUIApplicationDidEnterBackgroundNotification[0] = UIApplicationDidEnterBackgroundNotificationFunction;
  return result;
}

uint64_t initUIApplicationDidEnterBackgroundNotification_0()
{
  void *v0;
  uint64_t *v1;
  uint64_t result;

  v0 = (void *)__NSGetFrameworkReference(0, 0);
  v1 = (uint64_t *)dlsym(v0, "UIApplicationDidEnterBackgroundNotification");
  if (!v1)
    initUIApplicationDidEnterBackgroundNotification_cold_1_0();
  result = *v1;
  constantUIApplicationDidEnterBackgroundNotification_0 = result;
  getUIApplicationDidEnterBackgroundNotification_0 = UIApplicationDidEnterBackgroundNotificationFunction_0;
  return result;
}

uint64_t __NSGetFrameworkReference(void *a1, int a2)
{
  const char *v4;
  void *v5;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&__NSGetFrameworkReference_frameworkCacheLock);
    v4 = (const char *)objc_msgSend((id)__NSGetFrameworkReference_table, "objectForKey:", a1);
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSGetFrameworkReference_frameworkCacheLock);
    if (!v4)
    {
      v4 = __NSLoadFramework(a1, a2);
      if (v4)
      {
        os_unfair_lock_lock((os_unfair_lock_t)&__NSGetFrameworkReference_frameworkCacheLock);
        v5 = (void *)__NSGetFrameworkReference_table;
        if (!__NSGetFrameworkReference_table)
        {
          v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 2, 0);
          __NSGetFrameworkReference_table = (uint64_t)v5;
        }
        if (!objc_msgSend(v5, "objectForKey:", a1))
          objc_msgSend((id)__NSGetFrameworkReference_table, "setObject:forKey:", v4, a1);
        os_unfair_lock_unlock((os_unfair_lock_t)&__NSGetFrameworkReference_frameworkCacheLock);
      }
    }
  }
  else
  {
    if (__NSGetFrameworkReference_onceToken != -1)
      dispatch_once(&__NSGetFrameworkReference_onceToken, &__block_literal_global_26);
    return __NSGetFrameworkReference_UIFrameworkReference;
  }
  return (uint64_t)v4;
}

uint64_t initUIContentSizeCategoryDidChangeNotification()
{
  void *v0;
  uint64_t *v1;
  uint64_t result;

  v0 = (void *)__NSGetFrameworkReference(0, 0);
  v1 = (uint64_t *)dlsym(v0, "UIContentSizeCategoryDidChangeNotification");
  if (!v1)
    initUIContentSizeCategoryDidChangeNotification_cold_1();
  result = *v1;
  constantUIContentSizeCategoryDidChangeNotification = result;
  getUIContentSizeCategoryDidChangeNotification[0] = UIContentSizeCategoryDidChangeNotificationFunction;
  return result;
}

void __NSTextContentStorageUpdateElementIndexRangeForRange(uint64_t a1, id *a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
  id *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __n128 v24;
  int64x2_t v25;
  __int128 v26;

  v25 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  *(_QWORD *)&v26 = 0;
  *((_QWORD *)&v26 + 1) = 1;
  if (a3 >= 1)
  {
    v12 = a2;
    v13 = (unint64_t)&a2[a3];
    do
    {
      v14 = objc_msgSend((id)objc_msgSend(*v12, "elementRange"), "range");
      v16 = v15;
      v25.i64[0] = a4;
      v17 = *v12++;
      BYTE8(v26) = objc_msgSend(v17, "coalescingType");
      objc_msgSend(*(id *)(a1 + 88), "replaceElementsInRange:withElement:coalesceRuns:", v14, v16, &v25, 0);
      ++a4;
    }
    while ((unint64_t)v12 < v13);
  }
  if (a6)
  {
    v24 = 0uLL;
    v18 = a5 + a6;
    if (a5 < a5 + a6)
    {
      do
      {
        v19 = *(_QWORD **)(a1 + 88);
        _NSBlockNumberForIndex(v19, a5, &v24);
        if (v19[11] <= v20)
          v21 = v19[4] - v19[3];
        else
          v21 = 0;
        v22 = v19[7] + (v19[2] + 8) * (v21 + v20);
        v23 = *(_OWORD *)(v22 + 24);
        v25 = *(int64x2_t *)(v22 + 8);
        v26 = v23;
        if (v25.i64[0] != 0x7FFFFFFFFFFFFFFFLL)
        {
          v25.i64[0] += a7;
          objc_msgSend(*(id *)(a1 + 88), "replaceElementsInRange:withElement:coalesceRuns:", *(_OWORD *)&v24, &v25, 0);
        }
        a5 = v24.n128_u64[1] + v24.n128_u64[0];
      }
      while (v24.n128_u64[1] + v24.n128_u64[0] < v18);
    }
  }
}

void _replaceElements(int64x2_t *a1, NSRange range1, NSUInteger a3, void *a4, int a5)
{
  NSUInteger length;
  NSUInteger location;
  const __CFString *v10;
  unint64_t v11;
  NSUInteger v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  unint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  NSUInteger v24;
  NSRange v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSUInteger v53;
  NSUInteger v54;
  NSUInteger v55;
  int v56;
  _BOOL4 v57;
  NSUInteger v58;
  unint64_t v59;
  NSUInteger v60;
  NSUInteger v61;
  unint64_t v62;
  char v63;
  NSRange v64;
  BOOL v65;
  NSUInteger v66;
  uint64_t v67;
  uint64_t v68;
  NSUInteger v69;
  NSUInteger v70;
  const void *v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  int v75;
  NSUInteger v76;
  const void *v77;
  size_t v78;
  uint64_t v79;
  NSUInteger v80;
  NSRange v81;
  NSUInteger v82;
  NSRange v83;
  unint64_t v84;
  unint64_t v85;
  NSRange v86;
  NSRange v87;
  NSRange v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  __objc2_meth_list **p_class_meths;
  unint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  uint64_t v116;
  NSUInteger *v117;
  uint64_t v118;
  uint64_t *v119;
  void *v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  NSUInteger *v124;
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  unint64_t v128;
  _BOOL4 v130;
  unint64_t v131;
  unint64_t v132;
  unint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  NSUInteger range2;
  _BOOL4 v139;
  uint64_t v140;
  int v142;
  uint64_t v143;
  unint64_t v144;
  NSUInteger range1a;
  NSUInteger v146;
  void *__src;
  unint64_t v148;
  unint64_t v149;
  __n128 v150;
  __n128 v151;
  const void *v152;
  uint64_t v153;
  NSRange v154;
  NSRange v155;
  NSRange v156;
  NSRange v157;
  NSRange v158;
  NSRange v159;
  NSRange v160;
  NSRange v161;
  NSRange v162;
  NSRange v163;

  length = range1.length;
  location = range1.location;
  v153 = *MEMORY[0x1E0C80C00];
  if (_NSConsistencyCheckEnabled)
    -[int64x2_t _consistencyCheck:](a1, "_consistencyCheck:", 0);
  if (a3 && !a4)
  {
    v10 = CFSTR("*** NSRunStorage (%p), _replaceElements(): no new element was given with a non-zero new length.");
LABEL_9:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], v10, a1);
    goto LABEL_10;
  }
  if (!a3 && a4)
  {
    v10 = CFSTR("*** NSRunStorage (%p), _replaceElements(): a new element was given with a new length of zero.");
    goto LABEL_9;
  }
LABEL_10:
  v11 = location + length;
  v12 = a1->u64[1];
  v13 = (_QWORD *)MEMORY[0x1E0C99858];
  if (location + length > v12)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("*** NSRunStorage (%p), _replaceElements(): replaced range {%lu, %lu} extends beyond current run storage size %lu."), a1, location, length, v12);
    v12 = a1->u64[1];
  }
  if (__CFADD__(length, location))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v13, CFSTR("*** NSRunStorage (%p), _replaceElements(): replaced range {%llu, %llu} extends beyond current run storage size %llu and suffers from unsigned integer overflow."), a1, location, length, v12);
    v12 = a1->u64[1];
  }
  v151 = 0uLL;
  v150 = 0uLL;
  __src = a4;
  if (location >= v12)
  {
    v16 = a1[1].i64[1];
    if (v16)
    {
      v17 = v16 - 1;
      if (a1[5].i64[1] <= (unint64_t)(v16 - 1))
        v18 = a1[2].i64[0] - v16;
      else
        v18 = 0;
      v21 = *(_QWORD *)(a1[3].i64[1] + (a1[1].i64[0] + 8) * (v18 + v17));
      if (v17 >= a1[2].i64[1])
        v21 += a1[3].u64[0];
      v19 = v12 - v21;
    }
    else
    {
      v19 = 0;
      v21 = 0x7FFFFFFFFFFFFFFFLL;
      v17 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v23 = 0;
    v20 = 0;
    v24 = 0;
    v144 = 0;
    v25.location = 0x7FFFFFFFFFFFFFFFLL;
    v15 = a1[1].u64[1];
LABEL_62:
    v26 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v16 || (v38 = a1[2].u64[1], v38 == 0x7FFFFFFFFFFFFFFFLL))
    {
      v39 = 1;
      goto LABEL_88;
    }
    v40 = v16 - 1;
    if (v38 <= v16 - 1)
    {
      v41 = a1[3].i64[1];
      do
      {
        v42 = a1[3].i64[0];
        a1[2].i64[1] = v38 + 1;
        if (a1[5].i64[1] <= v38)
          v43 = a1[2].i64[0] - a1[1].i64[1];
        else
          v43 = 0;
        v44 = (a1[1].i64[0] + 8) * (v43 + v38);
        *(_QWORD *)(v41 + v44) += v42;
        v38 = a1[2].u64[1];
      }
      while (v38 <= v40);
      v16 = a1[1].i64[1];
    }
    v26 = 0x7FFFFFFFFFFFFFFFLL;
    v45 = 1;
    v39 = 1;
    if (v38 != v16)
      goto LABEL_88;
LABEL_87:
    a1[2].i64[1] = 0x7FFFFFFFFFFFFFFFLL;
    a1[3].i64[0] = 0;
    v39 = v45;
    goto LABEL_88;
  }
  _NSBlockNumberForIndex(a1, location, &v151);
  v15 = v14;
  if (length)
    _NSBlockNumberForIndex(a1, v11 - 1, &v150);
  else
    v150 = v151;
  if (v151.n128_u64[0] >= location)
  {
    if (v15)
    {
      v17 = v15 - 1;
      if (a1[5].i64[1] <= v15 - 1)
        v22 = a1[2].i64[0] - a1[1].i64[1];
      else
        v22 = 0;
      v21 = *(_QWORD *)(a1[3].i64[1] + (a1[1].i64[0] + 8) * (v22 + v17));
      if (v17 >= a1[2].i64[1])
        v21 += a1[3].u64[0];
      v20 = 0;
      v19 = v151.n128_u64[0] - v21;
    }
    else
    {
      v19 = 0;
      v20 = 0;
      v21 = 0x7FFFFFFFFFFFFFFFLL;
      v17 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    v19 = v151.n128_u64[1];
    v17 = v15++;
    v20 = 1;
    v21 = v151.n128_u64[0];
  }
  v24 = v150.n128_u64[1];
  v25.location = v150.n128_u64[0];
  if (v150.n128_u64[1] + v150.n128_u64[0] > v11)
  {
    v23 = v11 != v150.n128_u64[0];
    v26 = v14;
    goto LABEL_58;
  }
  v16 = a1[1].i64[1];
  v26 = v14 + 1;
  if (v14 >= v16 - 1)
  {
    v23 = 0;
    v24 = 0;
    v30 = v26 - v15;
    if (v26 < v15)
      v30 = 0;
    v144 = v30;
    v25.location = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_62;
  }
  v27 = a1[3].i64[1];
  v28 = a1[5].u64[1];
  if (v28 <= v26)
    v29 = a1[2].i64[0] - v16;
  else
    v29 = 0;
  v31 = v29 + v26;
  v32 = a1[1].i64[0] + 8;
  v25.location = *(_QWORD *)(v27 + v32 * v31);
  v33 = a1[2].u64[1];
  if (v26 >= v33)
    v25.location += a1[3].u64[0];
  if (v26 >= v16 - 1)
  {
    v23 = 0;
    v36 = a1->i64[1];
  }
  else
  {
    v34 = v14 + 2;
    if (v28 <= v14 + 2)
      v35 = a1[2].i64[0] - v16;
    else
      v35 = 0;
    v36 = *(_QWORD *)(v27 + (v35 + v34) * v32);
    if (v34 >= v33)
      v36 += a1[3].i64[0];
    v23 = 0;
  }
  v24 = v36 - v25.location;
LABEL_58:
  v37 = v26 - v15;
  if (v26 < v15)
    v37 = 0;
  v144 = v37;
  if (v26 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = a1[1].i64[1];
    goto LABEL_62;
  }
  v46 = a1[1].u64[1];
  if (v26 + 1 >= v46)
    v47 = v26;
  else
    v47 = v26 + 1;
  v48 = a1[2].u64[1];
  if (v48 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v39 = 0;
    goto LABEL_88;
  }
  if (v48 <= v47)
  {
    v49 = a1[3].i64[1];
    do
    {
      v50 = a1[3].i64[0];
      a1[2].i64[1] = v48 + 1;
      if (a1[5].i64[1] <= v48)
        v51 = a1[2].i64[0] - a1[1].i64[1];
      else
        v51 = 0;
      v52 = (a1[1].i64[0] + 8) * (v51 + v48);
      *(_QWORD *)(v49 + v52) += v50;
      v48 = a1[2].u64[1];
    }
    while (v48 <= v47);
    v46 = a1[1].u64[1];
  }
  v45 = 0;
  v39 = 0;
  if (v48 == v46)
    goto LABEL_87;
LABEL_88:
  range1a = length;
  v146 = a3;
  v143 = a3 - length;
  if (v20)
    v19 = location - v21;
  v53 = 0x7FFFFFFFFFFFFFFFLL;
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    v54 = 0;
  else
    v54 = v19;
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    v55 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v55 = v21;
  if ((v39 & 1) != 0)
  {
    v24 = 0;
  }
  else if (v23)
  {
    v154.location = location;
    v154.length = range1a;
    v25.length = v24;
    v56 = v20;
    v57 = v23;
    v148 = v26;
    v58 = location;
    v59 = v15;
    v60 = v54;
    v61 = v55;
    v62 = v17;
    v63 = v39;
    v64 = NSIntersectionRange(v154, v25);
    v39 = v63;
    v17 = v62;
    v55 = v61;
    v54 = v60;
    v15 = v59;
    location = v58;
    v26 = v148;
    v23 = v57;
    v20 = v56;
    v65 = v148 != v17 || v56 == 0;
    v53 = location + v146;
    if (v65)
      v66 = 0;
    else
      v66 = v54;
    v24 = v24 - v64.length - v66;
  }
  else
  {
    v53 = v25.location + v143;
  }
  v149 = v15;
  v140 = v53;
  if (!a5)
  {
    v69 = range1a;
    v70 = v146;
    v71 = __src;
    v72 = v144;
    goto LABEL_188;
  }
  v67 = 0;
  v151 = 0uLL;
  v152 = 0;
  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a1[5].i64[1] <= v17)
      v68 = a1[2].i64[0] - a1[1].i64[1];
    else
      v68 = 0;
    v151.n128_u64[0] = a1[3].i64[1] + (a1[1].i64[0] + 8) * (v68 + v17) + 8;
    v67 = 1;
  }
  if (__src)
    v151.n128_u64[v67++] = (unint64_t)__src;
  if ((v39 & 1) == 0)
  {
    if (a1[5].i64[1] <= v26)
      v73 = a1[2].i64[0] - a1[1].i64[1];
    else
      v73 = 0;
    v151.n128_u64[v67++] = a1[3].i64[1] + (a1[1].i64[0] + 8) * (v73 + v26) + 8;
  }
  v74 = v17;
  if (v67 == 3)
  {
    range2 = v24;
    v139 = v23;
    v142 = v20;
    v77 = (const void *)v151.n128_u64[1];
    v78 = a1[1].u64[0];
    if (!memcmp((const void *)v151.n128_u64[0], (const void *)v151.n128_u64[1], v78))
    {
      v156.location = location;
      v156.length = v146;
      v161.location = v55;
      v161.length = v54;
      v81 = NSUnionRange(v156, v161);
      location = v81.location;
      v80 = v81.length;
      v142 = 0;
      --v149;
      ++v144;
      v78 = a1[1].u64[0];
      if (v74)
        v79 = v74 - 1;
      else
        v79 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v79 = v74;
      v80 = v146;
    }
    if (memcmp(v77, v152, v78))
    {
      v76 = location;
      v17 = v79;
      v69 = range1a;
      v70 = v146;
      v71 = __src;
      v20 = v142;
      v72 = v144;
      v23 = v139;
      goto LABEL_187;
    }
    v157.location = location;
    v157.length = v80;
    v162.location = v53;
    v162.length = range2;
    v83 = NSUnionRange(v157, v162);
    v82 = v83.length;
    v76 = v83.location;
    v84 = v144;
    if (v74 != v26)
      v84 = v144 + 1;
    v144 = v84;
    ++v26;
    v85 = a1[1].u64[1];
    if (v26 < v85)
    {
      v17 = v79;
      location = v83.location;
      v69 = range1a;
      v70 = v146;
      v71 = __src;
      v20 = v142;
      v72 = v144;
      goto LABEL_156;
    }
    v23 = 0;
    v140 = 0x7FFFFFFFFFFFFFFFLL;
    v26 = 0x7FFFFFFFFFFFFFFFLL;
    v17 = v79;
    v69 = range1a;
    v70 = v146;
    v71 = __src;
    v20 = v142;
    goto LABEL_184;
  }
  if (v67 != 2)
  {
    v76 = location;
    v69 = range1a;
    v70 = v146;
    v71 = __src;
    goto LABEL_128;
  }
  v75 = v20;
  if (!memcmp((const void *)v151.n128_u64[0], (const void *)v151.n128_u64[1], a1[1].u64[0]))
  {
    v17 = v74;
    if (__src && v74 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v155.location = location;
      v155.length = v146;
      v160.location = v55;
      v160.length = v54;
      v70 = v146;
      v76 = NSUnionRange(v155, v160).location;
      v20 = 0;
      --v149;
      v69 = range1a;
      v72 = v144 + 1;
      if (v74)
        v17 = v74 - 1;
      else
        v17 = 0x7FFFFFFFFFFFFFFFLL;
      v71 = __src;
      goto LABEL_187;
    }
    if (__src && v26 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v158.location = location;
      v70 = v146;
      v158.length = v146;
      v163.location = v53;
      v163.length = v24;
      v86 = NSUnionRange(v158, v163);
      v82 = v86.length;
      v76 = v86.location;
      v69 = range1a;
      v72 = v144 + 1;
      ++v26;
      v85 = a1[1].u64[1];
      if (v26 >= v85)
      {
        v23 = 0;
        v140 = 0x7FFFFFFFFFFFFFFFLL;
        v26 = 0x7FFFFFFFFFFFFFFFLL;
        v71 = __src;
        v20 = v75;
        goto LABEL_129;
      }
      location = v86.location;
      v71 = __src;
      v20 = v75;
      v17 = v74;
LABEL_156:
      v140 = v76 + v82;
      if (v26 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v89 = a1[2].u64[1];
        if (v89 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v23 = 0;
          v76 = location;
          v26 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_187;
        }
        v96 = v85 - 1;
        if (v89 <= v85 - 1)
        {
          v97 = a1[3].i64[1];
          do
          {
            v98 = a1[3].i64[0];
            a1[2].i64[1] = v89 + 1;
            if (a1[5].i64[1] <= v89)
              v99 = a1[2].i64[0] - a1[1].i64[1];
            else
              v99 = 0;
            v100 = (a1[1].i64[0] + 8) * (v99 + v89);
            *(_QWORD *)(v97 + v100) += v98;
            v89 = a1[2].u64[1];
          }
          while (v89 <= v96);
          v85 = a1[1].u64[1];
        }
        v23 = 0;
        if (v89 == v85)
          *(int64x2_t *)((char *)&a1[2] + 8) = (int64x2_t)xmmword_18D6CBB80;
        v26 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        if (v26 + 1 >= v85)
          v90 = v26;
        else
          v90 = v26 + 1;
        v91 = a1[2].u64[1];
        if (v91 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_172;
        if (v91 <= v90)
        {
          v92 = a1[3].i64[1];
          do
          {
            v93 = a1[3].i64[0];
            a1[2].i64[1] = v91 + 1;
            if (a1[5].i64[1] <= v91)
              v94 = a1[2].i64[0] - a1[1].i64[1];
            else
              v94 = 0;
            v95 = (a1[1].i64[0] + 8) * (v94 + v91);
            *(_QWORD *)(v92 + v95) += v93;
            v91 = a1[2].u64[1];
          }
          while (v91 <= v90);
          v85 = a1[1].u64[1];
        }
        if (v91 != v85)
        {
LABEL_172:
          v23 = 0;
        }
        else
        {
          v23 = 0;
          *(int64x2_t *)((char *)&a1[2] + 8) = (int64x2_t)xmmword_18D6CBB80;
        }
      }
      v76 = location;
      goto LABEL_187;
    }
    v20 = v75;
    v87.location = v53;
    if (v26 != 0x7FFFFFFFFFFFFFFFLL && v74 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v159.location = v55;
      v159.length = v54;
      v87.length = v24;
      v88 = NSUnionRange(v159, v87);
      v82 = v88.length;
      v76 = v88.location;
      v17 = v74;
      v72 = v144;
      if (v74 != v26)
        v72 = v144 + 1;
      ++v26;
      v85 = a1[1].u64[1];
      if (v26 >= v85)
      {
        v23 = 0;
        v140 = 0x7FFFFFFFFFFFFFFFLL;
        v76 = location;
        v26 = 0x7FFFFFFFFFFFFFFFLL;
        v69 = range1a;
        v70 = v146;
        v71 = __src;
        v20 = v75;
        goto LABEL_187;
      }
      v69 = range1a;
      v70 = v146;
      v71 = __src;
      v20 = v75;
      goto LABEL_156;
    }
    v76 = location;
    v69 = range1a;
    v70 = v146;
    v71 = __src;
LABEL_184:
    v72 = v144;
    goto LABEL_187;
  }
  v76 = location;
  v69 = range1a;
  v70 = v146;
  v71 = __src;
  v20 = v75;
LABEL_128:
  v72 = v144;
LABEL_129:
  v17 = v74;
LABEL_187:
  location = v76;
LABEL_188:
  v101 = 1;
  if (v71)
    v101 = 2;
  if (v17 != v26)
    v101 = v71 != 0;
  if (!v23 || v20 == 0)
    v103 = v71 != 0;
  else
    v103 = v101;
  v104 = v103 - v72;
  if (v103 <= v72)
  {
    if (v103 >= v72)
      goto LABEL_209;
    v105 = v17;
    v108 = v72 - v103;
    -[int64x2_t _moveGapAndMergeWithBlockRange:](a1, "_moveGapAndMergeWithBlockRange:", v103 + v149, v72 - v103);
    v109 = a1[2].i64[1];
    if (v109 != 0x7FFFFFFFFFFFFFFFLL)
      a1[2].i64[1] = v109 - v108;
    v107 = v26 - v108;
  }
  else
  {
    v105 = v17;
    -[int64x2_t _ensureCapacity:](a1, "_ensureCapacity:", a1[1].i64[1] + v104);
    -[int64x2_t _moveGapToBlockIndex:](a1, "_moveGapToBlockIndex:", v72 + v149);
    a1[1].i64[1] += v104;
    a1[5].i64[1] += v104;
    v106 = a1[2].i64[1];
    if (v106 != 0x7FFFFFFFFFFFFFFFLL)
      a1[2].i64[1] = v106 + v104;
    v107 = v104 + v26;
  }
  if (v26 != 0x7FFFFFFFFFFFFFFFLL)
    v26 = v107;
  v17 = v105;
LABEL_209:
  if (v103 != 1)
  {
    if (v103 == 2)
    {
      p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___CTEmojiImageProviding + 32);
      v111 = v17;
      if (a1[5].i64[1] <= v149)
        v112 = a1[2].i64[0] - a1[1].i64[1];
      else
        v112 = 0;
      v117 = (NSUInteger *)(a1[3].i64[1] + (a1[1].i64[0] + 8) * (v112 + v149));
      *v117 = location;
      memmove(v117 + 1, v71, a1[1].u64[0]);
      v113 = a1[3].i64[1];
      if (a1[5].i64[1] <= v149 + 1)
        v118 = a1[2].i64[0] - a1[1].i64[1];
      else
        v118 = 0;
      v116 = v143;
      v119 = (uint64_t *)(v113 + (a1[1].i64[0] + 8) * (v118 + v149 + 1));
      *v119 = v140;
      v120 = v119 + 1;
      if (a1[5].i64[1] <= v111)
        v121 = a1[2].i64[0] - a1[1].i64[1];
      else
        v121 = 0;
      v122 = v121 + v111;
LABEL_239:
      memmove(v120, (const void *)(v113 + (a1[1].i64[0] + 8) * v122 + 8), a1[1].u64[0]);
      goto LABEL_240;
    }
    p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___CTEmojiImageProviding + 32);
    v116 = v143;
    if (v26 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_240;
LABEL_230:
    if (a1[5].i64[1] <= v26)
      v125 = a1[2].i64[0] - a1[1].i64[1];
    else
      v125 = 0;
    *(_QWORD *)(a1[3].i64[1] + (a1[1].i64[0] + 8) * (v125 + v26)) = v140;
    goto LABEL_240;
  }
  v113 = a1[3].i64[1];
  v114 = a1[5].u64[1];
  if (!v71)
  {
    if (v114 <= v149)
      v123 = a1[2].i64[0] - a1[1].i64[1];
    else
      v123 = 0;
    p_class_meths = &OBJC_PROTOCOL___CTEmojiImageProviding.class_meths;
    v116 = v143;
    v126 = (uint64_t *)(v113 + (a1[1].i64[0] + 8) * (v123 + v149));
    *v126 = v140;
    v120 = v126 + 1;
    if (a1[5].i64[1] <= v17)
      v127 = a1[2].i64[0] - a1[1].i64[1];
    else
      v127 = 0;
    v122 = v127 + v17;
    goto LABEL_239;
  }
  if (v114 <= v149)
    v115 = a1[2].i64[0] - a1[1].i64[1];
  else
    v115 = 0;
  p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___CTEmojiImageProviding + 32);
  v116 = v143;
  v124 = (NSUInteger *)(v113 + (a1[1].i64[0] + 8) * (v115 + v149));
  *v124 = location;
  memmove(v124 + 1, v71, a1[1].u64[0]);
  if (v26 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_230;
LABEL_240:
  v128 = a1[2].u64[1];
  v130 = v70 != v69 && v26 != 0x7FFFFFFFFFFFFFFFLL;
  if (v128 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!v130 || v26 + 1 >= a1[1].i64[1])
      goto LABEL_262;
    a1[2].i64[1] = v26 + 1;
  }
  else
  {
    if (!v130)
      goto LABEL_262;
    v131 = v26 + 1;
    v132 = a1[1].u64[1];
    if (v26 + 1 >= v132)
      goto LABEL_262;
    if (v128 == v131)
    {
      a1[3].i64[0] += v116;
      goto LABEL_262;
    }
    v133 = v132 - 1;
    if (v128 <= v133)
    {
      v134 = a1[3].i64[1];
      do
      {
        v135 = a1[3].i64[0];
        a1[2].i64[1] = v128 + 1;
        if (a1[5].i64[1] <= v128)
          v136 = a1[2].i64[0] - a1[1].i64[1];
        else
          v136 = 0;
        v137 = (a1[1].i64[0] + 8) * (v136 + v128);
        *(_QWORD *)(v134 + v137) += v135;
        v128 = a1[2].u64[1];
      }
      while (v128 <= v133);
    }
    a1[2].i64[1] = v131;
  }
  a1[3].i64[0] = v116;
LABEL_262:
  a1->i64[1] += v116;
  a1[4] = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  a1[5].i64[0] = 0;
  if (*((_BYTE *)p_class_meths + 1720))
    -[int64x2_t _consistencyCheck:](a1, "_consistencyCheck:", 1);
}

void sub_18D6000C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D6002D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

NSUInteger __NSTextContentStorageEnumerateCachedElementsInElementIndexRange(NSUInteger result, NSUInteger a2, NSUInteger a3, uint64_t a4)
{
  NSUInteger v4;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  NSRange v11;
  BOOL v12;
  NSRange v13;
  NSRange v14;
  NSRange v15;

  v4 = a2 + a3;
  if (a2 < a2 + a3)
  {
    v8 = result;
    v13.location = 0;
    v13.length = 0;
    v9 = a2;
    do
    {
      v10 = objc_msgSend(*(id *)(v8 + 96), "pointerToElement:directlyAccessibleElements:", v9, &v13);
      v14.length = v13.location - v9 + v13.length;
      v13.location = v9;
      v13.length = v14.length;
      v14.location = v9;
      v15.location = a2;
      v15.length = a3;
      v11 = NSIntersectionRange(v14, v15);
      result = v11.location;
      v13 = v11;
      if (v10)
        v12 = v11.length == 0;
      else
        v12 = 1;
      if (v12)
        break;
      result = (*(uint64_t (**)(uint64_t, uint64_t, NSUInteger, NSUInteger))(a4 + 16))(a4, v10, v11.location, v11.length);
      v9 = v13.length + v13.location;
    }
    while (v13.length + v13.location < v4);
  }
  return result;
}

void sub_18D6006BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D600894(void *a1)
{
  uint64_t v1;
  _OWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_begin_catch(a1);
  *(_BYTE *)(v1 + v4) = 0;
  *v2 = xmmword_18D6CBB80;
  *(_OWORD *)(v1 + v3) = xmmword_18D6CBB80;
  *(_QWORD *)(v1 + 176) = 0;
  *(_QWORD *)(v1 + v5) = 0;
  objc_exception_rethrow();
}

void sub_18D6008C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_end_catch();
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D60095C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CGFloat __NSTextAttachmentLayoutInfoGetDescent(uint64_t a1)
{
  objc_msgSend((id)a1, "_queryLayout");
  return -CGRectGetMinY(*(CGRect *)(a1 + 72));
}

double __NSTextAttachmentLayoutInfoGetAscent(uint64_t a1)
{
  objc_msgSend((id)a1, "_queryLayout");
  return CGRectGetMaxY(*(CGRect *)(a1 + 72));
}

double __NSTextAttachmentLayoutInfoGetWidth(uint64_t a1)
{
  objc_msgSend((id)a1, "_queryLayoutWithHorizontalOffset:");
  return CGRectGetWidth(*(CGRect *)(a1 + 72));
}

void sub_18D600D9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D601664(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_18D601684(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x18D601568);
}

void sub_18D601B64(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D6028B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_18D6034C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&STACK[0x200], 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Block_object_dispose(&STACK[0x260], 8);
  _Block_object_dispose(&STACK[0x280], 8);
  _Block_object_dispose(&STACK[0x2B0], 8);
  _Unwind_Resume(a1);
}

void sub_18D603BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_18D603FC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __NSTextLayoutManagerRemoveTextLayoutFragmentsInTextRange(id *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSTextRange *v9;
  NSTextRange *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t i;
  uint64_t result;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[10];
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend((id)objc_msgSend(a1, "textContentManager"), "documentRange");
  if (a3 || !objc_msgSend(a2, "isEqualToTextRange:", v6))
  {
    v7 = objc_msgSend((id)objc_msgSend(a1[10], "contentRange"), "endLocation");
    v29 = 0;
    v30 = &v29;
    v31 = 0x3052000000;
    v32 = __Block_byref_object_copy__2;
    v33 = __Block_byref_object_dispose__2;
    v34 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3052000000;
    v26 = __Block_byref_object_copy__2;
    v27 = __Block_byref_object_dispose__2;
    v28 = 0;
    if (a3)
      v8 = (id)objc_msgSend(a2, "location");
    else
      v8 = 0;
    v28 = v8;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3052000000;
    v22[3] = __Block_byref_object_copy__2;
    v22[4] = __Block_byref_object_dispose__2;
    v22[5] = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = ____NSTextLayoutManagerRemoveTextLayoutFragmentsInTextRange_block_invoke;
    v21[3] = &unk_1E2604298;
    v21[6] = a3;
    v21[7] = v22;
    v21[8] = &v23;
    v21[9] = &v29;
    v21[4] = a1;
    v21[5] = v7;
    if (objc_msgSend((id)objc_msgSend(a2, "endLocation"), "isEqual:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "textContentManager"), "documentRange"), "endLocation")))objc_msgSend(a1[10], "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", objc_msgSend(a2, "location"), 0, v21);
    else
      objc_msgSend(a1[10], "enumerateTextLayoutFragmentInTextRange:options:usingBlock:", a2, 0, v21);
    objc_msgSend(a1[10], "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", objc_msgSend(a2, "endLocation"), 0, &__block_literal_global_539);
    if (objc_msgSend((id)v30[5], "count"))
    {
      if (v7 && objc_msgSend((id)v24[5], "compare:", v7) == -1)
      {
        v9 = [NSTextRange alloc];
        v10 = -[NSTextRange initWithLocation:endLocation:](v9, "initWithLocation:endLocation:", v24[5], v7);
        objc_msgSend((id)v30[5], "addObject:", v10);

      }
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v11 = (void *)v30[5];
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v35, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v18;
        v14 = 1;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v11);
            objc_msgSend(a1[10], "invalidateTextLayoutFragmentsInTextRange:adjustTextRange:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), v14 & 1);
            v14 = 0;
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v35, 16);
          v14 = 0;
        }
        while (v12);
      }
    }
    else
    {
      objc_msgSend(a1[10], "invalidateTextLayoutFragmentsInTextRange:adjustTextRange:", a2, 1);
    }

    _Block_object_dispose(v22, 8);
    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);
  }
  else
  {

    a1[11] = 0;
    a1[10] = 0;
  }
  result = objc_msgSend(a1[11], "count");
  if (!result)
    return objc_msgSend(a1, "_setSoftInvalidationLocation:onlyIfUpstream:", 0, 1);
  return result;
}

void sub_18D604340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a40, 8);
  _Unwind_Resume(a1);
}

void sub_18D6049D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_18D604D14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  char v10;
  va_list va;

  va_start(va, a9);
  if ((v10 & 1) != 0)
    objc_end_catch();
  _Block_object_dispose(va, 8);
  objc_sync_exit(v9);
  _Unwind_Resume(a1);
}

void sub_18D604D48(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x18D604CC8);
}

void sub_18D604EC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D604F1C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D604F9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D6050DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D605548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  id *v27;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18D605784(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18D605C24(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D605F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_18D6060A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

NSUInteger __NSTextRunStorageReleaseElementContentsInRange(NSUInteger result, NSUInteger a2, NSUInteger a3)
{
  NSUInteger v3;

  if (!*(_QWORD *)(result + 16))
  {
    v3 = result;
    if (a2 == 0x7FFFFFFFFFFFFFFFLL && !a3)
    {
      a3 = objc_msgSend(*(id *)(result + 24), "count");
      a2 = 0;
    }
    return __NSTextRunStorageEnumerateElementsInRange(v3, a2, a3, 0, (uint64_t)&__block_literal_global_27);
  }
  return result;
}

void sub_18D606B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  void *v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v17);
  _Unwind_Resume(a1);
}

void sub_18D606D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D606DD0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D606E34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t UIReadNibArchiveVInt32(uint64_t a1, unint64_t a2, uint64_t *a3, int *a4)
{
  uint64_t v4;
  unsigned int v5;
  int v6;
  int v7;
  int v8;

  v4 = *a3;
  if (a2 >= *a3)
    v5 = a2 - *a3;
  else
    v5 = 0;
  if (v5 < 5)
  {
    __memcpy_chk();
    if (v5 == 3 || v5 == 2 || v5 == 1)
      return 0;
    else
      return 0;
  }
  else
  {
    v6 = *(_DWORD *)(a1 + v4);
    if ((v6 & 0x80) != 0)
    {
      v7 = *(_DWORD *)(a1 + v4) & 0x7F;
      v8 = 1;
    }
    else if ((v6 & 0x8000) != 0)
    {
      v7 = *(_DWORD *)(a1 + v4) & 0x7F | (((*(_DWORD *)(a1 + v4) >> 8) & 0x7F) << 7);
      v8 = 2;
    }
    else if ((v6 & 0x800000) != 0)
    {
      v7 = *(_DWORD *)(a1 + v4) & 0x7F | (((*(_DWORD *)(a1 + v4) >> 8) & 0x7F) << 7) | (*(_DWORD *)(a1 + v4) >> 2) & 0x1FC000;
      v8 = 3;
    }
    else if (v6 < 0)
    {
      v7 = *(_DWORD *)(a1 + v4) & 0x7F | ((HIWORD(*(_DWORD *)(a1 + v4)) & 0x7F) << 14) | (*(_DWORD *)(a1 + v4) >> 3) & 0xFE00000 | (*(_DWORD *)(a1 + v4) >> 1) & 0x3F80;
      v8 = 4;
    }
    else
    {
      v7 = (*(_DWORD *)(a1 + v4) >> 3) & 0xFE00000 | (*(unsigned __int8 *)(v4 + a1 + 4) << 28) | (*(_DWORD *)(a1 + v4) >> 2) & 0x1FC000 | (*(_DWORD *)(a1 + v4) >> 1) & 0x3F80 | *(_DWORD *)(a1 + v4) & 0x7F;
      v8 = 5;
    }
    *a4 = v7;
    *a3 = (v4 + v8);
    return 1;
  }
}

uint64_t UIFixedByteLengthForType(unsigned int a1)
{
  if (a1 > 0xA)
    return -2;
  else
    return UIFixedByteLengthForType_table[a1];
}

void sub_18D60AA90(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __NSATSGlyphStorageInitBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  NSZone *v12;
  NSZone *v13;
  uint64_t v14;
  int64_t v15;
  int *v16;
  void *v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  int *v21;
  int *v22;
  void *v23;
  void *v24;
  __CFSet *v25;

  v12 = (NSZone *)objc_msgSend((id)a1, "zone");
  v13 = v12;
  *(_QWORD *)(a1 + (int)*MEMORY[0x1E0CA8108]) = a6;
  *(_QWORD *)(a1 + 112) = a2;
  *(_QWORD *)(a1 + 120) = a3;
  *(_QWORD *)(a1 + 128) = a4;
  *(_QWORD *)(a1 + 136) = a5;
  if (a6 <= 0)
    v14 = -(-a6 & 0x7F);
  else
    v14 = a6 & 0x7F;
  *(_DWORD *)(a1 + 224) = 0;
  v15 = a6 - v14 + 128;
  if (*(_QWORD *)(a1 + 144) < v15)
  {
    v16 = (int *)MEMORY[0x1E0CA8100];
    v17 = *(void **)(a1 + (int)*MEMORY[0x1E0CA8100]);
    if (v17)
      NSZoneFree(v12, v17);
    *(_QWORD *)(a1 + *v16) = NSZoneCalloc(v13, v15, 0x1EuLL);
    v18 = *(_QWORD *)(a1 + *v16);
    if (!v18)
    {
      *(_QWORD *)(a1 + 144) = 0;
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Failed to allocate buffer for text layout processing."));
      v18 = *(_QWORD *)(a1 + *v16);
    }
    v19 = (int *)MEMORY[0x1E0CA8120];
    *(_QWORD *)(a1 + (int)*MEMORY[0x1E0CA8120]) = v18 + 16 * v15;
    v20 = *(_QWORD *)(a1 + *v19) + 8 * v15;
    v21 = (int *)MEMORY[0x1E0CA8118];
    *(_QWORD *)(a1 + (int)*MEMORY[0x1E0CA8118]) = v20;
    *(_QWORD *)(a1 + (int)*MEMORY[0x1E0CA8110]) = *(_QWORD *)(a1 + *v21) + 4 * v15;
    *(_QWORD *)(a1 + 144) = v15;
  }
  v22 = (int *)MEMORY[0x1E0CA80F8];
  v23 = *(void **)(a1 + (int)*MEMORY[0x1E0CA80F8]);
  if (v23)
  {
    NSZoneFree(v13, v23);
    *(_QWORD *)(a1 + *v22) = 0;
  }
  v24 = *(void **)(a1 + 192);
  if (v24)
  {
    NSZoneFree(v13, v24);
    *(_QWORD *)(a1 + 192) = 0;
  }
  *(_QWORD *)(a1 + 96) = 0;
  if (a3 != a5)
    *(_DWORD *)(a1 + 224) |= 0x10u;
  v25 = *(__CFSet **)(a1 + 160);
  if (v25)
    CFSetRemoveAllValues(v25);
  *(_QWORD *)(a1 + 168) = 0;
  *(_QWORD *)(a1 + 176) = 0;
  *(_QWORD *)(a1 + 200) = 0;
  *(_QWORD *)(a1 + 208) = 0;
  *(_QWORD *)(a1 + 216) = 0;
}

void _NSLayoutTreeSetBaselineOffsetForGlyphAtIndex(uint64_t a1, unint64_t a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  if (_NSLayoutTreeMoveToGlyphIndex(a1, a2))
  {
    if (a3 != 0.0)
    {
      v13 = *(unint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) + 24);
      if (v13)
      {
        v14 = 0;
        v15 = a2 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256);
        v18 = *v13;
        v16 = v13 + 4;
        v17 = v18;
        v19 = v18 - 1;
        while (1)
        {
          v20 = (v14 + v19) >> 1;
          if ((v16[10 * v20] & 0x8FFFFFFFFFFFFFFFLL) <= v15)
          {
            v14 = v20 + 1;
            if (v20 + 1 >= v17 || (v16[10 * v14] & 0x8FFFFFFFFFFFFFFFLL) > v15)
            {
LABEL_10:
              *(double *)&v16[10 * v20 + 1] = a3;
              return;
            }
          }
          else
          {
            v19 = v20 - 1;
          }
          if (v19 < v14)
            goto LABEL_10;
        }
      }
    }
  }
  else
  {
    _NSLayoutTreeLogDebug((NSString *)CFSTR("!!! _NSLayoutTreeGetBaselineOffsetForGlyphAtIndex invalid glyph index %lu"), v6, v7, v8, v9, v10, v11, v12, a2);
  }
}

unint64_t _NSGlyphTreeGetCGGlyphsInRange(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t *a5, _QWORD *a6, _BYTE *a7)
{
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t i;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  int v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int v52;
  uint64_t v53;
  char v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;

  v57 = a2 + a3;
  if (a2 < a2 + a3)
  {
    v12 = 0;
    while (1)
    {
      v58 = a2;
      if (!_NSGlyphTreeMoveToGlyphIndex(a1, a2))
        return v12;
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
      v20 = *(_QWORD *)(v19 + 8) + *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
      if (v20 >= v57)
        v21 = v57;
      else
        v21 = *(_QWORD *)(v19 + 8) + *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
      if (!*(_BYTE *)(v19 + 59) || !*(_QWORD *)(v19 + 24))
      {
        v22 = *(_QWORD *)(v19 + 8) + *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
        _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeGetGlyphsInRange missing glyphs"), v13, v20, v14, v15, v16, v17, v18, v55);
        v20 = v22;
      }
      if (!(a4 | (unint64_t)a5))
      {
        a4 = 0;
        a5 = 0;
        v23 = v58;
        goto LABEL_71;
      }
      v23 = v58;
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 216) + 57))
        break;
      if (v21 > v58)
      {
        v24 = 24 * v58;
        for (i = v58; v21 != i; ++i)
        {
          v26 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
          LODWORD(v27) = *(unsigned __int8 *)(v26 + 59);
          if (*(_BYTE *)(v26 + 59))
          {
            v27 = *(_QWORD *)(v26 + 24);
            if (v27)
            {
              v28 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
              switch(*(_BYTE *)(v26 + 57))
              {
                case 0:
                  v29 = *(unsigned __int8 *)(v27 - v28 + i);
                  if (v29 >= 4)
                    v30 = v29;
                  else
                    v30 = 0xFFFFFF;
                  if (v29 <= 0xEF)
                    LODWORD(v27) = v30;
                  else
                    LODWORD(v27) = v29 & 3;
                  if (a4)
                    goto LABEL_33;
                  goto LABEL_34;
                case 1:
                  v31 = *(unsigned __int16 *)(v27 - 2 * v28 + 2 * i);
                  goto LABEL_30;
                case 2:
                  v31 = *(_DWORD *)(v27 - 4 * v28 + 4 * i);
                  goto LABEL_30;
                case 3:
                  v31 = *(_DWORD *)(v27 - 24 * v28 + v24);
LABEL_30:
                  if (v31 <= 0xFF)
                  {
                    LODWORD(v27) = ((char)v31 >> 7) & 0xFFFFFF;
                    break;
                  }
                  LODWORD(v27) = v31 >> 8;
                  if (!a4)
                    goto LABEL_34;
                  goto LABEL_33;
                default:
                  LODWORD(v27) = 0;
                  if (a4)
                    goto LABEL_33;
                  goto LABEL_34;
              }
            }
          }
          if (a4)
          {
LABEL_33:
            *(_WORD *)a4 = v27;
            a4 += 2;
          }
LABEL_34:
          if (a5)
          {
            if ((_DWORD)v27 == 0xFFFFFF)
              v32 = 2;
            else
              v32 = (_DWORD)v27 == 0;
            v33 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
            if (*(_BYTE *)(v33 + 59))
            {
              v34 = *(_QWORD *)(v33 + 24);
              if (v34)
              {
                v35 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
                v36 = *(unsigned __int8 *)(v33 + 57);
                switch((int)v36)
                {
                  case 0:
                    v37 = *(unsigned __int8 *)(v34 - v35 + i);
                    if (v37 < 0xF0)
                    {
                      if (v37 <= 3 && (v37 & 2) != 0)
                      {
LABEL_56:
                        v36 = 0;
                        goto LABEL_57;
                      }
                    }
                    else if ((v37 & 8) != 0)
                    {
                      goto LABEL_56;
                    }
                    break;
                  case 1:
                    if ((*(_WORD *)(v34 - 2 * v35 + 2 * i) & 0x10) == 0)
                      goto LABEL_61;
                    v36 = 1;
                    goto LABEL_57;
                  case 2:
                    if ((*(_DWORD *)(v34 - 4 * v35 + 4 * i) & 0x10) == 0)
                      goto LABEL_65;
                    v36 = 2;
                    goto LABEL_57;
                  case 3:
                    if ((*(_DWORD *)(v34 - 24 * v35 + v24) & 0x10) == 0)
                      goto LABEL_63;
                    v36 = 3;
LABEL_57:
                    v32 |= 4uLL;
LABEL_58:
                    if (v36 == 3)
                    {
LABEL_63:
                      if ((*(_DWORD *)(v34 - 24 * v35 + v24) & 1) == 0)
                        break;
LABEL_66:
                      v32 |= 8uLL;
                      break;
                    }
                    if (v36 == 2)
                    {
LABEL_65:
                      if ((*(_DWORD *)(v34 - 4 * v35 + 4 * i) & 1) == 0)
                        break;
                      goto LABEL_66;
                    }
                    if (v36 != 1)
                      break;
LABEL_61:
                    if ((*(_WORD *)(v34 - 2 * v35 + 2 * i) & 1) != 0)
                      goto LABEL_66;
                    break;
                  default:
                    goto LABEL_58;
                }
              }
            }
            *a5++ = v32;
          }
          v24 += 24;
        }
      }
LABEL_71:
      if (a6)
      {
        v39 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
        if (*(_BYTE *)(v39 + 59) && *(_QWORD *)(v39 + 32))
        {
          if (v21 > v23)
          {
            v40 = v23;
            while (1)
            {
              v41 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
              v42 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
              if (!*(_BYTE *)(v42 + 59))
                break;
              v43 = *(_QWORD *)(v42 + 32);
              if (v43)
              {
                v44 = *(unsigned __int8 *)(v42 + 58);
                if (v44 == 2)
                {
                  v43 = *(int *)(v43 - 4 * v41 + 4 * v40);
                  goto LABEL_83;
                }
                if (v44 == 1)
                {
                  v43 = *(__int16 *)(v43 - 2 * v41 + 2 * v40);
                  goto LABEL_83;
                }
                if (v44)
                  break;
                v43 = *(char *)(v43 - v41 + v40);
              }
LABEL_83:
              *a6++ = v40 + *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224) - v43 - v41;
              if (v21 == ++v40)
                goto LABEL_90;
            }
            v43 = 0;
            goto LABEL_83;
          }
        }
        else if (v21 > v23)
        {
          v45 = v23;
          do
          {
            *a6++ = v45 + *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224) - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
            ++v45;
          }
          while (v21 != v45);
        }
      }
LABEL_90:
      if (a7)
      {
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 216) + 40))
        {
          v46 = v23;
          if (v21 > v23)
          {
            do
              *a7++ = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 216) + 40)
                               - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232)
                               + v46++);
            while (v21 != v46);
          }
        }
        else
        {
          v47 = v12;
          v48 = v21 - v23;
          if (v21 > v23)
          {
            v56 = v20;
            bzero(a7, v21 - v23);
            v20 = v56;
            v23 = v58;
            a7 += v48;
          }
          v12 = v47;
        }
      }
      v12 = v12 - v23 + v21;
      a2 = v21;
      if (v57 <= v20)
        return v12;
    }
    if (v21 <= v58)
      goto LABEL_71;
    v49 = v58;
    while (1)
    {
      v50 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
      if (*(_BYTE *)(v50 + 59))
      {
        v51 = *(_QWORD *)(v50 + 24);
        if (v51)
        {
          v52 = *(unsigned __int8 *)(v51 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232) + v49);
          if (v52 < 0xF0)
          {
            if (v52 > 3)
            {
              LODWORD(v51) = 0;
            }
            else
            {
              LODWORD(v51) = (v52 >> 1) & 1;
              v52 = 0xFFFFFF;
            }
          }
          else
          {
            LODWORD(v51) = (v52 >> 3) & 1;
            v52 &= 3u;
          }
          goto LABEL_108;
        }
      }
      else
      {
        LODWORD(v51) = 0;
      }
      v52 = 0;
LABEL_108:
      if (a4)
      {
        *(_WORD *)a4 = v52;
        a4 += 2;
      }
      if (a5)
      {
        if (v52 == 0xFFFFFF)
          v53 = 2;
        else
          v53 = v52 == 0;
        if ((_DWORD)v51)
          v53 |= 4uLL;
        *a5++ = v53;
      }
      if (v21 == ++v49)
        goto LABEL_71;
    }
  }
  return 0;
}

void sub_18D6102A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _NSLayoutTreeFree(uint64_t a1)
{
  _NSLayoutNodeFree(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 240));
  *(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 240) + 240) = 0;
}

void _NSGlyphTreeFree(uint64_t a1)
{
  _NSGlyphNodeFree(*(_BYTE **)(*(_QWORD *)(a1 + 240) + 208));
  *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 240) + 208) = 0;
}

void _NSGlyphNodeFree(_BYTE *a1)
{
  uint64_t i;

  if (a1)
  {
    if (a1[59])
    {
      _NSGlyphNodeSetCapacity((uint64_t)a1, 0);
    }
    else
    {
      for (i = 0; i != 24; i += 8)
      {
        if (*(_QWORD *)&a1[i + 24])
          _NSGlyphNodeFree();
      }
    }
    free(a1);
  }
}

__n128 _NSLayoutTreeCreate(uint64_t a1)
{
  uint64_t v2;
  double *v3;
  unint64_t v4;
  uint64_t v5;
  __n128 result;
  __int128 v7;
  uint64_t v8;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 208) + 8);
  v3 = (double *)malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
  *((_BYTE *)v3 + 59) = 1;
  v4 = v2 - 1;
  if (!v2)
    v4 = 0;
  *(_QWORD *)v3 = v2;
  v3[1] = (double)((v4 >> 6) + 1) * 14.0;
  *((_BYTE *)v3 + 56) = v2 != 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 240) + 240) = v3;
  *(_QWORD *)(*(_QWORD *)(a1 + 240) + 264) = 0;
  v5 = *(_QWORD *)(a1 + 240) + 240;
  result = *(__n128 *)MEMORY[0x1E0CB3438];
  v7 = *(_OWORD *)(MEMORY[0x1E0CB3438] + 16);
  *(_OWORD *)(v5 + 32) = *MEMORY[0x1E0CB3438];
  *(_OWORD *)(v5 + 48) = v7;
  v8 = *(_QWORD *)(a1 + 240) + 240;
  *(__n128 *)(v8 + 64) = result;
  *(_OWORD *)(v8 + 80) = v7;
  *(_QWORD *)(*(_QWORD *)(a1 + 240) + 336) = 64;
  *(_QWORD *)(*(_QWORD *)(a1 + 240) + 344) = 0x402C000000000000;
  *(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 240);
  *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 240) + 264) = 0;
  return result;
}

_BYTE *_NSGlyphTreeCreate(uint64_t a1)
{
  uint64_t v2;
  _BYTE *result;

  v2 = objc_msgSend(*(id *)(a1 + 8), "length");
  result = malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
  result[59] = 1;
  *(_QWORD *)result = v2;
  *((_QWORD *)result + 1) = v2;
  result[56] = v2 != 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 240) + 208) = result;
  *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216) = result;
  *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224) = 0;
  return result;
}

uint64_t _NSLayoutTreeDeleteCurrentNode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  unint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t result;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  _BYTE *v26;
  char v27;

  while (2)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 248);
    if (*(_QWORD *)(v9 + 16))
    {
      for (i = 0; i != 3; ++i)
      {
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 248);
        v12 = *(_QWORD *)(v11 + 16);
        v13 = *(_QWORD *)(v12 + 8 * i + 24);
        if (!v13)
          goto LABEL_12;
        if (v11 == v13)
        {
          *(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) = v12;
          if (i <= 1)
          {
            do
            {
              v14 = i;
              v15 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) + 8 * i;
              *(_QWORD *)(v15 + 24) = *(_QWORD *)(v15 + 32);
              i = 1;
            }
            while (!v14);
          }
          goto LABEL_10;
        }
        *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256) -= *(_QWORD *)v13;
        *(double *)(*(_QWORD *)(a1 + 240) + 264) = *(double *)(*(_QWORD *)(a1 + 240) + 264) - *(double *)(v13 + 8);
      }
      if (*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248))
      {
LABEL_12:
        _NSLayoutTreeLogDebug((NSString *)CFSTR("!!! _NSLayoutTreeDeleteCurrentNode found broken link"), a2, a3, a4, a5, a6, a7, a8, v27);
        break;
      }
      v11 = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) = MEMORY[0x10];
LABEL_10:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) + 40) = 0;
      _NSLayoutNodeFree(v11);
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 248);
      if (!*(_QWORD *)(v16 + 24))
        continue;
      _NSLayoutNodeSetInvariants(v16);
    }
    else
    {
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 240);
      _NSLayoutNodeFree(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248));
      v24 = (_QWORD *)(*(_QWORD *)(a1 + 240) + 240);
      if (v9 == v23)
      {
        v25 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 344);
        v26 = malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
        v26[59] = 1;
        *(_QWORD *)v26 = 0;
        *((_QWORD *)v26 + 1) = v25;
        v26[56] = 0;
        *(_QWORD *)(*(_QWORD *)(a1 + 240) + 240) = v26;
        v24 = (_QWORD *)(*(_QWORD *)(a1 + 240) + 240);
      }
      v24[1] = *v24;
      *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256) = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 240) + 264) = 0;
    }
    break;
  }
  v17 = (_QWORD *)(a1 + 240);
  for (result = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 240);
        !*(_BYTE *)(result + 59);
        result = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 240))
  {
    if (*(_QWORD *)(result + 32))
      break;
    v19 = *(_QWORD *)(result + 24);
    if (v19)
    {
      *(_QWORD *)(result + 24) = 0;
      *(_QWORD *)(v19 + 16) = 0;
      v20 = (_QWORD *)(*v17 + 240);
      if (v20[1] == *v20)
        v20[1] = v19;
      _NSLayoutNodeFree(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 240));
      *(_QWORD *)(*(_QWORD *)(a1 + 240) + 240) = v19;
    }
    else
    {
      _NSLayoutNodeFree(result);
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 344);
      v22 = malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
      v22[59] = 1;
      *(_QWORD *)v22 = 0;
      *((_QWORD *)v22 + 1) = v21;
      v22[56] = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 240) + 240) = v22;
      *(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 240);
      *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256) = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 240) + 264) = 0;
    }
    v17 = (_QWORD *)(a1 + 240);
  }
  return result;
}

void _NSLayoutNodeFree(uint64_t a1)
{
  void **v2;
  void *v3;
  void *v4;
  uint64_t i;

  if (a1)
  {
    v2 = (void **)(a1 + 24);
    if (*(_BYTE *)(a1 + 59))
    {
      if (*v2)
      {
        free(*v2);
        *v2 = 0;
      }
      v3 = *(void **)(a1 + 32);
      if (v3)
      {
        free(v3);
        *(_QWORD *)(a1 + 32) = 0;
        *(_BYTE *)(a1 + 58) = 0;
      }
      v4 = *(void **)(a1 + 40);
      if (v4)
        free(v4);
    }
    else
    {
      for (i = 0; i != 3; ++i)
      {
        if (v2[i])
          _NSLayoutNodeFree();
      }
    }
    free((void *)a1);
  }
}

double _NSLayoutTreeSetExtraLineFragmentRect(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  _BOOL4 v21;
  uint64_t v22;
  unint64_t *v23;
  double v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  double *v32;
  double v33;
  double v34;
  double *v35;
  double *v36;
  double result;
  double v38;

  v17 = *(_QWORD *)(a1 + 240);
  v18 = **(_QWORD **)(v17 + 240);
  v19 = 0.0;
  if (v18)
  {
    v38 = a4;
    v20 = v18 - 1;
    v21 = _NSLayoutTreeMoveToGlyphIndex(a1, v18 - 1);
    v17 = *(_QWORD *)(a1 + 240);
    if (v21)
    {
      v22 = *(_QWORD *)(v17 + 256);
      v23 = *(unint64_t **)(*(_QWORD *)(v17 + 248) + 24);
      v24 = *(double *)(v17 + 264);
      if (v23)
      {
        v25 = 0;
        v26 = v20 - v22;
        v29 = *v23;
        v27 = v23 + 4;
        v28 = v29;
        v30 = v29 - 1;
        while (1)
        {
          v31 = (v25 + v30) >> 1;
          if ((v27[10 * v31] & 0x8FFFFFFFFFFFFFFFLL) <= v26)
          {
            v25 = v31 + 1;
            if (v31 + 1 >= v28 || (v27[10 * v25] & 0x8FFFFFFFFFFFFFFFLL) > v26)
            {
LABEL_10:
              v32 = (double *)&v27[10 * v31];
              v33 = v32[9];
              v34 = v24 + v32[7];
              goto LABEL_12;
            }
          }
          else
          {
            v30 = v31 - 1;
          }
          if (v30 < v25)
            goto LABEL_10;
        }
      }
      v33 = *(double *)(v17 + 344);
      v34 = v24 + (double)((unint64_t)(v20 - v22) / *(_QWORD *)(v17 + 336)) * v33;
LABEL_12:
      v19 = v34 + v33;
    }
    a4 = v38;
  }
  v35 = (double *)(v17 + 240);
  v35[4] = a2;
  v35[5] = a3;
  v35[6] = a4;
  v35[7] = a5;
  v36 = (double *)(*(_QWORD *)(a1 + 240) + 240);
  v36[8] = a6;
  v36[9] = a7;
  v36[10] = a8;
  v36[11] = a9;
  *(double *)(*(_QWORD *)(a1 + 240) + 280) = *(double *)(*(_QWORD *)(a1 + 240) + 280) - v19;
  result = *(double *)(*(_QWORD *)(a1 + 240) + 312) - v19;
  *(double *)(*(_QWORD *)(a1 + 240) + 312) = result;
  return result;
}

void _NSLayoutTreeInvalidateLayoutForCharacterRange(uint64_t a1, unint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;

  v13 = _NSGlyphTreeGlyphIndexForCharacterAtIndex(a1, a2);
  v14 = _NSGlyphTreeGlyphIndexForCharacterAtIndex(a1, a2 + a3);
  v19 = **(_QWORD **)(*(_QWORD *)(a1 + 240) + 240);
  if (v14 < v19)
    v19 = v14;
  if (v19 > v13 && (a4 & 1) == 0)
    _NSLayoutTreeInvalidateLayoutForGlyphRange(a1, v13, v19 - v13, 0, v15, v16, v17, v18, a9);
}

uint64_t ___allocExtraData_block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSUsesDefaultHyphenation"));
  __NSUsesDefaultHyphenation = result;
  return result;
}

uint64_t __NSCreateRenderingContextForAttributedString(uint64_t a1, uint64_t a2, char a3, char a4, char a5, double a6, double a7)
{
  uint64_t v7;
  _QWORD v9[9];
  char v10;
  char v11;
  char v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__9;
  v19 = __Block_byref_object_dispose__9;
  v20 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ____NSCreateRenderingContextForAttributedString_block_invoke;
  v9[3] = &unk_1E2605418;
  *(double *)&v9[6] = a6;
  v9[4] = a1;
  v9[5] = &v15;
  v9[7] = a2;
  v10 = 0;
  v11 = a5;
  v12 = a3;
  v13 = a4;
  *(double *)&v9[8] = a7;
  v14 = 0;
  +[NSSingleLineTypesetter performWithSingleLineTypesetterContext:](NSSingleLineTypesetter, "performWithSingleLineTypesetterContext:", v9);
  v7 = v16[5];
  _Block_object_dispose(&v15, 8);
  return v7;
}

void sub_18D6133E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void __shouldUseHangulWordPriorityWithLineBreakStrategy_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("NSForceHangulWordBreakPriority"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v1 = v3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = objc_msgSend(v3, "unsignedIntegerValue");
    else
      v2 = 0x7FFFFFFFFFFFFFFFLL;
    v1 = v3;
  }
  else
  {
    v2 = 0x7FFFFFFFFFFFFFFFLL;
  }
  shouldUseHangulWordPriorityWithLineBreakStrategy_hangulWordBreakPriorityDefault = v2;

}

void _NSLayoutTreeInvalidateLayoutForGlyphRange(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v9;
  uint64_t v10;
  int *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void **v24;
  unint64_t v25;
  double *SubNode;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __CFString *v33;
  double v35;
  uint64_t v36;
  unint64_t v37;
  double v38;
  double *v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  double v49;
  double *v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void **v61;
  unint64_t v62;
  double v63;
  double *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  double v72;
  uint64_t j;
  uint64_t v74;
  uint64_t k;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  double v82;
  void *v83;
  uint64_t i;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  void *v88;
  void *v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void **v100;
  uint64_t v101;
  unint64_t v102;
  double *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD *v111;
  _QWORD *v112;
  unint64_t v113;
  double v114;
  double *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  __CFString *v122;
  uint64_t v123;
  unint64_t v124;
  double v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t v134;
  double v135;
  void *v136;
  uint64_t v137;
  unint64_t v138;
  double v139;
  double *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t m;
  uint64_t v148;
  unint64_t v149;
  void *v150;
  void *v151;
  unint64_t v152;
  uint64_t v153;

  if (a3 | a4)
  {
    v9 = a2;
    v10 = a1;
    v11 = &OBJC_IVAR___NSLayoutManager__extraData;
    v12 = a2 + a3;
    v153 = **(_QWORD **)(*(_QWORD *)(a1 + 240) + 240);
    if (a2 < a2 + a3)
    {
      v13 = a3 + a4;
      v14 = a4;
      while (1)
      {
        v15 = v13 - (v12 - v9);
        if (!_NSLayoutTreeMoveToGlyphIndex(v10, v9))
          break;
        v16 = v11;
        v17 = *(_QWORD *)(v10 + *v11);
        v19 = *(_QWORD *)(v17 + 248);
        v18 = *(_QWORD *)(v17 + 256);
        v20 = *(_QWORD *)v19;
        v21 = *(_QWORD *)v19 + v18;
        v22 = v21 - v9;
        if (v12 <= v21)
          v22 = v12 - v9;
        else
          v15 = v13 - (v21 - v9);
        v24 = (void **)(v19 + 24);
        v23 = *(void **)(v19 + 24);
        if (v23)
        {
          if (v9 <= v18)
          {
            if (v9)
            {
              v36 = v21 - (v22 + v9);
              if (v21 <= v22 + v9)
              {
                v10 = a1;
                _NSLayoutTreeDeleteCurrentNode(a1, a2, v36, a4, a5, a6, a7, a8);
                v11 = v16;
                if (!v13)
                  goto LABEL_62;
              }
              else
              {
                _NSLayoutNodeTruncate(*(_QWORD *)(v17 + 248), v22 + v9 - v18, v36, *(_QWORD *)(v17 + 336), *(double *)(v17 + 344));
                v11 = v16;
                v10 = a1;
                if (!v13)
                  goto LABEL_62;
              }
              if (_NSLayoutTreeMoveToGlyphIndex(v10, v9 - 1))
              {
                v58 = *(_QWORD *)(v10 + *v11) + 240;
                v59 = *(_QWORD *)(*(_QWORD *)(v10 + *v11) + 248);
                v60 = v10;
                v61 = (void **)(v59 + 24);
                if (*(_QWORD *)(v59 + 24))
                {
                  v62 = *(_QWORD *)(v58 + 96);
                  v63 = *(double *)(v58 + 104);
                  v64 = (double *)malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
                  *((_BYTE *)v64 + 59) = 1;
                  *(_QWORD *)v64 = v13;
                  v64[1] = v63 * (double)((v13 - 1) / v62 + 1);
                  *((_BYTE *)v64 + 56) = 1;
                  _NSLayoutTreeInsertNodeAfterCurrentNode(v60, (uint64_t)v64, v65, v66, v67, v68, v69, v70);
                  v10 = v60;
                }
                else
                {
                  v81 = *(_QWORD *)v59;
                  v152 = *(_QWORD *)(v58 + 96);
                  v82 = *(double *)(v58 + 104);
                  if (*(_BYTE *)(v59 + 59))
                  {
                    v83 = 0;
                  }
                  else
                  {
                    for (i = 0; i != 3; ++i)
                    {
                      v85 = (uint64_t)v61[i];
                      if (v85)
                      {
                        _NSLayoutNodeFree(v85);
                        v61[i] = 0;
                      }
                    }
                    v83 = *v61;
                    v11 = v16;
                  }
                  v86 = v81 + v13;
                  *(_BYTE *)(v59 + 59) = 1;
                  v87 = v81 + v13 - 1;
                  if (!(v81 + v13))
                    v87 = 0;
                  *(_QWORD *)v59 = v86;
                  *(double *)(v59 + 8) = v82 * (double)(v87 / v152 + 1);
                  *(_BYTE *)(v59 + 56) = v86 != 0;
                  if (v83)
                  {
                    free(v83);
                    *v61 = 0;
                  }
                  v88 = *(void **)(v59 + 32);
                  if (v88)
                  {
                    free(v88);
                    *(_QWORD *)(v59 + 32) = 0;
                    *(_BYTE *)(v59 + 58) = 0;
                  }
                  v89 = *(void **)(v59 + 40);
                  v10 = a1;
                  if (v89)
                  {
                    free(v89);
                    *(_QWORD *)(v59 + 40) = 0;
                  }
                  _NSLayoutNodeSetInvariants(v59);
                }
                goto LABEL_62;
              }
              v33 = CFSTR("!!! _NSLayoutTreeInvalidateLayoutForGlyphRange found invalid glyph index");
              goto LABEL_13;
            }
            v47 = v21 - v22;
            v11 = v16;
            if (v21 <= v22)
            {
              if (!v13)
              {
                v10 = a1;
                _NSLayoutTreeDeleteCurrentNode(a1, a2, v47, a4, a5, a6, a7, a8);
                goto LABEL_62;
              }
              v71 = *(_QWORD *)(v17 + 336);
              v72 = *(double *)(v17 + 344);
              if (!*(_BYTE *)(v19 + 59))
              {
                for (j = 0; j != 3; ++j)
                {
                  v74 = (uint64_t)v24[j];
                  if (v74)
                  {
                    _NSLayoutNodeFree(v74);
                    v24[j] = 0;
                  }
                }
                v23 = *v24;
              }
              *(_BYTE *)(v19 + 59) = 1;
              *(_QWORD *)v19 = v13;
              *(double *)(v19 + 8) = v72 * (double)((v13 - 1) / v71 + 1);
              *(_BYTE *)(v19 + 56) = 1;
              if (v23)
              {
LABEL_55:
                free(v23);
                *v24 = 0;
              }
LABEL_56:
              v79 = *(void **)(v19 + 32);
              v11 = v16;
              if (v79)
              {
                free(v79);
                *(_QWORD *)(v19 + 32) = 0;
                *(_BYTE *)(v19 + 58) = 0;
              }
              v80 = *(void **)(v19 + 40);
              if (v80)
              {
                free(v80);
                *(_QWORD *)(v19 + 40) = 0;
              }
              _NSLayoutNodeSetInvariants(v19);
LABEL_61:
              v10 = a1;
              goto LABEL_62;
            }
            _NSLayoutNodeTruncate(*(_QWORD *)(v17 + 248), v22 - v18, v47, *(_QWORD *)(v17 + 336), *(double *)(v17 + 344));
            if (!v13)
              goto LABEL_61;
            v48 = *(_QWORD *)(*(_QWORD *)(a1 + *v16) + 336);
            v49 = *(double *)(*(_QWORD *)(a1 + *v16) + 344);
            v50 = (double *)malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
            *((_BYTE *)v50 + 59) = 1;
            *(_QWORD *)v50 = v13;
            v51 = (v13 - 1) / v48;
            v10 = a1;
            v50[1] = v49 * (double)(v51 + 1);
            *((_BYTE *)v50 + 56) = 1;
            _NSLayoutTreeInsertNodeBeforeCurrentNode(a1, (uint64_t)v50, v52, v53, v54, v55, v56, v57);
          }
          else
          {
            v25 = v22 + v9;
            if (v21 <= v25)
            {
              v11 = v16;
            }
            else
            {
              SubNode = _NSLayoutNodeCreateSubNode(*(_QWORD *)(v17 + 248), v25 - v18, v21 - v25, *(_QWORD *)(v17 + 336), *(double *)(v17 + 344));
              _NSLayoutTreeInsertNodeAfterCurrentNode(a1, (uint64_t)SubNode, v27, v28, v29, v30, v31, v32);
              v11 = v16;
              v17 = *(_QWORD *)(a1 + *v16);
              v19 = *(_QWORD *)(v17 + 248);
              v18 = *(_QWORD *)(v17 + 256);
            }
            _NSLayoutNodeTruncate(v19, 0, v9 - v18, *(_QWORD *)(v17 + 336), *(double *)(v17 + 344));
            if (!v13)
              goto LABEL_61;
            v37 = *(_QWORD *)(*(_QWORD *)(a1 + *v11) + 336);
            v38 = *(double *)(*(_QWORD *)(a1 + *v11) + 344);
            v39 = (double *)malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
            *((_BYTE *)v39 + 59) = 1;
            *(_QWORD *)v39 = v13;
            v40 = (v13 - 1) / v37;
            v10 = a1;
            v39[1] = v38 * (double)(v40 + 1);
            *((_BYTE *)v39 + 56) = 1;
            _NSLayoutTreeInsertNodeAfterCurrentNode(a1, (uint64_t)v39, v41, v42, v43, v44, v45, v46);
          }
        }
        else
        {
          if (!v15)
          {
            v11 = v16;
            goto LABEL_61;
          }
          if (v15 > 0 || v20 > -v15)
          {
            v35 = *(double *)(v17 + 344);
            v152 = *(_QWORD *)(v17 + 336);
            if (*(_BYTE *)(v19 + 59))
            {
              v23 = 0;
            }
            else
            {
              for (k = 0; k != 3; ++k)
              {
                v76 = (uint64_t)v24[k];
                if (v76)
                {
                  _NSLayoutNodeFree(v76);
                  v24[k] = 0;
                }
              }
              v23 = *v24;
            }
            v77 = v15 + v20;
            *(_BYTE *)(v19 + 59) = 1;
            v78 = v15 + v20 - 1;
            if (!(v15 + v20))
              v78 = 0;
            *(_QWORD *)v19 = v77;
            *(double *)(v19 + 8) = v35 * (double)(v78 / v152 + 1);
            *(_BYTE *)(v19 + 56) = v77 != 0;
            if (v23)
              goto LABEL_55;
            goto LABEL_56;
          }
          v10 = a1;
          _NSLayoutTreeDeleteCurrentNode(a1, a2, a3, a4, a5, a6, a7, a8);
          v11 = v16;
        }
LABEL_62:
        v9 += v13;
        v12 += v15;
        v14 -= v15;
        v13 = 0;
        if (v9 >= v12)
          goto LABEL_82;
      }
      v33 = CFSTR("!!! _NSLayoutTreeInvalidateLayoutForGlyphRange invalid range 1");
LABEL_13:
      _NSLayoutTreeLogDebug((NSString *)v33, a2, a3, a4, a5, a6, a7, a8, v152);
      goto LABEL_62;
    }
    v14 = a4;
LABEL_82:
    v90 = v14 - 1;
    if (v14 < 1)
    {
      v110 = v153;
      if (v14 < 0)
        _NSLayoutTreeLogDebug((NSString *)CFSTR("!!! _NSLayoutTreeInvalidateLayoutForGlyphRange invalid change in length"), a2, a3, a4, a5, a6, a7, a8, v152);
      goto LABEL_130;
    }
    if (v9)
    {
      if (_NSLayoutTreeMoveToGlyphIndex(v10, v9 - 1))
      {
        v98 = *(_QWORD *)(v10 + *v11);
        v99 = *(_QWORD *)(v98 + 248);
        v100 = (void **)(v99 + 24);
        if (*(_QWORD *)(v99 + 24))
        {
          v101 = *(_QWORD *)(v98 + 256);
          v102 = *(_QWORD *)v99 + v101;
          if (v102 <= v9)
          {
            v10 = a1;
          }
          else
          {
            v103 = _NSLayoutNodeCreateSubNode(*(_QWORD *)(v98 + 248), v9 - v101, v102 - v9, *(_QWORD *)(v98 + 336), *(double *)(v98 + 344));
            v10 = a1;
            _NSLayoutTreeInsertNodeAfterCurrentNode(a1, (uint64_t)v103, v104, v105, v106, v107, v108, v109);
            _NSLayoutNodeTruncate(*(_QWORD *)(*(_QWORD *)(v10 + *v11) + 248), 0, v9 - *(_QWORD *)(*(_QWORD *)(v10 + *v11) + 256), *(_QWORD *)(*(_QWORD *)(v10 + *v11) + 336), *(double *)(*(_QWORD *)(v10 + *v11) + 344));
            v98 = *(_QWORD *)(a1 + *v11);
          }
          v137 = v98 + 240;
          v138 = *(_QWORD *)(v137 + 96);
          v139 = *(double *)(v137 + 104);
          v140 = (double *)malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
          *((_BYTE *)v140 + 59) = 1;
          *(_QWORD *)v140 = v14;
          v140[1] = v139 * (double)(v90 / v138 + 1);
          *((_BYTE *)v140 + 56) = 1;
          _NSLayoutTreeInsertNodeAfterCurrentNode(v10, (uint64_t)v140, v141, v142, v143, v144, v145, v146);
          goto LABEL_113;
        }
        v133 = *(_QWORD *)v99 + v14;
        v134 = *(_QWORD *)(v98 + 336);
        v135 = *(double *)(v98 + 344);
        if (*(_BYTE *)(v99 + 59))
        {
          v136 = 0;
        }
        else
        {
          for (m = 0; m != 3; ++m)
          {
            v148 = (uint64_t)v100[m];
            if (v148)
            {
              _NSLayoutNodeFree(v148);
              v100[m] = 0;
            }
          }
          v136 = *v100;
        }
        *(_BYTE *)(v99 + 59) = 1;
        v149 = v133 - 1;
        if (!v133)
          v149 = 0;
        *(_QWORD *)v99 = v133;
        *(double *)(v99 + 8) = v135 * (double)(v149 / v134 + 1);
        *(_BYTE *)(v99 + 56) = v133 != 0;
        if (v136)
        {
          free(v136);
          *v100 = 0;
        }
        v150 = *(void **)(v99 + 32);
        v110 = v153;
        if (v150)
        {
          free(v150);
          *(_QWORD *)(v99 + 32) = 0;
          *(_BYTE *)(v99 + 58) = 0;
        }
        v151 = *(void **)(v99 + 40);
        v10 = a1;
        if (v151)
        {
          free(v151);
          *(_QWORD *)(v99 + 40) = 0;
        }
        v132 = v99;
LABEL_129:
        _NSLayoutNodeSetInvariants(v132);
LABEL_130:
        if (v110 + a4 != **(_QWORD **)(*(_QWORD *)(v10 + *v11) + 240))
          _NSLayoutTreeLogDebug((NSString *)CFSTR("!!! _NSLayoutTreeInvalidateLayoutForGlyphRange glyph count mismatch"), a2, a3, a4, a5, a6, a7, a8, a9);
        return;
      }
      v122 = CFSTR("!!! _NSLayoutTreeInvalidateLayoutForGlyphRange invalid range 2");
    }
    else
    {
      v111 = (_QWORD *)(*(_QWORD *)(v10 + *v11) + 240);
      if (!*(_QWORD *)*v111)
      {
        v111[1] = *v111;
        *(_QWORD *)(*(_QWORD *)(v10 + *v11) + 256) = 0;
        *(_QWORD *)(*(_QWORD *)(v10 + *v11) + 264) = 0;
        v123 = *(_QWORD *)(*(_QWORD *)(v10 + *v11) + 248);
        v124 = *(_QWORD *)(*(_QWORD *)(v10 + *v11) + 336);
        v125 = *(double *)(*(_QWORD *)(v10 + *v11) + 344);
        if (!*(_BYTE *)(v123 + 59))
        {
          v126 = 0;
          v127 = v123 + 24;
          do
          {
            v128 = *(_QWORD *)(v127 + v126);
            if (v128)
            {
              _NSLayoutNodeFree(v128);
              *(_QWORD *)(v127 + v126) = 0;
            }
            v126 += 8;
          }
          while (v126 != 24);
        }
        *(_BYTE *)(v123 + 59) = 1;
        *(_QWORD *)v123 = v14;
        *(double *)(v123 + 8) = v125 * (double)((v14 - 1) / v124 + 1);
        *(_BYTE *)(v123 + 56) = 1;
        v129 = *(void **)(v123 + 24);
        if (v129)
        {
          free(v129);
          *(_QWORD *)(v123 + 24) = 0;
        }
        v130 = *(void **)(v123 + 32);
        v110 = v153;
        if (v130)
        {
          free(v130);
          *(_QWORD *)(v123 + 32) = 0;
          *(_BYTE *)(v123 + 58) = 0;
        }
        v131 = *(void **)(v123 + 40);
        v10 = a1;
        if (v131)
        {
          free(v131);
          *(_QWORD *)(v123 + 40) = 0;
        }
        v132 = v123;
        goto LABEL_129;
      }
      if (_NSLayoutTreeMoveToGlyphIndex(v10, 0))
      {
        v112 = *(_QWORD **)(*(_QWORD *)(v10 + *v11) + 248);
        if (v112[3])
        {
          v113 = *(_QWORD *)(*(_QWORD *)(v10 + *v11) + 336);
          v114 = *(double *)(*(_QWORD *)(v10 + *v11) + 344);
          v115 = (double *)malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
          *((_BYTE *)v115 + 59) = 1;
          *(_QWORD *)v115 = v14;
          v115[1] = v114 * (double)(v90 / v113 + 1);
          *((_BYTE *)v115 + 56) = 1;
          _NSLayoutTreeInsertNodeBeforeCurrentNode(v10, (uint64_t)v115, v116, v117, v118, v119, v120, v121);
        }
        else
        {
          _NSLayoutNodeInvalidate((uint64_t)v112, *v112 + v14, *(_QWORD *)(*(_QWORD *)(v10 + *v11) + 336), *(double *)(*(_QWORD *)(v10 + *v11) + 344));
        }
        goto LABEL_113;
      }
      v122 = CFSTR("!!! _NSLayoutTreeInvalidateLayoutForGlyphRange invalid range 3");
    }
    _NSLayoutTreeLogDebug((NSString *)v122, v91, v92, v93, v94, v95, v96, v97, v152);
LABEL_113:
    v110 = v153;
    goto LABEL_130;
  }
}

void _NSGlyphTreeResetLayoutAttributesForGlyphsInRange(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v9;
  unint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  char v30;

  v9 = a2 + a3;
  if (a2 < a2 + a3)
  {
    v10 = a2;
    while (_NSGlyphTreeMoveToGlyphIndex(a1, v10))
    {
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
      v21 = *(_QWORD *)(v20 + 8) + v19;
      if (v21 >= v9)
        v22 = v9;
      else
        v22 = *(_QWORD *)(v20 + 8) + v19;
      if (*(_BYTE *)(v20 + 59))
      {
        if (*(_QWORD *)(v20 + 24) && v10 < v22)
        {
          v24 = 24 * v10;
          while (2)
          {
            v25 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
            if (!*(_BYTE *)(v25 + 59))
              goto LABEL_24;
            v26 = *(_QWORD *)(v25 + 24);
            if (!v26)
              goto LABEL_24;
            v27 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
            switch(*(_BYTE *)(v25 + 57))
            {
              case 0:
                v28 = v26 - v27;
                v29 = *(unsigned __int8 *)(v28 + v10);
                if (v29 >= 0xF0)
                {
                  v30 = v29 & 0xB | 0xF0;
                  goto LABEL_23;
                }
                if (v29 <= 3)
                {
                  v30 = v29 & 2;
LABEL_23:
                  *(_BYTE *)(v28 + v10) = v30;
                }
LABEL_24:
                ++v10;
                v24 += 24;
                if (v22 == v10)
                  break;
                continue;
              case 1:
                *(_WORD *)(v26 - 2 * v27 + 2 * v10) &= 0xFF9Du;
                goto LABEL_24;
              case 2:
                *(_DWORD *)(v26 - 4 * v27 + 4 * v10) &= 0xFFFFFF9D;
                goto LABEL_24;
              case 3:
                *(_DWORD *)(v26 - 24 * v27 + v24) &= 0xFFFFFF9D;
                goto LABEL_24;
              default:
                goto LABEL_24;
            }
            break;
          }
        }
      }
      v10 = v22;
      if (v9 <= v21)
        return;
    }
    _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeResetNotShownAttributeAndDrawsOutsideLineFragmentForGlyphsInRange invalid glyph range"), v12, v13, v14, v15, v16, v17, v18, a9);
  }
}

void _NSLayoutTreeSetLocationForGlyphRange(uint64_t a1, unint64_t a2, uint64_t a3, double a4, double a5)
{
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  size_t v25;
  unint64_t *v26;
  unint64_t v27;
  _QWORD *v28;
  int v29;
  unint64_t v30;
  uint64_t *p_src;
  uint64_t v32;
  size_t v33;
  uint64_t __src;
  double v35;
  double v36;
  uint64_t v37;
  double v38;

  if (a3)
  {
    if (_NSLayoutTreeMoveToGlyphIndex(a1, a2)
      && (v17 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 248),
          v18 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256),
          v11 = *(_QWORD *)v17,
          a2 + a3 <= *(_QWORD *)v17 + v18))
    {
      v19 = *(_QWORD **)(v17 + 32);
      if (!v19)
      {
        *(_BYTE *)(v17 + 56) |= 4u;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) + 58) = 1;
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 248);
        v21 = *MEMORY[0x1E0C85AD8] >> 3;
        if (v21 >= 0x2000)
          v21 = 0x2000;
        if (v21 <= 1)
          v21 = 1;
        if (*MEMORY[0x1E0C85AD8] >= 0x10uLL)
          v22 = 16;
        else
          v22 = v21;
        v23 = 24;
        if (*(_BYTE *)(v20 + 58) != 1)
          v23 = 0;
        if (*(_BYTE *)(v20 + 58))
          v24 = v23;
        else
          v24 = 16;
        v25 = v22 * v24 + 16;
        v26 = *(unint64_t **)(v20 + 32);
        if (v26)
        {
          v27 = *v26;
          v28 = malloc_type_realloc(v26, v25, 0xE24B4C6BuLL);
          *(_QWORD *)(v20 + 32) = v28;
          if (v22 > v27)
          {
            bzero((char *)v28 + v27 * v24 + 16, (v22 - v27) * v24);
            v28 = *(_QWORD **)(v20 + 32);
          }
        }
        else
        {
          v28 = malloc_type_calloc(1uLL, v25, 0x4FAA93BuLL);
          *(_QWORD *)(v20 + 32) = v28;
        }
        v28[1] = v22;
        **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) + 32) = 1;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) + 32) + 16) = 0;
        *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) + 32) + 24) = *MEMORY[0x1E0CB3430];
        _NSLayoutNodeSetInvariants(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248));
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 248);
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256);
        v19 = *(_QWORD **)(v17 + 32);
        v11 = *(_QWORD *)v17;
      }
      v29 = *(unsigned __int8 *)(v17 + 58);
      v30 = a2 - v18;
      v37 = 0;
      v38 = 0.0;
      __src = 0;
      v35 = 0.0;
      v36 = 0.0;
      if (v29 == 1)
      {
        __src = a2 - v18;
        p_src = &__src;
        v35 = a4;
        v36 = a5;
      }
      else
      {
        p_src = 0;
        if (!v29)
        {
          v37 = a2 - v18;
          v38 = a4;
          p_src = &v37;
        }
      }
      v32 = 24;
      if (v29 != 1)
        v32 = 0;
      if (v29)
        v33 = v32;
      else
        v33 = 16;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) + 32) = _NSGlyphRangeListSet(v19, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedLocationCapacity, v11, 16, v33, v30, a3, p_src);
    }
    else
    {
      _NSLayoutTreeLogDebug((NSString *)CFSTR("!!! _NSLayoutTreeSetLocationForGlyphRange invalid glyph range {%lu, %lu}"), v10, v11, v12, v13, v14, v15, v16, a2);
    }
  }
}

BOOL _NSLayoutTreeMoveToGlyphIndex(uint64_t a1, unint64_t a2)
{
  _QWORD *i;
  _QWORD *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  uint64_t v12;
  BOOL j;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;

  for (i = (_QWORD *)(*(_QWORD *)(a1 + 240) + 240); ; i = (_QWORD *)(*(_QWORD *)(a1 + 240) + 240))
  {
    v3 = (_QWORD *)i[1];
    if (!v3 || !v3[2])
      break;
    v4 = i[2];
    if (v4 <= a2 && *v3 + v4 > a2)
      goto LABEL_14;
    v5 = 24;
    while (1)
    {
      v6 = *(_QWORD *)(a1 + 240);
      v7 = *(_QWORD *)(v6 + 248);
      v8 = *(_QWORD *)(v7 + 16);
      v9 = *(_QWORD *)(v8 + v5);
      if (!v9)
        break;
      if (v7 == v9)
        goto LABEL_12;
      *(_QWORD *)(v6 + 256) -= *(_QWORD *)v9;
      *(double *)(*(_QWORD *)(a1 + 240) + 264) = *(double *)(*(_QWORD *)(a1 + 240) + 264) - *(double *)(v9 + 8);
      v5 += 8;
      if (v5 == 48)
      {
        v8 = 0;
        v6 = *(_QWORD *)(a1 + 240);
        goto LABEL_12;
      }
    }
    v8 = 0;
LABEL_12:
    *(_QWORD *)(v6 + 248) = v8;
  }
  i[1] = *i;
  *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 240) + 264) = 0;
LABEL_14:
  v10 = (_QWORD *)(*(_QWORD *)(a1 + 240) + 240);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256);
  if (v11 > a2)
    return 0;
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 248);
  if (*(_QWORD *)v12 + v11 <= a2)
    return 0;
  for (j = *(_BYTE *)(v12 + 59) != 0; !*(_BYTE *)(v12 + 59); j = *(_BYTE *)(v12 + 59) != 0)
  {
    v14 = 24;
    while (1)
    {
      v15 = *(_QWORD *)(a1 + 240);
      v16 = *(_QWORD *)(*(_QWORD *)(v15 + 248) + v14);
      if (!v16)
        break;
      v17 = *(_QWORD *)(v15 + 256);
      v18 = *(_QWORD *)v16 + v17;
      if (v17 <= a2 && v18 > a2)
        break;
      *(_QWORD *)(v15 + 256) = v18;
      *(double *)(*(_QWORD *)(a1 + 240) + 264) = *(double *)(v16 + 8) + *(double *)(*(_QWORD *)(a1 + 240) + 264);
      v14 += 8;
      if (v14 == 48)
      {
        v16 = 0;
        v15 = *(_QWORD *)(a1 + 240);
        break;
      }
    }
    *(_QWORD *)(v15 + 248) = v16;
    v10 = (_QWORD *)(*(_QWORD *)(a1 + 240) + 240);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 248);
    if (!v12)
      goto LABEL_29;
  }
  if (!*(_QWORD *)(v12 + 16))
  {
LABEL_29:
    v10[1] = *v10;
    *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 240) + 264) = 0;
    return j;
  }
  return 1;
}

_QWORD *_NSGlyphRangeListSet(_QWORD *a1, uint64_t (*a2)(unint64_t), unint64_t a3, uint64_t a4, size_t __len, unint64_t a6, uint64_t a7, void *__src)
{
  _QWORD *v8;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  char v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v31;
  unint64_t v33;
  void *v34;

  v8 = a1;
  if (!a7)
    return v8;
  v11 = 0;
  v13 = *a1;
  v12 = a1[1];
  v14 = (char *)a1 + a4;
  v15 = *a1 - 1;
  v16 = v15;
  while (1)
  {
    v17 = (v16 + v11) >> 1;
    v18 = *(_QWORD *)&v14[v17 * __len] & 0x8FFFFFFFFFFFFFFFLL;
    if (v18 <= a6)
      break;
    v16 = v17 - 1;
LABEL_7:
    if (v16 < v11)
    {
      v19 = __len + __len * v17;
LABEL_9:
      v20 = 0;
      v21 = *(_QWORD *)&v14[v19] & 0x8FFFFFFFFFFFFFFFLL;
      goto LABEL_11;
    }
  }
  v11 = v17 + 1;
  if (v17 + 1 < v13)
  {
    v19 = v11 * __len;
    if ((*(_QWORD *)&v14[v11 * __len] & 0x8FFFFFFFFFFFFFFFLL) > a6)
      goto LABEL_9;
    goto LABEL_7;
  }
  v20 = 1;
  v21 = a3;
LABEL_11:
  v22 = a6 + a7;
  v23 = v17;
  if (a6 + a7 > v21)
  {
    v24 = 0;
    v25 = v22 - 1;
    do
    {
      v23 = (v15 + v24) >> 1;
      if ((*(_QWORD *)&v14[v23 * __len] & 0x8FFFFFFFFFFFFFFFLL) <= v25)
      {
        v24 = v23 + 1;
        if (v23 + 1 >= v13)
          goto LABEL_20;
        if ((*(_QWORD *)&v14[v24 * __len] & 0x8FFFFFFFFFFFFFFFLL) > v25)
          break;
      }
      else
      {
        v15 = v23 - 1;
      }
    }
    while (v15 >= v24);
  }
  if ((v20 & 1) == 0)
    a3 = *(_QWORD *)&v14[__len + __len * v23] & 0x8FFFFFFFFFFFFFFFLL;
LABEL_20:
  if (a6 <= v18)
    v26 = v17;
  else
    v26 = v17 + 1;
  if (v22 < a3)
    v27 = v23;
  else
    v27 = v23 + 1;
  if (v22 >= a3)
    v28 = v26 - v23;
  else
    v28 = v26 - v23 + 1;
  if (v28)
  {
    v29 = v28 + v13;
    *a1 = v28 + v13;
    v34 = __src;
    if (v28 + v13 <= v12)
    {
      v33 = v12;
    }
    else
    {
      v31 = a2(v28 + v13);
      v8[1] = v31;
      v33 = v31;
      v8 = malloc_type_realloc(v8, a4 + v31 * __len, 0xDFFEB160uLL);
      v14 = (char *)v8 + a4;
    }
    if (v13 > v27)
      memmove(&v14[(v27 + v28) * __len], &v14[v27 * __len], (v13 - v27) * __len);
    if (v33 > v29)
      bzero(&v14[v29 * __len], (v33 - v29) * __len);
    __src = v34;
  }
  else
  {
    v29 = *a1;
  }
  memmove(&v14[v26 * __len], __src, __len);
  *(_QWORD *)&v14[v26 * __len] = a6 & 0x8FFFFFFFFFFFFFFFLL | (((*(_QWORD *)&v14[v26 * __len] >> 60) & 7) << 60);
  if (v26 + 1 < v29)
    *(_QWORD *)&v14[(v26 + 1) * __len] = v22 & 0x8FFFFFFFFFFFFFFFLL | (((*(_QWORD *)&v14[(v26 + 1) * __len] >> 60) & 7) << 60);
  return v8;
}

void _NSGlyphTreeSetNotShownAttributeForGlyphAtIndex(uint64_t a1, unint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
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
  unint64_t v23;
  unsigned int v24;
  char v25;
  char v26;
  char v27;
  int v28;
  uint64_t v29;
  int v30;
  __int16 v31;

  if (!_NSGlyphTreeMoveToGlyphIndex(a1, a2))
  {
    _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeSetNotShownAttributeForGlyphAtIndex invalid glyph index %lu"), v12, v13, v14, v15, v16, v17, v18, a2);
    return;
  }
  v19 = *(_QWORD *)(a1 + 240);
  v20 = *(_QWORD *)(v19 + 216);
  if (*(_BYTE *)(v20 + 59) && (v21 = *(_QWORD *)(v20 + 24)) != 0)
  {
    if (!a3
      || *(_BYTE *)(v20 + 57)
      || *(unsigned __int8 *)(v21 + a2 - *(_QWORD *)(v19 + 232)) - 240 < 0xFFFFFF14
      || (_NSGlyphNodeSetGlyphFormat(v20, 1uLL),
          v19 = *(_QWORD *)(a1 + 240),
          v20 = *(_QWORD *)(v19 + 216),
          *(_BYTE *)(v20 + 59)))
    {
      v22 = *(_QWORD *)(v20 + 24);
      if (v22)
      {
        v23 = a2 - *(_QWORD *)(v19 + 232);
        switch(*(_BYTE *)(v20 + 57))
        {
          case 0:
            v24 = *(unsigned __int8 *)(v22 + v23);
            if (v24 < 0xF0)
            {
              if (v24 > 3)
                return;
              v27 = v24 & 2 | a3;
            }
            else
            {
              v25 = v24 & 0xFB;
              if (a3)
                v26 = -12;
              else
                v26 = -16;
              v27 = v25 | v26;
            }
            *(_BYTE *)(v22 + v23) = v27;
            break;
          case 1:
            if (a3)
              v31 = 64;
            else
              v31 = 0;
            *(_WORD *)(v22 + 2 * v23) = *(_WORD *)(v22 + 2 * v23) & 0xFFBF | v31;
            break;
          case 2:
            if (a3)
              v28 = 64;
            else
              v28 = 0;
            *(_DWORD *)(v22 + 4 * v23) = *(_DWORD *)(v22 + 4 * v23) & 0xFFFFFFBF | v28;
            break;
          case 3:
            v29 = 24 * v23;
            if (a3)
              v30 = 64;
            else
              v30 = 0;
            *(_DWORD *)(v22 + v29) = *(_DWORD *)(v22 + v29) & 0xFFFFFFBF | v30;
            break;
          default:
            return;
        }
      }
    }
  }
  else if (a3)
  {
    _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeSetNotShownAttributeForGlyphAtIndex missing glyphs"), v12, v13, v14, v15, v16, v17, v18, a9);
  }
}

BOOL _NSGlyphTreeMoveToGlyphIndex(uint64_t a1, unint64_t a2)
{
  _QWORD *i;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  BOOL j;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  unint64_t v18;
  uint64_t v19;

  for (i = (_QWORD *)(*(_QWORD *)(a1 + 240) + 208); ; i = (_QWORD *)(*(_QWORD *)(a1 + 240) + 208))
  {
    v3 = i[1];
    if (!v3 || !*(_QWORD *)(v3 + 16))
      break;
    v4 = i[3];
    if (v4 <= a2 && *(_QWORD *)(v3 + 8) + v4 > a2)
      goto LABEL_14;
    v5 = 24;
    while (1)
    {
      v6 = *(_QWORD *)(a1 + 240);
      v7 = *(_QWORD **)(v6 + 216);
      v8 = v7[2];
      v9 = *(_QWORD **)(v8 + v5);
      if (!v9)
        break;
      if (v7 == v9)
        goto LABEL_12;
      v10 = v9[1];
      *(_QWORD *)(v6 + 224) -= *v9;
      *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232) -= v10;
      v5 += 8;
      if (v5 == 48)
      {
        v8 = 0;
        v6 = *(_QWORD *)(a1 + 240);
        goto LABEL_12;
      }
    }
    v8 = 0;
LABEL_12:
    *(_QWORD *)(v6 + 216) = v8;
  }
  i[1] = *i;
  *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224) = 0;
LABEL_14:
  v11 = (_QWORD *)(*(_QWORD *)(a1 + 240) + 208);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
  if (v12 > a2)
    return 0;
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
  if (*(_QWORD *)(v13 + 8) + v12 <= a2)
    return 0;
  for (j = *(_BYTE *)(v13 + 59) != 0; !*(_BYTE *)(v13 + 59); j = *(_BYTE *)(v13 + 59) != 0)
  {
    v15 = 24;
    while (1)
    {
      v16 = *(_QWORD **)(a1 + 240);
      v17 = *(_QWORD **)(v16[27] + v15);
      if (!v17)
        break;
      v18 = v16[29];
      v19 = v17[1];
      if (v18 <= a2 && v19 + v18 > a2)
        break;
      v16[28] += *v17;
      *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232) += v19;
      v15 += 8;
      if (v15 == 48)
      {
        v17 = 0;
        v16 = *(_QWORD **)(a1 + 240);
        break;
      }
    }
    v16[27] = v17;
    v11 = (_QWORD *)(*(_QWORD *)(a1 + 240) + 208);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
    if (!v13)
      goto LABEL_29;
  }
  if (!*(_QWORD *)(v13 + 16))
  {
LABEL_29:
    v11[1] = *v11;
    *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224) = 0;
    return j;
  }
  return 1;
}

void _NSGlyphNodeSetGlyphFormat(uint64_t a1, unint64_t a2)
{
  size_t v4;
  size_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unsigned int v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  BOOL v18;
  __int16 v19;
  int v20;
  char *v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;

  v4 = *(_QWORD *)(a1 + 48);
  if (a2 > 3)
  {
    v5 = 0;
    if (!v4)
      return;
LABEL_5:
    v6 = *(unsigned __int8 **)(a1 + 24);
    if (v6)
    {
      v7 = *(unsigned __int8 *)(a1 + 57);
      if (v7 == a2)
      {
LABEL_64:
        *(_BYTE *)(a1 + 57) = a2;
        return;
      }
      v8 = malloc_type_calloc(v4, v5, 0xD0C45EE4uLL);
      if (*(_QWORD *)(a1 + 8))
      {
        v9 = 0;
        v10 = 0;
        v11 = 0;
        v12 = 0;
        while (1)
        {
          switch((int)v7)
          {
            case 0:
              v13 = v6[v12];
              if (v13 >= 4)
                v14 = v6[v12];
              else
                v14 = 0xFFFFFF;
              if (v13 <= 0xEF)
                v15 = v14;
              else
                v15 = v13 & 3;
              break;
            case 1:
              v16 = *(unsigned __int16 *)&v6[v9];
              goto LABEL_20;
            case 2:
              v16 = *(_DWORD *)&v6[v10];
              goto LABEL_20;
            case 3:
              v16 = *(_DWORD *)&v6[v11];
LABEL_20:
              v17 = v16 >> 8;
              v18 = v16 > 0xFF;
              v15 = ((char)v16 >> 7) & 0xFFFFFF;
              if (v18)
                v15 = v17;
              break;
            default:
              v15 = 0;
              break;
          }
          if (!v8)
            goto LABEL_42;
          switch(a2)
          {
            case 0uLL:
              if (v15 == 0xFFFFFF)
              {
                v8[v12] = 0;
              }
              else
              {
                if (v15 <= 3)
                {
                  LOBYTE(v15) = v15 | 0xF0;
LABEL_41:
                  v8[v12] = v15;
                  goto LABEL_42;
                }
                if (v15 <= 0xEF)
                  goto LABEL_41;
              }
LABEL_42:
              switch((int)v7)
              {
                case 0:
                  v23 = v6[v12];
                  if (v23 < 0xF0)
                  {
                    if (v23 > 3)
                      goto LABEL_50;
                    v24 = (8 * (_BYTE)v23) & 0x10 | ((_BYTE)v23 << 6) | 0xFFFFFF80;
                  }
                  else
                  {
                    v24 = (16 * v23) & 0x40 | (16 * ((v23 >> 3) & 1));
                  }
                  break;
                case 1:
                  v24 = v6[v9];
                  break;
                case 2:
                  v24 = v6[v10];
                  break;
                case 3:
                  v24 = v6[v11];
                  break;
                default:
LABEL_50:
                  v24 = 0;
                  break;
              }
              if (v8)
              {
                switch(a2)
                {
                  case 0uLL:
                    v25 = v8[v12];
                    if (v25 < 0xF0)
                    {
                      if (v25 <= 3)
                        v8[v12] = (v24 >> 3) & 2 | ((v24 & 0x40) != 0);
                    }
                    else
                    {
                      v8[v12] = (v24 >> 1) & 8 | (v24 >> 4) & 4 | v25 & 3 | 0xF0;
                    }
                    break;
                  case 1uLL:
                    v8[v9] = v24;
                    break;
                  case 2uLL:
                    v8[v10] = v24;
                    break;
                  case 3uLL:
                    v8[v11] = v24;
                    break;
                  default:
                    break;
                }
              }
              ++v12;
              v11 += 24;
              v10 += 4;
              v9 += 2;
              if (v12 >= *(_QWORD *)(a1 + 8))
                goto LABEL_61;
              break;
            case 1uLL:
              v8[v9] = 0;
              if (v15 == 0xFFFFFF)
                v19 = 128;
              else
                v19 = (_WORD)v15 << 8;
              *(_WORD *)&v8[v9] = v19 & 0xFF80 | *(_WORD *)&v8[v9] & 0x7F;
              goto LABEL_42;
            case 2uLL:
              v8[v10] = 0;
              if (v15 == 0xFFFFFF)
                v20 = 128;
              else
                v20 = v15 << 8;
              *(_DWORD *)&v8[v10] = v20 & 0xFFFFFF80 | *(_DWORD *)&v8[v10] & 0x7F;
              goto LABEL_42;
            case 3uLL:
              v21 = &v8[v11];
              *v21 = 0;
              *((_QWORD *)v21 + 2) = 0;
              if (v15 == 0xFFFFFF)
                v22 = 128;
              else
                v22 = v15 << 8;
              *(_DWORD *)v21 = v22 & 0xFFFFFF80 | *(_DWORD *)&v8[v11] & 0x7F;
              goto LABEL_42;
            default:
              goto LABEL_42;
          }
        }
      }
LABEL_61:
      free(v6);
    }
    else
    {
      v8 = malloc_type_calloc(v4, v5, 0x9D5A80FCuLL);
    }
    *(_QWORD *)(a1 + 24) = v8;
    goto LABEL_64;
  }
  v5 = qword_18D6CBC78[a2];
  if (v4)
    goto LABEL_5;
}

unint64_t _NSLayoutNodeSuggestedLocationCapacity(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  if (a1 <= 1)
    v1 = 1;
  else
    v1 = a1;
  v2 = 16;
  if (v1 > *MEMORY[0x1E0C85AD8] >> 4)
    v2 = *MEMORY[0x1E0C85AD8] >> 3;
  v3 = (v1 + v2 - 1) / v2 * v2;
  if (v3 >= 0x2000)
    v3 = 0x2000;
  if (v3 <= v1)
    return v1;
  else
    return v3;
}

void sub_18D6174DC(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x18D6174A8);
}

uint64_t _NSLayoutTreeGetFirstHoleAfterGlyphIndexWithLength(uint64_t result, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5)
{
  unint64_t **v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double *v18;
  double v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v7 = (unint64_t **)(*(_QWORD *)(result + 240) + 240);
  v8 = **v7;
  if (((*v7)[7] & 2) == 0)
  {
    v9 = 0;
    goto LABEL_22;
  }
  if (((*v7)[7] & 1) == 0
    || (v10 = result,
        *(_QWORD *)(*(_QWORD *)(result + 240) + 248) = *v7,
        *(_QWORD *)(*(_QWORD *)(result + 240) + 256) = 0,
        *(_QWORD *)(*(_QWORD *)(result + 240) + 264) = 0,
        v8 <= a2))
  {
LABEL_20:
    v9 = v8;
    goto LABEL_21;
  }
  while (1)
  {
    v12 = (_QWORD *)(*(_QWORD *)(result + 240) + 240);
    v13 = *(uint64_t **)(*(_QWORD *)(result + 240) + 248);
    if (v13)
      break;
    a2 = v8;
LABEL_19:
    v12[1] = *v12;
    *(_QWORD *)(*(_QWORD *)(result + 240) + 256) = 0;
    *(_QWORD *)(*(_QWORD *)(result + 240) + 264) = 0;
    if (a2 >= v8)
      goto LABEL_20;
  }
  if (!*((_BYTE *)v13 + 59))
  {
    while (1)
    {
      v14 = v12[2];
      v15 = *v13;
      v16 = 24;
      while (1)
      {
        v17 = *(_QWORD *)(result + 240);
        v18 = *(double **)(*(_QWORD *)(v17 + 248) + v16);
        if (!v18)
          break;
        v19 = *v18;
        v20 = *(_QWORD *)(v17 + 256);
        if (((_BYTE)v18[7] & 1) != 0)
        {
          v21 = *(_QWORD *)&v19 + v20;
          if (a2 < v21)
            break;
        }
        else
        {
          v21 = v20 + *(_QWORD *)&v19;
        }
        *(_QWORD *)(v17 + 256) = v21;
        *(double *)(*(_QWORD *)(result + 240) + 264) = v18[1] + *(double *)(*(_QWORD *)(result + 240) + 264);
        v16 += 8;
        if (v16 == 48)
        {
          v18 = 0;
          v17 = *(_QWORD *)(result + 240);
          break;
        }
      }
      *(_QWORD *)(v17 + 248) = v18;
      v12 = (_QWORD *)(*(_QWORD *)(result + 240) + 240);
      v13 = *(uint64_t **)(*(_QWORD *)(result + 240) + 248);
      if (!v13)
        break;
      if (*((_BYTE *)v13 + 59))
        goto LABEL_27;
    }
    a2 = v15 + v14;
    goto LABEL_19;
  }
LABEL_27:
  v9 = v12[2];
  if (!a5)
  {
LABEL_21:
    v8 = 0;
    goto LABEL_22;
  }
  v8 = 0;
  do
  {
    if (v8 >= a3)
      break;
    v22 = **(_QWORD **)(*(_QWORD *)(v10 + 240) + 248);
    v8 += v22;
    result = _NSLayoutTreeMoveToGlyphIndex(v10, *(_QWORD *)(*(_QWORD *)(v10 + 240) + 256) + v22);
    if (!(_DWORD)result)
      break;
  }
  while (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v10 + 240) + 248) + 24));
LABEL_22:
  if (a4)
    *a4 = v9;
  if (a5)
    *a5 = v8;
  return result;
}

void sub_18D619FE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,int a53,int a54,uint64_t a55,void *a56,uint64_t a57,uint64_t a58,uint64_t a59)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    objc_msgSend(a56, "paragraphGlyphRange");
    NSLog((NSString *)CFSTR("%@: Exception %@ raised during typesetting layout manager %@, glyph range {%lu %lu}. Ignoring..."));
    objc_end_catch();
    JUMPOUT(0x18D619A68);
  }
  _Unwind_Resume(exception_object);
}

unint64_t _NSGlyphTreeCharacterIndexForGlyphAtIndex(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 208) + 56) & 4) != 0)
  {
    if (_NSGlyphTreeMoveToGlyphIndex(a1, a2))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
      if (*(_BYTE *)(v4 + 59) && (v5 = *(_QWORD *)(v4 + 32)) != 0)
      {
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
        v7 = *(unsigned __int8 *)(v4 + 58);
        v8 = v2 - v6;
        if (v7 == 2)
        {
          v9 = *(int *)(v5 + 4 * v8);
        }
        else if (v7 == 1)
        {
          v9 = *(__int16 *)(v5 + 2 * v8);
        }
        else if (v7)
        {
          v9 = 0;
        }
        else
        {
          v9 = *(char *)(v5 + v8);
        }
        return *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224) + v2 - v6 - v9;
      }
      else
      {
        return *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224) + v2 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
      }
    }
    else
    {
      return **(_QWORD **)(*(_QWORD *)(a1 + 240) + 208)
           + v2
           - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 208) + 8);
    }
  }
  return v2;
}

uint64_t _NSGlyphTreeGlyphAtIndex(uint64_t a1, unint64_t a2, _BYTE *a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  char v21;

  result = _NSGlyphTreeMoveToGlyphIndex(a1, a2);
  v14 = result;
  if ((_DWORD)result)
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
    if (*(_BYTE *)(v15 + 59) && (v16 = *(_QWORD *)(v15 + 24)) != 0)
    {
      v17 = a2 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
      switch(*(_BYTE *)(v15 + 57))
      {
        case 0:
          v18 = *(unsigned __int8 *)(v16 + v17);
          if (v18 >= 4)
            v19 = v18;
          else
            v19 = 0xFFFFFF;
          if (v18 <= 0xEF)
            result = v19;
          else
            result = v18 & 3;
          break;
        case 1:
          v20 = *(unsigned __int16 *)(v16 + 2 * v17);
          goto LABEL_19;
        case 2:
          v20 = *(_DWORD *)(v16 + 4 * v17);
          goto LABEL_19;
        case 3:
          v20 = *(_DWORD *)(v16 + 24 * v17);
LABEL_19:
          if (v20 > 0xFF)
            result = v20 >> 8;
          else
            result = ((char)v20 >> 7) & 0xFFFFFF;
          break;
        default:
          goto LABEL_12;
      }
    }
    else
    {
      _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeGlyphAtIndex missing glyphs"), v7, v8, v9, v10, v11, v12, v13, v21);
LABEL_12:
      result = 0;
    }
  }
  if (a3)
    *a3 = v14;
  return result;
}

void sub_18D61B550(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D61B64C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D61B6C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __NSTextLayoutManagerAddTextContainerEntry(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  id v12;

  v4 = a1 + 152;
  if (*(_QWORD *)(a1 + 152))
  {
    v5 = *(_QWORD *)(a1 + 248);
    if (v5 == *(_QWORD *)(a1 + 240))
    {
      v6 = v5 + 8;
      *(_QWORD *)(a1 + 240) = v6;
      v7 = (char *)NSZoneRealloc(0, *(void **)(a1 + 224), 72 * v6);
      *(_QWORD *)(a1 + 224) = v7;
      v5 = *(_QWORD *)(a1 + 248);
    }
    else
    {
      v7 = *(char **)(a1 + 224);
    }
    v8 = &v7[72 * v5];
    *(_OWORD *)v8 = *(_OWORD *)v4;
    v9 = *(_OWORD *)(v4 + 16);
    v10 = *(_OWORD *)(v4 + 32);
    v11 = *(_OWORD *)(v4 + 48);
    *((_QWORD *)v8 + 8) = *(_QWORD *)(v4 + 64);
    *((_OWORD *)v8 + 2) = v10;
    *((_OWORD *)v8 + 3) = v11;
    *((_OWORD *)v8 + 1) = v9;
    ++*(_QWORD *)(a1 + 248);
  }
  v12 = (id)objc_msgSend(*(id *)(a1 + 168), "endLocation");
  *(_OWORD *)v4 = 0u;
  *(_OWORD *)(v4 + 16) = 0u;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_QWORD *)(v4 + 64) = 0;
  *(_QWORD *)(a1 + 152) = a2;
  *(_QWORD *)(a1 + 160) = v12;
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a1 + 248);
  *(_QWORD *)(a1 + 232) = 0;
  return objc_msgSend(a2, "setTextLayoutManager:", a1);
}

void __NSCoreTypesetterHyphenateLine(uint64_t a1, uint64_t a2, int a3, double *a4, double *a5)
{
  uint64_t HyphenatedLineWithOffset;
  const void *v10;
  uint64_t JustifiedLineWithOptions;
  const void *v12;

  if (*(_QWORD *)a1)
  {
    CTLineGetStringRange(*(CTLineRef *)a1);
    HyphenatedLineWithOffset = CTLineCreateHyphenatedLineWithOffset();
    if (!HyphenatedLineWithOffset)
      __NSCoreTypesetterHyphenateLine_cold_1();
    v10 = (const void *)HyphenatedLineWithOffset;
    if (a3)
    {
      if (*(double *)(a1 + 80) > 0.0)
      {
        JustifiedLineWithOptions = CTLineCreateJustifiedLineWithOptions();
        if (JustifiedLineWithOptions)
        {
          v12 = (const void *)JustifiedLineWithOptions;
          CFRelease(v10);
          v10 = v12;
        }
      }
    }
    CFRelease(*(CFTypeRef *)a1);
    *(_QWORD *)a1 = v10;
    if (a4)
      *a4 = CTLineGetTypographicBounds((CTLineRef)v10, 0, 0, 0);
    if (a5)
      *a5 = CTLineGetTrailingWhitespaceWidth(*(CTLineRef *)a1);
  }
}

const char *__NSLoadFramework(void *a1, int a2)
{
  const char *result;
  const char *v4;
  const char *v5;
  const char **i;
  const char *v7;
  char __str[1024];
  uint64_t v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10[0] = 0;
  v10[1] = 0;
  if (a1)
  {
    result = (const char *)objc_msgSend(a1, "UTF8String");
    v4 = result;
    if (!result)
      return result;
  }
  else
  {
    v4 = "UIKit";
  }
  v5 = "/System/Library/Frameworks/";
  if (a2)
    v5 = "/System/Library/PrivateFrameworks/";
  for (i = (const char **)v10; ; ++i)
  {
    if (snprintf(__str, 0x400uLL, "%s%s.framework/%s", v5, v4, v4) <= 1023)
    {
      result = (const char *)dlopen(__str, 258);
      if (result)
        break;
    }
    v7 = *i;
    v5 = v7;
    if (!v7)
      return 0;
  }
  return result;
}

void sub_18D61C920(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  _Block_object_dispose((const void *)(v2 - 224), 8);
  _Block_object_dispose((const void *)(v2 - 176), 8);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D61CAC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18D61CDFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _UIFoundationAssert(void *a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(id, id);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v7 = a1;
  v8 = a2;
  v9 = a4;
  if (_UIFoundationAssert_onceToken == -1)
  {
    if ((a3 & 1) != 0)
      goto LABEL_9;
  }
  else
  {
    dispatch_once(&_UIFoundationAssert_onceToken, &__block_literal_global_5);
    if ((a3 & 1) != 0)
      goto LABEL_9;
  }
  v9[2](v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "length"))
  {
    v20 = (uint64_t)v8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Assertion failure"));
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  if (_UIFoundationAssert_raise)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@"), v10);
  }
  else
  {
    v12 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    v13 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    __UIFoundationWriteLog(v12, OS_LOG_TYPE_DEBUG, v13, v14, v15, v16, v17, v18, v20);
  }

LABEL_9:
  return a3 ^ 1u;
}

void sub_18D61CFEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double __NSTextLayoutManagerClearTextContainerEntry(uint64_t a1)
{
  double result;

  objc_msgSend(*(id *)a1, "setTextLayoutManager:", 0);

  *(_QWORD *)(a1 + 64) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

void sub_18D61D1D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D61E5E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

double NSTCIntersectionRect(double result, double a2, double a3, double a4, double a5, double a6, double a7)
{
  double v7;
  double v8;
  double v9;
  double v10;

  if (a3 <= 0.0)
    v7 = -0.0;
  else
    v7 = a3;
  v8 = result + v7;
  if (a7 <= 0.0)
    v9 = -0.0;
  else
    v9 = a7;
  v10 = a5 + v9;
  if (result < a5 || v8 > v10)
  {
    if (result > a5 || v8 < v10)
    {
      if (result < a5)
        return a5;
    }
    else
    {
      return a5;
    }
  }
  return result;
}

uint64_t _NSGlyphTreeCharacterRangeForGlyphRange(uint64_t a1, unint64_t a2, uint64_t a3, int a4, int a5, unint64_t *a6)
{
  uint64_t v7;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t *v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  int v40;
  int v41;
  unsigned int v42;
  unsigned int v43;
  BOOL v44;
  unsigned int v45;
  int *v46;
  uint64_t v47;
  uint64_t *v48;
  unint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  char v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  char v76;
  uint64_t v77;
  char v78;
  char v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unsigned int v83;
  int v84;
  int v85;
  unsigned int v86;
  unint64_t v87;
  uint64_t *v88;
  char v90;
  unint64_t v91;
  unint64_t *v92;
  char v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v97;
  uint64_t v98;

  v7 = a3;
  v10 = 0;
  v11 = 0;
  if (a2 && a3)
  {
    if (_NSGlyphTreeMoveToGlyphIndex(a1, a2))
    {
      v19 = &OBJC_IVAR___NSExtraLMData__glyphTree;
      v11 = a2;
      v97 = v7;
LABEL_5:
      v20 = *(_QWORD *)(a1 + 240);
      v21 = *v19;
      v22 = (_QWORD *)(v20 + v21);
      v23 = *(_QWORD *)(v20 + v21 + 8);
      if (*(_BYTE *)(v23 + 59))
      {
        v24 = *(_QWORD *)(v23 + 32);
        if (v24)
        {
          v25 = v22[3];
          v26 = *(unsigned __int8 *)(v23 + 58);
          v27 = v11 - v25;
          if (v26 == 2)
          {
            v28 = *(int *)(v24 + 4 * v27);
          }
          else if (v26 == 1)
          {
            v28 = *(__int16 *)(v24 + 2 * v27);
          }
          else if (*(_BYTE *)(v23 + 58))
          {
            v28 = 0;
          }
          else
          {
            v28 = *(char *)(v24 + v27);
          }
          v29 = 0;
          v10 = v22[2] + v11 - v25 - v28;
          if (v11 >= v25)
            v30 = v22[3];
          else
            v30 = v11;
          v31 = -v28;
          v13 = v24 + v11 - v25 - 1;
          v14 = v24 - 2 * v25 + 2 * v11 - 2;
          v32 = v24 - 4 * v25 + 4 * v11 - 4;
          while (1)
          {
            v15 = v11 + v29;
            if (v11 + v29 <= v25)
              break;
            if (v26 == 2)
            {
              v33 = *(int *)(v32 + 4 * v29);
            }
            else if (v26 == 1)
            {
              v33 = *(__int16 *)(v14 + 2 * v29);
            }
            else if (*(_BYTE *)(v23 + 58))
            {
              v33 = 0;
            }
            else
            {
              v33 = *(char *)(v13 + v29);
            }
            --v29;
            v15 = v31 + v33;
            if (v15 != v29)
            {
              v94 = v10;
              v34 = a6;
              v35 = v11 + v29 + 1;
              goto LABEL_32;
            }
          }
          v11 = v30;
          if (!v30)
            goto LABEL_68;
          goto LABEL_31;
        }
      }
      v10 = v22[2] + v11 - v22[3];
      if (v11)
      {
LABEL_31:
        v94 = v10;
        v34 = a6;
        v35 = v11;
LABEL_32:
        if (*(_BYTE *)(v23 + 59))
        {
          v36 = 24 * v35;
          v11 = v35;
          do
          {
            v37 = *(_QWORD *)(v23 + 24);
            if (!v37)
              break;
            v38 = v22[3];
            switch(*(_BYTE *)(v23 + 57))
            {
              case 0:
                v39 = *(unsigned __int8 *)(v37 - v38 + v11);
                if (v39 >= 4)
                  v40 = v39;
                else
                  v40 = 0xFFFFFF;
                if (v39 <= 0xEF)
                  v41 = v40;
                else
                  v41 = v39 & 3;
                break;
              case 1:
                v42 = *(unsigned __int16 *)(v37 - 2 * v38 + 2 * v11);
                v43 = v42 >> 8;
                v44 = v42 > 0xFF;
                v41 = ((char)v42 >> 7) & 0xFFFFFF;
                if (v44)
                  v41 = v43;
                break;
              case 2:
                v45 = *(_DWORD *)(v37 - 4 * v38 + 4 * v11);
                goto LABEL_48;
              case 3:
                v45 = *(_DWORD *)(v37 - 24 * v38 + v36);
LABEL_48:
                if (v45 > 0xFF)
                  v41 = v45 >> 8;
                else
                  v41 = ((char)v45 >> 7) & 0xFFFFFF;
                break;
              default:
                v41 = 0;
                break;
            }
            if (!v11 || v41)
            {
              if (v41 == 0xFFFFFF)
                goto LABEL_66;
              a6 = v34;
              if (!v41)
              {
                v11 = v35;
                goto LABEL_67;
              }
              v7 = v97;
              v10 = v94;
              if (v11 < v35)
                goto LABEL_5;
              goto LABEL_68;
            }
            if (--v11 >= *(_QWORD *)(v20 + (int)v21 + 24))
            {
              v47 = (int)v21;
            }
            else
            {
              v46 = v19;
              if (!_NSGlyphTreeMoveToGlyphIndex(a1, v11))
                goto LABEL_66;
              v19 = v46;
              LODWORD(v21) = *v46;
              v20 = *(_QWORD *)(a1 + 240);
              v47 = *v46;
            }
            v22 = (_QWORD *)(v20 + v47);
            v23 = v22[1];
            v36 -= 24;
          }
          while (*(_BYTE *)(v23 + 59));
        }
        if (a4)
          _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeCharacterRangeForGlyphRange missing glyphs 1"), v13, v14, v15, v16, (uint64_t)v19, v17, v18, v90);
LABEL_66:
        v11 = v35;
        a6 = v34;
LABEL_67:
        v7 = v97;
        v10 = v94;
      }
    }
    else
    {
      v48 = *(uint64_t **)(*(_QWORD *)(a1 + 240) + 208);
      v10 = *v48;
      v11 = v48[1];
    }
  }
LABEL_68:
  v49 = a2 + v7;
  if (!(a2 + v7))
    goto LABEL_134;
  v50 = *(uint64_t **)(*(_QWORD *)(a1 + 240) + 208);
  v51 = *v50;
  if (!*v50)
  {
    if (!a6)
      return v10;
    goto LABEL_148;
  }
  v52 = v50[1];
  if (!v52)
  {
LABEL_134:
    v51 = 0;
    if (!a6)
      return v10;
    goto LABEL_148;
  }
  v91 = a2;
  v92 = a6;
  if (v49 >= v52)
    goto LABEL_139;
  v53 = v49 - 1;
  if (!_NSGlyphTreeMoveToGlyphIndex(a1, v49 - 1))
  {
    v88 = *(uint64_t **)(*(_QWORD *)(a1 + 240) + 208);
    v51 = *v88;
    v52 = v88[1];
LABEL_139:
    v95 = v51 - 1;
    v80 = v52 - 1;
    goto LABEL_140;
  }
  v54 = a5;
  if (v7)
    v54 = 0;
  v93 = v54;
  v98 = v7;
  while (1)
  {
    v55 = *(_QWORD **)(a1 + 240);
    v56 = v55[27];
    if (*(_BYTE *)(v56 + 59) && (v57 = *(_QWORD *)(v56 + 32)) != 0)
    {
      v58 = v55[29];
      v59 = *(unsigned __int8 *)(v56 + 58);
      v60 = v53 - v58;
      if (v59 == 2)
      {
        v61 = *(int *)(v57 + 4 * v60);
      }
      else if (v59 == 1)
      {
        v61 = *(__int16 *)(v57 + 2 * v60);
      }
      else
      {
        v61 = *(_BYTE *)(v56 + 58) ? 0 : *(char *)(v57 + v60);
      }
      v63 = 0;
      v64 = v55[28];
      v65 = v64 + v53 - v58 - v61;
      v66 = *(_QWORD *)(v56 + 8) + v58;
      v67 = v66 <= v53 + 1 ? v53 + 1 : *(_QWORD *)(v56 + 8) + v58;
      v68 = v67 - 1;
      v69 = v57 + v60 + 1;
      v70 = v57 - 2 * v58 + 2 * v53 + 2;
      v71 = v57 - 4 * v58 + 4 * v53 + 4;
      do
      {
        if (v53 + v63 + 1 >= v66)
        {
          v95 = v64 + *(_QWORD *)v56 - 1;
          v53 = v68;
          goto LABEL_102;
        }
        if (v59 == 2)
        {
          v72 = *(int *)(v71 + 4 * v63);
        }
        else if (v59 == 1)
        {
          v72 = *(__int16 *)(v70 + 2 * v63);
        }
        else if (*(_BYTE *)(v56 + 58))
        {
          v72 = 0;
        }
        else
        {
          v72 = *(char *)(v69 + v63);
        }
        ++v63;
        v73 = v61 - v72 + v63;
      }
      while (v73 < 1);
      v74 = v53 + v64;
      v53 = v53 + v63 - 1;
      v62 = ~v58 + v74 - v72 + v63;
      if (v73 == 1)
        v62 = v65;
    }
    else
    {
      v58 = v55[29];
      v62 = v55[28] + v53 - v58;
    }
    v95 = v62;
LABEL_102:
    v75 = v53 + 1;
    v76 = v93;
    if (v53 + 1 >= *(_QWORD *)(v55[26] + 8))
      v76 = 1;
    if ((v76 & 1) != 0)
      break;
    v77 = 24 * v53 + 24;
    v78 = 1;
    while (2)
    {
      v79 = v78;
      v80 = v53;
      v81 = v75;
      if (v75 >= *(_QWORD *)(v56 + 8) + v58)
      {
        if (!_NSGlyphTreeMoveToGlyphIndex(a1, v75))
          break;
        v55 = *(_QWORD **)(a1 + 240);
        v56 = v55[27];
      }
      if (*(_BYTE *)(v56 + 59))
      {
        v82 = *(_QWORD *)(v56 + 24);
        if (v82)
        {
          v58 = v55[29];
          switch(*(_BYTE *)(v56 + 57))
          {
            case 0:
              v83 = *(unsigned __int8 *)(v82 - v58 + v81);
              if (v83 >= 4)
                v84 = v83;
              else
                v84 = 0xFFFFFF;
              if (v83 <= 0xEF)
                v85 = v84;
              else
                v85 = v83 & 3;
              goto LABEL_125;
            case 1:
              v86 = *(unsigned __int16 *)(v82 - 2 * v58 + 2 * v81);
              goto LABEL_121;
            case 2:
              v86 = *(_DWORD *)(v82 - 4 * v58 + 4 * v81);
              goto LABEL_121;
            case 3:
              v86 = *(_DWORD *)(v82 - 24 * v58 + v77);
LABEL_121:
              if (v86 > 0xFF)
              {
                v85 = v86 >> 8;
              }
              else
              {
                if ((v86 & 0x80) != 0)
                  break;
LABEL_123:
                v85 = 0;
              }
LABEL_125:
              v78 = 0;
              v75 = v81 + 1;
              v77 += 24;
              ++v53;
              if (v85)
                break;
              continue;
            default:
              goto LABEL_123;
          }
        }
      }
      break;
    }
    if ((v79 & 1) != 0)
      goto LABEL_151;
    v53 = v81 - 1;
    v87 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
    if (v81 - 1 < v87 || v53 >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 216) + 8) + v87)
    {
      v7 = v98;
      if (v79 & 1 | !_NSGlyphTreeMoveToGlyphIndex(a1, v81 - 1))
        goto LABEL_140;
    }
    else
    {
      v7 = v98;
      if ((v79 & 1) != 0)
      {
        v80 = v81 - 1;
        goto LABEL_140;
      }
    }
  }
  v80 = v53;
LABEL_151:
  v7 = v98;
LABEL_140:
  if (v7)
  {
    v51 = v80 - v11 + 1;
  }
  else
  {
    v10 = v95 + 1;
    if (a5)
    {
      v51 = 0;
      if (v91 >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 208) + 8))
        v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 208) + 8);
      else
        v11 = v91;
    }
    else
    {
      v51 = 0;
      v11 = v80 + 1;
    }
  }
  a6 = v92;
  if (v92)
  {
LABEL_148:
    *a6 = v11;
    a6[1] = v51;
  }
  return v10;
}

void sub_18D61F308(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D61FB94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D61FF7C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void ___createTokenizerLanguageSet_block_invoke()
{
  if (!__tokenizerLanguageSet)
    __tokenizerLanguageSet = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("zh"), CFSTR("ja"), 0);
}

double _NSLayoutTreeLineFragmentUsedRectForGlyphAtIndex(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  double v27;
  unint64_t v29;
  unint64_t v30;

  if (!_NSLayoutTreeMoveToGlyphIndex(a1, a2))
  {
    v27 = *MEMORY[0x1E0CB3438];
    _NSLayoutTreeLogDebug((NSString *)CFSTR("!!! _NSLayoutTreeLineFragmentUsedRectForGlyphAtIndex invalid glyph index %lu"), v6, v7, v8, v9, v10, v11, v12, a2);
    v25 = 0;
    v26 = 0x7FFFFFFFFFFFFFFFLL;
    if (!a3)
      return v27;
    goto LABEL_13;
  }
  v14 = *(unint64_t **)(*(_QWORD *)(a1 + 240) + 248);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256);
  v15 = (unint64_t *)v14[3];
  v16 = *v14;
  if (!v15)
  {
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 336);
    v26 = v13 + (a2 - v13) / v29 * v29;
    v30 = v16 + v13;
    v25 = v30 - v26;
    if (v26 + v29 <= v30)
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 336);
    v27 = 0.0;
    if (!a3)
      return v27;
    goto LABEL_13;
  }
  v17 = 0;
  v18 = a2 - v13;
  v21 = *v15;
  v19 = v15 + 4;
  v20 = v21;
  v22 = v21 - 1;
  while (1)
  {
    v23 = (v17 + v22) >> 1;
    v24 = v19[10 * v23] & 0x8FFFFFFFFFFFFFFFLL;
    if (v24 <= v18)
      break;
    v22 = v23 - 1;
LABEL_8:
    if (v22 < v17)
      goto LABEL_9;
  }
  v17 = v23 + 1;
  if (v23 + 1 >= v20)
    goto LABEL_10;
  if ((v19[10 * v17] & 0x8FFFFFFFFFFFFFFFLL) <= v18)
    goto LABEL_8;
LABEL_9:
  v16 = v19[10 * v23 + 10] & 0x8FFFFFFFFFFFFFFFLL;
LABEL_10:
  v25 = v16 - v24;
  v26 = v24 + v13;
  v27 = *(double *)&v19[10 * v23 + 2];
  if (a3)
  {
LABEL_13:
    *a3 = v26;
    a3[1] = v25;
  }
  return v27;
}

double NSLMUnionRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  _BOOL4 v8;

  v8 = a7 <= 0.0;
  if (a8 > 0.0)
    v8 = 0;
  if (a3 > 0.0 || a4 > 0.0)
  {
    if (v8)
    {
      return a1;
    }
    else if (a1 < a5)
    {
      return a1;
    }
  }
  else if (v8)
  {
    return *MEMORY[0x1E0CB3438];
  }
  return a5;
}

_QWORD *_getFirstUnlaid(_QWORD *result, _QWORD *a2, _QWORD *a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  v5 = result;
  v6 = result[30];
  v7 = *(_QWORD *)(v6 + 208);
  if (!v7 || (v8 = *(_QWORD *)(v6 + 240)) == 0)
  {
    result[26] = 0;
    result[27] = 0;
    goto LABEL_9;
  }
  v9 = *(_BYTE *)(v8 + 56);
  v10 = result[27];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = *(_BYTE *)(v7 + 56);
    v13 = 0;
    v14 = 0;
    v12 = 0;
    if ((v9 & 1) != 0 && (v11 & 1) != 0)
    {
      _NSGlyphTreeGetFirstHoleAfterGlyphIndex((uint64_t)result, 0, 0, (uint64_t *)&v14, 0, &v13);
      _NSLayoutTreeGetFirstHoleAfterGlyphIndex((uint64_t)v5, 0, &v12);
      result = (_QWORD *)_NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)v5, v12);
      v10 = v14;
      if (v14 > (unint64_t)result)
      {
        v5[27] = result;
        v10 = (unint64_t)result;
        goto LABEL_20;
      }
LABEL_19:
      v5[26] = v13;
      v5[27] = v10;
      goto LABEL_20;
    }
    if ((v11 & 1) != 0)
    {
      result = (_QWORD *)_NSGlyphTreeGetFirstHoleAfterGlyphIndex((uint64_t)result, 0, 0, (uint64_t *)&v14, 0, &v13);
      v10 = v14;
      goto LABEL_19;
    }
    if ((v9 & 1) != 0)
    {
      _NSLayoutTreeGetFirstHoleAfterGlyphIndex((uint64_t)result, 0, &v12);
      result = (_QWORD *)_NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)v5, v12);
      v10 = (unint64_t)result;
      v5[27] = result;
    }
    else
    {
      result = (_QWORD *)result[1];
      if (result)
      {
        result = (_QWORD *)objc_msgSend(result, "length");
        v10 = (unint64_t)result;
      }
      else
      {
        v10 = 0;
      }
      v5[27] = v10;
    }
  }
LABEL_20:
  if (a3 && v5[26] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((v9 & 1) != 0)
    {
      result = (_QWORD *)objc_msgSend(v5, "_glyphIndexForCharacterIndex:startOfRange:okToFillHoles:", v10, 1, 0);
      v5[26] = result;
    }
    else
    {
      v14 = 0;
      result = (_QWORD *)_NSGlyphTreeGetFirstHoleAfterGlyphIndex((uint64_t)v5, 0, 0, 0, 0, &v14);
      v5[26] = v14;
    }
  }
LABEL_9:
  if (a2)
    *a2 = v5[27];
  if (a3)
    *a3 = v5[26];
  return result;
}

uint64_t _NSGlyphTreeGetFirstHoleAfterGlyphIndex(uint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4, unint64_t *a5, unint64_t *a6)
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;

  v9 = a2;
  v10 = result;
  v11 = *(_QWORD *)(result + 240) + 208;
  v12 = *(uint64_t **)v11;
  if ((*(_BYTE *)(*(_QWORD *)v11 + 56) & 2) == 0)
  {
    result = _NSGlyphTreeCharacterIndexForGlyphAtIndex(result, a2);
    v13 = result;
    v14 = **(_QWORD **)(*(_QWORD *)(v10 + 240) + 208) - result;
    goto LABEL_21;
  }
  v13 = *v12;
  v15 = v12[1];
  if ((*(_BYTE *)(*(_QWORD *)v11 + 56) & 1) == 0
    || (*(_QWORD *)(*(_QWORD *)(result + 240) + 216) = v12,
        *(_QWORD *)(*(_QWORD *)(result + 240) + 232) = 0,
        *(_QWORD *)(*(_QWORD *)(result + 240) + 224) = 0,
        v15 <= a2))
  {
LABEL_20:
    v14 = 0;
    v9 = v15;
    goto LABEL_21;
  }
  while (1)
  {
    v17 = *(_QWORD **)(result + 240);
    v18 = v17 + 26;
    v19 = v17[27];
    if (v19)
      break;
    v9 = v15;
LABEL_19:
    v18[1] = *v18;
    *(_QWORD *)(*(_QWORD *)(result + 240) + 232) = 0;
    *(_QWORD *)(*(_QWORD *)(result + 240) + 224) = 0;
    if (v9 >= v15)
      goto LABEL_20;
  }
  if (!*(_BYTE *)(v19 + 59))
  {
    while (1)
    {
      v20 = v18[3];
      v21 = *(_QWORD *)(v19 + 8);
      v22 = 24;
      while (1)
      {
        v23 = *(_QWORD **)(result + 240);
        v24 = *(_QWORD *)(v23[27] + v22);
        if (!v24)
          break;
        if ((*(_BYTE *)(v24 + 56) & 1) != 0)
        {
          v25 = *(_QWORD *)(v24 + 8);
          if (v9 < v25 + v23[29])
            break;
        }
        else
        {
          v25 = *(_QWORD *)(v24 + 8);
        }
        v23[28] += *(_QWORD *)v24;
        *(_QWORD *)(*(_QWORD *)(result + 240) + 232) += v25;
        v22 += 8;
        if (v22 == 48)
        {
          v24 = 0;
          v23 = *(_QWORD **)(result + 240);
          break;
        }
      }
      v23[27] = v24;
      v17 = *(_QWORD **)(result + 240);
      v18 = v17 + 26;
      v19 = v17[27];
      if (!v19)
        break;
      if (*(_BYTE *)(v19 + 59))
        goto LABEL_28;
    }
    v9 = v21 + v20;
    goto LABEL_19;
  }
LABEL_28:
  v14 = 0;
  v13 = v18[2];
  v9 = v18[3];
  if (a5)
  {
    if (a3)
    {
      v14 = *(_QWORD *)v19;
      result = _NSGlyphTreeMoveToCharacterIndex(result, v17[28] + *(_QWORD *)v19);
      if ((_DWORD)result)
      {
        do
        {
          v26 = *(_QWORD *)(v10 + 240);
          v27 = *(_QWORD *)(v26 + 216);
          if (*(_BYTE *)(v27 + 59))
          {
            if (*(_QWORD *)(v27 + 24))
              v28 = 1;
            else
              v28 = v14 >= a3;
            if (v28)
              break;
          }
          else if (v14 >= a3)
          {
            break;
          }
          v14 += *(_QWORD *)v27;
          result = _NSGlyphTreeMoveToCharacterIndex(v10, *(_QWORD *)(v26 + 224) + *(_QWORD *)v27);
        }
        while ((result & 1) != 0);
      }
    }
  }
LABEL_21:
  if (a4)
    *a4 = v13;
  if (a5)
    *a5 = v14;
  if (a6)
    *a6 = v9;
  return result;
}

void sub_18D622B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t _NSLayoutTreeGetFirstHoleAfterGlyphIndex(uint64_t result, unint64_t a2, unint64_t *a3)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double *v13;
  double v14;
  uint64_t v15;
  unint64_t v16;

  v3 = *(_QWORD *)(result + 240) + 240;
  v4 = *(unint64_t **)v3;
  v5 = a2;
  if ((*(_BYTE *)(*(_QWORD *)v3 + 56) & 2) != 0)
  {
    v5 = *v4;
    if ((*(_BYTE *)(*(_QWORD *)v3 + 56) & 1) != 0)
    {
      *(_QWORD *)(*(_QWORD *)(result + 240) + 248) = v4;
      *(_QWORD *)(*(_QWORD *)(result + 240) + 256) = 0;
      *(_QWORD *)(*(_QWORD *)(result + 240) + 264) = 0;
      if (v5 > a2)
      {
        v6 = a2;
        while (1)
        {
          v7 = (_QWORD *)(*(_QWORD *)(result + 240) + 240);
          v8 = *(uint64_t **)(*(_QWORD *)(result + 240) + 248);
          if (v8)
            break;
          v6 = v5;
LABEL_17:
          v7[1] = *v7;
          *(_QWORD *)(*(_QWORD *)(result + 240) + 256) = 0;
          *(_QWORD *)(*(_QWORD *)(result + 240) + 264) = 0;
          if (v6 >= v5)
            goto LABEL_20;
        }
        while (1)
        {
          v9 = v7[2];
          if (*((_BYTE *)v8 + 59))
            break;
          v10 = *v8;
          v11 = 24;
          while (1)
          {
            v12 = *(_QWORD *)(result + 240);
            v13 = *(double **)(*(_QWORD *)(v12 + 248) + v11);
            if (!v13)
              break;
            v14 = *v13;
            v15 = *(_QWORD *)(v12 + 256);
            if (((_BYTE)v13[7] & 1) != 0)
            {
              v16 = *(_QWORD *)&v14 + v15;
              if (v6 < v16)
                break;
            }
            else
            {
              v16 = v15 + *(_QWORD *)&v14;
            }
            *(_QWORD *)(v12 + 256) = v16;
            *(double *)(*(_QWORD *)(result + 240) + 264) = v13[1] + *(double *)(*(_QWORD *)(result + 240) + 264);
            v11 += 8;
            if (v11 == 48)
            {
              v13 = 0;
              v12 = *(_QWORD *)(result + 240);
              break;
            }
          }
          *(_QWORD *)(v12 + 248) = v13;
          v7 = (_QWORD *)(*(_QWORD *)(result + 240) + 240);
          v8 = *(uint64_t **)(*(_QWORD *)(result + 240) + 248);
          if (!v8)
          {
            v6 = v10 + v9;
            goto LABEL_17;
          }
        }
        v5 = v7[2];
      }
    }
  }
LABEL_20:
  if (a3)
  {
    if (v5 <= a2)
      v5 = a2;
    *a3 = v5;
  }
  return result;
}

double _NSLayoutTreeLineFragmentRectForGlyphAtIndex(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  double v27;
  unint64_t v29;
  unint64_t v30;

  if (!_NSLayoutTreeMoveToGlyphIndex(a1, a2))
  {
    v27 = *MEMORY[0x1E0CB3438];
    _NSLayoutTreeLogDebug((NSString *)CFSTR("!!! _NSLayoutTreeLineFragmentRectForGlyphAtIndex invalid glyph index %lu"), v6, v7, v8, v9, v10, v11, v12, a2);
    v25 = 0;
    v26 = 0x7FFFFFFFFFFFFFFFLL;
    if (!a3)
      return v27;
    goto LABEL_13;
  }
  v14 = *(unint64_t **)(*(_QWORD *)(a1 + 240) + 248);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256);
  v15 = (unint64_t *)v14[3];
  v16 = *v14;
  if (!v15)
  {
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 336);
    v26 = v13 + (a2 - v13) / v29 * v29;
    v30 = v16 + v13;
    v25 = v30 - v26;
    if (v26 + v29 <= v30)
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 336);
    v27 = 0.0;
    if (!a3)
      return v27;
    goto LABEL_13;
  }
  v17 = 0;
  v18 = a2 - v13;
  v21 = *v15;
  v19 = v15 + 4;
  v20 = v21;
  v22 = v21 - 1;
  while (1)
  {
    v23 = (v17 + v22) >> 1;
    v24 = v19[10 * v23] & 0x8FFFFFFFFFFFFFFFLL;
    if (v24 <= v18)
      break;
    v22 = v23 - 1;
LABEL_8:
    if (v22 < v17)
      goto LABEL_9;
  }
  v17 = v23 + 1;
  if (v23 + 1 >= v20)
    goto LABEL_10;
  if ((v19[10 * v17] & 0x8FFFFFFFFFFFFFFFLL) <= v18)
    goto LABEL_8;
LABEL_9:
  v16 = v19[10 * v23 + 10] & 0x8FFFFFFFFFFFFFFFLL;
LABEL_10:
  v25 = v16 - v24;
  v26 = v24 + v13;
  v27 = *(double *)&v19[10 * v23 + 6];
  if (a3)
  {
LABEL_13:
    *a3 = v26;
    a3[1] = v25;
  }
  return v27;
}

uint64_t _NSGlyphTreePrepareToInvalidateGlyphsForCharacterRange(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_QWORD *)(*(_QWORD *)(result + 240) + 496) = a4;
  return result;
}

void _NSGlyphTreeInvalidateGlyphsForCharacterRange(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int *v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  uint64_t v26;
  unint64_t v27;
  int64x2_t *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unsigned __int8 *SubNode;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  __int8 *v43;
  _BYTE *v44;
  unint64_t v45;
  uint64_t v46;
  _BYTE *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int64x2_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int64x2_t *v69;
  _BYTE *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  __int8 *v78;
  _BYTE *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  unsigned __int8 *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  _BYTE *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD *v111;
  uint64_t v112;
  int64x2_t *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  __CFString *v120;
  uint64_t v121;
  uint64_t v122;
  _BYTE *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  _BYTE *v127;
  int64x2_t *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  _BYTE *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  char v140;
  uint64_t v141;
  uint64_t v142;
  int v143;

  if (a4)
    v9 = 0;
  else
    v9 = a5;
  v143 = v9;
  if (!(a3 | a4))
    return;
  v10 = a4;
  v11 = a2;
  v12 = a1;
  v13 = &OBJC_IVAR___NSExtraLMData__glyphTree;
  v14 = *(uint64_t **)(*(_QWORD *)(a1 + 240) + 208);
  if (v143)
  {
    if ((v14[7] & 0x24) == 0)
      return;
  }
  v137 = v14[1];
  v138 = *v14;
  v15 = a2 + a3;
  v16 = a3 + a4;
  v135 = _NSGlyphTreeGlyphIndexForCharacterAtIndex(a1, a2);
  v136 = v16;
  v139 = v10;
  if (v11 < v15)
  {
    v140 = 0;
    v142 = v12;
    while (1)
    {
      v24 = v16 - (v15 - v11);
      if (_NSGlyphTreeMoveToCharacterIndex(v12, v11))
      {
        v25 = v13;
        v26 = *(_QWORD *)(v12 + 240) + *v13;
        v28 = *(int64x2_t **)(v26 + 8);
        v27 = *(_QWORD *)(v26 + 16);
        v29 = v28->i64[0];
        v30 = v28->i64[0] + v27;
        v31 = v30 - v11;
        if (v15 <= v30)
          v31 = v15 - v11;
        else
          v24 = v16 - (v30 - v11);
        if (v143 && (v28[3].i8[8] & 0x24) == 0)
          goto LABEL_34;
        if (v28[3].i8[11] && v28[1].i64[1])
        {
          if (v11 <= v27)
          {
            if (v11)
            {
              v45 = v31 + v11;
              v46 = v30 - v45;
              if (v30 <= v45)
              {
                v12 = v142;
                _NSGlyphTreeDeleteCurrentNode(v142, v17, v46, v19, v20, v21, v22, v23);
                v13 = v25;
                if (!v16)
                  goto LABEL_62;
              }
              else
              {
                _NSGlyphNodeTruncate(v28, v45 - v27, v46);
                v13 = v25;
                v12 = v142;
                if (!v16)
                  goto LABEL_62;
              }
              if (!_NSGlyphTreeMoveToCharacterIndex(v12, v11 - 1))
              {
                _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeInvalidateGlyphsForCharacterRange found invalid char index"), v62, v63, v64, v65, v66, v67, v68, v135);
LABEL_62:
                v140 = 1;
                goto LABEL_63;
              }
              v69 = *(int64x2_t **)(*(_QWORD *)(v12 + 240) + *v13 + 8);
              if (!v69[3].i8[11])
              {
                v77 = 0;
                v78 = &v69[1].i8[8];
                v141 = v69->i64[0];
                do
                {
                  v79 = *(_BYTE **)&v78[v77];
                  if (v79)
                  {
                    _NSGlyphNodeFree(v79);
                    *(_QWORD *)&v78[v77] = 0;
                  }
                  v77 += 8;
                }
                while (v77 != 24);
                v13 = v25;
                v80 = v141;
                v12 = v142;
                goto LABEL_66;
              }
              if (!v69[1].i64[1])
              {
                v80 = v69->i64[0];
LABEL_66:
                v81 = v80 + v16;
                v140 = 1;
                v69[3].i8[11] = 1;
                v69[3].i8[8] = v81 != 0;
                v69->i64[0] = v81;
                v69->i64[1] = v81;
                _NSGlyphNodeSetCapacity((uint64_t)v69, 0);
                _NSGlyphNodeSetInvariants(v69);
                goto LABEL_63;
              }
              v70 = malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
              v70[59] = 1;
              *(_QWORD *)v70 = v16;
              *((_QWORD *)v70 + 1) = v16;
              v70[56] = 1;
              _NSGlyphTreeInsertNodeAfterCurrentNode(v12, (uint64_t)v70, v71, v72, v73, v74, v75, v76);
              goto LABEL_51;
            }
            v54 = v30 - v31;
            if (v30 <= v31)
            {
              v13 = v25;
              if (!v16)
              {
                v12 = v142;
                _NSGlyphTreeDeleteCurrentNode(v142, v17, v54, v19, v20, v21, v22, v23);
                goto LABEL_62;
              }
              v28[3].i8[11] = 1;
              v140 = 1;
              v28[3].i8[8] = 1;
              v28->i64[0] = v16;
              v28->i64[1] = v16;
              _NSGlyphNodeSetCapacity((uint64_t)v28, 0);
              _NSGlyphNodeSetInvariants(v28);
            }
            else
            {
              _NSGlyphNodeTruncate(v28, v31 - v27, v54);
              v13 = v25;
              if (v16)
              {
                v55 = (int64x2_t *)malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
                v55[3].i8[11] = 1;
                v55->i64[0] = v16;
                v55->i64[1] = v16;
                v55[3].i8[8] = 1;
                v12 = v142;
                _NSGlyphTreeInsertNodeBeforeCurrentNode(v142, v55, v56, v57, v58, v59, v60, v61);
LABEL_51:
                v140 = 1;
                goto LABEL_63;
              }
              v140 = 1;
            }
          }
          else
          {
            v32 = v31 + v11;
            if (v30 <= v32)
            {
              v13 = v25;
            }
            else
            {
              SubNode = _NSGlyphNodeCreateSubNode((uint64_t)v28, v32 - v27, v30 - v32);
              _NSGlyphTreeInsertNodeAfterCurrentNode(v142, (uint64_t)SubNode, v34, v35, v36, v37, v38, v39);
              v13 = v25;
              v40 = *(_QWORD *)(v142 + 240) + *v25;
              v28 = *(int64x2_t **)(v40 + 8);
              v27 = *(_QWORD *)(v40 + 16);
            }
            _NSGlyphNodeTruncate(v28, 0, v11 - v27);
            v140 = 1;
            if (v16)
            {
              v47 = malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
              v47[59] = 1;
              *(_QWORD *)v47 = v16;
              *((_QWORD *)v47 + 1) = v16;
              v47[56] = 1;
              v12 = v142;
              _NSGlyphTreeInsertNodeAfterCurrentNode(v142, (uint64_t)v47, v48, v49, v50, v51, v52, v53);
              goto LABEL_63;
            }
          }
          goto LABEL_35;
        }
        if (!v24)
        {
          v140 = 1;
LABEL_34:
          v13 = v25;
LABEL_35:
          v12 = v142;
          goto LABEL_63;
        }
        if (v24 > 0 || v29 > -v24)
        {
          if (!v28[3].i8[11])
          {
            v42 = 0;
            v43 = &v28[1].i8[8];
            do
            {
              v44 = *(_BYTE **)&v43[v42];
              if (v44)
              {
                _NSGlyphNodeFree(v44);
                *(_QWORD *)&v43[v42] = 0;
              }
              v42 += 8;
            }
            while (v42 != 24);
          }
          v140 = 1;
          v28[3].i8[11] = 1;
          v28[3].i8[8] = v24 + v29 != 0;
          v28->i64[0] = v24 + v29;
          v28->i64[1] = v24 + v29;
          _NSGlyphNodeSetCapacity((uint64_t)v28, 0);
          _NSGlyphNodeSetInvariants(v28);
          goto LABEL_34;
        }
        v12 = v142;
        _NSGlyphTreeDeleteCurrentNode(v142, v17, v18, v19, v20, v21, v22, v23);
        v140 = 1;
        v13 = v25;
      }
      else
      {
        _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeInvalidateGlyphsForCharacterRange invalid char range 1"), v17, v18, v19, v20, v21, v22, v23, v135);
      }
LABEL_63:
      v11 += v16;
      v15 += v24;
      v10 -= v24;
      v16 = 0;
      if (v11 >= v15)
        goto LABEL_68;
    }
  }
  v140 = 0;
LABEL_68:
  if (v10 < 1)
  {
    v93 = v136;
    v92 = v137;
    v89 = v138;
    if (v10 < 0)
      _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeInvalidateGlyphsForCharacterRange invalid change in length"), v17, v18, v19, v20, v21, v22, v23, v135);
    goto LABEL_108;
  }
  if (v11)
  {
    v89 = v138;
    if (_NSGlyphTreeMoveToCharacterIndex(v12, v11 - 1))
    {
      v90 = *(_QWORD *)(v12 + 240) + *v13;
      v91 = *(_QWORD *)(v90 + 8);
      v93 = v136;
      v92 = v137;
      if (*(_BYTE *)(v91 + 59))
      {
        if (*(_QWORD *)(v91 + 24))
        {
          v94 = *(_QWORD *)(v90 + 16);
          v95 = *(_QWORD *)v91 + v94;
          if (v95 > v11)
          {
            v96 = _NSGlyphNodeCreateSubNode(v91, v11 - v94, v95 - v11);
            _NSGlyphTreeInsertNodeAfterCurrentNode(v12, (uint64_t)v96, v97, v98, v99, v100, v101, v102);
            v103 = *(_QWORD *)(v12 + 240) + *v13;
            _NSGlyphNodeTruncate(*(int64x2_t **)(v103 + 8), 0, v11 - *(_QWORD *)(v103 + 16));
          }
          v104 = malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
          v104[59] = 1;
          *(_QWORD *)v104 = v10;
          *((_QWORD *)v104 + 1) = v10;
          v104[56] = 1;
          _NSGlyphTreeInsertNodeAfterCurrentNode(v12, (uint64_t)v104, v105, v106, v107, v108, v109, v110);
          goto LABEL_108;
        }
        v126 = *(_QWORD *)v91;
      }
      else
      {
        v124 = 0;
        v125 = v91 + 24;
        v126 = *(_QWORD *)v91;
        do
        {
          v127 = *(_BYTE **)(v125 + v124);
          if (v127)
          {
            _NSGlyphNodeFree(v127);
            *(_QWORD *)(v125 + v124) = 0;
          }
          v124 += 8;
        }
        while (v124 != 24);
      }
      *(_BYTE *)(v91 + 59) = 1;
      *(_BYTE *)(v91 + 56) = v126 + v10 != 0;
      *(_QWORD *)v91 = v126 + v10;
      *(_QWORD *)(v91 + 8) = v126 + v10;
      _NSGlyphNodeSetCapacity(v91, 0);
      v128 = (int64x2_t *)v91;
      goto LABEL_107;
    }
    v120 = CFSTR("!!! _NSGlyphTreeInvalidateGlyphsForCharacterRange invalid char range 2");
    goto LABEL_96;
  }
  v111 = (_QWORD *)(*(_QWORD *)(v12 + 240) + *v13);
  v89 = v138;
  if (!*(_QWORD *)*v111)
  {
    v111[1] = *v111;
    *(_QWORD *)(*(_QWORD *)(v12 + 240) + *v13 + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(v12 + 240) + *v13 + 16) = 0;
    v112 = *(_QWORD *)(*(_QWORD *)(v12 + 240) + *v13 + 8);
    v93 = v136;
    v92 = v137;
    if (!*(_BYTE *)(v112 + 59))
    {
      v121 = 0;
      v122 = v112 + 24;
      do
      {
        v123 = *(_BYTE **)(v122 + v121);
        if (v123)
        {
          _NSGlyphNodeFree(v123);
          *(_QWORD *)(v122 + v121) = 0;
        }
        v121 += 8;
      }
      while (v121 != 24);
    }
    *(_BYTE *)(v112 + 59) = 1;
    *(_BYTE *)(v112 + 56) = 1;
    *(_QWORD *)v112 = v10;
    *(_QWORD *)(v112 + 8) = v10;
    goto LABEL_106;
  }
  if (!_NSGlyphTreeMoveToCharacterIndex(v12, 0))
  {
    v120 = CFSTR("!!! _NSGlyphTreeInvalidateGlyphsForCharacterRange invalid char range 3");
LABEL_96:
    _NSGlyphTreeLogDebug((NSString *)v120, v82, v83, v84, v85, v86, v87, v88, v135);
    v93 = v136;
    v92 = v137;
    goto LABEL_108;
  }
  v112 = *(_QWORD *)(*(_QWORD *)(v12 + 240) + *v13 + 8);
  v93 = v136;
  v92 = v137;
  if (!*(_BYTE *)(v112 + 59))
  {
    v129 = 0;
    v130 = v112 + 24;
    v131 = *(_QWORD *)v112;
    do
    {
      v132 = *(_BYTE **)(v130 + v129);
      if (v132)
      {
        _NSGlyphNodeFree(v132);
        *(_QWORD *)(v130 + v129) = 0;
      }
      v129 += 8;
    }
    while (v129 != 24);
    goto LABEL_105;
  }
  if (!*(_QWORD *)(v112 + 24))
  {
    v131 = *(_QWORD *)v112;
LABEL_105:
    *(_BYTE *)(v112 + 59) = 1;
    *(_BYTE *)(v112 + 56) = v131 + v10 != 0;
    *(_QWORD *)v112 = v131 + v10;
    *(_QWORD *)(v112 + 8) = v131 + v10;
LABEL_106:
    _NSGlyphNodeSetCapacity(v112, 0);
    v128 = (int64x2_t *)v112;
LABEL_107:
    _NSGlyphNodeSetInvariants(v128);
    goto LABEL_108;
  }
  v113 = (int64x2_t *)malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
  v113[3].i8[11] = 1;
  v113->i64[0] = v10;
  v113->i64[1] = v10;
  v113[3].i8[8] = 1;
  _NSGlyphTreeInsertNodeBeforeCurrentNode(v12, v113, v114, v115, v116, v117, v118, v119);
LABEL_108:
  v133 = *(_QWORD *)(v12 + 240);
  if (v89 + v139 != **(_QWORD **)(v133 + *v13))
  {
    _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeInvalidateGlyphsForCharacterRange character count mismatch"), v17, v18, v19, v20, v21, v22, v23, v135);
    v133 = *(_QWORD *)(v12 + 240);
  }
  *(_QWORD *)(v133 + 496) = 0;
  v134 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 240) + *v13) + 8);
  if (v140 & 1 | (v134 != v92))
    _NSLayoutTreeInvalidateLayoutForGlyphRange(v12, v135, v93 - (v134 - v92), v134 - v92, v20, v21, v22, v23, a9);
}

void _NSGlyphTreeSetIntAttributeForGlyphAtIndex(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
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
  int64x2_t *v23;
  size_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  unint64_t v34;
  unsigned int v35;
  char v36;

  if (!_NSGlyphTreeMoveToGlyphIndex(a1, a2))
  {
    _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeSetIntAttributeForGlyphAtIndex invalid glyph index %lu"), v13, v14, v15, v16, v17, v18, v19, a2);
    return;
  }
  v20 = *(_QWORD *)(a1 + 240);
  v21 = *(_QWORD *)(v20 + 216);
  if (!*(_BYTE *)(v21 + 59) || (v22 = *(_QWORD *)(v21 + 24)) == 0)
  {
    if (a4)
      _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeSetIntAttributeForGlyphAtIndex missing glyphs"), v13, v14, v15, v16, v17, v18, v19, a9);
    return;
  }
  if (a3 == 2)
  {
    if (a4 && !*(_QWORD *)(v21 + 40))
    {
      *(_BYTE *)(v21 + 56) |= 8u;
      v23 = *(int64x2_t **)(*(_QWORD *)(a1 + 240) + 216);
      v24 = v23[3].u64[0];
      if (v24 && !v23[2].i64[1])
      {
        v23[2].i64[1] = (uint64_t)malloc_type_calloc(v24, 1uLL, 0x68C02440uLL);
        v23 = *(int64x2_t **)(*(_QWORD *)(a1 + 240) + 216);
      }
      _NSGlyphNodeSetInvariants(v23);
      v20 = *(_QWORD *)(a1 + 240);
      v21 = *(_QWORD *)(v20 + 216);
    }
    v25 = *(_QWORD *)(v21 + 40);
    if (v25)
      *(_BYTE *)(v25 + a2 - *(_QWORD *)(v20 + 232)) = a4;
    return;
  }
  if (a4 && !*(_BYTE *)(v21 + 57))
  {
    if (a3 == 1 && *(unsigned __int8 *)(v22 + a2 - *(_QWORD *)(v20 + 232)) - 240 < 0xFFFFFF14)
      goto LABEL_39;
    _NSGlyphNodeSetGlyphFormat(v21, 1uLL);
  }
  if (a3 != 5)
  {
    if (a3 != 1)
    {
      if (!a3)
      {
        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
        if (*(_BYTE *)(v26 + 59))
        {
          v27 = *(_QWORD *)(v26 + 24);
          if (v27)
          {
            v28 = a2 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
            v29 = *(unsigned __int8 *)(v26 + 57);
            switch(v29)
            {
              case 3:
                *(_DWORD *)(v27 + 24 * v28) = *(_DWORD *)(v27 + 24 * v28) & 0xFFFFFFF7 | (8 * (a4 != 0));
                return;
              case 2:
                *(_DWORD *)(v27 + 4 * v28) = *(_DWORD *)(v27 + 4 * v28) & 0xFFFFFFF7 | (8 * (a4 != 0));
                return;
              case 1:
                v30 = *(_WORD *)(v27 + 2 * v28) & 0xFFF7 | (8 * (a4 != 0));
LABEL_37:
                *(_WORD *)(v27 + 2 * v28) = v30;
                return;
            }
          }
        }
      }
      return;
    }
    v20 = *(_QWORD *)(a1 + 240);
    v21 = *(_QWORD *)(v20 + 216);
    if (!*(_BYTE *)(v21 + 59))
      return;
LABEL_39:
    v33 = *(_QWORD *)(v21 + 24);
    if (v33)
    {
      v34 = a2 - *(_QWORD *)(v20 + 232);
      switch(*(_BYTE *)(v21 + 57))
      {
        case 0:
          v35 = *(unsigned __int8 *)(v33 + v34);
          if (v35 < 0xF0)
          {
            if (v35 <= 3)
              *(_BYTE *)(v33 + v34) = v35 & 1 | (2 * (a4 != 0));
          }
          else
          {
            if (a4)
              v36 = -8;
            else
              v36 = -16;
            *(_BYTE *)(v33 + v34) = v36 & 0xF8 | v35 & 7;
          }
          break;
        case 1:
          *(_WORD *)(v33 + 2 * v34) = *(_WORD *)(v33 + 2 * v34) & 0xFFEF | (16 * (a4 != 0));
          break;
        case 2:
          *(_DWORD *)(v33 + 4 * v34) = *(_DWORD *)(v33 + 4 * v34) & 0xFFFFFFEF | (16 * (a4 != 0));
          break;
        case 3:
          *(_DWORD *)(v33 + 24 * v34) = *(_DWORD *)(v33 + 24 * v34) & 0xFFFFFFEF | (16 * (a4 != 0));
          break;
        default:
          return;
      }
    }
    return;
  }
  v31 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
  if (*(_BYTE *)(v31 + 59))
  {
    v27 = *(_QWORD *)(v31 + 24);
    if (v27)
    {
      v28 = a2 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
      v32 = *(unsigned __int8 *)(v31 + 57);
      switch(v32)
      {
        case 3:
          *(_DWORD *)(v27 + 24 * v28) = *(_DWORD *)(v27 + 24 * v28) & 0xFFFFFFFE | (a4 != 0);
          return;
        case 2:
          *(_DWORD *)(v27 + 4 * v28) = *(_DWORD *)(v27 + 4 * v28) & 0xFFFFFFFE | (a4 != 0);
          return;
        case 1:
          v30 = *(_WORD *)(v27 + 2 * v28) & 0xFFFE | (a4 != 0);
          goto LABEL_37;
      }
    }
  }
}

void _NSGlyphTreeInsertGlyphs(uint64_t a1, unint64_t a2, unint64_t a3, size_t a4, unsigned int *a5)
{
  size_t v5;
  unsigned int *v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64x2_t *v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  unint64_t v22;
  int64x2_t *v23;
  size_t v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64x2_t *v32;
  int64x2_t *v33;
  uint64_t v34;
  __int8 *v35;
  _BYTE *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __CFString *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  __int8 *v47;
  _BYTE *v48;
  size_t v49;
  _BYTE *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int64x2_t *v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  size_t v63;
  unsigned int v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  size_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _BYTE *v75;
  _BYTE *v76;
  _BYTE *v77;
  uint64_t v78;
  unsigned int *v79;
  size_t v80;
  unsigned int v81;
  unsigned int v82;
  __int16 v83;
  int v84;
  int v85;
  uint64_t v86;
  size_t v87;
  int64x2_t *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  int64x2_t *v98;
  uint64_t v99;

  if (a5)
  {
    v5 = a4;
    if (a4)
    {
      v6 = a5;
      do
      {
        if (!_NSGlyphTreeMoveToCharacterIndex(a1, a2))
        {
          _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeInsertGlyphs invalid char index"), v10, v11, v12, v13, v14, v15, v16, v95);
          v20 = v5;
          goto LABEL_44;
        }
        v18 = *(int64x2_t **)(*(_QWORD *)(a1 + 240) + 216);
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224);
        v19 = v18->i64[0] + v17;
        if (a2 + v5 <= v19)
          v20 = v5;
        else
          v20 = v19 - a2;
        if (v18[3].i8[11] && v18[1].i64[1])
        {
          if (v20)
          {
            v21 = 0;
            while (1)
            {
              v22 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
              if (a3 + v21 < v22)
                break;
              v23 = *(int64x2_t **)(*(_QWORD *)(a1 + 240) + 216);
              if (a3 + v21 > v23->i64[1] + v22)
                break;
              _NSGlyphNodeInsertGlyph(v23, a2 + v21 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224), a3 + v21 - v22, 0, v6[v21]);
              if (++v21 >= v20)
              {
                v99 = 0;
                goto LABEL_30;
              }
            }
            _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeInsertGlyphs glyph index issue 1"), v10, v11, v12, v13, v14, v15, v16, v95);
            v99 = 0;
LABEL_30:
            objc_msgSend(*(id *)(a1 + 48), "insertElement:range:coalesceRuns:", &v99, a3, v20, 1, v95);
            v44 = *(void **)(*(_QWORD *)(a1 + 240) + 184);
            if (v44)
              _NSInsertGlyphRangeInTextBlocks(v44, a3, v20);
          }
          _NSLayoutTreeInvalidateLayoutForGlyphRange(a1, a3, 0, v20, v13, v14, v15, v16, v95);
        }
        else
        {
          if (a3 != a2 - v17 + *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232))
          {
            v43 = CFSTR("!!! _NSGlyphTreeInsertGlyphs glyph index issue 2");
            goto LABEL_28;
          }
          if (a2 > v17)
          {
            v24 = v19 - (v20 + a2);
            if (v19 > v20 + a2)
            {
              v25 = malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
              v25[59] = 1;
              *(_QWORD *)v25 = v24;
              *((_QWORD *)v25 + 1) = v24;
              v25[56] = 1;
              _NSGlyphTreeInsertNodeAfterCurrentNode(a1, (uint64_t)v25, v26, v27, v28, v29, v30, v31);
            }
            v32 = (int64x2_t *)malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
            v32[3].i8[11] = 1;
            v32->i64[0] = v20;
            v32->i64[1] = v20;
            v32[3].i8[8] = v20 != 0;
            _NSGlyphNodeSetGlyphs(v32, v20, v6);
            v33 = *(int64x2_t **)(*(_QWORD *)(a1 + 240) + 216);
            v97 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224);
            if (!v33[3].i8[11])
            {
              v34 = 0;
              v35 = &v33[1].i8[8];
              do
              {
                v36 = *(_BYTE **)&v35[v34];
                if (v36)
                {
                  _NSGlyphNodeFree(v36);
                  *(_QWORD *)&v35[v34] = 0;
                }
                v34 += 8;
              }
              while (v34 != 24);
            }
            v33[3].i8[11] = 1;
            v33[3].i8[8] = a2 != v97;
            v33->i64[0] = a2 - v97;
            v33->i64[1] = a2 - v97;
            _NSGlyphNodeSetCapacity((uint64_t)v33, 0);
            _NSGlyphNodeSetInvariants(v33);
            _NSGlyphTreeInsertNodeAfterCurrentNode(a1, (uint64_t)v32, v37, v38, v39, v40, v41, v42);
            goto LABEL_44;
          }
          if (a2)
          {
            v45 = v19 - (v20 + a2);
            if (v19 <= v20 + a2)
            {
              _NSGlyphTreeDeleteCurrentNode(a1, v10, v11, v12, v13, v14, v15, v16);
            }
            else
            {
              if (!v18[3].i8[11])
              {
                v46 = 0;
                v47 = &v18[1].i8[8];
                do
                {
                  v48 = *(_BYTE **)&v47[v46];
                  if (v48)
                  {
                    _NSGlyphNodeFree(v48);
                    *(_QWORD *)&v47[v46] = 0;
                  }
                  v46 += 8;
                }
                while (v46 != 24);
              }
              v18[3].i8[11] = 1;
              v18[3].i8[8] = 1;
              v18->i64[0] = v45;
              v18->i64[1] = v45;
              _NSGlyphNodeSetCapacity((uint64_t)v18, 0);
              _NSGlyphNodeSetInvariants(v18);
            }
            if (_NSGlyphTreeMoveToCharacterIndex(a1, a2 - 1))
            {
              v57 = *(int64x2_t **)(*(_QWORD *)(a1 + 240) + 216);
              if (!v57[3].i8[11] || !v57[1].i64[1] || (v58 = v57->i64[1], v59 = v58 + v20, v58 + v20 > 0x2000))
              {
                v88 = (int64x2_t *)malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
                v88[3].i8[11] = 1;
                v88->i64[0] = v20;
                v88->i64[1] = v20;
                v88[3].i8[8] = v20 != 0;
                _NSGlyphNodeSetGlyphs(v88, v20, v6);
                _NSGlyphTreeInsertNodeAfterCurrentNode(a1, (uint64_t)v88, v89, v90, v91, v92, v93, v94);
                goto LABEL_44;
              }
              if (v58 - v57->i64[0] == (__int16)(v58 - v57->i16[0]))
                v60 = 0;
              else
                v60 = 2;
              if (!v20)
                goto LABEL_44;
              v61 = v57[3].u8[9];
              v62 = v61;
              if (v61 <= 1)
              {
                v63 = 0;
                v62 = v57[3].u8[9];
                do
                {
                  v64 = v6[v63];
                  if (v64 == 0xFFFFFF)
                  {
                    v65 = 0;
                  }
                  else if (v64 <= 0xFF)
                  {
                    v65 = v64 > 0xEF;
                  }
                  else
                  {
                    v65 = 2;
                  }
                  if (v65 > v62)
                    v62 = v65;
                  if (v62 > 1)
                    break;
                  ++v63;
                }
                while (v63 < v20);
              }
              v96 = v58 - v57->i64[0];
              v98 = *(int64x2_t **)(*(_QWORD *)(a1 + 240) + 216);
              v95 = v60;
              if (v59 > v57[3].i64[0])
              {
                v66 = *MEMORY[0x1E0C85AD8];
                if (v59 <= *MEMORY[0x1E0C85AD8] >> 1)
                  v66 = 64;
                v67 = (v59 + v66 - 1) / v66 * v66;
                if (v67 >= 0x2000)
                  v67 = 0x2000;
                if (v67 <= v59)
                  v68 = v58 + v20;
                else
                  v68 = v67;
                v69 = v57->i64[1];
                _NSGlyphNodeSetCapacity((uint64_t)v57, v68);
                v60 = v95;
                v58 = v69;
                v57 = v98;
                v61 = v98[3].u8[9];
              }
              if (v62 > v61)
              {
                v61 = v58;
                _NSGlyphNodeSetGlyphFormat((uint64_t)v57, v62);
                v60 = v95;
                v58 = v61;
                v57 = v98;
                LODWORD(v61) = v98[3].u8[9];
              }
              v70 = v57[3].u8[10];
              if (v60 > v70)
              {
                v71 = v58;
                _NSGlyphNodeSetDeltaFormat((uint64_t)v57, v60);
                v58 = v71;
                v57 = v98;
                LODWORD(v70) = v98[3].u8[10];
              }
              *v57 = vaddq_s64(*v57, vdupq_n_s64(v20));
              v73 = v57[1].i64[1];
              v72 = v57[2].i64[0];
              v74 = v57[2].i64[1];
              v75 = (_BYTE *)(v73 + v58);
              v76 = (_BYTE *)(v73 + 2 * v58);
              v77 = (_BYTE *)(v73 + 4 * v58);
              v78 = v73 + 24 * v58;
              v79 = v6;
              v80 = v20;
              while (2)
              {
                v82 = *v79++;
                v81 = v82;
                if (v73)
                {
                  switch((int)v61)
                  {
                    case 0:
                      if (v81 == 0xFFFFFF)
                      {
                        *v75 = 0;
                        break;
                      }
                      if (v81 <= 3)
                      {
                        LOBYTE(v81) = v81 | 0xF0;
                        goto LABEL_99;
                      }
                      if (v81 <= 0xEF)
LABEL_99:
                        *v75 = v81;
                      break;
                    case 1:
                      *v76 = 0;
                      if (v81 == 0xFFFFFF)
                        v83 = 128;
                      else
                        v83 = (_WORD)v81 << 8;
                      *(_WORD *)v76 = v83 & 0xFF80 | *(_WORD *)v76 & 0x7F;
                      break;
                    case 2:
                      *v77 = 0;
                      if (v81 == 0xFFFFFF)
                        v84 = 128;
                      else
                        v84 = v81 << 8;
                      *(_DWORD *)v77 = v84 & 0xFFFFFF80 | *(_DWORD *)v77 & 0x7F;
                      break;
                    case 3:
                      *(_BYTE *)v78 = 0;
                      *(_QWORD *)(v78 + 16) = 0;
                      if (v81 == 0xFFFFFF)
                        v85 = 128;
                      else
                        v85 = v81 << 8;
                      *(_DWORD *)v78 = v85 & 0xFFFFFF80 | *(_DWORD *)v78 & 0x7F;
                      break;
                    default:
                      break;
                  }
                }
                ++v75;
                v76 += 2;
                v77 += 4;
                v78 += 24;
                if (!--v80)
                {
                  if (v72)
                  {
                    v86 = v58;
                    v87 = v20;
                    do
                    {
                      switch((_DWORD)v70)
                      {
                        case 2:
                          *(_DWORD *)(v72 + 4 * v86) = v96;
                          break;
                        case 1:
                          *(_WORD *)(v72 + 2 * v86) = v96;
                          break;
                        case 0:
                          *(_BYTE *)(v72 + v86) = v96;
                          break;
                      }
                      ++v86;
                      --v87;
                    }
                    while (v87);
                  }
                  if (v74)
                  {
                    bzero((void *)(v74 + v58), v20);
                    v57 = v98;
                  }
                  _NSGlyphNodeSetInvariants(v57);
                  goto LABEL_44;
                }
                continue;
              }
            }
            v43 = CFSTR("!!! _NSGlyphTreeInsertGlyphs found invalid char index");
LABEL_28:
            _NSGlyphTreeLogDebug((NSString *)v43, v10, v11, v12, v13, v14, v15, v16, v95);
            goto LABEL_44;
          }
          v49 = v19 - v20;
          if (v19 > v20)
          {
            v50 = malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
            v50[59] = 1;
            *(_QWORD *)v50 = v49;
            *((_QWORD *)v50 + 1) = v49;
            v50[56] = 1;
            _NSGlyphTreeInsertNodeAfterCurrentNode(a1, (uint64_t)v50, v51, v52, v53, v54, v55, v56);
            v18 = *(int64x2_t **)(*(_QWORD *)(a1 + 240) + 216);
          }
          _NSGlyphNodeSetGlyphs(v18, v20, v6);
        }
LABEL_44:
        a2 += v20;
        a3 += v20;
        v6 += v20;
        v5 -= v20;
      }
      while (v5);
    }
  }
}

int64x2_t *_NSGlyphNodeSetInvariants(int64x2_t *result)
{
  __int8 v1;
  int64x2_t v2;
  uint64_t i;
  int64x2_t *v4;

  for (; result; result = (int64x2_t *)result[1].i64[0])
  {
    if (!result[3].i8[11])
    {
      v1 = 0;
      v2 = 0uLL;
      for (i = 3; i != 6; ++i)
      {
        v4 = (int64x2_t *)result->i64[i];
        if (v4)
        {
          v2 = vaddq_s64(*v4, v2);
          v1 |= v4[3].u8[8];
        }
      }
      *result = v2;
      result[3].i8[8] = v1;
    }
  }
  return result;
}

int64x2_t *_NSGlyphNodeSetGlyphs(int64x2_t *a1, size_t a2, unsigned int *a3)
{
  size_t v6;
  unint64_t v7;
  unsigned int v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  size_t v12;
  _BYTE *v13;
  _BYTE *v14;
  _BYTE *v15;
  _BYTE *v16;
  unsigned int v17;
  unsigned int v18;
  __int16 v19;
  int v20;

  _NSGlyphNodeSetCapacity((uint64_t)a1, 0);
  a1->i64[0] = a2;
  a1->i64[1] = a2;
  if (a2 && a3)
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = a3[v6];
      if (v8 == 0xFFFFFF)
      {
        v9 = 0;
      }
      else if (v8 <= 0xFF)
      {
        v9 = v8 > 0xEF;
      }
      else
      {
        v9 = 2;
      }
      if (v9 > v7)
        v7 = v9;
      if (v7 > 1)
        break;
      ++v6;
    }
    while (v6 < a2);
    a1[3].i8[9] = v7;
    a1[3].i8[8] = 2;
    v10 = *MEMORY[0x1E0C85AD8];
    if (a2 <= *MEMORY[0x1E0C85AD8] >> 1)
      v10 = 64;
    v11 = (a2 + v10 - 1) / v10 * v10;
    if (v11 >= 0x2000)
      v11 = 0x2000;
    if (v11 <= a2)
      v12 = a2;
    else
      v12 = v11;
    _NSGlyphNodeSetCapacity((uint64_t)a1, v12);
    v13 = (_BYTE *)a1[1].i64[1];
    v14 = v13;
    v15 = v13;
    v16 = v13;
    while (1)
    {
      v18 = *a3++;
      v17 = v18;
      if (v13)
      {
        if (v7 == 2)
        {
          *v16 = 0;
          if (v17 == 0xFFFFFF)
            v20 = 128;
          else
            v20 = v17 << 8;
          *(_DWORD *)v16 = v20 & 0xFFFFFF80 | *(_DWORD *)v16 & 0x7F;
          goto LABEL_38;
        }
        if (v7 == 1)
        {
          *v15 = 0;
          if (v17 == 0xFFFFFF)
            v19 = 128;
          else
            v19 = (_WORD)v17 << 8;
          *(_WORD *)v15 = v19 & 0xFF80 | *(_WORD *)v15 & 0x7F;
          goto LABEL_38;
        }
        if (v17 == 0xFFFFFF)
        {
          *v14 = 0;
        }
        else
        {
          if (v17 <= 3)
          {
            LOBYTE(v17) = v17 | 0xF0;
LABEL_37:
            *v14 = v17;
            goto LABEL_38;
          }
          if (v17 <= 0xEF)
            goto LABEL_37;
        }
      }
LABEL_38:
      v16 += 4;
      v15 += 2;
      ++v14;
      if (!--a2)
        return _NSGlyphNodeSetInvariants(a1);
    }
  }
  a1[3].i8[8] = a2 != 0;
  return _NSGlyphNodeSetInvariants(a1);
}

void _NSGlyphNodeSetCapacity(uint64_t a1, size_t count)
{
  unint64_t v4;
  size_t v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  char *v12;
  unint64_t v13;
  void *v14;
  char *v15;
  unint64_t v16;
  void *v17;
  char *v18;
  unint64_t v19;

  if (count)
  {
    v4 = *(char *)(a1 + 57);
    if (v4 > 3)
      v5 = 0;
    else
      v5 = qword_18D6CBC78[v4];
    v9 = *(char *)(a1 + 58);
    if (v9 > 2)
      v10 = 0;
    else
      v10 = qword_18D6CBC98[v9];
    v11 = *(void **)(a1 + 24);
    if (v11)
    {
      v12 = (char *)malloc_type_realloc(v11, v5 * count, 0xFFF8BB3uLL);
      *(_QWORD *)(a1 + 24) = v12;
      v13 = *(_QWORD *)(a1 + 8);
      if (count > v13)
        bzero(&v12[v13 * v5], (count - v13) * v5);
    }
    else
    {
      *(_QWORD *)(a1 + 24) = malloc_type_calloc(count, v5, 0x613E76F8uLL);
    }
    v14 = *(void **)(a1 + 32);
    if (v14)
    {
      v15 = (char *)malloc_type_realloc(v14, v10 * count, 0xC5D7BF81uLL);
      *(_QWORD *)(a1 + 32) = v15;
      v16 = *(_QWORD *)(a1 + 8);
      if (count > v16)
        bzero(&v15[v16 * v10], (count - v16) * v10);
    }
    v17 = *(void **)(a1 + 40);
    if (v17)
    {
      v18 = (char *)malloc_type_realloc(v17, count, 0x77C57A6BuLL);
      *(_QWORD *)(a1 + 40) = v18;
      v19 = *(_QWORD *)(a1 + 8);
      if (count > v19)
        bzero(&v18[v19], count - v19);
    }
  }
  else
  {
    v6 = *(void **)(a1 + 24);
    if (v6)
    {
      free(v6);
      *(_QWORD *)(a1 + 24) = 0;
    }
    v7 = *(void **)(a1 + 32);
    if (v7)
    {
      free(v7);
      *(_QWORD *)(a1 + 32) = 0;
    }
    v8 = *(void **)(a1 + 40);
    if (v8)
    {
      free(v8);
      *(_QWORD *)(a1 + 40) = 0;
    }
    *(_WORD *)(a1 + 57) = 0;
  }
  *(_QWORD *)(a1 + 48) = count;
}

BOOL UIDataLooksLikeNibArchive(void *a1)
{
  id v1;
  _BOOL8 v3;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if ((unint64_t)objc_msgSend(v1, "length") < 4)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v1, "getBytes:length:", &v5, 10);
    v3 = v5 == 0x696863724142494ELL && v6 == 25974;
  }

  return v3;
}

void sub_18D627844(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  _Block_object_dispose((const void *)(v2 - 144), 8);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D627D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
  uint64_t v60;

  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a60, 8);
  _Block_object_dispose((const void *)(v60 - 248), 8);
  _Block_object_dispose((const void *)(v60 - 200), 8);
  _Unwind_Resume(a1);
}

uint64_t __NSTextLayoutManagerGetLayoutFragmentForPosition(_QWORD *a1, id *a2, char a3, double a4, double a5)
{
  double v10;
  double v11;
  void *v12;
  BOOL v13;
  double v14;
  id v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;

  objc_msgSend(*a2, "size");
  v11 = v10;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3052000000;
  v25 = __Block_byref_object_copy__2;
  v26 = __Block_byref_object_dispose__2;
  v27 = 0;
  v12 = (void *)objc_msgSend(a2[2], "endLocation");
  v13 = v11 < 10000000.0 && v11 > 0.0;
  v14 = 1.79769313e308;
  if (v13)
    v14 = v11;
  __NSTextLayoutManagerFillSoftInvalidationToLocation((uint64_t)a1, v12, v14);
  if (objc_msgSend(a2[2], "isNotEmpty"))
  {
    v15 = a2[2];
    LOBYTE(v21) = a3;
    v16 = objc_msgSend((id)objc_msgSend(v15, "endLocation"), "isEqual:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "textContentManager", MEMORY[0x1E0C809B0], 3221225472, ____NSTextLayoutManagerGetLayoutFragmentForPosition_block_invoke, &unk_1E2604220, &v22, *(_QWORD *)&a4, *(_QWORD *)&a5, v21), "documentRange"), "endLocation"));
    v17 = (void *)a1[10];
    if (v16)
      objc_msgSend(v17, "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", objc_msgSend(v15, "location"), 2, &v20);
    else
      objc_msgSend(v17, "enumerateTextLayoutFragmentInTextRange:options:usingBlock:", v15, 2, &v20);
  }
  v18 = v23[5];
  _Block_object_dispose(&v22, 8);
  return v18;
}

void sub_18D627FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

NSUInteger __NSTextContentStorageUpdateCachedRange(uint64_t a1)
{
  NSUInteger result;
  unint64_t v3;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  NSUInteger v7;
  NSRange v8;
  NSRange v9;
  NSRange v10;

  result = objc_msgSend(*(id *)(a1 + 96), "count");
  if (result && (v3 = result, result = objc_msgSend(*(id *)(a1 + 96), "count"), v3 <= result))
  {
    result = objc_msgSend((id)objc_msgSend(*(id *)objc_msgSend(*(id *)(a1 + 96), "elementAtIndex:", 0), "elementRange"), "range");
    location = result;
    length = v6;
    if (v3 >= 2)
    {
      v10.location = objc_msgSend((id)objc_msgSend(*(id *)objc_msgSend(*(id *)(a1 + 96), "elementAtIndex:", v3 - 1), "elementRange"), "range");
      v10.length = v7;
      v9.location = location;
      v9.length = length;
      v8 = NSUnionRange(v9, v10);
      result = v8.location;
      location = v8.location;
      length = v8.length;
    }
  }
  else
  {
    length = 0;
    location = 0x7FFFFFFFFFFFFFFFLL;
  }
  *(_QWORD *)(a1 + 104) = location;
  *(_QWORD *)(a1 + 112) = length;
  return result;
}

uint64_t _NSStringImputedBaseWritingDirectionAtIndex(const __CFString *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v10;
  uint64_t v11;
  UniChar v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  UniChar v18;
  uint64_t UnicodePropertyDataForPlane;
  int64_t v20;
  UniChar *v21;
  int64_t v22;
  UniChar v23;
  int64_t v24;
  unsigned int v25;
  int64_t v26;
  int64_t v27;
  int64_t v28;
  int64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  UniChar v33;
  uint64_t v34;
  UniChar v35;
  uint64_t v36;
  uint64_t v37;
  UniChar v38;
  int64_t v39;
  uint64_t v40;
  int64_t v41;
  uint64_t v42;
  unint64_t v43;
  unsigned int v44;
  uint64_t v46;
  uint64_t v47;
  UniChar buffer[8];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  CFStringRef theString;
  UniChar *v57;
  const char *v58;
  uint64_t v59;
  int64_t v60;
  int64_t v61;
  int64_t v62;
  CFRange v63;
  CFRange v64;
  CFRange v65;
  CFRange v66;
  CFRange v67;
  CFRange v68;

  theString = a1;
  v59 = a3;
  v60 = a4;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  v57 = (UniChar *)CharactersPtr;
  if (CharactersPtr)
    CStringPtr = 0;
  else
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  v61 = 0;
  v62 = 0;
  v58 = CStringPtr;
  if (!_NSStringImputedBaseWritingDirectionAtIndex_bidiPropertyBMP)
    _NSStringImputedBaseWritingDirectionAtIndex_bidiPropertyBMP = CFUniCharGetUnicodePropertyDataForPlane();
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  *(_OWORD *)buffer = 0u;
  v49 = 0u;
  v10 = ~a3 + a2;
  if (v10 < 0)
    goto LABEL_22;
  if ((uint64_t)a4 <= v10)
  {
    v47 = a2;
    v12 = 0;
LABEL_24:
    v15 = ~a3 + a2;
LABEL_25:
    v17 = -1;
    while (1)
    {
      v18 = v12;
      UnicodePropertyDataForPlane = _NSStringImputedBaseWritingDirectionAtIndex_bidiPropertyBMP;
      if (!v15)
      {
        v24 = 0;
        goto LABEL_38;
      }
      if (v12 >> 10 != 55)
        goto LABEL_37;
      v20 = v60;
      if (v60 <= v15)
        goto LABEL_37;
      v21 = v57;
      if (v57)
        break;
      if (!v58)
      {
        if (v62 <= v15 || (v29 = v61, v61 > v15))
        {
          v30 = v15 - 4;
          if ((unint64_t)v15 < 4)
            v30 = 0;
          if (v30 + 64 < v60)
            v20 = v30 + 64;
          v61 = v30;
          v62 = v20;
          v65.location = v59 + v30;
          v65.length = v20 - v30;
          CFStringGetCharacters(theString, v65, buffer);
          v29 = v61;
        }
        v22 = v15 - v29;
        v21 = buffer;
        goto LABEL_31;
      }
      v23 = v58[v59 + v15];
LABEL_35:
      if (v23 >> 10 == 54)
      {
        v18 += 9216 + (v23 << 10);
        v24 = v15 - 1;
        UnicodePropertyDataForPlane = CFUniCharGetUnicodePropertyDataForPlane();
        goto LABEL_38;
      }
LABEL_37:
      v24 = v15;
LABEL_38:
      if (!UnicodePropertyDataForPlane)
        goto LABEL_45;
      v25 = *(unsigned __int8 *)(UnicodePropertyDataForPlane + HIBYTE(v18));
      if (v25 >= 0x13)
        v25 = *(unsigned __int8 *)(UnicodePropertyDataForPlane
                                 + (((v25 << 8) - 4864) & 0xFFFFFF00)
                                 + v18
                                 + 256);
      if (v25 <= 0x11)
      {
        if (((1 << v25) & 0xC024) != 0)
        {
          v17 = 1;
          goto LABEL_46;
        }
        if (((1 << v25) & 0x30002) != 0)
        {
LABEL_45:
          v17 = 0;
          goto LABEL_46;
        }
        if (v25 == 13)
        {
LABEL_70:
          a2 = v47;
          goto LABEL_71;
        }
      }
LABEL_46:
      if (!v24)
        goto LABEL_70;
      v12 = 0;
      v15 = v24 - 1;
      v26 = v60;
      if (v60 >= v24)
      {
        if (v57)
        {
          v12 = v57[v59 + v15];
        }
        else if (v58)
        {
          v12 = v58[v59 + v15];
        }
        else
        {
          if (v62 < v24 || (v27 = v61, v61 >= v24))
          {
            v28 = v24 - 5;
            if ((unint64_t)v24 < 5)
              v28 = 0;
            if (v28 + 64 < v60)
              v26 = v28 + 64;
            v61 = v28;
            v62 = v26;
            v64.location = v59 + v28;
            v64.length = v26 - v28;
            CFStringGetCharacters(theString, v64, buffer);
            v27 = v61;
          }
          v12 = buffer[v15 - v27];
        }
      }
    }
    v22 = v59 + v15;
LABEL_31:
    v23 = v21[v22];
    goto LABEL_35;
  }
  if (CharactersPtr)
  {
    v11 = 0;
    v12 = CharactersPtr[a2 - 1];
  }
  else if (CStringPtr)
  {
    v11 = 0;
    v12 = CStringPtr[a2 - 1];
  }
  else
  {
    v13 = v10 - 4;
    if ((unint64_t)v10 < 4)
      v13 = 0;
    v14 = v13 + 64;
    if (v13 + 64 >= (uint64_t)a4)
      v14 = a4;
    v61 = v13;
    v62 = v14;
    v63.location = a3 + v13;
    v63.length = v14 - v13;
    CFStringGetCharacters(a1, v63, buffer);
    v11 = v61;
    v12 = buffer[v10 - v61];
  }
  if (v12 >> 10 != 54)
  {
    v47 = a2;
    goto LABEL_24;
  }
  --a2;
  if (v10)
  {
    v15 = v10 - 1;
    v16 = v60;
    v47 = a2;
    if (v60 >= v10)
    {
      if (v57)
      {
        v12 = v57[v59 + v15];
      }
      else if (v58)
      {
        v12 = v58[v59 + v15];
      }
      else
      {
        if (v62 < v10 || v11 >= v10)
        {
          v46 = v10 - 5;
          if ((unint64_t)v10 < 5)
            v46 = 0;
          if (v46 + 64 < v60)
            v16 = v46 + 64;
          v61 = v46;
          v62 = v16;
          v68.location = v59 + v46;
          v68.length = v16 - v46;
          CFStringGetCharacters(theString, v68, buffer);
          v11 = v61;
        }
        v12 = buffer[v15 - v11];
      }
    }
    else
    {
      v12 = 0;
    }
    goto LABEL_25;
  }
LABEL_22:
  v17 = -1;
LABEL_71:
  v31 = a2 - a3;
  if (a2 - a3 < a4 && v17 == -1)
  {
    while (1)
    {
      if (v31 < 0 || (v32 = v60, v60 <= v31))
      {
        v33 = 0;
      }
      else if (v57)
      {
        v33 = v57[v59 + v31];
      }
      else if (v58)
      {
        v33 = v58[v59 + v31];
      }
      else
      {
        if (v62 <= v31 || (v39 = v61, v61 > v31))
        {
          v40 = v31 - 4;
          if ((unint64_t)v31 < 4)
            v40 = 0;
          if (v40 + 64 < v60)
            v32 = v40 + 64;
          v61 = v40;
          v62 = v32;
          v66.location = v59 + v40;
          v66.length = v32 - v40;
          CFStringGetCharacters(theString, v66, buffer);
          v39 = v61;
        }
        v33 = buffer[v31 - v39];
      }
      v34 = v31 + 1;
      v35 = v33;
      v36 = _NSStringImputedBaseWritingDirectionAtIndex_bidiPropertyBMP;
      if (v31 >= -1 && v34 < a4 && (v33 & 0xFC00) == 0xD800)
      {
        v37 = v60;
        if (v60 > v34)
        {
          if (v57)
          {
            v38 = v57[v59 + v34];
          }
          else if (v58)
          {
            v38 = v58[v59 + v34];
          }
          else
          {
            if (v62 <= v34 || (v41 = v61, v61 > v34))
            {
              v42 = v31 - 3;
              if ((unint64_t)v31 < 3)
                v42 = 0;
              if (v42 + 64 < v60)
                v37 = v42 + 64;
              v61 = v42;
              v62 = v37;
              v67.location = v59 + v42;
              v67.length = v37 - v42;
              CFStringGetCharacters(theString, v67, buffer);
              v41 = v61;
            }
            v38 = buffer[v34 - v41];
          }
          if (v38 >> 10 == 55)
          {
            v35 = (v35 << 10) + 9216 + v38;
            v34 = v31 + 2;
            v36 = CFUniCharGetUnicodePropertyDataForPlane();
          }
        }
      }
      if (!v36)
        return 0;
      v43 = *(unsigned __int8 *)(v36 + HIBYTE(v35));
      if (v43 >= 0x13)
        LODWORD(v43) = *(unsigned __int8 *)(v36 + ((((_DWORD)v43 << 8) - 4864) & 0xFFFFFF00) + v35 + 256);
      v44 = v43 - 1;
      if (v44 < 0x11 && ((0x1F013u >> v44) & 1) != 0)
        break;
      v31 = v34;
      if (v34 >= a4)
        return -1;
    }
    return qword_18D6CC028[(char)v44];
  }
  return v17;
}

void sub_18D629250(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void UIFreeMissingClasses(void **a1, uint64_t a2)
{
  id *v2;
  uint64_t v5;
  unsigned int v6;

  v2 = (id *)*a1;
  if (*a1)
  {
    if (a2 >= 1)
    {
      v5 = 0;
      v6 = 1;
      do
      {

        v5 = v6++;
      }
      while (v5 < a2);
    }
    free(v2);
    *a1 = 0;
  }
}

void sub_18D629D30(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class initUIImage()
{
  Class result;

  __NSGetFrameworkReference(0, 0);
  result = objc_getClass("UIImage");
  classUIImage = (uint64_t)result;
  if (!result)
    initUIImage_cold_1();
  getUIImageClass[0] = UIImageFunction;
  return result;
}

Class initUIImage_0()
{
  Class result;

  __NSGetFrameworkReference(0, 0);
  result = objc_getClass("UIImage");
  classUIImage_0 = (uint64_t)result;
  if (!result)
    initUIImage_cold_1_0();
  getUIImageClass_0 = UIImageFunction_0;
  return result;
}

Class initUIColor()
{
  Class result;

  __NSGetFrameworkReference(0, 0);
  result = objc_getClass("UIColor");
  classUIColor = (uint64_t)result;
  if (!result)
    initUIColor_cold_1();
  getUIColorClass[0] = UIColorFunction;
  return result;
}

Class initUIColor_0()
{
  Class result;

  __NSGetFrameworkReference(0, 0);
  result = objc_getClass("UIColor");
  classUIColor_0 = (uint64_t)result;
  if (!result)
    initUIColor_cold_1_0();
  getUIColorClass_0[0] = UIColorFunction_0;
  return result;
}

Class initUIColor_1()
{
  Class result;

  __NSGetFrameworkReference(0, 0);
  result = objc_getClass("UIColor");
  classUIColor_1 = (uint64_t)result;
  if (!result)
    initUIColor_cold_1_1();
  getUIColorClass_1[0] = UIColorFunction_1;
  return result;
}

NSUInteger __NSTextContentStorageReleaseElementsInRange(NSUInteger a1, NSUInteger a2, NSUInteger a3)
{
  if (a2 == 0x7FFFFFFFFFFFFFFFLL && a3 == 0)
  {
    a3 = objc_msgSend(*(id *)(a1 + 96), "count");
    a2 = 0;
  }
  return __NSTextContentStorageEnumerateCachedElementsInElementIndexRange(a1, a2, a3, (uint64_t)&__block_literal_global_282);
}

void *__NSTextContentStorageChildElementsEnumerationCacheGetNextElement(uint64_t a1)
{
  int v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *NextElement;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;

  while (1)
  {
    v2 = *(unsigned __int8 *)(a1 + 33);
    *(_BYTE *)(a1 + 33) = 0;
    v3 = (void *)MEMORY[0x18D7917B4]();
    v4 = *(_QWORD *)(a1 + 24);
    if ((v4 & 0x8000000000000000) != 0 || v4 >= objc_msgSend(*(id *)(a1 + 8), "count"))
      break;
    v5 = *(_QWORD *)(a1 + 24);
    NextElement = (void *)objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", v5);
    v7 = objc_msgSend(NextElement, "childElements");
    v8 = (void *)v7;
    if (*(_BYTE *)(a1 + 32))
    {
      v9 = v5 + 1;
      if (v7)
      {
        v10 = *(void **)(a1 + 16);
        *(_QWORD *)a1 = NextElement;
        *(_QWORD *)(a1 + 8) = v7;
        if (v10)
          v11 = (void *)objc_msgSend(v10, "indexPathByAddingIndex:", v9);
        else
          v11 = (void *)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v9);
        *(_QWORD *)(a1 + 16) = v11;
        if (*(_BYTE *)(a1 + 32))
          v28 = 0;
        else
          v28 = objc_msgSend(v8, "count") - 1;
        *(_QWORD *)(a1 + 24) = v28;

      }
      else if (v9 >= objc_msgSend(*(id *)(a1 + 8), "count"))
      {
        do
        {
          v22 = *(void **)(a1 + 16);
          v23 = objc_msgSend(v22, "length");
          v24 = *(void **)a1;
          *(_BYTE *)(a1 + 33) = *(_QWORD *)a1 != 0;
          v25 = (void *)objc_msgSend(v24, "parentElement");
          *(_QWORD *)a1 = v25;
          *(_QWORD *)(a1 + 8) = objc_msgSend(v25, "childElements");
          if (v23 <= 0)
          {
            v26 = 0;
            *(_QWORD *)(a1 + 24) = 0x7FFFFFFFFFFFFFFFLL;
          }
          else
          {
            *(_QWORD *)(a1 + 24) = objc_msgSend(*(id *)(a1 + 16), "indexAtPosition:", v23 - 1);
            if (v23 == 1)
              v26 = 0;
            else
              v26 = (id)objc_msgSend(*(id *)(a1 + 16), "indexPathByRemovingLastIndex");
          }
          *(_QWORD *)(a1 + 16) = v26;

          if (!objc_msgSend(*(id *)a1, "parentElement"))
            break;
          v27 = *(_QWORD *)(a1 + 24);
        }
        while (v27 >= objc_msgSend(*(id *)(a1 + 8), "count"));
      }
      else
      {
        *(_QWORD *)(a1 + 24) = v9;
      }
      goto LABEL_15;
    }
    if (v2 || !v7)
    {
      if (v5 < 0)
      {
        v29 = *(void **)(a1 + 16);
        v30 = objc_msgSend(v29, "length");
        v31 = *(id *)a1;
        *(_BYTE *)(a1 + 33) = *(_QWORD *)a1 != 0;
        v32 = (void *)objc_msgSend(v31, "parentElement");
        *(_QWORD *)a1 = v32;
        *(_QWORD *)(a1 + 8) = objc_msgSend(v32, "childElements");
        if (v30 <= 0)
        {
          v33 = 0;
          *(_QWORD *)(a1 + 24) = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          *(_QWORD *)(a1 + 24) = objc_msgSend(*(id *)(a1 + 16), "indexAtPosition:", v30 - 1);
          if (v30 == 1)
            v33 = 0;
          else
            v33 = (id)objc_msgSend(*(id *)(a1 + 16), "indexPathByRemovingLastIndex");
        }
        *(_QWORD *)(a1 + 16) = v33;

        goto LABEL_15;
      }
      v21 = v5 - 1;
    }
    else
    {
      do
      {
        v17 = *(void **)(a1 + 16);
        *(_QWORD *)a1 = NextElement;
        *(_QWORD *)(a1 + 8) = v8;
        if (v17)
          v18 = (void *)objc_msgSend(v17, "indexPathByAddingIndex:", v5);
        else
          v18 = (void *)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v5);
        *(_QWORD *)(a1 + 16) = v18;
        if (*(_BYTE *)(a1 + 32))
          v19 = 0;
        else
          v19 = objc_msgSend(v8, "count") - 1;
        *(_QWORD *)(a1 + 24) = v19;

        v20 = objc_msgSend(*(id *)(a1 + 8), "count");
        v5 = v20 - 1;
        NextElement = (void *)objc_msgSend(*(id *)(a1 + 8), "objectAtIndexedSubscript:", v20 - 1);
        v8 = (void *)objc_msgSend(NextElement, "childElements");
      }
      while (v8);
      v21 = v20 - 2;
    }
    *(_QWORD *)(a1 + 24) = v21;
LABEL_15:
    objc_autoreleasePoolPop(v3);
    if (!NextElement || objc_msgSend(NextElement, "isRepresentedElement"))
      return NextElement;
  }
  v12 = *(void **)(a1 + 16);
  v13 = objc_msgSend(v12, "length");
  v14 = *(id *)a1;
  *(_BYTE *)(a1 + 33) = *(_QWORD *)a1 != 0;
  v15 = (void *)objc_msgSend(v14, "parentElement");
  *(_QWORD *)a1 = v15;
  *(_QWORD *)(a1 + 8) = objc_msgSend(v15, "childElements");
  if (v13 <= 0)
  {
    v16 = 0;
    *(_QWORD *)(a1 + 24) = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    *(_QWORD *)(a1 + 24) = objc_msgSend(*(id *)(a1 + 16), "indexAtPosition:", v13 - 1);
    if (v13 == 1)
      v16 = 0;
    else
      v16 = (id)objc_msgSend(*(id *)(a1 + 16), "indexPathByRemovingLastIndex");
  }
  *(_QWORD *)(a1 + 16) = v16;

  if (!*(_BYTE *)(a1 + 32) && *(_BYTE *)(a1 + 33))
  {
    NextElement = (void *)__NSTextContentStorageChildElementsEnumerationCacheGetNextElement(a1);
    goto LABEL_15;
  }
  objc_autoreleasePoolPop(v3);
  return 0;
}

uint64_t UIImageFunction()
{
  return classUIImage;
}

uint64_t UIImageFunction_0()
{
  return classUIImage_0;
}

void sub_18D62B5B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D62B628(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D62B690(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D62B7D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D62B864(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D62BC74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18D62BD08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D62D02C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D62D290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D62D544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18D62D7A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D62D990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18D62DAA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D62DE88(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D62DF08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D62E6D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D62EDD0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D62EE58(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

unint64_t _NSLayoutNodeSuggestedFragmentCapacity(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  if (a1 <= 1)
    v1 = 1;
  else
    v1 = a1;
  v2 = 16;
  if (v1 > *MEMORY[0x1E0C85AD8] >> 4)
    v2 = *MEMORY[0x1E0C85AD8] >> 3;
  v3 = (v1 + v2 - 1) / v2 * v2;
  if (v3 >= 0x2000)
    v3 = 0x2000;
  if (v3 <= v1)
    return v1;
  else
    return v3;
}

unint64_t _NSLayoutNodeSuggestedAttachmentSizeCapacity(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  if (a1 <= 1)
    v1 = 1;
  else
    v1 = a1;
  v2 = 16;
  if (v1 > *MEMORY[0x1E0C85AD8] >> 4)
    v2 = *MEMORY[0x1E0C85AD8] >> 3;
  v3 = (v1 + v2 - 1) / v2 * v2;
  if (v3 >= 0x2000)
    v3 = 0x2000;
  if (v3 <= v1)
    return v1;
  else
    return v3;
}

uint64_t _NSLayoutTreeSummaryDescription(uint64_t a1)
{
  unint64_t v2;
  double v3;
  double v4;
  unint64_t v5;
  double v6;
  double v7;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v11 = 0;
  v12 = 0;
  v9 = 0;
  v10 = 0;
  v2 = objc_msgSend(*(id *)(a1 + 8), "length");
  _NSLayoutTreeCalculateMemoryUsage(a1, &v12, &v11, &v10, &v9);
  v3 = 0.0;
  v4 = 0.0;
  if (v2)
    v4 = (double)v11 / (double)v2;
  v5 = **(_QWORD **)(*(_QWORD *)(a1 + 240) + 240);
  if (v5)
    v3 = (double)v11 / (double)v5;
  if (v9)
  {
    v6 = (double)v10 / (double)v9;
    v7 = (double)v11 / (double)v9;
  }
  else
  {
    v6 = 0.0;
    v7 = 0.0;
  }
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Layout tree contents:  %lu characters, %lu glyphs, %lu laid glyphs, %lu laid line fragments, %lu nodes, %lu node bytes, %lu storage bytes, %lu total bytes, %.2f bytes per character, %.2f bytes per glyph, %.2f laid glyphs per laid line fragment, %.2f bytes per laid line fragment"), v2, v5, v10, v9, v12, v12 << 6, v11 - (v12 << 6), v11, *(_QWORD *)&v4, *(_QWORD *)&v3, *(_QWORD *)&v6, *(_QWORD *)&v7);
}

uint64_t _NSLayoutTreeCalculateMemoryUsage(uint64_t a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v13 = 0;
  v14 = 0;
  v12 = 0;
  v9 = *(_QWORD *)(a1 + 240);
  v11 = 0;
  result = _NSLayoutNodeCalculateMemoryUsage(*(_QWORD *)(v9 + 240), &v14, &v13, &v12, &v11);
  if (a2)
    *a2 = v14;
  if (a3)
    *a3 = v13;
  if (a4)
    *a4 = v12;
  if (a5)
    *a5 = v11;
  return result;
}

void *_NSLayoutTreeDescription(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSUInteger *v5;
  NSRange v7;

  v2 = (void *)MEMORY[0x1E0CB37A0];
  v3 = objc_opt_class();
  v4 = (void *)objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@: %p>\n%@\n"), v3, a1, _NSLayoutTreeSummaryDescription(a1));
  v5 = *(NSUInteger **)(*(_QWORD *)(a1 + 240) + 248);
  v7.location = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256);
  v7.length = *v5;
  objc_msgSend(v4, "appendFormat:", CFSTR("Current node %p glyph range %@\nRoot "), v5, NSStringFromRange(v7));
  _NSLayoutNodeDescribe(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 240), v4, 0);
  return v4;
}

uint64_t _NSLayoutNodeDescribe(uint64_t result, void *a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v5;
  uint64_t v6;
  unint64_t **v7;
  CGFloat *v8;
  uint64_t v9;
  CGFloat v10;
  CGFloat v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t i;
  uint64_t j;
  CGFloat *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  NSString *v26;
  unint64_t *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  CGFloat *v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  NSString *v42;
  const __CFString *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  double *v59;
  unint64_t *v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  int v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  double *v74;
  const __CFString *v75;
  _QWORD *v76;
  unint64_t v77;
  unint64_t *v78;
  _QWORD *v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t *v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  _QWORD *v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  const __CFString *v96;
  unint64_t v97;
  NSPoint v98;
  NSPoint v99;
  NSRect v100;
  NSRect v101;
  NSRect v102;
  NSRect v103;

  if (!result)
    return result;
  v3 = a3;
  v5 = (_QWORD *)result;
  if (a3)
  {
    v6 = a3;
    do
    {
      objc_msgSend(a2, "appendString:", CFSTR("  "));
      --v6;
    }
    while (v6);
  }
  v7 = (unint64_t **)(v5 + 3);
  if (!*((_BYTE *)v5 + 59))
  {
    for (i = 0; i != 3; ++i)
    {
      if (!v5[i + 3])
        break;
    }
    objc_msgSend(a2, "appendFormat:", CFSTR("Internal node %p with %lu glyphs, %lu children, offset %g, flags 0x%x\n"), v5, *v5, i, v5[1], *((unsigned __int8 *)v5 + 56));
    for (j = 0; j != 3; ++j)
      result = _NSLayoutNodeDescribe(v7[j], a2, v3 + 1);
    return result;
  }
  if (!*v7)
    return objc_msgSend(a2, "appendFormat:", CFSTR("Leaf node %p with %lu glyphs (not laid), offset %g, flags 0x%x\n"), v5, *v5, v5[1], *((unsigned __int8 *)v5 + 56));
  v8 = (CGFloat *)MEMORY[0x1E0CB3430];
  v97 = *v5;
  objc_msgSend(a2, "appendFormat:", CFSTR("Leaf node %p with %lu glyphs (laid), offset %g, flags 0x%x\n"), v5, *v5, v5[1], *((unsigned __int8 *)v5 + 56));
  if (v3)
  {
    v9 = v3;
    do
    {
      objc_msgSend(a2, "appendString:", CFSTR("  "));
      --v9;
    }
    while (v9);
  }
  v10 = *v8;
  v11 = v8[1];
  objc_msgSend(a2, "appendFormat:", CFSTR("  %lu fragments out of %lu"), **v7, (*v7)[1]);
  v12 = 0;
  v13 = (uint64_t)(*v7 + 4);
  v14 = **v7;
  v15 = v14 - 1;
  while (1)
  {
    v16 = (v12 + v15) >> 1;
    v17 = *(_QWORD *)(v13 + 80 * v16) & 0x8FFFFFFFFFFFFFFFLL;
    if (!v17)
      break;
    v15 = v16 - 1;
LABEL_15:
    if (v15 < v12)
    {
LABEL_16:
      v18 = *(_QWORD *)(80 * v16 + v13 + 80) & 0x8FFFFFFFFFFFFFFFLL;
      goto LABEL_25;
    }
  }
  v12 = v16 + 1;
  if (v16 + 1 < v14)
  {
    if ((*(_QWORD *)(v13 + 80 * v12) & 0x8FFFFFFFFFFFFFFFLL) != 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  v18 = v97;
LABEL_25:
  v21 = (CGFloat *)(v13 + 80 * v16);
  v100.origin.x = v21[6];
  v100.size.width = v21[8];
  v100.size.height = v21[9];
  v100.origin.y = v21[7] + 0.0;
  v22 = v21[2];
  v23 = v21[4];
  v24 = v21[5];
  v25 = v21[3] + 0.0;
  v26 = NSStringFromRect(v100);
  v101.origin.x = v22;
  v101.origin.y = v25;
  v101.size.width = v23;
  v101.size.height = v24;
  objc_msgSend(a2, "appendFormat:", CFSTR(" (8-float) <%lu:%@/%@"), v17, v26, NSStringFromRect(v101));
  v27 = *v7;
  v28 = **v7;
  if (v28 < 2)
    goto LABEL_39;
  v29 = v18 - v17;
  v30 = 1;
  while (2)
  {
    v31 = 0;
    v32 = v29 + v17;
    v33 = v27 + 4;
    v34 = v28 - 1;
    while (2)
    {
      v35 = (v31 + v34) >> 1;
      v17 = v33[10 * v35] & 0x8FFFFFFFFFFFFFFFLL;
      if (v17 > v32)
      {
        v34 = v35 - 1;
        goto LABEL_32;
      }
      v31 = v35 + 1;
      if (v35 + 1 < v28)
      {
        if ((v33[10 * v31] & 0x8FFFFFFFFFFFFFFFLL) > v32)
          goto LABEL_33;
LABEL_32:
        if (v34 < v31)
        {
LABEL_33:
          v36 = v33[10 * v35 + 10] & 0x8FFFFFFFFFFFFFFFLL;
          goto LABEL_35;
        }
        continue;
      }
      break;
    }
    v36 = v97;
LABEL_35:
    v37 = (CGFloat *)&v33[10 * v35];
    v102.origin.x = v37[6];
    v102.size.width = v37[8];
    v102.size.height = v37[9];
    v102.origin.y = v37[7] + 0.0;
    v38 = v37[2];
    v39 = v37[4];
    v40 = v37[5];
    v41 = v37[3] + 0.0;
    v42 = NSStringFromRect(v102);
    v103.origin.x = v38;
    v103.origin.y = v41;
    v103.size.width = v39;
    v103.size.height = v40;
    objc_msgSend(a2, "appendFormat:", CFSTR(" %lu:%@/%@"), v17, v42, NSStringFromRect(v103));
    v27 = *v7;
    v28 = **v7;
    if (v30 <= 0x3E)
    {
      v29 = v36 - v17;
      if (++v30 < v28)
        continue;
    }
    break;
  }
  if (v28 > 0x40)
  {
    v43 = CFSTR("...>\n");
    goto LABEL_40;
  }
LABEL_39:
  v43 = CFSTR(">\n");
LABEL_40:
  result = objc_msgSend(a2, "appendString:", v43);
  v44 = (_QWORD *)v5[4];
  if (!v44)
    goto LABEL_89;
  if (v3)
  {
    v45 = v3;
    do
    {
      objc_msgSend(a2, "appendString:", CFSTR("  "));
      --v45;
    }
    while (v45);
    v44 = (_QWORD *)v5[4];
  }
  objc_msgSend(a2, "appendFormat:", CFSTR("  %lu locations out of %lu"), *v44, v44[1]);
  v46 = 0;
  v47 = (unint64_t *)v5[4];
  v48 = *((unsigned __int8 *)v5 + 58);
  v49 = 24;
  if (v48 != 1)
    v49 = 0;
  v50 = 16;
  if (*((_BYTE *)v5 + 58))
    v50 = v49;
  v53 = *v47;
  v51 = v47 + 2;
  v52 = v53;
  v54 = v53 - 1;
  while (2)
  {
    v55 = (v46 + v54) >> 1;
    v56 = *(_QWORD *)((char *)v51 + v55 * v50) & 0x8FFFFFFFFFFFFFFFLL;
    if (v56)
    {
      v54 = v55 - 1;
      goto LABEL_54;
    }
    v46 = v55 + 1;
    if (v55 + 1 < v52)
    {
      v57 = v46 * v50;
      if ((*(_QWORD *)((char *)v51 + v46 * v50) & 0x8FFFFFFFFFFFFFFFLL) != 0)
        goto LABEL_56;
LABEL_54:
      if (v54 < v46)
      {
        v57 = v50 + v50 * v55;
LABEL_56:
        v58 = *(_QWORD *)((char *)v51 + v57) & 0x8FFFFFFFFFFFFFFFLL;
        goto LABEL_58;
      }
      continue;
    }
    break;
  }
  v58 = v97;
LABEL_58:
  if (v48 == 1)
  {
    v59 = (double *)&v51[3 * v55];
    v10 = v59[1];
    v11 = v59[2];
  }
  else if (!*((_BYTE *)v5 + 58))
  {
    v10 = *(double *)&v51[2 * v55 + 1];
    v11 = 0.0;
  }
  v98.x = v10;
  v98.y = v11;
  objc_msgSend(a2, "appendFormat:", CFSTR(" (2-float) <%lu:%@"), v56, NSStringFromPoint(v98));
  v60 = (unint64_t *)v5[4];
  v61 = *v60;
  if (*v60 < 2)
    goto LABEL_87;
  v62 = v58 - v56;
  v63 = 1;
  while (2)
  {
    v64 = 0;
    v65 = *((unsigned __int8 *)v5 + 58);
    v66 = v62 + v56;
    if (v65 == 1)
      v67 = 24;
    else
      v67 = 0;
    if (*((_BYTE *)v5 + 58))
      v68 = v67;
    else
      v68 = 16;
    v69 = v60 + 2;
    v70 = v61 - 1;
    while (2)
    {
      v71 = (v64 + v70) >> 1;
      v56 = *(_QWORD *)((char *)v69 + v71 * v68) & 0x8FFFFFFFFFFFFFFFLL;
      if (v56 > v66)
      {
        v70 = v71 - 1;
        goto LABEL_75;
      }
      v64 = v71 + 1;
      if (v71 + 1 < v61)
      {
        v72 = v64 * v68;
        if ((*(_QWORD *)((char *)v69 + v64 * v68) & 0x8FFFFFFFFFFFFFFFLL) > v66)
          goto LABEL_77;
LABEL_75:
        if (v70 < v64)
        {
          v72 = v68 + v68 * v71;
LABEL_77:
          v73 = *(_QWORD *)((char *)v69 + v72) & 0x8FFFFFFFFFFFFFFFLL;
          goto LABEL_79;
        }
        continue;
      }
      break;
    }
    v73 = v97;
LABEL_79:
    if (v65 == 1)
    {
      v74 = (double *)&v69[3 * v71];
      v10 = v74[1];
      v11 = v74[2];
    }
    else if (!*((_BYTE *)v5 + 58))
    {
      v10 = *(double *)&v69[2 * v71 + 1];
      v11 = 0.0;
    }
    v99.x = v10;
    v99.y = v11;
    objc_msgSend(a2, "appendFormat:", CFSTR(" %lu:%@"), v56, NSStringFromPoint(v99));
    v60 = (unint64_t *)v5[4];
    v61 = *v60;
    if (v63 <= 0x3E)
    {
      v62 = v73 - v56;
      if (++v63 < v61)
        continue;
    }
    break;
  }
  if (v61 > 0x40)
  {
    v75 = CFSTR("...>\n");
    goto LABEL_88;
  }
LABEL_87:
  v75 = CFSTR(">\n");
LABEL_88:
  result = objc_msgSend(a2, "appendString:", v75);
LABEL_89:
  v76 = (_QWORD *)v5[5];
  if (!v76)
    return result;
  if (v3)
  {
    do
    {
      objc_msgSend(a2, "appendString:", CFSTR("  "));
      --v3;
    }
    while (v3);
    v76 = (_QWORD *)v5[5];
  }
  objc_msgSend(a2, "appendFormat:", CFSTR("  %lu attachment sizes out of %lu ("), *v76, v76[1]);
  v77 = 0;
  v78 = (unint64_t *)v5[5];
  v81 = *v78;
  v79 = v78 + 2;
  v80 = v81;
  v82 = v81 - 1;
  while (2)
  {
    v83 = (v77 + v82) >> 1;
    v84 = v79[3 * v83] & 0x8FFFFFFFFFFFFFFFLL;
    if (v84)
    {
      v82 = v83 - 1;
      goto LABEL_98;
    }
    v77 = v83 + 1;
    if (v83 + 1 < v80)
    {
      if ((v79[3 * v77] & 0x8FFFFFFFFFFFFFFFLL) != 0)
        goto LABEL_99;
LABEL_98:
      if (v82 < v77)
      {
LABEL_99:
        v85 = v79[3 * v83 + 3] & 0x8FFFFFFFFFFFFFFFLL;
        goto LABEL_102;
      }
      continue;
    }
    break;
  }
  v85 = v97;
LABEL_102:
  objc_msgSend(a2, "appendFormat:", CFSTR("%lu:%@"), v84, NSStringFromSize(*(NSSize *)&v79[3 * v83 + 1]));
  v86 = (unint64_t *)v5[5];
  v87 = *v86;
  if (*v86 < 2)
    goto LABEL_116;
  v88 = v85 - v84;
  v89 = 1;
  while (2)
  {
    v90 = 0;
    v91 = v88 + v84;
    v92 = v86 + 2;
    v93 = v87 - 1;
    while (2)
    {
      v94 = (v90 + v93) >> 1;
      v84 = v92[3 * v94] & 0x8FFFFFFFFFFFFFFFLL;
      if (v84 > v91)
      {
        v93 = v94 - 1;
        goto LABEL_109;
      }
      v90 = v94 + 1;
      if (v94 + 1 < v87)
      {
        if ((v92[3 * v90] & 0x8FFFFFFFFFFFFFFFLL) > v91)
          goto LABEL_110;
LABEL_109:
        if (v93 < v90)
        {
LABEL_110:
          v95 = v92[3 * v94 + 3] & 0x8FFFFFFFFFFFFFFFLL;
          goto LABEL_112;
        }
        continue;
      }
      break;
    }
    v95 = v97;
LABEL_112:
    objc_msgSend(a2, "appendFormat:", CFSTR(" %lu:%@"), v84, NSStringFromSize(*(NSSize *)&v92[3 * v94 + 1]));
    v86 = (unint64_t *)v5[5];
    v87 = *v86;
    if (v89 <= 0x3E)
    {
      v88 = v95 - v84;
      if (++v89 < v87)
        continue;
    }
    break;
  }
  if (v87 >= 0x41)
  {
    v96 = CFSTR("...)\n");
    return objc_msgSend(a2, "appendString:", v96);
  }
LABEL_116:
  v96 = CFSTR(")\n");
  return objc_msgSend(a2, "appendString:", v96);
}

void _NSLayoutTreeLogDebug(NSString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if ((unint64_t)_NSLayoutTreeLogDebug_logCount <= 0xF)
  {
    ++_NSLayoutTreeLogDebug_logCount;
    NSLogv(a1, &a9);
    if ((unint64_t)_NSLayoutTreeLogDebug_logCount >= 0x10)
      NSLog((NSString *)CFSTR("!!! Suppressing further NSLayoutTree logs"));
  }
}

uint64_t _NSLayoutNodeCalculateMemoryUsage(uint64_t result, _QWORD *a2, uint64_t *a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;

  if (result)
  {
    ++*a2;
    v9 = *a3;
    *a3 += 64;
    v10 = result + 24;
    if (*(_BYTE *)(result + 59))
    {
      if (*(_QWORD *)v10)
      {
        *a3 = v9 + 80 * *(_QWORD *)(*(_QWORD *)v10 + 8) + 96;
        *a4 += *(_QWORD *)result;
        *a5 += **(_QWORD **)(result + 24);
      }
      v11 = *(_QWORD *)(result + 32);
      if (v11)
      {
        v12 = *(unsigned __int8 *)(result + 58);
        v13 = 24;
        if (v12 != 1)
          v13 = 0;
        v14 = v12 == 0;
        v15 = 16;
        if (!v14)
          v15 = v13;
        v16 = *a3 + v15 * *(_QWORD *)(v11 + 8) + 16;
        *a3 = v16;
        if (*(_QWORD *)(result + 40))
          *a3 = v16 + 24 * *(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 16;
      }
    }
    else
    {
      for (i = 0; i != 24; i += 8)
        result = _NSLayoutNodeCalculateMemoryUsage(*(_QWORD *)(v10 + i), a2, a3, a4, a5);
    }
  }
  return result;
}

uint64_t _NSLayoutTreeSetGlyphsPerLineEstimate(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = 64;
  if (a2)
    v2 = a2;
  *(_QWORD *)(*(_QWORD *)(result + 240) + 336) = v2;
  return result;
}

uint64_t _NSLayoutTreeSetOffsetPerLineEstimate(uint64_t result, double a2)
{
  if (a2 <= 0.0)
    a2 = 14.0;
  *(double *)(*(_QWORD *)(result + 240) + 344) = a2;
  return result;
}

void _NSLayoutTreeGetBaselineOffsetForGlyphAtIndex(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  if (_NSLayoutTreeMoveToGlyphIndex(a1, a2))
  {
    if (!a3)
      return;
    v13 = *(unint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) + 24);
    if (v13)
    {
      v14 = 0;
      v15 = a2 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256);
      v18 = *v13;
      v16 = v13 + 4;
      v17 = v18;
      v19 = v18 - 1;
      while (1)
      {
        v20 = (v14 + v19) >> 1;
        if ((v16[10 * v20] & 0x8FFFFFFFFFFFFFFFLL) <= v15)
        {
          v14 = v20 + 1;
          if (v20 + 1 >= v17 || (v16[10 * v14] & 0x8FFFFFFFFFFFFFFFLL) > v15)
          {
LABEL_10:
            *a3 = v16[10 * v20 + 1];
            return;
          }
        }
        else
        {
          v19 = v20 - 1;
        }
        if (v19 < v14)
          goto LABEL_10;
      }
    }
    *a3 = 0;
  }
  else
  {
    _NSLayoutTreeLogDebug((NSString *)CFSTR("!!! _NSLayoutTreeGetBaselineOffsetForGlyphAtIndex invalid glyph index %lu"), v6, v7, v8, v9, v10, v11, v12, a2);
  }
}

BOOL _NSLayoutTreeHasFragmentsForGlyphAtIndex(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  _BOOL8 result;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;

  result = _NSLayoutTreeMoveToGlyphIndex(a1, a2);
  if (!result)
  {
    v8 = 0;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    if (!a3)
      return result;
    goto LABEL_5;
  }
  v7 = *(uint64_t **)(*(_QWORD *)(a1 + 240) + 248);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256);
  v8 = *v7;
  result = v7[3] != 0;
  if (a3)
  {
LABEL_5:
    *a3 = v6;
    a3[1] = v8;
  }
  return result;
}

double _NSLayoutTreeRunLocationForGlyphAtIndex(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t *v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;

  v6 = *MEMORY[0x1E0CB3430];
  if (!_NSLayoutTreeMoveToGlyphIndex(a1, a2))
  {
    _NSLayoutTreeLogDebug((NSString *)CFSTR("!!! _NSLayoutTreeRunLocationForGlyphAtIndex invalid glyph index %lu"), v7, v8, v9, v10, v11, v12, v13, a2);
    return v6;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 248);
  v15 = *(unint64_t **)(v14 + 32);
  if (!v15)
  {
    v30 = *(unint64_t **)(v14 + 24);
    if (!v30)
    {
      if (a3)
      {
        v41 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256);
        v42 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 336);
        v43 = v41 + (a2 - v41) / v42 * v42;
        v44 = *(_QWORD *)v14 + v41;
        if (v43 + v42 <= v44)
          v45 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 336);
        else
          v45 = v44 - v43;
        *a3 = v43;
        a3[1] = v45;
      }
      return v6;
    }
    if (!a3)
      return v6;
    v31 = 0;
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256);
    v33 = *(_QWORD *)v14;
    v34 = a2 - v32;
    v37 = *v30;
    v35 = v30 + 4;
    v36 = v37;
    v38 = v37 - 1;
    while (1)
    {
      v39 = (v31 + v38) >> 1;
      v40 = v35[10 * v39] & 0x8FFFFFFFFFFFFFFFLL;
      if (v40 <= v34)
      {
        v31 = v39 + 1;
        if (v39 + 1 >= v36)
          goto LABEL_26;
        if ((v35[10 * v31] & 0x8FFFFFFFFFFFFFFFLL) > v34)
        {
LABEL_25:
          v33 = v35[10 * v39 + 10] & 0x8FFFFFFFFFFFFFFFLL;
LABEL_26:
          *a3 = v40 + v32;
          a3[1] = v33 - v40;
          return v6;
        }
      }
      else
      {
        v38 = v39 - 1;
      }
      if (v38 < v31)
        goto LABEL_25;
    }
  }
  v16 = 0;
  v17 = *(unsigned __int8 *)(v14 + 58);
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256);
  v19 = *(_QWORD *)v14;
  v20 = a2 - v18;
  v21 = 24;
  if (v17 != 1)
    v21 = 0;
  v22 = 16;
  if (v17)
    v22 = v21;
  v25 = *v15;
  v23 = v15 + 2;
  v24 = v25;
  v26 = v25 - 1;
  while (1)
  {
    v27 = (v16 + v26) >> 1;
    v28 = *(_QWORD *)((char *)v23 + v27 * v22) & 0x8FFFFFFFFFFFFFFFLL;
    if (v28 <= v20)
      break;
    v26 = v27 - 1;
LABEL_12:
    if (v26 < v16)
    {
LABEL_13:
      if (!a3)
        goto LABEL_29;
      v19 = *(_QWORD *)((char *)v23 + v22 + v22 * v27) & 0x8FFFFFFFFFFFFFFFLL;
      goto LABEL_28;
    }
  }
  v16 = v27 + 1;
  if (v27 + 1 < v24)
  {
    if ((*(_QWORD *)((char *)v23 + v16 * v22) & 0x8FFFFFFFFFFFFFFFLL) > v20)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (!a3)
    goto LABEL_29;
LABEL_28:
  *a3 = v28 + v18;
  a3[1] = v19 - v28;
LABEL_29:
  if (v17 == 1)
    return *(double *)&v23[3 * v27 + 1];
  if (!v17)
    return *(double *)&v23[2 * v27 + 1];
  return v6;
}

double _NSLayoutTreeAttachmentSizeForGlyphAtIndex(uint64_t a1, unint64_t a2)
{
  double v2;
  unint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v2 = -1.0;
  if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 240) + 56) & 8) != 0 && _NSLayoutTreeMoveToGlyphIndex(a1, a2))
  {
    v5 = *(unint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) + 40);
    if (v5)
    {
      v6 = 0;
      v7 = a2 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256);
      v10 = *v5;
      v8 = v5 + 2;
      v9 = v10;
      v11 = v10 - 1;
      while (1)
      {
        v12 = (v6 + v11) >> 1;
        if ((v8[3 * v12] & 0x8FFFFFFFFFFFFFFFLL) <= v7)
        {
          v6 = v12 + 1;
          if (v12 + 1 >= v9 || (v8[3 * v6] & 0x8FFFFFFFFFFFFFFFLL) > v7)
            return *(double *)&v8[3 * v12 + 1];
        }
        else
        {
          v11 = v12 - 1;
        }
        if (v11 < v6)
          return *(double *)&v8[3 * v12 + 1];
      }
    }
  }
  return v2;
}

BOOL _NSLayoutTreeLineFragmentDrawsOutsideLineForGlyphAtIndex(uint64_t a1, unint64_t a2)
{
  _BOOL8 result;
  unint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 240) + 56) & 0x10) == 0)
    return 0;
  result = _NSLayoutTreeMoveToGlyphIndex(a1, a2);
  if (!result)
    return result;
  v5 = *(unint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) + 24);
  if (!v5)
    return 0;
  v6 = 0;
  v7 = a2 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256);
  v10 = *v5;
  v8 = v5 + 4;
  v9 = v10;
  v11 = v10 - 1;
  while (1)
  {
    v12 = (v6 + v11) >> 1;
    v13 = v8[10 * v12];
    if ((v13 & 0x8FFFFFFFFFFFFFFFLL) <= v7)
      break;
    v11 = v12 - 1;
LABEL_10:
    if (v11 < v6)
      return (v13 >> 60) & 1;
  }
  v6 = v12 + 1;
  if (v12 + 1 < v9 && (v8[10 * v6] & 0x8FFFFFFFFFFFFFFFLL) <= v7)
    goto LABEL_10;
  return (v13 >> 60) & 1;
}

BOOL _NSLayoutTreeOutsideDrawsUponLineFragmentForGlyphAtIndex(uint64_t a1, unint64_t a2)
{
  _BOOL8 result;
  unint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 240) + 56) & 0x20) == 0)
    return 0;
  result = _NSLayoutTreeMoveToGlyphIndex(a1, a2);
  if (!result)
    return result;
  v5 = *(unint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) + 24);
  if (!v5)
    return 0;
  v6 = 0;
  v7 = a2 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256);
  v10 = *v5;
  v8 = v5 + 4;
  v9 = v10;
  v11 = v10 - 1;
  while (1)
  {
    v12 = (v6 + v11) >> 1;
    v13 = v8[10 * v12];
    if ((v13 & 0x8FFFFFFFFFFFFFFFLL) <= v7)
      break;
    v11 = v12 - 1;
LABEL_10:
    if (v11 < v6)
      return (v13 >> 61) & 1;
  }
  v6 = v12 + 1;
  if (v12 + 1 < v9 && (v8[10 * v6] & 0x8FFFFFFFFFFFFFFFLL) <= v7)
    goto LABEL_10;
  return (v13 >> 61) & 1;
}

uint64_t _NSLayoutTreeGetExtraLineFragmentRect(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  double v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t *v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  double *v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;

  v5 = *(_QWORD *)(*(_QWORD *)(result + 240) + 272);
  v6 = *(double *)(*(_QWORD *)(result + 240) + 280);
  v7 = *(_QWORD *)(*(_QWORD *)(result + 240) + 304);
  v8 = *(double *)(*(_QWORD *)(result + 240) + 312);
  v26 = *(_OWORD *)(*(_QWORD *)(result + 240) + 320);
  v27 = *(_OWORD *)(*(_QWORD *)(result + 240) + 288);
  v9 = **(_QWORD **)(*(_QWORD *)(result + 240) + 240);
  v10 = 0.0;
  if (v9)
  {
    v11 = result;
    v12 = v9 - 1;
    result = _NSLayoutTreeMoveToGlyphIndex(result, v9 - 1);
    if ((_DWORD)result)
    {
      v13 = *(_QWORD *)(*(_QWORD *)(v11 + 240) + 256);
      v14 = *(unint64_t **)(*(_QWORD *)(*(_QWORD *)(v11 + 240) + 248) + 24);
      v15 = *(double *)(*(_QWORD *)(v11 + 240) + 264);
      if (v14)
      {
        v16 = 0;
        v17 = v12 - v13;
        v20 = *v14;
        v18 = v14 + 4;
        v19 = v20;
        v21 = v20 - 1;
        while (1)
        {
          v22 = (v16 + v21) >> 1;
          if ((v18[10 * v22] & 0x8FFFFFFFFFFFFFFFLL) <= v17)
          {
            v16 = v22 + 1;
            if (v22 + 1 >= v19 || (v18[10 * v16] & 0x8FFFFFFFFFFFFFFFLL) > v17)
            {
LABEL_10:
              v23 = (double *)&v18[10 * v22];
              v24 = v23[9];
              v25 = v15 + v23[7];
              goto LABEL_12;
            }
          }
          else
          {
            v21 = v22 - 1;
          }
          if (v21 < v16)
            goto LABEL_10;
        }
      }
      v24 = *(double *)(*(_QWORD *)(v11 + 240) + 344);
      v25 = v15 + (double)((unint64_t)(v12 - v13) / *(_QWORD *)(*(_QWORD *)(v11 + 240) + 336)) * v24;
LABEL_12:
      v10 = v25 + v24;
    }
  }
  if (a2)
  {
    *(_QWORD *)a2 = v5;
    *(double *)(a2 + 8) = v6 + v10;
    *(_OWORD *)(a2 + 16) = v27;
  }
  if (a3)
  {
    *(_QWORD *)a3 = v7;
    *(double *)(a3 + 8) = v8 + v10;
    *(_OWORD *)(a3 + 16) = v26;
  }
  return result;
}

double *_NSLayoutNodeCreateSubNode(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, double a5)
{
  unint64_t v10;
  double *v11;
  double *v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *SubRange;
  _QWORD *v21;
  uint64_t v22;
  double v23;
  double *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t *v29;

  v10 = *(_QWORD *)a1;
  v11 = (double *)malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
  v12 = v11;
  *((_BYTE *)v11 + 59) = 1;
  *(_QWORD *)v11 = a3;
  v13 = a3 - 1;
  if (!a3)
    v13 = 0;
  v11[1] = (double)(v13 / a4 + 1) * a5;
  *((_BYTE *)v11 + 56) = a3 != 0;
  *((_BYTE *)v11 + 56) = *(_BYTE *)(a1 + 56);
  v14 = *(unint64_t **)(a1 + 24);
  if (v14)
  {
    v15 = 0;
    v16 = v14 + 4;
    v17 = *v14 - 1;
    while (1)
    {
      v18 = v15 + v17;
      v19 = (v15 + v17) >> 1;
      if ((v16[10 * v19] & 0x8FFFFFFFFFFFFFFFLL) <= a2)
      {
        v15 = v19 + 1;
        if (v19 + 1 >= *v14 || (v16[10 * v15] & 0x8FFFFFFFFFFFFFFFLL) > a2)
        {
LABEL_10:
          if (v18 > 1)
          {
            v23 = *(double *)&v16[10 * v19 - 3] + *(double *)&v16[10 * v19 - 1];
            SubRange = _NSGlyphRangeListCreateSubRange(v14, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedFragmentCapacity, v10, 32, 80, a2, a3);
            v21 = SubRange + 4;
            v22 = *SubRange;
            if (v23 != 0.0 && v22 != 0)
            {
              v25 = (double *)(SubRange + 11);
              v26 = *SubRange;
              do
              {
                *v25 = *v25 - v23;
                *(v25 - 4) = *(v25 - 4) - v23;
                v25 += 10;
                --v26;
              }
              while (v26);
            }
          }
          else
          {
            SubRange = _NSGlyphRangeListCreateSubRange(v14, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedFragmentCapacity, v10, 32, 80, a2, a3);
            v21 = SubRange + 4;
            v22 = *SubRange;
          }
          v12[1] = *(double *)&v21[10 * v22 - 3] + *(double *)&v21[10 * v22 - 1];
          *((_QWORD *)v12 + 3) = SubRange;
          break;
        }
      }
      else
      {
        v17 = v19 - 1;
      }
      if (v17 < v15)
        goto LABEL_10;
    }
  }
  if (*(_QWORD *)(a1 + 32))
  {
    *((_BYTE *)v12 + 58) = *(_BYTE *)(a1 + 58);
    v27 = 24;
    if (*(_BYTE *)(a1 + 58) != 1)
      v27 = 0;
    if (*(_BYTE *)(a1 + 58))
      v28 = v27;
    else
      v28 = 16;
    *((_QWORD *)v12 + 4) = _NSGlyphRangeListCreateSubRange(*(unint64_t **)(a1 + 32), (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedLocationCapacity, v10, 16, v28, a2, a3);
  }
  v29 = *(unint64_t **)(a1 + 40);
  if (v29)
    *((_QWORD *)v12 + 5) = _NSGlyphRangeListCreateSubRange(v29, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedAttachmentSizeCapacity, v10, 16, 24, a2, a3);
  return v12;
}

uint64_t _NSLayoutNodeTruncate(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, double a5)
{
  unint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  double v19;
  double *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;

  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD **)(a1 + 24);
  if (v9)
  {
    v10 = 0;
    v11 = v9 + 4;
    v12 = *v9 - 1;
    while (1)
    {
      v13 = v10 + v12;
      v14 = (v10 + v12) >> 1;
      if ((v11[10 * v14] & 0x8FFFFFFFFFFFFFFFLL) <= a2)
      {
        v10 = v14 + 1;
        if (v14 + 1 >= *v9 || (v11[10 * v10] & 0x8FFFFFFFFFFFFFFFLL) > a2)
        {
LABEL_8:
          if (v13 > 1)
          {
            v19 = *(double *)&v11[10 * v14 - 3] + *(double *)&v11[10 * v14 - 1];
            v15 = _NSGlyphRangeListTruncate(v9, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedFragmentCapacity, v8, 32, 80, a2, a3);
            v16 = v15 + 4;
            v17 = *v15;
            if (v19 != 0.0 && v17 != 0)
            {
              v21 = (double *)(v15 + 11);
              v22 = *v15;
              do
              {
                *v21 = *v21 - v19;
                *(v21 - 4) = *(v21 - 4) - v19;
                v21 += 10;
                --v22;
              }
              while (v22);
            }
          }
          else
          {
            v15 = _NSGlyphRangeListTruncate(v9, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedFragmentCapacity, v8, 32, 80, a2, a3);
            v16 = v15 + 4;
            v17 = *v15;
          }
          *(double *)(a1 + 8) = *(double *)&v16[10 * v17 - 3] + *(double *)&v16[10 * v17 - 1];
          *(_QWORD *)(a1 + 24) = v15;
          goto LABEL_20;
        }
      }
      else
      {
        v12 = v14 - 1;
      }
      if (v12 < v10)
        goto LABEL_8;
    }
  }
  v18 = a3 - 1;
  if (!a3)
    v18 = 0;
  *(double *)(a1 + 8) = (double)(v18 / a4 + 1) * a5;
LABEL_20:
  v23 = *(_QWORD **)(a1 + 32);
  if (v23)
  {
    v24 = 24;
    if (*(_BYTE *)(a1 + 58) != 1)
      v24 = 0;
    if (*(_BYTE *)(a1 + 58))
      v25 = v24;
    else
      v25 = 16;
    *(_QWORD *)(a1 + 32) = _NSGlyphRangeListTruncate(v23, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedLocationCapacity, v8, 16, v25, a2, a3);
  }
  v26 = *(_QWORD **)(a1 + 40);
  if (v26)
    *(_QWORD *)(a1 + 40) = _NSGlyphRangeListTruncate(v26, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedAttachmentSizeCapacity, v8, 16, 24, a2, a3);
  *(_QWORD *)a1 = a3;
  return _NSLayoutNodeSetInvariants(a1);
}

uint64_t _NSLayoutNodeInvalidate(uint64_t a1, uint64_t a2, unint64_t a3, double a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  if (!*(_BYTE *)(a1 + 59))
  {
    v8 = 0;
    v9 = a1 + 24;
    do
    {
      v10 = *(_QWORD *)(v9 + v8);
      if (v10)
      {
        _NSLayoutNodeFree(v10);
        *(_QWORD *)(v9 + v8) = 0;
      }
      v8 += 8;
    }
    while (v8 != 24);
  }
  *(_BYTE *)(a1 + 59) = 1;
  *(_QWORD *)a1 = a2;
  v11 = a2 - 1;
  if (!a2)
    v11 = 0;
  *(double *)(a1 + 8) = (double)(v11 / a3 + 1) * a4;
  *(_BYTE *)(a1 + 56) = a2 != 0;
  v12 = *(void **)(a1 + 24);
  if (v12)
  {
    free(v12);
    *(_QWORD *)(a1 + 24) = 0;
  }
  v13 = *(void **)(a1 + 32);
  if (v13)
  {
    free(v13);
    *(_QWORD *)(a1 + 32) = 0;
    *(_BYTE *)(a1 + 58) = 0;
  }
  v14 = *(void **)(a1 + 40);
  if (v14)
  {
    free(v14);
    *(_QWORD *)(a1 + 40) = 0;
  }
  return _NSLayoutNodeSetInvariants(a1);
}

double _NSLayoutTreeInsertNodeBeforeCurrentNode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  __int128 v21;
  __int128 v22;
  _QWORD *v23;
  uint64_t v24;
  unint64_t v25;
  double result;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = *(_QWORD *)(a1 + 240);
  if (!a2)
    goto LABEL_27;
  v11 = *(_QWORD **)(v10 + 248);
  if (!v11)
    goto LABEL_27;
  v27 = 0u;
  v28 = 0u;
  v12 = a2;
  while (1)
  {
    v13 = (_QWORD *)v11[2];
    if (!v13)
    {
      v23 = malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
      v23[1] = 0;
      v23[3] = v12;
      v23[4] = v11;
      *(_QWORD *)(v12 + 16) = v23;
      v11[2] = v23;
      _NSLayoutNodeSetInvariants((uint64_t)v23);
      *(_QWORD *)(*(_QWORD *)(a1 + 240) + 240) = v23;
      goto LABEL_26;
    }
    v14 = 0;
    while (1)
    {
      v15 = (_QWORD *)v13[v14 + 3];
      if (!v15)
        break;
      if (v11 == v15)
      {
        v15 = v11;
        break;
      }
      if (++v14 == 3)
      {
        v15 = 0;
        break;
      }
    }
    if (v11 != v15)
    {
      _NSLayoutTreeLogDebug((NSString *)CFSTR("!!! _NSLayoutTreeInsertNodeBeforeCurrentNode found broken link"), a2, a3, a4, a5, a6, a7, a8, v27);
      v13 = v11;
      v16 = (_QWORD *)v12;
      goto LABEL_20;
    }
    if (!v13[5])
      break;
    v17 = malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
    v16 = v17;
    v18 = 0;
    v17[1] = 0;
    do
    {
      *(_QWORD *)((char *)&v27 + v18 * 8) = v13[v18 + 3];
      v13[v18 + 3] = 0;
      ++v18;
    }
    while (v18 != 3);
    if (v14 <= 2)
    {
      v19 = 0;
      do
      {
        *((_QWORD *)&v28 + v19 + 1) = *((_QWORD *)&v27 + v19 + 2);
        v20 = v19 + 2;
        --v19;
      }
      while (v20 > v14);
    }
    *((_QWORD *)&v27 + v14) = v12;
    v21 = v27;
    v17[3] = v27;
    *(_QWORD *)(v21 + 16) = v17;
    v17[4] = *((_QWORD *)&v21 + 1);
    *(_QWORD *)(*((_QWORD *)&v21 + 1) + 16) = v17;
    _NSLayoutNodeSetInvariants((uint64_t)v17);
    v22 = v28;
    v13[3] = v28;
    *(_QWORD *)(v22 + 16) = v13;
    v13[4] = *((_QWORD *)&v22 + 1);
    *(_QWORD *)(*((_QWORD *)&v22 + 1) + 16) = v13;
    _NSLayoutNodeSetInvariants((uint64_t)v13);
    if (!v16)
      goto LABEL_26;
LABEL_20:
    v12 = (uint64_t)v16;
    v11 = v13;
  }
  if (v14 <= 1)
  {
    v24 = 0;
    do
    {
      v13[v24 + 5] = v13[v24 + 4];
      v25 = v24-- + 1;
    }
    while (v25 > v14);
  }
  v13[v14 + 3] = v12;
  *(_QWORD *)(v12 + 16) = v13;
  _NSLayoutNodeSetInvariants((uint64_t)v13);
LABEL_26:
  v10 = *(_QWORD *)(a1 + 240);
LABEL_27:
  *(_QWORD *)(v10 + 256) += *(_QWORD *)a2;
  result = *(double *)(a2 + 8) + *(double *)(*(_QWORD *)(a1 + 240) + 264);
  *(double *)(*(_QWORD *)(a1 + 240) + 264) = result;
  return result;
}

void _NSLayoutTreeSetAttachmentSizeForGlyphRange(uint64_t a1, unint64_t a2, uint64_t a3, double a4, double a5)
{
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t *v18;
  _QWORD *v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t *v28;
  _QWORD __src[3];

  if (a3)
  {
    if (_NSLayoutTreeMoveToGlyphIndex(a1, a2)
      && (v18 = *(unint64_t **)(*(_QWORD *)(a1 + 240) + 248),
          v17 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256),
          v11 = *v18,
          a2 + a3 <= *v18 + v17))
    {
      v19 = (_QWORD *)v18[5];
      if (!v19)
      {
        v20 = *MEMORY[0x1E0C85AD8] >> 3;
        if (v20 >= 0x2000)
          v20 = 0x2000;
        if (v20 <= 1)
          v20 = 1;
        if (*MEMORY[0x1E0C85AD8] >= 0x10uLL)
          v21 = 16;
        else
          v21 = v20;
        v22 = malloc_type_calloc(1uLL, 24 * v21 + 16, 0xF93562B6uLL);
        v18[5] = (unint64_t)v22;
        v22[1] = v21;
        **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) + 40) = 1;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) + 40) + 16) = 0;
        __asm { FMOV            V0.2D, #-1.0 }
        *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) + 40) + 24) = _Q0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) + 56) |= 8u;
        _NSLayoutNodeSetInvariants(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248));
        v28 = *(unint64_t **)(*(_QWORD *)(a1 + 240) + 248);
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256);
        v19 = (_QWORD *)v28[5];
        v11 = *v28;
      }
      __src[0] = a2 - v17;
      *(double *)&__src[1] = a4;
      *(double *)&__src[2] = a5;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) + 40) = _NSGlyphRangeListSet(v19, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedAttachmentSizeCapacity, v11, 16, 0x18uLL, a2 - v17, a3, __src);
    }
    else
    {
      _NSLayoutTreeLogDebug((NSString *)CFSTR("!!! _NSLayoutTreeSetAttachmentSizeForGlyphRange invalid glyph range {%lu, %lu}"), v10, v11, v12, v13, v14, v15, v16, a2);
    }
  }
}

void _NSLayoutTreeSetLineFragmentDrawsOutsideLineAtGlyphIndex(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;

  if (!_NSLayoutTreeMoveToGlyphIndex(a1, a2)
    || (v11 = *(unint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) + 24)) == 0)
  {
    _NSLayoutTreeLogDebug((NSString *)CFSTR("!!! _NSLayoutTreeSetLineFragmentDrawsOutsideLineAtGlyphIndex invalid glyph index %lu"), v4, v5, v6, v7, v8, v9, v10, a2);
    return;
  }
  v12 = 0;
  v13 = a2 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256);
  v16 = *v11;
  v14 = v11 + 4;
  v15 = v16;
  v17 = v16 - 1;
  v18 = v16 - 1;
  while (1)
  {
    v19 = (v12 + v18) >> 1;
    v20 = v14[10 * v19];
    if ((v20 & 0x8FFFFFFFFFFFFFFFLL) <= v13)
      break;
    v18 = v19 - 1;
LABEL_8:
    if (v18 < v12)
      goto LABEL_9;
  }
  v12 = v19 + 1;
  if (v19 + 1 < v15 && (v14[10 * v12] & 0x8FFFFFFFFFFFFFFFLL) <= v13)
    goto LABEL_8;
LABEL_9:
  if ((v20 & 0x1000000000000000) != 0)
    return;
  v21 = 0;
  while (2)
  {
    v22 = (v21 + v17) >> 1;
    v23 = v14[10 * v22] & 0x8FFFFFFFFFFFFFFFLL;
    if (v23 > v13)
    {
      v17 = v22 - 1;
      goto LABEL_15;
    }
    v21 = v22 + 1;
    if (v22 + 1 < v15 && (v14[10 * v21] & 0x8FFFFFFFFFFFFFFFLL) <= v13)
    {
LABEL_15:
      if (v17 < v21)
        break;
      continue;
    }
    break;
  }
  v14[10 * v22] = v20 & 0xE000000000000000 | v23 | 0x1000000000000000;
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 248);
  if ((*(_BYTE *)(v24 + 56) & 0x10) == 0)
  {
    *(_BYTE *)(v24 + 56) |= 0x10u;
    _NSLayoutNodeSetInvariants(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248));
  }
}

void _NSLayoutTreeSetOutsideDrawsUponLineFragmentAtGlyphIndex(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;

  if (!_NSLayoutTreeMoveToGlyphIndex(a1, a2)
    || (v11 = *(unint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) + 24)) == 0)
  {
    _NSLayoutTreeLogDebug((NSString *)CFSTR("!!! _NSLayoutTreeSetOutsideDrawsUponLineFragmentAtGlyphIndex invalid glyph index %lu"), v4, v5, v6, v7, v8, v9, v10, a2);
    return;
  }
  v12 = 0;
  v13 = a2 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256);
  v16 = *v11;
  v14 = v11 + 4;
  v15 = v16;
  v17 = v16 - 1;
  v18 = v16 - 1;
  while (1)
  {
    v19 = (v12 + v18) >> 1;
    v20 = v14[10 * v19];
    if ((v20 & 0x8FFFFFFFFFFFFFFFLL) <= v13)
      break;
    v18 = v19 - 1;
LABEL_8:
    if (v18 < v12)
      goto LABEL_9;
  }
  v12 = v19 + 1;
  if (v19 + 1 < v15 && (v14[10 * v12] & 0x8FFFFFFFFFFFFFFFLL) <= v13)
    goto LABEL_8;
LABEL_9:
  if ((v20 & 0x2000000000000000) != 0)
    return;
  v21 = 0;
  while (2)
  {
    v22 = (v21 + v17) >> 1;
    v23 = v14[10 * v22] & 0x8FFFFFFFFFFFFFFFLL;
    if (v23 > v13)
    {
      v17 = v22 - 1;
      goto LABEL_15;
    }
    v21 = v22 + 1;
    if (v22 + 1 < v15 && (v14[10 * v21] & 0x8FFFFFFFFFFFFFFFLL) <= v13)
    {
LABEL_15:
      if (v17 < v21)
        break;
      continue;
    }
    break;
  }
  v14[10 * v22] = v20 & 0xD000000000000000 | v23 | 0x2000000000000000;
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 248);
  if ((*(_BYTE *)(v24 + 56) & 0x20) == 0)
  {
    *(_BYTE *)(v24 + 56) |= 0x20u;
    _NSLayoutNodeSetInvariants(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248));
  }
}

unint64_t _NSLayoutTreeSetBlocksDependUponLineFragmentAtGlyphIndex(uint64_t a1, unint64_t a2)
{
  unint64_t result;
  unint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;

  result = _NSLayoutTreeMoveToGlyphIndex(a1, a2);
  if ((_DWORD)result)
  {
    v5 = *(unint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248) + 24);
    if (v5)
    {
      v6 = 0;
      v7 = a2 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 256);
      v10 = *v5;
      v8 = v5 + 4;
      v9 = v10;
      v11 = v10 - 1;
      v12 = v10 - 1;
      while (1)
      {
        result = (v6 + v12) >> 1;
        v13 = v8[10 * result];
        if ((v13 & 0x8FFFFFFFFFFFFFFFLL) <= v7)
        {
          v6 = result + 1;
          if (result + 1 >= v9 || (result = v8[10 * v6] & 0x8FFFFFFFFFFFFFFFLL, result > v7))
          {
LABEL_9:
            if ((v13 & 0x4000000000000000) != 0)
              return result;
            v14 = 0;
            while (1)
            {
              v15 = (v14 + v11) >> 1;
              result = v8[10 * v15] & 0x8FFFFFFFFFFFFFFFLL;
              if (result <= v7)
              {
                v14 = v15 + 1;
                if (v15 + 1 >= v9 || (v8[10 * v14] & 0x8FFFFFFFFFFFFFFFLL) > v7)
                {
LABEL_16:
                  v8[10 * v15] = v13 & 0xB000000000000000 | result | 0x4000000000000000;
                  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 248);
                  if ((*(_BYTE *)(v16 + 56) & 0x40) == 0)
                  {
                    *(_BYTE *)(v16 + 56) |= 0x40u;
                    return _NSLayoutNodeSetInvariants(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 248));
                  }
                  return result;
                }
              }
              else
              {
                v11 = v15 - 1;
              }
              if (v11 < v14)
                goto LABEL_16;
            }
          }
        }
        else
        {
          v12 = result - 1;
        }
        if (v12 < v6)
          goto LABEL_9;
      }
    }
  }
  return result;
}

_QWORD *_NSGlyphRangeListCreateSubRange(unint64_t *a1, uint64_t (*a2)(unint64_t), unint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  unint64_t v10;
  unint64_t v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t *v26;

  v10 = 0;
  v11 = *a1;
  v12 = (char *)a1 + a4;
  v13 = *a1 - 1;
  v14 = v13;
  while (1)
  {
    v15 = (v14 + v10) >> 1;
    v16 = v15 * a5;
    if ((*(_QWORD *)&v12[v15 * a5] & 0x8FFFFFFFFFFFFFFFLL) <= a6)
      break;
    v14 = v15 - 1;
LABEL_6:
    if (v14 < v10)
    {
      v18 = &v12[v16];
      v17 = a5 + a5 * v15;
      goto LABEL_10;
    }
  }
  v10 = v15 + 1;
  if (v15 + 1 >= v11)
  {
    v18 = &v12[v16];
    goto LABEL_11;
  }
  v17 = v10 * a5;
  if ((*(_QWORD *)&v12[v10 * a5] & 0x8FFFFFFFFFFFFFFFLL) <= a6)
    goto LABEL_6;
  v18 = &v12[v16];
LABEL_10:
  a3 = *(_QWORD *)&v12[v17] & 0x8FFFFFFFFFFFFFFFLL;
LABEL_11:
  v19 = v15;
  if (a6 + a7 > a3)
  {
    v20 = 0;
    v21 = a6 + a7 - 1;
    do
    {
      v19 = (v13 + v20) >> 1;
      if ((*(_QWORD *)&v12[v19 * a5] & 0x8FFFFFFFFFFFFFFFLL) <= v21)
      {
        v20 = v19 + 1;
        if (v19 + 1 >= v11 || (*(_QWORD *)&v12[v20 * a5] & 0x8FFFFFFFFFFFFFFFLL) > v21)
          break;
      }
      else
      {
        v13 = v19 - 1;
      }
    }
    while (v13 >= v20);
  }
  v22 = v19 - v15;
  v23 = v19 - v15 + 1;
  v24 = a2(v23);
  v25 = malloc_type_calloc(1uLL, a4 + v24 * a5, 0xCF99949DuLL);
  *v25 = v23;
  v25[1] = v24;
  memmove((char *)v25 + a4, v18, v23 * a5);
  if (a6)
  {
    *(_QWORD *)((char *)v25 + a4) &= 0x7000000000000000uLL;
    if (v23 >= 2)
    {
      v26 = (_QWORD *)((char *)v25 + a5 + a4);
      do
      {
        *v26 = ((*v26 & 0x8FFFFFFFFFFFFFFFLL) - a6) & 0x8FFFFFFFFFFFFFFFLL | (((*v26 >> 60) & 7) << 60);
        v26 = (unint64_t *)((char *)v26 + a5);
        --v22;
      }
      while (v22);
    }
  }
  return v25;
}

_QWORD *_NSGlyphRangeListTruncate(_QWORD *a1, uint64_t (*a2)(unint64_t), unint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t *v30;

  v11 = a1;
  v12 = 0;
  v13 = *a1;
  v14 = a1[1];
  v15 = (_QWORD *)((char *)a1 + a4);
  v16 = *a1 - 1;
  v17 = v16;
  while (1)
  {
    v18 = v17 + v12;
    v19 = (v17 + v12) >> 1;
    v20 = v19 * a5;
    if ((*(_QWORD *)((char *)v15 + v19 * a5) & 0x8FFFFFFFFFFFFFFFLL) <= a6)
      break;
    v17 = v19 - 1;
LABEL_6:
    if (v17 < v12)
    {
      v22 = (char *)v15 + v20;
      v21 = a5 + a5 * v19;
      goto LABEL_10;
    }
  }
  v12 = v19 + 1;
  if (v19 + 1 >= v13)
  {
    v22 = (char *)v15 + v20;
    goto LABEL_11;
  }
  v21 = v12 * a5;
  if ((*(_QWORD *)((char *)v15 + v12 * a5) & 0x8FFFFFFFFFFFFFFFLL) <= a6)
    goto LABEL_6;
  v22 = (char *)v15 + v20;
LABEL_10:
  a3 = *(_QWORD *)((char *)v15 + v21) & 0x8FFFFFFFFFFFFFFFLL;
LABEL_11:
  v23 = v19;
  if (a6 + a7 > a3)
  {
    v24 = 0;
    v25 = a6 + a7 - 1;
    do
    {
      v23 = (v16 + v24) >> 1;
      if ((*(_QWORD *)((char *)v15 + v23 * a5) & 0x8FFFFFFFFFFFFFFFLL) <= v25)
      {
        v24 = v23 + 1;
        if (v23 + 1 >= v13 || (*(_QWORD *)((char *)v15 + v24 * a5) & 0x8FFFFFFFFFFFFFFFLL) > v25)
          break;
      }
      else
      {
        v16 = v23 - 1;
      }
    }
    while (v16 >= v24);
  }
  v26 = v23 - v19;
  v27 = v23 - v19 + 1;
  if (v27 < v13)
  {
    if (v18 >= 2)
      memmove((char *)a1 + a4, v22, v27 * a5);
    *v11 = v27;
    v28 = a2(v27);
    v29 = v28;
    if (v28 != v14)
    {
      v11[1] = v28;
      v11 = malloc_type_realloc(v11, a4 + v28 * a5, 0x7296AF6uLL);
      v15 = (_QWORD *)((char *)v11 + a4);
    }
    if (v29 > v27)
      bzero((char *)v15 + v27 * a5, (v29 - v27) * a5);
  }
  if (a6)
  {
    *v15 &= 0x7000000000000000uLL;
    if (v27 >= 2)
    {
      v30 = (_QWORD *)((char *)v15 + a5);
      do
      {
        *v30 = ((*v30 & 0x8FFFFFFFFFFFFFFFLL) - a6) & 0x8FFFFFFFFFFFFFFFLL | (((*v30 >> 60) & 7) << 60);
        v30 = (unint64_t *)((char *)v30 + a5);
        --v26;
      }
      while (v26);
    }
  }
  return v11;
}

void sub_18D6317D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a38, 8);
  _Unwind_Resume(a1);
}

void sub_18D631BCC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void __NSTextLayoutFragmentConfigureForTextAnimationContext(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[10];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)(a1 + 112) = a2;
  if (a2)
  {
    *(_QWORD *)(a1 + 120) = objc_msgSend(a2, "_effectiveComponents");
    *(_QWORD *)(a1 + 128) = objc_msgSend(a2, "_effectiveExclusiveComponents");
    *(_BYTE *)(a1 + 216) = 0;
    v4 = (void *)objc_msgSend(a2, "textRanges");
    v5 = objc_msgSend((id)a1, "rangeInElement");
    if (v4)
    {
      v6 = v5;
      if (objc_msgSend((id)objc_msgSend(a2, "_unionTextRange"), "intersectsWithTextRange:", v5))
      {
        v7 = objc_msgSend(v4, "count");
        v12 = 0;
        v13 = &v12;
        v14 = 0x2020000000;
        v15 = 0;
        v8 = objc_msgSend((id)a1, "textParagraph");
        v9 = objc_msgSend((id)objc_msgSend((id)a1, "textLayoutManager"), "textContentManager");
        if (v7 < 5)
        {
          v13[3] = a1 + 136;
          *(_BYTE *)(a1 + 216) = 1;
        }
        else
        {
          v10 = NSZoneCalloc(0, v7 + 1, 0x10uLL);
          *(_QWORD *)(a1 + 136) = v10;
          v13[3] = (uint64_t)v10;
        }
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = ____NSTextLayoutFragmentConfigureForTextAnimationContext_block_invoke;
        v11[3] = &unk_1E2603130;
        v11[4] = v6;
        v11[5] = a1;
        v11[6] = v9;
        v11[7] = v8;
        v11[8] = &v12;
        v11[9] = v7;
        objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);
        *(_OWORD *)v13[3] = xmmword_18D6CBB80;
        _Block_object_dispose(&v12, 8);
      }
    }
  }
  else if (!*(_BYTE *)(a1 + 216) && !*(_QWORD *)(a1 + 136))
  {
    NSZoneFree(0, 0);
    *(_QWORD *)(a1 + 136) = 0;
  }
}

void sub_18D6321B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CGFloat __NSTextLayoutFragmentUpdateTotalBoundsWithTypographicBounds(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double v8;
  double v9;
  CGFloat v10;
  _BOOL4 v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat MinX;
  CGFloat v22;
  double v23;
  double MaxX;
  double v25;
  double v26;
  double MinY;
  double MaxY;
  double v29;
  double rect;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v32.origin.x = a5;
  v32.origin.y = a6;
  v32.size.width = a7;
  v32.size.height = a8;
  v16 = CGRectEqualToRect(v32, *MEMORY[0x1E0C9D648]);
  v17 = a1;
  v18 = a2;
  v19 = a3;
  v20 = a4;
  if (v16)
  {
    if (CGRectGetMinY(*(CGRect *)&v17) > 0.0)
    {
      v33.origin.x = a1;
      v33.origin.y = a2;
      v33.size.width = a3;
      v33.size.height = a4;
      CGRectGetMaxY(v33);
    }
  }
  else if (CGRectGetWidth(*(CGRect *)&v17) <= 0.0
         && (v34.origin.x = a1, v34.origin.y = a2,
                                v34.size.width = a3,
                                v34.size.height = a4,
                                CGRectGetHeight(v34) <= 0.0))
  {
    return a5;
  }
  else
  {
    v35.origin.x = a1;
    v35.origin.y = a2;
    v35.size.width = a3;
    v35.size.height = a4;
    MinX = CGRectGetMinX(v35);
    v22 = a5;
    v23 = MinX;
    rect = v22;
    v36.origin.x = v22;
    v36.origin.y = v10;
    v36.size.width = v9;
    v36.size.height = v8;
    if (v23 < CGRectGetMinX(v36))
    {
      v37.origin.x = rect;
      v37.origin.y = v10;
      v37.size.width = v9;
      v37.size.height = v8;
      MaxX = CGRectGetMaxX(v37);
      v38.origin.x = a1;
      v38.origin.y = a2;
      v38.size.width = a3;
      v38.size.height = a4;
      v9 = MaxX - CGRectGetMinX(v38);
      v39.origin.x = a1;
      v39.origin.y = a2;
      v39.size.width = a3;
      v39.size.height = a4;
      rect = CGRectGetMinX(v39);
    }
    v40.origin.x = a1;
    v40.origin.y = a2;
    v40.size.width = a3;
    v40.size.height = a4;
    v25 = CGRectGetMaxX(v40);
    v41.origin.x = rect;
    v41.origin.y = v10;
    v41.size.width = v9;
    v41.size.height = v8;
    if (v25 > CGRectGetMaxX(v41))
    {
      v42.origin.x = a1;
      v42.origin.y = a2;
      v42.size.width = a3;
      v42.size.height = a4;
      v26 = CGRectGetMaxX(v42);
      v43.origin.x = rect;
      v43.origin.y = v10;
      v43.size.width = v9;
      v43.size.height = v8;
      v9 = v26 - CGRectGetMinX(v43);
    }
    v44.origin.x = a1;
    v44.origin.y = a2;
    v44.size.width = a3;
    v44.size.height = a4;
    MinY = CGRectGetMinY(v44);
    v45.origin.x = rect;
    v45.origin.y = v10;
    v45.size.width = v9;
    v45.size.height = v8;
    if (MinY < CGRectGetMinY(v45))
    {
      v46.origin.x = rect;
      v46.origin.y = v10;
      v46.size.width = v9;
      v46.size.height = v8;
      MaxY = CGRectGetMaxY(v46);
      v47.origin.x = a1;
      v47.origin.y = a2;
      v47.size.width = a3;
      v47.size.height = a4;
      v8 = MaxY - CGRectGetMinY(v47);
      v48.origin.x = a1;
      v48.origin.y = a2;
      v48.size.width = a3;
      v48.size.height = a4;
      v10 = CGRectGetMinY(v48);
    }
    v49.origin.x = a1;
    v49.origin.y = a2;
    v49.size.width = a3;
    v49.size.height = a4;
    v29 = CGRectGetMaxY(v49);
    v50.origin.x = rect;
    v50.origin.y = v10;
    v50.size.width = v9;
    v50.size.height = v8;
    if (v29 <= CGRectGetMaxY(v50))
    {
      return rect;
    }
    else
    {
      v51.origin.x = a1;
      v51.origin.y = a2;
      v51.size.width = a3;
      v51.size.height = a4;
      CGRectGetMaxY(v51);
      a1 = rect;
      v52.origin.x = rect;
      v52.origin.y = v10;
      v52.size.width = v9;
      v52.size.height = v8;
      CGRectGetMinY(v52);
    }
  }
  return a1;
}

void sub_18D6338C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D633A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D633D68(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D63448C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D6344E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __NSGetCircledImage(uint64_t a1, double a2, double a3)
{
  uint64_t v3;
  _QWORD v5[7];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ____NSGetCircledImage_block_invoke;
  v5[3] = &unk_1E2603198;
  v5[4] = a1;
  *(double *)&v5[5] = a2;
  *(double *)&v5[6] = a3;
  ((void (*)(uint64_t, double, double, double))softLinkUIGraphicsBeginImageContextWithOptions[0])(0, a2 + 1.0, a3, 2.0);
  ____NSGetCircledImage_block_invoke((uint64_t)v5, (CGContext *)objc_msgSend((id)-[objc_class graphicsContextForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "graphicsContextForApplicationFrameworkContext:", 1), "CGContext"));
  v3 = softLinkUIGraphicsGetImageFromCurrentImageContext[0]();
  softLinkUIGraphicsEndImageContext[0]();
  return v3;
}

uint64_t __NSGetColorForSpellingState(char a1)
{
  char **v1;
  char *v2;

  if ((a1 & 1) != 0)
  {
    v1 = &selRef_systemRedColor;
    goto LABEL_6;
  }
  if ((a1 & 2) == 0)
  {
    if ((a1 & 0x80) == 0)
      return 0;
    v1 = &selRef_systemBlueColor;
    goto LABEL_6;
  }
  v2 = sel_textGrammarIndicatorColor;
  if (!sel_textGrammarIndicatorColor)
    return 0;
  getNSColorClass[0]();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v1 = &selRef_systemGreenColor;
LABEL_6:
    v2 = *v1;
    if (!*v1)
      return 0;
  }
  getNSColorClass[0]();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend((Class)getNSColorClass[0](), "performSelector:", v2);
  return 0;
}

uint64_t _maxApplierFunction(uint64_t result, unint64_t a2, _QWORD *a3)
{
  unint64_t v3;

  v3 = a3[1];
  if (v3 < a2 || v3 == a2 && *a3 > result)
  {
    *a3 = result;
    a3[1] = a2;
  }
  return result;
}

uint64_t initUIGraphicsBeginImageContextWithOptions(uint64_t a1, double a2, double a3, double a4)
{
  void *v8;
  uint64_t (*v9)();

  v8 = (void *)__NSGetFrameworkReference(0, 0);
  v9 = (uint64_t (*)())dlsym(v8, "UIGraphicsBeginImageContextWithOptions");
  softLinkUIGraphicsBeginImageContextWithOptions[0] = v9;
  if (!v9)
    initUIGraphicsBeginImageContextWithOptions_cold_1();
  return ((uint64_t (*)(uint64_t, double, double, double))v9)(a1, a2, a3, a4);
}

uint64_t initUIGraphicsGetImageFromCurrentImageContext()
{
  void *v0;
  uint64_t (*v1)();

  v0 = (void *)__NSGetFrameworkReference(0, 0);
  v1 = (uint64_t (*)())dlsym(v0, "UIGraphicsGetImageFromCurrentImageContext");
  softLinkUIGraphicsGetImageFromCurrentImageContext[0] = v1;
  if (!v1)
    initUIGraphicsGetImageFromCurrentImageContext_cold_1();
  return v1();
}

uint64_t initUIGraphicsEndImageContext()
{
  void *v0;
  uint64_t (*v1)();

  v0 = (void *)__NSGetFrameworkReference(0, 0);
  v1 = (uint64_t (*)())dlsym(v0, "UIGraphicsEndImageContext");
  softLinkUIGraphicsEndImageContext[0] = v1;
  if (!v1)
    initUIGraphicsEndImageContext_cold_1();
  return v1();
}

Class initNSColor()
{
  Class result;

  __NSGetFrameworkReference(0, 0);
  result = objc_getClass("NSColor");
  classNSColor = (uint64_t)result;
  if (!result)
    initNSColor_cold_1();
  getNSColorClass[0] = NSColorFunction;
  return result;
}

uint64_t NSColorFunction()
{
  return classNSColor;
}

double *lmProcessPathElement(double *result, uint64_t a2)
{
  int v2;
  double *v3;
  double *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  BOOL v12;
  double v13;
  double v14;
  BOOL v15;
  BOOL v16;
  double v17;
  double v18;
  _BOOL4 v19;
  double v22;
  double v23;

  switch(*(_DWORD *)a2)
  {
    case 0:
      v2 = 0;
      *(_OWORD *)result = *(_OWORD *)*(_QWORD *)(a2 + 8);
      v3 = result + 1;
      goto LABEL_9;
    case 1:
      v4 = *(double **)(a2 + 8);
      v3 = v4 + 1;
      goto LABEL_7;
    case 2:
      v5 = *(_QWORD *)(a2 + 8);
      v4 = (double *)(v5 + 16);
      v3 = (double *)(v5 + 24);
      goto LABEL_7;
    case 3:
      v6 = *(_QWORD *)(a2 + 8);
      v4 = (double *)(v6 + 32);
      v3 = (double *)(v6 + 40);
LABEL_7:
      v2 = 1;
      break;
    case 4:
      v3 = result + 1;
      v2 = 1;
LABEL_9:
      v4 = result;
      break;
    default:
      v2 = 0;
      v4 = (double *)MEMORY[0x1E0C9D538];
      v3 = (double *)(MEMORY[0x1E0C9D538] + 8);
      break;
  }
  v7 = *v4;
  v8 = *v3;
  v10 = result[4];
  v9 = result[5];
  v11 = v10 < *v3 && v8 < v9;
  if (v11 || (v8 < v10 ? (v12 = v9 < v8) : (v12 = 0), v12))
  {
    if (v7 < result[6])
      result[6] = v7;
    if (v7 > result[7])
      result[7] = v7;
  }
  if (v2)
  {
    v13 = result[2];
    v14 = result[3];
    v15 = v10 < v8 && v14 < v10;
    if (v15 || (v8 < v10 ? (v16 = v14 <= v10) : (v16 = 1), !v16))
    {
      v17 = v13 + (v7 - v13) * (v10 - v14) / (v8 - v14);
      v18 = result[6];
      if (v18 >= v17)
        v18 = v17;
      if (result[7] >= v17)
        v17 = result[7];
      result[6] = v18;
      result[7] = v17;
    }
    v19 = v14 > v9;
    if (v8 >= v9)
      v19 = 0;
    if (v8 > v9 && v14 < v9 || v19)
    {
      v22 = v13 + (v7 - v13) * (v9 - v14) / (v8 - v14);
      v23 = result[6];
      if (v23 >= v22)
        v23 = v22;
      if (result[7] >= v22)
        v22 = result[7];
      result[6] = v23;
      result[7] = v22;
    }
  }
  result[2] = v7;
  result[3] = v8;
  return result;
}

uint64_t _NSGlyphTreeSummaryDescription(uint64_t a1)
{
  uint64_t v1;
  unint64_t *v2;
  double v3;
  double v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v8;
  uint64_t v9;

  v9 = 0;
  v1 = *(_QWORD *)(a1 + 240);
  v8 = 0;
  v2 = *(unint64_t **)(v1 + 208);
  _NSGlyphNodeCalculateMemoryUsage((uint64_t)v2, &v9, (uint64_t *)&v8);
  v3 = 0.0;
  v4 = 0.0;
  v5 = *v2;
  if (*v2)
    v4 = (double)v8 / (double)v5;
  v6 = v2[1];
  if (v6)
    v3 = (double)v8 / (double)v6;
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Glyph tree contents:  %lu characters, %lu glyphs, %lu nodes, %lu node bytes, %lu storage bytes, %lu total bytes, %.2f bytes per character, %.2f bytes per glyph"), v5, v6, v9, v9 << 6, v8 - (v9 << 6), v8, *(_QWORD *)&v4, *(_QWORD *)&v3);
}

void *_NSGlyphTreeDescription(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSUInteger *v5;
  NSString *v6;
  NSRange v8;
  NSRange v9;

  v2 = (void *)MEMORY[0x1E0CB37A0];
  v3 = objc_opt_class();
  v4 = (void *)objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@: %p>\n%@\n"), v3, a1, _NSGlyphTreeSummaryDescription(a1));
  v5 = *(NSUInteger **)(*(_QWORD *)(a1 + 240) + 216);
  v8.location = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224);
  v8.length = *v5;
  v6 = NSStringFromRange(v8);
  v9.location = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
  v9.length = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 216) + 8);
  objc_msgSend(v4, "appendFormat:", CFSTR("Current node %p char range %@ glyph range %@\nRoot "), v5, v6, NSStringFromRange(v9));
  _NSGlyphNodeDescribe(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 208), v4, 0);
  return v4;
}

uint64_t _NSGlyphNodeDescribe(uint64_t result, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 **v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t j;
  unsigned __int8 *v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  BOOL v20;
  unint64_t v21;
  uint64_t v22;
  unsigned __int8 *v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unint64_t v28;
  const __CFString *v29;
  unint64_t v30;
  uint64_t v31;
  int *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  int v36;
  unint64_t v37;
  const __CFString *v38;

  if (!result)
    return result;
  v3 = a3;
  v5 = result;
  if (a3)
  {
    v6 = a3;
    do
    {
      objc_msgSend(a2, "appendString:", CFSTR("  "));
      --v6;
    }
    while (v6);
  }
  v7 = (unsigned __int8 **)(v5 + 24);
  if (!*(_BYTE *)(v5 + 59))
  {
    for (i = 0; i != 3; ++i)
    {
      if (!*(_QWORD *)(v5 + 8 * i + 24))
        break;
    }
    objc_msgSend(a2, "appendFormat:", CFSTR("Internal node %p with %lu chars, %lu glyphs, %lu children, flags 0x%x\n"), v5, *(_QWORD *)v5, *(_QWORD *)(v5 + 8), i, *(unsigned __int8 *)(v5 + 56));
    for (j = 0; j != 3; ++j)
      result = _NSGlyphNodeDescribe(v7[j], a2, v3 + 1);
    return result;
  }
  v8 = *(_QWORD *)v5;
  if (!*(_QWORD *)(v5 + 24))
    return objc_msgSend(a2, "appendFormat:", CFSTR("Leaf node %p with %lu chars, %lu glyphs (not generated), flags 0x%x\n"), v5, v8, *(_QWORD *)(v5 + 8), *(unsigned __int8 *)(v5 + 56));
  objc_msgSend(a2, "appendFormat:", CFSTR("Leaf node %p with %lu chars, %lu glyphs, capacity %lu, flags 0x%x\n"), v5, v8, *(_QWORD *)(v5 + 8), *(_QWORD *)(v5 + 48), *(unsigned __int8 *)(v5 + 56));
  if (v3)
  {
    v9 = v3;
    do
    {
      objc_msgSend(a2, "appendString:", CFSTR("  "));
      --v9;
    }
    while (v9);
  }
  v10 = *(char *)(v5 + 57);
  if (v10 > 3)
    v11 = 0;
  else
    v11 = qword_18D6CBC78[v10];
  v14 = *v7;
  if (*v7)
  {
    switch(*(_BYTE *)(v5 + 57))
    {
      case 0:
        v17 = *v14;
        if (v17 >= 4)
          v18 = *v14;
        else
          v18 = 0xFFFFFF;
        if (v17 <= 0xEF)
          v16 = v18;
        else
          v16 = v17 & 3;
        break;
      case 1:
        v15 = *(unsigned __int16 *)v14;
        goto LABEL_31;
      case 2:
      case 3:
        v15 = *(_DWORD *)v14;
LABEL_31:
        v19 = v15 >> 8;
        v20 = v15 > 0xFF;
        LODWORD(v16) = ((char)v15 >> 7) & 0xFFFFFF;
        if (v20)
          v16 = v19;
        else
          v16 = v16;
        break;
      default:
        goto LABEL_23;
    }
  }
  else
  {
LABEL_23:
    v16 = 0;
  }
  objc_msgSend(a2, "appendFormat:", CFSTR("  glyphs (%lu-byte) <%d"), v11, v16);
  if (*(_QWORD *)(v5 + 8) < 2uLL)
    goto LABEL_55;
  v21 = 1;
  v22 = 24;
  do
  {
    v23 = *v7;
    if (*v7)
    {
      switch(*(_BYTE *)(v5 + 57))
      {
        case 0:
          v24 = v23[v21];
          if (v24 >= 4)
            v25 = v24;
          else
            v25 = 0xFFFFFF;
          if (v24 <= 0xEF)
            v23 = (unsigned __int8 *)v25;
          else
            v23 = (unsigned __int8 *)(v24 & 3);
          break;
        case 1:
          v26 = *(unsigned __int16 *)&v23[2 * v21];
          goto LABEL_48;
        case 2:
          v26 = *(_DWORD *)&v23[4 * v21];
          goto LABEL_48;
        case 3:
          v26 = *(_DWORD *)&v23[v22];
LABEL_48:
          v27 = v26 >> 8;
          v20 = v26 > 0xFF;
          LODWORD(v23) = ((char)v26 >> 7) & 0xFFFFFF;
          if (v20)
            v23 = (unsigned __int8 *)v27;
          else
            v23 = (unsigned __int8 *)v23;
          break;
        default:
          v23 = 0;
          break;
      }
    }
    objc_msgSend(a2, "appendFormat:", CFSTR(" %d"), v23);
    v28 = *(_QWORD *)(v5 + 8);
    if (v21 > 0xFE)
      break;
    ++v21;
    v22 += 24;
  }
  while (v21 < v28);
  if (v28 <= 0x100)
LABEL_55:
    v29 = CFSTR(">\n");
  else
    v29 = CFSTR("...>\n");
  result = objc_msgSend(a2, "appendString:", v29);
  if (*(_QWORD *)(v5 + 32))
  {
    for (; v3; --v3)
      objc_msgSend(a2, "appendString:", CFSTR("  "));
    v30 = *(char *)(v5 + 58);
    if (v30 > 2)
      v31 = 0;
    else
      v31 = qword_18D6CBC98[v30];
    v32 = *(int **)(v5 + 32);
    if (v32)
    {
      if ((_DWORD)v30 == 2)
      {
        v33 = *v32;
      }
      else
      {
        if (*(_BYTE *)(v5 + 58) != 1)
        {
          if (!*(_BYTE *)(v5 + 58))
          {
            v33 = *(char *)v32;
            goto LABEL_71;
          }
          goto LABEL_68;
        }
        v33 = *(__int16 *)v32;
      }
LABEL_71:
      objc_msgSend(a2, "appendFormat:", CFSTR("  deltas (%lu-byte) <%ld"), v31, v33);
      if (*(_QWORD *)(v5 + 8) < 2uLL)
        goto LABEL_85;
      v34 = 1;
      do
      {
        v35 = *(_QWORD *)(v5 + 32);
        if (v35)
        {
          v36 = *(unsigned __int8 *)(v5 + 58);
          if (v36 == 2)
          {
            v35 = *(int *)(v35 + 4 * v34);
          }
          else if (v36 == 1)
          {
            v35 = *(__int16 *)(v35 + 2 * v34);
          }
          else if (*(_BYTE *)(v5 + 58))
          {
            v35 = 0;
          }
          else
          {
            v35 = *(char *)(v35 + v34);
          }
        }
        objc_msgSend(a2, "appendFormat:", CFSTR(" %ld"), v35);
        v37 = *(_QWORD *)(v5 + 8);
        if (v34 > 0xFE)
          break;
        ++v34;
      }
      while (v34 < v37);
      if (v37 < 0x101)
LABEL_85:
        v38 = CFSTR(">\n");
      else
        v38 = CFSTR("...>\n");
      return objc_msgSend(a2, "appendString:", v38);
    }
LABEL_68:
    v33 = 0;
    goto LABEL_71;
  }
  return result;
}

void _NSGlyphTreeLogDebug(NSString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if ((unint64_t)_NSGlyphTreeLogDebug_logCount <= 0xF)
  {
    ++_NSGlyphTreeLogDebug_logCount;
    NSLogv(a1, &a9);
    if ((unint64_t)_NSGlyphTreeLogDebug_logCount >= 0x10)
      NSLog((NSString *)CFSTR("!!! Suppressing further NSGlyphTree logs"));
  }
}

uint64_t _NSGlyphNodeCalculateMemoryUsage(uint64_t result, _QWORD *a2, uint64_t *a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (result)
  {
    ++*a2;
    v5 = *a3 + 64;
    *a3 = v5;
    if (*(_BYTE *)(result + 59))
    {
      v6 = *(char *)(result + 57);
      if (v6 > 3)
        v7 = 0;
      else
        v7 = qword_18D6CBC78[v6];
      v10 = *(char *)(result + 58);
      if (v10 > 2)
        v11 = 0;
      else
        v11 = qword_18D6CBC98[v10];
      v12 = *(_QWORD *)(result + 48);
      if (*(_QWORD *)(result + 24))
      {
        v5 += v12 * v7;
        *a3 = v5;
      }
      if (*(_QWORD *)(result + 32))
      {
        v5 += v12 * v11;
        *a3 = v5;
      }
      if (*(_QWORD *)(result + 40))
        *a3 = v5 + v12;
    }
    else
    {
      v8 = 0;
      v9 = result + 24;
      do
      {
        result = _NSGlyphNodeCalculateMemoryUsage(*(_QWORD *)(v9 + v8), a2, a3);
        v8 += 8;
      }
      while (v8 != 24);
    }
  }
  return result;
}

unint64_t _NSGlyphNodePrimitiveRelativeGlyphIndexForRelativeCharacterIndex(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  unint64_t v9;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = v2 - 1;
  if (v2 != 1)
  {
    v4 = 0;
    v5 = *(_QWORD *)(a1 + 32);
    while (1)
    {
      v6 = (v3 + v4) >> 1;
      if (!v5)
        goto LABEL_8;
      v7 = *(unsigned __int8 *)(a1 + 58);
      if (v7 == 2)
      {
        v8 = *(int *)(v5 + 4 * v6);
        goto LABEL_11;
      }
      if (v7 == 1)
      {
        v8 = *(__int16 *)(v5 + 2 * v6);
        goto LABEL_11;
      }
      if (*(_BYTE *)(a1 + 58))
LABEL_8:
        v8 = 0;
      else
        v8 = *(char *)(v5 + v6);
LABEL_11:
      v9 = v6 - v8;
      if (v9 >= a2)
      {
        if (v9 <= a2)
          return v6;
        if (v6 <= v4)
          v6 = v4;
        else
          --v6;
        v3 = v6;
      }
      else
      {
        if (v6 < v3)
          ++v6;
        else
          v6 = v3;
        v4 = v6;
      }
      if (v4 >= v3)
        return v6;
    }
  }
  return 0;
}

BOOL _NSGlyphTreeHasGlyphsForCharacterAtIndex(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  _BOOL8 result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = _NSGlyphTreeMoveToCharacterIndex(a1, a2);
  if (result)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224);
    v8 = *(_QWORD *)v7;
    if (*(_BYTE *)(v7 + 59))
    {
      result = *(_QWORD *)(v7 + 24) != 0;
      if (!a3)
        return result;
    }
    else
    {
      result = 0;
      if (!a3)
        return result;
    }
  }
  else
  {
    v8 = 0;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    if (!a3)
      return result;
  }
  *a3 = v6;
  a3[1] = v8;
  return result;
}

uint64_t _NSGlyphTreeBidiLevelForGlyphAtIndex(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (_NSGlyphTreeMoveToGlyphIndex(a1, a2))
  {
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 216) + 40);
    if (v11)
      return *(unsigned __int8 *)(v11 + a2 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232));
  }
  else
  {
    _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeBidiLevelForGlyphAtIndex invalid glyph index %lu"), v4, v5, v6, v7, v8, v9, v10, a2);
  }
  return 0;
}

uint64_t _NSGlyphTreeIntAttributeForGlyphAtIndex(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  int v16;
  unint64_t v17;
  unsigned int v18;
  uint64_t v19;
  unint64_t v20;
  unsigned int v21;
  int v22;
  unint64_t v23;
  unsigned int v24;

  if (!_NSGlyphTreeMoveToGlyphIndex(a1, a2))
  {
    _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeIntAttributeForGlyphAtIndex invalid glyph index %lu"), v6, v7, v8, v9, v10, v11, v12, a2);
    return -1;
  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
  if (!*(_BYTE *)(v13 + 59))
    return -1;
  v14 = *(_QWORD *)(v13 + 24);
  if (!v14)
    return -1;
  result = -1;
  switch(a3)
  {
    case 0:
      v16 = *(unsigned __int8 *)(v13 + 57);
      v17 = a2 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
      switch(v16)
      {
        case 3:
          v18 = *(unsigned __int8 *)(v14 + 24 * v17);
          break;
        case 2:
          v18 = *(_DWORD *)(v14 + 4 * v17);
          break;
        case 1:
          v18 = *(unsigned __int16 *)(v14 + 2 * v17);
          break;
        default:
          goto LABEL_21;
      }
LABEL_25:
      v21 = (v18 >> 3) & 1;
      goto LABEL_33;
    case 1:
      v20 = a2 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
      switch(*(_BYTE *)(v13 + 57))
      {
        case 0:
          v18 = *(unsigned __int8 *)(v14 + v20);
          if (v18 >= 0xF0)
            goto LABEL_25;
          if (v18 > 3)
            goto LABEL_21;
          v21 = (v18 >> 1) & 1;
          break;
        case 1:
          v24 = *(unsigned __int16 *)(v14 + 2 * v20);
          goto LABEL_32;
        case 2:
          v24 = *(_DWORD *)(v14 + 4 * v20);
          goto LABEL_32;
        case 3:
          v24 = *(unsigned __int8 *)(v14 + 24 * v20);
LABEL_32:
          v21 = (v24 >> 4) & 1;
          break;
        default:
          goto LABEL_21;
      }
      goto LABEL_33;
    case 2:
      v19 = *(_QWORD *)(v13 + 40);
      if (v19)
        return *(unsigned __int8 *)(v19 + a2 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232));
      else
        return 0;
    case 5:
      v22 = *(unsigned __int8 *)(v13 + 57);
      v23 = a2 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
      switch(v22)
      {
        case 3:
          LOBYTE(v14) = *(_BYTE *)(v14 + 24 * v23);
          break;
        case 2:
          LODWORD(v14) = *(_DWORD *)(v14 + 4 * v23);
          break;
        case 1:
          LOWORD(v14) = *(_WORD *)(v14 + 2 * v23);
          break;
        default:
LABEL_21:
          v21 = 0;
          goto LABEL_33;
      }
      v21 = v14 & 1;
LABEL_33:
      result = v21;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t _NSGlyphTreeNotShownAttributeForGlyphAtIndex(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int v14;
  uint64_t result;
  unsigned int v16;

  if (!_NSGlyphTreeMoveToGlyphIndex(a1, a2))
  {
    _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeNotShownAttributeForGlyphAtIndex invalid glyph index %lu"), v4, v5, v6, v7, v8, v9, v10, a2);
    return 0;
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
  if (!*(_BYTE *)(v11 + 59))
    return 0;
  v12 = *(_QWORD *)(v11 + 24);
  if (!v12)
    return 0;
  v13 = a2 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
  switch(*(_BYTE *)(v11 + 57))
  {
    case 0:
      v14 = *(unsigned __int8 *)(v12 + v13);
      if (v14 >= 0xF0)
        return (v14 >> 2) & 1;
      if (v14 > 3)
        return 0;
      result = v14 & 1;
      break;
    case 1:
      v16 = *(unsigned __int16 *)(v12 + 2 * v13);
      return (v16 >> 6) & 1;
    case 2:
      v16 = *(_DWORD *)(v12 + 4 * v13);
      return (v16 >> 6) & 1;
    case 3:
      v16 = *(unsigned __int8 *)(v12 + 24 * v13);
      return (v16 >> 6) & 1;
    default:
      return 0;
  }
  return result;
}

uint64_t _NSGlyphTreeDrawsOutsideLineFragmentForGlyphAtIndex(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unint64_t v14;
  unsigned int v15;

  if (!_NSGlyphTreeMoveToGlyphIndex(a1, a2))
  {
    _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeDrawsOutsideLineFragmentForGlyphAtIndex invalid glyph index %lu"), v4, v5, v6, v7, v8, v9, v10, a2);
    return 0;
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
  if (!*(_BYTE *)(v11 + 59))
    return 0;
  v12 = *(_QWORD *)(v11 + 24);
  if (!v12)
    return 0;
  v13 = *(unsigned __int8 *)(v11 + 57);
  v14 = a2 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
  if (v13 == 3)
  {
    v15 = *(unsigned __int8 *)(v12 + 24 * v14);
    return (v15 >> 5) & 1;
  }
  if (v13 == 2)
  {
    v15 = *(_DWORD *)(v12 + 4 * v14);
    return (v15 >> 5) & 1;
  }
  if (v13 != 1)
    return 0;
  v15 = *(unsigned __int16 *)(v12 + 2 * v14);
  return (v15 >> 5) & 1;
}

uint64_t _NSGlyphTreeVirtualEllipsisAttributeForGlyphAtIndex(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  int v17;
  unsigned int v19;

  if (!_NSGlyphTreeMoveToGlyphIndex(a1, a2))
  {
    _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeDrawsOutsideLineFragmentForGlyphAtIndex invalid glyph index %lu"), v4, v5, v6, v7, v8, v9, v10, a2);
    return 0;
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
  if (!*(_BYTE *)(v11 + 59))
    return 0;
  v12 = *(_QWORD *)(v11 + 24);
  if (!v12)
    return 0;
  v13 = a2 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
  switch(*(_BYTE *)(v11 + 57))
  {
    case 0:
      v14 = 0;
      v15 = *(unsigned __int8 *)(v12 + v13);
      if (v15 >= 4)
        v16 = v15;
      else
        v16 = 0xFFFFFF;
      if (v15 <= 0xEF)
        v17 = v16;
      else
        v17 = v15 & 3;
      break;
    case 1:
      v19 = *(unsigned __int16 *)(v12 + 2 * v13);
      goto LABEL_17;
    case 2:
      v19 = *(_DWORD *)(v12 + 4 * v13);
      goto LABEL_17;
    case 3:
      v19 = *(_DWORD *)(v12 + 24 * v13);
LABEL_17:
      v17 = v19 >> 8;
      if (v19 < 0x100)
        v17 = ((char)v19 >> 7) & 0xFFFFFF;
      v14 = (v19 >> 1) & 1;
      break;
    default:
      v17 = 0;
      v14 = 0;
      break;
  }
  if (v17 == 0xFFFFFF)
    return v14;
  else
    return 0;
}

unint64_t _NSGlyphTreeEllipsisGlyphIndexForTruncatedGlyphRange(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v5;
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
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  unint64_t result;
  unsigned int v23;
  int v25;
  unint64_t v26;

  v5 = a3 + a2 - 1;
  if (!_NSGlyphTreeMoveToGlyphIndex(a1, v5))
  {
    _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeDrawsOutsideLineFragmentForGlyphAtIndex invalid glyph index %lu"), v6, v7, v8, v9, v10, v11, v12, v5);
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v13 = *(_QWORD *)(a1 + 240) + 208;
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
  if (!*(_BYTE *)(v14 + 59))
    return 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    v15 = *(_QWORD *)(v14 + 24);
    if (v5 <= a2 || !v15)
      break;
    v16 = *(_QWORD *)(v13 + 24);
    if (v16 <= a2)
      v17 = a2;
    else
      v17 = *(_QWORD *)(v13 + 24);
    if (v17 < v5)
    {
      v18 = v15 - v16;
      v19 = v15 - 2 * v16;
      v20 = v15 - 4 * v16;
      v21 = (_BYTE *)(v15 + 24 * v5 - 24 * v16);
      result = v5;
      while (2)
      {
        switch(*(_BYTE *)(v14 + 57))
        {
          case 0:
            v23 = *(unsigned __int8 *)(v18 + result);
            if (v23 < 0xF0)
            {
              if (v23 > 3 || (v23 & 1) == 0)
              {
                v5 = result;
                goto LABEL_33;
              }
            }
            else if ((v23 & 4) == 0)
            {
              goto LABEL_34;
            }
LABEL_24:
            --result;
            v21 -= 24;
            if (v17 < result)
              continue;
            v5 = v17;
            break;
          case 1:
            if ((*(_WORD *)(v19 + 2 * result) & 0x40) == 0)
              goto LABEL_34;
            goto LABEL_24;
          case 2:
            if ((*(_DWORD *)(v20 + 4 * result) & 0x40) == 0)
              goto LABEL_34;
            goto LABEL_24;
          case 3:
            if ((*v21 & 0x40) == 0)
              goto LABEL_34;
            goto LABEL_24;
          default:
            goto LABEL_33;
        }
        break;
      }
    }
    if (v5 > a2)
      _NSGlyphTreeMoveToGlyphIndex(a1, --v5);
    v13 = *(_QWORD *)(a1 + 240) + 208;
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
    result = 0x7FFFFFFFFFFFFFFFLL;
    if (!*(_BYTE *)(v14 + 59))
      return result;
  }
LABEL_33:
  result = v5;
  if (!v15)
    return 0x7FFFFFFFFFFFFFFFLL;
LABEL_34:
  v25 = *(unsigned __int8 *)(v14 + 57);
  v26 = result - *(_QWORD *)(v13 + 24);
  if (v25 == 3)
  {
    if ((*(_DWORD *)(v15 + 24 * v26) & 2) != 0)
      return result;
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v25 == 2)
  {
    if ((*(_DWORD *)(v15 + 4 * v26) & 2) != 0)
      return result;
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v25 != 1 || (*(_WORD *)(v15 + 2 * v26) & 2) == 0)
    return 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

unint64_t _NSGlyphTreeGetGlyphsInRange(uint64_t a1, unint64_t a2, uint64_t a3, unsigned int *a4, _QWORD *a5, _QWORD *a6, _BYTE *a7, _BYTE *a8)
{
  unint64_t v8;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t i;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  int v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int v43;
  unsigned int v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;

  v8 = a2 + a3;
  if (a2 < a2 + a3)
  {
    v62 = 0;
    v60 = a2 + a3;
    while (1)
    {
      v61 = a2;
      if (!_NSGlyphTreeMoveToGlyphIndex(a1, a2))
        return v62;
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
      v24 = *(_QWORD *)(v23 + 8);
      v25 = v24 + v22;
      if (v24 + v22 < v8)
        v8 = v24 + v22;
      if (!*(_BYTE *)(v23 + 59) || !*(_QWORD *)(v23 + 24))
      {
        v26 = v24 + v22;
        _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeGetGlyphsInRange missing glyphs"), v15, v16, v17, v18, v19, v20, v21, v59);
        v25 = v26;
      }
      if (!a4 && !a6 && !a7)
      {
        a4 = 0;
        a6 = 0;
        v27 = v61;
        goto LABEL_87;
      }
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 216) + 57))
        break;
      v27 = v61;
      if (v8 > v61)
      {
        v28 = 24 * v61;
        for (i = v61; v8 != i; ++i)
        {
          if (a4)
          {
            v30 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
            LODWORD(v31) = *(unsigned __int8 *)(v30 + 59);
            if (*(_BYTE *)(v30 + 59))
            {
              v31 = *(_QWORD *)(v30 + 24);
              if (v31)
              {
                v32 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
                switch(*(_BYTE *)(v30 + 57))
                {
                  case 0:
                    v33 = *(unsigned __int8 *)(v31 - v32 + i);
                    if (v33 >= 4)
                      v34 = v33;
                    else
                      v34 = 0xFFFFFF;
                    if (v33 <= 0xEF)
                      LODWORD(v31) = v34;
                    else
                      LODWORD(v31) = v33 & 3;
                    break;
                  case 1:
                    v35 = *(unsigned __int16 *)(v31 - 2 * v32 + 2 * i);
                    goto LABEL_30;
                  case 2:
                    v35 = *(_DWORD *)(v31 - 4 * v32 + 4 * i);
                    goto LABEL_30;
                  case 3:
                    v35 = *(_DWORD *)(v31 - 24 * v32 + v28);
LABEL_30:
                    if (v35 > 0xFF)
                      LODWORD(v31) = v35 >> 8;
                    else
                      LODWORD(v31) = ((char)v35 >> 7) & 0xFFFFFF;
                    break;
                  default:
                    LODWORD(v31) = 0;
                    break;
                }
              }
            }
            *a4++ = v31;
          }
          if (!a6)
            goto LABEL_46;
          v36 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
          LODWORD(v37) = *(unsigned __int8 *)(v36 + 59);
          if (*(_BYTE *)(v36 + 59))
          {
            v37 = *(_QWORD *)(v36 + 24);
            if (v37)
            {
              v38 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
              v39 = *(unsigned __int8 *)(v36 + 57);
              switch(v39)
              {
                case 3:
                  LOBYTE(v37) = *(_BYTE *)(v37 - 24 * v38 + v28);
                  break;
                case 2:
                  LODWORD(v37) = *(_DWORD *)(v37 - 4 * v38 + 4 * i);
                  break;
                case 1:
                  LOWORD(v37) = *(_WORD *)(v37 - 2 * v38 + 2 * i);
                  break;
                default:
                  LODWORD(v37) = 0;
                  goto LABEL_45;
              }
              LODWORD(v37) = v37 & 1;
            }
          }
LABEL_45:
          *a6++ = v37;
LABEL_46:
          if (a7)
          {
            v40 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
            LOBYTE(v41) = *(_BYTE *)(v40 + 59);
            if ((_BYTE)v41)
            {
              v41 = *(_QWORD *)(v40 + 24);
              if (v41)
              {
                v42 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
                switch(*(_BYTE *)(v40 + 57))
                {
                  case 0:
                    v43 = *(unsigned __int8 *)(v41 - v42 + i);
                    if (v43 < 0xF0)
                    {
                      if (v43 > 3)
                        goto LABEL_58;
                      LODWORD(v41) = (v43 >> 1) & 1;
                    }
                    else
                    {
                      LODWORD(v41) = (v43 >> 3) & 1;
                    }
                    break;
                  case 1:
                    v44 = *(unsigned __int16 *)(v41 - 2 * v42 + 2 * i);
                    goto LABEL_55;
                  case 2:
                    v44 = *(_DWORD *)(v41 - 4 * v42 + 4 * i);
                    goto LABEL_55;
                  case 3:
                    v44 = *(unsigned __int8 *)(v41 - 24 * v42 + v28);
LABEL_55:
                    LODWORD(v41) = (v44 >> 4) & 1;
                    break;
                  default:
LABEL_58:
                    LOBYTE(v41) = 0;
                    break;
                }
              }
            }
            *a7++ = v41;
          }
          v28 += 24;
        }
      }
LABEL_87:
      if (a5)
      {
        v49 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
        if (*(_BYTE *)(v49 + 59) && *(_QWORD *)(v49 + 32))
        {
          if (v8 > v27)
          {
            v50 = v27;
            while (1)
            {
              v51 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
              v52 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
              if (!*(_BYTE *)(v52 + 59))
                break;
              v53 = *(_QWORD *)(v52 + 32);
              if (v53)
              {
                v54 = *(unsigned __int8 *)(v52 + 58);
                if (v54 == 2)
                {
                  v53 = *(int *)(v53 - 4 * v51 + 4 * v50);
                  goto LABEL_99;
                }
                if (v54 == 1)
                {
                  v53 = *(__int16 *)(v53 - 2 * v51 + 2 * v50);
                  goto LABEL_99;
                }
                if (v54)
                  break;
                v53 = *(char *)(v53 - v51 + v50);
              }
LABEL_99:
              *a5++ = v50 + *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224) - v53 - v51;
              if (v8 == ++v50)
                goto LABEL_106;
            }
            v53 = 0;
            goto LABEL_99;
          }
        }
        else if (v8 > v27)
        {
          v55 = v27;
          do
          {
            *a5++ = v55 + *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224) - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
            ++v55;
          }
          while (v8 != v55);
        }
      }
LABEL_106:
      if (a8)
      {
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 216) + 40))
        {
          v56 = v27;
          if (v8 > v27)
          {
            do
              *a8++ = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 216) + 40)
                               - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232)
                               + v56++);
            while (v8 != v56);
          }
        }
        else
        {
          v57 = v8 - v27;
          if (v8 > v27)
          {
            v59 = v25;
            bzero(a8, v8 - v27);
            v25 = v59;
            v27 = v61;
            a8 += v57;
          }
        }
      }
      v62 = v62 - v27 + v8;
      a2 = v8;
      v8 = v60;
      if (v60 <= v25)
        return v62;
    }
    v27 = v61;
    if (v8 <= v61)
      goto LABEL_87;
    v45 = v61;
    while (1)
    {
      v46 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
      if (*(_BYTE *)(v46 + 59))
      {
        v47 = *(_QWORD *)(v46 + 24);
        if (v47)
        {
          v48 = *(unsigned __int8 *)(v47 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232) + v45);
          if (v48 < 0xF0)
          {
            if (v48 > 3)
            {
              LOBYTE(v47) = 0;
            }
            else
            {
              LODWORD(v47) = (v48 >> 1) & 1;
              v48 = 0xFFFFFF;
            }
          }
          else
          {
            LODWORD(v47) = (v48 >> 3) & 1;
            v48 &= 3u;
          }
          goto LABEL_70;
        }
      }
      else
      {
        LOBYTE(v47) = 0;
      }
      v48 = 0;
LABEL_70:
      if (a4)
        *a4 = v48;
      if (a7)
        *a7 = v47;
      if (a4)
        ++a4;
      else
        a4 = 0;
      if (a6)
        *a6++ = 0;
      if (a7)
        ++a7;
      else
        a7 = 0;
      if (v8 == ++v45)
        goto LABEL_87;
    }
  }
  return 0;
}

uint64_t _NSGlyphTreeGetShownGlyphsInRange(uint64_t a1, unint64_t a2, uint64_t a3, int *a4)
{
  unint64_t v5;
  unint64_t v6;
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
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  int v28;
  unsigned int v30;
  int v31;
  char v33;

  v5 = a2 + a3;
  if (a2 >= a2 + a3)
  {
    v8 = 0;
  }
  else
  {
    v6 = a2;
    v8 = 0;
    do
    {
      if (!_NSGlyphTreeMoveToGlyphIndex(a1, v6))
        break;
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
      v18 = *(_QWORD *)(v17 + 8);
      v19 = v18 + v16;
      if (v18 + v16 >= v5)
        v20 = v5;
      else
        v20 = v18 + v16;
      if (!*(_BYTE *)(v17 + 59) || !*(_QWORD *)(v17 + 24))
        _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeGetShownGlyphsInRange missing glyphs"), v9, v10, v11, v12, v13, v14, v15, v33);
      if (v6 < v20)
      {
        v21 = 24 * v6;
        do
        {
          v22 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
          if (*(_BYTE *)(v22 + 59))
          {
            v23 = *(_QWORD *)(v22 + 24);
            if (v23)
            {
              v24 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
              switch(*(_BYTE *)(v22 + 57))
              {
                case 0:
                  v25 = v23 - v24;
                  v26 = *(unsigned __int8 *)(v25 + v6);
                  if (v26 < 0xF0)
                  {
                    if (v26 > 3 || (v26 & 1) == 0)
                    {
LABEL_32:
                      v30 = *(unsigned __int8 *)(v25 + v6);
                      if (v30 >= 4)
                        v31 = v30;
                      else
                        v31 = 0xFFFFFF;
                      if (v30 <= 0xEF)
                        v28 = v31;
                      else
                        v28 = v30 & 3;
                      goto LABEL_38;
                    }
                  }
                  else if ((v26 & 4) == 0)
                  {
                    goto LABEL_32;
                  }
                  break;
                case 1:
                  v27 = *(unsigned __int16 *)(v23 - 2 * v24 + 2 * v6);
                  if ((v27 & 0x40) != 0)
                    break;
                  goto LABEL_23;
                case 2:
                  v27 = *(_DWORD *)(v23 - 4 * v24 + 4 * v6);
                  if ((v27 & 0x40) != 0)
                    break;
                  goto LABEL_23;
                case 3:
                  v27 = *(_DWORD *)(v23 - 24 * v24 + v21);
                  if ((v27 & 0x40) != 0)
                    break;
LABEL_23:
                  if (v27 <= 0xFF)
                  {
                    if ((v27 & 0x80) == 0)
                      break;
                    v28 = 0xFFFFFF;
LABEL_39:
                    if (a4)
                      *a4++ = v28;
                    ++v8;
                    break;
                  }
                  v28 = v27 >> 8;
LABEL_38:
                  if (v28)
                    goto LABEL_39;
                  break;
                default:
                  break;
              }
            }
          }
          ++v6;
          v21 += 24;
        }
        while (v20 != v6);
      }
      v6 = v20;
    }
    while (v5 > v19);
  }
  if (a4)
    *a4 = 0;
  return v8;
}

uint64_t _NSGlyphTreeGetPackedGlyphsInRange(uint64_t a1, unint64_t a2, uint64_t a3, _WORD *a4)
{
  unint64_t v4;
  unint64_t v6;
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
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  __int16 v27;
  unsigned int v29;
  int v30;
  char v32;
  unint64_t v33;

  v4 = a2 + a3;
  if (a2 >= a2 + a3)
    return 0;
  v6 = a2;
  v8 = 0;
  v33 = a2 + a3;
  do
  {
    if (!_NSGlyphTreeMoveToGlyphIndex(a1, v6))
      break;
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
    v18 = *(_QWORD *)(v17 + 8);
    v19 = v18 + v16;
    if (v18 + v16 < v4)
      v4 = v18 + v16;
    if (!*(_BYTE *)(v17 + 59) || !*(_QWORD *)(v17 + 24))
      _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeGetShownGlyphsInRange missing glyphs"), v9, v10, v11, v12, v13, v14, v15, v32);
    if (v6 < v4)
    {
      v20 = 24 * v6;
      do
      {
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
        LODWORD(v22) = *(unsigned __int8 *)(v21 + 59);
        if (*(_BYTE *)(v21 + 59) && (v22 = *(_QWORD *)(v21 + 24)) != 0)
        {
          v23 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
          switch(*(_BYTE *)(v21 + 57))
          {
            case 0:
              v24 = v22 - v23;
              v25 = *(unsigned __int8 *)(v24 + v6);
              if (v25 < 0xF0)
              {
                if (v25 <= 3 && (v25 & 1) != 0)
                  goto LABEL_34;
              }
              else if ((v25 & 4) != 0)
              {
                goto LABEL_34;
              }
              v29 = *(unsigned __int8 *)(v24 + v6);
              if (v29 >= 4)
                v30 = v29;
              else
                v30 = 0xFFFFFF;
              if (v29 <= 0xEF)
                LODWORD(v22) = v30;
              else
                LODWORD(v22) = v29 & 3;
              if (a4)
                goto LABEL_29;
              break;
            case 1:
              v26 = *(unsigned __int16 *)(v22 - 2 * v23 + 2 * v6);
              if ((v26 & 0x40) != 0)
                goto LABEL_34;
              goto LABEL_24;
            case 2:
              v26 = *(_DWORD *)(v22 - 4 * v23 + 4 * v6);
              if ((v26 & 0x40) != 0)
                goto LABEL_34;
              goto LABEL_24;
            case 3:
              v26 = *(_DWORD *)(v22 - 24 * v23 + v20);
              if ((v26 & 0x40) != 0)
                goto LABEL_34;
LABEL_24:
              if (v26 > 0xFF)
              {
                LODWORD(v22) = v26 >> 8;
                goto LABEL_28;
              }
              LODWORD(v22) = ((char)v26 >> 7) & 0xFFFFFF;
              if (a4)
                goto LABEL_29;
              break;
            default:
              LODWORD(v22) = 0;
              if (!a4)
                break;
              goto LABEL_29;
          }
        }
        else
        {
LABEL_28:
          if (a4)
          {
LABEL_29:
            if ((_DWORD)v22 == 0xFFFFFF)
              v27 = 0;
            else
              v27 = v22;
            *a4++ = v27;
          }
        }
        ++v8;
LABEL_34:
        ++v6;
        v20 += 24;
      }
      while (v4 != v6);
    }
    v6 = v4;
    v4 = v33;
  }
  while (v33 > v19);
  return v8;
}

void _NSGlyphTreeInsertNodeAfterCurrentNode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int64x2_t *v8;
  BOOL v9;
  int64x2_t *v10;
  int64x2_t *v12;
  unint64_t v13;
  uint64_t v14;
  int64x2_t *v15;
  uint64_t i;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  int64x2_t *v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = *(int64x2_t **)(*(_QWORD *)(a1 + 240) + 216);
  if (v8)
    v9 = a2 == 0;
  else
    v9 = 1;
  if (v9)
    return;
  v10 = (int64x2_t *)a2;
  v23 = 0u;
  v24 = 0u;
  while (1)
  {
    v12 = (int64x2_t *)v8[1].i64[0];
    if (!v12)
    {
      v22 = (int64x2_t *)malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
      v22[1].i64[1] = (uint64_t)v8;
      v22[2].i64[0] = (uint64_t)v10;
      v8[1].i64[0] = (uint64_t)v22;
      v10[1].i64[0] = (uint64_t)v22;
      _NSGlyphNodeSetInvariants(v22);
      *(_QWORD *)(*(_QWORD *)(a1 + 240) + 208) = v22;
      return;
    }
    v13 = 0;
    while (1)
    {
      v14 = v12[1].i64[v13 + 1];
      if (!v14)
        break;
      if (v8 == (int64x2_t *)v14)
      {
        v14 = (uint64_t)v8;
        break;
      }
      if (++v13 == 3)
      {
        v14 = 0;
        break;
      }
    }
    if (v8 != (int64x2_t *)v14)
    {
      _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeInsertNodeAfterCurrentNode found broken link"), a2, a3, a4, a5, a6, a7, a8, v23);
      v12 = v8;
      v15 = v10;
      if (!v8)
        return;
      goto LABEL_23;
    }
    if (!v12[2].i64[1])
      break;
    v15 = (int64x2_t *)malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
    for (i = 0; i != 3; ++i)
    {
      *(_QWORD *)((char *)&v23 + i * 8) = v12[1].i64[i + 1];
      v12[1].i64[i + 1] = 0;
    }
    v17 = v13 + 1;
    if (v13 <= 1)
    {
      v18 = 0;
      do
      {
        *((_QWORD *)&v24 + v18 + 1) = *((_QWORD *)&v23 + v18 + 2);
        v19 = v18 + 2;
        --v18;
      }
      while (v19 > v17);
    }
    *((_QWORD *)&v23 + v17) = v10;
    v20 = v23;
    v12[1].i64[1] = v23;
    *(_QWORD *)(v20 + 16) = v12;
    v12[2].i64[0] = *((_QWORD *)&v20 + 1);
    *(_QWORD *)(*((_QWORD *)&v20 + 1) + 16) = v12;
    _NSGlyphNodeSetInvariants(v12);
    v21 = v24;
    v15[1].i64[1] = v24;
    *(_QWORD *)(v21 + 16) = v15;
    v15[2].i64[0] = *((_QWORD *)&v21 + 1);
    *(_QWORD *)(*((_QWORD *)&v21 + 1) + 16) = v15;
    _NSGlyphNodeSetInvariants(v15);
LABEL_23:
    v10 = v15;
    v8 = v12;
    if (!v15)
      return;
  }
  if (!v13)
    v12[2].i64[1] = v12[2].i64[0];
  v12[2].i64[v13] = (uint64_t)v10;
  v10[1].i64[0] = (uint64_t)v12;
  _NSGlyphNodeSetInvariants(v12);
}

unsigned __int8 *_NSGlyphNodeCreateSubNode(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unsigned __int8 *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned __int8 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  size_t v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  BOOL v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL8 v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v6 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
  v6[59] = 1;
  *(_QWORD *)v6 = a3;
  *((_QWORD *)v6 + 1) = a3;
  v6[56] = a3 != 0;
  if (*(_QWORD *)(a1 + 24))
  {
    v7 = a2 + a3;
    v8 = *(char *)(a1 + 57);
    v9 = *(_BYTE *)(a1 + 57);
    if (v8 > 3)
      v10 = 0;
    else
      v10 = qword_18D6CBC78[v8];
    v11 = *(unsigned __int8 *)(a1 + 58);
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
    {
      if (a2)
      {
        v13 = _NSGlyphNodePrimitiveRelativeGlyphIndexForRelativeCharacterIndex(a1, a2) - 1;
        while (v13 != -1)
        {
          if ((_DWORD)v11 == 2)
          {
            v14 = *(int *)(v12 + 4 * v13);
          }
          else if ((_DWORD)v11 == 1)
          {
            v14 = *(__int16 *)(v12 + 2 * v13);
          }
          else if ((_DWORD)v11)
          {
            v14 = 0;
          }
          else
          {
            v14 = *(char *)(v12 + v13);
          }
          if (--v13 - v14 + 1 < a2)
          {
            a2 = v13 + 2;
            goto LABEL_19;
          }
        }
        a2 = 0;
      }
LABEL_19:
      if (v7 >= *(_QWORD *)a1)
      {
        v7 = *(_QWORD *)(a1 + 8);
      }
      else
      {
        v15 = _NSGlyphNodePrimitiveRelativeGlyphIndexForRelativeCharacterIndex(a1, v7) - 1;
        while (v15 != -1)
        {
          if ((_DWORD)v11 == 2)
          {
            v16 = *(int *)(v12 + 4 * v15);
          }
          else if ((_DWORD)v11 == 1)
          {
            v16 = *(__int16 *)(v12 + 2 * v15);
          }
          else if ((_DWORD)v11)
          {
            v16 = 0;
          }
          else
          {
            v16 = *(char *)(v12 + v15);
          }
          if (--v15 - v16 + 1 < v7)
          {
            v7 = v15 + 2;
            goto LABEL_33;
          }
        }
        v7 = 0;
      }
    }
LABEL_33:
    v17 = v7 - a2;
    *((_QWORD *)v6 + 1) = v7 - a2;
    v6[56] = *(_BYTE *)(a1 + 56);
    v6[57] = v9;
    v18 = *MEMORY[0x1E0C85AD8];
    if (v7 - a2 <= *MEMORY[0x1E0C85AD8] >> 1)
      v18 = 64;
    v19 = (v17 + v18 - 1) / v18 * v18;
    if (v19 >= 0x2000)
      v19 = 0x2000;
    if (v19 <= v17)
      v20 = v7 - a2;
    else
      v20 = v19;
    _NSGlyphNodeSetCapacity((uint64_t)v6, v20);
    memmove(*((void **)v6 + 3), (const void *)(*(_QWORD *)(a1 + 24) + a2 * v10), v17 * v10);
    if (v12)
    {
      if ((_DWORD)v11 == 2)
      {
        v21 = *(int *)(v12 + 4 * a2);
      }
      else if ((_DWORD)v11 == 1)
      {
        v21 = *(__int16 *)(v12 + 2 * a2);
      }
      else
      {
        v21 = (_DWORD)v11 ? 0 : *(char *)(v12 + a2);
      }
      _NSGlyphNodeSetDeltaFormat((uint64_t)v6, v11);
      v22 = v7 > a2;
      v23 = v7 - a2;
      if (v22)
      {
        v24 = 0;
        v25 = *((_QWORD *)v6 + 4);
        v35 = v12 + a2;
        v33 = v12 + 2 * a2;
        v34 = v12 + 4 * a2;
        do
        {
          if (v11 == 2)
          {
            v26 = *(int *)(v34 + 4 * v24);
          }
          else if (v11 == 1)
          {
            v26 = *(__int16 *)(v33 + 2 * v24);
          }
          else if (v11)
          {
            v26 = 0;
          }
          else
          {
            v26 = *(char *)(v35 + v24);
          }
          v27 = v26 - v21;
          v28 = v26 - v21 != (char)(v26 - v21);
          if (v27 == (__int16)v27)
            v29 = v28;
          else
            v29 = 2;
          if (v29 > v11)
          {
            _NSGlyphNodeSetDeltaFormat((uint64_t)v6, v29);
            v11 = v6[58];
            v25 = *((_QWORD *)v6 + 4);
          }
          if (v25)
          {
            switch(v11)
            {
              case 2uLL:
                *(_DWORD *)(v25 + 4 * v24) = v27;
                break;
              case 1uLL:
                *(_WORD *)(v25 + 2 * v24) = v27;
                break;
              case 0uLL:
                *(_BYTE *)(v25 + v24) = v27;
                break;
            }
          }
          ++v24;
        }
        while (v23 != v24);
      }
    }
    v30 = *(_QWORD *)(a1 + 40);
    if (v30)
    {
      v31 = (void *)*((_QWORD *)v6 + 5);
      if (*((_QWORD *)v6 + 6) && !v31)
      {
        v31 = malloc_type_calloc(*((_QWORD *)v6 + 6), 1uLL, 0x68C02440uLL);
        *((_QWORD *)v6 + 5) = v31;
        v30 = *(_QWORD *)(a1 + 40);
      }
      memmove(v31, (const void *)(v30 + a2), v17);
    }
  }
  return v6;
}

int64x2_t *_NSGlyphNodeTruncate(int64x2_t *a1, unint64_t a2, uint64_t a3)
{
  char *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  size_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  unint64_t v24;
  char *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  size_t v29;

  v5 = (char *)a1[1].i64[1];
  if (!v5)
  {
    a1->i64[0] = a3;
    a1->i64[1] = a3;
    return _NSGlyphNodeSetInvariants(a1);
  }
  v6 = a2;
  v7 = a2 + a3;
  v8 = a1[3].u8[10];
  v9 = a1[2].i64[0];
  if (v9)
  {
    if (a2)
    {
      v10 = _NSGlyphNodePrimitiveRelativeGlyphIndexForRelativeCharacterIndex((uint64_t)a1, a2) - 1;
      while (v10 != -1)
      {
        if ((_DWORD)v8 == 2)
        {
          v11 = *(int *)(v9 + 4 * v10);
        }
        else if ((_DWORD)v8 == 1)
        {
          v11 = *(__int16 *)(v9 + 2 * v10);
        }
        else if ((_DWORD)v8)
        {
          v11 = 0;
        }
        else
        {
          v11 = *(char *)(v9 + v10);
        }
        if (--v10 - v11 + 1 < v6)
        {
          v6 = v10 + 2;
          goto LABEL_17;
        }
      }
      v6 = 0;
    }
LABEL_17:
    if (v7 >= a1->i64[0])
    {
      v7 = a1->u64[1];
    }
    else
    {
      v12 = _NSGlyphNodePrimitiveRelativeGlyphIndexForRelativeCharacterIndex((uint64_t)a1, v7) - 1;
      while (v12 != -1)
      {
        if ((_DWORD)v8 == 2)
        {
          v13 = *(int *)(v9 + 4 * v12);
        }
        else if ((_DWORD)v8 == 1)
        {
          v13 = *(__int16 *)(v9 + 2 * v12);
        }
        else if ((_DWORD)v8)
        {
          v13 = 0;
        }
        else
        {
          v13 = *(char *)(v9 + v12);
        }
        if (--v12 - v13 + 1 < v7)
        {
          v7 = v12 + 2;
          goto LABEL_31;
        }
      }
      v7 = 0;
    }
  }
LABEL_31:
  v14 = v7 - v6;
  a1->i64[0] = a3;
  a1->i64[1] = v7 - v6;
  if (v6)
  {
    v15 = a1[3].i8[9];
    if (v15 > 3)
      v16 = 0;
    else
      v16 = qword_18D6CBC78[v15];
    memmove(v5, &v5[v16 * v6], v16 * v14);
    if (!v9
      || ((_DWORD)v8 == 2
        ? (v17 = *(int *)(v9 + 4 * v6))
        : (_DWORD)v8 == 1
        ? (v17 = *(__int16 *)(v9 + 2 * v6))
        : (_DWORD)v8
        ? (v17 = 0)
        : (v17 = *(char *)(v9 + v6)),
          v18 = v7 > v6,
          v19 = v7 - v6,
          !v18))
    {
LABEL_67:
      v25 = (char *)a1[2].i64[1];
      if (v25)
        memmove(v25, &v25[v6], v14);
      goto LABEL_69;
    }
    v20 = 0;
    while (1)
    {
      if (!v9)
        goto LABEL_51;
      if (v8 == 2)
      {
        v21 = *(int *)(v9 + 4 * v6 + 4 * v20);
        goto LABEL_54;
      }
      if (v8 == 1)
      {
        v21 = *(__int16 *)(v9 + 2 * v6 + 2 * v20);
        goto LABEL_54;
      }
      if (v8)
LABEL_51:
        v21 = 0;
      else
        v21 = *(char *)(v9 + v6 + v20);
LABEL_54:
      v22 = v21 - v17;
      v23 = v21 - v17 != (char)(v21 - v17);
      if (v22 == (__int16)v22)
        v24 = v23;
      else
        v24 = 2;
      if (v24 > v8)
      {
        _NSGlyphNodeSetDeltaFormat((uint64_t)a1, v24);
        v8 = a1[3].u8[10];
        v9 = a1[2].i64[0];
      }
      if (v9)
      {
        switch(v8)
        {
          case 2uLL:
            *(_DWORD *)(v9 + 4 * v20) = v22;
            break;
          case 1uLL:
            *(_WORD *)(v9 + 2 * v20) = v22;
            break;
          case 0uLL:
            *(_BYTE *)(v9 + v20) = v22;
            break;
        }
      }
      if (v19 == ++v20)
        goto LABEL_67;
    }
  }
LABEL_69:
  v26 = a1->u64[1];
  v27 = *MEMORY[0x1E0C85AD8];
  if (v26 <= *MEMORY[0x1E0C85AD8] >> 1)
    v27 = 64;
  v28 = (v26 + v27 - 1) / v27 * v27;
  if (v28 >= 0x2000)
    v28 = 0x2000;
  if (v28 <= v26)
    v29 = a1->u64[1];
  else
    v29 = v28;
  if (v29 < a1[3].i64[0])
    _NSGlyphNodeSetCapacity((uint64_t)a1, v29);
  return _NSGlyphNodeSetInvariants(a1);
}

uint64_t _NSGlyphTreeDeleteCurrentNode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  unint64_t i;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int64x2_t *v18;
  _QWORD *v19;
  uint64_t result;
  uint64_t v21;
  _QWORD *v22;
  _BYTE *v23;
  uint64_t v24;
  _BYTE *v25;
  char v26;

  while (2)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
    if (*(_QWORD *)(v9 + 16))
    {
      for (i = 0; i != 3; ++i)
      {
        v11 = *(uint64_t **)(*(_QWORD *)(a1 + 240) + 216);
        v12 = v11[2];
        v13 = *(uint64_t **)(v12 + 8 * i + 24);
        if (!v13)
          goto LABEL_12;
        if (v11 == v13)
        {
          *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216) = v12;
          if (i <= 1)
          {
            do
            {
              v16 = i;
              v17 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216) + 8 * i;
              *(_QWORD *)(v17 + 24) = *(_QWORD *)(v17 + 32);
              i = 1;
            }
            while (!v16);
          }
          goto LABEL_10;
        }
        v15 = *v13;
        v14 = v13[1];
        *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224) -= v15;
        *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232) -= v14;
      }
      if (*(_QWORD *)(*(_QWORD *)(a1 + 240) + 216))
      {
LABEL_12:
        _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeDeleteCurrentNode found broken link"), a2, a3, a4, a5, a6, a7, a8, v26);
        break;
      }
      v11 = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216) = MEMORY[0x10];
LABEL_10:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 216) + 40) = 0;
      _NSGlyphNodeFree(v11);
      v18 = *(int64x2_t **)(*(_QWORD *)(a1 + 240) + 216);
      if (!v18[1].i64[1])
        continue;
      _NSGlyphNodeSetInvariants(v18);
    }
    else
    {
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 208);
      _NSGlyphNodeFree(*(_BYTE **)(*(_QWORD *)(a1 + 240) + 216));
      if (v9 == v24)
      {
        v25 = malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
        v25[59] = 1;
        v25[56] = 0;
        *(_QWORD *)v25 = 0;
        *((_QWORD *)v25 + 1) = 0;
        *(_QWORD *)(*(_QWORD *)(a1 + 240) + 208) = v25;
        *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216) = v25;
      }
      else
      {
        *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216) = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 208);
      }
      *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232) = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224) = 0;
    }
    break;
  }
  v19 = (_QWORD *)(a1 + 240);
  for (result = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 208);
        !*(_BYTE *)(result + 59);
        result = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 208))
  {
    if (*(_QWORD *)(result + 32))
      break;
    v21 = *(_QWORD *)(result + 24);
    if (v21)
    {
      *(_QWORD *)(result + 24) = 0;
      *(_QWORD *)(v21 + 16) = 0;
      v22 = (_QWORD *)(*v19 + 208);
      if (v22[1] == *v22)
        v22[1] = v21;
      _NSGlyphNodeFree(*(_BYTE **)(*(_QWORD *)(a1 + 240) + 208));
      *(_QWORD *)(*(_QWORD *)(a1 + 240) + 208) = v21;
    }
    else
    {
      _NSGlyphNodeFree((_BYTE *)result);
      v23 = malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
      v23[59] = 1;
      v23[56] = 0;
      *(_QWORD *)v23 = 0;
      *((_QWORD *)v23 + 1) = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 240) + 208) = v23;
      *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216) = v23;
      *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232) = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224) = 0;
    }
    v19 = (_QWORD *)(a1 + 240);
  }
  return result;
}

void _NSGlyphTreeInsertNodeBeforeCurrentNode(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  int64x2_t *v11;
  int64x2_t *v12;
  int64x2_t *v13;
  unint64_t v14;
  uint64_t v15;
  int64x2_t *v16;
  int64x2_t *v17;
  uint64_t i;
  uint64_t v19;
  unint64_t v20;
  __int128 v21;
  __int128 v22;
  int64x2_t *v23;
  uint64_t v24;
  unint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = *(_QWORD *)(a1 + 240);
  if (!a2)
    goto LABEL_27;
  v11 = *(int64x2_t **)(v10 + 216);
  if (!v11)
    goto LABEL_27;
  v26 = 0u;
  v27 = 0u;
  v12 = a2;
  while (1)
  {
    v13 = (int64x2_t *)v11[1].i64[0];
    if (!v13)
    {
      v23 = (int64x2_t *)malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
      v23[1].i64[1] = (uint64_t)v12;
      v23[2].i64[0] = (uint64_t)v11;
      v12[1].i64[0] = (uint64_t)v23;
      v11[1].i64[0] = (uint64_t)v23;
      _NSGlyphNodeSetInvariants(v23);
      *(_QWORD *)(*(_QWORD *)(a1 + 240) + 208) = v23;
      goto LABEL_26;
    }
    v14 = 0;
    while (1)
    {
      v15 = v13[1].i64[v14 + 1];
      if (!v15)
        break;
      if (v11 == (int64x2_t *)v15)
      {
        v15 = (uint64_t)v11;
        break;
      }
      if (++v14 == 3)
      {
        v15 = 0;
        break;
      }
    }
    if (v11 != (int64x2_t *)v15)
    {
      _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeInsertNodeBeforeCurrentNode found broken link"), (uint64_t)a2, a3, a4, a5, a6, a7, a8, v26);
      v13 = v11;
      v16 = v12;
      goto LABEL_20;
    }
    if (!v13[2].i64[1])
      break;
    v17 = (int64x2_t *)malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
    v16 = v17;
    for (i = 0; i != 3; ++i)
    {
      *(_QWORD *)((char *)&v26 + i * 8) = v13[1].i64[i + 1];
      v13[1].i64[i + 1] = 0;
    }
    if (v14 <= 2)
    {
      v19 = 0;
      do
      {
        *((_QWORD *)&v27 + v19 + 1) = *((_QWORD *)&v26 + v19 + 2);
        v20 = v19 + 2;
        --v19;
      }
      while (v20 > v14);
    }
    *((_QWORD *)&v26 + v14) = v12;
    v21 = v26;
    v17[1].i64[1] = v26;
    *(_QWORD *)(v21 + 16) = v17;
    v17[2].i64[0] = *((_QWORD *)&v21 + 1);
    *(_QWORD *)(*((_QWORD *)&v21 + 1) + 16) = v17;
    _NSGlyphNodeSetInvariants(v17);
    v22 = v27;
    v13[1].i64[1] = v27;
    *(_QWORD *)(v22 + 16) = v13;
    v13[2].i64[0] = *((_QWORD *)&v22 + 1);
    *(_QWORD *)(*((_QWORD *)&v22 + 1) + 16) = v13;
    _NSGlyphNodeSetInvariants(v13);
    if (!v16)
      goto LABEL_26;
LABEL_20:
    v12 = v16;
    v11 = v13;
  }
  if (v14 <= 1)
  {
    v24 = 0;
    do
    {
      v13[2].i64[v24 + 1] = v13[2].i64[v24];
      v25 = v24-- + 1;
    }
    while (v25 > v14);
  }
  v13[1].i64[v14 + 1] = (uint64_t)v12;
  v12[1].i64[0] = (uint64_t)v13;
  _NSGlyphNodeSetInvariants(v13);
LABEL_26:
  v10 = *(_QWORD *)(a1 + 240);
LABEL_27:
  *(_QWORD *)(v10 + 224) += a2->i64[0];
  *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232) += a2->i64[1];
}

int64x2_t *_NSGlyphNodeInsertGlyph(int64x2_t *a1, uint64_t a2, unint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  size_t v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  int v29;
  unint64_t v30;
  int v31;
  unint64_t v32;
  int v33;
  __int16 v34;
  uint64_t v36;
  int v37;

  v9 = a3 - a2;
  v10 = 2;
  if (a5 <= 0xFF)
    v10 = a5 > 0xEF;
  if (a5 == 0xFFFFFF)
    v11 = 0;
  else
    v11 = v10;
  if (v9 == (__int16)v9)
    v12 = 0;
  else
    v12 = 2;
  if (v11 > a1[3].u8[9])
    _NSGlyphNodeSetGlyphFormat((uint64_t)a1, v11);
  if (!a1[2].i64[0] || v12 > a1[3].u8[10])
  {
    a1[3].i8[8] |= 4u;
    _NSGlyphNodeSetDeltaFormat((uint64_t)a1, v12);
  }
  v13 = a1->i64[1];
  v14 = v13 + 1;
  a1->i64[1] = v13 + 1;
  if ((unint64_t)(v13 + 1) > a1[3].i64[0])
  {
    v15 = *MEMORY[0x1E0C85AD8];
    if (v14 <= *MEMORY[0x1E0C85AD8] >> 1)
      v15 = 64;
    v16 = (v15 + v13) / v15 * v15;
    if (v16 >= 0x2000)
      v16 = 0x2000;
    if (v16 <= v14)
      v17 = v14;
    else
      v17 = v16;
    _NSGlyphNodeSetCapacity((uint64_t)a1, v17);
  }
  v18 = a1[3].i8[9];
  if (v18 > 3)
    v19 = 0;
  else
    v19 = qword_18D6CBC78[v18];
  v20 = a1[3].u8[10];
  v21 = a1[1].i64[1];
  v22 = a1[2].i64[0];
  v23 = a1[2].i64[1];
  if (v21)
  {
    v24 = a1->u64[1];
    if (a3 + 1 < v24)
    {
      v36 = a1[1].i64[1];
      memmove((void *)(v21 + v19 * (a3 + 1)), (const void *)(v21 + v19 * a3), (v24 + ~a3) * v19);
      v25 = a1->i64[1];
      v37 = v9;
      if (v25 - 1 > a3)
      {
        do
        {
          if (!v22)
            goto LABEL_34;
          if (v20 == 2)
          {
            v26 = *(int *)(v22 + 4 * v25 - 8);
            goto LABEL_37;
          }
          if (v20 == 1)
          {
            v26 = *(__int16 *)(v22 + 2 * v25 - 4);
            goto LABEL_37;
          }
          if (v20)
LABEL_34:
            v26 = 0;
          else
            v26 = *(char *)(v22 + v25 - 2);
LABEL_37:
          v27 = v26 - a4;
          if ((unint64_t)(v26 - a4 - 0x7FFF) >= 0xFFFFFFFFFFFF0000)
            v28 = (unint64_t)(v27 - 127) < 0xFFFFFFFFFFFFFF00;
          else
            v28 = 2;
          if (v28 > v20)
          {
            _NSGlyphNodeSetDeltaFormat((uint64_t)a1, v28);
            v20 = a1[3].u8[10];
            v22 = a1[2].i64[0];
          }
          if (v22)
          {
            v29 = v27 + 1;
            switch(v20)
            {
              case 2uLL:
                *(_DWORD *)(v22 + 4 * v25 - 4) = v29;
                break;
              case 1uLL:
                *(_WORD *)(v22 + 2 * v25 - 2) = v29;
                break;
              case 0uLL:
                *(_BYTE *)(v22 + v25 - 1) = v29;
                break;
            }
          }
          v30 = v25 - 2;
          --v25;
        }
        while (v30 > a3);
      }
      LODWORD(v9) = v37;
      if (v23)
        memmove((void *)(v23 + a3 + 1), (const void *)(v23 + a3), a1->i64[1] + ~a3);
      v21 = v36;
    }
    switch((int)v18)
    {
      case 0:
        if (a5 == 0xFFFFFF)
        {
          *(_BYTE *)(v21 + a3) = 0;
        }
        else if (a5 > 3)
        {
          if (a5 <= 0xEF)
            *(_BYTE *)(v21 + a3) = a5;
        }
        else
        {
          *(_BYTE *)(v21 + a3) = a5 | 0xF0;
        }
        break;
      case 1:
        *(_BYTE *)(v21 + 2 * a3) = 0;
        v34 = (_WORD)a5 << 8;
        if (a5 == 0xFFFFFF)
          v34 = 128;
        *(_WORD *)(v21 + 2 * a3) = v34 & 0xFF80 | *(_WORD *)(v21 + 2 * a3) & 0x7F;
        break;
      case 2:
        *(_BYTE *)(v21 + 4 * a3) = 0;
        v31 = a5 << 8;
        if (a5 == 0xFFFFFF)
          v31 = 128;
        *(_DWORD *)(v21 + 4 * a3) = v31 & 0xFFFFFF80 | *(_DWORD *)(v21 + 4 * a3) & 0x7F;
        break;
      case 3:
        v32 = v21 + 24 * a3;
        *(_BYTE *)v32 = 0;
        *(_QWORD *)(v32 + 16) = 0;
        v33 = a5 << 8;
        if (a5 == 0xFFFFFF)
          v33 = 128;
        *(_DWORD *)v32 = v33 & 0xFFFFFF80 | *(_DWORD *)v32 & 0x7F;
        break;
      default:
        break;
    }
  }
  if (v22)
  {
    switch(v20)
    {
      case 2uLL:
        *(_DWORD *)(v22 + 4 * a3) = v9;
        break;
      case 1uLL:
        *(_WORD *)(v22 + 2 * a3) = v9;
        if (!v23)
          goto LABEL_74;
        goto LABEL_73;
      case 0uLL:
        *(_BYTE *)(v22 + a3) = v9;
        if (!v23)
          goto LABEL_74;
        goto LABEL_73;
    }
  }
  if (v23)
LABEL_73:
    *(_BYTE *)(v23 + a3) = 0;
LABEL_74:
  a1[3].i8[8] |= 0x20u;
  return _NSGlyphNodeSetInvariants(a1);
}

void _NSGlyphTreeDeleteGlyphsInRange(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64x2_t *v17;
  size_t v18;
  size_t v19;
  size_t v20;
  size_t v21;
  __CFString *v22;
  size_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  size_t v27;
  uint64_t v28;
  uint64_t v29;
  size_t v30;
  char v31;
  unint64_t v32;

  if (a3)
  {
    v32 = a2 - 1;
    v12 = a3;
    do
    {
      if (_NSGlyphTreeMoveToGlyphIndex(a1, a2))
      {
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
        v17 = *(int64x2_t **)(*(_QWORD *)(a1 + 240) + 216);
        v18 = v17->i64[1] + v16;
        if (v12 + a2 <= v18)
          v19 = v12;
        else
          v19 = v18 - a2;
        if (!v17[3].i8[11] || !v17[1].i64[1])
        {
          v22 = CFSTR("!!! _NSGlyphTreeDeleteGlyphsInRange missing glyphs");
LABEL_14:
          _NSGlyphTreeLogDebug((NSString *)v22, v13, v14, v15, a5, a6, a7, a8, v31);
          goto LABEL_15;
        }
        v20 = a2 - v16;
        if (a2 <= v16)
        {
          v23 = v19 + a2;
          if (v19 + a2 >= v18)
          {
            v29 = v17->i64[0];
            _NSGlyphTreeDeleteCurrentNode(a1, v20, v14, v15, a5, a6, a7, a8);
            if (!v29)
              goto LABEL_15;
          }
          else
          {
            v24 = v17[2].i64[0];
            v25 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224);
            if (v24)
            {
              v26 = v17[3].u8[10];
              v27 = v23 - v16;
              if (v26 == 2)
              {
                v28 = *(int *)(v24 + 4 * v27);
              }
              else if (v26 == 1)
              {
                v28 = *(__int16 *)(v24 + 2 * v27);
              }
              else if (v17[3].i8[10])
              {
                v28 = 0;
              }
              else
              {
                v28 = *(char *)(v24 + v27);
              }
              v30 = v23 + v25 - v16 - v28;
            }
            else
            {
              v30 = v23 - v16 + v25;
            }
            v29 = v30 - v25;
            _NSGlyphNodeDeleteGlyphs(v17, v20, v19, v30 - v25);
            if (!v29)
              goto LABEL_15;
          }
          if (!a2 || !_NSGlyphTreeMoveToGlyphIndex(a1, v32))
          {
            v22 = CFSTR("!!! _NSGlyphTreeDeleteGlyphsInRange invalid glyph range");
            goto LABEL_14;
          }
          **(_QWORD **)(*(_QWORD *)(a1 + 240) + 216) += v29;
          v17 = *(int64x2_t **)(*(_QWORD *)(a1 + 240) + 216);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
          v21 = 0;
        }
        else
        {
          v21 = v19;
        }
        _NSGlyphNodeDeleteGlyphs(v17, v20, v21, 0);
      }
      else
      {
        _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeDeleteGlyphsInRange invalid glyph range"), v13, v14, v15, a5, a6, a7, a8, v31);
        v19 = v12;
      }
LABEL_15:
      v12 -= v19;
    }
    while (v12);
  }
  _NSLayoutTreeInvalidateLayoutForGlyphRange(a1, a2, a3, -a3, a5, a6, a7, a8, a9);
}

int64x2_t *_NSGlyphNodeDeleteGlyphs(int64x2_t *a1, size_t a2, size_t a3, uint64_t a4)
{
  unint64_t v8;
  size_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  size_t v17;
  size_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  size_t v22;
  size_t v23;
  _BOOL8 v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v28;

  if (a3 == (__int16)a3)
    v8 = 0;
  else
    v8 = 2;
  if (!a1[2].i64[0] || v8 > a1[3].u8[10])
  {
    a1[3].i8[8] |= 4u;
    _NSGlyphNodeSetDeltaFormat((uint64_t)a1, v8);
  }
  v9 = a1->i64[1] - a3;
  a1->i64[0] -= a4;
  a1->i64[1] = v9;
  if (a3)
  {
    v10 = a1[3].i8[9];
    if (v10 > 3)
      v11 = 0;
    else
      v11 = qword_18D6CBC78[v10];
    v12 = a1[3].u8[10];
    v14 = a1[1].i64[1];
    v13 = a1[2].i64[0];
    v15 = a1[2].i64[1];
    v16 = v9 > a2;
    v17 = v9 - a2;
    if (!v16)
    {
LABEL_39:
      if (v12 > 2)
        v26 = 0;
      else
        v26 = qword_18D6CBC98[v12];
      bzero((void *)(v14 + a1->i64[1] * v11), v11 * a3);
      bzero((void *)(v13 + a1->i64[1] * v26), v26 * a3);
      if (v15)
        bzero((void *)(v15 + a1->i64[1]), a3);
      goto LABEL_44;
    }
    v18 = a3 + a2;
    memmove((void *)(v14 + v11 * a2), (const void *)(v14 + v11 * (a3 + a2)), v11 * v17);
    v19 = a1->u64[1];
    if (v19 <= a2)
    {
LABEL_37:
      if (v15)
        memmove((void *)(v15 + a2), (const void *)(v15 + v18), v19 - a2);
      goto LABEL_39;
    }
    v28 = v15;
    v20 = a2;
    while (1)
    {
      if (!v13)
        goto LABEL_20;
      if (v12 == 2)
      {
        v21 = *(int *)(v13 + 4 * a3 + 4 * v20);
        goto LABEL_23;
      }
      if (v12 == 1)
      {
        v21 = *(__int16 *)(v13 + 2 * a3 + 2 * v20);
        goto LABEL_23;
      }
      if (v12)
LABEL_20:
        v21 = 0;
      else
        v21 = *(char *)(v13 + a3 + v20);
LABEL_23:
      v22 = v21 - a3;
      v23 = v22 + a4;
      v24 = v22 + a4 != (char)(v22 + a4);
      if (v23 == (__int16)v23)
        v25 = v24;
      else
        v25 = 2;
      if (v25 > v12)
      {
        _NSGlyphNodeSetDeltaFormat((uint64_t)a1, v25);
        v12 = a1[3].u8[10];
        v13 = a1[2].i64[0];
      }
      if (v13)
      {
        switch(v12)
        {
          case 2uLL:
            *(_DWORD *)(v13 + 4 * v20) = v23;
            break;
          case 1uLL:
            *(_WORD *)(v13 + 2 * v20) = v23;
            break;
          case 0uLL:
            *(_BYTE *)(v13 + v20) = v23;
            break;
        }
      }
      ++v20;
      v19 = a1->u64[1];
      if (v20 >= v19)
      {
        v15 = v28;
        v18 = a3 + a2;
        goto LABEL_37;
      }
    }
  }
LABEL_44:
  a1[3].i8[8] |= 0x20u;
  return _NSGlyphNodeSetInvariants(a1);
}

void _NSGlyphTreeReplaceGlyphAtIndex(uint64_t a1, unint64_t a2, unsigned int a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;
  char v24;

  if (_NSGlyphTreeMoveToGlyphIndex(a1, a2))
  {
    v13 = *(_QWORD *)(a1 + 240);
    v14 = *(_QWORD *)(v13 + 216);
    if (*(_BYTE *)(v14 + 59) && *(_QWORD *)(v14 + 24))
    {
      if (a3 == 0xFFFFFF
        || (a3 <= 0xFF ? (v15 = a3 > 0xEF) : (v15 = 2),
            v15 <= *(unsigned __int8 *)(v14 + 57)
         || (_NSGlyphNodeSetGlyphFormat(v14, v15),
             v13 = *(_QWORD *)(a1 + 240),
             v14 = *(_QWORD *)(v13 + 216),
             *(_BYTE *)(v14 + 59))))
      {
        v16 = *(_QWORD *)(v14 + 24);
        if (v16)
        {
          v17 = a2 - *(_QWORD *)(v13 + 232);
          switch(*(_BYTE *)(v14 + 57))
          {
            case 0:
              if (a3 == 0xFFFFFF)
              {
                *(_BYTE *)(v16 + v17) = 0;
              }
              else if (a3 > 3)
              {
                if (a3 <= 0xEF)
                  *(_BYTE *)(v16 + v17) = a3;
              }
              else
              {
                *(_BYTE *)(v16 + v17) = a3 | 0xF0;
              }
              break;
            case 1:
              *(_BYTE *)(v16 + 2 * v17) = 0;
              v21 = (_WORD)a3 << 8;
              if (a3 == 0xFFFFFF)
                v21 = 128;
              *(_WORD *)(v16 + 2 * v17) = v21 & 0xFF80 | *(_WORD *)(v16 + 2 * v17) & 0x7F;
              break;
            case 2:
              *(_BYTE *)(v16 + 4 * v17) = 0;
              v18 = a3 << 8;
              if (a3 == 0xFFFFFF)
                v18 = 128;
              *(_DWORD *)(v16 + 4 * v17) = v18 & 0xFFFFFF80 | *(_DWORD *)(v16 + 4 * v17) & 0x7F;
              break;
            case 3:
              v19 = v16 + 24 * v17;
              *(_BYTE *)v19 = 0;
              *(_QWORD *)(v19 + 16) = 0;
              v20 = a3 << 8;
              if (a3 == 0xFFFFFF)
                v20 = 128;
              *(_DWORD *)v19 = v20 & 0xFFFFFF80 | *(_DWORD *)v19 & 0x7F;
              break;
            default:
              break;
          }
        }
      }
      v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 216) + 40);
      if (v22)
        *(_BYTE *)(v22 + a2 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232)) = 0;
    }
    else
    {
      _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeReplaceGlyphAtIndex missing glyphs"), v6, v7, v8, v9, v10, v11, v12, v24);
    }
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
    if ((*(_BYTE *)(v23 + 56) & 0x20) == 0)
    {
      *(_BYTE *)(v23 + 56) |= 0x20u;
      _NSGlyphNodeSetInvariants(*(int64x2_t **)(*(_QWORD *)(a1 + 240) + 216));
    }
  }
  else
  {
    _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeReplaceGlyphAtIndex invalid glyph index %lu"), v6, v7, v8, v9, v10, v11, v12, a2);
  }
}

void _NSGlyphTreeSetCharacterIndexForGlyphAtIndex(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int64x2_t *v12;
  uint64_t v13;
  uint64_t v14;
  size_t v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  int v20;
  unint64_t v21;
  unint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  size_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  __CFString *v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  _BOOL8 v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  int v74;
  BOOL v75;
  uint64_t *v76;
  unint64_t v77;
  int64x2_t *v78;
  uint64_t v79;
  BOOL v80;
  size_t v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  unsigned int v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  uint64_t v91;

  if (!_NSGlyphTreeMoveToGlyphIndex(a1, a3))
    goto LABEL_63;
  v12 = *(int64x2_t **)(*(_QWORD *)(a1 + 240) + 216);
  if (!v12[3].i8[11])
    goto LABEL_63;
  v13 = v12[1].i64[1];
  if (!v13)
    goto LABEL_63;
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
  v15 = a3 - v14;
  switch(v12[3].i8[9])
  {
    case 0:
      v16 = *(unsigned __int8 *)(v13 + v15);
      if (v16 <= 0xEF)
      {
        if (v16 > 3)
        {
          v18 = 0;
          v17 = v16;
        }
        else
        {
          v18 = (8 * v16) & 0x10 | (v16 << 6) | 0xFFFFFF80;
          v17 = 0xFFFFFF;
        }
      }
      else
      {
        v17 = v16 & 3;
        v18 = (16 * v16) & 0x40 | (16 * ((v16 >> 3) & 1));
      }
      break;
    case 1:
      v18 = *(unsigned __int16 *)(v13 + 2 * v15);
      goto LABEL_11;
    case 2:
      v18 = *(_DWORD *)(v13 + 4 * v15);
      goto LABEL_11;
    case 3:
      v18 = *(_DWORD *)(v13 + 24 * v15);
LABEL_11:
      if (v18 >= 0x100)
        v17 = v18 >> 8;
      else
        v17 = ((char)v18 >> 7) & 0xFFFFFF;
      break;
    default:
      v17 = 0;
      v18 = 0;
      break;
  }
  v19 = v12[2].i64[1];
  if (v19)
    v20 = *(unsigned __int8 *)(v19 + v15);
  else
    v20 = 0;
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224);
  if (v21 > a2 && a3 == v14 && v14 != 0)
  {
    v28 = v12[2].i64[0];
    if (v28)
    {
      v29 = v12[3].u8[10];
      if (v29 == 2)
      {
        v30 = *(int *)(v28 + 4);
      }
      else if (v29 == 1)
      {
        v30 = *(__int16 *)(v28 + 2);
      }
      else if (v12[3].i8[10])
      {
        v30 = 0;
      }
      else
      {
        v30 = *(char *)(v28 + 1);
      }
      v31 = v21 + 1 - v30;
    }
    else
    {
      v31 = v21 + 1;
    }
    v32 = v31 - v21;
    _NSGlyphNodeDeleteGlyphs(v12, v15, 1uLL, v31 - v21);
    if (_NSGlyphTreeMoveToGlyphIndex(a1, a3 - 1))
    {
      v40 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
      if (*(_BYTE *)(v40 + 59))
      {
        if (*(_QWORD *)(v40 + 24))
        {
          v41 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224) + *(_QWORD *)v40 - 1;
          goto LABEL_59;
        }
      }
    }
LABEL_62:
    _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeSetCharacterIndexForGlyphAtIndex invalid glyph index %lu"), v33, v34, v35, v36, v37, v38, v39, a3);
    goto LABEL_63;
  }
  v24 = v12->i64[0] + v21;
  if (v24 > a2
    || a3 + 1 != v12->i64[1] + v14
    || a3 + 1 >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 208) + 8))
  {
    goto LABEL_63;
  }
  v25 = v12[2].i64[0];
  if (v25)
  {
    v26 = v12[3].u8[10];
    if (v26 == 2)
    {
      v27 = *(int *)(v25 + 4 * v15);
    }
    else if (v26 == 1)
    {
      v27 = *(__int16 *)(v25 + 2 * v15);
    }
    else if (v12[3].i8[10])
    {
      v27 = 0;
    }
    else
    {
      v27 = *(char *)(v25 + v15);
    }
    v42 = v21 + a3 - v14 - v27;
  }
  else
  {
    v42 = v21 + v15;
  }
  v32 = v24 - v42;
  _NSGlyphNodeDeleteGlyphs(v12, v15, 1uLL, v24 - v42);
  if (!_NSGlyphTreeMoveToGlyphIndex(a1, a3))
    goto LABEL_62;
  v40 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
  if (!*(_BYTE *)(v40 + 59) || !*(_QWORD *)(v40 + 24))
    goto LABEL_62;
  v41 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224);
LABEL_59:
  if (v41 != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_QWORD *)v40 += v32;
    if (v17 == 0xFFFFFF)
    {
      v43 = 0;
    }
    else if (v17 <= 0xFF)
    {
      v43 = v17 > 0xEF;
    }
    else
    {
      v43 = 2;
    }
    if ((_BYTE)v18)
      v75 = v43 == 0;
    else
      v75 = 0;
    v76 = *(uint64_t **)(a1 + 240);
    if (v75)
      v77 = 1;
    else
      v77 = v43;
    v78 = (int64x2_t *)v76[27];
    if (v77 > v78[3].u8[9])
    {
      v79 = v41;
      _NSGlyphNodeSetGlyphFormat(v76[27], v77);
      v41 = v79;
      v76 = *(uint64_t **)(a1 + 240);
      v78 = (int64x2_t *)v76[27];
    }
    if (v78[2].i64[1])
      v80 = 1;
    else
      v80 = v20 == 0;
    if (!v80)
    {
      v78[3].i8[8] |= 8u;
      v76 = *(uint64_t **)(a1 + 240);
      v78 = (int64x2_t *)v76[27];
      v81 = v78[3].u64[0];
      if (v81)
      {
        if (!v78[2].i64[1])
        {
          v91 = v41;
          v82 = malloc_type_calloc(v81, 1uLL, 0x68C02440uLL);
          v41 = v91;
          v78[2].i64[1] = (uint64_t)v82;
          v76 = *(uint64_t **)(a1 + 240);
          v78 = (int64x2_t *)v76[27];
        }
      }
    }
    _NSGlyphNodeInsertGlyph(v78, v41 - v76[28], a3 - v76[29], v32, v17);
    v83 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
    if (*(_BYTE *)(v83 + 59))
    {
      v84 = *(_QWORD *)(v83 + 24);
      if (v84)
      {
        v85 = a3 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
        switch(*(_BYTE *)(v83 + 57))
        {
          case 0:
            v86 = *(unsigned __int8 *)(v84 + v85);
            if (v86 < 0xF0)
            {
              if (v86 > 3)
                break;
              v87 = (v18 >> 3) & 2 | (v18 >> 6) & 1;
            }
            else
            {
              v87 = (v18 >> 1) & 8 | (v18 >> 4) & 4 | v86 & 3 | 0xF0;
            }
            *(_BYTE *)(v84 + v85) = v87;
            break;
          case 1:
            v88 = 2 * v85;
            goto LABEL_144;
          case 2:
            v88 = 4 * v85;
            goto LABEL_144;
          case 3:
            v88 = 24 * v85;
LABEL_144:
            *(_BYTE *)(v84 + v88) = v18;
            break;
          default:
            break;
        }
      }
    }
    v89 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 216) + 40);
    if (v89)
      *(_BYTE *)(v89 + a3 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232)) = v20;
  }
LABEL_63:
  if (_NSGlyphTreeMoveToGlyphIndex(a1, a3))
  {
    v51 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 224);
    v52 = v51 - a2;
    if (v51 > a2 || (v53 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216), *(_QWORD *)v53 + v51 <= a2))
    {
      v60 = CFSTR("!!! _NSGlyphTreeSetCharacterIndexForGlyphAtIndex invalid char index 1");
LABEL_76:
      _NSGlyphTreeLogDebug((NSString *)v60, v44, v45, v46, v47, v48, v49, v50, a9);
      return;
    }
    v54 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
    v55 = a3 - v54;
    if (a3 > v54)
    {
      if (*(_BYTE *)(v53 + 59) && (v56 = *(_QWORD *)(v53 + 32)) != 0)
      {
        v57 = *(unsigned __int8 *)(v53 + 58);
        v58 = a3 - 1 - v54;
        if (v57 == 2)
        {
          v59 = *(int *)(v56 + 4 * v58);
        }
        else if (v57 == 1)
        {
          v59 = *(__int16 *)(v56 + 2 * v58);
        }
        else
        {
          v59 = *(_BYTE *)(v53 + 58) ? 0 : *(char *)(v56 + v58);
        }
        v61 = v51 + a3 - 1 - v54 - v59;
      }
      else
      {
        v61 = v51 + a3 + ~v54;
      }
      if (v61 > a2)
      {
        v60 = CFSTR("!!! _NSGlyphTreeSetCharacterIndexForGlyphAtIndex invalid char index 2");
        goto LABEL_76;
      }
    }
    v62 = a3 + 1;
    if (a3 + 1 < *(_QWORD *)(v53 + 8) + v54)
    {
      if (*(_BYTE *)(v53 + 59) && (v63 = *(_QWORD *)(v53 + 32)) != 0)
      {
        v44 = *(unsigned __int8 *)(v53 + 58);
        v64 = v62 - v54;
        if ((_DWORD)v44 == 2)
        {
          v65 = *(int *)(v63 + 4 * v64);
        }
        else if ((_DWORD)v44 == 1)
        {
          v65 = *(__int16 *)(v63 + 2 * v64);
        }
        else
        {
          v65 = *(_BYTE *)(v53 + 58) ? 0 : *(char *)(v63 + v64);
        }
        v66 = v51 + v62 - v54 - v65;
      }
      else
      {
        v66 = v51 + v62 - v54;
      }
      if (v66 < a2)
      {
        v60 = CFSTR("!!! _NSGlyphTreeSetCharacterIndexForGlyphAtIndex invalid char index 3");
        goto LABEL_76;
      }
    }
    v67 = v55 + v52;
    v68 = v55 + v52 != (char)(v55 + v52);
    if (v67 == (__int16)v67)
      v69 = v68;
    else
      v69 = 2;
    if (*(_BYTE *)(v53 + 59) && *(_QWORD *)(v53 + 24))
    {
      if (*(_QWORD *)(v53 + 32))
      {
        if (v69 > *(unsigned __int8 *)(v53 + 58))
          _NSGlyphNodeSetDeltaFormat(v53, v69);
      }
      else
      {
        *(_BYTE *)(v53 + 56) |= 4u;
        _NSGlyphNodeSetDeltaFormat(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 216), v69);
        _NSGlyphNodeSetInvariants(*(int64x2_t **)(*(_QWORD *)(a1 + 240) + 216));
      }
      v71 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
      if (*(_BYTE *)(v71 + 59))
      {
        v72 = *(_QWORD *)(v71 + 32);
        if (v72)
        {
          v73 = a3 - *(_QWORD *)(*(_QWORD *)(a1 + 240) + 232);
          v74 = *(unsigned __int8 *)(v71 + 58);
          switch(v74)
          {
            case 2:
              *(_DWORD *)(v72 + 4 * v73) = v67;
              break;
            case 1:
              *(_WORD *)(v72 + 2 * v73) = v67;
              break;
            case 0:
              *(_BYTE *)(v72 + v73) = v67;
              break;
          }
        }
      }
    }
    else
    {
      _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeSetCharacterIndexForGlyphAtIndex missing glyphs"), v69, v45, v46, v47, v48, v49, v50, v90);
    }
    v70 = *(_QWORD *)(*(_QWORD *)(a1 + 240) + 216);
    if ((*(_BYTE *)(v70 + 56) & 0x20) == 0)
    {
      *(_BYTE *)(v70 + 56) |= 0x20u;
      _NSGlyphNodeSetInvariants(*(int64x2_t **)(*(_QWORD *)(a1 + 240) + 216));
    }
  }
  else
  {
    _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeSetCharacterIndexForGlyphAtIndex invalid glyph index %lu"), v44, v45, v46, v47, v48, v49, v50, a3);
  }
}

void _NSGlyphNodeSetDeltaFormat(uint64_t a1, unint64_t a2)
{
  size_t v4;
  size_t v5;
  __int16 *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t i;
  int v12;

  v4 = *(_QWORD *)(a1 + 48);
  if (a2 > 2)
  {
    v5 = 0;
    if (!v4)
      return;
LABEL_5:
    v6 = *(__int16 **)(a1 + 32);
    if (v6)
    {
      v7 = *(unsigned __int8 *)(a1 + 58);
      if (v7 == a2)
      {
LABEL_29:
        *(_BYTE *)(a1 + 58) = a2;
        return;
      }
      v8 = malloc_type_calloc(v4, v5, 0x232E7F18uLL);
      v9 = v8;
      v10 = *(_QWORD *)(a1 + 8);
      if (v10)
      {
        for (i = 0; i < v10; ++i)
        {
          if ((_DWORD)v7 == 2)
          {
            v12 = *(_DWORD *)&v6[2 * i];
            if (v8)
              goto LABEL_19;
          }
          else if ((_DWORD)v7 == 1)
          {
            v12 = v6[i];
            if (v8)
              goto LABEL_19;
          }
          else if ((_DWORD)v7)
          {
            v12 = 0;
            if (v8)
            {
LABEL_19:
              switch(a2)
              {
                case 2uLL:
                  *((_DWORD *)v8 + i) = v12;
                  break;
                case 1uLL:
                  *((_WORD *)v8 + i) = v12;
                  break;
                case 0uLL:
                  *((_BYTE *)v8 + i) = v12;
                  v10 = *(_QWORD *)(a1 + 8);
                  break;
              }
            }
          }
          else
          {
            v12 = *((char *)v6 + i);
            if (v8)
              goto LABEL_19;
          }
        }
      }
      free(v6);
    }
    else
    {
      v9 = malloc_type_calloc(v4, v5, 0x6D5A52B7uLL);
    }
    *(_QWORD *)(a1 + 32) = v9;
    goto LABEL_29;
  }
  v5 = qword_18D6CBC98[a2];
  if (v4)
    goto LABEL_5;
}

void _NSGlyphTreeSetDrawsOutsideLineFragmentForGlyphAtIndex(uint64_t a1, unint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
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
  unint64_t v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  int v26;
  int v27;

  if (_NSGlyphTreeMoveToGlyphIndex(a1, a2))
  {
    v19 = *(_QWORD *)(a1 + 240);
    v20 = *(_QWORD *)(v19 + 216);
    if (*(_BYTE *)(v20 + 59) && *(_QWORD *)(v20 + 24))
    {
      if (!a3
        || *(_BYTE *)(v20 + 57)
        || (_NSGlyphNodeSetGlyphFormat(v20, 1uLL),
            v19 = *(_QWORD *)(a1 + 240),
            v20 = *(_QWORD *)(v19 + 216),
            *(_BYTE *)(v20 + 59)))
      {
        v21 = *(_QWORD *)(v20 + 24);
        if (v21)
        {
          v22 = a2 - *(_QWORD *)(v19 + 232);
          v23 = *(unsigned __int8 *)(v20 + 57);
          switch(v23)
          {
            case 3:
              v25 = 24 * v22;
              if (a3)
                v26 = 32;
              else
                v26 = 0;
              *(_DWORD *)(v21 + v25) = *(_DWORD *)(v21 + v25) & 0xFFFFFFDF | v26;
              break;
            case 2:
              if (a3)
                v27 = 32;
              else
                v27 = 0;
              *(_DWORD *)(v21 + 4 * v22) = *(_DWORD *)(v21 + 4 * v22) & 0xFFFFFFDF | v27;
              break;
            case 1:
              if (a3)
                v24 = 32;
              else
                v24 = 0;
              *(_WORD *)(v21 + 2 * v22) = *(_WORD *)(v21 + 2 * v22) & 0xFFDF | v24;
              break;
          }
        }
      }
    }
    else if (a3)
    {
      _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeSetDrawsOutsideLineFragmentForGlyphAtIndex missing glyphs"), v12, v13, v14, v15, v16, v17, v18, a9);
    }
  }
  else
  {
    _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeSetDrawsOutsideLineFragmentForGlyphAtIndex invalid glyph index %lu"), v12, v13, v14, v15, v16, v17, v18, a2);
  }
}

void _NSGlyphTreeSetEllipsisAttributeForGlyphAtIndex(uint64_t a1, unint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
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
  unint64_t v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  int v26;
  int v27;

  if (_NSGlyphTreeMoveToGlyphIndex(a1, a2))
  {
    v19 = *(_QWORD *)(a1 + 240);
    v20 = *(_QWORD *)(v19 + 216);
    if (*(_BYTE *)(v20 + 59) && *(_QWORD *)(v20 + 24))
    {
      if (!a3
        || *(_BYTE *)(v20 + 57)
        || (_NSGlyphNodeSetGlyphFormat(v20, 1uLL),
            v19 = *(_QWORD *)(a1 + 240),
            v20 = *(_QWORD *)(v19 + 216),
            *(_BYTE *)(v20 + 59)))
      {
        v21 = *(_QWORD *)(v20 + 24);
        if (v21)
        {
          v22 = a2 - *(_QWORD *)(v19 + 232);
          v23 = *(unsigned __int8 *)(v20 + 57);
          switch(v23)
          {
            case 3:
              v25 = 24 * v22;
              if (a3)
                v26 = 2;
              else
                v26 = 0;
              *(_DWORD *)(v21 + v25) = *(_DWORD *)(v21 + v25) & 0xFFFFFFFD | v26;
              break;
            case 2:
              if (a3)
                v27 = 2;
              else
                v27 = 0;
              *(_DWORD *)(v21 + 4 * v22) = *(_DWORD *)(v21 + 4 * v22) & 0xFFFFFFFD | v27;
              break;
            case 1:
              if (a3)
                v24 = 2;
              else
                v24 = 0;
              *(_WORD *)(v21 + 2 * v22) = *(_WORD *)(v21 + 2 * v22) & 0xFFFD | v24;
              break;
          }
        }
      }
    }
    else if (a3)
    {
      _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeSetEllipsisAttributeForGlyphAtIndex missing glyphs"), v12, v13, v14, v15, v16, v17, v18, a9);
    }
  }
  else
  {
    _NSGlyphTreeLogDebug((NSString *)CFSTR("!!! _NSGlyphTreeSetEllipsisAttributeForGlyphAtIndex invalid glyph index %lu"), v12, v13, v14, v15, v16, v17, v18, a2);
  }
}

uint64_t charIsNormalWhitespace(uint64_t a1)
{
  if (charIsNormalWhitespace_once != -1)
    dispatch_once(&charIsNormalWhitespace_once, &__block_literal_global_422);
  return objc_msgSend((id)charIsNormalWhitespace_set, "characterIsMember:", a1);
}

void sub_18D63EAE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Unwind_Resume(a1);
}

void sub_18D63F84C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D63FB54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D640930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void __charIsNormalWhitespace_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "removeCharactersInRange:", 160, 1);
  objc_msgSend(v3, "removeCharactersInRange:", 9, 1);
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)charIsNormalWhitespace_set;
  charIsNormalWhitespace_set = v1;

}

uint64_t _NSRemoveDirtyLayoutManager(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v7;

  result = _dirtyLMs;
  if (_dirtyLMs)
  {
    result = objc_msgSend((id)_dirtyLMs, "count");
    if (result)
    {
      v3 = result;
      v4 = 0;
      for (i = 0; i != v3; ++i)
      {
        result = objc_msgSend((id)_dirtyLMs, "pointerAtIndex:", v4 + i);
        if (result == a1 || result == 0)
        {
          v7 = result;
          result = objc_msgSend((id)_dirtyLMs, "removePointerAtIndex:", v4 + i);
          if (v7)
            break;
          --v4;
        }
      }
    }
  }
  *(_DWORD *)(a1 + 64) &= ~0x100u;
  return result;
}

void _NSAddDirtyLayoutManager(uint64_t a1)
{
  id v2;
  __CFRunLoop *Current;
  __CFRunLoop *v4;

  v2 = (id)_dirtyLMs;
  if (!_dirtyLMs)
  {
    v2 = (id)objc_msgSend(MEMORY[0x1E0CB3868], "pointerArrayWithOptions:", 517);
    _dirtyLMs = (uint64_t)v2;
  }
  if ((*(_BYTE *)(a1 + 65) & 1) == 0)
  {
    objc_msgSend(v2, "addPointer:", a1);
    *(_DWORD *)(a1 + 64) |= 0x100u;
  }
  if (!_immediateBackgroundLayoutObserver)
  {
    _immediateBackgroundLayoutObserver = (uint64_t)CFRunLoopObserverCreate(0, 2uLL, 0, 400000, (CFRunLoopObserverCallBack)_NSPostBackgroundLayout, 0);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddObserver(Current, (CFRunLoopObserverRef)_immediateBackgroundLayoutObserver, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
  }
  if (!_backgroundLayoutObserver)
  {
    _backgroundLayoutObserver = (uint64_t)CFRunLoopObserverCreate(0, 0x20uLL, 1u, 400000, (CFRunLoopObserverCallBack)_NSPostBackgroundLayout, 0);
    v4 = CFRunLoopGetCurrent();
    CFRunLoopAddObserver(v4, (CFRunLoopObserverRef)_backgroundLayoutObserver, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
  }
}

void _NSPostBackgroundLayout()
{
  double v0;
  __CFRunLoop *Current;
  __CFRunLoop *v2;

  MEMORY[0x18D7912E0](0);
  if (_immediateBackgroundLayoutObserver)
  {
    CFRunLoopObserverInvalidate((CFRunLoopObserverRef)_immediateBackgroundLayoutObserver);
    CFRelease((CFTypeRef)_immediateBackgroundLayoutObserver);
    _immediateBackgroundLayoutObserver = 0;
  }
  if (objc_msgSend((id)_dirtyLMs, "count"))
  {
    if (!_backgroundLayoutTimer)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      _backgroundLayoutTimer = (uint64_t)CFRunLoopTimerCreate(0, v0 + 0.001, 0.0, 0, 400000, (CFRunLoopTimerCallBack)_NSTimeBackgroundLayout, 0);
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddTimer(Current, (CFRunLoopTimerRef)_backgroundLayoutTimer, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    }
    if (!_backgroundLayoutObserver)
    {
      _backgroundLayoutObserver = (uint64_t)CFRunLoopObserverCreate(0, 0x20uLL, 1u, 400000, (CFRunLoopObserverCallBack)_NSPostBackgroundLayout, 0);
      v2 = CFRunLoopGetCurrent();
      CFRunLoopAddObserver(v2, (CFRunLoopObserverRef)_backgroundLayoutObserver, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    }
  }
  else if (_backgroundLayoutObserver)
  {
    CFRunLoopObserverInvalidate((CFRunLoopObserverRef)_backgroundLayoutObserver);
    CFRelease((CFTypeRef)_backgroundLayoutObserver);
    _backgroundLayoutObserver = 0;
  }
  JUMPOUT(0x18D7912D4);
}

unint64_t _NSFastFillAllLayoutHolesForGlyphRange(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t *v16;
  unint64_t result;
  char v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  BOOL v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  __int16 v32;
  unint64_t i;
  uint64_t v34;
  uint64_t v35;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  char v47;
  char v48;
  char v49;
  char v50;
  unint64_t v51;
  unint64_t v52;
  char v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  __int128 v57;
  __int128 v58;
  _OWORD v59[4];
  __int128 v60;

  v56 = -1;
  v6 = objc_msgSend(*(id *)(a1 + 8), "length");
  v51 = a3;
  v7 = a2 + a3;
  v8 = *(_QWORD *)(a1 + 240);
  v9 = 1;
  v52 = a2;
  do
  {
    v10 = objc_msgSend((id)objc_msgSend((id)a1, "textStorage"), "_isStringDrawingTextStorage");
    v11 = v10;
    if ((v10 & 1) == 0 && !*(_QWORD *)(v8 + 56))
    {
      v49 = v10;
      v12 = (void *)MEMORY[0x1E0CB38E0];
      v13 = objc_msgSend((id)a1, "zone");
      v14 = v12;
      v11 = v49;
      v15 = (void *)objc_msgSend((id)objc_msgSend(v14, "allocWithZone:", v13), "init");
      v16 = (unint64_t *)(v8 + 56);
      while (!__ldaxr(v16))
      {
        if (!__stlxr((unint64_t)v15, v16))
          goto LABEL_9;
      }
      __clrex();

    }
LABEL_9:
    result = objc_msgSend(*(id *)(v8 + 56), "lock");
    if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 240) + 56) & 1) == 0)
    {
      v19 = 0;
      if ((v11 & 1) != 0)
        goto LABEL_94;
LABEL_93:
      result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 240) + 56), "unlock");
      goto LABEL_94;
    }
    v50 = v11;
    v48 = v9;
    v53 = 0;
    v19 = 0;
    while (1)
    {
      if ((*(_DWORD *)(a1 + 64) & 0x40000000) != 0)
        v20 = a2;
      else
        v20 = 0;
      v55 = 0;
      v21 = v7 - v20;
      if (v7 - v20 <= 0x400)
        v21 = 1024;
      v22 = v21 >= 0x4000 ? 0x4000 : v21;
      result = _NSLayoutTreeGetFirstHoleAfterGlyphIndexWithLength(a1, v20, v22, &v56, &v55);
      v23 = v56;
      if (v56 >= v7 || v56 >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 208) + 8))
        break;
      if (v20)
        v24 = v56 > v20;
      else
        v24 = 1;
      if (!v24)
      {
        v25 = _NSGlyphTreeCharacterIndexForGlyphAtIndex(a1, v20);
        v26 = objc_msgSend(*(id *)(a1 + 8), "string");
        if (v25)
        {
          v27 = (void *)v26;
          v60 = 0u;
          v58 = 0u;
          memset(v59, 0, sizeof(v59));
          v28 = v25 - 1;
          v57 = 0u;
          v29 = objc_msgSend((id)a1, "_blockRangeForCharRange:", v25 - 1, 1);
          v30 = v29 - 2;
          if (v29 < 2)
            v30 = 0;
          if (v29 < v28)
            v28 = v30;
          *((_QWORD *)&v58 + 1) = v25;
          *(_QWORD *)&v59[0] = v28;
          *(_QWORD *)&v58 = v27;
          if (v25 <= v28)
          {
            *(_QWORD *)&v57 = 0;
            v32 = -1;
          }
          else
          {
            if (v25 - v28 >= 0x20)
              v31 = 32;
            else
              v31 = v25 - v28;
            *(_QWORD *)&v57 = v31;
            objc_msgSend(v27, sel_getUid("getCharacters:range:"), (char *)v59 + 8, v28, v31);
            v32 = WORD4(v59[0]);
          }
          WORD4(v60) = v32;
          if (v28)
          {
            for (i = 1; ; i = *((_QWORD *)&v57 + 1))
            {
              v34 = i - 2;
              if (i < 2)
              {
                if (!*(_QWORD *)&v59[0])
                {
                  *((_QWORD *)&v57 + 1) = 0;
                  WORD4(v60) = -1;
                  goto LABEL_63;
                }
                if (*(_QWORD *)&v59[0] >= 0x20uLL)
                  v35 = 32;
                else
                  v35 = *(_QWORD *)&v59[0];
                *(_QWORD *)&v57 = v35;
                *((_QWORD *)&v57 + 1) = v35;
                *(_QWORD *)&v59[0] -= v35;
                objc_msgSend((id)v58, sel_getUid("getCharacters:range:"), (char *)v59 + 8, *(_QWORD *)&v59[0], v35);
                v34 = *((_QWORD *)&v57 + 1) - 1;
              }
              else
              {
                *((_QWORD *)&v57 + 1) = i - 1;
              }
              WORD4(v60) = *((_WORD *)v59 + v34 + 4);
              if (WORD4(v60) > 0x84u)
              {
                if (WORD4(v60) - 8232 < 2 || WORD4(v60) == 133)
                  break;
              }
              else if (WORD4(v60) == 13)
              {
                if (v28 >= objc_msgSend(v27, "length")
                  || objc_msgSend(v27, "characterAtIndex:", v28) != 10)
                {
                  break;
                }
              }
              else if (WORD4(v60) == 10 || WORD4(v60) == 12)
              {
                break;
              }
LABEL_63:
              if (!--v28)
                break;
            }
          }
        }
        else
        {
          v28 = 0;
        }
        a2 = v52;
        v37 = _NSGlyphTreeGlyphIndexForCharacterAtIndex(a1, v28);
        _NSLayoutTreeGetFirstHoleAfterGlyphIndexWithLength(a1, v37, v22, &v56, &v55);
        v23 = v56;
        if (v56 < v37)
        {
          v55 += v56 - v37;
          v56 = v37;
          v23 = v37;
        }
      }
      result = _NSGlyphTreeCharacterIndexForGlyphAtIndex(a1, v23);
      if (result < v6)
      {
        v38 = result;
        v39 = _NSGlyphTreeCharacterIndexForGlyphAtIndex(a1, v55 + v56);
        if (v39 >= v6)
          v40 = v6;
        else
          v40 = v39;
        *(_QWORD *)&v57 = 0;
        v54 = 0;
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "string"), "getLineStart:end:contentsEnd:forRange:", &v57, &v54, 0, v38, v40 - v38);
        if ((unint64_t)v57 < v38)
        {
          v41 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "string"), "rangeOfComposedCharacterSequenceAtIndex:", v38);
          if (v38 > v41 && v41 >= (unint64_t)v57 && v38 - v41 < v42)
            v38 = v41;
        }
        v44 = v54;
        if (v7 - v56 < 0x64)
          v45 = 1;
        else
          v45 = (v7 - v56) / 0x64;
        if ((v19 & 1) == 0)
        {
          if ((v53 & 1) != 0)
            v53 = 1;
          else
            v53 = objc_msgSend(*(id *)(a1 + 8), "_lockForReading");
          if ((*(_BYTE *)(a1 + 64) & 8) == 0)
            ++*(_WORD *)(a1 + 80);
          _NSFastFillAllGlyphHolesForGlyphRange(a1, a2, v51);
        }
        result = objc_msgSend((id)a1, "_fillLayoutHoleForCharacterRange:desiredNumberOfLines:isSoft:", v38, v44 - v38, v45, 0);
        v19 = 1;
        if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 240) + 56) & 1) != 0)
          continue;
      }
      break;
    }
    if ((v19 & 1) != 0 && (v53 & 1) != 0)
      result = objc_msgSend(*(id *)(a1 + 8), "_unlock");
    v9 = v48;
    if ((v50 & 1) == 0)
      goto LABEL_93;
LABEL_94:
    if ((v19 & 1) == 0)
      break;
    _enableTextViewResizing(a1);
    v46 = (*(_DWORD *)(a1 + 64) & 0x40000000) != 0 ? a2 : 0;
    result = _NSLayoutTreeGetFirstHoleAfterGlyphIndex(a1, v46, &v56);
    if (v56 >= v7)
      break;
    v8 = *(_QWORD *)(a1 + 240);
    v47 = *(_BYTE *)(*(_QWORD *)(v8 + 240) + 56) & v9;
    v9 = 0;
  }
  while ((v47 & 1) != 0);
  return result;
}

NSInsertionPointHelper *_insertionPointHelperForCharacterAtIndex(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  __CFString *v5;
  __CFString *v6;
  int v8;
  BOOL v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _BOOL4 v15;
  int v17;
  NSInsertionPointHelper *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t HasRightToLeftBaseWritingDirectionAtIndex;
  unint64_t *v26;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;

  v4 = objc_msgSend(*(id *)(a1 + 8), "length");
  v5 = (__CFString *)objc_msgSend(*(id *)(a1 + 8), "string");
  v6 = v5;
  if (v4 != a2 || v4 == 0)
    goto LABEL_17;
  v8 = -[__CFString characterAtIndex:](v5, "characterAtIndex:", a2 - 1);
  if (v8 > 132)
  {
    if ((v8 - 8232) < 2 || v8 == 133)
      goto LABEL_17;
LABEL_16:
    --a2;
    goto LABEL_17;
  }
  v9 = v8 == 10 || v8 == 12;
  if (!v9
    && (v8 != 13
     || -[__CFString length](v6, "length") > a2
     && -[__CFString characterAtIndex:](v6, "characterAtIndex:", a2) == 10))
  {
    goto LABEL_16;
  }
LABEL_17:
  v10 = *(void **)(*(_QWORD *)(a1 + 240) + 200);
  if (!v10)
  {
    v11 = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 240) + 200) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", objc_msgSend((id)a1, "zone")), "init");
LABEL_31:
    objc_msgSend((id)a1, "ensureLayoutForCharacterRange:", a2, 1);
    if (a2 == v4)
    {
      if (*(_QWORD *)(a1 + 56))
      {
        if (!v4)
        {
LABEL_53:
          objc_msgSend(*(id *)(a1 + 56), "lineFragmentPadding");
          v20 = v19;
          v31 = 0u;
          v32 = 0u;
          _NSLayoutTreeGetExtraLineFragmentRect(a1, (uint64_t)&v31, 0);
          v21 = *(double *)&v31;
          v22 = *(double *)&v32;
          v31 = 0u;
          v32 = 0u;
          _NSLayoutTreeGetExtraLineFragmentRect(a1, 0, (uint64_t)&v31);
          v23 = v20 + *(double *)&v31;
          if (*(double *)&v31 + *(double *)&v32 != v21 + v22)
            v23 = *(double *)&v31 + *(double *)&v32 - v20;
          v24 = v23 - v21;
          if (v4 && (*(_BYTE *)(a1 + 67) & 2) != 0)
          {
            v28 = (void *)objc_msgSend(*(id *)(a1 + 8), "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v4 - 1, 0);
            v29 = v28;
            if (!v28
              || (HasRightToLeftBaseWritingDirectionAtIndex = objc_msgSend(v28, "baseWritingDirection"),
                  HasRightToLeftBaseWritingDirectionAtIndex == -1))
            {
              v30 = (void *)objc_msgSend(*(id *)(a1 + 56), "textView");
              if ((objc_opt_respondsToSelector() & 1) != 0)
                v29 = (void *)objc_msgSend(v30, "defaultParagraphStyle");
              if (!v29
                || (HasRightToLeftBaseWritingDirectionAtIndex = objc_msgSend(v29, "baseWritingDirection"),
                    HasRightToLeftBaseWritingDirectionAtIndex == -1))
              {
                HasRightToLeftBaseWritingDirectionAtIndex = _NSStringHasRightToLeftBaseWritingDirectionAtIndex(v6, v4 - 1, 0, v4);
              }
            }
          }
          else
          {
            HasRightToLeftBaseWritingDirectionAtIndex = 0;
          }
          v18 = -[NSInsertionPointHelper init](+[NSInsertionPointHelper allocWithZone:](NSInsertionPointHelper, "allocWithZone:", objc_msgSend((id)a1, "zone")), "init");
          v18->_charRange.location = v4;
          v18->_charRange.length = 0;
          v18->_writingDirection = HasRightToLeftBaseWritingDirectionAtIndex;
          v18->_count = 1;
          v18->_logicalPositions = (double *)NSAllocateCollectable(8uLL, 0);
          v18->_logicalLeftBoundaries = (double *)NSAllocateCollectable(8uLL, 0);
          v18->_logicalRightBoundaries = (double *)NSAllocateCollectable(8uLL, 0);
          v18->_logicalCharIndexes = (unint64_t *)NSAllocateCollectable(8uLL, 0);
          v18->_displayPositions = (double *)NSAllocateCollectable(8uLL, 0);
          v26 = (unint64_t *)NSAllocateCollectable(8uLL, 0);
          v18->_displayCharIndexes = v26;
          *v18->_displayPositions = v24;
          *v18->_logicalRightBoundaries = v24;
          *v18->_logicalLeftBoundaries = v24;
          *v18->_logicalPositions = v24;
          *v26 = v4;
          *v18->_logicalCharIndexes = v4;
LABEL_59:
          if (v11 >= 0x10)
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 240) + 200), "removeLastObject");
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 240) + 200), "insertObject:atIndex:", v18, 0);
          return v18;
        }
        a2 = v4 - 1;
        v17 = -[__CFString characterAtIndex:](v6, "characterAtIndex:", v4 - 1);
        if (v17 > 132)
        {
          if ((v17 - 8232) < 2 || v17 == 133)
            goto LABEL_53;
        }
        else if (v17 == 10
               || v17 == 12
               || v17 == 13
               && (v4 >= -[__CFString length](v6, "length")
                || -[__CFString characterAtIndex:](v6, "characterAtIndex:", v4) != 10))
        {
          goto LABEL_53;
        }
        goto LABEL_47;
      }
      if (v4)
      {
        a2 = v4 - 1;
LABEL_47:
        objc_msgSend((id)a1, "ensureLayoutForCharacterRange:", a2, 1);
LABEL_48:
        v18 = (NSInsertionPointHelper *)objc_msgSend((id)a1, "_insertionPointHelperForGlyphAtIndex:", objc_msgSend((id)a1, "glyphIndexForCharacterAtIndex:", a2));
        if (!v18)
          return v18;
        goto LABEL_59;
      }
    }
    else if (v4)
    {
      goto LABEL_48;
    }
    return 0;
  }
  v11 = objc_msgSend(v10, "count");
  if (!v11)
    goto LABEL_31;
  v12 = 0;
  while (1)
  {
    v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 240) + 200), "objectAtIndex:", v12);
    v14 = *(_QWORD *)(v13 + 8);
    v15 = a2 - v14 < *(_QWORD *)(v13 + 16) && a2 >= v14;
    if (a2 == v14 || v15)
      break;
    if (v11 == ++v12)
      goto LABEL_31;
  }
  v18 = (NSInsertionPointHelper *)v13;
  if (v12)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 240) + 200), "insertObject:atIndex:", v13, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 240) + 200), "removeObjectAtIndex:", v12 + 1);
  }
  return v18;
}

void sub_18D64B8A0()
{
  __break(1u);
}

void sub_18D64BA64(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x18D64BA74);
  }
  JUMPOUT(0x18D64B978);
}

uint64_t __NSGetClusterHeadWithLimit(__CFString *a1, unint64_t a2, uint64_t a3, CFMutableStringRef *a4, UniChar *a5)
{
  CFMutableStringRef v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  unsigned __int16 v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  unsigned __int16 v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  CFIndex v26;
  int64_t v27;
  int64_t v28;
  uint64_t v29;
  unsigned __int16 v30;
  uint64_t v31;
  int64_t v32;
  int64_t v33;
  int64_t v34;
  uint64_t v35;
  unsigned __int16 v36;
  uint64_t v37;
  uint64_t v39;
  int64_t v40;
  BOOL v41;
  CFIndex v42;
  CFIndex v43;
  int64_t v44;
  CFIndex v45;
  uint64_t v46;
  CFRange v47;
  char *v48;
  UniChar v49;
  uint64_t v50;
  int64_t v51;
  int64_t v52;
  CFRange v53;
  CFRange v54;
  CFRange v55;
  CFRange v56;

  v9 = a1;
  if ((unint64_t)-[__CFString length](a1, "length") < 0x101)
  {
    v10 = 0;
  }
  else
  {
    v10 = 0;
    if (a2 >= 0x10)
      v11 = a2 - 16;
    else
      v11 = 0;
    if (a2 >= 0x11)
    {
      v10 = v11;
      if ((v11 & 0x8000000000000000) == 0)
      {
        v12 = *(_QWORD *)(a3 + 160);
        if (v12 > v11)
        {
          v13 = *(_QWORD *)(a3 + 136);
          if (v13)
          {
            v14 = *(_WORD *)(v13 + 2 * (*(_QWORD *)(a3 + 152) + v11));
          }
          else
          {
            v15 = *(_QWORD *)(a3 + 144);
            if (v15)
            {
              v14 = *(char *)(v15 + *(_QWORD *)(a3 + 152) + v11);
            }
            else
            {
              if (*(_QWORD *)(a3 + 176) <= v11 || (v16 = *(_QWORD *)(a3 + 168), v16 > v11))
              {
                v17 = a2 - 20;
                if (a2 < 0x14)
                  v17 = 0;
                if ((uint64_t)(v17 + 64) < v12)
                  v12 = v17 + 64;
                *(_QWORD *)(a3 + 168) = v17;
                *(_QWORD *)(a3 + 176) = v12;
                v53.location = *(_QWORD *)(a3 + 152) + v17;
                v53.length = v12 - v17;
                CFStringGetCharacters(*(CFStringRef *)(a3 + 128), v53, (UniChar *)a3);
                v16 = *(_QWORD *)(a3 + 168);
              }
              v14 = *(_WORD *)(a3 + 2 * (v11 - v16));
            }
          }
          if (v14 >> 10 == 55)
          {
            v10 = v11 - 1;
            v18 = *(_QWORD *)(a3 + 160);
            if (v18 >= v11)
            {
              v20 = *(_QWORD *)(a3 + 136);
              if (v20)
              {
                v19 = *(_WORD *)(v20 + 2 * (*(_QWORD *)(a3 + 152) + v10));
              }
              else
              {
                v21 = *(_QWORD *)(a3 + 144);
                if (v21)
                {
                  v19 = *(char *)(v21 + *(_QWORD *)(a3 + 152) + v10);
                }
                else
                {
                  if (*(_QWORD *)(a3 + 176) < v11 || (v22 = *(_QWORD *)(a3 + 168), v22 >= v11))
                  {
                    v23 = a2 - 21;
                    if (a2 < 0x15)
                      v23 = 0;
                    if ((uint64_t)(v23 + 64) < v18)
                      v18 = v23 + 64;
                    *(_QWORD *)(a3 + 168) = v23;
                    *(_QWORD *)(a3 + 176) = v18;
                    v54.location = *(_QWORD *)(a3 + 152) + v23;
                    v54.length = v18 - v23;
                    CFStringGetCharacters(*(CFStringRef *)(a3 + 128), v54, (UniChar *)a3);
                    v22 = *(_QWORD *)(a3 + 168);
                  }
                  v19 = *(_WORD *)(a3 + 2 * (v10 - v22));
                }
              }
            }
            else
            {
              v19 = 0;
            }
            if (v19 >> 10 != 54)
              v10 = v11;
          }
        }
      }
    }
    v24 = -[__CFString length](v9, "length");
    if (v24 >= a2 + 16)
      v25 = a2 + 16;
    else
      v25 = v24;
    v26 = v25 - v10;
    if (v25 < (unint64_t)-[__CFString length](v9, "length"))
    {
      v27 = v25 - 1;
      if (v25 - 1 >= 0)
      {
        v28 = *(_QWORD *)(a3 + 160);
        if (v28 > v27)
        {
          v29 = *(_QWORD *)(a3 + 136);
          if (v29)
          {
            v30 = *(_WORD *)(v29 + 2 * (*(_QWORD *)(a3 + 152) + v27));
          }
          else
          {
            v31 = *(_QWORD *)(a3 + 144);
            if (v31)
            {
              v30 = *(char *)(v31 + *(_QWORD *)(a3 + 152) + v27);
            }
            else
            {
              if (*(_QWORD *)(a3 + 176) <= v27 || (v32 = *(_QWORD *)(a3 + 168), v32 > v27))
              {
                v33 = v25 - 5;
                if ((unint64_t)v27 < 4)
                  v33 = 0;
                if (v33 + 64 < v28)
                  v28 = v33 + 64;
                *(_QWORD *)(a3 + 168) = v33;
                *(_QWORD *)(a3 + 176) = v28;
                v55.location = *(_QWORD *)(a3 + 152) + v33;
                v55.length = v28 - v33;
                CFStringGetCharacters(*(CFStringRef *)(a3 + 128), v55, (UniChar *)a3);
                v32 = *(_QWORD *)(a3 + 168);
              }
              v30 = *(_WORD *)(a3 + 2 * (v27 - v32));
            }
          }
          if (v30 >> 10 == 54)
          {
            v34 = *(_QWORD *)(a3 + 160);
            if (v34 <= v25)
            {
              v36 = 0;
            }
            else
            {
              v35 = *(_QWORD *)(a3 + 136);
              if (v35)
              {
                v36 = *(_WORD *)(v35 + 2 * (*(_QWORD *)(a3 + 152) + v25));
              }
              else
              {
                v50 = *(_QWORD *)(a3 + 144);
                if (v50)
                {
                  v36 = *(char *)(v50 + *(_QWORD *)(a3 + 152) + v25);
                }
                else
                {
                  if (*(_QWORD *)(a3 + 176) <= v25 || (v51 = *(_QWORD *)(a3 + 168), v51 > v25))
                  {
                    v52 = v25 - 4;
                    if ((unint64_t)v25 < 4)
                      v52 = 0;
                    if (v52 + 64 < v34)
                      v34 = v52 + 64;
                    *(_QWORD *)(a3 + 168) = v52;
                    *(_QWORD *)(a3 + 176) = v34;
                    v56.location = *(_QWORD *)(a3 + 152) + v52;
                    v56.length = v34 - v52;
                    CFStringGetCharacters(*(CFStringRef *)(a3 + 128), v56, (UniChar *)a3);
                    v51 = *(_QWORD *)(a3 + 168);
                  }
                  v36 = *(_WORD *)(a3 + 2 * (v25 - v51));
                }
              }
            }
            if (v36 >> 10 == 55)
              ++v26;
          }
        }
      }
    }
    if (*a4)
      CFStringSetExternalCharactersNoCopy(*a4, a5, v26, 64);
    else
      *a4 = CFStringCreateMutableWithExternalCharactersNoCopy(0, a5, v26, 64, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
    v37 = *(_QWORD *)(a3 + 136);
    if (v37)
    {
      memmove(a5, (const void *)(v37 + 2 * *(_QWORD *)(a3 + 152) + 2 * v10), 2 * v26);
    }
    else
    {
      v39 = *(_QWORD *)(a3 + 168);
      if (v10 < v39 || (v40 = *(_QWORD *)(a3 + 176), v41 = v40 <= v10, v42 = v40 - v10, v41))
      {
        v45 = v26 + v10 - v39;
        if (v26 + v10 > v39 && v26 + v10 < *(_QWORD *)(a3 + 176))
        {
          v26 = v39 - v10;
          memmove(&a5[v39 - v10], (const void *)a3, 2 * v45);
        }
        v44 = v10;
      }
      else
      {
        if (v26 >= v42)
          v43 = v42;
        else
          v43 = v26;
        memmove(a5, (const void *)(a3 + 2 * (v10 - v39)), 2 * v43);
        a5 += v43;
        v44 = v43 + v10;
        v26 -= v43;
      }
      if (v26 >= 1)
      {
        v46 = *(_QWORD *)(a3 + 144);
        v47.location = *(_QWORD *)(a3 + 152) + v44;
        if (v46)
        {
          v48 = (char *)(v46 + v47.location);
          do
          {
            v49 = *v48++;
            *a5++ = v49;
            --v26;
          }
          while (v26);
        }
        else
        {
          v47.length = v26;
          CFStringGetCharacters(*(CFStringRef *)(a3 + 128), v47, a5);
        }
      }
    }
    v9 = *a4;
  }
  return -[__CFString rangeOfComposedCharacterSequenceAtIndex:](v9, "rangeOfComposedCharacterSequenceAtIndex:", a2 - v10)+ v10;
}

uint64_t _NSInsertionPointDisplayCompareR(uint64_t a1, uint64_t a2)
{
  double v2;
  double v3;
  unsigned int v5;

  v2 = *(double *)(a1 + 16);
  v3 = *(double *)(a2 + 16);
  if (v2 < v3)
    return 0xFFFFFFFFLL;
  if (v2 > v3)
    return 1;
  v5 = *(_QWORD *)a1 > *(_QWORD *)a2;
  if (*(_QWORD *)a1 < *(_QWORD *)a2)
    v5 = -1;
  if (((*(_QWORD *)(a1 + 8) | *(_QWORD *)(a2 + 8)) & 1) != 0)
    return -v5;
  else
    return v5;
}

uint64_t _NSInsertionPointDisplayCompareL(uint64_t a1, uint64_t a2)
{
  double v2;
  double v3;
  unsigned int v5;

  v2 = *(double *)(a1 + 16);
  v3 = *(double *)(a2 + 16);
  if (v2 < v3)
    return 0xFFFFFFFFLL;
  if (v2 > v3)
    return 1;
  v5 = *(_QWORD *)a1 > *(_QWORD *)a2;
  if (*(_QWORD *)a1 < *(_QWORD *)a2)
    v5 = -1;
  if ((*(_QWORD *)(a2 + 8) & 1) == 0 || (*(_QWORD *)(a1 + 8) & 1) == 0)
    return v5;
  else
    return -v5;
}

uint64_t _NSInsertionPointLogicalCompare(_QWORD *a1, _QWORD *a2)
{
  if (*a1 < *a2)
    return 0xFFFFFFFFLL;
  else
    return *a1 > *a2;
}

void sub_18D64EAD8(void *a1)
{
  int v1;
  _QWORD *v2;
  int *v3;
  int v4;

  objc_begin_catch(a1);
  if (v1)
    v4 = 0x200000;
  else
    v4 = 0;
  *(_DWORD *)(*v2 + *v3) = *(_DWORD *)(*v2 + *v3) & 0xFFDFFFFF | v4;
  objc_exception_rethrow();
}

void sub_18D64EB10(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

Class initNSColor_0()
{
  Class result;

  __NSGetFrameworkReference(0, 0);
  result = objc_getClass("NSColor");
  classNSColor_0 = (uint64_t)result;
  if (!result)
    initNSColor_cold_1_0();
  getNSColorClass_0[0] = NSColorFunction_0;
  return result;
}

uint64_t NSColorFunction_0()
{
  return classNSColor_0;
}

void _NSTimeBackgroundLayout()
{
  CFRunLoopTimerInvalidate((CFRunLoopTimerRef)_backgroundLayoutTimer);
  CFRelease((CFTypeRef)_backgroundLayoutTimer);
  _backgroundLayoutTimer = 0;
}

uint64_t initUIRectIntegralWithScale(double a1, double a2, double a3, double a4, double a5)
{
  void *v10;
  uint64_t (*v11)();

  v10 = (void *)__NSGetFrameworkReference(0, 0);
  v11 = (uint64_t (*)())dlsym(v10, "UIRectIntegralWithScale");
  softLinkUIRectIntegralWithScale[0] = v11;
  if (!v11)
    initUIRectIntegralWithScale_cold_1();
  return ((uint64_t (*)(double, double, double, double, double))v11)(a1, a2, a3, a4, a5);
}

const __CFString *__NSRunCopyStringCallback(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v3;

  if (*(_QWORD *)(a3 + 152))
    v3 = *(_QWORD *)(a3 + 152);
  else
    v3 = a3;
  return -[__NSATSStringSegment initWithOriginalString:range:](objc_allocWithZone((Class)__NSATSStringSegment), (const __CFString *)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 80), "attributedString"), "string"), *(_QWORD *)(v3 + 128) + a1, a2);
}

uint64_t __NSRunGetBidiLevels(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = objc_msgSend(*(id *)(a3 + 80), "_bidiLevels");
  if (v4)
    return v4 + a1;
  else
    return 0;
}

uint64_t __NSCleanCopyRun(const __CTRun *a1, uint64_t a2, uint64_t a3)
{
  CFRange StringRange;
  id *v5;
  id v6;
  void *v7;
  double v8;
  __CFDictionary *MutableCopy;
  uint64_t MutableRunsWithStorageAndOptions;

  StringRange = CTRunGetStringRange(a1);
  v5 = -[NSATSGlyphStorage childGlyphStorageWithCharacterRange:](a3, *(_QWORD *)(a3 + 128) + StringRange.location, StringRange.length);
  v6 = v5[11];
  if (objc_msgSend(v5[10], "_bidiLevels"))
    objc_msgSend(v5[10], "_baseWritingDirection");
  if ((*((_DWORD *)v6 + 24) & 0x20) == 0
    || (v7 = (void *)objc_msgSend(*((id *)v6 + 1), "_kernOverride"), objc_msgSend(v7, "doubleValue"), v8 == 0.0))
  {
    MutableCopy = 0;
  }
  else
  {
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)v6);
    CFDictionaryAddValue(MutableCopy, CFSTR("NSKern"), v7);
  }
  if ((*((_BYTE *)v6 + 96) & 0x40) != 0 && !objc_msgSend(*(id *)v6, "objectForKey:", CFSTR("CTVerticalForms")))
  {
    if (!MutableCopy)
      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)v6);
    CFDictionaryAddValue(MutableCopy, CFSTR("CTVerticalForms"), (const void *)*MEMORY[0x1E0C9AE50]);
  }
  if ((*((_BYTE *)v6 + 96) & 0x80) != 0)
  {
    if (!MutableCopy)
      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)v6);
    CFDictionarySetValue(MutableCopy, CFSTR("NSFont"), *((const void **)v6 + 1));
  }
  if (!MutableCopy)
    return CTRunCreateMutableRunsWithStorageAndOptions();
  MutableRunsWithStorageAndOptions = CTRunCreateMutableRunsWithStorageAndOptions();
  CFRelease(MutableCopy);
  return MutableRunsWithStorageAndOptions;
}

const void *_NSATSGlyphStorageCreateTruncationToken(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a3 < 1)
    return 0;
  else
    return -[NSATSGlyphStorage _createEllipsisRunWithStringRange:attributes:](a5, a2, a3, a4);
}

uint64_t __NSATSLineFragmentRunCompare(const __CTRun *a1, const __CTRun *a2)
{
  CFIndex location;
  CFIndex v4;
  uint64_t v5;

  location = CTRunGetStringRange(a1).location;
  v4 = CTRunGetStringRange(a2).location;
  v5 = -1;
  if (location >= v4)
    v5 = 1;
  if (location == v4)
    return 0;
  else
    return v5;
}

void __NSDoReordants(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t *a8, uint64_t *a9)
{
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  _BYTE *v17;
  uint64_t v18;
  BOOL *v19;
  int64_t v20;
  _QWORD *v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t *v29;
  uint64_t v31;
  _DWORD v33[128];
  _BYTE __base[240];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v14 = (a7 >> 63) | 1;
  v15 = *a8;
  v31 = *a9;
  v16 = v14 * a7;
  if (v14 * a7 < 11)
  {
    if (v16 <= 0)
    {
      qsort(__base, v14 * a7, 0x18uLL, (int (__cdecl *)(const void *, const void *))__NSReordantIndexCompare);
      *a8 = v15;
      *a9 = v31;
      return;
    }
    v17 = __base;
  }
  else
  {
    v17 = NSZoneMalloc(0, 24 * v16);
  }
  v29 = a8;
  v18 = 0;
  v19 = v17 + 16;
  v20 = v16;
  v21 = v17;
  do
  {
    *((_QWORD *)v19 - 2) = v18;
    *((_QWORD *)v19 - 1) = *(_QWORD *)(a4 + 8 * v18);
    *v19 = (*(_DWORD *)(a3 + 4 * v18) & 0x20000) != 0;
    v19 += 24;
    v18 += v14;
    --v20;
  }
  while (v20);
  qsort(v17, v16, 0x18uLL, (int (__cdecl *)(const void *, const void *))__NSReordantIndexCompare);
  v28 = v21;
  do
  {
    v22 = *(_DWORD *)(a3 + 4 * *v21);
    if ((v22 & 0x20000) != 0)
    {
      if ((v22 & 0x20) != 0)
        goto LABEL_28;
      objc_msgSend(a1, "insertGlyph:atGlyphIndex:characterIndex:", *(unsigned __int16 *)(a2 + 2 * *v21), v15, *(_QWORD *)(a4 + 8 * *v21) + a6);
      ++v31;
    }
    if ((v22 & 0x40000) != 0)
    {
      v24 = *(unsigned __int16 *)(a2 + 2 * *v21);
      if (v24 == 0xFFFF)
        v24 = 0;
      v33[0] = v24;
      v23 = 1;
      if (!a5)
        goto LABEL_20;
LABEL_17:
      v25 = *(_QWORD *)(a5 + 8 * *v21);
      if (v25 < 1)
        goto LABEL_20;
      if ((v22 & 0x40000) != 0)
      {
        v26 = v15;
        if (objc_msgSend(a1, "glyphRangeForCharacterRange:actualCharacterRange:", *(_QWORD *)(a4 + 8 * *v21) + a6, 1, 0) != v15)
        {
          v33[v25] = v33[0];
          __memset_chk();
          *(_DWORD *)(a3 + 4 * *v21) |= 0x400000u;
          v26 = v15;
          goto LABEL_25;
        }
      }
      else
      {
        v26 = v15 + 1;
      }
      bzero(&v33[v23], 4 * v25);
LABEL_25:
      v27 = v25 + v23;
      v15 += v25;
      goto LABEL_26;
    }
    v23 = 0;
    if (a5)
      goto LABEL_17;
LABEL_20:
    if ((v22 & 0x40000) != 0)
    {
      v27 = 1;
      v26 = v15;
LABEL_26:
      objc_msgSend(a1, "substituteGlyphsInRange:withGlyphs:", v26, v27, v33, v28);
    }
    ++v15;
LABEL_28:
    v21 += 3;
    --v16;
  }
  while (v16);
  *v29 = v15;
  *a9 = v31;
  if (__base != v28)
    NSZoneFree(0, v28);
}

uint64_t __NSReordantIndexCompare(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 < v3)
    return 0xFFFFFFFFLL;
  if (v2 == v3)
    return *(unsigned __int8 *)(a1 + 16) - *(unsigned __int8 *)(a2 + 16);
  return 1;
}

uint64_t UIAppendVInt32ToData(void *a1, unsigned int a2)
{
  int v3;
  uint64_t v4;
  _BYTE v6[5];
  int v7;
  char v8;

  if (a2 > 0x7F)
  {
    if (a2 >> 14)
    {
      if (a2 >> 21)
      {
        v3 = (4 * a2) & 0x7F0000 | (((a2 >> 21) & 0x7F) << 24) | a2 & 0x7F | (((a2 >> 7) & 0x7F) << 8);
        if (a2 >> 28)
        {
          v8 = a2 >> 28;
          v4 = 5;
        }
        else
        {
          v3 |= 0x80000000;
          v4 = 4;
        }
      }
      else
      {
        v3 = (2 * a2) & 0x7F00 | a2 & 0x7F | (((a2 >> 14) & 0x7F) << 16) | 0x800000;
        v4 = 3;
      }
    }
    else
    {
      v3 = (2 * a2) & 0x7F00 | a2 & 0x7F | 0x8000;
      v4 = 2;
    }
  }
  else
  {
    v3 = a2 | 0x80;
    v4 = 1;
  }
  v7 = v3;
  __memcpy_chk();
  return objc_msgSend(a1, "appendBytes:length:", v6, v4);
}

void sub_18D6533DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D654458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D654758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Block_object_dispose((const void *)(v33 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18D654FCC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_18D655468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D655898(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_18D6564A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_18D65686C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v7;
  va_list va;
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
  va_list va1;

  va_start(va1, a6);
  va_start(va, a6);
  v7 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18D6576D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_18D6581BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
  uint64_t v58;

  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose((const void *)(v58 - 248), 8);
  _Unwind_Resume(a1);
}

void sub_18D658A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __normalizeTextRanges_block_invoke(uint64_t a1, void *a2, void *a3)
{
  return objc_msgSend((id)objc_msgSend(a2, "location"), "compare:", objc_msgSend(a3, "location"));
}

uint64_t __visualBidiSelectionEnabled_block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSVisualBidiSelectionEnabled"));
  visualBidiSelectionEnabled_result = result;
  return result;
}

void NSTextLayoutManagerBreakOnNilContentManager()
{
  if (NSTextLayoutManagerBreakOnNilContentManager_onceToken != -1)
    dispatch_once(&NSTextLayoutManagerBreakOnNilContentManager_onceToken, &__block_literal_global_4);
}

void sub_18D659080(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D6594A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D65950C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D6595D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D65961C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D6596C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D659BDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v15;

  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_18D65A0D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18D65A4A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D65A710(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D65AC80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  uint64_t v46;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose((const void *)(v46 - 232), 8);
  _Unwind_Resume(a1);
}

void sub_18D65B328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52)
{
  uint64_t v52;

  _Block_object_dispose(&a52, 8);
  _Block_object_dispose((const void *)(v52 - 248), 8);
  _Block_object_dispose((const void *)(v52 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_18D65BF8C(void *a1)
{
  uint64_t v1;

  objc_begin_catch(a1);
  *(_BYTE *)(v1 + 128) = 0;
  objc_exception_rethrow();
}

void sub_18D65BF9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_end_catch();
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D65C0FC(void *a1)
{
  uint64_t v1;

  objc_begin_catch(a1);
  *(_BYTE *)(v1 + 128) = 0;
  objc_exception_rethrow();
}

void sub_18D65C10C(_Unwind_Exception *a1)
{
  void *v1;

  objc_end_catch();
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D65C2C8(void *a1)
{
  uint64_t v1;

  objc_begin_catch(a1);
  *(_BYTE *)(v1 + 128) = 0;
  objc_exception_rethrow();
}

void sub_18D65C2D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_end_catch();
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D65C3EC(void *a1)
{
  uint64_t v1;

  objc_begin_catch(a1);
  *(_BYTE *)(v1 + 128) = 0;
  objc_exception_rethrow();
}

void sub_18D65C3FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_end_catch();
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D65C860(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D65C928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D65CC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D65CF54(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18D65D518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D65DA14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL textRangesAreConnected(void *a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a1, "endLocation"), "compare:", objc_msgSend(a2, "location")) != -1
      && objc_msgSend((id)objc_msgSend(a2, "endLocation"), "compare:", objc_msgSend(a1, "location")) != -1;
}

void sub_18D65DE5C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D65DEC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D65E44C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D65E7A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D65E810(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D65E8E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v7);
  _Unwind_Resume(a1);
}

void __UIFoundationWriteLog(uint64_t a1, os_log_type_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ____UIFoundationWriteLog_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (__UIFoundationWriteLog_onceToken != -1)
    dispatch_once(&__UIFoundationWriteLog_onceToken, block);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a3);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v11, &a9);
  v13 = __UIFoundationWriteLog_uifoundationLog;
  if (os_log_type_enabled((os_log_t)__UIFoundationWriteLog_uifoundationLog, a2))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v12;
    _os_log_impl(&dword_18D5CD000, v13, a2, "%{public}@", buf, 0xCu);
  }

}

void sub_18D65EE34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D65EEBC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double __NSTruncationTokenAttachmentGetWidth(void *a1)
{
  CGRect v2;

  objc_msgSend(a1, "bounds");
  return CGRectGetWidth(v2);
}

__CFString *UINibCoderValueTypeToString(unsigned int a1)
{
  if (a1 > 0xA)
    return 0;
  else
    return UINibCoderValueTypeToString_table[a1];
}

Class initNSColor_1()
{
  Class result;

  __NSGetFrameworkReference(0, 0);
  result = objc_getClass("NSColor");
  classNSColor_1 = (uint64_t)result;
  if (!result)
    initNSColor_cold_1_1();
  getNSColorClass_1 = (uint64_t)NSColorFunction_1;
  return result;
}

uint64_t NSColorFunction_1()
{
  return classNSColor_1;
}

uint64_t _NSSecureDecodingError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", a3, &a9);
  v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), _NSMethodExceptionProem(), v9);
  v11 = *MEMORY[0x1E0CB28A8];
  v14 = *MEMORY[0x1E0CB2938];
  v15[0] = v10;
  v12 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v11, 4864, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1));

  return v12;
}

Class initNSColor_2()
{
  Class result;

  __NSGetFrameworkReference(0, 0);
  result = objc_getClass("NSColor");
  classNSColor_2 = (uint64_t)result;
  if (!result)
    initNSColor_cold_1_2();
  getNSColorClass_2[0] = NSColorFunction_2;
  return result;
}

uint64_t NSColorFunction_2()
{
  return classNSColor_2;
}

uint64_t _NSAttachmentCharacterSet()
{
  uint64_t result;

  result = _attachmentCharSet;
  if (!_attachmentCharSet)
  {
    if (_createAttachmentAndBidiCharSets_onceToken != -1)
      dispatch_once(&_createAttachmentAndBidiCharSets_onceToken, &__block_literal_global_191_1);
    return _attachmentCharSet;
  }
  return result;
}

uint64_t _NSNonAttachmentCharacterSet()
{
  uint64_t result;

  result = _nonAttachmentCharSet;
  if (!_nonAttachmentCharSet)
  {
    if (_createAttachmentAndBidiCharSets_onceToken != -1)
      dispatch_once(&_createAttachmentAndBidiCharSets_onceToken, &__block_literal_global_191_1);
    return _nonAttachmentCharSet;
  }
  return result;
}

uint64_t _NSBidiEmbeddingAndOverrideCharSet()
{
  uint64_t result;

  result = _bidiEmbeddingAndOverrideCharSet;
  if (!_bidiEmbeddingAndOverrideCharSet)
  {
    if (_createAttachmentAndBidiCharSets_onceToken != -1)
      dispatch_once(&_createAttachmentAndBidiCharSets_onceToken, &__block_literal_global_191_1);
    return _bidiEmbeddingAndOverrideCharSet;
  }
  return result;
}

uint64_t _NSBidiControlCharacterSet()
{
  uint64_t result;

  result = _bidiControlCharacterSet;
  if (!_bidiControlCharacterSet)
  {
    if (_createAttachmentAndBidiCharSets_onceToken != -1)
      dispatch_once(&_createAttachmentAndBidiCharSets_onceToken, &__block_literal_global_191_1);
    return _bidiControlCharacterSet;
  }
  return result;
}

unint64_t _NSXMLEncoding(char *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  CFIndex v10;
  CFIndex v11;
  unint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  CFStringEncoding v15;

  v4 = 0;
  v5 = 10;
  if (a2 > 0xA)
    v5 = a2;
  v6 = v5 - 10;
  v7 = -1;
  v8 = a1;
  while (v6)
  {
    v9 = v4 + 10;
    ++v4;
    if (!strncasecmp(v8, "encoding=\"", 0xAuLL))
      v7 = v9;
    --v6;
    ++v8;
    if ((v7 & 0x8000000000000000) == 0)
    {
      if (v7 + 1 < a2)
      {
        v10 = 0;
        v11 = -1;
        do
        {
          if (a1[v7 + v10] == 34)
            v11 = v10;
          if ((v11 & 0x8000000000000000) == 0)
            break;
          v12 = v7 + 2 + v10++;
        }
        while (v12 < a2);
        if (v11 >= 1)
        {
          v13 = CFStringCreateWithBytes(0, (const UInt8 *)&a1[v7], v11, 0x201u, 0);
          if (v13)
          {
            v14 = v13;
            v15 = CFStringConvertIANACharSetNameToEncoding(v13);
            CFRelease(v14);
            if (v15 != -1)
              return CFStringConvertEncodingToNSStringEncoding(v15);
          }
        }
      }
      return 0;
    }
  }
  return 0;
}

unint64_t _NSHTMLEncoding(char *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  CFIndex v10;
  CFIndex v11;
  unint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  CFStringEncoding v15;

  v4 = 0;
  v5 = 8;
  if (a2 > 8)
    v5 = a2;
  v6 = v5 - 8;
  v7 = -1;
  v8 = a1;
  while (v6)
  {
    v9 = v4 + 8;
    ++v4;
    if (!strncasecmp(v8, "charset=", 8uLL))
      v7 = v9;
    --v6;
    ++v8;
    if ((v7 & 0x8000000000000000) == 0)
    {
      if (v7 + 1 < a2)
      {
        v10 = 0;
        v11 = -1;
        do
        {
          if (a1[v7 + v10] == 34)
            v11 = v10;
          if ((v11 & 0x8000000000000000) == 0)
            break;
          v12 = v7 + 2 + v10++;
        }
        while (v12 < a2);
        if (v11 >= 1)
        {
          v13 = CFStringCreateWithBytes(0, (const UInt8 *)&a1[v7], v11, 0x201u, 0);
          if (v13)
          {
            v14 = v13;
            v15 = CFStringConvertIANACharSetNameToEncoding(v13);
            CFRelease(v14);
            if (v15 != -1)
              return CFStringConvertEncodingToNSStringEncoding(v15);
          }
        }
      }
      return 0;
    }
  }
  return 0;
}

uint64_t _NSReadAttributedStringFromURLOrData(void *a1, unint64_t a2, uint64_t a3, void *a4, _QWORD *a5, _QWORD *a6)
{
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  uint64_t v31;

  v8 = (uint64_t)a1;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3052000000;
  v29 = __Block_byref_object_copy__3;
  v30 = __Block_byref_object_dispose__3;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = ___NSReadAttributedStringFromURLOrData_block_invoke;
  v13[3] = &unk_1E2604538;
  v13[4] = &v26;
  v13[5] = &v20;
  v13[6] = &v14;
  _NSReadAttributedStringFromURLOrDataCommon(a1, a2, a3, a4, 0, (uint64_t)v13);
  v9 = (void *)v27[5];
  if (v9)
  {
    if (v8)

    else
      v8 = v27[5];
  }
  else
  {
    v8 = 0;
  }
  v10 = (void *)v21[5];
  if (a5)
    *a5 = v10;
  else

  v11 = (void *)v15[5];
  if (a6)
    *a6 = v11;
  else

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
  return v8;
}

void sub_18D66330C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

_NSAttributedStringAsyncReadReply *_NSReadAttributedStringFromURLOrDataAsync(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _NSAttributedStringAsyncReadReply *v19;
  uint64_t v21;
  void *v22;
  _QWORD v23[7];
  id v24;
  uint64_t v25;
  _NSAttributedStringAsyncReadReply *v26;
  _QWORD v27[5];
  _QWORD block[5];
  uint64_t v29;

  if (!(a1 | a2))
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB28A8];
    v15 = 258;
    v16 = 0;
LABEL_14:
    (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t))(a4 + 16))(a4, 0, 0, objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, v15, v16));
    return 0;
  }
  if (a1 && (objc_msgSend((id)a1, "isFileURL") & 1) == 0)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB28A8];
    v16 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a1, *MEMORY[0x1E0CB3308]);
    v13 = v17;
    v14 = v18;
    v15 = 262;
    goto LABEL_14;
  }
  if (!a3)
    a3 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v8 = objc_msgSend((id)a1, "path");
  v9 = objc_msgSend(MEMORY[0x1E0CB3498], "_allowedOptionClasses");
  v29 = 0;
  v10 = objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v29);
  if (v10)
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v9, v10, &v29);
  if (v29)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v29, *MEMORY[0x1E0CB3388]);
    v12 = (uint64_t)v11;
    if (v8)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB2AA0]);
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB28A8];
    v15 = 256;
    v16 = v12;
    goto LABEL_14;
  }
  v21 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___NSReadAttributedStringFromURLOrDataAsync_block_invoke;
  block[3] = &unk_1E2602FF0;
  block[4] = v9;
  if (_NSReadAttributedStringFromURLOrDataAsync_onceToken != -1)
    dispatch_once(&_NSReadAttributedStringFromURLOrDataAsync_onceToken, block);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.textkit.nsattributedstringagent"));
  objc_msgSend(v22, "setRemoteObjectInterface:", _NSReadAttributedStringFromURLOrDataAsync_connectionInterface);
  objc_msgSend(v22, "_setQueue:", _NSReadAttributedStringFromURLOrDataAsync_connectionQueue);
  objc_msgSend(v22, "resume");
  v19 = +[_NSAttributedStringAsyncReadReply readReplyWithConnection:reply:](_NSAttributedStringAsyncReadReply, "readReplyWithConnection:reply:", v22, a4);
  v27[0] = v21;
  v27[1] = 3221225472;
  v27[2] = ___NSReadAttributedStringFromURLOrDataAsync_block_invoke_2;
  v27[3] = &unk_1E2604498;
  v27[4] = v19;
  v23[0] = v21;
  v23[1] = 3221225472;
  v23[2] = ___NSReadAttributedStringFromURLOrDataAsync_block_invoke_3;
  v23[3] = &unk_1E26044E8;
  v23[4] = a3;
  v23[5] = v22;
  v23[6] = a1;
  v24 = (id)objc_msgSend(v22, "remoteObjectProxyWithErrorHandler:", v27);
  v25 = a2;
  v26 = v19;
  objc_msgSend(v24, "startWithReply:", v23);
  return v19;
}

uint64_t _NSReadAttributedStringFromHTMLData(uint64_t a1, void *a2, uint64_t a3, _QWORD *a4, _QWORD *a5, _QWORD *a6)
{
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  NSObject *v24;
  char v25;
  void *v26;
  dispatch_time_t v27;
  intptr_t v28;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  char v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  _QWORD v45[12];
  char v46;
  _QWORD v47[6];
  _QWORD v48[5];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  void (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  void (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  uint64_t v66;
  _QWORD block[5];
  const __CFString *v68;
  _QWORD v69[3];

  v69[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v42 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _NSReadAttributedStringFromHTMLData(NSData *, NSDictionary *, NSString *, NSAttributedString **, NSDictionary **, NSError **)"), CFSTR("NSAttributedStringAdditions.m"), 2289, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileContents"));
    if (a4)
    {
LABEL_3:
      if (a2)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  v43 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _NSReadAttributedStringFromHTMLData(NSData *, NSDictionary *, NSString *, NSAttributedString **, NSDictionary **, NSError **)"), CFSTR("NSAttributedStringAdditions.m"), 2290, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outString"));
  if (!a2)
LABEL_4:
    a2 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
LABEL_5:
  *a4 = 0;
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  v12 = objc_msgSend(MEMORY[0x1E0CB3498], "_allowedOptionClasses");
  v61 = 0;
  v13 = objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a2, 1, &v61);
  if (v13)
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v12, v13, &v61);
  if (!v61)
    goto LABEL_17;
  v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v61, *MEMORY[0x1E0CB3388]);
  v15 = v14;
  if (a3)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", a3, *MEMORY[0x1E0CB2AA0]);
  v16 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 256, v15);
  if (!v16)
  {
LABEL_17:
    v18 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___NSReadAttributedStringFromHTMLData_block_invoke;
    block[3] = &unk_1E2602FF0;
    block[4] = v12;
    if (_NSReadAttributedStringFromHTMLData_onceToken != -1)
      dispatch_once(&_NSReadAttributedStringFromHTMLData_onceToken, block);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.textkit.nsattributedstringagent"));
    objc_msgSend(v19, "setRemoteObjectInterface:", _NSReadAttributedStringFromHTMLData_connectionInterface);
    objc_msgSend(v19, "_setQueue:", _NSReadAttributedStringFromHTMLData_connectionQueue);
    objc_msgSend(v19, "resume");
    v61 = 0;
    v62 = &v61;
    v63 = 0x3052000000;
    v64 = __Block_byref_object_copy__3;
    v65 = __Block_byref_object_dispose__3;
    v66 = 0;
    v55 = 0;
    v56 = &v55;
    v57 = 0x3052000000;
    v58 = __Block_byref_object_copy__3;
    v59 = __Block_byref_object_dispose__3;
    v60 = 0;
    v49 = 0;
    v50 = &v49;
    v51 = 0x3052000000;
    v52 = __Block_byref_object_copy__3;
    v53 = __Block_byref_object_dispose__3;
    v54 = 0;
    v20 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", NSTimeoutDocumentOption);
    v21 = -1.0;
    if (v20
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (objc_msgSend(v20, "doubleValue"), v21 = v22, v22 >= 0.0))
    {
      v24 = dispatch_semaphore_create(0);
      dispatch_retain(v24);
      v47[0] = v18;
      v47[1] = 3221225472;
      v47[2] = ___NSReadAttributedStringFromHTMLData_block_invoke_3;
      v47[3] = &unk_1E26045A8;
      v47[4] = v24;
      v47[5] = &v49;
      v23 = (void *)objc_msgSend(v19, "remoteObjectProxyWithErrorHandler:", v47);
      v25 = 0;
    }
    else
    {
      v48[0] = v18;
      v48[1] = 3221225472;
      v48[2] = ___NSReadAttributedStringFromHTMLData_block_invoke_2;
      v48[3] = &unk_1E2604580;
      v48[4] = &v49;
      v23 = (void *)objc_msgSend(v19, "synchronousRemoteObjectProxyWithErrorHandler:", v48);
      v24 = 0;
      v25 = 1;
    }
    v45[0] = v18;
    v45[1] = 3221225472;
    v45[2] = ___NSReadAttributedStringFromHTMLData_block_invoke_4;
    v45[3] = &unk_1E26045F8;
    v45[4] = a2;
    v45[5] = v19;
    v45[6] = v23;
    v45[7] = a1;
    v45[10] = &v55;
    v45[11] = &v49;
    v46 = v25;
    v45[8] = v24;
    v45[9] = &v61;
    objc_msgSend(v23, "startWithReply:", v45);
    if ((v25 & 1) != 0)
    {
      v26 = (void *)v50[5];
      if (!v26)
      {
LABEL_37:
        if (v62[5])
        {
          if (objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("DocumentType")), "isEqualToString:", CFSTR("NSWebArchive")))
          {
            v34 = objc_msgSend((id)v62[5], "length");
            if (v34)
            {
              v35 = 0;
              v36 = 0;
              v44 = xmmword_18D6CBD40;
              do
              {
                while (1)
                {
                  v37 = (void *)objc_msgSend((id)v62[5], "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSFont"), v35, &v44, v35, v34 - v35);
                  if (!CTFontIsLastResort())
                    break;
                  if ((v36 & 1) == 0)
                    objc_msgSend((id)v62[5], "beginEditing");
                  objc_msgSend(v37, "pointSize");
                  v38 = +[UIFont userFontOfSize:](UIFont, "userFontOfSize:");
                  v39 = (void *)v62[5];
                  v68 = CFSTR("NSFont");
                  v69[0] = v38;
                  v40 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
                  objc_msgSend(v39, "setAttributes:range:", v40, v44);
                  v35 = v44 + *((_QWORD *)&v44 + 1);
                  *(_QWORD *)&v44 = v35;
                  v36 = 1;
                  if (v35 >= v34)
                    goto LABEL_51;
                }
                v35 = v44 + *((_QWORD *)&v44 + 1);
                *(_QWORD *)&v44 = v35;
              }
              while (v35 < v34);
              if ((v36 & 1) == 0)
                goto LABEL_52;
LABEL_51:
              objc_msgSend((id)v62[5], "endEditing");
            }
          }
LABEL_52:
          *a4 = v62[5];
          v41 = (void *)v56[5];
          if (a5)
          {
            v16 = 0;
            *a5 = v41;
          }
          else
          {

            v16 = 0;
          }
          v17 = 1;
        }
        else
        {
          v17 = 0;
          v16 = 0;
        }
LABEL_29:
        _Block_object_dispose(&v49, 8);
        _Block_object_dispose(&v55, 8);
        _Block_object_dispose(&v61, 8);
        if (!a6)
          return v17;
        goto LABEL_30;
      }
    }
    else
    {
      v27 = dispatch_time(0, (uint64_t)(v21 * 1000000000.0));
      v28 = dispatch_semaphore_wait(v24, v27);
      dispatch_release(v24);
      v26 = (void *)v50[5];
      if (!v26)
      {
        if (!v28)
          goto LABEL_37;
        v30 = (void *)MEMORY[0x1E0C99E08];
        v31 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 2, 0);
        v32 = (void *)objc_msgSend(v30, "dictionaryWithObject:forKey:", v31, *MEMORY[0x1E0CB3388]);
        v33 = v32;
        if (a3)
          objc_msgSend(v32, "setObject:forKeyedSubscript:", a3, *MEMORY[0x1E0CB2AA0]);
        v16 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, v33);

LABEL_28:
        v17 = 0;
        goto LABEL_29;
      }
    }
    v16 = v26;

    goto LABEL_28;
  }
  v17 = 0;
  if (!a6)
    return v17;
LABEL_30:
  if ((v17 & 1) == 0)
    *a6 = v16;
  return v17;
}

void sub_18D6644A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  uint64_t v44;

  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose((const void *)(v44 - 216), 8);
  _Unwind_Resume(a1);
}

uint64_t *_NSFontAttributeNames()
{
  if (_NSFontAttributeNames_onceToken != -1)
    dispatch_once(&_NSFontAttributeNames_onceToken, &__block_literal_global_89);
  return &_NSFontAttributeNames_names;
}

const char *_extensionTokenForPath(__int128 *a1, void *a2)
{
  const char *result;
  __int128 v4;
  __int128 v5;

  if (!a2)
    return 0;
  objc_msgSend(a2, "fileSystemRepresentation");
  v4 = *a1;
  v5 = a1[1];
  result = (const char *)sandbox_extension_issue_file_to_process();
  if (result)
    return (const char *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", result, strlen(result) + 1, 1, v4, v5);
  return result;
}

void *_NSReadAttributedStringFromURLOrDataSync(void *a1, void *a2, uint64_t a3, void *a4, _QWORD *a5, _QWORD *a6)
{
  dispatch_semaphore_t v12;
  NSObject *v13;
  _NSAttributedStringAsyncReadReply *v14;
  void *v15;
  double v16;
  double v17;
  NSObject *v18;
  dispatch_time_t v19;
  intptr_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v29;
  _QWORD v30[7];
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  uint64_t v49;
  id location;

  v12 = dispatch_semaphore_create(0);
  objc_initWeak(&location, v12);
  v13 = objc_loadWeak(&location);
  dispatch_retain(v13);
  v44 = 0;
  v45 = &v44;
  v46 = 0x3052000000;
  v47 = __Block_byref_object_copy__3;
  v48 = __Block_byref_object_dispose__3;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3052000000;
  v41 = __Block_byref_object_copy__3;
  v42 = __Block_byref_object_dispose__3;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3052000000;
  v35 = __Block_byref_object_copy__3;
  v36 = __Block_byref_object_dispose__3;
  v37 = 0;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = ___NSReadAttributedStringFromURLOrDataSync_block_invoke;
  v30[3] = &unk_1E2604510;
  v30[4] = &v44;
  v30[5] = &v38;
  v30[6] = &v32;
  objc_copyWeak(&v31, &location);
  v14 = _NSReadAttributedStringFromURLOrDataAsync((unint64_t)a2, a3, (uint64_t)a4, (uint64_t)v30);
  v15 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", NSTimeoutDocumentOption);
  if (v15)
  {
    objc_msgSend(v15, "doubleValue");
    v17 = v16;
  }
  else
  {
    v17 = 60.0;
  }
  v18 = objc_loadWeak(&location);
  v19 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
  v20 = dispatch_semaphore_wait(v18, v19);
  v21 = objc_loadWeak(&location);
  dispatch_release(v21);
  v22 = (void *)v33[5];
  if (v22)
  {
    if (a6)
      *a6 = v22;
    else

LABEL_13:
    a1 = 0;
    goto LABEL_14;
  }
  if (v20)
  {
    v23 = (void *)MEMORY[0x1E0C99E08];
    v24 = *MEMORY[0x1E0CB28A8];
    v25 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4097, 0);
    v26 = (void *)objc_msgSend(v23, "dictionaryWithObject:forKey:", v25, *MEMORY[0x1E0CB3388]);
    v27 = objc_msgSend(a2, "path");
    if (v27)
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0CB2AA0]);
    -[_NSAttributedStringAsyncReadReply cancelWithError:](v14, "cancelWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v24, 259, v26));

    goto LABEL_13;
  }
  if (v45[5])
  {
    if (a1)
    {
      objc_msgSend(a1, "setAttributedString:");

    }
    else
    {
      a1 = (void *)v45[5];
    }
    v29 = (void *)v39[5];
    if (a5)
      *a5 = v29;
    else

  }
LABEL_14:
  objc_destroyWeak(&v31);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);
  objc_destroyWeak(&location);
  return a1;
}

void sub_18D6664EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  id *v24;
  uint64_t v25;

  objc_destroyWeak(v24);
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose((const void *)(v25 - 136), 8);
  objc_destroyWeak((id *)(v25 - 88));
  _Unwind_Resume(a1);
}

void _NSReadAttributedStringFromURLOrDataAgent(unint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  _NSReadAttributedStringFromURLOrDataCommon(0, a1, a2, a3, 1, a4);
}

void _NSReadAttributedStringFromURLOrDataCommon(void *a1, unint64_t a2, uint64_t a3, void *a4, int a5, uint64_t a6)
{
  id v7;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  BOOL v24;
  const __CFString *v25;
  int v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const __CFString **v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  BOOL v42;
  const __CFString **v43;
  size_t v44;
  const char *v45;
  void *v47;
  int v48;
  int v49;
  void *v50;
  int v51;
  int v52;
  void *v53;
  const NSAttributedStringDocumentType *v54;
  const __CFString *v55;
  __CFString *v56;
  uint64_t v57;
  void *v58;
  NSRTFReader *v59;
  id v60;
  uint64_t v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  NSHTMLReader *v66;
  id v67;
  id v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  BOOL v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  void *v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  id v82;
  BOOL v83;
  int v84;
  int v85;
  _BOOL4 v86;
  void *v87;
  uint64_t v88;
  const __CFString *v89;
  int v90;
  BOOL v91;
  int v92;
  unint64_t v93;
  unint64_t v94;
  void *v95;
  int v96;
  unint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  uint64_t v106;
  int v108;
  int v109;
  unint64_t v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  uint64_t v116;
  unint64_t v117;
  id v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  int v122;
  unint64_t v123;
  unint64_t v124;
  uint64_t v125;
  id v126;
  id v128;
  uint64_t v129;
  _BOOL4 v130;
  void *v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  CFStringEncoding v135;
  BOOL v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  void *v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  char v144;
  void *v145;
  uint64_t v146;
  id v147;
  id v148;
  uint64_t v149;
  NSObject *v150;
  uint64_t v151;
  id v152;
  uint64_t v153;
  const __CFString *v154;
  void *v155;
  double v156;
  dispatch_time_t v157;
  intptr_t v158;
  void *v159;
  void *v160;
  uint64_t v161;
  void *v162;
  void *v163;
  char v164;
  unsigned int v165;
  void *v166;
  _BOOL4 v167;
  int v168;
  int v169;
  const __CFString *v170;
  __CFString *v171;
  void *v172;
  void *v173;
  int v175;
  id v176;
  uint64_t v178;
  uint64_t v179;
  _QWORD v180[7];
  _QWORD v181[9];
  uint64_t v182;
  uint64_t *v183;
  uint64_t v184;
  void (*v185)(uint64_t, uint64_t);
  void (*v186)(uint64_t);
  uint64_t v187;
  uint64_t v188;
  uint64_t *v189;
  uint64_t v190;
  void (*v191)(uint64_t, uint64_t);
  void (*v192)(uint64_t);
  uint64_t v193;
  id v194;
  id v195;
  __int128 v196;
  __int128 v197;
  void (*v198)(uint64_t);
  uint64_t v199;
  _QWORD v200[67];

  v7 = a4;
  *(_QWORD *)((char *)&v200[64] + 1) = *MEMORY[0x1E0C80C00];
  v195 = 0;
  v10 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("NSIndexing"));
  v11 = (void *)objc_msgSend(v7, "objectForKey:", CFSTR("NSThumbnail"));
  v179 = objc_msgSend(v10, "integerValue");
  v12 = objc_msgSend(v11, "integerValue");
  v13 = (void *)objc_msgSend(v7, "objectForKey:", CFSTR("NSFileHeaderData"));
  v14 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", CFSTR("NSNoReadNecessary")), "BOOLValue");
  v15 = +[NSTextList includesTextListMarkers](NSTextList, "includesTextListMarkers");
  bzero(v200, 0x201uLL);
  v194 = 0;
  if (!v10)
  {
    v16 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("NSTextIndexing"));
    if (v16)
      v179 = objc_msgSend(v16, "integerValue");
  }
  v17 = v179;
  if (v179 <= 0)
    v17 = v12;
  v178 = v17;
  if (!(a2 | a3))
    goto LABEL_12;
  if (a2)
  {
    if ((objc_msgSend((id)a2, "isFileURL") & 1) == 0)
    {
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB28A8];
      v21 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a2, *MEMORY[0x1E0CB3308]);
      v18 = v28;
      v19 = v29;
      v20 = 262;
      goto LABEL_30;
    }
    v172 = (void *)objc_msgSend((id)a2, "path");
    if (!a3 && objc_msgSend((id)a2, "isFileURL") && !v172)
    {
LABEL_12:
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0CB28A8];
      v20 = 258;
      v21 = 0;
LABEL_30:
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, v20, v21);
      (*(void (**)(void))(a6 + 16))();
      return;
    }
  }
  else
  {
    v172 = (void *)objc_msgSend(0, "path");
  }
  v175 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TextKit1ListMarkerFormat")), "BOOLValue");
  v22 = objc_msgSend(v7, "objectForKey:");
  if (!v22)
  {
    v22 = objc_msgSend(v7, "objectForKey:", NSFileTypeDocumentOption);
    if (v22)
      v22 = objc_msgSend(MEMORY[0x1E0CB3498], "_documentTypeForFileType:", v22);
  }
  v164 = v14;
  v166 = v13;
  v23 = 0;
  if (v22)
    v24 = a3 == 0;
  else
    v24 = 1;
  v170 = (const __CFString *)v22;
  v25 = (const __CFString *)v22;
  v26 = 0;
  if (!v24)
  {
    v169 = 0;
    goto LABEL_43;
  }
  v169 = 0;
  if (v172)
  {
    *(_QWORD *)&v196 = 0;
    v27 = objc_msgSend((id)objc_msgSend(v172, "pathExtension"), "lowercaseString");
    v169 = objc_msgSend((id)a2, "getResourceValue:forKey:error:", &v196, *MEMORY[0x1E0C999D0], &v194);
    if (v169)
    {
      if ((_QWORD)v196)
      {
        v26 = objc_msgSend((id)v196, "BOOLValue");
        if (!v170)
        {
          if (v26)
          {
            if (objc_msgSend(CFSTR("rtfd"), "isEqual:", v27))
            {
              v25 = CFSTR("NSRTFD");
            }
            else
            {
              v188 = 0;
              v48 = objc_msgSend((id)a2, "getResourceValue:forKey:error:", &v188, *MEMORY[0x1E0C99AD0], 0);
              if (v188)
                v49 = v48;
              else
                v49 = 0;
              if (v49 == 1)
              {
                v50 = (void *)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:");
                if (objc_msgSend(v50, "conformsToType:", *MEMORY[0x1E0CEC5C8]))
                  v25 = CFSTR("NSRTFD");
                else
                  v25 = 0;
              }
              else
              {
                v25 = 0;
              }
            }
            v26 = 1;
            goto LABEL_42;
          }
LABEL_35:
          if (objc_msgSend(CFSTR("rtf"), "isEqual:", v27))
          {
            v26 = 0;
            v30 = (const __CFString **)&NSRTFTextDocumentType;
LABEL_41:
            v25 = *v30;
            goto LABEL_42;
          }
          if ((objc_msgSend(CFSTR("html"), "isEqualToString:", v27) & 1) != 0
            || objc_msgSend(CFSTR("htm"), "isEqualToString:", v27))
          {
            v26 = 0;
            v30 = (const __CFString **)&NSHTMLTextDocumentType;
            goto LABEL_41;
          }
          if (objc_msgSend(CFSTR("webarchive"), "isEqualToString:", v27))
          {
            v26 = 0;
            v30 = (const __CFString **)&NSWebArchiveTextDocumentType;
            goto LABEL_41;
          }
          if (objc_msgSend(CFSTR("txt"), "isEqualToString:", v27))
          {
            v26 = 0;
            v30 = (const __CFString **)&NSPlainTextDocumentType;
            goto LABEL_41;
          }
          v188 = 0;
          v51 = objc_msgSend((id)a2, "getResourceValue:forKey:error:", &v188, *MEMORY[0x1E0C99AD0], 0);
          if (v188)
            v52 = v51;
          else
            v52 = 0;
          if (v52 == 1)
          {
            v53 = (void *)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:");
            if (objc_msgSend(v53, "conformsToType:", *MEMORY[0x1E0CEC5C0]))
            {
              v54 = &NSRTFTextDocumentType;
            }
            else
            {
              if (!objc_msgSend(v53, "conformsToType:", *MEMORY[0x1E0CEC518]))
              {
                if (objc_msgSend(v53, "conformsToType:", *MEMORY[0x1E0CEC658]))
                  v25 = CFSTR("NSWebArchive");
                else
                  v25 = 0;
                goto LABEL_430;
              }
              v54 = &NSHTMLTextDocumentType;
            }
            v25 = (const __CFString *)*v54;
          }
          else
          {
            v25 = 0;
          }
LABEL_430:
          v26 = 0;
          goto LABEL_42;
        }
LABEL_34:
        v25 = v170;
LABEL_42:
        v23 = v25 != 0;
        goto LABEL_43;
      }
    }
    else if (!a3)
    {
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v32 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v172, *MEMORY[0x1E0CB2AA0], 0);
      (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t))(a6 + 16))(a6, 0, 0, objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 260, v32));
      return;
    }
    if (!v170)
      goto LABEL_35;
    v26 = 0;
    goto LABEL_34;
  }
LABEL_43:
  v167 = v23;
  v168 = v26;
  if (v25)
  {
    v173 = 0;
    v33 = 0;
    goto LABEL_132;
  }
  if (a3)
  {
    v34 = objc_msgSend((id)a3, "length");
    if (v34 >= 0x200)
      v33 = 512;
    else
      v33 = v34;
    objc_msgSend((id)a3, "getBytes:length:", v200, v33);
  }
  else
  {
    if (!v13)
    {
      if (v169)
      {
        v47 = createOrResetFileHandle(0, (uint64_t)v172, v7, v179 > 0);
        v33 = objc_msgSend(v47, "readDataOfLength:buffer:", 512, v200);
        v173 = v47;
        if (v33)
          goto LABEL_56;
      }
      else
      {
        v173 = 0;
        v33 = 0;
      }
      goto LABEL_69;
    }
    v35 = objc_msgSend(v13, "length");
    if (v35 >= 0x200)
      v33 = 512;
    else
      v33 = v35;
    objc_msgSend(v13, "getBytes:length:", v200, v33);
  }
  v173 = 0;
  if (v33)
  {
LABEL_56:
    v36 = 0;
    v37 = MEMORY[0x1E0C80978];
    do
    {
      v38 = *((unsigned __int8 *)v200 + v36);
      if (*((char *)v200 + v36) < 0)
        v39 = __maskrune(v38, 0x4000uLL);
      else
        v39 = *(_DWORD *)(v37 + 4 * v38 + 60) & 0x4000;
      if (v39)
        v40 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v40 = v36;
      ++v36;
    }
    while (v40 == 0x7FFFFFFFFFFFFFFFLL && v36 < v33);
    if (v40 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_70;
  }
LABEL_69:
  v40 = 0;
LABEL_70:
  if (v33 >= 9)
  {
    v42 = LODWORD(v200[0]) == 1768714338 && WORD2(v200[0]) == 29811;
    if (v42
      && BYTE6(v200[0]) >= 0x30u
      && BYTE6(v200[0]) <= 0x39u
      && HIBYTE(v200[0]) >= 0x30u
      && HIBYTE(v200[0]) <= 0x39u)
    {
LABEL_80:
      v43 = (const __CFString **)&NSWebArchiveTextDocumentType;
LABEL_130:
      v25 = *v43;
      goto LABEL_131;
    }
    if (a3 && v200[0] == 1684436082)
    {
      v43 = (const __CFString **)&NSRTFDTextDocumentType;
      goto LABEL_130;
    }
  }
  v44 = v33 - v40;
  if (v33 - v40 >= 6)
  {
    v45 = (char *)v200 + v40;
    if (*(_DWORD *)((char *)v200 + v40) == 1953651835 && *((_BYTE *)v200 + v40 + 4) == 102)
    {
      v43 = (const __CFString **)&NSRTFTextDocumentType;
      goto LABEL_130;
    }
    if (v44 >= 7)
    {
      if (!strncasecmp(v45, "<html", 5uLL) || !strncasecmp(v45, "<head", 5uLL) || !strncasecmp(v45, "<title", 6uLL))
        goto LABEL_129;
      if (v44 >= 0xF)
      {
        if (!strncasecmp(v45, "<!doctype html", 0xEuLL))
        {
LABEL_129:
          v43 = (const __CFString **)&NSHTMLTextDocumentType;
          goto LABEL_130;
        }
        if (v44 >= 0x14)
        {
          if (!strncasecmp(v45, "<?xml", 5uLL) && strnstr(v45, "<!DOCTYPE html", v44))
            goto LABEL_129;
          if (v44 >= 0x41
            && !strncasecmp(v45, "<?xml", 5uLL)
            && (strnstr(v45, "<!DOCTYPE plist", v44) || strnstr(v45, "<!doctype plist", v44))
            && strnstr(v45, "<plist", v44))
          {
            if (!strnstr(v45, "<key>WebMainResource</key>", v44))
            {
              v43 = (const __CFString **)&NSPlainTextDocumentType;
              goto LABEL_130;
            }
            goto LABEL_80;
          }
        }
      }
    }
  }
  v25 = 0;
LABEL_131:
  objc_msgSend(v173, "seekToFileOffset:", 0);
  v26 = v168;
LABEL_132:
  v55 = CFSTR("NSPlainText");
  if (v26)
    v55 = 0;
  if (v25)
    v56 = (__CFString *)v25;
  else
    v56 = (__CFString *)v55;
  v171 = v56;
  v165 = v175 | v15;
  if ((-[__CFString isEqual:](v56, "isEqual:", CFSTR("NSRTF")) & 1) == 0
    && !-[__CFString isEqual:](v171, "isEqual:", CFSTR("NSRTFD")))
  {
    if ((-[__CFString isEqual:](v171, "isEqual:", CFSTR("NSHTML")) & 1) != 0
      || -[__CFString isEqual:](v171, "isEqual:", CFSTR("NSWebArchive")))
    {
      if (a3)
      {
        v60 = (id)a3;
        goto LABEL_159;
      }
      v63 = objc_alloc(MEMORY[0x1E0C99D50]);
      if (v179 <= 0)
        v64 = 0;
      else
        v64 = 2;
      v60 = (id)objc_msgSend(v63, "initWithContentsOfFile:options:error:", v172, v64, &v194);
      if (v60)
      {
LABEL_159:
        if (v179
          || !+[NSHTMLReader allowsAttributedStringAgentForOptions:](NSHTMLReader, "allowsAttributedStringAgentForOptions:", v7))
        {
          v66 = -[NSHTMLReader initWithData:options:]([NSHTMLReader alloc], "initWithData:options:", v60, v7);
          if (v66)
          {
            v67 = a1;
            if (!a1)
              v67 = objc_alloc_init(MEMORY[0x1E0CB3778]);
            v176 = v67;
            -[NSHTMLReader setMutableAttributedString:](v66, "setMutableAttributedString:");
            -[NSHTMLReader setIncludesTextListMarkers:](v66, "setIncludesTextListMarkers:", v165);
            if (-[NSHTMLReader attributedString](v66, "attributedString"))
            {
              v68 = -[NSHTMLReader documentAttributes](v66, "documentAttributes");
              if (v68)
                v69 = (id)objc_msgSend(v68, "mutableCopy");
              else
                v69 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v195 = v69;
              objc_msgSend(v69, "setObject:forKey:", v171, CFSTR("DocumentType"));
              if (-[__CFString isEqual:](v171, "isEqual:", CFSTR("NSHTML")))
              {
                objc_msgSend(v195, "setObject:forKey:", objc_msgSend((id)*MEMORY[0x1E0CEC518], "identifier"), CFSTR("UTI"));
              }
              else if (-[__CFString isEqual:](v171, "isEqual:", CFSTR("NSWebArchive")))
              {
                objc_msgSend(v195, "setObject:forKey:", objc_msgSend((id)*MEMORY[0x1E0CEC658], "identifier"), CFSTR("UTI"));
              }
              v80 = 1;
            }
            else
            {
              v87 = (void *)MEMORY[0x1E0CB35C8];
              v88 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v172, *MEMORY[0x1E0CB2AA0], 0);
              v80 = 0;
              v194 = (id)objc_msgSend(v87, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, v88);
            }

          }
          else
          {
            v80 = 0;
            v176 = a1;
          }
        }
        else
        {
          if (!objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DocumentType"))
            || !objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_WKAllowNetworkLoadsOption")))
          {
            if (v7)
              v65 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v7);
            else
              v65 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v114 = (void *)v65;
            if (!objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DocumentType")))
              objc_msgSend(v114, "setObject:forKeyedSubscript:", v171, CFSTR("DocumentType"));
            if (!objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_WKAllowNetworkLoadsOption")))
            {
              v115 = (void *)objc_msgSend(v114, "objectForKeyedSubscript:", CFSTR("_NSHTMLAllowNetworkAccess"));
              if (v115)
                v116 = objc_msgSend(v115, "BOOLValue");
              else
                v116 = 1;
              objc_msgSend(v114, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v116), CFSTR("_WKAllowNetworkLoadsOption"));
              objc_msgSend(v114, "removeObjectForKey:", CFSTR("_NSHTMLAllowNetworkAccess"));
            }
            v7 = (id)objc_msgSend(v114, "copy");
          }
          if (a5)
          {
            v150 = dispatch_semaphore_create(0);
            dispatch_retain(v150);
            *(_QWORD *)&v196 = 0;
            *((_QWORD *)&v196 + 1) = &v196;
            *(_QWORD *)&v197 = 0x3052000000;
            *((_QWORD *)&v197 + 1) = __Block_byref_object_copy__3;
            v198 = __Block_byref_object_dispose__3;
            v199 = 0;
            v188 = 0;
            v189 = &v188;
            v190 = 0x3052000000;
            v191 = __Block_byref_object_copy__3;
            v192 = __Block_byref_object_dispose__3;
            v193 = 0;
            v182 = 0;
            v183 = &v182;
            v184 = 0x3052000000;
            v185 = __Block_byref_object_copy__3;
            v186 = __Block_byref_object_dispose__3;
            v187 = 0;
            v151 = MEMORY[0x1E0C809B0];
            v181[0] = MEMORY[0x1E0C809B0];
            v181[1] = 3221225472;
            v181[2] = ___NSReadAttributedStringFromURLOrDataCommon_block_invoke;
            v181[3] = &unk_1E2604620;
            v181[6] = &v196;
            v181[7] = &v188;
            v181[8] = &v182;
            v181[4] = v7;
            v181[5] = v150;
            if (-[__CFString isEqual:](v171, "isEqual:", CFSTR("NSWebArchive")))
            {
              v152 = (id)objc_msgSend(v7, "objectForKeyedSubscript:", NSBaseURLDocumentOption);
              if (!v152)
                v152 = objc_alloc_init(MEMORY[0x1E0C99E98]);
              v153 = objc_msgSend(v7, "objectForKey:", NSTextEncodingNameDocumentOption);
              v154 = &stru_1E260C7D0;
              v180[0] = v151;
              v180[1] = 3221225472;
              if (v153)
                v154 = (const __CFString *)v153;
              v180[2] = ___NSReadAttributedStringFromURLOrDataCommon_block_invoke_2;
              v180[3] = &unk_1E2604648;
              v180[4] = v60;
              v180[5] = v154;
              v180[6] = v152;
              objc_msgSend(MEMORY[0x1E0CB3498], "_loadFromHTMLWithOptions:contentLoader:completionHandler:", v7, v180, v181);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3498], "loadFromHTMLWithData:options:completionHandler:", v60, v7, v181);
            }
            v155 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", NSTimeoutDocumentOption);
            v89 = v170;
            v90 = v168;
            if (v155)
              objc_msgSend(v155, "doubleValue");
            else
              v156 = 60.0;
            v157 = dispatch_time(0, (uint64_t)(v156 * 1000000000.0));
            v158 = dispatch_semaphore_wait(v150, v157);
            dispatch_release(v150);
            v159 = (void *)v183[5];
            if (v159)
            {
              v194 = v159;

            }
            else if (v158)
            {
              v160 = (void *)MEMORY[0x1E0C99E08];
              v161 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 2, 0);
              v162 = (void *)objc_msgSend(v160, "dictionaryWithObject:forKey:", v161, *MEMORY[0x1E0CB3388]);
              v163 = v162;
              if (v172)
                objc_msgSend(v162, "setObject:forKeyedSubscript:", v172, *MEMORY[0x1E0CB2AA0]);
              v194 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, v163);

            }
            else
            {
              v176 = *(id *)(*((_QWORD *)&v196 + 1) + 40);
              if (v176)
              {
                if (a1)
                {
                  objc_msgSend(a1, "setAttributedString:", v176);

                  v176 = a1;
                }
                v195 = (id)v189[5];
                v80 = 1;
                goto LABEL_420;
              }
            }
            v80 = 0;
            v176 = a1;
LABEL_420:
            _Block_object_dispose(&v182, 8);
            _Block_object_dispose(&v188, 8);
            _Block_object_dispose(&v196, 8);
            goto LABEL_226;
          }
          *(_QWORD *)&v196 = 0;
          v80 = _NSReadAttributedStringFromHTMLData((uint64_t)v60, v7, (uint64_t)v172, &v196, &v195, &v194);
          v176 = a1;
          if (v80)
          {
            if (a1)
            {
              v176 = a1;
              if ((_QWORD)v196)
              {
                objc_msgSend(a1, "setAttributedString:", (_QWORD)v196);
                v176 = a1;
              }
            }
            else
            {
              v176 = (id)objc_msgSend((id)v196, "mutableCopy");
            }

          }
        }
        v89 = v170;
        v90 = v168;
LABEL_226:
        if (v89)
          v91 = 0;
        else
          v91 = v80 == 0;
        v92 = v167;
        if (!v91)
          v92 = 1;
        v85 = (v92 | v90) ^ 1;
        goto LABEL_232;
      }
    }
    else if (v170 && (-[__CFString isEqual:](v171, "isEqual:", CFSTR("NSPlainText")) & 1) == 0)
    {
      v194 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 65806, 0);
    }
    if ((-[__CFString isEqual:](v171, "isEqual:", CFSTR("NSPlainText")) & 1) == 0)
    {
      v86 = 0;
      v58 = v173;
      v176 = a1;
      goto LABEL_376;
    }
    v176 = a1;
    goto LABEL_238;
  }
  v57 = objc_msgSend((id)*MEMORY[0x1E0CEC5C0], "identifier");
  if (-[__CFString isEqual:](v171, "isEqual:", CFSTR("NSRTF")))
  {
    if (a3)
      goto LABEL_178;
    if (v179 < 1)
    {
      a3 = (uint64_t)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v172, 0, &v194);
    }
    else
    {
      a3 = (uint64_t)v166;
      if ((v14 & 1) == 0)
      {
        v58 = createOrResetFileHandle(v173, (uint64_t)v172, v7, 1);
        a3 = objc_msgSend(v58, "readDataToEndOfFile");
        if (!a3)
        {
          v112 = (void *)MEMORY[0x1E0CB35C8];
          v113 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v172, *MEMORY[0x1E0CB2AA0], 0);
          a3 = 0;
          v80 = 0;
          v194 = (id)objc_msgSend(v112, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 256, v113);
          goto LABEL_206;
        }
        v173 = v58;
        goto LABEL_178;
      }
    }
    if (a3)
    {
LABEL_178:
      v59 = -[NSRTFReader initWithRTF:]([NSRTFReader alloc], "initWithRTF:", a3);
      if (v59)
        goto LABEL_179;
    }
LABEL_205:
    v80 = 0;
    v58 = v173;
LABEL_206:
    v176 = a1;
    goto LABEL_207;
  }
  if (!a3)
  {
    if (v179 < 1)
    {
      v81 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", objc_msgSend(v172, "stringByResolvingSymlinksInPath"));
      v82 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initWithURL:options:error:", v81, 1, &v194);
      if (v82)
      {
        v59 = -[NSRTFReader initWithRTFDFileWrapper:]([NSRTFReader alloc], "initWithRTFDFileWrapper:", v82);
        goto LABEL_204;
      }
    }
    else
    {
      v61 = objc_msgSend(v172, "stringByAppendingPathComponent:", CFSTR("TXT.rtf"));
      v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v61, 2, &v194);
      if (v62)
      {
        v59 = -[NSRTFReader initWithRTF:]([NSRTFReader alloc], "initWithRTF:", v62);

        goto LABEL_204;
      }
    }
    v59 = 0;
LABEL_204:
    v57 = objc_msgSend((id)*MEMORY[0x1E0CEC5C8], "identifier");
    a3 = 0;
    if (v59)
      goto LABEL_179;
    goto LABEL_205;
  }
  v59 = -[NSRTFReader initWithRTFD:]([NSRTFReader alloc], "initWithRTFD:", a3);
  v57 = objc_msgSend((id)*MEMORY[0x1E0CEC4E8], "identifier");
  if (!v59)
    goto LABEL_205;
LABEL_179:
  v70 = objc_msgSend(v7, "objectForKey:", CFSTR("TargetTextScaling"));
  v71 = objc_msgSend(v7, "objectForKey:", CFSTR("TargetTextScaling"));
  v72 = (void *)objc_msgSend(v7, "objectForKey:", CFSTR("SourceTextScaling"));
  if (v71)
    v73 = 1;
  else
    v73 = v70 == 0;
  if (v73)
    v74 = (void *)v71;
  else
    v74 = (void *)v70;
  if (v74)
  {
    -[NSRTFReader _setTargetTextScaling:](v59, "_setTargetTextScaling:", objc_msgSend(v74, "integerValue"));
    if (v72)
      -[NSRTFReader _setSourceTextScaling:](v59, "_setSourceTextScaling:", objc_msgSend(v72, "integerValue"));
  }
  v75 = a1;
  if (!a1)
    v75 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v176 = v75;
  -[NSRTFReader setMutableAttributedString:](v59, "setMutableAttributedString:");
  if (v179 > 0)
    -[NSRTFReader setReadLimit:](v59, "setReadLimit:", v179);
  if (v12 >= 1)
    -[NSRTFReader setThumbnailLimit:](v59, "setThumbnailLimit:", v12);
  -[NSRTFReader setIncludesTextListMarkers:](v59, "setIncludesTextListMarkers:", v165);
  if (-[NSRTFReader attributedString](v59, "attributedString"))
  {
    v76 = -[NSRTFReader documentAttributes](v59, "documentAttributes");
    if (v76)
      v77 = (id)objc_msgSend(v76, "mutableCopy");
    else
      v77 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v195 = v77;
    objc_msgSend(v77, "setObject:forKey:", v171, CFSTR("DocumentType"));
    objc_msgSend(v195, "setObject:forKey:", v57, CFSTR("UTI"));
    v80 = 1;
  }
  else
  {
    v78 = (void *)MEMORY[0x1E0CB35C8];
    v79 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v172, *MEMORY[0x1E0CB2AA0], 0);
    v80 = 0;
    v194 = (id)objc_msgSend(v78, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, v79);
  }

  v58 = v173;
LABEL_207:
  if (v170)
    v83 = 0;
  else
    v83 = v80 == 0;
  v84 = v167;
  if (!v83)
    v84 = 1;
  if (((v168 | v84) & 1) != 0)
  {
    v85 = 0;
    v173 = v58;
    v60 = (id)a3;
LABEL_232:
    v86 = v80 != 0;
    if (v80)
    {
      v58 = v173;
      goto LABEL_376;
    }
    a3 = (uint64_t)v60;
    v58 = v173;
    goto LABEL_235;
  }
  v85 = -[__CFString isEqual:](v171, "isEqual:", CFSTR("NSRTF"));
LABEL_235:
  if ((-[__CFString isEqual:](v171, "isEqual:", CFSTR("NSPlainText")) & 1) == 0 && !v85)
  {
    v86 = 0;
    goto LABEL_376;
  }
  v173 = v58;
LABEL_238:
  v196 = 0u;
  v197 = 0u;
  if (a3)
  {
    v93 = objc_msgSend((id)a3, "length");
    if (v93 >= 0x200)
      v33 = 512;
    else
      v33 = v93;
    objc_msgSend((id)a3, "getBytes:length:", v200, v33);
  }
  else if (v166)
  {
    v94 = objc_msgSend(v166, "length");
    if (v94 >= 0x200)
      v33 = 512;
    else
      v33 = v94;
    objc_msgSend(v166, "getBytes:length:", v200, v33);
  }
  else if (v169)
  {
    v95 = createOrResetFileHandle(v173, (uint64_t)v172, v7, v179 > 0);
    v33 = objc_msgSend(v95, "readDataOfLength:buffer:", 512, v200);
    v173 = v95;
  }
  v96 = _NSExplicitCharacterEncodingTakesPrecedence_characterEncodingTakesPrecedence;
  if (_NSExplicitCharacterEncodingTakesPrecedence_characterEncodingTakesPrecedence == 254)
  {
    v96 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSExplicitCharacterEncodingTakesPrecedence"));
    _NSExplicitCharacterEncodingTakesPrecedence_characterEncodingTakesPrecedence = v96;
  }
  if (!v96
    || (v97 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", CFSTR("CharacterEncoding")), "unsignedIntegerValue")) == 0)
  {
    v99 = v173;
    if (v173 || (v99 = createOrResetFileHandle(0, (uint64_t)v172, v7, v179 > 0)) != 0)
    {
      v173 = v99;
      objc_msgSend(v99, "fileDescriptor");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.TextEncoding"));
      if (objc_msgSend((id)_NSReadExtendedAttributesFromFileDescriptor(), "objectForKey:", CFSTR("com.apple.TextEncoding")))
      {
        v100 = _NSEncodingFromDataForExtendedAttribute();
        if (v100 != 0xFFFFFFFFLL)
        {
          v98 = v100;
          if (v100)
            goto LABEL_261;
        }
      }
    }
    else
    {
      v173 = 0;
    }
    if (!v33)
      goto LABEL_277;
    v102 = 0;
    v103 = MEMORY[0x1E0C80978];
    do
    {
      v104 = *((unsigned __int8 *)v200 + v102);
      if (*((char *)v200 + v102) < 0)
        v105 = __maskrune(v104, 0x4000uLL);
      else
        v105 = *(_DWORD *)(v103 + 4 * v104 + 60) & 0x4000;
      if (v105)
        v106 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v106 = v102;
      ++v102;
    }
    while (v106 == 0x7FFFFFFFFFFFFFFFLL && v102 < v33);
    if (v106 == 0x7FFFFFFFFFFFFFFFLL)
LABEL_277:
      v106 = 0;
    if (v33 < 4)
    {
      if (v33 < 2)
      {
LABEL_293:
        if (!v96)
        {
          v111 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", CFSTR("CharacterEncoding")), "unsignedIntegerValue");
          if (v111)
          {
            v101 = 0;
            v98 = v111;
            goto LABEL_320;
          }
        }
        if (v33 >= 3 && LOBYTE(v200[0]) == 239 && BYTE1(v200[0]) == 187 && BYTE2(v200[0]) == 191)
          goto LABEL_307;
        v110 = v33 - v106;
        if (v33 - v106 < 6)
          goto LABEL_307;
        if (!strncasecmp((const char *)v200 + v106, "<?xml", 5uLL))
        {
          v117 = _NSXMLEncoding((char *)v200 + v106, v33 - v106);
          v101 = 0;
          if (v117)
            v98 = v117;
          else
            v98 = 4;
          goto LABEL_320;
        }
        if (v110 < 7
          || strncasecmp((const char *)v200 + v106, "<html", 5uLL)
          && strncasecmp((const char *)v200 + v106, "<head", 5uLL)
          && strncasecmp((const char *)v200 + v106, "<title", 6uLL)
          && (v110 < 0xF || strncasecmp((const char *)v200 + v106, "<!doctype html", 0xEuLL))
          || (v97 = _NSHTMLEncoding((char *)v200 + v106, v33 - v106)) == 0)
        {
LABEL_307:
          *(_QWORD *)&v196 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
          v101 = 1;
          v98 = 4;
          goto LABEL_320;
        }
        goto LABEL_255;
      }
      v108 = LOBYTE(v200[0]);
      v109 = BYTE1(v200[0]);
    }
    else
    {
      v108 = LOBYTE(v200[0]);
      v109 = BYTE1(v200[0]);
      if (LOBYTE(v200[0]) == 255 && BYTE1(v200[0]) == 254 && !WORD1(v200[0])
        || !LOWORD(v200[0]) && BYTE2(v200[0]) == 254 && BYTE3(v200[0]) == 255)
      {
        v101 = 0;
        v98 = 2348810496;
        goto LABEL_320;
      }
    }
    if (v108 == 255 && v109 == 254 || v108 == 254 && v109 == 255)
    {
      v101 = 0;
      v98 = 10;
      goto LABEL_320;
    }
    goto LABEL_293;
  }
LABEL_255:
  v98 = v97;
LABEL_261:
  v101 = 0;
LABEL_320:
  if (!a3)
  {
    if (v178 < 1)
    {
      v58 = v173;
      if (v173)
      {
        objc_msgSend(v173, "seekToFileOffset:", 0);
        v118 = (id)objc_msgSend(v173, "readDataToEndOfFile");
      }
      else
      {
        v118 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v172, 0, &v194);
        v58 = 0;
      }
      a3 = (uint64_t)v118;
      if (!v118)
        goto LABEL_436;
    }
    else
    {
      v58 = v173;
      if ((v164 & 1) != 0)
      {
        a3 = (uint64_t)v166;
        if (!v166)
        {
LABEL_436:
          v122 = 0;
          goto LABEL_375;
        }
      }
      else
      {
        v58 = createOrResetFileHandle(v173, (uint64_t)v172, v7, v179 > 0);
        a3 = objc_msgSend(v58, "readDataOfLength:", v178);
        if (!a3)
        {
          v119 = (void *)MEMORY[0x1E0CB35C8];
          v120 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v172, *MEMORY[0x1E0CB2AA0], 0);
          v121 = objc_msgSend(v119, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 256, v120);
          v122 = 0;
          v194 = (id)v121;
          goto LABEL_375;
        }
      }
    }
    v173 = v58;
  }
  if (!a1)
  {
    if (v176)

    v176 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  }
  objc_msgSend(v176, "beginEditing");
  if (!v98)
  {
    if (!v194)
      goto LABEL_359;
LABEL_364:
    v122 = 0;
    goto LABEL_374;
  }
  v123 = 0;
  v124 = v98;
  while (1)
  {
    v125 = objc_opt_class();
    if (v125 == objc_opt_class())
    {
      v126 = objc_alloc_init(MEMORY[0x1E0CB34C0]);
      if ((objc_msgSend(v126, "_setData:encoding:", a3, v124) & 1) == 0)
      {

        goto LABEL_342;
      }
    }
    else
    {
      v126 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", a3, v124);
    }
    if (v126)
      goto LABEL_356;
LABEL_342:
    v188 = 0;
    v188 = objc_msgSend((id)a3, "length");
    if (v178 == v188 && v178 > 0)
    {
      CFStringConvertNSStringEncodingToEncoding(v124);
      objc_msgSend((id)a3, "bytes");
      if (CFStringEncodingBytesToUnicode() == 1 && v188 > 0)
      {
        v128 = objc_allocWithZone(MEMORY[0x1E0CB3940]);
        v129 = objc_msgSend((id)a3, "bytes");
        v126 = (id)objc_msgSend(v128, "initWithBytes:length:encoding:", v129, v188, v124);
        if (v126)
          goto LABEL_356;
      }
    }
    if (v123 >= v101)
      break;
    v124 = *((_QWORD *)&v196 + v123++);
    if (!v124)
    {
      v126 = 0;
      v130 = 0;
      goto LABEL_357;
    }
  }
  v126 = 0;
  v124 = 0;
LABEL_356:
  v130 = v126 != 0;
LABEL_357:
  if (!v130 && !v194)
  {
LABEL_359:
    v131 = (void *)MEMORY[0x1E0CB35C8];
    v132 = (void *)MEMORY[0x1E0C99D80];
    v133 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v134 = objc_msgSend(v132, "dictionaryWithObjectsAndKeys:", v133, *MEMORY[0x1E0CB31F0], v172, *MEMORY[0x1E0CB2AA0], 0);
    v122 = 0;
    v194 = (id)objc_msgSend(v131, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 261, v134);
    goto LABEL_374;
  }
  if (!v130)
    goto LABEL_364;
  v135 = CFStringConvertNSStringEncodingToEncoding(v124);
  objc_msgSend(v176, "replaceCharactersInRange:withString:", 0, objc_msgSend(v176, "length"), v126);
  if (v135 == 1586 || (v135 & 0xFFF) == 0x100)
  {
    objc_msgSend(v126, "rangeOfCharacterFromSet:", _NSBidiControlCharacterSet());
    v136 = v137 == 0;
  }
  else
  {
    v136 = 1;
  }

  v138 = objc_msgSend(v7, "objectForKey:", CFSTR("DefaultAttributes"));
  if (v138)
  {
    objc_msgSend(v176, "setAttributes:range:", v138, 0, objc_msgSend(v176, "length"));
    if (!v136)
      objc_msgSend(v176, "convertBidiControlCharactersToWritingDirection");
  }
  else if (!v179)
  {
    v139 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", +[UIFont userFontOfSize:](NSFont, "userFontOfSize:", 12.0), CFSTR("NSFont"), 0);
    objc_msgSend(v176, "setAttributes:range:", v139, 0, objc_msgSend(v176, "length"));

  }
  v140 = (void *)MEMORY[0x1E0C99E08];
  v141 = objc_msgSend((id)*MEMORY[0x1E0CEC590], "identifier");
  v142 = (void *)objc_msgSend(v140, "dictionaryWithObjectsAndKeys:", CFSTR("NSPlainText"), CFSTR("DocumentType"), v141, CFSTR("UTI"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v124), CFSTR("CharacterEncoding"), 0);
  v195 = v142;
  if (v138)
    objc_msgSend(v142, "setObject:forKey:", v138, CFSTR("DefaultAttributes"));
  v122 = 1;
LABEL_374:
  objc_msgSend(v176, "endEditing");
  v58 = v173;
LABEL_375:
  v86 = v122 != 0;
LABEL_376:
  if (v58)
    objc_msgSend(v58, "closeFile");
  v143 = (uint64_t)v194;
  if (v194)
    v144 = 1;
  else
    v144 = v86;
  if ((v144 & 1) == 0)
  {
    v145 = (void *)MEMORY[0x1E0CB35C8];
    v146 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v172, *MEMORY[0x1E0CB2AA0], 0);
    v143 = objc_msgSend(v145, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 256, v146);
    v194 = (id)v143;
  }
  if (v86)
    v147 = v176;
  else
    v147 = 0;
  if (v86)
    v148 = v195;
  else
    v148 = 0;
  if (v86)
    v149 = 0;
  else
    v149 = v143;
  (*(void (**)(uint64_t, id, id, uint64_t))(a6 + 16))(a6, v147, v148, v149);
  if (!a1)

}

uint64_t _NSReadAttributedStringFromData(void *a1, uint64_t a2, void *a3, _QWORD *a4)
{
  return _NSReadAttributedStringFromURLOrData(a1, 0, a2, a3, a4, 0);
}

uint64_t _NSReadAttributedStringFromURL(void *a1, unint64_t a2, void *a3, _QWORD *a4)
{
  return _NSReadAttributedStringFromURLOrData(a1, a2, 0, a3, a4, 0);
}

void ___createAttachmentAndBidiCharSets_block_invoke()
{
  id v0;
  id v1;
  id v2;

  v0 = (id)_attachmentCharSet;
  if (!_attachmentCharSet)
  {
    v0 = (id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", 65532, 1);
    _attachmentCharSet = (uint64_t)v0;
  }
  if (!_nonAttachmentCharSet)
    _nonAttachmentCharSet = (uint64_t)(id)objc_msgSend(v0, "invertedSet");
  v1 = (id)_bidiEmbeddingAndOverrideCharSet;
  if (!_bidiEmbeddingAndOverrideCharSet)
  {
    v1 = (id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", 8234, 5);
    _bidiEmbeddingAndOverrideCharSet = (uint64_t)v1;
  }
  if (!_bidiControlCharacterSet)
  {
    v2 = (id)objc_msgSend(v1, "mutableCopy");
    objc_msgSend(v2, "addCharactersInRange:", 8206, 2);
    _bidiControlCharacterSet = objc_msgSend(v2, "copy");

  }
}

void *createOrResetFileHandle(void *a1, uint64_t a2, void *a3, int a4)
{
  void *v4;
  void *v8;

  v4 = a1;
  if (a1 || (v4 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("NSFileHandle"))) != 0)
  {
    objc_msgSend(v4, "seekToFileOffset:", 0);
  }
  else
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingAtPath:", a2);
    v4 = v8;
    if (a4 && v8)
      fcntl(objc_msgSend(v8, "fileDescriptor"), 48, 1);
  }
  return v4;
}

uint64_t UINibDecoderDecodeSet(_QWORD *a1, void *a2)
{
  int *v2;
  uint64_t v3;
  int v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[34];

  v16[32] = *MEMORY[0x1E0C80C00];
  v2 = (int *)(a1[6] + 8 * a1[23]);
  v3 = v2[1];
  if (!(_DWORD)v3)
    UINibDecoderDecodeSet_cold_1();
  v6 = *v2;
  v7 = (v3 - 1);
  if (v7 < 0x21)
  {
    v8 = v16;
    if (v3 < 2)
      goto LABEL_9;
  }
  else
  {
    v8 = malloc_type_malloc(8 * v7, 0x80040B8603338uLL);
  }
  v9 = 0;
  v10 = 0;
  v11 = v6 + 1;
  v12 = v3 - 1;
  do
  {
    v13 = UINibDecoderDecodeObjectForValue(a1, a1[7] + 8 * (v11 + v9), *(unsigned __int8 *)(a1[8] + (v11 + v9)));
    v8[v9] = v13;
    v10 |= v13 == 0;
    ++v9;
  }
  while (v12 != v9);
  if ((v10 & 1) != 0)
  {

    v14 = 0;
    goto LABEL_10;
  }
LABEL_9:
  v14 = objc_msgSend(a2, "initWithObjects:count:", v8, v7);
LABEL_10:
  if (v8 != v16)
    free(v8);
  return v14;
}

void sub_18D66A0F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D66A4BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D66B87C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

double _UIFoundationRoundedTextScalingFactor()
{
  return 0.77;
}

double _UIFoundationRoundedInverseTextScalingFactor()
{
  return 1.29871;
}

double _NSTextScalingConvertFontPointSize(uint64_t a1, uint64_t a2, double result)
{
  if (a1 != a2)
    return dbl_18D6CBEC0[a2 == 1] * result * 100000.0 / 100000.0;
  return result;
}

void sub_18D66D4A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D66D5F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D66D67C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D66D7B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D66DA30(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D66DAA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CFLocaleRef __NSCreateLocaleForPreferredLanguage(CFStringRef localeIdentifier)
{
  const __CFAllocator *v1;
  const __CFString *CanonicalLocaleIdentifierFromString;
  CFLocaleRef v3;

  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  CanonicalLocaleIdentifierFromString = CFLocaleCreateCanonicalLocaleIdentifierFromString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], localeIdentifier);
  v3 = CFLocaleCreate(v1, CanonicalLocaleIdentifierFromString);
  if (CanonicalLocaleIdentifierFromString)
    CFRelease(CanonicalLocaleIdentifierFromString);
  return v3;
}

void sub_18D66F210(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D670BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __NSTextHighlightShapeProviderGetMetrics(double *a1, double *a2, double a3, double a4)
{
  double v7;
  double v8;
  unint64_t v9;

  if (__NSTextHighlightShapeProviderGetMetrics_onceToken != -1)
    dispatch_once(&__NSTextHighlightShapeProviderGetMetrics_onceToken, &__block_literal_global_12);
  if (a4 >= 28.0)
  {
    v9 = vcvtmd_u64_f64(a4 + -28.0) / 0xA;
    v7 = (double)(v9 + 1) * 2.0 + 4.0;
    if (*(double *)&__NSTextHighlightShapeProviderGetMetrics_outsetIncrement <= 0.0)
      v8 = 2.0;
    else
      v8 = *(double *)&__NSTextHighlightShapeProviderGetMetrics_outsetIncrement * (double)v9 + 2.0;
  }
  else
  {
    v7 = 4.0;
    v8 = 2.0;
  }
  *a1 = v7;
  *a2 = v8;
}

void _freeExtraData(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  const void *v4;
  const void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v1 = (_QWORD *)a1;
  v2 = *(void **)(a1 + 56);
  if (v2)
  {

    v1 = (_QWORD *)a1;
  }
  v3 = (void *)v1[9];
  if (v3)
  {

    v1 = (_QWORD *)a1;
  }
  v4 = (const void *)v1[11];
  if (v4)
  {
    CFRelease(v4);
    v1 = (_QWORD *)a1;
  }
  v5 = (const void *)v1[12];
  if (v5)
  {
    CFRelease(v5);
    v1 = (_QWORD *)a1;
  }
  v6 = (void *)v1[23];
  if (v6)
  {
    _NSRemoveTextBlocksStartingAtGlyphIndex(v6, 0);

    v1 = (_QWORD *)a1;
  }
  v7 = (void *)v1[25];
  if (v7)
  {

    v1 = (_QWORD *)a1;
  }
  v8 = (void *)v1[52];
  if (v8)
  {

    v1 = (_QWORD *)a1;
  }
  v9 = (void *)v1[53];
  if (v9)
  {

    v1 = (_QWORD *)a1;
  }
  v10 = (void *)v1[54];
  if (v10)
  {

    v1 = (_QWORD *)a1;
  }
  v11 = (void *)v1[55];
  if (v11)
  {

    v1 = (_QWORD *)a1;
  }
  v12 = (void *)v1[64];
  if (v12)
  {

    v1 = (_QWORD *)a1;
  }

}

uint64_t _NSRemoveTextBlocksStartingAtGlyphIndex(void *a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  __int128 v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  unint64_t v15;
  unint64_t v16;
  __int128 v17;
  uint64_t v18;
  __n128 v20;
  uint64_t v21;

  v21 = 0;
  result = objc_msgSend(a1, "count");
  v18 = result;
  if (result)
  {
    v4 = 0;
    do
    {
      v5 = (_QWORD *)objc_msgSend(a1, "objectAtIndex:", v4);
      v6 = objc_msgSend(v5, "count");
      v8 = a2;
      v9 = v6 - a2;
      v20.n128_u64[0] = a2;
      v20.n128_u64[1] = v6 - a2;
      if (v6 > a2)
      {
        v10 = v6;
        v8 = a2;
        v11 = a2;
        do
        {
          *(_QWORD *)&v7 = _NSBlockNumberForIndex(v5, v11, &v20).n128_u64[0];
          if (v5[11] <= v12)
            v13 = v5[4] - v5[3];
          else
            v13 = 0;
          v14 = *(_OWORD **)(v5[7] + (v5[2] + 8) * (v13 + v12) + 8);
          v15 = v20.n128_u64[0];
          if (v14)
          {
            if (v20.n128_u64[0] >= a2)
            {

              v15 = v20.n128_u64[0];
            }
            else
            {
              v16 = v20.n128_u64[1] + v20.n128_u64[0];
              if (v20.n128_u64[1] + v20.n128_u64[0] > a2)
              {
                v7 = *MEMORY[0x1E0CB3438];
                v17 = *(_OWORD *)(MEMORY[0x1E0CB3438] + 16);
                v14[3] = *MEMORY[0x1E0CB3438];
                v14[4] = v17;
                v8 = v16;
              }
            }
          }
          v11 = v20.n128_u64[1] + v15;
        }
        while (v20.n128_u64[1] + v15 < v10);
        v9 = v10 - v8;
      }
      result = objc_msgSend(v5, "replaceElementsInRange:withElement:coalesceRuns:", v8, v9, &v21, 1, *(double *)&v7);
      ++v4;
    }
    while (v4 != v18);
  }
  return result;
}

void sub_18D672018(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double _NSTextBlockBoundingRectAtIndex(uint64_t a1, unint64_t a2)
{
  CGFloat y;
  double x;
  CGFloat height;
  CGFloat width;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  CGFloat *v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  __n128 v21;
  NSRect v22;
  NSRect v23;
  NSRect v24;
  NSRect v25;
  NSRect v26;

  x = *MEMORY[0x1E0CB3438];
  y = *(double *)(MEMORY[0x1E0CB3438] + 8);
  width = *(double *)(MEMORY[0x1E0CB3438] + 16);
  height = *(double *)(MEMORY[0x1E0CB3438] + 24);
  v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 240) + 184), "count");
  if (v8)
  {
    v9 = v8;
    for (i = 0; i != v9; ++i)
    {
      v11 = (_QWORD *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 240) + 184), "objectAtIndex:", i);
      v21 = 0uLL;
      _NSBlockNumberForIndex(v11, a2, &v21);
      v13 = 0;
      if (v11[11] <= v12)
        v13 = v11[4] - v11[3];
      v14 = *(CGFloat **)(v11[7] + (v11[2] + 8) * (v13 + v12) + 8);
      if (v14)
      {
        v15 = v14[6];
        v16 = v14[7];
        v17 = v14[8];
        v18 = v14[9];
        v22.origin.x = v15;
        v22.origin.y = v16;
        v22.size.width = v17;
        v22.size.height = v18;
        if (!NSIsEmptyRect(v22))
        {
          if (v21.n128_u64[0])
          {
            _NSLayoutTreeLineFragmentRectForGlyphAtIndex(a1, v21.n128_u64[0], 0);
            v16 = v16 + v19;
          }
          v23.origin.x = x;
          v23.origin.y = y;
          v23.size.width = width;
          v23.size.height = height;
          if (NSIsEmptyRect(v23))
          {
            height = v18;
            width = v17;
            y = v16;
            x = v15;
          }
          else
          {
            v24.origin.x = v15;
            v24.origin.y = v16;
            v24.size.width = v17;
            v24.size.height = v18;
            v26.origin.x = x;
            v26.origin.y = y;
            v26.size.width = width;
            v26.size.height = height;
            v25 = NSUnionRect(v24, v26);
            x = v25.origin.x;
            y = v25.origin.y;
            width = v25.size.width;
            height = v25.size.height;
          }
        }
      }
    }
  }
  return x;
}

void _NSRemoveTextBlocksForGlyphRange(void *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  __int128 v14;
  BOOL v15;
  unint64_t v16;
  uint64_t v17;
  __n128 v20;
  uint64_t v21;

  v21 = 0;
  v17 = objc_msgSend(a1, "count");
  if (v17)
  {
    v4 = 0;
    v16 = a2 + a3;
    do
    {
      v5 = (_QWORD *)objc_msgSend(a1, "objectAtIndex:", v4);
      v6 = objc_msgSend(v5, "count");
      v20 = 0uLL;
      if (v16 <= v6)
        v7 = a3;
      else
        v7 = v6 - a2;
      if (v6 >= v16)
        v8 = a2 + a3;
      else
        v8 = v6;
      v9 = a2;
      if (a2 < v8)
      {
        v10 = a2;
        do
        {
          _NSBlockNumberForIndex(v5, v10, &v20);
          if (v5[11] <= v11)
            v12 = v5[4] - v5[3];
          else
            v12 = 0;
          v13 = *(_OWORD **)(v5[7] + (v5[2] + 8) * (v12 + v11) + 8);
          if (v13)
          {
            if (a2 <= v20.n128_u64[0])
            {

              v10 = v20.n128_u64[1] + v20.n128_u64[0];
              if (v20.n128_u64[1] + v20.n128_u64[0] > v7 + v9)
                v7 = v20.n128_u64[1] + v20.n128_u64[0] - v9;
            }
            else
            {
              v10 = v20.n128_u64[1] + v20.n128_u64[0];
              if (a2 < v20.n128_u64[1] + v20.n128_u64[0])
              {
                v14 = *(_OWORD *)(MEMORY[0x1E0CB3438] + 16);
                v13[3] = *MEMORY[0x1E0CB3438];
                v13[4] = v14;
                if (v9 < v10)
                {
                  v15 = v7 + v9 >= v10;
                  v7 = v7 + v9 - v10;
                  if (v7 == 0 || !v15)
                    goto LABEL_27;
                  v9 = v10;
                }
              }
            }
          }
          else
          {
            v10 = v20.n128_u64[1] + v20.n128_u64[0];
          }
        }
        while (v10 < v8);
      }
      if (v7)
        objc_msgSend(v5, "replaceElementsInRange:withElement:coalesceRuns:", v9, v7, &v21, 1);
LABEL_27:
      ++v4;
    }
    while (v4 != v17);
  }
}

uint64_t _NSDeleteGlyphRangeFromTextBlocks(void *a1, unint64_t a2, unint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  BOOL v14;
  uint64_t v15;
  __n128 v17;

  result = objc_msgSend(a1, "count");
  v15 = result;
  if (result)
  {
    v6 = 0;
    v7 = a2 + a3;
    do
    {
      v8 = (_QWORD *)objc_msgSend(a1, "objectAtIndex:", v6, v15);
      v17.n128_u64[0] = a2;
      v17.n128_u64[1] = a3;
      if (a2 < v7)
      {
        v9 = a2;
        do
        {
          _NSBlockNumberForIndex(v8, v9, &v17);
          if (v8[11] <= v10)
            v11 = v8[4] - v8[3];
          else
            v11 = 0;
          v12 = *(void **)(v8[7] + (v8[2] + 8) * (v11 + v10) + 8);
          v13 = v17.n128_u64[0];
          if (v12)
            v14 = a2 > v17.n128_u64[0];
          else
            v14 = 1;
          if (!v14 && v17.n128_u64[1] + v17.n128_u64[0] <= v7)
          {

            v13 = v17.n128_u64[0];
          }
          v9 = v17.n128_u64[1] + v13;
        }
        while (v17.n128_u64[1] + v13 < v7);
      }
      result = objc_msgSend(v8, "removeElementsInRange:coalesceRuns:", a2, a3, 1);
      ++v6;
    }
    while (v6 != v15);
  }
  return result;
}

uint64_t _NSInsertGlyphRangeInTextBlocks(void *a1, unint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t i;
  _QWORD *v9;
  unint64_t v10;
  double v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  __n128 v16;
  uint64_t v17;

  v17 = 0;
  result = objc_msgSend(a1, "count");
  if (result)
  {
    v7 = result;
    for (i = 0; i != v7; ++i)
    {
      v9 = (_QWORD *)objc_msgSend(a1, "objectAtIndex:", i, v15);
      v10 = objc_msgSend(v9, "count");
      v16 = 0uLL;
      v15 = 0;
      if (a2 < v10
        && ((*(_QWORD *)&v11 = _NSBlockNumberForIndex(v9, a2, &v16).n128_u64[0], v9[11] <= v12)
          ? (v13 = v9[4] - v9[3])
          : (v13 = 0),
            (v15 = *(_QWORD *)(v9[7] + (v9[2] + 8) * (v13 + v12) + 8)) != 0
         && v16.n128_u64[0] < a2
         && a2 < v16.n128_u64[1] + v16.n128_u64[0]))
      {
        v14 = &v15;
      }
      else
      {
        v14 = &v17;
      }
      result = objc_msgSend(v9, "insertElement:range:coalesceRuns:", v14, a2, a3, 1, v11, v15);
    }
  }
  return result;
}

NSLayoutManagerTextBlockHelper *_NSAddTextBlockWithGlyphRange(uint64_t a1, id *a2, uint64_t a3, unint64_t a4, unint64_t a5)
{
  double *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSIdRunStorage *v22;
  unint64_t v23;
  double v24;
  unint64_t v25;
  double *v26;
  __n128 v29;
  uint64_t v30;
  NSLayoutManagerTextBlockHelper *v31;

  v30 = 0;
  v31 = 0;
  v9 = (double *)MEMORY[0x1E0CB3438];
  v10 = *a2;
  if (!*a2)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *a2 = v10;
  }
  v11 = *v9;
  v12 = v9[1];
  v13 = v9[2];
  v14 = v9[3];
  v15 = objc_msgSend(v10, "count");
  if (!v15)
  {
    v18 = v12;
    v19 = v11;
    v20 = v14;
    v21 = v13;
    goto LABEL_20;
  }
  v16 = v15;
  v17 = 0;
  v18 = v12;
  v19 = v11;
  v20 = v14;
  v21 = v13;
  while (1)
  {
    v22 = (NSIdRunStorage *)objc_msgSend(*a2, "objectAtIndex:", v17);
    v29 = 0uLL;
    *(_QWORD *)&v24 = _NSBlockNumberForIndex(v22, a4, &v29).n128_u64[0];
    v25 = 0;
    if (v22->super._gapBlockIndex <= v23)
      v25 = v22->super._maxBlocks - v22->super._numBlocks;
    v26 = *(double **)&v22->super._runs->var1[(v22->super._elementSize + 8) * (v25 + v23)];
    if (!v26)
      break;
    if (*((_QWORD *)v26 + 1) == a3)
    {
      if (__PAIR128__(a5, a4) == *(_OWORD *)&v29)
        return (NSLayoutManagerTextBlockHelper *)v26;
      v11 = v26[2];
      v12 = v26[3];
      v21 = v26[4];
      v20 = v26[5];
      v19 = v26[6];
      v18 = v26[7];
      v13 = v26[8];
      v14 = v26[9];
      -[NSRunStorage replaceElementsInRange:withElement:coalesceRuns:](v22, "replaceElementsInRange:withElement:coalesceRuns:", v24);

      _NSBlockNumberForIndex(v22, a4, &v29);
      break;
    }
LABEL_12:
    v22 = 0;
LABEL_16:
    if (++v17 >= v16)
      goto LABEL_17;
  }
  if (v29.n128_u64[0] > a4)
    goto LABEL_12;
  if (a4 + a5 > v29.n128_u64[1] + v29.n128_u64[0])
    v22 = 0;
  if (!v22)
    goto LABEL_16;
LABEL_17:
  if (!v22)
  {
LABEL_20:
    v22 = -[NSRunStorage initWithElementSize:capacity:]([NSIdRunStorage alloc], "initWithElementSize:capacity:", 8, 0);
    -[NSRunStorage insertElement:range:coalesceRuns:](v22, "insertElement:range:coalesceRuns:", &v30, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 208) + 8), 1);
    objc_msgSend(*a2, "addObject:", v22);

  }
  v31 = -[NSLayoutManagerTextBlockHelper initWithTextBlock:layoutRect:boundsRect:]([NSLayoutManagerTextBlockHelper alloc], "initWithTextBlock:layoutRect:boundsRect:", a3, v11, v12, v21, v20, v19, v18, v13, v14);
  -[NSRunStorage replaceElementsInRange:withElement:coalesceRuns:](v22, "replaceElementsInRange:withElement:coalesceRuns:", a4, a5, &v31, 1);
  return v31;
}

__n128 _NSLocateTextBlockAtIndex(void *a1, uint64_t a2, unint64_t a3, __int128 *a4)
{
  uint64_t v8;
  __n128 result;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;

  v8 = objc_msgSend(a1, "count");
  if (v8)
  {
    v10 = v8;
    v11 = 0;
    v16 = xmmword_18D6CBB80;
    while (1)
    {
      v12 = (_QWORD *)objc_msgSend(a1, "objectAtIndex:", v11);
      v17 = xmmword_18D6CBB80;
      result = _NSBlockNumberForIndex(v12, a3, (__n128 *)&v17);
      v14 = v12[11] <= v13 ? v12[4] - v12[3] : 0;
      v15 = *(_QWORD *)(v12[7] + (v12[2] + 8) * (v14 + v13) + 8);
      if (v15)
      {
        if (*(_QWORD *)(v15 + 8) == a2)
          break;
      }
      if (++v11 >= v10)
        goto LABEL_13;
    }
    result.n128_u64[0] = v17;
    v16 = v17;
LABEL_13:
    if (a4)
      goto LABEL_14;
  }
  else
  {
    result.n128_u64[0] = 0x7FFFFFFFFFFFFFFFLL;
    v16 = xmmword_18D6CBB80;
    if (a4)
    {
LABEL_14:
      result = (__n128)v16;
      *a4 = v16;
    }
  }
  return result;
}

NSUInteger _glyphIndexForPoint(uint64_t a1, void *a2, double *a3, double a4, double a5)
{
  uint64_t v10;
  NSUInteger v11;
  unint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  unint64_t v20;
  double v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t location;
  unint64_t length;
  double v26;
  double v27;
  double v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  double v32;
  _BOOL4 v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double *v38;
  NSUInteger v39;
  NSUInteger v40;
  NSUInteger v41;
  NSUInteger v42;
  int v43;
  NSUInteger v44;
  unint64_t v45;
  _QWORD *v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  double v51;
  NSRange v52;
  NSRange v53;
  double v54;
  double v55;
  NSUInteger v57;
  double v58;
  NSUInteger v59;
  NSRange v60;
  NSRange v61;
  double v62;
  double v63;
  double v64;
  _QWORD *v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSRange v69;
  NSRange v70;
  NSUInteger v71;
  NSUInteger v72;
  NSRange v73;
  double v74;
  NSUInteger v75;
  NSUInteger v76;
  NSUInteger v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v84;
  double v85;
  double v86;
  double v87;
  NSUInteger v88;
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
  uint64_t v101;
  uint64_t v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  unint64_t v108;
  double v109;
  unint64_t v110;
  unint64_t v111;
  unint64_t v112;
  double v113;
  int v114;
  int v115;
  double v116;
  double v117;
  int v118;
  double v119;
  double v120;
  BOOL v121;
  char v122;
  char v123;
  BOOL v124;
  char v125;
  char v126;
  char v127;
  char v128;
  BOOL v129;
  char v130;
  double v131;
  BOOL v132;
  double v133;
  uint64_t v134;
  unint64_t v135;
  int v136;
  double v137;
  NSUInteger v139;
  double *v140;
  NSRange v141;
  unint64_t v142;
  NSRange v143;
  NSRange v144;
  unsigned __int128 v145;
  NSRange v146;
  NSRange v147;
  NSRange v148;
  NSRange v149;
  NSRange v150;
  NSRange v151;

  v143 = (NSRange)0;
  v142 = 0;
  v10 = *(_QWORD *)(a1 + 240);
  if (*(void **)(v10 + 472) == a2 && a4 == *(double *)(v10 + 456) && a5 == *(double *)(v10 + 464))
  {
    if (a3)
      *a3 = *(double *)(v10 + 488);
    return *(_QWORD *)(v10 + 480);
  }
  if (objc_msgSend(a2, "layoutManager") != a1)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("*** NSLayoutManager _glyphIndexForPoint(): given container does not appear in the list of containers for this NSLayoutManager."));
  *(_QWORD *)(v10 + 472) = a2;
  *(double *)(v10 + 456) = a4;
  *(double *)(v10 + 464) = a5;
  _NSFastFillAllLayoutHolesForGlyphRange(a1, 0, 1uLL);
  if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 208) + 56) & 2) == 0)
  {
    if (a3)
      *a3 = 0.0;
    goto LABEL_7;
  }
  v145 = 0uLL;
  v144 = (NSRange)0;
  v12 = objc_msgSend((id)a1, "_indexOfFirstGlyphInTextContainer:okToFillHoles:", a2, 1);
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3)
      *a3 = 1.0;
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 208) + 8);
    goto LABEL_12;
  }
  v11 = v12;
  v14 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex(a1, v12, (uint64_t *)&v145);
  v16 = v15;
  v18 = v17;
  if (v15 > a5)
  {
    v19 = objc_msgSend((id)a1, "_blockRangeForGlyphRange:", v145, v14);
    if (v145 == __PAIR128__(v20, v19))
    {
      if (a3)
        *a3 = 0.0;
      *(_QWORD *)(v10 + 480) = v11;
      *(_QWORD *)(v10 + 488) = 0;
      return v11;
    }
  }
  if ((*(_BYTE *)(a1 + 67) & 0x40) != 0)
  {
    v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 208) + 8);
    v143.location = 0;
    v143.length = v22;
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 0, v14);
  }
  else if (objc_msgSend(*(id *)(a1 + 48), "count", v14) > v11)
  {
    *(_QWORD *)&v21 = _NSBlockNumberForIndex((_QWORD *)*(_QWORD *)(a1 + 48), v11, (__n128 *)&v143).n128_u64[0];
  }
  if ((*(_BYTE *)(a1 + 67) & 0x40) != 0)
  {
    length = v143.length;
    location = v143.location;
  }
  else
  {
    if (*(_QWORD *)(a1 + 216) == 0x7FFFFFFFFFFFFFFFLL || (v23 = *(_QWORD *)(a1 + 208), v23 == 0x7FFFFFFFFFFFFFFFLL))
    {
      objc_msgSend((id)a1, "getFirstUnlaidCharacterIndex:glyphIndex:", 0, &v142, v21);
      v23 = v142;
    }
    else
    {
      v142 = *(_QWORD *)(a1 + 208);
    }
    length = v143.length;
    location = v143.location;
    if (v143.length + v143.location > v23)
    {
      length = v23 - v143.location;
      v143.length = v23 - v143.location;
    }
  }
  v140 = a3;
  _NSLayoutTreeLineFragmentRectForGlyphAtIndex(a1, location + length - 1, (uint64_t *)&v144);
  v28 = v26;
  if (a5 >= v26)
  {
    v32 = v27;
    v33 = a5 < v26 + v27;
    v145 = (unsigned __int128)v144;
    v16 = v26;
  }
  else
  {
    v29 = *((_QWORD *)&v145 + 1);
    v30 = v145;
    v31 = v144.location;
    v141 = (NSRange)0;
    if (a5 < v16 || a5 >= v16 + v18)
    {
      if ((_QWORD)v145 != v144.location)
      {
        while (v30 + v29 != v31)
        {
          _NSLayoutTreeLineFragmentRectForGlyphAtIndex(a1, v30 + v29 - 1 + ((v31 - (v30 + v29 - 1)) >> 1), (uint64_t *)&v141);
          v16 = v54;
          if (a5 >= v54 && a5 < v54 + v55)
          {
            v32 = v55;
            v145 = (unsigned __int128)v141;
            goto LABEL_42;
          }
          if (v54 <= a5)
          {
            v29 = v141.length;
            v30 = v141.location;
          }
          else
          {
            v31 = v141.location;
          }
          if (v30 == v31)
            goto LABEL_41;
        }
      }
      v31 = v30;
LABEL_41:
      _NSLayoutTreeLineFragmentRectForGlyphAtIndex(a1, v31, 0);
      v16 = v34;
      v32 = v35;
      *(_QWORD *)&v145 = v31;
      *((_QWORD *)&v145 + 1) = v29;
    }
    else
    {
      v32 = v18;
    }
LABEL_42:
    v33 = 1;
  }
  if ((*(_BYTE *)(a1 + 67) & 0x40) != 0)
  {
    _NSFastFillAllLayoutHolesForGlyphRange(a1, v145, *((unint64_t *)&v145 + 1));
    _NSLayoutTreeLineFragmentRectForGlyphAtIndex(a1, v145, (uint64_t *)&v145);
    v16 = v36;
    v32 = v37;
  }
  v38 = (double *)MEMORY[0x1E0CB3438];
  if (v33 && (unint64_t)v145 > v143.location)
  {
    v141 = (NSRange)v145;
    v39 = v145;
    v40 = 0;
    v139 = 0;
    v41 = 0x7FFFFFFFFFFFFFFFLL;
    v42 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v43 = *(_DWORD *)(a1 + 64);
      if ((v43 & 0x40000000) != 0)
      {
        _NSFastFillAllLayoutHolesForGlyphRange(a1, v39 - 1, 1uLL);
        v39 = v141.location;
        v43 = *(_DWORD *)(a1 + 64);
      }
      if ((v43 & 0x40000000) != 0)
      {
        v49 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 0);
      }
      else
      {
        v44 = v40;
        v45 = v39 - 1;
        if (objc_msgSend(*(id *)(a1 + 48), "count") <= v39 - 1)
        {
          v49 = 0;
        }
        else
        {
          v46 = *(_QWORD **)(a1 + 48);
          _NSBlockNumberForIndex(v46, v45, 0);
          v48 = 0;
          if (v46[11] <= v47)
            v48 = v46[4] - v46[3];
          v49 = *(_QWORD *)(v46[7] + (v46[2] + 8) * (v48 + v47) + 8);
        }
        v40 = v44;
      }
      _NSLayoutTreeLineFragmentRectForGlyphAtIndex(a1, v141.location - 1, (uint64_t *)&v141);
      if ((void *)v49 != a2)
        break;
      if (v50 + v51 <= a5)
      {
        if (v42 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v146.location = objc_msgSend((id)a1, "_blockRowRangeForGlyphRange:", v141, v50 + v51);
          v52 = NSIntersectionRange(v146, v143);
          v42 = v52.location;
          v139 = v52.length;
        }
        if (v42 == 0x7FFFFFFFFFFFFFFFLL || !v139 || v141.location <= v42)
          break;
      }
      else if (v50 <= a5)
      {
        if (v41 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v40 = v141.length;
          v41 = v141.location;
        }
        else
        {
          v147.location = v41;
          v147.length = v40;
          v53 = NSUnionRange(v147, v141);
          v41 = v53.location;
          v40 = v53.length;
        }
      }
      v39 = v141.location;
    }
    while (v141.location > v143.location);
    v38 = (double *)MEMORY[0x1E0CB3438];
  }
  else
  {
    v40 = 0;
    v41 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v57 = 0;
  v58 = *v38;
  v59 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    if (v16 <= a5)
    {
      if (v32 + v16 > a5)
      {
        if (v41 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v40 = *((_QWORD *)&v145 + 1);
          v41 = v145;
        }
        else
        {
          v149.location = v41;
          v149.length = v40;
          v61 = NSUnionRange(v149, (NSRange)v145);
          v41 = v61.location;
          v40 = v61.length;
        }
      }
      goto LABEL_96;
    }
    if (v59 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v148.location = objc_msgSend((id)a1, "_blockRowRangeForGlyphRange:", v145);
      v60 = NSIntersectionRange(v148, v143);
      v59 = v60.location;
      v57 = v60.length;
    }
    if (v59 == 0x7FFFFFFFFFFFFFFFLL || !v57 || *((_QWORD *)&v145 + 1) + (_QWORD)v145 >= v59 + v57)
      break;
LABEL_96:
    v11 = *((_QWORD *)&v145 + 1) + v145;
    if (a5 >= v28 || (*(_BYTE *)(a1 + 67) & 0x40) != 0)
      _NSFastFillAllLayoutHolesForGlyphRange(a1, *((_QWORD *)&v145 + 1) + v145, 1uLL);
    if (v11 < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 208) + 8))
    {
      v62 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex(a1, v11, (uint64_t *)&v145);
      v16 = v63;
      v32 = v64;
      if ((*(_BYTE *)(a1 + 67) & 0x40) != 0)
      {
        v68 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 0, v62);
      }
      else if (objc_msgSend(*(id *)(a1 + 48), "count", v62) <= v11)
      {
        v68 = 0;
      }
      else
      {
        v65 = *(_QWORD **)(a1 + 48);
        _NSBlockNumberForIndex(v65, v11, 0);
        v67 = 0;
        if (v65[11] <= v66)
          v67 = v65[4] - v65[3];
        v68 = *(_QWORD *)(v65[7] + (v65[2] + 8) * (v67 + v66) + 8);
      }
      if ((void *)v68 == a2)
        continue;
    }
    break;
  }
  if (!v40)
  {
    if (v11 < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 208) + 8))
    {
      if ((_QWORD)v145)
      {
        v141 = (NSRange)0;
        _NSLayoutTreeLineFragmentRectForGlyphAtIndex(a1, v145 - 1, (uint64_t *)&v141);
        if (v98 + v99 - a5 <= a5 - v16)
        {
          if (v140)
            *v140 = 1.0;
          v11 = v141.location + v141.length - 1;
          v100 = 1.0;
        }
        else
        {
          if (v140)
            *v140 = 0.0;
          v100 = 0.0;
          v11 = v145;
        }
        *(_QWORD *)(v10 + 480) = v11;
        *(double *)(v10 + 488) = v100;
        return v11;
      }
      if (v140)
        *v140 = 0.0;
LABEL_7:
      v11 = 0;
      *(_QWORD *)(v10 + 480) = 0;
      *(_QWORD *)(v10 + 488) = 0;
      return v11;
    }
    v101 = objc_msgSend((id)a1, "glyphRangeForTextContainer:", a2);
    if (v140)
      *v140 = 1.0;
    v13 = v102 + v101;
LABEL_12:
    v11 = v13 - 1;
    *(_QWORD *)(v10 + 480) = v13 - 1;
    *(_QWORD *)(v10 + 488) = 0x3FF0000000000000;
    return v11;
  }
  v150.location = objc_msgSend((id)a1, "_blockRowRangeForGlyphRange:", v41, v40);
  v69 = NSIntersectionRange(v150, v143);
  v70.length = v69.length;
  v71 = v40;
  v72 = v41;
  if (v69.length)
  {
    v70.location = v69.location;
    v151.location = v41;
    v151.length = v40;
    v73 = NSUnionRange(v151, v70);
    v71 = v73.length;
    v72 = v73.location;
  }
  v74 = 10000000.0;
  if (v72 == v41 && v71 == v40 || (v75 = v72 + v71, v72 >= v72 + v71))
  {
    v76 = 0;
  }
  else
  {
    v76 = 0;
    v77 = 0x7FFFFFFFFFFFFFFFLL;
    v74 = 10000000.0;
    do
    {
      v78 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex(a1, v72, (uint64_t *)&v145);
      v82 = v79 + v81;
      if (a5 >= v79 && a5 < v82)
      {
        if (a4 >= v78)
        {
          v85 = v78 + v80;
          v121 = a4 <= v85;
          v84 = a4 - v85;
          if (v121)
            v84 = 0.0;
        }
        else
        {
          v84 = v78 - a4;
        }
        if (a5 >= v79)
        {
          v86 = 0.0;
          if (a5 > v82)
            v86 = a5 - v82;
        }
        else
        {
          v86 = v79 - a5;
        }
        v87 = sqrt(v86 * v86 + v84 * v84);
        if (v87 <= v74)
        {
          v76 = *((_QWORD *)&v145 + 1);
          v77 = v145;
          v74 = v87;
          v58 = v78;
        }
      }
      v72 = *((_QWORD *)&v145 + 1) + v145;
    }
    while (*((_QWORD *)&v145 + 1) + (_QWORD)v145 < v75);
    if (v77 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_158;
  }
  v88 = v41 + v40;
  v77 = 0x7FFFFFFFFFFFFFFFLL;
  if (v41 < v41 + v40)
  {
    while (1)
    {
      v89 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex(a1, v41, (uint64_t *)&v145);
      if (a4 >= v89)
      {
        v94 = v89 + v91;
        v121 = a4 <= v94;
        v93 = a4 - v94;
        if (v121)
          v93 = 0.0;
      }
      else
      {
        v93 = v89 - a4;
      }
      if (a5 >= v90)
      {
        v96 = v90 + v92;
        v95 = 0.0;
        if (a5 > v96)
          v95 = a5 - v96;
      }
      else
      {
        v95 = v90 - a5;
      }
      v97 = sqrt(v95 * v95 + v93 * v93);
      if (v97 == 0.0)
        break;
      if (v97 < v74)
      {
        v74 = v97;
        v76 = *((_QWORD *)&v145 + 1);
        v77 = v145;
        v58 = v89;
      }
      v41 = *((_QWORD *)&v145 + 1) + v145;
      if (*((_QWORD *)&v145 + 1) + (_QWORD)v145 >= v88)
        goto LABEL_158;
    }
    v76 = *((_QWORD *)&v145 + 1);
    v77 = v145;
    v58 = v89;
  }
LABEL_158:
  v103 = _NSLayoutTreeLineFragmentUsedRectForGlyphAtIndex(a1, v77, (uint64_t *)&v145);
  v105 = v104;
  objc_msgSend(a2, "lineFragmentPadding");
  v107 = v103 + v105 - v106;
  v108 = v77 + v76;
  if (v77 >= v77 + v76)
  {
    v113 = 10000000.0;
    v112 = v77;
    v111 = v77;
  }
  else
  {
    v109 = 10000000.0;
    v110 = v77;
    v111 = v77;
    v112 = v77;
    v113 = 10000000.0;
    do
    {
      v114 = _NSGlyphTreeGlyphAtIndex(a1, v110, 0);
      if (!v114)
        goto LABEL_220;
      v115 = v114;
      objc_msgSend((id)a1, "locationForGlyphAtIndex:", v110);
      v117 = v116;
      if ((*(_BYTE *)(a1 + 67) & 2) != 0)
      {
        if ((_NSGlyphTreeBidiLevelForGlyphAtIndex(a1, v110) & 1) != 0)
        {
          v118 = 1;
        }
        else
        {
          v118 = 0;
          if (v110 > v77 && v115 == 0xFFFFFF && v110 + 1 >= v108)
            v118 = _NSGlyphTreeBidiLevelForGlyphAtIndex(a1, v110 - 1) & 1;
        }
      }
      else
      {
        v118 = 0;
      }
      v119 = v58 + v117;
      v120 = v58 + v117 - a4;
      if (v58 + v117 <= a4)
        v120 = a4 - (v58 + v117);
      v121 = v119 > v113 || v113 <= a4;
      if (!v121
        || (v119 < v113 ? (v122 = 1) : (v122 = v118),
            (v122 & 1) == 0 && v119 <= a4
         || (v123 = v118 ^ 1, ((v118 ^ 1) & 1) == 0) && (v119 > v113 ? (v124 = v119 > a4) : (v124 = 1), !v124)))
      {
        v123 = v118 ^ 1;
        v113 = v58 + v117;
        v111 = v110;
      }
      if (v119 >= v107)
        v125 = 1;
      else
        v125 = v118;
      if ((v125 & 1) == 0 && v119 > a4 || (v119 > v107 ? (v126 = 1) : (v126 = v123), (v126 & 1) == 0 && v119 > a4))
        v107 = v58 + v117;
      v127 = v120 > v109 ? 1 : v118;
      if ((v127 & 1) == 0 && v119 <= a4)
        goto LABEL_221;
      v128 = v120 >= v109 ? 1 : v118;
      if ((v128 & 1) == 0 && v119 > a4)
        goto LABEL_221;
      if (v120 >= v109)
        v118 = 0;
      v129 = v118 != 1 || v119 > a4;
      if (v129 && (v120 > v109 ? (v130 = 1) : (v130 = v123), (v130 & 1) != 0 || v119 <= a4))
LABEL_220:
        v120 = v109;
      else
LABEL_221:
        v112 = v110;
      ++v110;
      v109 = v120;
      --v76;
    }
    while (v76);
  }
  if (v113 > a4)
  {
    *(_QWORD *)(v10 + 480) = v112;
    v131 = 0.0;
    if ((*(_BYTE *)(a1 + 67) & 2) != 0)
    {
      v132 = (_NSGlyphTreeBidiLevelForGlyphAtIndex(a1, v112) & 1) == 0;
      v131 = 1.0;
      v133 = 0.0;
LABEL_238:
      if (v132)
        v131 = v133;
    }
    goto LABEL_250;
  }
  if (v107 < a4)
  {
    *(_QWORD *)(v10 + 480) = v112;
    v131 = 1.0;
    if ((*(_BYTE *)(a1 + 67) & 2) == 0)
      goto LABEL_250;
    v134 = a1;
    v135 = v112;
LABEL_237:
    v132 = (_NSGlyphTreeBidiLevelForGlyphAtIndex(v134, v135) & 1) == 0;
    v131 = 0.0;
    v133 = 1.0;
    goto LABEL_238;
  }
  *(_QWORD *)(v10 + 480) = v111;
  v136 = *(_DWORD *)(a1 + 64);
  if (v113 < v107)
  {
    if ((v136 & 0x2000000) != 0 && (_NSGlyphTreeBidiLevelForGlyphAtIndex(a1, v111) & 1) != 0)
      v137 = v107 - a4;
    else
      v137 = a4 - v113;
    v131 = v137 / (v107 - v113);
    goto LABEL_250;
  }
  v131 = 1.0;
  if ((v136 & 0x2000000) != 0)
  {
    v134 = a1;
    v135 = v111;
    goto LABEL_237;
  }
LABEL_250:
  *(double *)(v10 + 488) = v131;
  if (v140)
    *v140 = v131;
  return *(_QWORD *)(v10 + 480);
}

void sub_18D677268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___nonDisplayInvalidatingTemporaryAttributeSet_block_invoke()
{
  id v0;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  return objc_msgSend(v0, "initWithObjects:", NSDataDetectionAttributeName, CFSTR("NSDominantLanguageAttributeName"), CFSTR("NSDominantScriptAttributeName"), NSOrthographyAttributeName, NSTextCheckedAttributeName, NSTextEditedAttributeName, 0);
}

uint64_t initUIGraphicsPushContext(uint64_t a1)
{
  void *v2;
  uint64_t (*v3)();

  v2 = (void *)__NSGetFrameworkReference(0, 0);
  v3 = (uint64_t (*)())dlsym(v2, "UIGraphicsPushContext");
  softLinkUIGraphicsPushContext[0] = v3;
  if (!v3)
    initUIGraphicsPushContext_cold_1();
  return ((uint64_t (*)(uint64_t))v3)(a1);
}

uint64_t initUIGraphicsPopContext()
{
  void *v0;
  uint64_t (*v1)();

  v0 = (void *)__NSGetFrameworkReference(0, 0);
  v1 = (uint64_t (*)())dlsym(v0, "UIGraphicsPopContext");
  softLinkUIGraphicsPopContext[0] = v1;
  if (!v1)
    initUIGraphicsPopContext_cold_1();
  return v1();
}

uint64_t _NSCTTextAlignmentToHorizontalAlignment(uint64_t result, uint64_t *a2, char *a3)
{
  uint64_t v3;
  char v4;

  switch((int)result)
  {
    case 0:
      if (!a2)
        goto LABEL_15;
      v3 = 2;
      goto LABEL_8;
    case 1:
      if (!a2)
        goto LABEL_15;
      v3 = 3;
      goto LABEL_8;
    case 2:
      if (!a2)
        goto LABEL_15;
      v3 = 4;
LABEL_8:
      *a2 = v3;
LABEL_15:
      if (!a3)
        return result;
      v4 = 0;
LABEL_17:
      *a3 = v4;
      return result;
    case 3:
      if (a2)
        *a2 = 0;
      if (!a3)
        return result;
      v4 = 1;
      goto LABEL_17;
    case 4:
      if (a2)
        *a2 = 0;
      goto LABEL_15;
    default:
      return result;
  }
}

id defaultBreakLanguage()
{
  if (defaultBreakLanguage_onceToken != -1)
    dispatch_once(&defaultBreakLanguage_onceToken, &__block_literal_global_14_0);
  return (id)defaultBreakLanguage_result;
}

void __defaultBreakLanguage_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", CFSTR("AppleTextBreakLocale"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)defaultBreakLanguage_result;
  defaultBreakLanguage_result = v1;

  if (defaultBreakLanguage_result)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:");
    v3 = (const __CFString *)objc_claimAutoreleasedReturnValue();
LABEL_3:
    v4 = (void *)defaultBreakLanguage_result;
    defaultBreakLanguage_result = (uint64_t)v3;

    return;
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "languageIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)defaultBreakLanguage_result;
  defaultBreakLanguage_result = v6;

  if (!defaultBreakLanguage_result)
  {
    v3 = CFSTR("en_US");
    goto LABEL_3;
  }
}

void sub_18D67BDFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D67C2DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D67C8DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18D67CA98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D67CB18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D67D708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

double getWidthOfRuns(const __CTLine *a1, unint64_t a2, uint64_t a3)
{
  CFArrayRef GlyphRuns;
  double v6;
  const __CFArray *v7;
  const __CTRun *ValueAtIndex;
  CFRange v10;

  GlyphRuns = CTLineGetGlyphRuns(a1);
  v6 = 0.0;
  if (a2 < a2 + a3)
  {
    v7 = GlyphRuns;
    do
    {
      ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(v7, a2);
      v10.length = CTRunGetGlyphCount(ValueAtIndex);
      v10.location = 0;
      v6 = v6 + CTRunGetTypographicBounds(ValueAtIndex, v10, 0, 0, 0);
      ++a2;
      --a3;
    }
    while (a3);
  }
  return v6;
}

uint64_t __NSCreateRenderingContextForString(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6, double a7, double a8)
{
  uint64_t v8;
  _QWORD v10[10];
  char v11;
  char v12;
  char v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = __Block_byref_object_copy__9;
  v20 = __Block_byref_object_dispose__9;
  v21 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ____NSCreateRenderingContextForString_block_invoke;
  v10[3] = &unk_1E26053F0;
  v10[4] = a1;
  v10[5] = a2;
  *(double *)&v10[7] = a7;
  v10[6] = &v16;
  v10[8] = a3;
  v11 = 0;
  v12 = a6;
  v13 = a4;
  v14 = a5;
  *(double *)&v10[9] = a8;
  v15 = 0;
  +[NSSingleLineTypesetter performWithSingleLineTypesetterContext:](NSSingleLineTypesetter, "performWithSingleLineTypesetterContext:", v10);
  v8 = v17[5];
  _Block_object_dispose(&v16, 8);
  return v8;
}

void sub_18D67F354(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18D67FA88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t initSwiftUITextAnimationProviderClass()
{
  void *v0;
  uint64_t (*v1)();

  v0 = (void *)__NSGetFrameworkReference(CFSTR("SwiftUI"), 0);
  v1 = (uint64_t (*)())dlsym(v0, "SwiftUITextAnimationProviderClass");
  softLinkSwiftUITextAnimationProviderClass[0] = v1;
  if (!v1)
    initSwiftUITextAnimationProviderClass_cold_1();
  return v1();
}

uint64_t rangeOfParagraphSeparatorAtIndex(unint64_t a1, UniChar *buffer, uint64_t a3)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  UniChar v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFRange v17;
  CFRange v18;

  if (a3 < a1)
  {
    v4 = a3 + 1;
    if (a3 >= -1 && v4 < a1)
    {
      v6 = *((_QWORD *)buffer + 20);
      if (v6 > v4)
      {
        v7 = *((_QWORD *)buffer + 17);
        if (v7)
        {
          v8 = *(_WORD *)(v7 + 2 * (*((_QWORD *)buffer + 19) + v4));
        }
        else
        {
          v9 = *((_QWORD *)buffer + 18);
          if (v9)
          {
            v8 = *(char *)(v9 + *((_QWORD *)buffer + 19) + v4);
          }
          else
          {
            if (*((_QWORD *)buffer + 22) <= v4 || (v10 = *((_QWORD *)buffer + 21), v10 > v4))
            {
              v11 = a3 - 3;
              if ((unint64_t)a3 < 3)
                v11 = 0;
              if (v11 + 64 < v6)
                v6 = v11 + 64;
              *((_QWORD *)buffer + 21) = v11;
              *((_QWORD *)buffer + 22) = v6;
              v12 = (const __CFString *)*((_QWORD *)buffer + 16);
              v17.location = *((_QWORD *)buffer + 19) + v11;
              v17.length = v6 - v11;
              CFStringGetCharacters(v12, v17, buffer);
              v10 = *((_QWORD *)buffer + 21);
            }
            v8 = buffer[v4 - v10];
          }
        }
        if (v8 == 10)
        {
          v13 = *((_QWORD *)buffer + 20);
          if (v13 > a3 && !*((_QWORD *)buffer + 17) && !*((_QWORD *)buffer + 18))
          {
            if (*((_QWORD *)buffer + 22) <= a3 || (v14 = *((_QWORD *)buffer + 21), v14 > a3))
            {
              v15 = a3 - 4;
              if ((unint64_t)a3 < 4)
                v15 = 0;
              if (v15 + 64 < v13)
                v13 = v15 + 64;
              *((_QWORD *)buffer + 21) = v15;
              *((_QWORD *)buffer + 22) = v13;
              v18.location = *((_QWORD *)buffer + 19) + v15;
              v18.length = v13 - v15;
              CFStringGetCharacters(*((CFStringRef *)buffer + 16), v18, buffer);
            }
          }
        }
      }
    }
  }
  return a3;
}

uint64_t __attributedStringAtKeyframe_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

uint64_t __attributedStringAtKeyframe_block_invoke_2(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t result;

  if (a3 > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", objc_msgSend(*(id *)(a1 + 40), "attributedSubstringFromRange:"));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;
  }
  v8 = (void *)objc_msgSend(*(id *)(a1 + 40), "attributedSubstringFromRange:", a3, a4);
  if (a2)
  {
    v9 = objc_msgSend(a2, "applyKeyframe:toContent:", *(_QWORD *)(a1 + 48), v8);
    if (v9)
    {
      v10 = (void *)v9;
      v11 = objc_msgSend(v8, "length");
      v8 = v10;
      if (v11 != objc_msgSend(v10, "length"))
        __attributedStringAtKeyframe_block_invoke_2_cold_1();
    }
  }
  result = objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", v8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3 + a4;
  return result;
}

void __NSCoreTypesetterTruncationTokenContextDeallocate(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 16);
  if (v2)
    CFRelease(v2);
}

void sub_18D681390(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D68143C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D68148C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D681584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18D681894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18D681D68(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_18D681EE8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_18D681F08(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x18D681EC8);
}

void sub_18D681F9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void NSTextContentStorageBreakOnEnumerateWhileEditing()
{
  if (NSTextContentStorageBreakOnEnumerateWhileEditing_onceToken != -1)
    dispatch_once(&NSTextContentStorageBreakOnEnumerateWhileEditing_onceToken, &__block_literal_global_191_2);
}

void sub_18D68267C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D68291C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __NSTextContentStorageFillAttributedStringWithElementsInIndexRange(NSUInteger a1, NSUInteger a2, NSUInteger a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];

  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3010000000;
  v15 = "";
  v16 = a5;
  v17 = a6;
  if (a5 + a6 >= (unint64_t)objc_msgSend(a4, "length"))
    v10 = a3 - 1;
  else
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(a4, "beginEditing");
  if (a3)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = ____NSTextContentStorageFillAttributedStringWithElementsInIndexRange_block_invoke;
    v11[3] = &unk_1E2605910;
    v11[4] = a4;
    v11[5] = &v12;
    v11[6] = v18;
    v11[7] = v10;
    __NSTextContentStorageEnumerateCachedElementsInElementIndexRange(a1, a2, a3, (uint64_t)v11);
  }
  else
  {
    objc_msgSend(a4, "replaceCharactersInRange:withString:", v13[4], v13[5], &stru_1E260C7D0);
  }
  objc_msgSend(a4, "endEditing");
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v18, 8);
}

void sub_18D682A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

BOOL _NSStringHasRightToLeftBaseWritingDirectionAtIndex(const __CFString *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  CFStringEncoding SystemEncoding;
  NSWritingDirection v10;

  SystemEncoding = CFStringGetSystemEncoding();
  if (CFStringGetCStringPtr(a1, SystemEncoding) || CFStringGetCStringPtr(a1, 0x600u))
    return 0;
  v10 = _NSStringImputedBaseWritingDirectionAtIndex(a1, a2, a3, a4);
  if (v10 == NSWritingDirectionNatural)
    v10 = +[NSParagraphStyle defaultWritingDirectionForLanguage:](NSParagraphStyle, "defaultWritingDirectionForLanguage:", 0);
  return v10 == NSWritingDirectionRightToLeft;
}

uint64_t _NSStringHasRightToLeftCharactersInRange(const __CFString *a1, uint64_t a2, unint64_t a3)
{
  CFStringEncoding SystemEncoding;
  const char *CStringPtr;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  const UniChar *v12;
  int64_t v13;
  UniChar v14;
  UniChar v15;
  uint64_t UnicodePropertyDataForPlane;
  uint64_t v17;
  const UniChar *v18;
  int64_t v19;
  UniChar v20;
  unint64_t v21;
  unsigned int v22;
  int64_t v23;
  int64_t v24;
  int64_t v25;
  uint64_t v26;
  _OWORD v27[8];
  CFStringRef theString;
  const UniChar *CharactersPtr;
  const char *v30;
  uint64_t v31;
  int64_t v32;
  int64_t v33;
  int64_t v34;
  CFRange v35;
  CFRange v36;

  SystemEncoding = CFStringGetSystemEncoding();
  if (!CFStringGetCStringPtr(a1, SystemEncoding) && !CFStringGetCStringPtr(a1, 0x600u))
  {
    theString = a1;
    v31 = a2;
    v32 = a3;
    CharactersPtr = CFStringGetCharactersPtr(a1);
    if (CharactersPtr)
      CStringPtr = 0;
    else
      CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
    v33 = 0;
    v34 = 0;
    v30 = CStringPtr;
    if (!_NSStringHasRightToLeftCharactersInRange_bidiPropertyBMP)
      _NSStringHasRightToLeftCharactersInRange_bidiPropertyBMP = CFUniCharGetUnicodePropertyDataForPlane();
    if (a3)
    {
      v9 = 0;
      memset(v27, 0, sizeof(v27));
      do
      {
        v10 = v9;
        if (v9 < 0 || (v11 = v32, v32 <= v9))
        {
          v14 = 0;
        }
        else
        {
          v12 = CharactersPtr;
          if (CharactersPtr)
          {
            v13 = v31 + v9;
          }
          else
          {
            if (v30)
            {
              v14 = v30[v31 + v9];
              goto LABEL_18;
            }
            if (v34 <= v9 || (v23 = v33, v33 > v9))
            {
              v24 = v9 - 4;
              if ((unint64_t)v9 < 4)
                v24 = 0;
              if (v24 + 64 < v32)
                v11 = v24 + 64;
              v33 = v24;
              v34 = v11;
              v35.location = v31 + v24;
              v35.length = v11 - v24;
              CFStringGetCharacters(theString, v35, (UniChar *)v27);
              v23 = v33;
            }
            v13 = v9 - v23;
            v12 = (const UniChar *)v27;
          }
          v14 = v12[v13];
        }
LABEL_18:
        ++v9;
        v15 = v14;
        UnicodePropertyDataForPlane = _NSStringHasRightToLeftCharactersInRange_bidiPropertyBMP;
        if (v10 < -1)
          goto LABEL_31;
        if (v9 >= a3)
          goto LABEL_31;
        if ((v14 & 0xFC00) != 0xD800)
          goto LABEL_31;
        v17 = v32;
        if (v32 <= v9)
          goto LABEL_31;
        v18 = CharactersPtr;
        if (CharactersPtr)
        {
          v19 = v31 + v9;
LABEL_24:
          v20 = v18[v19];
          goto LABEL_29;
        }
        if (!v30)
        {
          if (v34 <= v9 || (v25 = v33, v33 > v9))
          {
            v26 = v10 - 3;
            if ((unint64_t)v10 < 3)
              v26 = 0;
            if (v26 + 64 < v32)
              v17 = v26 + 64;
            v33 = v26;
            v34 = v17;
            v36.location = v31 + v26;
            v36.length = v17 - v26;
            CFStringGetCharacters(theString, v36, (UniChar *)v27);
            v25 = v33;
          }
          v19 = v9 - v25;
          v18 = (const UniChar *)v27;
          goto LABEL_24;
        }
        v20 = v30[v31 + v9];
LABEL_29:
        if (v20 >> 10 == 55)
        {
          v15 = (v15 << 10) + v20 + 9216;
          v9 = v10 + 2;
          UnicodePropertyDataForPlane = CFUniCharGetUnicodePropertyDataForPlane();
        }
LABEL_31:
        if (UnicodePropertyDataForPlane)
        {
          v21 = *(unsigned __int8 *)(UnicodePropertyDataForPlane + HIBYTE(v15));
          if (v21 >= 0x13)
            LODWORD(v21) = *(unsigned __int8 *)(UnicodePropertyDataForPlane
                                              + (((_DWORD)v21 << 8) - 4864)
                                              + v15
                                              + 256);
          v22 = v21 - 2;
          if (v22 < 0xE && ((0x3009u >> v22) & 1) != 0)
            return 1;
        }
      }
      while (v9 < a3);
    }
  }
  return 0;
}

double _NSCalculateContainerOrigin(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  double v18;
  double v19;
  double v20;
  double v21;
  double result;

  v18 = a7 + a11 * 2.0;
  if (v18 >= a3)
    return a1 + a11 - a5;
  v19 = a3 - v18;
  v20 = a9 - (a5 + a7);
  if (v19 + 0.001 >= a5 + v20)
    return a1 + a11;
  v21 = v19 * 0.5;
  if (v19 * 0.5 <= a5 && v21 <= v20)
    return a1 + a11 - a5 + v21;
  result = a1 + a11;
  if (v21 > v20)
    return result - a5 + v19 - v20;
  return result;
}

void *romanString(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t i;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v8;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = v2;
  if (a1 <= 0)
  {
    objc_msgSend(v2, "appendFormat:", CFSTR("%ld"), a1);
    return v3;
  }
  for (i = a1 % 0xFA0uLL; i; i += v5)
  {
    if (i <= 0x3E7)
    {
      if (i <= 0x383)
      {
        if (i <= 0x1F3)
        {
          if (i <= 0x18F)
          {
            if (i <= 0x63)
            {
              if (i <= 0x59)
              {
                if (i <= 0x31)
                {
                  if (i <= 0x27)
                  {
                    if (i <= 9)
                    {
                      if (i == 9)
                      {
                        v8 = CFSTR("ix");
                        goto LABEL_32;
                      }
                      if (i <= 4)
                      {
                        if (i == 4)
                        {
                          v8 = CFSTR("iv");
LABEL_32:
                          objc_msgSend(v3, "appendString:", v8);
                          return v3;
                        }
                        v5 = -1;
                        v6 = CFSTR("i");
                      }
                      else
                      {
                        v5 = -5;
                        v6 = CFSTR("v");
                      }
                    }
                    else
                    {
                      v5 = -10;
                      v6 = CFSTR("x");
                    }
                  }
                  else
                  {
                    v5 = -40;
                    v6 = CFSTR("xl");
                  }
                }
                else
                {
                  v5 = -50;
                  v6 = CFSTR("l");
                }
              }
              else
              {
                v5 = -90;
                v6 = CFSTR("xc");
              }
            }
            else
            {
              v5 = -100;
              v6 = CFSTR("c");
            }
          }
          else
          {
            v5 = -400;
            v6 = CFSTR("cd");
          }
        }
        else
        {
          v5 = -500;
          v6 = CFSTR("d");
        }
      }
      else
      {
        v5 = -900;
        v6 = CFSTR("cm");
      }
    }
    else
    {
      v5 = -1000;
      v6 = CFSTR("m");
    }
    objc_msgSend(v3, "appendString:", v6);
  }
  return v3;
}

void *cjkString(unint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  int v6;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = v2;
  if ((a1 & 0x8000000000000000) != 0)
  {
    objc_msgSend(v2, "appendFormat:", CFSTR("%ld"), a1);
    return v3;
  }
  if (!a1)
  {
    v5 = 38646;
LABEL_13:
    objc_msgSend(v3, "appendFormat:", CFSTR("%C"), v5);
    return v3;
  }
  v4 = a1 % 0x64;
  if (!(a1 % 0x64))
  {
    objc_msgSend(v2, "appendString:", CFSTR("百"));
    return v3;
  }
  if (v4 < 0x14)
  {
    if (v4 < 0xA)
      goto LABEL_11;
  }
  else
  {
    objc_msgSend(v2, "appendFormat:", CFSTR("%C"), cjk_numerals[a1 % 0x64 / 0xA]);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("%C"), 21313);
LABEL_11:
  v6 = a1 % 0x64 % 0xA;
  if (v6)
  {
    v5 = cjk_numerals[v6];
    goto LABEL_13;
  }
  return v3;
}

void *arabicIndicString(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  int v7;
  __int16 v8;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a1);
  v4 = objc_msgSend(v3, "length");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      v7 = objc_msgSend(v3, "characterAtIndex:", i);
      if ((v7 - 48) >= 0xA)
        v8 = 0;
      else
        v8 = 1584;
      objc_msgSend(v2, "appendFormat:", CFSTR("%C"), (unsigned __int16)(v8 + v7));
    }
  }
  return v2;
}

void *hebrewString(unint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t i;
  uint64_t v5;
  const __CFString *v6;
  unint64_t v7;
  const __CFString *v9;
  uint64_t v10;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = v2;
  if ((a1 & 0x8000000000000000) != 0)
  {
    objc_msgSend(v2, "appendFormat:", CFSTR("%ld"), a1);
  }
  else if (a1)
  {
    for (i = a1 % 0x3E8; i; i += v5)
    {
      if (i <= 0x18F)
      {
        if (i <= 0x12B)
        {
          if (i <= 0xC7)
          {
            if (i <= 0x63)
            {
              if (i == 15)
              {
                v9 = CFSTR("טו");
LABEL_40:
                objc_msgSend(v3, "appendFormat:", v9, v10);
                break;
              }
              if (i == 16)
              {
                v9 = CFSTR("טז");
                goto LABEL_40;
              }
              if (i <= 0x59)
              {
                if (i <= 0x4F)
                {
                  if (i <= 0x45)
                  {
                    if (i <= 0x3B)
                    {
                      if (i <= 0x31)
                      {
                        if (i <= 0x27)
                        {
                          if (i <= 0x1D)
                          {
                            if (i <= 0x13)
                            {
                              if (i <= 9)
                              {
                                objc_msgSend(v3, "appendFormat:", CFSTR("%C"), (i + 1487));
                                break;
                              }
                              v5 = -10;
                              v6 = CFSTR("י");
                            }
                            else
                            {
                              v5 = -20;
                              v6 = CFSTR("כ");
                            }
                          }
                          else
                          {
                            v5 = -30;
                            v6 = CFSTR("ל");
                          }
                        }
                        else
                        {
                          v5 = -40;
                          v6 = CFSTR("מ");
                        }
                      }
                      else
                      {
                        v5 = -50;
                        v6 = CFSTR("נ");
                      }
                    }
                    else
                    {
                      v5 = -60;
                      v6 = CFSTR("ס");
                    }
                  }
                  else
                  {
                    v5 = -70;
                    v6 = CFSTR("ע");
                  }
                }
                else
                {
                  v5 = -80;
                  v6 = CFSTR("פ");
                }
              }
              else
              {
                v5 = -90;
                v6 = CFSTR("צ");
              }
            }
            else
            {
              v5 = -100;
              v6 = CFSTR("ק");
            }
          }
          else
          {
            v5 = -200;
            v6 = CFSTR("ר");
          }
        }
        else
        {
          v5 = -300;
          v6 = CFSTR("ש");
        }
      }
      else
      {
        v5 = -400;
        v6 = CFSTR("ת");
      }
      objc_msgSend(v3, "appendString:", v6);
    }
    v7 = objc_msgSend(v3, "length");
    if (v7 >= 2)
      objc_msgSend(v3, "insertString:atIndex:", CFSTR("״"), v7 - 1);
  }
  else
  {
    objc_msgSend(v2, "appendString:", CFSTR("אפס"));
  }
  return v3;
}

double _NSGetUIFoundationVersionNumber()
{
  if (_NSGetUIFoundationVersionNumber_onceToken != -1)
    dispatch_once(&_NSGetUIFoundationVersionNumber_onceToken, &__block_literal_global_25);
  return *(double *)&_NSGetUIFoundationVersionNumber_UIFoundationVersionNumber;
}

NSUInteger __NSTextRunStorageEnumerateElementsInRange(NSUInteger result, NSUInteger a2, NSUInteger a3, int a4, uint64_t a5)
{
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  uint64_t v15;
  NSRange v16;
  NSRange v17;
  BOOL v18;
  NSUInteger length;
  NSUInteger v20;
  uint64_t v21;
  NSUInteger v22;
  NSUInteger v23;
  NSRange v24;
  NSRange v25;

  v5 = a3 - 1;
  if (a4)
    v6 = -1;
  else
    v6 = a3;
  if (a4)
    v7 = -1;
  else
    v7 = 1;
  if (!a4)
    v5 = 0;
  if (v5 != v6)
  {
    v12 = result;
    v13 = v6 + a2;
    v24.location = 0;
    v24.length = 0;
    v14 = a2 + v5;
    v23 = result;
    do
    {
      v15 = objc_msgSend(*(id *)(v12 + 24), "pointerToElement:directlyAccessibleElements:", v14, &v24);
      if (a4)
      {
        v16.location = v24.location;
        v16.length = v14 - v24.location + 1;
        v24.length = v16.length;
      }
      else
      {
        v16.length = v24.location - v14 + v24.length;
        v24.location = v14;
        v24.length = v16.length;
        v16.location = v14;
      }
      v25.location = a2;
      v25.length = a3;
      v17 = NSIntersectionRange(v16, v25);
      result = v17.location;
      v24 = v17;
      if (v15)
        v18 = v17.length == 0;
      else
        v18 = 1;
      if (!v18)
      {
        if (a4)
          length = -1;
        else
          length = v17.length;
        if (v14 == length + v17.location)
        {
          v20 = v14;
        }
        else
        {
          v21 = v15 + 16 * v14;
          v22 = v17.location - v7 + length;
          do
          {
            if (*(_QWORD *)(v21 - 16 * v24.location + 8))
              result = (*(uint64_t (**)(uint64_t))(a5 + 16))(a5);
            v20 = v14 + v7;
            v21 += 16 * v7;
            v18 = v22 == v14;
            v14 += v7;
          }
          while (!v18);
        }
        v14 = v20;
        v12 = v23;
      }
    }
    while (v14 != v13);
  }
  return result;
}

uint64_t __NSTextRunStorageGetElementIndexForTextLocation(uint64_t a1, void *a2, int a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  BOOL v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  uint64_t v29;
  void *v30;
  int v31;
  unint64_t v32;
  unint64_t v33;

  v6 = objc_msgSend(*(id *)(a1 + 24), "count");
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    if (objc_msgSend(a2, "compare:", objc_msgSend(v7, "location")) == -1)
    {
      v10 = 0;
      v6 = *(_QWORD *)(a1 + 48);
    }
    else
    {
      v8 = objc_msgSend(a2, "compare:", objc_msgSend(*(id *)(a1 + 32), "endLocation"));
      v9 = *(_QWORD *)(a1 + 48);
      if (v8 == -1)
        return v9;
      v10 = v9 + 1;
    }
  }
  else
  {
    v10 = 0;
  }
  v31 = a3;
  if ((uint64_t)v10 >= v6)
  {
LABEL_43:
    if (v31)
      return v10;
    else
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  v11 = 0;
  v12 = 0;
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  v30 = a2;
  while (1)
  {
    v14 = v6 - v10;
    if (v6 >= (uint64_t)v10)
      v15 = v6 - v10;
    else
      v15 = v14 + 1;
    v9 = v15 >> 1;
    v32 = v13;
    v33 = v11;
    v17 = v15 >> 1 >= v10;
    v16 = (v15 >> 1) - v10;
    v17 = !v17 || v16 >= v14;
    if (v17)
    {
LABEL_25:
      v32 = v13;
      v33 = v11;
      if (v10 > v9 || v16 >= v14)
        goto LABEL_43;
      v23 = -(uint64_t)v9;
      while (1)
      {
        if (!v12 || (v24 = v9 - v13, v9 < v13) || v24 >= v33)
        {
          v25 = objc_msgSend(*(id *)(a1 + 24), "pointerToElement:directlyAccessibleElements:", v9, &v32, v30);
          v13 = v32;
          v12 = v25 + 16 * (v23 + v32);
          v24 = v9 - v32;
        }
        v21 = *(void **)(v12 + 16 * v24);
        if (v21)
          break;
        if (v10 <= v9 - 1)
        {
          v26 = ~v10 + v9;
          ++v23;
          --v9;
          if (v26 < v14)
            continue;
        }
        goto LABEL_43;
      }
    }
    else
    {
      v18 = -(uint64_t)v9;
      while (1)
      {
        if (!v12 || (v19 = v9 - v13, v9 < v13) || v19 >= v33)
        {
          v20 = objc_msgSend(*(id *)(a1 + 24), "pointerToElement:directlyAccessibleElements:", v9, &v32, v30);
          v13 = v32;
          v12 = v20 + 16 * (v18 + v32);
          v19 = v9 - v32;
        }
        v21 = *(void **)(v12 + 16 * v19);
        if (v21)
          break;
        if (v10 <= ++v9)
        {
          --v18;
          if (v9 - v10 < v14)
            continue;
        }
        v11 = v33;
        v16 = v9 - v10;
        goto LABEL_25;
      }
    }
    v11 = v33;
    v27 = v30;
    if (objc_msgSend(v30, "compare:", objc_msgSend(v21, "location", v30)) == -1)
    {
      v6 = v9;
      goto LABEL_42;
    }
    if (objc_msgSend(v27, "compare:", objc_msgSend(v21, "endLocation")) == -1)
      break;
    v10 = v9;
LABEL_42:
    if ((uint64_t)v10 >= v6)
      goto LABEL_43;
  }
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 32) = v21;
  if (v31)
    v29 = v10;
  else
    v29 = 0x7FFFFFFFFFFFFFFFLL;
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    return v29;
  return v9;
}

NSUInteger __NSTextRunStorageGetElementIndexForTextRange(NSUInteger a1, void *a2, char a3)
{
  uint64_t ElementIndexForTextLocation;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  NSTextRange *v13;
  NSUInteger v14;
  NSUInteger v15;
  uint64_t v16;
  void *v17;
  NSUInteger v18;
  id *v20;
  id v21;
  NSTextRange *v22;
  int v23;
  id *v24;
  _QWORD v25[2];

  ElementIndexForTextLocation = __NSTextRunStorageGetElementIndexForTextLocation(a1, (void *)objc_msgSend(a2, "location"), 1);
  v7 = *(void **)(a1 + 24);
  if (ElementIndexForTextLocation != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = *(void **)objc_msgSend(v7, "elementAtIndex:", ElementIndexForTextLocation);
    v9 = objc_msgSend((id)objc_msgSend(a2, "location"), "compare:", objc_msgSend(v8, "location"));
    v10 = objc_msgSend((id)objc_msgSend(a2, "endLocation"), "compare:", objc_msgSend(v8, "endLocation"));
    if (v10)
      v11 = 1;
    else
      v11 = v9 == 1;
    if (!v11)
      return ElementIndexForTextLocation;
    v12 = v10;
    if (v9 == 1)
    {
      v13 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", objc_msgSend(v8, "location"), objc_msgSend(a2, "location"));
      v14 = ElementIndexForTextLocation + 1;
    }
    else
    {
      if (!v10)
      {
        if ((a3 & 1) == 0)
          return ElementIndexForTextLocation;
        v18 = 1;
        v14 = ElementIndexForTextLocation;
        v15 = ElementIndexForTextLocation;
LABEL_34:
        __NSTextRunStorageReleaseElementContentsInRange(a1, v15, v18);
        objc_msgSend(*(id *)(a1 + 24), "removeElementsInRange:", v15, v18);
        return v14;
      }
      if (v10 == -1)
      {
        if (objc_msgSend((id)objc_msgSend(a2, "endLocation"), "compare:", objc_msgSend(v8, "location")) != 1)
          goto LABEL_3;
        v13 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", objc_msgSend(a2, "endLocation"), objc_msgSend(v8, "location"));
        v18 = 0;
        v15 = 0x7FFFFFFFFFFFFFFFLL;
        v23 = 1;
        v14 = ElementIndexForTextLocation;
        if (v13)
          goto LABEL_37;
        goto LABEL_32;
      }
      v13 = 0;
      v14 = ElementIndexForTextLocation;
    }
    v15 = 0x7FFFFFFFFFFFFFFFLL;
    if (v12 == 1)
    {
      v16 = __NSTextRunStorageGetElementIndexForTextLocation(a1, (void *)objc_msgSend(a2, "endLocation"), 1);
      v17 = *(void **)(a1 + 24);
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v16 = objc_msgSend(v17, "count");
      }
      else
      {
        v20 = (id *)objc_msgSend(v17, "elementAtIndex:", v16);
        v21 = *v20;
        if (objc_msgSend((id)objc_msgSend(a2, "endLocation"), "compare:", objc_msgSend(*v20, "location")) == 1)
        {
          if (objc_msgSend((id)objc_msgSend(a2, "endLocation"), "compare:", objc_msgSend(v21, "endLocation")))
          {
            v22 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", objc_msgSend(a2, "endLocation"), objc_msgSend(v21, "endLocation"));

            *v20 = v22;
          }
          else
          {
            ++v16;
          }
        }
      }
      v18 = v16 - v14;
      if ((uint64_t)(v16 - v14) >= 1)
      {
        if ((a3 & 1) != 0)
        {
          v23 = 0;
          v15 = v14;
          if (!v13)
            goto LABEL_32;
LABEL_37:
          v24 = (id *)objc_msgSend(*(id *)(a1 + 24), "elementAtIndex:", ElementIndexForTextLocation);

          *v24 = v13;
          if ((v23 & 1) == 0)
          {
LABEL_33:
            if (!v18)
              return v14;
            goto LABEL_34;
          }
LABEL_38:
          ElementIndexForTextLocation = v14;
          goto LABEL_3;
        }
        __NSTextRunStorageReleaseElementContentsInRange(a1, v14, v16 - v14);
        if (v18 >= 2)
          objc_msgSend(*(id *)(a1 + 24), "removeElementsInRange:", v14 + 1, v16 - v14 - 1);
        v23 = 0;
        v18 = 0;
        v15 = 0x7FFFFFFFFFFFFFFFLL;
        if (v13)
          goto LABEL_37;
LABEL_32:
        if (!v23)
          goto LABEL_33;
        goto LABEL_38;
      }
      v18 = 0;
      v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v18 = 0;
    }
    v23 = 1;
    if (v13)
      goto LABEL_37;
    goto LABEL_32;
  }
  ElementIndexForTextLocation = objc_msgSend(v7, "count");
LABEL_3:
  v25[0] = 0;
  v25[1] = 0;
  objc_msgSend(*(id *)(a1 + 24), "insertElements:count:atIndex:", v25, 1, ElementIndexForTextLocation);
  return ElementIndexForTextLocation;
}

uint64_t _moveLinesInLayoutManager(void *a1, uint64_t a2, uint64_t a3, int a4, double a5)
{
  uint64_t result;
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
  uint64_t v23;
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
  double v35;
  uint64_t v36;
  uint64_t v37;

  v36 = 0;
  v37 = 0;
  result = objc_msgSend(a1, "isValidGlyphIndex:", a2);
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "lineFragmentRectForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:", a2, &v36, 1);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(a1, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:", a2, 0, 1);
    result = objc_msgSend(a1, "setLineFragmentRect:forGlyphRange:usedRect:", v36, v37, v12, v14 + a5, v16, v18, v20, v19 + a5, v21, v22);
  }
  if (a4)
  {
    v23 = a2 + a3;
    result = objc_msgSend(a1, "isValidGlyphIndex:", v23);
    if ((_DWORD)result)
    {
      objc_msgSend(a1, "lineFragmentRectForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:", v23, &v36, 1);
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v31 = v30;
      objc_msgSend(a1, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:", v23, 0, 1);
      return objc_msgSend(a1, "setLineFragmentRect:forGlyphRange:usedRect:", v36, v37, v25, v27 - a5, v29, v31, v33, v32 - a5, v34, v35);
    }
  }
  return result;
}

uint64_t _colorValForColor(void *a1)
{
  CGColor *v1;
  CGColor *v2;
  CGColorSpace *ColorSpace;
  const __CFString *v4;
  CFStringRef Name;
  CGColorSpace *v6;
  CGColorRef CopyByMatchingToColorSpace;
  CGColorRef v8;
  float64x2_t *Components;
  unint64_t v10;
  int32x2_t v16;
  uint64x2_t v17;
  int64x2_t v18;
  unint64_t v19;

  v1 = (CGColor *)objc_msgSend(a1, "CGColor");
  if (!v1)
    return 0x7FFFFFFFFFFFFFFFLL;
  v2 = v1;
  ColorSpace = CGColorGetColorSpace(v1);
  CFRetain(v2);
  v4 = (const __CFString *)*MEMORY[0x1E0C9D988];
  Name = CGColorSpaceGetName(ColorSpace);
  if (!CFEqual(v4, Name))
  {
    v6 = CGColorSpaceCreateWithName(v4);
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v6, kCGRenderingIntentDefault, v2, 0);
    if (CopyByMatchingToColorSpace)
    {
      v8 = CopyByMatchingToColorSpace;
      CFRelease(v2);
      v2 = v8;
    }
    CFRelease(v6);
  }
  if (CGColorGetNumberOfComponents(v2) >= 3 && (Components = (float64x2_t *)CGColorGetComponents(v2)) != 0)
  {
    v10 = (unint64_t)&qword_18D6CC000;
    LODWORD(v10) = vcvtmd_s64_f64(Components[1].f64[0] * 255.0 + 0.5);
    __asm { FMOV            V2.2D, #0.5 }
    v16 = vmovn_s64(vcvtq_s64_f64(vrndmq_f64(vmlaq_f64(_Q2, (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL), *Components))));
    v17.i64[0] = v16.u32[0];
    v17.i64[1] = v16.u32[1];
    v18 = (int64x2_t)vshlq_u64(v17, (uint64x2_t)xmmword_18D6CC170);
    v19 = vorrq_s8((int8x16_t)vdupq_laneq_s64(v18, 1), (int8x16_t)v18).u64[0] | v10;
  }
  else
  {
    v19 = 0x7FFFFFFFFFFFFFFFLL;
  }
  CFRelease(v2);
  return v19;
}

void sub_18D68EDAC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D68EEB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D68F16C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D68F3C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D68FC9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 208), 8);
  _Block_object_dispose((const void *)(v26 - 176), 8);
  _Block_object_dispose((const void *)(v26 - 144), 8);
  _Block_object_dispose((const void *)(v26 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18D690014(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D690068(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t UINumberWithNibArchiveIndex(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
}

__n128 UIRetainedIdentityKeyDictionaryCallbacks@<Q0>(uint64_t a1@<X8>)
{
  __n128 result;
  uint64_t v2;

  *(_QWORD *)a1 = 0;
  result = *(__n128 *)(MEMORY[0x1E0C9B390] + 8);
  *(__n128 *)(a1 + 8) = result;
  v2 = MEMORY[0x1E0C98350];
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 24) = v2;
  return result;
}

__n128 UIRetainedIdentityValueDictionaryCallbacks@<Q0>(uint64_t a1@<X8>)
{
  __n128 result;

  *(_QWORD *)a1 = 0;
  result = *(__n128 *)(MEMORY[0x1E0C9B3A0] + 8);
  *(__n128 *)(a1 + 8) = result;
  *(_QWORD *)(a1 + 24) = MEMORY[0x1E0C98350];
  *(_QWORD *)(a1 + 32) = 0;
  return result;
}

__n128 UIRetainedIdentitySetCallbacks@<Q0>(uint64_t a1@<X8>)
{
  __n128 result;
  uint64_t v2;

  *(_QWORD *)a1 = 0;
  result = *(__n128 *)(MEMORY[0x1E0C9B3B0] + 8);
  *(__n128 *)(a1 + 8) = result;
  v2 = MEMORY[0x1E0C98350];
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 24) = v2;
  return result;
}

__n128 UIRetainedIdentityArrayCallbacks@<Q0>(uint64_t a1@<X8>)
{
  __n128 result;

  *(_QWORD *)a1 = 0;
  result = *(__n128 *)(MEMORY[0x1E0C9B378] + 8);
  *(__n128 *)(a1 + 8) = result;
  *(_QWORD *)(a1 + 24) = MEMORY[0x1E0C98350];
  *(_QWORD *)(a1 + 32) = 0;
  return result;
}

__n128 UIRetainedValueUniquingSetCallbacks@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __n128 result;
  uint64_t (*v3)(_QWORD);

  v1 = MEMORY[0x1E0C9B3B0];
  *(_QWORD *)a1 = 0;
  result = *(__n128 *)(v1 + 8);
  v3 = MEMORY[0x1E0C98350];
  *(__n128 *)(a1 + 8) = result;
  *(_QWORD *)(a1 + 24) = v3;
  *(_QWORD *)(a1 + 32) = UICFStrictBoolNumberEqual;
  *(_QWORD *)(a1 + 40) = MEMORY[0x1E0C98758];
  return result;
}

uint64_t UICFStrictBoolNumberEqual(const void *a1, const void *a2)
{
  if ((const void *)*MEMORY[0x1E0C9AE50] == a1 || *MEMORY[0x1E0C9AE50] == (_QWORD)a2)
    return a1 == a2;
  if ((const void *)*MEMORY[0x1E0C9AE40] == a1 || *MEMORY[0x1E0C9AE40] == (_QWORD)a2)
    return a1 == a2;
  else
    return CFEqual(a1, a2);
}

void *UIAppendBytesForValueToData(void *result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  switch(*(_BYTE *)(a2 + 20))
  {
    case 0:
      LOBYTE(v3) = *(_QWORD *)(a2 + 24);
      v2 = 1;
      goto LABEL_8;
    case 1:
      LOWORD(v3) = *(_QWORD *)(a2 + 24);
      v2 = 2;
      goto LABEL_8;
    case 2:
    case 0xA:
      LODWORD(v3) = *(_QWORD *)(a2 + 24);
      goto LABEL_7;
    case 3:
    case 7:
      v3 = *(_QWORD *)(a2 + 24);
      v2 = 8;
      goto LABEL_8;
    case 6:
      LODWORD(v3) = *(_DWORD *)(a2 + 24);
LABEL_7:
      v2 = 4;
LABEL_8:
      result = (void *)objc_msgSend(result, "appendBytes:length:", &v3, v2);
      break;
    case 8:
      result = (void *)objc_msgSend(result, "appendBytes:length:", *(_QWORD *)(a2 + 24), *(_QWORD *)(a2 + 32));
      break;
    default:
      return result;
  }
  return result;
}

__CFArray *UICreateOrderedAndStrippedCoderValues(const __CFArray *a1, uint64_t a2)
{
  uint64_t Count;
  CFIndex v5;
  __CFDictionary *Mutable;
  CFIndex i;
  const void *ValueAtIndex;
  __CFArray *MutableCopy;
  void *v10;
  CFIndex v11;
  const void *v12;
  CFRange v14;

  Count = CFArrayGetCount(a1);
  if (Count >= 2)
  {
    v5 = Count;
    Mutable = CFDictionaryCreateMutable(0, Count, 0, MEMORY[0x1E0C9B3A0]);
    for (i = 0; i != v5; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
      CFDictionarySetValue(Mutable, ValueAtIndex, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i));
    }
    MutableCopy = CFArrayCreateMutableCopy(0, v5, a1);
    v14.location = 0;
    v14.length = v5;
    CFArraySortValues(MutableCopy, v14, (CFComparatorFunction)UIOrderNibCoderValues, Mutable);
    CFRelease(Mutable);
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = 0;
    while (1)
    {
      v12 = CFArrayGetValueAtIndex(MutableCopy, v11);
      if (*((_DWORD *)v12 + 4) != -1)
        objc_msgSend(v10, "removeAllObjects");
      if ((objc_msgSend(*((id *)v12 + 1), "isEqual:", a2) & 1) != 0)
        goto LABEL_11;
      if (!objc_msgSend(v10, "objectForKey:", *((_QWORD *)v12 + 1)))
        break;
      --v5;
      CFArrayRemoveValueAtIndex(MutableCopy, v11);
LABEL_12:
      if (v11 >= v5)
        return MutableCopy;
    }
    objc_msgSend(v10, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11), *((_QWORD *)v12 + 1));
LABEL_11:
    ++v11;
    goto LABEL_12;
  }
  return (__CFArray *)CFRetain(a1);
}

uint64_t UIOrderNibCoderValues(_DWORD *key, _DWORD *a2, CFDictionaryRef theDict)
{
  unsigned int v5;
  unsigned int v6;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = key[4];
  v6 = a2[4];
  if (v5 < v6)
    result = -1;
  else
    result = 1;
  if (v5 == v6)
  {
    v9 = objc_msgSend((id)CFDictionaryGetValue(theDict, key), "integerValue");
    v10 = objc_msgSend((id)CFDictionaryGetValue(theDict, a2), "integerValue");
    if (v9 < v10)
      v11 = -1;
    else
      v11 = 1;
    if (v9 == v10)
      return 0;
    else
      return v11;
  }
  return result;
}

void UIWriteArchiveToData(void *a1, int a2, void *a3, void *a4, const __CFArray *a5, uint64_t a6)
{
  void *v7;
  CFIndex Count;
  CFIndex v9;
  CFIndex i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  const char *v18;
  unsigned int v19;
  __CFArray *v20;
  void *v21;
  uint64_t v22;
  CFIndex v23;
  CFIndex v24;
  uint64_t v25;
  uint64_t v26;
  CFIndex k;
  unsigned int *ValueAtIndex;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t m;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t n;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t ii;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t jj;
  void *v57;
  void *v58;
  const char *v59;
  unsigned int v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t kk;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t mm;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  BOOL v76;
  unsigned int v77;
  unsigned int v78;
  unsigned int v79;
  int v80;
  int v81;
  int v82;
  void *v86;
  const __CFArray *theArray;
  void *v88;
  void *v89;
  const __CFArray *v90;
  id v91;
  id obj;
  uint64_t v94;
  void *v95;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  int v121;
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  Count = CFArrayGetCount(a5);
  if (Count >= 1)
  {
    v9 = Count;
    for (i = 0; i != v9; ++i)
      objc_msgSend(v7, "addObject:", *((_QWORD *)CFArrayGetValueAtIndex(a5, i) + 1));
  }
  v90 = a5;
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v95 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  obj = v7;
  v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v117, v127, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v118;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v118 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * j);
        v18 = (const char *)objc_msgSend(v17, "UTF8String");
        v19 = strlen(v18);
        UIAppendVInt32ToData(v95, v19);
        objc_msgSend(v95, "appendBytes:length:", v18, v19);
        objc_msgSend(v11, "setObject:forKey:", UINumberWithNibArchiveIndex(v14 + j), v17);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v127, 16);
      v14 = (v14 + j);
    }
    while (v13);
  }
  v20 = UICreateOrderedAndStrippedCoderValues(v90, a6);
  v86 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v21 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v89 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v22 = UINumberWithNibArchiveIndex(0);
  v88 = v21;
  objc_msgSend(v21, "setObject:forKey:", v22, UINumberWithNibArchiveIndex(0));
  theArray = v20;
  v23 = CFArrayGetCount(v20);
  if (v23 < 1)
  {
    v25 = 0;
    v26 = 0;
LABEL_22:
    v35 = UINumberWithNibArchiveIndex(v26);
    objc_msgSend(v89, "setObject:forKey:", v35, UINumberWithNibArchiveIndex(v25));
    goto LABEL_23;
  }
  v24 = v23;
  v25 = 0;
  v26 = 0;
  for (k = 0; k != v24; ++k)
  {
    ValueAtIndex = (unsigned int *)CFArrayGetValueAtIndex(v20, k);
    v29 = ValueAtIndex[4];
    if (v29 < v25)
      UIWriteArchiveToData_cold_1();
    v30 = (uint64_t)ValueAtIndex;
    if ((_DWORD)v29 != (_DWORD)v25)
    {
      v31 = UINumberWithNibArchiveIndex(k);
      objc_msgSend(v88, "setObject:forKey:", v31, UINumberWithNibArchiveIndex(v29));
      v32 = UINumberWithNibArchiveIndex(v26);
      objc_msgSend(v89, "setObject:forKey:", v32, UINumberWithNibArchiveIndex(v25));
      LODWORD(v26) = 0;
      v25 = v29;
    }
    v33 = UINibArchiveIndexFromNumber(objc_msgSend(v11, "objectForKey:", *(_QWORD *)(v30 + 8)));
    v34 = UIFixedByteLengthForType(*(char *)(v30 + 20));
    UIAppendVInt32ToData(v86, v33);
    LOBYTE(v121) = *(_BYTE *)(v30 + 20);
    objc_msgSend(v86, "appendBytes:length:", &v121, 1);
    if (v34 == -1)
      UIAppendVInt32ToData(v86, objc_msgSend((id)v30, "byteLength"));
    UIAppendBytesForValueToData(v86, v30);
    v26 = (v26 + 1);
  }
  if ((_DWORD)v25 != -1)
    goto LABEL_22;
LABEL_23:
  v36 = (void *)objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v37 = (void *)objc_msgSend((id)objc_msgSend(a3, "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global_32);
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v113, v126, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v114;
    do
    {
      for (m = 0; m != v39; ++m)
      {
        if (*(_QWORD *)v114 != v40)
          objc_enumerationMutation(v37);
        objc_msgSend(v36, "addObject:", objc_msgSend(a3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * m)));
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v113, v126, 16);
    }
    while (v39);
  }
  v42 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v43 = (void *)objc_msgSend((id)objc_msgSend(a4, "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global_9_0);
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v109, v125, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v110;
    do
    {
      for (n = 0; n != v45; ++n)
      {
        if (*(_QWORD *)v110 != v46)
          objc_enumerationMutation(v43);
        objc_msgSend(v36, "addObjectsFromArray:", objc_msgSend(a4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * n)));
      }
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v109, v125, 16);
    }
    while (v45);
  }
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v48 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v105, v124, 16);
  if (v48)
  {
    v49 = v48;
    v50 = 0;
    v51 = *(_QWORD *)v106;
    do
    {
      for (ii = 0; ii != v49; ++ii)
      {
        if (*(_QWORD *)v106 != v51)
          objc_enumerationMutation(v36);
        objc_msgSend(v42, "setObject:forKey:", UINumberWithNibArchiveIndex(v50 + ii), *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * ii));
      }
      v49 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v105, v124, 16);
      v50 = (v50 + ii);
    }
    while (v49);
  }
  v53 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v91 = v36;
  v54 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v101, v123, 16);
  if (v54)
  {
    v55 = v54;
    v94 = *(_QWORD *)v102;
    do
    {
      for (jj = 0; jj != v55; ++jj)
      {
        if (*(_QWORD *)v102 != v94)
          objc_enumerationMutation(v91);
        v57 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * jj);
        v58 = (void *)objc_msgSend(a4, "objectForKey:", v57);
        v59 = (const char *)objc_msgSend(v57, "UTF8String");
        v60 = strlen(v59);
        v61 = objc_msgSend(v58, "count");
        UIAppendVInt32ToData(v53, v60 + 1);
        UIAppendVInt32ToData(v53, v61);
        v99 = 0u;
        v100 = 0u;
        v97 = 0u;
        v98 = 0u;
        v62 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v97, v122, 16);
        if (v62)
        {
          v63 = v62;
          v64 = *(_QWORD *)v98;
          do
          {
            for (kk = 0; kk != v63; ++kk)
            {
              if (*(_QWORD *)v98 != v64)
                objc_enumerationMutation(v58);
              v121 = UINibArchiveIndexFromNumber(objc_msgSend(v42, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v97 + 1)
                                                                                              + 8 * kk)));
              objc_msgSend(v53, "appendBytes:length:", &v121, 4);
            }
            v63 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v97, v122, 16);
          }
          while (v63);
        }
        objc_msgSend(v53, "appendBytes:length:", v59, v60);
        LOBYTE(v121) = 0;
        objc_msgSend(v53, "appendBytes:length:", &v121, 1);
      }
      v55 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v101, v123, 16);
    }
    while (v55);
  }
  v66 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v67 = objc_msgSend(a3, "count");
  if (v67 >= 1)
  {
    v68 = v67;
    for (mm = 0; mm != v68; ++mm)
    {
      v70 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", mm);
      v71 = objc_msgSend(a3, "objectForKey:", v70);
      if (!v71)
        UIWriteArchiveToData_cold_2();
      v72 = objc_msgSend(v42, "objectForKey:", v71);
      v73 = objc_msgSend(v88, "objectForKey:", v70);
      v74 = objc_msgSend(v89, "objectForKey:", v70);
      if (!v72 || ((v75 = v74, v73) ? (v76 = v74 == 0) : (v76 = 0), v76))
        UIWriteArchiveToData_cold_3();
      v77 = UINibArchiveIndexFromNumber(v72);
      UIAppendVInt32ToData(v66, v77);
      if (v73)
        v78 = UINibArchiveIndexFromNumber(v73);
      else
        v78 = 0;
      UIAppendVInt32ToData(v66, v78);
      if (v75)
        v79 = UINibArchiveIndexFromNumber(v75);
      else
        v79 = 0;
      UIAppendVInt32ToData(v66, v79);
    }
  }
  objc_msgSend(a1, "appendBytes:length:", &UIArchiveHeaderIdentifier, 10);
  v121 = a2;
  objc_msgSend(a1, "appendBytes:length:", &v121, 4);
  v121 = 10;
  objc_msgSend(a1, "appendBytes:length:", &v121, 4);
  v121 = objc_msgSend(a3, "count");
  objc_msgSend(a1, "appendBytes:length:", &v121, 4);
  v121 = 50;
  objc_msgSend(a1, "appendBytes:length:", &v121, 4);
  v121 = objc_msgSend(obj, "count");
  objc_msgSend(a1, "appendBytes:length:", &v121, 4);
  v121 = objc_msgSend(v66, "length") + 50;
  objc_msgSend(a1, "appendBytes:length:", &v121, 4);
  v121 = CFArrayGetCount(theArray);
  objc_msgSend(a1, "appendBytes:length:", &v121, 4);
  v80 = objc_msgSend(v66, "length");
  v121 = v80 + objc_msgSend(v95, "length") + 50;
  objc_msgSend(a1, "appendBytes:length:", &v121, 4);
  v121 = objc_msgSend(v91, "count");
  objc_msgSend(a1, "appendBytes:length:", &v121, 4);
  v81 = objc_msgSend(v66, "length");
  v82 = v81 + objc_msgSend(v95, "length");
  v121 = v82 + objc_msgSend(v86, "length") + 50;
  objc_msgSend(a1, "appendBytes:length:", &v121, 4);
  objc_msgSend(a1, "appendData:", v66);
  objc_msgSend(a1, "appendData:", v95);
  objc_msgSend(a1, "appendData:", v86);
  objc_msgSend(a1, "appendData:", v53);
  CFRelease(theArray);
}

void sub_18D693934(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D693FC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class initNSImage()
{
  Class result;

  __NSGetFrameworkReference(0, 0);
  result = objc_getClass("NSImage");
  classNSImage = (uint64_t)result;
  if (!result)
    initNSImage_cold_1();
  getNSImageClass = (uint64_t)NSImageFunction;
  return result;
}

uint64_t NSImageFunction()
{
  return classNSImage;
}

uint64_t initUIImagePNGRepresentation(uint64_t a1)
{
  void *v2;
  uint64_t (*v3)();

  v2 = (void *)__NSGetFrameworkReference(0, 0);
  v3 = (uint64_t (*)())dlsym(v2, "UIImagePNGRepresentation");
  softLinkUIImagePNGRepresentation = v3;
  if (!v3)
    initUIImagePNGRepresentation_cold_1();
  return ((uint64_t (*)(uint64_t))v3)(a1);
}

Class initNSTextAttachmentView()
{
  Class result;

  __NSGetFrameworkReference(0, 0);
  result = objc_getClass("NSTextAttachmentView");
  classNSTextAttachmentView = (uint64_t)result;
  if (!result)
    initNSTextAttachmentView_cold_1();
  getNSTextAttachmentViewClass = (uint64_t)NSTextAttachmentViewFunction;
  return result;
}

uint64_t NSTextAttachmentViewFunction()
{
  return classNSTextAttachmentView;
}

Class initUITextAttachmentView()
{
  Class result;

  __NSGetFrameworkReference(0, 0);
  result = objc_getClass("UITextAttachmentView");
  classUITextAttachmentView = (uint64_t)result;
  if (!result)
    initUITextAttachmentView_cold_1();
  getUITextAttachmentViewClass[0] = UITextAttachmentViewFunction;
  return result;
}

uint64_t UITextAttachmentViewFunction()
{
  return classUITextAttachmentView;
}

uint64_t init_UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection(uint64_t a1)
{
  void *v2;
  uint64_t (*v3)();

  v2 = (void *)__NSGetFrameworkReference(0, 0);
  v3 = (uint64_t (*)())dlsym(v2, "_UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection");
  softLink_UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection[0] = v3;
  if (!v3)
    init_UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection_cold_1();
  return ((uint64_t (*)(uint64_t))v3)(a1);
}

void _CFDictionaryApplyBlock(const __CFDictionary *a1, void *a2)
{
  id context;

  context = a2;
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)keyValueBlockApplier, &context);

}

uint64_t keyValueBlockApplier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))();
}

void _CFArrayApplyBlock(const __CFArray *a1, CFIndex a2, CFIndex a3, void *a4)
{
  id context;
  CFRange v8;

  context = a4;
  v8.location = a2;
  v8.length = a3;
  CFArrayApplyFunction(a1, v8, (CFArrayApplierFunction)valueBlockApplier, &context);

}

uint64_t valueBlockApplier(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)a2 + 16))();
}

void _CFSetApplyBlock(const __CFSet *a1, void *a2)
{
  id context;

  context = a2;
  CFSetApplyFunction(a1, (CFSetApplierFunction)valueBlockApplier, &context);

}

void _CFArraySortValuesWithBlock(__CFArray *a1, CFIndex a2, CFIndex a3, void *a4)
{
  id context;
  CFRange v8;

  context = a4;
  v8.location = a2;
  v8.length = a3;
  CFArraySortValues(a1, v8, (CFComparatorFunction)compareBlockApplier, &context);

}

uint64_t compareBlockApplier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))();
}

uint64_t _rtfWhiteColor()
{
  if (onceToken != -1)
    dispatch_once(&onceToken, &__block_literal_global_34);
  return _white;
}

id initRTFColors()
{
  id result;

  _white = (uint64_t)(id)objc_msgSend((Class)getNSColorClass_3[0](), "colorWithCalibratedWhite:alpha:", 1.0, 1.0);
  result = (id)objc_msgSend((Class)getNSColorClass_3[0](), "colorWithCalibratedWhite:alpha:", 0.0, 1.0);
  _black = (uint64_t)result;
  return result;
}

uint64_t _rtfBlackColor()
{
  if (onceToken != -1)
    dispatch_once(&onceToken, &__block_literal_global_1_0);
  return _black;
}

uint64_t rtfDataFromFileWrapper(void *a1)
{
  void *v1;
  void *v2;

  v1 = (void *)objc_msgSend(a1, "fileWrappers");
  v2 = (void *)objc_msgSend(v1, "objectForKey:", CFSTR("TXT.rtf"));
  if (!v2)
    v2 = (void *)objc_msgSend(v1, "objectForKey:", CFSTR("index.rtf"));
  if (objc_msgSend(v2, "isRegularFile"))
    return objc_msgSend(v2, "regularFileContents");
  else
    return 0;
}

uint64_t cachedRTFFontHash(uint64_t a1, uint64_t a2)
{
  return ((*(unsigned __int8 *)(a2 + 16) + 13 * (*(unsigned __int8 *)(a2 + 17) + 13 * (uint64_t)*(double *)(a2 + 8))) ^ *(__int16 *)(a2 + 18))
       + *(_QWORD *)a2;
}

BOOL cachedRTFFontIsEqual(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(_QWORD *)a2 == *(_QWORD *)a3
      && *(unsigned __int8 *)(a2 + 16) == *(unsigned __int8 *)(a3 + 16)
      && *(unsigned __int8 *)(a2 + 17) == *(unsigned __int8 *)(a3 + 17)
      && *(double *)(a2 + 8) == *(double *)(a3 + 8)
      && *(unsigned __int16 *)(a2 + 18) == *(unsigned __int16 *)(a3 + 18);
}

void cachedRTFFontFree(uint64_t a1, void *a2)
{
  NSZone *v3;

  v3 = (NSZone *)MEMORY[0x18D7913AC](a2);
  NSZoneFree(v3, a2);
}

uint64_t raiseRTFException(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", NSRTFException, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1), 0), "raise");
}

uint64_t unknownClass(uint64_t result)
{
  uint64_t v1;

  if (*(_DWORD *)(result + 2800) == 2)
  {
    v1 = result + 536;
    _NSRTFSkipGroup((_DWORD *)(result + 536));
    return _NSRTFRouteToken(v1);
  }
  return result;
}

void textClass(uint64_t a1)
{
  char v2;
  uint64_t v3;

  if (*(_BYTE *)(a1 + 2808))
    flushCharacters(a1, 1);
  v2 = *(_DWORD *)(a1 + 2768);
  v3 = *(_QWORD *)(a1 + 328);
  *(_QWORD *)(a1 + 328) = v3 + 1;
  *(_BYTE *)(a1 + v3 + 72) = v2;
  if (*(_QWORD *)(a1 + 328) >= 0x80uLL)
    flushCharacters(a1, 0);
}

void controlClass(uint64_t a1)
{
  double v2;
  int v3;
  unint64_t v4;
  int v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  int v24;
  unint64_t v25;
  int v26;
  int v27;
  uint64_t *v28;
  BOOL v29;
  unint64_t v30;
  uint64_t v31;
  CFStringEncoding v32;
  CFStringRef v33;
  void *v34;
  void *v35;
  int v37;
  double v38;
  unsigned int v39;
  int v41;
  int v42;
  __int16 v43;
  char v44;
  _DWORD *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  double v53;
  void *v54;
  int v55;
  void *v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  int v61;
  double v62;
  double v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  NSAttributedStringDocumentAttributeKey *v68;
  CFStringEncoding v69;
  CFStringEncoding SystemEncoding;
  uint64_t v71;
  int v72;
  int v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSShadow *v78;
  void *v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  int v84;
  int v85;
  uint64_t v86;
  int v87;
  double v88;
  double v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  _DWORD *v94;
  uint64_t v95;
  uint64_t v96;
  CFIndex v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t Date;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  int v108;
  int v109;
  int v110;
  int v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  int v116;
  uint64_t v117;
  id v118;
  int v119;
  UInt8 *v120;
  int v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  const __CFString *v127;
  uint64_t v128;
  unint64_t v129;
  uint64_t v130;
  const __CFString *v131;
  int v132;
  uint64_t v133;
  const __CFString **v134;
  int v135;
  void *v136;
  void *v137;
  uint64_t v138;
  void *v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  int v146;
  double v147;
  int v148;
  void *v149;
  void *v150;
  unsigned int v151;
  double v152;
  void *v153;
  double v154;
  double v155;
  void *v156;
  uint64_t v157;
  void *v158;
  _DWORD *v159;
  NSTextTab *v160;
  unsigned int *v161;
  unsigned int v162;
  uint64_t v163;
  _DWORD *v164;
  uint64_t v165;
  void *v166;
  void *v167;
  void *v168;
  uint64_t v169;
  void *v170;
  unint64_t v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  unint64_t v178;
  void *v179;
  void *v180;
  NSTextTab *v181;
  double v182;
  void *v183;
  double v184;
  NSShadow *v185;
  int v186;
  double v187;
  NSShadow *v188;
  double v189;
  uint64_t v190;
  CFStringRef v191;
  void *v192;
  int v193;
  int v194;
  int v195;
  uint64_t v196;
  uint64_t v197;
  unint64_t v198;
  int v199;
  _BOOL4 v200;
  int v201;
  char v202;
  uint64_t v203;
  uint64_t v204;
  int v205;
  int v206;
  int v207;
  char v209;
  const __CFString *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  int v215;
  int v216;
  int v217;
  NSTextList *v218;
  NSTextList *v219;
  unint64_t v220;
  void *v221;
  void *v222;
  __CFString **v223;
  __CFString **v224;
  int v225;
  _BOOL4 v226;
  unsigned int *v227;
  unsigned int v228;
  int v229;
  int v230;
  int v231;
  int v232;
  BOOL v233;
  double v234;
  double v235;
  int v236;
  double v237;
  _BOOL4 v238;
  int v239;
  int v240;
  int v241;
  int v242;
  void *v243;
  __CFString *v244;
  int v245;
  int v246;
  int v247;
  void *TypographyFeatures;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *FontPaletteColors;
  void *v254;
  void *v255;
  UIFont *v256;
  uint64_t v257;
  NSArray *v258;
  uint64_t v259;
  NSArray *v260;
  void *v261;
  uint64_t v262;
  uint64_t v263;
  int v264;
  uint64_t v265;
  double v266;
  double v267;
  int v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  void *v274;
  uint64_t v275;
  void *v276;
  void *v277;
  int v278;
  double v279;
  const __CFString *v280;
  void *v281;
  uint64_t v282;
  void *v283;
  uint64_t v284;
  __CFString **v285;
  double v286;
  unint64_t v287;
  CFIndex v288;
  uint64_t v289;
  NSGlyphInfo *v290;
  uint64_t v291;
  NSGlyphInfo *v292;
  void *v293;
  unint64_t v294;
  unint64_t v295;
  uint64_t v296;
  uint64_t v297;
  void *v298;
  UIFont *v299;
  uint64_t v300;
  id v301;
  CFStringRef v302;
  NSTextTab *v303;
  uint64_t v304;
  uint64_t *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t *v309;
  uint64_t v310;
  uint64_t v311;
  double v312;
  double *v313;
  uint64_t v314;
  UInt8 *v315;
  char *__endptr[2];
  uint64_t (*v317)(char **);
  void *v318;
  uint64_t *v319;
  double *v320;
  uint64_t *v321;
  UInt8 bytes[8];
  __int16 v323;
  uint64_t v324;

  v324 = *MEMORY[0x1E0C80C00];
  flushCharacters(a1, 1);
  switch(*(_DWORD *)(a1 + 2768))
  {
    case 0:
      *(_DWORD *)(a1 + 336) = *(_DWORD *)(a1 + 2776) != 0;
      return;
    case 2:
      v3 = *(_DWORD *)(a1 + 2772);
      if (v3 == 4)
      {
        v69 = CFStringConvertWindowsCodepageToEncoding(*(_DWORD *)(a1 + 2776));
        *(_DWORD *)(a1 + 368) = v69;
        *(_DWORD *)(a1 + 360) = v69;
        if (CFStringIsEncodingAvailable(v69))
        {
LABEL_130:
          *(_BYTE *)(a1 + 2809) = 1;
          return;
        }
LABEL_129:
        SystemEncoding = CFStringGetSystemEncoding();
        *(_DWORD *)(a1 + 368) = SystemEncoding;
        *(_DWORD *)(a1 + 360) = SystemEncoding;
        goto LABEL_130;
      }
      if (v3 == 1)
        goto LABEL_129;
      if (!v3 && *(_DWORD *)(a1 + 336))
      {
        *(_DWORD *)(a1 + 368) = 1280;
        *(_DWORD *)(a1 + 360) = 1280;
        return;
      }
      *(_DWORD *)(a1 + 368) = 2817;
      *(_DWORD *)(a1 + 360) = 2817;
      v64 = *(_DWORD *)(a1 + 340);
      if (v64 == -1)
      {
        *(_DWORD *)(a1 + 340) = 1;
        *(_QWORD *)(a1 + 520) = 0;
      }
      else
      {
LABEL_122:
        if (v64 < 1)
          return;
        *(_QWORD *)(a1 + 520) = 0;
        if (v64 > 0x482)
          return;
      }
      v73 = 1;
LABEL_141:
      *(_DWORD *)(a1 + 352) = v73;
      return;
    case 3:
      v4 = *(_QWORD *)(a1 + 560);
      v5 = *(_DWORD *)(a1 + 2772);
      switch(v5)
      {
        case 'A':
        case 'C':
          return;
        case 'B':
          v6 = 0;
          v7 = 0;
          v312 = 0.0;
          v313 = &v312;
          v314 = 0x2020000000;
          v315 = bytes;
          v308 = 0;
          v309 = &v308;
          v310 = 0x2020000000;
          v311 = 1000;
          v304 = 0;
          v305 = &v304;
          v306 = 0x2020000000;
          v307 = 0;
          __endptr[0] = (char *)MEMORY[0x1E0C809B0];
          __endptr[1] = (char *)3221225472;
          v317 = (uint64_t (*)(char **))__readFieldInst_block_invoke;
          v318 = &unk_1E26063A8;
          v8 = 1;
          v319 = &v308;
          v320 = &v312;
          v321 = &v304;
          v9 = MEMORY[0x1E0C80978];
          while (2)
          {
            if (_NSRTFGetToken((_DWORD *)(a1 + 536)) == 4)
            {
LABEL_280:
              v120 = (UInt8 *)*((_QWORD *)v313 + 3);
              if (v120 != bytes)
                free(v120);
              _NSRTFRouteToken(a1 + 536);
              if (v7)
                objc_msgSend((id)objc_msgSend((id)a1, "mutableAttributes"), "setObject:forKey:", v7, CFSTR("NSLink"));
              _Block_object_dispose(&v304, 8);
              _Block_object_dispose(&v308, 8);
              _Block_object_dispose(&v312, 8);
              return;
            }
            if ((v6 & 1) != 0)
            {
LABEL_12:
              v6 = 1;
LABEL_13:
              v10 = *(_DWORD *)(a1 + 2764);
LABEL_31:
              if (v10 == 1)
              {
                v15 = *(_DWORD *)(a1 + 2768);
                if (v15 != 1)
                {
                  if (!v15)
                    ++v8;
                  continue;
                }
                v29 = v8-- <= 1;
                if (v29)
                  goto LABEL_280;
              }
              continue;
            }
            break;
          }
          v10 = *(_DWORD *)(a1 + 2764);
          if (v10 != 2)
          {
LABEL_30:
            v6 = 0;
            goto LABEL_31;
          }
          v11 = v305;
          v12 = v305[3];
          while (1)
          {
            if (v12 == v309[3])
            {
              if (!v317(__endptr))
              {
                v6 = 0;
                goto LABEL_13;
              }
              v11 = v305;
              v12 = v305[3];
            }
            v13 = *(unsigned int *)(a1 + 2768);
            if (!v12)
            {
              if (v13 > 0x7F)
              {
                if (__maskrune(v13, 0x4000uLL))
                  goto LABEL_21;
              }
              else if ((*(_DWORD *)(v9 + 4 * v13 + 60) & 0x4000) != 0)
              {
                goto LABEL_21;
              }
              LODWORD(v13) = *(_DWORD *)(a1 + 2768);
              v11 = v305;
              v12 = v305[3];
            }
            v14 = *((_QWORD *)v313 + 3);
            v11[3] = v12 + 1;
            *(_BYTE *)(v14 + v12) = v13;
LABEL_21:
            _NSRTFGetToken((_DWORD *)(a1 + 536));
            v11 = v305;
            v12 = v305[3];
            if (v12 == 9 && !strncmp(*((const char **)v313 + 3), "HYPERLINK", 9uLL))
            {
              v11[3] = 0;
              while (1)
              {
                v16 = v305;
                if (*(_DWORD *)(a1 + 2764) != 2)
                  break;
                v17 = v305[3];
                if (v17 == v309[3])
                {
                  v18 = v317(__endptr);
                  v16 = v305;
                  if (!v18)
                    break;
                  v17 = v305[3];
                }
                v19 = *(_DWORD *)(a1 + 2768);
                v20 = *((_QWORD *)v313 + 3);
                v16[3] = v17 + 1;
                *(_BYTE *)(v20 + v17) = v19;
                _NSRTFGetToken((_DWORD *)(a1 + 536));
              }
              v21 = v16[3];
              if (v21)
              {
                v22 = 0;
                while (1)
                {
                  v23 = *(unsigned __int8 *)(*((_QWORD *)v313 + 3) + v22);
                  if (*(char *)(*((_QWORD *)v313 + 3) + v22) < 0)
                  {
                    v24 = __maskrune(v23, 0x4000uLL);
                    v16 = v305;
                  }
                  else
                  {
                    v24 = *(_DWORD *)(v9 + 4 * v23 + 60) & 0x4000;
                  }
                  if (!v24)
                    break;
                  ++v22;
                  v21 = v16[3];
                  if (v22 >= v21)
                    goto LABEL_52;
                }
                v21 = v16[3];
LABEL_52:
                if (v21 > v22)
                {
                  while (1)
                  {
                    v25 = v21 - 1;
                    v26 = *(char *)(*((_QWORD *)v313 + 3) + v21 - 1);
                    if (v26 < 0)
                    {
                      v27 = __maskrune(v26, 0x4000uLL);
                      v28 = v305;
                    }
                    else
                    {
                      v27 = *(_DWORD *)(v9 + 4 * v26 + 60) & 0x4000;
                      v28 = v16;
                    }
                    if (!v27)
                      break;
                    v16[3] = v25;
                    v21 = v28[3];
                    v16 = v28;
                    if (v21 <= v22)
                      goto LABEL_63;
                  }
                  v21 = v28[3];
LABEL_63:
                  v16 = v28;
                }
              }
              else
              {
                v22 = 0;
              }
              v30 = v21 - 1;
              if (v21 - 1 > v22
                && (v31 = *((_QWORD *)v313 + 3), *(_BYTE *)(v31 + v22) == 34)
                && *(_BYTE *)(v31 + v30) == 34)
              {
                v16[3] = v30;
                ++v22;
              }
              else
              {
                v30 = v21;
              }
              v32 = *(_DWORD *)(a1 + 372);
              if (v32 == -1)
                v32 = *(_DWORD *)(a1 + 360);
              v33 = CFStringCreateWithBytes(0, (const UInt8 *)(*((_QWORD *)v313 + 3) + v22), v30 - v22, v32, 0);
              v34 = (id)CFMakeCollectable(v33);
              v35 = v34;
              if (v34)
              {
                if (objc_msgSend(v34, "length") && v7 == 0)
                  v7 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v35);
              }
              goto LABEL_12;
            }
            v10 = *(_DWORD *)(a1 + 2764);
            if (v10 != 2)
              goto LABEL_30;
          }
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
        case 'K':
        case 'M':
        case 'N':
        case 'U':
        case 'V':
        case '[':
LABEL_285:
          v104 = a1 + 536;
          v121 = *(_DWORD *)(a1 + 340);
          if (v121 == -1)
          {
            *(_DWORD *)(a1 + 340) = 0;
          }
          else if (v121 >= 1)
          {
            *(_QWORD *)(a1 + 520) = 0;
            if (v121 <= 0x482)
              *(_DWORD *)(a1 + 352) = 1;
          }
          _NSRTFSkipGroup((_DWORD *)(a1 + 536));
          goto LABEL_597;
        case 'I':
          v92 = a1;
          v93 = 0;
          goto LABEL_208;
        case 'J':
          v94 = (_DWORD *)(a1 + 536);
          _NSRTFSkipGroup(v94);
          v95 = (uint64_t)v94;
          goto LABEL_598;
        case 'L':
          v92 = a1;
          v93 = 1;
LABEL_208:
          readNeXTGraphic(v92, v93);
          return;
        case 'O':
          v96 = *(int *)(a1 + 2776);
          _NSRTFGetToken((_DWORD *)(a1 + 536));
          if (*(_DWORD *)(a1 + 2764) == 2)
          {
            v97 = 0;
            do
            {
              v98 = v97++;
              bytes[v98] = *(_DWORD *)(a1 + 2768);
              _NSRTFGetToken((_DWORD *)(a1 + 536));
            }
            while (v98 <= 0x18E && *(_DWORD *)(a1 + 2764) == 2);
          }
          else
          {
            v97 = 0;
          }
          v191 = CFStringCreateWithBytes(0, bytes, v97, 0x8000100u, 0);
          v192 = (void *)CFMakeCollectable(v191);
          v193 = *(_DWORD *)(a1 + 2764);
          if (v193 != 3)
          {
            v221 = 0;
            v196 = -1;
            goto LABEL_511;
          }
          if (*(_DWORD *)(a1 + 2768) != 12)
          {
            v221 = 0;
            v196 = -1;
            goto LABEL_795;
          }
          v194 = *(_DWORD *)(a1 + 2772);
          if (v194 == 42)
          {
            if (*(_DWORD *)(a1 + 2776) == -1000000)
              v195 = -1;
            else
              v195 = *(_DWORD *)(a1 + 2776);
            _NSRTFGetToken((_DWORD *)(a1 + 536));
            v196 = v195;
            v193 = *(_DWORD *)(a1 + 2764);
            if (v193 != 3)
            {
              v221 = 0;
              goto LABEL_511;
            }
            if (*(_DWORD *)(a1 + 2768) != 12)
              goto LABEL_794;
            v194 = *(_DWORD *)(a1 + 2772);
          }
          else
          {
            v196 = -1;
          }
          if (v194 == 43)
          {
            _NSRTFGetToken((_DWORD *)(a1 + 536));
            if (*(_DWORD *)(a1 + 2764) == 2)
            {
              v287 = 0;
              do
              {
                bytes[v287] = *(_DWORD *)(a1 + 2768);
                _NSRTFGetToken((_DWORD *)(a1 + 536));
                v288 = v287 + 1;
                if (v287 > 0x18E)
                  break;
                ++v287;
              }
              while (*(_DWORD *)(a1 + 2764) == 2);
            }
            else
            {
              v288 = 0;
            }
            v302 = CFStringCreateWithBytes(0, bytes, v288, 0x8000100u, 0);
            v221 = (void *)CFMakeCollectable(v302);
            v193 = *(_DWORD *)(a1 + 2764);
LABEL_511:
            if (v193 == 1 && *(_DWORD *)(a1 + 2768) == 1)
            {
LABEL_796:
              _NSRTFRouteToken(a1 + 536);
              if (v221)
              {
                objc_msgSend((id)a1, "_updateAttributes");
                v289 = objc_msgSend((id)objc_msgSend((id)a1, "mutableAttributes"), "objectForKey:", CFSTR("NSFont"));
                if (v289)
                {
                  v290 = +[NSGlyphInfo glyphInfoWithGlyphName:forFont:baseString:](NSGlyphInfo, "glyphInfoWithGlyphName:forFont:baseString:", v221, v289, v192);
                  goto LABEL_803;
                }
LABEL_805:

                return;
              }
              if (v196 == -1)
              {
                objc_msgSend((id)a1, "_updateAttributes");
                v291 = objc_msgSend((id)objc_msgSend((id)a1, "mutableAttributes"), "objectForKey:", CFSTR("NSFont"));
                if (!v291)
                  goto LABEL_805;
                v290 = +[NSGlyphInfo glyphInfoWithGlyph:forFont:baseString:](NSGlyphInfo, "glyphInfoWithGlyph:forFont:baseString:", v96, v291, v192);
              }
              else
              {
                v290 = +[NSGlyphInfo glyphInfoWithCharacterIdentifier:collection:baseString:](NSGlyphInfo, "glyphInfoWithCharacterIdentifier:collection:baseString:", v96, v196, v192);
              }
LABEL_803:
              v292 = v290;
              if (v290)
              {
                v293 = (void *)objc_msgSend((id)a1, "mutableAttributes");
                objc_msgSend(v293, "setObject:forKey:", v292, NSGlyphInfoAttributeName);
              }
              goto LABEL_805;
            }
LABEL_795:
            _NSRTFSkipGroup((_DWORD *)(a1 + 536));
            goto LABEL_796;
          }
LABEL_794:
          v221 = 0;
          goto LABEL_795;
        case 'P':
          if (_NSRTFGetToken((_DWORD *)(a1 + 536)) == 4)
          {
            _NSRTFRouteToken(a1 + 536);
            return;
          }
          v197 = 0;
          v198 = 0;
          v199 = 0;
          v200 = 0;
          v201 = 0;
          v202 = 0;
          v203 = 1;
          while (1)
          {
            if ((v202 & 1) == 0)
              goto LABEL_417;
            if (*(_DWORD *)(a1 + 2764) != 2 || v198 > 0x18E)
              break;
            bytes[v198++] = *(_DWORD *)(a1 + 2768);
            v202 = 1;
LABEL_418:
            v205 = *(_DWORD *)(a1 + 2764);
            if (v205 == 1)
            {
              v206 = *(_DWORD *)(a1 + 2768);
              if (v206 == 1)
              {
                if (v203 < 2)
                  goto LABEL_514;
                --v203;
              }
              else if (!v206)
              {
                ++v203;
              }
            }
            else if (!v197 && v205 == 3 && *(_DWORD *)(a1 + 2768) == 26)
            {
              v207 = *(_DWORD *)(a1 + 2772);
              switch(v207)
              {
                case 'R':
                  v201 = 0;
                  v198 = 0;
                  v202 = 1;
                  break;
                case 'T':
                  v199 = 1;
                  break;
                case 'S':
                  v198 = 0;
                  v202 = 1;
                  v201 = 1;
                  break;
              }
            }
            if (_NSRTFGetToken((_DWORD *)(a1 + 536)) == 4)
            {
LABEL_514:
              _NSRTFRouteToken(a1 + 536);
              if (v197)
                objc_msgSend((id)a1, "setBackgroundColor:", v197);
              return;
            }
          }
          if (v198 - 1 <= 0x18E)
          {
            bytes[v198] = 0;
            if ((v201 & v200 & v199 & 1) != 0)
            {
              __endptr[0] = 0;
              v204 = strtol((const char *)bytes, __endptr, 10);
              if ((UInt8 *)__endptr[0] == &bytes[v198])
                v197 = colorFromRTFRGB(a1, v204, BYTE1(v204), BYTE2(v204));
            }
            v202 = 0;
            v200 = (v201 & 1) == 0 && *(_QWORD *)bytes == 0x6F6C6F436C6C6966 && v323 == 114;
            goto LABEL_418;
          }
LABEL_417:
          v202 = 0;
          goto LABEL_418;
        case 'Q':
          v99 = objc_msgSend((id)objc_msgSend((id)a1, "attributedStringToEndOfGroup"), "string");
          if (!v99)
            return;
          v66 = v99;
          v67 = (void *)-[NSRTFReader _documentInfoDictionary](a1);
          v68 = &NSCompanyDocumentAttribute;
          goto LABEL_302;
        case 'R':
          v100 = objc_msgSend((id)objc_msgSend((id)a1, "attributedStringToEndOfGroup"), "string");
          if (!v100)
            return;
          v66 = v100;
          v67 = (void *)-[NSRTFReader _documentInfoDictionary](a1);
          v68 = &NSManagerDocumentAttribute;
          goto LABEL_302;
        case 'S':
          Date = readDate(a1);
          if (!Date)
            return;
          v66 = Date;
          v67 = (void *)-[NSRTFReader _documentInfoDictionary](a1);
          v68 = &NSCreationTimeDocumentAttribute;
          goto LABEL_302;
        case 'T':
          v102 = readDate(a1);
          if (!v102)
            return;
          v66 = v102;
          v67 = (void *)-[NSRTFReader _documentInfoDictionary](a1);
          v68 = &NSModificationTimeDocumentAttribute;
          goto LABEL_302;
        case 'W':
          v103 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          if (_NSRTFGetToken((_DWORD *)(a1 + 536)) == 4)
            goto LABEL_225;
          v209 = 0;
          v210 = 0;
          v211 = 0;
          v212 = -1;
          v213 = 1;
          v214 = 1;
          break;
        case 'X':
          v104 = a1 + 536;
          if (_NSRTFGetToken((_DWORD *)(a1 + 536)) == 4)
            goto LABEL_253;
          v105 = 0;
          v106 = 0;
          v107 = 1;
          do
          {
            v108 = *(_DWORD *)(a1 + 2764);
            if (v108 == 1)
            {
              v111 = *(_DWORD *)(a1 + 2768);
              if (v111 == 1)
              {
                if (v107 == 2)
                {
                  if (v106 && v105)
                  {
                    objc_msgSend((id)a1, "_addOverride:forKey:", v105, v106);
                    v106 = 0;
                    v105 = 0;
                  }
                  v107 = 1;
                }
                else
                {
                  v29 = v107-- < 2;
                  if (v29)
                    break;
                }
              }
              else if (!v111)
              {
                ++v107;
              }
            }
            else if (v108 == 3)
            {
              v109 = *(_DWORD *)(a1 + 2768);
              if (v109 == 11)
              {
                if (*(_DWORD *)(a1 + 2772) == 110)
                  v105 = *(int *)(a1 + 2776);
              }
              else if (v109 == 28)
              {
                v110 = *(_DWORD *)(a1 + 2772);
                if (v110 == 18)
                {
                  if (v106 != 0 && v105 != 0)
                  {
                    v106 = 0;
                    v105 = 0;
                  }
                }
                else if (v110 == 17)
                {
                  v106 = *(int *)(a1 + 2776);
                }
              }
            }
          }
          while (_NSRTFGetToken((_DWORD *)(a1 + 536)) != 4);
LABEL_253:
          *(_QWORD *)(a1 + 568) = *(_QWORD *)(a1 + 560);
LABEL_597:
          v95 = v104;
LABEL_598:
          _NSRTFRouteToken(v95);
          return;
        case 'Y':
          v112 = objc_msgSend((id)objc_msgSend((id)a1, "attributedStringToEndOfGroup"), "string");
          if (!v112)
            return;
          v66 = v112;
          v67 = (void *)-[NSRTFReader _documentInfoDictionary](a1);
          v68 = &NSCopyrightDocumentAttribute;
          goto LABEL_302;
        case 'Z':
          v113 = objc_msgSend((id)objc_msgSend((id)a1, "attributedStringToEndOfGroup"), "string");
          if (!v113)
            return;
          v66 = v113;
          v67 = (void *)-[NSRTFReader _documentInfoDictionary](a1);
          v68 = &NSCategoryDocumentAttribute;
LABEL_302:
          v131 = (const __CFString *)*v68;
          objc_msgSend(v67, "setObject:forKey:", v66, *v68);
          if (*(uint64_t *)(a1 + 2816) >= 1)
          {
            v128 = a1;
            v129 = v4;
            v127 = v131;
LABEL_304:
            SaveMetadataInfo(v128, v129, (uint64_t)v127);
          }
          return;
        case '\\':
          _NSRTFGetToken((_DWORD *)(a1 + 536));
          _NSRTFGetToken((_DWORD *)(a1 + 536));
          if (*(_DWORD *)(a1 + 2764) == 2)
          {
            v114 = 0;
            v115 = 0;
            do
            {
              v116 = *(_DWORD *)(a1 + 2768);
              if (v116 == 59)
              {
                if (v114)
                {
                  v114 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", bytes, v114, 1);
                  if (v114)
                  {
                    if (!v115)
                      v115 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    objc_msgSend(v115, "addObject:", v114);

                    v114 = 0;
                  }
                }
              }
              else
              {
                bytes[v114++] = v116;
              }
              _NSRTFGetToken((_DWORD *)(a1 + 536));
            }
            while (*(_DWORD *)(a1 + 2764) == 2);
          }
          else
          {
            v115 = 0;
          }
          _NSRTFRouteToken(a1 + 536);
          *(_QWORD *)(a1 + 3008) = v115;
          return;
        case ']':
          _NSRTFGetToken((_DWORD *)(a1 + 536));
          _NSRTFGetToken((_DWORD *)(a1 + 536));
          if (*(_DWORD *)(a1 + 2764) == 2)
          {
            v117 = 0;
            v118 = 0;
            do
            {
              v119 = *(_DWORD *)(a1 + 2768);
              if (v119 == 59)
              {
                if (v117)
                {
                  v117 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", bytes, v117, 1);
                  if (v117)
                  {
                    if (!v118)
                      v118 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    objc_msgSend(v118, "addObject:", v117);

                    v117 = 0;
                  }
                }
              }
              else
              {
                bytes[v117++] = v119;
              }
              _NSRTFGetToken((_DWORD *)(a1 + 536));
            }
            while (*(_DWORD *)(a1 + 2764) == 2);
          }
          else
          {
            v118 = 0;
          }
          _NSRTFRouteToken(a1 + 536);
          *(_QWORD *)(a1 + 3016) = v118;
          return;
        default:
          switch(v5)
          {
            case 10:
              return;
            case 11:
              v65 = objc_msgSend((id)objc_msgSend((id)a1, "attributedStringToEndOfGroup"), "string");
              if (!v65)
                return;
              v66 = v65;
              v67 = (void *)-[NSRTFReader _documentInfoDictionary](a1);
              v68 = &NSTitleDocumentAttribute;
              goto LABEL_302;
            case 12:
              v122 = objc_msgSend((id)objc_msgSend((id)a1, "attributedStringToEndOfGroup"), "string");
              if (!v122)
                return;
              v66 = v122;
              v67 = (void *)-[NSRTFReader _documentInfoDictionary](a1);
              v68 = &NSSubjectDocumentAttribute;
              goto LABEL_302;
            case 13:
              v123 = objc_msgSend((id)objc_msgSend((id)a1, "attributedStringToEndOfGroup"), "string");
              if (!v123)
                return;
              v66 = v123;
              v67 = (void *)-[NSRTFReader _documentInfoDictionary](a1);
              v68 = &NSAuthorDocumentAttribute;
              goto LABEL_302;
            case 14:
              v124 = objc_msgSend((id)objc_msgSend((id)a1, "attributedStringToEndOfGroup"), "string");
              if (!v124)
                return;
              v66 = v124;
              v67 = (void *)-[NSRTFReader _documentInfoDictionary](a1);
              v68 = &NSEditorDocumentAttribute;
              goto LABEL_302;
            case 15:
              v125 = (void *)objc_msgSend((id)objc_msgSend((id)a1, "attributedStringToEndOfGroup"), "string");
              if (!v125)
                return;
              v126 = objc_msgSend(v125, "componentsSeparatedByString:", CFSTR(", "));
              if (v126)
                objc_msgSend((id)-[NSRTFReader _documentInfoDictionary](a1), "setObject:forKey:", v126, CFSTR("NSKeywordsDocumentAttribute"));
              if (*(uint64_t *)(a1 + 2816) < 1)
                return;
              v127 = CFSTR("NSKeywordsDocumentAttribute");
              v128 = a1;
              v129 = v4;
              goto LABEL_304;
            case 18:
              v130 = objc_msgSend((id)objc_msgSend((id)a1, "attributedStringToEndOfGroup"), "string");
              if (!v130)
                return;
              v66 = v130;
              v67 = (void *)-[NSRTFReader _documentInfoDictionary](a1);
              v68 = &NSCommentDocumentAttribute;
              goto LABEL_302;
            default:
              goto LABEL_285;
          }
      }
      while (1)
      {
        v215 = *(_DWORD *)(a1 + 2764);
        if (v215 == 1)
        {
          v217 = *(_DWORD *)(a1 + 2768);
          if (v217 != 1)
          {
            if (!v217)
              ++v214;
            goto LABEL_451;
          }
          if (v214 == 2)
          {
            if (v211)
            {
              if (objc_msgSend(v103, "count"))
                objc_msgSend((id)a1, "_addListDefinition:forKey:", v103, v211);
              objc_msgSend(v103, "removeAllObjects");
              v211 = 0;
            }
            v214 = 1;
            goto LABEL_451;
          }
          if (v214 == 3)
          {
            if (v212 < 0)
            {
              v214 = 2;
              goto LABEL_451;
            }
            if (!v210)
            {
              v210 = CFSTR("{upper-roman}.");
              switch(v212)
              {
                case 1:
                  break;
                case 2:
                  v210 = CFSTR("{lower-roman}.");
                  break;
                case 3:
                  v210 = CFSTR("{upper-alpha}.");
                  break;
                case 4:
                  v210 = CFSTR("{lower-alpha}.");
                  break;
                default:
                  if (v212 == 23)
                    v210 = CFSTR("{disc}");
                  else
                    v210 = CFSTR("{decimal}.");
                  break;
              }
            }
            v218 = -[NSTextList initWithMarkerFormat:options:]([NSTextList alloc], "initWithMarkerFormat:options:", v210, v209 & 1);
            -[NSTextList setStartingItemNumber:](v218, "setStartingItemNumber:", v213);
            objc_msgSend(v103, "addObject:", v218);

            v210 = 0;
            v209 = 0;
            v212 = -1;
            v214 = 2;
            goto LABEL_458;
          }
          if (v214 < 2)
          {
LABEL_225:
            *(_QWORD *)(a1 + 568) = *(_QWORD *)(a1 + 560);
            _NSRTFRouteToken(a1 + 536);
            return;
          }
          --v214;
        }
        else
        {
          if (v215 != 3 || *(_DWORD *)(a1 + 2768) != 28)
            goto LABEL_451;
          v216 = *(_DWORD *)(a1 + 2772);
          if (v216 == 17)
          {
            v211 = *(int *)(a1 + 2776);
          }
          else
          {
            if ((v216 - 5) <= 1)
            {
              v212 = *(int *)(a1 + 2776);
              goto LABEL_451;
            }
            if (v216 > 19)
            {
              if (v216 == 20)
              {
                _NSRTFGetToken((_DWORD *)(a1 + 536));
                if (*(_DWORD *)(a1 + 2764) == 2)
                {
                  v220 = 0;
                  do
                  {
                    if (v220 <= 0x3FE)
                      bytes[v220++] = *(_DWORD *)(a1 + 2768);
                    _NSRTFGetToken((_DWORD *)(a1 + 536));
                  }
                  while (*(_DWORD *)(a1 + 2764) == 2);
                }
                else
                {
                  v220 = 0;
                }
                _NSRTFUngetToken(a1 + 536);
                bytes[v220] = 0;
                v210 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", bytes);
                goto LABEL_451;
              }
              if (v216 != 21)
              {
LABEL_487:
                if (!v216 && v211)
                {
                  if (objc_msgSend(v103, "count"))
                    objc_msgSend((id)a1, "_addListDefinition:forKey:", v103, v211);
                  objc_msgSend(v103, "removeAllObjects");
                  v211 = 0;
                }
                goto LABEL_451;
              }
              v209 = 1;
            }
            else
            {
              if (v216 == 4)
              {
                if (v212 < 0)
                  goto LABEL_451;
                if (!v210)
                {
                  v210 = CFSTR("{upper-roman}.");
                  switch(v212)
                  {
                    case 1:
                      break;
                    case 2:
                      v210 = CFSTR("{lower-roman}.");
                      break;
                    case 3:
                      v210 = CFSTR("{upper-alpha}.");
                      break;
                    case 4:
                      v210 = CFSTR("{lower-alpha}.");
                      break;
                    default:
                      if (v212 == 23)
                        v210 = CFSTR("{disc}");
                      else
                        v210 = CFSTR("{decimal}.");
                      break;
                  }
                }
                v219 = -[NSTextList initWithMarkerFormat:options:]([NSTextList alloc], "initWithMarkerFormat:options:", v210, v209 & 1);
                -[NSTextList setStartingItemNumber:](v219, "setStartingItemNumber:", v213);
                objc_msgSend(v103, "addObject:", v219);

                v210 = 0;
                v209 = 0;
                v212 = -1;
LABEL_458:
                v213 = 1;
                goto LABEL_451;
              }
              if (v216 != 10)
                goto LABEL_487;
              v213 = *(int *)(a1 + 2776);
            }
          }
        }
LABEL_451:
        if (_NSRTFGetToken((_DWORD *)(a1 + 536)) == 4)
          goto LABEL_225;
      }
    case 6:
      v41 = 0;
      v42 = 0;
      v43 = 12;
      switch(*(_DWORD *)(a1 + 2772))
      {
        case 0x1A:
        case 0x3B:
          v44 = objc_msgSend((id)a1, "_currentTableCellIsPlaceholder");
          if ((v44 & 1) == 0)
          {
            v45 = (_DWORD *)(a1 + 410);
            if ((*(_DWORD *)(a1 + 410) & 0x10000) != 0)
            {
              v41 = 1;
              goto LABEL_382;
            }
          }
          if ((v44 & 1) != 0)
            goto LABEL_392;
          v41 = 1;
          v43 = 10;
          v42 = 1;
          goto LABEL_384;
        case 0x1B:
        case 0x3C:
          objc_msgSend((id)a1, "_endTableRow");
          return;
        case 0x1C:
          v41 = 0;
          if ((*(_BYTE *)(a1 + 412) & 1) != 0)
          {
            v45 = (_DWORD *)(a1 + 410);
LABEL_382:
            v42 = 1;
            flushCharacters(a1, 1);
            objc_msgSend((id)objc_msgSend((id)a1, "mutableAttributes"), "removeObjectForKey:", CFSTR("NSWritingDirection"));
            *v45 &= ~0x10000u;
          }
          else
          {
            v42 = 1;
          }
          v43 = 10;
          goto LABEL_384;
        case 0x1E:
          goto LABEL_384;
        case 0x20:
          v41 = 0;
          v42 = 0;
          v43 = 8232;
          goto LABEL_384;
        case 0x25:
          v41 = 0;
          v42 = 0;
          v43 = 9;
          goto LABEL_384;
        case 0x26:
          v41 = 0;
          v42 = 0;
          v43 = 8212;
          goto LABEL_384;
        case 0x27:
          v41 = 0;
          v42 = 0;
          v43 = 8211;
          goto LABEL_384;
        case 0x28:
          v41 = 0;
          v42 = 0;
          v43 = 8195;
          goto LABEL_384;
        case 0x29:
          v41 = 0;
          v42 = 0;
          v43 = 8194;
          goto LABEL_384;
        case 0x2A:
          v41 = 0;
          v42 = 0;
          v43 = 8226;
          goto LABEL_384;
        case 0x2B:
          v41 = 0;
          v42 = 0;
          v43 = 8216;
          goto LABEL_384;
        case 0x2C:
          v41 = 0;
          v42 = 0;
          v43 = 8217;
          goto LABEL_384;
        case 0x2D:
          v41 = 0;
          v42 = 0;
          v43 = 8220;
          goto LABEL_384;
        case 0x2E:
          v41 = 0;
          v42 = 0;
          v43 = 8221;
          goto LABEL_384;
        case 0x31:
          v41 = 0;
          v42 = 0;
          v43 = 160;
          goto LABEL_384;
        case 0x33:
          v41 = 0;
          v42 = 0;
          v43 = 8209;
          goto LABEL_384;
        case 0x37:
          v41 = 0;
          v42 = 0;
          v43 = 8205;
          goto LABEL_384;
        case 0x38:
          v41 = 0;
          v42 = 0;
          v43 = 8204;
LABEL_384:
          if (!*(_BYTE *)(a1 + 2808))
            flushCharacters(a1, 1);
          v190 = *(_QWORD *)(a1 + 328);
          *(_QWORD *)(a1 + 328) = v190 + 1;
          *(_WORD *)(a1 + 2 * v190 + 72) = v43;
          *(_BYTE *)(a1 + 2808) = 1;
          if (*(_QWORD *)(a1 + 328) < 0x80uLL)
          {
            if (!v42)
            {
LABEL_388:
              if (!v41)
                return;
              goto LABEL_392;
            }
          }
          else
          {
            flushCharacters(a1, 1);
            if ((v42 & 1) == 0)
              goto LABEL_388;
          }
          flushCharacters(a1, 1);
          if ((v41 & 1) == 0)
            return;
LABEL_392:
          objc_msgSend((id)a1, "_endTableCell");
          return;
        default:
          return;
      }
    case 8:
      v46 = *(_DWORD *)(a1 + 2772);
      if (v46 <= 75)
      {
        switch(v46)
        {
          case '(':
            v61 = *(_DWORD *)(a1 + 2776);
            objc_msgSend((id)a1, "paperSize");
            v63 = (double)v61 / 20.0;
            goto LABEL_154;
          case ')':
            objc_msgSend((id)a1, "paperSize");
            v62 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_154:
            objc_msgSend((id)a1, "setPaperSize:", v63, v62);
            return;
          case '*':
            return;
          case '+':
            objc_msgSend((id)a1, "setLeftMargin:", (double)*(int *)(a1 + 2776) / 20.0);
            return;
          case ',':
            objc_msgSend((id)a1, "setRightMargin:", (double)*(int *)(a1 + 2776) / 20.0);
            return;
          case '-':
            objc_msgSend((id)a1, "setTopMargin:", (double)*(int *)(a1 + 2776) / 20.0);
            return;
          case '.':
            objc_msgSend((id)a1, "setBottomMargin:", (double)*(int *)(a1 + 2776) / 20.0);
            return;
          default:
            if (!v46)
            {
              v53 = (double)*(int *)(a1 + 2776) / 20.0;
              v54 = (void *)a1;
              goto LABEL_356;
            }
            if (v46 != 4)
              return;
            LODWORD(v2) = 1063675494;
            if (!*(_DWORD *)(a1 + 2776))
              *(float *)&v2 = 0.0;
LABEL_519:
            v136 = (void *)a1;
            break;
        }
LABEL_520:
        objc_msgSend(v136, "setHyphenationFactor:", v2);
      }
      else
      {
        switch(v46)
        {
          case 'L':
            v47 = (void *)a1;
            goto LABEL_339;
          case 'N':
            v84 = *(_DWORD *)(a1 + 2776);
            if (v84 < 1)
            {
              LODWORD(v2) = 0;
            }
            else
            {
              v2 = (double)v84 / 100.0;
              *(float *)&v2 = v2;
            }
            goto LABEL_519;
          case 'O':
            v85 = *(_DWORD *)(a1 + 2776);
            if (v85 <= 0)
              v86 = 100;
            else
              v86 = v85;
            objc_msgSend((id)a1, "setViewScale:", v86);
            return;
          case 'Q':
            objc_msgSend((id)a1, "setViewKind:", *(int *)(a1 + 2776));
            return;
          case 'R':
            v87 = *(_DWORD *)(a1 + 2776);
            objc_msgSend((id)a1, "viewSize");
            v89 = (double)v87 / 20.0;
            goto LABEL_175;
          case 'S':
            objc_msgSend((id)a1, "viewSize");
            v88 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_175:
            objc_msgSend((id)a1, "setViewSize:", v89, v88);
            break;
          case 'T':
            v64 = *(_DWORD *)(a1 + 340);
            if (v64 == -1)
            {
              v64 = *(_DWORD *)(a1 + 2776);
              *(_DWORD *)(a1 + 340) = v64;
            }
            goto LABEL_122;
          case 'U':
            *(_DWORD *)(a1 + 348) = *(_DWORD *)(a1 + 2776);
            break;
          case 'V':
            *(_DWORD *)(a1 + 344) = *(_DWORD *)(a1 + 2776);
            break;
          case 'W':
            v73 = *(_DWORD *)(a1 + 2776);
            goto LABEL_141;
          case 'X':
            v90 = *(unsigned int *)(a1 + 2776);
            if (v90 <= 1)
              *(_QWORD *)(a1 + 2968) = v90;
            break;
          case 'Y':
            v91 = *(unsigned int *)(a1 + 2776);
            if (v91 <= 2)
              *(_QWORD *)(a1 + 2976) = v91;
            break;
          default:
            return;
        }
      }
      return;
    case 9:
      if (*(_DWORD *)(a1 + 2772) == 54)
        objc_msgSend((id)a1, "setTextFlow:", *(int *)(a1 + 2776));
      return;
    case 0xA:
      v48 = (void *)objc_msgSend((id)a1, "_currentTable");
      v49 = (void *)objc_msgSend((id)a1, "_currentTableCell");
      v50 = v49;
      switch(*(_DWORD *)(a1 + 2772))
      {
        case 0:
          objc_msgSend((id)a1, "_startTableRowDefinition");
          return;
        case 2:
          objc_msgSend((id)a1, "_endTableCellDefinition");
          return;
        case 4:
          objc_msgSend((id)a1, "_mergeTableCellsHorizontally");
          return;
        case 0xE:
          v261 = (void *)a1;
          v262 = 1;
          goto LABEL_606;
        case 0xF:
          v261 = (void *)a1;
          v262 = 0;
          goto LABEL_606;
        case 0x10:
          v261 = (void *)a1;
          v262 = 3;
          goto LABEL_606;
        case 0x11:
          v261 = (void *)a1;
          v262 = 2;
LABEL_606:
          v263 = 1;
          goto LABEL_614;
        case 0x16:
          v163 = *(int *)(a1 + 2776);
          v164 = (_DWORD *)a1;
          v165 = 8;
          goto LABEL_617;
        case 0x19:
          objc_msgSend((id)a1, "_lastTableRow");
          return;
        case 0x1C:
          v261 = (void *)a1;
          v262 = 3;
          goto LABEL_613;
        case 0x1D:
          v261 = (void *)a1;
          v262 = 1;
          goto LABEL_613;
        case 0x1E:
          v261 = (void *)a1;
          v262 = 0;
          goto LABEL_613;
        case 0x1F:
          v261 = (void *)a1;
          v262 = 2;
LABEL_613:
          v263 = 0;
LABEL_614:
          objc_msgSend(v261, "_setCurrentBorderEdge:isTable:", v262, v263);
          return;
        case 0x21:
          objc_msgSend((id)objc_msgSend((id)a1, "_currentTableCell"), "setBackgroundColor:", 0);
          return;
        case 0x2F:
          v163 = *(int *)(a1 + 2776);
          v164 = (_DWORD *)a1;
          v165 = 7;
          goto LABEL_617;
        case 0x30:
          v264 = *(_DWORD *)(a1 + 2776);
          v265 = objc_msgSend(v48, "valueTypeForDimension:", 0);
          v266 = (double)v264 / 20.0;
          goto LABEL_620;
        case 0x31:
          objc_msgSend(v48, "valueForDimension:", 0);
          v265 = *(_DWORD *)(a1 + 2776) == 2;
LABEL_620:
          v49 = v48;
          goto LABEL_651;
        case 0x32:
          objc_msgSend(v48, "_setTableFlags:", *(int *)(a1 + 2776));
          return;
        case 0x33:
          v266 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          v265 = 0;
          goto LABEL_651;
        case 0x34:
          v266 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          goto LABEL_654;
        case 0x35:
          v266 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          goto LABEL_657;
        case 0x36:
          v266 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          goto LABEL_659;
        case 0x37:
          v266 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          goto LABEL_662;
        case 0x38:
          v266 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          goto LABEL_664;
        case 0x39:
          v266 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          goto LABEL_667;
        case 0x3A:
          v266 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          goto LABEL_669;
        case 0x3B:
          v266 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          goto LABEL_672;
        case 0x3C:
          v266 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          goto LABEL_674;
        case 0x3D:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          goto LABEL_678;
        case 0x3E:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          goto LABEL_680;
        case 0x3F:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          goto LABEL_683;
        case 0x40:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          goto LABEL_685;
        case 0x41:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          goto LABEL_688;
        case 0x42:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          goto LABEL_690;
        case 0x43:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          goto LABEL_693;
        case 0x44:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          goto LABEL_695;
        case 0x45:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          goto LABEL_698;
        case 0x46:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          goto LABEL_700;
        case 0x47:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          goto LABEL_704;
        case 0x48:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          goto LABEL_706;
        case 0x49:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          goto LABEL_710;
        case 0x4A:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          goto LABEL_712;
        case 0x4B:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          goto LABEL_716;
        case 0x4C:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
          v49 = v48;
          goto LABEL_718;
        case 0x4D:
          v268 = *(_DWORD *)(a1 + 2776);
          v265 = objc_msgSend(v49, "valueTypeForDimension:", 0);
          v266 = (double)v268 / 20.0;
          goto LABEL_650;
        case 0x4E:
          objc_msgSend(v49, "valueForDimension:", 0);
          v265 = *(_DWORD *)(a1 + 2776) == 2;
LABEL_650:
          v49 = v50;
LABEL_651:
          v269 = 0;
          goto LABEL_676;
        case 0x4F:
          v266 = (double)*(int *)(a1 + 2776) / 20.0;
          v265 = 0;
          goto LABEL_655;
        case 0x50:
          v266 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_654:
          v265 = 1;
LABEL_655:
          v269 = 1;
          goto LABEL_676;
        case 0x51:
          v266 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_657:
          v265 = 0;
          goto LABEL_660;
        case 0x52:
          v266 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_659:
          v265 = 1;
LABEL_660:
          v269 = 2;
          goto LABEL_676;
        case 0x53:
          v266 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_662:
          v265 = 0;
          goto LABEL_665;
        case 0x54:
          v266 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_664:
          v265 = 1;
LABEL_665:
          v269 = 4;
          goto LABEL_676;
        case 0x55:
          v266 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_667:
          v265 = 0;
          goto LABEL_670;
        case 0x56:
          v266 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_669:
          v265 = 1;
LABEL_670:
          v269 = 5;
          goto LABEL_676;
        case 0x57:
          v266 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_672:
          v265 = 0;
          goto LABEL_675;
        case 0x58:
          v266 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_674:
          v265 = 1;
LABEL_675:
          v269 = 6;
LABEL_676:
          objc_msgSend(v49, "setValue:type:forDimension:", v265, v269, v266);
          return;
        case 0x59:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_678:
          v270 = 0;
          goto LABEL_681;
        case 0x5A:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_680:
          v270 = 1;
LABEL_681:
          v271 = 1;
          goto LABEL_702;
        case 0x5B:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_683:
          v270 = 0;
          goto LABEL_686;
        case 0x5C:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_685:
          v270 = 1;
LABEL_686:
          v271 = 1;
          goto LABEL_708;
        case 0x5D:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_688:
          v270 = 0;
          goto LABEL_691;
        case 0x5E:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_690:
          v270 = 1;
LABEL_691:
          v271 = 1;
          goto LABEL_714;
        case 0x5F:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_693:
          v270 = 0;
          goto LABEL_696;
        case 0x60:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_695:
          v270 = 1;
LABEL_696:
          v271 = 1;
          goto LABEL_720;
        case 0x61:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_698:
          v270 = 0;
          goto LABEL_701;
        case 0x62:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_700:
          v270 = 1;
LABEL_701:
          v271 = -1;
LABEL_702:
          v272 = 1;
          goto LABEL_721;
        case 0x63:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_704:
          v270 = 0;
          goto LABEL_707;
        case 0x64:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_706:
          v270 = 1;
LABEL_707:
          v271 = -1;
LABEL_708:
          v272 = 0;
          goto LABEL_721;
        case 0x65:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_710:
          v270 = 0;
          goto LABEL_713;
        case 0x66:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_712:
          v270 = 1;
LABEL_713:
          v271 = -1;
LABEL_714:
          v272 = 3;
          goto LABEL_721;
        case 0x67:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_716:
          v270 = 0;
          goto LABEL_719;
        case 0x68:
          v267 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_718:
          v270 = 1;
LABEL_719:
          v271 = -1;
LABEL_720:
          v272 = 2;
LABEL_721:
          objc_msgSend(v49, "setWidth:type:forLayer:edge:", v270, v271, v272, v267);
          return;
        case 0x69:
          v273 = 0;
          goto LABEL_726;
        case 0x6A:
          v273 = 3;
          goto LABEL_726;
        case 0x6B:
          v273 = 1;
          goto LABEL_726;
        case 0x6C:
          v273 = 2;
LABEL_726:
          objc_msgSend(v49, "setVerticalAlignment:", v273);
          break;
        case 0x6E:
          objc_msgSend((id)a1, "_mergeTableCellsVertically");
          break;
        default:
          return;
      }
      return;
    case 0xB:
      v51 = *(_DWORD *)(a1 + 2772);
      switch(v51)
      {
        case 0:
          v52 = (void *)objc_msgSend((id)a1, "_mutableParagraphStyle");
          objc_msgSend(v52, "setParagraphStyle:", objc_msgSend((id)a1, "defaultParagraphStyle"));
          objc_msgSend((id)a1, "defaultTabInterval");
          v54 = v52;
LABEL_356:
          objc_msgSend(v54, "setDefaultTabInterval:", v53);
          return;
        case 1:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 22:
          return;
        case 2:
          v135 = *(_DWORD *)(a1 + 2776);
          v136 = (void *)objc_msgSend((id)a1, "_mutableParagraphStyle");
          if (v135 == -1000000)
            LODWORD(v2) = 1.0;
          else
            LODWORD(v2) = 0;
          goto LABEL_520;
        case 3:
          objc_msgSend((id)a1, "_paragraphInTable");
          return;
        case 11:
          v137 = (void *)objc_msgSend((id)a1, "_mutableParagraphStyle");
          v138 = 0;
          goto LABEL_351;
        case 12:
          v137 = (void *)objc_msgSend((id)a1, "_mutableParagraphStyle");
          v138 = 2;
          goto LABEL_351;
        case 13:
          v137 = (void *)objc_msgSend((id)a1, "_mutableParagraphStyle");
          v138 = 3;
          goto LABEL_351;
        case 14:
          v137 = (void *)objc_msgSend((id)a1, "_mutableParagraphStyle");
          v138 = 1;
LABEL_351:
          objc_msgSend(v137, "setAlignment:", v138);
          return;
        case 15:
          v139 = (void *)objc_msgSend((id)a1, "_mutableParagraphStyle");
          objc_msgSend(v139, "headIndent");
          v141 = (double)*(int *)(a1 + 2776) / 20.0;
          goto LABEL_324;
        case 16:
          v139 = (void *)objc_msgSend((id)a1, "_mutableParagraphStyle");
          objc_msgSend(v139, "firstLineHeadIndent");
          v143 = v142;
          objc_msgSend(v139, "headIndent");
          v145 = v144;
          objc_msgSend(v139, "setHeadIndent:", (double)*(int *)(a1 + 2776) / 20.0);
          v140 = v143 - v145;
          v141 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_324:
          objc_msgSend(v139, "setFirstLineHeadIndent:", v140 + v141);
          return;
        case 17:
          v146 = *(_DWORD *)(a1 + 2776);
          if (*(double *)(a1 + 424) - (*(double *)(a1 + 448) + *(double *)(a1 + 440)) + (double)v146 / -20.0 >= 0.0)
            v147 = *(double *)(a1 + 424) - (*(double *)(a1 + 448) + *(double *)(a1 + 440)) + (double)v146 / -20.0;
          else
            v147 = 0.0;
          objc_msgSend((id)objc_msgSend((id)a1, "_mutableParagraphStyle"), "setTailIndent:", v147);
          return;
        case 18:
          objc_msgSend((id)objc_msgSend((id)a1, "_mutableParagraphStyle"), "setParagraphSpacingBefore:", (double)*(int *)(a1 + 2776) / 20.0);
          return;
        case 19:
          v148 = ParAttr_ignoreParaSpacing;
          if (ParAttr_ignoreParaSpacing != 254)
            goto LABEL_780;
          if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("NSIgnoreRTFParagraphSpacing")))
          {
            v148 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSIgnoreRTFParagraphSpacing"));
            ParAttr_ignoreParaSpacing = v148;
          }
          else
          {
            v148 = ParAttr_ignoreParaSpacing;
            if (ParAttr_ignoreParaSpacing == 254)
            {
              ParAttr_ignoreParaSpacing = 2;
              goto LABEL_782;
            }
          }
LABEL_780:
          if (!v148)
            goto LABEL_783;
          if (v148 != 2)
            return;
LABEL_782:
          if (*(_DWORD *)(a1 + 340) == 100)
            return;
LABEL_783:
          objc_msgSend((id)objc_msgSend((id)a1, "_mutableParagraphStyle"), "setParagraphSpacing:", (double)*(int *)(a1 + 2776) / 20.0);
          break;
        case 20:
          if (*(_DWORD *)(a1 + 2776) != 1000)
          {
            v149 = (void *)objc_msgSend((id)a1, "_mutableParagraphStyle");
            v150 = v149;
            v151 = *(_DWORD *)(a1 + 2776);
            if ((v151 & 0x80000000) != 0)
            {
              objc_msgSend(v149, "setMinimumLineHeight:", (double)-v151 / 20.0);
              v152 = (double)-*(_DWORD *)(a1 + 2776) / 20.0;
            }
            else
            {
              objc_msgSend(v149, "setMinimumLineHeight:", (double)v151 / 20.0);
              v152 = 0.0;
            }
            v167 = v150;
LABEL_786:
            objc_msgSend(v167, "setMaximumLineHeight:", v152);
          }
          return;
        case 21:
          if (*(_DWORD *)(a1 + 2776) == 1)
          {
            v153 = (void *)objc_msgSend((id)a1, "_mutableParagraphStyle");
            objc_msgSend(v153, "minimumLineHeight");
            objc_msgSend(v153, "setLineHeightMultiple:", v154 / 12.0);
            v155 = 0.0;
            v156 = v153;
LABEL_354:
            objc_msgSend(v156, "setMinimumLineHeight:", v155);
          }
          return;
        case 23:
          v47 = (void *)objc_msgSend((id)a1, "_mutableParagraphStyle");
LABEL_339:
          v157 = 1;
          goto LABEL_374;
        case 24:
          v47 = (void *)objc_msgSend((id)a1, "_mutableParagraphStyle");
          v157 = 0;
LABEL_374:
          objc_msgSend(v47, "setBaseWritingDirection:", v157);
          return;
        case 25:
          v158 = (void *)objc_msgSend((id)a1, "_mutableParagraphStyle");
          v159 = (_DWORD *)(a1 + 410);
          v160 = -[NSTextTab initWithType:location:](+[NSTextTab allocWithZone:](NSTextTab, "allocWithZone:", objc_msgSend(v158, "zone")), "initWithType:location:", ((unint64_t)*(unsigned int *)(a1 + 410) >> 10) & 0xF, (double)*(int *)(a1 + 2776) / 20.0);
          objc_msgSend(v158, "addTabStop:", v160);

          *v159 &= 0xFFFFC3FF;
          return;
        case 26:
          v161 = (unsigned int *)(a1 + 410);
          v162 = *(_DWORD *)(a1 + 410) & 0xFFFFC3FF;
          goto LABEL_737;
        case 27:
          v161 = (unsigned int *)(a1 + 410);
          v162 = *(_DWORD *)(a1 + 410) & 0xFFFFC3FF | 0x400;
          goto LABEL_737;
        case 28:
          v161 = (unsigned int *)(a1 + 410);
          v162 = *(_DWORD *)(a1 + 410) & 0xFFFFC3FF | 0x800;
          goto LABEL_737;
        case 29:
          v161 = (unsigned int *)(a1 + 410);
          v162 = *(_DWORD *)(a1 + 410) & 0xFFFFC3FF | 0xC00;
          goto LABEL_737;
        default:
          switch(v51)
          {
            case 'V':
              v59 = objc_msgSend((id)a1, "_currentBorderEdge");
              if (objc_msgSend((id)a1, "_currentBorderIsTable"))
                v60 = (void *)objc_msgSend((id)a1, "_currentTable");
              else
                v60 = (void *)objc_msgSend((id)a1, "_currentTableCell");
              v274 = v60;
              objc_msgSend(v60, "setWidth:type:forLayer:edge:", 0, 0, v59, (double)*(int *)(a1 + 2776) / 20.0);
              if (objc_msgSend(v274, "borderColorForEdge:", v59))
                return;
              v275 = objc_msgSend((Class)getNSColorClass_3[0](), "colorWithCalibratedWhite:alpha:", 0.75, 1.0);
              v276 = v274;
LABEL_733:
              objc_msgSend(v276, "setBorderColor:forEdge:", v275, v59);
              return;
            case 'W':
              v163 = *(int *)(a1 + 2776);
              v164 = (_DWORD *)a1;
              v165 = 6;
              goto LABEL_617;
            case 'Y':
              v59 = objc_msgSend((id)a1, "_currentBorderEdge");
              if (objc_msgSend((id)a1, "_currentBorderIsTable"))
                v166 = (void *)objc_msgSend((id)a1, "_currentTable");
              else
                v166 = (void *)objc_msgSend((id)a1, "_currentTableCell");
              v277 = v166;
              objc_msgSend(v166, "setWidth:type:forLayer:edge:", 0, 0, v59, 0.0);
              v276 = v277;
              v275 = 0;
              goto LABEL_733;
            case 'i':
              v167 = (void *)objc_msgSend((id)a1, "_mutableParagraphStyle");
              v152 = (double)*(int *)(a1 + 2776) / 20.0;
              goto LABEL_786;
            case 'j':
              v137 = (void *)objc_msgSend((id)a1, "_mutableParagraphStyle");
              v138 = 4;
              goto LABEL_351;
            case 'k':
              objc_msgSend((id)objc_msgSend((id)a1, "_mutableParagraphStyle"), "setLineSpacing:", (double)*(int *)(a1 + 2776) / 20.0);
              return;
            case 'l':
              v156 = (void *)objc_msgSend((id)a1, "_mutableParagraphStyle");
              v155 = (double)*(int *)(a1 + 2776) / 20.0;
              goto LABEL_354;
            case 'm':
              v54 = (void *)objc_msgSend((id)a1, "_mutableParagraphStyle");
              v53 = (double)*(int *)(a1 + 2776) / 20.0;
              goto LABEL_356;
            case 'n':
              if ((*(_DWORD *)(a1 + 2776) & 0x80000000) != 0)
                return;
              objc_msgSend((id)a1, "_setCurrentListNumber:");
              if ((*(_DWORD *)(a1 + 2776) & 0x80000000) != 0)
                return;
              v168 = (void *)objc_msgSend((id)a1, "_listDefinitions");
              v169 = objc_msgSend(v168, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(int *)(a1 + 2776)));
              if (!v169)
                return;
              v170 = (void *)v169;
              v171 = objc_msgSend((id)a1, "_currentListLevel");
              if (v171 >= objc_msgSend(v170, "count"))
                return;
              v172 = (void *)objc_msgSend((id)a1, "_mutableParagraphStyle");
              v173 = (void *)objc_msgSend(v172, "tabStops");
              objc_msgSend(v172, "setTextLists:", objc_msgSend(v170, "subarrayWithRange:", 0, objc_msgSend((id)a1, "_currentListLevel") + 1));
              if ((unint64_t)objc_msgSend(v173, "count") < 2)
                return;
              v174 = v173;
              goto LABEL_369;
            case 'o':
              if ((*(_DWORD *)(a1 + 2776) & 0x80000000) != 0)
                return;
              objc_msgSend((id)a1, "_setCurrentListLevel:");
              if ((*(_DWORD *)(a1 + 2776) & 0x80000000) != 0)
                return;
              v175 = (void *)objc_msgSend((id)a1, "_listDefinitions");
              v176 = (void *)objc_msgSend(v175, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend((id)a1, "_currentListNumber")));
              if (!v176)
                return;
              v177 = v176;
              v178 = *(int *)(a1 + 2776);
              if (objc_msgSend(v176, "count") <= v178)
                return;
              v172 = (void *)objc_msgSend((id)a1, "_mutableParagraphStyle");
              v179 = (void *)objc_msgSend(v172, "tabStops");
              objc_msgSend(v172, "setTextLists:", objc_msgSend(v177, "subarrayWithRange:", 0, *(int *)(a1 + 2776) + 1));
              if ((unint64_t)objc_msgSend(v179, "count") < 2)
                return;
              v174 = v179;
LABEL_369:
              v180 = (void *)objc_msgSend(v174, "objectAtIndex:", 1);
              v181 = +[NSTextTab allocWithZone:](NSTextTab, "allocWithZone:", objc_msgSend(v172, "zone"));
              objc_msgSend(v180, "location");
              v303 = -[NSTextTab initWithTextAlignment:location:options:](v181, "initWithTextAlignment:location:options:", 4, objc_msgSend(v180, "options"), v182);
              objc_msgSend(v172, "removeTabStop:", v180);
              objc_msgSend(v172, "addTabStop:", v303);

              break;
            case 'p':
              objc_msgSend((id)a1, "_setTableNestingLevel:", *(int *)(a1 + 2776));
              return;
            case 'q':
              v136 = (void *)objc_msgSend((id)a1, "_mutableParagraphStyle");
              v2 = (double)*(int *)(a1 + 2776) / 20.0;
              *(float *)&v2 = v2;
              goto LABEL_520;
            case 'r':
              v183 = (void *)objc_msgSend((id)a1, "_mutableParagraphStyle");
              v184 = (double)*(int *)(a1 + 2776) / 20.0;
              *(float *)&v184 = v184;
              objc_msgSend(v183, "setTighteningFactorForTruncation:", v184);
              return;
            case 's':
              v47 = (void *)objc_msgSend((id)a1, "_mutableParagraphStyle");
              v157 = -1;
              goto LABEL_374;
            case 't':
              objc_msgSend((id)objc_msgSend((id)a1, "_mutableParagraphStyle"), "setSpansAllLines:", 1);
              return;
            case 'u':
              objc_msgSend((id)objc_msgSend((id)a1, "_mutableParagraphStyle"), "setHorizontalAlignment:", *(int *)(a1 + 2776));
              return;
            case 'v':
              objc_msgSend((id)objc_msgSend((id)a1, "_mutableParagraphStyle"), "setFullyJustified:", 1);
              return;
            default:
              return;
          }
          return;
      }
      return;
    case 0xC:
      v55 = *(unsigned __int8 *)(*(int *)(a1 + 2760) + a1 + 1735);
      switch(*(_DWORD *)(a1 + 2772))
      {
        case 0:
          v56 = (void *)objc_msgSend((id)a1, "mutableAttributes");
          v225 = *(_DWORD *)(a1 + 410);
          *(_QWORD *)(a1 + 384) = 0x4028000000000000;
          *(_DWORD *)(a1 + 410) = v225 & 0xFFFFFFF8;
          processFont(a1, 0);
          objc_msgSend(v56, "removeObjectForKey:", CFSTR("NSBaselineOffset"));
          objc_msgSend(v56, "removeObjectForKey:", CFSTR("NSSuperScript"));
          objc_msgSend(v56, "removeObjectForKey:", CFSTR("NSKern"));
          objc_msgSend(v56, "removeObjectForKey:", CFSTR("NSUnderline"));
          objc_msgSend(v56, "removeObjectForKey:", CFSTR("NSStrikethrough"));
          objc_msgSend(v56, "removeObjectForKey:", CFSTR("NSColor"));
          objc_msgSend(v56, "removeObjectForKey:", CFSTR("NSBackgroundColor"));
          objc_msgSend(v56, "removeObjectForKey:", CFSTR("NSStrokeColor"));
          objc_msgSend(v56, "removeObjectForKey:", CFSTR("NSUnderlineColor"));
          objc_msgSend(v56, "removeObjectForKey:", CFSTR("NSStrikethroughColor"));
          objc_msgSend(v56, "removeObjectForKey:", CFSTR("NSStrokeWidth"));
          objc_msgSend(v56, "removeObjectForKey:", CFSTR("NSShadow"));
          objc_msgSend(v56, "removeObjectForKey:", CFSTR("NSObliqueness"));
          objc_msgSend(v56, "removeObjectForKey:", CFSTR("NSExpansion"));
          objc_msgSend(v56, "removeObjectForKey:", CFSTR("NSTextHighlightStyle"));
          v224 = NSTextHighlightColorSchemeAttributeName;
          goto LABEL_569;
        case 1:
          v226 = v55 != 48;
          v227 = (unsigned int *)(a1 + 410);
          v228 = *(_DWORD *)(a1 + 410) & 0xFFFFFFFA | v226;
          goto LABEL_547;
        case 4:
          v229 = *(_DWORD *)(a1 + 2776);
          if (v229 == -1000000)
          {
            v279 = -6.0;
            goto LABEL_774;
          }
          if (!v229)
            goto LABEL_551;
          v230 = -v229;
          goto LABEL_745;
        case 5:
        case 0x1A:
          if (*(_DWORD *)(a1 + 2776) == -1000000)
            *(_DWORD *)(a1 + 2776) = 1;
          v56 = (void *)objc_msgSend((id)a1, "mutableAttributes");
          if (*(_DWORD *)(a1 + 2772) == 5)
            v132 = -*(_DWORD *)(a1 + 2776);
          else
            v132 = *(_DWORD *)(a1 + 2776);
          v133 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v132);
          v134 = (const __CFString **)&NSSuperscriptAttributeName;
          goto LABEL_755;
        case 6:
          v222 = (void *)objc_msgSend((id)a1, "mutableAttributes");
          v223 = (__CFString **)&NSSuperscriptAttributeName;
          goto LABEL_769;
        case 7:
          v231 = *(_DWORD *)(a1 + 2776);
          if (!v231)
            goto LABEL_734;
          v232 = *(_DWORD *)(a1 + 340);
          if (v232 == -1)
            v232 = 80;
          v233 = v232 > 102 || v232 == 0;
          v234 = 0.5;
          if (v233)
            v234 = 0.25;
          v235 = v234 * (double)v231;
          goto LABEL_735;
        case 8:
          v236 = *(_DWORD *)(a1 + 2776);
          if (v236)
            v235 = (double)v236 / 20.0;
          else
LABEL_734:
            v235 = 0.0;
LABEL_735:
          *(double *)(a1 + 392) = v235;
          goto LABEL_736;
        case 9:
          if (!*(_DWORD *)(a1 + 2776))
          {
            *(_QWORD *)(a1 + 392) = 0xC0F86A0000000000;
            goto LABEL_736;
          }
          if ((*(_BYTE *)(a1 + 410) & 0x10) != 0)
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "mutableAttributes"), "objectForKey:", CFSTR("NSKern")), "doubleValue");
            if (v286 != 0.0)
              goto LABEL_736;
          }
          else if (*(double *)(a1 + 392) != -100000.0)
          {
            goto LABEL_736;
          }
          *(_QWORD *)(a1 + 392) = 0;
LABEL_736:
          v161 = (unsigned int *)(a1 + 410);
          v162 = *(_DWORD *)(a1 + 410) & 0xFFFFFFEF;
LABEL_737:
          *v161 = v162;
          return;
        case 0xA:
          processFont(a1, *(int *)(a1 + 2776));
          goto LABEL_585;
        case 0xB:
          v237 = (double)*(int *)(a1 + 2776) * 0.5;
          goto LABEL_583;
        case 0xC:
          v238 = v55 != 48;
          v227 = (unsigned int *)(a1 + 410);
          v228 = *(_DWORD *)(a1 + 410) & 0xFFFFFFF9 | (2 * v238);
LABEL_547:
          *v227 = v228;
          return;
        case 0x12:
        case 0x44:
        case 0x45:
        case 0x46:
        case 0x49:
        case 0x4A:
          v74 = (void *)objc_msgSend((id)a1, "mutableAttributes");
          v75 = v74;
          if (*(_DWORD *)(a1 + 2772) == 18 && !*(_DWORD *)(a1 + 2776))
          {
            v222 = (void *)objc_msgSend((id)a1, "mutableAttributes");
            v223 = (__CFString **)&NSShadowAttributeName;
            goto LABEL_769;
          }
          v76 = (void *)objc_msgSend(v74, "objectForKey:", CFSTR("NSShadow"));
          v77 = v76;
          if (v76 && *(_DWORD *)(a1 + 2772) != 18)
            v78 = (NSShadow *)objc_msgSend(v76, "copy");
          else
            v78 = objc_alloc_init(NSShadow);
          v185 = v78;
          v186 = *(_DWORD *)(a1 + 2772);
          switch(v186)
          {
            case 'D':
              v187 = (double)*(int *)(a1 + 2776) / 20.0;
              objc_msgSend(v77, "shadowOffset");
              v188 = v185;
              v189 = v187;
              goto LABEL_740;
            case 'E':
              objc_msgSend(v77, "shadowOffset");
              goto LABEL_739;
            case 'F':
              -[NSShadow setShadowBlurRadius:](v78, "setShadowBlurRadius:", (double)*(int *)(a1 + 2776) / 20.0);
              goto LABEL_744;
            case 'G':
            case 'H':
              goto LABEL_744;
            case 'I':
              *(_QWORD *)bytes = 0;
              __endptr[0] = 0;
              v312 = 0.0;
              v278 = *(_DWORD *)(a1 + 2776);
              objc_msgSend(-[NSShadow shadowColor](v78, "shadowColor"), "getRed:green:blue:alpha:", bytes, __endptr, &v312, 0);
              -[NSShadow setShadowColor:](v185, "setShadowColor:", objc_msgSend((Class)getNSColorClass_3[0](), "colorWithCalibratedRed:green:blue:alpha:", *(double *)bytes, *(double *)__endptr, v312, (double)v278 / 255.0));
              goto LABEL_744;
            case 'J':
              processColor((_DWORD *)a1, *(int *)(a1 + 2776), 5, v78);
              goto LABEL_744;
            default:
              if (v186 != 18)
                goto LABEL_744;
              v189 = 3.0;
LABEL_739:
              v188 = v185;
LABEL_740:
              -[NSShadow setShadowOffset:](v188, "setShadowOffset:", v189);
LABEL_744:
              objc_msgSend(v75, "setObject:forKey:", v185, CFSTR("NSShadow"));

              break;
          }
          return;
        case 0x13:
        case 0x25:
        case 0x2E:
          v79 = (void *)objc_msgSend((id)a1, "mutableAttributes");
          v56 = v79;
          if (!*(_DWORD *)(a1 + 2776))
          {
            objc_msgSend(v79, "removeObjectForKey:", CFSTR("NSStrikethrough"));
            v224 = (__CFString **)&NSStrikethroughColorAttributeName;
            goto LABEL_569;
          }
          v80 = *(_DWORD *)(a1 + 2772);
          v81 = 9;
          if (v80 != 46)
            v81 = 1;
          if (v80 == 37)
            v82 = 32769;
          else
            v82 = v81;
          v83 = (void *)MEMORY[0x1E0CB37E8];
          goto LABEL_572;
        case 0x14:
        case 0x15:
        case 0x16:
        case 0x18:
        case 0x30:
        case 0x31:
        case 0x32:
        case 0x33:
        case 0x34:
        case 0x35:
        case 0x36:
        case 0x37:
        case 0x38:
        case 0x39:
        case 0x3A:
        case 0x3B:
        case 0x3C:
          v56 = (void *)objc_msgSend((id)a1, "mutableAttributes");
          if (!*(_DWORD *)(a1 + 2776))
            goto LABEL_568;
          v57 = *(_DWORD *)(a1 + 2772);
          if (v57 <= 47)
          {
            switch(v57)
            {
              case 21:
                v58 = 257;
                break;
              case 22:
LABEL_395:
                v58 = 9;
                break;
              case 24:
                v58 = 32769;
                break;
              default:
LABEL_752:
                v58 = 1;
                break;
            }
          }
          else
          {
            switch(v57)
            {
              case '0':
              case '3':
                v58 = 513;
                break;
              case '1':
                v58 = 769;
                break;
              case '2':
                v58 = 1025;
                break;
              case '4':
              case '<':
                v58 = 2;
                break;
              case '5':
                v58 = 258;
                break;
              case '6':
              case '9':
                v58 = 514;
                break;
              case '7':
                v58 = 770;
                break;
              case '8':
                v58 = 1026;
                break;
              case ';':
                goto LABEL_395;
              default:
                goto LABEL_752;
            }
          }
          v243 = (void *)MEMORY[0x1E0CB37E8];
          goto LABEL_754;
        case 0x17:
          v222 = (void *)objc_msgSend((id)a1, "mutableAttributes");
          v223 = (__CFString **)&NSUnderlineStyleAttributeName;
          goto LABEL_769;
        case 0x19:
          v230 = *(_DWORD *)(a1 + 2776);
          if (v230 == -1000000)
          {
            v279 = 6.0;
          }
          else
          {
            if (!v230)
            {
LABEL_551:
              v222 = (void *)objc_msgSend((id)a1, "mutableAttributes");
              v223 = (__CFString **)&NSBaselineOffsetAttributeName;
              goto LABEL_769;
            }
LABEL_745:
            v279 = (double)v230 * 0.5;
          }
LABEL_774:
          v284 = objc_msgSend((id)a1, "mutableAttributes");
          v133 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v279);
          v285 = (__CFString **)&NSBaselineOffsetAttributeName;
          goto LABEL_775;
        case 0x1C:
          v163 = *(int *)(a1 + 2776);
          v164 = (_DWORD *)a1;
          v165 = 0;
          goto LABEL_617;
        case 0x1D:
          v163 = *(int *)(a1 + 2776);
          v164 = (_DWORD *)a1;
          v165 = 1;
          goto LABEL_617;
        case 0x24:
          if (!*(_DWORD *)(a1 + 336))
            processCharacter(a1, *(_WORD *)(a1 + 2776));
          return;
        case 0x26:
          processMSUnicodeChar(a1);
          return;
        case 0x27:
          *(_DWORD *)(a1 + 410) = *(_DWORD *)(a1 + 410) & 0xFFFFFC7F | ((*(_DWORD *)(a1 + 2776) & 7) << 7);
          return;
        case 0x28:
          v239 = *(_DWORD *)(a1 + 2776);
          v56 = (void *)objc_msgSend((id)a1, "mutableAttributes");
          if (v239)
          {
            v133 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(int *)(a1 + 2776));
            v134 = (const __CFString **)&NSCharacterShapeAttributeName;
            goto LABEL_755;
          }
          v224 = (__CFString **)&NSCharacterShapeAttributeName;
          goto LABEL_569;
        case 0x29:
          v240 = *(_DWORD *)(a1 + 2776);
          v56 = (void *)objc_msgSend((id)a1, "mutableAttributes");
          if (v240 == 1)
          {
            v224 = (__CFString **)&NSLigatureAttributeName;
            goto LABEL_569;
          }
          v133 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(int *)(a1 + 2776));
          v134 = (const __CFString **)&NSLigatureAttributeName;
          goto LABEL_755;
        case 0x2F:
          v163 = *(int *)(a1 + 2776);
          v164 = (_DWORD *)a1;
          v165 = 3;
          goto LABEL_617;
        case 0x3D:
          v241 = *(_DWORD *)(a1 + 2776);
          v56 = (void *)objc_msgSend((id)a1, "mutableAttributes");
          if (v241)
          {
            v133 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)*(int *)(a1 + 2776) / 20.0);
            v134 = (const __CFString **)&NSStrokeWidthAttributeName;
            goto LABEL_755;
          }
          v224 = (__CFString **)&NSStrokeWidthAttributeName;
          goto LABEL_569;
        case 0x3E:
          v163 = *(int *)(a1 + 2776);
          v164 = (_DWORD *)a1;
          v165 = 2;
          goto LABEL_617;
        case 0x3F:
          v242 = *(_DWORD *)(a1 + 2776);
          v56 = (void *)objc_msgSend((id)a1, "mutableAttributes");
          if (!v242)
          {
LABEL_568:
            v224 = (__CFString **)&NSUnderlineStyleAttributeName;
            goto LABEL_569;
          }
          v243 = (void *)MEMORY[0x1E0CB37E8];
          v58 = *(int *)(a1 + 2776);
LABEL_754:
          v133 = objc_msgSend(v243, "numberWithUnsignedInteger:", v58);
          v134 = (const __CFString **)&NSUnderlineStyleAttributeName;
          goto LABEL_755;
        case 0x40:
          v245 = *(_DWORD *)(a1 + 2776);
          v56 = (void *)objc_msgSend((id)a1, "mutableAttributes");
          if (!v245)
          {
            v224 = (__CFString **)&NSStrikethroughStyleAttributeName;
            goto LABEL_569;
          }
          v83 = (void *)MEMORY[0x1E0CB37E8];
          v82 = *(int *)(a1 + 2776);
LABEL_572:
          v133 = objc_msgSend(v83, "numberWithUnsignedInteger:", v82);
          v134 = (const __CFString **)&NSStrikethroughStyleAttributeName;
          goto LABEL_755;
        case 0x41:
          v163 = *(int *)(a1 + 2776);
          v164 = (_DWORD *)a1;
          v165 = 4;
LABEL_617:
          processColor(v164, v163, v165, 0);
          return;
        case 0x42:
          v246 = *(_DWORD *)(a1 + 2776);
          v56 = (void *)objc_msgSend((id)a1, "mutableAttributes");
          if (v246)
          {
            v133 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)*(int *)(a1 + 2776) / 20.0 / 100.0);
            v134 = (const __CFString **)&NSObliquenessAttributeName;
            goto LABEL_755;
          }
          v224 = (__CFString **)&NSObliquenessAttributeName;
          goto LABEL_569;
        case 0x43:
          v247 = *(_DWORD *)(a1 + 2776);
          v56 = (void *)objc_msgSend((id)a1, "mutableAttributes");
          if (v247)
          {
            v133 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)*(int *)(a1 + 2776) / 20.0 / 100.0);
            v134 = (const __CFString **)&NSExpansionAttributeName;
LABEL_755:
            v280 = *v134;
            v281 = v56;
            goto LABEL_756;
          }
          v224 = (__CFString **)&NSExpansionAttributeName;
LABEL_569:
          v244 = *v224;
          v222 = v56;
          goto LABEL_770;
        case 0x47:
          TypographyFeatures = readTypographyFeatures((_DWORD *)a1);
          objc_msgSend((id)a1, "_updateAttributes");
          v249 = (void *)objc_msgSend((id)a1, "mutableAttributes");
          v250 = (void *)objc_msgSend((id)objc_msgSend(v249, "objectForKey:", CFSTR("NSFont")), "fontDescriptor");
          v251 = v250;
          if (TypographyFeatures)
          {
            if (v250)
              v252 = (void *)objc_msgSend((id)objc_msgSend(v250, "fontAttributes"), "mutableCopyWithZone:", 0);
            else
              v252 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
            v283 = v252;
            objc_msgSend(v252, "setObject:forKey:", TypographyFeatures, *MEMORY[0x1E0CA8320]);
            if (!v283)
              return;
          }
          else
          {
            v282 = *MEMORY[0x1E0CA8320];
            if (objc_msgSend(v250, "objectForKey:", *MEMORY[0x1E0CA8320]))
            {
              v283 = (void *)objc_msgSend((id)objc_msgSend(v251, "fontAttributes"), "mutableCopyWithZone:", 0);
              objc_msgSend(v283, "removeObjectForKey:", v282);
            }
            else
            {
              v283 = 0;
            }
            v296 = *MEMORY[0x1E0CA8338];
            if (objc_msgSend(v251, "objectForKey:", *MEMORY[0x1E0CA8338]))
            {
              if (!v283)
                v283 = (void *)objc_msgSend((id)objc_msgSend(v251, "fontAttributes"), "mutableCopyWithZone:", 0);
              objc_msgSend(v283, "removeObjectForKey:", v296);
            }
            if (!v283)
              return;
            if (objc_msgSend(v283, "count") == 2)
            {
              v297 = objc_msgSend(v283, "objectForKey:", CFSTR("NSFontNameAttribute"));
              v298 = (void *)objc_msgSend(v283, "objectForKey:", CFSTR("NSFontSizeAttribute"));
              if (v297)
              {
                if (v298)
                {
                  objc_msgSend(v298, "doubleValue");
                  v299 = +[UIFont _fontWithName:size:](UIFont, "_fontWithName:size:", v297);
                  if (v299)
                    goto LABEL_834;
                }
              }
            }
          }
          v300 = objc_msgSend(*(id *)(a1 + 2960), "objectForKey:", v283);
          if (!v300)
          {
            v299 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", +[UIFontDescriptor fontDescriptorWithFontAttributes:](UIFontDescriptor, "fontDescriptorWithFontAttributes:", v283), 0.0);
            v301 = *(id *)(a1 + 2960);
            if (!v301)
            {
              v301 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              *(_QWORD *)(a1 + 2960) = v301;
            }
            objc_msgSend(v301, "setObject:forKey:", v299, v283);

            if (!v299)
              return;
LABEL_838:
            v281 = v249;
            v133 = (uint64_t)v299;
            v280 = CFSTR("NSFont");
            goto LABEL_756;
          }
          v299 = (UIFont *)v300;
LABEL_834:

          goto LABEL_838;
        case 0x48:
          v237 = (double)*(int *)(a1 + 2776) / 1000.0;
LABEL_583:
          *(double *)(a1 + 384) = v237;
          goto LABEL_585;
        case 0x4C:
          *(_WORD *)(a1 + 408) = *(_DWORD *)(a1 + 2776);
LABEL_585:
          v161 = (unsigned int *)(a1 + 410);
          v162 = *(_DWORD *)(a1 + 410) & 0xFFFFFFFB;
          goto LABEL_737;
        case 0x4D:
          FontPaletteColors = readFontPaletteColors((_DWORD *)a1);
          if (objc_msgSend(FontPaletteColors, "count"))
          {
            objc_msgSend((id)a1, "_updateAttributes");
            v254 = (void *)objc_msgSend((id)a1, "mutableAttributes");
            v255 = (void *)objc_msgSend((id)objc_msgSend(v254, "objectForKey:", CFSTR("NSFont")), "fontDescriptor");
            __endptr[0] = *(char **)MEMORY[0x1E0CA83B0];
            *(_QWORD *)bytes = FontPaletteColors;
            v256 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", objc_msgSend(v255, "fontDescriptorByAddingAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", bytes, __endptr, 1)), 0.0);
            if (v256)
              objc_msgSend(v254, "setObject:forKey:", v256, CFSTR("NSFont"));
          }
          return;
        case 0x4E:
          v257 = *(int *)(a1 + 2776);
          if (!(_DWORD)v257)
          {
            v222 = (void *)objc_msgSend((id)a1, "mutableAttributes");
            v223 = NSTextHighlightStyleAttributeName;
            goto LABEL_769;
          }
          if ((v257 & 0x80000000) != 0)
            v258 = +[NSRTFReader defaultTextHighlightStyles](NSRTFReader, "defaultTextHighlightStyles");
          else
            v258 = *(NSArray **)(a1 + 3008);
          if ((int)v257 < 0)
            v294 = ~v257;
          else
            v294 = v257 - 1;
          if (v294 >= -[NSArray count](v258, "count"))
            return;
          v284 = objc_msgSend((id)a1, "mutableAttributes");
          v133 = -[NSArray objectAtIndexedSubscript:](v258, "objectAtIndexedSubscript:", v294);
          v285 = NSTextHighlightStyleAttributeName;
          goto LABEL_775;
        case 0x4F:
          v259 = *(int *)(a1 + 2776);
          if ((_DWORD)v259)
          {
            if ((v259 & 0x80000000) != 0)
              v260 = +[NSRTFReader defaultTextHighlightColorSchemes](NSRTFReader, "defaultTextHighlightColorSchemes");
            else
              v260 = *(NSArray **)(a1 + 3016);
            if ((int)v259 < 0)
              v295 = ~v259;
            else
              v295 = v259 - 1;
            if (v295 < -[NSArray count](v260, "count"))
            {
              v284 = objc_msgSend((id)a1, "mutableAttributes");
              v133 = -[NSArray objectAtIndexedSubscript:](v260, "objectAtIndexedSubscript:", v295);
              v285 = NSTextHighlightColorSchemeAttributeName;
LABEL_775:
              v280 = *v285;
              v281 = (void *)v284;
LABEL_756:
              objc_msgSend(v281, "setObject:forKey:", v133, v280);
            }
          }
          else
          {
            v222 = (void *)objc_msgSend((id)a1, "mutableAttributes");
            v223 = NSTextHighlightColorSchemeAttributeName;
LABEL_769:
            v244 = *v223;
LABEL_770:
            objc_msgSend(v222, "removeObjectForKey:", v244);
          }
          return;
        default:
          return;
      }
    case 0x17:
      if (*(_DWORD *)(a1 + 2772) == 2)
        *(_DWORD *)(a1 + 372) = CFStringConvertWindowsCodepageToEncoding(*(_DWORD *)(a1 + 2776));
      return;
    case 0x1C:
      if (*(_DWORD *)(a1 + 2772) != 22)
        return;
      if (!*(_BYTE *)(a1 + 3024))
      {
        v71 = 0;
        while (1)
        {
          do
            _NSRTFGetToken((_DWORD *)(a1 + 536));
          while (*(_DWORD *)(a1 + 2764) != 1);
          v72 = *(_DWORD *)(a1 + 2768);
          if (v72 == 1)
          {
            if (!v71)
              goto LABEL_91;
            --v71;
          }
          if (!v72)
            ++v71;
        }
      }
      v37 = *(_DWORD *)(a1 + 340);
      if (v37 == -1)
        v37 = 80;
      v38 = (double)*(int *)(a1 + 344) / 1000.0 + (double)v37;
      if (v38 >= 810.0 && v38 <= 824.0)
      {
        _NSRTFGetToken((_DWORD *)(a1 + 536));
        if (*(_DWORD *)(a1 + 2764) != 3
          || *(_DWORD *)(a1 + 2768) != 6
          || *(_DWORD *)(a1 + 2772) != 37
          || (_NSRTFRouteToken(a1 + 536), _NSRTFGetToken((_DWORD *)(a1 + 536)), *(_DWORD *)(a1 + 2764) != 1)
          || *(_DWORD *)(a1 + 2768) != 1)
        {
LABEL_91:
          _NSRTFUngetToken(a1 + 536);
          return;
        }
      }
      return;
    case 0x1D:
      if (*(_DWORD *)(a1 + 356) == -1)
      {
        v39 = *(_DWORD *)(a1 + 2772);
        if (v39 <= 3 && v39 != 1)
          *(_DWORD *)(a1 + 356) = v39;
      }
      return;
    default:
      return;
  }
}

void sub_18D6995DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  va_list va1;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va2;

  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v8 = va_arg(va2, _QWORD);
  v10 = va_arg(va2, _QWORD);
  v11 = va_arg(va2, _QWORD);
  v12 = va_arg(va2, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);
  _Unwind_Resume(a1);
}

void groupClass(_DWORD *a1)
{
  int v2;

  flushCharacters((uint64_t)a1, 1);
  v2 = a1[692];
  if (v2 == 1)
  {
    objc_msgSend(a1, "_popState");
  }
  else if (!v2)
  {
    objc_msgSend(a1, "_pushState");
  }
}

Class initNSColor_3()
{
  Class result;

  __NSGetFrameworkReference(0, 0);
  result = objc_getClass("NSColor");
  classNSColor_3 = (uint64_t)result;
  if (!result)
    initNSColor_cold_1_3();
  getNSColorClass_3[0] = NSColorFunction_3;
  return result;
}

uint64_t NSColorFunction_3()
{
  return classNSColor_3;
}

void flushCharacters(uint64_t a1, char a2)
{
  CFIndex v2;
  const UniChar *v4;
  CFStringRef v5;
  CFStringRef v7;
  CFIndex v8;
  CFStringRef v9;

  v2 = *(_QWORD *)(a1 + 328);
  if (v2)
  {
    *(_QWORD *)(a1 + 328) = 0;
    v4 = (const UniChar *)(a1 + 72);
    if (*(_BYTE *)(a1 + 2808))
    {
      v5 = CFStringCreateWithCharactersNoCopy(0, v4, v2, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
    }
    else
    {
      v7 = CFStringCreateWithBytes(0, (const UInt8 *)v4, v2, *(_DWORD *)(a1 + 368), 0);
      v5 = v7;
      if (v2 >= 2 && (*(_BYTE *)(a1 + 410) & 0x40) != 0 && !v7)
      {
        v8 = v2 - 1;
        v9 = CFStringCreateWithBytes(0, (const UInt8 *)v4, v8, *(_DWORD *)(a1 + 368), 0);
        v5 = v9;
        if ((a2 & 1) == 0)
        {
          if (v9)
          {
            *(_BYTE *)(a1 + 72) = *((_BYTE *)v4 + v8);
            *(_QWORD *)(a1 + 328) = 1;
            goto LABEL_11;
          }
        }
      }
    }
    if (!v5)
    {
LABEL_12:
      *(_BYTE *)(a1 + 2808) = 0;
      return;
    }
LABEL_11:
    objc_msgSend((id)a1, "processString:", v5);
    CFRelease(v5);
    goto LABEL_12;
  }
}

uint64_t SaveMetadataInfo(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@Range"), a3);
  if (*(_QWORD *)(a1 + 560) > a2)
    objc_msgSend((id)-[NSRTFReader _documentInfoDictionary](a1), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a2, *(_QWORD *)(a1 + 560) + ~a2), v5);
  return objc_msgSend((id)-[NSRTFReader _documentInfoDictionary](a1), "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 560)), CFSTR("NSRTFMetadataEndLocation"));
}

uint64_t readDate(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (void *)objc_opt_new();
  _NSRTFGetToken((_DWORD *)(a1 + 536));
  if (*(_DWORD *)(a1 + 2764) != 3)
    goto LABEL_15;
  v3 = 0x8000000000000000;
  do
  {
    if (*(_DWORD *)(a1 + 2768) != 6)
      break;
    v4 = *(_DWORD *)(a1 + 2772);
    switch(v4)
    {
      case 6:
        objc_msgSend(v2, "setYear:", *(int *)(a1 + 2776));
        break;
      case 7:
        objc_msgSend(v2, "setMonth:", *(int *)(a1 + 2776));
        break;
      case 8:
        objc_msgSend(v2, "setDay:", *(int *)(a1 + 2776));
        break;
      case 9:
        objc_msgSend(v2, "setHour:", *(int *)(a1 + 2776));
        break;
      case 10:
        objc_msgSend(v2, "setMinute:", *(int *)(a1 + 2776));
        break;
      case 11:
        objc_msgSend(v2, "setSecond:", *(int *)(a1 + 2776));
        break;
      default:
        if (v4 == 58)
          v3 = *(int *)(a1 + 2776);
        break;
    }
    _NSRTFGetToken((_DWORD *)(a1 + 536));
  }
  while (*(_DWORD *)(a1 + 2764) == 3);
  if (v3 != 0x8000000000000000)
  {
    v8 = objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v3);
  }
  else
  {
LABEL_15:
    v5 = *(void **)(a1 + 2952);
    if (!v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0C99D48]);
      v7 = (void *)objc_msgSend(v6, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
      *(_QWORD *)(a1 + 2952) = v7;
      objc_msgSend(v7, "setTimeZone:", objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone"));
      v5 = *(void **)(a1 + 2952);
    }
    v8 = objc_msgSend(v5, "dateFromComponents:", v2);
  }
  v9 = v8;

  if (*(_DWORD *)(a1 + 2764) != 1 || *(_DWORD *)(a1 + 2768) != 1)
    _NSRTFSkipGroup((_DWORD *)(a1 + 536));
  _NSRTFRouteToken(a1 + 536);
  return v9;
}

uint64_t readNeXTGraphic(uint64_t a1, int a2)
{
  int v4;
  int v5;
  _BOOL4 v6;
  unint64_t v7;
  CFIndex v8;
  CFIndex v10;
  double v11;
  unint64_t v12;
  NSAdaptiveImageGlyph *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  CFStringRef v20;
  id v21;
  __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  __CFString *v26;
  uint64_t v27;
  objc_class *v28;
  int v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v34;
  __CFString *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  BOOL v39;
  BOOL v40;
  uint64_t v41;
  UInt8 bytes[1024];
  UInt8 v43[1024];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v39 = 1;
LABEL_6:
    v40 = +[NSAdaptiveImageGlyph _readsAdaptiveImageGlyphFromDocumentFormats](NSAdaptiveImageGlyph, "_readsAdaptiveImageGlyphFromDocumentFormats");
    goto LABEL_8;
  }
  v4 = *(_DWORD *)(a1 + 340);
  if (v4 == -1)
    v5 = 80;
  else
    v5 = *(_DWORD *)(a1 + 340);
  v39 = (double)*(int *)(a1 + 344) / 1000.0 + (double)v5 < 988.0;
  if (v4 <= 2781)
    goto LABEL_6;
  v40 = 0;
LABEL_8:
  v6 = +[NSAdaptiveImageGlyph prefersEmojiImageTextAttachment](NSAdaptiveImageGlyph, "prefersEmojiImageTextAttachment");
  _NSRTFGetToken((_DWORD *)(a1 + 536));
  if (*(_DWORD *)(a1 + 2764) == 2)
  {
    v7 = 0;
    do
    {
      v8 = v7 + 1;
      v43[v7] = *(_DWORD *)(a1 + 2768);
      _NSRTFGetToken((_DWORD *)(a1 + 536));
      if (*(_DWORD *)(a1 + 2764) != 2)
        break;
    }
    while (v7++ < 0x3FF);
    if (v8 == 1)
    {
      v10 = 1;
    }
    else if (v43[v8 - 1] == 32)
    {
      v10 = v8 - 1;
    }
    else
    {
      v10 = v8;
    }
  }
  else
  {
    v10 = 0;
  }
  v11 = 0.0;
  if ((a2 & 1) == 0 && _NSRTFGetToken((_DWORD *)(a1 + 536)) != 4)
  {
    v12 = 0;
    v15 = 0;
    v38 = 0;
    v16 = 1;
    v37 = 1;
    v41 = 1;
    while (1)
    {
      v17 = *(_DWORD *)(a1 + 2764);
      if ((v15 & 1) != 0 && v17 == 2 && v12 <= 0x3FF)
      {
        bytes[v12++] = *(_DWORD *)(a1 + 2768);
LABEL_32:
        v15 = 1;
      }
      else
      {
        if (v17 == 3)
        {
          if (*(_DWORD *)(a1 + 2768) == 15)
          {
            switch(*(_DWORD *)(a1 + 2772))
            {
              case 5:
                v15 = 0;
                v39 = 1;
                goto LABEL_50;
              case 6:
                v37 = 0;
                goto LABEL_49;
              case 7:
                v15 = 0;
                v11 = (double)*(int *)(a1 + 2776) / 20.0;
                goto LABEL_50;
              case 8:
                v15 = 0;
                v38 = *(int *)(a1 + 2776);
                goto LABEL_50;
              case 9:
                v41 = 0;
                goto LABEL_49;
              case 0xA:
                v15 = 0;
                v19 = 2;
                goto LABEL_55;
              case 0xB:
                v15 = 0;
                v19 = 1;
                goto LABEL_55;
              case 0xC:
                v15 = 0;
                v19 = 3;
LABEL_55:
                v41 = v19;
                break;
              case 0xD:
                v40 = 1;
                goto LABEL_32;
              default:
                goto LABEL_49;
            }
            goto LABEL_50;
          }
        }
        else if (v17 == 1)
        {
          v18 = *(_DWORD *)(a1 + 2768);
          if (v18 == 1)
          {
            if (v16 < 2)
              goto LABEL_22;
            v15 = 0;
            --v16;
          }
          else
          {
            if (!v18)
              ++v16;
            v15 = 0;
          }
          goto LABEL_50;
        }
LABEL_49:
        v15 = 0;
      }
LABEL_50:
      if (_NSRTFGetToken((_DWORD *)(a1 + 536)) == 4)
        goto LABEL_22;
    }
  }
  v38 = 0;
  v12 = 0;
  v41 = 1;
  v37 = 1;
LABEL_22:
  _NSRTFRouteToken(a1 + 536);
  v13 = 0;
  v14 = 0;
  if (!+[NSAdaptiveImageGlyph prefersTextAttachment](NSAdaptiveImageGlyph, "prefersTextAttachment")
    && v12)
  {
    v13 = (NSAdaptiveImageGlyph *)CFStringCreateWithBytes(0, bytes, v12, 0x8000100u, 0);
    if (v13)
    {
      if (v6)
      {
        v14 = (uint64_t)+[NSEmojiImageTextAttachment emojiImageTextAttachmentForContentIdentifier:](NSEmojiImageTextAttachment, "emojiImageTextAttachmentForContentIdentifier:", v13);
        v13 = 0;
        goto LABEL_59;
      }
      v13 = -[NSAdaptiveImageGlyph initWithContentIdentifier:]([NSAdaptiveImageGlyph alloc], "initWithContentIdentifier:", v13);
    }
    v14 = 0;
  }
LABEL_59:
  if (v14 || !v10)
  {
LABEL_81:
    if (!(v14 | (unint64_t)v13))
      goto LABEL_90;
    goto LABEL_82;
  }
  if (*(_BYTE *)(a1 + 2809))
  {
    v20 = CFStringCreateWithBytes(0, v43, v10, 0x8000100u, 0);
  }
  else
  {
    v21 = objc_alloc(MEMORY[0x1E0CB3940]);
    v20 = (CFStringRef)objc_msgSend(v21, "initWithBytes:length:encoding:", v43, v10, objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
  }
  v22 = (__CFString *)v20;
  v23 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "fileWrappers"), "objectForKey:", v20);
  if (v23)
  {
    v24 = v23;
    v25 = 0;
    v26 = v22;
  }
  else
  {
    v25 = (__CFString *)CFStringCreateWithBytes(0, v43, v10, *(_DWORD *)(a1 + 360), 0);
    v27 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "fileWrappers"), "objectForKey:", v25);
    if (!v27)
    {
      v34 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "fileWrappers"), "keyEnumerator");
      while (1)
      {
        v35 = (__CFString *)objc_msgSend(v34, "nextObject");
        if (!v35)
          break;
        v26 = v35;
        if (!-[__CFString compare:options:range:](v35, "compare:options:range:", v22, 0, 0, -[__CFString length](v35, "length"))|| !-[__CFString compare:options:range:](v26, "compare:options:range:", v25, 0, 0, -[__CFString length](v26, "length")))
        {
          v36 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "fileWrappers"), "objectForKey:", v26);
          if (!v36)
            break;
          v24 = v36;
          goto LABEL_68;
        }
      }
LABEL_76:
      v14 = 0;
      goto LABEL_77;
    }
    v24 = v27;
    v26 = v25;
  }
LABEL_68:
  v28 = textAttachmentClassForDocumentName(v26, v40);
  v29 = -[objc_class isSubclassOfClass:](v28, "isSubclassOfClass:", objc_opt_class());
  if ((v29 & 1) != 0 || !-[objc_class isSubclassOfClass:](v28, "isSubclassOfClass:", objc_opt_class()))
  {
    v14 = objc_msgSend([v28 alloc], "initWithFileWrapper:", v24);
    v30 = 0;
  }
  else
  {
    v13 = (NSAdaptiveImageGlyph *)objc_msgSend([v28 alloc], "initWithFileWrapper:", v24);
    v14 = 0;
    v30 = 1;
  }
  if (!(v14 | (unint64_t)v13))
  {
    if ((v29 | v30) == 1)
    {
      v14 = objc_msgSend(objc_alloc(textAttachmentClassForDocumentName(v26, 0)), "initWithFileWrapper:", v24);
      v13 = 0;
      goto LABEL_77;
    }
    v13 = 0;
    goto LABEL_76;
  }
LABEL_77:

  if (!v14)
    goto LABEL_81;
  if (v39)
    objc_msgSend((id)v14, "setIgnoresOrientation:", 1);
  objc_msgSend((id)v14, "setStandaloneAlignment:", v41);
  objc_msgSend((id)v14, "setEmbeddingType:", v38);
  objc_msgSend((id)v14, "setAllowsTextAttachmentView:", v37 & 1);
  objc_msgSend((id)v14, "setLineLayoutPadding:", v11);
LABEL_82:
  v31 = (void *)objc_msgSend((id)a1, "mutableAttributes");
  if (v13)
  {
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v13, CFSTR("CTAdaptiveImageProvider"));
  }
  else
  {
    objc_msgSend(v31, "setObject:forKey:", v14, CFSTR("NSAttachment"));
    v13 = 0;
  }

  if (!*(_BYTE *)(a1 + 2808))
    flushCharacters(a1, 1);
  v32 = *(_QWORD *)(a1 + 328);
  *(_QWORD *)(a1 + 328) = v32 + 1;
  *(_WORD *)(a1 + 2 * v32 + 72) = -4;
  *(_BYTE *)(a1 + 2808) = 1;
  if (*(_QWORD *)(a1 + 328) >= 0x80uLL)
    flushCharacters(a1, 1);
  flushCharacters(a1, 1);
LABEL_90:
  if (a2)
    return objc_msgSend((id)a1, "_popState");
  _NSRTFSkipGroup((_DWORD *)(a1 + 536));
  return _NSRTFRouteToken(a1 + 536);
}

uint64_t __readFieldInst_block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v1 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  if (v1 < 1)
    return 0;
  v3 = 2 * v1;
  result = (uint64_t)malloc_type_malloc(2 * v1, 0xB9D50CFBuLL);
  if (result)
  {
    v5 = result;
    memcpy((void *)result, *(const void **)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
    if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) != 1000)
      free(*(void **)(*(_QWORD *)(a1[5] + 8) + 24));
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v5;
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v3;
    return 1;
  }
  return result;
}

objc_class *textAttachmentClassForDocumentName(void *a1, int a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_class *result;

  v3 = objc_msgSend(a1, "pathExtension");
  if (!v3)
    return (objc_class *)objc_opt_class();
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v3);
  if (!v4)
    return (objc_class *)objc_opt_class();
  v5 = v4;
  if (!a2
    || !objc_msgSend(v4, "isEqual:", +[NSAdaptiveImageGlyph contentType](NSAdaptiveImageGlyph, "contentType")))
  {
LABEL_10:
    result = +[NSTextAttachment textAttachmentClassForFileType:](NSTextAttachment, "textAttachmentClassForFileType:", objc_msgSend(v5, "identifier"));
    if (result)
      return result;
    return (objc_class *)objc_opt_class();
  }
  if (+[NSAdaptiveImageGlyph prefersEmojiImageTextAttachment](NSAdaptiveImageGlyph, "prefersEmojiImageTextAttachment"))
  {
    result = +[NSTextAttachment textAttachmentClassForFileType:](NSTextAttachment, "textAttachmentClassForFileType:", objc_msgSend(+[NSEmojiImageTextAttachment _UTIForEmojiImage](NSEmojiImageTextAttachment, "_UTIForEmojiImage"), "identifier"));
    if (result)
      return result;
    goto LABEL_10;
  }
  if (+[NSAdaptiveImageGlyph prefersTextAttachment](NSAdaptiveImageGlyph, "prefersTextAttachment"))
    goto LABEL_10;
  result = (objc_class *)objc_opt_class();
  if (!result)
    goto LABEL_10;
  return result;
}

void processCharacter(uint64_t a1, __int16 a2)
{
  uint64_t v4;

  if (!*(_BYTE *)(a1 + 2808))
    flushCharacters(a1, 1);
  v4 = *(_QWORD *)(a1 + 328);
  *(_QWORD *)(a1 + 328) = v4 + 1;
  *(_WORD *)(a1 + 2 * v4 + 72) = a2;
  *(_BYTE *)(a1 + 2808) = 1;
  if (*(_QWORD *)(a1 + 328) >= 0x80uLL)
    flushCharacters(a1, 1);
}

uint64_t colorFromRTFRGB(uint64_t a1, int a2, int a3, int a4)
{
  int v7;
  Class v8;
  double v9;
  double v10;
  double v11;

  v7 = *(_DWORD *)(a1 + 356);
  v8 = (Class)getNSColorClass_3[0]();
  v9 = (double)a2 / 255.0;
  v10 = (double)a3 / 255.0;
  v11 = (double)a4 / 255.0;
  if (v7 == 3)
    return -[objc_class colorWithDisplayP3Red:green:blue:alpha:](v8, "colorWithDisplayP3Red:green:blue:alpha:", v9, v10, v11, 1.0);
  else
    return -[objc_class _disambiguated_due_to_CIImage_colorWithRed:green:blue:alpha:](v8, "_disambiguated_due_to_CIImage_colorWithRed:green:blue:alpha:", v9, v10, v11, 1.0);
}

void *processColor(_DWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *result;
  void *v9;
  void *v10;
  NSAttributedStringKey v11;
  const NSAttributedStringKey *v12;
  int v13;
  double v14;
  const NSAttributedStringKey *v17;
  NSAttributedStringKey v18;
  void *v19;
  void *v20;
  const NSAttributedStringKey *v21;
  double v22;
  double v23;
  double v24;
  double v25;

  result = (void *)getColor((uint64_t)a1, a2);
  v9 = result;
  switch(a3)
  {
    case 0:
      if (!result)
        goto LABEL_6;
      if (onceToken != -1)
        dispatch_once(&onceToken, &__block_literal_global_1_0);
      if ((objc_msgSend(v9, "isEqual:", _black) & 1) != 0)
      {
LABEL_6:
        v10 = (void *)objc_msgSend(a1, "mutableAttributes");
        v12 = &NSForegroundColorAttributeName;
        goto LABEL_36;
      }
      v10 = (void *)objc_msgSend(a1, "mutableAttributes");
      v21 = &NSForegroundColorAttributeName;
      goto LABEL_42;
    case 1:
      if (a1 && a2 == 1)
      {
        v13 = a1[85];
        if (v13 == -1)
          v13 = 80;
        v14 = (double)(int)a1[86] / 1000.0 + (double)v13;
        if (v14 <= 1504.69 && v14 >= 1504.0 || result == 0)
          goto LABEL_35;
      }
      else if (!result)
      {
        goto LABEL_35;
      }
      if (onceToken != -1)
        dispatch_once(&onceToken, &__block_literal_global_34);
      if ((objc_msgSend(v9, "isEqual:", _white) & 1) == 0)
      {
        v10 = (void *)objc_msgSend(a1, "mutableAttributes");
        v21 = &NSBackgroundColorAttributeName;
LABEL_42:
        v11 = *v21;
        return (void *)objc_msgSend(v10, "setObject:forKey:", v9, v11);
      }
LABEL_35:
      v10 = (void *)objc_msgSend(a1, "mutableAttributes");
      v12 = &NSBackgroundColorAttributeName;
LABEL_36:
      v18 = *v12;
      return (void *)objc_msgSend(v10, "removeObjectForKey:", v18, v11);
    case 2:
      v10 = (void *)objc_msgSend(a1, "mutableAttributes");
      v17 = &NSStrokeColorAttributeName;
      goto LABEL_23;
    case 3:
      v10 = (void *)objc_msgSend(a1, "mutableAttributes");
      v17 = &NSUnderlineColorAttributeName;
      goto LABEL_23;
    case 4:
      v10 = (void *)objc_msgSend(a1, "mutableAttributes");
      v17 = &NSStrikethroughColorAttributeName;
LABEL_23:
      v11 = *v17;
      if (v9)
        return (void *)objc_msgSend(v10, "setObject:forKey:", v9, v11);
      v18 = *v17;
      return (void *)objc_msgSend(v10, "removeObjectForKey:", v18, v11);
    case 5:
      v24 = 0.0;
      v25 = 0.0;
      v22 = 0.333333333;
      v23 = 0.0;
      objc_msgSend((id)objc_msgSend(a4, "shadowColor"), "getRed:green:blue:alpha:", 0, 0, 0, &v22);
      objc_msgSend(v9, "getRed:green:blue:alpha:", &v25, &v24, &v23, 0);
      return (void *)objc_msgSend(a4, "setShadowColor:", objc_msgSend((Class)getNSColorClass_3[0](), "colorWithCalibratedRed:green:blue:alpha:", v25, v24, v23, v22));
    case 6:
      if (objc_msgSend(a1, "_currentBorderIsTable"))
        v19 = (void *)objc_msgSend(a1, "_currentTable");
      else
        v19 = (void *)objc_msgSend(a1, "_currentTableCell");
      return (void *)objc_msgSend(v19, "setBorderColor:forEdge:", v9, objc_msgSend(a1, "_currentBorderEdge"));
    case 7:
      v20 = (void *)objc_msgSend(a1, "_currentTableCell");
      return (void *)objc_msgSend(v20, "setBackgroundColor:", v9);
    case 8:
      v20 = (void *)objc_msgSend(a1, "_currentTable");
      return (void *)objc_msgSend(v20, "setBackgroundColor:", v9);
    default:
      return result;
  }
}

const void *getColor(uint64_t a1, uint64_t a2)
{
  const void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  NSString *v9;
  NSString *v10;
  const char *v11;
  const char *v12;
  Class ColorClass;
  void *v14;
  const char *v15;
  uint64_t v16;
  const __CFString *v17;
  CGColorSpace *v18;
  CGColorSpaceRef v19;
  size_t NumberOfComponents;
  uint64_t v21;
  BOOL v22;
  int v23;
  unsigned int *v24;
  double *v25;
  uint64_t v26;
  int v27;
  unsigned int v28;
  int v29;
  unsigned int v30;
  BOOL v31;
  int v32;
  int v34;
  const __CFString **v35;
  const __CFString *v36;
  CGColorRef v37;
  CGColorRef v38;
  int v39;
  int v40;
  uint64_t *v41;
  CGFloat v42[6];

  v42[5] = *(CGFloat *)MEMORY[0x1E0C80C00];
  if (*(uint64_t *)(a1 + 2816) > 0)
    return 0;
  v5 = _NSRTFGetColor(a1 + 536, a2);
  v6 = _NSTextScalingTypeForCurrentEnvironment();
  if (!v5)
    return 0;
  v2 = *(const void **)(v5 + 24);
  if (!v2)
  {
    v7 = v6;
    v8 = *(const char **)(v5 + 32);
    if (v8)
    {
      if (strlen(v8) <= 0x63)
      {
        v9 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", *(_QWORD *)(v5 + 32));
        if (v9)
        {
          v10 = v9;
          v11 = NSSelectorFromString(v9);
          if (v11
            && (v12 = v11, -[NSString hasSuffix:](NSStringFromSelector(v11), "hasSuffix:", CFSTR("Color")))
            && (ColorClass = __NSTextGraphicsContextProviderGetColorClass(v7),
                v14 = (void *)-[objc_class methodSignatureForSelector:](ColorClass, "methodSignatureForSelector:", v12),
                v15 = (const char *)objc_msgSend(v14, "methodReturnType"),
                objc_msgSend(v14, "numberOfArguments") == 2)
            && v15
            && !strcmp(v15, "@"))
          {
            v2 = (const void *)-[objc_class performSelector:](ColorClass, "performSelector:", v12);

            if (v2)
              goto LABEL_77;
          }
          else
          {

          }
        }
      }
    }
    v16 = *(int *)(v5 + 40);
    if (v16 > 5)
      goto LABEL_63;
    v17 = (const __CFString *)**((_QWORD **)&unk_1E26063C8 + v16);
    if (!v17)
      goto LABEL_63;
    v18 = CGColorSpaceCreateWithName(v17);
    if (!v18)
      goto LABEL_63;
    v19 = v18;
    NumberOfComponents = CGColorSpaceGetNumberOfComponents(v18);
    if (!NumberOfComponents
      || ((v21 = *(int *)(v5 + 44), NumberOfComponents != v21) ? (v22 = NumberOfComponents + 1 == v21) : (v22 = 1), !v22))
    {
LABEL_62:
      CFRelease(v19);
      goto LABEL_63;
    }
    if ((int)v21 >= 1)
    {
      v23 = 0;
      v24 = (unsigned int *)(v5 + 48);
      v25 = v42;
      v26 = *(int *)(v5 + 44);
      while (1)
      {
        v28 = *v24++;
        v27 = v28;
        if (v28 > 0x186A0)
        {
          if (v23)
          {
            if (v27 >= 0)
              v29 = 100000;
            else
              v29 = 0;
            if (v23 != 2)
              goto LABEL_39;
            v27 = v29;
          }
          else
          {
            v30 = *(_DWORD *)(v5 + 40);
            v31 = v30 > 4;
            v32 = (1 << v30) & 0x13;
            if (!v31 && v32 != 0)
            {
              v23 = 1;
              goto LABEL_39;
            }
            if (v27 >= 0)
              v27 = 100000;
            else
              v27 = 0;
          }
          v23 = 2;
        }
LABEL_39:
        *v25++ = (double)v27 / 100000.0;
        if (!--v26)
          goto LABEL_45;
      }
    }
    v23 = 0;
LABEL_45:
    if (NumberOfComponents == v21)
      v42[NumberOfComponents] = 1.0;
    if (v23 != 1)
      goto LABEL_58;
    v34 = *(_DWORD *)(v5 + 40);
    if (v34)
    {
      if (v34 != 4)
      {
        if (v34 == 1)
        {
          v35 = (const __CFString **)MEMORY[0x1E0C9D958];
          goto LABEL_56;
        }
LABEL_58:
        if (!v19)
          goto LABEL_63;
        v37 = CGColorCreate(v19, v42);
        if (!v37)
          goto LABEL_62;
        v38 = v37;
        v2 = (const void *)objc_msgSend((Class)getNSColorClass_3[0](), "colorWithCGColor:", v37);
        CFRelease(v38);
        CFRelease(v19);
        if (v2)
          goto LABEL_77;
LABEL_63:
        v39 = *(_DWORD *)(v5 + 4);
        v40 = *(_DWORD *)(v5 + 8);
        if (v39 == v40)
        {
          if (v39 == *(_DWORD *)(v5 + 12))
          {
            if (v39 <= 0)
            {
              if (onceToken != -1)
                dispatch_once(&onceToken, &__block_literal_global_1_0);
              v41 = &_black;
LABEL_74:
              v2 = (const void *)*v41;
              if (!*v41)
              {
                v39 = *(_DWORD *)(v5 + 4);
                v40 = *(_DWORD *)(v5 + 8);
                goto LABEL_76;
              }
LABEL_77:
              *(_QWORD *)(v5 + 24) = CFRetain(v2);
              return v2;
            }
            v40 = *(_DWORD *)(v5 + 4);
            if (v39 == 255)
            {
              if (onceToken != -1)
                dispatch_once(&onceToken, &__block_literal_global_34);
              v41 = &_white;
              goto LABEL_74;
            }
          }
          else
          {
            v40 = *(_DWORD *)(v5 + 4);
          }
        }
LABEL_76:
        v2 = (const void *)colorFromRTFRGB(a1, v39, v40, *(_DWORD *)(v5 + 12));
        goto LABEL_77;
      }
      v35 = (const __CFString **)MEMORY[0x1E0C9D930];
    }
    else
    {
      v35 = (const __CFString **)MEMORY[0x1E0C9D960];
    }
LABEL_56:
    v36 = *v35;
    if (*v35)
    {
      CFRelease(v19);
      v19 = CGColorSpaceCreateWithName(v36);
    }
    goto LABEL_58;
  }
  return v2;
}

Class __NSTextGraphicsContextProviderGetColorClass(uint64_t a1)
{
  if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery](NSTextGraphicsContextProvider, "textGraphicsContextProviderClassRespondsToColorQuery"))
  {
    return (Class)-[objc_class colorClassForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "colorClassForApplicationFrameworkContext:", a1);
  }
  else
  {
    return +[NSTextGraphicsContextProvider __defaultColorClass](NSTextGraphicsContextProvider, "__defaultColorClass");
  }
}

uint64_t processFont(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  NSFont *v5;
  CFStringEncoding SystemEncoding;
  int v7;
  UInt32 v8;
  const char *v9;
  double v10;
  double v11;
  double v12;
  char *v13;
  unsigned int v14;
  __CFString *v15;
  const void *v16;
  unsigned int v17;
  int v18;
  int v20;
  int v22;
  CFStringEncoding v23;

  result = _NSRTFGetFont(a1 + 536, a2);
  v23 = -1;
  if (!result)
  {
    result = NSDefaultFont();
    v5 = (NSFont *)result;
    SystemEncoding = *(_DWORD *)(a1 + 360);
    goto LABEL_78;
  }
  v4 = result;
  v5 = *(NSFont **)(result + 48);
  if (v5)
  {
    SystemEncoding = *(_DWORD *)(result + 64);
    goto LABEL_78;
  }
  v7 = *(_DWORD *)(result + 24);
  if (v7 < 0)
    goto LABEL_35;
  if (v7 <= 161)
  {
    if (v7 > 127)
    {
      switch(v7)
      {
        case 128:
          SystemEncoding = 1056;
          goto LABEL_53;
        case 129:
          SystemEncoding = 1058;
          goto LABEL_53;
        case 130:
          SystemEncoding = 1296;
          goto LABEL_53;
        case 131:
        case 132:
        case 133:
        case 135:
          goto LABEL_34;
        case 134:
          SystemEncoding = 1057;
          goto LABEL_53;
        case 136:
          SystemEncoding = 1059;
          goto LABEL_53;
        default:
          if (v7 != 161)
            goto LABEL_34;
          SystemEncoding = 1283;
          break;
      }
      goto LABEL_53;
    }
    if (!v7)
      goto LABEL_40;
    if (v7 == 2)
    {
      SystemEncoding = 33;
      goto LABEL_53;
    }
    goto LABEL_34;
  }
  if (v7 > 185)
  {
    if (v7 > 221)
    {
      if (v7 == 222)
      {
        SystemEncoding = 1053;
        goto LABEL_53;
      }
      if (v7 == 238)
      {
        SystemEncoding = 1281;
        goto LABEL_53;
      }
    }
    else
    {
      if (v7 == 186)
      {
        SystemEncoding = 1287;
        goto LABEL_53;
      }
      if (v7 == 204)
      {
        SystemEncoding = 1282;
        goto LABEL_53;
      }
    }
    goto LABEL_34;
  }
  if (v7 > 176)
  {
    if (v7 == 177)
    {
      SystemEncoding = 1285;
      goto LABEL_53;
    }
    if (v7 == 178)
    {
      SystemEncoding = 1286;
      goto LABEL_53;
    }
    goto LABEL_34;
  }
  if (v7 == 162)
  {
    SystemEncoding = 1284;
    goto LABEL_53;
  }
  if (v7 != 163)
  {
LABEL_34:
    SystemEncoding = v7 - 77;
    if ((v7 - 77) <= 0x32)
      goto LABEL_53;
LABEL_35:
    if (*(_DWORD *)(a1 + 360) >= 0x100u && *(_DWORD *)(a1 + 336) && *(_DWORD *)(result + 36) == -1)
      goto LABEL_40;
    v8 = *(_DWORD *)(result + 36);
    if (v8 != -1)
    {
      if (v8 == 437)
      {
LABEL_40:
        SystemEncoding = 1280;
        goto LABEL_53;
      }
      SystemEncoding = CFStringConvertWindowsCodepageToEncoding(v8);
      v23 = SystemEncoding;
      if (SystemEncoding != -1)
        goto LABEL_54;
    }
    if (!*(_BYTE *)(a1 + 2809)
      && (v9 = *(const char **)v4) != 0
      && (!strcmp("GothicBBB", *(const char **)v4) || !strcmp("Ryumin", v9)))
    {
      SystemEncoding = 2336;
    }
    else
    {
      if (*(_DWORD *)(a1 + 360) != 2817)
        goto LABEL_56;
      SystemEncoding = 2817;
    }
    goto LABEL_53;
  }
  SystemEncoding = 1288;
LABEL_53:
  v23 = SystemEncoding;
LABEL_54:
  if (*(uint64_t *)(a1 + 2816) > 0)
  {
    v5 = 0;
    goto LABEL_72;
  }
LABEL_56:
  v10 = *(double *)(a1 + 384);
  if (v10 >= 0.0)
    objc_msgSend((id)NSDefaultFont(), "pointSize");
  v11 = -[NSRTFReader _updateFontSizeForTextScalingIfNeeded:](a1, v10);
  v12 = v11;
  if (!*(_QWORD *)v4 || (v5 = (NSFont *)processFontName(*(char **)v4, *(_DWORD *)(a1 + 360), &v23, v11)) == 0)
  {
    v13 = *(char **)(v4 + 8);
    if (!v13 || (v5 = (NSFont *)processFontName(v13, *(_DWORD *)(a1 + 360), &v23, v12)) == 0)
    {
      v14 = *(_DWORD *)(v4 + 20) - 1;
      v15 = v14 > 5 ? CFSTR("Helvetica") : off_1E26063F8[v14];
      v5 = +[NSFont fontWithName:size:](NSFont, "fontWithName:size:", v15, v12);
      if (!v5
        && (*(_DWORD *)(v4 + 20) != 3
         || (v5 = +[UIFont fontWithName:size:](UIFont, "fontWithName:size:", CFSTR("Courier New"), v12)) == 0))
      {
        v5 = +[UIFont systemFontOfSize:](NSFont, "systemFontOfSize:", v12);
        if (!v5)
        {
          v5 = (NSFont *)NSDefaultFont();
          if (!v5)
            raiseRTFException((uint64_t)"Cannot find any font to use");
        }
      }
    }
  }
  SystemEncoding = v23;
  if (v23 != -1)
  {
LABEL_72:
    if (CFStringIsEncodingAvailable(SystemEncoding))
      goto LABEL_75;
    SystemEncoding = CFStringGetSystemEncoding();
    if (SystemEncoding != -1)
      goto LABEL_75;
  }
  SystemEncoding = *(_DWORD *)(a1 + 360);
LABEL_75:
  v16 = v5;
  if (!v5)
    v16 = (const void *)NSDefaultFont();
  result = (uint64_t)CFRetain(v16);
  *(_QWORD *)(v4 + 48) = result;
  *(_DWORD *)(v4 + 64) = SystemEncoding;
LABEL_78:
  v17 = SystemEncoding - 1056;
  v18 = (SystemEncoding == 1057) << 6;
  if (SystemEncoding == 2336)
    v18 = 64;
  if (v17 > 3 || v17 == 1)
    v20 = v18;
  else
    v20 = 64;
  if (SystemEncoding > 0x19 || ((1 << SystemEncoding) & 0x200000E) == 0)
    v22 = v20;
  else
    v22 = 64;
  *(_DWORD *)(a1 + 410) = *(_DWORD *)(a1 + 410) & 0xFFFFFFBF | v22;
  *(_DWORD *)(a1 + 368) = SystemEncoding;
  *(_QWORD *)(a1 + 376) = v5;
  return result;
}

void processMSUnicodeChar(uint64_t a1)
{
  int v2;
  const __CFCharacterSet *Predefined;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  unsigned int v14;
  unint64_t v15;

  v2 = *(unsigned __int16 *)(a1 + 2776);
  if (!_NSValidCharacterSet)
  {
    Predefined = CFCharacterSetGetPredefined(kCFCharacterSetIllegal);
    _NSValidCharacterSet = (uint64_t)CFCharacterSetCreateMutableCopy(0, Predefined);
    CFCharacterSetInvert((CFMutableCharacterSetRef)_NSValidCharacterSet);
  }
  if (v2 == 65533)
  {
    v4 = (void *)objc_msgSend((id)a1, "mutableAttributes");
    if (!objc_msgSend(v4, "objectForKey:", NSGlyphInfoAttributeName))
      return;
  }
  else
  {
    if (!CFCharacterSetIsCharacterMember((CFCharacterSetRef)_NSValidCharacterSet, v2)
      && (*(_WORD *)(a1 + 410) & 0x380) != 0)
    {
      return;
    }
    if ((v2 - 8234) <= 4)
    {
      flushCharacters(a1, 1);
      v5 = *(unsigned __int16 *)(a1 + 2776);
      v6 = (void *)objc_msgSend((id)objc_msgSend((id)a1, "mutableAttributes"), "objectForKey:", CFSTR("NSWritingDirection"));
      v7 = v6;
      v8 = 0;
      switch(v5)
      {
        case 8234:
          goto LABEL_21;
        case 8235:
          v8 = 1;
          goto LABEL_21;
        case 8236:
          if (!v6 || (unint64_t)objc_msgSend(v6, "count", 0) < 2)
            goto LABEL_29;
          v10 = objc_msgSend(v7, "subarrayWithRange:", 0, objc_msgSend(v7, "count") - 1);
          goto LABEL_26;
        case 8237:
          v8 = 2;
          goto LABEL_21;
        case 8238:
          v8 = 3;
LABEL_21:
          v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
          if (!v11)
            goto LABEL_27;
          v12 = v11;
          if (v7 && objc_msgSend(v7, "count"))
            v10 = objc_msgSend(v7, "arrayByAddingObject:", v12);
          else
            v10 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v12);
LABEL_26:
          v7 = (void *)v10;
LABEL_27:
          if (v7)
          {
            objc_msgSend((id)objc_msgSend((id)a1, "mutableAttributes", v8), "setObject:forKey:", v7, CFSTR("NSWritingDirection"));
            v13 = (unsigned int *)(a1 + 410);
            v14 = *(_DWORD *)(a1 + 410) | 0x10000;
          }
          else
          {
LABEL_29:
            objc_msgSend((id)objc_msgSend((id)a1, "mutableAttributes", v8), "removeObjectForKey:", CFSTR("NSWritingDirection"));
            v13 = (unsigned int *)(a1 + 410);
            v14 = *(_DWORD *)(a1 + 410) & 0xFFFEFFFF;
          }
          *v13 = v14;
          break;
        default:
          goto LABEL_27;
      }
      goto LABEL_31;
    }
  }
  if (!*(_BYTE *)(a1 + 2808))
    flushCharacters(a1, 1);
  v9 = *(_QWORD *)(a1 + 328);
  *(_QWORD *)(a1 + 328) = v9 + 1;
  *(_WORD *)(a1 + 2 * v9 + 72) = v2;
  *(_BYTE *)(a1 + 2808) = 1;
  if (*(_QWORD *)(a1 + 328) >= 0x80uLL)
    flushCharacters(a1, 1);
LABEL_31:
  v15 = ((unint64_t)*(unsigned int *)(a1 + 410) >> 7) & 7;
  if ((_DWORD)v15)
  {
    do
    {
      if (_NSRTFGetToken((_DWORD *)(a1 + 536)) != 2)
        break;
      v15 -= *(_DWORD *)(a1 + 2768) != 32;
    }
    while (v15);
    if (*(_DWORD *)(a1 + 2764) != 2)
      _NSRTFUngetToken(a1 + 536);
  }
}

void *readFontPaletteColors(_DWORD *a1)
{
  _DWORD *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *Color;
  void *v7;

  v2 = a1 + 134;
  _NSRTFGetToken(a1 + 134);
  if (a1[692] == 30)
  {
    v3 = 0;
    do
    {
      if (!a1[693])
      {
        v4 = a1[694];
        if ((int)v4 >= 1)
        {
          v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4 >> 16);
          Color = (void *)getColor((uint64_t)a1, *((unsigned __int16 *)a1 + 1388));
          if (Color)
          {
            v7 = Color;
            if (!v3)
              v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v7, "CGColor"), v5);
          }
        }
      }
      _NSRTFGetToken(v2);
    }
    while (a1[692] == 30);
  }
  else
  {
    v3 = 0;
  }
  _NSRTFUngetToken((uint64_t)v2);
  return v3;
}

void *readTypographyFeatures(_DWORD *a1)
{
  _DWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = a1 + 134;
  _NSRTFGetToken(a1 + 134);
  if (a1[692] == 26)
  {
    v3 = 0;
    v4 = *MEMORY[0x1E0CA8328];
    v5 = *MEMORY[0x1E0CA8318];
    do
    {
      if (!a1[693])
      {
        v6 = a1[694];
        if ((int)v6 >= 1)
        {
          v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6 >> 16);
          v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *((unsigned __int16 *)a1 + 1388));
          if (!v3)
            v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
          v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, v4, v8, v5, 0);
          objc_msgSend(v3, "addObject:", v9);

        }
      }
      _NSRTFGetToken(v2);
    }
    while (a1[692] == 26);
  }
  else
  {
    v3 = 0;
  }
  _NSRTFUngetToken((uint64_t)v2);
  return v3;
}

id processFontName(char *cStr, CFStringEncoding a2, CFStringEncoding *a3, double a4)
{
  CFStringEncoding v8;
  CFStringRef v9;
  CFStringRef v10;
  id v11;
  CFStringRef v12;
  CFStringRef v13;

  v8 = *a3;
  if (*a3 == -1 || (v9 = CFStringCreateWithCString(0, cStr, *a3)) == 0)
  {
    v11 = 0;
  }
  else
  {
    v10 = v9;
    v11 = +[UIFont _fontWithName:size:](NSFont, "_fontWithName:size:", v9, a4);
    CFRelease(v10);
  }
  if (a2 != -1 && !v11)
  {
    if (v8 == a2 || (v12 = CFStringCreateWithCString(0, cStr, a2)) == 0)
    {
      v11 = 0;
    }
    else
    {
      v13 = v12;
      v11 = +[UIFont _fontWithName:size:](NSFont, "_fontWithName:size:", v12, a4);
      CFRelease(v13);
    }
  }
  *a3 = v8;
  return v11;
}

CGImageSource *NSEmojiImageSourceCreateWithData(const __CFData *a1, _QWORD *a2, _QWORD *a3)
{
  CGImageSource *v5;
  CGImageSource *v6;
  CFDictionaryRef v7;
  void *v8;
  id v9;

  v5 = CGImageSourceCreateWithData(a1, 0);
  v6 = v5;
  if (v5)
  {
    if (!CGImageSourceGetCount(v5))
      goto LABEL_4;
    v7 = CGImageSourceCopyPropertiesAtIndex(v6, 0, 0);
    -[__CFDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD090]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD098]);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a2 = v9;
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD0A8]);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
LABEL_4:
      CFRelease(v6);
      v9 = 0;
      v6 = 0;
    }

  }
  return v6;
}

void *NSEmojiImageSourceCopyImageStrikes(CGImageSource *a1)
{
  size_t Count;
  void *v3;
  size_t v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  CGImage *ImageAtIndex;
  CFDictionaryRef v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v21;
  size_t v22;

  Count = CGImageSourceGetCount(a1);
  v3 = (void *)objc_opt_new();
  v22 = Count;
  if (Count)
  {
    v4 = 0;
    v21 = *MEMORY[0x1E0CBD090];
    v5 = *MEMORY[0x1E0C9D820];
    v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v7 = *MEMORY[0x1E0CBD0F0];
    v8 = *MEMORY[0x1E0CBD100];
    do
    {
      ImageAtIndex = CGImageSourceCreateImageAtIndex(a1, v4, 0);
      v10 = CGImageSourceCopyPropertiesAtIndex(a1, v4, 0);
      -[__CFDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = v5;
      if (v12)
      {
        objc_msgSend(v12, "doubleValue");
        v14 = v15;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", v8, v21);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v6;
      if (v16)
      {
        objc_msgSend(v16, "doubleValue");
        v17 = v18;
      }
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA80E8]), "initWithImage:alignmentInset:", ImageAtIndex, v14, v17);
      objc_msgSend(v3, "addObject:", v19);
      CGImageRelease(ImageAtIndex);

      ++v4;
    }
    while (v22 != v4);
  }
  return v3;
}

uint64_t NSEmojiImageSourceGetImageIndex(CGImageSource *a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6)
{
  size_t Count;
  size_t v12;
  const __CFDictionary *v13;
  size_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  CFDictionaryRef v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  uint64_t v25;
  const __CFDictionary *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v32;
  double *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  __int128 v40;
  _QWORD v41[2];
  const __CFString *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  Count = CGImageSourceGetCount(a1);
  if (!Count)
  {
    v13 = 0;
    goto LABEL_23;
  }
  v12 = Count;
  *(_QWORD *)&v40 = a2;
  *((_QWORD *)&v40 + 1) = a3;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = ceil(a5 * a6);
  v17 = *MEMORY[0x1E0CBD040];
  v18 = 0.0;
  v19 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    v20 = CGImageSourceCopyPropertiesAtIndex(a1, v14, 0);
    -[__CFDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (!v21)
      goto LABEL_14;
    objc_msgSend(v21, "doubleValue");
    v24 = v23;
    if (v23 < v16)
    {
      if (v18 == 0.0)
      {
        v25 = v15;
      }
      else
      {
        v25 = v15;
        if (v15 & 1 | (v23 <= v18))
          goto LABEL_14;
      }
LABEL_13:
      v26 = v20;

      v15 = v25;
      v18 = v24;
      v13 = v26;
      v19 = v14;
      goto LABEL_14;
    }
    v25 = 1;
    if (v18 == 0.0 || ((v15 ^ 1) & 1) != 0 || v23 < v18)
      goto LABEL_13;
LABEL_14:

    ++v14;
  }
  while (v12 != v14);
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_23:
    v19 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_24;
  }
  if (v40 == 0)
    goto LABEL_24;
  -[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD048]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  v29 = v18;
  if (v27)
    objc_msgSend(v27, "doubleValue", v18);
  v30 = 1.0;
  if (v18 <= a5)
  {
    a5 = v18;
    if (!(_QWORD)v40)
      goto LABEL_27;
    goto LABEL_26;
  }
  v30 = a5 / v18;
  v29 = a5 / v18 * v29;
  if ((_QWORD)v40)
  {
LABEL_26:
    *(double *)v40 = v29;
    *(double *)(v40 + 8) = a5;
  }
LABEL_27:
  if (*((_QWORD *)&v40 + 1))
  {
    -[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD090], v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (double *)MEMORY[0x1E0C9D538];
    objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD0F0]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v34, "doubleValue");
      v36 = floor(v35 * v30 + 0.5);
    }
    else
    {
      v36 = *v33;
    }
    objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD100]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v28, "doubleValue");
      v38 = -floor(v37 * v30 + 0.5);
    }
    else
    {
      v38 = v33[1];
    }
    v42 = CFSTR("NSEmojiImagePropertyKeyOrigin");
    *(double *)v41 = v36;
    *(double *)&v41[1] = v38;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v41, "{CGPoint=dd}");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v39;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
    **((_QWORD **)&v40 + 1) = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_24:

  return v19;
}

double _NSRTFInit(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t i;
  uint64_t v5;
  const void *v6;
  uint64_t j;
  uint64_t v8;
  const void *v9;
  uint64_t k;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  _QWORD *v14;
  double result;

  *(_BYTE *)(a1 + 60) = 0;
  *(_BYTE *)(a1 + 1200) = 0;
  v2 = *(void **)(a1 + 1120);
  if (v2)
    NSZoneFree(0, v2);
  v3 = *(void **)(a1 + 1128);
  if (v3)
    NSZoneFree(0, v3);
  *(_OWORD *)(a1 + 1152) = 0u;
  *(_OWORD *)(a1 + 1168) = 0u;
  *(_OWORD *)(a1 + 1120) = 0u;
  *(_OWORD *)(a1 + 1136) = 0u;
  for (i = *(_QWORD *)(a1 + 1096); i; *(_QWORD *)(a1 + 1096) = i)
  {
    v5 = i;
    i = *(_QWORD *)(i + 40);
    v6 = *(const void **)(v5 + 48);
    if (v6)
    {
      CFRelease(v6);
      v5 = *(_QWORD *)(a1 + 1096);
    }
    if (*(_QWORD *)v5)
    {
      NSZoneFree(0, *(void **)v5);
      v5 = *(_QWORD *)(a1 + 1096);
      if (!v5)
        continue;
    }
    NSZoneFree(0, (void *)v5);
  }
  for (j = *(_QWORD *)(a1 + 1104); j; *(_QWORD *)(a1 + 1104) = j)
  {
    v8 = j;
    j = *(_QWORD *)(j + 16);
    v9 = *(const void **)(v8 + 24);
    if (v9)
    {
      CFRelease(v9);
      v8 = *(_QWORD *)(a1 + 1104);
    }
    if (*(_QWORD *)(v8 + 32))
    {
      NSZoneFree(0, *(void **)(v8 + 32));
      v8 = *(_QWORD *)(a1 + 1104);
      if (!v8)
        continue;
    }
    NSZoneFree(0, (void *)v8);
  }
  for (k = *(_QWORD *)(a1 + 1112); k; *(_QWORD *)(a1 + 1112) = k)
  {
    v11 = k;
    k = *(_QWORD *)(k + 64);
    v12 = *(_QWORD **)(v11 + 48);
    if (v12)
    {
      do
      {
        v13 = (void *)v12[2];
        v14 = (_QWORD *)v12[3];
        if (v13)
          NSZoneFree(0, v13);
        NSZoneFree(0, v12);
        v12 = v14;
      }
      while (v14);
      v11 = *(_QWORD *)(a1 + 1112);
    }
    if (*(_QWORD *)v11)
    {
      NSZoneFree(0, *(void **)v11);
      v11 = *(_QWORD *)(a1 + 1112);
      if (!v11)
        continue;
    }
    NSZoneFree(0, (void *)v11);
  }
  *(_DWORD *)(a1 + 2228) = -1;
  *(_QWORD *)(a1 + 40) = -1;
  result = 0.0;
  *(_OWORD *)(a1 + 2248) = 0u;
  *(_QWORD *)(a1 + 1084) = 0xFFFFFFFFLL;
  *(_QWORD *)(a1 + 1184) = DefaultMsgProc;
  *(_QWORD *)(a1 + 1192) = DefaultPanicProc;
  return result;
}

uint64_t _NSRTFSetClassCallback(uint64_t result, unint64_t a2, uint64_t a3)
{
  if (a2 <= 4)
    *(_QWORD *)(result + 8 * a2 + 1136) = a3;
  return result;
}

_QWORD *_NSRTFSetInput(_QWORD *result, uint64_t a2, uint64_t a3)
{
  result[1] = a2;
  result[2] = a3;
  result[3] = 0;
  result[4] = 0;
  return result;
}

char *_NSRTFStrSave(const char *a1)
{
  NSUInteger v2;
  char *v3;
  char *v4;

  v2 = strlen(a1) + 1;
  v3 = (char *)NSZoneMalloc(0, v2);
  v4 = v3;
  if (v3)
    strlcpy(v3, a1, v2);
  return v4;
}

uint64_t _NSRTFPanic(uint64_t a1, char *__format, ...)
{
  char __str[1024];
  uint64_t v5;
  va_list va;

  va_start(va, __format);
  v5 = *MEMORY[0x1E0C80C00];
  vsnprintf(__str, 0x400uLL, __format, va);
  __strlcat_chk();
  return (*(uint64_t (**)(char *))(a1 + 1192))(__str);
}

uint64_t _NSRTFGetToken(_DWORD *a1)
{
  int v2;
  unsigned int v3;
  BOOL v4;
  int v5;
  int v7;
  int v8;

  _RTFGetToken((uint64_t)a1);
  v2 = a1[557];
  if (v2 == 2)
  {
    while (1)
    {
      v3 = a1[558];
      v4 = v3 > 0xD;
      v5 = (1 << v3) & 0x2401;
      if (v4 || v5 == 0)
        break;
      _RTFGetToken((uint64_t)a1);
      v2 = a1[557];
      if (v2 != 2)
        goto LABEL_9;
    }
    v2 = 2;
  }
LABEL_9:
  v7 = a1[566];
  if (v7 == 2)
  {
    if (!v2)
      return v2;
    goto LABEL_23;
  }
  if (v7 != 1)
  {
    if (!v7 && v2 == 1 && !a1[558])
    {
      v8 = 1;
LABEL_24:
      a1[566] = v8;
      return v2;
    }
    return v2;
  }
  if (a1[559] == 52 && v2 == 3 && a1[558] == 6)
  {
    v8 = 2;
    goto LABEL_24;
  }
  if (v2 != 1 || a1[558])
  {
LABEL_23:
    v8 = 0;
    goto LABEL_24;
  }
  return v2;
}

uint64_t _NSRTFRouteToken(uint64_t result)
{
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;

  v1 = result;
  v2 = *(_DWORD *)(result + 2228);
  if (v2 >= 5)
  {
    result = _NSRTFPanic(result, "Unknown class %ld: %s (reader malfunction)", *(unsigned int *)(result + 2228), (const char *)(result + 1200));
    v2 = *(_DWORD *)(v1 + 2228);
  }
  v3 = (int)v2;
  if (v2 == 3)
  {
    if (*(_DWORD *)(v1 + 2232) == 3)
    {
      v4 = *(int *)(v1 + 2236);
      if (v4 > 43)
      {
        switch(v4)
        {
          case ',':
            v5 = (uint64_t (*)(uint64_t))ReadPictGroup;
            goto LABEL_22;
          case '-':
            v5 = (uint64_t (*)(uint64_t))ReadObjGroup;
            goto LABEL_22;
          case '[':
            v5 = ReadExpandedColorTbl;
            goto LABEL_22;
        }
      }
      else
      {
        if (!*(_DWORD *)(v1 + 2236))
        {
          v5 = ReadFontTbl;
          goto LABEL_22;
        }
        if (v4 == 6)
        {
          v5 = ReadColorTbl;
          goto LABEL_22;
        }
        if (v4 == 7)
        {
          v5 = ReadStyleSheet;
LABEL_22:
          v6 = v1;
          return v5(v6);
        }
      }
    }
  }
  else if (v2 > 4)
  {
    return result;
  }
  v5 = *(uint64_t (**)(uint64_t))(v1 + 8 * v3 + 1136);
  if (v5)
  {
    v6 = *(_QWORD *)v1;
    return v5(v6);
  }
  return result;
}

uint64_t _NSRTFSkipGroup(_DWORD *a1)
{
  uint64_t result;
  uint64_t v3;
  int v4;

  result = _NSRTFGetToken(a1);
  if (result != 4)
  {
    v3 = 1;
    do
    {
      if (a1[557] == 1)
      {
        v4 = a1[558];
        if (v4 == 1)
        {
          if (v3 < 2)
            return result;
          --v3;
        }
        else if (!v4)
        {
          ++v3;
        }
      }
      result = _NSRTFGetToken(a1);
    }
    while (result != 4);
  }
  return result;
}

uint64_t _RTFGetToken(uint64_t result)
{
  uint64_t v1;
  int v2;
  _DWORD *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  char v21;
  int v22;
  int v23;
  int v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v1 = result;
  v2 = *(_DWORD *)(result + 44);
  if ((v2 & 0x80000000) == 0)
  {
    *(_DWORD *)(result + 2228) = v2;
    *(_QWORD *)(result + 2232) = *(_QWORD *)(result + 48);
    *(_DWORD *)(result + 2240) = *(_DWORD *)(result + 56);
    __strlcpy_chk();
    result = strlen((const char *)(v1 + 1200));
    *(_DWORD *)(v1 + 2224) = result;
    *(_DWORD *)(v1 + 44) = -1;
    return result;
  }
  v3 = (_DWORD *)(result + 2228);
  *(_DWORD *)(result + 2240) = -1000000;
  *(_OWORD *)(result + 2224) = 0u;
  *(_BYTE *)(result + 1200) = 0;
  v4 = *(int *)(result + 40);
  if ((_DWORD)v4 == -1)
  {
    v5 = *(_QWORD *)(result + 24);
    if (v5 >= *(_QWORD *)(result + 16))
    {
      *v3 = 4;
      return result;
    }
    v6 = *(_QWORD *)(result + 8);
    *(_QWORD *)(result + 24) = v5 + 1;
    v4 = *(unsigned __int8 *)(v6 + v5);
    *(_DWORD *)(result + 2224) = 1;
    *(_WORD *)(result + 1200) = v4;
  }
  else
  {
    *(_DWORD *)(result + 2224) = 1;
    *(_BYTE *)(result + 1200) = v4;
    *(_BYTE *)(result + 1201) = 0;
    *(_DWORD *)(result + 40) = -1;
  }
  if (v4 > 122)
  {
    if (v4 == 125)
    {
      v12 = 0x100000001;
    }
    else
    {
      if (v4 != 123)
        goto LABEL_22;
      v12 = 1;
    }
    *(_QWORD *)v3 = v12;
    return result;
  }
  if (v4 == 9)
  {
    *(_QWORD *)v3 = 0x600000003;
    v13 = 37;
    goto LABEL_19;
  }
  if (v4 != 92)
  {
LABEL_22:
    *(_DWORD *)(result + 2228) = 2;
    *(_DWORD *)(result + 2232) = v4;
    return result;
  }
  v7 = *(_QWORD *)(result + 24);
  if (v7 >= *(_QWORD *)(result + 16))
    return result;
  v8 = *(_QWORD *)(result + 8);
  *(_QWORD *)(result + 24) = v7 + 1;
  v9 = *(char *)(v8 + v7);
  v10 = v9;
  *(_DWORD *)(result + 2224) = 2;
  *(_WORD *)(result + 1201) = v9;
  v11 = v9;
  if (v9 < 0)
    result = __maskrune(v9, 0x100uLL);
  else
    result = *(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v9 + 60) & 0x100;
  if (!(_DWORD)result)
  {
    if (v10 > 122)
    {
      switch(v10)
      {
        case '{':
        case '}':
          goto LABEL_46;
        case '|':
        case '~':
          goto LABEL_47;
        default:
          return result;
      }
      return result;
    }
    v19 = v10 - 39;
    if ((unint64_t)(v10 - 39) <= 0x38)
    {
      if (((1 << v19) & 0x100000000000048) != 0)
      {
LABEL_47:
        *(_QWORD *)v3 = 0x600000003;
        if (v10 <= 94)
        {
          if (v10 == 42)
          {
            v13 = 52;
          }
          else
          {
            if (v10 != 45)
              return result;
            v13 = 50;
          }
        }
        else
        {
          switch(v10)
          {
            case '_':
              v13 = 51;
              break;
            case '|':
              v13 = 47;
              break;
            case '~':
              v13 = 49;
              break;
            default:
              return result;
          }
        }
        goto LABEL_19;
      }
      if (((1 << v19) & 0x20000000080000) != 0)
      {
LABEL_46:
        *(_DWORD *)(v1 + 2228) = 2;
        *(_DWORD *)(v1 + 2232) = v11;
        return result;
      }
      if (v10 == 39)
      {
        result = GetChar(v1);
        if (result != -1)
        {
          v20 = result;
          result = GetChar(v1);
          if (result != -1)
          {
            v21 = result;
            *(_DWORD *)(v1 + 2228) = 2;
            v22 = RTFCharToHex(v20);
            result = RTFCharToHex(v21);
            *(_DWORD *)(v1 + 2232) = result + 16 * v22;
          }
        }
        return result;
      }
    }
    if (v10 != 10 && v10 != 13)
      return result;
    *(_QWORD *)v3 = 0x600000003;
    v13 = 28;
LABEL_19:
    *(_DWORD *)(v1 + 2236) = v13;
    return result;
  }
  v14 = MEMORY[0x1E0C80978];
  if ((v10 & 0x80) == 0)
    goto LABEL_28;
LABEL_26:
  if (__maskrune(v10, 0x100uLL))
  {
    while (1)
    {
      v15 = *(_QWORD *)(v1 + 24);
      if (v15 >= *(_QWORD *)(v1 + 16))
        break;
      v16 = *(int *)(v1 + 2224);
      if ((int)v16 > 1022)
        break;
      v17 = *(_QWORD *)(v1 + 8);
      *(_QWORD *)(v1 + 24) = v15 + 1;
      v10 = *(unsigned __int8 *)(v17 + v15);
      *(_DWORD *)(v1 + 2224) = v16 + 1;
      v18 = v1 + 1200;
      *(_BYTE *)(v18 + v16) = v10;
      *(_BYTE *)(v18 + *(int *)(v1 + 2224)) = 0;
      if ((v10 & 0x80) != 0)
        goto LABEL_26;
LABEL_28:
      if ((*(_DWORD *)(v14 + 4 * v10 + 60) & 0x100) == 0)
        goto LABEL_42;
    }
    return Lookup(v1, (char *)(v1 + 1200));
  }
  else
  {
LABEL_42:
    *(_BYTE *)(*(int *)(v1 + 2224) + v1 + 1200 - 1) = 0;
    result = Lookup(v1, (char *)(v1 + 1200));
    *(_BYTE *)(*(int *)(v1 + 2224) + v1 + 1200 - 1) = v10;
    if (v10 == 45)
    {
      result = GetChar(v1);
      if (result == -1)
        return result;
      v10 = result;
      v23 = -1;
    }
    else
    {
      v23 = 1;
    }
    if ((v10 - 48) <= 9)
    {
      *(_DWORD *)(v1 + 2240) = 0;
      while (1)
      {
        v24 = v10 + 10 * *(_DWORD *)(v1 + 2240) - 48;
        *(_DWORD *)(v1 + 2240) = v24;
        v25 = *(_QWORD *)(v1 + 24);
        if (v25 >= *(_QWORD *)(v1 + 16))
          break;
        v26 = *(int *)(v1 + 2224);
        if ((int)v26 > 1022)
          break;
        v27 = *(_QWORD *)(v1 + 8);
        *(_QWORD *)(v1 + 24) = v25 + 1;
        v10 = *(unsigned __int8 *)(v27 + v25);
        *(_DWORD *)(v1 + 2224) = v26 + 1;
        v28 = v1 + 1200;
        *(_BYTE *)(v28 + v26) = v10;
        *(_BYTE *)(v28 + *(int *)(v1 + 2224)) = 0;
        if ((v10 - 48) >= 0xA)
        {
          v24 = *(_DWORD *)(v1 + 2240);
          goto LABEL_66;
        }
      }
      v10 = -1;
LABEL_66:
      *(_DWORD *)(v1 + 2240) = v24 * v23;
    }
    if (v10 != -1)
    {
      if (v10 != 32)
        *(_DWORD *)(v1 + 40) = v10;
      v29 = *(int *)(v1 + 2224) - 1;
      *(_DWORD *)(v1 + 2224) = v29;
      *(_BYTE *)(v1 + v29 + 1200) = 0;
    }
  }
  return result;
}

uint64_t _NSRTFUngetToken(uint64_t a1)
{
  int v2;

  if ((*(_DWORD *)(a1 + 44) & 0x80000000) == 0)
    _NSRTFPanic(a1, "cannot unget two tokens");
  v2 = *(_DWORD *)(a1 + 2228);
  if (v2 < 0)
  {
    _NSRTFPanic(a1, "no token to unget");
    v2 = *(_DWORD *)(a1 + 2228);
  }
  *(_DWORD *)(a1 + 44) = v2;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a1 + 2232);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a1 + 2240);
  return __strlcpy_chk();
}

uint64_t _NSRTFGetFont(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 1096);
  if (a2 != -1 && result)
  {
    do
    {
      if (*(_DWORD *)(result + 16) == a2)
        break;
      result = *(_QWORD *)(result + 40);
    }
    while (result);
  }
  return result;
}

uint64_t _NSRTFGetColor(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 1104);
  if (a2 != -1 && result)
  {
    do
    {
      if (*(_DWORD *)result == a2)
        break;
      result = *(_QWORD *)(result + 16);
    }
    while (result);
  }
  return result;
}

uint64_t _NSRTFMsg(uint64_t a1, char *__format, ...)
{
  char __str[1024];
  uint64_t v5;
  va_list va;

  va_start(va, __format);
  v5 = *MEMORY[0x1E0C80C00];
  vsnprintf(__str, 0x400uLL, __format, va);
  return (*(uint64_t (**)(char *))(a1 + 1184))(__str);
}

uint64_t _NSRTFSetPanicProc(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 1192) = a2;
  return result;
}

uint64_t ReadFontTbl(uint64_t a1)
{
  _QWORD *v2;
  const char *v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  int v7;
  int v8;
  unsigned int v9;
  __int128 v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char v20[1023];
  _BYTE v21[17];

  v2 = 0;
  v3 = (const char *)(a1 + 1200);
  v4 = -1;
  *(_QWORD *)&v21[1] = *MEMORY[0x1E0C80C00];
  do
  {
    _NSRTFGetToken((_DWORD *)a1);
    v5 = *(_DWORD *)(a1 + 2228);
    if (v4 != -1)
      goto LABEL_3;
    if (v5 != 2)
      goto LABEL_11;
    v6 = *(_DWORD *)(a1 + 2232);
    if (v6 == 59)
    {
      _NSRTFGetToken((_DWORD *)a1);
      v5 = *(_DWORD *)(a1 + 2228);
LABEL_3:
      if (v5 != 2)
        goto LABEL_11;
      v6 = *(_DWORD *)(a1 + 2232);
    }
    v7 = 0;
    v5 = 2;
    if (v6 > 0x20 || ((1 << v6) & 0x100002600) == 0)
      goto LABEL_14;
    _NSRTFGetToken((_DWORD *)a1);
    v5 = *(_DWORD *)(a1 + 2228);
LABEL_11:
    if (v5 == 1)
    {
      if (*(_DWORD *)(a1 + 2232) == 1)
        break;
      v5 = 1;
      v7 = 1;
LABEL_14:
      if ((v4 & 0x8000000000000000) == 0)
        goto LABEL_15;
      goto LABEL_18;
    }
    v7 = 0;
    if ((v4 & 0x8000000000000000) == 0)
    {
LABEL_15:
      if (!v4)
        goto LABEL_25;
      v8 = 0;
      goto LABEL_33;
    }
LABEL_18:
    if (v5 != 3)
    {
      if (!v7 || *(_DWORD *)(a1 + 2232))
      {
LABEL_24:
        _NSRTFPanic(a1, "%s: Cannot determine format", "ReadFontTbl");
        v8 = 0;
        v4 = -1;
        goto LABEL_33;
      }
LABEL_25:
      if (v5 == 2)
      {
        v9 = *(_DWORD *)(a1 + 2232);
        if (v9 > 0x20 || ((1 << v9) & 0x100002600) == 0)
        {
LABEL_31:
          _NSRTFPanic(a1, "%s: missing \"{\"", "ReadFontTbl");
LABEL_32:
          _NSRTFGetToken((_DWORD *)a1);
          v4 = 0;
          v8 = 1;
          goto LABEL_33;
        }
        _NSRTFGetToken((_DWORD *)a1);
        v5 = *(_DWORD *)(a1 + 2228);
      }
      if (v5 == 1 && !*(_DWORD *)(a1 + 2232))
        goto LABEL_32;
      goto LABEL_31;
    }
    if (*(_DWORD *)(a1 + 2232) != 12 || *(_DWORD *)(a1 + 2236) != 10)
      goto LABEL_24;
    v8 = 0;
    v4 = 1;
LABEL_33:
    v2 = NSZoneMalloc(0, 0x48uLL);
    if (!v2)
      _NSRTFPanic(a1, "%s: cannot allocate font entry", "ReadFontTbl");
    v2[5] = *(_QWORD *)(a1 + 1096);
    *(_QWORD *)(a1 + 1096) = v2;
    *v2 = 0;
    v2[1] = 0;
    *(_QWORD *)&v10 = 0xFFFFFFFFLL;
    *((_QWORD *)&v10 + 1) = 0xFFFFFFFFLL;
    *((_OWORD *)v2 + 1) = v10;
    v2[4] = 0xFFFFFFFF00000000;
    v2[6] = 0;
    *((_DWORD *)v2 + 16) = -1;
    while (1)
    {
      v11 = *(_DWORD *)(a1 + 2228);
      if (v11 == 4)
        break;
      if (v11 == 1)
      {
        v12 = *(_DWORD *)(a1 + 2232);
        if (v12 == 1)
          goto LABEL_77;
        if (v11 == 3)
          goto LABEL_45;
        if (!v12)
        {
          _NSRTFSkipGroup((_DWORD *)a1);
          goto LABEL_75;
        }
        if (v11 != 2)
        {
LABEL_63:
          _NSRTFMsg(a1, "%s: unknown token \"%s\"\n", "ReadFontTbl", v3);
          goto LABEL_75;
        }
LABEL_52:
        v13 = 0;
        while (1)
        {
          v14 = *(int *)(a1 + 2228);
          if ((_DWORD)v14 == 4)
            break;
          if (v14 == 1)
          {
            v15 = *(_DWORD *)(a1 + 2232);
            if (v15 < 2)
              break;
          }
          else if (v14 == 2)
          {
            v15 = *(_DWORD *)(a1 + 2232);
            if (v15 == 59)
              break;
          }
          else
          {
            v15 = *(_DWORD *)(a1 + 2232);
          }
          v16 = v13 + 1;
          v20[v13] = v15;
          _NSRTFGetToken((_DWORD *)a1);
          v13 = v16;
          if (v16 == 1023)
          {
            v17 = v21;
            goto LABEL_65;
          }
        }
        v17 = &v20[v13];
LABEL_65:
        *v17 = 0;
        v18 = _NSRTFStrSave(v20);
        *v2 = v18;
        if (!v18)
          _NSRTFPanic(a1, "%s: cannot allocate font name", "ReadFontTbl");
      }
      else
      {
        if (v11 == 2 && *(_DWORD *)(a1 + 2232) == 59)
          goto LABEL_77;
        if (v11 == 2)
          goto LABEL_52;
        if (v11 != 3)
          goto LABEL_63;
        v12 = *(_DWORD *)(a1 + 2232);
LABEL_45:
        switch(v12)
        {
          case 4:
            goto LABEL_70;
          case 12:
            if (*(_DWORD *)(a1 + 2236) == 10)
              *((_DWORD *)v2 + 4) = *(_DWORD *)(a1 + 2240);
            break;
          case 23:
            switch(*(_DWORD *)(a1 + 2236))
            {
              case 0:
                *((_DWORD *)v2 + 6) = *(_DWORD *)(a1 + 2240);
                break;
              case 1:
                *((_DWORD *)v2 + 7) = *(_DWORD *)(a1 + 2240);
                break;
              case 2:
                *((_DWORD *)v2 + 9) = *(_DWORD *)(a1 + 2240);
                break;
              case 3:
              case 4:
                *((_DWORD *)v2 + 8) = *(_DWORD *)(a1 + 2240);
                break;
              default:
                goto LABEL_75;
            }
            break;
          default:
            _NSRTFMsg(a1, "%s: unknown token \"%s\"\n", "ReadFontTbl", v3);
LABEL_70:
            *((_DWORD *)v2 + 5) = *(_DWORD *)(a1 + 2236);
            break;
        }
LABEL_75:
        _NSRTFGetToken((_DWORD *)a1);
      }
    }
    v11 = 4;
LABEL_77:
    if (v8)
    {
      if (v11 == 1 && *(_DWORD *)(a1 + 2232) == 1
        || (_NSRTFGetToken((_DWORD *)a1), *(_DWORD *)(a1 + 2228) == 1) && *(_DWORD *)(a1 + 2232) == 1)
      {
        v11 = 1;
      }
      else
      {
        _NSRTFPanic(a1, "%s: missing \"}\"", "ReadFontTbl");
        v11 = *(_DWORD *)(a1 + 2228);
      }
    }
  }
  while (v11 != 4);
  if (v2 && *((_DWORD *)v2 + 4) == -1)
    _NSRTFPanic(a1, "%s: missing font number", "ReadFontTbl");
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a1 + 24);
  return _NSRTFRouteToken(a1);
}

uint64_t ReadColorTbl(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  unsigned int v5;
  BOOL v6;
  uint64_t v7;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;

  v2 = 0;
  v3 = *(_QWORD *)(a1 + 1104);
  while (1)
  {
    _NSRTFGetToken((_DWORD *)a1);
    v4 = *(_DWORD *)(a1 + 2228);
    if (v4 != 2)
      break;
    v5 = *(_DWORD *)(a1 + 2232);
    v6 = v5 > 0x20;
    v7 = (1 << v5) & 0x100002600;
    if (!v6 && v7 != 0)
    {
      _NSRTFGetToken((_DWORD *)a1);
      v4 = *(_DWORD *)(a1 + 2228);
      break;
    }
LABEL_10:
    if (v3 && (v9 = *(_QWORD **)(a1 + 1104)) != 0)
    {
      while (v2 != *(_DWORD *)v9)
      {
        v9 = (_QWORD *)v9[2];
        if (!v9)
          goto LABEL_14;
      }
    }
    else
    {
LABEL_14:
      v9 = NSZoneMalloc(0, 0x48uLL);
      if (!v9)
        _NSRTFPanic(a1, "%s: cannot allocate color entry", "ReadColorTbl");
      *(_DWORD *)v9 = v2;
      v10 = *(_QWORD *)(a1 + 1104);
      *((_DWORD *)v9 + 3) = -1;
      *(_QWORD *)((char *)v9 + 4) = -1;
      *((_DWORD *)v9 + 10) = -1;
      v9[2] = v10;
      v9[3] = 0;
      v9[4] = 0;
      *(_QWORD *)(a1 + 1104) = v9;
    }
    ++v2;
    while (1)
    {
      v11 = *(int *)(a1 + 2228);
      if (v11 != 3)
        break;
      if (*(_DWORD *)(a1 + 2232) != 5)
        goto LABEL_29;
      v12 = *(_DWORD *)(a1 + 2236);
      switch(v12)
      {
        case 2:
          *((_DWORD *)v9 + 3) = *(_DWORD *)(a1 + 2240);
          break;
        case 1:
          *((_DWORD *)v9 + 2) = *(_DWORD *)(a1 + 2240);
          break;
        case 0:
          *((_DWORD *)v9 + 1) = *(_DWORD *)(a1 + 2240);
          break;
      }
      _NSRTFGetToken((_DWORD *)a1);
    }
    if (v11 != 2 || *(_DWORD *)(a1 + 2232) != 59)
    {
LABEL_29:
      _NSRTFPanic(a1, "%s: malformed entry", "ReadColorTbl");
      continue;
    }
  }
  if (v4 != 1 || *(_DWORD *)(a1 + 2232) != 1)
    goto LABEL_10;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a1 + 24);
  return _NSRTFRouteToken(a1);
}

uint64_t ReadExpandedColorTbl(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  unsigned int v5;
  BOOL v6;
  uint64_t v7;
  _QWORD *i;
  uint64_t v10;
  uint64_t v11;
  int v12;
  char *v13;
  unsigned int v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  int v18;
  char *v19;
  char v21[100];
  _BYTE v22[9];

  v2 = 0;
  *(_QWORD *)&v22[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 1104);
LABEL_2:
  _NSRTFGetToken((_DWORD *)a1);
  v4 = *(_DWORD *)(a1 + 2228);
  if (v4 == 2)
  {
    v5 = *(_DWORD *)(a1 + 2232);
    v6 = v5 > 0x20;
    v7 = (1 << v5) & 0x100002600;
    if (v6 || v7 == 0)
      goto LABEL_10;
    _NSRTFGetToken((_DWORD *)a1);
    v4 = *(_DWORD *)(a1 + 2228);
  }
  if (v4 != 1 || *(_DWORD *)(a1 + 2232) != 1)
  {
LABEL_10:
    if (v3)
    {
      for (i = *(_QWORD **)(a1 + 1104); i; i = (_QWORD *)i[2])
      {
        if (v2 == *(_DWORD *)i)
          goto LABEL_39;
      }
    }
    i = NSZoneMalloc(0, 0x48uLL);
    if (!i)
      _NSRTFPanic(a1, "%s: cannot allocate color entry", "ReadColorTbl");
    *(_DWORD *)i = v2;
    v10 = *(_QWORD *)(a1 + 1104);
    *((_DWORD *)i + 3) = -1;
    *(_QWORD *)((char *)i + 4) = -1;
    *((_DWORD *)i + 10) = -1;
    i[2] = v10;
    i[3] = 0;
    i[4] = 0;
    *(_QWORD *)(a1 + 1104) = i;
    while (1)
    {
      while (1)
      {
LABEL_39:
        while (1)
        {
          v17 = *(int *)(a1 + 2228);
          if (v17 != 1)
            break;
          if (*(_DWORD *)(a1 + 2232))
            goto LABEL_33;
          _NSRTFSkipGroup((_DWORD *)a1);
        }
        if (v17 != 2)
          break;
        if (*(_DWORD *)(a1 + 2232) == 59)
        {
          ++v2;
          goto LABEL_2;
        }
LABEL_33:
        _NSRTFGetToken((_DWORD *)a1);
      }
      if (v17 != 3)
        goto LABEL_33;
      v18 = *(_DWORD *)(a1 + 2232);
      if (v18 == 5)
      {
        if (*(_DWORD *)(a1 + 2236) != 22)
          goto LABEL_33;
        _NSRTFGetToken((_DWORD *)a1);
        if (!i[4] && *(_DWORD *)(a1 + 2228) == 2)
        {
          v11 = 0;
          v12 = 2;
          v13 = v21;
          while (1)
          {
            if (v12 == 1)
            {
              v14 = *(_DWORD *)(a1 + 2232);
              if (v14 < 2)
                goto LABEL_37;
            }
            else if (v12 == 2)
            {
              v14 = *(_DWORD *)(a1 + 2232);
              if (v14 == 59)
              {
                v13 = &v21[v11];
                goto LABEL_37;
              }
            }
            else
            {
              v14 = *(_DWORD *)(a1 + 2232);
            }
            v21[v11] = v14;
            _NSRTFGetToken((_DWORD *)a1);
            if (v11 == 99)
              break;
            ++v11;
            v12 = *(_DWORD *)(a1 + 2228);
            v13 = &v21[v11];
            if (v12 == 4)
              goto LABEL_37;
          }
          v13 = v22;
LABEL_37:
          *v13 = 0;
          v16 = _NSRTFStrSave(v21);
          i[4] = v16;
          if (!v16)
            _NSRTFPanic(a1, "%s: cannot allocate color name", "ReadColorTbl");
        }
      }
      else
      {
        if (v18 != 29)
          goto LABEL_33;
        *((_DWORD *)i + 10) = *(_DWORD *)(a1 + 2236);
        _NSRTFGetToken((_DWORD *)a1);
        if (*(_DWORD *)(a1 + 2228) == 3)
        {
          v15 = 0;
          do
          {
            if (*(_DWORD *)(a1 + 2232) != 5 || *(_DWORD *)(a1 + 2236) != 21)
              break;
            if (v15 <= 4)
            {
              v19 = (char *)i + 4 * v15++;
              *((_DWORD *)v19 + 12) = *(_DWORD *)(a1 + 2240);
            }
            _NSRTFGetToken((_DWORD *)a1);
          }
          while (*(_DWORD *)(a1 + 2228) == 3);
        }
        else
        {
          LODWORD(v15) = 0;
        }
        *((_DWORD *)i + 11) = v15;
      }
    }
  }
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a1 + 24);
  return _NSRTFRouteToken(a1);
}

uint64_t ReadStyleSheet(uint64_t a1)
{
  _NSRTFSkipGroup((_DWORD *)a1);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a1 + 24);
  return _NSRTFRouteToken(a1);
}

uint64_t ReadPictGroup(_DWORD *a1)
{
  int v1;

  v1 = (int)a1;
  _NSRTFSkipGroup(a1);
  return _NSRTFRouteToken(v1);
}

uint64_t ReadObjGroup(_DWORD *a1)
{
  int v1;

  v1 = (int)a1;
  _NSRTFSkipGroup(a1);
  return _NSRTFRouteToken(v1);
}

uint64_t GetChar(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 24);
  if (v1 >= *(_QWORD *)(a1 + 16))
    return -1;
  v2 = *(int *)(a1 + 2224);
  if ((int)v2 > 1022)
    return -1;
  v4 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 24) = v1 + 1;
  v3 = *(unsigned __int8 *)(v4 + v1);
  *(_DWORD *)(a1 + 2224) = v2 + 1;
  v5 = a1 + 1200;
  *(_BYTE *)(v5 + v2) = v3;
  *(_BYTE *)(v5 + *(int *)(a1 + 2224)) = 0;
  return v3;
}

uint64_t RTFCharToHex(unsigned int a1)
{
  __darwin_ct_rune_t v1;
  int v2;

  v1 = a1;
  if ((a1 & 0x80000000) == 0)
  {
    if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * a1 + 60) & 0x8000) == 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (__maskrune(a1, 0x8000uLL))
LABEL_3:
    v1 = (char)__tolower(v1);
LABEL_4:
  v2 = v1 - 48;
  if ((v1 - 48) >= 0xA)
    return v1 - 87;
  return v2;
}

uint64_t Lookup(uint64_t result, char *__s1)
{
  int32x2_t *v2;
  int v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  int v17;

  v2 = (int32x2_t *)result;
  v4 = __s1 + 1;
  v3 = __s1[1];
  if (!__s1[1]
    || __s1[2]
    || ((v3 - 85) <= 0x21 ? (v16 = ((1 << (v3 - 85)) & 0x300122001) == 0) : (v16 = 1),
        v16))
  {
    v5 = 0;
    v6 = 30;
    v7 = (char *)&rtfVeryCommonKey;
    do
    {
      v8 = v6 + v5;
      if (v6 + v5 < 0 != __OFADD__(v6, v5))
        ++v8;
      v9 = v8 >> 1;
      result = strcmp(v4, *((const char **)&rtfVeryCommonKey + 3 * (v8 >> 1) + 2));
      if ((result & 0x80000000) != 0)
      {
        v6 = v9 - 1;
      }
      else
      {
        if (!(_DWORD)result)
        {
LABEL_28:
          v2[279] = vmovn_s64(*(int64x2_t *)&v7[24 * v9]);
          v2[278].i32[1] = 3;
          return result;
        }
        v5 = v9 + 1;
      }
    }
    while (v6 >= v5);
    v10 = 0;
    v11 = 30;
    v7 = (char *)&rtfSomewhatCommonKey;
    do
    {
      v12 = v11 + v10;
      if (v11 + v10 < 0 != __OFADD__(v11, v10))
        ++v12;
      v9 = v12 >> 1;
      result = strcmp(v4, *((const char **)&rtfSomewhatCommonKey + 3 * (v12 >> 1) + 2));
      if ((result & 0x80000000) != 0)
      {
        v11 = v9 - 1;
      }
      else
      {
        if (!(_DWORD)result)
          goto LABEL_28;
        v10 = v9 + 1;
      }
    }
    while (v11 >= v10);
    v13 = 0;
    v14 = 907;
    v7 = (char *)&rtfKey;
    do
    {
      v15 = v14 + v13;
      if (v14 + v13 < 0 != __OFADD__(v14, v13))
        ++v15;
      v9 = v15 >> 1;
      result = strcmp(v4, *((const char **)&rtfKey + 3 * (v15 >> 1) + 2));
      if ((result & 0x80000000) != 0)
      {
        v14 = v9 - 1;
      }
      else
      {
        if (!(_DWORD)result)
          goto LABEL_28;
        v13 = v9 + 1;
      }
    }
    while (v14 >= v13);
    v2[278].i32[1] = 0;
  }
  else
  {
    *(_QWORD *)(result + 2228) = 0xC00000003;
    if (v3 > 104)
    {
      switch(v3)
      {
        case 'i':
          v17 = 12;
          break;
        case 'u':
          v17 = 38;
          break;
        case 'v':
          v17 = 27;
          break;
        default:
          return result;
      }
    }
    else
    {
      switch(v3)
      {
        case 'U':
          v17 = 36;
          break;
        case 'b':
          v17 = 1;
          break;
        case 'f':
          v17 = 10;
          break;
        default:
          return result;
      }
    }
    *(_DWORD *)(result + 2236) = v17;
  }
  return result;
}

uint64_t UIAreObjectsSortableForEncoding(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int isKindOfClass;
  int v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (!v2)
  {
    isKindOfClass = 1;
    v6 = 1;
    return (isKindOfClass | v6) & 1;
  }
  v3 = v2;
  v4 = *(_QWORD *)v10;
  LOBYTE(isKindOfClass) = 1;
  LOBYTE(v6) = 1;
  while (2)
  {
    for (i = 0; i != v3; ++i)
    {
      if (*(_QWORD *)v10 != v4)
        objc_enumerationMutation(a1);
      if ((isKindOfClass & 1) != 0)
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((v6 & 1) == 0)
          goto LABEL_8;
      }
      else
      {
        isKindOfClass = 0;
        if ((v6 & 1) == 0)
        {
LABEL_8:
          v6 = 0;
          goto LABEL_11;
        }
      }
      objc_opt_class();
      v6 = objc_opt_isKindOfClass();
LABEL_11:
      if (((isKindOfClass | v6) & 1) == 0)
      {
        isKindOfClass = 0;
        v6 = 0;
        return (isKindOfClass | v6) & 1;
      }
    }
    v3 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
      continue;
    return (isKindOfClass | v6) & 1;
  }
}

void sub_18D6A1D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

const __CFString *_UISystemFontName()
{
  return CFSTR("Helvetica");
}

CTFontRef UISystemFontCreate(int a1, int a2)
{
  uint64_t v2;

  if (a2)
    v2 = 2;
  else
    v2 = 0;
  return UINewFont((uint64_t)CFSTR("Helvetica"), v2, 0, 0, 1, 0, (double)a1, 0.0);
}

CTFontRef UISystemFontForSize(int a1)
{
  unint64_t *v1;
  CTFontRef v3;

  if ((a1 - 10) > 0xF)
    return UINewFont((uint64_t)CFSTR("Helvetica"), 0, 0, 0, 1, 0, (double)a1, 0.0);
  v1 = (unint64_t *)((char *)&__fontTable + 8 * (a1 - 10));
  if (!*v1)
  {
    v3 = UINewFont((uint64_t)CFSTR("Helvetica"), 0, 0, 0, 1, 0, (double)a1, 0.0);
    if (v3)
    {
      while (!__ldaxr(v1))
      {
        if (!__stlxr((unint64_t)v3, v1))
          return (CTFontRef)*v1;
      }
      __clrex();

    }
  }
  return (CTFontRef)*v1;
}

CTFontRef UISystemFontBoldForSize(int a1)
{
  unint64_t *v1;
  CTFontRef v3;

  if ((a1 - 10) > 0xF)
    return UINewFont((uint64_t)CFSTR("Helvetica"), 2, 0, 0, 1, 0, (double)a1, 0.0);
  v1 = (unint64_t *)((char *)&__boldTable + 8 * (a1 - 10));
  if (!*v1)
  {
    v3 = UINewFont((uint64_t)CFSTR("Helvetica"), 2, 0, 0, 1, 0, (double)a1, 0.0);
    if (v3)
    {
      while (!__ldaxr(v1))
      {
        if (!__stlxr((unint64_t)v3, v1))
          return (CTFontRef)*v1;
      }
      __clrex();

    }
  }
  return (CTFontRef)*v1;
}

uint64_t UIContentSizeCategoryDidChangeNotificationFunction()
{
  return constantUIContentSizeCategoryDidChangeNotification;
}

void __NSLoadWebKit()
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ____NSLoadWebKit_block_invoke_2;
  block[3] = &unk_1E260C058;
  block[4] = &__block_literal_global_1319;
  if (__NSLoadWebKit_onceToken != -1)
    dispatch_once(&__NSLoadWebKit_onceToken, block);
}

uint64_t _dateForString(void *a1)
{
  id v2;
  void *v3;
  id v4;
  char *v5;
  int v6;
  char v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  char v12;
  int v13;
  int v14;
  char v15;
  int v16;
  int v17;
  char v18;
  int v19;
  int v20;
  char v21;
  int v22;
  int v23;
  uint64_t v24;

  v2 = objc_alloc(MEMORY[0x1E0C99D48]);
  v3 = (void *)objc_msgSend(v2, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  v5 = (char *)objc_msgSend(a1, "UTF8String");
  v6 = *v5;
  if ((v6 - 48) > 9)
  {
    v9 = 0;
  }
  else
  {
    v7 = 0;
    do
    {
      v8 = *++v5;
      v7 = v6 + 10 * v7 - 48;
      LOBYTE(v6) = v8;
    }
    while ((v8 - 48) < 0xA);
    v9 = v7;
  }
  objc_msgSend(v4, "setYear:", v9);
  if (*v5 != 45
    || (v10 = v5[1], (v10 - 48) > 9)
    || (v11 = v5[2], (v11 - 48) > 9)
    || (v12 = v11 + 10 * v10 - 16, v9 = v12, v5[3] != 45))
  {
    objc_msgSend(v4, "setMonth:", v9);
LABEL_24:
    objc_msgSend(v4, "setDay:", v9);
LABEL_25:
    objc_msgSend(v4, "setHour:", v9);
LABEL_26:
    objc_msgSend(v4, "setMinute:", v9);
LABEL_27:
    v24 = 0;
    goto LABEL_28;
  }
  objc_msgSend(v4, "setMonth:", v12);
  v13 = v5[4];
  if ((v13 - 48) > 9)
    goto LABEL_24;
  v14 = v5[5];
  if ((v14 - 48) > 9)
    goto LABEL_24;
  v15 = v14 + 10 * v13 - 16;
  v9 = v15;
  if (v5[6] != 84)
    goto LABEL_24;
  objc_msgSend(v4, "setDay:", v15);
  v16 = v5[7];
  if ((v16 - 48) > 9)
    goto LABEL_25;
  v17 = v5[8];
  if ((v17 - 48) > 9)
    goto LABEL_25;
  v18 = v17 + 10 * v16 - 16;
  v9 = v18;
  if (v5[9] != 58)
    goto LABEL_25;
  objc_msgSend(v4, "setHour:", v18);
  v19 = v5[10];
  if ((v19 - 48) > 9)
    goto LABEL_26;
  v20 = v5[11];
  if ((v20 - 48) > 9)
    goto LABEL_26;
  v21 = v20 + 10 * v19 - 16;
  if (v5[12] != 58)
  {
    v9 = v21;
    goto LABEL_26;
  }
  objc_msgSend(v4, "setMinute:", v21);
  v22 = v5[13];
  if ((v22 - 48) > 9)
    goto LABEL_27;
  v23 = v5[14];
  if ((v23 - 48) > 9 || v5[15] != 90)
    goto LABEL_27;
  objc_msgSend(v4, "setSecond:", (char)(v23 + 10 * v22 - 16));
  v24 = objc_msgSend(v3, "dateFromComponents:", v4);
LABEL_28:

  return v24;
}

uint64_t _colCompare(void *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(a1, "startingColumn");
  v4 = objc_msgSend(a2, "startingColumn");
  if (v3 < v4)
    return -1;
  else
    return v3 != v4;
}

uint64_t _fontNameForFont(UIFont *a1)
{
  NSString *v2;
  NSString *v3;
  NSArray *v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  UIFont *v8;
  uint64_t v9;
  uint64_t v10;
  UIFont *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  int v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  _BOOL4 v23;

  v2 = -[UIFont familyName](a1, "familyName");
  if (_fontNameForFont_onceToken != -1)
    dispatch_once(&_fontNameForFont_onceToken, &__block_literal_global_1347);
  v3 = -[UIFont fontName](a1, "fontName");
  v4 = +[UIFont fontNamesForFamilyName:](UIFont, "fontNamesForFamilyName:", v2);
  v5 = -[NSArray count](v4, "count");
  v23 = -[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("LastResort"));
  if (!v23)
  {
    v6 = 0;
    if (!v4 || !v5)
      goto LABEL_34;
    v7 = -[UIFont traits](a1, "traits");
    v8 = a1;
    if ((v7 & 2) != 0)
    {
      v9 = -[UIFont familyName](a1, "familyName");
      -[UIFont pointSize](a1, "pointSize");
      v8 = +[UIFont fontWithFamilyName:traits:size:](UIFont, "fontWithFamilyName:traits:size:", v9, v7 & 0xFFFFFFFD);
    }
    if ((v7 & 1) != 0)
    {
      v10 = -[UIFont familyName](v8, "familyName");
      -[UIFont pointSize](v8, "pointSize");
      v8 = +[UIFont fontWithFamilyName:traits:size:](UIFont, "fontWithFamilyName:traits:size:", v10, v7 & 0xFFFFFFFE);
    }
    if (v8)
      v11 = v8;
    else
      v11 = a1;
    v12 = -[UIFont fontName](v11, "fontName");
    v13 = 0;
    while (1)
    {
      v14 = -[NSArray objectAtIndex:](v4, "objectAtIndex:", v13);
      if ((objc_msgSend(v14, "isEqualToString:", v3) & 1) != 0)
      {
        if (v5 < 3)
          goto LABEL_30;
      }
      else
      {
        v15 = objc_msgSend(v14, "isEqualToString:", v12);
        v6 = 0;
        if (!v15 || v5 <= 2)
          goto LABEL_31;
      }
      v6 = -[NSArray objectAtIndex:](v4, "objectAtIndex:", 1);
      if (v6)
      {
        v16 = (void *)v6;
        if (-[NSString hasSuffix:](v2, "hasSuffix:", v6))
          goto LABEL_30;
        v6 = objc_msgSend((id)_fontNameForFont_faceNamesToAdd, "count");
        if (v6)
        {
          v17 = v6;
          v18 = 0;
          do
          {
            v19 = objc_msgSend(v16, "compare:options:", objc_msgSend((id)_fontNameForFont_faceNamesToAdd, "objectAtIndex:", v18++), 1);
            if (v19)
              v20 = v18 >= v17;
            else
              v20 = 1;
          }
          while (!v20);
          if (v19)
          {
LABEL_30:
            v6 = 0;
            goto LABEL_31;
          }
          v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v2, v16);
          if (v6)
            goto LABEL_34;
        }
      }
LABEL_31:
      if (++v13 >= v5)
        goto LABEL_34;
    }
  }
  v6 = 0;
LABEL_34:
  if (v6)
    v21 = v6;
  else
    v21 = (uint64_t)v2;
  if (v23)
    return 0;
  else
    return v21;
}

void sub_18D6ABE08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _colorValForColor_0(void *a1)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (!a1)
    return 0x7FFFFFFFFFFFFFFFLL;
  getUIColorClass_0[0]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = 0.0;
    v6 = 0.0;
    v7 = 0.0;
    v4 = 0.0;
    v5 = 0.0;
    if (objc_msgSend(a1, "getRed:green:blue:alpha:", &v8, &v7, &v6, &v5))
      return (int)((vcvtmd_s64_f64(v8 * 255.0 + 0.5) << 24) | (vcvtmd_s64_f64(v7 * 255.0 + 0.5) << 16) | (vcvtmd_s64_f64(v6 * 255.0 + 0.5) << 8) | vcvtmd_s64_f64(v5 * 255.0 + 0.5));
    if (objc_msgSend(a1, "getWhite:alpha:", &v4, &v5))
      return (int)((16843008 * vcvtmd_s64_f64(v4 * 255.0 + 0.5)) | vcvtmd_s64_f64(v5 * 255.0 + 0.5));
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t _rgbaString(uint64_t a1)
{
  unsigned int v1;
  double v2;

  if (a1 == 0x7FFFFFFFFFFFFFFFLL)
    v1 = 255;
  else
    v1 = a1;
  if ((_BYTE)v1)
  {
    v2 = 1.0;
    if (v1 != 255)
      v2 = (double)v1 / 255.0;
  }
  else
  {
    v2 = 0.0;
  }
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rgba(%u, %u, %u, %.2g)"), HIBYTE(v1), BYTE2(v1), BYTE1(v1), *(_QWORD *)&v2);
}

void sub_18D6ACDE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *_escapedStringForString(void *a1, int a2)
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;

  v4 = objc_msgSend(a1, "length");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  if (v4)
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = objc_msgSend(a1, "characterAtIndex:", v6);
      v9 = v8;
      if ((v8 > 0x3E || ((1 << v8) & 0x5000004000000000) == 0) && ((_DWORD)v8 != 34 || !a2))
      {
        if (++v6 == v4 && v4 > v7)
          objc_msgSend(v5, "appendString:", objc_msgSend(a1, "substringWithRange:", v7, v4 - v7));
        continue;
      }
      v10 = v6 - v7;
      if (v6 > v7)
        objc_msgSend(v5, "appendString:", objc_msgSend(a1, "substringWithRange:", v7, v10));
      if ((int)v9 > 59)
      {
        if ((_DWORD)v9 == 62)
        {
          v11 = v5;
          v12 = CFSTR("&gt;");
        }
        else
        {
          if ((_DWORD)v9 != 60)
          {
LABEL_22:
            objc_msgSend(v5, "appendFormat:", CFSTR("&#x%X;"), v10, v9);
            goto LABEL_23;
          }
          v11 = v5;
          v12 = CFSTR("&lt;");
        }
      }
      else if ((_DWORD)v9 == 34)
      {
        v11 = v5;
        v12 = CFSTR("&quot;");
      }
      else
      {
        if ((_DWORD)v9 != 38)
          goto LABEL_22;
        v11 = v5;
        v12 = CFSTR("&amp;");
      }
      objc_msgSend(v11, "appendString:", v12, v10);
LABEL_23:
      v7 = ++v6;
    }
    while (v6 != v4);
  }
  return v5;
}

uint64_t init_UIApplicationLoadWebKit()
{
  void *v0;
  uint64_t (*v1)();

  v0 = (void *)__NSGetFrameworkReference(0, 0);
  v1 = (uint64_t (*)())dlsym(v0, "_UIApplicationLoadWebKit");
  softLink_UIApplicationLoadWebKit[0] = v1;
  if (!v1)
    init_UIApplicationLoadWebKit_cold_1();
  return v1();
}

Class initNSColor_4()
{
  Class result;

  __NSGetFrameworkReference(0, 0);
  result = objc_getClass("NSColor");
  classNSColor_4 = (uint64_t)result;
  if (!result)
    initNSColor_cold_1_4();
  getNSColorClass_4[0] = NSColorFunction_4;
  return result;
}

uint64_t NSColorFunction_4()
{
  return classNSColor_4;
}

uint64_t initWebThreadLock()
{
  void *v0;
  uint64_t (*v1)();

  v0 = (void *)__NSGetFrameworkReference(CFSTR("WebCore"), 1);
  v1 = (uint64_t (*)())dlsym(v0, "WebThreadLock");
  softLinkWebThreadLock[0] = v1;
  if (!v1)
    initWebThreadLock_cold_1();
  return v1();
}

uint64_t initWebThreadIsLocked()
{
  void *v0;
  uint64_t (*v1)();

  v0 = (void *)__NSGetFrameworkReference(CFSTR("WebCore"), 1);
  v1 = (uint64_t (*)())dlsym(v0, "WebThreadIsLocked");
  softLinkWebThreadIsLocked[0] = v1;
  if (!v1)
    initWebThreadIsLocked_cold_1();
  return v1();
}

uint64_t ___fontNameForFont_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("Condensed"), CFSTR("Light"), CFSTR("SemiBold"), CFSTR("UltraLight"), CFSTR("ExtraBlack"), CFSTR("Ornaments"), 0);
  _fontNameForFont_faceNamesToAdd = result;
  return result;
}

uint64_t writeCharacters(uint64_t result, const __CFString *a2, CFIndex a3, uint64_t a4, unsigned int a5)
{
  uint64_t v6;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  char *v13;
  int v14;
  uint64_t v15;
  unsigned int v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v20;
  char *v21;
  char v22;
  unsigned int v23;
  int v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v28;
  char __str[40];
  _BYTE v30[501];
  uint64_t v31;

  v6 = a4;
  v8 = (void *)result;
  v31 = *MEMORY[0x1E0C80C00];
  v9 = 1;
  if (a5 > 0x19 || ((1 << a5) & 0x200000E) == 0)
    v9 = a5 - 1056 < 4;
  if (a4)
  {
    v28 = 0;
    do
    {
      v25 = &v28;
      v10 = v6;
      result = __CFStringEncodeByteStream();
      if (result)
      {
        v11 = result;
        v6 = v10 - result;
        v30[v28] = 0;
        LOBYTE(v12) = v30[0];
        if (v30[0])
        {
          v26 = v10 - result;
          v13 = v30;
          do
          {
            LOBYTE(v14) = v12;
            if ((char)v12 < 1)
            {
              v20 = 0;
            }
            else
            {
              v15 = 0;
              while (1)
              {
                v16 = v14 - 92;
                v17 = v16 > 0x21;
                v18 = (1 << v16) & 0x280000001;
                if (!v17 && v18 != 0)
                  break;
                v20 = v15 + 1;
                v14 = v13[++v15];
                if (v14 < 1)
                  goto LABEL_19;
              }
              v20 = v15;
            }
LABEL_19:
            v21 = &v13[v20];
            result = objc_msgSend(v8, "appendBytes:length:", v25);
            v12 = *v21;
            if (!*v21)
              break;
            if (v12 < 0)
            {
              do
              {
                snprintf(__str, 0x28uLL, "\\'%x", v12);
                result = objc_msgSend(v8, "appendBytes:length:", __str, strlen(__str));
                if (v9)
                {
                  if (a5 != 1056 && a5 != 1
                    || (v23 = *v21, v23 > 0xDF)
                    || (v23 + 127) <= 0x1Eu)
                  {
                    if (v21[1])
                    {
                      snprintf(__str, 0x28uLL, "\\'%x", v21[1]);
                      result = objc_msgSend(v8, "appendBytes:length:", __str, strlen(__str));
                      ++v21;
                    }
                  }
                }
                v24 = *++v21;
                LOBYTE(v12) = v24;
              }
              while (v24 < 0);
            }
            else
            {
              objc_msgSend(v8, "appendBytes:length:", "\\", 1);
              result = objc_msgSend(v8, "appendBytes:length:", v21, 1);
              v22 = *++v21;
              LOBYTE(v12) = v22;
            }
            v13 = v21;
          }
          while ((_BYTE)v12);
          v6 = v26;
        }
      }
      else
      {
        if (writeCharacters_writeOldForm == 254)
          writeCharacters_writeOldForm = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults", &v28), "BOOLForKey:", CFSTR("NSRTFWriteOldUnicodeForm"));
        CFStringGetCharacterAtIndex(a2, a3);
        if (writeCharacters_writeOldForm)
          snprintf(__str, 0x28uLL, "\\U%d %s\\u%d ");
        else
          snprintf(__str, 0x28uLL, "%s\\u%d ");
        result = objc_msgSend(v8, "appendBytes:length:", __str, strlen(__str));
        v6 = v10 - 1;
        v11 = 1;
      }
      a3 += v11;
    }
    while (v6);
  }
  return result;
}

uint64_t __NSLayoutSectionComparator(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  BOOL v7;
  uint64_t v8;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = a2[1];
  if (v3 == v5)
    goto LABEL_4;
  if (!v3)
    return 1;
  if (!v5)
    return -1;
LABEL_4:
  v6 = v2 >= v4;
  v7 = v2 == v4;
  v8 = -1;
  if (v6)
    v8 = 1;
  if (v7)
    return 0;
  else
    return v8;
}

uint64_t RGBColorForColor(void *a1)
{
  CFTypeID v2;
  CFTypeID TypeID;
  Class NSColorClass_5;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;

  v2 = CFGetTypeID(a1);
  TypeID = CGColorGetTypeID();
  if (!a1 || v2 != TypeID)
  {
    getUIColorClass_1[0]();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = 0.0;
      v13 = 0.0;
      v10 = 0.0;
      v11 = 0.0;
      if (objc_msgSend(a1, "getRed:green:blue:alpha:", &v13, &v12, &v11, &v10))
      {
        NSColorClass_5 = getNSColorClass_5();
        v6 = v12;
        v5 = v13;
        v8 = v10;
        v7 = v11;
        return -[objc_class colorWithCalibratedRed:green:blue:alpha:](NSColorClass_5, "colorWithCalibratedRed:green:blue:alpha:", v5, v6, v7, v8);
      }
      if (objc_msgSend(a1, "getWhite:alpha:", &v13, &v10))
      {
        NSColorClass_5 = getNSColorClass_5();
        v5 = v13;
        v8 = v10;
        v6 = v13;
        v7 = v13;
        return -[objc_class colorWithCalibratedRed:green:blue:alpha:](NSColorClass_5, "colorWithCalibratedRed:green:blue:alpha:", v5, v6, v7, v8);
      }
    }
  }
  return 0;
}

uint64_t newCGColorByConvertingToColorSpaceWithName(int a1, CFStringRef name)
{
  CGColorSpaceRef v2;
  CGColorSpaceRef v3;
  uint64_t v4;

  v2 = CGColorSpaceCreateWithName(name);
  if (!v2)
    return 0;
  v3 = v2;
  if (MEMORY[0x18D79077C](v2, 0))
  {
    v4 = CGColorTransformConvertColor();
    CGColorTransformRelease();
  }
  else
  {
    v4 = 0;
  }
  CFRelease(v3);
  return v4;
}

uint64_t thoroughDataHash(void *a1)
{
  unint64_t v2;
  uint64_t v3;

  objc_msgSend(a1, "bytes");
  v2 = objc_msgSend(a1, "length");
  v3 = CFHashBytes();
  if (v2 >= 0x41)
  {
    v3 ^= CFHashBytes();
    if (v2 >= 0x61)
      return CFHashBytes() ^ v3;
  }
  return v3;
}

void sub_18D6BD338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initNSColor_5()
{
  Class result;

  __NSGetFrameworkReference(0, 0);
  result = objc_getClass("NSColor");
  classNSColor_5 = (uint64_t)result;
  if (!result)
    initNSColor_cold_1_5();
  getNSColorClass_5 = NSColorFunction_5;
  return result;
}

uint64_t NSColorFunction_5()
{
  return classNSColor_5;
}

void sub_18D6BD504(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D6BD81C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void initUIGraphicsBeginImageContextWithOptions_cold_1()
{
  __assert_rtn("initUIGraphicsBeginImageContextWithOptions", "NSLayoutManager_ViewSupport.m", 43, "softLinkUIGraphicsBeginImageContextWithOptions");
}

void initUIGraphicsGetImageFromCurrentImageContext_cold_1()
{
  __assert_rtn("initUIGraphicsGetImageFromCurrentImageContext", "NSLayoutManager_ViewSupport.m", 44, "softLinkUIGraphicsGetImageFromCurrentImageContext");
}

void initUIGraphicsEndImageContext_cold_1()
{
  __assert_rtn("initUIGraphicsEndImageContext", "NSLayoutManager_ViewSupport.m", 45, "softLinkUIGraphicsEndImageContext");
}

void initNSColor_cold_1()
{
  __assert_rtn("initNSColor", "NSLayoutManager_ViewSupport.m", 36, "classNSColor");
}

void initNSColor_cold_1_0()
{
  __assert_rtn("initNSColor", "NSLayoutManager_Private.m", 60, "classNSColor");
}

void initUIRectIntegralWithScale_cold_1()
{
  __assert_rtn("initUIRectIntegralWithScale", "NSLayoutManager_Private.m", 65, "softLinkUIRectIntegralWithScale");
}

void initUIColor_cold_1()
{
  __assert_rtn("initUIColor", "NSTextGraphicsContextProvider.m", 16, "classUIColor");
}

void initNSColor_cold_1_1()
{
  __assert_rtn("initNSColor", "NSTextGraphicsContextProvider.m", 18, "classNSColor");
}

void initUIGraphicsGetCurrentContext_cold_1()
{
  __assert_rtn("initUIGraphicsGetCurrentContext", "NSTextGraphicsContextProvider.m", 22, "softLinkUIGraphicsGetCurrentContext");
}

void initNSColor_cold_1_2()
{
  __assert_rtn("initNSColor", "NSShadow.m", 22, "classNSColor");
}

void UINibDecoderDecodeDictionary_cold_1()
{
  __assert_rtn("UINibDecoderDecodeDictionary", "UINibDecoder.m", 648, "count >= 1 && \"It isn't possible to get here with count == 0.\"");
}

void UINibDecoderDecodeSet_cold_1()
{
  __assert_rtn("UINibDecoderDecodeSet", "UINibDecoder.m", 628, "count >= 1 && \"It isn't possible to get here with count == 0.\"");
}

void initUIImage_cold_1()
{
  __assert_rtn("initUIImage", "UIFoundation_UIKitAdditions.m", 35, "classUIImage");
}

void initUIGraphicsGetCurrentContext_cold_1_0()
{
  __assert_rtn("initUIGraphicsGetCurrentContext", "UIFoundation_UIKitAdditions.m", 40, "softLinkUIGraphicsGetCurrentContext");
}

void initUIGraphicsPushContext_cold_1()
{
  __assert_rtn("initUIGraphicsPushContext", "UIFoundation_UIKitAdditions.m", 41, "softLinkUIGraphicsPushContext");
}

void initUIGraphicsPopContext_cold_1()
{
  __assert_rtn("initUIGraphicsPopContext", "UIFoundation_UIKitAdditions.m", 42, "softLinkUIGraphicsPopContext");
}

void _NSCopyBreakIterator_cold_1()
{
  __assert_rtn("_NSCopyBreakIterator", "_NSCopyBreakIterator.m", 68, "flags < _NSCopyBreakIteratorFlagsMax");
}

void initSwiftUITextAnimationProviderClass_cold_1()
{
  __assert_rtn("initSwiftUITextAnimationProviderClass", "NSStringDrawing.m", 27, "softLinkSwiftUITextAnimationProviderClass");
}

void __NSCoreTypesetterHyphenateLine_cold_1()
{
  __assert_rtn("__NSCoreTypesetterHyphenateLine", "NSCoreTypesetter.m", 808, "!\"failed to get hyphenated line\"");
}

void __attributedStringAtKeyframe_block_invoke_2_cold_1()
{
  __assert_rtn("attributedStringAtKeyframe_block_invoke_2", "NSCoreTypesetter.m", 2236, "subAttrStr.length == resolvedAttrStr.length");
}

void UIWriteArchiveToData_cold_1()
{
  __assert_rtn("UIWriteArchiveToData", "UINibEncoderDataGeneration.m", 182, "scopeID >= previousScopeID && \"Scopes are out of order.\"");
}

void UIWriteArchiveToData_cold_2()
{
  __assert_rtn("UIWriteArchiveToData", "UINibEncoderDataGeneration.m", 249, "className && \"objectIDsToClasses must have the keys 0 through (count - 1).\"");
}

void UIWriteArchiveToData_cold_3()
{
  __assert_rtn("UIWriteArchiveToData", "UINibEncoderDataGeneration.m", 253, "classID && (!valueStart || (valueStart && valueCount)) && \"Either classID, valueStart, or valueCount is missing.\"");
}

void initNSImage_cold_1()
{
  __assert_rtn("initNSImage", "NSTextAttachment.m", 44, "classNSImage");
}

void initUIImage_cold_1_0()
{
  __assert_rtn("initUIImage", "NSTextAttachment.m", 42, "classUIImage");
}

void initUIImagePNGRepresentation_cold_1()
{
  __assert_rtn("initUIImagePNGRepresentation", "NSTextAttachment.m", 41, "softLinkUIImagePNGRepresentation");
}

void initNSTextAttachmentView_cold_1()
{
  __assert_rtn("initNSTextAttachmentView", "NSTextAttachment.m", 46, "classNSTextAttachmentView");
}

void initUITextAttachmentView_cold_1()
{
  __assert_rtn("initUITextAttachmentView", "NSTextAttachment.m", 43, "classUITextAttachmentView");
}

void init_UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection_cold_1()
{
  __assert_rtn("init_UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection", "NSTextAttachment.m", 62, "softLink_UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection");
}

void initNSColor_cold_1_3()
{
  __assert_rtn("initNSColor", "NSRTFReader.m", 72, "classNSColor");
}

void initUIContentSizeCategoryUnspecified_cold_1()
{
  __assert_rtn("initUIContentSizeCategoryUnspecified", "UIFont.m", 56, "constant");
}

void initUIContentSizeCategoryDidChangeNotification_cold_1()
{
  __assert_rtn("initUIContentSizeCategoryDidChangeNotification", "UIFont.m", 54, "constant");
}

void initUIApplicationDidEnterBackgroundNotification_cold_1()
{
  __assert_rtn("initUIApplicationDidEnterBackgroundNotification", "UIFont.m", 55, "constant");
}

void init_UIApplicationLoadWebKit_cold_1()
{
  __assert_rtn("init_UIApplicationLoadWebKit", "NSHTMLReader.m", 73, "softLink_UIApplicationLoadWebKit");
}

void initUIColor_cold_1_0()
{
  __assert_rtn("initUIColor", "NSHTMLReader.m", 74, "classUIColor");
}

void initNSColor_cold_1_4()
{
  __assert_rtn("initNSColor", "NSHTMLReader.m", 63, "classNSColor");
}

void initWebThreadLock_cold_1()
{
  __assert_rtn("initWebThreadLock", "NSHTMLReader.m", 70, "softLinkWebThreadLock");
}

void initWebThreadIsLocked_cold_1()
{
  __assert_rtn("initWebThreadIsLocked", "NSHTMLReader.m", 71, "softLinkWebThreadIsLocked");
}

void initUIColor_cold_1_1()
{
  __assert_rtn("initUIColor", "NSRTFWriter.m", 39, "classUIColor");
}

void initNSColor_cold_1_5()
{
  __assert_rtn("initNSColor", "NSRTFWriter.m", 35, "classNSColor");
}

void initUIApplicationDidEnterBackgroundNotification_cold_1_0()
{
  __assert_rtn("initUIApplicationDidEnterBackgroundNotification", "_UICache.m", 19, "constant");
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x1E0C97CE8](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x1E0C97D00](theArray, range.location, range.length, applier, context);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D50](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
  MEMORY[0x1E0C97DA8](theArray, range.location, range.length, values);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x1E0C97DB8](theArray);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

void CFArrayReplaceValues(CFMutableArrayRef theArray, CFRange range, const void **newValues, CFIndex newCount)
{
  MEMORY[0x1E0C97DC8](theArray, range.location, range.length, newValues, newCount);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
  MEMORY[0x1E0C97DE0](theArray, range.location, range.length, comparator, context);
}

uint64_t CFAttributedStringGetBidiLevelsAndResolvedDirections()
{
  return MEMORY[0x1E0C97E40]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x1E0C97FF8](bundle);
}

CFArrayRef CFBundleCopyPreferredLocalizationsFromArray(CFArrayRef locArray)
{
  return (CFArrayRef)MEMORY[0x1E0C98070](locArray);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0C98180](bundle, key);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutableCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFMutableCharacterSetRef)MEMORY[0x1E0C982D0](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982F0](theSetIdentifier);
}

uint64_t CFCharacterSetInitInlineBuffer()
{
  return MEMORY[0x1E0C98308]();
}

void CFCharacterSetInvert(CFMutableCharacterSetRef theSet)
{
  MEMORY[0x1E0C98318](theSet);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1E0C98320](theSet, theChar);
}

Boolean CFCharacterSetIsLongCharacterMember(CFCharacterSetRef theSet, UTF32Char theChar)
{
  return MEMORY[0x1E0C98328](theSet, *(_QWORD *)&theChar);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1E0C98350](cf);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x1E0C985D8](theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1E0C98720](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

uint64_t CFHashBytes()
{
  return MEMORY[0x1E0C98760]();
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1E0C98770]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1E0C98798](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLocaleIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987B0](allocator, localeIdentifier);
}

CFDictionaryRef CFLocaleCreateComponentsFromLocaleIdentifier(CFAllocatorRef allocator, CFLocaleIdentifier localeID)
{
  return (CFDictionaryRef)MEMORY[0x1E0C987B8](allocator, localeID);
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x1E0C98800](locale, key);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98858](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

uint64_t CFQSortArray()
{
  return MEMORY[0x1E0C98B08]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BE8](rl, observer, mode);
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C00](rl, timer, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x1E0C98C60](allocator, activities, repeats, order, callout, context);
}

void CFRunLoopObserverInvalidate(CFRunLoopObserverRef observer)
{
  MEMORY[0x1E0C98C78](observer);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1E0C98CB0](mode, returnAfterSourceHandled, seconds);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D00](rl);
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x1E0C98D08](allocator, flags, order, callout, context, fireDate, interval);
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
  MEMORY[0x1E0C98D48](timer);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98D78](theSet, applier, context);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1E0C98D80](theSet, value);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x1E0C98D88](allocator, values, numValues, callBacks);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x1E0C98DC0](theSet, value);
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
  MEMORY[0x1E0C98DD8](theSet);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DE0](theSet, value);
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DF0](theSet, value);
}

uint64_t CFStorageCreate()
{
  return MEMORY[0x1E0C98E78]();
}

uint64_t CFStorageDeleteValues()
{
  return MEMORY[0x1E0C98E88]();
}

uint64_t CFStorageGetCount()
{
  return MEMORY[0x1E0C98E98]();
}

uint64_t CFStorageGetValueAtIndex()
{
  return MEMORY[0x1E0C98EA0]();
}

uint64_t CFStorageInsertValues()
{
  return MEMORY[0x1E0C98EB0]();
}

uint64_t CFStorageReplaceValues()
{
  return MEMORY[0x1E0C98EB8]();
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
  MEMORY[0x1E0C98EE8](theString, chars, numChars);
}

CFStringRef CFStringConvertEncodingToIANACharSetName(CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98F28](*(_QWORD *)&encoding);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x1E0C98F30](*(_QWORD *)&encoding);
}

UInt32 CFStringConvertEncodingToWindowsCodepage(CFStringEncoding encoding)
{
  return MEMORY[0x1E0C98F38](*(_QWORD *)&encoding);
}

CFStringEncoding CFStringConvertIANACharSetNameToEncoding(CFStringRef theString)
{
  return MEMORY[0x1E0C98F40](theString);
}

CFStringEncoding CFStringConvertNSStringEncodingToEncoding(unint64_t encoding)
{
  return MEMORY[0x1E0C98F48](encoding);
}

CFStringEncoding CFStringConvertWindowsCodepageToEncoding(UInt32 codepage)
{
  return MEMORY[0x1E0C98F50](*(_QWORD *)&codepage);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableWithExternalCharactersNoCopy(CFAllocatorRef alloc, UniChar *chars, CFIndex numChars, CFIndex capacity, CFAllocatorRef externalCharactersAllocator)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98FA0](alloc, chars, numChars, capacity, externalCharactersAllocator);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FF8](alloc, chars, numChars, contentsDeallocator);
}

uint64_t CFStringEncodingBytesToUnicode()
{
  return MEMORY[0x1E0C99040]();
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1E0C990B0](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

CFIndex CFStringGetHyphenationLocationBeforeIndex(CFStringRef string, CFIndex location, CFRange limitRange, CFOptionFlags options, CFLocaleRef locale, UTF32Char *character)
{
  return MEMORY[0x1E0C990E8](string, location, limitRange.location, limitRange.length, options, locale, character);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

uint64_t CFStringGetRangeOfCharacterClusterAtIndex()
{
  return MEMORY[0x1E0C99158]();
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x1E0C99168]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1E0C99180](theString, prefix);
}

Boolean CFStringIsEncodingAvailable(CFStringEncoding encoding)
{
  return MEMORY[0x1E0C991C0](*(_QWORD *)&encoding);
}

Boolean CFStringIsHyphenationAvailableForLocale(CFLocaleRef locale)
{
  return MEMORY[0x1E0C991C8](locale);
}

uint64_t CFStringOpenUText()
{
  return MEMORY[0x1E0C991E0]();
}

void CFStringSetExternalCharactersNoCopy(CFMutableStringRef theString, UniChar *chars, CFIndex length, CFIndex capacity)
{
  MEMORY[0x1E0C99200](theString, chars, length, capacity);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1E0C99208](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1E0C99220](alloc, string, range.location, range.length, options, locale);
}

CFIndex CFStringTokenizerGetCurrentSubTokens(CFStringTokenizerRef tokenizer, CFRange *ranges, CFIndex maxRangeLength, CFMutableArrayRef derivedSubTokens)
{
  return MEMORY[0x1E0C99228](tokenizer, ranges, maxRangeLength, derivedSubTokens);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x1E0C99230](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

CFStringTokenizerTokenType CFStringTokenizerGoToTokenAtIndex(CFStringTokenizerRef tokenizer, CFIndex index)
{
  return MEMORY[0x1E0C99238](tokenizer, index);
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
  MEMORY[0x1E0C99240](tokenizer, string, range.location, range.length);
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x1E0C99248](string, range, transform, reverse);
}

CFDataRef CFURLCreateData(CFAllocatorRef allocator, CFURLRef url, CFStringEncoding encoding, Boolean escapeWhitespace)
{
  return (CFDataRef)MEMORY[0x1E0C993A0](allocator, url, *(_QWORD *)&encoding, escapeWhitespace);
}

uint64_t CFUniCharGetBitmapPtrForPlane()
{
  return MEMORY[0x1E0C99588]();
}

uint64_t CFUniCharGetUnicodePropertyDataForPlane()
{
  return MEMORY[0x1E0C99590]();
}

uint64_t CFUniCharIsMemberOf()
{
  return MEMORY[0x1E0C99598]();
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1E0C9BAA0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAB0](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1E0C9BAB8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x1E0C9BC88](a1, *(_QWORD *)&intent, color, options);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1E0C9BD20](color);
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x1E0C9BD38]();
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1E0C9BDB8](space);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BEC8](space);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1E0C9BED0](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BED8](space);
}

uint64_t CGColorTransformConvertColor()
{
  return MEMORY[0x1E0C9BF78]();
}

uint64_t CGColorTransformCreate()
{
  return MEMORY[0x1E0C9BF90]();
}

uint64_t CGColorTransformRelease()
{
  return MEMORY[0x1E0C9BFA0]();
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9BFC8](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9BFD0](c, x, y);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextBeginPath(CGContextRef c)
{
  MEMORY[0x1E0C9C000](c);
}

void CGContextBeginTransparencyLayer(CGContextRef c, CFDictionaryRef auxiliaryInfo)
{
  MEMORY[0x1E0C9C008](c, auxiliaryInfo);
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C038](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClipToRects(CGContextRef c, const CGRect *rects, size_t count)
{
  MEMORY[0x1E0C9C040](c, rects, count);
}

void CGContextClosePath(CGContextRef c)
{
  MEMORY[0x1E0C9C048](c);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x1E0C9C050](c, transform);
}

CGPoint CGContextConvertPointToDeviceSpace(CGContextRef c, CGPoint point)
{
  double v2;
  double v3;
  CGPoint result;

  MEMORY[0x1E0C9C058](c, (__n128)point, *(__n128 *)&point.y);
  result.y = v3;
  result.x = v2;
  return result;
}

CGPoint CGContextConvertPointToUserSpace(CGContextRef c, CGPoint point)
{
  double v2;
  double v3;
  CGPoint result;

  MEMORY[0x1E0C9C060](c, (__n128)point, *(__n128 *)&point.y);
  result.y = v3;
  result.x = v2;
  return result;
}

CGRect CGContextConvertRectToDeviceSpace(CGContextRef c, CGRect rect)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9C068](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGRect CGContextConvertRectToUserSpace(CGContextRef c, CGRect rect)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9C070](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
  MEMORY[0x1E0C9C200](c);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x1E0C9C218](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRects(CGContextRef c, const CGRect *rects, size_t count)
{
  MEMORY[0x1E0C9C228](c, rects, count);
}

uint64_t CGContextGetBaseCTM()
{
  return MEMORY[0x1E0C9C240]();
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9C250](retstr, c);
}

uint64_t CGContextGetCompositeOperation()
{
  return MEMORY[0x1E0C9C268]();
}

uint64_t CGContextGetFontRenderingStyle()
{
  return MEMORY[0x1E0C9C290]();
}

uint64_t CGContextGetStrokeColorAsColor()
{
  return MEMORY[0x1E0C9C2F8]();
}

CGAffineTransform *__cdecl CGContextGetTextMatrix(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9C308](retstr, c);
}

uint64_t CGContextGetType()
{
  return MEMORY[0x1E0C9C318]();
}

CGAffineTransform *__cdecl CGContextGetUserSpaceToDeviceSpaceTransform(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9C320](retstr, c);
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9C330](c, x, y);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

CGContextRef CGContextRetain(CGContextRef c)
{
  return (CGContextRef)MEMORY[0x1E0C9C378](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
  MEMORY[0x1E0C9C3B8](c, alpha);
}

uint64_t CGContextSetCTM()
{
  return MEMORY[0x1E0C9C3D8]();
}

void CGContextSetCharacterSpacing(CGContextRef c, CGFloat spacing)
{
  MEMORY[0x1E0C9C3E0](c, spacing);
}

uint64_t CGContextSetCompositeOperation()
{
  return MEMORY[0x1E0C9C3E8]();
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetFont(CGContextRef c, CGFontRef font)
{
  MEMORY[0x1E0C9C420](c, font);
}

uint64_t CGContextSetFontRenderingStyle()
{
  return MEMORY[0x1E0C9C430]();
}

void CGContextSetFontSize(CGContextRef c, CGFloat size)
{
  MEMORY[0x1E0C9C438](c, size);
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
  MEMORY[0x1E0C9C468](c, *(_QWORD *)&cap);
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
  MEMORY[0x1E0C9C470](c, lengths, count, phase);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x1E0C9C480](c, width);
}

void CGContextSetPatternPhase(CGContextRef c, CGSize phase)
{
  MEMORY[0x1E0C9C498](c, (__n128)phase, *(__n128 *)&phase.height);
}

void CGContextSetShadow(CGContextRef c, CGSize offset, CGFloat blur)
{
  MEMORY[0x1E0C9C4B8](c, (__n128)offset, *(__n128 *)&offset.height, blur);
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
  MEMORY[0x1E0C9C4C0](c, color, (__n128)offset, *(__n128 *)&offset.height, blur);
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
  MEMORY[0x1E0C9C4C8](c, shouldAntialias);
}

void CGContextSetTextDrawingMode(CGContextRef c, CGTextDrawingMode mode)
{
  MEMORY[0x1E0C9C520](c, *(_QWORD *)&mode);
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
  MEMORY[0x1E0C9C530](c, t);
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9C538](c, x, y);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x1E0C9C570](c);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

uint64_t CGFontCreateGlyphPath()
{
  return MEMORY[0x1E0C9C740]();
}

uint64_t CGFontGetGlyphVerticalOffsets()
{
  return MEMORY[0x1E0C9C808]();
}

uint64_t CGFontGetGlyphsForCIDs()
{
  return MEMORY[0x1E0C9C818]();
}

uint64_t CGFontGetRegistryOrderingSupplement()
{
  return MEMORY[0x1E0C9C850]();
}

int CGFontGetUnitsPerEm(CGFontRef font)
{
  return MEMORY[0x1E0C9C878](font);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC530](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC5F0](isrc);
}

void CGPDFContextSetURLForRect(CGContextRef context, CFURLRef url, CGRect rect)
{
  MEMORY[0x1E0C9CEF0](context, url, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2A8](path, m, x, y);
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2C0](path, m, cpx, cpy, x, y);
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
  MEMORY[0x1E0C9D2E8](path, info, function);
}

CGPathRef CGPathCreateCopyByUnioningPath(CGPathRef path, CGPathRef maskPath, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x1E0C9D360](path, maskPath, evenOddFillRule);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

uint64_t CGPathCreateWithContinuousRoundedRect()
{
  return MEMORY[0x1E0C9D3B0]();
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3C8](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3D0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

uint64_t CGPathCreateWithUnevenCornersRoundedRect()
{
  return MEMORY[0x1E0C9D3E0]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D490](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1E0C9D620](dict, rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFTypeRef CTFontCopyAttribute(CTFontRef font, CFStringRef attribute)
{
  return (CFTypeRef)MEMORY[0x1E0CA7968](font, attribute);
}

CFCharacterSetRef CTFontCopyCharacterSet(CTFontRef font)
{
  return (CFCharacterSetRef)MEMORY[0x1E0CA7978](font);
}

CFStringRef CTFontCopyFamilyName(CTFontRef font)
{
  return (CFStringRef)MEMORY[0x1E0CA7990](font);
}

CFArrayRef CTFontCopyFeatureSettings(CTFontRef font)
{
  return (CFArrayRef)MEMORY[0x1E0CA7998](font);
}

CTFontDescriptorRef CTFontCopyFontDescriptor(CTFontRef font)
{
  return (CTFontDescriptorRef)MEMORY[0x1E0CA79B0](font);
}

CGFontRef CTFontCopyGraphicsFont(CTFontRef font, CTFontDescriptorRef *attributes)
{
  return (CGFontRef)MEMORY[0x1E0CA79C8](font, attributes);
}

CFStringRef CTFontCopyPostScriptName(CTFontRef font)
{
  return (CFStringRef)MEMORY[0x1E0CA79E0](font);
}

uint64_t CTFontCreateEmojiFontForFont()
{
  return MEMORY[0x1E0CA7A40]();
}

uint64_t CTFontCreateForCharactersWithLanguage()
{
  return MEMORY[0x1E0CA7A48]();
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return (CTFontRef)MEMORY[0x1E0CA7A68](*(_QWORD *)&uiType, language, size);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1E0CA7A70](descriptor, matrix, size);
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return (CTFontRef)MEMORY[0x1E0CA7A90](name, matrix, options, size);
}

uint64_t CTFontDescriptorCanCreateWithTextStyle()
{
  return MEMORY[0x1E0CA7A98]();
}

CFTypeRef CTFontDescriptorCopyAttribute(CTFontDescriptorRef descriptor, CFStringRef attribute)
{
  return (CFTypeRef)MEMORY[0x1E0CA7AA0](descriptor, attribute);
}

CFDictionaryRef CTFontDescriptorCopyAttributes(CTFontDescriptorRef descriptor)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA7AA8](descriptor);
}

CTFontDescriptorRef CTFontDescriptorCreateCopyWithAttributes(CTFontDescriptorRef original, CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1E0CA7AB8](original, attributes);
}

CTFontDescriptorRef CTFontDescriptorCreateCopyWithSymbolicTraits(CTFontDescriptorRef original, CTFontSymbolicTraits symTraitValue, CTFontSymbolicTraits symTraitMask)
{
  return (CTFontDescriptorRef)MEMORY[0x1E0CA7AC8](original, *(_QWORD *)&symTraitValue, *(_QWORD *)&symTraitMask);
}

CTFontDescriptorRef CTFontDescriptorCreateMatchingFontDescriptor(CTFontDescriptorRef descriptor, CFSetRef mandatoryAttributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1E0CA7AE8](descriptor, mandatoryAttributes);
}

CFArrayRef CTFontDescriptorCreateMatchingFontDescriptors(CTFontDescriptorRef descriptor, CFSetRef mandatoryAttributes)
{
  return (CFArrayRef)MEMORY[0x1E0CA7AF0](descriptor, mandatoryAttributes);
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1E0CA7B00](attributes);
}

uint64_t CTFontDescriptorCreateWithAttributesAndOptions()
{
  return MEMORY[0x1E0CA7B08]();
}

CTFontDescriptorRef CTFontDescriptorCreateWithNameAndSize(CFStringRef name, CGFloat size)
{
  return (CTFontDescriptorRef)MEMORY[0x1E0CA7B10](name, size);
}

uint64_t CTFontDescriptorCreateWithTextStyleAndAttributes()
{
  return MEMORY[0x1E0CA7B20]();
}

uint64_t CTFontDescriptorGetContentSizeCategoryIndex()
{
  return MEMORY[0x1E0CA7B28]();
}

uint64_t CTFontDescriptorGetOptions()
{
  return MEMORY[0x1E0CA7B30]();
}

uint64_t CTFontDescriptorGetSymbolicTraits()
{
  return MEMORY[0x1E0CA7B38]();
}

uint64_t CTFontDescriptorGetTextStyleSize()
{
  return MEMORY[0x1E0CA7B40]();
}

CFTypeID CTFontDescriptorGetTypeID(void)
{
  return MEMORY[0x1E0CA7B50]();
}

uint64_t CTFontDescriptorsCopyAttribute()
{
  return MEMORY[0x1E0CA7B68]();
}

uint64_t CTFontDrawGlyphsAtPositions()
{
  return MEMORY[0x1E0CA7B78]();
}

uint64_t CTFontDrawGlyphsWithAdvances()
{
  return MEMORY[0x1E0CA7B80]();
}

double CTFontGetAdvancesForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGSize *advances, CFIndex count)
{
  double result;

  MEMORY[0x1E0CA7B98](font, *(_QWORD *)&orientation, glyphs, advances, count);
  return result;
}

CGFloat CTFontGetAscent(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x1E0CA7BA0](font);
  return result;
}

CGRect CTFontGetBoundingBox(CTFontRef font)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0CA7BB0](font);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CTFontGetBoundingRectsForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGRect *boundingRects, CFIndex count)
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  MEMORY[0x1E0CA7BB8](font, *(_QWORD *)&orientation, glyphs, boundingRects, count);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

CGFloat CTFontGetCapHeight(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x1E0CA7BC0](font);
  return result;
}

uint64_t CTFontGetClientObject()
{
  return MEMORY[0x1E0CA7BD0]();
}

CGFloat CTFontGetDescent(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x1E0CA7BD8](font);
  return result;
}

CFIndex CTFontGetGlyphCount(CTFontRef font)
{
  return MEMORY[0x1E0CA7BF0](font);
}

CGGlyph CTFontGetGlyphWithName(CTFontRef font, CFStringRef glyphName)
{
  return MEMORY[0x1E0CA7BF8](font, glyphName);
}

BOOL CTFontGetGlyphsForCharacters(CTFontRef font, const UniChar *characters, CGGlyph *glyphs, CFIndex count)
{
  return MEMORY[0x1E0CA7C08](font, characters, glyphs, count);
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x1E0CA7C10]();
}

uint64_t CTFontGetLatin1GlyphsAndAdvanceWidths()
{
  return MEMORY[0x1E0CA7C18]();
}

CGFloat CTFontGetLeading(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x1E0CA7C20](font);
  return result;
}

CFIndex CTFontGetLigatureCaretPositions(CTFontRef font, CGGlyph glyph, CGFloat *positions, CFIndex maxPositions)
{
  return MEMORY[0x1E0CA7C28](font, glyph, positions, maxPositions);
}

CGAffineTransform *__cdecl CTFontGetMatrix(CGAffineTransform *__return_ptr retstr, CTFontRef font)
{
  return (CGAffineTransform *)MEMORY[0x1E0CA7C30](retstr, font);
}

CGFloat CTFontGetSize(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x1E0CA7C50](font);
  return result;
}

CFStringEncoding CTFontGetStringEncoding(CTFontRef font)
{
  return MEMORY[0x1E0CA7C58](font);
}

CTFontSymbolicTraits CTFontGetSymbolicTraits(CTFontRef font)
{
  return MEMORY[0x1E0CA7C60](font);
}

uint64_t CTFontGetTextStyle()
{
  return MEMORY[0x1E0CA7C68]();
}

uint64_t CTFontGetTransformedAdvancesForGlyphsAndStyle()
{
  return MEMORY[0x1E0CA7C70]();
}

CFTypeID CTFontGetTypeID(void)
{
  return MEMORY[0x1E0CA7C78]();
}

uint64_t CTFontGetUIFontType()
{
  return MEMORY[0x1E0CA7C90]();
}

CGFloat CTFontGetUnderlinePosition(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x1E0CA7C98](font);
  return result;
}

CGFloat CTFontGetUnderlineThickness(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x1E0CA7CA0](font);
  return result;
}

unsigned int CTFontGetUnitsPerEm(CTFontRef font)
{
  return MEMORY[0x1E0CA7CA8](font);
}

uint64_t CTFontGetUnsummedAdvancesForGlyphsAndStyle()
{
  return MEMORY[0x1E0CA7CB0]();
}

uint64_t CTFontGetWeight()
{
  return MEMORY[0x1E0CA7CC8]();
}

CGFloat CTFontGetXHeight(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x1E0CA7CD0](font);
  return result;
}

uint64_t CTFontHasExuberatedLineHeight()
{
  return MEMORY[0x1E0CA7CD8]();
}

uint64_t CTFontHasTable()
{
  return MEMORY[0x1E0CA7CE8]();
}

uint64_t CTFontIsLastResort()
{
  return MEMORY[0x1E0CA7D00]();
}

uint64_t CTFontIsSystemUIFont()
{
  return MEMORY[0x1E0CA7D08]();
}

uint64_t CTFontIsTextStyleFont()
{
  return MEMORY[0x1E0CA7D10]();
}

uint64_t CTFontIsVertical()
{
  return MEMORY[0x1E0CA7D18]();
}

CFArrayRef CTFontManagerCopyAvailableFontFamilyNames(void)
{
  return (CFArrayRef)MEMORY[0x1E0CA7D20]();
}

uint64_t CTFontSetClientObject()
{
  return MEMORY[0x1E0CA7D68]();
}

uint64_t CTFontSwapDefaultLineHeightAdjustment()
{
  return MEMORY[0x1E0CA7D78]();
}

uint64_t CTFontSwapDefaultSize()
{
  return MEMORY[0x1E0CA7D80]();
}

uint64_t CTFontTransformGlyphsWithLanguage()
{
  return MEMORY[0x1E0CA7D90]();
}

uint64_t CTFramesetterCreateCGRectArray()
{
  return MEMORY[0x1E0CA7DD0]();
}

uint64_t CTFramesetterFindRectPosition()
{
  return MEMORY[0x1E0CA7DF0]();
}

CTCharacterCollection CTGlyphInfoGetCharacterCollection(CTGlyphInfoRef glyphInfo)
{
  return (unsigned __int16)MEMORY[0x1E0CA7E08](glyphInfo);
}

CGFontIndex CTGlyphInfoGetCharacterIdentifier(CTGlyphInfoRef glyphInfo)
{
  return MEMORY[0x1E0CA7E10](glyphInfo);
}

CFStringRef CTGlyphInfoGetGlyphName(CTGlyphInfoRef glyphInfo)
{
  return (CFStringRef)MEMORY[0x1E0CA7E18](glyphInfo);
}

CFTypeID CTGlyphInfoGetTypeID(void)
{
  return MEMORY[0x1E0CA7E20]();
}

uint64_t CTGlyphStorageCreateMutableWithInterface()
{
  return MEMORY[0x1E0CA7E28]();
}

uint64_t CTGlyphStorageGetRefCon()
{
  return MEMORY[0x1E0CA7E30]();
}

uint64_t CTGlyphStorageSyncWithInterface()
{
  return MEMORY[0x1E0CA7E38]();
}

uint64_t CTLineCreateFromLineWithOffset()
{
  return MEMORY[0x1E0CA7E50]();
}

uint64_t CTLineCreateHyphenatedLineWithOffset()
{
  return MEMORY[0x1E0CA7E58]();
}

CTLineRef CTLineCreateJustifiedLine(CTLineRef line, CGFloat justificationFactor, double justificationWidth)
{
  return (CTLineRef)MEMORY[0x1E0CA7E60](line, justificationFactor, justificationWidth);
}

uint64_t CTLineCreateJustifiedLineWithOptions()
{
  return MEMORY[0x1E0CA7E68]();
}

uint64_t CTLineCreateTruncatedLineWithTokenCallback()
{
  return MEMORY[0x1E0CA7E78]();
}

uint64_t CTLineCreateTruncatedLineWithTokenHandler()
{
  return MEMORY[0x1E0CA7E80]();
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1E0CA7E88](attrString);
}

uint64_t CTLineCreateWithRunArray()
{
  return MEMORY[0x1E0CA7E90]();
}

uint64_t CTLineCreateWithString()
{
  return MEMORY[0x1E0CA7E98]();
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
  MEMORY[0x1E0CA7EA8](line, context);
}

uint64_t CTLineDrawWithAttributeOverrides()
{
  return MEMORY[0x1E0CA7EB0]();
}

void CTLineEnumerateCaretOffsets(CTLineRef line, void *block)
{
  MEMORY[0x1E0CA7EB8](line, block);
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0CA7EC0](line, options);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFIndex CTLineGetGlyphCount(CTLineRef line)
{
  return MEMORY[0x1E0CA7ED0](line);
}

CFArrayRef CTLineGetGlyphRuns(CTLineRef line)
{
  return (CFArrayRef)MEMORY[0x1E0CA7ED8](line);
}

CGRect CTLineGetImageBounds(CTLineRef line, CGContextRef context)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0CA7EE0](line, context);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGFloat CTLineGetOffsetForStringIndex(CTLineRef line, CFIndex charIndex, CGFloat *secondaryOffset)
{
  CGFloat result;

  MEMORY[0x1E0CA7EE8](line, charIndex, secondaryOffset);
  return result;
}

double CTLineGetPenOffsetForFlush(CTLineRef line, CGFloat flushFactor, double flushWidth)
{
  double result;

  MEMORY[0x1E0CA7EF0](line, flushFactor, flushWidth);
  return result;
}

uint64_t CTLineGetStringIndexOfTabOverflow()
{
  return MEMORY[0x1E0CA7F00]();
}

CFRange CTLineGetStringRange(CTLineRef line)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x1E0CA7F08](line);
  result.length = v2;
  result.location = v1;
  return result;
}

double CTLineGetTrailingWhitespaceWidth(CTLineRef line)
{
  double result;

  MEMORY[0x1E0CA7F10](line);
  return result;
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  double result;

  MEMORY[0x1E0CA7F18](line, ascent, descent, leading);
  return result;
}

uint64_t CTLineGetWidthForStringRangeWithOffset()
{
  return MEMORY[0x1E0CA7F20]();
}

uint64_t CTLineHasBidiLevels()
{
  return MEMORY[0x1E0CA7F28]();
}

uint64_t CTLineIsRightToLeft()
{
  return MEMORY[0x1E0CA7F30]();
}

uint64_t CTLineSuggestClusterBreakWithOffset()
{
  return MEMORY[0x1E0CA7F38]();
}

uint64_t CTLineSuggestClusterBreakWithTabOverflow()
{
  return MEMORY[0x1E0CA7F40]();
}

uint64_t CTLineSuggestLineBreakWithTabOverflow()
{
  return MEMORY[0x1E0CA7F50]();
}

uint64_t CTLineSyncWithRuns()
{
  return MEMORY[0x1E0CA7F58]();
}

uint64_t CTRunCreateMutableRunsWithStorageAndOptions()
{
  return MEMORY[0x1E0CA7F88]();
}

CTRunDelegateRef CTRunDelegateCreate(const CTRunDelegateCallbacks *callbacks, void *refCon)
{
  return (CTRunDelegateRef)MEMORY[0x1E0CA7F90](callbacks, refCon);
}

CFDictionaryRef CTRunGetAttributes(CTRunRef run)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA7FB0](run);
}

void CTRunGetBaseAdvancesAndOrigins(CTRunRef runRef, CFRange range, CGSize *advancesBuffer, CGPoint *originsBuffer)
{
  MEMORY[0x1E0CA7FC0](runRef, range.location, range.length, advancesBuffer, originsBuffer);
}

uint64_t CTRunGetFont()
{
  return MEMORY[0x1E0CA7FC8]();
}

CFIndex CTRunGetGlyphCount(CTRunRef run)
{
  return MEMORY[0x1E0CA7FD0](run);
}

uint64_t CTRunGetGlyphStorage()
{
  return MEMORY[0x1E0CA7FD8]();
}

uint64_t CTRunGetInitialAdvance()
{
  return MEMORY[0x1E0CA7FF8]();
}

uint64_t CTRunGetInitialBaseAdvance()
{
  return MEMORY[0x1E0CA8000]();
}

void CTRunGetPositions(CTRunRef run, CFRange range, CGPoint *buffer)
{
  MEMORY[0x1E0CA8008](run, range.location, range.length, buffer);
}

uint64_t CTRunGetPropertiesPtr()
{
  return MEMORY[0x1E0CA8018]();
}

CTRunStatus CTRunGetStatus(CTRunRef run)
{
  return MEMORY[0x1E0CA8020](run);
}

void CTRunGetStringIndices(CTRunRef run, CFRange range, CFIndex *buffer)
{
  MEMORY[0x1E0CA8030](run, range.location, range.length, buffer);
}

CFRange CTRunGetStringRange(CTRunRef run)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x1E0CA8040](run);
  result.length = v2;
  result.location = v1;
  return result;
}

double CTRunGetTypographicBounds(CTRunRef run, CFRange range, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  double result;

  MEMORY[0x1E0CA8050](run, range.location, range.length, ascent, descent, leading);
  return result;
}

uint64_t CTRunSyncWithStorage()
{
  return MEMORY[0x1E0CA8058]();
}

uint64_t CTSwapLineBreakEpsilon()
{
  return MEMORY[0x1E0CA8070]();
}

CTLineRef CTTypesetterCreateLine(CTTypesetterRef typesetter, CFRange stringRange)
{
  return (CTLineRef)MEMORY[0x1E0CA8090](typesetter, stringRange.location, stringRange.length);
}

CTTypesetterRef CTTypesetterCreateWithAttributedStringAndOptions(CFAttributedStringRef string, CFDictionaryRef options)
{
  return (CTTypesetterRef)MEMORY[0x1E0CA80A0](string, options);
}

uint64_t CTTypesetterCreateWithRunArray()
{
  return MEMORY[0x1E0CA80A8]();
}

uint64_t CTTypesetterCreateWithRunArrayAndOptions()
{
  return MEMORY[0x1E0CA80B0]();
}

CFIndex CTTypesetterSuggestClusterBreak(CTTypesetterRef typesetter, CFIndex startIndex, double width)
{
  return MEMORY[0x1E0CA80C0](typesetter, startIndex, width);
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1E0CB2850](table);
}

void *__cdecl NSAllocateCollectable(NSUInteger size, NSUInteger options)
{
  return (void *)MEMORY[0x1E0CB2860](size, options);
}

id NSAllocateObject(Class aClass, NSUInteger extraBytes, NSZone *zone)
{
  return (id)MEMORY[0x1E0CB2868](aClass, extraBytes, zone);
}

uint64_t NSAllocateScannedUncollectable()
{
  return MEMORY[0x1E0CB2870]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

BOOL NSContainsRect(NSRect aRect, NSRect bRect)
{
  return MEMORY[0x1E0CB28C8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
}

NSMapTable *__cdecl NSCreateMapTableWithZone(NSMapTableKeyCallBacks *keyCallBacks, NSMapTableValueCallBacks *valueCallBacks, NSUInteger capacity, NSZone *zone)
{
  return (NSMapTable *)MEMORY[0x1E0CB2900](keyCallBacks, valueCallBacks, capacity, zone);
}

void NSDeallocateObject(id object)
{
  MEMORY[0x1E0CB2920](object);
}

BOOL NSEqualPoints(NSPoint aPoint, NSPoint bPoint)
{
  return MEMORY[0x1E0CB29B8]((__n128)aPoint, *(__n128 *)&aPoint.y, (__n128)bPoint, *(__n128 *)&bPoint.y);
}

BOOL NSEqualRects(NSRect aRect, NSRect bRect)
{
  return MEMORY[0x1E0CB29C0]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
}

BOOL NSEqualSizes(NSSize aSize, NSSize bSize)
{
  return MEMORY[0x1E0CB29C8]((__n128)aSize, *(__n128 *)&aSize.height, (__n128)bSize, *(__n128 *)&bSize.height);
}

void NSFreeMapTable(NSMapTable *table)
{
  MEMORY[0x1E0CB2B40](table);
}

NSRect NSInsetRect(NSRect aRect, CGFloat dX, CGFloat dY)
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSRect result;

  MEMORY[0x1E0CB2C30]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, dX, dY);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSRect NSIntersectionRect(NSRect aRect, NSRect bRect)
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSRect result;

  MEMORY[0x1E0CB2C60]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t NSIntersectsRange()
{
  return MEMORY[0x1E0CB2C68]();
}

BOOL NSIntersectsRect(NSRect aRect, NSRect bRect)
{
  return MEMORY[0x1E0CB2C70]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
}

BOOL NSIsEmptyRect(NSRect aRect)
{
  return MEMORY[0x1E0CB2C90]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

void NSLogv(NSString *format, va_list args)
{
  MEMORY[0x1E0CB2D90](format, args);
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1E0CB2DA0](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x1E0CB2DA8](table, key, value);
}

void NSMapInsertKnownAbsent(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x1E0CB2DB8](table, key, value);
}

BOOL NSPointInRect(NSPoint aPoint, NSRect aRect)
{
  return MEMORY[0x1E0CB3030]((__n128)aPoint, *(__n128 *)&aPoint.y, (__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

uint64_t NSPopAutoreleasePool()
{
  return MEMORY[0x1E0CB3038]();
}

uint64_t NSPushAutoreleasePool()
{
  return MEMORY[0x1E0CB3120]();
}

void *__cdecl NSReallocateCollectable(void *ptr, NSUInteger size, NSUInteger options)
{
  return (void *)MEMORY[0x1E0CB3130](ptr, size, options);
}

uint64_t NSReallocateScannedUncollectable()
{
  return MEMORY[0x1E0CB3138]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x1E0CB3210]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1E0CB3228]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1E0CB3240]((__n128)aSize, *(__n128 *)&aSize.height);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSRect NSUnionRect(NSRect aRect, NSRect bRect)
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSRect result;

  MEMORY[0x1E0CB3408]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

void *__cdecl NSZoneCalloc(NSZone *zone, NSUInteger numElems, NSUInteger byteSize)
{
  return (void *)MEMORY[0x1E0CB3450](zone, numElems, byteSize);
}

void NSZoneFree(NSZone *zone, void *ptr)
{
  MEMORY[0x1E0CB3458](zone, ptr);
}

NSZone *__cdecl NSZoneFromPointer(void *ptr)
{
  return (NSZone *)MEMORY[0x1E0CB3460](ptr);
}

void *__cdecl NSZoneMalloc(NSZone *zone, NSUInteger size)
{
  return (void *)MEMORY[0x1E0CB3468](zone, size);
}

void *__cdecl NSZoneRealloc(NSZone *zone, void *ptr, NSUInteger size)
{
  return (void *)MEMORY[0x1E0CB3470](zone, ptr, size);
}

uint64_t _AXSEnhanceTextLegibilityEnabled()
{
  return MEMORY[0x1E0DDD710]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFExecutableLinkedOnOrAfter()
{
  return MEMORY[0x1E0C9A178]();
}

uint64_t _CFHyphenationGetAllPossibleHyphenationLocations()
{
  return MEMORY[0x1E0C9A1D0]();
}

uint64_t _CFIsDeallocating()
{
  return MEMORY[0x1E0C9A1D8]();
}

uint64_t _CFNonObjCEqual()
{
  return MEMORY[0x1E0C9A270]();
}

uint64_t _CFNonObjCHash()
{
  return MEMORY[0x1E0C9A278]();
}

uint64_t _CFNonObjCRelease()
{
  return MEMORY[0x1E0C9A280]();
}

uint64_t _CFNonObjCRetain()
{
  return MEMORY[0x1E0C9A288]();
}

uint64_t _CFStringTokenizerSetLocale()
{
  return MEMORY[0x1E0C9A558]();
}

uint64_t _CFTryRetain()
{
  return MEMORY[0x1E0C9A5A8]();
}

uint64_t _CTFontCreateWithNameAndSymbolicTraits()
{
  return MEMORY[0x1E0CA8130]();
}

uint64_t _CTGetVisibleFormatterCharacterSet()
{
  return MEMORY[0x1E0CA8138]();
}

uint64_t _CTGlyphInfoGetBaseString()
{
  return MEMORY[0x1E0CA8140]();
}

uint64_t _CTGlyphInfoGetFont()
{
  return MEMORY[0x1E0CA8148]();
}

uint64_t _CTGlyphInfoGetGlyph()
{
  return MEMORY[0x1E0CA8150]();
}

uint64_t _NSEncodingFromDataForExtendedAttribute()
{
  return MEMORY[0x1E0CB3BD0]();
}

uint64_t _NSFaultInObject()
{
  return MEMORY[0x1E0CB3BF0]();
}

uint64_t _NSFullMethodName()
{
  return MEMORY[0x1E0CB3BF8]();
}

uint64_t _NSMethodExceptionProem()
{
  return MEMORY[0x1E0CB3C38]();
}

uint64_t _NSReadExtendedAttributesFromFileDescriptor()
{
  return MEMORY[0x1E0CB3C60]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t __CFStorageGetCapacity()
{
  return MEMORY[0x1E0C9A9C0]();
}

uint64_t __CFStorageGetValueSize()
{
  return MEMORY[0x1E0C9A9C8]();
}

uint64_t __CFStringEncodeByteStream()
{
  return MEMORY[0x1E0C9A9E8]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1E0C80B70]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x1E0C80B78]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1E0C80C40]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

void *__cdecl bsearch_b(const void *__key, const void *__base, size_t __nel, size_t __width, void *__compar)
{
  return (void *)MEMORY[0x1E0C81740](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1E0DE7A50](cls, name, imp, types);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x1E0DE7AB0](cls);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1E0DE7AC0](cls, name);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_program_minos_at_least()
{
  return MEMORY[0x1E0C83150]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

const char *__cdecl fmtcheck(const char *a1, const char *a2)
{
  return (const char *)MEMORY[0x1E0C83450](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

void memset_pattern8(void *__b, const void *__pattern8, size_t __len)
{
  MEMORY[0x1E0C840C8](__b, __pattern8, __len);
}

objc_method_description *__cdecl method_getDescription(Method m)
{
  return (objc_method_description *)MEMORY[0x1E0DE7B60](m);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1E0DE7B68](m);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1E0DE7D00](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

Class objc_lookUpClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7D10](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_storeWeakOrNil(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FC0](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

Class object_setClass(id a1, Class a2)
{
  return (Class)MEMORY[0x1E0DE8030](a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C849A0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84E90](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x1E0C84E98](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EA0](a1);
}

int pthread_rwlock_trywrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EB0](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EB8](a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x1E0C84F88](__base, __nel, __width, __compar);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x1E0C84F90](__base, __nel, __width, __compar);
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1E0C851B0]();
}

SEL sel_getUid(const char *str)
{
  return (SEL)MEMORY[0x1E0DE80D0](str);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1E0C85590](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B8](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1E0C855C8](__big, __little, __len);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t ubrk_clone()
{
  return MEMORY[0x1E0DE5C90]();
}

uint64_t ubrk_close()
{
  return MEMORY[0x1E0DE5C98]();
}

uint64_t ubrk_following()
{
  return MEMORY[0x1E0DE5CB8]();
}

uint64_t ubrk_next()
{
  return MEMORY[0x1E0DE5CE0]();
}

uint64_t ubrk_open()
{
  return MEMORY[0x1E0DE5CE8]();
}

uint64_t ubrk_preceding()
{
  return MEMORY[0x1E0DE5CF0]();
}

uint64_t ubrk_setLineWordOpts()
{
  return MEMORY[0x1E0DE5D00]();
}

uint64_t ubrk_setText()
{
  return MEMORY[0x1E0DE5D08]();
}

uint64_t ubrk_setUText()
{
  return MEMORY[0x1E0DE5D10]();
}

UText *__cdecl utext_close(UText *ut)
{
  return (UText *)MEMORY[0x1E0DE6A50](ut);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C85B98](__str, __size, __format, a4);
}

