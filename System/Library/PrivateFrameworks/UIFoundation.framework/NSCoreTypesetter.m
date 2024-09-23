@implementation NSCoreTypesetter

- (int)_NSFastDrawString:(id)a3 length:(unint64_t)a4 attributes:(id)a5 paragraphStyle:(id)a6 typesetterBehavior:(int64_t)a7 lineBreakMode:(int64_t)a8 rect:(CGRect)a9 padding:(double)a10 graphicsContext:(id)a11 baselineRendering:(BOOL)a12 usesFontLeading:(BOOL)a13 usesScreenFont:(BOOL)a14 scrollable:(BOOL)a15 syncAlignment:(BOOL)a16 mirrored:(BOOL)a17 boundingRectPointer:(CGRect *)a18 baselineOffsetPointer:(double *)a19 drawingContext:(id)a20
{
  _BYTE *v20;
  uint64_t v21;
  NSParagraphStyle *v22;
  NSParagraphStyle *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  __CFString *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  CGRect *v52;
  uint64_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGSize v65;
  uint64_t v66;
  void *v67;
  double *v68;
  uint64_t v69;
  double *v70;
  double v71;
  double *v72;
  double v73;
  CGContext *v75;
  int v76;
  int v77;
  void *v78;
  double v79;
  unint64_t v80;
  double v81;
  double v82;
  char v83;
  double v84;
  double v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  float v89;
  _BOOL4 v90;
  double v91;
  double v92;
  double v93;
  void *v94;
  int v95;
  double v96;
  double v97;
  double v98;
  NSParagraphStyle *v99;
  unint64_t v100;
  unint64_t v101;
  uint64_t v102;
  double v103;
  const __CFString *CharactersPtr;
  const char *CStringPtr;
  uint64_t v106;
  _OWORD *v107;
  CGGlyph *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  _OWORD *v116;
  UniChar v117;
  _OWORD *v118;
  uint64_t v119;
  uint64_t v121;
  CGGlyph *v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  unsigned int v132;
  BOOL v133;
  unint64_t v134;
  uint64_t v135;
  uint64_t v136;
  BOOL v137;
  BOOL v138;
  int IsLongCharacterMember;
  BOOL v140;
  BOOL v141;
  char v142;
  char v143;
  unsigned int v144;
  uint64_t v145;
  _BOOL4 v146;
  int IsCharacterMember;
  CGGlyph *v148;
  uint64_t v149;
  char *v150;
  char *v151;
  unint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  unint64_t v160;
  unint64_t v161;
  uint64_t v162;
  uint64_t v163;
  CFIndex v164;
  uint64_t v165;
  const UniChar *v166;
  _QWORD *v167;
  unsigned __int16 v168;
  uint64_t v169;
  uint64_t v170;
  int v171;
  uint64_t v172;
  CGGlyph *v173;
  CGGlyph *v174;
  uint64_t v175;
  uint64_t v176;
  unint64_t v177;
  uint64_t v178;
  uint64_t v179;
  UniChar *v180;
  uint64_t v181;
  CFIndex v182;
  uint64_t v183;
  unint64_t v184;
  uint64_t v185;
  CFRange v186;
  uint64_t v187;
  UniChar *v188;
  CFRange v189;
  char *v190;
  UniChar v191;
  uint64_t v192;
  CFIndex v193;
  CFIndex v194;
  CGGlyph *v195;
  double v196;
  double v197;
  double v198;
  BOOL v199;
  char v200;
  double v201;
  double v202;
  double v203;
  void *v204;
  objc_class *v205;
  char v206;
  double v207;
  double *v208;
  uint64_t v209;
  double v210;
  double v212;
  double v213;
  double v214;
  double v215;
  double v217;
  _BOOL4 v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  double v222;
  double v223;
  double v224;
  void *v225;
  double v226;
  double v227;
  double v228;
  double v229;
  double v230;
  double v231;
  NSParagraphStyle *v232;
  double v233;
  double v234;
  double v235;
  double v236;
  CGGlyph *v237;
  double v238;
  double v239;
  unint64_t v240;
  CGGlyph *v241;
  double v242;
  CGGlyph *v243;
  size_t v244;
  void *v245;
  _NSCoreTypesetterLayoutCache *v246;
  uint64_t v247;
  uint64_t v248;
  _OWORD *v249;
  uint64_t v250;
  CTFontRef font;
  uint64_t v252;
  uint64_t v253;
  __int16 v254;
  __int16 v255;
  uint64_t v256;
  unint64_t v257;
  _BOOL4 v258;
  CGGlyph *glyphs;
  uint64_t v260;
  uint64_t v261;
  _BOOL4 v262;
  double v263;
  uint64_t v264;
  unint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  NSParagraphStyle *v269;
  NSParagraphStyle *v270;
  uint64_t v271;
  uint64_t v272;
  unint64_t v273;
  unint64_t v274;
  double v275;
  unint64_t v276;
  uint64_t v277;
  uint64_t v278;
  __CFString *theString;
  void *v280;
  uint64_t v281;
  void *v282;
  _QWORD v283[5];
  _QWORD v284[10];
  BOOL v285;
  CFCharacterSetRef theSet[2];
  __int128 v287;
  UniChar buffer[8];
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  CFStringRef v296[2];
  __int128 v297;
  __int128 v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  void *v304;
  double v305;
  double *v306;
  _QWORD *v307;
  uint64_t v308;
  _WORD v309[512];
  _QWORD v310[1024];
  _QWORD v311[130];
  CFRange v312;
  CFRange v313;
  CGRect v314;

  v20 = (_BYTE *)MEMORY[0x1E0C80A78](self, a2, a3, a4, a5, a6, a7, a8, (__n128)a9.origin, *(__n128 *)&a9.origin.y, (__n128)a9.size, *(__n128 *)&a9.size.height, a10);
  v281 = v21;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  theString = v28;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v41 = v20;
  v311[128] = *MEMORY[0x1E0C80C00];
  v42 = objc_msgSend(v20, "laidOutLineFragment");
  v43 = objc_msgSend(v25, "count");
  v278 = objc_msgSend(v41, "applicationFrameworkContext");
  v44 = objc_msgSend(v25, "objectForKey:", CFSTR("NSColor"));
  v45 = (void *)objc_msgSend(v25, "objectForKey:", CFSTR("NSShadow"));
  v46 = v45;
  v280 = (void *)v44;
  v47 = 1;
  if (v44)
    v47 = 2;
  if (v45)
    v48 = v47;
  else
    v48 = v44 != 0;
  if (objc_msgSend(v45, "shadowColor"))
    v49 = v46;
  else
    v49 = 0;
  v282 = v49;
  v50 = (void *)objc_msgSend(a20, "layout");
  v308 = 0;
  v307 = 0;
  v306 = 0;
  v305 = 0.0;
  v304 = 0;
  v303 = 0;
  if (-[_NSCoreTypesetterLayoutCache getCount:glyphs:advances:elasticAdvances:resolvedFont:textAlignment:]((uint64_t)v50, &v308, &v307, &v306, &v305, (CFTypeRef *)&v304, &v303))
  {
    if (v42)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v40, v41, CFSTR("NSCoreTypesetter.m"), 1314, CFSTR("NSStringDrawingContext not supported when generating NSTextLineFragments"));
    if (!v307 || !v306 || !v304)
      -[NSCoreTypesetter _NSFastDrawString:length:attributes:paragraphStyle:typesetterBehavior:lineBreakMode:rect:padding:graphicsContext:baselineRendering:usesFontLeading:usesScreenFont:scrollable:syncAlignment:mirrored:boundingRectPointer:baselineOffsetPointer:drawingContext:].cold.2();
    v51 = 0;
    goto LABEL_16;
  }
  v277 = v42;
  if (objc_msgSend(v25, "objectForKey:", *MEMORY[0x1E0CA80D0]))
    return 0;
  v66 = objc_msgSend(v25, "objectForKey:", CFSTR("NSFont"));
  if (v66)
  {
    v67 = (void *)v66;
    ++v48;
  }
  else
  {
    v67 = (void *)NSDefaultFont();
  }
  objc_msgSend(v67, "pointSize");
  if (v85 < 8.0)
    return 0;
  v86 = objc_msgSend(v25, "objectForKey:", CFSTR("NSOriginalFont"));
  if (v86)
  {
    if (v67 != (void *)v86)
      return 0;
    ++v48;
  }
  v274 = v27;
  if (v278 == 2 && a14)
    v67 = (void *)objc_msgSend(v67, "screenFontWithRenderingMode:", 0);
  v87 = objc_msgSend(v25, "objectForKey:", CFSTR("NSKern"));
  if (!v87 || (v88 = (void *)v87, v87 == objc_msgSend(MEMORY[0x1E0C99E38], "null")))
  {
    v90 = 0;
  }
  else
  {
    objc_msgSend(v88, "floatValue");
    v90 = v89 == 0.0;
    if (v89 == 0.0)
      ++v48;
  }
  v94 = (void *)objc_msgSend(v25, "objectForKey:", CFSTR("NSLigature"));
  if (v94)
  {
    v95 = objc_msgSend(v94, "intValue");
    v262 = v95 == 0;
    if (!v95)
      ++v48;
  }
  else
  {
    v262 = 0;
  }
  v302 = 0;
  v99 = v23;
  if (!v23)
    v99 = +[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle");
  if (!-[NSParagraphStyle _isSuitableForFastStringDrawingWithAlignment:mirrorsTextAlignment:lineBreakMode:tighteningFactorForTruncation:](v99, "_isSuitableForFastStringDrawingWithAlignment:mirrorsTextAlignment:lineBreakMode:tighteningFactorForTruncation:", &v302, a17, 0, 0))return 0;
  v258 = v90;
  v270 = v23;
  if (objc_msgSend(v25, "objectForKey:", CFSTR("NSParagraphStyle")))
    v100 = v48 + 1;
  else
    v100 = v48;
  if (a16
    && (unint64_t)(v302 - 3) <= 1
    && -[NSParagraphStyle baseWritingDirection](v23, "baseWritingDirection") == NSWritingDirectionNatural)
  {
    v302 = 2 * (-[NSParagraphStyle horizontalAlignment](v23, "horizontalAlignment") == 1);
  }
  v101 = v274;
  if (objc_msgSend(v41, "laidOutLineFragment")
    && objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("NSBackgroundColor")))
  {
    ++v100;
  }
  if (objc_msgSend(v25, "objectForKey:", *MEMORY[0x1E0CB2CE0]))
    ++v100;
  if (v100 < v43)
  {
    v102 = 0;
    v310[0] = NSCursorAttributeName;
    v310[1] = NSToolTipAttributeName;
    v310[2] = NSMarkedClauseSegmentAttributeName;
    do
    {
      if (objc_msgSend(v25, "objectForKey:", v310[v102]))
      {
        if (++v100 >= v43)
          break;
      }
      ++v102;
    }
    while (v102 != 3);
    v23 = v270;
  }
  v301 = 0;
  v300 = 0;
  if (v43 != v100 || !objc_msgSend(v67, "_getLatin1Glyphs:advanceWidths:", &v301, &v300))
    return 0;
  v297 = 0u;
  v295 = 0u;
  v293 = 0u;
  v294 = 0u;
  v291 = 0u;
  v292 = 0u;
  v289 = 0u;
  v290 = 0u;
  v287 = 0u;
  *(_OWORD *)buffer = 0u;
  *(_OWORD *)theSet = 0u;
  v296[0] = theString;
  v299 = 0;
  v298 = v274;
  CharactersPtr = (const __CFString *)CFStringGetCharactersPtr(theString);
  CStringPtr = 0;
  v296[1] = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(theString, 0x600u);
  v250 = 0;
  font = (CTFontRef)v67;
  v106 = 0;
  v276 = 0;
  v299 = 0;
  v107 = v310;
  v108 = (CGGlyph *)v311;
  *(_QWORD *)&v297 = CStringPtr;
  *((_QWORD *)&v298 + 1) = 0;
  while (2)
  {
    v109 = v298;
    if ((uint64_t)v298 <= v106)
      break;
    v110 = -v106;
    v111 = 2 * v106 + 2;
    v112 = v106 + 1;
    v113 = ~v106;
    v114 = v106 + 65;
    v115 = v106 + 64;
    v116 = (_OWORD *)MEMORY[0x1E0CB3440];
    while (1)
    {
      if (v296[1])
      {
        v117 = *((_WORD *)&v296[1]->isa + *((_QWORD *)&v297 + 1) + v106);
      }
      else if ((_QWORD)v297)
      {
        v117 = *(char *)(v297 + *((_QWORD *)&v297 + 1) + v106);
      }
      else
      {
        v118 = v107;
        v119 = *((_QWORD *)&v298 + 1);
        if (v299 <= v106 || *((_QWORD *)&v298 + 1) > v106)
        {
          v121 = v106 - 4;
          if ((unint64_t)v106 < 4)
            v121 = 0;
          if (v121 + 64 < v109)
            v109 = v121 + 64;
          *((_QWORD *)&v298 + 1) = v121;
          v299 = v109;
          v271 = v106;
          v252 = v110;
          v260 = v115;
          v312.location = *((_QWORD *)&v297 + 1) + v121;
          v312.length = v109 - v121;
          v122 = v108;
          CFStringGetCharacters(v296[0], v312, buffer);
          v115 = v260;
          v110 = v252;
          v106 = v271;
          v108 = v122;
          v119 = *((_QWORD *)&v298 + 1);
        }
        v117 = buffer[v106 - v119];
        v107 = v118;
        v116 = (_OWORD *)MEMORY[0x1E0CB3440];
      }
      if (!v117)
      {
LABEL_339:
        v23 = v270;
        v101 = v274;
        v67 = font;
        goto LABEL_340;
      }
      if (v117 > 0xFFu)
      {
        v249 = v107;
        glyphs = v108;
        v261 = v115;
        v253 = v110;
        if (!v250)
        {
          v123 = v106;
          v250 = -[__CTFont coveredCharacterSet](font, "coveredCharacterSet");
          if (!v250)
            return 0;
          CFCharacterSetInitInlineBuffer();
          v106 = v123;
          v110 = v253;
        }
        v124 = 0;
        v125 = 0;
        v126 = -16;
        v127 = 1;
        while (1)
        {
          v128 = v125;
          v129 = v126;
          v272 = v124;
          v130 = v112 >= 4 ? 4 : v112;
          v131 = v117;
          v132 = (uint64_t)theSet[1] & 4;
          v133 = HIDWORD(theSet[1]) <= v117 && v287 > v117;
          v266 = v127;
          v268 = v129;
          v264 = v111;
          v256 = v130;
          if (v133)
          {
            if (((uint64_t)theSet[1] & 2) != 0)
            {
              v134 = v125;
              v135 = v110;
              v136 = v106;
              v254 = v131;
              IsLongCharacterMember = CFCharacterSetIsLongCharacterMember(theSet[0], v131);
              LOWORD(v131) = v254;
              if (!IsLongCharacterMember)
                return 0;
            }
            else if (*((_QWORD *)&v287 + 1))
            {
              if (((uint64_t)theSet[1] & 1) != 0)
              {
                v144 = v132 >> 2;
                v145 = *(unsigned __int8 *)(*((_QWORD *)&v287 + 1) + ((unint64_t)v117 >> 8));
                if (*(_BYTE *)(*((_QWORD *)&v287 + 1) + ((unint64_t)v117 >> 8)))
                {
                  v134 = v128;
                  v135 = v110;
                  v136 = v106;
                  if ((_DWORD)v145 == 255)
                  {
                    v144 = v132 == 0;
                  }
                  else
                  {
                    v146 = v132 == 0;
                    if (((*(unsigned __int8 *)(*((_QWORD *)&v287 + 1) + 32 * v145 + (v131 >> 3) + 224) >> (v131 & 7)) & 1) != 0)
                      v144 = v146;
                  }
                }
                else
                {
                  v134 = v128;
                  v135 = v110;
                  v136 = v106;
                }
                if (!v144)
                  return 0;
              }
              else
              {
                v134 = v125;
                v135 = v110;
                v136 = v106;
                v137 = v132 != 0;
                v138 = v132 == 0;
                if (((*(unsigned __int8 *)(*((_QWORD *)&v287 + 1) + (v131 >> 3)) >> (v131 & 7)) & 1) != 0)
                  v137 = v138;
                if (!v137)
                  return 0;
              }
            }
            else
            {
              v134 = v125;
              v135 = v110;
              v136 = v106;
              v140 = v132 == 0;
              v141 = v132 != 0;
              v142 = v140;
              if (((uint64_t)theSet[1] & 1) != 0)
                v143 = v141;
              else
                v143 = v142;
              if ((v143 & 1) == 0)
                return 0;
            }
          }
          else
          {
            v134 = v125;
            v135 = v110;
            v136 = v106;
            if (((uint64_t)theSet[1] & 4) == 0)
              return 0;
          }
          if (_NSFastDrawString_length_attributes_paragraphStyle_typesetterBehavior_lineBreakMode_rect_padding_graphicsContext_baselineRendering_usesFontLeading_usesScreenFont_scrollable_syncAlignment_mirrored_boundingRectPointer_baselineOffsetPointer_drawingContext__once != -1)
          {
            v255 = v131;
            dispatch_once(&_NSFastDrawString_length_attributes_paragraphStyle_typesetterBehavior_lineBreakMode_rect_padding_graphicsContext_baselineRendering_usesFontLeading_usesScreenFont_scrollable_syncAlignment_mirrored_boundingRectPointer_baselineOffsetPointer_drawingContext__once, &__block_literal_global_56_0);
            LOWORD(v131) = v255;
          }
          IsCharacterMember = CFCharacterSetIsCharacterMember((CFCharacterSetRef)_NSFastDrawString_length_attributes_paragraphStyle_typesetterBehavior_lineBreakMode_rect_padding_graphicsContext_baselineRendering_usesFontLeading_usesScreenFont_scrollable_syncAlignment_mirrored_boundingRectPointer_baselineOffsetPointer_drawingContext__whitespaceCharacterSet, v131);
          v148 = glyphs;
          v149 = v272;
          v150 = (char *)glyphs + v272;
          if (v276)
            v150 = (char *)v276;
          v151 = IsCharacterMember ? v150 : 0;
          v106 = v136;
          v152 = v134;
          v153 = v136 + v134 + 1;
          v154 = v298;
          v276 = (unint64_t)v151;
          if ((uint64_t)v298 <= v153)
            break;
          v155 = v266;
          v156 = v268;
          v110 = v135;
          v157 = v261;
          v158 = v264;
          if (v296[1])
          {
            v117 = *((_WORD *)&v296[1]->isa + v136 + v134 + *((_QWORD *)&v297 + 1) + 1);
          }
          else if ((_QWORD)v297)
          {
            v117 = *(char *)(v297 + *((_QWORD *)&v297 + 1) + v136 + v134 + 1);
          }
          else
          {
            if (v299 <= v153 || (v159 = *((_QWORD *)&v298 + 1), *((uint64_t *)&v298 + 1) > v153))
            {
              v160 = v134 + v136 - v256;
              v161 = v160 + 1;
              v162 = v160 + 65;
              if (v162 >= (uint64_t)v298)
                v162 = v298;
              *((_QWORD *)&v298 + 1) = v161;
              v299 = v162;
              if ((uint64_t)v298 >= v114 - v256)
                v154 = v114 - v256;
              v313.length = v154 + v256 + v113;
              v313.location = v136 + v134 + 1 - v256 + *((_QWORD *)&v297 + 1);
              CFStringGetCharacters(v296[0], v313, buffer);
              v152 = v134;
              v157 = v261;
              v110 = v253;
              v149 = v272;
              v155 = v266;
              v156 = v268;
              v106 = v136;
              v158 = v264;
              v159 = *((_QWORD *)&v298 + 1);
            }
            v117 = *(UniChar *)((char *)buffer + v158 + -2 * v159);
          }
          v126 = v156 - 16;
          v124 = v149 + 2;
          v127 = v155 + 1;
          v111 = v158 + 2;
          ++v112;
          --v113;
          ++v114;
          v125 = v152 + 1;
          if (v117 <= 0xFFu)
          {
            v154 = v298;
            v148 = glyphs;
            goto LABEL_201;
          }
        }
        v157 = v261;
        v158 = v264;
        v155 = v266;
LABEL_201:
        v163 = v155;
        v164 = v152 + 1;
        v165 = v152 + 1 + v106;
        v67 = font;
        if (v165 <= v154)
        {
          v23 = v270;
          if (v296[1])
          {
            v166 = (const UniChar *)v296[1] + *((_QWORD *)&v297 + 1) + v106;
LABEL_255:
            v193 = v164;
            v194 = v164;
            v195 = v148;
            CTFontGetGlyphsForCharacters(font, v166, v148, v193);
            -[__CTFont getAdvancements:forCGGlyphs:count:](font, "getAdvancements:forCGGlyphs:count:", v249, v195, v194);
            v108 = (CGGlyph *)((char *)v195 + v272 + 2);
            v107 = (_OWORD *)((char *)v249 - v268);
            v101 = v274;
            goto LABEL_256;
          }
          v175 = *((_QWORD *)&v298 + 1);
          v176 = v299;
          if (v152 <= 0x3F)
          {
            v23 = v270;
            if (v165 > v299 || v106 < *((uint64_t *)&v298 + 1))
            {
              v184 = v152 + 1;
              v185 = v106 + 64;
              if (v106 + 64 >= v154)
                v185 = v154;
              *((_QWORD *)&v298 + 1) = v106;
              v299 = v185;
              v186.length = v185 - v106;
              if ((_QWORD)v297)
              {
                if (v186.length)
                {
                  v187 = v297 + *((_QWORD *)&v297 + 1);
                  if (v154 >= v157)
                    v154 = v157;
                  v188 = buffer;
                  do
                  {
                    *v188++ = *(char *)(v187 + v106);
                    ++v187;
                    --v154;
                  }
                  while (v106 != v154);
                }
              }
              else
              {
                v186.location = *((_QWORD *)&v297 + 1) + v106;
                v192 = v106;
                CFStringGetCharacters(v296[0], v186, buffer);
                v106 = v192;
                v164 = v184;
              }
            }
            v166 = &buffer[v106 - *((_QWORD *)&v298 + 1)];
            goto LABEL_254;
          }
        }
        else
        {
          v23 = v270;
          if (v296[1])
          {
            v166 = v309;
            __memmove_chk();
LABEL_254:
            v148 = glyphs;
            goto LABEL_255;
          }
          v175 = *((_QWORD *)&v298 + 1);
          v176 = v299;
        }
        v257 = v152 + 1;
        if (v106 < v175 || v176 <= v106)
        {
          v180 = v309;
          if (v165 <= v175 || v165 >= v176)
          {
            v182 = v152 + 1;
            v23 = v270;
            goto LABEL_245;
          }
          v182 = v175 - v106;
          v180 = v309;
          v183 = v106;
          memmove(&v309[v175 - v106], buffer, v158 - 2 * v175);
          v106 = v183;
        }
        else
        {
          if (v164 >= v176 - v106)
            v177 = v176 - v106;
          else
            v177 = v152 + 1;
          v178 = v106;
          v265 = v152;
          __memmove_chk();
          v179 = v178;
          v180 = &v309[v177];
          v106 = v177 + v179;
          v181 = v176 + v253;
          if (v163 < v176 + v253)
            v181 = v163;
          v182 = v265 - v181 + 1;
        }
        v23 = v270;
        v148 = glyphs;
        if (v182 < 1)
        {
LABEL_251:
          v166 = v309;
          v164 = v257;
          goto LABEL_255;
        }
LABEL_245:
        v189.location = *((_QWORD *)&v297 + 1) + v106;
        if ((_QWORD)v297)
        {
          if (v182)
          {
            v190 = (char *)(v297 + v189.location);
            do
            {
              v191 = *v190++;
              *v180++ = v191;
              --v182;
            }
            while (v182);
          }
        }
        else
        {
          v189.length = v182;
          CFStringGetCharacters(v296[0], v189, v180);
          v148 = glyphs;
        }
        goto LABEL_251;
      }
      if ((v117 & 0xFF60) != 0 && v117 != 173 && v117 != 127)
        break;
      if (v277)
      {
        *v107++ = *v116;
        *v108++ = -1;
      }
      ++v106;
      v109 = v298;
      --v110;
      v111 += 2;
      ++v112;
      --v113;
      ++v114;
      ++v115;
      if ((uint64_t)v298 <= v106)
        goto LABEL_339;
    }
    v167 = v107;
    if (v117 == 160)
      v168 = 32;
    else
      v168 = v117;
    v169 = -64;
    if ((v168 & 0xFF80) == 0)
      v169 = -32;
    v170 = v169 + v168;
    v171 = *(unsigned __int16 *)(v301 + 2 * v170);
    *v108 = v171;
    v23 = v270;
    v101 = v274;
    v67 = font;
    if (!v171)
      return 0;
    v172 = *(_QWORD *)(v300 + 8 * v170);
    v173 = (CGGlyph *)v276;
    if (!v276)
      v173 = v108;
    *v167 = v172;
    v167[1] = 0;
    if (v168 == 32)
      v174 = v173;
    else
      v174 = 0;
    v276 = (unint64_t)v174;
    v165 = v106 + 1;
    ++v108;
    v107 = v167 + 2;
LABEL_256:
    v106 = v165;
    if ((v165 & 0x8000000000000000) == 0)
      continue;
    break;
  }
LABEL_340:
  if (!v258 || !v262)
  {
    v237 = v108;
    CTFontTransformGlyphsWithLanguage();
    v108 = v237;
    if (v238 != 0.0)
      return 0;
  }
  v51 = 0;
  v239 = 0.0;
  if (v276)
  {
    v240 = v101;
    if (v276 < (unint64_t)v108)
    {
      v51 = (uint64_t)((uint64_t)v108 - v276) >> 1;
      v241 = v108;
      objc_msgSend(v67, "_totalAdvancementForNativeGlyphs:count:", v276, v51);
      v108 = v241;
      v239 = v242;
    }
  }
  else
  {
    v240 = v101;
  }
  if (v276)
    v243 = (CGGlyph *)v276;
  else
    v243 = v108;
  v244 = ((char *)v243 - (char *)v311) >> 1;
  v308 = v244;
  v307 = v311;
  v306 = (double *)v310;
  v305 = v239;
  v304 = v67;
  v245 = (void *)v302;
  v303 = v302;
  if (objc_msgSend(a20, "cachesLayout"))
  {
    if (v50)
    {
      v246 = v50;
    }
    else
    {
      v246 = objc_alloc_init(_NSCoreTypesetterLayoutCache);
      objc_msgSend(a20, "setLayout:", v246);
    }
    -[_NSCoreTypesetterLayoutCache setCount:glyphs:advances:elasticAdvances:resolvedFont:textAlignment:]((void **)&v246->super.isa, v244, v311, v310, v67, v245, v239);

  }
  v27 = v240;
  v42 = v277;
LABEL_16:
  v52 = a18;
  v53 = objc_msgSend(v41, "isBeginningOfDocument") ^ 1;
  LOBYTE(v247) = objc_msgSend(v41, "isBeginningOfDocument") ^ 1;
  objc_msgSend(v41, "_getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:", 0, 0, v25, 0, v53, 0, v247);
  v55 = v54;
  v275 = v56;
  v58 = v57;
  if ((objc_msgSend(v41, "isSimpleRectangularTextContainerForStartingCharacterAtIndex:", 0) & 1) == 0)
  {
    objc_msgSend(v41, "lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:", 0, 0, 0, v38, v36 + v58, 10000000.0, v55);
    v38 = v59;
    v36 = v60;
    v62 = v61;
    v32 = v63;
    objc_msgSend(v41, "lineFragmentPadding");
    v34 = v62 + v64 * -2.0;
    v58 = 0.0;
  }
  if (v42 && v32 > 0.0 && (objc_msgSend(v41, "enforcesMinimumTextLineFragment") & 1) == 0 && v55 > v32)
  {
    v65 = *(CGSize *)(MEMORY[0x1E0CB3438] + 16);
    a18->origin = (CGPoint)*MEMORY[0x1E0CB3438];
    a18->size = v65;
    return 2;
  }
  v273 = v27;
  v269 = v23;
  v68 = v306;
  v69 = v308;
  v70 = &v306[2 * v308];
  v71 = 0.0;
  if (v308 < 1)
  {
    v72 = v306;
  }
  else
  {
    v72 = v306;
    if (v34 >= 0.0)
    {
      v72 = v306;
      do
      {
        v73 = *v72;
        v72 += 2;
        v71 = v71 + v73;
      }
      while (v72 < v70 && v71 <= v34);
    }
  }
  if (!a11)
  {
    if (v303 == 2)
    {
      v81 = v38 + v34 - v71;
      v80 = v273;
    }
    else
    {
      v80 = v273;
      if (v303 == 1)
        v81 = v38 + (v34 - v71) * 0.5;
      else
        v81 = v38;
    }
    goto LABEL_291;
  }
  v267 = v51;
  if (v42)
    -[NSCoreTypesetter _NSFastDrawString:length:attributes:paragraphStyle:typesetterBehavior:lineBreakMode:rect:padding:graphicsContext:baselineRendering:usesFontLeading:usesScreenFont:scrollable:syncAlignment:mirrored:boundingRectPointer:baselineOffsetPointer:drawingContext:].cold.1();
  v75 = (CGContext *)objc_msgSend(a11, "CGContext");
  v76 = objc_msgSend(a11, "isFlipped");
  v77 = v76;
  if (v34 <= 0.0)
  {
    v263 = v58;
    v82 = v55;
    v83 = 0;
    v84 = v38;
    v78 = v282;
    goto LABEL_108;
  }
  v78 = v282;
  if (a15 && v303)
  {
    while (v72 < v70)
    {
      v79 = *v72;
      v72 += 2;
      v71 = v71 + v79;
    }
    v92 = 40000.0 - v71;
    if (v303 == 1)
    {
      v92 = v92 * 0.5;
      if (v71 + v305 <= v34)
      {
        v263 = v58;
        v82 = v55;
        v83 = 0;
        v93 = (v34 - (v71 + v305)) * 0.5;
        goto LABEL_105;
      }
LABEL_80:
      if (v281 == 2)
      {
        v263 = v58;
        v82 = v55;
        v69 = ((char *)v72 - (char *)v68) >> 4;
        v98 = -v92;
        v83 = 1;
        goto LABEL_106;
      }
      return 1;
    }
    if (v71 > v34)
      goto LABEL_80;
    v263 = v58;
    v82 = v55;
    v83 = 0;
    v93 = v34 - v71;
LABEL_105:
    v98 = v93 - v92;
LABEL_106:
    v103 = v92 + floor(v98);
LABEL_107:
    v84 = v38 + v103;
    goto LABEL_108;
  }
  if (v71 <= v34)
  {
    v263 = v58;
    v82 = v55;
    v96 = v34 - v71;
    if (v303 == 1)
    {
      v83 = 0;
      v103 = v96 * 0.5;
      goto LABEL_107;
    }
    v97 = v38 + v96;
    if (v303 == 2)
      v84 = v97;
    else
      v84 = v38;
    v83 = 0;
LABEL_108:
    if (!a12)
      goto LABEL_260;
    v91 = v36;
    if ((v83 & 1) == 0)
    {
      v91 = v36;
      goto LABEL_271;
    }
    goto LABEL_275;
  }
  if (v281 != 2)
    return 1;
  v263 = v58;
  v82 = v55;
  v69 = ((char *)v72 - (char *)v68) >> 4;
  if (a12)
  {
    v91 = v36;
    v84 = v38;
    goto LABEL_275;
  }
  v83 = 1;
  v84 = v38;
LABEL_260:
  if (v32 > 0.0)
    v196 = v32;
  else
    v196 = v82;
  v197 = v196 - v275;
  if (v76)
    v197 = v275;
  v198 = v32;
  v199 = v82 <= v32 || v32 <= 0.0;
  v91 = v36 + v197;
  if (!v199 || (v83 & 1) != 0)
  {
    if (v198 > 0.0)
    {
LABEL_278:
      CGContextSaveGState(v75);
      v314.origin.x = v38 - v30;
      v314.origin.y = v36;
      v314.size.width = v34 + v30 * 2.0;
      v314.size.height = v198;
      CGContextClipToRect(v75, v314);
      v200 = 1;
      goto LABEL_279;
    }
LABEL_275:
    objc_msgSend(v304, "boundingRectForFont");
    v198 = v202;
    v203 = -(v201 + v202);
    if (!v77)
      v203 = v201;
    v36 = v36 + v203;
    goto LABEL_278;
  }
LABEL_271:
  if (v78)
    CGContextSaveGState(v75);
  v200 = 0;
LABEL_279:
  v81 = v84;
  CGContextGetFontRenderingStyle();
  objc_msgSend(v304, "applyToGraphicsContext:", a11);
  v204 = v280;
  v55 = v82;
  v58 = v263;
  if (!v280)
  {
    if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery](NSTextGraphicsContextProvider, "textGraphicsContextProviderClassRespondsToColorQuery"))
    {
      v205 = (objc_class *)-[objc_class colorClassForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "colorClassForApplicationFrameworkContext:", v278);
    }
    else
    {
      v205 = +[NSTextGraphicsContextProvider __defaultColorClass](NSTextGraphicsContextProvider, "__defaultColorClass");
    }
    v204 = (void *)-[objc_class blackColor](v205, "blackColor");
    v78 = v282;
  }
  objc_msgSend(v204, "set");
  CGContextSetCharacterSpacing(v75, 0.0);
  if (v78)
    objc_msgSend(v78, "applyToGraphicsContext:", a11);
  CGContextSetTextPosition(v75, v81, v91);
  CTFontDrawGlyphsWithAdvances();
  CGContextSetFontRenderingStyle();
  v206 = v200 ^ 1;
  if (v78)
    v206 = 0;
  if ((v206 & 1) == 0)
    CGContextRestoreGState(v75);
  v80 = v273;
  v42 = 0;
  v52 = a18;
  v51 = v267;
LABEL_291:
  if ((unint64_t)v52 | v42)
  {
    v207 = 0.0;
    if (v69)
    {
      v208 = v68;
      v209 = v69;
      do
      {
        v210 = *v208;
        v208 += 2;
        v207 = v207 + v210;
        --v209;
      }
      while (v209);
    }
    if (v281 != 2 && !a11 && v34 != 0.0 && v207 > v34 + 0.001)
      return 1;
    v212 = 0.0;
    if (v41[57])
    {
      objc_msgSend(v41, "lineFragmentPadding");
      v212 = v213;
    }
    if (a12)
      v214 = v275 - v55;
    else
      v214 = v58;
    v215 = v207 + v305;
    if (v207 + v305 <= v34 || v34 <= 0.0)
      v217 = v207 + v305;
    else
      v217 = v34;
    if (v42)
    {
      if (v41[50])
        v218 = -[__CFString length](theString, "length", v215) > v80;
      else
        v218 = 0;
      v219 = -[__CFString length](theString, "length");
      v220 = objc_msgSend(v41, "applicationFrameworkContext");
      v221 = MEMORY[0x1E0C809B0];
      v284[0] = MEMORY[0x1E0C809B0];
      v284[1] = 3221225472;
      v284[2] = __273__NSCoreTypesetter__NSFastDrawString_length_attributes_paragraphStyle_typesetterBehavior_lineBreakMode_rect_padding_graphicsContext_baselineRendering_usesFontLeading_usesScreenFont_scrollable_syncAlignment_mirrored_boundingRectPointer_baselineOffsetPointer_drawingContext___block_invoke_2;
      v284[3] = &unk_1E26054F8;
      v284[6] = v68;
      v284[7] = v69;
      v284[8] = v51;
      v284[9] = v304;
      v284[4] = v41;
      v284[5] = v307;
      v285 = v218;
      __NSCoreTypesetterProcessTextLineFragment(0, (uint64_t)theString, (uint64_t)v25, 0, v219, v220, (uint64_t)v284, 0.0, v275, v81 + 0.0, v214, v217, v55, v212);
      if (v218)
      {
        v222 = *MEMORY[0x1E0CB3430];
        v223 = v34 * 0.5 + *MEMORY[0x1E0CB3430];
        if (v303 == 2)
          v222 = v34 + *MEMORY[0x1E0CB3430];
        if (v303 == 1)
          v224 = v34 * 0.5 + *MEMORY[0x1E0CB3430];
        else
          v224 = v222;
        v225 = (void *)objc_msgSend(v41, "_extraLineFragmentAttributes", v222, v223);
        v226 = 0.0;
        if (v269)
        {
          -[NSParagraphStyle paragraphSpacing](v269, "paragraphSpacing");
          v226 = v227;
        }
        if (objc_msgSend(v225, "count"))
        {
          LOBYTE(v248) = 0;
          objc_msgSend(v41, "_getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:", 0, 0, v225, 0, 0, 0, v248);
          v229 = v228;
          v231 = v230;
          v232 = (NSParagraphStyle *)objc_msgSend(v41, "_paragraphStyleFromAttributes:", v225);
        }
        else
        {
          v231 = 0.0;
          v229 = v55;
          v232 = v269;
        }
        v233 = v55 + v214;
        if (v232)
        {
          -[NSParagraphStyle lineSpacing](v232, "lineSpacing");
          v235 = v231 + v234;
          if (v234 >= 0.0)
            v235 = v231;
          if (v234 <= v231)
            v231 = v235;
          else
            v231 = v234;
          -[NSParagraphStyle paragraphSpacingBefore](v232, "paragraphSpacingBefore");
          v233 = v233 + v236;
        }
        v283[0] = v221;
        v283[1] = 3221225472;
        v283[2] = __273__NSCoreTypesetter__NSFastDrawString_length_attributes_paragraphStyle_typesetterBehavior_lineBreakMode_rect_padding_graphicsContext_baselineRendering_usesFontLeading_usesScreenFont_scrollable_syncAlignment_mirrored_boundingRectPointer_baselineOffsetPointer_drawingContext___block_invoke_3;
        v283[3] = &unk_1E2605468;
        v283[4] = v41;
        __NSCoreTypesetterProcessTextLineFragment(0, (uint64_t)theString, (uint64_t)v25, -[__CFString length](theString, "length"), 0, objc_msgSend(v41, "applicationFrameworkContext"), (uint64_t)v283, 0.0, v275, v224, v233 + v226 + v231, 0.0, v229, v212);
      }
    }
    else if (v52)
    {
      v52->origin.x = 0.0;
      v52->origin.y = v214;
      v52->size.width = v217;
      v52->size.height = v55;
    }
  }
  if (a19)
    *a19 = v275;
  return 2;
}

- (id)laidOutLineFragment
{
  return objc_getProperty(self, a2, 64, 1);
}

- (BOOL)isBeginningOfDocument
{
  return self->_beginningOfDocument;
}

+ (void)_minMaxPositionsForLineFragmentWithParagraphStyle:(id)a3 baseWidth:(double)a4 writingDirection:(int64_t)a5 isBeginningOfParagraph:(BOOL)a6 minPosition:(double *)a7 maxPosition:(double *)a8
{
  NSWritingDirection v10;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v10 = a5;
  if (a3)
  {
    if (a6)
      objc_msgSend(a3, "firstLineHeadIndent");
    else
      objc_msgSend(a3, "headIndent");
    v15 = v13;
    objc_msgSend(a3, "tailIndent");
    v14 = v16;
  }
  else
  {
    v14 = 0.0;
    v15 = 0.0;
  }
  if (v10 == NSWritingDirectionNatural)
    v10 = +[NSParagraphStyle defaultWritingDirectionForLanguage:](NSParagraphStyle, "defaultWritingDirectionForLanguage:", 0, a5, a6);
  v17 = 0.0;
  if (a4 >= 0.0)
    v18 = a4;
  else
    v18 = 0.0;
  v19 = -0.0;
  if (v14 <= 0.0)
    v19 = v18;
  v20 = v14 + v19;
  if (v20 <= v15)
    v20 = v18;
  v21 = v18 - v20;
  if (v10 == NSWritingDirectionRightToLeft)
    v20 = v18 - v15;
  else
    v21 = v15;
  if (v20 < 0.0)
    v20 = 0.0;
  if (v20 < v18)
    v18 = v20;
  if (v21 >= 0.0)
    v17 = v21;
  if (v17 >= v18)
    v17 = v18;
  *a7 = v17;
  *a8 = v18;
}

- (void)_NSFastDrawString:length:attributes:paragraphStyle:typesetterBehavior:lineBreakMode:rect:padding:graphicsContext:baselineRendering:usesFontLeading:usesScreenFont:scrollable:syncAlignment:mirrored:boundingRectPointer:baselineOffsetPointer:drawingContext:.cold.2()
{
  __assert_rtn("-[NSCoreTypesetter _NSFastDrawString:length:attributes:paragraphStyle:typesetterBehavior:lineBreakMode:rect:padding:graphicsContext:baselineRendering:usesFontLeading:usesScreenFont:scrollable:syncAlignment:mirrored:boundingRectPointer:baselineOffsetPointer:drawingContext:]", "NSCoreTypesetter.m", 1315, "glyphs != NULL && advances != NULL && resolvedFont != NULL");
}

- (CGRect)_stringDrawingCoreTextEngineWithOriginalString:(id)a3 rect:(CGRect)a4 padding:(double)a5 graphicsContext:(id)a6 forceClipping:(BOOL)a7 attributes:(id)a8 stringDrawingOptions:(int64_t)a9 drawingContext:(id)a10 stringDrawingInterface:(id *)a11
{
  double width;
  __CFString *v16;
  const __CFString *v17;
  double *v18;
  __int128 v19;
  BOOL v20;
  NSMutableArray *truncatedRanges;
  uint64_t v22;
  char v23;
  unint64_t v24;
  uint64_t v25;
  BOOL v26;
  BOOL v27;
  int v28;
  int v29;
  int v30;
  char v31;
  _BOOL4 v32;
  _BOOL4 v33;
  _NSCoreTypesetterLayoutCache *v34;
  _NSCoreTypesetterLayoutCache *v35;
  NSCoreTypesetterDelegate *v36;
  _NSTextAttachmentLayoutContext *v37;
  _NSTextAttachmentLayoutContext *v38;
  _BOOL8 v39;
  __CFString *v40;
  NSTextAnimationKeyframe *v41;
  uint64_t v42;
  __CFString *v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __CFString *v49;
  id v50;
  const void *BaseLineFromAttributedString;
  uint64_t v52;
  int v53;
  _BOOL4 v54;
  double v55;
  double v56;
  double v57;
  uint64_t v59;
  double v60;
  double v61;
  double v62;
  double v63;
  NSWritingDirection IsRightToLeft;
  const __CFDictionary *v65;
  BOOL v66;
  char v67;
  char v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  CGContext *v76;
  NSWritingDirection v77;
  double v78;
  double TypographicBounds;
  uint64_t v80;
  uint64_t v81;
  NSDictionary *v82;
  double v83;
  double v84;
  uint64_t v85;
  BOOL v86;
  NSParagraphStyle *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  BOOL v95;
  const char *CStringPtr;
  int v97;
  int v98;
  int v99;
  uint64_t v101;
  _BOOL4 v102;
  double v103;
  double v104;
  double v105;
  const __CTLine *v106;
  int v107;
  double v108;
  double v109;
  const __CTLine *JustifiedLine;
  unint64_t v111;
  CTLineRef v112;
  int v113;
  _BOOL4 v114;
  int v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  uint64_t v123;
  double v125;
  double v126;
  double v127;
  double v128;
  const __CTLine *v129;
  uint64_t v130;
  char v131;
  double v132;
  uint64_t v133;
  double v134;
  CGFloat v135;
  double v136;
  int v137;
  int v138;
  unint64_t v139;
  unint64_t v140;
  BOOL *p_var3;
  int v142;
  double v143;
  char v144;
  NSDictionary *v145;
  double v146;
  double v147;
  uint64_t v148;
  unint64_t v149;
  float v150;
  double v151;
  float v152;
  double v153;
  double v154;
  _QWORD *v155;
  BOOL v156;
  CFIndex v157;
  CFIndex location;
  unint64_t v159;
  double v160;
  double v161;
  __CTLine *v162;
  __CTLine *v163;
  CFRange v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  int v169;
  CFRange StringRange;
  double v171;
  uint64_t v172;
  double v173;
  double v174;
  NSArray *v175;
  double v176;
  double v177;
  uint64_t v179;
  const __CTLine *v180;
  double v181;
  const __CTLine *v182;
  double v183;
  _BOOL4 v184;
  double v185;
  char v186;
  int v187;
  double PenOffsetForFlush;
  const __CFAttributedString *v189;
  UIFont *v190;
  objc_class *v191;
  uint64_t v192;
  uint64_t v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  uint64_t v200;
  double v202;
  double v203;
  const __CTLine *v204;
  double v205;
  double v206;
  double v207;
  double v208;
  CGFloat v209;
  double v210;
  CGFloat v211;
  uint64_t v212;
  objc_class *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  double v217;
  double v218;
  uint64_t v219;
  double v220;
  double v221;
  double v222;
  const void *v223;
  char v224;
  CGPoint origin;
  CGSize size;
  NSParagraphStyle *v227;
  __int128 v228;
  uint64_t v229;
  double v230;
  double v231;
  int v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  double v237;
  int v238;
  int v239;
  CTLineRef v240;
  int v241;
  unint64_t v242;
  unint64_t v243;
  unint64_t v244;
  unint64_t v245;
  BOOL v246;
  int64_t v247;
  char v248;
  BOOL v249;
  int v250;
  uint64_t v251;
  double v252;
  uint64_t v253;
  _BOOL4 v254;
  char v255;
  uint64_t v256;
  uint64_t v257;
  __int128 *p_buffer;
  uint64_t v259;
  unsigned __int16 v260;
  BOOL v261;
  BOOL v262;
  uint64_t v263;
  uint64_t v265;
  uint64_t v266;
  double v267;
  double v268;
  double v269;
  double v270;
  double v271;
  double v272;
  uint64_t v273;
  double v274;
  uint64_t v275;
  int v276;
  double v277;
  NSParagraphStyle *v278;
  int CharacterAtIndex;
  double v280;
  uint64_t v281;
  uint64_t v282;
  char v283;
  CGFloat v284;
  char v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  double v290;
  uint64_t v291;
  double v292;
  double v293;
  char v294;
  unint64_t v295;
  char v296;
  double v297;
  id v298;
  unsigned int v299;
  char v300;
  double v301;
  uint64_t v302;
  const __CTLine *v303;
  CFIndex v304;
  uint64_t v305;
  double v306;
  double v307;
  double v308;
  double v309;
  const __CTLine *v310;
  uint64_t v311;
  uint64_t v312;
  double v313;
  double v314;
  double v315;
  CGFloat v316;
  void *v317;
  double v318;
  double v320;
  double v321;
  double v322;
  double v323;
  double v324;
  uint64_t v325;
  double v326;
  double v327;
  double v328;
  double v329;
  double v330;
  double v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  CGFloat v335;
  CGFloat v336;
  double v337;
  double v338;
  unint64_t v339;
  _QWORD *v340;
  NSTextContainer *v341;
  double v342;
  BOOL v343;
  NSDictionary *v344;
  _NSCoreTypesetterLayoutCache *v345;
  double v346;
  int v347;
  unint64_t v348;
  __CFString *v349;
  int64_t v350;
  unint64_t v351;
  int64_t v352;
  double v353;
  BOOL *v354;
  double v355;
  const __CFString *v356;
  __int128 v357;
  CGSize v358;
  double v359;
  CGPoint v360;
  double v361;
  int v362;
  double height;
  int v365;
  NSTypesetterBehavior v366;
  double y;
  double x;
  unint64_t v369;
  int v370;
  CGFloat v371;
  CGFloat v372;
  CGFloat v373;
  CGFloat v374;
  int v375;
  CGSize v376;
  CGPoint v377;
  __CFString *v378;
  uint64_t v379;
  const __CFString *theString;
  NSWritingDirection v381;
  id v384;
  uint64_t v385;
  int64_t v386;
  double v387;
  unint64_t v388;
  double rect;
  NSParagraphArbitrator *recta;
  unint64_t Length;
  int64_t v392;
  NSParagraphStyle *v393;
  _QWORD v395[7];
  double v396;
  double v397;
  char v398;
  _QWORD v399[6];
  char v400;
  char v401;
  _QWORD v402[5];
  _QWORD v403[9];
  double v404;
  CGFloat v405;
  char v406;
  _QWORD v407[7];
  char v408;
  double v409;
  double v410;
  char v411;
  __int128 v412;
  _QWORD v413[6];
  _QWORD v414[5];
  double v415;
  uint64_t v416;
  uint64_t v417;
  const char *v418;
  __int128 v419;
  __int128 v420;
  uint64_t v421;
  __int128 v422;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  __int128 v426;
  __int128 buffer;
  __int128 v428;
  __int128 v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  __int128 v433;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  __int128 v437;
  uint64_t v438;
  _QWORD v439[9];
  char v440;
  _QWORD v441[6];
  char v442;
  _QWORD v443[7];
  _QWORD v444[5];
  double v445;
  double v446;
  double v447;
  double v448;
  CTLineRef line;
  char v450;
  _NSTextAttachmentLayoutContext *v451;
  CFTypeRef cf;
  uint64_t v453;
  uint64_t *v454;
  uint64_t v455;
  uint64_t v456;
  double TrailingWhitespaceWidth;
  double v458;
  unint64_t v459;
  unint64_t v460;
  char v461;
  uint64_t v462;
  double *v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  double *v467;
  uint64_t v468;
  const char *v469;
  __int128 v470;
  __int128 v471;
  double v472;
  __int128 v473;
  CGSize v474;
  CGRect rect1;
  CGPoint v476;
  CGSize v477;
  double v478[3];
  double v479;
  uint64_t v480;
  double v481;
  uint64_t v482;
  CFRange v483;
  CGRect v484;
  CGRect v485;
  CGRect v486;
  CGRect v487;
  CGRect v488;
  CGRect v489;
  CGRect v490;
  CGRect result;
  CGRect v492;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v482 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = (__CFString *)a3;
  else
    v16 = 0;
  v356 = (const __CFString *)a3;
  v17 = (const __CFString *)a3;
  if (v16)
    v17 = (const __CFString *)-[__CFString string](v16, "string");
  theString = v17;
  if (v17)
    Length = CFStringGetLength(v17);
  else
    Length = 0;
  v472 = 0.0;
  v18 = (double *)MEMORY[0x1E0CB3438];
  v376 = *(CGSize *)(MEMORY[0x1E0CB3438] + 16);
  v377 = (CGPoint)*MEMORY[0x1E0CB3438];
  v473 = *MEMORY[0x1E0CB3438];
  v474 = v376;
  v466 = 0;
  v467 = (double *)&v466;
  v468 = 0x4010000000;
  v469 = "";
  v19 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v470 = *MEMORY[0x1E0C9D628];
  v471 = v19;
  v462 = 0;
  v463 = (double *)&v462;
  v464 = 0x2020000000;
  v465 = 0x7FEFFFFFFFFFFFFFLL;
  v352 = -[NSCoreTypesetter containerBreakMode](self, "containerBreakMode");
  v365 = objc_msgSend(a10, "wantsMultilineDeviceMetrics");
  v20 = (a9 & 1) == 0;
  v384 = -[NSCoreTypesetter laidOutLineFragment](self, "laidOutLineFragment");
  if (v384)
    v366 = +[NSTypesetter defaultTypesetterBehavior](NSTypesetter, "defaultTypesetterBehavior");
  else
    v366 = objc_msgSend(MEMORY[0x1E0CB3940], "typesetterBehavior");
  truncatedRanges = self->_truncatedRanges;
  if (truncatedRanges)
    -[NSMutableArray removeAllObjects](truncatedRanges, "removeAllObjects");
  else
    self->_truncatedRanges = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!a10)
    __assert_rtn("-[NSCoreTypesetter _stringDrawingCoreTextEngineWithOriginalString:rect:padding:graphicsContext:forceClipping:attributes:stringDrawingOptions:drawingContext:stringDrawingInterface:]", "NSCoreTypesetter.m", 2298, "drawingContext != nil");
  v22 = objc_msgSend(a10, "activeRenderers");
  if (v22)
    v23 = v22;
  else
    v23 = 3;
  v350 = -[NSTypesetter applicationFrameworkContext](self, "applicationFrameworkContext");
  v362 = 0;
  v461 = 0;
  v460 = 0;
  v459 = 0;
  v458 = 0.0;
  v348 = v352 - 3;
  TrailingWhitespaceWidth = 0.0;
  if ((a9 & 1) != 0)
  {
    v24 = ((unint64_t)a9 >> 5) & 1;
    if (v348 < 3)
      LODWORD(v24) = 1;
    v362 = v24;
  }
  -[NSTypesetter setAttributedString:](self, "setAttributedString:", v16);
  -[NSTypesetter setTypesetterBehavior:](self, "setTypesetterBehavior:", v366);
  -[NSTypesetter setUsesFontLeading:](self, "setUsesFontLeading:", ((unint64_t)a9 >> 1) & 1);
  -[NSCoreTypesetter setAllowsFontOverridingTextAttachmentVerticalMetrics:](self, "setAllowsFontOverridingTextAttachmentVerticalMetrics:", objc_msgSend((id)objc_opt_class(), "_allowsFontOverridingTextAttachmentVerticalMetricsForStringDrawing"));
  if ((uint64_t)Length < 1)
    goto LABEL_632;
  if (v16)
  {
    a8 = (id)-[__CFString attributesAtIndex:effectiveRange:](v16, "attributesAtIndex:effectiveRange:", 0, &v459);
  }
  else
  {
    v459 = 0;
    v460 = Length;
  }
  v393 = -[NSCoreTypesetter _paragraphStyleFromAttributes:](self, "_paragraphStyleFromAttributes:", a8);
  if (a7)
    v25 = 2;
  else
    v25 = -[NSParagraphStyle lineBreakMode](v393, "lineBreakMode");
  v392 = __NSUltraFastLineBreakFinder(theString, Length, &v461, 0);
  if (!v384 && v350 != 2)
  {
    v26 = objc_msgSend(a10, "maximumNumberOfLines") == 1 && v25 <= 1;
    v27 = !v26;
    v20 = (a9 & 1) == 0 || !v27;
    if ((a9 & 0x100000) != 0 && !v27)
    {
      if (!v25)
        v25 = 2;
      if ((a9 & 1) != 0)
        goto LABEL_46;
LABEL_54:
      v30 = 1;
      goto LABEL_56;
    }
  }
  if (v20)
    goto LABEL_54;
LABEL_46:
  v28 = objc_msgSend(a10, "wrapsForTruncationMode");
  if (v25 > 1)
    v29 = v28;
  else
    v29 = 0;
  if (v29 == 1)
  {
    v30 = 0;
    if (objc_msgSend(a10, "maximumNumberOfLines") != 1)
      v25 = 0;
    v362 = 1;
  }
  else
  {
    v30 = 0;
  }
LABEL_56:
  if ((a9 & 0x200) != 0 || self->_layoutOrientation)
    v461 = 0;
  if ((uint64_t)Length <= v392)
    v31 = 1;
  else
    v31 = v30;
  if ((v31 & 1) == 0
    && (!v384 || (uint64_t)(Length - v392) > 1 || -[NSDictionary count](self->__extraLineFragmentAttributes, "count")))
  {
    v461 = 0;
  }
  if (-[NSCoreTypesetter requiresCTLineRef](self, "requiresCTLineRef")
    || (v23 & 1) == 0
    || v392 > 512
    || v392 > v460
    || -[NSCoreTypesetter forcedLineBreaks](self, "forcedLineBreaks"))
  {
    v461 = 0;
  }
  if (v365)
    v461 = 0;
  v32 = -[NSCoreTypesetter isSimpleRectangularTextContainerForStartingCharacterAtIndex:](self, "isSimpleRectangularTextContainerForStartingCharacterAtIndex:", 0);
  if (v461)
    v33 = v32;
  else
    v33 = 0;
  if (v33)
  {
    BYTE5(v333) = (a9 & 0x400) != 0;
    BYTE4(v333) = (a9 & 0x200) != 0;
    BYTE3(v333) = a7;
    BYTE2(v333) = 0;
    BYTE1(v333) = (a9 & 2) != 0;
    LOBYTE(v333) = v30;
    if (-[NSCoreTypesetter _NSFastDrawString:length:attributes:paragraphStyle:typesetterBehavior:lineBreakMode:rect:padding:graphicsContext:baselineRendering:usesFontLeading:usesScreenFont:scrollable:syncAlignment:mirrored:boundingRectPointer:baselineOffsetPointer:drawingContext:](self, "_NSFastDrawString:length:attributes:paragraphStyle:typesetterBehavior:lineBreakMode:rect:padding:graphicsContext:baselineRendering:usesFontLeading:usesScreenFont:scrollable:syncAlignment:mirrored:boundingRectPointer:baselineOffsetPointer:drawingContext:", theString, v392, a8, v393, v366, v25, x, y, width, height, a5, a6, v333, &v473, &v472,
           a10) == 2)
    {
      objc_msgSend(a10, "setNumberOfLineFragments:", 1);
      objc_msgSend(a10, "setTotalBounds:", v473, v474);
      if (objc_msgSend(a10, "wantsBaselineOffset"))
      {
        objc_msgSend(a10, "setBaselineOffset:", v472);
        objc_msgSend(a10, "setFirstBaselineOffset:", v472);
      }
      if (a11)
        a11->var0 = 1;
      goto LABEL_634;
    }
  }
  if ((v23 & 2) == 0)
    goto LABEL_632;
  v34 = (_NSCoreTypesetterLayoutCache *)(id)objc_msgSend(a10, "layout");
  v453 = 0;
  v454 = &v453;
  v455 = 0x2020000000;
  v456 = 0;
  if (!v34)
  {
    if (objc_msgSend(a10, "cachesLayout"))
    {
      v35 = objc_alloc_init(_NSCoreTypesetterLayoutCache);
      objc_msgSend(a10, "setLayout:", v35);
      v34 = v35;
    }
    else
    {
      v34 = 0;
    }
  }
  v345 = v34;
  cf = 0;
  v36 = -[NSCoreTypesetter delegate](self, "delegate");
  v451 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v37 = (_NSTextAttachmentLayoutContext *)-[NSCoreTypesetterDelegate textAttachmentLayoutContext](v36, "textAttachmentLayoutContext");
  else
    v37 = 0;
  v451 = v37;
  v450 = 0;
  -[_NSCoreTypesetterLayoutCache getCTLine:attachmentLayoutContext:lineValidForDrawing:]((uint64_t)v345, &cf, &v451, &v450);
  if (v451)
    v38 = v451;
  if (!self->_laidOutLineFragment && (!cf || !v450))
  {
    if (v16)
    {
      v450 = 1;
      v65 = (const __CFDictionary *)a8;
      do
      {
        LOBYTE(buffer) = 1;
        if ((__NSValidateCoreTextAttributes(v65, a6 == 0, (BOOL *)&buffer) & 1) == 0)
          break;
        v459 += v460;
        if ((_BYTE)buffer)
          v66 = v450 == 0;
        else
          v66 = 1;
        v67 = !v66;
        v450 = v67;
        if (!v451
          && (-[__CFDictionary objectForKeyedSubscript:](v65, "objectForKeyedSubscript:", CFSTR("NSAttachment"))
           || -[__CFDictionary objectForKeyedSubscript:](v65, "objectForKeyedSubscript:", CFSTR("CTAdaptiveImageProvider"))))
        {
          v451 = objc_alloc_init(_NSTextAttachmentLayoutContext);
        }
        if (v459 >= Length)
          break;
        v65 = (const __CFDictionary *)-[__CFString attributesAtIndex:effectiveRange:](v16, "attributesAtIndex:effectiveRange:");
      }
      while (v65);
      if (v459 >= v392)
        v68 = v30;
      else
        v68 = 0;
      if (v459 >= Length || (v68 & 1) != 0)
        goto LABEL_97;
    }
    else
    {
      v97 = __NSValidateCoreTextAttributes((CFDictionaryRef)a8, a6 == 0, (BOOL *)&v450);
      v98 = v97;
      if (v451)
        v99 = 0;
      else
        v99 = v97;
      if (v99 == 1
        && (objc_msgSend(a8, "objectForKeyedSubscript:", CFSTR("NSAttachment"))
         || objc_msgSend(a8, "objectForKeyedSubscript:", CFSTR("CTAdaptiveImageProvider")))
        && Length == 1
        && CFStringGetCharacterAtIndex(theString, 0) == 65532)
      {
        v451 = objc_alloc_init(_NSTextAttachmentLayoutContext);
      }
      if (v98)
        goto LABEL_97;
    }
    v341 = 0;
    goto LABEL_629;
  }
LABEL_97:
  line = 0;
  if (v451)
  {
    -[_NSTextAttachmentLayoutContext setApplicationFrameworkContext:](v451, "setApplicationFrameworkContext:", v350);
    -[_NSTextAttachmentLayoutContext setUsesFontLeading:](v451, "setUsesFontLeading:", ((unint64_t)a9 >> 1) & 1);
    v39 = -[NSCoreTypesetter allowsFontOverridingTextAttachmentVerticalMetrics](self, "allowsFontOverridingTextAttachmentVerticalMetrics");
    -[_NSTextAttachmentLayoutContext setAllowsFontOverridingTextAttachmentVerticalMetrics:](v451, "setAllowsFontOverridingTextAttachmentVerticalMetrics:", v39);
    v341 = 0;
    if (!v36 && width > 0.0)
    {
      v341 = -[NSTextContainer initWithSize:]([NSTextContainer alloc], "initWithSize:", width, 40000.0);
      -[NSTextContainer setLineFragmentPadding:](v341, "setLineFragmentPadding:", 0.0);
      -[_NSTextAttachmentLayoutContext setTextContainer:](v451, "setTextContainer:", v341);
    }
  }
  else
  {
    v341 = 0;
  }
  v40 = (__CFString *)v356;
  if (!v16)
    v40 = (__CFString *)(id)objc_msgSend(objc_allocWithZone((Class)_NSCachedAttributedString), "initWithString:attributes:", v356, a8);
  v41 = -[NSCoreTypesetter keyframe](self, "keyframe");
  v476.x = 0.0;
  *(_QWORD *)&v476.y = &v476;
  *(_QWORD *)&v477.width = 0x2020000000;
  LOBYTE(v477.height) = 0;
  v42 = -[__CFString length](v40, "length");
  v415 = MEMORY[0x1E0C809B0];
  v416 = 3221225472;
  v417 = (uint64_t)__attributedStringAtKeyframe_block_invoke;
  v418 = (const char *)&unk_1E2604428;
  *(_QWORD *)&v419 = &v476;
  -[__CFString enumerateAttribute:inRange:options:usingBlock:](v40, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSTextAnimation"), 0, v42, 0, &v415);
  v43 = v40;
  if (*(_BYTE *)(*(_QWORD *)&v476.y + 24))
  {
    v44 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    rect1.origin.x = 0.0;
    *(_QWORD *)&rect1.origin.y = &rect1;
    *(_QWORD *)&rect1.size.width = 0x2020000000;
    rect1.size.height = 0.0;
    v45 = -[__CFString length](v40, "length");
    *(_QWORD *)&buffer = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buffer + 1) = 3221225472;
    *(_QWORD *)&v428 = __attributedStringAtKeyframe_block_invoke_2;
    *((_QWORD *)&v428 + 1) = &unk_1E26056A0;
    *(_QWORD *)&v429 = v44;
    *((_QWORD *)&v429 + 1) = v40;
    *((_QWORD *)&v430 + 1) = &rect1;
    *(_QWORD *)&v430 = v41;
    -[__CFString enumerateAttribute:inRange:options:usingBlock:](v40, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSTextAnimation"), 0, v45, 0, &buffer);
    v46 = *(_QWORD *)(*(_QWORD *)&rect1.origin.y + 24);
    if (v46 < -[__CFString length](v40, "length"))
    {
      v47 = *(_QWORD *)(*(_QWORD *)&rect1.origin.y + 24);
      v48 = -[__CFString length](v40, "length");
      objc_msgSend(v44, "appendAttributedString:", -[__CFString attributedSubstringFromRange:](v40, "attributedSubstringFromRange:", v47, v48 - *(_QWORD *)(*(_QWORD *)&rect1.origin.y + 24)));
    }
    v43 = (__CFString *)v44;
    _Block_object_dispose(&rect1, 8);
    v18 = (double *)MEMORY[0x1E0CB3438];
  }
  _Block_object_dispose(&v476, 8);
  v349 = v43;
  if (v43 == v40)
    v49 = v16;
  else
    v49 = v43;
  if (v43 == v40)
    v50 = a8;
  else
    v50 = 0;
  v379 = (uint64_t)v50;
  if (cf)
  {
    BaseLineFromAttributedString = CFRetain(cf);
LABEL_118:
    cf = BaseLineFromAttributedString;
    goto LABEL_119;
  }
  if (v392 >= 1)
  {
    v52 = -[NSCoreTypesetter layoutOrientation](self, "layoutOrientation");
    v53 = -[NSCoreTypesetter limitsLayoutForSuspiciousContents](self, "limitsLayoutForSuspiciousContents");
    BaseLineFromAttributedString = __NSCoreTypesetterCreateBaseLineFromAttributedString(v43, 0, v392, v52, v53, (uint64_t)v451);
    goto LABEL_118;
  }
LABEL_119:
  v448 = 0.0;
  v447 = 0.0;
  v54 = -[NSCoreTypesetter isSimpleRectangularTextContainerForStartingCharacterAtIndex:](self, "isSimpleRectangularTextContainerForStartingCharacterAtIndex:", 0);
  v355 = 0.0;
  v353 = width;
  if (v54)
  {
    rect = height;
    v56 = y;
    v55 = x;
    v57 = 0.0;
  }
  else
  {
    if (Length == v460 || v49 == 0)
      v59 = v379;
    else
      v59 = 0;
    LOBYTE(v332) = 0;
    -[NSCoreTypesetter _getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:](self, "_getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:", 0, v392, v59, v49, 0, 0, v332);
    v61 = v60;
    v57 = v62;
    v448 = v60;
    v447 = v63;
    if (!v393
      || (IsRightToLeft = -[NSParagraphStyle baseWritingDirection](v393, "baseWritingDirection"),
          IsRightToLeft == NSWritingDirectionNatural))
    {
      if (cf)
        IsRightToLeft = (unint64_t)CTLineIsRightToLeft();
      else
        IsRightToLeft = +[NSParagraphStyle defaultWritingDirectionForLanguage:](NSParagraphStyle, "defaultWritingDirectionForLanguage:", 0);
    }
    -[NSCoreTypesetter lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:](self, "lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:", 0, IsRightToLeft, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), 10000000.0, v61);
    rect = v69;
    v55 = v70;
    v56 = v71;
    v73 = v72;
    -[NSTypesetter lineFragmentPadding](self, "lineFragmentPadding");
    width = v73 + v74 * -2.0;
  }
  if (self->_typographicBoundsIncludesLineFragmentPadding)
  {
    -[NSTypesetter lineFragmentPadding](self, "lineFragmentPadding");
    v355 = v75;
  }
  v76 = (CGContext *)objc_msgSend(a6, "CGContext");
  v446 = 0.0;
  v445 = 0.0;
  if (v393)
    v77 = -[NSParagraphStyle baseWritingDirection](v393, "baseWritingDirection");
  else
    v77 = NSWritingDirectionNatural;
  +[NSCoreTypesetter _minMaxPositionsForLineFragmentWithParagraphStyle:baseWidth:writingDirection:isBeginningOfParagraph:minPosition:maxPosition:](NSCoreTypesetter, "_minMaxPositionsForLineFragmentWithParagraphStyle:baseWidth:writingDirection:isBeginningOfParagraph:minPosition:maxPosition:", v393, v77, 1, &v446, &v445, width);
  v387 = v57;
  if (v445 <= v446)
    v78 = width;
  else
    v78 = v445 - v446;
  if (cf)
  {
    line = (CTLineRef)CFRetain(cf);
    TypographicBounds = CTLineGetTypographicBounds(line, 0, 0, 0);
    v343 = 0;
    TrailingWhitespaceWidth = CTLineGetTrailingWhitespaceWidth(line);
    v458 = TypographicBounds - TrailingWhitespaceWidth;
    if ((v30 & 1) == 0 && v25 <= 1 && v78 > 0.0)
      v343 = -[NSCoreTypesetter _getFirstOverflowTabStopIndexInLineRef:range:string:paragraphStyle:availableWidth:offset:](self, "_getFirstOverflowTabStopIndexInLineRef:range:string:paragraphStyle:availableWidth:offset:", cf, 0, v392, theString, v393, v78, v446) != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v343 = 0;
    line = 0;
    TrailingWhitespaceWidth = 0.0;
    v458 = 0.0;
  }
  if (a6)
  {
    *(_QWORD *)&buffer = 0;
    *((_QWORD *)&buffer + 1) = &buffer;
    *(_QWORD *)&v428 = 0x2020000000;
    BYTE8(v428) = 0;
    v80 = -[__CFString length](v349, "length");
    v444[0] = MEMORY[0x1E0C809B0];
    v444[1] = 3221225472;
    v444[2] = __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke;
    v444[3] = &unk_1E2604428;
    v444[4] = &buffer;
    -[__CFString enumerateAttribute:inRange:options:usingBlock:](v349, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSLink"), 0, v80, 0x100000, v444);
    if (*(_BYTE *)(*((_QWORD *)&buffer + 1) + 24))
    {
      v81 = objc_msgSend(a10, "linkTextAttributesProvider");
      v82 = +[NSTextLayoutManager linkRenderingAttributesForLabels](NSTextLayoutManager, "linkRenderingAttributesForLabels");
      v443[0] = MEMORY[0x1E0C809B0];
      v443[1] = 3221225472;
      v443[2] = __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_2;
      v443[3] = &unk_1E2605540;
      v443[6] = v81;
      v340 = v443;
      v443[4] = v349;
      v443[5] = v82;
    }
    else
    {
      v340 = 0;
    }
    _Block_object_dispose(&buffer, 8);
  }
  else
  {
    v340 = 0;
  }
  v351 = ((unint64_t)a9 >> 10) & 1;
  v361 = width;
  if ((v30 & 1) != 0)
  {
    v83 = v446;
    v84 = v55 + v446;
    if (!v54 | ((unint64_t)a9 >> 3) & 1)
    {
LABEL_210:
      if (line)
      {
        if (v83 > 0.0)
        {
          CTLineGetStringRange(line);
          v106 = (const __CTLine *)CTLineCreateFromLineWithOffset();
          if (v106)
          {
            CFRelease(line);
            line = v106;
          }
        }
      }
      if (v78 <= 0.0 || v78 >= 10000000.0)
      {
        LOBYTE(v107) = 0;
        v108 = v458;
      }
      else
      {
        v107 = __NSCoreTypesetterTruncateLine((uint64_t)self, &line, v393, v25, 0, &v458, &TrailingWhitespaceWidth, v78);
        v108 = v458;
        v109 = 0.0;
        if (v458 <= v78)
        {
          if (-[NSParagraphStyle isFullyJustified](v393, "isFullyJustified", 0.0))
          {
            if (((!-[NSParagraphStyle spansAllLines](v393, "spansAllLines") | v107) & 1) == 0)
            {
              JustifiedLine = CTLineCreateJustifiedLine(line, 1.0, v78);
              if (JustifiedLine)
              {
                CFRelease(line);
                line = JustifiedLine;
                v458 = v78;
                v108 = v78;
              }
            }
          }
          v111 = -[NSParagraphStyle horizontalAlignment](v393, "horizontalAlignment");
          v112 = line;
          v113 = (a9 & 0x200) != 0
              || -[NSParagraphStyle _alignmentFollowsWritingDirection](v393, "_alignmentFollowsWritingDirection");
          v109 = _flushFactorFromAlignment(v111, v77, (uint64_t)v112, v113, v351);
        }
        v84 = v84 + CTLineGetPenOffsetForFlush(line, v109, v78);
      }
      v114 = v108 > v78 && v78 > 0.0;
      if (a6)
        v115 = objc_msgSend(a6, "isFlipped");
      else
        v115 = 1;
      if (line && v451)
        __NSCoreTypesetterAdjustLineHeightAndBaselineForTextAttachments(line, &v448, &v447);
      if ((v30 & 1) != 0)
      {
        v116 = a5;
        v117 = v56;
        v118 = v56;
      }
      else
      {
        v484.origin.x = v55;
        v484.origin.y = v56;
        v484.size.width = width;
        v484.size.height = rect;
        if (CGRectGetHeight(v484) > 0.0)
        {
          v119 = v448;
          v485.origin.x = v55;
          v485.origin.y = v56;
          v485.size.width = width;
          v485.size.height = rect;
          if (v119 > CGRectGetHeight(v485))
            v114 = 1;
        }
        if (v115)
        {
          v116 = a5;
          v117 = v447;
        }
        else
        {
          v486.origin.x = v55;
          v486.origin.y = v56;
          v486.size.width = width;
          v486.size.height = rect;
          if (CGRectGetHeight(v486) <= 0.0)
          {
            v116 = a5;
            v120 = v448;
          }
          else
          {
            v487.origin.x = v55;
            v487.origin.y = v56;
            v487.size.width = width;
            v487.size.height = rect;
            v120 = CGRectGetHeight(v487);
            v116 = a5;
          }
          v117 = v120 - v447;
        }
        v118 = v56 + v117;
      }
      v121 = v108 + TrailingWhitespaceWidth;
      v458 = v121;
      if (v384)
      {
        v122 = v448;
        v123 = -[NSTypesetter applicationFrameworkContext](self, "applicationFrameworkContext");
        if (v121 <= v78 || v78 <= 0.0)
          v125 = v121;
        else
          v125 = v78;
        v441[0] = MEMORY[0x1E0C809B0];
        v441[1] = 3221225472;
        v441[2] = __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_3;
        v441[3] = &unk_1E2605568;
        v442 = v107;
        v441[5] = line;
        v441[4] = self;
        __NSCoreTypesetterProcessTextLineFragment((uint64_t)v49, (uint64_t)theString, v379, 0, Length, v123, (uint64_t)v441, v84 - v84, v447, v84, v387, v125, v122, v355);
      }
      else
      {
        if (v114)
        {
          if ((v30 & 1) != 0
            || (v488.origin.x = v55,
                v488.origin.y = v56,
                v488.size.width = v361,
                v488.size.height = rect,
                CGRectGetHeight(v488) <= 0.0))
          {
            *(_QWORD *)&buffer = 0;
            v415 = 0.0;
            +[NSCoreTypesetter _maximumAscentAndDescentForRuns:ascender:descender:](NSCoreTypesetter, "_maximumAscentAndDescentForRuns:ascender:descender:", CTLineGetGlyphRuns(line), &buffer, &v415);
            v126 = -*(double *)&buffer;
            if (!v115)
              v126 = v415;
            v56 = v56 + v126;
            rect = *(double *)&buffer - v415;
          }
          v127 = v55 - v116;
          v128 = v361 + v116 * 2.0;
        }
        else
        {
          v127 = *v18;
          v56 = v18[1];
          v128 = v18[2];
          rect = v18[3];
        }
        v129 = line;
        v130 = -[NSTypesetter applicationFrameworkContext](self, "applicationFrameworkContext");
        v439[0] = MEMORY[0x1E0C809B0];
        v439[1] = 3221225472;
        v439[2] = __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_4;
        v439[3] = &unk_1E2605590;
        v440 = v365;
        *(double *)&v439[6] = v117;
        *(double *)&v439[7] = v84;
        *(double *)&v439[8] = v118;
        v439[4] = &v462;
        v439[5] = &v466;
        __NSCoreTypesetterRenderLineAndAttachments(v129, a6, v130, v451, 0, (uint64_t)v340, v365, (uint64_t)v439, v84, v118, v127, v56, v128, rect);
        v131 = v365;
        if ((a9 & 8) == 0)
          v131 = 1;
        if ((v131 & 1) != 0)
        {
          v473 = *MEMORY[0x1E0CB3430];
          v132 = v458;
          v474.width = v458;
          v474.height = v387 + v448;
          v472 = v447;
          if (v30)
            *((double *)&v473 + 1) = v447 - (v387 + v448);
        }
        else
        {
          *(CGRect *)(&v132 - 2) = CTLineGetImageBounds(line, v76);
          *(_QWORD *)&v473 = v133;
          *((double *)&v473 + 1) = v134;
          v474.width = v132;
          v474.height = v135;
          v472 = v134;
          if ((v30 & 1) == 0)
            *((_QWORD *)&v473 + 1) = 0;
        }
        if (v78 > 0.0 && v132 > v78)
          v474.width = v78;
        objc_msgSend(a10, "setNumberOfLineFragments:", 1);
        objc_msgSend(a10, "setTotalBounds:", v473, v474);
        if (objc_msgSend(a10, "wantsBaselineOffset"))
        {
          objc_msgSend(a10, "setBaselineOffset:", v472);
          objc_msgSend(a10, "setFirstBaselineOffset:", v472);
        }
      }
      if (a11)
        a11->var0 = 2;
      goto LABEL_625;
    }
LABEL_203:
    if (Length == v460 || v49 == 0)
      v101 = v379;
    else
      v101 = 0;
    v102 = -[NSCoreTypesetter isBeginningOfDocument](self, "isBeginningOfDocument");
    LOBYTE(v332) = !-[NSCoreTypesetter isBeginningOfDocument](self, "isBeginningOfDocument");
    -[NSCoreTypesetter _getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:](self, "_getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:", 0, v392, v101, v49, !v102, 0, v332);
    v387 = v103;
    v448 = v104;
    v447 = v105;
    v83 = v446;
    goto LABEL_210;
  }
  if (Length == v392
    && (v25 > 1 || v78 <= 0.0 || !v343 && !-[NSCoreTypesetter forcedLineBreaks](self, "forcedLineBreaks") && v458 <= v78))
  {
    v83 = v446;
    v84 = v55 + v446;
    if (!v54)
      goto LABEL_210;
    goto LABEL_203;
  }
  if (a6 && !objc_msgSend(a6, "isFlipped"))
    goto LABEL_625;
  v438 = 0;
  v436 = 0u;
  v437 = 0u;
  v434 = 0u;
  v435 = 0u;
  v432 = 0u;
  v433 = 0u;
  v430 = 0u;
  v431 = 0u;
  v428 = 0u;
  v429 = 0u;
  buffer = 0u;
  v85 = objc_msgSend(a10, "maximumNumberOfLines");
  v86 = -[NSCoreTypesetter enforcesMinimumTextLineFragment](self, "enforcesMinimumTextLineFragment");
  recta = +[NSParagraphArbitrator paragraphArbitratorWithAttributedString:range:](NSParagraphArbitrator, "paragraphArbitratorWithAttributedString:range:", v349, 0, v392);
  v415 = 0.0;
  v416 = (uint64_t)&v415;
  v417 = 0x9810000000;
  v422 = 0u;
  v423 = 0u;
  v424 = 0u;
  v425 = 0u;
  v426 = 0u;
  v419 = 0u;
  v420 = 0u;
  v421 = 0;
  v87 = +[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle");
  v89 = *v18;
  v88 = v18[1];
  v91 = v18[2];
  v90 = v18[3];
  v92 = *MEMORY[0x1E0CB3430];
  v93 = *(_QWORD *)(MEMORY[0x1E0CB3430] + 8);
  *(_QWORD *)&v423 = 0;
  v422 = (unint64_t)v87;
  v335 = v91;
  v336 = v89;
  *((double *)&v423 + 1) = v89;
  v337 = v90;
  v338 = v88;
  *(double *)&v424 = v88;
  *((double *)&v424 + 1) = v91;
  *(double *)&v425 = v90;
  *((_QWORD *)&v425 + 1) = v92;
  *(_QWORD *)&v426 = v93;
  WORD4(v426) = 0;
  v476 = v377;
  v477 = v376;
  if (v85)
    v94 = v85;
  else
    v94 = -1;
  v369 = v94;
  v95 = v86;
  if ((uint64_t)Length >= v392)
  {
    *(_QWORD *)&v435 = theString;
    *((_QWORD *)&v436 + 1) = 0;
    *(_QWORD *)&v437 = Length;
    *((_QWORD *)&v435 + 1) = CFStringGetCharactersPtr(theString);
    if (*((_QWORD *)&v435 + 1))
      CStringPtr = 0;
    else
      CStringPtr = CFStringGetCStringPtr(theString, 0x600u);
    v438 = 0;
    *(_QWORD *)&v436 = CStringPtr;
    *((_QWORD *)&v437 + 1) = 0;
  }
  if (!-[NSCoreTypesetter isBeginningOfDocument](self, "isBeginningOfDocument"))
  {
    LOBYTE(v332) = 1;
    -[NSCoreTypesetter _getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:](self, "_getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:", 0, 0, v379, v49, 1, 0, v332);
    v476.y = v136 + v476.y;
  }
  v137 = 0;
  v138 = 0;
  *(double *)&v139 = 0.0;
  v140 = 0;
  p_var3 = &a11->var3;
  if (!a11)
    p_var3 = 0;
  v354 = p_var3;
  v373 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v374 = *MEMORY[0x1E0C9D648];
  v371 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v372 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v142 = v365;
  if ((a9 & 8) == 0)
    v142 = 1;
  v347 = v142;
  v346 = INFINITY;
  v342 = 0.0;
  v143 = 0.0;
  v144 = 1;
  v378 = v49;
  do
  {
    if ((v137 & 1) != 0
      && -[NSDictionary count](-[NSCoreTypesetter _extraLineFragmentAttributes](self, "_extraLineFragmentAttributes"), "count"))
    {
      v145 = -[NSCoreTypesetter _extraLineFragmentAttributes](self, "_extraLineFragmentAttributes");
      v393 = -[NSCoreTypesetter _paragraphStyleFromAttributes:](self, "_paragraphStyleFromAttributes:", v145);
      v379 = (uint64_t)v145;
    }
    else
    {
      if (v49)
        v393 = -[NSCoreTypesetter _paragraphStyleFromAttributes:](self, "_paragraphStyleFromAttributes:", -[__CFString attributesAtIndex:effectiveRange:](v49, "attributesAtIndex:effectiveRange:", v139 - ((v139 != 0) & v137), 0));
      v145 = 0;
    }
    if (v393)
    {
      if (v362 && (objc_msgSend(a10, "wrapsForTruncationMode") & 1) != 0)
        v385 = 0;
      else
        v385 = -[NSParagraphStyle lineBreakMode](v393, "lineBreakMode");
      v381 = -[NSParagraphStyle baseWritingDirection](v393, "baseWritingDirection");
    }
    else
    {
      v385 = 0;
      v381 = NSWritingDirectionNatural;
    }
    v146 = 0.0;
    if ((v144 & (v139 != 0)) == 1)
      -[NSParagraphStyle paragraphSpacingBefore](v393, "paragraphSpacingBefore", 0.0);
    v388 = v139;
    v147 = v146 + v476.y;
    v476.y = v147;
    if (!recta || !line)
      goto LABEL_325;
    if (v393)
      v148 = -[NSParagraphStyle lineBreakStrategy](v393, "lineBreakStrategy");
    else
      v148 = +[NSTypesetter defaultLineBreakStrategy](NSTypesetter, "defaultLineBreakStrategy");
    if (v148 == 0xFFFF)
      v148 = __NSLineBreakStrategyStandardActualOptions(-[NSParagraphStyle isFullyJustified](v393, "isFullyJustified"));
    if (v385)
      v149 = v148 & 0xFFFFFFFFFFFFFFF3 | 4;
    else
      v149 = v148;
    if (v393)
    {
      -[NSParagraphStyle hyphenationFactor](v393, "hyphenationFactor");
      v151 = v150;
      if (v150 != 0.0)
        goto LABEL_318;
    }
    else
    {
      v151 = 0.0;
    }
    if (!-[NSCoreTypesetter usesDefaultHyphenation](self, "usesDefaultHyphenation"))
    {
LABEL_318:
      v154 = 0.0;
      if (v151 >= 0.0)
        v154 = v151;
      v153 = fmin(v154, 1.0);
      goto LABEL_321;
    }
    +[NSParagraphStyle _defaultHyphenationFactor](NSParagraphStyle, "_defaultHyphenationFactor");
    v153 = v152;
LABEL_321:
    -[NSParagraphArbitrator setAttributedString:](recta, "setAttributedString:", v349);
    -[NSParagraphArbitrator setParagraphRange:](recta, "setParagraphRange:", v139, v392);
    -[NSParagraphArbitrator setParagraphLine:](recta, "setParagraphLine:", line);
    -[NSParagraphArbitrator setLineBreakStrategy:](recta, "setLineBreakStrategy:", v149);
    -[NSParagraphArbitrator setHyphenationFactor:](recta, "setHyphenationFactor:", v153);
    -[NSParagraphArbitrator setTypesetterBehavior:](recta, "setTypesetterBehavior:", v366);
    if (self->_validateLineBreakIndex)
    {
      v414[0] = MEMORY[0x1E0C809B0];
      v414[1] = 3221225472;
      v414[2] = __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_5;
      v414[3] = &unk_1E2603460;
      v155 = v414;
      v414[4] = self;
    }
    else
    {
      v155 = 0;
    }
    -[NSParagraphArbitrator setValidateLineBreakContext:](recta, "setValidateLineBreakContext:", v155);
    v413[0] = MEMORY[0x1E0C809B0];
    v413[1] = 3221225472;
    v413[2] = __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_6;
    v413[3] = &unk_1E26055B8;
    v413[5] = line;
    v413[4] = self;
    -[NSParagraphArbitrator setLineWidth:](recta, "setLineWidth:", v413);
    -[NSParagraphArbitrator setPreviousLineRange:](recta, "setPreviousLineRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    -[NSParagraphArbitrator setTextContainerIsSimple:](recta, "setTextContainerIsSimple:", -[NSCoreTypesetter isSimpleRectangularTextContainerForStartingCharacterAtIndex:](self, "isSimpleRectangularTextContainerForStartingCharacterAtIndex:", v139));
    -[NSParagraphArbitrator setTextContainerWidth:](recta, "setTextContainerWidth:", width);
    -[NSParagraphArbitrator setDefaultParagraphStyle:](recta, "setDefaultParagraphStyle:", -[NSTypesetter defaultParagraphStyle](self, "defaultParagraphStyle"));
    -[NSParagraphArbitrator setBreaksLinesForInteractiveText:](recta, "setBreaksLinesForInteractiveText:", -[NSCoreTypesetter breaksLinesForInteractiveText](self, "breaksLinesForInteractiveText"));
LABEL_325:
    v375 = v138;
    v370 = v137;
    if (v140 >= v369)
    {
      v157 = 0;
      goto LABEL_330;
    }
    v156 = line == 0;
    if (!v392 && line)
    {
      v157 = 0;
LABEL_330:
      location = v139;
      goto LABEL_476;
    }
    v339 = v139 - ((v139 != 0) & v137);
    v344 = v145;
    v159 = v139;
    v386 = v392;
    while (1)
    {
      rect1.origin = v377;
      rect1.size = v376;
      v412 = *MEMORY[0x1E0CB3430];
      v411 = 0;
      if (!v156
        && !-[NSCoreTypesetter isSimpleRectangularTextContainerForStartingCharacterAtIndex:](self, "isSimpleRectangularTextContainerForStartingCharacterAtIndex:", v159))
      {
        v479 = *(double *)&v159;
        LOBYTE(v334) = v451 != 0;
        v163 = -[NSCoreTypesetter _createLayoutLineFragmentStartingWithCharacterIndex:proposedLineFragmentRect:baseLineRef:range:paragraphStyle:paragraphArbitrator:lineBreakMode:hasAttachments:lineFragmentRect:glyphOrigin:hyphenated:forcedClusterBreak:](self, "_createLayoutLineFragmentStartingWithCharacterIndex:proposedLineFragmentRect:baseLineRef:range:paragraphStyle:paragraphArbitrator:lineBreakMode:hasAttachments:lineFragmentRect:glyphOrigin:hyphenated:forcedClusterBreak:", &v479, &v476, &line, v159, v386, v393, recta, v385, v334, &rect1, &v412, &v411, v354);
        StringRange = CTLineGetStringRange(v163);
        location = StringRange.location;
        v157 = StringRange.length;
        goto LABEL_375;
      }
      +[NSCoreTypesetter _minMaxPositionsForLineFragmentWithParagraphStyle:baseWidth:writingDirection:isBeginningOfParagraph:minPosition:maxPosition:](NSCoreTypesetter, "_minMaxPositionsForLineFragmentWithParagraphStyle:baseWidth:writingDirection:isBeginningOfParagraph:minPosition:maxPosition:", v393, v381, v144 & 1, &v446, &v445, width);
      v160 = v445;
      if (v445 <= v446)
        v161 = width;
      else
        v161 = v445 - v446;
      if (!line)
      {
        v163 = 0;
LABEL_346:
        location = v388;
        v157 = v392;
        goto LABEL_347;
      }
      if (v159 == v388)
      {
        if (v385 > 1 || v161 <= 0.0 || (v160 = v458, !v343 && v458 <= v161))
        {
          if (!-[NSCoreTypesetter forcedLineBreaks](self, "forcedLineBreaks", v160))
          {
            if (v392 == CTLineGetStringRange(line).length && v446 == 0.0)
              v212 = (uint64_t)CFRetain(line);
            else
              v212 = CTLineCreateFromLineWithOffset();
            v163 = (__CTLine *)v212;
            goto LABEL_346;
          }
        }
      }
      v162 = -[NSCoreTypesetter _createLineRefForParentLineRef:range:availableWidth:offset:paragraphArbitrator:lineBreakMode:hyphenated:forcedClusterBreak:](self, "_createLineRefForParentLineRef:range:availableWidth:offset:paragraphArbitrator:lineBreakMode:hyphenated:forcedClusterBreak:", &line, v159, v386, recta, v385, &v411, v161, v354);
      v163 = v162;
      if (!v162)
      {
        v157 = 0;
LABEL_359:
        location = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_375;
      }
      v164 = CTLineGetStringRange(v162);
      location = v164.location;
      v157 = v164.length;
LABEL_347:
      if (location == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_359;
      v165 = v379;
      if (theString != v356)
      {
        v165 = v379;
        if (Length != v460)
        {
          v165 = line ? 0 : (uint64_t)v344;
          if (!((unint64_t)line | (unint64_t)v344))
            v165 = -[__CFString attributesAtIndex:effectiveRange:](v378, "attributesAtIndex:effectiveRange:", v339, 0);
        }
      }
      v166 = rangeOfParagraphSeparatorAtIndex(Length, (UniChar *)&buffer, v157 + location);
      v168 = v167;
      v479 = 0.0;
      v480 = 0;
      v481 = 0.0;
      if (location)
        LOBYTE(v169) = 1;
      else
        v169 = !-[NSCoreTypesetter isBeginningOfDocument](self, "isBeginningOfDocument");
      LOBYTE(v332) = v169;
      -[NSCoreTypesetter _getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:](self, "_getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:", location, v157, v165, v378, v393 != 0, v166 + v168 != Length, v332);
      v479 = v171;
      v480 = v172;
      v481 = v173;
      if (v163 && v451)
        __NSCoreTypesetterAdjustLineHeightAndBaselineForTextAttachments(v163, &v479, (double *)&v480);
      v489.origin.y = y;
      v489.origin.x = x;
      v489.size.width = v353;
      v489.size.height = height;
      if (CGRectGetHeight(v489) <= 0.0 || v95)
      {
        v174 = v479;
      }
      else
      {
        v175 = -[NSCoreTypesetter forcedLineBreaks](self, "forcedLineBreaks");
        v174 = v479;
        if (!v175)
        {
          v176 = v476.y;
          v490.origin.y = y;
          v490.origin.x = x;
          v490.size.width = v353;
          v490.size.height = height;
          if (v176 + v174 > CGRectGetHeight(v490))
            goto LABEL_375;
        }
      }
      rect1.origin = v476;
      v177 = 0.0;
      if (v161 < 10000000.0 && v161 > 0.0)
        v177 = v161;
      rect1.size.width = v177;
      rect1.size.height = v174;
      *(double *)&v412 = v446;
      *((_QWORD *)&v412 + 1) = v480;
      v476.x = 0.0;
      v476.y = rect1.origin.y + v174 + v481;
      v477 = (CGSize)0;
LABEL_375:
      v492.origin.y = v373;
      v492.origin.x = v374;
      v492.size.height = v371;
      v492.size.width = v372;
      if (CGRectEqualToRect(rect1, v492))
        break;
      v179 = v416;
      if ((!v384 || !v140) && !*(_BYTE *)(v416 + 145))
        goto LABEL_432;
      v410 = 0.0;
      v180 = *(const __CTLine **)(v416 + 32);
      if (v180
        && (v181 = CTLineGetTypographicBounds(v180, 0, 0, 0),
            v179 = v416,
            v182 = *(const __CTLine **)(v416 + 32),
            v410 = v181,
            v409 = 0.0,
            v182))
      {
        v183 = CTLineGetTrailingWhitespaceWidth(v182);
        v179 = v416;
      }
      else
      {
        v183 = 0.0;
      }
      v409 = v183;
      if (!*(_BYTE *)(v179 + 145))
      {
        v186 = 0;
        v185 = v410 - v183;
        goto LABEL_398;
      }
      if (*(_QWORD *)(v179 + 32) && *(_BYTE *)(v179 + 144))
      {
        if (v393)
        {
          if (-[NSParagraphStyle isFullyJustified](v393, "isFullyJustified"))
            goto LABEL_388;
LABEL_392:
          v184 = 0;
        }
        else
        {
          if (!objc_msgSend(-[NSTypesetter defaultParagraphStyle](self, "defaultParagraphStyle"), "isFullyJustified"))goto LABEL_392;
LABEL_388:
          v184 = *(_QWORD *)(v416 + 48) + *(_QWORD *)(v416 + 40) < *(_QWORD *)(v416 + 64) + *(_QWORD *)(v416 + 56);
        }
        __NSCoreTypesetterHyphenateLine(v416 + 32, (uint64_t)-[NSCoreTypesetter softHyphen](self, "softHyphen"), v184, &v410, &v409);
        v183 = v409;
        v179 = v416;
        v187 = *(unsigned __int8 *)(v416 + 145);
        v185 = v410 - v409;
        v410 = v410 - v409;
        if (!v187)
          goto LABEL_397;
        goto LABEL_394;
      }
      v185 = v410 - v183;
      v410 = v410 - v183;
LABEL_394:
      if (*(_QWORD *)(v179 + 32) && *(double *)(v179 + 112) > 0.0)
      {
        v186 = __NSCoreTypesetterTruncateLine((uint64_t)self, (CTLineRef *)(v179 + 32), *(void **)(v179 + 72), *(_QWORD *)(v179 + 80), 0, &v410, &v409, *(double *)(v179 + 112));
        PenOffsetForFlush = CTLineGetPenOffsetForFlush(*(CTLineRef *)(v416 + 32), *(CGFloat *)(v416 + 88), *(double *)(v416 + 112));
        *(double *)(v416 + 128) = PenOffsetForFlush + *(double *)(v416 + 128);
        v183 = v409;
        v185 = v410;
        goto LABEL_398;
      }
LABEL_397:
      v186 = 0;
LABEL_398:
      v410 = v183 + v185;
      if (v140 == 1 && -[NSCoreTypesetter _shouldShowLineBadges](self, "_shouldShowLineBadges"))
      {
        v189 = -[NSParagraphArbitrator debugString](recta, "debugString");
        if (v189)
        {
          *(double *)&v190 = COERCE_DOUBLE((uint64_t)+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 9.0));
          if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery](NSTextGraphicsContextProvider, "textGraphicsContextProviderClassRespondsToColorQuery"))
          {
            v191 = (objc_class *)-[objc_class colorClassForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "colorClassForApplicationFrameworkContext:", v350);
          }
          else
          {
            v191 = +[NSTextGraphicsContextProvider __defaultColorClass](NSTextGraphicsContextProvider, "__defaultColorClass");
          }
          v213 = v191;
          v214 = -[objc_class blackColor](v191, "blackColor");
          *(double *)&v215 = COERCE_DOUBLE(-[objc_class systemYellowColor](v213, "systemYellowColor"));
          *(_QWORD *)&v478[0] = CFSTR("NSFont");
          *(_QWORD *)&v478[1] = CFSTR("NSColor");
          v479 = *(double *)&v190;
          v480 = v214;
          *(_QWORD *)&v478[2] = CFSTR("NSBackgroundColor");
          v481 = *(double *)&v215;
          v216 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v479, v478, 3);
          v189 = (const __CFAttributedString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v189, v216);
        }
      }
      else
      {
        v189 = 0;
      }
      v192 = v416;
      if (v384)
      {
        v193 = *(_QWORD *)(v416 + 40);
        v194 = *(double *)(v416 + 120);
        v195 = *(double *)(v416 + 128);
        v197 = *(double *)(v416 + 96);
        v196 = *(double *)(v416 + 104);
        v198 = *(double *)(v416 + 112);
        v199 = v410;
        v200 = -[NSTypesetter applicationFrameworkContext](self, "applicationFrameworkContext");
        if (v199 <= v198 || v198 <= 0.0)
          v202 = v199;
        else
          v202 = v198;
        v203 = *(double *)(v416 + 136);
        v407[0] = MEMORY[0x1E0C809B0];
        v407[1] = 3221225472;
        v407[2] = __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_7;
        v407[3] = &unk_1E26055E0;
        v407[6] = &v415;
        v408 = v186;
        v407[4] = v189;
        v407[5] = self;
        __NSCoreTypesetterProcessTextLineFragment((uint64_t)v378, (uint64_t)theString, v379, v193, location - v193, v200, (uint64_t)v407, 0.0, v203, v195 + v197, v196, v202, v194, v355);
        v192 = v416;
        width = v361;
      }
      else
      {
        if (*(_BYTE *)(v416 + 145))
        {
          v204 = *(const __CTLine **)(v416 + 32);
          if (v204)
          {
            v206 = *(double *)(v416 + 128);
            v205 = *(double *)(v416 + 136);
            v207 = *(double *)(v416 + 112);
            if (v207 <= 0.0 || v410 <= v207)
            {
              v208 = v143;
              v211 = v335;
              v209 = v336;
              v210 = v337;
              v359 = v338;
            }
            else
            {
              v208 = v143;
              v479 = 0.0;
              v478[0] = 0.0;
              +[NSCoreTypesetter _maximumAscentAndDescentForRuns:ascender:descender:](NSCoreTypesetter, "_maximumAscentAndDescentForRuns:ascender:descender:", CTLineGetGlyphRuns(v204), &v479, v478);
              v209 = x;
              v359 = y - v479;
              v210 = height + v479 - v478[0];
              v192 = v416;
              v204 = *(const __CTLine **)(v416 + 32);
              v211 = v353;
            }
            v217 = *(double *)(v192 + 96);
            v218 = *(double *)(v192 + 104);
            v219 = -[NSTypesetter applicationFrameworkContext](self, "applicationFrameworkContext");
            v403[0] = MEMORY[0x1E0C809B0];
            v403[1] = 3221225472;
            v403[2] = __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_8;
            v403[3] = &unk_1E2605608;
            v406 = v365;
            *(double *)&v403[8] = y + v218;
            v404 = v206 + x + v217;
            v405 = v205 + y + v218;
            v403[4] = &v462;
            v403[5] = &v466;
            v403[6] = &v453;
            v403[7] = &v415;
            __NSCoreTypesetterRenderLineAndAttachments(v204, a6, v219, v451, v189, (uint64_t)v340, v365, (uint64_t)v403, v404, v405, v209, v359, v211, v210);
            v192 = v416;
            width = v361;
            v143 = v208;
          }
        }
        if (v347)
        {
          v220 = *(double *)(v192 + 128);
          v221 = v346;
          if (v346 > v220)
            v221 = *(double *)(v192 + 128);
          v346 = v221;
          v222 = v220 + v410;
          if (v342 < v222)
            v342 = v222;
        }
      }
      v223 = *(const void **)(v192 + 32);
      if (v223)
        CFRelease(v223);
      *(_QWORD *)(v192 + 32) = 0;
      *(_BYTE *)(v192 + 145) = 0;
LABEL_432:
      v224 = v411;
      origin = rect1.origin;
      size = rect1.size;
      v227 = v393;
      v228 = v412;
      if (!v393)
      {
        v357 = v412;
        v358 = rect1.size;
        v360 = rect1.origin;
        v227 = +[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle");
        size = v358;
        origin = v360;
        v228 = v357;
      }
      v229 = v416;
      *(_QWORD *)(v416 + 32) = v163;
      *(_QWORD *)(v229 + 40) = location;
      *(_QWORD *)(v229 + 48) = v157;
      *(double *)(v229 + 56) = *(double *)&v388;
      *(_QWORD *)(v229 + 64) = v392;
      *(_QWORD *)(v229 + 72) = v227;
      *(_QWORD *)(v229 + 80) = v385;
      *(_QWORD *)(v229 + 88) = 0;
      *(CGPoint *)(v229 + 96) = origin;
      *(CGSize *)(v229 + 112) = size;
      *(_OWORD *)(v229 + 128) = v228;
      *(_BYTE *)(v229 + 144) = v224;
      *(_BYTE *)(v229 + 145) = 1;
      if (v163)
      {
        v230 = CTLineGetTypographicBounds(v163, 0, 0, 0);
        v231 = v230 - CTLineGetTrailingWhitespaceWidth(*(CTLineRef *)(v416 + 32));
      }
      else
      {
        v231 = 0.0;
      }
      v147 = rect1.size.width;
      if (rect1.size.width > 0.0)
      {
        v232 = -[NSParagraphStyle spansAllLines](v393, "spansAllLines", rect1.size.width);
        if (v393)
        {
          if (!-[NSParagraphStyle isFullyJustified](v393, "isFullyJustified"))
            goto LABEL_454;
LABEL_442:
          v233 = *(_QWORD *)(v416 + 40);
          v234 = *(_QWORD *)(v416 + 48);
          v235 = *(_QWORD *)(v416 + 56);
          v236 = *(_QWORD *)(v416 + 64);
          v237 = rect1.size.width;
          v238 = -[NSParagraphArbitrator mayCompressLines](recta, "mayCompressLines");
          if (v231 <= v237)
          {
            if (v234 + v233 == v236 + v235)
              v238 = v232;
            else
              v238 = 1;
          }
          if (*(_BYTE *)(v416 + 145))
          {
            v239 = *(_QWORD *)(v416 + 32) ? v238 : 0;
            if (v239 == 1)
            {
              v240 = CTLineCreateJustifiedLine(*(CTLineRef *)(v416 + 32), 1.0, rect1.size.width);
              if (v240)
              {
                CFRelease(*(CFTypeRef *)(v416 + 32));
                *(_QWORD *)(v416 + 32) = v240;
              }
            }
          }
          if (v393)
          {
LABEL_454:
            v241 = -[NSParagraphStyle _alignmentFollowsWritingDirection](v393, "_alignmentFollowsWritingDirection");
            v242 = -[NSParagraphStyle horizontalAlignment](v393, "horizontalAlignment");
LABEL_456:
            v147 = _flushFactorFromAlignment(v242, v381, (uint64_t)line, ((unint64_t)a9 >> 9) & 1 | v241, v351);
            *(double *)(v416 + 88) = v147;
            goto LABEL_457;
          }
        }
        else if (objc_msgSend(-[NSTypesetter defaultParagraphStyle](self, "defaultParagraphStyle"), "isFullyJustified"))
        {
          goto LABEL_442;
        }
        v241 = objc_msgSend(-[NSTypesetter defaultParagraphStyle](self, "defaultParagraphStyle"), "_alignmentFollowsWritingDirection");
        v242 = objc_msgSend(-[NSTypesetter defaultParagraphStyle](self, "defaultParagraphStyle"), "horizontalAlignment");
        goto LABEL_456;
      }
LABEL_457:
      if (!v140)
      {
        v147 = *(double *)(v416 + 104);
        v143 = v147 + *(double *)(v416 + 136);
      }
      v243 = v140 + 1;
      if (!line)
      {
        v144 = 0;
        v95 = 0;
        ++v140;
        goto LABEL_475;
      }
      if (v369 - 1 == v140)
      {
        v95 = 0;
        v144 = 0;
        v139 = v392 + v388;
        v140 = v369;
        goto LABEL_478;
      }
      v156 = 0;
      v244 = v157 + location;
      v245 = v386 + v159;
      if (v157 + location >= v386 + v159)
        v159 += v386;
      else
        v159 = v157 + location;
      ++v140;
      v144 = 0;
      v95 = 0;
      v249 = v245 >= v244;
      v247 = v245 - v244;
      v246 = v247 != 0 && v249;
      if (!v249)
        v247 = 0;
      v386 = v247;
      if (!v246)
      {
        v140 = v243;
        v144 = 0;
        v95 = 0;
        goto LABEL_475;
      }
    }
    if (v163)
      CFRelease(v163);
    v375 |= v370 ^ 1;
LABEL_475:
    v139 = v388;
LABEL_476:
    v139 += v392;
    if (v140 >= v369)
    {
LABEL_478:
      v248 = 0;
      v249 = v157 + location >= v139 && v139 >= Length;
      v250 = !v249;
      v138 = v250 | v375;
    }
    else
    {
      v248 = 1;
      v138 = v375;
    }
    v49 = v378;
    if ((v138 & 1) != 0 || v139 >= Length)
    {
      if (self->_wantsExtraLineFragment && (v370 & 1) != 0 && v384)
      {
        v266 = *(_QWORD *)(v416 + 40);
        v267 = *(double *)(v416 + 104);
        v268 = *(double *)(v416 + 112);
        v270 = *(double *)(v416 + 88);
        v269 = *(double *)(v416 + 96);
        v271 = *(double *)(v416 + 120);
        v272 = *(double *)(v416 + 128);
        v273 = -[NSTypesetter applicationFrameworkContext](self, "applicationFrameworkContext");
        v274 = *(double *)(v416 + 136);
        v402[0] = MEMORY[0x1E0C809B0];
        v402[1] = 3221225472;
        v402[2] = __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_9;
        v402[3] = &unk_1E2605468;
        v402[4] = self;
        __NSCoreTypesetterProcessTextLineFragment((uint64_t)v378, (uint64_t)theString, v379, v266, Length - v266, v273, (uint64_t)v402, v269 + v268 * v270 + v272 - (v269 + v268 * v270 + v272), v274, v269 + v268 * v270 + v272, v267, 0.0, v271, v355);
        v137 = 0;
        width = v361;
      }
      else
      {
        v137 = 0;
      }
      continue;
    }
    v251 = rangeOfParagraphSeparatorAtIndex(Length, (UniChar *)&buffer, v139);
    v139 = v251 + v253;
    v254 = v251 + v253 == Length;
    v255 = v248 ^ 1;
    if (!line)
      v255 = 1;
    if ((v255 & 1) == 0)
    {
      CFRelease(line);
      line = 0;
    }
    if (v139 >= Length)
    {
LABEL_532:
      v392 = 0;
      if (*(double *)&v139 == 0.0)
        goto LABEL_536;
      goto LABEL_533;
    }
    v256 = v139;
    v392 = 0;
    while (2)
    {
      v257 = v437;
      if ((uint64_t)v437 <= v256)
        goto LABEL_508;
      p_buffer = (__int128 *)*((_QWORD *)&v435 + 1);
      if (*((_QWORD *)&v435 + 1))
      {
        v259 = *((_QWORD *)&v436 + 1) + v256;
        goto LABEL_496;
      }
      if ((_QWORD)v436)
      {
        v260 = *(char *)(v436 + *((_QWORD *)&v436 + 1) + v256);
      }
      else
      {
        v263 = *((_QWORD *)&v437 + 1);
        if (v438 <= v256 || *((_QWORD *)&v437 + 1) > v256)
        {
          v265 = v256 - 4;
          if ((unint64_t)v256 < 4)
            v265 = 0;
          if (v265 + 64 < (uint64_t)v437)
            v257 = v265 + 64;
          *((_QWORD *)&v437 + 1) = v265;
          v438 = v257;
          v483.location = *((_QWORD *)&v436 + 1) + v265;
          v483.length = v257 - v265;
          CFStringGetCharacters((CFStringRef)v435, v483, (UniChar *)&buffer);
          v263 = *((_QWORD *)&v437 + 1);
        }
        v259 = v256 - v263;
        p_buffer = &buffer;
LABEL_496:
        v260 = *((_WORD *)p_buffer + v259);
      }
      v261 = v260 > 0xDu || ((1 << v260) & 0x3400) == 0;
      v262 = v261 && v260 - 8232 >= 2;
      if (v262 && v260 != 133)
      {
LABEL_508:
        v256 = ++v392 + v139;
        if (v392 + v139 >= Length)
          break;
        continue;
      }
      break;
    }
    if (!v392)
      goto LABEL_532;
    v275 = -[NSCoreTypesetter layoutOrientation](self, "layoutOrientation");
    v276 = -[NSCoreTypesetter limitsLayoutForSuspiciousContents](self, "limitsLayoutForSuspiciousContents");
    line = __NSCoreTypesetterCreateBaseLineFromAttributedString(v349, v139, v392, v275, v276, (uint64_t)v451);
    v277 = CTLineGetTypographicBounds(line, 0, 0, 0);
    TrailingWhitespaceWidth = CTLineGetTrailingWhitespaceWidth(line);
    v458 = v277 - TrailingWhitespaceWidth;
    v252 = v353;
    if (v353 > 0.0)
    {
      v278 = v393;
      if (v378)
        v278 = -[NSCoreTypesetter _paragraphStyleFromAttributes:](self, "_paragraphStyleFromAttributes:", -[__CFString attributesAtIndex:effectiveRange:](v378, "attributesAtIndex:effectiveRange:", v139, 0, v353));
      v343 = -[NSCoreTypesetter _getFirstOverflowTabStopIndexInLineRef:range:string:paragraphStyle:availableWidth:offset:](self, "_getFirstOverflowTabStopIndexInLineRef:range:string:paragraphStyle:availableWidth:offset:", line, v139, v392, theString, v278, v353, 0.0) != 0x7FFFFFFFFFFFFFFFLL;
    }
    if (*(double *)&v139 == 0.0)
    {
LABEL_536:
      if (v393)
        -[NSParagraphStyle paragraphSpacing](v393, "paragraphSpacing", v252);
      else
        v280 = 0.0;
      v144 = 1;
      goto LABEL_540;
    }
LABEL_533:
    CharacterAtIndex = CFStringGetCharacterAtIndex(theString, v139 - 1);
    if (CharacterAtIndex == 10 || CharacterAtIndex == 8233 || CharacterAtIndex == 13)
      goto LABEL_536;
    v144 = 0;
    v280 = 0.0;
LABEL_540:
    v137 = v254 | v370;
    v147 = v280 + v476.y;
    v476.y = v147;
  }
  while ((v138 & 1) == 0 && (v139 < Length) | v137 & 1);
  v281 = v416;
  if (!*(_BYTE *)(v416 + 145))
    goto LABEL_617;
  if (!*(_QWORD *)(v416 + 32))
  {
    if (v347)
    {
      v147 = v342 - v346;
      v284 = *(double *)(v416 + 104) + *(double *)(v416 + 120);
      v474.width = v342 - v346;
      v474.height = v284;
    }
    goto LABEL_617;
  }
  rect1.origin.x = 0.0;
  v479 = 0.0;
  if (!v362)
  {
    v283 = v138 ^ 1;
    v282 = *(_QWORD *)(v416 + 80);
LABEL_554:
    v285 = 1;
    goto LABEL_570;
  }
  if (!-[NSCoreTypesetter wantsExtraLineFragment](self, "wantsExtraLineFragment"))
  {
    if (v138 & 1 | (*(double *)(v416 + 120) + *(double *)(v416 + 104) + *(double *)(v416 + 120) > height))
      goto LABEL_556;
LABEL_550:
    LOBYTE(v138) = 0;
    v281 = v416;
    v282 = *(_QWORD *)(v416 + 80);
    v283 = 1;
    goto LABEL_554;
  }
  if ((v138 & 1) == 0)
    goto LABEL_550;
LABEL_556:
  if (objc_msgSend(a10, "wrapsForTruncationMode"))
  {
    v282 = objc_msgSend(*(id *)(v416 + 72), "lineBreakMode");
  }
  else if (v348 >= 3)
  {
    v282 = 4;
  }
  else
  {
    v282 = v352;
  }
  v281 = v416;
  if (line
    && (v286 = *(_QWORD *)(v416 + 40),
        v287 = *(_QWORD *)(v416 + 56),
        *(_QWORD *)(v416 + 48) + v286 < (unint64_t)(*(_QWORD *)(v416 + 64) + v287))
    && (v286 != v287 ? (v288 = CTLineCreateFromLineWithOffset()) : (v288 = (uint64_t)CFRetain(line)),
        v289 = v288,
        v281 = v416,
        v288))
  {
    CFRelease(*(CFTypeRef *)(v416 + 32));
    v283 = 0;
    v285 = 0;
    v281 = v416;
    *(_QWORD *)(v416 + 32) = v289;
    *(_BYTE *)(v281 + 144) = 0;
  }
  else
  {
    v283 = 0;
    v285 = 0;
  }
  LOBYTE(v138) = 1;
LABEL_570:
  rect1.origin.x = CTLineGetTypographicBounds(*(CTLineRef *)(v281 + 32), 0, 0, 0);
  v290 = CTLineGetTrailingWhitespaceWidth(*(CTLineRef *)(v416 + 32));
  v479 = v290;
  v291 = v416;
  if (*(_BYTE *)(v416 + 145) && *(_QWORD *)(v416 + 32) && *(_BYTE *)(v416 + 144))
  {
    __NSCoreTypesetterHyphenateLine(v416 + 32, (uint64_t)-[NSCoreTypesetter softHyphen](self, "softHyphen"), 0, &rect1.origin.x, &v479);
    v290 = v479;
    v291 = v416;
  }
  v292 = rect1.origin.x - v290;
  rect1.origin.x = v292;
  v293 = *(double *)(v291 + 112);
  if (v293 <= 0.0 || v293 >= v292)
  {
    if ((v285 & 1) != 0)
    {
      v299 = 0;
      v297 = 0.0;
      v298 = v384;
      goto LABEL_587;
    }
    v295 = v282 - 3;
    v298 = v384;
  }
  else
  {
    v294 = v362 ^ 1;
    v295 = v282 - 3;
    if ((unint64_t)(v282 - 3) < 3)
      v294 = 1;
    v296 = v283 | v294;
    v297 = 0.0;
    if ((unint64_t)(v282 - 3) < 3)
      v297 = *(double *)(v291 + 112);
    v298 = v384;
    if ((v296 & 1) != 0)
    {
      v299 = 0;
      goto LABEL_587;
    }
  }
  v299 = v295 < 3;
  v297 = 0.0;
  if (v295 < 3)
    v297 = *(double *)(v291 + 112);
LABEL_587:
  v300 = __NSCoreTypesetterTruncateLine((uint64_t)self, (CTLineRef *)(v291 + 32), *(void **)(v291 + 72), v282, v299, &rect1.origin.x, &v479, v297);
  if (v293 > 0.0 && v293 < 10000000.0)
  {
    v301 = CTLineGetPenOffsetForFlush(*(CTLineRef *)(v416 + 32), *(CGFloat *)(v416 + 88), *(double *)(v416 + 112));
    *(double *)(v416 + 128) = v301 + *(double *)(v416 + 128);
  }
  v302 = v416;
  if (v298)
  {
    v303 = *(const __CTLine **)(v416 + 32);
    if (v303)
    {
      v304 = CTLineGetStringRange(v303).length;
      v302 = v416;
      v305 = *(_QWORD *)(v416 + 40);
    }
    else
    {
      v305 = *(_QWORD *)(v416 + 40);
      v304 = Length - v305;
    }
    if (v305 + v304 == *(_QWORD *)(v302 + 64) + *(_QWORD *)(v302 + 56))
    {
      *(_QWORD *)&v478[0] = v305 + v304;
      v317 = (void *)-[__CFString string](v378, "string");
      objc_msgSend(v317, "getParagraphStart:end:contentsEnd:forRange:", 0, v478, 0, *(_QWORD *)&v478[0] - 1, 1);
      if (*(_QWORD *)&v478[0] > (unint64_t)(v305 + v304))
        v304 = *(_QWORD *)&v478[0] - v305;
      v302 = v416;
    }
    v318 = v479 + rect1.origin.x;
    if (v479 + rect1.origin.x <= v293 || v293 <= 0.0)
      v320 = v479 + rect1.origin.x;
    else
      v320 = v293;
    rect1.origin.x = v479 + rect1.origin.x;
    if (v318 > v293)
      rect1.origin.x = v293;
    v321 = *(double *)(v302 + 120);
    v322 = *(double *)(v302 + 128);
    v324 = *(double *)(v302 + 96);
    v323 = *(double *)(v302 + 104);
    v325 = -[NSTypesetter applicationFrameworkContext](self, "applicationFrameworkContext");
    v326 = *(double *)(v416 + 136);
    v399[0] = MEMORY[0x1E0C809B0];
    v399[1] = 3221225472;
    v399[2] = __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_10;
    v399[3] = &unk_1E2605630;
    v400 = v300;
    v401 = v138 & 1;
    v399[5] = &v415;
    v399[4] = self;
    __NSCoreTypesetterProcessTextLineFragment((uint64_t)v378, (uint64_t)theString, v379, v305, v304, v325, (uint64_t)v399, 0.0, v326, v322 + v324, v323, v320, v321, v355);
    v312 = v416;
  }
  else
  {
    v306 = *(double *)(v416 + 128);
    v307 = *(double *)(v416 + 136);
    if (v293 > 0.0 && rect1.origin.x > *(double *)(v416 + 112))
    {
      v478[0] = 0.0;
      *(_QWORD *)&v412 = 0;
      +[NSCoreTypesetter _maximumAscentAndDescentForRuns:ascender:descender:](NSCoreTypesetter, "_maximumAscentAndDescentForRuns:ascender:descender:", CTLineGetGlyphRuns(*(CTLineRef *)(v416 + 32)), v478, &v412);
      v337 = height + v478[0] - *(double *)&v412;
      v338 = y - v478[0];
      v302 = v416;
      v335 = v353;
      v336 = x;
    }
    v308 = *(double *)(v302 + 96);
    v309 = *(double *)(v302 + 104);
    v310 = *(const __CTLine **)(v302 + 32);
    v311 = -[NSTypesetter applicationFrameworkContext](self, "applicationFrameworkContext");
    v395[0] = MEMORY[0x1E0C809B0];
    v395[1] = 3221225472;
    v395[2] = __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_11;
    v395[3] = &unk_1E2605590;
    v398 = v365;
    *(double *)&v395[6] = y + v309;
    v396 = v306 + x + v308;
    v397 = v307 + y + v309;
    v395[4] = &v462;
    v395[5] = &v466;
    __NSCoreTypesetterRenderLineAndAttachments(v310, a6, v311, v451, 0, (uint64_t)v340, v365, (uint64_t)v395, v396, v397, v336, v338, v335, v337);
    v312 = v416;
    if ((v347 & 1) != 0)
    {
      v313 = *(double *)(v416 + 128);
      v314 = v346;
      if (v346 > v313)
        v314 = *(double *)(v416 + 128);
      v315 = v313 + rect1.origin.x;
      if (v342 >= v315)
        v315 = v342;
      v316 = *(double *)(v416 + 104) + *(double *)(v416 + 120);
      v474.width = v315 - v314;
      v474.height = v316;
    }
  }
  CFRelease(*(CFTypeRef *)(v312 + 32));
LABEL_617:
  if (v353 > 0.0)
  {
    v147 = v474.width;
    if (v474.width > v353)
      v474.width = v353;
  }
  if (objc_msgSend(a10, "wantsBaselineOffset", v147))
  {
    objc_msgSend(a10, "setBaselineOffset:", *(double *)(v416 + 104) + *(double *)(v416 + 136));
    objc_msgSend(a10, "setFirstBaselineOffset:", v143);
  }
  objc_msgSend(a10, "setNumberOfLineFragments:", v140);
  objc_msgSend(a10, "setTotalBounds:", v473, v474);
  -[NSParagraphArbitrator reset](recta, "reset");
  if (a11)
    a11->var0 = 3;
  _Block_object_dispose(&v415, 8);
LABEL_625:
  if (line)
    CFRelease(line);
  -[_NSCoreTypesetterLayoutCache setCTLine:attachmentLayoutContext:validForDrawing:]((uint64_t)v345, cf, v451, v450);
  if (cf)
    CFRelease(cf);
LABEL_629:
  if (a11)
    a11->var1 = v454[3];
  -[_NSTextAttachmentLayoutContext setTextContainer:](v451, "setTextContainer:", 0);

  _Block_object_dispose(&v453, 8);
LABEL_632:
  if (v365)
  {
    v327 = v467[4];
    v467[5] = v463[3] + v467[5];
    objc_msgSend(a10, "setMultilineDeviceMetricsRect:", v327);
  }
LABEL_634:
  _Block_object_dispose(&v462, 8);
  _Block_object_dispose(&v466, 8);
  v329 = *((double *)&v473 + 1);
  v328 = *(double *)&v473;
  v331 = v474.height;
  v330 = v474.width;
  result.size.height = v331;
  result.size.width = v330;
  result.origin.y = v329;
  result.origin.x = v328;
  return result;
}

- (BOOL)isSimpleRectangularTextContainerForStartingCharacterAtIndex:(int64_t)a3
{
  BOOL v5;

  if (isSimpleRectangularTextContainerForStartingCharacterAtIndex__onceToken != -1)
    dispatch_once(&isSimpleRectangularTextContainerForStartingCharacterAtIndex__onceToken, &__block_literal_global_47);
  if (isSimpleRectangularTextContainerForStartingCharacterAtIndex__forcesNonSimple)
    v5 = 1;
  else
    v5 = !self->_delegateSupportsTextContainer;
  if (v5)
    return isSimpleRectangularTextContainerForStartingCharacterAtIndex__forcesNonSimple == 0;
  else
    return -[NSCoreTypesetterDelegateInternal coreTypesetter:isSimpleRectangularTextContainerForStartingCharacterAtIndex:](self->_delegate, "coreTypesetter:isSimpleRectangularTextContainerForStartingCharacterAtIndex:", self, a3);
}

void *__131__NSCoreTypesetter__getLineMetricsForRange_attributes_attributedString_applySpacing_usesSystemFontLeading_usesNegativeFontLeading___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *result;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t v22;

  if (*(_BYTE *)(a1 + 88)
    || (result = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSAttachment"))) == 0)
  {
    if (!a2)
      goto LABEL_11;
    if (*(_BYTE *)(a1 + 89) || (v4 = (void *)objc_msgSend(a2, "objectForKey:", _NSOriginalFontAttributeName)) == 0)
      v4 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("NSFont"));
    if (objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("CTVerticalForms")), "BOOLValue"))
      v4 = (void *)objc_msgSend(v4, "verticalFont");
    if (!v4)
LABEL_11:
      v4 = (void *)NSDefaultFont();
    v6 = (uint64_t)v4;
    if ((*(_BYTE *)(a1 + 72) & 1) != 0)
      v6 = objc_msgSend(v4, "verticalFont");
    if (v6)
      v4 = (void *)v6;
    if (!v4)
      v4 = (void *)NSDefaultFont();
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_msgSend(objc_loadWeak((id *)(a1 + 64)), "_paragraphStyleFromAttributes:", a2);
    objc_msgSend(v4, "_defaultLineHeightForUILayout");
    v7 = 0.0;
    v9 = v8 + 0.0;
    objc_msgSend(v4, "ascender");
    v11 = v10;
    if (*(_BYTE *)(a1 + 92) && (objc_msgSend(v4, "isVertical") & 1) == 0)
      v11 = floor(v9 * 0.5);
    result = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSBaselineOffset"));
    if (result)
    {
      result = (void *)objc_msgSend(result, "doubleValue");
      v7 = v12 + 0.0;
    }
    if (*(_BYTE *)(a1 + 91) || *(_BYTE *)(a1 + 93) || *(_BYTE *)(a1 + 94))
    {
      if (*(_BYTE *)(a1 + 94) || (result = (void *)CTFontIsSystemUIFont(), v12 = 0.0, (_DWORD)result))
      {
        result = (void *)objc_msgSend(v4, "_leading", v12);
        if (*(_BYTE *)(a1 + 93))
        {
          if (!*(_BYTE *)(a1 + 91) && v12 > 0.0 && *(_BYTE *)(a1 + 94) == 0)
            v12 = 0.0;
        }
        else if (v12 < 0.0)
        {
          v12 = 0.0;
        }
      }
    }
    else
    {
      v12 = 0.0;
    }
    v14 = v11 + fmin(v12, 0.0);
    v15 = v11 - v9;
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v11 - v9 < *(double *)(v16 + 24))
      *(double *)(v16 + 24) = v15;
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (v14 > *(double *)(v17 + 24))
      *(double *)(v17 + 24) = v14;
    if (v7 != 0.0)
    {
      v18 = v7 + v14;
      v15 = v15 + v7;
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (v15 < *(double *)(v19 + 24))
        *(double *)(v19 + 24) = v15;
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      if (v18 > *(double *)(v20 + 24))
        *(double *)(v20 + 24) = v18;
    }
    if (v12 < 0.0)
      v12 = 0.0;
    v21 = v12 - v15;
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (v21 > *(double *)(v22 + 24))
      *(double *)(v22 + 24) = v21;
  }
  return result;
}

- (id)_paragraphStyleFromAttributes:(id)a3
{
  id result;

  result = (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NSParagraphStyle"));
  if (!result)
    return -[NSTypesetter defaultParagraphStyle](self, "defaultParagraphStyle");
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)_getLineMetricsForRange:(_NSRange)a3 attributes:(id)a4 attributedString:(id)a5 applySpacing:(BOOL)a6 usesSystemFontLeading:(BOOL)a7 usesNegativeFontLeading:(BOOL)a8
{
  _BOOL4 v9;
  _BOOL8 v10;
  BOOL v11;
  BOOL v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double *v23;
  double v24;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  _BOOL4 v33;
  NSUInteger length;
  NSUInteger v38;
  char v39;
  _QWORD v40[2];
  void *(*v41)(uint64_t, void *);
  void *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t *v46;
  id v47[3];
  BOOL v48;
  BOOL v49;
  BOOL v50;
  BOOL v51;
  BOOL v52;
  BOOL v53;
  BOOL v54;
  id location;
  uint64_t v56;
  double *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  void (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  uint64_t v73;
  $1AB5FA073B851C12C2339EC22442E995 result;

  v33 = a6;
  length = a3.length;
  v38 = a3.location;
  v9 = -[NSTypesetter usesFontLeading](self, "usesFontLeading");
  v10 = -[NSCoreTypesetter layoutOrientation](self, "layoutOrientation") == 1;
  v11 = -[NSCoreTypesetter allowsFontSubstitutionAffectingVerticalMetrics](self, "allowsFontSubstitutionAffectingVerticalMetrics");
  v12 = -[NSCoreTypesetter allowsFontOverridingTextAttachmentVerticalMetrics](self, "allowsFontOverridingTextAttachmentVerticalMetrics");
  v13 = -[NSTypesetter typesetterBehavior](self, "typesetterBehavior");
  v68 = 0;
  v69 = &v68;
  v70 = 0x3052000000;
  v71 = __Block_byref_object_copy__10;
  v72 = __Block_byref_object_dispose__10;
  v73 = 0;
  v64 = 0;
  v65 = (double *)&v64;
  v66 = 0x2020000000;
  v67 = 0;
  v60 = 0;
  v61 = (double *)&v60;
  v62 = 0x2020000000;
  v63 = 0;
  v56 = 0;
  v57 = (double *)&v56;
  v58 = 0x2020000000;
  v59 = 0;
  objc_initWeak(&location, self);
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v41 = __131__NSCoreTypesetter__getLineMetricsForRange_attributes_attributedString_applySpacing_usesSystemFontLeading_usesNegativeFontLeading___block_invoke;
  v42 = &unk_1E2605490;
  v48 = v12;
  v49 = v11;
  v47[1] = (id)(v10 | 2);
  v43 = &v68;
  objc_copyWeak(v47, &location);
  v50 = !v9;
  v51 = a7;
  v52 = v10;
  v53 = a8;
  v54 = v9;
  v44 = &v60;
  v45 = &v64;
  v46 = &v56;
  v47[2] = v13;
  if (!a4 && length && v38 + length <= objc_msgSend(a5, "length"))
  {
    objc_msgSend(a5, "enumerateAttributesInRange:options:usingBlock:", v38, length, 0x100000, v40);
  }
  else
  {
    v39 = 0;
    ((void (*)(_QWORD *, id, NSUInteger, NSUInteger, char *))v41)(v40, a4, v38, length, &v39);
  }
  v14 = v65[3] - v61[3];
  v15 = (void *)v69[5];
  if (v15)
  {
    objc_msgSend(v15, "lineHeightMultiple");
    v17 = v16;
    objc_msgSend((id)v69[5], "minimumLineHeight");
    v19 = v18;
    objc_msgSend((id)v69[5], "maximumLineHeight");
    v21 = v20;
    v22 = 0.0;
    if (v33)
      objc_msgSend((id)v69[5], "lineSpacing", 0.0);
    if (v17 > 0.0)
    {
      v65[3] = v14 * v17 - v14 + v65[3];
      v14 = v14 * v17;
    }
  }
  else
  {
    v19 = 0.0;
    v21 = 0.0;
    v22 = 0.0;
  }
  if (v14 >= v19)
    v19 = v14;
  else
    v65[3] = v19 - v14 + v65[3];
  if (v21 <= 0.0 || v19 <= v21)
    v21 = v19;
  else
    v65[3] = v65[3] - (v19 - v21);
  v23 = v57;
  v24 = v61[3] + v57[3];
  v57[3] = v24;
  if (v22 < 0.0)
  {
    v24 = v22 + v24;
    v23[3] = v24;
    if (v24 < 0.0)
    {
      v23[3] = 0.0;
      v24 = 0.0;
    }
  }
  if (v24 < v22 || v9)
    v26 = v22;
  else
    v26 = v24;
  v27 = 0.0;
  if (v9)
    v27 = v24;
  v28 = v21 + v27;
  v29 = v65[3];
  objc_destroyWeak(v47);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);
  v30 = v28;
  v31 = v29;
  v32 = v26;
  result.var2 = v32;
  result.var1 = v31;
  result.var0 = v30;
  return result;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (BOOL)allowsFontOverridingTextAttachmentVerticalMetrics
{
  return self->_allowsFontOverridingTextAttachmentVerticalMetrics;
}

- (BOOL)allowsFontSubstitutionAffectingVerticalMetrics
{
  return self->_allowsFontSubstitutionAffectingVerticalMetrics;
}

- (BOOL)requiresCTLineRef
{
  return self->_requiresCTLineRef;
}

- (int64_t)containerBreakMode
{
  return self->_containerBreakMode;
}

+ (BOOL)_allowsFontOverridingTextAttachmentVerticalMetricsForStringDrawing
{
  if (_allowsFontOverridingTextAttachmentVerticalMetricsForStringDrawing_onceToken != -1)
    dispatch_once(&_allowsFontOverridingTextAttachmentVerticalMetricsForStringDrawing_onceToken, &__block_literal_global_22);
  return _allowsFontOverridingTextAttachmentVerticalMetricsForStringDrawing__allowsFontOverridingTextAttachmentVerticalMetricsForStringDrawing;
}

- (void)setAllowsFontOverridingTextAttachmentVerticalMetrics:(BOOL)a3
{
  self->_allowsFontOverridingTextAttachmentVerticalMetrics = a3;
}

- (BOOL)limitsLayoutForSuspiciousContents
{
  return self->_limitsLayoutForSuspiciousContents;
}

- (BOOL)breaksLinesForInteractiveText
{
  return self->_breaksLinesForInteractiveText;
}

- (BOOL)usesDefaultHyphenation
{
  return self->_usesDefaultHyphenation;
}

- (BOOL)_shouldShowLineBadges
{
  if (_shouldShowLineBadges_once != -1)
    dispatch_once(&_shouldShowLineBadges_once, &__block_literal_global_62_0);
  return _shouldShowLineBadges_result;
}

- (NSDictionary)_extraLineFragmentAttributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTextContainerSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->textContainerSize, &v3, 16, 1, 0);
}

- (void)setEnforcesMinimumTextLineFragment:(BOOL)a3
{
  self->_enforcesMinimumTextLineFragment = a3;
}

+ (void)_lineMetricsForAttributes:(id)a3 typesetterBehavior:(int64_t)a4 usesFontLeading:(BOOL)a5 applySpacings:(BOOL)a6 usesSystemFontLeading:(BOOL)a7 usesNegativeFontLeading:(BOOL)a8 layoutOrientation:(int64_t)a9 lineHeight:(double *)a10 baselineOffset:(double *)a11 spacing:(double *)a12
{
  _BOOL8 v13;
  _BOOL8 v14;
  _BOOL8 v15;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSCoreTypesetter *v22;

  v13 = a7;
  v14 = a6;
  v15 = a5;
  v22 = objc_alloc_init(NSCoreTypesetter);
  -[NSTypesetter setTypesetterBehavior:](v22, "setTypesetterBehavior:", a4);
  -[NSTypesetter setUsesFontLeading:](v22, "setUsesFontLeading:", v15);
  -[NSCoreTypesetter setLayoutOrientation:](v22, "setLayoutOrientation:", a9);
  -[NSCoreTypesetter setAllowsFontSubstitutionAffectingVerticalMetrics:](v22, "setAllowsFontSubstitutionAffectingVerticalMetrics:", 0);
  LOBYTE(v21) = a8;
  -[NSCoreTypesetter _getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:](v22, "_getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:", 0, 0, a3, 0, v14, v13, v21);
  if (a10)
    *(_QWORD *)a10 = v18;
  if (a11)
    *(_QWORD *)a11 = v19;
  if (a12)
    *(_QWORD *)a12 = v20;

}

- (NSCoreTypesetter)init
{
  NSCoreTypesetter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSCoreTypesetter;
  result = -[NSCoreTypesetter init](&v3, sel_init);
  if (result)
  {
    result->characterRange.location = 0;
    result->characterRange.length = 0;
    result->textContainerSize = (CGSize)*MEMORY[0x1E0CB3440];
    result->_laidOutLineFragment = 0;
    result->_wantsExtraLineFragment = 1;
    result->_limitsLayoutForSuspiciousContents = 1;
    result->_allowsFontSubstitutionAffectingVerticalMetrics = 1;
    result->_allowsFontOverridingTextAttachmentVerticalMetrics = 1;
    result->_beginningOfDocument = 1;
    result->_keyframe = 0;
    result->_forcedLineBreaks = 0;
  }
  return result;
}

- (void)setLayoutOrientation:(int64_t)a3
{
  self->_layoutOrientation = a3;
}

- (void)setAllowsFontSubstitutionAffectingVerticalMetrics:(BOOL)a3
{
  self->_allowsFontSubstitutionAffectingVerticalMetrics = a3;
}

- (void)dealloc
{
  objc_super v3;

  self->_delegate = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCoreTypesetter;
  -[NSTypesetter dealloc](&v3, sel_dealloc);
}

uint64_t __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (__CTLine)_createLineRefForParentLineRef:(const __CTLine *)a3 range:(_NSRange)a4 availableWidth:(double)a5 offset:(double)a6 paragraphArbitrator:(id)a7 lineBreakMode:(int64_t)a8 hyphenated:(BOOL *)a9 forcedClusterBreak:(BOOL *)a10
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  NSCoreTypesetterDelegate *v21;
  NSCoreTypesetterDelegate *v22;
  unint64_t v23;
  NSUInteger v27;

  length = a4.length;
  location = a4.location;
  v27 = a4.length;
  if (-[NSCoreTypesetter forcedLineBreaks](self, "forcedLineBreaks"))
  {
    if (self)
      -[NSCoreTypesetter _forcedLineBreakAfterIndex:](self, "_forcedLineBreakAfterIndex:", location);
    if (location + length)
      v17 = 0;
    else
      v17 = location + length;
    v18 = v17 - location;
    v20 = 0;
  }
  else if (a7)
  {
    v16 = CTLineSuggestClusterBreakWithTabOverflow();
    v17 = v16;
    if (a8 == 1 || !v16 || (v18 = v27, v16 + location >= location + v27))
    {
      v20 = v16;
      v18 = v16;
    }
    else
    {
      v19 = objc_msgSend(a7, "adjustedLineBreakIndexForProposedIndex:");
      if (v19 <= location + v27)
      {
        v20 = v19;
        objc_msgSend(a7, "lineBreakContextBeforeIndex:lineFragmentWidth:range:", v19, location, v27, a5);
        v18 = -(uint64_t)location;
        v17 = 0;
      }
      else
      {
        v20 = v17;
      }
    }
  }
  else
  {
    v18 = CTLineSuggestLineBreakWithTabOverflow();
    v20 = 0;
    v17 = 0;
  }
  v21 = -[NSCoreTypesetter delegate](self, "delegate");
  if (v21)
  {
    v22 = v21;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v23 = -[NSCoreTypesetterDelegate coreTypesetter:indexToBreakLineByWordBeforeCharacterAtIndex:proposedIndex:](v22, "coreTypesetter:indexToBreakLineByWordBeforeCharacterAtIndex:proposedIndex:", self, v20, v17);
      if (v23 < v20 && v23 > location)
        v18 = v23 - location;
    }
  }
  if (v18)
    return (__CTLine *)CTLineCreateFromLineWithOffset();
  else
    return 0;
}

- (NSCoreTypesetterDelegate)delegate
{
  NSCoreTypesetterDelegateInternal *delegate;

  objc_sync_enter(self);
  delegate = self->_delegate;
  objc_sync_exit(self);
  return delegate;
}

void __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  CFTypeRef cf;
  __int128 v13;
  __int128 v14;
  NSParagraphStyle *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = 0;
  if ((a4 & 1) != 0 && (v5 = CTLineCreateFromLineWithOffset()) != 0)
  {
    v6 = (const void *)v5;
    v23 = 0;
    v11 = *MEMORY[0x1E0CB3438];
    v7 = *(_QWORD *)(MEMORY[0x1E0CB3438] + 16);
    v8 = *(_QWORD *)(MEMORY[0x1E0CB3438] + 24);
    v9 = *MEMORY[0x1E0CB3430];
    v10 = *(_QWORD *)(MEMORY[0x1E0CB3430] + 8);
    v13 = 0u;
    v14 = 0u;
    v16 = 0;
    v17 = 0;
    v18 = v11;
    v19 = v7;
    v20 = v8;
    v21 = v9;
    v22 = v10;
    v15 = +[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle");
    cf = v6;
    __NSCoreTypesetterHyphenateLine((uint64_t)&cf, objc_msgSend(*(id *)(a1 + 32), "softHyphen"), 0, (double *)&v24, 0);
    CFRelease(cf);
  }
  else
  {
    CTLineGetWidthForStringRangeWithOffset();
  }
}

- (int64_t)_getFirstOverflowTabStopIndexInLineRef:(__CTLine *)a3 range:(_NSRange)a4 string:(id)a5 paragraphStyle:(id)a6 availableWidth:(double)a7 offset:(double)a8
{
  CFIndex length;
  double v14;
  void *v15;
  double TypographicBounds;
  double v17;
  int64_t result;

  if (a3)
    length = CTLineGetStringRange(a3).length;
  else
    length = 0;
  if (a7 <= 0.0 || length < 1)
    return 0x7FFFFFFFFFFFFFFFLL;
  if (!a6)
    a6 = -[NSTypesetter defaultParagraphStyle](self, "defaultParagraphStyle");
  objc_msgSend(a6, "defaultTabInterval");
  v15 = v14 == 0.0 ? 0 : (void *)objc_msgSend(a6, "tabStops");
  TypographicBounds = CTLineGetTypographicBounds(a3, 0, 0, 0);
  objc_msgSend((id)objc_msgSend(v15, "lastObject"), "location");
  if (TypographicBounds < v17)
    return 0x7FFFFFFFFFFFFFFFLL;
  result = CTLineGetStringIndexOfTabOverflow();
  if (result == -1)
    return 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

+ (void)_maximumAscentAndDescentForRuns:(__CFArray *)a3 ascender:(double *)a4 descender:(double *)a5
{
  CFIndex Count;
  CFIndex v9;
  CFIndex v10;
  double v11;
  double v12;
  void *Font;
  double v14;
  double v15;

  Count = CFArrayGetCount(a3);
  if (Count)
  {
    v9 = Count;
    v10 = 0;
    v11 = 0.0;
    v12 = 0.0;
    do
    {
      if (!CFArrayGetValueAtIndex(a3, v10) || (Font = (void *)CTRunGetFont()) == 0)
        Font = (void *)NSDefaultFont();
      objc_msgSend(Font, "boundingRectForFont");
      if (v14 < v11)
        v11 = v14;
      if (v14 + v15 > v12)
        v12 = v14 + v15;
      ++v10;
    }
    while (v9 != v10);
  }
  else
  {
    v12 = 0.0;
    v11 = 0.0;
  }
  *a4 = ceil(v12);
  *a5 = floor(v11);
}

- (void)layoutWithYOrigin:(double)a3
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSAttributedString *v16;
  NSAttributedString *v17;
  uint64_t v18;
  NSStringDrawingContext *v19;
  const __CFString *v20;
  const __CFString *v21;
  CFIndex Length;
  uint64_t v23;
  double lineFragmentOriginYOffset;
  NSDictionary *v25;
  uint64_t v26;
  double v27;
  double v28;
  NSDictionary *extraLineFragmentAttributes;
  uint64_t v30;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[12];
  double v34;
  __int128 v35;
  __int128 v36;
  double v37;
  double v38;
  _WORD v39[9];

  -[NSTypesetter lineFragmentPadding](self, "lineFragmentPadding");
  v7 = v6;
  -[NSCoreTypesetter textContainerSize](self, "textContainerSize");
  v9 = v8;
  -[NSCoreTypesetter textContainerSize](self, "textContainerSize");
  v11 = v10;
  -[NSMutableArray removeAllObjects](self->_truncatedRanges, "removeAllObjects");
  v12 = 0.0;
  if (a3 <= 0.0 || v11 <= 0.0 || (v11 = v11 - a3, v12 = a3, v11 > 0.0))
  {
    v13 = -[NSCoreTypesetter characterRange](self, "characterRange");
    v15 = v14;
    v16 = -[NSTypesetter attributedString](self, "attributedString");
    v17 = -[NSAttributedString attributedSubstringFromRange:](v16, "attributedSubstringFromRange:", v13, v15);
    if (-[NSTypesetter usesFontLeading](self, "usesFontLeading"))
      v18 = 3;
    else
      v18 = 1;
    v19 = objc_alloc_init(NSStringDrawingContext);
    -[NSStringDrawingContext setActiveRenderers:](v19, "setActiveRenderers:", 3);
    -[NSStringDrawingContext setMaximumNumberOfLines:](v19, "setMaximumNumberOfLines:", -[NSCoreTypesetter maximumNumberOfLines](self, "maximumNumberOfLines"));
    v39[0] = 0;
    v20 = -[NSAttributedString string](v17, "string");
    v21 = v20;
    if (v20)
      Length = CFStringGetLength(v20);
    else
      Length = 0;
    v23 = __NSUltraFastLineBreakFinder(v21, Length, (_BYTE *)v39 + 1, v39);
    CTSwapLineBreakEpsilon();
    lineFragmentOriginYOffset = self->_lineFragmentOriginYOffset;
    self->_lineFragmentOriginYOffset = a3;
    if (Length > 1 || v23 >= 1)
    {
      -[NSCoreTypesetter _stringDrawingCoreTextEngineWithOriginalString:rect:padding:graphicsContext:forceClipping:attributes:stringDrawingOptions:drawingContext:stringDrawingInterface:](self, "_stringDrawingCoreTextEngineWithOriginalString:rect:padding:graphicsContext:forceClipping:attributes:stringDrawingOptions:drawingContext:stringDrawingInterface:", v17, 0, 0, 0, v18, v19, 0.0, v12, v9 + v7 * -2.0, v11, 0.0, 0);
    }
    else if (-[NSCoreTypesetter laidOutLineFragment](self, "laidOutLineFragment"))
    {
      v25 = -[NSAttributedString length](v17, "length")
          ? -[NSAttributedString attributesAtIndex:effectiveRange:](v17, "attributesAtIndex:effectiveRange:", 0, 0)
          : self->__extraLineFragmentAttributes;
      v37 = 0.0;
      v38 = 0.0;
      v35 = 0u;
      v36 = 0u;
      v34 = 0.0;
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __38__NSCoreTypesetter_layoutWithYOrigin___block_invoke;
      v33[3] = &unk_1E2605440;
      v33[5] = self;
      v33[6] = 0;
      *(double *)&v33[7] = v12;
      *(double *)&v33[8] = v9 + v7 * -2.0;
      v33[4] = v17;
      *(double *)&v33[9] = v11;
      *(double *)&v33[10] = v7;
      v33[11] = a2;
      if (__38__NSCoreTypesetter_layoutWithYOrigin___block_invoke((uint64_t)v33, self, (uint64_t)v25, (uint64_t)&v35, &v37, &v34))
      {
        v26 = -[NSTypesetter applicationFrameworkContext](self, "applicationFrameworkContext");
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __38__NSCoreTypesetter_layoutWithYOrigin___block_invoke_2;
        v32[3] = &unk_1E2605468;
        v32[4] = self;
        v27 = *((double *)&v35 + 1);
        v28 = *((double *)&v36 + 1);
        __NSCoreTypesetterProcessTextLineFragment((uint64_t)v16, (uint64_t)&stru_1E260C7D0, (uint64_t)v25, v13, Length, v26, (uint64_t)v32, v37, v38, *(double *)&v35, *((double *)&v35 + 1), *(double *)&v36, *((double *)&v36 + 1), v34);
        if (self->_wantsExtraLineFragment && v23 < Length)
        {
          extraLineFragmentAttributes = self->__extraLineFragmentAttributes;
          if (v25 != extraLineFragmentAttributes
            && !-[NSDictionary isEqualToDictionary:](v25, "isEqualToDictionary:", self->__extraLineFragmentAttributes))
          {
            __38__NSCoreTypesetter_layoutWithYOrigin___block_invoke((uint64_t)v33, self, (uint64_t)extraLineFragmentAttributes, (uint64_t)&v35, &v37, &v34);
            v28 = *((double *)&v36 + 1);
            v27 = *((double *)&v35 + 1);
          }
          *((double *)&v35 + 1) = v28 + v27;
          v30 = -[NSTypesetter applicationFrameworkContext](self, "applicationFrameworkContext");
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __38__NSCoreTypesetter_layoutWithYOrigin___block_invoke_3;
          v31[3] = &unk_1E2605468;
          v31[4] = self;
          __NSCoreTypesetterProcessTextLineFragment((uint64_t)v16, (uint64_t)&stru_1E260C7D0, (uint64_t)v25, Length + v13, 0, v30, (uint64_t)v31, v37, v38, *(double *)&v35, *((double *)&v35 + 1), *(double *)&v36, *((double *)&v36 + 1), v34);
        }
      }
    }
    CTSwapLineBreakEpsilon();
    self->_lineFragmentOriginYOffset = lineFragmentOriginYOffset;

  }
}

- (BOOL)enforcesMinimumTextLineFragment
{
  return self->_enforcesMinimumTextLineFragment;
}

- (CGSize)textContainerSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->textContainerSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (_NSRange)characterRange
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->characterRange, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)set_extraLineFragmentAttributes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (void)setWantsExtraLineFragment:(BOOL)a3
{
  self->_wantsExtraLineFragment = a3;
}

- (void)setValidateLineBreakIndex:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void)setUsesDefaultHyphenation:(BOOL)a3
{
  self->_usesDefaultHyphenation = a3;
}

- (void)setTypographicBoundsIncludesLineFragmentPadding:(BOOL)a3
{
  self->_typographicBoundsIncludesLineFragmentPadding = a3;
}

- (void)setRequiresCTLineRef:(BOOL)a3
{
  self->_requiresCTLineRef = a3;
}

- (void)setLimitsLayoutForSuspiciousContents:(BOOL)a3
{
  self->_limitsLayoutForSuspiciousContents = a3;
}

- (void)setLaidOutLineFragment:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (void)setDelegate:(id)a3
{
  char v5;

  objc_sync_enter(self);
  if (self->_delegate != a3)
  {
    self->_delegate = (NSCoreTypesetterDelegateInternal *)a3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = objc_opt_respondsToSelector();
    else
      v5 = 0;
    self->_delegateSupportsTextContainer = v5 & 1;
    self->_delegatesSupportsTruncationToken = objc_opt_respondsToSelector() & 1;
  }
  objc_sync_exit(self);
}

- (void)setContainerBreakMode:(int64_t)a3
{
  self->_containerBreakMode = a3;
}

- (void)setCharacterRange:(_NSRange)a3
{
  _NSRange v3;

  v3 = a3;
  objc_copyStruct(&self->characterRange, &v3, 16, 1, 0);
}

- (void)setBreaksLinesForInteractiveText:(BOOL)a3
{
  self->_breaksLinesForInteractiveText = a3;
}

- (void)setBeginningOfDocument:(BOOL)a3
{
  self->_beginningOfDocument = a3;
}

- (int64_t)maximumNumberOfLines
{
  return self->_maximumNumberOfLines;
}

uint64_t __38__NSCoreTypesetter_layoutWithYOrigin___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6)
{
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t result;
  void *v29;
  NSWritingDirection v30;
  unint64_t v31;
  double v32;
  unint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  CGRect v37;
  CGRect v38;

  LOBYTE(v34) = 0;
  objc_msgSend(a2, "_getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:", 0, 0, a3, *(_QWORD *)(a1 + 32), 1, 0, v34);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = *(double *)(a1 + 72);
  v19 = objc_msgSend(a2, "characterRange");
  if (objc_msgSend(a2, "isSimpleRectangularTextContainerForStartingCharacterAtIndex:", v19))
  {
    v20 = *(double *)(a1 + 64);
    if (v18 <= 0.0)
      v18 = v13;
    v21 = 0.0;
    v22 = 0.0;
  }
  else
  {
    objc_msgSend(a2, "lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:", v19, 0, 0, 0.0, 0.0, 10000000.0, v13);
    v21 = v23;
    v22 = v24;
    v20 = v25;
    v18 = v26;
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 57))
    v27 = *(_QWORD *)(a1 + 80);
  else
    v27 = 0;
  *a6 = v27;
  v37.origin.x = v21;
  v37.origin.y = v22;
  v37.size.width = v20;
  v37.size.height = v18;
  if (CGRectGetHeight(v37) + 0.001 >= v13
    || (result = objc_msgSend(a2, "enforcesMinimumTextLineFragment"), (_DWORD)result))
  {
    v38.origin.x = v21;
    v38.origin.y = v22;
    v38.size.width = v20;
    v38.size.height = v18;
    if (CGRectGetWidth(v38) == 10000000.0)
    {
      v32 = 0.0;
      goto LABEL_28;
    }
    v29 = (void *)objc_msgSend(a2, "_paragraphStyleFromAttributes:", a3);
    v30 = objc_msgSend(v29, "baseWritingDirection");
    if (v30 == NSWritingDirectionNatural)
      v30 = +[NSParagraphStyle defaultWritingDirectionForLanguage:](NSParagraphStyle, "defaultWritingDirectionForLanguage:", 0);
    v31 = objc_msgSend(v29, "horizontalAlignment");
    if (v31 > 1)
    {
      v33 = v31;
      v35 = 0.0;
      v36 = 0.0;
      +[NSCoreTypesetter _minMaxPositionsForLineFragmentWithParagraphStyle:baseWidth:writingDirection:isBeginningOfParagraph:minPosition:maxPosition:](NSCoreTypesetter, "_minMaxPositionsForLineFragmentWithParagraphStyle:baseWidth:writingDirection:isBeginningOfParagraph:minPosition:maxPosition:", v29, v30, 1, &v36, &v35, *(double *)(a1 + 64));
      if (v33 == 4)
      {
        v32 = (v36 + v35) * 0.5;
        goto LABEL_28;
      }
      if (v33 == 3)
        goto LABEL_18;
      v32 = 0.0;
      if (v33 != 2)
        goto LABEL_28;
    }
    else
    {
      if (v31 == 1)
      {
        if (v30 != NSWritingDirectionRightToLeft)
        {
LABEL_17:
          v35 = 0.0;
          v36 = 0.0;
          +[NSCoreTypesetter _minMaxPositionsForLineFragmentWithParagraphStyle:baseWidth:writingDirection:isBeginningOfParagraph:minPosition:maxPosition:](NSCoreTypesetter, "_minMaxPositionsForLineFragmentWithParagraphStyle:baseWidth:writingDirection:isBeginningOfParagraph:minPosition:maxPosition:", v29, v30, 1, &v36, &v35, *(double *)(a1 + 64));
LABEL_18:
          v32 = v35;
LABEL_28:
          *a5 = 0;
          a5[1] = v15;
          *(double *)a4 = v32;
          *(_QWORD *)(a4 + 8) = 0;
          *(_QWORD *)(a4 + 16) = 0;
          *(double *)(a4 + 24) = v13 + v17;
          return 1;
        }
      }
      else if (v30 == NSWritingDirectionRightToLeft)
      {
        goto LABEL_17;
      }
      v35 = 0.0;
      v36 = 0.0;
      +[NSCoreTypesetter _minMaxPositionsForLineFragmentWithParagraphStyle:baseWidth:writingDirection:isBeginningOfParagraph:minPosition:maxPosition:](NSCoreTypesetter, "_minMaxPositionsForLineFragmentWithParagraphStyle:baseWidth:writingDirection:isBeginningOfParagraph:minPosition:maxPosition:", v29, v30, 1, &v36, &v35, *(double *)(a1 + 64));
    }
    v32 = v36;
    goto LABEL_28;
  }
  return result;
}

void __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_8(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v6;
  double v7;
  double v8;

  if (*(_BYTE *)(a1 + 88))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(double *)(v6 + 24) == 1.79769313e308)
      *(_QWORD *)(v6 + 24) = *(_QWORD *)(a1 + 64);
    v7 = a3 - *(double *)(a1 + 64);
    v8 = a2 + *(double *)(a1 + 72);
    *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = CGRectUnion(*(CGRect *)(&a4 - 2), *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 32));
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 48)
                                                              + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 40);
}

void __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_4(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v5;
  double v6;
  double v7;

  if (*(_BYTE *)(a1 + 72))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(double *)(v5 + 24) == 1.79769313e308)
      *(_QWORD *)(v5 + 24) = *(_QWORD *)(a1 + 48);
    v6 = a3 - *(double *)(a1 + 48);
    v7 = a2 + *(double *)(a1 + 56);
    *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = CGRectUnion(*(CGRect *)(&a4 - 2), *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 32));
  }
}

void __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_11(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v5;
  double v6;
  double v7;

  if (*(_BYTE *)(a1 + 72))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(double *)(v5 + 24) == 1.79769313e308)
      *(_QWORD *)(v5 + 24) = *(_QWORD *)(a1 + 48);
    v6 = a3 - *(double *)(a1 + 48);
    v7 = a2 + *(double *)(a1 + 56);
    *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = CGRectUnion(*(CGRect *)(&a4 - 2), *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 32));
  }
}

- (id)softHyphen
{
  return CFSTR("‐");
}

uint64_t __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v4 + 145) && *(_QWORD *)(v4 + 32))
    objc_msgSend(a2, "setLineRef:");
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(a2, "setLineBadge:");
  objc_msgSend(a2, "setIsHyphenated:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 144));
  objc_msgSend(a2, "setIsTruncated:", *(unsigned __int8 *)(a1 + 56));
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 64) + 16))();
}

uint64_t __86__NSCoreTypesetter__allowsFontOverridingTextAttachmentVerticalMetricsForStringDrawing__block_invoke()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  _allowsFontOverridingTextAttachmentVerticalMetricsForStringDrawing__allowsFontOverridingTextAttachmentVerticalMetricsForStringDrawing = result;
  return result;
}

uint64_t __41__NSCoreTypesetter__shouldShowLineBadges__block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSCoreTypesetterDebugBadgesEnabled"));
  _shouldShowLineBadges_result = result;
  return result;
}

uint64_t __80__NSCoreTypesetter_isSimpleRectangularTextContainerForStartingCharacterAtIndex___block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("_NSCoreTypesetterForcesNonSimpleLayout"));
  isSimpleRectangularTextContainerForStartingCharacterAtIndex__forcesNonSimple = result;
  return result;
}

CFTypeRef __273__NSCoreTypesetter__NSFastDrawString_length_attributes_paragraphStyle_typesetterBehavior_lineBreakMode_rect_padding_graphicsContext_baselineRendering_usesFontLeading_usesScreenFont_scrollable_syncAlignment_mirrored_boundingRectPointer_baselineOffsetPointer_drawingContext___block_invoke()
{
  CFCharacterSetRef Predefined;
  CFTypeRef result;

  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  result = CFRetain(Predefined);
  _NSFastDrawString_length_attributes_paragraphStyle_typesetterBehavior_lineBreakMode_rect_padding_graphicsContext_baselineRendering_usesFontLeading_usesScreenFont_scrollable_syncAlignment_mirrored_boundingRectPointer_baselineOffsetPointer_drawingContext__whitespaceCharacterSet = (uint64_t)result;
  return result;
}

uint64_t __273__NSCoreTypesetter__NSFastDrawString_length_attributes_paragraphStyle_typesetterBehavior_lineBreakMode_rect_padding_graphicsContext_baselineRendering_usesFontLeading_usesScreenFont_scrollable_syncAlignment_mirrored_boundingRectPointer_baselineOffsetPointer_drawingContext___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setGlyphs:advances:count:elasticCount:font:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  return (*(uint64_t (**)(_QWORD, void *, BOOL))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), a2, *(_BYTE *)(a1 + 80) == 0);
}

uint64_t __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_9(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setIsExtra:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 16))();
}

uint64_t __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v4 + 145) && *(_QWORD *)(v4 + 32))
  {
    objc_msgSend(a2, "setLineRef:");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  objc_msgSend(a2, "setIsHyphenated:", *(unsigned __int8 *)(v4 + 144));
  objc_msgSend(a2, "setIsTruncated:", *(unsigned __int8 *)(a1 + 48));
  if (*(_BYTE *)(a1 + 49))
    v5 = 3;
  else
    v5 = 1;
  v6 = objc_msgSend(*(id *)(a1 + 32), "laidOutLineFragment");
  return (*(uint64_t (**)(uint64_t, void *, uint64_t))(v6 + 16))(v6, a2, v5);
}

- (id)_truncationTokenForRange:(_NSRange *)a3 attributes:(id)a4 originalLineRef:(__CTLine *)a5
{
  if (self->_delegateSupportsTextContainer)
    return (id)-[NSCoreTypesetterDelegateInternal coreTypesetter:attributedStringForTruncatedCharacterRange:attributes:originalLineRef:](self->_delegate, "coreTypesetter:attributedStringForTruncatedCharacterRange:attributes:originalLineRef:", self, a3, a4, a5);
  else
    return 0;
}

- (__CTRun)_truncationTokenRunRefWithContext:(id *)a3 token:(id)a4 attributes:(id)a5
{
  __CTRun *var2;
  const __CTLine *BaseLineFromAttributedString;
  CTLineRef v11;
  const __CFArray *GlyphRuns;
  CFIndex Count;
  unint64_t v14;
  void *v15;
  const void *ValueAtIndex;
  __CFDictionary *v17;
  _QWORD *v18;
  const void *v19;
  CTRunDelegateRef v20;
  void *v21;
  const __CFArray *v22;
  const void *v23;
  __CTRun *v24;

  var2 = a3->var2;
  if (var2)
  {
    if (a3->var0 == a4)
      return var2;
    if (objc_msgSend(a3->var0, "isEqualToAttributedString:", a4))
      return a3->var2;
  }
  if (a4)
  {
    BaseLineFromAttributedString = __NSCoreTypesetterCreateBaseLineFromAttributedString(a4, 0, objc_msgSend(a4, "length"), -[NSCoreTypesetter layoutOrientation](self, "layoutOrientation"), -[NSCoreTypesetter limitsLayoutForSuspiciousContents](self, "limitsLayoutForSuspiciousContents"), 0);
  }
  else
  {
    if (objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("NSFont")))
      CTFontIsVertical();
    BaseLineFromAttributedString = (const __CTLine *)CTLineCreateWithString();
  }
  v11 = BaseLineFromAttributedString;
  if (BaseLineFromAttributedString)
  {
    GlyphRuns = CTLineGetGlyphRuns(BaseLineFromAttributedString);
    Count = CFArrayGetCount(GlyphRuns);
    if (Count)
    {
      v14 = Count;
      v15 = (void *)objc_msgSend(a4, "attributesAtIndex:effectiveRange:", 0, 0);
      ValueAtIndex = CFArrayGetValueAtIndex(GlyphRuns, 0);
      var2 = (__CTRun *)CFRetain(ValueAtIndex);
      if (a4 && (v14 > 1 || objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("NSAttachment"))))
      {
        v17 = (__CFDictionary *)objc_msgSend(v15, "mutableCopy");
        v18 = -[_NSTruncationTokenAttachment initWithAttributedString:lineRef:]([_NSTruncationTokenAttachment alloc], a4, 0);
        v19 = (const void *)*MEMORY[0x1E0CA85C0];
        v20 = -[_NSTruncationTokenAttachment runDelegate](v18);
        CFDictionarySetValue(v17, v19, v20);
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithAttachment:attributes:", v18, v17);
        CFRelease(v11);
        v11 = __NSCoreTypesetterCreateBaseLineFromAttributedString(v21, 0, objc_msgSend(a4, "length"), -[NSCoreTypesetter layoutOrientation](self, "layoutOrientation"), -[NSCoreTypesetter limitsLayoutForSuspiciousContents](self, "limitsLayoutForSuspiciousContents"), 0);
        v22 = CTLineGetGlyphRuns(v11);
        CFRelease(var2);
        v23 = CFArrayGetValueAtIndex(v22, 0);
        var2 = (__CTRun *)CFRetain(v23);

LABEL_19:
        CFRelease(v11);
        goto LABEL_20;
      }
    }
    else
    {
      var2 = 0;
    }
    v18 = 0;
    goto LABEL_19;
  }
  var2 = 0;
  v18 = 0;
LABEL_20:
  if (a3->var0 != a4)
  {

    a3->var0 = a4;
  }

  a3->var1 = v18;
  v24 = a3->var2;
  if (v24)
    CFRelease(v24);
  a3->var2 = var2;
  return var2;
}

- (void)layout
{
  -[NSCoreTypesetter layoutWithYOrigin:](self, "layoutWithYOrigin:", 0.0);
}

uint64_t __38__NSCoreTypesetter_layoutWithYOrigin___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 16))();
}

uint64_t __38__NSCoreTypesetter_layoutWithYOrigin___block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setIsExtra:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 16))();
}

- (CGRect)lineFragmentRectForProposedRect:(CGRect)a3 atIndex:(int64_t)a4 writingDirection:(int64_t)a5 remainingRect:(CGRect *)a6
{
  double height;
  double width;
  CGFloat x;
  double v11;
  CGSize v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double lineFragmentOriginYOffset;
  CGPoint v18;
  CGSize v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGPoint v29;
  CGSize v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  x = a3.origin.x;
  v11 = a3.origin.y + self->_lineFragmentOriginYOffset;
  if (self->_delegateSupportsTextContainer)
  {
    v12 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v29 = (CGPoint)*MEMORY[0x1E0C9D648];
    v30 = v12;
    -[NSCoreTypesetterDelegateInternal coreTypesetter:lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:](self->_delegate, "coreTypesetter:lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:", self, a4, a5, &v29, a3.origin.x, v11, a3.size.width, a3.size.height);
    x = v13;
    v11 = v14;
    width = v15;
    height = v16;
    if (!a6)
      goto LABEL_16;
    lineFragmentOriginYOffset = self->_lineFragmentOriginYOffset;
    if (v29.y >= lineFragmentOriginYOffset)
      v29.y = v29.y - lineFragmentOriginYOffset;
    v18 = v29;
    v19 = v30;
    goto LABEL_15;
  }
  -[NSCoreTypesetter textContainerSize](self, "textContainerSize", a4, a5);
  v22 = v21;
  if (v20 > 0.0)
  {
    v23 = v20;
    v31.origin.x = x;
    v31.origin.y = v11;
    v31.size.width = width;
    v31.size.height = height;
    if (v23 < CGRectGetMaxX(v31))
    {
      v32.origin.x = x;
      v32.origin.y = v11;
      v32.size.width = width;
      v32.size.height = height;
      width = v23 - CGRectGetMinX(v32);
    }
  }
  if (v22 > 0.0)
  {
    v33.origin.x = x;
    v33.origin.y = v11;
    v33.size.width = width;
    v33.size.height = height;
    if (v22 < CGRectGetMaxY(v33)
      && !-[NSCoreTypesetter enforcesMinimumTextLineFragment](self, "enforcesMinimumTextLineFragment"))
    {
      v34.origin.x = x;
      v34.origin.y = v11;
      v34.size.width = width;
      v34.size.height = height;
      height = v22 - CGRectGetMinY(v34);
    }
  }
  if (a6)
  {
    v18 = (CGPoint)*MEMORY[0x1E0C9D648];
    v19 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
LABEL_15:
    a6->origin = v18;
    a6->size = v19;
  }
LABEL_16:
  v24 = self->_lineFragmentOriginYOffset;
  if (v11 < v24)
    v24 = 0.0;
  v25 = v11 - v24;
  v26 = x;
  v27 = width;
  v28 = height;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v25;
  result.origin.x = v26;
  return result;
}

uint64_t __273__NSCoreTypesetter__NSFastDrawString_length_attributes_paragraphStyle_typesetterBehavior_lineBreakMode_rect_padding_graphicsContext_baselineRendering_usesFontLeading_usesScreenFont_scrollable_syncAlignment_mirrored_boundingRectPointer_baselineOffsetPointer_drawingContext___block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setIsExtra:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 16))();
}

- ($F08F7EC4C389A89376F473094BC6C9F8)_forcedLineBreakAfterIndex:(SEL)a3
{
  NSArray *v7;
  $F08F7EC4C389A89376F473094BC6C9F8 *result;
  $F08F7EC4C389A89376F473094BC6C9F8 *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!-[NSCoreTypesetter forcedLineBreaks](self, "forcedLineBreaks"))
    -[NSCoreTypesetter _forcedLineBreakAfterIndex:].cold.1();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = -[NSCoreTypesetter forcedLineBreaks](self, "forcedLineBreaks", 0);
  result = ($F08F7EC4C389A89376F473094BC6C9F8 *)-[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (result)
  {
    v9 = result;
    v10 = *(_QWORD *)v14;
LABEL_4:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
      retstr->var1 = 0;
      *(_QWORD *)&retstr->var2 = 0;
      retstr->var0 = 0;
      if (v12)
      {
        result = ($F08F7EC4C389A89376F473094BC6C9F8 *)objc_msgSend(v12, "UIF_lineBreakContextValue");
        if (retstr->var0 > a4)
          break;
      }
      if (v9 == ($F08F7EC4C389A89376F473094BC6C9F8 *)++v11)
      {
        result = ($F08F7EC4C389A89376F473094BC6C9F8 *)-[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        v9 = result;
        if (result)
          goto LABEL_4;
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    *(_OWORD *)&retstr->var0 = NSLineBreakContextNull;
    *(_QWORD *)&retstr->var2 = 0;
  }
  return result;
}

- (__CTLine)_createLayoutLineFragmentStartingWithCharacterIndex:(int64_t *)a3 proposedLineFragmentRect:(CGRect *)a4 baseLineRef:(const __CTLine *)a5 range:(_NSRange)a6 paragraphStyle:(id)a7 paragraphArbitrator:(id)a8 lineBreakMode:(int64_t)a9 hasAttachments:(BOOL)a10 lineFragmentRect:(CGRect *)a11 glyphOrigin:(CGPoint *)a12 hyphenated:(BOOL *)a13 forcedClusterBreak:(BOOL *)a14
{
  NSUInteger length;
  NSAttributedString *v19;
  NSString *v20;
  uint64_t IsRightToLeft;
  CGSize v22;
  unint64_t v23;
  NSTypesetterBehavior v24;
  double v25;
  double v26;
  double height;
  int v28;
  double v29;
  double v30;
  double v31;
  unint64_t v32;
  int v33;
  char v34;
  _BOOL4 v35;
  NSUInteger v36;
  __CTLine *v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CFRange StringRange;
  int v50;
  double v51;
  double v52;
  double v53;
  double v54;
  BOOL v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  double v69;
  double v70;
  CGFloat v71;
  CGFloat v72;
  BOOL v73;
  CGFloat v74;
  CGFloat v75;
  double v76;
  double v77;
  CGSize size;
  NSAttributedString *v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  CGRect *v84;
  char v85;
  _BOOL4 v86;
  double v87;
  unint64_t v88;
  uint64_t v90;
  NSAttributedString *v91;
  double y;
  CGFloat v93;
  NSUInteger location;
  CGFloat v95;
  double x;
  double width;
  double v98;
  CGFloat v99;
  double v100;
  double v101;
  double v102;
  NSRect v103;
  uint64_t v104;
  uint64_t v105;
  NSSize v106;
  NSRect v107;
  NSRect v108;

  length = a6.length;
  location = a6.location;
  v19 = -[NSTypesetter attributedString](self, "attributedString");
  v20 = -[NSAttributedString string](v19, "string");
  v91 = v19;
  v90 = -[NSAttributedString attributesAtIndex:effectiveRange:](v19, "attributesAtIndex:effectiveRange:", *a3, 0);
  if (!a7)
    a7 = -[NSTypesetter defaultParagraphStyle](self, "defaultParagraphStyle");
  IsRightToLeft = objc_msgSend(a7, "baseWritingDirection");
  v22 = *(CGSize *)(MEMORY[0x1E0CB3438] + 16);
  v103.origin = (CGPoint)*MEMORY[0x1E0CB3438];
  v103.size = v22;
  v23 = *a3;
  v24 = -[NSTypesetter typesetterBehavior](self, "typesetterBehavior");
  v101 = 0.0;
  v102 = 0.0;
  -[NSTypesetter lineFragmentPadding](self, "lineFragmentPadding");
  v26 = v25;
  v98 = 0.0;
  v99 = 0.0;
  v100 = 0.0;
  x = a4->origin.x;
  y = a4->origin.y;
  v106.width = a4->size.width;
  height = a4->size.height;
  width = v106.width;
  v106.height = height;
  if (NSEqualSizes(v106, *MEMORY[0x1E0CB3440]))
  {
    if (v23)
      LOBYTE(v28) = 1;
    else
      v28 = !-[NSCoreTypesetter isBeginningOfDocument](self, "isBeginningOfDocument");
    LOBYTE(v82) = v28;
    -[NSCoreTypesetter _getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:](self, "_getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:", v23, 0, v90, v91, 1, 0, v82);
    height = v29;
    v98 = v29;
    v99 = v30;
    v100 = v31;
    width = 10000000.0;
  }
  v84 = a4;
  if ((uint64_t)v23 < 1)
    goto LABEL_19;
  if (v23 == 1)
  {
    v32 = 0;
  }
  else
  {
    v33 = -[NSString characterAtIndex:](v20, "characterAtIndex:", v23 - 1);
    v32 = v23 - 1;
    if (v33 == 10)
    {
      if (-[NSString characterAtIndex:](v20, "characterAtIndex:", v23 - 2) == 13)
        v32 = v23 - 2;
      else
        v32 = v23 - 1;
    }
  }
  v34 = -[NSTypesetter actionForControlCharacterAtIndex:](self, "actionForControlCharacterAtIndex:", v32);
  if ((v34 & 0x10) != 0 || v24 <= NSTypesetterBehavior_10_3 && (v34 & 0x20) != 0)
  {
LABEL_19:
    v35 = 1;
  }
  else
  {
    v80 = -[NSTypesetter attributedString](self, "attributedString");
    v104 = 0;
    v105 = 0;
    v81 = -[NSAttributedString attribute:atIndex:effectiveRange:](v80, "attribute:atIndex:effectiveRange:", CFSTR("NSAttachment"), v23 - 1, &v104);
    if (v105 + v104 > v23 || !v81)
    {
      if (-[NSString length](v20, "length") <= v23)
      {
        v81 = 0;
      }
      else
      {
        v81 = -[NSAttributedString attribute:atIndex:effectiveRange:](v80, "attribute:atIndex:effectiveRange:", CFSTR("NSAttachment"), v23, &v104);
        if (v105 + v104 > v23)
          v81 = 0;
      }
    }
    v35 = objc_msgSend(v81, "embeddingType") == 1;
  }
  v86 = v35;
  v36 = length;
  if (IsRightToLeft == -1)
    IsRightToLeft = CTLineIsRightToLeft();
  v37 = 0;
  v87 = -v26;
  v88 = location + v36;
  v38 = *(double *)(MEMORY[0x1E0CB3438] + 16);
  v93 = *(double *)(MEMORY[0x1E0CB3438] + 8);
  v95 = *MEMORY[0x1E0CB3438];
  v85 = 1;
  v39 = *(double *)(MEMORY[0x1E0CB3438] + 24);
  while (1)
  {
    -[NSCoreTypesetter beginLine](self, "beginLine");
    -[NSCoreTypesetter lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:](self, "lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:", v23, IsRightToLeft, &v103, x, y, width, height);
    if (v42 == 0.0)
      break;
    v43 = v40;
    v44 = v41;
    v45 = v42;
    v46 = v42 + v87 * 2.0;
    +[NSCoreTypesetter _minMaxPositionsForLineFragmentWithParagraphStyle:baseWidth:writingDirection:isBeginningOfParagraph:minPosition:maxPosition:](NSCoreTypesetter, "_minMaxPositionsForLineFragmentWithParagraphStyle:baseWidth:writingDirection:isBeginningOfParagraph:minPosition:maxPosition:", a7, IsRightToLeft, v86, &v102, &v101, v46);
    v47 = v101;
    if (v101 <= v46)
    {
      if (v101 < 0.0)
      {
        v101 = 0.0;
        v47 = 0.0;
      }
    }
    else
    {
      v101 = v46;
      v47 = v46;
    }
    v48 = v102;
    if (v102 >= 0.0)
    {
      if (v102 > v47)
      {
        v102 = v47;
        v48 = v47;
      }
    }
    else
    {
      v102 = 0.0;
      v48 = 0.0;
    }
    if (v47 > v48)
      v46 = v47 - v48;
    if (v37)
    {
      CFRelease(v37);
      v48 = v102;
    }
    v37 = -[NSCoreTypesetter _createLineRefForParentLineRef:range:availableWidth:offset:paragraphArbitrator:lineBreakMode:hyphenated:forcedClusterBreak:](self, "_createLineRefForParentLineRef:range:availableWidth:offset:paragraphArbitrator:lineBreakMode:hyphenated:forcedClusterBreak:", a5, *a3, v88 - *a3, a8, a9, a13, v46, v48, a14);
    StringRange = CTLineGetStringRange(v37);
    v23 = StringRange.location;
    if (StringRange.location <= 0)
      v50 = !-[NSCoreTypesetter isBeginningOfDocument](self, "isBeginningOfDocument");
    else
      LOBYTE(v50) = 1;
    LOBYTE(v83) = v50;
    -[NSCoreTypesetter _getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:](self, "_getLineMetricsForRange:attributes:attributedString:applySpacing:usesSystemFontLeading:usesNegativeFontLeading:", StringRange.location, StringRange.length, v90, v91, 1, 0, v83);
    v52 = v51;
    v98 = v51;
    v99 = v53;
    v100 = v54;
    if (v37)
      v55 = !a10;
    else
      v55 = 1;
    if (!v55)
    {
      __NSCoreTypesetterAdjustLineHeightAndBaselineForTextAttachments(v37, &v98, &v99);
      v52 = v98;
    }
    if (v52 == height)
      goto LABEL_49;
    -[NSCoreTypesetter lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:](self, "lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:", StringRange.location, IsRightToLeft, &v103, x, v44, width, v52);
    v60 = v59;
    if (v45 == v58 && v58 != 0.0 && v59 != 0.0)
    {
      v52 = v59;
      v45 = v58;
      v44 = v57;
      v43 = v56;
LABEL_49:
      v62 = v93;
      v61 = v95;
      goto LABEL_61;
    }
    v64 = v93;
    v63 = v95;
    if (v52 <= height)
    {
      if (v59 <= height)
      {
        if (v57 == v44 || v45 == v58)
        {
          v65 = v52;
          v66 = v52;
        }
        else
        {
          x = v56;
          width = 10000000.0;
          v43 = v95;
          v44 = v93;
          v45 = v38;
          v65 = v39;
          v66 = v39;
          height = v60;
          y = v57;
        }
      }
      else
      {
        v67 = width;
        if (!(v85 & 1 | (v58 >= v45)))
          v67 = v58;
        width = v67;
        v43 = v95;
        v44 = v93;
        v45 = v38;
        v65 = v39;
        v66 = v39;
        height = v52;
        v85 = 0;
      }
    }
    else
    {
      v43 = v95;
      v44 = v93;
      v45 = v38;
      v65 = v39;
      v66 = v39;
      height = v52;
    }
    v68 = v43;
    v69 = v44;
    v70 = v45;
    v71 = v38;
    v72 = v39;
    v73 = NSEqualRects(*(NSRect *)(&v65 - 3), *(NSRect *)&v63);
    v62 = v93;
    v61 = v95;
    v52 = v66;
    if (!v73)
      break;
LABEL_61:
    v107.origin.x = v43;
    v107.origin.y = v44;
    v107.size.width = v45;
    v107.size.height = v52;
    v74 = v38;
    v75 = v39;
    if (!NSEqualRects(v107, *(NSRect *)&v61))
    {
      -[NSCoreTypesetter endLine](self, "endLine");
      *a3 = StringRange.location + StringRange.length;
      -[NSTypesetter lineFragmentPadding](self, "lineFragmentPadding");
      v77 = v45 + v76 * -2.0;
      v108.origin.y = v93;
      v108.origin.x = v95;
      v108.size.width = v38;
      v108.size.height = v39;
      if (NSEqualRects(v103, v108) || v88 <= *a3)
      {
        v103.origin.x = 0.0;
        v103.origin.y = v52 + v44 + v100;
        v103.size = 0uLL;
      }
      size = v103.size;
      v84->origin = v103.origin;
      v84->size = size;
      a11->origin.x = v43;
      a11->origin.y = v44;
      a11->size.width = v77;
      a11->size.height = v52;
      size.width = v99;
      a12->x = v102;
      a12->y = size.width;
      return v37;
    }
  }
  if (v37)
  {
    CFRelease(v37);
    return 0;
  }
  return v37;
}

uint64_t __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_2(uint64_t a1, unint64_t a2, unint64_t *a3)
{
  __int128 *v6;
  void *v7;
  void *v8;
  uint64_t result;
  uint64_t v10;
  __int128 v11;

  if (objc_msgSend(*(id *)(a1 + 32), "length") <= a2)
  {
    result = 0;
    if (a3)
    {
      *a3 = a2;
      a3[1] = 0;
    }
  }
  else
  {
    v11 = 0uLL;
    if (a3)
      v6 = &v11;
    else
      v6 = 0;
    v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "attributesAtIndex:effectiveRange:", a2, v6, v11);
    v8 = v7;
    if (a3)
      *(_OWORD *)a3 = v11;
    result = objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NSLink"));
    if (result)
    {
      v10 = *(_QWORD *)(a1 + 48);
      if (v10)
        return (*(uint64_t (**)(uint64_t, void *, unint64_t))(v10 + 16))(v10, v8, a2);
      else
        return *(_QWORD *)(a1 + 40);
    }
  }
  return result;
}

uint64_t __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_3(uint64_t a1, void *a2)
{
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(a2, "setLineRef:");
  objc_msgSend(a2, "setIsTruncated:", *(unsigned __int8 *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 16))();
}

uint64_t __180__NSCoreTypesetter__stringDrawingCoreTextEngineWithOriginalString_rect_padding_graphicsContext_forceClipping_attributes_stringDrawingOptions_drawingContext_stringDrawingInterface___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 16))();
}

- (BOOL)wantsExtraLineFragment
{
  return self->_wantsExtraLineFragment;
}

- (id)validateLineBreakIndex
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setMaximumNumberOfLines:(int64_t)a3
{
  self->_maximumNumberOfLines = a3;
}

- (BOOL)typographicBoundsIncludesLineFragmentPadding
{
  return self->_typographicBoundsIncludesLineFragmentPadding;
}

- (NSArray)truncatedRanges
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSTextAnimationKeyframe)keyframe
{
  return (NSTextAnimationKeyframe *)objc_getProperty(self, a2, 112, 1);
}

- (void)setKeyframe:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSArray)forcedLineBreaks
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setForcedLineBreaks:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (void)_NSFastDrawString:length:attributes:paragraphStyle:typesetterBehavior:lineBreakMode:rect:padding:graphicsContext:baselineRendering:usesFontLeading:usesScreenFont:scrollable:syncAlignment:mirrored:boundingRectPointer:baselineOffsetPointer:drawingContext:.cold.1()
{
  __assert_rtn("-[NSCoreTypesetter _NSFastDrawString:length:attributes:paragraphStyle:typesetterBehavior:lineBreakMode:rect:padding:graphicsContext:baselineRendering:usesFontLeading:usesScreenFont:scrollable:syncAlignment:mirrored:boundingRectPointer:baselineOffsetPointer:drawingContext:]", "NSCoreTypesetter.m", 1563, "!wantsTextLineFragments");
}

- (void)_forcedLineBreakAfterIndex:.cold.1()
{
  __assert_rtn("-[NSCoreTypesetter _forcedLineBreakAfterIndex:]", "NSCoreTypesetter.m", 1933, "nil != self.forcedLineBreaks");
}

@end
