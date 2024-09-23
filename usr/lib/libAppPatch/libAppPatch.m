uint64_t MIMachOUnhideArchsSavingOriginalHeader(const char *a1)
{
  int v2;
  int v3;
  void *v4;
  uint64_t v5;
  int *v6;
  int *v7;
  size_t v8;
  int v9;
  int *v10;
  int *v12;
  size_t v13;
  size_t size;
  void *v15;

  size = 0;
  v15 = 0;
  v2 = open(a1, 256);
  if (v2 < 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v6 = __error();
      strerror(*v6);
      MOLogWrite();
    }
    v4 = 0;
    goto LABEL_12;
  }
  v3 = v2;
  if (fgetxattr(v2, "com.apple.installd.hidden_archs_fat_header", 0, 0, 0, 0) != -1)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (create_new_header_for_unhiding(v3, &v15, &size))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v7 = __error();
      strerror(*v7);
      MOLogWrite();
    }
    v5 = 0;
    v4 = 0;
    goto LABEL_32;
  }
  if (size)
  {
    v4 = malloc_type_malloc(size, 0x87799A7EuLL);
    *__error() = 0;
    v8 = size;
    if (v8 != pread(v3, v4, size, 0))
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_31;
      goto LABEL_30;
    }
    close(v3);
    v9 = open(a1, 258);
    if ((v9 & 0x80000000) == 0)
    {
      v3 = v9;
      if (fsetxattr(v9, "com.apple.installd.hidden_archs_fat_header", v4, size, 0, 2))
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          goto LABEL_31;
      }
      else
      {
        *__error() = 0;
        v13 = size;
        if (v13 == pwrite(v3, v15, size, 0))
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
            MOLogWrite();
          goto LABEL_7;
        }
        if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
LABEL_31:
          v5 = 0;
          goto LABEL_32;
        }
      }
LABEL_30:
      v10 = __error();
      strerror(*v10);
      MOLogWrite();
      goto LABEL_31;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v12 = __error();
      strerror(*v12);
      MOLogWrite();
    }
LABEL_12:
    v5 = 0;
    goto LABEL_33;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) < 7)
    goto LABEL_6;
LABEL_5:
  MOLogWrite();
LABEL_6:
  v4 = 0;
LABEL_7:
  v5 = 1;
LABEL_32:
  close(v3);
LABEL_33:
  if (v15)
    free(v15);
  if (v4)
    free(v4);
  return v5;
}

uint64_t MIMachOCreateHiddenArchsExecutableIfNeeded(const char *a1, char *a2, _BYTE *a3)
{
  int v5;
  int v6;
  ssize_t v7;
  size_t v8;
  void *v9;
  ssize_t v10;
  int v11;
  int v12;
  int *v13;
  uint64_t v14;
  int *v15;
  int *v16;
  int *v18;
  int *v19;

  *a3 = 0;
  v5 = open(a1, 256);
  if ((v5 & 0x80000000) == 0)
  {
    v6 = v5;
    v7 = fgetxattr(v5, "com.apple.installd.hidden_archs_fat_header", 0, 0, 0, 0);
    if (v7 < 0)
    {
      if (*__error() == 93)
      {
        v9 = 0;
        goto LABEL_17;
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        v16 = __error();
        strerror(*v16);
        MOLogWrite();
      }
LABEL_32:
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        MOLogWrite();
      v9 = 0;
LABEL_36:
      v14 = 0;
LABEL_37:
      v12 = v6;
      goto LABEL_38;
    }
    v8 = v7;
    v9 = malloc_type_malloc(v7, 0x2907A5C4uLL);
    v10 = fgetxattr(v6, "com.apple.installd.hidden_archs_fat_header", v9, v8, 0, 0);
    if (v10 < 0)
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
LABEL_27:
        if (v9)
          free(v9);
        goto LABEL_32;
      }
      v15 = __error();
      strerror(*v15);
    }
    else
    {
      if (v8 == v10)
      {
        if (v8)
        {
          v11 = mkstemp(a2);
          if (v11 != -1)
          {
            v12 = v11;
            if (fcopyfile(v6, v11, 0, 0xAu))
            {
              if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                goto LABEL_53;
            }
            else
            {
              *__error() = 0;
              if (v8 == pwrite(v12, v9, v8, 0))
              {
                if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
                  MOLogWrite();
                v14 = 1;
                *a3 = 1;
LABEL_54:
                close(v6);
                if (v12 < 0)
                {
LABEL_39:
                  if (v9)
                    free(v9);
                  return v14;
                }
LABEL_38:
                close(v12);
                goto LABEL_39;
              }
              if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
              {
LABEL_53:
                v14 = 0;
                goto LABEL_54;
              }
            }
            v19 = __error();
            strerror(*v19);
            MOLogWrite();
            goto LABEL_53;
          }
          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            v18 = __error();
            strerror(*v18);
            MOLogWrite();
          }
          goto LABEL_36;
        }
LABEL_17:
        if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          MOLogWrite();
        v14 = 1;
        goto LABEL_37;
      }
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_27;
    }
    MOLogWrite();
    goto LABEL_27;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    v13 = __error();
    strerror(*v13);
    MOLogWrite();
  }
  return 0;
}

uint64_t hardlink_copy_hierarchy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _QWORD *a9, CFErrorRef *a10)
{
  uint64_t v10;
  const __CFArray *v11;
  const __CFArray *v12;
  const char *v13;
  const char *v14;
  const void *v15;
  const void *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  char *v25;
  FTS *v26;
  FTS *v27;
  int v28;
  int v29;
  int *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CFErrorRef v35;
  CFErrorRef v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  CFErrorRef v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const __CFString *v51;
  int v52;
  int *v53;
  CFErrorRef v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  CFErrorRef v64;
  uint64_t result;
  void *v66;
  int *v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  CFErrorRef v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void **v83;
  size_t v84;
  FTSENT *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  FTSENT *v92;
  unsigned int fts_info;
  char *v95;
  const char *v96;
  int v97;
  const char *v98;
  int v99;
  int v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  size_t v105;
  mode_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  int v111;
  int v112;
  char *v113;
  _BOOL4 v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  const char **p_fts_path;
  int st_mode;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  CFErrorRef v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  int *v134;
  ssize_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  std::error_code *v149;
  int v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  int *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  int *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  const __CFString *v165;
  int v166;
  CFErrorRef v167;
  char v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  CFErrorRef v174;
  CFTypeRef v175;
  const char *v176;
  const char *v177;
  const char *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  CFErrorRef v184;
  int *v185;
  int *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  CFErrorRef v191;
  int *v192;
  const __CFString *v193;
  int v194;
  int *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  char *i;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  const __CFString *v206;
  int v207;
  char *v208;
  int *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  int *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  int *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  int *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  std::__fs::filesystem::path *fts_path;
  void **v239;
  _QWORD *v240;
  uint64_t v241;
  uint64_t v242;
  void *v243;
  BOOL v244;
  stat v245;
  int v246;
  __int16 v247;
  char __str[16];
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  char *v280[2];
  unsigned __int8 v281;
  char v282[1039];
  char v283[1024];
  std::__fs::filesystem::path to[42];
  CFTypeRef v285[2];
  __int128 v286;
  __int128 v287;
  __int128 v288;
  char v289;
  uint64_t v290;
  __int16 v291;
  CFTypeRef cf[2];
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  uint64_t v324;

  v10 = MEMORY[0x24BDAC7A8]();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v25 = (char *)v10;
  v324 = *MEMORY[0x24BDAC8D0];
  bzero(to, 0x400uLL);
  bzero(v283, 0x400uLL);
  bzero(&v281, 0x410uLL);
  v280[0] = v25;
  v280[1] = 0;
  v26 = fts_open_b(v280, 85, &__block_literal_global);
  if (!v26)
  {
    v41 = __error();
    strerror(*v41);
    v46 = _CreateAndLogDMError("hardlink_copy_hierarchy", 746, v42, v43, 0, v44, CFSTR("fts_open of %s failed: %s"), v45, (char)v25);
    goto LABEL_24;
  }
  v27 = v26;
  if (!v22)
  {
    bzero(cf, 0x400uLL);
    if ((unint64_t)__strlcpy_chk() < 0x400)
    {
      LOWORD(v245.st_dev) = 0;
      *(_QWORD *)__str = 0;
      if ((realpath_parent_no_symlink((const char *)cf, v283, (mode_t *)&v245, (CFErrorRef *)__str) & 1) == 0)
      {
        v46 = _CreateAndLogDMError("hardlink_copy_hierarchy", 786, v55, v56, *(const void **)__str, v57, CFSTR("Failed to realpath parent of %s"), v58, (char)cf);
        v64 = *(CFErrorRef *)__str;
        if (!*(_QWORD *)__str)
          goto LABEL_23;
        goto LABEL_22;
      }
      if (!LOWORD(v245.st_dev) || (v245.st_dev & 0xF000) == 0x4000)
      {
        v83 = 0;
        v244 = 0;
        goto LABEL_41;
      }
      v54 = _CreateAndLogDMError("hardlink_copy_hierarchy", 792, v55, v56, 0, v57, CFSTR("Entity exists at %s but it's not a directory"), v58, (char)v283);
      goto LABEL_14;
    }
    v51 = CFSTR("Destination path was too long");
    v52 = 779;
LABEL_13:
    v54 = _CreateAndLogDMError("hardlink_copy_hierarchy", v52, v47, v48, 0, v49, v51, v50, (char)fts_path);
LABEL_14:
    v46 = v54;
    goto LABEL_23;
  }
  if (!realpath_DARWIN_EXTSN(v24, v283))
  {
    v53 = __error();
    strerror(*v53);
    LOBYTE(fts_path) = (_BYTE)v24;
    v51 = CFSTR("realpath of '%s' failed at element '%s': %s");
    v52 = 752;
    goto LABEL_13;
  }
  memset(&v245, 0, sizeof(v245));
  v28 = open(v22, 256);
  if (v28 < 0)
  {
    v59 = __error();
    strerror(*v59);
    v36 = _CreateAndLogDMError("open_delta_manifest", 416, v60, v61, 0, v62, CFSTR("Could not open %s: %s"), v63, (char)v22);
LABEL_20:
    v46 = _CreateAndLogDMError("hardlink_copy_hierarchy", 758, v37, v38, v36, v39, CFSTR("Failed to open manifest %s"), v40, (char)v22);
    if (v36)
    {
      v64 = v36;
LABEL_22:
      CFRelease(v64);
    }
LABEL_23:
    fts_close(v27);
    goto LABEL_24;
  }
  v29 = v28;
  if (fstat(v28, &v245))
  {
    v30 = __error();
    strerror(*v30);
    v35 = _CreateAndLogDMError("open_delta_manifest", 421, v31, v32, 0, v33, CFSTR("Could not stat %s: %s"), v34, (char)v22);
LABEL_7:
    v36 = v35;
LABEL_8:
    close(v29);
    goto LABEL_20;
  }
  v66 = mmap(0, v245.st_size, 1, 1026, v29, 0);
  if (v66 == (void *)-1)
  {
    v160 = __error();
    strerror(*v160);
    v35 = _CreateAndLogDMError("open_delta_manifest", 435, v161, v162, 0, v163, CFSTR("Failed to map file at %s; error %s"),
            v164,
            (char)v22);
    goto LABEL_7;
  }
  v243 = v66;
  if (madvise(v66, v245.st_size, 2) && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v67 = __error();
    LOBYTE(fts_path) = strerror(*v67);
    MOLogWrite();
  }
  v68 = malloc_type_calloc(1uLL, 0x18uLL, 0x1010040113C0ABBuLL);
  if (!v68)
  {
    v36 = _CreateAndLogDMError("open_delta_manifest", 446, v69, v70, 0, v71, CFSTR("Failed to allocate command stream object"), v72, (char)fts_path);
    munmap(v243, v245.st_size);
    goto LABEL_8;
  }
  v73 = v68;
  *v68 = v243;
  v68[1] = v245.st_size;
  v68[2] = 0;
  v323 = 0u;
  v322 = 0u;
  v321 = 0u;
  v320 = 0u;
  v319 = 0u;
  v318 = 0u;
  v317 = 0u;
  v316 = 0u;
  v315 = 0u;
  v314 = 0u;
  v313 = 0u;
  v312 = 0u;
  v311 = 0u;
  v310 = 0u;
  v309 = 0u;
  v308 = 0u;
  v307 = 0u;
  v306 = 0u;
  v305 = 0u;
  v304 = 0u;
  v303 = 0u;
  v302 = 0u;
  v301 = 0u;
  v300 = 0u;
  v299 = 0u;
  v298 = 0u;
  v297 = 0u;
  v296 = 0u;
  v295 = 0u;
  v294 = 0u;
  v293 = 0u;
  *(_OWORD *)cf = 0u;
  v278 = 0u;
  v279 = 0u;
  v276 = 0u;
  v277 = 0u;
  v274 = 0u;
  v275 = 0u;
  v272 = 0u;
  v273 = 0u;
  v270 = 0u;
  v271 = 0u;
  v268 = 0u;
  v269 = 0u;
  v266 = 0u;
  v267 = 0u;
  v264 = 0u;
  v265 = 0u;
  v262 = 0u;
  v263 = 0u;
  v260 = 0u;
  v261 = 0u;
  v258 = 0u;
  v259 = 0u;
  v256 = 0u;
  v257 = 0u;
  v254 = 0u;
  v255 = 0u;
  v252 = 0u;
  v253 = 0u;
  v250 = 0u;
  v251 = 0u;
  *(_OWORD *)__str = 0u;
  v249 = 0u;
  v247 = 0;
  v246 = 0;
  v291 = 0;
  v290 = 0;
  if ((read_string_to_terminator(v68, 0, (uint64_t)&v246, 6uLL) & 1) == 0)
  {
    v165 = CFSTR("Failed to read magic");
    v166 = 299;
LABEL_155:
    v78 = _CreateAndLogDMError("validate_stream", v166, v74, v75, 0, v76, v165, v77, (char)fts_path);
    goto LABEL_156;
  }
  if (v246 ^ 0x44617069 | v247)
  {
    v78 = _CreateAndLogDMError("validate_stream", 305, v74, v75, 0, v76, CFSTR("Stream had invalid magic: %s"), v77, (char)&v246);
LABEL_156:
    v167 = v78;
LABEL_157:
    v36 = _CreateAndLogDMError("open_delta_manifest", 456, v79, v80, v167, v81, CFSTR("Invalid manifest file at %s"), v82, (char)v22);
    if (v167)
      CFRelease(v167);
    munmap(v243, v245.st_size);
    free(v73);
    goto LABEL_8;
  }
  if ((read_string_to_terminator(v73, 0, (uint64_t)&v290, 0xAuLL) & 1) == 0)
  {
    v165 = CFSTR("Failed to read version from manifest header");
    v166 = 310;
    goto LABEL_155;
  }
  v169 = strtol((const char *)&v290, 0, 10);
  if ((unint64_t)(v169 - 4) <= 0xFFFFFFFFFFFFFFFCLL)
  {
    v78 = _CreateAndLogDMError("validate_stream", 318, v170, v171, 0, v172, CFSTR("Manifest had invalid version: %ld; expected 1, 2, or 3"),
            v173,
            v169);
    goto LABEL_156;
  }
  v242 = v169;
  if ((read_string_to_terminator(v73, 0, (uint64_t)cf, 0x200uLL) & 1) == 0)
  {
    v165 = CFSTR("Failed to read manifest source version");
    v166 = 323;
    goto LABEL_155;
  }
  v240 = v73;
  if (v20)
    v176 = v18;
  else
    v176 = "";
  if (v20)
    v177 = v20;
  else
    v177 = "0";
  if (v20)
    v178 = " ";
  else
    v178 = "";
  if (v176)
    v179 = v176;
  else
    v179 = "";
  if (snprintf(__str, 0x200uLL, "%s%s%s", v177, v178, v179) > 0x1FF)
  {
    v184 = _CreateAndLogDMError("validate_stream", 350, v180, v181, 0, v182, CFSTR("Incoming expected source version string \"%s%s%s\" was too long"), v183, (char)v177);
LABEL_227:
    v167 = v184;
LABEL_228:
    v73 = v240;
    goto LABEL_157;
  }
  for (i = __str; *i == 10; ++i)
  {
    *i = 32;
LABEL_223:
    ;
  }
  if (*i)
    goto LABEL_223;
  if (strcmp(__str, (const char *)cf))
  {
    fts_path = (std::__fs::filesystem::path *)cf;
    v206 = CFSTR("Got manifest for version \"%s\", but expected version \"%s\"");
    v207 = 357;
    goto LABEL_226;
  }
  if (v242 < 2)
    goto LABEL_249;
  v289 = 0;
  v288 = 0u;
  v287 = 0u;
  v286 = 0u;
  *(_OWORD *)v285 = 0u;
  if (!read_string_to_terminator(v240, 0, (uint64_t)v285, 0x41uLL))
  {
    v206 = CFSTR("Failed to read stream");
    v207 = 375;
LABEL_226:
    v184 = _CreateAndLogDMError("validate_stream", v207, v202, v203, 0, v204, v206, v205, (char)fts_path);
    goto LABEL_227;
  }
  if (!v16)
  {
    v206 = CFSTR("expected_infoplisthash is NULL");
    v207 = 371;
    goto LABEL_226;
  }
  if (memcmp(v16, v285, 0x41uLL))
  {
    v206 = CFSTR("Compare of info plist hash failed");
    v207 = 367;
    goto LABEL_226;
  }
  if ((unint64_t)v242 >= 3)
  {
    v285[0] = 0;
    if ((validate_supported_devices(v240, v12, (CFErrorRef *)v285) & 1) == 0)
    {
      v167 = _CreateAndLogDMError("validate_stream", 384, v225, v226, v285[0], v227, CFSTR("Failed to validate supported devices"), v228, (char)fts_path);
      if (v285[0])
        CFRelease(v285[0]);
      goto LABEL_228;
    }
  }
LABEL_249:
  close(v29);
  cf[0] = 0;
  if ((read_next_manifest_command(v240, &v281, (CFErrorRef *)cf, v229, v230, v231, v232, v233) & 1) == 0)
  {
    v46 = _CreateAndLogDMError("hardlink_copy_hierarchy", 765, v234, v235, cf[0], v236, CFSTR("Failed to read first manifest command"), v237, (char)fts_path);
    if (cf[0])
      CFRelease(cf[0]);
    v168 = 0;
    v112 = -1;
    v83 = (void **)v240;
    goto LABEL_235;
  }
  v244 = v281 != 120;
  v83 = (void **)v240;
LABEL_41:
  v84 = strlen(v25);
  v85 = fts_read(v27);
  if (!v85)
  {
    v241 = 0;
LABEL_161:
    if (v22 && v281 != 120)
    {
      v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 1110, v86, v87, 0, v89, CFSTR("Got done processing bundle but there were still commands remaining in manifest."), v91, (char)fts_path);
      goto LABEL_233;
    }
    v46 = 0;
    if (a9)
      *a9 = v241 << 9;
    v112 = -1;
    v168 = 1;
    if (!v83)
      goto LABEL_236;
LABEL_235:
    munmap(*v83, (size_t)v83[1]);
    free(v83);
    goto LABEL_236;
  }
  v92 = v85;
  v239 = v83;
  v241 = 0;
  while (1)
  {
    to[0].__pn_.__r_.__value_.__s.__data_[0] = 0;
    fts_info = v92->fts_info;
    if (fts_info > 0xD || ((1 << fts_info) & 0x314A) == 0)
    {
      v98 = 0;
      v99 = 0;
    }
    else
    {
      v95 = &v92->fts_path[v84];
      v97 = *v95;
      v96 = v95 + 1;
      if (v97 == 47)
        v98 = v96;
      else
        v98 = &v92->fts_path[v84];
      if (fts_info != 6 && v244 && !_utf_aware_strcmp(v282, v98))
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
        {
          LOBYTE(fts_path) = v281;
          MOLogWrite();
        }
        v99 = 1;
      }
      else
      {
        v99 = 0;
      }
      fts_info = v92->fts_info;
    }
    switch(fts_info)
    {
      case 1u:
        if (v99 && (v281 == 45 || v281 == 43))
        {
          if (fts_set(v27, v92, 4))
          {
            v214 = __error();
            strerror(*v214);
            v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 1012, v215, v216, 0, v217, CFSTR("Failed to skip directory %s: %s"), v218, (char)v98);
            goto LABEL_233;
          }
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          {
            LOBYTE(fts_path) = (_BYTE)v98;
            MOLogWrite();
          }
LABEL_139:
          cf[0] = 0;
          if ((read_next_manifest_command(v83, &v281, (CFErrorRef *)cf, v87, v88, v89, v90, v91) & 1) != 0)
          {
            if (v281 == 120)
            {
              if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
                MOLogWrite();
              v244 = 0;
            }
            goto LABEL_145;
          }
          v174 = _CreateAndLogDMError("hardlink_copy_hierarchy", 1094, v151, v152, cf[0], v153, CFSTR("Failed to read next manifest command"), v154, (char)fts_path);
          goto LABEL_171;
        }
        *(_WORD *)__str = 0;
        cf[0] = 0;
        if ((make_and_check_dest_path(v283, v98, (char *)to, (mode_t *)__str, (CFErrorRef *)cf) & 1) == 0)
        {
          v174 = _CreateAndLogDMError("hardlink_copy_hierarchy", 1023, v123, v87, cf[0], v89, CFSTR("Failed to make dest path for directory %s"), v91, (char)v98);
          goto LABEL_171;
        }
        if (*(_WORD *)__str && (*(_WORD *)__str & 0xF000) != 0x4000)
        {
          v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 1030, v123, v87, 0, v89, CFSTR("Non-directory entity with mode 0%o exists at directory location in dest path %s"), v91, __str[0]);
          goto LABEL_233;
        }
        if (*(_WORD *)__str)
        {
          if (*(unsigned __int16 *)__str != (v92->fts_statp->st_mode | 0x80)
            && chmod((const char *)to, v92->fts_statp->st_mode | 0x80))
          {
            v224 = __error();
            strerror(*v224);
            v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 1043, v124, v125, 0, v126, CFSTR("Failed to make destination directory \"%s\" writable: %s"), v127, (char)to);
LABEL_233:
            v46 = v128;
            goto LABEL_234;
          }
        }
        else
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          {
            fts_path = to;
            MOLogWrite();
          }
          if (mkdir((const char *)to, v92->fts_statp->st_mode | 0x80))
          {
            v219 = __error();
            strerror(*v219);
            v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 1038, v220, v221, 0, v222, CFSTR("mkdir of '%s' failed: %s"), v223, (char)to);
            goto LABEL_233;
          }
        }
        goto LABEL_138;
      case 3u:
      case 8u:
        if (v281 == 94)
          v100 = v99;
        else
          v100 = 0;
        if (v100 != 1)
        {
          if (v99 && (v281 == 45 || v281 == 43))
          {
            if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
            {
              LOBYTE(fts_path) = (_BYTE)v98;
              MOLogWrite();
            }
          }
          else
          {
            *(_WORD *)__str = 0;
            cf[0] = 0;
            if ((make_and_check_dest_path(v283, v98, (char *)to, (mode_t *)__str, (CFErrorRef *)cf) & 1) == 0)
            {
              v174 = _CreateAndLogDMError("hardlink_copy_hierarchy", 975, v129, v130, cf[0], v131, CFSTR("Failed to make dest path for file %s"), v132, (char)v98);
LABEL_171:
              v46 = v174;
              v175 = cf[0];
              if (!cf[0])
                goto LABEL_234;
LABEL_201:
              CFRelease(v175);
              goto LABEL_234;
            }
            if (*(_WORD *)__str)
            {
              v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 982, v129, v130, 0, v131, CFSTR("Entity with mode 0%o exists at file location in dest path %s"), v132, __str[0]);
              goto LABEL_233;
            }
            if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
            {
              fts_path = (std::__fs::filesystem::path *)v92->fts_path;
              MOLogWrite();
            }
            if (link(v92->fts_path, (const char *)to))
            {
              if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
              {
                v133 = v92->fts_path;
                v134 = __error();
                strerror(*v134);
                LOBYTE(fts_path) = (_BYTE)v133;
                v83 = v239;
                MOLogWrite();
              }
              if (copyfile(v92->fts_path, (const char *)to, 0, 0xC000Fu))
              {
                v208 = v92->fts_path;
                v209 = __error();
                strerror(*v209);
                v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 991, v210, v211, 0, v212, CFSTR("copyfile of %s to %s failed: %s"), v213, (char)v208);
                goto LABEL_233;
              }
            }
          }
          goto LABEL_137;
        }
        LOWORD(v285[0]) = 0;
        bzero(cf, 0x400uLL);
        *(_QWORD *)&v245.st_dev = 0;
        if ((make_and_check_dest_path(v283, v98, (char *)to, (mode_t *)v285, (CFErrorRef *)&v245) & 1) == 0)
        {
          v46 = _CreateAndLogDMError("hardlink_copy_hierarchy", 882, v101, v102, *(const void **)&v245.st_dev, v103, CFSTR("Failed to make dest path for file %s"), v104, (char)v98);
          v175 = *(CFTypeRef *)&v245.st_dev;
          if (!*(_QWORD *)&v245.st_dev)
            goto LABEL_234;
          goto LABEL_201;
        }
        v105 = v84;
        v106 = (mode_t)v285[0];
        if (!LOWORD(v285[0]))
        {
          v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 889, v101, v102, 0, v103, CFSTR("Entity does not exist at file location in dest path %s"), v104, (char)to);
          goto LABEL_233;
        }
        if (snprintf((char *)cf, 0x400uLL, "%s.XXXXXX", (const char *)to) >= 0x400)
        {
          v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 894, v107, v108, 0, v109, CFSTR("failed to make newfile path: %s.XXXXXXX"), v110, (char)to);
          goto LABEL_233;
        }
        v111 = mkstemp((char *)cf);
        if (v111 == -1)
        {
          v186 = __error();
          strerror(*v186);
          v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 899, v187, v188, 0, v189, CFSTR("mktemp failed for %s : %s"), v190, (char)cf);
          goto LABEL_233;
        }
        v112 = v111;
        v113 = v92->fts_path;
        bzero(__str, 0x400uLL);
        if (v14 && !_utf_aware_strcmp(v113, v14))
        {
          if (snprintf(__str, 0x400uLL, "%s.XXXXXX", (const char *)to) >= 0x400)
          {
            v46 = _CreateAndLogDMError("hardlink_copy_hierarchy", 914, v137, v138, 0, v139, CFSTR("failed to make newfile path: %s.XXXXXXX"), v140, (char)to);
            goto LABEL_212;
          }
          LOBYTE(v290) = 0;
          if (!MIMachOCreateHiddenArchsExecutableIfNeeded(v14, __str, &v290))
          {
            v193 = CFSTR("Failed to create hidden archs executable");
            v194 = 920;
LABEL_207:
            v191 = _CreateAndLogDMError("hardlink_copy_hierarchy", v194, v141, v142, 0, v143, v193, v144, (char)fts_path);
LABEL_208:
            v46 = v191;
            goto LABEL_211;
          }
          v114 = (_BYTE)v290 != 0;
          if ((_BYTE)v290)
            v113 = __str;
        }
        else
        {
          v114 = 0;
        }
        if (patch_file(v113, (const char *)to, v112))
        {
          v191 = _CreateAndLogDMError("hardlink_copy_hierarchy", 934, v145, v146, 0, v147, CFSTR("patch_file failed for:\n\t%s\n\t%s\n\t%s"), v148, (char)v113);
          goto LABEL_208;
        }
        if (fchmod(v112, v106))
        {
          v192 = __error();
          fts_path = (std::__fs::filesystem::path *)cf;
          strerror(*v192);
          v193 = CFSTR("chmod failed for %s : %s");
          v194 = 939;
          goto LABEL_207;
        }
        close(v112);
        rename((const std::__fs::filesystem::path *)cf, to, v149);
        if (v150)
        {
          v195 = __error();
          strerror(*v195);
          v46 = _CreateAndLogDMError("hardlink_copy_hierarchy", 948, v196, v197, 0, v198, CFSTR("rename of %s to %s failed: %s"), v199, (char)cf);
          v112 = -1;
LABEL_211:
          v83 = v239;
LABEL_212:
          v168 = 0;
          if (v83)
            goto LABEL_235;
          goto LABEL_236;
        }
        if (v114)
          unlink(v113);
        v83 = v239;
        v84 = v105;
LABEL_137:
        v241 += v92->fts_statp->st_blocks;
LABEL_138:
        if (v99)
          goto LABEL_139;
LABEL_145:
        v92 = fts_read(v27);
        if (!v92)
          goto LABEL_161;
        break;
      case 4u:
      case 7u:
      case 0xAu:
        v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 1078, v86, v87, 0, v89, CFSTR("FTS in %s returned an error %d for path '%s'"), v91, (char)"hardlink_copy_hierarchy");
        goto LABEL_233;
      case 6u:
        LOWORD(cf[0]) = 0;
        if (!make_and_check_dest_path(v283, v98, (char *)to, (mode_t *)cf, 0))
          goto LABEL_138;
        if (((uint64_t)cf[0] & 0xF000) == 0x4000 && (st_mode = v92->fts_statp->st_mode, st_mode != LOWORD(cf[0])))
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          {
            fts_path = to;
            MOLogWrite();
            LOWORD(st_mode) = v92->fts_statp->st_mode;
          }
          if (chmod((const char *)to, st_mode))
          {
            v155 = __error();
            strerror(*v155);
            v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 1060, v156, v157, 0, v158, CFSTR("chmod of '%s' failed: %s"), v159, (char)to);
            goto LABEL_233;
          }
        }
        else if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
        {
          LOBYTE(fts_path) = cf[0];
          MOLogWrite();
        }
        goto LABEL_138;
      case 0xCu:
      case 0xDu:
        if (v99 && (v281 == 43 || v281 == 45))
          goto LABEL_137;
        LOWORD(v245.st_dev) = 0;
        *(_QWORD *)__str = 0;
        if ((make_and_check_dest_path(v283, v98, (char *)to, (mode_t *)&v245, (CFErrorRef *)__str) & 1) != 0)
        {
          if (LOWORD(v245.st_dev))
          {
            v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 855, v115, v116, 0, v117, CFSTR("Entity with mode 0%o exists at symlink location in dest path %s"), v118, v245.st_dev);
            goto LABEL_233;
          }
          v119 = gLogHandle;
          if (gLogHandle)
          {
            p_fts_path = (const char **)&v92->fts_path;
            v120 = v92->fts_path;
            if (*(int *)(gLogHandle + 44) <= 6
              || (fts_path = (std::__fs::filesystem::path *)v92->fts_path,
                  MOLogWrite(),
                  v119 = gLogHandle,
                  v120 = *p_fts_path,
                  gLogHandle))
            {
              if (*(int *)(v119 + 44) >= 7)
              {
                LOBYTE(fts_path) = (_BYTE)v120;
                MOLogWrite();
              }
            }
          }
          else
          {
            p_fts_path = (const char **)&v92->fts_path;
            v120 = v92->fts_path;
          }
          v135 = readlink(v120, (char *)cf, 0x400uLL);
          if (v135 < 0)
          {
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
            {
LABEL_198:
              v185 = __error();
              strerror(*v185);
              MOLogWrite();
            }
LABEL_199:
            v128 = _CreateAndLogDMError("hardlink_copy_hierarchy", 862, v136, v87, 0, v89, CFSTR("Failed to copy symlink %s to %s"), v91, (char)*p_fts_path);
            goto LABEL_233;
          }
          *((_BYTE *)cf + v135) = 0;
          if (symlink((const char *)cf, (const char *)to))
          {
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
              goto LABEL_198;
            goto LABEL_199;
          }
          goto LABEL_137;
        }
        v46 = _CreateAndLogDMError("hardlink_copy_hierarchy", 848, v115, v116, *(const void **)__str, v117, CFSTR("Failed to make dest path for symlink %s"), v118, (char)v98);
        v175 = *(CFTypeRef *)__str;
        if (*(_QWORD *)__str)
          goto LABEL_201;
LABEL_234:
        v168 = 0;
        v112 = -1;
        if (v83)
          goto LABEL_235;
LABEL_236:
        fts_close(v27);
        if ((v112 & 0x80000000) == 0)
          close(v112);
        if ((v168 & 1) != 0)
          return 1;
LABEL_24:
        if (a10)
        {
          result = 0;
          *a10 = v46;
        }
        else
        {
          if (v46)
            CFRelease(v46);
          return 0;
        }
        return result;
      default:
        goto LABEL_138;
    }
  }
}

uint64_t __hardlink_copy_hierarchy_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _utf_aware_strcmp((char *)(*(_QWORD *)a2 + 104), (const char *)(*(_QWORD *)a3 + 104));
}

uint64_t _utf_aware_strcmp(char *cStr, const char *a2)
{
  const __CFAllocator *v3;
  const __CFString *v4;
  const __CFString *v5;
  uint64_t v6;
  char __s2[1024];
  char buffer[1024];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v4 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0x8000100u);
  v5 = CFStringCreateWithCString(v3, a2, 0x8000100u);
  bzero(buffer, 0x400uLL);
  bzero(__s2, 0x400uLL);
  if (!CFStringGetFileSystemRepresentation(v4, buffer, 1024)
    || !CFStringGetFileSystemRepresentation(v5, __s2, 1024))
  {
    v6 = 0xFFFFFFFFLL;
    if (!v4)
      goto LABEL_7;
    goto LABEL_6;
  }
  v6 = strcmp(buffer, __s2);
  if (v4)
LABEL_6:
    CFRelease(v4);
LABEL_7:
  if (v5)
    CFRelease(v5);
  return v6;
}

CFErrorRef _CreateAndLogDMError(const char *a1, int a2, uint64_t a3, uint64_t a4, const void *a5, uint64_t a6, const __CFString *a7, uint64_t a8, char a9)
{
  __CFDictionary *Mutable;
  CFStringRef v13;
  CFNumberRef v14;
  CFStringRef v15;
  CFErrorRef v16;
  int valuePtr;

  valuePtr = a2;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v13 = CFStringCreateWithCString(0, a1, 0x8000100u);
  CFDictionaryAddValue(Mutable, CFSTR("FunctionName"), v13);
  if (v13)
    CFRelease(v13);
  v14 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(Mutable, CFSTR("SourceFileLine"), v14);
  if (v14)
    CFRelease(v14);
  if (a5)
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDBD3B0], a5);
  v15 = CFStringCreateWithFormatAndArguments(0, 0, a7, &a9);
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    MOLogWrite();
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDBD3A0], v15);
  if (v15)
    CFRelease(v15);
  v16 = CFErrorCreate(0, CFSTR("MIInstallerDeltaErrorDomain"), 1, Mutable);
  if (Mutable)
    CFRelease(Mutable);
  return v16;
}

uint64_t read_next_manifest_command(_QWORD *a1, unsigned __int8 *a2, CFErrorRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  int v13;
  BOOL v14;
  char string_to_terminator;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  int v27;
  CFErrorRef v28;
  uint64_t v29;
  char *v31;
  char __str[8];
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v9 = a1[1];
  v8 = a1[2];
  if (v8 >= v9)
    read_next_manifest_command_cold_1();
  if (v8 + 1 >= v9)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      LOBYTE(v31) = 1;
      MOLogWrite();
    }
    v26 = CFSTR("Failed to read command from manifest");
    v27 = 508;
  }
  else
  {
    v13 = *(unsigned __int8 *)(*a1 + v8);
    *a2 = v13;
    ++a1[2];
    v14 = (v13 - 43) > 0x33 || ((1 << (v13 - 43)) & 0x8000000040005) == 0;
    if (v14 && v13 != 120)
    {
      v28 = _CreateAndLogDMError("read_next_manifest_command", 514, (uint64_t)a3, a4, 0, a6, CFSTR("Stream had invalid command: %hhu"), a8, v13);
      goto LABEL_26;
    }
    string_to_terminator = read_string_to_terminator(a1, 1, (uint64_t)(a2 + 1), 0x400uLL);
    v20 = *a2;
    if ((string_to_terminator & 1) == 0)
    {
      v28 = _CreateAndLogDMError("read_next_manifest_command", 520, v16, v17, 0, v18, CFSTR("Failed to read arg1 of command %hhu"), v19, *a2);
      goto LABEL_26;
    }
    if (v20 != 61)
      goto LABEL_12;
    *(_QWORD *)__str = 0;
    v33 = 0;
    v35 = 0;
    v34 = 0;
    if ((read_string_to_terminator(a1, 1, (uint64_t)__str, 0x19uLL) & 1) == 0)
    {
      v28 = _CreateAndLogDMError("read_next_manifest_command", 528, v21, v22, 0, v23, CFSTR("Failed to read arg2 of command %hhu"), v24, *a2);
      goto LABEL_26;
    }
    v25 = strtoll(__str, 0, 10);
    *((_QWORD *)a2 + 129) = v25;
    if (v25)
    {
      v20 = *a2;
LABEL_12:
      if (v20 != 120 || !strncmp((const char *)a2 + 1, "EOF", 3uLL))
        return 1;
      v26 = CFSTR("Got malformed EOF marker");
      v27 = 542;
      goto LABEL_25;
    }
    v31 = __str;
    v26 = CFSTR("Invalid touch time \"%s\" found for path \"%s\"");
    v27 = 535;
  }
LABEL_25:
  v28 = _CreateAndLogDMError("read_next_manifest_command", v27, (uint64_t)a3, a4, 0, a6, v26, a8, (char)v31);
LABEL_26:
  if (a3)
  {
    v29 = 0;
    *a3 = v28;
  }
  else
  {
    if (v28)
      CFRelease(v28);
    return 0;
  }
  return v29;
}

uint64_t realpath_parent_no_symlink(const char *a1, char *a2, mode_t *a3, CFErrorRef *a4)
{
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  const __CFString *v14;
  int v15;
  CFErrorRef v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  mode_t st_mode;
  int *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v30;
  stat v31;

  v8 = strlen(a1);
  v13 = v8 - 1;
  if (a1[v8 - 1] == 47)
  {
    a1[v13] = 0;
    v13 = v8 - 2;
  }
  if ((v13 & 0x8000000000000000) != 0)
  {
LABEL_6:
    v30 = (char)a1;
    v14 = CFSTR("Failed to find parent of '%s'");
    v15 = 588;
LABEL_7:
    v16 = _CreateAndLogDMError("realpath_parent_no_symlink", v15, v9, v10, 0, v11, v14, v12, v30);
    goto LABEL_8;
  }
  while (a1[v13] != 47)
  {
    if (&a1[--v13] < a1)
      goto LABEL_6;
  }
  if (v13)
  {
    v18 = (char *)&a1[v13];
    a1[v13] = 0;
    if (!realpath_DARWIN_EXTSN(a1, a2))
    {
      v24 = __error();
      strerror(*v24);
      v16 = _CreateAndLogDMError("realpath_parent_no_symlink", 599, v25, v26, 0, v27, CFSTR("realpath of '%s' failed at element '%s': %s"), v28, (char)a1);
      *v18 = 47;
      if (a4)
        goto LABEL_9;
      goto LABEL_18;
    }
    *v18 = 47;
    if (strlcat(a2, v18, 0x400uLL) >= 0x400)
    {
      v14 = CFSTR("Path was too long");
      v15 = 608;
      goto LABEL_7;
    }
  }
  else
  {
    strlcpy(a2, a1, 0x400uLL);
  }
  memset(&v31, 0, sizeof(v31));
  if (lstat(a2, &v31))
  {
    st_mode = 0;
LABEL_23:
    *a3 = st_mode;
    return 1;
  }
  st_mode = v31.st_mode;
  if ((v31.st_mode & 0xF000) != 0xA000)
    goto LABEL_23;
  v16 = _CreateAndLogDMError("realpath_parent_no_symlink", 618, v19, v20, 0, v21, CFSTR("Found symlink at destination path \"%s\"; this is not allowed."),
          v22,
          (char)a2);
LABEL_8:
  if (a4)
  {
LABEL_9:
    v17 = 0;
    *a4 = v16;
    return v17;
  }
LABEL_18:
  if (v16)
    CFRelease(v16);
  return 0;
}

uint64_t make_and_check_dest_path(const char *a1, const char *a2, char *a3, mode_t *a4, CFErrorRef *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFErrorRef v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CFErrorRef v23;
  uint64_t result;
  CFTypeRef cf;
  char __str[1024];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  bzero(__str, 0x400uLL);
  if (snprintf(__str, 0x400uLL, "%s/%s", a1, a2) < 0x400)
  {
    cf = 0;
    if ((realpath_parent_no_symlink(__str, a3, a4, (CFErrorRef *)&cf) & 1) == 0)
    {
      v23 = _CreateAndLogDMError("make_and_check_dest_path", 701, v15, v16, cf, v17, CFSTR("Failed to realpath parent of %s"), v18, (char)__str);
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      goto LABEL_7;
    }
    if (!_utf_aware_strcmp(__str, a3))
      return 1;
    v14 = _CreateAndLogDMError("make_and_check_dest_path", 709, v19, v20, 0, v21, CFSTR("realpath'd destpath '%s' is different from non-realpath '%s'"), v22, (char)a3);
  }
  else
  {
    v14 = _CreateAndLogDMError("make_and_check_dest_path", 695, v10, v11, 0, v12, CFSTR("Dest path '%s/%s' was too long"), v13, (char)a1);
  }
  v23 = v14;
LABEL_7:
  if (a5)
  {
    result = 0;
    *a5 = v23;
  }
  else
  {
    if (v23)
      CFRelease(v23);
    return 0;
  }
  return result;
}

uint64_t read_string_to_terminator(_QWORD *a1, int a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  int v6;
  int v7;

  v4 = a1[2];
  if (v4 >= a1[1])
    read_string_to_terminator_cold_1();
  if (!a4)
    return 0;
  v5 = 0;
  while (1)
  {
    v6 = *(unsigned __int8 *)(*a1 + v4);
    a1[2] = v4 + 1;
    v7 = v6 == 9 ? a2 : 0;
    if (v6 == 10 || v7 != 0)
      break;
    *(_BYTE *)(a3 + v5++) = v6;
    v4 = a1[2];
    if (v4 >= a1[1] || v5 >= a4)
      return 0;
  }
  *(_BYTE *)(a3 + v5) = 0;
  return 1;
}

uint64_t validate_supported_devices(_QWORD *a1, const __CFArray *a2, CFErrorRef *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  const __CFAllocator *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFArray *ArrayBySeparatingStrings;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFArray *v19;
  const CFArrayCallBacks *v20;
  __CFArray *Mutable;
  __CFArray *v22;
  uint64_t Count;
  uint64_t v24;
  CFIndex i;
  const void *ValueAtIndex;
  CFIndex j;
  const void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CFErrorRef v33;
  const __CFString *v34;
  int v35;
  CFErrorRef v36;
  uint64_t result;
  CFErrorRef v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  const __CFString *v45;
  CFRange v46;
  CFRange v47;

  v10 = malloc_type_calloc(1uLL, 0x800uLL, 0x30FCD377uLL);
  if (!v10)
  {
    v34 = CFSTR("Failed to malloc buffer for line");
    v35 = 200;
LABEL_23:
    v36 = _CreateAndLogDMError("validate_supported_devices", v35, v6, v7, 0, v8, v34, v9, v44);
    free(v10);
    goto LABEL_24;
  }
  if ((read_string_to_terminator(a1, 0, (uint64_t)v10, 0x800uLL) & 1) == 0)
  {
    v34 = CFSTR("Failed to read supported devices from stream");
    v35 = 205;
    goto LABEL_23;
  }
  if (!*v10)
  {
    if (!a2)
    {
      free(v10);
      return 1;
    }
    v34 = CFSTR("Existing app lists supported devices but there were none in the manifest");
    v35 = 211;
    goto LABEL_23;
  }
  v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v12 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], v10, 0x8000100u);
  if (!v12)
  {
    v34 = CFSTR("Failed to create patch supported devices string");
    v35 = 222;
    goto LABEL_23;
  }
  v13 = v12;
  ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(v11, v12, CFSTR(" "));
  v19 = ArrayBySeparatingStrings;
  if (!ArrayBySeparatingStrings || !CFArrayGetCount(ArrayBySeparatingStrings))
  {
    v38 = _CreateAndLogDMError("validate_supported_devices", 228, v15, v16, 0, v17, CFSTR("Failed to split patch supported devices string"), v18, v44);
LABEL_32:
    v36 = v38;
    free(v10);
    v39 = 0;
    Mutable = 0;
    v22 = 0;
    goto LABEL_42;
  }
  if (!a2)
  {
    v38 = _CreateAndLogDMError("validate_supported_devices", 234, v15, v16, 0, v17, CFSTR("Target app had no supported devices but patch did: %@"), v18, (char)v19);
    goto LABEL_32;
  }
  v45 = v13;
  v20 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
  Mutable = CFArrayCreateMutable(v11, 0, MEMORY[0x24BDBD690]);
  v22 = CFArrayCreateMutable(v11, 0, v20);
  Count = CFArrayGetCount(a2);
  v24 = CFArrayGetCount(v19);
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a2, i);
      v46.location = 0;
      v46.length = v24;
      if (!CFArrayContainsValue(v19, v46, ValueAtIndex))
        CFArrayAppendValue(Mutable, ValueAtIndex);
    }
  }
  if (v24 >= 1)
  {
    for (j = 0; j != v24; ++j)
    {
      v28 = CFArrayGetValueAtIndex(v19, j);
      v47.location = 0;
      v47.length = Count;
      if (!CFArrayContainsValue(a2, v47, v28))
        CFArrayAppendValue(v22, v28);
    }
  }
  if (Mutable && CFArrayGetCount(Mutable))
  {
    v33 = _CreateAndLogDMError("validate_supported_devices", 242, v29, v30, 0, v31, CFSTR("Expected supported devices had devices that were not in patch: %@"), v32, (char)Mutable);
  }
  else
  {
    if (!v22 || !CFArrayGetCount(v22))
    {
      v36 = 0;
      v39 = 1;
      goto LABEL_41;
    }
    v33 = _CreateAndLogDMError("validate_supported_devices", 247, v40, v41, 0, v42, CFSTR("Patch listed devices that were not in expected supported devices: %@"), v43, (char)v22);
  }
  v36 = v33;
  v39 = 0;
LABEL_41:
  v13 = v45;
  free(v10);
LABEL_42:
  CFRelease(v13);
  if (v19)
    CFRelease(v19);
  if (v22)
    CFRelease(v22);
  if (Mutable)
    CFRelease(Mutable);
  if ((v39 & 1) != 0)
    return 1;
LABEL_24:
  if (a3)
  {
    result = 0;
    *a3 = v36;
  }
  else
  {
    if (v36)
      CFRelease(v36);
    return 0;
  }
  return result;
}

id _CreateErrorV(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (v17)
    v19 = objc_msgSend(v17, "mutableCopy");
  else
    v19 = objc_opt_new();
  v20 = (void *)v19;
  if (v18)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v18, a8);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, *MEMORY[0x24BDD0FC8]);

  }
  if (v16)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BDD1398]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("FunctionName"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("SourceFileLine"));

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v15, a4, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

id _CreateError(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  _CreateErrorV(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

id _CreateAndLogError(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  _CreateAndLogErrorV(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

id _CreateAndLogErrorV(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;

  v15 = a5;
  _CreateErrorV(a1, a2, a3, a4, v15, a6, a7, a8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "userInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FC8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      objc_msgSend(v15, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "code");
      objc_msgSend(v15, "userInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }

  return v16;
}

BOOL _IsMalformedBundleError(void *a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;
  void *v4;
  void *v5;

  v1 = a1;
  objc_msgSend(v1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("MIInstallerErrorDomain"))
    && objc_msgSend(v1, "code") == 12)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(v1, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("MIInstallerErrorDomain"))
      && objc_msgSend(v1, "code") == 11)
    {
      v3 = 1;
    }
    else
    {
      objc_msgSend(v1, "domain");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("MIInstallerErrorDomain")))
        v3 = objc_msgSend(v1, "code") == 35;
      else
        v3 = 0;

    }
  }

  return v3;
}

__CFString *MICopyUnlocalizedDescriptionForContainerExtendedError()
{
  uint64_t v0;
  void *v1;
  __CFString *v2;

  v0 = container_error_copy_unlocalized_description();
  if (v0)
  {
    v1 = (void *)v0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v0);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    free(v1);
  }
  else
  {
    v2 = CFSTR("(container_error_copy_unlocalized_description returned NULL)");
  }
  return v2;
}

uint64_t patchFile(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _BYTE *v15;
  _BYTE *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  int *v29;
  int *v30;
  int *v31;
  int *v32;
  uint64_t v33;
  unint64_t buf;
  unint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v37 = 0u;
  v38 = 0u;
  buf = 0;
  v35 = 0;
  v36 = 0;
  if ((*(uint64_t (**)(uint64_t, uint64_t, __int128 *, uint64_t, _QWORD))(a3 + 16))(a3, 3, &v37, 32, 0) != 32)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      return 0;
LABEL_34:
    v27 = __error();
    strerror(*v27);
LABEL_37:
    MOLogWrite();
    return 0;
  }
  if ((_QWORD)v37 != 0x3034464649445342)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      return 0;
    goto LABEL_37;
  }
  v9 = BZOpen(a3, 4, a4, 32);
  if (!v9)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      return 0;
    goto LABEL_34;
  }
  v10 = v9;
  v11 = BZOpen(a3, 5, a4, *((_QWORD *)&v37 + 1) + 32);
  if (v11)
  {
    v12 = v11;
    v13 = BZOpen(a3, 6, a4, *((_QWORD *)&v37 + 1) + v38 + 32);
    if (v13)
    {
      v14 = v13;
      v15 = malloc_type_malloc(0x10000uLL, 0xBA17AE47uLL);
      if (v15)
      {
        v16 = v15;
        v17 = malloc_type_malloc(0x10000uLL, 0xCE350E8DuLL);
        if (v17)
        {
          v18 = v17;
          if (*((_QWORD *)&v38 + 1))
          {
            v19 = 0;
            v20 = 0;
            v33 = (uint64_t)v14;
            while (BZRead((uint64_t)v10, &buf, 24) == 24)
            {
              if (v36 < 0)
                v36 = -(v36 & 0x7FFFFFFFFFFFFFFFLL);
              v21 = buf;
              if (buf)
              {
                while (1)
                {
                  v22 = v21 >= 0x10000 ? 0x10000 : v21;
                  if ((*(uint64_t (**)(uint64_t, uint64_t, _BYTE *, uint64_t, uint64_t))(a1 + 16))(a1, 1, v16, v22, v20) != v22)break;
                  if (v22 != (int)BZRead((uint64_t)v12, v18, v22))
                  {
                    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                      goto LABEL_72;
                    goto LABEL_71;
                  }
                  v23 = 0;
                  do
                  {
                    *((_BYTE *)v18 + v23) += v16[v23];
                    ++v23;
                  }
                  while (v22 != v23);
                  if ((*(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t, unint64_t))(a5 + 16))(a5, 2, v18, v22, v19) != v22)
                  {
LABEL_60:
                    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                      goto LABEL_72;
                    goto LABEL_71;
                  }
                  v20 += v22;
                  v19 += v22;
                  v21 -= v22;
                  if (!v21)
                    goto LABEL_23;
                }
                if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                  goto LABEL_72;
LABEL_71:
                MOLogWrite();
LABEL_72:
                v26 = 0;
                v14 = (_QWORD *)v33;
                goto LABEL_73;
              }
LABEL_23:
              v24 = v35;
              if (v35)
              {
                while (1)
                {
                  v25 = v24 >= 0x10000 ? 0x10000 : v24;
                  if (v25 != (int)BZRead(v33, v18, v25))
                    break;
                  if ((*(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t, unint64_t))(a5 + 16))(a5, 2, v18, v25, v19) != v25)goto LABEL_60;
                  v19 += v25;
                  v24 -= v25;
                  if (!v24)
                    goto LABEL_30;
                }
                if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
                  goto LABEL_71;
                goto LABEL_72;
              }
LABEL_30:
              v20 += v36;
              v26 = 1;
              v14 = (_QWORD *)v33;
              if (v19 >= *((_QWORD *)&v38 + 1))
                goto LABEL_73;
            }
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
              MOLogWrite();
            v26 = 0;
          }
          else
          {
            v26 = 1;
          }
LABEL_73:
          free(v18);
        }
        else
        {
          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            v32 = __error();
            strerror(*v32);
            MOLogWrite();
          }
          v26 = 0;
        }
        free(v16);
      }
      else
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          v31 = __error();
          strerror(*v31);
          MOLogWrite();
        }
        v26 = 0;
      }
      BZClose(v14);
    }
    else
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        v30 = __error();
        strerror(*v30);
        MOLogWrite();
      }
      v26 = 0;
    }
    BZClose(v12);
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v29 = __error();
      strerror(*v29);
      MOLogWrite();
    }
    v26 = 0;
  }
  BZClose(v10);
  return v26;
}

_QWORD *BZOpen(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  _QWORD *v9;
  FILE *v10;
  BZFILE *v11;
  int *v12;
  int bzerror;

  bzerror = 0;
  v8 = malloc_type_calloc(1uLL, 0x30uLL, 0x10A0040A4FBEE0AuLL);
  v9 = v8;
  if (!v8)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_14;
LABEL_12:
    v12 = __error();
    strerror(*v12);
LABEL_13:
    MOLogWrite();
LABEL_14:
    BZClose(v9);
    return 0;
  }
  *(_DWORD *)v8 = a2;
  v8[1] = a3;
  v8[2] = a4;
  v8[3] = a1;
  v10 = funopen(v8, (int (__cdecl *)(void *, char *, int))_fh_read, 0, 0, 0);
  v9[4] = v10;
  if (!v10)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_14;
    goto LABEL_12;
  }
  v11 = BZ2_bzReadOpen(&bzerror, v10, 0, 0, 0, 0);
  v9[5] = v11;
  if (!v11)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_14;
    goto LABEL_13;
  }
  return v9;
}

uint64_t BZRead(uint64_t a1, void *buf, int len)
{
  uint64_t result;
  int bzerror;

  bzerror = 0;
  result = BZ2_bzRead(&bzerror, *(BZFILE **)(a1 + 40), buf, len);
  if ((bzerror & 0xFFFFFFFB) != 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    return 0xFFFFFFFFLL;
  }
  return result;
}

void BZClose(_QWORD *a1)
{
  BZFILE *v2;
  FILE *v3;
  int bzerror;

  bzerror = 0;
  if (a1)
  {
    v2 = (BZFILE *)a1[5];
    if (v2)
      BZ2_bzReadClose(&bzerror, v2);
    v3 = (FILE *)a1[4];
    if (v3)
      fclose(v3);
    free(a1);
  }
}

uint64_t patch_file(const char *a1, const char *a2, int a3)
{
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  int *v12;
  int *v13;
  _QWORD v15[4];
  int v16;
  _QWORD v17[4];
  int v18;
  _QWORD v19[4];
  int v20;
  stat v21;
  stat v22;

  memset(&v22, 0, sizeof(v22));
  memset(&v21, 0, sizeof(v21));
  v5 = open(a1, 256);
  if (v5 != -1)
  {
    v6 = v5;
    if (fstat(v5, &v22) == -1)
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_17;
    }
    else
    {
      v7 = open(a2, 256);
      if (v7 != -1)
      {
        v8 = v7;
        if (fstat(v7, &v21) == -1)
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            goto LABEL_24;
          v13 = __error();
          strerror(*v13);
        }
        else
        {
          v19[0] = MEMORY[0x24BDAC760];
          v19[1] = 0x40000000;
          v19[2] = __patch_file_block_invoke;
          v19[3] = &__block_descriptor_tmp_0;
          v20 = v6;
          v17[0] = MEMORY[0x24BDAC760];
          v17[1] = 0x40000000;
          v17[2] = __patch_file_block_invoke_2;
          v17[3] = &__block_descriptor_tmp_29;
          v18 = v8;
          v15[0] = MEMORY[0x24BDAC760];
          v15[1] = 0x40000000;
          v15[2] = __patch_file_block_invoke_3;
          v15[3] = &__block_descriptor_tmp_31;
          v16 = a3;
          if ((patchFile((uint64_t)v19, v9, (uint64_t)v17, v21.st_size, (uint64_t)v15) & 1) != 0)
          {
            v10 = 0;
LABEL_25:
            close(v8);
            goto LABEL_26;
          }
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
LABEL_24:
            v10 = 0xFFFFFFFFLL;
            goto LABEL_25;
          }
        }
        MOLogWrite();
        goto LABEL_24;
      }
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
LABEL_17:
        v10 = 0xFFFFFFFFLL;
LABEL_26:
        close(v6);
        return v10;
      }
    }
    v12 = __error();
    strerror(*v12);
    MOLogWrite();
    goto LABEL_17;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    v11 = __error();
    strerror(*v11);
    MOLogWrite();
  }
  return 0xFFFFFFFFLL;
}

ssize_t __patch_file_block_invoke(uint64_t a1, int a2, void *__buf, size_t __nbyte, off_t a5)
{
  return pread(*(_DWORD *)(a1 + 32), __buf, __nbyte, a5);
}

ssize_t __patch_file_block_invoke_2(uint64_t a1, int a2, void *__buf, size_t __nbyte, off_t a5)
{
  return pread(*(_DWORD *)(a1 + 32), __buf, __nbyte, a5);
}

ssize_t __patch_file_block_invoke_3(uint64_t a1, int a2, void *__buf, size_t __nbyte, off_t a5)
{
  return pwrite(*(_DWORD *)(a1 + 32), __buf, __nbyte, a5);
}

uint64_t _fh_read(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 24) + 16))();
  if (result == -1)
    return 0xFFFFFFFFLL;
  *(_QWORD *)(a1 + 16) += result;
  return result;
}

__CFString *MICopyProcessNameForPid()
{
  int v0;
  int v1;
  void *v2;
  void *v3;
  _BYTE buffer[4096];
  uint64_t v6;

  v0 = MEMORY[0x24BDAC7A8]();
  v6 = *MEMORY[0x24BDAC8D0];
  v1 = proc_pidpath(v0, buffer, 0x1000u);
  if (v1 < 1)
    return CFSTR("Unknown Process Name");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", buffer, v1, 4);
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (__CFString *)v3;
}

id MIFetchInfoForUsername(const char *a1, uid_t *a2, gid_t *a3, _QWORD *a4)
{
  uint64_t v8;
  size_t v9;
  id result;
  int v11;
  char *v12;
  uint64_t v13;
  passwd *v14;
  passwd v15;
  int v16;
  const char *v17;
  __int16 v18;
  char *v19;
  _OWORD v20[5];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (sysconf(71) == -1)
    MIFetchInfoForUsername_cold_1(&v15, v20);
  v8 = MEMORY[0x24BDAC7A8]();
  memset(&v15, 0, sizeof(v15));
  v14 = 0;
  result = (id)getpwnam_r(a1, &v15, (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v9, &v14);
  if ((_DWORD)result)
  {
    v13 = 0;
    memset(v20, 0, sizeof(v20));
    v11 = (int)result;
    os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    v12 = strerror(v11);
    v16 = 136315394;
    v17 = a1;
    v18 = 2080;
    v19 = v12;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
LABEL_13:
    MIFetchInfoForUsername_cold_2(&v16, v20);
  }
  if (!v14)
    goto LABEL_13;
  if (a2)
    *a2 = v15.pw_uid;
  if (a3)
    *a3 = v15.pw_gid;
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v15.pw_dir, 1, 0);
    result = (id)objc_claimAutoreleasedReturnValue();
    *a4 = result;
  }
  return result;
}

uint64_t MIFetchInfoForUID(uint64_t a1, _QWORD *a2, gid_t *a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v10;
  size_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v25;
  passwd *v26;
  passwd v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (sysconf(71) == -1)
  {
    v19 = *__error();
    v20 = (void *)*MEMORY[0x24BDD1128];
    v21 = v19;
    v22 = strerror(v19);
    _CreateError((uint64_t)"MIFetchInfoForUID", 140, v20, v21, 0, 0, CFSTR("Failed to get home dir path size: %s"), v23, (uint64_t)v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    if (!a5)
      goto LABEL_10;
    goto LABEL_8;
  }
  v10 = MEMORY[0x24BDAC7A8]();
  memset(&v27, 0, sizeof(v27));
  v26 = 0;
  v12 = getpwuid_r(a1, &v27, (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v11, &v26);
  if (v12)
  {
    v14 = (void *)*MEMORY[0x24BDD1128];
    v15 = v12;
    strerror(v12);
    _CreateError((uint64_t)"MIFetchInfoForUID", 150, v14, v15, 0, 0, CFSTR("getpwuid_r failed for uid %d : %s"), v16, a1);
LABEL_4:
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    goto LABEL_5;
  }
  if (!v26)
  {
    _CreateError((uint64_t)"MIFetchInfoForUID", 155, (void *)*MEMORY[0x24BDD1128], 2, 0, 0, CFSTR("getpwuid_r succeeded but no user was found with uid %d"), v13, a1);
    goto LABEL_4;
  }
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v27.pw_name);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a3)
    *a3 = v27.pw_gid;
  if (a4)
  {
    v18 = 1;
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v27.pw_dir, 1, 0);
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
    v18 = 1;
  }
LABEL_5:
  if (!a5)
    goto LABEL_10;
LABEL_8:
  if ((v18 & 1) == 0)
    *a5 = objc_retainAutorelease(v17);
LABEL_10:

  return v18;
}

void MIGetCurrentMobileUserInfo(_DWORD *a1, _DWORD *a2)
{
  if (MIGetCurrentMobileUserInfo_onceToken != -1)
    dispatch_once(&MIGetCurrentMobileUserInfo_onceToken, &__block_literal_global_0);
  *a1 = MIGetCurrentMobileUserInfo_uid;
  *a2 = MIGetCurrentMobileUserInfo_gid;
}

uint64_t MIAssumeIdentityOfUsername(const char *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = 0;
  MIFetchInfoForUsername(a1, (uid_t *)&v4 + 1, (gid_t *)&v4, 0);
  return MIAssumeIdentity(HIDWORD(v4), v4, a2);
}

uint64_t MIAssumeIdentity(uint64_t a1, gid_t a2, _QWORD *a3)
{
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  id v15;
  id v16;
  int *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  id v27;
  id v28;

  if (!(a2 | a1))
  {
    v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v6)
      MIAssumeIdentity_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
  }
  v27 = 0;
  v28 = 0;
  v14 = MIFetchInfoForUID(a1, &v28, 0, 0, &v27);
  v15 = v28;
  v16 = v27;
  if (v14)
  {
    if (pthread_setugid_np(a1, a2))
    {
      v17 = __error();
      v18 = (void *)*MEMORY[0x24BDD1128];
      v26 = *v17;
      strerror(*v17);
      _CreateAndLogError((uint64_t)"MIAssumeIdentity", 228, v18, v26, 0, 0, CFSTR("pthread_setugid_np failed for uid %d gid %d; error %d (%s)"),
        v19,
        a1);
    }
    else
    {
      if (!initgroups((const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"), a2))
      {
        v24 = 1;
        goto LABEL_16;
      }
      v20 = *__error();
      MIRestoreIdentity();
      v21 = (void *)*MEMORY[0x24BDD1128];
      strerror(v20);
      _CreateAndLogError((uint64_t)"MIAssumeIdentity", 238, v21, v20, 0, 0, CFSTR("SYS_initgroups failed; error %d (%s)"),
        v22,
        v20);
    }
    v23 = objc_claimAutoreleasedReturnValue();

    v16 = (id)v23;
  }
  if (a3)
  {
    v16 = objc_retainAutorelease(v16);
    v24 = 0;
    *a3 = v16;
  }
  else
  {
    v24 = 0;
  }
LABEL_16:

  return v24;
}

uint64_t MIRestoreIdentity()
{
  uid_t v0;
  _BOOL8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  int v10;

  v0 = getuid();
  if (!(v0 | getgid()))
  {
    v1 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v1)
      MIRestoreIdentity_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
  }
  result = pthread_setugid_np(0xFFFFFF9B, 0xFFFFFF9B);
  if ((_DWORD)result)
  {
    v10 = *__error();
    os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    strerror(v10);
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
  return result;
}

uint64_t MIAssumeMobileIdentity(_QWORD *a1)
{
  if (MIGetCurrentMobileUserInfo_onceToken != -1)
    dispatch_once(&MIGetCurrentMobileUserInfo_onceToken, &__block_literal_global_0);
  return MIAssumeIdentity(MIGetCurrentMobileUserInfo_uid, MIGetCurrentMobileUserInfo_gid, a1);
}

id MILoadInfoPlist(void *a1, void *a2)
{
  return MILoadInfoPlistWithError(a1, a2, 0);
}

id MILoadInfoPlistWithError(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  __CFBundle *v7;
  id v8;
  uint64_t FilteredInfoPlist;
  uint64_t v10;
  const void *v11;
  CFTypeID TypeID;
  void *v13;
  CFDictionaryRef InfoDictionary;
  void *v15;
  uint64_t v16;
  CFTypeID v17;
  CFStringRef v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v24;

  v5 = a1;
  v6 = a2;
  v24 = 0;
  v7 = (__CFBundle *)_CreateCFBundle(v5, 0, &v24);
  v8 = v24;
  if (v7)
  {
    if (v6)
    {
      FilteredInfoPlist = _CFBundleCreateFilteredInfoPlist();
      if (FilteredInfoPlist)
      {
        v11 = (const void *)FilteredInfoPlist;
        TypeID = CFDictionaryGetTypeID();
        if (TypeID == CFGetTypeID(v11))
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          CFRelease(v11);
        }
        else
        {
          v17 = CFGetTypeID(v11);
          v18 = CFCopyTypeIDDescription(v17);
          _CreateAndLogError((uint64_t)"MILoadInfoPlistWithError", 363, CFSTR("MIInstallerErrorDomain"), 3, 0, 0, CFSTR("Object returned from _CFBundleCreateFilteredInfoPlist was not a dictionary, was type %@"), v19, (uint64_t)v18);
          v20 = objc_claimAutoreleasedReturnValue();

          if (v18)
            CFRelease(v18);
          CFRelease(v11);
          v13 = 0;
          v8 = (id)v20;
        }
        goto LABEL_17;
      }
      _CreateAndLogError((uint64_t)"MILoadInfoPlistWithError", 357, CFSTR("MIInstallerErrorDomain"), 3, 0, 0, CFSTR("Failed to get filtered Info.plist with keys %@ from bundle %@"), v10, (uint64_t)v6);
      v16 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      InfoDictionary = CFBundleGetInfoDictionary(v7);
      if (InfoDictionary)
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", InfoDictionary);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v15;
        if (v15)
          objc_msgSend(v15, "removeObjectForKey:", CFSTR("CFBundleInfoPlistURL"));
LABEL_17:
        CFRelease(v7);
        if (!a3)
          goto LABEL_20;
        goto LABEL_18;
      }
      objc_msgSend(v5, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"MILoadInfoPlistWithError", 378, CFSTR("MIInstallerErrorDomain"), 35, 0, 0, CFSTR("CFBundleGetInfoDictionary failed for bundle at %@"), v22, (uint64_t)v21);
      v16 = objc_claimAutoreleasedReturnValue();

    }
    v13 = 0;
    v8 = (id)v16;
    goto LABEL_17;
  }
  v13 = 0;
  if (!a3)
    goto LABEL_20;
LABEL_18:
  if (!v13)
    *a3 = objc_retainAutorelease(v8);
LABEL_20:

  return v13;
}

const void *_CreateCFBundle(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  uint64_t Unique;
  const void *v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  const void *v26;
  uint64_t v27;
  id v28;

  v5 = a1;
  Unique = _CFBundleCreateUnique();
  if (!Unique)
  {
    objc_msgSend(v5, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"_CreateCFBundle", 296, CFSTR("MIInstallerErrorDomain"), 3, 0, 0, CFSTR("Failed to create CFBundle for %@"), v13, (uint64_t)v12);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v8 = 0;
    if (!a3)
    {
LABEL_23:
      v7 = 0;
      goto LABEL_24;
    }
LABEL_11:
    v11 = objc_retainAutorelease(v11);
    v7 = 0;
    *a3 = v11;
    goto LABEL_24;
  }
  v7 = (const void *)Unique;
  v8 = (id)_CFBundleCopyInfoPlistURL();
  if (!v8)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
    {
      v26 = v7;
      MOLogWrite();
    }
    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("Info.plist"), 0, v26);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v10 = objc_msgSend(v9, "itemIsFileAtURL:error:", v8, &v28);
  v11 = v28;

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v11, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x24BDD1128];
    if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BDD1128]))
    {
      v16 = objc_msgSend(v11, "code");

      if (v16 == 2)
      {
        objc_msgSend(v8, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError((uint64_t)"_CreateCFBundle", 310, CFSTR("MIInstallerErrorDomain"), 35, v11, 0, CFSTR("Info.plist missing at %@"), v18, (uint64_t)v17);
        goto LABEL_22;
      }
    }
    else
    {

    }
    objc_msgSend(v11, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqualToString:", v15))
    {
      v20 = objc_msgSend(v11, "code");

      if (v20 == 22)
      {
        objc_msgSend(v8, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (uint64_t)v17;
        v22 = CFSTR("Expected Info.plist file at %@ but found something that was not a file.");
        v23 = 312;
LABEL_21:
        _CreateAndLogError((uint64_t)"_CreateCFBundle", v23, CFSTR("MIInstallerErrorDomain"), 3, v11, 0, v22, v21, v27);
LABEL_22:
        v24 = objc_claimAutoreleasedReturnValue();

        CFRelease(v7);
        v11 = (id)v24;
        if (!a3)
          goto LABEL_23;
        goto LABEL_11;
      }
    }
    else
    {

    }
    objc_msgSend(v8, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (uint64_t)v17;
    v22 = CFSTR("Error when introspecting %@");
    v23 = 314;
    goto LABEL_21;
  }
  if (a2)
  {
    v8 = objc_retainAutorelease(v8);
    *a2 = v8;
  }
LABEL_24:

  return v7;
}

id MILoadRawInfoPlist(void *a1, _QWORD *a2)
{
  const void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v10;
  id v11;
  id v12;

  v11 = 0;
  v12 = 0;
  v3 = _CreateCFBundle(a1, &v12, &v11);
  v4 = v12;
  v5 = v11;
  if (v3)
  {
    v10 = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "MI_dictionaryWithContentsOfURL:options:error:", v4, 0, &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;

    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    CFRelease(v3);
    v5 = v7;
    if (!a2)
      goto LABEL_7;
  }
  else
  {
    v8 = 0;
    if (!a2)
      goto LABEL_7;
  }
  if (!v8)
    *a2 = objc_retainAutorelease(v5);
LABEL_7:

  return v8;
}

void MIRecordCurrentBuildVersion(void *a1)
{
  id v1;
  void *v2;
  char v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v1 = a1;
  v2 = (void *)_CFCopySystemVersionDictionary();
  v7 = 0;
  v3 = objc_msgSend(v2, "MI_writeToURL:format:options:error:", v1, 200, 268435457, &v7);
  v4 = v7;
  if ((v3 & 1) != 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDBD1F0]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ReleaseType"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

LABEL_8:
    }
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    objc_msgSend(v1, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
    goto LABEL_8;
  }

}

uint64_t MIIsBuildUpgrade(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
      goto LABEL_16;
LABEL_15:
    MOLogWrite();
LABEL_16:
    v12 = 0;
    v13 = 0;
    v9 = 0;
    v11 = 0;
    v7 = 0;
    goto LABEL_26;
  }
  v5 = *MEMORY[0x24BDBD1F0];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDBD1F0]);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_16;
    goto LABEL_15;
  }
  v7 = (id)v6;
  v8 = (void *)_CFCopySystemVersionDictionary();
  if (!v8)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    v12 = 0;
    v13 = 0;
    v9 = 0;
    goto LABEL_25;
  }
  v9 = v8;
  objc_msgSend(v8, "objectForKeyedSubscript:", v5);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    v12 = 0;
    v13 = 0;
LABEL_25:
    v11 = 0;
    goto LABEL_26;
  }
  v11 = (void *)v10;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ReleaseType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ReleaseType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", v11))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      MOLogWrite();
    v14 = 0;
    goto LABEL_29;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    MOLogWrite();
LABEL_26:
  if (a2)
  {
    v7 = objc_retainAutorelease(v7);
    *a2 = v7;
  }
  v14 = 1;
LABEL_29:

  return v14;
}

id MILoadFilteredPlist(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  int Filtered;
  void *v10;
  BOOL v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  objc_class *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v23;
  id v24;
  CFTypeRef v25;
  CFTypeRef cf;

  v5 = a1;
  v6 = a2;
  v25 = 0;
  cf = 0;
  v24 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v5, 3, &v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v24;
  if (!v7)
  {
    objc_msgSend(v5, "path");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"MILoadFilteredPlist", 502, CFSTR("MIInstallerErrorDomain"), 4, v8, 0, CFSTR("Failed to read plist from %@"), v15, (uint64_t)v12);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (!v6)
  {
    v23 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v7, 0, 0, &v23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v23;

    if (!v10)
    {
      objc_msgSend(v5, "path");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"MILoadFilteredPlist", 520, CFSTR("MIInstallerErrorDomain"), 4, v13, 0, CFSTR("Failed to decode plist from %@"), v20, (uint64_t)v12);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    v8 = v13;
    goto LABEL_12;
  }
  Filtered = _CFPropertyListCreateFiltered();
  v10 = (void *)v25;
  if (Filtered)
    v11 = v25 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    v25 = 0;
LABEL_12:
    objc_opt_class();
    v12 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v12;
    else
      v17 = 0;

    if (v17)
    {
      v16 = v8;
      goto LABEL_24;
    }
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"MILoadFilteredPlist", 526, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Object returned from _CFPropertyListCreateFiltered was not a dictionary, was type %@"), v19, (uint64_t)v13);
    goto LABEL_18;
  }
  v12 = (id)cf;
  cf = 0;
  objc_msgSend(v5, "path");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  _CreateAndLogError((uint64_t)"MILoadFilteredPlist", 511, CFSTR("MIInstallerErrorDomain"), 4, v12, 0, CFSTR("Failed to decode plist from %@"), v14, (uint64_t)v13);
LABEL_18:
  v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_20:
  v8 = v13;
LABEL_21:

  if (a3)
  {
    v16 = objc_retainAutorelease(v16);
    v12 = 0;
    *a3 = v16;
  }
  else
  {
    v12 = 0;
  }
LABEL_24:
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v25)
  {
    CFRelease(v25);
    v25 = 0;
  }
  v21 = v12;

  return v21;
}

id MICopyCurrentBuildVersion()
{
  if (MICopyCurrentBuildVersion_onceToken != -1)
    dispatch_once(&MICopyCurrentBuildVersion_onceToken, &__block_literal_global_72);
  return (id)MICopyCurrentBuildVersion_buildVersion;
}

uint64_t MIAssertHighResourceUsage()
{
  unsigned int v0;
  uint64_t result;

  do
    v0 = __ldaxr((unsigned int *)&sResourceExpectationCount);
  while (__stlxr(v0 + 1, (unsigned int *)&sResourceExpectationCount));
  if (!v0)
  {
    getpid();
    return proc_disable_cpumon();
  }
  return result;
}

uint64_t MIClearResourceAssertion()
{
  unsigned int v0;
  unsigned int v1;
  uint64_t result;

  do
  {
    v0 = __ldaxr((unsigned int *)&sResourceExpectationCount);
    v1 = v0 - 1;
  }
  while (__stlxr(v1, (unsigned int *)&sResourceExpectationCount));
  if (!v1)
  {
    getpid();
    return proc_set_cpumon_defaults();
  }
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_1()
{
  return _os_log_send_and_compose_impl();
}

BOOL OUTLINED_FUNCTION_2()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

id MICreateSHA256Digest(void *a1, _QWORD *a2)
{
  id v3;
  int *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  const char *v14;
  _QWORD *v15;
  int v16;
  int v17;
  int *v18;
  int v19;
  void *v20;
  int *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  unsigned __int8 *v26;
  unsigned int v27;
  char *v28;
  off_t st_size;
  off_t v31;
  off_t v32;
  off_t v33;
  ssize_t v34;
  ssize_t v35;
  int *v36;
  id v37;
  _QWORD v38[2];
  uint64_t (*v39)(uint64_t, const void *, CC_LONG);
  void *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  const char *v45;
  CC_SHA256_CTX v46;
  id v47;
  stat v48;
  stat v49;
  _OWORD md[2];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  memset(md, 0, sizeof(md));
  memset(&v48, 0, sizeof(v48));
  v3 = objc_retainAutorelease(a1);
  if (lstat((const char *)objc_msgSend(v3, "fileSystemRepresentation"), &v48))
  {
    v4 = __error();
    v5 = *v4;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation");
    strerror(v5);
    _CreateAndLogError((uint64_t)"MICreateSHA256Digest", 121, CFSTR("MIInstallerErrorDomain"), 4, v6, 0, CFSTR("Failed to stat path %s : %s"), v8, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_3;
  }
  if (v48.st_size <= 0xFFFFFFF)
  {
    v47 = 0;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfURL:options:error:", v3, 3, &v47);
    v9 = v47;
    if (v11)
    {
      v12 = objc_retainAutorelease(v11);
      CC_SHA256((const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), (unsigned __int8 *)md);

LABEL_28:
      v23 = (char *)malloc_type_calloc(1uLL, 0x41uLL, 0x67229F93uLL);
      v24 = v23;
      v25 = 0;
      v26 = (unsigned __int8 *)md;
      do
      {
        v27 = *v26++;
        v28 = &v23[v25];
        *v28 = _HexToASCII_hex[(unint64_t)v27 >> 4];
        v25 += 2;
        v28[1] = _HexToASCII_hex[v27 & 0xF];
      }
      while (v25 != 64);
      v23[64] = 0;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v23);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      free(v24);
      if (!a2)
        goto LABEL_33;
      goto LABEL_31;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    goto LABEL_3;
  }
  v42 = 0;
  v43 = &v42;
  v44 = 0x8810000000;
  v45 = "";
  memset(&v46, 0, sizeof(v46));
  CC_SHA256_Init(&v46);
  v13 = objc_retainAutorelease(v3);
  v14 = (const char *)objc_msgSend(v13, "fileSystemRepresentation");
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v39 = __MICreateSHA256Digest_block_invoke;
  v40 = &unk_24EBCEAE8;
  v41 = &v42;
  v15 = v38;
  memset(&v49, 0, sizeof(v49));
  v16 = open(v14, 256);
  v17 = v16;
  if (v16 < 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v21 = __error();
      strerror(*v21);
      MOLogWrite();
    }
    v20 = 0;
LABEL_21:
    v19 = 0;
  }
  else
  {
    if (fstat(v16, &v49))
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_13;
      goto LABEL_12;
    }
    if (v49.st_size >= 0x10000)
      st_size = 0x10000;
    else
      st_size = v49.st_size;
    v20 = malloc_type_malloc(st_size, 0xBF9B6362uLL);
    if (!v20)
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_13;
LABEL_12:
      v18 = __error();
      strerror(*v18);
      MOLogWrite();
LABEL_13:
      v19 = 0;
      v20 = 0;
LABEL_23:
      close(v17);
      goto LABEL_24;
    }
    v31 = v49.st_size;
    if (v49.st_size < 1)
    {
      v19 = 1;
      goto LABEL_23;
    }
    v37 = v13;
    v32 = 0;
    while (1)
    {
      v33 = v31 - v32;
      if (st_size >= v33)
        st_size = v33;
      v34 = read(v17, v20, st_size);
      v35 = v34;
      if (v34 == -1)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          v36 = __error();
          v13 = v37;
          strerror(*v36);
          MOLogWrite();
          goto LABEL_21;
        }
        goto LABEL_58;
      }
      if (v34 <= 0)
        break;
      v19 = v39((uint64_t)v15, v20, v34);
      if (v19)
      {
        v32 += v35;
        v31 = v49.st_size;
        if (v32 < v49.st_size)
          continue;
      }
      goto LABEL_59;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
      v13 = v37;
      goto LABEL_21;
    }
LABEL_58:
    v19 = 0;
LABEL_59:
    v13 = v37;
  }
  if (v17 != -1)
    goto LABEL_23;
LABEL_24:
  if (v20)
    free(v20);

  CC_SHA256_Final((unsigned __int8 *)md, (CC_SHA256_CTX *)(v43 + 4));
  if (v19)
  {
    _Block_object_dispose(&v42, 8);
    v9 = 0;
    goto LABEL_28;
  }
  _CreateAndLogError((uint64_t)"MICreateSHA256Digest", 148, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Failed to read %@"), v22, (uint64_t)v13);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v42, 8);
LABEL_3:
  v10 = 0;
  if (!a2)
    goto LABEL_33;
LABEL_31:
  if (!v10)
    *a2 = objc_retainAutorelease(v9);
LABEL_33:

  return v10;
}

void sub_222EDA55C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void MIRunTransactionalTask(void *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = a1;
  v6 = (void *)os_transaction_create();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __MIRunTransactionalTask_block_invoke;
  v9[3] = &unk_24EBCEB10;
  v10 = v6;
  v11 = v4;
  v7 = v6;
  v8 = v4;
  dispatch_async(v5, v9);

}

uint64_t MIApplyAppPatch(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  BOOL v18;
  id v19;
  void *v20;
  BOOL v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  int v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  char v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  char v63;
  void *v64;
  id v65;
  void *v67;
  id v68;
  void *v69;
  CFTypeRef v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  id v82;
  id v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  id v89;
  void *v90;
  id v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  id v108;
  id v109;
  CFTypeRef cf;
  id v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  id v116;
  id v117;
  id v118;
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v103 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x24BDBCF48];
  NSTemporaryDirectory();
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fileURLWithPath:isDirectory:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v102 = v12;
  objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", CFSTR("ApplyAppPatchWorkingDir"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLByAppendingPathComponent:isDirectory:", CFSTR("PreviousVersion"), 1);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLByAppendingPathComponent:isDirectory:", CFSTR("Patch"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", CFSTR("Payload"), 1);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = 0;
  LOBYTE(v11) = objc_msgSend(v15, "removeItemAtURL:error:", v13, &v118);
  v16 = v118;

  if ((v11 & 1) == 0)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_89;
    objc_msgSend(v13, "path");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v62;
    v68 = v16;
    goto LABEL_88;
  }
  v101 = v14;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    v67 = v7;
    MOLogWrite();
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v7, 0, v67);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = v16;
  v18 = +[MIBOMWrapper extractZipArchiveAtURL:toURL:withError:](MIBOMWrapper, "extractZipArchiveAtURL:toURL:withError:", v17, v106, &v117);
  v19 = v117;

  if (!v18)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      objc_msgSend(v106, "path");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v19;
      MOLogWrite();

    }
    v105 = 0;
    v23 = 0;
    v63 = 0;
    v16 = v19;
    goto LABEL_91;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    v67 = v8;
    MOLogWrite();
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v8, 0, v67);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = v19;
  v21 = +[MIBOMWrapper extractZipArchiveAtURL:toURL:withError:](MIBOMWrapper, "extractZipArchiveAtURL:toURL:withError:", v20, v14, &v116);
  v16 = v116;

  if (!v21)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_89;
    objc_msgSend(v14, "path");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v62;
    v68 = v16;
LABEL_88:
    MOLogWrite();

LABEL_89:
    v105 = 0;
    v23 = 0;
    goto LABEL_90;
  }
  objc_msgSend(v106, "URLByAppendingPathComponent:isDirectory:", CFSTR("Payload"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _FindBundles(v22);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  if (!v23 || !objc_msgSend(v23, "count"))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      objc_msgSend(v106, "path");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    v105 = 0;
    goto LABEL_90;
  }
  _FindBundles(v104);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = v24;
  if (!v24 || (v25 = v24, !objc_msgSend(v24, "count")))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      objc_msgSend(v14, "path");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v61;
LABEL_99:
      MOLogWrite();

    }
LABEL_90:
    v63 = 0;
    goto LABEL_91;
  }
  v72 = v9;
  v73 = v8;
  v74 = v7;
  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  v23 = v23;
  v99 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v112, v119, 16);
  if (!v99)
    goto LABEL_74;
  v98 = *(_QWORD *)v113;
  v86 = *MEMORY[0x24BDBD1E0];
  v87 = *MEMORY[0x24BDBD2A0];
  v85 = *MEMORY[0x24BDBD280];
  v96 = v23;
  while (2)
  {
    for (i = 0; i != v99; ++i)
    {
      if (*(_QWORD *)v113 != v98)
        objc_enumerationMutation(v23);
      v27 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
      objc_msgSend(v23, "objectForKeyedSubscript:", v27, v67, v68, v69, v70, v71);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("com.apple.MobileInstallation.BundleURL"));
      v107 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("com.apple.MobileInstallation.BundleURL"));
      v30 = objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        {
          v67 = v27;
          MOLogWrite();
        }
        goto LABEL_28;
      }
      v31 = (void *)v30;
      objc_msgSend(CFSTR("com.apple.deltainstallcommands."), "stringByAppendingString:", v27);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", v32, 0);
      v33 = objc_claimAutoreleasedReturnValue();

      +[MIFileManager defaultManager](MIFileManager, "defaultManager");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = (id)v33;
      LODWORD(v33) = objc_msgSend(v34, "itemDoesNotExistAtURL:", v33);

      if ((_DWORD)v33)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        {
          v67 = v27;
          MOLogWrite();
        }

        v14 = v101;
        v23 = v96;
LABEL_28:

        continue;
      }
      objc_msgSend(v107, "URLByAppendingPathComponent:isDirectory:", CFSTR("Info.plist"), 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = 0;
      v94 = v35;
      MICreateSHA256Digest(v35, &v111);
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v111;
      v97 = (id)v36;
      v95 = v37;
      if (!v36)
      {
        v44 = v37;
        if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          v46 = 6;
          v14 = v101;
          v23 = v96;
          v45 = v94;
        }
        else
        {
          v45 = v94;
          objc_msgSend(v94, "path");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = v44;
          MOLogWrite();
          v46 = 6;
          v14 = v101;
          v23 = v96;

        }
        goto LABEL_70;
      }
      objc_msgSend(v29, "objectForKeyedSubscript:", v87);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      MIStringifyObject(v38);
      v93 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "objectForKeyedSubscript:", v86);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      MIStringifyObject(v39);
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "objectForKeyedSubscript:", v87);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      MIStringifyObject(v40);
      v92 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "objectForKeyedSubscript:", v86);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      MIStringifyObject(v41);
      v91 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "objectForKeyedSubscript:", v85);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v43 = v42;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v89 = v43;
      else
        v89 = 0;

      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("UISupportedDevices"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v48 = v47;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v49 = v48;
      else
        v49 = 0;
      v14 = v101;

      if (!v49)
      {
        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("SupportedDevices"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v51 = v50;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v49 = v51;
        else
          v49 = 0;

        v14 = v101;
      }
      objc_opt_class();
      v90 = v49;
      if ((MIArrayContainsOnlyClass(v49) & 1) != 0)
      {
        objc_msgSend(v107, "URLByAppendingPathComponent:isDirectory:", v89, 0);
        v83 = (id)objc_claimAutoreleasedReturnValue();
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        {
          v70 = v93;
          v71 = v88;
          v69 = v91;
          MOLogWrite();
        }
        cf = 0;
        v76 = objc_retainAutorelease(v107);
        v81 = objc_msgSend(v76, "fileSystemRepresentation");
        v75 = objc_retainAutorelease(v31);
        v79 = objc_msgSend(v75, "fileSystemRepresentation");
        v52 = objc_retainAutorelease(v100);
        v78 = objc_msgSend(v52, "fileSystemRepresentation");
        v77 = objc_msgSend(objc_retainAutorelease(v92), "UTF8String");
        v53 = objc_msgSend(objc_retainAutorelease(v91), "UTF8String");
        v54 = objc_msgSend(objc_retainAutorelease(v97), "UTF8String");
        v84 = objc_retainAutorelease(v83);
        if ((hardlink_copy_hierarchy(v81, v79, v78, v77, v53, v54, objc_msgSend(v84, "fileSystemRepresentation"), (uint64_t)v90, 0, (CFErrorRef *)&cf) & 1) != 0)
        {
          +[MIFileManager defaultManager](MIFileManager, "defaultManager");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = v16;
          v80 = v52;
          v56 = objc_msgSend(v55, "removeItemAtURL:error:", v52, &v109);
          v82 = v109;

          v14 = v101;
          if ((v56 & 1) != 0)
          {
            objc_msgSend(v105, "removeObjectForKey:", v27);
            v46 = 0;
LABEL_67:
            v23 = v96;
            v45 = v94;
            v16 = v82;
            v57 = v84;
            goto LABEL_68;
          }
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
            v46 = 6;
            goto LABEL_67;
          }
          objc_msgSend(v80, "path");
          v16 = v82;
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = v82;
          MOLogWrite();

          v46 = 6;
        }
        else
        {
          v58 = v52;
          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            objc_msgSend(v76, "path");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "path");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "path");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = cf;
            v67 = v59;
            v68 = v60;
            MOLogWrite();

          }
          if (cf)
            CFRelease(cf);
          v46 = 6;
          v14 = v101;
        }
        v23 = v96;
        v45 = v94;
        v57 = v84;
LABEL_68:

        goto LABEL_69;
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        objc_msgSend(v107, "path");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        MOLogWrite();
        v57 = v67;
        v46 = 6;
        v23 = v96;
        v45 = v94;
        goto LABEL_68;
      }
      v46 = 6;
      v23 = v96;
      v45 = v94;
LABEL_69:

LABEL_70:
      if (v46)
      {

        v8 = v73;
        v7 = v74;
        v9 = v72;
        goto LABEL_90;
      }
      v25 = v105;
    }
    v99 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v112, v119, 16);
    if (v99)
      continue;
    break;
  }
LABEL_74:

  if (objc_msgSend(v25, "count"))
  {
    v8 = v73;
    v7 = v74;
    v9 = v72;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      objc_msgSend(v25, "allKeys", v67, v68, v69, v70, v71);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v61;
      goto LABEL_99;
    }
    goto LABEL_90;
  }
  v8 = v73;
  v7 = v74;
  v9 = v72;
  if ((_CreateZipFromDirectory(v14, v103) & 1) == 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v67 = v103;
      MOLogWrite();
    }
    goto LABEL_90;
  }
  v63 = 1;
LABEL_91:
  +[MIFileManager defaultManager](MIFileManager, "defaultManager", v67, v68);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v16;
  objc_msgSend(v64, "removeItemAtURL:error:", v13, &v108);
  v65 = v108;

  return v63 & 1;
}

id _FindBundles(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  _QWORD v37[8];

  v37[6] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = (void *)objc_opt_new();
  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend(v3, "urlsForItemsInDirectoryAtURL:ignoringSymlinks:error:", v1, 1, &v35);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v35;

  if (v4)
  {
    v24 = v5;
    v25 = v1;
    v26 = v2;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v32;
      v9 = *MEMORY[0x24BDBD288];
      v29 = *MEMORY[0x24BDBD2A0];
      v28 = *MEMORY[0x24BDBD1E0];
      v27 = *MEMORY[0x24BDBD280];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v32 != v8)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v11, "pathExtension", v22);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12 && objc_msgSend(v12, "isEqualToString:", CFSTR("app")))
          {
            v37[0] = v9;
            v37[1] = v29;
            v37[2] = v28;
            v37[3] = v27;
            v37[4] = CFSTR("UISupportedDevices");
            v37[5] = CFSTR("SupportedDevices");
            v14 = (void *)MEMORY[0x24BDBCE30];
            v15 = v11;
            objc_msgSend(v14, "arrayWithObjects:count:", v37, 6);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            MILoadInfoPlist(v15, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, CFSTR("com.apple.MobileInstallation.BundleURL"));
            objc_msgSend(v18, "objectForKeyedSubscript:", v9);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v18, v19);
            }
            else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
            {
              v22 = v18;
              MOLogWrite();
            }

          }
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v7);
    }

    v2 = v26;
    v20 = v26;
    v1 = v25;
    v5 = v24;
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      objc_msgSend(v1, "path");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    v20 = 0;
  }

  return v20;
}

uint64_t _CreateZipFromDirectory(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t StreamableZip;
  int *v8;
  FILE *v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = objc_retainAutorelease(a2);
  v10 = fopen((const char *)objc_msgSend(v4, "fileSystemRepresentation"), "w+x");
  if (v10)
  {
    v5 = *MEMORY[0x24BEB2CE8];
    v11[0] = *MEMORY[0x24BEB2CE0];
    v11[1] = v5;
    v12[0] = *MEMORY[0x24BEB2CD0];
    v12[1] = MEMORY[0x24BDBD1C8];
    v11[2] = *MEMORY[0x24BEB2CF0];
    v12[2] = &unk_24EBD2AD0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation");
    StreamableZip = SZArchiverCreateStreamableZip();
    fclose(v10);

  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation");
      v8 = __error();
      strerror(*v8);
      MOLogWrite();
    }
    StreamableZip = 0;
  }

  return StreamableZip;
}

void _InitTraversalState(void *a1)
{
  bzero(a1, 0x420uLL);
}

_QWORD *_DestroyTraversalState(uint64_t a1)
{
  _QWORD *i;
  _QWORD *v3;
  _QWORD *result;

  for (i = *(_QWORD **)a1; *(_QWORD *)a1; i = *(_QWORD **)a1)
  {
    *(_QWORD *)a1 = *i;
    --*(_BYTE *)(a1 + 1051);
    _FreeContinuation(a1, (uint64_t)i);
  }
  while (1)
  {
    v3 = *(_QWORD **)(a1 + 8);
    if (!v3)
      break;
    *(_QWORD *)(a1 + 8) = *v3;
    free(v3);
  }
  while (1)
  {
    result = *(_QWORD **)(a1 + 16);
    if (!result)
      break;
    *(_QWORD *)(a1 + 16) = *result;
    free(result);
  }
  return result;
}

_QWORD *_PopContinuation(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)a1;
  if (result)
  {
    *(_QWORD *)a1 = *result;
    --*(_BYTE *)(a1 + 1051);
  }
  return result;
}

uint64_t _FreeContinuation(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t result;

  v4 = *(_QWORD **)(a2 + 8);
  if (v4)
  {
    *v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v4;
  }
  result = *(unsigned int *)(a2 + 24);
  if ((result & 0x80000000) == 0)
  {
    result = close(result);
    *(_DWORD *)(a2 + 24) = -1;
  }
  *(_QWORD *)a2 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = a2;
  return result;
}

_QWORD *_CreateAndPushContinuation(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *AttrBuffer;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    *(_QWORD *)(a1 + 16) = *v2;
  }
  else
  {
    v2 = malloc_type_malloc(0x20uLL, 0x103004057E7F81CuLL);
    if (!v2)
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        MOLogWrite();
      return 0;
    }
  }
  AttrBuffer = _GetAttrBuffer(a1);
  v2[1] = AttrBuffer;
  if (!AttrBuffer)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    free(v2);
    return 0;
  }
  v2[2] = 0;
  v2[3] = 0xFFFFFFFFLL;
  *v2 = *(_QWORD *)a1;
  *(_QWORD *)a1 = v2;
  ++*(_BYTE *)(a1 + 1051);
  return v2;
}

_QWORD *_GetAttrBuffer(uint64_t a1)
{
  _QWORD *v1;
  unsigned int v3;
  _QWORD *v4;
  _QWORD *v5;
  int v6;

  v1 = *(_QWORD **)(a1 + 8);
  if (v1)
  {
    *(_QWORD *)(a1 + 8) = *v1;
    return v1;
  }
  v3 = *(unsigned __int8 *)(a1 + 1050);
  if (v3 >= 0x10)
  {
    v4 = *(_QWORD **)a1;
    if (*(_QWORD *)a1 && v4[1])
    {
      while (1)
      {
        v5 = v4;
        v4 = (_QWORD *)*v4;
        if (!v4)
          break;
        if (!v4[1])
        {
          if (!v5)
            goto LABEL_13;
          break;
        }
      }
      v1 = (_QWORD *)v5[1];
      v5[1] = 0;
      *((_DWORD *)v5 + 7) = 0;
      *((_DWORD *)v5 + 5) = 0;
      v6 = *((_DWORD *)v5 + 6);
      if ((v6 & 0x80000000) == 0)
      {
        close(v6);
        *((_DWORD *)v5 + 6) = -1;
      }
    }
    else
    {
LABEL_13:
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        MOLogWrite();
      return 0;
    }
    return v1;
  }
  *(_BYTE *)(a1 + 1050) = v3 + 1;
  return malloc_type_malloc(0x4000uLL, 0x8D484474uLL);
}

uint64_t _PushContinuation(uint64_t result, _QWORD *a2)
{
  *a2 = *(_QWORD *)result;
  *(_QWORD *)result = a2;
  ++*(_BYTE *)(result + 1051);
  return result;
}

BOOL _PushPathBuf(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;

  v3 = *(unsigned __int16 *)(a1 + 1048);
  v4 = a3 + v3 + 1;
  if (v4 <= 0x3FF)
  {
    v6 = a1 + 24;
    *(_BYTE *)(a1 + 24 + v3) = 47;
    memcpy((void *)(*(unsigned __int16 *)(a1 + 1048) + a1 + 24 + 1), a2, a3);
    *(_WORD *)(a1 + 1048) = v4;
    *(_BYTE *)(v6 + v4) = 0;
  }
  return v4 < 0x400;
}

uint64_t _PopPathBuf(uint64_t result)
{
  uint64_t v1;
  BOOL v2;

  v1 = *(unsigned __int16 *)(result + 1048);
  if (*(_WORD *)(result + 1048))
  {
    do
    {
      v2 = *(_BYTE *)(result + 23 + v1) == 47 || v1 == 1;
      --v1;
    }
    while (!v2);
  }
  *(_BYTE *)(result + 24 + (unsigned __int16)v1) = 0;
  *(_WORD *)(result + 1048) = v1;
  return result;
}

uint64_t _LastPathElement(unint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;

  v3 = 0;
  v4 = a1 + a2;
  while (1)
  {
    v5 = v3;
    v6 = v4 + v3;
    v7 = *(unsigned __int8 *)(v6 - 1);
    if (v6 - 1 <= a1)
      break;
    v3 = v5 - 1;
    if (v7 == 47)
      goto LABEL_6;
  }
  if (v7 == 47)
  {
LABEL_6:
    *a3 = -v5;
    return v4 + v5;
  }
  return 0;
}

uint64_t TraverseDirectory(uint64_t a1, char a2, unsigned int a3, _QWORD *a4, void *a5)
{
  return TraverseDirectoryWithPostTraversal(a1, a2, a3, a4, a5, 0);
}

uint64_t TraverseDirectoryWithPostTraversal(uint64_t a1, char a2, unsigned int a3, _QWORD *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  id v21;
  int ContinuationFD;
  id v23;
  int v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  int32x2_t *v32;
  _QWORD *AttrBuffer;
  uint64_t v34;
  uint64_t v35;
  unsigned int v36;
  unsigned __int32 v37;
  unsigned __int32 v38;
  unsigned int v39;
  uint64_t v40;
  int32x2_t v41;
  int v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  size_t v48;
  int v49;
  void *v50;
  int v51;
  uint64_t v52;
  unsigned __int16 v53;
  BOOL v54;
  int v55;
  id v56;
  int v57;
  void *v58;
  uint64_t v59;
  unsigned __int16 v60;
  BOOL v61;
  _QWORD *v62;
  int v63;
  id v64;
  int v65;
  int v66;
  void *v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  int v73;
  _BOOL4 v74;
  int v75;
  __CFString *v76;
  __CFString *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  id v82;
  id v83;
  _QWORD *v84;
  int v85;
  int v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  _QWORD *v92;
  int v93;
  uint64_t v94;
  _QWORD *v95;
  int v96;
  uint64_t v97;
  _QWORD *v98;
  char v99;
  id v100;
  id v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char v106;
  id v107;
  const void *v108;
  __int128 v109;
  int __errnum[4];
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  uint64_t v120;
  int32x2_t *v121;
  _QWORD *v122;
  int32x2_t *v123;
  _BYTE v124[1024];
  unsigned __int16 v125;
  char v126;
  uint64_t v127;

  v127 = *MEMORY[0x24BDAC8D0];
  v11 = a5;
  v12 = a6;
  v104 = 0;
  v105 = 0;
  v103 = 5;
  if ((a3 & 1) != 0)
    v13 = -1610579959;
  else
    v13 = -1610612727;
  LODWORD(v105) = (a3 >> 6) & 4 | (a3 >> 7) & 1;
  HIDWORD(v103) = v13 & 0xBDB8FFFF | (((a3 >> 1) & 7) << 16) & 0xBDBFFFFF | (((a3 >> 5) & 1) << 22) & 0xBDFFFFFF | (((a3 >> 4) & 1) << 30) | (((a3 >> 6) & 1) << 25);
  HIDWORD(v104) = 6;
  bzero(&v121, 0x420uLL);
  if (!a1)
  {
    _CreateAndLogError((uint64_t)"TraverseDirectoryWithPostTraversal", 891, CFSTR("MIInstallerErrorDomain"), 25, 0, 0, CFSTR("%s was called with a NULL path parameter."), v14, (uint64_t)"_Bool TraverseDirectoryWithPostTraversal(const char *, TraverseDirectoryOptions, TraverseDirectoryAdditionalFetchProperties, NSError *__autoreleasing *, __strong TraverseDirectoryItemBlock, __strong TraverseDirectoryPostTraversalBlock)");
    goto LABEL_15;
  }
  v15 = __strlcpy_chk();
  if (v15 >= 0x400)
  {
    _CreateAndLogError((uint64_t)"TraverseDirectoryWithPostTraversal", 898, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Attempted to iterate directories starting at a path that was too long: %s"), v16, a1);
LABEL_15:
    v29 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v125 = v15;
  v17 = _CreateAndPushContinuation((uint64_t)&v121);
  if (!v17)
  {
    _CreateAndLogError((uint64_t)"TraverseDirectoryWithPostTraversal", 906, (void *)*MEMORY[0x24BDD1128], 12, 0, 0, CFSTR("Failed to create a continuation"), v18, v97);
    goto LABEL_15;
  }
  if ((a2 & 1) == 0)
  {
    v19 = (uint64_t)v17;
    v20 = a2;
    v21 = v11;
    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    *(_OWORD *)__errnum = 0u;
    v120 = 0;
    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    v115 = 0u;
    v107 = 0;
    v108 = 0;
    v106 = 0;
    ContinuationFD = _GetContinuationFD((uint64_t)&v121, v19, 0, &v107);
    v23 = v107;
    if (ContinuationFD == -1)
    {
      a2 = v20;
    }
    else
    {
      if (!fgetattrlist(ContinuationFD, &v103, *(void **)(v19 + 8), 0x4000uLL, 0))
      {
        _ParseAttributeBuf((uint64_t)v124, *(_QWORD *)(v19 + 8), (uint64_t)&v109, &v108, 0, &v106);
        a2 = v20;
        if (DWORD1(v111) != 2)
        {
          v69 = *(_DWORD *)(v19 + 24);
          if ((v69 & 0x80000000) == 0)
          {
            close(v69);
            *(_DWORD *)(v19 + 24) = -1;
          }
        }
        v70 = 0;
        while (1)
        {
          v71 = v70;
          v72 = (char *)&v121 + v125 + v70;
          v73 = v72[23];
          if (v72 + 23 <= v124)
            break;
          v70 = v71 - 1;
          if (v73 == 47)
            goto LABEL_102;
        }
        if (v73 != 47)
        {
          _CreateAndLogError((uint64_t)"_CallBlockForBaseItem", 839, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Failed to locate last path element in %s"), v68, (uint64_t)v124);
          v28 = objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
LABEL_102:
        v74 = _CallClientBlock(v20, (uint64_t)v124, v125, (uint64_t)&v124[v125 + v71], -v71, 0, (uint64_t)&v109, (uint64_t)&v115, (uint64_t)v108, v21)- 1 < 2;
        v75 = DWORD1(v111) != 2 || v74;
        if (v106)
          v65 = 1;
        else
          v65 = v75;
        v64 = 0;
        v66 = 1;
        goto LABEL_89;
      }
      v24 = *__error();
      v25 = (void *)*MEMORY[0x24BDD1128];
      v26 = v24;
      strerror(v24);
      _CreateAndLogError((uint64_t)"_CallBlockForBaseItem", 823, v25, v26, 0, 0, CFSTR("fgetattrlist for %s failed: %s"), v27, (uint64_t)v124);
      v28 = objc_claimAutoreleasedReturnValue();
      a2 = v20;
LABEL_13:

      v23 = (id)v28;
    }
    v64 = objc_retainAutorelease(v23);
    v65 = 0;
    v66 = 0;
    v23 = v64;
LABEL_89:

    v29 = v64;
    if (!v66)
      goto LABEL_16;
    if (v65)
      goto LABEL_91;
    goto LABEL_21;
  }
  v29 = 0;
LABEL_21:
  v32 = v121;
  if (!v121)
    goto LABEL_91;
  v98 = a4;
  v99 = a2;
  while (1)
  {
    v121 = (int32x2_t *)*v32;
    --v126;
    if (!*(_QWORD *)&v32[1])
    {
      AttrBuffer = _GetAttrBuffer((uint64_t)&v121);
      v32[1] = (int32x2_t)AttrBuffer;
      if (!AttrBuffer)
        break;
    }
    while (1)
    {
      v102 = v11;
      v101 = v12;
      v120 = 0;
      v118 = 0u;
      v119 = 0u;
      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      *(_OWORD *)__errnum = 0u;
      v111 = 0u;
      v109 = 0u;
      v36 = v32[3].u16[2];
      if (!v32[3].i16[2])
        goto LABEL_62;
      v37 = v32[2].u32[0];
      v38 = v32[2].u32[1];
      v39 = v37 - v38;
      if (v37 < v38)
      {
        _CreateAndLogError((uint64_t)"_ProcessContinuation", 650, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Internal error: totalProcessedEntryCount (%u) was less than reprocessCount (%u)"), v35, v32[2].u32[0]);
LABEL_93:
        v67 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_117:
        v82 = objc_retainAutorelease(v67);

LABEL_118:
        v83 = v82;

        v84 = (_QWORD *)v32[1];
        if (v84)
        {
          *v84 = v122;
          v122 = v84;
        }
        v85 = v32[3].i32[0];
        if ((v85 & 0x80000000) == 0)
        {
          close(v85);
          v32[3].i32[0] = -1;
        }
        *v32 = (int32x2_t)v123;
        v123 = v32;
        v29 = v83;
        goto LABEL_123;
      }
      if (v37 == v38)
      {
        v40 = v32[3].u16[3];
      }
      else
      {
        if (v39 >= v36)
        {
          v32[2].i32[1] = v38 + v36;
          v32[3].i16[3] = v36;
          goto LABEL_62;
        }
        v40 = (unsigned __int16)(v37 - v38);
        v32[3].i16[3] = v39;
        v32[2].i32[1] = v37;
      }
      v41 = v32[1];
      if ((_DWORD)v40)
      {
        v42 = 0;
        v43 = 0;
        while (1)
        {
          v44 = *(unsigned int *)(*(_QWORD *)&v41 + v43);
          v43 += v44;
          if (v43 > 0x4000)
            break;
          if (++v42 >= v40)
            goto LABEL_37;
        }
        _CreateAndLogError((uint64_t)"_ProcessContinuation", 685, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Read entry length %u for entry %hu but that put us off the end of the buffer"), v35, v44);
        goto LABEL_93;
      }
      v43 = 0;
LABEL_37:
      v100 = v11;
      if (v40 < v36)
      {
        while (1)
        {
          v107 = 0;
          v108 = 0;
          v106 = 0;
          _ParseAttributeBuf((uint64_t)v124, *(_QWORD *)&v41 + v43, (uint64_t)&v109, &v107, &v108, &v106);
          v46 = (uint64_t)v108;
          if (!v108)
            break;
          v43 += v109;
          if (v43 > 0x4000)
          {
            v76 = CFSTR("MIInstallerErrorDomain");
            v97 = v109;
            v77 = CFSTR("Read entry length %u for entry %hu but that put us off the end of the buffer");
            v78 = 709;
            goto LABEL_112;
          }
          v47 = __errnum[2];
          if (__errnum[2])
          {
            v80 = (void *)*MEMORY[0x24BDD1128];
            strerror(__errnum[2]);
            _CreateAndLogError((uint64_t)"_ProcessContinuation", 716, v80, v47, 0, 0, CFSTR("got error while processing entry %hu in %s : %s"), v81, v40);
            goto LABEL_116;
          }
          v48 = (v111 - 1);
          if (!_PushPathBuf((uint64_t)&v121, v108, v48))
          {
            v76 = (__CFString *)*MEMORY[0x24BDD1128];
            v97 = v46;
            v77 = CFSTR("Could not append element \"%s\" of length %zd to path \"%s\" because it would make the path longer than MAXPATHLEN");
            v78 = 723;
            v79 = 63;
            goto LABEL_115;
          }
          v49 = _CallClientBlock(v99, (uint64_t)v124, v125, v46, v48, v126 + 1, (uint64_t)&v109, (uint64_t)&v115, (uint64_t)v107, v102);
          if (v49 == 2)
          {
            v106 = 1;
          }
          else if (v49 == 1)
          {
            goto LABEL_127;
          }
          ++v32[3].i16[3];
          v32[2] = vadd_s32(v32[2], (int32x2_t)0x100000001);
          if (DWORD1(v111) == 2)
          {
            if (!v106)
            {
              *v32 = (int32x2_t)v121;
              v121 = v32;
              ++v126;
              if (_CreateAndPushContinuation((uint64_t)&v121))
              {

                v11 = v100;
                goto LABEL_85;
              }
              v76 = (__CFString *)*MEMORY[0x24BDD1128];
              v77 = CFSTR("Failed to create a continuation");
              v78 = 753;
              v79 = 12;
LABEL_115:
              _CreateAndLogError((uint64_t)"_ProcessContinuation", v78, v76, v79, 0, 0, v77, v45, v97);
LABEL_116:
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = v100;
              goto LABEL_117;
            }
            if (v12)
            {
              v50 = (void *)MEMORY[0x22767FEB0]();
              v51 = (*((uint64_t (**)(id, _BYTE *))v12 + 2))(v101, v124);
              objc_autoreleasePoolPop(v50);
              if (!v51)
              {
LABEL_127:

                v92 = (_QWORD *)v32[1];
                v11 = v100;
                if (v92)
                {
                  *v92 = v122;
                  v122 = v92;
                }
                v93 = v32[3].i32[0];
                if ((v93 & 0x80000000) == 0)
                {
                  close(v93);
                  v32[3].i32[0] = -1;
                }
                *v32 = (int32x2_t)v123;
                v123 = v32;
                goto LABEL_91;
              }
            }
          }
          v52 = v125;
          if (v125)
          {
            v11 = v100;
            do
            {
              v53 = v52 - 1;
              v54 = v124[v52 - 1] == 47 || v52 == 1;
              --v52;
            }
            while (!v54);
            v52 = v53;
          }
          else
          {
            v11 = v100;
          }
          v40 = (v40 + 1);
          v124[v52] = 0;
          v125 = v52;
          if (v40 >= v32[3].u16[2])
            goto LABEL_62;
        }
        v76 = CFSTR("MIInstallerErrorDomain");
        v97 = v40;
        v77 = CFSTR("Entry %hu in %s did not include name information even though we requested it.");
        v78 = 702;
LABEL_112:
        v79 = 4;
        goto LABEL_115;
      }
LABEL_62:

      *(_QWORD *)&v109 = 0;
      v55 = _GetContinuationFD((uint64_t)&v121, (uint64_t)v32, 1, &v109);
      v56 = (id)v109;
      if (v55 == -1)
        goto LABEL_125;
      v57 = getattrlistbulk(v55, &v103, *(void **)&v32[1], 0x4000uLL, 0);
      if (!v57)
        break;
      if (v57 == -1)
      {
        v86 = *__error();
        v87 = (void *)*MEMORY[0x24BDD1128];
        v88 = v86;
        v89 = v32[2].u32[0];
        strerror(v86);
        _CreateAndLogError((uint64_t)"_PopulateAttrBuf", 410, v87, v88, 0, 0, CFSTR("getattrlistbulk failed on entry %u in %s : %s"), v90, v89);
        v91 = objc_claimAutoreleasedReturnValue();

        v56 = (id)v91;
LABEL_125:
        v82 = objc_retainAutorelease(v56);

        goto LABEL_118;
      }
      v32[3].i16[2] = v57;
      v32[3].i16[3] = 0;

    }
    if (!v12 || (v99 & 1) != 0 && !v121)
      goto LABEL_71;
    v58 = (void *)MEMORY[0x22767FEB0]();
    if (!(*((unsigned int (**)(id, _BYTE *))v12 + 2))(v101, v124))
    {
      v95 = (_QWORD *)v32[1];
      if (v95)
      {
        *v95 = v122;
        v122 = v95;
      }
      v96 = v32[3].i32[0];
      if ((v96 & 0x80000000) == 0)
      {
        close(v96);
        v32[3].i32[0] = -1;
      }
      *v32 = (int32x2_t)v123;
      v123 = v32;
      objc_autoreleasePoolPop(v58);
      goto LABEL_91;
    }
    objc_autoreleasePoolPop(v58);
LABEL_71:
    v59 = v125;
    if (v125)
    {
      do
      {
        v60 = v59 - 1;
        v61 = v124[v59 - 1] == 47 || v59 == 1;
        --v59;
      }
      while (!v61);
      v59 = v60;
    }
    v124[v59] = 0;
    v125 = v59;
    v62 = (_QWORD *)v32[1];
    if (v62)
    {
      *v62 = v122;
      v122 = v62;
    }
    v63 = v32[3].i32[0];
    if ((v63 & 0x80000000) == 0)
    {
      close(v63);
      v32[3].i32[0] = -1;
    }
    *v32 = (int32x2_t)v123;
    v123 = v32;
LABEL_85:
    v32 = v121;
    if (!v121)
    {
LABEL_91:
      _DestroyTraversalState((uint64_t)&v121);
      v30 = 1;
      goto LABEL_19;
    }
  }
  _CreateAndLogError((uint64_t)"TraverseDirectoryWithPostTraversal", 931, (void *)*MEMORY[0x24BDD1128], 12, 0, 0, CFSTR("Failed to locate an attrBuf"), v34, v97);
  v94 = objc_claimAutoreleasedReturnValue();

  v29 = (id)v94;
LABEL_123:
  a4 = v98;
LABEL_16:
  _DestroyTraversalState((uint64_t)&v121);
  if (a4)
  {
    v29 = objc_retainAutorelease(v29);
    v30 = 0;
    *a4 = v29;
  }
  else
  {
    v30 = 0;
  }
LABEL_19:

  return v30;
}

uint64_t _GetContinuationFD(uint64_t a1, uint64_t a2, int a3, _QWORD *a4)
{
  uint64_t v4;
  id v5;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = *(unsigned int *)(a2 + 24);
  if ((_DWORD)v4 == -1)
  {
    if (a3)
      v8 = 1048832;
    else
      v8 = 0x200000;
    v9 = a1 + 24;
    v10 = open((const char *)(a1 + 24), v8);
    if ((v10 & 0x80000000) == 0)
    {
      v4 = v10;
      v5 = 0;
      *(_DWORD *)(a2 + 24) = v4;
      goto LABEL_14;
    }
    v11 = __error();
    v12 = *v11;
    v13 = (void *)*MEMORY[0x24BDD1128];
    if ((_DWORD)v12 == 2)
    {
      strerror(2);
      _CreateError((uint64_t)"_GetContinuationFD", 301, v13, 2, 0, 0, CFSTR("Failed to open %s : %s"), v14, v9);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (!a4)
        goto LABEL_13;
    }
    else
    {
      strerror(*v11);
      _CreateAndLogError((uint64_t)"_GetContinuationFD", 303, v13, v12, 0, 0, CFSTR("Failed to open %s : %s"), v15, v9);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (!a4)
      {
LABEL_13:
        v4 = 0xFFFFFFFFLL;
        goto LABEL_14;
      }
    }
    v5 = objc_retainAutorelease(v5);
    *a4 = v5;
    goto LABEL_13;
  }
  v5 = 0;
LABEL_14:

  return v4;
}

uint64_t _ParseAttributeBuf(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5, _BYTE *a6)
{
  int v9;
  int v10;
  uint64_t *v11;
  uint64_t v12;
  char *v13;
  int v14;
  char *v15;
  int v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  int v25;
  uint64_t result;
  int v27;
  int v28;

  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_DWORD *)a3 = *(_DWORD *)a2;
  v9 = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(a3 + 4) = *(_OWORD *)(a2 + 4);
  *(_DWORD *)(a3 + 20) = v9;
  v10 = *(_DWORD *)(a3 + 4);
  if ((v10 & 0x20000000) == 0)
  {
    v11 = (uint64_t *)(a2 + 24);
    if ((v10 & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v13 = 0;
    if ((v10 & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  *(_DWORD *)(a3 + 24) = *(_DWORD *)(a2 + 24);
  v11 = (uint64_t *)(a2 + 28);
  if ((v10 & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v12 = *v11;
  *(_QWORD *)(a3 + 28) = *v11;
  v13 = (char *)v11++ + (int)v12;
  if ((v10 & 8) != 0)
  {
LABEL_7:
    v14 = *(_DWORD *)v11;
    v11 = (uint64_t *)((char *)v11 + 4);
    *(_DWORD *)(a3 + 36) = v14;
  }
LABEL_8:
  if ((v10 & 0x8000) != 0)
  {
    v16 = *(_DWORD *)v11;
    v11 = (uint64_t *)((char *)v11 + 4);
    *(_DWORD *)(a3 + 40) = v16;
    if ((v10 & 0x10000) == 0)
    {
LABEL_10:
      if ((v10 & 0x20000) == 0)
        goto LABEL_11;
      goto LABEL_17;
    }
  }
  else if ((v10 & 0x10000) == 0)
  {
    goto LABEL_10;
  }
  v17 = *(_DWORD *)v11;
  v11 = (uint64_t *)((char *)v11 + 4);
  *(_DWORD *)(a3 + 44) = v17;
  if ((v10 & 0x20000) == 0)
  {
LABEL_11:
    if ((v10 & 0x40000) == 0)
      goto LABEL_12;
    goto LABEL_18;
  }
LABEL_17:
  v18 = *(_DWORD *)v11;
  v11 = (uint64_t *)((char *)v11 + 4);
  *(_DWORD *)(a3 + 48) = v18;
  if ((v10 & 0x40000) == 0)
  {
LABEL_12:
    if ((v10 & 0x400000) == 0)
      goto LABEL_13;
LABEL_19:
    v20 = *v11;
    *(_QWORD *)(a3 + 56) = *v11;
    v15 = (char *)v11++ + (int)v20;
    if ((v10 & 0x2000000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_18:
  v19 = *(_DWORD *)v11;
  v11 = (uint64_t *)((char *)v11 + 4);
  *(_DWORD *)(a3 + 52) = v19;
  if ((v10 & 0x400000) != 0)
    goto LABEL_19;
LABEL_13:
  v15 = 0;
  if ((v10 & 0x2000000) != 0)
  {
LABEL_20:
    v21 = *v11++;
    *(_QWORD *)(a3 + 64) = v21;
  }
LABEL_21:
  if ((v10 & 0x40000000) != 0)
  {
    v22 = *(_DWORD *)v11;
    v11 = (uint64_t *)((char *)v11 + 4);
    *(_DWORD *)(a3 + 72) = v22;
  }
  if (*(_DWORD *)(a3 + 36) == 2)
  {
    v23 = *(_DWORD *)(a3 + 12);
    if ((v23 & 2) != 0)
    {
      v24 = *(_DWORD *)v11;
      v11 = (uint64_t *)((char *)v11 + 4);
      *(_DWORD *)(a3 + 80) = v24;
      if (!v24)
        *a6 = 1;
    }
    if ((v23 & 4) != 0)
    {
      v25 = *(_DWORD *)v11;
      *(_DWORD *)(a3 + 84) = v25;
      if ((v25 & 3) != 0)
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          result = MOLogWrite();
        *a6 = 1;
      }
    }
  }
  else
  {
    v27 = *(_DWORD *)(a3 + 16);
    if ((v27 & 1) != 0)
    {
      v28 = *(_DWORD *)v11;
      v11 = (uint64_t *)((char *)v11 + 4);
      *(_DWORD *)(a3 + 80) = v28;
    }
    if ((v27 & 4) != 0)
      *(_QWORD *)(a3 + 88) = *v11;
  }
  if (a5)
    *a5 = v13;
  if (a4)
    *a4 = v15;
  return result;
}

uint64_t _CallClientBlock(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  unsigned int (**v18)(id, _QWORD, char *);
  int v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  int v23;
  __int16 v24;
  unsigned int v25;
  void *v26;
  char v28;

  v18 = a10;
  v19 = *(_DWORD *)(a7 + 36);
  if ((a1 & 2) != 0 && v19 == 2)
  {
    v20 = 0;
  }
  else
  {
    v21 = a9;
    *(_QWORD *)a8 = *(_QWORD *)(a7 + 64);
    *(_QWORD *)(a8 + 8) = *(_QWORD *)(a7 + 88);
    *(_QWORD *)(a8 + 16) = a2;
    *(_QWORD *)(a8 + 24) = a3;
    *(_QWORD *)(a8 + 32) = a4;
    v22 = *(unsigned int *)(a7 + 52);
    *(_QWORD *)(a8 + 40) = a5;
    *(_QWORD *)(a8 + 48) = v22;
    *(_DWORD *)(a8 + 56) = v19;
    v23 = *(_DWORD *)(a7 + 72);
    *(_DWORD *)(a8 + 60) = *(_DWORD *)(a7 + 80);
    *(_DWORD *)(a8 + 64) = v23;
    *(_QWORD *)(a8 + 68) = *(_QWORD *)(a7 + 40);
    *(_DWORD *)(a8 + 76) = *(_DWORD *)(a7 + 80);
    v24 = *(_WORD *)(a7 + 48) & 0xFFF;
    *(_WORD *)(a8 + 80) = v24;
    v25 = v19 - 1;
    if (v25 <= 6)
      *(_WORD *)(a8 + 80) = word_222EEDEE8[v25] | v24;
    if (a9)
      v21 = *(_DWORD *)(a9 + 36) != -1;
    *(_BYTE *)(a8 + 82) = v21;
    *(_BYTE *)(a8 + 83) = a6;
    v26 = (void *)MEMORY[0x22767FEB0]();
    v28 = 1;
    if (v18[2](v18, a8, &v28))
      v20 = 2 * (v28 == 0);
    else
      v20 = 1;
    objc_autoreleasePoolPop(v26);
  }

  return v20;
}

uint64_t MIBooleanValue(void *a1, uint64_t a2)
{
  id v3;

  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a2 = objc_msgSend(v3, "BOOLValue");

  return a2;
}

uint64_t MIArrayContainsOnlyClass(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
  v6 = 1;
LABEL_11:

  return v6;
}

id MIArrayFilteredToContainOnlyClass(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v2, "addObject:", v8, (_QWORD)v11);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v9 = (void *)objc_msgSend(v2, "copy");
  return v9;
}

uint64_t MIDictionaryContainsOnlyClasses(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v5 = a1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __MIDictionaryContainsOnlyClasses_block_invoke;
  v8[3] = &unk_24EBCEB38;
  v8[4] = &v9;
  v8[5] = a2;
  v8[6] = a3;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_222EDD128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MIStringifyObject(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = v1;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v1);
      v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    v3 = v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id MIArrayifyThing(void *a1)
{
  id v1;
  id v2;
  id v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (!v1)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (MIArrayContainsOnlyClass(v1))
    {
      v2 = v1;
LABEL_7:
      v3 = v2;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6[0] = v1;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_11:
    v3 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v1, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (MIArrayContainsOnlyClass(v4))
    v3 = v4;
  else
    v3 = 0;

LABEL_12:
  return v3;
}

BOOL MICompareObjects(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _BOOL8 v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = (v3 != 0) == (v4 != 0) && (!v3 || !v4 || objc_msgSend(v3, "isEqual:", v4));

  return v6;
}

uint64_t _removefile_error_callback(_removefile_state *a1, uint64_t a2, _DWORD *a3)
{
  int dst;

  dst = 0;
  if (removefile_state_get(a1, 5u, &dst))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    dst = 2;
  }
  else if (dst != 2 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    strerror(dst);
    MOLogWrite();
  }
  if (a3 && !*a3)
    *a3 = dst;
  return 0;
}

uint64_t _CopyfileStatusCallback(uint64_t a1, int a2, uint64_t a3, const char *a4, uint64_t a5, void *a6)
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  unsigned int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  stat v23;

  if (a2 == 3)
  {
    v8 = a6;
    v9 = *__error();
    if (objc_msgSend(v8, "ignoreErrors"))
    {
      if ((_DWORD)a1)
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          goto LABEL_17;
      }
      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
        goto LABEL_17;
      }
      strerror(v9);
LABEL_16:
      MOLogWrite();
LABEL_17:
      v10 = 1;
LABEL_28:

      return v10;
    }
    if ((_DWORD)v9 == 45)
    {
      memset(&v23, 0, sizeof(v23));
      if (lstat(a4, &v23))
      {
        v12 = *__error();
        _CreateError((uint64_t)"_CopyfileStatusCallback", 237, (void *)*MEMORY[0x24BDD1128], v12, 0, 0, CFSTR("lstat returned an error when trying to determine type for %s"), v13, (uint64_t)a4);
LABEL_27:
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setError:", v20);

        v10 = 2;
        goto LABEL_28;
      }
      v17 = v23.st_mode & 0xF000;
      if (v17 >= 0x6000)
      {
        if (v17 == 24576)
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
            goto LABEL_17;
          goto LABEL_16;
        }
        if (v17 == 49152)
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
            goto LABEL_17;
          goto LABEL_16;
        }
      }
      else
      {
        if (v17 == 4096)
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
            goto LABEL_17;
          goto LABEL_16;
        }
        if (v17 == 0x2000)
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
            goto LABEL_17;
          goto LABEL_16;
        }
      }
      v18 = (void *)*MEMORY[0x24BDD1128];
      if ((_DWORD)a1)
      {
        v22 = a1;
        v15 = CFSTR("copyfile hit ENOTSUP at %d while copying %s to %s; src mode: 0%o");
        v16 = 258;
      }
      else
      {
        v22 = (uint64_t)a4;
        v15 = CFSTR("copyfile hit ENOTSUP in source hierarchy while copying %s to %s; src mode: 0%o");
        v16 = 256;
      }
      v19 = 45;
    }
    else
    {
      v14 = (void *)*MEMORY[0x24BDD1128];
      strerror(v9);
      if ((_DWORD)a1)
      {
        v22 = a1;
        v15 = CFSTR("copyfile failed at %d while copying %s to %s: %s (%d)");
        v16 = 267;
      }
      else
      {
        v22 = (uint64_t)a4;
        v15 = CFSTR("copyfile failed in source hierarchy while copying %s to %s: %s (%d)");
        v16 = 265;
      }
      v18 = v14;
      v19 = v9;
    }
    _CreateError((uint64_t)"_CopyfileStatusCallback", v16, v18, v19, 0, 0, v15, v11, v22);
    goto LABEL_27;
  }
  return 0;
}

void sub_222EDF018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_222EDF9AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a50, 8);
  _Unwind_Resume(a1);
}

void sub_222EE0480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_222EE0700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222EE0CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _dataForEAKey(char *name, int fd, _QWORD *a3)
{
  unint64_t v6;
  uint64_t v7;
  size_t v8;
  __CFString *v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v19;
  ssize_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;

  v6 = fgetxattr(fd, name, 0, 0, 0, 32);
  if ((v6 & 0x8000000000000000) != 0)
  {
    v11 = *__error();
    v12 = (void *)*MEMORY[0x24BDD1128];
    v13 = v11;
    strerror(v11);
    _CreateError((uint64_t)"_dataForEAKey", 1549, v12, v13, 0, 0, CFSTR("Could not get data length for extended attribute key %s: %s"), v14, (uint64_t)name);
LABEL_8:
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    goto LABEL_9;
  }
  v8 = v6;
  if (!v6)
  {
    v30 = name;
    v9 = CFSTR("Data for extended attribute key %s was empty");
    v10 = 1552;
    goto LABEL_7;
  }
  if (v6 > 0x1000)
  {
    v30 = name;
    v9 = CFSTR("Data length is more than 4 KB for extended attribute key %s: length is %zd bytes");
    v10 = 1555;
LABEL_7:
    _CreateError((uint64_t)"_dataForEAKey", v10, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, v9, v7, (uint64_t)v30);
    goto LABEL_8;
  }
  v19 = malloc_type_malloc(v6, 0x1F5EDC03uLL);
  if (!v19)
  {
    v22 = *__error();
    v23 = (void *)*MEMORY[0x24BDD1128];
    v24 = v22;
    strerror(v22);
    _CreateError((uint64_t)"_dataForEAKey", 1561, v23, v24, 0, 0, CFSTR("Failed to malloc %zd bytes for extended attribute key %s: %s"), v25, v8);
    goto LABEL_8;
  }
  v16 = v19;
  v20 = fgetxattr(fd, name, v19, v8, 0, 32);
  if (v20 < 0)
  {
    v26 = *__error();
    v27 = (void *)*MEMORY[0x24BDD1128];
    v28 = v26;
    strerror(v26);
    _CreateError((uint64_t)"_dataForEAKey", 1567, v27, v28, 0, 0, CFSTR("Failed to malloc %zd bytes for extended attribute key %s: %s"), v29, v8);
  }
  else
  {
    if (v20)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v16, v20, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      if (v17)
        goto LABEL_12;
      goto LABEL_9;
    }
    _CreateError((uint64_t)"_dataForEAKey", 1570, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Data for key %s returned length 0, expected length %zd"), v21, (uint64_t)name);
  }
  v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
  free(v16);
  if (a3)
  {
    v15 = objc_retainAutorelease(v15);
    v17 = 0;
    *a3 = v15;
  }
  else
  {
    v17 = 0;
  }
LABEL_12:

  return v17;
}

uint64_t _CheckRealpathHasBasePrefix(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  char v25[128];
  char v26[1024];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  bzero(v26, 0x400uLL);
  v20 = objc_retainAutorelease(v3);
  realpath_DARWIN_EXTSN((const char *)objc_msgSend(v20, "fileSystemRepresentation"), v26);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFileSystemRepresentation:", v26);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v4, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v22;
    while (2)
    {
      v12 = v4;
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (v10 + i < (unint64_t)objc_msgSend(v6, "count"))
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", v10 + i);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqualToString:", v15);

          if ((v16 & 1) != 0)
            continue;
        }
        if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          v17 = 0;
          v4 = v12;
        }
        else
        {
          objc_msgSend(objc_retainAutorelease(v20), "fileSystemRepresentation");
          v4 = v12;
          objc_msgSend(v12, "path");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          MOLogWrite();

          v17 = 0;
        }
        goto LABEL_16;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v10 += i;
      v17 = 1;
      v4 = v12;
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v17 = 1;
  }
LABEL_16:

  return v17;
}

void sub_222EE4F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

void sub_222EE691C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;

  _Unwind_Resume(a1);
}

uint64_t immutable_open(int a1, char *a2, int a3, unsigned int a4)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  int *v7;
  int *v8;
  char *v10;
  char *v11;

  v4 = open(a2, a3, a4);
  v5 = v4;
  if ((v4 & 0x80000000) == 0)
  {
    if (fcntl(v4, 68, 1) < 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v6 = __error();
      v10 = strerror(*v6);
      MOLogWrite();
    }
    if (fcntl(v5, 48, 1, v10) < 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v7 = __error();
      v11 = strerror(*v7);
      MOLogWrite();
    }
    if (fcntl(v5, 76, 1, v11) < 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v8 = __error();
      strerror(*v8);
      MOLogWrite();
    }
  }
  return v5;
}

uint64_t bom_file_error_handler(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;

  v4 = BOMCopierUserData();
  if (v4)
  {
    *(_DWORD *)v4 = a3;
    *(_BYTE *)(v4 + 4) = 1;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    strerror(a3);
    MOLogWrite();
  }
  return 2;
}

uint64_t bom_fatal_error_handler()
{
  uint64_t v0;
  uint64_t result;

  v0 = BOMCopierUserData();
  if (v0)
    *(_BYTE *)(v0 + 4) = 1;
  result = gLogHandle;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    return MOLogWrite();
  return result;
}

uint64_t bom_fatal_file_error_handler(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;

  result = BOMCopierUserData();
  if (result)
  {
    *(_DWORD *)result = a3;
    *(_BYTE *)(result + 4) = 1;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    strerror(a3);
    return MOLogWrite();
  }
  return result;
}

uint64_t bom_copier_copy_file_finished_handler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = BOMCopierUserData();
  if (result)
    *(_QWORD *)(result + 16) += a4;
  return result;
}

unint64_t *bom_copier_copy_file_update_handler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t *result;

  result = (unint64_t *)BOMCopierUserData();
  if (result)
    return (unint64_t *)(*(uint64_t (**)(unint64_t, double))(result[3] + 16))(result[3], (double)(result[2] + a3) / (double)result[1] * 100.0);
  return result;
}

uint64_t create_new_header_for_hiding(int a1, _QWORD *a2, size_t *a3, int a4)
{
  uint64_t v9;
  uint64_t v10;

  v9 = 0;
  v10 = 0;
  if (!a2 || !a3)
  {
LABEL_13:
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  *a2 = 0;
  *a3 = 0;
  if (!examine_binary(a1, (uint64_t)&v9))
  {
    if ((v9 & 0x3E) != 0x2E)
      return 0;
    if (v10 < 2)
    {
      if (HIDWORD(v10) == HIDWORD(v9) - 1)
        return create_fat_disk_header(HIDWORD(v10), a2, a3);
      if (a4)
        return create_reordered_hidden_disk_header(a1, a2, a3, HIDWORD(v9), SHIDWORD(v10));
      syslog(3, "arm64 slice at index %u, not last (nfat_arch = %u)\n");
    }
    else
    {
      syslog(3, "too many (%u) arm64 slices\n");
    }
    goto LABEL_13;
  }
  return 0xFFFFFFFFLL;
}

uint64_t examine_binary(int a1, uint64_t a2)
{
  uint64_t result;
  uint32_t nfat_arch;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  BOOL v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  stat v20;
  fat_arch v21;
  fat_header fat_header;

  fat_header = 0;
  memset(&v21, 0, sizeof(v21));
  memset(&v20, 0, sizeof(v20));
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  result = fstat(a1, &v20);
  if ((_DWORD)result != -1)
  {
    if (read_or_error(a1, &fat_header, 8uLL, 0))
    {
      if (fat_header.magic != -1095041334)
        return 0;
      swap_fat_header(&fat_header, NX_LittleEndian);
      nfat_arch = fat_header.nfat_arch;
      *(_DWORD *)(a2 + 4) = fat_header.nfat_arch;
      if (read_fat_arch(a1, nfat_arch, &v21))
      {
        if (v21.cputype == 16777228)
        {
          v18 = 0u;
          v19 = 0u;
          if (v20.st_size > v21.offset && v21.size >= 0x1C && v20.st_size >= v21.size + v21.offset && v21.align <= 0x40)
          {
            if (v21.size + (unint64_t)v21.offset > 0x1F)
            {
              if (read_or_error(a1, &v18, 0x20uLL, v21.offset) && (_DWORD)v18 == -17958193 && HIDWORD(v18) == 2)
              {
                *(_DWORD *)a2 |= 0x10u;
                ++fat_header.nfat_arch;
              }
            }
            else
            {
              *__error() = 34;
            }
          }
        }
        if (fat_header.nfat_arch)
        {
          v6 = 0;
          while (1)
          {
            if (!read_fat_arch(a1, v6, &v21))
              return 0xFFFFFFFFLL;
            if (v21.cputype == 12)
            {
              *(_DWORD *)a2 |= 2u;
              v7 = 1;
            }
            else
            {
              v7 = 0;
              if (v21.cputype == 16777228)
              {
                *(_DWORD *)a2 |= 4u;
                ++*(_DWORD *)(a2 + 8);
                *(_DWORD *)(a2 + 12) = v6;
              }
            }
            v18 = 0u;
            v19 = 0u;
            if (v21.size + (unint64_t)v21.offset <= 0x1F)
            {
              *__error() = 34;
              return 0xFFFFFFFFLL;
            }
            if (!read_or_error(a1, &v18, 0x20uLL, v21.offset))
              return 0xFFFFFFFFLL;
            if ((_DWORD)v18 == -17958193)
              break;
            if ((_DWORD)v18 == -17958194)
            {
              v8 = HIDWORD(v18);
              v9 = v19;
              v10 = 28;
              v11 = 28;
              goto LABEL_29;
            }
            syslog(5, "ignoring slice with magic %08x\n", (_DWORD)v18);
LABEL_47:
            if (++v6 >= fat_header.nfat_arch)
              return 0;
          }
          v8 = HIDWORD(v18);
          v9 = v19;
          v10 = 32;
          v11 = 32;
LABEL_29:
          if (v8 == 2)
          {
            *(_DWORD *)a2 |= 0x20u;
            v11 = v10;
          }
          if (v7)
          {
            if (v9)
            {
              while (1)
              {
                v17 = 0;
                v12 = slice_pread(a1, &v17, 8uLL, v11, v21.offset, v21.size);
                v13 = v12;
                if (!v12)
                  goto LABEL_42;
                if ((_DWORD)v17 == 37)
                  break;
                v11 += HIDWORD(v17);
                if (!--v9)
                  goto LABEL_36;
              }
              v15 = 0;
              v16 = 0;
              if (!slice_pread(a1, &v15, 0x10uLL, v11, v21.offset, v21.size))
              {
LABEL_42:
                v14 = 1;
                goto LABEL_43;
              }
              if (WORD1(v16) <= 6u)
                *(_DWORD *)a2 |= 8u;
            }
            else
            {
LABEL_36:
              v13 = 0;
            }
            v14 = 6;
LABEL_43:
            if (v14 != 6 || v13)
            {
              if (v14 != 6)
                return 0xFFFFFFFFLL;
            }
            else
            {
              *(_DWORD *)a2 |= 8u;
            }
          }
          goto LABEL_47;
        }
        return 0;
      }
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t create_reordered_hidden_disk_header(int a1, _QWORD *a2, size_t *a3, unsigned int a4, int a5)
{
  int *v5;
  int v6;
  size_t v12;
  _DWORD *v13;
  _DWORD *v14;
  uint64_t result;
  _DWORD *v16;
  int v17;
  _DWORD *v18;
  __int128 v19;
  __int128 v20;

  if (a4 >= 0x401)
  {
    v5 = __error();
    v6 = 22;
LABEL_7:
    *v5 = v6;
    return 0xFFFFFFFFLL;
  }
  v12 = 20 * a4 + 8;
  v13 = malloc_type_malloc(v12, 0x63868CB2uLL);
  if (!v13)
  {
    v5 = __error();
    v6 = 12;
    goto LABEL_7;
  }
  v14 = v13;
  if (read_or_error(a1, v13, v12, 0))
  {
    result = 0;
    v16 = &v14[5 * a4 - 3];
    v17 = v16[4];
    v18 = &v14[5 * a5 + 2];
    v19 = *(_OWORD *)v18;
    v16[4] = v18[4];
    v20 = *(_OWORD *)v16;
    *(_OWORD *)v16 = v19;
    *(_OWORD *)v18 = v20;
    v18[4] = v17;
    v14[1] = bswap32(a4 - 1);
    *a2 = v14;
    *a3 = v12;
    return result;
  }
  free(v14);
  return 0xFFFFFFFFLL;
}

uint64_t create_fat_disk_header(unsigned int a1, _QWORD *a2, _QWORD *a3)
{
  _DWORD *v6;
  _DWORD *v7;
  uint64_t result;

  v6 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  if (v6)
  {
    v7 = v6;
    result = 0;
    *v7 = -1095041334;
    v7[1] = bswap32(a1);
    *a2 = v7;
    *a3 = 8;
  }
  else
  {
    *__error() = 12;
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t create_new_header_for_unhiding(int a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  if (!a2 || !a3)
  {
LABEL_11:
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  *a2 = 0;
  *a3 = 0;
  if (!examine_binary(a1, (uint64_t)&v6))
  {
    if ((~(_DWORD)v6 & 0x3E) != 0)
      return 0;
    if (v7 < 2)
    {
      if (HIDWORD(v7) == HIDWORD(v6))
        return create_fat_disk_header(HIDWORD(v7) + 1, a2, a3);
      syslog(3, "arm64 slice at index %u, not last (nfat_arch = %u)\n");
    }
    else
    {
      syslog(3, "too many (%u) arm64 slices\n");
    }
    goto LABEL_11;
  }
  return 0xFFFFFFFFLL;
}

uint64_t hide_archs_if_needed(char *a1, int a2, _BYTE *a3)
{
  return swizzle_archs_if_needed(a1, 1, a2, a3);
}

uint64_t swizzle_archs_if_needed(char *a1, int a2, int a3, _BYTE *a4)
{
  int v8;
  int v9;
  int *v10;
  char *v11;
  uint64_t v12;
  int v13;
  size_t v14;
  ssize_t v15;
  ssize_t v16;
  int *v17;
  int *v18;
  size_t v20;
  void *v21;

  v20 = 0;
  v21 = 0;
  if (a4)
    *a4 = 0;
  v8 = open(a1, 256);
  v9 = v8;
  if (v8 == -1)
  {
    v10 = __error();
    v11 = strerror(*v10);
    syslog(3, "Could not open %s for reading: %s", a1, v11);
    goto LABEL_11;
  }
  if (a2)
  {
    if (!create_new_header_for_hiding(v8, &v21, &v20, a3))
      goto LABEL_12;
LABEL_11:
    v12 = 0xFFFFFFFFLL;
    goto LABEL_23;
  }
  if (a3)
    syslog(4, "allow_reorder not allowed for unhiding");
  if (create_new_header_for_unhiding(v9, &v21, &v20))
    goto LABEL_11;
LABEL_12:
  if (v20)
  {
    close(v9);
    v13 = open(a1, 258);
    v9 = v13;
    if (v13 == -1)
    {
      v17 = __error();
      strerror(*v17);
      syslog(3, "Could not open %s for writing: %s");
    }
    else
    {
      v14 = v20;
      v15 = pwrite(v13, v21, v20, 0);
      v16 = v15;
      if (v15 != v14 && v15 != -1)
        *__error() = 5;
      if (v16 == v14)
      {
        if (a4)
        {
          v12 = 0;
          *a4 = 1;
          goto LABEL_23;
        }
      }
      else
      {
        v18 = __error();
        strerror(*v18);
        syslog(3, "Could not write new header to executable: %s");
      }
    }
  }
  v12 = 0;
LABEL_23:
  if (v21)
    free(v21);
  if (v9 != -1)
    close(v9);
  return v12;
}

uint64_t unhide_archs_if_needed(char *a1, _BYTE *a2)
{
  return swizzle_archs_if_needed(a1, 0, 0, a2);
}

BOOL read_or_error(int a1, void *a2, size_t a3, off_t a4)
{
  ssize_t v5;
  ssize_t v6;

  v5 = pread(a1, a2, a3, a4);
  v6 = v5;
  if (v5 != a3 && v5 != -1)
    *__error() = 5;
  return v6 == a3;
}

BOOL read_fat_arch(int a1, int a2, fat_arch *a3)
{
  _BOOL8 v4;

  v4 = read_or_error(a1, a3, 0x14uLL, 20 * a2 + 8);
  if (v4)
    swap_fat_arch(a3, 1u, NX_LittleEndian);
  return v4;
}

BOOL slice_pread(int a1, void *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if ((a4 & 0x8000000000000000) == 0 && (uint64_t)(a4 + a3) <= a6 + a5)
    return read_or_error(a1, a2, a3, a5 + a4);
  *__error() = 34;
  return 0;
}

void read_next_manifest_command_cold_1()
{
  __assert_rtn("read_bytes", "delta_update.c", 105, "stream->currentStreamOffset < stream->streamLength");
}

void read_string_to_terminator_cold_1()
{
  __assert_rtn("read_string_to_terminator", "delta_update.c", 121, "stream->currentStreamOffset < stream->streamLength");
}

void MIFetchInfoForUsername_cold_1(_QWORD *a1, _OWORD *a2)
{
  int v4;

  v4 = *__error();
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_2();
  strerror(v4);
  OUTLINED_FUNCTION_1();
  _os_crash_msg();
  __break(1u);
}

void MIFetchInfoForUsername_cold_2(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  _os_crash_msg();
  __break(1u);
}

void MIAssumeIdentity_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_222ED3000, MEMORY[0x24BDACB70], a3, "%s: Attempting to assume an identity of 0/0, which should be the default for the helper service", a5, a6, a7, a8, 2u);
}

void MIRestoreIdentity_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_222ED3000, MEMORY[0x24BDACB70], a3, "%s: Attempting to restore an identity without having first assumed an identity", a5, a6, a7, a8, 2u);
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x24BE0FA58]();
}

uint64_t BOMCopierCountFilesInArchive()
{
  return MEMORY[0x24BE0FA60]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x24BE0FA68]();
}

uint64_t BOMCopierNewWithSys()
{
  return MEMORY[0x24BE0FA78]();
}

uint64_t BOMCopierSetCopyFileFinishedHandler()
{
  return MEMORY[0x24BE0FA80]();
}

uint64_t BOMCopierSetCopyFileUpdateHandler()
{
  return MEMORY[0x24BE0FA88]();
}

uint64_t BOMCopierSetFatalErrorHandler()
{
  return MEMORY[0x24BE0FA90]();
}

uint64_t BOMCopierSetFatalFileErrorHandler()
{
  return MEMORY[0x24BE0FA98]();
}

uint64_t BOMCopierSetFileErrorHandler()
{
  return MEMORY[0x24BE0FAA0]();
}

uint64_t BOMCopierSetUserData()
{
  return MEMORY[0x24BE0FAA8]();
}

uint64_t BOMCopierUserData()
{
  return MEMORY[0x24BE0FAB0]();
}

int BZ2_bzRead(int *bzerror, BZFILE *b, void *buf, int len)
{
  return MEMORY[0x24BEDA958](bzerror, b, buf, *(_QWORD *)&len);
}

void BZ2_bzReadClose(int *bzerror, BZFILE *b)
{
  MEMORY[0x24BEDA960](bzerror, b);
}

BZFILE *__cdecl BZ2_bzReadOpen(int *bzerror, FILE *f, int verbosity, int small, void *unused, int nUnused)
{
  return (BZFILE *)MEMORY[0x24BEDA968](bzerror, f, *(_QWORD *)&verbosity, *(_QWORD *)&small, unused, *(_QWORD *)&nUnused);
}

uint64_t BomSys_free()
{
  return MEMORY[0x24BE0FAB8]();
}

uint64_t BomSys_init()
{
  return MEMORY[0x24BE0FAC0]();
}

uint64_t BomSys_set_open()
{
  return MEMORY[0x24BE0FAC8]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC360](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC368](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC370](c, data, *(_QWORD *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB7E8](theArray, range.location, range.length, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBAC8](bundle);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x24BDBBC80](type_id);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x24BDBBE88](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x24BDBC510](alloc, theString, separatorString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x24BDBC5A0](alloc, formatOptions, format, arguments);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x24BDBC640](string, buffer, maxBufLen);
}

uint64_t MOLogWrite()
{
  return MEMORY[0x24BE67718]();
}

void *__cdecl NSHashGet(NSHashTable *table, const void *pointer)
{
  return (void *)MEMORY[0x24BDD0DB8](table, pointer);
}

void NSHashInsertKnownAbsent(NSHashTable *table, const void *pointer)
{
  MEMORY[0x24BDD0DC8](table, pointer);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t SZArchiverCreateStreamableZip()
{
  return MEMORY[0x24BEB2CA0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCopyInfoPlistURL()
{
  return MEMORY[0x24BDBCF70]();
}

uint64_t _CFBundleCreateFilteredInfoPlist()
{
  return MEMORY[0x24BDBCF78]();
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x24BDBCF80]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x24BDBCFB0]();
}

uint64_t _CFCopySystemVersionDictionaryValue()
{
  return MEMORY[0x24BDBCFB8]();
}

uint64_t _CFPropertyListCreateFiltered()
{
  return MEMORY[0x24BDBD090]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x24BDACB58]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

ssize_t acl_copy_ext_native(void *buf_p, acl_t acl, ssize_t size)
{
  return MEMORY[0x24BDAD050](buf_p, acl, size);
}

int acl_free(void *obj_p)
{
  return MEMORY[0x24BDAD060](obj_p);
}

acl_t acl_get_file(const char *path_p, acl_type_t type)
{
  return (acl_t)MEMORY[0x24BDAD080](path_p, *(_QWORD *)&type);
}

acl_t acl_init(int count)
{
  return (acl_t)MEMORY[0x24BDAD0B8](*(_QWORD *)&count);
}

int acl_set_fd(int fd, acl_t acl)
{
  return MEMORY[0x24BDAD0C0](*(_QWORD *)&fd, acl);
}

ssize_t acl_size(acl_t acl)
{
  return MEMORY[0x24BDAD0F8](acl);
}

char *__cdecl acl_to_text(acl_t acl, ssize_t *len_p)
{
  return (char *)MEMORY[0x24BDAD100](acl, len_p);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAD990](a1, a2);
}

int clonefile(const char *a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x24BDAD9C8](a1, a2, *(_QWORD *)&a3);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x24BDAD9F0](a1);
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x24BDADA88]();
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x24BDADBB8](from, to, state, *(_QWORD *)&flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return (copyfile_state_t)MEMORY[0x24BDADBC0]();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return MEMORY[0x24BDADBC8](a1);
}

int copyfile_state_set(copyfile_state_t s, uint32_t flag, const void *src)
{
  return MEMORY[0x24BDADBD8](s, *(_QWORD *)&flag, src);
}

int dirfd(DIR *dirp)
{
  return MEMORY[0x24BDADC38](dirp);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x24BDAE2B8](*(_QWORD *)&a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return MEMORY[0x24BDAE2F0](*(_QWORD *)&from_fd, *(_QWORD *)&to_fd, a3, *(_QWORD *)&flags);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x24BDAE358](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x24BDAE360](*(_QWORD *)&a1, a2, a3, a4, *(_QWORD *)&a5);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE388](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return MEMORY[0x24BDAE3A8](*(_QWORD *)&fd, namebuff, size, *(_QWORD *)&options);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x24BDAE478](*(_QWORD *)&fd, name, *(_QWORD *)&options);
}

int fsetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x24BDAE4E8](*(_QWORD *)&a1, a2, a3, a4, *(_QWORD *)&a5);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE4F8](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x24BDAE550](a1);
}

FTS *__cdecl fts_open_b(char *const *a1, int a2, void *a3)
{
  return (FTS *)MEMORY[0x24BDAE560](a1, *(_QWORD *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x24BDAE568](a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return MEMORY[0x24BDAE570](a1, a2, *(_QWORD *)&a3);
}

FILE *__cdecl funopen(const void *a1, int (__cdecl *a2)(void *, char *, int), int (__cdecl *a3)(void *, const char *, int), fpos_t (__cdecl *a4)(void *, fpos_t, int), int (__cdecl *a5)(void *))
{
  return (FILE *)MEMORY[0x24BDAE580](a1, a2, a3, a4, a5);
}

int futimes(int a1, const timeval *a2)
{
  return MEMORY[0x24BDAE588](*(_QWORD *)&a1, a2);
}

int getattrlistbulk(int a1, void *a2, void *a3, size_t a4, uint64_t a5)
{
  return MEMORY[0x24BDAE5B8](*(_QWORD *)&a1, a2, a3, a4, a5);
}

uid_t geteuid(void)
{
  return MEMORY[0x24BDAE5F8]();
}

gid_t getgid(void)
{
  return MEMORY[0x24BDAE610]();
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x24BDAE718](a1, a2, a3, a4, a5);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x24BDAE728](*(_QWORD *)&a1, a2, a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x24BDAE788]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE798](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int initgroups(const char *a1, int a2)
{
  return MEMORY[0x24BDAE8C0](a1, *(_QWORD *)&a2);
}

int lchmod(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEA20](a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x24BDAEA28](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int link(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAEA70](a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAEB28](a1, a2);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x24BDAED00](a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x24BDAEF38](a1);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x24BDAEF60](path, omode);
}

int mkstemp(char *a1)
{
  return MEMORY[0x24BDAEF70](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x24BDAF258](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAF698](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

uint64_t proc_disable_cpumon()
{
  return MEMORY[0x24BDAF6B8]();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF708](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

uint64_t proc_set_cpumon_defaults()
{
  return MEMORY[0x24BDAF730]();
}

int pthread_setugid_np(uid_t a1, gid_t a2)
{
  return MEMORY[0x24BDAF9B0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAFA00](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x24BDAFA98](a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x24BDAFAC0](a1, a2);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x24BDAFB40](path, state, *(_QWORD *)&flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return (removefile_state_t)MEMORY[0x24BDAFB48]();
}

int removefile_state_free(removefile_state_t a1)
{
  return MEMORY[0x24BDAFB50](a1);
}

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  return MEMORY[0x24BDAFB58](state, *(_QWORD *)&key, dst);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return MEMORY[0x24BDAFB60](state, *(_QWORD *)&key, value);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x24BDAFB68](path, name, *(_QWORD *)&options);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x24BDAFB80](__from, __to, __ec);
}

int renameatx_np(int a1, const char *a2, int a3, const char *a4, unsigned int a5)
{
  return MEMORY[0x24BDAFB88](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int rmdir(const char *a1)
{
  return MEMORY[0x24BDAFBB0](a1);
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x24BDAFD00](a1, a2, a3, a4, *(_QWORD *)&a5);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAFD98](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF30](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0010](__str, __endptr, *(_QWORD *)&__base);
}

void swap_fat_arch(fat_arch *fat_archs, uint32_t nfat_arch, NXByteOrder target_byte_order)
{
  MEMORY[0x24BDB0078](fat_archs, *(_QWORD *)&nfat_arch, *(_QWORD *)&target_byte_order);
}

void swap_fat_header(fat_header *fat_header, NXByteOrder target_byte_order)
{
  MEMORY[0x24BDB0080](fat_header, *(_QWORD *)&target_byte_order);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x24BDB0090](a1, a2);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x24BDB00F0](*(_QWORD *)&a1);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

