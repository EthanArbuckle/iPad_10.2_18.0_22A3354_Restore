@implementation SecurityInfo

- (SecurityInfo)initWithType:(int64_t)a3
{
  SecurityInfo *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SecurityInfo;
  result = -[SecurityInfo init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

+ (id)securityInfoArrayFromData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _DWORD *v20;
  BOOL v21;
  int v22;
  char *v23;
  void *specific;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  objc_class *v31;
  int v32;
  const char *v33;
  const char *v34;
  id v35;
  unsigned int v36;
  PaceInfo *v37;
  id v38;
  _QWORD *v39;
  _QWORD *v40;
  void *v41;
  int v42;
  unsigned int v43;
  _QWORD *v44;
  char *v45;
  void *v46;
  void (*v47)(uint64_t, const char *, ...);
  objc_class *v48;
  _BOOL4 v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  objc_class *v54;
  int v55;
  const char *v56;
  NSObject *v57;
  const char *v58;
  const char *v59;
  NSObject *v60;
  ChipAuthenticationInfo *v61;
  _QWORD *v62;
  _QWORD *v63;
  void *v64;
  int v65;
  char *v66;
  void *v67;
  void (*v68)(uint64_t, const char *, ...);
  void *v69;
  objc_class *v70;
  _BOOL4 v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  NSObject *v75;
  NSObject *v76;
  id v77;
  id v78;
  uint64_t v79;
  unint64_t v80;
  char v81;
  void *v82;
  void *v83;
  NSObject *v84;
  NSObject *v85;
  id v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  char v90;
  void *v91;
  objc_class *v92;
  int v93;
  const char *v94;
  NSObject *v95;
  const char *v96;
  const char *v97;
  unsigned __int8 *v98;
  id v99;
  uint64_t v100;
  int v101;
  _BYTE *v102;
  char *v103;
  uint64_t v104;
  int v105;
  char *v106;
  void *v107;
  void (*v108)(uint64_t, const char *, ...);
  objc_class *v109;
  _BOOL4 v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  NSObject *v114;
  objc_class *v115;
  int v116;
  const char *v117;
  const char *v118;
  char *v119;
  void *v120;
  void (*v121)(uint64_t, const char *, ...);
  objc_class *v122;
  _BOOL4 v123;
  uint64_t v124;
  void *v125;
  objc_class *v126;
  int v127;
  const char *v128;
  const char *v129;
  void *v130;
  _BYTE *v131;
  char *v132;
  uint64_t v133;
  unint64_t v134;
  char *v135;
  void *v136;
  void *v137;
  void (*v138)(uint64_t, const char *, ...);
  NSObject *v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  char *v143;
  unint64_t v144;
  unint64_t v145;
  int v146;
  void *v147;
  NSObject *v148;
  void *v149;
  NSObject *v150;
  unsigned int v151;
  void *v152;
  NSObject *v153;
  uint64_t v154;
  unsigned __int8 *v155;
  id v156;
  uint64_t v157;
  int v158;
  unsigned __int8 *v159;
  id v160;
  uint64_t v161;
  int v162;
  unsigned __int8 *v163;
  id v164;
  uint64_t v165;
  int v166;
  char *v167;
  void *v168;
  void (*v169)(uint64_t, const char *, ...);
  objc_class *v170;
  _BOOL4 v171;
  const char *v172;
  uint64_t v173;
  void *v174;
  objc_class *v175;
  int v176;
  const char *v177;
  const char *v178;
  NSObject *v179;
  const char *v180;
  uint32_t v181;
  int v182;
  char *v183;
  void *v184;
  void (*v185)(uint64_t, const char *, ...);
  objc_class *v186;
  _BOOL4 v187;
  const char *v188;
  uint64_t v189;
  void *v190;
  NSObject *v191;
  objc_class *v192;
  NSObject *v193;
  int v194;
  const char *v195;
  const char *v196;
  char *v197;
  void *v198;
  void (*v199)(uint64_t, const char *, ...);
  objc_class *v200;
  _BOOL4 v201;
  uint64_t v202;
  void *v203;
  objc_class *v204;
  NSObject *v205;
  int v206;
  const char *v207;
  const char *v208;
  void *v209;
  unsigned int v210;
  unsigned int v211;
  char *v212;
  void *v213;
  void (*v214)(uint64_t, const char *, ...);
  objc_class *v215;
  uint64_t v216;
  void *v217;
  NSObject *v218;
  objc_class *v219;
  void *v220;
  int v221;
  const char *v222;
  const char *v223;
  NSObject *v224;
  const char *v225;
  uint32_t v226;
  char *v227;
  void *v228;
  void (*v229)(uint64_t, const char *, ...);
  objc_class *v230;
  _BOOL4 v231;
  const char *v232;
  uint64_t v233;
  void *v234;
  objc_class *v235;
  void *v236;
  NSObject *v237;
  int v238;
  const char *v239;
  const char *v240;
  void *v241;
  unsigned __int8 *v242;
  id v243;
  uint64_t v244;
  int v245;
  unint64_t v246;
  id v247;
  void *v248;
  void *v249;
  void *v250;
  NSObject *v251;
  uint64_t v252;
  uint64_t v253;
  unint64_t v254;
  char *v255;
  unint64_t v256;
  unint64_t v257;
  int v258;
  void *v259;
  NSObject *v260;
  unsigned int v261;
  char *v262;
  void *v263;
  void (*v264)(uint64_t, const char *, ...);
  uint64_t v265;
  objc_class *v266;
  _BOOL4 v267;
  uint64_t v268;
  void *v269;
  objc_class *v270;
  void *v271;
  int v272;
  const char *v273;
  const char *v274;
  uint64_t v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  uint64_t v280;
  void *v281;
  void *v282;
  char *v283;
  void *v284;
  void (*v285)(uint64_t, const char *, ...);
  objc_class *v286;
  _BOOL4 v287;
  uint64_t v288;
  void *v289;
  NSObject *v290;
  objc_class *v291;
  int v292;
  const char *v293;
  const char *v294;
  uint64_t v295;
  void *v296;
  uint64_t v297;
  void *v298;
  void *v299;
  unint64_t v300;
  id v301;
  void *v302;
  void *v303;
  void (*v304)(uint64_t, const char *, ...);
  NSObject *v305;
  uint64_t v306;
  unint64_t v307;
  char *v308;
  unint64_t v309;
  unint64_t v310;
  int v311;
  void *v312;
  NSObject *v313;
  uint64_t v315;
  const char *ClassName;
  const char *v317;
  const char *v318;
  const char *v319;
  const char *v320;
  const char *v321;
  const char *Name;
  const char *v323;
  const char *v324;
  const char *v325;
  const char *v326;
  const char *v327;
  const char *v328;
  const char *v329;
  const char *v330;
  const char *v331;
  const char *v332;
  const char *v333;
  void *v334;
  uint64_t v335;
  int v336;
  _BOOL4 v337;
  void (*v338)(uint64_t, const char *, ...);
  void *v339;
  NSObject *v340;
  uint64_t v341;
  int v342;
  uint64_t v343;
  NSObject *v344;
  NSObject *v345;
  _QWORD *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  const char *v351;
  unsigned int v352;
  uint64_t v353;
  id obj;
  unsigned __int8 *obja;
  __int128 v357;
  __int128 v358;
  __int128 v359;
  __int128 v360;
  objc_super v361;
  _QWORD v362[11];
  _QWORD v363[11];
  uint8_t v364[128];
  uint8_t v365[4];
  const char *v366;
  __int16 v367;
  int v368;
  __int16 v369;
  const char *v370;
  __int16 v371;
  uint64_t v372;
  uint8_t buf[56];
  uint64_t v374;

  v374 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[NFTLV TLVWithData:](NFTLV, "TLVWithData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v349 = v5;
  v350 = v4;
  if (v5)
  {
    v6 = v5;
    if (objc_msgSend(v5, "tag") == 49)
    {
      objc_msgSend(v6, "children");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (v8)
      {
        v347 = (void *)objc_opt_new();
        v357 = 0u;
        v358 = 0u;
        v359 = 0u;
        v360 = 0u;
        objc_msgSend(v6, "children");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v357, v364, 16);
        if (!v9)
          goto LABEL_325;
        v10 = v9;
        v11 = *(_QWORD *)v358;
        v351 = a2;
        v353 = *(_QWORD *)v358;
        while (1)
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v358 != v11)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v357 + 1) + 8 * v12);
            if (objc_msgSend(v13, "tag") == 48)
            {
              objc_msgSend(v13, "children");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "count");

              if (v15)
              {
                objc_msgSend(v13, "children");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "objectAtIndex:", 0);
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v17, "tag") != 6)
                  goto LABEL_21;
                objc_msgSend(v17, "value");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if ((unint64_t)objc_msgSend(v18, "length") <= 7)
                {

                  goto LABEL_21;
                }
                objc_msgSend(v17, "value");
                v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v20 = (_DWORD *)objc_msgSend(v19, "bytes");
                v21 = *v20 == 8323076 && *(_DWORD *)((char *)v20 + 3) == 33687296;
                v22 = !v21;

                if (v22)
                {
LABEL_21:
                  v23 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                  if ((unint64_t)specific >= 4)
                    goto LABEL_347;
                  v25 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
                  if (v25)
                  {
                    Class = object_getClass(a1);
                    isMetaClass = class_isMetaClass(Class);
                    ClassName = object_getClassName(a1);
                    Name = sel_getName(a2);
                    v28 = 45;
                    if (isMetaClass)
                      v28 = 43;
                    v25(4, "%c[%{public}s %{public}s]:%i Unexpected ASN sequence item 0: %{public}@", v28, ClassName, Name, 93, v17);
                    v23 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                  }
                  v29 = dispatch_get_specific(v23);
                  v11 = v353;
                  if (NFSharedLogInitialize_onceToken != -1)
                    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                  v30 = (id)_NFSharedLogClient[(_QWORD)v29];
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  {
                    v31 = object_getClass(a1);
                    if (class_isMetaClass(v31))
                      v32 = 43;
                    else
                      v32 = 45;
                    v33 = object_getClassName(a1);
                    v34 = sel_getName(a2);
                    *(_DWORD *)buf = 67110146;
                    *(_DWORD *)&buf[4] = v32;
                    *(_WORD *)&buf[8] = 2082;
                    *(_QWORD *)&buf[10] = v33;
                    *(_WORD *)&buf[18] = 2082;
                    *(_QWORD *)&buf[20] = v34;
                    *(_WORD *)&buf[28] = 1024;
                    *(_DWORD *)&buf[30] = 93;
                    *(_WORD *)&buf[34] = 2114;
                    *(_QWORD *)&buf[36] = v17;
                    _os_log_impl(&dword_1C34DB000, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected ASN sequence item 0: %{public}@", buf, 0x2Cu);
                  }
                  goto LABEL_33;
                }
                objc_msgSend(v17, "value");
                v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v36 = *(unsigned __int8 *)(objc_msgSend(v35, "bytes") + 7);

                v352 = v36;
                if (v36 != 3)
                {
                  if (v36 != 4)
                    goto LABEL_288;
                  v37 = [PaceInfo alloc];
                  v38 = v13;
                  if (v37)
                  {
                    v361.receiver = v37;
                    v361.super_class = (Class)PaceInfo;
                    v39 = objc_msgSendSuper2(&v361, sel_initWithType_, 0);
                    if (v39)
                    {
                      v40 = v39;
                      objc_msgSend(v38, "children");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      v42 = objc_msgSend(v41, "count");

                      v342 = v42;
                      v43 = v42 - 4;
                      v44 = v40;
                      v348 = v38;
                      v346 = v40;
                      if (v43 <= 0xFFFFFFFD)
                      {
                        v45 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                        v46 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                        if ((unint64_t)v46 >= 4)
                          goto LABEL_347;
                        v47 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v46);
                        if (v47)
                        {
                          v48 = object_getClass(v40);
                          v49 = class_isMetaClass(v48);
                          v50 = object_getClassName(v40);
                          v323 = sel_getName(sel_initFromTLV_);
                          v51 = 45;
                          if (v49)
                            v51 = 43;
                          v47(3, "%c[%{public}s %{public}s]:%i Unexpected # of elements in sequence", v51, v50, v323, 215);
                          v45 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                        }
                        v52 = dispatch_get_specific(v45);
                        v11 = v353;
                        if (NFSharedLogInitialize_onceToken != -1)
                          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                        v53 = (id)_NFSharedLogClient[(_QWORD)v52];
                        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                        {
                          v54 = object_getClass(v40);
                          if (class_isMetaClass(v54))
                            v55 = 43;
                          else
                            v55 = 45;
                          v56 = object_getClassName(v44);
                          v57 = v53;
                          v58 = v56;
                          v59 = sel_getName(sel_initFromTLV_);
                          *(_DWORD *)buf = 67109890;
                          *(_DWORD *)&buf[4] = v55;
                          *(_WORD *)&buf[8] = 2082;
                          *(_QWORD *)&buf[10] = v58;
                          v53 = v57;
                          *(_WORD *)&buf[18] = 2082;
                          *(_QWORD *)&buf[20] = v59;
                          *(_WORD *)&buf[28] = 1024;
                          *(_DWORD *)&buf[30] = 215;
                          v60 = v57;
                          goto LABEL_80;
                        }
                        goto LABEL_81;
                      }
                      objc_msgSend(v38, "children");
                      v74 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v74, "objectAtIndex:", 0);
                      v75 = objc_claimAutoreleasedReturnValue();

                      v76 = v75;
                      -[NSObject value](v75, "value");
                      v77 = (id)objc_claimAutoreleasedReturnValue();
                      v344 = v76;
                      v339 = v77;
                      if (objc_msgSend(v77, "length") == 9 || objc_msgSend(v77, "length") == 10)
                      {
                        v78 = objc_retainAutorelease(v77);
                        v79 = objc_msgSend(v78, "bytes");
                        if (*(_QWORD *)v79 == 0x4020207007F0004)
                        {
                          v44 = (_QWORD *)v79;
                          LODWORD(v80) = *(unsigned __int8 *)(v79 + 8);
                          switch(*(_BYTE *)(v79 + 8))
                          {
                            case 1:
                              v98 = (unsigned __int8 *)(v79 + 9);
                              v99 = objc_retainAutorelease(v78);
                              v100 = objc_msgSend(v99, "bytes");
                              if ((unsigned __int8 *)(v100 + objc_msgSend(v99, "length")) != v98)
                              {
                                v80 = *v98;
                                v81 = 0;
                                v82 = v348;
                                v44 = v346;
                                switch((int)v80)
                                {
                                  case 1:
                                    goto LABEL_92;
                                  case 2:
                                    v81 = 0;
                                    v80 = 2;
                                    goto LABEL_92;
                                  case 3:
                                    v81 = 0;
                                    v80 = 3;
                                    goto LABEL_92;
                                  case 4:
                                    v81 = 0;
                                    v80 = 4;
                                    goto LABEL_92;
                                  default:
                                    goto LABEL_235;
                                }
                              }
                              v81 = 0;
                              v80 = 0;
                              goto LABEL_66;
                            case 2:
                              v155 = (unsigned __int8 *)(v79 + 9);
                              v156 = objc_retainAutorelease(v78);
                              v157 = objc_msgSend(v156, "bytes");
                              if ((unsigned __int8 *)(v157 + objc_msgSend(v156, "length")) != v155)
                              {
                                v158 = *v155 - 1;
                                v81 = 0;
                                v80 = 11;
                                v82 = v348;
                                v44 = v346;
                                switch(v158)
                                {
                                  case 0:
                                    goto LABEL_92;
                                  case 1:
                                    v81 = 0;
                                    v80 = 12;
                                    goto LABEL_92;
                                  case 2:
                                    v81 = 0;
                                    v80 = 13;
                                    goto LABEL_92;
                                  case 3:
                                    v81 = 0;
                                    v80 = 14;
                                    goto LABEL_92;
                                  default:
                                    goto LABEL_235;
                                }
                              }
                              v81 = 0;
                              v80 = 10;
                              goto LABEL_66;
                            case 3:
                              v159 = (unsigned __int8 *)(v79 + 9);
                              v160 = objc_retainAutorelease(v78);
                              v161 = objc_msgSend(v160, "bytes");
                              if ((unsigned __int8 *)(v161 + objc_msgSend(v160, "length")) != v159)
                              {
                                v162 = *v159 - 1;
                                v81 = 0;
                                v80 = 6;
                                v82 = v348;
                                v44 = v346;
                                switch(v162)
                                {
                                  case 0:
                                    goto LABEL_92;
                                  case 1:
                                    v81 = 0;
                                    v80 = 7;
                                    goto LABEL_92;
                                  case 2:
                                    v81 = 0;
                                    v80 = 8;
                                    goto LABEL_92;
                                  case 3:
                                    v81 = 0;
                                    v80 = 9;
                                    goto LABEL_92;
                                  default:
                                    goto LABEL_235;
                                }
                              }
                              v81 = 0;
                              v80 = 5;
                              goto LABEL_66;
                            case 4:
                              v163 = (unsigned __int8 *)(v79 + 9);
                              v164 = objc_retainAutorelease(v78);
                              v165 = objc_msgSend(v164, "bytes");
                              if ((unsigned __int8 *)(v165 + objc_msgSend(v164, "length")) != v163)
                              {
                                v166 = *v163 - 1;
                                v81 = 0;
                                v80 = 16;
                                v82 = v348;
                                v44 = v346;
                                switch(v166)
                                {
                                  case 0:
                                    goto LABEL_92;
                                  case 1:
                                    v81 = 0;
                                    v80 = 17;
                                    goto LABEL_92;
                                  case 2:
                                    v81 = 0;
                                    v80 = 18;
                                    goto LABEL_92;
                                  case 3:
                                    v81 = 0;
                                    v80 = 19;
                                    goto LABEL_92;
                                  default:
LABEL_235:
                                    v154 = 9;
                                    goto LABEL_236;
                                }
                              }
                              v81 = 0;
                              v80 = 15;
                              goto LABEL_66;
                            default:
                              v154 = 8;
LABEL_236:
                              if ((_DWORD)v80 != 6)
                                goto LABEL_242;
                              v242 = (unsigned __int8 *)v44 + v154 + 1;
                              v243 = objc_retainAutorelease(v78);
                              v244 = objc_msgSend(v243, "bytes");
                              if ((unsigned __int8 *)(v244 + objc_msgSend(v243, "length")) == v242)
                              {
                                v81 = 0;
                                v80 = 20;
                                goto LABEL_305;
                              }
                              v245 = *v242;
                              v44 = v346;
                              switch(v245)
                              {
                                case 2:
                                  v81 = 0;
                                  v80 = 21;
LABEL_323:
                                  v11 = v353;
                                  v82 = v348;
                                  goto LABEL_92;
                                case 4:
                                  v81 = 0;
                                  v80 = 23;
                                  goto LABEL_323;
                                case 3:
                                  v81 = 0;
                                  v80 = 22;
LABEL_305:
                                  v11 = v353;
                                  goto LABEL_66;
                              }
LABEL_242:
                              memset(buf, 0, 48);
                              v246 = objc_msgSend(v78, "length");
                              v247 = objc_retainAutorelease(v78);
                              v335 = objc_msgSend(v247, "bytes");
                              v248 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                              if ((unint64_t)v248 >= 4)
                                goto LABEL_347;
                              v249 = v248;
                              v338 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v248);
                              if (NFSharedLogInitialize_onceToken != -1)
                                dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                              v250 = v348;
                              v251 = (id)_NFSharedLogClient[(_QWORD)v249];
                              if (os_log_type_enabled(v251, OS_LOG_TYPE_ERROR))
                              {
                                v252 = objc_msgSend(v247, "length");
                                *(_DWORD *)v365 = 136315906;
                                v366 = "PaceProtocolMapper";
                                v367 = 1024;
                                v368 = 202;
                                v369 = 2082;
                                v370 = "Failed mapping:";
                                v371 = 2048;
                                v372 = v252;
                                _os_log_impl(&dword_1C34DB000, v251, OS_LOG_TYPE_ERROR, "%s:%i %{public}s %lu bytes", v365, 0x26u);
                              }

                              if (v338)
                                v338(4, "%s:%i %s %lu bytes :", "PaceProtocolMapper", 202, "Failed mapping:", objc_msgSend(v247, "length"));
                              v11 = v353;
                              if (v246)
                              {
                                v253 = 0;
                                do
                                {
                                  v254 = 0;
                                  v255 = (char *)&buf[__sprintf_chk((char *)buf, 0, 0x30uLL, "%04lX: ", v253)];
                                  do
                                  {
                                    v256 = v254 + 1;
                                    v257 = v254 + 1 + v253;
                                    v258 = sprintf(v255, "0x%02X ", *(unsigned __int8 *)(v335 + v253 + v254));
                                    if (v254 > 6)
                                      break;
                                    v255 += v258;
                                    ++v254;
                                  }
                                  while (v257 < v246);
                                  v259 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                                  if (NFSharedLogInitialize_onceToken != -1)
                                    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                                  v11 = v353;
                                  v250 = v348;
                                  v260 = (id)_NFSharedLogClient[(_QWORD)v259];
                                  if (os_log_type_enabled(v260, OS_LOG_TYPE_ERROR))
                                  {
                                    *(_DWORD *)v365 = 136446210;
                                    v366 = (const char *)buf;
                                    _os_log_impl(&dword_1C34DB000, v260, OS_LOG_TYPE_ERROR, "%{public}s", v365, 0xCu);
                                  }

                                  if (v338)
                                    v338(4, "%s", (const char *)buf);
                                  v253 += v256;
                                }
                                while (v257 < v246);
                              }
                              v82 = v250;
                              v80 = -1;
                              v81 = 1;
                              a2 = v351;
                              break;
                          }
                        }
                        else
                        {
                          v80 = -1;
                          v81 = 1;
LABEL_66:
                          v82 = v348;
                        }
                        v44 = v346;
                      }
                      else
                      {
                        v82 = v38;
                        v80 = -1;
                        v81 = 1;
                      }
LABEL_92:

                      v105 = -[NSObject tag](v344, "tag");
                      if ((v81 & 1) != 0 || v105 != 6)
                      {
                        v119 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                        v120 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                        if ((unint64_t)v120 >= 4)
                          goto LABEL_347;
                        v121 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v120);
                        if (v121)
                        {
                          v122 = object_getClass(v44);
                          v123 = class_isMetaClass(v122);
                          v317 = object_getClassName(v44);
                          v326 = sel_getName(sel_initFromTLV_);
                          v124 = 45;
                          if (v123)
                            v124 = 43;
                          v121(3, "%c[%{public}s %{public}s]:%i Invalid protocol: %{public}@", v124, v317, v326, 222, v344);
                          v119 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                        }
                        v125 = dispatch_get_specific(v119);
                        v11 = v353;
                        if (NFSharedLogInitialize_onceToken != -1)
                          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                        v114 = (id)_NFSharedLogClient[(_QWORD)v125];
                        if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
                        {
                          v126 = object_getClass(v44);
                          if (class_isMetaClass(v126))
                            v127 = 43;
                          else
                            v127 = 45;
                          v128 = object_getClassName(v44);
                          v129 = sel_getName(sel_initFromTLV_);
                          *(_DWORD *)buf = 67110146;
                          *(_DWORD *)&buf[4] = v127;
                          *(_WORD *)&buf[8] = 2082;
                          *(_QWORD *)&buf[10] = v128;
                          *(_WORD *)&buf[18] = 2082;
                          *(_QWORD *)&buf[20] = v129;
                          *(_WORD *)&buf[28] = 1024;
                          *(_DWORD *)&buf[30] = 222;
                          *(_WORD *)&buf[34] = 2114;
                          v53 = v344;
                          *(_QWORD *)&buf[36] = v344;
                          _os_log_impl(&dword_1C34DB000, v114, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid protocol: %{public}@", buf, 0x2Cu);
                          v30 = 0;
                          v130 = v348;
                        }
                        else
                        {
LABEL_120:
                          v30 = 0;
                          v130 = v348;
                          v53 = v344;
                        }
                        goto LABEL_121;
                      }
                      if (v80 <= 0x14 && ((1 << v80) & 0x108421) != 0)
                      {
                        v106 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                        v107 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                        if ((unint64_t)v107 >= 4)
                          goto LABEL_347;
                        v108 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v107);
                        if (v108)
                        {
                          v109 = object_getClass(v44);
                          v110 = class_isMetaClass(v109);
                          v111 = object_getClassName(v44);
                          v325 = sel_getName(sel_initFromTLV_);
                          v112 = 45;
                          if (v110)
                            v112 = 43;
                          v108(6, "%c[%{public}s %{public}s]:%i DomainParameterInfo found", v112, v111, v325, 229);
                          v106 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                        }
                        v11 = v353;
                        v113 = dispatch_get_specific(v106);
                        if (NFSharedLogInitialize_onceToken != -1)
                          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                        v114 = (id)_NFSharedLogClient[(_QWORD)v113];
                        if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
                        {
                          v115 = object_getClass(v44);
                          if (class_isMetaClass(v115))
                            v116 = 43;
                          else
                            v116 = 45;
                          v117 = object_getClassName(v44);
                          v118 = sel_getName(sel_initFromTLV_);
                          *(_DWORD *)buf = 67109890;
                          *(_DWORD *)&buf[4] = v116;
                          *(_WORD *)&buf[8] = 2082;
                          *(_QWORD *)&buf[10] = v117;
                          *(_WORD *)&buf[18] = 2082;
                          *(_QWORD *)&buf[20] = v118;
                          *(_WORD *)&buf[28] = 1024;
                          *(_DWORD *)&buf[30] = 229;
                          _os_log_impl(&dword_1C34DB000, v114, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i DomainParameterInfo found", buf, 0x22u);
                        }
                        goto LABEL_120;
                      }
                      objc_msgSend(v82, "children");
                      v149 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v149, "objectAtIndex:", 1);
                      v150 = objc_claimAutoreleasedReturnValue();

                      v340 = v150;
                      if (-[NSObject tag](v150, "tag") == 2)
                      {
                        v151 = -[NSObject valueAsUnsignedLong](v150, "valueAsUnsignedLong");
                        if (v151 == 2)
                        {
                          if (v342 == 3)
                          {
                            objc_msgSend(v348, "children");
                            v152 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v152, "objectAtIndex:", 2);
                            v153 = objc_claimAutoreleasedReturnValue();

                          }
                          else
                          {
                            v153 = 0;
                          }
                          v44[2] = v80;
                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", -[NSObject valueAsUnsignedLong](v153, "valueAsUnsignedLong"));
                          v295 = objc_claimAutoreleasedReturnValue();
                          v296 = (void *)v44[4];
                          v44[4] = v295;

                          v30 = v44;
LABEL_312:
                          v53 = v344;

                          v130 = v348;
                          v114 = v340;
LABEL_121:

                          v38 = v130;
LABEL_285:

LABEL_286:
                          if (v30)
                          {
                            objc_msgSend(v347, "addObject:", v30);
LABEL_33:

                            goto LABEL_34;
                          }
LABEL_288:
                          v362[0] = &unk_1E7D885B0;
                          v362[1] = &unk_1E7D885C8;
                          v363[0] = CFSTR("PK");
                          v363[1] = CFSTR("TA");
                          v362[2] = &unk_1E7D885E0;
                          v362[3] = &unk_1E7D885F8;
                          v363[2] = CFSTR("CA");
                          v363[3] = CFSTR("PACE");
                          v362[4] = &unk_1E7D88610;
                          v362[5] = &unk_1E7D88628;
                          v363[4] = CFSTR("RI");
                          v363[5] = CFSTR("CI");
                          v362[6] = &unk_1E7D88640;
                          v362[7] = &unk_1E7D88658;
                          v363[6] = CFSTR("eIDSecurity");
                          v363[7] = CFSTR("PT");
                          v362[8] = &unk_1E7D88670;
                          v362[9] = &unk_1E7D88688;
                          v363[8] = CFSTR("PS");
                          v363[9] = CFSTR("PasswordType");
                          v362[10] = &unk_1E7D886A0;
                          v363[10] = CFSTR("eIDApplicationInfo");
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v363, v362, 11);
                          v30 = objc_claimAutoreleasedReturnValue();
                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v352);
                          v277 = (void *)objc_claimAutoreleasedReturnValue();
                          -[NSObject objectForKey:](v30, "objectForKey:", v277);
                          v278 = (void *)objc_claimAutoreleasedReturnValue();

                          v279 = (void *)MEMORY[0x1E0CB3940];
                          objc_msgSend(v17, "value");
                          v280 = objc_claimAutoreleasedReturnValue();
                          v281 = (void *)v280;
                          if (v278)
                            objc_msgSend(v279, "stringWithFormat:", CFSTR("id-%@ found (oid=%@)"), v278, v280);
                          else
                            objc_msgSend(v279, "stringWithFormat:", CFSTR("Unknown info (%@) found"), v280, v315);
                          v282 = (void *)objc_claimAutoreleasedReturnValue();

                          v283 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                          v284 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                          if ((unint64_t)v284 >= 4)
                            goto LABEL_347;
                          v285 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v284);
                          if (v285)
                          {
                            v286 = object_getClass(a1);
                            v287 = class_isMetaClass(v286);
                            v321 = object_getClassName(a1);
                            v333 = sel_getName(v351);
                            v288 = 45;
                            if (v287)
                              v288 = 43;
                            v285(6, "%c[%{public}s %{public}s]:%i %{public}@ found", v288, v321, v333, 129, v282);
                            v283 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                          }
                          v11 = v353;
                          v289 = dispatch_get_specific(v283);
                          if (NFSharedLogInitialize_onceToken != -1)
                            dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                          v290 = (id)_NFSharedLogClient[(_QWORD)v289];
                          if (os_log_type_enabled(v290, OS_LOG_TYPE_DEFAULT))
                          {
                            v291 = object_getClass(a1);
                            if (class_isMetaClass(v291))
                              v292 = 43;
                            else
                              v292 = 45;
                            v293 = object_getClassName(a1);
                            v294 = sel_getName(v351);
                            *(_DWORD *)buf = 67110146;
                            *(_DWORD *)&buf[4] = v292;
                            *(_WORD *)&buf[8] = 2082;
                            *(_QWORD *)&buf[10] = v293;
                            v11 = v353;
                            *(_WORD *)&buf[18] = 2082;
                            *(_QWORD *)&buf[20] = v294;
                            *(_WORD *)&buf[28] = 1024;
                            *(_DWORD *)&buf[30] = 129;
                            *(_WORD *)&buf[34] = 2114;
                            *(_QWORD *)&buf[36] = v282;
                            _os_log_impl(&dword_1C34DB000, v290, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@ found", buf, 0x2Cu);
                          }

                          a2 = v351;
                          goto LABEL_33;
                        }
                        v261 = v151;
                        v262 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                        v263 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                        if ((unint64_t)v263 >= 4)
                          goto LABEL_347;
                        v264 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v263);
                        v265 = v261;
                        if (v264)
                        {
                          v266 = object_getClass(v44);
                          v267 = class_isMetaClass(v266);
                          v320 = object_getClassName(v44);
                          v332 = sel_getName(sel_initFromTLV_);
                          v268 = 45;
                          if (v267)
                            v268 = 43;
                          v264(4, "%c[%{public}s %{public}s]:%i Unexpected version: %lu", v268, v320, v332, 242, v261);
                          v262 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                        }
                        v11 = v353;
                        v269 = dispatch_get_specific(v262);
                        if (NFSharedLogInitialize_onceToken != -1)
                          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                        v153 = (id)_NFSharedLogClient[(_QWORD)v269];
                        if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
                        {
                          v270 = object_getClass(v44);
                          v21 = !class_isMetaClass(v270);
                          v271 = v44;
                          if (v21)
                            v272 = 45;
                          else
                            v272 = 43;
                          v273 = object_getClassName(v271);
                          v274 = sel_getName(sel_initFromTLV_);
                          *(_DWORD *)buf = 67110146;
                          *(_DWORD *)&buf[4] = v272;
                          *(_WORD *)&buf[8] = 2082;
                          *(_QWORD *)&buf[10] = v273;
                          *(_WORD *)&buf[18] = 2082;
                          *(_QWORD *)&buf[20] = v274;
                          *(_WORD *)&buf[28] = 1024;
                          *(_DWORD *)&buf[30] = 242;
                          *(_WORD *)&buf[34] = 2048;
                          *(_QWORD *)&buf[36] = v265;
                          v179 = v153;
                          v180 = "%c[%{public}s %{public}s]:%i Unexpected version: %lu";
                          v181 = 44;
                          goto LABEL_278;
                        }
                      }
                      else
                      {
                        v167 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                        v168 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                        if ((unint64_t)v168 >= 4)
                          goto LABEL_347;
                        v169 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v168);
                        if (v169)
                        {
                          v170 = object_getClass(v44);
                          v171 = class_isMetaClass(v170);
                          v172 = object_getClassName(v44);
                          v327 = sel_getName(sel_initFromTLV_);
                          v173 = 45;
                          if (v171)
                            v173 = 43;
                          v169(3, "%c[%{public}s %{public}s]:%i Incorrect type for version", v173, v172, v327, 235);
                          v167 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                        }
                        v11 = v353;
                        v174 = dispatch_get_specific(v167);
                        if (NFSharedLogInitialize_onceToken != -1)
                          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                        v153 = (id)_NFSharedLogClient[(_QWORD)v174];
                        if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
                        {
                          v175 = object_getClass(v44);
                          if (class_isMetaClass(v175))
                            v176 = 43;
                          else
                            v176 = 45;
                          v177 = object_getClassName(v44);
                          v178 = sel_getName(sel_initFromTLV_);
                          *(_DWORD *)buf = 67109890;
                          *(_DWORD *)&buf[4] = v176;
                          *(_WORD *)&buf[8] = 2082;
                          *(_QWORD *)&buf[10] = v177;
                          *(_WORD *)&buf[18] = 2082;
                          *(_QWORD *)&buf[20] = v178;
                          *(_WORD *)&buf[28] = 1024;
                          *(_DWORD *)&buf[30] = 235;
                          v179 = v153;
                          v180 = "%c[%{public}s %{public}s]:%i Incorrect type for version";
                          v181 = 34;
LABEL_278:
                          _os_log_impl(&dword_1C34DB000, v179, OS_LOG_TYPE_ERROR, v180, buf, v181);
                        }
                      }
                      v30 = 0;
                      goto LABEL_312;
                    }
                  }
LABEL_61:
                  v30 = 0;
                  goto LABEL_286;
                }
                v61 = [ChipAuthenticationInfo alloc];
                v38 = v13;
                if (!v61)
                  goto LABEL_61;
                v361.receiver = v61;
                v361.super_class = (Class)ChipAuthenticationInfo;
                v62 = objc_msgSendSuper2(&v361, sel_initWithType_, 1);
                if (!v62)
                  goto LABEL_61;
                v63 = v62;
                objc_msgSend(v38, "children");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = objc_msgSend(v64, "count");

                v336 = v65;
                v348 = v38;
                v346 = v63;
                if ((v65 - 4) <= 0xFFFFFFFD)
                {
                  v66 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                  v67 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                  if ((unint64_t)v67 >= 4)
                    goto LABEL_347;
                  v68 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v67);
                  if (v68)
                  {
                    v69 = v63;
                    v70 = object_getClass(v63);
                    v71 = class_isMetaClass(v70);
                    v72 = object_getClassName(v63);
                    v324 = sel_getName(sel_initFromTLV_);
                    v73 = 45;
                    if (v71)
                      v73 = 43;
                    v68(3, "%c[%{public}s %{public}s]:%i Unexpected # of elements in sequence", v73, v72, v324, 338);
                    v66 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                  }
                  else
                  {
                    v69 = v63;
                  }
                  v91 = dispatch_get_specific(v66);
                  v11 = v353;
                  if (NFSharedLogInitialize_onceToken != -1)
                    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                  v53 = (id)_NFSharedLogClient[(_QWORD)v91];
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                  {
                    v92 = object_getClass(v69);
                    if (class_isMetaClass(v92))
                      v93 = 43;
                    else
                      v93 = 45;
                    v94 = object_getClassName(v69);
                    v95 = v53;
                    v96 = v94;
                    v97 = sel_getName(sel_initFromTLV_);
                    *(_DWORD *)buf = 67109890;
                    *(_DWORD *)&buf[4] = v93;
                    *(_WORD *)&buf[8] = 2082;
                    *(_QWORD *)&buf[10] = v96;
                    v53 = v95;
                    *(_WORD *)&buf[18] = 2082;
                    *(_QWORD *)&buf[20] = v97;
                    *(_WORD *)&buf[28] = 1024;
                    *(_DWORD *)&buf[30] = 338;
                    v60 = v95;
LABEL_80:
                    _os_log_impl(&dword_1C34DB000, v60, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected # of elements in sequence", buf, 0x22u);
                  }
LABEL_81:
                  v30 = 0;
                  v38 = v348;
                  goto LABEL_285;
                }
                objc_msgSend(v38, "children");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v83, "objectAtIndex:", 0);
                v84 = objc_claimAutoreleasedReturnValue();

                v85 = v84;
                -[NSObject value](v84, "value");
                v86 = (id)objc_claimAutoreleasedReturnValue();
                v345 = v85;
                v334 = v86;
                if (objc_msgSend(v86, "length") != 9 && objc_msgSend(v86, "length") != 10)
                {
                  v89 = -1;
                  v90 = 1;
                  v88 = v63;
                  goto LABEL_176;
                }
                a2 = (SEL)objc_retainAutorelease(v86);
                v87 = objc_msgSend((id)a2, "bytes");
                if (*(_QWORD *)v87 != 0x3020207007F0004)
                {
                  v88 = v63;
                  v89 = -1;
                  v90 = 1;
                  a2 = v351;
LABEL_176:

                  v182 = -[NSObject tag](v345, "tag");
                  if ((v90 & 1) != 0 || v182 != 6)
                  {
                    v197 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                    v198 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    if ((unint64_t)v198 >= 4)
                      goto LABEL_347;
                    v199 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v198);
                    if (v199)
                    {
                      v200 = object_getClass(v88);
                      v201 = class_isMetaClass(v200);
                      v318 = object_getClassName(v88);
                      v329 = sel_getName(sel_initFromTLV_);
                      v202 = 45;
                      if (v201)
                        v202 = 43;
                      v199(3, "%c[%{public}s %{public}s]:%i Invalid protocol: %{public}@", v202, v318, v329, 345, v345);
                      v197 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                    }
                    v203 = dispatch_get_specific(v197);
                    v11 = v353;
                    if (NFSharedLogInitialize_onceToken != -1)
                      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                    v191 = (id)_NFSharedLogClient[(_QWORD)v203];
                    if (os_log_type_enabled(v191, OS_LOG_TYPE_ERROR))
                    {
                      v204 = object_getClass(v88);
                      v205 = v191;
                      if (class_isMetaClass(v204))
                        v206 = 43;
                      else
                        v206 = 45;
                      v207 = object_getClassName(v88);
                      v208 = sel_getName(sel_initFromTLV_);
                      *(_DWORD *)buf = 67110146;
                      *(_DWORD *)&buf[4] = v206;
                      v191 = v205;
                      *(_WORD *)&buf[8] = 2082;
                      *(_QWORD *)&buf[10] = v207;
                      *(_WORD *)&buf[18] = 2082;
                      *(_QWORD *)&buf[20] = v208;
                      *(_WORD *)&buf[28] = 1024;
                      *(_DWORD *)&buf[30] = 345;
                      *(_WORD *)&buf[34] = 2114;
                      v53 = v345;
                      *(_QWORD *)&buf[36] = v345;
                      _os_log_impl(&dword_1C34DB000, v205, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid protocol: %{public}@", buf, 0x2Cu);
                      v30 = 0;
                      goto LABEL_283;
                    }
LABEL_204:
                    v30 = 0;
                    v38 = v348;
                    v53 = v345;
                  }
                  else
                  {
                    if (v89 == 5 || !v89)
                    {
                      v183 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                      v184 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                      if ((unint64_t)v184 >= 4)
                        goto LABEL_347;
                      v185 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v184);
                      if (v185)
                      {
                        v186 = object_getClass(v88);
                        v187 = class_isMetaClass(v186);
                        v188 = object_getClassName(v88);
                        v328 = sel_getName(sel_initFromTLV_);
                        v189 = 45;
                        if (v187)
                          v189 = 43;
                        v185(6, "%c[%{public}s %{public}s]:%i DomainParameterInfo found", v189, v188, v328, 349);
                        v183 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                      }
                      v11 = v353;
                      v190 = dispatch_get_specific(v183);
                      if (NFSharedLogInitialize_onceToken != -1)
                        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                      v191 = (id)_NFSharedLogClient[(_QWORD)v190];
                      if (os_log_type_enabled(v191, OS_LOG_TYPE_DEFAULT))
                      {
                        v192 = object_getClass(v88);
                        v193 = v191;
                        if (class_isMetaClass(v192))
                          v194 = 43;
                        else
                          v194 = 45;
                        v195 = object_getClassName(v88);
                        v196 = sel_getName(sel_initFromTLV_);
                        *(_DWORD *)buf = 67109890;
                        *(_DWORD *)&buf[4] = v194;
                        v191 = v193;
                        *(_WORD *)&buf[8] = 2082;
                        *(_QWORD *)&buf[10] = v195;
                        *(_WORD *)&buf[18] = 2082;
                        *(_QWORD *)&buf[20] = v196;
                        *(_WORD *)&buf[28] = 1024;
                        *(_DWORD *)&buf[30] = 349;
                        _os_log_impl(&dword_1C34DB000, v193, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i DomainParameterInfo found", buf, 0x22u);
                      }
                      goto LABEL_204;
                    }
                    objc_msgSend(v38, "children");
                    v209 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v209, "objectAtIndex:", 1);
                    v191 = objc_claimAutoreleasedReturnValue();

                    if (-[NSObject tag](v191, "tag") == 2)
                    {
                      v210 = -[NSObject valueAsUnsignedLong](v191, "valueAsUnsignedLong");
                      if (v210 - 4 <= 0xFFFFFFFC)
                      {
                        v211 = v210;
                        v212 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                        v213 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                        if ((unint64_t)v213 >= 4)
                          goto LABEL_347;
                        v214 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v213);
                        v341 = v211;
                        if (v214)
                        {
                          v215 = object_getClass(v88);
                          v337 = class_isMetaClass(v215);
                          v319 = object_getClassName(v88);
                          v330 = sel_getName(sel_initFromTLV_);
                          v216 = 45;
                          if (v337)
                            v216 = 43;
                          v214(4, "%c[%{public}s %{public}s]:%i Unexpected version: %lu", v216, v319, v330, 363, v211);
                          v212 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                        }
                        v11 = v353;
                        v217 = dispatch_get_specific(v212);
                        if (NFSharedLogInitialize_onceToken != -1)
                          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                        v218 = (id)_NFSharedLogClient[(_QWORD)v217];
                        if (os_log_type_enabled(v218, OS_LOG_TYPE_ERROR))
                        {
                          v219 = object_getClass(v88);
                          v21 = !class_isMetaClass(v219);
                          v220 = v88;
                          if (v21)
                            v221 = 45;
                          else
                            v221 = 43;
                          v222 = object_getClassName(v220);
                          v223 = sel_getName(sel_initFromTLV_);
                          *(_DWORD *)buf = 67110146;
                          *(_DWORD *)&buf[4] = v221;
                          *(_WORD *)&buf[8] = 2082;
                          *(_QWORD *)&buf[10] = v222;
                          *(_WORD *)&buf[18] = 2082;
                          *(_QWORD *)&buf[20] = v223;
                          *(_WORD *)&buf[28] = 1024;
                          *(_DWORD *)&buf[30] = 363;
                          *(_WORD *)&buf[34] = 2048;
                          *(_QWORD *)&buf[36] = v341;
                          v224 = v218;
                          v225 = "%c[%{public}s %{public}s]:%i Unexpected version: %lu";
                          v226 = 44;
                          goto LABEL_231;
                        }
                        goto LABEL_232;
                      }
                      if (v336 == 3)
                      {
                        objc_msgSend(v348, "children");
                        v241 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v241, "objectAtIndex:", 2);
                        v218 = objc_claimAutoreleasedReturnValue();

                      }
                      else
                      {
                        v218 = 0;
                      }
                      v88[2] = v89;
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", -[NSObject valueAsUnsignedLong](v218, "valueAsUnsignedLong"));
                      v275 = objc_claimAutoreleasedReturnValue();
                      v276 = (void *)v88[4];
                      v88[4] = v275;

                      v30 = v88;
                      v53 = v345;
                    }
                    else
                    {
                      v227 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                      v228 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                      if ((unint64_t)v228 >= 4)
                        goto LABEL_347;
                      v229 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v228);
                      if (v229)
                      {
                        v230 = object_getClass(v88);
                        v231 = class_isMetaClass(v230);
                        v232 = object_getClassName(v88);
                        v331 = sel_getName(sel_initFromTLV_);
                        v233 = 45;
                        if (v231)
                          v233 = 43;
                        v229(3, "%c[%{public}s %{public}s]:%i Incorrect type for version", v233, v232, v331, 355);
                        v227 = kNFLOG_DISPATCH_SPECIFIC_KEY;
                      }
                      v11 = v353;
                      v234 = dispatch_get_specific(v227);
                      if (NFSharedLogInitialize_onceToken != -1)
                        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                      v218 = (id)_NFSharedLogClient[(_QWORD)v234];
                      if (os_log_type_enabled(v218, OS_LOG_TYPE_ERROR))
                      {
                        v235 = object_getClass(v88);
                        v21 = !class_isMetaClass(v235);
                        v236 = v88;
                        v237 = v191;
                        if (v21)
                          v238 = 45;
                        else
                          v238 = 43;
                        v239 = object_getClassName(v236);
                        v240 = sel_getName(sel_initFromTLV_);
                        *(_DWORD *)buf = 67109890;
                        *(_DWORD *)&buf[4] = v238;
                        v191 = v237;
                        *(_WORD *)&buf[8] = 2082;
                        *(_QWORD *)&buf[10] = v239;
                        *(_WORD *)&buf[18] = 2082;
                        *(_QWORD *)&buf[20] = v240;
                        *(_WORD *)&buf[28] = 1024;
                        *(_DWORD *)&buf[30] = 355;
                        v224 = v218;
                        v225 = "%c[%{public}s %{public}s]:%i Incorrect type for version";
                        v226 = 34;
LABEL_231:
                        _os_log_impl(&dword_1C34DB000, v224, OS_LOG_TYPE_ERROR, v225, buf, v226);
                      }
LABEL_232:
                      v30 = 0;
                      v53 = v345;
                    }

LABEL_283:
                    v38 = v348;
                  }

                  goto LABEL_285;
                }
                v101 = *(unsigned __int8 *)(v87 + 8);
                if (v101 == 2)
                {
                  v131 = (_BYTE *)(v87 + 9);
                  v132 = objc_retainAutorelease((id)a2);
                  v133 = objc_msgSend(v132, "bytes");
                  if ((_BYTE *)(v133 + objc_msgSend(v132, "length")) != v131)
                  {
                    v38 = v348;
                    v88 = v346;
                    v90 = 0;
                    v89 = 6;
                    a2 = v351;
                    switch(*v131)
                    {
                      case 1:
                        goto LABEL_176;
                      case 2:
                        v90 = 0;
                        v89 = 7;
                        goto LABEL_176;
                      case 3:
                        v90 = 0;
                        v89 = 8;
                        goto LABEL_176;
                      case 4:
                        v90 = 0;
                        v89 = 9;
                        goto LABEL_176;
                      default:
                        goto LABEL_126;
                    }
                  }
                  v90 = 0;
                  v89 = 5;
LABEL_174:
                  a2 = v351;
                }
                else
                {
                  if (v101 == 1)
                  {
                    v102 = (_BYTE *)(v87 + 9);
                    v103 = objc_retainAutorelease((id)a2);
                    v104 = objc_msgSend(v103, "bytes");
                    if ((_BYTE *)(v104 + objc_msgSend(v103, "length")) != v102)
                    {
                      v89 = *v102;
                      v38 = v348;
                      v88 = v346;
                      v90 = 0;
                      a2 = v351;
                      switch(*v102)
                      {
                        case 1:
                          goto LABEL_176;
                        case 2:
                          v90 = 0;
                          v89 = 2;
                          goto LABEL_176;
                        case 3:
                          v90 = 0;
                          v89 = 3;
                          goto LABEL_176;
                        case 4:
                          v90 = 0;
                          v89 = 4;
                          goto LABEL_176;
                        default:
                          goto LABEL_126;
                      }
                    }
                    v90 = 0;
                    v89 = 0;
                    goto LABEL_174;
                  }
LABEL_126:
                  memset(buf, 0, 48);
                  v134 = objc_msgSend((id)a2, "length");
                  v135 = objc_retainAutorelease((id)a2);
                  v343 = objc_msgSend(v135, "bytes");
                  v136 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                  if ((unint64_t)v136 >= 4)
                    goto LABEL_347;
                  v137 = v136;
                  v138 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v136);
                  if (NFSharedLogInitialize_onceToken != -1)
                    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                  v139 = (id)_NFSharedLogClient[(_QWORD)v137];
                  if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
                  {
                    v140 = objc_msgSend(v135, "length");
                    *(_DWORD *)v365 = 136315906;
                    v366 = "ChipAuthProtocolMapper";
                    v367 = 1024;
                    v368 = 325;
                    v369 = 2082;
                    v370 = "Failed mapping:";
                    v371 = 2048;
                    v372 = v140;
                    _os_log_impl(&dword_1C34DB000, v139, OS_LOG_TYPE_ERROR, "%s:%i %{public}s %lu bytes", v365, 0x26u);
                  }

                  if (v138)
                    v138(4, "%s:%i %s %lu bytes :", "ChipAuthProtocolMapper", 325, "Failed mapping:", objc_msgSend(v135, "length"));
                  if (v134)
                  {
                    v141 = 0;
                    do
                    {
                      v142 = 0;
                      v143 = (char *)&buf[__sprintf_chk((char *)buf, 0, 0x30uLL, "%04lX: ", v141)];
                      do
                      {
                        v144 = v142 + 1;
                        v145 = v142 + 1 + v141;
                        v146 = sprintf(v143, "0x%02X ", *(unsigned __int8 *)(v343 + v141 + v142));
                        if (v142 > 6)
                          break;
                        v143 += v146;
                        ++v142;
                      }
                      while (v145 < v134);
                      v147 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                      if (NFSharedLogInitialize_onceToken != -1)
                        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
                      v148 = (id)_NFSharedLogClient[(_QWORD)v147];
                      if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v365 = 136446210;
                        v366 = (const char *)buf;
                        _os_log_impl(&dword_1C34DB000, v148, OS_LOG_TYPE_ERROR, "%{public}s", v365, 0xCu);
                      }

                      if (v138)
                        v138(4, "%s", (const char *)buf);
                      v141 += v144;
                    }
                    while (v145 < v134);
                  }
                  v89 = -1;
                  v90 = 1;
                  a2 = v351;
                  v11 = v353;
                }
                v38 = v348;
                v88 = v346;
                goto LABEL_176;
              }
            }
LABEL_34:
            ++v12;
          }
          while (v12 != v10);
          v297 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v357, v364, 16);
          v10 = v297;
          if (!v297)
          {
LABEL_325:

            v298 = v349;
            v299 = v347;
            goto LABEL_346;
          }
        }
      }
    }
  }
  memset(buf, 0, 48);
  v300 = objc_msgSend(v4, "length");
  v301 = objc_retainAutorelease(v4);
  obja = (unsigned __int8 *)objc_msgSend(v301, "bytes");
  v302 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)v302 >= 4)
LABEL_347:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  v303 = v302;
  v304 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v302);
  if (NFSharedLogInitialize_onceToken != -1)
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  v305 = (id)_NFSharedLogClient[(_QWORD)v303];
  if (os_log_type_enabled(v305, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v365 = 136315906;
    v366 = "+[SecurityInfo securityInfoArrayFromData:]";
    v367 = 1024;
    v368 = 75;
    v369 = 2082;
    v370 = "Unexpected CardAccess response";
    v371 = 2048;
    v372 = objc_msgSend(v301, "length");
    _os_log_impl(&dword_1C34DB000, v305, OS_LOG_TYPE_DEFAULT, "%s:%i %{public}s %lu bytes", v365, 0x26u);
  }

  if (v304)
    v304(6, "%s:%i %s %lu bytes :", "+[SecurityInfo securityInfoArrayFromData:]", 75, "Unexpected CardAccess response", objc_msgSend(v301, "length"));
  if (v300)
  {
    v306 = 0;
    do
    {
      v307 = 0;
      v308 = (char *)&buf[__sprintf_chk((char *)buf, 0, 0x30uLL, "%04lX: ", v306)];
      do
      {
        v309 = v307 + 1;
        v310 = v307 + 1 + v306;
        v311 = sprintf(v308, "0x%02X ", obja[v306 + v307]);
        if (v307 > 6)
          break;
        v308 += v311;
        ++v307;
      }
      while (v310 < v300);
      v312 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v313 = (id)_NFSharedLogClient[(_QWORD)v312];
      if (os_log_type_enabled(v313, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v365 = 136446210;
        v366 = (const char *)buf;
        _os_log_impl(&dword_1C34DB000, v313, OS_LOG_TYPE_DEFAULT, "%{public}s", v365, 0xCu);
      }

      if (v304)
        v304(6, "%s", (const char *)buf);
      v306 += v309;
    }
    while (v310 < v300);
  }
  v299 = 0;
  v298 = v349;
LABEL_346:

  return v299;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end
