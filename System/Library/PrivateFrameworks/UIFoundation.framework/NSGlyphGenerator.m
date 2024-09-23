@implementation NSGlyphGenerator

+ (void)initialize
{
  NSString *v2;
  Class v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = (NSString *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "stringForKey:", CFSTR("NSGlyphGeneratorConcreteClassName"));
    if (v2)
    {
      v3 = NSClassFromString(v2);
      if (v3)
        __NSGlyphGeneratorConcreteClass = (uint64_t)v3;
    }
  }
}

- (void)generateGlyphsForGlyphStorage:(id)glyphStorage desiredNumberOfCharacters:(NSUInteger)nChars glyphIndex:(NSUInteger *)glyphIndex characterIndex:(NSUInteger *)charIndex
{
  CFIndex *v6;
  CFIndex *v7;
  uint64_t *v8;
  uint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  CFIndex Length;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  CFIndex location;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  uint64_t v28;
  unint64_t v29;
  CFIndex v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  CFIndex v36;
  uint64_t v37;
  CFIndex v38;
  CFIndex v39;
  char v40;
  uint64_t v41;
  int v42;
  BOOL v43;
  UniChar *v44;
  _QWORD *v45;
  uint64_t v46;
  UniChar *v47;
  uint64_t v48;
  UniChar *v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int v52;
  int v54;
  BOOL v55;
  unsigned int v56;
  char v57;
  CGGlyph v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t UnicodePropertyDataForPlane;
  uint64_t BitmapPtrForPlane;
  int v64;
  unsigned int v65;
  int v66;
  int v67;
  UniChar v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  CGGlyph *v74;
  _QWORD *v75;
  _QWORD *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  uint64_t *v87;
  unint64_t v88;
  unint64_t v89;
  void *v90;
  unint64_t v91;
  void *v92;
  void *v93;
  __CFString *theString;
  CFIndex v95;
  uint64_t v96;
  int v97;
  const __CTFont *font;
  char v99;
  CFRange range;
  unint64_t v101;
  CGGlyph glyphs;
  UniChar characters;
  _QWORD v104[1024];
  _QWORD v105[1024];
  CGGlyph v106[1024];
  UniChar v107[1024];
  CGGlyph v108[40];
  _OWORD __pattern8[5];
  CGGlyph v110[10];
  UniChar v111[10];
  uint64_t v112;
  CFRange v113;

  ((void (*)(NSGlyphGenerator *, SEL, id, NSUInteger, NSUInteger *, NSUInteger *))MEMORY[0x1E0C80A78])(self, a2, glyphStorage, nChars, glyphIndex, charIndex);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v112 = *MEMORY[0x1E0C80C00];
  range.length = 0;
  v101 = 0;
  v90 = (void *)objc_msgSend(v12, "attributedString");
  v14 = (const __CFString *)objc_msgSend(v90, "string");
  v86 = v7;
  v88 = *v7;
  range.location = *v7;
  theString = (__CFString *)v14;
  Length = CFStringGetLength(v14);
  v87 = v9;
  v16 = *v9;
  v99 = objc_msgSend(v13, "layoutOptions");
  objc_opt_class();
  v17 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = objc_msgSend(v13, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v18 = (void *)v17;
  else
    v18 = 0;
  v19 = Length - v88;
  v20 = v88;
  if (v19 >= v11)
    v19 = v11;
  v89 = v19;
  v91 = v19 + v88;
  if (v88 < v19 + v88)
  {
    v21 = v88;
    v92 = v18;
    v93 = v13;
    while (1)
    {
      while (1)
      {
        v22 = (void *)objc_msgSend(v90, "attributesAtIndex:longestEffectiveRange:inRange:", v21, &range.length, v20, v89);
        font = (const __CTFont *)objc_msgSend(v22, "objectForKey:", CFSTR("NSFont"));
        location = range.length;
        v24 = v101;
        if (range.length < (unint64_t)range.location)
        {
          v24 = range.length - range.location + v101;
          range.length = range.location;
          v101 = v24;
          location = range.location;
        }
        if (v24 + location >= v91)
        {
          v24 = v91 - range.location;
          v101 = v91 - range.location;
        }
        if (v24 == 1
          && CFStringGetCharacterAtIndex(theString, range.location) == 65532
          && objc_msgSend(v22, "objectForKey:", CFSTR("NSAttachment")))
        {
          v106[0] = -1;
          v105[0] = 2;
          if (!v18
            || (v25 = objc_msgSend(v18, "layoutManager:shouldGenerateGlyphs:properties:characterIndexes:font:forGlyphRange:", v13, v106, v105, &range, font, v16, 1)) == 0)
          {
            objc_msgSend(v13, "setGlyphs:properties:characterIndexes:font:forGlyphRange:", v106, v105, &range, font, v16, 1);
            v25 = 1;
          }
          v16 += v25;
          v21 = ++range.location;
          goto LABEL_195;
        }
        if (!font)
        {
          v29 = v101;
          v30 = range.location;
          *(_QWORD *)&__pattern8[0] = 1;
          bzero(v106, 0x800uLL);
          memset_pattern8(v105, __pattern8, 0x2000uLL);
          if (v29)
          {
            do
            {
              v31 = 0;
              if (v29 >= 0x400)
                v32 = 1024;
              else
                v32 = v29;
              do
              {
                v104[v31] = v30 + v31;
                ++v31;
              }
              while (v32 != v31);
              if (!v18
                || (v33 = objc_msgSend(v18, "layoutManager:shouldGenerateGlyphs:properties:characterIndexes:font:forGlyphRange:", v13, v106, v105, v104, 0, v16, v32)) == 0)
              {
                objc_msgSend(v13, "setGlyphs:properties:characterIndexes:font:forGlyphRange:", v106, v105, v104, 0, v16, v32);
                v33 = v32;
              }
              v16 += v33;
              v30 += v32;
              v29 -= v32;
            }
            while (v29);
            v34 = v101;
            v30 = range.location;
          }
          else
          {
            v34 = 0;
          }
          v21 = v30 + v34;
          goto LABEL_193;
        }
        v26 = (void *)objc_msgSend(v22, "objectForKey:", NSGlyphInfoAttributeName);
        if (!v26)
          break;
        v27 = objc_msgSend(v26, "_glyphForFont:baseString:", font, -[__CFString substringWithRange:](theString, "substringWithRange:", range.length, v101));
        if (!v27)
          break;
        if (v27 == 0xFFFFFF)
        {
          LOWORD(v27) = -1;
          v28 = 2;
        }
        else
        {
          v28 = 0;
        }
        v106[0] = v27;
        v105[0] = v28;
        if (!v18
          || (v81 = objc_msgSend(v18, "layoutManager:shouldGenerateGlyphs:properties:characterIndexes:font:forGlyphRange:", v13, v106, v105, &range, font, v16, 1)) == 0)
        {
          objc_msgSend(v13, "setGlyphs:properties:characterIndexes:font:forGlyphRange:", v106, v105, &range, font, v16, 1);
          v81 = 1;
        }
        v16 += v81;
        v21 = ++range.location;
        v82 = --v101;
        if (!v101)
          goto LABEL_194;
        *(_QWORD *)&__pattern8[0] = 1;
        bzero(v106, 0x800uLL);
        memset_pattern8(v105, __pattern8, 0x2000uLL);
        do
        {
          v83 = 0;
          if (v82 >= 0x400)
            v84 = 1024;
          else
            v84 = v82;
          do
          {
            v104[v83] = v21 + v83;
            ++v83;
          }
          while (v84 != v83);
          if (!v18
            || (v85 = objc_msgSend(v18, "layoutManager:shouldGenerateGlyphs:properties:characterIndexes:font:forGlyphRange:", v13, v106, v105, v104, font, v16, v84)) == 0)
          {
            objc_msgSend(v13, "setGlyphs:properties:characterIndexes:font:forGlyphRange:", v106, v105, v104, font, v16, v84);
            v85 = v84;
          }
          v16 += v85;
          v21 += v84;
          v82 -= v84;
        }
        while (v82);
        v21 = range.location + v101;
LABEL_193:
        range.location = v21;
LABEL_194:
        v20 = v88;
LABEL_195:
        if (v21 >= v91)
          goto LABEL_198;
      }
      v35 = v101;
      v21 = range.location;
      if (!v101)
        goto LABEL_174;
      do
      {
        if (v35 >= 0x400)
          v36 = 1024;
        else
          v36 = v35;
        v113.location = v21;
        v113.length = v36;
        CFStringGetCharacters(theString, v113, v107);
        v37 = 1023;
        if ((v107[1023] & 0xFC00) != 0xD800)
          v37 = 1024;
        if (v35 <= 0x3FF)
          v38 = v36;
        else
          v38 = v37;
        CTFontGetGlyphsForCharacters(font, v107, v106, v38);
        v39 = range.location;
        v40 = -[__CTFont _isDefaultFace](font, "_isDefaultFace");
        if (__NSInsertNominalGlyphs_onceToken != -1)
          dispatch_once(&__NSInsertNominalGlyphs_onceToken, &__block_literal_global_10);
        if ((v99 & 2) != 0)
        {
          *(_QWORD *)&__pattern8[0] = 0x20002E25CA2423;
          CTFontGetGlyphsForCharacters(font, (const UniChar *)__pattern8, v108, 4);
          v41 = 0;
          do
          {
            v42 = v108[v41];
            if (v108[v41])
              v43 = 1;
            else
              v43 = v41 == 3;
            ++v41;
          }
          while (!v43);
        }
        else
        {
          v42 = 0;
        }
        v96 = v16;
        v44 = &v107[v38];
        __memset_chk();
        v45 = v104;
        v95 = v38;
        do
        {
          *v45++ = v39++;
          --v38;
        }
        while (v38);
        v46 = 0;
        v97 = 0;
        v47 = v107;
        do
        {
          v48 = 0;
          while (1)
          {
            v49 = v47 + 1;
            v50 = *v47;
            v51 = v48 + v46;
            v52 = v106[v48 + v46];
            if ((v50 & 0xFC00) != 0xD800 || v49 >= v44)
            {
              ++v47;
            }
            else
            {
              v54 = *v49;
              v55 = (v54 & 0xFC00) == 56320;
              v56 = v54 + ((_DWORD)v50 << 10) - 56613888;
              if (v55)
                v50 = v56;
              else
                v50 = *v47;
              if (v55)
                v47 += 2;
              else
                ++v47;
            }
            if (v52 == 0xFFFF)
            {
              v106[v51] = 0;
              goto LABEL_83;
            }
            if (v106[v48 + v46])
              v57 = 0;
            else
              v57 = v40;
            if ((v57 & 1) != 0)
              goto LABEL_78;
            if ((v40 & 1) == 0)
            {
              v58 = -1;
              if (v50 < 0x20)
                goto LABEL_79;
              v59 = 2;
              if ((v50 - 127) < 0x21)
                goto LABEL_80;
              if ((v50 - 8232) < 2 || (_DWORD)v50 == 173)
                goto LABEL_79;
              v59 = 2;
              if ((_DWORD)v50 == 65532)
                goto LABEL_80;
              if (WORD1(v50))
              {
                BitmapPtrForPlane = CFUniCharGetBitmapPtrForPlane();
                if (!BitmapPtrForPlane)
                  goto LABEL_144;
LABEL_105:
                v64 = (*(unsigned __int8 *)(BitmapPtrForPlane + ((unsigned __int16)v50 >> 3)) >> (v50 & 7)) & 1;
              }
              else
              {
                BitmapPtrForPlane = __NSInsertNominalGlyphs_controlFormatBMP;
                if (__NSInsertNominalGlyphs_controlFormatBMP)
                  goto LABEL_105;
LABEL_144:
                LOBYTE(v64) = 0;
              }
              if (v50 >> 4 == 4064 || (v64 & 1) != 0 || (v50 - 917760) <= 0xEF)
              {
                if (v52 < 4)
                  goto LABEL_78;
                v72 = objc_msgSend((id)_CTGetVisibleFormatterCharacterSet(), "longCharacterIsMember:", v50);
                if ((v99 & 2) == 0 && (v50 & 0xFFFFFFFE) != 0xFE0E && (v72 & 1) == 0)
                {
                  if (WORD1(v50))
                  {
                    v73 = CFUniCharGetBitmapPtrForPlane();
                    if (!v73)
                      goto LABEL_78;
                  }
                  else
                  {
                    v73 = __NSInsertNominalGlyphs_graphemeBMP;
                    if (!__NSInsertNominalGlyphs_graphemeBMP)
                      goto LABEL_78;
                  }
                  if (((*(unsigned __int8 *)(v73 + ((unsigned __int16)v50 >> 3)) >> (v50 & 7)) & 1) == 0)
                  {
LABEL_78:
                    v58 = -1;
LABEL_79:
                    v59 = 2;
LABEL_80:
                    v106[v51] = v58;
LABEL_81:
                    v105[v51] |= v59;
LABEL_82:
                    if (v106[v51])
                      goto LABEL_84;
LABEL_83:
                    v105[v51] |= 1uLL;
                    goto LABEL_84;
                  }
                }
              }
            }
            if (v50 < 0x10000)
            {
              UnicodePropertyDataForPlane = __NSInsertNominalGlyphs_bidiPropertyBMP;
              if (!__NSInsertNominalGlyphs_bidiPropertyBMP)
                goto LABEL_112;
            }
            else
            {
              UnicodePropertyDataForPlane = CFUniCharGetUnicodePropertyDataForPlane();
              if (!UnicodePropertyDataForPlane)
                goto LABEL_112;
            }
            v65 = *(unsigned __int8 *)(UnicodePropertyDataForPlane + BYTE1(v50));
            if (v65 >= 0x13)
              v65 = *(unsigned __int8 *)(UnicodePropertyDataForPlane + (v65 << 8) - 4864 + v50 + 256);
            if (v65 == 12)
            {
              v58 = v42;
              v59 = 4;
              if (v42)
                goto LABEL_80;
              goto LABEL_81;
            }
LABEL_112:
            if ((_DWORD)v50 == 160)
            {
              if (v52 > 3)
              {
                v66 = v97;
                if (v97)
                  goto LABEL_117;
              }
              else
              {
                v66 = v97;
                if (!v97)
                {
                  characters = 32;
                  glyphs = 0;
                  CTFontGetGlyphsForCharacters(font, &characters, &glyphs, 1);
                  v66 = glyphs;
                }
                if (v66)
                {
LABEL_117:
                  v60 = 0;
                  v97 = v66;
                  v106[v51] = v66;
                  goto LABEL_87;
                }
              }
              v97 = 0;
              goto LABEL_82;
            }
            if (v52 > 3 || (v50 & 0xFFFFFFFE) != 0x2010)
              goto LABEL_82;
            characters = 45;
            glyphs = 0;
            CTFontGetGlyphsForCharacters(font, &characters, &glyphs, 1);
            v67 = glyphs;
            v106[v51] = glyphs;
            if (!v67)
              goto LABEL_83;
LABEL_84:
            if (v50 < 0x10000)
            {
              v60 = 0;
            }
            else
            {
              v105[v51 + 1] = v105[v51];
              v60 = 1;
            }
LABEL_87:
            if ((v99 & 1) != 0
              && (v105[v51] & 2) != 0
              && (v50 < 0x20 || (v50 - 127) <= 0x20)
              && (CFUniCharIsMemberOf() & 1) == 0)
            {
              v111[0] = 94;
              if (v50 < 0x80)
              {
                v61 = 1;
              }
              else
              {
                v111[1] = 126;
                v61 = 2;
              }
              v68 = v50 & 0x3F | 0x40;
              if ((_DWORD)v50 == 127)
                v68 = 63;
              v69 = v61 + 1;
              v111[v61] = v68;
              if (CTFontGetGlyphsForCharacters(font, v111, v110, v61 + 1))
                break;
            }
            if ((v40 & 1) != 0)
              goto LABEL_137;
            if (WORD1(v50))
            {
              v70 = CFUniCharGetBitmapPtrForPlane();
              if (!v70)
                goto LABEL_132;
            }
            else
            {
              v70 = __NSInsertNominalGlyphs_nonBaseSetBMP;
              if (!__NSInsertNominalGlyphs_nonBaseSetBMP)
                goto LABEL_132;
            }
            if (((*(unsigned __int8 *)(v70 + ((unsigned __int16)v50 >> 3)) >> (v50 & 7)) & 1) != 0)
              goto LABEL_135;
LABEL_132:
            if ((v50 - 4448) < 0x9A || (v50 & 0x1FFFF0) == 0xF860 && v47 < v44)
            {
LABEL_135:
              v105[v51] |= 8uLL;
              if (v60)
                v105[v51 + 1] |= 8uLL;
            }
LABEL_137:
            v71 = 1;
            if (v60)
              v71 = 2;
            v48 += v71;
            if (v47 >= v44)
            {
              if (v48)
              {
                if (!v92
                  || (v80 = objc_msgSend(v92, "layoutManager:shouldGenerateGlyphs:properties:characterIndexes:font:forGlyphRange:", v93, &v106[v46], &v105[v46], &v104[v46], font, v96, v48)) == 0)
                {
                  objc_msgSend(v93, "setGlyphs:properties:characterIndexes:font:forGlyphRange:", &v106[v46], &v105[v46], &v104[v46], font, v96, v48);
                  v80 = v48;
                }
                v96 += v80;
              }
              goto LABEL_173;
            }
          }
          if (v48)
          {
            v74 = &v106[v46];
            v75 = &v105[v46];
            v76 = &v104[v46];
            v77 = v93;
            if (!v92
              || (v78 = objc_msgSend(v92, "layoutManager:shouldGenerateGlyphs:properties:characterIndexes:font:forGlyphRange:", v93, v74, v75, v76, font, v96, v48), v77 = v93, v74 = &v106[v46], !v78))
            {
              objc_msgSend(v77, "setGlyphs:properties:characterIndexes:font:forGlyphRange:", v74, v75, v76, font, v96, v48);
              v78 = v48;
            }
            v96 += v78;
            v46 = v51 + 1;
          }
          memset(__pattern8, 0, sizeof(__pattern8));
          memset_pattern8(v108, &v104[v51], 8 * v69);
          if (!v92
            || (v79 = objc_msgSend(v92, "layoutManager:shouldGenerateGlyphs:properties:characterIndexes:font:forGlyphRange:", v93, v110, __pattern8, v108, font, v96, v69)) == 0)
          {
            objc_msgSend(v93, "setGlyphs:properties:characterIndexes:font:forGlyphRange:", v110, __pattern8, v108, font, v96, v69);
            v79 = v69;
          }
          v96 += v79;
        }
        while (v47 < v44);
LABEL_173:
        v16 = v96;
        v21 = range.location + v95;
        range.location += v95;
        v35 = v101 - v95;
        v101 -= v95;
      }
      while (v101);
LABEL_174:
      v18 = v92;
      v13 = v93;
      v20 = v88;
      if (v21 >= v91)
        goto LABEL_198;
    }
  }
  v21 = v88;
LABEL_198:
  *v86 = v21;
  *v87 = v16;
}

+ (id)defaultGlyphGenerator
{
  if (__NSGlyphGeneratorConcreteClass)
    return (id)objc_msgSend((id)__NSGlyphGeneratorConcreteClass, "sharedGlyphGenerator");
  if (defaultGlyphGenerator_onceToken != -1)
    dispatch_once(&defaultGlyphGenerator_onceToken, &__block_literal_global_10);
  return (id)defaultGlyphGenerator_glyphGenerator;
}

NSGlyphGenerator *__41__NSGlyphGenerator_defaultGlyphGenerator__block_invoke()
{
  NSGlyphGenerator *result;

  result = objc_alloc_init(NSGlyphGenerator);
  defaultGlyphGenerator_glyphGenerator = (uint64_t)result;
  return result;
}

+ (NSGlyphGenerator)sharedGlyphGenerator
{
  return (NSGlyphGenerator *)objc_msgSend((id)objc_opt_class(), "defaultGlyphGenerator");
}

@end
