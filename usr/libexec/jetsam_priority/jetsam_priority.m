void **sub_100001110(void **a1)
{
  void **v3;

  v3 = a1;
  sub_1000090D8(&v3);
  return a1;
}

void **sub_100001144(void **a1)
{
  void **v3;

  v3 = a1;
  sub_100009164(&v3);
  return a1;
}

double sub_100001178(unint64_t a1)
{
  if (qword_100010108 != -1)
    dispatch_once(&qword_100010108, &stru_10000C368);
  return *(double *)&qword_100010100 * (double)a1;
}

void sub_1000011CC(id a1)
{
  mach_timebase_info info;

  mach_timebase_info(&info);
  *(double *)&qword_100010100 = (float)((float)((float)info.numer * 0.000000001) / (float)info.denom);
}

uint64_t start(int a1, char *const *a2)
{
  uint64_t v4;
  char *v5;
  int64_t v6;
  int v7;
  int64_t v8;
  char *v9;
  int v10;
  FILE *v11;
  int *v12;
  char *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  char **v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
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
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
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
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
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
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  BOOL v100;
  char v101;
  char v102;
  char *v103;
  char *v104;
  void *v105;
  int32x4_t v106;
  char *v107;
  char *v108;
  char *v109;
  const char *v110;
  int *v111;
  void *v112;
  unint64_t v113;
  const void **v114;
  _QWORD *v115;
  const void **v116;
  double v117;
  double v118;
  _BOOL4 v119;
  uint64_t v120;
  uint64_t v121;
  double v122;
  const char *v123;
  std::string *v124;
  const void **v125;
  char *v126;
  int v127;
  _DWORD *v128;
  unint64_t v129;
  _DWORD *v130;
  int v131;
  unsigned int v132;
  unint64_t v133;
  uint64_t v134;
  uint64_t v135;
  _DWORD *v136;
  int v137;
  char *v138;
  char *v139;
  char *v140;
  const char *v141;
  char *v142;
  void *v143;
  id v144;
  unsigned int v145;
  id v146;
  id v147;
  uint64_t v148;
  void *i;
  const char *v150;
  char *v151;
  int v152;
  int *v153;
  char *v154;
  int v155;
  FILE *v156;
  char *v157;
  unint64_t v158;
  std::string::size_type size;
  BOOL v160;
  std::string::size_type v161;
  id v162;
  id v163;
  uint64_t v164;
  unint64_t v165;
  void *v166;
  uint64_t v167;
  __int128 *v168;
  __int128 v169;
  uint64_t v170;
  __int128 *v171;
  NSString *v172;
  uint64_t *v173;
  double v174;
  float v175;
  uint64_t *v176;
  uint64_t v177;
  unsigned int v178;
  uint64_t v179;
  uint64_t v180;
  int v181;
  uint64_t v182;
  unint64_t v183;
  unint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  unint64_t v188;
  uint64_t *v189;
  unint64_t v190;
  uint64_t v191;
  uint64_t v192;
  _DWORD *v193;
  unint64_t v194;
  unint64_t v195;
  _DWORD *v196;
  int v197;
  uint64_t v198;
  uint64_t v199;
  int v200;
  char *v201;
  size_t v202;
  const char *v203;
  int v204;
  uint64_t v205;
  uint64_t v206;
  const char *v207;
  __int128 v208;
  int v209;
  __int128 *p_buffer;
  uint64_t *v211;
  const void ***v212;
  uint64_t v213;
  unint64_t v214;
  uint64_t v215;
  unint64_t v216;
  uint64_t *v217;
  uint64_t v218;
  uint64_t v219;
  unint64_t v220;
  int v221;
  uint64_t v222;
  unint64_t v223;
  char *v224;
  uint64_t v225;
  size_t v226;
  const char *v227;
  const void **v228;
  int v229;
  const char *v230;
  uint64_t **v231;
  uint64_t *v232;
  uint64_t *v233;
  __int128 *v234;
  int v235;
  FILE *v237;
  int *v238;
  char *v239;
  uint64_t v240;
  unint64_t v241;
  int v242;
  unsigned int v243;
  unint64_t v244;
  char *ptr;
  int ptra;
  uint64_t *v247;
  _QWORD *v248;
  std::string __dst;
  void *v250[2];
  char v251;
  std::string v252;
  void *v253[2];
  char v254;
  void *v255[2];
  char v256;
  void *v257[2];
  char v258;
  void *v259[2];
  char v260;
  void *v261[2];
  char v262;
  void *v263[2];
  char v264;
  void *v265[2];
  char v266;
  void *v267[2];
  char v268;
  void *v269[2];
  char v270;
  void *v271[2];
  char v272;
  void *v273[2];
  char v274;
  void *v275[2];
  char v276;
  void *v277[2];
  char v278;
  void *v279[2];
  char v280;
  void *v281[2];
  char v282;
  void *v283[2];
  char v284;
  void *v285[2];
  char v286;
  void *v287[2];
  char v288;
  void *v289[2];
  char v290;
  unint64_t v291[5];
  void *v292[2];
  char v293;
  const void *v294[2];
  char v295;
  void *v296[2];
  char v297;
  void *v298[2];
  char v299;
  const void *v300[2];
  char v301;
  void *v302[2];
  char v303;
  void *v304[2];
  char v305;
  void *v306[2];
  char v307;
  void *v308[2];
  char v309;
  void *v310[2];
  char v311;
  void *v312[2];
  char v313;
  void *v314[2];
  char v315;
  void *v316[2];
  char v317;
  const void *v318[2];
  char v319;
  void *v320[2];
  char v321;
  void *v322[2];
  char v323;
  void *v324[2];
  char v325;
  const void *v326[2];
  char v327;
  void *v328[2];
  char v329;
  void *v330[2];
  char v331;
  void *v332[2];
  char v333;
  void *v334[2];
  char v335;
  void *v336[2];
  char v337;
  void *v338[2];
  char v339;
  void *v340[2];
  char v341;
  void *v342[2];
  char v343;
  void *v344[2];
  char v345;
  void *v346[2];
  char v347;
  void *v348[2];
  char v349;
  void *v350[2];
  char v351;
  const void *v352[2];
  char v353;
  const void *v354[2];
  char v355;
  void *v356[2];
  char v357;
  void *v358[2];
  char v359;
  void *v360[2];
  char v361;
  void *v362[2];
  char v363;
  void *v364[2];
  char v365;
  void *v366[2];
  char v367;
  void *v368[2];
  char v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  void *v373;
  uint64_t *v374;
  _QWORD v375[2];
  __int128 v376;
  uint64_t v377;
  __int128 v378;
  uint64_t v379;
  __int128 v380;
  uint64_t v381;
  __int128 v382;
  uint64_t v383;
  __int128 v384;
  uint64_t v385;
  __int128 v386;
  uint64_t v387;
  __int128 v388;
  uint64_t v389;
  __int128 v390;
  uint64_t v391;
  __int128 v392;
  uint64_t v393;
  __int128 v394;
  uint64_t v395;
  __int128 v396;
  uint64_t v397;
  __int128 v398;
  uint64_t v399;
  __int128 v400;
  uint64_t v401;
  __int128 v402;
  uint64_t v403;
  __int128 v404;
  uint64_t v405;
  __int128 v406;
  uint64_t v407;
  __int128 v408;
  uint64_t v409;
  __int128 v410;
  uint64_t v411;
  __int128 v412;
  uint64_t v413;
  __int128 v414;
  uint64_t v415;
  __int128 v416;
  uint64_t v417;
  __int128 v418;
  uint64_t v419;
  __int128 v420;
  uint64_t v421;
  __int128 v422;
  uint64_t v423;
  __int128 v424;
  uint64_t v425;
  __int128 v426;
  uint64_t v427;
  __int128 v428;
  uint64_t v429;
  __int128 v430;
  uint64_t v431;
  __int128 v432;
  uint64_t v433;
  __int128 v434;
  uint64_t v435;
  __int128 v436;
  uint64_t v437;
  __int128 v438;
  uint64_t v439;
  __int128 v440;
  uint64_t v441;
  __int128 v442;
  uint64_t v443;
  __int128 v444;
  uint64_t v445;
  __int128 v446;
  uint64_t v447;
  __int128 v448;
  uint64_t v449;
  __int128 v450;
  uint64_t v451;
  __int128 __src;
  uint64_t v453;
  __int128 v454;
  __int128 v455;
  __int128 v456;
  __int128 v457;
  __int128 buffer;
  uint64_t (*v459)(uint64_t, uint64_t, uint64_t);
  void *v460;
  __int128 v461;
  uint64_t v462;
  uint64_t v463;
  unint64_t v464;
  unint64_t v465;
  unint64_t v466;
  unint64_t v467;
  _QWORD v468[5];
  void *v469;
  __int128 v470;
  uint64_t v471;
  uint64_t v472[33];
  void *__p[2];
  uint64_t v474;
  uint64_t v475;

  while (2)
  {
    v4 = getopt(a1, a2, ":khcelifs:w:rxp:z::");
    if ((int)v4 > 98)
    {
      switch((int)v4)
      {
        case 'c':
          byte_100010118 = 1;
          byte_100010119 = 1;
          if (byte_100010080)
            byte_100010115 = 1;
          goto LABEL_19;
        case 'e':
          if (byte_100010080)
          {
            byte_100010114 = 1;
            byte_100010111 = 1;
            byte_100010115 = 1;
            byte_100010113 = 1;
            byte_100010117 = 1;
          }
LABEL_19:
          byte_100010116 = 1;
          continue;
        case 'f':
          if (byte_100010080)
            byte_100010111 = 1;
          continue;
        case 'h':
          sub_10000670C(0);
        case 'i':
          if (byte_100010080)
            byte_100010113 = 1;
          continue;
        case 'k':
          byte_100010119 = 1;
          continue;
        case 'l':
          if (byte_100010080)
            byte_100010114 = 1;
          continue;
        case 'p':
          dword_100010074 = atoi(optarg);
          continue;
        case 'r':
          byte_100010128 = 1;
          continue;
        case 's':
          v5 = optarg;
          if (!strcmp(optarg, "mem"))
            qword_100010120 = (uint64_t)"footprint";
          else
            qword_100010120 = (uint64_t)v5;
          continue;
        case 'w':
          qword_100010130 = (uint64_t)optarg;
          continue;
        case 'x':
          byte_100010112 = 1;
          continue;
        case 'z':
          if (byte_100010080)
          {
            if (optarg)
              dword_100010070 = atoi(optarg);
            else
              byte_100010110 = 1;
          }
          continue;
        default:
          goto LABEL_943;
      }
    }
    break;
  }
  if ((_DWORD)v4 != -1)
  {
    if ((_DWORD)v4 == 58)
    {
      fprintf(__stderrp, "Error: Missing argument to '%c'\n");
    }
    else
    {
      if ((_DWORD)v4 != 63)
      {
LABEL_943:
        fprintf(__stderrp, "Fatal: Unexpected return value from getopt: '%c'\n", v4);
        sub_10000670C(-1);
      }
      fprintf(__stderrp, "Error: Unrecognized option '%c'\n");
    }
    sub_10000670C(1);
  }
  if (getuid())
  {
    fwrite("Fatal: jetsam_priority must be run as root.\n", 0x2CuLL, 1uLL, __stderrp);
LABEL_937:
    exit(1);
  }
  if ((dword_100010070 & 0x80000000) == 0)
  {
    if (!sub_100005FFC(dword_100010070))
    {
      fprintf(__stderrp, "Reset interval peak for pid %d. Run with -i (or -e) to see the new interval maximum.\n", dword_100010070);
      goto LABEL_952;
    }
LABEL_953:
    exit(71);
  }
  if ((byte_100010110 & 1) != 0)
  {
    if (!sub_100006064())
    {
      fwrite("Reset all interval peaks. Run with -i (or -e) to see the new interval maximum.\n", 0x4FuLL, 1uLL, __stderrp);
LABEL_952:
      exit(0);
    }
    goto LABEL_953;
  }
  ptr = 0;
  v6 = 0;
  while (1)
  {
    while (1)
    {
      v7 = memorystatus_control(1, 0, 0, 0, 0);
      if (v7 > 0)
        break;
      if (*__error() != 4)
      {
        v237 = __stderrp;
        v238 = __error();
        v239 = strerror(*v238);
        fprintf(v237, "Error: Could not get priorityListSize: %s\n", v239);
        goto LABEL_937;
      }
    }
    v8 = v7 + 96;
    if (v8 <= v6)
    {
      v9 = ptr;
    }
    else
    {
      v9 = (char *)malloc_type_realloc(ptr, v8, 0x47477279uLL);
      v6 = v8;
    }
    ptr = v9;
    v10 = memorystatus_control(1, 0, 0, v9, v6);
    if (v10 > 0)
      break;
    if (*__error() != 22 && *__error() != 4)
    {
      v11 = __stderrp;
      v12 = __error();
      v13 = strerror(*v12);
      fprintf(v11, "Error: Could not get jetsam priority list: %s\n", v13);
      free(ptr);
      goto LABEL_937;
    }
  }
  v14 = v10;
  v240 = objc_opt_class(RBSProcessHandle);
  sub_1000091DC(&__src, "priority");
  if (SHIBYTE(v453) < 0)
  {
    sub_10000904C(__p, (void *)__src, *((unint64_t *)&__src + 1));
  }
  else
  {
    *(_OWORD *)__p = __src;
    v474 = v453;
  }
  v475 = 0x100000001;
  v15 = qword_100010090;
  if ((unint64_t)qword_100010090 >= unk_100010098)
  {
    v16 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
  }
  else
  {
    sub_10000928C(&qword_100010088, (__int128 *)__p);
    v16 = v15 + 32;
  }
  v17 = &selRef_assertions;
  qword_100010090 = v16;
  if (SHIBYTE(v474) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v453) < 0)
    operator delete((void *)__src);
  sub_1000091DC(&v450, "priority_name");
  if (SHIBYTE(v451) < 0)
  {
    sub_10000904C(__p, (void *)v450, *((unint64_t *)&v450 + 1));
  }
  else
  {
    *(_OWORD *)__p = v450;
    v474 = v451;
  }
  v475 = 0x200000000;
  v18 = qword_100010090;
  if ((unint64_t)qword_100010090 >= unk_100010098)
  {
    v19 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
  }
  else
  {
    sub_10000928C(&qword_100010088, (__int128 *)__p);
    v19 = v18 + 32;
  }
  qword_100010090 = v19;
  if (SHIBYTE(v474) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v451) < 0)
    operator delete((void *)v450);
  sub_1000091DC(&v448, "fds");
  if (SHIBYTE(v449) < 0)
  {
    sub_10000904C(__p, (void *)v448, *((unint64_t *)&v448 + 1));
  }
  else
  {
    *(_OWORD *)__p = v448;
    v474 = v449;
  }
  v475 = 0;
  v20 = qword_100010090;
  if ((unint64_t)qword_100010090 >= unk_100010098)
  {
    v21 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
  }
  else
  {
    sub_10000928C(&qword_100010088, (__int128 *)__p);
    v21 = v20 + 32;
  }
  qword_100010090 = v21;
  if (SHIBYTE(v474) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v449) < 0)
    operator delete((void *)v448);
  if (byte_100010111 == 1)
  {
    sub_1000091DC(&v446, "internal");
    if (SHIBYTE(v447) < 0)
    {
      sub_10000904C(__p, (void *)v446, *((unint64_t *)&v446 + 1));
    }
    else
    {
      *(_OWORD *)__p = v446;
      v474 = v447;
    }
    v475 = 2;
    v22 = qword_100010090;
    if ((unint64_t)qword_100010090 >= unk_100010098)
    {
      v23 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
    }
    else
    {
      sub_10000928C(&qword_100010088, (__int128 *)__p);
      v23 = v22 + 32;
    }
    qword_100010090 = v23;
    if (SHIBYTE(v474) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v447) < 0)
      operator delete((void *)v446);
    sub_1000091DC(&v444, "internal_comp");
    if (SHIBYTE(v445) < 0)
    {
      sub_10000904C(__p, (void *)v444, *((unint64_t *)&v444 + 1));
    }
    else
    {
      *(_OWORD *)__p = v444;
      v474 = v445;
    }
    v475 = 2;
    v24 = qword_100010090;
    if ((unint64_t)qword_100010090 >= unk_100010098)
    {
      v25 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
    }
    else
    {
      sub_10000928C(&qword_100010088, (__int128 *)__p);
      v25 = v24 + 32;
    }
    qword_100010090 = v25;
    if (SHIBYTE(v474) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v445) < 0)
      operator delete((void *)v444);
    sub_1000091DC(&v442, "iokit_mapped");
    if (SHIBYTE(v443) < 0)
    {
      sub_10000904C(__p, (void *)v442, *((unint64_t *)&v442 + 1));
    }
    else
    {
      *(_OWORD *)__p = v442;
      v474 = v443;
    }
    v475 = 2;
    v26 = qword_100010090;
    if ((unint64_t)qword_100010090 >= unk_100010098)
    {
      v27 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
    }
    else
    {
      sub_10000928C(&qword_100010088, (__int128 *)__p);
      v27 = v26 + 32;
    }
    qword_100010090 = v27;
    if (SHIBYTE(v474) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v443) < 0)
      operator delete((void *)v442);
    sub_1000091DC(&v440, "purge_nonvol");
    if (SHIBYTE(v441) < 0)
    {
      sub_10000904C(__p, (void *)v440, *((unint64_t *)&v440 + 1));
    }
    else
    {
      *(_OWORD *)__p = v440;
      v474 = v441;
    }
    v475 = 2;
    v28 = qword_100010090;
    if ((unint64_t)qword_100010090 >= unk_100010098)
    {
      v29 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
    }
    else
    {
      sub_10000928C(&qword_100010088, (__int128 *)__p);
      v29 = v28 + 32;
    }
    qword_100010090 = v29;
    if (SHIBYTE(v474) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v441) < 0)
      operator delete((void *)v440);
    sub_1000091DC(&v438, "purge_nonvol_comp");
    if (SHIBYTE(v439) < 0)
    {
      sub_10000904C(__p, (void *)v438, *((unint64_t *)&v438 + 1));
    }
    else
    {
      *(_OWORD *)__p = v438;
      v474 = v439;
    }
    v475 = 2;
    v30 = qword_100010090;
    if ((unint64_t)qword_100010090 >= unk_100010098)
    {
      v31 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
    }
    else
    {
      sub_10000928C(&qword_100010088, (__int128 *)__p);
      v31 = v30 + 32;
    }
    qword_100010090 = v31;
    if (SHIBYTE(v474) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v439) < 0)
      operator delete((void *)v438);
    sub_1000091DC(&v436, "alt_acct");
    if (SHIBYTE(v437) < 0)
    {
      sub_10000904C(__p, (void *)v436, *((unint64_t *)&v436 + 1));
    }
    else
    {
      *(_OWORD *)__p = v436;
      v474 = v437;
    }
    v475 = 2;
    v32 = qword_100010090;
    if ((unint64_t)qword_100010090 >= unk_100010098)
    {
      v33 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
    }
    else
    {
      sub_10000928C(&qword_100010088, (__int128 *)__p);
      v33 = v32 + 32;
    }
    qword_100010090 = v33;
    if (SHIBYTE(v474) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v437) < 0)
      operator delete((void *)v436);
    sub_1000091DC(&v434, "alt_acct_comp");
    if (SHIBYTE(v435) < 0)
    {
      sub_10000904C(__p, (void *)v434, *((unint64_t *)&v434 + 1));
    }
    else
    {
      *(_OWORD *)__p = v434;
      v474 = v435;
    }
    v475 = 2;
    v34 = qword_100010090;
    if ((unint64_t)qword_100010090 >= unk_100010098)
    {
      v35 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
    }
    else
    {
      sub_10000928C(&qword_100010088, (__int128 *)__p);
      v35 = v34 + 32;
    }
    v17 = &selRef_assertions;
    qword_100010090 = v35;
    if (SHIBYTE(v474) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v435) < 0)
      operator delete((void *)v434);
    if ((byte_100010112 & 1) == 0)
    {
      sub_1000091DC(&v432, "page_table");
      if (SHIBYTE(v433) < 0)
      {
        sub_10000904C(__p, (void *)v432, *((unint64_t *)&v432 + 1));
      }
      else
      {
        *(_OWORD *)__p = v432;
        v474 = v433;
      }
      v475 = 2;
      v36 = qword_100010090;
      if ((unint64_t)qword_100010090 >= unk_100010098)
      {
        v37 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
      }
      else
      {
        sub_10000928C(&qword_100010088, (__int128 *)__p);
        v37 = v36 + 32;
      }
      v17 = &selRef_assertions;
      qword_100010090 = v37;
      if (SHIBYTE(v474) < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v433) < 0)
        operator delete((void *)v432);
    }
  }
  sub_1000091DC(&v430, "footprint");
  if (SHIBYTE(v431) < 0)
  {
    sub_10000904C(__p, (void *)v430, *((unint64_t *)&v430 + 1));
  }
  else
  {
    *(_OWORD *)__p = v430;
    v474 = v431;
  }
  v475 = 2;
  v38 = qword_100010090;
  if ((unint64_t)qword_100010090 >= unk_100010098)
  {
    v39 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
  }
  else
  {
    sub_10000928C(&qword_100010088, (__int128 *)__p);
    v39 = v38 + 32;
  }
  qword_100010090 = v39;
  if (SHIBYTE(v474) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v431) < 0)
    operator delete((void *)v430);
  sub_1000091DC(&v428, "footprint_peak");
  if (SHIBYTE(v429) < 0)
  {
    sub_10000904C(__p, (void *)v428, *((unint64_t *)&v428 + 1));
  }
  else
  {
    *(_OWORD *)__p = v428;
    v474 = v429;
  }
  v475 = 2;
  v40 = qword_100010090;
  if ((unint64_t)qword_100010090 >= unk_100010098)
  {
    v41 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
  }
  else
  {
    sub_10000928C(&qword_100010088, (__int128 *)__p);
    v41 = v40 + 32;
  }
  qword_100010090 = v41;
  if (SHIBYTE(v474) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v429) < 0)
    operator delete((void *)v428);
  if (byte_100010113 == 1)
  {
    sub_1000091DC(&v426, "footprint_interval_peak");
    if (SHIBYTE(v427) < 0)
    {
      sub_10000904C(__p, (void *)v426, *((unint64_t *)&v426 + 1));
    }
    else
    {
      *(_OWORD *)__p = v426;
      v474 = v427;
    }
    v475 = 2;
    v42 = qword_100010090;
    if ((unint64_t)qword_100010090 >= unk_100010098)
    {
      v43 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
    }
    else
    {
      sub_10000928C(&qword_100010088, (__int128 *)__p);
      v43 = v42 + 32;
    }
    qword_100010090 = v43;
    if (SHIBYTE(v474) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v427) < 0)
      operator delete((void *)v426);
  }
  if (byte_100010080)
  {
    sub_1000091DC(&v424, "limit");
    if (SHIBYTE(v425) < 0)
    {
      sub_10000904C(__p, (void *)v424, *((unint64_t *)&v424 + 1));
    }
    else
    {
      *(_OWORD *)__p = v424;
      v474 = v425;
    }
    v475 = 2;
    v44 = qword_100010090;
    if ((unint64_t)qword_100010090 >= unk_100010098)
    {
      v45 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
    }
    else
    {
      sub_10000928C(&qword_100010088, (__int128 *)__p);
      v45 = v44 + 32;
    }
    qword_100010090 = v45;
    if (SHIBYTE(v474) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v425) < 0)
      operator delete((void *)v424);
    if (byte_100010114 == 1)
    {
      sub_1000091DC(&v422, "active_limit");
      if (SHIBYTE(v423) < 0)
      {
        sub_10000904C(__p, (void *)v422, *((unint64_t *)&v422 + 1));
      }
      else
      {
        *(_OWORD *)__p = v422;
        v474 = v423;
      }
      v475 = 0x100000002;
      v46 = qword_100010090;
      if ((unint64_t)qword_100010090 >= unk_100010098)
      {
        v47 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
      }
      else
      {
        sub_10000928C(&qword_100010088, (__int128 *)__p);
        v47 = v46 + 32;
      }
      qword_100010090 = v47;
      if (SHIBYTE(v474) < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v423) < 0)
        operator delete((void *)v422);
      sub_1000091DC(&v420, "active_limit_hard");
      if (SHIBYTE(v421) < 0)
      {
        sub_10000904C(__p, (void *)v420, *((unint64_t *)&v420 + 1));
      }
      else
      {
        *(_OWORD *)__p = v420;
        v474 = v421;
      }
      v475 = 2;
      v48 = qword_100010090;
      if ((unint64_t)qword_100010090 >= unk_100010098)
      {
        v49 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
      }
      else
      {
        sub_10000928C(&qword_100010088, (__int128 *)__p);
        v49 = v48 + 32;
      }
      qword_100010090 = v49;
      if (SHIBYTE(v474) < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v421) < 0)
        operator delete((void *)v420);
      sub_1000091DC(&v418, "inactive_limit");
      if (SHIBYTE(v419) < 0)
      {
        sub_10000904C(__p, (void *)v418, *((unint64_t *)&v418 + 1));
      }
      else
      {
        *(_OWORD *)__p = v418;
        v474 = v419;
      }
      v475 = 0x100000002;
      v50 = qword_100010090;
      if ((unint64_t)qword_100010090 >= unk_100010098)
      {
        v51 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
      }
      else
      {
        sub_10000928C(&qword_100010088, (__int128 *)__p);
        v51 = v50 + 32;
      }
      qword_100010090 = v51;
      if (SHIBYTE(v474) < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v419) < 0)
        operator delete((void *)v418);
      sub_1000091DC(&v416, "inactive_limit_hard");
      if (SHIBYTE(v417) < 0)
      {
        sub_10000904C(__p, (void *)v416, *((unint64_t *)&v416 + 1));
      }
      else
      {
        *(_OWORD *)__p = v416;
        v474 = v417;
      }
      v475 = 2;
      v52 = qword_100010090;
      if ((unint64_t)qword_100010090 >= unk_100010098)
      {
        v53 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
      }
      else
      {
        sub_10000928C(&qword_100010088, (__int128 *)__p);
        v53 = v52 + 32;
      }
      qword_100010090 = v53;
      if (SHIBYTE(v474) < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v417) < 0)
        operator delete((void *)v416);
    }
    sub_1000091DC(&v414, "root_limit_increase");
    if (SHIBYTE(v415) < 0)
    {
      sub_10000904C(__p, (void *)v414, *((unint64_t *)&v414 + 1));
    }
    else
    {
      *(_OWORD *)__p = v414;
      v474 = v415;
    }
    v475 = 2;
    v54 = qword_100010090;
    if ((unint64_t)qword_100010090 >= unk_100010098)
    {
      v55 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
    }
    else
    {
      sub_10000928C(&qword_100010088, (__int128 *)__p);
      v55 = v54 + 32;
    }
    qword_100010090 = v55;
    if (SHIBYTE(v474) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v415) < 0)
      operator delete((void *)v414);
  }
  sub_1000091DC(&v412, "dirty");
  if (SHIBYTE(v413) < 0)
  {
    sub_10000904C(__p, (void *)v412, *((unint64_t *)&v412 + 1));
  }
  else
  {
    *(_OWORD *)__p = v412;
    v474 = v413;
  }
  v475 = 0x400000000;
  v56 = qword_100010090;
  if ((unint64_t)qword_100010090 >= unk_100010098)
  {
    v57 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
  }
  else
  {
    sub_10000928C(&qword_100010088, (__int128 *)__p);
    v57 = v56 + 32;
  }
  qword_100010090 = v57;
  if (SHIBYTE(v474) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v413) < 0)
    operator delete((void *)v412);
  sub_1000091DC(&v410, "PE");
  if (SHIBYTE(v411) < 0)
  {
    sub_10000904C(__p, (void *)v410, *((unint64_t *)&v410 + 1));
  }
  else
  {
    *(_OWORD *)__p = v410;
    v474 = v411;
  }
  v475 = 0x400000000;
  v58 = qword_100010090;
  if ((unint64_t)qword_100010090 >= unk_100010098)
  {
    v59 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
  }
  else
  {
    sub_10000928C(&qword_100010088, (__int128 *)__p);
    v59 = v58 + 32;
  }
  qword_100010090 = v59;
  if (SHIBYTE(v474) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v411) < 0)
    operator delete((void *)v410);
  sub_1000091DC(&v408, "frozen");
  if (SHIBYTE(v409) < 0)
  {
    sub_10000904C(__p, (void *)v408, *((unint64_t *)&v408 + 1));
  }
  else
  {
    *(_OWORD *)__p = v408;
    v474 = v409;
  }
  v475 = 0x400000000;
  v60 = qword_100010090;
  if ((unint64_t)qword_100010090 >= unk_100010098)
  {
    v61 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
  }
  else
  {
    sub_10000928C(&qword_100010088, (__int128 *)__p);
    v61 = v60 + 32;
  }
  qword_100010090 = v61;
  if (SHIBYTE(v474) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v409) < 0)
    operator delete((void *)v408);
  if (v240)
  {
    sub_1000091DC(&v406, "docked");
    if (SHIBYTE(v407) < 0)
    {
      sub_10000904C(__p, (void *)v406, *((unint64_t *)&v406 + 1));
    }
    else
    {
      *(_OWORD *)__p = v406;
      v474 = v407;
    }
    v475 = 0x400000000;
    v62 = qword_100010090;
    if ((unint64_t)qword_100010090 >= unk_100010098)
    {
      v63 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
    }
    else
    {
      sub_10000928C(&qword_100010088, (__int128 *)__p);
      v63 = v62 + 32;
    }
    qword_100010090 = v63;
    if (SHIBYTE(v474) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v407) < 0)
      operator delete((void *)v406);
  }
  sub_1000091DC(&v404, "swappable");
  if (SHIBYTE(v405) < 0)
  {
    sub_10000904C(__p, (void *)v404, *((unint64_t *)&v404 + 1));
  }
  else
  {
    *(_OWORD *)__p = v404;
    v474 = v405;
  }
  v475 = 0x400000000;
  v64 = qword_100010090;
  if ((unint64_t)qword_100010090 >= unk_100010098)
  {
    v65 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
  }
  else
  {
    sub_10000928C(&qword_100010088, (__int128 *)__p);
    v65 = v64 + 32;
  }
  qword_100010090 = v65;
  if (SHIBYTE(v474) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v405) < 0)
    operator delete((void *)v404);
  sub_1000091DC(&v402, "coalition");
  if (SHIBYTE(v403) < 0)
  {
    sub_10000904C(__p, (void *)v402, *((unint64_t *)&v402 + 1));
  }
  else
  {
    *(_OWORD *)__p = v402;
    v474 = v403;
  }
  v475 = 1;
  v66 = qword_100010090;
  if ((unint64_t)qword_100010090 >= unk_100010098)
  {
    v67 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
  }
  else
  {
    sub_10000928C(&qword_100010088, (__int128 *)__p);
    v67 = v66 + 32;
  }
  qword_100010090 = v67;
  if (SHIBYTE(v474) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v403) < 0)
    operator delete((void *)v402);
  sub_1000091DC(&v400, "pid");
  if (SHIBYTE(v401) < 0)
  {
    sub_10000904C(__p, (void *)v400, *((unint64_t *)&v400 + 1));
  }
  else
  {
    *(_OWORD *)__p = v400;
    v474 = v401;
  }
  v475 = 1;
  v68 = qword_100010090;
  if ((unint64_t)qword_100010090 >= unk_100010098)
  {
    v69 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
  }
  else
  {
    sub_10000928C(&qword_100010088, (__int128 *)__p);
    v69 = v68 + 32;
  }
  qword_100010090 = v69;
  if (SHIBYTE(v474) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v401) < 0)
    operator delete((void *)v400);
  sub_1000091DC(&v398, "name");
  if (SHIBYTE(v399) < 0)
  {
    sub_10000904C(__p, (void *)v398, *((unint64_t *)&v398 + 1));
  }
  else
  {
    *(_OWORD *)__p = v398;
    v474 = v399;
  }
  v475 = 0x200000000;
  v70 = qword_100010090;
  if ((unint64_t)qword_100010090 >= unk_100010098)
  {
    v71 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
  }
  else
  {
    sub_10000928C(&qword_100010088, (__int128 *)__p);
    v71 = v70 + 32;
  }
  qword_100010090 = v71;
  if (SHIBYTE(v474) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v399) < 0)
    operator delete((void *)v398);
  sub_1000091DC(&v396, "flags");
  if (SHIBYTE(v397) < 0)
  {
    sub_10000904C(__p, (void *)v396, *((unint64_t *)&v396 + 1));
  }
  else
  {
    *(_OWORD *)__p = v396;
    v474 = v397;
  }
  v475 = 0x200000000;
  v72 = qword_100010090;
  if ((unint64_t)qword_100010090 >= unk_100010098)
  {
    v73 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
  }
  else
  {
    sub_10000928C(&qword_100010088, (__int128 *)__p);
    v73 = v72 + 32;
  }
  qword_100010090 = v73;
  if (SHIBYTE(v474) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v397) < 0)
    operator delete((void *)v396);
  if (byte_100010115 == 1)
  {
    sub_1000091DC(&v394, "pages_grabbed");
    if (SHIBYTE(v395) < 0)
    {
      sub_10000904C(__p, (void *)v394, *((unint64_t *)&v394 + 1));
    }
    else
    {
      *(_OWORD *)__p = v394;
      v474 = v395;
    }
    v475 = 1;
    v74 = qword_100010090;
    if ((unint64_t)qword_100010090 >= unk_100010098)
    {
      v75 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
    }
    else
    {
      sub_10000928C(&qword_100010088, (__int128 *)__p);
      v75 = v74 + 32;
    }
    qword_100010090 = v75;
    if (SHIBYTE(v474) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v395) < 0)
      operator delete((void *)v394);
    sub_1000091DC(&v392, "pages_grabbed_kern");
    if (SHIBYTE(v393) < 0)
    {
      sub_10000904C(__p, (void *)v392, *((unint64_t *)&v392 + 1));
    }
    else
    {
      *(_OWORD *)__p = v392;
      v474 = v393;
    }
    v475 = 1;
    v76 = qword_100010090;
    if ((unint64_t)qword_100010090 >= unk_100010098)
    {
      v77 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
    }
    else
    {
      sub_10000928C(&qword_100010088, (__int128 *)__p);
      v77 = v76 + 32;
    }
    qword_100010090 = v77;
    if (SHIBYTE(v474) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v393) < 0)
      operator delete((void *)v392);
    sub_1000091DC(&v390, "pages_grabbed_iopl");
    if (SHIBYTE(v391) < 0)
    {
      sub_10000904C(__p, (void *)v390, *((unint64_t *)&v390 + 1));
    }
    else
    {
      *(_OWORD *)__p = v390;
      v474 = v391;
    }
    v475 = 1;
    v78 = qword_100010090;
    if ((unint64_t)qword_100010090 >= unk_100010098)
    {
      v79 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
    }
    else
    {
      sub_10000928C(&qword_100010088, (__int128 *)__p);
      v79 = v78 + 32;
    }
    qword_100010090 = v79;
    if (SHIBYTE(v474) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v391) < 0)
      operator delete((void *)v390);
    sub_1000091DC(&v388, "pages_grabbed_upl");
    if (SHIBYTE(v389) < 0)
    {
      sub_10000904C(__p, (void *)v388, *((unint64_t *)&v388 + 1));
    }
    else
    {
      *(_OWORD *)__p = v388;
      v474 = v389;
    }
    v475 = 1;
    v80 = qword_100010090;
    if ((unint64_t)qword_100010090 >= unk_100010098)
    {
      v81 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
    }
    else
    {
      sub_10000928C(&qword_100010088, (__int128 *)__p);
      v81 = v80 + 32;
    }
    qword_100010090 = v81;
    if (SHIBYTE(v474) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v389) < 0)
      operator delete((void *)v388);
  }
  if (byte_100010116 == 1)
  {
    sub_1000091DC(&v386, "total_dirty_time");
    if (SHIBYTE(v387) < 0)
    {
      sub_10000904C(__p, (void *)v386, *((unint64_t *)&v386 + 1));
    }
    else
    {
      *(_OWORD *)__p = v386;
      v474 = v387;
    }
    v475 = 1;
    v82 = qword_100010090;
    if ((unint64_t)qword_100010090 >= unk_100010098)
    {
      v83 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
    }
    else
    {
      sub_10000928C(&qword_100010088, (__int128 *)__p);
      v83 = v82 + 32;
    }
    qword_100010090 = v83;
    if (SHIBYTE(v474) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v387) < 0)
      operator delete((void *)v386);
    sub_1000091DC(&v384, "process_lifetime");
    if (SHIBYTE(v385) < 0)
    {
      sub_10000904C(__p, (void *)v384, *((unint64_t *)&v384 + 1));
    }
    else
    {
      *(_OWORD *)__p = v384;
      v474 = v385;
    }
    v475 = 1;
    v84 = qword_100010090;
    if ((unint64_t)qword_100010090 >= unk_100010098)
    {
      v85 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
    }
    else
    {
      sub_10000928C(&qword_100010088, (__int128 *)__p);
      v85 = v84 + 32;
    }
    qword_100010090 = v85;
    if (SHIBYTE(v474) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v385) < 0)
      operator delete((void *)v384);
    sub_1000091DC(&v382, "percent_dirty");
    if (SHIBYTE(v383) < 0)
    {
      sub_10000904C(__p, (void *)v382, *((unint64_t *)&v382 + 1));
    }
    else
    {
      *(_OWORD *)__p = v382;
      v474 = v383;
    }
    v475 = 1;
    v86 = qword_100010090;
    if ((unint64_t)qword_100010090 >= unk_100010098)
    {
      v87 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
    }
    else
    {
      sub_10000928C(&qword_100010088, (__int128 *)__p);
      v87 = v86 + 32;
    }
    qword_100010090 = v87;
    if (SHIBYTE(v474) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v383) < 0)
      operator delete((void *)v382);
  }
  if (byte_100010117 == 1)
  {
    sub_1000091DC(&v380, "neural");
    if (SHIBYTE(v381) < 0)
    {
      sub_10000904C(__p, (void *)v380, *((unint64_t *)&v380 + 1));
    }
    else
    {
      *(_OWORD *)__p = v380;
      v474 = v381;
    }
    v475 = 0;
    v88 = qword_100010090;
    if ((unint64_t)qword_100010090 >= unk_100010098)
    {
      v89 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
    }
    else
    {
      sub_10000928C(&qword_100010088, (__int128 *)__p);
      v89 = v88 + 32;
    }
    qword_100010090 = v89;
    if (SHIBYTE(v474) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v381) < 0)
      operator delete((void *)v380);
    sub_1000091DC(&v378, "neural_peak");
    if (SHIBYTE(v379) < 0)
    {
      sub_10000904C(__p, (void *)v378, *((unint64_t *)&v378 + 1));
    }
    else
    {
      *(_OWORD *)__p = v378;
      v474 = v379;
    }
    v475 = 0;
    v90 = qword_100010090;
    if ((unint64_t)qword_100010090 >= unk_100010098)
    {
      v91 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
    }
    else
    {
      sub_10000928C(&qword_100010088, (__int128 *)__p);
      v91 = v90 + 32;
    }
    qword_100010090 = v91;
    if (SHIBYTE(v474) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v379) < 0)
      operator delete((void *)v378);
    if (byte_100010113 == 1)
    {
      sub_1000091DC(&v376, "neural_interval_peak");
      if (SHIBYTE(v377) < 0)
      {
        sub_10000904C(__p, (void *)v376, *((unint64_t *)&v376 + 1));
      }
      else
      {
        *(_OWORD *)__p = v376;
        v474 = v377;
      }
      v475 = 0;
      v92 = qword_100010090;
      if ((unint64_t)qword_100010090 >= unk_100010098)
      {
        v93 = sub_1000092F8(&qword_100010088, (__int128 *)__p);
      }
      else
      {
        sub_10000928C(&qword_100010088, (__int128 *)__p);
        v93 = v92 + 32;
      }
      qword_100010090 = v93;
      if (SHIBYTE(v474) < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v377) < 0)
        operator delete((void *)v376);
    }
  }
  v94 = 0;
  v95 = v14 / 0x18uLL;
  v244 = v95 + 1;
  v241 = v95;
  while (2)
  {
    v375[0] = 0;
    v375[1] = 0;
    v374 = v375;
    if (v94 == v95)
    {
      LOBYTE(v243) = 0;
      v96 = 0;
      v242 = 999;
      v97 = 1;
      v98 = 50;
    }
    else if (v244 == v94)
    {
      v97 = 0;
      v98 = 0;
      LOBYTE(v243) = 0;
      v96 = 0;
      v242 = 999;
    }
    else
    {
      v99 = &ptr[24 * v94];
      v97 = *(unsigned int *)v99;
      v242 = *((_DWORD *)v99 + 1);
      v98 = *((int *)v99 + 4);
      v243 = *((_DWORD *)v99 + 5);
      v96 = *((_QWORD *)v99 + 1);
    }
    v100 = dword_100010074 == -1 || (_DWORD)v97 == dword_100010074;
    if (!v100)
    {
      v115 = 0;
      goto LABEL_818;
    }
    v373 = 0;
    v371 = 0;
    v370 = 0;
    v372 = 0;
    if ((int)v97 >= 1 && memorystatus_control(8, v97, 0, &v370, 24))
      fprintf(__stderrp, "Warning: Failed to get memory limit info for pid %d.  Limits will appear as 0MB and not fatal.\n", v97);
    sub_1000091DC(v368, "active_limit");
    sub_10000614C(&v374, (const void **)v368, (uint64_t)(int)v370 << 20);
    if (v369 < 0)
      operator delete(v368[0]);
    sub_1000091DC(v366, "inactive_limit");
    sub_10000614C(&v374, (const void **)v366, (uint64_t)(int)v371 << 20);
    if (v367 < 0)
      operator delete(v366[0]);
    sub_1000091DC(v364, "root_limit_increase");
    sub_10000614C(&v374, (const void **)v364, ((_DWORD)v372 << 20));
    if (v365 < 0)
      operator delete(v364[0]);
    v101 = BYTE4(v370);
    v102 = BYTE4(v371);
    sub_1000091DC(v362, "active_limit_hard");
    if ((v101 & 1) != 0)
      v103 = "H";
    else
      v103 = "-";
    sub_1000091DC(v360, v103);
    sub_1000063EC(&v374, (const void **)v362, (uint64_t)v360);
    if (v361 < 0)
      operator delete(v360[0]);
    if (v363 < 0)
      operator delete(v362[0]);
    sub_1000091DC(v358, "inactive_limit_hard");
    if ((v102 & 1) != 0)
      v104 = "H";
    else
      v104 = "-";
    sub_1000091DC(v356, v104);
    sub_1000063EC(&v374, (const void **)v358, (uint64_t)v356);
    if (v357 < 0)
      operator delete(v356[0]);
    if (v359 < 0)
      operator delete(v358[0]);
    if ((ledger(0, (int)v97, v468, 0) & 0x80000000) != 0)
    {
      fprintf(__stderrp, "Warning: Could not get ledger info for pid %d.\n", v97);
      goto LABEL_817;
    }
    v105 = v469;
    v373 = v469;
    __p[0] = v469;
    v106.i64[0] = -1;
    v106.i64[1] = -1;
    if ((vmaxv_u8((uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vceqq_s32((int32x4_t)xmmword_1000100C0, v106), (int16x8_t)vceqq_s32(*(int32x4_t *)&dword_1000100D0, v106)))) & 1) != 0|| (_DWORD)xmmword_1000100E0 == -1|| dword_1000100F4 == -1|| dword_1000100F8 == -1)
    {
      v107 = (char *)malloc_type_malloc(96 * (_QWORD)v469, 0x1000040565EDBD2uLL);
      if (!v107)
        exit(-1);
      if ((ledger(2, v107, __p, 0) & 0x80000000) == 0)
      {
        v108 = (char *)__p[0];
        if ((uint64_t)__p[0] >= 1)
        {
          v109 = 0;
          v110 = v107;
          while (strcmp(v110, "phys_footprint"))
          {
            if (!strcmp(v110, "internal"))
            {
              v111 = (int *)&xmmword_1000100C0 + 1;
              goto LABEL_514;
            }
            if (!strcmp(v110, "internal_compressed"))
            {
              v111 = (int *)&xmmword_1000100C0 + 2;
              goto LABEL_514;
            }
            if (!strcmp(v110, "iokit_mapped"))
            {
              v111 = (int *)&xmmword_1000100C0 + 3;
              goto LABEL_514;
            }
            if (!strcmp(v110, "alternate_accounting"))
            {
              v111 = &dword_1000100D0;
              goto LABEL_514;
            }
            if (!strcmp(v110, "alternate_accounting_compressed"))
            {
              v111 = &dword_1000100D4;
              goto LABEL_514;
            }
            if (!strcmp(v110, "purgeable_nonvolatile"))
            {
              v111 = &dword_1000100D8;
              goto LABEL_514;
            }
            if (!strcmp(v110, "purgeable_nonvolatile_compress"))
            {
              v111 = &dword_1000100DC;
              goto LABEL_514;
            }
            if (!strcmp(v110, "page_table"))
            {
              v111 = (int *)&xmmword_1000100E0;
              goto LABEL_514;
            }
            if (!strcmp(v110, "pages_grabbed"))
            {
              v111 = (int *)&xmmword_1000100E0 + 1;
              goto LABEL_514;
            }
            if (!strcmp(v110, "pages_grabbed_kern"))
            {
              v111 = (int *)&xmmword_1000100E0 + 2;
              goto LABEL_514;
            }
            if (!strcmp(v110, "pages_grabbed_iopl"))
            {
              v111 = (int *)&xmmword_1000100E0 + 3;
              goto LABEL_514;
            }
            if (!strcmp(v110, "pages_grabbed_upl"))
            {
              v111 = &dword_1000100F0;
              goto LABEL_514;
            }
            if (!strcmp(v110, "memorystatus_dirty_time"))
            {
              v111 = &dword_1000100F4;
              goto LABEL_514;
            }
            if (!strcmp(v110, "neural_nofootprint_total"))
            {
              v111 = &dword_1000100F8;
LABEL_514:
              *v111 = (int)v109;
            }
            ++v109;
            v110 += 96;
            if (v108 == v109)
              goto LABEL_516;
          }
          v111 = (int *)&xmmword_1000100C0;
          goto LABEL_514;
        }
      }
LABEL_516:
      free(v107);
      v105 = v373;
      v17 = &selRef_assertions;
    }
    v112 = malloc_type_malloc(56 * (_QWORD)v105, 0xF8C8C37DuLL);
    if ((ledger(1, (int)v97, v112, &v373) & 0x80000000) != 0 || (uint64_t)v373 <= (int)xmmword_1000100C0)
    {
      fprintf(__stderrp, "Warning: Could not get ledger entry info for pid %d.\n", v97);
      free(v112);
      goto LABEL_817;
    }
    v113 = *((_QWORD *)v112 + 7 * (int)xmmword_1000100C0);
    if (byte_100010112 == 1)
    {
      sub_1000091DC(v354, "footprint");
      sub_10000614C(&v374, v354, v113 - *((_QWORD *)v112 + 7 * (int)xmmword_1000100E0));
      if ((v355 & 0x80000000) == 0)
        goto LABEL_527;
      v114 = v354;
    }
    else
    {
      sub_1000091DC(v352, "footprint");
      sub_10000614C(&v374, v352, v113);
      if ((v353 & 0x80000000) == 0)
        goto LABEL_527;
      v114 = v352;
    }
    operator delete((void *)*v114);
LABEL_527:
    sub_1000091DC(v350, "internal");
    sub_10000614C(&v374, (const void **)v350, *((_QWORD *)v112 + 7 * SDWORD1(xmmword_1000100C0)));
    if (v351 < 0)
      operator delete(v350[0]);
    sub_1000091DC(v348, "internal_comp");
    sub_10000614C(&v374, (const void **)v348, *((_QWORD *)v112 + 7 * SDWORD2(xmmword_1000100C0)));
    if (v349 < 0)
      operator delete(v348[0]);
    sub_1000091DC(v346, "iokit_mapped");
    sub_10000614C(&v374, (const void **)v346, *((_QWORD *)v112 + 7 * SHIDWORD(xmmword_1000100C0)));
    if (v347 < 0)
      operator delete(v346[0]);
    sub_1000091DC(v344, "alt_acct");
    sub_10000614C(&v374, (const void **)v344, *((_QWORD *)v112 + 7 * dword_1000100D0));
    if (v345 < 0)
      operator delete(v344[0]);
    sub_1000091DC(v342, "alt_acct_comp");
    sub_10000614C(&v374, (const void **)v342, *((_QWORD *)v112 + 7 * dword_1000100D4));
    if (v343 < 0)
      operator delete(v342[0]);
    if ((byte_100010112 & 1) == 0)
    {
      sub_1000091DC(v340, "page_table");
      sub_10000614C(&v374, (const void **)v340, *((_QWORD *)v112 + 7 * (int)xmmword_1000100E0));
      if (v341 < 0)
        operator delete(v340[0]);
    }
    sub_1000091DC(v338, "purge_nonvol");
    sub_10000614C(&v374, (const void **)v338, *((_QWORD *)v112 + 7 * dword_1000100D8));
    if (v339 < 0)
      operator delete(v338[0]);
    sub_1000091DC(v336, "purge_nonvol_comp");
    sub_10000614C(&v374, (const void **)v336, *((_QWORD *)v112 + 7 * dword_1000100DC));
    if (v337 < 0)
      operator delete(v336[0]);
    sub_1000091DC(v334, "limit");
    sub_10000614C(&v374, (const void **)v334, v98 << 20);
    if (v335 < 0)
      operator delete(v334[0]);
    if (byte_100010115 == 1)
    {
      if (DWORD1(xmmword_1000100E0) == -1)
      {
        sub_1000091DC(v324, "pages_grabbed");
        sub_10000648C(&v374, (const void **)v324, 0);
        if (v325 < 0)
          operator delete(v324[0]);
        sub_1000091DC(v322, "pages_grabbed_kern");
        sub_10000648C(&v374, (const void **)v322, 0);
        if (v323 < 0)
          operator delete(v322[0]);
        sub_1000091DC(v320, "pages_grabbed_iopl");
        sub_10000648C(&v374, (const void **)v320, 0);
        if (v321 < 0)
          operator delete(v320[0]);
        sub_1000091DC(v318, "pages_grabbed_upl");
        sub_10000648C(&v374, v318, 0);
        if (v319 < 0)
        {
          v116 = v318;
          goto LABEL_564;
        }
      }
      else
      {
        sub_1000091DC(v332, "pages_grabbed");
        sub_10000648C(&v374, (const void **)v332, *((_QWORD *)v112 + 7 * SDWORD1(xmmword_1000100E0)));
        if (v333 < 0)
          operator delete(v332[0]);
        sub_1000091DC(v330, "pages_grabbed_kern");
        sub_10000648C(&v374, (const void **)v330, *((_QWORD *)v112 + 7 * SDWORD2(xmmword_1000100E0)));
        if (v331 < 0)
          operator delete(v330[0]);
        sub_1000091DC(v328, "pages_grabbed_iopl");
        sub_10000648C(&v374, (const void **)v328, *((_QWORD *)v112 + 7 * SHIDWORD(xmmword_1000100E0)));
        if (v329 < 0)
          operator delete(v328[0]);
        sub_1000091DC(v326, "pages_grabbed_upl");
        sub_10000648C(&v374, v326, *((_QWORD *)v112 + 7 * dword_1000100F0));
        if (v327 < 0)
        {
          v116 = v326;
LABEL_564:
          operator delete((void *)*v116);
        }
      }
    }
    v117 = 0.0;
    if (byte_100010116 == 1 && dword_1000100F4 != -1)
      v117 = (double)*((uint64_t *)v112 + 7 * dword_1000100F4) / 1000000000.0;
    if (byte_100010117 == 1)
    {
      sub_1000091DC(v316, "neural");
      sub_10000614C(&v374, (const void **)v316, *((_QWORD *)v112 + 7 * dword_1000100F8));
      if (v317 < 0)
        operator delete(v316[0]);
    }
    free(v112);
    if (proc_pid_rusage(v97, 6, (rusage_info_t *)&buffer))
    {
      fprintf(__stderrp, "Warning: Could not get rusage for pid %d.\n", v97);
      sub_1000091DC(v314, "footprint_peak");
      sub_10000614C(&v374, (const void **)v314, v113);
      v118 = 0.0;
      if (v315 < 0)
        operator delete(v314[0]);
      v119 = 0;
    }
    else
    {
      sub_1000091DC(v312, "footprint_peak");
      sub_10000614C(&v374, (const void **)v312, v464);
      if (v313 < 0)
        operator delete(v312[0]);
      if (byte_100010117 == 1)
      {
        sub_1000091DC(v310, "neural_peak");
        sub_10000614C(&v374, (const void **)v310, v466);
        if (v311 < 0)
          operator delete(v310[0]);
      }
      if (byte_100010113 == 1)
      {
        sub_1000091DC(v308, "footprint_interval_peak");
        sub_10000614C(&v374, (const void **)v308, v465);
        if (v309 < 0)
          operator delete(v308[0]);
        if (byte_100010117 == 1)
        {
          sub_1000091DC(v306, "neural_interval_peak");
          sub_10000614C(&v374, (const void **)v306, v467);
          if (v307 < 0)
            operator delete(v306[0]);
        }
      }
      if (byte_100010116 != 1)
        goto LABEL_609;
      v120 = mach_absolute_time();
      v121 = v463;
      if (qword_100010108 != -1)
        dispatch_once(&qword_100010108, &stru_10000C368);
      v118 = *(double *)&qword_100010100 * (double)(v120 - v121);
      v119 = v118 > 0.0;
    }
    if (byte_100010116 != 1)
      goto LABEL_609;
    sub_1000091DC(v304, "total_dirty_time");
    sub_10000656C(&v374, (const void **)v304, (unint64_t)v117);
    if (v305 < 0)
    {
      operator delete(v304[0]);
      if (v119)
      {
LABEL_593:
        sub_1000091DC(v302, "process_lifetime");
        sub_10000656C(&v374, (const void **)v302, (unint64_t)v118);
        if (v303 < 0)
          operator delete(v302[0]);
        sub_1000091DC(v300, "percent_dirty");
        v122 = v117 / v118;
        v123 = "%";
        if (byte_100010118)
          v123 = "";
        snprintf((char *)__p, 0xAuLL, "%02.2f%s", v122 * 100.0, v123);
        v124 = (std::string *)sub_1000068E8(&v374, v300);
        std::string::assign(v124, (const std::string::value_type *)__p);
        v124[1].__r_.__value_.__r.__words[0] = (unint64_t)v122;
        if (v301 < 0)
        {
          v125 = v300;
LABEL_608:
          operator delete((void *)*v125);
          goto LABEL_609;
        }
        goto LABEL_609;
      }
    }
    else if (v119)
    {
      goto LABEL_593;
    }
    sub_1000091DC(v298, "process_lifetime");
    sub_1000091DC(v296, "-");
    sub_1000063EC(&v374, (const void **)v298, (uint64_t)v296);
    if (v297 < 0)
      operator delete(v296[0]);
    if (v299 < 0)
      operator delete(v298[0]);
    sub_1000091DC(v294, "percent_dirty");
    sub_1000091DC(v292, "-");
    sub_1000063EC(&v374, v294, (uint64_t)v292);
    if (v293 < 0)
      operator delete(v292[0]);
    if (v295 < 0)
    {
      v125 = v294;
      goto LABEL_608;
    }
LABEL_609:
    memset(v291, 0, sizeof(v291));
    if (proc_pidinfo(v97, 20, 0, v291, 40) <= 0)
      fprintf(__stderrp, "Warning: Could not get coalitions for pid %d.\n", v97);
    bzero(__p, 0x1000uLL);
    if ((int)v97 < 1)
      proc_name(v97, __p, 0x1000u);
    else
      proc_pidpath(v97, __p, 0x1000u);
    v126 = basename((char *)__p);
    sub_1000091DC(v289, "name");
    sub_1000091DC(v287, v126);
    sub_1000063EC(&v374, (const void **)v289, (uint64_t)v287);
    if (v288 < 0)
      operator delete(v287[0]);
    if (v290 < 0)
      operator delete(v289[0]);
    sub_1000091DC(v285, "coalition");
    sub_10000648C(&v374, (const void **)v285, v291[1]);
    if (v286 < 0)
      operator delete(v285[0]);
    sub_1000091DC(v283, "pid");
    sub_10000648C(&v374, (const void **)v283, (int)v97);
    if (v284 < 0)
      operator delete(v283[0]);
    sub_1000091DC(v281, "fds");
    sub_100006E90((uint64_t)&v470);
    v127 = proc_pidinfo(v97, 1, 0, 0, 0);
    if (v127 < 1)
      goto LABEL_650;
    v128 = 0;
    v129 = 0;
    do
    {
      if (v129 < v127)
      {
        v129 -= 256;
        do
          v129 += 256;
        while (v129 < v127);
        v130 = v128 ? reallocf(v128, v129) : malloc_type_malloc(v129, 0x627E5829uLL);
        v128 = v130;
        if (!v130)
          goto LABEL_650;
      }
      v131 = proc_pidinfo(v97, 1, 0, v128, v129);
      v132 = v131;
      if (v131 < 1)
      {
        v134 = 0xFFFFFFFFLL;
LABEL_636:
        if (v128)
          goto LABEL_647;
        goto LABEL_648;
      }
      v133 = v131 + 8;
      v127 = v129 + 8;
    }
    while (v133 >= v129);
    if (v132 < 8)
    {
      v134 = 0;
      goto LABEL_636;
    }
    v134 = 0;
    v135 = v132 >> 3;
    v136 = v128 + 1;
    while (1)
    {
      if (*v136 != 1)
        goto LABEL_644;
      v137 = proc_pidfdinfo(v97, *(v136 - 1), 1, &v454, 176);
      if (v137 <= 0)
        break;
      if (v137 < 0xB0)
        goto LABEL_646;
      v134 = (v134 + 1);
LABEL_644:
      v136 += 2;
      if (!--v135)
        goto LABEL_647;
    }
    if (*__error() == 2)
      goto LABEL_644;
LABEL_646:
    v134 = 0xFFFFFFFFLL;
LABEL_647:
    free(v128);
LABEL_648:
    v17 = &selRef_assertions;
    if ((v134 & 0x80000000) == 0)
    {
      std::ostream::operator<<(&v471, v134);
      goto LABEL_651;
    }
LABEL_650:
    LOBYTE(v454) = 45;
    sub_100007078(&v471, (uint64_t)&v454, 1);
LABEL_651:
    std::stringbuf::str(v279, v472);
    sub_100006FC0((uint64_t)&v470);
    sub_1000063EC(&v374, (const void **)v281, (uint64_t)v279);
    if (v280 < 0)
      operator delete(v279[0]);
    if (v282 < 0)
      operator delete(v281[0]);
    sub_1000091DC(v277, "priority");
    sub_10000648C(&v374, (const void **)v277, v242);
    if (v278 < 0)
      operator delete(v277[0]);
    if (v242 <= 109)
    {
      if (v242 <= 49)
      {
        if (v242 <= 19)
        {
          v138 = "(Idle)";
          if (v242)
          {
            if (v242 != 10)
              goto LABEL_833;
            v138 = "(Deferred)";
          }
        }
        else
        {
          switch(v242)
          {
            case 20:
              v138 = "(Opportunistic)";
              break;
            case 30:
              v138 = "(Dock)";
              break;
            case 40:
              v138 = "(BG)";
              break;
            default:
              goto LABEL_833;
          }
        }
        goto LABEL_688;
      }
      if (v242 > 79)
      {
        switch(v242)
        {
          case 'P':
            v138 = "(UISupport)";
            break;
          case 'Z':
            v138 = "(FGSupport)";
            break;
          case 'd':
            v138 = "(FG)";
            break;
          default:
            goto LABEL_833;
        }
        goto LABEL_688;
      }
      if (v242 == 50)
      {
        v138 = "(Phone)";
        goto LABEL_688;
      }
      if (v242 != 70)
      {
        if (v242 != 75)
          goto LABEL_833;
        v138 = "(Freezer)";
        goto LABEL_688;
      }
LABEL_687:
      v138 = "(-)";
      goto LABEL_688;
    }
    if (v242 > 169)
    {
      if (v242 <= 199)
      {
        switch(v242)
        {
          case 170:
            v138 = "(RenderServer)";
            break;
          case 180:
            v138 = "(Important)";
            break;
          case 190:
            v138 = "(Critical)";
            break;
          default:
            goto LABEL_833;
        }
        goto LABEL_688;
      }
      if (v242 != 200 && v242 != 210 && v242 != 999)
        goto LABEL_833;
      goto LABEL_687;
    }
    if (v242 > 139)
    {
      if (v242 != 140)
      {
        if (v242 == 150)
        {
          v138 = "(DriverKit)";
        }
        else
        {
          if (v242 != 160)
            goto LABEL_833;
          v138 = "(Home)";
        }
        goto LABEL_688;
      }
      goto LABEL_687;
    }
    switch(v242)
    {
      case 110:
        goto LABEL_687;
      case 120:
        v138 = "(Audio)";
        break;
      case 130:
        v138 = "(AppleTV)";
        break;
      default:
LABEL_833:
        v138 = "(Unknown)";
        break;
    }
LABEL_688:
    sub_1000091DC(v275, "priority_name");
    sub_1000091DC(v273, v138);
    sub_1000063EC(&v374, (const void **)v275, (uint64_t)v273);
    if (v274 < 0)
      operator delete(v273[0]);
    if (v276 < 0)
      operator delete(v275[0]);
    sub_1000091DC(v271, "PE");
    if ((v243 & 0x10) != 0)
      v139 = "Y";
    else
      v139 = "-";
    sub_1000091DC(v269, v139);
    sub_1000063EC(&v374, (const void **)v271, (uint64_t)v269);
    if (v270 < 0)
      operator delete(v269[0]);
    if (v272 < 0)
      operator delete(v271[0]);
    sub_1000091DC(v267, "frozen");
    if ((v243 & 2) != 0)
      v140 = "Y";
    else
      v140 = "-";
    sub_1000091DC(v265, v140);
    sub_1000063EC(&v374, (const void **)v267, (uint64_t)v265);
    if (v266 < 0)
      operator delete(v265[0]);
    if (v268 < 0)
      operator delete(v267[0]);
    sub_1000091DC(v263, "dirty");
    v141 = "Y";
    if ((v243 & 0x20) == 0)
      v141 = "N";
    if ((v243 & 8) != 0)
      v142 = (char *)v141;
    else
      v142 = "-";
    sub_1000091DC(v261, v142);
    sub_1000063EC(&v374, (const void **)v263, (uint64_t)v261);
    if (v262 < 0)
      operator delete(v261[0]);
    if (v264 < 0)
      operator delete(v263[0]);
    if (v240)
    {
      if ((int)v97 < 1)
      {
        v145 = 0;
      }
      else
      {
        v143 = objc_autoreleasePoolPush();
        v252.__r_.__value_.__r.__words[0] = 0;
        v144 = +[RBSProcessHandle handleForIdentifier:error:](RBSProcessHandle, "handleForIdentifier:error:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v97), &v252);
        if (v252.__r_.__value_.__r.__words[0])
        {
          fprintf(__stderrp, "Warning: Could not get RBSProcessHandle for pid %d.\n", v97);
          v145 = 0;
        }
        else
        {
          v457 = 0u;
          v456 = 0u;
          v455 = 0u;
          v454 = 0u;
          v146 = objc_msgSend(objc_msgSend(v144, "currentState"), "assertions");
          v147 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v454, &v470, 16);
          if (v147)
          {
            v148 = *(_QWORD *)v455;
            while (2)
            {
              for (i = 0; i != v147; i = (char *)i + 1)
              {
                if (*(_QWORD *)v455 != v148)
                  objc_enumerationMutation(v146);
                if ((objc_msgSend(objc_msgSend(*(id *)(*((_QWORD *)&v454 + 1) + 8 * (_QWORD)i), "domain"), "isEqualToString:", CFSTR("com.apple.dasd:DockApp")) & 1) != 0)
                {
                  v145 = 3;
                  v17 = &selRef_assertions;
                  goto LABEL_734;
                }
              }
              v147 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v454, &v470, 16);
              v17 = &selRef_assertions;
              if (v147)
                continue;
              break;
            }
          }
          v145 = 2;
        }
LABEL_734:
        objc_autoreleasePoolPop(v143);
      }
      sub_1000091DC(v259, "docked");
      v150 = "Y";
      if ((v145 & 1) == 0)
        v150 = "N";
      if (v145 >= 2)
        v151 = (char *)v150;
      else
        v151 = "-";
      sub_1000091DC(v257, v151);
      sub_1000063EC(&v374, (const void **)v259, (uint64_t)v257);
      if (v258 < 0)
        operator delete(v257[0]);
      if (v260 < 0)
        operator delete(v259[0]);
    }
    if ((int)v97 < 1)
    {
LABEL_749:
      v154 = "-";
    }
    else
    {
      v152 = memorystatus_control(26, v97, 0, 0, 0);
      v153 = __error();
      if (v152)
      {
        v154 = "Y";
        if (v152 == -1)
        {
          v155 = *v153;
          v154 = "-";
          if (v155 != 45)
          {
            v156 = __stderrp;
            v157 = strerror(v155);
            fprintf(v156, "Warning: Unable to get swappable status for pid: %d due to %s\n", v97, v157);
            goto LABEL_749;
          }
        }
      }
      else
      {
        v154 = "N";
      }
    }
    sub_1000091DC(v255, "swappable");
    sub_1000091DC(v253, v154);
    sub_1000063EC(&v374, (const void **)v255, (uint64_t)v253);
    if (v254 < 0)
      operator delete(v253[0]);
    if (v256 < 0)
      operator delete(v255[0]);
    memset(&v252, 0, sizeof(v252));
    if (!v96)
      goto LABEL_769;
    v158 = 0;
    do
    {
      if ((v96 & 1) != 0)
      {
        if (v158 < 0x1B)
        {
          size = HIBYTE(v252.__r_.__value_.__r.__words[2]);
          if ((v252.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            size = v252.__r_.__value_.__l.__size_;
          if (size)
            std::string::append(&v252, " ");
          std::string::append(&v252, (&off_10000C388)[v158]);
        }
        else
        {
          fprintf(__stderrp, "Warning: Unknown assertion type %d. (Has BKSWorkspaceTypes.h been changed recently?)\n", v94);
        }
      }
      ++v158;
      v160 = v96 >= 2;
      v96 >>= 1;
    }
    while (v160);
    v161 = HIBYTE(v252.__r_.__value_.__r.__words[2]);
    if ((v252.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v161 = v252.__r_.__value_.__l.__size_;
    if (!v161)
    {
LABEL_769:
      if (byte_100010118 == 1)
        std::string::assign(&v252, "(---)");
    }
    sub_1000091DC(v250, "flags");
    if (SHIBYTE(v252.__r_.__value_.__r.__words[2]) < 0)
      sub_10000904C(&__dst, v252.__r_.__value_.__l.__data_, v252.__r_.__value_.__l.__size_);
    else
      __dst = v252;
    sub_1000063EC(&v374, (const void **)v250, (uint64_t)&__dst);
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__dst.__r_.__value_.__l.__data_);
    if (v251 < 0)
      operator delete(v250[0]);
    sub_100009650((uint64_t *)&v247, (const void ***)&v374);
    if (!qword_100010130)
    {
      sub_1000084A0((uint64_t)&v247, v248);
LABEL_811:
      v179 = qword_1000100A8;
      if ((unint64_t)qword_1000100A8 >= unk_1000100B0)
      {
        v180 = sub_1000096A4(&qword_1000100A0, (const void ***)&v374);
      }
      else
      {
        sub_100009650((uint64_t *)qword_1000100A8, (const void ***)&v374);
        v180 = v179 + 24;
        qword_1000100A8 = v179 + 24;
      }
      qword_1000100A8 = v180;
      goto LABEL_815;
    }
    if (qword_100010140 != -1)
      dispatch_once(&qword_100010140, &stru_10000C460);
    v162 = objc_alloc((Class)NSMutableDictionary);
    v163 = objc_msgSend(v162, "initWithCapacity:", (qword_100010090 - qword_100010088) >> 5);
    if (qword_100010090 != qword_100010088)
    {
      v164 = 0;
      v165 = 0;
      do
      {
        v166 = objc_autoreleasePoolPush();
        v167 = qword_100010088;
        v168 = (__int128 *)(qword_100010088 + v164);
        if (*(char *)(qword_100010088 + v164 + 23) < 0)
        {
          sub_10000904C(&v470, *(void **)v168, *((_QWORD *)v168 + 1));
        }
        else
        {
          v169 = *v168;
          v471 = *((_QWORD *)v168 + 2);
          v470 = v169;
        }
        v170 = *(_QWORD *)(v167 + v164 + 24);
        v472[0] = v170;
        if (SHIBYTE(v471) < 0)
        {
          sub_10000904C(&v454, (void *)v470, *((unint64_t *)&v470 + 1));
          LODWORD(v170) = v472[0];
        }
        else
        {
          v454 = v470;
          *(_QWORD *)&v455 = v471;
        }
        if ((SBYTE7(v455) & 0x80u) == 0)
          v171 = &v454;
        else
          v171 = (__int128 *)v454;
        v172 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v171, 4);
        if ((_DWORD)v170)
        {
          if ((_DWORD)v170 == 1)
          {
            objc_msgSend(v163, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", sub_1000068E8(&v247, (const void **)&v454)[3]), v172);
          }
          else if ((_DWORD)v170 == 2)
          {
            v173 = sub_1000068E8(&v247, (const void **)&v454);
            v175 = 0.00000095367;
            if (byte_100010119)
              v175 = 0.00097656;
            *(float *)&v174 = v175 * (float)(unint64_t)v173[3];
            objc_msgSend(v163, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v174), v172);
          }
        }
        else
        {
          v176 = sub_1000068E8(&v247, (const void **)&v454);
          if (*((char *)v176 + 23) >= 0)
            v177 = (uint64_t)v176;
          else
            v177 = *v176;
          objc_msgSend(v163, "setObject:forKeyedSubscript:", +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v177, 4), v172);
        }
        if (SBYTE7(v455) < 0)
          operator delete((void *)v454);
        if (SHIBYTE(v471) < 0)
          operator delete((void *)v470);
        objc_autoreleasePoolPop(v166);
        ++v165;
        v164 += 32;
      }
      while (v165 < (qword_100010090 - qword_100010088) >> 5);
    }
    v178 = objc_msgSend((id)qword_100010138, "evaluateWithObject:", v163);
    sub_1000084A0((uint64_t)&v247, v248);
    if (v178)
      goto LABEL_811;
LABEL_815:
    if (SHIBYTE(v252.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v252.__r_.__value_.__l.__data_);
LABEL_817:
    v95 = v241;
    v115 = (_QWORD *)v375[0];
LABEL_818:
    sub_1000084A0((uint64_t)&v374, v115);
    v100 = v94++ == v244;
    if (!v100)
      continue;
    break;
  }
  free(ptr);
  if (byte_100010118)
    v181 = 0;
  else
    v181 = 5;
  ptra = v181;
  LODWORD(__p[0]) = 0;
  sub_100007798(&v470, (qword_100010090 - qword_100010088) >> 5, __p);
  if ((byte_100010118 & 1) == 0)
  {
    v182 = qword_100010088;
    if (qword_100010090 != qword_100010088)
    {
      v183 = 0;
      do
      {
        v184 = v182 + 32 * v183;
        if ((*(_BYTE *)(v184 + 28) & 1) != 0
          || v183 && (*(_BYTE *)(v182 + 32 * (v183 - 1) + 28) & 1) != 0)
        {
          LODWORD(v184) = 0;
        }
        else if (*(char *)(v184 + 23) < 0)
        {
          v184 = *(_QWORD *)(v184 + 8);
        }
        else
        {
          LODWORD(v184) = *(unsigned __int8 *)(v184 + 23);
        }
        v185 = v470;
        *(_DWORD *)(v470 + 4 * v183) = v184;
        v186 = qword_1000100A0;
        if (qword_1000100A8 != qword_1000100A0)
        {
          v187 = 0;
          v188 = 0;
          do
          {
            v189 = sub_1000068E8((uint64_t **)(v186 + v187), (const void **)(qword_100010088 + 32 * v183));
            v190 = *((unsigned __int8 *)v189 + 23);
            if ((v190 & 0x80u) != 0)
              v190 = v189[1];
            v185 = v470;
            v184 = *(int *)(v470 + 4 * v183);
            if (v190 > v184)
            {
              *(_DWORD *)(v470 + 4 * v183) = v190;
              LODWORD(v184) = v190;
            }
            ++v188;
            v186 = qword_1000100A0;
            v187 += 24;
          }
          while (0xAAAAAAAAAAAAAAABLL * ((qword_1000100A8 - qword_1000100A0) >> 3) > v188);
          v182 = qword_100010088;
          v17 = &selRef_assertions;
        }
        if (v183)
        {
          v191 = (v183 - 1);
          v192 = v182 + 32 * v191;
          if ((*(_BYTE *)(v192 + 28) & 1) != 0)
          {
            v193 = (_DWORD *)(v185 + 4 * v191);
            v194 = *v193 + (int)v184 + 1;
            v195 = *(char *)(v192 + 23) < 0 ? *(_QWORD *)(v192 + 8) : *(unsigned __int8 *)(v192 + 23);
            if (v195 > v194)
            {
              v196 = (_DWORD *)(v185 + 4 * v183);
              if ((int)v184 <= *v193)
              {
                LODWORD(v184) = *v193;
                v196 = v193;
              }
              *v196 = v184 - v194 + v195;
            }
          }
        }
        ++v183;
      }
      while (v183 < (uint64_t)&v17[18][-v182] >> 5);
    }
  }
  v197 = snprintf((char *)__p, 0x1000uLL, "%*s", ptra, "#");
  v198 = qword_100010088;
  if (qword_100010090 != qword_100010088)
  {
    v199 = 0;
    v200 = 0;
    v201 = (char *)__p + v197;
    v202 = 4096 - v197;
    do
    {
      if (byte_100010118)
        v203 = ",";
      else
        v203 = "  ";
      if (byte_100010118)
      {
        v204 = *(_DWORD *)(v198 + 32 * v199 + 28);
      }
      else
      {
        v205 = v198 + 32 * v199;
        v204 = *(_DWORD *)(v205 + 28);
        if ((v204 & 1) != 0)
        {
          if (*(char *)(v205 + 23) < 0)
            v205 = *(_QWORD *)v205;
          v209 = snprintf(v201, v202, "%s%-*s", "  ", *(_DWORD *)(v470 + 4 * v199) + *(_DWORD *)(v470 + 4 * ++v200) + 1, (const char *)v205);
          goto LABEL_889;
        }
      }
      v206 = v198 + 32 * v199;
      if ((v204 & 2) != 0)
        v207 = "%s%-*s";
      else
        v207 = "%s%*s";
      if ((v204 & 4) != 0)
      {
        sub_100007484(v206, *(_DWORD *)(v470 + 4 * v199), (uint64_t)&buffer);
      }
      else if (*(char *)(v206 + 23) < 0)
      {
        sub_10000904C(&buffer, *(void **)v206, *(_QWORD *)(v206 + 8));
      }
      else
      {
        v208 = *(_OWORD *)v206;
        v459 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v206 + 16);
        buffer = v208;
      }
      if (SHIBYTE(v459) >= 0)
        p_buffer = &buffer;
      else
        p_buffer = (__int128 *)buffer;
      v209 = snprintf(v201, v202, v207, v203, *(unsigned int *)(v470 + 4 * v199), p_buffer);
      if (SHIBYTE(v459) < 0)
        operator delete((void *)buffer);
LABEL_889:
      v202 -= v209;
      v201 += v209;
      v199 = ++v200;
      v198 = qword_100010088;
    }
    while (v200 < (unint64_t)((qword_100010090 - qword_100010088) >> 5));
  }
  sub_1000075C4(__p);
  puts((const char *)__p);
  if (qword_100010120)
  {
    sub_1000091DC(&v454, (char *)qword_100010120);
    v211 = (uint64_t *)qword_1000100A0;
    v212 = (const void ***)qword_1000100A8;
    if (qword_1000100A8 == qword_1000100A0)
    {
      v215 = 0;
      v216 = 0xAAAAAAAAAAAAAAABLL * ((qword_1000100A8 - qword_1000100A0) >> 3);
    }
    else
    {
      v213 = 0;
      v214 = 0;
      do
      {
        if (!sub_100007968((uint64_t)&v211[v213], (const void **)&v454))
        {
          fprintf(__stderrp, "Error: Unable to sort by key '%s'\n", (const char *)qword_100010120);
          sub_10000670C(1);
        }
        ++v214;
        v211 = (uint64_t *)qword_1000100A0;
        v212 = (const void ***)qword_1000100A8;
        v215 = qword_1000100A8 - qword_1000100A0;
        v216 = 0xAAAAAAAAAAAAAAABLL * ((qword_1000100A8 - qword_1000100A0) >> 3);
        v213 += 3;
      }
      while (v216 > v214);
    }
    *(_QWORD *)&buffer = _NSConcreteStackBlock;
    *((_QWORD *)&buffer + 1) = 3321888768;
    v459 = sub_100007638;
    v460 = &unk_10000C480;
    if (SBYTE7(v455) < 0)
    {
      sub_10000904C(&v461, (void *)v454, *((unint64_t *)&v454 + 1));
    }
    else
    {
      v461 = v454;
      v462 = v455;
    }
    v468[0] = &buffer;
    if (v215 < 1)
    {
      v217 = 0;
      v219 = 0;
    }
    else
    {
      v217 = (uint64_t *)sub_1000079E4(v216);
      v219 = v218;
    }
    sub_100007A4C(v211, v212, (uint64_t)v468, v216, v217, v219);
    if (v217)
      operator delete(v217);
    if (SHIBYTE(v462) < 0)
      operator delete((void *)v461);
    if (SBYTE7(v455) < 0)
      operator delete((void *)v454);
  }
  if (qword_1000100A8 != qword_1000100A0)
  {
    v220 = 0;
    do
    {
      v221 = snprintf((char *)__p, 0x1000uLL, "%*d", ptra, v220);
      v222 = qword_100010088;
      if (qword_100010090 != qword_100010088)
      {
        v223 = 0;
        v224 = (char *)__p + v221;
        v225 = 28;
        v226 = 4096 - v221;
        do
        {
          v227 = ",";
          if ((byte_100010118 & 1) == 0)
          {
            if (v223)
            {
              if ((*(_DWORD *)(v222 + 32 * (v223 - 1) + 28) & 1) != 0)
                v227 = " ";
              else
                v227 = "  ";
            }
            else
            {
              v227 = "  ";
            }
          }
          v228 = (const void **)(v222 + v225 - 28);
          v229 = *(_DWORD *)(v222 + v225);
          if ((v229 & 2) != 0)
            v230 = "%s%-*s";
          else
            v230 = "%s%*s";
          v231 = (uint64_t **)(qword_1000100A0 + 24 * v220);
          if ((v229 & 4) != 0)
          {
            v233 = sub_1000068E8(v231, v228);
            sub_100007484((uint64_t)v233, *(_DWORD *)(v470 + 4 * v223), (uint64_t)&v454);
          }
          else
          {
            v232 = sub_1000068E8(v231, v228);
            if (*((char *)v232 + 23) < 0)
            {
              sub_10000904C(&v454, (void *)*v232, v232[1]);
            }
            else
            {
              v454 = *(_OWORD *)v232;
              *(_QWORD *)&v455 = v232[2];
            }
          }
          if ((SBYTE7(v455) & 0x80u) == 0)
            v234 = &v454;
          else
            v234 = (__int128 *)v454;
          v235 = snprintf(v224, v226, v230, v227, *(unsigned int *)(v470 + 4 * v223), v234);
          if (SBYTE7(v455) < 0)
            operator delete((void *)v454);
          v224 += v235;
          v226 -= v235;
          ++v223;
          v222 = qword_100010088;
          v225 += 32;
        }
        while (v223 < (qword_100010090 - qword_100010088) >> 5);
      }
      sub_1000075C4(__p);
      puts((const char *)__p);
      ++v220;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((qword_1000100A8 - qword_1000100A0) >> 3) > v220);
  }
  if ((_QWORD)v470)
  {
    *((_QWORD *)&v470 + 1) = v470;
    operator delete((void *)v470);
  }
  return 0;
}

void sub_100005284(_Unwind_Exception *a1)
{
  if (SLOBYTE(STACK[0x6AF]) < 0)
    operator delete((void *)STACK[0x698]);
  _Unwind_Resume(a1);
}

uint64_t sub_100005FFC(int a1)
{
  uint64_t v2;
  FILE *v3;
  int *v4;
  char *v5;

  v2 = proc_reset_footprint_interval();
  if ((_DWORD)v2)
  {
    v3 = __stderrp;
    v4 = __error();
    v5 = strerror(*v4);
    fprintf(v3, "Unable to reset footprint for %d. error: %s\n", a1, v5);
  }
  return v2;
}

uint64_t sub_100006064()
{
  uint64_t result;
  size_t v1;
  int v2;

  v2 = 0;
  v1 = 4;
  result = sysctlbyname("kern.maxproc", &v2, &v1, 0, 0);
  if (!(_DWORD)result)
    operator new[]();
  return result;
}

void sub_10000613C(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_10000614C(uint64_t **a1, const void **a2, unint64_t a3)
{
  char *v6;
  unint64_t v7;
  const char *v8;
  unsigned int v9;
  const char *v10;
  char v11;
  std::string *v12;
  std::string __p;
  std::string __dst;
  unint64_t v15;
  char __str[4];
  char __s[32];

  if (a3 - 0x7FFFFFFFFFFFFFFFLL > 0x8000000000000001)
  {
    if (byte_100010119 == 1)
    {
      v7 = a3 >> 10;
      if (byte_100010118)
        v8 = "";
      else
        v8 = "KB";
      __str[0] = 0;
    }
    else
    {
      if (a3 < 0x40000001)
      {
        v11 = 20;
        if (a3 > 0x100000)
        {
          v10 = "MB";
        }
        else
        {
          v11 = 10;
          v10 = "KB";
        }
        if (a3 > 0x100000)
          LOWORD(v9) = a3 >> 10;
        else
          LOWORD(v9) = a3;
      }
      else
      {
        v9 = a3 >> 20;
        v10 = "GB";
        v11 = 30;
      }
      v7 = a3 >> v11;
      if (byte_100010118)
        v8 = "";
      else
        v8 = v10;
      __str[0] = 0;
      if (v7 <= 9)
        snprintf(__str, 4uLL, ".%d", ((5 * (v9 & 0x3FF)) >> 9) & 0x3FFFFF);
    }
    snprintf(__s, 0x20uLL, "%lld%s%s", v7, __str, v8);
    sub_1000091DC(&__p, __s);
  }
  else
  {
    if (byte_100010118 == 1)
    {
      if (a3)
        v6 = "-";
      else
        v6 = "0";
LABEL_6:
      sub_1000091DC(&__p, v6);
      goto LABEL_31;
    }
    if (byte_100010119 == 1)
    {
      if (a3)
        v6 = "-";
      else
        v6 = "0KB";
      goto LABEL_6;
    }
    sub_1000091DC(&__p, "---");
  }
LABEL_31:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    sub_10000904C(&__dst, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  else
    __dst = __p;
  v15 = a3;
  v12 = (std::string *)sub_1000068E8(a1, a2);
  std::string::operator=(v12, &__dst);
  v12[1].__r_.__value_.__r.__words[0] = v15;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_1000063B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_1000063EC(uint64_t **a1, const void **a2, uint64_t a3)
{
  std::string *v5;
  std::string __p;
  int v7;

  if (*(char *)(a3 + 23) < 0)
    sub_10000904C(&__p, *(void **)a3, *(_QWORD *)(a3 + 8));
  else
    __p = *(std::string *)a3;
  v7 = 0;
  v5 = (std::string *)sub_1000068E8(a1, a2);
  std::string::operator=(v5, &__p);
  v5[1].__r_.__value_.__r.__words[0] = v7;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_100006470(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_10000648C(uint64_t **a1, const void **a2, unint64_t __val)
{
  std::string *v6;
  std::string v7;
  std::string __str;
  unint64_t v9;

  std::to_string(&v7, __val);
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0)
    sub_10000904C(&__str, v7.__r_.__value_.__l.__data_, v7.__r_.__value_.__l.__size_);
  else
    __str = v7;
  v9 = __val;
  v6 = (std::string *)sub_1000068E8(a1, a2);
  std::string::operator=(v6, &__str);
  v6[1].__r_.__value_.__r.__words[0] = v9;
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v7.__r_.__value_.__l.__data_);
}

void sub_100006538(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_10000656C(uint64_t **a1, const void **a2, unint64_t __val)
{
  int v6;
  size_t size;
  uint64_t v8;
  std::string *p_p;
  std::string *v10;
  char *v11;
  std::string *v12;
  std::string v13;
  std::string __p;
  std::string __str;
  unint64_t v16;

  v6 = byte_100010118;
  std::to_string(&v13, __val);
  if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v13.__r_.__value_.__r.__words[2]);
  else
    size = v13.__r_.__value_.__l.__size_;
  v8 = v6 ^ 1u;
  p_p = &__p;
  sub_100006D84((uint64_t)&__p, size + v8);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if (size)
  {
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v10 = &v13;
    else
      v10 = (std::string *)v13.__r_.__value_.__r.__words[0];
    memmove(p_p, v10, size);
  }
  v11 = (char *)p_p + size;
  if ((v6 & 1) == 0)
    memcpy(v11, "s", v6 ^ 1u);
  v11[v8] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    sub_10000904C(&__str, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  else
    __str = __p;
  v16 = __val;
  v12 = (std::string *)sub_1000068E8(a1, a2);
  std::string::operator=(v12, &__str);
  v12[1].__r_.__value_.__r.__words[0] = v16;
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v13.__r_.__value_.__l.__data_);
}

void sub_1000066C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a20 < 0)
    operator delete(__p);
  if (a14 < 0)
    operator delete(a9);
  _Unwind_Resume(exception_object);
}

void sub_10000670C(int a1)
{
  fwrite("jetsam_priority shows dirty state, memory usage, and file counts for processes in priority order.\n\n", 0x63uLL, 1uLL, __stderrp);
  fwrite("Usage:\n", 7uLL, 1uLL, __stderrp);
  if (byte_100010080)
  {
    fwrite("   -e: Extended output: print every column.  Equivalent to -l -f -i.\n", 0x45uLL, 1uLL, __stderrp);
    fwrite("   -i: Print interval footprint peak. Requires development kernel.\n", 0x43uLL, 1uLL, __stderrp);
    fwrite("   -z (optional:) PID: Reset interval footprint for PID (or all). Requires development kernel.\n", 0x5FuLL, 1uLL, __stderrp);
    fwrite("   -l: Print memory limits.\n", 0x1CuLL, 1uLL, __stderrp);
    fwrite("   -f: Print some (not all) kernel ledgers.\n", 0x2CuLL, 1uLL, __stderrp);
    fwrite("       See xnu osfmk/kern/task.c and footprint(1) for details.\n", 0x3FuLL, 1uLL, __stderrp);
    fwrite("       footprint = (internal - alt_acct) + (internal_comp - alt_acct_comp)\n                   + iokit_mapped + purge_nonvol + purge_nonvol_comp + page_table\n                   + other ledger balances not shown here\n", 0xD7uLL, 1uLL, __stderrp);
    fwrite("       footprint_peak: The maximum value of footprint in the task's lifetime.\n       internal:       Size of the task's anonymous memory which is not compressed.\n       internal_comp:  Size of the task's anonymous memory which is compressed or swapped.\n       iokit_mapped:   Total size of all IOKit mappings in this task.\n       alt_acct:       The number of internal pages which are part of IOKit mappings or purgeable.\n                       These must be subtracted to avoid double-counting.\n       page_table:     The size of page table mappings for the process.\n", 0x238uLL, 1uLL, __stderrp);
  }
  fwrite("   -p PID: Print information about a single process.\n", 0x35uLL, 1uLL, __stderrp);
  fwrite("   -s COLUMN: Sort by column name. By default, sorts by 'priority'.\n", 0x44uLL, 1uLL, __stderrp);
  fwrite("              As a shortcut, 'mem' is an alias for 'footprint'.\n", 0x40uLL, 1uLL, __stderrp);
  fwrite("   -r: Reverse the sort order (descending instead of ascending).\n", 0x41uLL, 1uLL, __stderrp);
  fwrite("   -w PREDICATE: Where clause to filter process list by expected column values.\n                 Provided format follows NSPredicate; see its documentation.\n",
    0x9DuLL,
    1uLL,
    __stderrp);
  fwrite("   -k: Print all columns in KB.\n", 0x20uLL, 1uLL, __stderrp);
  fwrite("   -c: Print output as CSV. Implies -k.\n", 0x28uLL, 1uLL, __stderrp);
  fwrite("   -h: Print this message and exit.\n", 0x24uLL, 1uLL, __stderrp);
  exit(a1);
}

uint64_t *sub_1000068E8(uint64_t **a1, const void **a2)
{
  uint64_t **v4;
  uint64_t *v5;
  uint64_t **v6;
  uint64_t *v8;
  uint64_t v9;

  v4 = (uint64_t **)sub_10000695C((uint64_t)a1, &v9, a2);
  v5 = *v4;
  if (!*v4)
  {
    v6 = v4;
    sub_1000069F8((uint64_t)a1, (uint64_t)a2, (uint64_t)&v8);
    sub_100006AA0(a1, v9, v6, v8);
    v5 = v8;
  }
  return v5 + 7;
}

_QWORD *sub_10000695C(uint64_t a1, _QWORD *a2, const void **a3)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;
  const void **v9;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    v7 = a1 + 16;
    do
    {
      while (1)
      {
        v8 = (_QWORD *)v4;
        v9 = (const void **)(v4 + 32);
        if (!sub_100006AF4(v7, a3, (const void **)(v4 + 32)))
          break;
        v4 = *v8;
        v5 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (!sub_100006AF4(v7, v9, a3))
        break;
      v5 = v8 + 1;
      v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    v8 = (_QWORD *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

double sub_1000069F8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  _BYTE *v7;
  double result;

  v5 = a1 + 8;
  v6 = (char *)operator new(0x58uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *(_WORD *)(a3 + 16) = 0;
  v7 = v6 + 32;
  if (*(char *)(a2 + 23) < 0)
  {
    sub_10000904C(v7, *(void **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)v7 = *(_OWORD *)a2;
    *((_QWORD *)v6 + 6) = *(_QWORD *)(a2 + 16);
  }
  *(_WORD *)(a3 + 16) = 257;
  result = 0.0;
  *(_OWORD *)(v6 + 56) = 0u;
  *(_OWORD *)(v6 + 72) = 0u;
  return result;
}

void sub_100006A84(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  sub_100006D1C(v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *sub_100006AA0(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = sub_100006B84(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

BOOL sub_100006AF4(uint64_t a1, const void **a2, const void **a3)
{
  int v3;
  int v4;
  size_t v5;
  const void *v6;
  size_t v7;
  const void *v8;
  size_t v9;
  int v10;

  v3 = *((char *)a3 + 23);
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = *((unsigned __int8 *)a2 + 23);
  else
    v5 = (size_t)a2[1];
  if (v4 >= 0)
    v6 = a2;
  else
    v6 = *a2;
  if (v3 >= 0)
    v7 = *((unsigned __int8 *)a3 + 23);
  else
    v7 = (size_t)a3[1];
  if (v3 >= 0)
    v8 = a3;
  else
    v8 = *a3;
  if (v7 >= v5)
    v9 = v5;
  else
    v9 = v7;
  v10 = memcmp(v6, v8, v9);
  if (v10)
    return v10 < 0;
  else
    return v5 < v7;
}

void sub_100006B5C()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t *sub_100006B84(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void sub_100006D1C(uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 9) && *((char *)__p + 79) < 0)
    operator delete(__p[7]);
  if (*(_BYTE *)(a1 + 8))
  {
    if (*((char *)__p + 55) < 0)
      operator delete(__p[4]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t sub_100006D84(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a2 >= 0x7FFFFFFFFFFFFFF8)
    sub_100006E08();
  if (a2 > 0x16)
  {
    v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17)
      v4 = a2 | 7;
    v5 = v4 + 1;
    v6 = operator new(v4 + 1);
    *(_QWORD *)(a1 + 8) = a2;
    *(_QWORD *)(a1 + 16) = v5 | 0x8000000000000000;
    *(_QWORD *)a1 = v6;
  }
  else
  {
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)a1 = 0;
    *(_BYTE *)(a1 + 23) = a2;
  }
  return a1;
}

void sub_100006E08()
{
  sub_100006E1C("basic_string");
}

void sub_100006E1C(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100006E6C(exception, a1);
}

void sub_100006E58(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100006E6C(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

uint64_t sub_100006E90(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  std::ios_base *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a1 + 16;
  v3 = a1 + 24;
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + *(_QWORD *)(v4 - 24)) = v5;
  *(_QWORD *)(a1 + 8) = 0;
  v6 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v6, (void *)(a1 + 24));
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(v2 + *(_QWORD *)(v7 - 24)) = v8;
  *(_QWORD *)a1 = v9;
  std::streambuf::basic_streambuf(v3);
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_100006F94(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  std::iostream::~basic_iostream(v2, v3 + 8);
  std::ios::~ios(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100006FC0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v4 = a1 + 24;
  *(_QWORD *)(a1 + 16) = v3;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  std::streambuf::~streambuf(v4);
  std::ios::~ios(a1 + 128);
  return a1;
}

void sub_100007048(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ios::~ios(v1 + 128);
  _Unwind_Resume(a1);
}

_QWORD *sub_100007078(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  std::ostream::sentry::sentry(v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!sub_1000071E0(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  std::ostream::sentry::~sentry(v13);
  return a1;
}

void sub_100007180(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  std::ostream::sentry::~sentry(&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x100007160);
}

void sub_1000071CC(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_1000071E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      sub_10000731C(__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_100007300(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_10000731C(_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    sub_100006E08();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

void sub_1000073C4(id a1)
{
  qword_100010138 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", qword_100010130, 4));
}

void sub_100007484(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  int v5;
  int v6;
  int v7;
  size_t v8;
  void *__p[2];
  char v10;
  void *v11[2];
  char v12;
  void *__b[2];
  char v14;

  v5 = *(unsigned __int8 *)(a1 + 23);
  if ((v5 & 0x80u) != 0)
    v5 = *(_DWORD *)(a1 + 8);
  v6 = a2 - v5;
  if (a2 >= v5)
    v7 = a2 - v5;
  else
    v7 = v6 + 1;
  v8 = (v6 - (v7 >> 1));
  if ((int)v8 < 1)
    sub_1000091DC(__b, "");
  else
    sub_10000731C(__b, v8, 32);
  if (v6 < 2)
    sub_1000091DC(v11, "");
  else
    sub_10000731C(v11, (v7 >> 1), 32);
  sub_1000078A0((const void **)__b, (const void **)a1, (uint64_t)__p);
  sub_1000078A0((const void **)__p, (const void **)v11, a3);
  if (v10 < 0)
    operator delete(__p[0]);
  if (v12 < 0)
    operator delete(v11[0]);
  if (v14 < 0)
    operator delete(__b[0]);
}

void sub_100007578(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  if (a27 < 0)
    operator delete(a22);
  _Unwind_Resume(exception_object);
}

_BYTE *sub_1000075C4(_BYTE *result)
{
  int v1;
  uint64_t v2;
  int v3;

  if (!result || (v1 = *result, !*result))
  {
    fwrite("Fatal: NULL or empty line passed to rstrip().\n", 0x2EuLL, 1uLL, __stderrp);
    exit(-1);
  }
  v2 = 0;
  v3 = -1;
  while (1)
  {
    if (v1 == 32)
      goto LABEL_7;
    if (!v1)
      break;
    v3 = v2;
LABEL_7:
    v1 = result[++v2];
  }
  result[v3 + 1] = 0;
  return result;
}

uint64_t sub_100007638(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void **v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  size_t v12;
  const void *v13;
  size_t v14;
  const void *v15;
  size_t v16;
  int v17;
  _BOOL4 v18;

  v5 = (const void **)(a1 + 32);
  v6 = *(_QWORD *)(sub_100007718(a2, (const void **)(a1 + 32)) + 24);
  v7 = *(_QWORD *)(sub_100007718(a3, v5) + 24);
  if (v6 | v7)
  {
    v18 = v6 < v7;
  }
  else
  {
    v8 = sub_100007718(a2, v5);
    v9 = sub_100007718(a3, v5);
    v10 = *(char *)(v9 + 23);
    v11 = *(char *)(v8 + 23);
    if (v11 >= 0)
      v12 = *(unsigned __int8 *)(v8 + 23);
    else
      v12 = *(_QWORD *)(v8 + 8);
    if (v11 >= 0)
      v13 = (const void *)v8;
    else
      v13 = *(const void **)v8;
    if (v10 >= 0)
      v14 = *(unsigned __int8 *)(v9 + 23);
    else
      v14 = *(_QWORD *)(v9 + 8);
    if (v10 >= 0)
      v15 = (const void *)v9;
    else
      v15 = *(const void **)v9;
    if (v14 >= v12)
      v16 = v12;
    else
      v16 = v14;
    v17 = memcmp(v13, v15, v16);
    v18 = v12 < v14;
    if (v17)
      v18 = v17 < 0;
  }
  return (v18 ^ byte_100010128) & 1;
}

uint64_t sub_100007718(uint64_t a1, const void **a2)
{
  uint64_t v2;
  uint64_t v4;

  v2 = *sub_10000695C(a1, &v4, a2);
  if (!v2)
    sub_100008FD8("map::at:  key not found");
  return v2 + 56;
}

_QWORD *sub_100007754(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  __int128 v3;

  result = (_QWORD *)(a1 + 32);
  if (*(char *)(a2 + 55) < 0)
    return sub_10000904C(result, *(void **)(a2 + 32), *(_QWORD *)(a2 + 40));
  v3 = *(_OWORD *)(a2 + 32);
  result[2] = *(_QWORD *)(a2 + 48);
  *(_OWORD *)result = v3;
  return result;
}

void sub_100007784(uint64_t a1)
{
  if (*(char *)(a1 + 55) < 0)
    operator delete(*(void **)(a1 + 32));
}

_QWORD *sub_100007798(_QWORD *a1, unint64_t a2, _DWORD *a3)
{
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_100007818(a1, a2);
    v6 = (_DWORD *)a1[1];
    v7 = &v6[a2];
    v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_1000077FC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_100007818(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    sub_100007858();
  result = (char *)sub_10000786C((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void sub_100007858()
{
  sub_100006E1C("vector");
}

void *sub_10000786C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    sub_100006B5C();
  return operator new(4 * a2);
}

uint64_t sub_1000078A0@<X0>(const void **a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
{
  size_t v5;
  size_t v6;
  uint64_t result;
  char *v8;
  const void *v9;
  char *v10;
  const void *v11;

  if (*((char *)a1 + 23) >= 0)
    v5 = *((unsigned __int8 *)a1 + 23);
  else
    v5 = (size_t)a1[1];
  if (*((char *)a2 + 23) >= 0)
    v6 = *((unsigned __int8 *)a2 + 23);
  else
    v6 = (size_t)a2[1];
  result = sub_100006D84(a3, v6 + v5);
  if (*(char *)(result + 23) >= 0)
    v8 = (char *)result;
  else
    v8 = *(char **)result;
  if (v5)
  {
    if (*((char *)a1 + 23) >= 0)
      v9 = a1;
    else
      v9 = *a1;
    result = (uint64_t)memmove(v8, v9, v5);
  }
  v10 = &v8[v5];
  if (v6)
  {
    if (*((char *)a2 + 23) >= 0)
      v11 = a2;
    else
      v11 = *a2;
    result = (uint64_t)memmove(v10, v11, v6);
  }
  v10[v6] = 0;
  return result;
}

uint64_t sub_100007968(uint64_t a1, const void **a2)
{
  const void **v2;
  uint64_t v4;
  uint64_t v5;

  v2 = *(const void ***)(a1 + 8);
  if (v2)
  {
    v4 = a1 + 16;
    v5 = 1;
    do
    {
      if (!sub_100006AF4(v4, a2, v2 + 4))
      {
        if (!sub_100006AF4(v4, v2 + 4, a2))
          return v5;
        ++v2;
      }
      v2 = (const void **)*v2;
    }
    while (v2);
  }
  return 0;
}

void *sub_1000079E4(uint64_t a1)
{
  unint64_t v1;
  void *result;
  BOOL v3;

  if (a1 < 1)
    return 0;
  if (a1 >= 0x555555555555555)
    v1 = 0x555555555555555;
  else
    v1 = a1;
  while (1)
  {
    result = operator new(24 * v1, &std::nothrow);
    if (result)
      break;
    v3 = v1 > 1;
    v1 >>= 1;
    if (!v3)
      return 0;
  }
  return result;
}

void sub_100007A4C(uint64_t *a1, const void ***a2, uint64_t a3, unint64_t a4, uint64_t *a5, uint64_t a6)
{
  uint64_t v12;
  const void ***v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  uint64_t v17[2];
  unint64_t v18;

  if (a4 >= 2)
  {
    if (a4 == 2)
    {
      if ((*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
        sub_100008364(a1, (uint64_t)(a2 - 3));
    }
    else if ((uint64_t)a4 <= 0)
    {
      sub_100007C34((uint64_t)a1, a2, a3);
    }
    else
    {
      v12 = a4 >> 1;
      v13 = (const void ***)&a1[3 * (a4 >> 1)];
      if ((uint64_t)a4 <= a6)
      {
        v17[0] = (uint64_t)a5;
        v17[1] = (uint64_t)&v18;
        v18 = 0;
        sub_100007D38((const void ***)a1, (const void ***)&a1[3 * (a4 >> 1)], a3, a4 >> 1, a5);
        v18 = a4 >> 1;
        v15 = a4 - v12;
        v16 = &a5[3 * v12];
        sub_100007D38((const void ***)&a1[3 * (a4 >> 1)], a2, a3, v15, v16);
        v18 = a4;
        sub_100007EF0((uint64_t)a5, (const void ***)v16, (const void ***)v16, (const void ***)&a5[3 * a4], (uint64_t)a1, a3);
        sub_100008B84(v17, 0);
      }
      else
      {
        sub_100007A4C(a1, &a1[3 * (a4 >> 1)], a3, a4 >> 1, a5, a6);
        v14 = a4 - v12;
        sub_100007A4C(v13, a2, a3, v14, a5, a6);
        sub_100007FD4((uint64_t)a1, v13, a2, a3, v12, v14, (const void ***)a5, a6);
      }
    }
  }
}

void sub_100007C1C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_100008B84((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

void sub_100007C34(uint64_t a1, const void ***a2, uint64_t a3)
{
  const void ***v5;
  uint64_t v7;
  const void ***v8;
  uint64_t v9;
  uint64_t v10;
  const void **v11[3];

  if ((const void ***)a1 != a2)
  {
    v5 = (const void ***)(a1 + 24);
    if ((const void ***)(a1 + 24) != a2)
    {
      v7 = 0;
      do
      {
        v8 = v5;
        if ((*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
        {
          sub_100009650((uint64_t *)v11, v8);
          v9 = v7;
          while (1)
          {
            sub_1000083BC(a1 + v9 + 24, (const void ***)(a1 + v9));
            if (!v9)
              break;
            v9 -= 24;
            if (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) == 0)
            {
              v10 = a1 + v9 + 24;
              goto LABEL_10;
            }
          }
          v10 = a1;
LABEL_10:
          sub_1000083BC(v10, v11);
          sub_1000084A0((uint64_t)v11, v11[1]);
        }
        v5 = v8 + 3;
        v7 += 24;
      }
      while (v8 + 3 != a2);
    }
  }
}

void sub_100007D1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, _QWORD *a11)
{
  sub_1000084A0((uint64_t)&a10, a11);
  _Unwind_Resume(a1);
}

void sub_100007D38(const void ***a1, const void ***a2, uint64_t a3, unint64_t a4, uint64_t *a5)
{
  const void ***v10;
  uint64_t v11[2];
  uint64_t v12;

  if (a4)
  {
    if (a4 == 2)
    {
      v11[0] = (uint64_t)a5;
      v11[1] = (uint64_t)&v12;
      v12 = 0;
      v10 = a2 - 3;
      if ((*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
      {
        sub_100009650(a5, a2 - 3);
        v10 = a1;
      }
      else
      {
        sub_100009650(a5, a1);
      }
      ++v12;
      sub_100009650(a5 + 3, v10);
      v11[0] = 0;
      sub_100008B84(v11, 0);
    }
    else if (a4 == 1)
    {
      sub_100009650(a5, a1);
    }
    else if ((uint64_t)a4 > 8)
    {
      sub_100007A4C(a1, &a1[3 * (a4 >> 1)], a3, a4 >> 1, a5, a4 >> 1);
      sub_100007A4C(&a1[3 * (a4 >> 1)], a2, a3, a4 - (a4 >> 1), &a5[3 * (a4 >> 1)], a4 - (a4 >> 1));
      sub_100008A2C(a1, &a1[3 * (a4 >> 1)], &a1[3 * (a4 >> 1)], a2, (uint64_t)a5, a3);
    }
    else
    {
      sub_1000088B0(a1, a2, a5, a3);
    }
  }
}

void sub_100007ED8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_100008B84((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

uint64_t sub_100007EF0(uint64_t result, const void ***a2, const void ***a3, const void ***a4, uint64_t a5, uint64_t a6)
{
  const void ***v11;
  uint64_t v12;

  if ((const void ***)result == a2)
  {
LABEL_10:
    while (a3 != a4)
    {
      result = sub_1000083BC(a5, a3);
      a3 += 3;
      a5 += 24;
    }
  }
  else
  {
    v11 = (const void ***)result;
    while (a3 != a4)
    {
      if ((*(unsigned int (**)(void))(*(_QWORD *)a6 + 16))())
      {
        result = sub_1000083BC(a5, a3);
        a3 += 3;
      }
      else
      {
        result = sub_1000083BC(a5, v11);
        v11 += 3;
      }
      a5 += 24;
      if (v11 == a2)
        goto LABEL_10;
    }
    if (v11 != a2)
    {
      v12 = 0;
      do
      {
        result = sub_1000083BC(a5 + v12 * 8, &v11[v12]);
        v12 += 3;
      }
      while (&v11[v12] != a2);
    }
  }
  return result;
}

void sub_100007FD4(uint64_t a1, const void ***a2, const void ***a3, uint64_t a4, uint64_t a5, uint64_t a6, const void ***a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  int v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const void ***v37;
  const void ***v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v43 = a6;
  if (a6)
  {
    do
    {
      if (v43 <= a8 || a5 <= a8)
      {
        sub_100008BE0(a1, a2, a3, a4, a5, v43, a7);
        return;
      }
      if (!a5)
        return;
      v11 = 0;
      v12 = -a5;
      while (1)
      {
        v13 = a1;
        v14 = (uint64_t *)(a1 + v11);
        v15 = (uint64_t)a2;
        if (((*(uint64_t (**)(void))(*(_QWORD *)a4 + 16))() & 1) != 0)
          break;
        v11 += 24;
        v16 = __CFADD__(v12++, 1);
        a1 = v13;
        a2 = (const void ***)v15;
        if (v16)
          return;
      }
      v17 = -v12;
      v18 = v43;
      if (-v12 >= v43)
      {
        if (v12 == -1)
        {
          sub_100008364((uint64_t *)(v13 + v11), v15);
          return;
        }
        if (v12 > 0)
          v17 = 1 - v12;
        v22 = v13;
        v39 = v17 >> 1;
        v23 = (uint64_t *)(v13 + 24 * (v17 >> 1) + v11);
        v20 = v15;
        v21 = v15;
        if ((const void ***)v15 != a3)
        {
          v45 = *(_QWORD *)a4;
          v47 = a4;
          v28 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)a3 - v15) >> 3);
          v21 = v15;
          do
          {
            v29 = v21 + 24 * (v28 >> 1);
            v30 = v21;
            v31 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t *))(v45 + 16))(v45, v29, v23);
            if (v31)
              v28 += ~(v28 >> 1);
            else
              v28 >>= 1;
            if (v31)
              v21 = v29 + 24;
            else
              v21 = v30;
          }
          while (v28);
          a4 = v47;
          v18 = v43;
          v22 = v13;
          v20 = v15;
        }
        v44 = 0xAAAAAAAAAAAAAAABLL * ((v21 - v20) >> 3);
        v27 = v39;
      }
      else
      {
        if (v43 >= 0)
          v19 = v43;
        else
          v19 = v43 + 1;
        v20 = v15;
        v44 = v19 >> 1;
        v21 = v15 + 24 * (v19 >> 1);
        v22 = v13;
        v23 = (uint64_t *)v15;
        if (v15 - v13 != v11)
        {
          v40 = a8;
          v46 = a4;
          v24 = 0xAAAAAAAAAAAAAAABLL * ((v15 - v13 - v11) >> 3);
          v23 = v14;
          do
          {
            v25 = v21;
            v26 = (*(uint64_t (**)(void))(*(_QWORD *)v46 + 16))();
            v21 = v25;
            if (v26)
            {
              v24 >>= 1;
            }
            else
            {
              v23 += 3 * (v24 >> 1) + 3;
              v24 += ~(v24 >> 1);
            }
          }
          while (v24);
          a4 = v46;
          a8 = v40;
          v18 = v43;
          v22 = v13;
          v20 = v15;
        }
        v27 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v23 - v22 - v11) >> 3);
      }
      if (v23 == (uint64_t *)v20)
      {
        v34 = v21;
      }
      else if (v21 == v20)
      {
        v34 = (uint64_t)v23;
      }
      else
      {
        v32 = v21;
        v33 = sub_100008F24(v23, v20, v21);
        v21 = v32;
        v18 = v43;
        v34 = (uint64_t)v33;
        v22 = v13;
      }
      a5 = -(uint64_t)v27 - v12;
      v35 = v18 - v44;
      if ((uint64_t)(v27 + v44) >= (uint64_t)(v18 - (v27 + v44) - v12))
      {
        v38 = (const void ***)v34;
        sub_100007FD4(v34, v21, a3, a4, -(uint64_t)v27 - v12, v18 - v44, a7, a8);
        a2 = (const void ***)v23;
        v35 = v44;
        a5 = v27;
        a3 = v38;
      }
      else
      {
        v36 = v22 + v11;
        v37 = (const void ***)v21;
        v14 = (uint64_t *)v34;
        sub_100007FD4(v36, v23, v34, a4, v27, v44, a7, a8);
        a2 = v37;
      }
      v43 = v35;
      a1 = (uint64_t)v14;
    }
    while (v35);
  }
}

uint64_t *sub_100008364(uint64_t *result, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = *result;
  *result = *(_QWORD *)a2;
  *(_QWORD *)a2 = v2;
  v5 = result[1];
  v4 = result[2];
  v3 = result + 1;
  *(_OWORD *)(result + 1) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = v5;
  *(_QWORD *)(a2 + 16) = v4;
  if (result[2])
    result = (uint64_t *)(*v3 + 16);
  *result = (uint64_t)v3;
  v6 = (_QWORD *)(*(_QWORD *)(a2 + 8) + 16);
  if (!v4)
    v6 = (_QWORD *)a2;
  *v6 = a2 + 8;
  return result;
}

uint64_t sub_1000083BC(uint64_t a1, const void ***a2)
{
  _QWORD *v4;

  if ((const void ***)a1 != a2)
  {
    v4 = (_QWORD *)(a1 + 8);
    sub_1000084A0(a1, *(_QWORD **)(a1 + 8));
    *(_QWORD *)a1 = v4;
    *(_QWORD *)(a1 + 16) = 0;
    *v4 = 0;
    sub_10000841C((uint64_t *)a1, *a2, a2 + 1);
  }
  return a1;
}

uint64_t *sub_10000841C(uint64_t *result, const void **a2, const void ***a3)
{
  const void **v4;
  uint64_t **v5;
  uint64_t *v6;
  const void **v7;
  const void ***v8;
  BOOL v9;

  if (a2 != (const void **)a3)
  {
    v4 = a2;
    v5 = (uint64_t **)result;
    v6 = result + 1;
    do
    {
      result = sub_100008538(v5, v6, v4 + 4, (__int128 *)v4 + 2);
      v7 = (const void **)v4[1];
      if (v7)
      {
        do
        {
          v8 = (const void ***)v7;
          v7 = (const void **)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (const void ***)v4[2];
          v9 = *v8 == v4;
          v4 = (const void **)v8;
        }
        while (!v9);
      }
      v4 = (const void **)v8;
    }
    while (v8 != a3);
  }
  return result;
}

void sub_1000084A0(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    sub_1000084A0(a1, *a2);
    sub_1000084A0(a1, a2[1]);
    sub_1000084F4((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void sub_1000084F4(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t *sub_100008538(uint64_t **a1, uint64_t *a2, const void **a3, __int128 *a4)
{
  uint64_t **v6;
  uint64_t *result;
  uint64_t *v8;
  uint64_t v9;
  const void **v10;

  v6 = (uint64_t **)sub_1000085B8(a1, a2, &v10, &v9, a3);
  result = *v6;
  if (!*v6)
  {
    sub_100008750((uint64_t)a1, a4, (uint64_t)&v8);
    sub_100006AA0(a1, (uint64_t)v10, v6, v8);
    return v8;
  }
  return result;
}

const void **sub_1000085B8(_QWORD *a1, uint64_t *a2, const void ***a3, uint64_t *a4, const void **a5)
{
  const void **v9;
  const void **v11;
  const void **v12;
  uint64_t v13;
  const void **v14;
  const void **v15;
  uint64_t *v16;
  BOOL v17;
  const void **v18;

  v9 = (const void **)(a1 + 1);
  if (a1 + 1 == a2 || sub_100006AF4((uint64_t)(a1 + 2), a5, (const void **)a2 + 4))
  {
    if ((uint64_t *)*a1 == a2)
    {
      v12 = (const void **)a2;
LABEL_16:
      if (*a2)
      {
        *a3 = v12;
        return v12 + 1;
      }
      else
      {
        *a3 = (const void **)a2;
        return (const void **)a2;
      }
    }
    v11 = (const void **)*a2;
    if (*a2)
    {
      do
      {
        v12 = v11;
        v11 = (const void **)v11[1];
      }
      while (v11);
    }
    else
    {
      v16 = a2;
      do
      {
        v12 = (const void **)v16[2];
        v17 = *v12 == v16;
        v16 = (uint64_t *)v12;
      }
      while (v17);
    }
    if (sub_100006AF4((uint64_t)(a1 + 2), v12 + 4, a5))
      goto LABEL_16;
    return (const void **)sub_10000695C((uint64_t)a1, a3, a5);
  }
  if (sub_100006AF4((uint64_t)(a1 + 2), (const void **)a2 + 4, a5))
  {
    a4 = a2 + 1;
    v13 = a2[1];
    if (v13)
    {
      v14 = (const void **)a2[1];
      do
      {
        v15 = v14;
        v14 = (const void **)*v14;
      }
      while (v14);
    }
    else
    {
      v18 = (const void **)a2;
      do
      {
        v15 = (const void **)v18[2];
        v17 = *v15 == v18;
        v18 = v15;
      }
      while (!v17);
    }
    if (v15 != v9)
    {
      if (!sub_100006AF4((uint64_t)(a1 + 2), a5, v15 + 4))
        return (const void **)sub_10000695C((uint64_t)a1, a3, a5);
      v13 = *a4;
    }
    if (v13)
    {
      *a3 = v15;
      return v15;
    }
    else
    {
      *a3 = (const void **)a2;
    }
    return (const void **)a4;
  }
  *a3 = (const void **)a2;
  *a4 = (uint64_t)a2;
  return (const void **)a4;
}

char *sub_100008750@<X0>(uint64_t a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  char *result;

  v5 = a1 + 8;
  v6 = (char *)operator new(0x58uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  result = sub_1000087D0(v6 + 32, a2);
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_1000087B4(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  *v1 = 0;
  sub_10000886C(v3, v2);
  _Unwind_Resume(a1);
}

char *sub_1000087D0(char *__dst, __int128 *a2)
{
  __int128 v4;
  _BYTE *v5;
  __int128 v6;

  if (*((char *)a2 + 23) < 0)
  {
    sub_10000904C(__dst, *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    *((_QWORD *)__dst + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)__dst = v4;
  }
  v5 = __dst + 24;
  if (*((char *)a2 + 47) < 0)
  {
    sub_10000904C(v5, *((void **)a2 + 3), *((_QWORD *)a2 + 4));
  }
  else
  {
    v6 = *(__int128 *)((char *)a2 + 24);
    *((_QWORD *)__dst + 5) = *((_QWORD *)a2 + 5);
    *(_OWORD *)v5 = v6;
  }
  *((_QWORD *)__dst + 6) = *((_QWORD *)a2 + 6);
  return __dst;
}

void sub_100008850(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_10000886C(uint64_t a1, void *__p)
{
  if (*(_BYTE *)(a1 + 8))
    sub_1000084F4((uint64_t)__p + 32);
  if (__p)
    operator delete(__p);
}

void sub_1000088B0(const void ***a1, const void ***a2, uint64_t *a3, uint64_t a4)
{
  const void ***v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13[2];
  uint64_t v14;

  if (a1 != a2)
  {
    v13[0] = (uint64_t)a3;
    v13[1] = (uint64_t)&v14;
    v14 = 0;
    sub_100009650(a3, a1);
    ++v14;
    v8 = a1 + 3;
    if (v8 != a2)
    {
      v9 = 0;
      v10 = a3;
      do
      {
        if ((*(unsigned int (**)(void))(*(_QWORD *)a4 + 16))())
        {
          sub_100009650(v10 + 3, (const void ***)v10);
          ++v14;
          v11 = (uint64_t)a3;
          if (v10 != a3)
          {
            v12 = v9;
            while ((*(unsigned int (**)(void))(*(_QWORD *)a4 + 16))())
            {
              sub_1000083BC((uint64_t)a3 + v12, (const void ***)((char *)a3 + v12 - 24));
              v12 -= 24;
              if (!v12)
              {
                v11 = (uint64_t)a3;
                goto LABEL_12;
              }
            }
            v11 = (uint64_t)a3 + v12;
          }
LABEL_12:
          sub_1000083BC(v11, v8);
        }
        else
        {
          sub_100009650(v10 + 3, v8);
          ++v14;
        }
        v8 += 3;
        v9 += 24;
        v10 += 3;
      }
      while (v8 != a2);
    }
    v13[0] = 0;
    sub_100008B84(v13, 0);
  }
}

void sub_100008A0C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_100008B84((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

void sub_100008A2C(const void ***a1, const void ***a2, const void ***a3, const void ***a4, uint64_t a5, uint64_t a6)
{
  uint64_t *v6;
  const void ***v11;
  uint64_t v12;
  uint64_t v13[2];
  uint64_t v14;

  v6 = (uint64_t *)a5;
  v13[0] = a5;
  v13[1] = (uint64_t)&v14;
  v14 = 0;
  if (a1 == a2)
  {
LABEL_10:
    while (a3 != a4)
    {
      sub_100009650(v6, a3);
      a3 += 3;
      v6 += 3;
      ++v14;
    }
  }
  else
  {
    v11 = a1;
    while (a3 != a4)
    {
      if ((*(unsigned int (**)(void))(*(_QWORD *)a6 + 16))())
      {
        sub_100009650(v6, a3);
        ++v14;
        a3 += 3;
      }
      else
      {
        sub_100009650(v6, v11);
        ++v14;
        v11 += 3;
      }
      v6 += 3;
      if (v11 == a2)
        goto LABEL_10;
    }
    if (v11 != a2)
    {
      v12 = 0;
      do
      {
        sub_100009650(&v6[v12], &v11[v12]);
        ++v14;
        v12 += 3;
      }
      while (&v11[v12] != a2);
    }
  }
  v13[0] = 0;
  sub_100008B84(v13, 0);
}

void sub_100008B64(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_100008B84((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

void sub_100008B84(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    v3 = (unint64_t *)a1[1];
    if (*v3)
    {
      v4 = 0;
      do
      {
        sub_1000084A0(v2, *(_QWORD **)(v2 + 8));
        ++v4;
        v2 += 24;
      }
      while (v4 < *v3);
    }
  }
}

void sub_100008BE0(uint64_t a1, const void ***a2, const void ***a3, uint64_t a4, uint64_t a5, uint64_t a6, const void ***a7)
{
  uint64_t *v12;
  const void ***v13;
  uint64_t *v14;
  uint64_t *v15;
  const void ***v16;
  uint64_t v17;
  uint64_t v18[2];
  uint64_t v19;

  v18[0] = (uint64_t)a7;
  v18[1] = (uint64_t)&v19;
  v19 = 0;
  if (a5 <= a6)
  {
    v15 = (uint64_t *)a7;
    if ((const void ***)a1 != a2)
    {
      v15 = (uint64_t *)a7;
      v16 = (const void ***)a1;
      do
      {
        sub_100009650(v15, v16);
        ++v19;
        v16 += 3;
        v15 += 3;
      }
      while (v16 != a2);
    }
    sub_100008D34(a7, (const void ***)v15, a2, a3, a1, a4);
  }
  else
  {
    v12 = (uint64_t *)a7;
    if (a2 != a3)
    {
      v12 = (uint64_t *)a7;
      v13 = a2;
      do
      {
        v14 = sub_100009650(v12, v13);
        ++v19;
        v13 += 3;
        v12 = v14 + 3;
      }
      while (v13 != a3);
    }
    v17 = a4;
    sub_100008E00((uint64_t)v12, (uint64_t)v12, (uint64_t)a7, (uint64_t)a7, (uint64_t)a2, (uint64_t)a2, a1, a1, (uint64_t)a3, (uint64_t)a3, (uint64_t)&v17);
  }
  sub_100008B84(v18, 0);
}

void sub_100008D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  sub_100008B84((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

const void ***sub_100008D34(const void ***result, const void ***a2, const void ***a3, const void ***a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  const void ***v11;
  uint64_t v12;

  if (result != a2)
  {
    v7 = a5;
    v11 = result;
    v12 = a5;
    while (a3 != a4)
    {
      if ((*(unsigned int (**)(void))(*(_QWORD *)a6 + 16))())
      {
        result = (const void ***)sub_1000083BC(v12, a3);
        a3 += 3;
      }
      else
      {
        result = (const void ***)sub_1000083BC(v12, v11);
        v11 += 3;
      }
      v12 += 24;
      v7 += 24;
      if (v11 == a2)
        return result;
    }
    return sub_100008EC0(v11, a2, v7);
  }
  return result;
}

void sub_100008E00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v14;
  uint64_t v15;
  int v16;
  const void ***v17;
  uint64_t v18;
  uint64_t v19;

  if (a2 != a4)
  {
    v14 = a2;
    v15 = a10 - 24;
    while (a6 != a8)
    {
      v16 = (*(uint64_t (**)(void))(**(_QWORD **)a11 + 16))();
      if (v16)
        v17 = (const void ***)(a6 - 24);
      else
        v17 = (const void ***)(v14 - 24);
      if (v16)
        a6 -= 24;
      else
        v14 -= 24;
      sub_1000083BC(v15, v17);
      v15 -= 24;
      if (v14 == a4)
        return;
    }
    v18 = 0;
    do
    {
      v19 = v15 + v18;
      v18 -= 24;
      sub_1000083BC(v19, (const void ***)(v14 + v18));
    }
    while (v14 + v18 != a4);
  }
}

const void ***sub_100008EC0(const void ***a1, const void ***a2, uint64_t a3)
{
  uint64_t v3;
  const void ***v4;
  uint64_t v6;

  v3 = a3;
  v4 = a1;
  if (a1 != a2)
  {
    v6 = a3;
    do
    {
      sub_1000083BC(v6, v4);
      v4 += 3;
      v6 += 24;
      v3 += 24;
    }
    while (v4 != a2);
    return a2;
  }
  return v4;
}

uint64_t *sub_100008F24(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t *v6;
  uint64_t i;
  uint64_t *v8;
  uint64_t v9;

  v4 = (uint64_t *)a2;
  sub_100008364(a1, a2);
  v6 = a1 + 3;
  for (i = (uint64_t)(v4 + 3); i != a3; i += 24)
  {
    if (v6 == v4)
      v4 = (uint64_t *)i;
    sub_100008364(v6, i);
    v6 += 3;
  }
  if (v6 != v4)
  {
    v8 = v6;
    v9 = (uint64_t)v4;
    do
    {
      while (1)
      {
        sub_100008364(v8, v9);
        v8 += 3;
        v9 += 24;
        if (v9 == a3)
          break;
        if (v8 == v4)
          v4 = (uint64_t *)v9;
      }
      v9 = (uint64_t)v4;
    }
    while (v8 != v4);
  }
  return v6;
}

void sub_100008FD8(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100009028(exception, a1);
}

void sub_100009014(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100009028(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_10000904C(_BYTE *__dst, void *__src, unint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      sub_100006E08();
    v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17)
      v6 = a3 | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *v5 = v8;
    v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

void sub_1000090D8(void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    sub_100009118((uint64_t *)v2);
    operator delete(**a1);
  }
}

void sub_100009118(uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 32)
  {
    if (*(char *)(i - 9) < 0)
      operator delete(*(void **)(i - 32));
  }
  a1[1] = v2;
}

void sub_100009164(void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  char *v6;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v6 = v4 - 24;
        sub_1000084A0((uint64_t)(v4 - 24), *((_QWORD **)v4 - 2));
        v4 = v6;
      }
      while (v6 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

_QWORD *sub_1000091DC(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_100006E08();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

_QWORD *sub_10000928C(_QWORD *result, __int128 *a2)
{
  _QWORD *v3;
  uint64_t v4;
  __int128 v5;

  v3 = result;
  v4 = result[1];
  if (*((char *)a2 + 23) < 0)
  {
    result = sub_10000904C((_BYTE *)result[1], *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v5 = *a2;
    *(_QWORD *)(v4 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v4 = v5;
  }
  *(_QWORD *)(v4 + 24) = *((_QWORD *)a2 + 3);
  v3[1] = v4 + 32;
  return result;
}

void sub_1000092F0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_1000092F8(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  char *v11;
  __int128 v12;
  uint64_t v13;
  _QWORD v15[2];
  char *v16;
  char *v17;
  uint64_t *v18;

  v3 = *a1;
  v4 = (a1[1] - *a1) >> 5;
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 59)
    sub_100007858();
  v7 = (uint64_t)(a1 + 2);
  v8 = a1[2] - v3;
  if (v8 >> 4 > v5)
    v5 = v8 >> 4;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFE0)
    v9 = 0x7FFFFFFFFFFFFFFLL;
  else
    v9 = v5;
  v18 = a1 + 2;
  if (v9)
    v10 = sub_10000947C(v7, v9);
  else
    v10 = 0;
  v11 = (char *)&v10[4 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v16 = v11;
  v17 = (char *)&v10[4 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    sub_10000904C(v11, *(void **)a2, *((_QWORD *)a2 + 1));
    v11 = v16;
  }
  else
  {
    v12 = *a2;
    *((_QWORD *)v11 + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v11 = v12;
  }
  v10[4 * v4 + 3] = *((_QWORD *)a2 + 3);
  v16 = v11 + 32;
  sub_100009408(a1, v15);
  v13 = a1[1];
  sub_1000095C8((uint64_t)v15);
  return v13;
}

void sub_1000093F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1000095C8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_100009408(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_1000094B0((uint64_t)(a1 + 2), a1[1], (__int128 *)a1[1], *a1, (__int128 *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_10000947C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    sub_100006B5C();
  return operator new(32 * a2);
}

uint64_t sub_1000094B0(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, __int128 *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  void **v9;
  _BYTE *v10;
  __int128 *v11;
  __int128 v12;
  uint64_t v14;
  uint64_t v15;

  v7 = a7;
  v14 = a6;
  v15 = a7;
  if (a3 != a5)
  {
    v9 = (void **)a3;
    do
    {
      v10 = (_BYTE *)(v7 - 32);
      v11 = (__int128 *)(v9 - 4);
      if (*((char *)v9 - 9) < 0)
      {
        sub_10000904C(v10, *(v9 - 4), (unint64_t)*(v9 - 3));
      }
      else
      {
        v12 = *v11;
        *(_QWORD *)(v7 - 16) = *(v9 - 2);
        *(_OWORD *)v10 = v12;
      }
      *(_QWORD *)(v7 - 8) = *(v9 - 1);
      v7 = v15 - 32;
      v15 -= 32;
      v9 -= 4;
    }
    while (v11 != a5);
    return v14;
  }
  return a6;
}

void sub_100009564(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  if (!a12)
    sub_100009584((uint64_t)&a9);
  _Unwind_Resume(exception_object);
}

void sub_100009584(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 32;
  }
}

uint64_t sub_1000095C8(uint64_t a1)
{
  sub_1000095FC(a1, *(void ***)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void sub_1000095FC(uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 4;
      *(_QWORD *)(a1 + 16) = v2 - 4;
      if (*((char *)v2 - 9) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

uint64_t *sub_100009650(uint64_t *a1, const void ***a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  sub_10000841C(a1, *a2, a2 + 1);
  return a1;
}

void sub_10000968C(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1000084A0(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t sub_1000096A4(uint64_t *a1, const void ***a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  void *v13;
  uint64_t *v14;
  uint64_t *v15;
  char *v16;
  uint64_t *v17;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    sub_100007858();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v17 = a1 + 2;
  if (v9)
    v10 = (char *)sub_100009820(v7, v9);
  else
    v10 = 0;
  v13 = v10;
  v14 = (uint64_t *)&v10[24 * v4];
  v16 = &v10[24 * v9];
  sub_100009650(v14, a2);
  v15 = v14 + 3;
  sub_1000097AC(a1, &v13);
  v11 = a1[1];
  sub_1000098F8(&v13);
  return v11;
}

void sub_100009794(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1000098F8((void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1000097AC(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_100009864((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_100009820(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    sub_100006B5C();
  return operator new(24 * a2);
}

uint64_t sub_100009864(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;

  v10 = 0;
  v11 = a7 - 24;
  while (a3 + v10 != a5)
  {
    v12 = (uint64_t *)(v11 + v10);
    v10 -= 24;
    sub_100009650(v12, (const void ***)(v10 + a3));
  }
  return a6;
}

void **sub_1000098F8(void **a1)
{
  sub_100009928((uint64_t)a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void sub_100009928(uint64_t a1)
{
  uint64_t i;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v2; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 24;
    sub_1000084A0(i - 24, *(_QWORD **)(i - 16));
  }
}

__n128 sub_10000996C()
{
  __n128 result;

  byte_100010080 = os_variant_has_internal_content("com.apple.perfutils");
  qword_100010090 = 0;
  unk_100010098 = 0;
  qword_100010088 = 0;
  __cxa_atexit((void (*)(void *))sub_100001110, &qword_100010088, (void *)&_mh_execute_header);
  qword_1000100A8 = 0;
  unk_1000100B0 = 0;
  qword_1000100A0 = 0;
  __cxa_atexit((void (*)(void *))sub_100001144, &qword_1000100A0, (void *)&_mh_execute_header);
  result.n128_u64[0] = -1;
  result.n128_u64[1] = -1;
  xmmword_1000100C0 = (__int128)result;
  *(__n128 *)&dword_1000100D0 = result;
  xmmword_1000100E0 = (__int128)result;
  *(__int128 *)((char *)&xmmword_1000100E0 + 12) = (__int128)result;
  return result;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

id objc_msgSend_assertions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assertions");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentState");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_evaluateWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluateWithObject:");
}

id objc_msgSend_handleForIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleForIdentifier:error:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}
