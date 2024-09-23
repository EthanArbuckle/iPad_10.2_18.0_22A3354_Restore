uint64_t ETLEFSDumpInterpret(uint64_t a1, unsigned int a2, uint64_t *a3)
{
  uint64_t result;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  char *v10;
  char *v11;
  _OWORD v12[16];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  result = (uint64_t)malloc(0x50uLL);
  *a3 = 0;
  if (result)
  {
    v7 = result;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)result = 0u;
    if (a2 < 0x38
      || (v8 = *(_OWORD *)(a1 + 16),
          *(_OWORD *)result = *(_OWORD *)a1,
          *(_OWORD *)(result + 16) = v8,
          *(_OWORD *)(result + 32) = *(_OWORD *)(a1 + 32),
          *(_QWORD *)(result + 48) = *(_QWORD *)(a1 + 48),
          a2 - 62 > 0xFFFFFFF9))
    {
      v10 = 0;
    }
    else
    {
      *(_DWORD *)(result + 56) = *(_DWORD *)(a1 + 56);
      *(_WORD *)(result + 60) = *(_WORD *)(a1 + 60);
      *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v12[14] = v9;
      v12[15] = v9;
      v12[12] = v9;
      v12[13] = v9;
      v12[10] = v9;
      v12[11] = v9;
      v12[8] = v9;
      v12[9] = v9;
      v12[6] = v9;
      v12[7] = v9;
      v12[4] = v9;
      v12[5] = v9;
      v12[2] = v9;
      v12[3] = v9;
      v12[0] = v9;
      v12[1] = v9;
      TelephonyUtilStrlcpy();
      v10 = strdup((const char *)v12);
      *(_QWORD *)(v7 + 62) = v10;
      if (v10)
      {
        TelephonyUtilStrlcpy();
        v11 = strdup((const char *)v12);
        *(_QWORD *)(v7 + 70) = v11;
        if (v11)
        {
          *a3 = v7;
          return 1;
        }
      }
    }
    free(v10);
    free((void *)v7);
    return 0;
  }
  return result;
}

uint64_t ETLEFSDumpInfoFree(uint64_t a1)
{
  if (a1)
  {
    free(*(void **)(a1 + 62));
    free(*(void **)(a1 + 70));
    free((void *)a1);
  }
  return 1;
}

BOOL ETLEFSDumpCopyCrashHeaderDetails(uint64_t a1, _WORD *a2, _WORD *a3)
{
  if (a1)
  {
    *a2 = *(_WORD *)a1;
    *a3 = *(_DWORD *)(a1 + 4);
  }
  return a1 != 0;
}

BOOL ETLEFSDumpCopySoftwareVersion(uint64_t a1)
{
  if (a1)
    TelephonyUtilStrlcpy();
  return a1 != 0;
}

BOOL ETLEFSDUmpCopyCrashLocationDetails(uint64_t a1, uint64_t a2)
{
  int v3;

  *(_QWORD *)(a2 + 320) = 0;
  *(_OWORD *)(a2 + 288) = 0u;
  *(_OWORD *)(a2 + 304) = 0u;
  *(_OWORD *)(a2 + 256) = 0u;
  *(_OWORD *)(a2 + 272) = 0u;
  *(_OWORD *)(a2 + 224) = 0u;
  *(_OWORD *)(a2 + 240) = 0u;
  *(_OWORD *)(a2 + 192) = 0u;
  *(_OWORD *)(a2 + 208) = 0u;
  *(_OWORD *)(a2 + 160) = 0u;
  *(_OWORD *)(a2 + 176) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 144) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  if (a1)
  {
    v3 = *(unsigned __int16 *)(a1 + 60);
    *(_DWORD *)a2 = *(_DWORD *)(a1 + 56);
    *(_DWORD *)(a2 + 4) = v3;
    TelephonyUtilStrlcpy();
    TelephonyUtilStrlcpy();
  }
  return a1 != 0;
}

uint64_t ETLEFCopyCrashLocationDetailsM20(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  BOOL v3;
  uint64_t v4;
  char *v8;
  uint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  const void **v12;
  const void *v13;
  int v14;
  const void *v15;
  __int128 v16;
  size_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  size_t v21;
  const char *v22;
  const char *v23;
  size_t v24;
  uint8_t *v25;
  unint64_t v26;
  uint8_t *v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  char *p_str;
  char *v32;
  char *v33;
  __int128 *v34;
  _OWORD *v35;
  unint64_t v36;
  __int128 v37;
  std::string *v38;
  char *v39;
  const char *v40;
  size_t v41;
  std::string *v42;
  char v43;
  uint8_t *v44;
  unint64_t v45;
  uint8_t *v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  size_t v51;
  int v52;
  const std::string::value_type *v53;
  std::string::size_type v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  char *v58;
  std::string *v59;
  uint8_t *v60;
  uint8_t *v61;
  unint64_t v62;
  size_t v63;
  __int128 *v64;
  uint8_t *v65;
  uint64_t v66;
  uint8_t *v67;
  char *v68;
  std::string::size_type v69;
  char *v70;
  char *v71;
  char *v72;
  __int128 *v73;
  _OWORD *v74;
  unint64_t v75;
  __int128 v76;
  std::string *v77;
  char v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  char *v82;
  std::string *v83;
  __int128 *v84;
  uint8_t *v85;
  uint64_t v86;
  uint8_t *v87;
  unint64_t v88;
  size_t v89;
  __int128 *v90;
  uint8_t *v91;
  BOOL v92;
  uint64_t v93;
  uint8_t *v94;
  char *v95;
  std::string::size_type v96;
  _BYTE *v97;
  _BYTE *v98;
  char *v99;
  __int128 *v100;
  _OWORD *v101;
  unint64_t v102;
  __int128 v103;
  uint64_t v104;
  uint64_t v105;
  char v106;
  std::string::size_type v107;
  char v108;
  size_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  char *v113;
  __int128 *v114;
  _OWORD *v115;
  unint64_t v116;
  __int128 v117;
  char v118;
  char *v119;
  std::string *v120;
  uint8_t *v121;
  unint64_t v122;
  size_t v123;
  void *v124;
  uint8_t *v125;
  unint64_t v126;
  uint8_t *v127;
  char *v128;
  uint64_t v129;
  unint64_t v130;
  char *v131;
  std::string *v132;
  std::string *v133;
  char v134;
  uint64_t *v135;
  int v136;
  std::string::size_type v137;
  std::string *v138;
  uint8_t *v139;
  unint64_t v140;
  uint8_t *v141;
  unint64_t v142;
  size_t v143;
  size_t v144;
  void **v145;
  const char *v146;
  char *v147;
  uint64_t v148;
  uint64_t v149;
  char *v150;
  char *v151;
  __int128 *v152;
  _OWORD *v153;
  unint64_t v154;
  __int128 v155;
  char v156;
  std::string *v157;
  uint8_t *v158;
  uint8_t *v159;
  unint64_t v160;
  size_t v161;
  __int128 *v162;
  uint8_t *v163;
  uint64_t v164;
  uint8_t *v165;
  char *v166;
  std::string::size_type v167;
  char *v168;
  std::string *v169;
  char v170;
  uint64_t v171;
  uint64_t v172;
  char *v173;
  char *v174;
  __int128 *v175;
  _OWORD *v176;
  unint64_t v177;
  __int128 v178;
  char v179;
  std::string *v180;
  __int128 *v181;
  uint8_t *v182;
  uint64_t v183;
  uint8_t *v184;
  unint64_t v185;
  size_t v186;
  __int128 *v187;
  uint8_t *v188;
  BOOL v189;
  uint64_t v190;
  uint8_t *v191;
  char *v192;
  std::string::size_type v193;
  _BYTE *v194;
  uint64_t v195;
  uint64_t v196;
  _BYTE *v197;
  char *v198;
  __int128 *v199;
  _OWORD *v200;
  unint64_t v201;
  __int128 v202;
  char v203;
  char *v204;
  const char *v205;
  size_t v206;
  void *v207;
  unint64_t v208;
  const void *v209;
  const void **v210;
  size_t v211;
  int v212;
  unint64_t v213;
  uint8_t *v214;
  uint8_t v215;
  uint64_t v217;
  uint64_t v218;
  const void **v219;
  uint64_t v220;
  uint64_t v221;
  _DWORD *v222;
  void *v223;
  size_t v224;
  std::string __str;
  std::string v226;
  __int128 __s2;
  uint64_t v228;
  uint8_t buf[40];
  __int128 v230;
  uint64_t v231;
  unint64_t v232;
  uint64_t v233;
  uint64_t v234;
  __int128 v235;
  uint64_t v236;
  __int128 v237;
  uint64_t v238;
  const void *__dst[3];
  char *v240;
  unint64_t v241;
  uint64_t v242;
  char *v243;
  __int128 v244;

  if (a1)
    v3 = a3 == 0;
  else
    v3 = 1;
  v4 = !v3;
  if (!v3)
  {
    v8 = (char *)operator new(0x20uLL);
    v244 = xmmword_2129E0E40;
    strcpy(v8, "Not provided from Baseband");
    v242 = 0x7AAAAAAAAAAAAAALL;
    v243 = v8;
    v241 = 0xAAAAAAAAAAAAAAAALL;
    strcpy((char *)&v240, "Unknown");
    if (a2)
    {
      v9 = a2;
      v10 = a1;
      while (*v10)
      {
        ++v10;
        if (!--v9)
        {
          v10 = &a1[a2];
          break;
        }
      }
    }
    else
    {
      v10 = a1;
    }
    v11 = v10 - a1;
    memset(__dst, 170, sizeof(__dst));
    if ((unint64_t)(v10 - a1) > 0x7FFFFFFFFFFFFFF7)
      std::string::__throw_length_error[abi:ne180100]();
    if (v11 > 0x16)
    {
      v19 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v11 | 7) != 0x17)
        v19 = v11 | 7;
      v20 = v19 + 1;
      v12 = (const void **)operator new(v19 + 1);
      __dst[1] = (const void *)(v10 - a1);
      __dst[2] = (const void *)(v20 | 0x8000000000000000);
      __dst[0] = v12;
      if (v10 == a1)
      {
LABEL_20:
        *(_BYTE *)v12 = 0;
        *(_DWORD *)(a3 + 384) = 0;
        *(_OWORD *)(a3 + 352) = 0u;
        *(_OWORD *)(a3 + 368) = 0u;
        *(_OWORD *)(a3 + 320) = 0u;
        *(_OWORD *)(a3 + 336) = 0u;
        *(_OWORD *)(a3 + 288) = 0u;
        *(_OWORD *)(a3 + 304) = 0u;
        *(_OWORD *)(a3 + 256) = 0u;
        *(_OWORD *)(a3 + 272) = 0u;
        *(_OWORD *)(a3 + 224) = 0u;
        *(_OWORD *)(a3 + 240) = 0u;
        *(_OWORD *)(a3 + 192) = 0u;
        *(_OWORD *)(a3 + 208) = 0u;
        *(_OWORD *)(a3 + 160) = 0u;
        *(_OWORD *)(a3 + 176) = 0u;
        *(_OWORD *)(a3 + 128) = 0u;
        *(_OWORD *)(a3 + 144) = 0u;
        *(_OWORD *)(a3 + 96) = 0u;
        *(_OWORD *)(a3 + 112) = 0u;
        *(_OWORD *)(a3 + 64) = 0u;
        *(_OWORD *)(a3 + 80) = 0u;
        *(_OWORD *)(a3 + 32) = 0u;
        *(_OWORD *)(a3 + 48) = 0u;
        v13 = (const void *)HIBYTE(__dst[2]);
        v14 = SHIBYTE(__dst[2]);
        v15 = __dst[1];
        if (SHIBYTE(__dst[2]) < 0)
          v13 = __dst[1];
        *(_OWORD *)a3 = 0uLL;
        *(_OWORD *)(a3 + 16) = 0uLL;
        if (!v13)
        {
          if (SHIBYTE(v242) < 0)
          {
            v22 = v240;
            v21 = v241;
            v23 = v240;
          }
          else
          {
            v21 = HIBYTE(v242);
            v22 = (const char *)&v240;
            v23 = (const char *)&v240;
          }
          strncpy((char *)(a3 + 4), v23, v21);
          strncpy((char *)(a3 + 68), v22, v21);
          *(_DWORD *)a3 = 0;
          v39 = (char *)(a3 + 132);
          if (v244 >= 0)
            v40 = (const char *)&v243;
          else
            v40 = v243;
          if (v244 >= 0)
            v41 = HIBYTE(v244);
          else
            v41 = v244;
          strncpy(v39, v40, v41);
          if ((v14 & 0x80) == 0)
          {
LABEL_380:
            if (SHIBYTE(v242) < 0)
            {
              operator delete(v240);
              if ((SHIBYTE(v244) & 0x80000000) == 0)
                return v4;
            }
            else if ((SHIBYTE(v244) & 0x80000000) == 0)
            {
              return v4;
            }
            operator delete(v243);
            return v4;
          }
LABEL_379:
          operator delete((void *)__dst[0]);
          goto LABEL_380;
        }
        v237 = 0uLL;
        v238 = 0;
        *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v230 = 0xAAAAAAAAAAAAAAAALL;
        v232 = 0xAAAAAAAAAAAAAA00;
        v235 = v16;
        v231 = 0;
        v233 = 0;
        v234 = 0;
        LOBYTE(v235) = 0;
        BYTE8(v235) = 0;
        v236 = 0;
        memset(buf, 0, sizeof(buf));
        *((_QWORD *)&__s2 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v228 = 0x4AAAAAAAAAAAAAALL;
        *(_QWORD *)&__s2 = 0xAAAAAA003A727373;
        if (v14 < 0)
        {
          if ((unint64_t)v15 >= 4)
            v24 = 4;
          else
            v24 = (size_t)v15;
          v18 = memcmp(__dst[0], &__s2, v24);
          if (v24 != 4)
            goto LABEL_41;
        }
        else
        {
          if ((v14 & 0xFC) != 0)
            v17 = 4;
          else
            v17 = v14;
          v18 = memcmp(__dst, &__s2, v17);
          if (v17 != 4)
            goto LABEL_41;
        }
        if (!v18)
        {
          v237 = __s2;
          v238 = v228;
        }
LABEL_41:
        v226.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
        *(_OWORD *)&v226.__r_.__value_.__r.__words[1] = xmmword_2129E0E50;
        strcpy(v226.__r_.__value_.__l.__data_, "([^:]*):([^:]*):([^:]*):(.*)");
        if (ETLEFSearchCrashReason((uint64_t)__dst, (const void **)&__s2, (const void **)&v226.__r_.__value_.__l.__data_, (uint64_t)buf))
        {
          v25 = *(uint8_t **)buf;
          v26 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3);
          if (v26 <= 1)
            v27 = buf;
          else
            v27 = *(uint8_t **)buf;
          if (!v27[40])
          {
            v42 = 0;
            v43 = 0;
            memset(&__str, 0, sizeof(__str));
            goto LABEL_91;
          }
          v29 = *((_QWORD *)v27 + 3);
          v28 = (char *)*((_QWORD *)v27 + 4);
          v30 = (unint64_t)&v28[-v29];
          if ((unint64_t)&v28[-v29] > 0x7FFFFFFFFFFFFFF7)
            std::string::__throw_length_error[abi:ne180100]();
          if (v30 > 0x16)
          {
            v55 = (v30 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v30 | 7) != 0x17)
              v55 = v30 | 7;
            v56 = v55 + 1;
            p_str = (char *)operator new(v55 + 1);
            __str.__r_.__value_.__l.__size_ = (std::string::size_type)&v28[-v29];
            __str.__r_.__value_.__r.__words[2] = v56 | 0x8000000000000000;
            __str.__r_.__value_.__r.__words[0] = (std::string::size_type)p_str;
            if ((char *)v29 != v28)
              goto LABEL_49;
          }
          else
          {
            *((_BYTE *)&__str.__r_.__value_.__s + 23) = (_BYTE)v28 - v29;
            p_str = (char *)&__str;
            if ((char *)v29 != v28)
            {
LABEL_49:
              if (v30 < 0x20 || (unint64_t)&p_str[-v29] < 0x20)
              {
                v32 = p_str;
                v33 = (char *)v29;
              }
              else
              {
                v32 = &p_str[v30 & 0xFFFFFFFFFFFFFFE0];
                v33 = (char *)(v29 + (v30 & 0xFFFFFFFFFFFFFFE0));
                v34 = (__int128 *)(v29 + 16);
                v35 = p_str + 16;
                v36 = v30 & 0xFFFFFFFFFFFFFFE0;
                do
                {
                  v37 = *v34;
                  *(v35 - 1) = *(v34 - 1);
                  *v35 = v37;
                  v34 += 2;
                  v35 += 2;
                  v36 -= 32;
                }
                while (v36);
                if (v30 == (v30 & 0xFFFFFFFFFFFFFFE0))
                  goto LABEL_90;
              }
              do
              {
                v57 = *v33++;
                *v32++ = v57;
              }
              while (v33 != v28);
LABEL_90:
              *v32 = 0;
              v43 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
              v42 = (std::string *)__str.__r_.__value_.__r.__words[0];
              v25 = *(uint8_t **)buf;
              v26 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3);
LABEL_91:
              v58 = (char *)(a3 + 4);
              if (v43 >= 0)
                v59 = &__str;
              else
                v59 = v42;
              v60 = buf;
              if (v26 <= 1)
                v61 = buf;
              else
                v61 = v25;
              if (v61[40])
              {
                if (v26 > 1)
                  v60 = v25;
                v62 = *((_QWORD *)v60 + 4) - *((_QWORD *)v60 + 3);
                if (v62 >= 0x40)
                  v63 = 64;
                else
                  v63 = v62;
                strncpy(v58, (const char *)v59, v63);
                if (v43 < 0)
                  goto LABEL_104;
              }
              else
              {
                strncpy(v58, (const char *)v59, 0);
                if (v43 < 0)
                {
LABEL_104:
                  operator delete(v42);
                  v25 = *(uint8_t **)buf;
                  v26 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3);
                }
              }
              v64 = (__int128 *)(v25 + 64);
              if (v26 <= 2)
                v64 = &v230;
              if (!*(_BYTE *)v64)
              {
                v77 = 0;
                v78 = 0;
                memset(&__str, 0, sizeof(__str));
                goto LABEL_131;
              }
              v65 = v25 + 48;
              if (v26 <= 2)
                v65 = &buf[24];
              v66 = *(_QWORD *)v65;
              v67 = v25 + 56;
              if (v26 <= 2)
                v67 = &buf[32];
              v68 = *(char **)v67;
              v69 = *(_QWORD *)v67 - v66;
              if (v69 > 0x7FFFFFFFFFFFFFF7)
                std::string::__throw_length_error[abi:ne180100]();
              if (v69 > 0x16)
              {
                v79 = (v69 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v69 | 7) != 0x17)
                  v79 = v69 | 7;
                v80 = v79 + 1;
                v70 = (char *)operator new(v79 + 1);
                __str.__r_.__value_.__l.__size_ = v69;
                __str.__r_.__value_.__r.__words[2] = v80 | 0x8000000000000000;
                __str.__r_.__value_.__r.__words[0] = (std::string::size_type)v70;
                if ((char *)v66 != v68)
                  goto LABEL_115;
              }
              else
              {
                *((_BYTE *)&__str.__r_.__value_.__s + 23) = *v67 - v66;
                v70 = (char *)&__str;
                if ((char *)v66 != v68)
                {
LABEL_115:
                  if (v69 < 0x20 || (unint64_t)&v70[-v66] < 0x20)
                  {
                    v71 = v70;
                    v72 = (char *)v66;
                  }
                  else
                  {
                    v71 = &v70[v69 & 0xFFFFFFFFFFFFFFE0];
                    v72 = (char *)(v66 + (v69 & 0xFFFFFFFFFFFFFFE0));
                    v73 = (__int128 *)(v66 + 16);
                    v74 = v70 + 16;
                    v75 = v69 & 0xFFFFFFFFFFFFFFE0;
                    do
                    {
                      v76 = *v73;
                      *(v74 - 1) = *(v73 - 1);
                      *v74 = v76;
                      v73 += 2;
                      v74 += 2;
                      v75 -= 32;
                    }
                    while (v75);
                    if (v69 == (v69 & 0x7FFFFFFFFFFFFFE0))
                      goto LABEL_130;
                  }
                  do
                  {
                    v81 = *v72++;
                    *v71++ = v81;
                  }
                  while (v72 != v68);
LABEL_130:
                  *v71 = 0;
                  v78 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
                  v77 = (std::string *)__str.__r_.__value_.__r.__words[0];
                  v25 = *(uint8_t **)buf;
                  v26 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3);
LABEL_131:
                  v82 = (char *)(a3 + 68);
                  if (v78 >= 0)
                    v83 = &__str;
                  else
                    v83 = v77;
                  v84 = (__int128 *)(v25 + 64);
                  if (v26 <= 2)
                    v84 = &v230;
                  if (*(_BYTE *)v84)
                  {
                    v85 = v25 + 48;
                    if (v26 <= 2)
                      v85 = &buf[24];
                    v86 = *(_QWORD *)v85;
                    v87 = v25 + 56;
                    if (v26 <= 2)
                      v87 = &buf[32];
                    v88 = *(_QWORD *)v87 - v86;
                    if (v88 >= 0x40)
                      v89 = 64;
                    else
                      v89 = v88;
                    strncpy(v82, (const char *)v83, v89);
                    if (v78 < 0)
                      goto LABEL_145;
                  }
                  else
                  {
                    strncpy(v82, (const char *)v83, 0);
                    if (v78 < 0)
                    {
LABEL_145:
                      operator delete(v77);
                      v25 = *(uint8_t **)buf;
                      v26 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3);
                    }
                  }
                  v90 = (__int128 *)(v25 + 88);
                  if (v26 <= 3)
                    v90 = &v230;
                  if (*(_BYTE *)v90)
                  {
                    v91 = v25 + 72;
                    v92 = v26 > 3;
                    if (v26 <= 3)
                      v91 = &buf[24];
                    v93 = *(_QWORD *)v91;
                    v94 = v25 + 80;
                    if (!v92)
                      v94 = &buf[32];
                    v95 = *(char **)v94;
                    v96 = *(_QWORD *)v94 - v93;
                    if (v96 > 0x7FFFFFFFFFFFFFF7)
                      std::string::__throw_length_error[abi:ne180100]();
                    if (v96 > 0x16)
                    {
                      v104 = (v96 & 0xFFFFFFFFFFFFFFF8) + 8;
                      if ((v96 | 7) != 0x17)
                        v104 = v96 | 7;
                      v105 = v104 + 1;
                      v97 = operator new(v104 + 1);
                      __str.__r_.__value_.__l.__size_ = v96;
                      __str.__r_.__value_.__r.__words[2] = v105 | 0x8000000000000000;
                      __str.__r_.__value_.__r.__words[0] = (std::string::size_type)v97;
                      if ((char *)v93 != v95)
                      {
LABEL_156:
                        if (v96 < 0x20 || (unint64_t)&v97[-v93] < 0x20)
                        {
                          v98 = v97;
                          v99 = (char *)v93;
                        }
                        else
                        {
                          v98 = &v97[v96 & 0xFFFFFFFFFFFFFFE0];
                          v99 = (char *)(v93 + (v96 & 0xFFFFFFFFFFFFFFE0));
                          v100 = (__int128 *)(v93 + 16);
                          v101 = v97 + 16;
                          v102 = v96 & 0xFFFFFFFFFFFFFFE0;
                          do
                          {
                            v103 = *v100;
                            *(v101 - 1) = *(v100 - 1);
                            *v101 = v103;
                            v100 += 2;
                            v101 += 2;
                            v102 -= 32;
                          }
                          while (v102);
                          if (v96 == (v96 & 0x7FFFFFFFFFFFFFE0))
                            goto LABEL_171;
                        }
                        do
                        {
                          v106 = *v99++;
                          *v98++ = v106;
                        }
                        while (v99 != v95);
LABEL_171:
                        *v98 = 0;
                        goto LABEL_172;
                      }
                    }
                    else
                    {
                      *((_BYTE *)&__str.__r_.__value_.__s + 23) = *v94 - v93;
                      v97 = &__str;
                      if ((char *)v93 != v95)
                        goto LABEL_156;
                    }
                    *v97 = 0;
                    goto LABEL_172;
                  }
LABEL_164:
                  memset(&__str, 0, sizeof(__str));
                  goto LABEL_172;
                }
              }
              v71 = v70;
              goto LABEL_130;
            }
          }
          v32 = p_str;
          goto LABEL_90;
        }
        if (SHIBYTE(v226.__r_.__value_.__r.__words[2]) < 0)
        {
          v226.__r_.__value_.__l.__size_ = 15;
          v38 = (std::string *)v226.__r_.__value_.__r.__words[0];
        }
        else
        {
          *((_BYTE *)&v226.__r_.__value_.__s + 23) = 15;
          v38 = &v226;
        }
        strcpy((char *)v38, "([^:]*):([^:]*)");
        if (ETLEFSearchCrashReason((uint64_t)__dst, (const void **)&__s2, (const void **)&v226.__r_.__value_.__l.__data_, (uint64_t)buf))
        {
          v44 = *(uint8_t **)buf;
          v45 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3);
          if (v45 <= 1)
            v46 = buf;
          else
            v46 = *(uint8_t **)buf;
          if (!v46[40])
          {
            v107 = 0;
            v108 = 0;
            memset(&__str, 0, sizeof(__str));
LABEL_196:
            v119 = (char *)(a3 + 4);
            if (v108 >= 0)
              v120 = &__str;
            else
              v120 = (std::string *)v107;
            if (v45 <= 1)
              v121 = buf;
            else
              v121 = v44;
            if (v121[40])
            {
              if (v45 <= 1)
                v44 = buf;
              v122 = *((_QWORD *)v44 + 4) - *((_QWORD *)v44 + 3);
              if (v122 >= 0x40)
                v123 = 64;
              else
                v123 = v122;
              strncpy(v119, (const char *)v120, v123);
              if ((v108 & 0x80) == 0)
                goto LABEL_343;
              goto LABEL_211;
            }
            strncpy(v119, (const char *)v120, 0);
            if (v108 < 0)
            {
LABEL_211:
              v124 = (void *)v107;
LABEL_212:
              operator delete(v124);
            }
LABEL_343:
            v204 = (char *)(a3 + 68);
            if (v242 >= 0)
              v205 = (const char *)&v240;
            else
              v205 = v240;
            if (v242 >= 0)
              v206 = HIBYTE(v242);
            else
              v206 = v241;
LABEL_349:
            strncpy(v204, v205, v206);
            *(_DWORD *)a3 = 0;
            goto LABEL_350;
          }
          if (v45 <= 1)
            v44 = buf;
          v48 = *((_QWORD *)v44 + 3);
          v47 = (char *)*((_QWORD *)v44 + 4);
          v49 = (unint64_t)&v47[-v48];
          if ((unint64_t)&v47[-v48] > 0x7FFFFFFFFFFFFFF7)
            std::string::__throw_length_error[abi:ne180100]();
          if (v49 > 0x16)
          {
            v110 = (v49 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v49 | 7) != 0x17)
              v110 = v49 | 7;
            v111 = v110 + 1;
            v50 = (char *)operator new(v110 + 1);
            __str.__r_.__value_.__l.__size_ = (std::string::size_type)&v47[-v48];
            __str.__r_.__value_.__r.__words[2] = v111 | 0x8000000000000000;
            __str.__r_.__value_.__r.__words[0] = (std::string::size_type)v50;
          }
          else
          {
            *((_BYTE *)&__str.__r_.__value_.__s + 23) = (_BYTE)v47 - v48;
            v50 = (char *)&__str;
          }
          if ((char *)v48 == v47)
          {
            v112 = v50;
          }
          else
          {
            if (v49 < 0x20 || (unint64_t)&v50[-v48] < 0x20)
            {
              v112 = v50;
              v113 = (char *)v48;
            }
            else
            {
              v112 = &v50[v49 & 0xFFFFFFFFFFFFFFE0];
              v113 = (char *)(v48 + (v49 & 0xFFFFFFFFFFFFFFE0));
              v114 = (__int128 *)(v48 + 16);
              v115 = v50 + 16;
              v116 = v49 & 0xFFFFFFFFFFFFFFE0;
              do
              {
                v117 = *v114;
                *(v115 - 1) = *(v114 - 1);
                *v115 = v117;
                v114 += 2;
                v115 += 2;
                v116 -= 32;
              }
              while (v116);
              if (v49 == (v49 & 0xFFFFFFFFFFFFFFE0))
                goto LABEL_195;
            }
            do
            {
              v118 = *v113++;
              *v112++ = v118;
            }
            while (v113 != v47);
          }
LABEL_195:
          *v112 = 0;
          v108 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
          v107 = __str.__r_.__value_.__r.__words[0];
          v44 = *(uint8_t **)buf;
          v45 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3);
          goto LABEL_196;
        }
        HIBYTE(v228) = 11;
        strcpy((char *)&__s2, "ssr:return:");
        if (SHIBYTE(__dst[2]) < 0)
        {
          if (__dst[1] >= (const void *)0xB)
            v109 = 11;
          else
            v109 = (size_t)__dst[1];
          v52 = memcmp(__dst[0], &__s2, v109);
          if (v109 != 11)
            goto LABEL_214;
        }
        else
        {
          if (HIBYTE(__dst[2]) >= 0xBu)
            v51 = 11;
          else
            v51 = HIBYTE(__dst[2]);
          v52 = memcmp(__dst, &__s2, v51);
          if (v51 != 11)
            goto LABEL_214;
        }
        if (!v52)
        {
          if (SHIBYTE(v238) < 0)
          {
            std::string::__assign_no_alias<false>((void **)&v237, &__s2, 0xBuLL);
          }
          else
          {
            v237 = __s2;
            v238 = v228;
          }
        }
LABEL_214:
        std::string::__assign_external(&v226, v53, v54);
        if (!ETLEFSearchCrashReason((uint64_t)__dst, (const void **)&__s2, (const void **)&v226.__r_.__value_.__l.__data_, (uint64_t)buf))
        {
          if (SHIBYTE(v226.__r_.__value_.__r.__words[2]) < 0)
          {
            v226.__r_.__value_.__l.__size_ = 15;
            v132 = (std::string *)v226.__r_.__value_.__r.__words[0];
          }
          else
          {
            *((_BYTE *)&v226.__r_.__value_.__s + 23) = 15;
            v132 = &v226;
          }
          strcpy((char *)v132, "([^:]*):([^:]*)");
          if (!ETLEFSearchCrashReason((uint64_t)__dst, (const void **)&__s2, (const void **)&v226.__r_.__value_.__l.__data_, (uint64_t)buf))
          {
            if (SHIBYTE(v242) < 0)
            {
              v145 = (void **)v240;
              v144 = v241;
              v147 = (char *)(a3 + 4);
              v146 = v240;
            }
            else
            {
              v144 = HIBYTE(v242);
              v145 = (void **)&v240;
              v146 = (const char *)&v240;
              v147 = (char *)(a3 + 4);
            }
            strncpy(v147, v146, v144);
            v204 = (char *)(a3 + 68);
            v205 = (const char *)v145;
            v206 = v144;
            goto LABEL_349;
          }
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3) <= 1)
            v135 = (uint64_t *)&buf[24];
          else
            v135 = (uint64_t *)(*(_QWORD *)buf + 24);
          std::sub_match<std::__wrap_iter<char const*>>::str[abi:ne180100](&__str, v135);
          v136 = SHIBYTE(__str.__r_.__value_.__r.__words[2]);
          v137 = __str.__r_.__value_.__r.__words[0];
          if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v138 = &__str;
          else
            v138 = (std::string *)__str.__r_.__value_.__r.__words[0];
          v139 = *(uint8_t **)buf;
          v140 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3);
          if (v140 <= 1)
            v141 = buf;
          else
            v141 = *(uint8_t **)buf;
          if (v141[40])
          {
            if (v140 <= 1)
              v139 = buf;
            v142 = *((_QWORD *)v139 + 4) - *((_QWORD *)v139 + 3);
            if (v142 >= 0x40)
              v143 = 64;
            else
              v143 = v142;
          }
          else
          {
            v143 = 0;
          }
          strncpy((char *)(a3 + 4), (const char *)v138, v143);
          if (v136 < 0)
          {
            v124 = (void *)v137;
            goto LABEL_212;
          }
          goto LABEL_343;
        }
        v125 = *(uint8_t **)buf;
        v126 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3);
        if (v126 <= 1)
          v127 = buf;
        else
          v127 = *(uint8_t **)buf;
        if (!v127[40])
        {
          v133 = 0;
          v134 = 0;
          memset(&__str, 0, sizeof(__str));
          goto LABEL_258;
        }
        v129 = *((_QWORD *)v127 + 3);
        v128 = (char *)*((_QWORD *)v127 + 4);
        v130 = (unint64_t)&v128[-v129];
        if ((unint64_t)&v128[-v129] > 0x7FFFFFFFFFFFFFF7)
          std::string::__throw_length_error[abi:ne180100]();
        if (v130 > 0x16)
        {
          v148 = (v130 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v130 | 7) != 0x17)
            v148 = v130 | 7;
          v149 = v148 + 1;
          v131 = (char *)operator new(v148 + 1);
          __str.__r_.__value_.__l.__size_ = (std::string::size_type)&v128[-v129];
          __str.__r_.__value_.__r.__words[2] = v149 | 0x8000000000000000;
          __str.__r_.__value_.__r.__words[0] = (std::string::size_type)v131;
        }
        else
        {
          *((_BYTE *)&__str.__r_.__value_.__s + 23) = (_BYTE)v128 - v129;
          v131 = (char *)&__str;
        }
        if ((char *)v129 == v128)
        {
          v150 = v131;
        }
        else
        {
          if (v130 < 0x20 || (unint64_t)&v131[-v129] < 0x20)
          {
            v150 = v131;
            v151 = (char *)v129;
          }
          else
          {
            v150 = &v131[v130 & 0xFFFFFFFFFFFFFFE0];
            v151 = (char *)(v129 + (v130 & 0xFFFFFFFFFFFFFFE0));
            v152 = (__int128 *)(v129 + 16);
            v153 = v131 + 16;
            v154 = v130 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              v155 = *v152;
              *(v153 - 1) = *(v152 - 1);
              *v153 = v155;
              v152 += 2;
              v153 += 2;
              v154 -= 32;
            }
            while (v154);
            if (v130 == (v130 & 0xFFFFFFFFFFFFFFE0))
              goto LABEL_257;
          }
          do
          {
            v156 = *v151++;
            *v150++ = v156;
          }
          while (v151 != v128);
        }
LABEL_257:
        *v150 = 0;
        v134 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
        v133 = (std::string *)__str.__r_.__value_.__r.__words[0];
        v125 = *(uint8_t **)buf;
        v126 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3);
LABEL_258:
        if (v134 >= 0)
          v157 = &__str;
        else
          v157 = v133;
        v158 = buf;
        if (v126 <= 1)
          v159 = buf;
        else
          v159 = v125;
        if (v159[40])
        {
          if (v126 > 1)
            v158 = v125;
          v160 = *((_QWORD *)v158 + 4) - *((_QWORD *)v158 + 3);
          if (v160 >= 0x40)
            v161 = 64;
          else
            v161 = v160;
        }
        else
        {
          v161 = 0;
        }
        strncpy((char *)(a3 + 4), (const char *)v157, v161);
        if (v134 < 0)
        {
          operator delete(v133);
          v125 = *(uint8_t **)buf;
          v126 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3);
        }
        v162 = (__int128 *)(v125 + 64);
        if (v126 <= 2)
          v162 = &v230;
        if (!*(_BYTE *)v162)
        {
          v169 = 0;
          v170 = 0;
          memset(&__str, 0, sizeof(__str));
          goto LABEL_298;
        }
        v163 = v125 + 48;
        if (v126 <= 2)
          v163 = &buf[24];
        v164 = *(_QWORD *)v163;
        v165 = v125 + 56;
        if (v126 <= 2)
          v165 = &buf[32];
        v166 = *(char **)v165;
        v167 = *(_QWORD *)v165 - v164;
        if (v167 > 0x7FFFFFFFFFFFFFF7)
          std::string::__throw_length_error[abi:ne180100]();
        if (v167 > 0x16)
        {
          v171 = (v167 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v167 | 7) != 0x17)
            v171 = v167 | 7;
          v172 = v171 + 1;
          v168 = (char *)operator new(v171 + 1);
          __str.__r_.__value_.__l.__size_ = v167;
          __str.__r_.__value_.__r.__words[2] = v172 | 0x8000000000000000;
          __str.__r_.__value_.__r.__words[0] = (std::string::size_type)v168;
        }
        else
        {
          *((_BYTE *)&__str.__r_.__value_.__s + 23) = *v165 - v164;
          v168 = (char *)&__str;
        }
        if ((char *)v164 == v166)
        {
          v173 = v168;
        }
        else
        {
          if (v167 < 0x20 || (unint64_t)&v168[-v164] < 0x20)
          {
            v173 = v168;
            v174 = (char *)v164;
          }
          else
          {
            v173 = &v168[v167 & 0xFFFFFFFFFFFFFFE0];
            v174 = (char *)(v164 + (v167 & 0xFFFFFFFFFFFFFFE0));
            v175 = (__int128 *)(v164 + 16);
            v176 = v168 + 16;
            v177 = v167 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              v178 = *v175;
              *(v176 - 1) = *(v175 - 1);
              *v176 = v178;
              v175 += 2;
              v176 += 2;
              v177 -= 32;
            }
            while (v177);
            if (v167 == (v167 & 0x7FFFFFFFFFFFFFE0))
              goto LABEL_297;
          }
          do
          {
            v179 = *v174++;
            *v173++ = v179;
          }
          while (v174 != v166);
        }
LABEL_297:
        *v173 = 0;
        v170 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
        v169 = (std::string *)__str.__r_.__value_.__r.__words[0];
        v125 = *(uint8_t **)buf;
        v126 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3);
LABEL_298:
        if (v170 >= 0)
          v180 = &__str;
        else
          v180 = v169;
        v181 = (__int128 *)(v125 + 64);
        if (v126 <= 2)
          v181 = &v230;
        if (*(_BYTE *)v181)
        {
          v182 = v125 + 48;
          if (v126 <= 2)
            v182 = &buf[24];
          v183 = *(_QWORD *)v182;
          v184 = v125 + 56;
          if (v126 <= 2)
            v184 = &buf[32];
          v185 = *(_QWORD *)v184 - v183;
          if (v185 >= 0x40)
            v186 = 64;
          else
            v186 = v185;
        }
        else
        {
          v186 = 0;
        }
        strncpy((char *)(a3 + 68), (const char *)v180, v186);
        if (v170 < 0)
        {
          operator delete(v169);
          v125 = *(uint8_t **)buf;
          v126 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3);
        }
        v187 = (__int128 *)(v125 + 88);
        if (v126 <= 3)
          v187 = &v230;
        if (!*(_BYTE *)v187)
          goto LABEL_164;
        v188 = v125 + 72;
        v189 = v126 > 3;
        if (v126 <= 3)
          v188 = &buf[24];
        v190 = *(_QWORD *)v188;
        v191 = v125 + 80;
        if (!v189)
          v191 = &buf[32];
        v192 = *(char **)v191;
        v193 = *(_QWORD *)v191 - v190;
        if (v193 > 0x7FFFFFFFFFFFFFF7)
          std::string::__throw_length_error[abi:ne180100]();
        if (v193 > 0x16)
        {
          v195 = (v193 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v193 | 7) != 0x17)
            v195 = v193 | 7;
          v196 = v195 + 1;
          v194 = operator new(v195 + 1);
          __str.__r_.__value_.__l.__size_ = v193;
          __str.__r_.__value_.__r.__words[2] = v196 | 0x8000000000000000;
          __str.__r_.__value_.__r.__words[0] = (std::string::size_type)v194;
        }
        else
        {
          *((_BYTE *)&__str.__r_.__value_.__s + 23) = *v191 - v190;
          v194 = &__str;
        }
        if ((char *)v190 == v192)
        {
          *v194 = 0;
          goto LABEL_172;
        }
        if (v193 < 0x20 || (unint64_t)&v194[-v190] < 0x20)
        {
          v197 = v194;
          v198 = (char *)v190;
        }
        else
        {
          v197 = &v194[v193 & 0xFFFFFFFFFFFFFFE0];
          v198 = (char *)(v190 + (v193 & 0xFFFFFFFFFFFFFFE0));
          v199 = (__int128 *)(v190 + 16);
          v200 = v194 + 16;
          v201 = v193 & 0xFFFFFFFFFFFFFFE0;
          do
          {
            v202 = *v199;
            *(v200 - 1) = *(v199 - 1);
            *v200 = v202;
            v199 += 2;
            v200 += 2;
            v201 -= 32;
          }
          while (v201);
          if (v193 == (v193 & 0x7FFFFFFFFFFFFFE0))
            goto LABEL_338;
        }
        do
        {
          v203 = *v198++;
          *v197++ = v203;
        }
        while (v198 != v192);
LABEL_338:
        *v197 = 0;
LABEL_172:
        *(_DWORD *)a3 = std::stoi(&__str, 0, 10);
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__str.__r_.__value_.__l.__data_);
LABEL_350:
        if (SHIBYTE(v226.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v226.__r_.__value_.__l.__data_);
          if ((SHIBYTE(v228) & 0x80000000) == 0)
          {
LABEL_352:
            v207 = *(void **)buf;
            if (!*(_QWORD *)buf)
              goto LABEL_354;
            goto LABEL_353;
          }
        }
        else if ((SHIBYTE(v228) & 0x80000000) == 0)
        {
          goto LABEL_352;
        }
        operator delete((void *)__s2);
        v207 = *(void **)buf;
        if (!*(_QWORD *)buf)
        {
LABEL_354:
          memset(buf, 170, 24);
          if (SHIBYTE(v238) < 0)
          {
            v208 = *((_QWORD *)&v237 + 1);
            if (*((_QWORD *)&v237 + 1))
            {
LABEL_356:
              if (SHIBYTE(__dst[2]) < 0)
              {
                v209 = __dst[1];
                if (__dst[1] >= (const void *)v208)
                {
                  v210 = (const void **)__dst[0];
                  v211 = (size_t)__dst[1] - v208;
                  if ((char *)__dst[1] - v208 > (const void *)0x7FFFFFFFFFFFFFF7)
                    goto LABEL_403;
LABEL_373:
                  if (v211 >= 0x17)
                  {
                    v217 = (v211 & 0xFFFFFFFFFFFFFFF8) + 8;
                    if ((v211 | 7) != 0x17)
                      v217 = v211 | 7;
                    v218 = v217 + 1;
                    v214 = (uint8_t *)operator new(v217 + 1);
                    *(_QWORD *)&buf[8] = v211;
                    *(_QWORD *)&buf[16] = v218 | 0x8000000000000000;
                    *(_QWORD *)buf = v214;
                  }
                  else
                  {
                    buf[23] = v211;
                    v214 = buf;
                    if (v209 == (const void *)v208)
                      goto LABEL_375;
                  }
                  v219 = (const void **)((char *)v210 + v208);
                  goto LABEL_395;
                }
              }
              else
              {
                v209 = (const void *)HIBYTE(__dst[2]);
                if (v208 <= HIBYTE(__dst[2]))
                {
                  v210 = __dst;
                  v211 = HIBYTE(__dst[2]) - v208;
                  if (v211 > 0x7FFFFFFFFFFFFFF7)
                    goto LABEL_403;
                  goto LABEL_373;
                }
              }
              std::string::__throw_out_of_range[abi:ne180100]();
            }
          }
          else
          {
            v208 = HIBYTE(v238);
            if (HIBYTE(v238))
              goto LABEL_356;
          }
          v212 = SHIBYTE(__dst[2]);
          if (SHIBYTE(__dst[2]) >= 0)
            v211 = HIBYTE(__dst[2]);
          else
            v211 = (size_t)__dst[1];
          v213 = v211 + 4;
          if (v211 + 4 > 0x7FFFFFFFFFFFFFF7)
LABEL_403:
            std::string::__throw_length_error[abi:ne180100]();
          if (v213 >= 0x17)
          {
            v220 = (v213 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v213 | 7) != 0x17)
              v220 = v213 | 7;
            v221 = v220 + 1;
            v222 = operator new(v220 + 1);
            *(_QWORD *)&buf[8] = v211 + 4;
            *(_QWORD *)&buf[16] = v221 | 0x8000000000000000;
            *(_QWORD *)buf = v222;
            *v222 = 1029128530;
            v214 = (uint8_t *)(v222 + 1);
          }
          else
          {
            memset(&buf[5], 0, 19);
            buf[23] = v211 + 4;
            v214 = &buf[4];
            strcpy((char *)buf, "RAW=");
            if (!v211)
            {
LABEL_375:
              v214[v211] = 0;
              v215 = buf[23];
              if (((char)buf[23] & 0x80000000) == 0)
                goto LABEL_376;
              goto LABEL_396;
            }
          }
          if (v212 >= 0)
            v219 = __dst;
          else
            v219 = (const void **)__dst[0];
LABEL_395:
          memmove(v214, v219, v211);
          v214[v211] = 0;
          v215 = buf[23];
          if (((char)buf[23] & 0x80000000) == 0)
          {
LABEL_376:
            strncpy((char *)(a3 + 132), (const char *)buf, v215);
            if ((SHIBYTE(v238) & 0x80000000) == 0)
              goto LABEL_378;
            goto LABEL_377;
          }
LABEL_396:
          v223 = *(void **)buf;
          if (*(_QWORD *)&buf[8] >= 0x100uLL)
            v224 = 256;
          else
            v224 = *(_QWORD *)&buf[8];
          strncpy((char *)(a3 + 132), *(const char **)buf, v224);
          operator delete(v223);
          if ((SHIBYTE(v238) & 0x80000000) == 0)
          {
LABEL_378:
            if ((HIBYTE(__dst[2]) & 0x80) == 0)
              goto LABEL_380;
            goto LABEL_379;
          }
LABEL_377:
          operator delete((void *)v237);
          goto LABEL_378;
        }
LABEL_353:
        *(_QWORD *)&buf[8] = v207;
        operator delete(v207);
        goto LABEL_354;
      }
    }
    else
    {
      HIBYTE(__dst[2]) = (_BYTE)v10 - (_BYTE)a1;
      v12 = __dst;
      if (v10 == a1)
        goto LABEL_20;
    }
    memcpy(v12, a1, v10 - a1);
    v12 = (const void **)((char *)v12 + v11);
    goto LABEL_20;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_2129D2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "buff is null", buf, 2u);
  }
  return v4;
}

void sub_2129D42FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29)
{
  uint64_t v29;
  void *v31;

  if (a21 < 0)
  {
    operator delete(__p);
    if ((a27 & 0x80000000) == 0)
    {
LABEL_3:
      v31 = a28;
      if (!a28)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((a27 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a22);
  v31 = a28;
  if (!a28)
  {
LABEL_4:
    if ((*(char *)(v29 - 153) & 0x80000000) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  operator delete(v31);
  if ((*(char *)(v29 - 153) & 0x80000000) == 0)
  {
LABEL_5:
    if ((*(char *)(v29 - 129) & 0x80000000) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  operator delete(*(void **)(v29 - 176));
  if ((*(char *)(v29 - 129) & 0x80000000) == 0)
  {
LABEL_6:
    if ((*(char *)(v29 - 105) & 0x80000000) == 0)
      goto LABEL_7;
    goto LABEL_14;
  }
LABEL_13:
  operator delete(*(void **)(v29 - 152));
  if ((*(char *)(v29 - 105) & 0x80000000) == 0)
  {
LABEL_7:
    if ((*(char *)(v29 - 81) & 0x80000000) == 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_14:
  operator delete(*(void **)(v29 - 128));
  if ((*(char *)(v29 - 81) & 0x80000000) == 0)
LABEL_8:
    _Unwind_Resume(exception_object);
LABEL_15:
  operator delete(*(void **)(v29 - 104));
  _Unwind_Resume(exception_object);
}

uint64_t ETLEFSearchCrashReason(uint64_t a1, const void **a2, const void **a3, uint64_t a4)
{
  int v4;
  size_t v5;
  int v6;
  size_t v7;
  unint64_t v8;
  std::sub_match<const char *> *p_dst;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  const void *v17;
  const void *v18;
  std::vector<std::csub_match>::pointer value_high;
  std::basic_regex<char>::value_type *begin;
  __int128 v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  char v26;
  std::vector<std::csub_match>::pointer v27;
  std::vector<std::csub_match>::pointer end;
  std::vector<std::csub_match>::pointer v29;
  const char *first;
  const char **p_second;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  char *v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  char *v50;
  char *v51;
  char *v52;
  uint64_t v53;
  char *v54;
  char *v55;
  __int128 v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  std::sub_match<const char *> *v60;
  std::vector<std::csub_match>::pointer v61;
  std::sub_match<const char *> *v62;
  const char **v63;
  BOOL *p_matched;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  std::__shared_weak_count *v71;
  unint64_t *v72;
  unint64_t v73;
  unsigned int v75;
  uint64_t v77;
  std::locale v78[2];
  _BYTE v79[48];
  std::vector<std::csub_match> __dst;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  unint64_t v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;

  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = *((unsigned __int8 *)a2 + 23);
  else
    v5 = (size_t)a2[1];
  v6 = *((char *)a3 + 23);
  if (v6 >= 0)
    v7 = *((unsigned __int8 *)a3 + 23);
  else
    v7 = (size_t)a3[1];
  v8 = v7 + v5;
  if (v7 + v5 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v8 <= 0x16)
  {
    memset(&__dst, 0, sizeof(__dst));
    p_dst = (std::sub_match<const char *> *)&__dst;
    HIBYTE(__dst.__end_cap_.__value_) = v7 + v5;
    *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v79[16] = v13;
    *(_OWORD *)&v79[32] = v13;
    *(_OWORD *)&v78[0].__locale_ = v13;
    *(_OWORD *)v79 = v13;
    if (!v5)
      goto LABEL_18;
    goto LABEL_14;
  }
  v14 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v8 | 7) != 0x17)
    v14 = v8 | 7;
  v15 = v14 + 1;
  p_dst = (std::sub_match<const char *> *)operator new(v14 + 1);
  __dst.__end_ = (std::vector<std::csub_match>::pointer)(v7 + v5);
  __dst.__end_cap_.__value_ = (std::sub_match<const char *> *)(v15 | 0x8000000000000000);
  __dst.__begin_ = p_dst;
  *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v79[16] = v16;
  *(_OWORD *)&v79[32] = v16;
  *(_OWORD *)&v78[0].__locale_ = v16;
  *(_OWORD *)v79 = v16;
  if (v5)
  {
LABEL_14:
    if (v4 >= 0)
      v17 = a2;
    else
      v17 = *a2;
    memmove(p_dst, v17, v5);
  }
LABEL_18:
  if (v7)
  {
    if (v6 >= 0)
      v18 = a3;
    else
      v18 = *a3;
    memmove((char *)p_dst + v5, v18, v7);
  }
  *((_BYTE *)&p_dst->first + v5 + v7) = 0;
  MEMORY[0x212BF6424](v78);
  v78[1].__locale_ = (std::locale::__imp *)std::locale::use_facet(v78, MEMORY[0x24BEDB350]);
  *(_QWORD *)v79 = std::locale::use_facet(v78, MEMORY[0x24BEDB4B0]);
  memset(&v79[8], 0, 40);
  value_high = (std::vector<std::csub_match>::pointer)HIBYTE(__dst.__end_cap_.__value_);
  if (SHIBYTE(__dst.__end_cap_.__value_) >= 0)
    begin = (std::basic_regex<char>::value_type *)&__dst;
  else
    begin = (std::basic_regex<char>::value_type *)__dst.__begin_;
  if (SHIBYTE(__dst.__end_cap_.__value_) < 0)
    value_high = __dst.__end_;
  if ((std::basic_regex<char> *)((char *)value_high + (_QWORD)begin) != std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>((uint64_t)v78, begin, (std::basic_regex<char> *)((char *)value_high + (_QWORD)begin)))std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>();
  if (SHIBYTE(__dst.__end_cap_.__value_) < 0)
    operator delete(__dst.__begin_);
  *(_QWORD *)&v21 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v82 = 0xAAAAAAAAAAAAAAAALL;
  v84 = 0xAAAAAAAAAAAAAA00;
  v86 = v21;
  v83 = 0;
  v85 = 0uLL;
  LOBYTE(v86) = 0;
  BYTE8(v86) = 0;
  v87 = 0;
  __dst.__begin_ = 0;
  __dst.__end_ = 0;
  v22 = *(char *)(a1 + 23);
  if (v22 >= 0)
    v23 = a1;
  else
    v23 = *(_QWORD *)a1;
  if (v22 >= 0)
    v24 = *(unsigned __int8 *)(a1 + 23);
  else
    v24 = *(_QWORD *)(a1 + 8);
  v25 = (const char *)(v23 + v24);
  __dst.__end_cap_.__value_ = 0;
  *(_QWORD *)&v81 = v23 + v24;
  *((_QWORD *)&v81 + 1) = v23 + v24;
  LOBYTE(v82) = 0;
  std::vector<std::sub_match<char const*>>::assign(&__dst, (*(_DWORD *)&v79[12] + 1), (std::vector<std::csub_match>::const_reference)&v81);
  *((_QWORD *)&v82 + 1) = v23;
  v83 = v23;
  LOBYTE(v84) = 0;
  v85 = v81;
  LOBYTE(v86) = v82;
  v87 = v23;
  BYTE8(v86) = 1;
  if ((*(_WORD *)&v79[8] & 0x1F0) == 0)
  {
    v26 = std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>((uint64_t)v78, v23, (const char *)(v23 + v24), (uint64_t *)&__dst, 0, 1);
    goto LABEL_43;
  }
  if (!*(_DWORD *)&v79[12])
  {
    v26 = std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>((uint64_t)v78, v23, v23 + v24, (uint64_t *)&__dst, 0, 1);
LABEL_43:
    if ((v26 & 1) != 0)
      goto LABEL_44;
    goto LABEL_50;
  }
  if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>((uint64_t)v78, v23, (const char *)(v23 + v24), (uint64_t *)&__dst, 0, 1))goto LABEL_44;
LABEL_50:
  if (!v24)
    goto LABEL_68;
  v34 = v24 - 1;
  if (v34)
  {
    v35 = v23 + 1;
    while (1)
    {
      std::vector<std::sub_match<char const*>>::assign(&__dst, 0xAAAAAAAAAAAAAAABLL * (((char *)__dst.__end_ - (char *)__dst.__begin_) >> 3), (std::vector<std::csub_match>::const_reference)&v81);
      if ((*(_WORD *)&v79[8] & 0x1F0) == 0)
        break;
      if (!*(_DWORD *)&v79[12])
      {
        v36 = std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>((uint64_t)v78, v35, (uint64_t)v25, (uint64_t *)&__dst, 128, 0);
LABEL_59:
        if ((v36 & 1) != 0)
          goto LABEL_44;
        goto LABEL_60;
      }
      if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>((uint64_t)v78, v35, v25, (uint64_t *)&__dst, 128, 0))goto LABEL_44;
LABEL_60:
      std::vector<std::sub_match<char const*>>::assign(&__dst, 0xAAAAAAAAAAAAAAABLL * (((char *)__dst.__end_ - (char *)__dst.__begin_) >> 3), (std::vector<std::csub_match>::const_reference)&v81);
      ++v35;
      if (!--v34)
        goto LABEL_61;
    }
    v36 = std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>((uint64_t)v78, v35, v25, (uint64_t *)&__dst, 128, 0);
    goto LABEL_59;
  }
LABEL_61:
  std::vector<std::sub_match<char const*>>::assign(&__dst, 0xAAAAAAAAAAAAAAABLL * (((char *)__dst.__end_ - (char *)__dst.__begin_) >> 3), (std::vector<std::csub_match>::const_reference)&v81);
  if ((*(_WORD *)&v79[8] & 0x1F0) != 0)
  {
    if (*(_DWORD *)&v79[12])
    {
      if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>((uint64_t)v78, (uint64_t)v25, v25, (uint64_t *)&__dst, 128, 0))goto LABEL_44;
LABEL_68:
      v33 = 0;
      v27 = __dst.__begin_;
      v32 = *((_QWORD *)&v82 + 1);
      __dst.__end_ = __dst.__begin_;
      end = __dst.__begin_;
      goto LABEL_69;
    }
    v37 = std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>((uint64_t)v78, (uint64_t)v25, (uint64_t)v25, (uint64_t *)&__dst, 128, 0);
  }
  else
  {
    v37 = std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>((uint64_t)v78, (uint64_t)v25, v25, (uint64_t *)&__dst, 128, 0);
  }
  if ((v37 & 1) == 0)
    goto LABEL_68;
LABEL_44:
  v27 = __dst.__begin_;
  end = __dst.__end_;
  if (__dst.__end_ == __dst.__begin_)
    v29 = (std::vector<std::csub_match>::pointer)&v81;
  else
    v29 = __dst.__begin_;
  first = v29->first;
  v83 = (uint64_t)first;
  p_second = &__dst.__begin_->second;
  if (__dst.__end_ == __dst.__begin_)
    p_second = (const char **)&v81 + 1;
  v32 = *((_QWORD *)&v82 + 1);
  LOBYTE(v84) = *((_QWORD *)&v82 + 1) != (_QWORD)first;
  *(_QWORD *)&v85 = *p_second;
  LOBYTE(v86) = (_QWORD)v85 != *((_QWORD *)&v85 + 1);
  v33 = 1;
LABEL_69:
  v38 = *(char *)(a1 + 23);
  if (v38 >= 0)
    v39 = a1;
  else
    v39 = *(_QWORD *)a1;
  if (v38 >= 0)
    v40 = *(unsigned __int8 *)(a1 + 23);
  else
    v40 = *(_QWORD *)(a1 + 8);
  v41 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)v27) >> 3);
  v43 = *(char **)a4;
  v42 = *(char **)(a4 + 8);
  v44 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v42[-*(_QWORD *)a4] >> 3);
  v45 = v41 - v44;
  if (v41 <= v44)
  {
    if (v41 < v44)
    {
      v42 = &v43[24 * v41];
      *(_QWORD *)(a4 + 8) = v42;
    }
    v57 = v39 + v40;
    if (v42 == v43)
      goto LABEL_112;
    goto LABEL_94;
  }
  v46 = *(_QWORD *)(a4 + 16);
  if (0xAAAAAAAAAAAAAAABLL * ((v46 - (uint64_t)v42) >> 3) < v45)
  {
    v75 = v33;
    if (v41 > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    v77 = v40;
    v47 = 0xAAAAAAAAAAAAAAABLL * ((v46 - (uint64_t)v43) >> 3);
    v48 = 0x5555555555555556 * ((v46 - (uint64_t)v43) >> 3);
    if (v48 <= v41)
      v48 = v41;
    if (v47 >= 0x555555555555555)
      v49 = 0xAAAAAAAAAAAAAAALL;
    else
      v49 = v48;
    if (v49 > 0xAAAAAAAAAAAAAAALL)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v50 = (char *)operator new(24 * v49);
    v51 = &v50[24 * v44];
    v52 = &v50[24 * v41];
    v53 = 24 * v41 - 24 * v44;
    v54 = v51;
    do
    {
      *(_QWORD *)v54 = 0;
      *((_QWORD *)v54 + 1) = 0;
      v54[16] = 0;
      v54 += 24;
      v53 -= 24;
    }
    while (v53);
    v55 = &v50[24 * v49];
    v40 = v77;
    if (v42 == v43)
    {
      v33 = v75;
      *(_QWORD *)a4 = v51;
      *(_QWORD *)(a4 + 8) = v52;
      *(_QWORD *)(a4 + 16) = v55;
      if (!v42)
        goto LABEL_111;
    }
    else
    {
      v33 = v75;
      do
      {
        v56 = *(_OWORD *)(v42 - 24);
        *((_QWORD *)v51 - 1) = *((_QWORD *)v42 - 1);
        *(_OWORD *)(v51 - 24) = v56;
        v51 -= 24;
        v42 -= 24;
      }
      while (v42 != v43);
      v42 = v43;
      *(_QWORD *)a4 = v51;
      *(_QWORD *)(a4 + 8) = v52;
      *(_QWORD *)(a4 + 16) = v55;
      if (!v43)
        goto LABEL_111;
    }
    operator delete(v42);
    v40 = v77;
    v52 = *(char **)(a4 + 8);
    goto LABEL_111;
  }
  v52 = &v42[24 * v45];
  v65 = 24 * v41 - 8 * ((uint64_t)&v42[-*(_QWORD *)a4] >> 3);
  do
  {
    *(_QWORD *)v42 = 0;
    *((_QWORD *)v42 + 1) = 0;
    v42[16] = 0;
    v42 += 24;
    v65 -= 24;
  }
  while (v65);
  *(_QWORD *)(a4 + 8) = v52;
LABEL_111:
  v43 = *(char **)a4;
  v66 = v52;
  v57 = v39 + v40;
  if (v66 == *(char **)a4)
  {
LABEL_112:
    v60 = __dst.__begin_;
    goto LABEL_113;
  }
LABEL_94:
  v58 = 0;
  v59 = 0;
  v60 = __dst.__begin_;
  v61 = __dst.__end_;
  do
  {
    if (0xAAAAAAAAAAAAAAABLL * (((char *)v61 - (char *)v60) >> 3) <= v59)
      v62 = (std::sub_match<const char *> *)&v81;
    else
      v62 = &v60[v58];
    *(_QWORD *)&v43[v58 * 24] = &v62->first[v39 - v32];
    if (0xAAAAAAAAAAAAAAABLL * (((char *)__dst.__end_ - (char *)__dst.__begin_) >> 3) <= v59)
      v63 = (const char **)&v81 + 1;
    else
      v63 = &__dst.__begin_[v58].second;
    *(_QWORD *)(*(_QWORD *)a4 + v58 * 24 + 8) = &(*v63)[v39 - v32];
    v60 = __dst.__begin_;
    v61 = __dst.__end_;
    if (0xAAAAAAAAAAAAAAABLL * (((char *)__dst.__end_ - (char *)__dst.__begin_) >> 3) <= v59)
      p_matched = (BOOL *)&v82;
    else
      p_matched = &__dst.__begin_[v58].matched;
    v43 = *(char **)a4;
    *(_BYTE *)(*(_QWORD *)a4 + v58 * 24 + 16) = *p_matched;
    ++v59;
    ++v58;
  }
  while (v59 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a4 + 8) - (_QWORD)v43) >> 3));
LABEL_113:
  *(_QWORD *)(a4 + 24) = v57;
  *(_QWORD *)(a4 + 32) = v57;
  v67 = v39 + *((_QWORD *)&v82 + 1) - v32;
  v68 = v39 + v83 - v32;
  *(_QWORD *)(a4 + 48) = v67;
  *(_QWORD *)(a4 + 56) = v68;
  *(_BYTE *)(a4 + 64) = v84;
  v69 = v85 - v32;
  v70 = *((_QWORD *)&v85 + 1) - v32;
  *(_BYTE *)(a4 + 40) = 0;
  *(_QWORD *)(a4 + 72) = v39 + v69;
  *(_QWORD *)(a4 + 80) = v39 + v70;
  *(_BYTE *)(a4 + 88) = v86;
  *(_QWORD *)(a4 + 104) = v67;
  *(_BYTE *)(a4 + 96) = BYTE8(v86);
  if (v60)
  {
    __dst.__end_ = v60;
    operator delete(v60);
  }
  v71 = *(std::__shared_weak_count **)&v79[32];
  if (*(_QWORD *)&v79[32])
  {
    v72 = (unint64_t *)(*(_QWORD *)&v79[32] + 8);
    do
      v73 = __ldaxr(v72);
    while (__stlxr(v73 - 1, v72));
    if (!v73)
    {
      ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
      std::__shared_weak_count::__release_weak(v71);
    }
  }
  std::locale::~locale(v78);
  return v33;
}

void sub_2129D4C28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::locale a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  uint64_t v24;

  std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100](v24);
  std::locale::~locale(&a11);
  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_2129D4C5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::locale a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20)
{
  if (__p)
  {
    a20 = (uint64_t)__p;
    operator delete(__p);
  }
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a11);
  _Unwind_Resume(a1);
}

_QWORD *std::sub_match<std::__wrap_iter<char const*>>::str[abi:ne180100](_QWORD *result, uint64_t *a2)
{
  _QWORD *v2;
  char *v3;
  uint64_t v4;
  unint64_t v5;
  _BYTE *v6;
  char *v7;
  __int128 *v8;
  _OWORD *v9;
  unint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v2 = result;
  if (!*((_BYTE *)a2 + 16))
  {
    *result = 0;
    result[1] = 0;
    result[2] = 0;
    return result;
  }
  v4 = *a2;
  v3 = (char *)a2[1];
  v5 = (unint64_t)&v3[-*a2];
  if (v5 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v5 <= 0x16)
  {
    *((_BYTE *)result + 23) = v5;
    if ((char *)v4 != v3)
      goto LABEL_5;
LABEL_15:
    *(_BYTE *)v2 = 0;
    return result;
  }
  v12 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v5 | 7) != 0x17)
    v12 = v5 | 7;
  v13 = v12 + 1;
  result = operator new(v12 + 1);
  v2[1] = v5;
  v2[2] = v13 | 0x8000000000000000;
  *v2 = result;
  v2 = result;
  if ((char *)v4 == v3)
    goto LABEL_15;
LABEL_5:
  if (v5 < 0x20 || (unint64_t)v2 - v4 < 0x20)
  {
    v6 = v2;
    v7 = (char *)v4;
  }
  else
  {
    v6 = (char *)v2 + (v5 & 0xFFFFFFFFFFFFFFE0);
    v7 = (char *)(v4 + (v5 & 0xFFFFFFFFFFFFFFE0));
    v8 = (__int128 *)(v4 + 16);
    v9 = v2 + 2;
    v10 = v5 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      v11 = *v8;
      *(v9 - 1) = *(v8 - 1);
      *v9 = v11;
      v8 += 2;
      v9 += 2;
      v10 -= 32;
    }
    while (v10);
    if (v5 == (v5 & 0x7FFFFFFFFFFFFFE0))
      goto LABEL_18;
  }
  do
  {
    v14 = *v7++;
    *v6++ = v14;
  }
  while (v7 != v3);
LABEL_18:
  *v6 = 0;
  return result;
}

uint64_t ETLEFSearchBasebandCrashReasonM20(const void **a1, char **a2)
{
  int folder;
  __int128 v4;
  int v5;
  void **v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  std::string *v10;
  char *v11;
  char **v12;
  uint64_t v13;
  size_t v14;
  char *v15;
  int v16;
  int v18;
  unint64_t v19;
  BOOL v20;
  unint64_t v21;
  unint64_t v22;
  BOOL v23;
  unint64_t v24;
  size_t v25;
  std::string *v26;
  void **v27;
  void **v28;
  char *v29;
  char *v30;
  int v31;
  char v32;
  int v33;
  size_t v34;
  unint64_t v35;
  _BYTE *v36;
  uint64_t v37;
  uint64_t v38;
  const void *v39;
  int v40;
  const std::string::value_type *v41;
  std::string::size_type v42;
  std::string *v43;
  __int128 v44;
  void **v45;
  int v46;
  _OWORD *v47;
  __int128 v48;
  unint64_t v49;
  char *v50;
  char **v51;
  char *v52;
  char v53;
  char *v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  char *v58;
  char *v59;
  char *v60;
  void **v61;
  __int128 v63;
  char *v64;
  char *v65;
  int v66;
  unint64_t v67;
  char *v69;
  char *v70;
  unint64_t v71;
  void *__p[4];
  _BYTE __s2[388];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v69 = 0;
  v70 = 0;
  v71 = 0;
  memset(__p, 0, 24);
  folder = ctu::fs::read_folder();
  v5 = folder;
  v6 = 0;
  if (folder)
  {
    v7 = -1431655765 * ((unint64_t)((char *)__p[1] - (char *)__p[0]) >> 3);
    if ((_DWORD)v7)
    {
      v66 = folder;
      v8 = 0;
      v9 = 24 * v7;
      while (1)
      {
        v11 = (char *)__p[0];
        v12 = (char **)((char *)__p[0] + v8);
        __s2[23] = 6;
        strcpy(__s2, "OCIMEM");
        v13 = *((unsigned __int8 *)__p[0] + v8 + 23);
        if (*((char *)__p[0] + v8 + 23) < 0)
        {
          v15 = *v12;
          if ((unint64_t)v12[1] >= 6)
            v14 = 6;
          else
            v14 = (size_t)v12[1];
        }
        else
        {
          if (v13 >= 6)
            v14 = 6;
          else
            v14 = *((unsigned __int8 *)__p[0] + v8 + 23);
          v15 = (char *)__p[0] + v8;
        }
        v16 = memcmp(v15, __s2, v14);
        if (v14 != 6 || v16 != 0)
          goto LABEL_6;
        if ((v13 & 0x80) != 0)
        {
          v19 = *(_QWORD *)&v11[v8 + 8];
          v20 = v19 > 4;
          v21 = v19 - 4;
          if (!v20)
          {
            v26 = (std::string *)v70;
            if ((unint64_t)v70 < v71)
              goto LABEL_38;
            goto LABEL_4;
          }
          __s2[23] = 4;
          strcpy(__s2, ".BIN");
          v22 = *(_QWORD *)&v11[v8 + 8];
          v23 = v22 >= v21;
          v24 = v22 - v21;
          if (!v23)
            std::string::__throw_out_of_range[abi:ne180100]();
          if (v24 >= 4)
            v25 = 4;
          else
            v25 = v24;
          v18 = memcmp(&(*v12)[v21], __s2, v25);
          if (v25 != 4)
            goto LABEL_6;
        }
        else
        {
          if (v13 <= 4)
          {
            v26 = (std::string *)v70;
            if ((unint64_t)v70 < v71)
              goto LABEL_36;
            goto LABEL_4;
          }
          __s2[23] = 4;
          strcpy(__s2, ".BIN");
          v18 = memcmp((char *)v12 + v13 - 4, __s2, 4uLL);
        }
        if (v18)
          goto LABEL_6;
        v26 = (std::string *)v70;
        if ((unint64_t)v70 < v71)
        {
          if ((v13 & 0x80) != 0)
          {
LABEL_38:
            std::string::__init_copy_ctor_external(v26, *(const std::string::value_type **)&v11[v8], *(_QWORD *)&v11[v8 + 8]);
          }
          else
          {
LABEL_36:
            v4 = *(_OWORD *)v12;
            v26->__r_.__value_.__r.__words[2] = (std::string::size_type)v12[2];
            *(_OWORD *)&v26->__r_.__value_.__l.__data_ = v4;
          }
          v10 = v26 + 1;
          goto LABEL_5;
        }
LABEL_4:
        v10 = std::vector<std::string>::__push_back_slow_path<std::string const&>(&v69, (uint64_t)v12);
LABEL_5:
        v70 = (char *)v10;
LABEL_6:
        v8 += 24;
        if (v9 == v8)
        {
          v6 = (void **)__p[0];
          v5 = v66;
          break;
        }
      }
    }
  }
  if (v6)
  {
    v27 = (void **)__p[1];
    v28 = v6;
    if (__p[1] != v6)
    {
      do
      {
        if (*((char *)v27 - 1) < 0)
          operator delete(*(v27 - 3));
        v27 -= 3;
      }
      while (v27 != v6);
      v28 = (void **)__p[0];
    }
    __p[1] = v6;
    operator delete(v28);
  }
  v30 = v69;
  v29 = v70;
  if (v70 == v69)
    v31 = 0;
  else
    v31 = v5;
  if (v31 != 1)
  {
    v32 = 0;
    if (v69)
      goto LABEL_116;
    return v32 & 1;
  }
  v32 = 0;
  *(_QWORD *)&v4 = 136315138;
  v63 = v4;
  do
  {
    memset(__p, 170, 24);
    v33 = *((char *)a1 + 23);
    if (v33 >= 0)
      v34 = *((unsigned __int8 *)a1 + 23);
    else
      v34 = (size_t)a1[1];
    v35 = v34 + 1;
    memset(__s2, 170, 24);
    if (v34 + 1 >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    if (v35 >= 0x17)
    {
      v37 = (v35 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v35 | 7) != 0x17)
        v37 = v35 | 7;
      v38 = v37 + 1;
      v36 = operator new(v37 + 1);
      *(_QWORD *)&__s2[8] = v34 + 1;
      *(_QWORD *)&__s2[16] = v38 | 0x8000000000000000;
      *(_QWORD *)__s2 = v36;
    }
    else
    {
      memset(__s2, 0, 24);
      v36 = __s2;
      __s2[23] = v34 + 1;
      if (!v34)
        goto LABEL_69;
    }
    if (v33 >= 0)
      v39 = a1;
    else
      v39 = *a1;
    memmove(v36, v39, v34);
LABEL_69:
    *(_WORD *)&v36[v34] = 47;
    v40 = v30[23];
    if (v40 >= 0)
      v41 = v30;
    else
      v41 = *(const std::string::value_type **)v30;
    if (v40 >= 0)
      v42 = v30[23];
    else
      v42 = *((_QWORD *)v30 + 1);
    v43 = std::string::append((std::string *)__s2, v41, v42);
    v44 = *(_OWORD *)&v43->__r_.__value_.__l.__data_;
    __p[2] = (void *)v43->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v44;
    v43->__r_.__value_.__l.__size_ = 0;
    v43->__r_.__value_.__r.__words[2] = 0;
    v43->__r_.__value_.__r.__words[0] = 0;
    if ((__s2[23] & 0x80000000) != 0)
      operator delete(*(void **)__s2);
    if (SHIBYTE(__p[2]) >= 0)
      v45 = __p;
    else
      v45 = (void **)__p[0];
    v46 = open((const char *)v45, 0, v63);
    if (v46 < 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v61 = __p;
        if (SHIBYTE(__p[2]) < 0)
          v61 = (void **)__p[0];
        *(_DWORD *)__s2 = v63;
        *(_QWORD *)&__s2[4] = v61;
        _os_log_error_impl(&dword_2129D2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to open %s", __s2, 0xCu);
      }
      v53 = 0;
    }
    else
    {
      v47 = operator new[](0x100uLL);
      v47[14] = 0u;
      v47[15] = 0u;
      v47[12] = 0u;
      v47[13] = 0u;
      v47[10] = 0u;
      v47[11] = 0u;
      v47[8] = 0u;
      v47[9] = 0u;
      v47[6] = 0u;
      v47[7] = 0u;
      v47[4] = 0u;
      v47[5] = 0u;
      v47[2] = 0u;
      v47[3] = 0u;
      *v47 = 0u;
      v47[1] = 0u;
      if (lseek(v46, 64488, 1) < 1 || read(v46, v47, 0x100uLL) < 1)
      {
        v53 = 0;
      }
      else
      {
        *(_DWORD *)&__s2[384] = -1431655766;
        *(_QWORD *)&v48 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v48 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&__s2[352] = v48;
        *(_OWORD *)&__s2[368] = v48;
        *(_OWORD *)&__s2[320] = v48;
        *(_OWORD *)&__s2[336] = v48;
        *(_OWORD *)&__s2[288] = v48;
        *(_OWORD *)&__s2[304] = v48;
        *(_OWORD *)&__s2[256] = v48;
        *(_OWORD *)&__s2[272] = v48;
        *(_OWORD *)&__s2[224] = v48;
        *(_OWORD *)&__s2[240] = v48;
        *(_OWORD *)&__s2[192] = v48;
        *(_OWORD *)&__s2[208] = v48;
        *(_OWORD *)&__s2[160] = v48;
        *(_OWORD *)&__s2[176] = v48;
        *(_OWORD *)&__s2[128] = v48;
        *(_OWORD *)&__s2[144] = v48;
        *(_OWORD *)&__s2[96] = v48;
        *(_OWORD *)&__s2[112] = v48;
        *(_OWORD *)&__s2[80] = v48;
        *(_OWORD *)&__s2[48] = v48;
        *(_OWORD *)&__s2[64] = v48;
        *(_OWORD *)&__s2[16] = v48;
        *(_OWORD *)&__s2[32] = v48;
        *(_OWORD *)__s2 = v48;
        if (ETLEFCopyCrashLocationDetailsM20(v47, 0x100u, (uint64_t)__s2))
        {
          v50 = a2[1];
          v49 = (unint64_t)a2[2];
          if ((unint64_t)v50 >= v49)
          {
            v54 = *a2;
            v55 = 0xA3A0FD5C5F02A3A1 * ((v50 - *a2) >> 2);
            v56 = v55 + 1;
            if (v55 + 1 > 0xA8E83F5717C0A8)
              std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
            v57 = 0xA3A0FD5C5F02A3A1 * ((uint64_t)(v49 - (_QWORD)v54) >> 2);
            if (2 * v57 > v56)
              v56 = 2 * v57;
            if (v57 >= 0x54741FAB8BE054)
              v56 = 0xA8E83F5717C0A8;
            v67 = v56;
            if (v56)
            {
              if (v56 > 0xA8E83F5717C0A8)
                std::__throw_bad_array_new_length[abi:ne180100]();
              v58 = (char *)operator new(388 * v56);
            }
            else
            {
              v58 = 0;
            }
            v65 = v58;
            v59 = &v58[388 * v55];
            memcpy(v59, __s2, 0x184uLL);
            if (v50 == v54)
            {
              v60 = v59;
              v51 = a2;
            }
            else
            {
              v64 = v59;
              do
              {
                v50 -= 388;
                v59 -= 388;
                memcpy(v59, v50, 0x184uLL);
              }
              while (v50 != v54);
              v51 = a2;
              v50 = *a2;
              v60 = v64;
            }
            v52 = v60 + 388;
            *v51 = v59;
            v51[1] = v60 + 388;
            v51[2] = &v65[388 * v67];
            if (v50)
            {
              operator delete(v50);
              v51 = a2;
            }
          }
          else
          {
            memcpy(a2[1], __s2, 0x184uLL);
            v51 = a2;
            v52 = v50 + 388;
          }
          v51[1] = v52;
        }
        v53 = 1;
      }
      operator delete[](v47);
      close(v46);
    }
    if (SHIBYTE(__p[2]) < 0)
      operator delete(__p[0]);
    v32 |= v53;
    v30 += 24;
  }
  while (v30 != v70);
  v29 = v30;
  v30 = v69;
  if (v69)
  {
LABEL_116:
    if (v29 != v30)
    {
      do
      {
        if (*(v29 - 1) < 0)
          operator delete(*((void **)v29 - 3));
        v29 -= 24;
      }
      while (v29 != v30);
      v29 = v69;
    }
    v70 = v30;
    operator delete(v29);
  }
  return v32 & 1;
}

void sub_2129D54D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  void *v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, void *);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  std::vector<std::string>::~vector[abi:ne180100]((void **)va1);
  std::vector<std::string>::~vector[abi:ne180100]((void **)va);
  _Unwind_Resume(a1);
}

void sub_2129D54F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  std::vector<std::string>::~vector[abi:ne180100](&__p);
  std::vector<std::string>::~vector[abi:ne180100](&a16);
  _Unwind_Resume(a1);
}

void sub_2129D5524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  std::vector<std::string>::~vector[abi:ne180100]((void **)va);
  _Unwind_Resume(a1);
}

void sub_2129D5538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  std::vector<std::string>::~vector[abi:ne180100]((void **)va);
  _Unwind_Resume(a1);
}

void sub_2129D554C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0)
  {
    operator delete(__p);
    std::vector<std::string>::~vector[abi:ne180100](&a16);
    _Unwind_Resume(a1);
  }
  JUMPOUT(0x2129D5588);
}

void sub_2129D5574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
    operator delete(__p);
  std::vector<std::string>::~vector[abi:ne180100](&a16);
  _Unwind_Resume(a1);
}

void **std::vector<std::string>::~vector[abi:ne180100](void **a1)
{
  void **v2;
  void **v3;
  void *v4;

  v2 = (void **)*a1;
  if (*a1)
  {
    v3 = (void **)a1[1];
    v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        if (*((char *)v3 - 1) < 0)
          operator delete(*(v3 - 3));
        v3 -= 3;
      }
      while (v3 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24CE6E4E0, MEMORY[0x24BEDAAF0]);
}

void sub_2129D5658(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
  std::__throw_out_of_range[abi:ne180100]();
}

void std::__throw_out_of_range[abi:ne180100]()
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_24CE6E4E8, MEMORY[0x24BEDAB00]);
}

void sub_2129D56F8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, "basic_string");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
}

_QWORD *std::string::__assign_no_alias<true>(_QWORD *__dst, void *__src, size_t __len)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len > 0x16)
  {
    if (__len - 0x7FFFFFFFFFFFFFF7 <= 0x800000000000001ELL)
      std::string::__throw_length_error[abi:ne180100]();
    v7 = 44;
    if (__len > 0x2C)
      v7 = __len;
    v8 = (v7 | 7) + 1;
    v6 = operator new(v8);
    memcpy(v6, __src, __len);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((_BYTE *)__dst + 23) = __len;
    v6 = __dst;
    if (__len)
    {
      memmove(__dst, __src, __len);
      v6 = __dst;
    }
  }
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

void **std::string::__assign_no_alias<false>(void **a1, void *__src, size_t __len)
{
  unint64_t v6;
  uint64_t v7;
  void *v8;
  size_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v13;
  uint64_t v14;

  v6 = (unint64_t)a1[2];
  v7 = v6 & 0x7FFFFFFFFFFFFFFFLL;
  if ((v6 & 0x7FFFFFFFFFFFFFFFLL) > __len)
  {
    v8 = *a1;
    a1[1] = (void *)__len;
    if (__len)
      memmove(v8, __src, __len);
    goto LABEL_12;
  }
  v9 = 0x7FFFFFFFFFFFFFF7;
  if (0x7FFFFFFFFFFFFFF7 - v7 < __len - v7 + 1)
    std::string::__throw_length_error[abi:ne180100]();
  v10 = v7 - 1;
  v11 = a1;
  if ((v6 & 0x8000000000000000) == 0)
  {
    if (v10 > 0x3FFFFFFFFFFFFFF2)
      goto LABEL_7;
LABEL_14:
    v13 = 2 * v10;
    if (__len > 2 * v10)
      v13 = __len;
    v14 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17)
      v14 = v13 | 7;
    if (v13 >= 0x17)
      v9 = v14 + 1;
    else
      v9 = 23;
    v8 = operator new(v9);
    if (!__len)
      goto LABEL_9;
    goto LABEL_8;
  }
  v11 = *a1;
  if (v10 <= 0x3FFFFFFFFFFFFFF2)
    goto LABEL_14;
LABEL_7:
  v8 = operator new(0x7FFFFFFFFFFFFFF7uLL);
  if (__len)
LABEL_8:
    memcpy(v8, __src, __len);
LABEL_9:
  if (v10 != 22)
    operator delete(v11);
  a1[1] = (void *)__len;
  a1[2] = (void *)(v9 | 0x8000000000000000);
  *a1 = v8;
LABEL_12:
  *((_BYTE *)v8 + __len) = 0;
  return a1;
}

void std::basic_regex<char,std::regex_traits<char>>::~basic_regex(std::locale *this)
{
  std::__shared_weak_count *locale;
  unint64_t *p_shared_owners;
  unint64_t v4;

  locale = (std::__shared_weak_count *)this[6].__locale_;
  if (!locale)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&locale->__shared_owners_;
  do
    v4 = __ldaxr(p_shared_owners);
  while (__stlxr(v4 - 1, p_shared_owners));
  if (!v4)
  {
    ((void (*)(std::__shared_weak_count *))locale->__on_zero_shared)(locale);
    std::__shared_weak_count::__release_weak(locale);
    std::locale::~locale(this);
  }
  else
  {
LABEL_5:
    std::locale::~locale(this);
  }
}

uint64_t std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100](uint64_t result)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v1 = result;
  v2 = *(std::__shared_weak_count **)(result + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }
  return result;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char> *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  unsigned int v13;
  std::basic_regex<char> *v14;
  std::basic_regex<char> *v15;
  _QWORD *v16;
  uint64_t v17;
  std::basic_regex<char>::value_type *v19;
  std::basic_regex<char>::value_type *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  std::basic_regex<char> *v32;
  std::basic_regex<char> *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  std::basic_regex<char>::value_type *v43;
  std::basic_regex<char>::value_type *v44;

  v6 = operator new(8uLL);
  *v6 = off_24CE6E600;
  v7 = operator new(0x10uLL);
  v7[1] = v6;
  v8 = operator new(0x20uLL);
  *v8 = off_24CE6E658;
  v8[1] = 0;
  v8[2] = 0;
  v8[3] = v7;
  v9 = *(std::__shared_weak_count **)(a1 + 48);
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  if (!v9)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  do
    v11 = __ldaxr(p_shared_owners);
  while (__stlxr(v11 - 1, p_shared_owners));
  if (v11)
  {
LABEL_5:
    v12 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 56) = v12;
    v13 = *(_DWORD *)(a1 + 24) & 0x1F0;
    if (v13 <= 0x3F)
      goto LABEL_6;
LABEL_11:
    switch(v13)
    {
      case 0x40u:
        return std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, a3);
      case 0x80u:
        v19 = (std::basic_regex<char>::value_type *)memchr(a2, 10, (char *)a3 - a2);
        if (v19)
          v20 = v19;
        else
          v20 = (std::basic_regex<char>::value_type *)a3;
        if (v20 == a2)
        {
          v21 = operator new(0x10uLL);
          v22 = *(_QWORD *)(v12 + 8);
          v21[1] = v22;
          *(_QWORD *)(v12 + 8) = v21;
          *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          if (v20 != (std::basic_regex<char>::value_type *)a3)
            ++v20;
          if (v20 == (std::basic_regex<char>::value_type *)a3)
            return a3;
        }
        else
        {
          std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char> *)a2, v20);
          if (v20 != (std::basic_regex<char>::value_type *)a3)
            ++v20;
          if (v20 == (std::basic_regex<char>::value_type *)a3)
            return a3;
        }
        v34 = *(_QWORD *)(a1 + 56);
        do
        {
          v43 = (std::basic_regex<char>::value_type *)memchr(v20, 10, (char *)a3 - v20);
          if (v43)
            v44 = v43;
          else
            v44 = (std::basic_regex<char>::value_type *)a3;
          if (v44 == v20)
          {
            v35 = operator new(0x10uLL);
            v36 = *(_QWORD *)(v34 + 8);
            v35[1] = v36;
            *(_QWORD *)(v34 + 8) = v35;
            *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          }
          else
          {
            std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char> *)v20, v44);
          }
          v37 = operator new(0x18uLL);
          v38 = *(_QWORD *)(v34 + 8);
          v37[1] = *(_QWORD *)(v12 + 8);
          v37[2] = v38;
          *v37 = &off_24CE6EC18;
          *(_QWORD *)(v12 + 8) = v37;
          *(_QWORD *)(v34 + 8) = 0;
          v39 = operator new(0x10uLL);
          v40 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v39[1] = v40;
          *(_QWORD *)(v34 + 8) = v39;
          *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = 0;
          v41 = operator new(0x10uLL);
          v42 = *(_QWORD *)(v34 + 8);
          *v41 = off_24CE6EC60;
          v41[1] = v42;
          *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v41;
          v34 = *(_QWORD *)(v34 + 8);
          *(_QWORD *)(a1 + 56) = v34;
          if (v44 == (std::basic_regex<char>::value_type *)a3)
            v20 = v44;
          else
            v20 = v44 + 1;
        }
        while (v20 != (std::basic_regex<char>::value_type *)a3);
        break;
      case 0x100u:
        v14 = (std::basic_regex<char> *)memchr(a2, 10, (char *)a3 - a2);
        if (v14)
          v15 = v14;
        else
          v15 = a3;
        if (v15 == (std::basic_regex<char> *)a2)
        {
          v16 = operator new(0x10uLL);
          v17 = *(_QWORD *)(v12 + 8);
          v16[1] = v17;
          *(_QWORD *)(v12 + 8) = v16;
          *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          if (v15 != a3)
            v15 = (std::basic_regex<char> *)((char *)v15 + 1);
          if (v15 == a3)
            return a3;
        }
        else
        {
          std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, v15);
          if (v15 != a3)
            v15 = (std::basic_regex<char> *)((char *)v15 + 1);
          if (v15 == a3)
            return a3;
        }
        v23 = *(_QWORD *)(a1 + 56);
        do
        {
          v32 = (std::basic_regex<char> *)memchr(v15, 10, (char *)a3 - (char *)v15);
          if (v32)
            v33 = v32;
          else
            v33 = a3;
          if (v33 == v15)
          {
            v24 = operator new(0x10uLL);
            v25 = *(_QWORD *)(v23 + 8);
            v24[1] = v25;
            *(_QWORD *)(v23 + 8) = v24;
            *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          }
          else
          {
            std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (std::basic_regex<char>::value_type *)v15, v33);
          }
          v26 = operator new(0x18uLL);
          v27 = *(_QWORD *)(v23 + 8);
          v26[1] = *(_QWORD *)(v12 + 8);
          v26[2] = v27;
          *v26 = &off_24CE6EC18;
          *(_QWORD *)(v12 + 8) = v26;
          *(_QWORD *)(v23 + 8) = 0;
          v28 = operator new(0x10uLL);
          v29 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v28[1] = v29;
          *(_QWORD *)(v23 + 8) = v28;
          *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = 0;
          v30 = operator new(0x10uLL);
          v31 = *(_QWORD *)(v23 + 8);
          *v30 = off_24CE6EC60;
          v30[1] = v31;
          *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v30;
          v23 = *(_QWORD *)(v23 + 8);
          *(_QWORD *)(a1 + 56) = v23;
          if (v33 == a3)
            v15 = v33;
          else
            v15 = (std::basic_regex<char> *)((char *)&v33->__traits_.__loc_.__locale_ + 1);
        }
        while (v15 != a3);
        break;
      default:
        goto LABEL_62;
    }
    return a3;
  }
  ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
  std::__shared_weak_count::__release_weak(v9);
  v12 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 56) = v12;
  v13 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v13 > 0x3F)
    goto LABEL_11;
LABEL_6:
  if (!v13)
    return (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, (char *)a3);
  if (v13 != 16)
  {
    if (v13 != 32)
LABEL_62:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>();
    return std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, a3);
  }
  return (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char> *)a2, (std::basic_regex<char>::value_type *)a3);
}

void sub_2129D5E50(_Unwind_Exception *a1)
{
  void *v1;
  void (__cdecl ***v2)(std::__owns_one_state<char> *__hidden);

  operator delete(v1);
  operator delete(v2);
  (*(void (**)(void *))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sub_2129D5E88(_Unwind_Exception *a1)
{
  void *v1;

  std::__end_state<char>::~__end_state(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BF63C4](exception, 17);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_2129D5EE0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  std::__owns_one_state<char> *end;
  char *v7;
  std::basic_regex<char>::value_type *v8;
  std::__owns_one_state<char> *v9;
  unsigned int marked_count;
  std::basic_regex<char> *v11;
  std::__node<char> *v12;
  std::__owns_one_state<char> *v13;
  std::__node<char> *first;
  std::__node<char> *v15;
  std::__node<char> *v16;
  std::__node<char> *v17;
  std::__node<char> *v18;
  std::__node<char> *v19;
  std::__node<char> *v20;
  std::__owns_one_state<char> *v21;
  std::basic_regex<char>::value_type *v22;
  char *v23;
  std::__owns_one_state<char> *v24;
  unsigned int v25;
  std::basic_regex<char> *v26;
  std::__node<char> *v27;
  std::__owns_one_state<char> *v28;
  std::__node<char> *v29;

  end = a1->__end_;
  v7 = a2;
  while (1)
  {
    v8 = v7;
    v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<std::__wrap_iter<char const*>>((uint64_t)a1, v7, a3);
    if (v8 == v7)
      break;
LABEL_2:
    if (v7 == v8)
      goto LABEL_6;
  }
  v9 = a1->__end_;
  marked_count = a1->__marked_count_;
  v11 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_atom<std::__wrap_iter<char const*>>(a1, v8, a3);
  if (v8 != (std::basic_regex<char>::value_type *)v11)
  {
    v7 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)a1, v11, (std::basic_regex<char> *)a3, v9, marked_count + 1, a1->__marked_count_ + 1);
    goto LABEL_2;
  }
LABEL_6:
  if (v8 != a2)
  {
    if (v8 != a3)
      goto LABEL_14;
    return a3;
  }
  v12 = (std::__node<char> *)operator new(0x10uLL);
  v13 = a1->__end_;
  first = v13->__first_;
  v12[1].__vftable = (std::__node<char>_vtbl *)first;
  v13->__first_ = v12;
  a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
  if (v8 != a3)
  {
LABEL_14:
    if (*v8 != 124)
      return v8;
    v21 = a1->__end_;
    v22 = v8 + 1;
    v23 = v8 + 1;
    while (1)
    {
      v8 = v23;
      v23 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<std::__wrap_iter<char const*>>((uint64_t)a1, v23, a3);
      if (v8 == v23)
      {
        v24 = a1->__end_;
        v25 = a1->__marked_count_;
        v26 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_atom<std::__wrap_iter<char const*>>(a1, v8, a3);
        if (v8 == (std::basic_regex<char>::value_type *)v26)
        {
LABEL_11:
          if (v8 == v22)
          {
            v27 = (std::__node<char> *)operator new(0x10uLL);
            v28 = a1->__end_;
            v29 = v28->__first_;
            v27[1].__vftable = (std::__node<char>_vtbl *)v29;
            v28->__first_ = v27;
            a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
          }
          v15 = (std::__node<char> *)operator new(0x18uLL);
          v16 = v21->__first_;
          v15[1].__vftable = (std::__node<char>_vtbl *)end->__first_;
          v15[2].__vftable = (std::__node<char>_vtbl *)v16;
          v15->__vftable = (std::__node<char>_vtbl *)&off_24CE6EC18;
          end->__first_ = v15;
          v21->__first_ = 0;
          v17 = (std::__node<char> *)operator new(0x10uLL);
          v18 = a1->__end_->__first_;
          v17[1].__vftable = (std::__node<char>_vtbl *)v18;
          v21->__first_ = v17;
          a1->__end_->__first_ = 0;
          v19 = (std::__node<char> *)operator new(0x10uLL);
          v20 = v21->__first_;
          v19->__vftable = (std::__node<char>_vtbl *)off_24CE6EC60;
          v19[1].__vftable = (std::__node<char>_vtbl *)v20;
          a1->__end_->__first_ = v19;
          a1->__end_ = (std::__owns_one_state<char> *)v21->__first_;
          if (v8 == a3)
            return a3;
          goto LABEL_14;
        }
        v23 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)a1, v26, (std::basic_regex<char> *)a3, v24, v25 + 1, a1->__marked_count_ + 1);
      }
      if (v23 == v8)
        goto LABEL_11;
    }
  }
  return a3;
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char> *a2, std::basic_regex<char>::value_type *a3)
{
  std::basic_regex<char> *v3;
  _QWORD *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  std::basic_regex<char>::value_type *v10;
  std::__owns_one_state<char> *v11;
  int v12;
  std::basic_regex<char> *v13;
  _QWORD *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a2;
  if (a2 == (std::basic_regex<char> *)a3)
    return (std::basic_regex<char>::value_type *)a2;
  if (LOBYTE(a2->__traits_.__loc_.__locale_) == 94)
  {
    v6 = operator new(0x18uLL);
    v7 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(v8 + 8);
    *v6 = &off_24CE6E750;
    v6[1] = v9;
    *((_BYTE *)v6 + 16) = v7;
    *(_QWORD *)(v8 + 8) = v6;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v3 = (std::basic_regex<char> *)((char *)v3 + 1);
  }
  if (v3 != (std::basic_regex<char> *)a3)
  {
    while (v3 != (std::basic_regex<char> *)a3)
    {
      v10 = (std::basic_regex<char>::value_type *)v3;
      v11 = *(std::__owns_one_state<char> **)(a1 + 56);
      v12 = *(_DWORD *)(a1 + 28);
      v13 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<std::__wrap_iter<char const*>>(a1, v10, a3);
      if (v10 != (std::basic_regex<char>::value_type *)v13)
      {
        v3 = std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v13, (std::basic_regex<char> *)a3, v11, (v12 + 1), (*(_DWORD *)(a1 + 28) + 1));
        if (v10 != (std::basic_regex<char>::value_type *)v3)
          continue;
      }
      if (v10 + 1 != a3 || *v10 != 36)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
      v14 = operator new(0x18uLL);
      v15 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v16 = *(_QWORD *)(a1 + 56);
      v17 = *(_QWORD *)(v16 + 8);
      *v14 = &off_24CE6E798;
      v14[1] = v17;
      *((_BYTE *)v14 + 16) = v15;
      *(_QWORD *)(v16 + 8) = v14;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      return a3;
    }
  }
  return a3;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char> *a3)
{
  std::__owns_one_state<char> *end;
  std::basic_regex<char> *v7;
  std::basic_regex<char> *v8;
  std::__owns_one_state<char> *v9;
  std::basic_regex<char> *v10;
  std::basic_regex<char> *v11;
  std::__node<char> *v12;
  std::__node<char> *first;
  std::__node<char> *v14;
  std::__node<char> *v15;
  std::__node<char> *v16;
  std::__node<char> *v17;

  end = a1->__end_;
  v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, a2, a3);
  if (v7 == (std::basic_regex<char> *)a2)
    goto LABEL_12;
  do
  {
    v8 = v7;
    v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char>::value_type *)v7, a3);
  }
  while (v8 != v7);
  if (v8 == (std::basic_regex<char> *)a2)
LABEL_12:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  if (v8 == a3)
    return a3;
  while (LOBYTE(v8->__traits_.__loc_.__locale_) == 124)
  {
    v9 = a1->__end_;
    v10 = (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
    v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char>::value_type *)&v8->__traits_.__loc_.__locale_ + 1, a3);
    if ((std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1) == v11)
      goto LABEL_12;
    do
    {
      v8 = v11;
      v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char>::value_type *)v11, a3);
    }
    while (v8 != v11);
    if (v8 == v10)
      goto LABEL_12;
    v12 = (std::__node<char> *)operator new(0x18uLL);
    first = v9->__first_;
    v12[1].__vftable = (std::__node<char>_vtbl *)end->__first_;
    v12[2].__vftable = (std::__node<char>_vtbl *)first;
    v12->__vftable = (std::__node<char>_vtbl *)&off_24CE6EC18;
    end->__first_ = v12;
    v9->__first_ = 0;
    v14 = (std::__node<char> *)operator new(0x10uLL);
    v15 = a1->__end_->__first_;
    v14[1].__vftable = (std::__node<char>_vtbl *)v15;
    v9->__first_ = v14;
    a1->__end_->__first_ = 0;
    v16 = (std::__node<char> *)operator new(0x10uLL);
    v17 = v9->__first_;
    v16->__vftable = (std::__node<char>_vtbl *)off_24CE6EC60;
    v16[1].__vftable = (std::__node<char>_vtbl *)v17;
    a1->__end_->__first_ = v16;
    a1->__end_ = (std::__owns_one_state<char> *)v9->__first_;
    if (v8 == a3)
      return a3;
  }
  return v8;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BF63C4](exception, 14);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_2129D6430(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__end_state<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x80000002129E11B9)
    return a1 + 24;
  if (((v3 & 0x80000002129E11B9 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000002129E11B9))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000002129E11B9 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

void (__cdecl ***std::__empty_state<char>::~__empty_state(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__empty_state<char>::~__empty_state(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

void std::__empty_state<char>::__exec(const std::__empty_state<char> *this, std::__empty_state<char>::__state *a2)
{
  a2->__do_ = -994;
  a2->__node_ = this->__first_;
}

void std::__owns_one_state<char>::~__owns_one_state(std::__owns_one_state<char> *this)
{
  std::__node<char> *first;

  first = this->__first_;
  if (first)
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
}

{
  std::__node<char> *first;

  first = this->__first_;
  if (first)
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
  operator delete(this);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3)
{
  char *v3;
  int v6;
  int v7;
  __int128 v8;
  char *v9;
  unsigned int v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (**v15)();
  int v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  unsigned int marked_count;
  std::basic_regex<char> v23;

  v3 = a2;
  if (a2 == a3)
    return v3;
  v6 = *a2;
  if (v6 > 91)
  {
    if (v6 == 92)
    {
      if (a2 + 1 != a3)
      {
        v17 = a2[1];
        if (v17 == 66)
        {
          v18 = (char *)operator new(0x30uLL);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          *(_QWORD *)v18 = off_24CE6E7E0;
          *((_QWORD *)v18 + 1) = v20;
          std::locale::locale((std::locale *)v18 + 2, (const std::locale *)a1);
          *(_OWORD *)(v18 + 24) = *(_OWORD *)(a1 + 8);
          v18[40] = 1;
        }
        else
        {
          if (v17 != 98)
            return v3;
          v18 = (char *)operator new(0x30uLL);
          v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          *(_QWORD *)v18 = off_24CE6E7E0;
          *((_QWORD *)v18 + 1) = v19;
          std::locale::locale((std::locale *)v18 + 2, (const std::locale *)a1);
          *(_OWORD *)(v18 + 24) = *(_OWORD *)(a1 + 8);
          v18[40] = 0;
        }
        *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v18;
        *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        return v3 + 2;
      }
      return v3;
    }
    if (v6 != 94)
      return v3;
    v11 = operator new(0x18uLL);
    v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v13 = *(_QWORD *)(a1 + 56);
    v14 = *(_QWORD *)(v13 + 8);
    v15 = &off_24CE6E750;
LABEL_17:
    *v11 = v15;
    v11[1] = v14;
    *((_BYTE *)v11 + 16) = v12;
    *(_QWORD *)(v13 + 8) = v11;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    return ++v3;
  }
  if (v6 == 36)
  {
    v11 = operator new(0x18uLL);
    v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v13 = *(_QWORD *)(a1 + 56);
    v14 = *(_QWORD *)(v13 + 8);
    v15 = &off_24CE6E798;
    goto LABEL_17;
  }
  if (v6 != 40 || a2 + 1 == a3 || a2[1] != 63 || a2 + 2 == a3)
    return v3;
  v7 = a2[2];
  if (v7 == 33)
  {
    *(_QWORD *)&v21 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v23.__loop_count_ = v21;
    *(_OWORD *)&v23.__start_.__cntrl_ = v21;
    *(_OWORD *)&v23.__traits_.__loc_.__locale_ = v21;
    *(_OWORD *)&v23.__traits_.__col_ = v21;
    std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]((uint64_t)&v23);
    v23.__flags_ = *(_DWORD *)(a1 + 24);
    v9 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(&v23, v3 + 3, a3);
    marked_count = v23.__marked_count_;
    std::basic_regex<char,std::regex_traits<char>>::__push_lookahead((std::basic_regex<char> *)a1, &v23, 1, *(_DWORD *)(a1 + 28));
    *(_DWORD *)(a1 + 28) += marked_count;
    if (v9 == a3 || *v9 != 41)
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
    goto LABEL_27;
  }
  if (v7 != 61)
    return v3;
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v23.__loop_count_ = v8;
  *(_OWORD *)&v23.__start_.__cntrl_ = v8;
  *(_OWORD *)&v23.__traits_.__loc_.__locale_ = v8;
  *(_OWORD *)&v23.__traits_.__col_ = v8;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]((uint64_t)&v23);
  v23.__flags_ = *(_DWORD *)(a1 + 24);
  v9 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(&v23, v3 + 3, a3);
  v10 = v23.__marked_count_;
  std::basic_regex<char,std::regex_traits<char>>::__push_lookahead((std::basic_regex<char> *)a1, &v23, 0, *(_DWORD *)(a1 + 28));
  *(_DWORD *)(a1 + 28) += v10;
  if (v9 == a3 || *v9 != 41)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
LABEL_27:
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&v23.__traits_.__loc_);
  return v9 + 1;
}

void sub_2129D6904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a9);
  _Unwind_Resume(a1);
}

void sub_2129D6918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a9);
  _Unwind_Resume(a1);
}

void sub_2129D692C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a9);
  _Unwind_Resume(a1);
}

void sub_2129D6940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a9);
  _Unwind_Resume(a1);
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_atom<std::__wrap_iter<char const*>>(std::basic_regex<char> *this, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  std::basic_regex<char>::value_type *v3;
  int v5;
  std::basic_regex<char>::value_type *v7;
  std::__node<char> *v9;
  std::__owns_one_state<char> *v10;
  std::__node<char> *v11;
  std::basic_regex<char>::value_type *v12;
  unsigned __int8 *v13;
  int v14;
  unsigned int v15;
  std::__node<char> *v16;
  unsigned int marked_count;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;
  std::basic_regex<char>::value_type *v20;
  std::__node<char> *v21;
  std::__owns_one_state<char> *v22;
  std::__node<char> *v23;
  int v24;
  std::__owns_one_state<char> *v25;
  unsigned __int8 *v26;
  std::__owns_one_state<char> *v27;
  int v28;

  v3 = a2;
  if (a2 == a3)
    return a2;
  v5 = *a2;
  v7 = a2;
  switch(*a2)
  {
    case '$':
    case ')':
    case ']':
    case '^':
    case '|':
    case '}':
      return v7;
    case '(':
      if (a2 + 1 == a3)
        goto LABEL_57;
      if (a2 + 2 != a3 && a2[1] == 63 && a2[2] == 58)
      {
        ++this->__open_count_;
        v12 = (std::basic_regex<char>::value_type *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(this, a2 + 3, a3);
        if (v12 != a3 && *v12 == 41)
        {
          --this->__open_count_;
          return v12 + 1;
        }
LABEL_57:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      }
      if ((this->__flags_ & 2) != 0)
      {
        marked_count = this->__marked_count_;
      }
      else
      {
        v16 = (std::__node<char> *)operator new(0x18uLL);
        marked_count = this->__marked_count_ + 1;
        this->__marked_count_ = marked_count;
        end = this->__end_;
        first = end->__first_;
        v16->__vftable = (std::__node<char>_vtbl *)&off_24CE6EAB0;
        v16[1].__vftable = (std::__node<char>_vtbl *)first;
        LODWORD(v16[2].__vftable) = marked_count;
        end->__first_ = v16;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      }
      ++this->__open_count_;
      v20 = (std::basic_regex<char>::value_type *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(this, v3 + 1, a3);
      if (v20 == a3)
        goto LABEL_57;
      v3 = v20;
      if (*v20 != 41)
        goto LABEL_57;
      if ((this->__flags_ & 2) == 0)
      {
        v21 = (std::__node<char> *)operator new(0x18uLL);
        v22 = this->__end_;
        v23 = v22->__first_;
        v21->__vftable = (std::__node<char>_vtbl *)&off_24CE6EAF8;
        v21[1].__vftable = (std::__node<char>_vtbl *)v23;
        LODWORD(v21[2].__vftable) = marked_count;
        v22->__first_ = v21;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      }
      --this->__open_count_;
      return v3 + 1;
    case '*':
    case '+':
    case '?':
    case '{':
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>();
    case '.':
      v9 = (std::__node<char> *)operator new(0x10uLL);
      v10 = this->__end_;
      v11 = v10->__first_;
      v9->__vftable = (std::__node<char>_vtbl *)&off_24CE6E870;
      v9[1].__vftable = (std::__node<char>_vtbl *)v11;
      v10->__first_ = v9;
      this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      return v3 + 1;
    case '[':
      return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>((uint64_t)this, a2, a3);
    case '\\':
      v7 = a2;
      if (v5 != 92)
        return v7;
      v13 = (unsigned __int8 *)(a2 + 1);
      if (a2 + 1 == a3)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
      v14 = *v13;
      v15 = v14 - 48;
      if (v14 != 48)
      {
        if ((v14 - 49) <= 8)
        {
          v7 = v3 + 2;
          if (v3 + 2 == a3)
          {
            v7 = a3;
          }
          else
          {
            while (1)
            {
              v24 = *v7;
              if ((v24 - 48) > 9)
                break;
              if (v15 >= 0x19999999)
                goto LABEL_58;
              ++v7;
              v15 = v24 + 10 * v15 - 48;
              if (v7 == a3)
              {
                v7 = a3;
                break;
              }
            }
            if (!v15)
LABEL_58:
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
          }
          if (v15 > this->__marked_count_)
            goto LABEL_58;
          std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(this, v15);
          if (v7 != (std::basic_regex<char>::value_type *)v13)
            return v7;
          LOBYTE(v14) = *v13;
        }
        switch((char)v14)
        {
          case 'D':
            v25 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v25, (uint64_t)this, (uint64_t)this->__end_->__first_, 1, this->__flags_ & 1, (this->__flags_ & 8) != 0);
            goto LABEL_49;
          case 'S':
            v25 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v25, (uint64_t)this, (uint64_t)this->__end_->__first_, 1, this->__flags_ & 1, (this->__flags_ & 8) != 0);
            goto LABEL_53;
          case 'W':
            v27 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v27, (uint64_t)this, (uint64_t)this->__end_->__first_, 1, this->__flags_ & 1, (this->__flags_ & 8) != 0);
            goto LABEL_51;
          case 'd':
            v25 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v25, (uint64_t)this, (uint64_t)this->__end_->__first_, 0, this->__flags_ & 1, (this->__flags_ & 8) != 0);
LABEL_49:
            this->__end_->__first_ = v25;
            this->__end_ = v25;
            v28 = LODWORD(v25[10].__vftable) | 0x400;
            goto LABEL_54;
          case 's':
            v25 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v25, (uint64_t)this, (uint64_t)this->__end_->__first_, 0, this->__flags_ & 1, (this->__flags_ & 8) != 0);
LABEL_53:
            this->__end_->__first_ = v25;
            this->__end_ = v25;
            v28 = LODWORD(v25[10].__vftable) | 0x4000;
LABEL_54:
            LODWORD(v25[10].__vftable) = v28;
            break;
          case 'w':
            v27 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v27, (uint64_t)this, (uint64_t)this->__end_->__first_, 0, this->__flags_ & 1, (this->__flags_ & 8) != 0);
LABEL_51:
            this->__end_->__first_ = v27;
            this->__end_ = v27;
            LODWORD(v27[10].__vftable) |= 0x500u;
            std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v27, 95);
            break;
          default:
            v26 = std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(this, (unsigned __int8 *)v3 + 1, (unsigned __int8 *)a3, 0);
            if (v13 == v26)
              return v3;
            else
              return (std::basic_regex<char>::value_type *)v26;
        }
        return v3 + 2;
      }
      std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v15);
      return v3 + 2;
    default:
      std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v5);
      return v3 + 1;
  }
}

void sub_2129D6E54(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_2129D6E68(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_2129D6E7C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_2129D6E90(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_2129D6EA4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_2129D6EB8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::__owns_one_state<char> *a4, size_t __mexp_begin, size_t __mexp_end)
{
  int v6;
  int locale_low;
  std::basic_regex<char> *v8;
  std::basic_regex<char> *v9;
  char *v10;
  size_t v11;
  char *v13;
  int v14;
  int v15;
  char *v16;
  int v17;
  int v18;
  std::basic_regex<char> *v19;
  unsigned __int8 *v20;
  BOOL v21;
  std::basic_regex<char> *v22;
  BOOL v23;
  char *v24;
  size_t v25;
  std::basic_regex<char> *v26;
  int v27;
  int v28;
  std::basic_regex<char> *v29;
  int v30;
  std::basic_regex<char> *v31;
  _BYTE *v32;

  if (this == a3)
    return this;
  v6 = *(_DWORD *)(a1 + 24) & 0x1F0;
  locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
  if (locale_low <= 62)
  {
    if (locale_low == 42)
    {
      v9 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      if (v6)
        v21 = 1;
      else
        v21 = v9 == a3;
      if (!v21 && LOBYTE(v9->__traits_.__loc_.__locale_) == 63)
      {
        v10 = (char *)&this->__traits_.__loc_.__locale_ + 2;
        __mexp_begin = __mexp_begin;
        __mexp_end = __mexp_end;
        v11 = 0;
        goto LABEL_36;
      }
      __mexp_begin = __mexp_begin;
      __mexp_end = __mexp_end;
      v25 = 0;
      goto LABEL_45;
    }
    v8 = this;
    if (locale_low == 43)
    {
      v9 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      if (!v6 && v9 != a3 && LOBYTE(v9->__traits_.__loc_.__locale_) == 63)
      {
        v10 = (char *)&this->__traits_.__loc_.__locale_ + 2;
        __mexp_begin = __mexp_begin;
        __mexp_end = __mexp_end;
        v11 = 1;
LABEL_36:
        std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v11, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 0);
        return (std::basic_regex<char> *)v10;
      }
      __mexp_begin = __mexp_begin;
      __mexp_end = __mexp_end;
      v25 = 1;
      goto LABEL_45;
    }
    return v8;
  }
  if (locale_low == 63)
  {
    v22 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
    if (v6)
      v23 = 1;
    else
      v23 = v22 == a3;
    if (v23 || LOBYTE(v22->__traits_.__loc_.__locale_) != 63)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, 0, 1uLL, a4, __mexp_begin, __mexp_end, 1);
      return v22;
    }
    else
    {
      v24 = (char *)&this->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, 0, 1uLL, a4, __mexp_begin, __mexp_end, 0);
      return (std::basic_regex<char> *)v24;
    }
  }
  else
  {
    v8 = this;
    if (locale_low != 123)
      return v8;
    v13 = (char *)&this->__traits_.__loc_.__locale_ + 1;
    if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3)
      goto LABEL_72;
    v14 = *v13;
    if ((v14 & 0xF8) != 0x30 && (v14 & 0xFE) != 0x38)
      goto LABEL_72;
    v15 = v14 - 48;
    v16 = (char *)&this->__traits_.__loc_.__locale_ + 2;
    if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 2) == a3)
    {
LABEL_21:
      v16 = (char *)a3;
    }
    else
    {
      while (1)
      {
        v17 = *v16;
        if ((v17 & 0xF8) != 0x30 && (v17 & 0xFE) != 0x38)
          break;
        if (v15 >= 214748364)
          goto LABEL_72;
        v15 = v17 + 10 * v15 - 48;
        if (++v16 == (char *)a3)
          goto LABEL_21;
      }
    }
    if (v16 == v13)
      goto LABEL_72;
    if (v16 == (char *)a3)
      goto LABEL_73;
    v18 = *v16;
    if (v18 != 44)
    {
      if (v18 == 125)
      {
        v19 = (std::basic_regex<char> *)(v16 + 1);
        if (v6 || v19 == a3 || LOBYTE(v19->__traits_.__loc_.__locale_) != 63)
        {
          std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v15, v15, a4, __mexp_begin, __mexp_end, 1);
          return v19;
        }
        else
        {
          v20 = (unsigned __int8 *)(v16 + 2);
          std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v15, v15, a4, __mexp_begin, __mexp_end, 0);
          return (std::basic_regex<char> *)v20;
        }
      }
LABEL_72:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
    }
    v26 = (std::basic_regex<char> *)(v16 + 1);
    if (v16 + 1 == (char *)a3)
      goto LABEL_72;
    v27 = LOBYTE(v26->__traits_.__loc_.__locale_);
    if (v27 == 125)
    {
      v9 = (std::basic_regex<char> *)(v16 + 2);
      if (!v6 && v9 != a3 && LOBYTE(v9->__traits_.__loc_.__locale_) == 63)
      {
        v11 = v15;
        v10 = v16 + 3;
        __mexp_begin = __mexp_begin;
        __mexp_end = __mexp_end;
        goto LABEL_36;
      }
      v25 = v15;
      __mexp_begin = __mexp_begin;
      __mexp_end = __mexp_end;
LABEL_45:
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v25, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
      return v9;
    }
    if ((v27 & 0xF8) != 0x30 && (v27 & 0xFE) != 0x38)
      goto LABEL_73;
    v28 = v27 - 48;
    v29 = (std::basic_regex<char> *)(v16 + 2);
    if (v29 == a3)
    {
LABEL_61:
      v29 = a3;
    }
    else
    {
      while (1)
      {
        v30 = LOBYTE(v29->__traits_.__loc_.__locale_);
        if ((v30 & 0xF8) != 0x30 && (v30 & 0xFE) != 0x38)
          break;
        if (v28 >= 214748364)
          goto LABEL_72;
        v28 = v30 + 10 * v28 - 48;
        v29 = (std::basic_regex<char> *)((char *)v29 + 1);
        if (v29 == a3)
          goto LABEL_61;
      }
    }
    if (v29 == v26 || v29 == a3 || LOBYTE(v29->__traits_.__loc_.__locale_) != 125)
LABEL_73:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    if (v28 < v15)
      goto LABEL_72;
    v31 = (std::basic_regex<char> *)((char *)&v29->__traits_.__loc_.__locale_ + 1);
    if (v6 || v31 == a3 || LOBYTE(v31->__traits_.__loc_.__locale_) != 63)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v15, v28, a4, __mexp_begin, __mexp_end, 1);
      return v31;
    }
    else
    {
      v32 = (char *)&v29->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v15, v28, a4, __mexp_begin, __mexp_end, 0);
      return (std::basic_regex<char> *)v32;
    }
  }
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100](uint64_t a1)
{
  const std::locale *v2;

  v2 = (const std::locale *)MEMORY[0x212BF6424]();
  *(_QWORD *)(a1 + 8) = std::locale::use_facet(v2, MEMORY[0x24BEDB350]);
  *(_QWORD *)(a1 + 16) = std::locale::use_facet((const std::locale *)a1, MEMORY[0x24BEDB4B0]);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  return a1;
}

void sub_2129D7320(_Unwind_Exception *a1)
{
  std::locale *v1;

  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(std::basic_regex<char> *this, const std::basic_regex<char> *a2, BOOL a3, unsigned int a4)
{
  char *v8;
  std::__node<char> *first;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v12;

  v8 = (char *)operator new(0x58uLL);
  first = this->__end_->__first_;
  *(_QWORD *)v8 = off_24CE6E828;
  *((_QWORD *)v8 + 1) = first;
  std::locale::locale((std::locale *)v8 + 2, &a2->__traits_.__loc_);
  *(_OWORD *)(v8 + 24) = *(_OWORD *)&a2->__traits_.__ct_;
  *(_OWORD *)(v8 + 40) = *(_OWORD *)&a2->__flags_;
  cntrl = a2->__start_.__cntrl_;
  *((_QWORD *)v8 + 7) = a2->__start_.__ptr_;
  *((_QWORD *)v8 + 8) = cntrl;
  if (cntrl)
  {
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  *((_QWORD *)v8 + 9) = a2->__end_;
  *((_DWORD *)v8 + 20) = a4;
  v8[84] = a3;
  this->__end_->__first_ = (std::__node<char> *)v8;
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BF63C4](exception, 6);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_2129D7420(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

uint64_t std::__l_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  int v2;

  if (!*(_BYTE *)(a2 + 92))
  {
    if (!*(_BYTE *)(result + 16))
      goto LABEL_12;
    v2 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 16) - 1);
    if (v2 != 13 && v2 != 10)
      goto LABEL_12;
LABEL_11:
    *(_DWORD *)a2 = -994;
    *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
    return result;
  }
  if (*(_QWORD *)(a2 + 16) == *(_QWORD *)(a2 + 8) && (*(_BYTE *)(a2 + 88) & 1) == 0)
    goto LABEL_11;
LABEL_12:
  *(_DWORD *)a2 = -993;
  *(_QWORD *)(a2 + 80) = 0;
  return result;
}

void (__cdecl ***std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

uint64_t std::__r_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  int v3;
  BOOL v4;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(_BYTE *)(a2 + 88) & 2) == 0
    || *(_BYTE *)(result + 16) && ((v3 = *v2, v3 != 13) ? (v4 = v3 == 10) : (v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  }
  else
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
  }
  return result;
}

std::locale *std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_24CE6E7E0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_24CE6E7E0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete(a1);
}

uint64_t std::__word_boundary<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v2 = *(unsigned __int8 **)(a2 + 8);
  v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3)
    goto LABEL_19;
  v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 != v3)
  {
    if (v4 == v2)
    {
      v5 = *(_DWORD *)(a2 + 88);
      if ((v5 & 0x80) == 0)
      {
        if ((v5 & 4) == 0)
        {
          v6 = *v2;
          if (v6 == 95)
            goto LABEL_17;
          goto LABEL_15;
        }
        goto LABEL_19;
      }
    }
    v7 = *(v4 - 1);
    v8 = *v4;
    if (v7 == 95
      || (v7 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v7) & 0x500) != 0)
    {
      v9 = 1;
      if ((_DWORD)v8 == 95)
        goto LABEL_24;
    }
    else
    {
      v9 = 0;
      if ((_DWORD)v8 == 95)
        goto LABEL_24;
    }
    if ((v8 & 0x80) != 0 || (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v8) & 0x500) == 0)
    {
      if (*(_BYTE *)(result + 40) == (v9 != 0))
        goto LABEL_20;
      goto LABEL_27;
    }
LABEL_24:
    if (*(_BYTE *)(result + 40) != (v9 != 1))
      goto LABEL_27;
    goto LABEL_20;
  }
  if ((*(_BYTE *)(a2 + 88) & 8) == 0)
  {
    v6 = *(v3 - 1);
    if (v6 == 95)
      goto LABEL_17;
LABEL_15:
    if ((v6 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v6) & 0x500) != 0)
    {
LABEL_17:
      if (*(_BYTE *)(result + 40) != 1)
        goto LABEL_27;
LABEL_20:
      *(_DWORD *)a2 = -993;
      *(_QWORD *)(a2 + 80) = 0;
      return result;
    }
  }
LABEL_19:
  if (!*(_BYTE *)(result + 40))
    goto LABEL_20;
LABEL_27:
  v10 = *(_QWORD *)(result + 8);
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = v10;
  return result;
}

void (__cdecl ***std::__lookahead<char,std::regex_traits<char>>::~__lookahead(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  std::locale *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  void (__cdecl **v6)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))off_24CE6E828;
  v2 = (std::locale *)(a1 + 2);
  v3 = (std::__shared_weak_count *)a1[8];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  std::locale::~locale(v2);
  v6 = a1[1];
  if (v6)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v6 + 1))(v6);
  return a1;
}

void std::__lookahead<char,std::regex_traits<char>>::~__lookahead(std::locale *a1)
{
  std::locale *v2;
  std::__shared_weak_count *locale;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::locale::__imp *v6;

  a1->__locale_ = (std::locale::__imp *)off_24CE6E828;
  v2 = a1 + 2;
  locale = (std::__shared_weak_count *)a1[8].__locale_;
  if (locale)
  {
    p_shared_owners = (unint64_t *)&locale->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))locale->__on_zero_shared)(locale);
      std::__shared_weak_count::__release_weak(locale);
    }
  }
  std::locale::~locale(v2);
  v6 = a1[1].__locale_;
  if (v6)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v6 + 8))(v6);
  operator delete(a1);
}

void std::__lookahead<char,std::regex_traits<char>>::__exec(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  std::vector<std::csub_match>::size_type v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  char v9;
  std::vector<std::csub_match>::pointer begin;
  unint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  std::sub_match<const char *> *v16;
  uint64_t v17;
  std::vector<std::csub_match> __p;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  unint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20 = 0xAAAAAAAAAAAAAAAALL;
  v22 = 0xAAAAAAAAAAAAAA00;
  v24 = v4;
  v21 = 0;
  v23 = 0uLL;
  LOBYTE(v24) = 0;
  BYTE8(v24) = 0;
  v25 = 0;
  memset(&__p, 0, sizeof(__p));
  v5 = (*(_DWORD *)(a1 + 44) + 1);
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)&v19 = *(_QWORD *)(a2 + 24);
  *((_QWORD *)&v19 + 1) = v19;
  LOBYTE(v20) = 0;
  std::vector<std::sub_match<char const*>>::assign(&__p, v5, (std::vector<std::csub_match>::const_reference)&v19);
  *((_QWORD *)&v20 + 1) = v6;
  v21 = v6;
  LOBYTE(v22) = 0;
  v23 = v19;
  LOBYTE(v24) = v20;
  v25 = v6;
  BYTE8(v24) = 1;
  v7 = *(_QWORD *)(a2 + 16);
  if (*(_BYTE *)(a2 + 92))
    v8 = v7 == *(_QWORD *)(a2 + 8);
  else
    v8 = 0;
  v9 = v8;
  if (*(unsigned __int8 *)(a1 + 84) == std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1 + 16, v7, *(const char **)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v9))
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
    begin = __p.__begin_;
    goto LABEL_13;
  }
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(a1 + 8);
  begin = __p.__begin_;
  v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)__p.__end_ - (char *)__p.__begin_) >> 3);
  if (v11 < 2)
  {
LABEL_13:
    if (!begin)
      return;
    goto LABEL_14;
  }
  v12 = 0;
  v13 = *(_DWORD *)(a1 + 80);
  v14 = *(_QWORD *)(a2 + 32);
  v15 = 1;
  do
  {
    v16 = &begin[v15];
    v17 = v14 + 24 * (v13 + v12);
    *(std::pair<const char *, const char *> *)v17 = v16->std::pair<const char *, const char *>;
    *(_BYTE *)(v17 + 16) = v16->matched;
    v15 = (v12 + 2);
    ++v12;
  }
  while (v11 > v15);
LABEL_14:
  operator delete(begin);
}

void sub_2129D7A90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(uint64_t a1, uint64_t a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  signed int v20;
  unsigned int v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  void *v26;
  void *v27;
  __int128 v28;
  char *v29;
  __int128 v30;
  uint64_t v31;
  char *i;
  void *v33;
  void *v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  _BYTE *v40;
  unsigned int v41;
  uint64_t v42;
  char v43;
  _BYTE v45[96];
  std::vector<std::csub_match>::value_type __x;
  char *v47;
  char *v48;
  unint64_t v49;

  v47 = 0;
  v48 = 0;
  v49 = 0;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    __x.second = a3;
    *(_QWORD *)&__x.matched = 0xAAAAAAAAAAAAAA00;
    __x.first = a3;
    *(_DWORD *)v45 = 0;
    memset(&v45[8], 0, 85);
    v13 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v47, (uint64_t)v45);
    v48 = v13;
    if (*(_QWORD *)&v45[56])
      operator delete(*(void **)&v45[56]);
    if (*(_QWORD *)&v45[32])
      operator delete(*(void **)&v45[32]);
    v14 = *((_QWORD *)v13 - 8);
    *((_DWORD *)v13 - 24) = 0;
    *((_QWORD *)v13 - 11) = a2;
    *((_QWORD *)v13 - 10) = a2;
    *((_QWORD *)v13 - 9) = a3;
    v15 = *(unsigned int *)(a1 + 28);
    v16 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v13 - 7) - v14) >> 3);
    if (v15 <= v16)
    {
      if (v15 < v16)
        *((_QWORD *)v13 - 7) = v14 + 24 * v15;
    }
    else
    {
      std::vector<std::sub_match<char const*>>::__append((std::vector<std::csub_match> *)(v13 - 64), v15 - v16, &__x);
    }
    v17 = *((_QWORD *)v13 - 5);
    v18 = *(unsigned int *)(a1 + 32);
    v19 = (*((_QWORD *)v13 - 4) - v17) >> 4;
    if (v18 <= v19)
    {
      if (v18 < v19)
        *((_QWORD *)v13 - 4) = v17 + 16 * v18;
    }
    else
    {
      std::vector<std::pair<unsigned long,char const*>>::__append((std::vector<std::pair<unsigned long, const char *>> *)(v13 - 40), v18 - v19);
    }
    *((_QWORD *)v13 - 2) = v6;
    *((_DWORD *)v13 - 2) = a5;
    *(v13 - 4) = a6;
    v20 = (_DWORD)a3 - a2;
    v21 = 1;
    while (2)
    {
      if ((v21 & 0xFFF) == 0 && (int)(v21 >> 12) >= v20)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
      v23 = *((_QWORD *)v13 - 2);
      if (v23)
        (*(void (**)(uint64_t, char *))(*(_QWORD *)v23 + 16))(v23, v13 - 96);
      switch(*((_DWORD *)v13 - 24))
      {
        case 0xFFFFFC18:
          v24 = *((_QWORD *)v13 - 10);
          if ((a5 & 0x20) != 0 && v24 == a2)
            goto LABEL_24;
          v36 = *a4;
          *(_QWORD *)v36 = a2;
          *(_QWORD *)(v36 + 8) = v24;
          *(_BYTE *)(v36 + 16) = 1;
          v37 = *((_QWORD *)v13 - 8);
          v38 = *((_QWORD *)v13 - 7) - v37;
          if (v38)
          {
            v39 = 0xAAAAAAAAAAAAAAABLL * (v38 >> 3);
            v40 = (_BYTE *)(v37 + 16);
            v41 = 1;
            do
            {
              v42 = v36 + 24 * v41;
              *(_OWORD *)v42 = *((_OWORD *)v40 - 1);
              v43 = *v40;
              v40 += 24;
              *(_BYTE *)(v42 + 16) = v43;
            }
            while (v39 > v41++);
          }
          v6 = 1;
          v22 = v47;
          if (!v47)
            return v6;
          goto LABEL_35;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_16;
        case 0xFFFFFC1F:
LABEL_24:
          v25 = v48;
          v26 = (void *)*((_QWORD *)v48 - 5);
          if (v26)
          {
            *((_QWORD *)v48 - 4) = v26;
            operator delete(v26);
          }
          v27 = (void *)*((_QWORD *)v25 - 8);
          if (v27)
          {
            *((_QWORD *)v25 - 7) = v27;
            operator delete(v27);
          }
          v48 = v25 - 96;
          goto LABEL_16;
        case 0xFFFFFC20:
          *(_QWORD *)&v28 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)&v45[64] = v28;
          *(_OWORD *)&v45[80] = v28;
          *(_OWORD *)&v45[32] = v28;
          *(_OWORD *)&v45[48] = v28;
          *(_OWORD *)v45 = v28;
          *(_OWORD *)&v45[16] = v28;
          std::__state<char>::__state((uint64_t)v45, (__int128 *)v13 - 6);
          (*(void (**)(_QWORD, uint64_t, char *))(**((_QWORD **)v13 - 2) + 24))(*((_QWORD *)v13 - 2), 1, v13 - 96);
          (*(void (**)(_QWORD, _QWORD, _BYTE *))(**(_QWORD **)&v45[80] + 24))(*(_QWORD *)&v45[80], 0, v45);
          v29 = v48;
          if ((unint64_t)v48 >= v49)
          {
            v48 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v47, (uint64_t)v45);
            if (*(_QWORD *)&v45[56])
            {
              *(_QWORD *)&v45[64] = *(_QWORD *)&v45[56];
              operator delete(*(void **)&v45[56]);
            }
          }
          else
          {
            v30 = *(_OWORD *)&v45[16];
            *(_OWORD *)v48 = *(_OWORD *)v45;
            *((_OWORD *)v29 + 1) = v30;
            *((_QWORD *)v29 + 4) = 0;
            *((_QWORD *)v29 + 5) = 0;
            *((_QWORD *)v29 + 6) = 0;
            *((_QWORD *)v29 + 7) = 0;
            *((_OWORD *)v29 + 2) = *(_OWORD *)&v45[32];
            *((_QWORD *)v29 + 6) = *(_QWORD *)&v45[48];
            memset(&v45[32], 0, 24);
            *((_QWORD *)v29 + 8) = 0;
            *((_QWORD *)v29 + 9) = 0;
            *(_OWORD *)(v29 + 56) = *(_OWORD *)&v45[56];
            *((_QWORD *)v29 + 9) = *(_QWORD *)&v45[72];
            memset(&v45[56], 0, 24);
            v31 = *(_QWORD *)&v45[80];
            *(_QWORD *)(v29 + 85) = *(_QWORD *)&v45[85];
            *((_QWORD *)v29 + 10) = v31;
            v48 = v29 + 96;
          }
          if (*(_QWORD *)&v45[32])
          {
            *(_QWORD *)&v45[40] = *(_QWORD *)&v45[32];
            operator delete(*(void **)&v45[32]);
          }
LABEL_16:
          v22 = v47;
          v13 = v48;
          ++v21;
          if (v47 != v48)
            continue;
          v6 = 0;
          if (v47)
          {
LABEL_35:
            for (i = v48; i != v22; i -= 96)
            {
              v33 = (void *)*((_QWORD *)i - 5);
              if (v33)
              {
                *((_QWORD *)i - 4) = v33;
                operator delete(v33);
              }
              v34 = (void *)*((_QWORD *)i - 8);
              if (v34)
              {
                *((_QWORD *)i - 7) = v34;
                operator delete(v34);
              }
            }
            operator delete(v22);
          }
          break;
        default:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
      }
      break;
    }
  }
  return v6;
}

void sub_2129D7E80(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_2129D7E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, a3);
  std::__state<char>::~__state((uint64_t *)va);
  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_2129D7EDC(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_2129D7EF0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v1 - 112));
  _Unwind_Resume(a1);
}

void std::vector<std::sub_match<char const*>>::assign(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __u)
{
  std::sub_match<const char *> *value;
  std::sub_match<const char *> *begin;
  unint64_t v8;
  std::vector<std::csub_match>::size_type v9;
  unint64_t v10;
  uint64_t v11;
  std::sub_match<const char *> *v12;
  std::vector<std::csub_match>::size_type v13;
  std::sub_match<const char *> *v14;
  std::vector<std::csub_match>::pointer end;
  unint64_t v16;
  std::vector<std::csub_match>::size_type v17;
  std::vector<std::csub_match>::value_type *v18;
  std::sub_match<const char *> *v19;
  std::vector<std::csub_match>::size_type v20;
  std::pair<const char *, const char *> v21;

  value = this->__end_cap_.__value_;
  begin = this->__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)begin) >> 3) < __n)
  {
    if (begin)
    {
      this->__end_ = begin;
      operator delete(begin);
      value = 0;
      this->__begin_ = 0;
      this->__end_ = 0;
      this->__end_cap_.__value_ = 0;
    }
    if (__n > 0xAAAAAAAAAAAAAAALL)
      goto LABEL_26;
    v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)value >> 3);
    v9 = 2 * v8;
    if (2 * v8 <= __n)
      v9 = __n;
    v10 = v8 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v9;
    if (v10 > 0xAAAAAAAAAAAAAAALL)
LABEL_26:
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    v11 = v10;
    v12 = (std::sub_match<const char *> *)operator new(24 * v10);
    this->__begin_ = v12;
    this->__end_ = v12;
    this->__end_cap_.__value_ = &v12[v11];
    v13 = 24 * __n;
    v14 = &v12[__n];
    do
    {
      v12->std::pair<const char *, const char *> = __u->std::pair<const char *, const char *>;
      *(_QWORD *)&v12->matched = *(_QWORD *)&__u->matched;
      ++v12;
      v13 -= 24;
    }
    while (v13);
    goto LABEL_25;
  }
  end = this->__end_;
  v16 = end - begin;
  if (v16 >= __n)
    v17 = __n;
  else
    v17 = end - begin;
  if (v17)
  {
    v18 = begin;
    do
    {
      *v18++ = *__u;
      --v17;
    }
    while (v17);
  }
  if (__n <= v16)
  {
    v14 = &begin[__n];
LABEL_25:
    this->__end_ = v14;
    return;
  }
  v19 = &end[__n - v16];
  v20 = 24 * __n - 24 * v16;
  do
  {
    v21 = __u->std::pair<const char *, const char *>;
    *(_QWORD *)&end->matched = *(_QWORD *)&__u->matched;
    end->std::pair<const char *, const char *> = v21;
    ++end;
    v20 -= 24;
  }
  while (v20);
  this->__end_ = v19;
}

void std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

_QWORD *std::__state<char>::~__state(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
  return a1;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BF63C4](exception, 12);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_2129D8124(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BF63C4](exception, 16);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_2129D8170(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void **std::vector<std::__state<char>>::~vector[abi:ne180100](void **a1)
{
  char *v2;
  char *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (char *)*a1;
  if (*a1)
  {
    v3 = (char *)a1[1];
    v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        v5 = (void *)*((_QWORD *)v3 - 5);
        if (v5)
        {
          *((_QWORD *)v3 - 4) = v5;
          operator delete(v5);
        }
        v6 = (void *)*((_QWORD *)v3 - 8);
        if (v6)
        {
          *((_QWORD *)v3 - 7) = v6;
          operator delete(v6);
        }
        v3 -= 96;
      }
      while (v3 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

char *std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>(void **a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v6;
  char *v7;
  __int128 v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  __int128 v19;
  uint64_t v20;
  char *v21;
  void *v22;
  void *v23;

  v2 = 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[1] - (_BYTE *)*a1) >> 5);
  v3 = v2 + 1;
  if (v2 + 1 > 0x2AAAAAAAAAAAAAALL)
    std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
  if (0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 5) > v3)
    v3 = 0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 5);
  if (0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 5) >= 0x155555555555555)
    v6 = 0x2AAAAAAAAAAAAAALL;
  else
    v6 = v3;
  if (v6)
  {
    if (v6 > 0x2AAAAAAAAAAAAAALL)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v7 = (char *)operator new(96 * v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = *(_OWORD *)(a2 + 16);
  v9 = &v7[96 * v2];
  *(_OWORD *)v9 = *(_OWORD *)a2;
  *((_OWORD *)v9 + 1) = v8;
  v10 = &v7[96 * v6];
  *((_OWORD *)v9 + 2) = *(_OWORD *)(a2 + 32);
  *((_QWORD *)v9 + 6) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(v9 + 85) = *(_QWORD *)(a2 + 85);
  v11 = *(_QWORD *)(a2 + 72);
  v12 = *(_QWORD *)(a2 + 80);
  *((_QWORD *)v9 + 9) = 0;
  *((_QWORD *)v9 + 10) = v12;
  *(_OWORD *)(v9 + 56) = *(_OWORD *)(a2 + 56);
  *((_QWORD *)v9 + 9) = v11;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  v13 = v9 + 96;
  v14 = (char *)*a1;
  v15 = (char *)a1[1];
  if (v15 == *a1)
  {
    *a1 = v9;
    a1[1] = v13;
    a1[2] = v10;
  }
  else
  {
    v16 = 0;
    do
    {
      v17 = &v9[v16];
      v18 = &v15[v16];
      v19 = *(_OWORD *)&v15[v16 - 80];
      *((_OWORD *)v17 - 6) = *(_OWORD *)&v15[v16 - 96];
      *((_OWORD *)v17 - 5) = v19;
      *((_QWORD *)v17 - 7) = 0;
      *((_QWORD *)v17 - 6) = 0;
      *((_OWORD *)v17 - 4) = *(_OWORD *)&v15[v16 - 64];
      *((_QWORD *)v17 - 6) = *(_QWORD *)&v15[v16 - 48];
      *((_QWORD *)v18 - 8) = 0;
      *((_QWORD *)v18 - 7) = 0;
      *((_QWORD *)v18 - 6) = 0;
      *((_QWORD *)v17 - 4) = 0;
      *((_QWORD *)v17 - 3) = 0;
      *(_OWORD *)(v17 - 40) = *(_OWORD *)&v15[v16 - 40];
      *((_QWORD *)v17 - 3) = *(_QWORD *)&v15[v16 - 24];
      *((_QWORD *)v18 - 5) = 0;
      *((_QWORD *)v18 - 4) = 0;
      *((_QWORD *)v18 - 3) = 0;
      v20 = *(_QWORD *)&v15[v16 - 16];
      *(_QWORD *)(v17 - 11) = *(_QWORD *)&v15[v16 - 11];
      *((_QWORD *)v17 - 2) = v20;
      v16 -= 96;
    }
    while (&v15[v16] != v14);
    v15 = (char *)*a1;
    v21 = (char *)a1[1];
    *a1 = &v9[v16];
    a1[1] = v13;
    a1[2] = v10;
    while (v21 != v15)
    {
      v22 = (void *)*((_QWORD *)v21 - 5);
      if (v22)
      {
        *((_QWORD *)v21 - 4) = v22;
        operator delete(v22);
      }
      v23 = (void *)*((_QWORD *)v21 - 8);
      if (v23)
      {
        *((_QWORD *)v21 - 7) = v23;
        operator delete(v23);
      }
      v21 -= 96;
    }
  }
  if (v15)
    operator delete(v15);
  return v13;
}

void std::vector<std::sub_match<char const*>>::__append(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __x)
{
  std::sub_match<const char *> *value;
  std::vector<std::csub_match>::pointer end;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  std::sub_match<const char *> *v13;
  std::vector<std::csub_match>::size_type v14;
  std::pair<const char *, const char *> v15;
  std::sub_match<const char *> *v16;
  std::vector<std::csub_match>::size_type v17;
  std::sub_match<const char *> *v18;
  std::pair<const char *, const char *> *v19;
  std::pair<const char *, const char *> v20;
  std::vector<std::csub_match>::pointer begin;
  std::pair<const char *, const char *> v22;

  end = this->__end_;
  value = this->__end_cap_.__value_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)end) >> 3) >= __n)
  {
    if (__n)
    {
      v13 = &end[__n];
      v14 = 24 * __n;
      do
      {
        v15 = __x->std::pair<const char *, const char *>;
        *(_QWORD *)&end->matched = *(_QWORD *)&__x->matched;
        end->std::pair<const char *, const char *> = v15;
        ++end;
        v14 -= 24;
      }
      while (v14);
      end = v13;
    }
    this->__end_ = end;
  }
  else
  {
    v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)this->__begin_) >> 3);
    v9 = v8 + __n;
    if (v8 + __n > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)this->__begin_) >> 3);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v9;
    if (v11)
    {
      if (v11 > 0xAAAAAAAAAAAAAAALL)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v12 = (char *)operator new(24 * v11);
    }
    else
    {
      v12 = 0;
    }
    v16 = (std::sub_match<const char *> *)&v12[24 * v8];
    v17 = 24 * __n;
    v18 = &v16[__n];
    v19 = v16;
    do
    {
      v20 = __x->std::pair<const char *, const char *>;
      v19[1].first = *(const char **)&__x->matched;
      *v19 = v20;
      v19 = (std::pair<const char *, const char *> *)((char *)v19 + 24);
      v17 -= 24;
    }
    while (v17);
    begin = this->__begin_;
    if (end != this->__begin_)
    {
      do
      {
        v22 = end[-1].std::pair<const char *, const char *>;
        *(_QWORD *)&v16[-1].matched = *(_QWORD *)&end[-1].matched;
        v16[-1].std::pair<const char *, const char *> = v22;
        --v16;
        --end;
      }
      while (end != begin);
      end = this->__begin_;
    }
    this->__begin_ = v16;
    this->__end_ = v18;
    this->__end_cap_.__value_ = (std::sub_match<const char *> *)&v12[24 * v11];
    if (end)
      operator delete(end);
  }
}

void std::vector<std::pair<unsigned long,char const*>>::__append(std::vector<std::pair<unsigned long, const char *>> *this, std::vector<std::pair<unsigned long, const char *>>::size_type __n)
{
  std::pair<unsigned long, const char *> *value;
  std::pair<unsigned long, const char *> *end;
  std::vector<std::pair<unsigned long, const char *>>::pointer begin;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  std::vector<std::pair<unsigned long, const char *>>::size_type v12;
  std::pair<unsigned long, const char *> *v13;
  size_t v14;
  std::pair<unsigned long, const char *> *v15;
  std::pair<unsigned long, const char *> *v16;

  end = this->__end_;
  value = this->__end_cap_.__value_;
  if (__n <= value - end)
  {
    if (__n)
    {
      v12 = 16 * __n;
      bzero(this->__end_, 16 * __n);
      end = (std::pair<unsigned long, const char *> *)((char *)end + v12);
    }
    this->__end_ = end;
  }
  else
  {
    begin = this->__begin_;
    v7 = end - this->__begin_;
    v8 = v7 + __n;
    if ((v7 + __n) >> 60)
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    v9 = (char *)value - (char *)begin;
    if (v9 >> 3 > v8)
      v8 = v9 >> 3;
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF0)
      v10 = 0xFFFFFFFFFFFFFFFLL;
    else
      v10 = v8;
    if (v10)
    {
      if (v10 >> 60)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v11 = (char *)operator new(16 * v10);
    }
    else
    {
      v11 = 0;
    }
    v13 = (std::pair<unsigned long, const char *> *)&v11[16 * v7];
    v14 = __n;
    v15 = (std::pair<unsigned long, const char *> *)&v11[16 * v10];
    bzero(v13, v14 * 16);
    v16 = &v13[v14];
    if (end != begin)
    {
      do
      {
        v13[-1] = end[-1];
        --v13;
        --end;
      }
      while (end != begin);
      end = this->__begin_;
    }
    this->__begin_ = v13;
    this->__end_ = v16;
    this->__end_cap_.__value_ = v15;
    if (end)
      operator delete(end);
  }
}

uint64_t std::__state<char>::__state(uint64_t a1, __int128 *a2)
{
  __int128 v4;
  __int128 v5;
  _BYTE *v6;
  _BYTE *v7;
  int64_t v8;
  char *v9;
  size_t v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  char *v14;
  size_t v15;
  uint64_t v16;

  v4 = *a2;
  v5 = a2[1];
  *(_QWORD *)(a1 + 32) = 0;
  *(_OWORD *)a1 = v4;
  *(_OWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  v7 = (_BYTE *)*((_QWORD *)a2 + 4);
  v6 = (_BYTE *)*((_QWORD *)a2 + 5);
  v8 = v6 - v7;
  if (v6 != v7)
  {
    if (0xAAAAAAAAAAAAAAABLL * (v8 >> 3) >= 0xAAAAAAAAAAAAAABLL)
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    v9 = (char *)operator new(v8);
    *(_QWORD *)(a1 + 32) = v9;
    *(_QWORD *)(a1 + 40) = v9;
    *(_QWORD *)(a1 + 48) = &v9[8 * (v8 >> 3)];
    v10 = 24 * ((v8 - 24) / 0x18uLL) + 24;
    memcpy(v9, v7, v10);
    *(_QWORD *)(a1 + 40) = &v9[v10];
  }
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  v12 = (_BYTE *)*((_QWORD *)a2 + 7);
  v11 = (_BYTE *)*((_QWORD *)a2 + 8);
  v13 = v11 - v12;
  if (v11 != v12)
  {
    if (v13 < 0)
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    v14 = (char *)operator new(v11 - v12);
    *(_QWORD *)(a1 + 56) = v14;
    *(_QWORD *)(a1 + 64) = v14;
    *(_QWORD *)(a1 + 72) = &v14[16 * (v13 >> 4)];
    v15 = v13 & 0xFFFFFFFFFFFFFFF0;
    memcpy(v14, v12, v15);
    *(_QWORD *)(a1 + 64) = &v14[v15];
  }
  v16 = *((_QWORD *)a2 + 10);
  *(_QWORD *)(a1 + 85) = *(_QWORD *)((char *)a2 + 85);
  *(_QWORD *)(a1 + 80) = v16;
  return a1;
}

void sub_2129D87CC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void *v5;
  void *v6;

  v5 = *v3;
  if (*v3)
  {
    *(_QWORD *)(v1 + 64) = v5;
    operator delete(v5);
  }
  v6 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 40) = v6;
    operator delete(v6);
  }
  _Unwind_Resume(exception_object);
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  int v5;
  char v6;
  std::basic_regex<char>::value_type *v7;
  char *v8;
  std::basic_regex<char>::value_type *v9;
  int v10;
  std::basic_regex<char>::value_type *v11;
  int v12;
  uint64_t v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  char *v16;
  uint64_t v17;
  _BYTE *v18;
  char *v19;
  _BYTE *v20;
  uint64_t v21;
  char *v22;
  int64_t v23;
  uint64_t v24;
  unint64_t v25;
  _BYTE *v26;
  std::basic_regex<char>::value_type *v27;
  std::basic_regex<char>::value_type *v28;
  int v29;
  unint64_t v30;
  char *v31;
  int v32;
  int v33;
  int v34;
  std::basic_regex<char>::value_type *v35;
  std::basic_regex<char>::value_type *v36;
  uint64_t v37;
  int v38;
  _BYTE *v39;
  _BYTE *v40;
  _BYTE *v41;
  uint64_t v42;
  uint64_t v43;
  __int128 *v44;
  _OWORD *v45;
  unint64_t v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  char *v51;
  __int128 *v52;
  _OWORD *v53;
  unint64_t v54;
  __int128 v55;
  char v56;
  uint64_t v57;
  _BYTE *v58;
  std::string::value_type *v59;
  std::string::value_type **v60;
  std::string::value_type *v61;
  int v62;
  std::string::value_type *v63;
  uint64_t v64;
  char *v65;
  std::string::value_type *v66;
  unint64_t v67;
  __int128 v68;
  int v69;
  void **v70;
  _BYTE *v71;
  std::basic_regex<char>::value_type *v72;
  _BYTE *v73;
  std::basic_regex<char>::value_type *v74;
  int v75;
  char *v76;
  char v77;
  std::basic_regex<char>::value_type *v78;
  char v79;
  uint64_t v80;
  _BYTE *v81;
  const char *v82;
  std::regex_traits<char>::char_class_type classname;
  char *v84;
  BOOL v85;
  void *v86;
  void **v87;
  unsigned __int8 v88;
  void **v89;
  std::basic_regex<char>::value_type *v90;
  BOOL v91;
  void *v92;
  void **v93;
  unsigned __int8 v94;
  void **v95;
  std::basic_regex<char>::value_type *v96;
  char *v97;
  void **v98;
  char *v99;
  void **v100;
  unint64_t v101;
  __int128 v102;
  std::string::value_type *v103;
  void *v104;
  void *v105;
  void **v106;
  char v107;
  void **v108;
  void **v109;
  char v110;
  void **v111;
  unint64_t v112;
  __int128 v113;
  std::string::value_type *v114;
  char *v115;
  int v116;
  void *v117;
  char *v118;
  int v119;
  void **v121;
  uint64_t v122;
  uint64_t v123;
  void *v124[2];
  std::string::value_type *v125;
  void *v126[2];
  uint64_t v127;
  void *v128[2];
  std::string::value_type *v129;
  void *__p[2];
  unint64_t v131;
  std::string::value_type *__s[3];
  _BYTE v133[24];
  _BYTE v134[24];
  __int128 v135;
  std::string::value_type *v136;

  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3)
      goto LABEL_300;
    v5 = a2[1];
    v6 = v5 == 94;
    v7 = v5 == 94 ? a2 + 2 : a2 + 1;
    v8 = (char *)operator new(0xB0uLL);
    std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v8, a1, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), v6, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v8;
    *(_QWORD *)(a1 + 56) = v8;
    if (v7 == a3)
      goto LABEL_300;
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *v7 == 93)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, 93);
      ++v7;
    }
    if (v7 == a3)
      goto LABEL_300;
    v122 = (uint64_t)(v8 + 16);
    v123 = 4 - (_QWORD)a3;
    v121 = (void **)(v8 + 88);
    while (1)
    {
      v9 = v7;
      if (v7 == a3)
      {
        v7 = a3;
        goto LABEL_15;
      }
      v10 = *v7;
      v11 = v7;
      if (v10 == 93)
        goto LABEL_14;
      __p[0] = 0;
      __p[1] = 0;
      v131 = 0;
      v11 = v7;
      if (v7 + 1 == a3 || v10 != 91)
        goto LABEL_62;
      v12 = v7[1];
      if (v12 != 46)
      {
        if (v12 == 58)
        {
          v22 = v7 + 2;
          if (a3 - (v7 + 2) < 2)
            goto LABEL_298;
          v23 = v7 - a3;
          v24 = 2;
          while (1)
          {
            v25 = v24 - 2;
            while (v7[v25 + 2] != 58)
            {
              ++v25;
              if (v23 + v25 == -3)
                goto LABEL_298;
            }
            if (v7[v25 + 3] == 93)
              break;
            v24 = v25 + 3;
            if (v23 + v25 == -4)
              goto LABEL_298;
          }
          v37 = (uint64_t)&v7[v25 + 2];
          if ((std::basic_regex<char>::value_type *)v37 == a3)
            goto LABEL_298;
          v38 = *(_DWORD *)(a1 + 24);
          memset(v134, 170, sizeof(v134));
          if (v25 > 0x7FFFFFFFFFFFFFF7)
            std::string::__throw_length_error[abi:ne180100]();
          if (v25 >= 0x17)
          {
            v42 = (v25 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v25 | 7) != 0x17)
              v42 = v25 | 7;
            v43 = v42 + 1;
            v39 = operator new(v42 + 1);
            *(_QWORD *)&v134[8] = v25;
            *(_QWORD *)&v134[16] = v43 | 0x8000000000000000;
            *(_QWORD *)v134 = v39;
          }
          else
          {
            v134[23] = v25;
            v39 = v134;
            if (!v25)
            {
              v40 = v134;
              goto LABEL_174;
            }
          }
          if (v25 < 0x20)
          {
            v40 = v39;
          }
          else if ((unint64_t)(v39 - v22) < 0x20)
          {
            v40 = v39;
          }
          else
          {
            v40 = &v39[v25 & 0xFFFFFFFFFFFFFFE0];
            v22 += v25 & 0xFFFFFFFFFFFFFFE0;
            v44 = (__int128 *)(v9 + 18);
            v45 = v39 + 16;
            v46 = v25 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              v47 = *v44;
              *(v45 - 1) = *(v44 - 1);
              *v45 = v47;
              v44 += 2;
              v45 += 2;
              v46 -= 32;
            }
            while (v46);
            if (v25 == (v25 & 0x7FFFFFFFFFFFFFE0))
              goto LABEL_174;
          }
          do
          {
            v79 = *v22++;
            *v40++ = v79;
          }
          while (v22 != (char *)v37);
LABEL_174:
          *v40 = 0;
          v80 = v134[23];
          if (v134[23] >= 0)
            v81 = v134;
          else
            v81 = *(_BYTE **)v134;
          if (v134[23] < 0)
            v80 = *(_QWORD *)&v134[8];
          (*(void (**)(_QWORD, _BYTE *, _BYTE *))(**(_QWORD **)(a1 + 8) + 48))(*(_QWORD *)(a1 + 8), v81, &v81[v80]);
          if (v134[23] >= 0)
            v82 = v134;
          else
            v82 = *(const char **)v134;
          classname = std::__get_classname(v82, v38 & 1);
          if ((v134[23] & 0x80000000) != 0)
            operator delete(*(void **)v134);
          if (!classname)
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>();
          v77 = 0;
          *((_DWORD *)v8 + 40) |= classname;
          v7 = &v9[v25 + 4];
          v72 = v9;
          if ((SHIBYTE(v131) & 0x80000000) == 0)
          {
LABEL_165:
            v11 = v72;
            if ((v77 & 1) == 0)
              goto LABEL_15;
            goto LABEL_14;
          }
          goto LABEL_193;
        }
        if (v12 == 61)
        {
          if (a3 - (v7 + 2) < 2)
            goto LABEL_298;
          v13 = 0;
          v14 = (unsigned __int8 *)v7;
          v15 = (unsigned __int8 *)&v7[v123];
          if (v7[2] == 61)
            goto LABEL_27;
          do
          {
            do
            {
              if (!v15)
LABEL_298:
                std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
              v14 = (unsigned __int8 *)&v7[++v13];
              v15 = (unsigned __int8 *)&v7[v123 + v13];
            }
            while (v7[v13 + 2] != 61);
LABEL_27:
            ;
          }
          while (v14[3] != 93);
          v16 = &v7[v13 + 2];
          if (v16 == a3)
            goto LABEL_298;
          memset(v133, 170, sizeof(v133));
          std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>((uint64_t)v133, a1, (uint64_t)(v7 + 2), v16);
          if ((v133[23] & 0x80000000) == 0)
          {
            v17 = v133[23];
            if (!v133[23])
              goto LABEL_302;
            memset(__s, 170, sizeof(__s));
            v18 = v133;
            v19 = &v133[v133[23]];
            memset(v134, 170, sizeof(v134));
            if (v133[23] <= 0x16uLL)
              goto LABEL_32;
LABEL_90:
            v48 = (v17 & 0x7FFFFFFFFFFFFFF8) + 8;
            if ((v17 | 7) != 0x17)
              v48 = v17 | 7;
            v49 = v48 + 1;
            v20 = operator new(v48 + 1);
            *(_QWORD *)&v134[8] = v17;
            *(_QWORD *)&v134[16] = v49 | 0x8000000000000000;
            *(_QWORD *)v134 = v20;
            v21 = v19 - v18;
            if ((unint64_t)(v19 - v18) >= 0x20)
              goto LABEL_93;
LABEL_98:
            v50 = v20;
            v51 = v18;
            goto LABEL_99;
          }
          v17 = *(_QWORD *)&v133[8];
          if (!*(_QWORD *)&v133[8])
LABEL_302:
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
          memset(__s, 170, sizeof(__s));
          v18 = *(_BYTE **)v133;
          memset(v134, 170, sizeof(v134));
          if (*(_QWORD *)&v133[8] > 0x7FFFFFFFFFFFFFF7uLL)
            std::string::__throw_length_error[abi:ne180100]();
          v19 = (char *)(*(_QWORD *)v133 + *(_QWORD *)&v133[8]);
          if (*(_QWORD *)&v133[8] > 0x16uLL)
            goto LABEL_90;
LABEL_32:
          v134[23] = v17;
          v20 = v134;
          v21 = v19 - v18;
          if ((unint64_t)(v19 - v18) < 0x20)
            goto LABEL_98;
LABEL_93:
          if ((unint64_t)(v20 - v18) < 0x20)
            goto LABEL_98;
          v50 = &v20[v21 & 0xFFFFFFFFFFFFFFE0];
          v51 = &v18[v21 & 0xFFFFFFFFFFFFFFE0];
          v52 = (__int128 *)(v18 + 16);
          v53 = v20 + 16;
          v54 = v21 & 0xFFFFFFFFFFFFFFE0;
          do
          {
            v55 = *v52;
            *(v53 - 1) = *(v52 - 1);
            *v53 = v55;
            v52 += 2;
            v53 += 2;
            v54 -= 32;
          }
          while (v54);
          if (v21 != (v21 & 0xFFFFFFFFFFFFFFE0))
          {
            do
            {
LABEL_99:
              v56 = *v51++;
              *v50++ = v56;
            }
            while (v51 != v19);
          }
          *v50 = 0;
          memset(__s, 170, sizeof(__s));
          v57 = v134[23];
          if (v134[23] >= 0)
            v58 = v134;
          else
            v58 = *(_BYTE **)v134;
          if (v134[23] < 0)
            v57 = *(_QWORD *)&v134[8];
          (*(void (**)(std::string::value_type **__return_ptr, _QWORD, _BYTE *, _BYTE *))(**(_QWORD **)(a1 + 16) + 32))(__s, *(_QWORD *)(a1 + 16), v58, &v58[v57]);
          v59 = (std::string::value_type *)HIBYTE(__s[2]);
          if (SHIBYTE(__s[2]) < 0)
            v59 = __s[1];
          if (v59 != (std::string::value_type *)1)
          {
            if (v59 == (std::string::value_type *)12)
            {
              v60 = __s;
              if (SHIBYTE(__s[2]) < 0)
                v60 = (std::string::value_type **)__s[0];
              *((_BYTE *)v60 + 11) = *((_BYTE *)v60 + 3);
              if ((v134[23] & 0x80000000) != 0)
              {
LABEL_112:
                operator delete(*(void **)v134);
                v61 = (std::string::value_type *)HIBYTE(__s[2]);
                v62 = SHIBYTE(__s[2]);
                v63 = __s[1];
                if (SHIBYTE(__s[2]) < 0)
                  v61 = __s[1];
                if (!v61)
                  goto LABEL_115;
LABEL_128:
                v67 = *((_QWORD *)v8 + 18);
                if (v67 >= *((_QWORD *)v8 + 19))
                {
                  *((_QWORD *)v8 + 18) = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)v8 + 17, (uint64_t)__s);
                  if (SHIBYTE(__s[2]) < 0)
                    goto LABEL_201;
                }
                else
                {
                  if (v62 < 0)
                  {
                    std::string::__init_copy_ctor_external(*((std::string **)v8 + 18), __s[0], (std::string::size_type)v63);
                  }
                  else
                  {
                    v68 = *(_OWORD *)__s;
                    *(std::string::value_type **)(v67 + 16) = __s[2];
                    *(_OWORD *)v67 = v68;
                  }
                  *((_QWORD *)v8 + 18) = v67 + 24;
                  *((_QWORD *)v8 + 18) = v67 + 24;
                  if (SHIBYTE(__s[2]) < 0)
                    goto LABEL_201;
                }
LABEL_191:
                if ((v133[23] & 0x80000000) == 0)
                  goto LABEL_192;
                goto LABEL_202;
              }
LABEL_125:
              v66 = (std::string::value_type *)HIBYTE(__s[2]);
              v62 = SHIBYTE(__s[2]);
              v63 = __s[1];
              if (SHIBYTE(__s[2]) < 0)
                v66 = __s[1];
              if (v66)
                goto LABEL_128;
LABEL_115:
              v64 = v133[23];
              if (v133[23] < 0)
                v64 = *(_QWORD *)&v133[8];
              if (v64 == 2)
              {
                v84 = v133;
                if (v133[23] < 0)
                  v84 = *(char **)v133;
                std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100]((uint64_t)v8, *v84, v84[1]);
              }
              else
              {
                if (v64 != 1)
                  std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
                v65 = v133;
                if (v133[23] < 0)
                  v65 = *(char **)v133;
                std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, *v65);
              }
              if ((SHIBYTE(__s[2]) & 0x80000000) == 0)
                goto LABEL_191;
LABEL_201:
              operator delete(__s[0]);
              if ((v133[23] & 0x80000000) == 0)
              {
LABEL_192:
                v77 = 0;
                v7 = &v9[v13 + 4];
                v72 = v9;
                if ((SHIBYTE(v131) & 0x80000000) == 0)
                  goto LABEL_165;
                goto LABEL_193;
              }
LABEL_202:
              operator delete(*(void **)v133);
              goto LABEL_192;
            }
            if (SHIBYTE(__s[2]) < 0)
            {
              *__s[0] = 0;
              __s[1] = 0;
              if ((v134[23] & 0x80000000) != 0)
                goto LABEL_112;
              goto LABEL_125;
            }
            LOBYTE(__s[0]) = 0;
            HIBYTE(__s[2]) = 0;
          }
          if ((v134[23] & 0x80000000) != 0)
            goto LABEL_112;
          goto LABEL_125;
        }
        v11 = v7;
LABEL_62:
        v32 = *(_DWORD *)(a1 + 24) & 0x1F0;
        v33 = 0;
        goto LABEL_63;
      }
      v26 = v7 + 2;
      if (a3 - (v7 + 2) < 2)
        goto LABEL_299;
      v27 = v7;
      v7 += 2;
      v28 = v9 + 3;
      if (*v26 != 46)
        break;
LABEL_48:
      if (*v28 != 93)
        goto LABEL_46;
      if (v7 == a3)
LABEL_299:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
      std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>((uint64_t)v134, a1, (uint64_t)v26, v27 + 2);
      if (SHIBYTE(v131) < 0)
        operator delete(__p[0]);
      *(_OWORD *)__p = *(_OWORD *)v134;
      v131 = *(_QWORD *)&v134[16];
      v30 = *(_QWORD *)&v134[8];
      if (v134[23] >= 0)
        v31 = (char *)HIBYTE(v131);
      else
        v31 = (char *)__p[1];
      if ((unint64_t)(v31 - 1) >= 2)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
      v11 = v7 + 2;
      v32 = *(_DWORD *)(a1 + 24) & 0x1F0;
      v33 = v134[23];
      if (v134[23] >= 0)
        v30 = HIBYTE(v131);
      if (v30)
      {
        if (v11 == a3)
          goto LABEL_136;
        goto LABEL_135;
      }
LABEL_63:
      if ((v32 | 0x40) == 0x40)
      {
        v34 = *v11;
        if (v34 == 92)
        {
          v35 = v11 + 1;
          if (v32)
            v36 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v35, a3, (uint64_t *)__p);
          else
            v36 = (std::basic_regex<char>::value_type *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (unsigned __int8 *)v35, (unsigned __int8 *)a3, (uint64_t)__p, (uint64_t)v8);
          v11 = v36;
          if (v36 == a3)
            goto LABEL_136;
          goto LABEL_135;
        }
      }
      else
      {
        LOBYTE(v34) = *v11;
      }
      if (v33 < 0)
      {
        v41 = __p[0];
        __p[1] = (void *)1;
        *(_BYTE *)__p[0] = v34;
        v41[1] = 0;
        if (++v11 == a3)
          goto LABEL_136;
      }
      else
      {
        HIBYTE(v131) = 1;
        LOWORD(__p[0]) = v34;
        if (++v11 == a3)
          goto LABEL_136;
      }
LABEL_135:
      v69 = *v11;
      if (v69 != 93)
      {
        v71 = v11 + 1;
        if (v11 + 1 != a3 && v69 == 45 && *v71 != 93)
        {
          v128[0] = 0;
          v128[1] = 0;
          v129 = 0;
          v72 = v11 + 2;
          if (v11 + 2 == a3 || *v71 != 91 || *v72 != 46)
          {
            if ((v32 | 0x40) == 0x40)
            {
              LODWORD(v71) = *v71;
              if ((_DWORD)v71 == 92)
              {
                if (v32)
                  v78 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v72, a3, (uint64_t *)v128);
                else
                  v78 = (std::basic_regex<char>::value_type *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (unsigned __int8 *)v72, (unsigned __int8 *)a3, (uint64_t)v128, (uint64_t)v8);
                v72 = v78;
                goto LABEL_205;
              }
            }
            else
            {
              LOBYTE(v71) = *v71;
            }
            HIBYTE(v129) = 1;
            LOWORD(v128[0]) = v71;
            goto LABEL_205;
          }
          v73 = v11 + 3;
          if (a3 - (v11 + 3) < 2)
            goto LABEL_301;
          v7 = v11 + 3;
          v74 = v11 + 4;
          if (*v73 == 46)
            goto LABEL_154;
          do
          {
            do
            {
              if (a3 - 5 == v11)
                goto LABEL_301;
              ++v11;
              v7 = v74;
              v75 = *v74++;
            }
            while (v75 != 46);
LABEL_154:
            ;
          }
          while (*v74 != 93);
          if (v7 == a3)
LABEL_301:
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
          std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>((uint64_t)v134, a1, (uint64_t)v73, v11 + 3);
          if (SHIBYTE(v129) < 0)
            operator delete(v128[0]);
          v129 = *(std::string::value_type **)&v134[16];
          *(_OWORD *)v128 = *(_OWORD *)v134;
          v76 = (char *)HIBYTE(*(_QWORD *)&v134[16]);
          if (v134[23] < 0)
            v76 = (char *)v128[1];
          if ((unint64_t)(v76 - 1) >= 2)
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
          v72 = v7 + 2;
LABEL_205:
          *(_OWORD *)v126 = *(_OWORD *)__p;
          v127 = v131;
          __p[1] = 0;
          v131 = 0;
          __p[0] = 0;
          *(_OWORD *)v124 = *(_OWORD *)v128;
          v125 = v129;
          v128[0] = 0;
          v128[1] = 0;
          v129 = 0;
          if (v8[170])
          {
            if (v8[169])
            {
              v85 = v127 < 0;
              v86 = (void *)HIBYTE(v127);
              if (v127 < 0)
                v86 = v126[1];
              if (v86)
              {
                v7 = 0;
                do
                {
                  if (v85)
                    v87 = (void **)v126[0];
                  else
                    v87 = v126;
                  v88 = (*(uint64_t (**)(_QWORD, _QWORD))(**((_QWORD **)v8 + 3) + 40))(*((_QWORD *)v8 + 3), v7[(_QWORD)v87]);
                  if (v127 >= 0)
                    v89 = v126;
                  else
                    v89 = (void **)v126[0];
                  (v7++)[(_QWORD)v89] = v88;
                  v85 = v127 < 0;
                  v90 = (std::basic_regex<char>::value_type *)HIBYTE(v127);
                  if (v127 < 0)
                    v90 = (std::basic_regex<char>::value_type *)v126[1];
                }
                while (v7 < v90);
              }
              v91 = SHIBYTE(v125) < 0;
              v92 = (void *)HIBYTE(v125);
              if (SHIBYTE(v125) < 0)
                v92 = v124[1];
              if (v92)
              {
                v7 = 0;
                do
                {
                  if (v91)
                    v93 = (void **)v124[0];
                  else
                    v93 = v124;
                  v94 = (*(uint64_t (**)(_QWORD, _QWORD))(**((_QWORD **)v8 + 3) + 40))(*((_QWORD *)v8 + 3), v7[(_QWORD)v93]);
                  if (SHIBYTE(v125) >= 0)
                    v95 = v124;
                  else
                    v95 = (void **)v124[0];
                  (v7++)[(_QWORD)v95] = v94;
                  v91 = SHIBYTE(v125) < 0;
                  v96 = (std::basic_regex<char>::value_type *)HIBYTE(v125);
                  if (SHIBYTE(v125) < 0)
                    v96 = (std::basic_regex<char>::value_type *)v124[1];
                }
                while (v7 < v96);
              }
            }
            v97 = (char *)HIBYTE(v127);
            if (v127 >= 0)
              v98 = v126;
            else
              v98 = (void **)v126[0];
            if (v127 < 0)
              v97 = (char *)v126[1];
            std::regex_traits<char>::transform<std::__wrap_iter<char *>>((uint64_t)v133, v122, (uint64_t)v98, &v97[(_QWORD)v98]);
            v99 = (char *)HIBYTE(v125);
            if (SHIBYTE(v125) >= 0)
              v100 = v124;
            else
              v100 = (void **)v124[0];
            if (SHIBYTE(v125) < 0)
              v99 = (char *)v124[1];
            std::regex_traits<char>::transform<std::__wrap_iter<char *>>((uint64_t)__s, v122, (uint64_t)v100, &v99[(_QWORD)v100]);
            *(_OWORD *)v134 = *(_OWORD *)v133;
            *(_QWORD *)&v134[16] = *(_QWORD *)&v133[16];
            memset(v133, 0, sizeof(v133));
            v135 = *(_OWORD *)__s;
            v136 = __s[2];
            memset(__s, 0, sizeof(__s));
            v101 = *((_QWORD *)v8 + 12);
            if (v101 < *((_QWORD *)v8 + 13))
            {
              v102 = *(_OWORD *)v134;
              *(_QWORD *)(v101 + 16) = *(_QWORD *)&v134[16];
              *(_OWORD *)v101 = v102;
              memset(v134, 0, sizeof(v134));
              v103 = v136;
              *(_OWORD *)(v101 + 24) = v135;
              *(_QWORD *)(v101 + 40) = v103;
              *((_QWORD *)v8 + 12) = v101 + 48;
              if ((v134[23] & 0x80000000) != 0)
                goto LABEL_245;
LABEL_272:
              if ((SHIBYTE(__s[2]) & 0x80000000) == 0)
                goto LABEL_273;
LABEL_246:
              operator delete(__s[0]);
              if ((v133[23] & 0x80000000) != 0)
                goto LABEL_274;
LABEL_280:
              if (SHIBYTE(v125) < 0)
              {
                operator delete(v124[0]);
                if (SHIBYTE(v127) < 0)
                  goto LABEL_286;
LABEL_282:
                if ((SHIBYTE(v129) & 0x80000000) == 0)
                  goto LABEL_283;
LABEL_287:
                operator delete(v128[0]);
                v77 = 1;
                if ((SHIBYTE(v131) & 0x80000000) == 0)
                  goto LABEL_165;
              }
              else
              {
                if ((SHIBYTE(v127) & 0x80000000) == 0)
                  goto LABEL_282;
LABEL_286:
                operator delete(v126[0]);
                if (SHIBYTE(v129) < 0)
                  goto LABEL_287;
LABEL_283:
                v77 = 1;
                if ((SHIBYTE(v131) & 0x80000000) == 0)
                  goto LABEL_165;
              }
LABEL_193:
              operator delete(__p[0]);
              v11 = v72;
              if ((v77 & 1) == 0)
                goto LABEL_15;
              goto LABEL_14;
            }
            v115 = std::vector<std::pair<std::string,std::string>>::__push_back_slow_path<std::pair<std::string,std::string>>(v121, (uint64_t)v134);
            v116 = SHIBYTE(v136);
            *((_QWORD *)v8 + 12) = v115;
            if (v116 < 0)
            {
              operator delete((void *)v135);
              if ((v134[23] & 0x80000000) == 0)
                goto LABEL_272;
            }
            else if ((v134[23] & 0x80000000) == 0)
            {
              goto LABEL_272;
            }
LABEL_245:
            operator delete(*(void **)v134);
            if (SHIBYTE(__s[2]) < 0)
              goto LABEL_246;
LABEL_273:
            if ((v133[23] & 0x80000000) == 0)
              goto LABEL_280;
LABEL_274:
            v117 = *(void **)v133;
          }
          else
          {
            v104 = (void *)HIBYTE(v127);
            if (v127 < 0)
              v104 = v126[1];
            if (v104 != (void *)1)
              goto LABEL_307;
            v105 = (void *)HIBYTE(v125);
            if (SHIBYTE(v125) < 0)
              v105 = v124[1];
            if (v105 != (void *)1)
LABEL_307:
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>();
            if (v8[169])
            {
              if (v127 >= 0)
                v106 = v126;
              else
                v106 = (void **)v126[0];
              v107 = (*(uint64_t (**)(_QWORD, _QWORD))(**((_QWORD **)v8 + 3) + 40))(*((_QWORD *)v8 + 3), *(char *)v106);
              if (v127 >= 0)
                v108 = v126;
              else
                v108 = (void **)v126[0];
              *(_BYTE *)v108 = v107;
              if (SHIBYTE(v125) >= 0)
                v109 = v124;
              else
                v109 = (void **)v124[0];
              v110 = (*(uint64_t (**)(_QWORD, _QWORD))(**((_QWORD **)v8 + 3) + 40))(*((_QWORD *)v8 + 3), *(char *)v109);
              if (SHIBYTE(v125) >= 0)
                v111 = v124;
              else
                v111 = (void **)v124[0];
              *(_BYTE *)v111 = v110;
            }
            *(_OWORD *)v134 = *(_OWORD *)v126;
            *(_QWORD *)&v134[16] = v127;
            v126[0] = 0;
            v126[1] = 0;
            v127 = 0;
            v135 = *(_OWORD *)v124;
            v136 = v125;
            v124[0] = 0;
            v124[1] = 0;
            v125 = 0;
            v112 = *((_QWORD *)v8 + 12);
            if (v112 >= *((_QWORD *)v8 + 13))
            {
              v118 = std::vector<std::pair<std::string,std::string>>::__push_back_slow_path<std::pair<std::string,std::string>>(v121, (uint64_t)v134);
              v119 = SHIBYTE(v136);
              *((_QWORD *)v8 + 12) = v118;
              if (v119 < 0)
                operator delete((void *)v135);
            }
            else
            {
              v113 = *(_OWORD *)v134;
              *(_QWORD *)(v112 + 16) = *(_QWORD *)&v134[16];
              *(_OWORD *)v112 = v113;
              memset(v134, 0, sizeof(v134));
              v114 = v136;
              *(_OWORD *)(v112 + 24) = v135;
              *(_QWORD *)(v112 + 40) = v114;
              *((_QWORD *)v8 + 12) = v112 + 48;
            }
            if ((v134[23] & 0x80000000) == 0)
              goto LABEL_280;
            v117 = *(void **)v134;
          }
          operator delete(v117);
          goto LABEL_280;
        }
      }
LABEL_136:
      if (SHIBYTE(v131) < 0)
      {
        if (__p[1])
        {
          if (__p[1] == (void *)1)
          {
            v70 = (void **)__p[0];
LABEL_143:
            std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, *(char *)v70);
LABEL_164:
            v77 = 1;
            v72 = v11;
            if ((SHIBYTE(v131) & 0x80000000) == 0)
              goto LABEL_165;
            goto LABEL_193;
          }
          v70 = (void **)__p[0];
LABEL_163:
          std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100]((uint64_t)v8, *(char *)v70, *((char *)v70 + 1));
          goto LABEL_164;
        }
        operator delete(__p[0]);
      }
      else if (HIBYTE(v131))
      {
        v70 = __p;
        if (HIBYTE(v131) == 1)
          goto LABEL_143;
        goto LABEL_163;
      }
LABEL_14:
      v7 = v11;
LABEL_15:
      if (v9 == v7)
      {
        if (v9 != a3)
        {
          if (*v9 == 45)
          {
            std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, 45);
            ++v9;
          }
          if (v9 != a3 && *v9 == 93)
            return v9 + 1;
        }
LABEL_300:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
      }
    }
    do
    {
LABEL_46:
      if (a3 - 4 == v27)
        goto LABEL_299;
      ++v27;
      v7 = v28;
      v29 = *v28++;
    }
    while (v29 != 46);
    goto LABEL_48;
  }
  return a2;
}

void sub_2129D9780(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36,uint64_t a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43,uint64_t a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50)
{
  if (a36 < 0)
    operator delete(__p);
  if (a43 < 0)
    operator delete(a38);
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BF63C4](exception, 11);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_2129D997C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BF63C4](exception, 3);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_2129D9A48(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t *a4)
{
  unsigned __int8 *v4;
  uint64_t v5;
  std::basic_regex<char>::value_type v6;
  unsigned __int8 *result;
  unsigned int v8;
  std::basic_regex<char>::value_type v10;
  int v11;
  int v12;
  unsigned __int8 v13;
  char v14;
  unsigned __int8 v15;
  char v16;
  std::basic_regex<char>::value_type v17;

  v4 = a2;
  if (a2 == a3)
    return v4;
  v5 = *a2;
  v6 = v5;
  switch((char)v5)
  {
    case '0':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 0;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 0);
        return v4 + 1;
      }
    case 'c':
      if (v4 + 1 == a3 || (char)v4[1] < 65)
        goto LABEL_85;
      v8 = v4[1];
      if (v8 >= 0x5B && (v8 - 97) > 0x19u)
        goto LABEL_85;
      v10 = v8 & 0x1F;
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_BYTE *)a4 = v10;
        *((_BYTE *)a4 + 1) = 0;
        return v4 + 2;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v10);
        return v4 + 2;
      }
    case 'f':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 12;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 12);
        return v4 + 1;
      }
    case 'n':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 10;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 10);
        return v4 + 1;
      }
    case 'r':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 13;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 13);
        return v4 + 1;
      }
    case 't':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 9;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 9);
        return v4 + 1;
      }
    case 'u':
      if (v4 + 1 != a3)
      {
        v11 = v4[1];
        if ((v11 & 0xF8) == 0x30 || (v11 & 0xFE) == 0x38 || (v11 | 0x20u) - 97 < 6)
        {
          v4 += 2;
          if (v4 != a3)
          {
            v12 = *v4;
            if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38 || (v12 | 0x20u) - 97 < 6)
              goto LABEL_42;
          }
        }
      }
      goto LABEL_85;
    case 'v':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 11;
        return v4 + 1;
      }
      else
      {
        v6 = 11;
LABEL_68:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v6);
        return v4 + 1;
      }
    case 'x':
LABEL_42:
      if (v4 + 1 == a3)
        goto LABEL_85;
      v13 = v4[1];
      v14 = -48;
      if ((v13 & 0xF8) == 0x30 || (v13 & 0xFE) == 0x38)
        goto LABEL_47;
      v13 |= 0x20u;
      if ((v13 - 97) >= 6u)
        goto LABEL_85;
      v14 = -87;
LABEL_47:
      if (v4 + 2 == a3)
        goto LABEL_85;
      v15 = v4[2];
      v16 = -48;
      if ((v15 & 0xF8) != 0x30 && (v15 & 0xFE) != 0x38)
      {
        v15 |= 0x20u;
        if ((v15 - 97) >= 6u)
LABEL_85:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
        v16 = -87;
      }
      v17 = v15 + 16 * (v13 + v14) + v16;
      if (!a4)
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v17);
        v4 += 3;
        return v4;
      }
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }
      *(_BYTE *)a4 = v17;
      *((_BYTE *)a4 + 1) = 0;
      result = v4 + 3;
      break;
    default:
      if ((char)v5 == 95 || ((char)v5 & 0x80000000) == 0 && (a1->__traits_.__ct_->__tab_[v5] & 0x500) != 0)
        goto LABEL_85;
      if (!a4)
        goto LABEL_68;
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }
      *(_BYTE *)a4 = v5;
      *((_BYTE *)a4 + 1) = 0;
      return v4 + 1;
  }
  return result;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_char(std::basic_regex<char> *this, std::basic_regex<char>::value_type __c)
{
  uint64_t v2;
  std::basic_regex<_CharT, _Traits>::flag_type flags;
  std::__node<char> *v5;
  std::__owns_one_state<char> *end;
  std::__node<char> *v7;
  char *v8;
  std::__node<char> *first;
  std::__node<char> *v10;

  v2 = __c;
  flags = this->__flags_;
  if ((flags & 1) != 0)
  {
    v8 = (char *)operator new(0x30uLL);
    first = this->__end_->__first_;
    *(_QWORD *)v8 = off_24CE6E8B8;
    *((_QWORD *)v8 + 1) = first;
    std::locale::locale((std::locale *)v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)&this->__traits_.__ct_;
    v8[40] = ((uint64_t (*)(const std::ctype<char> *, uint64_t))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v2);
LABEL_6:
    this->__end_->__first_ = (std::__node<char> *)v8;
    goto LABEL_7;
  }
  if ((flags & 8) != 0)
  {
    v8 = (char *)operator new(0x30uLL);
    v10 = this->__end_->__first_;
    *(_QWORD *)v8 = off_24CE6E900;
    *((_QWORD *)v8 + 1) = v10;
    std::locale::locale((std::locale *)v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)&this->__traits_.__ct_;
    v8[40] = v2;
    goto LABEL_6;
  }
  v5 = (std::__node<char> *)operator new(0x18uLL);
  end = this->__end_;
  v7 = end->__first_;
  v5->__vftable = (std::__node<char>_vtbl *)&off_24CE6E948;
  v5[1].__vftable = (std::__node<char>_vtbl *)v7;
  LOBYTE(v5[2].__vftable) = v2;
  end->__first_ = v5;
LABEL_7:
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void sub_2129DA024(_Unwind_Exception *a1)
{
  void (__cdecl ***v1)(std::__owns_one_state<char> *__hidden);
  std::locale *v2;
  void (__cdecl **v4)(std::__owns_one_state<char> *__hidden);

  std::locale::~locale(v2);
  v4 = v1[1];
  if (v4)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v4 + 1))(v4);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BF63C4](exception, 4);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_2129DA098(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(std::basic_regex<char> *this, int __i)
{
  std::basic_regex<_CharT, _Traits>::flag_type flags;
  std::__node<char> *v5;
  std::__owns_one_state<char> *end;
  std::__node<char> *v7;
  std::locale *v8;
  std::locale *v9;
  std::__node<char> *first;
  uint64_t (**v11)();

  flags = this->__flags_;
  if ((flags & 1) != 0)
  {
    v8 = (std::locale *)operator new(0x30uLL);
    v9 = v8;
    first = this->__end_->__first_;
    v11 = off_24CE6E990;
LABEL_6:
    v8->__locale_ = (std::locale::__imp *)v11;
    v8[1].__locale_ = (std::locale::__imp *)first;
    std::locale::locale(v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)&v9[3].__locale_ = *(_OWORD *)&this->__traits_.__ct_;
    LODWORD(v9[5].__locale_) = __i;
    this->__end_->__first_ = (std::__node<char> *)v9;
    goto LABEL_7;
  }
  if ((flags & 8) != 0)
  {
    v8 = (std::locale *)operator new(0x30uLL);
    v9 = v8;
    first = this->__end_->__first_;
    v11 = off_24CE6E9D8;
    goto LABEL_6;
  }
  v5 = (std::__node<char> *)operator new(0x18uLL);
  end = this->__end_;
  v7 = end->__first_;
  v5->__vftable = (std::__node<char>_vtbl *)&off_24CE6EA20;
  v5[1].__vftable = (std::__node<char>_vtbl *)v7;
  LODWORD(v5[2].__vftable) = __i;
  end->__first_ = v5;
LABEL_7:
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

std::locale *std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_24CE6E8B8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_24CE6E8B8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete(a1);
}

uint64_t std::__match_char_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  char *v3;
  uint64_t v4;

  v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (v4 = result,
        result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(result + 24) + 40))(*(_QWORD *)(result + 24), *v3), *(unsigned __int8 *)(v4 + 40) != result))
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    ++*(_QWORD *)(a2 + 16);
    *(_QWORD *)(a2 + 80) = *(_QWORD *)(v4 + 8);
  }
  return result;
}

std::locale *std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_24CE6E900;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_24CE6E900;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete(a1);
}

uint64_t std::__match_char_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  }
  return result;
}

void (__cdecl ***std::__match_char<char>::~__match_char(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__match_char<char>::~__match_char(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

uint64_t std::__match_char<char>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  }
  return result;
}

std::locale *std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_24CE6E990;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_24CE6E990;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete(a1);
}

uint64_t std::__back_ref_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v3 = *(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 40) - 1);
  if (!*(_BYTE *)(v3 + 16)
    || (v4 = *(_QWORD *)(v3 + 8) - *(_QWORD *)v3, v5 = *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24) - v5 < v4))
  {
LABEL_3:
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
    return result;
  }
  v6 = result;
  if (v4 >= 1)
  {
    v7 = 0;
    while (1)
    {
      v8 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v6 + 24) + 40))(*(_QWORD *)(v6 + 24), *(char *)(*(_QWORD *)v3 + v7));
      result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v6 + 24) + 40))(*(_QWORD *)(v6 + 24), *(char *)(*(_QWORD *)(a2 + 16) + v7));
      if (v8 != (_DWORD)result)
        goto LABEL_3;
      if (v4 == ++v7)
      {
        v5 = *(_QWORD *)(a2 + 16);
        break;
      }
    }
  }
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 16) = v5 + v4;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(v6 + 8);
  return result;
}

std::locale *std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_24CE6E9D8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_24CE6E9D8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete(a1);
}

uint64_t std::__back_ref_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned int v2;
  uint64_t v3;
  unsigned __int8 **v4;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  int v10;
  int v11;
  int v12;

  v2 = *(_DWORD *)(result + 40) - 1;
  v3 = *(_QWORD *)(a2 + 32);
  if (!*(_BYTE *)(v3 + 24 * v2 + 16)
    || (v4 = (unsigned __int8 **)(v3 + 24 * v2),
        v5 = *v4,
        v6 = v4[1] - *v4,
        v7 = *(_QWORD *)(a2 + 16),
        *(_QWORD *)(a2 + 24) - v7 < v6))
  {
LABEL_3:
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
    return result;
  }
  if (v6 >= 1)
  {
    v8 = v6;
    v9 = *(unsigned __int8 **)(a2 + 16);
    do
    {
      v11 = *v5++;
      v10 = v11;
      v12 = *v9++;
      if (v10 != v12)
        goto LABEL_3;
    }
    while (--v8);
  }
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 16) = v7 + v6;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void (__cdecl ***std::__back_ref<char>::~__back_ref(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__back_ref<char>::~__back_ref(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

unsigned int *std::__back_ref<char>::__exec(unsigned int *result, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unsigned int v5;
  unsigned int *v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;

  v2 = result[4];
  v3 = *(_QWORD *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(a2 + 40) - v3) >> 3) < v2)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  v5 = v2 - 1;
  if (*(_BYTE *)(v3 + 24 * v5 + 16)
    && (v6 = result,
        v7 = v3 + 24 * v5,
        result = *(unsigned int **)v7,
        v8 = *(_QWORD *)(v7 + 8) - *(_QWORD *)v7,
        v9 = *(_QWORD *)(a2 + 16),
        *(_QWORD *)(a2 + 24) - v9 >= v8)
    && (result = (unsigned int *)memcmp(result, *(const void **)(a2 + 16), v8), !(_DWORD)result))
  {
    *(_DWORD *)a2 = -994;
    *(_QWORD *)(a2 + 16) = v9 + v8;
    *(_QWORD *)(a2 + 80) = *((_QWORD *)v6 + 1);
  }
  else
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
  }
  return result;
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](uint64_t a1, uint64_t a2)
{
  char v2;
  unint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  size_t v10;
  _BYTE *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  _BYTE *v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  size_t v20;
  unint64_t v21;
  _BYTE *v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  size_t v26;
  unint64_t v27;
  unint64_t v28;
  __int128 *v29;
  _OWORD *v30;
  unint64_t v31;
  __int128 v32;
  char *v33;
  _QWORD *v34;
  unint64_t v35;
  uint64_t v36;
  __int128 *v37;
  _OWORD *v38;
  unint64_t v39;
  __int128 v40;
  char *v41;
  _QWORD *v42;
  unint64_t v43;
  uint64_t v44;
  __int128 *v45;
  _OWORD *v46;
  unint64_t v47;
  __int128 v48;
  char *v49;
  _QWORD *v50;
  unint64_t v51;
  uint64_t v52;
  char *v53;
  char v54;
  char *v55;
  char v56;
  char *v57;
  char v58;

  v2 = a2;
  if (*(_BYTE *)(a1 + 169))
  {
    v2 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
    v5 = *(_BYTE **)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    if ((unint64_t)v5 >= v4)
    {
      v6 = *(_BYTE **)(a1 + 40);
      v7 = v5 - v6;
      v8 = v5 - v6 + 1;
      if (v8 >= 0)
      {
        v9 = v4 - (_QWORD)v6;
        if (2 * v9 > v8)
          v8 = 2 * v9;
        if (v9 >= 0x3FFFFFFFFFFFFFFFLL)
          v10 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v10 = v8;
        if (v10)
        {
          v11 = operator new(v10);
          v12 = &v11[v7];
          v13 = &v11[v10];
          v11[v7] = v2;
          v14 = (uint64_t)&v11[v7 + 1];
          if (v5 == v6)
            goto LABEL_49;
        }
        else
        {
          v11 = 0;
          v12 = (char *)(v5 - v6);
          v13 = 0;
          *(_BYTE *)v7 = v2;
          v14 = v7 + 1;
          if (v5 == v6)
            goto LABEL_49;
        }
        if (v7 < 8 || (unint64_t)(v6 - v11) < 0x20)
          goto LABEL_76;
        if (v7 < 0x20)
        {
          v21 = 0;
          goto LABEL_55;
        }
        v21 = v7 & 0xFFFFFFFFFFFFFFE0;
        v29 = (__int128 *)(v5 - 16);
        v30 = &v11[v5 - 16 - v6];
        v31 = v7 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v32 = *v29;
          *(v30 - 1) = *(v29 - 1);
          *v30 = v32;
          v30 -= 2;
          v29 -= 2;
          v31 -= 32;
        }
        while (v31);
        if (v7 != v21)
        {
          if ((v7 & 0x18) == 0)
          {
            v12 -= v21;
            v5 -= v21;
            goto LABEL_76;
          }
LABEL_55:
          v12 -= v7 & 0xFFFFFFFFFFFFFFF8;
          v33 = &v5[-v21 - 8];
          v34 = &v11[v33 - v6];
          v35 = v21 - (v7 & 0xFFFFFFFFFFFFFFF8);
          do
          {
            v36 = *(_QWORD *)v33;
            v33 -= 8;
            *v34-- = v36;
            v35 += 8;
          }
          while (v35);
          v5 -= v7 & 0xFFFFFFFFFFFFFFF8;
          if (v7 == (v7 & 0xFFFFFFFFFFFFFFF8))
            goto LABEL_86;
LABEL_76:
          v53 = v12 - 1;
          do
          {
            v54 = *--v5;
            *v53-- = v54;
          }
          while (v5 != v6);
        }
LABEL_86:
        v5 = *(_BYTE **)(a1 + 40);
        *(_QWORD *)(a1 + 40) = v11;
        *(_QWORD *)(a1 + 48) = v14;
        *(_QWORD *)(a1 + 56) = v13;
        if (!v5)
          goto LABEL_50;
        goto LABEL_87;
      }
LABEL_88:
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    }
LABEL_24:
    *v5 = v2;
    *(_QWORD *)(a1 + 48) = v5 + 1;
    return;
  }
  v5 = *(_BYTE **)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 56);
  if (*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v5 < v15)
      goto LABEL_24;
    v16 = *(_BYTE **)(a1 + 40);
    v17 = v5 - v16;
    v18 = v5 - v16 + 1;
    if (v18 < 0)
      goto LABEL_88;
    v19 = v15 - (_QWORD)v16;
    if (2 * v19 > v18)
      v18 = 2 * v19;
    if (v19 >= 0x3FFFFFFFFFFFFFFFLL)
      v20 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v20 = v18;
    if (v20)
    {
      v11 = operator new(v20);
      v12 = &v11[v17];
      v13 = &v11[v20];
      v11[v17] = v2;
      v14 = (uint64_t)&v11[v17 + 1];
      if (v5 == v16)
        goto LABEL_49;
    }
    else
    {
      v11 = 0;
      v12 = (char *)(v5 - v16);
      v13 = 0;
      *(_BYTE *)v17 = a2;
      v14 = v17 + 1;
      if (v5 == v16)
        goto LABEL_49;
    }
    if (v17 >= 8 && (unint64_t)(v16 - v11) >= 0x20)
    {
      if (v17 >= 0x20)
      {
        v27 = v17 & 0xFFFFFFFFFFFFFFE0;
        v37 = (__int128 *)(v5 - 16);
        v38 = &v11[v5 - 16 - v16];
        v39 = v17 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v40 = *v37;
          *(v38 - 1) = *(v37 - 1);
          *v38 = v40;
          v38 -= 2;
          v37 -= 2;
          v39 -= 32;
        }
        while (v39);
        if (v17 == v27)
          goto LABEL_86;
        if ((v17 & 0x18) == 0)
        {
          v12 -= v27;
          v5 -= v27;
          goto LABEL_80;
        }
      }
      else
      {
        v27 = 0;
      }
      v12 -= v17 & 0xFFFFFFFFFFFFFFF8;
      v41 = &v5[-v27 - 8];
      v42 = &v11[v41 - v16];
      v43 = v27 - (v17 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        v44 = *(_QWORD *)v41;
        v41 -= 8;
        *v42-- = v44;
        v43 += 8;
      }
      while (v43);
      v5 -= v17 & 0xFFFFFFFFFFFFFFF8;
      if (v17 == (v17 & 0xFFFFFFFFFFFFFFF8))
        goto LABEL_86;
    }
LABEL_80:
    v55 = v12 - 1;
    do
    {
      v56 = *--v5;
      *v55-- = v56;
    }
    while (v5 != v16);
    goto LABEL_86;
  }
  if ((unint64_t)v5 < v15)
    goto LABEL_24;
  v22 = *(_BYTE **)(a1 + 40);
  v23 = v5 - v22;
  v24 = v5 - v22 + 1;
  if (v24 < 0)
    goto LABEL_88;
  v25 = v15 - (_QWORD)v22;
  if (2 * v25 > v24)
    v24 = 2 * v25;
  if (v25 >= 0x3FFFFFFFFFFFFFFFLL)
    v26 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v26 = v24;
  if (!v26)
  {
    v11 = 0;
    v12 = (char *)(v5 - v22);
    v13 = 0;
    *(_BYTE *)v23 = a2;
    v14 = v23 + 1;
    if (v5 == v22)
      goto LABEL_49;
LABEL_45:
    if (v23 < 8 || (unint64_t)(v22 - v11) < 0x20)
      goto LABEL_84;
    if (v23 >= 0x20)
    {
      v28 = v23 & 0xFFFFFFFFFFFFFFE0;
      v45 = (__int128 *)(v5 - 16);
      v46 = &v11[v5 - 16 - v22];
      v47 = v23 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        v48 = *v45;
        *(v46 - 1) = *(v45 - 1);
        *v46 = v48;
        v46 -= 2;
        v45 -= 2;
        v47 -= 32;
      }
      while (v47);
      if (v23 == v28)
        goto LABEL_86;
      if ((v23 & 0x18) == 0)
      {
        v12 -= v28;
        v5 -= v28;
        goto LABEL_84;
      }
    }
    else
    {
      v28 = 0;
    }
    v12 -= v23 & 0xFFFFFFFFFFFFFFF8;
    v49 = &v5[-v28 - 8];
    v50 = &v11[v49 - v22];
    v51 = v28 - (v23 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      v52 = *(_QWORD *)v49;
      v49 -= 8;
      *v50-- = v52;
      v51 += 8;
    }
    while (v51);
    v5 -= v23 & 0xFFFFFFFFFFFFFFF8;
    if (v23 == (v23 & 0xFFFFFFFFFFFFFFF8))
      goto LABEL_86;
LABEL_84:
    v57 = v12 - 1;
    do
    {
      v58 = *--v5;
      *v57-- = v58;
    }
    while (v5 != v22);
    goto LABEL_86;
  }
  v11 = operator new(v26);
  v12 = &v11[v23];
  v13 = &v11[v26];
  v11[v23] = v2;
  v14 = (uint64_t)&v11[v23 + 1];
  if (v5 != v22)
    goto LABEL_45;
LABEL_49:
  *(_QWORD *)(a1 + 40) = v12;
  *(_QWORD *)(a1 + 48) = v14;
  *(_QWORD *)(a1 + 56) = v13;
  if (!v5)
  {
LABEL_50:
    *(_QWORD *)(a1 + 48) = v14;
    return;
  }
LABEL_87:
  operator delete(v5);
  *(_QWORD *)(a1 + 48) = v14;
}

uint64_t std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6)
{
  const std::locale *v11;
  __int128 v12;
  std::string::size_type size;
  std::string *v14;
  BOOL v15;
  std::locale v17;
  std::string v18;

  *(_QWORD *)(a1 + 8) = a3;
  v11 = (const std::locale *)(a1 + 16);
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  v12 = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 24) = v12;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_BYTE *)(a1 + 168) = a4;
  *(_BYTE *)(a1 + 169) = a5;
  *(_BYTE *)(a1 + 170) = a6;
  std::locale::locale(&v17, v11);
  std::locale::name(&v18, &v17);
  size = HIBYTE(v18.__r_.__value_.__r.__words[2]);
  if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v18.__r_.__value_.__l.__size_;
  if (size == 1)
  {
    v14 = (std::string *)v18.__r_.__value_.__r.__words[0];
    if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v14 = &v18;
    v15 = v14->__r_.__value_.__s.__data_[0] != 67;
    if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
      goto LABEL_9;
  }
  else
  {
    v15 = 1;
    if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
LABEL_9:
      operator delete(v18.__r_.__value_.__l.__data_);
  }
  std::locale::~locale(&v17);
  *(_BYTE *)(a1 + 171) = v15;
  return a1;
}

void sub_2129DADF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  uint64_t v9;
  std::locale *v10;
  void **v11;
  void **v12;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  std::locale::~locale(&a9);
  std::vector<std::string>::~vector[abi:ne180100]((void **)(v9 + 136));
  v14 = *(void **)(v9 + 112);
  if (v14)
  {
    *(_QWORD *)(v9 + 120) = v14;
    operator delete(v14);
    std::vector<std::pair<std::string,std::string>>::~vector[abi:ne180100](v11);
    v15 = *(void **)(v9 + 64);
    if (!v15)
    {
LABEL_3:
      v16 = *v12;
      if (!*v12)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else
  {
    std::vector<std::pair<std::string,std::string>>::~vector[abi:ne180100](v11);
    v15 = *(void **)(v9 + 64);
    if (!v15)
      goto LABEL_3;
  }
  *(_QWORD *)(v9 + 72) = v15;
  operator delete(v15);
  v16 = *v12;
  if (!*v12)
  {
LABEL_5:
    std::locale::~locale(v10);
    v17 = *(_QWORD *)(v9 + 8);
    if (v17)
      (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
    _Unwind_Resume(a1);
  }
LABEL_4:
  *(_QWORD *)(v9 + 48) = v16;
  operator delete(v16);
  goto LABEL_5;
}

void **std::vector<std::pair<std::string,std::string>>::~vector[abi:ne180100](void **a1)
{
  void **v2;
  void **v3;
  void *v4;

  v2 = (void **)*a1;
  if (*a1)
  {
    v3 = (void **)a1[1];
    v4 = *a1;
    if (v3 == v2)
    {
LABEL_11:
      a1[1] = v2;
      operator delete(v4);
      return a1;
    }
    while (1)
    {
      if (*((char *)v3 - 1) < 0)
      {
        operator delete(*(v3 - 3));
        if (*((char *)v3 - 25) < 0)
LABEL_9:
          operator delete(*(v3 - 6));
      }
      else if (*((char *)v3 - 25) < 0)
      {
        goto LABEL_9;
      }
      v3 -= 6;
      if (v3 == v2)
      {
        v4 = *a1;
        goto LABEL_11;
      }
    }
  }
  return a1;
}

void std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  std::locale *v1;

  v1 = std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(a1);
  operator delete(v1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__exec(const std::__bracket_expression<char, std::regex_traits<char>> *this, std::__bracket_expression<char, std::regex_traits<char>>::__state *a2)
{
  std::__bracket_expression<char, std::regex_traits<char>>::__state *v2;
  char *current;
  char *last;
  char v6;
  char v7;
  std::string::size_type size;
  int v9;
  std::string *p_s;
  uint64_t v11;
  _BOOL4 negate;
  std::string::size_type v13;
  std::vector<std::pair<char, char>>::pointer begin;
  uint64_t v15;
  uint64_t v16;
  char *p_second;
  std::vector<std::pair<std::string, std::string>>::pointer v19;
  char v20;
  int64_t v21;
  uint64_t v22;
  unint64_t v23;
  std::string *v24;
  char v25;
  std::string::size_type v26;
  uint64_t v27;
  unsigned __int8 *v28;
  BOOL v29;
  std::string::size_type v30;
  unsigned __int8 v31;
  std::vector<char>::pointer v32;
  unint64_t v33;
  int v34;
  std::regex_traits<char>::char_class_type v35;
  char v36;
  int v37;
  std::vector<char>::pointer end;
  std::vector<char>::pointer v39;
  char *v40;
  std::vector<std::pair<std::string, std::string>>::pointer v41;
  std::vector<std::pair<std::string, std::string>>::pointer v42;
  unsigned int v43;
  int64_t v44;
  uint64_t v45;
  unint64_t v46;
  std::string *v47;
  std::string::size_type v48;
  uint64_t v49;
  unsigned __int8 *v50;
  BOOL v51;
  int v52;
  char *v53;
  size_t v54;
  size_t v55;
  int v56;
  int v57;
  char *v58;
  size_t v59;
  size_t v60;
  int v61;
  int v62;
  char *v63;
  size_t v64;
  size_t v65;
  int v66;
  int v67;
  char *v68;
  size_t v69;
  size_t v70;
  int v71;
  int v72;
  std::vector<std::string>::pointer v73;
  uint64_t v74;
  int64_t v75;
  unint64_t v76;
  unint64_t v77;
  const void *v78;
  size_t v79;
  std::string::size_type v80;
  uint64_t v81;
  BOOL v82;
  std::string *v83;
  std::string::size_type v84;
  int v85;
  std::string *v86;
  uint64_t v87;
  const void *v88;
  size_t v89;
  std::regex_traits<char>::char_class_type v90;
  int v91;
  std::string *v92;
  size_t v93;
  std::__bracket_expression<char, std::regex_traits<char>>::__state *v94;
  std::vector<std::string>::pointer v95;
  int v96;
  int64_t v97;
  unint64_t v98;
  size_t v99;
  std::string::size_type v100;
  uint64_t v101;
  uint64_t v102;
  BOOL v103;
  std::string *v104;
  std::string::size_type v105;
  int v106;
  std::string *v107;
  uint64_t v108;
  uint64_t v109;
  const void *v110;
  uint64_t v111;
  std::string::size_type v112;
  int v113;
  std::vector<std::string>::pointer v114;
  std::regex_traits<char>::char_class_type mask;
  const std::ctype_base::mask *tab;
  std::ctype_base::mask v117;
  std::regex_traits<char>::char_class_type neg_mask;
  int v119;
  std::__node<char> *first;
  int v121;
  std::string::size_type v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t v125;
  std::string::value_type *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  int v130;
  std::__bracket_expression<char, std::regex_traits<char>>::__state *v131;
  uint64_t v132;
  _BOOL4 v133;
  std::string __p;
  __int16 __src;
  std::string v136;
  std::string __s;

  v2 = a2;
  current = a2->__current_;
  last = a2->__last_;
  if (current == last)
  {
    v11 = 0;
    negate = this->__negate_;
    goto LABEL_265;
  }
  if (!this->__might_have_digraph_ || current + 1 == last)
    goto LABEL_43;
  v6 = *current;
  LOBYTE(__src) = *current;
  v7 = current[1];
  HIBYTE(__src) = v7;
  if (this->__icase_)
  {
    LOBYTE(__src) = ((uint64_t (*)(const std::ctype<char> *, _QWORD))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v6);
    HIBYTE(__src) = ((uint64_t (*)(const std::ctype<char> *, _QWORD))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v7);
  }
  __s.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  __s.__r_.__value_.__r.__words[2] = 0x2AAAAAAAAAAAAAALL;
  __s.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAA00AAAALL;
  LOWORD(__s.__r_.__value_.__l.__data_) = __src;
  std::__get_collation_name(&v136, (const char *)&__s);
  __p = v136;
  size = HIBYTE(v136.__r_.__value_.__r.__words[2]);
  v9 = SHIBYTE(v136.__r_.__value_.__r.__words[2]);
  if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v136.__r_.__value_.__l.__size_;
  if (size)
    goto LABEL_9;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    v13 = __s.__r_.__value_.__l.__size_;
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
    if (__s.__r_.__value_.__l.__size_ >= 3)
    {
LABEL_11:
      operator delete(p_s);
      goto LABEL_16;
    }
    goto LABEL_169;
  }
  v13 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  if (HIBYTE(__s.__r_.__value_.__r.__words[2]) < 3u)
  {
    p_s = &__s;
LABEL_169:
    (*(void (**)(std::string *__return_ptr, const std::collate<char> *, std::string *, char *))(*(_QWORD *)this->__traits_.__col_ + 32))(&v136, this->__traits_.__col_, p_s, (char *)p_s + v13);
    if (v9 < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    __p = v136;
    if (SHIBYTE(v136.__r_.__value_.__r.__words[2]) < 0)
    {
      if (__p.__r_.__value_.__l.__size_ == 1 || __p.__r_.__value_.__l.__size_ == 12)
      {
        if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v92 = &__s;
        else
          v92 = (std::string *)__s.__r_.__value_.__r.__words[0];
        if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v93 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
        else
          v93 = __s.__r_.__value_.__l.__size_;
        std::string::__assign_no_alias<false>((void **)&__p.__r_.__value_.__l.__data_, v92, v93);
      }
      else
      {
        *__p.__r_.__value_.__l.__data_ = 0;
        __p.__r_.__value_.__l.__size_ = 0;
      }
    }
    else if (HIBYTE(v136.__r_.__value_.__r.__words[2]) == 1 || HIBYTE(v136.__r_.__value_.__r.__words[2]) == 12)
    {
      if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
        std::string::__assign_no_alias<true>(&__p, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
      else
        __p = __s;
    }
    else
    {
      __p.__r_.__value_.__s.__data_[0] = 0;
      *((_BYTE *)&__p.__r_.__value_.__s + 23) = 0;
    }
LABEL_9:
    if ((SHIBYTE(__s.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_16;
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
    goto LABEL_11;
  }
LABEL_16:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    v30 = __p.__r_.__value_.__l.__size_;
    operator delete(__p.__r_.__value_.__l.__data_);
    if (v30)
      goto LABEL_18;
LABEL_43:
    negate = 0;
    v11 = 1;
    v31 = *v2->__current_;
    __p.__r_.__value_.__s.__data_[0] = v31;
    if (!this->__icase_)
      goto LABEL_45;
    goto LABEL_44;
  }
  if (!*((_BYTE *)&__p.__r_.__value_.__s + 23))
    goto LABEL_43;
LABEL_18:
  begin = this->__digraphs_.__begin_;
  v15 = (char *)this->__digraphs_.__end_ - (char *)begin;
  if (v15)
  {
    v16 = v15 >> 1;
    if ((unint64_t)(v15 >> 1) <= 1)
      v16 = 1;
    p_second = &begin->second;
    while (__src != *(p_second - 1) || HIBYTE(__src) != *p_second)
    {
      p_second += 2;
      if (!--v16)
        goto LABEL_27;
    }
    goto LABEL_262;
  }
LABEL_27:
  if (!this->__collate_ || this->__ranges_.__begin_ == this->__ranges_.__end_)
  {
    negate = 0;
    goto LABEL_200;
  }
  memset(&v136, 170, sizeof(v136));
  __s.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  __s.__r_.__value_.__r.__words[2] = 0x2AAAAAAAAAAAAAALL;
  __s.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAA00AAAALL;
  LOWORD(__s.__r_.__value_.__l.__data_) = __src;
  (*(void (**)(std::string *__return_ptr, const std::collate<char> *, std::string *, std::string::value_type *))(*(_QWORD *)this->__traits_.__col_ + 32))(&v136, this->__traits_.__col_, &__s, &__s.__r_.__value_.__s.__data_[2]);
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
  v19 = this->__ranges_.__begin_;
  v20 = HIBYTE(v136.__r_.__value_.__r.__words[2]);
  v21 = (char *)this->__ranges_.__end_ - (char *)v19;
  if (!v21)
  {
    v29 = 0;
    v72 = 0;
    negate = 0;
    goto LABEL_197;
  }
  v131 = v2;
  v22 = 0;
  v23 = v21 / 48;
  if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v24 = &v136;
  else
    v24 = (std::string *)v136.__r_.__value_.__r.__words[0];
  v25 = HIBYTE(v136.__r_.__value_.__r.__words[2]);
  if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v26 = HIBYTE(v136.__r_.__value_.__r.__words[2]);
  else
    v26 = v136.__r_.__value_.__l.__size_;
  if (v23 <= 1)
    v27 = 1;
  else
    v27 = v21 / 48;
  v28 = (unsigned __int8 *)&v19->second.__r_.__value_.__r.__words[2] + 7;
  v29 = 1;
  do
  {
    v62 = (char)*(v28 - 24);
    if (v62 >= 0)
      v63 = (char *)(v28 - 47);
    else
      v63 = *(char **)(v28 - 47);
    if (v62 >= 0)
      v64 = *(v28 - 24);
    else
      v64 = *(_QWORD *)(v28 - 39);
    if (v26 >= v64)
      v65 = v64;
    else
      v65 = v26;
    v66 = memcmp(v63, v24, v65);
    if (v66)
    {
      if ((v66 & 0x80000000) == 0)
        goto LABEL_107;
    }
    else if (v64 > v26)
    {
      goto LABEL_107;
    }
    v67 = (char)*v28;
    if (v67 >= 0)
      v68 = (char *)(v28 - 23);
    else
      v68 = *(char **)(v28 - 23);
    if (v67 >= 0)
      v69 = *v28;
    else
      v69 = *(_QWORD *)(v28 - 15);
    if (v69 >= v26)
      v70 = v26;
    else
      v70 = v69;
    v71 = memcmp(v24, v68, v70);
    if (v71)
    {
      if (v71 < 0)
      {
LABEL_132:
        negate = 1;
        v72 = 5;
        goto LABEL_186;
      }
    }
    else if (v26 <= v69)
    {
      goto LABEL_132;
    }
LABEL_107:
    v29 = ++v22 < v23;
    v28 += 48;
  }
  while (v27 != v22);
  v72 = 0;
  negate = 0;
LABEL_186:
  v2 = v131;
  v20 = v25;
LABEL_197:
  if (v20 < 0)
    operator delete(v136.__r_.__value_.__l.__data_);
  if (v29)
    goto LABEL_241;
LABEL_200:
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_)
    goto LABEL_244;
  v94 = v2;
  memset(&__s, 170, sizeof(__s));
  std::regex_traits<char>::__transform_primary<char *>(&__s, (uint64_t)&this->__traits_, &__src, &v136);
  v95 = this->__equivalences_.__begin_;
  v96 = SHIBYTE(__s.__r_.__value_.__r.__words[2]);
  v97 = (char *)this->__equivalences_.__end_ - (char *)v95;
  if (!v97)
  {
    v103 = 0;
    v72 = 0;
    v2 = v94;
    goto LABEL_238;
  }
  v133 = negate;
  v98 = v97 / 24;
  v99 = __s.__r_.__value_.__l.__size_;
  v100 = (__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
       ? HIBYTE(__s.__r_.__value_.__r.__words[2])
       : __s.__r_.__value_.__l.__size_;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    v132 = SHIBYTE(__s.__r_.__value_.__r.__words[2]);
    v109 = 0;
    v110 = (const void *)__s.__r_.__value_.__r.__words[0];
    v111 = v98 <= 1 ? 1 : v97 / 24;
    v103 = 1;
    do
    {
      v112 = HIBYTE(v95->__r_.__value_.__r.__words[2]);
      v113 = (char)v112;
      if ((v112 & 0x80u) != 0)
        v112 = v95->__r_.__value_.__l.__size_;
      if (v100 == v112)
      {
        v114 = v113 >= 0 ? v95 : (std::vector<std::string>::pointer)v95->__r_.__value_.__r.__words[0];
        if (!memcmp(v110, v114, v99))
        {
          negate = 1;
          v72 = 5;
          v2 = v94;
          goto LABEL_237;
        }
      }
      v103 = ++v109 < v98;
      ++v95;
    }
    while (v111 != v109);
    v72 = 0;
    v2 = v94;
    negate = v133;
LABEL_237:
    v96 = v132;
  }
  else
  {
    if (*((_BYTE *)&__s.__r_.__value_.__s + 23))
    {
      v101 = 0;
      if (v98 <= 1)
        v102 = 1;
      else
        v102 = v97 / 24;
      v103 = 1;
      do
      {
        v104 = &v95[v101];
        v105 = HIBYTE(v104->__r_.__value_.__r.__words[2]);
        v106 = (char)v105;
        if ((v105 & 0x80u) != 0)
          v105 = v104->__r_.__value_.__l.__size_;
        if (v100 == v105)
        {
          if (v106 < 0)
            v104 = (std::string *)v104->__r_.__value_.__r.__words[0];
          v107 = &__s;
          v108 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
          while (v107->__r_.__value_.__s.__data_[0] == v104->__r_.__value_.__s.__data_[0])
          {
            v107 = (std::string *)((char *)v107 + 1);
            v104 = (std::string *)((char *)v104 + 1);
            if (!--v108)
            {
              negate = 1;
              v72 = 5;
              v2 = v94;
              goto LABEL_238;
            }
          }
        }
        v103 = ++v101 < v98;
      }
      while (v101 != v102);
      v103 = 0;
      v72 = 0;
      v2 = v94;
      negate = v133;
      goto LABEL_238;
    }
    v122 = HIBYTE(v95->__r_.__value_.__r.__words[2]);
    if ((v122 & 0x80u) != 0)
      v122 = v95->__r_.__value_.__l.__size_;
    if (v122 == HIBYTE(__s.__r_.__value_.__r.__words[2]))
    {
      negate = 1;
      v2 = v94;
      goto LABEL_264;
    }
    v123 = 0;
    v124 = v98 <= 1 ? 1 : v98;
    v125 = v124 - 1;
    v126 = &v95[1].__r_.__value_.__s.__data_[8];
    v2 = v94;
    while (v125 != v123)
    {
      ++v123;
      v127 = v126[15];
      v129 = *(_QWORD *)v126;
      v126 += 24;
      v128 = v129;
      if ((v127 & 0x80u) != 0)
        v127 = v128;
      if (v100 == v127)
      {
        v103 = v123 < v98;
        negate = 1;
        v72 = 5;
        goto LABEL_238;
      }
    }
    v103 = 0;
    v72 = 0;
    negate = v133;
  }
LABEL_238:
  if (v96 < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
  if (!v103)
  {
LABEL_244:
    if ((char)__src < 0)
    {
      neg_mask = this->__neg_mask_;
    }
    else
    {
      mask = this->__mask_;
      tab = this->__traits_.__ct_->__tab_;
      v117 = tab[__src];
      if (((v117 & mask) != 0 || __src == 95 && (mask & 0x80) != 0)
        && (SHIBYTE(__src) & 0x80000000) == 0
        && ((tab[HIBYTE(__src)] & mask) != 0 || (mask & 0x80) != 0 && HIBYTE(__src) == 95))
      {
        goto LABEL_262;
      }
      neg_mask = this->__neg_mask_;
      if ((neg_mask & v117) != 0 || __src == 95 && (neg_mask & 0x80) != 0)
      {
LABEL_261:
        v119 = negate;
LABEL_263:
        negate = v119;
        goto LABEL_264;
      }
    }
    if ((SHIBYTE(__src) & 0x80000000) == 0)
    {
      if ((this->__traits_.__ct_->__tab_[HIBYTE(__src)] & neg_mask) == 0)
      {
        v119 = 1;
        if (HIBYTE(__src) != 95 || (neg_mask & 0x80) == 0)
          goto LABEL_263;
      }
      goto LABEL_261;
    }
LABEL_262:
    v119 = 1;
    goto LABEL_263;
  }
LABEL_241:
  if (v72)
  {
LABEL_264:
    v11 = 2;
    goto LABEL_265;
  }
  v11 = 2;
  v31 = *v2->__current_;
  __p.__r_.__value_.__s.__data_[0] = v31;
  if (this->__icase_)
  {
LABEL_44:
    v31 = ((uint64_t (*)(const std::ctype<char> *, _QWORD))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, (char)v31);
    __p.__r_.__value_.__s.__data_[0] = v31;
  }
LABEL_45:
  v32 = this->__chars_.__begin_;
  v33 = this->__chars_.__end_ - v32;
  if (v33)
  {
    if (v33 <= 1)
      v33 = 1;
    while (1)
    {
      v34 = *v32++;
      if (v34 == v31)
        break;
      if (!--v33)
        goto LABEL_50;
    }
LABEL_184:
    negate = 1;
    goto LABEL_265;
  }
LABEL_50:
  v35 = this->__neg_mask_;
  if (v35 || this->__neg_chars_.__begin_ != this->__neg_chars_.__end_)
  {
    if ((v31 & 0x80) != 0 || (this->__traits_.__ct_->__tab_[v31] & v35) == 0)
    {
      v37 = (v35 >> 7) & 1;
      v36 = v31 == 95 ? v37 : 0;
    }
    else
    {
      v36 = 1;
    }
    end = this->__neg_chars_.__end_;
    v39 = (std::vector<char>::pointer)memchr(this->__neg_chars_.__begin_, (char)v31, end - this->__neg_chars_.__begin_);
    v40 = v39 ? v39 : end;
    if ((v36 & 1) == 0 && v40 == end)
      goto LABEL_184;
  }
  v41 = this->__ranges_.__begin_;
  v42 = this->__ranges_.__end_;
  if (v41 == v42)
    goto LABEL_137;
  memset(&v136, 170, sizeof(v136));
  v133 = negate;
  if (!this->__collate_)
  {
    v43 = 1;
    *((_BYTE *)&v136.__r_.__value_.__s + 23) = 1;
    LOWORD(v136.__r_.__value_.__l.__data_) = v31;
    v44 = (char *)v42 - (char *)v41;
    if (v44)
      goto LABEL_68;
LABEL_164:
    v51 = 0;
    if ((v43 & 0x80) != 0)
      goto LABEL_135;
    goto LABEL_136;
  }
  __s.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  __s.__r_.__value_.__r.__words[2] = 0x1AAAAAAAAAAAAAALL;
  __s.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAA00AALL;
  __s.__r_.__value_.__s.__data_[0] = v31;
  (*(void (**)(std::string *__return_ptr, const std::collate<char> *, std::string *, std::string::value_type *))(*(_QWORD *)this->__traits_.__col_ + 32))(&v136, this->__traits_.__col_, &__s, &__s.__r_.__value_.__s.__data_[1]);
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
  v41 = this->__ranges_.__begin_;
  v43 = HIBYTE(v136.__r_.__value_.__r.__words[2]);
  v44 = (char *)this->__ranges_.__end_ - (char *)v41;
  if (!v44)
    goto LABEL_164;
LABEL_68:
  v131 = v2;
  v132 = v11;
  v45 = 0;
  v46 = v44 / 48;
  LOBYTE(v130) = v43;
  if ((v43 & 0x80u) == 0)
    v47 = &v136;
  else
    v47 = (std::string *)v136.__r_.__value_.__r.__words[0];
  if ((v43 & 0x80u) == 0)
    v48 = v43;
  else
    v48 = v136.__r_.__value_.__l.__size_;
  if (v46 <= 1)
    v49 = 1;
  else
    v49 = v44 / 48;
  v50 = (unsigned __int8 *)&v41->second.__r_.__value_.__r.__words[2] + 7;
  v51 = 1;
  while (2)
  {
    v52 = (char)*(v50 - 24);
    if (v52 >= 0)
      v53 = (char *)(v50 - 47);
    else
      v53 = *(char **)(v50 - 47);
    if (v52 >= 0)
      v54 = *(v50 - 24);
    else
      v54 = *(_QWORD *)(v50 - 39);
    if (v48 >= v54)
      v55 = v54;
    else
      v55 = v48;
    v56 = memcmp(v53, v47, v55);
    if (v56)
    {
      if (v56 < 0)
        goto LABEL_93;
    }
    else if (v54 <= v48)
    {
LABEL_93:
      v57 = (char)*v50;
      if (v57 >= 0)
        v58 = (char *)(v50 - 23);
      else
        v58 = *(char **)(v50 - 23);
      if (v57 >= 0)
        v59 = *v50;
      else
        v59 = *(_QWORD *)(v50 - 15);
      if (v59 >= v48)
        v60 = v48;
      else
        v60 = v59;
      v61 = memcmp(v47, v58, v60);
      if (v61)
      {
        if (v61 < 0)
        {
LABEL_104:
          negate = 1;
          v2 = v131;
          v11 = v132;
          if ((v130 & 0x80) == 0)
            goto LABEL_136;
          goto LABEL_135;
        }
      }
      else if (v48 <= v59)
      {
        goto LABEL_104;
      }
    }
    v51 = ++v45 < v46;
    v50 += 48;
    if (v49 != v45)
      continue;
    break;
  }
  v2 = v131;
  v11 = v132;
  negate = v133;
  if ((v130 & 0x80) == 0)
    goto LABEL_136;
LABEL_135:
  operator delete(v136.__r_.__value_.__l.__data_);
LABEL_136:
  if (v51)
    goto LABEL_265;
LABEL_137:
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_)
  {
LABEL_179:
    if ((v31 & 0x80) != 0)
      goto LABEL_265;
    v90 = this->__mask_;
    if ((this->__traits_.__ct_->__tab_[v31] & v90) == 0)
    {
      v91 = (v90 >> 7) & 1;
      if (v31 != 95)
        v91 = 0;
      if (v91 != 1)
        goto LABEL_265;
    }
    goto LABEL_184;
  }
  v132 = v11;
  memset(&__s, 170, sizeof(__s));
  std::regex_traits<char>::__transform_primary<char *>(&__s, (uint64_t)&this->__traits_, &__p, &__p.__r_.__value_.__s.__data_[1]);
  v73 = this->__equivalences_.__begin_;
  v74 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  v75 = (char *)this->__equivalences_.__end_ - (char *)v73;
  if (!v75)
  {
    if ((*((_BYTE *)&__s.__r_.__value_.__s + 23) & 0x80) != 0)
      operator delete(__s.__r_.__value_.__l.__data_);
LABEL_178:
    v31 = __p.__r_.__value_.__s.__data_[0];
    goto LABEL_179;
  }
  v131 = v2;
  v76 = 0;
  v77 = v75 / 24;
  v79 = __s.__r_.__value_.__l.__size_;
  v78 = (const void *)__s.__r_.__value_.__r.__words[0];
  if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v80 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  else
    v80 = __s.__r_.__value_.__l.__size_;
  if (v77 <= 1)
    v81 = 1;
  else
    v81 = v75 / 24;
  v82 = 1;
  while (2)
  {
    v83 = &v73[v76];
    v84 = HIBYTE(v83->__r_.__value_.__r.__words[2]);
    v85 = (char)v84;
    if ((v84 & 0x80u) != 0)
      v84 = v83->__r_.__value_.__l.__size_;
    if (v80 != v84)
    {
LABEL_158:
      if (++v76 == v81)
      {
        if ((v74 & 0x80) != 0)
LABEL_276:
          operator delete(__s.__r_.__value_.__l.__data_);
        v2 = v131;
        v11 = v132;
        goto LABEL_178;
      }
      goto LABEL_162;
    }
    if (v85 >= 0)
      v86 = &v73[v76];
    else
      v86 = (std::string *)v83->__r_.__value_.__r.__words[0];
    if ((v74 & 0x80) == 0)
    {
      if (!(_DWORD)v74)
      {
LABEL_166:
        negate = 1;
        v2 = v131;
        v11 = v132;
        if (!v82)
          goto LABEL_178;
        goto LABEL_265;
      }
      v87 = 0;
      while (__s.__r_.__value_.__s.__data_[v87] == v86->__r_.__value_.__s.__data_[v87])
      {
        if (v74 == ++v87)
          goto LABEL_166;
      }
      goto LABEL_158;
    }
    LOBYTE(v130) = v82;
    v88 = v78;
    v89 = v79;
    if (memcmp(v78, v86, v79))
    {
      ++v76;
      v79 = v89;
      v78 = v88;
      if (v76 == v81)
        goto LABEL_276;
LABEL_162:
      v82 = v76 < v77;
      continue;
    }
    break;
  }
  operator delete(__s.__r_.__value_.__l.__data_);
  negate = 1;
  v2 = v131;
  v11 = v132;
  if ((v130 & 1) == 0)
    goto LABEL_178;
LABEL_265:
  if (negate == this->__negate_)
  {
    first = 0;
    v121 = -993;
  }
  else
  {
    v2->__current_ += v11;
    first = this->__first_;
    v121 = -995;
  }
  v2->__do_ = v121;
  v2->__node_ = first;
}

void sub_2129DBB28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a18 < 0)
  {
    operator delete(__p);
    if (a28 < 0)
    {
LABEL_5:
      operator delete(a23);
      _Unwind_Resume(a1);
    }
  }
  else if (a28 < 0)
  {
    goto LABEL_5;
  }
  _Unwind_Resume(a1);
}

uint64_t std::pair<std::string,std::string>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
  {
    operator delete(*(void **)(a1 + 24));
    if ((*(char *)(a1 + 23) & 0x80000000) == 0)
      return a1;
  }
  else if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    return a1;
  }
  operator delete(*(void **)a1);
  return a1;
}

std::locale *std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  std::locale::__imp *locale;
  std::locale::__imp *v3;
  std::locale::__imp *v4;
  std::locale::__imp *v5;
  std::locale::__imp *v6;
  std::locale::__imp *v7;
  std::locale::__imp *v8;
  std::locale::__imp *v9;
  std::locale::__imp *v10;
  std::locale::__imp *v11;

  locale = a1[17].__locale_;
  if (locale)
  {
    v3 = a1[18].__locale_;
    v4 = a1[17].__locale_;
    if (v3 != locale)
    {
      do
      {
        if (*((char *)v3 - 1) < 0)
          operator delete(*((void **)v3 - 3));
        v3 = (std::locale::__imp *)((char *)v3 - 24);
      }
      while (v3 != locale);
      v4 = a1[17].__locale_;
    }
    a1[18].__locale_ = locale;
    operator delete(v4);
  }
  v5 = a1[14].__locale_;
  if (v5)
  {
    a1[15].__locale_ = v5;
    operator delete(v5);
  }
  v6 = a1[11].__locale_;
  if (v6)
  {
    v7 = a1[12].__locale_;
    v8 = a1[11].__locale_;
    if (v7 == v6)
    {
LABEL_21:
      a1[12].__locale_ = v6;
      operator delete(v8);
      goto LABEL_22;
    }
    while (1)
    {
      if (*((char *)v7 - 1) < 0)
      {
        operator delete(*((void **)v7 - 3));
        if (*((char *)v7 - 25) < 0)
LABEL_19:
          operator delete(*((void **)v7 - 6));
      }
      else if (*((char *)v7 - 25) < 0)
      {
        goto LABEL_19;
      }
      v7 = (std::locale::__imp *)((char *)v7 - 48);
      if (v7 == v6)
      {
        v8 = a1[11].__locale_;
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v9 = a1[8].__locale_;
  if (v9)
  {
    a1[9].__locale_ = v9;
    operator delete(v9);
  }
  v10 = a1[5].__locale_;
  if (v10)
  {
    a1[6].__locale_ = v10;
    operator delete(v10);
  }
  std::locale::~locale(a1 + 2);
  v11 = a1[1].__locale_;
  if (v11)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v11 + 8))(v11);
  return a1;
}

void std::regex_traits<char>::__transform_primary<char *>(_QWORD *a1, uint64_t a2, _BYTE *__src, _BYTE *a4)
{
  size_t v4;
  void **v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void **v13;
  uint64_t v14;
  int v15;
  _BYTE *v16;
  void *__dst[3];

  v4 = a4 - __src;
  memset(__dst, 170, sizeof(__dst));
  if ((unint64_t)(a4 - __src) >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v4 <= 0x16)
  {
    HIBYTE(__dst[2]) = (_BYTE)a4 - (_BYTE)__src;
    v9 = __dst;
    if (__src == a4)
      goto LABEL_9;
LABEL_8:
    memcpy(v9, __src, v4);
    v9 = (void **)((char *)v9 + v4);
    goto LABEL_9;
  }
  v10 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v4 | 7) != 0x17)
    v10 = v4 | 7;
  v11 = v10 + 1;
  v9 = (void **)operator new(v10 + 1);
  __dst[1] = (void *)v4;
  __dst[2] = (void *)(v11 | 0x8000000000000000);
  __dst[0] = v9;
  if (__src != a4)
    goto LABEL_8;
LABEL_9:
  *(_BYTE *)v9 = 0;
  memset(a1, 170, 24);
  v12 = (char *)HIBYTE(__dst[2]);
  if (SHIBYTE(__dst[2]) >= 0)
    v13 = __dst;
  else
    v13 = (void **)__dst[0];
  if (SHIBYTE(__dst[2]) < 0)
    v12 = (char *)__dst[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a2 + 16) + 32))(*(_QWORD *)(a2 + 16), v13, &v12[(_QWORD)v13]);
  v14 = *((unsigned __int8 *)a1 + 23);
  v15 = (char)v14;
  if ((v14 & 0x80u) != 0)
    v14 = a1[1];
  if (v14 == 1)
  {
LABEL_25:
    if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
      return;
    goto LABEL_26;
  }
  if (v14 == 12)
  {
    if (v15 >= 0)
      v16 = a1;
    else
      v16 = (_BYTE *)*a1;
    v16[11] = v16[3];
    if (SHIBYTE(__dst[2]) < 0)
      goto LABEL_26;
    return;
  }
  if ((v15 & 0x80000000) == 0)
  {
    *(_BYTE *)a1 = 0;
    *((_BYTE *)a1 + 23) = 0;
    goto LABEL_25;
  }
  *(_BYTE *)*a1 = 0;
  a1[1] = 0;
  if (SHIBYTE(__dst[2]) < 0)
LABEL_26:
    operator delete(__dst[0]);
}

void sub_2129DBEB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BF63C4](exception, 5);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_2129DBF0C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  int v7;
  char v9;
  char v10;
  unint64_t v11;
  _BYTE *v12;
  int v13;
  unint64_t v14;
  _BYTE *v15;
  _BYTE *v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  size_t v20;
  _BYTE *v21;
  _BYTE *v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  size_t v26;
  _BYTE *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  _BYTE *v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  size_t v37;
  char *v38;
  char *v39;
  unint64_t v40;
  unint64_t v41;
  __int128 *v42;
  _OWORD *v43;
  unint64_t v44;
  __int128 v45;
  char *v46;
  _QWORD *v47;
  unint64_t v48;
  uint64_t v49;
  __int128 *v50;
  _OWORD *v51;
  unint64_t v52;
  __int128 v53;
  char *v54;
  _QWORD *v55;
  unint64_t v56;
  uint64_t v57;
  __int128 *v58;
  _OWORD *v59;
  unint64_t v60;
  __int128 v61;
  char *v62;
  _QWORD *v63;
  unint64_t v64;
  uint64_t v65;
  char *v66;
  char v67;
  char *v68;
  char v69;
  char *v70;
  char v71;

  if (a2 == a3)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  switch(*a2)
  {
    case 'D':
      v7 = *(_DWORD *)(a5 + 164) | 0x400;
      goto LABEL_10;
    case 'E':
    case 'F':
    case 'G':
    case 'H':
    case 'I':
    case 'J':
    case 'K':
    case 'L':
    case 'M':
    case 'N':
    case 'O':
    case 'P':
    case 'Q':
    case 'R':
    case 'T':
    case 'U':
    case 'V':
    case 'X':
    case 'Y':
    case 'Z':
    case '[':
    case '\\':
    case ']':
    case '^':
    case '_':
    case 'a':
    case 'c':
    case 'e':
    case 'f':
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'q':
    case 'r':
    case 't':
    case 'u':
    case 'v':
      return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(a1, a2, a3, (uint64_t *)a4);
    case 'S':
      v7 = *(_DWORD *)(a5 + 164) | 0x4000;
LABEL_10:
      *(_DWORD *)(a5 + 164) = v7;
      return a2 + 1;
    case 'W':
      *(_DWORD *)(a5 + 164) |= 0x500u;
      if (!*(_BYTE *)(a5 + 169))
      {
        v15 = *(_BYTE **)(a5 + 72);
        v14 = *(_QWORD *)(a5 + 80);
        if (*(_BYTE *)(a5 + 170))
        {
          if ((unint64_t)v15 >= v14)
          {
            v16 = *(_BYTE **)(a5 + 64);
            v17 = v15 - v16;
            v18 = v15 - v16 + 1;
            if (v18 < 0)
              goto LABEL_115;
            v19 = v14 - (_QWORD)v16;
            if (2 * v19 > v18)
              v18 = 2 * v19;
            if (v19 >= 0x3FFFFFFFFFFFFFFFLL)
              v20 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v20 = v18;
            if (v20)
              v21 = operator new(v20);
            else
              v21 = 0;
            v38 = &v21[v17];
            v39 = &v21[v20];
            v21[v17] = 95;
            v28 = (uint64_t)&v21[v17 + 1];
            if (v15 != v16)
            {
              if (v17 >= 8 && (unint64_t)(v16 - v21) >= 0x20)
              {
                if (v17 < 0x20)
                {
                  v40 = 0;
                  goto LABEL_83;
                }
                v40 = v17 & 0xFFFFFFFFFFFFFFE0;
                v50 = (__int128 *)(v15 - 16);
                v51 = &v21[v15 - 16 - v16];
                v52 = v17 & 0xFFFFFFFFFFFFFFE0;
                do
                {
                  v53 = *v50;
                  *(v51 - 1) = *(v50 - 1);
                  *v51 = v53;
                  v51 -= 2;
                  v50 -= 2;
                  v52 -= 32;
                }
                while (v52);
                if (v17 == v40)
                  goto LABEL_109;
                if ((v17 & 0x18) != 0)
                {
LABEL_83:
                  v38 -= v17 & 0xFFFFFFFFFFFFFFF8;
                  v54 = &v15[-v40 - 8];
                  v55 = &v21[v54 - v16];
                  v56 = v40 - (v17 & 0xFFFFFFFFFFFFFFF8);
                  do
                  {
                    v57 = *(_QWORD *)v54;
                    v54 -= 8;
                    *v55-- = v57;
                    v56 += 8;
                  }
                  while (v56);
                  v15 -= v17 & 0xFFFFFFFFFFFFFFF8;
                  if (v17 == (v17 & 0xFFFFFFFFFFFFFFF8))
                    goto LABEL_109;
                  goto LABEL_103;
                }
                v38 -= v40;
                v15 -= v40;
              }
LABEL_103:
              v68 = v38 - 1;
              do
              {
                v69 = *--v15;
                *v68-- = v69;
              }
              while (v15 != v16);
LABEL_109:
              v15 = *(_BYTE **)(a5 + 64);
LABEL_110:
              *(_QWORD *)(a5 + 64) = v21;
              *(_QWORD *)(a5 + 72) = v28;
              *(_QWORD *)(a5 + 80) = v39;
              if (v15)
                operator delete(v15);
              goto LABEL_112;
            }
LABEL_70:
            v21 = v38;
            goto LABEL_110;
          }
LABEL_42:
          *v15 = 95;
          v28 = (uint64_t)(v15 + 1);
LABEL_112:
          *(_QWORD *)(a5 + 72) = v28;
          return a2 + 1;
        }
        if ((unint64_t)v15 < v14)
          goto LABEL_42;
        v33 = *(_BYTE **)(a5 + 64);
        v34 = v15 - v33;
        v35 = v15 - v33 + 1;
        if (v35 < 0)
          goto LABEL_115;
        v36 = v14 - (_QWORD)v33;
        if (2 * v36 > v35)
          v35 = 2 * v36;
        if (v36 >= 0x3FFFFFFFFFFFFFFFLL)
          v37 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v37 = v35;
        if (v37)
          v21 = operator new(v37);
        else
          v21 = 0;
        v38 = &v21[v34];
        v39 = &v21[v37];
        v21[v34] = 95;
        v28 = (uint64_t)&v21[v34 + 1];
        if (v15 == v33)
          goto LABEL_70;
        if (v34 >= 8 && (unint64_t)(v33 - v21) >= 0x20)
        {
          if (v34 < 0x20)
          {
            v41 = 0;
            goto LABEL_91;
          }
          v41 = v34 & 0xFFFFFFFFFFFFFFE0;
          v58 = (__int128 *)(v15 - 16);
          v59 = &v21[v15 - 16 - v33];
          v60 = v34 & 0xFFFFFFFFFFFFFFE0;
          do
          {
            v61 = *v58;
            *(v59 - 1) = *(v58 - 1);
            *v59 = v61;
            v59 -= 2;
            v58 -= 2;
            v60 -= 32;
          }
          while (v60);
          if (v34 == v41)
            goto LABEL_109;
          if ((v34 & 0x18) != 0)
          {
LABEL_91:
            v38 -= v34 & 0xFFFFFFFFFFFFFFF8;
            v62 = &v15[-v41 - 8];
            v63 = &v21[v62 - v33];
            v64 = v41 - (v34 & 0xFFFFFFFFFFFFFFF8);
            do
            {
              v65 = *(_QWORD *)v62;
              v62 -= 8;
              *v63-- = v65;
              v64 += 8;
            }
            while (v64);
            v15 -= v34 & 0xFFFFFFFFFFFFFFF8;
            if (v34 == (v34 & 0xFFFFFFFFFFFFFFF8))
              goto LABEL_109;
            goto LABEL_107;
          }
          v38 -= v41;
          v15 -= v41;
        }
LABEL_107:
        v70 = v38 - 1;
        do
        {
          v71 = *--v15;
          *v70-- = v71;
        }
        while (v15 != v33);
        goto LABEL_109;
      }
      v9 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a5 + 24) + 40))(*(_QWORD *)(a5 + 24), 95);
      v10 = v9;
      v12 = *(_BYTE **)(a5 + 72);
      v11 = *(_QWORD *)(a5 + 80);
      if ((unint64_t)v12 >= v11)
      {
        v22 = *(_BYTE **)(a5 + 64);
        v23 = v12 - v22;
        v24 = v12 - v22 + 1;
        if (v24 >= 0)
        {
          v25 = v11 - (_QWORD)v22;
          if (2 * v25 > v24)
            v24 = 2 * v25;
          if (v25 >= 0x3FFFFFFFFFFFFFFFLL)
            v26 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v26 = v24;
          if (v26)
            v27 = operator new(v26);
          else
            v27 = 0;
          v29 = &v27[v23];
          v30 = &v27[v26];
          v27[v23] = v10;
          v31 = (uint64_t)&v27[v23 + 1];
          if (v12 == v22)
          {
            v27 += v23;
LABEL_99:
            *(_QWORD *)(a5 + 64) = v27;
            *(_QWORD *)(a5 + 72) = v31;
            *(_QWORD *)(a5 + 80) = v30;
            if (v12)
              operator delete(v12);
            *(_QWORD *)(a5 + 72) = v31;
            return a2 + 1;
          }
          if (v23 >= 8 && (unint64_t)(v22 - v27) >= 0x20)
          {
            if (v23 < 0x20)
            {
              v32 = 0;
              goto LABEL_75;
            }
            v32 = v23 & 0xFFFFFFFFFFFFFFE0;
            v42 = (__int128 *)(v12 - 16);
            v43 = &v27[v12 - 16 - v22];
            v44 = v23 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              v45 = *v42;
              *(v43 - 1) = *(v42 - 1);
              *v43 = v45;
              v43 -= 2;
              v42 -= 2;
              v44 -= 32;
            }
            while (v44);
            if (v23 == v32)
              goto LABEL_98;
            if ((v23 & 0x18) != 0)
            {
LABEL_75:
              v29 -= v23 & 0xFFFFFFFFFFFFFFF8;
              v46 = &v12[-v32 - 8];
              v47 = &v27[v46 - v22];
              v48 = v32 - (v23 & 0xFFFFFFFFFFFFFFF8);
              do
              {
                v49 = *(_QWORD *)v46;
                v46 -= 8;
                *v47-- = v49;
                v48 += 8;
              }
              while (v48);
              v12 -= v23 & 0xFFFFFFFFFFFFFFF8;
              if (v23 == (v23 & 0xFFFFFFFFFFFFFFF8))
                goto LABEL_98;
              goto LABEL_96;
            }
            v29 -= v32;
            v12 -= v32;
          }
LABEL_96:
          v66 = v29 - 1;
          do
          {
            v67 = *--v12;
            *v66-- = v67;
          }
          while (v12 != v22);
LABEL_98:
          v12 = *(_BYTE **)(a5 + 64);
          goto LABEL_99;
        }
LABEL_115:
        std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
      }
      *v12 = v9;
      *(_QWORD *)(a5 + 72) = v12 + 1;
      return a2 + 1;
    case 'b':
      if (*(char *)(a4 + 23) < 0)
      {
        *(_QWORD *)(a4 + 8) = 1;
        a4 = *(_QWORD *)a4;
      }
      else
      {
        *(_BYTE *)(a4 + 23) = 1;
      }
      *(_WORD *)a4 = 8;
      return a2 + 1;
    case 'd':
      v13 = *(_DWORD *)(a5 + 160) | 0x400;
      goto LABEL_18;
    case 's':
      v13 = *(_DWORD *)(a5 + 160) | 0x4000;
LABEL_18:
      *(_DWORD *)(a5 + 160) = v13;
      return a2 + 1;
    case 'w':
      *(_DWORD *)(a5 + 160) |= 0x500u;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](a5, 95);
      return a2 + 1;
    default:
      if (*a2)
        return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(a1, a2, a3, (uint64_t *)a4);
      if (*(char *)(a4 + 23) < 0)
      {
        *(_QWORD *)(a4 + 8) = 1;
        a4 = *(_QWORD *)a4;
      }
      else
      {
        *(_BYTE *)(a4 + 23) = 1;
      }
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 1) = 0;
      return a2 + 1;
  }
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3, uint64_t *a4)
{
  std::basic_regex<char>::value_type v5;
  std::basic_regex<char>::value_type v7;
  std::basic_regex<char>::value_type *v8;
  std::basic_regex<char>::value_type v9;
  int v10;
  std::basic_regex<char>::value_type v11;

  if (a2 == a3)
LABEL_70:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  v5 = *a2;
  switch(*a2)
  {
    case '"':
    case '/':
    case '\\':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_BYTE *)a4 = v5;
        *((_BYTE *)a4 + 1) = 0;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v5);
        return a2 + 1;
      }
    case 'a':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 7;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 7);
        return a2 + 1;
      }
    case 'b':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 8;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 8);
        return a2 + 1;
      }
    case 'f':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 12;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 12);
        return a2 + 1;
      }
    case 'n':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 10;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 10);
        return a2 + 1;
      }
    case 'r':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 13;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 13);
        return a2 + 1;
      }
    case 't':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 9;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 9);
        return a2 + 1;
      }
    case 'v':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 11;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 11);
        return a2 + 1;
      }
    default:
      if ((v5 & 0xF8) != 0x30)
        goto LABEL_70;
      v7 = *a2 - 48;
      v8 = a2 + 1;
      if (a2 + 1 == a3)
      {
        v8 = a3;
LABEL_42:
        if (a4)
          goto LABEL_43;
LABEL_69:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v7);
        return v8;
      }
      if ((*v8 & 0xF8) != 0x30)
        goto LABEL_42;
      v7 = *v8 + 8 * v7 - 48;
      if (a2 + 2 == a3)
      {
        v8 = a3;
        if (a4)
          goto LABEL_43;
        goto LABEL_69;
      }
      v9 = a2[2];
      v10 = v9 & 0xF8;
      v11 = v9 + 8 * v7 - 48;
      if (v10 == 48)
        v8 = a2 + 3;
      else
        v8 = a2 + 2;
      if (v10 == 48)
        v7 = v11;
      if (!a4)
        goto LABEL_69;
LABEL_43:
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }
      *(_BYTE *)a4 = v7;
      *((_BYTE *)a4 + 1) = 0;
      return v8;
  }
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v5;
  __int16 v6;
  unint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  _WORD *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  char *v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  _OWORD *v33;
  char *v34;
  unint64_t v35;
  __int128 v36;
  __int16 v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  _BYTE *v44;
  char *v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  _OWORD *v50;
  char *v51;
  unint64_t v52;
  __int128 v53;
  __int16 v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char *v58;
  _OWORD *v59;
  char *v60;
  unint64_t v61;
  __int128 v62;
  __int16 v63;

  if (*(_BYTE *)(a1 + 169))
  {
    v5 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
    v6 = v5 | (unsigned __int16)((*(unsigned __int16 (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a3) << 8);
    v8 = *(char **)(a1 + 120);
    v7 = *(_QWORD *)(a1 + 128);
    if ((unint64_t)v8 >= v7)
    {
      v9 = *(char **)(a1 + 112);
      v10 = v8 - v9;
      if (v8 - v9 > -3)
      {
        v11 = v10 >> 1;
        v12 = v7 - (_QWORD)v9;
        if (v12 <= (v10 >> 1) + 1)
          v13 = v11 + 1;
        else
          v13 = v12;
        if (v12 >= 0x7FFFFFFFFFFFFFFELL)
          v14 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v14 = v13;
        if (!v14)
        {
          v15 = 0;
          v16 = (_WORD *)(2 * v11);
          v17 = 0;
          *(_WORD *)(2 * v11) = v6;
          v18 = 2 * v11 + 2;
          v19 = (char *)(v8 - v9);
          if (v8 == v9)
            goto LABEL_64;
LABEL_30:
          v29 = (unint64_t)(v19 - 2);
          if (v29 < 0x1E)
            goto LABEL_71;
          if (v8 - v15 - (v10 & 0xFFFFFFFFFFFFFFFELL) < 0x20)
            goto LABEL_71;
          v30 = (v29 >> 1) + 1;
          v31 = 2 * (v30 & 0xFFFFFFFFFFFFFFF0);
          v32 = &v8[-v31];
          v16 = (_WORD *)((char *)v16 - v31);
          v33 = &v15[2 * v11 - 16];
          v34 = v8 - 16;
          v35 = v30 & 0xFFFFFFFFFFFFFFF0;
          do
          {
            v36 = *(_OWORD *)v34;
            *(v33 - 1) = *((_OWORD *)v34 - 1);
            *v33 = v36;
            v33 -= 2;
            v34 -= 32;
            v35 -= 16;
          }
          while (v35);
          v8 = v32;
          if (v30 != (v30 & 0xFFFFFFFFFFFFFFF0))
          {
LABEL_71:
            do
            {
              v37 = *((_WORD *)v8 - 1);
              v8 -= 2;
              *--v16 = v37;
            }
            while (v8 != v9);
          }
LABEL_63:
          v8 = *(char **)(a1 + 112);
          goto LABEL_64;
        }
        if ((v14 & 0x8000000000000000) == 0)
        {
          v15 = operator new(2 * v14);
          v16 = &v15[2 * v11];
          v17 = &v15[2 * v14];
          *v16 = v6;
          v18 = (uint64_t)(v16 + 1);
          v19 = (char *)(v8 - v9);
          if (v8 == v9)
            goto LABEL_64;
          goto LABEL_30;
        }
LABEL_68:
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
LABEL_67:
      std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
    }
LABEL_28:
    *(_WORD *)v8 = v6;
    v18 = (uint64_t)(v8 + 2);
    goto LABEL_66;
  }
  v6 = a2 | (unsigned __int16)((_WORD)a3 << 8);
  v8 = *(char **)(a1 + 120);
  v20 = *(_QWORD *)(a1 + 128);
  if (*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v8 < v20)
      goto LABEL_28;
    v21 = *(char **)(a1 + 112);
    v22 = v8 - v21;
    if (v8 - v21 <= -3)
      goto LABEL_67;
    v23 = v22 >> 1;
    v24 = v20 - (_QWORD)v21;
    if (v24 <= (v22 >> 1) + 1)
      v25 = v23 + 1;
    else
      v25 = v24;
    if (v24 >= 0x7FFFFFFFFFFFFFFELL)
      v26 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v26 = v25;
    if (v26)
    {
      if (v26 < 0)
        goto LABEL_68;
      v27 = operator new(2 * v26);
      v16 = &v27[2 * v23];
      v17 = &v27[2 * v26];
      *v16 = v6;
      v18 = (uint64_t)(v16 + 1);
      v28 = (char *)(v8 - v21);
      if (v8 == v21)
        goto LABEL_64;
    }
    else
    {
      v27 = 0;
      v16 = (_WORD *)(2 * v23);
      v17 = 0;
      *(_WORD *)(2 * v23) = v6;
      v18 = 2 * v23 + 2;
      v28 = (char *)(v8 - v21);
      if (v8 == v21)
        goto LABEL_64;
    }
    v46 = (unint64_t)(v28 - 2);
    if (v46 < 0x1E)
      goto LABEL_72;
    if (v8 - v27 - (v22 & 0xFFFFFFFFFFFFFFFELL) < 0x20)
      goto LABEL_72;
    v47 = (v46 >> 1) + 1;
    v48 = 2 * (v47 & 0xFFFFFFFFFFFFFFF0);
    v49 = &v8[-v48];
    v16 = (_WORD *)((char *)v16 - v48);
    v50 = &v27[2 * v23 - 16];
    v51 = v8 - 16;
    v52 = v47 & 0xFFFFFFFFFFFFFFF0;
    do
    {
      v53 = *(_OWORD *)v51;
      *(v50 - 1) = *((_OWORD *)v51 - 1);
      *v50 = v53;
      v50 -= 2;
      v51 -= 32;
      v52 -= 16;
    }
    while (v52);
    v8 = v49;
    if (v47 != (v47 & 0xFFFFFFFFFFFFFFF0))
    {
LABEL_72:
      do
      {
        v54 = *((_WORD *)v8 - 1);
        v8 -= 2;
        *--v16 = v54;
      }
      while (v8 != v21);
    }
    goto LABEL_63;
  }
  if ((unint64_t)v8 < v20)
    goto LABEL_28;
  v38 = *(char **)(a1 + 112);
  v39 = v8 - v38;
  if (v8 - v38 <= -3)
    goto LABEL_67;
  v40 = v39 >> 1;
  v41 = v20 - (_QWORD)v38;
  if (v41 <= (v39 >> 1) + 1)
    v42 = v40 + 1;
  else
    v42 = v41;
  if (v41 >= 0x7FFFFFFFFFFFFFFELL)
    v43 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v43 = v42;
  if (!v43)
  {
    v44 = 0;
    v16 = (_WORD *)(2 * v40);
    v17 = 0;
    *(_WORD *)(2 * v40) = v6;
    v18 = 2 * v40 + 2;
    v45 = (char *)(v8 - v38);
    if (v8 == v38)
      goto LABEL_64;
    goto LABEL_57;
  }
  if (v43 < 0)
    goto LABEL_68;
  v44 = operator new(2 * v43);
  v16 = &v44[2 * v40];
  v17 = &v44[2 * v43];
  *v16 = v6;
  v18 = (uint64_t)(v16 + 1);
  v45 = (char *)(v8 - v38);
  if (v8 != v38)
  {
LABEL_57:
    v55 = (unint64_t)(v45 - 2);
    if (v55 < 0x1E)
      goto LABEL_73;
    if (v8 - v44 - (v39 & 0xFFFFFFFFFFFFFFFELL) < 0x20)
      goto LABEL_73;
    v56 = (v55 >> 1) + 1;
    v57 = 2 * (v56 & 0xFFFFFFFFFFFFFFF0);
    v58 = &v8[-v57];
    v16 = (_WORD *)((char *)v16 - v57);
    v59 = &v44[2 * v40 - 16];
    v60 = v8 - 16;
    v61 = v56 & 0xFFFFFFFFFFFFFFF0;
    do
    {
      v62 = *(_OWORD *)v60;
      *(v59 - 1) = *((_OWORD *)v60 - 1);
      *v59 = v62;
      v59 -= 2;
      v60 -= 32;
      v61 -= 16;
    }
    while (v61);
    v8 = v58;
    if (v56 != (v56 & 0xFFFFFFFFFFFFFFF0))
    {
LABEL_73:
      do
      {
        v63 = *((_WORD *)v8 - 1);
        v8 -= 2;
        *--v16 = v63;
      }
      while (v8 != v38);
    }
    goto LABEL_63;
  }
LABEL_64:
  *(_QWORD *)(a1 + 112) = v16;
  *(_QWORD *)(a1 + 120) = v18;
  *(_QWORD *)(a1 + 128) = v17;
  if (v8)
    operator delete(v8);
LABEL_66:
  *(_QWORD *)(a1 + 120) = v18;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BF63C4](exception, 1);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_2129DCC90(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  unint64_t v4;
  char *v9;
  char *v10;
  char *v11;
  __int128 *v12;
  _OWORD *v13;
  unint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  char *v25;
  size_t v26;
  std::string v27;
  char __s[24];

  v4 = (unint64_t)&a4[-a3];
  memset(__s, 170, sizeof(__s));
  if ((unint64_t)&a4[-a3] >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v4 <= 0x16)
  {
    __s[23] = (_BYTE)a4 - a3;
    v9 = __s;
    if ((char *)a3 != a4)
      goto LABEL_4;
LABEL_13:
    v10 = v9;
    goto LABEL_16;
  }
  v16 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v4 | 7) != 0x17)
    v16 = v4 | 7;
  v17 = v16 + 1;
  v9 = (char *)operator new(v16 + 1);
  *(_QWORD *)&__s[8] = v4;
  *(_QWORD *)&__s[16] = v17 | 0x8000000000000000;
  *(_QWORD *)__s = v9;
  if ((char *)a3 == a4)
    goto LABEL_13;
LABEL_4:
  if (v4 < 0x20 || (unint64_t)&v9[-a3] < 0x20)
  {
    v10 = v9;
    v11 = (char *)a3;
    do
    {
LABEL_15:
      v18 = *v11++;
      *v10++ = v18;
    }
    while (v11 != a4);
    goto LABEL_16;
  }
  v10 = &v9[v4 & 0xFFFFFFFFFFFFFFE0];
  v11 = (char *)(a3 + (v4 & 0xFFFFFFFFFFFFFFE0));
  v12 = (__int128 *)(a3 + 16);
  v13 = v9 + 16;
  v14 = v4 & 0xFFFFFFFFFFFFFFE0;
  do
  {
    v15 = *v12;
    *(v13 - 1) = *(v12 - 1);
    *v13 = v15;
    v12 += 2;
    v13 += 2;
    v14 -= 32;
  }
  while (v14);
  if (v4 != (v4 & 0xFFFFFFFFFFFFFFE0))
    goto LABEL_15;
LABEL_16:
  *v10 = 0;
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  if (__s[23] < 0)
  {
    v19 = *(char **)__s;
    if (!*(_QWORD *)&__s[8])
      goto LABEL_29;
  }
  else
  {
    if (!__s[23])
      return;
    v19 = __s;
  }
  std::__get_collation_name(&v27, v19);
  *(_OWORD *)a1 = *(_OWORD *)&v27.__r_.__value_.__l.__data_;
  v20 = v27.__r_.__value_.__r.__words[2];
  *(_QWORD *)(a1 + 16) = *((_QWORD *)&v27.__r_.__value_.__l + 2);
  v21 = HIBYTE(v20);
  if ((v21 & 0x80u) != 0)
    v21 = *(_QWORD *)(a1 + 8);
  if (v21)
  {
LABEL_23:
    if ((__s[23] & 0x80000000) == 0)
      return;
    v19 = *(char **)__s;
LABEL_29:
    operator delete(v19);
    return;
  }
  if (__s[23] < 0)
  {
    v19 = *(char **)__s;
    v22 = *(_QWORD *)&__s[8];
    if (*(_QWORD *)&__s[8] >= 3uLL)
      goto LABEL_29;
    goto LABEL_31;
  }
  v22 = __s[23];
  if (__s[23] < 3u)
  {
    v19 = __s;
LABEL_31:
    (*(void (**)(std::string *__return_ptr, _QWORD, char *, char *))(**(_QWORD **)(a2 + 16) + 32))(&v27, *(_QWORD *)(a2 + 16), v19, &v19[v22]);
    if (*(char *)(a1 + 23) < 0)
      operator delete(*(void **)a1);
    *(std::string *)a1 = v27;
    if (*(char *)(a1 + 23) < 0)
    {
      v24 = *(_QWORD *)(a1 + 8);
      if (v24 == 1 || v24 == 12)
      {
        if (__s != (char *)a1)
        {
          if (__s[23] >= 0)
            v25 = __s;
          else
            v25 = *(char **)__s;
          if (__s[23] >= 0)
            v26 = __s[23];
          else
            v26 = *(_QWORD *)&__s[8];
          std::string::__assign_no_alias<false>((void **)a1, v25, v26);
        }
      }
      else
      {
        **(_BYTE **)a1 = 0;
        *(_QWORD *)(a1 + 8) = 0;
      }
    }
    else
    {
      v23 = *(unsigned __int8 *)(a1 + 23);
      if (v23 == 1 || v23 == 12)
      {
        if (__s != (char *)a1)
        {
          if (__s[23] < 0)
          {
            std::string::__assign_no_alias<true>((_QWORD *)a1, *(void **)__s, *(size_t *)&__s[8]);
          }
          else
          {
            *(_OWORD *)a1 = *(_OWORD *)__s;
            *(_QWORD *)(a1 + 16) = *(_QWORD *)&__s[16];
          }
        }
      }
      else
      {
        *(_BYTE *)a1 = 0;
        *(_BYTE *)(a1 + 23) = 0;
      }
    }
    goto LABEL_23;
  }
}

void sub_2129DCF5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (*(char *)(v17 + 23) < 0)
  {
    operator delete(*(void **)v17);
    if ((a17 & 0x80000000) == 0)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else if ((a17 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::string *std::vector<std::string>::__push_back_slow_path<std::string const&>(char **a1, uint64_t a2)
{
  char *v2;
  char *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v8;
  char *v9;
  std::string *v10;
  std::string *v11;
  __int128 v12;
  char *v13;
  void **v14;
  std::string *v16;
  std::string *v17;
  char *v18;

  v2 = *a1;
  v3 = a1[1];
  v4 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
  if (0x5555555555555556 * ((a1[2] - v2) >> 3) > v5)
    v5 = 0x5555555555555556 * ((a1[2] - v2) >> 3);
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - v2) >> 3) >= 0x555555555555555)
    v8 = 0xAAAAAAAAAAAAAAALL;
  else
    v8 = v5;
  if (v8)
  {
    if (v8 > 0xAAAAAAAAAAAAAAALL)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v9 = (char *)operator new(24 * v8);
  }
  else
  {
    v9 = 0;
  }
  v10 = (std::string *)&v9[24 * v4];
  v16 = v10;
  v17 = v10;
  v18 = &v9[24 * v8];
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v10, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
    v2 = *a1;
    v3 = a1[1];
    v10 = v16;
    v11 = v17 + 1;
    if (v3 == *a1)
    {
LABEL_17:
      v13 = v2;
      goto LABEL_18;
    }
  }
  else
  {
    *(_OWORD *)&v10->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    v10->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 16);
    v11 = v10 + 1;
    if (v3 == v2)
      goto LABEL_17;
  }
  do
  {
    v12 = *(_OWORD *)(v3 - 24);
    v10[-1].__r_.__value_.__r.__words[2] = *((_QWORD *)v3 - 1);
    *(_OWORD *)&v10[-1].__r_.__value_.__l.__data_ = v12;
    --v10;
    *((_QWORD *)v3 - 2) = 0;
    *((_QWORD *)v3 - 1) = 0;
    *((_QWORD *)v3 - 3) = 0;
    v3 -= 24;
  }
  while (v3 != v2);
  v13 = *a1;
  v2 = a1[1];
LABEL_18:
  *a1 = (char *)v10;
  a1[1] = (char *)v11;
  a1[2] = v18;
  if (v2 != v13)
  {
    v14 = (void **)(v2 - 24);
    do
    {
      if (*((char *)v14 + 23) < 0)
        operator delete(*v14);
      v14 -= 3;
    }
    while (v14 + 3 != (void **)v13);
    v2 = v13;
  }
  if (v2)
    operator delete(v2);
  return v11;
}

void sub_2129DD15C(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a10);
  _Unwind_Resume(a1);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::pointer end;
  std::__split_buffer<std::string>::pointer begin;
  std::__split_buffer<std::string>::pointer v4;

  begin = this->__begin_;
  end = this->__end_;
  if (end != begin)
  {
    do
    {
      v4 = end - 1;
      this->__end_ = end - 1;
      if (SHIBYTE(end[-1].__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v4->__r_.__value_.__l.__data_);
        v4 = this->__end_;
      }
      end = v4;
    }
    while (v4 != begin);
  }
  if (this->__first_)
    operator delete(this->__first_);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BF63C4](exception, 2);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_2129DD294(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::regex_traits<char>::transform<std::__wrap_iter<char *>>(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  unint64_t v4;
  _OWORD *v8;
  _BYTE *v9;
  char *v10;
  __int128 *v11;
  _OWORD *v12;
  unint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char *v18;
  void **v19;
  void *__p[3];

  v4 = (unint64_t)&a4[-a3];
  memset(__p, 170, sizeof(__p));
  if ((unint64_t)&a4[-a3] >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v4 > 0x16)
  {
    v15 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v15 = v4 | 7;
    v16 = v15 + 1;
    v8 = operator new(v15 + 1);
    __p[1] = (void *)v4;
    __p[2] = (void *)(v16 | 0x8000000000000000);
    __p[0] = v8;
    if ((char *)a3 != a4)
      goto LABEL_4;
LABEL_13:
    v9 = v8;
    goto LABEL_16;
  }
  HIBYTE(__p[2]) = (_BYTE)a4 - a3;
  v8 = __p;
  if ((char *)a3 == a4)
    goto LABEL_13;
LABEL_4:
  if (v4 < 0x20 || (unint64_t)v8 - a3 < 0x20)
  {
    v9 = v8;
    v10 = (char *)a3;
  }
  else
  {
    v9 = (char *)v8 + (v4 & 0xFFFFFFFFFFFFFFE0);
    v10 = (char *)(a3 + (v4 & 0xFFFFFFFFFFFFFFE0));
    v11 = (__int128 *)(a3 + 16);
    v12 = v8 + 1;
    v13 = v4 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      v14 = *v11;
      *(v12 - 1) = *(v11 - 1);
      *v12 = v14;
      v11 += 2;
      v12 += 2;
      v13 -= 32;
    }
    while (v13);
    if (v4 == (v4 & 0xFFFFFFFFFFFFFFE0))
      goto LABEL_16;
  }
  do
  {
    v17 = *v10++;
    *v9++ = v17;
  }
  while (v10 != a4);
LABEL_16:
  *v9 = 0;
  v18 = (char *)HIBYTE(__p[2]);
  if (SHIBYTE(__p[2]) >= 0)
    v19 = __p;
  else
    v19 = (void **)__p[0];
  if (SHIBYTE(__p[2]) < 0)
    v18 = (char *)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a2 + 16) + 32))(*(_QWORD *)(a2 + 16), v19, &v18[(_QWORD)v19]);
  if (SHIBYTE(__p[2]) < 0)
    operator delete(__p[0]);
}

void sub_2129DD424(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BF63C4](exception, 9);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_2129DD478(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *std::vector<std::pair<std::string,std::string>>::__push_back_slow_path<std::pair<std::string,std::string>>(void **a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  __int128 v10;
  char *v11;
  void **v12;
  void **v13;
  __int128 v14;
  __int128 v15;
  void **v16;

  v2 = 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[1] - (_BYTE *)*a1) >> 4);
  v3 = v2 + 1;
  if (v2 + 1 > 0x555555555555555)
    std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
  if (0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 4) > v3)
    v3 = 0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 4);
  if (0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 4) >= 0x2AAAAAAAAAAAAAALL)
    v6 = 0x555555555555555;
  else
    v6 = v3;
  if (v6)
  {
    if (v6 > 0x555555555555555)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v7 = (char *)operator new(48 * v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = &v7[48 * v2];
  *((_QWORD *)v8 + 2) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)v8 = *(_OWORD *)a2;
  v9 = &v7[48 * v6];
  v10 = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_OWORD *)(v8 + 24) = v10;
  *((_QWORD *)v8 + 5) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  v11 = v8 + 48;
  v12 = (void **)*a1;
  v13 = (void **)a1[1];
  if (v13 != *a1)
  {
    do
    {
      v14 = *((_OWORD *)v13 - 3);
      *((_QWORD *)v8 - 4) = *(v13 - 4);
      *((_OWORD *)v8 - 3) = v14;
      *(v13 - 5) = 0;
      *(v13 - 4) = 0;
      *(v13 - 6) = 0;
      v15 = *(_OWORD *)(v13 - 3);
      *((_QWORD *)v8 - 1) = *(v13 - 1);
      *(_OWORD *)(v8 - 24) = v15;
      v8 -= 48;
      *(v13 - 2) = 0;
      *(v13 - 1) = 0;
      *(v13 - 3) = 0;
      v13 -= 6;
    }
    while (v13 != v12);
    v13 = (void **)*a1;
    v16 = (void **)a1[1];
    *a1 = v8;
    a1[1] = v11;
    a1[2] = v9;
    while (1)
    {
      if (v16 == v13)
        goto LABEL_22;
      if (*((char *)v16 - 1) < 0)
      {
        operator delete(*(v16 - 3));
        if ((*((char *)v16 - 25) & 0x80000000) == 0)
          goto LABEL_14;
      }
      else if ((*((char *)v16 - 25) & 0x80000000) == 0)
      {
        goto LABEL_14;
      }
      operator delete(*(v16 - 6));
LABEL_14:
      v16 -= 6;
    }
  }
  *a1 = v8;
  a1[1] = v11;
  a1[2] = v9;
LABEL_22:
  if (v13)
    operator delete(v13);
  return v11;
}

void (__cdecl ***std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

uint64_t std::__begin_marked_subexpression<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(*(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1)) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void (__cdecl ***std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

uint64_t std::__end_marked_subexpression<char>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_DWORD *)a2 = -994;
  v2 = *(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1);
  *(_QWORD *)(v2 + 8) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(v2 + 16) = 1;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_loop(std::basic_regex<char> *this, size_t __min, size_t __max, std::__owns_one_state<char> *__s, size_t __mexp_begin, size_t __mexp_end, BOOL __greedy)
{
  int v8;
  int v9;
  _QWORD *v14;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;
  void *v17;
  std::__node<char> *v18;
  std::__node<char> *v19;

  v8 = __mexp_end;
  v9 = __mexp_begin;
  v14 = operator new(0x10uLL);
  end = this->__end_;
  first = end->__first_;
  v14[1] = first;
  end->__first_ = 0;
  v17 = operator new(0x38uLL);
  LODWORD(first) = this->__loop_count_;
  v18 = __s->__first_;
  *(_QWORD *)v17 = &off_24CE6EB40;
  *((_QWORD *)v17 + 1) = v18;
  *((_QWORD *)v17 + 2) = v14;
  *((_QWORD *)v17 + 3) = __min;
  *((_QWORD *)v17 + 4) = __max;
  *((_DWORD *)v17 + 10) = (_DWORD)first;
  *((_DWORD *)v17 + 11) = v9;
  *((_DWORD *)v17 + 12) = v8;
  *((_BYTE *)v17 + 52) = __greedy;
  __s->__first_ = 0;
  v19 = (std::__node<char> *)operator new(0x10uLL);
  v19->__vftable = (std::__node<char>_vtbl *)off_24CE6EBD0;
  v19[1].__vftable = (std::__node<char>_vtbl *)v17;
  this->__end_->__first_ = v19;
  this->__end_ = (std::__owns_one_state<char> *)*((_QWORD *)v17 + 2);
  __s->__first_ = (std::__node<char> *)v17;
  this->__loop_count_ = (_DWORD)first + 1;
}

void sub_2129DD86C(_Unwind_Exception *a1)
{
  void (__cdecl ***v1)(std::__owns_one_state<char> *__hidden);

  std::__loop<char>::~__loop(v1);
  _Unwind_Resume(a1);
}

void sub_2129DD880(_Unwind_Exception *a1)
{
  void (__cdecl ***v1)(std::__owns_one_state<char> *__hidden);
  uint64_t v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BF63C4](exception, 8);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_2129DD8EC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BF63C4](exception, 7);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_2129DD938(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__loop<char>::~__loop(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_24CE6EBA0;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__loop<char>::~__loop(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *__p = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_24CE6EBA0;
  v2 = __p[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = __p[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  operator delete(__p);
}

uint64_t std::__loop<char>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL4 v8;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  _BYTE *v35;

  v2 = *(unsigned int *)(result + 40);
  v3 = *(_QWORD *)(a2 + 56);
  v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 != -991)
  {
    *v4 = 0;
    if (!*(_QWORD *)(result + 32))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_28;
    }
    if (*(_QWORD *)(result + 24))
    {
      *(_DWORD *)a2 = -994;
      *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
      *(_QWORD *)(v3 + 16 * v2 + 8) = *(_QWORD *)(a2 + 16);
      v20 = *(_DWORD *)(result + 44);
      v21 = *(_DWORD *)(result + 48);
      if (v20 == v21)
        return result;
      v22 = (v21 - 1);
      v23 = (v20 - 1);
      v24 = *(_QWORD *)(a2 + 24);
      v25 = *(_QWORD *)(a2 + 32);
      v26 = v22 - v23;
      if ((unint64_t)(v22 - v23) >= 2)
      {
        v27 = (v26 & 0xFFFFFFFFFFFFFFFELL) + v23;
        v28 = v25 + 24 * v23 + 24;
        v29 = v26 & 0xFFFFFFFFFFFFFFFELL;
        do
        {
          *(_QWORD *)(v28 - 24) = v24;
          *(_QWORD *)(v28 - 16) = v24;
          *(_QWORD *)v28 = v24;
          *(_QWORD *)(v28 + 8) = v24;
          *(_BYTE *)(v28 - 8) = 0;
          *(_BYTE *)(v28 + 16) = 0;
          v28 += 48;
          v29 -= 2;
        }
        while (v29);
        if (v26 == (v26 & 0xFFFFFFFFFFFFFFFELL))
          return result;
      }
      else
      {
        v27 = v23;
      }
      v30 = v22 - v27;
      v31 = (_BYTE *)(v25 + 24 * v27 + 16);
      do
      {
        *((_QWORD *)v31 - 2) = v24;
        *((_QWORD *)v31 - 1) = v24;
        *v31 = 0;
        v31 += 24;
        --v30;
      }
      while (v30);
      return result;
    }
LABEL_26:
    *(_DWORD *)a2 = -992;
    return result;
  }
  v5 = *v4 + 1;
  *v4 = v5;
  v6 = *(_QWORD *)(result + 24);
  v7 = *(_QWORD *)(result + 32);
  v8 = v5 < v7;
  if (v5 < v7 && v5 >= v6)
    v8 = v5 < v7 && *(_QWORD *)(v3 + 16 * v2 + 8) != *(_QWORD *)(a2 + 16);
  if (v8 && v5 >= v6)
    goto LABEL_26;
  *(_DWORD *)a2 = -994;
  if (!v8)
  {
LABEL_28:
    *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 16);
    return result;
  }
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  *(_QWORD *)(v3 + 16 * v2 + 8) = *(_QWORD *)(a2 + 16);
  v12 = *(_DWORD *)(result + 44);
  v13 = *(_DWORD *)(result + 48);
  if (v12 == v13)
    return result;
  v14 = (v13 - 1);
  v15 = (v12 - 1);
  v16 = *(_QWORD *)(a2 + 24);
  v17 = *(_QWORD *)(a2 + 32);
  v18 = v14 - v15;
  if ((unint64_t)(v14 - v15) < 2)
  {
    v19 = v15;
LABEL_39:
    v34 = v14 - v19;
    v35 = (_BYTE *)(v17 + 24 * v19 + 16);
    do
    {
      *((_QWORD *)v35 - 2) = v16;
      *((_QWORD *)v35 - 1) = v16;
      *v35 = 0;
      v35 += 24;
      --v34;
    }
    while (v34);
    return result;
  }
  v19 = (v18 & 0xFFFFFFFFFFFFFFFELL) + v15;
  v32 = v17 + 24 * v15 + 24;
  v33 = v18 & 0xFFFFFFFFFFFFFFFELL;
  do
  {
    *(_QWORD *)(v32 - 24) = v16;
    *(_QWORD *)(v32 - 16) = v16;
    *(_QWORD *)v32 = v16;
    *(_QWORD *)(v32 + 8) = v16;
    *(_BYTE *)(v32 - 8) = 0;
    *(_BYTE *)(v32 + 16) = 0;
    v32 += 48;
    v33 -= 2;
  }
  while (v33);
  if (v18 != (v18 & 0xFFFFFFFFFFFFFFFELL))
    goto LABEL_39;
  return result;
}

uint64_t std::__loop<char>::__exec_split(uint64_t result, int a2, uint64_t a3)
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _BYTE *v14;

  *(_DWORD *)a3 = -994;
  if (*(unsigned __int8 *)(result + 52) == a2)
  {
    *(_QWORD *)(a3 + 80) = *(_QWORD *)(result + 16);
    return result;
  }
  *(_QWORD *)(a3 + 80) = *(_QWORD *)(result + 8);
  v3 = *(_DWORD *)(result + 44);
  *(_QWORD *)(*(_QWORD *)(a3 + 56) + 16 * *(unsigned int *)(result + 40) + 8) = *(_QWORD *)(a3 + 16);
  v4 = *(_DWORD *)(result + 48);
  if (v3 != v4)
  {
    v5 = (v4 - 1);
    v6 = (v3 - 1);
    v7 = *(_QWORD *)(a3 + 24);
    v8 = *(_QWORD *)(a3 + 32);
    v9 = v5 - v6;
    if ((unint64_t)(v5 - v6) < 2)
    {
      v10 = v6;
LABEL_9:
      v13 = v5 - v10;
      v14 = (_BYTE *)(v8 + 24 * v10 + 16);
      do
      {
        *((_QWORD *)v14 - 2) = v7;
        *((_QWORD *)v14 - 1) = v7;
        *v14 = 0;
        v14 += 24;
        --v13;
      }
      while (v13);
      return result;
    }
    v10 = (v9 & 0xFFFFFFFFFFFFFFFELL) + v6;
    v11 = v8 + 24 * v6 + 24;
    v12 = v9 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      *(_QWORD *)(v11 - 24) = v7;
      *(_QWORD *)(v11 - 16) = v7;
      *(_QWORD *)v11 = v7;
      *(_QWORD *)(v11 + 8) = v7;
      *(_BYTE *)(v11 - 8) = 0;
      *(_BYTE *)(v11 + 16) = 0;
      v11 += 48;
      v12 -= 2;
    }
    while (v12);
    if (v9 != (v9 & 0xFFFFFFFFFFFFFFFELL))
      goto LABEL_9;
  }
  return result;
}

void (__cdecl ***std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_24CE6EBA0;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *__p = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_24CE6EBA0;
  v2 = __p[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = __p[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  operator delete(__p);
}

uint64_t std::__repeat_one_loop<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void (__cdecl ***std::__alternate<char>::~__alternate(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_24CE6EBA0;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__alternate<char>::~__alternate(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *__p = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_24CE6EBA0;
  v2 = __p[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = __p[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  operator delete(__p);
}

void std::__alternate<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t std::__alternate<char>::__exec_split(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3;

  *(_DWORD *)a3 = -994;
  v3 = 8;
  if (a2)
    v3 = 16;
  *(_QWORD *)(a3 + 80) = *(_QWORD *)(result + v3);
  return result;
}

uint64_t std::__empty_non_own_state<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BF63C4](exception, 15);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_2129DDED8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  int v6;
  std::basic_regex<char>::value_type *v7;
  int v8;
  std::basic_regex<char> *v9;
  _QWORD *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  std::basic_regex<char> *v20;
  std::__owns_one_state<char> *v21;
  int v22;
  std::basic_regex<char> *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;

  if (a2 == a3)
    goto LABEL_4;
  v7 = a2 + 1;
  v6 = *a2;
  if (a2 + 1 == a3 && v6 == 36)
    goto LABEL_4;
  if ((v6 - 46) > 0x2E || ((1 << (v6 - 46)) & 0x600000000001) == 0)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v6);
  }
  else
  {
    if (v7 != a3 && v6 == 92)
    {
      v15 = *v7;
      if ((v15 - 36) <= 0x3A && ((1 << (v15 - 36)) & 0x580000000000441) != 0)
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v15);
        v7 = a2 + 2;
        goto LABEL_5;
      }
LABEL_4:
      v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>(a1, a2, a3);
      goto LABEL_5;
    }
    if (v6 != 46)
      goto LABEL_4;
    v16 = operator new(0x10uLL);
    v17 = *(_QWORD *)(a1 + 56);
    v18 = *(_QWORD *)(v17 + 8);
    *v16 = &off_24CE6ECA8;
    v16[1] = v18;
    *(_QWORD *)(v17 + 8) = v16;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  }
LABEL_5:
  if (a2 == a3 || a2 != v7 || a2 + 1 == a3 || *a2 != 92)
    return v7;
  v8 = a2[1];
  if (v8 == 40)
  {
    v9 = (std::basic_regex<char> *)(a2 + 2);
    if ((*(_BYTE *)(a1 + 24) & 2) != 0)
    {
      v11 = *(_DWORD *)(a1 + 28);
    }
    else
    {
      v10 = operator new(0x18uLL);
      v11 = *(_DWORD *)(a1 + 28) + 1;
      *(_DWORD *)(a1 + 28) = v11;
      v12 = *(_QWORD *)(a1 + 56);
      v13 = *(_QWORD *)(v12 + 8);
      *v10 = &off_24CE6EAB0;
      v10[1] = v13;
      *((_DWORD *)v10 + 4) = v11;
      *(_QWORD *)(v12 + 8) = v10;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    do
    {
      if (v9 == (std::basic_regex<char> *)a3)
        goto LABEL_39;
      v20 = v9;
      v21 = *(std::__owns_one_state<char> **)(a1 + 56);
      v22 = *(_DWORD *)(a1 + 28);
      v23 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<std::__wrap_iter<char const*>>(a1, v20, a3);
      if (v20 == v23)
        break;
      v9 = std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v23, (std::basic_regex<char> *)a3, v21, (v22 + 1), (*(_DWORD *)(a1 + 28) + 1));
    }
    while (v20 != v9);
    if ((char *)&v20->__traits_.__loc_.__locale_ + 1 == a3
      || LOBYTE(v20->__traits_.__loc_.__locale_) != 92
      || BYTE1(v20->__traits_.__loc_.__locale_) != 41)
    {
LABEL_39:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
    }
    v7 = (char *)v20 + 2 * (BYTE1(v20->__traits_.__loc_.__locale_) == 41);
    if ((*(_BYTE *)(a1 + 24) & 2) == 0)
    {
      v24 = operator new(0x18uLL);
      v25 = *(_QWORD *)(a1 + 56);
      v26 = *(_QWORD *)(v25 + 8);
      *v24 = &off_24CE6EAF8;
      v24[1] = v26;
      *((_DWORD *)v24 + 4) = v11;
      *(_QWORD *)(v25 + 8) = v24;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    return v7;
  }
  if ((v8 & 0xF8) != 0x30 && (v8 & 0xFE) != 0x38 || (v8 - 49) > 8)
    return v7;
  if ((v8 - 48) > *(_DWORD *)(a1 + 28))
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref((std::basic_regex<char> *)a1, v8 - 48);
  return a2 + 2;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::__owns_one_state<char> *a4, size_t __mexp_begin, size_t __mexp_end)
{
  int locale_low;
  unsigned __int8 *v9;
  std::basic_regex<char> *v10;
  int v11;
  int v12;
  std::basic_regex<char> *v13;
  int v14;
  std::basic_regex<char> *v15;
  int v16;
  int v17;
  int v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;

  if (this == a3)
    return this;
  locale_low = LOBYTE(this->__traits_.__loc_.__locale_);
  if (locale_low == 42)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, 0, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
    return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
  }
  v9 = (unsigned __int8 *)a3;
  if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3
    || locale_low != 92
    || BYTE1(this->__traits_.__loc_.__locale_) != 123)
  {
    return this;
  }
  v10 = (std::basic_regex<char> *)((char *)this + 2 * (BYTE1(this->__traits_.__loc_.__locale_) == 123));
  if (v10 == a3)
    goto LABEL_45;
  v11 = LOBYTE(v10->__traits_.__loc_.__locale_);
  if ((v11 & 0xF8) != 0x30 && (v11 & 0xFE) != 0x38)
    goto LABEL_45;
  v12 = v11 - 48;
  v13 = (std::basic_regex<char> *)((char *)&v10->__traits_.__loc_.__locale_ + 1);
  if ((std::basic_regex<char> *)((char *)&v10->__traits_.__loc_.__locale_ + 1) == a3)
  {
LABEL_15:
    v13 = a3;
  }
  else
  {
    while (1)
    {
      v14 = LOBYTE(v13->__traits_.__loc_.__locale_);
      if ((v14 & 0xF8) != 0x30 && (v14 & 0xFE) != 0x38)
        break;
      if (v12 >= 214748364)
        goto LABEL_45;
      v12 = v14 + 10 * v12 - 48;
      v13 = (std::basic_regex<char> *)((char *)v13 + 1);
      if (v13 == a3)
        goto LABEL_15;
    }
  }
  if (v13 == v10)
    goto LABEL_45;
  if (v13 == a3)
LABEL_46:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
  v15 = (std::basic_regex<char> *)((char *)&v13->__traits_.__loc_.__locale_ + 1);
  v16 = LOBYTE(v13->__traits_.__loc_.__locale_);
  if (v16 != 44)
  {
    if (v15 != a3 && v16 == 92 && LOBYTE(v15->__traits_.__loc_.__locale_) == 125)
    {
      v19 = (unsigned __int8 *)&v13->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v12, v12, a4, __mexp_begin, __mexp_end, 1);
      return (std::basic_regex<char> *)v19;
    }
    goto LABEL_46;
  }
  if (v15 == a3)
    goto LABEL_46;
  v17 = LOBYTE(v15->__traits_.__loc_.__locale_);
  if ((v17 & 0xF8) == 0x30 || (v17 & 0xFE) == 0x38)
  {
    v18 = v17 - 48;
    v15 = (std::basic_regex<char> *)((char *)&v13->__traits_.__loc_.__locale_ + 2);
    if ((std::basic_regex<char> *)((char *)&v13->__traits_.__loc_.__locale_ + 2) == a3)
    {
LABEL_37:
      v15 = a3;
      goto LABEL_40;
    }
    while (1)
    {
      v17 = LOBYTE(v15->__traits_.__loc_.__locale_);
      if ((v17 & 0xF8) != 0x30 && (v17 & 0xFE) != 0x38)
        break;
      if (v18 >= 214748364)
        goto LABEL_45;
      v18 = v17 + 10 * v18 - 48;
      v15 = (std::basic_regex<char> *)((char *)v15 + 1);
      if (v15 == a3)
        goto LABEL_37;
    }
  }
  else
  {
    v18 = -1;
  }
  if (v15 == a3)
  {
    v20 = (unsigned __int8 *)v15;
    v15 = a3;
    v9 = v20;
  }
  else if ((std::basic_regex<char> *)((char *)&v15->__traits_.__loc_.__locale_ + 1) == a3 || v17 != 92)
  {
    v9 = (unsigned __int8 *)v15;
  }
  else
  {
    v9 = (unsigned __int8 *)v15 + 2 * (BYTE1(v15->__traits_.__loc_.__locale_) == 125);
  }
LABEL_40:
  if (v15 == (std::basic_regex<char> *)v9)
    goto LABEL_46;
  if (v18 != -1)
  {
    if (v18 >= v12)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v12, v18, a4, __mexp_begin, __mexp_end, 1);
      return (std::basic_regex<char> *)v9;
    }
LABEL_45:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v12, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
  return (std::basic_regex<char> *)v9;
}

void (__cdecl ***std::__match_any<char>::~__match_any(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__match_any<char>::~__match_any(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

uint64_t std::__match_any<char>::__exec(uint64_t result, uint64_t a2)
{
  _BYTE *v2;

  v2 = *(_BYTE **)(a2 + 16);
  if (v2 == *(_BYTE **)(a2 + 24) || !*v2)
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  }
  return result;
}

BOOL std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(std::basic_regex<char> *this, char a2)
{
  if ((a2 & 0xF8) != 0x30 && (a2 & 0xFE) != 0x38 || a2 - 49 > 8)
    return 0;
  if (a2 - 48 > this->__marked_count_)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(this, a2 - 48);
  return 1;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(std::basic_regex<char> *this, std::basic_regex<char>::value_type *a2, std::basic_regex<char> *a3)
{
  std::__owns_one_state<char> *end;
  unsigned int marked_count;
  int v8;
  std::basic_regex<char> *v9;
  std::basic_regex<char>::value_type locale;
  std::basic_regex<char>::value_type *v11;
  _BOOL4 v12;
  uint64_t v13;
  std::__node<char> *v14;
  std::__owns_one_state<char> *v15;
  std::__node<char> *first;
  int v17;
  std::__node<char> *v18;
  BOOL v19;
  std::__owns_one_state<char> *v20;
  std::__node<char> *v21;
  uint64_t (**v22)();
  std::__node<char> *v23;
  unsigned int v24;
  std::__owns_one_state<char> *v25;
  std::__node<char> *v26;
  std::basic_regex<char> *v27;
  std::basic_regex<char> *v28;
  std::__node<char> *v29;
  std::__owns_one_state<char> *v30;
  std::__node<char> *v31;

  end = this->__end_;
  marked_count = this->__marked_count_;
  if (a2 != (std::basic_regex<char>::value_type *)a3)
  {
    v8 = *a2;
    switch(*a2)
    {
      case '$':
      case '(':
      case '*':
      case '+':
      case '.':
      case '?':
      case '[':
      case '\\':
      case '^':
      case '{':
      case '|':
        goto LABEL_3;
      case ')':
        if (!this->__open_count_)
          goto LABEL_8;
LABEL_3:
        v9 = (std::basic_regex<char> *)(a2 + 1);
        if (a2 + 1 != (std::basic_regex<char>::value_type *)a3 && v8 == 92)
        {
          locale = (std::basic_regex<char>::value_type)v9->__traits_.__loc_.__locale_;
          switch(LOBYTE(v9->__traits_.__loc_.__locale_))
          {
            case '$':
            case '(':
            case ')':
            case '*':
            case '+':
            case '.':
            case '?':
            case '[':
            case '\\':
            case '^':
            case '{':
            case '|':
            case '}':
              std::basic_regex<char,std::regex_traits<char>>::__push_char(this, locale);
              v9 = (std::basic_regex<char> *)(a2 + 2);
              return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)this, v9, a3, end, marked_count + 1, this->__marked_count_ + 1);
            default:
              if ((this->__flags_ & 0x1F0) == 0x40)
              {
                v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>(this, a2 + 1, (std::basic_regex<char>::value_type *)a3, 0);
              }
              else
              {
                v12 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(this, locale);
                v13 = 2;
                if (!v12)
                  v13 = 0;
                v11 = &a2[v13];
              }
              if (v11 != a2)
                goto LABEL_19;
              v8 = *a2;
              break;
          }
        }
        if (v8 != 46)
          goto LABEL_18;
        v14 = (std::__node<char> *)operator new(0x10uLL);
        v15 = this->__end_;
        first = v15->__first_;
        v14->__vftable = (std::__node<char>_vtbl *)&off_24CE6ECA8;
        v14[1].__vftable = (std::__node<char>_vtbl *)first;
        v15->__first_ = v14;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
        break;
      default:
LABEL_8:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v8);
        v9 = (std::basic_regex<char> *)(a2 + 1);
        return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)this, v9, a3, end, marked_count + 1, this->__marked_count_ + 1);
    }
    return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)this, v9, a3, end, marked_count + 1, this->__marked_count_ + 1);
  }
LABEL_18:
  v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>((uint64_t)this, a2, (std::basic_regex<char>::value_type *)a3);
LABEL_19:
  if (v11 != a2 || v11 == (std::basic_regex<char>::value_type *)a3)
  {
LABEL_35:
    v9 = (std::basic_regex<char> *)v11;
    if (v11 != a2)
      return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)this, v9, a3, end, marked_count + 1, this->__marked_count_ + 1);
    return (std::basic_regex<char> *)a2;
  }
  v17 = *a2;
  switch(v17)
  {
    case '$':
      v18 = (std::__node<char> *)operator new(0x18uLL);
      v19 = (this->__flags_ & 0x5F0) == 1024;
      v20 = this->__end_;
      v21 = v20->__first_;
      v22 = &off_24CE6E798;
      goto LABEL_26;
    case '(':
      if ((this->__flags_ & 2) != 0)
      {
        v24 = this->__marked_count_;
      }
      else
      {
        v23 = (std::__node<char> *)operator new(0x18uLL);
        v24 = this->__marked_count_ + 1;
        this->__marked_count_ = v24;
        v25 = this->__end_;
        v26 = v25->__first_;
        v23->__vftable = (std::__node<char>_vtbl *)&off_24CE6EAB0;
        v23[1].__vftable = (std::__node<char>_vtbl *)v26;
        LODWORD(v23[2].__vftable) = v24;
        v25->__first_ = v23;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      }
      ++this->__open_count_;
      v27 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(this, a2 + 1, a3);
      if (v27 == a3 || (v28 = v27, LOBYTE(v27->__traits_.__loc_.__locale_) != 41))
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      if ((this->__flags_ & 2) == 0)
      {
        v29 = (std::__node<char> *)operator new(0x18uLL);
        v30 = this->__end_;
        v31 = v30->__first_;
        v29->__vftable = (std::__node<char>_vtbl *)&off_24CE6EAF8;
        v29[1].__vftable = (std::__node<char>_vtbl *)v31;
        LODWORD(v29[2].__vftable) = v24;
        v30->__first_ = v29;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      }
      --this->__open_count_;
      v11 = (char *)&v28->__traits_.__loc_.__locale_ + 1;
      goto LABEL_35;
    case '^':
      v18 = (std::__node<char> *)operator new(0x18uLL);
      v19 = (this->__flags_ & 0x5F0) == 1024;
      v20 = this->__end_;
      v21 = v20->__first_;
      v22 = &off_24CE6E750;
LABEL_26:
      v18->__vftable = (std::__node<char>_vtbl *)v22;
      v18[1].__vftable = (std::__node<char>_vtbl *)v21;
      LOBYTE(v18[2].__vftable) = v19;
      v20->__first_ = v18;
      this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      v9 = (std::basic_regex<char> *)(a2 + 1);
      return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)this, v9, a3, end, marked_count + 1, this->__marked_count_ + 1);
  }
  return (std::basic_regex<char> *)a2;
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  unint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  std::vector<std::pair<unsigned long, const char *>> *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unsigned int v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  unint64_t v45;
  void *v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  __int128 v54;
  uint64_t v55;
  unint64_t v56;
  char *v57;
  char *v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  void **v66;
  _QWORD *v67;
  _QWORD *v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  _QWORD *v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  __int128 v81;
  unint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  unint64_t v90;
  char *v91;
  unint64_t v92;
  char *v93;
  int64_t v94;
  unint64_t v95;
  char *v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  __int128 *v101;
  char *v102;
  uint64_t v103;
  __int128 v104;
  uint64_t v105;
  char *v106;
  char *v107;
  void *v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  __int128 v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  char *v124;
  uint64_t v125;
  unint64_t v126;
  char *v127;
  unint64_t v128;
  BOOL v129;
  int64_t v130;
  unint64_t v131;
  uint64_t v132;
  char *v133;
  char *v134;
  uint64_t v135;
  char *v136;
  uint64_t v137;
  uint64_t v138;
  __int128 *v139;
  char *v140;
  uint64_t v141;
  __int128 v142;
  uint64_t v143;
  void **v144;
  void **v145;
  unint64_t v146;
  unint64_t v147;
  uint64_t v148;
  void *v149;
  uint64_t *v151;
  uint64_t v152;
  uint64_t v153;
  char v154;
  void *v156;
  char *v157;
  uint64_t v159;
  _BYTE v160[96];
  __int128 v161;
  __int128 v162;
  __int128 v163;

  v162 = 0u;
  v163 = 0u;
  v161 = 0u;
  v6 = *(_QWORD *)(a1 + 40);
  if (!v6)
    goto LABEL_150;
  *(_DWORD *)v160 = 0;
  memset(&v160[8], 0, 85);
  std::deque<std::__state<char>>::__add_back_capacity((uint64_t)&v161);
  v11 = *(_QWORD *)(*((_QWORD *)&v161 + 1) + 8 * (((_QWORD)v163 + *((_QWORD *)&v163 + 1)) / 0x2AuLL))
      + 96 * (((_QWORD)v163 + *((_QWORD *)&v163 + 1)) % 0x2AuLL);
  v12 = *(_OWORD *)&v160[16];
  *(_OWORD *)v11 = *(_OWORD *)v160;
  *(_OWORD *)(v11 + 16) = v12;
  *(_QWORD *)(v11 + 40) = 0;
  *(_QWORD *)(v11 + 48) = 0;
  *(_QWORD *)(v11 + 32) = 0;
  memset(&v160[32], 0, 24);
  *(_QWORD *)(v11 + 56) = 0;
  *(_QWORD *)(v11 + 64) = 0;
  *(_QWORD *)(v11 + 72) = 0;
  memset(&v160[56], 0, 24);
  v13 = *(_QWORD *)&v160[80];
  *(_QWORD *)(v11 + 85) = *(_QWORD *)&v160[85];
  *(_QWORD *)(v11 + 80) = v13;
  v15 = *((_QWORD *)&v163 + 1);
  v14 = v163;
  v16 = ++*((_QWORD *)&v163 + 1);
  v17 = *((_QWORD *)&v161 + 1);
  v18 = *(unsigned int *)(a1 + 32);
  v19 = v163 + v15;
  v20 = 8 * (v19 / 0x2A);
  v21 = 96 * (v19 % 0x2A);
  v22 = *(_QWORD *)(*((_QWORD *)&v161 + 1) + v20) + v21;
  *(_DWORD *)v22 = 0;
  *(_QWORD *)(v22 + 8) = a2;
  *(_QWORD *)(*(_QWORD *)(v17 + v20) + v21 + 16) = a2;
  *(_QWORD *)(*(_QWORD *)(v17 + v20) + v21 + 24) = a3;
  v23 = *(_QWORD *)(v17 + v20) + v21;
  v26 = *(_QWORD *)(v23 + 56);
  v24 = (std::vector<std::pair<unsigned long, const char *>> *)(v23 + 56);
  v25 = v26;
  v27 = ((uint64_t)v24->__end_ - v26) >> 4;
  v151 = a4;
  if (v18 <= v27)
  {
    if (v18 < v27)
      v24->__end_ = (std::vector<std::pair<unsigned long, const char *>>::pointer)(v25 + 16 * v18);
  }
  else
  {
    std::vector<std::pair<unsigned long,char const*>>::__append(v24, v18 - v27);
    v16 = *((_QWORD *)&v163 + 1);
    v14 = v163;
    v17 = *((_QWORD *)&v161 + 1);
  }
  v153 = 0;
  v154 = 0;
  v28 = 0;
  v159 = a3 - a2;
  v29 = v14 + v16 - 1;
  v30 = 8 * (v29 / 0x2A);
  v31 = 96 * (v29 % 0x2A);
  *(_QWORD *)(*(_QWORD *)(v17 + v30) + v31 + 80) = v6;
  v32 = *(_QWORD *)(v17 + v30) + v31;
  *(_DWORD *)(v32 + 88) = a5;
  *(_BYTE *)(v32 + 92) = a6;
  while (2)
  {
    if ((++v28 & 0xFFF) == 0 && (int)(v28 >> 12) >= (int)v159)
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
    v34 = v16 + v163 - 1;
    v35 = *(_QWORD *)(*((_QWORD *)&v161 + 1) + 8 * (v34 / 0x2A));
    v36 = v34 % 0x2A;
    v37 = v35 + 96 * (v34 % 0x2A);
    v39 = (_QWORD *)(v37 + 80);
    v38 = *(_QWORD *)(v37 + 80);
    if (v38)
      (*(void (**)(uint64_t, unint64_t))(*(_QWORD *)v38 + 16))(v38, v35 + 96 * v36);
    switch(*(_DWORD *)v37)
    {
      case 0xFFFFFC18:
        v40 = *(_QWORD *)(v35 + 96 * v36 + 16);
        if ((a5 & 0x20) != 0 && v40 == a2)
        {
          v41 = *((_QWORD *)&v163 + 1) + v163 - 1;
          v42 = *(_QWORD *)(*((_QWORD *)&v161 + 1) + 8 * (v41 / 0x2A));
          v43 = v41 % 0x2A;
          v44 = *(void **)(v42 + 96 * (v41 % 0x2A) + 56);
          if (v44)
            goto LABEL_22;
LABEL_23:
          v46 = *(void **)(v42 + 96 * v43 + 32);
          if (v46)
          {
            *(_QWORD *)(v42 + 96 * v43 + 40) = v46;
            operator delete(v46);
          }
          v47 = 42 * ((uint64_t)(v162 - *((_QWORD *)&v161 + 1)) >> 3) - 1;
          v48 = v163;
          --*((_QWORD *)&v163 + 1);
          if ((_QWORD)v162 == *((_QWORD *)&v161 + 1))
            v47 = 0;
          if ((unint64_t)(v47 - (*((_QWORD *)&v48 + 1) + v48) + 1) >= 0x54)
          {
            operator delete(*(void **)(v162 - 8));
            *(_QWORD *)&v162 = v162 - 8;
          }
          goto LABEL_8;
        }
        v64 = v40 - *(_QWORD *)(v35 + 96 * v36 + 8);
        v65 = v153;
        if ((v154 & (v153 >= v64)) == 0)
          v65 = v64;
        if (v65 == v159)
        {
          v66 = (void **)*((_QWORD *)&v161 + 1);
          if ((_QWORD)v162 == *((_QWORD *)&v161 + 1))
          {
            *((_QWORD *)&v163 + 1) = 0;
            v70 = 0;
          }
          else
          {
            v67 = (_QWORD *)(*((_QWORD *)&v161 + 1) + 8 * ((unint64_t)v163 / 0x2A));
            v68 = (_QWORD *)(*v67 + 96 * ((unint64_t)v163 % 0x2A));
            v69 = *(_QWORD *)(*((_QWORD *)&v161 + 1) + 8 * ((*((_QWORD *)&v163 + 1) + (_QWORD)v163) / 0x2AuLL))
                + 96 * ((*((_QWORD *)&v163 + 1) + (_QWORD)v163) % 0x2AuLL);
            if (v68 == (_QWORD *)v69)
            {
              *((_QWORD *)&v163 + 1) = 0;
              v70 = v162 - *((_QWORD *)&v161 + 1);
              if ((_QWORD)v162 - *((_QWORD *)&v161 + 1) >= 0x11uLL)
                goto LABEL_50;
            }
            else
            {
              do
              {
                v72 = (void *)v68[7];
                if (v72)
                {
                  v68[8] = v72;
                  operator delete(v72);
                }
                v73 = (void *)v68[4];
                if (v73)
                {
                  v68[5] = v73;
                  operator delete(v73);
                }
                v68 += 12;
                if ((_QWORD *)((char *)v68 - *v67) == (_QWORD *)4032)
                {
                  v74 = (_QWORD *)v67[1];
                  ++v67;
                  v68 = v74;
                }
              }
              while (v68 != (_QWORD *)v69);
              v66 = (void **)*((_QWORD *)&v161 + 1);
              *((_QWORD *)&v163 + 1) = 0;
              v70 = v162 - *((_QWORD *)&v161 + 1);
              if ((_QWORD)v162 - *((_QWORD *)&v161 + 1) >= 0x11uLL)
              {
                do
                {
LABEL_50:
                  operator delete(*v66);
                  v66 = (void **)(*((_QWORD *)&v161 + 1) + 8);
                  *((_QWORD *)&v161 + 1) = v66;
                  v70 = v162 - (_QWORD)v66;
                }
                while ((_QWORD)v162 - (_QWORD)v66 > 0x10uLL);
              }
            }
          }
          if (v70 >> 3 == 1)
          {
            v71 = 21;
LABEL_82:
            *(_QWORD *)&v163 = v71;
          }
          else if (v70 >> 3 == 2)
          {
            v71 = 42;
            goto LABEL_82;
          }
          v154 = 1;
          v153 = v159;
          goto LABEL_8;
        }
        v153 = v65;
        v75 = *((_QWORD *)&v163 + 1) + v163 - 1;
        v76 = *(_QWORD *)(*((_QWORD *)&v161 + 1) + 8 * (v75 / 0x2A));
        v77 = v75 % 0x2A;
        v78 = *(void **)(v76 + 96 * (v75 % 0x2A) + 56);
        if (v78)
        {
          *(_QWORD *)(v76 + 96 * v77 + 64) = v78;
          operator delete(v78);
        }
        v79 = *(void **)(v76 + 96 * v77 + 32);
        if (v79)
        {
          *(_QWORD *)(v76 + 96 * v77 + 40) = v79;
          operator delete(v79);
        }
        v80 = 42 * ((uint64_t)(v162 - *((_QWORD *)&v161 + 1)) >> 3) - 1;
        v81 = v163;
        --*((_QWORD *)&v163 + 1);
        if ((_QWORD)v162 == *((_QWORD *)&v161 + 1))
          v80 = 0;
        if ((unint64_t)(v80 - (*((_QWORD *)&v81 + 1) + v81) + 1) >= 0x54)
        {
          operator delete(*(void **)(v162 - 8));
          *(_QWORD *)&v162 = v162 - 8;
        }
        v154 = 1;
LABEL_8:
        v16 = *((_QWORD *)&v163 + 1);
        if (*((_QWORD *)&v163 + 1))
          continue;
        if ((v154 & 1) == 0)
        {
          v6 = 0;
          v144 = (void **)*((_QWORD *)&v161 + 1);
          v145 = (void **)v162;
          *((_QWORD *)&v163 + 1) = 0;
          v146 = v162 - *((_QWORD *)&v161 + 1);
          if ((_QWORD)v162 - *((_QWORD *)&v161 + 1) < 0x11uLL)
            goto LABEL_152;
          goto LABEL_151;
        }
        v143 = *v151;
        *(_QWORD *)v143 = a2;
        *(_QWORD *)(v143 + 8) = a2 + v153;
        v6 = 1;
        *(_BYTE *)(v143 + 16) = 1;
LABEL_150:
        v144 = (void **)*((_QWORD *)&v161 + 1);
        v145 = (void **)v162;
        *((_QWORD *)&v163 + 1) = 0;
        v146 = v162 - *((_QWORD *)&v161 + 1);
        if ((_QWORD)v162 - *((_QWORD *)&v161 + 1) < 0x11uLL)
          goto LABEL_152;
        do
        {
LABEL_151:
          operator delete(*v144);
          v145 = (void **)v162;
          v144 = (void **)(*((_QWORD *)&v161 + 1) + 8);
          *((_QWORD *)&v161 + 1) = v144;
          v146 = v162 - (_QWORD)v144;
        }
        while ((_QWORD)v162 - (_QWORD)v144 > 0x10uLL);
LABEL_152:
        v147 = v146 >> 3;
        if (v147 == 1)
        {
          v148 = 21;
          goto LABEL_156;
        }
        if (v147 == 2)
        {
          v148 = 42;
LABEL_156:
          *(_QWORD *)&v163 = v148;
        }
        if (v144 != v145)
        {
          do
          {
            v149 = *v144++;
            operator delete(v149);
          }
          while (v144 != v145);
          if ((_QWORD)v162 != *((_QWORD *)&v161 + 1))
            *(_QWORD *)&v162 = v162 + ((*((_QWORD *)&v161 + 1) - v162 + 7) & 0xFFFFFFFFFFFFFFF8);
        }
        if ((_QWORD)v161)
          operator delete((void *)v161);
        return v6;
      case 0xFFFFFC19:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        goto LABEL_8;
      case 0xFFFFFC1D:
        v56 = v163;
        v57 = (char *)*((_QWORD *)&v161 + 1);
        v58 = (char *)v162;
        if ((_QWORD)v163)
          goto LABEL_116;
        v59 = (uint64_t)(v162 - *((_QWORD *)&v161 + 1)) >> 3;
        v60 = 42 * v59 - 1;
        if ((_QWORD)v162 == *((_QWORD *)&v161 + 1))
          v60 = 0;
        if ((unint64_t)(v60 - *((_QWORD *)&v163 + 1)) >= 0x2A)
        {
          *(_QWORD *)&v163 = 42;
          v62 = (char *)(v162 - 8);
          v61 = *(_QWORD *)(v162 - 8);
          *(_QWORD *)&v162 = v162 - 8;
          if (*((_QWORD *)&v161 + 1) == (_QWORD)v161)
          {
            if ((unint64_t)v62 >= *((_QWORD *)&v162 + 1))
            {
              if (*((_QWORD *)&v162 + 1) == *((_QWORD *)&v161 + 1))
                v90 = 1;
              else
                v90 = (uint64_t)(*((_QWORD *)&v162 + 1) - *((_QWORD *)&v161 + 1)) >> 2;
              if (v90 >> 61)
                goto LABEL_168;
              v91 = (char *)operator new(8 * v90);
              v92 = (v90 + 3) >> 2;
              v63 = &v91[8 * v92];
              v93 = v63;
              v94 = v62 - v57;
              if (v62 != v57)
              {
                v93 = &v63[v94 & 0xFFFFFFFFFFFFFFF8];
                v95 = v94 - 8;
                v96 = &v91[8 * v92];
                v97 = v57;
                if (v95 < 0x38)
                  goto LABEL_171;
                v98 = 8 * v92;
                v96 = &v91[8 * v92];
                v97 = v57;
                if ((unint64_t)(v96 - v57) < 0x20)
                  goto LABEL_171;
                v99 = (v95 >> 3) + 1;
                v100 = 8 * (v99 & 0x3FFFFFFFFFFFFFFCLL);
                v96 = &v63[v100];
                v97 = &v57[v100];
                v101 = (__int128 *)(v57 + 16);
                v102 = &v91[v98 + 16];
                v103 = v99 & 0x3FFFFFFFFFFFFFFCLL;
                do
                {
                  v104 = *v101;
                  *((_OWORD *)v102 - 1) = *(v101 - 1);
                  *(_OWORD *)v102 = v104;
                  v101 += 2;
                  v102 += 32;
                  v103 -= 4;
                }
                while (v103);
                if (v99 != (v99 & 0x3FFFFFFFFFFFFFFCLL))
                {
LABEL_171:
                  do
                  {
                    v105 = *(_QWORD *)v97;
                    v97 += 8;
                    *(_QWORD *)v96 = v105;
                    v96 += 8;
                  }
                  while (v96 != v93);
                }
              }
              *(_QWORD *)&v161 = v91;
              *((_QWORD *)&v161 + 1) = v63;
              *(_QWORD *)&v162 = v93;
              *((_QWORD *)&v162 + 1) = &v91[8 * v90];
              if (v57)
              {
                operator delete(v57);
                v63 = (char *)*((_QWORD *)&v161 + 1);
              }
            }
            else
            {
              v85 = (uint64_t)(*((_QWORD *)&v162 + 1) - (_QWORD)v62) >> 3;
              if (v85 >= -1)
                v86 = v85 + 1;
              else
                v86 = v85 + 2;
              v87 = v86 >> 1;
              v88 = &v62[8 * (v86 >> 1)];
              v63 = (char *)(v88 - &v62[-*((_QWORD *)&v161 + 1)]);
              if (v62 != *((char **)&v161 + 1))
              {
                memmove((void *)(v88 - &v62[-*((_QWORD *)&v161 + 1)]), *((const void **)&v161 + 1), (size_t)&v62[-*((_QWORD *)&v161 + 1)]);
                v57 = (char *)v162;
              }
              *((_QWORD *)&v161 + 1) = v63;
              *(_QWORD *)&v162 = &v57[8 * v87];
            }
          }
          else
          {
            v63 = (char *)*((_QWORD *)&v161 + 1);
          }
          *((_QWORD *)v63 - 1) = v61;
          v57 = (char *)(*((_QWORD *)&v161 + 1) - 8);
          *((_QWORD *)&v161 + 1) -= 8;
          goto LABEL_115;
        }
        if (v59 < (uint64_t)(*((_QWORD *)&v162 + 1) - v161) >> 3)
        {
          if (*((_QWORD *)&v161 + 1) == (_QWORD)v161)
          {
            *(_QWORD *)v160 = operator new(0xFC0uLL);
            std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back((char **)&v161, v160);
            *(_QWORD *)v160 = *(_QWORD *)(v162 - 8);
            *(_QWORD *)&v162 = v162 - 8;
          }
          else
          {
            *(_QWORD *)v160 = operator new(0xFC0uLL);
          }
          std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((void **)&v161, v160);
          v57 = (char *)*((_QWORD *)&v161 + 1);
          v89 = 21;
          if ((_QWORD)v162 - *((_QWORD *)&v161 + 1) != 8)
            v89 = v163 + 42;
          *(_QWORD *)&v163 = v89;
LABEL_115:
          v56 = v163;
          v58 = (char *)v162;
LABEL_116:
          v110 = &v57[8 * (v56 / 0x2A)];
          v111 = *(_QWORD *)v110 + 96 * (v56 % 0x2A);
          if (v58 == v57)
            v111 = 0;
          if (v111 == *(_QWORD *)v110)
            v111 = *((_QWORD *)v110 - 1) + 4032;
          v112 = *(_OWORD *)(v37 + 16);
          *(_OWORD *)(v111 - 96) = *(_OWORD *)v37;
          *(_OWORD *)(v111 - 80) = v112;
          v113 = v35 + 96 * v36;
          *(_QWORD *)(v111 - 56) = 0;
          *(_QWORD *)(v111 - 48) = 0;
          *(_QWORD *)(v111 - 64) = 0;
          *(_OWORD *)(v111 - 64) = *(_OWORD *)(v113 + 32);
          *(_QWORD *)(v111 - 48) = *(_QWORD *)(v113 + 48);
          *(_QWORD *)(v113 + 32) = 0;
          *(_QWORD *)(v113 + 40) = 0;
          *(_QWORD *)(v113 + 48) = 0;
          *(_QWORD *)(v111 - 40) = 0;
          *(_QWORD *)(v111 - 32) = 0;
          *(_QWORD *)(v111 - 24) = 0;
          *(_OWORD *)(v111 - 40) = *(_OWORD *)(v113 + 56);
          *(_QWORD *)(v111 - 24) = *(_QWORD *)(v113 + 72);
          *(_QWORD *)(v113 + 56) = 0;
          *(_QWORD *)(v113 + 64) = 0;
          *(_QWORD *)(v113 + 72) = 0;
          v114 = *v39;
          *(_QWORD *)(v111 - 11) = *(_QWORD *)(v37 + 85);
          *(_QWORD *)(v111 - 16) = v114;
          v115 = *((_QWORD *)&v163 + 1);
          *(_QWORD *)&v163 = v163 - 1;
          ++*((_QWORD *)&v163 + 1);
          v116 = v115 + v163;
          v117 = (v115 + (uint64_t)v163) / 0x2AuLL;
          v42 = *(_QWORD *)(*((_QWORD *)&v161 + 1) + 8 * v117);
          v43 = v116 - 42 * v117;
          v44 = *(void **)(v42 + 96 * v43 + 56);
          if (v44)
          {
LABEL_22:
            *(_QWORD *)(v42 + 96 * v43 + 64) = v44;
            operator delete(v44);
          }
          goto LABEL_23;
        }
        if (*((_QWORD *)&v162 + 1) == (_QWORD)v161)
          v82 = 1;
        else
          v82 = (uint64_t)(*((_QWORD *)&v162 + 1) - v161) >> 2;
        if (v82 >> 61)
LABEL_168:
          std::__throw_bad_array_new_length[abi:ne180100]();
        v83 = (char *)operator new(8 * v82);
        v156 = operator new(0xFC0uLL);
        if (v82)
        {
          v84 = &v83[8 * v82];
        }
        else
        {
          v106 = (char *)operator new(8uLL);
          v84 = v106 + 8;
          operator delete(v83);
          v57 = (char *)*((_QWORD *)&v161 + 1);
          v58 = (char *)v162;
          v83 = v106;
        }
        *(_QWORD *)v83 = v156;
        v107 = v83 + 8;
        v157 = v83;
        v152 = v35;
        if (v57 == v58)
        {
LABEL_111:
          v108 = (void *)v161;
          *(_QWORD *)&v161 = v157;
          *((_QWORD *)&v161 + 1) = v83;
          *(_QWORD *)&v162 = v107;
          *((_QWORD *)&v162 + 1) = v84;
          v109 = v163 + 42;
          if (v107 - v83 == 8)
            v109 = 21;
          *(_QWORD *)&v163 = v109;
          v57 = v83;
          if (v108)
          {
            operator delete(v108);
            v57 = (char *)*((_QWORD *)&v161 + 1);
          }
          goto LABEL_115;
        }
        break;
      case 0xFFFFFC1F:
        v45 = *((_QWORD *)&v163 + 1) + v163 - 1;
        v42 = *(_QWORD *)(*((_QWORD *)&v161 + 1) + 8 * (v45 / 0x2A));
        v43 = v45 % 0x2A;
        v44 = *(void **)(v42 + 96 * (v45 % 0x2A) + 56);
        if (v44)
          goto LABEL_22;
        goto LABEL_23;
      case 0xFFFFFC20:
        *(_QWORD *)&v49 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v49 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v160[64] = v49;
        *(_OWORD *)&v160[80] = v49;
        *(_OWORD *)&v160[32] = v49;
        *(_OWORD *)&v160[48] = v49;
        *(_OWORD *)v160 = v49;
        *(_OWORD *)&v160[16] = v49;
        std::__state<char>::__state((uint64_t)v160, (__int128 *)(v35 + 96 * v36));
        (*(void (**)(_QWORD, uint64_t, unint64_t))(*(_QWORD *)*v39 + 24))(*v39, 1, v35 + 96 * v36);
        (*(void (**)(_QWORD, _QWORD, _BYTE *))(**(_QWORD **)&v160[80] + 24))(*(_QWORD *)&v160[80], 0, v160);
        v50 = *((_QWORD *)&v161 + 1);
        if ((_QWORD)v162 == *((_QWORD *)&v161 + 1))
          v51 = 0;
        else
          v51 = 42 * ((uint64_t)(v162 - *((_QWORD *)&v161 + 1)) >> 3) - 1;
        v52 = *((_QWORD *)&v163 + 1) + v163;
        if (v51 == *((_QWORD *)&v163 + 1) + (_QWORD)v163)
        {
          std::deque<std::__state<char>>::__add_back_capacity((uint64_t)&v161);
          v50 = *((_QWORD *)&v161 + 1);
          v52 = *((_QWORD *)&v163 + 1) + v163;
        }
        v53 = *(_QWORD *)(v50 + 8 * (v52 / 0x2A)) + 96 * (v52 % 0x2A);
        v54 = *(_OWORD *)&v160[16];
        *(_OWORD *)v53 = *(_OWORD *)v160;
        *(_OWORD *)(v53 + 16) = v54;
        *(_QWORD *)(v53 + 40) = 0;
        *(_QWORD *)(v53 + 48) = 0;
        *(_QWORD *)(v53 + 32) = 0;
        *(_OWORD *)(v53 + 32) = *(_OWORD *)&v160[32];
        *(_QWORD *)(v53 + 48) = *(_QWORD *)&v160[48];
        memset(&v160[32], 0, 24);
        *(_QWORD *)(v53 + 56) = 0;
        *(_QWORD *)(v53 + 64) = 0;
        *(_QWORD *)(v53 + 72) = 0;
        *(_OWORD *)(v53 + 56) = *(_OWORD *)&v160[56];
        *(_QWORD *)(v53 + 72) = *(_QWORD *)&v160[72];
        memset(&v160[56], 0, 24);
        v55 = *(_QWORD *)&v160[80];
        *(_QWORD *)(v53 + 85) = *(_QWORD *)&v160[85];
        *(_QWORD *)(v53 + 80) = v55;
        ++*((_QWORD *)&v163 + 1);
        if (*(_QWORD *)&v160[56])
        {
          *(_QWORD *)&v160[64] = *(_QWORD *)&v160[56];
          operator delete(*(void **)&v160[56]);
        }
        if (*(_QWORD *)&v160[32])
        {
          *(_QWORD *)&v160[40] = *(_QWORD *)&v160[32];
          operator delete(*(void **)&v160[32]);
        }
        goto LABEL_8;
      default:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
    }
    break;
  }
  while (v107 != v84)
  {
    v118 = v83;
LABEL_123:
    v119 = *(_QWORD *)v57;
    v57 += 8;
    *(_QWORD *)v107 = v119;
    v107 += 8;
    v83 = v118;
    if (v57 == (char *)v162)
      goto LABEL_111;
  }
  if (v83 > v157)
  {
    v120 = (v83 - v157) >> 3;
    if (v120 >= -1)
      v121 = v120 + 1;
    else
      v121 = v120 + 2;
    v122 = v121 >> 1;
    v123 = &v83[-8 * (v121 >> 1)];
    v124 = v107;
    if (v107 != v83)
    {
      memmove(v123, v83, v107 - v83);
      v124 = v83;
    }
    v125 = -v122;
    v84 = v107;
    v107 = &v123[v107 - v83];
    v118 = &v124[8 * v125];
    v35 = v152;
    goto LABEL_123;
  }
  if (v107 == v157)
    v126 = 1;
  else
    v126 = (v107 - v157) >> 2;
  if (v126 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v127 = (char *)operator new(8 * v126);
  v128 = v126 >> 2;
  v118 = &v127[8 * (v126 >> 2)];
  v130 = v107 - v83;
  v129 = v107 == v83;
  v107 = v118;
  if (!v129)
  {
    v107 = &v118[v130 & 0xFFFFFFFFFFFFFFF8];
    v131 = v130 - 8;
    if (v131 >= 0x38 && (v132 = 8 * v128, (unint64_t)(&v127[8 * v128] - v83) >= 0x20))
    {
      v137 = (v131 >> 3) + 1;
      v138 = 8 * (v137 & 0x3FFFFFFFFFFFFFFCLL);
      v133 = &v118[v138];
      v134 = &v83[v138];
      v139 = (__int128 *)(v83 + 16);
      v140 = &v127[v132 + 16];
      v141 = v137 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v142 = *v139;
        *((_OWORD *)v140 - 1) = *(v139 - 1);
        *(_OWORD *)v140 = v142;
        v139 += 2;
        v140 += 32;
        v141 -= 4;
      }
      while (v141);
      if (v137 == (v137 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_141;
    }
    else
    {
      v133 = &v127[8 * (v126 >> 2)];
      v134 = v83;
    }
    do
    {
      v135 = *(_QWORD *)v134;
      v134 += 8;
      *(_QWORD *)v133 = v135;
      v133 += 8;
    }
    while (v133 != v107);
  }
LABEL_141:
  v84 = &v127[8 * v126];
  if (v157)
  {
    v136 = v127;
    operator delete(v157);
    v157 = v136;
  }
  else
  {
    v157 = v127;
  }
  goto LABEL_123;
}

void sub_2129DF650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p)
{
  void *v16;
  uint64_t v17;

  operator delete(__p);
  operator delete(v16);
  std::deque<std::__state<char>>::~deque[abi:ne180100](v17 - 144);
  _Unwind_Resume(a1);
}

void sub_2129DF678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  void *v16;
  uint64_t v17;

  operator delete(v16);
  std::deque<std::__state<char>>::~deque[abi:ne180100](v17 - 144);
  _Unwind_Resume(a1);
}

void sub_2129DF698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, char a19)
{
  uint64_t v19;

  std::deque<std::__state<char>>::~deque[abi:ne180100](v19 - 144);
  _Unwind_Resume(a1);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(uint64_t a1, uint64_t a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  const char *v20;
  char v21;
  unsigned int v22;
  const char *v23;
  BOOL v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  char *v29;
  void *v30;
  void *v31;
  __int128 v32;
  char *v33;
  __int128 v34;
  uint64_t v35;
  const char *v36;
  __int128 v37;
  char *v38;
  char *v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  char *v47;
  char *v48;
  size_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  int64_t v59;
  unint64_t v60;
  uint64_t v61;
  char *v62;
  const char *v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  char *v67;
  char *v68;
  int64_t v69;
  uint64_t v70;
  unint64_t v71;
  char *v72;
  unint64_t v73;
  char *v74;
  char *v75;
  __int128 v76;
  unint64_t v77;
  char *v78;
  uint64_t v79;
  char *v80;
  char *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  BOOL v89;
  BOOL v90;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  char *v95;
  const double *v96;
  double *v97;
  uint64_t v98;
  const double *v99;
  double *v100;
  BOOL v102;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  const double *v107;
  double *v108;
  uint64_t v109;
  const double *v110;
  double *v111;
  uint64_t v112;
  unint64_t v113;
  _BYTE *v114;
  unsigned int v115;
  uint64_t v116;
  char v117;
  const char *v119;
  uint64_t *v120;
  _BYTE v123[96];
  std::vector<std::csub_match>::value_type __x;
  _BYTE v125[40];
  void *v126[2];
  _BYTE v127[40];
  char *v128;
  char *v129;
  unint64_t v130;
  float64x2x2_t v131;
  float64x2x2_t v132;
  float64x2x2_t v133;
  float64x2x2_t v134;

  v128 = 0;
  v129 = 0;
  v130 = 0;
  *(_DWORD *)&v127[36] = -1431655766;
  *(_QWORD *)v125 = 0xAAAAAAAA00000000;
  memset(&v125[8], 0, 32);
  *(_OWORD *)v126 = 0u;
  memset(v127, 0, 36);
  v6 = *(_QWORD *)(a1 + 40);
  if (!v6)
  {
    v15 = 0;
    v16 = *(void **)v127;
    if (!*(_QWORD *)v127)
      goto LABEL_149;
    goto LABEL_148;
  }
  __x.second = a3;
  *(_QWORD *)&__x.matched = 0xAAAAAAAAAAAAAA00;
  __x.first = a3;
  *(_DWORD *)v123 = 0;
  memset(&v123[8], 0, 85);
  v11 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v128, (uint64_t)v123);
  v129 = v11;
  if (*(_QWORD *)&v123[56])
    operator delete(*(void **)&v123[56]);
  if (*(_QWORD *)&v123[32])
    operator delete(*(void **)&v123[32]);
  v12 = *((_QWORD *)v11 - 8);
  *((_DWORD *)v11 - 24) = 0;
  *((_QWORD *)v11 - 11) = a2;
  *((_QWORD *)v11 - 10) = a2;
  *((_QWORD *)v11 - 9) = a3;
  v13 = *(unsigned int *)(a1 + 28);
  v14 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v11 - 7) - v12) >> 3);
  if (v13 <= v14)
  {
    if (v13 < v14)
      *((_QWORD *)v11 - 7) = v12 + 24 * v13;
  }
  else
  {
    std::vector<std::sub_match<char const*>>::__append((std::vector<std::csub_match> *)(v11 - 64), v13 - v14, &__x);
  }
  v17 = *((_QWORD *)v11 - 5);
  v18 = *(unsigned int *)(a1 + 32);
  v19 = (*((_QWORD *)v11 - 4) - v17) >> 4;
  if (v18 <= v19)
  {
    if (v18 < v19)
      *((_QWORD *)v11 - 4) = v17 + 16 * v18;
  }
  else
  {
    std::vector<std::pair<unsigned long,char const*>>::__append((std::vector<std::pair<unsigned long, const char *>> *)(v11 - 40), v18 - v19);
  }
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23 = &a3[-a2];
  *((_QWORD *)v11 - 2) = v6;
  *((_DWORD *)v11 - 2) = a5;
  *(v11 - 4) = a6;
  v120 = a4;
  while (2)
  {
    v24 = (++v22 & 0xFFF) != 0 || (int)(v22 >> 12) < (int)v23;
    if (!v24)
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
    v26 = v11 - 16;
    v25 = *((_QWORD *)v11 - 2);
    v27 = v11 - 96;
    if (v25)
      (*(void (**)(uint64_t, char *))(*(_QWORD *)v25 + 16))(v25, v11 - 96);
    switch(*(_DWORD *)v27)
    {
      case 0xFFFFFC18:
        v28 = *((_QWORD *)v11 - 10);
        if ((a5 & 0x20) != 0 && v28 == a2)
          goto LABEL_29;
        v36 = (const char *)(v28 - *((_QWORD *)v11 - 11));
        if ((v21 & ((uint64_t)v20 >= (uint64_t)v36)) != 0)
          goto LABEL_95;
        v37 = *((_OWORD *)v11 - 5);
        *(_OWORD *)v125 = *(_OWORD *)v27;
        *(_OWORD *)&v125[16] = v37;
        if (v125 == v27)
          goto LABEL_94;
        v38 = (char *)*((_QWORD *)v11 - 8);
        v39 = (char *)*((_QWORD *)v11 - 7);
        v40 = 0xAAAAAAAAAAAAAAABLL * ((v39 - v38) >> 3);
        v41 = (uint64_t)v126[1];
        v42 = *(char **)&v125[32];
        if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v126[1] - *(_QWORD *)&v125[32]) >> 3) >= v40)
        {
          v47 = (char *)v126[0];
          if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v126[0] - *(_QWORD *)&v125[32]) >> 3) >= v40)
          {
            v55 = *(_QWORD *)&v125[32];
            if (v38 != v39)
            {
              v56 = *(_QWORD *)&v125[32];
              do
              {
                *(_OWORD *)v56 = *(_OWORD *)v38;
                *(_BYTE *)(v56 + 16) = v38[16];
                v55 += 24;
                v38 += 24;
                v56 += 24;
              }
              while (v38 != v39);
            }
            v50 = v55 - (_QWORD)v42;
            v47 = v42;
          }
          else
          {
            v51 = &v38[8 * (((uint64_t)v126[0] - *(_QWORD *)&v125[32]) >> 3)];
            if (v126[0] != *(void **)&v125[32])
            {
              do
              {
                *(_OWORD *)v42 = *(_OWORD *)v38;
                v42[16] = v38[16];
                v38 += 24;
                v42 += 24;
              }
              while (v38 != v51);
            }
            v52 = v47;
            if (v51 != v39)
            {
              v53 = v47;
              do
              {
                v54 = *(_OWORD *)v51;
                *((_QWORD *)v53 + 2) = *((_QWORD *)v51 + 2);
                *(_OWORD *)v53 = v54;
                v53 += 24;
                v51 += 24;
                v52 += 24;
              }
              while (v51 != v39);
            }
            v50 = v52 - v47;
          }
        }
        else
        {
          v119 = v36;
          if (*(_QWORD *)&v125[32])
          {
            v126[0] = *(void **)&v125[32];
            operator delete(*(void **)&v125[32]);
            v41 = 0;
            *(_QWORD *)&v125[32] = 0;
            *(_OWORD *)v126 = 0uLL;
          }
          if (v40 > 0xAAAAAAAAAAAAAAALL)
            goto LABEL_156;
          v43 = 0xAAAAAAAAAAAAAAABLL * (v41 >> 3);
          v44 = 2 * v43;
          if (2 * v43 <= v40)
            v44 = 0xAAAAAAAAAAAAAAABLL * ((v39 - v38) >> 3);
          v45 = v43 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v44;
          if (v45 > 0xAAAAAAAAAAAAAAALL)
LABEL_156:
            std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
          v46 = (char *)operator new(24 * v45);
          v47 = v46;
          *(_QWORD *)&v125[32] = v46;
          v126[0] = v46;
          v126[1] = &v46[24 * v45];
          v48 = v46;
          if (v38 != v39)
          {
            v49 = 24 * ((v39 - v38 - 24) / 0x18uLL) + 24;
            memcpy(v46, v38, v49);
            v48 = &v47[v49];
          }
          v50 = v48 - v47;
          v36 = v119;
        }
        v126[0] = &v47[v50];
        v57 = (char *)*((_QWORD *)v11 - 5);
        v58 = (char *)*((_QWORD *)v11 - 4);
        v59 = v58 - v57;
        v60 = (v58 - v57) >> 4;
        v61 = *(_QWORD *)&v127[16];
        v62 = *(char **)v127;
        if (v60 <= (uint64_t)(*(_QWORD *)&v127[16] - *(_QWORD *)v127) >> 4)
        {
          v67 = *(char **)&v127[8];
          v70 = *(_QWORD *)&v127[8] - *(_QWORD *)v127;
          v71 = (uint64_t)(*(_QWORD *)&v127[8] - *(_QWORD *)v127) >> 4;
          if (v71 < v60)
          {
            v72 = &v57[16 * v71];
            if (*(_QWORD *)&v127[8] != *(_QWORD *)v127)
            {
              v73 = v70 - 16;
              if ((unint64_t)(v70 - 16) < 0xD0)
                goto LABEL_159;
              v86 = v70 & 0xFFFFFFFFFFFFFFF0;
              v87 = *(_QWORD *)v127 + 8 + v86 - 16;
              v88 = (unint64_t)&v57[v86 - 8];
              v89 = *(_QWORD *)v127 + 8 >= (unint64_t)&v57[v86]
                 || (unint64_t)(v57 + 8) >= *(_QWORD *)v127 + v86;
              v90 = !v89;
              if ((unint64_t)v57 < v87 && *(_QWORD *)v127 < v88)
                goto LABEL_159;
              if (v90)
                goto LABEL_159;
              v92 = (v73 >> 4) + 1;
              v93 = 16 * (v92 & 0x1FFFFFFFFFFFFFFCLL);
              v94 = (char *)(*(_QWORD *)v127 + v93);
              v95 = &v57[v93];
              v96 = (const double *)(v57 + 32);
              v97 = (double *)(*(_QWORD *)v127 + 32);
              v98 = v92 & 0x1FFFFFFFFFFFFFFCLL;
              do
              {
                v99 = v96 - 4;
                v131 = vld2q_f64(v99);
                v133 = vld2q_f64(v96);
                v100 = v97 - 4;
                vst2q_f64(v100, v131);
                vst2q_f64(v97, v133);
                v96 += 8;
                v97 += 8;
                v98 -= 4;
              }
              while (v98);
              v62 = v94;
              v57 = v95;
              if (v92 != (v92 & 0x1FFFFFFFFFFFFFFCLL))
              {
LABEL_159:
                do
                {
                  *(_QWORD *)v62 = *(_QWORD *)v57;
                  *((_QWORD *)v62 + 1) = *((_QWORD *)v57 + 1);
                  v57 += 16;
                  v62 += 16;
                }
                while (v57 != v72);
              }
            }
            v74 = v67;
            if (v72 != v58)
            {
              v75 = v67;
              do
              {
                v76 = *(_OWORD *)v72;
                v72 += 16;
                *(_OWORD *)v75 = v76;
                v75 += 16;
                v74 += 16;
              }
              while (v72 != v58);
            }
            v69 = v74 - v67;
            goto LABEL_93;
          }
          if (v57 == v58)
          {
            v78 = *(char **)v127;
          }
          else
          {
            v77 = v59 - 16;
            if ((unint64_t)(v59 - 16) >= 0xD0)
            {
              v102 = *(_QWORD *)v127 + 8 < (unint64_t)&v57[(v77 & 0xFFFFFFFFFFFFFFF0) + 16]
                  && (unint64_t)(v57 + 8) < *(_QWORD *)v127 + (v77 & 0xFFFFFFFFFFFFFFF0) + 16;
              v78 = *(char **)v127;
              if (((unint64_t)v57 >= *(_QWORD *)v127 + 8 + (v77 & 0xFFFFFFFFFFFFFFF0)
                 || *(_QWORD *)v127 >= (unint64_t)&v57[(v77 & 0xFFFFFFFFFFFFFFF0) + 8])
                && !v102)
              {
                v104 = (v77 >> 4) + 1;
                v105 = 16 * (v104 & 0x1FFFFFFFFFFFFFFCLL);
                v78 = (char *)(*(_QWORD *)v127 + v105);
                v106 = &v57[v105];
                v107 = (const double *)(v57 + 32);
                v108 = (double *)(*(_QWORD *)v127 + 32);
                v109 = v104 & 0x1FFFFFFFFFFFFFFCLL;
                do
                {
                  v110 = v107 - 4;
                  v132 = vld2q_f64(v110);
                  v134 = vld2q_f64(v107);
                  v111 = v108 - 4;
                  vst2q_f64(v111, v132);
                  vst2q_f64(v108, v134);
                  v107 += 8;
                  v108 += 8;
                  v109 -= 4;
                }
                while (v109);
                v57 = v106;
                if (v104 == (v104 & 0x1FFFFFFFFFFFFFFCLL))
                  goto LABEL_92;
              }
            }
            else
            {
              v78 = *(char **)v127;
            }
            do
            {
              *(_QWORD *)v78 = *(_QWORD *)v57;
              *((_QWORD *)v78 + 1) = *((_QWORD *)v57 + 1);
              v78 += 16;
              v57 += 16;
            }
            while (v57 != v58);
          }
LABEL_92:
          v69 = v78 - v62;
          v67 = v62;
          goto LABEL_93;
        }
        v63 = v36;
        if (*(_QWORD *)v127)
        {
          *(_QWORD *)&v127[8] = *(_QWORD *)v127;
          operator delete(*(void **)v127);
          v61 = 0;
          memset(v127, 0, 24);
        }
        if (v59 < 0)
          goto LABEL_155;
        v64 = v61 >> 3;
        if (v61 >> 3 <= v60)
          v64 = (v58 - v57) >> 4;
        v65 = (unint64_t)v61 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v64;
        if (v65 >> 60)
LABEL_155:
          std::vector<std::sub_match<char const*>>::__throw_length_error[abi:ne180100]();
        v66 = (char *)operator new(16 * v65);
        v67 = v66;
        *(_QWORD *)v127 = v66;
        *(_QWORD *)&v127[8] = v66;
        *(_QWORD *)&v127[16] = &v66[16 * v65];
        v68 = v66;
        if (v57 != v58)
        {
          memcpy(v66, v57, v59 & 0xFFFFFFFFFFFFFFF0);
          v68 = &v67[v59 & 0xFFFFFFFFFFFFFFF0];
        }
        v69 = v68 - v67;
        v36 = v63;
LABEL_93:
        *(_QWORD *)&v127[8] = &v67[v69];
LABEL_94:
        v79 = *(_QWORD *)v26;
        *(_QWORD *)&v127[29] = *(_QWORD *)(v26 + 5);
        *(_QWORD *)&v127[24] = v79;
        v20 = v36;
LABEL_95:
        v80 = v129;
        if (v20 == v23)
        {
          v81 = v128;
          while (v80 != v81)
          {
            v82 = (void *)*((_QWORD *)v80 - 5);
            if (v82)
            {
              *((_QWORD *)v80 - 4) = v82;
              operator delete(v82);
            }
            v83 = (void *)*((_QWORD *)v80 - 8);
            if (v83)
            {
              *((_QWORD *)v80 - 7) = v83;
              operator delete(v83);
            }
            v80 -= 96;
          }
          v129 = v81;
          v21 = 1;
          v20 = v23;
        }
        else
        {
          v84 = (void *)*((_QWORD *)v129 - 5);
          if (v84)
          {
            *((_QWORD *)v129 - 4) = v84;
            operator delete(v84);
          }
          v85 = (void *)*((_QWORD *)v80 - 8);
          if (v85)
          {
            *((_QWORD *)v80 - 7) = v85;
            operator delete(v85);
          }
          v129 = v80 - 96;
          v21 = 1;
        }
LABEL_18:
        v15 = v128;
        v11 = v129;
        if (v128 != v129)
          continue;
        if ((v21 & 1) == 0)
        {
          v6 = 0;
          v16 = *(void **)v127;
          if (!*(_QWORD *)v127)
            goto LABEL_149;
          goto LABEL_148;
        }
        v112 = *v120;
        *(_QWORD *)v112 = a2;
        *(_QWORD *)(v112 + 8) = &v20[a2];
        *(_BYTE *)(v112 + 16) = 1;
        if (v126[0] != *(void **)&v125[32])
        {
          v113 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v126[0] - *(_QWORD *)&v125[32]) >> 3);
          v114 = (_BYTE *)(*(_QWORD *)&v125[32] + 16);
          v115 = 1;
          do
          {
            v116 = v112 + 24 * v115;
            *(_OWORD *)v116 = *((_OWORD *)v114 - 1);
            v117 = *v114;
            v114 += 24;
            *(_BYTE *)(v116 + 16) = v117;
            v24 = v113 > v115++;
          }
          while (v24);
        }
        v6 = 1;
        v16 = *(void **)v127;
        if (*(_QWORD *)v127)
        {
LABEL_148:
          *(_QWORD *)&v127[8] = v16;
          operator delete(v16);
        }
LABEL_149:
        if (*(_QWORD *)&v125[32])
        {
          v126[0] = *(void **)&v125[32];
          operator delete(*(void **)&v125[32]);
        }
        if (v15)
          operator delete(v15);
        return v6;
      case 0xFFFFFC1D:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        goto LABEL_18;
      case 0xFFFFFC1F:
LABEL_29:
        v29 = v129;
        v30 = (void *)*((_QWORD *)v129 - 5);
        if (v30)
        {
          *((_QWORD *)v129 - 4) = v30;
          operator delete(v30);
        }
        v31 = (void *)*((_QWORD *)v29 - 8);
        if (v31)
        {
          *((_QWORD *)v29 - 7) = v31;
          operator delete(v31);
        }
        v129 = v29 - 96;
        goto LABEL_18;
      case 0xFFFFFC20:
        *(_QWORD *)&v32 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v123[64] = v32;
        *(_OWORD *)&v123[80] = v32;
        *(_OWORD *)&v123[32] = v32;
        *(_OWORD *)&v123[48] = v32;
        *(_OWORD *)v123 = v32;
        *(_OWORD *)&v123[16] = v32;
        std::__state<char>::__state((uint64_t)v123, (__int128 *)v11 - 6);
        (*(void (**)(_QWORD, uint64_t, char *))(**(_QWORD **)v26 + 24))(*(_QWORD *)v26, 1, v11 - 96);
        (*(void (**)(_QWORD, _QWORD, _BYTE *))(**(_QWORD **)&v123[80] + 24))(*(_QWORD *)&v123[80], 0, v123);
        v33 = v129;
        if ((unint64_t)v129 >= v130)
        {
          v129 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v128, (uint64_t)v123);
          if (*(_QWORD *)&v123[56])
          {
            *(_QWORD *)&v123[64] = *(_QWORD *)&v123[56];
            operator delete(*(void **)&v123[56]);
          }
        }
        else
        {
          v34 = *(_OWORD *)&v123[16];
          *(_OWORD *)v129 = *(_OWORD *)v123;
          *((_OWORD *)v33 + 1) = v34;
          *((_QWORD *)v33 + 4) = 0;
          *((_QWORD *)v33 + 5) = 0;
          *((_QWORD *)v33 + 6) = 0;
          *((_QWORD *)v33 + 7) = 0;
          *((_OWORD *)v33 + 2) = *(_OWORD *)&v123[32];
          *((_QWORD *)v33 + 6) = *(_QWORD *)&v123[48];
          memset(&v123[32], 0, 24);
          *((_QWORD *)v33 + 8) = 0;
          *((_QWORD *)v33 + 9) = 0;
          *(_OWORD *)(v33 + 56) = *(_OWORD *)&v123[56];
          *((_QWORD *)v33 + 9) = *(_QWORD *)&v123[72];
          memset(&v123[56], 0, 24);
          v35 = *(_QWORD *)&v123[80];
          *(_QWORD *)(v33 + 85) = *(_QWORD *)&v123[85];
          *((_QWORD *)v33 + 10) = v35;
          v129 = v33 + 96;
        }
        if (*(_QWORD *)&v123[32])
        {
          *(_QWORD *)&v123[40] = *(_QWORD *)&v123[32];
          operator delete(*(void **)&v123[32]);
        }
        goto LABEL_18;
      default:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
    }
  }
}

void sub_2129E00A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  uint64_t v35;

  std::__state<char>::~__state(&a35);
  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v35 - 120));
  _Unwind_Resume(a1);
}

uint64_t std::deque<std::__state<char>>::~deque[abi:ne180100](uint64_t a1)
{
  void **v2;
  void **v3;
  unint64_t v4;
  void **v5;
  char *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v2 = *(void ***)(a1 + 8);
  v3 = *(void ***)(a1 + 16);
  if (v3 == v2)
  {
    v3 = *(void ***)(a1 + 8);
    *(_QWORD *)(a1 + 40) = 0;
    v11 = 0;
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = &v2[v4 / 0x2A];
    v6 = (char *)*v5 + 96 * (v4 % 0x2A);
    v7 = (unint64_t)v2[(*(_QWORD *)(a1 + 40) + v4) / 0x2A] + 96 * ((*(_QWORD *)(a1 + 40) + v4) % 0x2A);
    if (v6 != (char *)v7)
    {
      do
      {
        v8 = (void *)*((_QWORD *)v6 + 7);
        if (v8)
        {
          *((_QWORD *)v6 + 8) = v8;
          operator delete(v8);
        }
        v9 = (void *)*((_QWORD *)v6 + 4);
        if (v9)
        {
          *((_QWORD *)v6 + 5) = v9;
          operator delete(v9);
        }
        v6 += 96;
        if (v6 - (_BYTE *)*v5 == 4032)
        {
          v10 = (char *)v5[1];
          ++v5;
          v6 = v10;
        }
      }
      while (v6 != (char *)v7);
      v2 = *(void ***)(a1 + 8);
      v3 = *(void ***)(a1 + 16);
    }
    *(_QWORD *)(a1 + 40) = 0;
    v11 = (char *)v3 - (char *)v2;
    if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
    {
      do
      {
        operator delete(*v2);
        v3 = *(void ***)(a1 + 16);
        v2 = (void **)(*(_QWORD *)(a1 + 8) + 8);
        *(_QWORD *)(a1 + 8) = v2;
        v11 = (char *)v3 - (char *)v2;
      }
      while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
    }
  }
  v12 = v11 >> 3;
  if (v12 == 1)
  {
    v13 = 21;
    goto LABEL_19;
  }
  if (v12 == 2)
  {
    v13 = 42;
LABEL_19:
    *(_QWORD *)(a1 + 32) = v13;
  }
  if (v2 != v3)
  {
    do
    {
      v14 = *v2++;
      operator delete(v14);
    }
    while (v2 != v3);
    v16 = *(_QWORD *)(a1 + 8);
    v15 = *(_QWORD *)(a1 + 16);
    if (v15 != v16)
      *(_QWORD *)(a1 + 16) = v15 + ((v16 - v15 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::deque<std::__state<char>>::__add_back_capacity(uint64_t a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  char *v5;
  _QWORD *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  void *v26;
  char *v27;
  char *v28;
  char *v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  BOOL v38;
  int64_t v39;
  unint64_t v40;
  char *v41;
  _QWORD *v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  int64_t v46;
  unint64_t v47;
  char *v48;
  unint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _OWORD *v56;
  unint64_t v57;
  char *v58;
  char *v59;
  unint64_t v60;
  int64_t v61;
  unint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __int128 *v68;
  char *v69;
  uint64_t v70;
  __int128 v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  __int128 *v76;
  _OWORD *v77;
  uint64_t v78;
  __int128 v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  __int128 *v84;
  _OWORD *v85;
  uint64_t v86;
  __int128 v87;
  uint64_t v88;
  void *v89;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = v2 >= 0x2A;
  v4 = v2 - 42;
  if (v3)
  {
    *(_QWORD *)(a1 + 32) = v4;
    v6 = *(_QWORD **)(a1 + 8);
    v5 = *(char **)(a1 + 16);
    v7 = (char *)(v6 + 1);
    v8 = *v6;
    *(_QWORD *)(a1 + 8) = v6 + 1;
    if (v5 != *(char **)(a1 + 24))
    {
LABEL_76:
      *(_QWORD *)v5 = v8;
      *(_QWORD *)(a1 + 16) += 8;
      return;
    }
    v9 = *(char **)a1;
    v10 = (uint64_t)&v7[-*(_QWORD *)a1];
    if ((unint64_t)v7 <= *(_QWORD *)a1)
    {
      v32 = (v5 - v9) >> 2;
      if (v5 == v9)
        v32 = 1;
      if (!(v32 >> 61))
      {
        v33 = v32 >> 2;
        v34 = 8 * v32;
        v35 = (char *)operator new(8 * v32);
        v36 = &v35[8 * v33];
        v37 = &v35[v34];
        v39 = v5 - v7;
        v38 = v5 == v7;
        v5 = v36;
        if (!v38)
        {
          v5 = &v36[v39 & 0xFFFFFFFFFFFFFFF8];
          v40 = v39 - 8;
          if ((unint64_t)(v39 - 8) >= 0x38)
          {
            v73 = &v35[8 * v33];
            v41 = v73;
            if ((unint64_t)(v73 - v7) >= 0x20)
            {
              v74 = (v40 >> 3) + 1;
              v75 = 8 * (v74 & 0x3FFFFFFFFFFFFFFCLL);
              v41 = &v36[v75];
              v7 += v75;
              v76 = (__int128 *)(v6 + 3);
              v77 = v73 + 16;
              v78 = v74 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                v79 = *v76;
                *(v77 - 1) = *(v76 - 1);
                *v77 = v79;
                v76 += 2;
                v77 += 2;
                v78 -= 4;
              }
              while (v78);
              if (v74 == (v74 & 0x3FFFFFFFFFFFFFFCLL))
                goto LABEL_74;
            }
          }
          else
          {
            v41 = &v35[8 * v33];
          }
          do
          {
            v80 = *(_QWORD *)v7;
            v7 += 8;
            *(_QWORD *)v41 = v80;
            v41 += 8;
          }
          while (v41 != v5);
        }
        goto LABEL_74;
      }
LABEL_85:
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
LABEL_5:
    v11 = v10 >> 3;
    if (v11 >= -1)
      v12 = v11 + 1;
    else
      v12 = v11 + 2;
    v13 = v12 >> 1;
    v14 = -v13;
    v15 = &v7[-8 * v13];
    v16 = v5 - v7;
    if (v5 != v7)
    {
      memmove(&v7[-8 * v13], v7, v5 - v7);
      v7 = *(char **)(a1 + 8);
    }
    v5 = &v15[v16];
    *(_QWORD *)(a1 + 8) = &v7[8 * v14];
    *(_QWORD *)(a1 + 16) = &v15[v16];
    goto LABEL_76;
  }
  v18 = *(_QWORD *)(a1 + 16);
  v17 = *(_QWORD *)(a1 + 24);
  v19 = *(_QWORD *)(a1 + 8);
  v20 = v18 - v19;
  v21 = (v18 - v19) >> 3;
  v22 = v17 - *(_QWORD *)a1;
  if (v21 < (unint64_t)(v22 >> 3))
  {
    if (v17 != v18)
    {
      v89 = operator new(0xFC0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back((char **)a1, &v89);
      return;
    }
    v89 = operator new(0xFC0uLL);
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((void **)a1, &v89);
    v42 = *(_QWORD **)(a1 + 8);
    v5 = *(char **)(a1 + 16);
    v7 = (char *)(v42 + 1);
    v8 = *v42;
    *(_QWORD *)(a1 + 8) = v42 + 1;
    if (v5 != *(char **)(a1 + 24))
      goto LABEL_76;
    v9 = *(char **)a1;
    v10 = (uint64_t)&v7[-*(_QWORD *)a1];
    if ((unint64_t)v7 <= *(_QWORD *)a1)
    {
      v43 = (v5 - v9) >> 2;
      if (v5 == v9)
        v43 = 1;
      if (!(v43 >> 61))
      {
        v44 = v43 >> 2;
        v45 = 8 * v43;
        v35 = (char *)operator new(8 * v43);
        v36 = &v35[8 * v44];
        v37 = &v35[v45];
        v46 = v5 - v7;
        v38 = v5 == v7;
        v5 = v36;
        if (!v38)
        {
          v5 = &v36[v46 & 0xFFFFFFFFFFFFFFF8];
          v47 = v46 - 8;
          if ((unint64_t)(v46 - 8) >= 0x38)
          {
            v81 = &v35[8 * v44];
            v48 = v81;
            if ((unint64_t)(v81 - v7) >= 0x20)
            {
              v82 = (v47 >> 3) + 1;
              v83 = 8 * (v82 & 0x3FFFFFFFFFFFFFFCLL);
              v48 = &v36[v83];
              v7 += v83;
              v84 = (__int128 *)(v42 + 3);
              v85 = v81 + 16;
              v86 = v82 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                v87 = *v84;
                *(v85 - 1) = *(v84 - 1);
                *v85 = v87;
                v84 += 2;
                v85 += 2;
                v86 -= 4;
              }
              while (v86);
              if (v82 == (v82 & 0x3FFFFFFFFFFFFFFCLL))
                goto LABEL_74;
            }
          }
          else
          {
            v48 = &v35[8 * v44];
          }
          do
          {
            v88 = *(_QWORD *)v7;
            v7 += 8;
            *(_QWORD *)v48 = v88;
            v48 += 8;
          }
          while (v48 != v5);
        }
LABEL_74:
        *(_QWORD *)a1 = v35;
        *(_QWORD *)(a1 + 8) = v36;
        *(_QWORD *)(a1 + 16) = v5;
        *(_QWORD *)(a1 + 24) = v37;
        if (v9)
        {
          operator delete(v9);
          v5 = *(char **)(a1 + 16);
        }
        goto LABEL_76;
      }
      goto LABEL_85;
    }
    goto LABEL_5;
  }
  v23 = v22 >> 2;
  if (v17 == *(_QWORD *)a1)
    v24 = 1;
  else
    v24 = v23;
  if (v24 >> 61)
    goto LABEL_85;
  v25 = (char *)operator new(8 * v24);
  v26 = operator new(0xFC0uLL);
  v27 = &v25[8 * v21];
  v28 = &v25[8 * v24];
  if (v21 == v24)
  {
    v30 = v26;
    if (v20 < 1)
    {
      if (v18 == v19)
        v49 = 1;
      else
        v49 = v20 >> 2;
      if (v49 >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v27 = (char *)operator new(8 * v49);
      v28 = &v27[8 * v49];
      operator delete(v25);
      v50 = *(_QWORD *)(a1 + 8);
      v18 = *(_QWORD *)(a1 + 16);
      v25 = v27;
      *(_QWORD *)v27 = v30;
      v29 = v27 + 8;
      if (v18 == v50)
        goto LABEL_45;
    }
    else
    {
      v31 = v21 + 2;
      if (v21 >= -1)
        v31 = v21 + 1;
      v27 -= 8 * (v31 >> 1);
      *(_QWORD *)v27 = v26;
      v29 = v27 + 8;
      if (v18 == v19)
        goto LABEL_45;
    }
    goto LABEL_49;
  }
  *(_QWORD *)v27 = v26;
  v29 = v27 + 8;
  if (v18 != v19)
  {
    do
    {
LABEL_49:
      if (v27 == v25)
      {
        if (v29 >= v28)
        {
          if (v28 == v25)
            v57 = 1;
          else
            v57 = (v28 - v25) >> 2;
          if (v57 >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v58 = (char *)operator new(8 * v57);
          v59 = v58;
          v60 = (v57 + 3) >> 2;
          v27 = &v58[8 * v60];
          v61 = v29 - v25;
          v38 = v29 == v25;
          v29 = v27;
          if (!v38)
          {
            v29 = &v27[v61 & 0xFFFFFFFFFFFFFFF8];
            v62 = v61 - 8;
            v63 = &v58[8 * v60];
            v64 = v25;
            if (v62 < 0x38)
              goto LABEL_89;
            v65 = 8 * v60;
            v63 = &v58[8 * v60];
            v64 = v25;
            if ((unint64_t)(v63 - v25) < 0x20)
              goto LABEL_89;
            v66 = (v62 >> 3) + 1;
            v67 = 8 * (v66 & 0x3FFFFFFFFFFFFFFCLL);
            v63 = &v27[v67];
            v64 = &v25[v67];
            v68 = (__int128 *)(v25 + 16);
            v69 = &v58[v65 + 16];
            v70 = v66 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v71 = *v68;
              *((_OWORD *)v69 - 1) = *(v68 - 1);
              *(_OWORD *)v69 = v71;
              v68 += 2;
              v69 += 32;
              v70 -= 4;
            }
            while (v70);
            if (v66 != (v66 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_89:
              do
              {
                v72 = *(_QWORD *)v64;
                v64 += 8;
                *(_QWORD *)v63 = v72;
                v63 += 8;
              }
              while (v63 != v29);
            }
          }
          v28 = &v58[8 * v57];
          operator delete(v25);
          v25 = v59;
        }
        else
        {
          v53 = (v28 - v29) >> 3;
          if (v53 >= -1)
            v54 = v53 + 1;
          else
            v54 = v53 + 2;
          v55 = v54 >> 1;
          v27 = &v25[8 * (v54 >> 1)];
          v56 = v25;
          if (v29 != v25)
          {
            memmove(v27, v25, v29 - v25);
            v56 = v29;
          }
          v29 = (char *)v56 + 8 * v55;
        }
      }
      v52 = *(_QWORD *)(v18 - 8);
      v18 -= 8;
      *((_QWORD *)v27 - 1) = v52;
      v27 -= 8;
    }
    while (v18 != *(_QWORD *)(a1 + 8));
  }
LABEL_45:
  v51 = *(char **)a1;
  *(_QWORD *)a1 = v25;
  *(_QWORD *)(a1 + 8) = v27;
  *(_QWORD *)(a1 + 16) = v29;
  *(_QWORD *)(a1 + 24) = v28;
  if (v51)
    operator delete(v51);
}

void sub_2129E07EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  operator delete(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(char **a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  BOOL v19;
  int64_t v20;
  unint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  __int128 *v27;
  _OWORD *v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;

  v4 = a1[2];
  if (v4 != a1[3])
    goto LABEL_22;
  v5 = *a1;
  v6 = a1[1];
  if (v6 > *a1)
  {
    v7 = (v6 - *a1) >> 3;
    if (v7 >= -1)
      v8 = v7 + 1;
    else
      v8 = v7 + 2;
    v9 = v8 >> 1;
    v10 = -v9;
    v11 = &v6[-8 * v9];
    v12 = v4 - v6;
    if (v4 != v6)
    {
      memmove(&v6[-8 * v9], a1[1], v4 - v6);
      v4 = a1[1];
    }
    v13 = &v4[8 * v10];
    v4 = &v11[v12];
    a1[1] = v13;
    a1[2] = &v11[v12];
    goto LABEL_22;
  }
  v14 = (v4 - v5) >> 2;
  if (v4 == v5)
    v14 = 1;
  if (v14 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v15 = v14 >> 2;
  v16 = 8 * v14;
  v17 = (char *)operator new(8 * v14);
  v18 = &v17[8 * v15];
  v20 = v4 - v6;
  v19 = v4 == v6;
  v4 = v18;
  if (!v19)
  {
    v4 = &v18[v20 & 0xFFFFFFFFFFFFFFF8];
    v21 = v20 - 8;
    if ((unint64_t)(v20 - 8) < 0x38)
    {
      v22 = &v17[8 * v15];
      do
      {
LABEL_19:
        v31 = *(_QWORD *)v6;
        v6 += 8;
        *(_QWORD *)v22 = v31;
        v22 += 8;
      }
      while (v22 != v4);
      goto LABEL_20;
    }
    v23 = &v17[8 * v15];
    v22 = v23;
    if ((unint64_t)(v23 - v6) < 0x20)
      goto LABEL_19;
    v24 = (v21 >> 3) + 1;
    v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
    v22 = &v18[v25];
    v26 = &v6[v25];
    v27 = (__int128 *)(v6 + 16);
    v28 = v23 + 16;
    v29 = v24 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v30 = *v27;
      *(v28 - 1) = *(v27 - 1);
      *v28 = v30;
      v27 += 2;
      v28 += 2;
      v29 -= 4;
    }
    while (v29);
    v6 = v26;
    if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL))
      goto LABEL_19;
  }
LABEL_20:
  *a1 = v17;
  a1[1] = v18;
  a1[2] = v4;
  a1[3] = &v17[v16];
  if (v5)
  {
    operator delete(v5);
    v4 = a1[2];
  }
LABEL_22:
  *(_QWORD *)v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front(void **a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  BOOL v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 *v26;
  _OWORD *v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;

  v4 = (char *)a1[1];
  if (v4 == *a1)
  {
    v7 = a1[2];
    v6 = a1[3];
    if (v7 >= v6)
    {
      v13 = v6 - v4;
      v12 = v13 == 0;
      v14 = v13 >> 2;
      if (v12)
        v14 = 1;
      if (v14 >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v15 = (v14 + 3) >> 2;
      v16 = 8 * v14;
      v17 = (char *)operator new(8 * v14);
      v5 = &v17[8 * v15];
      v18 = v5;
      v19 = v7 - v4;
      if (v7 != v4)
      {
        v18 = &v5[v19 & 0xFFFFFFFFFFFFFFF8];
        v20 = v19 - 8;
        v21 = &v17[8 * v15];
        v22 = v4;
        if (v20 < 0x38)
          goto LABEL_27;
        v23 = &v17[8 * v15];
        v21 = v23;
        v22 = v4;
        if ((unint64_t)(v23 - v4) < 0x20)
          goto LABEL_27;
        v24 = (v20 >> 3) + 1;
        v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
        v21 = &v5[v25];
        v22 = &v4[v25];
        v26 = (__int128 *)(v4 + 16);
        v27 = v23 + 16;
        v28 = v24 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v29 = *v26;
          *(v27 - 1) = *(v26 - 1);
          *v27 = v29;
          v26 += 2;
          v27 += 2;
          v28 -= 4;
        }
        while (v28);
        if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_27:
          do
          {
            v30 = *(_QWORD *)v22;
            v22 += 8;
            *(_QWORD *)v21 = v30;
            v21 += 8;
          }
          while (v21 != v18);
        }
      }
      *a1 = v17;
      a1[1] = v5;
      a1[2] = v18;
      a1[3] = &v17[v16];
      if (v4)
      {
        operator delete(v4);
        v5 = (char *)a1[1];
      }
    }
    else
    {
      v8 = (v6 - v7) >> 3;
      if (v8 >= -1)
        v9 = v8 + 1;
      else
        v9 = v8 + 2;
      v10 = v9 >> 1;
      v11 = &v7[8 * (v9 >> 1)];
      v5 = &v11[-(v7 - v4)];
      if (v7 != v4)
      {
        memmove(&v11[-(v7 - v4)], v4, v7 - v4);
        v4 = (char *)a1[2];
      }
      a1[1] = v5;
      a1[2] = &v4[8 * v10];
    }
  }
  else
  {
    v5 = (char *)a1[1];
  }
  *((_QWORD *)v5 - 1) = *a2;
  a1[1] = (char *)a1[1] - 8;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  std::string::size_type v4;
  std::string *v5;
  _BYTE *v6;
  uint64_t v7;
  size_t v8;

  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    v4 = (this->__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
    v6 = (_BYTE *)this->__r_.__value_.__r.__words[0];
    if (v4 >= 0x1C)
    {
      qmemcpy(v6, "([^:]*):([^:]*):([^:]*):(.*)", 28);
      if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
        this->__r_.__value_.__l.__size_ = 28;
      else
        *((_BYTE *)&this->__r_.__value_.__s + 23) = 28;
      goto LABEL_10;
    }
    v5 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    v4 = 22;
    v5 = this;
  }
  v7 = 2 * v4;
  if (2 * v4 <= 0x1C)
    v7 = 28;
  v8 = (v7 | 7) + 1;
  v6 = operator new(v8);
  qmemcpy(v6, "([^:]*):([^:]*):([^:]*):(.*)", 28);
  if (v4 != 22)
    operator delete(v5);
  this->__r_.__value_.__r.__words[0] = (std::string::size_type)v6;
  this->__r_.__value_.__l.__size_ = 28;
  this->__r_.__value_.__r.__words[2] = v8 | 0x8000000000000000;
LABEL_10:
  v6[28] = 0;
  return this;
}

uint64_t TelephonyUtilStrlcpy()
{
  return MEMORY[0x24BED9788]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t ctu::fs::read_folder()
{
  return MEMORY[0x24BED9B40]();
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x24BEDAA50](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x24BEDABC8](this, *(_QWORD *)&__ecode);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x24BEDB030](__s, __icase);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x24BEDB1A0](retstr, __s);
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x24BEDB330](__str, __idx, *(_QWORD *)&__base);
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x24BEDB438](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x24BEDB440](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void operator delete[](void *__p)
{
  off_24CE6E508(__p);
}

void operator delete(void *__p)
{
  off_24CE6E510(__p);
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_24CE6E518(__sz);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24CE6E520(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

