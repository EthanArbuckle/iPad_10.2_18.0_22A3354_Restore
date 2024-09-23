uint64_t start(int a1, char *const *a2)
{
  int v4;
  BOOL v5;
  int v6;
  int v7;
  int v8;
  char *v9;
  int v10;
  BOOL v11;
  int v12;
  const char *v13;
  unint64_t v14;
  int v15;
  _BOOL4 v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  kern_return_t v21;
  mach_port_t v22;
  kern_return_t v23;
  mach_port_t v24;
  kern_return_t v25;
  size_t v26;
  mach_msg_type_number_t v27;
  uint64_t v28;
  CFMutableDictionaryRef Mutable;
  FILE *v30;
  const char *v31;
  size_t v32;
  int *v33;
  unint64_t v34;
  int *v35;
  mach_error_t v36;
  mach_msg_type_number_t v37;
  _BOOL4 v38;
  unint64_t v39;
  uint64_t v40;
  int v41;
  char *v42;
  char v43;
  mach_error_t v44;
  mach_error_t v45;
  mach_error_t v46;
  mach_error_t v47;
  mach_error_t v48;
  mach_error_t v49;
  mach_error_t v50;
  mach_error_t v51;
  mach_error_t v52;
  mach_error_t v53;
  const char *v54;
  char v55;
  char v56;
  char v57;
  char *v58;
  char *v59;
  char *v60;
  uint64_t v61;
  BOOL v62;
  const char *v63;
  const char *v64;
  const char *v65;
  const char *v66;
  const char *v67;
  const char *v68;
  const char *v69;
  const char *v70;
  const char *v71;
  int v72;
  __int128 v73;
  double v74;
  const char *v75;
  uint64_t v76;
  double v77;
  const char *v78;
  double v79;
  const char *v80;
  double v81;
  const char *v82;
  double v83;
  const char *v84;
  time_t v85;
  char *v86;
  double v87;
  double v88;
  double v89;
  char v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  double v95;
  const char *v96;
  double v97;
  const char *v98;
  double v99;
  const char *v100;
  double v101;
  const char *v102;
  double v103;
  int64x2_t v104;
  char v105;
  const char *v106;
  const char *v107;
  const char *v108;
  const __CFArray *v109;
  const __CFArray *v110;
  CFIndex v111;
  const char *ValueAtIndex;
  unsigned int v113;
  const char *v114;
  unint64_t v115;
  const char *v116;
  unsigned int v117;
  BOOL v118;
  const char *v119;
  unsigned int v120;
  BOOL v121;
  const char *v122;
  unsigned int v123;
  BOOL v124;
  const char *v125;
  uint64_t v126;
  const char *v127;
  const char *v128;
  const char *v129;
  const char *v130;
  unsigned int v131;
  const char *v132;
  unsigned int v133;
  const char *v134;
  unsigned int v135;
  const char *v136;
  const char *v137;
  const char *v138;
  const char *v139;
  unsigned int v140;
  const char *v141;
  unsigned int v142;
  BOOL v143;
  const char *v144;
  unsigned int v145;
  BOOL v146;
  const char *v147;
  const char *v148;
  int v149;
  const char *v150;
  const char *v151;
  uint64_t v152;
  const char *v153;
  int v154;
  const char *v155;
  const char *v156;
  const char *v157;
  const char *v158;
  const char *v159;
  int v160;
  int v161;
  int v162;
  int v163;
  const char *v164;
  const char *v165;
  const char *v166;
  const char *v167;
  const char *v168;
  const char *v169;
  unint64_t v170;
  mach_error_t v171;
  mach_error_t v172;
  int v173;
  kern_return_t v174;
  mach_error_t v175;
  const char *v176;
  kern_return_t v177;
  mach_error_t v178;
  const char *v179;
  kern_return_t v180;
  mach_error_t v181;
  mach_error_t v182;
  mach_error_t v183;
  mach_error_t v184;
  mach_error_t v185;
  unsigned int v186;
  unint64_t v187;
  int v188;
  uint64_t v189;
  int64x2_t v190;
  uint64_t v191;
  uint64_t *v192;
  int64x2_t v193;
  uint64_t v194;
  kern_return_t v195;
  uint64_t v196;
  __int128 *v197;
  __int128 v198;
  const char *v199;
  const char *v200;
  const char *v201;
  unsigned int v202;
  const char *v203;
  unsigned int v204;
  const char *v205;
  uint64_t v206;
  const char *v207;
  unsigned int v208;
  const char *v209;
  uint64_t v210;
  const char *v211;
  unsigned int v212;
  const char *v213;
  unsigned int v214;
  BOOL v215;
  const char *v216;
  unsigned int v217;
  BOOL v218;
  const char *v219;
  const char *v220;
  const char *v221;
  const char *v222;
  unsigned int v223;
  const char *v224;
  unsigned int v225;
  const char *v226;
  int v227;
  const char *v228;
  int v229;
  const char *v230;
  unsigned int v231;
  BOOL v232;
  const char *v233;
  unsigned int v234;
  BOOL v235;
  const char *v236;
  const char *v237;
  int v238;
  const char *v239;
  const char *v240;
  const char *v241;
  const char *v242;
  const char *v243;
  mach_error_t mach_voucher;
  mach_port_name_t v245;
  kern_return_t v246;
  uint64_t v247;
  const char *v248;
  const char *v249;
  uint64_t v250;
  kern_return_t v251;
  mach_msg_type_number_t j;
  _DWORD *v253;
  int v254;
  uint64_t v255;
  _DWORD *v256;
  int v257;
  unsigned int v258;
  size_t v259;
  char *v260;
  size_t v261;
  FILE *v262;
  FILE *v263;
  int v264;
  int (__cdecl *v265)(const void *, const void *);
  uint64_t v266;
  _BOOL4 v267;
  int v268;
  const char *v269;
  char *v270;
  unsigned int v271;
  const char *v272;
  _BOOL4 v273;
  uint64_t v274;
  const char *v275;
  char *v276;
  int v277;
  int *v278;
  int v279;
  int v280;
  int *v281;
  task_policy_get_t *v282;
  uint64_t v283;
  int v284;
  task_policy_get_t v285;
  mach_error_t v286;
  int v287;
  const char *v288;
  unsigned int v289;
  int v290;
  const char *v291;
  char *v292;
  char *v293;
  char *v294;
  char *v295;
  void *v296;
  char *v297;
  char *v298;
  unint64_t v299;
  uint64_t v301;
  int v302;
  int v303;
  char *v304;
  int v305;
  int64x2_t v306;
  char *v307;
  __int128 v308;
  FILE *v309;
  FILE *v310;
  uint64_t stackshot_buffer;
  unint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  _DWORD *v317;
  char v318;
  uint64_t v319;
  uint64_t v320;
  int v321;
  int v322;
  unint64_t v323;
  unsigned int v324;
  uint64_t i;
  const void *v326;
  void *Value;
  unsigned int v328;
  BOOL v329;
  unsigned int v330;
  FILE *v331;
  const char *v332;
  size_t v333;
  mach_error_t v334;
  const char *v335;
  BOOL v336;
  uint64_t v337;
  char *v338;
  int64x2_t v339;
  uint64_t v340;
  uint64_t v341;
  void *key;
  int v343;
  char *v344;
  const __CFDictionary *cf;
  int v346;
  BOOL v347;
  char *__s1;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  int64x2_t v355;
  int v356;
  int64x2_t v357;
  int *v358;
  uint64_t v359;
  char v360;
  char v361;
  unint64_t v362;
  task_array_t v363;
  unint64_t v364;
  int pid[2];
  int pida[2];
  int pidb[2];
  char v368;
  size_t v369;
  BOOL v370;
  _BOOL4 v371;
  int v372;
  int v373;
  int v374;
  BOOL v375;
  void *v376;
  ipc_voucher_t voucher;
  int64x2_t object_type;
  int64x2_t v379;
  uint64_t v380;
  BOOLean_t v381;
  BOOLean_t get_default;
  vm_size_t outsize;
  integer_t v384[4];
  __int128 v385;
  __int128 v386;
  __int128 v387;
  integer_t v388[2];
  uint64_t v389;
  uint64_t v390;
  integer_t v391[2];
  uint64_t v392;
  uint64_t v393;
  int v394;
  uint64_t v395[2];
  vm_address_t v396;
  __int128 thread_info_out;
  __int128 v398;
  uint64_t v399;
  int x[2];
  thread_act_array_t act_list;
  uint32_t flags;
  uint64_t v403;
  uint64_t v404;
  _QWORD v405[5];
  uint64_t v406;
  __int128 policy_info;
  __int128 v408;
  __int128 v409;
  __int128 v410;
  uint64_t v411;
  uint64_t v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  __int128 v416;
  __int128 v417;
  __int128 v418;
  __int128 v419;
  __int128 v420;
  unint64_t v421;
  uint64_t v422;
  uint64_t v423;
  __int128 task_info_out;
  __int128 v425;
  uint64_t v426;
  __int128 v427;
  __int128 v428;
  ipc_info_space_basic_t basic_info;
  mach_msg_type_number_t task_info_outCnt;
  mach_msg_type_number_t task_listCnt;
  task_array_t task_list;
  _DWORD size[3];
  uint64_t v434;
  size_t v435;
  processor_set_t set;
  processor_set_name_t default_set;
  mach_msg_type_number_t recipesCnt;
  __int128 v439;
  int64x2_t v440;
  __int128 v441;
  __int128 v442;
  __int128 v443;
  __int128 v444;
  __int128 v445;
  _DWORD v446[16];
  char v447;
  char out[48];
  __int128 v449;
  int64x2_t v450;
  __int128 v451;
  __int128 v452;
  __int128 v453;
  __int128 v454;
  __int128 v455;
  __int128 v456;
  __int128 v457;
  __int128 v458;
  __int128 v459;
  __int128 v460;
  __int128 v461;
  __int128 v462;
  __int128 v463;
  _OWORD v464[2];
  __int128 v465;
  __int128 v466;
  int64x2_t v467;
  __int128 v468;
  __int128 v469;
  __int128 v470;
  __int128 v471;
  __int128 v472;
  __int128 v473;
  __int128 v474;
  __int128 v475;
  __int128 v476;
  __int128 uu;
  __int128 v478;
  __int128 v479;
  uint64_t v480;
  size_t buffer[6];
  __int128 v482;
  _BYTE v483[48];
  __int128 v484;
  uint64_t v485;
  __int128 v486;
  __int128 v487;
  _QWORD v488[4];
  option v489;
  const char *v490;
  int v491;
  uint64_t *v492;
  int v493;
  const char *v494;
  int v495;
  _DWORD *v496;
  int v497;
  const char *v498;
  int v499;
  _DWORD *v500;
  int v501;
  const char *v502;
  int v503;
  uint64_t v504;
  int v505;
  const char *v506;
  int v507;
  uint64_t v508;
  int v509;
  const char *v510;
  int v511;
  uint64_t v512;
  int v513;
  const char *v514;
  int v515;
  uint64_t v516;
  int v517;
  const char *v518;
  int v519;
  uint64_t v520;
  int v521;
  const char *v522;
  int v523;
  uint64_t v524;
  int v525;
  const char *v526;
  int v527;
  uint64_t v528;
  int v529;
  const char *v530;
  int v531;
  uint64_t v532;
  int v533;
  __int128 v534;
  __int128 v535;
  int v536[4];
  char *__endptr[2];
  int64x2_t v538;
  __int128 v539;
  __int128 v540;

  v375 = 0;
  v373 = 0;
  v4 = 0;
  default_set = 0;
  set = 0;
  v435 = 0;
  v434 = 0;
  *(_QWORD *)&size[1] = 0;
  v489.name = "threads";
  v489.flag = (int *)&v434 + 1;
  v489.has_arg = 0;
  v489.val = 1;
  v490 = "dq";
  v492 = &v434;
  v491 = 0;
  v493 = 1;
  v494 = "boosts";
  v496 = &size[2];
  v495 = 0;
  v497 = 1;
  v498 = "coalitions-only";
  v500 = &size[1];
  v499 = 0;
  v501 = 1;
  v502 = "xpcinfo";
  v504 = 0;
  v503 = 2;
  v505 = 6;
  v506 = "precise";
  v508 = 0;
  v507 = 2;
  v509 = 5;
  v510 = "threadcounts";
  v512 = 0;
  v511 = 2;
  v513 = 1;
  v514 = "vouchers";
  v516 = 0;
  v515 = 2;
  v517 = 2;
  v518 = "coalitions";
  v5 = 1;
  v519 = 1;
  v520 = 0;
  v521 = 4;
  v522 = "verbose";
  v523 = 0;
  v524 = 0;
  v525 = 3;
  v526 = "all";
  v527 = 0;
  v528 = 0;
  v529 = 7;
  v530 = "help";
  v531 = 0;
  v532 = 0;
  v533 = 104;
  v534 = 0u;
  v535 = 0u;
  qword_1000100C8 = (uint64_t)&v489;
  v371 = 1;
  while (2)
  {
    switch(getopt_long(a1, a2, "h", &v489, &dword_1000100C0))
    {
      case -1:
        if (v4)
          v11 = 1;
        else
          v11 = size[1] == 0;
        if (v11)
          v12 = v4;
        else
          v12 = 2;
        v343 = v12;
        if (optind >= a1)
        {
          __s1 = 0;
          v346 = 0;
          v347 = 0;
        }
        else
        {
          v13 = a2[optind];
          __endptr[0] = 0;
          v14 = strtoul(v13, __endptr, 10);
          __s1 = (char *)v13;
          v347 = v14 >> 31 == 0 && v13 != __endptr[0];
          if (v347)
            v15 = v14;
          else
            v15 = 0;
          v346 = v15;
        }
        v16 = v371;
        if (geteuid())
          sub_1000091BC();
        v17 = v5;
        if (sub_1000084E0("kern.development"))
          v18 = sub_100008560("kern.development") != 0;
        else
          v18 = 0;
        byte_100010001 = v18;
        if (sub_1000084E0("kern.thread_groups_supported"))
          v19 = sub_100008560("kern.thread_groups_supported") != 0;
        else
          v19 = 0;
        byte_100010002 = v19;
        if (sub_1000084E0("kern.monotonic.supported"))
          v20 = sub_100008560("kern.monotonic.supported") != 0;
        else
          v20 = 0;
        byte_100010003 = v20;
        if (qword_100010010 != -1)
          dispatch_once(&qword_100010010, &stru_10000C2E8);
        v354 = dword_100010018;
        size[0] = 0;
        *(_QWORD *)v536 = 0x800000001;
        v435 = 4;
        if (sysctl(v536, 2u, size, &v435, 0, 0))
          sub_1000091A0();
        v344 = (char *)malloc_type_malloc(size[0], 0xE2BA84C2uLL);
        if (!v344)
          sub_100009044();
        v21 = mach_timebase_info((mach_timebase_info_t)&dword_100010004);
        if (v21)
        {
          v334 = v21;
          v335 = "mach_timebase_info";
          goto LABEL_971;
        }
        v22 = mach_host_self();
        v23 = processor_set_default(v22, &default_set);
        if (v23)
        {
          v334 = v23;
          v335 = "processor_set_default";
          goto LABEL_971;
        }
        v24 = mach_host_self();
        v25 = host_processor_set_priv(v24, default_set, &set);
        if (v25)
        {
          v334 = v25;
          v335 = "host_processor_set_priv";
          goto LABEL_971;
        }
        task_list = 0;
        task_listCnt = 0;
        if (!v5 && (_DWORD)v434 == 0)
          goto LABEL_59;
        v26 = processor_set_tasks_with_flavor(set, 1u, &task_list, &task_listCnt);
        if ((_DWORD)v26)
          mach_error("processor_set_tasks_with_flavor(TASK_FLAVOR_READ)", v26);
        v27 = task_listCnt;
        if (task_listCnt)
          goto LABEL_62;
        v26 = fwrite("processor_set_tasks_with_flavor(TASK_FLAVOR_READ) returned 0 tasks", 0x42uLL, 1uLL, __stderrp);
        LODWORD(v434) = 0;
        v27 = task_listCnt;
        if (!task_listCnt)
        {
LABEL_59:
          v26 = processor_set_tasks_with_flavor(set, 2u, &task_list, &task_listCnt);
          if (!(_DWORD)v26)
          {
            v27 = task_listCnt;
            if (task_listCnt)
              goto LABEL_61;
            fwrite("processor_set_tasks_with_flavor(TASK_FLAVOR_INSPECT) returned 0 tasks", 0x45uLL, 1uLL, __stderrp);
LABEL_972:
            exit(1);
          }
          v334 = v26;
          v335 = "processor_set_tasks_with_flavor(TASK_FLAVOR_INSPECT)";
LABEL_971:
          mach_error(v335, v334);
          goto LABEL_972;
        }
LABEL_61:
        v17 = 0;
LABEL_62:
        if (!__s1)
          v26 = printf("num tasks: %d\n\n", v27);
        if (!size[2])
          goto LABEL_77;
        v28 = stackshot_config_create(v26);
        if (!v28)
        {
          fwrite("Unable to create stackshot config\n", 0x22uLL, 1uLL, __stderrp);
          goto LABEL_78;
        }
        Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
        if (!Mutable)
        {
          fwrite("Unable to allocate boost dictionary\n", 0x24uLL, 1uLL, __stderrp);
          stackshot_config_dealloc(v28);
          goto LABEL_77;
        }
        cf = Mutable;
        if (stackshot_config_set_flags(v28, 73728))
        {
          v30 = __stderrp;
          v31 = "stackshot_config_set_flags failure\n";
          v32 = 35;
LABEL_75:
          fwrite(v31, v32, 1uLL, v30);
          goto LABEL_76;
        }
        if (stackshot_config_set_pid(v28, 0xFFFFFFFFLL))
        {
          v30 = __stderrp;
          v31 = "stackshot_config_set_pid failure\n";
          v32 = 33;
          goto LABEL_75;
        }
        if (stackshot_capture_with_config(v28))
        {
          v30 = __stderrp;
          v31 = "stackshot_capture_with_config failure\n";
          v32 = 38;
          goto LABEL_75;
        }
        stackshot_buffer = stackshot_config_get_stackshot_buffer(v28);
        v312 = stackshot_buffer + stackshot_config_get_stackshot_size(v28);
        v313 = stackshot_buffer + 16;
        if (stackshot_buffer + 16 > v312)
          goto LABEL_79;
        v370 = v17;
        v314 = 0;
        v315 = 0;
        v316 = 0;
        v317 = 0;
        v318 = 1;
        while (1)
        {
          v319 = *(unsigned int *)(stackshot_buffer + 4);
          v320 = v313 + v319;
          if (v313 + v319 > v312 || (v321 = *(_DWORD *)stackshot_buffer, *(_DWORD *)stackshot_buffer == -242132755))
          {
LABEL_954:
            v17 = v370;
            goto LABEL_79;
          }
          v322 = (v321 & 0xFFFFFFF0) == 0x20 ? 17 : *(_DWORD *)stackshot_buffer;
          if (v322 > 19)
            break;
          if (v322 == 17)
          {
            if (v321 != 17 && (v321 & 0xFFFFFFF0) != 0x20)
              goto LABEL_956;
            v323 = *(_QWORD *)(stackshot_buffer + 8);
            if ((_DWORD)v323)
            {
              if (v321 == 17)
              {
                if (SHIDWORD(v323) <= 2310)
                {
                  switch(HIDWORD(v323))
                  {
                    case 0x30:
                      v324 = 20;
                      break;
                    case 0x31:
                      v324 = 24;
                      break;
                    case 0x81A:
LABEL_941:
                      v324 = 8;
                      break;
                    default:
                      goto LABEL_956;
                  }
                }
                else
                {
                  switch(HIDWORD(v323))
                  {
                    case 0x907:
                      v324 = 4;
                      break;
                    case 0x908:
                    case 0x909:
                      goto LABEL_956;
                    case 0x90A:
                    case 0x90C:
                      goto LABEL_941;
                    case 0x90B:
                    case 0x90D:
                      v324 = 16;
                      break;
                    default:
                      if (HIDWORD(v323) != 2369)
                        goto LABEL_956;
                      v324 = 48;
                      break;
                  }
                }
                if (v319 / v324 < v323 || v319 % v323 >= 0x10)
                {
LABEL_956:
                  v331 = __stderrp;
                  v332 = "Encountered invalid array iterator while generating boost map\n";
                  v333 = 62;
LABEL_960:
                  fwrite(v332, v333, 1uLL, v331);
                  goto LABEL_961;
                }
                goto LABEL_950;
              }
              v328 = *(_DWORD *)stackshot_buffer & 0xF;
              v329 = v319 >= v328;
              v330 = v319 - v328;
              if (!v329 || v330 < v323)
                goto LABEL_956;
              LODWORD(v319) = v330 % v323;
            }
            if ((_DWORD)v319)
              goto LABEL_956;
LABEL_950:
            if (HIDWORD(v323) == 2311)
            {
              if ((v318 & 1) != 0)
              {
                v331 = __stderrp;
                v332 = "Encountered donating pids array outside of a container while generating boost map\n";
                v333 = 82;
                goto LABEL_960;
              }
              v318 = 0;
              v315 = stackshot_buffer + 16;
              v314 = *(_QWORD *)(stackshot_buffer + 8);
            }
            goto LABEL_953;
          }
          if (v322 == 19)
          {
            if (v319 < 4 || v321 != 19)
            {
              v331 = __stderrp;
              v332 = "Encountered invalid container while generating boost map\n";
              v333 = 57;
              goto LABEL_960;
            }
            if (*(_DWORD *)(stackshot_buffer + 16) == 2307)
            {
              v317 = 0;
              v318 = 0;
              v315 = 0;
              v314 = 0;
              v316 = *(_QWORD *)(stackshot_buffer + 8);
            }
          }
LABEL_953:
          v313 = v320 + 16;
          stackshot_buffer = v320;
          if (v320 + 16 > v312)
            goto LABEL_954;
        }
        if (v322 != 20)
        {
          if (v322 == 2309)
          {
            if ((v318 & 1) != 0)
            {
              v331 = __stderrp;
              v332 = "Encountered task snapshot outside of a container while generating boost map\n";
              v333 = 76;
              goto LABEL_960;
            }
            v318 = 0;
            v317 = (_DWORD *)(stackshot_buffer + 16);
          }
          goto LABEL_953;
        }
        if ((v318 & 1) != 0)
        {
          v318 = 1;
          goto LABEL_953;
        }
        if (*(_QWORD *)(stackshot_buffer + 8) != v316)
        {
          v318 = 0;
          goto LABEL_953;
        }
        if (!v317)
        {
          v331 = __stderrp;
          v332 = "Encountered container end without a corresponding task snapshot while generating boost map\n";
          v333 = 91;
          goto LABEL_960;
        }
        *(_QWORD *)pidb = v316;
        if (!v314 || v315)
        {
          if (v314)
          {
            v364 = v312;
            for (i = 0; i != v314; ++i)
            {
              v326 = (const void *)*(int *)(v315 + 4 * i);
              if ((_DWORD)v326 != v317[21])
              {
                Value = (void *)CFDictionaryGetValue(cf, v326);
                if (!Value)
                {
                  Value = CFArrayCreateMutable(kCFAllocatorDefault, 0, 0);
                  CFDictionarySetValue(cf, (const void *)*(int *)(v315 + 4 * i), Value);
                  CFRelease(Value);
                }
                CFArrayAppendValue((CFMutableArrayRef)Value, v317);
              }
            }
            v320 = v313 + *(unsigned int *)(stackshot_buffer + 4);
            v318 = 1;
            v16 = v371;
            v312 = v364;
            v316 = *(_QWORD *)pidb;
          }
          else
          {
            v318 = 1;
            v16 = v371;
          }
          goto LABEL_953;
        }
        fwrite("Donating pids count was non-zero with a NULL array while generating boost map\n", 0x4EuLL, 1uLL, __stderrp);
        v16 = v371;
LABEL_961:
        v17 = v370;
LABEL_76:
        stackshot_config_dealloc(v28);
        CFRelease(cf);
LABEL_77:
        v28 = 0;
LABEL_78:
        cf = 0;
LABEL_79:
        v337 = v28;
        v33 = (int *)malloc_type_calloc(4uLL, task_listCnt, 0x7B7C7E69uLL);
        v358 = v33;
        if (task_listCnt)
        {
          v34 = 0;
          v35 = v33;
          do
          {
            v36 = pid_for_task(task_list[v34], v35);
            if (v36)
              mach_error("pid_for_task", v36);
            ++v34;
            v37 = task_listCnt;
            ++v35;
          }
          while (v34 < task_listCnt);
          v38 = size[1] == 0;
          if (task_listCnt && !size[1])
          {
            v39 = 0;
            v341 = dispatch_queue_offsets[1];
            v336 = !v17;
            v371 = v16;
            do
            {
              v40 = v358[v39];
              task_info_outCnt = 0;
              memset(&basic_info, 0, sizeof(basic_info));
              v427 = 0u;
              v428 = 0u;
              v426 = 0;
              task_info_out = 0u;
              v425 = 0u;
              v422 = 0;
              v423 = 0;
              v421 = 0;
              v419 = 0u;
              v420 = 0u;
              v417 = 0u;
              v418 = 0u;
              v415 = 0u;
              v416 = 0u;
              v413 = 0u;
              v414 = 0u;
              memset(v488, 0, sizeof(v488));
              v486 = 0u;
              v487 = 0u;
              v411 = 0;
              v412 = 0;
              v410 = 0u;
              v409 = 0u;
              v408 = 0u;
              policy_info = 0u;
              v485 = 0;
              v484 = 0u;
              memset(v483, 0, sizeof(v483));
              v482 = 0u;
              memset(buffer, 0, sizeof(buffer));
              v406 = 0;
              memset(v405, 0, sizeof(v405));
              v480 = 0;
              v478 = 0u;
              v479 = 0u;
              v403 = 0;
              v404 = 0;
              v476 = 0u;
              uu = 0u;
              v474 = 0u;
              v475 = 0u;
              v472 = 0u;
              v473 = 0u;
              v470 = 0u;
              v471 = 0u;
              v468 = 0u;
              v469 = 0u;
              v466 = 0u;
              v467 = 0u;
              v465 = 0u;
              v463 = 0u;
              memset(v464, 0, sizeof(v464));
              v461 = 0u;
              v462 = 0u;
              v459 = 0u;
              v460 = 0u;
              v457 = 0u;
              v458 = 0u;
              v455 = 0u;
              v456 = 0u;
              v453 = 0u;
              v454 = 0u;
              v451 = 0u;
              v452 = 0u;
              v449 = 0u;
              v450 = 0u;
              flags = 0;
              act_list = 0;
              *(_QWORD *)x = 0;
              if (pid_for_task(task_list[v39], x))
              {
                fprintf(__stderrp, "pid %d no longer active, skipping\n", v358[v39]);
                goto LABEL_772;
              }
              if (x[0] != v358[v39])
                fprintf(__stderrp, "task %d pid changed? from %d to %d\n", task_list[v39], v358[v39], x[0]);
              if (proc_pidinfo(v40, 3, 0, buffer, 136) <= 135)
                perror("proc_pidinfo(... PROC_PIDTBSDINFO ...)");
              if (proc_pidinfo(v40, 19, 0, &v406, 8) <= 7)
                perror("proc_pidinfo(... PROC_PIDARCHINFO ...)");
              *__error() = 0;
              if (proc_pidinfo(v40, 12, 0, &v403, 16) <= 15)
              {
                if (*__error() == 3)
                {
                  v41 = 0;
                  if ((_DWORD)v40)
                    goto LABEL_104;
                  goto LABEL_106;
                }
                if (!(_DWORD)v40 && *__error() == 22)
                {
                  v41 = 0;
                  goto LABEL_106;
                }
                perror("proc_pidinfo(, ... PROC_PIDWORKQUEUEINFO ...)");
              }
              v41 = 1;
              if ((_DWORD)v40)
              {
LABEL_104:
                *(_QWORD *)v536 = 0x3100000001;
                v536[2] = v40;
                v435 = size[0];
                if (sysctl(v536, 3u, v344, &v435, 0, 0))
                {
                  perror("sysctl(... KERN_PROCARGS2 ...)");
                  v43 = 0;
                  if (v483[0])
                    v42 = v483;
                  else
                    v42 = (char *)&v482;
                }
                else
                {
                  v42 = basename(v344 + 4);
                  v43 = 0;
                }
                goto LABEL_107;
              }
LABEL_106:
              v43 = 1;
              v42 = "kernel_task";
LABEL_107:
              if (__s1)
              {
                if (v42)
                {
                  if (strncmp(__s1, v42, 0x20uLL) && (!v347 || v346 != (_DWORD)v40))
                    goto LABEL_772;
                }
                else if (!v347 || v346 != (_DWORD)v40)
                {
                  goto LABEL_772;
                }
              }
              task_info_outCnt = 10;
              v44 = task_info(task_list[v39], 0x12u, (task_info_t)&task_info_out, &task_info_outCnt);
              if (v44)
                mach_error("task_info(... TASK_BASIC_INFO ...)", v44);
              task_info_outCnt = 4;
              v45 = task_info(task_list[v39], 3u, (task_info_t)&v422, &task_info_outCnt);
              if (v45)
                mach_error("task_info(... TASK_THREAD_TIMES_INFO ...)", v45);
              task_info_outCnt = 26;
              v46 = task_info(task_list[v39], 0x1Au, (task_info_t)&v415, &task_info_outCnt);
              if (v46)
                mach_error("task_info(... TASK_POWER_INFO_V2 ...)", v46);
              task_info_outCnt = 8;
              v47 = task_info(task_list[v39], 2u, (task_info_t)&v413, &task_info_outCnt);
              if (v47)
                mach_error("task_info(... TASK_EVENTS_INFO ...)", v47);
              task_info_outCnt = 16;
              v48 = task_info(task_list[v39], 0x13u, (task_info_t)&v486, &task_info_outCnt);
              if (v48)
                mach_error("task_info(... TASK_EXTMOD_INFO ...)", v48);
              task_info_outCnt = 4;
              v49 = task_info(task_list[v39], 0x10u, (task_info_t)&v411, &task_info_outCnt);
              if (v49)
                mach_error("task_info(... TASK_AFFINITY_TAG_INFO ...)", v49);
              task_info_outCnt = 8;
              v50 = task_info(task_list[v39], 0xFu, (task_info_t)&v427, &task_info_outCnt);
              if (v50)
                mach_error("task_info(... TASK_AUDIT_TOKEN ...)", v50);
              v51 = mach_port_space_basic_info(task_list[v39], &basic_info);
              if (v51)
                mach_error("mach_port_space_basic_info()", v51);
              if ((v43 & 1) == 0)
              {
                LODWORD(__endptr[0]) = 0;
                task_info_outCnt = 16;
                v52 = task_policy_get(task_list[v39], 4u, (task_policy_t)&policy_info, &task_info_outCnt, (BOOLean_t *)__endptr);
                if (v52)
                  mach_error("task_policy_get(... TASK_POLICY_STATE ...)", v52);
              }
              if (proc_pidinfo(v40, 20, 0, v405, 40) <= 39)
                perror("proc_pidinfo(... PROC_PIDCOALITIONINFO ...)");
              if (proc_pidinfo(v40, 17, 0, &uu, 56) <= 55)
                perror("proc_pidinfo(... PROC_PIDUNIQIDENTIFIERINFO ...)");
              if (proc_pid_rusage(v40, 6, (rusage_info_t *)&v449))
                perror("proc_pid_rusage");
              if (proc_get_dirty(v40, &flags))
                perror("proc_get_dirty");
              v360 = v43;
              if (HIDWORD(v434))
              {
                v53 = task_threads(task_list[v39], &act_list, (mach_msg_type_number_t *)&x[1]);
                if (v53)
                  mach_error("task_threads", v53);
              }
              printf("process: \"%s\" [%d]\n", v42, v40);
              printf("unique ID/version: %llu / %d\n", (_QWORD)v478, (_DWORD)v479);
              printf("audit: { auid %d uid %u gid %u ruid %u rgid %u pid %u asid %u version %u}\n", (_DWORD)v427, DWORD1(v427), DWORD2(v427), HIDWORD(v427), (_DWORD)v428, DWORD1(v428), DWORD2(v428), HIDWORD(v428));
              memset(out, 0, 37);
              uuid_unparse((const unsigned __int8 *)&uu, out);
              printf("executable uuid: %s\n", out);
              v356 = v41;
              switch((_DWORD)v406)
              {
                case 7:
                  v54 = "i386";
                  break;
                case 0x1000007:
                  v54 = "x86_64";
                  break;
                case 0x100000C:
                  v54 = "arm64";
                  if ((HIDWORD(v406) & 0xFFFFFF) == 2)
                    v54 = "arm64e";
                  break;
                default:
                  v54 = "arm";
                  if ((_DWORD)v406 != 12)
                    v54 = "???";
                  break;
              }
              *(_QWORD *)pid = v40;
              key = (void *)(int)v40;
              printf("architecture: %s\n", v54);
              v55 = 0;
              v56 = 1;
              do
              {
                v57 = v56;
                if (v16)
                {
                  v58 = sub_1000085D8();
                  v60 = v59;
                  if ((v55 & 1) == 0)
                    goto LABEL_156;
                }
                else
                {
                  v58 = 0;
                  v60 = 0;
                  if ((v55 & 1) == 0)
                  {
LABEL_156:
                    printf("coalition (type %d RESOURCE) ID: %llu\n", 0, v405[0]);
                    if (v16)
                      goto LABEL_192;
                    goto LABEL_193;
                  }
                }
                v61 = v405[1];
                printf("coalition (type %d JETSAM) ID: %llu", 1, v405[1]);
                if (byte_100010001)
                  v62 = byte_100010002 == 0;
                else
                  v62 = 1;
                if (v62 || (byte_10001001C & 1) != 0)
                  goto LABEL_184;
                *(_OWORD *)__endptr = 0u;
                v538 = 0u;
                if (coalition_info_debug_info(v61, __endptr, 32) != -1)
                {
                  v63 = "A";
                  if ((BYTE4(__endptr[1]) & 2) == 0)
                    v63 = "-";
                  v64 = "U";
                  if ((WORD2(__endptr[1]) & 0x100) == 0)
                    v64 = "-";
                  v65 = "E";
                  if ((BYTE4(__endptr[1]) & 1) == 0)
                    v65 = "-";
                  v66 = "C";
                  if ((BYTE4(__endptr[1]) & 4) == 0)
                    v66 = "-";
                  v67 = "B";
                  if ((BYTE4(__endptr[1]) & 8) == 0)
                    v67 = "-";
                  v68 = "X";
                  if ((WORD2(__endptr[1]) & 0x200) == 0)
                    v68 = "-";
                  v69 = "T";
                  if ((WORD2(__endptr[1]) & 0x400) == 0)
                    v69 = "-";
                  v70 = "G";
                  if ((WORD2(__endptr[1]) & 0x800) == 0)
                    v70 = "-";
                  v71 = "P";
                  if ((WORD2(__endptr[1]) & 0x1000) == 0)
                    v71 = "-";
                  printf(" group 0x%llx (%s%s%s%s%s%s%s%s%s, 0x%d)", __endptr[0], v63, v64, v65, v66, v67, v68, v69, v70, v71, LODWORD(__endptr[1]));
LABEL_184:
                  if (!v16)
                    goto LABEL_186;
LABEL_185:
                  printf(" (%s, %s)", v58, v60);
                  goto LABEL_186;
                }
                sub_100009178();
                if (v16)
                  goto LABEL_185;
LABEL_186:
                v72 = coalition_policy_get(v61, 1);
                if (v72 == 1)
                {
                  printf(" suppressed (BG)");
                }
                else if (v72 == -1 && (byte_10001000C & 1) == 0)
                {
                  sub_100009150();
                }
                putchar(10);
                if (v16)
                {
LABEL_192:
                  free(v58);
                  free(v60);
                }
LABEL_193:
                v56 = 0;
                v55 = 1;
              }
              while ((v57 & 1) != 0);
              v73 = v410;
              printf("suspend count: %d\n", (_DWORD)task_info_out);
              v74 = (double)*(unint64_t *)((char *)&task_info_out + 4);
              if (*(_QWORD *)((char *)&task_info_out + 4) > 0x8000000000000uLL)
              {
                v74 = v74 * 8.8817842e-16;
                v75 = "Pi";
                goto LABEL_201;
              }
              if (*(_QWORD *)((char *)&task_info_out + 4) <= 0x20000000000uLL)
              {
                v76 = *(_QWORD *)pid;
                if (*(_QWORD *)((char *)&task_info_out + 4) <= 0x80000000uLL)
                {
                  if (*(_QWORD *)((char *)&task_info_out + 4) <= 0x200000uLL)
                  {
                    if (*(_QWORD *)((char *)&task_info_out + 4) > 0x800uLL)
                      v74 = v74 * 0.0009765625;
                    v75 = (const char *)&unk_100009E75;
                    if (*(_QWORD *)((char *)&task_info_out + 4) > 0x800uLL)
                      v75 = "Ki";
                  }
                  else
                  {
                    v74 = v74 * 0.000000953674316;
                    v75 = "Mi";
                  }
                }
                else
                {
                  v74 = v74 * 9.31322575e-10;
                  v75 = "Gi";
                }
              }
              else
              {
                v74 = v74 * 9.09494702e-13;
                v75 = "Ti";
LABEL_201:
                v76 = *(_QWORD *)pid;
              }
              v77 = (double)*((unint64_t *)&v453 + 1);
              if (*((_QWORD *)&v453 + 1) <= 0x8000000000000uLL)
              {
                if (*((_QWORD *)&v453 + 1) <= 0x20000000000uLL)
                {
                  if (*((_QWORD *)&v453 + 1) <= 0x80000000uLL)
                  {
                    if (*((_QWORD *)&v453 + 1) <= 0x200000uLL)
                    {
                      if (*((_QWORD *)&v453 + 1) > 0x800uLL)
                        v77 = v77 * 0.0009765625;
                      v78 = (const char *)&unk_100009E75;
                      if (*((_QWORD *)&v453 + 1) > 0x800uLL)
                        v78 = "Ki";
                    }
                    else
                    {
                      v77 = v77 * 0.000000953674316;
                      v78 = "Mi";
                    }
                  }
                  else
                  {
                    v77 = v77 * 9.31322575e-10;
                    v78 = "Gi";
                  }
                }
                else
                {
                  v77 = v77 * 9.09494702e-13;
                  v78 = "Ti";
                }
              }
              else
              {
                v77 = v77 * 8.8817842e-16;
                v78 = "Pi";
              }
              v79 = (double)*(unint64_t *)&v464[0];
              if (*(_QWORD *)&v464[0] <= 0x8000000000000uLL)
              {
                if (*(_QWORD *)&v464[0] <= 0x20000000000uLL)
                {
                  if (*(_QWORD *)&v464[0] <= 0x80000000uLL)
                  {
                    if (*(_QWORD *)&v464[0] <= 0x200000uLL)
                    {
                      if (*(_QWORD *)&v464[0] > 0x800uLL)
                        v79 = v79 * 0.0009765625;
                      v80 = (const char *)&unk_100009E75;
                      if (*(_QWORD *)&v464[0] > 0x800uLL)
                        v80 = "Ki";
                    }
                    else
                    {
                      v79 = v79 * 0.000000953674316;
                      v80 = "Mi";
                    }
                  }
                  else
                  {
                    v79 = v79 * 9.31322575e-10;
                    v80 = "Gi";
                  }
                }
                else
                {
                  v79 = v79 * 9.09494702e-13;
                  v80 = "Ti";
                }
              }
              else
              {
                v79 = v79 * 8.8817842e-16;
                v80 = "Pi";
              }
              printf("virtual bytes: %.2f %s%s; phys_footprint bytes: %.2f %s%s; phys_footprint lifetime maximum bytes: %.2f %s%s\n",
                v74,
                v75,
                "B",
                v77,
                v78,
                "B",
                v79,
                v80,
                "B");
              if (*((_QWORD *)&v471 + 1))
              {
                v81 = (double)(unint64_t)v471;
                if ((unint64_t)v471 <= 0x8000000000000)
                {
                  if ((unint64_t)v471 <= 0x20000000000)
                  {
                    if ((unint64_t)v471 <= 0x80000000)
                    {
                      if ((unint64_t)v471 <= 0x200000)
                      {
                        if ((unint64_t)v471 > 0x800)
                          v81 = v81 * 0.0009765625;
                        v82 = (const char *)&unk_100009E75;
                        if ((unint64_t)v471 > 0x800)
                          v82 = "Ki";
                      }
                      else
                      {
                        v81 = v81 * 0.000000953674316;
                        v82 = "Mi";
                      }
                    }
                    else
                    {
                      v81 = v81 * 9.31322575e-10;
                      v82 = "Gi";
                    }
                  }
                  else
                  {
                    v81 = v81 * 9.09494702e-13;
                    v82 = "Ti";
                  }
                }
                else
                {
                  v81 = v81 * 8.8817842e-16;
                  v82 = "Pi";
                }
                v83 = (double)*((unint64_t *)&v471 + 1);
                if (*((_QWORD *)&v471 + 1) <= 0x8000000000000uLL)
                {
                  if (*((_QWORD *)&v471 + 1) <= 0x20000000000uLL)
                  {
                    if (*((_QWORD *)&v471 + 1) <= 0x80000000uLL)
                    {
                      if (*((_QWORD *)&v471 + 1) <= 0x200000uLL)
                      {
                        if (*((_QWORD *)&v471 + 1) > 0x800uLL)
                          v83 = v83 * 0.0009765625;
                        v84 = (const char *)&unk_100009E75;
                        if (*((_QWORD *)&v471 + 1) > 0x800uLL)
                          v84 = "Ki";
                      }
                      else
                      {
                        v83 = v83 * 0.000000953674316;
                        v84 = "Mi";
                      }
                    }
                    else
                    {
                      v83 = v83 * 9.31322575e-10;
                      v84 = "Gi";
                    }
                  }
                  else
                  {
                    v83 = v83 * 9.09494702e-13;
                    v84 = "Ti";
                  }
                }
                else
                {
                  v83 = v83 * 8.8817842e-16;
                  v84 = "Pi";
                }
                printf("neural footprint: %.2f %s%s neural footprint lifetime maximum bytes: %.2f %s%s\n", v81, v82, "B", v83, v84, "B");
              }
              v85 = time(0);
              printf("run time: %lld s\n", v85 - *((_QWORD *)&v484 + 1));
              printf("user/system time    (current threads): %lf s / %lf s\n", (double)SHIDWORD(v422) / 1000000.0 + (double)(int)v422, (double)SHIDWORD(v423) / 1000000.0 + (double)(int)v423);
              printf("user/system time (terminated threads): %lf s / %lf s\n", (double)SDWORD2(v425) / 1000000.0 + (double)SDWORD1(v425), (double)(int)v426 / 1000000.0 + (double)SHIDWORD(v425));
              __endptr[0] = *((char **)&v464[0] + 1);
              __endptr[1] = *(char **)&v464[1];
              v538 = v450;
              *(_QWORD *)&v539 = v469;
              v352 = *(_QWORD *)&v464[1];
              v353 = *((_QWORD *)&v464[0] + 1);
              v439 = *(_OWORD *)((char *)v464 + 8);
              v350 = v450.i64[1];
              v351 = v450.i64[0];
              v440 = v450;
              v349 = v469;
              *(_QWORD *)&v441 = v469;
              sub_10000867C("CPU time:", (unint64_t *)__endptr, &v439, 0, (const char *)&unk_100009E75);
              if (v354 >= 2)
              {
                v340 = v469 - *((_QWORD *)&v469 + 1);
                v339.i64[1] = v450.i64[1] - v467.i64[1];
                v339.i64[0] = v450.i64[0] - v467.i64[0];
                v338 = (char *)(*(_QWORD *)&v464[1] - *((_QWORD *)&v468 + 1));
                v86 = (char *)(*((_QWORD *)&v464[0] + 1) - v468);
                *(_OWORD *)__endptr = v468;
                v538 = v467;
                *(_QWORD *)&v539 = *((_QWORD *)&v469 + 1);
                *(_QWORD *)&v439 = v353;
                *((_QWORD *)&v439 + 1) = v352;
                v440.i64[0] = v351;
                v440.i64[1] = v350;
                *(_QWORD *)&v441 = v349;
                sub_10000867C("P-time:  ", (unint64_t *)__endptr, &v439, 1, (const char *)&unk_100009E75);
                __endptr[0] = v86;
                __endptr[1] = v338;
                v538 = v339;
                *(_QWORD *)&v539 = v340;
                *(_QWORD *)&v439 = v353;
                *((_QWORD *)&v439 + 1) = v352;
                v440.i64[0] = v351;
                v440.i64[1] = v350;
                *(_QWORD *)&v441 = v349;
                sub_10000867C("E-time:  ", (unint64_t *)__endptr, &v439, 1, (const char *)&unk_100009E75);
                if (HIDWORD(v414))
                  v87 = (double)v421 * 100.0 / (double)(unint64_t)SHIDWORD(v414);
                else
                  v87 = 0.0;
                printf("P/E switches: %llu (%.0f%%)\n", v421, v87);
                v76 = *(_QWORD *)pid;
                v16 = v371;
              }
              printf("CPU time billed to me by others: %llu.%06llu s ", *((_QWORD *)&v462 + 1) * (unint64_t)dword_100010004 / unk_100010008 / 0x3B9ACA00, *((_QWORD *)&v462 + 1) * (unint64_t)dword_100010004 / unk_100010008 % 0x3B9ACA00/ 0x3E8);
              sub_100008B94();
              putchar(10);
              v88 = 0.0;
              v89 = 0.0;
              if (v450.i64[1] + v450.i64[0])
                v89 = (double)(unint64_t)v463 * 100.0 / (double)(unint64_t)(v450.i64[1] + v450.i64[0]);
              printf("CPU time I billed to others: %llu.%06llu s (%.0f%%) ", (unint64_t)v463 * dword_100010004 / unk_100010008 / 0x3B9ACA00, (unint64_t)v463 * dword_100010004 / unk_100010008 % 0x3B9ACA00 / 0x3E8, v89);
              sub_100008B94();
              v90 = v360;
              if ((_QWORD)v469)
                v88 = (double)(unint64_t)v465 * 100.0 / (double)(unint64_t)v469;
              printf(" (%.0f%%)\n", v88);
              v91 = (unint64_t)v462 * dword_100010004 / unk_100010008;
              v92 = *((_QWORD *)&v461 + 1) * (unint64_t)dword_100010004 / unk_100010008;
              v93 = (unint64_t)v461 * dword_100010004 / unk_100010008;
              v94 = *((_QWORD *)&v460 + 1) * (unint64_t)dword_100010004 / unk_100010008;
              printf("QoS time (s): UI: %llu.%06llu IN: %llu.%06llu DF: %llu.%06llu UT: %llu.%06llu BG: %llu.%06llu MT: %llu.%06llu UN: %llu.%06llu\n", v91 / 0x3B9ACA00, v91 % 0x3B9ACA00 / 0x3E8, v92 / 0x3B9ACA00, v92 % 0x3B9ACA00 / 0x3E8, v93 / 0x3B9ACA00, v93 % 0x3B9ACA00 / 0x3E8, v94 / 0x3B9ACA00, v94 % 0x3B9ACA00 / 0x3E8, (unint64_t)v460 * dword_100010004 / unk_100010008 / 0x3B9ACA00, (unint64_t)v460 * dword_100010004 / unk_100010008 % 0x3B9ACA00 / 0x3E8, *((_QWORD *)&v459 + 1) * (unint64_t)dword_100010004 / unk_100010008 / 0x3B9ACA00, *((_QWORD *)&v459 + 1) * (unint64_t)dword_100010004 / unk_100010008 % 0x3B9ACA00/ 0x3E8, (unint64_t)v459 * dword_100010004 / unk_100010008 / 0x3B9ACA00, (unint64_t)v459 * dword_100010004 / unk_100010008 % 0x3B9ACA00 / 0x3E8);
              if ((_QWORD)v416)
                v95 = (double)*((unint64_t *)&v416 + 1) * 100.0 / (double)(unint64_t)v416;
              else
                v95 = 0.0;
              printf("interrupt wakeups: %llu (%llu / %.2f%% from platform idle)\n", (_QWORD)v416, *((_QWORD *)&v416 + 1), v95);
              if (HIDWORD(v426) >= 3)
              {
                v96 = "POLICY_FIFO";
                if (HIDWORD(v426) != 4)
                  v96 = "???";
              }
              else
              {
                v96 = off_10000C408[SHIDWORD(v426)];
              }
              printf("default sched policy: %s\n", v96);
              v97 = (double)(unint64_t)v458;
              if ((unint64_t)v458 <= 0x8000000000000)
              {
                if ((unint64_t)v458 <= 0x20000000000)
                {
                  if ((unint64_t)v458 <= 0x80000000)
                  {
                    if ((unint64_t)v458 <= 0x200000)
                    {
                      if ((unint64_t)v458 > 0x800)
                        v97 = v97 * 0.0009765625;
                      v98 = (const char *)&unk_100009E75;
                      if ((unint64_t)v458 > 0x800)
                        v98 = "Ki";
                    }
                    else
                    {
                      v97 = v97 * 0.000000953674316;
                      v98 = "Mi";
                    }
                  }
                  else
                  {
                    v97 = v97 * 9.31322575e-10;
                    v98 = "Gi";
                  }
                }
                else
                {
                  v97 = v97 * 9.09494702e-13;
                  v98 = "Ti";
                }
              }
              else
              {
                v97 = v97 * 8.8817842e-16;
                v98 = "Pi";
              }
              v99 = (double)*((unint64_t *)&v458 + 1);
              if (*((_QWORD *)&v458 + 1) <= 0x8000000000000uLL)
              {
                if (*((_QWORD *)&v458 + 1) <= 0x20000000000uLL)
                {
                  if (*((_QWORD *)&v458 + 1) <= 0x80000000uLL)
                  {
                    if (*((_QWORD *)&v458 + 1) <= 0x200000uLL)
                    {
                      if (*((_QWORD *)&v458 + 1) > 0x800uLL)
                        v99 = v99 * 0.0009765625;
                      v100 = (const char *)&unk_100009E75;
                      if (*((_QWORD *)&v458 + 1) > 0x800uLL)
                        v100 = "Ki";
                    }
                    else
                    {
                      v99 = v99 * 0.000000953674316;
                      v100 = "Mi";
                    }
                  }
                  else
                  {
                    v99 = v99 * 9.31322575e-10;
                    v100 = "Gi";
                  }
                }
                else
                {
                  v99 = v99 * 9.09494702e-13;
                  v100 = "Ti";
                }
              }
              else
              {
                v99 = v99 * 8.8817842e-16;
                v100 = "Pi";
              }
              v101 = (double)*((unint64_t *)&v463 + 1);
              if (*((_QWORD *)&v463 + 1) <= 0x8000000000000uLL)
              {
                if (*((_QWORD *)&v463 + 1) <= 0x20000000000uLL)
                {
                  if (*((_QWORD *)&v463 + 1) <= 0x80000000uLL)
                  {
                    if (*((_QWORD *)&v463 + 1) <= 0x200000uLL)
                    {
                      if (*((_QWORD *)&v463 + 1) > 0x800uLL)
                        v101 = v101 * 0.0009765625;
                      v102 = (const char *)&unk_100009E75;
                      if (*((_QWORD *)&v463 + 1) > 0x800uLL)
                        v102 = "Ki";
                    }
                    else
                    {
                      v101 = v101 * 0.000000953674316;
                      v102 = "Mi";
                    }
                  }
                  else
                  {
                    v101 = v101 * 9.31322575e-10;
                    v102 = "Gi";
                  }
                }
                else
                {
                  v101 = v101 * 9.09494702e-13;
                  v102 = "Ti";
                }
              }
              else
              {
                v101 = v101 * 8.8817842e-16;
                v102 = "Pi";
              }
              printf("bytes read: %.2f %s%s written: %.2f %s%s logical writes: %.2f %s%s\n", v97, v98, "B", v99, v100, "B", v101, v102, "B");
              if (basic_info.iisb_table_size)
                v103 = (double)basic_info.iisb_table_inuse * 100.0 / (double)basic_info.iisb_table_size;
              else
                v103 = 0.0;
              printf("mach ports: %d (%.0f%% occupied)\n", basic_info.iisb_table_inuse, v103);
              printf("faults: %d, pageins: %d, cow_faults: %d, msgsent: %d, msgrecv: %d, syscalls (mach/unix): %d / %d, csw: %d\n", (_DWORD)v413, DWORD1(v413), DWORD2(v413), HIDWORD(v413), (_DWORD)v414, DWORD1(v414), DWORD2(v414), HIDWORD(v414));
              if (HIDWORD(v412))
                printf("affinity sets: %d tasks: %d (min: %d max: %d)", v411, HIDWORD(v412), HIDWORD(v411), v412);
              v104.i64[0] = v487;
              v104.i64[1] = v488[0];
              if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_s64(v104), (int32x4_t)vceqzq_s64(*(int64x2_t *)&v488[1]))))) & 1) != 0|| *((_QWORD *)&v487 + 1)|| v488[3])
              {
                printf("extmod: task for pid: %lld (%lld) thread injection: %lld (%lld) set state: %lld (%lld)\n", (_QWORD)v487, *((_QWORD *)&v487 + 1), v488[0], v488[1], v488[2], v488[3]);
              }
              if (v356)
              {
                printf("workqueue threads: %d running: %d blocked: %d", v403, HIDWORD(v403), v404);
                v105 = BYTE4(v404);
                if ((v404 & 0x100000000) != 0)
                {
                  printf(" constrained-limit");
                  v105 = BYTE4(v404);
                  if ((v404 & 0x200000000) != 0)
                    goto LABEL_356;
LABEL_328:
                  if ((v105 & 8) == 0)
                    goto LABEL_329;
LABEL_357:
                  printf(" cooperative-limit");
                  if ((v404 & 0x1000000000) != 0)
LABEL_330:
                    printf(" active-constrained-limit");
                }
                else
                {
                  if ((v404 & 0x200000000) == 0)
                    goto LABEL_328;
LABEL_356:
                  printf(" total-limit");
                  v105 = BYTE4(v404);
                  if ((v404 & 0x800000000) != 0)
                    goto LABEL_357;
LABEL_329:
                  if ((v105 & 0x10) != 0)
                    goto LABEL_330;
                }
                putchar(10);
              }
              LODWORD(__endptr[0]) = 0;
              LODWORD(v439) = 0;
              v446[0] = 0;
              v384[0] = 0;
              printf("CPU usage monitor: ");
              if (proc_get_cpumon_params(v76, __endptr, &v439))
              {
                sub_100009128();
              }
              else if (SLODWORD(__endptr[0]) > 0 || (int)v439 >= 1)
              {
                printf("%d%% CPU over %d seconds\n", LODWORD(__endptr[0]), (_DWORD)v439);
              }
              else
              {
                puts("none");
              }
              printf("CPU wakes monitor: ");
              if (proc_get_wakemon_params(v76, v446, v384))
              {
                sub_100009100();
              }
              else if (v446[0] < 1)
              {
                puts("none");
              }
              else
              {
                printf("%d wakes per second (over system-default time period)\n", v446[0]);
              }
              v106 = "tracked";
              if ((flags & 1) == 0)
                v106 = "untracked";
              v107 = (const char *)&unk_100009E75;
              if ((~flags & 3) == 0)
                v107 = "idle-exit";
              v108 = "dirty";
              if ((flags & 5) == 1)
                v108 = "clean";
              printf("dirty tracking: %s %s %s\n", v106, v107, v108);
              if ((v360 & 1) == 0)
              {
                printf("boosts: %d (%d externalized)\n", DWORD2(v408), HIDWORD(v408));
                if (cf && DWORD2(v408))
                {
                  v109 = (const __CFArray *)CFDictionaryGetValue(cf, key);
                  if (v109)
                  {
                    v110 = v109;
                    if (CFArrayGetCount(v109) >= 1)
                    {
                      v111 = 0;
                      do
                      {
                        ValueAtIndex = (const char *)CFArrayGetValueAtIndex(v110, v111);
                        printf("\tboosted by: \"%s\" [%d]\n", ValueAtIndex + 88, *((_DWORD *)ValueAtIndex + 21));
                        ++v111;
                      }
                      while (v111 < CFArrayGetCount(v110));
                    }
                  }
                  else
                  {
                    puts("\tsource(s) of boost(s) unknown");
                  }
                }
                puts("requested policy");
                printf("\treq apptype: %s\n", off_10000C358[((unint64_t)v73 >> 17) & 7]);
                v113 = (v73 >> 21) & 0x1F;
                v114 = "???";
                if (v113 <= 8)
                  v114 = off_10000C3C0[v113];
                printf("\treq role: %s\n", v114);
                v115 = ((unint64_t)v73 >> 33) & 7;
                if ((_DWORD)v115 != 7 && ((0x7Du >> v115) & 1) != 0)
                {
                  v116 = off_10000C420[v115];
                }
                else
                {
                  v11 = (_DWORD)v115 == 1;
                  v116 = "THREAD_QOS_MAINTENANCE";
                  if (!v11)
                    v116 = "???";
                }
                printf("\treq qos clamp: %s\n", v116);
                v117 = (v73 >> 11) & 7;
                v118 = v117 == 6;
                LODWORD(v76) = pid[0];
                if (v117 >= 6)
                {
                  v119 = "LATENCY_QOS_TIER_5";
                  if (!v118)
                    v119 = "???";
                }
                else
                {
                  v119 = off_10000C458[v117];
                }
                v120 = (v73 >> 26) & 7;
                v121 = v120 == 6;
                if (v120 >= 6)
                {
                  v122 = "LATENCY_QOS_TIER_5";
                  if (!v121)
                    v122 = "???";
                }
                else
                {
                  v122 = off_10000C458[v120];
                }
                printf("\treq base/override latency qos: %s / %s\n", v119, v122);
                v123 = (v73 >> 14) & 7;
                v124 = v123 == 6;
                if (v123 >= 6)
                {
                  v125 = "THROUGHPUT_QOS_TIER_5";
                  if (!v124)
                    v125 = "???";
                }
                else
                {
                  v125 = off_10000C488[v123];
                }
                v126 = v73 >> 29;
                v127 = "THROUGHPUT_QOS_TIER_UNSPECIFIED";
                if ((_DWORD)v126)
                {
                  if ((v126 - 1) >= 5)
                  {
                    v127 = "THROUGHPUT_QOS_TIER_5";
                    if ((_DWORD)v126 != 6)
                      v127 = "???";
                  }
                  else
                  {
                    v127 = off_10000C398[v126 - 1];
                  }
                }
                printf("\treq base/override thruput qos: %s / %s\n", v125, v127);
                if ((v73 & 3) != 0)
                  v128 = "YES";
                else
                  v128 = "NO";
                v129 = (const char *)&unk_100009E75;
                v130 = "(internal)";
                if ((v73 & 1) == 0)
                  v130 = (const char *)&unk_100009E75;
                if ((v73 & 2) != 0)
                  v129 = "(external)";
                printf("\treq darwin BG: %s %s %s\n", v128, v130, v129);
                v131 = (v73 >> 2) & 3;
                v132 = "THROTTLE_LEVEL_TIER3 (THROTTLE)";
                if (v131 != 3)
                  v132 = off_10000C4B8[v131];
                v133 = (v73 >> 4) & 3;
                v134 = "THROTTLE_LEVEL_TIER3 (THROTTLE)";
                if (v133 != 3)
                  v134 = off_10000C4B8[v133];
                printf("\treq internal/external iotier: %s / %s\n", v132, v134);
                v135 = (v73 >> 8) & 3;
                v136 = "THROTTLE_LEVEL_TIER3 (THROTTLE)";
                if (v135 != 3)
                  v136 = off_10000C4B8[v135];
                printf("\treq darwin BG iotier: %s\n", v136);
                if (((unint64_t)v73 & (unint64_t)&_mh_execute_header) != 0)
                  v137 = "YES";
                else
                  v137 = "NO";
                printf("\treq managed: %s\n", v137);
                printf("\treq other: ");
                if ((v73 & 0x40) != 0)
                {
                  printf("passive-int ");
                  if ((v73 & 0x80) != 0)
                    goto LABEL_413;
LABEL_403:
                  if ((v73 & 0x400) == 0)
                    goto LABEL_404;
LABEL_414:
                  printf("terminated ");
                  if ((v73 & 0x100000) != 0)
LABEL_405:
                    printf("boosted ");
                }
                else
                {
                  if ((v73 & 0x80) == 0)
                    goto LABEL_403;
LABEL_413:
                  printf("passive-ext ");
                  if ((v73 & 0x400) != 0)
                    goto LABEL_414;
LABEL_404:
                  if ((v73 & 0x100000) != 0)
                    goto LABEL_405;
                }
                putchar(10);
                printf("\treq suppression (App Nap) behaviors: ");
                if ((v73 & 0x1000000000) == 0)
                {
                  if ((v73 & 0x2000000000) == 0)
                    goto LABEL_408;
LABEL_417:
                  printf("low-priority-cpu (4) ");
                  if ((v73 & 0x200000000000) == 0)
                    goto LABEL_410;
LABEL_409:
                  printf("low-priority-cpu (28) ");
                  goto LABEL_410;
                }
                printf("active ");
                if ((v73 & 0x2000000000) != 0)
                  goto LABEL_417;
LABEL_408:
                if ((v73 & 0x200000000000) != 0)
                  goto LABEL_409;
LABEL_410:
                v138 = "LATENCY_QOS_TIER_0";
                switch(((unint64_t)v73 >> 38) & 7)
                {
                  case 0uLL:
                    goto LABEL_426;
                  case 1uLL:
                    goto LABEL_425;
                  case 2uLL:
                    v138 = "LATENCY_QOS_TIER_1";
                    goto LABEL_425;
                  case 3uLL:
                    v138 = "LATENCY_QOS_TIER_2";
                    goto LABEL_425;
                  case 4uLL:
                    v138 = "LATENCY_QOS_TIER_3";
                    goto LABEL_425;
                  case 5uLL:
                    v138 = "LATENCY_QOS_TIER_4";
                    goto LABEL_425;
                  default:
                    v138 = "LATENCY_QOS_TIER_5";
                    if ("LATENCY_QOS_TIER_0" != 6)
                      v138 = "???";
LABEL_425:
                    printf("timer-throttling (%s) ", v138);
LABEL_426:
                    v139 = "THROUGHPUT_QOS_TIER_0";
                    switch(((unint64_t)v73 >> 42) & 7)
                    {
                      case 0uLL:
                        goto LABEL_435;
                      case 1uLL:
                        goto LABEL_434;
                      case 2uLL:
                        v139 = "THROUGHPUT_QOS_TIER_1";
                        goto LABEL_434;
                      case 3uLL:
                        v139 = "THROUGHPUT_QOS_TIER_2";
                        goto LABEL_434;
                      case 4uLL:
                        v139 = "THROUGHPUT_QOS_TIER_3";
                        goto LABEL_434;
                      case 5uLL:
                        v139 = "THROUGHPUT_QOS_TIER_4";
                        goto LABEL_434;
                      default:
                        v139 = "THROUGHPUT_QOS_TIER_5";
                        if ("THROUGHPUT_QOS_TIER_0" != 6)
                          v139 = "???";
LABEL_434:
                        printf("throughput-qos (%s) ", v139);
LABEL_435:
                        if ((v73 & 0x20000000000) != 0)
                          printf("disk-throttling ");
                        if ((v73 & 0x400000000000) != 0)
                          printf("bg-sockets ");
                        putchar(10);
                        puts("effective policy");
                        v140 = (DWORD2(v73) >> 20) & 0xF;
                        v141 = "???";
                        if (v140 <= 8)
                          v141 = off_10000C3C0[v140];
                        printf("\teff role: %s\n", v141);
                        v142 = (DWORD2(v73) >> 11) & 7;
                        v143 = v142 == 6;
                        if (v142 >= 6)
                        {
                          v144 = "LATENCY_QOS_TIER_5";
                          if (!v143)
                            v144 = "???";
                        }
                        else
                        {
                          v144 = off_10000C458[v142];
                        }
                        printf("\teff latency qos: %s\n", v144);
                        v145 = (DWORD2(v73) >> 14) & 7;
                        v146 = v145 == 6;
                        if (v145 >= 6)
                        {
                          v147 = "THROUGHPUT_QOS_TIER_5";
                          if (!v146)
                            v147 = "???";
                        }
                        else
                        {
                          v147 = off_10000C488[v145];
                        }
                        printf("\teff thruput qos: %s\n", v147);
                        if ((BYTE8(v73) & 1) != 0)
                          v148 = "YES";
                        else
                          v148 = "NO";
                        printf("\teff darwin BG: %s\n", v148);
                        v149 = (DWORD2(v73) >> 2) & 3;
                        v150 = "THROTTLE_LEVEL_TIER3 (THROTTLE)";
                        if (v149 != 3)
                          v150 = off_10000C4B8[v149];
                        printf("\teff iotier: %s\n", v150);
                        if ((DWORD2(v73) & 0x2000000) != 0)
                          v151 = "YES";
                        else
                          v151 = "NO";
                        printf("\teff managed: %s\n", v151);
                        v152 = (*((_QWORD *)&v73 + 1) >> 30) & 7;
                        if ((_DWORD)v152 != 7 && ((0x7Du >> v152) & 1) != 0)
                        {
                          v153 = off_10000C420[v152];
                        }
                        else
                        {
                          v11 = (_DWORD)v152 == 1;
                          v153 = "THREAD_QOS_MAINTENANCE";
                          if (!v11)
                            v153 = "???";
                        }
                        v90 = v360;
                        printf("\teff qos ceiling: %s\n", v153);
                        v154 = (DWORD2(v73) >> 27) & 7;
                        if (v154 != 7 && ((0x7Du >> v154) & 1) != 0)
                        {
                          v155 = off_10000C420[v154];
                        }
                        else
                        {
                          v11 = v154 == 1;
                          v155 = "THREAD_QOS_MAINTENANCE";
                          if (!v11)
                            v155 = "???";
                        }
                        printf("\teff qos clamp: %s\n", v155);
                        printf("\teff other: ");
                        if ((BYTE8(v73) & 0x10) != 0)
                          printf("passive ");
                        v156 = "low-priority-cpu (4) ";
                        if ((BYTE8(v73) & 2) != 0 || (v156 = "low-priority-cpu (28) ", (DWORD2(v73) & 0x1000000) != 0))
                          printf(v156);
                        if ((BYTE8(v73) & 0x20) != 0)
                          printf("bg-allsockets ");
                        if ((BYTE8(v73) & 0x40) != 0)
                          printf("bg-newsockets ");
                        if ((WORD4(v73) & 0x200) != 0)
                          printf("terminated ");
                        if ((DWORD2(v73) & 0x20000) != 0)
                          printf("tal-engaged ");
                        if ((DWORD2(v73) & 0x40000) != 0)
                          printf("bg-watchers ");
                        if ((DWORD2(v73) & 0x80000) != 0)
                          printf("suppression-active (App Nap) ");
                        if ((DWORD2(v73) & 0x4000000) != 0)
                          printf("live-donor ");
                        if ((WORD4(v73) & 0x400) != 0)
                          printf("ui-is-urgent ");
                        if ((*((_QWORD *)&v73 + 1) & 0x400000000) != 0)
                          printf("coalition-suppressed (BG) ");
                        putchar(10);
                        break;
                    }
                    break;
                }
              }
              if ((buffer[0] & 0x20000) != 0)
                v157 = "YES";
              else
                v157 = "NO";
              printf("ios-appledaemon: %s\n", v157);
              if ((buffer[0] & 0x80000) != 0)
                v158 = "YES";
              else
                v158 = "NO";
              printf("ios-imppromotion: %s\n", v158);
              if ((buffer[0] & 0x1000000) != 0)
                v159 = "YES";
              else
                v159 = "NO";
              printf("ios-application: %s\n", v159);
              if ((v90 & 1) == 0)
              {
                v160 = getpriority(7, v76);
                if (v160 == 1)
                {
                  puts("game mode: ON");
                }
                else if (v160 == -1 && (byte_10001000D & 1) == 0)
                {
                  sub_1000090D8();
                }
                v161 = getpriority(8, v76);
                if (v161 == 1)
                {
                  puts("carplay mode: ON");
                }
                else if (v161 == -1 && (byte_10001000E & 1) == 0)
                {
                  sub_1000090B0();
                }
                *__error() = 0;
                v162 = getpriority(0, v76);
                if (v162)
                {
                  v163 = v162;
                  if (v162 == -1 && *__error())
                    perror("getpriority(PRIO_PROCESS, pid)");
                  else
                    printf("nice: %d\n", v163);
                }
                if ((v409 & 1) != 0)
                {
                  v164 = "YES";
                  v90 = v360;
                  if ((v409 & 2) == 0)
                  {
                    v164 = "YES (boosted receiver)";
                    if (!DWORD2(v408))
                      v164 = "NO";
                  }
                }
                else
                {
                  v90 = v360;
                  if ((v409 & 4) != 0)
                  {
                    v164 = "CURRENTLY";
                    if ((v409 & 2) == 0)
                      v164 = "NOT CURRENTLY";
                  }
                  else if ((v409 & 2) != 0)
                  {
                    v164 = "YES";
                  }
                  else
                  {
                    v164 = "NO";
                  }
                }
                printf("imp_donor: %s\n", v164);
                v165 = "DE-NAP";
                if ((v409 & 8) == 0)
                  v165 = "NO";
                if ((v409 & 1) != 0)
                  v166 = "YES";
                else
                  v166 = v165;
                printf("imp_receiver: %s\n", v166);
              }
              if ((v409 & 0x10) != 0)
                v167 = "YES";
              else
                v167 = "NO";
              printf("pid suspended: %s\n", v167);
              if ((buffer[0] & 0x100000) != 0)
                v168 = "YES";
              else
                v168 = "NO";
              if ((buffer[0] & 0x200000) != 0)
                v169 = "YES";
              else
                v169 = "NO";
              printf("adaptive daemon: %s (boosted: %s)\n", v168, v169);
              if (HIDWORD(v434))
              {
                puts("threads:");
                if (x[1])
                {
                  v170 = 0;
                  v361 = v90 | v336;
                  v362 = v39;
                  do
                  {
                    v399 = 0;
                    v398 = 0u;
                    thread_info_out = 0u;
                    v395[0] = 0;
                    v395[1] = 0;
                    v396 = 0;
                    v392 = 0;
                    v393 = 0;
                    v394 = 0;
                    *(_QWORD *)v391 = 0;
                    v389 = 0;
                    v390 = 0;
                    *(_QWORD *)v388 = 0;
                    v386 = 0u;
                    v387 = 0u;
                    *(_OWORD *)v384 = 0u;
                    v385 = 0u;
                    v444 = 0u;
                    v445 = 0u;
                    v442 = 0u;
                    v443 = 0u;
                    v440 = 0u;
                    v441 = 0u;
                    v439 = 0u;
                    task_info_outCnt = 10;
                    v171 = thread_info(act_list[v170], 3u, (thread_info_t)&thread_info_out, &task_info_outCnt);
                    if (v171)
                      mach_error("thread_info(... THREAD_BASIC_INFO ...)", v171);
                    task_info_outCnt = 6;
                    v172 = thread_info(act_list[v170], 4u, (thread_info_t)v395, &task_info_outCnt);
                    if (v172)
                      mach_error("thread_info(... THREAD_IDENTIFIER_INFO ...)", v172);
                    v173 = 0;
                    if ((_DWORD)v434 && v396)
                    {
                      __endptr[0] = 0;
                      object_type.i64[0] = 0;
                      outsize = 0;
                      v447 = 0;
                      v174 = vm_read_overwrite(task_list[v39], v396, 8uLL, (vm_address_t)__endptr, &outsize);
                      if (v174)
                      {
                        v175 = v174;
                        v176 = "vm_read_overwrite(... &qaddr ...)";
LABEL_554:
                        mach_error(v176, v175);
                        v173 = 0;
                        goto LABEL_555;
                      }
                      v173 = 0;
                      if (outsize == 8 && __endptr[0])
                      {
                        v195 = vm_read_overwrite(task_list[v39], (vm_address_t)&__endptr[0][v341], 8uLL, (vm_address_t)&object_type, &outsize);
                        if (v195)
                        {
                          v175 = v195;
                          v176 = "vm_read_overwrite(... &label_addr ...)";
                          goto LABEL_554;
                        }
                        v173 = 0;
                        if (outsize == 8 && object_type.i64[0])
                        {
                          v251 = vm_read_overwrite(task_list[v39], object_type.u64[0], 0x40uLL, (vm_address_t)v446, &outsize);
                          if (v251)
                          {
                            v175 = v251;
                            v176 = "vm_read_overwrite(... dqlabel ...)";
                            goto LABEL_554;
                          }
                          v173 = 1;
                        }
                      }
                    }
LABEL_555:
                    if (DWORD1(v398) == 2)
                    {
                      task_info_outCnt = 5;
                      v180 = thread_info(act_list[v170], 0xBu, (thread_info_t)&v392, &task_info_outCnt);
                      if (!v180)
                        goto LABEL_562;
                      v178 = v180;
                      v179 = "thread_info(... THREAD_SCHED_RR_INFO ...)";
                      goto LABEL_561;
                    }
                    if (DWORD1(v398) == 1)
                    {
                      task_info_outCnt = 5;
                      v177 = thread_info(act_list[v170], 0xAu, (thread_info_t)&v392, &task_info_outCnt);
                      if (v177)
                      {
                        v178 = v177;
                        v179 = "thread_info(... THREAD_SCHED_TIMESHARE_INFO ...)";
LABEL_561:
                        mach_error(v179, v178);
                      }
                    }
LABEL_562:
                    get_default = 0;
                    task_info_outCnt = 1;
                    v181 = thread_policy_get(act_list[v170], 1u, &v391[1], &task_info_outCnt, &get_default);
                    if (v181)
                      mach_error("thread_policy_get(... THREAD_EXTENDED_POLICY ...)", v181);
                    v381 = 0;
                    task_info_outCnt = 5;
                    v182 = thread_policy_get(act_list[v170], 0xAu, (thread_policy_t)&v389, &task_info_outCnt, &v381);
                    if (v182)
                      mach_error("thread_policy_get(... THREAD_TIME_CONSTRAINT_WITH_PRIORITY_POLICY ...)", v182);
                    v381 = 0;
                    task_info_outCnt = 1;
                    v183 = thread_policy_get(act_list[v170], 3u, &v388[1], &task_info_outCnt, &v381);
                    if (v183)
                      mach_error("thread_policy_get(... THREAD_PRECEDENCE_POLICY ...)", v183);
                    v381 = 0;
                    task_info_outCnt = 1;
                    v184 = thread_policy_get(act_list[v170], 4u, v388, &task_info_outCnt, &v381);
                    if (v184)
                    {
                      if (v184 == 46)
                      {
                        v368 = 1;
                        goto LABEL_573;
                      }
                      mach_error("thread_policy_get(... THREAD_AFFINITY_POLICY ...)", v184);
                    }
                    v368 = 0;
LABEL_573:
                    v381 = 0;
                    task_info_outCnt = 16;
                    v185 = thread_policy_get(act_list[v170], 6u, v384, &task_info_outCnt, &v381);
                    if (v185)
                      mach_error("thread_policy_get(... THREAD_POLICY_STATE ...)", v185);
                    v186 = DWORD2(v385);
                    v187 = v385;
                    v188 = proc_pidinfo(v76, 15, v395[0], &v439, 112);
                    if (v188 <= 111)
                      perror("proc_pidinfo(... PROC_PIDTHREADID64INFO ...)");
                    printf("\tthread ID: 0x%llx / %lld\n", v395[0], v395[0]);
                    if ((_BYTE)v442)
                    {
                      printf("\tthread name: \"%s\"\n");
                    }
                    else if (v173)
                    {
                      printf("\tdispatch queue name: \"%s\"\n");
                    }
                    printf("\tuser/system time: %lf s / %lf s\n", (double)SDWORD1(thread_info_out) / 1000000.0 + (double)(int)thread_info_out, (double)SHIDWORD(thread_info_out) / 1000000.0 + (double)SDWORD2(thread_info_out));
                    if (byte_100010003 != 0 && v375 && v188 >= 112)
                    {
                      if ((int)v354 >= 3)
                        sub_100009060();
                      *__error() = 0;
                      if (proc_pidinfo(pid[0], 34, v395[0], &word_100010020, 88) < 40 * (int)v354 + 8)
                        perror("proc_pidinfo(... PROC_PIDTHREADCOUNTS ...)");
                      if ((_DWORD)v354 != (unsigned __int16)word_100010020)
                        fprintf(__stderrp, "threadcounts.ptc_len %d mismatch with level_count %d\n", (unsigned __int16)word_100010020, v354);
                      v189 = 0;
                      v190 = 0uLL;
                      if ((_DWORD)v354)
                      {
                        v191 = v354;
                        v192 = &qword_100010048;
                        v193 = 0uLL;
                        do
                        {
                          v193 = vaddq_s64(*((int64x2_t *)v192 - 1), v193);
                          v190 = vaddq_s64(*((int64x2_t *)v192 - 2), v190);
                          v194 = *v192;
                          v192 += 5;
                          v189 += v194;
                          --v191;
                        }
                        while (v191);
                      }
                      else
                      {
                        v193 = 0uLL;
                      }
                      v355 = v193;
                      v357 = v190;
                      *(int64x2_t *)__endptr = v190;
                      v538 = v193;
                      *(_QWORD *)&v539 = v189;
                      object_type.i64[0] = v353;
                      object_type.i64[1] = v352;
                      v379.i64[0] = v351;
                      v379.i64[1] = v350;
                      v380 = v349;
                      sub_10000867C("\tCPU time:", (unint64_t *)__endptr, &object_type, 1, " of task");
                      if (v354 >= 2)
                      {
                        v196 = 0;
                        v197 = &xmmword_100010028;
                        do
                        {
                          if (v196 == 24)
                            sub_100009088();
                          if (qword_1000100B8 != -1)
                            dispatch_once(&qword_1000100B8, &stru_10000C328);
                          printf("\t%s:", *(const char **)((char *)&off_10000C348 + v196));
                          v198 = v197[1];
                          *(_OWORD *)__endptr = *v197;
                          v538 = (int64x2_t)v198;
                          *(_QWORD *)&v539 = *((_QWORD *)v197 + 4);
                          object_type = v357;
                          v379 = v355;
                          v380 = v189;
                          sub_10000867C((const char *)&unk_100009E75, (unint64_t *)__endptr, &object_type, 1, (const char *)&unk_100009E75);
                          v196 += 8;
                          v197 = (__int128 *)((char *)v197 + 40);
                        }
                        while (8 * v354 != v196);
                      }
                    }
                    printf("\tCPU usage (over last tick): %d%%\n", (int)v398 / 10);
                    v199 = "timeshare";
                    if (!v391[1])
                      v199 = "fixed-priority";
                    v200 = "real-time";
                    if (!get_default)
                      v200 = v199;
                    printf("\tsched mode: %s", v200);
                    if (DWORD1(v398) == 1 && (get_default || !v391[1]))
                      printf(" demoted to policy %s: base priority: %d cur priority %d", "POLICY_TIMESHARE", HIDWORD(v392), v393);
                    putchar(10);
                    v16 = v371;
                    if (get_default)
                      goto LABEL_617;
                    if (DWORD1(v398) >= 3)
                    {
                      v201 = "POLICY_FIFO";
                      if (DWORD1(v398) != 4)
                        v201 = "???";
                    }
                    else
                    {
                      v201 = off_10000C408[SDWORD1(v398)];
                    }
                    printf("\tpolicy: %s\n", v201);
                    if (get_default)
                    {
LABEL_617:
                      printf("\t\treal-time priority: %u\n", v391[0]);
                      printf("\t\treal-time period: %u\n", v389);
                      printf("\t\treal-time computation: %u\n", HIDWORD(v389));
                      printf("\t\treal-time constraint: %u\n", v390);
                      printf("\t\treal-time preemptible: %s\n");
                    }
                    else if (DWORD1(v398) == 2)
                    {
                      printf("\t\tround-robin max  priority: %d\n", v392);
                      printf("\t\tround-robin base priority: %d\n", HIDWORD(v392));
                      printf("\t\tround-robin quantum: %d\n", v393);
                      printf("\t\tround-robin depressed: %s, prio %d\n");
                    }
                    else if (DWORD1(v398) == 1)
                    {
                      printf("\t\ttimeshare max  priority: %d\n", v392);
                      printf("\t\ttimeshare base priority: %d\n", HIDWORD(v392));
                      printf("\t\ttimeshare cur  priority: %d\n", v393);
                      if (HIDWORD(v393))
                        v249 = "YES";
                      else
                        v249 = "NO";
                      printf("\t\ttimeshare depressed: %s, prio %d\n", v249, v394);
                    }
                    puts("\trequested policy:");
                    v202 = (v187 >> 15) & 7;
                    if (v202 != 7 && ((0x7Du >> v202) & 1) != 0)
                    {
                      v203 = off_10000C420[v202];
                    }
                    else
                    {
                      v11 = v202 == 1;
                      v203 = "THREAD_QOS_MAINTENANCE";
                      if (!v11)
                        v203 = "???";
                    }
                    printf("\t\treq thread qos: %s, relprio: %d\n", v203, -((v187 >> 18) & 0xF));
                    puts("\t\treq workqueue/pthread overrides:");
                    v204 = (v187 >> 22) & 7;
                    if (v204 != 7 && ((0x7Du >> v204) & 1) != 0)
                    {
                      v205 = off_10000C420[v204];
                    }
                    else
                    {
                      v11 = v204 == 1;
                      v205 = "THREAD_QOS_MAINTENANCE";
                      if (!v11)
                        v205 = "???";
                    }
                    printf("\t\t\treq legacy qos override: %s\n", v205);
                    v206 = HIDWORD(v187) & 7;
                    if ((_DWORD)v206 != 7 && ((0x7Du >> (BYTE4(v187) & 7)) & 1) != 0)
                    {
                      v207 = off_10000C420[v206];
                    }
                    else
                    {
                      v11 = (_DWORD)v206 == 1;
                      v207 = "THREAD_QOS_MAINTENANCE";
                      if (!v11)
                        v207 = "???";
                    }
                    printf("\t\t\treq workqueue qos override: %s\n", v207);
                    puts("\t\treq kernel overrides:");
                    v208 = (v187 >> 28) & 7;
                    if (v208 != 7 && ((0x7Du >> v208) & 1) != 0)
                    {
                      v209 = off_10000C420[v208];
                    }
                    else
                    {
                      v11 = v208 == 1;
                      v209 = "THREAD_QOS_MAINTENANCE";
                      if (!v11)
                        v209 = "???";
                    }
                    printf("\t\t\treq kevent overrides: %s\n", v209);
                    v210 = (v187 >> 35) & 7;
                    if ((_DWORD)v210 != 7 && ((0x7Du >> v210) & 1) != 0)
                    {
                      v211 = off_10000C420[v210];
                    }
                    else
                    {
                      v11 = (_DWORD)v210 == 1;
                      v211 = "THREAD_QOS_MAINTENANCE";
                      if (!v11)
                        v211 = "???";
                    }
                    printf("\t\t\treq workloop servicer override: %s\n", v211);
                    v212 = (v187 >> 25) & 7;
                    if (v212 != 7 && ((0x7Du >> v212) & 1) != 0)
                    {
                      v213 = off_10000C420[v212];
                    }
                    else
                    {
                      v11 = v212 == 1;
                      v213 = "THREAD_QOS_MAINTENANCE";
                      if (!v11)
                        v213 = "???";
                    }
                    printf("\t\treq turnstiles sync promotion qos: %s, user promotion base pri: %d\n", v213, DWORD1(v386));
                    v214 = (v187 >> 8) & 7;
                    v215 = v214 == 6;
                    if (v214 >= 6)
                    {
                      v216 = "LATENCY_QOS_TIER_5";
                      if (!v215)
                        v216 = "???";
                    }
                    else
                    {
                      v216 = off_10000C458[v214];
                    }
                    printf("\t\treq latency qos: %s\n", v216);
                    v217 = (v187 >> 11) & 7;
                    v218 = v217 == 6;
                    if (v217 >= 6)
                    {
                      v219 = "THROUGHPUT_QOS_TIER_5";
                      if (!v218)
                        v219 = "???";
                    }
                    else
                    {
                      v219 = off_10000C488[v217];
                    }
                    printf("\t\treq thruput qos: %s\n", v219);
                    if ((v187 & 3) != 0)
                      v220 = "YES";
                    else
                      v220 = "NO";
                    v221 = (const char *)&unk_100009E75;
                    v222 = "(internal)";
                    if ((v187 & 1) == 0)
                      v222 = (const char *)&unk_100009E75;
                    if ((v187 & 2) != 0)
                      v221 = "(external)";
                    printf("\t\treq darwin BG: %s %s %s\n", v220, v222, v221);
                    v223 = (v187 >> 2) & 3;
                    v224 = "THROTTLE_LEVEL_TIER3 (THROTTLE)";
                    if (v223 != 3)
                      v224 = off_10000C4B8[v223];
                    v225 = (v187 >> 4) & 3;
                    v226 = "THROTTLE_LEVEL_TIER3 (THROTTLE)";
                    if (v225 != 3)
                      v226 = off_10000C4B8[v225];
                    printf("\t\treq internal/external iotier: %s / %s\n", v224, v226);
                    printf("\t\treq other: ");
                    if ((v187 & 0x40) != 0)
                    {
                      printf("passive-int ");
                      if ((v187 & 0x80) == 0)
                      {
LABEL_675:
                        if ((v187 & 0x4000) == 0)
                          goto LABEL_676;
                        goto LABEL_687;
                      }
                    }
                    else if ((v187 & 0x80) == 0)
                    {
                      goto LABEL_675;
                    }
                    printf("passive-ext ");
                    if ((v187 & 0x4000) == 0)
                    {
LABEL_676:
                      if ((v187 & 0x10000000000) == 0)
                        goto LABEL_678;
LABEL_677:
                      printf("workload-property-controlled ");
                      goto LABEL_678;
                    }
LABEL_687:
                    printf("bg-pidbind ");
                    if ((v187 & 0x10000000000) != 0)
                      goto LABEL_677;
LABEL_678:
                    if ((v384[3] & 1) != 0)
                      printf("static-param ");
                    putchar(10);
                    puts("\teffective policy:");
                    v227 = (v186 >> 14) & 7;
                    v39 = v362;
                    if (v227 != 7 && ((0x7Du >> v227) & 1) != 0)
                    {
                      v228 = off_10000C420[v227];
                    }
                    else
                    {
                      v11 = v227 == 1;
                      v228 = "THREAD_QOS_MAINTENANCE";
                      if (!v11)
                        v228 = "???";
                    }
                    printf("\t\teff thread qos: %s\n", v228);
                    printf("\t\teff thread qos relprio: %d\n", -((v186 >> 17) & 0xF));
                    v229 = (v186 >> 21) & 7;
                    if (v229 != 7 && ((0x7Du >> v229) & 1) != 0)
                    {
                      v230 = off_10000C420[v229];
                    }
                    else
                    {
                      v11 = v229 == 1;
                      v230 = "THREAD_QOS_MAINTENANCE";
                      if (!v11)
                        v230 = "???";
                    }
                    printf("\t\teff promotion qos: %s\n", v230);
                    v231 = (v186 >> 8) & 7;
                    v232 = v231 == 6;
                    if (v231 >= 6)
                    {
                      v233 = "LATENCY_QOS_TIER_5";
                      if (!v232)
                        v233 = "???";
                    }
                    else
                    {
                      v233 = off_10000C458[v231];
                    }
                    printf("\t\teff latency qos: %s\n", v233);
                    v234 = (v186 >> 11) & 7;
                    v235 = v234 == 6;
                    if (v234 >= 6)
                    {
                      v236 = "THROUGHPUT_QOS_TIER_5";
                      if (!v235)
                        v236 = "???";
                    }
                    else
                    {
                      v236 = off_10000C488[v234];
                    }
                    printf("\t\teff thruput qos: %s\n", v236);
                    if ((v186 & 1) != 0)
                      v237 = "YES";
                    else
                      v237 = "NO";
                    printf("\t\teff darwin BG: %s\n", v237);
                    v238 = (v186 >> 1) & 3;
                    v239 = "THROTTLE_LEVEL_TIER3 (THROTTLE)";
                    if (v238 != 3)
                      v239 = off_10000C4B8[v238];
                    printf("\t\teff iotier: %s\n", v239);
                    printf("\t\teff other: ");
                    LODWORD(v76) = pid[0];
                    if ((v186 & 8) != 0)
                    {
                      printf("passive ");
                      if ((v186 & 0x80) == 0)
                      {
LABEL_711:
                        if ((v186 & 0x10) == 0)
                          goto LABEL_712;
                        goto LABEL_721;
                      }
                    }
                    else if ((v186 & 0x80) == 0)
                    {
                      goto LABEL_711;
                    }
                    printf("ui-is-urgent (47) ");
                    if ((v186 & 0x10) == 0)
                    {
LABEL_712:
                      if ((v186 & 0x20) == 0)
                        goto LABEL_713;
                      goto LABEL_722;
                    }
LABEL_721:
                    printf("bg-allsockets ");
                    if ((v186 & 0x20) == 0)
                    {
LABEL_713:
                      if ((v186 & 0x40) == 0)
                        goto LABEL_714;
                      goto LABEL_723;
                    }
LABEL_722:
                    printf("bg-newsockets ");
                    if ((v186 & 0x40) == 0)
                    {
LABEL_714:
                      if ((v186 & 0x2000000) == 0)
                        goto LABEL_715;
                      goto LABEL_724;
                    }
LABEL_723:
                    printf("terminated ");
                    if ((v186 & 0x2000000) == 0)
                    {
LABEL_715:
                      if ((v186 & 0x1000000) == 0)
                        goto LABEL_717;
LABEL_716:
                      printf("promote-above-task ");
                      goto LABEL_717;
                    }
LABEL_724:
                    printf("workload-property-controlled ");
                    if ((v186 & 0x1000000) != 0)
                      goto LABEL_716;
LABEL_717:
                    putchar(10);
                    if ((DWORD2(v398) - 1) >= 4)
                    {
                      v240 = "TH_STATE_HALTED";
                      if (DWORD2(v398) != 5)
                        v240 = "???";
                    }
                    else
                    {
                      v240 = off_10000C4D0[DWORD2(v398) - 1];
                    }
                    printf("\trun state: %s\n", v240);
                    if (HIDWORD(v398))
                    {
                      v241 = "TH_FLAGS_SWAPPED ";
                      if ((BYTE12(v398) & 1) == 0)
                        v241 = (const char *)&unk_100009E75;
                      v242 = "TH_FLAGS_IDLE ";
                      if ((BYTE12(v398) & 2) == 0)
                        v242 = (const char *)&unk_100009E75;
                      v243 = "TH_FLAGS_GLOBAL_FORCED_IDLE ";
                      if ((BYTE12(v398) & 4) == 0)
                        v243 = (const char *)&unk_100009E75;
                      printf("\tflags: %s%s%s\n", v241, v242, v243);
                    }
                    printf("\tsuspend count: %d\n", v399);
                    printf("\tsleep time: %d s\n", HIDWORD(v399));
                    printf("\timportance in task: %d\n", v388[1]);
                    if ((v368 & 1) == 0)
                      printf("\taffinity tag: %d\n", v388[0]);
                    if ((v361 & 1) != 0)
                      goto LABEL_768;
                    voucher = 0;
                    mach_voucher = thread_get_mach_voucher(act_list[v170], 0, &voucher);
                    if (mach_voucher)
                      mach_error("thread_get_mach_voucher(...)", mach_voucher);
                    v245 = voucher;
                    if (!voucher)
                      goto LABEL_768;
                    object_type.i32[0] = 0;
                    LODWORD(outsize) = 0;
                    v246 = mach_port_kernel_object(mach_task_self_, voucher, (unsigned int *)&object_type, (unsigned int *)&outsize);
                    if (v246)
                    {
                      LODWORD(v247) = v246;
                      v248 = "mach_port_kernel_object(...)";
                    }
                    else
                    {
                      if (object_type.i32[0] != 37)
                        goto LABEL_767;
                      printf("\tvoucher: 0x%x\n", outsize);
                      recipesCnt = 0x2000;
                      v250 = mach_voucher_debug_info(mach_task_self_, v245, (mach_voucher_attr_raw_recipe_array_t)__endptr, &recipesCnt);
                      if ((_DWORD)v250 == 46 || !recipesCnt)
                        goto LABEL_767;
                      v247 = v250;
                      if (!(_DWORD)v250)
                      {
                        for (j = 0; j < recipesCnt; j += v253[3] + 16)
                        {
                          v253 = (_DWORD *)((char *)__endptr + j);
                          if (*v253 == 3 || *v253 == 2)
                            printf("\t\t%s\n", v247);
                          else
                            printf("\t\tUnknown (%d): %s\n", v247);
                        }
                        goto LABEL_767;
                      }
                      v248 = "mach_voucher_debug_info(...)";
                    }
                    mach_error(v248, v247);
LABEL_767:
                    mach_port_deallocate(mach_task_self_, voucher);
LABEL_768:
                    mach_port_deallocate(mach_task_self_, act_list[v170]);
                    putchar(10);
                    ++v170;
                  }
                  while (v170 < x[1]);
                }
              }
              putchar(10);
LABEL_772:
              ++v39;
              v37 = task_listCnt;
              v38 = size[1] == 0;
            }
            while (v39 < task_listCnt && !size[1]);
          }
        }
        else
        {
          v37 = 0;
          v38 = size[1] == 0;
        }
        if (!v343)
          goto LABEL_863;
        if (v38)
        {
          puts("Coalitions: ");
          v37 = task_listCnt;
        }
        v363 = task_list;
        v254 = proc_listpids(1u, 0, 0, 0);
        if (v254 <= 0)
        {
          v262 = __stderrp;
          __error();
          fprintf(v262, "proc_listpids(PROC_ALL_PIDS): %d\n");
LABEL_791:
          v260 = 0;
          v261 = 0;
          goto LABEL_792;
        }
        if (2 * (unint64_t)v254 <= 0x1E)
          v255 = 30;
        else
          v255 = 2 * v254;
        v256 = malloc_type_malloc(v255, 0xCD8F765CuLL);
        v257 = proc_listpids(1u, 0, v256, v255);
        if (v257 <= 0)
        {
          v263 = __stderrp;
          __error();
          fprintf(v263, "proc_listpids(PROC_ALL_PIDS, pids): %d\n");
          goto LABEL_791;
        }
        v258 = v257;
        v259 = v257 >> 2;
        v260 = (char *)malloc_type_calloc(v259, 0xA0uLL, 0x10000405CF0D5D0uLL);
        v376 = v256;
        v261 = 0;
        if (v258 >= 4)
        {
          if (v259 <= 1)
            v301 = 1;
          else
            v301 = v259;
          do
          {
            if (*v256)
            {
              v302 = proc_name(*v256, &v260[160 * v261 + 24], 0x40u);
              v303 = *v256;
              if (v302 < 0)
              {
                fprintf(__stderrp, "skipping pid %u (proc_name)\n");
              }
              else
              {
                LODWORD(v439) = *v256;
                *__error() = 0;
                *(_QWORD *)&v539 = 0;
                *(_OWORD *)__endptr = 0u;
                v538 = 0u;
                if (proc_pidinfo(v303, 20, 1uLL, __endptr, 40) == 40)
                {
                  *__error() = 0;
                  *(_QWORD *)&v449 = 0;
                  buffer[0] = 8;
                  if ((sysctlbyname("kern.coalition_roles", &v449, buffer, &v439, 4uLL) & 0x80000000) == 0
                    && buffer[0] == 8
                    || !byte_100010001 && *__error() == 2)
                  {
                    v304 = &v260[160 * v261];
                    *(_OWORD *)v304 = *(_OWORD *)__endptr;
                    *((_QWORD *)v304 + 2) = v449;
                    v305 = *v256;
                    v306.i64[0] = -1;
                    v306.i64[1] = -1;
                    *(int64x2_t *)__endptr = v306;
                    v538 = v306;
                    LODWORD(v449) = 0;
                    if (!task_name_for_pid(mach_task_self_, v305, (mach_port_name_t *)&v449))
                    {
                      LODWORD(buffer[0]) = 8;
                      task_info(v449, 0xFu, (task_info_t)__endptr, (mach_msg_type_number_t *)buffer);
                      mach_port_deallocate(mach_task_self_, v449);
                    }
                    if (v538.i32[1] == -1)
                    {
                      fprintf(__stderrp, "skipping pid %u (get_audit_token)\n");
                    }
                    else
                    {
                      v307 = &v260[160 * v261];
                      v308 = *(_OWORD *)__endptr;
                      *(int64x2_t *)(v307 + 104) = v538;
                      *(_OWORD *)(v307 + 88) = v308;
                      *(_OWORD *)(v307 + 120) = 0u;
                      *(_OWORD *)(v307 + 136) = 0u;
                      *((_DWORD *)v307 + 38) = *v256;
                      ++v261;
                    }
                    goto LABEL_888;
                  }
                  v310 = __stderrp;
                  __error();
                  fprintf(v310, "kern.coalition_roles(%d): %d\n");
                }
                else
                {
                  v309 = __stderrp;
                  __error();
                  fprintf(v309, "PROC_PIDCOALITIONINFO(%d): %d\n");
                }
                fprintf(__stderrp, "skipping pid %u (fill_coalitions)\n");
              }
            }
LABEL_888:
            ++v256;
            --v301;
          }
          while (v301);
        }
        free(v376);
        v16 = v371;
LABEL_792:
        if (v343 == 3)
        {
          v264 = 0;
          v359 = 0;
          v265 = (int (__cdecl *)(const void *, const void *))sub_100008FEC;
        }
        else
        {
          v264 = 1;
          v359 = 1;
          v265 = (int (__cdecl *)(const void *, const void *))sub_100008F94;
        }
        qsort(v260, v261, 0xA0uLL, v265);
        printf("PID   Command                           ");
        printf("Resource  Jetsam  Role   ");
        printf("  Apptype  Background App Nap");
        putchar(10);
        v369 = v261;
        if (v261)
        {
          *(_QWORD *)pida = 0;
          v266 = 0;
          v267 = v373 != 0;
          if (__s1)
            v268 = v264;
          else
            v268 = 0;
          v374 = v268;
          v372 = v16 && v267;
          v269 = "     ";
          do
          {
            v270 = &v260[160 * v266];
            v271 = *((_DWORD *)v270 + 5) + 1;
            v272 = "(unknwn)";
            if (v271 <= 4)
              v272 = off_10000C4F0[v271];
            v273 = *(_DWORD *)&v260[160 * v266 + 16 + 4 * v359] == 1;
            if (!v374)
            {
LABEL_811:
              v275 = v269;
              v276 = &v260[160 * v266];
              v279 = *((_DWORD *)v276 + 38);
              v278 = (int *)(v276 + 152);
              v277 = v279;
              if (v273 || v277 == 1)
                printf("%-5u %-34s");
              else
                printf("  %-5u %-32s");
              printf(" %7llu %7llu  %s ", *(_QWORD *)v270, *((_QWORD *)v270 + 1), v272);
              v280 = *v278;
              v281 = v358;
              v283 = v37;
              v282 = v363;
              v269 = v275;
              if (!v37)
                goto LABEL_821;
              while (1)
              {
                v284 = *v281++;
                if (v284 == v280)
                  break;
                ++v282;
                if (!--v283)
                  goto LABEL_821;
              }
              v285 = *v282;
              if (!*v282)
              {
LABEL_821:
                fprintf(__stderrp, "could not find task for pid %d", v280);
                v285 = 0;
              }
              v539 = 0u;
              v540 = 0u;
              *(_OWORD *)__endptr = 0u;
              v538 = 0u;
              LODWORD(v449) = 16;
              LODWORD(buffer[0]) = 0;
              v286 = task_policy_get(v285, 4u, (task_policy_t)__endptr, (mach_msg_type_number_t *)&v449, (BOOLean_t *)buffer);
              if (v286)
                mach_error("task_policy_get(TASK_POLICY_STATE)", v286);
              v287 = DWORD2(v540);
              v288 = "???";
              switch((v540 >> 17) & 7)
              {
                case 0u:
                  v288 = "        ";
                  break;
                case 1u:
                  v288 = "Int Dmon";
                  break;
                case 2u:
                  v288 = "Std Dmon";
                  break;
                case 3u:
                  v288 = "Adaptive";
                  break;
                case 4u:
                  v288 = "BG Dmon ";
                  break;
                case 5u:
                  v289 = (DWORD2(v540) >> 20) & 0xF;
                  if (v289 < 9)
                    v288 = off_10000C518[v289];
                  break;
                case 7u:
                  v288 = "Driver  ";
                  break;
                default:
                  break;
              }
              printf("  %s ", v288);
              v290 = coalition_policy_get(*((_QWORD *)v270 + 1), 1);
              if (v290 == 1)
              {
                printf(" CBG ");
              }
              else if (v290 == -1)
              {
                perror("coalition_policy_get(COALITION_POLICY_SUPPRESS) failed");
              }
              else
              {
                printf(v275);
              }
              if (((uint64_t)__endptr[1] & 0x10) != 0)
                printf(" TBG ");
              else
                printf(v275);
              v291 = " Nap     ";
              if ((*(_QWORD *)&v287 & 0x80000) == 0)
                v291 = "         ";
              if ((v539 & 0x10) != 0)
                printf(" Suspend ");
              else
                printf(v291);
              if (v372)
              {
                v292 = sub_1000085D8();
                v294 = v293;
                v295 = sub_1000085D8();
                v296 = v295;
                v298 = v297;
                if ((!((unint64_t)v295 | (unint64_t)v292) || v292 && v295 && !strcmp(v292, v295))
                  && (!((unint64_t)v298 | (unint64_t)v294) || v294 && v298 && !strcmp(v294, v298)))
                {
                  printf(" (%s, %s)");
                }
                else
                {
                  printf(" (%s, %s; %s, %s)");
                }
                free(v292);
                free(v294);
                free(v296);
                free(v298);
                v269 = v275;
              }
              putchar(10);
              goto LABEL_859;
            }
            if (!strncmp(__s1, &v260[160 * v266 + 24], 0x20uLL) || v347 && *(_DWORD *)&v260[160 * v266 + 152] == v346)
            {
              v274 = *(_QWORD *)pida;
              if (v273 && !*(_QWORD *)pida)
                v274 = *((_QWORD *)v270 + 1);
              if (!v274)
              {
LABEL_819:
                *(_QWORD *)pida = 0;
                goto LABEL_859;
              }
            }
            else
            {
              v274 = *(_QWORD *)pida;
              if (!*(_QWORD *)pida)
                goto LABEL_819;
            }
            *(_QWORD *)pida = v274;
            if (v274 == *((_QWORD *)v270 + 1))
              goto LABEL_811;
LABEL_859:
            ++v266;
          }
          while (v266 != v369);
        }
        free(v260);
        v37 = task_listCnt;
LABEL_863:
        if (v37)
        {
          v299 = 0;
          do
            mach_port_deallocate(mach_task_self_, task_list[v299++]);
          while (v299 < task_listCnt);
        }
        if (cf)
        {
          CFRelease(cf);
          stackshot_config_dealloc(v337);
        }
        free(v358);
        free(v344);
        return 0;
      case 0:
        continue;
      case 1:
        if (optarg)
          v6 = sub_100008484();
        else
          v6 = 1;
        v375 = v6 != 0;
        continue;
      case 2:
        if (optarg)
          v7 = sub_100008484();
        else
          v7 = 1;
        v5 = v7 != 0;
        continue;
      case 3:
        v434 = 0x100000001;
        size[2] = 1;
        v373 = 1;
        byte_100010000 = 1;
        continue;
      case 4:
        v9 = optarg;
        v4 = 2;
        if (strcmp(optarg, "jetsam"))
        {
          v4 = 3;
          if (strcmp(v9, "resource"))
            sub_1000091D4(v9);
        }
        continue;
      case 5:
        if (optarg)
          v10 = sub_100008484();
        else
          v10 = 1;
        byte_100010000 = v10 != 0;
        continue;
      case 6:
        if (optarg)
          v8 = sub_100008484();
        else
          v8 = 1;
        v371 = v8 != 0;
        continue;
      case 7:
        v434 = 0x100000001;
        v373 = 1;
        size[2] = 1;
        v4 = 2;
        continue;
      default:
        puts("usage:");
        puts("\ttaskinfo [-h|--help] [--threads] [--dq] [--boosts] [--verbose] [--all]");
        puts("\t\t [--precise(=1|0)] [--xpcinfo(=1|0)] [--coalitions-only] [--threadcounts(=1|0)]");
        puts("\t\t [--vouchers(=1|0)] [--coalitions=(all|jetsam|resource)] [process-name|pid]");
        return 0;
    }
  }
}

unint64_t sub_100008484()
{
  unint64_t result;
  char *__endptr;

  __endptr = 0;
  result = strtoull(optarg, &__endptr, 10);
  if (__endptr == optarg || *__endptr)
    sub_10000920C(optarg);
  return result;
}

uint64_t sub_1000084E0(const char *a1)
{
  size_t v3;
  int v4;

  v4 = 0;
  v3 = 4;
  *__error() = 0;
  if (sysctlbyname(a1, &v4, &v3, 0, 0) != -1)
    return 1;
  if (*__error() != 2)
  {
    perror(a1);
    return 1;
  }
  return 0;
}

uint64_t sub_100008560(const char *a1)
{
  size_t v3;
  unsigned int v4;

  v4 = 0;
  v3 = 4;
  *__error() = 0;
  if (sysctlbyname(a1, &v4, &v3, 0, 0) == -1 && *__error() != 2)
    perror(a1);
  return v4;
}

char *sub_1000085D8()
{
  void *v0;
  char *v1;
  const char *v2;
  const char *string;

  v0 = (void *)xpc_coalition_copy_info();
  if (xpc_get_type(v0) != (xpc_type_t)&_xpc_type_dictionary)
  {
    v1 = strdup("coalition unknown");
    v2 = "to launchd";
LABEL_7:
    strdup(v2);
    return v1;
  }
  string = xpc_dictionary_get_string(v0, XPC_COALITION_INFO_KEY_NAME);
  if (string)
    v1 = strdup(string);
  else
    v1 = 0;
  v2 = xpc_dictionary_get_string(v0, XPC_COALITION_INFO_KEY_BUNDLE_IDENTIFIER);
  if (v2)
    goto LABEL_7;
  return v1;
}

uint64_t sub_10000867C(const char *a1, unint64_t *a2, _QWORD *a3, int a4, const char *a5)
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  unint64_t v13;
  double v14;
  unint64_t v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  double v19;
  double v20;

  v9 = a2[3] + a2[2];
  v10 = a3[2];
  v11 = a3[3];
  printf("%s %llu.%06llu s ", a1, v9 * dword_100010004 / unk_100010008 / 0x3B9ACA00, v9 * dword_100010004 / unk_100010008 % 0x3B9ACA00 / 0x3E8);
  if (a4)
  {
    if (v11 + v10)
      v12 = (double)v9 * 100.0 / (double)(unint64_t)(v11 + v10);
    else
      v12 = 0.0;
    printf("(%.2f%%%s) ", v12, a5);
  }
  if (byte_100010000)
    printf("(%llu cycles, %llu instructions");
  else
    printf("(%.2f%s cycles, %.2f%s instructions");
  v13 = a2[1];
  if (v13)
    v14 = (double)*a2 / (double)v13;
  else
    v14 = 0.0;
  printf(", IPC %.3f, ", v14);
  if ((double)(v9 * dword_100010004 / unk_100010008) / 1000000000.0 != 0.0)
  {
    if (!byte_100010000)
      goto LABEL_17;
LABEL_16:
    printf("%.0f hz ");
    goto LABEL_18;
  }
  if (byte_100010000)
    goto LABEL_16;
LABEL_17:
  printf("%.2f%s%s, ");
LABEL_18:
  sub_100008B94();
  if (a4)
  {
    v15 = a3[4];
    if (v15)
      v16 = (double)a2[4] * 100.0 / (double)v15;
    else
      v16 = 0.0;
    printf(" (%.2f%%%s)", v16, a5);
  }
  printf(") ");
  v17 = a2[2];
  v18 = a2[3];
  if (v9)
  {
    v19 = (double)v17 * 100.0 / (double)v9;
    v20 = (double)v18 * 100.0 / (double)v9;
  }
  else
  {
    v19 = 0.0;
    v20 = 0.0;
  }
  return printf("user/system: %llu.%06llu / %llu.%06llu (%.0f%% / %.0f%%)\n", v17 * dword_100010004 / unk_100010008 / 0x3B9ACA00, v17 * dword_100010004 / unk_100010008 % 0x3B9ACA00 / 0x3E8, v18 * dword_100010004 / unk_100010008 / 0x3B9ACA00, v18 * dword_100010004 / unk_100010008 % 0x3B9ACA00 / 0x3E8, v19, v20);
}

uint64_t sub_100008B94()
{
  if (byte_100010000)
    return printf("%llu nJ %.0f nW");
  else
    return printf("%.2f%s%s, %.2f%s%s");
}

void sub_100008DE0(id a1)
{
  size_t v1;

  v1 = 4;
  if (sysctlbyname("hw.nperflevels", &dword_100010018, &v1, 0, 0) == -1)
    perror("sysctlbyname(hw.nperflevels)");
  if (dword_100010018 >= 3)
  {
    fprintf(__stderrp, "count:%d exceeds STATIC_PERFLEVEL_COUNT:%d skipping PROC_PIDTHREADCOUNTS data\n", dword_100010018, 2);
    byte_100010003 = 0;
  }
}

void sub_100008E70(id a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  size_t v4;
  char __str[16];
  __int128 v6;
  __int128 v7;
  __int128 v8;

  if (qword_100010010 != -1)
    dispatch_once(&qword_100010010, &stru_10000C2E8);
  v1 = dword_100010018;
  if (dword_100010018)
  {
    v2 = 0;
    v3 = (char *)&unk_100010078;
    do
    {
      v7 = 0u;
      v8 = 0u;
      *(_OWORD *)__str = 0u;
      v6 = 0u;
      snprintf(__str, 0x40uLL, "hw.perflevel%d.name", v2);
      v4 = 32;
      if (sysctlbyname(__str, v3, &v4, 0, 0) == -1)
        perror(__str);
      ++v2;
      v3 += 32;
    }
    while (v1 != v2);
  }
}

uint64_t sub_100008F7C(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  BOOL v4;
  _BOOL4 v5;

  v2 = *(_DWORD *)(a1 + 152);
  v3 = *(_DWORD *)(a2 + 152);
  v4 = v2 < v3;
  v5 = v2 > v3;
  if (v4)
    return 0xFFFFFFFFLL;
  else
    return v5;
}

uint64_t sub_100008F94(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  int v5;
  int v6;
  BOOL v7;
  _BOOL4 v8;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 < v3)
    return 0xFFFFFFFFLL;
  if (v2 > v3)
    return 1;
  if (*(_DWORD *)(a1 + 20) == 1)
    return 0xFFFFFFFFLL;
  if (*(_DWORD *)(a2 + 20) == 1)
    return 1;
  v5 = *(_DWORD *)(a1 + 152);
  v6 = *(_DWORD *)(a2 + 152);
  v7 = v5 < v6;
  v8 = v5 > v6;
  if (v7)
    return 0xFFFFFFFFLL;
  else
    return v8;
}

uint64_t sub_100008FEC(uint64_t a1, uint64_t a2)
{
  int v3;
  int v4;
  BOOL v5;
  _BOOL4 v6;

  if (*(_QWORD *)a1 < *(_QWORD *)a2)
    return 0xFFFFFFFFLL;
  if (*(_QWORD *)a1 > *(_QWORD *)a2)
    return 1;
  if (*(_DWORD *)(a1 + 16) == 1)
    return 0xFFFFFFFFLL;
  if (*(_DWORD *)(a2 + 16) == 1)
    return 1;
  v3 = *(_DWORD *)(a1 + 152);
  v4 = *(_DWORD *)(a2 + 152);
  v5 = v3 < v4;
  v6 = v3 > v4;
  if (v5)
    return 0xFFFFFFFFLL;
  else
    return v6;
}

void sub_100009044()
{
  perror("malloc");
  exit(1);
}

void sub_100009060()
{
  __assert_rtn("main", "taskinfo.c", 1526, "threadcounts_size >= target_size");
}

void sub_100009088()
{
  __assert_rtn("perf_level_name", "taskinfo.c", 503, "perf_level <= STATIC_PERFLEVEL_COUNT");
}

void sub_1000090B0()
{
  perror("getpriority(PRIO_DARWIN_CARPLAY_MODE, pid)");
  byte_10001000E = 1;
}

void sub_1000090D8()
{
  perror("getpriority(PRIO_DARWIN_GAME_MODE, pid)");
  byte_10001000D = 1;
}

void sub_100009100()
{
  puts("<unknown>");
  warn("proc_get_wakemon_params()");
}

void sub_100009128()
{
  puts("<unknown>");
  warn("proc_get_cpumon_params()");
}

void sub_100009150()
{
  perror("coalition_policy_get(COALITION_POLICY_SUPPRESS) failed");
  byte_10001000C = 1;
}

void sub_100009178()
{
  perror("coalition_info_debug_info() failed");
  byte_10001001C = 1;
}

void sub_1000091A0()
{
  perror("sysctl(... KERN_ARGMAX ...)");
  exit(1);
}

void sub_1000091BC()
{
  errx(77, "must be run as root");
}

void sub_1000091D4(const char *a1)
{
  errx(64, "arg --%s requires all, jetsam, or resource, found \"%s\"", *(const char **)(qword_1000100C8 + 32 * dword_1000100C0), a1);
}

void sub_10000920C(const char *a1)
{
  errx(64, "arg --%s requires a decimal number, found \"%s\"", *(const char **)(qword_1000100C8 + 32 * dword_1000100C0), a1);
}
