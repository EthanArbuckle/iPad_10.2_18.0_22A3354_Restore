@implementation NSMutableAttributedString(NSMutableAttributedStringKitAdditions)

- (uint64_t)fixAttributesInRange:()NSMutableAttributedStringKitAdditions
{
  char v7;
  uint64_t result;

  v7 = objc_msgSend(a1, "_attributeFixingInProgress");
  if ((v7 & 1) == 0)
    objc_msgSend(a1, "_setAttributeFixingInProgress:", 1);
  objc_msgSend(a1, "beginEditing");
  objc_msgSend(a1, "fixGlyphInfoAttributeInRange:", a3, a4);
  objc_msgSend(a1, "fixFontAttributeInRange:", a3, a4);
  objc_msgSend(a1, "fixParagraphStyleAttributeInRange:", a3, a4);
  objc_msgSend(a1, "fixAttachmentAttributeInRange:", a3, a4);
  objc_msgSend((id)objc_msgSend(a1, "_intentResolver"), "resolveAttributedString:inRange:", a1, a3, a4);
  result = objc_msgSend(a1, "endEditing");
  if ((v7 & 1) == 0)
    return objc_msgSend(a1, "_setAttributeFixingInProgress:", 0);
  return result;
}

- (unint64_t)fixParagraphStyleAttributeInRange:()NSMutableAttributedStringKitAdditions
{
  unint64_t v7;
  unint64_t result;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a3)
    v7 = a3 - 1;
  else
    v7 = 0;
  result = objc_msgSend(a1, "length");
  if (result > a3 + a4)
    v9 = a3 + a4 + 1;
  else
    v9 = result;
  if (v7 < v9)
  {
    v10 = 0;
    v17 = 0;
    v18 = 0;
    while (1)
    {
      result = objc_msgSend(a1, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v7, &v17);
      v7 = v18 + v17;
      if (v18 + v17 >= v9)
        return result;
      v11 = result;
      if (!v10)
        v10 = (void *)objc_msgSend(a1, "string");
      result = objc_msgSend(v10, "characterAtIndex:", v7 - 1);
      if ((int)result <= 12)
        break;
      if ((_DWORD)result != 8233)
      {
        if ((_DWORD)result != 13)
          goto LABEL_22;
        result = objc_msgSend(v10, "length");
        if (v7 < result)
        {
          result = objc_msgSend(v10, "characterAtIndex:", v7);
          if ((_DWORD)result == 10)
            goto LABEL_22;
        }
      }
LABEL_31:
      if (v7 >= v9)
        return result;
    }
    if ((_DWORD)result == 10 || (_DWORD)result == 12)
      goto LABEL_31;
LABEL_22:
    v16 = 0;
    objc_msgSend(v10, "getParagraphStart:end:contentsEnd:forRange:", 0, &v16, 0, v7, 0);
    v13 = v16;
    if (v16)
      --v16;
    else
      v13 = 1;
    v14 = 0;
    v15 = 0;
    result = objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSParagraphStyle"), v7, &v14, v7, v13 - v7);
    if (result != v11 || v15 + v14 < v13)
    {
      if (v11)
        result = objc_msgSend(a1, "addAttribute:value:range:", CFSTR("NSParagraphStyle"), v11, v7, v13 - v7);
      else
        result = objc_msgSend(a1, "removeAttribute:range:", CFSTR("NSParagraphStyle"), v7, v13 - v7);
    }
    v7 = v16 + 1;
    goto LABEL_31;
  }
  return result;
}

- (void)fixAttachmentAttributeInRange:()NSMutableAttributedStringKitAdditions
{
  void *v6;
  __CFString *v7;
  const char *CStringPtr;
  unint64_t v9;
  void *v10;
  const __CFString *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  UniChar v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  UniChar *v32;
  unint64_t v33;
  uint64_t v34;
  __CFString *v35;
  unint64_t v36;
  uint64_t v37;
  void *v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  UniChar buffer[8];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  CFStringRef theString;
  const UniChar *CharactersPtr;
  const char *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  CFRange v57;

  v6 = a1;
  v7 = (__CFString *)objc_msgSend(a1, "string");
  v39 = a3 + a4;
  theString = v7;
  v53 = a3;
  v54 = a4;
  CharactersPtr = CFStringGetCharactersPtr(v7);
  if (CharactersPtr)
    CStringPtr = 0;
  else
    CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
  v55 = 0;
  v56 = 0;
  v52 = CStringPtr;
  if (a3 < v39)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    *(_OWORD *)buffer = 0u;
    v43 = 0u;
    v38 = v6;
    v34 = -(uint64_t)a3;
    v35 = v7;
    v33 = 64 - a3;
    v32 = &buffer[-a3];
    v9 = a3;
    v36 = a3;
    v37 = a4;
    do
    {
      v40 = 0;
      v41 = 0;
      v10 = (void *)objc_msgSend(v6, "attributesAtIndex:effectiveRange:", v9, &v40);
      v11 = CFSTR("CTAdaptiveImageProvider");
      if (!objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CTAdaptiveImageProvider")))
      {
        v11 = CFSTR("NSAttachment");
        if (!objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("NSAttachment")))
          goto LABEL_46;
      }
      if (!v11)
        goto LABEL_46;
      v12 = a3 - v9;
      if (a3 == v9)
        v13 = 0;
      else
        v13 = a3;
      if (a3 == v9)
        v14 = v39;
      else
        v14 = a4;
      objc_msgSend(v6, "attribute:atIndex:longestEffectiveRange:inRange:", v11, v9, &v40, v13, v14);
      if (CharactersPtr || v41 != 1)
      {
        if (v9 < v41 + v40)
        {
          v17 = 0;
          v16 = 0;
          v15 = 0;
          v18 = v34 + v9;
          v19 = v33 + v9;
          v20 = v34 + v9;
          do
          {
            if (v20 >= 4)
              v21 = 4;
            else
              v21 = v20;
            v22 = v18 + v17;
            if ((uint64_t)(v18 + v17) < 0)
              goto LABEL_41;
            v23 = v54;
            if (v54 <= v22)
              goto LABEL_41;
            if (CharactersPtr)
            {
              v24 = CharactersPtr[v18 + v17 + v53];
            }
            else if (v52)
            {
              v24 = v52[v53 + v18 + v17];
            }
            else
            {
              if (v56 <= v22 || (v25 = v55, v55 > v22))
              {
                v26 = v34 - v21;
                v27 = v21 + v12;
                v28 = v19 - v21;
                v29 = v9 + v17 + v26;
                v30 = v29 + 64;
                if (v29 + 64 >= v54)
                  v30 = v54;
                v55 = v29;
                v56 = v30;
                if (v54 >= v28)
                  v23 = v28;
                v57.length = v23 + v27;
                v57.location = v29 + v53;
                CFStringGetCharacters(theString, v57, buffer);
                v25 = v55;
              }
              v24 = v32[v9 - v25 + v17];
            }
            if (v24 == 65532)
            {
              if (v16 >= 2)
              {
                objc_msgSend(v38, "removeAttribute:range:", v11, v15, v16);
                v16 = 0;
              }
            }
            else
            {
LABEL_41:
              if (v16++ == 0)
                v15 = v9 + v17;
            }
            ++v17;
            ++v20;
            --v12;
            ++v19;
          }
          while (v9 + v17 < v41 + v40);
          goto LABEL_44;
        }
      }
      else if (-[__CFString characterAtIndex:](v7, "characterAtIndex:", v9) != 65532)
      {
        v15 = v40;
        v16 = v41;
LABEL_44:
        a3 = v36;
        a4 = v37;
        v6 = v38;
        v7 = v35;
        if (v16)
          objc_msgSend(v38, "removeAttribute:range:", v11, v15, v16);
      }
LABEL_46:
      v9 = v41 + v40;
    }
    while (v41 + v40 < v39);
  }
}

- (uint64_t)fixFontAttributeInRange:()NSMutableAttributedStringKitAdditions
{
  uint64_t v7;
  __CFString *v8;
  unsigned int v9;
  NSRange v10;
  NSRange v11;
  unsigned int v12;
  uint64_t v13;
  NSRange v14;
  const char *CStringPtr;
  uint64_t v16;
  NSUInteger v17;
  void *v18;
  uint64_t v19;
  NSUInteger v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  double v28;
  double v29;
  double v30;
  int v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  UniChar *v38;
  uint64_t v39;
  UniChar v40;
  NSUInteger v41;
  uint64_t v42;
  NSUInteger v43;
  char v44;
  int v45;
  uint64_t BitmapPtrForPlane;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  UniChar *v51;
  uint64_t v52;
  UniChar v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  UniChar *v59;
  uint64_t v60;
  UniChar v61;
  NSUInteger v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  UniChar *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  unsigned int v77;
  unsigned int v78;
  BOOL v80;
  BOOL v81;
  char v82;
  CFRange v83;
  char *v84;
  UniChar *v85;
  UniChar v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  NSUInteger v90;
  unsigned int v91;
  BOOL v92;
  char v93;
  void *v94;
  void *v95;
  UTF32Char v96;
  BOOL v97;
  unsigned int v98;
  char v99;
  uint64_t v100;
  int v101;
  int v102;
  uint64_t v103;
  char v104;
  uint64_t v105;
  BOOL v106;
  char v107;
  unsigned int v108;
  uint64_t v109;
  unsigned int v110;
  BOOL v111;
  char v112;
  UTF32Char v113;
  uint64_t v114;
  uint64_t v115;
  UniChar v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  int v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  UniChar *v130;
  CFRange v131;
  char *v132;
  UniChar *v133;
  UniChar v134;
  id v135;
  unint64_t v136;
  uint64_t v137;
  BOOL v138;
  char v139;
  unsigned int v140;
  uint64_t v141;
  BOOL v142;
  char v143;
  unsigned int v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  _BOOL4 v148;
  uint64_t v149;
  uint64_t v150;
  _BOOL4 v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  UniChar v157;
  unsigned int v158;
  BOOL v160;
  BOOL v161;
  BOOL v162;
  char v163;
  char v164;
  unsigned int v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  _BOOL4 v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  UniChar v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  unint64_t v187;
  uint64_t v188;
  _BOOL4 v189;
  void *v190;
  void *v191;
  void *v192;
  NSUInteger v193;
  unint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  void *v199;
  void *v200;
  uint64_t v201;
  UniChar *v202;
  uint64_t v203;
  CFRange v204;
  char *v205;
  NSUInteger v206;
  UniChar *v207;
  UniChar v208;
  void *v210;
  void *v211;
  uint64_t v212;
  void *v213;
  int v215;
  int v216;
  uint64_t v217;
  uint64_t v218;
  NSUInteger v219;
  NSUInteger v220;
  char v221;
  const __CFCharacterSet *v222;
  __CFString *v223;
  int v224;
  uint64_t v225;
  NSUInteger v226;
  uint64_t v227;
  NSUInteger v228;
  unint64_t v229;
  void *v230;
  uint64_t v231;
  uint64_t v232;
  void *v233;
  unint64_t v234;
  unint64_t v235;
  CFCharacterSetRef theSet[2];
  __int128 v237;
  UniChar buffer[8];
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  CFStringRef theString[2];
  __int128 v247;
  __int128 v248;
  uint64_t v249;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v252;
  CGAffineTransform v253;
  NSRange v254;
  CFRange v255;
  CFRange v256;
  CFRange v257;
  CFRange v258;
  CFRange v259;
  CFRange v260;
  NSRange v261;
  NSRange v262;

  v7 = MEMORY[0x18D7912E0](0);
  *(_OWORD *)theSet = 0u;
  v237 = 0u;
  v8 = (__CFString *)objc_msgSend(a1, "string");
  v234 = 0;
  v235 = 0;
  objc_msgSend(a1, "_isStringDrawingTextStorage");
  v230 = a1;
  v224 = objc_msgSend(a1, "_shouldSetOriginalFontAttribute");
  if (fixFontAttributeInRange__onceToken != -1)
    dispatch_once(&fixFontAttributeInRange__onceToken, &__block_literal_global_3);
  v249 = 0;
  v247 = 0u;
  v248 = 0u;
  v245 = 0u;
  *(_OWORD *)theString = 0u;
  v243 = 0u;
  v244 = 0u;
  v241 = 0u;
  v242 = 0u;
  v239 = 0u;
  v240 = 0u;
  *(_OWORD *)buffer = 0u;
  if (length)
  {
    if (location)
    {
      v9 = -[__CFString characterAtIndex:](v8, "characterAtIndex:", location);
      if ((v9 & 0xF800 | 0x400) == 0xDC00)
        goto LABEL_6;
      LOBYTE(v216) = fixFontAttributeInRange__nonBaseSetBMP;
      if (fixFontAttributeInRange__nonBaseSetBMP)
        v216 = (*(unsigned __int8 *)(fixFontAttributeInRange__nonBaseSetBMP + ((unint64_t)v9 >> 3)) >> (v9 & 7)) & 1;
      if (v9 - 4448 < 0x9A
        || (v216 & 1) != 0
        || (v9 & 0xFFF0) == 0xF870
        || v9 == 8205
        || (v9 & 0xFFF0) == 0xF860
        || fixFontAttributeInRange__combiningDataBMP
        && *(_BYTE *)(fixFontAttributeInRange__combiningDataBMP + ((unint64_t)v9 >> 8))
        && *(_BYTE *)(fixFontAttributeInRange__combiningDataBMP
                    + (*(unsigned __int8 *)(fixFontAttributeInRange__combiningDataBMP + ((unint64_t)v9 >> 8)) << 8)
                    - 256
                    + v9
                    + 256) == 9)
      {
LABEL_6:
        v10.location = -[__CFString rangeOfComposedCharacterSequenceAtIndex:](v8, "rangeOfComposedCharacterSequenceAtIndex:", location);
        if (location != v10.location)
        {
          v261.location = location;
          v261.length = length;
          v11 = NSUnionRange(v10, v261);
          location = v11.location;
          length = v11.length;
        }
      }
    }
    if (length + location < -[__CFString length](v8, "length"))
    {
      v12 = -[__CFString characterAtIndex:](v8, "characterAtIndex:", length + location);
      v13 = length + location - 1;
      if ((-[__CFString characterAtIndex:](v8, "characterAtIndex:", v13) & 0xFC00) == 0xD800)
        goto LABEL_10;
      LOBYTE(v215) = fixFontAttributeInRange__nonBaseSetBMP;
      if (fixFontAttributeInRange__nonBaseSetBMP)
        v215 = (*(unsigned __int8 *)(fixFontAttributeInRange__nonBaseSetBMP + ((unint64_t)v12 >> 3)) >> (v12 & 7)) & 1;
      if ((v215 & 1) != 0
        || v12 - 4448 < 0x9A
        || (v12 & 0xFFF0) == 0xF870
        || v12 == 8205
        || (v12 & 0xFFF0) == 0xF860
        || fixFontAttributeInRange__combiningDataBMP
        && *(_BYTE *)(fixFontAttributeInRange__combiningDataBMP + ((unint64_t)v12 >> 8))
        && *(_BYTE *)(fixFontAttributeInRange__combiningDataBMP
                    + (*(unsigned __int8 *)(fixFontAttributeInRange__combiningDataBMP + ((unint64_t)v12 >> 8)) << 8)
                    - 256
                    + v12
                    + 256) == 9)
      {
LABEL_10:
        v254.location = -[__CFString rangeOfComposedCharacterSequenceAtIndex:](v8, "rangeOfComposedCharacterSequenceAtIndex:", v13);
        v262.location = location;
        v262.length = length;
        v14 = NSUnionRange(v254, v262);
        location = v14.location;
        length = v14.length;
      }
    }
  }
  theString[0] = v8;
  *((_QWORD *)&v247 + 1) = location;
  *(_QWORD *)&v248 = length;
  theString[1] = (CFStringRef)CFStringGetCharactersPtr(v8);
  if (theString[1])
    CStringPtr = 0;
  else
    CStringPtr = CFStringGetCStringPtr(v8, 0x600u);
  *((_QWORD *)&v248 + 1) = 0;
  v249 = 0;
  *(_QWORD *)&v247 = CStringPtr;
  if (!length)
  {
    v213 = 0;
    goto LABEL_574;
  }
  v222 = 0;
  v223 = v8;
  v218 = v7;
  v16 = 0;
  v17 = 0;
  v227 = 0;
  v233 = 0;
  v18 = 0;
  v229 = 0;
  v19 = 0;
  v221 = 0;
  v220 = location - 1;
  v219 = location - 2;
  v217 = -(uint64_t)location;
  v226 = length;
  v228 = location;
  do
  {
    v20 = v17;
    if (v16 == v17)
    {
      v21 = (id)objc_msgSend(v230, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSFont"), v16 + location, &v234, location, length);
      v22 = v21;
      if (v21
        && (objc_msgSend(v21, "_isDefaultFace") & 1) == 0
        && (v23 = objc_msgSend(v22, "coveredCharacterSet")) != 0)
      {
        v24 = v23;
        CFCharacterSetInitInlineBuffer();
        v25 = v24;
      }
      else
      {
        v25 = 0;
      }
      v26 = v234;
      v27 = v235;
      v227 = v25;
      if (v18)
      {
        if (v22)
        {
          objc_msgSend(v22, "pointSize");
          v29 = v28;
          objc_msgSend(v18, "pointSize");
          if (v29 != v30)
            goto LABEL_29;
          v31 = objc_msgSend(v22, "traits");
          if (v31 != objc_msgSend(v18, "traits"))
            goto LABEL_29;
          CTFontGetWeight();
          v33 = v32;
          CTFontGetWeight();
          if (vabdd_f64(v33, v34) >= 0.00000011920929
            || (memset(&v253, 0, sizeof(v253)),
                CTFontGetMatrix(&v253, (CTFontRef)v22),
                memset(&v252, 0, sizeof(v252)),
                CTFontGetMatrix(&v252, (CTFontRef)v18),
                t1 = v253,
                t2 = v252,
                !CGAffineTransformEqualToTransform(&t1, &t2)))
          {
LABEL_29:
            objc_msgSend(v230, "addAttribute:value:range:", CFSTR("NSFont"), v18, v229, v19, v217);
            if (v224)
            {
              v35 = (uint64_t)v233;
              if (!v233)
              {
                if (NSDefaultFont_onceToken != -1)
                  dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_14);
                v35 = NSDefaultFont__defaultFont;
              }
              objc_msgSend(v230, "addAttribute:value:range:", CFSTR("NSOriginalFont"), v35, v229, v19);
            }
            v18 = 0;
          }
        }
      }
      v17 = v26 - location + v27;

      v233 = v22;
    }
    v36 = v16 + 1;
    if (v16 < 0 || (v37 = v248, (uint64_t)v248 <= v16))
    {
      v231 = v19;
      v41 = v17;
      v42 = 0;
      v225 = 0;
      goto LABEL_43;
    }
    v38 = (UniChar *)theString[1];
    if (theString[1])
    {
      v39 = *((_QWORD *)&v247 + 1) + v16;
    }
    else
    {
      if ((_QWORD)v247)
      {
        v40 = *(char *)(v247 + *((_QWORD *)&v247 + 1) + v16);
        goto LABEL_55;
      }
      if (v249 <= v16 || (v74 = *((_QWORD *)&v248 + 1), *((uint64_t *)&v248 + 1) > v16))
      {
        v75 = v16 - 4;
        if ((unint64_t)v16 < 4)
          v75 = 0;
        if (v75 + 64 < (uint64_t)v248)
          v37 = v75 + 64;
        *((_QWORD *)&v248 + 1) = v75;
        v249 = v37;
        v255.location = *((_QWORD *)&v247 + 1) + v75;
        v255.length = v37 - v75;
        CFStringGetCharacters(theString[0], v255, buffer);
        v74 = *((_QWORD *)&v248 + 1);
      }
      v39 = v16 - v74;
      v38 = buffer;
    }
    v40 = v38[v39];
LABEL_55:
    v42 = v40;
    if (v40 >> 10 != 54)
      goto LABEL_97;
    v50 = v248;
    if ((uint64_t)v248 <= v36)
      goto LABEL_97;
    v51 = (UniChar *)theString[1];
    if (theString[1])
    {
      v52 = *((_QWORD *)&v247 + 1) + v36;
    }
    else
    {
      if ((_QWORD)v247)
      {
        v53 = *(char *)(v247 + *((_QWORD *)&v247 + 1) + v36);
        goto LABEL_91;
      }
      if (v249 <= v36 || (v87 = *((_QWORD *)&v248 + 1), *((uint64_t *)&v248 + 1) > v36))
      {
        v88 = v16 - 3;
        if ((unint64_t)v36 < 4)
          v88 = 0;
        if (v88 + 64 < (uint64_t)v248)
          v50 = v88 + 64;
        *((_QWORD *)&v248 + 1) = v88;
        v249 = v50;
        v256.location = *((_QWORD *)&v247 + 1) + v88;
        v256.length = v50 - v88;
        CFStringGetCharacters(theString[0], v256, buffer);
        v87 = *((_QWORD *)&v248 + 1);
      }
      v52 = v36 - v87;
      v51 = buffer;
    }
    v53 = v51[v52];
LABEL_91:
    v76 = v53 >> 10;
    v77 = ((_DWORD)v42 << 10) + v53 - 56613888;
    if (v76 == 55)
      v36 = v16 + 2;
    else
      v36 = v16 + 1;
    if (v76 == 55)
      v42 = v77;
    else
      v42 = v42;
LABEL_97:
    LODWORD(v225) = v42 & 0x1FFFF0;
    BYTE4(v225) = (v42 & 0x1FFFF0) == 63584;
    if ((v42 & 0x1FFFF0) != 0xF860)
      goto LABEL_440;
    v231 = v19;
    v41 = v17;
    if (length >= v36 + (unint64_t)__NSTranscodingHintLength[(v42 - 63584)])
      v43 = v36 + __NSTranscodingHintLength[(v42 - 63584)];
    else
      v43 = length;
    if (v227)
    {
      v78 = (uint64_t)theSet[1] & 4;
      if (HIDWORD(theSet[1]) <= v42 && v237 > v42)
      {
        if (WORD1(v42))
          v80 = 0;
        else
          v80 = ((uint64_t)theSet[1] & 2) == 0;
        if (v80)
        {
          if (!*((_QWORD *)&v237 + 1))
          {
            v80 = v78 == 0;
            v138 = v78 != 0;
            v139 = v80;
            if (((uint64_t)theSet[1] & 1) == 0)
              v138 = v139;
            if (!v138)
              goto LABEL_412;
            goto LABEL_357;
          }
          if (((uint64_t)theSet[1] & 1) != 0)
          {
            v140 = v78 >> 2;
            v141 = *(unsigned __int8 *)(*((_QWORD *)&v237 + 1) + ((unint64_t)v42 >> 8));
            if (*(_BYTE *)(*((_QWORD *)&v237 + 1) + ((unint64_t)v42 >> 8)))
            {
              if ((_DWORD)v141 != 255)
              {
                v151 = v78 == 0;
                if ((((unint64_t)*(unsigned __int8 *)(*((_QWORD *)&v237 + 1)
                                                            + 32 * v141
                                                            + (v42 >> 3)
                                                            + 224) >> (v42 & 7)) & 1) != 0)
                  v140 = v151;
                if (!v140)
                  goto LABEL_412;
                goto LABEL_357;
              }
              v140 = v78 == 0;
            }
            if (!v140)
              goto LABEL_412;
          }
          else
          {
            v80 = v78 == 0;
            v81 = v78 != 0;
            v82 = v80;
            if ((((unint64_t)*(unsigned __int8 *)(*((_QWORD *)&v237 + 1)
                                                        + ((unint64_t)v42 >> 3)) >> (v42 & 7)) & 1) != 0)
              v81 = v82;
            if (!v81)
              goto LABEL_412;
          }
        }
        else if (!CFCharacterSetIsLongCharacterMember(theSet[0], v42))
        {
          goto LABEL_412;
        }
      }
      else if (((uint64_t)theSet[1] & 4) == 0)
      {
        goto LABEL_412;
      }
LABEL_357:
      v152 = v36;
      if (v36 < v43)
      {
        v153 = -v36;
        v154 = v36 + 64;
        v152 = v36;
        while (1)
        {
          if ((unint64_t)v152 >= 4)
            v155 = 4;
          else
            v155 = v152;
          if (v152 < 0 || (v156 = v248, (uint64_t)v248 <= v152))
          {
            v157 = 0;
          }
          else if (theString[1])
          {
            v157 = *((_WORD *)&theString[1]->isa + v152 + *((_QWORD *)&v247 + 1));
          }
          else if ((_QWORD)v247)
          {
            v157 = *(char *)(v247 + *((_QWORD *)&v247 + 1) + v152);
          }
          else
          {
            if (v249 <= v152 || (v167 = *((_QWORD *)&v248 + 1), *((uint64_t *)&v248 + 1) > v152))
            {
              v168 = -v155;
              v169 = v155 + v153;
              v170 = v154 - v155;
              v171 = v152 + v168;
              v172 = v171 + 64;
              if (v171 + 64 >= (uint64_t)v248)
                v172 = v248;
              *((_QWORD *)&v248 + 1) = v171;
              v249 = v172;
              if ((uint64_t)v248 >= v170)
                v156 = v170;
              v259.length = v156 + v169;
              v259.location = v171 + *((_QWORD *)&v247 + 1);
              CFStringGetCharacters(theString[0], v259, buffer);
              v167 = *((_QWORD *)&v248 + 1);
            }
            v157 = buffer[v152 - v167];
          }
          v158 = (uint64_t)theSet[1] & 4;
          if (HIDWORD(theSet[1]) <= v157 && v237 > v157)
          {
            if (((uint64_t)theSet[1] & 2) != 0)
            {
              if (!CFCharacterSetIsLongCharacterMember(theSet[0], v157))
                break;
            }
            else if (*((_QWORD *)&v237 + 1))
            {
              if (((uint64_t)theSet[1] & 1) != 0)
              {
                v165 = v158 >> 2;
                v166 = *(unsigned __int8 *)(*((_QWORD *)&v237 + 1) + ((unint64_t)v157 >> 8));
                if (*(_BYTE *)(*((_QWORD *)&v237 + 1) + ((unint64_t)v157 >> 8)))
                {
                  if ((_DWORD)v166 == 255)
                  {
                    v165 = v158 == 0;
                  }
                  else
                  {
                    v173 = v158 == 0;
                    if ((((unint64_t)*(unsigned __int8 *)(*((_QWORD *)&v237 + 1)
                                                                + 32 * v166
                                                                + (v157 >> 3)
                                                                + 224) >> (v157 & 7)) & 1) != 0)
                      v165 = v173;
                  }
                }
                if (!v165)
                  break;
              }
              else
              {
                v160 = v158 != 0;
                v161 = v158 == 0;
                if ((((unint64_t)*(unsigned __int8 *)(*((_QWORD *)&v237 + 1) + ((unint64_t)v157 >> 3)) >> (v157 & 7)) & 1) != 0)
                  v160 = v161;
                if (!v160)
                  break;
              }
            }
            else
            {
              v80 = v158 == 0;
              v162 = v158 != 0;
              v163 = v80;
              if (((uint64_t)theSet[1] & 1) != 0)
                v164 = v162;
              else
                v164 = v163;
              if ((v164 & 1) == 0)
                break;
            }
          }
          else if (((uint64_t)theSet[1] & 4) == 0)
          {
            break;
          }
          ++v152;
          --v153;
          ++v154;
          if (v43 == v152)
            goto LABEL_409;
        }
      }
      if (v152 == v43)
      {
LABEL_409:
        if (!v18)
        {
          length = v226;
LABEL_411:
          location = v228;
          v17 = v41;
LABEL_486:
          v19 = v231;
          goto LABEL_561;
        }
        objc_msgSend(v230, "addAttribute:value:range:", CFSTR("NSFont"), v18, v229, v231);
        length = v226;
        location = v228;
        v17 = v41;
        if (!v224)
        {
          v18 = 0;
          goto LABEL_486;
        }
        v19 = v231;
        v103 = (uint64_t)v233;
        if (!v233)
        {
          if (NSDefaultFont_onceToken == -1)
          {
LABEL_490:
            v103 = NSDefaultFont__defaultFont;
            goto LABEL_491;
          }
LABEL_563:
          dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_14);
          goto LABEL_490;
        }
LABEL_491:
        objc_msgSend(v230, "addAttribute:value:range:", CFSTR("NSOriginalFont"), v103, v229, v19, v217);
LABEL_452:
        v18 = 0;
        goto LABEL_561;
      }
    }
LABEL_412:
    if (!((v18 == 0) | v221 & 1))
    {
      if (!CFCharacterSetIsLongCharacterMember(v222, v42))
      {
        v17 = v41;
        length = v226;
        goto LABEL_439;
      }
      if (v36 >= v43)
      {
        v176 = v36;
      }
      else
      {
        v174 = -v36;
        v175 = v36 + 64;
        v176 = v36;
        while (1)
        {
          v177 = (unint64_t)v176 >= 4 ? 4 : v176;
          if (v176 < 0 || (v178 = v248, (uint64_t)v248 <= v176))
          {
            v179 = 0;
          }
          else if (theString[1])
          {
            v179 = *((_WORD *)&theString[1]->isa + v176 + *((_QWORD *)&v247 + 1));
          }
          else if ((_QWORD)v247)
          {
            v179 = *(char *)(v247 + *((_QWORD *)&v247 + 1) + v176);
          }
          else
          {
            if (v249 <= v176 || (v180 = *((_QWORD *)&v248 + 1), *((uint64_t *)&v248 + 1) > v176))
            {
              v181 = -v177;
              v182 = v177 + v174;
              v183 = v175 - v177;
              v184 = v176 + v181;
              v185 = v184 + 64;
              if (v184 + 64 >= (uint64_t)v248)
                v185 = v248;
              *((_QWORD *)&v248 + 1) = v184;
              v249 = v185;
              if ((uint64_t)v248 >= v183)
                v178 = v183;
              v260.length = v178 + v182;
              v260.location = v184 + *((_QWORD *)&v247 + 1);
              CFStringGetCharacters(theString[0], v260, buffer);
              v180 = *((_QWORD *)&v248 + 1);
            }
            v179 = buffer[v176 - v180];
          }
          if (!CFCharacterSetIsLongCharacterMember(v222, v179))
            break;
          ++v176;
          --v174;
          ++v175;
          if (v43 == v176)
          {
            length = v226;
            v17 = v41;
            goto LABEL_480;
          }
        }
        objc_msgSend(v230, "addAttribute:value:range:", CFSTR("NSFont"), v18, v229, v231);
        if (v224)
        {
          v188 = (uint64_t)v233;
          length = v226;
          if (!v233)
          {
            if (NSDefaultFont_onceToken != -1)
              dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_14);
            v188 = NSDefaultFont__defaultFont;
          }
          objc_msgSend(v230, "addAttribute:value:range:", CFSTR("NSOriginalFont"), v188, v229, v231, v217);
          v18 = 0;
LABEL_478:
          v80 = v176 == v43;
          v17 = v41;
          v19 = v231;
          if (v80)
          {
LABEL_480:
            v221 = 0;
            location = v228;
            v19 = v228 - v229 + v43;
            goto LABEL_561;
          }
          goto LABEL_440;
        }
        v18 = 0;
      }
      length = v226;
      goto LABEL_478;
    }
    length = v226;
    v17 = v41;
LABEL_439:
    v19 = v231;
LABEL_440:
    if ((v42 - 8232) < 2 || (_DWORD)v42 == 160 || (_DWORD)v42 == 65532)
    {
      v43 = v36;
LABEL_444:
      location = v228;
      if (v18)
      {
        objc_msgSend(v230, "addAttribute:value:range:", CFSTR("NSFont"), v18, v229, v19);
        if (v224)
        {
          v186 = (uint64_t)v233;
          if (!v233)
          {
            if (NSDefaultFont_onceToken != -1)
              dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_14);
            v186 = NSDefaultFont__defaultFont;
          }
          objc_msgSend(v230, "addAttribute:value:range:", CFSTR("NSOriginalFont"), v186, v229, v19, v217);
        }
      }
      if (v233)
        goto LABEL_452;
      if (NSDefaultFont_onceToken != -1)
        dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_14);
      v18 = (void *)NSDefaultFont__defaultFont;
      v221 = objc_msgSend((id)NSDefaultFont__defaultFont, "_isDefaultFace", v217);
      if ((v221 & 1) == 0)
        v222 = (const __CFCharacterSet *)objc_msgSend(v18, "coveredCharacterSet");
      v187 = v220 + v43;
      if (v42 >= 0x10000)
        v19 = 2;
      else
        v19 = 1;
      if (v42 >= 0x10000)
        v187 = v219 + v43;
      v229 = v187;
      v233 = 0;
      goto LABEL_561;
    }
    v231 = v19;
    v41 = v17;
LABEL_43:
    v43 = v36;
    v44 = objc_msgSend((id)_CTGetVisibleFormatterCharacterSet(), "longCharacterIsMember:", v42);
    v45 = v42 & 0xFFFFFFFE;
    if ((v42 & 0xFFFFFFFE) == 0xFE0E || (v44 & 1) != 0)
      goto LABEL_62;
    if (WORD1(v42))
    {
      BitmapPtrForPlane = CFUniCharGetBitmapPtrForPlane();
      if (!BitmapPtrForPlane)
        goto LABEL_62;
    }
    else
    {
      BitmapPtrForPlane = fixFontAttributeInRange__controlFormatBMP;
      if (!fixFontAttributeInRange__controlFormatBMP)
        goto LABEL_62;
    }
    v47 = (unsigned __int16)v42 >> 3;
    v48 = 1 << (v42 & 7);
    if ((v48 & *(_BYTE *)(BitmapPtrForPlane + v47)) != 0)
    {
      if (WORD1(v42))
      {
        v49 = CFUniCharGetBitmapPtrForPlane();
        if (!v49)
          goto LABEL_80;
      }
      else
      {
        v49 = fixFontAttributeInRange__graphemeBMP;
        if (!fixFontAttributeInRange__graphemeBMP)
          goto LABEL_80;
      }
      if ((v48 & *(_BYTE *)(v49 + v47)) == 0)
      {
LABEL_80:
        length = v226;
        v17 = v41;
        v19 = v231;
        goto LABEL_444;
      }
    }
LABEL_62:
    if (v42 >> 4 != 4064 && (v42 - 917760) > 0xEF)
    {
      if ((_DWORD)v42 == 8419)
      {
        v54 = -[__CFString rangeOfComposedCharacterSequenceAtIndex:](v223, "rangeOfComposedCharacterSequenceAtIndex:", v220 + v36);
        if (v55 == 2)
        {
          v56 = v54;
          if (v54 != v220 + v43)
          {
            v57 = v54 - v228;
            if ((uint64_t)(v54 - v228) >= 0)
            {
              v58 = v248;
              if ((uint64_t)v248 > v57)
              {
                v59 = (UniChar *)theString[1];
                if (theString[1])
                {
                  v60 = *((_QWORD *)&v247 + 1) + v57;
                  goto LABEL_71;
                }
                if ((_QWORD)v247)
                {
                  v61 = *(char *)(v247 + *((_QWORD *)&v247 + 1) + v57);
                }
                else
                {
                  if (v249 <= v57 || (v149 = *((_QWORD *)&v248 + 1), *((uint64_t *)&v248 + 1) > v57))
                  {
                    v150 = v57 - 4;
                    if ((unint64_t)v57 < 4)
                      v150 = 0;
                    if (v150 + 64 < (uint64_t)v248)
                      v58 = v150 + 64;
                    *((_QWORD *)&v248 + 1) = v150;
                    v249 = v58;
                    v258.location = *((_QWORD *)&v247 + 1) + v150;
                    v258.length = v58 - v150;
                    CFStringGetCharacters(theString[0], v258, buffer);
                    v149 = *((_QWORD *)&v248 + 1);
                  }
                  v60 = v57 - v149;
                  v59 = buffer;
LABEL_71:
                  v61 = v59[v60];
                }
                if (v61 == 35 || v61 == 42 || (unsigned __int16)(v61 - 48) <= 9u)
                {
                  if (v57 < v234 || (v89 = v233, v57 - v234 >= v235))
                    v89 = (void *)objc_msgSend(v230, "attribute:atIndex:effectiveRange:", CFSTR("NSFont"), v57, 0, v217);
                  v90 = v228;
                  if ((objc_msgSend(v89, "_hasColorGlyphs", v217) & 1) != 0)
                  {
                    length = v226;
                    v17 = v41;
                    v19 = v231;
                  }
                  else
                  {
                    v135 = (id)CTFontCreateEmojiFontForFont();
                    if (v18)
                    {
                      v136 = NSIntersectsRange() ? v56 - v229 : v231;
                      if (v136)
                      {
                        objc_msgSend(v230, "addAttribute:value:range:", CFSTR("NSFont"), v18, v229, v136);
                        if (v224)
                        {
                          v137 = (uint64_t)v233;
                          if (!v233)
                          {
                            if (NSDefaultFont_onceToken != -1)
                              dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_14);
                            v137 = NSDefaultFont__defaultFont;
                          }
                          objc_msgSend(v230, "addAttribute:value:range:", CFSTR("NSOriginalFont"), v137, v229, v136);
                        }
                      }
                    }
                    v222 = (const __CFCharacterSet *)objc_msgSend(v135, "coveredCharacterSet");
                    v221 = 0;
                    v43 = v57 + 2;
                    v229 = v56;
                    v18 = v135;
                    length = v226;
                    v17 = v41;
                    v19 = 2;
                  }
LABEL_309:
                  location = v90;
                  goto LABEL_561;
                }
              }
            }
          }
        }
      }
      length = v226;
      if (!v227)
        goto LABEL_166;
      v91 = (uint64_t)theSet[1] & 4;
      if (HIDWORD(theSet[1]) > v42 || v237 <= v42)
      {
        if (((uint64_t)theSet[1] & 4) != 0)
          goto LABEL_174;
        goto LABEL_166;
      }
      if (WORD1(v42) || ((uint64_t)theSet[1] & 2) != 0)
      {
        if (CFCharacterSetIsLongCharacterMember(theSet[0], v42))
          goto LABEL_174;
        goto LABEL_166;
      }
      if (*((_QWORD *)&v237 + 1))
      {
        if (((uint64_t)theSet[1] & 1) == 0)
        {
          v80 = v91 == 0;
          v92 = v91 != 0;
          v93 = v80;
          if ((((unint64_t)*(unsigned __int8 *)(*((_QWORD *)&v237 + 1)
                                                      + ((unint64_t)v42 >> 3)) >> (v42 & 7)) & 1) != 0)
            v92 = v93;
          if (v92)
            goto LABEL_174;
LABEL_166:
          if ((_DWORD)v42 == 65533)
          {
            v94 = (void *)objc_msgSend((id)objc_msgSend(v230, "attribute:atIndex:effectiveRange:", NSGlyphInfoAttributeName, v220 + v43, 0), "_baseString");
            if (v94)
            {
              v95 = v94;
              v96 = 65533;
              if (objc_msgSend(v94, "length") == 1
                && objc_msgSend(v95, "characterAtIndex:", 0) == 65533)
              {
                v97 = v18 == 0;
                if (v16 == v20 || !v18)
                {
LABEL_179:
                  if (!v97)
                  {
LABEL_180:
                    objc_msgSend(v230, "addAttribute:value:range:", CFSTR("NSFont"), v18, v229, v231, v217);
                    if (v224)
                    {
                      v103 = (uint64_t)v233;
                      location = v228;
                      v17 = v41;
                      v19 = v231;
                      if (v233)
                        goto LABEL_491;
                      if (NSDefaultFont_onceToken == -1)
                        goto LABEL_490;
                      goto LABEL_563;
                    }
                  }
                  v18 = 0;
                  goto LABEL_411;
                }
                v98 = 65533;
LABEL_177:
                v99 = BYTE4(v225);
                v100 = fixFontAttributeInRange__nonBaseSetBMP;
                v101 = 1;
                if (fixFontAttributeInRange__nonBaseSetBMP)
                  goto LABEL_178;
LABEL_187:
                LOBYTE(v102) = 0;
                goto LABEL_188;
              }
            }
            else
            {
              v96 = 65533;
            }
LABEL_231:
            v113 = HIWORD(v96);
            v90 = v228;
            v17 = v41;
            if (v18)
            {
              v114 = v229 + v231 - 1;
              if (v114 < 0 || (v115 = v248, (uint64_t)v248 <= v114))
              {
                v116 = 0;
              }
              else if (theString[1])
              {
                v116 = *((_WORD *)&theString[1]->isa + *((_QWORD *)&v247 + 1) + v114);
              }
              else if ((_QWORD)v247)
              {
                v116 = *(char *)(v247 + *((_QWORD *)&v247 + 1) + v114);
              }
              else
              {
                if (v249 <= v114 || (v146 = *((_QWORD *)&v248 + 1), *((uint64_t *)&v248 + 1) > v114))
                {
                  v147 = v229 + v231 - 5;
                  if ((unint64_t)v114 < 4)
                    v147 = 0;
                  if (v147 + 64 < (uint64_t)v248)
                    v115 = v147 + 64;
                  *((_QWORD *)&v248 + 1) = v147;
                  v249 = v115;
                  v257.location = *((_QWORD *)&v247 + 1) + v147;
                  v257.length = v115 - v147;
                  CFStringGetCharacters(theString[0], v257, buffer);
                  v146 = *((_QWORD *)&v248 + 1);
                }
                v116 = buffer[v114 - v146];
              }
              if (!(((v116 & 0xFFF0) == 65024) | v221 & 1) && CFCharacterSetIsLongCharacterMember(v222, v96))
              {
                v221 = 0;
                v117 = 1;
                if (v113)
                  v117 = 2;
                v19 = v117 + v231;
                goto LABEL_309;
              }
              objc_msgSend(v230, "addAttribute:value:range:", CFSTR("NSFont"), v18, v229, v231, v217);
              if (v224)
              {
                v118 = (uint64_t)v233;
                if (!v233)
                {
                  if (NSDefaultFont_onceToken != -1)
                    dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_14);
                  v118 = NSDefaultFont__defaultFont;
                }
                objc_msgSend(v230, "addAttribute:value:range:", CFSTR("NSOriginalFont"), v118, v229, v231);
              }
            }
            if (v113)
              v119 = -2;
            else
              v119 = -1;
            v120 = v228 + v43 + v119;
            if (v113)
              v19 = 2;
            else
              v19 = 1;
            if (!v233)
            {
              if (NSDefaultFont_onceToken != -1)
                dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_14);
              if (CFCharacterSetIsLongCharacterMember((CFCharacterSetRef)objc_msgSend((id)NSDefaultFont__defaultFont, "coveredCharacterSet", v217), v96))
              {
                location = v228;
                if (v224)
                {
                  if (NSDefaultFont_onceToken != -1)
                    dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_14);
                  objc_msgSend(v230, "addAttribute:value:range:", CFSTR("NSOriginalFont"), NSDefaultFont__defaultFont, v228 + v43 + v119, v19);
                }
                if (NSDefaultFont_onceToken != -1)
                  dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_14);
                v18 = (void *)NSDefaultFont__defaultFont;
                if ((objc_msgSend((id)NSDefaultFont__defaultFont, "_isDefaultFace") & 1) != 0)
                {
                  v233 = 0;
                  goto LABEL_557;
                }
                v222 = (const __CFCharacterSet *)objc_msgSend(v18, "coveredCharacterSet");
                v221 = 0;
                v233 = 0;
LABEL_559:
                v229 = v120;
LABEL_560:
                length = v226;
                goto LABEL_561;
              }
            }
            v232 = v19;
            if (v113)
            {
              v121 = CFUniCharGetBitmapPtrForPlane();
              if (!v121)
                goto LABEL_260;
            }
            else
            {
              v121 = fixFontAttributeInRange__graphemeBMP;
              if (!fixFontAttributeInRange__graphemeBMP)
              {
LABEL_260:
                if (v113)
                {
                  v122 = CFUniCharGetBitmapPtrForPlane();
                  if (!v122)
                    goto LABEL_275;
LABEL_262:
                  v123 = (*(unsigned __int8 *)(v122 + ((unsigned __int16)v96 >> 3)) >> (v96 & 7)) & 1;
                }
                else
                {
                  v122 = fixFontAttributeInRange__nonBaseSetBMP;
                  if (fixFontAttributeInRange__nonBaseSetBMP)
                    goto LABEL_262;
LABEL_275:
                  LOBYTE(v123) = 0;
                }
                if (v96 - 4448 >= 0x9A
                  && (v123 & 1) == 0
                  && (v96 & 0x1FFFE0 | 0x10) != 0xF870
                  && v96 - 127995 >= 5
                  && v96 != 8205)
                {
                  goto LABEL_528;
                }
                goto LABEL_280;
              }
            }
            if (((*(unsigned __int8 *)(v121 + ((unsigned __int16)v96 >> 3)) >> (v96 & 7)) & 1) == 0)
              goto LABEL_260;
LABEL_280:
            v124 = -[__CFString rangeOfComposedCharacterSequenceAtIndex:](v223, "rangeOfComposedCharacterSequenceAtIndex:", v228 + v43 + v119, v217);
            v229 = v124;
            v126 = v124 - v228;
            if ((uint64_t)(v124 - v228) >= 0)
            {
              v127 = v125;
              v128 = v248;
              if (v126 + v125 <= (uint64_t)v248)
              {
                if (theString[1])
                {
                  v129 = v125;
                  v130 = (UniChar *)theString[1] + *((_QWORD *)&v247 + 1) + v126;
                }
                else
                {
                  if (v125 > 64)
                    goto LABEL_528;
                  if (v126 + v125 > v249 || v126 < *((uint64_t *)&v248 + 1))
                  {
                    if (v126 + 64 < (uint64_t)v248)
                      v128 = v126 + 64;
                    *((_QWORD *)&v248 + 1) = v124 - v228;
                    v249 = v128;
                    v131.length = v128 - v126;
                    if ((_QWORD)v247)
                    {
                      if (v131.length)
                      {
                        v132 = (char *)(v247 + v217 + v124 + *((_QWORD *)&v247 + 1));
                        v133 = buffer;
                        do
                        {
                          v134 = *v132++;
                          *v133++ = v134;
                          --v131.length;
                        }
                        while (v131.length);
                      }
                    }
                    else
                    {
                      v131.location = *((_QWORD *)&v247 + 1) + v126;
                      CFStringGetCharacters(theString[0], v131, buffer);
                    }
                  }
                  v129 = v127;
                  v130 = &buffer[v126 - *((_QWORD *)&v248 + 1)];
                }
                v197 = (uint64_t)v233;
                if (!v233)
                {
                  if (NSDefaultFont_onceToken != -1)
                    dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_14);
                  v197 = NSDefaultFont__defaultFont;
                }
                v198 = objc_msgSend(v230, "attributesAtIndex:effectiveRange:", v229, 0);
                v199 = (void *)v197;
                v19 = v129;
                v200 = (void *)objc_msgSend(v199, "bestMatchingFontForCharacters:length:attributes:actualCoveredLength:", v130, v129, v198, 0);
                if (v200)
                {
                  v18 = v200;
                  v221 = objc_msgSend(v200, "_isDefaultFace");
                  if ((v221 & 1) == 0)
                    v222 = (const __CFCharacterSet *)objc_msgSend(v18, "coveredCharacterSet");
                  location = v228;
                  v43 = v19 - v228 + v229;
                  goto LABEL_560;
                }
              }
            }
LABEL_528:
            location = v228;
            v201 = v43 + v119;
            if ((uint64_t)(v43 + v119) < 0)
            {
              v18 = 0;
              v19 = v232;
            }
            else
            {
              v19 = v232;
              if (v201 + v232 <= (uint64_t)v248)
              {
                if (theString[1])
                {
                  v202 = (UniChar *)theString[1] + *((_QWORD *)&v247 + 1) + v201;
                }
                else
                {
                  if (v201 + v232 > v249 || v201 < *((uint64_t *)&v248 + 1))
                  {
                    v203 = v201 + 64;
                    if (v201 + 64 >= (uint64_t)v248)
                      v203 = v248;
                    *((_QWORD *)&v248 + 1) = v43 + v119;
                    v249 = v203;
                    v204.location = *((_QWORD *)&v247 + 1) + v201;
                    v204.length = v203 - v201;
                    if ((_QWORD)v247)
                    {
                      if (v204.length)
                      {
                        v205 = (char *)(v247 + v204.location);
                        v206 = v119 + v43 - v203;
                        v207 = buffer;
                        do
                        {
                          v208 = *v205++;
                          *v207++ = v208;
                        }
                        while (!__CFADD__(v206++, 1));
                      }
                    }
                    else
                    {
                      CFStringGetCharacters(theString[0], v204, buffer);
                    }
                  }
                  v202 = &buffer[v201 - *((_QWORD *)&v248 + 1)];
                }
                v210 = v233;
                if (!v233)
                {
                  if (NSDefaultFont_onceToken != -1)
                    dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_14);
                  v210 = (void *)NSDefaultFont__defaultFont;
                }
                v18 = (void *)objc_msgSend(v210, "bestMatchingFontForCharacters:length:attributes:actualCoveredLength:", v202, v232, objc_msgSend(v230, "attributesAtIndex:effectiveRange:", v120, 0, v217), 0);
                if (!v18)
                {
                  v211 = v233;
                  if (!v233)
                  {
                    if (NSDefaultFont_onceToken != -1)
                      dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_14);
                    v211 = (void *)NSDefaultFont__defaultFont;
                  }
                  v18 = (void *)objc_msgSend(v211, "lastResortFont");
                }
                if ((objc_msgSend(v18, "_isDefaultFace") & 1) != 0)
                {
LABEL_557:
                  v221 = 1;
                }
                else
                {
                  v222 = (const __CFCharacterSet *)objc_msgSend(v18, "coveredCharacterSet");
                  v221 = 0;
                }
              }
              else
              {
                v18 = 0;
              }
            }
            goto LABEL_559;
          }
LABEL_211:
          if (v45 == 8208)
            v96 = 45;
          else
            v96 = v42;
          if (!v227 || v45 != 8208)
            goto LABEL_231;
          v110 = (uint64_t)theSet[1] & 4;
          if (HIDWORD(theSet[1]) > 0x2D || v237 < 0x2E)
          {
            v17 = v41;
            if (((uint64_t)theSet[1] & 4) != 0)
              goto LABEL_484;
          }
          else
          {
            v17 = v41;
            if (((uint64_t)theSet[1] & 2) != 0)
            {
              v96 = 45;
              if (CFCharacterSetIsLongCharacterMember(theSet[0], 0x2Du))
                goto LABEL_484;
              goto LABEL_231;
            }
            if (*((_QWORD *)&v237 + 1))
            {
              if (((uint64_t)theSet[1] & 1) != 0)
              {
                v144 = v110 >> 2;
                v145 = **((_BYTE **)&v237 + 1);
                if (**((_BYTE **)&v237 + 1))
                {
                  if ((_DWORD)v145 == 255)
                  {
                    v144 = v110 == 0;
                  }
                  else
                  {
                    v189 = v110 == 0;
                    if ((*(_BYTE *)(*((_QWORD *)&v237 + 1) + 32 * v145 + 229) & 0x20) != 0)
                      v144 = v189;
                  }
                }
                if (v144)
                  goto LABEL_484;
              }
              else
              {
                v80 = v110 == 0;
                v111 = v110 != 0;
                v112 = v80;
                if ((*(_BYTE *)(*((_QWORD *)&v237 + 1) + 5) & 0x20) != 0)
                  v111 = v112;
                if (v111)
                  goto LABEL_484;
              }
            }
            else
            {
              v80 = v110 == 0;
              v142 = v110 != 0;
              v143 = v80;
              if (((uint64_t)theSet[1] & 1) == 0)
                v142 = v143;
              if (v142)
              {
LABEL_484:
                if (!v18)
                {
                  location = v228;
                  goto LABEL_486;
                }
                v19 = v231;
                objc_msgSend(v230, "addAttribute:value:range:", CFSTR("NSFont"), v18, v229, v231);
                location = v228;
                if (v224)
                {
                  v103 = (uint64_t)v233;
                  if (v233)
                    goto LABEL_491;
                  if (NSDefaultFont_onceToken == -1)
                    goto LABEL_490;
                  goto LABEL_563;
                }
                goto LABEL_452;
              }
            }
          }
          v41 = v17;
          v96 = 45;
          goto LABEL_231;
        }
        v108 = v91 >> 2;
        v109 = *(unsigned __int8 *)(*((_QWORD *)&v237 + 1) + ((unint64_t)v42 >> 8));
        if (*(_BYTE *)(*((_QWORD *)&v237 + 1) + ((unint64_t)v42 >> 8)))
        {
          if ((_DWORD)v109 == 255)
          {
            v108 = v91 == 0;
          }
          else
          {
            v148 = v91 == 0;
            if ((((unint64_t)*(unsigned __int8 *)(*((_QWORD *)&v237 + 1)
                                                        + 32 * v109
                                                        + (v42 >> 3)
                                                        + 224) >> (v42 & 7)) & 1) != 0)
              v108 = v148;
          }
        }
        if (!v108)
          goto LABEL_166;
      }
      else
      {
        v80 = v91 == 0;
        v106 = v91 != 0;
        v107 = v80;
        if (((uint64_t)theSet[1] & 1) == 0)
          v106 = v107;
        if (!v106)
          goto LABEL_166;
      }
LABEL_174:
      v97 = v18 == 0;
      if (v16 == v20 || !v18)
        goto LABEL_179;
      v98 = (unsigned __int16)v42;
      if (!WORD1(v42))
        goto LABEL_177;
      v100 = CFUniCharGetBitmapPtrForPlane();
      v101 = 0;
      v99 = BYTE4(v225);
      if (!v100)
        goto LABEL_187;
LABEL_178:
      v102 = (*(unsigned __int8 *)(v100 + ((unint64_t)v98 >> 3)) >> (v98 & 7)) & 1;
LABEL_188:
      if ((_DWORD)v42 == 8205)
        v104 = 1;
      else
        v104 = v99;
      if ((v42 - 127995) >= 5
        && (v104 & 1) == 0
        && (_DWORD)v225 != 63600
        && (v42 - 4448) >= 0x9A
        && (v102 & 1) == 0)
      {
        if (v101)
        {
          v105 = fixFontAttributeInRange__graphemeBMP;
          if (!fixFontAttributeInRange__graphemeBMP)
            goto LABEL_180;
        }
        else
        {
          v105 = CFUniCharGetBitmapPtrForPlane();
          if (!v105)
            goto LABEL_180;
        }
        if (((*(unsigned __int8 *)(v105 + ((unint64_t)v98 >> 3)) >> (v98 & 7)) & 1) == 0)
          goto LABEL_180;
      }
      goto LABEL_211;
    }
    location = v228;
    v62 = v36 + v228;
    v63 = -2;
    if (WORD1(v42))
    {
      v64 = 2;
    }
    else
    {
      v63 = -1;
      v64 = 1;
    }
    v65 = v62 + v63;
    v66 = -[__CFString rangeOfComposedCharacterSequenceAtIndex:](v223, "rangeOfComposedCharacterSequenceAtIndex:", v62 + v63, v217);
    v17 = v41;
    v19 = v231;
    if (v66 >= v65)
      goto LABEL_514;
    v68 = v66;
    v69 = v66 - v228;
    if ((uint64_t)(v66 - v228) < 0)
      goto LABEL_514;
    v70 = v67;
    v71 = v248;
    if (v69 + v67 > (uint64_t)v248)
      goto LABEL_514;
    if (theString[1])
    {
      v72 = (UniChar *)theString[1] + *((_QWORD *)&v247 + 1) + v69;
      v73 = v233;
    }
    else
    {
      if (v67 > 64)
        goto LABEL_514;
      v73 = v233;
      if (v69 + v67 > v249 || v69 < *((uint64_t *)&v248 + 1))
      {
        if (v69 + 64 < (uint64_t)v248)
          v71 = v69 + 64;
        *((_QWORD *)&v248 + 1) = v66 - v228;
        v249 = v71;
        v83.length = v71 - v69;
        if ((_QWORD)v247)
        {
          if (v83.length)
          {
            v84 = (char *)(v247 + v217 + v66 + *((_QWORD *)&v247 + 1));
            v85 = buffer;
            do
            {
              v86 = *v84++;
              *v85++ = v86;
              --v83.length;
            }
            while (v83.length);
          }
        }
        else
        {
          v83.location = *((_QWORD *)&v247 + 1) + v69;
          CFStringGetCharacters(theString[0], v83, buffer);
        }
      }
      v72 = &buffer[v69 - *((_QWORD *)&v248 + 1)];
    }
    v190 = v73;
    if (!v73)
    {
      if (NSDefaultFont_onceToken != -1)
        dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_14);
      v190 = (void *)NSDefaultFont__defaultFont;
    }
    v191 = (void *)objc_msgSend(v190, "bestMatchingFontForCharacters:length:attributes:actualCoveredLength:", v72, v70, objc_msgSend(v230, "attributesAtIndex:effectiveRange:", v68, 0), 0);
    location = v228;
    if (!v191)
    {
LABEL_514:
      if (v18)
        v196 = v64;
      else
        v196 = 0;
      v19 = v196 + v231;
      goto LABEL_560;
    }
    v192 = v191;
    if ((objc_msgSend(v191, "isEqual:", v233) & 1) != 0)
      goto LABEL_560;
    v193 = v17;
    if (v18)
    {
      v194 = (NSIntersectsRange() & (v68 > v229)) != 0 ? v68 - v229 : v231;
      if (v194)
      {
        objc_msgSend(v230, "addAttribute:value:range:", CFSTR("NSFont"), v18, v229, v194);
        if (v224)
        {
          v195 = (uint64_t)v233;
          if (!v233)
          {
            if (NSDefaultFont_onceToken != -1)
              dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_14);
            v195 = NSDefaultFont__defaultFont;
          }
          objc_msgSend(v230, "addAttribute:value:range:", CFSTR("NSOriginalFont"), v195, v229, v194);
        }
      }
    }
    v221 = objc_msgSend(v192, "_isDefaultFace");
    if ((v221 & 1) == 0)
      v222 = (const __CFCharacterSet *)objc_msgSend(v192, "coveredCharacterSet");
    v43 = v70 - v228 + v68;
    v19 = v70;
    v229 = v68;
    v18 = v192;
    length = v226;
    v17 = v193;
LABEL_561:
    v16 = v43;
  }
  while (v43 < length);
  if (v18 && (objc_msgSend(v230, "addAttribute:value:range:", CFSTR("NSFont"), v18, v229, v19), v224))
  {
    v212 = (uint64_t)v233;
    v7 = v218;
    if (!v233)
    {
      if (NSDefaultFont_onceToken != -1)
        dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_14);
      v212 = NSDefaultFont__defaultFont;
    }
    objc_msgSend(v230, "addAttribute:value:range:", CFSTR("NSOriginalFont"), v212, v229, v19, v217);
  }
  else
  {
    v7 = v218;
  }
  v213 = v233;
LABEL_574:

  return MEMORY[0x18D7912D4](v7);
}

- (unint64_t)fixGlyphInfoAttributeInRange:()NSMutableAttributedStringKitAdditions
{
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t result;
  uint64_t v12;
  uint64_t v13;

  v12 = 0;
  v13 = 0;
  v7 = a3 + a4;
  if (a3)
  {
    v8 = objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", NSGlyphInfoAttributeName, a3 - 1, &v12, 0, a3);
    if (v8)
      objc_msgSend(a1, "_fixGlyphInfo:inRange:", v8, v12, v13);
  }
  if (a3 >= v7)
  {
    v9 = a3;
  }
  else
  {
    v9 = a3;
    do
    {
      v10 = objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", NSGlyphInfoAttributeName, v9, &v12, a3, a4);
      if (v10)
        objc_msgSend(a1, "_fixGlyphInfo:inRange:", v10, v12, v13);
      v9 = v13 + v12;
    }
    while (v13 + v12 < v7);
  }
  result = objc_msgSend(a1, "length", v12, v13);
  if (v9 < result)
  {
    result = objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", NSGlyphInfoAttributeName, v9, &v12, v9, objc_msgSend(a1, "length") - v9);
    if (result)
      return objc_msgSend(a1, "_fixGlyphInfo:inRange:", result, v12, v13);
  }
  return result;
}

- (uint64_t)_attributeFixingInProgress
{
  return 0;
}

- (uint64_t)convertWritingDirectionToBidiControlCharacters
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(a1, "beginEditing");
  if (objc_msgSend(a1, "length"))
  {
    v2 = 0;
    do
    {
      v3 = objc_msgSend(a1, "convertWritingDirectionToBidiControlCharactersForParagraphAtIndex:", v2);
      v2 = v3 + v4;
    }
    while (v3 + v4 < (unint64_t)objc_msgSend(a1, "length"));
  }
  return objc_msgSend(a1, "endEditing");
}

- (unint64_t)convertWritingDirectionToBidiControlCharactersForParagraphAtIndex:()NSMutableAttributedStringKitAdditions
{
  __CFString *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  uint64_t v10;
  __int16 v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;

  v5 = (__CFString *)objc_msgSend(a1, "mutableString");
  v32 = 0;
  v33 = 0;
  v31 = 0;
  v27 = a1;
  v6 = objc_msgSend((id)objc_msgSend(a1, "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), a3, 0), "baseWritingDirection");
  v29 = 0;
  v30 = 0;
  v28 = 0;
  -[__CFString getParagraphStart:end:contentsEnd:forRange:](v5, "getParagraphStart:end:contentsEnd:forRange:", &v33, &v31, &v32, a3, 0);
  v7 = v32;
  v8 = v33;
  v9 = v6 != -1 && v32 > v33;
  if (v9)
  {
    v10 = _NSStringImputedBaseWritingDirectionAtIndex(v5, v33, v33, v32 - v33);
    if (v10 == -1 || v10 == v6)
    {
      v7 = v32;
      v8 = v33;
    }
    else
    {
      if (v6 == 1)
        v12 = 8207;
      else
        v12 = 8206;
      v28 = v12;
      v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v28, 1);
      -[__CFString insertString:atIndex:](v5, "insertString:atIndex:", v13, v33);
      v8 = v33 + 1;
      v7 = ++v32;
      ++v33;
      ++v31;
    }
  }
  if (v8 >= v7)
  {
    v28 = 8236;
LABEL_41:
    v24 = v31;
    goto LABEL_42;
  }
  v14 = 0;
  v15 = 0;
  v26 = CFSTR("NSWritingDirection");
  do
  {
    v16 = (void *)objc_msgSend(v27, "attribute:atIndex:longestEffectiveRange:inRange:", v26, v8, &v29, v8, v7 - v8, v26);
    v17 = objc_msgSend(v16, "count");
    v18 = v17;
    v19 = 0;
    if (v15 >= v17)
      v20 = v17;
    else
      v20 = v15;
    if (v20)
    {
      while (objc_msgSend((id)objc_msgSend(v16, "objectAtIndex:", v19), "isEqual:", objc_msgSend(v14, "objectAtIndex:", v19)))
      {
        if (v20 == ++v19)
        {
          v19 = v20;
          break;
        }
      }
    }
    v28 = 8236;
    v9 = v15 > v19;
    v21 = v15 - v19;
    if (v9)
    {
      do
      {
        -[__CFString insertString:atIndex:](v5, "insertString:atIndex:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v28, 1), v8++);
        ++v31;
        ++v32;
        --v21;
      }
      while (v21);
    }
    if (v19 >= v18)
    {
      v7 = v32;
    }
    else
    {
      do
      {
        v28 = 8234;
        v22 = objc_msgSend((id)objc_msgSend(v16, "objectAtIndex:", v19), "unsignedIntegerValue");
        if ((v22 & 1) != 0)
          ++v28;
        if ((v22 & 2) != 0)
          v28 += 3;
        -[__CFString insertString:atIndex:](v5, "insertString:atIndex:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v28, 1), v8++);
        v7 = v32 + 1;
        ++v31;
        ++v32;
        ++v19;
      }
      while (v18 != v19);
    }
    v8 += v30;
    v14 = v16;
    v15 = v18;
  }
  while (v8 < v7);
  v28 = 8236;
  if (!v18)
    goto LABEL_41;
  do
  {
    v23 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v28, 1);
    -[__CFString insertString:atIndex:](v5, "insertString:atIndex:", v23, v32);
    v24 = ++v31;
    ++v32;
    --v18;
  }
  while (v18);
LABEL_42:
  objc_msgSend(v27, "removeAttribute:range:", CFSTR("NSWritingDirection"), v33, v24 - v33);
  return v33;
}

- (unint64_t)_fixGlyphInfo:()NSMutableAttributedStringKitAdditions inRange:
{
  unint64_t result;
  unint64_t v10;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = objc_msgSend((id)objc_msgSend(a3, "_baseString"), "length");
  if (result <= a5)
  {
    v10 = result;
    v13 = 0;
    v14 = 0;
    result = objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSFont"), a4, &v13, a4, a5);
    if (v13 == a4 && v14 == a5)
    {
      result = objc_msgSend(a3, "_glyphForFont:baseString:", result, objc_msgSend((id)objc_msgSend(a1, "string"), "substringWithRange:", a4, v10));
      if ((_DWORD)result)
        v12 = v10;
      else
        v12 = 0;
      a4 += v12;
      a5 -= v12;
    }
  }
  if (a5)
    return objc_msgSend(a1, "removeAttribute:range:", NSGlyphInfoAttributeName, a4, a5);
  return result;
}

- (void)setAlignment:()NSMutableAttributedStringKitAdditions range:
{
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSParagraphStyle *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  if (a5)
  {
    v8 = result;
    v9 = a4 + a5;
    v10 = objc_msgSend(result, "zone");
    objc_msgSend(v8, "beginEditing");
    if (a4 < v9)
    {
      v11 = a4;
      do
      {
        v14 = 0;
        v15 = 0;
        v12 = (NSParagraphStyle *)objc_msgSend(v8, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSParagraphStyle"), v11, &v14, a4, a5);
        if (!v12)
          v12 = +[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle");
        if (-[NSParagraphStyle alignment](v12, "alignment") != a3)
        {
          v13 = -[NSParagraphStyle mutableCopyWithZone:](v12, "mutableCopyWithZone:", v10);
          objc_msgSend(v13, "setAlignment:", a3);
          objc_msgSend(v8, "addAttribute:value:range:", CFSTR("NSParagraphStyle"), v13, v14, v15);

        }
        v11 = v15 + v14;
      }
      while (v15 + v14 < v9);
    }
    return (void *)objc_msgSend(v8, "endEditing");
  }
  return result;
}

- (void)setBaseWritingDirection:()NSMutableAttributedStringKitAdditions range:
{
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSParagraphStyle *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  if (a5)
  {
    v8 = result;
    v9 = a4 + a5;
    v10 = objc_msgSend(result, "zone");
    objc_msgSend(v8, "beginEditing");
    if (a4 < v9)
    {
      v11 = a4;
      do
      {
        v14 = 0;
        v15 = 0;
        v12 = (NSParagraphStyle *)objc_msgSend(v8, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSParagraphStyle"), v11, &v14, a4, a5);
        if (!v12)
          v12 = +[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle");
        if (-[NSParagraphStyle baseWritingDirection](v12, "baseWritingDirection") != a3)
        {
          v13 = -[NSParagraphStyle mutableCopyWithZone:](v12, "mutableCopyWithZone:", v10);
          objc_msgSend(v13, "setBaseWritingDirection:", a3);
          objc_msgSend(v8, "addAttribute:value:range:", CFSTR("NSParagraphStyle"), v13, v14, v15);

        }
        v11 = v15 + v14;
      }
      while (v15 + v14 < v9);
    }
    return (void *)objc_msgSend(v8, "endEditing");
  }
  return result;
}

- (uint64_t)_changeIntAttribute:()NSMutableAttributedStringKitAdditions by:range:
{
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  result = objc_msgSend(a1, "zone");
  if (a6)
  {
    v12 = result;
    objc_msgSend(a1, "beginEditing");
    if (a5 < a5 + a6)
    {
      v13 = a5;
      do
      {
        v16 = 0;
        v17 = 0;
        v14 = (char *)objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", a3, v13, &v16, a5, a6);
        if (v14)
          v14 = (char *)objc_msgSend(v14, "integerValue");
        if (&v14[a4])
        {
          v15 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "allocWithZone:", v12), "initWithInteger:", &v14[a4]);
          objc_msgSend(a1, "addAttribute:value:range:", a3, v15, v16, v17);

        }
        else
        {
          objc_msgSend(a1, "removeAttribute:range:", a3, v16, v17);
        }
        v13 = v17 + v16;
      }
      while (v17 + v16 < a5 + a6);
    }
    return objc_msgSend(a1, "endEditing");
  }
  return result;
}

- (uint64_t)superscriptRange:()NSMutableAttributedStringKitAdditions
{
  return objc_msgSend(a1, "_changeIntAttribute:by:range:", CFSTR("NSSuperScript"), 1, a3, a4);
}

- (uint64_t)subscriptRange:()NSMutableAttributedStringKitAdditions
{
  return objc_msgSend(a1, "_changeIntAttribute:by:range:", CFSTR("NSSuperScript"), -1, a3, a4);
}

- (uint64_t)unscriptRange:()NSMutableAttributedStringKitAdditions
{
  return objc_msgSend(a1, "removeAttribute:range:", CFSTR("NSSuperScript"), a3, a4);
}

- (BOOL)readFromURL:()NSMutableAttributedStringKitAdditions options:documentAttributes:error:
{
  return _NSReadAttributedStringFromURLOrData(a1, a3, 0, a4, a5, a6) != 0;
}

- (BOOL)readFromFileURL:()NSMutableAttributedStringKitAdditions options:documentAttributes:error:
{
  return _NSReadAttributedStringFromURLOrData(a1, a3, 0, a4, a5, a6) != 0;
}

- (BOOL)readFromData:()NSMutableAttributedStringKitAdditions options:documentAttributes:error:
{
  return _NSReadAttributedStringFromURLOrData(a1, 0, a3, a4, a5, a6) != 0;
}

- (uint64_t)readFromURL:()NSMutableAttributedStringKitAdditions options:documentAttributes:
{
  return objc_msgSend(a1, "readFromURL:options:documentAttributes:error:", a3, a4, a5, 0);
}

- (uint64_t)readFromData:()NSMutableAttributedStringKitAdditions options:documentAttributes:
{
  return objc_msgSend(a1, "readFromData:options:documentAttributes:error:", a3, a4, a5, 0);
}

- (unint64_t)convertBidiControlCharactersToWritingDirectionForParagraphAtIndex:()NSMutableAttributedStringKitAdditions
{
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;

  v5 = (void *)objc_msgSend(a1, "mutableString");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = 0;
  v18 = 0;
  v16 = 0;
  v7 = _NSBidiEmbeddingAndOverrideCharSet();
  objc_msgSend(v5, "getParagraphStart:end:contentsEnd:forRange:", &v18, &v16, &v17, a3, 0);
  v8 = v17;
  v9 = v18;
  if (v17 > v18)
  {
    v10 = objc_msgSend(v5, "characterAtIndex:", v18);
    v9 = v18;
    if ((v10 & 0xFFFE) == 0x200E)
    {
      objc_msgSend(a1, "setBaseWritingDirection:range:", v10 == 8207, v18, v16 - v18);
      objc_msgSend(v5, "deleteCharactersInRange:", v18, 1);
      v9 = v18;
      v8 = v17 - 1;
      --v16;
      --v17;
    }
    else
    {
      v8 = v17;
    }
  }
  if (v9 < v8)
  {
    do
    {
      v11 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:range:", v7, 0, v9, v8 - v9);
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        v12 = v17;
      else
        v12 = v11;
      if (v12 > v9)
      {
        if (objc_msgSend(v6, "count"))
          objc_msgSend(a1, "addAttribute:value:range:", CFSTR("NSWritingDirection"), objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v6), v9, v12 - v9);
        else
          objc_msgSend(a1, "removeAttribute:range:", CFSTR("NSWritingDirection"), v9, v12 - v9);
      }
      v8 = v17;
      if (v12 >= v17)
        break;
      v9 = v12;
      switch(objc_msgSend(v5, "characterAtIndex:", v12))
      {
        case 0x202Au:
          v13 = (void *)MEMORY[0x1E0CB37E8];
          v14 = 0;
          goto LABEL_21;
        case 0x202Bu:
          v13 = (void *)MEMORY[0x1E0CB37E8];
          v14 = 1;
          goto LABEL_21;
        case 0x202Cu:
          if (objc_msgSend(v6, "count"))
            objc_msgSend(v6, "removeLastObject");
          break;
        case 0x202Du:
          v13 = (void *)MEMORY[0x1E0CB37E8];
          v14 = 2;
          goto LABEL_21;
        case 0x202Eu:
          v13 = (void *)MEMORY[0x1E0CB37E8];
          v14 = 3;
LABEL_21:
          objc_msgSend(v6, "addObject:", objc_msgSend(v13, "numberWithUnsignedInteger:", v14));
          break;
        default:
          break;
      }
      objc_msgSend(v5, "deleteCharactersInRange:", v12, 1);
      v8 = v17 - 1;
      --v16;
      v17 = v8;
    }
    while (v12 < v8);
  }
  if (v16 > v8)
    objc_msgSend(a1, "removeAttribute:range:", CFSTR("NSWritingDirection"));
  return v18;
}

- (uint64_t)convertBidiControlCharactersToWritingDirection
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(a1, "beginEditing");
  if (objc_msgSend(a1, "length"))
  {
    v2 = 0;
    do
    {
      v3 = objc_msgSend(a1, "convertBidiControlCharactersToWritingDirectionForParagraphAtIndex:", v2);
      v2 = v3 + v4;
    }
    while (v3 + v4 < (unint64_t)objc_msgSend(a1, "length"));
  }
  return objc_msgSend(a1, "endEditing");
}

@end
