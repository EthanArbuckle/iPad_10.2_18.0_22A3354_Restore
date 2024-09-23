@implementation WebResourceUsageOverlayLayer

- (WebResourceUsageOverlayLayer)initWithResourceUsageOverlay:(void *)a3
{
  WebResourceUsageOverlayLayer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WebResourceUsageOverlayLayer;
  result = -[WebResourceUsageOverlayLayer init](&v5, sel_init);
  if (result)
    result->m_overlay = a3;
  return result;
}

- (void)drawInContext:(CGContext *)a3
{
  uint64_t v3;
  CGContext *v4;
  CGContext *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  double v11;
  unint64_t v12;
  CGContext *v13;
  WTF::StringImpl *v14;
  unint64_t i;
  CGContext *v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  const WTF::String *v21;
  uint64_t v22;
  _BYTE *v23;
  CGContext *v24;
  WTF::String *v25;
  int v26;
  uint64_t v27;
  int v28;
  const WTF::String *v29;
  WTF::StringImpl *v30;
  int v31;
  unsigned int v32;
  CGContext *v33;
  int v34;
  uint64_t v35;
  int v36;
  const WTF::String *v37;
  WTF::StringImpl *v38;
  unint64_t v39;
  unint64_t v40;
  float v41;
  int v42;
  unsigned int v43;
  int v44;
  unsigned int v45;
  int v46;
  unsigned int v47;
  WTF::String *v48;
  WTF::String *v49;
  uint64_t v50;
  WTF::StringImpl *v51;
  uint64_t v52;
  _WORD *v53;
  _OWORD *v54;
  const WTF::String *v55;
  unint64_t v56;
  unint64_t v57;
  unsigned int v58;
  _DWORD *v59;
  char *v60;
  uint64_t v61;
  char *v62;
  char *v63;
  __int16 v64;
  char *v65;
  char *v66;
  __int16 v67;
  _BYTE *v68;
  size_t v69;
  size_t v70;
  uint64_t v71;
  size_t v72;
  WTF::StringImpl *v73;
  int v74;
  int v75;
  WTF::StringImpl *v76;
  CGContextRef v77;
  WTF::StringImpl *v78;
  WTF::StringImpl *v79;
  CGContext *v80;
  WTF::StringImpl *v81;
  WTF::StringImpl *v82;
  WTF::StringImpl *v83;
  char *v84;
  int8x16_t v85;
  int8x16_t v86;
  char *v87;
  char *v88;
  char *v89;
  char *v90;
  __int128 v91;
  int8x16_t v92;
  __int128 v93;
  __int128 v94;
  char *v95;
  char *v96;
  char *v97;
  unsigned __int128 *v98;
  unsigned __int128 *v99;
  unsigned __int128 v100;
  unsigned __int128 *v101;
  unsigned __int128 *v102;
  unsigned __int128 v103;
  char v104;
  char v105;
  unsigned int *v106;
  CGContext *v107;
  int v108;
  uint64_t v109;
  int v110;
  const WTF::String *v111;
  float v112;
  WTF::StringImpl *v113;
  WTF::StringImpl *v114;
  WTF::StringImpl *v115;
  CGContext *v116;
  int v117;
  uint64_t v118;
  int v119;
  const WTF::String *v120;
  WTF::StringImpl *v121;
  WTF::StringImpl *v122;
  WTF::StringImpl *v123;
  float v124;
  float v125;
  CGColor *v126;
  CGContext *v127;
  unint64_t v128;
  int v129;
  WebCore *v130;
  float v131;
  float v132;
  const WTF::String *v133;
  const WTF::String *v134;
  WTF::StringImpl *v135;
  WTF::StringImpl *v136;
  float v137;
  CGContext *v138;
  unsigned int *v139;
  unsigned int *v140;
  CGColor *v141;
  CGContext *v142;
  CGColor *v143;
  CGContext *v144;
  WebCore *v145;
  float v146;
  float v147;
  const WTF::String *v148;
  const WTF::String *v149;
  WTF::StringImpl *v150;
  WTF::StringImpl *v151;
  CGContext *v152;
  float v153;
  unsigned int *v154;
  CGContext *v155;
  int v156;
  CGContext *v157;
  int v158;
  CGContext *v159;
  int v160;
  CGContext *v161;
  int v162;
  CGContext *v163;
  int v164;
  CGContext *v165;
  CGContext *v166;
  CGContext *v167;
  CGContext *v168;
  CGContext *v169;
  uint64_t v170;
  int64x2_t *p_n_4;
  double v172;
  float v173;
  WTF::StringImpl *v174;
  float v175;
  const WTF::String *v176;
  const WTF::String *v177;
  unsigned int v178;
  unsigned int v179;
  float v180;
  float v181;
  float v182;
  double v183;
  unsigned int *v184;
  unsigned int v185;
  unsigned int v186;
  CGColor *v187;
  CGFloat v188;
  unint64_t v189;
  unint64_t v190;
  unint64_t v191;
  unint64_t v192;
  unint64_t v193;
  int v194;
  unsigned int *v195;
  unsigned int *v196;
  WTF::StringImpl *v197;
  WTF::StringImpl *v198;
  WTF::StringImpl *v199;
  WTF::StringImpl *v200;
  WTF::StringImpl *v201;
  int v202;
  uint64_t v203;
  uint64_t v204;
  float v205;
  float v206;
  float v207;
  CGContextRef c;
  char v209;
  WTF::StringImpl *v210;
  char __s[124];
  unsigned int __n;
  int64x2_t __n_4;
  __int128 v214;
  uint64_t v215;
  int8x16x2_t v216;
  int8x16x2_t v217;
  int8x16x2_t v218;
  int8x16x2_t v219;
  int8x16x2_t v220;
  int8x16x2_t v221;
  int8x16x2_t v222;
  CGRect v223;

  v3 = MEMORY[0x1E0C80A78](self, a2);
  v5 = v4;
  v215 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(v3 + 32);
  v7 = atomic_load(&qword_1ECE814C8);
  if (v7 != -1)
  {
    __n_4.i64[0] = (uint64_t)&v201;
    *(_QWORD *)__s = &__n_4;
    std::__call_once(&qword_1ECE814C8, __s, (void (__cdecl *)(void *))std::__call_once_proxy[abi:sn180100]<std::tuple<WebCore::historicUsageData(void)::$_0 &&>>);
  }
  v8 = qword_1ECE814C0;
  if ((objc_msgSend(*(id *)(v6 + 40), "contentsAreFlipped") & 1) == 0)
  {
    CGContextScaleCTM(v5, 1.0, -1.0);
    CGContextTranslateCTM(v5, 0.0, -180.0);
  }
  CGContextSetShouldAntialias(v5, 0);
  CGContextSetShouldSmoothFonts(v5, 0);
  v9 = WebCore::PageOverlay::bounds(*(WebCore::PageOverlay **)(v6 + 16));
  v223.origin.x = (double)(int)v9;
  v223.origin.y = (double)SHIDWORD(v9);
  v11 = (double)(int)v10;
  v12 = HIDWORD(v10);
  v223.size.height = (double)SHIDWORD(v10);
  v223.size.width = (double)(int)v10;
  CGContextClearRect(v5, v223);
  i = (unint64_t)&unk_1ECE81000;
  if (_MergedGlobals_115 == 1)
  {
    v16 = (CGContext *)qword_1ECE814B8;
  }
  else
  {
    __n_4 = vdupq_n_s64(0x3FECCCCCC0000000uLL);
    v214 = xmmword_1968C0D10;
    {
      WebCore::namedColorSpace<kCGColorSpaceSRGB>(void)::colorSpace = 0;
    }
    v189 = atomic_load(&WebCore::namedColorSpace<kCGColorSpaceSRGB>(void)::onceFlag);
    if (v189 != -1)
    {
      *(_QWORD *)__s = &v210;
      v201 = (WTF::StringImpl *)__s;
      std::__call_once(&WebCore::namedColorSpace<kCGColorSpaceSRGB>(void)::onceFlag, &v201, (void (__cdecl *)(void *))std::__call_once_proxy[abi:sn180100]<std::tuple<CGColorSpace * WebCore::namedColorSpace<kCGColorSpaceSRGB>(void)::{lambda(void)#1} &&>>);
    }
    v13 = CGColorCreate((CGColorSpaceRef)WebCore::namedColorSpace<kCGColorSpaceSRGB>(void)::colorSpace, (const CGFloat *)__n_4.i64);
    v16 = v13;
    qword_1ECE814B8 = (uint64_t)v13;
    _MergedGlobals_115 = 1;
  }
  v17 = *(_DWORD *)(v8 + 280);
  if (v17)
    v18 = v17 - 1;
  else
    v18 = 69;
  if (v18 >= 0x46)
    goto LABEL_321;
  WTF::numberToFixedPrecisionString();
  v19 = strlen(__s);
  __n = v19;
  if ((v19 & 0x80000000) != 0
    || (v20 = v19 + 13, __OFADD__(v19, 13))
    || (WTF::tryFastCompactMalloc((WTF *)(v20 + 20)), (v22 = __n_4.i64[0]) == 0))
  {
    v201 = 0;
    __break(0xC471u);
    JUMPOUT(0x194E4E878);
  }
  *(_DWORD *)__n_4.i64[0] = 2;
  *(_DWORD *)(v22 + 4) = v20;
  qmemcpy((void *)(v22 + 20), "        CPU: ", 13);
  *(_QWORD *)(v22 + 8) = v22 + 20;
  *(_DWORD *)(v22 + 16) = 4;
  if (__n)
  {
    v23 = (_BYTE *)(v22 + 33);
    if (__n == 1)
      *v23 = __s[0];
    else
      memcpy(v23, __s, __n);
  }
  v201 = (WTF::StringImpl *)v22;
  WebCore::showText(v5, v16, 10.0, 20.0, (CGColor *)&v201, v21);
  v13 = v201;
  v201 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      goto LABEL_322;
    *(_DWORD *)v13 -= 2;
  }
  while (1)
  {
    v24 = *(CGContext **)(i + 1208);
    v25 = (WTF::String *)WTF::memoryFootprint(v13);
    WebCore::formatByteNumber((WebCore *)&v200, v25);
    if (v200)
    {
      v26 = *((_DWORD *)v200 + 1);
      if (v26 < 0 || (v27 = (v26 + 13), __OFADD__(v26, 13)))
      {
LABEL_360:
        __break(0xC471u);
        JUMPOUT(0x194E4E880);
      }
      v28 = (*((unsigned __int8 *)v200 + 16) >> 2) & 1;
    }
    else
    {
      v28 = 1;
      v27 = 13;
    }
    WTF::tryMakeStringImplFromAdaptersInternal<WTF::StringTypeAdapter<WTF::ASCIILiteral,void>,WTF::StringTypeAdapter<WTF::String,void>>(v27, v28, (int8x16_t *)"  Footprint: ", 0xDu, (uint64_t)v200, &__n_4);
    v201 = (WTF::StringImpl *)__n_4.i64[0];
    if (!__n_4.i64[0])
      goto LABEL_360;
    WebCore::showText(v5, v24, 10.0, 30.0, (CGColor *)&v201, v29);
    v30 = v201;
    v201 = 0;
    if (v30)
    {
      if (*(_DWORD *)v30 == 2)
        WTF::StringImpl::destroy(v30, v14);
      else
        *(_DWORD *)v30 -= 2;
    }
    v13 = v200;
    v200 = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
        v13 = (CGContext *)WTF::StringImpl::destroy(v13, v14);
      else
        *(_DWORD *)v13 -= 2;
    }
    v31 = *(_DWORD *)(v8 + 1416);
    v32 = v31 ? v31 - 1 : 69;
    if (v32 < 0x46)
      break;
LABEL_321:
    __break(1u);
LABEL_322:
    v13 = (CGContext *)WTF::StringImpl::destroy(v13, v14);
  }
  v33 = *(CGContext **)(i + 1208);
  WebCore::formatByteNumber((WebCore *)&v199, *(WTF::String **)(v8 + 8 * v32 + 856));
  if (v199)
  {
    v34 = *((_DWORD *)v199 + 1);
    if (v34 < 0 || (v35 = (v34 + 13), __OFADD__(v34, 13)))
    {
LABEL_361:
      __break(0xC471u);
      JUMPOUT(0x194E4E888);
    }
    v36 = (*((unsigned __int8 *)v199 + 16) >> 2) & 1;
  }
  else
  {
    v36 = 1;
    v35 = 13;
  }
  WTF::tryMakeStringImplFromAdaptersInternal<WTF::StringTypeAdapter<WTF::ASCIILiteral,void>,WTF::StringTypeAdapter<WTF::String,void>>(v35, v36, (int8x16_t *)"   External: ", 0xDu, (uint64_t)v199, &__n_4);
  v201 = (WTF::StringImpl *)__n_4.i64[0];
  if (!__n_4.i64[0])
    goto LABEL_361;
  WebCore::showText(v5, v33, 10.0, 40.0, (CGColor *)&v201, v37);
  v38 = v201;
  v201 = 0;
  if (v38)
  {
    if (*(_DWORD *)v38 == 2)
      WTF::StringImpl::destroy(v38, v14);
    else
      *(_DWORD *)v38 -= 2;
  }
  v194 = v12;
  v196 = (unsigned int *)(v8 + 16392);
  v13 = v199;
  v199 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      v13 = (CGContext *)WTF::StringImpl::destroy(v13, v14);
    else
      *(_DWORD *)v13 -= 2;
  }
  v39 = v8 + 1992;
  v195 = (unsigned int *)v8;
  v40 = v8 + 19272;
  v41 = 55.0;
  i = 1;
  v193 = v8 + 1992;
  do
  {
    v42 = *(_DWORD *)(v39 + 576);
    if (v42)
      v43 = v42 - 1;
    else
      v43 = 69;
    if (v43 >= 0x46)
      goto LABEL_321;
    v44 = *(_DWORD *)(v39 + 1144);
    v45 = v44 ? v44 - 1 : 69;
    if (v45 >= 0x46)
      goto LABEL_321;
    v46 = *(_DWORD *)(v39 + 1712);
    v47 = v46 ? v46 - 1 : 69;
    if (v47 >= 0x46)
      goto LABEL_321;
    v48 = *(WTF::String **)(v39 + 8 * v43 + 16);
    v49 = *(WTF::String **)(v39 + 8 * v45 + 584);
    v8 = *(_QWORD *)(v39 + 8 * v47 + 1152);
    __n_4 = 0uLL;
    LODWORD(v214) = 0;
    BYTE4(v214) = 1;
    v50 = *(_QWORD *)v39;
    if (*(_QWORD *)v39)
      *(_DWORD *)v50 += 4;
    WebCore::formatByteNumber((WebCore *)&v201, v48);
    v51 = v201;
    v52 = __n_4.i64[1];
    if ((__n_4.i64[1] || (v52 = __n_4.i64[0]) != 0) && (*(_BYTE *)(v52 + 16) & 4) == 0
      || v50 && (*(_BYTE *)(v50 + 16) & 4) == 0
      || v201 && (*((_BYTE *)v201 + 16) & 4) == 0)
    {
      v53 = (_WORD *)WTF::StringBuilder::extendBufferForAppendingWithUpconvert((WTF::StringBuilder *)&__n_4);
      v12 = (unint64_t)v53;
      if (v53)
      {
        if (v50)
        {
          v56 = *(unsigned int *)(v50 + 4);
          if (v56 <= 0xA)
          {
            v57 = 11 - v56;
            memset_pattern16(v53, asc_1968C0D40, 2 * (11 - v56));
            v53 = (_WORD *)(v12 + 2 * v57);
            i = 1;
            v56 = *(unsigned int *)(v50 + 4);
          }
          v54 = *(_OWORD **)(v50 + 8);
          if ((*(_BYTE *)(v50 + 16) & 4) != 0)
          {
            if (v56 >= 0x40)
            {
              v65 = (char *)&v53[v56 & 0xFFFFFFC0];
              v90 = (char *)v53;
              v91 = 0u;
              do
              {
                v217.val[0] = (int8x16_t)*v54;
                v92 = *((int8x16_t *)v54 + 1);
                v219.val[0] = (int8x16_t)v54[2];
                v93 = v54[3];
                v54 += 4;
                v94 = v93;
                v219.val[1] = 0u;
                v221.val[0] = v92;
                v217.val[1] = 0u;
                v95 = v90;
                vst2q_s8(v95, v217);
                v95 += 32;
                v221.val[1] = 0u;
                vst2q_s8(v95, v221);
                v96 = v90 + 64;
                vst2q_s8(v96, v219);
                v97 = v90 + 96;
                vst2q_s8(v97, *(int8x16x2_t *)(&v91 - 1));
                v90 += 128;
              }
              while (v90 != v65);
            }
            else
            {
              v65 = (char *)v53;
            }
            v66 = (char *)&v53[v56];
            while (v65 != v66)
            {
              v67 = *(unsigned __int8 *)v54;
              v54 = (_OWORD *)((char *)v54 + 1);
              *(_WORD *)v65 = v67;
              v65 += 2;
            }
          }
          else if (v56 == 1)
          {
            *v53 = *(_WORD *)v54;
          }
          else if (v56)
          {
            memcpy(v53, v54, 2 * v56);
          }
          v58 = *(_DWORD *)(v50 + 4);
        }
        else
        {
          memset_pattern16(v53, asc_1968C0D40, 0x16uLL);
          v58 = 0;
        }
        if (v58 <= 0xB)
          v58 = 11;
        v59 = (_DWORD *)(v12 + 2 * v58);
        *v59 = 2097210;
        v60 = (char *)(v59 + 1);
        if (v51)
        {
          v54 = (_OWORD *)*((_QWORD *)v51 + 1);
          v61 = *((unsigned int *)v51 + 1);
          if ((*((_BYTE *)v51 + 16) & 4) != 0)
          {
            if (v61 >= 0x40)
            {
              v62 = &v60[2 * (v61 & 0xFFFFFFC0)];
              v84 = v60;
              do
              {
                v216.val[0] = (int8x16_t)*v54;
                v85 = *((int8x16_t *)v54 + 1);
                v218.val[0] = (int8x16_t)v54[2];
                v86 = *((int8x16_t *)v54 + 3);
                v54 += 4;
                v220.val[0] = v86;
                v218.val[1] = 0u;
                v222.val[0] = v85;
                v216.val[1] = 0u;
                v87 = v84;
                vst2q_s8(v87, v216);
                v87 += 32;
                v220.val[1] = 0u;
                v222.val[1] = 0u;
                vst2q_s8(v87, v222);
                v88 = v84 + 64;
                vst2q_s8(v88, v218);
                v89 = v84 + 96;
                v84 += 128;
                vst2q_s8(v89, v220);
              }
              while (v84 != v62);
            }
            else
            {
              v62 = v60;
            }
            v63 = &v60[2 * v61];
            while (v62 != v63)
            {
              v64 = *(unsigned __int8 *)v54;
              v54 = (_OWORD *)((char *)v54 + 1);
              *(_WORD *)v62 = v64;
              v62 += 2;
            }
          }
          else
          {
            if ((_DWORD)v61 == 1)
            {
              *(_WORD *)v60 = *(_WORD *)v54;
              goto LABEL_109;
            }
            if ((_DWORD)v61)
            {
              v72 = 2 * v61;
LABEL_108:
              memcpy(v60, v54, v72);
            }
          }
        }
      }
    }
    else
    {
      v68 = (_BYTE *)MEMORY[0x19AEA4824](&__n_4);
      v12 = (unint64_t)v68;
      if (v68)
      {
        if (v50)
        {
          v69 = *(unsigned int *)(v50 + 4);
          if (v69 <= 0xA)
          {
            v70 = 11 - v69;
            memset(v68, 32, 11 - v69);
            v68 = (_BYTE *)(v12 + v70);
            i = 1;
            v69 = *(unsigned int *)(v50 + 4);
          }
          v54 = *(_OWORD **)(v50 + 8);
          if ((*(_BYTE *)(v50 + 16) & 4) != 0)
          {
            if (v69)
            {
              if (v69 == 1)
                *v68 = *(_BYTE *)v54;
              else
                memcpy(v68, v54, v69);
            }
          }
          else
          {
            if (v69 < 0x10)
            {
              v101 = (unsigned __int128 *)v68;
            }
            else
            {
              v101 = (unsigned __int128 *)&v68[v69 & 0xFFFFFFF0];
              v102 = (unsigned __int128 *)v68;
              do
              {
                v103 = (unsigned __int128)vld2q_s8((const char *)v54);
                v54 += 2;
                *v102++ = v103;
              }
              while (v102 != v101);
            }
            for (i = 1; v101 != (unsigned __int128 *)&v68[v69]; v101 = (unsigned __int128 *)((char *)v101 + 1))
            {
              v105 = *(_BYTE *)v54;
              v54 = (_OWORD *)((char *)v54 + 2);
              *(_BYTE *)v101 = v105;
            }
          }
          LODWORD(v71) = *(_DWORD *)(v50 + 4);
        }
        else
        {
          LODWORD(v71) = 0;
          memset(v68, 32, 11);
        }
        v71 = v71 <= 0xB ? 11 : v71;
        *(_WORD *)(v12 + v71) = 8250;
        v60 = (char *)(v12 + v71 + 2);
        if (v51)
        {
          v54 = (_OWORD *)*((_QWORD *)v51 + 1);
          v72 = *((unsigned int *)v51 + 1);
          if ((*((_BYTE *)v51 + 16) & 4) != 0)
          {
            if (!(_DWORD)v72)
              goto LABEL_109;
            if ((_DWORD)v72 != 1)
              goto LABEL_108;
            *v60 = *(_BYTE *)v54;
          }
          else
          {
            if (v72 < 0x10)
            {
              v98 = (unsigned __int128 *)(v12 + v71 + 2);
            }
            else
            {
              v98 = (unsigned __int128 *)&v60[v72 & 0xFFFFFFF0];
              v99 = (unsigned __int128 *)v60;
              do
              {
                v100 = (unsigned __int128)vld2q_s8((const char *)v54);
                v54 += 2;
                *v99++ = v100;
              }
              while (v99 != v98);
            }
            for (i = 1; v98 != (unsigned __int128 *)&v60[v72]; v98 = (unsigned __int128 *)((char *)v98 + 1))
            {
              v104 = *(_BYTE *)v54;
              v54 = (_OWORD *)((char *)v54 + 2);
              *(_BYTE *)v98 = v104;
            }
          }
        }
      }
    }
LABEL_109:
    v73 = v201;
    v201 = 0;
    if (!v73)
      goto LABEL_112;
    if (*(_DWORD *)v73 != 2)
    {
      *(_DWORD *)v73 -= 2;
LABEL_112:
      if (!v50)
        goto LABEL_117;
      goto LABEL_113;
    }
    WTF::StringImpl::destroy(v73, (WTF::StringImpl *)v54);
    if (!v50)
      goto LABEL_117;
LABEL_113:
    v74 = *(_DWORD *)v50 - 2;
    if (*(_DWORD *)v50 == 2)
    {
      WTF::StringImpl::destroy((WTF::StringImpl *)v50, (WTF::StringImpl *)v54);
      v74 = *(_DWORD *)v50;
    }
    else
    {
      *(_DWORD *)v50 = v74;
    }
    v75 = v74 - 2;
    if (v75)
      *(_DWORD *)v50 = v75;
    else
      WTF::StringImpl::destroy((WTF::StringImpl *)v50, (WTF::StringImpl *)v54);
LABEL_117:
    if (!v8)
      goto LABEL_121;
    WebCore::formatByteNumber((WebCore *)&c, (WTF::String *)v8);
    v201 = (WTF::StringImpl *)" + ";
    v202 = 3;
    v210 = c;
    WTF::StringBuilder::appendFromAdapters<WTF::StringTypeAdapter<WTF::ASCIILiteral,void>,WTF::StringTypeAdapter<WTF::String,void>>((WTF::StringBuilder *)&__n_4, (uint64_t)&v201, (uint64_t *)&v210);
    v77 = c;
    c = 0;
    if (!v77)
      goto LABEL_121;
    if (*(_DWORD *)v77 != 2)
    {
      *(_DWORD *)v77 -= 2;
LABEL_121:
      if (!v49)
        goto LABEL_125;
      goto LABEL_122;
    }
    WTF::StringImpl::destroy(v77, v76);
    if (!v49)
      goto LABEL_125;
LABEL_122:
    WebCore::formatByteNumber((WebCore *)&c, v49);
    v201 = (WTF::StringImpl *)" [";
    v202 = 2;
    v210 = c;
    LOBYTE(v204) = 93;
    WTF::StringBuilder::appendFromAdapters<WTF::StringTypeAdapter<WTF::ASCIILiteral,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<char,void>>((WTF::StringBuilder *)&__n_4, (int8x16_t **)&v201, (uint64_t *)&v210, (char *)&v204);
    v79 = c;
    c = 0;
    if (v79)
    {
      if (*(_DWORD *)v79 == 2)
        WTF::StringImpl::destroy(v79, v78);
      else
        *(_DWORD *)v79 -= 2;
    }
LABEL_125:
    v80 = *(CGContext **)(v39 + 8);
    v81 = (WTF::StringImpl *)__n_4.i64[0];
    if (__n_4.i64[0]
      || (WTF::StringBuilder::shrinkToFit((WTF::StringBuilder *)&__n_4),
          WTF::StringBuilder::reifyString((WTF::StringBuilder *)&__n_4),
          (v81 = (WTF::StringImpl *)__n_4.i64[0]) != 0))
    {
      *(_DWORD *)v81 += 2;
    }
    v201 = v81;
    WebCore::showText(v5, v80, 10.0, v41, (CGColor *)&v201, v55);
    v82 = v201;
    v201 = 0;
    if (v82)
    {
      if (*(_DWORD *)v82 == 2)
        WTF::StringImpl::destroy(v82, v14);
      else
        *(_DWORD *)v82 -= 2;
    }
    v83 = (WTF::StringImpl *)__n_4.i64[1];
    __n_4.i64[1] = 0;
    if (v83)
    {
      if (*(_DWORD *)v83 == 2)
        WTF::StringImpl::destroy(v83, v14);
      else
        *(_DWORD *)v83 -= 2;
    }
    v13 = (CGContext *)__n_4.i64[0];
    __n_4.i64[0] = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
        v13 = (CGContext *)WTF::StringImpl::destroy(v13, v14);
      else
        *(_DWORD *)v13 -= 2;
    }
    v41 = v41 + 10.0;
    v39 += 1728;
  }
  while (v39 != v40);
  WTF::MonotonicTime::now(v13);
  v106 = v195;
  v107 = (CGContext *)qword_1ECE814B8;
  WTF::String::numberToStringFixedPrecision();
  if (v198)
  {
    v108 = *((_DWORD *)v198 + 1);
    if ((v108 & 0x80000000) == 0)
    {
      v109 = (v108 + 13);
      if (!__OFADD__(v108, 13))
      {
        v110 = (*((unsigned __int8 *)v198 + 16) >> 2) & 1;
        goto LABEL_183;
      }
    }
    goto LABEL_362;
  }
  v110 = 1;
  v109 = 13;
LABEL_183:
  WTF::tryMakeStringImplFromAdaptersInternal<WTF::StringTypeAdapter<WTF::ASCIILiteral,void>,WTF::StringTypeAdapter<WTF::String,void>>(v109, v110, (int8x16_t *)"    Eden GC: ", 0xDu, (uint64_t)v198, &__n_4);
  v201 = (WTF::StringImpl *)__n_4.i64[0];
  if (!__n_4.i64[0])
  {
LABEL_362:
    __break(0xC471u);
    JUMPOUT(0x194E4E890);
  }
  v112 = v41 + -5.0;
  WebCore::showText(v5, v107, 10.0, v112 + 10.0, (CGColor *)&v201, v111);
  v114 = v201;
  v201 = 0;
  if (v114)
  {
    if (*(_DWORD *)v114 == 2)
      WTF::StringImpl::destroy(v114, v113);
    else
      *(_DWORD *)v114 -= 2;
  }
  v115 = v198;
  v198 = 0;
  if (v115)
  {
    if (*(_DWORD *)v115 == 2)
      WTF::StringImpl::destroy(v115, v113);
    else
      *(_DWORD *)v115 -= 2;
  }
  v116 = (CGContext *)qword_1ECE814B8;
  WTF::String::numberToStringFixedPrecision();
  if (v197)
  {
    v117 = *((_DWORD *)v197 + 1);
    if ((v117 & 0x80000000) == 0)
    {
      v118 = (v117 + 13);
      if (!__OFADD__(v117, 13))
      {
        v119 = (*((unsigned __int8 *)v197 + 16) >> 2) & 1;
        goto LABEL_194;
      }
    }
    goto LABEL_363;
  }
  v119 = 1;
  v118 = 13;
LABEL_194:
  WTF::tryMakeStringImplFromAdaptersInternal<WTF::StringTypeAdapter<WTF::ASCIILiteral,void>,WTF::StringTypeAdapter<WTF::String,void>>(v118, v119, (int8x16_t *)"    Full GC: ", 0xDu, (uint64_t)v197, &__n_4);
  v201 = (WTF::StringImpl *)__n_4.i64[0];
  if (!__n_4.i64[0])
  {
LABEL_363:
    __break(0xC471u);
    JUMPOUT(0x194E4E898);
  }
  WebCore::showText(v5, v116, 10.0, v112 + 20.0, (CGColor *)&v201, v120);
  v122 = v201;
  v201 = 0;
  if (v122)
  {
    if (*(_DWORD *)v122 == 2)
      WTF::StringImpl::destroy(v122, v121);
    else
      *(_DWORD *)v122 -= 2;
  }
  v123 = v197;
  v197 = 0;
  if (v123)
  {
    if (*(_DWORD *)v123 == 2)
      WTF::StringImpl::destroy(v123, v121);
    else
      *(_DWORD *)v123 -= 2;
  }
  v124 = v11 + -70.0;
  v125 = (float)v194;
  c = v5;
  *(float *)&v204 = v124;
  LODWORD(v203) = 0;
  v207 = (float)v194;
  if (byte_1ECE814B1 == 1)
  {
    v126 = (CGColor *)qword_1ECE814D0;
  }
  else
  {
    __n_4 = (int64x2_t)xmmword_1968A14C0;
    v214 = xmmword_1968A14C0;
    {
      WebCore::namedColorSpace<kCGColorSpaceSRGB>(void)::colorSpace = 0;
    }
    v190 = atomic_load(&WebCore::namedColorSpace<kCGColorSpaceSRGB>(void)::onceFlag);
    if (v190 != -1)
    {
      v201 = (WTF::StringImpl *)&v206;
      v210 = (WTF::StringImpl *)&v201;
      std::__call_once(&WebCore::namedColorSpace<kCGColorSpaceSRGB>(void)::onceFlag, &v210, (void (__cdecl *)(void *))std::__call_once_proxy[abi:sn180100]<std::tuple<CGColorSpace * WebCore::namedColorSpace<kCGColorSpaceSRGB>(void)::{lambda(void)#1} &&>>);
    }
    v126 = CGColorCreate((CGColorSpaceRef)WebCore::namedColorSpace<kCGColorSpaceSRGB>(void)::colorSpace, (const CGFloat *)__n_4.i64);
    v106 = v195;
    qword_1ECE814D0 = (uint64_t)v126;
    byte_1ECE814B1 = 1;
  }
  CGContextSetStrokeColorWithColor(v5, v126);
  CGContextSetLineWidth(v5, 1.0);
  LODWORD(v201) = 0;
  v13 = (CGContext *)WTF::fastMalloc((WTF *)0x30);
  v127 = v13;
  *(_QWORD *)v13 = off_1E32D5770;
  *((_QWORD *)v13 + 1) = &v207;
  *((_QWORD *)v13 + 2) = &v203;
  *((_QWORD *)v13 + 3) = &c;
  *((_QWORD *)v13 + 4) = &v204;
  *((_QWORD *)v13 + 5) = &v201;
  v128 = v106[70];
  v129 = 70;
  do
  {
    if (v128 >= 0x46)
      goto LABEL_321;
    v13 = (CGContext *)(*(uint64_t (**)(CGContext *, float))(*(_QWORD *)v127 + 16))(v127, *(float *)&v106[v128]);
    if (v128 == 69)
      v128 = 0;
    else
      ++v128;
    --v129;
  }
  while (v129);
  (*(void (**)(CGContext *))(*(_QWORD *)v127 + 8))(v127);
  v130 = c;
  v131 = *(float *)&v204;
  v132 = v207;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  WebCore::drawGraphLabel(v130, (CGContext *)&__n_4, v131, v132, v133, v134);
  v136 = (WTF::StringImpl *)__n_4.i64[0];
  __n_4.i64[0] = 0;
  if (v136)
  {
    if (*(_DWORD *)v136 == 2)
      WTF::StringImpl::destroy(v136, v135);
    else
      *(_DWORD *)v136 -= 2;
  }
  v137 = v11 + -140.0;
  c = v5;
  v206 = (float)v194;
  v207 = v137;
  v205 = (float)v194;
  v204 = 0;
  v13 = (CGContext *)WTF::fastMalloc((WTF *)0x10);
  v138 = v13;
  v139 = v106 + 356;
  v140 = v106 + 2662;
  *(_QWORD *)v13 = off_1E32D5798;
  *((_QWORD *)v13 + 1) = &v204;
  v8 = v106[2802];
  LODWORD(v12) = 70;
  do
  {
    if (v8 >= 0x46)
      goto LABEL_321;
    v13 = (CGContext *)(*(uint64_t (**)(CGContext *, _QWORD))(*(_QWORD *)v138 + 16))(v138, *(_QWORD *)&v140[2 * v8]);
    if (v8 == 69)
      v8 = 0;
    else
      ++v8;
    LODWORD(v12) = v12 - 1;
  }
  while ((_DWORD)v12);
  (*(void (**)(CGContext *))(*(_QWORD *)v138 + 8))(v138);
  CGContextSetLineWidth(v5, 1.0);
  if (byte_1ECE814B4 == 1)
  {
    v141 = (CGColor *)qword_1ECE814E8;
  }
  else
  {
    __n_4 = (int64x2_t)xmmword_1968A14B0;
    v214 = xmmword_1968C0D20;
    {
      WebCore::namedColorSpace<kCGColorSpaceSRGB>(void)::colorSpace = 0;
    }
    v191 = atomic_load(&WebCore::namedColorSpace<kCGColorSpaceSRGB>(void)::onceFlag);
    if (v191 != -1)
    {
      v201 = (WTF::StringImpl *)&v203;
      v210 = (WTF::StringImpl *)&v201;
      std::__call_once(&WebCore::namedColorSpace<kCGColorSpaceSRGB>(void)::onceFlag, &v210, (void (__cdecl *)(void *))std::__call_once_proxy[abi:sn180100]<std::tuple<CGColorSpace * WebCore::namedColorSpace<kCGColorSpaceSRGB>(void)::{lambda(void)#1} &&>>);
    }
    v141 = CGColorCreate((CGColorSpaceRef)WebCore::namedColorSpace<kCGColorSpaceSRGB>(void)::colorSpace, (const CGFloat *)__n_4.i64);
    v106 = v195;
    qword_1ECE814E8 = (uint64_t)v141;
    byte_1ECE814B4 = 1;
  }
  CGContextSetStrokeColorWithColor(v5, v141);
  v203 = 0;
  v13 = (CGContext *)WTF::fastMalloc((WTF *)0x38);
  v142 = v13;
  *(_QWORD *)v13 = off_1E32D57C0;
  *((_QWORD *)v13 + 1) = &v204;
  *((_QWORD *)v13 + 2) = &c;
  *((_QWORD *)v13 + 3) = &v207;
  *((_QWORD *)v13 + 4) = &v203;
  *((_QWORD *)v13 + 5) = &v206;
  *((_QWORD *)v13 + 6) = &v205;
  v8 = v106[2802];
  LODWORD(v12) = 70;
  do
  {
    if (v8 >= 0x46)
      goto LABEL_321;
    v13 = (CGContext *)(*(uint64_t (**)(CGContext *, _QWORD))(*(_QWORD *)v142 + 16))(v142, *(_QWORD *)&v140[2 * v8]);
    if (v8 == 69)
      v8 = 0;
    else
      ++v8;
    LODWORD(v12) = v12 - 1;
  }
  while ((_DWORD)v12);
  (*(void (**)(CGContext *))(*(_QWORD *)v142 + 8))(v142);
  if (byte_1ECE814B5 == 1)
  {
    v143 = (CGColor *)qword_1ECE814F0;
  }
  else
  {
    __n_4 = (int64x2_t)xmmword_1968C0D30;
    v214 = xmmword_1968C0D10;
    {
      WebCore::namedColorSpace<kCGColorSpaceSRGB>(void)::colorSpace = 0;
    }
    v192 = atomic_load(&WebCore::namedColorSpace<kCGColorSpaceSRGB>(void)::onceFlag);
    if (v192 != -1)
    {
      v201 = (WTF::StringImpl *)&v209;
      v210 = (WTF::StringImpl *)&v201;
      std::__call_once(&WebCore::namedColorSpace<kCGColorSpaceSRGB>(void)::onceFlag, &v210, (void (__cdecl *)(void *))std::__call_once_proxy[abi:sn180100]<std::tuple<CGColorSpace * WebCore::namedColorSpace<kCGColorSpaceSRGB>(void)::{lambda(void)#1} &&>>);
    }
    v143 = CGColorCreate((CGColorSpaceRef)WebCore::namedColorSpace<kCGColorSpaceSRGB>(void)::colorSpace, (const CGFloat *)__n_4.i64);
    v106 = v195;
    qword_1ECE814F0 = (uint64_t)v143;
    byte_1ECE814B5 = 1;
  }
  CGContextSetStrokeColorWithColor(c, v143);
  v203 = 0;
  v13 = (CGContext *)WTF::fastMalloc((WTF *)0x38);
  v144 = v13;
  *(_QWORD *)v13 = off_1E32D57E8;
  *((_QWORD *)v13 + 1) = &v204;
  *((_QWORD *)v13 + 2) = &c;
  *((_QWORD *)v13 + 3) = &v207;
  *((_QWORD *)v13 + 4) = &v203;
  *((_QWORD *)v13 + 5) = &v206;
  *((_QWORD *)v13 + 6) = &v205;
  v8 = v106[496];
  LODWORD(v12) = 70;
  do
  {
    if (v8 >= 0x46)
      goto LABEL_321;
    v13 = (CGContext *)(*(uint64_t (**)(CGContext *, _QWORD))(*(_QWORD *)v144 + 16))(v144, *(_QWORD *)&v139[2 * v8]);
    if (v8 == 69)
      v8 = 0;
    else
      ++v8;
    LODWORD(v12) = v12 - 1;
  }
  while ((_DWORD)v12);
  (*(void (**)(CGContext *))(*(_QWORD *)v144 + 8))(v144);
  v145 = c;
  v147 = v206;
  v146 = v207;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  WebCore::drawGraphLabel(v145, (CGContext *)&__n_4, v146, v147, v148, v149);
  v151 = (WTF::StringImpl *)__n_4.i64[0];
  __n_4.i64[0] = 0;
  if (v151)
  {
    if (*(_DWORD *)v151 == 2)
      WTF::StringImpl::destroy(v151, v150);
    else
      *(_DWORD *)v151 -= 2;
  }
  v201 = 0;
  v13 = (CGContext *)WTF::fastMalloc((WTF *)0x10);
  v152 = v13;
  v154 = v106 + 72;
  *(_QWORD *)v13 = off_1E32D5810;
  *((_QWORD *)v13 + 1) = &v201;
  v8 = v106[212];
  LODWORD(v12) = 70;
  do
  {
    if (v8 >= 0x46)
      goto LABEL_321;
    v13 = (CGContext *)(*(uint64_t (**)(CGContext *, _QWORD))(*(_QWORD *)v152 + 16))(v152, *(_QWORD *)&v154[2 * v8]);
    if (v8 == 69)
      v8 = 0;
    else
      ++v8;
    LODWORD(v12) = v12 - 1;
  }
  while ((_DWORD)v12);
  (*(void (**)(CGContext *))(*(_QWORD *)v152 + 8))(v152);
  CGContextSetLineWidth(v5, 1.0);
  LODWORD(v210) = 0;
  v13 = (CGContext *)WTF::fastMalloc((WTF *)0x20);
  v155 = v13;
  v12 = (unint64_t)(v106 + 502);
  v8 = (unint64_t)off_1E32D5838;
  *(_QWORD *)v13 = off_1E32D5838;
  *((_QWORD *)v13 + 1) = &__n_4;
  *((_QWORD *)v13 + 2) = &v210;
  *((_QWORD *)v13 + 3) = v193;
  i = v106[642];
  v156 = 70;
  do
  {
    if (i >= 0x46)
      goto LABEL_321;
    v13 = (CGContext *)(*(uint64_t (**)(CGContext *, _QWORD))(*(_QWORD *)v155 + 16))(v155, *(_QWORD *)(v12 + 8 * i));
    if (i == 69)
      i = 0;
    else
      ++i;
    --v156;
  }
  while (v156);
  (*(void (**)(CGContext *))(*(_QWORD *)v155 + 8))(v155);
  LODWORD(v210) = 0;
  v13 = (CGContext *)WTF::fastMalloc((WTF *)0x20);
  v157 = v13;
  v12 = (unint64_t)(v106 + 934);
  *(_QWORD *)v13 = off_1E32D5838;
  *((_QWORD *)v13 + 1) = &__n_4;
  *((_QWORD *)v13 + 2) = &v210;
  *((_QWORD *)v13 + 3) = v106 + 930;
  i = v106[1074];
  v158 = 70;
  do
  {
    if (i > 0x45)
      goto LABEL_321;
    v13 = (CGContext *)(*(uint64_t (**)(CGContext *, _QWORD))(*(_QWORD *)v157 + 16))(v157, *(_QWORD *)(v12 + 8 * i));
    if (i == 69)
      i = 0;
    else
      ++i;
    --v158;
  }
  while (v158);
  (*(void (**)(CGContext *))(*(_QWORD *)v157 + 8))(v157);
  LODWORD(v210) = 0;
  v13 = (CGContext *)WTF::fastMalloc((WTF *)0x20);
  v159 = v13;
  v12 = (unint64_t)(v106 + 1366);
  *(_QWORD *)v13 = off_1E32D5838;
  *((_QWORD *)v13 + 1) = &__n_4;
  *((_QWORD *)v13 + 2) = &v210;
  *((_QWORD *)v13 + 3) = v106 + 1362;
  i = v106[1506];
  v160 = 70;
  do
  {
    if (i > 0x45)
      goto LABEL_321;
    v13 = (CGContext *)(*(uint64_t (**)(CGContext *, _QWORD))(*(_QWORD *)v159 + 16))(v159, *(_QWORD *)(v12 + 8 * i));
    if (i == 69)
      i = 0;
    else
      ++i;
    --v160;
  }
  while (v160);
  (*(void (**)(CGContext *))(*(_QWORD *)v159 + 8))(v159);
  LODWORD(v210) = 0;
  v13 = (CGContext *)WTF::fastMalloc((WTF *)0x20);
  v161 = v13;
  v12 = (unint64_t)(v106 + 1798);
  *(_QWORD *)v13 = off_1E32D5838;
  *((_QWORD *)v13 + 1) = &__n_4;
  *((_QWORD *)v13 + 2) = &v210;
  *((_QWORD *)v13 + 3) = v106 + 1794;
  i = v106[1938];
  v162 = 70;
  do
  {
    if (i > 0x45)
      goto LABEL_321;
    v13 = (CGContext *)(*(uint64_t (**)(CGContext *, _QWORD))(*(_QWORD *)v161 + 16))(v161, *(_QWORD *)(v12 + 8 * i));
    if (i == 69)
      i = 0;
    else
      ++i;
    --v162;
  }
  while (v162);
  (*(void (**)(CGContext *))(*(_QWORD *)v161 + 8))(v161);
  LODWORD(v210) = 0;
  v13 = (CGContext *)WTF::fastMalloc((WTF *)0x20);
  v163 = v13;
  v12 = (unint64_t)(v106 + 2230);
  *(_QWORD *)v13 = off_1E32D5838;
  *((_QWORD *)v13 + 1) = &__n_4;
  *((_QWORD *)v13 + 2) = &v210;
  *((_QWORD *)v13 + 3) = v106 + 2226;
  i = v106[2370];
  v164 = 70;
  do
  {
    if (i > 0x45)
      goto LABEL_321;
    v13 = (CGContext *)(*(uint64_t (**)(CGContext *, _QWORD))(*(_QWORD *)v163 + 16))(v163, *(_QWORD *)(v12 + 8 * i));
    if (i == 69)
      i = 0;
    else
      ++i;
    --v164;
  }
  while (v164);
  (*(void (**)(CGContext *))(*(_QWORD *)v163 + 8))(v163);
  LODWORD(v210) = 0;
  v13 = (CGContext *)WTF::fastMalloc((WTF *)0x20);
  v165 = v13;
  *(_QWORD *)v13 = off_1E32D5838;
  *((_QWORD *)v13 + 1) = &__n_4;
  *((_QWORD *)v13 + 2) = &v210;
  *((_QWORD *)v13 + 3) = v106 + 2658;
  v12 = v106[2802];
  i = 70;
  do
  {
    if (v12 > 0x45)
      goto LABEL_321;
    v13 = (CGContext *)(*(uint64_t (**)(CGContext *, _QWORD))(*(_QWORD *)v165 + 16))(v165, *(_QWORD *)&v140[2 * v12]);
    if (v12 == 69)
      v12 = 0;
    else
      ++v12;
    i = (i - 1);
  }
  while ((_DWORD)i);
  (*(void (**)(CGContext *))(*(_QWORD *)v165 + 8))(v165);
  LODWORD(v210) = 0;
  v13 = (CGContext *)WTF::fastMalloc((WTF *)0x20);
  v166 = v13;
  *(_QWORD *)v13 = off_1E32D5838;
  *((_QWORD *)v13 + 1) = &__n_4;
  *((_QWORD *)v13 + 2) = &v210;
  *((_QWORD *)v13 + 3) = v106 + 3090;
  v12 = v106[3234];
  i = 70;
  do
  {
    if (v12 > 0x45)
      goto LABEL_321;
    v13 = (CGContext *)(*(uint64_t (**)(CGContext *, _QWORD))(*(_QWORD *)v166 + 16))(v166, *(_QWORD *)&v106[2 * v12 + 3094]);
    if (v12 == 69)
      v12 = 0;
    else
      ++v12;
    i = (i - 1);
  }
  while ((_DWORD)i);
  (*(void (**)(CGContext *))(*(_QWORD *)v166 + 8))(v166);
  LODWORD(v210) = 0;
  v13 = (CGContext *)WTF::fastMalloc((WTF *)0x20);
  v167 = v13;
  *(_QWORD *)v13 = off_1E32D5838;
  *((_QWORD *)v13 + 1) = &__n_4;
  *((_QWORD *)v13 + 2) = &v210;
  *((_QWORD *)v13 + 3) = v106 + 3522;
  v12 = v106[3666];
  i = 70;
  do
  {
    if (v12 > 0x45)
      goto LABEL_321;
    v13 = (CGContext *)(*(uint64_t (**)(CGContext *, _QWORD))(*(_QWORD *)v167 + 16))(v167, *(_QWORD *)&v106[2 * v12 + 3526]);
    if (v12 == 69)
      v12 = 0;
    else
      ++v12;
    i = (i - 1);
  }
  while ((_DWORD)i);
  (*(void (**)(CGContext *))(*(_QWORD *)v167 + 8))(v167);
  LODWORD(v210) = 0;
  v13 = (CGContext *)WTF::fastMalloc((WTF *)0x20);
  v168 = v13;
  *(_QWORD *)v13 = off_1E32D5838;
  *((_QWORD *)v13 + 1) = &__n_4;
  *((_QWORD *)v13 + 2) = &v210;
  *((_QWORD *)v13 + 3) = v106 + 3954;
  v12 = *v196;
  i = 70;
  do
  {
    if (v12 > 0x45)
      goto LABEL_321;
    v13 = (CGContext *)(*(uint64_t (**)(CGContext *, _QWORD))(*(_QWORD *)v168 + 16))(v168, *(_QWORD *)&v106[2 * v12 + 3958]);
    if (v12 == 69)
      v12 = 0;
    else
      ++v12;
    i = (i - 1);
  }
  while ((_DWORD)i);
  (*(void (**)(CGContext *))(*(_QWORD *)v168 + 8))(v168);
  LODWORD(v210) = 0;
  v13 = (CGContext *)WTF::fastMalloc((WTF *)0x20);
  v169 = v13;
  *(_QWORD *)v13 = off_1E32D5838;
  *((_QWORD *)v13 + 1) = &__n_4;
  *((_QWORD *)v13 + 2) = &v210;
  *((_QWORD *)v13 + 3) = v106 + 4386;
  v8 = v196[432];
  LODWORD(v12) = 70;
  do
  {
    if (v8 > 0x45)
      goto LABEL_321;
    v13 = (CGContext *)(*(uint64_t (**)(CGContext *, _QWORD))(*(_QWORD *)v169 + 16))(v169, *(_QWORD *)&v106[2 * v8 + 4390]);
    if (v8 == 69)
      v8 = 0;
    else
      ++v8;
    LODWORD(v12) = v12 - 1;
  }
  while ((_DWORD)v12);
  (*(void (**)(CGContext *))(*(_QWORD *)v169 + 8))(v169);
  v170 = 0;
  p_n_4 = &__n_4;
  do
  {
    v8 = 0;
    v153 = v11 + -210.0;
    v172 = (float)(v153 + (float)v170);
    v173 = (float)v194;
    do
    {
      LODWORD(v12) = (_DWORD)p_n_4 + v8;
      i = *(unint64_t *)((char *)&p_n_4->u64[1] + v8);
      v174 = v201;
      CGContextBeginPath(v5);
      CGContextMoveToPoint(v5, v172, v173);
      v173 = v173 + (float)((float)-v125 * (float)((float)i / (float)(unint64_t)v174));
      CGContextAddLineToPoint(v5, v172, v173);
      CGContextSetStrokeColorWithColor(v5, *(CGColorRef *)((char *)p_n_4->i64 + v8));
      CGContextStrokePath(v5);
      v8 += 16;
    }
    while (v8 != 160);
    ++v170;
    p_n_4 += 10;
  }
  while (v170 != 70);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v175 = v11 + -210.0;
  WebCore::drawGraphLabel(v5, (CGContext *)&v210, v175, v125, v176, v177);
  v13 = v210;
  v210 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      v13 = (CGContext *)WTF::StringImpl::destroy(v13, v14);
    else
      *(_DWORD *)v13 -= 2;
  }
  v178 = v106[212];
  if (v178)
    v179 = v178 - 1;
  else
    v179 = 69;
  if (v179 >= 0x46)
    goto LABEL_321;
  v180 = v11 + -330.0;
  v181 = 0.0;
  v182 = (float)*(unint64_t *)&v154[2 * v179];
  v11 = (float)(v180 + 50.0);
  v183 = (float)((float)(v125 * 0.5) + 0.0);
  v184 = v106 + 500;
  v8 = 17280;
  LODWORD(v12) = 0;
  do
  {
    v185 = v184[142];
    if (v185)
      v186 = v185 - 1;
    else
      v186 = 69;
    if (v186 >= 0x46)
      goto LABEL_321;
    i = *(_QWORD *)&v184[2 * v186 + 2];
    v187 = *(CGColor **)v184;
    CGContextBeginPath(v5);
    CGContextMoveToPoint(v5, v11, v183);
    v188 = v181;
    v181 = v181 + (float)((float)((float)i / v182) * 6.2832);
    CGContextAddArc(v5, v11, v183, 50.0, v188, v181, 0);
    CGContextSetFillColorWithColor(v5, v187);
    CGContextFillPath(v5);
    v184 += 432;
    v8 -= 1728;
  }
  while (v8);
}

@end
