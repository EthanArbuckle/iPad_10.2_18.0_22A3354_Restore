void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t OUTLINED_FUNCTION_9(void *a1, const char *a2)
{
  return objc_msgSend(a1, "dbPropId");
}

uint64_t OUTLINED_FUNCTION_4_0(void *a1, const char *a2)
{
  return objc_msgSend(a1, "vType");
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void OUTLINED_FUNCTION_9_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

uint64_t OUTLINED_FUNCTION_16@<X0>(void *a1@<X0>, uint64_t x8_0@<X8>)
{
  uint64_t v3;

  *(_QWORD *)(v3 - 8) = x8_0;
  return objc_msgSend(a1, "vType");
}

uint64_t OUTLINED_FUNCTION_17(void *a1, const char *a2)
{
  return objc_msgSend(a1, "vType");
}

uint64_t align4Pad(char a1)
{
  if ((a1 & 3) != 0)
    return 4 - (a1 & 3u);
  else
    return 0;
}

uint64_t align8Pad(char a1)
{
  if ((a1 & 7) != 0)
    return 8 - (a1 & 7u);
  else
    return 0;
}

uint64_t getChecksum32(int a1, int *a2, unsigned int a3)
{
  uint64_t result;
  int v6;
  int v7;
  unsigned int v8;
  int v9;

  result = 0;
  if (a2 && a3)
  {
    v6 = a3 & 3;
    if (a3 >= 4)
    {
      v7 = 0;
      v8 = a3 >> 2;
      do
      {
        v9 = *a2++;
        v7 += v9;
        --v8;
      }
      while (v8);
    }
    else
    {
      v7 = 0;
    }
    if (v6)
      __memcpy_chk();
    return (v7 ^ 0x59533959u) - a1;
  }
  return result;
}

id utf8_to_utf16le_data(void *a1, _DWORD *a2, int a3)
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int16 v12;

  v5 = a1;
  v6 = objc_msgSend(v5, "length");
  objc_msgSend(v5, "dataUsingEncoding:", 2483028224);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (a3)
    {
      v12 = 0;
      v8 = (void *)objc_msgSend(v7, "mutableCopy");
      if (!v8)
      {

        v7 = 0;
        return v7;
      }
      v9 = v8;
      objc_msgSend(v8, "appendBytes:length:", &v12, 2);
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithData:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      ++v6;
      v7 = (void *)v10;
    }
    *a2 = v6;
  }
  return v7;
}

uint64_t utf8_to_utf16(char *cStr, UInt8 **a2, _DWORD *a3, _DWORD *a4, uint64_t a5)
{
  const __CFString *v10;
  const __CFString *v11;
  CFIndex Length;
  size_t v13;
  UInt8 *v14;
  UInt8 *v15;
  CFIndex Bytes;
  CFIndex maxBufLen;
  CFRange v19;
  CFRange v20;

  v10 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0x8000100u);
  if (v10)
  {
    v11 = v10;
    maxBufLen = 0;
    Length = CFStringGetLength(v10);
    v19.location = 0;
    v19.length = Length;
    if (CFStringGetBytes(v11, v19, 0x14000100u, 0, 0, 0, 0, &maxBufLen))
    {
      v13 = maxBufLen;
      if ((_DWORD)a5)
      {
        v13 = maxBufLen + 2;
        maxBufLen += 2;
      }
      v14 = (UInt8 *)malloc_type_calloc(v13, 1uLL, 0xE1FAE514uLL);
      if (!v14)
      {
        printf("utf8_to_utf16: No memory for encode_len: %lu\n", maxBufLen);
        a5 = 12;
LABEL_14:
        CFRelease(v11);
        return a5;
      }
      v15 = v14;
      v20.location = 0;
      v20.length = Length;
      Bytes = CFStringGetBytes(v11, v20, 0x14000100u, 0, 0, v14, maxBufLen, 0);
      if (Bytes)
      {
        *a2 = v15;
        *a3 = maxBufLen;
        *a4 = Bytes;
        if ((_DWORD)a5)
        {
          a5 = 0;
          *a4 = Bytes + 1;
        }
        goto LABEL_14;
      }
      printf("utf8_to_utf16: Failed to convert input string: %s\n", cStr);
      free(v15);
    }
    else
    {
      printf("utf8_to_utf16: Error converting input string: %s\n", cStr);
    }
    a5 = 22;
    goto LABEL_14;
  }
  printf("utf8_to_utf16: Failed to created CFString from inbuf: %s\n", cStr);
  return 22;
}

uint64_t utf16_to_utf8(UInt8 *bytes, CFIndex numBytes, UInt8 **a3, _DWORD *a4)
{
  const __CFString *v7;
  const __CFString *v8;
  CFIndex Length;
  CFIndex v10;
  UInt8 *v11;
  UInt8 *v12;
  uint64_t v13;
  CFIndex usedBufLen;
  CFRange v16;
  CFRange v17;

  v7 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, numBytes, 0x14000100u, 0);
  if (v7)
  {
    v8 = v7;
    usedBufLen = 0;
    Length = CFStringGetLength(v7);
    v16.location = 0;
    v16.length = Length;
    if (CFStringGetBytes(v8, v16, 0x8000100u, 0, 0, 0, 0, &usedBufLen))
    {
      v10 = usedBufLen;
      v11 = (UInt8 *)malloc_type_calloc(usedBufLen, 1uLL, 0xF4218BCFuLL);
      if (!v11)
      {
        printf("utf16_to_utf8: No memory for encode buffer, encode_len: %lu\n", v10);
        v13 = 12;
        goto LABEL_11;
      }
      v12 = v11;
      v17.location = 0;
      v17.length = Length;
      if (CFStringGetBytes(v8, v17, 0x8000100u, 0, 0, v11, v10, &usedBufLen))
      {
        v13 = 0;
        *a3 = v12;
        *a4 = v10;
LABEL_11:
        CFRelease(v8);
        return v13;
      }
      puts("utf16_to_utf8: Failed to convert input string");
      free(v12);
    }
    else
    {
      printf("utf16_to_utf8: Error converting input string: %s\n", (const char *)bytes);
    }
    v13 = 22;
    goto LABEL_11;
  }
  printf("utf16_to_utf8: Failed to created CFString from inbuf: %s\n", (const char *)bytes);
  return 22;
}

unint64_t smb_time_NT2local(unint64_t result, _QWORD *a2)
{
  *a2 = result / 0x989680 - DIFF1970TO1601;
  a2[1] = 0;
  return result;
}

uint64_t *smb_time_local2NT(uint64_t *result, _QWORD *a2, int a3)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *result;
  v4 = DIFF1970TO1601;
  if (a3)
  {
    v3 = DIFF1970TO1601;
    v4 = *result & 0xFFFFFFFFFFFFFFFELL;
  }
  *a2 = 10000000 * (v4 + v3);
  return result;
}

const char *dumpBufferMsg(const char *result, unsigned __int8 *a2, unsigned int a3)
{
  int v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned __int8 *v9;
  unsigned int v10;
  int v11;
  int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  unsigned int v21;
  int v22;
  uint64_t v23;
  unsigned int v24;
  int v25;
  uint64_t v26;
  unsigned int v27;
  int v28;
  uint64_t v29;
  unsigned int v30;
  int v31;
  uint64_t v32;
  unsigned int v33;
  int v34;
  uint64_t v35;
  unsigned int v36;
  int v37;
  uint64_t v38;
  unsigned int v39;
  int v40;
  uint64_t v41;
  unsigned int v42;
  int v43;
  uint64_t v44;
  unsigned int v45;
  int v46;
  uint64_t v47;
  unsigned int v48;
  int v49;
  unsigned __int8 *v50;
  uint64_t v51;
  unsigned int v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  unsigned int v56;
  int v57;
  uint64_t v58;
  unsigned int v59;
  int v60;
  uint64_t v61;
  int v62;
  __darwin_ct_rune_t v63;
  __darwin_ct_rune_t v64;
  __darwin_ct_rune_t v65;
  uint64_t v66;
  __darwin_ct_rune_t v67;
  uint64_t v68;
  uint64_t v69;
  __darwin_ct_rune_t v70;
  uint64_t v71;
  uint64_t v72;
  __darwin_ct_rune_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  __darwin_ct_rune_t v77;
  uint64_t v78;
  uint64_t v79;
  __darwin_ct_rune_t v80;
  uint64_t v81;
  int v82;
  __darwin_ct_rune_t v83;
  uint64_t v84;
  int v85;
  __darwin_ct_rune_t v86;
  uint64_t v87;
  int v88;
  unsigned int v89;
  uint64_t v90;
  int v91;
  unsigned int v92;
  uint64_t v93;
  int v94;
  unsigned int v95;
  uint64_t v96;
  int v97;
  unsigned int v98;
  uint64_t v99;
  int v100;
  unsigned int v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  uint64_t v106;
  int v107;
  uint64_t v108;
  int v109;
  uint64_t v110;
  int v111;
  uint64_t v112;
  int v113;
  int v114;
  __darwin_ct_rune_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  unsigned int v119;
  int v120;
  uint64_t v121;
  unsigned int v122;
  int v123;
  uint64_t v124;
  unsigned int v125;
  int v126;
  int v127;
  __darwin_ct_rune_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  unsigned int v132;
  int v133;
  int v134;
  __darwin_ct_rune_t v135;
  uint64_t v136;
  int v137;
  __darwin_ct_rune_t v138;
  int v139;
  __darwin_ct_rune_t v140;
  int v141;
  __darwin_ct_rune_t v142;
  int v143;
  __darwin_ct_rune_t v144;
  int v145;
  __darwin_ct_rune_t v146;
  int v147;
  __darwin_ct_rune_t v148;
  int v149;
  __darwin_ct_rune_t v150;
  int v151;
  __darwin_ct_rune_t v152;
  int v153;
  __darwin_ct_rune_t v154;
  int v155;
  __darwin_ct_rune_t v156;
  int v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  int v170;
  uint64_t v171;
  uint64_t v172;
  int v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  int v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  int v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  int v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  int v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  int v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  int v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  int v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  int v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  int v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  int v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  int v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  int v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  int v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  unsigned int v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  unsigned int v291;

  if (result)
    result = (const char *)puts(result);
  if (a2 && a3)
  {
    v5 = a3 & 0xF;
    if (a3 >= 0x10)
    {
      v157 = a3 & 0xF;
      v6 = 0;
      v7 = a3 >> 4;
      v8 = MEMORY[0x24BDAC740];
      do
      {
        v291 = v7;
        v9 = &a2[v6];
        v10 = a2[v6];
        v11 = a2[v6 + 1];
        v257 = a2[v6 + 2];
        v247 = a2[v6 + 3];
        v238 = a2[v6 + 4];
        v229 = a2[v6 + 5];
        v221 = a2[v6 + 6];
        v213 = a2[v6 + 7];
        v205 = a2[v6 + 8];
        v198 = a2[v6 + 9];
        v192 = a2[v6 + 10];
        v186 = a2[v6 + 11];
        v181 = a2[v6 + 12];
        v177 = a2[v6 + 13];
        v173 = a2[v6 + 14];
        v170 = a2[v6 + 15];
        if ((char)a2[v6] < 0)
        {
          v12 = __maskrune(v10, 0x40000uLL);
          v13 = v9[1];
          v14 = v9[1];
        }
        else
        {
          v12 = *(_DWORD *)(v8 + 4 * a2[v6] + 60) & 0x40000;
          v13 = a2[v6 + 1];
          v14 = a2[v6 + 1];
        }
        if (v12)
          v15 = v10;
        else
          v15 = 46;
        v168 = v15;
        if ((v14 & 0x80) != 0)
          v16 = __maskrune(v13, 0x40000uLL);
        else
          v16 = *(_DWORD *)(v8 + 4 * v14 + 60) & 0x40000;
        if (v16)
          v17 = v13;
        else
          v17 = 46;
        v166 = v17;
        v18 = v9[2];
        if ((char)v9[2] < 0)
          v19 = __maskrune(v9[2], 0x40000uLL);
        else
          v19 = *(_DWORD *)(v8 + 4 * v9[2] + 60) & 0x40000;
        if (v19)
          v20 = v18;
        else
          v20 = 46;
        v165 = v20;
        v21 = v9[3];
        if ((char)v9[3] < 0)
          v22 = __maskrune(v9[3], 0x40000uLL);
        else
          v22 = *(_DWORD *)(v8 + 4 * v9[3] + 60) & 0x40000;
        if (v22)
          v23 = v21;
        else
          v23 = 46;
        v164 = v23;
        v24 = v9[4];
        if ((char)v9[4] < 0)
          v25 = __maskrune(v9[4], 0x40000uLL);
        else
          v25 = *(_DWORD *)(v8 + 4 * v9[4] + 60) & 0x40000;
        if (v25)
          v26 = v24;
        else
          v26 = 46;
        v163 = v26;
        v27 = v9[5];
        if ((char)v9[5] < 0)
          v28 = __maskrune(v9[5], 0x40000uLL);
        else
          v28 = *(_DWORD *)(v8 + 4 * v9[5] + 60) & 0x40000;
        if (v28)
          v29 = v27;
        else
          v29 = 46;
        v162 = v29;
        v30 = v9[6];
        if ((char)v9[6] < 0)
          v31 = __maskrune(v9[6], 0x40000uLL);
        else
          v31 = *(_DWORD *)(v8 + 4 * v9[6] + 60) & 0x40000;
        if (v31)
          v32 = v30;
        else
          v32 = 46;
        v161 = v32;
        v33 = v9[7];
        if ((char)v9[7] < 0)
          v34 = __maskrune(v9[7], 0x40000uLL);
        else
          v34 = *(_DWORD *)(v8 + 4 * v9[7] + 60) & 0x40000;
        if (v34)
          v35 = v33;
        else
          v35 = 46;
        v160 = v35;
        v36 = v9[8];
        if ((char)v9[8] < 0)
          v37 = __maskrune(v9[8], 0x40000uLL);
        else
          v37 = *(_DWORD *)(v8 + 4 * v9[8] + 60) & 0x40000;
        if (v37)
          v38 = v36;
        else
          v38 = 46;
        v159 = v38;
        v39 = v9[9];
        if ((char)v9[9] < 0)
          v40 = __maskrune(v9[9], 0x40000uLL);
        else
          v40 = *(_DWORD *)(v8 + 4 * v9[9] + 60) & 0x40000;
        if (v40)
          v41 = v39;
        else
          v41 = 46;
        v158 = v41;
        v42 = v9[10];
        v279 = v10;
        if ((char)v9[10] < 0)
          v43 = __maskrune(v42, 0x40000uLL);
        else
          v43 = *(_DWORD *)(v8 + 4 * v9[10] + 60) & 0x40000;
        if (v43)
          v44 = v42;
        else
          v44 = 46;
        v45 = v9[11];
        v268 = v11;
        if ((char)v9[11] < 0)
          v46 = __maskrune(v45, 0x40000uLL);
        else
          v46 = *(_DWORD *)(v8 + 4 * v9[11] + 60) & 0x40000;
        if (v46)
          v47 = v45;
        else
          v47 = 46;
        v48 = v9[12];
        if ((char)v9[12] < 0)
          v49 = __maskrune(v9[12], 0x40000uLL);
        else
          v49 = *(_DWORD *)(v8 + 4 * v9[12] + 60) & 0x40000;
        v50 = a2;
        if (v49)
          v51 = v48;
        else
          v51 = 46;
        v52 = v9[13];
        v53 = v6;
        if ((char)v9[13] < 0)
          v54 = __maskrune(v9[13], 0x40000uLL);
        else
          v54 = *(_DWORD *)(v8 + 4 * v9[13] + 60) & 0x40000;
        if (v54)
          v55 = v52;
        else
          v55 = 46;
        v56 = v9[14];
        if ((char)v9[14] < 0)
          v57 = __maskrune(v9[14], 0x40000uLL);
        else
          v57 = *(_DWORD *)(v8 + 4 * v9[14] + 60) & 0x40000;
        if (v57)
          v58 = v56;
        else
          v58 = 46;
        v59 = v9[15];
        if ((char)v9[15] < 0)
          v60 = __maskrune(v9[15], 0x40000uLL);
        else
          v60 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v9[15] + 60) & 0x40000;
        if (v60)
          v61 = v59;
        else
          v61 = 46;
        result = (const char *)printf("%08x  %02x %02x %02x %02x %02x %02x %02x %02x  %02x %02x %02x %02x %02x %02x %02x %02x  |%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c|\n", v53, v279, v268, v257, v247, v238, v229, v221, v213, v205, v198, v192, v186, v181, v177, v173, v170,
                                 v168,
                                 v166,
                                 v165,
                                 v164,
                                 v163,
                                 v162,
                                 v161,
                                 v160,
                                 v159,
                                 v158,
                                 v44,
                                 v47,
                                 v51,
                                 v55,
                                 v58,
                                 v61);
        v6 = v53 + 16;
        v7 = v291 - 1;
        a2 = v50;
        v8 = MEMORY[0x24BDAC740];
      }
      while (v291 != 1);
      a2 = &v50[v6];
      v5 = v157;
    }
    else
    {
      v6 = 0;
    }
    switch(v5)
    {
      case 1:
        v62 = (char)*a2;
        v63 = *a2;
        if (v62 < 0)
          __maskrune(v63, 0x40000uLL);
        result = (const char *)printf("%08x  %02x                                                |%c|\n");
        break;
      case 2:
        if ((char)*a2 < 0)
          __maskrune(*a2, 0x40000uLL);
        v64 = a2[1];
        if ((v64 & 0x80) != 0)
          __maskrune(v64, 0x40000uLL);
        result = (const char *)printf("%08x  %02x %02x                                             |%c%c|\n");
        break;
      case 3:
        if ((char)*a2 < 0)
          __maskrune(*a2, 0x40000uLL);
        v65 = a2[1];
        if ((v65 & 0x80) != 0)
          __maskrune(v65, 0x40000uLL);
        v114 = (char)a2[2];
        v115 = a2[2];
        if (v114 < 0)
          __maskrune(v115, 0x40000uLL);
        result = (const char *)printf("%08x  %02x %02x %02x                                          |%c%c%c|\n");
        break;
      case 4:
        v66 = *a2;
        if ((char)*a2 < 0)
          __maskrune(*a2, 0x40000uLL);
        v67 = a2[1];
        if ((v67 & 0x80) != 0)
          __maskrune(v67, 0x40000uLL);
        if ((char)a2[2] < 0)
          __maskrune(a2[2], 0x40000uLL);
        v127 = (char)a2[3];
        v128 = a2[3];
        if (v127 < 0)
          __maskrune(v128, 0x40000uLL);
        result = (const char *)printf("%08x  %02x %02x %02x %02x                                       |%c%c%c%c|\n", v6, v66);
        break;
      case 5:
        v68 = *a2;
        v69 = a2[1];
        v280 = a2[2];
        if ((char)*a2 < 0)
          __maskrune(v68, 0x40000uLL);
        v70 = a2[1];
        if ((v70 & 0x80) != 0)
          __maskrune(v70, 0x40000uLL);
        if ((char)a2[2] < 0)
          __maskrune(a2[2], 0x40000uLL);
        if ((char)a2[3] < 0)
          __maskrune(a2[3], 0x40000uLL);
        v134 = (char)a2[4];
        v135 = a2[4];
        if (v134 < 0)
          __maskrune(v135, 0x40000uLL);
        result = (const char *)printf("%08x  %02x %02x %02x %02x %02x                                    |%c%c%c%c%c|\n", v6, v68, v69, v280);
        break;
      case 6:
        v71 = *a2;
        v72 = a2[1];
        v281 = a2[2];
        v269 = a2[3];
        v258 = a2[4];
        if ((char)*a2 < 0)
          __maskrune(v71, 0x40000uLL);
        v73 = a2[1];
        if ((v73 & 0x80) != 0)
          __maskrune(v73, 0x40000uLL);
        if ((char)a2[2] < 0)
          __maskrune(a2[2], 0x40000uLL);
        if ((char)a2[3] < 0)
          __maskrune(a2[3], 0x40000uLL);
        if ((char)a2[4] < 0)
          __maskrune(a2[4], 0x40000uLL);
        v137 = (char)a2[5];
        v138 = a2[5];
        if (v137 < 0)
          __maskrune(v138, 0x40000uLL);
        result = (const char *)printf("%08x  %02x %02x %02x %02x %02x %02x                                 |%c%c%c%c%c%c|\n", v6, v71, v72, v281, v269, v258);
        break;
      case 7:
        v74 = *a2;
        v75 = a2[1];
        v282 = a2[2];
        v270 = a2[3];
        v259 = a2[4];
        v248 = a2[5];
        v76 = a2[6];
        if ((char)*a2 < 0)
          __maskrune(v74, 0x40000uLL);
        v77 = a2[1];
        if ((v77 & 0x80) != 0)
          __maskrune(v77, 0x40000uLL);
        if ((char)a2[2] < 0)
          __maskrune(a2[2], 0x40000uLL);
        if ((char)a2[3] < 0)
          __maskrune(a2[3], 0x40000uLL);
        if ((char)a2[4] < 0)
          __maskrune(a2[4], 0x40000uLL);
        if ((char)a2[5] < 0)
          __maskrune(a2[5], 0x40000uLL);
        v139 = (char)a2[6];
        v140 = a2[6];
        if (v139 < 0)
          __maskrune(v140, 0x40000uLL);
        result = (const char *)printf("%08x  %02x %02x %02x %02x %02x %02x %02x                              |%c%c%c%c%c%c%c|\n", v6, v74, v75, v282, v270, v259, v248, v76);
        break;
      case 8:
        v78 = *a2;
        v79 = a2[1];
        v283 = a2[2];
        v271 = a2[3];
        v260 = a2[4];
        v249 = a2[5];
        v239 = a2[6];
        v230 = a2[7];
        if ((char)*a2 < 0)
          __maskrune(v78, 0x40000uLL);
        v80 = a2[1];
        if ((v80 & 0x80) != 0)
          __maskrune(v80, 0x40000uLL);
        if ((char)a2[2] < 0)
          __maskrune(a2[2], 0x40000uLL);
        if ((char)a2[3] < 0)
          __maskrune(a2[3], 0x40000uLL);
        if ((char)a2[4] < 0)
          __maskrune(a2[4], 0x40000uLL);
        if ((char)a2[5] < 0)
          __maskrune(a2[5], 0x40000uLL);
        if ((char)a2[6] < 0)
          __maskrune(a2[6], 0x40000uLL);
        v141 = (char)a2[7];
        v142 = a2[7];
        if (v141 < 0)
          __maskrune(v142, 0x40000uLL);
        result = (const char *)printf("%08x  %02x %02x %02x %02x %02x %02x %02x %02x                           |%c%c%c%c%c%c%c%c|\n", v6, v78, v79, v283, v271, v260, v249, v239, v230);
        break;
      case 9:
        v81 = *a2;
        v272 = a2[2];
        v284 = a2[1];
        v261 = a2[3];
        v250 = a2[4];
        v240 = a2[5];
        v231 = a2[6];
        v222 = a2[7];
        v214 = a2[8];
        if ((char)*a2 < 0)
          v82 = __maskrune(v81, 0x40000uLL);
        else
          v82 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * *a2 + 60) & 0x40000;
        v83 = a2[1];
        if (v82)
          v102 = v81;
        else
          v102 = 46;
        v212 = v102;
        if ((v83 & 0x80) != 0)
          __maskrune(v83, 0x40000uLL);
        if ((char)a2[2] < 0)
          __maskrune(a2[2], 0x40000uLL);
        if ((char)a2[3] < 0)
          __maskrune(a2[3], 0x40000uLL);
        if ((char)a2[4] < 0)
          __maskrune(a2[4], 0x40000uLL);
        if ((char)a2[5] < 0)
          __maskrune(a2[5], 0x40000uLL);
        if ((char)a2[6] < 0)
          __maskrune(a2[6], 0x40000uLL);
        if ((char)a2[7] < 0)
          __maskrune(a2[7], 0x40000uLL);
        v143 = (char)a2[8];
        v144 = a2[8];
        if (v143 < 0)
          __maskrune(v144, 0x40000uLL);
        result = (const char *)printf("%08x  %02x %02x %02x %02x %02x %02x %02x %02x  %02x                       |%c%c%c%c%c%c%c%c%c|\n", v6, v81, v284, v272, v261, v250, v240, v231, v222, v214, v212);
        break;
      case 10:
        v84 = *a2;
        v273 = a2[2];
        v285 = a2[1];
        v262 = a2[3];
        v251 = a2[4];
        v241 = a2[5];
        v232 = a2[6];
        v223 = a2[7];
        v215 = a2[8];
        v206 = a2[9];
        if ((char)*a2 < 0)
          v85 = __maskrune(v84, 0x40000uLL);
        else
          v85 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * *a2 + 60) & 0x40000;
        v86 = a2[1];
        if (v85)
          v103 = v84;
        else
          v103 = 46;
        v204 = v103;
        if ((v86 & 0x80) != 0)
          __maskrune(v86, 0x40000uLL);
        if ((char)a2[2] < 0)
          __maskrune(a2[2], 0x40000uLL);
        if ((char)a2[3] < 0)
          __maskrune(a2[3], 0x40000uLL);
        if ((char)a2[4] < 0)
          __maskrune(a2[4], 0x40000uLL);
        if ((char)a2[5] < 0)
          __maskrune(a2[5], 0x40000uLL);
        if ((char)a2[6] < 0)
          __maskrune(a2[6], 0x40000uLL);
        if ((char)a2[7] < 0)
          __maskrune(a2[7], 0x40000uLL);
        if ((char)a2[8] < 0)
          __maskrune(a2[8], 0x40000uLL);
        v145 = (char)a2[9];
        v146 = a2[9];
        if (v145 < 0)
          __maskrune(v146, 0x40000uLL);
        result = (const char *)printf("%08x  %02x %02x %02x %02x %02x %02x %02x %02x  %02x %02x                    |%c%c%c%c%c%c%c%c%c%c|\n", v6, v84, v285, v273, v262, v251, v241, v232, v223, v215, v206, v204);
        break;
      case 11:
        v87 = *a2;
        v274 = a2[2];
        v286 = a2[1];
        v263 = a2[3];
        v252 = a2[4];
        v242 = a2[5];
        v233 = a2[6];
        v224 = a2[7];
        v216 = a2[8];
        v207 = a2[9];
        v199 = a2[10];
        if ((char)*a2 < 0)
          v88 = __maskrune(v87, 0x40000uLL);
        else
          v88 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * *a2 + 60) & 0x40000;
        v89 = a2[1];
        if (v88)
          v104 = v87;
        else
          v104 = 46;
        v197 = v104;
        if ((v89 & 0x80) != 0)
          v105 = __maskrune(v89, 0x40000uLL);
        else
          v105 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * a2[1] + 60) & 0x40000;
        if (v105)
          v116 = v89;
        else
          v116 = 46;
        v191 = v116;
        if ((char)a2[2] < 0)
          __maskrune(a2[2], 0x40000uLL);
        if ((char)a2[3] < 0)
          __maskrune(a2[3], 0x40000uLL);
        if ((char)a2[4] < 0)
          __maskrune(a2[4], 0x40000uLL);
        if ((char)a2[5] < 0)
          __maskrune(a2[5], 0x40000uLL);
        if ((char)a2[6] < 0)
          __maskrune(a2[6], 0x40000uLL);
        if ((char)a2[7] < 0)
          __maskrune(a2[7], 0x40000uLL);
        if ((char)a2[8] < 0)
          __maskrune(a2[8], 0x40000uLL);
        if ((char)a2[9] < 0)
          __maskrune(a2[9], 0x40000uLL);
        v147 = (char)a2[10];
        v148 = a2[10];
        if (v147 < 0)
          __maskrune(v148, 0x40000uLL);
        result = (const char *)printf("%08x  %02x %02x %02x %02x %02x %02x %02x %02x  %02x %02x %02x                 |%c%c%c%c%c%c%c%c%c%c%c|\n", v6, v87, v286, v274, v263, v252, v242, v233, v224, v216, v207, v199, v197, v191);
        break;
      case 12:
        v90 = *a2;
        v275 = a2[2];
        v287 = a2[1];
        v264 = a2[3];
        v253 = a2[4];
        v243 = a2[5];
        v234 = a2[6];
        v225 = a2[7];
        v217 = a2[8];
        v208 = a2[9];
        v200 = a2[10];
        v193 = a2[11];
        if ((char)*a2 < 0)
          v91 = __maskrune(v90, 0x40000uLL);
        else
          v91 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * *a2 + 60) & 0x40000;
        v92 = a2[1];
        if (v91)
          v106 = v90;
        else
          v106 = 46;
        v190 = v106;
        if ((v92 & 0x80) != 0)
          v107 = __maskrune(v92, 0x40000uLL);
        else
          v107 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * a2[1] + 60) & 0x40000;
        if (v107)
          v117 = v92;
        else
          v117 = 46;
        v185 = v117;
        if ((char)a2[2] < 0)
          __maskrune(a2[2], 0x40000uLL);
        if ((char)a2[3] < 0)
          __maskrune(a2[3], 0x40000uLL);
        if ((char)a2[4] < 0)
          __maskrune(a2[4], 0x40000uLL);
        if ((char)a2[5] < 0)
          __maskrune(a2[5], 0x40000uLL);
        if ((char)a2[6] < 0)
          __maskrune(a2[6], 0x40000uLL);
        if ((char)a2[7] < 0)
          __maskrune(a2[7], 0x40000uLL);
        if ((char)a2[8] < 0)
          __maskrune(a2[8], 0x40000uLL);
        if ((char)a2[9] < 0)
          __maskrune(a2[9], 0x40000uLL);
        if ((char)a2[10] < 0)
          __maskrune(a2[10], 0x40000uLL);
        v149 = (char)a2[11];
        v150 = a2[11];
        if (v149 < 0)
          __maskrune(v150, 0x40000uLL);
        result = (const char *)printf("%08x  %02x %02x %02x %02x %02x %02x %02x %02x  %02x %02x %02x %02x              |%c%c%c%c%c%c%c%c%c%c%c%c|\n", v6, v90, v287, v275, v264, v253, v243, v234, v225, v217, v208, v200, v193, v190, v185);
        break;
      case 13:
        v93 = *a2;
        v276 = a2[2];
        v265 = a2[3];
        v254 = a2[4];
        v244 = a2[5];
        v235 = a2[6];
        v226 = a2[7];
        v218 = a2[8];
        v209 = a2[9];
        v201 = a2[10];
        v194 = a2[11];
        v187 = a2[12];
        v288 = a2[1];
        if ((char)*a2 < 0)
          v94 = __maskrune(v93, 0x40000uLL);
        else
          v94 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * *a2 + 60) & 0x40000;
        v95 = a2[1];
        if (v94)
          v108 = v93;
        else
          v108 = 46;
        v184 = v108;
        if ((v95 & 0x80) != 0)
          v109 = __maskrune(v95, 0x40000uLL);
        else
          v109 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * a2[1] + 60) & 0x40000;
        if (v109)
          v118 = v95;
        else
          v118 = 46;
        v180 = v118;
        v119 = a2[2];
        if ((char)a2[2] < 0)
          v120 = __maskrune(a2[2], 0x40000uLL);
        else
          v120 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * a2[2] + 60) & 0x40000;
        if (v120)
          v129 = v119;
        else
          v129 = 46;
        v176 = v129;
        if ((char)a2[3] < 0)
          __maskrune(a2[3], 0x40000uLL);
        if ((char)a2[4] < 0)
          __maskrune(a2[4], 0x40000uLL);
        if ((char)a2[5] < 0)
          __maskrune(a2[5], 0x40000uLL);
        if ((char)a2[6] < 0)
          __maskrune(a2[6], 0x40000uLL);
        if ((char)a2[7] < 0)
          __maskrune(a2[7], 0x40000uLL);
        if ((char)a2[8] < 0)
          __maskrune(a2[8], 0x40000uLL);
        if ((char)a2[9] < 0)
          __maskrune(a2[9], 0x40000uLL);
        if ((char)a2[10] < 0)
          __maskrune(a2[10], 0x40000uLL);
        if ((char)a2[11] < 0)
          __maskrune(a2[11], 0x40000uLL);
        v151 = (char)a2[12];
        v152 = a2[12];
        if (v151 < 0)
          __maskrune(v152, 0x40000uLL);
        result = (const char *)printf("%08x  %02x %02x %02x %02x %02x %02x %02x %02x  %02x %02x %02x %02x %02x           |%c%c%c%c%c%c%c%c%c%c%c%c%c|\n", v6, v93, v288, v276, v265, v254, v244, v235, v226, v218, v209, v201, v194, v187, v184, v180, v176);
        break;
      case 14:
        v96 = *a2;
        v277 = a2[2];
        v266 = a2[3];
        v255 = a2[4];
        v245 = a2[5];
        v236 = a2[6];
        v227 = a2[7];
        v219 = a2[8];
        v210 = a2[9];
        v202 = a2[10];
        v195 = a2[11];
        v188 = a2[12];
        v182 = a2[13];
        v289 = a2[1];
        if ((char)*a2 < 0)
          v97 = __maskrune(v96, 0x40000uLL);
        else
          v97 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * *a2 + 60) & 0x40000;
        v98 = a2[1];
        if (v97)
          v110 = v96;
        else
          v110 = 46;
        v179 = v110;
        if ((v98 & 0x80) != 0)
          v111 = __maskrune(v98, 0x40000uLL);
        else
          v111 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * a2[1] + 60) & 0x40000;
        if (v111)
          v121 = v98;
        else
          v121 = 46;
        v175 = v121;
        v122 = a2[2];
        if ((char)a2[2] < 0)
          v123 = __maskrune(a2[2], 0x40000uLL);
        else
          v123 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * a2[2] + 60) & 0x40000;
        if (v123)
          v130 = v122;
        else
          v130 = 46;
        v172 = v130;
        if ((char)a2[3] < 0)
          __maskrune(a2[3], 0x40000uLL);
        if ((char)a2[4] < 0)
          __maskrune(a2[4], 0x40000uLL);
        if ((char)a2[5] < 0)
          __maskrune(a2[5], 0x40000uLL);
        if ((char)a2[6] < 0)
          __maskrune(a2[6], 0x40000uLL);
        if ((char)a2[7] < 0)
          __maskrune(a2[7], 0x40000uLL);
        if ((char)a2[8] < 0)
          __maskrune(a2[8], 0x40000uLL);
        if ((char)a2[9] < 0)
          __maskrune(a2[9], 0x40000uLL);
        if ((char)a2[10] < 0)
          __maskrune(a2[10], 0x40000uLL);
        if ((char)a2[11] < 0)
          __maskrune(a2[11], 0x40000uLL);
        if ((char)a2[12] < 0)
          __maskrune(a2[12], 0x40000uLL);
        v153 = (char)a2[13];
        v154 = a2[13];
        if (v153 < 0)
          __maskrune(v154, 0x40000uLL);
        result = (const char *)printf("%08x  %02x %02x %02x %02x %02x %02x %02x %02x  %02x %02x %02x %02x %02x %02x        |%c%c%c%c%c%c%c%c%c%c%c%c%c%c|\n", v6, v96, v289, v277, v266, v255, v245, v236, v227, v219, v210, v202, v195, v188, v182, v179, v175,
                                 v172);
        break;
      case 15:
        v99 = *a2;
        v278 = a2[2];
        v267 = a2[3];
        v256 = a2[4];
        v246 = a2[5];
        v237 = a2[6];
        v228 = a2[7];
        v220 = a2[8];
        v211 = a2[9];
        v203 = a2[10];
        v196 = a2[11];
        v189 = a2[12];
        v183 = a2[13];
        v178 = a2[14];
        v290 = a2[1];
        if ((char)*a2 < 0)
          v100 = __maskrune(v99, 0x40000uLL);
        else
          v100 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * *a2 + 60) & 0x40000;
        v101 = a2[1];
        if (v100)
          v112 = v99;
        else
          v112 = 46;
        v174 = v112;
        if ((v101 & 0x80) != 0)
          v113 = __maskrune(v101, 0x40000uLL);
        else
          v113 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * a2[1] + 60) & 0x40000;
        if (v113)
          v124 = v101;
        else
          v124 = 46;
        v171 = v124;
        v125 = a2[2];
        if ((char)a2[2] < 0)
          v126 = __maskrune(a2[2], 0x40000uLL);
        else
          v126 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * a2[2] + 60) & 0x40000;
        if (v126)
          v131 = v125;
        else
          v131 = 46;
        v169 = v131;
        v132 = a2[3];
        if ((char)a2[3] < 0)
          v133 = __maskrune(a2[3], 0x40000uLL);
        else
          v133 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * a2[3] + 60) & 0x40000;
        if (v133)
          v136 = v132;
        else
          v136 = 46;
        v167 = v136;
        if ((char)a2[4] < 0)
          __maskrune(a2[4], 0x40000uLL);
        if ((char)a2[5] < 0)
          __maskrune(a2[5], 0x40000uLL);
        if ((char)a2[6] < 0)
          __maskrune(a2[6], 0x40000uLL);
        if ((char)a2[7] < 0)
          __maskrune(a2[7], 0x40000uLL);
        if ((char)a2[8] < 0)
          __maskrune(a2[8], 0x40000uLL);
        if ((char)a2[9] < 0)
          __maskrune(a2[9], 0x40000uLL);
        if ((char)a2[10] < 0)
          __maskrune(a2[10], 0x40000uLL);
        if ((char)a2[11] < 0)
          __maskrune(a2[11], 0x40000uLL);
        if ((char)a2[12] < 0)
          __maskrune(a2[12], 0x40000uLL);
        if ((char)a2[13] < 0)
          __maskrune(a2[13], 0x40000uLL);
        v155 = (char)a2[14];
        v156 = a2[14];
        if (v155 < 0)
          __maskrune(v156, 0x40000uLL);
        result = (const char *)printf("%08x  %02x %02x %02x %02x %02x %02x %02x %02x  %02x %02x %02x %02x %02x %02x %02x     |%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c |\n", v6, v99, v290, v278, v267, v256, v246, v237, v228, v220, v211, v203, v196, v189, v183, v178, v174,
                                 v171,
                                 v169,
                                 v167);
        break;
      default:
        return result;
    }
  }
  return result;
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x14u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_10_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_12_0(void *a1, const char *a2)
{
  return objc_msgSend(a1, "msgid");
}

uint64_t OUTLINED_FUNCTION_3_1(void *a1, const char *a2)
{
  return objc_msgSend(a1, "propNumber");
}

uint64_t OUTLINED_FUNCTION_3_2(void *a1, const char *a2)
{
  return objc_msgSend(a1, "propsetID");
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

